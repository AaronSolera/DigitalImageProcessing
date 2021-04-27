function I = negativo(A)
  % A es una matrtiz en formato de 8 bitset
  % A, I son matrices en formato 8 bit
  A = double(A);
  I = uint8(-A + 255);
endfunction
