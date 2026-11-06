// SPDX-License-Identifier: AGPL-3.0-only
//! Signed webhooks: the HMAC against the RFC 4231 HMAC-SHA256 test vectors, one signature computed
//! independently (Python's `hmac` module, value written below), and the verification rules.

use kshana::telemetry::webhook::{hmac_sha256, sign, verify, Refusal};

fn unhex(s: &str) -> Vec<u8> {
    hex::decode(s).unwrap()
}

#[test]
fn hmac_matches_the_rfc_4231_vectors() {
    // (key, data, HMAC-SHA256) for RFC 4231 test cases 1, 2, 3, 4, 6 and 7 (case 5 is truncated output).
    // PIN-SCOPE:    the published HMAC-SHA256 outputs of RFC 4231 section 4 (external test vectors).
    // PIN-EXCLUDES: nothing Kshana computes; these are the RFC's values, copied.
    let cases = [
        ("0b".repeat(20), hex::encode("Hi There"), "b0344c61d8db38535ca8afceaf0bf12b881dc200c9833da726e9376c2e32cff7"),
        (hex::encode("Jefe"), hex::encode("what do ya want for nothing?"), "5bdcc146bf60754e6a042426089575c75a003f089d2739839dec58b964ec3843"),
        ("aa".repeat(20), "dd".repeat(50), "773ea91e36800e46854db8ebd09181a72959098b3ef8c122d9635514ced565fe"),
        (
            "0102030405060708090a0b0c0d0e0f10111213141516171819".to_string(),
            "cd".repeat(50),
            "82558a389a443c0ea4cc819899f2083a85f0faa3e578f8077a2e3ff46729665b",
        ),
        (
            "aa".repeat(131),
            hex::encode("Test Using Larger Than Block-Size Key - Hash Key First"),
            "60e431591ee0b67f0d8a26aacbf5b77f8e0bc6213728c5140546040f0ee37f54",
        ),
        (
            "aa".repeat(131),
            hex::encode("This is a test using a larger than block-size key and a larger than block-size data. The key needs to be hashed before being used by the HMAC algorithm."),
            "9b09ffa71b942fcb27635fbcd5b0e944bfdc63644f0713938a7f51535c3a35e2",
        ),
    ];
    for (k, d, want) in cases {
        assert_eq!(hex::encode(hmac_sha256(&unhex(&k), &unhex(&d))), want);
    }
}

#[test]
fn signature_and_verification() {
    let body = b"<alert/>";
    let secret = b"kshana-test-secret";
    let h = sign(body, secret, 1_735_689_600);
    // Computed independently with Python: hmac.new(secret, b"1735689600.<alert/>", sha256).hexdigest()
    // PIN-SCOPE:    one signature computed by Python's standard-library hmac module (independent).
    // PIN-EXCLUDES: any other body, secret or time.
    assert_eq!(
        h,
        "t=1735689600,v1=1acc70948884b021db913f16d843ff37c98b0d627961e250eaffa2ac9074043f"
    );
    assert_eq!(verify(body, &h, secret, 1_735_689_650, 300), Ok(()));
    assert_eq!(
        verify(body, &h, secret, 1_735_690_000, 300),
        Err(Refusal::Stale)
    );
    assert_eq!(
        verify(b"<alert>x</alert>", &h, secret, 1_735_689_600, 300),
        Err(Refusal::Mismatch)
    );
    assert_eq!(
        verify(body, &h, b"other", 1_735_689_600, 300),
        Err(Refusal::Mismatch)
    );
    assert_eq!(
        verify(body, "v1=00", secret, 1_735_689_600, 300),
        Err(Refusal::Malformed)
    );
    assert_eq!(
        verify(body, "t=1,v1=zz", secret, 1, 300),
        Err(Refusal::Malformed)
    );
    // During a secret rotation two signatures are sent; either may match.
    let rotated = format!(
        "{},v1={}",
        sign(body, b"old", 1_735_689_600),
        h.split("v1=").nth(1).unwrap()
    );
    assert_eq!(verify(body, &rotated, secret, 1_735_689_600, 300), Ok(()));
}
