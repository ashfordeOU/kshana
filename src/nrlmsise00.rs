// SPDX-License-Identifier: AGPL-3.0-only
//! **NRLMSISE-00** empirical neutral-atmosphere model (*J. Geophys. Res.* 107(A12), 1468, 2002,
//! doi:10.1029/2002JA009430): number densities of He, O, N₂, O₂, Ar, H, N and anomalous
//! oxygen, the total mass density and the temperature, from the ground to the exosphere, driven
//! by day of year, UT, position, local solar time, F10.7 (previous day and 81-day mean) and Ap.
//!
//! This is a line-by-line port of the U.S. Naval Research Laboratory model in the public-domain
//! C version (release 20190709) of the NRL Fortran `NRLMSISE-00.FOR`, in `f64`, with the same
//! operation order: [`gtd7`] (the standard output), [`gtd7d`] (the total mass density with the
//! anomalous-oxygen contribution, the one to use for satellite drag), the 24-element switch
//! array of `TSELEC` (default all on, SI units) including the switch-9 = −1 mode driven by the
//! 7-element 3-hourly ap history. The pressure-level entry `GHP7` is not ported. The
//! coefficient tables are in `nrlmsise00_data` (generated; provenance in
//! `tests/fixtures/nrlmsise00/NOTICE.md`). The NRL model and its coefficients are U.S. Government
//! work, not subject to copyright protection in the United States (17 U.S.C. 105, 403).
//!
//! [`density_kg_m3`] is the drag-facing convenience: the `gtd7d` total mass density in kg/m³
//! with every switch on, the daily-Ap mode and the local solar time `UT/3600 + lon/15`.
//!
//! Evidence: cross-checked against pymsis 0.13.0 (`version=0`, the NRL Fortran) and the C
//! port on a 720-point grid, and against the C distribution's 17 published test cases — see
//! `xval/nrlmsise00-pymsis/` and `tests/nrlmsise00_reference.rs`. That validates the port, not
//! the model: NRLMSISE-00's own density error against measurements is of order 15 % (1σ).

use crate::nrlmsise00_data::{PAVGM, PD, PDL, PDM, PMA, PS, PT, PTL, PTM};
use crate::portable_math::PortableFloat;

/// The 24 model switches of `TSELEC` (index 0 to 23). `1` turns a term on, `0` off; switch 0 on
/// selects SI output (m⁻³, kg/m³) instead of CGS (cm⁻³, g/cm³); switch 9 may be `-1` to drive
/// the geomagnetic terms by the 3-hourly [`Input::ap_array`] instead of the daily Ap. Any other
/// value `v` behaves as in the reference (main effect on iff `v == 1`, cross terms on iff `v > 0`).
#[derive(Clone, Copy, Debug, PartialEq, Eq)]
pub struct Flags {
    pub switches: [i32; 24],
}

impl Default for Flags {
    /// Every switch 1: SI units, every term on, the daily-Ap mode.
    fn default() -> Self {
        Self { switches: [1; 24] }
    }
}

/// The model inputs (see the NRL `GTD7` header).
#[derive(Clone, Copy, Debug, PartialEq)]
pub struct Input {
    /// Day of year (1 to 366); the year is ignored by the model.
    pub doy: i32,
    /// Seconds of the day, UT.
    pub sec: f64,
    /// Geodetic altitude (km).
    pub alt_km: f64,
    /// Geodetic latitude (deg).
    pub g_lat_deg: f64,
    /// Geodetic longitude (deg).
    pub g_long_deg: f64,
    /// Local apparent solar time (hours); `sec/3600 + g_long_deg/15` is the consistent choice.
    pub lst_h: f64,
    /// 81-day average of F10.7 centred on the day (sfu).
    pub f107a: f64,
    /// Daily F10.7 of the previous day (sfu).
    pub f107: f64,
    /// Daily magnetic index Ap.
    pub ap: f64,
    /// The 3-hourly ap history used only when switch 9 is −1: daily Ap; the 3-h ap now, 3, 6
    /// and 9 h before; the mean of the eight 3-h ap from 12 to 33 h before; and from 36 to 57 h
    /// before. `None` there falls back to `[ap; 7]`.
    pub ap_array: Option<[f64; 7]>,
}

/// The model outputs.
#[derive(Clone, Copy, Debug, PartialEq)]
pub struct Output {
    /// Densities `[He, O, N₂, O₂, Ar, total mass, H, N, anomalous O]`: number densities in m⁻³
    /// (cm⁻³ with switch 0 off) and the total mass density in kg/m³ (g/cm³).
    pub d: [f64; 9],
    /// Temperatures `[exospheric, at altitude]` (K).
    pub t: [f64; 2],
}

/// Per-evaluation working state: the `COMMON` blocks / file statics of the reference.
struct Ctx {
    sw: [f64; 24],
    swc: [f64; 24],
    gsurf: f64,
    re: f64,
    dm28: f64,
    meso_tn1: [f64; 5],
    meso_tn2: [f64; 4],
    meso_tn3: [f64; 5],
    meso_tgn1: [f64; 2],
    meso_tgn2: [f64; 2],
    meso_tgn3: [f64; 2],
    dfa: f64,
    plg: [[f64; 9]; 4],
    ctloc: f64,
    stloc: f64,
    c2tloc: f64,
    s2tloc: f64,
    s3tloc: f64,
    c3tloc: f64,
    apdf: f64,
    apt: [f64; 4],
}

const ZN2: [f64; 4] = [72.5, 55.0, 45.0, 32.5];
const ZN3: [f64; 5] = [32.5, 20.0, 15.0, 10.0, 0.0];
const RGAS: f64 = 831.4;

impl Ctx {
    fn new(flags: &Flags) -> Self {
        // TSELEC.
        let mut sw = [0.0; 24];
        let mut swc = [0.0; 24];
        for i in 0..24 {
            let s = flags.switches[i];
            if i != 9 {
                sw[i] = if s == 1 { 1.0 } else { 0.0 };
                swc[i] = if s > 0 { 1.0 } else { 0.0 };
            } else {
                sw[i] = f64::from(s);
                swc[i] = f64::from(s);
            }
        }
        Self {
            sw,
            swc,
            gsurf: 0.0,
            re: 0.0,
            dm28: 0.0,
            meso_tn1: [0.0; 5],
            meso_tn2: [0.0; 4],
            meso_tn3: [0.0; 5],
            meso_tgn1: [0.0; 2],
            meso_tgn2: [0.0; 2],
            meso_tgn3: [0.0; 2],
            dfa: 0.0,
            plg: [[0.0; 9]; 4],
            ctloc: 0.0,
            stloc: 0.0,
            c2tloc: 0.0,
            s2tloc: 0.0,
            s3tloc: 0.0,
            c3tloc: 0.0,
            apdf: 0.0,
            apt: [0.0; 4],
        }
    }

    /// GLATF: latitude variation of gravity and the effective Earth radius.
    fn glatf(&mut self, lat: f64) {
        let dgtr = 1.74533E-2;
        let c2 = (2.0 * dgtr * lat).pcos();
        self.gsurf = 980.616 * (1.0 - 0.0026373 * c2);
        self.re = 2.0 * self.gsurf / (3.085462E-6 + 2.27E-9 * c2) * 1.0E-5;
    }

    fn scalh(&self, alt: f64, xm: f64, temp: f64) -> f64 {
        let g = self.gsurf / (1.0 + alt / self.re).ppowf(2.0);
        RGAS * temp / (g * xm)
    }

    fn zeta(&self, zz: f64, zl: f64) -> f64 {
        (zz - zl) * (self.re + zl) / (self.re + zz)
    }

    /// DENSM: temperature and density profiles of the lower atmosphere.
    fn densm(&self, alt: f64, d0: f64, xm: f64, tz: &mut f64) -> f64 {
        let (zn2, zn3) = (&ZN2, &ZN3);
        let mut densm_tmp = d0;
        if alt > zn2[0] {
            return if xm == 0.0 { *tz } else { d0 };
        }
        // Stratosphere / mesosphere temperature.
        let z = if alt > zn2[3] { alt } else { zn2[3] };
        let mn = 4;
        let (z1, z2) = (zn2[0], zn2[mn - 1]);
        let (t1, t2) = (self.meso_tn2[0], self.meso_tn2[mn - 1]);
        let zg = self.zeta(z, z1);
        let zgdif = self.zeta(z2, z1);
        let mut xs = [0.0; 10];
        let mut ys = [0.0; 10];
        let mut y2out = [0.0; 10];
        for k in 0..mn {
            xs[k] = self.zeta(zn2[k], z1) / zgdif;
            ys[k] = 1.0 / self.meso_tn2[k];
        }
        let yd1 = -self.meso_tgn2[0] / (t1 * t1) * zgdif;
        let yd2 =
            -self.meso_tgn2[1] / (t2 * t2) * zgdif * ((self.re + z2) / (self.re + z1)).ppowf(2.0);
        spline(&xs, &ys, mn, yd1, yd2, &mut y2out);
        let x = zg / zgdif;
        let y = splint(&xs, &ys, &y2out, mn, x);
        *tz = 1.0 / y;
        if xm != 0.0 {
            let glb = self.gsurf / (1.0 + z1 / self.re).ppowf(2.0);
            let gamm = xm * glb * zgdif / RGAS;
            let yi = splini(&xs, &ys, &y2out, mn, x);
            let mut expl = gamm * yi;
            if expl > 50.0 {
                expl = 50.0;
            }
            densm_tmp = densm_tmp * (t1 / *tz) * (-expl).pexp();
        }
        if alt > zn3[0] {
            return if xm == 0.0 { *tz } else { densm_tmp };
        }
        // Troposphere / stratosphere temperature.
        let z = alt;
        let mn = 5;
        let (z1, z2) = (zn3[0], zn3[mn - 1]);
        let (t1, t2) = (self.meso_tn3[0], self.meso_tn3[mn - 1]);
        let zg = self.zeta(z, z1);
        let zgdif = self.zeta(z2, z1);
        for k in 0..mn {
            xs[k] = self.zeta(zn3[k], z1) / zgdif;
            ys[k] = 1.0 / self.meso_tn3[k];
        }
        let yd1 = -self.meso_tgn3[0] / (t1 * t1) * zgdif;
        let yd2 =
            -self.meso_tgn3[1] / (t2 * t2) * zgdif * ((self.re + z2) / (self.re + z1)).ppowf(2.0);
        spline(&xs, &ys, mn, yd1, yd2, &mut y2out);
        let x = zg / zgdif;
        let y = splint(&xs, &ys, &y2out, mn, x);
        *tz = 1.0 / y;
        if xm != 0.0 {
            let glb = self.gsurf / (1.0 + z1 / self.re).ppowf(2.0);
            let gamm = xm * glb * zgdif / RGAS;
            let yi = splini(&xs, &ys, &y2out, mn, x);
            let mut expl = gamm * yi;
            if expl > 50.0 {
                expl = 50.0;
            }
            densm_tmp = densm_tmp * (t1 / *tz) * (-expl).pexp();
        }
        if xm == 0.0 {
            *tz
        } else {
            densm_tmp
        }
    }

    /// DENSU: temperature and density profiles of the thermosphere (Bates profile above `za`,
    /// spline below). Writes `meso_tn1[0]` / `meso_tgn1[0]` as the reference does.
    #[allow(clippy::too_many_arguments)]
    fn densu(
        &mut self,
        alt: f64,
        dlb: f64,
        tinf: f64,
        tlb: f64,
        xm: f64,
        alpha: f64,
        tz: &mut f64,
        zlb: f64,
        s2: f64,
        zn1: &[f64; 5],
    ) -> f64 {
        let mn1 = 5;
        let mut x = 0.0;
        let mut z1 = 0.0;
        let mut t1 = 0.0;
        let mut zgdif = 0.0;
        let mut mn = 0;
        let mut xs = [0.0; 10];
        let mut ys = [0.0; 10];
        let mut y2out = [0.0; 10];
        let za = zn1[0];
        let z = if alt > za { alt } else { za };
        // Geopotential altitude difference from ZLB.
        let zg2 = self.zeta(z, zlb);
        // Bates temperature.
        let tt = tinf - (tinf - tlb) * (-s2 * zg2).pexp();
        let ta = tt;
        *tz = tt;
        let mut densu_temp = *tz;
        if alt < za {
            // Temperature gradient at ZA from the Bates profile.
            let dta = (tinf - ta) * s2 * ((self.re + zlb) / (self.re + za)).ppowf(2.0);
            self.meso_tgn1[0] = dta;
            self.meso_tn1[0] = ta;
            let z = if alt > zn1[mn1 - 1] {
                alt
            } else {
                zn1[mn1 - 1]
            };
            mn = mn1;
            z1 = zn1[0];
            let z2 = zn1[mn - 1];
            t1 = self.meso_tn1[0];
            let t2 = self.meso_tn1[mn - 1];
            let zg = self.zeta(z, z1);
            zgdif = self.zeta(z2, z1);
            for k in 0..mn {
                xs[k] = self.zeta(zn1[k], z1) / zgdif;
                ys[k] = 1.0 / self.meso_tn1[k];
            }
            let yd1 = -self.meso_tgn1[0] / (t1 * t1) * zgdif;
            let yd2 = -self.meso_tgn1[1] / (t2 * t2)
                * zgdif
                * ((self.re + z2) / (self.re + z1)).ppowf(2.0);
            spline(&xs, &ys, mn, yd1, yd2, &mut y2out);
            x = zg / zgdif;
            let y = splint(&xs, &ys, &y2out, mn, x);
            *tz = 1.0 / y;
            densu_temp = *tz;
        }
        if xm == 0.0 {
            return densu_temp;
        }
        // Density above ZA.
        let glb = self.gsurf / (1.0 + zlb / self.re).ppowf(2.0);
        let gamma = xm * glb / (s2 * RGAS * tinf);
        let mut expl = (-s2 * gamma * zg2).pexp();
        if expl > 50.0 {
            expl = 50.0;
        }
        if tt <= 0.0 {
            expl = 50.0;
        }
        let densa = dlb * (tlb / tt).ppowf(1.0 + alpha + gamma) * expl;
        densu_temp = densa;
        if alt >= za {
            return densu_temp;
        }
        // Density below ZA.
        let glb = self.gsurf / (1.0 + z1 / self.re).ppowf(2.0);
        let gamm = xm * glb * zgdif / RGAS;
        let yi = splini(&xs, &ys, &y2out, mn, x);
        let mut expl = gamm * yi;
        if expl > 50.0 {
            expl = 50.0;
        }
        if *tz <= 0.0 {
            expl = 50.0;
        }
        densu_temp * (t1 / *tz).ppowf(1.0 + alpha) * (-expl).pexp()
    }

    /// GLOBE7: the G(L) function of the upper thermosphere parameters.
    fn globe7(&mut self, p: &[f64], input: &Input, ap_a: &[f64; 7]) -> f64 {
        let mut t = [0.0f64; 15];
        let sr = 7.2722E-5;
        let dgtr = 1.74533E-2;
        let dr = 1.72142E-2;
        let hr = 0.2618;
        let (sw, swc) = (self.sw, self.swc);
        let tloc = input.lst_h;
        let doy = f64::from(input.doy);

        // Legendre polynomials.
        let c = (input.g_lat_deg * dgtr).psin();
        let s = (input.g_lat_deg * dgtr).pcos();
        let c2 = c * c;
        let c4 = c2 * c2;
        let s2 = s * s;
        let plg = &mut self.plg;
        plg[0][1] = c;
        plg[0][2] = 0.5 * (3.0 * c2 - 1.0);
        plg[0][3] = 0.5 * (5.0 * c * c2 - 3.0 * c);
        plg[0][4] = (35.0 * c4 - 30.0 * c2 + 3.0) / 8.0;
        plg[0][5] = (63.0 * c2 * c2 * c - 70.0 * c2 * c + 15.0 * c) / 8.0;
        plg[0][6] = (11.0 * c * plg[0][5] - 5.0 * plg[0][4]) / 6.0;
        plg[1][1] = s;
        plg[1][2] = 3.0 * c * s;
        plg[1][3] = 1.5 * (5.0 * c2 - 1.0) * s;
        plg[1][4] = 2.5 * (7.0 * c2 * c - 3.0 * c) * s;
        plg[1][5] = 1.875 * (21.0 * c4 - 14.0 * c2 + 1.0) * s;
        plg[1][6] = (11.0 * c * plg[1][5] - 6.0 * plg[1][4]) / 5.0;
        plg[2][2] = 3.0 * s2;
        plg[2][3] = 15.0 * s2 * c;
        plg[2][4] = 7.5 * (7.0 * c2 - 1.0) * s2;
        plg[2][5] = 3.0 * c * plg[2][4] - 2.0 * plg[2][3];
        plg[2][6] = (11.0 * c * plg[2][5] - 7.0 * plg[2][4]) / 4.0;
        plg[2][7] = (13.0 * c * plg[2][6] - 8.0 * plg[2][5]) / 5.0;
        plg[3][3] = 15.0 * s2 * s;
        plg[3][4] = 105.0 * s2 * s * c;
        plg[3][5] = (9.0 * c * plg[3][4] - 7. * plg[3][3]) / 2.0;
        plg[3][6] = (11.0 * c * plg[3][5] - 8. * plg[3][4]) / 3.0;
        let plg = self.plg;

        if !(sw[7] == 0.0 && sw[8] == 0.0 && sw[14] == 0.0) {
            self.stloc = (hr * tloc).psin();
            self.ctloc = (hr * tloc).pcos();
            self.s2tloc = (2.0 * hr * tloc).psin();
            self.c2tloc = (2.0 * hr * tloc).pcos();
            self.s3tloc = (3.0 * hr * tloc).psin();
            self.c3tloc = (3.0 * hr * tloc).pcos();
        }
        let (ctloc, stloc, c2tloc, s2tloc, s3tloc, c3tloc) = (
            self.ctloc,
            self.stloc,
            self.c2tloc,
            self.s2tloc,
            self.s3tloc,
            self.c3tloc,
        );

        let cd32 = (dr * (doy - p[31])).pcos();
        let cd18 = (2.0 * dr * (doy - p[17])).pcos();
        let cd14 = (dr * (doy - p[13])).pcos();
        let cd39 = (2.0 * dr * (doy - p[38])).pcos();

        // F10.7 effect.
        let df = input.f107 - input.f107a;
        self.dfa = input.f107a - 150.0;
        let dfa = self.dfa;
        t[0] = p[19] * df * (1.0 + p[59] * dfa)
            + p[20] * df * df
            + p[21] * dfa
            + p[29] * dfa.ppowf(2.0);
        let f1 = 1.0 + (p[47] * dfa + p[19] * df + p[20] * df * df) * swc[1];
        let f2 = 1.0 + (p[49] * dfa + p[19] * df + p[20] * df * df) * swc[1];

        // Time independent.
        t[1] = (p[1] * plg[0][2] + p[2] * plg[0][4] + p[22] * plg[0][6])
            + (p[14] * plg[0][2]) * dfa * swc[1]
            + p[26] * plg[0][1];
        // Symmetrical annual.
        t[2] = p[18] * cd32;
        // Symmetrical semiannual.
        t[3] = (p[15] + p[16] * plg[0][2]) * cd18;
        // Asymmetrical annual.
        t[4] = f1 * (p[9] * plg[0][1] + p[10] * plg[0][3]) * cd14;
        // Asymmetrical semiannual.
        t[5] = p[37] * plg[0][1] * cd39;

        // Diurnal.
        if sw[7] != 0.0 {
            let t71 = (p[11] * plg[1][2]) * cd14 * swc[5];
            let t72 = (p[12] * plg[1][2]) * cd14 * swc[5];
            t[6] = f2
                * ((p[3] * plg[1][1] + p[4] * plg[1][3] + p[27] * plg[1][5] + t71) * ctloc
                    + (p[6] * plg[1][1] + p[7] * plg[1][3] + p[28] * plg[1][5] + t72) * stloc);
        }
        // Semidiurnal.
        if sw[8] != 0.0 {
            let t81 = (p[23] * plg[2][3] + p[35] * plg[2][5]) * cd14 * swc[5];
            let t82 = (p[33] * plg[2][3] + p[36] * plg[2][5]) * cd14 * swc[5];
            t[7] = f2
                * ((p[5] * plg[2][2] + p[41] * plg[2][4] + t81) * c2tloc
                    + (p[8] * plg[2][2] + p[42] * plg[2][4] + t82) * s2tloc);
        }
        // Terdiurnal.
        if sw[14] != 0.0 {
            t[13] = f2
                * ((p[39] * plg[3][3] + (p[93] * plg[3][4] + p[46] * plg[3][6]) * cd14 * swc[5])
                    * s3tloc
                    + (p[40] * plg[3][3]
                        + (p[94] * plg[3][4] + p[48] * plg[3][6]) * cd14 * swc[5])
                        * c3tloc);
        }

        // Magnetic activity.
        if sw[9] == -1.0 {
            if p[51] != 0.0 {
                let mut exp1 = (-10800.0 * (p[51] * p[51]).sqrt()
                    / (1.0 + p[138] * (45.0 - (input.g_lat_deg * input.g_lat_deg).sqrt())))
                .pexp();
                if exp1 > 0.99999 {
                    exp1 = 0.99999;
                }
                // The reference clamps p[24] in place; every table value is above the bound.
                let p24 = if p[24] < 1.0E-4 { 1.0E-4 } else { p[24] };
                self.apt[0] = sg0(exp1, p24, p[25], ap_a);
                if sw[9] != 0.0 {
                    t[8] = self.apt[0]
                        * (p[50]
                            + p[96] * plg[0][2]
                            + p[54] * plg[0][4]
                            + (p[125] * plg[0][1] + p[126] * plg[0][3] + p[127] * plg[0][5])
                                * cd14
                                * swc[5]
                            + (p[128] * plg[1][1] + p[129] * plg[1][3] + p[130] * plg[1][5])
                                * swc[7]
                                * (hr * (tloc - p[131])).pcos());
                }
            }
        } else {
            let apd = input.ap - 4.0;
            let mut p44 = p[43];
            let p45 = p[44];
            if p44 < 0.0 {
                p44 = 1.0E-5;
            }
            self.apdf = apd + (p45 - 1.0) * (apd + ((-p44 * apd).pexp() - 1.0) / p44);
            if sw[9] != 0.0 {
                t[8] = self.apdf
                    * (p[32]
                        + p[45] * plg[0][2]
                        + p[34] * plg[0][4]
                        + (p[100] * plg[0][1] + p[101] * plg[0][3] + p[102] * plg[0][5])
                            * cd14
                            * swc[5]
                        + (p[121] * plg[1][1] + p[122] * plg[1][3] + p[123] * plg[1][5])
                            * swc[7]
                            * (hr * (tloc - p[124])).pcos());
            }
        }

        if sw[10] != 0.0 && input.g_long_deg > -1000.0 {
            // Longitudinal.
            if sw[11] != 0.0 {
                t[10] = (1.0 + p[80] * dfa * swc[1])
                    * ((p[64] * plg[1][2]
                        + p[65] * plg[1][4]
                        + p[66] * plg[1][6]
                        + p[103] * plg[1][1]
                        + p[104] * plg[1][3]
                        + p[105] * plg[1][5]
                        + swc[5]
                            * (p[109] * plg[1][1] + p[110] * plg[1][3] + p[111] * plg[1][5])
                            * cd14)
                        * (dgtr * input.g_long_deg).pcos()
                        + (p[90] * plg[1][2]
                            + p[91] * plg[1][4]
                            + p[92] * plg[1][6]
                            + p[106] * plg[1][1]
                            + p[107] * plg[1][3]
                            + p[108] * plg[1][5]
                            + swc[5]
                                * (p[112] * plg[1][1] + p[113] * plg[1][3] + p[114] * plg[1][5])
                                * cd14)
                            * (dgtr * input.g_long_deg).psin());
            }
            // UT and mixed UT, longitude.
            if sw[12] != 0.0 {
                t[11] = (1.0 + p[95] * plg[0][1])
                    * (1.0 + p[81] * dfa * swc[1])
                    * (1.0 + p[119] * plg[0][1] * swc[5] * cd14)
                    * ((p[68] * plg[0][1] + p[69] * plg[0][3] + p[70] * plg[0][5])
                        * (sr * (input.sec - p[71])).pcos());
                t[11] += swc[11]
                    * (p[76] * plg[2][3] + p[77] * plg[2][5] + p[78] * plg[2][7])
                    * (sr * (input.sec - p[79]) + 2.0 * dgtr * input.g_long_deg).pcos()
                    * (1.0 + p[137] * dfa * swc[1]);
            }
            // UT, longitude magnetic activity.
            if sw[13] != 0.0 {
                if sw[9] == -1.0 {
                    if p[51] != 0.0 {
                        let apt0 = self.apt[0];
                        t[12] = apt0
                            * swc[11]
                            * (1. + p[132] * plg[0][1])
                            * ((p[52] * plg[1][2] + p[98] * plg[1][4] + p[67] * plg[1][6])
                                * (dgtr * (input.g_long_deg - p[97])).pcos())
                            + apt0
                                * swc[11]
                                * swc[5]
                                * (p[133] * plg[1][1] + p[134] * plg[1][3] + p[135] * plg[1][5])
                                * cd14
                                * (dgtr * (input.g_long_deg - p[136])).pcos()
                            + apt0
                                * swc[12]
                                * (p[55] * plg[0][1] + p[56] * plg[0][3] + p[57] * plg[0][5])
                                * (sr * (input.sec - p[58])).pcos();
                    }
                } else {
                    let apdf = self.apdf;
                    t[12] = apdf
                        * swc[11]
                        * (1.0 + p[120] * plg[0][1])
                        * ((p[60] * plg[1][2] + p[61] * plg[1][4] + p[62] * plg[1][6])
                            * (dgtr * (input.g_long_deg - p[63])).pcos())
                        + apdf
                            * swc[11]
                            * swc[5]
                            * (p[115] * plg[1][1] + p[116] * plg[1][3] + p[117] * plg[1][5])
                            * cd14
                            * (dgtr * (input.g_long_deg - p[118])).pcos()
                        + apdf
                            * swc[12]
                            * (p[83] * plg[0][1] + p[84] * plg[0][3] + p[85] * plg[0][5])
                            * (sr * (input.sec - p[75])).pcos();
                }
            }
        }

        let mut tinf = p[30];
        for i in 0..14 {
            tinf += sw[i + 1].abs() * t[i];
        }
        tinf
    }

    /// GLOB7S: the version of GLOBE for the lower atmosphere. Uses the Legendre polynomials,
    /// local-time harmonics, `dfa`, `apdf` and `apt` left by the last [`globe7`](Self::globe7).
    fn glob7s(&self, p: &[f64], input: &Input) -> f64 {
        let pset = 2.0;
        let mut t = [0.0f64; 14];
        let dr = 1.72142E-2;
        let dgtr = 1.74533E-2;
        let (sw, swc, plg) = (&self.sw, &self.swc, &self.plg);
        let doy = f64::from(input.doy);
        // Confirm the parameter set (every table carries p[99] = 2).
        let p99 = if p[99] == 0.0 { pset } else { p[99] };
        if p99 != pset {
            return -1.0;
        }
        let cd32 = (dr * (doy - p[31])).pcos();
        let cd18 = (2.0 * dr * (doy - p[17])).pcos();
        let cd14 = (dr * (doy - p[13])).pcos();
        let cd39 = (2.0 * dr * (doy - p[38])).pcos();

        // F10.7.
        t[0] = p[21] * self.dfa;
        // Time independent.
        t[1] = p[1] * plg[0][2]
            + p[2] * plg[0][4]
            + p[22] * plg[0][6]
            + p[26] * plg[0][1]
            + p[14] * plg[0][3]
            + p[59] * plg[0][5];
        // Symmetrical annual.
        t[2] = (p[18] + p[47] * plg[0][2] + p[29] * plg[0][4]) * cd32;
        // Symmetrical semiannual.
        t[3] = (p[15] + p[16] * plg[0][2] + p[30] * plg[0][4]) * cd18;
        // Asymmetrical annual.
        t[4] = (p[9] * plg[0][1] + p[10] * plg[0][3] + p[20] * plg[0][5]) * cd14;
        // Asymmetrical semiannual.
        t[5] = (p[37] * plg[0][1]) * cd39;
        // Diurnal.
        if sw[7] != 0.0 {
            let t71 = p[11] * plg[1][2] * cd14 * swc[5];
            let t72 = p[12] * plg[1][2] * cd14 * swc[5];
            t[6] = (p[3] * plg[1][1] + p[4] * plg[1][3] + t71) * self.ctloc
                + (p[6] * plg[1][1] + p[7] * plg[1][3] + t72) * self.stloc;
        }
        // Semidiurnal.
        if sw[8] != 0.0 {
            let t81 = (p[23] * plg[2][3] + p[35] * plg[2][5]) * cd14 * swc[5];
            let t82 = (p[33] * plg[2][3] + p[36] * plg[2][5]) * cd14 * swc[5];
            t[7] = (p[5] * plg[2][2] + p[41] * plg[2][4] + t81) * self.c2tloc
                + (p[8] * plg[2][2] + p[42] * plg[2][4] + t82) * self.s2tloc;
        }
        // Terdiurnal.
        if sw[14] != 0.0 {
            t[13] = p[39] * plg[3][3] * self.s3tloc + p[40] * plg[3][3] * self.c3tloc;
        }
        // Magnetic activity.
        if sw[9] != 0.0 {
            if sw[9] == 1.0 {
                t[8] = self.apdf * (p[32] + p[45] * plg[0][2] * swc[2]);
            }
            if sw[9] == -1.0 {
                t[8] = p[50] * self.apt[0] + p[96] * plg[0][2] * self.apt[0] * swc[2];
            }
        }
        // Longitudinal.
        if !(sw[10] == 0.0 || sw[11] == 0.0 || input.g_long_deg <= -1000.0) {
            t[10] = (1.0
                + plg[0][1]
                    * (p[80] * swc[5] * (dr * (doy - p[81])).pcos()
                        + p[85] * swc[6] * (2.0 * dr * (doy - p[86])).pcos())
                + p[83] * swc[3] * (dr * (doy - p[84])).pcos()
                + p[87] * swc[4] * (2.0 * dr * (doy - p[88])).pcos())
                * ((p[64] * plg[1][2]
                    + p[65] * plg[1][4]
                    + p[66] * plg[1][6]
                    + p[74] * plg[1][1]
                    + p[75] * plg[1][3]
                    + p[76] * plg[1][5])
                    * (dgtr * input.g_long_deg).pcos()
                    + (p[90] * plg[1][2]
                        + p[91] * plg[1][4]
                        + p[92] * plg[1][6]
                        + p[77] * plg[1][1]
                        + p[78] * plg[1][3]
                        + p[79] * plg[1][5])
                        * (dgtr * input.g_long_deg).psin());
        }
        let mut tt = 0.0;
        for i in 0..14 {
            tt += sw[i + 1].abs() * t[i];
        }
        tt
    }

    /// GTS7: the thermospheric portion (altitude ≥ 72.5 km).
    fn gts7(&mut self, input: &Input, alt: f64, ap_a: &[f64; 7]) -> Output {
        let mut d = [0.0f64; 9];
        let mut t = [0.0f64; 2];
        let mut tz = 0.0;
        let dgtr = 1.74533E-2;
        let dr = 1.72142E-2;
        let alpha = [-0.38, 0.0, 0.0, 0.0, 0.17, 0.0, -0.38, 0.0, 0.0];
        let altl = [200.0, 300.0, 160.0, 250.0, 240.0, 450.0, 320.0, 450.0];
        let za = PDL[1][15];
        let zn1 = [za, 110.0, 100.0, 90.0, 72.5];
        let sw = self.sw;

        // Tinf variations not important below ZA or ZN1(1).
        let tinf = if alt > zn1[0] {
            PTM[0] * PT[0] * (1.0 + sw[16] * self.globe7(&PT, input, ap_a))
        } else {
            PTM[0] * PT[0]
        };
        t[0] = tinf;
        // Gradient variations not important below ZN1(5).
        let g0 = if alt > zn1[4] {
            PTM[3] * PS[0] * (1.0 + sw[19] * self.globe7(&PS, input, ap_a))
        } else {
            PTM[3] * PS[0]
        };
        let tlb = PTM[1] * (1.0 + sw[17] * self.globe7(&PD[3], input, ap_a)) * PD[3][0];
        let s = g0 / (tinf - tlb);

        // Lower thermosphere temperature variations not significant for density above 300 km.
        if alt < 300.0 {
            self.meso_tn1[1] = PTM[6] * PTL[0][0] / (1.0 - sw[18] * self.glob7s(&PTL[0], input));
            self.meso_tn1[2] = PTM[2] * PTL[1][0] / (1.0 - sw[18] * self.glob7s(&PTL[1], input));
            self.meso_tn1[3] = PTM[7] * PTL[2][0] / (1.0 - sw[18] * self.glob7s(&PTL[2], input));
            self.meso_tn1[4] =
                PTM[4] * PTL[3][0] / (1.0 - sw[18] * sw[20] * self.glob7s(&PTL[3], input));
            self.meso_tgn1[1] = PTM[8]
                * PMA[8][0]
                * (1.0 + sw[18] * sw[20] * self.glob7s(&PMA[8], input))
                * self.meso_tn1[4]
                * self.meso_tn1[4]
                / (PTM[4] * PTL[3][0]).ppowf(2.0);
        } else {
            self.meso_tn1[1] = PTM[6] * PTL[0][0];
            self.meso_tn1[2] = PTM[2] * PTL[1][0];
            self.meso_tn1[3] = PTM[7] * PTL[2][0];
            self.meso_tn1[4] = PTM[4] * PTL[3][0];
            self.meso_tgn1[1] = PTM[8] * PMA[8][0] * self.meso_tn1[4] * self.meso_tn1[4]
                / (PTM[4] * PTL[3][0]).ppowf(2.0);
        }

        // N2 variation factor at Zlb.
        let g28 = sw[21] * self.globe7(&PD[2], input, ap_a);
        // Variation of turbopause height.
        let zhf = PDL[1][24]
            * (1.0
                + sw[5]
                    * PDL[0][24]
                    * (dgtr * input.g_lat_deg).psin()
                    * (dr * (f64::from(input.doy) - PT[13])).pcos());
        t[0] = tinf;
        let xmm = PDM[2][4];
        let z = alt;

        // N2 density.
        let db28 = PDM[2][0] * g28.pexp() * PD[2][0];
        d[2] = self.densu(
            z, db28, tinf, tlb, 28.0, alpha[2], &mut t[1], PTM[5], s, &zn1,
        );
        let zh28 = PDM[2][2] * zhf;
        let zhm28 = PDM[2][3] * PDL[1][5];
        let xmd = 28.0 - xmm;
        let b28 = self.densu(
            zh28,
            db28,
            tinf,
            tlb,
            xmd,
            alpha[2] - 1.0,
            &mut tz,
            PTM[5],
            s,
            &zn1,
        );
        if sw[15] != 0.0 && z <= altl[2] {
            self.dm28 = self.densu(z, b28, tinf, tlb, xmm, alpha[2], &mut tz, PTM[5], s, &zn1);
            d[2] = dnet(d[2], self.dm28, zhm28, xmm, 28.0);
        }

        // He density.
        let g4 = sw[21] * self.globe7(&PD[0], input, ap_a);
        let db04 = PDM[0][0] * g4.pexp() * PD[0][0];
        d[0] = self.densu(z, db04, tinf, tlb, 4., alpha[0], &mut t[1], PTM[5], s, &zn1);
        if sw[15] != 0.0 && z < altl[0] {
            let zh04 = PDM[0][2];
            let b04 = self.densu(
                zh04,
                db04,
                tinf,
                tlb,
                4. - xmm,
                alpha[0] - 1.,
                &mut t[1],
                PTM[5],
                s,
                &zn1,
            );
            let dm04 = self.densu(z, b04, tinf, tlb, xmm, 0., &mut t[1], PTM[5], s, &zn1);
            let zhm04 = zhm28;
            d[0] = dnet(d[0], dm04, zhm04, xmm, 4.);
            let rl = (b28 * PDM[0][1] / b04).pln();
            let zc04 = PDM[0][4] * PDL[1][0];
            let hc04 = PDM[0][5] * PDL[1][1];
            d[0] *= ccor(z, rl, hc04, zc04);
        }

        // O density.
        let g16 = sw[21] * self.globe7(&PD[1], input, ap_a);
        let db16 = PDM[1][0] * g16.pexp() * PD[1][0];
        d[1] = self.densu(
            z, db16, tinf, tlb, 16., alpha[1], &mut t[1], PTM[5], s, &zn1,
        );
        if sw[15] != 0.0 && z <= altl[1] {
            let zh16 = PDM[1][2];
            let b16 = self.densu(
                zh16,
                db16,
                tinf,
                tlb,
                16.0 - xmm,
                alpha[1] - 1.0,
                &mut t[1],
                PTM[5],
                s,
                &zn1,
            );
            let dm16 = self.densu(z, b16, tinf, tlb, xmm, 0., &mut t[1], PTM[5], s, &zn1);
            let zhm16 = zhm28;
            d[1] = dnet(d[1], dm16, zhm16, xmm, 16.);
            let rl = PDM[1][1] * PDL[1][16] * (1.0 + sw[1] * PDL[0][23] * (input.f107a - 150.0));
            let hc16 = PDM[1][5] * PDL[1][3];
            let zc16 = PDM[1][4] * PDL[1][2];
            let hc216 = PDM[1][5] * PDL[1][4];
            d[1] *= ccor2(z, rl, hc16, zc16, hc216);
            // Chemistry correction.
            let hcc16 = PDM[1][7] * PDL[1][13];
            let zcc16 = PDM[1][6] * PDL[1][12];
            let rc16 = PDM[1][3] * PDL[1][14];
            d[1] *= ccor(z, rc16, hcc16, zcc16);
        }

        // O2 density.
        let g32 = sw[21] * self.globe7(&PD[4], input, ap_a);
        let db32 = PDM[3][0] * g32.pexp() * PD[4][0];
        d[3] = self.densu(
            z, db32, tinf, tlb, 32., alpha[3], &mut t[1], PTM[5], s, &zn1,
        );
        if sw[15] != 0.0 {
            if z <= altl[3] {
                let zh32 = PDM[3][2];
                let b32 = self.densu(
                    zh32,
                    db32,
                    tinf,
                    tlb,
                    32. - xmm,
                    alpha[3] - 1.,
                    &mut t[1],
                    PTM[5],
                    s,
                    &zn1,
                );
                let dm32 = self.densu(z, b32, tinf, tlb, xmm, 0., &mut t[1], PTM[5], s, &zn1);
                let zhm32 = zhm28;
                d[3] = dnet(d[3], dm32, zhm32, xmm, 32.);
                let rl = (b28 * PDM[3][1] / b32).pln();
                let hc32 = PDM[3][5] * PDL[1][7];
                let zc32 = PDM[3][4] * PDL[1][6];
                d[3] *= ccor(z, rl, hc32, zc32);
            }
            // Correction for general departure from diffusive equilibrium above Zlb.
            let hcc32 = PDM[3][7] * PDL[1][22];
            let hcc232 = PDM[3][7] * PDL[0][22];
            let zcc32 = PDM[3][6] * PDL[1][21];
            let rc32 = PDM[3][3] * PDL[1][23] * (1. + sw[1] * PDL[0][23] * (input.f107a - 150.));
            d[3] *= ccor2(z, rc32, hcc32, zcc32, hcc232);
        }

        // Ar density.
        let g40 = sw[21] * self.globe7(&PD[5], input, ap_a);
        let db40 = PDM[4][0] * g40.pexp() * PD[5][0];
        d[4] = self.densu(
            z, db40, tinf, tlb, 40., alpha[4], &mut t[1], PTM[5], s, &zn1,
        );
        if sw[15] != 0.0 && z <= altl[4] {
            let zh40 = PDM[4][2];
            let b40 = self.densu(
                zh40,
                db40,
                tinf,
                tlb,
                40. - xmm,
                alpha[4] - 1.,
                &mut t[1],
                PTM[5],
                s,
                &zn1,
            );
            let dm40 = self.densu(z, b40, tinf, tlb, xmm, 0., &mut t[1], PTM[5], s, &zn1);
            let zhm40 = zhm28;
            d[4] = dnet(d[4], dm40, zhm40, xmm, 40.);
            let rl = (b28 * PDM[4][1] / b40).pln();
            let hc40 = PDM[4][5] * PDL[1][9];
            let zc40 = PDM[4][4] * PDL[1][8];
            d[4] *= ccor(z, rl, hc40, zc40);
        }

        // Hydrogen density.
        let g1 = sw[21] * self.globe7(&PD[6], input, ap_a);
        let db01 = PDM[5][0] * g1.pexp() * PD[6][0];
        d[6] = self.densu(z, db01, tinf, tlb, 1., alpha[6], &mut t[1], PTM[5], s, &zn1);
        if sw[15] != 0.0 && z <= altl[6] {
            let zh01 = PDM[5][2];
            let b01 = self.densu(
                zh01,
                db01,
                tinf,
                tlb,
                1. - xmm,
                alpha[6] - 1.,
                &mut t[1],
                PTM[5],
                s,
                &zn1,
            );
            let dm01 = self.densu(z, b01, tinf, tlb, xmm, 0., &mut t[1], PTM[5], s, &zn1);
            let zhm01 = zhm28;
            d[6] = dnet(d[6], dm01, zhm01, xmm, 1.);
            let rl = (b28 * PDM[5][1] * (PDL[1][17] * PDL[1][17]).sqrt() / b01).pln();
            let hc01 = PDM[5][5] * PDL[1][11];
            let zc01 = PDM[5][4] * PDL[1][10];
            d[6] *= ccor(z, rl, hc01, zc01);
            // Chemistry correction.
            let hcc01 = PDM[5][7] * PDL[1][19];
            let zcc01 = PDM[5][6] * PDL[1][18];
            let rc01 = PDM[5][3] * PDL[1][20];
            d[6] *= ccor(z, rc01, hcc01, zcc01);
        }

        // Atomic nitrogen density.
        let g14 = sw[21] * self.globe7(&PD[7], input, ap_a);
        let db14 = PDM[6][0] * g14.pexp() * PD[7][0];
        d[7] = self.densu(
            z, db14, tinf, tlb, 14., alpha[7], &mut t[1], PTM[5], s, &zn1,
        );
        if sw[15] != 0.0 && z <= altl[7] {
            let zh14 = PDM[6][2];
            let b14 = self.densu(
                zh14,
                db14,
                tinf,
                tlb,
                14. - xmm,
                alpha[7] - 1.,
                &mut t[1],
                PTM[5],
                s,
                &zn1,
            );
            let dm14 = self.densu(z, b14, tinf, tlb, xmm, 0., &mut t[1], PTM[5], s, &zn1);
            let zhm14 = zhm28;
            d[7] = dnet(d[7], dm14, zhm14, xmm, 14.);
            let rl = (b28 * PDM[6][1] * (PDL[0][2] * PDL[0][2]).sqrt() / b14).pln();
            let hc14 = PDM[6][5] * PDL[0][1];
            let zc14 = PDM[6][4] * PDL[0][0];
            d[7] *= ccor(z, rl, hc14, zc14);
            // Chemistry correction.
            let hcc14 = PDM[6][7] * PDL[0][4];
            let zcc14 = PDM[6][6] * PDL[0][3];
            let rc14 = PDM[6][3] * PDL[0][5];
            d[7] *= ccor(z, rc14, hcc14, zcc14);
        }

        // Anomalous oxygen density.
        let g16h = sw[21] * self.globe7(&PD[8], input, ap_a);
        let db16h = PDM[7][0] * g16h.pexp() * PD[8][0];
        let tho = PDM[7][9] * PDL[0][6];
        let dd = self.densu(
            z, db16h, tho, tho, 16., alpha[8], &mut t[1], PTM[5], s, &zn1,
        );
        let zsht = PDM[7][5];
        let zmho = PDM[7][4];
        let zsho = self.scalh(zmho, 16.0, tho);
        d[8] = dd * (-zsht / zsho * ((-(z - zmho) / zsht).pexp() - 1.)).pexp();

        // Total mass density.
        d[5] = 1.66E-24
            * (4.0 * d[0]
                + 16.0 * d[1]
                + 28.0 * d[2]
                + 32.0 * d[3]
                + 40.0 * d[4]
                + d[6]
                + 14.0 * d[7]);

        // Temperature.
        let z = (alt * alt).sqrt();
        let _ = self.densu(z, 1.0, tinf, tlb, 0.0, 0.0, &mut t[1], PTM[5], s, &zn1);
        if sw[0] != 0.0 {
            for v in d.iter_mut() {
                *v *= 1.0E6;
            }
            d[5] /= 1000.0;
        }
        Output { d, t }
    }
}

/// Eq. A24d: the 3-hour magnetic-activity function.
fn g0(a: f64, p24: f64, p25: f64) -> f64 {
    a - 4.0
        + (p25 - 1.0)
            * (a - 4.0 + ((-(p24 * p24).sqrt() * (a - 4.0)).pexp() - 1.0) / (p24 * p24).sqrt())
}

/// Eq. A24c.
fn sumex(ex: f64) -> f64 {
    1.0 + (1.0 - ex.ppowf(19.0)) / (1.0 - ex) * ex.ppowf(0.5)
}

/// Eq. A24a.
fn sg0(ex: f64, p24: f64, p25: f64, ap: &[f64; 7]) -> f64 {
    (g0(ap[1], p24, p25)
        + (g0(ap[2], p24, p25) * ex
            + g0(ap[3], p24, p25) * ex * ex
            + g0(ap[4], p24, p25) * ex.ppowf(3.0)
            + (g0(ap[5], p24, p25) * ex.ppowf(4.0) + g0(ap[6], p24, p25) * ex.ppowf(12.0))
                * (1.0 - ex.ppowf(8.0))
                / (1.0 - ex)))
        / sumex(ex)
}

/// CCOR: chemistry/dissociation correction.
fn ccor(alt: f64, r: f64, h1: f64, zh: f64) -> f64 {
    let e = (alt - zh) / h1;
    if e > 70.0 {
        return 0.0f64.pexp();
    }
    if e < -70.0 {
        return r.pexp();
    }
    let ex = e.pexp();
    (r / (1.0 + ex)).pexp()
}

/// CCOR2: chemistry/dissociation correction with two transition scale lengths.
fn ccor2(alt: f64, r: f64, h1: f64, zh: f64, h2: f64) -> f64 {
    let e1 = (alt - zh) / h1;
    let e2 = (alt - zh) / h2;
    if e1 > 70.0 || e2 > 70.0 {
        return 0.0f64.pexp();
    }
    if e1 < -70.0 && e2 < -70.0 {
        return r.pexp();
    }
    let ex1 = e1.pexp();
    let ex2 = e2.pexp();
    (r / (1.0 + 0.5 * (ex1 + ex2))).pexp()
}

/// DNET: turbopause correction, combining the diffusive and fully mixed densities.
fn dnet(mut dd: f64, dm: f64, zhm: f64, xmm: f64, xm: f64) -> f64 {
    let a = zhm / (xmm - xm);
    if !(dm > 0.0 && dd > 0.0) {
        if dd == 0.0 && dm == 0.0 {
            dd = 1.0;
        }
        if dm == 0.0 {
            return dd;
        }
        if dd == 0.0 {
            return dm;
        }
    }
    let ylog = a * (dm / dd).pln();
    if ylog < -10.0 {
        return dd;
    }
    if ylog > 10.0 {
        return dm;
    }
    dd * (1.0 + ylog.pexp()).ppowf(1.0 / a)
}

/// SPLINI: integrate the cubic spline from `xa[0]` to `x`.
fn splini(xa: &[f64], ya: &[f64], y2a: &[f64], n: usize, x: f64) -> f64 {
    let mut yi = 0.0;
    let mut klo = 0;
    let mut khi = 1;
    while x > xa[klo] && khi < n {
        let mut xx = x;
        if khi < n - 1 {
            xx = if x < xa[khi] { x } else { xa[khi] };
        }
        let h = xa[khi] - xa[klo];
        let a = (xa[khi] - xx) / h;
        let b = (xx - xa[klo]) / h;
        let a2 = a * a;
        let b2 = b * b;
        yi += ((1.0 - a2) * ya[klo] / 2.0
            + b2 * ya[khi] / 2.0
            + ((-(1.0 + a2 * a2) / 4.0 + a2 / 2.0) * y2a[klo]
                + (b2 * b2 / 4.0 - b2 / 2.0) * y2a[khi])
                * h
                * h
                / 6.0)
            * h;
        klo += 1;
        khi += 1;
    }
    yi
}

/// SPLINT: cubic-spline interpolation.
fn splint(xa: &[f64], ya: &[f64], y2a: &[f64], n: usize, x: f64) -> f64 {
    let mut klo = 0;
    let mut khi = n - 1;
    while khi - klo > 1 {
        let k = (khi + klo) / 2;
        if xa[k] > x {
            khi = k;
        } else {
            klo = k;
        }
    }
    let h = xa[khi] - xa[klo];
    let a = (xa[khi] - x) / h;
    let b = (x - xa[klo]) / h;
    a * ya[klo]
        + b * ya[khi]
        + ((a * a * a - a) * y2a[klo] + (b * b * b - b) * y2a[khi]) * h * h / 6.0
}

/// SPLINE: second derivatives of the interpolating cubic spline (end derivatives `yp1`, `ypn`;
/// values ≥ 1e30 select a natural end).
fn spline(x: &[f64], y: &[f64], n: usize, yp1: f64, ypn: f64, y2: &mut [f64]) {
    let mut u = [0.0f64; 10];
    if yp1 > 0.99E30 {
        y2[0] = 0.0;
        u[0] = 0.0;
    } else {
        y2[0] = -0.5;
        u[0] = (3.0 / (x[1] - x[0])) * ((y[1] - y[0]) / (x[1] - x[0]) - yp1);
    }
    for i in 1..n - 1 {
        let sig = (x[i] - x[i - 1]) / (x[i + 1] - x[i - 1]);
        let p = sig * y2[i - 1] + 2.0;
        y2[i] = (sig - 1.0) / p;
        u[i] = (6.0
            * ((y[i + 1] - y[i]) / (x[i + 1] - x[i]) - (y[i] - y[i - 1]) / (x[i] - x[i - 1]))
            / (x[i + 1] - x[i - 1])
            - sig * u[i - 1])
            / p;
    }
    let (qn, un) = if ypn > 0.99E30 {
        (0.0, 0.0)
    } else {
        (
            0.5,
            (3.0 / (x[n - 1] - x[n - 2])) * (ypn - (y[n - 1] - y[n - 2]) / (x[n - 1] - x[n - 2])),
        )
    };
    y2[n - 1] = (un - qn * u[n - 2]) / (qn * y2[n - 2] + 1.0);
    for k in (0..n - 1).rev() {
        y2[k] = y2[k] * y2[k + 1] + u[k];
    }
}

/// NRLMSISE-00 `GTD7`: densities and temperatures at `input` under `flags`. The total mass
/// density `d[5]` excludes anomalous oxygen; use [`gtd7d`] for drag.
pub fn gtd7(input: &Input, flags: &Flags) -> Output {
    let mut ctx = Ctx::new(flags);
    let ap_a = input.ap_array.unwrap_or([input.ap; 7]);
    let sw = ctx.sw;
    let zmix = 62.5;

    // Latitude variation of gravity (none for sw[2] = 0).
    let xlat = if sw[2] == 0.0 { 45.0 } else { input.g_lat_deg };
    ctx.glatf(xlat);
    let xmm = PDM[2][4];

    // Thermosphere / mesosphere (above ZN2[0]).
    let altt = if input.alt_km > ZN2[0] {
        input.alt_km
    } else {
        ZN2[0]
    };
    let soutput = ctx.gts7(input, altt, &ap_a);
    let dm28m = if sw[0] != 0.0 {
        ctx.dm28 * 1.0E6
    } else {
        ctx.dm28
    };
    let mut out = Output {
        d: [0.0; 9],
        t: soutput.t,
    };
    if input.alt_km >= ZN2[0] {
        out.d = soutput.d;
        return out;
    }

    // Lower mesosphere / upper stratosphere (between ZN3[0] and ZN2[0]).
    ctx.meso_tgn2[0] = ctx.meso_tgn1[1];
    ctx.meso_tn2[0] = ctx.meso_tn1[4];
    ctx.meso_tn2[1] = PMA[0][0] * PAVGM[0] / (1.0 - sw[20] * ctx.glob7s(&PMA[0], input));
    ctx.meso_tn2[2] = PMA[1][0] * PAVGM[1] / (1.0 - sw[20] * ctx.glob7s(&PMA[1], input));
    ctx.meso_tn2[3] = PMA[2][0] * PAVGM[2] / (1.0 - sw[20] * sw[22] * ctx.glob7s(&PMA[2], input));
    ctx.meso_tgn2[1] = PAVGM[8]
        * PMA[9][0]
        * (1.0 + sw[20] * sw[22] * ctx.glob7s(&PMA[9], input))
        * ctx.meso_tn2[3]
        * ctx.meso_tn2[3]
        / (PMA[2][0] * PAVGM[2]).ppowf(2.0);
    ctx.meso_tn3[0] = ctx.meso_tn2[3];

    if input.alt_km <= ZN3[0] {
        // Lower stratosphere and troposphere (below ZN3[0]).
        ctx.meso_tgn3[0] = ctx.meso_tgn2[1];
        ctx.meso_tn3[1] = PMA[3][0] * PAVGM[3] / (1.0 - sw[22] * ctx.glob7s(&PMA[3], input));
        ctx.meso_tn3[2] = PMA[4][0] * PAVGM[4] / (1.0 - sw[22] * ctx.glob7s(&PMA[4], input));
        ctx.meso_tn3[3] = PMA[5][0] * PAVGM[5] / (1.0 - sw[22] * ctx.glob7s(&PMA[5], input));
        ctx.meso_tn3[4] = PMA[6][0] * PAVGM[6] / (1.0 - sw[22] * ctx.glob7s(&PMA[6], input));
        ctx.meso_tgn3[1] = PMA[7][0]
            * PAVGM[7]
            * (1.0 + sw[22] * ctx.glob7s(&PMA[7], input))
            * ctx.meso_tn3[4]
            * ctx.meso_tn3[4]
            / (PMA[6][0] * PAVGM[6]).ppowf(2.0);
    }

    // Linear transition to full mixing below ZN2[0].
    let mut dmc = 0.0;
    if input.alt_km > zmix {
        dmc = 1.0 - (ZN2[0] - input.alt_km) / (ZN2[0] - zmix);
    }
    let dz28 = soutput.d[2];
    let mut tz = 0.0;

    // N2 density.
    let dmr = soutput.d[2] / dm28m - 1.0;
    out.d[2] = ctx.densm(input.alt_km, dm28m, xmm, &mut tz);
    out.d[2] *= 1.0 + dmr * dmc;
    // He density.
    let dmr = soutput.d[0] / (dz28 * PDM[0][1]) - 1.0;
    out.d[0] = out.d[2] * PDM[0][1] * (1.0 + dmr * dmc);
    // O density.
    out.d[1] = 0.0;
    out.d[8] = 0.0;
    // O2 density.
    let dmr = soutput.d[3] / (dz28 * PDM[3][1]) - 1.0;
    out.d[3] = out.d[2] * PDM[3][1] * (1.0 + dmr * dmc);
    // Ar density.
    let dmr = soutput.d[4] / (dz28 * PDM[4][1]) - 1.0;
    out.d[4] = out.d[2] * PDM[4][1] * (1.0 + dmr * dmc);
    // Hydrogen and atomic nitrogen.
    out.d[6] = 0.0;
    out.d[7] = 0.0;
    // Total mass density.
    out.d[5] = 1.66E-24
        * (4.0 * out.d[0]
            + 16.0 * out.d[1]
            + 28.0 * out.d[2]
            + 32.0 * out.d[3]
            + 40.0 * out.d[4]
            + out.d[6]
            + 14.0 * out.d[7]);
    if sw[0] != 0.0 {
        out.d[5] /= 1000.0;
    }
    // Temperature at altitude.
    let _ = ctx.densm(input.alt_km, 1.0, 0.0, &mut tz);
    out.t[1] = tz;
    out
}

/// NRLMSISE-00 `GTD7D`: as [`gtd7`], with the total mass density `d[5]` the **effective** total
/// including anomalous oxygen — the density for satellite drag (the NRL recommendation above
/// 500 km; identical to `gtd7` where anomalous oxygen is negligible).
pub fn gtd7d(input: &Input, flags: &Flags) -> Output {
    let mut out = gtd7(input, flags);
    let d = &out.d;
    let mut rho = 1.66E-24
        * (4.0 * d[0]
            + 16.0 * d[1]
            + 28.0 * d[2]
            + 32.0 * d[3]
            + 40.0 * d[4]
            + d[6]
            + 14.0 * d[7]
            + 16.0 * d[8]);
    if flags.switches[0] == 1 {
        rho /= 1000.0;
    }
    out.d[5] = rho;
    out
}

/// The drag-facing convenience: the [`gtd7d`] total mass density (kg/m³) with every switch on
/// (daily-Ap mode), at day of year `doy`, UT `ut_s` (s of day), geodetic altitude `alt_km`,
/// geodetic latitude/longitude (deg), the 81-day mean and previous-day F10.7 (sfu) and the
/// daily Ap, with the local solar time `ut_s/3600 + lon_deg/15` (h).
#[allow(clippy::too_many_arguments)]
pub fn density_kg_m3(
    doy: i32,
    ut_s: f64,
    alt_km: f64,
    lat_deg: f64,
    lon_deg: f64,
    f107a: f64,
    f107: f64,
    ap: f64,
) -> f64 {
    let input = Input {
        doy,
        sec: ut_s,
        alt_km,
        g_lat_deg: lat_deg,
        g_long_deg: lon_deg,
        lst_h: ut_s / 3600.0 + lon_deg / 15.0,
        f107a,
        f107,
        ap,
        ap_array: None,
    };
    gtd7d(&input, &Flags::default()).d[5]
}

/// Day of year (1-based) and seconds of day of the Julian Date `jd` (Gregorian calendar; the
/// time scale is whatever `jd` is in). Used by the drag tier with `jd` in TT standing for UT.
pub fn doy_and_seconds(jd: f64) -> (i32, f64) {
    // Fliegel & Van Flandern civil date of the day containing jd.
    let jd_shift = jd + 0.5;
    let day_number = jd_shift.floor();
    let mut sec = (jd_shift - day_number) * 86_400.0;
    if sec >= 86_400.0 {
        sec = 0.0;
    }
    let j = day_number as i64;
    let l = j + 68_569;
    let n = 4 * l / 146_097;
    let l = l - (146_097 * n + 3) / 4;
    let i = 4000 * (l + 1) / 1_461_001;
    let l = l - 1461 * i / 4 + 31;
    let jm = 80 * l / 2447;
    let l2 = jm / 11;
    let year = 100 * (n - 49) + i + l2;
    // Day number of 1 January of that year: JDN(year, 1, 1).
    let y = year + 4799;
    let jan1 = 1 + 306 + 365 * y + y / 4 - y / 100 + y / 400 - 32_045;
    ((j - jan1 + 1) as i32, sec)
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn doy_and_seconds_matches_known_dates() {
        // J2000.0 = 2000-01-01 12:00 TT.
        assert_eq!(doy_and_seconds(2_451_545.0), (1, 43_200.0));
        // 2001-06-21 00:00 is day 172.
        let (d, s) = doy_and_seconds(2_452_081.5);
        assert_eq!((d, s), (172, 0.0));
        // 2004-12-31 (leap year) is day 366.
        assert_eq!(doy_and_seconds(2_453_370.5).0, 366);
    }

    #[test]
    fn default_density_falls_with_altitude_and_rises_with_activity() {
        let rho = |alt, f| density_kg_m3(172, 29_000.0, alt, 60.0, -70.0, f, f, 4.0);
        assert!(rho(200.0, 150.0) > rho(400.0, 150.0));
        assert!(rho(400.0, 150.0) > rho(800.0, 150.0));
        assert!(rho(400.0, 250.0) > rho(400.0, 70.0));
    }

    #[test]
    fn gtd7d_differs_from_gtd7_only_by_anomalous_oxygen() {
        let input = Input {
            doy: 172,
            sec: 29_000.0,
            alt_km: 1000.0,
            g_lat_deg: 60.0,
            g_long_deg: -70.0,
            lst_h: 16.0,
            f107a: 150.0,
            f107: 150.0,
            ap: 4.0,
            ap_array: None,
        };
        let f = Flags::default();
        let a = gtd7(&input, &f);
        let b = gtd7d(&input, &f);
        let extra = 1.66E-24 * 16.0 * a.d[8] / 1000.0;
        assert!(((b.d[5] - a.d[5]) / extra - 1.0).abs() < 1e-9);
    }
}
