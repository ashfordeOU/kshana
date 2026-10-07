// SPDX-License-Identifier: AGPL-3.0-only
//! Build a [`SignalCode`] from a short signal name and a PRN (or GLONASS frequency
//! channel), shared by the `iq scene`, `iq acquire`, `iq track` and `iq sweep` commands
//! and the Python bindings. The names are the lower-case, hyphenated forms a receiver
//! engineer types on the command line; each maps to one constructor in
//! [`crate::iq::signals`].

use crate::iq::signals::{beidou, galileo, glonass, gps, SignalCode};

/// Every signal name [`build_code`] accepts, in the order they are listed in help text.
pub(crate) const SIGNAL_NAMES: &[&str] = &[
    "gps-l1ca",
    "gps-l5i",
    "gps-l5q",
    "gps-l2c",
    "galileo-e1b",
    "galileo-e1c",
    "galileo-e5a-i",
    "galileo-e5a-q",
    "beidou-b1i",
    "beidou-b1c",
    "glonass-l1of",
];

/// Build the spreading code for `signal` and `id`, where `id` is the PRN for every
/// signal except GLONASS L1OF, for which it is the FDMA frequency channel `-7..=6`.
/// The returned [`SignalCode`] carries its own nominal carrier frequency, so a scene or a
/// receiver places it correctly without a separate centre argument.
pub fn build_code(signal: &str, id: i64) -> Result<SignalCode, String> {
    let prn = || -> Result<u16, String> {
        u16::try_from(id).map_err(|_| format!("{signal}: PRN {id} is out of range"))
    };
    let code = match signal {
        "gps-l1ca" => gps::l1ca(prn()?),
        "gps-l5i" => gps::l5_i5(prn()?),
        "gps-l5q" => gps::l5_q5(prn()?),
        "gps-l2c" => gps::l2c(prn()?),
        "galileo-e1b" => galileo::e1b(prn()?),
        "galileo-e1c" => galileo::e1c(prn()?),
        "galileo-e5a-i" => galileo::e5a_i(prn()?),
        "galileo-e5a-q" => galileo::e5a_q(prn()?),
        "beidou-b1i" => beidou::b1i(prn()?),
        "beidou-b1c" => beidou::b1c_data(prn()?),
        "glonass-l1of" => {
            let k = i8::try_from(id)
                .map_err(|_| format!("GLONASS L1OF frequency channel {id} is outside -7..=6"))?;
            glonass::l1of(k)
        }
        other => {
            return Err(format!(
                "unknown signal {other:?}; expected one of: {}",
                SIGNAL_NAMES.join(", ")
            ))
        }
    };
    code.map_err(|e| e.to_string())
}
