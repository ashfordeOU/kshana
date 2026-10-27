// SPDX-License-Identifier: AGPL-3.0-only
//! The pseudo-locale `en-XA`: the English catalogue with every text accented, and every rendered
//! message bracketed and padded by about 40 % (a typical growth of a translation). Placeables and
//! arguments are untouched. A string that reaches the output without passing through the catalogue
//! shows up unaccented and unbracketed; a layout that cannot take longer text breaks in the tests
//! instead of in a translator's language.
use std::borrow::Cow;

/// The text transform of the `en-XA` bundle: Fluent applies it to the text elements of a message,
/// never to placeables or arguments. Markup in a message (a tag such as `<code>` or `<p class="note">`,
/// an entity such as `&amp;`) is left as it is, so a pseudo-localised page is still a well-formed page.
pub fn accent_text(s: &str) -> Cow<'_, str> {
    let mut out = String::with_capacity(s.len() + s.len() / 4);
    let mut rest = s;
    while let Some(c) = rest.chars().next() {
        let skip = match c {
            '<' if rest[1..]
                .chars()
                .next()
                .is_some_and(|n| n.is_ascii_alphabetic() || n == '/') =>
            {
                Some(rest.find('>').map_or(rest.len(), |i| i + 1))
            }
            '&' => rest
                .find(';')
                .filter(|&i| {
                    i > 1
                        && i <= 10
                        && rest[1..i]
                            .chars()
                            .all(|n| n.is_ascii_alphanumeric() || n == '#')
                })
                .map(|i| i + 1),
            _ => None,
        };
        if let Some(n) = skip {
            out.push_str(&rest[..n]);
            rest = &rest[n..];
            continue;
        }
        out.push(accent(c));
        rest = &rest[c.len_utf8()..];
    }
    Cow::Owned(out)
}

fn accent(c: char) -> char {
    match c {
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
    }
}

/// Bracket a rendered message and pad it by about 40 % of its length.
pub fn wrap(rendered: &str) -> String {
    let pad = (rendered.chars().count() * 2).div_ceil(5);
    format!("[{rendered} {}]", "~".repeat(pad))
}

#[cfg(test)]
mod tests {
    use super::accent_text;

    #[test]
    fn markup_and_entities_are_left_alone() {
        assert_eq!(
            accent_text("a <code>x</code> &amp; <p class=\"note\">b</p> a < b"),
            "á <code>x</code> &amp; <p class=\"note\">b</p> á < b"
        );
        assert_eq!(accent_text("open <a href=\""), "ópéñ <a href=\"");
    }
}
