function  [B,C] = rango_reducido_bilateral(A, r, p)
  % Paso 1
  n = size(A, 2); % Número de columnas de A
  Y2 = randn(n, r);
  % Paso 2
  for k = 1 : p
    Y1 = A * Y2;
    Y2 = A' * Y1;
  endfor
  % Paso 3
  [Q, ~] = qr(Y2); % Y2 = QR, Q = Ortogonal, R = Triangular Superior
  % Paso 4
  Qr = Q (:, 1:r);
  % Paso 5
  B = A * Qr;
  C = Qr';
endfunction
  