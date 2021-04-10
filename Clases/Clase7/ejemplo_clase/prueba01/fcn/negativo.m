function I=negativo(A)
  %Negativo de A
  %A, I son matrices en formato de 8 bit
  
  A=double(A);
  I=uint8(-A+255);
end
