-module(n_prime).

-compile(export_all).

% Problem 7

% By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see that the 6th prime is 13.

% What is the 10 001st prime number?

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

on_prime(_Count, Prime, _Check, _L, _LC) ->
    Prime.

find_prime(Count, Check, _Prime, [H | Primes]) when Count < Check ->
    Count2 = Count + 1,
    find_prime(Count2, Check, H, Primes);

find_prime(_Count, _Check, Prime, _Primes) ->
    Prime.

n_prime(N) ->
    Count = 2,
    Prime = 3,
    n_prime(Count, Prime, N).

n_prime(Count, Prime, Check) when Count < Check ->
    Prime2 = Prime + 2,
    case is_prime(Prime2) of
        true ->
            Count2 = Count + 1,
            n_prime(Count2, Prime2, Check);
        false ->
            n_prime(Count, Prime2, Check)
    end;

n_prime(_Count, Prime, _Check) ->
    Prime.


