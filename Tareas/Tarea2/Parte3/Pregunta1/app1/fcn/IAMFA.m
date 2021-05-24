function A_ = IAMFA(A)
  [H,W] = size(A);
  A_ = zeros(H,W);
  
  for x=2:(H-1)
    col1 = MVDM([A(x-1,1), A(x,1) , A(x+1,1)]);
    col2 = MVDM([A(x-1,3), A(x,2) , A(x+1,2)]);
    for y=3:(W-1)
      col3 = MVDM([A(x-1,y) , A(x,y) , A(x+1,y)]);
      A_(x, y) = MVDM([col1; col2; col3]);
      col1 = col2;
      col2 = col3;
    end
  end
  A_ = uint8(A_);
endfunction
