-module(sum_square_difference).

-compile(export_all).

%The sum of the squares of the first ten natural numbers is,

%1^2 + 2^2 + ... + 10^2 = 385
%The square of the sum of the first ten natural numbers is,

%(1 + 2 + ... + 10)^2 = 552 = 3025
%Hence the difference between the sum of the squares of the first ten natural numbers and the square of the sum is 3025 − 385 = 2640.

%Find the difference between the sum of the squares of the first one hundred natural numbers and the square of the sum.

% manually
sum_of_squares(N) ->
    sum_of_squares(N, 0).

sum_of_squares(0, Acc) ->
    Acc;

sum_of_squares(N, Acc) ->
    N2 = N - 1,
    Acc2 = Acc + (N * N),
    sum_of_squares(N2, Acc2).

%manually
square_of_sums(N) ->
    square_of_sums(N, 0).

square_of_sums(0, Acc) ->
    Acc * Acc;

square_of_sums(N, Acc) ->
    N2 = N - 1,
    Acc2 = Acc + N,
    square_of_sums(N2, Acc2).

difference(N) ->
    square_of_sums(N) - sum_of_squares(N).


% using maths formula
sum_of_squares_f(N) ->
    round(((N * N * N)/3 + (N * N)/2 + (N/6))).

% using maths formula
square_of_sums_f(N) ->
    %sum of N
    Sum = round((N * (N + 1))/2),
    Sum * Sum.

difference_f(N) ->
    square_of_sums_f(N) - sum_of_squares_f(N).

