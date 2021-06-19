% dominio de la frecuencia

clc; clear; close all
pkg load image

function d = D(m, n, u, v)
  d = sqrt((u-(m/2))^2 + (v-(n/2))^2); 
endfunction 

A = imread('files/edificio_china.jpg');
subplot(2,2,1)
imshow(A)
title('Imagen original')

% Normalizar imagen
A = im2double(A);
[m, n] = size(A);

% Aplicarle la transformada rápida de fourier a la imagen con ruido
Fa = fft2(A);

% Crear la mascara
Hbr = ones(m, n);
D0 = 100;
W = 100;
for u = 1:m
  for v = 1:n
    if and(D0 - W/2 < D(m, n, u, v), D(m, n, u, v) <= D0 + W/2)
      %Hbr(u, v) = 0;
      %Hbr(u, v) = 1 - (1 / (1 + (D(m, n, u, v)/D0)^(2*n)));
      %Hbr(u, v) = 1 - exp(-(D(m, n, u, v)^2)/(2*D0^2));
    endif
  endfor
endfor

subplot(2,2,2)
imshow(Hbr)
title('Mascara')

% Aplicar multiplicacion puntual
Fa = fftshift(Fa);
Fa_ = Fa .* Hbr;
subplot(2,2,3)
imshow(A)
title('Imagen con FFT2D')

% Aplicar transformada rápida inversa de fourier
A_ = ifft2(Fa_);
A_ = im2uint8(abs(A_));

subplot(2,2,4)
imshow(A_)
title('Imagen filtrada')


