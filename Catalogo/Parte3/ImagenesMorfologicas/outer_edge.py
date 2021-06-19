from utils import *
import cv2 as cv


def outer_edge(A, B):
    A = im2bin(A)
    C = cv.dilate(A, B, iterations=1).astype("uint8")
    return C & (~A)
