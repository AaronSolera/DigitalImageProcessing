% Ejemplo 1 del Método JPEG
clc; clear; close all
pkg load signal

%%%%%%%%%% Parte1: Compresion %%%%%%%%%%

% Matriz de tamano 8x8
A=[154 123 123 123 123 123 123 136; 
   192 180 136 154 154 154 136 110; 
   254 198 154 154 180 154 123 123; 
   239 180 136 180 180 166 123 123; 
   180 154 136 167 166 149 136 136; 
   128 136 123 136 154 180 198 154; 
   123 105 110 149 136 136 180 166; 
   110 136 123 123 123 136 154 136];

% Paso 1: Restar 128 a cada entrada
M = A - 128;

% Paso 2: Calcular la DCT-2D
D = dct2(M);

% Paso 3: Obtener la matriz cuantificada
% Matriz de Cuantificacion
Q = cuantificacion(50);
% Matriz Cuantificada
C = round(D ./ Q);

% Paso 4: Codificar la matriz C en un vector x
x = mat2vect_diag(C);

%%%%%%%%%% Parte2: Reconstruccion %%%%%%%%%%

% Paso 1: Convertir vector x en matriz 8x8
Cr = vect2mat_diag(x);

% Paso 2: Multiplicar puntualmente Cr y Q
M = Cr .* Q;

% Paso 3: Calcular la inversa de DCT-2D a M
P = idct2(M);

% Paso 4: Redondear P y sumar 128 a cada entrada
M = round(P) + 128;



