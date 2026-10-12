// SPDX-License-Identifier: AGPL-3.0-only
//! Galileo I/NAV and F/NAV quantisation grid against published broadcast ephemerides.
//!
//! PRE-REGISTRATION (written 2026-10-12, committed alone, before the comparison was coded or
//! run, and before the input values were inspected against the encoder).
//!
//! INPUTS. The Galileo records of two files already vendored in this repository from the IGS
//! (International GNSS Service) daily broadcast navigation product for 2018 day 133:
//! `tests/fixtures/joint_pvt_itrf_rtklib_oracle/brdc_2018133_G_Einav.rnx` and
//! `tests/fixtures/joint_pvt_dual_freq_itrf_rtklib_oracle/brdc_2018133_G_Efnav.rnx`, parsed by
//! `kshana::rinex::parse_nav`. A record is an I/NAV record when its RINEX data-sources field
//! has bit 0 or bit 2 set, an F/NAV record when bit 1 is set. Each record is mapped by
//! `kshana::gnss_navmsg::galileo::ephemeris_from_rinex`.
//!
//! WHY THIS IS AN EXTERNAL CHECK. The broadcast values were quantised by the Galileo ground
//! segment to the LSBs of the Galileo OS SIS ICD and decoded by the receivers of the IGS
//! network; RINEX prints them with 13 significant digits. If Kshana's LSB and width for a field
//! are right, every broadcast value is an integer multiple of Kshana's LSB to within the print
//! error (worst case computed before the run: about 2e-3 LSB, for `sqrt_a`), and fits the
//! field.
//!
//! CRITERIA (fixed here): G1 every I/NAV record encodes into word types 1 to 5 and every
//! F/NAV record into page types 1 to 3 without a range error; G2 for every scaled field those
//! words and pages carry from the record (`toe`, `toc`, `m0`, `e`, `sqrt_a`, `omega0`, `i0`,
//! `omega`, `idot`, `omega_dot`, `delta_n`, `cuc`, `cus`, `crc`, `crs`, `cic`, `cis`, `af0`,
//! `af1`, `af2`, `bgd_e1e5a`, and `bgd_e1e5b` for I/NAV), `r = value / LSB` satisfies
//! `|r - round(r)| <= 0.01`; G3 decoding the encoded bits returns the integer `round(r)`
//! exactly. Non-vacuity: at least 100 I/NAV and 100 F/NAV records, at least 20 distinct SVIDs.
//!
//! WHAT IT DOES NOT TEST. Bit positions (a transposed pair of equal-width fields passes), or an
//! LSB a power of two finer than the ICD's (broadcast integers stay integers on a finer grid).
//! It therefore does not promote the navigation-message row: the row stays MODELLED. A miss is
//! recorded below with its numbers, not tuned away.
