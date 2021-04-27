clc; clear;

% Ejemplo de Convolución en 1D
x = rand(500, 1); y = rand(150, 1);
y = [5 6 7 8 9 10 11];

m = length(x); n = length(y);
z1 = zeros(1, m + n - 1);

% Calculo de la convolución a mano
tic
for i = 1 : m + n - 1 % Recorre cada entrada de z
  v_ini = max([1 (i + 1 - n)]);
  v_fin = min(i, m);
  for j = v_ini : v_fin % Realiza la suma
    z1(i) += x(j) * y(i - j + 1);
  endfor
endfor
t1 = toc

% Calculo de la convolución usando la implementación de Octave
tic
z2 = conv(x, y);
t2 = toc

norm(z1 - z2')