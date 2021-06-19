from utils import *
import cv2 as cv


def dilation(A, B):
    return cv.dilate(A, B, iterations=1)
