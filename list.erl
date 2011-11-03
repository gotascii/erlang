-module(list).
-export([len/1, rev/1]).
-export([channels/0, alloc/1]).

len([]) -> 0;
len([_|Tail]) -> 1 + len(Tail).

rev(List) -> rev(List, []).
rev([], RevList) -> RevList;
rev([Head|Tail], RevList) -> rev(Tail, [Head|RevList]).

channels() -> {[], lists:seq(1,100)}.
alloc({Allocated, [H|T]}) -> {H, {[H|Allocated], T}}.