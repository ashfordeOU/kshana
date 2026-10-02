# Light-time solver sample: JPL Horizons DE441

- Source: NASA/JPL (Jet Propulsion Laboratory) Horizons system API, https://ssd.jpl.nasa.gov/api/horizons.api,
  API version 1.2, planetary ephemeris DE441 (every response names DE441).
- Licence: Horizons output is a US Government work and free to use; JPL asks for acknowledgement.
- Retrieved: 2026-10-02, by `generate.py` (standard-library Python; re-run it to reproduce). Values
  are kept exactly as Horizons prints them.
- Content:
  - `horizons_barycentric_nodes.csv`: geometric barycentric (CENTER='500@0') ICRF positions (km) of
    399, 10, 301, 1, 2, 4, 5, 6 every 0.5 d from JD 2458849.5 to 2461041.5 (4385 per body). SHA-256 136f134cc8d2f91a4eac5e574d2f28aa7ede2a1a0df7271fd461a97a006493b9.
  - `horizons_barycentric_at_epochs.csv`: the same bodies at the 1576 reception epochs (interpolation
    precondition only). SHA-256 de6b5cce0caed364eff51fa4124e6df0892af3aed77a537031e6c89a0de255f6.
  - `horizons_light_time.csv`: the one-way light time LT (s) of 1, 2, 4, 5, 6, 10, 301 seen from the
    Earth's centre (CENTER='500@399', VEC_CORR='LT'), Horizons legend "One-way down-leg Newtonian
    light-time (sec)", at JD 2458860.3 + 1.375 k, k = 0..1575. SHA-256 766f31e18190a03ecd09f2db1a656c3e952d83d9d9a947a3c5357b9c02b667fc.
- Pre-registered in `tests/solar_system_light_time_solver_preregistered.rs` (commit 480037d3, made
  before any fetch; amendment commit 54d5c86f after the first run's interpolation precondition failed,
  before any light time was compared). The void first fetch used 1-day nodes
  (SHA-256 67bd88b23fba8a556b91d90570735773bbaaa1cdbe65f78a5bb841f5517a31af, not kept); its other two
  files were byte-identical to the ones here.
