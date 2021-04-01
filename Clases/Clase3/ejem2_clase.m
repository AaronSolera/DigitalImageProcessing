% Ejemplo del comando SVD

clc; clear; close all
m=50; n=30;
A = rand(m,n);

[U,S,V] = svd(A);
% U es de tamaño 5x5
% S es de tamaño 5x3
% V es de tamaño 5x3

% Rango reducido
r = round(min([m n]) / 2); % Aproximas A con una matriz de rango 2
Ur = U(:,1:r);
Vr = V(:,1:r);
Sr = S(1:r,1:r);

A % Matriz original
A2 = Ur * Sr * Vr' % Mejor aproximación de rango 2
error = norm(A - A2, 'fro') % Error obtenido mediante la norma

val_sing = diag(S); % Vector con los valores de la diagonal

plot(1:length(val_sing), val_sing)
title('Valores sigulares de la matriz A')
