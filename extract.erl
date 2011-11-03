-module(extract).
-export([attribute/2]).
-dang("yo").
-author({"justin", "marney"}).

% extract:attribute("yr.beam", attrName)
attribute(Beam, Attr) ->
  case beam_lib:chunks(Beam, [attributes]) of
    {ok,{_,[{attributes,Attrs}]}} -> search(Attr, Attrs);
    _ -> exit(badFile)
  end.

search(Attr, [{Attr, Val}|_]) -> Val;
search(Attr, [_|T]) -> search(Attr, T);
search(_, _) -> exit(badAttribute).