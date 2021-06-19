clc; clear; close all

pkg load image

A = imread('files/cuadro.jpg');
A = imresize(A, 0.5);
subplot(1,2,1)
imshow(A)

% Para obtener los bordes de la imagen, utilizaremos el operador de Sobel
Bx = [-1 0 1; -2 0 2; -1 0 1];
By = [-1 -2 -1; 0 0 0; 1 2 1];
A = im2double(A);
Cx = conv2(A, Bx, 'same');
Cy = conv2(A, By, 'same');
B = sqrt(Cx.^2 + Cy.^2);

% Convertirla a Binaria
B(B < 0.5) = 0; B(B >= 0.5) = 1;
subplot(1,2,2)
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

display(x_b)
display(y_b)

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

numlineas = 10;

for i = 1:numlineas
  % Encontrar la posición donde el Acumulador alcanza el máximo
  maxA = max(max(Acumulador));
  [xp, yp] = find(Acumulador == maxA);

  for k = 1:length(xp)
    % Graficar la linea rectangle
    angMax = angulos(xp(k));
    pMax = ps(yp(k));

    pendiente = -cos(angMax) / sin(angMax);
    interseccion = pMax / sin(angMax);

    % Nota: Para graficar una linea recta en Octave, utilizaremos el comando line
    % Punto 1 = (1,y1)
    y1 = pendiente * 1 + interseccion;
    % Punto 2 = (xn,n)
    xn = (n - interseccion) / pendiente;

    if abs(sin(angMax))<10^-4 
      x_v=pMax/cos(angMax); 
      line([n 1], [x_v x_v],'LineWidth',2) 
    else 
      %Calcular pendiente 
      pendiente=-cos(angMax)/sin(angMax); 
      interseccion=pMax/sin(angMax); 
      %Necesitamos el punto (1,y1) 
      y1=pendiente*1+interseccion; 
      %Necesitamos el punto (m,ym) 
      ym=pendiente*m+interseccion; 
      %Necesitamos el punto (x1,1) 
      x1=(1-interseccion)/pendiente; 
      %Necesitamos el punto (xn,n) 
      xn=(n-interseccion)/pendiente; 
      if pendiente>0 
        if 0<y1 
          line([y1 n], [1 xn],'LineWidth',2) 
        else 
          line([1 ym], [x1 m],'LineWidth',2) 
        end 
      else if y1>m 
          line([ym n], [m xn],'LineWidth',2) 
      else 
          line([y1 1], [1 x1],'LineWidth',2) 
      end 
    end 
    end 
    Acumulador(xp(k), yp(k)) = 0;
  endfor
endfor
 