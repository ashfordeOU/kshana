// SPDX-License-Identifier: AGPL-3.0-only
//! Shared pieces of the lunar segment of the Artemis-class mission thread: helpers over the thread's carried
//! state ([`NavState`]) and a small dense-matrix helper the phase estimators use.
//!
//! The lunar kinds (`lunar-orbit-rendezvous`, `lunar-descent`, `lunar-surface`, `lunar-ascent`) each keep their
//! core as a function of `(config, entry state, thread context)`, so a mission-thread phase calls the same code
//! a standalone run does; a standalone run builds [`default_entry`] and [`default_ctx`].
//!
//! The thread, not a phase, converts frames and timescales at a handover, and a handover that loses
//! observability inflates the covariance by a stated rule and never resets it: a phase here only ever receives
//! a covariance and returns the covariance it ends with.
//!
//! Advisory software, not certified navigation equipment. MODELLED.

pub use crate::mission_thread::phase::{Cov6, Frame, NavState, Timescale};
use crate::mission_thread::ThreadCtx;

/// Diagonal 6x6 covariance from a position and a velocity 1-sigma.
pub fn diag6(pos_sigma_m: f64, vel_sigma_m_s: f64) -> Cov6 {
    let mut c = [[0.0; 6]; 6];
    for (i, row) in c.iter_mut().enumerate() {
        row[i] = if i < 3 {
            pos_sigma_m * pos_sigma_m
        } else {
            vel_sigma_m_s * vel_sigma_m_s
        };
    }
    c
}

/// The entry a standalone run starts from: a Moon-centred inertial covariance of 100 m and 0.1 m/s per axis
/// (an ILLUSTRATIVE low-lunar-orbit knowledge), a 1 us clock in LTC with a 1e-11 drift sigma, at mission time
/// zero.
pub fn default_entry() -> NavState {
    NavState::diagonal(
        0.0,
        Frame::Mci,
        [0.0; 6],
        100.0,
        0.1,
        Timescale::Ltc,
        1.0e-6,
        1.0e-11,
    )
}

/// The context a standalone run uses: the thread's default 2028-01-01 epoch and the default seed.
pub fn default_ctx() -> ThreadCtx {
    ThreadCtx::new("2028-01-01T00:00:00Z", 20_261_024)
}

/// `true` if the covariance is symmetric to a relative `1e-9` and has a non-negative diagonal.
pub fn cov_is_valid(p: &Cov6) -> bool {
    let scale = (0..6)
        .map(|i| p[i][i].abs())
        .fold(0.0, f64::max)
        .max(1e-300);
    (0..6).all(|i| p[i][i] >= 0.0 && (0..6).all(|j| (p[i][j] - p[j][i]).abs() <= 1e-9 * scale))
}

/// Julian Date of the thread's epoch plus `t_s` seconds of mission time. The epoch is read as UTC and used as the
/// time argument of the lunar orientation and ephemeris series without the 69 s UTC to TDB offset, which moves
/// the Moon by about 70 m along its track and nothing a phase here is sensitive to.
pub fn epoch_jd(ctx: &ThreadCtx, t_s: f64) -> Result<f64, String> {
    let s = ctx.epoch_utc.trim();
    let (date, time) = match s.split_once('T') {
        Some((d, t)) => (d, t.trim_end_matches('Z')),
        None => (s.trim_end_matches('Z'), "00:00:00"),
    };
    let d: Vec<&str> = date.split('-').collect();
    let t: Vec<&str> = time.split(':').collect();
    if d.len() != 3 || t.len() != 3 {
        return Err(crate::terr!("e-lunar-phase-epoch-is-not-yyyy-mm", s = s));
    }
    let num = |x: &str| {
        x.parse::<f64>()
            .map_err(|_| crate::terr!("e-lunar-phase-epoch-bad-number", s = s, x = x))
    };
    let (y, m, day) = (num(d[0])? as i64, num(d[1])? as i64, num(d[2])? as i64);
    if !(1901..=2099).contains(&y) || !(1..=12).contains(&m) || !(1..=31).contains(&day) {
        return Err(crate::terr!(
            "e-lunar-phase-epoch-is-outside-1901-2099",
            s = s
        ));
    }
    let jd0 = (367 * y - (7 * (y + (m + 9) / 12)) / 4 + (275 * m) / 9 + day) as f64 + 1_721_013.5;
    let frac = (num(t[0])? * 3600.0 + num(t[1])? * 60.0 + num(t[2])?) / 86_400.0;
    Ok(jd0 + frac + t_s / 86_400.0)
}

/// The seed a standalone run of a kind uses: the thread's id-keyed seed ([`ThreadCtx::phase_seed`]) with the kind
/// name as the id. Inside a thread the seed comes from the phase's own id; a phase whose id is its kind name
/// returns the standalone numbers.
pub fn kind_seed(ctx: &ThreadCtx, kind: &str) -> u64 {
    ctx.phase_seed(kind)
}

/// The clock state carried across `dt` seconds with its covariance grown by the constant-drift model
/// `P' = F P F'`, `F = [[1, dt], [0, 1]]`, and the bias moved by the drift. The phases here use no clock
/// measurement, so the clock only ages.
pub fn age_clock(
    c: &crate::mission_thread::phase::ClockState,
    dt: f64,
) -> crate::mission_thread::phase::ClockState {
    let mut o = *c;
    o.bias_s += c.drift_s_per_s * dt;
    o.cov[0][0] = c.cov[0][0] + 2.0 * dt * c.cov[0][1] + dt * dt * c.cov[1][1];
    o.cov[0][1] = c.cov[0][1] + dt * c.cov[1][1];
    o.cov[1][0] = o.cov[0][1];
    o
}

/// A dense row-major matrix, small enough that clarity beats speed.
#[derive(Clone, Debug, PartialEq)]
pub struct Dm {
    /// Rows.
    pub r: usize,
    /// Columns.
    pub c: usize,
    /// Row-major data.
    pub d: Vec<f64>,
}

impl Dm {
    /// A zero matrix.
    pub fn zeros(r: usize, c: usize) -> Self {
        Self {
            r,
            c,
            d: vec![0.0; r * c],
        }
    }

    /// The identity.
    pub fn eye(n: usize) -> Self {
        let mut m = Self::zeros(n, n);
        for i in 0..n {
            m.d[i * n + i] = 1.0;
        }
        m
    }

    /// Element `(i, j)`.
    pub fn at(&self, i: usize, j: usize) -> f64 {
        self.d[i * self.c + j]
    }

    /// Set element `(i, j)`.
    pub fn set(&mut self, i: usize, j: usize, v: f64) {
        self.d[i * self.c + j] = v;
    }

    /// Add `v` to element `(i, j)`.
    pub fn add_at(&mut self, i: usize, j: usize, v: f64) {
        self.d[i * self.c + j] += v;
    }

    /// Matrix product.
    pub fn mul(&self, o: &Dm) -> Dm {
        let mut out = Dm::zeros(self.r, o.c);
        for i in 0..self.r {
            for k in 0..self.c {
                let a = self.d[i * self.c + k];
                if a != 0.0 {
                    for j in 0..o.c {
                        out.d[i * o.c + j] += a * o.d[k * o.c + j];
                    }
                }
            }
        }
        out
    }

    /// Transpose.
    pub fn t(&self) -> Dm {
        let mut out = Dm::zeros(self.c, self.r);
        for i in 0..self.r {
            for j in 0..self.c {
                out.d[j * self.r + i] = self.d[i * self.c + j];
            }
        }
        out
    }

    /// Element-wise sum.
    pub fn plus(&self, o: &Dm) -> Dm {
        Dm {
            r: self.r,
            c: self.c,
            d: self.d.iter().zip(&o.d).map(|(a, b)| a + b).collect(),
        }
    }

    /// Element-wise difference.
    pub fn minus(&self, o: &Dm) -> Dm {
        Dm {
            r: self.r,
            c: self.c,
            d: self.d.iter().zip(&o.d).map(|(a, b)| a - b).collect(),
        }
    }

    /// Scalar multiple.
    pub fn scale(&self, s: f64) -> Dm {
        Dm {
            r: self.r,
            c: self.c,
            d: self.d.iter().map(|a| a * s).collect(),
        }
    }

    /// Lower Cholesky factor, `None` if the matrix is not positive definite.
    pub fn cholesky(&self) -> Option<Dm> {
        let n = self.r;
        let mut l = Dm::zeros(n, n);
        for i in 0..n {
            for j in 0..=i {
                let mut s = self.at(i, j);
                for k in 0..j {
                    s -= l.at(i, k) * l.at(j, k);
                }
                if i == j {
                    if s <= 0.0 || !s.is_finite() {
                        return None;
                    }
                    l.set(i, i, s.sqrt());
                } else {
                    l.set(i, j, s / l.at(j, j));
                }
            }
        }
        Some(l)
    }

    /// Solve `self * X = b` for a symmetric positive-definite `self` by Cholesky; `None` if it is not.
    pub fn solve_spd(&self, b: &Dm) -> Option<Dm> {
        let l = self.cholesky()?;
        let n = self.r;
        let mut x = Dm::zeros(n, b.c);
        for col in 0..b.c {
            let mut y = vec![0.0; n];
            for i in 0..n {
                let mut s = b.at(i, col);
                for (k, yk) in y.iter().enumerate().take(i) {
                    s -= l.at(i, k) * yk;
                }
                y[i] = s / l.at(i, i);
            }
            for i in (0..n).rev() {
                let mut s = y[i];
                for k in i + 1..n {
                    s -= l.at(k, i) * x.at(k, col);
                }
                x.set(i, col, s / l.at(i, i));
            }
        }
        Some(x)
    }

    /// Symmetrise in place: `(M + Mᵀ) / 2`.
    pub fn symmetrise(&mut self) {
        for i in 0..self.r {
            for j in i + 1..self.c {
                let m = 0.5 * (self.d[i * self.c + j] + self.d[j * self.c + i]);
                self.d[i * self.c + j] = m;
                self.d[j * self.c + i] = m;
            }
        }
    }
}

/// A named polyline for [`line_chart_svg`].
pub struct ChartSeries<'a> {
    /// Legend text.
    pub name: &'a str,
    /// `(x, y)` points in data units.
    pub points: Vec<(f64, f64)>,
}

/// A small line chart in the shared palette: one or more series against a linear x axis and a linear y axis
/// from zero, with a legend. Every string is escaped by the chart helpers. A series with no finite point is
/// skipped; if nothing is drawable the chart says so rather than drawing an empty frame.
pub fn line_chart_svg(
    title: &str,
    subtitle: &str,
    xlabel: &str,
    ylabel: &str,
    series: &[ChartSeries],
) -> String {
    use crate::chart::{esc, frame_open, panel_axes, y_axis};
    use crate::palette::chart::{FONT_SANS, MUTED, SERIES};
    let (w, h) = (820.0_f64, 360.0_f64);
    let (ml, mr, mt, mb) = (70.0_f64, 24.0_f64, 56.0_f64, 52.0_f64);
    let (pw, ph) = (w - ml - mr, h - mt - mb);
    let pts: Vec<&(f64, f64)> = series
        .iter()
        .flat_map(|s| s.points.iter())
        .filter(|(x, y)| x.is_finite() && y.is_finite())
        .collect();
    let mut svg = frame_open(w, h, title, subtitle);
    if pts.is_empty() {
        svg.push_str(&format!(
            "<text x=\"{ml:.0}\" y=\"{:.0}\" fill=\"{MUTED}\" font-family=\"{FONT_SANS}\">{}</text></svg>",
            mt + 20.0,
            crate::t!("lunar-phase-no-finite-points-to-plot")
        ));
        return svg;
    }
    let x_min = pts.iter().map(|p| p.0).fold(f64::INFINITY, f64::min);
    let x_max = pts.iter().map(|p| p.0).fold(f64::NEG_INFINITY, f64::max);
    let y_max = pts.iter().map(|p| p.1).fold(0.0_f64, f64::max).max(1e-12);
    let xs = if x_max > x_min { x_max - x_min } else { 1.0 };
    let xof = |x: f64| ml + (x - x_min) / xs * pw;
    let yof = |y: f64| mt + ph - y / y_max * ph;
    svg.push_str(&y_axis(ml, mt, pw, ph, y_max, ylabel));
    svg.push_str(&panel_axes(ml, mt, pw, mt + ph, ""));
    svg.push_str(&format!(
        "<text x=\"{:.0}\" y=\"{:.0}\" text-anchor=\"middle\" fill=\"{MUTED}\" font-size=\"11\">{}  ({:.4} to {:.4})</text>",
        ml + pw / 2.0,
        mt + ph + 36.0,
        esc(xlabel),
        x_min,
        x_max
    ));
    for (k, s) in series.iter().enumerate() {
        let colour = SERIES[k % SERIES.len()];
        let line: Vec<String> = s
            .points
            .iter()
            .filter(|(x, y)| x.is_finite() && y.is_finite())
            .map(|&(x, y)| format!("{:.1},{:.1}", xof(x), yof(y)))
            .collect();
        if line.is_empty() {
            continue;
        }
        svg.push_str(&format!(
            "<polyline fill=\"none\" stroke=\"{colour}\" stroke-width=\"2\" points=\"{}\"/>",
            line.join(" ")
        ));
        let ly = mt + 14.0 + 14.0 * k as f64;
        svg.push_str(&format!(
            "<line x1=\"{:.0}\" y1=\"{ly:.0}\" x2=\"{:.0}\" y2=\"{ly:.0}\" stroke=\"{colour}\" stroke-width=\"2\"/><text x=\"{:.0}\" y=\"{:.0}\" font-size=\"11\" fill=\"{MUTED}\">{}</text>",
            ml + pw - 170.0,
            ml + pw - 150.0,
            ml + pw - 144.0,
            ly + 4.0,
            esc(s.name)
        ));
    }
    svg.push_str("</svg>");
    svg
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn default_entry_is_valid_and_modelled() {
        let c = default_entry();
        assert!(cov_is_valid(&c.p));
        assert_eq!(
            c.upstream.tier,
            crate::mission_thread::phase::LabelTier::Modelled
        );
        assert_eq!(c.frame, Frame::Mci);
    }

    #[test]
    fn the_epoch_is_read_and_mission_time_added() {
        let ctx = default_ctx();
        assert_eq!(epoch_jd(&ctx, 0.0).unwrap(), 2_461_771.5);
        assert!((epoch_jd(&ctx, 86_400.0).unwrap() - 2_461_772.5).abs() < 1e-12);
        let noon = ThreadCtx::new("2028-01-01T12:00:00Z", 1);
        assert_eq!(epoch_jd(&noon, 0.0).unwrap(), 2_461_772.0);
        assert!(epoch_jd(&ThreadCtx::new("nope", 1), 0.0).is_err());
    }

    #[test]
    fn the_standalone_seed_is_the_id_keyed_seed_with_the_kind_as_the_id() {
        let a = default_ctx();
        assert_eq!(
            kind_seed(&a, "lunar-descent"),
            a.phase_ctx(3, "lunar-descent", 1.0).seed
        );
        assert_eq!(
            kind_seed(&a, "lunar-descent"),
            kind_seed(&a, "lunar-descent")
        );
        assert_ne!(
            kind_seed(&a, "lunar-descent"),
            kind_seed(&a, "lunar-ascent")
        );
    }

    #[test]
    fn an_aging_clock_only_grows_its_covariance() {
        let c = default_entry().clock;
        let o = age_clock(&c, 3600.0);
        assert!(o.cov[0][0] > c.cov[0][0]);
        assert_eq!(o.cov[1][1], c.cov[1][1]);
    }

    #[test]
    fn cholesky_solve_inverts_an_spd_matrix() {
        let mut a = Dm::eye(3).scale(2.0);
        a.set(0, 1, 0.5);
        a.set(1, 0, 0.5);
        let b = Dm::eye(3);
        let x = a.solve_spd(&b).unwrap();
        let p = a.mul(&x);
        for i in 0..3 {
            for j in 0..3 {
                let want = if i == j { 1.0 } else { 0.0 };
                assert!((p.at(i, j) - want).abs() < 1e-12);
            }
        }
    }

    #[test]
    fn chart_is_self_contained_and_escapes_its_text() {
        let svg = line_chart_svg(
            "a <b>",
            "sub",
            "x & y",
            "m",
            &[ChartSeries {
                name: "s<1>",
                points: vec![(0.0, 1.0), (1.0, 2.0)],
            }],
        );
        assert!(svg.starts_with("<svg") && svg.ends_with("</svg>"));
        assert!(!svg.contains("<b>") && svg.contains("&lt;b&gt;") && svg.contains("s&lt;1&gt;"));
        let empty = line_chart_svg("t", "s", "x", "y", &[]);
        assert!(empty.contains("no finite points"));
    }

    #[test]
    fn cholesky_rejects_an_indefinite_matrix() {
        let mut a = Dm::eye(2);
        a.set(0, 1, 2.0);
        a.set(1, 0, 2.0);
        assert!(a.cholesky().is_none());
    }
}
