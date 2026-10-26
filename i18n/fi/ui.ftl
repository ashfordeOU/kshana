# Käyttöliittymän tekstit (suomi): sivuston kehys, ilmoitukset, kielenvalitsin, Studion kehys.

## Site chrome
site-skip-link = Siirry sisältöön
site-nav-primary = Päävalikko
site-nav-missions = Tehtävät
site-nav-capabilities = Ominaisuudet
site-nav-evidence = Todisteet
site-nav-research = Tutkimus
site-nav-developers = Kehittäjät
site-nav-docs = Dokumentaatio
site-nav-editions = Versiot
site-nav-search = Haku
site-nav-launch = Käynnistä
site-nav-studio = { -brand } Studio
site-nav-home = { -brand }-etusivu
site-nav-theme = Vaihda vaalean ja tumman teeman välillä
site-version = v{ $version }

site-footer-tagline = Avoimen lähdekoodin PNT-kestävyyssimulaattori (paikannus, navigointi ja ajanmääritys). Se ei ohjaa radiolaitteistoa eikä lähetä mitään: sen signaalitason tuloste on kantataajuisia IQ-näytetiedostoja, ja sen ohjelmistopohjainen GNSS-vastaanotin on analyysityökalu. Ei lentotuote.
site-footer-product = Tuote
site-footer-company = Yritys
site-footer-benchmark = Benchmark
site-footer-install = Asennus
site-footer-mcp = MCP-palvelin
site-footer-github = GitHub
site-footer-kshana-pro = { -brand } Pro
site-footer-licence = { -brand } v{ $version } · Ashforde® OÜ · AGPL-3.0, kaupallinen lisenssi mahdollinen
site-footer-provenance = Jokainen kaavio on piirretty moottorin v{ $version } tallennetusta ajosta, ja siinä mainitaan sen skenaario, siemenluku ja toistamisen reitti.

## Language switcher
site-lang-label = Kieli
site-lang-switch-aria = Valitse tämän sivun kieli
site-lang-auto = Selaimen kieli
site-lang-remembered = Valintasi muistetaan tällä laitteella.

## Notices (shown at the top of a page's content)
notice-machine-translation = { -mt-notice }
notice-fallback =
    { $n ->
        [one] { $n } osa tästä sivusta on muuttunut käännöksen jälkeen, ja se näytetään englanniksi.
       *[other] { $n } osaa tästä sivusta on muuttunut käännöksen jälkeen, ja ne näytetään englanniksi.
    }
notice-not-started = Tätä sivua ei ole vielä käännetty. Se näytetään englanniksi.
notice-detected = Näytetään kieli: { $language }. <a1>Vaihda englantiin</a1>
notice-dismiss = Sulje
notice-recorded-in-english = Tallennettu englanniksi
notice-advisory = { -advisory }

## Studio shell
studio-title = { -brand } Studio
studio-home = { -brand }-etusivu
studio-search-label = Etsi skenaario, alue, asetus tai komento
studio-search-placeholder = Hae nimellä, kysymyksellä tai asetuksella, esimerkiksi korkeuskulmamaski
studio-search-scenarios = Hae skenaarioita, alueita tai asetuksia
studio-search-commands = Hae skenaarioita ja komentoja
studio-search-all = Etsi skenaario, alue, asetus, näkymä tai komento
studio-search = Haku
studio-theme = Vaihda vaalean ja tumman teeman välillä
studio-starting-questions = Kysymyksiä aluksi
studio-where-you-are = Missä olet
studio-engine-status = Missä moottori toimii
studio-views = Näkymät: Geometria, Vastaanottimen luottamus, Häiriökartta, Harjoituksen purku, Työkalut
studio-more-views = Lisää näkymiä
studio-advanced-full = Koko hallintanäkymä: kaikki paneelit, kentät ja välilehdet
studio-advanced-switch = Siirry laajaan näkymään
studio-view-geometry = Geometria: taivaskartta, horisonttiprofiili ja DOP
studio-view-training = Harjoituksen purku: avaa ohjaajan loki
studio-view-interference = Häiriökartta: avaa karttatiedostoja
studio-view-receiver-trust = Vastaanottimen luottamus: avaa aluksen ajo
studio-view-tools = Työkalut: todisteet, bench, compliance, OSNMA
studio-result = Tulos
studio-result-meaning = Mitä tulos tarkoittaa
studio-key-figures = Keskeiset luvut
studio-result-views = Tämän tuloksen näkymät
studio-figures-of-merit = Laatumittarit
studio-find-result-field = Etsi tuloskenttä
studio-capability-view = Suorituskykynäkymä
studio-time-series = Aikasarja
studio-chart-source = Kaavion lähde
studio-signal-band = Signaali ja kaista
studio-signal-field = Signaalikenttä
studio-clock-holdover = Kellon holdover
studio-telecom-masks = Telealan ajoitusmaskit
studio-clock-stability = Kellon vakaus
studio-orbit-3d = 3D-rata
studio-ground-track = Maanpintajälki
studio-parameter-sweep = Parametripyyhkäisy
studio-compare-runs = Vertaa ajoja
studio-animation = Animaatio
studio-engine-report = Moottoriraportti
studio-exports = Viennit ja raportti
studio-full-result = Täysi tulosasiakirja
studio-settings = Asetukset ja lisätiedot
studio-find-setting = Etsi asetus, esimerkiksi maski
studio-find-scenario-setting = Etsi tämän skenaarion asetus
studio-engine-summary = Moottorin oma yhteenveto
studio-restore-scenario = Palauta mukana toimitettu skenaario
studio-copy-scenario = Kopioi skenaarion teksti
studio-scenario-source = Skenaarion lähde (TOML)
studio-install-engine = Asenna moottori
studio-run-history = Ajohistoria
studio-scenarios-count =
    { $n ->
        [one] Skenaario, jonka se ajaa ({ $n })
       *[other] Skenaariot, jotka se ajaa ({ $n })
    }
studio-ledger-rows =
    { $n ->
        [one] { $n } kirjanpitorivi
       *[other] { $n } kirjanpitoriviä
    }
studio-recorded-in-english = Tallennettu englanniksi
studio-lang-engine-fallback = Moottorin tekstiä tälle kielelle ei voitu ladata; näytetään englanti.

studio-geometry-kshana-home = Kshana-etusivu

studio-geometry-back-to-the-studio = Takaisin Studioon

studio-geometry-step-the-time = Etene ajassa askelittain

studio-geometry-draw-the-skyline = Piirrä horisonttiviiva

studio-geometry-skip-to-the-view = Siirry näkymään

studio-geometry-which-satellites-can-you-see = Mitkä satelliitit näet, ja kuinka hyvä on niiden geometria?

studio-geometry-what-this-shows = Mitä tämä näyttää

studio-geometry-starting-the-engine = Käynnistetään moottoria…

studio-geometry-every-setting-is-in-the = Kaikki asetukset ovat sivun osoitteessa, joten kopioitu linkki avaa saman taivaan.

studio-geometry-offset-from-the-constellations-reference = Poikkeama tähdistöjen vertailuepookista

studio-geometry-10-min = −10 min

studio-geometry-10-min-2 = +10 min

studio-geometry-your-own-orbital-elements-tle = Omat rataelementtisi (TLE)

studio-geometry-use-these-elements = Käytä näitä elementtejä

studio-geometry-back-to-the-presets = Takaisin esiasetuksiin

studio-geometry-clear-the-skyline = Tyhjennä horisonttiviiva

studio-geometry-drag-on-the-skyplot-to = Piirrä horisonttiviiva vetämällä taivaskartalla (1°:n atsimuutti- ja 0,5°:n korkeuskulma-askeleet). Kun taivaskartta on kohdennettuna: Vasen ja Oikea liikuttavat horisontin ympäri (Shift: 10°), Ylös ja Alas nostavat tai laskevat horisonttiviivaa siinä kohdassa (Shift: 5°), Delete tyhjentää sen.

studio-geometry-copy-a-link-to-this = Kopioi linkki tähän taivaaseen

studio-geometry-download-the-skyplot-svg = Lataa taivaskartta (SVG)

studio-geometry-zenith-in-the-centre-the = Zeniitti keskellä, horisontti reunalla, pohjoinen ylhäällä. Täytetyt merkit ovat ratkaisussa olevia satelliitteja; onttoja merkkejä peittää maski tai horisonttiviiva, tai niitä ei käytetä.

studio-geometry-dilution-of-precision = Tarkkuuden heikkenemiskerroin (DOP)

studio-geometry-how-much-the-geometry-multiplies = Kuinka paljon geometria kertoo etäisyysvirhettä. Pienempi on parempi; noin 1 on erinomainen, yli 6 on huono.

studio-geometry-horizontal-position-error = Vaakasuuntainen paikkavirhe

studio-geometry-satellites-as-a-table = Satelliitit taulukkona

studio-geometry-the-same-satellites-as-the = Samat satelliitit kuin taivaskartalla.

studio-geometry-azimuth = Atsimuutti, °

studio-geometry-elevation = Korkeuskulma, °

studio-geometry-in-the-solution = Ratkaisussa

studio-geometry-the-engine-runs-here-as = Moottori toimii täällä WebAssemblyna. Mitään ei haeta toiselta sivustolta, eikä mitään asettamaasi lähetetä minnekään.

studio-holdover-holdover-test-scenarios = Holdover-testin skenaariot

studio-holdover-holdover-test = Holdover-testi

studio-holdover-how-far-does-the-time = Kuinka pitkälle aikavirhe kasvaa, kun GNSS on poissa?

studio-holdover-opening-the-scenarios = Avataan skenaarioita…

studio-holdover-verdict-step-by-step = Arvio vaihe vaiheelta

studio-holdover-time-error-over-the-record = Aikavirhe tallenteen yli

studio-holdover-the-three-phases-are-shaded = Kolme vaihetta on varjostettu; katkoviivalla piirretyt pystyviivat ovat kaksi käyttäjän ilmoittamaa hetkeä. Katkoviivalla piirretyt vaakaviivat ovat maskien rajat suurimmalle absoluuttiselle aikavirheelle, kukin piirrettynä sen vaiheen kohdalle, jonka sen maski nimeää, sekä palautumiskaista; kolmio osoittaa, milloin budjetti tai ePRTC-A-holdover-verhokäyrä ylittyy ensimmäisen kerran.

studio-holdover-of-the-baseline-and-the = Lähtötasosta ja holdoverista; risti on maskin raja hetkellä, jolloin sen tarkistus oli heikoimmillaan.

studio-holdover-the-same-two-steps-against = Samat kaksi vaihetta TDEV-rajoja vasten.

studio-holdover-the-numbers = Luvut

studio-holdover-everything-below-is-the-engine = Kaikki alla oleva on moottorin ilmoittamaa, sen ilmoittamin yksiköin.

studio-holdover-mask-checks = Maskitarkistukset

studio-holdover-each-mask-is-measured-on = Jokainen maski mitataan sen ehdon nimeämässä vaiheessa. Maski, joka vaatii pidemmän tallenteen kuin vaihe antoi, on INCOMPLETE, ei koskaan ekstrapoloitu; jokainen kohta, jonka suositus jättää jatkotutkimukseen, puuttuu.

studio-holdover-what-this-does-not-cover = Mitä tämä ei kata

studio-interference-cell-size-in-degrees-empty = Ruudun koko asteina (tyhjä = 0,5)

studio-interference-https = https://…

studio-interference-about-this-page = Tietoa tästä sivusta

studio-interference-interference-map = Häiriökartta

studio-interference-where-did-position-reports-look = Missä paikkaraportit näyttivät heikentyneiltä?

studio-interference-open-map-files = Avaa karttatiedostoja

studio-interference-or-drop-them-here = tai pudota ne tähän

studio-interference-open-the-synthetic-demo = Avaa synteettinen demo

studio-interference-close-all-maps = Sulje kaikki kartat

studio-interference-nothing-open-yet = Mitään ei ole vielä avattu.

studio-interference-build-a-map-here = Rakenna kartta täällä

studio-interference-build-from-the-synthetic-sample = Rakenna synteettisestä otoksesta

studio-interference-route-exposure-here = Reitin altistus täällä

studio-interference-use-the-synthetic-route = Käytä synteettistä reittiä

studio-interference-reading-these-maps = Näiden karttojen lukeminen

studio-interference-maps-inherit-the-coverage-of = Kartat perivät lähteensä kattavuuden: vapaaehtoisten ADS-B-vastaanottimien kattavuus on harva avomerellä, ja avoin AIS-data jättää pois joitakin alusluokkia. Lue kunkin tiedoston kattavuushuomautukset.

studio-interference-no-coastline-or-basemap-is = Rantaviivaa tai taustakarttaa ei piirretä, eikä mitään haeta miltään palvelimelta; ruudukko koostuu vain leveys- ja pituusasteista.

studio-interference-no-identifier-of-any-aircraft = Näissä tiedostoissa ei ole minkään ilma-aluksen tai aluksen tunnistetta; ruutuja, joissa on liian vähän erillisiä ilma-aluksia tai aluksia, ei julkaista lainkaan, ja yhden tai kahden AIS-lukumäärä pidätetään.

studio-lunar-infra-lunar-infrastructure-scenarios = Kuun infrastruktuurin skenaariot

studio-lunar-infra-lunar-infrastructure = Kuun infrastruktuuri

studio-lunar-infra-what-can-the-moon-s = Mitä Kuun rata ja pinta voivat tarjota navigointi- ja geodeettisena infrastruktuurina, ja missä ne jäävät vajaiksi?

studio-lunar-infra-five-studies-of-what-lunar = Viisi tutkimusta siitä, mitä kuuradan kiertäjät ja Kuun pinnalla oleva asema voisivat yhdessä tehdä navigointi- ja geodeettisena infrastruktuurina: radanmääritys Maan GNSS-signaaleista maaseurantaa vasten, kantoaallon vaiheen ratkaisu pinta-aseman ja kiertäjän välillä, Kuun koordinaatiston yhteisestimointi, GNSS:n, VLBI:n ja laseretäisyysmittauksen sitominen yhdellä avaruusaluksella sekä se, kuinka herkkiä laseretäisyysmittaus ja seuranta ovat Kuun vuorovesille ja libraatiolle. Syöttötiedot ovat havainnollistavia ja malli on rajoitettu; kun tutkimus jäi alle kynnyksen, jota vasten se ennakkorekisteröitiin, tämä sivu sanoo sen. Jokainen luku on kopioitu moottorin tallentamasta tuloksesta; sivu skaalaa sen ja piirtää sen, eikä laske mitään muuta.

studio-lunar-infra-what-the-result-holds = Mitä tulos sisältää

studio-lunar-infra-findings-disclosures-and-what-was = Havainnot, ilmoitukset ja se, mitä ei varmennettu

studio-lunar-what-these-figures-are = Mitä nämä luvut ovat

studio-lunar-map-key = Kartan selite

studio-lunar-lunar-station = Kuuasema

studio-lunar-what-accuracy-could-a-reference = Millaisen tarkkuuden Kuun etelänavan lähellä oleva vertailuasema voisi antaa, ja missä?

studio-lunar-the-constellation-its-signal-in = Tähdistö, sen avaruussignaalin virhe, aseman mittausvirhe, korjauksen viive ja linkin kvantisointi ovat skenaariotiedostossa ilmoitettuja syöttötietoja, kullakin lähteensä tai merkintä havainnollistavasta. Mitään tässä esitettyä lukua ei ole tarkistettu todellista asemaa tai lentodataa vasten.

studio-lunar-the-source-and-every-input = Lähde ja jokainen muuttamasi syöttötieto ovat sivun osoitteessa, joten kopioitu linkki avaa saman tutkimuksen.

studio-lunar-a-result-file-is-the = Tulostiedosto on JSON, jonka moottori kirjoittaa tälle tyypille (komentorivin JSON-tuloste tai täältä tallennettu ajo). Se luetaan tällä sivulla; mitään ei lähetetä.

studio-lunar-each-field-shows-the-scenario = Jokainen kenttä näyttää skenaariotiedoston arvon, kunnes muutat sitä. Vuorokauden epookit koko ruudukossa vievät aikansa: vähemmän kokeita tai pidempi aika-askel ajetaan nopeammin.

studio-lunar-run-it-here = Aja täällä

studio-lunar-back-to-the-file-s = Takaisin tiedoston arvoihin

studio-lunar-copy-a-link = Kopioi linkki

studio-lunar-save-this-result-json = Tallenna tämä tulos (JSON)

studio-lunar-corrected-error-over-the-south = Korjattu virhe etelänapa-alueella

studio-lunar-south-polar-stereographic-the-pole = Etelänavan stereografinen projektio: napa keskellä, ruudukon reuna kehällä, 0°:n pituusaste ylhäällä, 90° itään oikealla. Jokainen ruutu on yksi ruudukkopiste; paksu viiva on kohta, jossa korjattu virhe ylittää kynnyksen, ja katkoviiva on kattavuussäde atsimuuttia kohti.

studio-lunar-region-figures = Alueen luvut

studio-lunar-over-the-whole-grid-means = Koko ruudukon yli: pinta-alalla painotetut keskiarvot ja huonoin piste.

studio-lunar-coverage-radius-per-azimuth = Kattavuussäde atsimuuttia kohti

studio-lunar-along-each-bearing-from-the = Kunkin suunnan mukaan asemalta: etäisyys, jolla kattavuus ensimmäisen kerran laskee alle 95 %:n.

studio-lunar-as-a-table = Taulukkona

studio-lunar-radius-km = Säde, km

studio-lunar-at-the-grid-edge = Ruudukon reunalla

studio-lunar-points-along-it = Pisteet sen varrella

studio-lunar-an-epoch-is-unavailable-at = Epookki ei ole saatavilla pisteessä, kun käyttäjä näkee alle neljä satelliittia tai asema ei näe jokaista käyttäjän käyttämää satelliittia; sille ei lasketa virhettä.

studio-lunar-grid-points-as-a-table = Ruudukkopisteet taulukkona

studio-lunar-the-same-points-as-the = Samat pisteet kuin kartalla, lähinnä asemaa olevat ensin.

studio-lunar-latitude = Leveysaste, °

studio-lunar-longitude = Pituusaste, °

studio-lunar-from-the-station-km = Asemalta, km

studio-lunar-corrected-error = Korjattu virhe

studio-lunar-uncorrected-error = Korjaamaton virhe

studio-lunar-hpl-median = HPL:n mediaani

studio-lunar-the-engine-s-statement-inputs = Moottorin lausunto, syöttötiedot ja linkkibudjetti

studio-lunar-inputs-as-the-engine-read = Syöttötiedot sellaisina kuin moottori ne luki

studio-lunar-error-model = Virhemalli

studio-lunar-correction-link-budget-at-the = Korjauslinkin budjetti asemalla ja huonoimmassa pisteessä

studio-observatory-previous-day = Edellinen päivä

studio-observatory-day-opened = Avattu päivä

studio-observatory-next-day = Seuraava päivä

studio-observatory-interference-observatory = Häiriöobservatorio

studio-observatory-what-did-one-day-s = Miltä yhden päivän paikkaraportit näyttivät?

studio-observatory-the-observatory-writes-a-few = Observatorio kirjoittaa muutaman tiedoston kutakin UTC-päivää ja aluetta kohti: ruudukon ruudut, joilla on yksi kolmesta tilasta, tapahtumaluettelon ja manifestin. Avaa tuottamasi tiedostot tässä ja lue ne. Sivu ei laske mitään ja näyttää vain sen, mitä tiedostot sanovat. Se ei toimita observatoriodataa, ei hae mitään eikä lähetä mitään.

studio-observatory-open-a-day = Avaa päivä

studio-observatory-larr = ←

studio-observatory-rarr = →

studio-observatory-the-three-states = Kolme tilaa

studio-observatory-the-picture-the-observatory-wrote = Observatorion kirjoittama kuva

studio-observatory-the-png-you-opened-as = Avaamasi PNG sellaisenaan. Ruutuja, joita ei ole piirretty, ei havaittu.

studio-observatory-cells-drawn-from-the-file = Tiedostosta piirretyt ruudut

studio-observatory-plate-carr-eacute-e-no = Plate carrée, ei taustakarttaa. Osoita ruutua tai käytä taulukkoa nähdäksesi sen tilan ja lukumäärät. Paikkaa, jolla ei ole ruutua, ei havaittu.

studio-observatory-hover-or-focus-a-cell = Osoita ruutua tai kohdenna siihen nähdäksesi sen tilan.

studio-observatory-every-cell-in-the-file = Jokainen tiedoston ruutu

studio-observatory-a-count-the-file-withholds = Lukumäärä, jonka tiedosto pidättää (alle 5 ilma-alusta), näytetään muodossa ”pidätetty”, ei koskaan 0.

studio-observatory-files-and-their-hashes = Tiedostot ja niiden tiivisteet

studio-observatory-dataset-licence-and-notice = Aineisto, lisenssi ja huomautus

studio-observatory-what-this-page-does-and = Mitä tämä sivu näyttää ja mitä ei

studio-observatory-products-are-released-at-least = Tuotteet julkaistaan vähintään 24 tuntia UTC-päivän päättymisen jälkeen, ruuduilla, jotka ovat 0,5 astetta tai karkeampia. Tämä ei koskaan ole reaaliaikainen näkymä, eikä se koskaan sano ”nyt”.

studio-observatory-it-shows-no-cause-no = Se ei näytä syytä, maata, voimaa eikä häiriön lähdettä, ei hälytystä, ei paikkojen tai päivien vertailua eikä AIS:ää. ADS-B:tä ja AIS:ää ei koskaan yhdistetä.

studio-observatory-the-page-ships-none-of = Sivu ei toimita mitään observatorion tuotteista. Niiden julkaiseminen on omistajan päätös.

studio-optical-optical-atmosphere-scenarios = Optisen ilmakehän skenaariot

studio-optical-optical-pnt = Optinen PNT

studio-optical-can-an-optical-link-get = Pääseekö optinen linkki sään läpi?

studio-optical-the-link = Linkki

studio-optical-sites-as-the-engine-states = Sijaintipaikat sellaisina kuin moottori ne ilmoittaa

studio-optical-inputs-are-marked-everything-else = Syöttötiedot on merkitty; kaikki muu on moottorin tuloste niille.

studio-optical-it-draws-only-what-the = Se piirtää vain sen, minkä moottori tallensi kustakin skenaariosta, mukaan lukien sen siemenluvulla tuotetun aikasarjan. Sivu ei laske mitään: se skaalaa moottorin luvut kaavioon.

studio-optical-the-sites-their-cloud-climates = Sijaintipaikat, niiden pilvi-ilmastot, kelloluokat ja tekniikat ovat havainnollistamiseksi valittuja syöttötietoja, ja ne on merkitty sellaisiksi. Mitään mitattua saatavuustallennetta ei ole verrattu.

studio-replay-replay-controls = Toistopainikkeet

studio-replay-previous-moment-page-up = Edellinen hetki (Page Up)

studio-replay-step-back = Askel taaksepäin

studio-replay-step-back-left-arrow = Askel taaksepäin (vasen nuoli)

studio-replay-play-or-pause-space = Toista tai keskeytä (välilyönti)

studio-replay-step-forward = Askel eteenpäin

studio-replay-step-forward-right-arrow = Askel eteenpäin (oikea nuoli)

studio-replay-next-moment-page-down = Seuraava hetki (Page Down)

studio-replay-replay-speed-mission-seconds-per = Toistonopeus, tehtäväsekuntia sekunnissa

studio-replay-mission-clock-seconds-from-the = Tehtäväkello, sekuntia kunkin ajon alusta

studio-replay-bridge-replay = Komentosillan toisto

studio-replay-two-runs-one-clock-when = Kaksi ajoa, yksi kello: milloin komentosilta tiesi?

studio-replay-put-two-synthetic-runs-side = Aseta kaksi synteettistä ajoa vierekkäin ja toista ne yhdellä tehtäväkellolla. Jokainen paneeli näyttää, missä alus todella oli verrattuna siihen, missä vastaanotin sanoi sen olevan, moottorin luottamuspistemäärän ja -kaistan ajan funktiona, lokin itsensä luettelemat satelliitit (taivas tyhjenee, kun loki ei kuule yhtään) sekä arvion ajon päättyessä. Kaikki piirretty tulee lokista tai moottorin sille antamasta tuloksesta; mitään ei lueta verkosta.

studio-replay-save-animated-svg = Tallenna animoitu SVG

studio-replay-save-frames-zip = Tallenna kuvat (ZIP)

studio-replay-opening-the-two-demo-runs = Avataan kahta demoajoa…

studio-replay-the-skyplot-is-the-log = Taivaskartta on lokin oma GSV: täytetty merkki on satelliitti, jolla on signaalinvoimakkuus, ontto on luetteloitu ilman sitä, ja varjostettu sektori on atsimuuttialue, jolla loki luettelee satelliitteja eikä kuule yhtäkään. Tukittu taivas ja häirretty signaali näyttävät tässä samalta. Se ei ole horisonttiviiva, ja tähdistö on nimellinen, ei lokin päivämäärän efemeridi.

studio-replay-position-error-is-the-logged = ”Paikkavirhe” on todellisen ja raportoidun paikan lokattu etäisyys; aluksen ympärillä oleva rengas on tämä etäisyys piirrettynä mittakaavaan. Aika tapahtuman alusta ensimmäiseen nimellisen alittavaan pistemäärään on kahden lokatun ajan erotus, ei havaitsemissuorituskyvyn luku.

studio-replay-the-vessel-glyph-points-along = Aluksen symboli osoittaa gyrosuuntaan (HDT), johon mikään tapahtuma ei vaikuta; katkoviivalla piirretty ääriviiva on kohta, johon vastaanotin sijoittaa aluksen, sen raportoimaa kurssia pitkin. Ero näiden kahden välillä on purkuvihje.

studio-replay-the-coast-is-natural-earth = Rannikko on Natural Earthin yleisessä omaisuudessa oleva maa-aineisto mittakaavassa 1:10 miljoonaa, joka toimitetaan tämän sivun mukana (mitään ei haeta). Demojen paikat on keksitty, joten rannikko näyttää, mihin nämä keksityt koordinaatit osuvat. Vain havainnollistus, ei koskaan navigointiin.

studio-ssv-space-user-gnss-scenarios = Avaruuskäyttäjän GNSS-skenaariot

studio-ssv-space-user-gnss = Avaruuskäyttäjän GNSS

studio-ssv-which-navigation-signals-can-a = Mitä navigointisignaaleja kauas GNSS-satelliittien yläpuolella oleva avaruusalus voi vielä käyttää?

studio-ssv-the-satellites-of-a-navigation = Navigointijärjestelmän satelliitit osoittavat Maahan, joten niiden yläpuolella oleva avaruusalus kuulee vain sen, mikä vuotaa reunan ohi tai sivukeilojen kautta. Tämä sivu näyttää, mitä moottori löytää viidestä tapauksesta: saatavuus geostationaarisella korkeudella olevalla kuorella, erittäin elliptinen rata, Kuun siirtymärata heikon signaalin vastaanottimella, aluksella toimiva suodatin ja kahden avaruusaluksen formaatio. Jokainen luku on kopioitu moottorin tallentamasta tuloksesta; sivu skaalaa sen ja piirtää sen, eikä laske mitään muuta.

studio-ssv-against-the-icg-booklet = ICG-vihkosta vasten

studio-tools-leave-empty-to-check-integrity = jätä tyhjäksi tarkistaaksesi vain eheyden

studio-tools-synthetic-osnma-example = Synteettinen OSNMA-esimerkki

studio-tools-trust-and-evidence-tools = Luottamuksen ja todisteiden työkalut

studio-tools-trust-evidence-and-test-tools = Luottamuksen, todisteiden ja testauksen työkalut

studio-tools-the-0-35-features-that = Version 0.35 ominaisuudet, jotka toimivat selaimessasi, ja mistä löydät ne, jotka eivät toimi. Täällä avaamasi tiedostot luetaan tällä sivulla eikä niitä koskaan lähetetä; moottori toimii tietokoneellasi WebAssemblyna.

studio-tools-maritime-trust = Merenkulun luottamus

studio-tools-training-debrief = Harjoituksen purku

studio-tools-the-engine-starts-when-you = Moottori käynnistyy, kun käytät työkalua.

studio-tools-every-0-35-feature-and = Jokainen version 0.35 ominaisuus ja sen sijainti

studio-tools-in-this-browser-where-it = Tässä selaimessa, missä se voi toimia. Loput ovat komentorivi- tai palvelinominaisuuksia, ja syy ilmoitetaan.

studio-tools-in-the-studio = Studiossa

studio-tools-verify-an-evidence-pack = Varmenna todistepaketti

studio-tools-open-the-synthetic-example-pack = Avaa synteettinen esimerkkipaketti

studio-tools-open-it-with-one-byte = Avaa se yksi tavu muutettuna

studio-tools-no-pack-files-chosen = Pakettitiedostoja ei ole valittu.

studio-tools-verify-the-pack = Varmenna paketti

studio-tools-attach-a-timestamp-token = Liitä aikaleimatunniste

studio-tools-attach-to-the-chosen-pack = Liitä valittuun pakettiin

studio-tools-export-a-scenario-for-a = Vie skenaario laboratoriosimulaattoria varten

studio-tools-which-public-framework-rows-do = Mille julkisen viitekehyksen riveille ajosi tukevat todisteita?

studio-tools-use-the-synthetic-example-runs = Käytä synteettisiä esimerkkiajoja

studio-tools-show-the-mapping-tables = Näytä vastaavuustaulukot

studio-tools-show-the-sources-they-cite = Näytä lähteet, joihin ne viittaavat

studio-tools-no-result-files-chosen = Tulostiedostoja ei ole valittu.

studio-tools-build-the-report = Muodosta raportti

studio-tools-galileo-osnma-is-the-navigation = Galileo OSNMA: onko navigointidata todennettu?

studio-tools-load-it = Lataa se

studio-tools-show-the-recorded-result = Näytä tallennettu tulos

studio-tools-imu-fit-sensor-parameters-for = IMU-sovitus: anturiparametrit hybridi- ja fuusioskenaarioille

studio-tools-fit-the-parameters = Sovita parametrit

studio-tools-jammertest-score-a-receiver-log = Jammertest: pisteytä vastaanottimen loki julkaistua testisuunnitelmaa vasten

studio-tools-import-the-schedule = Tuo aikataulu

studio-tools-score-the-log = Pisteytä loki

studio-training-synthetic-library-scenarios = Synteettiset kirjastoskenaariot

studio-training-library-scenario-to-generate = Luotava kirjastoskenaario

studio-training-random-seed-optional = Satunnainen siemenluku (valinnainen)

studio-training-from-the-scenario = skenaariosta

studio-training-time-cursor = Aikakohdistin

studio-training-replay-speed = Toistonopeus

studio-training-time-cursor-in-log-rows = Aikakohdistin lokiriveinä

studio-training-debrief-timeline-time-cursor = Purun aikajana: aikakohdistin

studio-training-what-did-the-crew-see = Mitä miehistö näki, ja mitä todella tapahtui?

studio-training-open-a-log = Avaa loki

studio-training-choose-an-instructor-log-or = Valitse ohjaajan loki tai avaa jokin viidestä komentorivin kirjoittamasta synteettisestä kirjastoskenaariosta.

studio-training-or-drop-it-here-or = tai pudota se tähän tai avaa kirjastoskenaario:

studio-training-generate-a-stream-here = Luo virta täällä

studio-training-run-the-engine-s-nmea = Aja moottorin NMEA-harjoitusgeneraattori tässä selaimessa. Saat harjoituksen synteettisen NMEA 0183 -virran ja ohjaajan lokin, ja voit purkaa harjoituksen heti. Mitään ei lähetetä; suoratoisto komentosiltasimulaattoriin TCP:n tai UDP:n yli on komentorivin ominaisuus (katso Työkalut-sivu).

studio-training-previous-moment = Edellinen hetki

studio-training-next-moment = Seuraava hetki

studio-training-true-track-against-reported = Todellinen reitti raportoitua vasten

studio-training-north-up-one-scale-on = Pohjoinen ylhäällä, sama mittakaava molemmilla akseleilla. Ohut harmaa viiva on kohta, jossa alus todella oli. Värillinen viiva on vastaanottimen raportoima, väritetty sen mukaan, kuinka kaukana se oli totuudesta. Siellä, missä vastaanotin ei raportoinut paikkaratkaisua, sille ei piirretä mitään.

studio-training-events-and-what-the-receiver = Tapahtumat ja mitä vastaanotin sanoi

studio-training-one-shared-time-axis-drag = Yksi yhteinen aika-akseli. Siirrä kohdistinta vetämällä tai napsauttamalla; nuolinäppäimet siirtävät sitä askelittain. Tapahtumapalkit näyttävät kunkin syötetyn tapahtuman voimakkuuden ajan funktiona.

studio-training-sky-at-the-cursor = Taivas kohdistimen kohdalla

studio-training-the-satellites-the-stream-s = Satelliitit, jotka virran oma GSV luettelee. Täytetyllä merkillä on signaalinvoimakkuus; ontto on luetteloitu ilman sitä; varjostettu sektori on kohta, jossa virta luettelee satelliitteja eikä yhtäkään kuulu. Nimellinen tähdistö, ei virran päivämäärän efemeridi.

studio-training-at-the-cursor = Kohdistimen kohdalla

studio-training-events-injected = Syötetyt tapahtumat

studio-training-as-the-instructor-log-states = Sellaisina kuin ohjaajan loki ne ilmoittaa, kaikkine parametreineen.

studio-training-debrief-timeline = Purun aikajana

studio-training-choose-a-moment-to-move = Valitse hetki siirtääksesi kohdistimen siihen.

studio-training-the-satellite-sky-is-a = Satelliittitaivas on nimellinen tähdistö, ei virran päivämäärän efemeridi.

studio-training-nothing-here-is-a-measure = Mikään tässä ei mittaa, miten mikään vastaanotin tai järjestelmä suoriutuu häiriötä vastaan.

studio-trust-session-settings-in-toml = Istunnon asetukset TOML-muodossa

studio-trust-receiver-trust-session-settings-in = Vastaanottimen luottamuksen istunnon asetukset TOML-muodossa

studio-trust-time-cursor-and-filters = Aikakohdistin ja suodattimet

studio-trust-time-cursor-in-epochs = Aikakohdistin epookkeina

studio-trust-score-timeline-time-cursor = Pistemäärän aikajana: aikakohdistin

studio-trust-each-monitor-s-alarm-ratio = Kunkin valvojan hälytyssuhde ajan funktiona

studio-trust-about-this-view = Tietoa tästä näkymästä

studio-trust-can-the-bridge-trust-this = Voiko komentosilta luottaa tähän paikkaratkaisuun?

studio-trust-open-a-run = Avaa ajo

studio-trust-open-the-masked-sky-demo = Avaa peitetyn taivaan demo (geometria, 0.36)

studio-trust-score-an-nmea-log-here = Pisteytä NMEA-loki täällä

studio-trust-run-the-engine-in-this = Aja moottori tässä selaimessa aluksen NMEA 0183 -lokille ja katso tulos alla olevasta näkymästä. Loki luetaan tällä sivulla eikä sitä koskaan lähetetä. Sen on oltava enintään 2 MiB:n ote (noin 20 000 epookkia), ja siinä on oltava viiden minuutin kalibrointi-ikkuna. Asetukset ovat aluksen rajat ja pistemäärän painot, kuten istuntotiedostossa.

studio-trust-score-the-synthetic-demo-log = Pisteytä synteettinen demoloki

studio-trust-session-settings-toml = Istunnon asetukset (TOML)

studio-trust-starts-from-the-demo-s = Lähtee demon asetuksista: muokkaa aluksen nopeus-, kiihtyvyys- ja kääntymisnopeusrajoja vastaamaan omiasi. Oman aluksesi asetustiedoston voi liittää tähän.

studio-trust-jammertest-scorecard = Jammertest-pistekortti

studio-trust-no-scorecard-open = Pistekorttia ei ole avattu.

studio-trust-generic-receiver-trust-run-not = Yleinen vastaanottimen luottamusajo (ei alus)

studio-trust-run-the-illustrative-jamming-example = Aja havainnollistava häirintäesimerkki

studio-trust-assess-the-chosen-file = Arvioi valittu tiedosto

studio-trust-the-format-is-guessed-from = Muoto arvataan tiedostonimestä; muuta sitä tässä, kun se on väärä, ja arvioi sitten uudelleen. NovAtel OEM7, RTCM 3 ja Septentrio SBF ovat binäärimuotoja; ne lähetetään moottorille sellaisinaan, tässä selaimessa.

studio-trust-imu-file-optional-a-second = IMU-tiedosto (valinnainen): toinen anturi suuntaa varten

studio-trust-an-imu-log-on-the = Vastaanottimen lokin kellossa oleva IMU-loki täyttää suunnan, jonka suunta–kurssi-valvoja lukee kaikkialla, missä vastaanottimen lokissa sitä ei ole. Vain aluksen istunto käyttää sitä.

studio-trust-remove-the-imu-file = Poista IMU-tiedosto

studio-trust-no-imu-file = Ei IMU-tiedostoa.

studio-trust-session-settings-toml-the-log = Istunnon asetukset (TOML, loki annetaan sisällytettynä)

studio-trust-first-deduction = Ensimmäinen vähennys

studio-trust-first-untrusted = Ensimmäinen ei-luotettu

studio-trust-receiver-reported-track = Vastaanottimen raportoima reitti

studio-trust-the-satellites-the-log-s = Satelliitit, jotka lokin oma GSV luettelee. Täytetyllä merkillä on signaalinvoimakkuus; ontto on luetteloitu ilman sitä; varjostettu sektori on kohta, jossa loki luettelee satelliitteja eikä kuule yhtäkään (tukittu taivas ja häirretty signaali näyttävät tässä samalta). Nimellinen tähdistö, ei lokin päivämäärän efemeridi.

studio-trust-score-over-time = Pistemäärä ajan funktiona

studio-trust-score-0-to-100-dashed = Pistemäärä 0–100. Katkoviivat ovat kaistan reunat; alla olevat kaistaleet ovat kaista ja portti. Siirrä aikakohdistinta vetämällä tai napsauttamalla; nuolinäppäimet siirtävät sitä askelittain.

studio-trust-reasons-at-the-cursor = Syyt kohdistimen kohdalla

studio-trust-points-each-check-took-off = Pisteet, jotka kukin tarkistus vähensi tästä epookista, suurin ensin. Napsauta tarkistusta merkitäksesi, missä se oli aktivoitumiskynnyksensä yläpuolella.

studio-trust-geometry-at-the-cursor = Geometria kohdistimen kohdalla

studio-trust-the-satellite-geometry-always-shown = Satelliittigeometria, aina näkyvissä: sen nimike (hyvä, kohtalainen tai huono) ja DOP-arvot. Peitetty taivas (runko, laituri, vuonon seinämä) on luonnollista heikkenemistä, joka erotetaan hyökkäyksenkaltaisesta epäjohdonmukaisuudesta. Pistemäärästä vähennetään pisteitä geometrian takia vain, kun se on huono, enintään 15, eikä koskaan heikentyneen kaistan alapuolelle.

studio-trust-the-receiver-s-own-flag = Vastaanottimen oma lippu

studio-trust-what-the-receiver-itself-says = Mitä vastaanotin itse sanoo harhautuksesta (spoofing) ja häirinnästä (jamming) (u-blox UBX-NAV-STATUS ja UBX-SEC-SIG), Kshanan valvojien rinnalla. Koodit ovat vastaanottimen; kumpikaan ilmaisin ei ole totuus, ja yhtäpitävyys ei ole validointia. Lippu ei muuta pistemäärää.

studio-trust-over-the-run = Ajon aikana

studio-trust-what-the-score-used = Mitä pistemäärä käytti

studio-trust-read-from-the-run-read = Luettu ajosta, vain luku.

studio-trust-what-this-view-does-and = Mitä tämä näkymä näyttää ja mitä ei

studio-trust-nmea-only-checks-cannot-see = Pelkästään NMEA:han perustuvat tarkistukset eivät näe harhauttajaa, joka toistaa koko tähdistön itsejohdonmukaisella paikalla, nopeudella, suunnalla, teholla ja kellolla, eivätkä myöskään tallennettujen todellisten signaalien toistoa. Paikkaratkaisu ilman hälytystä ei siten ole hyvä paikkaratkaisu.

studio-trust-nothing-on-this-page-is = Mikään tällä sivulla ei mittaa, miten tarkistukset suoriutuvat todellisessa häiriössä. Pistemäärän kuvaus ja jokainen paino on kiinnitetty ennen kuin lokia pisteytetään, ilman oppimista eikä mitään tapahtumiin sovitettua.

studio-main-which-satellites-can-you-see = Mitkä satelliitit näet paikasta, ja kuinka hyvä on niiden geometria? Taivaskartta, horisonttiviiva ja DOP moottorista selaimessasi

studio-main-trainer-debrief-for-kshana-nmea = Ohjaajan purku kshana nmea-scenario -ohjaajalokeille (vain harjoitukseen; tiedostot pysyvät selaimessasi)

studio-main-where-did-aircraft-and-ships = Missä ilma-alukset ja alukset raportoivat heikentynyttä navigointidataa menneenä päivänä? Avaa päiväkohtaisia karttatiedostoja (ne pysyvät selaimessasi)

studio-main-can-the-bridge-trust-this = Voiko komentosilta luottaa tähän paikkaratkaisuun? Avaa aluksen vastaanottimen luottamusajo (tiedostot pysyvät selaimessasi)

studio-main-evidence-packs-test-bench-export = Todistepaketit, testipenkin vienti, compliance-vastaavuus, OSNMA, komentorivityökalut ja tekoälyavustaja (tiedostot pysyvät selaimessasi)

studio-main-map-of-satellites-in-view = Näkyvissä olevien satelliittien kartta Maan yllä, tallennetusta ajosta

studio-main-interactive-3-d-view-of = Interaktiivinen 3D-näkymä propagoidusta reitistä

studio-main-close-history = Sulje historia

studio-main-skip-to-the-content = Siirry sisältöön

studio-main-receiver-trust = Vastaanottimen luottamus

studio-main-advanced-view = Laaja näkymä

studio-main-what-would-you-like-to = Mitä haluat selvittää?

studio-main-pick-a-question-or-start = Valitse kysymys tai aloita alla olevasta tuloksesta.

studio-main-showing-below = Näytetään alla

studio-main-integrity-over-12-hours = Eheys 12 tunnin aikana

studio-main-a-radio-waterfall = Radiovesiputous

studio-main-recorded-result = Tallennettu tulos

studio-main-how-many-navigation-satellites-can = Kuinka monta navigointisatelliittia näet mistä tahansa Maan pisteestä?

studio-main-loading-the-recorded-result = Ladataan tallennettua tulosta…

studio-main-everything-kshana-can-do = Kaikki, mitä Kshana osaa

studio-main-each-area-shows-a-real = Jokainen alue näyttää todellisen tallennetun tuloksen ja sen takana olevan todisteiden yhdistelmän.

studio-main-open-your-own-files = Avaa omat tiedostosi

studio-main-pages-that-run-the-engine = Sivut, jotka ajavat moottorin omilla asetuksillasi ja tiedostoillasi. Jokainen toimii tässä selaimessa; mitään ei lähetetä.

studio-main-which-satellites-can-you-see-2 = Mitkä satelliitit näet paikasta, ja kuinka hyvä on niiden geometria? Piirrä horisonttiviiva.

studio-main-what-accuracy-could-a-reference = Millaisen tarkkuuden Kuun etelänavan lähellä oleva vertailuasema voisi antaa, ja missä? MODELLED.

studio-main-can-the-bridge-trust-this-2 = Voiko komentosilta luottaa tähän paikkaratkaisuun? Pisteytä aluksen NMEA-loki.

studio-main-where-aircraft-and-ships-reported = Missä ilma-alukset ja alukset raportoivat heikentynyttä navigointidataa, sekä reitin altistus.

studio-main-generate-a-drift-or-jamming = Luo ajautumis- tai häirintäharjoituksen virta ja pura ohjaajan loki.

studio-main-two-synthetic-runs-on-one = Kaksi synteettistä ajoa yhdellä kellolla: reitti, luottamuspistemäärä, elävä taivaskartta ja arvio.

studio-main-the-two-optical-atmosphere-scenarios = Kaksi optisen ilmakehän skenaariota: saatavuus pilvikattoa vasten, katkokset ja sijaintien monipuolisuus.

studio-main-which-navigation-signals-a-spacecraft = Mitä navigointisignaaleja kauas satelliittien yläpuolella oleva avaruusalus voi vielä käyttää, ja kuinka hyvin aluksella toimiva suodatin ja formaatio selviävät niillä.

studio-main-what-lunar-orbiters-and-a = Mitä kuuradan kiertäjät ja pinta-asema voivat tehdä navigointi- ja geodeettisena infrastruktuurina, harhaosumat ilmoitettuina.

studio-main-open-a-day-s-observatory = Avaa päivän observatoriotiedostot ja lue ne: kolme tilaa, ei syytä, mitään ei lähetetä.

studio-main-pull-the-antenna-score-the = Irrota antenni, pisteytä holdover: ITU-T-maskeja vasten mitattu aikavirhetallenne.

studio-main-check-a-signed-pack-or = Tarkista allekirjoitettu paketti tai liitä aikaleima.

studio-main-motion-and-event-files-for = Liike- ja tapahtumatiedostot laboratoriosimulaattoria varten.

studio-main-what-your-runs-evidence-against = Mitä ajosi todistavat julkaistuja viitekehyksiä vasten.

studio-main-whether-recorded-galileo-data-is = Onko tallennettu Galileo-data todennettua, tunniste tunnisteelta.

studio-main-use-kshana-from-your-assistant = Käytä Kshanaa avustajastasi MCP-palvelimen kautta.

studio-main-all-scenarios = Kaikki skenaariot

studio-main-pick-one-it-opens-on = Valitse yksi: se avautuu heti tulokseensa.

studio-main-all-questions = Kaikki kysymykset

studio-main-every-published-figure = Jokainen julkaistu luku

studio-main-read-from-the-result-document = Luettu tulosasiakirjasta yksikön, huomautuksen ja alkuperän kanssa, jotka moottori tallentaa kullekin.

studio-main-kalman-self-consistency = Kalmanin itsejohdonmukaisuus

studio-main-a-consistent-filter-s-reported = Johdonmukaisen suodattimen raportoima epävarmuus vastaa sen todellisia virheitä. NIS:n (normalisoitu innovaationeliö) pitäisi olla lähellä arvoa 1 ja NEES:n (normalisoitu estimointivirheneliö) lähellä arvoa 2, kummankin 95 %:n χ²-kaistan sisällä.

studio-main-engine-chart = Moottorin kaavio

studio-main-each-series-this-run-publishes = Jokainen sarja, jonka tämä ajo julkaisee, ajan funktiona. Lue arvot osoittamalla tai vetämällä kaavion yli.

studio-main-carrier-to-noise-density-db = kantoaallon ja kohinan tiheyssuhde, dB-Hz

studio-main-with-the-jammer = Häirintälähteen kanssa

studio-main-without-it = Ilman sitä

studio-main-each-cell-is-one-satellite = Jokainen ruutu on yksi satelliitti yhtenä tämän ajon epookkina. Viivoitetut ruudut ovat vastaanottimen seurantakynnyksen alapuolella: se satelliitti on menetetty.

studio-main-interference-outcome = Häiriön lopputulos

studio-main-error-since-gnss-was-lost = virhe GNSS:n menetyksestä alkaen

studio-main-scenario-budget = Skenaarion budjetti

studio-main-move-the-budget-and-the = Siirrä budjettia, niin aika rikkoutumiseen luetaan tämän ajon oman virhetallenteen perusteella. Moottorin holdover-luku, laskettuna skenaarion budjetilla, näytetään rinnalla ja on ratkaiseva luku. Muuta kelloa tai katkosta parametreissa ajaaksesi fysiikan uudelleen.

studio-main-maximum-time-interval-error = suurin aikavälivirhe

studio-main-time-deviation = aikapoikkeama

studio-main-mask-checks-and-holdover-budgets = Maskitarkistukset ja holdover-budjetit

studio-main-each-check-s-limit-is = Kunkin tarkistuksen raja piirretään renkaana keskiarvoistusajalle, jolla marginaali oli heikoin. Maskit on jäljennetty kussakin rivissä mainituista ITU-T:n (International Telecommunication Union Telecommunication Standardization Sector) suosituksista.

studio-main-lower-is-better-fractional-frequency = Pienempi on parempi. Suhteellisen taajuuden vakaus keskiarvoistusajan τ funktiona, logaritmisilla akseleilla.

studio-main-earth-centred-inertial-frame = Maakeskinen inertiakoordinaatisto

studio-main-drag-to-rotate-scroll-to = Pyöritä vetämällä, zoomaa vierittämällä.

studio-main-run-the-engine-once-per = Aja moottori kerran arvoa kohti ja piirrä yksi laatumittari. Lisää toinen parametri lämpökarttaa varten. Jokainen piste on todellinen moottoriajo, enintään 60.

studio-main-pinned-runs-side-by-side = kiinnitetyt ajot rinnakkain

studio-main-clear-pins = Tyhjennä kiinnitykset

studio-main-key-figures-run-against-run = Keskeiset luvut, ajo ajoa vasten

studio-main-the-headline-readouts-of-each = Kunkin kiinnitetyn ajon pääluvut; muutos on ajoon A verrattuna.

studio-main-the-engine-s-own-export = moottorin oma vienti

studio-main-written-by-the-engine = moottorin kirjoittama

studio-main-czml-kml-geojson-stk-ephemeris = CZML, KML, GeoJSON, STK-efemeridi, SigMF

studio-main-try-other-settings = Kokeile muita asetuksia

studio-main-change-a-value-then-run = Muuta arvoa ja aja sitten uudelleen. Vastaus ja kaavio päivittyvät paikallaan.

studio-main-run-again = Aja uudelleen

studio-main-cancel-the-run = Peruuta ajo

studio-main-runs-in-your-browser-nothing = Toimii selaimessasi. Mitään ei lähetetä.

studio-main-advanced-settings = Lisäasetukset

studio-main-every-setting-comes-from-the = Jokainen asetus tulee skenaariotiedostosta. Muokkaa koko tiedostoa kohdassa ”Tutkijoille”.

studio-main-how-this-is-computed = Miten tämä lasketaan

studio-main-level-of-evidence = Todistetaso

studio-main-the-engine-s-own-one = Moottorin oma yhden rivin yhteenveto

studio-main-every-figure-is-labelled-with = Jokaiseen lukuun on merkitty sen todistetaso. Validoitu tarkoittaa tarkistettua riippumatonta ulkoista oraakkelia vasten; mallinnettu tarkoittaa perusperiaatteisiin pohjautuvaa fysiikkaa testeineen, jota ei vielä ole tarkistettu oraakkelia vasten.

studio-main-for-researchers = Tutkijoille

studio-main-code-data-citation = koodi, data, viittaus

studio-main-run-it-on-your-computer = Aja se tietokoneellasi

studio-main-run-it-from-python = Aja se Pythonista

studio-main-exported-figures-carry-this-doi = Viedyt kuvat sisältävät tämän DOI-tunnuksen (digital object identifier) kuvatekstissään. Sama skenaario, siemenluku ja moottoriversio antavat samat luvut.

studio-main-toml-tom-s-obvious-minimal = TOML (Tom's Obvious, Minimal Language)

studio-main-in-the-editor-tab-indents = Editorissa Tab sisentää kahdella välilyönnillä. Paina Escape ja sitten Tab siirtyäksesi eteenpäin. Aja uudelleen käyttääksesi muokkaustasi.

studio-main-every-panel-and-field = Jokainen paneeli ja kenttä

studio-main-the-advanced-view-is-the = Laaja näkymä on koko hallintanäkymä: tämän ajon jokainen paneeli rinnakkain, skenaarion jokainen kenttä, pyyhkäisyt, vertailut ja moottorin oma raportti. Se avautuu tähän skenaarioon asetuksinesi.

studio-main-kshana-pro = Kshana Pro

studio-main-kshana-studio = Kshana Studio

studio-main-request-an-evaluation = Pyydä arviointia

studio-main-talk-to-us-about-a = Keskustele kanssamme kaupallisesta lisenssistä

studio-main-request-a-study = Pyydä selvitystä

studio-main-imagery-nasa-visible-earth-blue = Kuvat: NASA Visible Earth (Blue Marble). Rantaviivat: Natural Earth. Jokainen tässä oleva kaavio on piirretty moottorin ajosta; natiivin komentorivimoottorin tekemä ajo, raportti, animaatio tai vienti on merkitty tallennetuksi.

studio-main-this-session = tämä istunto

studio-main-runs-you-make-appear-here = Tekemäsi ajot näkyvät tässä. Valitse yksi palauttaaksesi sen skenaarion ja tuloksen tai kiinnitä se vertailua varten.

studio-advanced-find-a-scenario-a-domain = Etsi skenaario, toimialue, kenttä tai komento

studio-advanced-the-runs-you-made-in = Tässä istunnossa tekemäsi ajot

studio-advanced-a-short-tour-of-the = Lyhyt kierros Studioon

studio-advanced-toggle-colour-theme = Vaihda väriteemaa

studio-advanced-switch-to-the-simple-view = Siirry yksinkertaiseen näkymään

studio-advanced-the-simple-view-the-answer = Yksinkertainen näkymä: vastaus ensin, viisi asetusta, yksityiskohdat pyydettäessä

studio-advanced-scenario-library = Skenaariokirjasto

studio-advanced-close-the-library = Sulje kirjasto

studio-advanced-find-a-scenario-a-domain-2 = Etsi skenaario, toimialue tai kenttä

studio-advanced-scenario-domain-or-field = Skenaario, toimialue tai kenttä

studio-advanced-filter-by-domain = Suodata toimialueen mukaan

studio-advanced-scenarios-by-mission-domain = Skenaariot tehtävän toimialueen mukaan

studio-advanced-how-the-studio-works = Miten Studio toimii

studio-advanced-search-scenarios-domains-or-fields = Hae skenaarioita, toimialueita tai kenttiä

studio-advanced-search-scenarios-domains-or-fields-2 = Hae skenaarioita, toimialueita tai kenttiä, esimerkiksi korkeuskulmamaski

studio-advanced-the-engine-kind-this-scenario = Moottorityyppi, jota tämä skenaario ajaa

studio-advanced-open-the-scenario-library = Avaa skenaariokirjasto

studio-advanced-show-the-parameters-and-the = Näytä parametrit ja skenaarion lähde

studio-advanced-keep-this-run-to-compare = Säilytä tämä ajo vertailua varten toiseen (enintään 4)

studio-advanced-compare-the-pinned-runs = Vertaa kiinnitettyjä ajoja

studio-advanced-share-this-run-or-download = Jaa tämä ajo tai lataa se

studio-advanced-result-panels = Tulospaneelit

studio-advanced-run-summary = Ajon yhteenveto

studio-advanced-parameters-and-scenario-source = Parametrit ja skenaarion lähde

studio-advanced-close-the-parameters-and-show = Sulje parametrit ja näytä tulokset

studio-advanced-find-a-field-of-this = Etsi tämän skenaarion kenttä

studio-advanced-find-a-field-for-example = Etsi kenttä, esimerkiksi maski

studio-advanced-parameter-view = Parametrinäkymä

studio-advanced-find-a-scenario-domain-field = Etsi skenaario, toimialue, kenttä, paneeli tai komento

studio-advanced-skip-to-results = Siirry tuloksiin

studio-advanced-find-anything = Etsi mitä tahansa

studio-advanced-lunar-station-coverage-of-a = Kuuasema: vertailuaseman kattavuus (MODELLED)

studio-advanced-simple-view = Yksinkertainen näkymä

studio-advanced-choose-a-scenario = Valitse skenaario

studio-advanced-what-do-you-want-to = Mitä haluat tehdä?

studio-advanced-pick-a-domain-and-a = Valitse toimialue ja skenaario, määritä se, aja moottori selaimessasi ja lue, vertaa ja vie tulokset. Mitään ei lähetetä.

studio-advanced-share-or-export = Jaa tai vie

studio-advanced-good-first-runs = Hyviä ensimmäisiä ajoja

studio-advanced-pin-run = Kiinnitä ajo

studio-advanced-report-json-scenario-tables-and = raportti, JSON, skenaario, taulukot ja viennit

studio-advanced-the-exact-scenario-in-the = täsmälleen sama skenaario, linkissä

studio-advanced-an-iframe-for-a-course = iframe kurssisivua tai wikiä varten

studio-advanced-opens-in-a-new-tab = avautuu uuteen välilehteen

studio-advanced-loading-the-engine-the-recorded = Ladataan moottoria. Tämän skenaarion tallennettu tulos näytetään ensin.

studio-advanced-got-it = Selvä

studio-advanced-headline-numbers-from-the-engine = Pääluvut moottorin tuloksesta, muutos tämän skenaarion edelliseen ajoosi verrattuna sekä läpäisy tai hylkäys, kun ajo ilmoittaa kynnyksen.

studio-advanced-set-parameters = Aseta parametrit

studio-advanced-every-change-re-runs-the = Jokainen muutos ajaa moottorin uudelleen ja päivittää keskeiset luvut ja paneelit.

studio-advanced-drag-a-slider-and-the = Vedä liukusäädintä, niin skenaario ajetaan uudelleen. Jokainen säädin kirjoittaa suoraan alla olevaan skenaariotekstiin.

studio-advanced-in-the-editor-tab-indents = Editorissa Tab sisentää kahdella välilyönnillä. Paina Escape ja sitten Tab siirtyäksesi eteenpäin.

studio-mission-thread-time-axis = Aika-akseli

studio-mission-thread-mission-thread = Tehtäväketju

studio-mission-thread-where-does-a-mission-s = Missä tehtävän navigointi- ja ajoitusvirhebudjetti loppuu?

studio-mission-thread-a-mission-is-a-chain = Tehtävä on vaiheiden ketju: laukaisu, kohtaaminen, siirto Kuuhun, laskeutuminen, paluu. Jokaisella vaiheella on omat anturinsa ja oma virhebudjettinsa, ja kukin välittää epävarmuutensa seuraavalle. Tämä sivu näyttää koko ketjun budjetin vaihe vaiheelta ja nimeää heikoimman lenkin.

studio-mission-thread-open-the-artemis-class-example = Avaa Artemis-luokan esimerkki

studio-mission-thread-open-a-result-file = Avaa tulostiedosto…

studio-mission-thread-the-thread = Ketju

studio-mission-thread-error-against-mission-elapsed-time = Virhe tehtävän kuluneeseen aikaan nähden

studio-mission-thread-the-phases = Vaiheet

studio-mission-thread-the-budget-of-one-phase = Yhden vaiheen budjetti
