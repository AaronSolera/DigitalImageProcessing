from utils import *
import cv2 as cv


def erosion(A, B):
    return cv.erode(A, B, iterations=1)
