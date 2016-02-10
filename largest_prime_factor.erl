-module(largest_prime_factor).

-compile(export_all).

is_prime(N) ->
    is_prime(N, 2).

is_prime(2, _) ->
    true;

is_prime(1, _) ->
    false;

is_prime(N, X) when (X * X) =< N ->
    case N rem X =:= 0 of
        true ->
            false;
        false ->
            is_prime(N, (X + 1))
    end;


is_prime(N, X) when (X * X) > N ->
    N rem X =/= 0.

%% To find factor of a number (N), Take A min number (2) and a Max Number (N)
%% If the number is divisible by 2, then 2 and the result fo N div 2 are factors.
%% Result of N div 2 is the New Max, New Min is now 3.
%% Repeat until Min == Max.
%% To make the algorithm more efficient, once a prime is found stop.

factors_of(N) ->
    Min = 2,
    Max = N,
    factors_of(N, Min, Max, [1, Max]).


factors_of(N, Min, Max, Acc) when Min < Max ->
    %io:format("Min: ~p, Max: ~p, Acc: ~p~n", [Min, Max, Acc]),
    case N rem Min =:= 0 of
        true ->
            IsPrime = N div Min,
            case is_prime(IsPrime) of
                true ->
                    lists:sort([Min | [IsPrime | Acc]]);
                false ->
                    NewMin = Min + 1,
                    NewMax = N div Min,
                    factors_of(N, NewMin, NewMax, [Min | [NewMax | Acc]])
            end;
        false ->
            NewMin = Min + 1,
            factors_of(N, NewMin, Max, Acc)
    end;

factors_of(_N, _Min, _Max, Acc) ->
    lists:sort(Acc).

prime_factors_of(N) ->
    [X || X <- factors_of(N), is_prime(X)].
