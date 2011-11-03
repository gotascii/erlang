-module (records).
-export ([snack/0]).
-record(handler_context, {
	name,
	module,
	config,
	state
}).

snack() ->
  #handler_context{}.