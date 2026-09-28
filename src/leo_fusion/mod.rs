// SPDX-License-Identifier: AGPL-3.0-only
//! Fused medium-Earth-orbit (MEO) and low-Earth-orbit (LEO) positioning, navigation and
//! timing (PNT): Doppler positioning, joint pseudorange positioning across systems, precise
//! point positioning (PPP) with LEO augmentation, positioning from a 5G non-terrestrial
//! network (NTN) signal, LEO-assisted time transfer to Coordinated Universal Time (UTC), and
//! coverage at polar and Arctic latitudes.
//!
//! The pack is **system-agnostic**. Every capability takes its constellations as Walker
//! shells or explicit element sets (the same inputs as the `constellation-design` kind), its
//! signals as a carrier, a ranging bandwidth and a carrier-to-noise density (C/N0) model, and
//! its error budget as explicit one-sigma figures. Named systems are **presets** in
//! [`presets`], one file each with its source; nothing in the engine depends on any one of
//! them, and every test and bundled scenario except the one that names it runs with the
//! workshop-derived preset absent.
//!
//! ## Modules
//!
//! * [`geom`] — Earth-fixed satellite positions and velocities from orbital elements (two-body
//!   motion with the secular J2 drift), the local east-north-up frame, and a small dense
//!   linear-algebra kit.
//! * [`joint_pvt`] — weighted least-squares pseudorange positioning with one clock per system
//!   (the inter-system bias), per-measurement sigmas supplied by the caller, and the dilution
//!   of precision (DOP).
//! * [`doppler`] — positioning from range rate: single- and multi-satellite batch least
//!   squares with clock-drift and optional velocity states, the Doppler geometry and the
//!   single-pass along-track and cross-track accuracy.
//! * [`ppp`] — a float PPP extended Kalman filter (EKF) on ionosphere-free code and phase,
//!   run with GNSS only and with GNSS plus LEO, and its convergence time.
//! * [`ntn`] — the Cramér-Rao bound (CRB) on time of arrival and Doppler from signal bandwidth
//!   and C/N0, applied to a 5G NTN downlink.
//! * [`timing`] — LEO-assisted time transfer: the time error against C/N0 and the receiver
//!   oscillator between passes, and the system-time-to-UTC conversion.
//! * [`polar`] — satellites in view and DOP against latitude for MEO, LEO and both.
//! * [`system`] — a navigation system built from a scenario's `[[system]]` table.
//! * [`pvt_kind`] — the `leo-pvt` scenario kind (Doppler, joint, polar and timing modes);
//!   [`ppp`] and [`ntn`] carry the `leo-ppp` and `ntn-positioning` kinds.

pub mod doppler;
pub mod geom;
pub mod joint_pvt;
pub mod ntn;
pub mod polar;
pub mod ppp;
pub mod presets;
pub mod pvt_kind;
pub mod system;
pub mod timing;

/// Speed of light in vacuum (m/s).
pub const C_LIGHT: f64 = 299_792_458.0;
