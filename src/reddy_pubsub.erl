-module(reddy_pubsub).

-include("reddy_ops.hrl").

-export([publish/3,
         publish_/4]).

publish(Conn, Channel, Message) when is_pid(Conn) ->
    reddy_conn:sync(Conn, ?PUBLISH, [Channel, Message]);
publish(Pool, Channel, Message) ->
    ?WITH_POOL(Pool, publish, [Channel, Message]).

publish_(Conn, Channel, Message, WantsReturn) when is_pid(Conn) ->
    reddy_conn:async(Conn, ?PUBLISH, [Channel, Message], WantsReturn).
