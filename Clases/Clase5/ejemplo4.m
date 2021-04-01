% Ejemplo de rotación
clc; clear; close all
pkg load image

A = imread('files/barbara.jpg');
A = imresize(A, [128 128]); % Cambiar de tamaño la imagen

[m, n, r] = size(A);

theta = pi/4;

s = round(sqrt(m**2 + n**2));
xc = floor(m / 2);
yc = floor(n / 2);
B = uint8(zeros(s, s, r));

for x = 1:m
  for y = 1:n
    a0 = cos(theta);
    a1 = sin(theta);
    a2 = xc - a0 * xc - a1 * yc;
    xt = round(a0 * x + a1 * y + a2 + ((s-n) / 2)); % Round permite que la posición sea entera
    b0 = -sin(theta);
    b1 = cos(theta);
    b2 = yc - b0 * xc - b1 * yc;
    yt = round(b0 * x + b1 * y + b2 + ((s-m) / 2)); % Round permite que la posición sea entera
    if xt > 0 && yt > 0
%      if xt <= m && yt <= n
        B(xt, yt, :) = A(x, y, :);
%      endif
    endif
  endfor
endfor

subplot(1,2,1)
imshow(A)
subplot(1,2,2)
imshow(B)

% NOTA: Falta rellenar los puntos negros que ocurren por el redondeo de xt y yt. Para eso se
% utiliza un filtro que se espera ver para la tarea 1.
