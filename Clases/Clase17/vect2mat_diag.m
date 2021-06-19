function C=vect2mat_diag(x)
  t=length(x); n=8; C=zeros(n);
  k=1; C(1,1)=x(k);
  %Primeras n diagonales
  for i=2:n
    for j=1:i
      k=k+1;
      if mod(i,2)==0
         C(j,i-j+1)=x(k);
      else     
         C(i-j+1,j)=x(k);
      end 
    end  
    if t==k
      break
    end    
  end
  %Segundas Diagonales
  for i=1:n-1     
    r=1;
    if t==k
      break
    end
    for j=i+1:n
      k=k+1;     
      if mod(i,2)==1
         C(n-r+1,j)=x(k);
      else     
         C(j,n-r+1)=x(k);
      end 
      r=r+1;
      if t==k
        break
      end  
    end    
  end
end