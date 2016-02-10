% 2520 is the smallest number that can be divided by each of the numbers from 1 to 10 without any remainder.
% What is the smallest positive number that is evenly divisible by all of the numbers from 1 to 20?

-module(smallest_multiple).
-compile(export_all).

smallest_multiple(N) ->
    % Multiply N by N - 1, N - 2 until you get to a prime number (e.g 10 * 9 * 8 * 7) and find the factors.
    {LastPrime, Multiple} = multiply_until_prime(N, N - 1, N),
    Factors = largest_prime_factor:factors_of(Multiple),
    % For each of the factors, find if there's a smallest multiple.
    % If not multiply again until next prime number  and find the factors. repeat until smallest multiple found.
    smallest_multiple(N, Factors, Multiple, LastPrime).

smallest_multiple(N, Factors, Multiple, LastPrime) ->
    io:format("~p~n", [{N, Multiple, LastPrime}]),
    case find_smallest(N, N, Factors) of
        -1 ->
            {LastPrime2, Multiple2} = multiply_until_prime(N, LastPrime - 1, Multiple),
            Factors2 = largest_prime_factor:factors_of(Multiple2),
            smallest_multiple(N, Factors2, Multiple2, LastPrime2);
        X ->
            X
    end.

find_smallest(_N, 0, [H | _T]) ->
    H;

find_smallest(_N, _C, []) ->
    -1;

find_smallest(N, Count, [H | Factors]) ->
    case  H rem Count of 
        0 ->
            find_smallest(N, Count - 1, [H | Factors]);
        _ ->
            find_smallest(N, N, Factors)
    end.

multiply_until_prime(_N, 1, Acc) ->
    {1, Acc};

multiply_until_prime(N, Start, Acc) ->
    case largest_prime_factor:is_prime(Start) of
        true ->
            {Start, Acc * Start};
        false ->
            multiply_until_prime(N, Start - 1, Acc * Start)
    end.
