// SPDX-License-Identifier: AGPL-3.0-only
//! IEC 61162-450 datagrams (maritime network NMEA) through Kshana Connect: the bundled NMEA sample,
//! wrapped one sentence per datagram with TAG blocks, gives the same observations as the plain NMEA
//! file. Only the header's `source_format` differs. Also checks the committed capture fixture.

use kshana::iec61162_450::{unwrap, wrap};
use std::path::Path;

fn root() -> &'static Path {
    Path::new(env!("CARGO_MANIFEST_DIR"))
}

fn station() -> kshana::obs::Station {
    toml::from_str(&std::fs::read_to_string(root().join("examples/obs/station.toml")).unwrap())
        .unwrap()
}

#[test]
fn wrapped_nmea_gives_the_nmea_observations() {
    let nmea =
        std::fs::read(root().join("examples/receiver-trust/illustrative-jamming.nmea")).unwrap();
    let capture = wrap(&String::from_utf8_lossy(&nmea), "GP0001");
    let committed = std::fs::read(root().join("examples/connect/iec61162-450.capture")).unwrap();
    assert_eq!(
        capture, committed,
        "regenerate examples/connect/iec61162-450.capture"
    );
    let a =
        kshana::obs::to_jsonl(&kshana::obs::from_log("nmea", &nmea, &station()).unwrap()).unwrap();
    let b = kshana::obs::to_jsonl(
        &kshana::obs::from_log("iec61162-450", &capture, &station()).unwrap(),
    )
    .unwrap();
    assert_eq!(
        a.replacen(
            "\"source_format\":\"nmea\"",
            "\"source_format\":\"iec61162-450\"",
            1
        ),
        b
    );
    let u = unwrap(&capture);
    assert_eq!(u.bad_tag, 0);
    assert_eq!(u.datagrams, u.tagged);
}
