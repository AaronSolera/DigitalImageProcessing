import cmath
import numpy as np
from utils import *

def dft2d(A):
    """
    Function that calculates the DFT-2D of an image

    Parameters
    ----------
    A : array_like
        Input image array

    Returns
    -------
    F : ndarray
        Resulting Discrete Fourier Transform (DFT) 
    """
    A = rgb2gray(np.array(A).astype(np.float64))
    M,N = A.shape
    F = np.zeros((M,N), dtype=complex)
    # Goes through all rows
    for u in range(M):
        # Goes through all columns
        for v in range(N):
            # Calculates the double sum
            for x in range(M-1):
                for y in range(N-1):
                    e = cmath.exp(-2j * np.pi * ((u*x)/M + (v*y)/N))
                    F[u,v] += A[x+1,y+1] * e
    return F
