function A = jpeg_decomp(x, n)
  pkg load signal
  % Paso 1: Convertir vector x en matriz 8x8
  Cr = vect2mat_diag(x);
  % Paso 2: Multiplicar puntualmente Cr y Q
  % Matriz de Cuantificacion
  Q = cuantificacion(n);
  M = Cr .* Q;
  % Paso 3: Calcular la inversa de DCT-2D a M
  P = idct2(M);
  % Paso 4: Redondear P y sumar 128 a cada entrada
  Ar = round(P) + 128;
endfunction
