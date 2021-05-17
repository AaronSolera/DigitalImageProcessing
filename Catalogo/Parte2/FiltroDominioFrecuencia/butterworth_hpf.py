import numpy as np
from utils import *

def butterworth_hpf(X, D0, n):
    """
    Function that calculates the Butterworth High-Pass Filter 
    of an image 

    Parameters
    ----------
    X : array_like
        Input image array

    Returns
    -------
    B : ndarray
        The resulting image with the filter applied
    """
    X = rgb2gray(np.array(X).astype(np.float64))

    # Saving the size of the input image in pixels
    # M : no of rows    (height of the image)
    # N : no of columns (width of the image)
    M,N = X.shape

    # Getting Fourier Transform of the input image
    # using NumPy library function fft2 (2D fast fourier transform)
    FT = np.fft.fft2(X)

    # Designing the filter
    u = np.arange(0,M)
    idx = np.where(u>M/2)
    u[idx] = u[idx]-M
    v = np.arange(0,N)
    idy = np.where(v>N/2)
    v[idy] = v[idy]-N

    # NumPy library function meshgrid(v, u) returns
    # 2D grid which contains the coordinates of vectors
    # v and u. Matrix V with each row is a copy 
    # of v, and matrix U with each column is a copy of u
    V,U = np.meshgrid(v,u)

    # Calculating Euclidean Distance
    D = np.sqrt(np.power(U,2)+np.power(V,2))

    # Determining the filtering mask
    H = 1 - 1/(1 + np.power(D/D0,2*n))

    # Convolution between the Fourier Transformed
    # image and the mask
    G = np.multiply(H,FT)

    # Getting the resultant image by Inverse Fourier Transform
    # of the convoluted image using NumPy library function 
    # ifft2 (2D inverse fast fourier transform)
    Y = np.fft.ifft2(G);
    Y = im2uint8(np.abs(Y));

    return Y
