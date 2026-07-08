//! Composed Timing Integrity (CTI): protection levels over heterogeneous time
//! sources across the RAIM-available → holdover transition.
//!
//! ## Honesty discipline (manuscript vocabulary → in-code status)
//! Manuscript claims are tagged Cited (prior art), Proven (our algebra),
//! Validated (a new external oracle), or Modelled (representative). In the
//! [`crate::verification`] matrix these map onto `Validated` (needs an
//! `ExternalDataset` oracle) and `Modelled` (algebra + internal consistency);
//! "Proven" and "Cited" are prose-only. Solution-separation / MHSS is Cited
//! from Blanch (IEEE T-AES 51(1), 2015) and Joerger (NAVIGATION 61(4), 2014);
//! the conditional-TPL impossibility is Cited from Baweja (arXiv:2606.24210),
//! whose single-source GNSS result is the N=1 special case this composition
//! generalizes.
//!
//! P1 scope: [`kir`] multipliers, [`tpl_scalar`] (R1), [`composed_pl`] (R4),
//! [`lil_envelope`] (R4).

pub mod composed_pl;
pub mod hetero_budget;
pub mod kir;
pub mod lil_envelope;
pub mod tpl_scalar;
