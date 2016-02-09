-module(even_fibos).

-compile(export_all).

fibonacci(N) ->
    fibonacci((N-2), 1, 2, [2, 1]).

fibonacci(0, _F1, _F2, Acc) ->
    lists:reverse(Acc);

fibonacci(N, F1, F2, Acc) ->
    N2 = N - 1,
    F = F1 + F2,
    fibonacci(N2, F2, F, [F | Acc]).

fibonacci2(X) ->
    fibonacci2(X, 1, 2, [2, 1]).

fibonacci2(X, F1, F2, Acc) when F2 < X ->
    F = F1 + F2,
    fibonacci2(X, F2, F, [F | Acc]);

fibonacci2(_X, _F1, _F2, Acc) ->
    lists:reverse(tl(Acc)).

sum_of_even(N) ->
    lists:sum([X || X <- fibonacci2(N), X rem 2 =:= 0]).
