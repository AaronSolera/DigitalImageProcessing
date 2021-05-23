function Y = im2bin(X)
  
  % Creating the binary matrix
  Y = zeros(size(X));
  
  % Setting to active (1) white pixels
  Y(X >= 50) = 1;
  
  return
  
endfunction