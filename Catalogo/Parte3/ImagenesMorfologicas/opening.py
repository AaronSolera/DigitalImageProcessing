from utils import *
import cv2 as cv


def opening(A, B):
    return cv.morphologyEx(A, cv.MORPH_OPEN, B)
