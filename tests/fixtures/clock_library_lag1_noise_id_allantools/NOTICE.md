# NOTICE: lag-1 noise identification oracle fixture

Used by `tests/clock_library_lag1_noise_id_allantools.rs`. Both files are written by
`generate.py` in this directory (retrieved and generated 2026-10-02).

| File | Content | SHA-256 |
|---|---|---|
| `records.txt` | Ten synthetic power-law phase records (2048 samples each) from the Kasdin generator of allantools 2024.6 (`noise_kasdin.Noise`, qd = 1e-20, b = 0, -1, -2, -3, -4, numpy 2.4.6 seeds 1 and 2). Synthetic inputs, no third-party data. | f7a560b9c79541e855c1ff81d132ba68a9cb8591274887f9ce3cbfb5102f2255 |
| `oracle.txt` | allantools 2024.6 `autocorr_noise_id(x, af, data_type, dmin=0, dmax=2)` on every record as phase data and on its first difference as frequency data, af = 1 to 64: `alpha_int alpha d rho`. | d90516dfab6ad03ff4883c4b349a8a628c485fcc8140e2584a2812d7f9b854f9 |

## Oracle and licence

allantools (A. Wallin and contributors, https://github.com/aewallin/allantools,
LGPL-3.0-or-later), installed from PyPI (`allantools==2024.6`) and run as a separate program
by `generate.py`. No allantools source code is copied into this repository; the committed files
are its numeric outputs. The algorithm is W. J. Riley and C. A. Greenhall, "Power law noise
identification using the lag 1 autocorrelation", Proc. 18th European Frequency and Time Forum
(2004); NIST SP 1065 (2008) §5.2.

Regenerate: `python3 generate.py` in the oracle virtual environment.
