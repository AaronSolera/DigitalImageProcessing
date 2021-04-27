clc; clear; close all

pkg load image;
pkg load signal;

I_ = imread('files/imagen2.jpg');
I = imread('files/imagen3.jpg');
I_ = im2double(I_);
I = im2double(I);
load('files/U1.mat');
load('files/V1.mat');
alfa = 0.1;
N = 4;

function [F A] = DCTMatrix(I, N)
  dimension = size(I)(1);
  F = zeros(size(I));
  for i = 1:(dimension / N)
    for j = 1:(dimension / N)
      F((1:N) + (N * (i - 1)),(1:N) + (N * (j - 1))) = dct2(I((1:N) + (N * (i - 1)),(1:N) + (N * (j - 1))));
      A(i, j) = F(1 + (N * (i - 1)), 1 + (N * (j - 1)));
    endfor
  endfor
endfunction

function [F_] = replaceDCValue(F, A_, N)
  dimension = size(F)(1);
  for i = 1:(dimension / N)
    for j = 1:(dimension / N)
      F(1 + (N * (i - 1)), 1 + (N * (j - 1))) = A_(i, j);
    endfor
  endfor
  F_ = F;
endfunction

function [I_] = InvDCTMatrix(F_, N)
  dimension = size(F_)(1);
  I_ = zeros(size(F_));
  for i = 1:(dimension / N)
    for j = 1:(dimension / N)
      I_((1:N) + (N * (i - 1)),(1:N) + (N * (j - 1))) = idct2(F_((1:N) + (N * (i - 1)),(1:N) + (N * (j - 1))));
    endfor
  endfor
endfunction

%------------------------------------------------------------------------------
%
%   Digital watermark embedding
%
%------------------------------------------------------------------------------
% Step 1
[F A] = DCTMatrix(I, N);
% Step 2
[U S V] = svd(A);

%------------------------------------------------------------------------------
%
%   Extraction scheme 
%
%------------------------------------------------------------------------------
% Step 1
[I_ast, A_ast] = DCTMatrix(I_, N);
% Step 2
[U_ast S1_ast V_ast] = svd(A_ast);
% Step 3
D_ast = U1 * S1_ast * V1';
W_ast = (1 / alfa) * (D_ast - S);

subplot(1,2,1)
imshow(I_)
title('Imagen con ruido y Marca de agua')

subplot(1,2,2)
imshow(W_ast)
title('Marca de Agua Extraída')

pause(20)