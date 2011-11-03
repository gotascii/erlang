-module (git).
-export ([update/1, sha/1]).

update(ProjectPath) ->
  os:cmd("cd " ++ ProjectPath ++
    " && git fetch origin && git reset --hard origin/master").

sha(ProjectPath) ->
  os:cmd("cd " ++ ProjectPath ++
    " && git rev-parse origin/master").

deekz() ->
  spawn(fun() -> shit/0 end).

shit() ->
  io:format("Building!"),
