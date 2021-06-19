from utils import *


def union(A, B):
    A = im2bin(A)
    B = im2bin(B)
    return A | B
