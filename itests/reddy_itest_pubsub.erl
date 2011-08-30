-module(reddy_itest_pubsub).

-define(TEST_CHAN1, <<"reddy_pub1">>).
-define(TEST_CHAN2, <<"reddy_pub2">>).

-include_lib("eunit/include/eunit.hrl").
-include("reddy_itests.hrl").

publish_key_test() ->
    {ok, C} = ?CONNECT(),
    ?assertMatch(0, reddy_pubsub:publish(C, ?TEST_CHAN1, <<"test">>)),
    ?assertMatch(ok, reddy_pubsub:publish_(C, ?TEST_CHAN2, <<"test">>, false)),
    reddy_conn:close(C).
