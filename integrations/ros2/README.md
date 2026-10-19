# Kshana receiver-trust on ROS 2

`kshana_trust` is a ROS 2 (ament_python) package. Its node subscribes to a GNSS fix and,
optionally, u-blox satellite data, scores the receiver's trust with the Kshana engine, and
publishes the result. Receive and publish only: it never writes to a receiver.

> **Advisory software.** Not type-approved navigation equipment. The operator stays responsible
> for the safe navigation of the vessel.

| | Topic | Type |
|---|---|---|
| in | `fix` | `sensor_msgs/NavSatFix` (position and fix status only: no C/N0, so only the position and consistency monitors have data) |
| in | `navsat` | `ublox_ubx_msgs/UBXNavSat` (per-satellite C/N0, elevation, azimuth; only when that package is installed) |
| out | `trust/state` | `std_msgs/String`: JSON of the latest scored epoch, with the advisory |
| out | `trust/band` | `std_msgs/String`: `calibrating`, `nominal`, `degraded`, `untrusted` or `waiting` |
| out | `trust/score` | `std_msgs/Float32`: 0-100 (NaN while there is none) |

How it works: the fix and satellite messages are written as NMEA 0183 (GGA, RMC, GSV) into a
rolling window (`window_s`, default 900 s) and scored by the engine's `receiver_trust_replay`
(the same code as `kshana receiver-trust live` on a bounded excerpt). The window must hold the
calibration time (`calibration_s`, default 120 s), until then the band is `waiting`. All the
conversion is in `kshana_trust/bridge.py`, which imports no ROS.

```sh
pip install kshana                                  # the Python binding
cd <ros2_ws>/src && ln -s <kshana>/integrations/ros2/kshana_trust .
colcon build --packages-select kshana_trust && source install/setup.bash
ros2 run kshana_trust trust_node --ros-args -r fix:=/gps/fix -r navsat:=/ubx_nav_sat \
    -p calibration_s:=120.0
```

Tests (no ROS needed): `pytest integrations/ros2/kshana_trust/test`. The bridge tests mock the engine; `test_engine_integration.py` runs the bridge against the real Python wheel (skipped when `kshana` is not installed): a steady synthetic fix scores nominal 100, a 1.1 km jump is untrusted through the kinematic monitor.

Status: the bridge is tested; the node itself has not been run against a live ROS 2 graph in
this repository, and the `ublox_ubx_msgs` field names (`svs`, `gnss_id`, `sv_id`, `cno`, `elev`,
`azim`) are taken from that package's published message definitions. The score is MODELLED.
