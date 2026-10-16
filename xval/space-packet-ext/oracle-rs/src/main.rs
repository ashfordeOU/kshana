// SPDX-License-Identifier: AGPL-3.0-only
//! Oracle driver for tests/space_packet_ext_oracle.rs (see ../PREREGISTRATION.md). Uses
//! spacepackets-rs 0.18.0 only; no Kshana code. Reads <dir>/inputs and the Kshana-written
//! <dir>/kshana/time_codes.csv, writes <dir>/outputs/spacepackets_rs_time.csv and
//! <dir>/outputs/spacepackets_rs_crc.csv.
//!
//! Time-code rows: id, the oracle's own octets with an explicit P-field (written from the case
//! values), then the fields `from_bytes` returns for Kshana's explicit octets: CUC counter
//! width, counter, fraction resolution (octets), fraction counter; CDS days, ms of day,
//! sub-millisecond precision code (0 none, 1 us, 2 ps), sub-millisecond value. Agency-epoch
//! cases are outside this oracle (pre-registered) and are not written.

use spacepackets::crc::CRC_CCITT_FALSE;
use spacepackets::time::cds::{CdsBase, CdsTime, DaysLen16Bits, DaysLen24Bits, SubmillisPrecision};
use spacepackets::time::cuc::{CucTime, FractionalPart, FractionalResolution, WidthCounterPair};
use spacepackets::time::{TimeReader, TimeWriter};
use std::collections::BTreeMap;
use std::fmt::Write as _;
use std::path::Path;

fn rows(p: &Path) -> Vec<Vec<String>> {
    std::fs::read_to_string(p)
        .unwrap_or_else(|e| panic!("{}: {e}", p.display()))
        .lines()
        .skip(1)
        .filter(|l| !l.trim().is_empty())
        .map(|l| l.split(',').map(str::to_string).collect())
        .collect()
}

fn hex(b: &[u8]) -> String {
    b.iter().map(|x| format!("{x:02x}")).collect()
}

fn unhex(s: &str) -> Vec<u8> {
    (0..s.len())
        .step_by(2)
        .map(|i| u8::from_str_radix(&s[i..i + 2], 16).unwrap())
        .collect()
}

fn n(s: &str) -> u32 {
    s.parse().unwrap()
}

fn res(octets: u32) -> FractionalResolution {
    FractionalResolution::try_from(octets as u8).unwrap()
}

fn prec(s: &str) -> SubmillisPrecision {
    match s {
        "us" => SubmillisPrecision::Microseconds,
        "ps" => SubmillisPrecision::Picoseconds,
        _ => SubmillisPrecision::Absent,
    }
}

fn main() {
    let dir = std::env::args().nth(1).expect("usage: oracle <fixture dir>");
    let dir = Path::new(&dir);
    let kshana: BTreeMap<String, String> = rows(&dir.join("kshana/time_codes.csv"))
        .into_iter()
        .map(|r| (r[0].clone(), r[1].clone()))
        .collect();
    let mut out = String::from("id,oracle_explicit_hex,f1,f2,f3,f4\n");
    for r in rows(&dir.join("inputs/time_codes.csv")) {
        if r[2] != "1958" {
            continue;
        }
        let ks = unhex(&kshana[&r[0]]);
        let mut buf = [0u8; 16];
        let (len, f) = if r[1] == "cuc" {
            let t = CucTime::new_generic(
                WidthCounterPair(n(&r[3]) as u8, n(&r[5])),
                FractionalPart::new_checked(res(n(&r[4])), n(&r[6])).unwrap(),
            )
            .unwrap();
            let len = t.write_to_bytes(&mut buf).unwrap();
            let back = CucTime::from_bytes(&ks).unwrap();
            let fr = back.fractions();
            (
                len,
                [
                    back.counter_width() as u32,
                    back.counter(),
                    fr.resolution() as u32,
                    fr.counter(),
                ],
            )
        } else if r[3] == "16" {
            let mut t = CdsTime::<DaysLen16Bits>::new_with_u16_days(n(&r[5]) as u16, n(&r[6]));
            assert!(t.set_submillis(prec(&r[4]), n(&r[7])));
            let len = t.write_to_bytes(&mut buf).unwrap();
            let back = CdsTime::<DaysLen16Bits>::from_bytes_with_u16_days(&ks).unwrap();
            (
                len,
                [
                    back.ccsds_days_as_u32(),
                    back.ms_of_day(),
                    back.submillis_precision() as u32,
                    back.submillis(),
                ],
            )
        } else {
            let mut t = CdsTime::<DaysLen24Bits>::new_with_u24_days(n(&r[5]), n(&r[6])).unwrap();
            assert!(t.set_submillis(prec(&r[4]), n(&r[7])));
            let len = t.write_to_bytes(&mut buf).unwrap();
            let back = CdsTime::<DaysLen24Bits>::from_bytes_with_u24_days(&ks).unwrap();
            (
                len,
                [
                    back.ccsds_days_as_u32(),
                    back.ms_of_day(),
                    back.submillis_precision() as u32,
                    back.submillis(),
                ],
            )
        };
        writeln!(
            out,
            "{},{},{},{},{},{}",
            r[0],
            hex(&buf[..len]),
            f[0],
            f[1],
            f[2],
            f[3]
        )
        .unwrap();
    }
    std::fs::write(dir.join("outputs/spacepackets_rs_time.csv"), out).unwrap();

    let mut crc = String::from("id,crc\n");
    for r in rows(&dir.join("inputs/crc_messages.csv")) {
        let m = unhex(r.get(1).map(String::as_str).unwrap_or(""));
        writeln!(crc, "{},{}", r[0], CRC_CCITT_FALSE.checksum(&m)).unwrap();
    }
    std::fs::write(dir.join("outputs/spacepackets_rs_crc.csv"), crc).unwrap();
}
