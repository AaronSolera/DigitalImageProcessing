clc; clear; close all
pkg load image

A = imread('files/edificio_china.jpg');
subplot(2,2,1)
imshow(A)
title('Imagen Original')

% Crear un ruido aditivo
A = im2double(A);
[m, n] = size(A);
N = 0.2 * randn(m, n);
B = A + N; % La imagen con ruido , con valores double normalizados
B1 = im2uint8(B);

subplot(2,2,2)
imshow(B1)
title('Imagen con Ruido')

% Filtro Promedio
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
          W += B(nx, ny);
        endif
      endfor
    endfor
    A_t(x, y) = (1/9) * W;
  endfor
endfor

A_t = im2uint8(A_t);
subplot(2,2,3)
imshow(A_t)
title('Imagen Filtrada')


% Filtro Promedio Geométrico
% Tarea: Implementar bordes y esquinas

At1 = zeros(m, n);
for x = 1 : m
  for y = 1 : n
    % Pixel a modificar: B(X, Y)
    W = 0;
    for i = -1 : 1
      for j = -1 : 1
        nx = x + i;
        ny = y + j;
        if (nx > 0 && nx <= m) && (ny > 0 && ny <= n)
          W *= B(nx, ny);
        endif
      endfor
    endfor
    At1(x, y) = W ^ (1/9);
  endfor
endfor

At1 = im2uint8(real(At1));
subplot(2,2,4)
imshow(At1)
title('Imagen Filtrada (Promedio Geométrico)')