-module(list).
-export([length/1]).

length([]) -> 0;
length(Head|Tail) -> 1 + length(Tail).