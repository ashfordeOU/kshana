# site-js.ftl (da): translations

js-app-engine-failed = Motoren kunne ikke indlæses ({ $reason }).

js-ledger-rows =
    { $n ->
        [one] { $n } registerrække
       *[other] { $n } registerrækker
    }

js-site-action-copy-install = Kopiér: cargo install kshana

js-site-action-launch = Start { $name }

js-site-action-licence = Tal med os om en kommerciel licens

js-site-action-pro-eval = Anmod om en evaluering af Kshana Pro

js-site-action-study = Anmod om et studie

js-site-action-theme = Skift mellem lyst og mørkt tema

js-site-capabilities-bd-after = { $m } m efter { $s } s

js-site-capabilities-bd-combined = kombineret

js-site-capabilities-bd-crossing = { $m } m ved { $s } s

js-site-capabilities-bd-fig-crossing = «{ $m } m» efter { $s } s, domineret af { $dom }

js-site-capabilities-bd-fig-lead = Tid siden GNSS gik tabt på logaritmisk akse, en IMU af klasse { $grade } ved { $speed } m/s:

js-site-capabilities-bd-fig-tail = Linjerne er motorens vækstlove for korte drivperioder og deres kvadratsum; skæringspunkterne kommer fra motorens fulde fejlmodel med ni tilstande (Schuler), som begrænser biasleddene, så ved lange drivperioder indtræffer hvert skæringspunkt lidt senere, end linjen når det. Søjlerne: de samme skæringspunkter for fire IMU-klasser.

js-site-capabilities-cd-canvas-aria = Konstellation omkring sit himmellegeme, ægte billeder: træk eller brug piletasterne for at dreje, plus og minus for at zoome

js-site-capabilities-cd-design-meta = { $n } satellitter · { $body } · { $file }

js-site-capabilities-cd-foot-frozen = Hver satellit følger motorens egen bane; radius for den frosne bane kommer fra skallens elementer.

js-site-capabilities-cd-foot-mean-motion = Hver satellit følger motorens egen bane, med den radius, som dens middelbevægelse giver.

js-site-capabilities-cd-foot-walker = Alle { $n } satellitter er placeret ud fra skallernes egne Walker-parametre (kontrolleret mod motorens { $shown } baner: værst { $deg }°); sporene er motorens { $shown } baner.

js-site-capabilities-cd-hud-body = { $body } · «{ $n }» satellitter

js-site-capabilities-cd-hud-mission = Mission «{ $time }»

js-site-capabilities-cd-legend-shell = skal { $n } · { $inc }°

js-site-capabilities-cd-map-availability = Andel af kørslen med PDOP ≤ { $limit } (0 til 100 %)

js-site-capabilities-cd-map-pdop = Gennemsnitlig PDOP pr. celle på { $step }° ({ $lo } til { $hi }; lysere er bedre)

js-site-capabilities-cd-map-visible = Gennemsnitligt antal satellitter i sigte ({ $lo } til { $hi })

js-site-capabilities-cd-metric-availability = Tilgængelighed

js-site-capabilities-cd-metric-pdop = Gennemsnitlig PDOP

js-site-capabilities-cd-metric-visible = I sigte

js-site-capabilities-cd-no-webgl = 3D-visningen kræver WebGL; dækningskortet og figurerne er den samme kørsel.

js-site-capabilities-cd-pause = Sæt banerne på pause

js-site-capabilities-cd-play = Afspil banerne

js-site-capabilities-cd-shell = { $name }: Walker { $pattern } { $total }/{ $planes }/{ $phasing } · { $alt } km · { $inc }°

js-site-capabilities-cd-slots = { $name }: { $n } satellitter, operatørens pladstabel

js-site-capabilities-cd-span = af { $dur }, i løkke

js-site-capabilities-cd-stat-in-view = Gennemsnit i sigte

js-site-capabilities-cd-stat-mask = Maske · kørsel

js-site-capabilities-cd-stat-median = Median-PDOP

js-site-capabilities-cd-stat-pdop = PDOP ≤ { $limit }, hele { $body }

js-site-capabilities-cd-stat-satellites = Satellitter

js-site-capabilities-cd-stat-worst = Dårligste sted

js-site-capabilities-cd-title-gnss = Fire GNSS sammen

js-site-capabilities-cd-title-leo = Mega-konstellation i lav jordbane

js-site-capabilities-cd-title-lunar = Månerelæsæt

js-site-capabilities-cd-work-ratio = { $pct } % efter breddegradsforfilteret · { $dop } DOP-løsninger

js-site-capabilities-cd-work-tests = { $after } satellit-punkttest af de { $brute }, som en udtømmende gennemsøgning ville foretage

js-site-capabilities-cd-work-title = Sigtbarhedsarbejde

js-site-capabilities-cg-cn0-sub = C/N0 mod sporingsgulvet

js-site-capabilities-cg-cn0-title = Bærebølge-til-støj-tæthed

js-site-capabilities-cg-compose-availability = Tilgængelighed

js-site-capabilities-cg-compose-fewest = Færrest sporede

js-site-capabilities-cg-compose-js = Gennemsnitlig J/S

js-site-capabilities-cg-compose-text = Én jammer, { $power } { $unit }, ét sted, bundet til { $n } medlemskørsler af arten ‹{ $kind }›: et skib i et stræde og en bil på en kystvej ser den samme årsag og får forskellige svar.

js-site-capabilities-cg-log-campaign = kampagne { $file } · { $phases } faser · { $runs } medlemskørsler

js-site-capabilities-cg-log-phase = fase { $name } begynder

js-site-capabilities-cg-log-phase-carries = fase { $name } begynder · medbringer { $carried }

js-site-capabilities-cg-monte-axis = endelig urfejl over { $n } seeds ({ $path })

js-site-capabilities-cg-monte-ci = Gennemsnit, 95 %-interval

js-site-capabilities-cg-monte-mean = Gennemsnit

js-site-capabilities-cg-monte-p05 = 5.

js-site-capabilities-cg-monte-p05-p95 = 5. til 95.

js-site-capabilities-cg-monte-p50 = median

js-site-capabilities-cg-monte-p95 = 95.

js-site-capabilities-cg-monte-std = Standardafvigelse

js-site-capabilities-cg-monte-text = Det samme ‹{ $kind }›-scenarie kørt { $n } gange fra basis-seedet { $seed }, ét seed pr. kørsel: spredningen i det frit løbende urs endelige fejl, med dets 95 %-konfidensinterval for gennemsnittet.

js-site-capabilities-cg-not-in-phase = ikke i denne fase

js-site-capabilities-cg-now = Fase { $n } af { $total }: { $name } · { $from } til { $to }

js-site-capabilities-cg-phase-title = { $name }: { $from } til { $to } · afsluttet af { $by } · medlemsarter { $kinds }

js-site-capabilities-cg-pl-sub = mod alarmgrænsen

js-site-capabilities-cg-pl-title = Beskyttelsesniveau

js-site-capabilities-cg-pos-sub = mod dets budget · log

js-site-capabilities-cg-pos-title = Inertial positionsfejl

js-site-capabilities-cg-range = { $lo } til { $hi }

js-site-capabilities-cg-sweep-all-lost = Alle tabt fra

js-site-capabilities-cg-sweep-axis = jammerens sendeeffekt ({ $key })

js-site-capabilities-cg-sweep-first-loss = Første tab

js-site-capabilities-cg-sweep-lg-availability = tilgængelighed

js-site-capabilities-cg-sweep-lg-js = gennemsnitlig J/S

js-site-capabilities-cg-sweep-never = aldrig

js-site-capabilities-cg-sweep-nodes = Knudepunkter

js-site-capabilities-cg-sweep-none = ingen

js-site-capabilities-cg-sweep-span = J/S-spænd

js-site-capabilities-cg-sweep-text = Ét ‹{ $kind }›-scenarie, kørt én gang pr. knudepunkt, mens jammerens sendeeffekt trinvis går fra { $from } til { $to } { $unit }. Tilgængelighed under jamming (hel linje) og gennemsnitlig J/S (stiplet) kommer fra hver medlemskørsels egne kvalitetsmål.

js-site-capabilities-cg-te-sub = mod dets værn

js-site-capabilities-cg-te-title = Urets tidsfejl

js-site-capabilities-copy = Kopiér

js-site-capabilities-copy-aria = Kopiér kommandoen, der gengiver kørslen: kshana { $file }

js-site-capabilities-cz-best = Bedste PDOP

js-site-capabilities-cz-failed = Den optagede kørsel kunne ikke indlæses her; åbn den i Studio i stedet.

js-site-capabilities-cz-fix = Sampel med positionsbestemmelse

js-site-capabilities-cz-fix-value = { $n } af { $total } ({ $pct }%)

js-site-capabilities-cz-median = Median-PDOP

js-site-capabilities-engine = Motor v{ $version }

js-site-capabilities-engine-build = Motor v{ $version }, build

js-site-capabilities-engine-report = Motorrapport

js-site-capabilities-globe-aria = { $name } på sine ægte billeder ({ $credit }). Træk eller brug piletasterne for at dreje den; plus og minus zoomer.

js-site-capabilities-ho-ends = kørslen slutter ved { $t }

js-site-capabilities-ho-past-guard = forbi værnet

js-site-capabilities-no-seed = deterministisk, intet seed

js-site-capabilities-open-in-studio = Åbn i { $studio }

js-site-capabilities-open-report = Åbn motorens rapport

js-site-capabilities-orrery-aria = Solsystemet ved kørslens epoke: træk eller brug piletasterne for at dreje, plus og minus for at zoome

js-site-capabilities-orrery-bodies = { $n } himmellegemer · observatør «{ $observer }»

js-site-capabilities-orrery-epoch = Epoke «{ $epoch }» · TDB (Barycentric Dynamical Time), juliansk dato { $jd }

js-site-capabilities-pnt-chart-title = relæer i sigte (linje) · Jorden over horisonten (skraveret) · fire er nødvendige for en positionsbestemmelse

js-site-capabilities-pnt-kicker = Positionering ved dette himmellegeme · body-pnt-art

js-site-capabilities-pnt-lander = En lander ved { $lat }°, { $lon }° på overfladen navigerer på relæerne, med en tovejsafstand fra Jorden, så snart Jorden er over horisonten (envejs lystid { $min } min). Tilgængelighed: { $a } % alene på relæerne, { $b } % med Jordforbindelsen.

js-site-capabilities-pnt-orbiter = En bruger i kredsløb navigerer på relæerne, med en tovejsafstand fra Jorden, så snart Jorden er over horisonten (envejs lystid { $min } min). Tilgængelighed: { $a } % alene på relæerne, { $b } % med Jordforbindelsen.

js-site-capabilities-pnt-relays = { $n } relæer på { $alt } km omkring { $body }

js-site-capabilities-report-data = Rapport og data

js-site-capabilities-result-data = Resultatdata

js-site-capabilities-saved = Gemte { $name }

js-site-capabilities-scenario-file = Scenariefil

js-site-capabilities-seed = seed { $seed }

js-site-capabilities-six-clock-fig = «{ $id }» holder værnet i { $dur }

js-site-capabilities-six-clock-guard = { $v } ns værn

js-site-capabilities-six-coast-budget = { $m } m budget

js-site-capabilities-six-coast-denied = GNSS nægtet

js-site-capabilities-six-coast-fig = «{ $id }» inden for budgettet i { $s } s

js-site-capabilities-six-floor = sporingsgulv

js-site-capabilities-six-integ-fig = «{ $ok }» af { $n } epoker tilgængelige · alarmgrænser { $h } m horisontalt, { $v } m vertikalt

js-site-capabilities-six-integ-limit = vertikal alarmgrænse

js-site-capabilities-six-integ-pl = vertikalt (hel linje) og horisontalt (stiplet) beskyttelsesniveau

js-site-capabilities-six-jam-effective = effektivt, { $n } satellitter

js-site-capabilities-six-jam-fig = Sporet «{ $min }» af { $max } i sigte · tilgængelighed under jamming «{ $av }» (nominelt { $nom }) · gennemsnitlig J/S «{ $js } dB»

js-site-capabilities-six-jam-nominal = nominelt, ingen jammer (stiplet)

js-site-capabilities-six-orbit-fig = Højde «{ $lo }–{ $hi } km» · jordspor over { $dur }

js-site-capabilities-six-orbit-label = { $source } · { $n } sampel

js-site-capabilities-six-orbit-sgp4 = SGP4 fra et tolinjers elementsæt

js-site-capabilities-six-spoof-detects = { $id } detekterer

js-site-capabilities-six-spoof-fig = «{ $id }» detekterer ved { $s } s (grænse { $ns } ns)

js-site-capabilities-ss-angle = Vinkel fra Solen

js-site-capabilities-ss-credit = Billeder: { $credits }. * Kortet når ikke helt til polerne; hullet får kortets gennemsnitsfarve for polerne. Saturns ringe: { $ring } ({ $licence }).

js-site-capabilities-ss-days = { $v } døgn

js-site-capabilities-ss-frame-origin = Systemets origo

js-site-capabilities-ss-from-sun = Fra Solen

js-site-capabilities-ss-gloss = NAIF: himmellegemets kode hos NASA's Navigation and Ancillary Information Facility. GM: gravitationsparameter. J2: fladtrykningsled. IAU-pol: rotationspolen ifølge Den Internationale Astronomiske Union, som rektascension (RA) og deklination (Dec).

js-site-capabilities-ss-j2-none = ingen offentliggjort

js-site-capabilities-ss-kind = { $class } · NAIF { $naif }

js-site-capabilities-ss-kind-of = { $class } af { $parent } · NAIF { $naif }

js-site-capabilities-ss-light-time = Lystid fra { $observer }

js-site-capabilities-ss-link = { $from } til { $to }, envejs lystid { $one }, tur-retur { $two }

js-site-capabilities-ss-links-lead =
    { $n ->
        [one] Forbindelse, som denne kørsel beregner:
       *[other] Forbindelser, som denne kørsel beregner:
    }

js-site-capabilities-ss-moons =
    { $n ->
        [one] Dens måne, i skala, ved epoken
       *[other] Dens måner, i skala, ved epoken
    }

js-site-capabilities-ss-nominal-error = nominel fejl { $km } km i afstand

js-site-capabilities-ss-north = Set fra ekliptikas nordside.

js-site-capabilities-ss-period = Omløbstid

js-site-capabilities-ss-period-about = Omløbstid om { $parent }

js-site-capabilities-ss-pole = IAU-pol (RA, Dec)

js-site-capabilities-ss-radius = Middelradius

js-site-capabilities-ss-retrograde = { $v } h, retrograd

js-site-capabilities-ss-rotation = Siderisk rotation

js-site-capabilities-ss-years = { $v } år

js-site-capabilities-st-bound = { $v } m grænse

js-site-capabilities-st-fig-none = { $n } epoker, ingen med fejlen over sin grænse. På tværs: den sande positionsfejl; opad: beskyttelsesniveauet; begge på logaritmiske akser.

js-site-capabilities-st-fig-some = { $n } epoker, { $k } med fejlen over sin grænse. På tværs: den sande positionsfejl; opad: beskyttelsesniveauet; begge på logaritmiske akser.

js-site-capabilities-st-limit = alarmgrænse { $m } m

js-site-capabilities-st-misleading = vildledende: fejlen over grænsen

js-site-capabilities-st-normal = normal drift

js-site-capabilities-st-unavailable = utilgængelig: grænsen over alarmgrænsen

js-site-capabilities-studio-embedded = { $studio }, indlejret: kørslen orbit-multignss

js-site-capabilities-studio-load = Indlæs { $studio } her

js-site-capabilities-studio-outline = Vis oversigten igen

js-site-capabilities-wave-chirp = chirp

js-site-capabilities-wave-cw = CW-tone

js-site-capabilities-wave-noise = støj

js-site-capabilities-wf-an-caption = række T+{ $t } s · dB over gulvet, logaritmisk skala · topværdi for hele gitteret { $peak } dB

js-site-capabilities-wf-degraded = Forringet

js-site-capabilities-wf-degraded-low = forringet

js-site-capabilities-wf-failed = Den optagede kørsel kunne ikke indlæses her.

js-site-capabilities-wf-grid = gitter

js-site-capabilities-wf-iq = Ved T+{ $t } s tegner motoren også modellen som { $n } IQ-sampel (in-phase og kvadratur) omkring { $mhz } MHz og kontrollerer et Welch-estimat ({ $segments } segmenter á { $nfft }) mod den: integreret effektforhold { $ratio }.

js-site-capabilities-wf-jammer-off = { $what } fra

js-site-capabilities-wf-jammer-on = { $what } til

js-site-capabilities-wf-jammer-open = { $name } · { $mhz } MHz · fra { $on } s til slutningen

js-site-capabilities-wf-jammer-span = { $name } · { $mhz } MHz · { $on }–{ $off } s

js-site-capabilities-wf-lost = Tabt lås

js-site-capabilities-wf-lost-low = tabt lås

js-site-capabilities-wf-max = { $peak } dB over den · logaritmisk skala fra { $v0 } dB

js-site-capabilities-wf-no-jammer = ingen jammer

js-site-capabilities-wf-now = nu

js-site-capabilities-wf-pause = Sæt vandfaldet på pause

js-site-capabilities-wf-peak = top { $v } dB

js-site-capabilities-wf-play = Afspil vandfaldet

js-site-capabilities-wf-replay-previous = start på genafspilningen · forrige gennemløb nedenfor

js-site-capabilities-wf-replay-start = start på genafspilningen

js-site-capabilities-wf-say = T+{ $t } s, { $band } { $v } dB-Hz, { $state }

js-site-capabilities-wf-signal = signal +{ $v } dB

js-site-capabilities-wf-summary = Optaget kørsel af { $file }: { $bands } bånd, { $jammers } jammere over { $seconds } sekunder. Det dårligste bånd, { $worst }, falder til { $min } dB-Hz ved { $at } s; sporingsgulv { $floor } dB-Hz.

js-site-capabilities-wf-tip-above = { $v } dB over støjgulvet

js-site-capabilities-wf-tip-in = i { $bands }

js-site-capabilities-wf-tracking = Sporer

js-site-capabilities-wf-tracking-low = sporer

js-site-caphero-aria = Solsystemet fra motorens solsystemkørsel ved { $date }: Solen og { $bodies } himmellegemer, der bevæger sig langs deres baner fra motoren; { $valid } af banerne er validerede mod JPL Horizons.

js-site-caphero-clock = +{ $days } døgn · { $date }

js-site-caphero-copy-command = Kopiér kommando

js-site-caphero-copy-title = Kopiér kommandoen, der gengiver den

js-site-caphero-credits = Afstande komprimeret på logaritmisk skala, retninger sande; himmellegemer forstørret, rotation i visningstempo. Billeder: { $credits }; Saturns ringe: { $ring } ({ $licence }).

js-site-caphero-credits-summary = Skala og billedkreditering

js-site-caphero-engine-build = Motor v{ $version }, build

js-site-caphero-explore = Udforsk hvert himmellegeme

js-site-caphero-file-title = Scenariefilen, der kørte

js-site-caphero-list-item = { $name }: { $label }, { $au } au fra Solen ved epoken, omløbstid { $period }.

js-site-caphero-list-item-light = { $name }: { $label }, { $au } au fra Solen ved epoken, omløbstid { $period }, lystid fra { $observer } { $light }.

js-site-caphero-no-seed = deterministisk, intet seed

js-site-caphero-open-in-studio = Åbn i { $studio }

js-site-caphero-pause = Sæt banerne på pause

js-site-caphero-period-days = { $value } døgn

js-site-caphero-period-years = { $value } år

js-site-caphero-play = Afspil banerne

js-site-caphero-rate = { $days } døgn af kørslen pr. sekund

js-site-caphero-rate-epoch = Billedet ved kørslens epoke

js-site-caphero-read-distance = { $au } au fra Solen

js-site-caphero-read-light = lystid fra { $observer } ved epoken { $light }

js-site-caphero-read-orbit = bane { $period }

js-site-caphero-seed = seed { $seed }

js-site-copy-aria = Kopiér: { $cmd }

js-site-developers-captured-from = optaget { $recorded } fra

js-site-developers-engine-build = Motor v{ $version }, build

js-site-developers-exit-stamp = afslutning { $rc } · { $ms } ms

js-site-developers-file-open-in-studio = { $file }: åbn i { $studio }

js-site-developers-no-seed = (deterministisk, intet seed)

js-site-developers-open-in-studio = Åbn i { $studio }

js-site-developers-pause = Sæt genafspilningen på pause

js-site-developers-play = Afspil genafspilningen

js-site-developers-replaying = # genafspiller den optagede session

js-site-developers-seed = (seed { $seed })

js-site-developers-what-runs-write = Hvad hver kørsel skriver

js-site-editions-builds-on-it = { $label } bygger på den

js-site-editions-core-kinds =
    { $n ->
        [one] { $n } art
       *[other] { $n } arter
    }

js-site-editions-core-title = Åben kerne

js-site-editions-core-validated = validerede

js-site-editions-core-validated-of = { $validated } af { $total }

js-site-editions-free-core = Gratis i den åbne kerne, som alle arter

js-site-editions-group-other = Andet

js-site-editions-kind-no-ledger = intet registermodul matcher den på navn

js-site-editions-kind-validated = { $v } af { $tot } registerrækker validerede

js-site-editions-pause = Sæt ringene på pause

js-site-editions-play = Afspil ringene

js-site-editions-ring-pro = Kshana Pro

js-site-editions-ring-study = Tilpasset studie

js-site-evidence-allan-aria = Fire afvigelser for NIST SP 1065's datasæt med 1000 punkter mod middelværdidannelsestid; alle { $n } offentliggjorte værdier gengivet, værste relative fejl { $err }

js-site-evidence-allan-lg-published = offentliggjort værdi, SP 1065 tabel 31

js-site-evidence-allan-mdev = modificeret Allan-afvigelse

js-site-evidence-allan-na = n/a

js-site-evidence-allan-oadev = overlappende Allan-afvigelse

js-site-evidence-allan-ohdev = overlappende Hadamard-afvigelse

js-site-evidence-allan-read = { $tau } s · Allan { $oadev } · modificeret { $mdev } · Hadamard { $ohdev }

js-site-evidence-allan-st-gate = testens grænse

js-site-evidence-allan-st-reproduced = offentliggjorte værdier gengivet

js-site-evidence-allan-st-worst = værste relative fejl

js-site-evidence-allan-tdev = tidsafvigelse, i sekunder

js-site-evidence-allan-tip-at = «{ $name }» ved { $m } s

js-site-evidence-allan-tip-engine = motor: «{ $got }» · relativ fejl { $err }

js-site-evidence-allan-tip-table = SP 1065 tabel 31: «{ $want }»

js-site-evidence-cell-tip = Funktion { $i } af { $n } · «{ $label }»

js-site-evidence-cowell-aria = Positionsforskel mod Orekit over 24 timer: kraftniveauerne 1 til 5 holder sig under { $worst }; luftmodstandsniveauet når { $drag }, et karakteriseringsbånd

js-site-evidence-cowell-gto = geostationær transferbane

js-site-evidence-cowell-leo = lav jordbane

js-site-evidence-cowell-lg-con = niveau 1 til 5, todelegemeproblem op til solstrålingstryk, to baner hver

js-site-evidence-cowell-lg-drag = niveau 6, luftmodstand: kun karakterisering (forskellige densitetsmodeller)

js-site-evidence-cowell-read = { $h } h · niveau 1 til 5 værst { $con } · luftmodstand { $drag }

js-site-evidence-cowell-st-drag = luftmodstandsniveau, værst

js-site-evidence-cowell-st-epochs = epoker i niveau 1 til 5

js-site-evidence-cowell-tip-tier = «Niveau { $tier }: { $label }» · { $regime }

js-site-evidence-cowell-tip-worst = værste forskel «{ $err }» ved { $h } h

js-site-evidence-hero-live = { $label }. { $cap }. { $oracle }

js-site-evidence-hero-no-oracle = Ingen ekstern uafhængig reference angivet.

js-site-evidence-hero-oracle = Uafhængig reference

js-site-evidence-hero-oracle-is = Uafhængig reference: { $o }

js-site-evidence-hero-owner = Ejer

js-site-evidence-hero-partner = En partner ejer dette; motoren gør ikke krav på noget af det.

js-site-evidence-hero-pause = Sæt fejningen på pause

js-site-evidence-hero-play = Afspil fejningen

js-site-evidence-hero-row = Række { $i } af { $n }

js-site-evidence-hold-accepted = accepteret: inden for en faktor { $bar }

js-site-evidence-hold-aria = Målt kvadratisk middelværdi af tidsfejlen for cæsiumuret mod drivtiden, med motorens forudsigelse; forudsagt over målt overskrider grænsen fra { $lo } til { $hi }

js-site-evidence-hold-control = «Kontrol:» den naive forudsigelse (stabiliteten ved ét sekund læst som hvid frekvensstøj) giver forholdet { $ratio }, forkert med en faktor på omkring { $factor }, og består ikke den samme tærskel. Tærsklen har tænder.

js-site-evidence-hold-lg-meas = målt på den tilbageholdte optagelse (prik: overskridelse)

js-site-evidence-hold-lg-pred = forudsagt ud fra første tredjedel (ring: overskridelse)

js-site-evidence-hold-nodata = Den målte optagelse var ikke tilgængelig, da denne side blev genereret.

js-site-evidence-hold-perfect = 1 = perfekt

js-site-evidence-hold-ratio-aria = Forudsagt over målt for { $n } tærskelværdier, alle inden for den accepterede faktor { $bar }

js-site-evidence-hold-read = drift { $h } h · målt { $m } ns · forudsagt { $p } ns

js-site-evidence-hold-st-fit = brugt til tilpasningen

js-site-evidence-hold-st-samples = sampel med ét sekunds interval

js-site-evidence-hold-st-syncs = tilbageholdte synkpunkter

js-site-evidence-hold-tip-breach = forudsagt overskridelse { $p } s · målt { $m } s

js-site-evidence-hold-tip-error = «Tidsfejl { $thr } ns»

js-site-evidence-hold-tip-ratio = forudsagt over målt «{ $ratio }»

js-site-evidence-hold-tip-row = «{ $thr } ns» · forudsagt over målt «{ $ratio }»

js-site-evidence-kernel-chi2-cdf = chi-i-anden-fordeling

js-site-evidence-kernel-chi2-quantile = chi-i-anden-kvantil

js-site-evidence-kernel-noncentral = ikke-central chi-i-anden

js-site-evidence-kernel-normal-cdf = normalfordeling

js-site-evidence-kernel-normal-quantile = normalkvantil

js-site-evidence-kernel-pbias = detektionsbias

js-site-evidence-ladder-aria = Banerester fra { $lo } til { $hi } m på én logaritmisk skala, med myndighedstærsklen { $bar } m

js-site-evidence-ladder-bar = myndighedstærskel { $bar } m

js-site-evidence-ladder-cowell = Cowell mod Orekit 12.2, værst

js-site-evidence-ladder-g24 = Galileo E11, tilpasning over 24 timer

js-site-evidence-ladder-g8 = Galileo E11, tilpasning over 8 timer

js-site-evidence-ladder-lg-headline = hovedrest

js-site-evidence-ladder-lg-over = over myndighedstærsklen { $bar } m

js-site-evidence-ladder-lg-ring = alene kraftmodellen, før empiriske accelerationer

js-site-evidence-ladder-lro = Lunar Reconnaissance Orbiter, tilpasning over 4 timer

js-site-evidence-ladder-read = fejning ved { $v } · { $n } af { $total } hovedrester ved eller under den

js-site-evidence-ladder-rt-arc = { $arc }-bue · grad og orden { $do } · { $n } observationer

js-site-evidence-ladder-rt-rtn = radialt { $r } m · langs banen { $a } m · på tværs af banen { $c } m

js-site-evidence-ladder-sgp4 = SGP4 mod AIAA-vektorerne, værst

js-site-evidence-ladder-swarm = Swarm-A, tilpasning over 3 timer

js-site-evidence-ladder-tip-cowell = «Cowell · værst af { $n } epoker» · { $worst }

js-site-evidence-ladder-tip-g24 = «Galileo E11 · et helt døgn» · { $rms } m

js-site-evidence-ladder-tip-g8a = «Galileo E11 · kun kraftmodel» · { $rms } m

js-site-evidence-ladder-tip-g8b = «Galileo E11 · med empiriske accelerationer» · { $rms } m

js-site-evidence-ladder-tip-lrd = «Månekredsløbsfartøj · dynamisk» · { $rms } m

js-site-evidence-ladder-tip-lrr = «Månekredsløbsfartøj · reduceret dynamisk» · { $rms } m, over tærsklen { $bar } m og rapporteret som det er

js-site-evidence-ladder-tip-sgp4 = «SGP4 · værst af { $n } vektorer» · { $worst }

js-site-evidence-ladder-tip-swd = «Swarm-A · dynamisk» · { $rms } m, næsten alt langs banen (luftmodstand)

js-site-evidence-ladder-tip-swr = «Swarm-A · reduceret dynamisk» · { $rms } m

js-site-evidence-raim-aria = { $pass } af { $n } SciPy-tilfælde inden for deres tolerancebånd, over { $kernels } kerner

js-site-evidence-raim-lane = { $kernel } · { $n }

js-site-evidence-raim-lg-most = den største andel af et bånd, som noget tilfælde bruger

js-site-evidence-raim-read = tilfælde { $q } af { $n } · { $kernel } · { $what }

js-site-evidence-raim-read-band = { $pct } % af båndet

js-site-evidence-raim-scale-aria = Farveskala: andel af tolerancebåndet, der bruges, logaritmisk fra 10 i minus 11 til båndets kant

js-site-evidence-raim-st-inside = inden for båndet

js-site-evidence-raim-st-most = største andel af et bånd brugt

js-site-evidence-raim-tick-edge = båndkant

js-site-evidence-raim-tick-exact = nøjagtig

js-site-evidence-raim-tip-case = «{ $kernel }» · tilfælde { $j } af { $n }

js-site-evidence-raim-tip-exact = «nøjagtigt match» med SciPy

js-site-evidence-raim-tip-uses = bruger «{ $pct } %» af sit tolerancebånd

js-site-evidence-sgp4-aria = { $n } af { $n } AIAA-vektorer gengivet; værst { $worst }, median { $median }, alle inden for tolerancen { $tol }

js-site-evidence-sgp4-deep = dybt rum (SDP4)

js-site-evidence-sgp4-lg-deep = dybrumsvektor (SDP4)

js-site-evidence-sgp4-lg-median = median og værst på skalaen

js-site-evidence-sgp4-lg-near = jordnær vektor (SGP4)

js-site-evidence-sgp4-near = jordnær (SGP4)

js-site-evidence-sgp4-read = vektor { $i } af { $n } · satellit { $sat } · fejl { $err }

js-site-evidence-sgp4-read-deep = vektor { $i } af { $n } · satellit { $sat }, dybt rum · fejl { $err }

js-site-evidence-sgp4-scale-aria = Farveskala fra 0,1 mikrometer til tolerancen, logaritmisk

js-site-evidence-sgp4-st-deep = dybrumsvektorer

js-site-evidence-sgp4-st-sats = testsatellitter

js-site-evidence-sgp4-tip-sat = «Satellit { $sat }» · { $kind }

js-site-evidence-sgp4-tip-vector = vektor { $j } af { $n } · positionsfejl «{ $err }»

js-site-evidence-st-median = median

js-site-evidence-st-worst = værst

js-site-evidence-tolerance = tolerance { $v }

js-site-filter-in-all = { $total } i alt

js-site-filter-matches =
    { $n ->
        [one] { $n } match
       *[other] { $n } matches
    }

js-site-filter-n-of-m = { $n } af { $total }

js-site-filter-n-of-m-rows = { $n } af { $total } rækker

js-site-filter-rows = { $total } rækker

js-site-home-banner-gnss-lost = GNSS tabt · holdover

js-site-home-banner-holdover-out = Holdover · uret uden for værnet

js-site-home-banner-integrity-holdover = Integritetsalarm · holdover fortsætter

js-site-home-banner-integrity-none = Integritetsalarm · intet beskyttelsesniveau

js-site-home-banner-integrity-pl = Integritetsalarm · PL > AL

js-site-home-banner-jamming = Jamming · C/N0 nær gulvet

js-site-home-banner-spoofing = Spoofing-alarm · RF-detektor

js-site-home-cap-holdover = Jammeren går op til { $dbw } dBW: { $trk } satellitter spores. Uret løber frit fra de { $carry } ns, som spooferen efterlod, og krydser sit værn på { $guard } ns ved { $at }; INS'en driver videre.

js-site-home-cap-integrity = Satellitterne vender tilbage, men kun over en maske på { $mask }°: { $trk } spores. Beskyttelsesniveauet overstiger alarmgrænsen på { $al } m eller kan ikke dannes, så overvågningen alarmerer, og uret forbliver i holdover.

js-site-home-cap-jamming = En bredbåndsjammer { $km } km væk med { $dbw } dBW. C/N0 falder til { $cn } dB-Hz, { $above } dB over sporingsgulvet på { $floor } dB-Hz; alle { $trk } satellitter spores stadig.

js-site-home-cap-nominal = { $trk } satellitter spores med en gennemsnitlig C/N0 på { $cn } dB-Hz. Uret er disciplineret efter GNSS-tid, og beskyttelsesniveauet ({ $pl } m) ligger under alarmgrænsen på { $al } m.

js-site-home-cap-recovery = GNSS gensynkroniseret: { $trk } satellitter spores, tidsfejlen tilbage på { $te } ns, beskyttelsesniveau { $pl } m.

js-site-home-cap-spoofing = En spoofer skubber modtagerens ur med { $rate } ns/s. RF-detektoren (radiofrekvens) alarmerer straks; den urstøttede overvågning udløses efter { $det } s og afslutter fasen med { $off } ns trukket ind.

js-site-home-cn-no-lock = 0 af { $max } spores · ingen lås

js-site-home-cn-tracking = { $n } af { $max } spores

js-site-home-no-pl = ingen PL

js-site-home-pause = Sæt missionen på pause

js-site-home-pl-alarm = alarm · PL over AL

js-site-home-pl-no-sats = ingen satellitter, ingen PL

js-site-home-pl-not-computed = beregnes ikke i denne fase

js-site-home-pl-too-few = for få satellitter

js-site-home-pl-under-al = under AL på { $thr } m

js-site-home-play = Afspil missionen

js-site-home-receiver-tracking = Modtager · { $n } spores

js-site-home-replay-restarted = Genafspilning genstartet · { $file }

js-site-home-te-disciplined = disciplineret efter GNSS

js-site-home-te-free-running = holdover · frit løbende

js-site-home-te-outside-guard = holdover · uden for værnet

js-site-home-te-spoofer = spoofer, der trækker uret

js-site-home-thr-floor = gulv

js-site-home-thr-guard = værn

js-site-kind-action = Handling

js-site-mcp-arguments-excerpt = argumenter (uddrag)

js-site-mcp-axis-mission-time = missionstid

js-site-mcp-clock-holdover = { $clock } holdover

js-site-mcp-dir-reply = kshana-mcp → assistent

js-site-mcp-dir-request = assistent → kshana-mcp

js-site-mcp-figcaption = Tegnet ud fra den returnerede serie: hvert urs tidsfejl mod tærsklen

js-site-mcp-fom-availability = tilgængelighed

js-site-mcp-fom-caption = Kvalitetsmål returneret af run_scenario, pr. ur

js-site-mcp-fom-header = Kvalitetsmål

js-site-mcp-fom-holdover = holdover (s)

js-site-mcp-fom-p95 = tidsfejl, 95. percentil (ns)

js-site-mcp-fom-rms = tidsfejl, kvadratisk middelværdi (ns)

js-site-mcp-lede = Optaget { $recorded } · v{ $version } · standard ind og ud · protokol { $protocol } · kun nøjagtige meddelelser

js-site-mcp-legend-gnss-lost = GNSS tabt ved { $s } s

js-site-mcp-legend-threshold = tærskel { $v } ns

js-site-mcp-pause = Pause

js-site-mcp-play = Afspil

js-site-mcp-plot-aria = Tidsfejl for { $quantum } og { $classical } returneret af run_scenario, mod tærsklen på { $threshold } ns; GNSS (globalt satellitnavigationssystem) tabt ved { $lost } s

js-site-mcp-recorded-json = Optaget JSON: { $label }

js-site-mcp-scenario-hash = scenariehash

js-site-mcp-server-identity = serveridentitet

js-site-mcp-show-json = Vis JSON

js-site-mcp-step-aria = Trin { $n } af { $total }: { $name }

js-site-mcp-step-result = resultat: kvalitetsmål

js-site-mcp-step-status = Trin { $n } af { $total } · { $name }

js-site-mcp-summary-excerpt = oversigtslinje og resultat (uddrag)

js-site-mcp-tab-result = resultat

js-site-mcp-threshold = tærskel

js-site-mcp-toml-lines =
    { $n ->
        [one] { $n } linje
       *[other] { $n } linjer
    }

js-site-mcp-toml-more = … ({ $n } linjer mere af { $file })

js-site-mcp-tool-count =
    { $n ->
        [one] { $n } værktøj
       *[other] { $n } værktøjer
    }

js-site-mcp-tools-with-descriptions =
    { $n ->
        [one] { $n } værktøj med beskrivelser
       *[other] { $n } værktøjer med beskrivelser
    }

js-site-menu-close = Luk menuen

js-site-menu-open = Åbn menuen

js-site-missions-avail-title = Tilgængelighed: andel af kørslen med PDOP ≤ { $limit }

js-site-missions-avail-uniform = { $v } % i hver celle

js-site-missions-chart-error-title = positionsfejl (m, log)

js-site-missions-chart-four = fire er nødvendige for en positionsbestemmelse

js-site-missions-chart-four-short = fire til positionsbestemmelse

js-site-missions-chart-lg-earth = Jorden synlig

js-site-missions-chart-lg-error-earth = fejl, relæer og afstand til Jorden

js-site-missions-chart-lg-error-relays = fejl, kun relæer

js-site-missions-chart-lg-relays = relæer i sigte

js-site-missions-chart-relays-title = relæer i sigte · skraveret: Jorden over horisonten

js-site-missions-chip-at-pdop = ved PDOP ≤ { $limit }

js-site-missions-chip-engine = Motor:

js-site-missions-chip-fix-earth = positionsbestemmelse, med Jorden

js-site-missions-chip-median-pdop = median-PDOP

js-site-missions-chip-relays = relæer

js-site-missions-chip-rms = RMS-fejl

js-site-missions-chip-satellites = satellitter

js-site-missions-chip-tracking-held = { $label } sporing holdt

js-site-missions-clocks-aria = Tidsfejl efter et døgns holdover, pr. urklasse, logaritmisk skala

js-site-missions-clocks-frame = systemgulv { $ns } ns

js-site-missions-clocks-note = tidsfejl efter et døgn, sekunder (log)

js-site-missions-clocks-sigma = σy(1 s) { $sigma }

js-site-missions-clocks-title = { $clock }: { $ns } ns efter et døgn, σy(1 s) { $sigma }

js-site-missions-cone-aria = Positionsfejlkegle siden GNSS gik tabt

js-site-missions-cone-axis-x = tid siden GNSS gik tabt (s)

js-site-missions-cone-axis-y = positionsfejl (m)

js-site-missions-cone-budget = ±{ $m } m budget

js-site-missions-cone-clipped = afskåret ved ±{ $m } m

js-site-missions-cone-leaves = forlader ved { $s } s

js-site-missions-cone-readout = t { $t } s · { $errors }

js-site-missions-copy-command = Kopiér kommando

js-site-missions-copy-title = Kopiér kommandoen, der gengiver den

js-site-missions-deterministic = deterministisk

js-site-missions-engine-build = Motor v{ $version }, build

js-site-missions-engine-build-commit = Motor v{ $version }, build { $commit }

js-site-missions-fp-aria = Kort over jammingens aftryk. Piletasterne flytter mellem celler, Enter åbner den kørsel.

js-site-missions-fp-aria-svg = Jammingens aftryk omkring jammeren

js-site-missions-fp-darker = mørkere = højere gennemsnitlig J/S · celler på { $step } km · { $n } motorkørsler

js-site-missions-fp-jammer = jammer

js-site-missions-fp-lg-held = sporing holdt

js-site-missions-fp-lg-lost = hver satellit tabt

js-site-missions-fp-lg-some = nogle epoker tabt

js-site-missions-fp-open = Åbn denne kørsel i { $studio }

js-site-missions-fp-read = omkring { $km } km fra jammeren · gennemsnitlig J/S { $js } dB · sporingstilgængelighed { $av }

js-site-missions-fp-ship = scenariets skib

js-site-missions-grades-aria = Fri inertial drift før { $a } m og { $b } m, pr. IMU-klasse

js-site-missions-grades-axis = sekunders drift efter GNSS er gået tabt (log)

js-site-missions-grades-point = { $grade }: { $s } s til { $m } m ({ $why })

js-site-missions-grades-reaches = fejlen når { $m } m

js-site-missions-grades-speed = ved { $v } m/s

js-site-missions-grades-this = dette scenarie

js-site-missions-hud-earth-link = Jordforbindelse

js-site-missions-hud-link-above = Jordforbindelse · over horisonten

js-site-missions-hud-link-occulted = Jordforbindelse · skjult

js-site-missions-hud-orbiter = Kredsløbsfartøj

js-site-missions-hud-receiver = Modtager

js-site-missions-hud-relays = Relæer

js-site-missions-hud-selected-lat = valgt breddegrad

js-site-missions-info-in-view = I sigte

js-site-missions-info-in-view-value = { $mean } i gennemsnit · { $fewest } færrest

js-site-missions-info-pdop-above = { $pdop }, over { $limit }

js-site-missions-json-title = Motorens resultat, uændret

js-site-missions-json-unavailable = JSON er ikke tilgængelig

js-site-missions-key-avail = Tilgængelighed

js-site-missions-key-pdop-title = Gennemsnitlig PDOP (positionens geometriske forringelse)

js-site-missions-key-vis = Satellitter i sigte

js-site-missions-key-vis-short = I sigte

js-site-missions-leo-grid = af gitteret ved PDOP ≤ { $limit }

js-site-missions-leo-in-view = i sigte i gennemsnit

js-site-missions-leo-shells = satellitter i fire skaller

js-site-missions-map-aria = { $title } over { $body }, pr. celle på 10 grader. Piletasterne flytter modtageren; dens celle aflæses nedenfor.

js-site-missions-map-colour-by = Farvelæg kortet efter

js-site-missions-map-fewest-in-view = færrest i sigte

js-site-missions-map-grey = gråt: ingen positionsbestemmelse

js-site-missions-map-hatched = skraveret: over PDOP-grænsen på { $limit }

js-site-missions-map-in-view = i sigte

js-site-missions-map-live = { $cell }: { $rows }

js-site-missions-map-mean-in-view = gennemsnitligt i sigte

js-site-missions-map-mean-pdop = gennemsnitlig PDOP

js-site-missions-map-pdop-limit = PDOP-grænse { $limit }

js-site-missions-matrix-caption = Scenariefiler efter sektor (rækker) og fejltilstand (kolonner). Vælg et antal for at åbne den sektor.

js-site-missions-matrix-cell =
    { $n ->
        [one] { $sector }, { $mode }: { $n } scenariefil
       *[other] { $sector }, { $mode }: { $n } scenariefiler
    }

js-site-missions-matrix-files =
    { $n ->
        [one] { $n } fil:
       *[other] { $n } filer:
    }

js-site-missions-matrix-sector = Sektor

js-site-missions-mode-int = Interferens

js-site-missions-mode-itg = Integritet

js-site-missions-mode-nav = Drift

js-site-missions-mode-orb = Geometri

js-site-missions-mode-spf = Spoofing

js-site-missions-mode-tim = Tidssynkronisering

js-site-missions-n-of-total = { $n } af { $total }

js-site-missions-no-fix = ingen positionsbestemmelse

js-site-missions-no-seed = deterministisk, intet seed

js-site-missions-open-in-studio = Åbn i { $studio }

js-site-missions-open-report = Åbn motorens rapport

js-site-missions-ow-chart-aria = Modtagerens respons over kørslen for { $name }: relæer i sigte samt positionsfejl med kun relæer og med afstanden til Jorden

js-site-missions-ow-chip-epochs = epoker

js-site-missions-ow-chip-mask = maske

js-site-missions-ow-chip-orbiter = kredsløbsfartøj

js-site-missions-ow-chip-range = afstand σ

js-site-missions-ow-chip-relays = relæer

js-site-missions-ow-chip-relays-value = { $planes } × { $per } på { $alt } km, { $inc }°

js-site-missions-ow-chip-span = spænd

js-site-missions-ow-count-relays = { $n } relæer og et kredsløbsfartøj · { $body }

js-site-missions-ow-count-sats = { $n } satellitter · { $body }

js-site-missions-ow-engine = motor v{ $version } · build { $commit }

js-site-missions-ow-lat-label = Modtagerens breddegrad

js-site-missions-ow-map-aria = Modtagerens respons for { $name }: et kort over { $body } pr. celle på 10 grader, med gennemsnitligt og mindste antal satellitter i sigte samt gennemsnitlig PDOP pr. breddegrad ved siden af

js-site-missions-ow-note-imagery = Billeder af { $body }: NASA.

js-site-missions-ow-note-rebuilt = Baner: relæerne og kredsløbsfartøjet genopbygget ud fra scenariet nøjagtigt, som motoren bygger dem; antallet af satellitter i sigte, som de giver, er lig med motorens ved alle { $n } epoker.

js-site-missions-ow-note-sats = Baner: kørslens satellitter genpropageret her og kontrolleret mod alle { $n } jordsporsprøver, som motoren skrev (værst { $deg }°).

js-site-missions-ow-note-scaled = Banernes radier er skaleret til visning; planer, faseforskydning og omløbstider er kørslens egne.

js-site-missions-ow-note-tracks = Motoren skrev jordspor for { $shown } af de { $total } satellitter; alle { $total } tegnes ud fra dens skaller.

js-site-missions-ow-note-walker = Baner: kørslens Walker-skaller genpropageret her og kontrolleret mod alle { $n } jordsporsprøver, som motoren skrev (værst { $deg }°).

js-site-missions-ow-off = fra

js-site-missions-ow-on = til

js-site-missions-ow-pause = Sæt banerne på pause

js-site-missions-ow-play = Afspil banerne

js-site-missions-ow-time = t = { $time }

js-site-missions-ow-time-label = Missionstid

js-site-missions-ow-valuetext = { $time }, { $n } relæer i sigte

js-site-missions-pdop-title = Gennemsnitlig PDOP (positionens geometriske forringelse), logaritmisk skala, lavere er bedre

js-site-missions-report = Rapport

js-site-missions-report-title = Motorens egen rapport om denne kørsel

js-site-missions-ro-above-horizon = over horisonten

js-site-missions-ro-availability = Tilgængelighed, PDOP ≤ { $limit }

js-site-missions-ro-earth-light = Jorden · lystid { $s } s

js-site-missions-ro-error-relays = Positionsfejl, kun relæer

js-site-missions-ro-occulted = skjult

js-site-missions-ro-place-availability = Ved { $place }: tilgængelighed

js-site-missions-ro-place-in-view = Ved { $place }: i sigte, gennemsnit · færrest

js-site-missions-ro-relays = Relæer i sigte

js-site-missions-ro-satellites = Satellitter

js-site-missions-ro-with-earth = Med afstanden til Jorden

js-site-missions-run-failed = Den optagede kørsel kunne ikke indlæses her; åbn den i { $studio } fra linket nedenfor.

js-site-missions-seed = seed { $seed }

js-site-missions-spoof-aria = Spoofing-forskydning mod tid, med hver overvågnings detektionsgrænse og detektionstid

js-site-missions-spoof-axis-x = tid siden spoofingen begyndte (s)

js-site-missions-spoof-axis-y = tidsforskydning (ns)

js-site-missions-spoof-detects = { $id } detekterer ved { $s } s

js-site-missions-spoof-lg-bound = { $id }-grænse

js-site-missions-spoof-lg-offset = spoofing-forskydning

js-site-missions-spoof-readout = t { $t } s · forskydning { $offset } ns

js-site-missions-spoof-spec = spec { $v } ns

js-site-missions-sr-aria = { $members }; delt jammer { $power } dBW

js-site-missions-sr-aria-member = { $label }: sporing holdt { $held } %, gennemsnitligt jammer-til-signal-forhold { $js } dB, færrest sporede satellitter { $min }

js-site-missions-sr-car = Bil

js-site-missions-sr-fewest = færrest sporede

js-site-missions-sr-held = sporing holdt

js-site-missions-sr-mean-js = gennemsnitlig J/S

js-site-missions-sr-ship = Skib

js-site-missions-swipe =
    { $n ->
        [one] Stryg for at se hele { $n } scenariefilen
       *[other] Stryg for at se alle { $n } scenariefiler
    }

js-site-missions-toml-download-title = Download scenariefilen, der kørte

js-site-missions-toml-title = Scenariefilen, der kørte

js-site-missions-vis-title = Satellitter i sigte, gennemsnit over kørslen

js-site-missions-vis-uniform = { $v } i hver celle

js-site-palette-none = Ingen resultater

js-site-palette-results = { $count } resultater

js-site-pro-band-at = Ved { $minutes } minutter: 5. til 95. percentil

js-site-pro-band-range = { $lo } til { $hi } { $unit }

js-site-pro-band-runs-within = af { $n } kørsler inden for ±{ $limit } { $unit }

js-site-pro-design-readout = { $sat } satellitter, { $av } % tilgængelighed · { $planes } planer på { $alt } km, { $incl }°

js-site-pro-front-design = Frontudformning { $id }

js-site-pro-front-design-knee = Frontudformning { $id } · knæ

js-site-pro-more-designs =
    { $n ->
        [one] (+{ $n } frontudformning mere ved dette punkt)
       *[other] (+{ $n } frontudformninger mere ved dette punkt)
    }

js-site-pro-not-rerun = ikke kørt igen

js-site-pro-rerun-free = kørt igen i den gratis motor:

js-site-pro-same-sha = samme SHA-256 { $sha }…

js-site-pro-same-sha-index = samme resultat-SHA-256 som indekset

js-site-toast-copied = Kopieret: { $text }

js-site-toast-data-failed = Datafilen kunne ikke indlæses

js-site-toast-data-saved = Data gemt som CSV

js-site-toast-no-data = Ingen data for dette diagram

js-site-toast-svg-saved = Diagram gemt som SVG

js-site-toast-table-saved = Tabel gemt som CSV

js-site-waterfall-axis-now = nu

js-site-waterfall-bar-title = { $band }: { $cn0 } dB-Hz, { $state }

js-site-waterfall-bar-title-js = { $band }: { $cn0 } dB-Hz, { $state }, J/S { $js } dB

js-site-waterfall-below-floor = signalerne ligger under støjgulvet

js-site-waterfall-campaign-drives = Kampagne, den driver:

js-site-waterfall-campaign-seed = seed { $seed } · { $phases } faser over { $duration } s

js-site-waterfall-chip-aria = { $band }, { $fc } megahertz: vis dette bånd

js-site-waterfall-chip-title = { $band } · { $fc } MHz · modtagerbåndbredde { $bw } MHz

js-site-waterfall-engine-build = Motor v{ $version } · build

js-site-waterfall-fallback-head = Galileo-reserve · { $s } s, kun CW-tone

js-site-waterfall-fallback-text = { $band } tilbage på { $v } dB-Hz. Integritetsovervågning alene på Galileo: beskyttelsesniveau { $min }–{ $max } m, under alarmgrænsen på { $limit } m.

js-site-waterfall-floor = sporingsgulv på { $thr } dB-Hz

js-site-waterfall-holdover-head = Holdover · { $s } s, chirp til

js-site-waterfall-holdover-text = { $band0 } { $v0 }, { $band1 } { $v1 } dB-Hz, under gulvet. Uret løber frit: værst { $worst } ns mod et værn på { $guard } ns.

js-site-waterfall-jammer-off = { $what } fra

js-site-waterfall-jammer-on = { $what } til

js-site-waterfall-live = { $freq } megahertz, { $time }: { $detail }

js-site-waterfall-live-band = { $band } { $cn0 } dB-Hz, { $state }

js-site-waterfall-live-none = intet modelleret bånd

js-site-waterfall-load-failed = Den optagede kørsel kunne ikke indlæses. Motorens rapport nedenfor viser den samme kørsel.

js-site-waterfall-no-jammer-band = Ingen jammer i dette bånd

js-site-waterfall-no-jammer-in-band = ingen jammer i båndet

js-site-waterfall-no-seed = deterministisk, intet seed

js-site-waterfall-onset-head = Begyndelse · { $t0 }–{ $t1 } s

js-site-waterfall-onset-text = Alle { $n } bånd spores, indtil spektrumkørslen første gang mister { $band } ved { $s } s.

js-site-waterfall-pause = Sæt vandfaldet på pause

js-site-waterfall-play = Afspil vandfaldet

js-site-waterfall-quiet-band = { $band } { $cn0 } dB-Hz · { $state }

js-site-waterfall-run-time = kørsel T+{ $s } s

js-site-waterfall-scale-caption = PSD over gulvet på { $floor } dBW/Hz · celler på { $bin } MHz × { $step } s

js-site-waterfall-seed = seed { $seed }

js-site-waterfall-short-lost = tabt

js-site-waterfall-short-ok = spor.

js-site-waterfall-short-rec = genv.

js-site-waterfall-state-lost = Tabt lås

js-site-waterfall-state-lost-low = tabt lås

js-site-waterfall-state-ok = Sporer

js-site-waterfall-state-ok-low = sporer

js-site-waterfall-state-rec = Genvundet

js-site-waterfall-state-rec-low = genvundet

js-site-waterfall-summary-recovers = { $band } mister låsen ved { $lost } s og genvinder den ved { $rec } s, laveste { $min } dB-Hz.

js-site-waterfall-summary-rows = { $n } rækker á { $step } s.

js-site-waterfall-summary-stays-lost = { $band } mister låsen ved { $lost } s og forbliver tabt, laveste { $min } dB-Hz.

js-site-waterfall-summary-tracks = { $band } spores hele tiden, laveste { $min } dB-Hz.

js-site-waterfall-tip-above-floor = over støjgulvet

js-site-waterfall-tip-at-floor = Ved det termiske støjgulv

js-site-waterfall-tip-band = { $cn0 } dB-Hz · { $state }

js-site-waterfall-tip-head = { $lo }–{ $hi } MHz · { $time }

js-site-waterfall-tip-js = J/S { $js } dB

js-site-waterfall-tip-no-band = Intet modelleret bånds modtagerbåndbredde dækker denne kolonne

js-site-waterfall-wave-chirp = chirp

js-site-waterfall-wave-cw = CW-tone

js-site-waterfall-wave-noise = støj

js-site-waterfall-who-cursor = Bånd under markøren

js-site-waterfall-who-selected = Valgt bånd

js-site-waterfall-who-worst = Dårligste bånd
