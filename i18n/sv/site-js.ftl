# site-js.ftl (sv): translations

js-app-engine-failed = Motorn kunde inte läsas in ({ $reason }).

js-ledger-rows =
    { $n ->
        [one] { $n } registerrad
       *[other] { $n } registerrader
    }

js-site-action-copy-install = Kopiera: cargo install kshana

js-site-action-launch = Starta { $name }

js-site-action-licence = Prata med oss om en kommersiell licens

js-site-action-pro-eval = Begär en utvärdering av Kshana Pro

js-site-action-study = Begär en studie

js-site-action-theme = Växla mellan ljust och mörkt tema

js-site-capabilities-bd-after = { $m } m efter { $s } s

js-site-capabilities-bd-combined = kombinerat

js-site-capabilities-bd-crossing = { $m } m vid { $s } s

js-site-capabilities-bd-fig-crossing = «{ $m } m» efter { $s } s, dominerat av { $dom }

js-site-capabilities-bd-fig-lead = Tid sedan GNSS gick förlorat på logaritmisk axel, en IMU av klass { $grade } vid { $speed } m/s:

js-site-capabilities-bd-fig-tail = Linjerna är motorns tillväxtlagar för korta drivperioder och deras kvadratiska summa; skärningspunkterna kommer från motorns fullständiga felmodell med nio tillstånd (Schuler), som begränsar biastermerna, så vid långa drivperioder inträffar varje skärning något senare än linjen når den. Staplarna: samma skärningspunkter för fyra IMU-klasser.

js-site-capabilities-cd-canvas-aria = Konstellation runt sin himlakropp, verkliga bilder: dra eller använd piltangenterna för att vrida, plus och minus för att zooma

js-site-capabilities-cd-design-meta = { $n } satelliter · { $body } · { $file }

js-site-capabilities-cd-foot-frozen = Varje satellit följer motorns egen bana; radien för den frusna omloppsbanan kommer från skalets element.

js-site-capabilities-cd-foot-mean-motion = Varje satellit följer motorns egen bana, med den radie som dess medelrörelse ger.

js-site-capabilities-cd-foot-walker = Alla { $n } satelliter är placerade utifrån skalens egna Walker-parametrar (kontrollerat mot motorns { $shown } banor: sämst { $deg }°); spåren är motorns { $shown } banor.

js-site-capabilities-cd-hud-body = { $body } · «{ $n }» satelliter

js-site-capabilities-cd-hud-mission = Uppdrag «{ $time }»

js-site-capabilities-cd-legend-shell = skal { $n } · { $inc }°

js-site-capabilities-cd-map-availability = Andel av körningen med PDOP ≤ { $limit } (0 till 100 %)

js-site-capabilities-cd-map-pdop = Medel-PDOP per cell på { $step }° ({ $lo } till { $hi }; ljusare är bättre)

js-site-capabilities-cd-map-visible = Genomsnittligt antal satelliter i sikte ({ $lo } till { $hi })

js-site-capabilities-cd-metric-availability = Tillgänglighet

js-site-capabilities-cd-metric-pdop = Medel-PDOP

js-site-capabilities-cd-metric-visible = I sikte

js-site-capabilities-cd-no-webgl = 3D-vyn kräver WebGL; täckningskartan och diagrammen är samma körning.

js-site-capabilities-cd-pause = Pausa banorna

js-site-capabilities-cd-play = Spela upp banorna

js-site-capabilities-cd-shell = { $name }: Walker { $pattern } { $total }/{ $planes }/{ $phasing } · { $alt } km · { $inc }°

js-site-capabilities-cd-slots = { $name }: { $n } satelliter, operatörens platstabell

js-site-capabilities-cd-span = av { $dur }, i loop

js-site-capabilities-cd-stat-in-view = Medel i sikte

js-site-capabilities-cd-stat-mask = Mask · körning

js-site-capabilities-cd-stat-median = Median-PDOP

js-site-capabilities-cd-stat-pdop = PDOP ≤ { $limit }, hela { $body }

js-site-capabilities-cd-stat-satellites = Satelliter

js-site-capabilities-cd-stat-worst = Sämsta plats

js-site-capabilities-cd-title-gnss = Fyra GNSS tillsammans

js-site-capabilities-cd-title-leo = Megakonstellation i låg jordbana

js-site-capabilities-cd-title-lunar = Månreläuppsättning

js-site-capabilities-cd-work-ratio = { $pct } % efter latitudförfiltret · { $dop } DOP-lösningar

js-site-capabilities-cd-work-tests = { $after } satellit-punkttester av de { $brute } som en uttömmande genomsökning skulle göra

js-site-capabilities-cd-work-title = Siktbarhetsarbete

js-site-capabilities-cg-cn0-sub = C/N0 mot spårningsgolvet

js-site-capabilities-cg-cn0-title = Bärvåg-till-brus-täthet

js-site-capabilities-cg-compose-availability = Tillgänglighet

js-site-capabilities-cg-compose-fewest = Minst antal spårade

js-site-capabilities-cg-compose-js = Medel-J/S

js-site-capabilities-cg-compose-text = En jammer, { $power } { $unit }, på en plats, bunden till { $n } medlemskörningar av slaget ‹{ $kind }›: ett fartyg i ett sund och en bil på en kustväg ser samma orsak och får olika svar.

js-site-capabilities-cg-log-campaign = kampanj { $file } · { $phases } faser · { $runs } medlemskörningar

js-site-capabilities-cg-log-phase = fas { $name } börjar

js-site-capabilities-cg-log-phase-carries = fas { $name } börjar · för med sig { $carried }

js-site-capabilities-cg-monte-axis = slutligt klockfel över { $n } frön ({ $path })

js-site-capabilities-cg-monte-ci = Medelvärde, 95 %-intervall

js-site-capabilities-cg-monte-mean = Medelvärde

js-site-capabilities-cg-monte-p05 = 5:e

js-site-capabilities-cg-monte-p05-p95 = 5:e till 95:e

js-site-capabilities-cg-monte-p50 = median

js-site-capabilities-cg-monte-p95 = 95:e

js-site-capabilities-cg-monte-std = Standardavvikelse

js-site-capabilities-cg-monte-text = Samma ‹{ $kind }›-scenario körs { $n } gånger från basfröet { $seed }, ett frö per körning: spridningen i den fritt gående klockans slutfel, med dess 95 %-konfidensintervall för medelvärdet.

js-site-capabilities-cg-not-in-phase = inte i den här fasen

js-site-capabilities-cg-now = Fas { $n } av { $total }: { $name } · { $from } till { $to }

js-site-capabilities-cg-phase-title = { $name }: { $from } till { $to } · avslutas av { $by } · medlemsslag { $kinds }

js-site-capabilities-cg-pl-sub = mot varningsgränsen

js-site-capabilities-cg-pl-title = Skyddsnivå

js-site-capabilities-cg-pos-sub = mot sin budget · log

js-site-capabilities-cg-pos-title = Tröghetspositionsfel

js-site-capabilities-cg-range = { $lo } till { $hi }

js-site-capabilities-cg-sweep-all-lost = Alla förlorade från

js-site-capabilities-cg-sweep-axis = jammerns sändareffekt ({ $key })

js-site-capabilities-cg-sweep-first-loss = Första förlusten

js-site-capabilities-cg-sweep-lg-availability = tillgänglighet

js-site-capabilities-cg-sweep-lg-js = medel-J/S

js-site-capabilities-cg-sweep-never = aldrig

js-site-capabilities-cg-sweep-nodes = Noder

js-site-capabilities-cg-sweep-none = ingen

js-site-capabilities-cg-sweep-span = J/S-spann

js-site-capabilities-cg-sweep-text = Ett ‹{ $kind }›-scenario, som körs en gång per nod medan jammerns sändareffekt stegas från { $from } till { $to } { $unit }. Tillgänglighet under jamming (heldragen) och medel-J/S (streckad) kommer från varje medlemskörnings egna kvalitetsmått.

js-site-capabilities-cg-te-sub = mot sitt skydd

js-site-capabilities-cg-te-title = Klockans tidsfel

js-site-capabilities-copy = Kopiera

js-site-capabilities-copy-aria = Kopiera kommandot som återskapar körningen: kshana { $file }

js-site-capabilities-cz-best = Bästa PDOP

js-site-capabilities-cz-failed = Den registrerade körningen kunde inte läsas in här; öppna den i Studio i stället.

js-site-capabilities-cz-fix = Sampel med positionsbestämning

js-site-capabilities-cz-fix-value = { $n } av { $total } ({ $pct }%)

js-site-capabilities-cz-median = Median-PDOP

js-site-capabilities-engine = Motor v{ $version }

js-site-capabilities-engine-build = Motor v{ $version }, bygge

js-site-capabilities-engine-report = Motorrapport

js-site-capabilities-globe-aria = { $name } på sina verkliga bilder ({ $credit }). Dra eller använd piltangenterna för att vrida den; plus och minus zoomar.

js-site-capabilities-ho-ends = körningen slutar vid { $t }

js-site-capabilities-ho-past-guard = bortom skyddet

js-site-capabilities-no-seed = deterministisk, inget frö

js-site-capabilities-open-in-studio = Öppna i { $studio }

js-site-capabilities-open-report = Öppna motorns rapport

js-site-capabilities-orrery-aria = Solsystemet vid körningens epok: dra eller använd piltangenterna för att vrida, plus och minus för att zooma

js-site-capabilities-orrery-bodies = { $n } himlakroppar · observatör «{ $observer }»

js-site-capabilities-orrery-epoch = Epok «{ $epoch }» · TDB (Barycentric Dynamical Time), juliansk dag { $jd }

js-site-capabilities-pnt-chart-title = reläer i sikte (linje) · jorden över horisonten (skuggat) · fyra behövs för en positionsbestämning

js-site-capabilities-pnt-kicker = Positionering vid den här himlakroppen · body-pnt-slag

js-site-capabilities-pnt-lander = En landare vid { $lat }°, { $lon }° på ytan navigerar på reläerna, med ett tvåvägsavstånd från jorden så snart jorden är över horisonten (enkelriktad ljustid { $min } min). Tillgänglighet: { $a } % enbart på reläerna, { $b } % med jordlänken.

js-site-capabilities-pnt-orbiter = En användare i omloppsbana navigerar på reläerna, med ett tvåvägsavstånd från jorden så snart jorden är över horisonten (enkelriktad ljustid { $min } min). Tillgänglighet: { $a } % enbart på reläerna, { $b } % med jordlänken.

js-site-capabilities-pnt-relays = { $n } reläer på { $alt } km runt { $body }

js-site-capabilities-report-data = Rapport och data

js-site-capabilities-result-data = Resultatdata

js-site-capabilities-saved = Sparade { $name }

js-site-capabilities-scenario-file = Scenariofil

js-site-capabilities-seed = frö { $seed }

js-site-capabilities-six-clock-fig = «{ $id }» håller skyddet i { $dur }

js-site-capabilities-six-clock-guard = { $v } ns skydd

js-site-capabilities-six-coast-budget = { $m } m budget

js-site-capabilities-six-coast-denied = GNSS nekat

js-site-capabilities-six-coast-fig = «{ $id }» inom budgeten i { $s } s

js-site-capabilities-six-floor = spårningsgolv

js-site-capabilities-six-integ-fig = «{ $ok }» av { $n } epoker tillgängliga · varningsgränser { $h } m horisontellt, { $v } m vertikalt

js-site-capabilities-six-integ-limit = vertikal varningsgräns

js-site-capabilities-six-integ-pl = vertikal (heldragen) och horisontell (streckad) skyddsnivå

js-site-capabilities-six-jam-effective = effektivt, { $n } satelliter

js-site-capabilities-six-jam-fig = Spårade «{ $min }» av { $max } i sikte · tillgänglighet under jamming «{ $av }» (nominellt { $nom }) · medel-J/S «{ $js } dB»

js-site-capabilities-six-jam-nominal = nominellt, ingen jammer (streckad)

js-site-capabilities-six-orbit-fig = Höjd «{ $lo }–{ $hi } km» · markspår över { $dur }

js-site-capabilities-six-orbit-label = { $source } · { $n } sampel

js-site-capabilities-six-orbit-sgp4 = SGP4 från en tvåradig elementuppsättning

js-site-capabilities-six-spoof-detects = { $id } upptäcker

js-site-capabilities-six-spoof-fig = «{ $id }» upptäcker vid { $s } s (gräns { $ns } ns)

js-site-capabilities-ss-angle = Vinkel från solen

js-site-capabilities-ss-credit = Bilder: { $credits }. * Kartan når inte ända till polerna; gapet får kartans genomsnittsfärg för polerna. Saturnus ringar: { $ring } ({ $licence }).

js-site-capabilities-ss-days = { $v } dygn

js-site-capabilities-ss-frame-origin = Systemets origo

js-site-capabilities-ss-from-sun = Från solen

js-site-capabilities-ss-gloss = NAIF: himlakroppens kod hos NASA:s Navigation and Ancillary Information Facility. GM: gravitationsparameter. J2: avplattningsterm. IAU-pol: rotationspolen enligt Internationella astronomiska unionen, som rektascension (RA) och deklination (Dec).

js-site-capabilities-ss-j2-none = ingen publicerad

js-site-capabilities-ss-kind = { $class } · NAIF { $naif }

js-site-capabilities-ss-kind-of = { $class } till { $parent } · NAIF { $naif }

js-site-capabilities-ss-light-time = Ljustid från { $observer }

js-site-capabilities-ss-link = { $from } till { $to }, enkelriktad ljustid { $one }, tur och retur { $two }

js-site-capabilities-ss-links-lead =
    { $n ->
        [one] Länk som den här körningen beräknar:
       *[other] Länkar som den här körningen beräknar:
    }

js-site-capabilities-ss-moons =
    { $n ->
        [one] Dess måne, skalenlig, vid epoken
       *[other] Dess månar, skalenliga, vid epoken
    }

js-site-capabilities-ss-nominal-error = nominellt fel { $km } km i avstånd

js-site-capabilities-ss-north = Sett från ekliptikans norra sida.

js-site-capabilities-ss-period = Omloppstid

js-site-capabilities-ss-period-about = Omloppstid runt { $parent }

js-site-capabilities-ss-pole = IAU-pol (RA, Dec)

js-site-capabilities-ss-radius = Medelradie

js-site-capabilities-ss-retrograde = { $v } h, retrograd

js-site-capabilities-ss-rotation = Siderisk rotation

js-site-capabilities-ss-years = { $v } år

js-site-capabilities-st-bound = { $v } m gräns

js-site-capabilities-st-fig-none = { $n } epoker, ingen med felet över sin gräns. Tvärs: det verkliga positionsfelet; uppåt: skyddsnivån; båda på logaritmiska axlar.

js-site-capabilities-st-fig-some = { $n } epoker, { $k } med felet över sin gräns. Tvärs: det verkliga positionsfelet; uppåt: skyddsnivån; båda på logaritmiska axlar.

js-site-capabilities-st-limit = varningsgräns { $m } m

js-site-capabilities-st-misleading = vilseledande: felet över gränsen

js-site-capabilities-st-normal = normal drift

js-site-capabilities-st-unavailable = otillgänglig: gränsen över varningsgränsen

js-site-capabilities-studio-embedded = { $studio }, inbäddad: körningen orbit-multignss

js-site-capabilities-studio-load = Läs in { $studio } här

js-site-capabilities-studio-outline = Visa översikten igen

js-site-capabilities-wave-chirp = chirp

js-site-capabilities-wave-cw = CW-ton

js-site-capabilities-wave-noise = brus

js-site-capabilities-wf-an-caption = rad T+{ $t } s · dB över golvet, logaritmisk skala · toppvärde för hela rutnätet { $peak } dB

js-site-capabilities-wf-degraded = Försämrad

js-site-capabilities-wf-degraded-low = försämrad

js-site-capabilities-wf-failed = Den registrerade körningen kunde inte läsas in här.

js-site-capabilities-wf-grid = rutnät

js-site-capabilities-wf-iq = Vid T+{ $t } s ritar motorn också modellen som { $n } IQ-sampel (fas och kvadratur) kring { $mhz } MHz och kontrollerar en Welch-skattning ({ $segments } segment om { $nfft }) mot den: integrerat effektförhållande { $ratio }.

js-site-capabilities-wf-jammer-off = { $what } av

js-site-capabilities-wf-jammer-on = { $what } på

js-site-capabilities-wf-jammer-open = { $name } · { $mhz } MHz · från { $on } s till slutet

js-site-capabilities-wf-jammer-span = { $name } · { $mhz } MHz · { $on }–{ $off } s

js-site-capabilities-wf-lost = Förlorad låsning

js-site-capabilities-wf-lost-low = förlorad låsning

js-site-capabilities-wf-max = { $peak } dB över den · logaritmisk skala från { $v0 } dB

js-site-capabilities-wf-no-jammer = ingen jammer

js-site-capabilities-wf-now = nu

js-site-capabilities-wf-pause = Pausa vattenfallet

js-site-capabilities-wf-peak = topp { $v } dB

js-site-capabilities-wf-play = Spela upp vattenfallet

js-site-capabilities-wf-replay-previous = start på uppspelningen · föregående pass nedanför

js-site-capabilities-wf-replay-start = start på uppspelningen

js-site-capabilities-wf-say = T+{ $t } s, { $band } { $v } dB-Hz, { $state }

js-site-capabilities-wf-signal = signal +{ $v } dB

js-site-capabilities-wf-summary = Registrerad körning av { $file }: { $bands } band, { $jammers } jammers över { $seconds } sekunder. Det sämsta bandet, { $worst }, faller till { $min } dB-Hz vid { $at } s; spårningsgolv { $floor } dB-Hz.

js-site-capabilities-wf-tip-above = { $v } dB över brusgolvet

js-site-capabilities-wf-tip-in = i { $bands }

js-site-capabilities-wf-tracking = Spårar

js-site-capabilities-wf-tracking-low = spårar

js-site-caphero-aria = Solsystemet från motorns solsystemskörning vid { $date }: solen och { $bodies } himlakroppar som rör sig längs sina banor från motorn; { $valid } av banorna är validerade mot JPL Horizons.

js-site-caphero-clock = +{ $days } dygn · { $date }

js-site-caphero-copy-command = Kopiera kommando

js-site-caphero-copy-title = Kopiera kommandot som återskapar den

js-site-caphero-credits = Avstånd komprimerade på logaritmisk skala, riktningar sanna; himlakroppar förstorade, rotation i visningstakt. Bilder: { $credits }; Saturnus ringar: { $ring } ({ $licence }).

js-site-caphero-credits-summary = Skala och bildkrediter

js-site-caphero-engine-build = Motor v{ $version }, bygge

js-site-caphero-explore = Utforska varje himlakropp

js-site-caphero-file-title = Scenariofilen som kördes

js-site-caphero-list-item = { $name }: { $label }, { $au } au från solen vid epoken, omloppstid { $period }.

js-site-caphero-list-item-light = { $name }: { $label }, { $au } au från solen vid epoken, omloppstid { $period }, ljustid från { $observer } { $light }.

js-site-caphero-no-seed = deterministisk, inget frö

js-site-caphero-open-in-studio = Öppna i { $studio }

js-site-caphero-pause = Pausa banorna

js-site-caphero-period-days = { $value } dygn

js-site-caphero-period-years = { $value } år

js-site-caphero-play = Spela upp banorna

js-site-caphero-rate = { $days } dygn av körningen per sekund

js-site-caphero-rate-epoch = Bilden vid körningens epok

js-site-caphero-read-distance = { $au } au från solen

js-site-caphero-read-light = ljustid från { $observer } vid epoken { $light }

js-site-caphero-read-orbit = bana { $period }

js-site-caphero-seed = frö { $seed }

js-site-copy-aria = Kopiera: { $cmd }

js-site-developers-captured-from = fångad { $recorded } från

js-site-developers-engine-build = Motor v{ $version }, bygge

js-site-developers-exit-stamp = avslut { $rc } · { $ms } ms

js-site-developers-file-open-in-studio = { $file }: öppna i { $studio }

js-site-developers-no-seed = (deterministisk, inget frö)

js-site-developers-open-in-studio = Öppna i { $studio }

js-site-developers-pause = Pausa uppspelningen

js-site-developers-play = Spela upp uppspelningen

js-site-developers-replaying = # spelar upp den registrerade sessionen

js-site-developers-seed = (frö { $seed })

js-site-developers-what-runs-write = Vad varje körning skriver

js-site-editions-builds-on-it = { $label } bygger på den

js-site-editions-core-kinds =
    { $n ->
        [one] { $n } slag
       *[other] { $n } slag
    }

js-site-editions-core-title = Öppen kärna

js-site-editions-core-validated = validerade

js-site-editions-core-validated-of = { $validated } av { $total }

js-site-editions-free-core = Gratis i den öppna kärnan, som alla slag

js-site-editions-group-other = Övrigt

js-site-editions-kind-no-ledger = ingen registermodul matchar den på namn

js-site-editions-kind-validated = { $v } av { $tot } registerrader validerade

js-site-editions-pause = Pausa ringarna

js-site-editions-play = Spela upp ringarna

js-site-editions-ring-pro = Kshana Pro

js-site-editions-ring-study = Anpassad studie

js-site-evidence-allan-aria = Fyra avvikelser för NIST SP 1065:s datamängd med 1000 punkter mot medelvärdesbildningstid; alla { $n } publicerade värden återskapades, sämsta relativa fel { $err }

js-site-evidence-allan-lg-published = publicerat värde, SP 1065 tabell 31

js-site-evidence-allan-mdev = modifierad Allan-avvikelse

js-site-evidence-allan-na = saknas

js-site-evidence-allan-oadev = överlappande Allan-avvikelse

js-site-evidence-allan-ohdev = överlappande Hadamard-avvikelse

js-site-evidence-allan-read = { $tau } s · Allan { $oadev } · modifierad { $mdev } · Hadamard { $ohdev }

js-site-evidence-allan-st-gate = testets gräns

js-site-evidence-allan-st-reproduced = publicerade värden återskapade

js-site-evidence-allan-st-worst = sämsta relativa fel

js-site-evidence-allan-tdev = tidsavvikelse, i sekunder

js-site-evidence-allan-tip-at = «{ $name }» vid { $m } s

js-site-evidence-allan-tip-engine = motor: «{ $got }» · relativt fel { $err }

js-site-evidence-allan-tip-table = SP 1065 tabell 31: «{ $want }»

js-site-evidence-cell-tip = Förmåga { $i } av { $n } · «{ $label }»

js-site-evidence-cowell-aria = Positionsskillnad mot Orekit över 24 timmar: kraftnivåerna 1 till 5 håller sig under { $worst }; luftmotståndsnivån når { $drag }, ett karakteriseringsband

js-site-evidence-cowell-gto = geostationär transferbana

js-site-evidence-cowell-leo = låg jordbana

js-site-evidence-cowell-lg-con = nivå 1 till 5, tvåkroppsproblem upp till solstrålningstryck, två banor vardera

js-site-evidence-cowell-lg-drag = nivå 6, luftmotstånd: endast karakterisering (olika densitetsmodeller)

js-site-evidence-cowell-read = { $h } h · nivå 1 till 5 sämst { $con } · luftmotstånd { $drag }

js-site-evidence-cowell-st-drag = luftmotståndsnivå, sämst

js-site-evidence-cowell-st-epochs = epoker i nivå 1 till 5

js-site-evidence-cowell-tip-tier = «Nivå { $tier }: { $label }» · { $regime }

js-site-evidence-cowell-tip-worst = sämsta skillnad «{ $err }» vid { $h } h

js-site-evidence-hero-live = { $label }. { $cap }. { $oracle }

js-site-evidence-hero-no-oracle = Ingen extern oberoende referens angiven.

js-site-evidence-hero-oracle = Oberoende referens

js-site-evidence-hero-oracle-is = Oberoende referens: { $o }

js-site-evidence-hero-owner = Ägare

js-site-evidence-hero-partner = En partner äger detta; motorn gör inga anspråk på något av det.

js-site-evidence-hero-pause = Pausa svepet

js-site-evidence-hero-play = Spela upp svepet

js-site-evidence-hero-row = Rad { $i } av { $n }

js-site-evidence-hold-accepted = godtagen: inom en faktor { $bar }

js-site-evidence-hold-aria = Uppmätt effektivvärde för tidsfelet hos cesiumklockan mot drivtiden, med motorns prediktion; predikterat över uppmätt överskrider gränsen från { $lo } till { $hi }

js-site-evidence-hold-control = «Kontroll:» den naiva prediktionen (stabiliteten vid en sekund tolkad som vitt frekvensbrus) ger kvoten { $ratio }, fel med en faktor på ungefär { $factor }, och underkänns mot samma tröskel. Tröskeln är inte tandlös.

js-site-evidence-hold-lg-meas = uppmätt på den undanhållna registreringen (punkt: överskridande)

js-site-evidence-hold-lg-pred = predikterad från första tredjedelen (ring: överskridande)

js-site-evidence-hold-nodata = Den uppmätta registreringen fanns inte tillgänglig när den här sidan genererades.

js-site-evidence-hold-perfect = 1 = perfekt

js-site-evidence-hold-ratio-aria = Predikterat över uppmätt för { $n } gränsvärden, alla inom den godtagna faktorn { $bar }

js-site-evidence-hold-read = drift { $h } h · uppmätt { $m } ns · predikterat { $p } ns

js-site-evidence-hold-st-fit = använd för anpassningen

js-site-evidence-hold-st-samples = sampel med en sekunds intervall

js-site-evidence-hold-st-syncs = undanhållna synkpunkter

js-site-evidence-hold-tip-breach = predikterat överskridande { $p } s · uppmätt { $m } s

js-site-evidence-hold-tip-error = «Tidsfel { $thr } ns»

js-site-evidence-hold-tip-ratio = predikterat över uppmätt «{ $ratio }»

js-site-evidence-hold-tip-row = «{ $thr } ns» · predikterat över uppmätt «{ $ratio }»

js-site-evidence-kernel-chi2-cdf = chi-kvadratfördelning

js-site-evidence-kernel-chi2-quantile = chi-kvadratkvantil

js-site-evidence-kernel-noncentral = icke-central chi-kvadrat

js-site-evidence-kernel-normal-cdf = normalfördelning

js-site-evidence-kernel-normal-quantile = normalkvantil

js-site-evidence-kernel-pbias = detektionsbias

js-site-evidence-ladder-aria = Banresidualer från { $lo } till { $hi } m på en logaritmisk skala, med myndighetströskeln { $bar } m

js-site-evidence-ladder-bar = myndighetströskel { $bar } m

js-site-evidence-ladder-cowell = Cowell mot Orekit 12.2, sämst

js-site-evidence-ladder-g24 = Galileo E11, anpassning över 24 timmar

js-site-evidence-ladder-g8 = Galileo E11, anpassning över 8 timmar

js-site-evidence-ladder-lg-headline = huvudresidual

js-site-evidence-ladder-lg-over = över myndighetströskeln { $bar } m

js-site-evidence-ladder-lg-ring = enbart kraftmodellen, före empiriska accelerationer

js-site-evidence-ladder-lro = Lunar Reconnaissance Orbiter, anpassning över 4 timmar

js-site-evidence-ladder-read = svep vid { $v } · { $n } av { $total } huvudresidualer vid eller under det

js-site-evidence-ladder-rt-arc = { $arc }-båge · grad och ordning { $do } · { $n } observationer

js-site-evidence-ladder-rt-rtn = radiellt { $r } m · längs banan { $a } m · tvärs banan { $c } m

js-site-evidence-ladder-sgp4 = SGP4 mot AIAA-vektorerna, sämst

js-site-evidence-ladder-swarm = Swarm-A, anpassning över 3 timmar

js-site-evidence-ladder-tip-cowell = «Cowell · sämst av { $n } epoker» · { $worst }

js-site-evidence-ladder-tip-g24 = «Galileo E11 · ett helt dygn» · { $rms } m

js-site-evidence-ladder-tip-g8a = «Galileo E11 · enbart kraftmodell» · { $rms } m

js-site-evidence-ladder-tip-g8b = «Galileo E11 · med empiriska accelerationer» · { $rms } m

js-site-evidence-ladder-tip-lrd = «Månomloppsfarkost · dynamisk» · { $rms } m

js-site-evidence-ladder-tip-lrr = «Månomloppsfarkost · reducerat dynamisk» · { $rms } m, över tröskeln { $bar } m och redovisat som det är

js-site-evidence-ladder-tip-sgp4 = «SGP4 · sämst av { $n } vektorer» · { $worst }

js-site-evidence-ladder-tip-swd = «Swarm-A · dynamisk» · { $rms } m, nästan allt längs banan (luftmotstånd)

js-site-evidence-ladder-tip-swr = «Swarm-A · reducerat dynamisk» · { $rms } m

js-site-evidence-raim-aria = { $pass } av { $n } SciPy-fall inom sitt toleransband, över { $kernels } kärnor

js-site-evidence-raim-lane = { $kernel } · { $n }

js-site-evidence-raim-lg-most = den största andel av ett band som något fall använder

js-site-evidence-raim-read = fall { $q } av { $n } · { $kernel } · { $what }

js-site-evidence-raim-read-band = { $pct } % av bandet

js-site-evidence-raim-scale-aria = Färgskala: andel av toleransbandet som används, logaritmisk från 10 upphöjt till minus 11 till bandets kant

js-site-evidence-raim-st-inside = inom bandet

js-site-evidence-raim-st-most = största andel av ett band använd

js-site-evidence-raim-tick-edge = bandkant

js-site-evidence-raim-tick-exact = exakt

js-site-evidence-raim-tip-case = «{ $kernel }» · fall { $j } av { $n }

js-site-evidence-raim-tip-exact = «exakt överensstämmelse» med SciPy

js-site-evidence-raim-tip-uses = använder «{ $pct } %» av sitt toleransband

js-site-evidence-sgp4-aria = { $n } av { $n } AIAA-vektorer återskapade; sämst { $worst }, median { $median }, alla inom toleransen { $tol }

js-site-evidence-sgp4-deep = djuprymd (SDP4)

js-site-evidence-sgp4-lg-deep = djuprymdsvektor (SDP4)

js-site-evidence-sgp4-lg-median = median och sämst på skalan

js-site-evidence-sgp4-lg-near = jordnära vektor (SGP4)

js-site-evidence-sgp4-near = jordnära (SGP4)

js-site-evidence-sgp4-read = vektor { $i } av { $n } · satellit { $sat } · fel { $err }

js-site-evidence-sgp4-read-deep = vektor { $i } av { $n } · satellit { $sat }, djuprymd · fel { $err }

js-site-evidence-sgp4-scale-aria = Färgskala från 0,1 mikrometer till toleransen, logaritmisk

js-site-evidence-sgp4-st-deep = djuprymdsvektorer

js-site-evidence-sgp4-st-sats = testsatelliter

js-site-evidence-sgp4-tip-sat = «Satellit { $sat }» · { $kind }

js-site-evidence-sgp4-tip-vector = vektor { $j } av { $n } · positionsfel «{ $err }»

js-site-evidence-st-median = median

js-site-evidence-st-worst = sämst

js-site-evidence-tolerance = tolerans { $v }

js-site-filter-in-all = { $total } totalt

js-site-filter-matches =
    { $n ->
        [one] { $n } träff
       *[other] { $n } träffar
    }

js-site-filter-n-of-m = { $n } av { $total }

js-site-filter-n-of-m-rows = { $n } av { $total } rader

js-site-filter-rows = { $total } rader

js-site-home-banner-gnss-lost = GNSS förlorat · holdover

js-site-home-banner-holdover-out = Holdover · klockan utanför skyddet

js-site-home-banner-integrity-holdover = Integritetslarm · holdover fortsätter

js-site-home-banner-integrity-none = Integritetslarm · ingen skyddsnivå

js-site-home-banner-integrity-pl = Integritetslarm · PL > AL

js-site-home-banner-jamming = Jamming · C/N0 nära golvet

js-site-home-banner-spoofing = Spoofing-larm · RF-detektor

js-site-home-cap-holdover = Jammern går upp till { $dbw } dBW: { $trk } satelliter spåras. Klockan går fritt från de { $carry } ns som spoofern lämnade och passerar sitt skydd på { $guard } ns vid { $at }; INS:en drivs vidare.

js-site-home-cap-integrity = Satelliterna återvänder, men bara över en mask på { $mask }°: { $trk } spåras. Skyddsnivån överstiger varningsgränsen på { $al } m eller kan inte bildas, så övervakaren larmar och klockan förblir i holdover.

js-site-home-cap-jamming = En bredbandsjammer { $km } km bort med { $dbw } dBW. C/N0 faller till { $cn } dB-Hz, { $above } dB över spårningsgolvet på { $floor } dB-Hz; alla { $trk } satelliter spåras fortfarande.

js-site-home-cap-nominal = { $trk } satelliter spåras med ett medel-C/N0 på { $cn } dB-Hz. Klockan är disciplinerad mot GNSS-tid och skyddsnivån ({ $pl } m) ligger under varningsgränsen på { $al } m.

js-site-home-cap-recovery = GNSS återsynkroniserat: { $trk } satelliter spåras, tidsfelet tillbaka på { $te } ns, skyddsnivå { $pl } m.

js-site-home-cap-spoofing = En spoofer driver mottagarens klocka med { $rate } ns/s. RF-detektorn (radiofrekvens) larmar direkt; den klockstödda övervakaren utlöses efter { $det } s och avslutar fasen med { $off } ns indragna.

js-site-home-cn-no-lock = 0 av { $max } spåras · ingen låsning

js-site-home-cn-tracking = { $n } av { $max } spåras

js-site-home-no-pl = ingen PL

js-site-home-pause = Pausa uppdraget

js-site-home-pl-alarm = larm · PL över AL

js-site-home-pl-no-sats = inga satelliter, ingen PL

js-site-home-pl-not-computed = beräknas inte i den här fasen

js-site-home-pl-too-few = för få satelliter

js-site-home-pl-under-al = under AL på { $thr } m

js-site-home-play = Spela upp uppdraget

js-site-home-receiver-tracking = Mottagare · { $n } spåras

js-site-home-replay-restarted = Uppspelningen startade om · { $file }

js-site-home-te-disciplined = disciplinerad mot GNSS

js-site-home-te-free-running = holdover · fritt gående

js-site-home-te-outside-guard = holdover · utanför skyddet

js-site-home-te-spoofer = spoofer som drar klockan

js-site-home-thr-floor = golv

js-site-home-thr-guard = skydd

js-site-kind-action = Åtgärd

js-site-mcp-arguments-excerpt = argument (utdrag)

js-site-mcp-axis-mission-time = uppdragstid

js-site-mcp-clock-holdover = { $clock } holdover

js-site-mcp-dir-reply = kshana-mcp → assistent

js-site-mcp-dir-request = assistent → kshana-mcp

js-site-mcp-figcaption = Ritat utifrån den returnerade serien: varje klockas tidsfel mot tröskeln

js-site-mcp-fom-availability = tillgänglighet

js-site-mcp-fom-caption = Kvalitetsmått som returneras av run_scenario, per klocka

js-site-mcp-fom-header = Kvalitetsmått

js-site-mcp-fom-holdover = holdover (s)

js-site-mcp-fom-p95 = tidsfel, 95:e percentilen (ns)

js-site-mcp-fom-rms = tidsfel, effektivvärde (ns)

js-site-mcp-lede = Registrerad { $recorded } · v{ $version } · standard in och ut · protokoll { $protocol } · endast exakta meddelanden

js-site-mcp-legend-gnss-lost = GNSS förlorat vid { $s } s

js-site-mcp-legend-threshold = tröskel { $v } ns

js-site-mcp-pause = Pausa

js-site-mcp-play = Spela upp

js-site-mcp-plot-aria = Tidsfel för { $quantum } och { $classical } som returneras av run_scenario, mot tröskeln på { $threshold } ns; GNSS (globalt satellitnavigeringssystem) förlorat vid { $lost } s

js-site-mcp-recorded-json = Registrerad JSON: { $label }

js-site-mcp-scenario-hash = scenariohash

js-site-mcp-server-identity = serveridentitet

js-site-mcp-show-json = Visa JSON

js-site-mcp-step-aria = Steg { $n } av { $total }: { $name }

js-site-mcp-step-result = resultat: kvalitetsmått

js-site-mcp-step-status = Steg { $n } av { $total } · { $name }

js-site-mcp-summary-excerpt = sammanfattningsrad och resultat (utdrag)

js-site-mcp-tab-result = resultat

js-site-mcp-threshold = tröskel

js-site-mcp-toml-lines =
    { $n ->
        [one] { $n } rad
       *[other] { $n } rader
    }

js-site-mcp-toml-more = … ({ $n } rader till av { $file })

js-site-mcp-tool-count =
    { $n ->
        [one] { $n } verktyg
       *[other] { $n } verktyg
    }

js-site-mcp-tools-with-descriptions =
    { $n ->
        [one] { $n } verktyg med beskrivningar
       *[other] { $n } verktyg med beskrivningar
    }

js-site-menu-close = Stäng menyn

js-site-menu-open = Öppna menyn

js-site-missions-avail-title = Tillgänglighet: andel av körningen med PDOP ≤ { $limit }

js-site-missions-avail-uniform = { $v } % i varje cell

js-site-missions-chart-error-title = positionsfel (m, log)

js-site-missions-chart-four = fyra behövs för en positionsbestämning

js-site-missions-chart-four-short = fyra för positionsbestämning

js-site-missions-chart-lg-earth = jorden synlig

js-site-missions-chart-lg-error-earth = fel, reläer och avstånd till jorden

js-site-missions-chart-lg-error-relays = fel, enbart reläer

js-site-missions-chart-lg-relays = reläer i sikte

js-site-missions-chart-relays-title = reläer i sikte · skuggat: jorden över horisonten

js-site-missions-chip-at-pdop = vid PDOP ≤ { $limit }

js-site-missions-chip-engine = Motor:

js-site-missions-chip-fix-earth = positionsbestämning, med jorden

js-site-missions-chip-median-pdop = median-PDOP

js-site-missions-chip-relays = reläer

js-site-missions-chip-rms = RMS-fel

js-site-missions-chip-satellites = satelliter

js-site-missions-chip-tracking-held = { $label } spårning hölls

js-site-missions-clocks-aria = Tidsfel efter ett dygns holdover, per klockklass, logaritmisk skala

js-site-missions-clocks-frame = systemgolv { $ns } ns

js-site-missions-clocks-note = tidsfel efter ett dygn, sekunder (log)

js-site-missions-clocks-sigma = σy(1 s) { $sigma }

js-site-missions-clocks-title = { $clock }: { $ns } ns efter ett dygn, σy(1 s) { $sigma }

js-site-missions-cone-aria = Positionsfelskon sedan GNSS gick förlorat

js-site-missions-cone-axis-x = tid sedan GNSS gick förlorat (s)

js-site-missions-cone-axis-y = positionsfel (m)

js-site-missions-cone-budget = ±{ $m } m budget

js-site-missions-cone-clipped = beskuret vid ±{ $m } m

js-site-missions-cone-leaves = lämnar vid { $s } s

js-site-missions-cone-readout = t { $t } s · { $errors }

js-site-missions-copy-command = Kopiera kommando

js-site-missions-copy-title = Kopiera kommandot som återskapar den

js-site-missions-deterministic = deterministisk

js-site-missions-engine-build = Motor v{ $version }, bygge

js-site-missions-engine-build-commit = Motor v{ $version }, bygge { $commit }

js-site-missions-fp-aria = Karta över jammingens avtryck. Piltangenterna flyttar mellan celler, Enter öppnar den körningen.

js-site-missions-fp-aria-svg = Jammingens avtryck runt jammern

js-site-missions-fp-darker = mörkare = högre medel-J/S · celler på { $step } km · { $n } motorkörningar

js-site-missions-fp-jammer = jammer

js-site-missions-fp-lg-held = spårning hölls

js-site-missions-fp-lg-lost = varje satellit förlorad

js-site-missions-fp-lg-some = vissa epoker förlorade

js-site-missions-fp-open = Öppna den här körningen i { $studio }

js-site-missions-fp-read = ungefär { $km } km från jammern · medel-J/S { $js } dB · spårningstillgänglighet { $av }

js-site-missions-fp-ship = scenariots fartyg

js-site-missions-grades-aria = Fri tröghetsdrift innan { $a } m och { $b } m, per IMU-klass

js-site-missions-grades-axis = sekunders drift efter att GNSS gått förlorat (log)

js-site-missions-grades-point = { $grade }: { $s } s till { $m } m ({ $why })

js-site-missions-grades-reaches = felet når { $m } m

js-site-missions-grades-speed = vid { $v } m/s

js-site-missions-grades-this = det här scenariot

js-site-missions-hud-earth-link = Jordlänk

js-site-missions-hud-link-above = Jordlänk · över horisonten

js-site-missions-hud-link-occulted = Jordlänk · skymd

js-site-missions-hud-orbiter = Omloppsfarkost

js-site-missions-hud-receiver = Mottagare

js-site-missions-hud-relays = Reläer

js-site-missions-hud-selected-lat = vald latitud

js-site-missions-info-in-view = I sikte

js-site-missions-info-in-view-value = { $mean } i medel · { $fewest } minst

js-site-missions-info-pdop-above = { $pdop }, över { $limit }

js-site-missions-json-title = Motorns resultat, oförändrat

js-site-missions-json-unavailable = JSON är inte tillgänglig

js-site-missions-key-avail = Tillgänglighet

js-site-missions-key-pdop-title = Medel-PDOP (positionens geometriska försämring)

js-site-missions-key-vis = Satelliter i sikte

js-site-missions-key-vis-short = I sikte

js-site-missions-leo-grid = av rutnätet vid PDOP ≤ { $limit }

js-site-missions-leo-in-view = i sikte i genomsnitt

js-site-missions-leo-shells = satelliter i fyra skal

js-site-missions-map-aria = { $title } över { $body }, per cell på 10 grader. Piltangenterna flyttar mottagaren; dess cell läses ut nedanför.

js-site-missions-map-colour-by = Färglägg kartan efter

js-site-missions-map-fewest-in-view = minst i sikte

js-site-missions-map-grey = grått: ingen positionsbestämning

js-site-missions-map-hatched = streckat: över PDOP-gränsen på { $limit }

js-site-missions-map-in-view = i sikte

js-site-missions-map-live = { $cell }: { $rows }

js-site-missions-map-mean-in-view = i medel i sikte

js-site-missions-map-mean-pdop = medel-PDOP

js-site-missions-map-pdop-limit = PDOP-gräns { $limit }

js-site-missions-matrix-caption = Scenariofiler per sektor (rader) och felläge (kolumner). Välj ett antal för att öppna den sektorn.

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

js-site-missions-mode-int = Störning

js-site-missions-mode-itg = Integritet

js-site-missions-mode-nav = Drift

js-site-missions-mode-orb = Geometri

js-site-missions-mode-spf = Spoofing

js-site-missions-mode-tim = Tidssynkronisering

js-site-missions-n-of-total = { $n } av { $total }

js-site-missions-no-fix = ingen positionsbestämning

js-site-missions-no-seed = deterministisk, inget frö

js-site-missions-open-in-studio = Öppna i { $studio }

js-site-missions-open-report = Öppna motorns rapport

js-site-missions-ow-chart-aria = Mottagarens respons över körningen för { $name }: reläer i sikte, samt positionsfel med enbart reläer och med avståndet till jorden

js-site-missions-ow-chip-epochs = epoker

js-site-missions-ow-chip-mask = mask

js-site-missions-ow-chip-orbiter = omloppsfarkost

js-site-missions-ow-chip-range = avstånd σ

js-site-missions-ow-chip-relays = reläer

js-site-missions-ow-chip-relays-value = { $planes } × { $per } på { $alt } km, { $inc }°

js-site-missions-ow-chip-span = spann

js-site-missions-ow-count-relays = { $n } reläer och en omloppsfarkost · { $body }

js-site-missions-ow-count-sats = { $n } satelliter · { $body }

js-site-missions-ow-engine = motor v{ $version } · bygge { $commit }

js-site-missions-ow-lat-label = Mottagarens latitud

js-site-missions-ow-map-aria = Mottagarens respons för { $name }: en karta över { $body } per cell på 10 grader, med genomsnittligt och minsta antal satelliter i sikte samt medel-PDOP per latitud bredvid

js-site-missions-ow-note-imagery = Bilder av { $body }: NASA.

js-site-missions-ow-note-rebuilt = Banor: reläerna och omloppsfarkosten återbyggda från scenariot exakt som motorn bygger dem; antalet satelliter i sikte som de ger är lika med motorns vid alla { $n } epoker.

js-site-missions-ow-note-sats = Banor: körningens satelliter propagerade om här och kontrollerade mot alla { $n } markspårsprov som motorn skrev (sämst { $deg }°).

js-site-missions-ow-note-scaled = Banradierna är skalade för visning; plan, fasning och omloppstider är körningens egna.

js-site-missions-ow-note-tracks = Motorn skrev markspår för { $shown } av de { $total } satelliterna; alla { $total } ritas utifrån dess skal.

js-site-missions-ow-note-walker = Banor: körningens Walker-skal propagerade om här och kontrollerade mot alla { $n } markspårsprov som motorn skrev (sämst { $deg }°).

js-site-missions-ow-off = av

js-site-missions-ow-on = på

js-site-missions-ow-pause = Pausa banorna

js-site-missions-ow-play = Spela upp banorna

js-site-missions-ow-time = t = { $time }

js-site-missions-ow-time-label = Uppdragstid

js-site-missions-ow-valuetext = { $time }, { $n } reläer i sikte

js-site-missions-pdop-title = Medel-PDOP (positionens geometriska försämring), logaritmisk skala, lägre är bättre

js-site-missions-report = Rapport

js-site-missions-report-title = Motorns egen rapport om den här körningen

js-site-missions-ro-above-horizon = över horisonten

js-site-missions-ro-availability = Tillgänglighet, PDOP ≤ { $limit }

js-site-missions-ro-earth-light = Jorden · ljustid { $s } s

js-site-missions-ro-error-relays = Positionsfel, enbart reläer

js-site-missions-ro-occulted = skymd

js-site-missions-ro-place-availability = Vid { $place }: tillgänglighet

js-site-missions-ro-place-in-view = Vid { $place }: i sikte, medel · minst

js-site-missions-ro-relays = Reläer i sikte

js-site-missions-ro-satellites = Satelliter

js-site-missions-ro-with-earth = Med avståndet till jorden

js-site-missions-run-failed = Den registrerade körningen kunde inte läsas in här; öppna den i { $studio } från länken nedan.

js-site-missions-seed = frö { $seed }

js-site-missions-spoof-aria = Spoofing-förskjutning mot tid, med varje övervakares detektionsgräns och detektionstid

js-site-missions-spoof-axis-x = tid sedan spoofingen började (s)

js-site-missions-spoof-axis-y = tidsförskjutning (ns)

js-site-missions-spoof-detects = { $id } upptäcker vid { $s } s

js-site-missions-spoof-lg-bound = { $id }-gräns

js-site-missions-spoof-lg-offset = spoofing-förskjutning

js-site-missions-spoof-readout = t { $t } s · förskjutning { $offset } ns

js-site-missions-spoof-spec = spec { $v } ns

js-site-missions-sr-aria = { $members }; delad jammer { $power } dBW

js-site-missions-sr-aria-member = { $label }: spårning hölls { $held } %, medelvärde för jammer-till-signal-förhållande { $js } dB, minst antal spårade satelliter { $min }

js-site-missions-sr-car = Bil

js-site-missions-sr-fewest = minst spårade

js-site-missions-sr-held = spårning hölls

js-site-missions-sr-mean-js = medel-J/S

js-site-missions-sr-ship = Fartyg

js-site-missions-swipe =
    { $n ->
        [one] Svep för att se hela { $n } scenariofilen
       *[other] Svep för att se alla { $n } scenariofiler
    }

js-site-missions-toml-download-title = Ladda ned scenariofilen som kördes

js-site-missions-toml-title = Scenariofilen som kördes

js-site-missions-vis-title = Satelliter i sikte, medelvärde över körningen

js-site-missions-vis-uniform = { $v } i varje cell

js-site-palette-none = Inga resultat

js-site-palette-results = { $count } resultat

js-site-pro-band-at = Vid { $minutes } minuter: 5:e till 95:e percentilen

js-site-pro-band-range = { $lo } till { $hi } { $unit }

js-site-pro-band-runs-within = av { $n } körningar inom ±{ $limit } { $unit }

js-site-pro-design-readout = { $sat } satelliter, { $av } % tillgänglighet · { $planes } plan på { $alt } km, { $incl }°

js-site-pro-front-design = Frontutformning { $id }

js-site-pro-front-design-knee = Frontutformning { $id } · knä

js-site-pro-more-designs =
    { $n ->
        [one] (+{ $n } frontutformning till vid den här punkten)
       *[other] (+{ $n } frontutformningar till vid den här punkten)
    }

js-site-pro-not-rerun = inte körd om

js-site-pro-rerun-free = körd om i den kostnadsfria motorn:

js-site-pro-same-sha = samma SHA-256 { $sha }…

js-site-pro-same-sha-index = samma resultat-SHA-256 som indexet

js-site-toast-copied = Kopierat: { $text }

js-site-toast-data-failed = Datafilen kunde inte läsas in

js-site-toast-data-saved = Data sparade som CSV

js-site-toast-no-data = Inga data för det här diagrammet

js-site-toast-svg-saved = Diagrammet sparat som SVG

js-site-toast-table-saved = Tabellen sparad som CSV

js-site-waterfall-axis-now = nu

js-site-waterfall-bar-title = { $band }: { $cn0 } dB-Hz, { $state }

js-site-waterfall-bar-title-js = { $band }: { $cn0 } dB-Hz, { $state }, J/S { $js } dB

js-site-waterfall-below-floor = signalerna ligger under brusgolvet

js-site-waterfall-campaign-drives = Kampanj den driver:

js-site-waterfall-campaign-seed = frö { $seed } · { $phases } faser över { $duration } s

js-site-waterfall-chip-aria = { $band }, { $fc } megahertz: visa det här bandet

js-site-waterfall-chip-title = { $band } · { $fc } MHz · mottagarbandbredd { $bw } MHz

js-site-waterfall-engine-build = Motor v{ $version } · bygge

js-site-waterfall-fallback-head = Galileo-reserv · { $s } s, endast CW-ton

js-site-waterfall-fallback-text = { $band } tillbaka på { $v } dB-Hz. Integritetsövervakning enbart på Galileo: skyddsnivå { $min }–{ $max } m, under varningsgränsen på { $limit } m.

js-site-waterfall-floor = spårningsgolv på { $thr } dB-Hz

js-site-waterfall-holdover-head = Holdover · { $s } s, chirp på

js-site-waterfall-holdover-text = { $band0 } { $v0 }, { $band1 } { $v1 } dB-Hz, under golvet. Klockan går fritt: sämst { $worst } ns mot ett skydd på { $guard } ns.

js-site-waterfall-jammer-off = { $what } av

js-site-waterfall-jammer-on = { $what } på

js-site-waterfall-live = { $freq } megahertz, { $time }: { $detail }

js-site-waterfall-live-band = { $band } { $cn0 } dB-Hz, { $state }

js-site-waterfall-live-none = inget modellerat band

js-site-waterfall-load-failed = Den registrerade körningen kunde inte läsas in. Motorns rapport nedan visar samma körning.

js-site-waterfall-no-jammer-band = Ingen jammer i det här bandet

js-site-waterfall-no-jammer-in-band = ingen jammer i bandet

js-site-waterfall-no-seed = deterministisk, inget frö

js-site-waterfall-onset-head = Början · { $t0 }–{ $t1 } s

js-site-waterfall-onset-text = Alla { $n } band spåras, tills spektrumkörningen först förlorar { $band } vid { $s } s.

js-site-waterfall-pause = Pausa vattenfallet

js-site-waterfall-play = Spela upp vattenfallet

js-site-waterfall-quiet-band = { $band } { $cn0 } dB-Hz · { $state }

js-site-waterfall-run-time = körning T+{ $s } s

js-site-waterfall-scale-caption = PSD över golvet på { $floor } dBW/Hz · celler på { $bin } MHz × { $step } s

js-site-waterfall-seed = frö { $seed }

js-site-waterfall-short-lost = förl.

js-site-waterfall-short-ok = spår.

js-site-waterfall-short-rec = återh.

js-site-waterfall-state-lost = Förlorad låsning

js-site-waterfall-state-lost-low = förlorad låsning

js-site-waterfall-state-ok = Spårar

js-site-waterfall-state-ok-low = spårar

js-site-waterfall-state-rec = Återhämtad

js-site-waterfall-state-rec-low = återhämtad

js-site-waterfall-summary-recovers = { $band } förlorar låsning vid { $lost } s och återhämtar sig vid { $rec } s, lägst { $min } dB-Hz.

js-site-waterfall-summary-rows = { $n } rader om { $step } s.

js-site-waterfall-summary-stays-lost = { $band } förlorar låsning vid { $lost } s och förblir förlorat, lägst { $min } dB-Hz.

js-site-waterfall-summary-tracks = { $band } spåras hela tiden, lägst { $min } dB-Hz.

js-site-waterfall-tip-above-floor = över brusgolvet

js-site-waterfall-tip-at-floor = Vid det termiska brusgolvet

js-site-waterfall-tip-band = { $cn0 } dB-Hz · { $state }

js-site-waterfall-tip-head = { $lo }–{ $hi } MHz · { $time }

js-site-waterfall-tip-js = J/S { $js } dB

js-site-waterfall-tip-no-band = Inget modellerat bands mottagarbandbredd täcker den här kolumnen

js-site-waterfall-wave-chirp = chirp

js-site-waterfall-wave-cw = CW-ton

js-site-waterfall-wave-noise = brus

js-site-waterfall-who-cursor = Band under markören

js-site-waterfall-who-selected = Valt band

js-site-waterfall-who-worst = Sämsta band
