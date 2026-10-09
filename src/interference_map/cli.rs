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
use super::grid::Grid;
use super::land::LandMask;
use super::output::{file_name, to_geojson};
use super::route;
use super::sources::{Dataset, Kind};
use super::time::parse_day;
use super::{IdHasher, MapError};

pub const MAP_USAGE: &str = "usage: kshana interference-map adsb <input.csv|trace.json[.gz]|dir> --dataset <adsb-lol|custom> --out <dir> [--cell-deg <deg>]
   or: kshana interference-map ais <input.csv> --dataset <noaa-marinecadastre|kystverket|custom> --out <dir> [--land <land.geojson>] [--cell-deg <deg>]
   or: kshana interference-map fetch-land --out <land.geojson> --allow-network
   (--dataset custom also needs --licence <text> --licence-url <url> --attribution <text>)";

pub const ROUTE_USAGE: &str = "usage: kshana route-exposure --route <route.geojson|route.csv> --map <map.geojson|dir> [--map ...] [--from <YYYY-MM-DD>] [--to <YYYY-MM-DD>] [--out <report.json>] [--json]";

/// Natural Earth land polygons (public domain), the intended coastline for the AIS detector.
/// The URL names one commit of the upstream repository, and the download is checked against
/// the SHA-256 below before it is kept, so the file cannot change under the command.
pub const NATURAL_EARTH_LAND_URL: &str = "https://raw.githubusercontent.com/nvkelso/natural-earth-vector/ca96624a56bd078437bca8184e78163e5039ad19/geojson/ne_10m_land.geojson";
pub const NATURAL_EARTH_LAND_SHA256: &str =
    "1ac90796408bc6ad6911d69448485d3c4dbf2190370080368a09976e1c9f7416";

use super::api::MAX_TRACE_BYTES;

fn flag_value<'a>(args: &'a [String], name: &str) -> Result<Option<&'a str>, MapError> {
    match args.iter().position(|a| a == name) {
        None => Ok(None),
        Some(i) => args
            .get(i + 1)
            .map(|v| Some(v.as_str()))
            .ok_or_else(|| MapError::Format(format!("{name} needs a value"))),
    }
}

fn flag_values<'a>(args: &'a [String], name: &str) -> Vec<&'a str> {
    args.windows(2)
        .filter(|w| w[0] == name)
        .map(|w| w[1].as_str())
        .collect()
}

/// Every argument must be a known flag (with a value), a known switch, or the one positional.
fn check_args(
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
            return Err(MapError::Format(format!("unknown option `{a}`")));
        } else {
            pos += 1;
            i += 1;
        }
    }
    if pos != positionals {
        return Err(MapError::Format(format!(
            "expected {positionals} positional argument(s), got {pos}"
        )));
    }
    Ok(())
}

fn read(path: &str) -> Result<String, MapError> {
    std::fs::read_to_string(path).map_err(|e| MapError::Io(format!("cannot read {path}: {e}")))
}

fn dataset_from(args: &[String], kind: Kind) -> Result<Dataset, MapError> {
    let key = flag_value(args, "--dataset")?.ok_or_else(|| {
        MapError::Format("--dataset is required so the licence and attribution are embedded".into())
    })?;
    let spec = if key == "custom" {
        let need = |n: &str| {
            flag_value(args, n)?
                .ok_or_else(|| MapError::Format(format!("--dataset custom needs {n}")))
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
        Some(s) => s
            .parse::<f64>()
            .map_err(|_| MapError::Format("--cell-deg is not a number".into()))?,
    };
    Grid::new(deg).ok_or_else(|| MapError::Format("--cell-deg must be between 0.01 and 10".into()))
}

fn write_days(
    days: &[super::output::DayOut],
    grid: &Grid,
    method: &serde_json::Value,
    ds: &Dataset,
    out: &Path,
) -> Result<(), MapError> {
    std::fs::create_dir_all(out)
        .map_err(|e| MapError::Io(format!("cannot create {}: {e}", out.display())))?;
    for d in days {
        let doc = to_geojson(d, grid, method.clone(), ds);
        let path = out.join(file_name(d));
        let text =
            serde_json::to_string_pretty(&doc).map_err(|e| MapError::Format(e.to_string()))?;
        std::fs::write(&path, text + "\n")
            .map_err(|e| MapError::Io(format!("cannot write {}: {e}", path.display())))?;
        let n_deg = d.cells.iter().filter(|c| c.degraded).count();
        println!(
            "wrote {}: {} cells published, {} flagged",
            path.display(),
            d.cells.len(),
            n_deg
        );
    }
    if days.is_empty() {
        println!("no usable rows: nothing written");
    }
    Ok(())
}

/// `kshana interference-map ...`; returns the process exit code.
pub fn run_map(args: &[String]) -> i32 {
    match run_map_inner(args) {
        Ok(()) => 0,
        Err(e) => {
            eprintln!("error: {e}\n{MAP_USAGE}");
            2
        }
    }
}

fn run_map_inner(args: &[String]) -> Result<(), MapError> {
    let Some(sub) = args.first().map(String::as_str) else {
        return Err(MapError::Format("a subcommand is required".into()));
    };
    if matches!(sub, "--help" | "-h" | "help") {
        println!("{MAP_USAGE}");
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
            let input = positional(rest, &valued)
                .ok_or_else(|| MapError::Format("input file missing".into()))?;
            let ds = dataset_from(rest, Kind::Adsb)?;
            let grid = grid_from(rest)?;
            let out = PathBuf::from(
                flag_value(rest, "--out")?
                    .ok_or_else(|| MapError::Format("--out is required".into()))?,
            );
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
            let input = positional(rest, &valued)
                .ok_or_else(|| MapError::Format("input file missing".into()))?;
            let ds = dataset_from(rest, Kind::Ais)?;
            let grid = grid_from(rest)?;
            let out = PathBuf::from(
                flag_value(rest, "--out")?
                    .ok_or_else(|| MapError::Format("--out is required".into()))?,
            );
            let params = AisParams::PREREGISTERED_V1;
            let land = match flag_value(rest, "--land")? {
                Some(p) => Some(LandMask::from_geojson_str(&read(p)?, params.land_buffer_m)?),
                None => None,
            };
            let mut agg = AisAggregator::new(grid, params.clone(), IdHasher::new(), land);
            agg.read_csv(&read(input)?)?;
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
        "fetch-land" => {
            check_args(rest, &["--out"], &["--allow-network"], 0)?;
            if !rest.iter().any(|a| a == "--allow-network") {
                return Err(MapError::Format(
                    "fetch-land downloads a file: pass --allow-network to confirm".into(),
                ));
            }
            let out = flag_value(rest, "--out")?
                .ok_or_else(|| MapError::Format("--out is required".into()))?;
            fetch_land(out)
        }
        other => Err(MapError::Format(format!("unknown subcommand `{other}`"))),
    }
}

/// The one positional argument: the first argument that is neither a flag nor a flag's value.
fn positional<'a>(args: &'a [String], valued: &[&str]) -> Option<&'a str> {
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
fn file_sha256(path: &Path) -> Result<String, MapError> {
    use sha2::{Digest, Sha256};
    use std::io::Read;
    let mut f = std::fs::File::open(path)
        .map_err(|e| MapError::Io(format!("cannot read {}: {e}", path.display())))?;
    let mut h = Sha256::new();
    let mut buf = [0u8; 64 * 1024];
    loop {
        let n = f
            .read(&mut buf)
            .map_err(|e| MapError::Io(format!("cannot read {}: {e}", path.display())))?;
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
        return Err(MapError::Io(format!(
            "the downloaded file's SHA-256 ({got}) does not match the pinned value ({expected}); it was discarded"
        )));
    }
    std::fs::rename(part, dest)
        .map_err(|e| MapError::Io(format!("cannot write {}: {e}", dest.display())))
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
        .args(["--fail", "--silent", "--show-error", "--location", "--proto", "=https", "--output"])
        .arg(&part)
        .arg(NATURAL_EARTH_LAND_URL)
        .status()
        .map_err(|e| {
            if e.kind() == std::io::ErrorKind::NotFound {
                MapError::Io(format!(
                    "curl was not found on PATH. Install curl, or download {NATURAL_EARTH_LAND_URL} yourself and check that its SHA-256 is {NATURAL_EARTH_LAND_SHA256}"
                ))
            } else {
                MapError::Io(format!("cannot run curl: {e}"))
            }
        })?;
    if !status.success() {
        let _ = std::fs::remove_file(&part);
        return Err(MapError::Io(
            "curl failed to download the land polygons".into(),
        ));
    }
    verify_and_keep(&part, &dest, NATURAL_EARTH_LAND_SHA256)?;
    println!("wrote {out}: Natural Earth land polygons, SHA-256 verified (public domain, https://www.naturalearthdata.com/about/terms-of-use/)");
    Ok(())
}

/// Read ADS-B input from a path: a `.csv` file; a readsb trace file (`.json`, gzip or plain);
/// or a directory, searched recursively for `trace_full_*` files (an extracted adsb.lol
/// daily archive). A trace file that cannot be read is counted in the output metadata and
/// skipped; it does not stop the run.
fn read_adsb_input(agg: &mut AdsbAggregator, path: &Path) -> Result<(), MapError> {
    if path.is_dir() {
        let mut files = Vec::new();
        collect_trace_files(path, &mut files)?;
        files.sort();
        if files.is_empty() {
            return Err(MapError::Format(format!(
                "no trace_full_* files under {}",
                path.display()
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
        return agg.read_csv(&read(&path.to_string_lossy())?);
    }
    let bytes = std::fs::read(path)
        .map_err(|e| MapError::Io(format!("cannot read {}: {e}", path.display())))?;
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
    let rd = std::fs::read_dir(dir)
        .map_err(|e| MapError::Io(format!("cannot read {}: {e}", dir.display())))?;
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
            eprintln!("error: {e}\n{ROUTE_USAGE}");
            2
        }
    }
}

fn collect_map_files(spec: &str) -> Result<Vec<PathBuf>, MapError> {
    let p = Path::new(spec);
    if p.is_dir() {
        let mut v: Vec<PathBuf> = std::fs::read_dir(p)
            .map_err(|e| MapError::Io(format!("cannot read {spec}: {e}")))?
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
        println!("{ROUTE_USAGE}");
        return Ok(());
    }
    check_args(
        args,
        &["--route", "--map", "--from", "--to", "--out"],
        &["--json"],
        0,
    )?;
    let route_path = flag_value(args, "--route")?
        .ok_or_else(|| MapError::Format("--route is required".into()))?;
    let pts = route::parse_route(&read(route_path)?)?;
    let maps = flag_values(args, "--map");
    if maps.is_empty() {
        return Err(MapError::Format("at least one --map is required".into()));
    }
    let (from, to) = (flag_value(args, "--from")?, flag_value(args, "--to")?);
    let day = |s: Option<&str>, n: &str| -> Result<Option<i64>, MapError> {
        s.map(|s| {
            parse_day(s).ok_or_else(|| MapError::Format(format!("{n} is not a YYYY-MM-DD date")))
        })
        .transpose()
    };
    let (from_d, to_d) = (day(from, "--from")?, day(to, "--to")?);
    let mut loaded = Vec::new();
    for spec in maps {
        for f in collect_map_files(spec)? {
            let m = route::load_map(&read(&f.to_string_lossy())?)
                .map_err(|e| MapError::Format(format!("{}: {e}", f.display())))?;
            let d = parse_day(&m.date)
                .ok_or_else(|| MapError::Format(format!("{}: bad map date", f.display())))?;
            if from_d.is_none_or(|x| d >= x) && to_d.is_none_or(|x| d <= x) {
                loaded.push(m);
            }
        }
    }
    loaded.sort_by(|a, b| {
        (a.date.as_str(), a.source_kind.as_str()).cmp(&(b.date.as_str(), b.source_kind.as_str()))
    });
    if loaded.is_empty() {
        return Err(MapError::Format("no map falls in the date range".into()));
    }
    let rows: Vec<_> = loaded
        .iter()
        .map(|m| (route::exposure(&pts, m), m))
        .collect();
    let report = route::report_json(&rows, from, to);
    let text =
        serde_json::to_string_pretty(&report).map_err(|e| MapError::Format(e.to_string()))?;
    if let Some(out) = flag_value(args, "--out")? {
        std::fs::write(out, text.clone() + "\n")
            .map_err(|e| MapError::Io(format!("cannot write {out}: {e}")))?;
    }
    if args.iter().any(|a| a == "--json") {
        println!("{text}");
    } else {
        println!("route length {:.1} km", rows[0].0.route_km);
        println!(
            "{:<11} {:<5} {:>9} {:>9} {:>11} {:>13}",
            "date", "src", "degraded", "clear", "unassessed", "not observed"
        );
        for (e, _) in &rows {
            println!(
                "{:<11} {:<5} {:>8.1}% {:>8.1}% {:>10.1}% {:>12.1}%",
                e.date,
                e.source_kind,
                e.share_degraded * 100.0,
                e.share_not_degraded * 100.0,
                e.share_unassessed * 100.0,
                e.share_not_observed * 100.0
            );
        }
        println!("Caveats: a degraded cell does not identify interference as the cause; cells not observed are not evidence of a clear route; this is not a forecast.");
    }
    Ok(())
}

#[cfg(test)]
mod tests {
    use super::*;

    fn scratch(name: &str) -> PathBuf {
        let d =
            std::env::temp_dir().join(format!("kshana-imap-unit-{}-{name}", std::process::id()));
        let _ = std::fs::remove_dir_all(&d);
        std::fs::create_dir_all(&d).unwrap();
        d
    }

    #[test]
    fn download_is_kept_only_when_the_hash_matches() {
        let d = scratch("hash");
        let (part, dest) = (d.join("f.part"), d.join("f"));
        std::fs::write(&part, b"abc").unwrap();
        // SHA-256 of "abc" (FIPS 180-2 test vector).
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
        assert!(NATURAL_EARTH_LAND_URL.contains("ca96624a56bd078437bca8184e78163e5039ad19"));
        assert_eq!(NATURAL_EARTH_LAND_SHA256.len(), 64);
    }
}
