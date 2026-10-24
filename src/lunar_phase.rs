// SPDX-License-Identifier: AGPL-3.0-only
//! Shared pieces of the lunar segment of the Artemis-class mission thread: the state a phase receives and
//! hands on, and a small dense-matrix helper the phase filters use.
//!
//! The lunar kinds (`lunar-rendezvous`, `lunar-landing-dispersion`, `lunar-surface-pnt-map`) each keep their
//! core as a function of `(config, carried state)`, so a mission-thread phase calls the same code a standalone
//! run does; a standalone run uses [`Carried::default_llo`].
//!
//! [`Carried`] is the full 6x6 position-velocity covariance in a stated frame, the clock sigmas, a timescale
//! tag and the upstream evidence label. The thread, not a phase, converts frames and timescales at a handover,
//! and a handover that loses observability inflates the covariance by a stated rule and never resets it: a
//! phase here only ever receives a covariance and returns the covariance it ends with.
//!
//! Advisory software, not certified navigation equipment. MODELLED.

use serde::{Deserialize, Serialize};

/// The frame a carried covariance is expressed in.
#[derive(Clone, Copy, Debug, PartialEq, Eq, Serialize, Deserialize)]
#[serde(rename_all = "lowercase")]
pub enum Frame {
    /// Moon-centred inertial.
    Mci,
    /// Moon-centred, Moon-fixed.
    Mcmf,
}

/// The timescale a carried clock sigma refers to.
#[derive(Clone, Copy, Debug, PartialEq, Eq, Serialize, Deserialize)]
#[serde(rename_all = "lowercase")]
pub enum TimeScale {
    /// Terrestrial Time.
    Tt,
    /// Barycentric Dynamical Time.
    Tdb,
    /// Lunar Coordinate Time.
    Ltc,
}

/// 6x6 covariance, row-major, order `[x, y, z, vx, vy, vz]` in m and m/s.
pub type Cov6 = [[f64; 6]; 6];

/// What a phase receives from the one before it, and hands to the next.
#[derive(Clone, Debug, PartialEq, Serialize, Deserialize)]
pub struct Carried {
    /// Epoch of the covariance, Julian Date (TDB).
    pub epoch_jd_tdb: f64,
    /// Frame of `cov`.
    pub frame: Frame,
    /// Full 6x6 position-velocity covariance (m, m/s).
    pub cov: Cov6,
    /// Clock-bias 1-sigma (s) in `timescale`.
    pub clock_bias_sigma_s: f64,
    /// Clock-drift 1-sigma (s/s) in `timescale`.
    pub clock_drift_sigma_s_per_s: f64,
    /// Timescale of the clock sigmas.
    pub timescale: TimeScale,
    /// The upstream evidence label (`MODELLED` unless an earlier phase earned more).
    pub evidence: String,
}

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

impl Carried {
    /// The state a standalone run starts from: a Moon-centred inertial covariance of 100 m and 0.1 m/s per axis
    /// (an ILLUSTRATIVE low-lunar-orbit knowledge), epoch 2028-01-01 00:00 TDB, a 1 us clock in LTC.
    pub fn default_llo() -> Self {
        Self {
            epoch_jd_tdb: 2_461_771.5,
            frame: Frame::Mci,
            cov: diag6(100.0, 0.1),
            clock_bias_sigma_s: 1.0e-6,
            clock_drift_sigma_s_per_s: 1.0e-11,
            timescale: TimeScale::Ltc,
            evidence: "MODELLED".to_string(),
        }
    }

    /// `true` if the covariance is symmetric to a relative `1e-9` and has a non-negative diagonal.
    pub fn is_valid(&self) -> bool {
        let scale = (0..6)
            .map(|i| self.cov[i][i].abs())
            .fold(0.0, f64::max)
            .max(1e-300);
        (0..6).all(|i| {
            self.cov[i][i] >= 0.0
                && (0..6).all(|j| (self.cov[i][j] - self.cov[j][i]).abs() <= 1e-9 * scale)
        })
    }
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
            "<text x=\"{ml:.0}\" y=\"{:.0}\" fill=\"{MUTED}\" font-family=\"{FONT_SANS}\">no finite points to plot</text></svg>",
            mt + 20.0
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
    fn default_carried_is_valid_and_modelled() {
        let c = Carried::default_llo();
        assert!(c.is_valid());
        assert_eq!(c.evidence, "MODELLED");
        assert_eq!(c.frame, Frame::Mci);
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
