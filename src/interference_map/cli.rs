// SPDX-License-Identifier: AGPL-3.0-only
//! `kshana interference-map` and `kshana route-exposure`.
//!
//! Inputs are local files in the formats of `docs/INTERFERENCE-MAP.md`. The only command
//! that can touch the network is `interference-map fetch-land`, and only with the explicit
//! `--allow-network` flag.

use std::path::{Path, PathBuf};

use super::adsb::{self, AdsbAggregator, AdsbParams};
use super::ais::{self, AisAggregator, AisParams};
use super::api;
use super::grid::{Grid, PREREGISTERED_CELL_DEG};
use super::land::LandMask;
use super::output::{file_name, to_geojson};
use super::route;
use super::sources::{Dataset, Kind};
use super::time::parse_day;
use super::{IdHasher, MapError};

/// Usage text for `kshana interference-map`.
pub fn map_usage() -> String {
    crate::t!("interference-map-cli-usage-map", lit_0_5 = crate::i18n::num(0.5_f64, 1))
}

/// Usage text for `kshana route-exposure`.
pub fn route_usage() -> String {
    crate::t!("interference-map-cli-usage-route")
}

/// Natural Earth land polygons (public domain), the intended coastline for the AIS detector.
/// The URL names one commit of the upstream repository, and the download is checked against
/// the SHA-256 below before it is kept, so the file cannot change under the command.
pub const NATURAL_EARTH_LAND_URL: &str = "https://raw.githubusercontent.com/nvkelso/natural-earth-vector/ca96624a56bd078437bca8184e78163e5039ad19/geojson/ne_10m_land.geojson";
// PIN-SCOPE:    the SHA-256 of every byte of the Natural Earth land file at the commit named in the URL above
// PIN-EXCLUDES: nothing; any change to the file or to the commit fails the download check by design
/// The SHA-256 the downloaded land file must have (lowercase hex).
pub const NATURAL_EARTH_LAND_SHA256: &str =
    "1ac90796408bc6ad6911d69448485d3c4dbf2190370080368a09976e1c9f7416";

use super::api::MAX_TRACE_BYTES;

pub(super) fn flag_value<'a>(args: &'a [String], name: &str) -> Result<Option<&'a str>, MapError> {
    match args.iter().position(|a| a == name) {
        None => Ok(None),
        Some(i) => args.get(i + 1).map(|v| Some(v.as_str())).ok_or_else(|| {
            MapError::Format(crate::terr!("e-evidence-cli-needs-value", name = name))
        }),
    }
}

fn flag_values<'a>(args: &'a [String], name: &str) -> Vec<&'a str> {
    args.windows(2)
        .filter(|w| w[0] == name)
        .map(|w| w[1].as_str())
        .collect()
}

/// Every argument must be a known flag (with a value), a known switch, or the one positional.
pub(super) fn check_args(
    args: &[String],
    valued: &[&str],
    switches: &[&str],
    positionals: usize,
) -> Result<(), MapError> {
    let mut i = 0;
    let mut pos = 0;
    while i < args.len() {
        let a = args[i].as_str();
        if valued.contains(&a) {
            i += 2;
        } else if switches.contains(&a) {
            i += 1;
        } else if a.starts_with("--") {
            return Err(MapError::Format(crate::terr!(
                "e-interference-map-cli-unknown-option",
                a = a
            )));
        } else {
            pos += 1;
            i += 1;
        }
    }
    if pos != positionals {
        return Err(MapError::Format(crate::terr!(
            "e-interference-map-cli-expected-positional-argument-got",
            positionals = positionals,
            pos = pos
        )));
    }
    Ok(())
}

pub(super) fn read(path: &str) -> Result<String, MapError> {
    std::fs::read_to_string(path).map_err(|e| {
        MapError::Io(crate::terr!(
            "e-interference-map-cli-cannot-read",
            path = path,
            e = e
        ))
    })
}

pub(super) fn dataset_from(args: &[String], kind: Kind) -> Result<Dataset, MapError> {
    let key = flag_value(args, "--dataset")?.ok_or_else(|| {
        MapError::Format(crate::terr!(
            "e-interference-map-cli-dataset-is-required-so-the"
        ))
    })?;
    let spec = if key == "custom" {
        let need = |n: &str| {
            flag_value(args, n)?.ok_or_else(|| {
                MapError::Format(crate::terr!(
                    "e-interference-map-cli-dataset-custom-needs",
                    n = n
                ))
            })
        };
        api::DatasetSpec::Custom {
            licence: need("--licence")?,
            licence_url: need("--licence-url")?,
            attribution: need("--attribution")?,
        }
    } else {
        api::DatasetSpec::Preset(key)
    };
    api::resolve_dataset(&spec, kind)
}

fn grid_from(args: &[String]) -> Result<Grid, MapError> {
    let deg = match flag_value(args, "--cell-deg")? {
        None => 0.5,
        Some(s) => s.parse::<f64>().map_err(|_| {
            MapError::Format(crate::terr!(
                "e-interference-map-cli-cell-deg-is-not-number"
            ))
        })?,
    };
    Grid::new(deg).ok_or_else(|| {
        MapError::Format(crate::terr!(
            "e-interference-map-cli-cell-deg-must-be-between",
            lit_0_01 = crate::i18n::num(0.01_f64, 2)
        ))
    })
}

fn write_days(
    days: &[super::output::DayOut],
    grid: &Grid,
    method: &serde_json::Value,
    ds: &Dataset,
    out: &Path,
) -> Result<(), MapError> {
    use std::io::Write;
    // Refuse before writing anything: an existing file is never overwritten, so a map made
    // from one dataset cannot silently replace another's, or an earlier run's.
    let targets: Vec<PathBuf> = days
        .iter()
        .map(|d| out.join(file_name(d, &ds.key)))
        .collect();
    if let Some(existing) = targets.iter().find(|p| p.exists()) {
        return Err(MapError::Io(crate::terr!(
            "e-interference-map-cli-already-exists-kshana-does-not",
            existing = existing.display()
        )));
    }
    if grid.cell_deg != PREREGISTERED_CELL_DEG {
        eprintln!(
            "{}",
            crate::t!(
                "interference-map-cli-note-cell-deg-is-not",
                cell_deg = grid.cell_deg,
                PREREGISTERED_CELL_DEG = PREREGISTERED_CELL_DEG
            )
        );
    }
    std::fs::create_dir_all(out).map_err(|e| {
        MapError::Io(crate::terr!(
            "e-interference-map-cli-cannot-create",
            out = out.display(),
            e = e
        ))
    })?;
    for (d, path) in days.iter().zip(&targets) {
        let doc = to_geojson(d, grid, method.clone(), ds);
        let text =
            serde_json::to_string_pretty(&doc).map_err(|e| MapError::Format(e.to_string()))?;
        let mut f = std::fs::OpenOptions::new()
            .write(true)
            .create_new(true)
            .open(path)
            .map_err(|e| {
                MapError::Io(crate::terr!(
                    "e-evidence-cli-cannot-create",
                    path = path.display(),
                    e = e
                ))
            })?;
        f.write_all((text + "\n").as_bytes()).map_err(|e| {
            MapError::Io(crate::terr!(
                "e-evidence-cli-cannot-write",
                path = path.display(),
                e = e
            ))
        })?;
        let n_deg = d.cells.iter().filter(|c| c.degraded).count();
        println!(
            "{}",
            crate::t!(
                "interference-map-cli-wrote-cells-published-flagged",
                path = path.display(),
                cells = d.cells.len(),
                n_deg = n_deg
            )
        );
    }
    if days.is_empty() {
        println!(
            "{}",
            crate::t!("interference-map-cli-no-usable-rows-nothing-written")
        );
    }
    Ok(())
}

/// `kshana interference-map ...`; returns the process exit code.
pub fn run_map(args: &[String]) -> i32 {
    match run_map_inner(args) {
        Ok(()) => 0,
        Err(e) => {
            eprintln!("{}\n{}", crate::t!("main-fail", e = e), map_usage());
            2
        }
    }
}

fn run_map_inner(args: &[String]) -> Result<(), MapError> {
    let Some(sub) = args.first().map(String::as_str) else {
        return Err(MapError::Format(crate::terr!(
            "e-interference-map-cli-subcommand-is-required"
        )));
    };
    if matches!(sub, "--help" | "-h" | "help") {
        println!("{}", map_usage());
        return Ok(());
    }
    let rest = &args[1..];
    match sub {
        "adsb" => {
            let valued = [
                "--dataset",
                "--out",
                "--cell-deg",
                "--licence",
                "--licence-url",
                "--attribution",
            ];
            check_args(rest, &valued, &[], 1)?;
            let input = positional(rest, &valued).ok_or_else(|| {
                MapError::Format(crate::terr!("e-interference-map-cli-input-file-missing"))
            })?;
            let ds = dataset_from(rest, Kind::Adsb)?;
            let grid = grid_from(rest)?;
            let out = PathBuf::from(flag_value(rest, "--out")?.ok_or_else(|| {
                MapError::Format(crate::terr!("e-interference-map-cli-out-is-required"))
            })?);
            let mut agg = AdsbAggregator::new(grid, AdsbParams::PREREGISTERED_V1, IdHasher::new());
            read_adsb_input(&mut agg, Path::new(input))?;
            let stats = agg.stats.clone();
            let days = agg.finish();
            write_days(
                &days,
                &grid,
                &adsb::method_json(&AdsbParams::PREREGISTERED_V1, &stats),
                &ds,
                &out,
            )
        }
        "ais" => {
            let valued = [
                "--dataset",
                "--out",
                "--cell-deg",
                "--land",
                "--licence",
                "--licence-url",
                "--attribution",
            ];
            check_args(rest, &valued, &[], 1)?;
            let input = positional(rest, &valued).ok_or_else(|| {
                MapError::Format(crate::terr!("e-interference-map-cli-input-file-missing"))
            })?;
            let ds = dataset_from(rest, Kind::Ais)?;
            let grid = grid_from(rest)?;
            let out = PathBuf::from(flag_value(rest, "--out")?.ok_or_else(|| {
                MapError::Format(crate::terr!("e-interference-map-cli-out-is-required"))
            })?);
            let params = AisParams::PREREGISTERED_V1;
            let land = match flag_value(rest, "--land")? {
                Some(p) => Some(LandMask::from_geojson_str(&read(p)?, params.land_buffer_m)?),
                None => None,
            };
            let mut agg = AisAggregator::new(grid, params.clone(), IdHasher::new(), land);
            read_csv_file(|r| agg.read_csv_reader(r), Path::new(input))?;
            let (stats, land_on) = (agg.stats.clone(), agg.land_enabled());
            let days = agg.finish();
            write_days(
                &days,
                &grid,
                &ais::method_json(&params, &stats, land_on),
                &ds,
                &out,
            )
        }
        "daily" => super::observatory::run_daily(rest),
        "sensitivity" => super::observatory::run_sensitivity(rest),
        "fetch-land" => {
            check_args(rest, &["--out"], &["--allow-network"], 0)?;
            if !rest.iter().any(|a| a == "--allow-network") {
                return Err(MapError::Format(crate::terr!(
                    "e-interference-map-cli-fetch-land-downloads-file-pass"
                )));
            }
            let out = flag_value(rest, "--out")?.ok_or_else(|| {
                MapError::Format(crate::terr!("e-interference-map-cli-out-is-required"))
            })?;
            fetch_land(out)
        }
        other => Err(MapError::Format(crate::terr!(
            "e-interference-map-cli-unknown-subcommand",
            other = other
        ))),
    }
}

/// The one positional argument: the first argument that is neither a flag nor a flag's value.
pub(super) fn positional<'a>(args: &'a [String], valued: &[&str]) -> Option<&'a str> {
    let mut i = 0;
    while i < args.len() {
        let a = args[i].as_str();
        if valued.contains(&a) {
            i += 2;
        } else if a.starts_with("--") {
            i += 1;
        } else {
            return Some(a);
        }
    }
    None
}

/// SHA-256 of a file as lowercase hex.
pub(super) fn file_sha256(path: &Path) -> Result<String, MapError> {
    use sha2::{Digest, Sha256};
    use std::io::Read;
    let mut f = std::fs::File::open(path).map_err(|e| {
        MapError::Io(crate::terr!(
            "e-interference-map-cli-cannot-read",
            path = path.display(),
            e = e
        ))
    })?;
    let mut h = Sha256::new();
    let mut buf = [0u8; 64 * 1024];
    loop {
        let n = f.read(&mut buf).map_err(|e| {
            MapError::Io(crate::terr!(
                "e-interference-map-cli-cannot-read",
                path = path.display(),
                e = e
            ))
        })?;
        if n == 0 {
            break;
        }
        h.update(&buf[..n]);
    }
    Ok(hex::encode(h.finalize()))
}

/// Move `part` to `dest` only if its SHA-256 equals `expected`; otherwise delete it.
fn verify_and_keep(part: &Path, dest: &Path, expected: &str) -> Result<(), MapError> {
    let got = file_sha256(part)?;
    if got != expected {
        let _ = std::fs::remove_file(part);
        return Err(MapError::Io(crate::terr!(
            "e-interference-map-cli-the-downloaded-file-sha-256",
            got = got,
            expected = expected
        )));
    }
    std::fs::rename(part, dest).map_err(|e| {
        MapError::Io(crate::terr!(
            "e-interference-map-cli-cannot-write",
            dest = dest.display(),
            e = e
        ))
    })
}

/// Opt-in download of Natural Earth land polygons with the system `curl`, run with an
/// argument vector (no shell), a fixed HTTPS URL, and the result checked against a pinned
/// SHA-256 before it is kept. No HTTP crate is linked into Kshana.
fn fetch_land(out: &str) -> Result<(), MapError> {
    let dest = PathBuf::from(out);
    let mut part_name = dest.as_os_str().to_os_string();
    part_name.push(".part");
    let part = PathBuf::from(part_name);
    let status = std::process::Command::new("curl")
        .args([
            "--fail",
            "--silent",
            "--show-error",
            "--location",
            "--proto",
            "=https",
            "--output",
        ])
        .arg(&part)
        .arg(NATURAL_EARTH_LAND_URL)
        .status()
        .map_err(|e| {
            if e.kind() == std::io::ErrorKind::NotFound {
                MapError::Io(crate::terr!(
                    "e-interference-map-cli-curl-was-not-found-on",
                    NATURAL_EARTH_LAND_URL = NATURAL_EARTH_LAND_URL,
                    NATURAL_EARTH_LAND_SHA256 = NATURAL_EARTH_LAND_SHA256
                ))
            } else {
                MapError::Io(crate::terr!(
                    "e-interference-map-cli-cannot-run-curl",
                    e = e
                ))
            }
        })?;
    if !status.success() {
        let _ = std::fs::remove_file(&part);
        return Err(MapError::Io(crate::terr!(
            "e-interference-map-cli-curl-failed-to-download-the"
        )));
    }
    verify_and_keep(&part, &dest, NATURAL_EARTH_LAND_SHA256)?;
    println!(
        "{}",
        crate::t!(
            "interference-map-cli-wrote-natural-earth-land-polygons",
            out = out
        )
    );
    Ok(())
}

/// Open a CSV file and stream it through `read`, one line at a time.
fn read_csv_file(
    read: impl FnOnce(std::io::BufReader<std::fs::File>) -> Result<(), MapError>,
    path: &Path,
) -> Result<(), MapError> {
    let f = std::fs::File::open(path).map_err(|e| {
        MapError::Io(crate::terr!(
            "e-interference-map-cli-cannot-read",
            path = path.display(),
            e = e
        ))
    })?;
    read(std::io::BufReader::new(f))
}

/// Read ADS-B input from a path: a `.csv` file; a readsb trace file (`.json`, gzip or plain);
/// or a directory, searched recursively for `trace_full_*` files (an extracted adsb.lol
/// daily archive). A trace file that cannot be read is counted in the output metadata and
/// skipped; it does not stop the run.
pub(super) fn read_adsb_input(agg: &mut AdsbAggregator, path: &Path) -> Result<(), MapError> {
    if path.is_dir() {
        let mut files = Vec::new();
        collect_trace_files(path, &mut files)?;
        files.sort();
        if files.is_empty() {
            return Err(MapError::Format(crate::terr!(
                "e-interference-map-cli-no-trace-full-files-under",
                path = path.display()
            )));
        }
        for f in files {
            read_trace_file(agg, &f);
        }
        return Ok(());
    }
    if path
        .extension()
        .is_some_and(|e| e.eq_ignore_ascii_case("csv"))
    {
        return read_csv_file(|r| agg.read_csv_reader(r), path);
    }
    let bytes = std::fs::read(path).map_err(|e| {
        MapError::Io(crate::terr!(
            "e-interference-map-cli-cannot-read",
            path = path.display(),
            e = e
        ))
    })?;
    agg.read_readsb_trace(&bytes, MAX_TRACE_BYTES)
}

fn read_trace_file(agg: &mut AdsbAggregator, f: &Path) {
    let ok = std::fs::read(f)
        .ok()
        .is_some_and(|b| agg.read_readsb_trace(&b, MAX_TRACE_BYTES).is_ok());
    if !ok {
        agg.stats.trace_files_unreadable += 1;
    }
}

fn collect_trace_files(dir: &Path, out: &mut Vec<PathBuf>) -> Result<(), MapError> {
    let rd = std::fs::read_dir(dir).map_err(|e| {
        MapError::Io(crate::terr!(
            "e-evidence-cli-cannot-read",
            dir = dir.display(),
            e = e
        ))
    })?;
    for e in rd.filter_map(Result::ok) {
        let p = e.path();
        // `file_type` does not follow symlinks, so a link cannot lead the walk out of the tree.
        let Ok(t) = e.file_type() else { continue };
        if t.is_dir() {
            collect_trace_files(&p, out)?;
        } else if t.is_file() && e.file_name().to_string_lossy().starts_with("trace_full_") {
            out.push(p);
        }
    }
    Ok(())
}

/// `kshana route-exposure ...`; returns the process exit code.
pub fn run_route(args: &[String]) -> i32 {
    match run_route_inner(args) {
        Ok(()) => 0,
        Err(e) => {
            eprintln!("{}\n{}", crate::t!("main-fail", e = e), route_usage());
            2
        }
    }
}

fn collect_map_files(spec: &str) -> Result<Vec<PathBuf>, MapError> {
    let p = Path::new(spec);
    if p.is_dir() {
        let mut v: Vec<PathBuf> = std::fs::read_dir(p)
            .map_err(|e| {
                MapError::Io(crate::terr!(
                    "e-interference-map-cli-cannot-read-2",
                    spec = spec,
                    e = e
                ))
            })?
            .filter_map(Result::ok)
            .map(|e| e.path())
            .filter(|f| f.extension().is_some_and(|x| x == "geojson"))
            .collect();
        v.sort();
        Ok(v)
    } else {
        Ok(vec![p.to_path_buf()])
    }
}

fn run_route_inner(args: &[String]) -> Result<(), MapError> {
    if args.iter().any(|a| matches!(a.as_str(), "--help" | "-h")) {
        println!("{}", route_usage());
        return Ok(());
    }
    check_args(
        args,
        &["--route", "--map", "--from", "--to", "--out"],
        &["--json"],
        0,
    )?;
    let route_path = flag_value(args, "--route")?.ok_or_else(|| {
        MapError::Format(crate::terr!("e-interference-map-cli-route-is-required"))
    })?;
    let pts = route::parse_route(&read(route_path)?)?;
    let maps = flag_values(args, "--map");
    if maps.is_empty() {
        return Err(MapError::Format(crate::terr!(
            "e-interference-map-cli-at-least-one-map-is"
        )));
    }
    let (from, to) = (flag_value(args, "--from")?, flag_value(args, "--to")?);
    let day = |s: Option<&str>, n: &str| -> Result<Option<i64>, MapError> {
        s.map(|s| {
            parse_day(s).ok_or_else(|| {
                MapError::Format(crate::terr!(
                    "e-interference-map-cli-is-not-yyyy-mm-dd",
                    n = n
                ))
            })
        })
        .transpose()
    };
    let (from_d, to_d) = (day(from, "--from")?, day(to, "--to")?);
    let mut loaded = Vec::new();
    for spec in maps {
        for f in collect_map_files(spec)? {
            let m = route::load_map(&read(&f.to_string_lossy())?)
                .map_err(|e| MapError::Format(format!("{}: {e}", f.display())))?;
            let d = parse_day(&m.date).ok_or_else(|| {
                MapError::Format(crate::terr!(
                    "e-interference-map-cli-bad-map-date",
                    f = f.display()
                ))
            })?;
            if from_d.is_none_or(|x| d >= x) && to_d.is_none_or(|x| d <= x) {
                loaded.push(m);
            }
        }
    }
    loaded.sort_by(|a, b| {
        (a.date.as_str(), a.source_kind.as_str()).cmp(&(b.date.as_str(), b.source_kind.as_str()))
    });
    if loaded.is_empty() {
        return Err(MapError::Format(crate::terr!(
            "e-interference-map-api-no-map-falls-in-the"
        )));
    }
    let rows: Vec<_> = loaded
        .iter()
        .map(|m| (route::exposure(&pts, m), m))
        .collect();
    let report = route::report_json(&rows, from, to);
    let text =
        serde_json::to_string_pretty(&report).map_err(|e| MapError::Format(e.to_string()))?;
    if let Some(out) = flag_value(args, "--out")? {
        std::fs::write(out, text.clone() + "\n").map_err(|e| {
            MapError::Io(crate::terr!(
                "e-interference-map-cli-cannot-write-2",
                out = out,
                e = e
            ))
        })?;
    }
    if args.iter().any(|a| a == "--json") {
        println!("{text}");
    } else {
        println!(
            "{}",
            crate::t!(
                "interference-map-cli-route-length-km",
                rows = crate::i18n::localise_decimal(format!("{:.1}", rows[0].0.route_km))
            )
        );
        println!(
            "{:<11} {:<5} {:>9} {:>12} {:>11} {:>13}",
            crate::t!("interference-map-cli-col-date"),
            crate::t!("interference-map-cli-col-src"),
            crate::t!("interference-map-cli-col-degraded"),
            crate::t!("interference-map-cli-col-not-degraded"),
            crate::t!("interference-map-cli-col-unassessed"),
            crate::t!("interference-map-cli-col-not-observed")
        );
        for (e, _) in &rows {
            println!(
                "{:<11} {:<5} {:>8.1}% {:>11.1}% {:>10.1}% {:>12.1}%",
                e.date,
                e.source_kind,
                e.share_degraded * 100.0,
                e.share_not_degraded * 100.0,
                e.share_unassessed * 100.0,
                e.share_not_observed * 100.0
            );
        }
        println!(
            "{}",
            crate::t!("interference-map-cli-caveats-degraded-cell-does-not")
        );
    }
    Ok(())
}

#[cfg(test)]
mod tests {
    use super::*;

    /// A scratch directory removed when the test ends.
    struct Scratch(PathBuf);

    impl std::ops::Deref for Scratch {
        type Target = PathBuf;
        fn deref(&self) -> &PathBuf {
            &self.0
        }
    }

    impl Drop for Scratch {
        fn drop(&mut self) {
            let _ = std::fs::remove_dir_all(&self.0);
        }
    }

    fn scratch(name: &str) -> Scratch {
        use std::sync::atomic::{AtomicU64, Ordering};
        static SEQ: AtomicU64 = AtomicU64::new(0);
        let uniq = SEQ.fetch_add(1, Ordering::Relaxed);
        let dir = std::env::temp_dir().join(format!(
            "kshana-imap-unit-{}-{name}-{}",
            std::process::id(),
            uniq
        ));
        let _ = std::fs::remove_dir_all(&dir);
        std::fs::create_dir_all(&dir).unwrap();
        Scratch(dir)
    }

    #[test]
    fn download_is_kept_only_when_the_hash_matches() {
        let d = scratch("hash");
        let (part, dest) = (d.join("f.part"), d.join("f"));
        std::fs::write(&part, b"abc").unwrap();
        // SHA-256 of "abc" (FIPS 180-2 test vector).
        // PIN-SCOPE:    the SHA-256 of the three bytes `abc`, the FIPS 180-2 test vector
        // PIN-EXCLUDES: any downloaded content; this is a standard vector, not a recorded result
        let abc = "ba7816bf8f01cfea414140de5dae2223b00361a396177a9cb410ff61f20015ad";
        verify_and_keep(&part, &dest, abc).unwrap();
        assert!(dest.exists() && !part.exists());

        std::fs::write(&part, b"abd").unwrap();
        let e = verify_and_keep(&part, &d.join("g"), abc)
            .unwrap_err()
            .to_string();
        assert!(e.contains("does not match"), "{e}");
        assert!(
            !part.exists() && !d.join("g").exists(),
            "a mismatching download is discarded"
        );
    }

    #[test]
    fn pinned_download_address_is_https_and_commit_pinned() {
        assert!(NATURAL_EARTH_LAND_URL.starts_with("https://"));
        // PIN-SCOPE:    the upstream commit id inside NATURAL_EARTH_LAND_URL
        // PIN-EXCLUDES: the file content, which NATURAL_EARTH_LAND_SHA256 covers
        assert!(NATURAL_EARTH_LAND_URL.contains("ca96624a56bd078437bca8184e78163e5039ad19"));
        assert_eq!(NATURAL_EARTH_LAND_SHA256.len(), 64);
    }
}
