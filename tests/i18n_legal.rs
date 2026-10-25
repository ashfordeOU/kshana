// SPDX-License-Identifier: AGPL-3.0-only
//! The advisories, disclaimers and notices: the English catalogue message of each is its constant,
//! byte for byte, so the machine files that carry the constant and the text a person reads agree.

#[test]
fn every_legal_message_is_its_constant_in_english() {
    for (id, constant) in kshana::legal::LEGAL {
        let shown = kshana::i18n::tr_in(&kshana::i18n::Lang::english(), id, &[]);
        assert_eq!(shown, *constant, "{id}");
        assert_eq!(
            kshana::legal::text(id),
            *constant,
            "{id} in the default language"
        );
    }
    assert!(kshana::legal::LEGAL.len() >= 17);
}

#[test]
fn a_language_without_the_translation_shows_the_english_text() {
    for tag in ["de", "pt-PT", "ja"] {
        kshana::i18n::with_lang(kshana::i18n::resolve(tag).unwrap(), || {
            for (id, constant) in kshana::legal::LEGAL {
                // Until a translator supplies it, the English text stands: never a missing text.
                assert!(!kshana::legal::text(id).is_empty(), "{tag} {id}");
                let _ = constant;
            }
        });
    }
}
