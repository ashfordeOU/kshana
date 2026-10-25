# Ordliste (norsk bokmål). Se den engelske kilden for forklaring.

## Evidence tiers
-tier-validated = VALIDATED
    .gloss = kontrollert mot en uavhengig ekstern referanse
-tier-modelled = MODELLED
    .gloss = beregnet ut fra en modell, uten ekstern referanse
-tier-partner = PARTNER
    .gloss = partnerens del; Kshana leverer den ikke
-tier-exploratory = EXPLORATORY
    .gloss = ikke fastsatt på forhånd som konklusjon

## Verdicts against a pre-registered bar
-verdict-met = MET
    .gloss = terskelen som ble fastsatt på forhånd, ble nådd
-verdict-not-met = NOT MET
    .gloss = terskelen som ble fastsatt på forhånd, ble ikke nådd

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
-term-evidence-pack = bevispakke
-term-ledger = register
-term-verification-matrix = verifikasjonsmatrise
-term-interference = interferens
-term-integrity = integritet
-term-trust-score = tillitsscore
-term-receiver = mottaker
-term-clock = klokke
-term-timing = tidssynkronisering
-term-orbit-determination = banebestemmelse
-term-ephemeris = efemeride
-term-carrier-phase = bærebølgefase
-term-integer-ambiguity = heltallsflertydighet
-term-love-number = Love-tall
-term-libration = librasjon
-term-reference-frame = referansesystem
-term-pre-registration = forhåndsregistrering
-term-oracle = uavhengig referanse
-term-bar = terskel (fastsatt på forhånd)
-term-baseline = grunnlinje
-term-holdout = tilbakeholdt datasett
-term-advisory = veiledende
-term-type-approved = typegodkjent
-term-machine-translation = maskinoversettelse
-term-native-speaker = morsmålsbruker
-term-reviewed = gjennomgått

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
-unit-decibel-hertz = desibel-hertz

## Product name (never translated)
-brand = Kshana

## The advisory line: every Kshana surface carries it. The main value is the general line.
-advisory = Veiledende programvare, ikke typegodkjent utstyr.
    .maritime = Veiledende programvare, ikke typegodkjent navigasjonsutstyr (IEC 61108, IEC 61162): operatøren er fortsatt ansvarlig for fartøyets navigasjon.
    .research-test = Veiledende programvare for forskning, simulering og testing. Den er ikke typegodkjent utstyr og vurderer eller godkjenner verken en mottaker, en klokke eller et laboratorium.
    .short = Kun veiledende: ikke typegodkjent navigasjonsutstyr; operatøren er fortsatt ansvarlig. Evidensnivå: { -tier-modelled }.

## The machine-translation notice (every translated page and the Studio show it)
-mt-notice = Maskinoversettelse, ikke gjennomgått av en morsmålsbruker. Engelsk er referansen.
