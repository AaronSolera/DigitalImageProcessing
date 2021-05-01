clc; clear; close all

m = 20; n = 30;
A = rand(m, n); % Genera una matriz aleatoria con valores en [0, 1]
subplot(1, 3, 1)
imshow(A)
title('Dominio Espacial')

% Implementación de la DFT-2D, usando la fórmula

F1 = zeros(m, n);
tic
for u = 1:m % Recorrer filas
  for v = 1:n % Recorrer columnas
    % Calcular la doble suma
    for x = 0:m-1
      for y = 0:n-1
        F1(u,v) += A(x+1, y+1) * exp(-1i*2*pi*(u*x/m+v*y/n));
      endfor
    endfor
  endfor
endfor
t1=toc

subplot(1, 3, 2)
imshow(abs(F1))
title('Dominio de la frecuencia (M1)')

% Usando el comando fft2
tic
Aux1 = fft2(A);
t2=toc

% Para obtener el mismo resultado de la formula original
% 1. Hay que reordenar las finas de Aux1, de la última a la primera
% 2. Calcular el conjunto de cada filas
% 3. Hacer un flip en cada fila
F2 = [];
for j = 1:m
  F2(j, :) = flip(Aux1(m-j+1, :)');
endfor

subplot(1, 3, 3)
imshow(abs(F2))
title('Dominio de la frecuencia (M2)')