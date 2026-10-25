// SPDX-License-Identifier: AGPL-3.0-only
use super::*;

fn env(pairs: &'static [(&'static str, &'static str)]) -> impl Fn(&str) -> Option<String> {
    move |k| {
        pairs
            .iter()
            .find(|(n, _)| *n == k)
            .map(|(_, v)| v.to_string())
    }
}

#[test]
fn tags_resolve_to_the_supported_languages() {
    for (given, want) in [
        ("en", "en"),
        ("en-US", "en"),
        ("de", "de"),
        ("de_AT.UTF-8", "de"),
        ("de-CH", "de"),
        ("pt-BR", "pt"),
        ("pt_PT", "pt"),
        ("nb", "nb"),
        ("no", "nb"),
        ("nn_NO", "nb"),
        ("zh", "zh-Hans"),
        ("zh_CN", "zh-Hans"),
        ("zh-Hans-CN", "zh-Hans"),
        ("zh-SG", "zh-Hans"),
        ("ja_JP.UTF-8", "ja"),
        ("uk", "uk"),
        ("en-XA", "en-XA"),
        ("en-xa", "en-XA"),
        ("C", "en"),
        ("POSIX", "en"),
        ("", "en"),
    ] {
        assert_eq!(resolve(given).unwrap().tag(), want, "{given:?}");
    }
    for bad in ["zh-TW", "zh-Hant", "zh-HK", "tlh", "xx", "klingon"] {
        let e = resolve(bad).unwrap_err();
        assert!(e.contains(bad), "{e}");
        for tag in LANGS {
            assert!(e.contains(tag), "{e} lacks {tag}");
        }
    }
}

#[test]
fn the_selection_order_is_flag_then_environment_then_english() {
    let all = env(&[
        ("KSHANA_LANG", "fr"),
        ("LC_ALL", "de_DE.UTF-8"),
        ("LC_MESSAGES", "es_ES.UTF-8"),
        ("LANG", "ja_JP.UTF-8"),
    ]);
    assert_eq!(select_with(Some("nl"), &all).unwrap().tag(), "nl");
    assert_eq!(select_with(None, &all).unwrap().tag(), "fr");
    let no_tool = env(&[
        ("LC_ALL", "de_DE.UTF-8"),
        ("LC_MESSAGES", "es_ES.UTF-8"),
        ("LANG", "ja_JP.UTF-8"),
    ]);
    assert_eq!(select_with(None, &no_tool).unwrap().tag(), "de");
    let lc = env(&[("LC_MESSAGES", "es_ES.UTF-8"), ("LANG", "ja_JP.UTF-8")]);
    assert_eq!(select_with(None, &lc).unwrap().tag(), "es");
    let lang = env(&[("LANG", "ja_JP.UTF-8")]);
    assert_eq!(select_with(None, &lang).unwrap().tag(), "ja");
    assert_eq!(select_with(None, &env(&[])).unwrap().tag(), "en");
    // A machine locale the tool does not speak falls through; the user's own choice does not.
    let odd = env(&[("LC_ALL", "tlh_XX"), ("LANG", "fr_FR.UTF-8")]);
    assert_eq!(select_with(None, &odd).unwrap().tag(), "fr");
    assert!(select_with(Some("tlh"), &env(&[]))
        .unwrap_err()
        .starts_with("--lang: "));
    let bad = env(&[("KSHANA_LANG", "tlh")]);
    assert!(select_with(None, &bad)
        .unwrap_err()
        .starts_with("KSHANA_LANG: "));
    // An empty variable is not a choice.
    assert_eq!(
        select_with(None, &env(&[("KSHANA_LANG", " "), ("LANG", "de")]))
            .unwrap()
            .tag(),
        "de"
    );
}

#[test]
fn english_is_the_source_and_the_default() {
    assert_eq!(current().tag(), "en");
    let s = tr(
        "e-clock-log-unknown-gap-policy-expected-refuse",
        &[("other", "\"x\"".to_string())],
    );
    assert_eq!(
        s,
        "unknown gap policy \"x\"; expected refuse, longest or linear"
    );
}

#[test]
fn a_per_run_language_applies_and_is_restored() {
    let de = resolve("de").unwrap();
    with_lang(de.clone(), || {
        assert_eq!(current(), de);
        with_lang(Lang::english(), || assert!(current().is_english()));
        assert_eq!(current(), de);
    });
    assert!(current().is_english());
}

#[test]
fn a_language_without_the_message_falls_back_to_english_and_an_unknown_id_shows_itself() {
    // No translation file has any message yet: every language shows the English text.
    let nl = resolve("nl").unwrap();
    assert_eq!(
        tr_in(
            &nl,
            "e-clock-log-unknown-gap-policy-expected-refuse",
            &[("other", "\"y\"".to_string())]
        ),
        tr_in(
            &Lang::english(),
            "e-clock-log-unknown-gap-policy-expected-refuse",
            &[("other", "\"y\"".to_string())]
        )
    );
    assert_eq!(tr("no-such-message", &[]), "no-such-message");
}

#[test]
fn the_pseudo_locale_accents_brackets_pads_and_keeps_the_arguments() {
    let xa = resolve("en-XA").unwrap();
    let s = tr_in(
        &xa,
        "e-clock-log-unknown-gap-policy-expected-refuse",
        &[("other", "\"x\"".to_string())],
    );
    assert!(s.starts_with('['), "{s}");
    assert!(s.ends_with(']'), "{s}");
    assert!(s.contains("\"x\""), "the argument is not accented: {s}");
    assert!(
        s.contains("ñkñóñ") || s.contains("úñkñóñ") || s.contains("úñkñówñ") || s.contains("gáp"),
        "{s}"
    );
    assert!(s.contains('~'), "padded: {s}");
    let en = tr_in(
        &Lang::english(),
        "e-clock-log-unknown-gap-policy-expected-refuse",
        &[("other", "\"x\"".to_string())],
    );
    assert!(
        s.chars().count() as f64 >= 1.3 * en.chars().count() as f64,
        "longer: {s}"
    );
    assert_ne!(s, en);
}

#[test]
fn an_error_code_is_the_id_in_capitals_and_is_found_in_a_wrapped_message() {
    assert_eq!(
        code_of_id("e-clock-log-unknown-gap-policy-expected-refuse"),
        "E-CLOCK-LOG-UNKNOWN-GAP-POLICY-EXPECTED-REFUSE"
    );
    let msg = terr!(
        "e-clock-log-unknown-gap-policy-expected-refuse",
        other = "\"x\""
    );
    assert_eq!(
        code_of(&msg).as_deref(),
        Some("E-CLOCK-LOG-UNKNOWN-GAP-POLICY-EXPECTED-REFUSE")
    );
    // The caller may have added a prefix on the way up.
    assert_eq!(
        code_of(&format!("clock_log: {msg}")).as_deref(),
        Some("E-CLOCK-LOG-UNKNOWN-GAP-POLICY-EXPECTED-REFUSE")
    );
    // Another version of the message is another text, with no code.
    assert_eq!(code_of("some other error that is long enough"), None);
    // Under another language the English text still finds the code.
    with_lang(resolve("en-XA").unwrap(), || {
        let shown = terr!(
            "e-clock-log-unknown-gap-policy-expected-refuse",
            other = "\"z\""
        );
        assert!(shown.starts_with('['));
        assert_eq!(
            code_of(&shown).as_deref(),
            Some("E-CLOCK-LOG-UNKNOWN-GAP-POLICY-EXPECTED-REFUSE")
        );
        assert_eq!(
            code_of(&tr_in(
                &Lang::english(),
                "e-clock-log-unknown-gap-policy-expected-refuse",
                &[("other", "\"z\"".to_string())]
            ))
            .as_deref(),
            Some("E-CLOCK-LOG-UNKNOWN-GAP-POLICY-EXPECTED-REFUSE")
        );
    });
}

#[test]
fn numbers_take_the_languages_decimal_mark_and_english_is_rust_formatting() {
    for x in [
        0.0,
        1.0,
        -2.5,
        3.14159,
        1234567.891,
        1.0e-12,
        f64::MAX / 1e300,
    ] {
        for d in [0usize, 1, 2, 6] {
            assert_eq!(num(x, d), format!("{x:.d$}"), "{x} {d}");
        }
        assert_eq!(num_e(x, 2), format!("{x:.2e}"));
        assert_eq!(num_plain(x), format!("{x}"));
    }
    with_lang(resolve("de").unwrap(), || {
        assert_eq!(num(3.14159, 2), "3,14");
        assert_eq!(num_e(1.5e-9, 2), "1,50e-9");
        assert_eq!(num_plain(0.25), "0,25");
        assert_eq!(num(7.0, 0), "7");
    });
    for tag in ["ja", "zh-Hans", "en-XA"] {
        with_lang(resolve(tag).unwrap(), || {
            assert_eq!(num(3.14159, 2), "3.14", "{tag}")
        });
    }
    for tag in LANGS {
        let l = resolve(tag).unwrap();
        let want = if matches!(tag, "en" | "ja" | "zh-Hans") {
            "2.50"
        } else {
            "2,50"
        };
        with_lang(l, || assert_eq!(num(2.5, 2), want, "{tag}"));
    }
}
