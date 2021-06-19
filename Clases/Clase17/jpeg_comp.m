function x = jpeg_comp(A, n)
  pkg load signal
  % Paso 1: Restar 128 a cada entrada
  M = A - 128;
  % Paso 2: Calcular la DCT-2D
  D = dct2(M);
  % Paso 3: Obtener la matriz cuantificada
  % Matriz de Cuantificacion
  Q = cuantificacion(n);
  % Matriz Cuantificada
  C = round(D ./ Q);
  % Paso 4: Codificar la matriz C en un vector x
  x = mat2vect_diag(C);
endfunction
