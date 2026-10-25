// SPDX-License-Identifier: AGPL-3.0-only
//! The pseudo-locale `en-XA`: the English catalogue with every text accented, and every rendered
//! message bracketed and padded by about 40 % (a typical growth of a translation). Placeables and
//! arguments are untouched. A string that reaches the output without passing through the catalogue
//! shows up unaccented and unbracketed; a layout that cannot take longer text breaks in the tests
//! instead of in a translator's language.
use std::borrow::Cow;

/// The text transform of the `en-XA` bundle: Fluent applies it to the text elements of a message,
/// never to placeables or arguments.
pub fn accent_text(s: &str) -> Cow<'_, str> {
    Cow::Owned(
        s.chars()
            .map(|c| match c {
                'a' => 'á',
                'e' => 'é',
                'i' => 'í',
                'o' => 'ó',
                'u' => 'ú',
                'y' => 'ý',
                'c' => 'ç',
                'n' => 'ñ',
                's' => 'š',
                'z' => 'ž',
                'A' => 'Á',
                'E' => 'É',
                'I' => 'Í',
                'O' => 'Ó',
                'U' => 'Ú',
                'Y' => 'Ý',
                'C' => 'Ç',
                'N' => 'Ñ',
                'S' => 'Š',
                'Z' => 'Ž',
                other => other,
            })
            .collect(),
    )
}

/// Bracket a rendered message and pad it by about 40 % of its length.
pub fn wrap(rendered: &str) -> String {
    let pad = (rendered.chars().count() * 2).div_ceil(5);
    format!("[{rendered} {}]", "~".repeat(pad))
}
