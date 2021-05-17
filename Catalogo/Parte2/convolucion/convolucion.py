import numpy as np
def convolucion(matrizA,matrizB):
    m,n = matrizA.shape
    m -= 1
    n -= 1
    result = np.zeros((m,n))
    for i in range(m):
        j=0
        for j in range(n):
            print(matrizA[i,j])
            if(i > 0 and i < m) and (j>0 and j < n):
                result[i,j] = (matrizA[i-1,j-1]*matrizB[0,0]+
                                matrizA[i-1,j]*matrizB[0,1]+
                                matrizA[i-1,j+1]*matrizB[0,2]+
                                
                                matrizA[i,j-1]*matrizB[1,0]+
                                matrizA[i,j]*matrizB[1,1]+
                                matrizA[i,j+1]*matrizB[1,2]+

                                matrizA[i+1,j-1]*matrizB[2,0]+
                                matrizA[i+1,j]*matrizB[2,1]+
                                matrizA[i+1,j+1]*matrizB[2,2])
            elif(i == 0 and j ==0):
                result[i,j] = (matrizA[i,j]*matrizB[1,1]+
                                matrizA[i,j+1]*matrizB[1,2]+

                                matrizA[i+1,j]*matrizB[2,1]+
                                matrizA[i+1,j+1]*matrizB[2,2])
            elif(i == m and j ==n):
                result[i,j] = (matrizA[i-1,j-1]*matrizB[0,0]+
                                matrizA[i-1,j]*matrizB[0,1]+
                                
                                matrizA[i,j-1]*matrizB[1,0]+
                                matrizA[i,j]*matrizB[1,1])
            elif i == 0 :
                result[i,j] = (matrizA[i,j-1]*matrizB[1,0]+
                                matrizA[i,j]*matrizB[1,1]+
                                matrizA[i,j+1]*matrizB[1,2]+

                                matrizA[i+1,j-1]*matrizB[2,0]+
                                matrizA[i+1,j]*matrizB[2,1]+
                                matrizA[i+1,j+1]*matrizB[2,2])
            elif i == m:
                result[i,j] = (matrizA[i-1,j-1]*matrizB[0,0]+
                                matrizA[i-1,j]*matrizB[0,1]+
                                matrizA[i-1,j+1]*matrizB[0,2]+
                                
                                matrizA[i,j-1]*matrizB[1,0]+
                                matrizA[i,j]*matrizB[1,1]+
                                matrizA[i,j+1]*matrizB[1,2])
            elif j == 0:
                result[i,j] = (matrizA[i-1,j]*matrizB[0,1]+
                                matrizA[i-1,j+1]*matrizB[0,2]+
                                
                                matrizA[i,j]*matrizB[1,1]+
                                matrizA[i,j+1]*matrizB[1,2]+

                                matrizA[i+1,j]*matrizB[2,1]+
                                matrizA[i+1,j+1]*matrizB[2,2])
            if j == n:
                result[i,j] = (matrizA[i-1,j-1]*matrizB[0,0]+
                                matrizA[i-1,j]*matrizB[0,1]+
                                
                                matrizA[i,j-1]*matrizB[1,0]+
                                matrizA[i,j]*matrizB[1,1]+

                                matrizA[i+1,j-1]*matrizB[2,0]+
                                matrizA[i+1,j]*matrizB[2,1])
    return result

