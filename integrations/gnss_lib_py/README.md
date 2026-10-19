# gnss_lib_py bridge

`kshana_gnss_lib_py.py` takes a [gnss_lib_py](https://github.com/Stanford-NavLab/gnss_lib_py)
`NavData` of position fixes and runs Kshana `receiver-trust` on it through the Python binding.
Read-only; no receiver or device is written to.

> **Advisory software.** Not type-approved navigation equipment. The operator stays responsible
> for the safe navigation of the vessel.

```python
import kshana_gnss_lib_py as br
result = br.assess_fixes(navdata, source="rx_wls", calibration_s=60.0)   # dict, receiver-trust result
pos_text = br.fix_to_rtklib_pos(navdata)                                 # RTKLIB .pos text
```

Licence: gnss_lib_py is MIT licensed (checked on its PyPI metadata, version 1.1.0); it is an
optional dependency, imported by the user's own code and never vendored or required by Kshana.

Limits: the fixes go in as an RTKLIB `.pos` (`format = "rtklib-pos"`), which carries no
carrier-to-noise density, so only the position and consistency monitors have data. Column names
are gnss_lib_py's (`gps_millis`, `lat_rx_wls_deg`, `lon_rx_wls_deg`, `alt_rx_wls_m`).

Tests: `pytest integrations/gnss_lib_py` (needs `numpy`, `pandas`, `gnss_lib_py`; the engine test
also needs the `kshana` wheel). A steady track gives no alarm; a 1.1 km jump alarms at the jump.
