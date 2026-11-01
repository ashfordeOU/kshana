# site-js.ftl (et): translations

js-app-engine-failed = Mootorit ei õnnestunud laadida ({ $reason }).

js-ledger-rows =
    { $n ->
        [one] { $n } registrirea
       *[other] { $n } registririda
    }

js-site-action-copy-install = Kopeeri: cargo install kshana

js-site-action-launch = Käivita { $name }

js-site-action-licence = Võta meiega ühendust ärilitsentsi asjus

js-site-action-pro-eval = Taotle Kshana Pro hindamisversiooni

js-site-action-study = Telli uuring

js-site-action-theme = Vaheta hele ja tume kujundus

js-site-capabilities-bd-after = { $m } m { $s } s pärast

js-site-capabilities-bd-combined = kombineeritud

js-site-capabilities-bd-crossing = { $m } m ajahetkel { $s } s

js-site-capabilities-bd-fig-crossing = «{ $m } m» { $s } s pärast, domineerib { $dom }

js-site-capabilities-bd-fig-lead = Aeg GNSS-i kadumisest logaritmteljel, { $grade }-klassi IMU kiirusel { $speed } m/s:

js-site-capabilities-bd-fig-tail = Jooned on mootori lühikese libisemise kasvuseadused ja nende ruutsumma ruutjuur; ületused tulevad mootori täielikust üheksaolekulisest (Schuleri) veamudelist, mis piirab nihketeguseid, seega pikkadel libisemistel tuleb iga ületus veidi hiljem, kui joon selleni jõuab. Tulbad: samad ületused nelja IMU klassi kohta.

js-site-capabilities-cd-canvas-aria = Satelliidikonstellatsioon oma keha ümber, päris pildimaterjal: pööramiseks lohista või kasuta nooleklahve, suumimiseks pluss- ja miinusklahve

js-site-capabilities-cd-design-meta = { $n } satelliiti · { $body } · { $file }

js-site-capabilities-cd-foot-frozen = Iga satelliit järgib mootori enda rada; külmutatud orbiidi raadius tuleneb kihi elementidest.

js-site-capabilities-cd-foot-mean-motion = Iga satelliit järgib mootori enda rada raadiusel, mille tema keskmine liikumine määrab.

js-site-capabilities-cd-foot-walker = Kõik { $n } satelliiti on paigutatud kihtide enda Walkeri parameetrite järgi (kontrollitud mootori { $shown } raja vastu: halvim { $deg }°); jäljed on mootori { $shown } rada.

js-site-capabilities-cd-hud-body = { $body } · «{ $n }» satelliiti

js-site-capabilities-cd-hud-mission = Missioon «{ $time }»

js-site-capabilities-cd-legend-shell = kiht { $n } · { $inc }°

js-site-capabilities-cd-map-availability = Käigu osa, kus PDOP ≤ { $limit } (0 kuni 100 %)

js-site-capabilities-cd-map-pdop = Keskmine PDOP { $step }° ruudu kohta ({ $lo } kuni { $hi }; heledam on parem)

js-site-capabilities-cd-map-visible = Nähtavate satelliitide keskmine arv ({ $lo } kuni { $hi })

js-site-capabilities-cd-metric-availability = Kättesaadavus

js-site-capabilities-cd-metric-pdop = Keskmine PDOP

js-site-capabilities-cd-metric-visible = Nähtaval

js-site-capabilities-cd-no-webgl = 3D-vaade vajab WebGL-i; katvuskaart ja joonised on sama käik.

js-site-capabilities-cd-pause = Peata orbiidid

js-site-capabilities-cd-play = Esita orbiidid

js-site-capabilities-cd-shell = { $name }: Walker { $pattern } { $total }/{ $planes }/{ $phasing } · { $alt } km · { $inc }°

js-site-capabilities-cd-slots = { $name }: { $n } satelliiti, operaatori pesade tabel

js-site-capabilities-cd-span = kestusest { $dur }, kordub

js-site-capabilities-cd-stat-in-view = Keskmiselt nähtaval

js-site-capabilities-cd-stat-mask = Kõrgusmask · käik

js-site-capabilities-cd-stat-median = Mediaan-PDOP

js-site-capabilities-cd-stat-pdop = PDOP ≤ { $limit }, kogu { $body }

js-site-capabilities-cd-stat-satellites = Satelliidid

js-site-capabilities-cd-stat-worst = Halvim koht

js-site-capabilities-cd-title-gnss = Neli GNSS-i koos

js-site-capabilities-cd-title-leo = Madala Maa orbiidi megakonstellatsioon

js-site-capabilities-cd-title-lunar = Kuu releekomplekt

js-site-capabilities-cd-work-ratio = { $pct } % pärast laiuskraadi eelfiltrit · { $dop } DOP-lahendit

js-site-capabilities-cd-work-tests = { $after } satelliidi ja punkti testi; jõumeetodil läbivaatus teeks neid { $brute }

js-site-capabilities-cd-work-title = Nähtavuse töö

js-site-capabilities-cg-cn0-sub = C/N0 jälgimispiiri suhtes

js-site-capabilities-cg-cn0-title = Kandja ja müra tihedus

js-site-capabilities-cg-compose-availability = Kättesaadavus

js-site-capabilities-cg-compose-fewest = Vähim jälgitud

js-site-capabilities-cg-compose-js = Keskmine J/S

js-site-capabilities-cg-compose-text = Üks segaja, { $power } { $unit }, ühes kohas, seotud { $n } liikmekäiguga liigist ‹{ $kind }›: laev väinas ja auto rannateel näevad sama põhjust ja saavad erineva vastuse.

js-site-capabilities-cg-log-campaign = kampaania { $file } · { $phases } faasi · { $runs } liikmekäiku

js-site-capabilities-cg-log-phase = faas { $name } algab

js-site-capabilities-cg-log-phase-carries = faas { $name } algab · kannab edasi { $carried }

js-site-capabilities-cg-monte-axis = lõplik kellaviga { $n } algväärtuse põhjal ({ $path })

js-site-capabilities-cg-monte-ci = Keskmine, 95 % vahemik

js-site-capabilities-cg-monte-mean = Keskmine

js-site-capabilities-cg-monte-p05 = 5.

js-site-capabilities-cg-monte-p05-p95 = 5. kuni 95.

js-site-capabilities-cg-monte-p50 = mediaan

js-site-capabilities-cg-monte-p95 = 95.

js-site-capabilities-cg-monte-std = Standardhälve

js-site-capabilities-cg-monte-text = Sama ‹{ $kind }› stsenaarium käivitatud { $n } korda baasalgväärtusest { $seed }, igaüks ühe algväärtusega: vabalt käiva kella lõppvea hajuvus koos selle keskmise 95 % usaldusvahemikuga.

js-site-capabilities-cg-not-in-phase = pole selles faasis

js-site-capabilities-cg-now = Faas { $n } / { $total }: { $name } · { $from } kuni { $to }

js-site-capabilities-cg-phase-title = { $name }: { $from } kuni { $to } · lõpetas { $by } · liikmeliigid { $kinds }

js-site-capabilities-cg-pl-sub = häirepiiri suhtes

js-site-capabilities-cg-pl-title = Kaitsetase

js-site-capabilities-cg-pos-sub = oma eelarve suhtes · log

js-site-capabilities-cg-pos-title = Inertsiaalne asukohaviga

js-site-capabilities-cg-range = { $lo } kuni { $hi }

js-site-capabilities-cg-sweep-all-lost = Kõik kadunud alates

js-site-capabilities-cg-sweep-axis = segaja saatevõimsus ({ $key })

js-site-capabilities-cg-sweep-first-loss = Esimene kadu

js-site-capabilities-cg-sweep-lg-availability = kättesaadavus

js-site-capabilities-cg-sweep-lg-js = keskmine J/S

js-site-capabilities-cg-sweep-never = mitte kunagi

js-site-capabilities-cg-sweep-nodes = Sõlmed

js-site-capabilities-cg-sweep-none = puudub

js-site-capabilities-cg-sweep-span = J/S ulatus

js-site-capabilities-cg-sweep-text = Üks ‹{ $kind }› stsenaarium, käivitatud üks kord sõlme kohta, kui segaja saatevõimsus muutub sammhaaval väärtusest { $from } väärtuseni { $to } { $unit }. Kättesaadavus segamise all (pidev joon) ja keskmine J/S (katkendjoon) tulevad iga liikmekäigu enda kvaliteedinäitajatest.

js-site-capabilities-cg-te-sub = oma valvepiiri suhtes

js-site-capabilities-cg-te-title = Kella ajaviga

js-site-capabilities-copy = Kopeeri

js-site-capabilities-copy-aria = Kopeeri käsk, mis käigu taasloob: kshana { $file }

js-site-capabilities-cz-best = Parim PDOP

js-site-capabilities-cz-failed = Salvestatud käiku ei saanud siin laadida; ava see hoopis Studios.

js-site-capabilities-cz-fix = Asukohalahendiga näidised

js-site-capabilities-cz-fix-value = { $n } / { $total } ({ $pct }%)

js-site-capabilities-cz-median = Mediaan-PDOP

js-site-capabilities-engine = Mootor v{ $version }

js-site-capabilities-engine-build = Mootor v{ $version }, ehitus

js-site-capabilities-engine-report = Mootori aruanne

js-site-capabilities-globe-aria = { $name } oma tegelikul pildimaterjalil ({ $credit }). Pööramiseks lohista või kasuta nooleklahve; pluss ja miinus suumivad.

js-site-capabilities-ho-ends = käik lõpeb ajal { $t }

js-site-capabilities-ho-past-guard = üle valvepiiri

js-site-capabilities-no-seed = deterministlik, algväärtuseta

js-site-capabilities-open-in-studio = Ava rakenduses { $studio }

js-site-capabilities-open-report = Ava mootori aruanne

js-site-capabilities-orrery-aria = Päikesesüsteem käigu epohhil: pööramiseks lohista või kasuta nooleklahve, suumimiseks pluss- ja miinusklahve

js-site-capabilities-orrery-bodies = { $n } keha · vaatleja «{ $observer }»

js-site-capabilities-orrery-epoch = Epohh «{ $epoch }» · TDB (baritsentriline dünaamiline aeg), Juliuse päev { $jd }

js-site-capabilities-pnt-chart-title = nähtavad releed (joon) · Maa horisondi kohal (varjutatud) · asukohalahendiks on vaja nelja

js-site-capabilities-pnt-kicker = Positsioneerimine sellel kehal · body-pnt liik

js-site-capabilities-pnt-lander = Maandur punktis { $lat }°, { $lon }° pinnal navigeerib releede abil, kasutades Maa kahesuunalist kaugust alati, kui Maa on horisondi kohal (ühesuunaline valgusaeg { $min } min). Kättesaadavus: { $a } % ainult releedega, { $b } % koos Maa lingiga.

js-site-capabilities-pnt-orbiter = Orbiidil olev kasutaja navigeerib releede abil, kasutades Maa kahesuunalist kaugust alati, kui Maa on horisondi kohal (ühesuunaline valgusaeg { $min } min). Kättesaadavus: { $a } % ainult releedega, { $b } % koos Maa lingiga.

js-site-capabilities-pnt-relays = { $n } releed kõrgusel { $alt } km keha { $body } ümber

js-site-capabilities-report-data = Aruanne ja andmed

js-site-capabilities-result-data = Tulemusandmed

js-site-capabilities-saved = Salvestatud { $name }

js-site-capabilities-scenario-file = Stsenaariumifail

js-site-capabilities-seed = algväärtus { $seed }

js-site-capabilities-six-clock-fig = «{ $id }» hoiab valvepiiri { $dur }

js-site-capabilities-six-clock-guard = { $v } ns valvepiir

js-site-capabilities-six-coast-budget = { $m } m eelarve

js-site-capabilities-six-coast-denied = GNSS keelatud

js-site-capabilities-six-coast-fig = «{ $id }» eelarve piires { $s } s

js-site-capabilities-six-floor = jälgimispiir

js-site-capabilities-six-integ-fig = «{ $ok }» epohhist { $n }-st kättesaadav · häirepiirid { $h } m horisontaalselt, { $v } m vertikaalselt

js-site-capabilities-six-integ-limit = vertikaalne häirepiir

js-site-capabilities-six-integ-pl = vertikaalne (pidev) ja horisontaalne (katkendjoon) kaitsetase

js-site-capabilities-six-jam-effective = efektiivne, { $n } satelliiti

js-site-capabilities-six-jam-fig = Jälgitud «{ $min }», nähtavaid { $max } · kättesaadavus segamise all «{ $av }» (nominaalne { $nom }) · keskmine J/S «{ $js } dB»

js-site-capabilities-six-jam-nominal = nominaalne, segajata (katkendjoon)

js-site-capabilities-six-orbit-fig = Kõrgus «{ $lo }–{ $hi } km» · maapealne jälg { $dur } jooksul

js-site-capabilities-six-orbit-label = { $source } · { $n } näidist

js-site-capabilities-six-orbit-sgp4 = SGP4 kaherealisest elemendikomplektist

js-site-capabilities-six-spoof-detects = { $id } tuvastab

js-site-capabilities-six-spoof-fig = «{ $id }» tuvastab ajal { $s } s (piir { $ns } ns)

js-site-capabilities-ss-angle = Nurk Päikesest

js-site-capabilities-ss-credit = Pildimaterjal: { $credits }. * Kaart ei ulatu poolusteni; vahe saab kaardi polaarse keskmise värvi. Saturni rõngad: { $ring } ({ $licence }).

js-site-capabilities-ss-days = { $v } päeva

js-site-capabilities-ss-frame-origin = Tugisüsteemi alguspunkt

js-site-capabilities-ss-from-sun = Päikesest

js-site-capabilities-ss-gloss = NAIF: NASA navigatsiooni- ja abiinfo keskuse (Navigation and Ancillary Information Facility) kehakood. GM: gravitatsiooniparameeter. J2: lamestumise liige. IAU pool: Rahvusvahelise Astronoomialiidu pöörlemispool, rektastensiooni (RA) ja deklinatsioonina (Dec).

js-site-capabilities-ss-j2-none = avaldamata

js-site-capabilities-ss-kind = { $class } · NAIF { $naif }

js-site-capabilities-ss-kind-of = { $class } keha { $parent } ümber · NAIF { $naif }

js-site-capabilities-ss-light-time = Valgusaeg vaatleja { $observer } suhtes

js-site-capabilities-ss-link = { $from } – { $to }, ühesuunaline valgusaeg { $one }, edasi-tagasi { $two }

js-site-capabilities-ss-links-lead =
    { $n ->
        [one] Selle käigu arvutatud link:
       *[other] Selle käigu arvutatud lingid:
    }

js-site-capabilities-ss-moons =
    { $n ->
        [one] Selle kuu, mõõtkavas, epohhil
       *[other] Selle kuud, mõõtkavas, epohhil
    }

js-site-capabilities-ss-nominal-error = nominaalne viga { $km } km kaugusel

js-site-capabilities-ss-north = Vaadatud ekliptika põhjapoolt.

js-site-capabilities-ss-period = Tiirlemisperiood

js-site-capabilities-ss-period-about = Periood keha { $parent } ümber

js-site-capabilities-ss-pole = IAU pool (RA, Dec)

js-site-capabilities-ss-radius = Keskmine raadius

js-site-capabilities-ss-retrograde = { $v } h, retrograadne

js-site-capabilities-ss-rotation = Sideeriline pöörlemine

js-site-capabilities-ss-years = { $v } aastat

js-site-capabilities-st-bound = { $v } m piir

js-site-capabilities-st-fig-none = { $n } epohhi, ühelgi pole viga piirist suurem. Horisontaalselt: tegelik asukohaviga; vertikaalselt: kaitsetase; mõlemad logaritmteljel.

js-site-capabilities-st-fig-some = { $n } epohhi, vea ületab piiri epohhidel: { $k }. Horisontaalselt: tegelik asukohaviga; vertikaalselt: kaitsetase; mõlemad logaritmteljel.

js-site-capabilities-st-limit = häirepiir { $m } m

js-site-capabilities-st-misleading = eksitav: viga üle piiri

js-site-capabilities-st-normal = normaalne töö

js-site-capabilities-st-unavailable = kättesaamatu: piir üle häirepiiri

js-site-capabilities-studio-embedded = { $studio }, manustatud: orbit-multignss käik

js-site-capabilities-studio-load = Laadi { $studio } siia

js-site-capabilities-studio-outline = Näita ülevaadet uuesti

js-site-capabilities-wave-chirp = tširp

js-site-capabilities-wave-cw = CW-toon

js-site-capabilities-wave-noise = müra

js-site-capabilities-wf-an-caption = rida T+{ $t } s · dB üle mürataseme, logaritmskaala · kogu ruudustiku tipp { $peak } dB

js-site-capabilities-wf-degraded = Halvenenud

js-site-capabilities-wf-degraded-low = halvenenud

js-site-capabilities-wf-failed = Salvestatud käiku ei saanud siin laadida.

js-site-capabilities-wf-grid = ruudustik

js-site-capabilities-wf-iq = Ajahetkel T+{ $t } s joonistab mootor mudeli ka { $n } IQ-näidisena (faasis ja kvadratuuris) ümber { $mhz } MHz ning kontrollib selle vastu Welchi hinnangut ({ $segments } lõiku pikkusega { $nfft }): integreeritud võimsussuhe { $ratio }.

js-site-capabilities-wf-jammer-off = { $what } väljas

js-site-capabilities-wf-jammer-on = { $what } sees

js-site-capabilities-wf-jammer-open = { $name } · { $mhz } MHz · alates { $on } s kuni lõpuni

js-site-capabilities-wf-jammer-span = { $name } · { $mhz } MHz · { $on }–{ $off } s

js-site-capabilities-wf-lost = Lukk kadunud

js-site-capabilities-wf-lost-low = lukk kadunud

js-site-capabilities-wf-max = { $peak } dB üle selle · logaritmskaala alates { $v0 } dB

js-site-capabilities-wf-no-jammer = segaja puudub

js-site-capabilities-wf-now = praegu

js-site-capabilities-wf-pause = Peata juga

js-site-capabilities-wf-peak = tipp { $v } dB

js-site-capabilities-wf-play = Esita juga

js-site-capabilities-wf-replay-previous = kordusesituse algus · eelmine läbimine allpool

js-site-capabilities-wf-replay-start = kordusesituse algus

js-site-capabilities-wf-say = T+{ $t } s, { $band } { $v } dB-Hz, { $state }

js-site-capabilities-wf-signal = signaal +{ $v } dB

js-site-capabilities-wf-summary = Salvestatud käik { $file }: { $bands } sagedusriba, { $jammers } segajat { $seconds } sekundi jooksul. Halvim sagedusriba, { $worst }, langeb tasemele { $min } dB-Hz ajal { $at } s; jälgimispiir { $floor } dB-Hz.

js-site-capabilities-wf-tip-above = { $v } dB üle mürataseme

js-site-capabilities-wf-tip-in = sagedusribas: { $bands }

js-site-capabilities-wf-tracking = Jälgimine

js-site-capabilities-wf-tracking-low = jälgimine

js-site-caphero-aria = Päikesesüsteem mootori päikesesüsteemi käigust kuupäeval { $date }: Päike ja { $bodies } keha, mis liiguvad mööda oma mootori orbiidiradu; { $valid } orbiiti on valideeritud JPL Horizonsi vastu.

js-site-caphero-clock = +{ $days } päeva · { $date }

js-site-caphero-copy-command = Kopeeri käsk

js-site-caphero-copy-title = Kopeeri käsk, mis selle taasloob

js-site-caphero-credits = Kaugused on logaritmskaalal tihendatud, suunad tõesed; kehad on suurendatud, pöörlevad kuvakiirusega. Pildimaterjal: { $credits }; Saturni rõngad: { $ring } ({ $licence }).

js-site-caphero-credits-summary = Mõõtkava ja pildimaterjali viited

js-site-caphero-engine-build = Mootor v{ $version }, ehitus

js-site-caphero-explore = Uuri iga keha

js-site-caphero-file-title = Käivitatud stsenaariumifail

js-site-caphero-list-item = { $name }: { $label }, { $au } au Päikesest epohhil, tiirlemisperiood { $period }.

js-site-caphero-list-item-light = { $name }: { $label }, { $au } au Päikesest epohhil, tiirlemisperiood { $period }, valgusaeg vaatleja { $observer } suhtes { $light }.

js-site-caphero-no-seed = deterministlik, algväärtuseta

js-site-caphero-open-in-studio = Ava rakenduses { $studio }

js-site-caphero-pause = Peata orbiidid

js-site-caphero-period-days = { $value } päeva

js-site-caphero-period-years = { $value } aastat

js-site-caphero-play = Esita orbiidid

js-site-caphero-rate = { $days } käigu päeva sekundis

js-site-caphero-rate-epoch = Kaader käigu epohhil

js-site-caphero-read-distance = { $au } au Päikesest

js-site-caphero-read-light = valgusaeg vaatleja { $observer } suhtes epohhil { $light }

js-site-caphero-read-orbit = orbiit { $period }

js-site-caphero-seed = algväärtus { $seed }

js-site-copy-aria = Kopeeri: { $cmd }

js-site-developers-captured-from = jäädvustatud { $recorded } allikast

js-site-developers-engine-build = Mootor v{ $version }, ehitus

js-site-developers-exit-stamp = väljumine { $rc } · { $ms } ms

js-site-developers-file-open-in-studio = { $file }: ava rakenduses { $studio }

js-site-developers-no-seed = (deterministlik, algväärtuseta)

js-site-developers-open-in-studio = Ava rakenduses { $studio }

js-site-developers-pause = Peata kordus

js-site-developers-play = Esita kordus

js-site-developers-replaying = # salvestatud seansi taasesitus

js-site-developers-seed = (algväärtus { $seed })

js-site-developers-what-runs-write = Mida iga käik kirjutab

js-site-editions-builds-on-it = { $label } ehitab sellele

js-site-editions-core-kinds =
    { $n ->
        [one] { $n } liik
       *[other] { $n } liiki
    }

js-site-editions-core-title = Avatud tuum

js-site-editions-core-validated = valideeritud

js-site-editions-core-validated-of = { $validated } / { $total }

js-site-editions-free-core = Tasuta avatud tuumas, nagu iga liik

js-site-editions-group-other = Muu

js-site-editions-kind-no-ledger = ühegi registrimooduli nimi ei vasta sellele

js-site-editions-kind-validated = { $v } / { $tot } registrireast valideeritud

js-site-editions-pause = Peata rõngad

js-site-editions-play = Esita rõngad

js-site-editions-ring-pro = Kshana Pro

js-site-editions-ring-study = Kohandatud uuring

js-site-evidence-allan-aria = Nelja hälbe NIST SP 1065 1000-punktilise andmekogumi põhjal keskmistamisaja suhtes; kõik { $n } avaldatud väärtust on reprodutseeritud, halvim suhteline viga { $err }

js-site-evidence-allan-lg-published = avaldatud väärtus, SP 1065 tabel 31

js-site-evidence-allan-mdev = modifitseeritud Alani hälve

js-site-evidence-allan-na = n/a

js-site-evidence-allan-oadev = kattuv Alani hälve

js-site-evidence-allan-ohdev = kattuv Hadamardi hälve

js-site-evidence-allan-read = { $tau } s · Alan { $oadev } · modifitseeritud { $mdev } · Hadamard { $ohdev }

js-site-evidence-allan-st-gate = testi piirväärtus

js-site-evidence-allan-st-reproduced = reprodutseeritud avaldatud väärtused

js-site-evidence-allan-st-worst = halvim suhteline viga

js-site-evidence-allan-tdev = ajahälve, sekundites

js-site-evidence-allan-tip-at = «{ $name }» ajal { $m } s

js-site-evidence-allan-tip-engine = mootor: «{ $got }» · suhteline viga { $err }

js-site-evidence-allan-tip-table = SP 1065 tabel 31: «{ $want }»

js-site-evidence-cell-tip = Võimekus { $i } / { $n } · «{ $label }»

js-site-evidence-cowell-aria = Asukohaerinevus Orekiti suhtes 24 tunni jooksul: jõutasemed 1 kuni 5 jäävad alla { $worst }; takistustase ulatub väärtuseni { $drag }, iseloomustusvahemik

js-site-evidence-cowell-gto = geostatsionaarne siirdeorbiit

js-site-evidence-cowell-leo = madal Maa orbiit

js-site-evidence-cowell-lg-con = tasemed 1 kuni 5, kahe keha mudel kuni päikesekiirguse rõhuni, kaks orbiiti kummagi kohta

js-site-evidence-cowell-lg-drag = tase 6, takistus: ainult iseloomustus (erinevad tiheduse mudelid)

js-site-evidence-cowell-read = { $h } h · tasemed 1 kuni 5 halvim { $con } · takistus { $drag }

js-site-evidence-cowell-st-drag = takistustase, halvim

js-site-evidence-cowell-st-epochs = epohhid tasemetel 1 kuni 5

js-site-evidence-cowell-tip-tier = «Tase { $tier }: { $label }» · { $regime }

js-site-evidence-cowell-tip-worst = halvim erinevus «{ $err }» ajal { $h } h

js-site-evidence-hero-live = { $label }. { $cap }. { $oracle }

js-site-evidence-hero-no-oracle = Välist oraaklit pole nimetatud.

js-site-evidence-hero-oracle = Oraakel

js-site-evidence-hero-oracle-is = Oraakel: { $o }

js-site-evidence-hero-owner = Omanik

js-site-evidence-hero-partner = Selle omanik on partner; mootor ei väida sellest midagi.

js-site-evidence-hero-pause = Peata pühkimine

js-site-evidence-hero-play = Esita pühkimine

js-site-evidence-hero-row = Rida { $i } / { $n }

js-site-evidence-hold-accepted = aktsepteeritud: teguri { $bar } piires

js-site-evidence-hold-aria = Tseesiumkella mõõdetud ruutkeskmine ajaviga libisemisaja suhtes koos mootori ennustusega; ennustatud ja mõõdetud ületuse suhe vahemikus { $lo } kuni { $hi }

js-site-evidence-hold-control = «Kontroll:» naiivne ennustus (ühesekundiline stabiilsus loetuna valge sagedusmüraga) annab suhte { $ratio }, eksib umbes teguri { $factor } võrra ja ei saavuta sama läve. Lävel on hambad.

js-site-evidence-hold-lg-meas = mõõdetud tagasihoitud andmestikul (täpp: ületus)

js-site-evidence-hold-lg-pred = ennustatud esimese kolmandiku põhjal (rõngas: ületus)

js-site-evidence-hold-nodata = Mõõdetud andmestik ei olnud selle lehe loomisel saadaval.

js-site-evidence-hold-perfect = 1 = täiuslik

js-site-evidence-hold-ratio-aria = Ennustatud ja mõõdetud suhe { $n } piirväärtuse kohta, kõik aktsepteeritud teguri { $bar } piires

js-site-evidence-hold-read = libisemine { $h } h · mõõdetud { $m } ns · ennustatud { $p } ns

js-site-evidence-hold-st-fit = sobitamiseks kasutatud

js-site-evidence-hold-st-samples = ühesekundilised näidised

js-site-evidence-hold-st-syncs = tagasihoitud sünkroonipunktid

js-site-evidence-hold-tip-breach = ennustatud ületus { $p } s · mõõdetud { $m } s

js-site-evidence-hold-tip-error = «Ajaviga { $thr } ns»

js-site-evidence-hold-tip-ratio = ennustatud ja mõõdetud suhe «{ $ratio }»

js-site-evidence-hold-tip-row = «{ $thr } ns» · ennustatud ja mõõdetud suhe «{ $ratio }»

js-site-evidence-kernel-chi2-cdf = hii-ruut jaotus

js-site-evidence-kernel-chi2-quantile = hii-ruut kvantiil

js-site-evidence-kernel-noncentral = mittetsentraalne hii-ruut

js-site-evidence-kernel-normal-cdf = normaaljaotus

js-site-evidence-kernel-normal-quantile = normaalkvantiil

js-site-evidence-kernel-pbias = tuvastusnihe

js-site-evidence-ladder-aria = Orbiidi jääkvead vahemikus { $lo } kuni { $hi } m ühel logaritmskaalal, koos agentuuri lävega { $bar } m

js-site-evidence-ladder-bar = agentuuri lävi { $bar } m

js-site-evidence-ladder-cowell = Cowell Orekit 12.2 vastu, halvim

js-site-evidence-ladder-g24 = Galileo E11, 24-tunnine sobitus

js-site-evidence-ladder-g8 = Galileo E11, 8-tunnine sobitus

js-site-evidence-ladder-lg-headline = peamine jääkviga

js-site-evidence-ladder-lg-over = üle agentuuri läve { $bar } m

js-site-evidence-ladder-lg-ring = ainult jõumudel, enne empiirilisi kiirendusi

js-site-evidence-ladder-lro = Lunar Reconnaissance Orbiter, 4-tunnine sobitus

js-site-evidence-ladder-read = pühkimine väärtusel { $v } · { $n } / { $total } peamist jääkviga sellel või alla selle

js-site-evidence-ladder-rt-arc = { $arc } kaar · aste ja järk { $do } · { $n } vaatlust

js-site-evidence-ladder-rt-rtn = radiaalne { $r } m · piki rada { $a } m · risti rada { $c } m

js-site-evidence-ladder-sgp4 = SGP4 AIAA vektorite vastu, halvim

js-site-evidence-ladder-swarm = Swarm-A, 3-tunnine sobitus

js-site-evidence-ladder-tip-cowell = «Cowell · halvim { $n } epohhist» · { $worst }

js-site-evidence-ladder-tip-g24 = «Galileo E11 · terve ööpäev» · { $rms } m

js-site-evidence-ladder-tip-g8a = «Galileo E11 · ainult jõumudel» · { $rms } m

js-site-evidence-ladder-tip-g8b = «Galileo E11 · empiiriliste kiirendustega» · { $rms } m

js-site-evidence-ladder-tip-lrd = «Kuu orbiiter · dünaamiline» · { $rms } m

js-site-evidence-ladder-tip-lrr = «Kuu orbiiter · redutseeritud dünaamiline» · { $rms } m, üle läve { $bar } m ja esitatud sellisena, nagu see on

js-site-evidence-ladder-tip-sgp4 = «SGP4 · halvim { $n } vektorist» · { $worst }

js-site-evidence-ladder-tip-swd = «Swarm-A · dünaamiline» · { $rms } m, peaaegu kõik piki rada (takistus)

js-site-evidence-ladder-tip-swr = «Swarm-A · redutseeritud dünaamiline» · { $rms } m

js-site-evidence-raim-aria = { $pass } / { $n } SciPy juhtu oma tolerantsivööndis, { $kernels } tuuma peale

js-site-evidence-raim-lane = { $kernel } · { $n }

js-site-evidence-raim-lg-most = suurim osa vööndist, mida mõni juhtum kasutab

js-site-evidence-raim-read = juhtum { $q } / { $n } · { $kernel } · { $what }

js-site-evidence-raim-read-band = { $pct } % vööndist

js-site-evidence-raim-scale-aria = Värviskaala: kasutatud tolerantsivööndi osa, logaritmiline vahemikus 10 astmel miinus 11 kuni vööndi servani

js-site-evidence-raim-st-inside = vööndi sees

js-site-evidence-raim-st-most = suurem osa vööndist kasutatud

js-site-evidence-raim-tick-edge = vööndi serv

js-site-evidence-raim-tick-exact = täpne

js-site-evidence-raim-tip-case = «{ $kernel }» · juhtum { $j } / { $n }

js-site-evidence-raim-tip-exact = «täpne vaste» SciPyga

js-site-evidence-raim-tip-uses = kasutab «{ $pct } %» oma tolerantsivööndist

js-site-evidence-sgp4-aria = { $n } / { $n } AIAA vektorit reprodutseeritud; halvim { $worst }, mediaan { $median }, kõik tolerantsi { $tol } piires

js-site-evidence-sgp4-deep = sügavkosmos (SDP4)

js-site-evidence-sgp4-lg-deep = sügavkosmose vektor (SDP4)

js-site-evidence-sgp4-lg-median = mediaan ja halvim skaalal

js-site-evidence-sgp4-lg-near = Maa-lähedane vektor (SGP4)

js-site-evidence-sgp4-near = Maa lähedal (SGP4)

js-site-evidence-sgp4-read = vektor { $i } / { $n } · satelliit { $sat } · viga { $err }

js-site-evidence-sgp4-read-deep = vektor { $i } / { $n } · satelliit { $sat }, sügavkosmos · viga { $err }

js-site-evidence-sgp4-scale-aria = Värviskaala 0.1 mikromeetrist toleranntsini, logaritmiline

js-site-evidence-sgp4-st-deep = sügavkosmose vektorid

js-site-evidence-sgp4-st-sats = testsatelliidid

js-site-evidence-sgp4-tip-sat = «Satelliit { $sat }» · { $kind }

js-site-evidence-sgp4-tip-vector = vektor { $j } / { $n } · asukohaviga «{ $err }»

js-site-evidence-st-median = mediaan

js-site-evidence-st-worst = halvim

js-site-evidence-tolerance = tolerants { $v }

js-site-filter-in-all = { $total } kokku

js-site-filter-matches =
    { $n ->
        [one] { $n } vaste
       *[other] { $n } vastet
    }

js-site-filter-n-of-m = { $n } / { $total }

js-site-filter-n-of-m-rows = { $n } / { $total } rida

js-site-filter-rows = { $total } rida

js-site-home-banner-gnss-lost = GNSS kadunud · holdover

js-site-home-banner-holdover-out = Holdover · kell väljaspool valvepiiri

js-site-home-banner-integrity-holdover = Terviklikkuse alarm · holdover jätkub

js-site-home-banner-integrity-none = Terviklikkuse alarm · kaitsetaset pole

js-site-home-banner-integrity-pl = Terviklikkuse alarm · PL > AL

js-site-home-banner-jamming = Segamine · C/N0 jälgimispiiri lähedal

js-site-home-banner-spoofing = Spuufimise alarm · RF-detektor

js-site-home-cap-holdover = Segaja läheb tasemele { $dbw } dBW: { $trk } satelliiti jälgimisel. Kell käib vabalt alates väärtusest { $carry } ns, mille spuufer jättis, ja ületab oma valvepiiri { $guard } ns ajal { $at }; INS libiseb.

js-site-home-cap-integrity = Satelliidid naasevad, kuid ainult üle { $mask }° maski: { $trk } jälgimisel. Kaitsetase ületab häirepiiri { $al } m või seda ei saa moodustada, nii et monitor annab alarmi ja kell jääb holdover-olekusse.

js-site-home-cap-jamming = Lairiba segaja { $km } km kaugusel võimsusega { $dbw } dBW. C/N0 langeb tasemele { $cn } dB-Hz, { $above } dB üle jälgimispiiri { $floor } dB-Hz; kõik { $trk } satelliiti on endiselt jälgimisel.

js-site-home-cap-nominal = { $trk } satelliiti jälgimisel keskmise C/N0-ga { $cn } dB-Hz. Kell on distsiplineeritud GNSS-i ajaga ja kaitsetase ({ $pl } m) jääb häirepiirist { $al } m allapoole.

js-site-home-cap-recovery = GNSS taassünkroniseeritud: { $trk } satelliiti jälgimisel, ajaviga tagasi { $te } ns, kaitsetase { $pl } m.

js-site-home-cap-spoofing = Spuufer lükkab vastuvõtja kella kiirusega { $rate } ns/s. RF (raadiosageduse) detektor annab alarmi kohe; kellapõhine monitor rakendub { $det } s pärast ja faas lõpeb { $off } ns tagasi tõmmatuga.

js-site-home-cn-no-lock = 0 / { $max } jälgimisel · lukku pole

js-site-home-cn-tracking = { $n } / { $max } jälgimisel

js-site-home-no-pl = PL puudub

js-site-home-pause = Peata missioon

js-site-home-pl-alarm = alarm · PL üle AL-i

js-site-home-pl-no-sats = satelliite pole, PL puudub

js-site-home-pl-not-computed = selles faasis arvutamata

js-site-home-pl-too-few = liiga vähe satelliite

js-site-home-pl-under-al = alla häirepiiri { $thr } m (AL)

js-site-home-play = Esita missioon

js-site-home-receiver-tracking = Vastuvõtja · { $n } jälgimisel

js-site-home-replay-restarted = Kordus taaskäivitatud · { $file }

js-site-home-te-disciplined = distsiplineeritud GNSS-i järgi

js-site-home-te-free-running = holdover · vabalt käiv

js-site-home-te-outside-guard = holdover · väljaspool valvepiiri

js-site-home-te-spoofer = spuufer tõmbab kella

js-site-home-thr-floor = jälgimispiir

js-site-home-thr-guard = valvepiir

js-site-kind-action = Tegevus

js-site-mcp-arguments-excerpt = argumendid (väljavõte)

js-site-mcp-axis-mission-time = missiooniaeg

js-site-mcp-clock-holdover = { $clock } holdover

js-site-mcp-dir-reply = kshana-mcp → assistent

js-site-mcp-dir-request = assistent → kshana-mcp

js-site-mcp-figcaption = Joonistatud tagastatud reast: iga kella ajaviga künnise suhtes

js-site-mcp-fom-availability = kättesaadavus

js-site-mcp-fom-caption = run_scenario tagastatud kvaliteedinäitajad kella kohta

js-site-mcp-fom-header = Kvaliteedinäitaja

js-site-mcp-fom-holdover = holdover (s)

js-site-mcp-fom-p95 = ajaviga, 95. protsentiil (ns)

js-site-mcp-fom-rms = ajaviga, ruutkeskmine (ns)

js-site-mcp-lede = Salvestatud { $recorded } · v{ $version } · standardsisend ja -väljund · protokoll { $protocol } · ainult täpsed sõnumid

js-site-mcp-legend-gnss-lost = GNSS kadunud ajal { $s } s

js-site-mcp-legend-threshold = künnis { $v } ns

js-site-mcp-pause = Peata

js-site-mcp-play = Esita

js-site-mcp-plot-aria = Ajaviga: { $quantum } ja { $classical }, mille tagastas run_scenario, künnise { $threshold } ns suhtes; GNSS (ülemaailmne satelliitnavigatsioonisüsteem) kadus ajal { $lost } s

js-site-mcp-recorded-json = Salvestatud JSON: { $label }

js-site-mcp-scenario-hash = stsenaariumi räsi

js-site-mcp-server-identity = serveri identiteet

js-site-mcp-show-json = Näita JSON-i

js-site-mcp-step-aria = Samm { $n } / { $total }: { $name }

js-site-mcp-step-result = tulemus: kvaliteedinäitajad

js-site-mcp-step-status = Samm { $n } / { $total } · { $name }

js-site-mcp-summary-excerpt = kokkuvõtterida ja tulemus (väljavõte)

js-site-mcp-tab-result = tulemus

js-site-mcp-threshold = künnis

js-site-mcp-toml-lines =
    { $n ->
        [one] { $n } rida
       *[other] { $n } rida
    }

js-site-mcp-toml-more = … (veel { $n } rida failist { $file })

js-site-mcp-tool-count =
    { $n ->
        [one] { $n } tööriist
       *[other] { $n } tööriista
    }

js-site-mcp-tools-with-descriptions =
    { $n ->
        [one] { $n } tööriist kirjeldustega
       *[other] { $n } tööriista kirjeldustega
    }

js-site-menu-close = Sulge menüü

js-site-menu-open = Ava menüü

js-site-missions-avail-title = Kättesaadavus: käigu osa, kus PDOP ≤ { $limit }

js-site-missions-avail-uniform = { $v } % igas ruudus

js-site-missions-chart-error-title = asukohaviga (m, log)

js-site-missions-chart-four = asukohalahendiks on vaja nelja

js-site-missions-chart-four-short = neli lahenduseks

js-site-missions-chart-lg-earth = Maa nähtav

js-site-missions-chart-lg-error-earth = viga, releed ja Maa kaugus

js-site-missions-chart-lg-error-relays = viga, ainult releed

js-site-missions-chart-lg-relays = nähtavad releed

js-site-missions-chart-relays-title = nähtavad releed · varjutatud: Maa horisondi kohal

js-site-missions-chip-at-pdop = PDOP ≤ { $limit } korral

js-site-missions-chip-engine = Mootor:

js-site-missions-chip-fix-earth = asukohalahendus, Maaga

js-site-missions-chip-median-pdop = mediaan-PDOP

js-site-missions-chip-relays = releed

js-site-missions-chip-rms = RMS-viga

js-site-missions-chip-satellites = satelliidid

js-site-missions-chip-tracking-held = { $label } jälgimine säilis

js-site-missions-clocks-aria = Ajaviga ühe holdover-päeva järel kellaklassi järgi, logaritmskaala

js-site-missions-clocks-frame = raamipõhi { $ns } ns

js-site-missions-clocks-note = ajaviga ühe päeva järel, sekundites (log)

js-site-missions-clocks-sigma = σy(1 s) { $sigma }

js-site-missions-clocks-title = { $clock }: { $ns } ns ühe päeva järel, σy(1 s) { $sigma }

js-site-missions-cone-aria = Asukohavea koonus alates GNSS-i kadumisest

js-site-missions-cone-axis-x = aeg GNSS-i kadumisest (s)

js-site-missions-cone-axis-y = asukohaviga (m)

js-site-missions-cone-budget = ±{ $m } m eelarve

js-site-missions-cone-clipped = piiratud tasemel ±{ $m } m

js-site-missions-cone-leaves = lahkub ajal { $s } s

js-site-missions-cone-readout = t { $t } s · { $errors }

js-site-missions-copy-command = Kopeeri käsk

js-site-missions-copy-title = Kopeeri käsk, mis selle taasloob

js-site-missions-deterministic = deterministlik

js-site-missions-engine-build = Mootor v{ $version }, ehitus

js-site-missions-engine-build-commit = Mootor v{ $version }, ehitus { $commit }

js-site-missions-fp-aria = Segamisjälje kaart. Nooleklahvid liiguvad ruutude vahel, Enter avab selle käigu.

js-site-missions-fp-aria-svg = Segamisjälg segaja ümber

js-site-missions-fp-darker = tumedam = suurem keskmine J/S · { $step } km ruudud · { $n } mootorikäiku

js-site-missions-fp-jammer = segaja

js-site-missions-fp-lg-held = jälgimine säilis

js-site-missions-fp-lg-lost = iga satelliit kadunud

js-site-missions-fp-lg-some = mõned epohhid kadunud

js-site-missions-fp-open = Ava see käik rakenduses { $studio }

js-site-missions-fp-read = umbes { $km } km segajast · keskmine J/S { $js } dB · jälgimise kättesaadavus { $av }

js-site-missions-fp-ship = stsenaariumi laev

js-site-missions-grades-aria = Vaba inertsiaalne libisemine enne { $a } m ja { $b } m, IMU klassi järgi

js-site-missions-grades-axis = libisemissekundid pärast GNSS-i kadumist (log)

js-site-missions-grades-point = { $grade }: { $s } s kuni { $m } m ({ $why })

js-site-missions-grades-reaches = viga jõuab väärtuseni { $m } m

js-site-missions-grades-speed = kiirusel { $v } m/s

js-site-missions-grades-this = see stsenaarium

js-site-missions-hud-earth-link = Maa link

js-site-missions-hud-link-above = Maa link · horisondi kohal

js-site-missions-hud-link-occulted = Maa link · varjatud

js-site-missions-hud-orbiter = Orbiiter

js-site-missions-hud-receiver = Vastuvõtja

js-site-missions-hud-relays = Releed

js-site-missions-hud-selected-lat = valitud laiuskraad

js-site-missions-info-in-view = Nähtaval

js-site-missions-info-in-view-value = { $mean } keskmiselt · { $fewest } vähim

js-site-missions-info-pdop-above = { $pdop }, üle { $limit }

js-site-missions-json-title = Mootori tulemus, muutmata

js-site-missions-json-unavailable = JSON pole saadaval

js-site-missions-key-avail = Kättesaadavus

js-site-missions-key-pdop-title = Keskmine PDOP (asukoha täpsuse halvenemise tegur)

js-site-missions-key-vis = Nähtavad satelliidid

js-site-missions-key-vis-short = Nähtaval

js-site-missions-leo-grid = ruudustikust PDOP ≤ { $limit } korral

js-site-missions-leo-in-view = nähtaval keskmiselt

js-site-missions-leo-shells = satelliiti neljas kihis

js-site-missions-map-aria = { $title } keha { $body } kohal, 10-kraadise ruudu kaupa. Nooleklahvid liigutavad vastuvõtjat; selle ruut kuvatakse allpool.

js-site-missions-map-colour-by = Värvi kaart järgi

js-site-missions-map-fewest-in-view = vähim nähtaval

js-site-missions-map-grey = hall: asukohalahendust pole

js-site-missions-map-hatched = triibutatud: üle PDOP-i piiri { $limit }

js-site-missions-map-in-view = nähtaval

js-site-missions-map-live = { $cell }: { $rows }

js-site-missions-map-mean-in-view = keskmiselt nähtaval

js-site-missions-map-mean-pdop = keskmine PDOP

js-site-missions-map-pdop-limit = PDOP-i piir { $limit }

js-site-missions-matrix-caption = Stsenaariumifailid sektori (read) ja rikkerežiimi (veerud) järgi. Vali arv, et see sektor avada.

js-site-missions-matrix-cell =
    { $n ->
        [one] { $sector }, { $mode }: { $n } stsenaariumifail
       *[other] { $sector }, { $mode }: { $n } stsenaariumifaili
    }

js-site-missions-matrix-files =
    { $n ->
        [one] { $n } fail:
       *[other] { $n } faili:
    }

js-site-missions-matrix-sector = Sektor

js-site-missions-mode-int = Häire

js-site-missions-mode-itg = Terviklikkus

js-site-missions-mode-nav = Libisemine

js-site-missions-mode-orb = Geomeetria

js-site-missions-mode-spf = Spuufimine

js-site-missions-mode-tim = Ajastus

js-site-missions-n-of-total = { $n } / { $total }

js-site-missions-no-fix = asukohalahendust pole

js-site-missions-no-seed = deterministlik, algväärtuseta

js-site-missions-open-in-studio = Ava rakenduses { $studio }

js-site-missions-open-report = Ava mootori aruanne

js-site-missions-ow-chart-aria = Vastuvõtja vastus käigu jooksul stsenaariumi { $name } jaoks: nähtavad releed ning asukohaviga ainult releedega ja Maa kaugusega

js-site-missions-ow-chip-epochs = epohhid

js-site-missions-ow-chip-mask = kõrgusmask

js-site-missions-ow-chip-orbiter = orbiiter

js-site-missions-ow-chip-range = kaugus σ

js-site-missions-ow-chip-relays = releed

js-site-missions-ow-chip-relays-value = { $planes } × { $per } kõrgusel { $alt } km, { $inc }°

js-site-missions-ow-chip-span = ulatus

js-site-missions-ow-count-relays = { $n } releed ja orbiiter · { $body }

js-site-missions-ow-count-sats = { $n } satelliiti · { $body }

js-site-missions-ow-engine = mootor v{ $version } · ehitus { $commit }

js-site-missions-ow-lat-label = Vastuvõtja laiuskraad

js-site-missions-ow-map-aria = Vastuvõtja vastus stsenaariumi { $name } jaoks: keha { $body } kaart 10-kraadiste ruutudena, kõrval nähtavate satelliitide keskmine ja vähim arv ning keskmine PDOP laiuskraadi järgi

js-site-missions-ow-note-imagery = { $body } pildimaterjal: NASA.

js-site-missions-ow-note-rebuilt = Orbiidid: releed ja orbiiter on stsenaariumist taasloodud täpselt nii, nagu mootor need loob; nende antud nähtavate satelliitide arv on võrdne mootori omaga kõigil { $n } epohhil.

js-site-missions-ow-note-sats = Orbiidid: käigu satelliidid on siin uuesti propageeritud ja kontrollitud mootori kirjutatud kõigi { $n } maapealse jälje näidise vastu (halvim { $deg }°).

js-site-missions-ow-note-scaled = Orbiidi raadiused on kuvamiseks skaleeritud; tasandid, faasimine ja perioodid on käigu omad.

js-site-missions-ow-note-tracks = Mootor kirjutas maapealsed jäljed { $shown } satelliidile koguarvust { $total }; kõik { $total } on joonistatud selle kihtidest.

js-site-missions-ow-note-walker = Orbiidid: käigu Walkeri kihid on siin uuesti propageeritud ja kontrollitud mootori kirjutatud kõigi { $n } maapealse jälje näidise vastu (halvim { $deg }°).

js-site-missions-ow-off = väljas

js-site-missions-ow-on = sees

js-site-missions-ow-pause = Peata orbiidid

js-site-missions-ow-play = Esita orbiidid

js-site-missions-ow-time = t = { $time }

js-site-missions-ow-time-label = Missiooniaeg

js-site-missions-ow-valuetext = { $time }, { $n } releed nähtaval

js-site-missions-pdop-title = Keskmine PDOP (asukoha täpsuse halvenemise tegur), logaritmskaala, väiksem on parem

js-site-missions-report = Aruanne

js-site-missions-report-title = Mootori enda aruanne selle käigu kohta

js-site-missions-ro-above-horizon = horisondi kohal

js-site-missions-ro-availability = Kättesaadavus, PDOP ≤ { $limit }

js-site-missions-ro-earth-light = Maa · valgusaeg { $s } s

js-site-missions-ro-error-relays = Asukohaviga, ainult releed

js-site-missions-ro-occulted = varjatud

js-site-missions-ro-place-availability = Kohas { $place }: kättesaadavus

js-site-missions-ro-place-in-view = Kohas { $place }: nähtaval, keskmine · vähim

js-site-missions-ro-relays = Nähtavad releed

js-site-missions-ro-satellites = Satelliidid

js-site-missions-ro-with-earth = Maa kaugusega

js-site-missions-run-failed = Salvestatud käiku ei saanud siin laadida; ava see allolevalt lingilt rakenduses { $studio }.

js-site-missions-seed = algväärtus { $seed }

js-site-missions-spoof-aria = Spuufimise nihe aja suhtes, iga monitori tuvastuspiiri ja tuvastusajaga

js-site-missions-spoof-axis-x = aeg spuufimise algusest (s)

js-site-missions-spoof-axis-y = ajanihe (ns)

js-site-missions-spoof-detects = { $id } tuvastab ajal { $s } s

js-site-missions-spoof-lg-bound = { $id } piir

js-site-missions-spoof-lg-offset = spuufimise nihe

js-site-missions-spoof-readout = t { $t } s · nihe { $offset } ns

js-site-missions-spoof-spec = spetsifikatsioon { $v } ns

js-site-missions-sr-aria = { $members }; ühine segaja { $power } dBW

js-site-missions-sr-aria-member = { $label }: jälgimine säilis { $held } %, keskmine segaja ja signaali suhe { $js } dB, vähim jälgitud satelliite { $min }

js-site-missions-sr-car = Auto

js-site-missions-sr-fewest = vähim jälgitud

js-site-missions-sr-held = jälgimine säilis

js-site-missions-sr-mean-js = keskmine J/S

js-site-missions-sr-ship = Laev

js-site-missions-swipe =
    { $n ->
        [one] Libista, et näha kõiki: { $n } stsenaariumifail
       *[other] Libista, et näha kõiki: { $n } stsenaariumifaili
    }

js-site-missions-toml-download-title = Laadi alla käivitatud stsenaariumifail

js-site-missions-toml-title = Käivitatud stsenaariumifail

js-site-missions-vis-title = Nähtavad satelliidid, käigu keskmine

js-site-missions-vis-uniform = { $v } igas ruudus

js-site-palette-none = Tulemusi pole

js-site-palette-results = { $count } tulemust

js-site-pro-band-at = { $minutes } minuti juures: 5. kuni 95. protsentiil

js-site-pro-band-range = { $lo } kuni { $hi } { $unit }

js-site-pro-band-runs-within = { $n } käigust piirides ±{ $limit } { $unit }

js-site-pro-design-readout = { $sat } satelliiti, { $av } % kättesaadavus · { $planes } tasandit kõrgusel { $alt } km, { $incl }°

js-site-pro-front-design = Rindelahendus { $id }

js-site-pro-front-design-knee = Rindelahendus { $id } · põlv

js-site-pro-more-designs =
    { $n ->
        [one] (+{ $n } veel rindelahendus selles punktis)
       *[other] (+{ $n } veel rindelahendust selles punktis)
    }

js-site-pro-not-rerun = pole uuesti käivitatud

js-site-pro-rerun-free = uuesti käivitatud vabas mootoris:

js-site-pro-same-sha = sama SHA-256 { $sha }…

js-site-pro-same-sha-index = sama tulemuse SHA-256 mis indeksis

js-site-toast-copied = Kopeeritud: { $text }

js-site-toast-data-failed = Andmefaili ei saanud laadida

js-site-toast-data-saved = Andmed salvestatud CSV-na

js-site-toast-no-data = Sellel diagrammil pole andmeid

js-site-toast-svg-saved = Diagramm salvestatud SVG-na

js-site-toast-table-saved = Tabel salvestatud CSV-na

js-site-waterfall-axis-now = praegu

js-site-waterfall-bar-title = { $band }: { $cn0 } dB-Hz, { $state }

js-site-waterfall-bar-title-js = { $band }: { $cn0 } dB-Hz, { $state }, J/S { $js } dB

js-site-waterfall-below-floor = signaalid on mürataseme all

js-site-waterfall-campaign-drives = Kampaania, mida see juhib:

js-site-waterfall-campaign-seed = algväärtus { $seed } · { $phases } faasi { $duration } s jooksul

js-site-waterfall-chip-aria = { $band }, { $fc } megahertsi: näita seda sagedusriba

js-site-waterfall-chip-title = { $band } · { $fc } MHz · vastuvõtja ribalaius { $bw } MHz

js-site-waterfall-engine-build = Mootor v{ $version } · ehitus

js-site-waterfall-fallback-head = Galileo varuvariant · { $s } s, ainult CW-toon

js-site-waterfall-fallback-text = { $band } tagasi tasemel { $v } dB-Hz. Terviklikkuse seire ainult Galileoga: kaitsetase { $min }–{ $max } m, alla häirepiiri { $limit } m.

js-site-waterfall-floor = { $thr } dB-Hz jälgimispiir

js-site-waterfall-holdover-head = Holdover · { $s } s, tširp sees

js-site-waterfall-holdover-text = { $band0 } { $v0 }, { $band1 } { $v1 } dB-Hz, piiri all. Kell käib vabalt: halvim { $worst } ns valvepiiri { $guard } ns vastu.

js-site-waterfall-jammer-off = { $what } väljas

js-site-waterfall-jammer-on = { $what } sees

js-site-waterfall-live = { $freq } megahertsi, { $time }: { $detail }

js-site-waterfall-live-band = { $band } { $cn0 } dB-Hz, { $state }

js-site-waterfall-live-none = modelleeritud sagedusriba pole

js-site-waterfall-load-failed = Salvestatud käiku ei saanud laadida. Allolev mootori aruanne näitab sama käiku.

js-site-waterfall-no-jammer-band = Selles sagedusribas segajat pole

js-site-waterfall-no-jammer-in-band = segajat ribas pole

js-site-waterfall-no-seed = deterministlik, algväärtuseta

js-site-waterfall-onset-head = Algus · { $t0 }–{ $t1 } s

js-site-waterfall-onset-text = Kõik { $n } sagedusriba on jälgimisel, kuni spektrikäik kaotab esimest korda sagedusriba { $band } ajal { $s } s.

js-site-waterfall-pause = Peata juga

js-site-waterfall-play = Esita juga

js-site-waterfall-quiet-band = { $band } { $cn0 } dB-Hz · { $state }

js-site-waterfall-run-time = käik T+{ $s } s

js-site-waterfall-scale-caption = PSD üle { $floor } dBW/Hz mürataseme · { $bin } MHz × { $step } s ruudud

js-site-waterfall-seed = algväärtus { $seed }

js-site-waterfall-short-lost = kadunud

js-site-waterfall-short-ok = jälgib

js-site-waterfall-short-rec = taast.

js-site-waterfall-state-lost = Lukk kadunud

js-site-waterfall-state-lost-low = lukk kadunud

js-site-waterfall-state-ok = Jälgimine

js-site-waterfall-state-ok-low = jälgimine

js-site-waterfall-state-rec = Taastunud

js-site-waterfall-state-rec-low = taastunud

js-site-waterfall-summary-recovers = { $band } kaotab luku ajal { $lost } s ja taastub ajal { $rec } s, madalaim { $min } dB-Hz.

js-site-waterfall-summary-rows = { $n } rida sammuga { $step } s.

js-site-waterfall-summary-stays-lost = { $band } kaotab luku ajal { $lost } s ja jääb kadunuks, madalaim { $min } dB-Hz.

js-site-waterfall-summary-tracks = { $band } on kogu aja jälgimisel, madalaim { $min } dB-Hz.

js-site-waterfall-tip-above-floor = üle mürataseme

js-site-waterfall-tip-at-floor = Termilisel mürapõhjal

js-site-waterfall-tip-band = { $cn0 } dB-Hz · { $state }

js-site-waterfall-tip-head = { $lo }–{ $hi } MHz · { $time }

js-site-waterfall-tip-js = J/S { $js } dB

js-site-waterfall-tip-no-band = Ühegi modelleeritud sagedusriba vastuvõtja ribalaius ei kata seda veergu

js-site-waterfall-wave-chirp = tširp

js-site-waterfall-wave-cw = CW-toon

js-site-waterfall-wave-noise = müra

js-site-waterfall-who-cursor = Kursori all olev sagedusriba

js-site-waterfall-who-selected = Valitud sagedusriba

js-site-waterfall-who-worst = Halvim sagedusriba
