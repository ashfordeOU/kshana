// SPDX-License-Identifier: AGPL-3.0-only
//! GPS L1 C/A as a [`SpreadingCode`]: a thin wrapper over [`crate::sdr::CaCode`], whose
//! chips are checked against the IS-GPS-200 first-chips table and gps-sdr-sim elsewhere.

use crate::iq::SpreadingCode;
use crate::sdr::{CaCode, CA_CHIP_RATE_HZ, CA_CODE_LEN, L1_HZ};

/// The GPS L1 C/A ranging code of one PRN, BPSK at 1.023 Mchip/s on 1 575.42 MHz.
///
/// [`SpreadingCode::value_at`] is a zero-order hold on `floor(code phase)` wrapped into one
/// period, with chip `0 -> +1` and chip `1 -> -1`, the same mapping as
/// [`crate::sdr::correlate`]'s replica, so a scene generated with this code correlates
/// against that replica without a mapping loss.
#[derive(Clone, Debug)]
pub struct GpsL1Ca {
    code: CaCode,
}

impl GpsL1Ca {
    /// The code of `prn` (1..=32); `None` for an out-of-range PRN.
    pub fn new(prn: u8) -> Option<Self> {
        CaCode::new(prn).map(|code| Self { code })
    }
    /// The PRN of this code.
    pub fn prn(&self) -> u8 {
        self.code.prn
    }
    /// The underlying generated code, for building a matching receiver replica.
    pub fn ca_code(&self) -> &CaCode {
        &self.code
    }
}

impl SpreadingCode for GpsL1Ca {
    fn name(&self) -> String {
        format!("GPS L1 C/A PRN {}", self.code.prn)
    }
    fn chip_rate_hz(&self) -> f64 {
        CA_CHIP_RATE_HZ
    }
    fn len_chips(&self) -> usize {
        CA_CODE_LEN
    }
    fn carrier_hz(&self) -> f64 {
        L1_HZ
    }
    fn value_at(&self, code_phase_chips: f64) -> f64 {
        let idx = code_phase_chips.floor().rem_euclid(CA_CODE_LEN as f64) as usize;
        // `rem_euclid` of a float can round up to exactly the modulus for a tiny negative
        // input; fold that edge back to chip 0.
        self.code.bipolar[idx % CA_CODE_LEN]
    }
}
