# site-js.ftl (nb): translations

js-app-engine-failed = Motoren kunne ikke lastes ({ $reason }).

js-ledger-rows =
    { $n ->
        [one] { $n } registerrad
       *[other] { $n } registerrader
    }

js-site-action-copy-install = Kopier: cargo install kshana

js-site-action-launch = Start { $name }

js-site-action-licence = Snakk med oss om en kommersiell lisens

js-site-action-pro-eval = Be om en evaluering av Kshana Pro

js-site-action-study = Be om en studie

js-site-action-theme = Bytt mellom lyst og mørkt tema

js-site-capabilities-bd-after = { $m } m etter { $s } s

js-site-capabilities-bd-combined = samlet

js-site-capabilities-bd-crossing = { $m } m ved { $s } s

js-site-capabilities-bd-fig-crossing = «{ $m } m» etter { $s } s, dominert av { $dom }

js-site-capabilities-bd-fig-lead = Tid siden GNSS ble tapt, på logaritmisk akse, for en IMU av klasse { $grade } ved { $speed } m/s:

js-site-capabilities-bd-fig-tail = Linjene er motorens vekstlover for korte glidefaser og kvadratroten av summen av kvadratene; skjæringspunktene kommer fra motorens fullstendige feilmodell med ni tilstander (Schuler), som begrenser biastermene, slik at hvert skjæringspunkt på lange glidefaser kommer litt senere enn linjen når det. Stolpene: de samme skjæringspunktene for fire IMU-klasser.

js-site-capabilities-cd-canvas-aria = Konstellasjonen rundt sitt himmellegeme, ekte bilder: dra eller bruk piltastene for å snu, pluss og minus for å zoome

js-site-capabilities-cd-design-meta = { $n } satellitter · { $body } · { $file }

js-site-capabilities-cd-foot-frozen = Hver satellitt følger motorens egen bane; radiusen i den frosne banen kommer fra skallets elementer.

js-site-capabilities-cd-foot-mean-motion = Hver satellitt følger motorens egen bane, med den radiusen som middelbevegelsen tilsier.

js-site-capabilities-cd-foot-walker = Alle { $n } satellittene er plassert ut fra skallenes egne Walker-parametere (kontrollert mot motorens { $shown } baner: verst { $deg }°); sporene er motorens { $shown } baner.

js-site-capabilities-cd-hud-body = { $body } · «{ $n }» satellitter

js-site-capabilities-cd-hud-mission = Oppdrag «{ $time }»

js-site-capabilities-cd-legend-shell = skall { $n } · { $inc }°

js-site-capabilities-cd-map-availability = Andel av kjøringen med PDOP ≤ { $limit } (0 til 100 %)

js-site-capabilities-cd-map-pdop = Gjennomsnittlig PDOP per { $step }°-celle ({ $lo } til { $hi }; lysere er bedre)

js-site-capabilities-cd-map-visible = Gjennomsnittlig antall satellitter i sikte ({ $lo } til { $hi })

js-site-capabilities-cd-metric-availability = Tilgjengelighet

js-site-capabilities-cd-metric-pdop = Gjennomsnittlig PDOP

js-site-capabilities-cd-metric-visible = I sikte

js-site-capabilities-cd-no-webgl = 3D-visningen krever WebGL; dekningskartet og figurene er den samme kjøringen.

js-site-capabilities-cd-pause = Sett banene på pause

js-site-capabilities-cd-play = Spill av banene

js-site-capabilities-cd-shell = { $name }: Walker { $pattern } { $total }/{ $planes }/{ $phasing } · { $alt } km · { $inc }°

js-site-capabilities-cd-slots = { $name }: { $n } satellitter, operatørens sporttabell

js-site-capabilities-cd-span = av { $dur }, i løkke

js-site-capabilities-cd-stat-in-view = Gjennomsnitt i sikte

js-site-capabilities-cd-stat-mask = Maske · kjøring

js-site-capabilities-cd-stat-median = Median PDOP

js-site-capabilities-cd-stat-pdop = PDOP ≤ { $limit }, hele { $body }

js-site-capabilities-cd-stat-satellites = Satellitter

js-site-capabilities-cd-stat-worst = Dårligste sted

js-site-capabilities-cd-title-gnss = Fire GNSS sammen

js-site-capabilities-cd-title-leo = Megakonstellasjon i lav jordbane

js-site-capabilities-cd-title-lunar = Relésett for Månen

js-site-capabilities-cd-work-ratio = { $pct } % etter breddegradsforfilteret · { $dop } DOP-løsninger

js-site-capabilities-cd-work-tests = { $after } satellitt-punkt-tester av de { $brute } en brute force-skanning ville gjort

js-site-capabilities-cd-work-title = Synlighetsarbeid

js-site-capabilities-cg-cn0-sub = C/N0 mot sporingsgulvet

js-site-capabilities-cg-cn0-title = Bærebølge-til-støy-tetthet

js-site-capabilities-cg-compose-availability = Tilgjengelighet

js-site-capabilities-cg-compose-fewest = Færrest sporet

js-site-capabilities-cg-compose-js = Gjennomsnittlig J/S

js-site-capabilities-cg-compose-text = Én jammer, { $power } { $unit }, på ett sted, bundet inn i { $n } medlemskjøringer av typen ‹{ $kind }›: et skip i et sund og en bil på en kystvei ser den samme årsaken og får ulike svar.

js-site-capabilities-cg-log-campaign = kampanje { $file } · { $phases } faser · { $runs } medlemskjøringer

js-site-capabilities-cg-log-phase = fase { $name } starter

js-site-capabilities-cg-log-phase-carries = fase { $name } starter · viderefører { $carried }

js-site-capabilities-cg-monte-axis = endelig klokkefeil over { $n } seed ({ $path })

js-site-capabilities-cg-monte-ci = Gjennomsnitt, 95 %-intervall

js-site-capabilities-cg-monte-mean = Gjennomsnitt

js-site-capabilities-cg-monte-p05 = 5.

js-site-capabilities-cg-monte-p05-p95 = 5. til 95.

js-site-capabilities-cg-monte-p50 = median

js-site-capabilities-cg-monte-p95 = 95.

js-site-capabilities-cg-monte-std = Standardavvik

js-site-capabilities-cg-monte-text = Det samme scenarioet ‹{ $kind }› kjørt { $n } ganger fra basis-seed { $seed }, ett seed hver: spredningen i sluttfeilen til den frittløpende klokken, med 95 % konfidensintervall for gjennomsnittet.

js-site-capabilities-cg-not-in-phase = ikke i denne fasen

js-site-capabilities-cg-now = Fase { $n } av { $total }: { $name } · { $from } til { $to }

js-site-capabilities-cg-phase-title = { $name }: { $from } til { $to } · avsluttet av { $by } · medlemstyper { $kinds }

js-site-capabilities-cg-pl-sub = mot varslingsgrensen

js-site-capabilities-cg-pl-title = Beskyttelsesnivå

js-site-capabilities-cg-pos-sub = mot budsjettet · logaritmisk

js-site-capabilities-cg-pos-title = Treghetsbasert posisjonsfeil

js-site-capabilities-cg-range = { $lo } til { $hi }

js-site-capabilities-cg-sweep-all-lost = Alle tapt fra

js-site-capabilities-cg-sweep-axis = jammerens sendeeffekt ({ $key })

js-site-capabilities-cg-sweep-first-loss = Første tap

js-site-capabilities-cg-sweep-lg-availability = tilgjengelighet

js-site-capabilities-cg-sweep-lg-js = gjennomsnittlig J/S

js-site-capabilities-cg-sweep-never = aldri

js-site-capabilities-cg-sweep-nodes = Noder

js-site-capabilities-cg-sweep-none = ingen

js-site-capabilities-cg-sweep-span = J/S-spenn

js-site-capabilities-cg-sweep-text = Ett scenario ‹{ $kind }›, kjørt én gang per node mens jammerens sendeeffekt trinnes fra { $from } til { $to } { $unit }. Tilgjengelighet under jamming (hel linje) og gjennomsnittlig J/S (stiplet) kommer fra hver medlemskjørings egne kvalitetsmål.

js-site-capabilities-cg-te-sub = mot vernegrensen

js-site-capabilities-cg-te-title = Klokkens tidsfeil

js-site-capabilities-copy = Kopier

js-site-capabilities-copy-aria = Kopier kommandoen som gjengir kjøringen: kshana { $file }

js-site-capabilities-cz-best = Beste PDOP

js-site-capabilities-cz-failed = Den registrerte kjøringen kunne ikke lastes her; åpne den i Studio i stedet.

js-site-capabilities-cz-fix = Sampler med posisjonsbestemmelse

js-site-capabilities-cz-fix-value = { $n } av { $total } ({ $pct }%)

js-site-capabilities-cz-median = Median PDOP

js-site-capabilities-engine = Motor v{ $version }

js-site-capabilities-engine-build = Motor v{ $version }, build

js-site-capabilities-engine-report = Motorrapport

js-site-capabilities-globe-aria = { $name } på sine ekte bilder ({ $credit }). Dra eller bruk piltastene for å snu den; pluss og minus zoomer.

js-site-capabilities-ho-ends = kjøringen slutter ved { $t }

js-site-capabilities-ho-past-guard = forbi vernegrensen

js-site-capabilities-no-seed = deterministisk, uten seed

js-site-capabilities-open-in-studio = Åpne i { $studio }

js-site-capabilities-open-report = Åpne motorens rapport

js-site-capabilities-orrery-aria = Solsystemet ved kjøringens epoke: dra eller bruk piltastene for å snu, pluss og minus for å zoome

js-site-capabilities-orrery-bodies = { $n } himmellegemer · observatør «{ $observer }»

js-site-capabilities-orrery-epoch = Epoke «{ $epoch }» · TDB (barysentrisk dynamisk tid), juliansk dato { $jd }

js-site-capabilities-pnt-chart-title = reléer i sikte (linje) · Jorden over horisonten (skravert) · fire kreves for en posisjonsbestemmelse

js-site-capabilities-pnt-kicker = Posisjonering ved dette himmellegemet · typen body-pnt

js-site-capabilities-pnt-lander = En lander ved { $lat }°, { $lon }° på overflaten navigerer på reléene, med en toveis avstandsmåling fra Jorden når Jorden er over horisonten (enveis lystid { $min } min). Tilgjengelighet: { $a } % med reléene alene, { $b } % med lenken til Jorden.

js-site-capabilities-pnt-orbiter = En bruker i bane navigerer på reléene, med en toveis avstandsmåling fra Jorden når Jorden er over horisonten (enveis lystid { $min } min). Tilgjengelighet: { $a } % med reléene alene, { $b } % med lenken til Jorden.

js-site-capabilities-pnt-relays = { $n } reléer på { $alt } km rundt { $body }

js-site-capabilities-report-data = Rapport og data

js-site-capabilities-result-data = Resultatdata

js-site-capabilities-saved = Lagret { $name }

js-site-capabilities-scenario-file = Scenariofil

js-site-capabilities-seed = seed { $seed }

js-site-capabilities-six-clock-fig = «{ $id }» holder vernegrensen i { $dur }

js-site-capabilities-six-clock-guard = { $v } ns vernegrense

js-site-capabilities-six-coast-budget = { $m } m budsjett

js-site-capabilities-six-coast-denied = GNSS nektet

js-site-capabilities-six-coast-fig = «{ $id }» innenfor budsjettet i { $s } s

js-site-capabilities-six-floor = sporingsgulv

js-site-capabilities-six-integ-fig = «{ $ok }» av { $n } epoker tilgjengelig · varslingsgrenser { $h } m horisontalt, { $v } m vertikalt

js-site-capabilities-six-integ-limit = vertikal varslingsgrense

js-site-capabilities-six-integ-pl = vertikalt (hel linje) og horisontalt (stiplet) beskyttelsesnivå

js-site-capabilities-six-jam-effective = effektive, { $n } satellitter

js-site-capabilities-six-jam-fig = Sporet «{ $min }» av { $max } i sikte · tilgjengelighet under jamming «{ $av }» (nominelt { $nom }) · gjennomsnittlig J/S «{ $js } dB»

js-site-capabilities-six-jam-nominal = nominelt, ingen jammer (stiplet)

js-site-capabilities-six-orbit-fig = Høyde «{ $lo }–{ $hi } km» · bakkespor over { $dur }

js-site-capabilities-six-orbit-label = { $source } · { $n } sampler

js-site-capabilities-six-orbit-sgp4 = SGP4 fra et tolinjers elementsett

js-site-capabilities-six-spoof-detects = { $id } oppdager

js-site-capabilities-six-spoof-fig = «{ $id }» oppdager ved { $s } s (grense { $ns } ns)

js-site-capabilities-ss-angle = Vinkel fra Solen

js-site-capabilities-ss-credit = Bilder: { $credits }. * Kartet stopper før polene; gapet får kartets gjennomsnittlige polarfarge. Saturns ringer: { $ring } ({ $licence }).

js-site-capabilities-ss-days = { $v } døgn

js-site-capabilities-ss-frame-origin = Rammens origo

js-site-capabilities-ss-from-sun = Fra Solen

js-site-capabilities-ss-gloss = NAIF: kroppskoden til NASAs Navigation and Ancillary Information Facility. GM: gravitasjonsparameter. J2: avplatingsledd. IAU-pol: rotasjonspolen til Den internasjonale astronomiske union, som rektascensjon (RA) og deklinasjon (Dec).

js-site-capabilities-ss-j2-none = ingen publisert

js-site-capabilities-ss-kind = { $class } · NAIF { $naif }

js-site-capabilities-ss-kind-of = { $class } til { $parent } · NAIF { $naif }

js-site-capabilities-ss-light-time = Lystid fra { $observer }

js-site-capabilities-ss-link = { $from } til { $to }, enveis lystid { $one }, tur-retur { $two }

js-site-capabilities-ss-links-lead =
    { $n ->
        [one] Lenken denne kjøringen beregner:
       *[other] Lenkene denne kjøringen beregner:
    }

js-site-capabilities-ss-moons =
    { $n ->
        [one] Dens måne, i målestokk, ved epoken
       *[other] Dens måner, i målestokk, ved epoken
    }

js-site-capabilities-ss-nominal-error = nominell feil { $km } km i avstand

js-site-capabilities-ss-north = Sett fra nord for ekliptikken.

js-site-capabilities-ss-period = Omløpstid

js-site-capabilities-ss-period-about = Omløpstid rundt { $parent }

js-site-capabilities-ss-pole = IAU-pol (RA, Dec)

js-site-capabilities-ss-radius = Middelradius

js-site-capabilities-ss-retrograde = { $v } t, retrograd

js-site-capabilities-ss-rotation = Siderisk rotasjon

js-site-capabilities-ss-years = { $v } år

js-site-capabilities-st-bound = { $v } m grense

js-site-capabilities-st-fig-none = { $n } epoker, ingen med feilen over grensen. På tvers: den sanne posisjonsfeilen; oppover: beskyttelsesnivået; begge på logaritmiske akser.

js-site-capabilities-st-fig-some = { $n } epoker, { $k } med feilen over grensen. På tvers: den sanne posisjonsfeilen; oppover: beskyttelsesnivået; begge på logaritmiske akser.

js-site-capabilities-st-limit = varslingsgrense { $m } m

js-site-capabilities-st-misleading = villedende: feilen er over grensen

js-site-capabilities-st-normal = normal drift

js-site-capabilities-st-unavailable = utilgjengelig: grensen er over varslingsgrensen

js-site-capabilities-studio-embedded = { $studio }, innebygd: kjøringen orbit-multignss

js-site-capabilities-studio-load = Last { $studio } her

js-site-capabilities-studio-outline = Vis oversikten igjen

js-site-capabilities-wave-chirp = chirp

js-site-capabilities-wave-cw = CW-tone

js-site-capabilities-wave-noise = støy

js-site-capabilities-wf-an-caption = rad T+{ $t } s · dB over gulvet, logaritmisk skala · toppverdi for hele rutenettet { $peak } dB

js-site-capabilities-wf-degraded = Degradert

js-site-capabilities-wf-degraded-low = degradert

js-site-capabilities-wf-failed = Den registrerte kjøringen kunne ikke lastes her.

js-site-capabilities-wf-grid = rutenett

js-site-capabilities-wf-iq = Ved T+{ $t } s tegner motoren også modellen som { $n } IQ-sampler (fase og kvadratur) rundt { $mhz } MHz og kontrollerer et Welch-estimat ({ $segments } segmenter på { $nfft }) mot den: integrert effektforhold { $ratio }.

js-site-capabilities-wf-jammer-off = { $what } av

js-site-capabilities-wf-jammer-on = { $what } på

js-site-capabilities-wf-jammer-open = { $name } · { $mhz } MHz · fra { $on } s til slutten

js-site-capabilities-wf-jammer-span = { $name } · { $mhz } MHz · { $on }–{ $off } s

js-site-capabilities-wf-lost = Mistet lås

js-site-capabilities-wf-lost-low = mistet lås

js-site-capabilities-wf-max = { $peak } dB over den · logaritmisk skala fra { $v0 } dB

js-site-capabilities-wf-no-jammer = ingen jammer

js-site-capabilities-wf-now = nå

js-site-capabilities-wf-pause = Sett vannfallet på pause

js-site-capabilities-wf-peak = topp { $v } dB

js-site-capabilities-wf-play = Spill av vannfallet

js-site-capabilities-wf-replay-previous = start på avspillingen · forrige gjennomgang under

js-site-capabilities-wf-replay-start = start på avspillingen

js-site-capabilities-wf-say = T+{ $t } s, { $band } { $v } dB-Hz, { $state }

js-site-capabilities-wf-signal = signal +{ $v } dB

js-site-capabilities-wf-summary = Registrert kjøring av { $file }: { $bands } bånd, { $jammers } jammere over { $seconds } sekunder. Det dårligste båndet, { $worst }, faller til { $min } dB-Hz ved { $at } s; sporingsgulv { $floor } dB-Hz.

js-site-capabilities-wf-tip-above = { $v } dB over støygulvet

js-site-capabilities-wf-tip-in = i { $bands }

js-site-capabilities-wf-tracking = Sporing

js-site-capabilities-wf-tracking-low = sporing

js-site-caphero-aria = Solsystemet fra motorens solsystemkjøring ved { $date }: Solen og { $bodies } himmellegemer som beveger seg langs sine banespor i motoren; { $valid } av banene er validert mot JPL Horizons.

js-site-caphero-clock = +{ $days } døgn · { $date }

js-site-caphero-copy-command = Kopier kommando

js-site-caphero-copy-title = Kopier kommandoen som gjengir den

js-site-caphero-credits = Avstander komprimert på logaritmisk skala, retninger riktige; himmellegemer forstørret, spinn i visningshastighet. Bilder: { $credits }; Saturns ringer: { $ring } ({ $licence }).

js-site-caphero-credits-summary = Målestokk og bildekreditering

js-site-caphero-engine-build = Motor v{ $version }, build

js-site-caphero-explore = Utforsk hvert himmellegeme

js-site-caphero-file-title = Scenariofilen som ble kjørt

js-site-caphero-list-item = { $name }: { $label }, { $au } au fra Solen ved epoken, omløpstid { $period }.

js-site-caphero-list-item-light = { $name }: { $label }, { $au } au fra Solen ved epoken, omløpstid { $period }, lystid fra { $observer } { $light }.

js-site-caphero-no-seed = deterministisk, uten seed

js-site-caphero-open-in-studio = Åpne i { $studio }

js-site-caphero-pause = Sett banene på pause

js-site-caphero-period-days = { $value } døgn

js-site-caphero-period-years = { $value } år

js-site-caphero-play = Spill av banene

js-site-caphero-rate = { $days } døgn av kjøringen per sekund

js-site-caphero-rate-epoch = Rammen ved kjøringens epoke

js-site-caphero-read-distance = { $au } au fra Solen

js-site-caphero-read-light = lystid fra { $observer } ved epoken { $light }

js-site-caphero-read-orbit = bane { $period }

js-site-caphero-seed = seed { $seed }

js-site-copy-aria = Kopier: { $cmd }

js-site-developers-captured-from = registrert { $recorded } fra

js-site-developers-engine-build = Motor v{ $version }, build

js-site-developers-exit-stamp = avslutning { $rc } · { $ms } ms

js-site-developers-file-open-in-studio = { $file }: åpne i { $studio }

js-site-developers-no-seed = (deterministisk, uten seed)

js-site-developers-open-in-studio = Åpne i { $studio }

js-site-developers-pause = Sett avspillingen på pause

js-site-developers-play = Spill av avspillingen

js-site-developers-replaying = # spiller av den registrerte økten

js-site-developers-seed = (seed { $seed })

js-site-developers-what-runs-write = Hva hver kjøring skriver

js-site-editions-builds-on-it = { $label } bygger på den

js-site-editions-core-kinds =
    { $n ->
        [one] { $n } type
       *[other] { $n } typer
    }

js-site-editions-core-title = Åpen kjerne

js-site-editions-core-validated = validert

js-site-editions-core-validated-of = { $validated } av { $total }

js-site-editions-free-core = Gratis i den åpne kjernen, som alle typer

js-site-editions-group-other = Andre

js-site-editions-kind-no-ledger = ingen registermodul samsvarer med den etter navn

js-site-editions-kind-validated = { $v } av { $tot } registerrader validert

js-site-editions-pause = Sett ringene på pause

js-site-editions-play = Spill av ringene

js-site-editions-ring-pro = Kshana Pro

js-site-editions-ring-study = Tilpasset studie

js-site-evidence-allan-aria = Fire avvik i NIST SP 1065-datasettet med 1000 punkter mot midlingstid; alle { $n } publiserte verdier gjengitt, verste relative feil { $err }

js-site-evidence-allan-lg-published = publisert verdi, SP 1065 tabell 31

js-site-evidence-allan-mdev = modifisert Allan-avvik

js-site-evidence-allan-na = ikke relevant

js-site-evidence-allan-oadev = overlappende Allan-avvik

js-site-evidence-allan-ohdev = overlappende Hadamard-avvik

js-site-evidence-allan-read = { $tau } s · Allan { $oadev } · modifisert { $mdev } · Hadamard { $ohdev }

js-site-evidence-allan-st-gate = testens port

js-site-evidence-allan-st-reproduced = publiserte verdier gjengitt

js-site-evidence-allan-st-worst = verste relative feil

js-site-evidence-allan-tdev = tidsavvik, i sekunder

js-site-evidence-allan-tip-at = «{ $name }» ved { $m } s

js-site-evidence-allan-tip-engine = motor: «{ $got }» · relativ feil { $err }

js-site-evidence-allan-tip-table = SP 1065 tabell 31: «{ $want }»

js-site-evidence-cell-tip = Funksjon { $i } av { $n } · «{ $label }»

js-site-evidence-cowell-aria = Posisjonsforskjell mot Orekit over 24 timer: kraftnivåene 1 til 5 holder seg under { $worst }; luftmotstandsnivået når { $drag }, et karakteriseringsbånd

js-site-evidence-cowell-gto = geostasjonær transferbane

js-site-evidence-cowell-leo = lav jordbane

js-site-evidence-cowell-lg-con = nivå 1 til 5, tolegemeproblem opp til solstrålingstrykk, to baner hver

js-site-evidence-cowell-lg-drag = nivå 6, luftmotstand: kun karakterisering (ulike tetthetsmodeller)

js-site-evidence-cowell-read = { $h } t · nivå 1 til 5 verst { $con } · luftmotstand { $drag }

js-site-evidence-cowell-st-drag = luftmotstandsnivå, verst

js-site-evidence-cowell-st-epochs = epoker i nivå 1 til 5

js-site-evidence-cowell-tip-tier = «Nivå { $tier }: { $label }» · { $regime }

js-site-evidence-cowell-tip-worst = verste forskjell «{ $err }» ved { $h } t

js-site-evidence-hero-live = { $label }. { $cap }. { $oracle }

js-site-evidence-hero-no-oracle = Ingen ekstern uavhengig referanse oppgitt.

js-site-evidence-hero-oracle = Uavhengig referanse

js-site-evidence-hero-oracle-is = Uavhengig referanse: { $o }

js-site-evidence-hero-owner = Eier

js-site-evidence-hero-partner = En partner eier dette; motoren gjør ikke krav på noe av det.

js-site-evidence-hero-pause = Sett svepet på pause

js-site-evidence-hero-play = Spill av svepet

js-site-evidence-hero-row = Rad { $i } av { $n }

js-site-evidence-hold-accepted = akseptert: innenfor en faktor på { $bar }

js-site-evidence-hold-aria = Målt kvadratisk middelverdi av tidsfeilen til cesiumklokken mot glidetid, med motorens prediksjon; predikert over målt bryter grensen fra { $lo } til { $hi }

js-site-evidence-hold-control = «Kontroll:» den naive prediksjonen (stabiliteten over ett sekund lest som hvit frekvensstøy) gir et forhold på { $ratio }, feil med en faktor på omtrent { $factor }, og består ikke den samme terskelen. Terskelen har tenner.

js-site-evidence-hold-lg-meas = målt på den tilbakeholdte registreringen (prikk: brudd)

js-site-evidence-hold-lg-pred = predikert fra første tredjedel (ring: brudd)

js-site-evidence-hold-nodata = Den målte registreringen var ikke tilgjengelig da denne siden ble generert.

js-site-evidence-hold-perfect = 1 = perfekt

js-site-evidence-hold-ratio-aria = Predikert over målt for { $n } grenser, alle innenfor den aksepterte faktoren på { $bar }

js-site-evidence-hold-read = glidefase { $h } t · målt { $m } ns · predikert { $p } ns

js-site-evidence-hold-st-fit = brukt til tilpasningen

js-site-evidence-hold-st-samples = sampler på ett sekund

js-site-evidence-hold-st-syncs = tilbakeholdte synkroniseringspunkter

js-site-evidence-hold-tip-breach = predikert brudd { $p } s · målt { $m } s

js-site-evidence-hold-tip-error = «Tidsfeil { $thr } ns»

js-site-evidence-hold-tip-ratio = predikert over målt «{ $ratio }»

js-site-evidence-hold-tip-row = «{ $thr } ns» · predikert over målt «{ $ratio }»

js-site-evidence-kernel-chi2-cdf = kjikvadratfordeling

js-site-evidence-kernel-chi2-quantile = kjikvadratkvantil

js-site-evidence-kernel-noncentral = ikke-sentral kjikvadrat

js-site-evidence-kernel-normal-cdf = normalfordeling

js-site-evidence-kernel-normal-quantile = normalkvantil

js-site-evidence-kernel-pbias = deteksjonsbias

js-site-evidence-ladder-aria = Banerester fra { $lo } til { $hi } m på én logaritmisk skala, med byråterskelen på { $bar } m

js-site-evidence-ladder-bar = byråterskel { $bar } m

js-site-evidence-ladder-cowell = Cowell mot Orekit 12.2, verst

js-site-evidence-ladder-g24 = Galileo E11, tilpasning over 24 timer

js-site-evidence-ladder-g8 = Galileo E11, tilpasning over 8 timer

js-site-evidence-ladder-lg-headline = hovedrest

js-site-evidence-ladder-lg-over = over byråterskelen på { $bar } m

js-site-evidence-ladder-lg-ring = kun kraftmodellen, før empiriske akselerasjoner

js-site-evidence-ladder-lro = Lunar Reconnaissance Orbiter, tilpasning over 4 timer

js-site-evidence-ladder-read = sveip ved { $v } · { $n } av { $total } hovedrester ved eller under den

js-site-evidence-ladder-rt-arc = { $arc }-bue · grad og orden { $do } · { $n } observasjoner

js-site-evidence-ladder-rt-rtn = radielt { $r } m · langs banen { $a } m · på tvers av banen { $c } m

js-site-evidence-ladder-sgp4 = SGP4 mot AIAA-vektorene, verst

js-site-evidence-ladder-swarm = Swarm-A, tilpasning over 3 timer

js-site-evidence-ladder-tip-cowell = «Cowell · verst av { $n } epoker» · { $worst }

js-site-evidence-ladder-tip-g24 = «Galileo E11 · et helt døgn» · { $rms } m

js-site-evidence-ladder-tip-g8a = «Galileo E11 · kun kraftmodell» · { $rms } m

js-site-evidence-ladder-tip-g8b = «Galileo E11 · med empiriske akselerasjoner» · { $rms } m

js-site-evidence-ladder-tip-lrd = «Månesonde · dynamisk» · { $rms } m

js-site-evidence-ladder-tip-lrr = «Månesonde · redusert dynamisk» · { $rms } m, over terskelen på { $bar } m og rapportert som den er

js-site-evidence-ladder-tip-sgp4 = «SGP4 · verst av { $n } vektorer» · { $worst }

js-site-evidence-ladder-tip-swd = «Swarm-A · dynamisk» · { $rms } m, nesten alt langs banen (luftmotstand)

js-site-evidence-ladder-tip-swr = «Swarm-A · redusert dynamisk» · { $rms } m

js-site-evidence-raim-aria = { $pass } av { $n } SciPy-tilfeller innenfor toleransebåndet sitt, over { $kernels } kjerner

js-site-evidence-raim-lane = { $kernel } · { $n }

js-site-evidence-raim-lg-most = mest av et bånd som noe tilfelle bruker

js-site-evidence-raim-read = tilfelle { $q } av { $n } · { $kernel } · { $what }

js-site-evidence-raim-read-band = { $pct } % av båndet

js-site-evidence-raim-scale-aria = Fargeskala: andel av toleransebåndet som er brukt, logaritmisk fra 10 opphøyd i minus 11 til båndets kant

js-site-evidence-raim-st-inside = innenfor båndet

js-site-evidence-raim-st-most = mest av et bånd brukt

js-site-evidence-raim-tick-edge = båndkant

js-site-evidence-raim-tick-exact = nøyaktig

js-site-evidence-raim-tip-case = «{ $kernel }» · tilfelle { $j } av { $n }

js-site-evidence-raim-tip-exact = «eksakt samsvar» med SciPy

js-site-evidence-raim-tip-uses = bruker «{ $pct } %» av toleransebåndet sitt

js-site-evidence-sgp4-aria = { $n } av { $n } AIAA-vektorer gjengitt; verst { $worst }, median { $median }, alle innenfor toleransen på { $tol }

js-site-evidence-sgp4-deep = dypt rom (SDP4)

js-site-evidence-sgp4-lg-deep = vektor for dypt rom (SDP4)

js-site-evidence-sgp4-lg-median = median og verst på skalaen

js-site-evidence-sgp4-lg-near = vektor nær Jorden (SGP4)

js-site-evidence-sgp4-near = nær Jorden (SGP4)

js-site-evidence-sgp4-read = vektor { $i } av { $n } · satellitt { $sat } · feil { $err }

js-site-evidence-sgp4-read-deep = vektor { $i } av { $n } · satellitt { $sat }, dypt rom · feil { $err }

js-site-evidence-sgp4-scale-aria = Fargeskala fra 0,1 mikrometer til toleransen, logaritmisk

js-site-evidence-sgp4-st-deep = vektorer for dypt rom

js-site-evidence-sgp4-st-sats = testsatellitter

js-site-evidence-sgp4-tip-sat = «Satellitt { $sat }» · { $kind }

js-site-evidence-sgp4-tip-vector = vektor { $j } av { $n } · posisjonsfeil «{ $err }»

js-site-evidence-st-median = median

js-site-evidence-st-worst = verst

js-site-evidence-tolerance = toleranse { $v }

js-site-filter-in-all = { $total } totalt

js-site-filter-matches =
    { $n ->
        [one] { $n } treff
       *[other] { $n } treff
    }

js-site-filter-n-of-m = { $n } av { $total }

js-site-filter-n-of-m-rows = { $n } av { $total } rader

js-site-filter-rows = { $total } rader

js-site-home-banner-gnss-lost = GNSS tapt · holdover

js-site-home-banner-holdover-out = Holdover · klokken utenfor vernegrensen

js-site-home-banner-integrity-holdover = Integritetsalarm · holdover fortsetter

js-site-home-banner-integrity-none = Integritetsalarm · ingen beskyttelsesnivå

js-site-home-banner-integrity-pl = Integritetsalarm · PL > AL

js-site-home-banner-jamming = Jamming · C/N0 nær gulvet

js-site-home-banner-spoofing = Spoofing-alarm · RF-detektor

js-site-home-cap-holdover = Jammeren går til { $dbw } dBW: { $trk } satellitter spores. Klokken går fritt fra de { $carry } ns spooferen etterlot og krysser vernegrensen på { $guard } ns ved { $at }; INS-en glir videre.

js-site-home-cap-integrity = Satellittene kommer tilbake, men bare over en maske på { $mask }°: { $trk } spores. Beskyttelsesnivået overstiger varslingsgrensen på { $al } m eller kan ikke dannes, så monitoren gir alarm og klokken blir i holdover.

js-site-home-cap-jamming = En bredbåndsjammer { $km } km unna på { $dbw } dBW. C/N0 faller til { $cn } dB-Hz, { $above } dB over sporingsgulvet på { $floor } dB-Hz; alle { $trk } satellittene spores fortsatt.

js-site-home-cap-nominal = { $trk } satellitter sporet ved en gjennomsnittlig C/N0 på { $cn } dB-Hz. Klokken er disiplinert mot GNSS-tid, og beskyttelsesnivået ({ $pl } m) ligger under varslingsgrensen på { $al } m.

js-site-home-cap-recovery = GNSS resynkronisert: { $trk } satellitter spores, tidsfeilen tilbake til { $te } ns, beskyttelsesnivå { $pl } m.

js-site-home-cap-spoofing = En spoofer skyver mottakerklokken med { $rate } ns/s. RF-detektoren (radiofrekvens) gir alarm med en gang; den klokkestøttede monitoren utløses etter { $det } s og avslutter fasen med { $off } ns trukket inn.

js-site-home-cn-no-lock = 0 av { $max } spores · ingen lås

js-site-home-cn-tracking = { $n } av { $max } spores

js-site-home-no-pl = ingen PL

js-site-home-pause = Sett oppdraget på pause

js-site-home-pl-alarm = alarm · PL over AL

js-site-home-pl-no-sats = ingen satellitter, ingen PL

js-site-home-pl-not-computed = ikke beregnet i denne fasen

js-site-home-pl-too-few = for få satellitter

js-site-home-pl-under-al = under AL på { $thr } m

js-site-home-play = Spill av oppdraget

js-site-home-receiver-tracking = Mottaker · { $n } spores

js-site-home-replay-restarted = Avspillingen startet på nytt · { $file }

js-site-home-te-disciplined = disiplinert mot GNSS

js-site-home-te-free-running = holdover · går fritt

js-site-home-te-outside-guard = holdover · utenfor vernegrensen

js-site-home-te-spoofer = spoofer drar i klokken

js-site-home-thr-floor = gulv

js-site-home-thr-guard = vernegrense

js-site-kind-action = Handling

js-site-mcp-arguments-excerpt = argumenter (utdrag)

js-site-mcp-axis-mission-time = oppdragstid

js-site-mcp-clock-holdover = holdover for { $clock }

js-site-mcp-dir-reply = kshana-mcp → assistent

js-site-mcp-dir-request = assistent → kshana-mcp

js-site-mcp-figcaption = Tegnet fra den returnerte serien: hver klokkes tidsfeil mot terskelen

js-site-mcp-fom-availability = tilgjengelighet

js-site-mcp-fom-caption = Kvalitetsmål returnert av run_scenario, per klokke

js-site-mcp-fom-header = Kvalitetsmål

js-site-mcp-fom-holdover = holdover (s)

js-site-mcp-fom-p95 = tidsfeil, 95. persentil (ns)

js-site-mcp-fom-rms = tidsfeil, kvadratisk middelverdi (ns)

js-site-mcp-lede = Registrert { $recorded } · v{ $version } · standard inn- og utdata · protokoll { $protocol } · kun eksakte meldinger

js-site-mcp-legend-gnss-lost = GNSS tapt ved { $s } s

js-site-mcp-legend-threshold = terskel { $v } ns

js-site-mcp-pause = Pause

js-site-mcp-play = Spill av

js-site-mcp-plot-aria = Tidsfeil for { $quantum } og { $classical } returnert av run_scenario, mot terskelen på { $threshold } ns; GNSS (globalt navigasjonssatellittsystem) tapt ved { $lost } s

js-site-mcp-recorded-json = Registrert JSON: { $label }

js-site-mcp-scenario-hash = scenariohash

js-site-mcp-server-identity = serveridentitet

js-site-mcp-show-json = Vis JSON

js-site-mcp-step-aria = Steg { $n } av { $total }: { $name }

js-site-mcp-step-result = resultat: kvalitetsmål

js-site-mcp-step-status = Steg { $n } av { $total } · { $name }

js-site-mcp-summary-excerpt = sammendragslinje og resultat (utdrag)

js-site-mcp-tab-result = resultat

js-site-mcp-threshold = terskel

js-site-mcp-toml-lines =
    { $n ->
        [one] { $n } linje
       *[other] { $n } linjer
    }

js-site-mcp-toml-more = … ({ $n } flere linjer av { $file })

js-site-mcp-tool-count =
    { $n ->
        [one] { $n } verktøy
       *[other] { $n } verktøy
    }

js-site-mcp-tools-with-descriptions =
    { $n ->
        [one] { $n } verktøy med beskrivelser
       *[other] { $n } verktøy med beskrivelser
    }

js-site-menu-close = Lukk menyen

js-site-menu-open = Åpne menyen

js-site-missions-avail-title = Tilgjengelighet: andel av kjøringen med PDOP ≤ { $limit }

js-site-missions-avail-uniform = { $v } % i hver celle

js-site-missions-chart-error-title = posisjonsfeil (m, logaritmisk)

js-site-missions-chart-four = fire kreves for en posisjonsbestemmelse

js-site-missions-chart-four-short = fire for en posisjonsbestemmelse

js-site-missions-chart-lg-earth = Jorden synlig

js-site-missions-chart-lg-error-earth = feil, reléer og avstand til Jorden

js-site-missions-chart-lg-error-relays = feil, kun reléer

js-site-missions-chart-lg-relays = reléer i sikte

js-site-missions-chart-relays-title = reléer i sikte · skravert: Jorden over horisonten

js-site-missions-chip-at-pdop = ved PDOP ≤ { $limit }

js-site-missions-chip-engine = Motor:

js-site-missions-chip-fix-earth = posisjonsbestemmelse, med Jorden

js-site-missions-chip-median-pdop = median PDOP

js-site-missions-chip-relays = reléer

js-site-missions-chip-rms = RMS-feil

js-site-missions-chip-satellites = satellitter

js-site-missions-chip-tracking-held = { $label } sporing opprettholdt

js-site-missions-clocks-aria = Tidsfeil etter ett døgn med holdover, etter klokkeklasse, logaritmisk skala

js-site-missions-clocks-frame = rammegulv { $ns } ns

js-site-missions-clocks-note = tidsfeil etter ett døgn, sekunder (logaritmisk)

js-site-missions-clocks-sigma = σy(1 s) { $sigma }

js-site-missions-clocks-title = { $clock }: { $ns } ns etter ett døgn, σy(1 s) { $sigma }

js-site-missions-cone-aria = Kjegle for posisjonsfeil siden GNSS ble tapt

js-site-missions-cone-axis-x = tid siden GNSS ble tapt (s)

js-site-missions-cone-axis-y = posisjonsfeil (m)

js-site-missions-cone-budget = ±{ $m } m budsjett

js-site-missions-cone-clipped = avkuttet ved ±{ $m } m

js-site-missions-cone-leaves = forlater ved { $s } s

js-site-missions-cone-readout = t { $t } s · { $errors }

js-site-missions-copy-command = Kopier kommando

js-site-missions-copy-title = Kopier kommandoen som gjengir den

js-site-missions-deterministic = deterministisk

js-site-missions-engine-build = Motor v{ $version }, build

js-site-missions-engine-build-commit = Motor v{ $version }, build { $commit }

js-site-missions-fp-aria = Kart over jamming-fotavtrykk. Piltastene flytter mellom cellene, Enter åpner den kjøringen.

js-site-missions-fp-aria-svg = Jamming-fotavtrykk rundt jammeren

js-site-missions-fp-darker = mørkere = høyere gjennomsnittlig J/S · celler på { $step } km · { $n } motorkjøringer

js-site-missions-fp-jammer = jammer

js-site-missions-fp-lg-held = sporing opprettholdt

js-site-missions-fp-lg-lost = hver satellitt tapt

js-site-missions-fp-lg-some = noen epoker tapt

js-site-missions-fp-open = Åpne denne kjøringen i { $studio }

js-site-missions-fp-read = omtrent { $km } km fra jammeren · gjennomsnittlig J/S { $js } dB · sporingstilgjengelighet { $av }

js-site-missions-fp-ship = scenarioets skip

js-site-missions-grades-aria = Fritt treghetsbasert glid før { $a } m og { $b } m, etter IMU-klasse

js-site-missions-grades-axis = sekunder med glid etter at GNSS er tapt (logaritmisk)

js-site-missions-grades-point = { $grade }: { $s } s til { $m } m ({ $why })

js-site-missions-grades-reaches = feilen når { $m } m

js-site-missions-grades-speed = ved { $v } m/s

js-site-missions-grades-this = dette scenarioet

js-site-missions-hud-earth-link = Lenke til Jorden

js-site-missions-hud-link-above = Lenke til Jorden · over horisonten

js-site-missions-hud-link-occulted = Lenke til Jorden · skjult

js-site-missions-hud-orbiter = Satellitt i bane

js-site-missions-hud-receiver = Mottaker

js-site-missions-hud-relays = Reléer

js-site-missions-hud-selected-lat = valgt breddegrad

js-site-missions-info-in-view = I sikte

js-site-missions-info-in-view-value = { $mean } i gjennomsnitt · { $fewest } færrest

js-site-missions-info-pdop-above = { $pdop }, over { $limit }

js-site-missions-json-title = Motorens resultat, uendret

js-site-missions-json-unavailable = JSON utilgjengelig

js-site-missions-key-avail = Tilgjengelighet

js-site-missions-key-pdop-title = Gjennomsnittlig PDOP (posisjonsdilusjon av presisjon)

js-site-missions-key-vis = Satellitter i sikte

js-site-missions-key-vis-short = I sikte

js-site-missions-leo-grid = av rutenettet ved PDOP ≤ { $limit }

js-site-missions-leo-in-view = i sikte i gjennomsnitt

js-site-missions-leo-shells = satellitter i fire skall

js-site-missions-map-aria = { $title } over { $body }, per celle på 10 grader. Piltastene flytter mottakeren; cellen den står i, leses ut under.

js-site-missions-map-colour-by = Farg kartet etter

js-site-missions-map-fewest-in-view = færrest i sikte

js-site-missions-map-grey = grå: ingen posisjonsbestemmelse

js-site-missions-map-hatched = skravert: over PDOP-grensen på { $limit }

js-site-missions-map-in-view = i sikte

js-site-missions-map-live = { $cell }: { $rows }

js-site-missions-map-mean-in-view = gjennomsnitt i sikte

js-site-missions-map-mean-pdop = gjennomsnittlig PDOP

js-site-missions-map-pdop-limit = PDOP-grense { $limit }

js-site-missions-matrix-caption = Scenariofiler etter sektor (rader) og feilmodus (kolonner). Velg et tall for å åpne den sektoren.

js-site-missions-matrix-cell =
    { $n ->
        [one] { $sector }, { $mode }: { $n } scenariofil
       *[other] { $sector }, { $mode }: { $n } scenariofiler
    }

js-site-missions-matrix-files =
    { $n ->
        [one] { $n } fil:
       *[other] { $n } filer:
    }

js-site-missions-matrix-sector = Sektor

js-site-missions-mode-int = Interferens

js-site-missions-mode-itg = Integritet

js-site-missions-mode-nav = Glid

js-site-missions-mode-orb = Geometri

js-site-missions-mode-spf = Spoofing

js-site-missions-mode-tim = Tidssynkronisering

js-site-missions-n-of-total = { $n } av { $total }

js-site-missions-no-fix = ingen posisjonsbestemmelse

js-site-missions-no-seed = deterministisk, uten seed

js-site-missions-open-in-studio = Åpne i { $studio }

js-site-missions-open-report = Åpne motorens rapport

js-site-missions-ow-chart-aria = Mottakerrespons over kjøringen for { $name }: reléer i sikte, og posisjonsfeil med kun reléer og med avstanden til Jorden

js-site-missions-ow-chip-epochs = epoker

js-site-missions-ow-chip-mask = maske

js-site-missions-ow-chip-orbiter = satellitt i bane

js-site-missions-ow-chip-range = avstand σ

js-site-missions-ow-chip-relays = reléer

js-site-missions-ow-chip-relays-value = { $planes } × { $per } på { $alt } km, { $inc }°

js-site-missions-ow-chip-span = spenn

js-site-missions-ow-count-relays = { $n } reléer og en satellitt i bane · { $body }

js-site-missions-ow-count-sats = { $n } satellitter · { $body }

js-site-missions-ow-engine = motor v{ $version } · build { $commit }

js-site-missions-ow-lat-label = Mottakerens breddegrad

js-site-missions-ow-map-aria = Mottakerrespons for { $name }: et kart over { $body } i celler på 10 grader, med gjennomsnittlig og færrest satellitter i sikte og gjennomsnittlig PDOP etter breddegrad ved siden av

js-site-missions-ow-note-imagery = Bilder av { $body }: NASA.

js-site-missions-ow-note-rebuilt = Baner: reléene og satellitten i bane gjenoppbygd fra scenarioet nøyaktig slik motoren bygger dem; antallet satellitter i sikte de gir, er lik motorens ved alle { $n } epoker.

js-site-missions-ow-note-sats = Baner: kjøringens satellitter er propagert på nytt her og kontrollert mot alle { $n } bakkesporsamplene motoren skrev (verst { $deg }°).

js-site-missions-ow-note-scaled = Banenes radier er skalert for visning; plan, fasing og omløpstider er kjøringens egne.

js-site-missions-ow-note-tracks = Motoren skrev bakkespor for { $shown } av de { $total } satellittene; alle { $total } er tegnet fra skallene.

js-site-missions-ow-note-walker = Baner: kjøringens Walker-skall er propagert på nytt her og kontrollert mot alle { $n } bakkesporsamplene motoren skrev (verst { $deg }°).

js-site-missions-ow-off = av

js-site-missions-ow-on = på

js-site-missions-ow-pause = Sett banene på pause

js-site-missions-ow-play = Spill av banene

js-site-missions-ow-time = t = { $time }

js-site-missions-ow-time-label = Oppdragstid

js-site-missions-ow-valuetext = { $time }, { $n } reléer i sikte

js-site-missions-pdop-title = Gjennomsnittlig PDOP (posisjonsdilusjon av presisjon), logaritmisk skala, lavere er bedre

js-site-missions-report = Rapport

js-site-missions-report-title = Motorens egen rapport om denne kjøringen

js-site-missions-ro-above-horizon = over horisonten

js-site-missions-ro-availability = Tilgjengelighet, PDOP ≤ { $limit }

js-site-missions-ro-earth-light = Jorden · lystid { $s } s

js-site-missions-ro-error-relays = Posisjonsfeil, kun reléer

js-site-missions-ro-occulted = skjult

js-site-missions-ro-place-availability = Ved { $place }: tilgjengelighet

js-site-missions-ro-place-in-view = Ved { $place }: i sikte, gjennomsnitt · færrest

js-site-missions-ro-relays = Reléer i sikte

js-site-missions-ro-satellites = Satellitter

js-site-missions-ro-with-earth = Med avstanden til Jorden

js-site-missions-run-failed = Den registrerte kjøringen kunne ikke lastes her; åpne den i { $studio } fra lenken under.

js-site-missions-seed = seed { $seed }

js-site-missions-spoof-aria = Spoofing-avvik mot tid, med hver monitors deteksjonsgrense og deteksjonstid

js-site-missions-spoof-axis-x = tid siden spoofingen startet (s)

js-site-missions-spoof-axis-y = tidsavvik (ns)

js-site-missions-spoof-detects = { $id } oppdager ved { $s } s

js-site-missions-spoof-lg-bound = grense for { $id }

js-site-missions-spoof-lg-offset = spoofing-avvik

js-site-missions-spoof-readout = t { $t } s · avvik { $offset } ns

js-site-missions-spoof-spec = spesifikasjon { $v } ns

js-site-missions-sr-aria = { $members }; felles jammer { $power } dBW

js-site-missions-sr-aria-member = { $label }: sporing opprettholdt { $held } %, gjennomsnittlig forhold mellom jammer og signal { $js } dB, færrest satellitter sporet { $min }

js-site-missions-sr-car = Bil

js-site-missions-sr-fewest = færrest sporet

js-site-missions-sr-held = sporing opprettholdt

js-site-missions-sr-mean-js = gjennomsnittlig J/S

js-site-missions-sr-ship = Skip

js-site-missions-swipe =
    { $n ->
        [one] Sveip for å se alle { $n } scenariofil
       *[other] Sveip for å se alle { $n } scenariofiler
    }

js-site-missions-toml-download-title = Last ned scenariofilen som ble kjørt

js-site-missions-toml-title = Scenariofilen som ble kjørt

js-site-missions-vis-title = Satellitter i sikte, gjennomsnitt over kjøringen

js-site-missions-vis-uniform = { $v } i hver celle

js-site-palette-none = Ingen resultater

js-site-palette-results = { $count } resultater

js-site-pro-band-at = Ved { $minutes } minutter: 5. til 95. persentil

js-site-pro-band-range = { $lo } til { $hi } { $unit }

js-site-pro-band-runs-within = av { $n } kjøringer innenfor ±{ $limit } { $unit }

js-site-pro-design-readout = { $sat } satellitter, { $av } % tilgjengelighet · { $planes } plan på { $alt } km, { $incl }°

js-site-pro-front-design = Frontutforming { $id }

js-site-pro-front-design-knee = Frontutforming { $id } · knekk

js-site-pro-more-designs =
    { $n ->
        [one] (+{ $n } frontutforming til på dette punktet)
       *[other] (+{ $n } frontutforminger til på dette punktet)
    }

js-site-pro-not-rerun = ikke kjørt på nytt

js-site-pro-rerun-free = kjørt på nytt i den gratis motoren:

js-site-pro-same-sha = samme SHA-256 { $sha }…

js-site-pro-same-sha-index = samme resultat-SHA-256 som indeksen

js-site-toast-copied = Kopiert: { $text }

js-site-toast-data-failed = Datafilen kunne ikke lastes

js-site-toast-data-saved = Data lagret som CSV

js-site-toast-no-data = Ingen data for dette diagrammet

js-site-toast-svg-saved = Diagram lagret som SVG

js-site-toast-table-saved = Tabell lagret som CSV

js-site-waterfall-axis-now = nå

js-site-waterfall-bar-title = { $band }: { $cn0 } dB-Hz, { $state }

js-site-waterfall-bar-title-js = { $band }: { $cn0 } dB-Hz, { $state }, J/S { $js } dB

js-site-waterfall-below-floor = signalene ligger under støygulvet

js-site-waterfall-campaign-drives = Kampanjen den driver:

js-site-waterfall-campaign-seed = seed { $seed } · { $phases } faser over { $duration } s

js-site-waterfall-chip-aria = { $band }, { $fc } megahertz: vis dette båndet

js-site-waterfall-chip-title = { $band } · { $fc } MHz · mottakerbåndbredde { $bw } MHz

js-site-waterfall-engine-build = Motor v{ $version } · build

js-site-waterfall-fallback-head = Galileo-reserve · { $s } s, kun CW-tone

js-site-waterfall-fallback-text = { $band } tilbake på { $v } dB-Hz. Integritetsovervåking kun på Galileo: beskyttelsesnivå { $min }–{ $max } m, under varslingsgrensen på { $limit } m.

js-site-waterfall-floor = sporingsgulv på { $thr } dB-Hz

js-site-waterfall-holdover-head = Holdover · { $s } s, chirp på

js-site-waterfall-holdover-text = { $band0 } { $v0 }, { $band1 } { $v1 } dB-Hz, under gulvet. Klokken går fritt: verst { $worst } ns mot en vernegrense på { $guard } ns.

js-site-waterfall-jammer-off = { $what } av

js-site-waterfall-jammer-on = { $what } på

js-site-waterfall-live = { $freq } megahertz, { $time }: { $detail }

js-site-waterfall-live-band = { $band } { $cn0 } dB-Hz, { $state }

js-site-waterfall-live-none = ikke noe modellert bånd

js-site-waterfall-load-failed = Den registrerte kjøringen kunne ikke lastes. Motorens rapport under viser den samme kjøringen.

js-site-waterfall-no-jammer-band = Ingen jammer i dette båndet

js-site-waterfall-no-jammer-in-band = ingen jammer i båndet

js-site-waterfall-no-seed = deterministisk, uten seed

js-site-waterfall-onset-head = Start · { $t0 }–{ $t1 } s

js-site-waterfall-onset-text = Alle { $n } bånd spores, helt til spektrumkjøringen først mister { $band } ved { $s } s.

js-site-waterfall-pause = Sett vannfallet på pause

js-site-waterfall-play = Spill av vannfallet

js-site-waterfall-quiet-band = { $band } { $cn0 } dB-Hz · { $state }

js-site-waterfall-run-time = kjøring T+{ $s } s

js-site-waterfall-scale-caption = PSD over gulvet på { $floor } dBW/Hz · celler på { $bin } MHz × { $step } s

js-site-waterfall-seed = seed { $seed }

js-site-waterfall-short-lost = mistet

js-site-waterfall-short-ok = sporet

js-site-waterfall-short-rec = gjenopp.

js-site-waterfall-state-lost = Mistet lås

js-site-waterfall-state-lost-low = mistet lås

js-site-waterfall-state-ok = Sporing

js-site-waterfall-state-ok-low = sporing

js-site-waterfall-state-rec = Gjenopprettet

js-site-waterfall-state-rec-low = gjenopprettet

js-site-waterfall-summary-recovers = { $band } mister låsen ved { $lost } s og gjenopprettes ved { $rec } s, lavest { $min } dB-Hz.

js-site-waterfall-summary-rows = { $n } rader på { $step } s.

js-site-waterfall-summary-stays-lost = { $band } mister låsen ved { $lost } s og forblir mistet, lavest { $min } dB-Hz.

js-site-waterfall-summary-tracks = { $band } spores hele tiden, lavest { $min } dB-Hz.

js-site-waterfall-tip-above-floor = over støygulvet

js-site-waterfall-tip-at-floor = Ved det termiske støygulvet

js-site-waterfall-tip-band = { $cn0 } dB-Hz · { $state }

js-site-waterfall-tip-head = { $lo }–{ $hi } MHz · { $time }

js-site-waterfall-tip-js = J/S { $js } dB

js-site-waterfall-tip-no-band = Ingen modellert bånds mottakerbåndbredde dekker denne kolonnen

js-site-waterfall-wave-chirp = chirp

js-site-waterfall-wave-cw = CW-tone

js-site-waterfall-wave-noise = støy

js-site-waterfall-who-cursor = Båndet under pekeren

js-site-waterfall-who-selected = Valgt bånd

js-site-waterfall-who-worst = Dårligste bånd
