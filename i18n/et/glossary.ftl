# Sõnastik (et).

## Evidence tiers
-tier-validated = VALIDATED
    .gloss = kontrollitud sõltumatu välise etaloni vastu
-tier-modelled = MODELLED
    .gloss = arvutatud mudelist, ilma välise etalonita
-tier-partner = PARTNER
    .gloss = partneri osa; Kshana seda ei paku
-tier-exploratory = EXPLORATORY
    .gloss = ei ole ette kindlaks määratud järeldusena

## Verdicts against a pre-registered bar
-verdict-met = MET
    .gloss = ette kindlaks määratud lävi saavutati
-verdict-not-met = NOT MET
    .gloss = ette kindlaks määratud lävi jäi saavutamata

## Status words (all-caps words kept as written)
-status-prediction = PREDICTION
-status-corroborated = CORROBORATED
-status-not-corroborated = NOT CORROBORATED
-status-refused = REFUSED
-status-degraded = DEGRADED
-status-deficient = DEFICIENT
-status-observed = OBSERVED
-status-lost = LOST
-status-mismatch = MISMATCH
-status-verified = VERIFIED
-status-consistent = CONSISTENT
-status-inconsistent = INCONSISTENT
-status-spoof-detected = SPOOF DETECTED
-status-intact = INTACT, BUT THE SIGNER IS NOT PINNED

## Terms
-term-scenario = stsenaarium
-term-evidence-pack = tõendipakett
-term-ledger = register (ledger)
-term-verification-matrix = kontrollimaatriks
-term-interference = häire
-term-integrity = terviklikkus
-term-trust-score = usaldusskoor
-term-receiver = vastuvõtja
-term-clock = kell
-term-timing = ajastus
-term-orbit-determination = orbiidi määramine
-term-ephemeris = efemeriid
-term-carrier-phase = kandelaine faas
-term-integer-ambiguity = täisarvuline mitmetähenduslikkus
-term-love-number = Love'i arv
-term-libration = libratsioon
-term-reference-frame = tugisüsteem
-term-pre-registration = eelregistreerimine
-term-oracle = oraakel (sõltumatu etalon)
-term-bar = lävi (läbimise kriteerium)
-term-baseline = lähtetase
-term-holdout = holdout (suletud komplekt)
-term-advisory = nõuandev
-term-type-approved = tüübikinnitust omav
-term-machine-translation = masintõlge
-term-native-speaker = emakeelne kõneleja
-term-reviewed = üle vaadatud

## Kept as written (acronyms and field terms; listed so the check knows them)
-kept-gnss = GNSS
-kept-pnt = PNT
-kept-raim = RAIM
-kept-araim = ARAIM
-kept-nmea = NMEA
-kept-cusum = CUSUM
-kept-auc = AUC
-kept-roc = ROC
-kept-lambda = LAMBDA
-kept-dop = DOP

## Commands (always kept)
-cmd-kshana = kshana
-cmd-check = --check
-cmd-study = --study
-cmd-bench = bench
-cmd-receiver-trust = receiver-trust

## Units in running text (symbols such as m, s, ns, dB-Hz never change)
-unit-metre = meeter
-unit-second = sekund
-unit-nanosecond = nanosekund
-unit-decibel-hertz = detsibell-herts

## Product name (never translated)
-brand = Kshana

## The advisory line
-advisory = Nõuandev tarkvara, mitte tüübikinnitust omav seade.
    .maritime = Nõuandev tarkvara, mitte tüübikinnitust omav navigatsiooniseade (IEC 61108, IEC 61162): laeva navigeerimise eest vastutab jätkuvalt operaator.
    .research-test = Nõuandev tarkvara uurimiseks, simulatsiooniks ja katsetamiseks. See ei ole tüübikinnitust omav seade ning ei hinda ega kiida heaks vastuvõtjat, kella ega laboratooriumi.
    .short = Ainult nõuandev: mitte tüübikinnitust omav navigatsiooniseade; vastutab jätkuvalt operaator. Tõendustase: { -tier-modelled }.

## The machine-translation notice
-mt-notice = Masintõlge, mida emakeelne kõneleja pole üle vaadanud. Võrdlusallikaks on ingliskeelne versioon.
