clc; clear; close all

pkg load image;
pkg load signal;

I = imread('files/imagen1.jpg');
W = imread('files/marca.jpg');
I = im2double(I);
W = im2double(W);
N = 8;

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
% Step 1: This gets the matrix A with (1,1) discrete cosine values. The F matrix has the (64x64) matrixes of (8x8) discrete cosine values.
[F A] = DCTMatrix(I, N);
% Step 2: Get the singular value descomposition of A
[U S V] = svd(A);
% Step 3: This part makes the necessary math for getting A* (creo que aquí está mi error)
alfa = 0.1;
A_ = S + (alfa * W);
[U1, S1, V1] = svd(A_);
A_ = U * S1 * V';
% Step 4: Replace all (1,1) elements in (64x64) matrixes of (8x8) DC values.
F_ = replaceDCValue(F, A_, N);
% Step 5: This gives the watermarked image appliying discrete cosine transform to all 8x8 matrixes
I_ = InvDCTMatrix(F_, N);

subplot(2,2,1)
imshow(I)
title('Imagen Original')

subplot(2,2,2)
imshow(W)
title('Marca de Agua')

subplot(2,2,3)
imshow(I_)
title('Imagen con Marca de Agua')

%------------------------------------------------------------------------------
%
%   Extraction scheme 
%
%------------------------------------------------------------------------------
% Step 1
[I_ast A_ast] = DCTMatrix(I_, N);
% Step 2
[U_ast S1_ast V_ast] = svd(A_ast);
% Step 3
D_ast = U1 * S1_ast * V1';
W_ast = (1 / alfa) * (D_ast - S);

subplot(2,2,4)
imshow(W_ast)
title('Marca de Agua Extraída')