import matplotlib.pyplot as plt
import numpy as np
from utils import *
from complement import *
from union import *
from intersection import *
from difference import *
from dilation import *
from erosion import *
from opening import *
from closure import *
from inner_edge import *
from outer_edge import *
from morphological_gradient import *
from fill_gaps import *

# ------------------------------------------------------------------
# BASIC MORPHOLOGICAL OPERATIONS
# ------------------------------------------------------------------
A = im2double(read_image("imagen2.jpg"))
B = im2double(read_image("imagen3.jpg")[:, :, 0])

# A complement
show_2bin_images(A, complement(A), "A", r'$\bar{A}$')

# A union B
show_3bin_images(A, B, union(A, B),
                 "Image A", "Image B", r'A $\cup$ B')

# A intersection B
show_3bin_images(A, B, intersection(A, B),
                 "Image A", "Image B", r'A $\cap$ B')

# A difference B
show_3bin_images(A, B, difference(A, B),
                 "Image A", "Image B", r'A $-$ B')

# ------------------------------------------------------------------
# DILATION, EROSION, OPENING AND CLOSURE (BINARY IMAGES)
# ------------------------------------------------------------------
A = im2double(read_image("imagen5.jpg"))
B = np.ones((3, 3), dtype="uint8")

show_2bin_images(A, dilation(A, B), "Image A", "Image A dilated")

show_2bin_images(A, erosion(A, B), "Image A", "Image A erosioned")

show_2bin_images(A, opening(A, B), "Image A", "Image A opened")

show_2bin_images(A, closure(A, B), "Image A", "Image A closured")

# ------------------------------------------------------------------
# BORDER EXTRACTION
# ------------------------------------------------------------------
A = im2double(read_image("imagen6.jpg"))
B = np.ones((3, 3), dtype="uint8")

show_2bin_images(A, inner_edge(A, B), "Image A", "Image A (inner edge)")

show_2bin_images(A, outer_edge(A, B), "Image A", "Image A (outer edge)")

show_2bin_images(A, morphological_gradiente(A, B), "Image A",
                 "Image A (morph. gradient)")

# ------------------------------------------------------------------
# FILL GAPS
# ------------------------------------------------------------------
A = im2double(read_image("imagen7.jpg")[:, :, 0])
B = np.ones((4, 4), dtype="uint8")

show_2bin_images(A, fill_gaps(A, B), "Image A",
                 "Image A (filled)")


cv.waitKey(0)
cv.destroyAllWindows()
