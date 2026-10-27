# Ordlista (svenska).

## Evidence tiers
-tier-validated = VALIDATED
    .gloss = kontrollerad mot en oberoende extern referens
-tier-modelled = MODELLED
    .gloss = beräknad utifrån en modell, utan extern referens
-tier-partner = PARTNER
    .gloss = partnerns del; Kshana tillhandahåller den inte
-tier-exploratory = EXPLORATORY
    .gloss = inte fastställd i förväg som slutsats

## Verdicts against a pre-registered bar
-verdict-met = MET
    .gloss = tröskeln som fastställdes i förväg nåddes
-verdict-not-met = NOT MET
    .gloss = tröskeln som fastställdes i förväg nåddes inte

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
-term-scenario = scenario
-term-evidence-pack = bevispaket
-term-ledger = register
-term-verification-matrix = verifieringsmatris
-term-interference = störning
-term-integrity = integritet
-term-trust-score = förtroendepoäng
-term-receiver = mottagare
-term-clock = klocka
-term-timing = tidssynkronisering
-term-orbit-determination = banbestämning
-term-ephemeris = efemerid
-term-carrier-phase = bärvågsfas
-term-integer-ambiguity = heltalsosäkerhet
-term-love-number = Love-tal
-term-libration = libration
-term-reference-frame = referenssystem
-term-pre-registration = förhandsregistrering
-term-oracle = oberoende referens
-term-bar = tröskel (fastställd i förväg)
-term-baseline = baslinje
-term-holdout = undanhållen datamängd
-term-advisory = rådgivande
-term-type-approved = typgodkänd
-term-machine-translation = maskinöversättning
-term-native-speaker = modersmålstalare
-term-reviewed = granskad

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
-unit-metre = meter
-unit-second = sekund
-unit-nanosecond = nanosekund
-unit-decibel-hertz = decibel-hertz

## Product name (never translated)
-brand = Kshana

## The advisory line: every Kshana surface carries it. The main value is the general line.
-advisory = Rådgivande programvara, inte typgodkänd utrustning.
    .maritime = Rådgivande programvara, inte typgodkänd navigationsutrustning (IEC 61108, IEC 61162): operatören är fortsatt ansvarig för fartygets navigering.
    .research-test = Rådgivande programvara för forskning, simulering och test. Den är inte typgodkänd utrustning och betygsätter eller godkänner varken en mottagare, en klocka eller ett laboratorium.
    .short = Endast rådgivande: inte typgodkänd navigationsutrustning; operatören är fortsatt ansvarig. Evidensnivå: { -tier-modelled }.

## The machine-translation notice (every translated page and the Studio show it)
-mt-notice = Maskinöversättning, inte granskad av en modersmålstalare. Engelska är referensen.
