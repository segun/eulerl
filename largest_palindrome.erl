-module(largest_palindrome).

-compile(export_all).

is_palindrome(L) ->
    L =:= lists:reverse(L).

%% N is the number of digits as per the question
%% Find the largest palindrome made from the product of two 3-digit numbers.

larget_palindrome(N) ->
    S1 = round(math:pow(10, (N-1))),
    L1 = round(math:pow(10, N) - 1),
    LargestNumber = L1 * L1,
    SmallestNumber = S1 * L1,
    find_palindrome(N, LargestNumber, SmallestNumber).


find_palindrome(N, Ln, Sn) when Ln > Sn ->
    case is_palindrome(integer_to_list(Ln)) of
        false ->
            find_palindrome(N, Ln - 1, Sn);
        true ->
           Factors = largest_prime_factor:factors_of(Ln),
           XDigitsFactors = find_X_digits_factors(N, Factors, []),
           case XDigitsFactors of
               %%%% has at least 2 numbers in the list.
               [_H | [_H1 | _T]] ->
                   %% Take the 2 largest numbers.
                   Max = lists:max(XDigitsFactors),
                   Min = lists:max(lists:delete(Max, XDigitsFactors)),
                   case Max * Min of
                       Ln ->
                           {Max, Min, Ln};
                       _ ->
                           find_palindrome(N, Ln - 1, Sn)
                    end;
               _ ->
                   find_palindrome(N, Ln - 1, Sn)
            end
    end;

find_palindrome(_N, _L, _S) ->
    -1.


find_X_digits_factors(N, [H | T], Acc)  ->
    case string:len(integer_to_list(H)) of
        N ->
            find_X_digits_factors(N, T, [H | Acc]);
        _ ->
            find_X_digits_factors(N, T, Acc)
    end;

find_X_digits_factors(_N, [], Acc) ->
    Acc.
