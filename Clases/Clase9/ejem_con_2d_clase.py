import numpy as np
from scipy import signal
import time

def size(matrix):
    return [np.size(matrix, 0), np.size(matrix, 1)]

# Ejemplo de Convolución en 2D
A = [[1, 0, 1], [4, 3, 1], [-1, 0, 2], [3, 0, -7]]
B = [[1, -1, 2, 3], [-4, 0, 1, 5], [3, 2, -1, 0]]

A = np.array(A)
B = np.array(B)

[m1, n1] = size(A) # 4 3
[m2, n2] = size(B) # 3 4
C1 = np.zeros((m1 + m2 - 1, n1 + n2 - 1))

# Calculo de la convolución a mano
t1 = time.time()
for j in range(0, m1 + m2 - 1): # Recorre cada entrada de C
    for k in range(0, n1 + n2 - 1): 
        S1 = range(max(0, j - m2), min(j, m1 - 1))
        S2 = range(max(0, k - n2), min(k, n1 - 1))
        for p in S1: # Realiza la suma con los elementos de S1
            for q in S2: # Realiza la suma con los elementos de S2
                C1[j, k] += A[p, q] * B[j - p, k - q]
t1 = time.time() - t1

# Calculo de la convolución usando la implementación de Octave
t2 = time.time()
C2 = signal.convolve2d(A, B)
t2 = time.time() - t2

# Mostrando resultados
print(A)
print(B)
print("\n", C1, "C1 Time: ", t1)
print("\n", C2, "C2 Time: ", t2)