# Guide for German (de)

## Terms (English -> rendering)
- scenario -> Szenario
- evidence pack -> Nachweispaket
- ledger -> Register
- verification matrix -> Verifikationsmatrix
- interference -> Störung
- integrity -> Integrität
- trust score -> Vertrauenswert
- receiver -> Empfänger
- clock -> Uhr
- timing -> Zeitgebung
- orbit determination -> Bahnbestimmung
- ephemeris -> Ephemeride
- carrier phase -> Trägerphase
- integer ambiguity -> ganzzahlige Mehrdeutigkeit
- Love number -> Love-Zahl
- libration -> Libration
- reference frame -> Bezugssystem
- pre-registration -> Vorregistrierung
- oracle (independent reference) -> unabhängige Referenz
- bar (pre-registered threshold) -> Zielwert (vorab festgelegt)
- baseline -> Basislinie
- holdout (sealed set) -> zurückgehaltener Datensatz
- advisory -> Hinweis (beratend)
- type-approved -> typzugelassen
- machine translation -> maschinelle Übersetzung
- native speaker -> Muttersprachler
- reviewed -> geprüft

## Kept in English: VALIDATED, MODELLED, PARTNER, NOT MET, MET, EXPLORATORY; acronyms GNSS, PNT, RAIM, ARAIM, NMEA, CUSUM, AUC, ROC, LAMBDA, DOP; by field usage: holdover, jamming, meaconing, spoofing

## Forbidden as claims about Kshana (negated use is required where the English is negated; X.509 certificate objects are fine): certified: zertifiziert, Zertifizierung, zertifiziert nach; conformant: konform, normkonform, konformitätsgeprüft, Konformität; compliant: konform, regelkonform, normgerecht, erfüllt die Anforderungen, Compliance; approved: zugelassen, genehmigt, freigegeben, abgenommen, Zulassung
- fixed phrase for 'supports evidence for': {"supports evidence for": "liefert Belege für"}

## Linguistic notes
- locale: de (Standard German; no de-AT/de-CH variants)
- plural_categories: one, other
- plural_note: 'one' is exactly 1; 0 and 2+ are 'other'. Write the selector, never glue 'Sekunde'+'n'.
- grammatical_case_and_gender: Four cases (nominative, accusative, dative, genitive), three genders, adjective declension and compound nouns: any string that takes a variable noun or a placeable needs the case chosen in the message (Fluent selector or separate term), and a placeable inside a compound is avoided. Capitalise all nouns.
- address_register: Formal: 'Sie' (capitalised) or impersonal phrasing, as usual in technical documentation.
- decimal_separator: ,
- thousands_separator: . (period; 4-digit numbers are grouped in de)
- numbers: Numbers and units are formatted by Intl at runtime through Fluent placeables ({ NUMBER($n) }); never write a number into a translated string. Where a count changes the wording, use a Fluent selector over the plural categories above, not string concatenation.

## Advisory sentences (use exactly when an English message embeds the English sentence)
- EN: Advisory software, not type-approved navigation equipment (IEC 61108, IEC 61162): the operator remains responsible for the navigation of the vessel.
  de: Beratende Software, keine typzugelassene Navigationsausrüstung (IEC 61108, IEC 61162): Der Betreiber bleibt für die Navigation des Schiffes verantwortlich.
- EN: Advisory software, not type-approved equipment.
  de: Beratende Software, kein typzugelassenes Gerät.
- EN: Advisory software for research, simulation and test. It is not type-approved equipment and does not rate or approve a receiver, a clock or a laboratory.
  de: Beratende Software für Forschung, Simulation und Test. Sie ist kein typzugelassenes Gerät und bewertet oder genehmigt weder einen Empfänger noch eine Uhr noch ein Labor.
- EN: Advisory only: not type-approved navigation equipment; the operator remains responsible. Evidence tier: MODELLED.
  de: Nur beratend: keine typzugelassene Navigationsausrüstung; der Betreiber bleibt verantwortlich. Evidenzstufe: MODELLED.
- Machine translation notice: Maschinelle Übersetzung, nicht von einem Muttersprachler geprüft. Englisch ist die maßgebliche Fassung.
