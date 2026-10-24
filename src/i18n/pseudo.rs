// SPDX-License-Identifier: AGPL-3.0-only
//! The pseudo-locale `en-XA`: the English catalogue with every text accented, bracketed and padded
//! by about 40 % (a typical growth of a translation), placeables untouched. A string that reaches the
//! output without passing through the catalogue shows up unaccented and unbracketed; a layout that
//! cannot take longer text breaks in the tests instead of in a translator's language.
use fluent_syntax::ast::{Entry, Expression, InlineExpression, Pattern, PatternElement};

/// The `en-XA` catalogue text made from the English one.
pub fn pseudo_catalogue(english: &str) -> String {
    let mut res = match fluent_syntax::parser::parse(english.to_string()) {
        Ok(r) => r,
        Err((r, _)) => r,
    };
    for entry in &mut res.body {
        match entry {
            Entry::Message(m) => {
                if let Some(p) = &mut m.value {
                    wrap(p);
                }
                for a in &mut m.attributes {
                    wrap(&mut a.value);
                }
            }
            Entry::Term(t) => {
                wrap(&mut t.value);
                for a in &mut t.attributes {
                    wrap(&mut a.value);
                }
            }
            _ => {}
        }
    }
    fluent_syntax::serializer::serialize(&res)
}

/// Accent the text of `p` and put it in brackets with padding, once, at the outside.
fn wrap(p: &mut Pattern<String>) {
    let len = accent_all(p);
    p.elements.insert(
        0,
        PatternElement::TextElement {
            value: "[".to_string(),
        },
    );
    let pad = (len * 2).div_ceil(5);
    p.elements.push(PatternElement::TextElement {
        value: format!(" {}]", "~".repeat(pad)),
    });
}

/// Accent every text element of `p` (and of the patterns nested in select expressions); the number
/// of characters of text seen.
fn accent_all(p: &mut Pattern<String>) -> usize {
    let mut n = 0;
    for el in &mut p.elements {
        match el {
            PatternElement::TextElement { value } => {
                n += value.chars().count();
                *value = accent(value);
            }
            PatternElement::Placeable { expression } => n += accent_expression(expression),
        }
    }
    n
}

fn accent_expression(e: &mut Expression<String>) -> usize {
    match e {
        Expression::Select { variants, .. } => {
            let mut n = 0;
            for v in variants {
                n += accent_all(&mut v.value);
            }
            n
        }
        Expression::Inline(InlineExpression::Placeable { expression }) => {
            accent_expression(expression)
        }
        Expression::Inline(_) => 0,
    }
}

/// Replace the letters that have a plain accented look-alike.
fn accent(s: &str) -> String {
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
        .collect()
}
