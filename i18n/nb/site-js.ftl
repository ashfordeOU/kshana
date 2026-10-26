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
