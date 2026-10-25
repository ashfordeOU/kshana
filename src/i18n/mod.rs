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
//! Messages are [Project Fluent](https://projectfluent.org) (`.ftl`). `i18n/en/engine.ftl` is the
//! source: the English text of every message, moved verbatim from the Rust source, so the English
//! output is byte-for-byte what it was before. The other languages (`i18n/<tag>/engine.ftl`) are
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

/// The languages the tool is localised in: English (the source) and the seventeen others.
pub const LANGS: [&str; 18] = [
    "en", "nl", "pl", "pt-BR", "pt-PT", "fi", "sv", "da", "nb", "cs", "uk", "ru", "de", "fr", "es",
    "et", "ja", "zh-Hans",
];
/// The pseudo-locale used by the tests.
pub const PSEUDO: &str = "en-XA";

/// The English catalogue, embedded in every build.
const ENGLISH: &str = include_str!("../../i18n/en/engine.ftl");

/// The other catalogues, embedded in the native library, the command line and the Python wheel. The
/// WebAssembly build embeds English only (the other sixteen would add about 150 kB gzip each); there the
/// page fetches `i18n/<lang>/engine.ftl` and hands it to [`register_catalogue`].
#[cfg(not(target_arch = "wasm32"))]
const OTHERS: &[(&str, &str)] = &[
    ("nl", include_str!("../../i18n/nl/engine.ftl")),
    ("pl", include_str!("../../i18n/pl/engine.ftl")),
    ("pt-BR", include_str!("../../i18n/pt-BR/engine.ftl")),
    ("pt-PT", include_str!("../../i18n/pt-PT/engine.ftl")),
    ("fi", include_str!("../../i18n/fi/engine.ftl")),
    ("sv", include_str!("../../i18n/sv/engine.ftl")),
    ("da", include_str!("../../i18n/da/engine.ftl")),
    ("nb", include_str!("../../i18n/nb/engine.ftl")),
    ("cs", include_str!("../../i18n/cs/engine.ftl")),
    ("uk", include_str!("../../i18n/uk/engine.ftl")),
    ("ru", include_str!("../../i18n/ru/engine.ftl")),
    ("de", include_str!("../../i18n/de/engine.ftl")),
    ("fr", include_str!("../../i18n/fr/engine.ftl")),
    ("es", include_str!("../../i18n/es/engine.ftl")),
    ("et", include_str!("../../i18n/et/engine.ftl")),
    ("ja", include_str!("../../i18n/ja/engine.ftl")),
    ("zh-Hans", include_str!("../../i18n/zh-Hans/engine.ftl")),
];
#[cfg(target_arch = "wasm32")]
const OTHERS: &[(&str, &str)] = &[];

fn registered() -> &'static RwLock<HashMap<String, &'static str>> {
    static R: OnceLock<RwLock<HashMap<String, &'static str>>> = OnceLock::new();
    R.get_or_init(|| RwLock::new(HashMap::new()))
}

/// Use `ftl` as the catalogue of language `tag` from now on, in place of any embedded one. This is how
/// the WebAssembly build gets its languages: the page fetches `i18n/<lang>/engine.ftl` and registers it.
/// The text is checked first; a catalogue that does not parse, or a tag that is not supported, is an
/// error and changes nothing. A message the catalogue lacks is shown in English.
pub fn register_catalogue(tag: &str, ftl: &str) -> Result<(), String> {
    let lang = resolve(tag)?;
    if lang.is_english() {
        return Err("English is built in and cannot be replaced".to_string());
    }
    let tag = lang.tag().to_string();
    build(&tag, ftl)?;
    let text: &'static str = Box::leak(ftl.to_string().into_boxed_str());
    registered()
        .write()
        .unwrap_or_else(|e| e.into_inner())
        .insert(tag.clone(), text);
    bundles()
        .lock()
        .unwrap_or_else(|e| e.into_inner())
        .remove(&tag);
    Ok(())
}

/// The English catalogue text (the source of every message).
pub fn english_source() -> &'static str {
    ENGLISH
}

/// The embedded catalogue text of `tag`, as the translators deliver it.
pub fn catalogue_source(tag: &str) -> Option<&'static str> {
    if tag == "en" {
        return Some(ENGLISH);
    }
    if let Some(s) = registered()
        .read()
        .unwrap_or_else(|e| e.into_inner())
        .get(tag)
    {
        return Some(s);
    }
    OTHERS.iter().find(|(t, _)| *t == tag).map(|(_, s)| *s)
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
        // Portuguese has two locales: Portugal's own, and Brazil's for bare `pt` and every other region.
        "pt" => if lower.starts_with("pt-pt") {
            "pt-PT"
        } else {
            "pt-BR"
        }
        .to_string(),
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
    if tag == PSEUDO {
        bundle.set_transform(Some(pseudo::accent_text));
    }
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
        english_source().to_string()
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
    if is_error_id(id) {
        return terr(id, args);
    }
    tr_in(&current(), id, args)
}

/// Error messages have ids that start `e-` (library errors) or `main-error-` (command-line errors);
/// their codes are remembered when they are rendered.
fn is_error_id(id: &str) -> bool {
    id.starts_with("e-") || id.starts_with("main-error-")
}

/// [`tr`] in a given language.
pub fn tr_in(lang: &Lang, id: &str, args: &[(&str, String)]) -> String {
    let mut fa = FluentArgs::new();
    for (k, v) in args {
        fa.set(*k, arg_value(k, v));
    }
    for tag in [lang.tag(), "en"] {
        let bundle = bundle_of(tag);
        if let Some(pattern) = bundle
            .get_message(&format!("engine-{id}"))
            .and_then(|m| m.value())
        {
            let mut errors = Vec::new();
            let s = bundle
                .format_pattern(pattern, Some(&fa), &mut errors)
                .into_owned();
            return if tag == PSEUDO { pseudo::wrap(&s) } else { s };
        }
        if tag == "en" {
            break;
        }
    }
    id.to_string()
}

/// Whether a variable name says it is a count (`n`, `n_epochs`, `sequence_count`, `num_epochs`):
/// those reach Fluent as numbers, so a translation may select the plural form with
/// `{ $n -> [one] ... [few] ... *[other] ... }`. Every other variable is text.
pub fn is_count_name(name: &str) -> bool {
    name == "n"
        || name == "count"
        || name.starts_with("n_")
        || name.starts_with("num_")
        || name.ends_with("_count")
}

fn arg_value(name: &str, v: &str) -> FluentValue<'static> {
    // Only a plain non-negative integer is a count; anything else stays text (and shows as given).
    if is_count_name(name) && !v.is_empty() && v.len() < 16 && v.bytes().all(|b| b.is_ascii_digit())
    {
        if let Ok(n) = v.parse::<u64>() {
            return FluentValue::from(n as f64);
        }
    }
    FluentValue::from(v.to_string())
}

/// Render error message `id` and remember its code so that [`code_of`] can find it later.
pub fn terr(id: &str, args: &[(&str, String)]) -> String {
    let msg = tr_in(&current(), id, args);
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

static VERBOSE: std::sync::atomic::AtomicBool = std::sync::atomic::AtomicBool::new(false);

/// Make [`error_report`] add the code line in every language (`--verbose`).
pub fn set_verbose(on: bool) {
    VERBOSE.store(on, std::sync::atomic::Ordering::Relaxed);
}

/// An error text as the command line prints it. English is the text unchanged. Another language
/// gets the code after the message, `text [E-CODE]`, so a report in any language can be matched to
/// the catalogue. With `--verbose` the code is also on a second line in every language, `code: E-CODE`
/// (the code is an identifier and is never translated). A text with no known code is unchanged.
pub fn error_report(text: &str) -> String {
    let Some(code) = code_of(text) else {
        return text.to_string();
    };
    let mut out = if current().is_english() {
        text.to_string()
    } else {
        format!("{text} [{code}]")
    };
    if VERBOSE.load(std::sync::atomic::Ordering::Relaxed) {
        out.push_str("\ncode: ");
        out.push_str(&code);
    }
    out
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

/// A message argument as a string. A function rather than `.to_string()` so that the `Display`
/// bound, not a method lookup, decides the type of a closure parameter (`map_err(|e| t!(.., e = e))`).
pub fn arg<T: std::fmt::Display + ?Sized>(v: &T) -> String {
    v.to_string()
}

/// A message: `t!("id")` or `t!("id", name = value, ...)`. Each value is turned into a string with
/// `to_string()`; format numbers first with [`num`].
#[macro_export]
macro_rules! t {
    ($id:literal) => { $crate::i18n::tr($id, &[]) };
    ($id:literal, $($k:ident = $v:expr),+ $(,)?) => {
        $crate::i18n::tr($id, &[$((stringify!($k), $crate::i18n::arg(&($v)))),+])
    };
}

/// An error message: as [`t!`], and the code of the message is remembered for
/// [`code_of`](crate::i18n::code_of). The id starts `e-`.
#[macro_export]
macro_rules! terr {
    ($id:literal) => { $crate::i18n::terr($id, &[]) };
    ($id:literal, $($k:ident = $v:expr),+ $(,)?) => {
        $crate::i18n::terr($id, &[$((stringify!($k), $crate::i18n::arg(&($v)))),+])
    };
}

#[cfg(test)]
mod tests;
