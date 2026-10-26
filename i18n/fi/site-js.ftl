# site-js.ftl (fi): translations

js-app-engine-failed = Moottoria ei voitu ladata ({ $reason }).

js-ledger-rows =
    { $n ->
        [one] { $n } kirjanpitorivi
       *[other] { $n } kirjanpitoriviä
    }

js-site-action-copy-install = Kopioi: cargo install kshana

js-site-action-launch = Käynnistä: { $name }

js-site-action-licence = Ota yhteyttä kaupallisesta lisenssistä

js-site-action-pro-eval = Pyydä Kshana Pro -arviointia

js-site-action-study = Pyydä selvitystä

js-site-action-theme = Vaihda vaalean ja tumman teeman välillä

js-site-capabilities-bd-after = { $m } m { $s } s jälkeen

js-site-capabilities-bd-combined = yhdistetty

js-site-capabilities-bd-crossing = { $m } m kohdassa { $s } s

js-site-capabilities-bd-fig-crossing = «{ $m } m» { $s } s jälkeen, hallitsevana { $dom }

js-site-capabilities-bd-fig-lead = GNSS:n menetyksestä kulunut aika logaritmisella akselilla, luokan { $grade } IMU nopeudella { $speed } m/s:

js-site-capabilities-bd-fig-tail = Viivat ovat moottorin lyhyen liukumisen kasvulait ja niiden neliösumman neliöjuuri; ylitykset tulevat moottorin täydestä yhdeksän tilan (Schuler) virhemallista, joka rajaa harhatermit, joten pitkillä liukumisilla kukin ylitys tulee hieman myöhemmin kuin viiva ylittää rajan. Pylväät: samat ylitykset neljälle IMU-luokalle.

js-site-capabilities-cd-canvas-aria = Tähdistö kappaleensa ympärillä, todellisilla kuvilla: käännä vetämällä tai nuolinäppäimillä, zoomaa plus- ja miinusnäppäimillä

js-site-capabilities-cd-design-meta = { $n } satelliittia · { $body } · { $file }

js-site-capabilities-cd-foot-frozen = Jokainen satelliitti seuraa moottorin omaa rataa; jäädytetyn radan säde tulee kuoren elementeistä.

js-site-capabilities-cd-foot-mean-motion = Jokainen satelliitti seuraa moottorin omaa rataa säteellä, jonka sen keskiliike antaa.

js-site-capabilities-cd-foot-walker = Kaikki { $n } satelliittia on sijoitettu kuorten omilla Walker-parametreilla (tarkistettu moottorin { $shown } rataa vasten: pahin { $deg }°); jäljet ovat moottorin { $shown } rataa.

js-site-capabilities-cd-hud-body = { $body } · «{ $n }» satelliittia

js-site-capabilities-cd-hud-mission = Tehtävä «{ $time }»

js-site-capabilities-cd-legend-shell = kuori { $n } · { $inc }°

js-site-capabilities-cd-map-availability = Ajon osuus, jolla PDOP ≤ { $limit } (0–100 %)

js-site-capabilities-cd-map-pdop = Keskimääräinen PDOP { $step }° ruutua kohden ({ $lo }–{ $hi }; vaaleampi on parempi)

js-site-capabilities-cd-map-visible = Keskimäärin näkyvissä olevia satelliitteja ({ $lo }–{ $hi })

js-site-capabilities-cd-metric-availability = Saatavuus

js-site-capabilities-cd-metric-pdop = Keskimääräinen PDOP

js-site-capabilities-cd-metric-visible = Näkyvissä

js-site-capabilities-cd-no-webgl = 3D-näkymä tarvitsee WebGL:n; kattavuuskartta ja luvut ovat samaa ajoa.

js-site-capabilities-cd-pause = Keskeytä radat

js-site-capabilities-cd-play = Toista radat

js-site-capabilities-cd-shell = { $name }: Walker { $pattern } { $total }/{ $planes }/{ $phasing } · { $alt } km · { $inc }°

js-site-capabilities-cd-slots = { $name }: { $n } satelliittia, operaattorin paikkataulukko

js-site-capabilities-cd-span = kestosta { $dur }, silmukkana

js-site-capabilities-cd-stat-in-view = Keskimäärin näkyvissä

js-site-capabilities-cd-stat-mask = Maski · ajo

js-site-capabilities-cd-stat-median = PDOP:n mediaani

js-site-capabilities-cd-stat-pdop = PDOP ≤ { $limit }, koko kappale { $body }

js-site-capabilities-cd-stat-satellites = Satelliitit

js-site-capabilities-cd-stat-worst = Heikoin paikka

js-site-capabilities-cd-title-gnss = Neljä GNSS:ää yhdessä

js-site-capabilities-cd-title-leo = Matalan Maan kiertoradan megatähdistö

js-site-capabilities-cd-title-lunar = Kuun välitinjoukko

js-site-capabilities-cd-work-ratio = { $pct } % leveysastesuodatuksen jälkeen · { $dop } DOP-ratkaisua

js-site-capabilities-cd-work-tests = { $after } satelliitti-piste-testiä, kun raa'an voiman läpikäynti tekisi { $brute }

js-site-capabilities-cd-work-title = Näkyvyyslaskenta

js-site-capabilities-cg-cn0-sub = C/N0 suhteessa seurannan alarajaan

js-site-capabilities-cg-cn0-title = Kantoaalto-kohinatiheys

js-site-capabilities-cg-compose-availability = Saatavuus

js-site-capabilities-cg-compose-fewest = Vähiten seurattuja

js-site-capabilities-cg-compose-js = Keskimääräinen J/S

js-site-capabilities-cg-compose-text = Yksi häirintälähetin, { $power } { $unit }, yhdessä paikassa, sidottuna { $n } jäsenajoon tyyppiä ‹{ $kind }›: laiva salmessa ja auto rannikkotiellä näkevät saman syyn ja saavat eri vastaukset.

js-site-capabilities-cg-log-campaign = kampanja { $file } · { $phases } vaihetta · { $runs } jäsenajoa

js-site-capabilities-cg-log-phase = vaihe { $name } alkaa

js-site-capabilities-cg-log-phase-carries = vaihe { $name } alkaa · siirtää mukanaan { $carried }

js-site-capabilities-cg-monte-axis = kellon loppuvirhe { $n } siemenluvulla ({ $path })

js-site-capabilities-cg-monte-ci = Keskiarvo, 95 %:n väli

js-site-capabilities-cg-monte-mean = Keskiarvo

js-site-capabilities-cg-monte-p05 = 5.

js-site-capabilities-cg-monte-p05-p95 = 5.–95.

js-site-capabilities-cg-monte-p50 = mediaani

js-site-capabilities-cg-monte-p95 = 95.

js-site-capabilities-cg-monte-std = Keskihajonta

js-site-capabilities-cg-monte-text = Sama ‹{ $kind }›-skenaario ajettuna { $n } kertaa perussiemenluvusta { $seed }, yksi siemenluku kutakin: vapaasti käyvän kellon loppuvirheen hajonta sekä sen keskiarvon 95 %:n luottamusväli.

js-site-capabilities-cg-not-in-phase = ei tässä vaiheessa

js-site-capabilities-cg-now = Vaihe { $n } / { $total }: { $name } · { $from }–{ $to }

js-site-capabilities-cg-phase-title = { $name }: { $from }–{ $to } · päättäjänä { $by } · jäsentyypit { $kinds }

js-site-capabilities-cg-pl-sub = suhteessa hälytysrajaan

js-site-capabilities-cg-pl-title = Suojaustaso

js-site-capabilities-cg-pos-sub = suhteessa budjettiinsa · logaritminen

js-site-capabilities-cg-pos-title = Inertiapaikannuksen virhe

js-site-capabilities-cg-range = { $lo }–{ $hi }

js-site-capabilities-cg-sweep-all-lost = Kaikki menetetty alkaen

js-site-capabilities-cg-sweep-axis = häirintälähettimen lähetysteho ({ $key })

js-site-capabilities-cg-sweep-first-loss = Ensimmäinen menetys

js-site-capabilities-cg-sweep-lg-availability = saatavuus

js-site-capabilities-cg-sweep-lg-js = keskimääräinen J/S

js-site-capabilities-cg-sweep-never = ei koskaan

js-site-capabilities-cg-sweep-nodes = Solmut

js-site-capabilities-cg-sweep-none = ei yhtään

js-site-capabilities-cg-sweep-span = J/S-vaihteluväli

js-site-capabilities-cg-sweep-text = Yksi ‹{ $kind }›-skenaario, ajettuna kerran solmua kohden, kun häirintälähettimen lähetysteho etenee arvosta { $from } arvoon { $to } { $unit }. Saatavuus häirinnän aikana (yhtenäinen viiva) ja keskimääräinen J/S (katkoviiva) tulevat kunkin jäsenajon omista laatumittareista.

js-site-capabilities-cg-te-sub = suhteessa suojarajaan

js-site-capabilities-cg-te-title = Kellon aikavirhe

js-site-capabilities-copy = Kopioi

js-site-capabilities-copy-aria = Kopioi ajon toistava komento: kshana { $file }

js-site-capabilities-cz-best = Paras PDOP

js-site-capabilities-cz-failed = Tallennettua ajoa ei voitu ladata tähän; avaa se sen sijaan Studiossa.

js-site-capabilities-cz-fix = Näytteet, joissa on paikkaratkaisu

js-site-capabilities-cz-fix-value = { $n } / { $total } ({ $pct }%)

js-site-capabilities-cz-median = PDOP:n mediaani

js-site-capabilities-engine = Moottori v{ $version }

js-site-capabilities-engine-build = Moottori v{ $version }, build

js-site-capabilities-engine-report = Moottoriraportti

js-site-capabilities-globe-aria = { $name } todellisilla kuvillaan ({ $credit }). Käännä vetämällä tai nuolinäppäimillä; plus ja miinus zoomaavat.

js-site-capabilities-ho-ends = ajo päättyy kohdassa { $t }

js-site-capabilities-ho-past-guard = suojarajan yli

js-site-capabilities-no-seed = deterministinen, ei siemenlukua

js-site-capabilities-open-in-studio = Avaa ohjelmassa { $studio }

js-site-capabilities-open-report = Avaa moottorin raportti

js-site-capabilities-orrery-aria = Aurinkokunta ajon epookilla: käännä vetämällä tai nuolinäppäimillä, zoomaa plus- ja miinusnäppäimillä

js-site-capabilities-orrery-bodies = { $n } kappaletta · havaitsija «{ $observer }»

js-site-capabilities-orrery-epoch = Epookki «{ $epoch }» · TDB (barycentric dynamical time eli barysentrinen dynaaminen aika), juliaaninen päivämäärä { $jd }

js-site-capabilities-pnt-chart-title = näkyvissä olevat välittimet (viiva) · Maa horisontin yläpuolella (varjostettu) · paikkaratkaisuun tarvitaan neljä

js-site-capabilities-pnt-kicker = Paikannus tällä kappaleella · body-pnt-tyyppi

js-site-capabilities-pnt-lander = Laskeutuja kohdassa { $lat }°, { $lon }° pinnalla navigoi välittimillä ja kaksisuuntaisella etäisyysmittauksella Maasta aina, kun Maa on horisontin yläpuolella (yksisuuntainen valonkulkuaika { $min } min). Saatavuus: { $a } % pelkillä välittimillä, { $b } % Maa-yhteyden kanssa.

js-site-capabilities-pnt-orbiter = Kiertoradalla oleva käyttäjä navigoi välittimillä ja kaksisuuntaisella etäisyysmittauksella Maasta aina, kun Maa on horisontin yläpuolella (yksisuuntainen valonkulkuaika { $min } min). Saatavuus: { $a } % pelkillä välittimillä, { $b } % Maa-yhteyden kanssa.

js-site-capabilities-pnt-relays = { $n } välitintä korkeudella { $alt } km kappaleen { $body } ympärillä

js-site-capabilities-report-data = Raportti ja data

js-site-capabilities-result-data = Tulosdata

js-site-capabilities-saved = Tallennettu: { $name }

js-site-capabilities-scenario-file = Skenaariotiedosto

js-site-capabilities-seed = siemenluku { $seed }

js-site-capabilities-six-clock-fig = «{ $id }» pysyy suojarajalla ajan { $dur }

js-site-capabilities-six-clock-guard = suojaraja { $v } ns

js-site-capabilities-six-coast-budget = budjetti { $m } m

js-site-capabilities-six-coast-denied = GNSS estetty

js-site-capabilities-six-coast-fig = «{ $id }» budjetin sisällä { $s } s ajan

js-site-capabilities-six-floor = seurannan alaraja

js-site-capabilities-six-integ-fig = «{ $ok }» / { $n } epookista saatavilla · hälytysrajat { $h } m vaakasuunnassa, { $v } m pystysuunnassa

js-site-capabilities-six-integ-limit = pystysuuntainen hälytysraja

js-site-capabilities-six-integ-pl = pystysuuntainen (yhtenäinen viiva) ja vaakasuuntainen (katkoviiva) suojaustaso

js-site-capabilities-six-jam-effective = tehokkaita, { $n } satelliittia

js-site-capabilities-six-jam-fig = Seurattuja «{ $min }» / { $max } näkyvissä olevasta · saatavuus häirinnän aikana «{ $av }» (nimellinen { $nom }) · keskimääräinen J/S «{ $js } dB»

js-site-capabilities-six-jam-nominal = nimellinen, ei häirintälähetintä (katkoviiva)

js-site-capabilities-six-orbit-fig = Korkeus «{ $lo }–{ $hi } km» · maanpintajälki ajalta { $dur }

js-site-capabilities-six-orbit-label = { $source } · { $n } näytettä

js-site-capabilities-six-orbit-sgp4 = SGP4 kaksirivisestä elementtijoukosta

js-site-capabilities-six-spoof-detects = { $id } havaitsee

js-site-capabilities-six-spoof-fig = «{ $id }» havaitsee kohdassa { $s } s (raja { $ns } ns)

js-site-capabilities-ss-angle = Kulma Auringosta

js-site-capabilities-ss-credit = Kuvat: { $credits }. * Kartta ei yllä napoihin; aukko saa kartan napa-alueen keskivärin. Saturnuksen renkaat: { $ring } ({ $licence }).

js-site-capabilities-ss-days = { $v } vrk

js-site-capabilities-ss-frame-origin = Koordinaatiston origo

js-site-capabilities-ss-from-sun = Auringosta

js-site-capabilities-ss-gloss = NAIF: NASAn Navigation and Ancillary Information Facility -yksikön kappalekoodi. GM: gravitaatioparametri. J2: litistyneisyystermi. IAU-napa: Kansainvälisen tähtitieteellisen unionin pyörimisnapa rektasensiona (RA) ja deklinaationa (Dec).

js-site-capabilities-ss-j2-none = ei julkaistua arvoa

js-site-capabilities-ss-kind = { $class } · NAIF { $naif }

js-site-capabilities-ss-kind-of = { $class }, emokappale { $parent } · NAIF { $naif }

js-site-capabilities-ss-light-time = Valonkulkuaika havaitsijasta { $observer }

js-site-capabilities-ss-link = { $from } – { $to }, yksisuuntainen valonkulkuaika { $one }, edestakainen { $two }

js-site-capabilities-ss-links-lead =
    { $n ->
        [one] Yhteys, jonka tämä ajo laskee:
       *[other] Yhteydet, jotka tämä ajo laskee:
    }

js-site-capabilities-ss-moons =
    { $n ->
        [one] Sen kuu mittakaavassa epookilla
       *[other] Sen kuut mittakaavassa epookilla
    }

js-site-capabilities-ss-nominal-error = nimellinen virhe { $km } km etäisyydessä

js-site-capabilities-ss-north = Nähtynä ekliptikan pohjoispuolelta.

js-site-capabilities-ss-period = Kiertoaika

js-site-capabilities-ss-period-about = Kiertoaika kappaleen { $parent } ympäri

js-site-capabilities-ss-pole = IAU-napa (RA, Dec)

js-site-capabilities-ss-radius = Keskisäde

js-site-capabilities-ss-retrograde = { $v } h, retrogradinen

js-site-capabilities-ss-rotation = Tähtipäivän pyöriminen

js-site-capabilities-ss-years = { $v } vuotta

js-site-capabilities-st-bound = raja { $v } m

js-site-capabilities-st-fig-none = { $n } epookkia, yhdessäkään ei virhe ylitä rajaansa. Vaakasuunnassa: todellinen paikkavirhe; pystysuunnassa: suojaustaso; molemmat logaritmisilla akseleilla.

js-site-capabilities-st-fig-some = { $n } epookkia, joista { $k } on virhe rajansa yläpuolella. Vaakasuunnassa: todellinen paikkavirhe; pystysuunnassa: suojaustaso; molemmat logaritmisilla akseleilla.

js-site-capabilities-st-limit = hälytysraja { $m } m

js-site-capabilities-st-misleading = harhaanjohtava: virhe rajan yläpuolella

js-site-capabilities-st-normal = normaali toiminta

js-site-capabilities-st-unavailable = ei saatavilla: raja hälytysrajan yläpuolella

js-site-capabilities-studio-embedded = { $studio }, upotettuna: orbit-multignss-ajo

js-site-capabilities-studio-load = Lataa tähän: { $studio }

js-site-capabilities-studio-outline = Näytä jäsennys uudelleen

js-site-capabilities-wave-chirp = chirp

js-site-capabilities-wave-cw = CW-ääni

js-site-capabilities-wave-noise = kohina

js-site-capabilities-wf-an-caption = rivi T+{ $t } s · dB alarajan yläpuolella, logaritminen asteikko · koko ruudukon huippu { $peak } dB

js-site-capabilities-wf-degraded = Heikentynyt

js-site-capabilities-wf-degraded-low = heikentynyt

js-site-capabilities-wf-failed = Tallennettua ajoa ei voitu ladata tähän.

js-site-capabilities-wf-grid = ruudukko

js-site-capabilities-wf-iq = Hetkellä T+{ $t } s moottori piirtää mallin myös { $n } IQ-näytteenä (samanvaiheinen ja kvadratuuri) taajuuden { $mhz } MHz ympärillä ja tarkistaa Welch-estimaatin ({ $segments } segmenttiä, joiden pituus { $nfft }) sitä vasten: integroitu tehosuhde { $ratio }.

js-site-capabilities-wf-jammer-off = { $what } pois

js-site-capabilities-wf-jammer-on = { $what } päällä

js-site-capabilities-wf-jammer-open = { $name } · { $mhz } MHz · ajasta { $on } s loppuun asti

js-site-capabilities-wf-jammer-span = { $name } · { $mhz } MHz · { $on }–{ $off } s

js-site-capabilities-wf-lost = Lukitus menetetty

js-site-capabilities-wf-lost-low = lukitus menetetty

js-site-capabilities-wf-max = { $peak } dB sen yläpuolella · logaritminen asteikko arvosta { $v0 } dB

js-site-capabilities-wf-no-jammer = ei häirintälähetintä

js-site-capabilities-wf-now = nyt

js-site-capabilities-wf-pause = Keskeytä vesiputous

js-site-capabilities-wf-peak = huippu { $v } dB

js-site-capabilities-wf-play = Toista vesiputous

js-site-capabilities-wf-replay-previous = toiston alku · edellinen läpikäynti alla

js-site-capabilities-wf-replay-start = toiston alku

js-site-capabilities-wf-say = T+{ $t } s, { $band } { $v } dB-Hz, { $state }

js-site-capabilities-wf-signal = signaali +{ $v } dB

js-site-capabilities-wf-summary = Tallennettu ajo tiedostosta { $file }: { $bands } kaistaa, { $jammers } häirintälähetintä ajalla { $seconds } sekuntia. Heikoin kaista, { $worst }, laskee tasolle { $min } dB-Hz kohdassa { $at } s; seurannan alaraja { $floor } dB-Hz.

js-site-capabilities-wf-tip-above = { $v } dB kohinatason yläpuolella

js-site-capabilities-wf-tip-in = kaistalla { $bands }

js-site-capabilities-wf-tracking = Seuranta

js-site-capabilities-wf-tracking-low = seuranta

js-site-caphero-aria = Aurinkokunta moottorin aurinkokunta-ajosta ajankohtana { $date }: Aurinko ja { $bodies } kappaletta liikkumassa moottorin ratajälkiä pitkin; { $valid } radasta on validoitu JPL Horizonsia vastaan.

js-site-caphero-clock = +{ $days } vrk · { $date }

js-site-caphero-copy-command = Kopioi komento

js-site-caphero-copy-title = Kopioi sen toistava komento

js-site-caphero-credits = Etäisyydet puristettu logaritmiselle asteikolle, suunnat todelliset; kappaleet suurennettu, pyöriminen näyttönopeudella. Kuvat: { $credits }; Saturnuksen renkaat: { $ring } ({ $licence }).

js-site-caphero-credits-summary = Mittakaavan ja kuvien lähteet

js-site-caphero-engine-build = Moottori v{ $version }, build

js-site-caphero-explore = Tutki jokaista kappaletta

js-site-caphero-file-title = Ajettu skenaariotiedosto

js-site-caphero-list-item = { $name }: { $label }, { $au } au Auringosta epookilla, kiertoaika { $period }.

js-site-caphero-list-item-light = { $name }: { $label }, { $au } au Auringosta epookilla, kiertoaika { $period }, valonkulkuaika havaitsijasta { $observer } { $light }.

js-site-caphero-no-seed = deterministinen, ei siemenlukua

js-site-caphero-open-in-studio = Avaa ohjelmassa { $studio }

js-site-caphero-pause = Keskeytä radat

js-site-caphero-period-days = { $value } vrk

js-site-caphero-period-years = { $value } vuotta

js-site-caphero-play = Toista radat

js-site-caphero-rate = { $days } vrk ajosta sekunnissa

js-site-caphero-rate-epoch = Kehys ajon epookilla

js-site-caphero-read-distance = { $au } au Auringosta

js-site-caphero-read-light = valonkulkuaika havaitsijasta { $observer } epookilla { $light }

js-site-caphero-read-orbit = rata { $period }

js-site-caphero-seed = siemenluku { $seed }

js-site-copy-aria = Kopioi: { $cmd }

js-site-developers-captured-from = tallennettu { $recorded } lähteestä

js-site-developers-engine-build = Moottori v{ $version }, build

js-site-developers-exit-stamp = poistumiskoodi { $rc } · { $ms } ms

js-site-developers-file-open-in-studio = { $file }: avaa ohjelmassa { $studio }

js-site-developers-no-seed = (deterministinen, ei siemenlukua)

js-site-developers-open-in-studio = Avaa ohjelmassa { $studio }

js-site-developers-pause = Keskeytä toisto

js-site-developers-play = Toista

js-site-developers-replaying = # toistetaan tallennettua istuntoa

js-site-developers-seed = (siemenluku { $seed })

js-site-developers-what-runs-write = Mitä jokainen ajo kirjoittaa

js-site-editions-builds-on-it = { $label } rakentuu sen päälle

js-site-editions-core-kinds =
    { $n ->
        [one] { $n } tyyppi
       *[other] { $n } tyyppiä
    }

js-site-editions-core-title = Avoin ydin

js-site-editions-core-validated = validoitu

js-site-editions-core-validated-of = { $validated } / { $total }

js-site-editions-free-core = Ilmainen avoimessa ytimessä, kuten jokainen tyyppi

js-site-editions-group-other = Muut

js-site-editions-kind-no-ledger = mikään kirjanpitomoduuli ei vastaa sitä nimen perusteella

js-site-editions-kind-validated = { $v } / { $tot } kirjanpitorivistä validoitu

js-site-editions-pause = Keskeytä renkaat

js-site-editions-play = Toista renkaat

js-site-editions-ring-pro = Kshana Pro

js-site-editions-ring-study = Räätälöity selvitys

js-site-evidence-allan-aria = NIST SP 1065 -aineiston 1000 pisteen neljä poikkeamaa suhteessa keskiarvoistusaikaan; kaikki { $n } julkaistua arvoa toistettu, suurin suhteellinen virhe { $err }

js-site-evidence-allan-lg-published = julkaistu arvo, SP 1065 taulukko 31

js-site-evidence-allan-mdev = modifioitu Allanin poikkeama

js-site-evidence-allan-na = ei saatavilla

js-site-evidence-allan-oadev = limittäinen Allanin poikkeama

js-site-evidence-allan-ohdev = limittäinen Hadamardin poikkeama

js-site-evidence-allan-read = { $tau } s · Allan { $oadev } · modifioitu { $mdev } · Hadamard { $ohdev }

js-site-evidence-allan-st-gate = testin portti

js-site-evidence-allan-st-reproduced = julkaistut arvot toistettu

js-site-evidence-allan-st-worst = suurin suhteellinen virhe

js-site-evidence-allan-tdev = aikapoikkeama sekunteina

js-site-evidence-allan-tip-at = «{ $name }» kohdassa { $m } s

js-site-evidence-allan-tip-engine = moottori: «{ $got }» · suhteellinen virhe { $err }

js-site-evidence-allan-tip-table = SP 1065 taulukko 31: «{ $want }»

js-site-evidence-cell-tip = Ominaisuus { $i } / { $n } · «{ $label }»

js-site-evidence-cowell-aria = Paikkaero Orekitiin verrattuna 24 tunnin aikana: voimatasot 1–5 pysyvät alle { $worst }; vastustustaso yltää arvoon { $drag }, joka on karakterisointikaista

js-site-evidence-cowell-gto = geostationaarinen siirtorata

js-site-evidence-cowell-leo = matala Maan kiertorata

js-site-evidence-cowell-lg-con = tasot 1–5, kahden kappaleen ongelmasta aurinkosäteilypaineeseen, kaksi rataa kutakin

js-site-evidence-cowell-lg-drag = taso 6, ilmanvastus: vain karakterisointi (eri tiheysmallit)

js-site-evidence-cowell-read = { $h } h · tasot 1–5 pahin { $con } · ilmanvastus { $drag }

js-site-evidence-cowell-st-drag = ilmanvastustaso, pahin

js-site-evidence-cowell-st-epochs = epookit tasoilla 1–5

js-site-evidence-cowell-tip-tier = «Taso { $tier }: { $label }» · { $regime }

js-site-evidence-cowell-tip-worst = pahin ero «{ $err }» kohdassa { $h } h

js-site-evidence-hero-live = { $label }. { $cap }. { $oracle }

js-site-evidence-hero-no-oracle = Ulkoista oraakkelia ei ole nimetty.

js-site-evidence-hero-oracle = Oraakkeli

js-site-evidence-hero-oracle-is = Oraakkeli: { $o }

js-site-evidence-hero-owner = Omistaja

js-site-evidence-hero-partner = Kumppani omistaa tämän; moottori ei väitä mitään tästä omakseen.

js-site-evidence-hero-pause = Keskeytä pyyhkäisy

js-site-evidence-hero-play = Toista pyyhkäisy

js-site-evidence-hero-row = Rivi { $i } / { $n }

js-site-evidence-hold-accepted = hyväksytty: kertoimen { $bar } sisällä

js-site-evidence-hold-aria = Cesiumkellon mitattu aikavirheen neliöllinen keskiarvo liukumisajan funktiona sekä moottorin ennuste; ennustettu ylittää mitatun rajan ylityksessä välillä { $lo }–{ $hi }

js-site-evidence-hold-control = «Kontrolli:» naiivi ennuste (yhden sekunnin vakaus luettuna valkoiseksi taajuuskohinaksi) antaa suhteen { $ratio }, joka on noin kertoimen { $factor } verran pielessä, ja se ei läpäise samaa kynnystä. Kynnyksellä on hampaat.

js-site-evidence-hold-lg-meas = mitattu holdout-tallenteella (piste: ylitys)

js-site-evidence-hold-lg-pred = ennustettu ensimmäisen kolmanneksen perusteella (rengas: ylitys)

js-site-evidence-hold-nodata = Mitattu tallenne ei ollut saatavilla tämän sivun luontihetkellä.

js-site-evidence-hold-perfect = 1 = täydellinen

js-site-evidence-hold-ratio-aria = Ennustettu suhteessa mitattuun { $n } rajalle, kaikki hyväksytyn kertoimen { $bar } sisällä

js-site-evidence-hold-read = liukuminen { $h } h · mitattu { $m } ns · ennustettu { $p } ns

js-site-evidence-hold-st-fit = käytetty sovitukseen

js-site-evidence-hold-st-samples = yhden sekunnin näytteet

js-site-evidence-hold-st-syncs = holdout-synkronointipisteet

js-site-evidence-hold-tip-breach = ennustettu ylitys { $p } s · mitattu { $m } s

js-site-evidence-hold-tip-error = «Aikavirhe { $thr } ns»

js-site-evidence-hold-tip-ratio = ennustettu suhteessa mitattuun «{ $ratio }»

js-site-evidence-hold-tip-row = «{ $thr } ns» · ennustettu suhteessa mitattuun «{ $ratio }»

js-site-evidence-kernel-chi2-cdf = khiin neliö -jakauma

js-site-evidence-kernel-chi2-quantile = khiin neliön kvantiili

js-site-evidence-kernel-noncentral = epäkeskeinen khiin neliö

js-site-evidence-kernel-normal-cdf = normaalijakauma

js-site-evidence-kernel-normal-quantile = normaalijakauman kvantiili

js-site-evidence-kernel-pbias = havaitsemisharha

js-site-evidence-ladder-aria = Rataresiduaalit välillä { $lo }–{ $hi } m yhdellä logaritmisella asteikolla, virastokynnys { $bar } m

js-site-evidence-ladder-bar = virastokynnys { $bar } m

js-site-evidence-ladder-cowell = Cowell Orekitia 12.2 vastaan, pahin

js-site-evidence-ladder-g24 = Galileo E11, 24 tunnin sovitus

js-site-evidence-ladder-g8 = Galileo E11, 8 tunnin sovitus

js-site-evidence-ladder-lg-headline = pääresiduaali

js-site-evidence-ladder-lg-over = virastokynnyksen { $bar } m yli

js-site-evidence-ladder-lg-ring = pelkkä voimamalli, ennen empiirisiä kiihtyvyyksiä

js-site-evidence-ladder-lro = Lunar Reconnaissance Orbiter, 4 tunnin sovitus

js-site-evidence-ladder-read = pyyhkäisy kohdassa { $v } · { $n } / { $total } pääresiduaalia sen tasolla tai alle

js-site-evidence-ladder-rt-arc = { $arc }-kaari · aste ja kertaluku { $do } · { $n } havaintoa

js-site-evidence-ladder-rt-rtn = radiaalinen { $r } m · radan suuntainen { $a } m · radan poikittainen { $c } m

js-site-evidence-ladder-sgp4 = SGP4 AIAA-vektoreita vastaan, pahin

js-site-evidence-ladder-swarm = Swarm-A, 3 tunnin sovitus

js-site-evidence-ladder-tip-cowell = «Cowell · pahin { $n } epookista» · { $worst }

js-site-evidence-ladder-tip-g24 = «Galileo E11 · kokonainen vuorokausi» · { $rms } m

js-site-evidence-ladder-tip-g8a = «Galileo E11 · vain voimamalli» · { $rms } m

js-site-evidence-ladder-tip-g8b = «Galileo E11 · empiirisin kiihtyvyyksin» · { $rms } m

js-site-evidence-ladder-tip-lrd = «Kuun kiertoradalla oleva luotain · dynaaminen» · { $rms } m

js-site-evidence-ladder-tip-lrr = «Kuun kiertoradalla oleva luotain · redusoitu dynaaminen» · { $rms } m, kynnyksen { $bar } m yläpuolella ja raportoitu sellaisenaan

js-site-evidence-ladder-tip-sgp4 = «SGP4 · pahin { $n } vektorista» · { $worst }

js-site-evidence-ladder-tip-swd = «Swarm-A · dynaaminen» · { $rms } m, lähes kokonaan radan suuntainen (ilmanvastus)

js-site-evidence-ladder-tip-swr = «Swarm-A · redusoitu dynaaminen» · { $rms } m

js-site-evidence-raim-aria = { $pass } / { $n } SciPy-tapausta toleranssikaistansa sisällä, { $kernels } ytimen yli

js-site-evidence-raim-lane = { $kernel } · { $n }

js-site-evidence-raim-lg-most = suurin osa kaistasta, jonka mikä tahansa tapaus käyttää

js-site-evidence-raim-read = tapaus { $q } / { $n } · { $kernel } · { $what }

js-site-evidence-raim-read-band = { $pct } % kaistasta

js-site-evidence-raim-scale-aria = Väriasteikko: käytetty osuus toleranssikaistasta, logaritminen arvosta 10 potenssiin miinus 11 kaistan reunaan

js-site-evidence-raim-st-inside = kaistan sisällä

js-site-evidence-raim-st-most = suurin osa kaistasta käytetty

js-site-evidence-raim-tick-edge = kaistan reuna

js-site-evidence-raim-tick-exact = tarkka

js-site-evidence-raim-tip-case = «{ $kernel }» · tapaus { $j } / { $n }

js-site-evidence-raim-tip-exact = «tarkka vastaavuus» SciPyn kanssa

js-site-evidence-raim-tip-uses = käyttää «{ $pct } %» toleranssikaistastaan

js-site-evidence-sgp4-aria = { $n } / { $n } AIAA-vektoria toistettu; pahin { $worst }, mediaani { $median }, kaikki toleranssin { $tol } sisällä

js-site-evidence-sgp4-deep = syvä avaruus (SDP4)

js-site-evidence-sgp4-lg-deep = syvän avaruuden vektori (SDP4)

js-site-evidence-sgp4-lg-median = mediaani ja pahin asteikolla

js-site-evidence-sgp4-lg-near = lähellä Maata oleva vektori (SGP4)

js-site-evidence-sgp4-near = lähellä Maata (SGP4)

js-site-evidence-sgp4-read = vektori { $i } / { $n } · satelliitti { $sat } · virhe { $err }

js-site-evidence-sgp4-read-deep = vektori { $i } / { $n } · satelliitti { $sat }, syvä avaruus · virhe { $err }

js-site-evidence-sgp4-scale-aria = Väriasteikko 0,1 mikrometristä toleranssiin, logaritminen

js-site-evidence-sgp4-st-deep = syvän avaruuden vektorit

js-site-evidence-sgp4-st-sats = testisatelliitit

js-site-evidence-sgp4-tip-sat = «Satelliitti { $sat }» · { $kind }

js-site-evidence-sgp4-tip-vector = vektori { $j } / { $n } · paikkavirhe «{ $err }»

js-site-evidence-st-median = mediaani

js-site-evidence-st-worst = pahin

js-site-evidence-tolerance = toleranssi { $v }

js-site-filter-in-all = { $total } yhteensä

js-site-filter-matches =
    { $n ->
        [one] { $n } osuma
       *[other] { $n } osumaa
    }

js-site-filter-n-of-m = { $n } / { $total }

js-site-filter-n-of-m-rows = { $n } / { $total } riviä

js-site-filter-rows = { $total } riviä

js-site-home-banner-gnss-lost = GNSS menetetty · holdover

js-site-home-banner-holdover-out = Holdover · kello suojarajan ulkopuolella

js-site-home-banner-integrity-holdover = Eheyshälytys · holdover jatkuu

js-site-home-banner-integrity-none = Eheyshälytys · ei suojaustasoa

js-site-home-banner-integrity-pl = Eheyshälytys · PL > AL

js-site-home-banner-jamming = Häirintä (jamming) · C/N0 lähellä alarajaa

js-site-home-banner-spoofing = Harhautushälytys (spoofing) · RF-ilmaisin

js-site-home-cap-holdover = Häirintälähetin nousee tasolle { $dbw } dBW: { $trk } satelliittia seurannassa. Kello käy vapaasti harhauttajan jättämästä { $carry } ns:stä ja ylittää suojarajansa { $guard } ns kohdassa { $at }; INS liukuu eteenpäin.

js-site-home-cap-integrity = Satelliitit palaavat, mutta vain maskin { $mask }° yläpuolella: { $trk } seurannassa. Suojaustaso ylittää hälytysrajan { $al } m tai sitä ei voida muodostaa, joten valvonta hälyttää ja kello pysyy holdoverissa.

js-site-home-cap-jamming = Laajakaistainen häirintälähetin { $km } km päässä tasolla { $dbw } dBW. C/N0 putoaa arvoon { $cn } dB-Hz, { $above } dB seurannan alarajan { $floor } dB-Hz yläpuolelle; kaikki { $trk } satelliittia pysyvät silti seurannassa.

js-site-home-cap-nominal = { $trk } satelliittia seurannassa keskimääräisellä C/N0-arvolla { $cn } dB-Hz. Kello on kurissa GNSS-aikaan ja suojaustaso ({ $pl } m) on hälytysrajan { $al } m alapuolella.

js-site-home-cap-recovery = GNSS synkronoitu uudelleen: { $trk } satelliittia seurannassa, aikavirhe palannut arvoon { $te } ns, suojaustaso { $pl } m.

js-site-home-cap-spoofing = Harhauttaja työntää vastaanottimen kelloa nopeudella { $rate } ns/s. RF-ilmaisin (radiotaajuus) hälyttää heti; kelloavusteinen valvonta laukeaa { $det } s kuluttua ja vaihe päättyy, kun { $off } ns on vedetty sisään.

js-site-home-cn-no-lock = 0 / { $max } seurannassa · ei lukitusta

js-site-home-cn-tracking = { $n } / { $max } seurannassa

js-site-home-no-pl = ei PL:ää

js-site-home-pause = Keskeytä tehtävä

js-site-home-pl-alarm = hälytys · PL yli AL:n

js-site-home-pl-no-sats = ei satelliitteja, ei PL:ää

js-site-home-pl-not-computed = ei laskettu tässä vaiheessa

js-site-home-pl-too-few = liian vähän satelliitteja

js-site-home-pl-under-al = alle AL:n { $thr } m

js-site-home-play = Toista tehtävä

js-site-home-receiver-tracking = Vastaanotin · { $n } seurannassa

js-site-home-replay-restarted = Toisto käynnistetty uudelleen · { $file }

js-site-home-te-disciplined = kurissa GNSS:ään

js-site-home-te-free-running = holdover · vapaasti käyvä

js-site-home-te-outside-guard = holdover · suojarajan ulkopuolella

js-site-home-te-spoofer = harhauttaja vetää kelloa

js-site-home-thr-floor = alaraja

js-site-home-thr-guard = suojaraja

js-site-kind-action = Toiminto

js-site-mcp-arguments-excerpt = argumentit (ote)

js-site-mcp-axis-mission-time = tehtäväaika

js-site-mcp-clock-holdover = kellon { $clock } holdover

js-site-mcp-dir-reply = kshana-mcp → avustaja

js-site-mcp-dir-request = avustaja → kshana-mcp

js-site-mcp-figcaption = Piirretty palautetusta sarjasta: kunkin kellon aikavirhe suhteessa kynnykseen

js-site-mcp-fom-availability = saatavuus

js-site-mcp-fom-caption = run_scenarion palauttamat laatumittarit kelloa kohden

js-site-mcp-fom-header = Laatumittari

js-site-mcp-fom-holdover = holdover (s)

js-site-mcp-fom-p95 = aikavirhe, 95. persentiili (ns)

js-site-mcp-fom-rms = aikavirhe, neliöllinen keskiarvo (ns)

js-site-mcp-lede = Tallennettu { $recorded } · v{ $version } · vakiosyöte ja -tuloste · protokolla { $protocol } · vain täsmälliset viestit

js-site-mcp-legend-gnss-lost = GNSS menetetty kohdassa { $s } s

js-site-mcp-legend-threshold = kynnys { $v } ns

js-site-mcp-pause = Keskeytä

js-site-mcp-play = Toista

js-site-mcp-plot-aria = Kohteiden { $quantum } ja { $classical } aikavirhe run_scenarion palauttamana suhteessa kynnykseen { $threshold } ns; GNSS (maailmanlaajuinen satelliittinavigointijärjestelmä) menetetty kohdassa { $lost } s

js-site-mcp-recorded-json = Tallennettu JSON: { $label }

js-site-mcp-scenario-hash = skenaarion tiiviste

js-site-mcp-server-identity = palvelimen identiteetti

js-site-mcp-show-json = Näytä JSON

js-site-mcp-step-aria = Vaihe { $n } / { $total }: { $name }

js-site-mcp-step-result = tulos: laatumittarit

js-site-mcp-step-status = Vaihe { $n } / { $total } · { $name }

js-site-mcp-summary-excerpt = yhteenvetorivi ja tulos (ote)

js-site-mcp-tab-result = tulos

js-site-mcp-threshold = kynnys

js-site-mcp-toml-lines =
    { $n ->
        [one] { $n } rivi
       *[other] { $n } riviä
    }

js-site-mcp-toml-more = … ({ $n } riviä lisää tiedostosta { $file })

js-site-mcp-tool-count =
    { $n ->
        [one] { $n } työkalu
       *[other] { $n } työkalua
    }

js-site-mcp-tools-with-descriptions =
    { $n ->
        [one] { $n } työkalu kuvauksineen
       *[other] { $n } työkalua kuvauksineen
    }

js-site-menu-close = Sulje valikko

js-site-menu-open = Avaa valikko

js-site-missions-avail-title = Saatavuus: ajon osuus, jolla PDOP ≤ { $limit }

js-site-missions-avail-uniform = { $v } % jokaisessa ruudussa

js-site-missions-chart-error-title = paikkavirhe (m, logaritminen)

js-site-missions-chart-four = paikkaratkaisuun tarvitaan neljä

js-site-missions-chart-four-short = neljä paikkaratkaisuun

js-site-missions-chart-lg-earth = Maa näkyvissä

js-site-missions-chart-lg-error-earth = virhe, välittimet ja Maa-etäisyys

js-site-missions-chart-lg-error-relays = virhe, vain välittimet

js-site-missions-chart-lg-relays = näkyvissä olevat välittimet

js-site-missions-chart-relays-title = näkyvissä olevat välittimet · varjostettu: Maa horisontin yläpuolella

js-site-missions-chip-at-pdop = kun PDOP ≤ { $limit }

js-site-missions-chip-engine = Moottori:

js-site-missions-chip-fix-earth = paikkaratkaisu, Maan kanssa

js-site-missions-chip-median-pdop = PDOP:n mediaani

js-site-missions-chip-relays = välittimet

js-site-missions-chip-rms = RMS-virhe

js-site-missions-chip-satellites = satelliitit

js-site-missions-chip-tracking-held = { $label } seuranta säilyi

js-site-missions-clocks-aria = Aikavirhe yhden holdover-vuorokauden jälkeen kelloluokittain, logaritminen asteikko

js-site-missions-clocks-frame = koordinaatiston alaraja { $ns } ns

js-site-missions-clocks-note = aikavirhe yhden vuorokauden jälkeen, sekunteina (logaritminen)

js-site-missions-clocks-sigma = σy(1 s) { $sigma }

js-site-missions-clocks-title = { $clock }: { $ns } ns yhden vuorokauden jälkeen, σy(1 s) { $sigma }

js-site-missions-cone-aria = Paikkavirhekartio GNSS:n menetyksestä alkaen

js-site-missions-cone-axis-x = GNSS:n menetyksestä kulunut aika (s)

js-site-missions-cone-axis-y = paikkavirhe (m)

js-site-missions-cone-budget = ±{ $m } m budjetti

js-site-missions-cone-clipped = leikattu rajaan ±{ $m } m

js-site-missions-cone-leaves = poistuu kohdassa { $s } s

js-site-missions-cone-readout = t { $t } s · { $errors }

js-site-missions-copy-command = Kopioi komento

js-site-missions-copy-title = Kopioi sen toistava komento

js-site-missions-deterministic = deterministinen

js-site-missions-engine-build = Moottori v{ $version }, build

js-site-missions-engine-build-commit = Moottori v{ $version }, build { $commit }

js-site-missions-fp-aria = Häirinnän jalanjälkikartta. Nuolinäppäimet siirtävät ruudusta toiseen, Enter avaa kyseisen ajon.

js-site-missions-fp-aria-svg = Häirinnän jalanjälki häirintälähettimen ympärillä

js-site-missions-fp-darker = tummempi = suurempi keskimääräinen J/S · { $step } km:n ruudut · { $n } moottoriajoa

js-site-missions-fp-jammer = häirintälähetin

js-site-missions-fp-lg-held = seuranta säilyi

js-site-missions-fp-lg-lost = jokainen satelliitti menetetty

js-site-missions-fp-lg-some = joitakin epookkeja menetetty

js-site-missions-fp-open = Avaa tämä ajo ohjelmassa { $studio }

js-site-missions-fp-read = noin { $km } km häirintälähettimestä · keskimääräinen J/S { $js } dB · seurannan saatavuus { $av }

js-site-missions-fp-ship = skenaarion laiva

js-site-missions-grades-aria = Vapaa inertialiukuminen ennen rajoja { $a } m ja { $b } m IMU-luokittain

js-site-missions-grades-axis = liukumisen sekunnit GNSS:n menetyksen jälkeen (logaritminen)

js-site-missions-grades-point = { $grade }: { $s } s arvoon { $m } m ({ $why })

js-site-missions-grades-reaches = virhe saavuttaa arvon { $m } m

js-site-missions-grades-speed = nopeudella { $v } m/s

js-site-missions-grades-this = tämä skenaario

js-site-missions-hud-earth-link = Maa-yhteys

js-site-missions-hud-link-above = Maa-yhteys · horisontin yläpuolella

js-site-missions-hud-link-occulted = Maa-yhteys · peitossa

js-site-missions-hud-orbiter = Kiertoradalla oleva

js-site-missions-hud-receiver = Vastaanotin

js-site-missions-hud-relays = Välittimet

js-site-missions-hud-selected-lat = valittu leveysaste

js-site-missions-info-in-view = Näkyvissä

js-site-missions-info-in-view-value = { $mean } keskimäärin · { $fewest } vähiten

js-site-missions-info-pdop-above = { $pdop }, yli rajan { $limit }

js-site-missions-json-title = Moottorin tulos muuttamattomana

js-site-missions-json-unavailable = JSON ei saatavilla

js-site-missions-key-avail = Saatavuus

js-site-missions-key-pdop-title = Keskimääräinen PDOP (tarkkuuden heikkenemiskerroin)

js-site-missions-key-vis = Näkyvissä olevat satelliitit

js-site-missions-key-vis-short = Näkyvissä

js-site-missions-leo-grid = ruudukosta, kun PDOP ≤ { $limit }

js-site-missions-leo-in-view = näkyvissä keskimäärin

js-site-missions-leo-shells = satelliittia neljässä kuoressa

js-site-missions-map-aria = { $title } kappaleella { $body }, 10 asteen ruuduittain. Nuolinäppäimet siirtävät vastaanotinta; sen ruutu luetaan alla.

js-site-missions-map-colour-by = Värjää kartta perusteella

js-site-missions-map-fewest-in-view = vähiten näkyvissä

js-site-missions-map-grey = harmaa: ei paikkaratkaisua

js-site-missions-map-hatched = viivoitettu: PDOP-rajan { $limit } yläpuolella

js-site-missions-map-in-view = näkyvissä

js-site-missions-map-live = { $cell }: { $rows }

js-site-missions-map-mean-in-view = keskimäärin näkyvissä

js-site-missions-map-mean-pdop = keskimääräinen PDOP

js-site-missions-map-pdop-limit = PDOP-raja { $limit }

js-site-missions-matrix-caption = Skenaariotiedostot sektoreittain (rivit) ja vikatilan mukaan (sarakkeet). Valitse luku avataksesi kyseisen sektorin.

js-site-missions-matrix-cell =
    { $n ->
        [one] { $sector }, { $mode }: { $n } skenaariotiedosto
       *[other] { $sector }, { $mode }: { $n } skenaariotiedostoa
    }

js-site-missions-matrix-files =
    { $n ->
        [one] { $n } tiedosto:
       *[other] { $n } tiedostoa:
    }

js-site-missions-matrix-sector = Sektori

js-site-missions-mode-int = Häiriö

js-site-missions-mode-itg = Eheys

js-site-missions-mode-nav = Liukuminen

js-site-missions-mode-orb = Geometria

js-site-missions-mode-spf = Harhautus

js-site-missions-mode-tim = Ajoitus

js-site-missions-n-of-total = { $n } / { $total }

js-site-missions-no-fix = ei paikkaratkaisua

js-site-missions-no-seed = deterministinen, ei siemenlukua

js-site-missions-open-in-studio = Avaa ohjelmassa { $studio }

js-site-missions-open-report = Avaa moottorin raportti

js-site-missions-ow-chart-aria = Vastaanottimen vaste ajon aikana kohteelle { $name }: näkyvissä olevat välittimet sekä paikkavirhe pelkillä välittimillä ja Maa-etäisyyden kanssa

js-site-missions-ow-chip-epochs = epookit

js-site-missions-ow-chip-mask = maski

js-site-missions-ow-chip-orbiter = kiertoradalla oleva

js-site-missions-ow-chip-range = etäisyys σ

js-site-missions-ow-chip-relays = välittimet

js-site-missions-ow-chip-relays-value = { $planes } × { $per } korkeudella { $alt } km, { $inc }°

js-site-missions-ow-chip-span = kesto

js-site-missions-ow-count-relays = { $n } välitintä ja kiertoradalla oleva · { $body }

js-site-missions-ow-count-sats = { $n } satelliittia · { $body }

js-site-missions-ow-engine = moottori v{ $version } · build { $commit }

js-site-missions-ow-lat-label = Vastaanottimen leveysaste

js-site-missions-ow-map-aria = Vastaanottimen vaste kohteelle { $name }: kartta kappaleesta { $body } 10 asteen ruuduittain, vieressä keskimääräinen ja vähimmäismäärä näkyvissä olevia satelliitteja sekä keskimääräinen PDOP leveysasteittain

js-site-missions-ow-note-imagery = Kappaleen { $body } kuvat: NASA.

js-site-missions-ow-note-rebuilt = Radat: välittimet ja kiertoradalla oleva rakennettu uudelleen skenaariosta täsmälleen niin kuin moottori ne rakentaa; niiden antama näkyvissä olevien satelliittien määrä on sama kuin moottorin kaikissa { $n } epookissa.

js-site-missions-ow-note-sats = Radat: ajon satelliitit propagoitu tässä uudelleen ja tarkistettu kaikkia { $n } moottorin kirjoittamaa maanpintajälkinäytettä vasten (pahin { $deg }°).

js-site-missions-ow-note-scaled = Ratojen säteet on skaalattu esitystä varten; tasot, vaiheistus ja kiertoajat ovat ajon omia.

js-site-missions-ow-note-tracks = Moottori kirjoitti maanpintajäljet { $shown } satelliitille { $total }:sta; kaikki { $total } piirretään sen kuorista.

js-site-missions-ow-note-walker = Radat: ajon Walker-kuoret propagoitu tässä uudelleen ja tarkistettu kaikkia { $n } moottorin kirjoittamaa maanpintajälkinäytettä vasten (pahin { $deg }°).

js-site-missions-ow-off = pois

js-site-missions-ow-on = päällä

js-site-missions-ow-pause = Keskeytä radat

js-site-missions-ow-play = Toista radat

js-site-missions-ow-time = t = { $time }

js-site-missions-ow-time-label = Tehtäväaika

js-site-missions-ow-valuetext = { $time }, { $n } välitintä näkyvissä

js-site-missions-pdop-title = Keskimääräinen PDOP (tarkkuuden heikkenemiskerroin), logaritminen asteikko, pienempi on parempi

js-site-missions-report = Raportti

js-site-missions-report-title = Moottorin oma raportti tästä ajosta

js-site-missions-ro-above-horizon = horisontin yläpuolella

js-site-missions-ro-availability = Saatavuus, PDOP ≤ { $limit }

js-site-missions-ro-earth-light = Maa · valonkulkuaika { $s } s

js-site-missions-ro-error-relays = Paikkavirhe, vain välittimet

js-site-missions-ro-occulted = peitossa

js-site-missions-ro-place-availability = Paikassa { $place }: saatavuus

js-site-missions-ro-place-in-view = Paikassa { $place }: näkyvissä, keskiarvo · vähiten

js-site-missions-ro-relays = Näkyvissä olevat välittimet

js-site-missions-ro-satellites = Satelliitit

js-site-missions-ro-with-earth = Maa-etäisyyden kanssa

js-site-missions-run-failed = Tallennettua ajoa ei voitu ladata tähän; avaa se ohjelmassa { $studio } alla olevasta linkistä.

js-site-missions-seed = siemenluku { $seed }

js-site-missions-spoof-aria = Harhautuspoikkeama ajan funktiona sekä kunkin valvonnan havaitsemisraja ja havaitsemisaika

js-site-missions-spoof-axis-x = harhautuksen alusta kulunut aika (s)

js-site-missions-spoof-axis-y = aikapoikkeama (ns)

js-site-missions-spoof-detects = { $id } havaitsee kohdassa { $s } s

js-site-missions-spoof-lg-bound = { $id }:n raja

js-site-missions-spoof-lg-offset = harhautuspoikkeama

js-site-missions-spoof-readout = t { $t } s · poikkeama { $offset } ns

js-site-missions-spoof-spec = spesifikaatio { $v } ns

js-site-missions-sr-aria = { $members }; yhteinen häirintälähetin { $power } dBW

js-site-missions-sr-aria-member = { $label }: seuranta säilyi { $held } %, keskimääräinen häirintälähettimen ja signaalin suhde { $js } dB, vähiten seurattuja satelliitteja { $min }

js-site-missions-sr-car = Auto

js-site-missions-sr-fewest = vähiten seurattuja

js-site-missions-sr-held = seuranta säilyi

js-site-missions-sr-mean-js = keskimääräinen J/S

js-site-missions-sr-ship = Laiva

js-site-missions-swipe =
    { $n ->
        [one] Pyyhkäise nähdäksesi kaikki { $n } skenaariotiedosto
       *[other] Pyyhkäise nähdäksesi kaikki { $n } skenaariotiedostoa
    }

js-site-missions-toml-download-title = Lataa ajettu skenaariotiedosto

js-site-missions-toml-title = Ajettu skenaariotiedosto

js-site-missions-vis-title = Näkyvissä olevat satelliitit, keskiarvo ajon yli

js-site-missions-vis-uniform = { $v } jokaisessa ruudussa

js-site-palette-none = Ei tuloksia

js-site-palette-results = { $count } tulosta

js-site-pro-band-at = { $minutes } minuutin kohdalla: 5.–95. persentiili

js-site-pro-band-range = { $lo }–{ $hi } { $unit }

js-site-pro-band-runs-within = { $n } ajosta rajoissa ±{ $limit } { $unit }

js-site-pro-design-readout = { $sat } satelliittia, { $av } % saatavuus · { $planes } tasoa korkeudella { $alt } km, { $incl }°

js-site-pro-front-design = Rintaman suunnitelma { $id }

js-site-pro-front-design-knee = Rintaman suunnitelma { $id } · polvi

js-site-pro-more-designs =
    { $n ->
        [one] (+{ $n } rintaman suunnitelma lisää tässä pisteessä)
       *[other] (+{ $n } rintaman suunnitelmaa lisää tässä pisteessä)
    }

js-site-pro-not-rerun = ei ajettu uudelleen

js-site-pro-rerun-free = ajettu uudelleen ilmaisella moottorilla:

js-site-pro-same-sha = sama SHA-256 { $sha }…

js-site-pro-same-sha-index = sama tuloksen SHA-256 kuin hakemistossa

js-site-toast-copied = Kopioitu: { $text }

js-site-toast-data-failed = Datatiedostoa ei voitu ladata

js-site-toast-data-saved = Data tallennettu CSV-muodossa

js-site-toast-no-data = Tälle kaaviolle ei ole dataa

js-site-toast-svg-saved = Kaavio tallennettu SVG-muodossa

js-site-toast-table-saved = Taulukko tallennettu CSV-muodossa

js-site-waterfall-axis-now = nyt

js-site-waterfall-bar-title = { $band }: { $cn0 } dB-Hz, { $state }

js-site-waterfall-bar-title-js = { $band }: { $cn0 } dB-Hz, { $state }, J/S { $js } dB

js-site-waterfall-below-floor = signaalit ovat kohinatason alapuolella

js-site-waterfall-campaign-drives = Kampanja, jota se ohjaa:

js-site-waterfall-campaign-seed = siemenluku { $seed } · { $phases } vaihetta ajalla { $duration } s

js-site-waterfall-chip-aria = { $band }, { $fc } megahertsiä: näytä tämä kaista

js-site-waterfall-chip-title = { $band } · { $fc } MHz · vastaanottimen kaistanleveys { $bw } MHz

js-site-waterfall-engine-build = Moottori v{ $version } · build

js-site-waterfall-fallback-head = Galileo-varatila · { $s } s, vain CW-ääni

js-site-waterfall-fallback-text = { $band } takaisin tasolla { $v } dB-Hz. Eheyden valvonta pelkällä Galileolla: suojaustaso { $min }–{ $max } m, hälytysrajan { $limit } m alapuolella.

js-site-waterfall-floor = seurannan alaraja { $thr } dB-Hz

js-site-waterfall-holdover-head = Holdover · { $s } s, chirp päällä

js-site-waterfall-holdover-text = { $band0 } { $v0 }, { $band1 } { $v1 } dB-Hz, alarajan alapuolella. Kello käy vapaasti: pahin { $worst } ns suhteessa suojarajaan { $guard } ns.

js-site-waterfall-jammer-off = { $what } pois

js-site-waterfall-jammer-on = { $what } päällä

js-site-waterfall-live = { $freq } megahertsiä, { $time }: { $detail }

js-site-waterfall-live-band = { $band } { $cn0 } dB-Hz, { $state }

js-site-waterfall-live-none = ei mallinnettua kaistaa

js-site-waterfall-load-failed = Tallennettua ajoa ei voitu ladata. Alla oleva moottorin raportti näyttää saman ajon.

js-site-waterfall-no-jammer-band = Ei häirintälähetintä tällä kaistalla

js-site-waterfall-no-jammer-in-band = ei häirintälähetintä kaistalla

js-site-waterfall-no-seed = deterministinen, ei siemenlukua

js-site-waterfall-onset-head = Alku · { $t0 }–{ $t1 } s

js-site-waterfall-onset-text = Kaikki { $n } kaistaa seurannassa, kunnes spektriajo menettää ensimmäisen kerran kaistan { $band } kohdassa { $s } s.

js-site-waterfall-pause = Keskeytä vesiputous

js-site-waterfall-play = Toista vesiputous

js-site-waterfall-quiet-band = { $band } { $cn0 } dB-Hz · { $state }

js-site-waterfall-run-time = ajo T+{ $s } s

js-site-waterfall-scale-caption = PSD lattian { $floor } dBW/Hz yläpuolella · { $bin } MHz × { $step } s ruudut

js-site-waterfall-seed = siemenluku { $seed }

js-site-waterfall-short-lost = menetetty

js-site-waterfall-short-ok = seurattu

js-site-waterfall-short-rec = palautunut

js-site-waterfall-state-lost = Lukitus menetetty

js-site-waterfall-state-lost-low = lukitus menetetty

js-site-waterfall-state-ok = Seuranta

js-site-waterfall-state-ok-low = seuranta

js-site-waterfall-state-rec = Palautunut

js-site-waterfall-state-rec-low = palautunut

js-site-waterfall-summary-recovers = { $band } menettää lukituksen kohdassa { $lost } s ja palautuu kohdassa { $rec } s, alin { $min } dB-Hz.

js-site-waterfall-summary-rows = { $n } riviä, { $step } s kukin.

js-site-waterfall-summary-stays-lost = { $band } menettää lukituksen kohdassa { $lost } s ja pysyy menetettynä, alin { $min } dB-Hz.

js-site-waterfall-summary-tracks = { $band } pysyy seurannassa koko ajan, alin { $min } dB-Hz.

js-site-waterfall-tip-above-floor = kohinatason yläpuolella

js-site-waterfall-tip-at-floor = Lämpökohinan tasolla

js-site-waterfall-tip-band = { $cn0 } dB-Hz · { $state }

js-site-waterfall-tip-head = { $lo }–{ $hi } MHz · { $time }

js-site-waterfall-tip-js = J/S { $js } dB

js-site-waterfall-tip-no-band = Minkään mallinnetun kaistan vastaanottimen kaistanleveys ei kata tätä saraketta

js-site-waterfall-wave-chirp = chirp

js-site-waterfall-wave-cw = CW-ääni

js-site-waterfall-wave-noise = kohina

js-site-waterfall-who-cursor = Osoittimen alla oleva kaista

js-site-waterfall-who-selected = Valittu kaista

js-site-waterfall-who-worst = Heikoin kaista
