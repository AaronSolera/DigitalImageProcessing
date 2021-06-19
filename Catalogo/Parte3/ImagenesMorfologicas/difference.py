from utils import *


def difference(A, B):
    A = im2bin(A)
    B = im2bin(B)
    return A & (~B)
