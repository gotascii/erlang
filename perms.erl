-module(perms).
-export([a/1, b/1]).

a([]) -> [[]];
a(L) -> [[H|T] || H <- L, T <- a(L -- [H])].

a("cat")
  [[H|T] || H <- "cat", T <- ...].
a("at")
  [[H|T] || H <- "at", T <- ...].
  % H == "a"
  % L -- [H] == "t"
  % result ["a" | "t"]
  % H == "t"
  % L -- [H] == "a"
  % result   ["t" | "a"]
a("t")
  [[H|T] || H <- "t", T <- a([])].