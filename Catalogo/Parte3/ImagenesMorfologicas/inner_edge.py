from utils import *
import cv2 as cv


def inner_edge(A, B):
    A = im2bin(A)
    C = cv.erode(A, B, iterations=1).astype("uint8")
    return A & (~C)
