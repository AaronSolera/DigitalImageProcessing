clc; clear;

% Ejemplo de Convolución en 2D
A = [1 0 1; 4 3 1; -1 0 2; 3 0 -7]
B = [1 -1 2 3; -4 0 1 5; 3 2 -1 0]

[m1, n1] = size(A); [m2, n2] = size(B);
C1 = zeros(m1 + m2 -1, n1 + n2 - 1);

% Calculo de la convolución a mano
tic
for j = 1 : m1 + m2 -1 % Recorre cada entrada de C
  for k = 1 : n1 + n2 - 1 
    S1 = (max([1 (j - m2 + 1)]) : min(j, m1));
    S2 = (max([1 (k - n2 + 1)]) : min(k, n1));
    for p = S1 % Realiza la suma con los elementos de S1
      for q  = S2 % Realiza la suma con los elementos de S2
        C1(j, k) += A(p, q) * B(j - p + 1, k - q + 1);
      endfor
    endfor
  endfor
endfor
t1 = toc;

% Calculo de la convolución usando la implementación de Octave
tic
C2 = conv2(A, B);
t2 = toc;

C1
C2
t1
t2