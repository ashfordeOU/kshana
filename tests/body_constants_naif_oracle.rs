// SPDX-License-Identifier: AGPL-3.0-only
//! Oracle test for the physical constants of the solar-system bodies (`body::Body`,
//! `body::SOLAR_SYSTEM`), against the NAIF generic kernels.
//!
//! ## Oracle (kind: Reference)
//!
//! NAIF `pck00011.tpc` (IAU WGCCRE 2015 radii, pole and prime meridian) and
//! `gm_de440.tpc` (DE440 GM values), <https://naif.jpl.nasa.gov/pub/naif/generic_kernels/pck/>,
//! read by the SPICE Toolkit (spiceypy 8.2.0, CSPICE N0067) in the committed generator
//! `tests/fixtures/body_constants_naif_oracle/generate_body_constants_naif_oracle.py`.
//!
//! ## Comparison and tolerance (fixed before the first comparison)
//!
//! For GM (Body::mu against BODYnnn_GM x 1e9), the equatorial radius (BodyFacts against
//! RADII\[0\]), pole RA0 and DEC0, W0 and Wdot (against POLE_RA\[0\], POLE_DEC\[0\], PM\[0\],
//! PM\[1\]): the Kshana constant must equal the NAIF value rounded to the significant digits
//! Kshana prints (read as the shortest decimal of the Kshana value after rounding to 12
//! significant digits, trailing zeros dropped). J2 and the mean radius are outside the
//! claim. The verdict covers the fourteen bodies the row adds; Sun, Earth, Moon and Mars
//! carry conventional constants owned by other rows and are reported for information.

use kshana::body::Body;

const REF: &str = include_str!("fixtures/body_constants_naif_oracle/naif_body_constants.txt");

const ADDED: [&str; 14] = [
    "Mercury", "Venus", "Jupiter", "Saturn", "Uranus", "Neptune", "Pluto", "Phobos", "Deimos",
    "Io", "Europa", "Ganymede", "Callisto", "Titan",
];

const DEG: f64 = std::f64::consts::PI / 180.0;

/// The significant digits Kshana prints for `k`: (mantissa digits, decimal exponent).
fn printed(k: f64) -> (String, i32) {
    let s = format!("{:.11e}", k);
    let (m, e) = s.split_once('e').unwrap();
    let digits: String = m.chars().filter(|c| c.is_ascii_digit()).collect();
    let digits = digits.trim_end_matches('0').to_string();
    let digits = if digits.is_empty() {
        "0".into()
    } else {
        digits
    };
    (digits, e.parse().unwrap())
}

/// True when `naif`, rounded to the significant digits Kshana prints for `k`, equals `k`.
fn agrees(k: f64, naif: f64) -> (bool, String, String) {
    let (digits, _) = printed(k);
    let n = digits.len().max(1);
    let ks = format!("{:.*e}", n - 1, k);
    let ns = format!("{:.*e}", n - 1, naif);
    (ks == ns, ks, ns)
}

/// One comparison: (body, quantity, kshana value, naif value).
type Cmp = (String, &'static str, f64, f64);

fn comparisons() -> Vec<Cmp> {
    let mut out = Vec::new();
    for line in REF
        .lines()
        .filter(|l| !l.starts_with('#') && !l.trim().is_empty())
    {
        let t: Vec<&str> = line.split_whitespace().collect();
        assert_eq!(t.len(), 8, "malformed line: {line}");
        let name = t[0].to_string();
        let v = |i: usize| -> Option<f64> { t[i].parse().ok() };
        let b = Body::by_name(&name).unwrap_or_else(|| panic!("{name} is not a Kshana body"));
        let facts = b.facts().expect("catalogue record");
        let mut push = |q: &'static str, k: f64, n: Option<f64>| {
            if let Some(n) = n {
                out.push((name.clone(), q, k, n));
            }
        };
        push("GM [m^3/s^2]", b.mu, v(2).map(|x| x * 1e9));
        push(
            "equatorial radius [km]",
            facts.radius_equatorial_m / 1e3,
            v(3),
        );
        push("pole RA0 [deg]", b.pole_ra0 / DEG, v(4));
        push("pole DEC0 [deg]", b.pole_dec0 / DEG, v(5));
        push("W0 [deg]", b.prime_w0 / DEG, v(6));
        push("Wdot [deg/day]", b.prime_w_dot / DEG, v(7));
    }
    out
}

/// Every disagreement, as "body: quantity Kshana <k> vs NAIF <n>".
fn disagreements(only_added: bool) -> Vec<String> {
    comparisons()
        .into_iter()
        .filter(|(b, ..)| !only_added || ADDED.contains(&b.as_str()))
        .filter_map(|(b, q, k, n)| {
            let (ok, ks, ns) = agrees(k, n);
            (!ok).then(|| format!("{b}: {q} Kshana {ks} vs NAIF {ns}"))
        })
        .collect()
}

/// The disagreements found on the first (and only) run, among the fourteen added bodies.
/// Phobos and Deimos carry the IAU 2009 elements (pck00011 carries the 2015 update, and a
/// different Phobos radius and GM); the Uranus, Neptune and Pluto GM values come from other
/// satellite-ephemeris solutions than the ones gm_de440.tpc carries.
const RECORDED_DISAGREEMENTS: [&str; 12] = [
    "Phobos: GM [m^3/s^2] Kshana 7.087e5 vs NAIF 7.088e5",
    "Phobos: equatorial radius [km] Kshana 1.31e1 vs NAIF 1.30e1",
    "Phobos: pole RA0 [deg] Kshana 3.1768e2 vs NAIF 3.1767e2",
    "Phobos: W0 [deg] Kshana 3.506e1 vs NAIF 3.519e1",
    "Phobos: Wdot [deg/day] Kshana 1.128844585e3 vs NAIF 1.128844759e3",
    "Deimos: pole RA0 [deg] Kshana 3.1665e2 vs NAIF 3.1666e2",
    "Deimos: pole DEC0 [deg] Kshana 5.352e1 vs NAIF 5.351e1",
    "Deimos: W0 [deg] Kshana 7.941e1 vs NAIF 7.940e1",
    "Deimos: Wdot [deg/day] Kshana 2.85161897e2 vs NAIF 2.85161889e2",
    "Uranus: GM [m^3/s^2] Kshana 5.7939506103e15 vs NAIF 5.7939512565e15",
    "Neptune: GM [m^3/s^2] Kshana 6.83509997e15 vs NAIF 6.83510315e15",
    "Pluto: GM [m^3/s^2] Kshana 8.69326e11 vs NAIF 8.69614e11",
];

fn report() -> Vec<String> {
    let all = comparisons();
    let added = all
        .iter()
        .filter(|(b, ..)| ADDED.contains(&b.as_str()))
        .count();
    let bad_added = disagreements(true);
    let bad_all = disagreements(false);
    eprintln!(
        "M109 oracle: {} comparisons ({added} for the fourteen added bodies); {} disagree \
         among the added bodies, {} overall",
        all.len(),
        bad_added.len(),
        bad_all.len()
    );
    for d in &bad_all {
        eprintln!("  {d}");
    }
    bad_added
}

/// The finding stays exactly what was recorded: the other 72 constants of the added bodies
/// agree with NAIF to every digit Kshana prints, and these twelve do not. A changed constant
/// either way fails here, so the row's oracle text cannot go stale.
#[test]
fn recorded_naif_disagreements_are_unchanged() {
    assert_eq!(report(), RECORDED_DISAGREEMENTS.to_vec());
}

/// The pre-registered comparison: every compared constant of the fourteen added bodies equal
/// to the NAIF value at Kshana's printed digits. It fails on the twelve constants above, so the
/// row stays MODELLED; it is kept, ignored, to be re-run if the catalogue moves to pck00011 and
/// gm_de440.
#[test]
#[ignore = "12 constants of the added bodies differ from pck00011/gm_de440 (finding M109)"]
fn constants_match_naif_pck00011_and_gm_de440() {
    let bad = report();
    assert!(
        bad.is_empty(),
        "{} constants of the added bodies differ from NAIF",
        bad.len()
    );
}
