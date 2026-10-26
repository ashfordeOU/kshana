# site-js.ftl (nl): translations

# src/js/t.mjs:4
js-app-engine-failed = De engine kon niet worden geladen ({ $reason }).

# src/js/t.mjs:5
js-ledger-rows =
    { $n ->
        [one] { $n } registerrij
       *[other] { $n } registerrijen
    }

# src/site.js:373
js-site-action-copy-install = Kopiëren: cargo install kshana

# src/site.js:371
js-site-action-launch = { $name } starten

# src/site.js:375
js-site-action-licence = Neem contact met ons op over een commerciële licentie

# src/site.js:374
js-site-action-pro-eval = Een evaluatie van Kshana Pro aanvragen

# src/site.js:376
js-site-action-study = Een studie aanvragen

# src/site.js:372
js-site-action-theme = Wisselen tussen licht en donker thema

# src/js/capabilities.mjs:689
js-site-capabilities-bd-after = { $m } m na { $s } s

# src/js/capabilities.mjs:675
js-site-capabilities-bd-combined = gecombineerd

# src/js/capabilities.mjs:680
js-site-capabilities-bd-crossing = { $m } m na { $s } s

# src/js/capabilities.mjs:694
js-site-capabilities-bd-fig-crossing = «{ $m } m» na { $s } s, gedomineerd door { $dom }

# src/js/capabilities.mjs:693
js-site-capabilities-bd-fig-lead = Tijd sinds het verlies van GNSS op de logaritmische as, een IMU van klasse { $grade } bij { $speed } m/s:

# src/js/capabilities.mjs:695
js-site-capabilities-bd-fig-tail = De lijnen zijn de groeiwetten van de engine voor korte vrije drift en hun kwadratische som; de kruisingspunten komen uit het volledige foutmodel met negen toestanden (Schuler), dat de biastermen begrenst, zodat bij lange vrije drift elk kruisingspunt iets later komt dan de lijn het bereikt. De balken: dezelfde kruisingspunten voor vier IMU-klassen.

# src/js/capabilities.mjs:816
js-site-capabilities-cd-canvas-aria = Constellatie rond haar hemellichaam, met echte beelden: sleep of gebruik de pijltoetsen om te draaien, plus en min om te zoomen

# src/js/capabilities.mjs:746
js-site-capabilities-cd-design-meta = { $n } satellieten · { $body } · { $file }

# src/js/capabilities.mjs:788
js-site-capabilities-cd-foot-frozen = Elke satelliet volgt het eigen spoor van de engine; de straal van de bevroren baan volgt uit de elementen van de schil.

# src/js/capabilities.mjs:789
js-site-capabilities-cd-foot-mean-motion = Elke satelliet volgt het eigen spoor van de engine, op de straal die zijn gemiddelde beweging impliceert.

# src/js/capabilities.mjs:786
js-site-capabilities-cd-foot-walker = Alle { $n } satellieten zijn geplaatst volgens de eigen Walker-parameters van de schillen (gecontroleerd aan de { $shown } sporen van de engine: slechtste { $deg }°); de sporen zijn de { $shown } sporen van de engine.

# src/js/capabilities.mjs:819
js-site-capabilities-cd-hud-body = { $body } · «{ $n }» satellieten

# src/js/capabilities.mjs:820
js-site-capabilities-cd-hud-mission = Missie «{ $time }»

# src/js/capabilities.mjs:782
js-site-capabilities-cd-legend-shell = schil { $n } · { $inc }°

# src/js/capabilities.mjs:803
js-site-capabilities-cd-map-availability = Aandeel van de run met PDOP ≤ { $limit } (0 tot 100 %)

# src/js/capabilities.mjs:804
js-site-capabilities-cd-map-pdop = Gemiddelde PDOP per cel van { $step }° ({ $lo } tot { $hi }; helderder is beter)

# src/js/capabilities.mjs:805
js-site-capabilities-cd-map-visible = Gemiddeld aantal zichtbare satellieten ({ $lo } tot { $hi })

# src/js/capabilities.mjs:757
js-site-capabilities-cd-metric-availability = Beschikbaarheid

# src/js/capabilities.mjs:757
js-site-capabilities-cd-metric-pdop = Gemiddelde PDOP

# src/js/capabilities.mjs:757
js-site-capabilities-cd-metric-visible = Zichtbaar

# src/js/capabilities.mjs:809
js-site-capabilities-cd-no-webgl = De 3D-weergave vereist WebGL; de dekkingskaart en de cijfers zijn van dezelfde run.

# src/js/capabilities.mjs:812
js-site-capabilities-cd-pause = De banen pauzeren

# src/js/capabilities.mjs:812
js-site-capabilities-cd-play = De banen afspelen

# src/js/capabilities.mjs:749
js-site-capabilities-cd-shell = { $name }: Walker { $pattern } { $total }/{ $planes }/{ $phasing } · { $alt } km · { $inc }°

# src/js/capabilities.mjs:750
js-site-capabilities-cd-slots = { $name }: { $n } satellieten, slottabel van de operator

# src/js/capabilities.mjs:784
js-site-capabilities-cd-span = van { $dur }, herhaald

# src/js/capabilities.mjs:770
js-site-capabilities-cd-stat-in-view = Gemiddeld zichtbaar

# src/js/capabilities.mjs:771
js-site-capabilities-cd-stat-mask = Masker · run

# src/js/capabilities.mjs:769
js-site-capabilities-cd-stat-median = Mediane PDOP

# src/js/capabilities.mjs:767
js-site-capabilities-cd-stat-pdop = PDOP ≤ { $limit }, heel { $body }

# src/js/capabilities.mjs:766
js-site-capabilities-cd-stat-satellites = Satellieten

# src/js/capabilities.mjs:768
js-site-capabilities-cd-stat-worst = Slechtste locatie

# src/js/capabilities.mjs:741
js-site-capabilities-cd-title-gnss = Vier GNSS samen

# src/js/capabilities.mjs:741
js-site-capabilities-cd-title-leo = Megaconstellatie in een lage baan om de aarde

# src/js/capabilities.mjs:741
js-site-capabilities-cd-title-lunar = Set maanrelays

# src/js/capabilities.mjs:779
js-site-capabilities-cd-work-ratio = { $pct } % na het breedtegraadvoorfilter · { $dop } DOP-oplossingen

# src/js/capabilities.mjs:778
js-site-capabilities-cd-work-tests = { $after } satelliet-puntcontroles in plaats van de { $brute } die een brute-force-scan zou uitvoeren

# src/js/capabilities.mjs:777
js-site-capabilities-cd-work-title = Zichtbaarheidswerk

# src/js/capabilities.mjs:942
js-site-capabilities-cg-cn0-sub = C/N0 ten opzichte van de trackingdrempel

# src/js/capabilities.mjs:942
js-site-capabilities-cg-cn0-title = Draaggolf-ruisdichtheid

# src/js/capabilities.mjs:1028
js-site-capabilities-cg-compose-availability = Beschikbaarheid

# src/js/capabilities.mjs:1028
js-site-capabilities-cg-compose-fewest = Minste gevolgd

# src/js/capabilities.mjs:1028
js-site-capabilities-cg-compose-js = Gemiddelde J/S

# src/js/capabilities.mjs:1037
js-site-capabilities-cg-compose-text = Eén jammer, { $power } { $unit }, op één plaats, gekoppeld aan { $n } lidruns van het type ‹{ $kind }›: een schip in een zeestraat en een auto op een kustweg zien dezelfde oorzaak en krijgen verschillende antwoorden.

# src/js/capabilities.mjs:973
js-site-capabilities-cg-log-campaign = campagne { $file } · { $phases } fasen · { $runs } lidruns

# src/js/capabilities.mjs:974
js-site-capabilities-cg-log-phase = fase { $name } begint

# src/js/capabilities.mjs:974
js-site-capabilities-cg-log-phase-carries = fase { $name } begint · neemt mee { $carried }

# src/js/capabilities.mjs:1017
js-site-capabilities-cg-monte-axis = uiteindelijke klokfout over { $n } seeds ({ $path })

# src/js/capabilities.mjs:1022
js-site-capabilities-cg-monte-ci = Gemiddelde, interval van 95 %

# src/js/capabilities.mjs:1022
js-site-capabilities-cg-monte-mean = Gemiddelde

# src/js/capabilities.mjs:1016
js-site-capabilities-cg-monte-p05 = 5e

# src/js/capabilities.mjs:1022
js-site-capabilities-cg-monte-p05-p95 = 5e tot 95e

# src/js/capabilities.mjs:1016
js-site-capabilities-cg-monte-p50 = mediaan

# src/js/capabilities.mjs:1016
js-site-capabilities-cg-monte-p95 = 95e

# src/js/capabilities.mjs:1022
js-site-capabilities-cg-monte-std = Standaarddeviatie

# src/js/capabilities.mjs:1020
js-site-capabilities-cg-monte-text = Hetzelfde scenario van het type ‹{ $kind }›, { $n } keer uitgevoerd vanaf de basisseed { $seed }, elk met één seed: de spreiding van de uiteindelijke fout van de vrij lopende klok, met haar betrouwbaarheidsinterval van 95 % voor het gemiddelde.

# src/js/capabilities.mjs:969
js-site-capabilities-cg-not-in-phase = niet in deze fase

# src/js/capabilities.mjs:972
js-site-capabilities-cg-now = Fase { $n } van { $total }: { $name } · { $from } tot { $to }

# src/js/capabilities.mjs:940
js-site-capabilities-cg-phase-title = { $name }: { $from } tot { $to } · beëindigd door { $by } · lidtypen { $kinds }

# src/js/capabilities.mjs:944
js-site-capabilities-cg-pl-sub = ten opzichte van de alarmgrens

# src/js/capabilities.mjs:944
js-site-capabilities-cg-pl-title = Beschermingsniveau

# src/js/capabilities.mjs:945
js-site-capabilities-cg-pos-sub = ten opzichte van het budget · log

# src/js/capabilities.mjs:945
js-site-capabilities-cg-pos-title = Inertiële positiefout

# src/js/capabilities.mjs:1022
js-site-capabilities-cg-range = { $lo } tot { $hi }

# src/js/capabilities.mjs:1005
js-site-capabilities-cg-sweep-all-lost = Alles verloren vanaf

# src/js/capabilities.mjs:998
js-site-capabilities-cg-sweep-axis = zendvermogen van de jammer ({ $key })

# src/js/capabilities.mjs:1005
js-site-capabilities-cg-sweep-first-loss = Eerste verlies

# src/js/capabilities.mjs:1003
js-site-capabilities-cg-sweep-lg-availability = beschikbaarheid

# src/js/capabilities.mjs:1003
js-site-capabilities-cg-sweep-lg-js = gemiddelde J/S

# src/js/capabilities.mjs:1005
js-site-capabilities-cg-sweep-never = nooit

# src/js/capabilities.mjs:1005
js-site-capabilities-cg-sweep-nodes = Knooppunten

# src/js/capabilities.mjs:1005
js-site-capabilities-cg-sweep-none = geen

# src/js/capabilities.mjs:1005
js-site-capabilities-cg-sweep-span = J/S-bereik

# src/js/capabilities.mjs:1002
js-site-capabilities-cg-sweep-text = Eén scenario van het type ‹{ $kind }›, eenmaal per knooppunt uitgevoerd terwijl het zendvermogen van de jammer oploopt van { $from } tot { $to } { $unit }. De beschikbaarheid onder jamming (doorgetrokken) en de gemiddelde J/S (gestreept) komen uit de eigen kwaliteitscijfers van elke lidrun.

# src/js/capabilities.mjs:943
js-site-capabilities-cg-te-sub = ten opzichte van de bewakingsmarge

# src/js/capabilities.mjs:943
js-site-capabilities-cg-te-title = Tijdfout van de klok

# src/js/capabilities.mjs:109
js-site-capabilities-copy = Kopiëren

# src/js/capabilities.mjs:108
js-site-capabilities-copy-aria = De opdracht kopiëren die de run reproduceert: kshana { $file }

# src/js/capabilities.mjs:1387
js-site-capabilities-cz-best = Beste PDOP

# src/js/capabilities.mjs:1374
js-site-capabilities-cz-failed = De vastgelegde run kon hier niet worden geladen; open hem in plaats daarvan in de Studio.

# src/js/capabilities.mjs:1386
js-site-capabilities-cz-fix = Samples met een positiebepaling

# src/js/capabilities.mjs:1386
js-site-capabilities-cz-fix-value = { $n } van { $total } ({ $pct }%)

# src/js/capabilities.mjs:1388
js-site-capabilities-cz-median = Mediane PDOP

# src/js/capabilities.mjs:90
js-site-capabilities-engine = Engine v{ $version }

# src/js/capabilities.mjs:91
js-site-capabilities-engine-build = Engine v{ $version }, build

# src/js/capabilities.mjs:104
js-site-capabilities-engine-report = Engine-rapport

# src/js/capabilities.mjs:1287
js-site-capabilities-globe-aria = { $name } op zijn echte beelden ({ $credit }). Sleep of gebruik de pijltoetsen om het te draaien; plus en min zoomen.

# src/js/capabilities.mjs:1334
js-site-capabilities-ho-ends = de run eindigt op { $t }

# src/js/capabilities.mjs:1337
js-site-capabilities-ho-past-guard = voorbij de bewakingsmarge

# src/js/capabilities.mjs:92
js-site-capabilities-no-seed = deterministisch, geen seed

# src/js/capabilities.mjs:96
js-site-capabilities-open-in-studio = Openen in { $studio }

# src/js/capabilities.mjs:104
js-site-capabilities-open-report = Het rapport van de engine openen

# src/js/capabilities.mjs:1186
js-site-capabilities-orrery-aria = Het zonnestelsel op het tijdstip van de run: sleep of gebruik de pijltoetsen om te draaien, plus en min om te zoomen

# src/js/capabilities.mjs:1228
js-site-capabilities-orrery-bodies = { $n } hemellichamen · waarnemer «{ $observer }»

# src/js/capabilities.mjs:1227
js-site-capabilities-orrery-epoch = Epoche «{ $epoch }» · TDB (Barycentrische Dynamische Tijd), juliaanse datum { $jd }

# src/js/capabilities.mjs:1134
js-site-capabilities-pnt-chart-title = zichtbare relays (lijn) · aarde boven de horizon (gearceerd) · vier nodig voor een positiebepaling

# src/js/capabilities.mjs:1121
js-site-capabilities-pnt-kicker = Positiebepaling bij dit hemellichaam · type body-pnt

# src/js/capabilities.mjs:1124
js-site-capabilities-pnt-lander = Een lander op { $lat }°, { $lon }° op het oppervlak navigeert op de relays, met een tweewegafstandsmeting vanaf de aarde zodra de aarde boven de horizon staat (enkele lichttijd { $min } min). Beschikbaarheid: { $a } % met alleen de relays, { $b } % met de verbinding met de aarde.

# src/js/capabilities.mjs:1125
js-site-capabilities-pnt-orbiter = Een gebruiker in een baan navigeert op de relays, met een tweewegafstandsmeting vanaf de aarde zodra de aarde boven de horizon staat (enkele lichttijd { $min } min). Beschikbaarheid: { $a } % met alleen de relays, { $b } % met de verbinding met de aarde.

# src/js/capabilities.mjs:1121
js-site-capabilities-pnt-relays = { $n } relays op { $alt } km rond { $body }

# src/js/capabilities.mjs:97
js-site-capabilities-report-data = Rapport en gegevens

# src/js/capabilities.mjs:107
js-site-capabilities-result-data = Resultaatgegevens

# src/js/capabilities.mjs:78
js-site-capabilities-saved = Opgeslagen: { $name }

# src/js/capabilities.mjs:105
js-site-capabilities-scenario-file = Scenariobestand

# src/js/capabilities.mjs:92
js-site-capabilities-seed = seed { $seed }

# src/js/capabilities.mjs:568
js-site-capabilities-six-clock-fig = «{ $id }» houdt de bewakingsmarge aan gedurende { $dur }

# src/js/capabilities.mjs:563
js-site-capabilities-six-clock-guard = bewakingsmarge van { $v } ns

# src/js/capabilities.mjs:605
js-site-capabilities-six-coast-budget = budget van { $m } m

# src/js/capabilities.mjs:606
js-site-capabilities-six-coast-denied = GNSS geweigerd

# src/js/capabilities.mjs:609
js-site-capabilities-six-coast-fig = «{ $id }» binnen het budget gedurende { $s } s

# src/js/capabilities.mjs:527
js-site-capabilities-six-floor = trackingdrempel

# src/js/capabilities.mjs:595
js-site-capabilities-six-integ-fig = «{ $ok }» van { $n } epochen beschikbaar · alarmgrenzen { $h } m horizontaal, { $v } m verticaal

# src/js/capabilities.mjs:590
js-site-capabilities-six-integ-limit = verticale alarmgrens

# src/js/capabilities.mjs:594
js-site-capabilities-six-integ-pl = verticaal (doorgetrokken) en horizontaal (gestreept) beschermingsniveau

# src/js/capabilities.mjs:534
js-site-capabilities-six-jam-effective = effectief, { $n } satellieten

# src/js/capabilities.mjs:535
js-site-capabilities-six-jam-fig = Gevolgd «{ $min }» van { $max } zichtbaar · beschikbaarheid onder jamming «{ $av }» (nominaal { $nom }) · gemiddelde J/S «{ $js } dB»

# src/js/capabilities.mjs:533
js-site-capabilities-six-jam-nominal = nominaal, zonder jammer (gestreept)

# src/js/capabilities.mjs:581
js-site-capabilities-six-orbit-fig = Hoogte «{ $lo }–{ $hi } km» · grondspoor over { $dur }

# src/js/capabilities.mjs:580
js-site-capabilities-six-orbit-label = { $source } · { $n } samples

# src/js/capabilities.mjs:580
js-site-capabilities-six-orbit-sgp4 = SGP4 uit een tweeregelige elementenset

# src/js/capabilities.mjs:548
js-site-capabilities-six-spoof-detects = { $id } detecteert

# src/js/capabilities.mjs:550
js-site-capabilities-six-spoof-fig = «{ $id }» detecteert na { $s } s (grens { $ns } ns)

# src/js/capabilities.mjs:1085
js-site-capabilities-ss-angle = Hoek ten opzichte van de zon

# src/js/capabilities.mjs:1053
js-site-capabilities-ss-credit = Beeldmateriaal: { $credits }. * De kaart reikt niet tot de polen; de opening krijgt de gemiddelde poolkleur van de kaart. Ringen van Saturnus: { $ring } ({ $licence }).

# src/js/capabilities.mjs:1083
js-site-capabilities-ss-days = { $v } dagen

# src/js/capabilities.mjs:1076
js-site-capabilities-ss-frame-origin = Oorsprong van het stelsel

# src/js/capabilities.mjs:1084
js-site-capabilities-ss-from-sun = Vanaf de zon

# src/js/capabilities.mjs:1088
js-site-capabilities-ss-gloss = NAIF: de lichaamscode van NASA's Navigation and Ancillary Information Facility. GM: gravitatieparameter. J2: afplattingsterm. IAU-pool: de rotatiepool van de Internationale Astronomische Unie, als rechte klimming (RA) en declinatie (Dec).

# src/js/capabilities.mjs:1082
js-site-capabilities-ss-j2-none = geen gepubliceerd

# src/js/capabilities.mjs:1077
js-site-capabilities-ss-kind = { $class } · NAIF { $naif }

# src/js/capabilities.mjs:1077
js-site-capabilities-ss-kind-of = { $class } van { $parent } · NAIF { $naif }

# src/js/capabilities.mjs:1085
js-site-capabilities-ss-light-time = Lichttijd vanaf { $observer }

# src/js/capabilities.mjs:1091
js-site-capabilities-ss-link = { $from } naar { $to }, enkele lichttijd { $one }, heen en terug { $two }

# src/js/capabilities.mjs:1091
js-site-capabilities-ss-links-lead =
    { $n ->
        [one] Verbinding die deze run berekent:
       *[other] Verbindingen die deze run berekent:
    }

# src/js/capabilities.mjs:1094
js-site-capabilities-ss-moons =
    { $n ->
        [one] Zijn maan, op schaal, op het tijdstip
       *[other] Zijn manen, op schaal, op het tijdstip
    }

# src/js/capabilities.mjs:1106
js-site-capabilities-ss-nominal-error = nominale fout van { $km } km in afstand

# src/js/capabilities.mjs:1103
js-site-capabilities-ss-north = Gezien vanaf het noorden van de ecliptica.

# src/js/capabilities.mjs:1083
js-site-capabilities-ss-period = Omlooptijd

# src/js/capabilities.mjs:1083
js-site-capabilities-ss-period-about = Omlooptijd om { $parent }

# src/js/capabilities.mjs:1086
js-site-capabilities-ss-pole = IAU-pool (RA, Dec)

# src/js/capabilities.mjs:1081
js-site-capabilities-ss-radius = Gemiddelde straal

# src/js/capabilities.mjs:1080
js-site-capabilities-ss-retrograde = { $v } u, retrograde

# src/js/capabilities.mjs:1082
js-site-capabilities-ss-rotation = Siderische rotatie

# src/js/capabilities.mjs:1083
js-site-capabilities-ss-years = { $v } jaar

# src/js/capabilities.mjs:653
js-site-capabilities-st-bound = grens van { $v } m

# src/js/capabilities.mjs:660
js-site-capabilities-st-fig-none = { $n } epochen, geen met de fout boven de grens. Horizontaal: de werkelijke positiefout; verticaal: het beschermingsniveau; beide op logaritmische assen.

# src/js/capabilities.mjs:659
js-site-capabilities-st-fig-some = { $n } epochen, { $k } met de fout boven de grens. Horizontaal: de werkelijke positiefout; verticaal: het beschermingsniveau; beide op logaritmische assen.

# src/js/capabilities.mjs:649
js-site-capabilities-st-limit = alarmgrens van { $m } m

# src/js/capabilities.mjs:650
js-site-capabilities-st-misleading = misleidend: fout boven de grens

# src/js/capabilities.mjs:652
js-site-capabilities-st-normal = normaal bedrijf

# src/js/capabilities.mjs:651
js-site-capabilities-st-unavailable = niet beschikbaar: grens boven de alarmgrens

# src/js/capabilities.mjs:1408
js-site-capabilities-studio-embedded = { $studio }, ingebed: de run orbit-multignss

# src/js/capabilities.mjs:1406
js-site-capabilities-studio-load = { $studio } hier laden

# src/js/capabilities.mjs:1410
js-site-capabilities-studio-outline = De opzet opnieuw tonen

# src/js/capabilities.mjs:259
js-site-capabilities-wave-chirp = chirp

# src/js/capabilities.mjs:259
js-site-capabilities-wave-cw = CW-toon

# src/js/capabilities.mjs:260
js-site-capabilities-wave-noise = ruis

# src/js/capabilities.mjs:388
js-site-capabilities-wf-an-caption = rij T+{ $t } s · dB boven de ruisvloer, logaritmische schaal · piek van het hele raster { $peak } dB

# src/js/capabilities.mjs:357
js-site-capabilities-wf-degraded = Verslechterd

# src/js/capabilities.mjs:364
js-site-capabilities-wf-degraded-low = verslechterd

# src/js/capabilities.mjs:134
js-site-capabilities-wf-failed = De vastgelegde run kon hier niet worden geladen.

# src/js/capabilities.mjs:247
js-site-capabilities-wf-grid = raster

# src/js/capabilities.mjs:144
js-site-capabilities-wf-iq = Op T+{ $t } s tekent de engine het model ook als { $n } IQ-samples (in fase en in kwadratuur) rond { $mhz } MHz en toetst een Welch-schatting ({ $segments } segmenten van { $nfft }) daaraan: geïntegreerde vermogensverhouding { $ratio }.

# src/js/capabilities.mjs:292
js-site-capabilities-wf-jammer-off = { $what } uit

# src/js/capabilities.mjs:292
js-site-capabilities-wf-jammer-on = { $what } aan

# src/js/capabilities.mjs:338
js-site-capabilities-wf-jammer-open = { $name } · { $mhz } MHz · van { $on } s tot het einde

# src/js/capabilities.mjs:338
js-site-capabilities-wf-jammer-span = { $name } · { $mhz } MHz · { $on }–{ $off } s

# src/js/capabilities.mjs:357
js-site-capabilities-wf-lost = Lock verloren

# src/js/capabilities.mjs:364
js-site-capabilities-wf-lost-low = lock verloren

# src/js/capabilities.mjs:392
js-site-capabilities-wf-max = { $peak } dB erboven · logaritmische schaal vanaf { $v0 } dB

# src/js/capabilities.mjs:358
js-site-capabilities-wf-no-jammer = geen jammer

# src/js/capabilities.mjs:239
js-site-capabilities-wf-now = nu

# src/js/capabilities.mjs:437
js-site-capabilities-wf-pause = Het waterval-diagram pauzeren

# src/js/capabilities.mjs:386
js-site-capabilities-wf-peak = piek { $v } dB

# src/js/capabilities.mjs:437
js-site-capabilities-wf-play = Het waterval-diagram afspelen

# src/js/capabilities.mjs:282
js-site-capabilities-wf-replay-previous = begin van de herhaling · vorige doorgang hieronder

# src/js/capabilities.mjs:282
js-site-capabilities-wf-replay-start = begin van de herhaling

# src/js/capabilities.mjs:364
js-site-capabilities-wf-say = T+{ $t } s, { $band } { $v } dB-Hz, { $state }

# src/js/capabilities.mjs:229
js-site-capabilities-wf-signal = signaal +{ $v } dB

# src/js/capabilities.mjs:395
js-site-capabilities-wf-summary = Vastgelegde run van { $file }: { $bands } banden, { $jammers } jammers gedurende { $seconds } seconden. De slechtste band, { $worst }, zakt naar { $min } dB-Hz op { $at } s; trackingdrempel { $floor } dB-Hz.

# src/js/capabilities.mjs:416
js-site-capabilities-wf-tip-above = { $v } dB boven de ruisvloer

# src/js/capabilities.mjs:417
js-site-capabilities-wf-tip-in = in { $bands }

# src/js/capabilities.mjs:357
js-site-capabilities-wf-tracking = Tracking

# src/js/capabilities.mjs:364
js-site-capabilities-wf-tracking-low = tracking

# src/js/cap-hero.mjs:60
js-site-caphero-aria = Het zonnestelsel uit de zonnestelsel-run van de engine op { $date }: de zon en { $bodies } hemellichamen die langs hun engine-baansporen bewegen; { $valid } van de banen zijn gevalideerd aan JPL Horizons.

# src/js/cap-hero.mjs:185
js-site-caphero-clock = +{ $days } dagen · { $date }

# src/js/cap-hero.mjs:69
js-site-caphero-copy-command = Opdracht kopiëren

# src/js/cap-hero.mjs:69
js-site-caphero-copy-title = De opdracht kopiëren die dit reproduceert

# src/js/cap-hero.mjs:79
js-site-caphero-credits = Afstanden gecomprimeerd op een logaritmische schaal, richtingen waarheidsgetrouw; hemellichamen vergroot, rotatie met een weergavesnelheid. Beeldmateriaal: { $credits }; ringen van Saturnus: { $ring } ({ $licence }).

# src/js/cap-hero.mjs:77
js-site-caphero-credits-summary = Schaal- en beeldverantwoording

# src/js/cap-hero.mjs:64
js-site-caphero-engine-build = Engine v{ $version }, build

# src/js/cap-hero.mjs:65
js-site-caphero-explore = Alle hemellichamen verkennen

# src/js/cap-hero.mjs:67
js-site-caphero-file-title = Het scenariobestand dat is uitgevoerd

# src/js/cap-hero.mjs:59
js-site-caphero-list-item = { $name }: { $label }, { $au } au van de zon op het tijdstip, omlooptijd { $period }.

# src/js/cap-hero.mjs:58
js-site-caphero-list-item-light = { $name }: { $label }, { $au } au van de zon op het tijdstip, omlooptijd { $period }, lichttijd vanaf { $observer } { $light }.

# src/js/cap-hero.mjs:64
js-site-caphero-no-seed = deterministisch, geen seed

# src/js/cap-hero.mjs:72
js-site-caphero-open-in-studio = Openen in { $studio }

# src/js/cap-hero.mjs:203
js-site-caphero-pause = De banen pauzeren

# src/js/cap-hero.mjs:55
js-site-caphero-period-days = { $value } dagen

# src/js/cap-hero.mjs:55
js-site-caphero-period-years = { $value } jaar

# src/js/cap-hero.mjs:203
js-site-caphero-play = De banen afspelen

# src/js/cap-hero.mjs:52
js-site-caphero-rate = { $days } dagen van de run per seconde

# src/js/cap-hero.mjs:52
js-site-caphero-rate-epoch = Het beeld op het tijdstip van de run

# src/js/cap-hero.mjs:135
js-site-caphero-read-distance = { $au } au van de zon

# src/js/cap-hero.mjs:136
js-site-caphero-read-light = lichttijd vanaf { $observer } op het tijdstip { $light }

# src/js/cap-hero.mjs:135
js-site-caphero-read-orbit = baan { $period }

# src/js/cap-hero.mjs:64
js-site-caphero-seed = seed { $seed }

# src/site.js:239
js-site-copy-aria = Kopiëren: { $cmd }

# src/js/developers.mjs:41
js-site-developers-captured-from = vastgelegd { $recorded } uit

# src/js/developers.mjs:41
js-site-developers-engine-build = Engine v{ $version }, build

# src/js/developers.mjs:51
js-site-developers-exit-stamp = exit { $rc } · { $ms } ms

# src/js/developers.mjs:44
js-site-developers-file-open-in-studio = { $file }: openen in { $studio }

# src/js/developers.mjs:45
js-site-developers-no-seed = (deterministisch, geen seed)

# src/js/developers.mjs:44
js-site-developers-open-in-studio = Openen in { $studio }

# src/js/developers.mjs:89
js-site-developers-pause = De weergave pauzeren

# src/js/developers.mjs:89
js-site-developers-play = De weergave afspelen

# src/js/developers.mjs:70
js-site-developers-replaying = # de vastgelegde sessie wordt afgespeeld

# src/js/developers.mjs:45
js-site-developers-seed = (seed { $seed })

# src/js/developers.mjs:46
js-site-developers-what-runs-write = Wat elke run schrijft

# src/js/editions.mjs:89
js-site-editions-builds-on-it = { $label } bouwt erop voort

# src/js/editions.mjs:74
js-site-editions-core-kinds =
    { $n ->
        [one] { $n } type
       *[other] { $n } typen
    }

# src/js/editions.mjs:73
js-site-editions-core-title = Open kern

# src/js/editions.mjs:76
js-site-editions-core-validated = gevalideerd

# src/js/editions.mjs:75
js-site-editions-core-validated-of = { $validated } van { $total }

# src/js/editions.mjs:89
js-site-editions-free-core = Gratis in de open kern, zoals elk type

# src/js/editions.mjs:32
js-site-editions-group-other = Overig

# src/js/editions.mjs:87
js-site-editions-kind-no-ledger = geen registermodule komt er qua naam mee overeen

# src/js/editions.mjs:87
js-site-editions-kind-validated = { $v } van { $tot } registerrijen gevalideerd

# src/js/editions.mjs:98
js-site-editions-pause = De ringen pauzeren

# src/js/editions.mjs:98
js-site-editions-play = De ringen afspelen

# src/js/editions.mjs:48
js-site-editions-ring-pro = Kshana Pro

# src/js/editions.mjs:49
js-site-editions-ring-study = Studie op maat

# src/js/evidence.mjs:319
js-site-evidence-allan-aria = Vier deviaties van de NIST SP 1065-dataset van 1000 punten uitgezet tegen de middelingstijd; alle { $n } gepubliceerde waarden gereproduceerd, slechtste relatieve fout { $err }

# src/js/evidence.mjs:340
js-site-evidence-allan-lg-published = gepubliceerde waarde, SP 1065 Tabel 31

# src/js/evidence.mjs:312
js-site-evidence-allan-mdev = gemodificeerde Allan-deviatie

# src/js/evidence.mjs:346
js-site-evidence-allan-na = n.v.t.

# src/js/evidence.mjs:312
js-site-evidence-allan-oadev = overlappende Allan-deviatie

# src/js/evidence.mjs:312
js-site-evidence-allan-ohdev = overlappende Hadamard-deviatie

# src/js/evidence.mjs:347
js-site-evidence-allan-read = { $tau } s · Allan { $oadev } · gemodificeerd { $mdev } · Hadamard { $ohdev }

# src/js/evidence.mjs:341
js-site-evidence-allan-st-gate = de toetsgrens van de test

# src/js/evidence.mjs:341
js-site-evidence-allan-st-reproduced = gepubliceerde waarden gereproduceerd

# src/js/evidence.mjs:341
js-site-evidence-allan-st-worst = slechtste relatieve fout

# src/js/evidence.mjs:312
js-site-evidence-allan-tdev = tijddeviatie, in seconden

# src/js/evidence.mjs:328
js-site-evidence-allan-tip-at = «{ $name }» bij { $m } s

# src/js/evidence.mjs:328
js-site-evidence-allan-tip-engine = engine: «{ $got }» · relatieve fout { $err }

# src/js/evidence.mjs:328
js-site-evidence-allan-tip-table = SP 1065 Tabel 31: «{ $want }»

# src/js/evidence.mjs:469
js-site-evidence-cell-tip = Mogelijkheid { $i } van { $n } · «{ $label }»

# src/js/evidence.mjs:222
js-site-evidence-cowell-aria = Positieverschil ten opzichte van Orekit over 24 uur: de krachtniveaus 1 tot en met 5 blijven onder { $worst }; het weerstandsniveau bereikt { $drag }, een karakteriseringsband
