clc; clear; close all
pkg load image

A = imread('files/edificio_china.jpg');
subplot(2,3,1)
imshow(A)
title('Imagen Original')

% Crear un ruido aditivo
A = im2double(A);
[m, n] = size(A);
N = 0.2 * randn(m, n);
B = A + N; % La imagen con ruido , con valores double normalizados
B1 = im2uint8(B);

subplot(2,3,2)
imshow(B1)
title('Imagen con Ruido')

% Filtro Armónico
% Tarea: Implementar bordes y esquinas

At = zeros(m, n);
for x = 1 : m
  for y = 1 : n
    % Pixel a modificar: B(X, Y)
    W = 0;
    for i = -1 : 1
      for j = -1 : 1
        nx = x + i;
        ny = y + j;
        if (nx > 0 && nx <= m) && (ny > 0 && ny <= n)
          W += B(nx, ny) ^ (-1);
        endif
      endfor
    endfor
    At(x, y) = 9 / W;
  endfor
endfor

error = norm(B - At,'fro');
At = im2uint8(At);
subplot(2,3,3)
imshow(At)
title('Imagen con Filtro Armónico')
printf('Error del Filtro Armónico %f\n', error);

% Filtro Contra-armónico promedio de orden R
% Tarea: Implementar bordes y esquinas

R = 5;
At1 = zeros(m, n);
for x = 1 : m
  for y = 1 : n
    % Pixel a modificar: B(X, Y)
    W1 = 0;
    W2 = 0;
    for i = -1 : 1
      for j = -1 : 1
        nx = x + i;
        ny = y + j;
        if (nx > 0 && nx <= m) && (ny > 0 && ny <= n)
          W1 += B(nx, ny)^ (R + 1);
          W2 += B(nx, ny)^ R;
        endif
      endfor
    endfor
    At1(x, y) = W1 / W2;
  endfor
endfor

error = norm(B - At1,'fro');
At1 = im2uint8(At1);
subplot(2,3,4)
imshow(At1)
title('Imagen con Filtro Contra-armónico promedio de orden R')
printf('Error del Filtro Contra-armónico promedio de orden R %f\n', error);

% Filtro del Punto Medio
% Tarea: Implementar bordes y esquinas

At2 = zeros(m, n);
for x = 1 : m
  for y = 1 : n
    % Pixel a modificar: B(X, Y)
    W = [];
    for i = -1 : 1
      for j = -1 : 1
        nx = x + i;
        ny = y + j;
        if (nx > 0 && nx <= m) && (ny > 0 && ny <= n)
          W(end + 1) = B(nx, ny);
        endif
      endfor
    endfor
    At2(x, y) = (max(W) + min(W)) / 2;
  endfor
endfor

error = norm(B - At2,'fro');
At2 = im2uint8(At2);
subplot(2,3,5)
imshow(At2)
title('Imagen con Filtro del Punto Medio')
printf('Error del Filtro del Punto Medio %f\n', error);