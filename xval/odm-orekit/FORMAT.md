# Dump format of the ODM comparison

`OdmOracle.java` appends one block per parsed file to its dump. One `key=value` per line, no
spaces around `=`; the value runs to the end of the line. Blank lines are ignored.

```
case=O01                 file id (file name without extension)
kind=OPM | OMM | OCM
format=KVN | XML
version=3.0              header version as Orekit parsed it
parse_error=...          only if Orekit refused the file (nothing else of the case follows)
write_error=...          only if Orekit's writer refused the parsed message
block=<name>             starts a block: header, meta, then
                         OPM: state, kepler, spacecraft, cov, man (repeated), user
                         OMM: mean, spacecraft, tle, cov, user
                         OCM: traj (repeated), phys, cov (repeated), man (repeated), user
comment=...              comments of the current block, in order
KEYWORD=value            a keyword of the current block, in the message units
line=<epoch> v1 v2 ...   OCM data line; the epoch is absolute (relative epochs are resolved
                         against EPOCH_TZERO by Orekit); maneuver lines follow MAN_COMPOSITION
end                      closes the case
```

Values come from Orekit's parsed objects, converted from SI with `Unit.fromSI`: km, km/s,
km/s² (state, trajectories, maneuver accelerations), deg, km³/s², kg, m², rev/day,
rev/day² and rev/day³ (`MEAN_MOTION_DOT`, `MEAN_MOTION_DDOT` with Orekit's TLE scaling),
1/earth-radii (`BSTAR`), m²/kg (`BTERM`, `AGOM`), km², km²/s and km²/s² (covariance, one
factor 1e-6 from m-based units), s. Epochs are written with nine fractional digits in the
message's own time system; `CREATION_DATE` in UTC. Numbers are Java `Double.toString`
(shortest round-trip).
