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

# src/js/evidence.mjs:236
js-site-evidence-cowell-gto = geostationaire transferbaan

# src/js/evidence.mjs:236
js-site-evidence-cowell-leo = lage baan om de aarde

# src/js/evidence.mjs:242
js-site-evidence-cowell-lg-con = niveaus 1 tot en met 5, tweelichamenprobleem tot en met zonnestralingsdruk, telkens twee banen

# src/js/evidence.mjs:242
js-site-evidence-cowell-lg-drag = niveau 6, weerstand: alleen karakterisering (verschillende dichtheidsmodellen)

# src/js/evidence.mjs:251
js-site-evidence-cowell-read = { $h } u · niveaus 1 tot en met 5 slechtste { $con } · weerstand { $drag }

# src/js/evidence.mjs:243
js-site-evidence-cowell-st-drag = weerstandsniveau, slechtste

# src/js/evidence.mjs:243
js-site-evidence-cowell-st-epochs = epochen in niveaus 1 tot en met 5

# src/js/evidence.mjs:236
js-site-evidence-cowell-tip-tier = «Niveau { $tier }: { $label }» · { $regime }

# src/js/evidence.mjs:236
js-site-evidence-cowell-tip-worst = slechtste verschil «{ $err }» na { $h } u

# src/js/evidence.mjs:539
js-site-evidence-hero-live = { $label }. { $cap }. { $oracle }

# src/js/evidence.mjs:537
js-site-evidence-hero-no-oracle = Geen externe onafhankelijke referentie genoemd.

# src/js/evidence.mjs:536
js-site-evidence-hero-oracle = Onafhankelijke referentie

# src/js/evidence.mjs:539
js-site-evidence-hero-oracle-is = Onafhankelijke referentie: { $o }

# src/js/evidence.mjs:536
js-site-evidence-hero-owner = Eigenaar

# src/js/evidence.mjs:537
js-site-evidence-hero-partner = Een partner is hiervan eigenaar; de engine maakt er geen aanspraak op.

# src/js/evidence.mjs:544
js-site-evidence-hero-pause = De sweep pauzeren

# src/js/evidence.mjs:544
js-site-evidence-hero-play = De sweep afspelen

# src/js/evidence.mjs:531
js-site-evidence-hero-row = Rij { $i } van { $n }

# src/js/evidence.mjs:381
js-site-evidence-hold-accepted = geaccepteerd: binnen een factor { $bar }

# src/js/evidence.mjs:359
js-site-evidence-hold-aria = Gemeten effectieve tijdfout van de cesiumklok ten opzichte van de driftijd, met de voorspelling van de engine; voorspeld gedeeld door gemeten overschrijdt de grens van { $lo } tot { $hi }

# src/js/evidence.mjs:387
js-site-evidence-hold-control = «Controle:» de naïeve voorspelling (de stabiliteit over één seconde gelezen als witte frequentieruis) geeft een verhouding van { $ratio }, ongeveer een factor { $factor } ernaast, en faalt voor dezelfde drempel. De drempel heeft tanden.

# src/js/evidence.mjs:375
js-site-evidence-hold-lg-meas = gemeten op de achtergehouden registratie (stip: overschrijding)

# src/js/evidence.mjs:375
js-site-evidence-hold-lg-pred = voorspeld uit het eerste derde deel (ring: overschrijding)

# src/js/evidence.mjs:354
js-site-evidence-hold-nodata = De gemeten registratie was niet beschikbaar toen deze pagina werd gegenereerd.

# src/js/evidence.mjs:383
js-site-evidence-hold-perfect = 1 = perfect

# src/js/evidence.mjs:377
js-site-evidence-hold-ratio-aria = Voorspeld gedeeld door gemeten voor { $n } grenzen, alle binnen de geaccepteerde factor { $bar }

# src/js/evidence.mjs:393
js-site-evidence-hold-read = drift { $h } u · gemeten { $m } ns · voorspeld { $p } ns

# src/js/evidence.mjs:388
js-site-evidence-hold-st-fit = gebruikt voor de fit

# src/js/evidence.mjs:388
js-site-evidence-hold-st-samples = samples van één seconde

# src/js/evidence.mjs:388
js-site-evidence-hold-st-syncs = achtergehouden synchronisatiepunten

# src/js/evidence.mjs:366
js-site-evidence-hold-tip-breach = voorspelde overschrijding { $p } s · gemeten { $m } s

# src/js/evidence.mjs:366
js-site-evidence-hold-tip-error = «Tijdfout { $thr } ns»

# src/js/evidence.mjs:366
js-site-evidence-hold-tip-ratio = voorspeld gedeeld door gemeten «{ $ratio }»

# src/js/evidence.mjs:382
js-site-evidence-hold-tip-row = «{ $thr } ns» · voorspeld gedeeld door gemeten «{ $ratio }»

# src/js/evidence.mjs:171
js-site-evidence-kernel-chi2-cdf = chikwadraatverdeling

# src/js/evidence.mjs:172
js-site-evidence-kernel-chi2-quantile = chikwadraatkwantiel

# src/js/evidence.mjs:175
js-site-evidence-kernel-noncentral = niet-centrale chikwadraat

# src/js/evidence.mjs:173
js-site-evidence-kernel-normal-cdf = normale verdeling

# src/js/evidence.mjs:174
js-site-evidence-kernel-normal-quantile = normaal kwantiel

# src/js/evidence.mjs:176
js-site-evidence-kernel-pbias = detectiebias

# src/js/evidence.mjs:274
js-site-evidence-ladder-aria = Baanresiduen van { $lo } tot { $hi } m op één logaritmische schaal, met de agentschapsdrempel van { $bar } m

# src/js/evidence.mjs:284
js-site-evidence-ladder-bar = agentschapsdrempel { $bar } m

# src/js/evidence.mjs:265
js-site-evidence-ladder-cowell = Cowell ten opzichte van Orekit 12.2, slechtste

# src/js/evidence.mjs:267
js-site-evidence-ladder-g24 = Galileo E11, fit over 24 uur

# src/js/evidence.mjs:266
js-site-evidence-ladder-g8 = Galileo E11, fit over 8 uur

# src/js/evidence.mjs:302
js-site-evidence-ladder-lg-headline = hoofdresidu

# src/js/evidence.mjs:302
js-site-evidence-ladder-lg-over = boven de agentschapsdrempel van { $bar } m

# src/js/evidence.mjs:302
js-site-evidence-ladder-lg-ring = alleen het krachtmodel, vóór empirische versnellingen

# src/js/evidence.mjs:269
js-site-evidence-ladder-lro = Lunar Reconnaissance Orbiter, fit over 4 uur

# src/js/evidence.mjs:307
js-site-evidence-ladder-read = sweep op { $v } · { $n } van { $total } hoofdresiduen op of onder die waarde

# src/js/evidence.mjs:262
js-site-evidence-ladder-rt-arc = boog { $arc } · graad en orde { $do } · { $n } waarnemingen

# src/js/evidence.mjs:262
js-site-evidence-ladder-rt-rtn = radiaal { $r } m · langs het spoor { $a } m · dwars op het spoor { $c } m

# src/js/evidence.mjs:264
js-site-evidence-ladder-sgp4 = SGP4 ten opzichte van de AIAA-vectoren, slechtste

# src/js/evidence.mjs:268
js-site-evidence-ladder-swarm = Swarm-A, fit over 3 uur

# src/js/evidence.mjs:265
js-site-evidence-ladder-tip-cowell = «Cowell · slechtste van { $n } epochen» · { $worst }

# src/js/evidence.mjs:267
js-site-evidence-ladder-tip-g24 = «Galileo E11 · een volledige dag» · { $rms } m

# src/js/evidence.mjs:266
js-site-evidence-ladder-tip-g8a = «Galileo E11 · alleen krachtmodel» · { $rms } m

# src/js/evidence.mjs:266
js-site-evidence-ladder-tip-g8b = «Galileo E11 · met empirische versnellingen» · { $rms } m

# src/js/evidence.mjs:269
js-site-evidence-ladder-tip-lrd = «Maanorbiter · dynamisch» · { $rms } m

# src/js/evidence.mjs:269
js-site-evidence-ladder-tip-lrr = «Maanorbiter · gereduceerd-dynamisch» · { $rms } m, boven de drempel van { $bar } m en gerapporteerd zoals het is

# src/js/evidence.mjs:264
js-site-evidence-ladder-tip-sgp4 = «SGP4 · slechtste van { $n } vectoren» · { $worst }

# src/js/evidence.mjs:268
js-site-evidence-ladder-tip-swd = «Swarm-A · dynamisch» · { $rms } m, bijna volledig langs het spoor (weerstand)

# src/js/evidence.mjs:268
js-site-evidence-ladder-tip-swr = «Swarm-A · gereduceerd-dynamisch» · { $rms } m

# src/js/evidence.mjs:183
js-site-evidence-raim-aria = { $pass } van { $n } SciPy-gevallen binnen hun tolerantieband, verdeeld over { $kernels } kernels

# src/js/evidence.mjs:187
js-site-evidence-raim-lane = { $kernel } · { $n }

# src/js/evidence.mjs:209
js-site-evidence-raim-lg-most = het grootste deel van een band dat een geval gebruikt

# src/js/evidence.mjs:214
js-site-evidence-raim-read = geval { $q } van { $n } · { $kernel } · { $what }

# src/js/evidence.mjs:214
js-site-evidence-raim-read-band = { $pct } % van de band

# src/js/evidence.mjs:210
js-site-evidence-raim-st-inside = binnen de band

# src/js/evidence.mjs:210
js-site-evidence-raim-st-most = het grootste deel van een band gebruikt

# src/js/evidence.mjs:203
js-site-evidence-raim-tick-edge = rand van de band

# src/js/evidence.mjs:203
js-site-evidence-raim-tick-exact = exact

# src/js/evidence.mjs:192
js-site-evidence-raim-tip-case = «{ $kernel }» · geval { $j } van { $n }

# src/js/evidence.mjs:192
js-site-evidence-raim-tip-exact = «exacte overeenkomst» met SciPy

# src/js/evidence.mjs:192
js-site-evidence-raim-tip-uses = gebruikt «{ $pct } %» van zijn tolerantieband

# src/js/evidence.mjs:132
js-site-evidence-sgp4-aria = { $n } van { $n } AIAA-vectoren gereproduceerd; slechtste { $worst }, mediaan { $median }, alle binnen de tolerantie van { $tol }

# src/js/evidence.mjs:139
js-site-evidence-sgp4-deep = diepe ruimte (SDP4)

# src/js/evidence.mjs:158
js-site-evidence-sgp4-lg-deep = vector voor de diepe ruimte (SDP4)

# src/js/evidence.mjs:158
js-site-evidence-sgp4-lg-median = mediaan en slechtste op de schaal

# src/js/evidence.mjs:158
js-site-evidence-sgp4-lg-near = vector nabij de aarde (SGP4)

# src/js/evidence.mjs:139
js-site-evidence-sgp4-near = nabij de aarde (SGP4)

# src/js/evidence.mjs:165
js-site-evidence-sgp4-read = vector { $i } van { $n } · satelliet { $sat } · fout { $err }

# src/js/evidence.mjs:164
js-site-evidence-sgp4-read-deep = vector { $i } van { $n } · satelliet { $sat }, diepe ruimte · fout { $err }

# src/js/evidence.mjs:144
js-site-evidence-sgp4-scale-aria = Kleurschaal van 0,1 micrometer tot de tolerantie, logaritmisch

# src/js/evidence.mjs:159
js-site-evidence-sgp4-st-deep = vectoren voor de diepe ruimte

# src/js/evidence.mjs:159
js-site-evidence-sgp4-st-sats = testsatellieten

# src/js/evidence.mjs:139
js-site-evidence-sgp4-tip-sat = «Satelliet { $sat }» · { $kind }

# src/js/evidence.mjs:139
js-site-evidence-sgp4-tip-vector = vector { $j } van { $n } · positiefout «{ $err }»

# src/js/evidence.mjs:159
js-site-evidence-st-median = mediaan

# src/js/evidence.mjs:159
js-site-evidence-st-worst = slechtste

# src/js/evidence.mjs:148
js-site-evidence-tolerance = tolerantie { $v }

# src/site.js:277
js-site-filter-in-all = { $total } in totaal

# src/site.js:276
js-site-filter-matches =
    { $n ->
        [one] { $n } overeenkomst
       *[other] { $n } overeenkomsten
    }

# src/site.js:276
js-site-filter-n-of-m = { $n } van { $total }

# src/site.js:279
js-site-filter-n-of-m-rows = { $n } van { $total } rijen

# src/site.js:276
js-site-filter-rows = { $total } rijen

# src/js/home.mjs:258
js-site-home-banner-gnss-lost = GNSS verloren · holdover

# src/js/home.mjs:258
js-site-home-banner-holdover-out = Holdover · klok buiten de bewakingsmarge

# src/js/home.mjs:259
js-site-home-banner-integrity-holdover = Integriteitsalarm · holdover gaat door

# src/js/home.mjs:259
js-site-home-banner-integrity-none = Integriteitsalarm · geen beschermingsniveau

# src/js/home.mjs:259
js-site-home-banner-integrity-pl = Integriteitsalarm · PL > AL

# src/js/home.mjs:256
js-site-home-banner-jamming = Jamming · C/N0 nabij de drempel

# src/js/home.mjs:257
js-site-home-banner-spoofing = Spoofingalarm · RF-detector

# src/js/home.mjs:251
js-site-home-cap-holdover = De jammer gaat naar { $dbw } dBW: { $trk } satellieten worden getrackt. De klok loopt vrij vanaf de { $carry } ns die de spoofer achterliet en overschrijdt zijn bewakingsmarge van { $guard } ns op { $at }; de INS drijft door.

# src/js/home.mjs:252
js-site-home-cap-integrity = De satellieten keren terug, maar alleen boven een masker van { $mask }°: { $trk } getrackt. Het beschermingsniveau overschrijdt de alarmgrens van { $al } m of kan niet worden gevormd, dus de monitor geeft alarm en de klok blijft in holdover.

# src/js/home.mjs:249
js-site-home-cap-jamming = Een breedbandige jammer op { $km } km afstand met { $dbw } dBW. C/N0 daalt naar { $cn } dB-Hz, { $above } dB boven de trackingdrempel van { $floor } dB-Hz; alle { $trk } satellieten worden nog steeds getrackt.

# src/js/home.mjs:248
js-site-home-cap-nominal = { $trk } satellieten getrackt bij een gemiddelde C/N0 van { $cn } dB-Hz. De klok is gesynchroniseerd op GNSS-tijd en het beschermingsniveau ({ $pl } m) ligt onder de alarmgrens van { $al } m.

# src/js/home.mjs:253
js-site-home-cap-recovery = GNSS opnieuw gesynchroniseerd: { $trk } satellieten getrackt, tijdfout terug op { $te } ns, beschermingsniveau { $pl } m.

# src/js/home.mjs:250
js-site-home-cap-spoofing = Een spoofer duwt de ontvangerklok met { $rate } ns/s op. De RF-detector (radiofrequentie) geeft direct alarm; de klokgestuurde monitor slaat aan na { $det } s en beëindigt de fase met { $off } ns teruggetrokken.

# src/js/home.mjs:120
js-site-home-cn-no-lock = 0 van { $max } getrackt · geen lock

# src/js/home.mjs:120
js-site-home-cn-tracking = { $n } van { $max } getrackt

# src/js/home.mjs:114
js-site-home-no-pl = geen PL

# src/js/home.mjs:329
js-site-home-pause = De missie pauzeren

# src/js/home.mjs:121
js-site-home-pl-alarm = alarm · PL boven AL

# src/js/home.mjs:121
js-site-home-pl-no-sats = geen satellieten, geen PL

# src/js/home.mjs:121
js-site-home-pl-not-computed = niet berekend in deze fase

# src/js/home.mjs:121
js-site-home-pl-too-few = te weinig satellieten

# src/js/home.mjs:121
js-site-home-pl-under-al = onder de AL van { $thr } m

# src/js/home.mjs:329
js-site-home-play = De missie afspelen

# src/js/home.mjs:214
js-site-home-receiver-tracking = Ontvanger · { $n } getrackt

# src/js/home.mjs:226
js-site-home-replay-restarted = Herhaling opnieuw gestart · { $file }

# src/js/home.mjs:119
js-site-home-te-disciplined = gesynchroniseerd op GNSS

# src/js/home.mjs:119
js-site-home-te-free-running = holdover · vrij lopend

# src/js/home.mjs:119
js-site-home-te-outside-guard = holdover · buiten de bewakingsmarge

# src/js/home.mjs:119
js-site-home-te-spoofer = spoofer trekt aan de klok

# src/js/home.mjs:60
js-site-home-thr-floor = drempel

# src/js/home.mjs:59
js-site-home-thr-guard = bewaking

# src/site.js:408
js-site-kind-action = Actie

# src/js/mcp-player.mjs:92
js-site-mcp-arguments-excerpt = argumenten (fragment)

# src/js/mcp-player.mjs:70
js-site-mcp-axis-mission-time = missietijd

# src/js/mcp-player.mjs:97
js-site-mcp-clock-holdover = holdover van { $clock }

# src/js/mcp-player.mjs:28
js-site-mcp-dir-reply = kshana-mcp → assistent

# src/js/mcp-player.mjs:28
js-site-mcp-dir-request = assistent → kshana-mcp

# src/js/mcp-player.mjs:52
js-site-mcp-figcaption = Getekend uit de geretourneerde reeks: de tijdfout van elke klok ten opzichte van de drempel

# src/js/mcp-player.mjs:46
js-site-mcp-fom-availability = beschikbaarheid

# src/js/mcp-player.mjs:44
js-site-mcp-fom-caption = Kwaliteitscijfers die run_scenario retourneert, per klok

# src/js/mcp-player.mjs:45
js-site-mcp-fom-header = Kwaliteitscijfer

# src/js/mcp-player.mjs:46
js-site-mcp-fom-holdover = holdover (s)

# src/js/mcp-player.mjs:46
js-site-mcp-fom-p95 = tijdfout, 95e percentiel (ns)

# src/js/mcp-player.mjs:46
js-site-mcp-fom-rms = tijdfout, effectieve waarde (ns)

# src/js/mcp-player.mjs:21
js-site-mcp-lede = Vastgelegd { $recorded } · v{ $version } · standaardinvoer en -uitvoer · protocol { $protocol } · alleen exacte berichten

# src/js/mcp-player.mjs:73
js-site-mcp-legend-gnss-lost = GNSS verloren na { $s } s

# src/js/mcp-player.mjs:73
js-site-mcp-legend-threshold = drempel { $v } ns

# src/js/mcp-player.mjs:158
js-site-mcp-pause = Pauzeren

# src/js/mcp-player.mjs:158
js-site-mcp-play = Afspelen

# src/js/mcp-player.mjs:51
js-site-mcp-plot-aria = Tijdfout van { $quantum } en { $classical } zoals geretourneerd door run_scenario, ten opzichte van de drempel van { $threshold } ns; GNSS (wereldwijd navigatiesatellietsysteem) verloren na { $lost } s

# src/js/mcp-player.mjs:35
js-site-mcp-recorded-json = Vastgelegde JSON: { $label }

# src/js/mcp-player.mjs:96
js-site-mcp-scenario-hash = scenariohash

# src/js/mcp-player.mjs:81
js-site-mcp-server-identity = serveridentiteit

# src/js/mcp-player.mjs:34
js-site-mcp-show-json = JSON tonen

# src/js/mcp-player.mjs:109
js-site-mcp-step-aria = Stap { $n } van { $total }: { $name }

# src/js/mcp-player.mjs:100
js-site-mcp-step-result = resultaat: kwaliteitscijfers

# src/js/mcp-player.mjs:137
js-site-mcp-step-status = Stap { $n } van { $total } · { $name }

# src/js/mcp-player.mjs:98
js-site-mcp-summary-excerpt = samenvattingsregel en resultaat (fragment)

# src/js/mcp-player.mjs:100
js-site-mcp-tab-result = resultaat

# src/js/mcp-player.mjs:96
js-site-mcp-threshold = drempel

# src/js/mcp-player.mjs:90
js-site-mcp-toml-lines =
    { $n ->
        [one] { $n } regel
       *[other] { $n } regels
    }

# src/js/mcp-player.mjs:38
js-site-mcp-toml-more = … ({ $n } regels meer uit { $file })

# src/js/mcp-player.mjs:86
js-site-mcp-tool-count =
    { $n ->
        [one] { $n } tool
       *[other] { $n } tools
    }

# src/js/mcp-player.mjs:87
js-site-mcp-tools-with-descriptions =
    { $n ->
        [one] { $n } tool met beschrijvingen
       *[other] { $n } tools met beschrijvingen
    }

# src/site.js:71
js-site-menu-close = Het menu sluiten

# src/site.js:71
js-site-menu-open = Het menu openen

# src/js/missions.mjs:658
js-site-missions-avail-title = Beschikbaarheid: aandeel van de run met PDOP ≤ { $limit }

# src/js/missions.mjs:657
js-site-missions-avail-uniform = { $v } % in elke cel

# src/js/missions.mjs:880
js-site-missions-chart-error-title = positiefout (m, log)

# src/js/missions.mjs:875
js-site-missions-chart-four = vier nodig voor een positiebepaling

# src/js/missions.mjs:875
js-site-missions-chart-four-short = vier voor een positiebepaling

# src/js/missions.mjs:885
js-site-missions-chart-lg-earth = Aarde zichtbaar

# src/js/missions.mjs:885
js-site-missions-chart-lg-error-earth = fout, relays en afstand tot de aarde

# src/js/missions.mjs:885
js-site-missions-chart-lg-error-relays = fout, alleen relays

# src/js/missions.mjs:885
js-site-missions-chart-lg-relays = zichtbare relays

# src/js/missions.mjs:876
js-site-missions-chart-relays-title = zichtbare relays · gearceerd: aarde boven de horizon

# src/js/missions.mjs:564
js-site-missions-chip-at-pdop = bij PDOP ≤ { $limit }

# src/js/missions.mjs:570
js-site-missions-chip-engine = Engine:

# src/js/missions.mjs:565
js-site-missions-chip-fix-earth = positiebepaling, met aarde

# src/js/missions.mjs:564
js-site-missions-chip-median-pdop = mediane PDOP

# src/js/missions.mjs:565
js-site-missions-chip-relays = relays

# src/js/missions.mjs:565
js-site-missions-chip-rms = RMS-fout

# src/js/missions.mjs:564
js-site-missions-chip-satellites = satellieten

# src/js/missions.mjs:567
js-site-missions-chip-tracking-held = tracking van { $label } behouden

# src/js/missions.mjs:284
js-site-missions-clocks-aria = Tijdfout na één dag holdover, per klasse klok, logaritmische schaal

# src/js/missions.mjs:295
js-site-missions-clocks-frame = ondergrens van het stelsel { $ns } ns

# src/js/missions.mjs:285
js-site-missions-clocks-note = tijdfout na één dag, seconden (log)

# src/js/missions.mjs:292
js-site-missions-clocks-sigma = σy(1 s) { $sigma }

# src/js/missions.mjs:290
js-site-missions-clocks-title = { $clock }: { $ns } ns na één dag, σy(1 s) { $sigma }

# src/js/missions.mjs:311
js-site-missions-cone-aria = Kegel van de positiefout sinds het verlies van GNSS

# src/js/missions.mjs:314
js-site-missions-cone-axis-x = tijd sinds het verlies van GNSS (s)

# src/js/missions.mjs:315
js-site-missions-cone-axis-y = positiefout (m)

# src/js/missions.mjs:322
js-site-missions-cone-budget = budget van ±{ $m } m

# src/js/missions.mjs:327
js-site-missions-cone-clipped = afgekapt bij ±{ $m } m

# src/js/missions.mjs:324
js-site-missions-cone-leaves = verlaat bij { $s } s

# src/js/missions.mjs:335
js-site-missions-cone-readout = t { $t } s · { $errors }

# src/js/missions.mjs:479
js-site-missions-copy-command = Opdracht kopiëren

# src/js/missions.mjs:479
js-site-missions-copy-title = De opdracht kopiëren die dit reproduceert

# src/js/missions.mjs:987
js-site-missions-deterministic = deterministisch

# src/js/missions.mjs:487
js-site-missions-engine-build = Engine v{ $version }, build

# src/js/missions.mjs:590
js-site-missions-engine-build-commit = Engine v{ $version }, build { $commit }

# src/js/missions.mjs:393
js-site-missions-fp-aria = Kaart van het jammingbereik. Met de pijltoetsen gaat u tussen cellen, met Enter opent u die run.

# src/js/missions.mjs:370
js-site-missions-fp-aria-svg = Jammingbereik rond de jammer

# src/js/missions.mjs:388
js-site-missions-fp-darker = donkerder = hogere gemiddelde J/S · cellen van { $step } km · { $n } engine-runs

# src/js/missions.mjs:381
js-site-missions-fp-jammer = jammer

# src/js/missions.mjs:385
js-site-missions-fp-lg-held = tracking behouden

# src/js/missions.mjs:385
js-site-missions-fp-lg-lost = elke satelliet verloren

# src/js/missions.mjs:385
js-site-missions-fp-lg-some = enkele epochen verloren

# src/js/missions.mjs:418
js-site-missions-fp-open = Deze run openen in { $studio }

# src/js/missions.mjs:419
js-site-missions-fp-read = ongeveer { $km } km van de jammer · gemiddelde J/S { $js } dB · trackingbeschikbaarheid { $av }

# src/js/missions.mjs:382
js-site-missions-fp-ship = het schip van het scenario

# src/js/missions.mjs:209
js-site-missions-grades-aria = Vrije inertiële drift vóór { $a } m en { $b } m, per IMU-klasse

# src/js/missions.mjs:216
js-site-missions-grades-axis = seconden drift na het verlies van GNSS (log)

# src/js/missions.mjs:223
js-site-missions-grades-point = { $grade }: { $s } s tot { $m } m ({ $why })

# src/js/missions.mjs:210
js-site-missions-grades-reaches = de fout bereikt { $m } m

# src/js/missions.mjs:211
js-site-missions-grades-speed = bij { $v } m/s

# src/js/missions.mjs:221
js-site-missions-grades-this = dit scenario

# src/js/missions.mjs:1206
js-site-missions-hud-earth-link = Verbinding met de aarde

# src/js/missions.mjs:1271
js-site-missions-hud-link-above = Verbinding met de aarde · boven de horizon

# src/js/missions.mjs:1271
js-site-missions-hud-link-occulted = Verbinding met de aarde · bedekt

# src/js/missions.mjs:1203
js-site-missions-hud-orbiter = Orbiter

# src/js/missions.mjs:1204
js-site-missions-hud-receiver = Ontvanger

# src/js/missions.mjs:1203
js-site-missions-hud-relays = Relays

# src/js/missions.mjs:1204
js-site-missions-hud-selected-lat = geselecteerde breedtegraad

# src/js/missions.mjs:814
js-site-missions-info-in-view = Zichtbaar

# src/js/missions.mjs:814
js-site-missions-info-in-view-value = gemiddeld { $mean } · minimaal { $fewest }

# src/js/missions.mjs:814
js-site-missions-info-pdop-above = { $pdop }, boven { $limit }

# src/js/missions.mjs:475
js-site-missions-json-title = Het resultaat van de engine, ongewijzigd

# src/js/missions.mjs:464
js-site-missions-json-unavailable = JSON niet beschikbaar

# src/js/missions.mjs:648
js-site-missions-key-avail = Beschikbaarheid

# src/js/missions.mjs:855
js-site-missions-key-pdop-title = Gemiddelde PDOP (positie-verdunning van precisie)

# src/js/missions.mjs:648
js-site-missions-key-vis = Zichtbare satellieten

# src/js/missions.mjs:648
js-site-missions-key-vis-short = Zichtbaar

# src/js/missions.mjs:595
js-site-missions-leo-grid = van het raster bij PDOP ≤ { $limit }

# src/js/missions.mjs:595
js-site-missions-leo-in-view = gemiddeld zichtbaar

# src/js/missions.mjs:595
js-site-missions-leo-shells = satellieten in vier schillen

# src/js/missions.mjs:809
js-site-missions-map-aria = { $title } boven { $body }, per cel van 10 graden. Met de pijltoetsen verplaatst u de ontvanger; zijn cel wordt hieronder uitgelezen.

# src/js/missions.mjs:853
js-site-missions-map-colour-by = De kaart inkleuren naar

# src/js/missions.mjs:715
js-site-missions-map-fewest-in-view = minimaal zichtbaar

# src/js/missions.mjs:712
js-site-missions-map-grey = grijs: geen positiebepaling

# src/js/missions.mjs:711
js-site-missions-map-hatched = gearceerd: boven de PDOP-grens van { $limit }

# src/js/missions.mjs:774
js-site-missions-map-in-view = zichtbaar

# src/js/missions.mjs:839
js-site-missions-map-live = { $cell }: { $rows }

# src/js/missions.mjs:715
js-site-missions-map-mean-in-view = gemiddeld zichtbaar

# src/js/missions.mjs:715
js-site-missions-map-mean-pdop = gemiddelde PDOP

# src/js/missions.mjs:715
js-site-missions-map-pdop-limit = PDOP-grens { $limit }

# src/js/missions.mjs:509
js-site-missions-matrix-caption = Scenariobestanden per sector (rijen) en faalwijze (kolommen). Selecteer een aantal om die sector te openen.

# src/js/missions.mjs:523
js-site-missions-matrix-cell =
    { $n ->
        [one] { $sector }, { $mode }: { $n } scenariobestand
       *[other] { $sector }, { $mode }: { $n } scenariobestanden
    }

# src/js/missions.mjs:525
js-site-missions-matrix-files =
    { $n ->
        [one] { $n } bestand:
       *[other] { $n } bestanden:
    }

# src/js/missions.mjs:510
js-site-missions-matrix-sector = Sector

# src/js/missions.mjs:492
js-site-missions-mode-int = Interferentie

# src/js/missions.mjs:492
js-site-missions-mode-itg = Integriteit

# src/js/missions.mjs:492
js-site-missions-mode-nav = Vrije drift

# src/js/missions.mjs:492
js-site-missions-mode-orb = Geometrie

# src/js/missions.mjs:492
js-site-missions-mode-spf = Spoofing

# src/js/missions.mjs:492
js-site-missions-mode-tim = Tijdsynchronisatie

# src/js/missions.mjs:925
js-site-missions-n-of-total = { $n } van { $total }

# src/js/missions.mjs:651
js-site-missions-no-fix = geen positiebepaling

# src/js/missions.mjs:487
js-site-missions-no-seed = deterministisch, geen seed

# src/js/missions.mjs:471
js-site-missions-open-in-studio = Openen in { $studio }

# src/js/missions.mjs:472
js-site-missions-open-report = Het rapport van de engine openen

# src/js/missions.mjs:954
js-site-missions-ow-chart-aria = Respons van de ontvanger gedurende de run voor { $name }: zichtbare relays, en positiefout met alleen relays en met de afstandsmeting tot de aarde

# src/js/missions.mjs:994
js-site-missions-ow-chip-epochs = epochen

# src/js/missions.mjs:994
js-site-missions-ow-chip-mask = masker

# src/js/missions.mjs:998
js-site-missions-ow-chip-orbiter = orbiter

# src/js/missions.mjs:999
js-site-missions-ow-chip-range = afstand σ

# src/js/missions.mjs:998
js-site-missions-ow-chip-relays = relays

# src/js/missions.mjs:998
js-site-missions-ow-chip-relays-value = { $planes } × { $per } op { $alt } km, { $inc }°

# src/js/missions.mjs:994
js-site-missions-ow-chip-span = bereik

# src/js/missions.mjs:989
js-site-missions-ow-count-relays = { $n } relays en een orbiter · { $body }

# src/js/missions.mjs:989
js-site-missions-ow-count-sats = { $n } satellieten · { $body }

# src/js/missions.mjs:987
js-site-missions-ow-engine = engine v{ $version } · build { $commit }

# src/js/missions.mjs:991
js-site-missions-ow-lat-label = Breedtegraad van de ontvanger

# src/js/missions.mjs:940
js-site-missions-ow-map-aria = Respons van de ontvanger voor { $name }: een kaart van { $body } per cel van 10 graden, met ernaast het gemiddelde en minimale aantal zichtbare satellieten en de gemiddelde PDOP per breedtegraad

# src/js/missions.mjs:1008
js-site-missions-ow-note-imagery = Beeldmateriaal van { $body }: NASA.

# src/js/missions.mjs:1007
js-site-missions-ow-note-rebuilt = Banen: de relays en de orbiter opnieuw opgebouwd uit het scenario, precies zoals de engine ze opbouwt; het aantal zichtbare satellieten dat ze opleveren komt overeen met dat van de engine op alle { $n } epochen.

# src/js/missions.mjs:1006
js-site-missions-ow-note-sats = Banen: de satellieten van de run hier opnieuw gepropageerd en getoetst aan alle { $n } grondspoorsamples die de engine schreef (slechtste { $deg }°).

# src/js/missions.mjs:1008
js-site-missions-ow-note-scaled = Baanstralen zijn voor weergave geschaald; vlakken, fasering en omlooptijden zijn die van de run.

# src/js/missions.mjs:1008
js-site-missions-ow-note-tracks = De engine schreef grondsporen voor { $shown } van de { $total } satellieten; alle { $total } worden getekend vanuit hun schillen.

# src/js/missions.mjs:1005
js-site-missions-ow-note-walker = Banen: de Walker-schillen van de run hier opnieuw gepropageerd en getoetst aan alle { $n } grondspoorsamples die de engine schreef (slechtste { $deg }°).

# src/js/missions.mjs:994
js-site-missions-ow-off = uit

# src/js/missions.mjs:994
js-site-missions-ow-on = aan

# src/js/missions.mjs:1025
js-site-missions-ow-pause = De banen pauzeren

# src/js/missions.mjs:1025
js-site-missions-ow-play = De banen afspelen

# src/js/evidence.mjs:199
js-site-evidence-raim-scale-aria = Kleurschaal: aandeel van de gebruikte tolerantieband, logaritmisch van 10 tot de macht min 11 tot de rand van de band

# src/js/missions.mjs:1012
js-site-missions-ow-time = t = { $time }

# src/js/missions.mjs:997
js-site-missions-ow-time-label = Missietijd

# src/js/missions.mjs:978
js-site-missions-ow-valuetext = { $time }, { $n } relays zichtbaar

# src/js/missions.mjs:667
js-site-missions-pdop-title = Gemiddelde PDOP (positie-verdunning van precisie), logaritmische schaal, lager is beter

# src/js/missions.mjs:474
js-site-missions-report = Rapport

# src/js/missions.mjs:474
js-site-missions-report-title = Het eigen rapport van de engine over deze run

# src/js/missions.mjs:928
js-site-missions-ro-above-horizon = boven de horizon

# src/js/missions.mjs:919
js-site-missions-ro-availability = Beschikbaarheid, PDOP ≤ { $limit }

# src/js/missions.mjs:928
js-site-missions-ro-earth-light = Aarde · lichttijd { $s } s

# src/js/missions.mjs:926
js-site-missions-ro-error-relays = Positiefout, alleen relays

# src/js/missions.mjs:928
js-site-missions-ro-occulted = bedekt

# src/js/missions.mjs:922
js-site-missions-ro-place-availability = Bij { $place }: beschikbaarheid

# src/js/missions.mjs:921
js-site-missions-ro-place-in-view = Bij { $place }: zichtbaar, gemiddeld · minimaal

# src/js/missions.mjs:925
js-site-missions-ro-relays = Zichtbare relays

# src/js/missions.mjs:918
js-site-missions-ro-satellites = Satellieten

# src/js/missions.mjs:927
js-site-missions-ro-with-earth = Met de afstandsmeting tot de aarde

# src/js/missions.mjs:1295
js-site-missions-run-failed = De vastgelegde run kon hier niet worden geladen; open hem in { $studio } via de onderstaande koppeling.

# src/js/missions.mjs:487
js-site-missions-seed = seed { $seed }

# src/js/missions.mjs:241
js-site-missions-spoof-aria = Spoofing-offset uitgezet tegen de tijd, met de detectiegrens en de detectietijd van elke monitor

# src/js/missions.mjs:244
js-site-missions-spoof-axis-x = tijd sinds het begin van de spoofing (s)

# src/js/missions.mjs:245
js-site-missions-spoof-axis-y = tijdoffset (ns)

# src/js/missions.mjs:255
js-site-missions-spoof-detects = { $id } detecteert na { $s } s

# src/js/missions.mjs:257
js-site-missions-spoof-lg-bound = grens van { $id }

# src/js/missions.mjs:257
js-site-missions-spoof-lg-offset = spoofing-offset

# src/js/missions.mjs:270
js-site-missions-spoof-readout = t { $t } s · offset { $offset } ns

# src/js/missions.mjs:246
js-site-missions-spoof-spec = specificatie { $v } ns

# src/js/missions.mjs:615
js-site-missions-sr-aria = { $members }; gedeelde jammer { $power } dBW

# src/js/missions.mjs:615
js-site-missions-sr-aria-member = { $label }: tracking behouden { $held } %, gemiddelde jammer-signaalverhouding { $js } dB, minimaal getrackte satellieten { $min }

# src/js/missions.mjs:607
js-site-missions-sr-car = Auto

# src/js/missions.mjs:612
js-site-missions-sr-fewest = minimaal getrackt

# src/js/missions.mjs:610
js-site-missions-sr-held = tracking behouden

# src/js/missions.mjs:611
js-site-missions-sr-mean-js = gemiddelde J/S

# src/js/missions.mjs:607
js-site-missions-sr-ship = Schip

# src/js/missions.mjs:1302
js-site-missions-swipe =
    { $n ->
        [one] Veeg voor het { $n } scenariobestand
       *[other] Veeg voor alle { $n } scenariobestanden
    }

# src/js/missions.mjs:478
js-site-missions-toml-download-title = Het scenariobestand dat is uitgevoerd downloaden

# src/js/missions.mjs:477
js-site-missions-toml-title = Het scenariobestand dat is uitgevoerd

# src/js/missions.mjs:663
js-site-missions-vis-title = Zichtbare satellieten, gemiddelde over de run

# src/js/missions.mjs:662
js-site-missions-vis-uniform = { $v } in elke cel

# src/site.js:417
js-site-palette-none = Geen resultaten

# src/site.js:417
js-site-palette-results = { $count } resultaten

# src/js/pro-power.mjs:147
js-site-pro-band-at = Na { $minutes } minuten: 5e tot 95e percentiel

# src/js/pro-power.mjs:147
js-site-pro-band-range = { $lo } tot { $hi } { $unit }

# src/js/pro-power.mjs:148
js-site-pro-band-runs-within = van { $n } runs binnen ±{ $limit } { $unit }

# src/js/pro-power.mjs:92
js-site-pro-design-readout = { $sat } satellieten, { $av } % beschikbaarheid · { $planes } vlakken op { $alt } km, { $incl }°

# src/js/pro-power.mjs:91
js-site-pro-front-design = Front-ontwerp { $id }

# src/js/pro-power.mjs:91
js-site-pro-front-design-knee = Front-ontwerp { $id } · knik

# src/js/pro-power.mjs:90
js-site-pro-more-designs =
    { $n ->
        [one] (+{ $n } ander front-ontwerp op dit punt)
       *[other] (+{ $n } andere front-ontwerpen op dit punt)
    }

# src/js/pro-power.mjs:94
js-site-pro-not-rerun = niet opnieuw uitgevoerd

# src/js/pro-power.mjs:93
js-site-pro-rerun-free = opnieuw uitgevoerd in de gratis engine:

# src/js/pro-power.mjs:94
js-site-pro-same-sha = dezelfde SHA-256 { $sha }…

# src/js/pro-power.mjs:94
js-site-pro-same-sha-index = dezelfde SHA-256 van het resultaat als de index

# src/site.js:41
js-site-toast-copied = Gekopieerd: { $text }

# src/site.js:351
js-site-toast-data-failed = Het gegevensbestand kon niet worden geladen

# src/site.js:350
js-site-toast-data-saved = Gegevens opgeslagen als CSV

# src/site.js:348
js-site-toast-no-data = Geen gegevens voor deze grafiek

# src/site.js:340
js-site-toast-svg-saved = Grafiek opgeslagen als SVG

# src/site.js:346
js-site-toast-table-saved = Tabel opgeslagen als CSV

# src/js/home-waterfall.mjs:248
js-site-waterfall-axis-now = nu

# src/js/home-waterfall.mjs:353
js-site-waterfall-bar-title = { $band }: { $cn0 } dB-Hz, { $state }

# src/js/home-waterfall.mjs:353
js-site-waterfall-bar-title-js = { $band }: { $cn0 } dB-Hz, { $state }, J/S { $js } dB

# src/js/home-waterfall.mjs:303
js-site-waterfall-below-floor = de signalen liggen onder de ruisvloer

# src/js/home-waterfall.mjs:79
js-site-waterfall-campaign-drives = Campagne die hij aanstuurt:

# src/js/home-waterfall.mjs:79
js-site-waterfall-campaign-seed = seed { $seed } · { $phases } fasen over { $duration } s

# src/js/home-waterfall.mjs:119
js-site-waterfall-chip-aria = { $band }, { $fc } megahertz: deze band tonen

# src/js/home-waterfall.mjs:120
js-site-waterfall-chip-title = { $band } · { $fc } MHz · bandbreedte van de ontvanger { $bw } MHz

# src/js/home-waterfall.mjs:78
js-site-waterfall-engine-build = Engine v{ $version } · build

# src/js/home-waterfall.mjs:86
js-site-waterfall-fallback-head = Terugval op Galileo · { $s } s, alleen CW-toon

# src/js/home-waterfall.mjs:86
js-site-waterfall-fallback-text = { $band } terug op { $v } dB-Hz. Integriteitsbewaking met alleen Galileo: beschermingsniveau { $min }–{ $max } m, onder de alarmgrens van { $limit } m.

# src/js/home-waterfall.mjs:107
js-site-waterfall-floor = trackingdrempel van { $thr } dB-Hz

# src/js/home-waterfall.mjs:85
js-site-waterfall-holdover-head = Holdover · { $s } s, chirp aan

# src/js/home-waterfall.mjs:85
js-site-waterfall-holdover-text = { $band0 } { $v0 }, { $band1 } { $v1 } dB-Hz, onder de drempel. De klok loopt vrij: slechtste { $worst } ns ten opzichte van een bewakingsmarge van { $guard } ns.

# src/js/home-waterfall.mjs:73
js-site-waterfall-jammer-off = { $what } uit

# src/js/home-waterfall.mjs:72
js-site-waterfall-jammer-on = { $what } aan

# src/js/home-waterfall.mjs:400
js-site-waterfall-live = { $freq } megahertz, { $time }: { $detail }

# src/js/home-waterfall.mjs:400
js-site-waterfall-live-band = { $band } { $cn0 } dB-Hz, { $state }

# src/js/home-waterfall.mjs:400
js-site-waterfall-live-none = geen gemodelleerde band

# src/js/home-waterfall.mjs:12
js-site-waterfall-load-failed = De vastgelegde run kon niet worden geladen. Het rapport van de engine hieronder toont dezelfde run.

# src/js/home-waterfall.mjs:298
js-site-waterfall-no-jammer-band = Geen jammer in deze band

# src/js/home-waterfall.mjs:346
js-site-waterfall-no-jammer-in-band = geen jammer in de band

# src/js/home-waterfall.mjs:78
js-site-waterfall-no-seed = deterministisch, geen seed

# src/js/home-waterfall.mjs:84
js-site-waterfall-onset-head = Begin · { $t0 }–{ $t1 } s

# src/js/home-waterfall.mjs:84
js-site-waterfall-onset-text = Alle { $n } banden worden getrackt, totdat de spectrumrun { $band } voor het eerst verliest na { $s } s.

# src/js/home-waterfall.mjs:447
js-site-waterfall-pause = Het waterval-diagram pauzeren

# src/js/home-waterfall.mjs:447
js-site-waterfall-play = Het waterval-diagram afspelen

# src/js/home-waterfall.mjs:305
js-site-waterfall-quiet-band = { $band } { $cn0 } dB-Hz · { $state }

# src/js/home-waterfall.mjs:48
js-site-waterfall-run-time = run T+{ $s } s

# src/js/home-waterfall.mjs:109
js-site-waterfall-scale-caption = PSD boven de ruisvloer van { $floor } dBW/Hz · cellen van { $bin } MHz × { $step } s

# src/js/home-waterfall.mjs:78
js-site-waterfall-seed = seed { $seed }

# src/js/home-waterfall.mjs:61
js-site-waterfall-short-lost = verloren

# src/js/home-waterfall.mjs:61
js-site-waterfall-short-ok = tracking

# src/js/home-waterfall.mjs:61
js-site-waterfall-short-rec = herst.

# src/js/home-waterfall.mjs:59
js-site-waterfall-state-lost = Lock verloren

# src/js/home-waterfall.mjs:60
js-site-waterfall-state-lost-low = lock verloren

# src/js/home-waterfall.mjs:59
js-site-waterfall-state-ok = Tracking

# src/js/home-waterfall.mjs:60
js-site-waterfall-state-ok-low = tracking

# src/js/home-waterfall.mjs:59
js-site-waterfall-state-rec = Hersteld

# src/js/home-waterfall.mjs:60
js-site-waterfall-state-rec-low = hersteld

# src/js/home-waterfall.mjs:94
js-site-waterfall-summary-recovers = { $band } verliest de lock na { $lost } s en herstelt na { $rec } s, laagste { $min } dB-Hz.

# src/js/home-waterfall.mjs:91
js-site-waterfall-summary-rows = { $n } rijen van { $step } s.

# src/js/home-waterfall.mjs:95
js-site-waterfall-summary-stays-lost = { $band } verliest de lock na { $lost } s en blijft verloren, laagste { $min } dB-Hz.

# src/js/home-waterfall.mjs:92
js-site-waterfall-summary-tracks = { $band } wordt de hele tijd getrackt, laagste { $min } dB-Hz.

# src/js/home-waterfall.mjs:381
js-site-waterfall-tip-above-floor = boven de ruisvloer

# src/js/home-waterfall.mjs:381
js-site-waterfall-tip-at-floor = Op de thermische ruisvloer

# src/js/home-waterfall.mjs:382
js-site-waterfall-tip-band = { $cn0 } dB-Hz · { $state }

# src/js/home-waterfall.mjs:380
js-site-waterfall-tip-head = { $lo }–{ $hi } MHz · { $time }

# src/js/home-waterfall.mjs:382
js-site-waterfall-tip-js = J/S { $js } dB

# src/js/home-waterfall.mjs:383
js-site-waterfall-tip-no-band = De bandbreedte van de ontvanger van geen enkele gemodelleerde band bestrijkt deze kolom

# src/js/home-waterfall.mjs:65
js-site-waterfall-wave-chirp = chirp

# src/js/home-waterfall.mjs:65
js-site-waterfall-wave-cw = CW-toon

# src/js/home-waterfall.mjs:65
js-site-waterfall-wave-noise = ruis

# src/js/home-waterfall.mjs:341
js-site-waterfall-who-cursor = Band onder de cursor

# src/js/home-waterfall.mjs:341
js-site-waterfall-who-selected = Geselecteerde band

# src/js/home-waterfall.mjs:341
js-site-waterfall-who-worst = Slechtste band
