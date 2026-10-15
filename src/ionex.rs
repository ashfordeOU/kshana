// SPDX-License-Identifier: AGPL-3.0-only
//! IONEX-style total-electron-content (TEC) maps and the ionospheric range delay.
//!
//! The shipped Klobuchar model (in [`crate::gnss_sim`]) is the *broadcast* single-frequency
//! ionosphere correction. This module adds the *measured* alternative: an IGS global
//! ionosphere map (GIM) as a regular latitude/longitude grid of vertical TEC, with bilinear
//! interpolation at an ionospheric pierce point, and the first-order delay
//! `Δ = 40.3·TEC/f²` (TEC in electrons/m², `f` in Hz).
//!
//! It also parses the IONEX file format into its sequence of TEC maps, interpolates the
//! vertical TEC between successive maps in time, and maps the vertical delay onto a slant ray
//! through the thin-shell obliquity factor. [`parse_ionex`] keeps seconds-of-day epochs (a
//! daily file's closing 24:00 map reads as 0 s); [`parse_ionex_file`] reads the header, the
//! values by their strict I5 columns (`9999` as NaN), the TEC and RMS maps with epochs counted
//! from the first map's day, and offers the format's three time interpolations, including the
//! recommended rotated-map one. Exercised on a real CODE global ionosphere map in
//! `tests/ionex_code_gim_oracle.rs`. Height-dependent (3-D) maps are not supported.

use crate::portable_math::PortableFloat;
/// GPS L1 carrier frequency (Hz).
pub const GPS_L1_HZ: f64 = 1_575.42e6;
/// GPS L2 carrier frequency (Hz).
pub const GPS_L2_HZ: f64 = 1_227.60e6;
/// Electrons per square metre in one TEC unit (TECU).
pub const TECU: f64 = 1.0e16;

/// First-order ionospheric range delay (m): `Δ = 40.3·TEC/f²`, with `vtec_tecu` in TECU
/// and `frequency_hz` in Hz. At L1, 1 TECU ≈ 0.162 m; the delay scales as `1/f²`.
pub fn vtec_to_delay_m(vtec_tecu: f64, frequency_hz: f64) -> f64 {
    40.3 * vtec_tecu * TECU / (frequency_hz * frequency_hz)
}

/// A regular latitude/longitude grid of vertical TEC (TECU), row-major in latitude then
/// longitude — an IGS global ionosphere map.
#[derive(Clone, Debug)]
pub struct TecGrid {
    /// Latitude of the first row (deg).
    pub lat0_deg: f64,
    /// Longitude of the first column (deg).
    pub lon0_deg: f64,
    /// Latitude step between rows (deg, > 0).
    pub dlat_deg: f64,
    /// Longitude step between columns (deg, > 0).
    pub dlon_deg: f64,
    /// Number of latitude rows.
    pub n_lat: usize,
    /// Number of longitude columns.
    pub n_lon: usize,
    /// Vertical TEC (TECU), `vtec[i*n_lon + j]` at `(lat0 + i·dlat, lon0 + j·dlon)`.
    pub vtec: Vec<f64>,
}

impl TecGrid {
    /// The grid node value at row `i`, column `j`.
    pub fn node(&self, i: usize, j: usize) -> f64 {
        self.vtec[i * self.n_lon + j]
    }

    /// Bilinearly interpolated vertical TEC (TECU) at `(lat, lon)` in degrees. Queries
    /// outside the grid are clamped to the nearest edge (no extrapolation).
    pub fn vtec_at(&self, lat_deg: f64, lon_deg: f64) -> f64 {
        let (i0, fi) = cell(lat_deg, self.lat0_deg, self.dlat_deg, self.n_lat);
        let (j0, fj) = cell(lon_deg, self.lon0_deg, self.dlon_deg, self.n_lon);
        let v00 = self.node(i0, j0);
        let v01 = self.node(i0, j0 + 1);
        let v10 = self.node(i0 + 1, j0);
        let v11 = self.node(i0 + 1, j0 + 1);
        (1.0 - fi) * (1.0 - fj) * v00
            + (1.0 - fi) * fj * v01
            + fi * (1.0 - fj) * v10
            + fi * fj * v11
    }

    /// Ionospheric delay (m) at a pierce point for a given carrier frequency.
    pub fn delay_at(&self, lat_deg: f64, lon_deg: f64, frequency_hz: f64) -> f64 {
        vtec_to_delay_m(self.vtec_at(lat_deg, lon_deg), frequency_hz)
    }
}

/// Locate the lower cell index `i0` and the in-cell fraction `f ∈ [0,1]` for a coordinate
/// on a regular axis, clamped so that `i0` and `i0+1` are valid (`n ≥ 2`). Promoted to
/// `pub(crate)` so the [`crate::altpnt::terrain`] DEM grid reuses the identical clamp helper
/// rather than copy-pasting the body (one shared definition, no divergent edge handling).
pub(crate) fn cell(x: f64, x0: f64, dx: f64, n: usize) -> (usize, f64) {
    // A degenerate grid with a single sample along this axis (n < 2) has no interval to
    // interpolate within; `clamp(0, n-2)` would be `clamp(0, -1)` and panic (min > max). Pin to
    // the only cell with a zero fraction instead.
    if n < 2 {
        return (0, 0.0);
    }
    let t = (x - x0) / dx;
    let i = t.floor();
    let i0 = (i as isize).clamp(0, n as isize - 2) as usize;
    let f = (t - i0 as f64).clamp(0.0, 1.0);
    (i0, f)
}

// ── IONEX file parsing, time interpolation, and the slant obliquity mapping ───────────

/// A single IONEX TEC map: its epoch (seconds of day) and the vertical-TEC grid.
#[derive(Clone, Debug)]
pub struct IonexMap {
    /// Epoch of the map as seconds of day (`hh·3600 + mm·60 + ss`).
    pub epoch_sod: f64,
    /// The vertical-TEC grid.
    pub grid: TecGrid,
}

/// The label field of an IONEX record begins at column 60.
///
/// IONEX is a fixed-column ASCII format, so column 60 is also byte 60 — until an
/// off-spec non-ASCII character straddles it, at which point a naive `&str` byte
/// slice panics. `str::get` returns `None` there instead and the line is treated
/// as unlabelled, i.e. ignored, which is what `parse_ionex`'s documented `None`
/// contract requires of it. `crate::eop`, the crate's other fixed-column reader,
/// already slices this way.
fn ionex_label(line: &str) -> &str {
    line.get(60..).unwrap_or("").trim()
}

/// The numeric fields ahead of the column-60 label. Same byte-boundary caveat as
/// [`ionex_label`]: on a straddling character the whole line is scanned instead,
/// which is harmless because [`ionex_label`] returns `""` for that same line, so
/// the numbers are discarded.
fn nums_before_label(line: &str) -> Vec<f64> {
    let body = line.get(..line.len().min(60)).unwrap_or(line);
    body.split_whitespace()
        .filter_map(|t| t.parse().ok())
        .collect()
}

/// Parse an IONEX (IONosphere map EXchange) text into its sequence of TEC maps. Reads the
/// header grid definition (`LAT1 / LAT2 / DLAT`, `LON1 / LON2 / DLON`, `EXPONENT`) and each
/// `START OF TEC MAP … END OF TEC MAP` block, normalising the latitude rows to increasing
/// order so the resulting [`TecGrid`] keeps positive steps (IONEX lists latitude north-to-south
/// with a negative `DLAT`). Vertical-TEC values are whitespace-separated and scaled by
/// `10^EXPONENT` to TECU. Returns `None` on a malformed header or a map whose value count does
/// not match the grid.
pub fn parse_ionex(text: &str) -> Option<Vec<IonexMap>> {
    let mut lat1 = None;
    let mut lat2 = None;
    let mut dlat = None;
    let mut lon1 = None;
    let mut lon2 = None;
    let mut dlon = None;
    let mut exponent: i32 = 0;
    let mut lines = text.lines();

    for line in lines.by_ref() {
        let nums = nums_before_label(line);
        match ionex_label(line) {
            "LAT1 / LAT2 / DLAT" => {
                lat1 = nums.first().copied();
                lat2 = nums.get(1).copied();
                dlat = nums.get(2).copied();
            }
            "LON1 / LON2 / DLON" => {
                lon1 = nums.first().copied();
                lon2 = nums.get(1).copied();
                dlon = nums.get(2).copied();
            }
            "EXPONENT" => exponent = nums.first().copied().unwrap_or(0.0) as i32,
            "END OF HEADER" => break,
            _ => {}
        }
    }
    let (lat1, lat2, dlat, lon1, lon2, dlon) = (lat1?, lat2?, dlat?, lon1?, lon2?, dlon?);
    if dlat == 0.0 || dlon == 0.0 {
        return None;
    }
    let n_lat = ((lat2 - lat1) / dlat).round() as i64 + 1;
    let n_lon = ((lon2 - lon1) / dlon).round() as i64 + 1;
    if n_lat < 2 || n_lon < 2 {
        return None;
    }
    let (n_lat, n_lon) = (n_lat as usize, n_lon as usize);
    let scale = 10f64.ppowi(exponent);

    let mut maps = Vec::new();
    let mut in_map = false;
    let mut in_band = false;
    let mut epoch_sod = 0.0;
    let mut vals: Vec<f64> = Vec::new();
    for line in lines {
        match ionex_label(line) {
            "START OF TEC MAP" => {
                in_map = true;
                in_band = false;
                vals.clear();
            }
            "EPOCH OF CURRENT MAP" => {
                let e = nums_before_label(line);
                let h = e.get(3).copied().unwrap_or(0.0);
                let m = e.get(4).copied().unwrap_or(0.0);
                let s = e.get(5).copied().unwrap_or(0.0);
                epoch_sod = h * 3600.0 + m * 60.0 + s;
            }
            "LAT/LON1/LON2/DLON/H" => in_band = true,
            "END OF TEC MAP" => {
                if vals.len() != n_lat * n_lon {
                    return None;
                }
                let grid = build_grid(lat1, lat2, dlat, lon1, dlon, n_lat, n_lon, &vals);
                maps.push(IonexMap { epoch_sod, grid });
                in_map = false;
                in_band = false;
            }
            "" if in_map && in_band => {
                for t in nums_before_label(line) {
                    vals.push(t * scale);
                }
            }
            // A full value record (16 I5 fields) fills columns 1-80, so its column-61
            // "label" holds the last four values. Read such a record whole. Only a record
            // whose label field is entirely numeric qualifies, so a textual label stays
            // ignored as before.
            lab if in_map && in_band && is_numeric_label(lab) => {
                for t in line
                    .split_whitespace()
                    .filter_map(|t| t.parse::<f64>().ok())
                {
                    vals.push(t * scale);
                }
            }
            _ => {}
        }
    }
    Some(maps)
}

/// True when every whitespace-separated token of a record's label field parses as a number:
/// the tail of a full IONEX value record rather than a label.
fn is_numeric_label(label: &str) -> bool {
    !label.is_empty() && label.split_whitespace().all(|t| t.parse::<f64>().is_ok())
}

/// Build a positive-step [`TecGrid`] from the file-order (north-to-south) value rows, reversing
/// the latitude rows when `DLAT` is negative so the stored grid runs south-to-north.
#[allow(clippy::too_many_arguments)]
fn build_grid(
    lat1: f64,
    lat2: f64,
    dlat: f64,
    lon1: f64,
    dlon: f64,
    n_lat: usize,
    n_lon: usize,
    vals: &[f64],
) -> TecGrid {
    let reverse = dlat < 0.0;
    let lat0 = if reverse { lat2 } else { lat1 };
    let mut vtec = vec![0.0; n_lat * n_lon];
    for (i, row) in vtec.chunks_mut(n_lon).enumerate() {
        let src = if reverse { n_lat - 1 - i } else { i };
        row.copy_from_slice(&vals[src * n_lon..src * n_lon + n_lon]);
    }
    TecGrid {
        lat0_deg: lat0,
        lon0_deg: lon1,
        dlat_deg: dlat.abs(),
        dlon_deg: dlon.abs(),
        n_lat,
        n_lon,
        vtec,
    }
}

/// Linearly interpolate the vertical TEC between two same-shaped maps at epochs `ta` and `tb`
/// to the query epoch `t` (clamped to `[ta, tb]`). Returns `None` if the grids differ in shape.
pub fn interpolate_tec_in_time(
    a: &TecGrid,
    b: &TecGrid,
    ta: f64,
    tb: f64,
    t: f64,
) -> Option<TecGrid> {
    if a.n_lat != b.n_lat || a.n_lon != b.n_lon || a.vtec.len() != b.vtec.len() {
        return None;
    }
    let w = if (tb - ta).abs() < 1e-12 {
        0.0
    } else {
        ((t - ta) / (tb - ta)).clamp(0.0, 1.0)
    };
    let vtec = a
        .vtec
        .iter()
        .zip(&b.vtec)
        .map(|(&x, &y)| x + (y - x) * w)
        .collect();
    Some(TecGrid { vtec, ..a.clone() })
}

/// Mean Earth radius used in the single-layer (thin-shell) ionosphere mapping (km).
pub const IONO_SHELL_RE_KM: f64 = 6371.0;

/// Single-layer (thin-shell) **obliquity / mapping factor** `M(z) = 1/cos(z′)` that converts a
/// vertical delay to the slant delay along a ray at zenith angle `zenith_deg`, with the
/// ionospheric shell at `iono_height_km`. The ray pierces the shell at the reduced zenith angle
/// `z′` where `sin z′ = (Rₑ/(Rₑ+H))·sin z`. Unity at the zenith, growing toward the horizon.
pub fn obliquity_factor(zenith_deg: f64, iono_height_km: f64) -> f64 {
    let z = zenith_deg.to_radians();
    let ratio = IONO_SHELL_RE_KM / (IONO_SHELL_RE_KM + iono_height_km);
    let sin_zp = (ratio * z.psin()).clamp(-1.0, 1.0);
    1.0 / sin_zp.pasin().pcos()
}

/// Slant TEC (TECU) along a ray: the vertical TEC scaled by the [`obliquity_factor`].
pub fn slant_tec(vtec_tecu: f64, zenith_deg: f64, iono_height_km: f64) -> f64 {
    vtec_tecu * obliquity_factor(zenith_deg, iono_height_km)
}

// ── Full IONEX file reader: header, absolute map epochs, strict I5 values, time modes ─────

/// A civil epoch as printed in an IONEX record (`EPOCH OF FIRST MAP`, `EPOCH OF CURRENT MAP`).
#[derive(Clone, Copy, Debug, PartialEq)]
pub struct IonexEpoch {
    /// Year (four digits; a two-digit year is not accepted).
    pub year: i32,
    /// Month 1-12.
    pub month: u32,
    /// Day of month.
    pub day: u32,
    /// Hour (24 is allowed by the arithmetic, IONEX writes the next day's 0 instead).
    pub hour: u32,
    /// Minute.
    pub minute: u32,
    /// Second.
    pub second: f64,
}

impl IonexEpoch {
    /// Days since 1970-01-01 of the civil date (proleptic Gregorian).
    fn days_from_epoch(&self) -> i64 {
        let (y, m, d) = (self.year as i64, self.month as i64, self.day as i64);
        let y = if m <= 2 { y - 1 } else { y };
        let era = y.div_euclid(400);
        let yoe = y - era * 400;
        let mp = (m + 9) % 12;
        let doy = (153 * mp + 2) / 5 + d - 1;
        let doe = yoe * 365 + yoe / 4 - yoe / 100 + doy;
        era * 146_097 + doe - 719_468
    }

    /// Seconds from 00:00:00 of `reference`'s civil day to this epoch (same time scale).
    pub fn seconds_since_day_of(&self, reference: &IonexEpoch) -> f64 {
        let days = self.days_from_epoch() - reference.days_from_epoch();
        days as f64 * 86_400.0 + self.hour as f64 * 3600.0 + self.minute as f64 * 60.0 + self.second
    }
}

/// The IONEX header records [`parse_ionex_file`] reads.
#[derive(Clone, Debug)]
pub struct IonexHeader {
    /// `IONEX VERSION / TYPE` version number.
    pub version: f64,
    /// `EPOCH OF FIRST MAP`.
    pub first_epoch: IonexEpoch,
    /// `EPOCH OF LAST MAP`.
    pub last_epoch: IonexEpoch,
    /// `INTERVAL` (s); 0 when the file declares a variable interval.
    pub interval_s: f64,
    /// `# OF MAPS IN FILE`.
    pub n_maps: usize,
    /// `MAPPING FUNCTION` (e.g. `NONE`, `COSZ`, `QFAC`).
    pub mapping_function: String,
    /// `BASE RADIUS` (km).
    pub base_radius_km: f64,
    /// `HGT1 / HGT2 / DHGT` (km).
    pub hgt_km: [f64; 3],
    /// `LAT1 / LAT2 / DLAT` (deg).
    pub lat_deg: [f64; 3],
    /// `LON1 / LON2 / DLON` (deg).
    pub lon_deg: [f64; 3],
    /// Default `EXPONENT` (a map may override it with its own `EXPONENT` record).
    pub exponent: i32,
}

/// One map of an IONEX file read by [`parse_ionex_file`].
#[derive(Clone, Debug)]
pub struct IonexFileMap {
    /// 1-based map index from `START OF TEC MAP` / `START OF RMS MAP`.
    pub index: usize,
    /// `EPOCH OF CURRENT MAP`.
    pub epoch: IonexEpoch,
    /// Seconds from 00:00:00 of the first map's civil day (the 24:00 map of a daily file
    /// reads 86400, not 0).
    pub t_s: f64,
    /// The exponent the map's values were scaled with.
    pub exponent: i32,
    /// The grid (TECU), stored south-to-north with positive steps as [`TecGrid`] requires.
    /// A printed `9999` (no value) is stored as NaN.
    pub grid: TecGrid,
    /// Number of nodes printed as `9999`.
    pub missing: usize,
}

/// Time interpolation between IONEX maps, after the IONEX 1.0 format description
/// (Schaer, Gurtner and Feltens, 1998, section "Interpolation").
#[derive(Clone, Copy, Debug, PartialEq, Eq)]
pub enum IonexTimeInterp {
    /// The map nearest in time (equation 1).
    Nearest,
    /// Linear between the two consecutive maps (equation 2); the same arithmetic as
    /// [`interpolate_tec_in_time`].
    Consecutive,
    /// Linear between the two consecutive maps, each read at the longitude rotated by the
    /// Earth's rotation since its epoch, `λ'ᵢ = λ + 360°·(t − Tᵢ)/86400 s` (equation 3, the
    /// format's recommendation).
    RotatedConsecutive,
}

/// A parsed IONEX file: the header, the TEC maps and the RMS maps.
#[derive(Clone, Debug)]
pub struct IonexFile {
    /// Header records.
    pub header: IonexHeader,
    /// TEC maps in file order.
    pub tec_maps: Vec<IonexFileMap>,
    /// RMS maps in file order (empty when the file has none).
    pub rms_maps: Vec<IonexFileMap>,
}

/// Fixed-column field `[a, b)` of a record, empty when the record is shorter.
fn col(line: &str, a: usize, b: usize) -> &str {
    let b = b.min(line.len());
    if a >= b {
        ""
    } else {
        line.get(a..b).unwrap_or("")
    }
}

fn need<T>(o: Option<T>, what: &str) -> Result<T, String> {
    o.ok_or_else(|| format!("missing {what}"))
}

fn f64_field(line: &str, a: usize, b: usize, what: &str) -> Result<f64, String> {
    col(line, a, b)
        .trim()
        .parse()
        .map_err(|_| format!("{what}: bad number in {:?}", col(line, a, b)))
}

fn epoch_record(line: &str, what: &str) -> Result<IonexEpoch, String> {
    let f = |k: usize| f64_field(line, 6 * k, 6 * k + 6, what);
    let year = f(0)? as i32;
    if year < 1000 {
        return Err(format!("{what}: two-digit year {year}"));
    }
    Ok(IonexEpoch {
        year,
        month: f(1)? as u32,
        day: f(2)? as u32,
        hour: f(3)? as u32,
        minute: f(4)? as u32,
        second: f(5)?,
    })
}

/// Parse an IONEX 1.0 file strictly by its fixed columns: header records (`EPOCH OF FIRST /
/// LAST MAP`, `INTERVAL`, `# OF MAPS IN FILE`, `MAPPING FUNCTION`, `BASE RADIUS`, `HGT1 / HGT2
/// / DHGT`, `LAT1 / LAT2 / DLAT`, `LON1 / LON2 / DLON`, `EXPONENT`), then every TEC and RMS
/// map with its epoch as seconds from the first map's civil day, a per-map `EXPONENT` override,
/// the band records checked against the header grid, and the values read as 16 `I5` fields per
/// record (so adjacent fields such as `  123-9999` are split correctly; `9999` becomes NaN).
/// Height-dependent (3-D) maps (`DHGT ≠ 0`) are refused. The header's map count is checked.
///
/// Additive to [`parse_ionex`], which keeps its seconds-of-day epochs.
pub fn parse_ionex_file(text: &str) -> Result<IonexFile, String> {
    let mut lines = text.lines();
    let mut version = None;
    let mut first = None;
    let mut last = None;
    let mut interval = None;
    let mut n_maps = None;
    let mut mapping = String::new();
    let mut base_radius = None;
    let mut hgt = None;
    let mut lat = None;
    let mut lon = None;
    let mut exponent = -1;
    let mut header_done = false;
    for line in lines.by_ref() {
        let three = |what: &str| -> Result<[f64; 3], String> {
            Ok([
                f64_field(line, 2, 8, what)?,
                f64_field(line, 8, 14, what)?,
                f64_field(line, 14, 20, what)?,
            ])
        };
        match ionex_label(line) {
            "IONEX VERSION / TYPE" => version = Some(f64_field(line, 0, 8, "version")?),
            "EPOCH OF FIRST MAP" => first = Some(epoch_record(line, "EPOCH OF FIRST MAP")?),
            "EPOCH OF LAST MAP" => last = Some(epoch_record(line, "EPOCH OF LAST MAP")?),
            "INTERVAL" => interval = Some(f64_field(line, 0, 6, "INTERVAL")?),
            "# OF MAPS IN FILE" => n_maps = Some(f64_field(line, 0, 6, "# OF MAPS")? as usize),
            "MAPPING FUNCTION" => mapping = col(line, 0, 60).trim().to_string(),
            "BASE RADIUS" => base_radius = Some(f64_field(line, 0, 8, "BASE RADIUS")?),
            "HGT1 / HGT2 / DHGT" => hgt = Some(three("HGT1 / HGT2 / DHGT")?),
            "LAT1 / LAT2 / DLAT" => lat = Some(three("LAT1 / LAT2 / DLAT")?),
            "LON1 / LON2 / DLON" => lon = Some(three("LON1 / LON2 / DLON")?),
            "EXPONENT" => exponent = f64_field(line, 0, 6, "EXPONENT")? as i32,
            "END OF HEADER" => {
                header_done = true;
                break;
            }
            _ => {}
        }
    }
    if !header_done {
        return Err("no END OF HEADER".into());
    }
    let header = IonexHeader {
        version: need(version, "IONEX VERSION / TYPE")?,
        first_epoch: need(first, "EPOCH OF FIRST MAP")?,
        last_epoch: need(last, "EPOCH OF LAST MAP")?,
        interval_s: interval.unwrap_or(0.0),
        n_maps: need(n_maps, "# OF MAPS IN FILE")?,
        mapping_function: mapping,
        base_radius_km: need(base_radius, "BASE RADIUS")?,
        hgt_km: need(hgt, "HGT1 / HGT2 / DHGT")?,
        lat_deg: need(lat, "LAT1 / LAT2 / DLAT")?,
        lon_deg: need(lon, "LON1 / LON2 / DLON")?,
        exponent,
    };
    let [lat1, lat2, dlat] = header.lat_deg;
    let [lon1, lon2, dlon] = header.lon_deg;
    if header.hgt_km[2] != 0.0 {
        return Err("height-dependent (3-D) IONEX maps are not supported".into());
    }
    if dlat == 0.0 || dlon == 0.0 {
        return Err("zero grid step".into());
    }
    let n_lat = ((lat2 - lat1) / dlat).round() as i64 + 1;
    let n_lon = ((lon2 - lon1) / dlon).round() as i64 + 1;
    if n_lat < 2 || n_lon < 2 {
        return Err("grid needs at least 2 x 2 nodes".into());
    }
    let (n_lat, n_lon) = (n_lat as usize, n_lon as usize);
    let n_rec = n_lon.div_ceil(16);

    let mut tec_maps = Vec::new();
    let mut rms_maps = Vec::new();
    let mut lines = lines.peekable();
    while let Some(line) = lines.next() {
        let (is_tec, end_label) = match ionex_label(line) {
            "START OF TEC MAP" => (true, "END OF TEC MAP"),
            "START OF RMS MAP" => (false, "END OF RMS MAP"),
            _ => continue,
        };
        let index = f64_field(line, 0, 6, "map index")? as usize;
        let mut epoch = None;
        let mut map_exp = header.exponent;
        let mut vals: Vec<f64> = Vec::with_capacity(n_lat * n_lon);
        let mut missing = 0usize;
        let mut band = 0usize;
        loop {
            let rec = lines
                .next()
                .ok_or_else(|| format!("map {index}: no {end_label}"))?;
            match ionex_label(rec) {
                "EPOCH OF CURRENT MAP" => epoch = Some(epoch_record(rec, "EPOCH OF CURRENT MAP")?),
                "EXPONENT" => map_exp = f64_field(rec, 0, 6, "EXPONENT")? as i32,
                "LAT/LON1/LON2/DLON/H" => {
                    let band_lat = f64_field(rec, 2, 8, "band latitude")?;
                    let want = lat1 + band as f64 * dlat;
                    if (band_lat - want).abs() > 1e-6 {
                        return Err(format!(
                            "map {index}: band {band} latitude {band_lat}, header grid {want}"
                        ));
                    }
                    let b_lon1 = f64_field(rec, 8, 14, "band LON1")?;
                    let b_lon2 = f64_field(rec, 14, 20, "band LON2")?;
                    let b_dlon = f64_field(rec, 20, 26, "band DLON")?;
                    if (b_lon1 - lon1).abs() > 1e-6
                        || (b_lon2 - lon2).abs() > 1e-6
                        || (b_dlon - dlon).abs() > 1e-6
                    {
                        return Err(format!("map {index}: band {band} longitudes differ"));
                    }
                    let scale = 10f64.powi(map_exp);
                    for r in 0..n_rec {
                        let vrec = lines
                            .next()
                            .ok_or_else(|| format!("map {index}: band {band} truncated"))?;
                        let n = (n_lon - 16 * r).min(16);
                        for k in 0..n {
                            let v = f64_field(vrec, 5 * k, 5 * k + 5, "I5 value")?;
                            if v == 9999.0 {
                                missing += 1;
                                vals.push(f64::NAN);
                            } else {
                                vals.push(v * scale);
                            }
                        }
                    }
                    band += 1;
                }
                l if l == end_label => break,
                _ => {}
            }
        }
        if band != n_lat || vals.len() != n_lat * n_lon {
            return Err(format!(
                "map {index}: {band} bands, header grid has {n_lat}"
            ));
        }
        let epoch = epoch.ok_or_else(|| format!("map {index}: no EPOCH OF CURRENT MAP"))?;
        let t_s = epoch.seconds_since_day_of(&header.first_epoch);
        let grid = build_grid(lat1, lat2, dlat, lon1, dlon, n_lat, n_lon, &vals);
        let map = IonexFileMap {
            index,
            epoch,
            t_s,
            exponent: map_exp,
            grid,
            missing,
        };
        if is_tec {
            tec_maps.push(map);
        } else {
            rms_maps.push(map);
        }
    }
    if tec_maps.len() != header.n_maps {
        return Err(format!(
            "{} TEC maps, header # OF MAPS IN FILE {}",
            tec_maps.len(),
            header.n_maps
        ));
    }
    if tec_maps.windows(2).any(|w| w[1].t_s <= w[0].t_s) {
        return Err("TEC map epochs not increasing".into());
    }
    Ok(IonexFile {
        header,
        tec_maps,
        rms_maps,
    })
}

impl IonexFile {
    /// Whether the grid spans the full 360° of longitude (so a rotated longitude wraps).
    fn is_global_in_longitude(&self) -> bool {
        let [lon1, lon2, _] = self.header.lon_deg;
        ((lon2 - lon1).abs() - 360.0).abs() < 1e-9
    }

    /// Wrap a longitude into `[LON1, LON1 + 360)` on a global grid; unchanged otherwise
    /// (the bilinear step then clamps to the grid edge).
    fn wrap_lon(&self, lon_deg: f64) -> f64 {
        if !self.is_global_in_longitude() {
            return lon_deg;
        }
        let lo = self.header.lon_deg[0].min(self.header.lon_deg[1]);
        lo + (lon_deg - lo).rem_euclid(360.0)
    }

    /// Vertical TEC (TECU) at `t_s` (seconds from 00:00 of the first map's day), geocentric
    /// latitude and longitude (deg), interpolated bilinearly in space ([`TecGrid::vtec_at`],
    /// the format's 4-point formula) and in time by `mode`. `None` outside the span of the
    /// maps (no extrapolation in time) or with fewer than two maps for the linear modes.
    pub fn vtec_at(
        &self,
        t_s: f64,
        lat_deg: f64,
        lon_deg: f64,
        mode: IonexTimeInterp,
    ) -> Option<f64> {
        let maps = &self.tec_maps;
        let first = maps.first()?;
        let last = maps.last()?;
        if !(t_s >= first.t_s && t_s <= last.t_s) {
            return None;
        }
        if mode == IonexTimeInterp::Nearest {
            let m = maps
                .iter()
                .min_by(|a, b| (a.t_s - t_s).abs().total_cmp(&(b.t_s - t_s).abs()))?;
            return Some(m.grid.vtec_at(lat_deg, self.wrap_lon(lon_deg)));
        }
        if maps.len() < 2 {
            return None;
        }
        let mut i = 0;
        while i + 2 < maps.len() && maps[i + 1].t_s <= t_s {
            i += 1;
        }
        let (a, b) = (&maps[i], &maps[i + 1]);
        let (la, lb) = match mode {
            IonexTimeInterp::RotatedConsecutive => (
                self.wrap_lon(lon_deg + 360.0 * (t_s - a.t_s) / 86_400.0),
                self.wrap_lon(lon_deg + 360.0 * (t_s - b.t_s) / 86_400.0),
            ),
            _ => (self.wrap_lon(lon_deg), self.wrap_lon(lon_deg)),
        };
        let ea = a.grid.vtec_at(lat_deg, la);
        let eb = b.grid.vtec_at(lat_deg, lb);
        let span = b.t_s - a.t_s;
        Some((b.t_s - t_s) / span * ea + (t_s - a.t_s) / span * eb)
    }

    /// Slant TEC (TECU) along a ray at `zenith_deg` through the pierce point: [`Self::vtec_at`]
    /// times the thin-shell [`obliquity_factor`] at the header's shell height `HGT1`
    /// (Earth radius [`IONO_SHELL_RE_KM`]).
    pub fn slant_tec_at(
        &self,
        t_s: f64,
        lat_deg: f64,
        lon_deg: f64,
        zenith_deg: f64,
        mode: IonexTimeInterp,
    ) -> Option<f64> {
        let v = self.vtec_at(t_s, lat_deg, lon_deg, mode)?;
        Some(slant_tec(v, zenith_deg, self.header.hgt_km[0]))
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    fn grid() -> TecGrid {
        // 3×3 grid from (0°,0°) at 10° spacing; TEC = 10·i + j (so nodes are distinct).
        let mut vtec = Vec::new();
        for i in 0..3 {
            for j in 0..3 {
                vtec.push(10.0 * i as f64 + j as f64);
            }
        }
        TecGrid {
            lat0_deg: 0.0,
            lon0_deg: 0.0,
            dlat_deg: 10.0,
            dlon_deg: 10.0,
            n_lat: 3,
            n_lon: 3,
            vtec,
        }
    }

    #[test]
    fn delay_is_40_3_tec_over_f_squared() {
        // 1 TECU at L1 ≈ 0.16237 m; the delay scales as 1/f² (L2 is larger than L1).
        let l1 = vtec_to_delay_m(1.0, GPS_L1_HZ);
        assert!((l1 - 0.162_37).abs() < 1e-4, "L1 delay = {l1} m");
        let l2 = vtec_to_delay_m(1.0, GPS_L2_HZ);
        assert!((l2 / l1 - (GPS_L1_HZ / GPS_L2_HZ).ppowi(2)).abs() < 1e-9);
        assert!(l2 > l1, "L2 delay {l2} should exceed L1 {l1}");
        // Linear in TEC.
        assert!((vtec_to_delay_m(10.0, GPS_L1_HZ) - 10.0 * l1).abs() < 1e-12);
    }

    #[test]
    fn interpolation_is_exact_at_nodes() {
        let g = grid();
        assert!((g.vtec_at(0.0, 0.0) - 0.0).abs() < 1e-12);
        assert!((g.vtec_at(10.0, 20.0) - 12.0).abs() < 1e-12); // node (1,2) = 10·1+2
        assert!((g.vtec_at(20.0, 10.0) - 21.0).abs() < 1e-12);
    }

    #[test]
    fn bilinear_midpoints_average_the_corners() {
        let g = grid();
        // Cell-centre of the (0,0)-(1,1) cell: average of nodes 0,1,10,11 = 5.5.
        assert!(
            (g.vtec_at(5.0, 5.0) - 5.5).abs() < 1e-12,
            "centre = {}",
            g.vtec_at(5.0, 5.0)
        );
        // Edge midpoint between nodes (0,0)=0 and (0,1)=1 → 0.5.
        assert!((g.vtec_at(0.0, 5.0) - 0.5).abs() < 1e-12);
    }

    #[test]
    fn queries_outside_the_grid_clamp_to_the_edge() {
        let g = grid();
        // Far south-west clamps to node (0,0).
        assert!((g.vtec_at(-90.0, -90.0) - 0.0).abs() < 1e-12);
        // Far north-east clamps to node (2,2) = 22.
        assert!((g.vtec_at(90.0, 90.0) - 22.0).abs() < 1e-12);
        // delay_at composes cleanly without panicking.
        assert!(g.delay_at(5.0, 5.0, GPS_L1_HZ) > 0.0);
    }

    // Build an IONEX record line: data in the first 60 columns, label from column 60.
    fn rec(data: &str, label: &str) -> String {
        format!("{data:<60}{label}")
    }

    // A minimal but format-valid IONEX: a 3×4 grid (lat 10/0/−10 north-to-south, dlat −10;
    // lon 0…30, dlon 10), EXPONENT −1, one map at 02:00:00 with TEC in 0.1-TECU integers.
    fn sample_ionex() -> String {
        [
            rec("1.0    IONOSPHERE MAPS     GPS", "IONEX VERSION / TYPE"),
            rec("10.0 -10.0 -10.0", "LAT1 / LAT2 / DLAT"),
            rec("0.0 30.0 10.0", "LON1 / LON2 / DLON"),
            rec("-1", "EXPONENT"),
            rec("", "END OF HEADER"),
            rec("1", "START OF TEC MAP"),
            rec("2020 1 1 2 0 0", "EPOCH OF CURRENT MAP"),
            rec("10.0 0.0 30.0 10.0 450.0", "LAT/LON1/LON2/DLON/H"),
            rec("100 110 120 130", ""),
            rec("0.0 0.0 30.0 10.0 450.0", "LAT/LON1/LON2/DLON/H"),
            rec("200 210 220 230", ""),
            rec("-10.0 0.0 30.0 10.0 450.0", "LAT/LON1/LON2/DLON/H"),
            rec("300 310 320 330", ""),
            rec("1", "END OF TEC MAP"),
        ]
        .join("\n")
    }

    #[test]
    fn a_character_straddling_column_60_is_ignored_not_a_panic() {
        // IONEX is fixed-column ASCII, but a DESCRIPTION or COMMENT block can
        // carry off-spec free text. A multi-byte character sitting across byte 60
        // used to panic out of a function whose contract is `Option`. Two
        // independent sites had to be fixed: the header loop reaches
        // `nums_before_label` first, the post-END-OF-HEADER map loop reaches
        // `ionex_label` first.
        let straddle = format!("{}\u{00b5}  EPOCH OF CURRENT MAP", "1".repeat(59));
        // A: inside the header.
        let header_hit = sample_ionex().replacen(
            &rec("-1", "EXPONENT"),
            &format!("{}\n{straddle}", rec("-1", "EXPONENT")),
            1,
        );
        assert!(parse_ionex(&header_hit).is_some(), "header straddle");
        // B: inside the map body.
        let body_hit = sample_ionex().replacen(
            &rec("100 110 120 130", ""),
            &format!("{straddle}\n{}", rec("100 110 120 130", "")),
            1,
        );
        assert!(parse_ionex(&body_hit).is_some(), "map-body straddle");
        // The two helpers degrade rather than panic: the label reads as absent,
        // so the line is ignored, and the numeric scan finds nothing to keep.
        assert_eq!(ionex_label(&straddle), "");
        assert!(nums_before_label(&straddle).is_empty());
    }

    #[test]
    fn parse_ionex_reads_grid_epoch_and_normalises_latitude() {
        let maps = parse_ionex(&sample_ionex()).expect("valid IONEX");
        assert_eq!(maps.len(), 1);
        assert_eq!(maps[0].epoch_sod, 2.0 * 3600.0);
        let g = &maps[0].grid;
        assert_eq!((g.n_lat, g.n_lon), (3, 4));
        // Stored south-to-north with positive steps despite the file's negative DLAT.
        assert_eq!(g.lat0_deg, -10.0);
        assert_eq!(g.dlat_deg, 10.0);
        // Values scaled by 10^−1. The northern row (lat 10) is the file's first band.
        assert!((g.vtec_at(10.0, 20.0) - 12.0).abs() < 1e-12); // 120 × 0.1
        assert!((g.vtec_at(-10.0, 0.0) - 30.0).abs() < 1e-12); // 300 × 0.1
        assert!((g.vtec_at(0.0, 10.0) - 21.0).abs() < 1e-12); // 210 × 0.1
    }

    #[test]
    fn time_interpolation_blends_successive_maps() {
        let a = grid(); // nodes 0..22
        let mut b = grid();
        for v in b.vtec.iter_mut() {
            *v += 10.0; // a uniformly higher map two hours later
        }
        // Halfway between the two epochs ⇒ the average of the two maps.
        let mid = interpolate_tec_in_time(&a, &b, 0.0, 7200.0, 3600.0).expect("same shape");
        assert!((mid.vtec_at(10.0, 10.0) - (11.0 + 21.0) / 2.0).abs() < 1e-12);
        // Clamped before the first / after the last epoch.
        let before = interpolate_tec_in_time(&a, &b, 0.0, 7200.0, -100.0).unwrap();
        assert!((before.vtec_at(10.0, 10.0) - 11.0).abs() < 1e-12);
    }

    // A strict IONEX with full 80-column value records: 2 bands x 19 longitudes (two value
    // records per band), EXPONENT -1, two maps on consecutive days' 23:00 / 24:00.
    fn strict_ionex(second_row: &str) -> String {
        let row = |a: i32| -> String {
            let v: Vec<String> = (0..19).map(|k| format!("{:5}", a + k)).collect();
            format!("{}\n{}", v[..16].concat(), v[16..].concat())
        };
        let band = |lat: &str| {
            rec(
                &format!("  {lat}-180.0 180.0  20.0 450.0"),
                "LAT/LON1/LON2/DLON/H",
            )
        };
        let mut l = vec![
            rec(
                "     1.0            IONOSPHERE MAPS     GPS",
                "IONEX VERSION / TYPE",
            ),
            rec("  2018     5    13    23     0     0", "EPOCH OF FIRST MAP"),
            rec("  2018     5    14     0     0     0", "EPOCH OF LAST MAP"),
            rec("  3600", "INTERVAL"),
            rec("     2", "# OF MAPS IN FILE"),
            rec("  NONE", "MAPPING FUNCTION"),
            rec("  6371.0", "BASE RADIUS"),
            rec("   450.0 450.0   0.0", "HGT1 / HGT2 / DHGT"),
            rec("    10.0   0.0 -10.0", "LAT1 / LAT2 / DLAT"),
            rec("  -180.0 180.0  20.0", "LON1 / LON2 / DLON"),
            rec("    -1", "EXPONENT"),
            rec("", "END OF HEADER"),
        ];
        for (k, ep) in [
            (1, "  2018     5    13    23     0     0"),
            (2, "  2018     5    14     0     0     0"),
        ] {
            l.push(rec(&format!("{k:6}"), "START OF TEC MAP"));
            l.push(rec(ep, "EPOCH OF CURRENT MAP"));
            l.push(band("  10.0"));
            l.push(row(100 * k));
            l.push(band("   0.0"));
            l.push(if k == 2 {
                second_row.to_string()
            } else {
                row(200)
            });
            l.push(rec(&format!("{k:6}"), "END OF TEC MAP"));
        }
        l.join("\n")
    }

    #[test]
    fn parse_ionex_file_reads_full_records_absolute_epochs_and_missing_values() {
        // Map 2's southern band: an I5 9999 (missing) and a negative value packed against it.
        let mut v: Vec<String> = (0..19).map(|k| format!("{:5}", 300 + k)).collect();
        v[3] = " 9999".into();
        v[4] = "-1234".into();
        let second = format!("{}\n{}", v[..16].concat(), v[16..].concat());
        let f = parse_ionex_file(&strict_ionex(&second)).expect("valid");
        assert_eq!(f.tec_maps.len(), 2);
        assert_eq!(f.tec_maps[0].t_s, 23.0 * 3600.0);
        assert_eq!(f.tec_maps[1].t_s, 86_400.0); // not 0: the next civil day
        let g = &f.tec_maps[1].grid;
        assert_eq!((g.n_lat, g.n_lon), (2, 19));
        assert!((g.node(1, 18) - 21.8).abs() < 1e-12); // northern band, last of the second record
        assert!(g.node(0, 3).is_nan());
        assert!((g.node(0, 4) + 123.4).abs() < 1e-12);
        assert_eq!(f.tec_maps[1].missing, 1);
        // The legacy reader also reads full 80-column records now (it used to drop them).
        let legacy = parse_ionex(&strict_ionex(&second.replace(" 9999-1234", "  303  304")));
        let legacy = legacy.expect("full records parse");
        assert_eq!(legacy[1].epoch_sod, 0.0); // seconds of day, unchanged
        assert!((legacy[0].grid.node(1, 18) - 11.8).abs() < 1e-12);
        // Header failures are reported, not panics.
        let three_d = strict_ionex(&second).replace("   450.0 450.0   0.0", "   450.0 650.0 100.0");
        assert!(parse_ionex_file(&three_d).unwrap_err().contains("3-D"));
        let yy =
            strict_ionex(&second).replace("  2018     5    13    23", "    18     5    13    23");
        assert!(parse_ionex_file(&yy).unwrap_err().contains("two-digit"));
    }

    #[test]
    fn rotated_time_interpolation_wraps_the_longitude() {
        let f = parse_ionex_file(&strict_ionex(&format!(
            "{}\n{}",
            (0..16)
                .map(|k| format!("{:5}", 300 + k))
                .collect::<String>(),
            "  316  317  318"
        )))
        .unwrap();
        let t = 23.5 * 3600.0;
        // Map 1 is read 7.5 deg east, map 2 7.5 deg west; -180 + -7.5 wraps to 172.5.
        let a = f.tec_maps[0].grid.vtec_at(0.0, -172.5);
        let b = f.tec_maps[1].grid.vtec_at(0.0, 172.5);
        let v = f
            .vtec_at(t, 0.0, -180.0, IonexTimeInterp::RotatedConsecutive)
            .unwrap();
        assert!(
            (v - 0.5 * (a + b)).abs() < 1e-12,
            "{v} vs {}",
            0.5 * (a + b)
        );
        let c = f
            .vtec_at(t, 0.0, -180.0, IonexTimeInterp::Consecutive)
            .unwrap();
        let mid = 0.5 * (f.tec_maps[0].grid.node(0, 0) + f.tec_maps[1].grid.node(0, 0));
        assert!((c - mid).abs() < 1e-12);
    }

    #[test]
    fn obliquity_maps_vertical_to_slant() {
        // A ray straight up sees the vertical TEC unchanged; a low ray sees more.
        assert!((obliquity_factor(0.0, 350.0) - 1.0).abs() < 1e-12);
        let m60 = obliquity_factor(60.0, 350.0);
        assert!(m60 > 1.0, "M(60°) = {m60}");
        assert!((slant_tec(10.0, 60.0, 350.0) - 10.0 * m60).abs() < 1e-12);
        // The reduced zenith angle keeps the factor finite even near the horizon.
        assert!(obliquity_factor(89.0, 350.0).is_finite());
    }
}
