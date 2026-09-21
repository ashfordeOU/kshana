//! Stanford integrity-diagram epoch classification.
//!
//! **Cited** method: the Stanford–ESA integrity diagram (Tossaint et al., ION
//! GNSS 2007) and the WAAS MOPS (RTCA DO-229) partition each epoch by the
//! relationship between the true error `e = |t̂ − UTC|`, the declared
//! protection level `pl`, and the application alert limit `al`. Reproducing the
//! taxonomy is method attribution, not a conformance claim about this crate.

/// One epoch's integrity-diagram region.
#[derive(Debug, Clone, Copy, PartialEq, Eq)]
pub enum IntegrityClass {
    /// `e ≤ pl ≤ al`: bounded and usable.
    Nominal,
    /// `pl > al`: the monitor declares itself unusable — a continuity/
    /// availability event, never an integrity failure.
    Unavailable,
    /// `pl < e ≤ al`: the PL under-bounds the error, but the error is still
    /// within the alert limit (a coverage failure, not yet hazardous).
    MisleadingInformation,
    /// `e > pl` and `e > al`: an undetected error beyond the alert limit — the
    /// hazardous case the benchmark exists to count.
    HazardousMi,
}

/// Classify one epoch. Uses `|true_error|`; a `pl > al` monitor is `Unavailable`
/// regardless of the error (it has flagged itself). Bounds are inclusive
/// (`e ≤ pl` is `Nominal`; `e ≤ al` with `e > pl` is `MisleadingInformation`).
pub fn classify(true_error: f64, pl: f64, al: f64) -> IntegrityClass {
    let e = true_error.abs();
    if pl > al {
        IntegrityClass::Unavailable
    } else if e <= pl {
        IntegrityClass::Nominal
    } else if e <= al {
        IntegrityClass::MisleadingInformation
    } else {
        IntegrityClass::HazardousMi
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn four_regions() {
        // PL <= AL branch. AL = 10, PL = 4.
        assert_eq!(classify(3.0, 4.0, 10.0), IntegrityClass::Nominal); // e <= PL
        assert_eq!(
            classify(6.0, 4.0, 10.0),
            IntegrityClass::MisleadingInformation
        ); // PL < e <= AL
        assert_eq!(classify(12.0, 4.0, 10.0), IntegrityClass::HazardousMi); // e > AL
                                                                            // PL > AL => monitor declares itself unavailable (a continuity event, not integrity).
        assert_eq!(classify(0.0, 11.0, 10.0), IntegrityClass::Unavailable);
        assert_eq!(classify(50.0, 11.0, 10.0), IntegrityClass::Unavailable);
    }

    #[test]
    fn boundaries_and_sign() {
        // e == PL is Nominal (bound is inclusive); e == AL with e > PL is MI, not HMI.
        assert_eq!(classify(4.0, 4.0, 10.0), IntegrityClass::Nominal);
        assert_eq!(
            classify(10.0, 4.0, 10.0),
            IntegrityClass::MisleadingInformation
        );
        // PL == AL is available (not unavailable); classification uses |error|.
        assert_eq!(
            classify(-6.0, 4.0, 10.0),
            IntegrityClass::MisleadingInformation
        );
        assert_eq!(classify(2.0, 10.0, 10.0), IntegrityClass::Nominal);
    }
}
