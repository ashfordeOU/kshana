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
