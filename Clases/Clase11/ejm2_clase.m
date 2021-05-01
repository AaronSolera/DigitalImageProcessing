% Ejemplo 
clc; clear; close all

pkg load image

A = imread('files/edificio_china.jpg');
subplot(2, 2, 1)
imshow(A)
title('Imagen Original')

% Calculo de la DFT-2D

A = im2double(A);
F_A = fft2(A);
subplot(2, 2, 2)
imshow(log(1+abs(F_A)),[])
title('DFT-2D')

% Aplicar ffshift a la matriz resultante
% Calculo del Mascara del Filtro

[m, n] = size(A);
D = zeros(m, n);
for u = 1:m
  for v = 1:n
    D(u, v) = sqrt(u^2 + v^2);
  endfor
endfor

D0 = 100;
F_B = fftshift(D <= D0);
F_C = F_A .* F_B; % Teoria de convolucion
subplot(2, 2, 3)
imshow(log(1+abs(F_C)),[])
title('DFT-2D (Shift)')

F_shift = fftshift(F_C);

% Calcular la inversa

A_t = ifft2(F_shift);
A_t = im2uint8(real(A_t));
subplot(2, 2, 4)
imshow(A_t)
title('Imagen Reconstruida')
