# Solar system and positioning around other bodies

Two scenario kinds work beyond the Earth-Moon system:

- `solar-system` reports every body of the catalogue at one epoch: position and velocity,
  physical constants, light time and range from an observer body, and an orbit track.
- `body-pnt` puts a navigation user (an orbiter or a surface lander) around any catalogue
  body other than the Sun and the Earth, with a local navigation constellation and an optional deep-space
  range from the Earth.

The `constellation-design` kind uses the same catalogue to build constellations around
any of these bodies ([CONSTELLATION-DESIGN.md](CONSTELLATION-DESIGN.md)).

Code: `src/body.rs` (the catalogue and its constants), `src/ephem.rs` (the analytic
ephemerides), `src/ephem_provider.rs` (`AnalyticSolarSystem`, the provider both kinds
read), `src/solar_system.rs` and `src/body_pnt.rs` (the kinds) and `src/radiometric.rs`
(light time, two-way range and the Shapiro delay). Tests:
`tests/solar_system_horizons_reference.rs` and the unit tests of each module.

## The catalogue

Eighteen bodies: the Sun, the eight planets, Pluto, the Moon, Phobos, Deimos, the four
Galilean moons (Io, Europa, Ganymede, Callisto) and Titan. Names are matched without regard
to case. For each, `src/body.rs` carries the gravitational parameter GM, the equatorial and
volumetric mean radii, the second zonal harmonic `J2` and its reference radius where one is
published, and the International Astronomical Union (IAU) pole and prime-meridian model
(sidereal rotation period, negative for a retrograde rotator). Each value cites its source
in the code.

## Where the positions come from

| Bodies | Model | Label |
|---|---|---|
| Mercury to Saturn and the Earth, from Table 1 (1800 AD to 2050 AD) | Jet Propulsion Laboratory (JPL) Keplerian elements of Standish and Williams, <https://ssd.jpl.nasa.gov/planets/approx_pos.html> | VALIDATED |
| All eight planets from Tables 2a/2b (3000 BC to 3000 AD) | the same page's long-span elements | VALIDATED |
| Uranus and Neptune from Table 1 | as above | MODELLED |
| Pluto | the 1992 Table 1 row (1800 AD to 2050 AD only; the current page removed it and states no error) | MODELLED |
| The Moon | the Montenbruck and Gill lunar series, splitting the Earth-Moon barycentre | MODELLED |
| Phobos, Deimos, the Galilean moons, Titan | JPL mean elements with the IAU rotation model | MODELLED |

`table = "auto"` (the default) takes Table 1 inside 1800 AD to 2050 AD and Tables 2a/2b
outside it; `table1` and `table2` force one. Pluto outside its table is an error, not an
extrapolation. The epoch is an ISO 8601 date and time in Coordinated Universal Time (UTC),
converted through Terrestrial Time (TT) with the leap seconds to Barycentric Dynamical Time
(TDB), or a TDB Julian date given directly with `epoch_jd_tdb`.

The oracle is JPL Horizons (<https://ssd.jpl.nasa.gov/horizons/>, Development Ephemeris
DE441), with the queried vectors committed under `tests/fixtures/solar_system/`. A planet
row is VALIDATED where it stays within twice the Standish page's own nominal error. Measured
by `cargo test --test solar_system_horizons_reference -- --nocapture`:

- Table 1, Mercury to Saturn and the Earth-Moon barycentre, 12 epochs from 1800 to 2049:
  worst 1.87 times the nominal error (Saturn's distance).
- Tables 2a/2b, all eight planets, 15 epochs from about 1000 BC to 2500 AD: worst 1.71
  times (Mars' distance).
- Table 1 Uranus and Neptune exceed the page's figures against DE441: 2.04 and 5.16 times
  the nominal longitude error. They are pinned under six times and stay MODELLED.
- Pluto: within 39.2 arcsec in longitude and 1.14e9 m in distance.
- Moons, worst angle seen from the planet over 2000 to 2040: Phobos 5.65 deg, Deimos 0.38,
  Io 0.40, Europa 1.63, Ganymede 0.22, Callisto 0.27, Titan 3.31. The geocentric Moon:
  0.046 deg.
- Planet velocities: worst relative error 3.72e-3 of the speed (MODELLED).

The Moon and the seven moons are measured with pinned bars, but no published bound exists
to validate them against, so they are MODELLED.

The analytic ephemerides need no kernel file. A JPL Development Ephemeris kernel
(DE-grade positions) is read only by the separate cross-validation crates under `xval/`,
through the same `EphemerisProvider` trait; the main crate does not depend on them.

## `solar-system`

```toml
kind = "solar-system"
epoch = "2030-01-01T00:00:00"
bodies = ["Earth", "Moon", "Mars", "Jupiter", "Europa"]
observer = "Mars"

[[links]]
from = "Europa"
to = "Earth"
```

```text
Solar system at 2030-01-01T00:00:00 (JD 2462502.50080 TDB), 5 bodies, observer Mars
  Standish Table 1 (1800 AD to 2050 AD)
  Earth       0.9833 au  lon  100.18 deg  light time    1038.1 s  [VALIDATED]
  Moon        0.9815 au  lon  100.28 deg  light time    1037.8 s  [MODELLED]
  Mars        1.3814 au  lon  337.83 deg  observer  [VALIDATED]
  Jupiter     5.4235 au  lon  222.19 deg  light time    3068.4 s  [VALIDATED]
  Europa      5.4194 au  lon  222.17 deg  light time    3066.6 s  [MODELLED]
  link Europa -> Earth: one-way 2993.281 s, two-way 5986.612 s, Shapiro 33.7 us, Sun 50.0 deg
```

Inputs: `epoch` (default 2026-01-01T00:00:00) or `epoch_jd_tdb`; `bodies` (default all
eighteen); `observer` (default the Earth); `track_points` per orbit (8 to 2000, default
120); `table`; and any number of `[[links]]`, each received at the epoch.

Per body the result gives its class and parent, the NASA Navigation and Ancillary
Information Facility (NAIF) identifier, the heliocentric position and velocity in the
International Celestial Reference Frame (ICRF, equatorial J2000) in metres and metres per
second, the ecliptic longitude, latitude and distance, the position relative to its parent,
the orbital period, the constants above, the pole and the prime meridian at the epoch, the
Standish nominal error where one exists, its label and method string, and an orbit track
over one revolution (heliocentric for a planet, centred on the parent for a moon; a single
point for the Sun). The link from
the observer, and each extra link, gives:

- the Newtonian one-way light time, solved by the radiometric fixed-point light-time solver
  with the transmitter at its retarded position, and the corresponding one-way range;
- the two-way light time and range;
- the Sun's Shapiro delay, reported separately and not added;
- the Sun separation angle.

The light time is VALIDATED against the one-way light time Horizons reports: Mars and
Jupiter to the Earth's centre at four epochs from 2000 to 2040, worst error 0.070 s for Mars
against a 0.207 s bar and 1.31 s for Jupiter against 4.04 s. The bar is twice the sum of the
Standish distance errors of the target and the Earth-Moon barycentre, divided by the speed
of light: the light time can be no better than the positions. It is the Newtonian geometric
light time, not a relativistic or plasma-corrected observable.

The bundled `scenarios/solar-system-tour.toml` reports all eighteen bodies at
2026-09-28T00:00:00 with 180-point tracks, and adds the Mars-to-Jupiter (one-way
2193.539 s), Saturn-to-Earth (4212.176 s) and Europa-to-Jupiter (2.218 s) links.

## `body-pnt`

A user navigates around a body chosen by name (any catalogue body but the Sun and the Earth,
which the kind refuses) with two kinds of measurement:

- one-way pseudoranges from a Walker delta navigation constellation around the body
  (`planes` by `sats_per_plane`, inter-plane phasing `phasing_f`), flown as two-body orbits
  with the body's own `J2` secular drift; the user clock is unknown, so these rows carry a
  clock-bias column;
- optionally a two-way range from the Earth's centre (`[earth_link]`), which needs no user
  clock and is reported as a one-way range with its own noise. The Earth's direction and
  distance come from the analytic ephemeris at every epoch.

A line of sight is blocked when it passes inside the body's mean radius (the chord test of
the `mars-pnt` kind), and a surface user also needs the elevation mask. At every epoch the
run forms the geometric and position dilution of precision (GDOP, PDOP) of the
constellation alone, the formal one-sigma position uncertainty with and without the Earth
row, and a seeded Gauss-Newton least-squares fix each way, so the report shows what the
deep-space link adds.

| Table | Field | Default |
|---|---|---|
| top level | `body` | `Mars` |
| | `epoch` / `epoch_jd_tdb` | 2027-02-19T00:00:00, a Mars opposition |
| | `duration_s`, `step_s` | 86 400 s, 600 s |
| | `seed` | 1 |
| | `table` | `auto` |
| `[user]` | `kind` | `orbiter` (or `surface`) |
| | orbiter: `altitude_km`, `inclination_deg`, `raan_deg`, `u0_deg`, `eccentricity` | 400 km, 75 deg, 0, 0, 0 |
| | surface: `lat_deg`, `lon_deg`, `height_m` | 0, 0, 0 |
| `[constellation]` | `planes`, `sats_per_plane`, `phasing_f` | 3, 4, 1 |
| | `altitude_km` | three mean radii |
| | `inclination_deg` | 60 deg |
| | `sigma_range_m` | 1 m |
| | `mask_deg` (surface user) | 10 deg |
| `[earth_link]` | `enabled`, `sigma_range_m` | true, 1 m |

`raan_deg` is the right ascension of the ascending node in the body's equatorial frame and
`u0_deg` the argument of latitude at the epoch.

The two bundled scenarios, as they run with kshana 0.29.3:

| | `scenarios/mars-orbit-pnt.toml` | `scenarios/europa-surface-pnt.toml` |
|---|---|---|
| User | orbiter, 300 km, 93 deg | surface, 20 deg N, 60 deg E |
| Relays | 12 at 10 000 km, 60 deg | 12 at 4500 km, 55 deg, 10 deg mask |
| Span | one sol, 296 epochs | 306 822 s, 171 epochs |
| Earth light time, one-way / round trip | 338.3 s / 676.6 s | 2182.9 s / 4365.8 s |
| Earth in view | 0.811 of epochs | 0.439 |
| Availability, relays only / with the Earth range | 1.000 / 1.000 | 0.480 / 0.719 |
| Median PDOP | 1.375 | 5.360 |
| RMS fix error, relays only / with the Earth range | 1.883 m / 1.629 m | 112.742 m / 86.147 m |
| Median formal sigma, relays only / with the Earth range | 1.375 m / 1.304 m | 5.360 m / 4.239 m |

(RMS: root mean square.) Around Europa the Earth range lifts availability from 0.480 to
0.719 of epochs. Where the Earth never clears the limb the link adds nothing: a lander at
89.5 deg S on the Moon under a 12-satellite, 5000 km relay shell has the Earth in view at 0
of 145 epochs, and its errors are the same with and without the link.

**MODELLED.** The relay orbits ignore third bodies (Jupiter's pull on relays around Europa
is not modelled), the noise is Gaussian at the stated levels and the measurement model is
instantaneous, not light-time retarded. What is checked: the relay period against Kepler's
third law for the body, an orbiter keeping its radius and a lander on the surface, the Earth
range never worsening the formal uncertainty, the seeded fix errors agreeing with the formal
sigma (root mean square of error over sigma in [0.6, 1.5]), and a deterministic run. None of
this is a mission's navigation data.

## The `ephemeris` kind

Despite the name, `ephemeris` is an Earth-satellite kind: one satellite, from a two-line
element set (TLE) through the Simplified General Perturbations 4 (SGP4) propagator or from
an analytic orbit, over a time grid. At every step it emits the inertial state (position and
velocity) in the true equator, mean equinox (TEME) frame and in the Geocentric Celestial
Reference System (GCRS), the Earth-fixed position, the World Geodetic System 1984 (WGS 84)
sub-satellite point and, for an optional ground station, azimuth, elevation, range and range
rate. `eop_finals2000a` takes the text of an International Earth Rotation and Reference
Systems Service (IERS) `finals2000A` file for per-epoch UT1−UTC and polar motion. Code:
`src/ephemeris.rs`.

```text
$ kshana scenarios/ephemeris.toml
scenario 0d4dd01b3160 | sgp4 (TLE) | 559 samples | alt 419–434 km | |lat| ≤ 51.8° | speed 7653–7661 m/s | max el 25.7° peak Doppler 34.3 kHz
```

## Not modelled

- Relativistic light-time terms beyond the separately reported Shapiro delay, and the solar
  plasma delay.
- Positions better than the Standish and mean-element accuracy stated above; there is no
  kernel reader in the main crate.
- Third-body perturbations on `body-pnt` relays and on `constellation-design` orbits.
- Terrain on any body: a body is its mean sphere.
- Interoperability exports: CZML, KML and GeoJSON describe positions about the Earth, so
  the `solar-system` and `body-pnt` scenarios export none ([INTEROP.md](INTEROP.md)).

## References

- E. M. Standish and J. G. Williams, "Keplerian Elements for Approximate Positions of the
  Major Planets," JPL Solar System Dynamics,
  <https://ssd.jpl.nasa.gov/planets/approx_pos.html>.
- O. Montenbruck and E. Gill, *Satellite Orbits: Models, Methods and Applications*,
  Springer, 2000, §3.3.2.
- B. A. Archinal et al., "Report of the IAU Working Group on Cartographic Coordinates and
  Rotational Elements: 2015," *Celestial Mechanics and Dynamical Astronomy* 130, 2018.
- JPL Horizons, <https://ssd.jpl.nasa.gov/horizons/>.
