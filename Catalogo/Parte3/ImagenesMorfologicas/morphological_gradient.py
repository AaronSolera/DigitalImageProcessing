from utils import *
import cv2 as cv


def morphological_gradiente(A, B):
    A = im2bin(A)
    C = cv.dilate(A, B, iterations=1).astype("uint8")
    D = cv.erode(A, B, iterations=1).astype("uint8")
    return C & (~D)
