# Fixture: Ho and Xu (2004) Figs. 6 and 7, read solid lines

- Source: K. C. Ho and W. Xu, "An accurate algebraic solution for moving source location using
  TDOA and FDOA measurements", IEEE Transactions on Signal Processing 52(9), 2004,
  pp. 2453-2463, doi 10.1109/TSP.2004.831921. Paywalled; the reading copy (SHA-256
  5f657bc1b60fd1770e0f2239b9ac132933d9de02afddda6d8db376b89e910bd8) was supplied by the founder on
  2026-10-01 and is NOT vendored. Only numbers read from it are committed here.
- Generator: `read_ho_xu_figures.py` (this directory), run with the oracle virtual environment
  (NumPy, Pillow) and poppler's `pdfimages`:
  `$ORACLE_PY read_ho_xu_figures.py ~/Code/kshana-oracles/data/papers/founder-2026-10-01/HoXu2004-TDOA-FDOA.pdf`
- Output: `ho_xu_2004_readings.json`, the value of each solid (Cramer-Rao lower bound) line at
  0 dB on the plotted axis, with the calibration diagnostics the procedure requires.
- Licence of this directory: the script is AGPL-3.0-only like the repository; the JSON holds
  measured numbers (facts), not reproduced figure content.
