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

% Filtro Promedio Armónico

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
subplot(1,3,3)
imshow(At)
title('Imagen con Filtro Promedio Armónico')
printf('Error del Filtro Promedio Armónico %f\n', error);