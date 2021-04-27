clc; clear; close all
pkg load image

A = imread('files/sydney.jpg');
[m, n] = size(A);
subplot(2, 2, 1)
imshow(A)
title('Imagen Original')

% Calcular el histograma
h2 = zeros(256, 1); % h2 = [h(0) h(1) ... h(255)]

for i = 0:255
    h2(i+1) = sum(sum(A==i));
endfor

subplot(2, 2, 2)
bar(0:255, h2)
title('Histograma original')
xlim([0 255])

% Método de estiramiento
B = zeros(m, n); A = double(A);
rmax = max(max(A));
rmin = min(min(A));
for x = 1:m
  for y = 1:n
    B(x, y) = (255 / (rmax - rmin)) * (A(x, y) - rmin);
  endfor
endfor

B = uint8(B);
subplot(2,2,3)
imshow(B)
title('Imagen con el estiramiento')

% Calcular el histograma
h3 = zeros(256, 1); % h3 = [h(0) h(1) ... h(255)]

for i = 0:255
    h3(i+1) = sum(sum(B==i));
endfor

subplot(2, 2, 4)
bar(0:255, h3)
title('Histograma de la imagen con estiramiento')
xlim([0 255])