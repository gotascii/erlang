-module(ch1).
-export([start/0]).
-export([alloc/0, free/1]).
-export([init/0]).
-export([channels/0, alloc/1, free/2]).

% starts the server process named "ch1"
start() ->
    spawn(ch1, init, []).

% should only be called through start
% registers ch1, assigns channels(), starts receive loop
init() ->
    register(ch1, self()),
    Chs = channels(),
    loop(Chs).

% client alloc interface
% sends ch1 a callback pid and the message alloc
% then waits for a result from ch1
alloc() ->
    ch1 ! {self(), alloc},
    receive
        {ch1, Res} ->
            Res
    end.

% handles client messages
% {callback pid, alloc}
%   allocates new channel
%   sends newly allocated channel to callback pid
%   starts loop with new channel tuple
loop(Chs) ->
    receive
        {From, alloc} ->
            {Ch, Chs2} = alloc(Chs),
            From ! {ch1, Ch},
            loop(Chs2);
        {free, Ch} ->
            Chs2 = free(Ch, Chs),
            loop(Chs2)
    end.

% tuple of {allocated channels, available channels}
channels() ->
    {_Allocated = [], _Free = lists:seq(1,100)}.

% returns a tuple of {newly allocated channel, new channels tuple}
alloc(_Channels = {Allocated, Free}) ->
    Free = [Channel|NewFree]
    NewAllocated = [Channel|Allocated]
    {Channel, {NewAllocated, NewFree}}.
