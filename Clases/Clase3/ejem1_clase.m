% Ejemplo del comando SVD

clc; clear; close all

A = rand(5,3);

[U,S,V] = svd(A);
% U es de tamaño 5x5
% S es de tamaño 5x3
% V es de tamaño 5x3

% SVD económica
k = rank(A);
Uk = U(:,1:k);
Vk = V(:,1:k);
Sk = S(1:k,1:k);
% Uk es de tamaño 5x3
% Sk es de tamaño 3x3
% Vk es de tamaño 3x3

A % Matriz original
U*S*V' % SVD 
Uk*Sk*Vk' % SVD económica