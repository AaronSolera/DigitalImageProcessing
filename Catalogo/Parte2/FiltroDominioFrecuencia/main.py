from utils import *
from dft2d import *
from gaussian_lpf import *
from ideal_hpf import *
from butterworth_hpf import *

A = read_image("chest.jpg")
X = read_image("edificio_china.jpg")

print("Calculating ...")
F = dft2d(A)
print("Done ...")
plot_image(np.abs(F))

Y_glpf = gaussian_lpf(X=X, sigma=2.0)
compare_images(X, Y_glpf, "Original Image", "Gaussian (LPF)")

Y_ihpf = ideal_hpf(X=X, D0=100)
compare_images(X, Y_ihpf, "Original Image", "Ideal (HPF)")

Y_bhpf = butterworth_hpf(X=X, D0=100, n=2)
compare_images(X, Y_bhpf, "Original Image", "Butterworth (HPF)")
