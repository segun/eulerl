-module(multiples_of_3_and_5).

-compile(export_all).

multiples(N) ->
    lists:sum([X || X <- lists:seq(1,(N-1)), (X rem 3 =:= 0) or (X rem 5 =:= 0)]).

my_multiples(N) ->
    my_multiples((N - 1), []).

my_multiples(0, Acc) ->
    %lists:sum(Acc)
    my_sum(Acc);

my_multiples(N, Acc) ->
    N2 = N - 1,
    case N rem 3 of
        0 ->
            my_multiples(N2, [N | Acc]);
        _ ->
            case N rem 5 of
                0 ->
                    my_multiples(N2, [N | Acc]);
                _ ->
                    my_multiples(N2, Acc)
            end
    end.

my_sum(L) ->
    my_sum(L, 0).

my_sum([], Acc) ->
    Acc;

my_sum([H | T], Acc) ->
    Acc2 = Acc + H,
    my_sum(T, Acc2).
