// SPDX-License-Identifier: AGPL-3.0-only
//! Shareable scenario permalinks (self-contained Base64, RFC 4648).
//!
//! A scenario in the playground is a TOML document. To share it as a URL, the TOML is
//! Base64-encoded into a `?s=` query parameter; opening that URL decodes it back. This
//! module provides the codec — a dependency-free RFC 4648 Base64 (the standard `+/`
//! alphabet for interop, and the URL-safe `-_` alphabet without padding for clean query
//! strings) and the `encode_scenario` / `decode_scenario` wrappers.
//!
//! Keeping it in the engine (rather than only in JavaScript) means the same encoding is
//! available to the Rust, CLI, Python, and WebAssembly surfaces, and is unit-tested
//! against the canonical RFC 4648 vectors.

const STD: &[u8; 64] = b"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";
const URL: &[u8; 64] = b"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789-_";

/// Base64-encode `bytes` with the given 64-symbol `alphabet`, padding with `=` when
/// `pad` is set (standard) or leaving the output unpadded (URL-safe query strings).
fn encode(bytes: &[u8], alphabet: &[u8; 64], pad: bool) -> String {
    let mut out = String::with_capacity(bytes.len().div_ceil(3) * 4);
    for chunk in bytes.chunks(3) {
        let b0 = chunk[0] as u32;
        let b1 = *chunk.get(1).unwrap_or(&0) as u32;
        let b2 = *chunk.get(2).unwrap_or(&0) as u32;
        let n = (b0 << 16) | (b1 << 8) | b2;
        out.push(alphabet[(n >> 18 & 63) as usize] as char);
        out.push(alphabet[(n >> 12 & 63) as usize] as char);
        if chunk.len() > 1 {
            out.push(alphabet[(n >> 6 & 63) as usize] as char);
        } else if pad {
            out.push('=');
        }
        if chunk.len() > 2 {
            out.push(alphabet[(n & 63) as usize] as char);
        } else if pad {
            out.push('=');
        }
    }
    out
}

/// Decode a Base64 string under the given `alphabet`, accepting either alphabet's
/// padding and ignoring `=` and whitespace. Returns `None` on an invalid symbol or a
/// truncated (single-character) final group.
fn decode(s: &str, alphabet: &[u8; 64]) -> Option<Vec<u8>> {
    let mut rev = [255u8; 256];
    for (i, &c) in alphabet.iter().enumerate() {
        rev[c as usize] = i as u8;
    }
    let chars: Vec<u8> = s
        .bytes()
        .filter(|&c| c != b'=' && !c.is_ascii_whitespace())
        .collect();
    let mut out = Vec::with_capacity(chars.len() / 4 * 3);
    for chunk in chars.chunks(4) {
        if chunk.len() < 2 {
            return None;
        }
        let mut vals = [0u32; 4];
        for (i, &c) in chunk.iter().enumerate() {
            let v = rev[c as usize];
            if v == 255 {
                return None;
            }
            vals[i] = v as u32;
        }
        let n = (vals[0] << 18) | (vals[1] << 12) | (vals[2] << 6) | vals[3];
        out.push((n >> 16 & 0xff) as u8);
        if chunk.len() >= 3 {
            out.push((n >> 8 & 0xff) as u8);
        }
        if chunk.len() >= 4 {
            out.push((n & 0xff) as u8);
        }
    }
    Some(out)
}

/// Standard RFC 4648 Base64 encode (alphabet `A–Za–z0–9+/`, `=` padding).
pub fn base64_encode(bytes: &[u8]) -> String {
    encode(bytes, STD, true)
}

/// Standard RFC 4648 Base64 decode.
pub fn base64_decode(s: &str) -> Option<Vec<u8>> {
    decode(s, STD)
}

/// Encode a scenario TOML document into a URL-safe, unpadded permalink token suitable
/// for a `?s=` query parameter (no `+`, `/`, or `=` to escape).
pub fn encode_scenario(toml: &str) -> String {
    encode(toml.as_bytes(), URL, false)
}

/// Decode a permalink token back into the scenario TOML, or `None` if the token is not
/// valid Base64 or not valid UTF-8.
pub fn decode_scenario(token: &str) -> Option<String> {
    let bytes = decode(token, URL)?;
    String::from_utf8(bytes).ok()
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn rfc4648_standard_vectors() {
        // The canonical RFC 4648 §10 test vectors.
        let cases = [
            ("", ""),
            ("f", "Zg=="),
            ("fo", "Zm8="),
            ("foo", "Zm9v"),
            ("foob", "Zm9vYg=="),
            ("fooba", "Zm9vYmE="),
            ("foobar", "Zm9vYmFy"),
        ];
        for (plain, b64) in cases {
            assert_eq!(base64_encode(plain.as_bytes()), b64, "encode {plain}");
            assert_eq!(
                base64_decode(b64).unwrap(),
                plain.as_bytes(),
                "decode {b64}"
            );
        }
    }

    #[test]
    fn url_safe_round_trips_a_scenario() {
        let toml =
            "kind = \"clock\"\n[time]\nstep_s = 1.0\n[gnss]\nshape = \"outage\"\n# share me 𝛂β\n";
        let token = encode_scenario(toml);
        // URL-safe and unpadded: nothing that needs percent-escaping in a query string.
        assert!(!token.contains('+') && !token.contains('/') && !token.contains('='));
        assert_eq!(decode_scenario(&token).as_deref(), Some(toml));
    }

    #[test]
    fn decode_rejects_invalid_symbols() {
        // A standard-alphabet '+' is not in the URL-safe alphabet.
        assert!(decode_scenario("abc+def").is_none());
        // Non-base64 punctuation is rejected outright.
        assert!(base64_decode("not valid!@#").is_none());
    }

    #[test]
    fn empty_and_binary_round_trip() {
        assert_eq!(base64_encode(&[]), "");
        assert_eq!(base64_decode("").unwrap(), Vec::<u8>::new());
        // All byte values survive a round trip through the standard codec.
        let bytes: Vec<u8> = (0..=255u8).collect();
        assert_eq!(base64_decode(&base64_encode(&bytes)).unwrap(), bytes);
    }
}
