import numpy as np

def manual_integral(func, lb, ub, N=100):
    h = 2/N
    dx = (ub-lb)/(N-1)
    sum = 0
    for k in range(N):
        sum += func(lb + k * dx)
    return h * sum

def riemFunc(x):
    return np.sqrt(1 - x*x)

print(f"analytical integral of riemFunc = {np.pi / 2}")
print(f"manual_integral(riemFunc, -1, 1) = {manual_integral(riemFunc, -1, 1)}")

print("\nNEXT")
print(manual_integral(riemFunc, -1, 1, N=int(1e8)))