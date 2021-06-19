clc; clear; close all

pkg load image

A = imread('files/imagen11.jpg');
subplot(1,2,1)
imshow(A)
title('Imagen Original')
[m, n] = size(A);

% Tarea: Analizar de bordes
% Paso 1: Calcular Erosión: A -o- B

C = uint8(zeros(m, n));
C(1, :) = A(1, :); C(m, :) = A(m, :);
C(:, 1) = A(:, 1); C(:, n) = A(:, n);

for x = 2:m-1
  for y = 2:n-1
    Aux = A(x - 1 : x + 1, y - 1 : y + 1);
    C(x, y) = min(min(Aux)); % C(x, y) = min(Aux(:));
  endfor
endfor

% Paso 2: Calcular Dilatacion: A + B

D = uint8(zeros(m, n));
D(1, :) = C(1, :); D(m, :) = C(m, :);
D(:, 1) = C(:, 1); D(:, n) = C(:, n);

for x = 2:m-1
  for y = 2:n-1
    Aux = C(x - 1 : x + 1, y - 1 : y + 1);
    D(x, y) = max(max(Aux)); % D(x, y) = max(Aux(:));
  endfor
endfor

%Paso 3: Resta E = A - D
E = A - D;
subplot(1,2,2)
imshow(A + E)
title('Top-Hat')