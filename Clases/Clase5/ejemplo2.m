% Ejemplo de rotación
clc; clear; close all
pkg load image

A = imread('files/barbara.jpg');
A = imresize(A, [128 128]); % Cambiar de tamaño la imagen

[m, n, r] = size(A);


for k = 1:min([m n])
  B = uint8(zeros(m, n ,r)); % Imagen de salida
  deltax = k; deltay = k;

  for x = 1:m
    for y = 1:n
      x_t = x + deltax; % Transformaciones afines 
      y_t = y + deltay; % Transformaciones afines
      if and(x_t <= m, y_t <= n)
        B(x_t, y_t, :) = A (x, y, :);
      endif
    endfor
  endfor

  subplot(1,2,1)
  imshow(A)
  subplot(1,2,2)
  imshow(B)
  pause(0.001)
  
endfor
