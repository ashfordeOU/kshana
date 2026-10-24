// SPDX-License-Identifier: AGPL-3.0-only
//! Localisation of the human-facing output: one user language across the command line, the HTML
//! reports, the SVG chart text, the verdict words and the error messages.
//!
//! # What is localised, and what never is
//!
//! Localised: command-line messages and errors, `report.html` and `summary.html` text, SVG chart
//! titles, axis labels, legends and the evidence strip, verdict words, evidence labels and error
//! messages. Never localised: JSON keys, error codes, the numbers in machine files, CSV headers and
//! file names. The prose inside the machine documents (a result's `summary`, the evidence labels in
//! JSON) stays English, so that hashes and goldens do not depend on the language.
//!
//! # The catalogue
//!
//! Messages are [Project Fluent](https://projectfluent.org) (`.ftl`). `locales/en/engine.ftl` is the
//! source: the English text of every message, moved verbatim from the Rust source, so the English
//! output is byte-for-byte what it was before. The other languages (`locales/<tag>/engine.ftl`) are
//! translations of it, embedded in the binary (a `cargo install kshana` has no repository to read
//! from); a message missing from a translation falls back to English, per message. The pseudo-locale
//! `en-XA` is made from the English catalogue at first use (accented, bracketed and about 40 % longer:
//! a string that reaches the output without passing through the catalogue shows up unaccented).
//!
//! A message id is a stable key; arguments are named. Write [`t!`] for a message and [`terr!`] for an
//! error message (id starting `e-`; its code is the id in capitals, `e-clock-version` is
//! `E-CLOCK-VERSION`):
//!
//! ```ignore
//! Err(terr!("e-clock-version", version = format!("{v:.2}")))
//! ```
//!
//! Arguments are strings: a number is formatted in Rust, with [`num`] (the locale's decimal mark;
//! English is `{x:.prec$}` exactly), so the catalogue never decides a precision and English stays
//! byte-identical.
//!
//! # The current language
//!
//! A process default ([`set_default`], used by the command line) and a per-run override
//! ([`with_lang`], used by the API entry points: Python, WebAssembly and MCP pass a `lang` option).
//! Threads spawned by the engine see the process default only.
//!
//! # Error codes
//!
//! Engine functions return `Err(String)`; [`terr!`] registers the code of the message it builds, and
//! [`code_of`] finds the code of a final error text (the message may be wrapped by a prefix on its way
//! up). The API puts the code in the structured error object; the command line prints it with the
//! message in every language but English (English text is unchanged), and on a second line with
//! `--verbose` in every language.
use fluent_bundle::concurrent::FluentBundle;
use fluent_bundle::{FluentArgs, FluentResource, FluentValue};
use std::cell::RefCell;
use std::collections::HashMap;
use std::sync::{Arc, Mutex, OnceLock, RwLock};
use unic_langid::LanguageIdentifier;

mod pseudo;

/// The languages the tool is localised in: English (the source) and the sixteen others.
pub const LANGS: [&str; 17] = [
    "en", "nl", "pl", "pt", "fi", "sv", "da", "nb", "cs", "uk", "ru", "de", "fr", "es", "et", "ja",
    "zh-Hans",
];
/// The pseudo-locale used by the tests.
pub const PSEUDO: &str = "en-XA";

/// The embedded catalogues, English first. A language whose file does not exist yet is absent here
/// and falls back to English entirely.
const CATALOGUES: &[(&str, &str)] = &[
    ("en", include_str!("../../locales/en/engine.ftl")),
    ("nl", include_str!("../../locales/nl/engine.ftl")),
    ("pl", include_str!("../../locales/pl/engine.ftl")),
    ("pt", include_str!("../../locales/pt/engine.ftl")),
    ("fi", include_str!("../../locales/fi/engine.ftl")),
    ("sv", include_str!("../../locales/sv/engine.ftl")),
    ("da", include_str!("../../locales/da/engine.ftl")),
    ("nb", include_str!("../../locales/nb/engine.ftl")),
    ("cs", include_str!("../../locales/cs/engine.ftl")),
    ("uk", include_str!("../../locales/uk/engine.ftl")),
    ("ru", include_str!("../../locales/ru/engine.ftl")),
    ("de", include_str!("../../locales/de/engine.ftl")),
    ("fr", include_str!("../../locales/fr/engine.ftl")),
    ("es", include_str!("../../locales/es/engine.ftl")),
    ("et", include_str!("../../locales/et/engine.ftl")),
    ("ja", include_str!("../../locales/ja/engine.ftl")),
    ("zh-Hans", include_str!("../../locales/zh-Hans/engine.ftl")),
];

/// The English catalogue text (the source of every message).
pub fn english_source() -> &'static str {
    CATALOGUES[0].1
}

/// The embedded catalogue text of `tag`, as the translators deliver it.
pub fn catalogue_source(tag: &str) -> Option<&'static str> {
    CATALOGUES.iter().find(|(t, _)| *t == tag).map(|(_, s)| *s)
}

/// A supported language: one of [`LANGS`] or [`PSEUDO`].
#[derive(Clone, Debug, PartialEq, Eq, Hash)]
pub struct Lang(String);

impl Lang {
    /// English, the default and the source language.
    pub fn english() -> Lang {
        Lang("en".into())
    }

    /// The canonical tag (`de`, `zh-Hans`, `en-XA`).
    pub fn tag(&self) -> &str {
        &self.0
    }

    /// Whether this is English: its output is the pre-localisation output, unchanged.
    pub fn is_english(&self) -> bool {
        self.0 == "en"
    }

    /// The decimal mark of human-facing numbers in this language.
    fn decimal_mark(&self) -> char {
        match self.0.as_str() {
            "en" | "en-XA" | "ja" | "zh-Hans" => '.',
            _ => ',',
        }
    }
}

/// Resolve a user-supplied language tag (`de`, `de-AT`, `de_AT.UTF-8`, `zh_CN`, `no`, `en-xa`) to a
/// supported language, or say which tags are supported. `C` and `POSIX` are English.
pub fn resolve(tag: &str) -> Result<Lang, String> {
    let raw = tag.trim();
    let base = raw.split(['.', '@']).next().unwrap_or("").replace('_', "-");
    let lower = base.to_ascii_lowercase();
    if lower.is_empty() || lower == "c" || lower == "posix" {
        return Ok(Lang::english());
    }
    if lower == "en-xa" {
        return Ok(Lang(PSEUDO.into()));
    }
    let primary = lower.split('-').next().unwrap_or("");
    let tag = match primary {
        "zh" => {
            // Simplified Chinese only: zh, zh-Hans, zh-CN, zh-SG. Traditional is not supported.
            if lower.contains("hant")
                || lower.contains("-tw")
                || lower.contains("-hk")
                || lower.contains("-mo")
            {
                return Err(unsupported(raw));
            }
            "zh-Hans".to_string()
        }
        "no" | "nb" | "nn" => "nb".to_string(),
        other => match LANGS.iter().find(|l| **l == other) {
            Some(l) => l.to_string(),
            None => return Err(unsupported(raw)),
        },
    };
    Ok(Lang(tag))
}

fn unsupported(raw: &str) -> String {
    format!(
        "unsupported language {raw:?}; the languages are {} (and {PSEUDO} for tests)",
        LANGS.join(", ")
    )
}

/// The language the command line uses: `--lang`, then `KSHANA_LANG`, then `LC_ALL`, `LC_MESSAGES`
/// and `LANG`, then English. An unsupported `--lang` or `KSHANA_LANG` is an error that names the
/// supported tags; an unsupported locale in the `LC_*` or `LANG` variables (the machine's, not the
/// user's choice for this tool) falls through to the next and finally to English.
pub fn select(flag: Option<&str>) -> Result<Lang, String> {
    select_with(flag, |k| std::env::var(k).ok())
}

/// [`select`] with the environment given, for tests.
pub fn select_with(
    flag: Option<&str>,
    env: impl Fn(&str) -> Option<String>,
) -> Result<Lang, String> {
    if let Some(f) = flag {
        return resolve(f).map_err(|e| format!("--lang: {e}"));
    }
    if let Some(v) = env("KSHANA_LANG").filter(|v| !v.trim().is_empty()) {
        return resolve(&v).map_err(|e| format!("KSHANA_LANG: {e}"));
    }
    for k in ["LC_ALL", "LC_MESSAGES", "LANG"] {
        if let Some(v) = env(k).filter(|v| !v.trim().is_empty()) {
            if let Ok(l) = resolve(&v) {
                return Ok(l);
            }
            // a locale the tool does not speak: the next variable, then English
        }
    }
    Ok(Lang::english())
}

static DEFAULT: RwLock<Option<Lang>> = RwLock::new(None);

thread_local! {
    static OVERRIDE: RefCell<Option<Lang>> = const { RefCell::new(None) };
    static CODES: RefCell<Vec<(String, String)>> = const { RefCell::new(Vec::new()) };
}

/// Set the process default language (the command line does, once, at start).
pub fn set_default(lang: Lang) {
    if let Ok(mut d) = DEFAULT.write() {
        *d = Some(lang);
    }
}

/// The language messages are rendered in on this thread now.
pub fn current() -> Lang {
    OVERRIDE
        .with(|o| o.borrow().clone())
        .or_else(|| DEFAULT.read().ok().and_then(|d| d.clone()))
        .unwrap_or_else(Lang::english)
}

/// Run `f` with `lang` as this thread's language, restoring the previous one afterwards.
pub fn with_lang<R>(lang: Lang, f: impl FnOnce() -> R) -> R {
    struct Restore(Option<Lang>);
    impl Drop for Restore {
        fn drop(&mut self) {
            OVERRIDE.with(|o| *o.borrow_mut() = self.0.take());
        }
    }
    let prev = OVERRIDE.with(|o| o.borrow_mut().replace(lang));
    let _restore = Restore(prev);
    f()
}

type Bundle = FluentBundle<FluentResource>;

fn build(tag: &str, source: &str) -> Result<Bundle, String> {
    let langid: LanguageIdentifier = tag
        .parse()
        .map_err(|e| format!("language tag {tag:?}: {e}"))?;
    let resource = FluentResource::try_new(source.to_string())
        .map_err(|(_, errs)| format!("{tag}/engine.ftl does not parse: {errs:?}"))?;
    let mut bundle = FluentBundle::new_concurrent(vec![langid]);
    // Fluent wraps every placeable in Unicode isolation marks by default; the output must be
    // exactly the text of the message, so they are off (none of the languages is right to left).
    bundle.set_use_isolating(false);
    bundle
        .add_resource(resource)
        .map_err(|errs| format!("{tag}/engine.ftl has duplicate messages: {errs:?}"))?;
    Ok(bundle)
}

fn bundles() -> &'static Mutex<HashMap<String, Arc<Bundle>>> {
    static B: OnceLock<Mutex<HashMap<String, Arc<Bundle>>>> = OnceLock::new();
    B.get_or_init(|| Mutex::new(HashMap::new()))
}

/// The bundle of `tag`, built once. English and the pseudo-locale come from the English source; a
/// language without a catalogue file (or with an empty one) has an empty bundle: every message falls
/// back to English.
fn bundle_of(tag: &str) -> Arc<Bundle> {
    let mut map = bundles().lock().unwrap_or_else(|e| e.into_inner());
    if let Some(b) = map.get(tag) {
        return b.clone();
    }
    let source = if tag == PSEUDO {
        pseudo::pseudo_catalogue(english_source())
    } else {
        catalogue_source(tag).unwrap_or("").to_string()
    };
    let b = Arc::new(build(tag, &source).unwrap_or_else(|e| panic!("{e}")));
    map.insert(tag.to_string(), b.clone());
    b
}

/// Render message `id` in the current language with `args`; English if the language has no such
/// message; the id itself (visibly) if English has none either.
pub fn tr(id: &str, args: &[(&str, String)]) -> String {
    tr_in(&current(), id, args)
}

/// [`tr`] in a given language.
pub fn tr_in(lang: &Lang, id: &str, args: &[(&str, String)]) -> String {
    let mut fa = FluentArgs::new();
    for (k, v) in args {
        fa.set(*k, FluentValue::from(v.clone()));
    }
    for tag in [lang.tag(), "en"] {
        let bundle = bundle_of(tag);
        if let Some(pattern) = bundle.get_message(id).and_then(|m| m.value()) {
            let mut errors = Vec::new();
            let s = bundle.format_pattern(pattern, Some(&fa), &mut errors);
            return s.into_owned();
        }
        if tag == "en" {
            break;
        }
    }
    id.to_string()
}

/// Render error message `id` and remember its code so that [`code_of`] can find it later.
pub fn terr(id: &str, args: &[(&str, String)]) -> String {
    let msg = tr(id, args);
    let code = code_of_id(id);
    // Keyed by the English rendering too, so the code is found whichever language was shown.
    let english = tr_in(&Lang::english(), id, args);
    CODES.with(|c| {
        let mut c = c.borrow_mut();
        for text in [msg.clone(), english] {
            if text.len() >= 8 && !c.iter().any(|(t, _)| *t == text) {
                c.push((text, code.clone()));
            }
        }
        let excess = c.len().saturating_sub(512);
        if excess > 0 {
            c.drain(..excess);
        }
    });
    msg
}

/// The code of an error message id: the id in capitals (`e-clock-version` is `E-CLOCK-VERSION`).
pub fn code_of_id(id: &str) -> String {
    id.to_ascii_uppercase()
}

/// The code of a final error text, if it contains a message built by [`terr!`] on this thread
/// (the most recent such message wins).
pub fn code_of(text: &str) -> Option<String> {
    CODES.with(|c| {
        c.borrow()
            .iter()
            .rev()
            .find(|(m, _)| text.contains(m.as_str()))
            .map(|(_, code)| code.clone())
    })
}

/// Format `x` with `decimals` decimal places and the current language's decimal mark. English is
/// `format!("{x:.decimals$}")` exactly.
pub fn num(x: f64, decimals: usize) -> String {
    localise_decimal(format!("{x:.decimals$}"))
}

/// Format `x` in exponent form with `decimals` mantissa places (`{x:.decimals$e}`) and the current
/// language's decimal mark.
pub fn num_e(x: f64, decimals: usize) -> String {
    localise_decimal(format!("{x:.decimals$e}"))
}

/// Format `x` as `{x}` (the shortest round-trip form) with the current language's decimal mark.
pub fn num_plain(x: f64) -> String {
    localise_decimal(format!("{x}"))
}

/// Replace the `.` of an already formatted number with the current language's decimal mark.
pub fn localise_decimal(s: String) -> String {
    let mark = current().decimal_mark();
    if mark == '.' {
        s
    } else {
        s.replace('.', &mark.to_string())
    }
}

/// A message: `t!("id")` or `t!("id", name = value, ...)`. Each value is turned into a string with
/// `to_string()`; format numbers first with [`num`].
#[macro_export]
macro_rules! t {
    ($id:literal) => { $crate::i18n::tr($id, &[]) };
    ($id:literal, $($k:ident = $v:expr),+ $(,)?) => {
        $crate::i18n::tr($id, &[$((stringify!($k), ($v).to_string())),+])
    };
}

/// An error message: as [`t!`], and the code of the message is remembered for
/// [`code_of`](crate::i18n::code_of). The id starts `e-`.
#[macro_export]
macro_rules! terr {
    ($id:literal) => { $crate::i18n::terr($id, &[]) };
    ($id:literal, $($k:ident = $v:expr),+ $(,)?) => {
        $crate::i18n::terr($id, &[$((stringify!($k), ($v).to_string())),+])
    };
}

#[cfg(test)]
mod tests;
