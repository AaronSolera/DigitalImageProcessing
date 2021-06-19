from utils import *
import cv2 as cv


def closure(A, B):
    return cv.morphologyEx(A, cv.MORPH_CLOSE, B)
