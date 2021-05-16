clc; clear; close all
pkg load image

% Cargar la imagen
file = input("\nWrite the image path (press enter to default image):\n\n>", "s");

if strncmp (file, '', 3)
    file = 'files/edificio_china.jpg';
endif

A = imread(file);
subplot(1,3,1)
imshow(A)
title('Imagen Original')

% Crear un ruido aditivo
A = im2double(A);
[m, n] = size(A);
N = 0.2 * randn(m, n);
B = A + N; % La imagen con ruido , con valores double normalizados
B1 = im2uint8(B);

subplot(1,3,2)
imshow(B1)
title('Imagen con Ruido')

% Filtro del Punto Medio

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
subplot(1,3,3)
imshow(At2)
title('Imagen con Filtro del Punto Medio')
printf('Error del Filtro del Punto Medio %f\n', error);
