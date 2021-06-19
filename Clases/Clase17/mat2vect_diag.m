function x=mat2vect_diag(C)
  [n,~]=size(C);

  x=[C(1,1)]; s=sum(sum(abs(C)));

  %Primeras n diagonales
  for i=2:n
    for j=1:i
      if mod(i,2)==0
         x=[x C(j,i-j+1)];
      else     
         x=[x C(i-j+1,j)];
      end  
    end  
    if sum(abs(x))==s
      break
    end    
  end

  if mod(n,2)==1
    in=1; fin=n-1; pp=0;
  else
    in=2; fin=n; pp=1;
  end

  %Segundas Diagonales
  for i=1:n-1
    if sum(abs(x))==s
      break
    end  
    k=1;
    for j=i+1:n
      if mod(i,2)==pp
         x=[x C(n-k+1,j)];
      else     
         x=[x C(j,n-k+1)];
      end 
      k=k+1; 
    end  
  end
end