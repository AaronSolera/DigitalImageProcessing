clc; clear; close all

pkg load image

A = imread('files/lena.jpg');
[m n _] = size(A)

subplot(1,2,1)
imshow(A)
title('Imagen Lena')

A = im2double(A);
F = cell(m, n);
Fout = zeros(m, n);

function F_ = T(A, x, y)
  Ar = A(x,y,1); Ag = A(x,y,2); Ab = A(x,y,3);
  F_ = [0  -Ar -Ag -Ab
        Ar  0  -Ab  Ag
        Ag  Ab  0  -Ar
        Ab -Ag  Ar  0];
endfunction

function E_ = E(J, p, q, r)
  angle = 2 * pi * ((p * q) / r);
  E_ = eye(4) * cos(angle) - J * sin(angle);
endfunction

V3 = sqrt(3)
J = [0   1  1  -V3;
     1   0  V3 -1;
     1  -V3 0   1;
     V3 -1  1   0];

time = 0;
     
for u = 1:m
  tic
  for v = 1:n
    Ft = zeros(4);
    for r = 0:m-1
      for s = 0:n-1
        Ft += (1 / sqrt(m * n)) * E(J, r, u, m) * T(A, r + 1, s + 1) * E(J, s, v, n);
      endfor
    endfor
    F(u, v) = Ft;
    Fout(u, v) = norm(Ft, 'fro');
  endfor
  time += toc;
  display(["Processing time left: " num2str((time / u) * (m - u) / 60) " minutes"])
endfor

subplot(1,2,2)
imshow(log(1 + fftshift(Fout)))
title('Frecuencia/Espectro de la Imagen Lena')