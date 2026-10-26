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

js-cat-lunar-station-coverage-public-sources-question = Mitä korjattua virhettä asema antaa etelänavan yllä, kun käytetään vain julkisesti ilmoitettuja oletuksia? Tulosta hallitsevat rataelementit, jotka eivät ole julkisia ja jotka on asetettu HAVAINNOLLISIKSI; tämä on jäädytetyn ennusteen syöte. (mallinnettu; ei väite mistään todellisesta järjestelmästä)

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
