#!/usr/bin/env python3
"""Generate external-oracle reference values for tests/fim_observability_reference.rs.

Oracle libraries (independent, authoritative, BSD-licensed):
  numpy.linalg.eigh  — symmetric eigensolver
  numpy.linalg.inv   — matrix inverse (CRLB covariance, DOP)
Run:  python3 generate.py   (prints Rust-ready constants)
Reproducible: fixed inputs, no randomness.
"""
import numpy as np

def emit(name, arr):
    a = np.asarray(arr, float).ravel()
    print(f"// {name}")
    print(", ".join(f"{x:.15e}" for x in a))
    print()

print(f"# numpy {np.__version__}\n")

# --- Test A: symmetric eigenvalues vs numpy.linalg.eigh -----------------------
A = np.array([
    [4.0, 1.0, 2.0, 0.0],
    [1.0, 3.0, 0.0, 1.0],
    [2.0, 0.0, 5.0, 1.0],
    [0.0, 1.0, 1.0, 2.0],
])
wA = np.linalg.eigvalsh(A)              # ascending
emit("A_eigenvalues_ascending", wA)

# --- Test B: CRLB covariance of a 3-regressor linear model vs sigma^2 (X^T X)^-1
ts = np.array([0.0, 1.0, 2.0, 3.0, 4.0, 5.0, 6.0])
X = np.column_stack([np.ones_like(ts), ts, ts**2])   # [1, t, t^2]
sigma2 = 0.5
cov = sigma2 * np.linalg.inv(X.T @ X)                 # 3x3
emit("B_crlb_cov_rowmajor_3x3", cov)

# --- Test C: GNSS DOP from a line-of-sight geometry vs numpy inv --------------
# Eight satellites at (azimuth_deg, elevation_deg). ENU LOS unit vector
# e = [cos(el)sin(az), cos(el)cos(az), sin(el)]; geometry row = [-e, 1] (clock).
azel = [(0,75),(40,30),(100,15),(150,60),(200,25),(250,45),(300,20),(330,70)]
G = []
for az,el in azel:
    a=np.radians(az); e=np.radians(el)
    u=np.array([np.cos(e)*np.sin(a), np.cos(e)*np.cos(a), np.sin(e)])
    G.append([-u[0],-u[1],-u[2],1.0])
G=np.array(G)
Q=np.linalg.inv(G.T@G)            # ENU+clock covariance (unit weights)
gdop=np.sqrt(np.trace(Q))
pdop=np.sqrt(Q[0,0]+Q[1,1]+Q[2,2])
hdop=np.sqrt(Q[0,0]+Q[1,1])
vdop=np.sqrt(Q[2,2])
tdop=np.sqrt(Q[3,3])
print("// C_geometry_azel_deg (informational): " + str(azel))
emit("C_Q_rowmajor_4x4", Q)
print("// C_DOP  GDOP PDOP HDOP VDOP TDOP")
print(", ".join(f"{x:.15e}" for x in [gdop,pdop,hdop,vdop,tdop]))
