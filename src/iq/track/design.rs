// SPDX-License-Identifier: AGPL-3.0-only
//! **Loop-design files** (`kshana.loop-design/1`): tracking-loop designs written as TOML,
//! so a design can be set from the command line, Python, MCP or a campaign file without
//! writing Rust. The schema is documented in `docs/design/LOOP-DESIGN-TOML.md`.
//!
//! A file holds one or more `[[design]]` tables. Every field is optional and defaults to
//! [`LoopConfig::default`], the default [`LockConfig`] and the auto acquisition hand-off;
//! unknown keys are refused, so a misspelt key never silently falls back to a default. A
//! design may `extends` another design in the same file (or `"default"`).
//!
//! ```
//! use kshana::iq::track::design::DesignFile;
//! let file = DesignFile::parse(r#"
//!     schema = "kshana.loop-design/1"
//!     [[design]]
//!     name = "narrow"
//!     [design.carrier]
//!     pll_bw_hz = 5.0
//!     [[design]]
//!     name = "narrow-wide-dll"
//!     extends = "narrow"
//!     [design.code]
//!     bw_hz = 5.0
//! "#).unwrap();
//! let d = file.get("narrow-wide-dll").unwrap();
//! assert_eq!(d.loop_config().dll_bn_hz, 5.0);
//! assert_eq!(d.hash().len(), 64);
//! ```
//!
//! This module is the stable interface the campaign runner builds on:
//! [`DesignFile::parse`], [`DesignFile::designs`] and [`Design`]'s accessors.

use super::cn0::BitSyncConfig;
use super::discrim::{DllDiscriminator, FllDiscriminator, PllDiscriminator};
use super::{CarrierLoop, FllAssist, FllGate, LoopConfig};
use crate::iq::acq::{auto_coherent_periods, default_step_hz, AcqConfig};
use serde::{Deserialize, Serialize};
use std::collections::BTreeMap;

/// The schema identifier a loop-design file must carry.
pub const SCHEMA: &str = "kshana.loop-design/1";

/// The lock state machine's settings (see [`super::lock`]).
#[derive(Clone, Debug, PartialEq, Serialize, Deserialize)]
pub struct LockConfig {
    /// Longest time (s) a channel may stay in pull-in before it is declared lost.
    pub pull_in_max_s: f64,
    /// Dwell (s): a locked channel is declared lost once phase or code lock has been lost
    /// this long, and a channel is declared locked once both have held this long.
    pub loss_dwell_s: f64,
    /// Run the FLL/PLL ±1/(2T) ambiguity check while locked.
    pub false_lock_check: bool,
    /// An alias Doppler bin must exceed the tracked bin by this much (dB) to be a false lock.
    pub false_lock_margin_db: f64,
    /// Re-acquire a lost channel around its last Doppler. Off in the built-in default, so
    /// enabling the state machine never changes a track by itself.
    pub reacquire: bool,
    /// Half-width (Hz) of the re-acquisition Doppler search, centred on the last Doppler.
    pub reacq_doppler_window_hz: f64,
    /// How long (s) a lost channel keeps trying to re-acquire, from the moment it was
    /// lost, before it is retired. Re-acquisition succeeds when the channel locks again.
    pub reacq_window_s: f64,
    /// Wait (s) after a failed search before the next. With the default
    /// `reacq_max_interval_s` equal to it the searches are evenly spaced, so the retry
    /// schedule adds at most this much to a measured re-acquisition time.
    pub reacq_interval_s: f64,
    /// Optional back-off: when above `reacq_interval_s`, the wait doubles after each
    /// failure up to this (s). Equal to `reacq_interval_s` by default (no back-off).
    pub reacq_max_interval_s: f64,
    /// Optional cap on failed searches per loss (0 = no cap; the window alone decides).
    pub max_reacq_attempts: u32,
}

impl Default for LockConfig {
    fn default() -> Self {
        Self {
            pull_in_max_s: 2.0,
            loss_dwell_s: 0.2,
            false_lock_check: true,
            false_lock_margin_db: 3.0,
            reacquire: false,
            reacq_doppler_window_hz: 500.0,
            reacq_window_s: 30.0,
            reacq_interval_s: 0.1,
            reacq_max_interval_s: 0.1,
            max_reacq_attempts: 0,
        }
    }
}

/// `"auto"` or an explicit value.
#[derive(Clone, Copy, Debug, PartialEq, Serialize, Deserialize)]
#[serde(untagged)]
pub enum Auto<T> {
    /// An explicit value.
    Value(T),
    /// The keyword `"auto"`.
    Keyword(AutoKeyword),
}

/// The literal `"auto"`.
#[derive(Clone, Copy, Debug, PartialEq, Eq, Serialize, Deserialize)]
#[serde(rename_all = "lowercase")]
pub enum AutoKeyword {
    /// Choose automatically.
    Auto,
}

impl<T: Copy> Auto<T> {
    /// The explicit value, or `None` for `"auto"`.
    pub fn value(&self) -> Option<T> {
        match self {
            Auto::Value(v) => Some(*v),
            Auto::Keyword(_) => None,
        }
    }
}

/// The hand-off (and re-acquisition) search of a design.
#[derive(Clone, Debug, PartialEq, Serialize, Deserialize)]
pub struct AcquisitionDesign {
    /// Coherent code periods, or auto (`ceil(4 ms / full code period)`).
    pub coherent_periods: Auto<usize>,
    /// Non-coherent sums.
    pub noncoherent: usize,
    /// Doppler search half-width (Hz).
    pub doppler_max_hz: f64,
    /// Doppler bin (Hz), or auto ([`default_step_hz`]: `2 / (3 · N · T_code)`, capped at
    /// `0.4 / T_track` so the hand-off residual stays inside the FLL's pull-in).
    pub doppler_step_hz: Auto<f64>,
    /// Search-wide false-alarm probability.
    pub pfa: f64,
}

impl Default for AcquisitionDesign {
    fn default() -> Self {
        Self {
            coherent_periods: Auto::Keyword(AutoKeyword::Auto),
            noncoherent: 1,
            doppler_max_hz: 5000.0,
            doppler_step_hz: Auto::Keyword(AutoKeyword::Auto),
            pfa: 1e-3,
        }
    }
}

impl AcquisitionDesign {
    /// The search for a code whose full period is `code_period_s`, handing over to loops
    /// that integrate for `t_track_s`.
    pub fn acq_config(&self, code_period_s: f64, t_track_s: f64) -> AcqConfig {
        let n = self
            .coherent_periods
            .value()
            .unwrap_or_else(|| auto_coherent_periods(code_period_s))
            .max(1);
        AcqConfig {
            coherent_periods: n,
            noncoherent: self.noncoherent.max(1),
            doppler_max_hz: self.doppler_max_hz,
            doppler_step_hz: self
                .doppler_step_hz
                .value()
                .unwrap_or_else(|| default_step_hz(code_period_s, n, t_track_s)),
            pfa: self.pfa,
        }
    }
}

/// One resolved loop design: every field set, validated, with its hash.
#[derive(Clone, Debug, PartialEq)]
pub struct Design {
    name: String,
    description: Option<String>,
    resolved: Resolved,
    hash: String,
}

/// The fully resolved design, as hashed and as written into outputs.
#[derive(Clone, Debug, PartialEq, Serialize)]
struct Resolved {
    schema: &'static str,
    integration: Integration,
    carrier: Carrier,
    code: Code,
    lock: Lock,
    bit_sync: BitSync,
    acquisition: AcquisitionDesign,
}

// ---- The file format: every field optional, unknown keys refused. ----

#[derive(Debug, Default, Deserialize)]
#[serde(deny_unknown_fields)]
struct RawFile {
    schema: Option<String>,
    #[serde(default)]
    design: Vec<RawDesign>,
}

#[derive(Clone, Debug, Default, Deserialize)]
#[serde(deny_unknown_fields)]
struct RawDesign {
    name: Option<String>,
    extends: Option<String>,
    description: Option<String>,
    #[serde(default)]
    integration: RawIntegration,
    #[serde(default)]
    carrier: RawCarrier,
    #[serde(default)]
    code: RawCode,
    #[serde(default)]
    lock: RawLock,
    #[serde(default)]
    bit_sync: RawBitSync,
    #[serde(default)]
    acquisition: RawAcquisition,
}

#[derive(Clone, Debug, Default, Deserialize)]
#[serde(deny_unknown_fields)]
struct RawIntegration {
    coherent_periods: Option<usize>,
    spacing_chips: Option<f64>,
}

#[derive(Clone, Debug, Default, Deserialize)]
#[serde(deny_unknown_fields)]
struct RawCarrier {
    kind: Option<String>,
    pll_order: Option<u8>,
    pll_bw_hz: Option<f64>,
    fll_order: Option<u8>,
    fll_bw_hz: Option<f64>,
    pll_discriminator: Option<String>,
    fll_discriminator: Option<String>,
    fll_assist: Option<String>,
    fll_off_pli: Option<f64>,
    fll_on_pli: Option<f64>,
    fll_gate_dwell_s: Option<f64>,
}

#[derive(Clone, Debug, Default, Deserialize)]
#[serde(deny_unknown_fields)]
struct RawCode {
    order: Option<u8>,
    bw_hz: Option<f64>,
    discriminator: Option<String>,
    carrier_aiding: Option<bool>,
}

#[derive(Clone, Debug, Default, Deserialize)]
#[serde(deny_unknown_fields)]
struct RawLock {
    pli_threshold: Option<f64>,
    code_lock_cn0_dbhz: Option<f64>,
    cn0_windows: Option<usize>,
    cn0_window_periods: Option<usize>,
    pull_in_max_s: Option<f64>,
    loss_dwell_s: Option<f64>,
    false_lock_check: Option<bool>,
    false_lock_margin_db: Option<f64>,
    reacquire: Option<bool>,
    reacq_doppler_window_hz: Option<f64>,
    reacq_window_s: Option<f64>,
    reacq_interval_s: Option<f64>,
    reacq_max_interval_s: Option<f64>,
    max_reacq_attempts: Option<u32>,
}

#[derive(Clone, Debug, Default, Deserialize)]
#[serde(deny_unknown_fields)]
struct RawBitSync {
    min_votes: Option<u32>,
    ratio: Option<f64>,
}

#[derive(Clone, Debug, Default, Deserialize)]
#[serde(deny_unknown_fields)]
struct RawAcquisition {
    coherent_periods: Option<Auto<usize>>,
    noncoherent: Option<usize>,
    doppler_max_hz: Option<f64>,
    doppler_step_hz: Option<Auto<f64>>,
    pfa: Option<f64>,
}

// ---- Resolved sections (what is hashed). ----

#[derive(Clone, Debug, PartialEq, Serialize)]
struct Integration {
    coherent_periods: usize,
    spacing_chips: f64,
}

#[derive(Clone, Debug, PartialEq, Serialize)]
struct Carrier {
    kind: String,
    pll_order: Option<u8>,
    pll_bw_hz: Option<f64>,
    fll_order: Option<u8>,
    fll_bw_hz: Option<f64>,
    pll_discriminator: String,
    fll_discriminator: String,
    fll_assist: Option<String>,
    fll_off_pli: Option<f64>,
    fll_on_pli: Option<f64>,
    fll_gate_dwell_s: Option<f64>,
}

#[derive(Clone, Debug, PartialEq, Serialize)]
struct Code {
    order: u8,
    bw_hz: f64,
    discriminator: String,
    carrier_aiding: bool,
}

#[derive(Clone, Debug, PartialEq, Serialize)]
struct Lock {
    pli_threshold: f64,
    code_lock_cn0_dbhz: f64,
    cn0_windows: usize,
    cn0_window_periods: usize,
    #[serde(flatten)]
    machine: LockConfig,
}

#[derive(Clone, Debug, PartialEq, Serialize)]
struct BitSync {
    min_votes: u32,
    ratio: f64,
}

/// The keyword names of the discriminators, in both directions.
fn pll_disc(s: &str) -> Result<PllDiscriminator, String> {
    Ok(match s {
        "atan2" => PllDiscriminator::Atan2,
        "costas-atan" => PllDiscriminator::CostasAtan,
        "costas-decision-directed" => PllDiscriminator::CostasDecisionDirected,
        o => {
            return Err(format!(
                "carrier.pll_discriminator {o:?}: expected atan2, costas-atan or costas-decision-directed"
            ))
        }
    })
}

fn pll_disc_name(d: PllDiscriminator) -> &'static str {
    match d {
        PllDiscriminator::Atan2 => "atan2",
        PllDiscriminator::CostasAtan => "costas-atan",
        PllDiscriminator::CostasDecisionDirected => "costas-decision-directed",
    }
}

fn fll_disc(s: &str) -> Result<FllDiscriminator, String> {
    Ok(match s {
        "cross-product" => FllDiscriminator::CrossProduct,
        "atan2" => FllDiscriminator::Atan2,
        "atan2-pilot" => FllDiscriminator::Atan2Pilot,
        o => {
            return Err(format!(
                "carrier.fll_discriminator {o:?}: expected cross-product, atan2 or atan2-pilot"
            ))
        }
    })
}

fn fll_disc_name(d: FllDiscriminator) -> &'static str {
    match d {
        FllDiscriminator::CrossProduct => "cross-product",
        FllDiscriminator::Atan2 => "atan2",
        FllDiscriminator::Atan2Pilot => "atan2-pilot",
    }
}

/// Checks an `fll_assist` keyword; the gate settings come from their own keys.
fn fll_assist(s: &str) -> Result<FllAssist, String> {
    match s {
        "pull-in" => Ok(FllAssist::default()),
        "always" => Ok(FllAssist::Always),
        o => Err(format!(
            "carrier.fll_assist {o:?}: expected pull-in or always"
        )),
    }
}

fn fll_assist_name(a: FllAssist) -> &'static str {
    match a {
        FllAssist::PullIn(_) => "pull-in",
        FllAssist::Always => "always",
    }
}

fn dll_disc(s: &str) -> Result<DllDiscriminator, String> {
    Ok(match s {
        "eml-power" => DllDiscriminator::EarlyMinusLatePower,
        "dot-product" => DllDiscriminator::DotProduct,
        "eml-envelope" => DllDiscriminator::EarlyMinusLateEnvelope,
        o => {
            return Err(format!(
                "code.discriminator {o:?}: expected eml-power, dot-product or eml-envelope"
            ))
        }
    })
}

fn dll_disc_name(d: DllDiscriminator) -> &'static str {
    match d {
        DllDiscriminator::EarlyMinusLatePower => "eml-power",
        DllDiscriminator::DotProduct => "dot-product",
        DllDiscriminator::EarlyMinusLateEnvelope => "eml-envelope",
    }
}

impl Resolved {
    /// The built-in default: [`LoopConfig::default`], [`LockConfig::default`] and the auto
    /// hand-off.
    fn builtin() -> Self {
        let c = LoopConfig::default();
        let (kind, po, pb, fo, fb) = carrier_fields(&c.carrier);
        let assisted = c.carrier.has_pll() && c.carrier.has_fll();
        let gate = match c.fll_assist {
            FllAssist::PullIn(g) => g,
            FllAssist::Always => FllGate::default(),
        };
        Self {
            schema: SCHEMA,
            integration: Integration {
                coherent_periods: c.coherent_periods,
                spacing_chips: c.spacing_chips,
            },
            carrier: Carrier {
                kind: kind.into(),
                pll_order: po,
                pll_bw_hz: pb,
                fll_order: fo,
                fll_bw_hz: fb,
                pll_discriminator: pll_disc_name(c.pll_discriminator).into(),
                fll_discriminator: fll_disc_name(c.fll_discriminator).into(),
                fll_assist: assisted.then(|| fll_assist_name(c.fll_assist).into()),
                fll_off_pli: assisted.then_some(gate.off_pli),
                fll_on_pli: assisted.then_some(gate.on_pli),
                fll_gate_dwell_s: assisted.then_some(gate.dwell_s),
            },
            code: Code {
                order: c.dll_order,
                bw_hz: c.dll_bn_hz,
                discriminator: dll_disc_name(c.dll).into(),
                carrier_aiding: c.carrier_aiding,
            },
            lock: Lock {
                pli_threshold: c.pli_threshold,
                code_lock_cn0_dbhz: c.code_lock_cn0_dbhz,
                cn0_windows: c.cn0_windows,
                cn0_window_periods: c.cn0_window_periods,
                machine: LockConfig::default(),
            },
            bit_sync: BitSync {
                min_votes: c.bit_sync.min_votes,
                ratio: c.bit_sync.ratio,
            },
            acquisition: AcquisitionDesign::default(),
        }
    }

    /// `self` with every field `raw` sets replaced. The carrier `kind` decides which of the
    /// PLL/FLL keys exist: switching kind drops the keys the new kind has no use for and
    /// fills the ones it needs from the built-in default.
    fn apply(mut self, raw: &RawDesign, who: &str) -> Result<Self, String> {
        let at = |m: String| format!("design {who:?}: {m}");
        let i = &raw.integration;
        set(&mut self.integration.coherent_periods, i.coherent_periods);
        set(&mut self.integration.spacing_chips, i.spacing_chips);

        let c = &raw.carrier;
        if let Some(k) = &c.kind {
            if !["pll", "fll", "fll-assisted-pll"].contains(&k.as_str()) {
                return Err(at(format!(
                    "carrier.kind {k:?}: expected pll, fll or fll-assisted-pll"
                )));
            }
            if *k != self.carrier.kind {
                let base = Self::builtin().carrier;
                self.carrier.kind = k.clone();
                let has_pll = k != "fll";
                let has_fll = k != "pll";
                self.carrier.pll_order =
                    has_pll.then(|| self.carrier.pll_order.or(base.pll_order).unwrap_or(2));
                self.carrier.pll_bw_hz =
                    has_pll.then(|| self.carrier.pll_bw_hz.or(base.pll_bw_hz).unwrap_or(15.0));
                self.carrier.fll_order =
                    has_fll.then(|| self.carrier.fll_order.or(base.fll_order).unwrap_or(1));
                self.carrier.fll_bw_hz =
                    has_fll.then(|| self.carrier.fll_bw_hz.or(base.fll_bw_hz).unwrap_or(10.0));
                let assisted = has_pll && has_fll;
                self.carrier.fll_assist = assisted.then(|| {
                    self.carrier
                        .fll_assist
                        .clone()
                        .or(base.fll_assist)
                        .unwrap_or_else(|| "pull-in".into())
                });
                self.carrier.fll_off_pli = assisted
                    .then(|| self.carrier.fll_off_pli.or(base.fll_off_pli))
                    .flatten();
                self.carrier.fll_on_pli = assisted
                    .then(|| self.carrier.fll_on_pli.or(base.fll_on_pli))
                    .flatten();
                self.carrier.fll_gate_dwell_s = assisted
                    .then(|| self.carrier.fll_gate_dwell_s.or(base.fll_gate_dwell_s))
                    .flatten();
            }
        }
        let has_pll = self.carrier.kind != "fll";
        let has_fll = self.carrier.kind != "pll";
        for (key, given, allowed) in [
            ("pll_order", c.pll_order.is_some(), has_pll),
            ("pll_bw_hz", c.pll_bw_hz.is_some(), has_pll),
            ("fll_order", c.fll_order.is_some(), has_fll),
            ("fll_bw_hz", c.fll_bw_hz.is_some(), has_fll),
            ("fll_assist", c.fll_assist.is_some(), has_pll && has_fll),
            ("fll_off_pli", c.fll_off_pli.is_some(), has_pll && has_fll),
            ("fll_on_pli", c.fll_on_pli.is_some(), has_pll && has_fll),
            (
                "fll_gate_dwell_s",
                c.fll_gate_dwell_s.is_some(),
                has_pll && has_fll,
            ),
        ] {
            if given && !allowed {
                return Err(at(format!(
                    "carrier.{key} does not apply to carrier.kind = {:?}",
                    self.carrier.kind
                )));
            }
        }
        if c.pll_order.is_some() {
            self.carrier.pll_order = c.pll_order;
        }
        if c.pll_bw_hz.is_some() {
            self.carrier.pll_bw_hz = c.pll_bw_hz;
        }
        if c.fll_order.is_some() {
            self.carrier.fll_order = c.fll_order;
        }
        if c.fll_bw_hz.is_some() {
            self.carrier.fll_bw_hz = c.fll_bw_hz;
        }
        if let Some(d) = &c.pll_discriminator {
            pll_disc(d).map_err(at)?;
            self.carrier.pll_discriminator = d.clone();
        }
        if let Some(d) = &c.fll_discriminator {
            fll_disc(d).map_err(at)?;
            self.carrier.fll_discriminator = d.clone();
        }
        if let Some(a) = &c.fll_assist {
            fll_assist(a).map_err(at)?;
            self.carrier.fll_assist = Some(a.clone());
        }
        set_some(&mut self.carrier.fll_off_pli, c.fll_off_pli);
        set_some(&mut self.carrier.fll_on_pli, c.fll_on_pli);
        set_some(&mut self.carrier.fll_gate_dwell_s, c.fll_gate_dwell_s);

        let k = &raw.code;
        set(&mut self.code.order, k.order);
        set(&mut self.code.bw_hz, k.bw_hz);
        set(&mut self.code.carrier_aiding, k.carrier_aiding);
        if let Some(d) = &k.discriminator {
            dll_disc(d).map_err(at)?;
            self.code.discriminator = d.clone();
        }

        let l = &raw.lock;
        set(&mut self.lock.pli_threshold, l.pli_threshold);
        set(&mut self.lock.code_lock_cn0_dbhz, l.code_lock_cn0_dbhz);
        set(&mut self.lock.cn0_windows, l.cn0_windows);
        set(&mut self.lock.cn0_window_periods, l.cn0_window_periods);
        let m = &mut self.lock.machine;
        set(&mut m.pull_in_max_s, l.pull_in_max_s);
        set(&mut m.loss_dwell_s, l.loss_dwell_s);
        set(&mut m.false_lock_check, l.false_lock_check);
        set(&mut m.false_lock_margin_db, l.false_lock_margin_db);
        set(&mut m.reacquire, l.reacquire);
        set(&mut m.reacq_doppler_window_hz, l.reacq_doppler_window_hz);
        set(&mut m.reacq_window_s, l.reacq_window_s);
        set(&mut m.reacq_interval_s, l.reacq_interval_s);
        set(&mut m.reacq_max_interval_s, l.reacq_max_interval_s);
        set(&mut m.max_reacq_attempts, l.max_reacq_attempts);

        set(&mut self.bit_sync.min_votes, raw.bit_sync.min_votes);
        set(&mut self.bit_sync.ratio, raw.bit_sync.ratio);

        let a = &raw.acquisition;
        set(&mut self.acquisition.coherent_periods, a.coherent_periods);
        set(&mut self.acquisition.noncoherent, a.noncoherent);
        set(&mut self.acquisition.doppler_max_hz, a.doppler_max_hz);
        set(&mut self.acquisition.doppler_step_hz, a.doppler_step_hz);
        set(&mut self.acquisition.pfa, a.pfa);

        self.validate().map_err(at)?;
        Ok(self)
    }

    /// Range checks the loop code would otherwise only report at run time.
    fn validate(&self) -> Result<(), String> {
        let pos = |v: f64, k: &str| {
            if v.is_finite() && v > 0.0 {
                Ok(())
            } else {
                Err(format!("{k} must be a positive number (got {v})"))
            }
        };
        if self.integration.coherent_periods == 0 {
            return Err("integration.coherent_periods must be at least 1".into());
        }
        let d = self.integration.spacing_chips;
        if !(d.is_finite() && d > 0.0 && d <= 2.0) {
            return Err(format!(
                "integration.spacing_chips must lie in (0, 2] (got {d})"
            ));
        }
        if let (Some(off), Some(on)) = (self.carrier.fll_off_pli, self.carrier.fll_on_pli) {
            if !(on.is_finite() && off.is_finite() && on > -1.0 && on < off && off <= 1.0) {
                return Err(format!(
                    "carrier.fll_on_pli ({on}) must be below carrier.fll_off_pli ({off}), \
                     both in (-1, 1]"
                ));
            }
        }
        if let Some(t) = self.carrier.fll_gate_dwell_s {
            if !(t.is_finite() && t >= 0.0) {
                return Err(format!(
                    "carrier.fll_gate_dwell_s must be zero or positive (got {t})"
                ));
            }
        }
        if let (Some(o), Some(b)) = (self.carrier.pll_order, self.carrier.pll_bw_hz) {
            if !(1..=3).contains(&o) {
                return Err(format!("carrier.pll_order must be 1, 2 or 3 (got {o})"));
            }
            pos(b, "carrier.pll_bw_hz")?;
        }
        if let (Some(o), Some(b)) = (self.carrier.fll_order, self.carrier.fll_bw_hz) {
            if !(1..=2).contains(&o) {
                return Err(format!("carrier.fll_order must be 1 or 2 (got {o})"));
            }
            pos(b, "carrier.fll_bw_hz")?;
        }
        if !(1..=2).contains(&self.code.order) {
            return Err(format!(
                "code.order must be 1 or 2 (got {})",
                self.code.order
            ));
        }
        pos(self.code.bw_hz, "code.bw_hz")?;
        let pli = self.lock.pli_threshold;
        if !(pli.is_finite() && (-1.0..=1.0).contains(&pli)) {
            return Err(format!(
                "lock.pli_threshold must lie in [-1, 1] (got {pli})"
            ));
        }
        if self.lock.cn0_windows == 0 {
            return Err("lock.cn0_windows must be at least 1".into());
        }
        if self.lock.cn0_window_periods < 2 {
            return Err("lock.cn0_window_periods must be at least 2".into());
        }
        let m = &self.lock.machine;
        pos(m.pull_in_max_s, "lock.pull_in_max_s")?;
        pos(m.loss_dwell_s, "lock.loss_dwell_s")?;
        pos(m.reacq_doppler_window_hz, "lock.reacq_doppler_window_hz")?;
        pos(m.reacq_window_s, "lock.reacq_window_s")?;
        pos(m.reacq_interval_s, "lock.reacq_interval_s")?;
        pos(m.reacq_max_interval_s, "lock.reacq_max_interval_s")?;
        if m.reacq_max_interval_s < m.reacq_interval_s {
            return Err(format!(
                "lock.reacq_max_interval_s ({}) must not be below lock.reacq_interval_s ({})",
                m.reacq_max_interval_s, m.reacq_interval_s
            ));
        }
        if !m.false_lock_margin_db.is_finite() {
            return Err("lock.false_lock_margin_db must be finite".into());
        }
        if self.bit_sync.min_votes == 0 {
            return Err("bit_sync.min_votes must be at least 1".into());
        }
        pos(self.bit_sync.ratio, "bit_sync.ratio")?;
        let a = &self.acquisition;
        if a.coherent_periods.value() == Some(0) {
            return Err("acquisition.coherent_periods must be at least 1 (or \"auto\")".into());
        }
        if a.noncoherent == 0 {
            return Err("acquisition.noncoherent must be at least 1".into());
        }
        pos(a.doppler_max_hz, "acquisition.doppler_max_hz")?;
        if let Some(s) = a.doppler_step_hz.value() {
            pos(s, "acquisition.doppler_step_hz")?;
        }
        if !(a.pfa > 0.0 && a.pfa < 1.0) {
            return Err(format!(
                "acquisition.pfa must lie in (0, 1) (got {})",
                a.pfa
            ));
        }
        Ok(())
    }
}

fn set_some<T>(slot: &mut Option<T>, v: Option<T>) {
    if v.is_some() {
        *slot = v;
    }
}

fn set<T: Clone>(slot: &mut T, v: Option<T>) {
    if let Some(v) = v {
        *slot = v;
    }
}

/// The canonical JSON text of `v`, which the design hash is taken over: no whitespace, object
/// keys sorted by their UTF-8 bytes at every level, arrays in order, strings escaped as
/// `serde_json` escapes them, integers in decimal and floats in the shortest form that
/// round-trips (always with a `.` or an exponent, so `15.0` and `15` never collide). It does
/// not depend on struct field order or on `serde_json`'s `preserve_order` feature.
pub(crate) fn canonical_json(v: &serde_json::Value) -> String {
    fn write(v: &serde_json::Value, out: &mut String) {
        match v {
            serde_json::Value::Object(map) => {
                let mut keys: Vec<&String> = map.keys().collect();
                keys.sort_unstable_by(|a, b| a.as_bytes().cmp(b.as_bytes()));
                out.push('{');
                for (i, k) in keys.into_iter().enumerate() {
                    if i > 0 {
                        out.push(',');
                    }
                    out.push_str(&serde_json::Value::String(k.clone()).to_string());
                    out.push(':');
                    write(&map[k], out);
                }
                out.push('}');
            }
            serde_json::Value::Array(items) => {
                out.push('[');
                for (i, item) in items.iter().enumerate() {
                    if i > 0 {
                        out.push(',');
                    }
                    write(item, out);
                }
                out.push(']');
            }
            scalar => out.push_str(&scalar.to_string()),
        }
    }
    let mut out = String::new();
    write(v, &mut out);
    out
}

/// `(kind, pll_order, pll_bw, fll_order, fll_bw)` of a carrier loop.
fn carrier_fields(
    c: &CarrierLoop,
) -> (
    &'static str,
    Option<u8>,
    Option<f64>,
    Option<u8>,
    Option<f64>,
) {
    match *c {
        CarrierLoop::Pll { order, bn_hz } => ("pll", Some(order), Some(bn_hz), None, None),
        CarrierLoop::Fll { order, bn_hz } => ("fll", None, None, Some(order), Some(bn_hz)),
        CarrierLoop::FllAssistedPll {
            pll_order,
            pll_bn_hz,
            fll_order,
            fll_bn_hz,
        } => (
            "fll-assisted-pll",
            Some(pll_order),
            Some(pll_bn_hz),
            Some(fll_order),
            Some(fll_bn_hz),
        ),
    }
}

impl Design {
    fn from_resolved(name: String, description: Option<String>, resolved: Resolved) -> Self {
        let value = serde_json::to_value(&resolved).unwrap_or_default();
        let hash = crate::advanced_report::sha256_hex(canonical_json(&value).as_bytes());
        Self {
            name,
            description,
            resolved,
            hash,
        }
    }

    /// The built-in default design (`name = "default"`).
    pub fn builtin_default() -> Self {
        Self::from_resolved("default".into(), None, Resolved::builtin())
    }

    /// The design's name.
    pub fn name(&self) -> &str {
        &self.name
    }

    /// The design's description, if the file gave one.
    pub fn description(&self) -> Option<&str> {
        self.description.as_deref()
    }

    /// SHA-256 (lower-case hex) of the canonical JSON of the resolved design (keys sorted at
    /// every level, no whitespace, fixed number formatting; see
    /// `docs/design/LOOP-DESIGN-TOML.md`). The name and description are not part of it, the
    /// schema identifier is, so two designs with the same loops under different names hash
    /// alike.
    pub fn hash(&self) -> &str {
        &self.hash
    }

    /// The resolved design as JSON (every field set), as written into outputs.
    pub fn to_json(&self) -> serde_json::Value {
        let mut v = serde_json::to_value(&self.resolved).unwrap_or_default();
        if let Some(o) = v.as_object_mut() {
            o.insert("name".into(), self.name.clone().into());
            o.insert("hash".into(), self.hash.clone().into());
            if let Some(d) = &self.description {
                o.insert("description".into(), d.clone().into());
            }
        }
        v
    }

    /// The tracking-loop configuration, labelled with the design's name.
    pub fn loop_config(&self) -> LoopConfig {
        let r = &self.resolved;
        let c = &r.carrier;
        let carrier = match c.kind.as_str() {
            "pll" => CarrierLoop::Pll {
                order: c.pll_order.unwrap_or(2),
                bn_hz: c.pll_bw_hz.unwrap_or(15.0),
            },
            "fll" => CarrierLoop::Fll {
                order: c.fll_order.unwrap_or(1),
                bn_hz: c.fll_bw_hz.unwrap_or(10.0),
            },
            _ => CarrierLoop::FllAssistedPll {
                pll_order: c.pll_order.unwrap_or(2),
                pll_bn_hz: c.pll_bw_hz.unwrap_or(15.0),
                fll_order: c.fll_order.unwrap_or(1),
                fll_bn_hz: c.fll_bw_hz.unwrap_or(10.0),
            },
        };
        // The names were checked when the design was resolved.
        LoopConfig {
            label: self.name.clone(),
            coherent_periods: r.integration.coherent_periods,
            spacing_chips: r.integration.spacing_chips,
            dll: dll_disc(&r.code.discriminator).unwrap_or(DllDiscriminator::EarlyMinusLatePower),
            dll_order: r.code.order,
            dll_bn_hz: r.code.bw_hz,
            carrier_aiding: r.code.carrier_aiding,
            carrier,
            pll_discriminator: pll_disc(&c.pll_discriminator)
                .unwrap_or(PllDiscriminator::CostasAtan),
            fll_discriminator: fll_disc(&c.fll_discriminator).unwrap_or(FllDiscriminator::Atan2),
            fll_assist: match c.fll_assist.as_deref() {
                Some("always") => FllAssist::Always,
                _ => {
                    let d = FllGate::default();
                    FllAssist::PullIn(FllGate {
                        off_pli: c.fll_off_pli.unwrap_or(d.off_pli),
                        on_pli: c.fll_on_pli.unwrap_or(d.on_pli),
                        dwell_s: c.fll_gate_dwell_s.unwrap_or(d.dwell_s),
                    })
                }
            },
            pli_threshold: r.lock.pli_threshold,
            code_lock_cn0_dbhz: r.lock.code_lock_cn0_dbhz,
            cn0_windows: r.lock.cn0_windows,
            cn0_window_periods: r.lock.cn0_window_periods,
            bit_sync: BitSyncConfig {
                min_votes: r.bit_sync.min_votes,
                ratio: r.bit_sync.ratio,
            },
        }
    }

    /// The lock state machine's settings.
    pub fn lock_config(&self) -> LockConfig {
        self.resolved.lock.machine.clone()
    }

    /// The acquisition design (auto values unresolved).
    pub fn acquisition(&self) -> &AcquisitionDesign {
        &self.resolved.acquisition
    }

    /// The hand-off search for a code whose full period is `code_period_s`.
    pub fn acq_config(&self, code_period_s: f64) -> AcqConfig {
        let t_track_s = self.resolved.integration.coherent_periods as f64 * code_period_s;
        self.resolved
            .acquisition
            .acq_config(code_period_s, t_track_s)
    }

    /// The same design under another name (the hash does not change).
    pub fn renamed(&self, name: &str) -> Self {
        Self {
            name: name.to_string(),
            ..self.clone()
        }
    }

    /// This design with the fields of `overrides` (a design table in the file format,
    /// without `name`) applied on top, re-validated and re-hashed. The CLI uses it for
    /// explicit flags that override a file's design.
    pub fn with_overrides(&self, overrides: &str) -> Result<Self, String> {
        let raw: RawDesign =
            toml::from_str(overrides).map_err(|e| format!("design overrides: {e}"))?;
        if raw.name.is_some() || raw.extends.is_some() {
            return Err("design overrides may not set name or extends".into());
        }
        let resolved = self.resolved.clone().apply(&raw, &self.name)?;
        Ok(Self::from_resolved(
            self.name.clone(),
            self.description.clone(),
            resolved,
        ))
    }
}

/// A parsed loop-design file: its designs, in file order.
#[derive(Clone, Debug, PartialEq)]
pub struct DesignFile {
    designs: Vec<Design>,
}

impl DesignFile {
    /// Parse and resolve a `kshana.loop-design/1` file. Errors name the design and key.
    pub fn parse(text: &str) -> Result<Self, String> {
        let raw: RawFile = toml::from_str(text).map_err(|e| format!("loop-design file: {e}"))?;
        match raw.schema.as_deref() {
            Some(SCHEMA) => {}
            Some(other) => {
                return Err(format!(
                    "loop-design file: schema {other:?} is not supported; expected {SCHEMA:?}"
                ))
            }
            None => return Err(format!("loop-design file: missing schema = {SCHEMA:?}")),
        }
        if raw.design.is_empty() {
            return Err("loop-design file: no [[design]] tables".into());
        }
        let mut by_name: BTreeMap<String, usize> = BTreeMap::new();
        for (i, d) in raw.design.iter().enumerate() {
            let name = d.name.clone().ok_or_else(|| {
                format!("loop-design file: [[design]] number {} has no name", i + 1)
            })?;
            if name.trim().is_empty() || name == "default" {
                return Err(format!(
                    "loop-design file: design name {name:?} is reserved or empty"
                ));
            }
            if by_name.insert(name.clone(), i).is_some() {
                return Err(format!(
                    "loop-design file: design {name:?} is defined twice"
                ));
            }
        }
        let mut resolved: Vec<Option<Resolved>> = vec![None; raw.design.len()];
        for i in 0..raw.design.len() {
            resolve(i, &raw.design, &by_name, &mut resolved, &mut Vec::new())?;
        }
        let designs = raw
            .design
            .iter()
            .zip(resolved)
            .map(|(d, r)| {
                Design::from_resolved(
                    d.name.clone().unwrap_or_default(),
                    d.description.clone(),
                    r.unwrap_or_else(Resolved::builtin),
                )
            })
            .collect();
        Ok(Self { designs })
    }

    /// The designs, in file order.
    pub fn designs(&self) -> &[Design] {
        &self.designs
    }

    /// The design named `name`.
    pub fn get(&self, name: &str) -> Option<&Design> {
        self.designs.iter().find(|d| d.name == name)
    }

    /// The design named `name`, or the first design when `name` is `None`; an error names
    /// the designs the file holds.
    pub fn select(&self, name: Option<&str>) -> Result<&Design, String> {
        match name {
            None => self
                .designs
                .first()
                .ok_or_else(|| "loop-design file holds no designs".to_string()),
            Some(n) => self.get(n).ok_or_else(|| {
                format!(
                    "no design named {n:?}; the file holds {}",
                    self.designs
                        .iter()
                        .map(|d| d.name.as_str())
                        .collect::<Vec<_>>()
                        .join(", ")
                )
            }),
        }
    }
}

/// Resolve design `i` (and, first, whatever it extends), detecting cycles.
fn resolve(
    i: usize,
    raw: &[RawDesign],
    by_name: &BTreeMap<String, usize>,
    done: &mut Vec<Option<Resolved>>,
    stack: &mut Vec<usize>,
) -> Result<Resolved, String> {
    if let Some(r) = &done[i] {
        return Ok(r.clone());
    }
    let name = raw[i].name.clone().unwrap_or_default();
    if stack.contains(&i) {
        return Err(format!(
            "loop-design file: design {name:?} extends itself (a cycle)"
        ));
    }
    stack.push(i);
    let base = match raw[i].extends.as_deref() {
        None | Some("default") => Resolved::builtin(),
        Some(parent) => {
            let j = *by_name.get(parent).ok_or_else(|| {
                format!("loop-design file: design {name:?} extends unknown design {parent:?}")
            })?;
            resolve(j, raw, by_name, done, stack)?
        }
    };
    stack.pop();
    let r = base.apply(&raw[i], &name)?;
    done[i] = Some(r.clone());
    Ok(r)
}

#[cfg(test)]
mod tests {
    use super::*;

    const HEAD: &str = "schema = \"kshana.loop-design/1\"\n";

    #[test]
    fn canonical_json_sorts_keys_at_every_level_and_ignores_insertion_order() {
        let mut a = serde_json::Map::new();
        a.insert("z".into(), serde_json::json!(1.0));
        a.insert("a".into(), serde_json::json!({"y": 2, "b": [3, "x"]}));
        let mut b = serde_json::Map::new();
        b.insert("a".into(), serde_json::json!({"b": [3, "x"], "y": 2}));
        b.insert("z".into(), serde_json::json!(1.0));
        let (a, b) = (serde_json::Value::Object(a), serde_json::Value::Object(b));
        assert_eq!(canonical_json(&a), r#"{"a":{"b":[3,"x"],"y":2},"z":1.0}"#);
        assert_eq!(canonical_json(&a), canonical_json(&b));
        assert_ne!(
            canonical_json(&serde_json::json!(15)),
            canonical_json(&serde_json::json!(15.0))
        );
    }

    #[test]
    fn the_builtin_default_hash_is_pinned() {
        // Campaign cell keys and reports key on this value. A change here is a change to the
        // canonical form or to a default, and needs a schema or CHANGELOG note.
        let d = Design::builtin_default();
        let canonical = canonical_json(&serde_json::to_value(&d.resolved).unwrap());
        assert!(canonical.starts_with(r#"{"acquisition":{"coherent_periods":"auto""#));
        assert_eq!(
            d.hash(),
            crate::advanced_report::sha256_hex(canonical.as_bytes())
        );
        // PIN-SCOPE:    SHA-256 of the canonical JSON of the built-in default loop design
        // PIN-EXCLUDES: nothing: the whole canonical document (name and description are
        //               never part of it), deliberately
        assert_eq!(
            d.hash(),
            "33261cd171a53803a6c262686e878e01f37d902a93d5918c20a44297b8ef8e80"
        );
    }

    #[test]
    fn an_empty_design_is_the_builtin_default() {
        let f = DesignFile::parse(&format!("{HEAD}[[design]]\nname = \"a\"\n")).unwrap();
        let d = &f.designs()[0];
        let want = LoopConfig {
            label: "a".into(),
            ..LoopConfig::default()
        };
        assert_eq!(d.loop_config(), want);
        assert_eq!(d.lock_config(), LockConfig::default());
        assert!(
            !d.lock_config().reacquire,
            "re-acquisition is off by default"
        );
        assert_eq!(d.hash(), Design::builtin_default().hash());
        assert_eq!(d.acq_config(1e-3).coherent_periods, 4);
    }

    #[test]
    fn every_field_round_trips_into_the_loop_config() {
        let text = format!(
            "{HEAD}[[design]]
name = \"all\"
[design.integration]
coherent_periods = 2
spacing_chips = 0.2
[design.carrier]
kind = \"pll\"
pll_order = 3
pll_bw_hz = 18.0
pll_discriminator = \"atan2\"
fll_discriminator = \"atan2-pilot\"
[design.code]
order = 2
bw_hz = 1.0
discriminator = \"dot-product\"
carrier_aiding = false
[design.lock]
pli_threshold = 0.7
code_lock_cn0_dbhz = 30.0
cn0_windows = 20
cn0_window_periods = 10
pull_in_max_s = 3.0
loss_dwell_s = 0.5
false_lock_check = false
false_lock_margin_db = 6.0
reacquire = true
reacq_doppler_window_hz = 300.0
reacq_window_s = 12.0
reacq_interval_s = 0.5
reacq_max_interval_s = 4.0
max_reacq_attempts = 5
[design.bit_sync]
min_votes = 8
ratio = 2.0
[design.acquisition]
coherent_periods = 2
noncoherent = 3
doppler_max_hz = 4000.0
doppler_step_hz = 100.0
pfa = 0.01
"
        );
        let f = DesignFile::parse(&text).unwrap();
        let c = f.designs()[0].loop_config();
        assert_eq!(c.coherent_periods, 2);
        assert_eq!(c.spacing_chips, 0.2);
        assert_eq!(
            c.carrier,
            CarrierLoop::Pll {
                order: 3,
                bn_hz: 18.0
            }
        );
        assert_eq!(c.pll_discriminator, PllDiscriminator::Atan2);
        assert_eq!(c.fll_discriminator, FllDiscriminator::Atan2Pilot);
        assert_eq!((c.dll_order, c.dll_bn_hz), (2, 1.0));
        assert_eq!(c.dll, DllDiscriminator::DotProduct);
        assert!(!c.carrier_aiding);
        assert_eq!((c.pli_threshold, c.code_lock_cn0_dbhz), (0.7, 30.0));
        assert_eq!((c.cn0_windows, c.cn0_window_periods), (20, 10));
        assert_eq!((c.bit_sync.min_votes, c.bit_sync.ratio), (8, 2.0));
        let l = f.designs()[0].lock_config();
        assert_eq!(
            l,
            LockConfig {
                pull_in_max_s: 3.0,
                loss_dwell_s: 0.5,
                false_lock_check: false,
                false_lock_margin_db: 6.0,
                reacquire: true,
                reacq_doppler_window_hz: 300.0,
                reacq_window_s: 12.0,
                reacq_interval_s: 0.5,
                reacq_max_interval_s: 4.0,
                max_reacq_attempts: 5,
            }
        );
        let a = f.designs()[0].acq_config(1e-3);
        assert_eq!(
            (
                a.coherent_periods,
                a.noncoherent,
                a.doppler_max_hz,
                a.doppler_step_hz,
                a.pfa
            ),
            (2, 3, 4000.0, 100.0, 0.01)
        );
    }

    #[test]
    fn extends_inherits_and_the_hash_ignores_the_name() {
        let text = format!(
            "{HEAD}[[design]]\nname = \"a\"\n[design.carrier]\npll_bw_hz = 5.0\n\
             [[design]]\nname = \"b\"\nextends = \"a\"\n[design.code]\nbw_hz = 4.0\n\
             [[design]]\nname = \"c\"\nextends = \"a\"\n"
        );
        let f = DesignFile::parse(&text).unwrap();
        let b = f.get("b").unwrap().loop_config();
        assert_eq!(b.dll_bn_hz, 4.0);
        assert!(
            matches!(b.carrier, CarrierLoop::FllAssistedPll { pll_bn_hz, .. } if pll_bn_hz == 5.0)
        );
        assert_eq!(f.get("a").unwrap().hash(), f.get("c").unwrap().hash());
        assert_ne!(f.get("a").unwrap().hash(), f.get("b").unwrap().hash());
    }

    #[test]
    fn mistakes_are_refused_with_the_design_and_key() {
        let bad = |body: &str| {
            DesignFile::parse(&format!("{HEAD}[[design]]\nname = \"x\"\n{body}")).unwrap_err()
        };
        assert!(bad("[design.carrier]\npll_bw = 5.0\n").contains("pll_bw"));
        assert!(
            bad("[design.carrier]\nkind = \"fll\"\npll_bw_hz = 5.0\n").contains("does not apply")
        );
        assert!(bad("[design.carrier]\npll_order = 4\n").contains("pll_order"));
        assert!(bad("[design.code]\ndiscriminator = \"nope\"\n").contains("code.discriminator"));
        assert!(bad("[design.integration]\nspacing_chips = 3.0\n").contains("spacing_chips"));
        assert!(bad("[design.acquisition]\ncoherent_periods = \"often\"\n")
            .contains("coherent_periods"));
        assert!(bad("extends = \"x\"\n").contains("cycle"));
        assert!(bad("extends = \"y\"\n").contains("unknown design"));
        assert!(DesignFile::parse("[[design]]\nname = \"x\"\n")
            .unwrap_err()
            .contains("schema"));
        assert!(
            DesignFile::parse(&format!("{HEAD}[[design]]\nname = \"default\"\n"))
                .unwrap_err()
                .contains("reserved")
        );
        assert!(DesignFile::parse(&format!(
            "{HEAD}[[design]]\nname = \"a\"\n[[design]]\nname = \"a\"\n"
        ))
        .unwrap_err()
        .contains("twice"));
    }

    #[test]
    fn switching_carrier_kind_keeps_only_the_keys_it_uses() {
        let f = DesignFile::parse(&format!(
            "{HEAD}[[design]]\nname = \"f\"\n[design.carrier]\nkind = \"fll\"\nfll_bw_hz = 4.0\n"
        ))
        .unwrap();
        assert_eq!(
            f.designs()[0].loop_config().carrier,
            CarrierLoop::Fll {
                order: 1,
                bn_hz: 4.0
            }
        );
    }

    #[test]
    fn fll_assist_defaults_to_pull_in_and_belongs_to_the_assisted_kind() {
        let parse =
            |body: &str| DesignFile::parse(&format!("{HEAD}[[design]]\nname = \"a\"\n{body}"));
        let d = Design::builtin_default();
        assert_eq!(
            d.loop_config().fll_assist,
            FllAssist::PullIn(FllGate::default())
        );
        let tuned = parse("[design.carrier]\nfll_on_pli = 0.5\nfll_gate_dwell_s = 0.3\n").unwrap();
        assert_eq!(
            tuned.designs()[0].loop_config().fll_assist,
            FllAssist::PullIn(FllGate {
                off_pli: 0.8,
                on_pli: 0.5,
                dwell_s: 0.3
            })
        );
        let err = parse("[design.carrier]\nfll_on_pli = 0.9\n").unwrap_err();
        assert!(err.contains("must be below"), "{err}");
        assert_eq!(d.to_json()["carrier"]["fll_assist"], "pull-in");
        let always = parse("[design.carrier]\nfll_assist = \"always\"\n").unwrap();
        assert_eq!(
            always.designs()[0].loop_config().fll_assist,
            FllAssist::Always
        );
        assert_ne!(always.designs()[0].hash(), d.hash());
        let pll = parse("[design.carrier]\nkind = \"pll\"\n").unwrap();
        assert!(pll.designs()[0].to_json()["carrier"]["fll_assist"].is_null());
        let err = parse("[design.carrier]\nkind = \"pll\"\nfll_assist = \"always\"\n").unwrap_err();
        assert!(err.contains("does not apply"), "{err}");
        let err = parse("[design.carrier]\nfll_assist = \"sometimes\"\n").unwrap_err();
        assert!(err.contains("pull-in or always"), "{err}");
    }

    #[test]
    fn overrides_apply_on_top_and_rehash() {
        let d = Design::builtin_default();
        let o = d.with_overrides("[carrier]\npll_bw_hz = 25.0\n").unwrap();
        assert!(
            matches!(o.loop_config().carrier, CarrierLoop::FllAssistedPll { pll_bn_hz, .. } if pll_bn_hz == 25.0)
        );
        assert_ne!(o.hash(), d.hash());
        assert!(d.with_overrides("name = \"z\"\n").is_err());
    }
}
