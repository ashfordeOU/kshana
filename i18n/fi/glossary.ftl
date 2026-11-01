# Sanasto (suomi). Katso selitykset englanninkielisestä lähteestä.

## Evidence tiers
-tier-validated = VALIDATED
    .gloss = riippumaton ulkoinen vertailu on samaa mieltä
-tier-modelled = MODELLED
    .gloss = laskettu mallista ilman ulkoista vertailua
-tier-partner = PARTNER
    .gloss = kumppanin osuus; Kshana ei tarjoa sitä
-tier-exploratory = EXPLORATORY
    .gloss = ei asetettu ennalta johtopäätökseksi

## Verdicts against a pre-registered bar
-verdict-met = MET
    .gloss = ennalta asetettu kynnys saavutettiin
-verdict-not-met = NOT MET
    .gloss = ennalta asetettu kynnys jäi saavuttamatta

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
-term-scenario = skenaario
-term-evidence-pack = todistepaketti
-term-ledger = kirjanpito (ledger)
-term-verification-matrix = varmennusmatriisi
-term-interference = häiriö
-term-integrity = eheys
-term-trust-score = luottamuspistemäärä
-term-receiver = vastaanotin
-term-clock = kello
-term-timing = ajoitus
-term-orbit-determination = radanmääritys
-term-ephemeris = efemeridi
-term-carrier-phase = kantoaallon vaihe
-term-integer-ambiguity = kokonaislukuepävarmuus
-term-love-number = Love-luku
-term-libration = libraatio
-term-reference-frame = koordinaatisto
-term-pre-registration = ennakkorekisteröinti
-term-oracle = oraakkeli (riippumaton vertailu)
-term-bar = kynnys (ennalta asetettu)
-term-baseline = lähtötaso
-term-holdout = holdout (sinetöity aineisto)
-term-advisory = ohjeellinen
-term-type-approved = tyyppihyväksytty
-term-machine-translation = konekäännös
-term-native-speaker = äidinkielinen puhuja
-term-reviewed = tarkistettu

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
-unit-metre = metri
-unit-second = sekunti
-unit-nanosecond = nanosekunti
-unit-decibel-hertz = desibeli-hertsi

## Product name (never translated)
-brand = Kshana

## The advisory line: every Kshana surface carries it. The main value is the general line.
-advisory = Ohjeellinen ohjelmisto, ei tyyppihyväksytty laite.
    .maritime = Ohjeellinen ohjelmisto, ei tyyppihyväksytty navigointilaite (IEC 61108, IEC 61162): käyttäjä vastaa edelleen aluksen navigoinnista.
    .research-test = Ohjeellinen ohjelmisto tutkimukseen, simulointiin ja testaukseen. Se ei ole tyyppihyväksytty laite eikä se arvioi tai hyväksy vastaanotinta, kelloa tai laboratoriota.
    .short = Vain ohjeellinen: ei tyyppihyväksytty navigointilaite; käyttäjä vastaa edelleen. Todisteiden taso: { -tier-modelled }.

## The machine-translation notice (every translated page and the Studio show it)
-mt-notice = Konekäännös, jota äidinkielinen puhuja ei ole tarkistanut. Viitteenä on englanninkielinen versio.
