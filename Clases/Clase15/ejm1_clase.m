clc; clear; close all

pkg load image

A = imread('files/linea1.jpg');

% Convertirla a Binaria
B = im2double(A);
B(B < 0.5) = 0; B(B >= 0.5) = 1;
imshow(B);

% Calsular la discretizacion angulo y p
h1 = 1; % Paso entre los angulos
angulos = deg2rad(0:h1:180);
[m, n] = size(B);
d = sqrt(m^2 + n^2);
h2 = 1; % Paso entre los p
ps = -d:h2:d;

% Crear la matriz de acumulacion
m1 = length(angulos); n1 = length(ps);
Acumulador = zeros(m1, n1);

[x_b, y_b] = find(B); % Pares ordenados donde se detectan bordes

for i = 1:length(x_b)
  for ang_ind = 1:length(angulos)
    ang = angulos(ang_ind);
    p = x_b(i) * cos(ang) + y_b(i) * sin(ang);
    [~,p_ind] = min(abs(ps-p));
    Acumulador(ang_ind, p_ind) += 1;
  endfor
endfor

% Mostrar graficamente el comportamiento del acumulador
% figure
% surface(angulos, ps, Acumulador', 'EdgeColor', 'none')
% xlabel('p')
% ylabel('angulos')

% Encontrar la posición donde el Acumulador alcanza el máximo
maxA = max(max(Acumulador));
[xp, yp] = find(Acumulador == maxA);

% Graficar la linea rectangle
angMax = angulos(xp);
pMax = ps(yp);

pendiente = -cos(angMax) / sin(angMax);
interseccion = pMax / sin(angMax);

% Nota: Para graficar una linea recta en Octave, utilizaremos el comando line
% Punto 1 = (1,y1)
y1 = pendiente * 1 + interseccion;
% Punto 2 = (xn,n)
xn = (n - interseccion) / pendiente;

% Graficar la linea recta
line([y1 n], [1 xn], 'LineWidth', 2)

 