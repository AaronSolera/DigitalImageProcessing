clc; clear; close all

pkg load image

function Y = binaria(X)
  Y = zeros(size(X));
  ind_blanco = (X >= 0.5);
  ind_negro = (X < 0.5);
  Y(ind_blanco) = 1;
  Y(ind_negro) = 0;
endfunction

A = imread('files/imagen9.jpg');
subplot(1,2,1)
imshow(A)
title('Imagen Original')

A = imresize(A, 0.5);
A = binaria(im2double(A));
B = strel('diamond', 1);

k_max = 50;

kB = A;
A_o_kB = imerode(A, kB);
S = A_o_kB - imopen(A_o_kB, B);

for k = 2:k_max
  kB = imerode(kB, B);
  A_o_kB = imerode(A, kB);
  S = S | (A_o_kB & ~imopen(A_o_kB, B));
  subplot(1,2,2)
  imshow(S)
  title('Esqueleto de la imagen')
  pause(0.1);
endfor
