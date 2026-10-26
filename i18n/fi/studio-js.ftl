# studio-js.ftl (fi): translations

js-adv-all-domains = Kaikki alueet

js-adv-animation-frame-title = Tämän ajon animaatio, moottorin kirjoittama

js-adv-animation-html-player = HTML-soitin

js-adv-animation-html-player-title = Yhden tiedoston soitin sellaisena kuin moottori sen kirjoitti

js-adv-animation-load-failed = Tallennettua animaatiota ei voitu ladata ({ $reason }).

js-adv-animation-loading = Ladataan tallennettua animaatiota…

js-adv-animation-none = Tälle skenaariolle ei ole tallennettua animaatiota.

js-adv-animation-note = Moottori kirjoittaa animaation jokaisesta ajosta, jolla on aika-akseli: itsestään toistuvan SVG:n ja yhden tiedoston HTML-soittimen, jossa on omat toisto- ja kelausohjaimet. Selainversio ei sisällä tätä kirjoitinta, joten tämä on tiedosto, jonka natiivi komentorivimoottori kirjoitti mukana toimitetulle skenaariolle.

js-adv-animation-svg = Animoitu SVG

js-adv-animation-svg-title = Itsestään toistuva SVG sellaisena kuin moottori sen kirjoitti

js-adv-axis-averaging-time = keskiarvoistusaika τ (s)

js-adv-axis-observation-interval = havaintoväli τ (s)

js-adv-axis-value = arvo

js-adv-badge-live-engine = Live-moottori

js-adv-badge-recorded = Tallennettu

js-adv-badge-recorded-engine = Tallennettu ajo, moottori v{ $version }

js-adv-badge-recorded-native = Tallennettu ajo, natiivi moottori v{ $version }

js-adv-band-carrier = Kantoaalto

js-adv-band-carrier-not-set = ei asetettu tässä skenaariossa

js-adv-band-chip-rate = Chip-nopeus

js-adv-band-jammer-bandwidth = Häirintälähettimen kaistanleveys

js-adv-band-jammer-label = häirintälähetin { $bandwidth } MHz

js-adv-band-jammer-power = Häirintälähettimen teho

js-adv-band-jammer-type = Häirintälähettimen tyyppi

js-adv-band-no-carrier-note = Moottori laskee häirintälähettimen ja signaalin suhteen linkkibudjetista. Tämä skenaario ei nimeä kantoaaltotaajuutta, joten spektriä ei piirretä.

js-adv-band-satellites = Satelliitit

js-adv-band-signal-main-lobe = signaalin pääkeila

js-adv-band-svg-label = Signaali- ja häirintäkaistat kantoaallon ympärillä

js-adv-band-tracking-threshold = Seurantakynnys

js-adv-browser-cannot-run = Selainversio ei voi ajaa tätä skenaariota.

js-adv-busy-running = Ajetaan

js-adv-busy-sweeping = Pyyhkäistään

js-adv-chain-handed-on =
    { $n ->
        [one] { $n } arvo välitetty eteenpäin
       *[other] { $n } arvoa välitetty eteenpäin
    }

js-adv-chain-note = Yksi järjestelmä seurattuna moottorin jokaisen vaiheen läpi. Alla oleva taulukko luettelee jokaisen luvun, jonka vaihe laski ja seuraava vaihe käytti.

js-adv-chain-stage = Vaihe { $n }

js-adv-chain-sub = jokaisen vaiheen tuloste syöttää seuraavaa

js-adv-chain-title = Ketju

js-adv-chart-allan-title = Allanin poikkeama

js-adv-chart-budget-label = budjetti

js-adv-chart-default-title = Kshana-kaavio

js-adv-chart-effective-cn0 = Tehollinen C/N0 satelliitin mukaan

js-adv-chart-ground-track = Maarata

js-adv-chart-holdover-budget = Holdover suhteessa ajoitusbudjettiin

js-adv-chart-mtie-title = MTIE (suurin aikavälivirhe)

js-adv-chart-provenance = Kshana v{ $version } · kshana.dev

js-adv-chart-provenance-hash = Kshana v{ $version } · skenaario { $hash } · kshana.dev

js-adv-chart-stability-title = Kellon vakaus (limittäinen Allanin poikkeama)

js-adv-chart-tdev-title = TDEV (aikapoikkeama)

js-adv-chart-undrawable = Tätä kaaviota ei voitu piirtää.

js-adv-chip-live = Live-moottori · v{ $version }

js-adv-chip-live-title = Kshana-moottori toimii tässä selaimessa WebAssemblyna

js-adv-chip-recorded = Tallennetut ajot · v{ $version }

js-adv-chip-recorded-title = WebAssembly ei käynnistynyt tässä. Näytetään mukana toimitettujen skenaarioiden todellisia tallennettuja ajoja.

js-adv-chip-recorded-title-reason = WebAssembly ei käynnistynyt tässä ({ $reason }). Näytetään mukana toimitettujen skenaarioiden todellisia tallennettuja ajoja.

js-adv-chip-unavailable = Moottori ei ole käytettävissä

js-adv-cmd-all-fields = Näytä kaikki numeeriset kentät

js-adv-cmd-compare = Vertaa kiinnitettyjä ajoja

js-adv-cmd-embed-code = Kopioi upotuskoodi

js-adv-cmd-exports = Lataa tulokset (viennit)

js-adv-cmd-history = Avaa ajohistoria

js-adv-cmd-parameters = Avaa parametrit

js-adv-cmd-pin = Kiinnitä tämä ajo vertailua varten

js-adv-cmd-report = Lataa raportti

js-adv-cmd-reset = Palauta skenaarion teksti

js-adv-cmd-run = Aja skenaario

js-adv-cmd-share-link = Kopioi jakolinkki

js-adv-cmd-start = Siirry aloitusnäyttöön

js-adv-cmd-theme = Vaihda vaalean ja tumman teeman välillä

js-adv-cmd-tour = Aloita opastettu kierros

js-adv-command-line-only = vain komentorivi

js-adv-compare-deltas-note = Erot ovat suhteessa ajoon A. Vihreä merkitsee kunkin luvun parempaa arvoa.

js-adv-compare-no-common = Näillä ajoilla ei ole vertailukelpoisia ansioarvoja. Kiinnitä saman skenaarioperheen ajoja nähdäksesi luvut ja erot.

js-adv-compare-one-pinned = Yksi ajo on kiinnitetty. Muuta parametria, aja uudelleen ja kiinnitä se ajo verrataksesi näitä kahta.

js-adv-compare-overlay = Kiinnitettyjen ajojen päällekkäiskuva

js-adv-compare-overlay-diff = Päällekkäiskuva ja erotus B − A

js-adv-compare-overlay-note = Yhtenäiset viivat ovat ajo A ja katkoviivat ajo B, samoilla akseleilla.

js-adv-compare-overlay-title = { $title }: ajo { $a } (A) verrattuna ajoon { $b } (B)

js-adv-compare-pin-two = Kiinnitä vähintään kaksi ajoa verrataksesi niitä vierekkäin. Kiinnitä ajo, muuta parametria tai valitse toinen saman perheen skenaario, aja se ja kiinnitä uudelleen.

js-adv-compare-run-heading = { $letter } · ajo { $run }

js-adv-copy-blocked = Kopiointi on estetty tässä.

js-adv-copy-command = Kopioi: { $command }

js-adv-could-not-load = Tiedostoa { $file } ei voitu ladata.

js-adv-coverage-dots = Pisteet ovat { $shown } / { $total } satelliittia, lennätettyinä maaratoja pitkin; toista kertaus liikuttaaksesi niitä.

js-adv-coverage-field-label = Kartoitettava kenttä

js-adv-coverage-map = Kattavuuskartta

js-adv-coverage-map-over = kohteen { $body } yllä

js-adv-coverage-map-select = Kartta

js-adv-coverage-note = Jokainen solu on yksi ruudukkopiste kohteessa { $body }, pisteytettynä ajon jokaisella epookilla.

js-adv-coverage-title = { $field } kohteen { $body } yllä

js-adv-crumb-studio = Studio

js-adv-crumb-studio-title = Aloitusnäyttö: kaikki alueet

js-adv-decrease-field = Pienennä: { $field }

js-adv-domain = Alue

js-adv-domain-line-campaigns = Ketjutetut tehtävät, pyyhkäisyt ja Monte Carlo -ajot yhdellä kellolla.

js-adv-domain-line-constellations = Suunnittele satelliittitähdistö ja kartoita sen kattavuus ja PDOP (sijainnin tarkkuuden heikkenemiskerroin).

js-adv-domain-line-deepspace = Navigointi ja aika Kuussa, kuunläheisessä avaruudessa ja Marsissa.

js-adv-domain-line-integrity = Paikkaratkaisut ja se, voiko niihin luottaa: RAIM (vastaanottimen autonominen eheysvalvonta) ja sen edistynyt muoto ARAIM.

js-adv-domain-line-interference = Häirintälähettimet GNSS-vastaanottimia vastaan: mitä menetetään ja milloin.

js-adv-domain-line-leo = Matalan Maan kiertoradan navigointisignaalit, ylilennot, viestit ja paikkaratkaisut.

js-adv-domain-line-leo-missions = Matalan Maan kiertoradan kerrokseen rakennetut tutkimukset ja palvelut.

js-adv-domain-line-navigation = Inertia-, maasto-, painovoima- ja muu navigointi ilman GNSS:ää.

js-adv-domain-line-optional = Valinnainen skenaarioiden ryhmä.

js-adv-domain-line-orbits = Radan eteneminen, efemeridit ja GNSS-geometria.

js-adv-domain-line-solar = Jokainen planeetta ja kuu yhtenä epookkina valoaikoineen.

js-adv-domain-line-spaceops = Ylilennot, laukaisuikkunat, paluu ilmakehään sekä linkki- ja asentobudjetit.

js-adv-domain-line-spectrum = Radiokaistan vesiputoukset: häirintälähettimet, signaalit ja se, mitä vastaanotin seuraa.

js-adv-domain-line-spoofing = Väärät signaalit ja meaconing sekä ne tarkkailijat, jotka ne havaitsevat.

js-adv-domain-line-studies = Kvanttianturit, vaihtoehtovertailut ja yhteentoimivuusformaatit.

js-adv-domain-line-timing = Kellot ilman GNSS:ää: holdover, vakaus, telealan maskit, ajansiirto.

js-adv-domain-pick-hint = Valitse yksi: se avautuu ja ajetaan selaimessasi. Voit muuttaa sen parametreja seuraavaksi.

js-adv-domain-scenario-count =
    { $n ->
        [one] { $label }: { $n } skenaario
       *[other] { $label }: { $n } skenaariota
    }

js-adv-domain-select-label = Näytä yksi alue

js-adv-download = Lataa

js-adv-edited-cli-only-status = Muokattu: tämä skenaario toimii vain komentorivimoottorissa.

js-adv-edited-needs-engine = Muokattu: vaatii moottorin { $need }.

js-adv-edited-needs-live-engine = Muokatut skenaariot vaativat live-moottorin.

js-adv-embed-copied = Upotuskoodi kopioitu.

js-adv-engine-chart = Moottorin kaavio

js-adv-engine-chart-alt = Moottorin kaavio tälle ajolle

js-adv-engine-file-http-error = moottoritiedosto palautti HTTP { $status }

js-adv-engine-load-failed-no-recordings = moottoria ei voitu ladata ({ $reason }) eikä tallennettuja ajoja löytynyt

js-adv-engine-loading = Moottoria ladataan…

js-adv-engine-loading-title = Live-moottoria ladataan yhä. Tämä tallennettu tulos korvataan live-ajolla, kun se on valmis.

js-adv-engine-start-failed = Moottori ei käynnistynyt: { $reason }. Tarjoa tämä kansio HTTP:n kautta (esimerkiksi python3 -m http.server) sen sijaan, että avaisit tiedoston suoraan.

js-adv-entries-count =
    { $n ->
        [one] { $n } merkintä
       *[other] { $n } merkintää
    }

js-adv-export-card-title = { $format }-vienti

js-adv-export-csv-desc = Samat tavut, jotka komentorivityökalu kirjoittaa nimellä { $file }.

js-adv-export-csv-title = Toistettavuustaulukko

js-adv-export-ephemeris-checking = Tarkistetaan, mihin efemeridiformaatteihin tämä ajo voidaan viedä…

js-adv-export-ephemeris-waiting = Efemeridiviennit näkyvät tässä, kun moottori on latautunut.

js-adv-export-json-desc = Moottorin täydellinen tuloste tälle ajolle, yksiköt ja alkuperätiedot mukaan lukien.

js-adv-export-json-title = Täydellinen tulosasiakirja

js-adv-export-large-not-recorded = Tämä vienti on suuri, joten sitä ei tallennettu. Se vaatii live-moottorin.

js-adv-export-oem-desc = CCSDS OEM 2.0 (Orbit Ephemeris Message) GMATille, Orekitille tai STK:lle

js-adv-export-omm-desc = CCSDS OMM (Orbit Mean-elements Message) -luettelo

js-adv-export-report-desc = Yksi offline-tiedosto: yhteenveto, luvut tasoineen, jokainen kaavio ja tarkka skenaarioteksti, leimattuna moottorin versiolla ja skenaarion tiivisteellä.

js-adv-export-report-title = Toistettava raportti

js-adv-export-sp3-desc = Tämän satelliittitähdistön SP3-c-tarkkaefemeridi

js-adv-export-toml-desc = Tämän ajon tarkka syöte. Aja se uudelleen missä tahansa komentorivityökalulla tai Python- ja npm-paketeilla.

js-adv-export-toml-title = Skenaariotiedosto

js-adv-export-too-large = { $desc }. Liian suuri tallennettavaksi: vaatii live-moottorin.

js-adv-field-find-match =
    { $n ->
        [one] { $n } opastettu säädin ja { $fields } / { $total } kenttää vastaa hakua ”{ $query }”.
       *[other] { $n } opastettua säädintä ja { $fields } / { $total } kenttää vastaa hakua ”{ $query }”.
    }

js-adv-field-find-none = Mikään tämän skenaarion kenttä ei vastaa hakua ”{ $query }”. Hae kaikista skenaarioista kirjastohaulla.

js-adv-field-hit-in = kohteessa { $title }

js-adv-field-not-single-number = Tämä kenttä ei ole yksittäinen luku tässä skenaariossa: muokkaa sitä lähteessä.

js-adv-field-opened = Avattu kohdassa { $field }. Muuta sitä, niin skenaario ajetaan uudelleen.

js-adv-fields-matching = Kentät, jotka vastaavat hakua ”{ $query }”

js-adv-fields-more = Vielä { $n }: tarkenna hakusanoja tai hae aloitusnäytöllä.

js-adv-fields-top-level = ylin taso

js-adv-filter-check-tuning = tarkista viritys

js-adv-filter-consistent = johdonmukainen

js-adv-from-the-link = linkistä

js-adv-geo-sub = { $name } · { $shown } / { $total } kohdetta piirretty · tallennettu natiivilla moottorilla

js-adv-geo-title = GeoJSON-vienti: { $name }

js-adv-gt-note = Korostettu: satelliitti näkyy asemalta.

js-adv-gt-note-both = Korostettu: satelliitti näkyy asemalta. Korkein korkeuskulma { $elevation }°. Suurin Doppler { $doppler } Hz.

js-adv-gt-note-doppler = Korostettu: satelliitti näkyy asemalta. Suurin Doppler { $doppler } Hz.

js-adv-gt-note-elevation = Korostettu: satelliitti näkyy asemalta. Korkein korkeuskulma { $elevation }°.

js-adv-heatmap-label = Lämpökartta: { $metric }

js-adv-hist-runs-count =
    { $n ->
        [one] { $n } ajo.
       *[other] { $n } ajoa.
    }

js-adv-history-pin = Kiinnitä

js-adv-history-restore = Palauta

js-adv-history-run-time = ajo { $run } · { $time }

js-adv-holdover-engine-figure = Moottorin holdover skenaarion budjetilla: { $duration }

js-adv-holdover-engine-figure-budget = Moottorin holdover skenaarion budjetilla ({ $budget } { $unit }): { $duration }

js-adv-holdover-error-after-loss = virhe sen jälkeen, kun GNSS menetettiin hetkellä t = { $loss } s

js-adv-holdover-error-since-fix = virhe viimeisestä paikkaratkaisusta

js-adv-holdover-stays-inside = pysyy tämän budjetin sisällä koko tallenteen ajan

js-adv-holdover-until-breached = kunnes budjetti ylittyy

js-adv-honesty-modelled = Perusperiaatteisiin pohjautuvaa fysiikkaa testeineen, jota ei vielä ole tarkistettu ulkoista oraakkelia vasten. { $text }

js-adv-honesty-partner = Kumppanin omistamat luvut. { $text }

js-adv-honesty-validated = Tarkistettu riippumatonta ulkoista oraakkelia vasten. { $text }

js-adv-increase-field = Suurenna: { $field }

js-adv-install-version = Asenna v{ $version }

js-adv-interop-no-file = Moottori ei kirjoittanut tämän formaatin tiedostoa tälle ajolle.

js-adv-interop-not-applicable = Ei koske tätä skenaariota: { $reason }.

js-adv-interop-not-bundled = Ei mukana tässä (koko): yllä oleva komento kirjoittaa sen.

js-adv-interop-note = Moottori kirjoittaa ajon geometrian ja signaalinäytteet formaatteihin, joita muut työkalut avaavat: CZML Cesiumille, KML (Keyhole Markup Language) Google Earthille, GeoJSON kartoille, STK-efemeridi (.e) -tiedostot ja SigMF (Signal Metadata Format) -tallenteet. Selainversio ei sisällä näitä kirjoittimia, joten alla olevat tiedostot ovat ne, jotka natiivi komentorivimoottori kirjoitti mukana toimitetulle skenaariolle.

js-adv-js-range-label = J/S-alue

js-adv-js-range-value = { $low }–{ $high } dB

js-adv-json-copied = JSON kopioitu.

js-adv-kind-default = kind: clock holdover (oletus)

js-adv-kind-label = kind: { $kind }

js-adv-kpi-check = Tarkista

js-adv-kpi-delta-since-run = { $arrow } { $change } ajosta { $run } lähtien

js-adv-kpi-fail = Ei läpi

js-adv-kpi-first-run = ensimmäinen ajo

js-adv-kpi-not-in-previous = ei edellisessä ajossasi

js-adv-kpi-pass = Läpi

js-adv-lib-count-all =
    { $scenarios ->
        [one] { $scenarios } skenaario
       *[other] { $scenarios } skenaariota
    } · { $domains ->
        [one] { $domains } alue
       *[other] { $domains } aluetta
    }

js-adv-lib-count-filtered = Skenaarioita { $n } / { $total }

js-adv-lib-no-match = Mikään skenaario tai kenttä ei vastaa. Kokeile sanaa kuten jamming, clock, lunar, orbit, mask tai PDOP.

js-adv-loaded-shared = Linkistä ladattiin jaettu skenaario.

js-adv-mask-envelope = Holdover-aikavirheen verhokäyrä ({ $source })

js-adv-mask-exceeded-after = ylitetty ajan { $duration } jälkeen

js-adv-mask-limit-label = raja { $limit } ns

js-adv-mask-max-te = suurin |TE|

js-adv-mask-not-exceeded = ei ylitetty

js-adv-matrix-counts = { $validated } / { $total }

js-adv-matrix-line = { $counts } ominaisuutta validoitu riippumattomia ulkoisia oraakkeleita vasten · { $modelled } mallinnettu · { $partner } kumppanin omistamaa

js-adv-max-close = Sulje

js-adv-max-close-label = Sulje koko näyttö

js-adv-max-expand = Laajenna

js-adv-max-expand-label = Laajenna tämä paneeli koko näytölle

js-adv-max-title = Näytä tämä paneeli koko näytöllä (Escape sulkee sen)

js-adv-meta-engine = moottori

js-adv-meta-file = tiedosto

js-adv-meta-scenario = skenaario

js-adv-meta-seed = siemenluku

js-adv-meta-time = aika

js-adv-mission-timeline = Tehtävän aikajana

js-adv-native-edited-notice = { $why } Tallennettu ajo koskee mukana toimitettua tiedostoa, joten muokattua kopiota ei voi näyttää tässä: aja se komentorivityökalulla tai näytä tallenne painamalla Palauta.

js-adv-native-notice-command = { $why } Näet natiivilla komentorivimoottorilla v{ $version } komennolla { $command } tallennetun ajon, näytettynä muuttamattomana. Se ei aja uudelleen, kun muokkaat.

js-adv-native-notice-plain = { $why } Näet natiivilla komentorivimoottorilla v{ $version } tallennetun ajon, näytettynä muuttamattomana. Se ei aja uudelleen, kun muokkaat.

js-adv-native-notice-platform = { $why } Näet natiivilla komentorivimoottorilla v{ $version } ({ $platform }) tallennetun ajon, näytettynä muuttamattomana. Se ei aja uudelleen, kun muokkaat.

js-adv-native-notice-platform-command = { $why } Näet natiivilla komentorivimoottorilla v{ $version } ({ $platform }) komennolla { $command } tallennetun ajon, näytettynä muuttamattomana. Se ei aja uudelleen, kun muokkaat.

js-adv-needs-live-engine = Tämä vaatii live-moottorin.

js-adv-needs-newer-engine-status = Vaatii uudemman moottorin.

js-adv-nees-line = NEES { $mean } (95 %:n kaista { $low }–{ $high }, tavoite 2.0)

js-adv-newer-engine-edited-notice = Tämä skenaario vaatii moottorin { $need } tai uudemman; täällä toimiva moottori on v{ $version }. Vain mukana toimitetun tiedoston tallenne voidaan näyttää: näytä se painamalla Palauta tai aja muokattu kopio moottorilla { $need }.

js-adv-newer-engine-no-recording = Tämä skenaario vaatii moottorin { $need } tai uudemman; täällä toimiva moottori on v{ $version }. Siitä ei ole tässä tallennetta.

js-adv-newer-engine-shown-commit = Tämä skenaario vaatii moottorin { $need } tai uudemman; täällä toimiva moottori on v{ $version }. Näet ajon, joka on tallennettu moottoriversiolla commitissa { $commit }, näytettynä muuttamattomana; sitä ei ajeta tässä uudelleen.

js-adv-newer-engine-shown-version = Tämä skenaario vaatii moottorin { $need } tai uudemman; täällä toimiva moottori on v{ $version }. Näet ajon, joka on tallennettu moottorilla v{ $recorded }, näytettynä muuttamattomana; sitä ei ajeta tässä uudelleen.

js-adv-nis-line = NIS { $mean } (95 %:n kaista { $low }–{ $high }, tavoite 1.0)

js-adv-no-guided-controls = Tässä skenaariossa ei ole yhtään opastettua säädintä. Käytä kohtaa Kaikki kentät tai muokkaa lähdettä.

js-adv-no-numeric-fields = Tässä ei ole yksittäisiä numeerisia kenttiä säädettäväksi. Muokkaa lähdettä suoraan.

js-adv-no-recorded-run = Tälle skenaariolle ei ole tallennettua ajoa. Se vaatii live-moottorin.

js-adv-no-summary = (tämä skenaario ei julkaise yhden rivin yhteenvetoa)

js-adv-noise-floor = kohinataso { $level }

js-adv-not-in-browser-status = Tämä skenaario ei toimi selaimessa.

js-adv-open-and-run = Avaa ja aja

js-adv-open-at-field = avaa tässä kentässä

js-adv-opened-from-simple = Avattu asetuksilla, joita muutit Yksinkertaisessa näkymässä.

js-adv-optional-preset = valinnainen esiasetus: scenarios/{ $file }

js-adv-orbit-canvas-label = Interaktiivinen 3D-näkymä lasketusta radasta

js-adv-orbit-fallback-alt = Ortografinen näkymä lasketusta radasta

js-adv-orbit-note-epoch = Pyöritä vetämällä, zoomaa vierittämällä tai nipistämällä. Maa mittakaavassa, NASA Blue Marble -kuvamateriaali. Käännetty ajon epookkiin.

js-adv-orbit-note-no-epoch = Pyöritä vetämällä, zoomaa vierittämällä tai nipistämällä. Maa mittakaavassa, NASA Blue Marble -kuvamateriaali. Tämä ajo ei ilmoita epookkia, joten Maan kiertokulma ei ole tässä mielekäs.

js-adv-orbit-static-note = Staattinen näkymä (3D-kirjastoa ei voitu ladata tässä).

js-adv-pal-commands = Komennot

js-adv-pal-domain = Alue: { $name }

js-adv-pal-domains = Alueet

js-adv-pal-field = Kenttä: { $name }

js-adv-pal-fields = Kentät

js-adv-pal-nothing = Ei osumia

js-adv-pal-opens-page = avaa sivun

js-adv-pal-page = Sivu: { $name }

js-adv-pal-pages = Sivut

js-adv-pal-panel = Paneeli: { $name }

js-adv-pal-panels = Paneelit

js-adv-pal-scenarios = Skenaariot

js-adv-params-hint-all = Jokainen yksittäinen luku skenaariossa. Askella sitä, kirjoita se tai käytä nuolinäppäimiä; skenaario ajetaan uudelleen.

js-adv-params-hint-guided = Vedä liukusäädintä, niin skenaario ajetaan uudelleen. Jokainen säädin kirjoittaa suoraan alla olevaan skenaarioon.

js-adv-pin-already = Tämä ajo on jo kiinnitetty.

js-adv-pin-first = Ajo { $run } kiinnitetty. Muuta parametria, aja uudelleen ja kiinnitä myös se ajo.

js-adv-pin-label = { $letter } · { $title } · ajo { $run }

js-adv-pin-opening-compare =
    { $n ->
        [one] { $n } ajo kiinnitetty. Avataan vertailu.
       *[other] { $n } ajoa kiinnitetty. Avataan vertailu.
    }

js-adv-plan-view = Ylänäkymä

js-adv-plan-view-epoch = epookissa { $epoch }

js-adv-plan-view-note = Jokainen piste on kappale ajon epookissa ja jokainen käyrä on rata, jonka moottori laski sille. Katkoviiva on linkki, jota skenaario pyytää. Valitse planeetta nähdäksesi sen kuut sen ympärillä.

js-adv-player-name-mission = tehtävän kertaus

js-adv-player-name-orbit = radan kertaus

js-adv-player-name-replay = kertaus

js-adv-player-name-waterfall = vesiputouksen kertaus

js-adv-player-pause = Keskeytä: { $name }

js-adv-player-play = Toista: { $name }

js-adv-player-position = Kohta: { $name }

js-adv-png-download-title = Korkearesoluutioinen bittikartta dioihin ja asiakirjoihin

js-adv-png-export-failed = PNG-vienti epäonnistui: { $reason }

js-adv-ready-live = Valmis. Toimii paikallisesti selaimessasi.

js-adv-ready-recorded = Valmis. Näytetään tallennettuja ajoja.

js-adv-receiver-at-time = Vastaanotin hetkellä t = { $time }

js-adv-recorded-edit-notice = WebAssembly on estetty tällä sivulla, joten tällä sivulla näytetään mukana toimitettujen skenaarioiden todellisia ajoja, jotka on tallennettu moottorilla v{ $version }. Muokatut skenaariot, pyyhkäisyt ja uudet viennit vaativat live-moottorin: avaa kshana.dev tai tarjoa tämä kansio paikallisesti. Palauta palauttaa tallennetun skenaarion.

js-adv-recorded-edited-warning = Olet muokannut skenaariota: tämä tallenne koskee mukana toimitettua tiedostoa, ei muokkaustasi. Aja komento omalla tiedostollasi saadaksesi omasi.

js-adv-recorded-intro = WebAssembly on estetty tällä sivulla, joten tällä sivulla näytetään mukana toimitettujen skenaarioiden todellisia ajoja, jotka on tallennettu moottorilla v{ $version }. Muokkaus, pyyhkäisyt ja uudet viennit vaativat live-moottorin osoitteessa kshana.dev.

js-adv-recorded-run-native = tallennettu ajo, natiivi moottori

js-adv-recorded-written-by = Kirjoittanut natiivi komentorivimoottori v{ $version } ({ $platform }) komennolla { $command }. Näytetty muuttamattomana.

js-adv-replay = Kertaus

js-adv-report-downloaded = Raportti ladattu.

js-adv-report-frame-title = Moottorin kirjoittama ajoraportti

js-adv-report-html = Raportti (HTML)

js-adv-report-html-title = Raporttitiedosto sellaisena kuin moottori sen kirjoitti

js-adv-report-load-failed = Tallennettua raporttia ei voitu ladata ({ $reason }).

js-adv-report-loading = Ladataan tallennettua raporttia…

js-adv-report-none = Tälle skenaariolle ei ole tallennettua raporttia.

js-adv-report-note = Jokainen komentorivin ajo kirjoittaa raportin: yhteenvedon, syötteet, tulokset, kaavion, sen mikä on validoitu ja mikä mallinnettu, sekä toistettavuustietueen. Selainversio ei sisällä tätä kirjoitinta, joten tämä on raportti, jonka natiivi komentorivimoottori kirjoitti mukana toimitetulle skenaariolle. Studion oma raportti ruudulla olevasta ajosta on kohdassa Viennit.

js-adv-report-open-tab = Avaa uudessa välilehdessä

js-adv-report-open-tab-title = Avaa raportti omana sivunaan

js-adv-report-orbit-title = Rata (Maa-keskinen inertiaalinen, ortografinen)

js-adv-report-stability-chart = Kellon vakaus

js-adv-report-stability-title = Kellon vakaus (Allanin poikkeama)

js-adv-restored-run = Ajo { $run } palautettu.

js-adv-result = Tulos

js-adv-run-cancelled = Ajo peruttu.

js-adv-run-cancelled-previous = Ajo peruttu. Edellinen tulos näkyy yhä.

js-adv-run-failed = Ajo epäonnistui. Katso viesti tuloksista.

js-adv-scenario-copied = Skenaario kopioitu.

js-adv-scenarios-count =
    { $n ->
        [one] { $n } skenaario
       *[other] { $n } skenaariota
    }

js-adv-share-link-copied = Jakolinkki kopioitu. Se sisältää tarkan skenaarion.

js-adv-share-link-in-bar = Linkki sijoitettu osoiteriville.

js-adv-shared-link = jaettu linkki

js-adv-shared-needs-live = Tämä linkki sisältää oman skenaarionsa, joka vaatii live-moottorin. Avaa se osoitteessa kshana.dev.

js-adv-shared-scenario = Jaettu skenaario

js-adv-shared-scenario-question = Jakolinkistä avattu skenaario. Se ajetaan täsmälleen sellaisena kuin se jaettiin.

js-adv-solar-bodies-label = Mitkä kappaleet piirretään

js-adv-spectrum-part-label = Mikä osa spektristä

js-adv-spectrum-row-note = Spektri sen vesiputouksen rivin kohdalta, jolla kertaus on.

js-adv-spectrum-row-title = Spektri näytettävän rivin kohdalta

js-adv-start-field-meta = { $domain } · kenttä { $field }

js-adv-start-fields-hint = Jokainen avaa skenaarion niin, että kyseinen säädin on korostettuna ja valmiina muutettavaksi.

js-adv-start-fields-named =
    { $n ->
        [one] Kentät, joiden nimi muistuttaa hakua ”{ $query }”: { $n } skenaariossa
       *[other] Kentät, joiden nimi muistuttaa hakua ”{ $query }”: { $n } skenaariossa
    }

js-adv-start-more-matches =
    { $n ->
        [one] Vielä { $n } osuma: lisää sana rajataksesi niitä.
       *[other] Vielä { $n } osumaa: lisää sana rajataksesi niitä.
    }

js-adv-start-nothing = Mikään ei vastaa hakua ”{ $query }”. Kokeile sanaa kuten jamming, clock, lunar, orbit, mask tai PDOP.

js-adv-start-scenarios-count = Skenaariot ({ $count })

js-adv-status-fetching-recorded = Moottoria ladataan… Haetaan tämän skenaarion tallennettua tulosta.

js-adv-status-ran-locally = Ajettu paikallisesti kello { $time }, ajo { $run }.

js-adv-status-ran-locally-secs = Ajettu paikallisesti kello { $time }, ajo { $run }, { $secs } s.

js-adv-status-recorded-native = Tallennettu ajo näytetty kello { $time } (natiivi moottori).

js-adv-status-recorded-needs-engine = Tallennettu ajo näytetty kello { $time } (vaatii moottorin { $need }).

js-adv-status-recorded-shown = Tallennettu ajo näytetty kello { $time }, ajo { $run }.

js-adv-status-recorded-shown-secs = Tallennettu ajo näytetty kello { $time }, ajo { $run }, { $secs } s.

js-adv-status-showing-recorded = Moottoria ladataan… Näytetään tämän skenaarion tallennettu tulos, kunnes live-moottori on valmis.

js-adv-subtabs-label = Tämän näkymän laatat (puhelin)

js-adv-suggest-campaign = Kertaa häirintä-, harhautus- ja holdover-tehtävä

js-adv-suggest-coverage = Kartoita neljän GNSS-satelliittitähdistön (maailmanlaajuinen satelliittinavigointijärjestelmä) kattavuus

js-adv-suggest-holdover = Pitoaika, kun GNSS menetetään

js-adv-suggest-waterfall = Seuraa häirintälähetintä L-kaistan vesiputouksessa

js-adv-svg-download-title = Vektorikaavio otsikolla ja alkuperätiedoilla

js-adv-sweep-cancelled = Pyyhkäisy peruttu.

js-adv-sweep-done-grid = Pyyhkäistiin { $total } ajoa ({ $columns } × { $rows }) paikallisesti ajassa { $time }.

js-adv-sweep-done-line = Pyyhkäistiin { $done } / { $total } ajoa paikallisesti ajassa { $time }.

js-adv-sweep-enter-range = Anna numeerinen väli.

js-adv-sweep-enter-range-second = Anna numeerinen väli toiselle parametrille.

js-adv-sweep-failed = Pyyhkäisy epäonnistui: { $reason }

js-adv-sweep-interrupted = Uusi ajo keskeytti pyyhkäisyn.

js-adv-sweep-needs-live = Pyyhkäisy ajaa moottorin monta kertaa, joten se vaatii live-moottorin.

js-adv-sweep-none-line-chart = Ei mitään (viivakaavio)

js-adv-sweep-nothing = Tälle skenaariolle ei ole pyyhkäistävää.

js-adv-sweep-progress = Pyyhkäistään ajoa { $n } / { $total }…

js-adv-sweep-status-done = Pyyhkäistiin { $total } ajoa kello { $time }.

js-adv-sweep-title-grid = { $metric } suureiden { $first } ja { $second } yli

js-adv-sweep-title-line = { $metric } suhteessa suureeseen { $parameter }

js-adv-sweep-wait = Odota, että nykyinen ajo päättyy, ja pyyhkäise sitten.

js-adv-tab-animation = Animaatio

js-adv-tab-compare = Vertailu

js-adv-tab-engine-report = Moottorin raportti

js-adv-tab-exports-report = Viennit ja raportti

js-adv-tab-ground-track = Maarata

js-adv-tab-holdover = Holdover

js-adv-tab-orbit-3d = 3D-rata

js-adv-tab-overview = Yleiskuva

js-adv-tab-signal-band = Signaali ja kaista

js-adv-tab-stability = Vakaus

js-adv-tab-sweep = Pyyhkäisy

js-adv-tab-time-series = Aikasarja

js-adv-tab-timing-masks = Ajoitusmaskit

js-adv-th-at-tau-or-time = Kohdassa τ tai aika

js-adv-th-body = Kappale

js-adv-th-clock = Kello

js-adv-th-distance-sun = Etäisyys Auringosta

js-adv-th-figure = Luku

js-adv-th-file = Tiedosto

js-adv-th-format = Formaatti

js-adv-th-key-figure = Avainluku

js-adv-th-light-time-from = Yhdensuuntainen valoaika kohteesta { $observer }

js-adv-th-light-time-observer = Yhdensuuntainen valoaika havaitsijalta

js-adv-th-limit = Raja

js-adv-th-margin = Marginaali

js-adv-th-mask-or-budget = Maski tai budjetti

js-adv-th-metric = Mittari

js-adv-th-orbital-period = Kiertoaika

js-adv-th-provenance = Alkuperä

js-adv-th-size = Koko

js-adv-th-source = Lähde

js-adv-th-tier = Taso

js-adv-th-unit = Yksikkö

js-adv-th-value = Arvo

js-adv-th-verdict = Tuomio

js-adv-th-what-it-is = Mikä se on

js-adv-the-body = kappale

js-adv-tile-scenario-count =
    { $n ->
        [one] { $n } skenaario
       *[other] { $n } skenaariota
    }

js-adv-timeline-chart-title = Tehtävän aikajana: { $title }

js-adv-timeline-latest-event = Viimeisin tapahtuma, kello { $time }: { $label }

js-adv-timeline-no-event = Tähän mennessä ei ole vielä tapahtumaa.

js-adv-timeline-note = Yksi kelain ohjaa jokaista alla olevaa kaaviota. Jokainen vaihe ajaa tavallisia skenaarioita; kampanja lukee niiden tulosteet yhdelle aikaruudukolle. Varjostetut kaistat ovat vaiheet ja pystyviivat tapahtumat. Yllä olevat arvot ovat kampanjan kanavat kertausajan hetkellä.

js-adv-timeline-on-one-clock = { $duration } yhdellä kellolla

js-adv-timeline-phase = Vaihe: { $phase }

js-adv-tour-back = Takaisin

js-adv-tour-done = Valmis

js-adv-tour-eyebrow = Opastettu kierros

js-adv-tour-headline-body = Yhden rivin yhteenveto, moottorin versio ja skenaarion sormenjälki sekä se, onko kukin luku validoitu vai mallinnettu.

js-adv-tour-headline-title = Lue vastaus

js-adv-tour-keyboard-body = ⌘K löytää minkä tahansa skenaarion, näkymän tai komennon. [ ja ] siirtyvät näkymien välillä.

js-adv-tour-keyboard-title = Kaikki näppäimistöltä

js-adv-tour-library-body = Jokainen mukana toimitettu skenaario ryhmiteltynä tehtäväalueen mukaan: häirintä, spektri, harhautus, kellot, navigointi, eheys, radat, satelliittitähdistön suunnittelu, matalan Maan kiertoradan navigointi, kampanjat, Kuu, Mars ja aurinkokunta. Hae näppäimellä /.

js-adv-tour-library-title = Valitse tehtävä

js-adv-tour-next = Seuraava

js-adv-tour-params-body = Opastetut liukusäätimet yleisimmille säätimille tai jokainen skenaarion numeerinen kenttä. Jokainen muutos ajaa uudelleen.

js-adv-tour-params-title = Säädä sitä

js-adv-tour-pin-body = Kiinnitä jopa neljä ajoa ja näe ne rinnakkain erojen ja erotuskäyrän kanssa.

js-adv-tour-pin-title = Vertaa ajoja

js-adv-tour-run-body = Rust-moottori toimii selaimessasi WebAssemblyna. Mitään ei lähetetä minnekään. ⌘↵ ajaa mistä tahansa.

js-adv-tour-run-title = Aja se paikallisesti

js-adv-tour-share-body = Lataa raportti, tulos, skenaario ja moottorin viennit tai kopioi linkki, joka sisältää tarkan skenaarion, tai iframe kurssisivulle tai wikiin.

js-adv-tour-share-title = Jaa tai vie

js-adv-tour-skip = Ohita

js-adv-tour-source-body = Koko skenaario TOML-muodossa. Se, mitä ajat, on täsmälleen se, minkä voit jakaa ja toistaa.

js-adv-tour-source-title = Tai muokkaa mitä tahansa

js-adv-tour-tabs-body = Näkymät ilmestyvät, kun tulos tukee niitä: signaali ja kaista häirinnälle, vesiputous spektrille, tehtävän aikajana kampanjoille, kattavuuskartat satelliittitähdistöille, holdover kelloille, maskit telealan ajoitukselle, 3D-radat, maaradat, pyyhkäisyt sekä moottorin oma animaatio ja raportti.

js-adv-tour-tabs-title = Ajon jokainen näkymä

js-adv-tracking-threshold-value = Seurantakynnys { $value }

js-adv-transport-label = Kertaus: yksi kelain ohjaa tämän ajon jokaista paneelia

js-adv-transport-sub = yksi kelain ohjaa tämän ajon jokaista paneelia

js-adv-unpin-run = Poista ajon { $run } kiinnitys

js-adv-waterfall = Vesiputous

js-adv-waterfall-note = Väri on teho vastaanottimen kohinatason yläpuolella. Navigointisignaalit ovat tämän tason alla, joten valaistuvat häirintälähettimet. Toista kertaus tai vedä sitä, niin oikealla olevat kaistat näyttävät, mitä vastaanotin seuraa yhä sillä hetkellä.

js-adv-waterfall-sub = tehotiheysspektri: taajuus vaakasuunnassa, aika alaspäin

js-adv-waterfall-title = Vesiputous, { $name }

js-adv-webassembly-unavailable = WebAssembly ei ole käytettävissä

js-app-all-questions = Kaikki kysymykset

js-app-anim-frame-title = Tämän ajon animaatio, moottorin kirjoittama

js-app-anim-html-player = HTML-soitin

js-app-anim-html-player-title = Yhden tiedoston soitin sellaisena kuin moottori sen kirjoitti

js-app-anim-load-failed = Tallennettua animaatiota ei voitu ladata ({ $reason }).

js-app-anim-loading = Ladataan tallennettua animaatiota…

js-app-anim-none = Tälle skenaariolle ei ole tallennettua animaatiota.

js-app-anim-note = Moottori kirjoittaa animaation jokaisesta ajosta, jolla on aika-akseli: itsestään toistuvan SVG:n ja yhden tiedoston HTML-soittimen, jossa on omat toisto- ja kelausohjaimet. Selainversio ei sisällä tätä kirjoitinta, joten tämä on tiedosto, jonka natiivi komentorivimoottori kirjoitti mukana toimitetulle skenaariolle.

js-app-anim-svg = Animoitu SVG

js-app-anim-svg-title = Itsestään toistuva SVG sellaisena kuin moottori sen kirjoitti

js-app-axis-averaging-time = keskiarvoistusaika τ (s)

js-app-axis-observation-interval = havaintoväli τ (s)

js-app-axis-value = arvo

js-app-badge-modelled = { $n } mallinnettu

js-app-badge-recorded = Tallennettu

js-app-badge-validated = { $n } validoitu

js-app-band-carrier = Kantoaalto

js-app-band-carrier-unset = ei asetettu tässä skenaariossa

js-app-band-chip-rate = Chip-nopeus

js-app-band-jammer-bandwidth = Häirintälähettimen kaistanleveys

js-app-band-jammer-mhz = häirintälähetin { $mhz } MHz

js-app-band-jammer-power = Häirintälähettimen teho

js-app-band-jammer-type = Häirintälähettimen tyyppi

js-app-band-main-lobe = signaalin pääkeila

js-app-band-no-carrier-note = Moottori laskee häirintälähettimen ja signaalin suhteen linkkibudjetista. Tämä skenaario ei nimeä kantoaaltotaajuutta, joten spektriä ei piirretä.

js-app-band-satellites = Satelliitit

js-app-band-svg-label = Signaali- ja häirintäkaistat kantoaallon ympärillä

js-app-band-tracking-threshold = Seurantakynnys

js-app-browse-all-title =
    { $n ->
        [one] Kaikki { $n } skenaario
       *[other] Kaikki { $n } skenaariota
    }

js-app-browse-area-kicker =
    { $n ->
        [one] Alue · { $n } skenaario
       *[other] Alue · { $n } skenaariota
    }

js-app-browse-area-lede = Valitse yksi: se avautuu heti tulokseensa.

js-app-browse-evidence = Moottorin menetelmillä, joita sen skenaariot ajavat, on varmennusmatriisissa { $validated } validoitua ja { $modelled } mallinnettua riviä.

js-app-browse-evidence-title = Tämän alueen taustalla oleva näyttö.

js-app-browse-kicker = Selaa

js-app-browse-lede = Hae tai valitse alue. Jokainen skenaario avautuu heti tulokseensa.

js-app-browse-validated-examples = Validoitu, esimerkiksi: { $examples }.

js-app-browser-cannot-run = Selainversio ei voi ajaa tätä skenaariota.

js-app-btn-all-exports = Kaikki viennit

js-app-btn-all-exports-title = Tämän ajon kaikki viennit, moottorin omat formaatit mukaan lukien

js-app-btn-compare-pinned = Vertaa kiinnitettyjä ajoja

js-app-btn-copy-embed = Kopioi upotuskoodi

js-app-btn-copy-link = Kopioi linkki juuri tähän skenaarioon

js-app-btn-figure-png = Kuva (PNG)

js-app-btn-figure-png-title = Ruudulla oleva kaavio korkearesoluutioisena bittikarttana

js-app-btn-figure-svg = Kuva (SVG)

js-app-btn-figure-svg-title = Ruudulla oleva kaavio otsikon, moottorin version ja DOI:n kanssa

js-app-btn-pin-compare = Kiinnitä tämä ajo vertailua varten

js-app-btn-pin-count = Kiinnitä tämä ajo ({ $n } kiinnitetty)

js-app-btn-report-html = Toistettava raportti (HTML)

js-app-btn-report-html-title = Yksi offline-tiedosto: yhteenveto, luvut tasoineen, kaaviot ja tarkka skenaario

js-app-btn-result-json = Tulosdata (JSON)

js-app-btn-result-json-title = Moottorin täydellinen tuloste tälle ajolle

js-app-btn-run-history = Ajohistoria

js-app-btn-scenario-toml = Skenaariotiedosto (TOML)

js-app-btn-scenario-toml-title = Tämän ajon tarkka syöte

js-app-btn-table-csv = Taulukko (CSV)

js-app-btn-table-csv-title = Samat tavut, jotka komentorivityökalu kirjoittaa nimellä { $file }

js-app-bytes =
    { $n ->
        [one] { $n } tavu
       *[other] { $n } tavua
    }

js-app-cap-sub = { $areas ->
        [one] { $areas } alue
       *[other] { $areas } aluetta
    }, { $total ->
        [one] { $total } ajovalmis skenaario
       *[other] { $total } ajovalmista skenaariota
    }. Jokainen alue näyttää todellisen tallennetun tuloksen ja sen taustalla olevan todisteiden jakauman: sen moottorimenetelmien osuuden, jotka on validoitu ulkoista vertailua vastaan.

js-app-chain-hint = jokaisen vaiheen tuloste syöttää seuraavaa

js-app-chain-note = Yksi järjestelmä seurattuna moottorin jokaisen vaiheen läpi. Alla oleva taulukko luettelee jokaisen luvun, jonka vaihe laski ja seuraava vaihe käytti.

js-app-chain-stage = Vaihe { $n }

js-app-chain-values-handed =
    { $n ->
        [one] { $n } arvo välitetty eteenpäin
       *[other] { $n } arvoa välitetty eteenpäin
    }

js-app-chart-allan-deviation = Allanin poikkeama

js-app-chart-cn0-by-satellite = Tehollinen C/N0 satelliitin mukaan

js-app-chart-default-title = Kshana-kaavio

js-app-chart-ground-track = Maarata

js-app-chart-holdover-title = Holdover suhteessa ajoitusbudjettiin

js-app-chart-mtie-title = MTIE (suurin aikavälivirhe)

js-app-chart-not-drawn = Tätä kaaviota ei voitu piirtää.

js-app-chart-scenario-hash = skenaario { $hash }

js-app-chart-stability-title = Kellon vakaus (limittäinen Allanin poikkeama)

js-app-chart-tdev-title = TDEV (aikapoikkeama)

js-app-chip-failed-title = WebAssembly ei käynnistynyt tässä. Näytetään mukana toimitettujen skenaarioiden todellisia tallennettuja ajoja.

js-app-chip-failed-title-reason = WebAssembly ei käynnistynyt tässä ({ $reason }). Näytetään mukana toimitettujen skenaarioiden todellisia tallennettuja ajoja.

js-app-chip-live = Live-moottori · v{ $version }

js-app-chip-live-title = Kshana-moottori toimii tässä selaimessa WebAssemblyna

js-app-chip-loading = Moottoria ladataan

js-app-chip-loading-title = Moottoria ladataan. Sillä välin näytetään tallennettuja tuloksia.

js-app-chip-recorded = Tallennetut ajot · v{ $version }

js-app-chip-unavailable = Moottori ei ole käytettävissä

js-app-cli-note = Asenna komennolla { $command }. Ajo kirjoittaa tiedoston { $file }, kaavion ja raportin.

js-app-cli-only-title = Tämä toimii komentorivillä, ei selaimessa.

js-app-cli-save-comment = # tallenna alla oleva skenaariotiedosto nimellä { $file }, sitten

js-app-cmd-advanced = Näytä kaikki asetukset (lisäasetukset)

js-app-cmd-browse = Selaa kaikkia skenaarioita

js-app-cmd-compare = Vertaa kiinnitettyjä ajoja

js-app-cmd-embed = Kopioi upotuskoodi

js-app-cmd-exports = Lataa tulokset (viennit)

js-app-cmd-history = Avaa ajohistoria

js-app-cmd-home = Siirry avausnäyttöön

js-app-cmd-how = Miten tämä lasketaan

js-app-cmd-pin = Kiinnitä tämä ajo vertailua varten

js-app-cmd-report = Lataa raportti

js-app-cmd-research = Koodi, data ja viittaus (tutkijoille)

js-app-cmd-reset = Palauta skenaarion teksti

js-app-cmd-run = Aja skenaario

js-app-cmd-share = Kopioi jakolinkki

js-app-cmd-theme = Vaihda vaalean ja tumman teeman välillä

js-app-cmd-tour = Aloita opastettu kierros

js-app-compare-deltas = Erot ovat suhteessa ajoon A. Vihreä merkitsee kunkin luvun parempaa arvoa.

js-app-compare-none = Näillä ajoilla ei ole vertailukelpoisia ansioarvoja. Kiinnitä saman skenaarioperheen ajoja nähdäksesi luvut ja erot.

js-app-compare-pin-two = Kiinnitä vähintään kaksi ajoa verrataksesi niitä vierekkäin. Kiinnitä ajo, muuta parametria tai valitse toinen saman perheen skenaario, aja se ja kiinnitä uudelleen.

js-app-compare-run-head = { $letter } · ajo { $id }

js-app-coverage-cell-note = Jokainen solu on yksi ruudukkopiste kohteessa { $body }, pisteytettynä ajon jokaisella epookilla.

js-app-coverage-dots-of = /

js-app-coverage-dots-post = satelliittia, lennätettyinä maaratoja pitkin; toista kertaus liikuttaaksesi niitä.

js-app-coverage-dots-pre = Pisteet ovat

js-app-coverage-field-label = Kartoitettava kenttä

js-app-coverage-map = Kattavuuskartta

js-app-coverage-map-select = Kartta

js-app-coverage-over = kohteessa

js-app-coverage-title = { $field } kohteen { $body } yllä

js-app-crumb-all-scenarios = Kaikki skenaariot

js-app-crumb-area = Alue

js-app-crumb-search = Haku: { $query }

js-app-crumb-studio = Studio

js-app-download-label = Lataa

js-app-edited-cli-only = Muokattu: tämä skenaario toimii vain komentorivimoottorissa.

js-app-edited-needs-engine = Muokattu: vaatii moottorin { $need }.

js-app-edited-needs-live = Muokatut skenaariot vaativat live-moottorin.

js-app-embed-copied = Upotuskoodi kopioitu.

js-app-engine-chart = Moottorin kaavio

js-app-engine-chart-alt = Moottorin kaavio tälle ajolle

js-app-engine-could-not-start = Moottori ei käynnistynyt: { $reason }. Tarjoa tämä kansio HTTP:n kautta (esimerkiksi { $command }) sen sijaan, että avaisit tiedoston suoraan.

js-app-engine-failed = Moottoria ei voitu ladata ({ $reason }).

js-app-engine-file-http = Moottoritiedosto palautti HTTP { $status }.

js-app-engine-no-recordings = Moottoria ei voitu ladata ({ $reason }) eikä tallennettuja ajoja löytynyt.

js-app-entries-count =
    { $n ->
        [one] { $n } merkintä
       *[other] { $n } merkintää
    }

js-app-ev-aria = { $validated } validoitua ja { $modelled } mallinnettua varmennusmatriisin riviä

js-app-ev-title = { $validated } validoitua · { $modelled } mallinnettua riviä varmennusmatriisissa

js-app-ev-validated = validoitu

js-app-export-card-title = { $format }-vienti

js-app-export-checking = Tarkistetaan, mihin efemeridiformaatteihin tämä ajo voidaan viedä…

js-app-export-csv-desc = Samat tavut, jotka komentorivityökalu kirjoittaa nimellä { $file }.

js-app-export-csv-title = Toistettavuustaulukko

js-app-export-engine-loading = Efemeridiviennit näkyvät tässä, kun moottori on latautunut.

js-app-export-json-desc = Moottorin täydellinen tuloste tälle ajolle, yksiköt ja alkuperätiedot mukaan lukien.

js-app-export-json-title = Täydellinen tulosasiakirja

js-app-export-not-recorded = Tämä vienti on suuri, joten sitä ei tallennettu. Se vaatii live-moottorin.

js-app-export-oem-desc = CCSDS OEM 2.0 (Orbit Ephemeris Message) GMATille, Orekitille tai STK:lle

js-app-export-omm-desc = CCSDS OMM (Orbit Mean-elements Message) -luettelo

js-app-export-report-desc = Yksi offline-tiedosto: yhteenveto, luvut tasoineen, jokainen kaavio ja tarkka skenaarioteksti, leimattuna moottorin versiolla ja skenaarion tiivisteellä.

js-app-export-report-title = Toistettava raportti

js-app-export-sp3-desc = Tämän satelliittitähdistön SP3-c-tarkkaefemeridi

js-app-export-toml-desc = Tämän ajon tarkka syöte. Aja se uudelleen missä tahansa komentorivityökalulla tai Python- ja npm-paketeilla.

js-app-export-toml-title = Skenaariotiedosto

js-app-export-too-large = { $desc }. Liian suuri tallennettavaksi: vaatii live-moottorin.

js-app-fields-more = { $n } lisää

js-app-fields-none = ei yhtään

js-app-fields-none-hint = Tässä ei ole muita yksittäisiä lukuja muutettavaksi. Muokkaa tiedostoa kohdassa ”Tutkijoille”.

js-app-fields-top-of-file = tiedoston alku

js-app-find-matches =
    { $n ->
        [one] { $n } opastettu säädin ja { $m } / { $total } kenttää vastaa hakua ”{ $query }”.
       *[other] { $n } opastettua säädintä ja { $m } / { $total } kenttää vastaa hakua ”{ $query }”.
    }

js-app-find-none = Mikään tämän skenaarion kenttä ei vastaa hakua ”{ $query }”. Hae kaikista skenaarioista kirjastohaulla.

js-app-geo-sub = { $name } · { $features } / { $total } kohdetta piirretty · tallennettu natiivilla moottorilla

js-app-geojson-title = GeoJSON-vienti: { $name }

js-app-gt-highlighted = Korostettu: satelliitti näkyy asemalta.

js-app-gt-peak-doppler = Suurin Doppler { $value } Hz.

js-app-gt-peak-elevation = Korkein korkeuskulma { $value }°.

js-app-health-check-tuning = tarkista viritys

js-app-health-consistent = johdonmukainen

js-app-health-nees-band = NEES { $mean } (95 %:n kaista { $lo }–{ $hi }, tavoite 2.0)

js-app-health-nis-band = NIS { $mean } (95 %:n kaista { $lo }–{ $hi }, tavoite 1.0)

js-app-heat-map-label = Lämpökartta: { $metric }

js-app-hero-clock = { $elapsed } / { $total }

js-app-hero-mask = { $deg }° korkeuskulmamaski

js-app-hero-places =
    { $n ->
        [one] { $n } paikka
       *[other] { $n } paikkaa
    }

js-app-hero-positions-only = Vain satelliittien paikat: ei signaalitehoa, satelliittien terveyttä eikä maastoa.

js-app-hero-ramp = { $field }: { $lo }–{ $hi }

js-app-hero-ramp-over = { $field }: { $lo }–{ $hi }, { $duration } aikana

js-app-hero-recorded-bare = Tallennettu tulos

js-app-hero-satellites =
    { $n ->
        [one] { $n } satelliitti
       *[other] { $n } satelliittia
    }

js-app-hero-steps =
    { $n ->
        [one] { $n } aika-askel
       *[other] { $n } aika-askelta
    }

js-app-hist-runs =
    { $n ->
        [one] { $n } ajo.
       *[other] { $n } ajoa.
    }

js-app-history-pin = Kiinnitä

js-app-history-restore = Palauta

js-app-history-restored = Ajo { $id } palautettu.

js-app-history-run = ajo { $id } · { $time }

js-app-hit-in-scenario = kohteessa { $title }

js-app-hit-native-note = tallennettu ajo, natiivi moottori

js-app-hit-setting-meta = { $area } · asetus { $name }

js-app-ho-budget = budjetti

js-app-ho-engine-budget = Moottorin holdover skenaarion budjetilla ({ $budget } { $unit }): { $duration }

js-app-ho-engine-budget-bare = Moottorin holdover skenaarion budjetilla: { $duration }

js-app-ho-error-after-loss = virhe sen jälkeen, kun GNSS menetettiin hetkellä t = { $t } s

js-app-ho-error-since-fix = virhe viimeisestä paikkaratkaisusta

js-app-ho-stays-inside = pysyy tämän budjetin sisällä koko tallenteen ajan

js-app-ho-until-breached = kunnes budjetti ylittyy

js-app-hover-classical = klassinen

js-app-hover-quantum = kvantti

js-app-how-checks = (tarkistaa: { $requirement })

js-app-how-matrix = Moottorin menetelmillä, joita tämä skenaario ajaa, on varmennusmatriisissa { $validated } validoitua ja { $modelled } mallinnettua riviä:

js-app-how-matrix-partner = Moottorin menetelmillä, joita tämä skenaario ajaa, on varmennusmatriisissa { $validated } validoitua ja { $modelled } mallinnettua riviä sekä { $partner } kumppanien omistamaa riviä:

js-app-how-mix-chip = { $validated } validoitua · { $modelled } mallinnettua

js-app-how-more-notes =
    { $n ->
        [one] { $n } lisähuomautus skenaariotiedostosta
       *[other] { $n } lisähuomautusta skenaariotiedostosta
    }

js-app-how-more-rows =
    { $n ->
        [one] Vielä { $n } rivi varmennusmatriisissa (sivuston Todisteet-sivu).
       *[other] Vielä { $n } riviä varmennusmatriisissa (sivuston Todisteet-sivu).
    }

js-app-how-no-header = Tässä skenaariotiedostossa ei ole otsikkohuomautusta. Alla oleva moottorin yhteenveto kertoo, mitä ajettiin.

js-app-how-no-matrix-row = Yksikään varmennusmatriisin rivi ei vielä nimeä tämän skenaarion moottorilajia.

js-app-how-no-sources = Skenaariotiedosto ei viittaa mihinkään lähteeseen, eikä mikään validoitu matriisin rivi kata sen lajia.

js-app-how-own-label = Tämän ajon oma nimike: { $label }

js-app-how-per-figure = Luvuittain, moottorin figure_tiers-lohkosta: { $validated } validoitua, { $modelled } mallinnettua. Kunkin luvun taso näkyy Yleiskuva-näkymässä.

js-app-install-copy = Kopioi: { $command }

js-app-install-label = Asenna v{ $version }

js-app-interop-no-file = Moottori ei kirjoittanut tämän formaatin tiedostoa tälle ajolle.

js-app-interop-not-apply = Ei koske tätä skenaariota: { $reason }.

js-app-interop-not-bundled = Ei mukana tässä (koko): yllä oleva komento kirjoittaa sen.

js-app-interop-note = Moottori kirjoittaa ajon geometrian ja signaalinäytteet formaatteihin, joita muut työkalut avaavat: CZML Cesiumille, KML (Keyhole Markup Language) Google Earthille, GeoJSON kartoille, STK-efemeridi (.e) -tiedostot ja SigMF (Signal Metadata Format) -tallenteet. Selainversio ei sisällä näitä kirjoittimia, joten alla olevat tiedostot ovat ne, jotka natiivi komentorivimoottori kirjoitti mukana toimitetulle skenaariolle.

js-app-job-running = Ajetaan

js-app-job-sweeping = Pyyhkäistään

js-app-js-range-label = J/S-alue

js-app-js-range-value = { $lo }–{ $hi } dB

js-app-latest-event-at = Viimeisin tapahtuma, kello

js-app-legend-all = moottorin ominaisuutta on validoitu koko varmennusmatriisissa; { $modelled } on mallinnettu ja { $partner } on kumppanien omistamia.

js-app-legend-count = { $validated } / { $total }

js-app-load-failed = Tiedostoa { $file } ei voitu ladata.

js-app-mask-envelope = Holdover-aikavirheen verhokäyrä ({ $source })

js-app-mask-exceeded-after = ylitetty ajan { $duration } jälkeen

js-app-mask-limit = raja { $value } ns

js-app-mask-not-exceeded = ei ylitetty

js-app-meta-engine = moottori

js-app-meta-file = tiedosto

js-app-meta-scenario = skenaario

js-app-meta-seed = siemenluku

js-app-meta-shared-link = jaettu linkki

js-app-meta-time = aika

js-app-mission-timeline = Tehtävän aikajana

js-app-native-edited-notice = Tallennettu ajo koskee mukana toimitettua tiedostoa, joten muokattua kopiota ei voi näyttää tässä: aja se komentorivityökalulla tai näytä tallenne painamalla Palauta.

js-app-native-recorded = Näet natiivilla komentorivimoottorilla v{ $version } tallennetun ajon, näytettynä muuttamattomana. Se ei aja uudelleen, kun muokkaat.

js-app-native-recorded-c = Näet natiivilla komentorivimoottorilla v{ $version } komennolla { $command } tallennetun ajon, näytettynä muuttamattomana. Se ei aja uudelleen, kun muokkaat.

js-app-native-recorded-p = Näet natiivilla komentorivimoottorilla v{ $version } ({ $platform }) tallennetun ajon, näytettynä muuttamattomana. Se ei aja uudelleen, kun muokkaat.

js-app-native-recorded-pc = Näet natiivilla komentorivimoottorilla v{ $version } ({ $platform }) komennolla { $command } tallennetun ajon, näytettynä muuttamattomana. Se ei aja uudelleen, kun muokkaat.

js-app-needs-live-engine = Tämä vaatii live-moottorin.

js-app-needs-newer-engine = Vaatii uudemman moottorin.

js-app-needs-newer-why = Tämä skenaario vaatii moottorin { $need } tai uudemman; täällä toimiva moottori on v{ $version }.

js-app-no-chart-export = Tässä näkymässä ei ole vietävää kaaviota.

js-app-no-event-yet = Tähän mennessä ei ole vielä tapahtumaa.

js-app-no-recorded-run = Tälle skenaariolle ei ole tallennettua ajoa. Se vaatii live-moottorin.

js-app-no-recording-here = Siitä ei ole tässä tallennetta.

js-app-no-summary = (tämä skenaario ei julkaise yhden rivin yhteenvetoa)

js-app-noise-floor = kohinataso { $value }

js-app-not-in-browser = Tämä skenaario ei toimi selaimessa.

js-app-notice-shared-needs-live = Tämä linkki sisältää oman skenaarionsa, joka vaatii live-moottorin. Avaa se osoitteessa kshana.dev.

js-app-on-one-clock = yhdellä kellolla

js-app-only-bundled-recording = Vain mukana toimitetun tiedoston tallenne voidaan näyttää: näytä se painamalla Palauta tai aja muokattu kopio moottorilla { $need }.

js-app-opening-result = Avataan tulosta…

js-app-orbit-canvas-label = Interaktiivinen 3D-näkymä lasketusta radasta

js-app-orbit-epoch-set = Käännetty ajon epookkiin.

js-app-orbit-epoch-unset = Tämä ajo ei ilmoita epookkia, joten Maan kiertokulma ei ole tässä mielekäs.

js-app-orbit-img-alt = Ortografinen näkymä lasketusta radasta

js-app-orbit-note = Pyöritä vetämällä, zoomaa vierittämällä tai nipistämällä. Maa mittakaavassa, NASA Blue Marble -kuvamateriaali.

js-app-orbit-static = Staattinen näkymä (3D-kirjastoa ei voitu ladata tässä).

js-app-overlay-note = Yhtenäiset viivat ovat ajo A ja katkoviivat ajo B, samoilla akseleilla.

js-app-overlay-pinned = Kiinnitettyjen ajojen päällekkäiskuva

js-app-overlay-title = { $title }: ajo { $a } (A) verrattuna ajoon { $b } (B)

js-app-overlay-with-diff = Päällekkäiskuva ja erotus B − A

js-app-pal-area = Alue: { $label }

js-app-pal-nothing = Ei osumia

js-app-pal-scenario-count =
    { $n ->
        [one] { $n } skenaario
       *[other] { $n } skenaariota
    }

js-app-pal-sec-areas = Alueet

js-app-pal-sec-commands = Komennot

js-app-pal-sec-scenarios = Skenaariot

js-app-pal-sec-settings = Asetukset

js-app-pal-sec-views = Näkymät

js-app-pal-setting = Asetus: { $label }

js-app-pal-view = Näkymä: { $label }

js-app-panel-close = Sulje

js-app-panel-close-full = Sulje koko näyttö

js-app-panel-expand = Laajenna

js-app-panel-expand-full = Laajenna tämä paneeli koko näytölle

js-app-panel-expand-title = Näytä tämä paneeli koko näytöllä (Escape sulkee sen)

js-app-params-hint = Muuta arvoa ja aja sitten uudelleen. Vastaus ja kaavio päivittyvät paikallaan.

js-app-phase = Vaihe:

js-app-pin-already = Tämä ajo on jo kiinnitetty.

js-app-pin-compare =
    { $n ->
        [one] { $n } ajo kiinnitetty. Avataan vertailu.
       *[other] { $n } ajoa kiinnitetty. Avataan vertailu.
    }

js-app-pin-first = Ajo { $id } kiinnitetty. Muuta parametria, aja uudelleen ja kiinnitä myös se ajo.

js-app-pin-label = { $letter } · { $title } · ajo { $id }

js-app-plan-view = Ylänäkymä

js-app-plan-view-at = epookissa

js-app-player-pause = Keskeytä kertaus

js-app-player-pause-mission = Keskeytä tehtävän kertaus

js-app-player-pause-orbit = Keskeytä radan kertaus

js-app-player-pause-waterfall = Keskeytä vesiputouksen kertaus

js-app-player-play = Toista kertaus

js-app-player-play-mission = Toista tehtävän kertaus

js-app-player-play-orbit = Toista radan kertaus

js-app-player-play-waterfall = Toista vesiputouksen kertaus

js-app-player-position = Kohta kertauksessa

js-app-player-position-mission = Kohta tehtävän kertauksessa

js-app-player-position-orbit = Kohta radan kertauksessa

js-app-player-position-waterfall = Kohta vesiputouksen kertauksessa

js-app-png-button-title = Korkearesoluutioinen bittikartta dioihin ja asiakirjoihin

js-app-png-export-failed = PNG-vienti epäonnistui: { $reason }

js-app-py-note = Asenna komennolla { $command }.

js-app-ran-locally = Ajettu paikallisesti kello { $time }, ajo { $n }.

js-app-ran-locally-took = Ajettu paikallisesti kello { $time }, ajo { $n }, { $took } s.

js-app-receiver-at = Vastaanotin hetkellä t =

js-app-recorded-edit-notice = WebAssembly on estetty tällä sivulla, joten tällä sivulla näytetään mukana toimitettujen skenaarioiden todellisia ajoja, jotka on tallennettu moottorilla v{ $version }. Muokatut skenaariot, pyyhkäisyt ja uudet viennit vaativat live-moottorin: avaa kshana.dev tai tarjoa tämä kansio paikallisesti. Palauta palauttaa tallennetun skenaarion.

js-app-recorded-intro = WebAssembly on estetty tällä sivulla, joten tällä sivulla näytetään mukana toimitettujen skenaarioiden todellisia ajoja, jotka on tallennettu moottorilla v{ $version }. Muokkaus, pyyhkäisyt ja uudet viennit vaativat live-moottorin osoitteessa kshana.dev.

js-app-recorded-shown-native = Tallennettu ajo näytetty kello { $time } (natiivi moottori).

js-app-recorded-shown-needs = Tallennettu ajo näytetty kello { $time } (vaatii moottorin { $need }).

js-app-recorded-shown-run = Tallennettu ajo näytetty kello { $time }, ajo { $n }.

js-app-recorded-shown-took = Tallennettu ajo näytetty kello { $time }, ajo { $n }, { $took } s.

js-app-recorded-with-commit = Näet ajon, joka on tallennettu moottoriversiolla commitissa { $commit }, näytettynä muuttamattomana; sitä ei ajeta tässä uudelleen.

js-app-recorded-with-engine = Näet ajon, joka on tallennettu moottorilla v{ $version }, näytettynä muuttamattomana; sitä ei ajeta tässä uudelleen.

js-app-recording-edited-warning = Olet muokannut skenaariota: tämä tallenne koskee mukana toimitettua tiedostoa, ei muokkaustasi. Aja komento omalla tiedostollasi saadaksesi omasi.

js-app-replay = Kertaus

js-app-report-downloaded = Raportti ladattu.

js-app-report-frame-title = Moottorin kirjoittama ajoraportti

js-app-report-html = Raportti (HTML)

js-app-report-html-title = Raporttitiedosto sellaisena kuin moottori sen kirjoitti

js-app-report-load-failed = Tallennettua raporttia ei voitu ladata ({ $reason }).

js-app-report-loading = Ladataan tallennettua raporttia…

js-app-report-none = Tälle skenaariolle ei ole tallennettua raporttia.

js-app-report-note = Jokainen komentorivin ajo kirjoittaa raportin: yhteenvedon, syötteet, tulokset, kaavion, sen mikä on validoitu ja mikä mallinnettu, sekä toistettavuustietueen. Selainversio ei sisällä tätä kirjoitinta, joten tämä on raportti, jonka natiivi komentorivimoottori kirjoitti mukana toimitetulle skenaariolle. Studion oma raportti ruudulla olevasta ajosta on kohdassa Viennit.

js-app-report-open-tab = Avaa uudessa välilehdessä

js-app-report-open-tab-title = Avaa raportti omana sivunaan

js-app-report-orbit-title = Rata (Maa-keskinen inertiaalinen, ortografinen)

js-app-report-stability-short = Kellon vakaus

js-app-report-stability-title = Kellon vakaus (Allanin poikkeama)

js-app-run-again = Aja uudelleen

js-app-run-cancelled = Ajo peruttu.

js-app-run-cancelled-previous = Ajo peruttu. Edellinen tulos näkyy yhä.

js-app-run-failed = Ajo epäonnistui. Katso viesti tuloksista.

js-app-run-when-ready = Aja, kun moottori on valmis

js-app-run-will-run = Ajetaan, kun moottori on valmis

js-app-run-with-settings = Aja näillä asetuksilla

js-app-search-more-matches =
    { $n ->
        [one] Vielä { $n } osuma: lisää sana rajataksesi niitä.
       *[other] Vielä { $n } osumaa: lisää sana rajataksesi niitä.
    }

js-app-search-nothing = Mikään ei vastaa hakua ”{ $query }”. Kokeile sanaa kuten jamming, clock, lunar, orbit, mask tai PDOP.

js-app-search-scenarios = Skenaariot ({ $n })

js-app-search-settings =
    { $n ->
        [one] Asetukset, joiden nimi muistuttaa hakua ”{ $query }”: { $n } skenaariossa
       *[other] Asetukset, joiden nimi muistuttaa hakua ”{ $query }”: { $n } skenaariossa
    }

js-app-search-settings-hint = Jokainen avaa skenaarion niin, että kyseinen asetus on korostettuna ja valmiina muutettavaksi.

js-app-share-copied = Jakolinkki kopioitu. Se sisältää tarkan skenaarion.

js-app-share-in-address-bar = Linkki sijoitettu osoiteriville.

js-app-share-link-sub = Se ajetaan täsmälleen sellaisena kuin se jaettiin.

js-app-share-link-title = Jakolinkistä avattu skenaario

js-app-shared-scenario = Jaettu skenaario

js-app-shown-unchanged = Näytetty muuttamattomana.

js-app-solar-note = Jokainen piste on kappale ajon epookissa ja jokainen käyrä on rata, jonka moottori laski sille. Katkoviiva on linkki, jota skenaario pyytää. Valitse planeetta nähdäksesi sen kuut sen ympärillä.

js-app-solar-which-bodies = Mitkä kappaleet piirretään

js-app-source-live = Live-tulos · moottori v{ $version }

js-app-source-native = Tallennettu tulos, natiivi moottori · v{ $version }

js-app-source-recorded = Tallennettu tulos · v{ $version }

js-app-source-recorded-loading = Tallennettu tulos · v{ $version } · moottoria ladataan

js-app-spectrum-row-note = Spektri sen vesiputouksen rivin kohdalta, jolla kertaus on.

js-app-spectrum-row-title = Spektri näytettävän rivin kohdalta

js-app-spectrum-which-part = Mikä osa spektristä

js-app-status-last-run-took = Viimeisin ajo kesti { $ms } ms selaimessasi. Mitään ei lähetetä minnekään.

js-app-status-loading-kept = Moottoria ladataan yhä. Muutoksesi säilytetään ja ajetaan heti, kun moottori on valmis.

js-app-status-loading-recorded = Moottoria ladataan yhä. Yllä oleva tulos on tallennettu ajo.

js-app-status-not-run-yet = Muutoksiasi ei ole vielä ajettu.

js-app-status-runs-in-browser = Toimii selaimessasi. Mitään ei lähetetä minnekään.

js-app-status-wasm-blocked = WebAssembly on estetty tässä, joten tämä näyttää mukana toimitettujen skenaarioiden tallennettuja ajoja.

js-app-stepper-decrease = Pienennä: { $key }

js-app-stepper-increase = Suurenna: { $key }

js-app-subtabs-label = Tämän näkymän laatat (puhelin)

js-app-svg-button-title = Vektorikaavio otsikolla ja alkuperätiedoilla

js-app-sweep-cancelled = Pyyhkäisy peruttu.

js-app-sweep-done-1d = Pyyhkäistiin { $done } / { $total } ajoa paikallisesti ajassa { $duration }.

js-app-sweep-done-2d = Pyyhkäistiin { $total } ajoa ({ $a } × { $b }) paikallisesti ajassa { $duration }.

js-app-sweep-enter-range = Anna numeerinen väli.

js-app-sweep-enter-range-2 = Anna numeerinen väli toiselle parametrille.

js-app-sweep-failed = Pyyhkäisy epäonnistui: { $reason }

js-app-sweep-interrupted = Uusi ajo keskeytti pyyhkäisyn.

js-app-sweep-needs-live = Pyyhkäisy ajaa moottorin monta kertaa, joten se vaatii live-moottorin.

js-app-sweep-none-line = Ei mitään (viivakaavio)

js-app-sweep-nothing = Tälle skenaariolle ei ole pyyhkäistävää.

js-app-sweep-progress = Pyyhkäistään ajoa { $n } / { $total }…

js-app-sweep-status-done = Pyyhkäistiin { $total } ajoa kello { $time }.

js-app-sweep-title-1d = { $metric } suhteessa suureeseen { $knob }

js-app-sweep-title-2d = { $metric } suureiden { $knob1 } ja { $knob2 } yli

js-app-sweep-wait = Odota, että nykyinen ajo päättyy, ja pyyhkäise sitten.

js-app-tab-animation = Animaatio

js-app-tab-compare = Vertailu

js-app-tab-exports = Viennit ja raportti

js-app-tab-ground = Maarata

js-app-tab-holdover = Holdover

js-app-tab-json = JSON

js-app-tab-masks = Ajoitusmaskit

js-app-tab-orbit = 3D-rata

js-app-tab-overview = Yleiskuva

js-app-tab-report = Moottorin raportti

js-app-tab-signal = Signaali ja kaista

js-app-tab-stability = Vakaus

js-app-tab-sweep = Pyyhkäisy

js-app-tab-timeseries = Aikasarja

js-app-th-at-tau = Kohdassa τ tai aika

js-app-th-body = Kappale

js-app-th-clock = Kello

js-app-th-figure = Luku

js-app-th-file = Tiedosto

js-app-th-format = Formaatti

js-app-th-key-figure = Avainluku

js-app-th-light-time = Yhdensuuntainen valoaika kohteesta { $observer }

js-app-th-limit = Raja

js-app-th-margin = Marginaali

js-app-th-mask-or-budget = Maski tai budjetti

js-app-th-metric = Mittari

js-app-th-metric-2 = Mittari

js-app-th-orbital-period = Kiertoaika

js-app-th-provenance = Alkuperä

js-app-th-size = Koko

js-app-th-source = Lähde

js-app-th-sun-distance = Etäisyys Auringosta

js-app-th-tier = Taso

js-app-th-unit = Yksikkö

js-app-th-value = Arvo

js-app-th-value-2 = Arvo

js-app-th-value-3 = Arvo

js-app-th-verdict = Tuomio

js-app-th-what-it-is = Mikä se on

js-app-the-body = kappale

js-app-the-chain = Ketju

js-app-the-observer = havaitsija

js-app-tile-browse-all =
    { $n ->
        [one] Selaa kaikkia { $n } skenaariota
       *[other] Selaa kaikkia { $n } skenaariota
    }

js-app-tile-browse-sub = Hae nimellä, kysymyksellä tai asetuksella

js-app-tile-preview-label = Tallennettu esikatselu lähteestä { $source }: { $title }

js-app-tile-scenario-count =
    { $n ->
        [one] { $n } skenaario
       *[other] { $n } skenaariota
    }

js-app-timeline-chart-title = Tehtävän aikajana: { $title }

js-app-timeline-note = Yksi kelain ohjaa jokaista alla olevaa kaaviota. Jokainen vaihe ajaa tavallisia skenaarioita; kampanja lukee niiden tulosteet yhdelle aikaruudukolle. Varjostetut kaistat ovat vaiheet ja pystyviivat tapahtumat. Yllä olevat arvot ovat kampanjan kanavat kertausajan hetkellä.

js-app-toast-copied = Kopioitu.

js-app-toast-copy-blocked = Kopiointi on estetty tässä.

js-app-toast-copy-blocked-select = Kopiointi on estetty tässä: valitse teksti sen sijaan.

js-app-toast-json-copied = JSON kopioitu.

js-app-toast-loading-run = Moottoria ladataan yhä. Ajosi käynnistyy heti, kun moottori on valmis.

js-app-toast-no-scenario = Tässä ei ole skenaariota nimeltä { $name }. Nämä ovat lähimmät osumat.

js-app-toast-not-single-number = Tämä asetus ei ole yksittäinen luku tässä skenaariossa: muokkaa sitä skenaariotiedostossa.

js-app-toast-one-pinned = Yksi ajo on kiinnitetty. Muuta asetusta, aja uudelleen ja kiinnitä se ajo verrataksesi näitä kahta.

js-app-toast-opened-advanced = Avattu asetuksilla, joita muutit Laajassa näkymässä.

js-app-toast-opened-at = Avattu kohdassa { $label }. Muuta sitä ja aja sitten uudelleen.

js-app-toast-scenario-copied = Skenaario kopioitu.

js-app-tour-answer-body = Tuloksesta luettu selkeä lause ja se, mistä tulos tulee: live-ajo selaimessasi tai samalla moottorilla tallennettu ajo.

js-app-tour-answer-title = Ensin vastaus

js-app-tour-back = Takaisin

js-app-tour-done = Valmis

js-app-tour-eyebrow = Opastettu kierros

js-app-tour-figures-body = Jokainen kortti luetaan moottorin tulosasiakirjasta.

js-app-tour-figures-title = Luvut, jotka vastaavat siihen

js-app-tour-how-body = Menetelmä, todisteiden taso ja lähdeviitteet.

js-app-tour-how-title = Miten tämä lasketaan

js-app-tour-next = Seuraava

js-app-tour-research-body = Komentorivi ja Python ajamiseen itse, data ja luvut sekä ohje viittaamiseen.

js-app-tour-research-title = Tutkijoille

js-app-tour-search-body = ⌘K löytää minkä tahansa skenaarion, alueen, asetuksen, näkymän tai komennon.

js-app-tour-search-title = Haku

js-app-tour-settings-body = Viisi asetusta, joilla on eniten merkitystä tälle kysymykselle. Muuta yhtä ja aja sitten uudelleen. Moottori toimii selaimessasi; mitään ei lähetetä minnekään.

js-app-tour-settings-title = Kokeile muita asetuksia

js-app-tour-skip = Ohita

js-app-tour-views-body = Kaaviot, kartat, kertaukset, moottorin oma raportti ja viennit. [ ja ] siirtyvät näkymien välillä.

js-app-tour-views-title = Ajon jokainen näkymä

js-app-tracking-threshold = Seurantakynnys

js-app-transport-hint = yksi kelain ohjaa tämän ajon jokaista paneelia

js-app-transport-label = Kertaus: yksi kelain ohjaa tämän ajon jokaista paneelia

js-app-unpin-run = Poista ajon { $id } kiinnitys

js-app-waterfall = Vesiputous

js-app-waterfall-hint = tehotiheysspektri: taajuus vaakasuunnassa, aika alaspäin

js-app-waterfall-note = Väri on teho vastaanottimen kohinatason yläpuolella. Navigointisignaalit ovat tämän tason alla, joten valaistuvat häirintälähettimet. Toista kertaus tai vedä sitä, niin oikealla olevat kaistat näyttävät, mitä vastaanotin seuraa yhä sillä hetkellä.

js-app-waterfall-title = Vesiputous, { $name }

js-app-webassembly-unavailable = WebAssembly ei ole käytettävissä

js-app-written-by-native = Kirjoittanut natiivi komentorivimoottori v{ $version } ({ $platform }) komennolla

js-cat-acm-link-question = Minkä DVB-S2-tilan yhteys pitää kunkin ylilennon aikana ja kuinka paljon dataa ylilento siirtää? (mallinnettu)

js-cat-acm-link-title = Satelliitin alalinkki mukautuvalla koodauksella

js-cat-aocs-slew-mekf-question = Kun säädin saa tietonsa asentosuodattimelta ja harhaisesta gyrosta, miten kääntöliike vertautuu todellisen tilan tapaukseen? (mallinnettu)

js-cat-aocs-slew-mekf-title = Kääntöliike asentoestimaatilla

js-cat-aocs-slew-question = Vakauttaako takaisinkytkentälaki suuren kulman kääntöliikkeen neljällä pyörällä, ja kuinka kovasti pyörät työskentelevät? (säätösilmukka on validoitu; avaruusalus on havainnollistava)

js-cat-aocs-slew-title = Reaktiopyörien kääntöliike

js-cat-aperture-duty-cycle-question = Kun yksi apertuuri palvelee sekä navigointia että viestintää, minkä katkon se aiheuttaa? (mallinnettu)

js-cat-aperture-duty-cycle-title = Apertuurin käyttösuhde

js-cat-araim-gps-galileo-question = Kuinka saatavilla edistynyt RAIM on GPS:llä ja Galileolla sekä koko satelliittitähdistöä koskevalla vikaoletuksella?

js-cat-araim-gps-galileo-title = Kahden satelliittitähdistön ARAIM

js-cat-araim-reference-check-question = Osuvatko moottorin suojaustasot julkaistuihin Working Group C:n laskuesimerkkeihin?

js-cat-araim-reference-check-title = ARAIM-vertailutarkistus

js-cat-ascent-losses-question = Kuinka suuren osan kaksivaiheisen kantoraketin ihanteellisesta nopeuden lisäyksestä painovoima, ilmanvastus, ohjaus ja vastapaine vievät? (mallinnettu)

js-cat-ascent-losses-title = Laukaisun nousuhäviöt

js-cat-attitude-budget-question = Mikä on pahimman tapauksen häiriömomentti ja osoitusvirhebudjetti?

js-cat-attitude-budget-title = Osoitusbudjetti

js-cat-automotive-urban-canyon-question = Pysyykö auto alikulun ja tienvarsihäirintälähettimen läpi ajaessaan puolen kaistan budjetin sisällä? (mallinnettu)

js-cat-automotive-urban-canyon-title = Auto kaupunkikanjonin läpi

js-cat-campaign-jam-spoof-holdover-integrity-question = Mitä yhdelle vastaanottimelle tapahtuu häirinnän, harhautuksen, GNSS:n menetyksen, eheyshälytyksen ja toipumisen läpi yhdellä aikajanalla? (mallinnettu)

js-cat-campaign-jam-spoof-holdover-integrity-title = Ketjutettu tehtävä: häirintä, harhautus, holdover, hälytys

js-cat-campaign-monte-carlo-clock-holdover-question = Vastaako vapaasti käyvän kellon aikavirhe monen siemenluvulla toistetun ajon yli sen suljetun muodon hajontaa?

js-cat-campaign-monte-carlo-clock-holdover-title = Monte Carlo -kellon holdover

js-cat-campaign-optimize-link-budget-question = Missä kohdassa X-kaistan linkki jättää täsmälleen 3 dB marginaalin etäisyyden ja datanopeuden yli?

js-cat-campaign-optimize-link-budget-title = Optimoi linkkibudjetti

js-cat-campaign-shared-jammer-sea-road-question = Yhden häirintälähettimen alla, kumpi alusta menettää paikkaratkaisunsa: 30 km päässä oleva laiva vai 50 km päässä oleva auto? (mallinnettu)

js-cat-campaign-shared-jammer-sea-road-title = Yksi häirintälähetin, laiva ja auto

js-cat-campaign-spectrum-holdover-integrity-question = Häirintälähetin vie kaksi L-kaistan signaalia, kello siirtyy holdoveriin ja vastaanotin turvautuu pelkkään Galileoon: pitääkö eheyden valvonta yhä? (mallinnettu)

js-cat-campaign-spectrum-holdover-integrity-title = Spektrin ohjaama tehtävä

js-cat-campaign-sweep-jammer-power-question = Kun 1 km päässä olevan häirintälähettimen tehoa nostetaan 10 nW:sta 10 W:iin, milloin vastaanotin menettää paikkaratkaisunsa? (mallinnettu)

js-cat-campaign-sweep-jammer-power-title = Häirintälähettimen tehon pyyhkäisy

js-cat-cislunar-arc-recovery-question = Palauttaako riippumaton pienimmän neliösumman estimaattori tilan todella siltä kaaren pituudelta, jonka astetesti ennustaa? (mallinnettu; hidas: noin 15 s selaimessa)

js-cat-cislunar-arc-recovery-title = Kuunläheisen kaaren palautus

js-cat-cislunar-observability-question = Kuinka suuren osan kuunläheisen avaruusaluksen tilasta satelliittien välinen kaari tekee havaittavaksi?

js-cat-cislunar-observability-title = Kuunläheinen havaittavuus

js-cat-clock-ensemble-question = Minkä luottamusvälin sisään holdover osuu monella kohinaotoksella?

js-cat-clock-ensemble-title = Kellon holdover-ensemble

js-cat-clock-holdover-labsr-question = Miten laboratoriotason strontiumoptinen kello vertautuu sirutason atomikelloon holdoverissa?

js-cat-clock-holdover-labsr-title = Kellon holdover, laboratorion optinen kello

js-cat-clock-holdover-question = Kuinka kauan kello pystyy pitämään aikaa sen jälkeen, kun GNSS katoaa?

js-cat-clock-holdover-title = Kellon holdover

js-cat-combined-altpnt-question = Mitä kolmen skalaarikarttakanavan yhdistäminen tuo mihin tahansa yksittäiseen verrattuna?

js-cat-combined-altpnt-title = Yhdistetty alt-PNT

js-cat-conflict-resilience-question = Miten kerroksellinen PNT-arkkitehtuuri heikkenee häirinnän, harhautuksen, kineettisten ja kyberuhkien alla? (mallinnettu)

js-cat-conflict-resilience-title = Kestävyys konfliktissa

js-cat-constellation-multi-gnss-coverage-question = Kuinka monta satelliittia on näkyvissä ja kuinka hyvä geometria on kaikkialla maapallolla, kun neljää maailmanlaajuista järjestelmää käytetään yhdessä? (mallinnettu)

js-cat-constellation-multi-gnss-coverage-title = Neljä GNSS-satelliittitähdistöä, yksi kartta

js-cat-contact-schedule-question = Kolmelle satelliitille ja kolmelle asemalle 12 tunnin aikana: mitkä ylilennot ristiriidaton suunnitelma säilyttää ja kuinka paljon dataa se siirtää? (mallinnettu)

js-cat-contact-schedule-title = Maayhteyssuunnitelma

js-cat-domain-campaigns-label = Kampanjat

js-cat-domain-campaigns-line = Ketjutetut tehtävät, pyyhkäisyt ja Monte Carlo -ajot yhdellä kellolla.

js-cat-domain-constellations-label = Satelliittitähdistön suunnittelu

js-cat-domain-constellations-line = Suunnittele satelliittitähdistö ja kartoita sen kattavuus ja PDOP (sijainnin tarkkuuden heikkenemiskerroin).

js-cat-domain-deepspace-label = Kuu, kuunläheinen avaruus ja Mars

js-cat-domain-deepspace-line = Navigointi ja aika Kuussa, kuunläheisessä avaruudessa ja Marsissa.

js-cat-domain-integrity-label = Eheys ja paikannus

js-cat-domain-integrity-line = Paikkaratkaisut ja se, voiko niihin luottaa: RAIM (vastaanottimen autonominen eheysvalvonta) ja sen edistynyt muoto ARAIM.

js-cat-domain-interference-label = Häirintä ja häiriöt

js-cat-domain-interference-line = Häirintälähettimet satelliittinavigointivastaanottimia vastaan: mitä menetetään ja milloin.

js-cat-domain-leo-label = Matalan Maan kiertoradan (LEO) navigointi

js-cat-domain-leo-line = Matalan Maan kiertoradan navigointisignaalit, ylilennot, viestit ja paikkaratkaisut.

js-cat-domain-leo-missions-label = LEO-tehtävät ja tutkimukset

js-cat-domain-leo-missions-line = Matalan Maan kiertoradan kerrokseen rakennetut tutkimukset ja palvelut.

js-cat-domain-navigation-label = Inertia- ja vaihtoehtoinen navigointi

js-cat-domain-navigation-line = Inertia-, maasto-, painovoima- ja muu navigointi ilman satelliitteja.

js-cat-domain-orbits-label = Radat ja GNSS-geometria

js-cat-domain-orbits-line = Radan eteneminen, efemeridit ja navigointisatelliittien geometria.

js-cat-domain-solar-label = Aurinkokunta

js-cat-domain-solar-line = Jokainen planeetta ja kuu yhtenä epookkina valoaikoineen.

js-cat-domain-spaceops-label = Tehtäväanalyysi ja avaruusoperaatiot

js-cat-domain-spaceops-line = Ylilennot, laukaisuikkunat, paluu ilmakehään sekä linkki- ja asentobudjetit.

js-cat-domain-spectrum-label = Spektri

js-cat-domain-spectrum-line = Radiokaistan vesiputoukset: häirintälähettimet, signaalit ja se, mitä vastaanotin seuraa.

js-cat-domain-spoofing-label = Harhautus ja signaaliturvallisuus

js-cat-domain-spoofing-line = Väärät signaalit ja meaconing sekä ne tarkkailijat, jotka ne havaitsevat.

js-cat-domain-studies-label = Kvantti, vaihtoehtovertailut ja yhteentoimivuus

js-cat-domain-studies-line = Kvanttianturit, vaihtoehtovertailut ja yhteentoimivuusformaatit.

js-cat-domain-timing-label = Kellot ja ajoitus

js-cat-domain-timing-line = Kellot ilman satelliitteja: holdover, vakaus, telealan maskit, ajansiirto.

js-cat-earth-gnss-lunar-question = Kuuleeko Kuun lähellä oleva vastaanotin Maan GNSS:n, ja riittääkö se koskaan paikkaratkaisuun? (mallinnettu)

js-cat-earth-gnss-lunar-title = Maan GNSS Kuussa

js-cat-entry-heating-stardust-question = Toistaako paluumalli Stardust-näytteenpalautuskapselin julkaistun huippuhidastuvuuden?

js-cat-entry-heating-stardust-title = Stardust-kapselin paluu

js-cat-eo-coverage-question = Minkä pyyhkäisykaistan, maanäytteenottovälin ja uudelleenkäyntiajan EO-rata antaa?

js-cat-eo-coverage-title = EO-kattavuus

js-cat-eo-radiometry-question = Minkä signaali-kohinasuhteen, MTF:n Nyquistin taajuudella ja NIIRS-arvon 15 %:n heijastuskyvyn kohde antaa pienelle Maa-havainnointikameralle? (mallinnettu)

js-cat-eo-radiometry-title = Kuvaajan radiometria ja kuvanlaatu

js-cat-ephemeris-question = Missä satelliitti on, ja milloin se ohittaa yläpuolelta?

js-cat-ephemeris-title = Maarata

js-cat-europa-surface-pnt-question = Voiko Jupiterin kuun Europan laskeutujan sijainnin määrittää pienestä releiden satelliittitähdistöstä ja Maasta mitatusta etäisyydestä? (mallinnettu)

js-cat-europa-surface-pnt-title = Laskeutuja Europalla

js-cat-fusion-pnt-coupled-question = Kun yksi pinottu Kalman-suodatin kattaa sijainnin, kellon ja kiihtyvyysmittarin harhan, miten navigaattori selviää GNSS-katkoksesta? (mallinnettu)

js-cat-fusion-pnt-coupled-title = Kytketty sensorifuusionavigaattori

js-cat-fusion-pnt-question = Mitä yksi yhteinen estimaattori tuo kellon ja sijainnin yli?

js-cat-fusion-pnt-title = Sensorifuusio

js-cat-gnss-ins-aviation-question = Kuinka paljon tiukasti kytketty navigointiluokan tai taktisen luokan INS ajautuu kahden minuutin GNSS-esteen läpi, joka kattaa kallistetun käännöksen? (mallinnettu)

js-cat-gnss-ins-aviation-title = Ilma-aluksen käännös GNSS-aukon läpi

js-cat-gnss-ins-maritime-question = Kuinka paljon navigointiluokan tai taktisen luokan INS ajautuu viiden minuutin GNSS-katkoksen jälkeen kiemurtelevalla aluksella? (mallinnettu)

js-cat-gnss-ins-maritime-title = Laiva kiemurtelee GNSS-katkoksen läpi

js-cat-gnss-ins-question = Kuinka hyvin tuettu inertianavigaattori liukuu GNSS-katkoksen läpi?

js-cat-gnss-ins-rail-question = Kuinka paljon tiukasti kytketty INS ajautuu syvän leikkauksen läpi, jossa on kaksi satelliittia, ja sen jälkeen tunnelin läpi? (mallinnettu)

js-cat-gnss-ins-rail-title = Juna leikkauksen ja tunnelin läpi

js-cat-gnss-ins-title = GNSS/INS-fuusio

js-cat-gnss-sim-container-terminal-skyline-question = Kun nosturit ovat merenpuolella ja pinot maanpuolella, kuinka monta satelliittia jää jäljelle ja mitä RAIM-suojaukselle tapahtuu? (mallinnettu; edustava horisonttiviiva)

js-cat-gnss-sim-container-terminal-skyline-title = Straddle-konttitrukki konttilaiturilla

js-cat-gnss-sim-raim-question = Miten ionosfääri ja troposfääri muokkaavat raakoja pseudoetäisyyksiä, ja suojaako RAIM yhä?

js-cat-gnss-sim-raim-title = GNSS-mittaukset

js-cat-gnss-ssv-formation-heo-question = Kuinka hyvin suodatin tuntee kilometrin päässä toisistaan olevan avaruusaluksen suhteellisen sijainnin verrattuna niiden absoluuttisten paikkaratkaisujen erotukseen? (mallinnettu; natiivilla moottorilla tallennettu ajo)

js-cat-gnss-ssv-formation-heo-title = Muodostelman suhteellinen navigointi, erittäin elliptinen rata

js-cat-gnss-ssv-heo-question = Mitä erittäin elliptinen rata kuulee reittinsä varrella: näkyvissä olevat signaalit, paras C/N0, pääkeila sivukeilaa vastaan, DOP ja sivuavat signaalit? (mallinnettu; natiivilla moottorilla tallennettu ajo)

js-cat-gnss-ssv-heo-title = GNSS-signaalit erittäin elliptisellä radalla

js-cat-gnss-ssv-lunar-weak-question = Mitä heikoimpia signaaleja varten suunniteltu vastaanotin voi käyttää matkalla Kuuhun? (mallinnettu; natiivilla moottorilla tallennettu ajo)

js-cat-gnss-ssv-lunar-weak-title = GNSS-signaalit Kuun siirtoradalla, heikon signaalin vastaanotin

js-cat-gnss-ssv-nav-lunar-question = Kuinka hyvin aluksella oleva suodatin pitää Kuun siirtoradan suhteessa ilmoittamaansa rajaan? (mallinnettu; natiivilla moottorilla tallennettu ajo)

js-cat-gnss-ssv-nav-lunar-title = Aluksen GNSS-suodatin Kuun siirtoradalla

js-cat-gnss-ssv-shell-question = Kuinka usein geostationaarisella korkeudella oleva avaruusalus kuulee vähintään yhden ja vähintään neljä navigointisignaalia satelliittitähdistöä ja kaistaa kohden? (mallinnettu; natiivilla moottorilla tallennettu ajo)

js-cat-gnss-ssv-shell-title = GNSS-signaalit satelliittien yläpuolella: kuori 36 000 km:n korkeudella

js-cat-gps-denied-gravity-nav-egm2008-question = Voiko karttasovitus pitää GPS-estetyn radan todellisella EGM2008-painovoimakentällä asteeseen 70 asti? (mallinnettu)

js-cat-gps-denied-gravity-nav-egm2008-title = Painovoimanavigointi todellisella kentällä

js-cat-gps-denied-gravity-nav-question = Kuinka paljon sijainti ajautuu kokonaisen tunnin ilman GNSS:ää, ja voiko painovoimakartta hillitä sitä?

js-cat-gps-denied-gravity-nav-title = GNSS-vapaa navigointi

js-cat-gravity-map-error-mc-question = Kun tallennettu painovoimakartta kohinoituu, kuinka usein karttasovitus pitää GPS-estetyn paikkaratkaisun yhä tavoitteessaan? (mallinnettu)

js-cat-gravity-map-error-mc-title = Painovoimakartan virhe, Monte Carlo

js-cat-gravity-map-nav-question = Voiko kylmäatomigravimetri pitää sijainnin ilman GNSS:ää sovittamalla painovoimakenttää, jonka läpi se lentää?

js-cat-gravity-map-nav-title = Painovoimakarttanavigointi

js-cat-holdover-test-example-question = Irrota antenni, pisteytä holdover: tallenne jaettuna operaattorin ilmoittamiin kahteen ajanhetkeen, kukin vaihe mitattuna sille kirjoitettuja ITU-T-maskeja vasten. (mallinnettu; tallenne on keksitty esimerkkiä varten)

js-cat-holdover-test-example-title = Holdover-testi: aikavirhetallenne maskeja vasten

js-cat-holdover-test-ptp4l-question = Samat neljä vaihetta luettuna ptp4l-servolokista: kuinka kaukana demonin oma poikkeama pysyy maskeista GNSS:n ollessa poissa? (mallinnettu; loki on keksitty esimerkkiä varten)

js-cat-holdover-test-ptp4l-title = Holdover-testi: linuxptp-loki

js-cat-hybrid-optical-rf-question = Minkä jatkuvuuden ja eheyden optisen ja RF-PNT:n yhdistäminen tuo? (mallinnettu)

js-cat-hybrid-optical-rf-title = Optinen/RF-hybridi

js-cat-hybrid-pnt-question = Mitä yhdistetty kello- ja inertiakokonaisuus tuo?

js-cat-hybrid-pnt-title = Hybridi-PNT

js-cat-hybrid-ukf-question = Onko 17-tilainen tiukasti kytketty UKF itsejohdonmukainen (NEES + innovaatioiden valkoisuus)? Itsejohdonmukaisuustarkistus, ei tarkkuusväite.

js-cat-hybrid-ukf-title = Hybridi 17-tilainen UKF

js-cat-impairment-eval-question = Kuinka hyvin ilmaisin erottaa häirinnän, harhautuksen ja monitie-etenemisen nimellisestä? (mallinnettu ROC/AUC)

js-cat-impairment-eval-title = RF-heikentymien arviointi

js-cat-imu-deadreckoning-question = Kuinka paljon sijainti ajautuu pelkän IMU:n varassa?

js-cat-imu-deadreckoning-title = Inertiaalinen laskentanavigointi

js-cat-ins-trn-coast-question = Kuinka paljon sijainti ajautuu navigointikatkoksen aikana, ja milloin se ylittää 10 m ja 50 m? (mallinnettu)

js-cat-ins-trn-coast-title = INS/TRN-liuku

js-cat-integrity-harbour-approach-question = Kun laiturirakennukset ja aallonmurtaja peittävät matalat satelliitit, pitävätkö GPS ja Galileo ARAIM-suojauksen hälytysrajojen sisällä? (mallinnettu; edustava horisonttiviiva)

js-cat-integrity-harbour-approach-title = ARAIM satamaan saavuttaessa

js-cat-integrity-raim-question = Täyttääkö geometria hälytysrajat (HPL / VPL)?

js-cat-integrity-raim-title = RAIM-eheys

js-cat-jamming-demo-question = Millä häirintälähettimen ja signaalin suhteella vastaanotin menettää lukituksen?

js-cat-jamming-demo-title = Häirintä

js-cat-jamming-harbour-approach-skyline-question = Kun rannalla on 2 W:n häirintälähetin, kuinka monta satelliittia alus säilyttää ja kuinka monta laituri itse peittää? (mallinnettu; edustava horisonttiviiva)

js-cat-jamming-harbour-approach-skyline-title = Alus häirinnän kohteena satamaan saavuttaessa

js-cat-l-band-waterfall-jamming-question = Miltä koko GNSS:n L-kaista näyttää, kun chirp-, sävy- ja kohinahäirintälähetin kytkeytyvät päälle, ja mitkä signaalit kukin vie pois? (mallinnettu)

js-cat-l-band-waterfall-jamming-title = L-kaistan vesiputous häirinnän alla

js-cat-launch-window-question = Mikä laukaisuazimutti ja dogleg-Δv saavuttavat kohderadan kaltevuuden laukaisupaikalta?

js-cat-launch-window-title = Laukaisuikkuna

js-cat-leo-band-trade-question = Mitä matalan kiertoradan navigointisignaali voittaa ja häviää kullakin kaistalla, ultrakorkeasta taajuudesta (UHF) C-kaistaan? (edustavia suunnitelmia)

js-cat-leo-band-trade-title = Kaistavertailu, UHF:stä C-kaistaan

js-cat-leo-doppler-positioning-question = Kuinka hyvä on kymmenen minuutin Doppler-mittauksesta saatu paikkaratkaisu matalan kiertoradan navigointitähdistöllä? (mallinnettu)

js-cat-leo-doppler-positioning-title = Paikannus pelkästä Dopplerista

js-cat-leo-focus-data-services-question = Mitä kukin lisädatapalvelu maksaa navigointiviestin biteissä? (mallinnettu)

js-cat-leo-focus-data-services-title = Palveludata suhteessa kehyksen pituuteen

js-cat-leo-focus-fused-pnt-sisre-question = Kuinka hyvä matalan kiertoradan avaruussignaalin etäisyysvirheen on oltava, ennen kuin matalan kiertoradan kerros auttaa fuusioitua paikkaratkaisua? (mallinnettu)

js-cat-leo-focus-fused-pnt-sisre-title = Fuusioitu paikkaratkaisu suhteessa radan ja kellon virheeseen

js-cat-leo-focus-indoor-uhf-question = Mikä kaista yltää yhä sisälle käyttäjälle perinteisessä ja lämpötehokkaassa rakennuksessa? (mallinnettu)

js-cat-leo-focus-indoor-uhf-title = Sisätilavastaanotto kaistan ja rakennuksen mukaan

js-cat-leo-focus-iot-eirp-question = Kuinka paljon satelliitin lähetystehoa akkukäyttöinen tunniste tarvitsee kestääkseen? (mallinnettu)

js-cat-leo-focus-iot-eirp-title = Seurantalaitteen energia suhteessa lähetystehoon

js-cat-leo-focus-ntn-bandwidth-question = Miten paikannusvirhe pienenee, kun vertailusignaali levenee 180 kHz:stä 20 MHz:iin? (mallinnettu)

js-cat-leo-focus-ntn-bandwidth-title = 5G-alalinkin paikannus suhteessa kaistanleveyteen

js-cat-leo-focus-ppp-altitude-question = Lyhentääkö matalampi vai korkeampi matalan kiertoradan kerros konvergenssia enemmän? (mallinnettu; hidas, noin minuutti selaimessa)

js-cat-leo-focus-ppp-altitude-title = Tarkka paikannus suhteessa kerroksen korkeuteen

js-cat-leo-focus-science-iono-sounding-question = Kuinka hyvin kahden kaistan viive-ero mittaa elektronisisältöä matalan kiertoradan satelliitin alapuolella? (mallinnettu)

js-cat-leo-focus-science-iono-sounding-title = Ionosfäärin luotaus kahdelta kaistalta

js-cat-leo-indoor-uhf-question = Miksi UHF-kantoaalto yltää rakennuksen sisälle, kun L-, S- ja C-kaistat tökkivät? (mallinnettu)

js-cat-leo-indoor-uhf-title = Sisätiloissa UHF:llä

js-cat-leo-iot-energy-question = Kuinka paljon energiaa akkukäyttöinen tunniste kuluttaa kutakin matalan kiertoradan signaalista saatua paikkaratkaisua kohden? (mallinnettu)

js-cat-leo-iot-energy-title = Seurantalaitteen energia paikkaratkaisua kohden

js-cat-leo-navmsg-encode-decode-question = Mitä kunkin kentän kvantisointi maksaa, ja selviääkö kehys koodauksesta, dekoodauksesta ja vioittuneesta bitistä? (mallinnettu)

js-cat-leo-navmsg-encode-decode-title = Navigointiviesti: binäärikehys

js-cat-leo-navmsg-fit-interval-trade-question = Kuinka pitkän ajan yksi lähetetty viesti voi kattaa, ennen kuin sen ratavirhe ylittää tavoitteen? (mallinnettu; hidas, noin 30 s selaimessa)

js-cat-leo-navmsg-fit-interval-trade-title = Navigointiviesti: sovitusväli

js-cat-leo-navmsg-midpass-update-question = Kun satelliitti vaihtaa uuteen viestiin ylilennon keskellä, näkeekö käyttäjä hypyn? (mallinnettu)

js-cat-leo-navmsg-midpass-update-title = Navigointiviesti: päivitys ylilennon aikana

js-cat-leo-navmsg-model-comparison-question = Mikä efemeridimalli esittää matalaa rataa parhaiten, ja miten se asettuu julkaistun taulukon rinnalle? (mallinnettu)

js-cat-leo-navmsg-model-comparison-title = Navigointiviesti: neljä mallia

js-cat-leo-pass-iridium-question = Minkä signaalin voimakkuuden ja Dopplerin lentokone näkee yhden Iridium-ylilennon aikana? (mallinnettu)

js-cat-leo-pass-iridium-title = Iridium-purskeet ilma-aluksesta

js-cat-leo-pass-vs-gnss-cn0-question = Miten yhden matalan kiertoradan ylilennon signaalin voimakkuus vertautuu näkyvissä oleviin Galileo-satelliitteihin? (mallinnettu)

js-cat-leo-pass-vs-gnss-cn0-title = Yksi ylilento GNSS:ää vastaan

js-cat-leo-pass-xona-pulsar-question = Miltä X1- ja X5-signaalit näyttävät yhden ylilennon aikana Biskajanlahdella olevalle alukselle? (mallinnettu)

js-cat-leo-pass-xona-pulsar-title = Xona Pulsar -ylilento

js-cat-leo-pnt-end-to-end-question = Mitä kukin vaihe välittää seuraavalle signaalisuunnittelusta lopulliseen paikkaratkaisuun? (mallinnettu)

js-cat-leo-pnt-end-to-end-title = Päästä päähän, yleinen satelliittitähdistö

js-cat-leo-pnt-mega-shell-question = Minkä kattavuuden ja geometrian 5 000 satelliitin navigointitähdistö matalalla Maan kiertoradalla antaa? (mallinnettu; esimerkkisuunnitelma)

js-cat-leo-pnt-mega-shell-title = 5 000 satelliitin matalan kiertoradan suunnitelma

js-cat-leo-ppp-convergence-question = Kuinka paljon nopeammin tarkka pistepaikannus (PPP) konvergoituu, kun matalan kiertoradan kerros lisätään? (mallinnettu; hidas, noin 30 s selaimessa)

js-cat-leo-ppp-convergence-title = Tarkan paikannuksen konvergenssi

js-cat-leo-pvt-fjord-skyline-question = Kun vuonon seinämät jättävät taivaasta kaistaleen kanavan suuntaisesti, kuinka paljon matalan kiertoradan kerros lisää GPS:ään ja Galileoon? (mallinnettu; edustava horisonttiviiva)

js-cat-leo-pvt-fjord-skyline-title = Lautta syvällä vuonossa

js-cat-leo-resilience-gnss-jammed-leo-carries-question = Kun GNSS on häiritty, voiko matalan kiertoradan kerros muilla kaistoilla pitää paikkaratkaisun ja sen eheyden? (mallinnettu)

js-cat-leo-resilience-gnss-jammed-leo-carries-title = GNSS häiritty, matala kiertorata jatkaa

js-cat-leo-resilience-js-margin-question = Kuinka paljon enemmän häirintää voimakkaampi matalan kiertoradan signaali kestää kuin keskikiertoradan GNSS-signaali? (mallinnettu)

js-cat-leo-resilience-js-margin-title = Häirintämarginaali vastaanotetusta tehosta

js-cat-leo-resilience-multiband-diversity-question = Kun yhden L-kaistan häirintälähettimen tehoa nostetaan, mitkä neljästä kaistasta jatkavat seurantaa? (mallinnettu)

js-cat-leo-resilience-multiband-diversity-title = Kaistadiversiteetti laajakaistaisen häirintälähettimen alla

js-cat-leo-resilience-spoof-doppler-question = Kun harhauttaja siirtää laskettua sijaintia 30 m, kuinka nopeasti Doppler- ja ylilentogeometriatarkistus havaitsee sen? (mallinnettu)

js-cat-leo-resilience-spoof-doppler-title = Harhautus havaittu Dopplerilla

js-cat-leo-resilience-spoof-monitors-question = Mikä tarkkailija näkee minkäkin tyyppisen harhauttajan? (mallinnettu)

js-cat-leo-resilience-spoof-monitors-title = Harhautuksen tarkkailijat neljää harhauttajaa vastaan

js-cat-leo-timing-utc-question = Kuinka tarkasti vastaanotin voi palauttaa yleisajan (UTC) matalan kiertoradan satelliiteista oskillaattorin ja signaalitason mukaan? (mallinnettu)

js-cat-leo-timing-utc-title = Ajansiirto UTC:hen

js-cat-leo-vertical-5g-network-timing-question = Kun GNSS menetetään vuorokaudeksi, pitääkö matalan kiertoradan aika tukiaseman ajoitusrajansa sisällä? (mallinnettu)

js-cat-leo-vertical-5g-network-timing-title = 5G-tukiaseman ajoitus

js-cat-leo-vertical-asset-tracking-iot-question = Mitä kukin paikkaratkaisu maksaa akkukäyttöiselle tunnisteelle kontin matkan varrella? (mallinnettu)

js-cat-leo-vertical-asset-tracking-iot-title = Konttien seuranta

js-cat-leo-vertical-autonomous-vehicle-question = Kun rakennukset peittävät matalat satelliitit, pitääkö matalan kiertoradan kerros auton kaistatason virheen sisällä? (mallinnettu)

js-cat-leo-vertical-autonomous-vehicle-skyline-question = Kun mallinnetaan oikeaa katua tasaisen 35°:n katkaisukulman sijaan, pitääkö matalan kiertoradan kerros yhä auton kaistatason virheen sisällä? (mallinnettu; edustava horisonttiviiva)

js-cat-leo-vertical-autonomous-vehicle-skyline-title = Ajoneuvo kadulla, ei tasaisella katkaisukulmalla

js-cat-leo-vertical-autonomous-vehicle-title = Ajoneuvo kaupunkikanjonissa

js-cat-leo-vertical-critical-infrastructure-timing-question = Kun GNSS menetetään, pitääkö matalan kiertoradan aika sähköaseman synkronoinnin? (mallinnettu)

js-cat-leo-vertical-critical-infrastructure-timing-title = Sähköaseman ajoitus

js-cat-leo-vertical-polar-arctic-question = Tromssasta pohjoisnavalle: mitä napakiertoratainen matalan kiertoradan kerros lisää GNSS:ään? (mallinnettu)

js-cat-leo-vertical-polar-arctic-title = Arktinen matka

js-cat-leo-vertical-rail-maritime-question = Kun mukana toimitetut laiva- ja junaskenaariot menettävät GNSS:n, tavoittaako matalan kiertoradan ylilento ne silti? (mallinnettu)

js-cat-leo-vertical-rail-maritime-title = Raide- ja meriliikenne matalan kiertoradan kerroksella

js-cat-link-budget-question = Sulkeutuuko yksisuuntainen linkki marginaalilla annetulla etäisyydellä ja datanopeudella?

js-cat-link-budget-title = Linkkibudjetti

js-cat-lunanet-araim-question = Täyttääkö harva kuun releiden joukko eheysrajat Artemis-alueen vastaanottimelle?

js-cat-lunanet-araim-title = Kuun eheys

js-cat-lunar-attack-surface-question = Mitä vaaditaan Kuun pinnan vastaanottimen harhauttamiseen tai estämiseen, ja mikä todennusbudjetti vastaa siihen? (mallinnettu)

js-cat-lunar-attack-surface-title = Kuun hyökkäyspinta

js-cat-lunar-beacon-question = Kuinka paljon kourallinen mitattuja pintamajakoita romahduttaa etelänapa-alueen DOP:n? (mallinnettu)

js-cat-lunar-beacon-title = Kuun pintamajakat

js-cat-lunar-differential-pnt-question = Kuinka paljon differentiaalikorjaus kumoaa yhteismuotoisen virheen suhteessa peruslinjaan Kuussa? (mallinnettu)

js-cat-lunar-differential-pnt-title = Kuun differentiaalinen PNT

js-cat-lunar-frame-campaign-question = Minkä datumtarkkuuden havaintokampanja tuottaa syötetyn muunnoksen sijaan? (mallinnettu)

js-cat-lunar-frame-campaign-title = Kuun koordinaatiston kampanja

js-cat-lunar-frame-realisation-question = Voiko Helmert-datumsovitus palauttaa Kuun koordinaatiston muunnoksen? (mallinnettu)

js-cat-lunar-frame-realisation-title = Kuun koordinaatisto

js-cat-lunar-infrastructure-carrier-phase-question = Voivatko pinta-asema ja kiertäjä yhdessä ratkaista Maan GNSS-signaalien kantoaallon vaiheen kokonaislukuepävarmuudet? Nopea esimerkkiajo. (mallinnettu; natiivilla moottorilla tallennettu ajo)

js-cat-lunar-infrastructure-carrier-phase-title = Kuun kantoaallon vaihe: pinta-asema ja kiertäjä

js-cat-lunar-infrastructure-frame-coestimation-question = Kuinka paljon lisää tietoa kiertäjän ja pinta-aseman väliset etäisyydet tuovat Kuun datumin seitsemään parametriin? (mallinnettu; natiivilla moottorilla tallennettu ajo)

js-cat-lunar-infrastructure-frame-coestimation-title = Kuun koordinaatiston yhteisestimointi kiertäjälinkeillä

js-cat-lunar-infrastructure-geodesy-sensitivity-question = Kuinka herkkiä laseretäisyysmittaus, kiertäjän seuranta, gravimetri ja pintakello ovat suureille h2, k2, l2 ja libraatiolle? (mallinnettu; natiivilla moottorilla tallennettu ajo)

js-cat-lunar-infrastructure-geodesy-sensitivity-title = Kuun Love-lukujen ja libraation herkkyys

js-cat-lunar-infrastructure-od-consistency-model-error-question = Sama vertailu, kun mukaan syötetään pieni mallintamaton kiihtyvyys: huomaako johdonmukaisuustarkistus sen? (mallinnettu; natiivilla moottorilla tallennettu ajo)

js-cat-lunar-infrastructure-od-consistency-model-error-title = Kuun radanmääritys syötetyllä mallinnusvirheellä

js-cat-lunar-infrastructure-od-consistency-question = Ovatko aluksella tehty Maan GNSS:ään perustuva radanmääritys Kuun haloradalla ja riippumaton maaradiometrinen radanmääritys samaa mieltä ilmoitettujen epävarmuuksiensa rajoissa? (mallinnettu; natiivilla moottorilla tallennettu ajo)

js-cat-lunar-infrastructure-od-consistency-title = Kuun radanmääritys: aluksen GNSS maaseurantaa vastaan

js-cat-lunar-infrastructure-space-tie-question = Kuinka tarkasti kolmen tekniikan väliset siirtymät voidaan sitoa toisiinsa suhteessa paikallisen sidonnan virheeseen? (mallinnettu; natiivilla moottorilla tallennettu ajo)

js-cat-lunar-infrastructure-space-tie-title = Avaruussidonta: GNSS, VLBI ja laseretäisyysmittaus yhdellä avaruusaluksella

js-cat-lunar-interop-export-question = Selviävätkö Kuun koordinaatisto, aika ja efemeridi edestakaisesta muunnoksesta CCSDS OEM:n ja KIF-kuoren kautta?

js-cat-lunar-interop-export-title = Kuun yhteentoimivuusvienti

js-cat-lunar-jamming-question = Kuinka kaukana häirintälähetin voi olla ja silti estää Kuun pinnan vastaanottimen? (mallinnettu)

js-cat-lunar-jamming-title = Kuun häirintä

js-cat-lunar-joint-od-clock-question = Tekeekö Maa-peruslinjan VLBI-sidonta Kuun aseman absoluuttisen sijainnin havaittavaksi? (mallinnettu)

js-cat-lunar-joint-od-clock-title = Kuun yhteinen radanmääritys ja kello

js-cat-lunar-llr-datum-question = Miltä Kuun datum näyttää, kun kampanja on oikeaa arkistoitua Kuun laseretäisyysmittausta (LLR)? (mallinnettu; natiivilla moottorilla tallennettu ajo)

js-cat-lunar-llr-datum-title = Kuun laseretäisyysmittausdatum

js-cat-lunar-relay-constellation-question = Minkä kattavuuden jäädytetyillä ja matalilla Kuun radoilla oleva rele- ja navigointitähdistö antaa koko Kuun yli? (mallinnettu; esimerkkisuunnitelma)

js-cat-lunar-relay-constellation-title = Kuun releitähdistö

js-cat-lunar-station-coverage-public-sources-question = Mitä korjattua virhettä asema antaa etelänavan yllä, kun käytetään vain julkisesti ilmoitettuja oletuksia? Tulosta hallitsevat rataelementit, jotka eivät ole julkisia ja jotka on asetettu ILLUSTRATIVE-arvoon; tämä on jäädytetyn ennusteen syöte. (mallinnettu; ei väite mistään todellisesta järjestelmästä)

js-cat-lunar-station-coverage-public-sources-title = Kuun vertailuasema, julkiset oletukset

js-cat-lunar-station-coverage-question = Mitä korjattua virhettä Kuun vertailuasema antaa etelänapa-alueen yllä vuorokauden aikana, ja kuinka kauas siitä kattavuus ulottuu? (mallinnettu; ei väite mistään todellisesta järjestelmästä)

js-cat-lunar-station-coverage-terrain-question = Kun kunkin paikan horisontti on säteenseurattu todellisen Kuun korkeusmallin yli, kuinka paljon kattavuutta asema menettää maastolle? (mallinnettu)

js-cat-lunar-station-coverage-terrain-title = Kuun asema todellisella maastolla

js-cat-lunar-station-coverage-title = Kuun vertailuaseman kattavuus

js-cat-lunar-station-geodesy-baseline-question = Kuinka hyvin nykyiset viisi retroreflektoriryhmää sitovat Kuun datumin todellisella aikataululla ennen kuin yhtään asemaa on lisätty? Parin lähtötaso. (mallinnettu; natiivilla moottorilla tallennettu ajo)

js-cat-lunar-station-geodesy-baseline-title = Kuun aseman geodesia: pelkät viisi ryhmää

js-cat-lunar-station-geodesy-with-station-question = Sama arkistoitu aikataulu yhdellä lisätyllä etelänapa-heijastimella ja VLBI-majakalla: kuinka paljon datumin raja tiukkenee? (mallinnettu, havainnollistava paikka; natiivilla moottorilla tallennettu ajo)

js-cat-lunar-station-geodesy-with-station-title = Kuun aseman geodesia: etelänapa-asemalla

js-cat-lunar-station-time-lab-question = Kuinka kauan aseman miniatyyrirubidiumkello pysyy 1, 10 ja 100 ns:n sisällä sen jälkeen, kun se on viimeksi ohjattu Kuun aikaan, ja mikä virhetermi hallitsee? (mallinnettu)

js-cat-lunar-station-time-lab-title = Kuun aseman aikalaboratorio

js-cat-lunar-time-budget-question = Kuinka suuri on Maan ja Kuun koordinaattiaikojen ero ja sen virhebudjetti? (mallinnettu)

js-cat-lunar-time-budget-title = Kuun aikabudjetti

js-cat-lunar-time-offset-question = Kuinka nopeasti Kuun kello erkanee Maan ajasta (~56–59 µs/vrk)?

js-cat-lunar-time-offset-title = Kuun aikaero

js-cat-lunar-vlbi-fim-question = Minkä aseman koordinaattitarkkuuden annettu VLBI-seuranta-aikataulu todella tuo? (mallinnettu)

js-cat-lunar-vlbi-fim-title = Kuun VLBI-informaatio

js-cat-lunar-vlbi-question = Minkä viiveen Maa-peruslinjan VLBI-pari näkee Kuun pintamajakalle? (mallinnettu)

js-cat-lunar-vlbi-title = Kuun VLBI

js-cat-maritime-port-approach-coast-question = Kun satamaan tullaan ilman GNSS:ää, milloin navigointiluokan INS poistuu satama- ja merialuebudjeteista? (mallinnettu)

js-cat-maritime-port-approach-coast-title = Satamaan saapuminen inertialla

js-cat-maritime-spoof-position-push-question = Kun harhauttaja vetää aluksen paikkaratkaisua 500 m, mitkä havaitsemiskerrokset huomaavat sen? (mallinnettu)

js-cat-maritime-spoof-position-push-title = Aluksen sijainti harhautettu

js-cat-maritime-strait-jamming-question = Vievätkö 50 W:n häirintälähetin aluksen GNSS:n 30 km:n avovesimatkan yli? (mallinnettu)

js-cat-maritime-strait-jamming-title = Alus häirinnän kohteena salmessa

js-cat-mars-orbit-pnt-question = Kuinka hyvin matala Marsin kiertäjä paikannetaan kahdestatoista navigointireleestä, ja mitä Maasta mitattu etäisyys lisää? (mallinnettu)

js-cat-mars-orbit-pnt-title = Marsin kiertäjä releillä ja Maa-yhteydellä

js-cat-mars-pnt-lmo-question = Voiko MARCONI-releitähdistö navigoida käyttäjää Marsissa? (kovarianssin ansioarvo, ei sertifioitu suojaustaso)

js-cat-mars-pnt-lmo-title = Marsin PNT, matala kiertorata

js-cat-mars-pnt-surface-question = Kuinka hyvin pyörivän Marsin pinnalla oleva laskeutuja tai mönkijä voidaan navigoida releitähdistöä vasten?

js-cat-mars-pnt-surface-title = Marsin PNT, pinta

js-cat-mars-pnt-transfer-question = Kuinka hyvin korkealla, eksentrisellä lähestymis- tai vangitsemiskaarella oleva ajoneuvo navigoidaan Marsissa?

js-cat-mars-pnt-transfer-title = Marsin PNT, siirtorata

js-cat-meo-leo-fused-pvt-question = Mitä matalan kiertoradan kerroksen lisääminen GPS:ään ja Galileoon tekee sijaintivirheelle ja geometrialle? (mallinnettu)

js-cat-meo-leo-fused-pvt-title = Fuusioitu GNSS- ja matalan kiertoradan paikkaratkaisu

js-cat-moonlight-service-volume-question = Minkä DOP:n, kattavuuden ja eheyden Moonlight/LCNS-luokan tähdistö antaa etelänavalle? (mallinnettu)

js-cat-moonlight-service-volume-title = Kuun palvelutilavuus

js-cat-multi-band-jamming-waterfall-question = Kun navigointisignaalit on jaettu neljälle kaistalle, mitä yhdelle kaistalle rakennettu häirintälähetin jättää pystyyn? (mallinnettu)

js-cat-multi-band-jamming-waterfall-title = Monikaistainen häirintävesiputous

js-cat-notinbrowser-elevation-model = Vaatii Kuun korkeusmallin leikkeen ({ $path }), joka toimitetaan repositorion mukana, ei selainversion mukana.

js-cat-notinbrowser-laser-ranging-data = Vaatii arkistoidun laseretäisyysmittausdatan osan, joka toimitetaan repositorion mukana, ei selainversion mukana.

js-cat-notinbrowser-study-suite = Tutkimussarja, ei yksittäinen skenaario. Aja se komentorivityökalulla: { $command }.

js-cat-ntn-5g-positioning-question = Kuinka tarkasti kännykkä voi paikantaa itsensä 5G-ei-maanpäällisen verkon alalinkistä signaalin kaistanleveyden mukaan? (mallinnettu)

js-cat-ntn-5g-positioning-title = 5G-satelliittialalinkin paikannus

js-cat-oem-interop-question = Voiko GMAT:sta / Orekitistä / STK:sta peräisin olevan OEM-efemeridin tuoda ja muuntaa edestakaisin?

js-cat-oem-interop-title = CCSDS OEM -silta

js-cat-optical-atmosphere-network-question = Kuinka usein optinen ajoituslinkki on toiminnassa pilvien ja turbulenssin läpi, ja mitä lisämaa-asemat tuovat? (mallinnettu; havainnollistavat pilviilmastot)

js-cat-optical-atmosphere-network-title = Optinen linkki ilmakehän läpi, kolme paikkaa

js-cat-optical-atmosphere-techniques-question = Mitä suurempi apertuuri, toinen aallonpituus tai adaptiivinen optiikka tuo yhdelle optiselle ylälinkille pilvessä ja turbulenssissa? (mallinnettu; havainnollistava pilviilmasto)

js-cat-optical-atmosphere-techniques-title = Optisen linkin tekniikat

js-cat-orbit-gnss-challenged-question = Milloin paikkaratkaisu on satelliittigeometrian perusteella edes mahdollinen?

js-cat-orbit-gnss-challenged-title = GNSS-saatavuus

js-cat-orbit-molniya-question = Näkeekö erittäin eksentrisen Molniya-radan käyttäjä yhä riittävästi GNSS-satelliitteja apogeumin lähellä?

js-cat-orbit-molniya-title = Molniya-käyttäjä

js-cat-orbit-multignss-question = Kuinka paljon GPS ja Galileo yhdessä nostavat saatavuutta ja tiukentavat tarkkuuden heikkenemiskerrointa?

js-cat-orbit-multignss-title = Multi-GNSS-saatavuus

js-cat-orbit-real-tle-question = Minkä kattavuuden todellinen satelliittitähdistö antaa, kun se on annettu kaksirivisinä ratalementteinä?

js-cat-orbit-real-tle-title = Todelliset kaksirivielementit

js-cat-orbit-rinex-question = Mikä saatavuus saadaan todellisesta RINEX 3 -lähetysefemeridistä?

js-cat-orbit-rinex-title = Lähetysefemeridi

js-cat-orbit-sgp4-gps-question = Miten todellinen GPS:n kaltainen satelliittitähdistö etenee vuorokauden aikana?

js-cat-orbit-sgp4-gps-title = SGP4-radat

js-cat-orbit-urban-canyon-skyline-question = Kaupungin kadun pohjalla: kuinka suuren osan vuorokaudesta GPS ja Galileo antavat neljä satelliittia, ja mitä taivaan kaistale tekee PDOP:lle? (mallinnettu; edustava horisonttiviiva)

js-cat-orbit-urban-canyon-skyline-title = Kaupungin kadun saatavuus

js-cat-passes-question = Milloin satelliitti nousee ja laskee aseman yllä, ja kuinka pitkäksi aikaa?

js-cat-passes-title = Maaylilennot

js-cat-polar-arctic-leo-coverage-question = Päiväntasaajalta navalle: miten näkyvissä olevat satelliitit ja geometria muuttuvat pelkällä GNSS:llä, pelkällä napakiertoratalla olevalla matalan kiertoradan kerroksella ja molemmilla? (mallinnettu)

js-cat-polar-arctic-leo-coverage-title = Päiväntasaajalta navalle

js-cat-pvt-abmf-question = Voiko todellisen vastaanottimen sijainnin ratkaista raaoista RINEX-mittauksista?

js-cat-pvt-abmf-title = Paikannus (SPP)

js-cat-quantum-anomaly-detect-question = Kuinka hyvin kvanttijärjestelmän viat havaitaan kiinteällä väärien hälytysten tasolla? (mallinnettu)

js-cat-quantum-anomaly-detect-title = Kvanttipoikkeaman havaitseminen

js-cat-quantum-cai-coast-question = Kuinka kauan fysiikkansa mukaan määritelty kylmäatomi-interferometri pitää laskentanavigoinnin 100 m:n sisällä GNSS:n menetyksen jälkeen verrattuna navigointiluokan kvartsikiihtyvyysmittariin? (mallinnettu)

js-cat-quantum-cai-coast-title = Kvanttikiihtyvyysmittarin liuku

js-cat-quantum-gnss-free-nav-question = Kuinka pitkälle kylmäatominavigaattori liukuu verrattuna navigointiluokan INS:ään ilman GNSS:ää? (mallinnettu)

js-cat-quantum-gnss-free-nav-title = Kvantti-GNSS-vapaa navigointi

js-cat-quantum-pnt-demonstrator-suite-question = Kolme kvanttisovellusaluetta yhtenä tutkimuksena (komentorivin tutkimussarja: kshana --study).

js-cat-quantum-pnt-demonstrator-suite-title = Kvantti-PNT-demonstraattoritutkimus

js-cat-quantum-time-transfer-question = Mitä luotettu kvanttiajoitus tuo klassiseen CSAC + RF -ketjuun verrattuna? (mallinnettu)

js-cat-quantum-time-transfer-title = Kvanttiajansiirto

js-cat-quantum-trade-question = Minkä ajoitus- ja inertiaholdoverin ehdokaskello tuo klassiseen lähtötasoon verrattuna? (mallinnettu)

js-cat-quantum-trade-title = Kvantti-PNT-vaihtoehtovertailu

js-cat-rail-tunnel-coast-question = Kuinka pian taktisen luokan INS poistuu budjetistaan 160 km/h:n nopeudella tunnelin läpi? (mallinnettu)

js-cat-rail-tunnel-coast-title = Juna tunnelin läpi

js-cat-realtime-frame-eop-question = Kuinka suuren koordinaatistovirheen reaaliaikainen (ennustettu) Maan asento aiheuttaa? (mallinnettu)

js-cat-realtime-frame-eop-title = Reaaliaikainen koordinaatisto/EOP

js-cat-reentry-question = Minkä huippu-g:n ja huippulämmityksen nopeuden ballistinen paluu ilmakehään näkee?

js-cat-reentry-title = Paluukäytävä

js-cat-slot-timing-ocxo-leo-question = Kuinka kauan uunistabiloitu kideoskillaattori matalan kiertoradan pienessä satelliitissa pysyy aikaikkunansa suojavälin sisällä viimeisen GNSS-paikkaratkaisun jälkeen? (mallinnettu)

js-cat-slot-timing-ocxo-leo-title = Aikaikkunan ajoitus

js-cat-small-uas-jammed-nav-question = Kun häirintälähetin vie GNSS:n pois, kuinka paljon lennonohjainluokan inertiayksikkö ajautuu verrattuna taktisen luokan yksikköön?

js-cat-small-uas-jammed-nav-title = Pieni drooni häirinnän alla

js-cat-solar-system-tour-question = Missä on jokainen moottorin tuntema kappale Auringosta Plutoon ja suuriin kuihin, ja kuinka kauan valo kulkee niiden välillä?

js-cat-solar-system-tour-title = Aurinkokunta yhtenä epookkina

js-cat-space-packet-question = Koodautuuko ja dekoodautuuko CCSDS 133.0 -pakettivirta bitintarkasti?

js-cat-space-packet-title = Space Packet

js-cat-space-weather-question = Miten aurinko- ja geomagneettinen aktiivisuus muuttaa termosfäärin tiheyttä? (mallinnettu)

js-cat-space-weather-title = Avaruussää

js-cat-spoof-attack-question = Havaitaanko kasvava aikaharhautus ennen kuin se saavuttaa määrityksen?

js-cat-spoof-attack-title = Harhautuksen havaitseminen

js-cat-spoof-detect-question = Voiko yhdistetty RF- ja mittaustarkkailija havaita koordinoidun harhautuksen?

js-cat-spoof-detect-title = Monikerroksinen harhautuksen havaitseminen

js-cat-spoof-meaconing-question = Kuinka usein kellotuettu energiailmaisin havaitsee harhautuksen kiinteällä väärien hälytysten tasolla, kun hyökkäyksen muoto on nimetty?

js-cat-spoof-meaconing-title = Harhautusilmaisimen tilastot

js-cat-starlink-sop-doppler-positioning-question = Kuinka hyvin vastaanotin voi paikantaa itsensä laajakaistatähdistön Dopplerista, kun tähdistö ei lähetä navigointiviestiä? (mallinnettu)

js-cat-starlink-sop-doppler-positioning-title = Laajakaistaiset opportunistiset signaalit

js-cat-sweep-clock-stability-question = Miten holdover muuttuu, kun yhtä kellon parametria pyyhkäistään?

js-cat-sweep-clock-stability-title = Parametripyyhkäisy

js-cat-sweep-nd-inertial-question = Miten ansioarvo vaihtelee monen parametrin ruudukon yli?

js-cat-sweep-nd-inertial-title = N-ulotteinen pyyhkäisy

js-cat-telecom-prtc-holdover-24h-question = Pysyykö rubidiumvertailu, joka menettää GNSS:n 24 tunniksi, ITU-T-aikavirhemaskien sisällä? (mallinnettu)

js-cat-telecom-prtc-holdover-24h-title = Telealan holdover, 24 h

js-cat-telecom-synce-eec-question = Pysyykö vapaasti käyvä uunistabiloitu oskillaattori synkronisen Ethernetin laitekellon vaellusmaskien sisällä? (mallinnettu)

js-cat-telecom-synce-eec-title = Taajuussynkronointi SyncE-maskeja vasten

js-cat-telecom-tie-ingest-question = Läpäiseekö aikavälivirhetallenne ITU-T:n MTIE- ja TDEV-maskit?

js-cat-telecom-tie-ingest-title = Telealan maskitarkistus, sinun datasi

js-cat-terrain-nav-question = Voiko korkeusmittari korjata INS-ajautumaa sovittamalla maaston korkeusprofiilia?

js-cat-terrain-nav-title = Maastonavigointi

js-cat-terrain-slam-question = Voiko hiukkassuodatin seurata ajassa vaihtelevaa INS-ajautumaa maastokarttaa vasten?

js-cat-terrain-slam-title = Maasto-SLAM

js-cat-time-transfer-budget-question = Mitä aseman, transponderin, ionosfäärin ja Sagnac-termit tekevät kaksisuuntaiselle aikaerolle, ja mikä on sen epävarmuusbudjetti? (mallinnettu)

js-cat-time-transfer-budget-title = Kaksisuuntainen satelliittiajansiirto

js-cat-timetransfer-question = Kuinka tiukasti kaksi paikkaa pysyy synkronoituna linkin yli?

js-cat-timetransfer-title = Ajansiirto

js-cat-tracking-loop-question = Millä C/N0:lla vastaanotin todella menettää lukituksen, ja voiko harhauttaja vetää silmukat mukaansa? (mallinnettu)

js-cat-tracking-loop-title = Seurantasilmukka

js-cat-xona-pulsar-end-to-end-question = Sama ketju julkisilla Xona Pulsar -luvuilla: signaali, ylilento, viesti, fuusioitu paikkaratkaisu ja tarkka paikannus. (mallinnettu)

js-cat-xona-pulsar-end-to-end-title = Päästä päähän, Xona Pulsar

js-cat-xona-pulsar-signals-question = Kuinka tarkasti vastaanotin voi mitata etäisyyden julkaistuilla X1- ja X5-signaaleilla, ja kuinka suuri on hankintahaku? (julkinen signaalitaulukko)

js-cat-xona-pulsar-signals-title = Xona Pulsar -signaalit

js-geo-a-place = Paikka…

js-geo-axis-east = I +{ $ext } m

js-geo-axis-north = P +{ $ext } m

js-geo-canyon-needs = Katukanjonin muoto vaatii moottorin 0.36.

js-geo-canyon-out-of-range = Katukanjonin arvot ovat alueen ulkopuolella (atsimuutti 0–359.9°, leveys 1–200 m, korkeudet 0–500 m, antenni 0–50 m); käytetään avointa horisonttia.

js-geo-canyon-reduced = Moottorin supistus kanjonista 360 lokeron taulukoksi.

js-geo-compute-failed = Moottori ei voinut laskea tätä taivasta: { $reason }

js-geo-computing = Lasketaan…

js-geo-copy-link = Kopioi tämä linkki: { $url }

js-geo-count-below = Horisontin alapuolella

js-geo-count-hidden = Horisonttiviivan peitossa

js-geo-count-in-view = Näkyvissä

js-geo-count-open-sky = Avoin taivas

js-geo-count-used = Ratkaisussa

js-geo-cursor-live = Atsimuutti { $az }°, horisonttiviiva { $el }°.

js-geo-dated-sky = Päivätty taivas on vain niin hyvä kuin elementit ja niiden ikä; esiasetukset on jätetty pois.

js-geo-dop-geometric = geometrinen

js-geo-dop-geometric-title = geometrinen tarkkuuden heikkenemiskerroin

js-geo-dop-horizontal = vaakasuora

js-geo-dop-horizontal-title = vaakasuora tarkkuuden heikkenemiskerroin

js-geo-dop-position = paikka, 3D

js-geo-dop-position-title = paikan, 3D tarkkuuden heikkenemiskerroin

js-geo-dop-time = aika

js-geo-dop-time-title = ajan tarkkuuden heikkenemiskerroin

js-geo-dop-vertical = pystysuora

js-geo-dop-vertical-title = pystysuora tarkkuuden heikkenemiskerroin

js-geo-east = I

js-geo-engine-not-running = Moottori ei toimi tässä selaimessa ({ $reason }).

js-geo-err-geometry-object = moottorin geometriavastaus ei ole objekti

js-geo-err-mc-object = moottorin Monte Carlo -vastaus ei ole objekti

js-geo-err-no-sentences = moottorin vastauksessa ei ole lauseita

js-geo-err-reply-kind-not-json = moottorin { $what }-vastaus ei ollut JSON-muodossa

js-geo-err-reply-not-json = moottorin vastaus ei ollut JSON-muodossa

js-geo-error-line = Kun σ_UERE = { $uere } m, ilmoitetun virhemallin mukaan (moottorin luvut): { $bits }.

js-geo-error-line-needs = Paikkavirhe ≈ σ_UERE × HDOP vaakasuunnassa ja σ_UERE × VDOP pystysuunnassa; luku vaatii moottorin 0.36.

js-geo-error-rms-3d = 3D RMS σ_UERE × PDOP = { $m } m

js-geo-error-rms-h = vaakasuora RMS σ_UERE × HDOP = { $m } m

js-geo-error-sigma = 1-sigma-virhe itään { $east } m, pohjoiseen { $north } m

js-geo-fact-ellipse-1s = Ellipsi, 1-sigma

js-geo-fact-ellipse-1s-value = { $major } m × { $minor } m, pääakseli { $deg }° pohjoisesta

js-geo-fact-ellipse-pct = Ellipsi, { $pct } %

js-geo-fact-ellipse-pct-scaled = { $major } m × { $minor } m (1-sigma × { $k })

js-geo-fact-ellipse-pct-value = { $major } m × { $minor } m

js-geo-fact-inside = 95 %:n ellipsin sisällä

js-geo-fact-inside-value = { $pct } % pisteistä

js-geo-fact-line = { $key }: { $value }.

js-geo-fact-mc = Monte Carlo

js-geo-fact-mc-value =
    { $n ->
        [one] { $n } pienimmän neliösumman ratkaisu, siemenluku { $seed }
       *[other] { $n } pienimmän neliösumman ratkaisua, siemenluku { $seed }
    }

js-geo-fact-rms-3d = Pilven RMS, 3D

js-geo-fact-rms-3d-beside = { $rms } m, verrattuna arvoon σ_UERE × PDOP = { $predicted } m

js-geo-fact-rms-h = Pilven RMS, vaakasuora

js-geo-fact-rms-h-beside = { $rms } m, verrattuna arvoon σ_UERE × HDOP = { $predicted } m

js-geo-fact-rms-value = { $rms } m

js-geo-gj-not-geojson = { $name }: ei GeoJSON (odotettiin FeatureCollection-, Feature- tai geometriaobjektia).

js-geo-gj-not-json = { $name }: ei JSON ({ $reason }).

js-geo-gj-not-object = { $name }: ei GeoJSON-objekti.

js-geo-gj-too-many =
    { $count ->
        [one] { $name }: { $count } kohde; tämä sivu piirtää enintään { $max }.
       *[other] { $name }: { $count } kohdetta; tämä sivu piirtää enintään { $max }.
    }

js-geo-legend-item = { $label }: { $used } / { $total } ratkaisussa

js-geo-link-copied = Linkki kopioitu.

js-geo-link-copied-no-tle = Linkki kopioitu (ilman liittämiäsi elementtejä: linkki avaa esiasetukset).

js-geo-mc-off = Pois

js-geo-missing-ellipse = virhe-ellipsi

js-geo-missing-gdop = GDOP

js-geo-missing-leo = LEO

js-geo-missing-monte-carlo = Monte Carlo -pilvi

js-geo-missing-open-sky = avoimen taivaan osuus

js-geo-missing-skyline = horisonttiviiva

js-geo-missing-tdop = TDOP

js-geo-needs = vaatii moottorin 0.36

js-geo-needs-cap = Vaatii moottorin 0.36

js-geo-no = Ei

js-geo-no-ellipse = Ei ellipsiä

js-geo-no-sats = Ei näytettäviä satelliitteja.

js-geo-north = P

js-geo-not-given = ei annettu

js-geo-note-elements-skipped =
    { $count ->
        [one] { $count } elementtijoukko ohitettiin: { $list }.
       *[other] { $count } elementtijoukkoa ohitettiin: { $list }.
    }

js-geo-note-latitude-limited = Tämä moottoriversio mallintaa paikat 89° sisällä päiväntasaajasta; leveysaste rajattiin siihen.

js-geo-note-leo-left-out = LEO: vaatii moottorin 0.36; jätetty pois.

js-geo-note-no-engine = Moottori ei toimi tässä selaimessa, joten näytettävää ei ole. Se toimii WebAssemblyna; selain tai isäntä, joka estää WebAssemblyn, ei voi ajaa tätä näkymää.

js-geo-note-pick-one = Valitse vähintään yksi: GPS, Galileo ja BeiDou.

js-geo-note-skyline-not-applied = Horisonttiviiva piirretään mutta ei oteta käyttöön: sen käyttöönotto vaatii moottorin 0.36. Sen takana olevat satelliitit lasketaan tässä silti mukaan.

js-geo-note-skyline-source = Horisonttiviiva: { $source }.

js-geo-note-training-model = Moottorin { $version } harjoitustaivasmalli (nmea_training) hetkellä { $instant }: kulmat kokonaisina asteina ja DOP:t yhden desimaalin tarkkuudella, kuten vastaanottimen lauseet ne kantavat; paikkaratkaisu käyttää enintään 12 satelliittia, jotka on valittu signaalin voimakkuuden mukaan.

js-geo-note-unknown-systems =
    { $count ->
        [one] { $count } sellaisen järjestelmän satelliittitietue, jota tämä näkymä ei piirrä, jätettiin pois.
       *[other] { $count } sellaisen järjestelmän satelliittitietuetta, jota tämä näkymä ei piirrä, jätettiin pois.
    }

js-geo-off-leo = LEO: vaatii moottorin 0.36.

js-geo-off-monte-carlo = Monte Carlo -pilvi vaatii moottorin 0.36.

js-geo-off-skyline = Horisonttiviivan käyttöönotto vaatii moottorin 0.36: tässä se vain piirretään.

js-geo-offset-own = Poikkeama omien elementtiesi epookista ({ $epoch })

js-geo-offset-ref = Poikkeama satelliittitähdistöjen vertailuepookista

js-geo-open-sky-share = { $pct } % ylemmästä puolipallosta

js-geo-out-of-range = Alueen ulkopuolella, joten pidetty viimeisessä hyvässä arvossa: { $names }.

js-geo-own-elements-at = Omat elementtisi epookissa { $epoch }.

js-geo-pick-constellation = Valitse vähintään yksi satelliittitähdistö.

js-geo-place-geiranger = Geirangerfjord, Norja

js-geo-place-manhattan = Midtown Manhattan, Yhdysvallat

js-geo-place-oslo = Oslon satama, Norja

js-geo-place-rotterdam = Rotterdamin satama, Alankomaat

js-geo-place-singapore = Singaporensalmi

js-geo-place-tallinn = Tallinnan satama, Viro

js-geo-place-tromso = Tromssa, Norja

js-geo-plot-desc =
    { $total ->
        [one] Kaaviossa { $total } satelliitti, ratkaisussa { $used }.
       *[other] Kaaviossa { $total } satelliittia, ratkaisussa { $used }.
    }

js-geo-preset-illustrative = Tämän sivun piirtämä havainnollistava ääriviiva; horisonttiviivan käyttöönotto vaatii moottorin 0.36.

js-geo-ready = Valmis.

js-geo-ready-needs = Valmis. Vaatii moottorin 0.36: { $list }.

js-geo-sat-masked = { $label } { $id }: atsimuutti { $az }°, korkeuskulma { $el }°, horisonttiviivan peitossa

js-geo-sat-unused = { $label } { $id }: atsimuutti { $az }°, korkeuskulma { $el }°, ei käytössä

js-geo-sat-used = { $label } { $id }: atsimuutti { $az }°, korkeuskulma { $el }°, ratkaisussa

js-geo-scenarios-under = Moottorin skenaariot tämän horisonttiviivan alla:

js-geo-sky-canyon = Katukanjoni

js-geo-sky-drawn = Piirretty taivaskarttaan

js-geo-sky-open = Avoin horisontti

js-geo-sky-preset = Esiasetus: { $name }

js-geo-sky-source = Taivas: { $source }.

js-geo-skyline-city-street = Kaupungin katu

js-geo-skyline-container = Konttiterminaali

js-geo-skyline-fjord = Vuono

js-geo-skyline-harbour = Satamaan saapuminen

js-geo-skyline-load-failed = Horisonttiviivaa ei voitu ladata ({ $reason }).

js-geo-skyplot-downloaded = Taivaskartta ladattu.

js-geo-skyplot-export-failed = Taivaskarttaa ei voitu viedä ({ $reason }).

js-geo-source-geometry = Kshana-moottori { $version }, sky_geometry

js-geo-source-line = { $source }.

js-geo-source-training = Kshana-moottori { $version }, harjoitustaivasmalli

js-geo-south = E

js-geo-style-own-elements = Omat elementtisi

js-geo-svg-refused = moottorin SVG hylättiin

js-geo-table-count =
    { $n ->
        [one] { $n } satelliitti, sama kuin taivaskartassa.
       *[other] { $n } satelliittia, sama kuin taivaskartassa.
    }

js-geo-tle-epoch = Anna UTC-epookki väliltä 2000–2099.

js-geo-tle-paste-first = Liitä ensin yksi tai useampi kaksirivinen elementtijoukko.

js-geo-tle-too-large = Liitetyt elementit ovat suurempia kuin 4 MiB, moottorin syötteen raja.

js-geo-used-masked = Ei: horisonttiviivan peitossa

js-geo-using-own = Käytetään omia elementtejäsi. Linkki kertoo vain, että käytit niitä, ei itse elementtejä.

js-geo-wasm-blocked = WebAssembly on estetty

js-geo-west = L

js-geo-why = Miksi

js-geo-why-interim = Virhe-ellipsi ja Monte Carlo -pilvi vaativat moottorin 0.36 (sen sky_geometry- ja sky_monte_carlo-funktiot); tämän sivun moottori on vanhempi.

js-geo-why-no-ellipse = Moottori ei antanut ellipsiä tälle geometrialle (liian vähän satelliitteja paikkaratkaisuun tai singulaarinen geometria).

js-geo-why-no-ellipse-reason = Moottori ei antanut ellipsiä tälle geometrialle (liian vähän satelliitteja paikkaratkaisuun tai singulaarinen geometria): { $reason }.

js-geo-why-waiting = Odotetaan moottoria.

js-geo-yes = Kyllä

js-hold-axis-seconds = sekuntia ensimmäisestä näytteestä

js-hold-axis-tau = havaintoaika τ, s (log)

js-hold-axis-te = aikavirhe, ns

js-hold-band-title = Toipumiskaista ±{ $band } ns

js-hold-blurb-example = Näytteet 5 s välein: 600 s lukittuna, GNSS poistetaan hetkellä 600 s, holdover, GNSS palautetaan hetkellä 2400 s. Tallenne on tuotettu esimerkkiä varten; se ei ole mittaus.

js-hold-blurb-ptp4l = Samat neljä vaihetta luettuna ptp4l-servolokista (demonin oma poikkeama, ns). Loki on kirjoitettu esimerkkiä varten; mitään demonia ei ajettu.

js-hold-budget-exceeded = { $name } ylittyi ensimmäisen kerran { $s } s poiston jälkeen

js-hold-chip-baseline = Lähtötaso maskeja vasten

js-hold-chip-envelope = ePRTC-A-holdoverin verhokäyrä

js-hold-chip-holdover = Holdover maskeja vasten

js-hold-chip-measured = mitattu maskia vasten

js-hold-chip-recovery = Toipuminen

js-hold-chip-words = Sanat

js-hold-curve-title = { $step }: { $which }, ns

js-hold-curves-aria = { $which } suhteessa havaintoaikaan, maskirajoineen

js-hold-envelope-exceeded = ePRTC-A-holdoverin verhokäyrä ylittyi ensimmäisen kerran { $s } s poiston jälkeen

js-hold-envelope-exceeded-short = { $verdict }, ylittyi ensimmäisen kerran { $s } s poiston jälkeen (tallenne on lyhyempi kuin verhokäyrän jakso)

js-hold-envelope-exceeded-value = { $verdict }, ylittyi ensimmäisen kerran { $s } s poiston jälkeen

js-hold-envelope-short = { $verdict } (tallenne on lyhyempi kuin verhokäyrän jakso)

js-hold-file-error = { $name }: { $error }.

js-hold-file-not-json = { $name }: ei JSON.

js-hold-file-read-here = { $name }, luettu tässä; mitään ei lähetetty minnekään.

js-hold-file-too-large = { $name } on suurempi kuin mitä tämä sivu lukee.

js-hold-from-record = tuloksen tallenteesta

js-hold-from-record-decimated = tuloksen tallenteesta, harvennettuna { $have } / { $total } näytteeseen

js-hold-gnss-removed = GNSS poistettu

js-hold-gnss-removed-stated = GNSS poistettu (operaattorin ilmoittama)

js-hold-gnss-restored = GNSS palautettu

js-hold-gnss-restored-stated = GNSS palautettu (operaattorin ilmoittama)

js-hold-largest-at = { $value } hetkellä T+{ $time } s

js-hold-limit-label = ±{ $ns } ns { $step }-maski

js-hold-limit-title = { $id }: ±{ $ns } ns, suurin absoluuttinen aikavirhe vaiheessa { $step }

js-hold-mark-title = { $id } raja { $limit } ns kohdassa τ { $tau } s ({ $verdict }; { $source })

js-hold-marker-time = { $name }, T+{ $time } s

js-hold-na = ei saatavilla

js-hold-no-curve = Ei aikavirhekäyrää: tallennetta ei voitu toistaa piirtämistä varten.

js-hold-no-which-curve = Tässä tuloksessa ei ole käyrää: { $which }.

js-hold-not-exceeded = ei ylitetty

js-hold-not-recovered = ei pysynyt kaistan sisällä

js-hold-not-result = tämä ei ole holdover-testin tulos

js-hold-open-failed = Kohdetta { $title } ei voitu avata: { $reason }.

js-hold-opening = Avataan: { $title }…

js-hold-phase-baseline = Lähtötaso: lukittuna

js-hold-phase-holdover = Holdover: GNSS poistettu

js-hold-phase-recovery = Toipuminen: GNSS palautettu

js-hold-phase-title = { $phase }, T+{ $from }–{ $to } s

js-hold-read-failed = Ei voitu lukea tai piirtää ({ $reason }).

js-hold-recorded = { $title }: moottorin tallennettu tulos (versio { $version }).

js-hold-recovered = ±{ $band } ns:n sisällä { $dwell } s ajan, { $after } s GNSS:n paluun jälkeen

js-hold-result-not-json = tulos ei ole JSON-muodossa ({ $reason })

js-hold-result-not-loaded = tallennettua tulosta ei ladattu

js-hold-row-envelope = ePRTC-A-holdoverin verhokäyrä

js-hold-row-frequency = Pidetty taajuuspoikkeama (sovitettu kulmakerroin)

js-hold-row-largest = Suurin absoluuttinen aikavirhe

js-hold-row-length = Holdoverin pituus

js-hold-row-margin = Pienin marginaali verhokäyrän sisällä

js-hold-row-peak = Huippu palautuksen jälkeen

js-hold-row-recovery = Toipuminen

js-hold-row-recovery-step = Suurin askel toipumisen aikana

js-hold-row-residual = Jäännös tämän suoran ympäri (rms)

js-hold-row-step = Askel poiston hetkellä

js-hold-status-final = { $status } { $label }; mitattu maskia vasten.

js-hold-step-span = T+{ $from }–{ $to } s

js-hold-te-aria = Aikavirhe tallenteen yli, vaiheineen ja maskirajoineen

js-hold-te-line-title = Aikavirhe, ns

js-hold-te-note = Aikavirhe lähteestä { $from }. Kaksi ajanhetkeä ilmoitti { $by }.

js-hold-th-budget = Budjetti

js-hold-th-budget-limit = Raja |TE|, ns

js-hold-th-first-exceeded = Ensimmäinen ylitys poiston jälkeen, s

js-hold-th-largest = Suurin |TE|, ns

js-hold-th-limit = Raja, ns

js-hold-th-margin = Marginaali, ns

js-hold-th-mask = Maski

js-hold-th-mean = Keskiarvo, ns

js-hold-th-measured-on = Mitattu kohteella

js-hold-th-metric = Mittari

js-hold-th-rms = RMS, ns

js-hold-th-samples = Näytteet

js-hold-th-source = Lähde

js-hold-th-span = Jänne

js-hold-th-step = Vaihe

js-hold-th-value = Arvo, ns

js-hold-th-verdict = Tuomio

js-hold-th-worst-at = Pahin kohdassa τ tai T+, s

js-hold-title-example = Aikavirhetallenne

js-hold-title-ptp4l = linuxptp-loki

js-hold-why-no-samples = tulos ei sisällä aikavirhenäytteitä (record.series), joten käyrää ei piirretä

js-hold-why-not-series = tuloksen sarja ei ole aikasarja (alle kaksi näytettä tai aika ei kasva), joten käyrää ei piirretä

js-hold-why-sentence = { $why }.

js-hold-why-too-many = tuloksen sarjassa on { $have } näytettä, kun moottori pisteytti { $scored }, joten käyrää ei piirretä

js-interf-attribution = Attribuutio

js-interf-build-failed = { $name }: ei voitu rakentaa ({ $reason }).

js-interf-built-day-maps =
    { $n ->
        [one] Rakennettiin { $n } vuorokausikartta lähteestä { $name } moottorilla { $version } tässä selaimessa.
       *[other] Rakennettiin { $n } vuorokausikarttaa lähteestä { $name } moottorilla { $version } tässä selaimessa.
    }

js-interf-built-detail = { $date }: { $published } solua julkaistu, { $flagged } merkitty

js-interf-built-from-sample = Rakennettu synteettisestä { $kind }-näytteestä moottorilla tässä selaimessa. Keksittyjä ilmoituksia; ei todellista ilma-alusta, alusta eikä päivää.

js-interf-built-maps =
    { $n ->
        [one] Rakennettiin { $n } kartta ({ $detail }). Vain koonti: merkitty solu ei nimeä häirintää syyksi.
       *[other] Rakennettiin { $n } karttaa ({ $detail }). Vain koonti: merkitty solu ei nimeä häirintää syyksi.
    }

js-interf-built-none = { $name }: moottori ei rakentanut karttaa.

js-interf-caveat-coverage = Kattavuus seuraa datalähdettä; lue kattavuushuomautukset.

js-interf-caveat-no-colour = Solua, jolla ei ole väriä, ei havaittu. Se ei ole todiste siitä, että alue oli vapaa.

js-interf-caveat-not-finding = Heikentynyt tai poikkeava solu ei ole havainto häirinnästä. Muitakin syitä on.

js-interf-caveat-past-reports = Tämä on kuvaus aiemmista paikkailmoituksista, ei ennuste eikä minkään vastaanottimen mittaus.

js-interf-caveats = Varaumat

js-interf-cell-size-rule = Solun koon on oltava asteluku, joka on suurempi kuin 0 ja enintään 10, tai tyhjä arvolle 0.5.

js-interf-check-failed = { $name }: ei voitu tarkistaa ({ $reason }).

js-interf-click-cell = Napsauta solua tai kohdista kartta ja käytä nuolinäppäimiä nähdäksesi sen luvut.

js-interf-close = Sulje

js-interf-close-file = Sulje { $name }

js-interf-col-affected = Vaikutuksen alaiset

js-interf-col-cell-area = Solun ala

js-interf-col-detectors = Ilmaisimet

js-interf-col-observed = Havaitut

js-interf-col-sampled = Otannassa

js-interf-col-share = Osuus

js-interf-col-status = Tila

js-interf-coverage-limits = Tämän lähteen kattavuuden rajat

js-interf-csv-too-big = { $name }: suurempi kuin 24 MiB; muodosta ote tiedostosta (komentorivityökalu käsittelee koko tiedoston).

js-interf-csv-too-big-short = { $name }: suurempi kuin 24 MiB; muodosta ote tiedostosta.

js-interf-custom-needs-licence = Oma aineisto tarvitsee lisenssin, sen URL-osoitteen ja tekijätietotekstin: ne kirjoitetaan karttatiedostoon.

js-interf-dataset = Aineisto

js-interf-dates-rule = Päivämäärät ovat muodossa YYYY-MM-DD, tai tyhjä, jos rajaa ei ole.

js-interf-day = Päivä

js-interf-day-aria = { $kind }-päivä

js-interf-day-confounded-note = Tämä päivä on sekoittunut: yhtäkään solua ei merkitty heikentyneeksi päivän taustatason vuoksi. Solut, jotka muuten olisivat erottuneet, näytetään arvioimattomina.

js-interf-day-figures-aria = Päivän luvut

js-interf-demo-csv-name = { $file } (synteettinen näyte)

js-interf-demo-failed = Esittelyä ei voitu avata: { $reason }.

js-interf-demo-opened = Synteettinen esittely: kolme keksittyä tiedostoa keksityltä avomeren alueelta (kaksi ADS-B-päivää, joista toinen sekoittunut, ja yksi AIS-päivä). Niiden takana ei ole todellista ilma-alusta, alusta tai päivää. Käytä päivänvalitsinta ADS-B-tasolla.

js-interf-demo-route-name = route.csv (synteettinen)

js-interf-describe-map = { $kind }-kartta päivälle { $date }: piirretty { $cells } solua, { $parts }. Piirtämättömiä soluja ei havaittu.

js-interf-did-not-load = { $url } ei latautunut

js-interf-engine-no-fn = Tässä moottoriversiossa (versio { $version }) ei ole toimintoa { $fn }; se on tätä sivua vanhempi. Komentorivin vastine on Työkalut-sivulla.

js-interf-engine-start-failed = Moottoria ei voitu käynnistää tässä ({ $reason }). Karttatiedostojen avaaminen yllä toimii silti.

js-interf-err-format-version = { $name }: ei tuettu Kshana-häiriökartta (format_version { $version }; tämä sivu tukee: { $supported }).

js-interf-err-no-rows = { $name }: tässä raportissa ei ole rows[]-taulukkoa.

js-interf-err-not-json = { $name }: ei JSON-tiedosto ({ $reason }).

js-interf-err-not-map = { $name }: tämä on GeoJSON mutta ei Kshana-häiriökartta (ei kshana_interference_map-jäsentä).

js-interf-err-not-route = { $name }: ei Kshana-reittialtistusraportti (ei kshana_route_exposure-jäsentä).

js-interf-err-route-schema = { $name }: skeema { $schema } ei ole { $expected }, jota tämä sivu lukee.

js-interf-err-source-kind = { $name }: source_kind { $kind } ei ole adsb eikä ais.

js-interf-err-unknown-schema = { $name }: tuntematon skeema { $schema }; tämä sivu lukee: { $supported }.

js-interf-foot-attribution = Tekijätiedot: { $text }

js-interf-foot-coverage = Kattavuus: { $notes }

js-interf-foot-layer = { $kind }-taso, { $date }. Piirtämättömiä soluja ei havaittu.

js-interf-foot-licence = Lisenssi: { $licence }

js-interf-foot-licence-url = Lisenssi: { $licence } ({ $url })

js-interf-grid = Ruudukko: neliömäisiä soluja, joiden koko on { $size }° leveys- ja pituusasteessa ({ $type }). Itä–länsisuuntainen leveys kapenee leveysasteen mukana.

js-interf-guards = Suojat muita syitä vastaan

js-interf-input = Syöte

js-interf-land-set = Maapolygonit: { $name }.

js-interf-land-too-big = Tämä maatiedosto on suurempi kuin 24 MiB.

js-interf-larger-than = { $name }: suurempi kuin { $limit }; tämä sivu lukee karttatiedostoja enintään tuon kokoon asti.

js-interf-layer-adsb-sub = solut, joissa ilma-alukset ilmoittivat heikon navigointitarkkuuden

js-interf-layer-ais-sub = solut, joissa alukset ilmoittivat epätodennäköisiä paikkoja tai liikettä

js-interf-layer-heading = { $kind }-taso

js-interf-layer-hidden = { $kind }-taso on piilotettu.

js-interf-layers-separate = ADS-B ja AIS ovat erillisiä tasoja, joilla on omat kytkimensä, selitteensä ja lisenssirivinsä. Niitä ei koskaan yhdistetä yhdeksi värikentäksi tai yhdeksi luvuksi.

js-interf-legend-aria = Mitä kukin solun tila tarkoittaa; poista valinta, niin kyseiset solut himmennetään

js-interf-licence = Lisenssi

js-interf-licence-aria = Tiedoston { $name } datan lisenssi

js-interf-licence-heading = Datan lisenssi ja tekijätiedot

js-interf-map-aria = { $summary } Nuolinäppäimillä siirrytään piirrettyjen solujen välillä.

js-interf-maps-open =
    { $n ->
        [one] { $n } kartta auki.
       *[other] { $n } karttaa auki.
    }

js-interf-method-summary = Menetelmä ja varaumat

js-interf-no-cell-at = Ei solua kohdassa { $lat }, { $lon }: ei havaittu. Se ei ole todiste siitä, että alue oli vapaa.

js-interf-no-cell-drawn = solua ei piirretty

js-interf-no-cells-draw = Tässä tiedostossa ei ole piirrettäviä soluja.

js-interf-no-day-figures = Tämä tiedosto ei ilmoita päiväkohtaisia lukuja.

js-interf-no-file-opened = Tiedostoa ei voitu avata.

js-interf-no-file-text = Avoimissa kartoissa ei ole tarkistettavaa tiedostotekstiä (niitä ei avattu tiedostoina).

js-interf-none = ei yhtään

js-interf-none-stated = (ei ilmoitettu)

js-interf-none-stated-file = (ei ilmoitettu tässä tiedostossa)

js-interf-north-abbr = N

js-interf-not-evaluated = ei arvioitu

js-interf-not-opened-full = { $name }: ei avattu, koska { $max } karttaa on jo auki. Sulje ensin joitakin.

js-interf-nothing-open = Mitään ei ole vielä auki.

js-interf-nothing-opened = Mitään ei avattu.

js-interf-one-day = yksi päivä kerrallaan

js-interf-opened-file-map = Avattu { $files } tiedosto; { $maps } kartta auki.

js-interf-opened-file-maps = Avattu { $files } tiedosto; { $maps } karttaa auki.

js-interf-opened-files-map = Avattu { $files } tiedostoa; { $maps } kartta auki.

js-interf-opened-files-maps = Avattu { $files } tiedostoa; { $maps } karttaa auki.

js-interf-opening-demo = Avataan synteettistä esittelyä…

js-interf-parameters = Parametrit, kiinnitetty ennen kuin dataa luettiin

js-interf-read-draw-failed = { $name }: ei voitu lukea tai piirtää ({ $reason }).

js-interf-read-failed = { $name }: ei voitu lukea ({ $reason }).

js-interf-read-with-map = Lue tämä kartan kanssa

js-interf-reading = Luetaan…

js-interf-route-aria = Reittialtistus { $name }

js-interf-route-chip = Reitti

js-interf-route-done =
    { $n ->
        [one] Reittialtistus laskettu { $n } kartasta moottorilla { $version }; raportti näkyy alla.
       *[other] Reittialtistus laskettu { $n } kartasta moottorilla { $version }; raportti näkyy alla.
    }

js-interf-route-explain = Reitin pituuden osuus kussakin tilassa, päivää ja lähdettä kohti. Neljän osuuden summa on 1, ja ne luetaan yhdessä: matala heikentyneiden osuus yhdessä korkean havaitsemattomien osuuden kanssa ei ole osoittanut aluetta vapaaksi. ADS-B- ja AIS-rivejä ei koskaan yhdistetä.

js-interf-route-exposure = Reittialtistus

js-interf-route-needs-map = Avaa tai muodosta ensin vähintään yksi kartta: reitti tarkistetaan tämän sivun karttoja vasten.

js-interf-route-open-failed = Reittiä ei voitu avata: { $reason }.

js-interf-route-range = { $from } – { $to }

js-interf-route-too-big = { $name }: suurempi kuin 24 MiB.

js-interf-row-affected-share = Vaikutuksen alaisten osuus

js-interf-row-aircraft-affected = Vaikutuksen alaiset ilma-alukset

js-interf-row-aircraft-observed = Havaitut ilma-alukset

js-interf-row-aircraft-sampled = Otannassa olleet ilma-alukset

js-interf-row-area = Ala

js-interf-row-cell = Solu

js-interf-row-detectors = Ehdot täyttäneet ilmaisimet

js-interf-row-flagged = Merkitty: { $detector }

js-interf-row-status = Tila

js-interf-row-vessels-observed = Havaitut alukset

js-interf-rows-skipped =
    { $count ->
        [one] { $count } rivi ei ollut kelvollinen ja se ohitettiin.
       *[other] { $count } riviä ei ollut kelvollisia ja ne ohitettiin.
    }

js-interf-rt-day = Päivä

js-interf-rt-km = Reitti km

js-interf-rt-licence = Kartan lisenssi ja tekijätiedot

js-interf-rt-shares = Reitin osuudet

js-interf-rt-source = Lähde

js-interf-sample-failed = Näytettä ei voitu avata: { $reason }.

js-interf-save = Tallenna:

js-interf-save-report = Tallenna raportti (JSON)

js-interf-show-layer = Näytä tämä taso

js-interf-st-anomalous-label = Poikkeava

js-interf-st-anomalous-text = Vähintään yksi ilmaisin merkitsi tässä sinä päivänä riittävän monta eri alusta (vähintään 3 alusta ja 20 % havaituista). Mahdollisia syitä ovat häiriö, mutta myös monet tavalliset syyt.

js-interf-st-confounded-label = Päivä sekoittunut

js-interf-st-confounded-text = Koko päivän solujen osuuden mediaani oli korkea, mikä viittaa laaja-alaiseen syyhyn. Yhtäkään solua ei julisteta heikentyneeksi tällaisena päivänä; tämä solu olisi muuten erottunut.

js-interf-st-degraded-label = Heikentynyt

js-interf-st-degraded-text = Suuri osa otannan ilma-aluksista ilmoitti tässä sinä päivänä heikon navigointitarkkuuden, selvästi yli päivän mediaanisolun. Se ei kerro syytä.

js-interf-st-no-background-label = Ei taustatasoarviota

js-interf-st-no-background-text = Päivän taustatasoa (heikkoa tarkkuutta ilmoittavien ilma-alusten tyypillistä osuutta) ei voitu arvioida riittävästä määrästä soluja, joten mitään solua ei verrata siihen eikä yhtäkään arvioida.

js-interf-st-not-anomalous-label = Ei poikkeava

js-interf-st-not-anomalous-text = Havaittu, eikä yksikään ilmaisin täyttänyt ehtoja. Ei todiste siitä, ettei mitään tapahtunut.

js-interf-st-not-degraded-label = Ei heikentynyt

js-interf-st-not-degraded-text = Otannassa, eikä heikkoa tarkkuutta ilmoittavien ilma-alusten osuus erottunut. Ei todiste siitä, ettei mitään tapahtunut.

js-interf-st-too-few-label = Liian vähän ilma-aluksia

js-interf-st-too-few-text = Julkaistu (vähintään 5 eri ilma-alusta havaittu), mutta otantaan saatiin alle 10 ilma-alusta, joten arviota ei tehdä.

js-interf-starting-build = Käynnistetään moottoria ja muodostetaan…

js-interf-starting-route = Käynnistetään moottoria ja tarkistetaan reittiä…

js-interf-state-clear-adsb = Selvä

js-interf-state-clear-adsb-text = Havaittu riittävällä ilma-alusmäärällä, eikä merkitty. Ei todiste siitä, ettei mitään tapahtunut.

js-interf-state-clear-ais = Selvä

js-interf-state-clear-ais-text = Havaittu riittävällä alusmäärällä, eikä merkitty. Ei todiste siitä, ettei mitään tapahtunut.

js-interf-state-degraded-adsb = Heikentynyt

js-interf-state-degraded-adsb-text = Suuri osa otannan ilma-aluksista ilmoitti tässä sinä päivänä heikon navigointitarkkuuden, selvästi yli päivän mediaanisolun.

js-interf-state-degraded-ais = Poikkeava

js-interf-state-degraded-ais-text = Vähintään yksi ilmaisin merkitsi tässä sinä päivänä riittävän monta eri alusta (vähintään 3 alusta ja 20 % havaituista).

js-interf-state-notobs-adsb = Ei havaittu

js-interf-state-notobs-adsb-text = Solua ei piirretty: ilma-aluksia havaittiin liian vähän sen julkaisemiseksi. Tämä ei ole todiste siitä, että alue oli vapaa.

js-interf-state-notobs-ais = Ei havaittu

js-interf-state-notobs-ais-text = Solua ei piirretty: aluksia havaittiin liian vähän sen julkaisemiseksi. Tämä ei ole todiste siitä, että alue oli vapaa.

js-interf-state-unassessed-adsb = Arvioimatta

js-interf-state-unassessed-adsb-text = Havaittu, mutta otantaan saatiin liian vähän ilma-aluksia, päivä oli sekoittunut tai päivän taustatasoa ei voitu arvioida, joten arviota ei tehdä.

js-interf-state-unassessed-ais = Arvioimatta

js-interf-state-unassessed-ais-text = Havaittu, mutta arviota ei tehdä.

js-interf-status-unknown = Tila, jota tämä sivu ei kuvaa.

js-interf-table-first = Soluja näytetään { $shown } / { $total }, merkitsevimmät ensin.

js-interf-table-summary = Jokainen piirretty solu taulukkona ({ $n })

js-interf-the-day = Päivä

js-interf-unknown-date = tuntematon päivämäärä

js-interf-warn-cell-size = Tämä tiedosto käyttää solukokoa { $size }°, joka ei ole ennakkorekisteröity: se ei ole ennakkorekisteröity menetelmä, joten sen arviot eivät ole vertailukelpoisia sitä käyttävien tiedostojen kanssa.

js-interf-warn-cell-size-known = Tämä tiedosto käyttää solukokoa { $size }°, joka ei ole ennakkorekisteröity ({ $registered }°): se ei ole ennakkorekisteröity menetelmä, joten sen arviot eivät ole vertailukelpoisia sitä käyttävien tiedostojen kanssa.

js-interf-warn-day-confounded = Tämä päivä on sekoittunut: yhtäkään solua ei merkitty heikentyneeksi päivän taustatason vuoksi (solun osuuden mediaani oli itsessään korkea).

js-interf-warn-flag-disagrees =
    { $count ->
        [one] { $count } solun ”heikentynyt”-merkintä ei vastaa sen tilaa. Piirretään tila.
       *[other] { $count } solun ”heikentynyt”-merkintä ei vastaa niiden tilaa. Piirretään tila.
    }

js-interf-warn-no-licence = Tässä tiedostossa ei ole tekstiä: { $fields }. Tiedosto näytetään, mutta karttaa, jolla ei ole lisenssiä ja tekijätietoja, ei pidä julkaista uudelleen.

js-interf-warn-on-land-off = Maalla olevien kohteiden ilmaisin oli pois päältä tässä tiedostossa (maapolygoneja ei annettu).

js-interf-warn-skipped =
    { $count ->
        [one] { $count } kohde ei ollut kelvollista GeoJSONia ja se ohitettiin.
       *[other] { $count } kohdetta ei ollut kelvollista GeoJSONia ja ne ohitettiin.
    }

js-interf-warn-unknown-status = Tilaarvot, joita tämä sivu ei tunne: { $values }. Ne piirretään muodossa ”ei arviota”.

js-interf-withheld = pidätetty (alle 5)

js-interf-written-by = kirjoittanut Kshana { $version }

js-kind-axis-3-d-position-error-m = 3D-paikkavirhe (m)

js-kind-axis-c-n0-db-hz = C/N0 (dB-Hz)

js-kind-axis-code-jitter-m = koodin värinä (m)

js-kind-axis-code-tracking-jitter-m = koodinseurannan värinä (m)

js-kind-axis-doppler-shift-hz = Doppler-siirtymä (Hz)

js-kind-axis-effective-c-n0-db-hz = efektiivinen C/N0 (dB-Hz)

js-kind-axis-elevation = korkeuskulma (°)

js-kind-axis-fit-interval-s = sovitusväli (s)

js-kind-axis-formal-position-sigma-m = muodollinen paikan sigma (m)

js-kind-axis-latitude = leveysaste (°)

js-kind-axis-leo-satellites-added-to-the = ratkaisuun lisätyt LEO-satelliitit

js-kind-axis-mean-satellites-in-view = näkyvien satelliittien keskiarvo

js-kind-axis-median-dilution-of-precision = tarkkuuden heikkenemiskertoimen mediaani

js-kind-axis-median-error-m = mediaanivirhe (m)

js-kind-axis-median-pdop = PDOP:n mediaani

js-kind-axis-metres = metriä

js-kind-axis-observation-window-s = havaintoikkuna (s)

js-kind-axis-offset-from-the-signal-s = poikkeama signaalin keskitaajuudesta (MHz)

js-kind-axis-offset-from-the-snapshot-centre = poikkeama otoksen keskitaajuudesta (MHz)

js-kind-axis-pdop = PDOP

js-kind-axis-position-error-m = paikkavirhe (m)

js-kind-axis-power-spectral-density-db-hz = tehospektritiheys (dB/Hz, yksikköteho)

js-kind-axis-power-spectral-density-dbw-hz = tehospektritiheys (dBW/Hz)

js-kind-axis-probability-of-detection = havaitsemistodennäköisyys

js-kind-axis-range-error-m = etäisyysvirhe (m)

js-kind-axis-relays = releet

js-kind-axis-sisre-root-mean-square-m = SISRE, neliökeskiarvo (m)

js-kind-axis-time-error-ns = aikavirhe (ns)

js-kind-axis-time-s = aika (s)

js-kind-axis-time-since-the-start-min = aika alusta (min)

js-kind-axis-update-period-s = päivitysjakso (s)

js-kind-cap-body-pnt-label = Releillä paikannus

js-kind-cap-campaign-label = Kampanja

js-kind-cap-constellation-design-label = Kattavuus

js-kind-cap-leo-navmsg-label = Navigointiviesti

js-kind-cap-leo-pass-label = Ohitus ja yhteys

js-kind-cap-leo-pnt-chain-label = Päästä päähän -ketju

js-kind-cap-leo-ppp-label = Paikannus

js-kind-cap-leo-pvt-label = Paikannus

js-kind-cap-leo-signal-label = Signaalisuunnittelu

js-kind-cap-lunar-llr-datum-label = Laseretäisyysmittauksen vertailupiste

js-kind-cap-ntn-positioning-label = Paikannus

js-kind-cap-solar-system-label = Aurinkokunta

js-kind-cap-spectrum-label = Spektri

js-kind-guided-doppler-error-hz = Doppler-virhe (Hz)

js-kind-guided-duration-s = Kesto (s)

js-kind-guided-earth-range-error-m = Maan etäisyysvirhe (m)

js-kind-guided-elevation-mask = Korkeuskulmamaski (°)

js-kind-guided-first-jammer-bandwidth-mhz = Ensimmäisen häirintälähteen kaistanleveys (MHz)

js-kind-guided-first-jammer-power-dbw = Ensimmäisen häirintälähteen teho (dBW)

js-kind-guided-first-jammer-range-m = Ensimmäisen häirintälähteen etäisyys (m)

js-kind-guided-first-jammer-received-power-dbw = Ensimmäisen häirintälähteen vastaanotettu teho (dBW)

js-kind-guided-first-phase-length-s = Ensimmäisen vaiheen kesto (s)

js-kind-guided-first-shell-altitude-km = Ensimmäisen kuoren korkeus (km)

js-kind-guided-first-shell-inclination = Ensimmäisen kuoren inklinaatio (°)

js-kind-guided-first-signal-bandwidth-hz = Ensimmäisen signaalin kaistanleveys (Hz)

js-kind-guided-first-system-range-error-m = Ensimmäisen järjestelmän etäisyysvirhe (m)

js-kind-guided-fit-interval-s = Sovitusväli (s)

js-kind-guided-gravity-field-degree = Painovoimakentän aste

js-kind-guided-grid-step = Ruudukon askel (°)

js-kind-guided-integration-time-s = Integrointiaika (s)

js-kind-guided-leo-satellites-in-the-sweep = LEO-satelliitit pyyhkäisyssä

js-kind-guided-loop-bandwidth-hz = Silmukan kaistanleveys (Hz)

js-kind-guided-monte-carlo-runs = Monte Carlo -ajot

js-kind-guided-network-synchronisation-error-m = Verkon synkronointivirhe (m)

js-kind-guided-orbit-altitude-km = Radan korkeus (km)

js-kind-guided-orbit-determination-error-m = Radanmäärityksen virhe (m)

js-kind-guided-orbit-inclination = Radan inklinaatio (°)

js-kind-guided-pdop-threshold = PDOP-kynnys

js-kind-guided-peak-elevation-of-the-pass = Ohituksen huippukorkeuskulma (°)

js-kind-guided-points-per-orbit-track = Pisteitä per ratajälki

js-kind-guided-receiver-noise-figure-db = Vastaanottimen kohinaluku (dB)

js-kind-guided-receiver-power-when-awake-mw = Vastaanottimen teho hereillä ollessa (mW)

js-kind-guided-reference-c-n0-db-hz = Vertailu-C/N0 (dB-Hz)

js-kind-guided-relay-altitude-km = Releen korkeus (km)

js-kind-guided-relay-inclination = Releen inklinaatio (°)

js-kind-guided-relay-planes = Releiden ratatasot

js-kind-guided-relay-range-error-m = Releen etäisyysvirhe (m)

js-kind-guided-relays-per-plane = Releitä per ratataso

js-kind-guided-runs-per-case = Ajoja per tapaus

js-kind-guided-satellite-altitude-km = Satelliitin korkeus (km)

js-kind-guided-second-system-range-error-m = Toisen järjestelmän etäisyysvirhe (m)

js-kind-guided-shared-condition = Yhteinen ehto

js-kind-guided-slant-electron-content-tecu = Vinon suunnan elektronipitoisuus (TECU)

js-kind-guided-slant-range-km = Vino etäisyys (km)

js-kind-guided-spoofed-offset-m = Harhautuksen poikkeama (m)

js-kind-guided-spoofing-starts-s = Harhautus alkaa (s)

js-kind-guided-sweep-from = Pyyhkäisy alkaen

js-kind-guided-sweep-steps = Pyyhkäisyn askeleet

js-kind-guided-sweep-to = Pyyhkäisy asti

js-kind-guided-timeline-step-s = Aikajanan askel (s)

js-kind-guided-tracking-threshold-db-hz = Seurantakynnys (dB-Hz)

js-kind-guided-transmit-power-dbw = Lähetysteho (dBW)

js-kind-guided-update-period-s = Päivitysjakso (s)

js-kind-guided-user-latitude = Käyttäjän leveysaste (°)

js-kind-hint-a-band-under-this-carrier = kaista, jonka kantoaalto–kohinatiheys on tämän alapuolella, on menettänyt lukituksen

js-kind-hint-a-grid-point-is-available = ruudukon piste on saatavilla, kun sen paikan tarkkuuden heikkenemiskerroin on tämän alapuolella

js-kind-hint-a-satellite-must-be-this = satelliitin on oltava näin korkealla, jotta se lasketaan näkyväksi

js-kind-hint-a-satellite-must-be-this-2 = satelliitin on oltava näin korkealla, jotta sitä käytetään

js-kind-hint-a-satellite-of-the-first = ensimmäisen järjestelmän satelliitin on oltava näin korkealla

js-kind-hint-arc-one-message-is-fitted = kaari, jolle yksi viesti sovitetaan

js-kind-hint-code-tracking-loop-noise-bandwidth = koodinseurantasilmukan kohinakaistanleveys

js-kind-hint-detail-of-the-truth-orbit = totuusradan painovoimamallin tarkkuus

js-kind-hint-distance-from-the-first-jammer = ensimmäisen häirintälähteen etäisyys vastaanottimeen

js-kind-hint-distance-to-the-satellite-in = etäisyys satelliittiin kaistavertailussa

js-kind-hint-drawn-while-acquiring-and-tracking = piirretty hankinnan ja seurannan aikana

js-kind-hint-equivalent-isotropically-radiated-power-of = ensimmäisen häirintälähteen ekvivalentti isotrooppisesti säteilevä teho

js-kind-hint-equivalent-isotropically-radiated-power-of-2 = kaistan ekvivalentti isotrooppisesti säteilevä teho

js-kind-hint-filter-runs-averaged-for-each = kustakin tapauksesta keskiarvoistettavat suodinajot (useampi on hitaampi)

js-kind-hint-first-value-of-the-swept = pyyhkäistävän parametrin ensimmäinen arvo

js-kind-hint-height-of-the-chain-s = ketjun satelliitin korkeus

js-kind-hint-height-of-the-first-shell = ensimmäisen kuoren ratojen korkeus

js-kind-hint-height-of-the-relay-orbits = releratojen korkeus kappaleen yläpuolella

js-kind-hint-height-of-the-satellite-whose = sen satelliitin korkeus, jonka viesti sovitetaan

js-kind-hint-how-far-the-spoofer-moves = kuinka paljon harhauttaja siirtää laskettua paikkaa

js-kind-hint-how-finely-each-orbit-is = kuinka tiheästi kukin rata otetaan näytteeksi piirrosta varten

js-kind-hint-how-high-the-satellite-climbs = kuinka korkealle satelliitti nousee

js-kind-hint-how-long-the-first-phase = kuinka kauan ensimmäinen vaihe kestää

js-kind-hint-how-long-the-receiver-integrates = kuinka kauan vastaanotin integroi yhtä etäisyyttä varten

js-kind-hint-how-many-low-orbit-satellites = kuinka monta matalan radan satelliittia geometriapyyhkäisy lisää

js-kind-hint-how-many-seeded-runs-make = kuinka monta siemenluvulla ajettua ajoa muodostaa ensemblen

js-kind-hint-how-many-values-are-run = kuinka monta arvoa ajetaan

js-kind-hint-how-often-a-new-message = kuinka usein uusi viesti annetaan

js-kind-hint-how-wide-the-first-jammer = kuinka laajalle ensimmäinen häirintälähde levittää tehonsa

js-kind-hint-ionosphere-along-the-path-in = ionosfääri reitin varrella, kokonaiselektronipitoisuuden yksiköissä

js-kind-hint-last-value-of-the-swept = pyyhkäistävän parametrin viimeinen arvo

js-kind-hint-length-of-each-filter-run = kunkin suodinajon kesto

js-kind-hint-length-of-the-run = ajon kesto

js-kind-hint-length-of-the-timeline = aikajanan pituus

js-kind-hint-occupied-bandwidth-of-the-first = ensimmäisen vertailusignaalin käyttämä kaistanleveys

js-kind-hint-one-sigma-doppler-measurement-error = Doppler-mittauksen yhden sigman virhe

js-kind-hint-one-sigma-error-of-a = releelle mitatun etäisyyden yhden sigman virhe

js-kind-hint-one-sigma-error-of-the = Maasta mitatun kaksisuuntaisen etäisyyden yhden sigman virhe

js-kind-hint-orbital-planes-of-the-navigation = navigointireleiden ratatasot

js-kind-hint-power-of-the-first-jammer = ensimmäisen häirintälähteen teho vastaanottimessa

js-kind-hint-raises-the-noise-floor-under = nostaa kohinatasoa jokaisen kaistan alla

js-kind-hint-satellites-in-each-plane = satelliitit kussakin ratatasossa

js-kind-hint-sets-the-doppler-range-a = määrää Doppler-alueen, jonka kylmähaun on katettava

js-kind-hint-signal-in-space-range-error = ensimmäisen järjestelmän avaruussignaalin etäisyysvirhe

js-kind-hint-signal-in-space-range-error-2 = toisen järjestelmän avaruussignaalin etäisyysvirhe

js-kind-hint-signal-level-the-tracking-figures = signaalitaso, jolla seurantaluvut ilmoitetaan

js-kind-hint-spacing-of-the-latitude-and = leveys- ja pituusasteruudukon väli

js-kind-hint-spacing-of-the-shared-mission = yhteisen tehtäväaikaruudukon väli

js-kind-hint-the-part-of-the-range = se osa etäisyysvirheestä, jota viesti ei voi poistaa

js-kind-hint-the-value-every-member-runs = arvo, jolla jokainen jäsen ajetaan

js-kind-hint-tilt-of-that-orbit = tuon radan kallistus

js-kind-hint-tilt-of-the-first-shell = ensimmäisen kuoren ratatasojen kallistus

js-kind-hint-tilt-of-the-relay-planes = releiden ratatasojen kallistus

js-kind-hint-timing-error-between-satellites-as = satelliittien välinen ajoitusvirhe etäisyytenä

js-kind-hint-when-the-spoofer-captures-the = milloin harhauttaja vangitsee vastaanottimen

js-kind-hint-where-the-receiver-stands = missä vastaanotin sijaitsee

js-kind-hint-where-the-user-stands = missä käyttäjä sijaitsee

js-kind-label-3-d-error = 3D-virhe

js-kind-label-3-d-error-time-of = 3D-virhe, saapumisaika

js-kind-label-a-corrupted-frame-is-rejected = vioittunut kehys hylätään

js-kind-label-all-channels = kaikki kanavat

js-kind-label-availability = Saatavuus

js-kind-label-band = Kaista

js-kind-label-bodies = Kappaleet

js-kind-label-body = Kappale

js-kind-label-both = molemmat

js-kind-label-case = Tapaus

js-kind-label-class = Luokka

js-kind-label-code-jitter = koodin värinä

js-kind-label-constellation = Satelliittitähdistö

js-kind-label-doppler = Doppler

js-kind-label-event = Tapahtuma

js-kind-label-evidence = Todiste

js-kind-label-fewest-in-view = Vähiten näkyvissä

js-kind-label-field = Kenttä

js-kind-label-first-detection-after-onset = Ensimmäinen havainto alun jälkeen

js-kind-label-frame-length = Kehyksen pituus

js-kind-label-fused = yhdistetty

js-kind-label-fused-cap = Yhdistetty

js-kind-label-gnss = GNSS

js-kind-label-gnss-and-leo = GNSS ja LEO

js-kind-label-gnss-channels = GNSS-kanavat

js-kind-label-gnss-highest-in-sky = GNSS { $id } (korkeimmalla taivaalla)

js-kind-label-gnss-only = vain GNSS

js-kind-label-gnss-only-cap = Vain GNSS

js-kind-label-gnss-signal = GNSS-signaali

js-kind-label-hdop = HDOP

js-kind-label-highest = Suurin

js-kind-label-horizontal-error = vaakavirhe

js-kind-label-horizontal-error-2 = Vaakavirhe

js-kind-label-jammer = Häirintälähde

js-kind-label-jump-threshold = Hyppykynnys

js-kind-label-largest-range-jump = Suurin etäisyyshyppy

js-kind-label-largest-range-jump-against-the = suurin etäisyyshyppy kynnystä vasten

js-kind-label-leo = LEO

js-kind-label-leo-channels = LEO-kanavat

js-kind-label-leo-only = vain LEO

js-kind-label-light-time-from-observer = Valoaika havaitsijasta { $observer }

js-kind-label-light-time-from-the-observer = Valoaika havaitsijasta

js-kind-label-light-time-one-way = Valoaika, yhteen suuntaan

js-kind-label-lowest = Pienin

js-kind-label-lowest-c-n0 = Pienin C/N0

js-kind-label-mean = Keskiarvo

js-kind-label-mean-in-view = Keskiarvo näkyvissä

js-kind-label-median-convergence = Mediaanikonvergenssi

js-kind-label-median-pdop = PDOP:n mediaani

js-kind-label-member-runs = Jäsenajot

js-kind-label-message-switch-iod = viestinvaihto, datan julkaisutunnus { $old } → { $new }

js-kind-label-mission-length = Tehtävän kesto

js-kind-label-model = malli

js-kind-label-monte-carlo-runs = Monte Carlo -ajot

js-kind-label-noise-floor = Kohinataso

js-kind-label-parameters = Parametrit

js-kind-label-payload = Hyötykuorma

js-kind-label-pdop = PDOP

js-kind-label-pdop-95th-percentile = PDOP, 95. persentiili

js-kind-label-peak-elevation = Huippukorkeuskulma

js-kind-label-peak-tracked-c-n0 = Seurattu huippu-C/N0

js-kind-label-phase = Vaihe

js-kind-label-predicted-horizontal-sigma = ennustettu vaakasigma

js-kind-label-quantisation-position = Kvantisointi, paikka

js-kind-label-range-error = etäisyysvirhe

js-kind-label-relays-above-the-mask = releet maskin yläpuolella

js-kind-label-relays-and-earth-link = releet ja Maa-yhteys

js-kind-label-relays-only = vain releet

js-kind-label-satellite = Satelliitti

js-kind-label-satellites = Satelliitit

js-kind-label-satellites-used = Käytetyt satelliitit

js-kind-label-signal = Signaali

js-kind-label-signal-chip-spacing = { $name } ({ $spacing } chip-väli)

js-kind-label-sisre-after-quantisation = SISRE kvantisoinnin jälkeen

js-kind-label-sisre-root-mean-square = SISRE, neliökeskiarvo

js-kind-label-spoofing-starts = harhautus alkaa

js-kind-label-standard-deviation = Keskihajonta

js-kind-label-sun-separation = Etäisyys Auringosta

js-kind-label-sweep-runs = Pyyhkäisyajot

js-kind-label-system = Järjestelmä

js-kind-label-time-above-the-mask = Aika maskin yläpuolella

js-kind-label-time-error-root-mean-square = Aikavirhe, neliökeskiarvo

js-kind-label-tracked-component = seurattu komponentti

js-kind-label-tracking-threshold = Seurantakynnys

js-kind-label-transmit-bandwidth = Lähetyskaistanleveys

js-kind-label-vdop = VDOP

js-kind-label-welch-estimate-of-the-synthesised = Welch-estimaatti synteettisistä näytteistä

js-kind-label-whole-signal = koko signaali

js-kind-label-wideband-j-s-tolerated = Siedetty laajakaistainen J/S

js-kind-label-with-unit = { $label } ({ $unit })

js-kind-label-worst-site-availability = Huonoin paikkakohtainen saatavuus

js-kind-no = ei

js-kind-note-a-gap-is-an-epoch = Aukko on ajanhetki, jolloin näkyvissä on liian vähän releitä paikan määritykseen.

js-kind-note-a-helmert-transform-is-the = Helmert-muunnos on seitsenparametrinen siirto, kierto ja mittakaava kahden koordinaatiston välillä.

js-kind-note-a-low-earth-orbit-leo = Matalan Maan radan (LEO) satelliitti ylittää taivaan minuuteissa, joten sen C/N0 (kantoaalto–kohinatiheyssuhde) nousee ja laskee kellokäyrän muotoisesti; GNSS-satelliitti liikkuu samassa ajassa tuskin lainkaan.

js-kind-note-a-receiver-independent-exchange-format = RINEX 4 -tyylinen tietue (Receiver Independent Exchange Format). LEO-tietuetyypit ovat Kshana-laajennus, kuten otsake kertoo.

js-kind-note-a-single-pass-fixes-the = Yksittäinen ohitus määrittää kulkusuuntaisen suunnan paljon paremmin kuin poikittaisen.

js-kind-note-aos-is-acquisition-of-signal = AOS on signaalin hankinta, TCA lähimmän ohituksen aika ja LOS signaalin menetys.

js-kind-note-c-n0-is-the-carrier = C/N0 on kantoaalto–kohinatiheyssuhde. Kaista, joka on vastaanottimen seurantakynnyksen alapuolella, on menettänyt lukituksen.

js-kind-note-cells-are-the-code-and = Solut ovat koodi- ja Doppler-lokeroita, jotka kylmähaun on testattava.

js-kind-note-cold-is-a-first-fix = Kylmä on ensimmäinen paikanmääritys ilman ennakkotietoa; kuuma on paikanmääritys pian edellisen jälkeen.

js-kind-note-dilution-of-precision-dop-scales = Tarkkuuden heikkenemiskerroin (DOP) skaalaa etäisyysvirheen paikkavirheeksi: G on geometrinen, P paikka, H vaaka ja V pysty. Persentiilit lasketaan kaikista ruudukon pisteistä ja ajanhetkistä.

js-kind-note-drawn-at-the-strongest-signal = Piirretty ajon voimakkaimmalla signaalitasolla. Aukko on jakso, jolloin yhtään satelliittia ei ole näkyvissä.

js-kind-note-each-body-carries-its-own = Jokaisella kappaleella on oma todistemerkintänsä. Valoaika on yhteen suuntaan, skenaariossa nimetystä havaitsijasta.

js-kind-note-each-row-is-one-full = Jokainen rivi on yksi täysi moottoriajo pyyhkäistystä skenaariosta.

js-kind-note-each-rule-is-a-switch = Jokainen sääntö on vaihto uudempaan viestiin ohituksen aikana.

js-kind-note-each-signal-is-drawn-about = Jokainen signaali piirretään oman keskitaajuutensa ympärille. Aukko on spektrin nollakohta.

js-kind-note-eirp-is-the-equivalent-isotropically = EIRP on ekvivalentti isotrooppisesti säteilevä teho.

js-kind-note-every-phase-is-an-ordinary = Jokainen vaihe on tavallinen skenaarioajo. Tiivisteet tunnistavat kunkin jäsenen syötteen ja tulosasiakirjan.

js-kind-note-iod-is-the-issue-of = IOD on datan julkaisutunnus: viestin järjestysnumero.

js-kind-note-j-s-is-the-jammer = J/S on häirintälähteen ja signaalin tehosuhde. Seurantaosuus on se osa ajosta, jolloin kaista pysyy kynnyksen yläpuolella.

js-kind-note-p05-p50-and-p95-are = p05, p50 ja p95 ovat 5., 50. ja 95. persentiili. ci95 on keskiarvon 95 %:n luottamusväli.

js-kind-note-parameters-are-public-with-a = Parametrit ovat PUBLIC (lähteellä), REPRESENTATIVE tai WORKSHOP, kuten kukin esiasetus ilmoittaa.

js-kind-note-precise-point-positioning-ppp-converges = Tarkka pistepaikannus (PPP) konvergoituu, kun virhe pysyy kriteerin alapuolella. NEES on normalisoitu estimointivirheen neliö, suotimen johdonmukaisuustarkistus.

js-kind-note-sisre-defined = SISRE on avaruussignaalin etäisyysvirhe: se, mitä lähetetty viesti lisää käyttäjän etäisyyteen. Tässä se on viestin esitysvirhe moottorin oman totuusradan suhteen.

js-kind-note-sisre-is-the-signal-in = SISRE on avaruussignaalin etäisyysvirhe, jonka oletetaan koskevan kunkin järjestelmän lähetettyä rataa ja kelloa.

js-kind-note-ssc-is-the-spectral-separation = SSC on spektrierotuskerroin: kuinka suuri osa yhden signaalin tehosta osuu toisen vastaanottimen sisään. Viiva tarkoittaa, että signaalit eivät limity.

js-kind-note-the-chain-runs-the-signal = Ketju ajaa signaali-, ohitus-, navigointiviesti-, paikannus- ja tarkan paikannuksen vaiheet järjestyksessä. Jokainen rivi on luku, jonka yksi vaihe laski ja seuraava käytti.

js-kind-note-the-doppler-and-pass-geometry = Doppler- ja ohitusgeometriamonitori vertaa mitattuja etäisyysmuutosnopeuksia radoista ennustettuihin. Sääntö merkitsee harhauttajan aloitushetken.

js-kind-note-the-engine-draws-its-spectrum = Moottori piirtää spektrimallinsa vaihe- ja kvadratuurinäytteinä (IQ) yhdellä hetkellä ja estimoi spektrin takaisin niistä. Samat näytteet ovat SigMF-vienti (Signal Metadata Format).

js-kind-note-the-engine-s-own-documented = Moottorin oma dokumentoitu binäärikehys, jonka päättää 24-bittinen syklinen redundanssitarkistus (CRC-24Q).

js-kind-note-the-gabor-root-mean-square = Gaborin (neliökeskiarvo) kaistanleveys määrää, kuinka tarkasti signaalilla voidaan mitata etäisyyttä.

js-kind-note-the-largest-jammer-to-signal = Suurin häirintälähteen ja signaalin suhde (J/S), jonka läpi kukin signaali seuraa, jatkuva-aaltoiselle (CW), spektriltään sovitetulle ja laajakaistaiselle häirintälähteelle.

js-kind-note-the-shapiro-delay-is-the = Shapiro-viive on Auringon painovoiman reitin varrella aiheuttama lisävaloaika.

js-kind-note-the-spectrum-kind-and-the = Spektrilaji ja häirintälaji laskevat saman linkin kahdella tavalla; viimeinen sarake on niiden erotus.

js-kind-note-time-of-arrival-toa-ranging = Saapumisaikaan (TOA) perustuva etäisyysmittaus ei-maanpäällisen verkon (NTN) alalinkillä: leveämmällä signaalilla etäisyys mitataan tarkemmin.

js-kind-note-what-half-a-least-significant = Mitä puolikas vähiten merkitsevä bitti (LSB) kustakin kentästä maksaa paikassa ja kellossa, etäisyytenä.

js-kind-rowhead-block = Lohko

js-kind-rowhead-condition = Ehto

js-kind-rowhead-figure = Luku

js-kind-rowhead-member = Jäsen

js-kind-rowhead-metric = Mittari

js-kind-rowhead-monitor = Monitori

js-kind-rowhead-phase = Vaihe

js-kind-rowhead-satellite = Satelliitti

js-kind-rowhead-signal = Signaali

js-kind-rowhead-solution = Ratkaisu

js-kind-sub-clock-offset-db = { $clock }, { $offset } dB

js-kind-sub-doppler-only = vain Doppler

js-kind-sub-from-to = { $from } – { $to }

js-kind-sub-fused = yhdistetty

js-kind-sub-gnss-and-leo-latitude = GNSS ja LEO, leveysaste { $lat }°

js-kind-sub-gnss-only = vain GNSS

js-kind-sub-gnss-only-latitude = vain GNSS, leveysaste { $lat }°

js-kind-sub-model-fit-seconds = { $model }, { $fit } s sovitus

js-kind-threshold-4-needed-for-a-fix = 4 tarvitaan paikanmääritykseen

js-kind-threshold-convergence-criterion = konvergenssikriteeri

js-kind-threshold-elevation-mask = korkeuskulmamaski

js-kind-threshold-gnss-median = GNSS:n mediaani

js-kind-threshold-tracking-threshold = seurantakynnys

js-kind-title-acquisition = Hankinta

js-kind-title-against-a-simulated-campaign = Simuloitua kampanjaa vasten

js-kind-title-assumptions = Oletukset

js-kind-title-band-trade-at-equal-transmit = Kaistavertailu samalla lähetysteholla

js-kind-title-bands = Kaistat

js-kind-title-beside-the-published-figures = Julkaistujen lukujen rinnalla

js-kind-title-beside-the-published-speed-up = Julkaistun nopeutuksen rinnalla

js-kind-title-bodies = Kappaleet

js-kind-title-body = Kappale

js-kind-title-by-latitude = Leveysasteen mukaan

js-kind-title-c-n0-by-band-over = C/N0 kaistoittain ajon aikana

js-kind-title-c-n0-over-the-pass = C/N0 ohituksen aikana

js-kind-title-cases = Tapaukset

js-kind-title-central-body = Keskuskappale

js-kind-title-closed-form-doppler-against-finite = Suljetun muodon Doppler äärellisiä differenssejä vasten

js-kind-title-code-tracking-jitter = Koodinseurannan värinä

js-kind-title-code-tracking-jitter-against-c = Koodinseurannan värinä C/N0:aan nähden

js-kind-title-combined-over-the-members = Yhdistetty jäsenten yli

js-kind-title-compatibility-with-gnss-signals = Yhteensopivuus GNSS-signaalien kanssa

js-kind-title-constellations = Satelliittitähdistöt

js-kind-title-continuity-across-message-switches = Jatkuvuus viestinvaihtojen yli

js-kind-title-cross-check-against-the-jamming = Ristiintarkistus häirintälajia vasten

js-kind-title-datum-accuracy = Vertailupisteen tarkkuus

js-kind-title-dilution-of-precision-over-the = Tarkkuuden heikkenemiskerroin koko ruudukossa

js-kind-title-doppler = Doppler

js-kind-title-doppler-envelopes = Doppler-vaippakäyrät

js-kind-title-doppler-only-fix = Pelkkään Doppleriin perustuva paikanmääritys

js-kind-title-doppler-over-the-pass = Doppler ohituksen aikana

js-kind-title-doppler-positioning-from-one-pass = Doppler-paikannus yhdestä ohituksesta

js-kind-title-earth-link = Maa-yhteys

js-kind-title-elevation = Korkeuskulma

js-kind-title-encoded-frame = Koodattu kehys

js-kind-title-epoch = Epookki

js-kind-title-epoch-and-frame = Epookki ja koordinaatisto

js-kind-title-events = Tapahtumat

js-kind-title-every-node-of-the-sweep = Pyyhkäisyn jokainen solmu

js-kind-title-field-table = Kenttätaulukko

js-kind-title-figures-of-merit = Laatumittarit

js-kind-title-filter-noise = Suotimen kohina

js-kind-title-fit-interval-trade = Sovitusvälin vaihtokauppa

js-kind-title-fix-quality-against-observation-window = Paikanmäärityksen laatu havaintoikkunaan nähden

js-kind-title-frame-checks = Kehystarkistukset

js-kind-title-frame-hexadecimal = Kehys, heksadesimaalina

js-kind-title-geometry-against-latitude = Geometria leveysasteeseen nähden

js-kind-title-geometry-as-leo-satellites-are = Geometria, kun LEO-satelliitteja lisätään

js-kind-title-geometry-position-dilution-of-precision = Geometria: paikan tarkkuuden heikkenemiskerroin

js-kind-title-global-coverage = Maailmanlaajuinen kattavuus

js-kind-title-gnss-leo-and-fused = GNSS, LEO ja yhdistetty

js-kind-title-gnss-reference = GNSS-vertailu

js-kind-title-hand-offs-between-phases = Vaiheiden väliset luovutukset

js-kind-title-helmert-fit = Helmert-sovitus

js-kind-title-helmert-transform-parameters = Helmert-muunnoksen parametrit

js-kind-title-inputs = Syötteet

js-kind-title-ionosphere-free-band-pairs = Ionosfäärivapaat kaistaparit

js-kind-title-jammer-tolerance = Häirintälähteen sieto

js-kind-title-jammers = Häirintälähteet

js-kind-title-joint-fix = Yhteinen paikanmääritys

js-kind-title-leo-against-gnss = LEO GNSS:ään verrattuna

js-kind-title-limitations = Rajoitukset

js-kind-title-links = Linkit

js-kind-title-member-runs = Jäsenajot

js-kind-title-members-under-the-shared-conditions = Jäsenet yhteisissä ehdoissa

js-kind-title-message = Viesti

js-kind-title-message-models-compared = Viestimallien vertailu

js-kind-title-message-switches = Viestinvaihdot

js-kind-title-metric-against-axis = { $metric } suhteessa akseliin { $axis }

js-kind-title-metric-distribution-over-runs = { $metric }: jakauma ajojen yli

js-kind-title-mid-pass-update = Päivitys ohituksen aikana

js-kind-title-modelled = Mallinnettu

js-kind-title-monte-carlo = Monte Carlo

js-kind-title-navigation-message-stage = Navigointiviestivaihe

js-kind-title-not-modelled = Ei mallinnettu

js-kind-title-notes = Huomautukset

js-kind-title-notes-on-the-spoofing-model = Huomautuksia harhautusmallista

js-kind-title-observation-windows = Havaintoikkunat

js-kind-title-one-pass-alone = Yksi ohitus yksin

js-kind-title-orbit = Rata

js-kind-title-over-the-message-sequence = Viestisarjan yli

js-kind-title-pass = Ohitus

js-kind-title-pass-c-n0-of-the = Ohitus: koko signaalin ja seuratun komponentin C/N0

js-kind-title-pass-code-tracking-jitter = Ohitus: koodinseurannan värinä

js-kind-title-pass-doppler = Ohitus: Doppler

js-kind-title-pass-stage = Ohitusvaihe

js-kind-title-passes = Ohitukset

js-kind-title-phases = Vaiheet

js-kind-title-position-error-gnss-leo-and = Paikkavirhe: GNSS, LEO ja yhdistetty paikanmääritys

js-kind-title-position-uncertainty-relays-alone-and = Paikan epävarmuus: pelkät releet ja Maa-yhteyden kanssa

js-kind-title-positioning-by-signal-bandwidth = Paikannus signaalin kaistanleveyden mukaan

js-kind-title-positioning-gnss-alone-against-the = Paikannus: pelkkä GNSS yhdistettyyn paikanmääritykseen verrattuna

js-kind-title-power-spectral-density = Tehospektritiheys

js-kind-title-power-spectral-density-of-each = Kunkin signaalin tehospektritiheys

js-kind-title-precise-point-positioning = Tarkka pistepaikannus

js-kind-title-published-comparison = Julkaistu vertailu

js-kind-title-quantisation-budget = Kvantisointibudjetti

js-kind-title-range-residuals = Etäisyysjäännökset

js-kind-title-ranging-stations = Etäisyydenmittausasemat

js-kind-title-reading-the-trade = Vaihtokaupan lukeminen

js-kind-title-realised-position-error = Toteutunut paikkavirhe

js-kind-title-receiver = Vastaanotin

js-kind-title-receiver-power-budget = Vastaanottimen tehobudjetti

js-kind-title-reflector-information = Heijastimen tiedot

js-kind-title-relay-constellation = Releiden tähdistö

js-kind-title-relays-in-view = Näkyvissä olevat releet

js-kind-title-reproducibility = Toistettavuus

js-kind-title-retroreflectors = Retroreflektorit

js-kind-title-rinex-style-record = RINEX-tyylinen tietue

js-kind-title-round-trips = Edestakaiset kierrokset

js-kind-title-run = Ajo

js-kind-title-satellites-in-view-against-latitude = Näkyvät satelliitit leveysasteeseen nähden

js-kind-title-sensitivity-to-a-line-of = Herkkyys näköyhteyden kallistukselle

js-kind-title-shared-conditions = Yhteiset ehdot

js-kind-title-signal-components = Signaalin komponentit

js-kind-title-signal-stage = Signaalivaihe

js-kind-title-signals = Signaalit

js-kind-title-sisre-against-fit-interval = SISRE sovitusvälin funktiona

js-kind-title-sisre-against-update-period = SISRE päivitysjakson funktiona

js-kind-title-sisre-weights = SISRE-painot

js-kind-title-snapshot = Otos

js-kind-title-snapshot-against-the-model = Otos mallia vasten

js-kind-title-snapshot-spectrum-welch-estimate-against = Otosspektri: Welch-estimaatti mallia vasten

js-kind-title-sources = Lähteet

js-kind-title-spoofer-and-monitor-settings = Harhauttajan ja monitorin asetukset

js-kind-title-spoofing-monitor-probability-of-detection = Harhautusmonitori: havaitsemistodennäköisyys

js-kind-title-statistics-over-the-runs = Tilastot ajojen yli

js-kind-title-sweep = Pyyhkäisy

js-kind-title-systems = Järjestelmät

js-kind-title-systems-in-the-fix = Paikanmäärityksen järjestelmät

js-kind-title-the-archived-campaign = Arkistoitu kampanja

js-kind-title-time-error = Aikavirhe

js-kind-title-time-error-by-receiver-clock = Aikavirhe vastaanottimen kellon mukaan

js-kind-title-time-scale = Aika-asteikko

js-kind-title-time-to-first-fix-and = Aika ensimmäiseen paikanmääritykseen ja energia paikanmääritystä kohti

js-kind-title-time-transfer-by-clock-and = Ajansiirto kellon ja signaalitason mukaan

js-kind-title-trade-conditions = Vaihtokaupan ehdot

js-kind-title-update-period-trade = Päivitysjakson vaihtokauppa

js-kind-title-user = Käyttäjä

js-kind-title-user-range-error-through-the = Käyttäjän etäisyysvirhe ohituksen aikana

js-kind-title-validated = Validoitu

js-kind-title-what-each-stage-hands-to = Mitä kukin vaihe välittää seuraavalle

js-kind-title-what-this-run-is-and = Mitä tämä ajo on ja mitä se ei ole

js-kind-title-when-each-monitor-detects = Milloin kukin monitori havaitsee

js-kind-title-work-done = Tehty työ

js-kind-yes = kyllä

js-ledger-rows =
    { $n ->
        [one] { $n } kirjanpitorivi
       *[other] { $n } kirjanpitoriviä
    }

js-lib-abbr-apv = lähestyminen pystyohjauksella

js-lib-abbr-araim = edistynyt vastaanottimen autonominen eheyden valvonta

js-lib-abbr-auc = käyrän alle jäävä pinta-ala

js-lib-abbr-c-n0 = kantoaalto–kohinatiheys

js-lib-abbr-ccsds = Avaruusdatajärjestelmien neuvoa-antava komitea

js-lib-abbr-cli = komentorivikäyttöliittymä

js-lib-abbr-csac = sirumittakaavainen atomikello

js-lib-abbr-cw = jatkuva aalto

js-lib-abbr-doi = digitaalinen objektitunniste

js-lib-abbr-dop = tarkkuuden heikkenemiskerroin

js-lib-abbr-eo = Maan havainnointi

js-lib-abbr-gnss = maailmanlaajuinen satelliittinavigointijärjestelmä

js-lib-abbr-gps = Global Positioning System (yhdysvaltalainen satelliittipaikannusjärjestelmä)

js-lib-abbr-hal = vaakasuuntainen hälytysraja

js-lib-abbr-hpl = vaakasuuntainen suojaustaso

js-lib-abbr-imu = inertiamittausyksikkö

js-lib-abbr-ins = inertianavigointijärjestelmä

js-lib-abbr-iot = esineiden internet

js-lib-abbr-itu-t = Kansainvälinen televiestintäliitto, televiestinnän standardointisektori

js-lib-abbr-j-s = häirintälähteen ja signaalin suhde

js-lib-abbr-leo = matala Maan rata

js-lib-abbr-llr = kuun laseretäisyysmittaus

js-lib-abbr-meo = keskikorkea Maan rata

js-lib-abbr-mtie = suurin aikavälivirhe

js-lib-abbr-ntn = ei-maanpäällinen verkko

js-lib-abbr-ocxo = uunistabiloitu kideoskillaattori

js-lib-abbr-oem = Orbit Ephemeris Message (ratatietoviesti)

js-lib-abbr-omm = Orbit Mean-elements Message (radan keskiarvoelementtiviesti)

js-lib-abbr-pdop = paikan tarkkuuden heikkenemiskerroin

js-lib-abbr-pnt = paikannus, navigointi ja ajanmääritys

js-lib-abbr-ppp = tarkka pistepaikannus

js-lib-abbr-raim = vastaanottimen autonominen eheyden valvonta

js-lib-abbr-rf = radiotaajuus

js-lib-abbr-rinex = Receiver Independent Exchange Format (vastaanotinriippumaton vaihtoformaatti)

js-lib-abbr-roc = vastaanottimen toimintaominaiskäyrä

js-lib-abbr-sbas = satelliittipohjainen täydennysjärjestelmä

js-lib-abbr-sgp4 = Simplified General Perturbations 4, ratapropagaattori

js-lib-abbr-sisre = avaruussignaalin etäisyysvirhe

js-lib-abbr-slam = samanaikainen paikannus ja kartoitus

js-lib-abbr-spp = yhden pisteen paikannus

js-lib-abbr-tdev = aikapoikkeama

js-lib-abbr-tle = kaksirivinen elementtijoukko

js-lib-abbr-toml = skenaariotiedostomuoto

js-lib-abbr-trn = maastoviitteinen navigointi

js-lib-abbr-uhf = ultrakorkea taajuus

js-lib-abbr-ukf = unscented-Kalman-suodin

js-lib-abbr-utc = maailmanaika (UTC)

js-lib-abbr-val = pystysuuntainen hälytysraja

js-lib-abbr-vlbi = pitkäkantainen interferometria

js-lib-abbr-vpl = pystysuuntainen suojaustaso

js-lib-abbr-wg = Työryhmä

js-lib-areas-ground-track = Maanpintajälki

js-lib-areas-holdover = Holdover

js-lib-compare-availability = Saatavuus

js-lib-compare-holdover = Holdover

js-lib-compare-timing-p95 = Ajoituksen p95

js-lib-compare-timing-rms = Ajoituksen RMS

js-lib-counts-explorer-tally = Validoituja ulkoista oraakkelia vastaan: { $validated } / { $total } ominaisuudesta · mallinnettuja: { $modelled } · kumppanin omistamia: { $partner } — tässä näytetään ominaisuuskortteja { $cards }, alueita { $domains } ja todistevaitteita { $evidence }

js-lib-counts-validated-tally = Validoituja ulkoista oraakkelia vastaan: { $validated } / { $total } ominaisuudesta — tässä näytetään ominaisuuskortteja { $cards } ja todistevaitteita { $evidence }

js-lib-engine-busy = { $verb }…

js-lib-engine-busy-seconds = { $verb }… { $s } s

js-lib-engine-page-http = moottoritiedosto palautti HTTP { $status }

js-lib-engine-page-not-running = moottori ei ole käynnissä tässä

js-lib-engine-worker-crashed = moottorin työsäie kaatui

js-lib-evidence-aria = Todiste: { $tier }, { $count }

js-lib-evidence-ledger-rows =
    { $n ->
        [one] { $n } kirjanpitorivi
       *[other] { $n } kirjanpitoriviä
    }

js-lib-evidence-rows-behind = Tämän tuloksen taustalla olevat kirjanpitorivit

js-lib-geometry-url-bad-mc = Monte Carlo -näytteiden määrä ei ole mikään arvoista { $choices }; käytetään arvoa { $default }.

js-lib-geometry-url-bad-number = ”{ $key }” ei ole luku väliltä { $min }–{ $max }; käytetään oletusta.

js-lib-geometry-url-bad-site = Paikka ei ole leveysaste,pituusaste[,korkeus] sallitulla alueella; käytetään oletuspaikkaa.

js-lib-geometry-url-bad-sky = Horisonttiviiva ei ole esiasetus, 360 lokeron taulukko eikä sallitulla alueella oleva kanjoni; käytetään avointa horisonttia.

js-lib-geometry-url-bad-sys = Tähdistöluettelo ei ole G, E, C ja enintään yksi L:<LEO preset>, jonka tämä näkymä tuntee; käytetään oletusyhdistelmää.

js-lib-geometry-url-own-tle = Lähettäjä käytti omia rataelementtejään (TLE), joita linkki ei kuljeta mukana; esiasetukset näytetään sen sijaan.

js-lib-geometry-url-repeated = ”{ $key }” esiintyy useammin kuin kerran; käytetään ensimmäistä arvoa.

js-lib-geometry-url-too-long = Osoite on pidempi kuin { $max } merkkiä, joten mitään sen asetuksista ei luettu.

js-lib-geometry-url-unreadable = Osoitetta ei voitu lukea.

js-lib-guided-duration-s-hint = kuinka pitkään maanpintajälkeä propagoidaan

js-lib-guided-duration-s-label = Kesto (s)

js-lib-guided-dut1-s-hint = Maan pyörimispoikkeama; siirtää maanpintajälkeä itään tai länteen

js-lib-guided-dut1-s-label = UT1−UTC (s)

js-lib-guided-mask-deg-hint = satelliitin on oltava näin korkealla, jotta se lasketaan näkyväksi

js-lib-guided-mask-deg-label = Korkeuskulmamaski (°)

js-lib-guided-seed-hint = eri kohinaotos samasta fysiikasta

js-lib-guided-seed-label = Satunnainen siemenluku

js-lib-guided-sigma-uere-m-hint = 1-σ:n käyttäjäekvivalentti etäisyysvirhe paikkayhteenvetoa varten

js-lib-guided-sigma-uere-m-label = Etäisyysvirhe σ (m)

js-lib-guided-station-lat-deg-hint = maa-aseman leveysaste — määrää ohituksen geometrian

js-lib-guided-station-lat-deg-label = Aseman leveysaste (°)

js-lib-guided-station-lon-deg-hint = maa-aseman pituusaste

js-lib-guided-station-lon-deg-label = Aseman pituusaste (°)

js-lib-guided-step-s-hint = maanpintajäljen näytteenottotahti

js-lib-guided-step-s-label = Aika-askel (s)

js-lib-guided-threshold-ns-hint = määrityksen mukainen budjetti; ”saatavilla”, kun virhe pysyy sen alapuolella

js-lib-guided-threshold-ns-label = Määrityskynnys (ns)

js-lib-guided-time-duration-s-hint = ajon kokonaiskesto

js-lib-guided-time-duration-s-label = Kesto (s)

js-lib-guided-time-step-s-hint = integrointi- ja näytteenottotahti

js-lib-guided-time-step-s-label = Aika-askel (s)

js-lib-guided-user-altitude-km-hint = käyttäjäavaruusaluksen ratakorkeus

js-lib-guided-user-altitude-km-label = Käyttäjän korkeus (km)

js-lib-guided-user-inclination-deg-hint = käyttäjän radan inklinaatio

js-lib-guided-user-inclination-deg-label = Käyttäjän inklinaatio (°)

js-lib-imufit-card-accel-slope = Kiihtyvyysmittarin Allan-kulmakerroin, alku (noin -0,5 valkoiselle kohinalle)

js-lib-imufit-card-bias = Kiihtyvyysmittarin harha, keskiarvo (m/s²)

js-lib-imufit-card-bias-instability = Kiihtyvyysmittarin harhan epästabiilius (m/s²), 0 kun käyrällä ei ole pohjaa

js-lib-imufit-card-gyro-bias = Gyron harha, keskiarvo (rad/s)

js-lib-imufit-card-gyro-slope = Gyron Allan-kulmakerroin, alku (noin -0,5 valkoiselle kohinalle)

js-lib-imufit-card-note-n = Huomautus { $n }

js-lib-imufit-card-q-arw = Gyron kulman satunnaiskävely, q_arw (rad²/s)

js-lib-imufit-card-q-va = Kiihtyvyysmittarin nopeuden satunnaiskävely, q_va (m²/s³)

js-lib-imufit-card-sample-rate = Näytteenottotaajuus

js-lib-imufit-card-samples = Näytteet

js-lib-imufit-card-span = Kesto

js-lib-jammertest-card-clean-epochs = Puhtaat ajanhetket

js-lib-jammertest-card-clean-hours = Puhtaat tunnit

js-lib-jammertest-card-detected = Havaittu toleranssin sisällä

js-lib-jammertest-card-detection-rate = Havaitsemisosuus (mikä tahansa hälytys)

js-lib-jammertest-card-evaluable = Arvioitavissa

js-lib-jammertest-card-fa-epochs = Väärän hälytyksen ajanhetket

js-lib-jammertest-card-fa-per-hour = Väärän hälytyksen jaksoja tunnissa

js-lib-jammertest-card-fa-runs = Väärän hälytyksen jaksot

js-lib-jammertest-card-in-tol-rate = Havaittu toleranssin sisällä, osuus

js-lib-jammertest-card-late = Myöhässä

js-lib-jammertest-card-median-latency = Havaitsemisviiveen mediaani

js-lib-jammertest-card-median-recover = Palautumisajan mediaani

js-lib-jammertest-card-missed = Havaitsematta

js-lib-jammertest-card-na = n/a

js-lib-jammertest-card-not-assessable = Tässä lokissa yhtään testiä ei voitu arvioida, joten havaitsemisosuutta tai viivettä ei voida ilmoittaa. Se on tulos, ei sivun vika: mikään tässä ei ole läpäisty.

js-lib-jammertest-card-not-json = { $name }: ei JSON-tiedosto ({ $reason }).

js-lib-jammertest-card-not-scorecard = { $name }: ei jammertest-tuloskortti (siinä on oltava tests[] ja summary).

js-lib-jammertest-card-tests = Testit suunnitelman osassa

js-lib-jammertest-card-too-large = { $name }: suurempi kuin 8 MiB; tämä sivu lukee tuloskortin enintään tuon kokoon asti.

js-lib-kpi-available-everywhere = saatavilla kaikkialla, joka ajanhetkellä

js-lib-kpi-available-everywhere-pdop = saatavilla kaikkialla, joka ajanhetkellä (PDOP, paikan tarkkuuden heikkenemiskerroin, alle { $thr })

js-lib-kpi-drops-under = putoaa alle { $thr } dB-Hz:n seurantakynnyksen: lukitus menetetty

js-lib-kpi-end-of-mission = tehtävän lopussa

js-lib-kpi-figure-tiers = Lukujen tasot: { $parts }.

js-lib-kpi-n-modelled =
    { $n ->
        [one] { $n } mallinnettu
       *[other] { $n } mallinnettua
    }

js-lib-kpi-n-partner =
    { $n ->
        [one] { $n } kumppanin omistama
       *[other] { $n } kumppanin omistamaa
    }

js-lib-kpi-n-validated =
    { $n ->
        [one] { $n } validoitu
       *[other] { $n } validoitua
    }

js-lib-kpi-no-change = ei muutosta

js-lib-kpi-no-fix = { $pct } % ajasta tai paikoista ilman paikanmääritystä

js-lib-kpi-no-fix-pdop = { $pct } % ajasta tai paikoista ilman paikanmääritystä PDOP-arvolla alle { $thr }

js-lib-kpi-over-jump = yli { $thr } m:n hyppykynnyksen

js-lib-kpi-over-pdop = yli PDOP-kynnyksen { $thr }

js-lib-kpi-stays-above = pysyy yli { $thr } dB-Hz:n seurantakynnyksen

js-lib-kpi-under-jump = alle { $thr } m:n hyppykynnyksen

js-lib-kpi-under-pdop = alle PDOP-kynnyksen { $thr }

js-lib-orbit3d-apogee = apogeum

js-lib-orbit3d-perigee = perigeum

js-lib-orbit3d-prov-scenario = skenaario { $hash }

js-lib-orbit3d-title = Rata (ECI, ortografinen)

js-lib-orbit3d-view-angles = az { $az }° · el { $el }°

js-lib-overlay-meta-clock-bias-m = Kellon harha

js-lib-overlay-meta-converged-pos-3sigma-m = Paikka 3σ

js-lib-overlay-meta-converged-pos-rms-m = Paikan RMS

js-lib-overlay-meta-converged-pos-sigma-m = Paikka σ

js-lib-overlay-meta-final-clock-freq-sigma = Kellotaajuus σ

js-lib-overlay-meta-mean-relays-in-view = Näkyvät releet

js-lib-overlay-meta-pos-p95-m = Paikan p95

js-lib-overlay-meta-pos-rms-m = Paikan RMS

js-lib-overlay-meta-postfit-rms-m = Sovituksen jälkeinen RMS

js-lib-overlay-prov-scenario = skenaario { $hash }

js-lib-overlay-subtitle = |virhe| (ns) ajan funktiona — { $n } ajoa

js-lib-overlay-time-s = aika (s)

js-lib-overlay-title = Päällekkäisnäkymä: ajoitusvirhe katkon aikana

js-lib-packs-cannot-unpack = tämä selain ei voi purkaa tallennettua tiedostoa

js-lib-replay-demos-below-130 = Vain alle 130°:n atsimuutit säilytetty (ilmoitettu)

js-lib-replay-demos-coastal-drag-off = Rannikon poisveto

js-lib-replay-demos-combined-event = Yhdistetty tapahtuma

js-lib-replay-demos-drag-off-stated = Paikan poisveto (esittelyn ilmoittama)

js-lib-replay-demos-ferry-drag-off = Lauttamatka, paikan poisveto

js-lib-replay-demos-ferry-drag-off-description = Keksitty lauttaloki, Tallinna–Helsinki, 1 Hz. Ajanhetkestä 1500 s alkaen paikan poisveto vetää ilmoitetun paikan pois, vaikka vastaanotin ilmoittaa edelleen kelvollisen paikanmäärityksen.

js-lib-replay-demos-fjord = Vuonon luonnollinen heikkeneminen

js-lib-replay-demos-masked-sky = Lauttamatka, puolet taivaasta peitetty

js-lib-replay-demos-masked-sky-description = Sama lauttaloki, jossa taivaan läntinen puolisko vaiennetaan hetkestä 600 s, kapeampi taivas välillä 900–1200 s ja poisveto hetkestä 1500 s alkaen: yksi ajo, jossa taivas, signaali ja paikka pettävät vuorollaan.

js-lib-replay-demos-open-sea-jamming = Häirintä avomerellä

js-lib-replay-demos-port-approach = Aikaharhautus satamaan lähestyttäessä

js-lib-replay-demos-source-training = Synteettinen skenaario { $id }: moottorin nmea_training-virta ja ohjaajan loki, pisteytettynä sen receiver-trust-toiminnolla.

js-lib-replay-demos-source-trust = Synteettinen loki { $id }: keksittyä NMEA-dataa, pisteytettynä moottorin receiver-trust-toiminnolla.

js-lib-replay-demos-west-masked = Taivaan läntinen puolisko peitetty (ilmoitettu)

js-lib-replay-demos-west-masked-again = Läntinen puolisko peitetty uudelleen (ilmoitettu)

js-lib-report-charts = Kaaviot

js-lib-report-eyebrow = tarkka hetki

js-lib-report-figures-of-merit = Laatumittarit

js-lib-report-footer = Kshana { $version } · skenaario { $hash } · luotu { $iso }. Toistettavissa skenaariosta, siemenluvusta ja moottoriversiosta. Ajetaan paikallisesti; mitään ei lähetetä.

js-lib-report-not-applicable = ei sovellettavissa (hyökkäystä ei ole määritetty)

js-lib-report-scenario-definition = Skenaarion määritys (TOML)

js-lib-report-th-clock = Kello

js-lib-report-th-metric = Mittari

js-lib-report-th-validation = Validointi

js-lib-report-th-value = Arvo

js-lib-report-tier-note = Jokainen laatumittari on merkitty { $validated } (tarkistettu ulkoista oraakkelia vasten) tai { $modelled } (ensiperiaatteista johdettu, sisäisesti testattu) — johdettu varmennusmatriisista.

js-lib-report-title = Kshana — skenaarioraportti

js-lib-skydraw-azimuth-range = atsimuutti { $from }–{ $to } astetta

js-lib-skydraw-describe = Satelliitteja luettelossa { $listed }, signaalilla { $heard }

js-lib-skydraw-describe-mean = Satelliitteja luettelossa { $listed }, signaalilla { $heard }, keskiarvo { $snr } dB-Hz

js-lib-skydraw-east = E

js-lib-skydraw-no-signal-from = ei signaalia suunnasta { $sectors }

js-lib-skydraw-none-listed = Lokissa ei ole tänä hetkenä yhtään satelliittia.

js-lib-skydraw-north = N

js-lib-skydraw-sat-heard = { $sys } { $prn }: korkeuskulma { $el }, atsimuutti { $az }, signaali { $snr } dB-Hz

js-lib-skydraw-sat-quiet = { $sys } { $prn }: korkeuskulma { $el }, atsimuutti { $az }, luettelossa, ei signaalia

js-lib-skydraw-south = S

js-lib-skydraw-unheard-sector = Satelliitteja luettelossa atsimuuttien { $from } ja { $to } asteen välillä, yhdelläkään ei signaalia

js-lib-skydraw-west = W

js-lib-skyline-edit-describe = Horisonttiviiva peittää { $blocked } / 360 atsimuuttiastetta; korkein { $el }° atsimuutissa { $az }°.

js-lib-skyline-edit-open = Avoin horisontti: ei horisonttiviivaa.

js-lib-stages-all-planets = Kaikki planeetat

js-lib-stages-au-from-sun = { $d } au Auringosta

js-lib-stages-band-carrier = { $name }-kantoaalto, { $mhz } MHz

js-lib-stages-bin-title =
    { $count ->
        [one] { $from }–{ $to }{ $unit }: { $count } ajo
       *[other] { $from }–{ $to }{ $unit }: { $count } ajoa
    }

js-lib-stages-body-and-moons = { $name } ja sen kuut

js-lib-stages-cell-title = lat { $lat }°, lon { $lon }° · { $field } { $value }

js-lib-stages-chain-navmsg = Navigointiviesti

js-lib-stages-chain-pass = Ohitus ja yhteys

js-lib-stages-chain-ppp = Tarkka pistepaikannus

js-lib-stages-chain-pvt = Yhdistetty paikannus

js-lib-stages-chain-signal = Signaalisuunnittelu

js-lib-stages-coverage-aria = { $field } kappaleella { $body }, leveys- ja pituusasteen mukaan

js-lib-stages-feature-n = kohde { $n }

js-lib-stages-flag = lippu

js-lib-stages-frequency-mhz = taajuus (MHz)

js-lib-stages-from-to = { $from } – { $to }

js-lib-stages-geojson-aria = Kartalle piirretty GeoJSON-vienti

js-lib-stages-histogram = Histogrammi

js-lib-stages-inner-planets = Sisäplaneetat

js-lib-stages-km-from-centre = { $d } km (keskus: { $centre })

js-lib-stages-linear-scale = lineaarinen asteikko

js-lib-stages-link-light-time = { $from } – { $to }: yhteen suuntaan kulkeva valoaika { $time } s

js-lib-stages-longitude-axis = pituusaste · leveysaste sivulla ylöspäin

js-lib-stages-mission-time = tehtäväaika (s)

js-lib-stages-noise-floor = kohinataso

js-lib-stages-orrery-note = { $scale } · koordinaatiston x–y-taso, katsottuna sen pohjoisnavalta

js-lib-stages-panel-n = Paneeli { $n }

js-lib-stages-plan-view-aria = Kappaleen { $centre } ja sen ympärillä olevien kappaleiden ylänäkymä, { $scale }

js-lib-stages-psd-at-t = Tehospektritiheys hetkellä t = { $t } s

js-lib-stages-psd-axis = tehospektritiheys (dBW/Hz)

js-lib-stages-runs = ajoa

js-lib-stages-sat-title = { $constellation } { $id } · lat { $lat }°, lon { $lon }°

js-lib-stages-satellites = satelliittia

js-lib-stages-spectrum-at-t = spektri hetkellä t = { $t } s

js-lib-stages-sqrt-scale = etäisyyden neliöjuuriasteikko

js-lib-stages-the-body = kappale

js-lib-stages-time-s = aika (s)

js-lib-stages-unit-alarm = Hälytys

js-lib-stages-unit-cn0 = Kantoaalto–kohinatiheys

js-lib-stages-unit-position = Paikka ja suojaus

js-lib-stages-unit-satellites = Satelliitit

js-lib-stages-unit-time-error = Aikavirhe

js-lib-stages-waterfall-aria = Tehospektritiheyden vesiputous: taajuus vaakasuunnassa, aika alaspäin

js-lib-stages-whole-band = Koko kaista

js-lib-sweep-clock-availability = { $who }: saatavuus

js-lib-sweep-clock-holdover = { $who }: holdover (s)

js-lib-sweep-clock-timing-p95 = { $who }: ajoituksen p95 (ns)

js-lib-sweep-clock-timing-rms = { $who }: ajoituksen RMS (ns)

js-lib-sweep-max-altitude = suurin korkeus (km)

js-lib-sweep-max-elevation = suurin korkeuskulma (°)

js-lib-sweep-max-speed = suurin nopeus (m/s)

js-lib-sweep-min-altitude = pienin korkeus (km)

js-lib-sweep-peak-doppler = huippu-Doppler (Hz)

js-lib-sweep-prov-scenario = skenaario { $hash }

js-lib-sweep-y-vs-x = { $y } suhteessa { $x }

js-lib-tabs-3d-orbit = 3D-rata

js-lib-tabs-figures-of-merit = Laatumittarit

js-lib-tabs-stability = Vakaus

js-lib-tabs-sweep = Pyyhkäisy

js-lib-tabs-time-series = Aikasarja

js-lib-tour-ashforde-body = Kiitos, kun tutustuit Kshanaan. Rakennamme avointa, toistettavaa ja todisteisiin perustuvaa suunnittelua tehtäville, jotka eivät saa epäonnistua — rehellisesti siitä, mikä on validoitua ja mikä mallinnettua. Kysyttävää, yhteistyötä tai tutkimus? Ota yhteyttä: contact@ashforde.org.

js-lib-tour-ashforde-title = Ashforde® OÜ:ltä

js-lib-tour-capabilities-body = Valitse aluevälilehti — Radat, Ajoitus, Inertia, GNSS, Kestävyys, Kuu, Tekoäly/koneoppiminen, Yhteentoimivuus — nähdäksesi sen ominaisuudet, jotka on kukin merkitty Validoitu tai Mallinnettu, sekä ▸ ajo-painike esimerkkiskenaarioille. Avaa mistä tahansa alueesta ”Todisteet ja alkuperä” jäljittääksesi todisteet tai kytke ”Vain validoidut” näyttämään vain ulkoista oraakkelia vasten tarkistetut.

js-lib-tour-capabilities-title = Tutustu moottoriin yksi alue kerrallaan

js-lib-tour-cite-body = Kshana on tehty viitattavaksi — viitattava ohjelmistojulkaisu DOI-tunnuksella sekä vertaisarvioitua tyyliä olevat artikkelit RF-häiriöiden optimismikuilusta ja ehdollisesta ajoituksen suojaustasosta. Kopioi viite suoraan täältä.

js-lib-tour-cite-title = Julkaisut ja viittaaminen

js-lib-tour-download-report-body = Pyyhkäisy-välilehti vaihtelee yhtä parametria alueella; ”Kiinnitä vertailuun” asettaa kaksi tai useampia ajoja päällekkäin vierekkäin niiden välisen Δ:n kanssa (toimii skenaariotyyppien yli — kello, Mars-PNT, paikannus…); ja tämä painike lataa ajon itsenäisenä, offline-käyttöön sopivana HTML-raporttina.

js-lib-tour-download-report-title = Pyyhkäise, vertaa ja vie

js-lib-tour-guided-body = Ohjatut säätimet mukautuvat skenaarioon — siemenluku, määrityskynnys, kesto, korkeuskulmamaski, ratakorkeus — ja jokainen muutos ajaa uudelleen heti.

js-lib-tour-guided-title = Säädä liukusäätimiä

js-lib-tour-mcp-body = MCP-palvelin antaa tekoälyavustajien ajaa validoitua moottoria arvaamisen sijaan; JetBrains-liitännäinen ajaa skenaarioita hiiren oikealla painikkeella.

js-lib-tour-mcp-title = Käytä sitä tekoälyagentista tai IDE:stä

js-lib-tour-playground-body = Valitse skenaario avattavasta luettelosta — tai paina ▸ ajo mistä tahansa yllä olevasta ominaisuudesta — ja moottori ajetaan WebAssemblynä sinun koneellasi. Mitään ei lähetetä.

js-lib-tour-playground-title = Aja se selaimessasi

js-lib-tour-run-body = Aja nykyinen skenaario. Avaa ”Lisäasetukset” muokataksesi TOML-tiedostoa ja muuttaaksesi mitä tahansa; ”Kopioi jakolinkki” toistaa täsmälleen tämän ajon jollekulle toiselle.

js-lib-tour-run-title = Aja se

js-lib-tour-tabs-body = Vaihda laatumittareiden, aikasarjakaavion, kellon vakauden (Allanin poikkeama) ja — ratajaksoille — interaktiivisen 3D-ratanäkymän välillä.

js-lib-tour-tabs-title = Lue tulokset

js-lib-tour-validation-body = Sama selain on myös todistekirjanpito: jokaisella alueella on ”Todisteet ja alkuperä” -laatikko — luku, ulkoinen oraakkeli, jota vasten se on tarkistettu, ja rehellinen Validoitu / Mallinnettu -tila väitettä kohti. ”Vain validoidut” rajaa aineistotarkistettuihin riveihin.

js-lib-tour-validation-title = Todisteita, ei adjektiiveja

js-lib-views-3-sigma-bound = 3-sigman raja

js-lib-views-3d-position-error = 3D-paikkavirhe

js-lib-views-a-parameter = parametri

js-lib-views-band-runs = Aikavirhekaista { $runs } Monte Carlo -ajon yli

js-lib-views-band-the-runs = Aikavirhekaista Monte Carlo -ajojen yli

js-lib-views-below-tracking = seurantakynnyksen alapuolella

js-lib-views-chart = kaavio

js-lib-views-classical = klassinen

js-lib-views-epoch = ajanhetki

js-lib-views-four-needed = 4 tarvitaan paikanmääritykseen

js-lib-views-free-inertial = vapaa inertia

js-lib-views-gnss-denied = GNSS estetty

js-lib-views-ground-track = Maanpintajälki

js-lib-views-heatmap-effective = Efektiivinen kantoaalto–kohinatiheys satelliitin ja ajan mukaan

js-lib-views-heatmap-nominal = Nimellinen (ei häirintälähdettä) kantoaalto–kohinatiheys satelliitin ja ajan mukaan

js-lib-views-horizontal-alert-limit = vaakasuuntainen hälytysraja

js-lib-views-horizontal-hpl = vaaka (HPL)

js-lib-views-id-bound = { $id }: raja

js-lib-views-id-median = { $id }: mediaani

js-lib-views-id-offset = { $id }: poikkeama

js-lib-views-id-p95 = { $id }: p95

js-lib-views-map-matched = karttaan sovitettu

js-lib-views-map-matched-title = Karttaan sovitettu vapaan inertian paikkavirheeseen verrattuna

js-lib-views-metric = mittari

js-lib-views-oscillator = oskillaattori

js-lib-views-oscillator-source = oskillaattori ({ $source })

js-lib-views-position-error-axis = paikkavirhe ({ $unit })

js-lib-views-position-error-m = paikkavirhe (m)

js-lib-views-position-error-run = Paikkavirhe ajon aikana

js-lib-views-position-m = paikka (m)

js-lib-views-predicted-time-error = Ennustettu aikavirhe edellisen paikanmäärityksen jälkeen

js-lib-views-protection-level-m = suojaustaso (m)

js-lib-views-protection-levels = Suojaustasot hälytysrajaa vasten

js-lib-views-quantum = kvantti

js-lib-views-relay-error-bound = Relenavigoinnin paikkavirhe ja sen 3-sigman raja

js-lib-views-satellites = satelliittia

js-lib-views-satellites-tracking = Näkyvät ja edelleen seurattavat satelliitit

js-lib-views-shaded-gnss-denied = varjostettu: GNSS estetty

js-lib-views-slot-guard = aikavälisuoja

js-lib-views-spoofed-offset = Harhautettu aikapoikkeama havaitsemisrajaa vasten

js-lib-views-sweep-of = Pyyhkäisy, { $parameter }: { $metric }

js-lib-views-sync-error-axis = synkronointivirhe ({ $unit })

js-lib-views-sync-error-run = Synkronointivirhe ajon aikana

js-lib-views-threshold = kynnys

js-lib-views-time-error-ns = aikavirhe (ns)

js-lib-views-time-ns = aika (ns)

js-lib-views-time-s = aika (s)

js-lib-views-time-since-fix = aika edellisestä paikanmäärityksestä (s)

js-lib-views-timing-error-axis = ajoitusvirhe ({ $unit })

js-lib-views-timing-error-run = Ajoitusvirhe ajon aikana

js-lib-views-tracking = seuranta

js-lib-views-value = arvo

js-lib-views-vertical-vpl = pysty (VPL)

js-lib-views-visible = näkyvissä

js-lib-views-word-enbw = ekvivalentti kohinakaistanleveys

js-lib-views-word-nfft = FFT-pituus

js-lib-views-word-stec = vino TEC

js-lib-views-word-toa = saapumisaika

js-lib-views-word-ttff = aika ensimmäiseen paikanmääritykseen

js-lib-views-word-tx = lähetys

js-lib-views-word-zwd = tsenitin märkäviive

js-lunar-address-outside-range = { $label }: ”{ $raw }” on alueen { $min }–{ $max } ulkopuolella; käytetään tiedoston arvoa.

js-lunar-address-too-long = Osoite oli liian pitkä; näytetään oletukset.

js-lunar-address-unknown-source = Osoitteessa on tuntematon lähde; näytetään tallenne.

js-lunar-alert-limit = hälytysraja { $value } (havainnollistava)

js-lunar-alert-not-stated = hälytysrajaa ei ilmoitettu

js-lunar-bearing-east = 90° E

js-lunar-bearing-west = 90° W

js-lunar-cell-title = { $lat }°, { $lon }°: korjattu { $corrected }, saatavuus { $availability }, kattavuus { $coverage }

js-lunar-copy-address = Kopioi osoite osoitepalkista.

js-lunar-counts = Satelliitteja { $sats }, ruudukkopisteitä { $points }, ajanhetkiä { $epochs }, Monte Carlo -kokeita { $trials } ajanhetkeä kohti. Nimike: { $label }.

js-lunar-engine-no-start = Moottoria ei voitu käynnistää tässä selaimessa ({ $reason }). Avaa sen sijaan tulostiedosto.

js-lunar-engine-unknown-kind = Tämä moottori ({ $version }) ei tunne lajia { $kind }; se tarvitsee moottorin 0.36.

js-lunar-fig-availability-region = Saatavuus alueella

js-lunar-fig-corrected-3d = Korjattu virhe, { $n } %, 3‑D

js-lunar-fig-coverage = Kattavuus

js-lunar-fig-epochs-within = ajanhetket arvon { $value } sisällä

js-lunar-fig-horizontal-vertical = vaaka { $h }, pysty { $v }

js-lunar-fig-hpl-below-alert = HPL hälytysrajan alapuolella

js-lunar-fig-hpl-vpl = HPL, VPL enintään

js-lunar-fig-improvement = Parannuskerroin

js-lunar-fig-lowest-point = Pienin pisteessä

js-lunar-fig-points-always-available = Pisteet, jotka ovat saatavilla joka ajanhetkellä

js-lunar-fig-uncorrected-3d = Korjaamaton virhe, { $n } %, 3‑D

js-lunar-fig-worst-point = Huonoin piste

js-lunar-file-not-json = Tämä tiedosto ei ole JSON-tiedosto.

js-lunar-file-not-object = Tämä tiedosto ei ole JSON-objekti.

js-lunar-file-too-large = { $name }: suurempi kuin 32 MiB; tämä sivu lukee tulostiedostoja enintään tuon kokoon asti.

js-lunar-file-value = tiedosto: { $value }

js-lunar-full-of-total = { $full } / { $total }

js-lunar-give-value = { $label }: anna arvo väliltä { $min }–{ $max }.

js-lunar-give-whole-value = { $label }: anna arvo väliltä { $min }–{ $max } (kokonaisluku).

js-lunar-honesty-affiliation = Ei ole sidoksissa mihinkään virastoon eikä minkään viraston hyväksymä.

js-lunar-honesty-assumptions = Ilmoitettujen julkisten oletusten mukaan; ei väite minkään todellisen järjestelmän suorituskyvystä.

js-lunar-in-grid-spacing = Ruudukon rengasväli, astetta

js-lunar-in-latency = Korjauksen viive, sekuntia

js-lunar-in-seed = Siemenluku

js-lunar-in-station-lat = Aseman leveysaste, astetta

js-lunar-in-station-lon = Aseman pituusaste, astetta

js-lunar-in-survey-error = Aseman mittausvirhe (1-sigma), metriä

js-lunar-in-threshold = Tarkkuuskynnys, metriä

js-lunar-in-time-step = Aika-askel, sekuntia

js-lunar-in-trials = Monte Carlo -kokeita ajanhetkeä kohti

js-lunar-input-out-of-range = { $label } on sallitun alueen ulkopuolella.

js-lunar-json-field-not-json = Tiedoston json-kenttä ei ole JSON-muodossa.

js-lunar-key-50-or-more = 50 % tai enemmän

js-lunar-key-90-or-more = 90 % tai enemmän

js-lunar-key-95-or-more = 95 % tai enemmän

js-lunar-key-99-or-more = 99 % tai enemmän

js-lunar-key-above = yli { $value }

js-lunar-key-above-threshold = yli { $value } × kynnys

js-lunar-key-below-50 = alle 50 %

js-lunar-key-between = { $from } – { $to }

js-lunar-key-between-threshold = { $from } – { $to } × kynnys

js-lunar-key-up-to = enintään { $value }

js-lunar-key-up-to-threshold = enintään { $value } × kynnys

js-lunar-layer-availability = saatavuus

js-lunar-layer-coverage = kattavuus

js-lunar-layer-error = korjattu virhe

js-lunar-layer-range = korjattu virhe oman vaihteluvälinsä mukaan

js-lunar-legend-no-figure = ei lukua (ei saatavilla lainkaan)

js-lunar-legend-radius = kattavuussäde

js-lunar-legend-threshold = kynnys, { $value }

js-lunar-legend-worst = huonoin piste

js-lunar-link-copied = Linkki kopioitu.

js-lunar-map-desc = Ruudukkopisteitä { $points } navalta leveysasteelle { $rim }°. Näistä { $meet } pisteessä korjatun virheen persentiili { $percentile } on kynnyksen { $threshold } sisällä. Väritys: { $layer }. Asema on kohdassa { $lat }°, { $lon }°.

js-lunar-map-note-one-band = { $share } % pisteistä osuu yhteen kynnysasteikon kaistaan, joten kartta näyttää vain vähän vaihtelua: värjää ”oman vaihteluvälin” mukaan nähdäksesi, miten virhe vaihtelee alueella.

js-lunar-needs-newer-engine = Tämä tutkimus tarvitsee moottorin { $need } tai uudemman; täällä ajettava moottori on v{ $version }. Tallenne tai tulostiedosto voidaan silti näyttää.

js-lunar-no = ei

js-lunar-no-recording = Tästä tutkimuksesta ei vielä toimiteta tallennetta: se tehdään julkaisun yhteydessä moottorilla 0.36. Aja se täällä moottorilla, jossa on kyseinen laji, tai avaa tulostiedosto.

js-lunar-no-scenario = Tällä sivustolla ei vielä ole tiedostoa { $file }: se tulee moottorin 0.36 mukana. Avaa sen sijaan tulostiedosto.

js-lunar-no-scenario-note = Tällä sivustolla ei vielä ole tiedostoa { $file } (se tulee moottorin 0.36 mukana), joten ajo täällä ei ole mahdollinen; avaa sen sijaan tulostiedosto.

js-lunar-not-report = Tämä ei ole { $kind }-raportti.

js-lunar-not-stated = ei ilmoitettu

js-lunar-note-none = Tiedosto ei ilmoita huomautusta.

js-lunar-note-withheld = Tiedoston oma ilmoitus nimeää ohjelman tai viraston, joten tämä sivu ei näytä sitä; sivun yläreunan ilmoitus on voimassa.

js-lunar-point-epochs-reason = pisteajanhetket: { $reason }

js-lunar-radius-desc = Kattavuussäde { $count } atsimuutin yli: lyhin { $lo } km atsimuutissa { $loAz }°, pisin { $hi } km atsimuutissa { $hiAz }°.

js-lunar-radius-desc-limited =
    { $count ->
        [one] { $count } atsimuutti yltää ruudukon reunaan, joten kattavuus ulottuu siellä vähintään niin pitkälle.
       *[other] { $count } atsimuuttia yltää ruudukon reunaan, joten kattavuus ulottuu niissä vähintään niin pitkälle.
    }

js-lunar-radius-hollow = Ontot pisteet yltävät ruudukon reunaan: kattavuus pitää vähintään niin pitkälle tuossa suunnassa.

js-lunar-radius-none = Raportti ei ilmoita kattavuussädettä.

js-lunar-radius-per-azimuth = kattavuussäde atsimuuttia kohti

js-lunar-radius-point = { $az }°: { $km } km

js-lunar-radius-point-limited = { $az }°: { $km } km (yltää ruudukon reunaan: vähintään näin pitkälle)

js-lunar-radius-zero = Joka suunnassa kattavuus on jo asemalla alle 95 %, joten säde on 0 km: korjattu virhe ylittää siellä kynnyksen { $value }.

js-lunar-reason-station-missing = asema ei näe kaikkia käyttäjän käyttämiä satelliitteja

js-lunar-reason-user-lt4 = käyttäjän näkyvissä alle neljä satelliittia

js-lunar-run-stopped = Ajo pysähtyi: { $message }

js-lunar-running = Ajetaan tutkimusta tässä selaimessa…

js-lunar-running-elapsed = Ajetaan tutkimusta tässä selaimessa… { $seconds } s

js-lunar-scenario-missing-keys = Skenaariotiedostosta puuttuu { $keys }; sitä ei voi muuttaa täällä.

js-lunar-set-inputs = Aseta syötteet ja paina Aja täällä.

js-lunar-showing = Näytetään: { $what }.

js-lunar-showing-engine = Näytetään: { $what } (moottori { $version }).

js-lunar-source-error = { $what }: { $error }

js-lunar-station = asema

js-lunar-station-title = asema { $lat }°, { $lon }°

js-lunar-table-count =
    { $n ->
        [one] { $n } piste, asemaa lähinnä oleva ensin.
       *[other] { $n } pistettä, asemaa lähinnä oleva ensin.
    }

js-lunar-th-corrected = Korjattu virhe, { $n } %

js-lunar-threshold-title = korjattu virhe { $value } (kynnys)

js-lunar-what-file = tiedosto { $name }

js-lunar-what-recording = Studion mukana toimitettu tallenne

js-lunar-what-run = ajo tässä selaimessa (moottori { $version })

js-lunar-worst-at = kohdassa { $lat }°, { $lon }°

js-lunar-worst-title = huonoin piste { $lat }°, { $lon }°: { $value }

js-lunar-yes-at-least = kyllä: vähintään näin pitkälle

js-lunarinfra-above-95-point = 95 %:n pisteen yläpuolella

js-lunarinfra-advisory = Ohjeellinen ohjelmisto, ei tyyppihyväksytty laite; ei minkäänlaista lähetyspolkua.

js-lunarinfra-arc-note = Kantoaallon aallonpituus { $value } m.

js-lunarinfra-arc-title = Jokainen kaari

js-lunarinfra-bars-not-loaded = kynnystiedosto ei latautunut

js-lunarinfra-bars-not-shown = Ennakkorekisteröityjä kynnyksiä ei voitu näyttää ({ $reason }).

js-lunarinfra-bars-note = Kiinnitetty ennen kuin yhtäkään tutkimusta pisteytettiin, ja ratkaisut ovat virallisia (moottorin commit { $commit }). Mikään ei ole VALIDATED; kynnys, joka on merkitty NOT MET, on lukittu testillä, joka vahvistaa alituksen, eikä yhtäkään ole löysennetty.

js-lunarinfra-bars-title = Ennakkorekisteröityjä kynnyksiä vasten

js-lunarinfra-bars-wrong-file = kynnystiedosto ei ole se, jota tämä sivu lukee

js-lunarinfra-blurb-carrier-phase = Pinta-asema ja kiertäjä, jotka käyttävät Maan GNSS-signaalien kaksoisdifferenssoitua kantoaallon vaihetta: voidaanko kokonaislukuepävarmuudet ratkaista, ja mitä se tekee paikan rajalle? Nopea esimerkkiajo.

js-lunarinfra-blurb-frame-coestimation = Kuun vertailupisteen seitsemän parametria Maa-aseman laseretäisyysmittauksesta, kiertäjän ja pinta-aseman välisten etäisyyksien kanssa ja ilman niitä: kuinka paljon informaatio paranee?

js-lunarinfra-blurb-geodesy-sensitivity = Kuinka herkkiä laseretäisyysmittaus, kiertäjän seuranta, gravimetri ja pintakello ovat Kuun vuorovesi-Love-luvuille h2, k2 ja l2 sekä sen fyysiselle libraatiolle?

js-lunarinfra-blurb-od-consistency = Kiertäjän oma Maan GNSS-radanmääritys lähes suoraviivaisella haloradalla verrattuna saman kaaren riippumattomaan maanpäälliseen radiometriseen ratkaisuun: ovatko ne samaa mieltä ilmoitettujen epävarmuuksiensa rajoissa, ja huomaako yhdenmukaisuustarkistus mallinnusvirheen, kun sellainen syötetään? Näytetään rinnakkain.

js-lunarinfra-blurb-space-tie = GNSS, VLBI ja laseretäisyysmittaus yhdellä avaruusaluksella: kuinka tarkasti kolmen tekniikan väliset poikkeamat voidaan sitoa, verrattuna avaruusaluksen paikallisen sidoksen virheeseen?

js-lunarinfra-bound-label = Paikan epävarmuus, float ja fixed, logaritminen asteikko

js-lunarinfra-bound-note = Aseman ja kiertäjän yhden sigman paikan epävarmuus, kun epävarmuudet jätetään float-tilaan ja kun ne kiinnitetään (mitä kiinnittäminen antaisi, jos se saavutettaisiin).

js-lunarinfra-bound-title = Paikan raja, float ja fixed

js-lunarinfra-chip-na = n/a

js-lunarinfra-comp-normal = normaali

js-lunarinfra-comp-position = paikka (3D)

js-lunarinfra-comp-radial = radiaalinen

js-lunarinfra-comp-transverse = poikittainen

js-lunarinfra-compare-note = { $sets } satunnaisella asemajoukolla pienin ominaisarvo ei ollut pienempi kiertäjälinkkien kanssa tapauksessa { $lambda } eikä jälki suurempi tapauksessa { $trace }; pienimmän ominaisarvon kasvun mediaani oli { $median } kertaa.

js-lunarinfra-compare-title = Vertailu lukuina

js-lunarinfra-crsigma-label = Cramér–Rao-sigma, logaritminen asteikko

js-lunarinfra-crsigma-note = Metreinä pinnalla.

js-lunarinfra-crsigma-title = Cramér–Rao-sigma parametria kohti

js-lunarinfra-days =
    { $n ->
        [one] { $n } päivä
       *[other] { $n } päivää
    }

js-lunarinfra-direction = suunta { $n }

js-lunarinfra-disclosures = Ilmoitukset

js-lunarinfra-eig-label = Informaation ominaisarvot, logaritminen asteikko

js-lunarinfra-eig-note = Informaatiomatriisin seitsemän ominaisarvoa, pienin ensin, ilman kiertäjä–asema-linkkejä ja niiden kanssa. Pienin nousee { $times } kertaa, ja Cramér–Rao-jälki laskee arvoon { $share } sen arvosta. Tämä olettaa, että rata tunnetaan Kuun akseleissa (sen virhe sisältyy kiertäjän etäisyyssigmaan).

js-lunarinfra-eig-title = Informaatio vertailupisteen jokaisessa suunnassa

js-lunarinfra-fact-arc = Kaari

js-lunarinfra-fact-hash = Skenaarion tiiviste

js-lunarinfra-fact-llr-rows = Laseretäisyysmittauksen rivit

js-lunarinfra-fact-orbit-family = Ratatyyppi

js-lunarinfra-fact-orbiter-arc = Kiertäjän kaari

js-lunarinfra-fact-orbiter-rows = Kiertäjän rivit

js-lunarinfra-fact-study = Tutkimus

js-lunarinfra-fact-wavelength = Kantoaallon aallonpituus

js-lunarinfra-families-note = Kunkin parametrin osittaisderivaatan RMS perheen riveillä sekä rivien määrä. Nolla on parametri, jolle kyseinen perhe on sokea. Kiertäjäperheen k2-herkkyys on ylärajan luku.

js-lunarinfra-families-title = Mitä kukin perhe näkee

js-lunarinfra-findings = Havainnot

js-lunarinfra-fix-note-a = Niiden Monte Carlo -kokeiden osuus, jotka ratkaisivat jokaisen kokonaislukuepävarmuuden oikein (standardivirheineen), sekä nopeus, jonka bootstrap-estimaatti ennustaa.

js-lunarinfra-fix-note-b = Kokonaislukuratkaisua EI saavuteta tällä syötteellä: paras kaari ratkaisee { $share } kokeista.

js-lunarinfra-fix-note-c = Ratkaisuun kuluvaa aikaa ei ole näytettävänä, koska ratkaisua ei saavuteta.

js-lunarinfra-fix-rate-label = Kokonaislukuratkaisun osuus kaaren pituuden funktiona

js-lunarinfra-fix-title = Ratkaisuosuus kaaren pituuden funktiona

js-lunarinfra-fixed = kiinnitetty (fixed)

js-lunarinfra-float = reaaliarvoinen (float)

js-lunarinfra-fraction-above-95 = 95 %:n pisteen ylittävien kokeiden osuus

js-lunarinfra-ground-radiometric = riippumaton maanpäällinen radiometrinen

js-lunarinfra-injected-error = syötetty virhe { $value } m/s²

js-lunarinfra-mean-consistency = Yhdenmukaisuustunnusluvun keskiarvo

js-lunarinfra-mean-q = q:n keskiarvo

js-lunarinfra-miss-line = { $id } on { $status }: { $value }

js-lunarinfra-miss-no-fix = Kokonaislukuepävarmuuden ratkaisua EI saavuteta tällä syötteellä: paras kaari ratkaisee { $share } Monte Carlo -kokeista.

js-lunarinfra-na = n/a

js-lunarinfra-nominal = nimellinen

js-lunarinfra-not-result = tämä ei ole Kuun infrastruktuurin tulos

js-lunarinfra-not-verified = Ei varmennettu

js-lunarinfra-offset-precision-label = Poikkeaman tarkkuus paikalliseen sidokseen nähden, log–log

js-lunarinfra-offsets-note = Siirtymän sigma akselia kohti sekä mittakaavan ja kierron sigma pinnalla, metreinä.

js-lunarinfra-offsets-title = Poikkeamat kunkin sidosvirheen kohdalla ({ $days } päivän kaari, { $epochs } ajanhetkeä)

js-lunarinfra-onboard-gnss = aluksella oleva Maan GNSS

js-lunarinfra-open-failed = Kohdetta { $title } ei voitu avata: { $reason }.

js-lunarinfra-opening = Avataan: { $title }…

js-lunarinfra-orbit-uncertainty-log = Radan epävarmuus komponenteittain, logaritminen asteikko

js-lunarinfra-orbiter-days = kiertäjä, { $days } vrk

js-lunarinfra-q-note = Yhdenmukaisuustunnusluvun q keskiarvo { $trials } kokeen yli; { $expected } on arvo, jonka yhdenmukainen ratkaisupari antaa. 95 %:n pisteen ylittävien kokeiden osuus on tarkistuksen havaitsemisosuus.

js-lunarinfra-q-title = Yhdenmukaisuustarkistus, nimellinen syötettyä virhettä vasten

js-lunarinfra-recorded =
    { $n ->
        [one] { $title }: moottorin tallentama tulos (versio { $version }).
       *[other] { $title }: moottorin tallentamat tulokset (versio { $version }).
    }

js-lunarinfra-rel-label = Sigma nimellisarvoon nähden, logaritminen asteikko

js-lunarinfra-rel-note = Cramér–Rao-sigma prosentteina nimellisarvosta, kaikki neljä perhettä yhdessä. h2 ja l2 ovat linearisointipisteitä, eivät varmennettuja arvoja; k2 on julkaistusta sovituksesta.

js-lunarinfra-rel-title = Kuinka hyvin kukin parametri voidaan määrittää nimellisarvoonsa nähden

js-lunarinfra-result-not-json = tulos ei ole JSON-muodossa ({ $reason })

js-lunarinfra-result-not-loaded = tallennettu tulos { $file } ei latautunut

js-lunarinfra-row-above-95 = 95 %:n pisteen ylittävät kokeet (khiin neliö 95 % = { $chi })

js-lunarinfra-row-crtrace = Cramér–Rao-jälki

js-lunarinfra-row-degeneracy = Rappeutumismitta

js-lunarinfra-row-formal-diff = Tuon eron muodollinen sigma

js-lunarinfra-row-ground-meas = Maa: mittaukset, ajanhetket asemalla

js-lunarinfra-row-mean-diff = Kahden radan keskimääräinen ero

js-lunarinfra-row-mean-q = q:n keskiarvo (odotettu 6)

js-lunarinfra-row-observations = Havainnot

js-lunarinfra-row-onboard-epochs = Aluksella: ajanhetket, joissa vähintään yksi / vähintään neljä satelliittia

js-lunarinfra-row-onboard-meas = Aluksella: mittaukset, seurattujen satelliittien keskiarvo

js-lunarinfra-row-origin-scale = Origon ja mittakaavan korrelaatio

js-lunarinfra-row-origin-sigma = Origon sigma, m

js-lunarinfra-row-rank-defect = Aste (vaje)

js-lunarinfra-row-smallest-eig = Pienin ominaisarvo

js-lunarinfra-row-trace-ground = Otos suhteessa muodolliseen jälkeen, maa

js-lunarinfra-row-trace-onboard = Otos suhteessa muodolliseen jälkeen, alus

js-lunarinfra-row-within-95 = 95 %:n pisteen sisällä olevat kokeet

js-lunarinfra-series-bootstrapped = bootstrap-estimaatti

js-lunarinfra-series-floor = lattia

js-lunarinfra-series-monte-carlo = Monte Carlo

js-lunarinfra-side-note = Rata: { $family }, { $arc } päivän kaari { $period } päivän radasta, näytteitä { $sample } s välein.

js-lunarinfra-side-title = Rinnakkain

js-lunarinfra-sigma-note = Yhden sigman paikan epävarmuus komponenteittain, metreinä, saman kaaren kahdesta estimaatista.

js-lunarinfra-sigma-over-nominal = sigma / nimellisarvo

js-lunarinfra-sigma-title = Kuinka hyvin kumpikin puoli tuntee radan

js-lunarinfra-station-days = asema, { $days } vrk

js-lunarinfra-status-verdict = { $status }: { $verdict }

js-lunarinfra-subsets-note = Perheen lisääminen ei koskaan pienentänyt pienintä ominaisarvoa ({ $lambda } / { $pairs } lisäystä), mutta pseudoinverssin jälki ei ollut suurempi vain { $trace } / { $pairs } tapauksessa, koska lisätty perhe voi nostaa astetta.

js-lunarinfra-subsets-title = Perheiden jokainen yhdistelmä

js-lunarinfra-sweep-note = Kunkin poikkeaman pahin siirtymäkomponentti metreinä, kun avaruusaluksella olevan kolmen tekniikan välisen sidoksen virhettä pyyhkäistään. Rekisteröidyillä tekniikoiden sigmoilla (GNSS { $gnss } m, VLBI { $vlbi } m, laser { $slr } m) poikkeamia rajoittaa mittauskohina, ei sidos; sidos määrää lattian vain lähes täydellisille tekniikoille.

js-lunarinfra-sweep-title = Tekniikoiden poikkeamien tarkkuus paikalliseen sidokseen nähden ({ $days } päivän kaari)

js-lunarinfra-th-arc-days = Kaari, päiviä

js-lunarinfra-th-bar = Kynnys

js-lunarinfra-th-bootstrapped = Bootstrap-osuus

js-lunarinfra-th-budget-exhausted = Hakubudjetti käytetty loppuun (kokeet)

js-lunarinfra-th-common-sats = Ajanhetket, joissa vähintään 2 yhteistä satelliittia

js-lunarinfra-th-crtrace = Cramér–Rao-jälki

js-lunarinfra-th-dd-ambiguities = Kaksoisdifferenssien epävarmuudet

js-lunarinfra-th-epochs = Ajanhetket

js-lunarinfra-th-families = Perheet

js-lunarinfra-th-family = Perhe

js-lunarinfra-th-local-tie = Paikallisen sidoksen sigma, m

js-lunarinfra-th-mc-fix-rate = Monte Carlo -ratkaisuosuus

js-lunarinfra-th-median-ambiguity = Epävarmuuden sigman mediaani, jaksoa

js-lunarinfra-th-offset = Poikkeama

js-lunarinfra-th-quantity = Suure

js-lunarinfra-th-rank = Aste

js-lunarinfra-th-rotation = Kierto pinnalla, m

js-lunarinfra-th-rows = Rivit

js-lunarinfra-th-scale = Mittakaava pinnalla, m

js-lunarinfra-th-smallest-eig = Pienin ominaisarvo

js-lunarinfra-th-translation = Siirtymä x, y, z, m

js-lunarinfra-th-value = Arvo

js-lunarinfra-th-verdict = Ratkaisu

js-lunarinfra-th-with-links = Kiertäjälinkkien kanssa

js-lunarinfra-th-without-links = Ilman kiertäjälinkkejä

js-lunarinfra-title-carrier-phase = Kantoaallon vaihe, pinta ja kiertäjä

js-lunarinfra-title-frame-coestimation = Koordinaatiston yhteisestimointi

js-lunarinfra-title-geodesy-sensitivity = Love-luvut ja libraatio

js-lunarinfra-title-od-consistency = Radanmäärityksen yhdenmukaisuus

js-lunarinfra-title-space-tie = Avaruussidos

js-lunarinfra-unknown-study = tämä Kuun infrastruktuurin tulos on tutkimus ”{ $study }”, jota tämä sivu ei lue

js-lunarinfra-where-missed = Missä tämä tutkimus jäi vajaaksi.

js-lunarinfra-with-links = kiertäjälinkkien kanssa

js-lunarinfra-without-links = ilman kiertäjälinkkejä

js-lunarinfra-x-arc-length = kaaren pituus, päiviä

js-lunarinfra-x-local-tie = paikallisen sidoksen sigma, m (log)

js-lunarinfra-y-fixed-correctly = ratkaistu oikein, %

js-lunarinfra-y-offset-sigma = poikkeaman sigma, m (log); katkoviivalla piirretty lattia on pelkkä sidos, sqrt(2) × sidosvirhe

js-meaning-body-generic = kappale

js-meaning-body-the = { $name }

js-meaning-card-label-sub = { $k }, { $sub }

js-meaning-checks-of =
    { $n ->
        [one] { $av } / { $n } tarkistus
       *[other] { $av } / { $n } tarkistusta
    }

js-meaning-coverage-average-label = Keskiarvo näkyvissä

js-meaning-coverage-big-min =
    { $n ->
        [one] Jokaisessa paikassa näkyvissä vähintään { $n } satelliitti, keskimäärin { $mean }.
       *[other] Jokaisessa paikassa näkyvissä vähintään { $n } satelliittia, keskimäärin { $mean }.
    }

js-meaning-coverage-big-none = Joissakin paikoissa ei ajoittain näy yhtään satelliittia; näkyvissä on keskimäärin { $mean }.

js-meaning-coverage-fewest-label = Vähiten näkyvissä, missä tahansa

js-meaning-coverage-line-many = Kun { $names } ovat yhdessä käytössä, paikanmääritys on mahdollinen { $share } % paikoista ja ajanhetkistä (keskuskappale: { $body }).

js-meaning-coverage-line-many-pdop = Kun { $names } ovat yhdessä käytössä, paikanmääritys on mahdollinen { $share } % paikoista ja ajanhetkistä (keskuskappale: { $body }; geometrian laatu, PDOP, alle { $thr }).

js-meaning-coverage-line-none = Paikanmääritys on mahdollinen { $share } % paikoista ja ajanhetkistä (keskuskappale: { $body }).

js-meaning-coverage-line-none-pdop = Paikanmääritys on mahdollinen { $share } % paikoista ja ajanhetkistä (keskuskappale: { $body }; geometrian laatu, PDOP, alle { $thr }).

js-meaning-coverage-line-one = Kun käytössä on { $names }, paikanmääritys on mahdollinen { $share } % paikoista ja ajanhetkistä (keskuskappale: { $body }).

js-meaning-coverage-line-one-pdop = Kun käytössä on { $names }, paikanmääritys on mahdollinen { $share } % paikoista ja ajanhetkistä (keskuskappale: { $body }; geometrian laatu, PDOP, alle { $thr }).

js-meaning-coverage-places-label = Paikat, joissa saadaan paikanmääritys

js-meaning-duration-days =
    { $n ->
        [one] { $days } päivä
       *[other] { $days } päivää
    }

js-meaning-ensemble-big-many = Monien kohinaotosten yli { $q } pysyy { $thr } ns:n sisällä keskimäärin { $qd } ajan; { $c } { $cd } ajan.

js-meaning-ensemble-big-runs =
    { $n ->
        [one] { $n } kohinaotoksen yli { $q } pysyy { $thr } ns:n sisällä keskimäärin { $qd } ajan; { $c } { $cd } ajan.
       *[other] { $n } kohinaotoksen yli { $q } pysyy { $thr } ns:n sisällä keskimäärin { $qd } ajan; { $c } { $cd } ajan.
    }

js-meaning-ensemble-line = Kohteen { $name } yhdeksän otosta kymmenestä kestää { $band }.

js-meaning-ensemble-mean = keskiarvo

js-meaning-ensemble-mean-band = keskiarvo; 90 %:n kaista { $band }

js-meaning-error-p95-label = Virhe, 95 % ajasta, { $name }

js-meaning-generic-big = { $label }: { $value }.

js-meaning-generic-line-one = Myös tästä ajosta: { $a }.

js-meaning-generic-line-two = Myös tästä ajosta: { $a } ja { $b }.

js-meaning-generic-none = Tässä ajossa ei ole yhtä päälukua; alla oleva kaavio näyttää sen tuloksen.

js-meaning-holdover-label = Holdover, { $name }

js-meaning-hpl-sub = vaakasuuntainen suojaustaso

js-meaning-inside-budget = budjetin { $budget } sisällä

js-meaning-integrity-big-checks-mostly = Kyllä, enimmäkseen: { $share } % tarkistuksista.

js-meaning-integrity-big-checks-no = Ei: { $share } % tarkistuksista.

js-meaning-integrity-big-checks-partly = Vain osittain: { $share } % tarkistuksista.

js-meaning-integrity-big-checks-yes = Kyllä: { $share } % tarkistuksista.

js-meaning-integrity-big-span-mostly = Kyllä, enimmäkseen: { $share } % ajasta ({ $span }).

js-meaning-integrity-big-span-no = Ei: { $share } % ajasta ({ $span }).

js-meaning-integrity-big-span-partly = Vain osittain: { $share } % ajasta ({ $span }).

js-meaning-integrity-big-span-yes = Kyllä: { $share } % ajasta ({ $span }).

js-meaning-integrity-bound-label = Tyypillinen virheraja

js-meaning-integrity-bound-sub = vaaka / pysty, mediaani

js-meaning-integrity-gap-all-passed = jokainen tarkistus läpäisty

js-meaning-integrity-gap-label = Pisin aukko

js-meaning-integrity-gap-none = ei yhtään

js-meaning-integrity-gap-sub =
    { $n ->
        [one] { $n } tarkistus peräkkäin alkaen kohdasta { $from }
       *[other] { $n } tarkistusta peräkkäin alkaen kohdasta { $from }
    }

js-meaning-integrity-line-h =
    { $n ->
        [one] Vastaanottimen virheraja (sen suojaustaso) pysyi hälytysrajojen ({ $h } m vaaka) alapuolella { $av } / { $tot } tarkistuksessa.
       *[other] Vastaanottimen virheraja (sen suojaustaso) pysyi hälytysrajojen ({ $h } m vaaka) alapuolella { $av } / { $tot } tarkistuksessa.
    }

js-meaning-integrity-line-h-clean =
    { $n ->
        [one] Vastaanottimen virheraja (sen suojaustaso) pysyi hälytysrajojen ({ $h } m vaaka) alapuolella { $av } / { $tot } tarkistuksessa, eikä yksikään paikanmääritys ollut harhaanjohtava.
       *[other] Vastaanottimen virheraja (sen suojaustaso) pysyi hälytysrajojen ({ $h } m vaaka) alapuolella { $av } / { $tot } tarkistuksessa, eikä yksikään paikanmääritys ollut harhaanjohtava.
    }

js-meaning-integrity-line-h-some =
    { $n ->
        [one] Vastaanottimen virheraja (sen suojaustaso) pysyi hälytysrajojen ({ $h } m vaaka) alapuolella { $av } / { $tot } tarkistuksessa; harhaanjohtavia paikanmäärityksiä oli { $n }.
       *[other] Vastaanottimen virheraja (sen suojaustaso) pysyi hälytysrajojen ({ $h } m vaaka) alapuolella { $av } / { $tot } tarkistuksessa; harhaanjohtavia paikanmäärityksiä oli { $n }.
    }

js-meaning-integrity-line-hv =
    { $n ->
        [one] Vastaanottimen virheraja (sen suojaustaso) pysyi hälytysrajojen ({ $h } m vaaka ja { $v } m pysty) alapuolella { $av } / { $tot } tarkistuksessa.
       *[other] Vastaanottimen virheraja (sen suojaustaso) pysyi hälytysrajojen ({ $h } m vaaka ja { $v } m pysty) alapuolella { $av } / { $tot } tarkistuksessa.
    }

js-meaning-integrity-line-hv-clean =
    { $n ->
        [one] Vastaanottimen virheraja (sen suojaustaso) pysyi hälytysrajojen ({ $h } m vaaka ja { $v } m pysty) alapuolella { $av } / { $tot } tarkistuksessa, eikä yksikään paikanmääritys ollut harhaanjohtava.
       *[other] Vastaanottimen virheraja (sen suojaustaso) pysyi hälytysrajojen ({ $h } m vaaka ja { $v } m pysty) alapuolella { $av } / { $tot } tarkistuksessa, eikä yksikään paikanmääritys ollut harhaanjohtava.
    }

js-meaning-integrity-line-hv-some =
    { $n ->
        [one] Vastaanottimen virheraja (sen suojaustaso) pysyi hälytysrajojen ({ $h } m vaaka ja { $v } m pysty) alapuolella { $av } / { $tot } tarkistuksessa; harhaanjohtavia paikanmäärityksiä oli { $n }.
       *[other] Vastaanottimen virheraja (sen suojaustaso) pysyi hälytysrajojen ({ $h } m vaaka ja { $v } m pysty) alapuolella { $av } / { $tot } tarkistuksessa; harhaanjohtavia paikanmäärityksiä oli { $n }.
    }

js-meaning-integrity-line-v =
    { $n ->
        [one] Vastaanottimen virheraja (sen suojaustaso) pysyi hälytysrajojen ({ $v } m pysty) alapuolella { $av } / { $tot } tarkistuksessa.
       *[other] Vastaanottimen virheraja (sen suojaustaso) pysyi hälytysrajojen ({ $v } m pysty) alapuolella { $av } / { $tot } tarkistuksessa.
    }

js-meaning-integrity-line-v-clean =
    { $n ->
        [one] Vastaanottimen virheraja (sen suojaustaso) pysyi hälytysrajojen ({ $v } m pysty) alapuolella { $av } / { $tot } tarkistuksessa, eikä yksikään paikanmääritys ollut harhaanjohtava.
       *[other] Vastaanottimen virheraja (sen suojaustaso) pysyi hälytysrajojen ({ $v } m pysty) alapuolella { $av } / { $tot } tarkistuksessa, eikä yksikään paikanmääritys ollut harhaanjohtava.
    }

js-meaning-integrity-line-v-some =
    { $n ->
        [one] Vastaanottimen virheraja (sen suojaustaso) pysyi hälytysrajojen ({ $v } m pysty) alapuolella { $av } / { $tot } tarkistuksessa; harhaanjohtavia paikanmäärityksiä oli { $n }.
       *[other] Vastaanottimen virheraja (sen suojaustaso) pysyi hälytysrajojen ({ $v } m pysty) alapuolella { $av } / { $tot } tarkistuksessa; harhaanjohtavia paikanmäärityksiä oli { $n }.
    }

js-meaning-integrity-line-none =
    { $n ->
        [one] Vastaanottimen virheraja (sen suojaustaso) pysyi hälytysrajan alapuolella { $av } / { $tot } tarkistuksessa.
       *[other] Vastaanottimen virheraja (sen suojaustaso) pysyi hälytysrajan alapuolella { $av } / { $tot } tarkistuksessa.
    }

js-meaning-integrity-line-none-clean =
    { $n ->
        [one] Vastaanottimen virheraja (sen suojaustaso) pysyi hälytysrajan alapuolella { $av } / { $tot } tarkistuksessa, eikä yksikään paikanmääritys ollut harhaanjohtava.
       *[other] Vastaanottimen virheraja (sen suojaustaso) pysyi hälytysrajan alapuolella { $av } / { $tot } tarkistuksessa, eikä yksikään paikanmääritys ollut harhaanjohtava.
    }

js-meaning-integrity-line-none-some =
    { $n ->
        [one] Vastaanottimen virheraja (sen suojaustaso) pysyi hälytysrajan alapuolella { $av } / { $tot } tarkistuksessa; harhaanjohtavia paikanmäärityksiä oli { $n }.
       *[other] Vastaanottimen virheraja (sen suojaustaso) pysyi hälytysrajan alapuolella { $av } / { $tot } tarkistuksessa; harhaanjohtavia paikanmäärityksiä oli { $n }.
    }

js-meaning-integrity-misleading-label = Harhaanjohtavat paikanmääritykset

js-meaning-integrity-misleading-sub = todellinen virhe rajan yläpuolella

js-meaning-integrity-trusted-label = Aika, jonka paikanmääritykseen voi luottaa

js-meaning-jamming-above-label = Häirintälähde signaalin yläpuolella

js-meaning-jamming-above-sub = häirintälähteen ja signaalin suhteen keskiarvo

js-meaning-jamming-big-gone = Häirintälähde poistaa paikanmäärityksen kokonaan.

js-meaning-jamming-big-share = Häirintälähteen kanssa paikanmääritys on saatavilla { $share } % ajasta.

js-meaning-jamming-clear-label = Paikanmääritys saatavilla, ei häirintälähdettä

js-meaning-jamming-fewest-label = Vähiten seurattuja satelliitteja

js-meaning-jamming-fewest-sub = pahimmalla hetkellä

js-meaning-jamming-jammed-label = Paikanmääritys saatavilla, häirittynä

js-meaning-jamming-line = Ilman häirintälähdettä paikanmääritys on saatavilla { $share } % ajasta.

js-meaning-jamming-line-js = Ilman häirintälähdettä paikanmääritys on saatavilla { $share } % ajasta; häirintälähde on keskimäärin { $db } dB signaalin yläpuolella.

js-meaning-kicker = { $domain } · { $title }

js-meaning-lunar-big-all =
    { $n ->
        [one] Kyllä: kaikissa { $n } tarkistuksessa.
       *[other] Kyllä: kaikissa { $n } tarkistuksessa.
    }

js-meaning-lunar-big-none =
    { $n ->
        [one] Ei: yhdessäkään { $n } tarkistuksesta.
       *[other] Ei: yhdessäkään { $n } tarkistuksesta.
    }

js-meaning-lunar-big-some =
    { $n ->
        [one] { $av } / { $n } tarkistuksessa ({ $share } %).
       *[other] { $av } / { $n } tarkistuksessa ({ $share } %).
    }

js-meaning-lunar-largest-label = Suurin virheraja

js-meaning-lunar-line = Suojaustaso vaihteli välillä { $min }–{ $max } m hälytysrajaa { $limit } m vasten.

js-meaning-lunar-meet-label = Rajan täyttävät tarkistukset

js-meaning-lunar-meet-value = { $av } / { $tot }

js-meaning-lunar-smallest-label = Pienin virheraja

js-meaning-median-lower-better = mediaani, pienempi on parempi

js-meaning-of-the-time = ajasta

js-meaning-orbit-best-label = Paras geometria (PDOP)

js-meaning-orbit-best-sub = pienin ajon aikana

js-meaning-orbit-big-always = Paikanmääritys on mahdollinen koko ajan.

js-meaning-orbit-big-share = Paikanmääritys on mahdollinen { $share } % ajasta.

js-meaning-orbit-error-label = Tyypillinen paikkavirhe

js-meaning-orbit-error-sub = 1-sigma, mediaani

js-meaning-orbit-line =
    { $n ->
        [one] Satelliitteja oli näkyvissä riittävästi { $fix } / { $n } ajanhetkellä.
       *[other] Satelliitteja oli näkyvissä riittävästi { $fix } / { $n } ajanhetkellä.
    }

js-meaning-orbit-line-pdop =
    { $n ->
        [one] Satelliitteja oli näkyvissä riittävästi { $fix } / { $n } ajanhetkellä; tyypillinen geometrian laatu (PDOP, paikan tarkkuuden heikkenemiskerroin) on { $pdop }, pienempi on parempi.
       *[other] Satelliitteja oli näkyvissä riittävästi { $fix } / { $n } ajanhetkellä; tyypillinen geometrian laatu (PDOP, paikan tarkkuuden heikkenemiskerroin) on { $pdop }, pienempi on parempi.
    }

js-meaning-orbit-moments =
    { $n ->
        [one] { $fix } / { $n } ajanhetki
       *[other] { $fix } / { $n } ajanhetkeä
    }

js-meaning-orbit-time-label = Aika, jolloin paikanmääritys on mahdollinen

js-meaning-pair-big-diff-pos = { $best } pysyy rajan { $budget } sisällä { $bestDur } ajan; { $other } { $otherDur } ajan.

js-meaning-pair-big-diff-time = { $best } pitää ajan rajan { $budget } sisällä { $bestDur } ajan; { $other } { $otherDur } ajan.

js-meaning-pair-big-same-pos = Sekä { $q } että { $c } pysyvät rajan { $budget } sisällä { $dur } ajan.

js-meaning-pair-big-same-time = Sekä { $q } että { $c } pitävät ajan rajan { $budget } sisällä { $dur } ajan.

js-meaning-pair-line-clock = Holdover tarkoittaa, kuinka kauan kukin kello pysyy budjetin { $budget } sisällä satelliittinavigoinnin menetyksen jälkeen.

js-meaning-pair-line-navigator = Holdover tarkoittaa, kuinka kauan kukin navigaattori pysyy budjetin { $budget } sisällä satelliittinavigoinnin menetyksen jälkeen.

js-meaning-pdop-label = Geometrian laatu (PDOP)

js-meaning-places-times = paikoista ja ajanhetkistä

js-meaning-range-to = { $from } – { $to }

js-meaning-satellites =
    { $n ->
        [one] satelliitti
       *[other] satelliittia
    }

js-meaning-spectrum-above = kynnyksen yläpuolella

js-meaning-spectrum-below = kynnyksen alapuolella: menetetty

js-meaning-spectrum-big-kept =
    { $n ->
        [one] Kaikkien { $n } signaalin seuranta jatkuu.
       *[other] Kaikkien { $n } signaalin seuranta jatkuu.
    }

js-meaning-spectrum-big-lost =
    { $n ->
        [one] Häirintälähteet vievät { $lost } / { $n } signaalista: { $names }.
       *[other] Häirintälähteet vievät { $lost } / { $n } signaalista: { $names }.
    }

js-meaning-spectrum-line-kept =
    { $n ->
        [one] { $names } pysyy vastaanottimen seurantakynnyksen yläpuolella koko ajon ajan.
       *[other] { $names } pysyvät vastaanottimen seurantakynnyksen yläpuolella koko ajon ajan.
    }

js-meaning-spectrum-line-kept-thr =
    { $n ->
        [one] { $names } pysyy vastaanottimen { $thr } dB-Hz:n seurantakynnyksen yläpuolella koko ajon ajan.
       *[other] { $names } pysyvät vastaanottimen { $thr } dB-Hz:n seurantakynnyksen yläpuolella koko ajon ajan.
    }

js-meaning-spectrum-line-none = Yksikään signaali ei pysy vastaanottimen seurantakynnyksen yläpuolella koko ajon ajan.

js-meaning-spectrum-line-none-thr = Yksikään signaali ei pysy vastaanottimen { $thr } dB-Hz:n seurantakynnyksen yläpuolella koko ajon ajan.

js-meaning-spectrum-weakest-label = Heikoin signaali, { $name }

js-meaning-whole-run = koko ajon ajalta

js-meaning-your-setting = oma asetus

js-meankind-acm-big =
    { $n ->
        [one] Mukautuva koodaus siirtää { $gain } kertaa enemmän dataa kuin paras kiinteä tila: { $acm } Gbit verrattuna arvoon { $ccm } Gbit { $n } ohituksen aikana.
       *[other] Mukautuva koodaus siirtää { $gain } kertaa enemmän dataa kuin paras kiinteä tila: { $acm } Gbit verrattuna arvoon { $ccm } Gbit { $n } ohituksen aikana.
    }

js-meankind-acm-line = Kiinteä tila { $mode }; katkoa { $dur }.

js-meankind-anomaly-big = Kvanttivikamonitori saa tuloksen { $q }, klassinen { $c } (käyrän alle jäävä pinta-ala, 1 on täydellinen).

js-meankind-anomaly-line = Pienin havaittavissa oleva vika on { $q }, klassisella { $c }.

js-meankind-aocs-big-open = { $slew } asteen kääntö ei asetu alle { $threshold } asteen.

js-meankind-aocs-big-settles = { $slew } asteen kääntö asettuu alle { $threshold } asteen ajassa { $dur }.

js-meankind-aocs-line = Lopullinen osoitusvirhe { $final } astetta.

js-meankind-aocs-line-filter = Lopullinen osoitusvirhe { $final } astetta. Silmukassa oleva asennonsuodin poikkeaa { $arcsec } arcsec RMS.

js-meankind-aocs-line-wheel = Lopullinen osoitusvirhe { $final } astetta. Vauhtipyörän huippumomentti { $torque } N m.

js-meankind-aocs-line-wheel-filter = Lopullinen osoitusvirhe { $final } astetta. Vauhtipyörän huippumomentti { $torque } N m. Silmukassa oleva asennonsuodin poikkeaa { $arcsec } arcsec RMS.

js-meankind-aperture-big = Navigointi käyttää { $nav } % antenniajasta ja tietoliikenne { $comms } %.

js-meankind-aperture-big-idle = Navigointi käyttää { $nav } % antenniajasta ja tietoliikenne { $comms } %; { $idle } % on joutilaana.

js-meankind-aperture-line-all =
    { $n ->
        [one] { $n } apertuuri säännön { $policy } mukaan, kilpailutilannetta { $dur }.
       *[other] { $n } apertuuria säännön { $policy } mukaan, kilpailutilannetta { $dur }.
    }

js-meankind-aperture-line-contention =
    { $n ->
        [one] { $n } apertuuri, kilpailutilannetta { $dur }.
       *[other] { $n } apertuuria, kilpailutilannetta { $dur }.
    }

js-meankind-aperture-line-count =
    { $n ->
        [one] { $n } apertuuri.
       *[other] { $n } apertuuria.
    }

js-meankind-aperture-line-nocount = Apertuurit.

js-meankind-aperture-line-nocount-all = Apertuurit säännön { $policy } mukaan, kilpailutilannetta { $dur }.

js-meankind-aperture-line-nocount-contention = Apertuurit, kilpailutilannetta { $dur }.

js-meankind-aperture-line-nocount-policy = Apertuurit säännön { $policy } mukaan.

js-meankind-aperture-line-policy =
    { $n ->
        [one] { $n } apertuuri säännön { $policy } mukaan.
       *[other] { $n } apertuuria säännön { $policy } mukaan.
    }

js-meankind-araim-big-no = Ei: moottorin suojaustasot eivät vastaa julkaistua vertailua.

js-meankind-araim-big-yes = Kyllä: moottorin suojaustasot vastaavat julkaistua vertailua.

js-meankind-araim-line = Suurin ero on { $worst } m, kun vertailun oma toleranssi on { $tol } m.

js-meankind-araim-line-vectors =
    { $n ->
        [one] Suurin ero on { $worst } m, kun vertailun oma toleranssi on { $tol } m, { $n } vertailuvektorin yli.
       *[other] Suurin ero on { $worst } m, kun vertailun oma toleranssi on { $tol } m, { $n } vertailuvektorin yli.
    }

js-meankind-arc-big = Estimaattori palauttaa radan, kun käytössä on { $dur } { $h } tunnin kaaresta.

js-meankind-arc-line = Avaruusaluksia { $n }, { $observable }-mittaukset.

js-meankind-ascent-big = Painovoima, ilmanvastus, ohjaus ja vastapaine vievät { $loss } m/s ihanteellisesta { $ideal } m/s nopeuden lisäyksestä.

js-meankind-ascent-line = Polton loppu korkeudella { $km } km ja nopeudella { $speed } m/s; huippudynaaminen paine { $kpa } kPa.

js-meankind-attack-big-no = Pinnalla oleva harhauttaja ei voi vangita kuuvastaanotinta.

js-meankind-attack-big-yes = Pinnalla oleva harhauttaja voi vangita kuuvastaanottimen.

js-meankind-attack-line = Pinnalla oleva lähetin yltää { $km } km:n päähän, ennen kuin horisontti estää sen.

js-meankind-attitude-big = Osoitusvirhe on yhteensä { $total } kaarisekuntia.

js-meankind-attitude-big-from = Osoitusvirhe on yhteensä { $total } kaarisekuntia, pääosin lähteestä { $from }.

js-meankind-attitude-line = Suurin gravitaatiogradienttimomentti on { $torque } N·m.

js-meankind-beacon-big = Pintamajakat parantavat geometrian laatua (PDOP) { $x } kertaa.

js-meankind-beacon-line = Satelliittien lisääminen parantaa sitä sen sijaan { $x } kertaa.

js-meankind-bodypnt-big = Pelkät releet antavat paikanmäärityksen { $share } % ajasta (keskuskappale: { $body }).

js-meankind-bodypnt-big-earth = Pelkät releet antavat paikanmäärityksen { $share } % ajasta (keskuskappale: { $body }); { $earth } % Maa-yhteyksien kanssa.

js-meankind-bodypnt-line = Näkyvissä on keskimäärin { $mean } relettä.

js-meankind-by = { $a } × { $b }

js-meankind-campaign-compose-line = Jokainen jäsen on tavallinen moottoriajo; kampanja lukee niiden tulokset rinnakkain.

js-meankind-campaign-compose-range =
    { $n ->
        [one] { $n } skenaariossa samoissa ehdoissa { $what } vaihtelee välillä { $low }–{ $high }.
       *[other] { $n } skenaariossa samoissa ehdoissa { $what } vaihtelee välillä { $low }–{ $high }.
    }

js-meankind-campaign-compose-same =
    { $n ->
        [one] { $n } skenaariossa samoissa ehdoissa { $what } on { $value } jokaisessa.
       *[other] { $n } skenaariossa samoissa ehdoissa { $what } on { $value } jokaisessa.
    }

js-meankind-campaign-line =
    { $n ->
        [one] { $n } vaihe.
       *[other] { $n } vaihetta.
    }

js-meankind-campaign-line-all =
    { $n ->
        [one] { $n } vaihe ja { $events }, lähteenä { $runs }; lopussa { $label } on { $value }.
       *[other] { $n } vaihetta ja { $events }, lähteenä { $runs }; lopussa { $label } on { $value }.
    }

js-meankind-campaign-line-end =
    { $n ->
        [one] { $n } vaihe; lopussa { $label } on { $value }.
       *[other] { $n } vaihetta; lopussa { $label } on { $value }.
    }

js-meankind-campaign-line-events =
    { $n ->
        [one] { $n } vaihe ja { $events }.
       *[other] { $n } vaihetta ja { $events }.
    }

js-meankind-campaign-line-events-end =
    { $n ->
        [one] { $n } vaihe ja { $events }; lopussa { $label } on { $value }.
       *[other] { $n } vaihetta ja { $events }; lopussa { $label } on { $value }.
    }

js-meankind-campaign-line-events-runs =
    { $n ->
        [one] { $n } vaihe ja { $events }, lähteenä { $runs }.
       *[other] { $n } vaihetta ja { $events }, lähteenä { $runs }.
    }

js-meankind-campaign-line-runs =
    { $n ->
        [one] { $n } vaihe, lähteenä { $runs }.
       *[other] { $n } vaihetta, lähteenä { $runs }.
    }

js-meankind-campaign-line-runs-end =
    { $n ->
        [one] { $n } vaihe, lähteenä { $runs }; lopussa { $label } on { $value }.
       *[other] { $n } vaihetta, lähteenä { $runs }; lopussa { $label } on { $value }.
    }

js-meankind-campaign-mission-alarm = Hälytys annetaan ajan { $alarm } { $dur } kestävästä tehtävästä.

js-meankind-campaign-mission-phases = { $phases }-vaiheinen tehtävä, kesto { $dur }, ketjutettu yhdelle kellolle.

js-meankind-campaign-mission-quiet = Ei hälytystä koko { $dur } kestävässä tehtävässä.

js-meankind-campaign-montecarlo =
    { $n ->
        [one] { $n } siemenluvulla ajetun ajon yli { $name } on keskimäärin { $mean }, hajonta { $std }.
       *[other] { $n } siemenluvulla ajetun ajon yli { $name } on keskimäärin { $mean }, hajonta { $std }.
    }

js-meankind-campaign-montecarlo-line = Hajonta on yksi keskihajonta ajojen yli.

js-meankind-campaign-optimize =
    { $n ->
        [one] Haku asettuu arvoon { $value } ({ $name }) { $n } ajon jälkeen.
       *[other] Haku asettuu arvoon { $value } ({ $name }) { $n } ajon jälkeen.
    }

js-meankind-campaign-optimize-at = Kohdassa { $at }.

js-meankind-campaign-optimize-kind =
    { $n ->
        [one] Haku asettuu arvoon { $value } ({ $name }) { $n } ajon ({ $kind }) jälkeen.
       *[other] Haku asettuu arvoon { $value } ({ $name }) { $n } ajon ({ $kind }) jälkeen.
    }

js-meankind-campaign-sweep-flat =
    { $n ->
        [one] { $n } ajon yli ({ $axis }, { $from }–{ $to }) { $metric } pysyy arvossa { $value }.
       *[other] { $n } ajon yli ({ $axis }, { $from }–{ $to }) { $metric } pysyy arvossa { $value }.
    }

js-meankind-campaign-sweep-flat-line = Kaavio näyttää jokaisen ajon.

js-meankind-campaign-sweep-goes =
    { $n ->
        [one] { $n } ajon yli ({ $axis }, { $from }–{ $to }) { $metric } muuttuu arvosta { $first } arvoon { $last }.
       *[other] { $n } ajon yli ({ $axis }, { $from }–{ $to }) { $metric } muuttuu arvosta { $first } arvoon { $last }.
    }

js-meankind-campaign-sweep-goes-line = Kaavio näyttää jokaisen ajon; vaihteluväli { $min }–{ $max }.

js-meankind-classical-link = klassinen yhteys

js-meankind-clock-word = kello

js-meankind-conflict-big = Kerroksellinen arkkitehtuuri kestää { $ratio } kertaa paremmin kuin yksi kerros.

js-meankind-conflict-line-threats = Uhkien Monte Carlo antaa { $ratio } kertaa.

js-meankind-conflict-line-threats-corr = Uhkien Monte Carlo antaa { $ratio } kertaa; korreloivilla uhilla se voi laskea { $low } kertaan.

js-meankind-conflict-line-trials =
    { $n ->
        [one] { $n } kokeen Monte Carlo antaa { $ratio } kertaa.
       *[other] { $n } kokeen Monte Carlo antaa { $ratio } kertaa.
    }

js-meankind-conflict-line-trials-corr =
    { $n ->
        [one] { $n } kokeen Monte Carlo antaa { $ratio } kertaa; korreloivilla uhilla se voi laskea { $low } kertaan.
       *[other] { $n } kokeen Monte Carlo antaa { $ratio } kertaa; korreloivilla uhilla se voi laskea { $low } kertaan.
    }

js-meankind-contacts-big =
    { $n ->
        [one] Suunnitelma säilyttää { $kept } / { $n } ehdokaskontaktista ja toimittaa { $gbit } Gbit.
       *[other] Suunnitelma säilyttää { $kept } / { $n } ehdokaskontaktista ja toimittaa { $gbit } Gbit.
    }

js-meankind-contacts-big-waiting =
    { $n ->
        [one] Suunnitelma säilyttää { $kept } / { $n } ehdokaskontaktista ja toimittaa { $gbit } Gbit odottavasta { $waiting } Gbit:stä.
       *[other] Suunnitelma säilyttää { $kept } / { $n } ehdokaskontaktista ja toimittaa { $gbit } Gbit odottavasta { $waiting } Gbit:stä.
    }

js-meankind-contacts-line = Satelliitteja { $sats } ja asemia { $stations }, { $hours } h aikana.

js-meankind-dpnt-big = Differentiaalikorjaukset pienentävät virheen { $from } m:stä { $to } m:iin.

js-meankind-dpnt-line = Vertailuasema { $km } km:n päässä.

js-meankind-duration-days =
    { $n ->
        [one] { $days } päivä
       *[other] { $days } päivää
    }

js-meankind-earthgnss-big =
    { $n ->
        [one] Kuun etäisyydellä { $visible } / { $n } satelliitista on näkyvissä, mutta seurattavissa on { $trackable }.
       *[other] Kuun etäisyydellä { $visible } / { $n } satelliitista on näkyvissä, mutta seurattavissa on { $trackable }.
    }

js-meankind-earthgnss-line = Paras signaali on { $best } dB-Hz, kun seurantakynnys on { $threshold } dB-Hz.

js-meankind-engine-run-count =
    { $n ->
        [one] { $n } moottoriajo
       *[other] { $n } moottoriajoa
    }

js-meankind-entry-big = Huippuhidastuvuus on { $g } g korkeudella { $km } km, huipun lämpövuo { $flux } W/cm².

js-meankind-entry-line = Sisääntulo nopeudella { $speed } m/s, { $angle } astetta horisontin alapuolella.

js-meankind-eo-big = Kamera näkee { $swath } km:n kaistan { $gsd } m:n erotuskyvyllä.

js-meankind-eo-line-contiguous = Maanpintajäljet ovat { $km } km:n päässä toisistaan päiväntasaajalla, joten kattavuus on yhtenäinen.

js-meankind-eo-line-gapped = Maanpintajäljet ovat { $km } km:n päässä toisistaan päiväntasaajalla, joten kattavuudessa on aukkoja.

js-meankind-eop-big = Kuun etäisyydellä Maan pyöriminen pyyhkäisee { $m } m joka sekunti, joten Maan orientaatiodatan ikä ({ $dur } tässä) on merkitsevä.

js-meankind-eop-line = Syöte: { $source }.

js-meankind-ephemeris-big = Satelliitti lentää korkeudella { $min }–{ $max } km, enintään leveysasteelle { $lat }°.

js-meankind-ephemeris-line = Asemalta nähtynä se nousee korkeuskulmaan { $deg }°.

js-meankind-ephemeris-line-doppler = Asemalta nähtynä se nousee korkeuskulmaan { $deg }°, Doppler enintään { $khz } kHz.

js-meankind-event-count =
    { $n ->
        [one] { $n } tapahtuma
       *[other] { $n } tapahtumaa
    }

js-meankind-framecampaign-big-open =
    { $n ->
        [one] Kampanja jättää { $n } vertailupisteen suunnan määrittämättä.
       *[other] Kampanja jättää { $n } vertailupisteen suuntaa määrittämättä.
    }

js-meankind-framecampaign-big-yes = Kyllä: kampanja määrittää Kuun koordinaatiston vertailupisteen täysin.

js-meankind-framecampaign-line = Ehtoluku { $n }.

js-meankind-framereal-big = Kuun koordinaatisto realisoidaan { $m } m:n jäännösvirheellä.

js-meankind-framereal-big-open = Kuun koordinaatisto realisoidaan { $m } m:n jäännösvirheellä, vaikka sovitus ei konvergoitunut.

js-meankind-framereal-line = Siirtymävirhe { $trans } m, mittakaavavirhe { $scale } miljardisosaa.

js-meankind-gnsssim-big = Eheyden valvonta suojaa paikanmäärityksen { $share } % ajasta.

js-meankind-gnsssim-line = Ionosfääri lisää keskimäärin { $iono } m ja troposfääri { $tropo } m jokaiseen etäisyyteen.

js-meankind-headline-figure = pääluku

js-meankind-holdovertest-big = Maskeja vasten mitattuna tallenteen { $dur } s:n holdover yltää { $te } ns:n aikavirheeseen.

js-meankind-holdovertest-big-open = Maskeja vasten mitattuna tallenteen { $dur } s:n holdover yltää { $te } ns:n aikavirheeseen, eikä palautunut kaistan sisään.

js-meankind-holdovertest-big-recovered = Maskeja vasten mitattuna tallenteen { $dur } s:n holdover yltää { $te } ns:n aikavirheeseen, ja palautui { $recover } s sen jälkeen, kun GNSS palasi.

js-meankind-holdovertest-line = Mitattu maskia vasten, ei koskaan väite siitä, että järjestelmä täyttää vaatimukset; kaksi aikaa ovat operaattorin ilmoitus.

js-meankind-holdovertest-line-masks = { $masks }. Mitattu maskia vasten, ei koskaan väite siitä, että järjestelmä täyttää vaatimukset; kaksi aikaa ovat operaattorin ilmoitus.

js-meankind-impairment-big = Ilmaisin erottaa heikentyneet signaalit puhtaista käyrän alle jäävällä pinta-alalla { $auc } (1 on täydellinen).

js-meankind-impairment-line = Koulutusaineistosta poikkeavissa tapauksissa se saa tuloksen { $auc }.

js-meankind-infra-carrier = Kokonaislukuratkaisu kantoaallon vaiheelle pinta-aseman ja kiertäjän välillä ratkaisi { $share } % kokeista pisimmällä kaarella ({ $days } vrk).

js-meankind-infra-frame = Kiertäjä–asema-linkit nostavat Kuun vertailupisteen pienintä informaation ominaisarvoa { $x } kertaa ja pienentävät Cramér–Rao-jäljen arvoon { $share } %, jos rata tunnetaan Kuun akseleissa.

js-meankind-infra-geodesy = Kaikilla neljällä perheellä yhdessä h2, k2 ja l2 saadaan sidottua tasolle { $h2 } %, { $k2 } % ja { $l2 } % nimellisarvoistaan.

js-meankind-infra-od = Aluksella tehtävä Maan GNSS-radanmääritys Kuun radalla on hyvä { $gnss } m:iin, riippumaton maaseuranta { $ground } m:iin; yhdenmukaisuustunnusluku on keskimäärin { $mean } (odotettu { $expected }).

js-meankind-infra-tail = MODELLED: rajattu malli havainnollistavilla syötteillä, ei väite minkään tehtävän osalta.

js-meankind-infra-tie =
    { $n ->
        [one] { $mm } mm:n paikallinen sidos yhdellä avaruusaluksella sitoo GNSS-, VLBI- ja laseretäisyysmittauskoordinaatistot { $n } pyyhkäistyn sidosvirheen yli.
       *[other] { $mm } mm:n paikallinen sidos yhdellä avaruusaluksella sitoo GNSS-, VLBI- ja laseretäisyysmittauskoordinaatistot { $n } pyyhkäistyn sidosvirheen yli.
    }

js-meankind-inside-spec = määrityksen { $spec } sisällä

js-meankind-instrn-big = Pelkällä inertialla kulkiessa paikkavirhe ylittää { $threshold } m ajassa { $dur }.

js-meankind-instrn-dom = { $dominant } dominoi.

js-meankind-instrn-line = Se ylittää { $passes }.

js-meankind-instrn-line-dom = Se ylittää { $passes }; { $dominant } dominoi.

js-meankind-instrn-pass = { $threshold } m ajassa { $dur }

js-meankind-interop-big-no = Ei: Kuun efemeeritiedosto ei säily ehjänä edestakaisessa muunnoksessa.

js-meankind-interop-big-yes = Kyllä: Kuun efemeeritiedosto säilyy ehjänä edestakaisessa muunnoksessa.

js-meankind-interop-line = Tiloja { $n }, koordinaatisto { $frame }, aika { $time }.

js-meankind-its-spec = sen määritys

js-meankind-jointod-big = Maapohjaisen interferometriaviiveen lisääminen tarkentaa aseman paikkaa { $x } kertaa.

js-meankind-jointod-line = Asema tunnetaan tällöin { $m } m:n tarkkuudella.

js-meankind-launch-big =
    { $n ->
        [one] { $n } laukaisumahdollisuus päivässä saavuttaa radan, jonka inklinaatio on { $incl }°, leveysasteelta { $lat }°.
       *[other] { $n } laukaisumahdollisuutta päivässä saavuttavat radan, jonka inklinaatio on { $incl }°, leveysasteelta { $lat }°.
    }

js-meankind-launch-line = Maan pyöriminen antaa { $speed } m/s ilmaiseksi.

js-meankind-layer-agc = AGC (automaattinen vahvistuksensäätö)

js-meankind-layer-raim = RAIM (vastaanottimen autonominen eheyden valvonta)

js-meankind-layer-sqm = SQM (signaalin laadun valvonta)

js-meankind-leochain-big = Päästä päähän matalan radan järjestelmä pienentää paikkavirheen { $from } m:stä { $to } m:iin.

js-meankind-leochain-line = Sen signaalia seurataan enintään { $cn0 } dB-Hz:llä.

js-meankind-leopass-big-many = Satelliitit ohittavat { $elev }° korkeudella ja pysyvät maskin yläpuolella { $dur } (ensimmäinen; yhteensä { $n }).

js-meankind-leopass-big-one = Satelliitti ohittaa { $elev }° korkeudella ja pysyy maskin yläpuolella { $dur }.

js-meankind-leopass-line = Huipussaan matalan radan signaali saapuu { $db } dB voimakkaampana kuin tyypillinen satelliittinavigointisignaali.

js-meankind-leoppp-big = Tarkka paikannus konvergoituu { $best } minuutissa suurimmalla matalan radan kerroksella, kun pelkällä satelliittinavigoinnilla se kestää { $base } min.

js-meankind-leoppp-line = Ajojen mediaani tapausta kohti, { $m } m:iin.

js-meankind-leoppp-line-runs =
    { $n ->
        [one] { $n } ajon mediaani tapausta kohti, { $m } m:iin.
       *[other] { $n } ajon mediaani tapausta kohti, { $m } m:iin.
    }

js-meankind-leopvt-doppler-big = Doppler-paikannus matalan radan satelliiteista osuu { $m } m:n päähän totuudesta (vaaka).

js-meankind-leopvt-doppler-line =
    { $n ->
        [one] { $n } satelliitti käytetty.
       *[other] { $n } satelliittia käytetty.
    }

js-meankind-leopvt-joint-big = Matalan radan kerroksen lisääminen pienentää virheen { $from } m:stä { $to } m:iin (3D-neliökeskiarvo).

js-meankind-leopvt-joint-line = Geometrian laatu (PDOP) muuttuu arvosta { $from } arvoon { $to }.

js-meankind-leopvt-polar-big = Navan lähellä matalan radan kerros parantaa geometrian laatua (PDOP) arvosta { $from } arvoon { $to }.

js-meankind-leopvt-polar-line =
    { $n ->
        [one] { $n } leveysasteen yli.
       *[other] { $n } leveysasteen yli.
    }

js-meankind-leopvt-timing-big = Matalan radan ajansiirto pitää parhaan kellon { $ns } ns:n sisällä UTC:stä (neliökeskiarvo).
