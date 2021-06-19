function dig = mat2vect_diag(A)
  m = size(A);
  dig = [];
  for i = 1:(m-1)
    temp = diag(fliplr(A(1:i,1:i)))';
    if(mod(i, 2) == 0)
      dig = [dig temp];
    else
      dig = [dig flip(temp)];
    endif
  endfor
endfunction
