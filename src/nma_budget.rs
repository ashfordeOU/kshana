// SPDX-License-Identifier: AGPL-3.0-only
//! Navigation-message-authentication (TESLA/OSNMA) budget sizing: turns the
//! assertion "an OSNMA-style authentication scheme fits an AFS
//! (autonomous-formation-flying / augmented-navigation-service) message and
//! timing budget" into a *sized* result — the authentication overhead as a
//! fraction of the nav-data rate, a bounded authentication latency, and the
//! forgery-resistance figures.
//!
//! The model is the Galileo Open Service Navigation Message Authentication
//! (OSNMA) realisation of a TESLA (Timed Efficient Stream Loss-tolerant
//! Authentication) protocol. OSNMA is carried in a 40-bit field in every E1-B
//! I/NAV nominal page (one page every 2 s), split into an 8-bit HKROOT
//! (header / root-key) portion and a 32-bit MACK (Message Authentication Codes
//! + Key) portion. Over a 30 s subframe (15 pages) those portions accumulate
//! into the full HKROOT message (15 × 8 = 120 bits) and MACK message
//! (15 × 32 = 480 bits) — 600 authentication bits per subframe, i.e. the OSNMA
//! field's 40 bits / 2 s page = 20 bit/s. Authentication is delayed by the
//! TESLA key-disclosure lag: the key that verifies a MAC is broadcast one (or
//! more) subframes later, so a receiver cannot authenticate a message until the
//! key arrives. That key-disclosure delay is the dominant *lower-bound* term of
//! the end-to-end authentication latency (the full time-to-first-authenticated-
//! fix additionally includes collecting the MACK section and verifying the tag,
//! and is typically ≥ 2 subframes). Security rests on two independent
//! quantities: the truncated-MAC tag length (a blind tag forgery succeeds with
//! probability `2^-tag_bits`) and the one-way-chain key length (a key must be
//! brute-forced within the disclosure window).
//!
//! Sizing relations (bit counts are per-subframe totals, i.e. 15 × the per-page
//! portion):
//!   * `overhead_bps        = (mack_bits + hkroot_bits) / subframe_s`
//!   * `overhead_fraction   = overhead_bps / nav_data_rate_bps`
//!   * `auth_latency_s      = subframe_s · disclosure_lag_subframes`
//!   * `tag_forgery_prob    = 2^-mac_tag_bits`
//!   * `key_brute_force_bits = tesla_key_bits`
//!
//! VALIDATED vs MODELLED.
//! VALIDATED: the OSNMA field sizing and timing reproduce the published Galileo
//! OSNMA Signal-in-Space Interface Control Document (SIS-ICD) numbers — the
//! 40-bit OSNMA field per 2 s page splits 8 bit HKROOT + 32 bit MACK, so over a
//! 30 s subframe HKROOT = 120 bits and MACK = 480 bits, giving a 600 bit / 30 s
//! = 20 bit/s authentication overhead; the key-disclosure delay is one 30 s
//! subframe; the TESLA one-way-chain key is 128 bits and the truncated MAC tag
//! is 40 bits, so a blind tag forgery has probability `2^-40 ≈ 9.09e-13`. These
//! are checked against the standard in the tests (oracle cited there).
//! MODELLED: the *application* to an AFS link — the assumed AFS nav-data rate
//! (a representative 50 bit/s, stated and flagged as a modelled input) and the
//! resulting overhead verdict. At 20 bit/s the OSNMA authentication overhead is
//! a *first-order* cost — ≈ 40 % of a 50 bit/s AFS nav message, NOT a negligible
//! few percent — so a lunar AFS would need either a higher nav-data rate or a
//! lighter authentication scheme to carry it. That fraction is a sized
//! consequence of the validated OSNMA numbers plus the one modelled rate; it is
//! not itself measured against a flight system. No cryptographic implementation,
//! key-management, loss or re-synchronisation modelling is included — this is a
//! budget calculator.

use serde::Deserialize;

/// TESLA/OSNMA budget-sizing configuration.
///
/// Defaults reproduce the Galileo OSNMA SIS-ICD field sizing (see module doc).
#[derive(Clone, Debug, Deserialize)]
pub struct NmaConfig {
    /// MACK (MAC + key) message length carried per 30 s subframe, in bits —
    /// the full MACK message (15 pages × 32-bit-per-page portion = 480 bits).
    #[serde(default = "nb_default_mack_bits")]
    pub mack_bits_per_subframe: f64,
    /// HKROOT (root-key / header) message length carried per 30 s subframe, in
    /// bits — the full HKROOT message (15 pages × 8-bit-per-page portion = 120
    /// bits).
    #[serde(default = "nb_default_hkroot_bits")]
    pub hkroot_bits_per_subframe: f64,
    /// Subframe duration, in seconds.
    #[serde(default = "nb_default_subframe_s")]
    pub subframe_s: f64,
    /// TESLA key-disclosure lag, in subframes (the key that authenticates a MAC
    /// is broadcast this many subframes after the MAC).
    #[serde(default = "nb_default_disclosure_lag")]
    pub disclosure_lag_subframes: f64,
    /// Nav-data rate the authentication overhead is measured against, in bit/s.
    #[serde(default = "nb_default_nav_rate")]
    pub nav_data_rate_bps: f64,
    /// TESLA one-way-chain key length, in bits (the brute-force work factor).
    #[serde(default = "nb_default_key_bits")]
    pub tesla_key_bits: f64,
    /// Truncated MAC tag length, in bits (a blind tag forgery succeeds with
    /// probability `2^-mac_tag_bits`).
    #[serde(default = "nb_default_tag_bits")]
    pub mac_tag_bits: f64,
}

fn nb_default_mack_bits() -> f64 {
    // Full MACK message per 30 s subframe: 15 pages × 32 bit/page = 480 bits.
    480.0
}
fn nb_default_hkroot_bits() -> f64 {
    // Full HKROOT message per 30 s subframe: 15 pages × 8 bit/page = 120 bits.
    120.0
}
fn nb_default_subframe_s() -> f64 {
    30.0
}
fn nb_default_disclosure_lag() -> f64 {
    1.0
}
fn nb_default_nav_rate() -> f64 {
    50.0
}
fn nb_default_key_bits() -> f64 {
    128.0
}
fn nb_default_tag_bits() -> f64 {
    40.0
}

impl Default for NmaConfig {
    fn default() -> Self {
        Self {
            mack_bits_per_subframe: nb_default_mack_bits(),
            hkroot_bits_per_subframe: nb_default_hkroot_bits(),
            subframe_s: nb_default_subframe_s(),
            disclosure_lag_subframes: nb_default_disclosure_lag(),
            nav_data_rate_bps: nb_default_nav_rate(),
            tesla_key_bits: nb_default_key_bits(),
            mac_tag_bits: nb_default_tag_bits(),
        }
    }
}

/// The sized navigation-message-authentication budget.
#[derive(Clone, Debug, PartialEq)]
pub struct NmaBudget {
    /// Authentication overhead carried on the link, in bit/s:
    /// `(mack_bits + hkroot_bits) / subframe_s`.
    pub overhead_bps: f64,
    /// Overhead as a fraction of the nav-data rate:
    /// `overhead_bps / nav_data_rate_bps`.
    pub overhead_fraction: f64,
    /// Key-disclosure latency, in seconds — `subframe_s · disclosure_lag_subframes`.
    /// This is the TESLA key-disclosure delay (the dominant term and a *lower
    /// bound* on the end-to-end time-to-first-authenticated-fix, which further
    /// adds MACK-collection and tag-verification and is typically ≥ 2 subframes).
    pub auth_latency_s: f64,
    /// Probability a blind (per-attempt) tag forgery is accepted: `2^-mac_tag_bits`.
    pub tag_forgery_prob: f64,
    /// One-way-chain key brute-force work factor, in bits (`= tesla_key_bits`).
    pub key_brute_force_bits: f64,
}

/// Compute the TESLA/OSNMA budget from a validated configuration.
///
/// Returns `Err` if any field is non-finite, negative, or a divisor is zero.
pub fn budget(cfg: &NmaConfig) -> Result<NmaBudget, String> {
    let fields = [
        ("mack_bits_per_subframe", cfg.mack_bits_per_subframe),
        ("hkroot_bits_per_subframe", cfg.hkroot_bits_per_subframe),
        ("subframe_s", cfg.subframe_s),
        ("disclosure_lag_subframes", cfg.disclosure_lag_subframes),
        ("nav_data_rate_bps", cfg.nav_data_rate_bps),
        ("tesla_key_bits", cfg.tesla_key_bits),
        ("mac_tag_bits", cfg.mac_tag_bits),
    ];
    for (name, v) in fields {
        if !v.is_finite() || v < 0.0 {
            return Err(format!("{name} must be finite and non-negative"));
        }
    }
    if cfg.subframe_s <= 0.0 {
        return Err("subframe_s must be positive".to_string());
    }
    if cfg.nav_data_rate_bps <= 0.0 {
        return Err("nav_data_rate_bps must be positive".to_string());
    }

    let overhead_bps = (cfg.mack_bits_per_subframe + cfg.hkroot_bits_per_subframe) / cfg.subframe_s;
    let overhead_fraction = overhead_bps / cfg.nav_data_rate_bps;
    let auth_latency_s = cfg.subframe_s * cfg.disclosure_lag_subframes;
    let tag_forgery_prob = 2.0_f64.powf(-cfg.mac_tag_bits);
    let key_brute_force_bits = cfg.tesla_key_bits;

    Ok(NmaBudget {
        overhead_bps,
        overhead_fraction,
        auth_latency_s,
        tag_forgery_prob,
        key_brute_force_bits,
    })
}

#[cfg(test)]
mod tests {
    use super::*;

    // ORACLE (Validated): Galileo Open Service Navigation Message Authentication
    // (OSNMA) Signal-in-Space Interface Control Document (SIS-ICD), Issue 1.1,
    // and Fernandez-Hernandez et al., "A Navigation Message Authentication
    // Proposal for the Galileo Open Service" (NAVIGATION, 2016). Published field
    // sizing: the OSNMA field is 40 bits per E1-B I/NAV page (one page / 2 s),
    // split 8 bit HKROOT + 32 bit MACK per page; over a 30 s subframe (15 pages)
    // the HKROOT message is 15 × 8 = 120 bits and the MACK message is
    // 15 × 32 = 480 bits, so the authentication overhead is 600 bit / 30 s =
    // 20 bit/s (equivalently the 40-bit field / 2 s page). Key-disclosure delay
    // = one subframe (30 s); TESLA one-way-chain key = 128 bits; truncated MAC
    // tag = 40 bits.
    #[test]
    fn osnma_sis_icd_field_sizing_and_timing() {
        let b = budget(&NmaConfig::default()).expect("valid default config");

        // Overhead = (480 + 120) bit / 30 s = 600/30 = 20 bit/s (= 40 bit / 2 s page).
        assert!(
            (b.overhead_bps - 600.0 / 30.0).abs() < 1e-12,
            "overhead_bps = {}",
            b.overhead_bps
        );
        assert!(
            (b.overhead_bps - 20.0).abs() < 1e-9,
            "overhead_bps = {}",
            b.overhead_bps
        );

        // Key-disclosure delay = one 30 s subframe.
        assert!(
            (b.auth_latency_s - 30.0).abs() < 1e-12,
            "auth_latency_s = {}",
            b.auth_latency_s
        );

        // Truncated 40-bit MAC tag: blind forgery probability 2^-40 ≈ 9.0949e-13.
        assert!(
            (b.tag_forgery_prob - 9.094_947_017_729_282e-13).abs() < 1e-24,
            "tag_forgery_prob = {}",
            b.tag_forgery_prob
        );
        assert!((b.tag_forgery_prob - 2.0_f64.powi(-40)).abs() < 1e-30);

        // 128-bit one-way-chain key brute-force work factor.
        assert!((b.key_brute_force_bits - 128.0).abs() < 1e-12);
    }

    // Application to an AFS link (MODELLED). The AFS nav-data rate below is a
    // representative modelled input (50 bit/s — the order of a GNSS-class nav
    // message rate); it is NOT a measured flight value. Given the validated
    // OSNMA numbers above, this test shows the HONEST sized consequence: at the
    // real 20 bit/s OSNMA overhead the authentication cost is FIRST ORDER — ≈ 40 %
    // of a 50 bit/s nav message, not a negligible few percent — so a lunar AFS
    // would need a higher nav-data rate or a lighter authentication scheme.
    #[test]
    fn afs_application_overhead_is_first_order_modelled() {
        // Representative (MODELLED) AFS nav-data rate.
        let afs_nav_rate_bps = 50.0;
        let cfg = NmaConfig {
            nav_data_rate_bps: afs_nav_rate_bps,
            ..NmaConfig::default()
        };
        let b = budget(&cfg).expect("valid AFS config");

        // Overhead fraction = 20 / 50 = 0.40 -> 40 %.
        assert!(
            (b.overhead_fraction - 20.0 / 50.0).abs() < 1e-12,
            "overhead_fraction = {}",
            b.overhead_fraction
        );
        // First-order, NOT negligible: a substantial fraction of the nav rate.
        assert!(
            b.overhead_fraction > 0.3 && b.overhead_fraction < 0.5,
            "overhead_fraction = {} (expected first-order, ~40 %)",
            b.overhead_fraction
        );
        // Key-disclosure latency is bounded to tens of seconds (lower bound on
        // end-to-end time-to-first-authenticated-fix).
        assert!(
            b.auth_latency_s > 0.0 && b.auth_latency_s <= 60.0,
            "auth_latency_s = {} (expected bounded, tens of s)",
            b.auth_latency_s
        );
    }

    // A longer disclosure lag scales latency linearly (Modelled sensitivity).
    #[test]
    fn disclosure_lag_scales_latency() {
        let cfg = NmaConfig {
            disclosure_lag_subframes: 3.0,
            ..NmaConfig::default()
        };
        let b = budget(&cfg).expect("valid config");
        assert!((b.auth_latency_s - 90.0).abs() < 1e-12);
    }

    #[test]
    fn rejects_bad_inputs() {
        let bad_rate = NmaConfig {
            nav_data_rate_bps: 0.0,
            ..NmaConfig::default()
        };
        assert!(budget(&bad_rate).is_err());

        let bad_sub = NmaConfig {
            subframe_s: 0.0,
            ..NmaConfig::default()
        };
        assert!(budget(&bad_sub).is_err());

        let nan = NmaConfig {
            mack_bits_per_subframe: f64::NAN,
            ..NmaConfig::default()
        };
        assert!(budget(&nan).is_err());

        let neg = NmaConfig {
            mac_tag_bits: -1.0,
            ..NmaConfig::default()
        };
        assert!(budget(&neg).is_err());
    }
}
