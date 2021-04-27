clc; clear; close all

function [Ar] = svd_red_bi(A, r, p)
  % Step 1
  n = size(A, 2);
  Y2 = randn(n, r);
  % Step 2
  for k = 1 : p
    Y1 = A * Y2;
    Y2 = A' * Y1;
  endfor
  % Step 3
  [Q, ~] = qr(Y2); 
  % Step 4
  Qr = Q (:, 1:r);
  % Step 5
  B = A * Qr;
  C = Qr';
  Ar = B * C;
endfunction

function [A_c0] = Pc0(A_, c0)
  A_c0 = zeros(size(A_));
  A_temp = A_(:);
  [_, ind] = sort(abs(A_temp), 'descend');
  A_c0(ind(1:c0)) = A_(ind(1:c0));
endfunction

function [L, S, error] = godec_fast(A, k, c0, epsilon)
  L = A; S = zeros(size(A)); t = 0; error = 0;
  do
    prev_error = error;
    t = t + 1;
    L = svd_red_bi(A - S, k, 3);
    S = Pc0(A - L, c0);
    error = norm(A - L - S, 'fro')**2 / norm(A, 'fro')**2;
  until abs(error - prev_error) < epsilon
endfunction

A = [19 10 8 11; -15 7 4 -13; -5 -8 17 2; 21 11 -6 23; 22 -12 9 1]

[L, S, error] = godec_fast(A, 2, 8, 0.0001)

