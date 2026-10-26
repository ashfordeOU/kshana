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
