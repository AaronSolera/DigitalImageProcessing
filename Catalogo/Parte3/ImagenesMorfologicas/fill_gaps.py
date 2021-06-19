from utils import *
import math
import cv2 as cv


def fill_gaps(A, B, iters=100):
    A = im2bin(A)
    M, N = A.shape
    X = np.zeros((M, N), dtype=np.uint8)
    cx = math.floor((M+1)/2)
    cy = math.floor((N+1)/2)
    X[cx, cy] = 1

    for i in range(iters):
        C = cv.dilate(X, B, iterations=1).astype("uint8")
        X = C & (~A)

    return X
