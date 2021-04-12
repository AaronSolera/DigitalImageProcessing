clc; clear; close all

function [Ar] = svd_red(A, r)
  [U, S, V] = svd(A);
  Ur = U(:, 1:r);
  Vr = V(:, 1:r);
  Sr = S(1:r, 1:r);
  Ar = Ur * Sr * Vr';
endfunction

function [A_c0] = Pc0(A_, c0)
  A_c0 = zeros(size(A_));
  A_temp = A_(:);
  [_, ind] = sort(abs(A_temp), 'descend');
  A_c0(ind(1:c0)) = A_(ind(1:c0));
endfunction

function [L, S, error] = godec(A, k, c0, epsilon)
  L = A; S = zeros(size(A)); t = 0; error = 0;
  do
    prev_error = error;
    t = t + 1;
    L = svd_red(A - S, k);
    S = Pc0(A - L, c0);
    error = norm(A - L - S, 'fro')**2 / norm(A, 'fro')**2;
  until abs(error - prev_error) < epsilon
endfunction

A = [19 10 8 11; -15 7 4 -13; -5 -8 17 2; 21 11 -6 23; 22 -12 9 1]

[L, S, error] = godec(A, 2, 8, 0.0001)

