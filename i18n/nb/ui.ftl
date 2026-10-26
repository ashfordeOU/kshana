# Brukergrensesnitttekst (norsk bokmål): nettstedets ramme, merknader, språkvelger, Studio-skallet.

## Site chrome
site-skip-link = Gå til innholdet
site-nav-primary = Hovedmeny
site-nav-missions = Oppdrag
site-nav-capabilities = Funksjoner
site-nav-evidence = Evidens
site-nav-research = Forskning
site-nav-developers = Utviklere
site-nav-docs = Dokumentasjon
site-nav-editions = Utgaver
site-nav-search = Søk
site-nav-launch = Start
site-nav-studio = { -brand } Studio
site-nav-home = { -brand } forside
site-nav-theme = Bytt mellom lyst og mørkt tema
site-version = v{ $version }

site-footer-tagline = Åpen kildekode-simulator for PNT-robusthet (posisjonering, navigasjon og tidssynkronisering). Den styrer ingen radiomaskinvare og sender ingenting: signalnivåutdataene er IQ-sampelfiler i basebånd, og programvare-GNSS-mottakeren er et analyseverktøy. Ikke et produkt for luftfart.
site-footer-product = Produkt
site-footer-company = Selskap
site-footer-benchmark = Benchmark
site-footer-install = Installasjon
site-footer-mcp = MCP-server
site-footer-github = GitHub
site-footer-kshana-pro = { -brand } Pro
site-footer-licence = { -brand } v{ $version } · av Ashforde® OÜ · AGPL-3.0, med mulighet for kommersiell lisens
site-footer-provenance = Hvert diagram er tegnet fra en registrert kjøring av motoren v{ $version } og oppgir scenarioet, seedet og fremgangsmåten for å gjengi det.

## Language switcher
site-lang-label = Språk
site-lang-switch-aria = Velg språket på denne siden
site-lang-auto = Nettleserens språk
site-lang-remembered = Valget ditt huskes på denne enheten.

## Notices (shown at the top of a page's content)
notice-machine-translation = { -mt-notice }
notice-fallback =
    { $n ->
        [one] { $n } del av denne siden er endret siden den ble oversatt, og vises på engelsk.
       *[other] { $n } deler av denne siden er endret siden de ble oversatt, og vises på engelsk.
    }
notice-not-started = Denne siden er ikke oversatt ennå. Den vises på engelsk.
notice-detected = Viser { $language }. <a1>Bytt til engelsk</a1>
notice-dismiss = Lukk
notice-recorded-in-english = Registrert på engelsk
notice-advisory = { -advisory }

## Studio shell
studio-title = { -brand } Studio
studio-home = { -brand } forside
studio-search-label = Finn et scenario, et område, en innstilling eller en kommando
studio-search-placeholder = Søk etter navn, spørsmål eller innstilling, for eksempel elevasjonsmaske
studio-search-scenarios = Søk etter scenarioer, områder eller innstillinger
studio-search-commands = Søk etter scenarioer og kommandoer
studio-search-all = Finn et scenario, et område, en innstilling, en visning eller en kommando
studio-search = Søk
studio-theme = Bytt mellom lyst og mørkt tema
studio-starting-questions = Spørsmål å starte med
studio-where-you-are = Hvor du er
studio-engine-status = Hvor motoren kjører
studio-views = Visninger: Geometri, Mottakertillit, Interferenskart, Treningsdebrief, Verktøy
studio-more-views = Flere visninger
studio-advanced-full = Hele dashbordet: alle paneler, felt og faner
studio-advanced-switch = Bytt til den avanserte visningen
studio-view-geometry = Geometri: skyplot, horisontprofil og DOP
studio-view-training = Treningsdebrief: åpne en instruktørlogg
studio-view-interference = Interferenskart: åpne kartfiler
studio-view-receiver-trust = Mottakertillit: åpne en fartøykjøring
studio-view-tools = Verktøy: evidens, bench, compliance, OSNMA
studio-result = Resultat
studio-result-meaning = Hva resultatet betyr
studio-key-figures = Nøkkeltall
studio-result-views = Visninger av dette resultatet
studio-figures-of-merit = Kvalitetsmål
studio-find-result-field = Finn et resultatfelt
studio-capability-view = Funksjonsvisning
studio-time-series = Tidsserie
studio-chart-source = Diagrammets kilde
studio-signal-band = Signal og bånd
studio-signal-field = Signalfelt
studio-clock-holdover = Klokkens holdover
studio-telecom-masks = Tidsmasker for telekommunikasjon
studio-clock-stability = Klokkens stabilitet
studio-orbit-3d = 3D-bane
studio-ground-track = Sporet på jorden
studio-parameter-sweep = Parametersveip
studio-compare-runs = Sammenlign kjøringer
studio-animation = Animasjon
studio-engine-report = Motorrapport
studio-exports = Eksport og rapport
studio-full-result = Fullt resultatdokument
studio-settings = Innstillinger og detaljer
studio-find-setting = Finn en innstilling, for eksempel maske
studio-find-scenario-setting = Finn en innstilling i dette scenarioet
studio-engine-summary = Motorens egen oppsummering
studio-restore-scenario = Gjenopprett det medfølgende scenarioet
studio-copy-scenario = Kopier scenarioteksten
studio-scenario-source = Scenariokilde (TOML)
studio-install-engine = Installer motoren
studio-run-history = Kjøringshistorikk
studio-scenarios-count =
    { $n ->
        [one] Scenario den kjører ({ $n })
       *[other] Scenarioer den kjører ({ $n })
    }
studio-ledger-rows =
    { $n ->
        [one] { $n } registerrad
       *[other] { $n } registerrader
    }
studio-recorded-in-english = Registrert på engelsk
studio-lang-engine-fallback = Motorteksten for dette språket kunne ikke lastes; engelsk vises.

studio-geometry-kshana-home = Kshana forside

studio-geometry-back-to-the-studio = Tilbake til Studio

studio-geometry-step-the-time = Stegvis tid

studio-geometry-draw-the-skyline = Tegn horisontlinjen

studio-geometry-skip-to-the-view = Hopp til visningen

studio-geometry-which-satellites-can-you-see = Hvilke satellitter kan du se, og hvor god er geometrien deres?

studio-geometry-what-this-shows = Hva dette viser

studio-geometry-starting-the-engine = Starter motoren…

studio-geometry-every-setting-is-in-the = Alle innstillinger ligger i sideadressen, så en kopiert lenke åpner den samme himmelen.

studio-geometry-offset-from-the-constellations-reference = Avvik fra konstellasjonenes referanseepoke

studio-geometry-10-min = −10 min

studio-geometry-10-min-2 = +10 min

studio-geometry-your-own-orbital-elements-tle = Dine egne baneelementer (TLE)

studio-geometry-use-these-elements = Bruk disse elementene

studio-geometry-back-to-the-presets = Tilbake til forhåndsinnstillingene

studio-geometry-clear-the-skyline = Fjern horisontlinjen

studio-geometry-drag-on-the-skyplot-to = Dra på skyplottet for å tegne horisontlinjen (trinn på 1° azimut og 0,5° elevasjon). Med skyplottet i fokus: Venstre og Høyre flytter rundt horisonten (Shift for 10°), Opp og Ned hever eller senker horisontlinjen der (Shift for 5°), Delete fjerner den.

studio-geometry-copy-a-link-to-this = Kopier en lenke til denne himmelen

studio-geometry-download-the-skyplot-svg = Last ned skyplottet (SVG)

studio-geometry-zenith-in-the-centre-the = Zenit i midten, horisonten ytterst, nord opp. Fylte markører er satellitter i løsningen; hule markører er skjult av masken eller horisontlinjen, eller ikke brukt.

studio-geometry-dilution-of-precision = Nøyaktighetsforringelse (DOP)

studio-geometry-how-much-the-geometry-multiplies = Hvor mye geometrien multipliserer avstandsfeilen. Lavere er bedre; omtrent 1 er utmerket, over 6 er dårlig.

studio-geometry-horizontal-position-error = Horisontal posisjonsfeil

studio-geometry-satellites-as-a-table = Satellitter som tabell

studio-geometry-the-same-satellites-as-the = De samme satellittene som i skyplottet.

studio-geometry-azimuth = Azimut, °

studio-geometry-elevation = Elevasjon, °

studio-geometry-in-the-solution = I løsningen

studio-geometry-the-engine-runs-here-as = Motoren kjører her som WebAssembly. Ingenting hentes fra et annet nettsted, og ingenting du angir, sendes noe sted.

studio-holdover-holdover-test-scenarios = Scenarioer for holdover-test

studio-holdover-holdover-test = Holdover-test

studio-holdover-how-far-does-the-time = Hvor langt går tidsfeilen når GNSS er borte?

studio-holdover-opening-the-scenarios = Åpner scenarioene…

studio-holdover-verdict-step-by-step = Vurderingen, trinn for trinn

studio-holdover-time-error-over-the-record = Tidsfeil over registreringen

studio-holdover-the-three-phases-are-shaded = De tre fasene er skravert; de stiplede loddrette linjene er de to tidspunktene operatøren oppga. Stiplede vannrette linjer er maskenes grenser for maksimal absolutt tidsfeil, hver tegnet over trinnet masken angir, og gjenopprettingsbåndet; en trekant markerer når et budsjett eller ePRTC-A-holdover-omslutningen først overskrides.

studio-holdover-of-the-baseline-and-the = Av grunnlinjen og holdover; et kryss er en maskegrense på tidspunktet da kontrollen var dårligst.

studio-holdover-the-same-two-steps-against = De samme to trinnene mot TDEV-grensene.

studio-holdover-the-numbers = Tallene

studio-holdover-everything-below-is-the-engine = Alt nedenfor er motorens, i de enhetene den oppgir.

studio-holdover-mask-checks = Maskekontroller

studio-holdover-each-mask-is-measured-on = Hver maske måles på trinnet betingelsen den angir. En maske som trenger en lengre registrering enn trinnet ga, er INCOMPLETE, aldri ekstrapolert; hver oppføring en anbefaling overlater til videre studier, er utelatt.

studio-holdover-what-this-does-not-cover = Hva dette ikke dekker

studio-interference-cell-size-in-degrees-empty = Cellestørrelse i grader (tom for 0,5)

studio-interference-https = https://…

studio-interference-about-this-page = Om denne siden

studio-interference-interference-map = Interferenskart

studio-interference-where-did-position-reports-look = Hvor så posisjonsrapportene forringet ut?

studio-interference-open-map-files = Åpne kartfiler

studio-interference-or-drop-them-here = eller slipp dem her

studio-interference-open-the-synthetic-demo = Åpne den syntetiske demoen

studio-interference-close-all-maps = Lukk alle kart

studio-interference-nothing-open-yet = Ingenting åpent ennå.

studio-interference-build-a-map-here = Bygg et kart her

studio-interference-build-from-the-synthetic-sample = Bygg fra det syntetiske utvalget

studio-interference-route-exposure-here = Rutens eksponering her

studio-interference-use-the-synthetic-route = Bruk den syntetiske ruten

studio-interference-reading-these-maps = Slik leser du disse kartene

studio-interference-maps-inherit-the-coverage-of = Kart arver dekningen til kilden sin: frivillige ADS-B-mottakere gir tynn dekning over åpent hav, og åpne AIS-data utelater enkelte fartøyklasser. Les dekningsmerknadene i hver fil.

studio-interference-no-coastline-or-basemap-is = Det tegnes ingen kystlinje eller bakgrunnskart, og ingenting hentes fra noen server; rutenettet består kun av breddegrad og lengdegrad.

studio-interference-no-identifier-of-any-aircraft = Ingen identifikator for noe luftfartøy eller fartøy finnes i disse filene; celler med for få ulike luftfartøy eller fartøy publiseres ikke i det hele tatt, og et AIS-antall på én eller to holdes tilbake.

studio-lunar-infra-lunar-infrastructure-scenarios = Scenarioer for månens infrastruktur

studio-lunar-infra-lunar-infrastructure = Månens infrastruktur

studio-lunar-infra-what-can-the-moon-s = Hva kan månens bane og overflate gjøre som navigasjons- og geodetisk infrastruktur, og hvor kommer den til kort?

studio-lunar-infra-five-studies-of-what-lunar = Fem studier av hva månebanefarkoster og en stasjon på månens overflate kunne gjort sammen som navigasjons- og geodetisk infrastruktur: banebestemmelse fra jord-GNSS-signaler mot bakkesporing, bærebølgefase-fiksering mellom en overflatestasjon og en banefarkost, samestimering av månens referansesystem, kobling av GNSS, VLBI og laseravstandsmåling på ett romfartøy, og hvor følsomme laseravstandsmåling og sporing er for månens tidevann og librasjon. Inngangsdataene er illustrative og modellen er begrenset; der en studie ikke nådde terskelen den ble forhåndsregistrert mot, sier denne siden det. Hvert tall er kopiert fra et resultat motoren har registrert; siden skalerer det og tegner det, og beregner ingenting annet.

studio-lunar-infra-what-the-result-holds = Hva resultatet inneholder

studio-lunar-infra-findings-disclosures-and-what-was = Funn, opplysninger og det som ikke ble verifisert

studio-lunar-what-these-figures-are = Hva disse tallene er

studio-lunar-map-key = Tegnforklaring

studio-lunar-lunar-station = Månestasjon

studio-lunar-what-accuracy-could-a-reference = Hvilken nøyaktighet kunne en referansestasjon nær månens sydpol gi, og hvor?

studio-lunar-the-constellation-its-signal-in = Konstellasjonen, dens signalfeil i rommet, stasjonens oppmålingsfeil, korreksjonsforsinkelsen og kvantiseringen av linken er inngangsdata oppgitt i scenariofilen, hver med sin kilde eller merket som illustrativ. Ingen tall her er kontrollert mot en reell stasjon eller flydata.

studio-lunar-the-source-and-every-input = Kilden og hver inngang du endrer, ligger i sideadressen, så en kopiert lenke åpner den samme studien.

studio-lunar-a-result-file-is-the = En resultatfil er JSON-en motoren skriver for denne typen (JSON-utdata fra kommandolinjen, eller en kjøring lagret herfra). Den leses på denne siden; ingenting sendes.

studio-lunar-each-field-shows-the-scenario = Hvert felt viser verdien fra scenariofilen til du endrer den. Et døgn med epoker over hele rutenettet tar en stund: færre forsøk eller et lengre tidssteg kjører raskere.

studio-lunar-run-it-here = Kjør her

studio-lunar-back-to-the-file-s = Tilbake til filens verdier

studio-lunar-copy-a-link = Kopier en lenke

studio-lunar-save-this-result-json = Lagre dette resultatet (JSON)

studio-lunar-corrected-error-over-the-south = Korrigert feil over sydpolområdet

studio-lunar-south-polar-stereographic-the-pole = Sydpolar stereografisk: polen i midten, rutenettets kant ytterst, 0° lengdegrad opp, 90° øst til høyre. Hver celle er ett rutenettpunkt; den tykke linjen er der den korrigerte feilen krysser terskelen, og den stiplede linjen er dekningsradiusen per azimut.

studio-lunar-region-figures = Tall for området

studio-lunar-over-the-whole-grid-means = Over hele rutenettet: gjennomsnitt vektet etter areal, og det verste punktet.

studio-lunar-coverage-radius-per-azimuth = Dekningsradius per azimut

studio-lunar-along-each-bearing-from-the = Langs hver retning fra stasjonen, avstanden der dekningen først faller under 95 %.

studio-lunar-as-a-table = Som tabell

studio-lunar-radius-km = Radius, km

studio-lunar-at-the-grid-edge = Ved kanten av rutenettet

studio-lunar-points-along-it = Punkter langs den

studio-lunar-an-epoch-is-unavailable-at = En epoke er utilgjengelig i et punkt når brukeren ser færre enn fire satellitter, eller stasjonen ikke ser alle satellittene brukeren bruker; ingen feil beregnes for den.

studio-lunar-grid-points-as-a-table = Rutenettpunkter som tabell

studio-lunar-the-same-points-as-the = De samme punktene som på kartet, nærmest stasjonen først.

studio-lunar-latitude = Breddegrad, °

studio-lunar-longitude = Lengdegrad, °

studio-lunar-from-the-station-km = Fra stasjonen, km

studio-lunar-corrected-error = Korrigert feil

studio-lunar-uncorrected-error = Ukorrigert feil

studio-lunar-hpl-median = HPL-median

studio-lunar-the-engine-s-statement-inputs = Motorens utsagn, inngangsdata og linkbudsjett

studio-lunar-inputs-as-the-engine-read = Inngangsdata slik motoren leste dem

studio-lunar-error-model = Feilmodell

studio-lunar-correction-link-budget-at-the = Linkbudsjett for korreksjonen ved stasjonen og ved det verste punktet

studio-observatory-previous-day = Forrige dag

studio-observatory-day-opened = Åpnet dag

studio-observatory-next-day = Neste dag

studio-observatory-interference-observatory = Interferensobservatorium

studio-observatory-what-did-one-day-s = Hvordan så én dags posisjonsrapporter ut?

studio-observatory-the-observatory-writes-a-few = Observatoriet skriver noen få filer for hvert UTC-døgn og hver region: rutenettcellene med én av tre tilstander, en hendelsesliste og et manifest. Åpne filene du har laget her, og les dem. Siden beregner ingenting og viser bare det filene sier. Den leverer ingen observatoriedata, henter ingenting og laster ikke opp noe.

studio-observatory-open-a-day = Åpne en dag

studio-observatory-larr = ←

studio-observatory-rarr = →

studio-observatory-the-three-states = De tre tilstandene

studio-observatory-the-picture-the-observatory-wrote = Bildet observatoriet skrev

studio-observatory-the-png-you-opened-as = PNG-filen du åpnet, som den er. Celler som ikke er tegnet, ble ikke observert.

studio-observatory-cells-drawn-from-the-file = Celler, tegnet fra filen

studio-observatory-plate-carr-eacute-e-no = Plate carrée, uten bakgrunnskart. Hold musepekeren over en celle, eller bruk tabellen, for å se tilstand og antall. Et sted uten celle ble ikke observert.

studio-observatory-hover-or-focus-a-cell = Hold musepekeren over eller sett fokus på en celle for å se tilstanden.

studio-observatory-every-cell-in-the-file = Hver celle i filen

studio-observatory-a-count-the-file-withholds = Et antall filen holder tilbake (færre enn 5 luftfartøy) vises som «holdt tilbake», aldri som 0.

studio-observatory-files-and-their-hashes = Filer og deres hasher

studio-observatory-dataset-licence-and-notice = Datasett, lisens og merknad

studio-observatory-what-this-page-does-and = Hva denne siden viser og ikke viser

studio-observatory-products-are-released-at-least = Produkter frigis minst 24 timer etter slutten av UTC-døgnet, på celler på 0,5 grader eller grovere. Dette er aldri en direktevisning, og den sier aldri «nå».

studio-observatory-it-shows-no-cause-no = Den viser ingen årsak, intet land, ingen styrke og ingen kilde til interferens, ingen varsling, ingen sammenligning mellom steder eller dager, og ingen AIS. ADS-B og AIS kombineres aldri.

studio-observatory-the-page-ships-none-of = Siden leverer ingen av observatoriets produkter. Å publisere dem er eierens beslutning.

studio-optical-optical-atmosphere-scenarios = Scenarioer for optisk atmosfære

studio-optical-optical-pnt = Optisk PNT

studio-optical-can-an-optical-link-get = Kan en optisk link komme gjennom været?

studio-optical-the-link = Linken

studio-optical-sites-as-the-engine-states = Steder, slik motoren oppgir dem

studio-optical-inputs-are-marked-everything-else = Inngangsdata er merket; alt annet er motorens utdata for dem.

studio-optical-it-draws-only-what-the = Den tegner bare det motoren registrerte for hvert scenario, inkludert den seedede tidsserien. Siden beregner ingenting: den skalerer motorens tall til diagrammet.

studio-optical-the-sites-their-cloud-climates = Stedene, skyklimaet deres, klokkeklassene og teknikkene er inngangsdata valgt for å illustrere, og er merket slik. Ingen målt tilgjengelighetsregistrering er sammenlignet.

studio-replay-replay-controls = Avspillingskontroller

studio-replay-previous-moment-page-up = Forrige øyeblikk (Page Up)

studio-replay-step-back = Ett steg tilbake

studio-replay-step-back-left-arrow = Ett steg tilbake (venstrepil)

studio-replay-play-or-pause-space = Spill av eller pause (mellomrom)

studio-replay-step-forward = Ett steg frem

studio-replay-step-forward-right-arrow = Ett steg frem (høyrepil)

studio-replay-next-moment-page-down = Neste øyeblikk (Page Down)

studio-replay-replay-speed-mission-seconds-per = Avspillingshastighet, oppdragssekunder per sekund

studio-replay-mission-clock-seconds-from-the = Oppdragsklokke, sekunder fra starten av hver kjøring

studio-replay-bridge-replay = Avspilling av broen

studio-replay-two-runs-one-clock-when = To kjøringer, én klokke: når visste broen det?

studio-replay-put-two-synthetic-runs-side = Legg to syntetiske kjøringer side ved side og spill dem av på én oppdragsklokke. Hvert panel viser hvor fartøyet egentlig var mot hvor mottakeren sa det var, motorens tillitsscore og bånd over tid, satellittene loggen selv lister (himmelen blir tom der loggen ikke hører noen), og en vurdering når kjøringen slutter. Alt som tegnes, kommer fra en logg eller fra motorens resultat for den; ingenting leses fra nettverket.

studio-replay-save-animated-svg = Lagre animert SVG

studio-replay-save-frames-zip = Lagre bilder (ZIP)

studio-replay-opening-the-two-demo-runs = Åpner de to demokjøringene…

studio-replay-the-skyplot-is-the-log = Skyplottet er loggens egen GSV: en fylt markør er en satellitt med signalstyrke, en hul er oppført uten, og en skravert sektor er et azimutområde der loggen lister satellitter og ikke hører noen av dem. En blokkert himmel og et jammet signal ser likt ut her. Det er ikke en horisontlinje, og konstellasjonen er nominell, ikke en efemeride for loggens dato.

studio-replay-position-error-is-the-logged = «Posisjonsfeil» er den loggførte avstanden mellom den sanne og den rapporterte posisjonen; ringen rundt fartøyet er denne avstanden tegnet i målestokk. Tiden fra starten av en hendelse til den første scoren under nominell er en subtraksjon av to loggførte tidspunkter, ikke et mål på deteksjonsytelse.

studio-replay-the-vessel-glyph-points-along = Fartøysymbolet peker langs gyrokursen (HDT), som ingen hendelse berører; den stiplede omrisslinjen er der mottakeren plasserer fartøyet, langs kursen den rapporterer. Et gap mellom de to er et signal for debriefingen.

studio-replay-the-coast-is-natural-earth = Kysten er Natural Earth-land i det offentlige domenet i 1:10 millioner, medfølgende denne siden (ingenting hentes). Posisjonene i demoene er oppdiktet, så kysten viser hvor disse oppdiktede koordinatene havner. Kun illustrasjon, aldri til navigasjon.

studio-ssv-space-user-gnss-scenarios = Scenarioer for GNSS for romfartøybrukere

studio-ssv-space-user-gnss = GNSS for romfartøybrukere

studio-ssv-which-navigation-signals-can-a = Hvilke navigasjonssignaler kan et romfartøy langt over GNSS-satellittene fortsatt bruke?

studio-ssv-the-satellites-of-a-navigation = Satellittene i et navigasjonssystem peker mot jorden, så et romfartøy over dem hører bare det som siver forbi limben eller lekker gjennom sidelober. Denne siden viser hva motoren finner for fem tilfeller: tilgjengelighet på et skall i geostasjonær høyde, en høyt elliptisk bane, en månetransfer med en svaksignalmottaker, et ombordfilter og en formasjon med to romfartøy. Hvert tall er kopiert fra et resultat motoren har registrert; siden skalerer det og tegner det, og beregner ingenting annet.

studio-ssv-against-the-icg-booklet = Mot ICG-heftet

studio-tools-leave-empty-to-check-integrity = la stå tom for å kontrollere bare integriteten

studio-tools-synthetic-osnma-example = Syntetisk OSNMA-eksempel

studio-tools-trust-and-evidence-tools = Verktøy for tillit og evidens

studio-tools-trust-evidence-and-test-tools = Verktøy for tillit, evidens og testing

studio-tools-the-0-35-features-that = Funksjonene fra 0.35 som kjører i nettleseren din, og hvor du finner dem som ikke kan det. Filer du åpner her, leses på denne siden og lastes aldri opp; motoren kjører på datamaskinen din som WebAssembly.

studio-tools-maritime-trust = Maritim tillit

studio-tools-training-debrief = Treningsdebrief

studio-tools-the-engine-starts-when-you = Motoren starter når du bruker et verktøy.

studio-tools-every-0-35-feature-and = Hver funksjon fra 0.35, og hvor den finnes

studio-tools-in-this-browser-where-it = I denne nettleseren der den kan kjøre. Resten er funksjoner for kommandolinje eller server, og grunnen oppgis.

studio-tools-in-the-studio = I Studio

studio-tools-verify-an-evidence-pack = Verifiser en bevispakke

studio-tools-open-the-synthetic-example-pack = Åpne den syntetiske eksempelpakken

studio-tools-open-it-with-one-byte = Åpne den med én byte endret

studio-tools-no-pack-files-chosen = Ingen pakkefiler valgt.

studio-tools-verify-the-pack = Verifiser pakken

studio-tools-attach-a-timestamp-token = Legg ved et tidsstempelsymbol

studio-tools-attach-to-the-chosen-pack = Legg ved den valgte pakken

studio-tools-export-a-scenario-for-a = Eksporter et scenario for en laboratoriesimulator

studio-tools-which-public-framework-rows-do = Hvilke rader i offentlige rammeverk gir kjøringene dine belegg for?

studio-tools-use-the-synthetic-example-runs = Bruk de syntetiske eksempelkjøringene

studio-tools-show-the-mapping-tables = Vis koblingstabellene

studio-tools-show-the-sources-they-cite = Vis kildene de viser til

studio-tools-no-result-files-chosen = Ingen resultatfiler valgt.

studio-tools-build-the-report = Bygg rapporten

studio-tools-galileo-osnma-is-the-navigation = Galileo OSNMA: er navigasjonsdataene autentisert?

studio-tools-load-it = Last den

studio-tools-show-the-recorded-result = Vis det registrerte resultatet

studio-tools-imu-fit-sensor-parameters-for = IMU-tilpasning: sensorparametere for hybrid- og fusjonsscenarioene

studio-tools-fit-the-parameters = Tilpass parameterne

studio-tools-jammertest-score-a-receiver-log = Jammertest: score en mottakerlogg mot den publiserte testplanen

studio-tools-import-the-schedule = Importer tidsplanen

studio-tools-score-the-log = Score loggen

studio-training-synthetic-library-scenarios = Syntetiske bibliotekscenarioer

studio-training-library-scenario-to-generate = Bibliotekscenario som skal genereres

studio-training-random-seed-optional = Tilfeldig seed (valgfritt)

studio-training-from-the-scenario = fra scenarioet

studio-training-time-cursor = Tidsmarkør

studio-training-replay-speed = Avspillingshastighet

studio-training-time-cursor-in-log-rows = Tidsmarkør, i loggrader

studio-training-debrief-timeline-time-cursor = Debrief-tidslinje: tidsmarkør

studio-training-what-did-the-crew-see = Hva så mannskapet, og hva skjedde egentlig?

studio-training-open-a-log = Åpne en logg

studio-training-choose-an-instructor-log-or = Velg en instruktørlogg, eller åpne ett av de fem syntetiske bibliotekscenarioene skrevet av CLI-en.

studio-training-or-drop-it-here-or = eller slipp den her, eller åpne et bibliotekscenario:

studio-training-generate-a-stream-here = Generer en strøm her

studio-training-run-the-engine-s-nmea = Kjør motorens NMEA-treningsgenerator i denne nettleseren. Du får den syntetiske NMEA 0183-strømmen for øvelsen og instruktørloggen, og kan gjøre debrief med en gang. Ingenting lastes opp; streaming til en brosimulator over TCP eller UDP er en funksjon for kommandolinjen (se siden Verktøy).

studio-training-previous-moment = Forrige øyeblikk

studio-training-next-moment = Neste øyeblikk

studio-training-true-track-against-reported = Sant spor mot rapportert

studio-training-north-up-one-scale-on = Nord opp, én målestokk på begge akser. Den tynne grå linjen er der fartøyet egentlig var. Den fargede linjen er det mottakeren rapporterte, farget etter hvor langt det var fra sannheten. Der mottakeren ikke rapporterte noen posisjonsbestemmelse, tegnes ingenting for den.

studio-training-events-and-what-the-receiver = Hendelser og hva mottakeren sa

studio-training-one-shared-time-axis-drag = Én felles tidsakse. Dra eller klikk for å flytte markøren; piltastene flytter den stegvis. Hendelsesstolper viser styrken til hver injiserte hendelse over tid.

studio-training-sky-at-the-cursor = Himmelen ved markøren

studio-training-the-satellites-the-stream-s = Satellittene strømmens egen GSV lister. En fylt markør har signalstyrke; en hul er oppført uten; en skravert sektor er der strømmen lister satellitter og ingen høres. Nominell konstellasjon, ikke en efemeride for strømmens dato.

studio-training-at-the-cursor = Ved markøren

studio-training-events-injected = Injiserte hendelser

studio-training-as-the-instructor-log-states = Slik instruktørloggen oppgir dem, med hver parameter.

studio-training-debrief-timeline = Debrief-tidslinje

studio-training-choose-a-moment-to-move = Velg et øyeblikk for å flytte markøren dit.

studio-training-the-satellite-sky-is-a = Satellitthimmelen er en nominell konstellasjon, ikke en efemeride for strømmens dato.

studio-training-nothing-here-is-a-measure = Ingenting her er et mål på hvordan en mottaker eller et system presterer mot interferens.

studio-trust-session-settings-in-toml = Øktinnstillinger i TOML

studio-trust-receiver-trust-session-settings-in = Øktinnstillinger for mottakertillit i TOML

studio-trust-time-cursor-and-filters = Tidsmarkør og filtre

studio-trust-time-cursor-in-epochs = Tidsmarkør, i epoker

studio-trust-score-timeline-time-cursor = Scoretidslinje: tidsmarkør

studio-trust-each-monitor-s-alarm-ratio = Hver overvåkers alarmandel over tid

studio-trust-about-this-view = Om denne visningen

studio-trust-can-the-bridge-trust-this = Kan broen stole på denne posisjonsbestemmelsen?

studio-trust-open-a-run = Åpne en kjøring

studio-trust-open-the-masked-sky-demo = Åpne demoen med maskert himmel (geometri, 0.36)

studio-trust-score-an-nmea-log-here = Score en NMEA-logg her

studio-trust-run-the-engine-in-this = Kjør motoren i denne nettleseren på et fartøys NMEA 0183-logg og se resultatet i visningen nedenfor. Loggen leses på denne siden og lastes aldri opp. Den må være et utdrag på høyst 2 MiB (omtrent 20 000 epoker) og må inneholde kalibreringsvinduet på fem minutter. Innstillingene er fartøyets grenser og vektene til scoren, som i en øktfil.

studio-trust-score-the-synthetic-demo-log = Score den syntetiske demologgen

studio-trust-session-settings-toml = Øktinnstillinger (TOML)

studio-trust-starts-from-the-demo-s = Starter fra demoens innstillinger: rediger fartøyets grenser for hastighet, akselerasjon og svingrate slik at de passer dine. En innstillingsfil for ditt eget fartøy kan limes inn her.

studio-trust-jammertest-scorecard = Jammertest-resultatkort

studio-trust-no-scorecard-open = Ingen resultatkort åpent.

studio-trust-generic-receiver-trust-run-not = Generisk kjøring for mottakertillit (ikke et fartøy)

studio-trust-run-the-illustrative-jamming-example = Kjør det illustrative jamming-eksempelet

studio-trust-assess-the-chosen-file = Vurder den valgte filen

studio-trust-the-format-is-guessed-from = Formatet gjettes fra filnavnet; endre det her når det er feil, og vurder deretter på nytt. NovAtel OEM7, RTCM 3 og Septentrio SBF er binære formater; de sendes til motoren som de er, i denne nettleseren.

studio-trust-imu-file-optional-a-second = IMU-fil (valgfritt): en andre sensor for kursen

studio-trust-an-imu-log-on-the = En IMU-logg på mottakerloggens klokke fyller ut kursen som overvåkeren for kurs mot sporet leser, overalt der mottakerloggen ikke har noen. Bare en fartøyøkt bruker den.

studio-trust-remove-the-imu-file = Fjern IMU-filen

studio-trust-no-imu-file = Ingen IMU-fil.

studio-trust-session-settings-toml-the-log = Øktinnstillinger (TOML, loggen leveres innebygd)

studio-trust-first-deduction = Første fradrag

studio-trust-first-untrusted = Første ikke-pålitelige

studio-trust-receiver-reported-track = Spor rapportert av mottakeren

studio-trust-the-satellites-the-log-s = Satellittene loggens egen GSV lister. En fylt markør har signalstyrke; en hul er oppført uten; en skravert sektor er der loggen lister satellitter og ikke hører noen av dem (en blokkert himmel og et jammet signal ser likt ut her). Nominell konstellasjon, ikke en efemeride for loggens dato.

studio-trust-score-over-time = Score over tid

studio-trust-score-0-to-100-dashed = Score 0 til 100. Stiplede linjer er båndkantene; stripene under er båndet og porten. Dra eller klikk for å flytte tidsmarkøren; piltastene flytter den stegvis.

studio-trust-reasons-at-the-cursor = Årsaker ved markøren

studio-trust-points-each-check-took-off = Poeng hver kontroll trakk fra i denne epoken, de største først. Klikk på en kontroll for å markere hvor den lå over utløsningsnivået.

studio-trust-geometry-at-the-cursor = Geometri ved markøren

studio-trust-the-satellite-geometry-always-shown = Satellittgeometrien, alltid vist: etiketten (god, middels eller dårlig) og DOP-verdiene. En maskert himmel (et skrog, en kai, en fjordvegg) er naturlig forringelse, skilt fra angrepslignende inkonsistens. Scoren trekker poeng for geometri bare når den er dårlig, høyst 15, og aldri under det forringede båndet.

studio-trust-the-receiver-s-own-flag = Mottakerens eget flagg

studio-trust-what-the-receiver-itself-says = Hva mottakeren selv sier om spoofing og jamming (u-blox UBX-NAV-STATUS og UBX-SEC-SIG), satt ved siden av Kshanas overvåkere. Kodene er mottakerens; ingen av detektorene er fasit, og samsvar er ikke validering. Flagget endrer ingen score.

studio-trust-over-the-run = Over kjøringen

studio-trust-what-the-score-used = Hva scoren brukte

studio-trust-read-from-the-run-read = Lest fra kjøringen, skrivebeskyttet.

studio-trust-what-this-view-does-and = Hva denne visningen viser og ikke viser

studio-trust-nmea-only-checks-cannot-see = Kontroller som bare bruker NMEA kan ikke se en spoofer som gjengir hele konstellasjonen med en selvkonsistent posisjon, hastighet, kurs, effekt og klokke, og heller ikke en avspilling av innspilte ekte signaler. En posisjonsbestemmelse uten alarm er ikke dermed en god posisjonsbestemmelse.

studio-trust-nothing-on-this-page-is = Ingenting på denne siden er et mål på hvordan kontrollene presterer mot reell interferens. Scoreoversettelsen og hver vekt er fastsatt før en logg scores, uten læring og uten noe tilpasset hendelser.

studio-main-which-satellites-can-you-see = Hvilke satellitter kan du se fra et sted, og hvor god er geometrien deres? Skyplott, horisontlinje og DOP fra motoren i nettleseren din

studio-main-trainer-debrief-for-kshana-nmea = Instruktørdebrief for instruktørlogger fra kshana nmea-scenario (kun trening; filene blir i nettleseren din)

studio-main-where-did-aircraft-and-ships = Hvor rapporterte luftfartøy og skip forringede navigasjonsdata en tidligere dag? Åpne kartfiler per dag (de blir i nettleseren din)

studio-main-can-the-bridge-trust-this = Kan broen stole på denne posisjonsbestemmelsen? Åpne en kjøring for mottakertillit på et fartøy (filene blir i nettleseren din)

studio-main-evidence-packs-test-bench-export = Bevispakker, test-bench-eksport, kartlegging mot compliance, OSNMA, kommandolinjeverktøy og AI-assistenten (filene blir i nettleseren din)

studio-main-map-of-satellites-in-view = Kart over satellitter i sikte over jorden, fra den registrerte kjøringen

studio-main-interactive-3-d-view-of = Interaktiv 3D-visning av det propagerte sporet

studio-main-close-history = Lukk historikken

studio-main-skip-to-the-content = Hopp til innholdet

studio-main-receiver-trust = Mottakertillit

studio-main-advanced-view = Avansert visning

studio-main-what-would-you-like-to = Hva vil du finne ut?

studio-main-pick-a-question-or-start = Velg et spørsmål, eller start fra resultatet nedenfor.

studio-main-showing-below = Vises nedenfor

studio-main-integrity-over-12-hours = Integritet over 12 timer

studio-main-a-radio-waterfall = Et radiovannfall

studio-main-recorded-result = Registrert resultat

studio-main-how-many-navigation-satellites-can = Hvor mange navigasjonssatellitter kan du se fra hvor som helst på jorden?

studio-main-loading-the-recorded-result = Laster det registrerte resultatet…

studio-main-everything-kshana-can-do = Alt Kshana kan gjøre

studio-main-each-area-shows-a-real = Hvert område viser et ekte registrert resultat og blandingen av evidens bak det.

studio-main-open-your-own-files = Åpne dine egne filer

studio-main-pages-that-run-the-engine = Sider som kjører motoren på dine egne innstillinger og filer. Hver av dem fungerer i denne nettleseren; ingenting lastes opp.

studio-main-which-satellites-can-you-see-2 = Hvilke satellitter kan du se fra et sted, og hvor god er geometrien deres? Tegn horisontlinjen.

studio-main-what-accuracy-could-a-reference = Hvilken nøyaktighet kunne en referansestasjon nær månens sydpol gi, og hvor? MODELLED.

studio-main-can-the-bridge-trust-this-2 = Kan broen stole på denne posisjonsbestemmelsen? Score en NMEA-logg fra et fartøy.

studio-main-where-aircraft-and-ships-reported = Hvor luftfartøy og skip rapporterte forringede navigasjonsdata, og en rutes eksponering.

studio-main-generate-a-drift-or-jamming = Generer en øvelsesstrøm med drift eller jamming og gjør debrief av instruktørloggen.

studio-main-two-synthetic-runs-on-one = To syntetiske kjøringer på én klokke: spor, tillitsscore, levende skyplott og vurderingen.

studio-main-the-two-optical-atmosphere-scenarios = De to scenarioene for optisk atmosfære: tilgjengelighet mot skytaket, avbrudd og stedsdiversitet.

studio-main-which-navigation-signals-a-spacecraft = Hvilke navigasjonssignaler et romfartøy langt over satellittene fortsatt kan bruke, og hvor godt et ombordfilter og en formasjon klarer seg med dem.

studio-main-what-lunar-orbiters-and-a = Hva månebanefarkoster og en overflatestasjon kan gjøre som navigasjons- og geodetisk infrastruktur, med bommene oppgitt.

studio-main-open-a-day-s-observatory = Åpne en dags observatoriefiler og les dem: tre tilstander, ingen årsak, ingenting lastet opp.

studio-main-pull-the-antenna-score-the = Trekk ut antennen, score holdover: en tidsfeilregistrering målt mot ITU-T-maskene.

studio-main-check-a-signed-pack-or = Kontroller en signert pakke, eller legg ved et tidsstempel.

studio-main-motion-and-event-files-for = Bevegelses- og hendelsesfiler for en laboratoriesimulator.

studio-main-what-your-runs-evidence-against = Hva kjøringene dine gir belegg for mot publiserte rammeverk.

studio-main-whether-recorded-galileo-data-is = Om innspilte Galileo-data er autentisert, tag for tag.

studio-main-use-kshana-from-your-assistant = Bruk Kshana fra assistenten din gjennom MCP-serveren.

studio-main-all-scenarios = Alle scenarioer

studio-main-pick-one-it-opens-on = Velg ett: det åpnes straks på resultatet sitt.

studio-main-all-questions = Alle spørsmål

studio-main-every-published-figure = Hvert publisert tall

studio-main-read-from-the-result-document = Lest fra resultatdokumentet med enheten, merknaden og opprinnelsen motoren registrerer for hvert av dem.

studio-main-kalman-self-consistency = Kalman-selvkonsistens

studio-main-a-consistent-filter-s-reported = Et konsistent filters rapporterte usikkerhet stemmer med de faktiske feilene. NIS (normalisert innovasjon i kvadrat) bør ligge nær 1 og NEES (normalisert estimeringsfeil i kvadrat) nær 2, hver innenfor sitt 95 %-bånd for χ².

studio-main-engine-chart = Motordiagram

studio-main-each-series-this-run-publishes = Hver serie denne kjøringen publiserer, mot tid. Hold musepekeren over eller dra over diagrammet for å lese verdiene.

studio-main-carrier-to-noise-density-db = bærebølge-til-støy-tetthet, dB-Hz

studio-main-with-the-jammer = Med jammeren

studio-main-without-it = Uten den

studio-main-each-cell-is-one-satellite = Hver celle er én satellitt i én epoke fra denne kjøringen. Skraverte celler ligger under mottakerens sporingsterskel: den satellitten er tapt.

studio-main-interference-outcome = Interferensutfall

studio-main-error-since-gnss-was-lost = feil siden GNSS ble tapt

studio-main-scenario-budget = Scenariobudsjett

studio-main-move-the-budget-and-the = Flytt budsjettet, så leses tiden til brudd av denne kjøringens egen feilregistrering. Motorens holdover-tall, beregnet ved scenarioets budsjett, vises ved siden av og er det autoritative tallet. Endre klokken eller avbruddet i parameterne for å kjøre fysikken på nytt.

studio-main-maximum-time-interval-error = maksimal tidsintervallfeil

studio-main-time-deviation = tidsavvik

studio-main-mask-checks-and-holdover-budgets = Maskekontroller og holdover-budsjetter

studio-main-each-check-s-limit-is = Hver kontrolls grense er tegnet som en ring ved midlingstiden der marginen var dårligst. Maskene er overført fra ITU-T-anbefalingene (International Telecommunication Union Telecommunication Standardization Sector) som er oppgitt i hver rad.

studio-main-lower-is-better-fractional-frequency = Lavere er bedre. Fraksjonell frekvensstabilitet mot midlingstid τ, på logaritmiske akser.

studio-main-earth-centred-inertial-frame = Jordsentrert treghetssystem

studio-main-drag-to-rotate-scroll-to = Dra for å rotere, rull for å zoome.

studio-main-run-the-engine-once-per = Kjør motoren én gang per verdi og plott ett kvalitetsmål. Legg til en andre parameter for et varmekart. Hvert punkt er en ekte motorkjøring, opptil 60.

studio-main-pinned-runs-side-by-side = festede kjøringer side ved side

studio-main-clear-pins = Fjern festene

studio-main-key-figures-run-against-run = Nøkkeltall, kjøring mot kjøring

studio-main-the-headline-readouts-of-each = Hovedavlesningene fra hver festet kjøring; endringen er mot kjøring A.

studio-main-the-engine-s-own-export = motorens egen eksport

studio-main-written-by-the-engine = skrevet av motoren

studio-main-czml-kml-geojson-stk-ephemeris = CZML, KML, GeoJSON, STK-efemeride, SigMF

studio-main-try-other-settings = Prøv andre innstillinger

studio-main-change-a-value-then-run = Endre en verdi, og kjør deretter på nytt. Svaret og diagrammet oppdateres på stedet.

studio-main-run-again = Kjør på nytt

studio-main-cancel-the-run = Avbryt kjøringen

studio-main-runs-in-your-browser-nothing = Kjører i nettleseren din. Ingenting lastes opp.

studio-main-advanced-settings = Avanserte innstillinger

studio-main-every-setting-comes-from-the = Hver innstilling kommer fra scenariofilen. Rediger hele filen under «For forskere».

studio-main-how-this-is-computed = Hvordan dette beregnes

studio-main-level-of-evidence = Evidensnivå

studio-main-the-engine-s-own-one = Motorens egen oppsummering på én linje

studio-main-every-figure-is-labelled-with = Hvert tall er merket med evidensnivået sitt. Kontrollert betyr kontrollert mot en uavhengig ekstern referanse; modellert betyr fysikk fra grunnprinsipper med tester, ennå ikke kontrollert mot en referanse.

studio-main-for-researchers = For forskere

studio-main-code-data-citation = kode, data, sitering

studio-main-run-it-on-your-computer = Kjør den på datamaskinen din

studio-main-run-it-from-python = Kjør den fra Python

studio-main-exported-figures-carry-this-doi = Eksporterte figurer bærer denne DOI-en (digital object identifier) i bildeteksten. Det samme scenarioet, seedet og motorversjonen gir de samme tallene.

studio-main-toml-tom-s-obvious-minimal = TOML (Tom's Obvious, Minimal Language)

studio-main-in-the-editor-tab-indents = I editoren rykker Tab inn med to mellomrom. Trykk Escape og deretter Tab for å gå videre. Kjør på nytt for å bruke redigeringen din.

studio-main-every-panel-and-field = Hvert panel og felt

studio-main-the-advanced-view-is-the = Den avanserte visningen er hele dashbordet: hvert panel fra denne kjøringen side ved side, hvert felt i scenarioet, sveip, sammenligninger og motorens egen rapport. Den åpnes på dette scenarioet, med innstillingene dine.

studio-main-kshana-pro = Kshana Pro

studio-main-kshana-studio = Kshana Studio

studio-main-request-an-evaluation = Be om en evaluering

studio-main-talk-to-us-about-a = Snakk med oss om en kommersiell lisens

studio-main-request-a-study = Be om en studie

studio-main-imagery-nasa-visible-earth-blue = Bilder: NASA Visible Earth (Blue Marble). Kystlinjer: Natural Earth. Hvert diagram her er tegnet fra en motorkjøring; en kjøring, rapport, animasjon eller eksport laget av den opprinnelige kommandolinjemotoren er merket som registrert.

studio-main-this-session = denne økten

studio-main-runs-you-make-appear-here = Kjøringer du gjør, vises her. Velg en for å hente tilbake scenarioet og resultatet, eller fest den for å sammenligne.

studio-advanced-find-a-scenario-a-domain = Finn et scenario, et område, et felt eller en kommando

studio-advanced-the-runs-you-made-in = Kjøringene du har gjort i denne økten

studio-advanced-a-short-tour-of-the = En kort omvisning i Studio

studio-advanced-toggle-colour-theme = Bytt fargetema

studio-advanced-switch-to-the-simple-view = Bytt til den enkle visningen

studio-advanced-the-simple-view-the-answer = Den enkle visningen: svaret først, fem innstillinger, detaljer ved behov

studio-advanced-scenario-library = Scenariobibliotek

studio-advanced-close-the-library = Lukk biblioteket

studio-advanced-find-a-scenario-a-domain-2 = Finn et scenario, et område eller et felt

studio-advanced-scenario-domain-or-field = Scenario, område eller felt

studio-advanced-filter-by-domain = Filtrer etter område

studio-advanced-scenarios-by-mission-domain = Scenarioer etter oppdragsområde

studio-advanced-how-the-studio-works = Slik fungerer Studio

studio-advanced-search-scenarios-domains-or-fields = Søk etter scenarioer, områder eller felt

studio-advanced-search-scenarios-domains-or-fields-2 = Søk etter scenarioer, områder eller felt, for eksempel elevasjonsmaske

studio-advanced-the-engine-kind-this-scenario = Motortypen dette scenarioet kjører

studio-advanced-open-the-scenario-library = Åpne scenariobiblioteket

studio-advanced-show-the-parameters-and-the = Vis parameterne og scenariokilden

studio-advanced-keep-this-run-to-compare = Behold denne kjøringen for å sammenligne med en annen (opptil 4)

studio-advanced-compare-the-pinned-runs = Sammenlign de festede kjøringene

studio-advanced-share-this-run-or-download = Del denne kjøringen, eller last den ned

studio-advanced-result-panels = Resultatpaneler

studio-advanced-run-summary = Kjøringsoppsummering

studio-advanced-parameters-and-scenario-source = Parametere og scenariokilde

studio-advanced-close-the-parameters-and-show = Lukk parameterne og vis resultatene

studio-advanced-find-a-field-of-this = Finn et felt i dette scenarioet

studio-advanced-find-a-field-for-example = Finn et felt, for eksempel maske

studio-advanced-parameter-view = Parametervisning

studio-advanced-find-a-scenario-domain-field = Finn et scenario, område, felt, panel eller kommando

studio-advanced-skip-to-results = Hopp til resultatene

studio-advanced-find-anything = Finn hva som helst

studio-advanced-lunar-station-coverage-of-a = Månestasjon: dekning fra en referansestasjon (MODELLED)

studio-advanced-simple-view = Enkel visning

studio-advanced-choose-a-scenario = Velg et scenario

studio-advanced-what-do-you-want-to = Hva vil du gjøre?

studio-advanced-pick-a-domain-and-a = Velg et område og et scenario, sett det opp, kjør motoren i nettleseren din, og les, sammenlign og eksporter resultatene. Ingenting lastes opp.

studio-advanced-share-or-export = Del eller eksporter

studio-advanced-good-first-runs = Gode første kjøringer

studio-advanced-pin-run = Fest kjøring

studio-advanced-report-json-scenario-tables-and = rapport, JSON, scenario, tabeller og eksporter

studio-advanced-the-exact-scenario-in-the = det nøyaktige scenarioet, i lenken

studio-advanced-an-iframe-for-a-course = en iframe for en kursside eller wiki

studio-advanced-opens-in-a-new-tab = åpnes i en ny fane

studio-advanced-loading-the-engine-the-recorded = Laster motoren. Det registrerte resultatet for dette scenarioet vises først.

studio-advanced-got-it = Greit

studio-advanced-headline-numbers-from-the-engine = Hovedtall fra motorens resultat, med endringen siden forrige kjøring av dette scenarioet, og bestått eller ikke bestått der kjøringen oppgir en terskel.

studio-advanced-set-parameters = Angi parametere

studio-advanced-every-change-re-runs-the = Hver endring kjører motoren på nytt og oppdaterer nøkkeltallene og panelene.

studio-advanced-drag-a-slider-and-the = Dra i en glidebryter, så kjøres scenarioet på nytt. Hver kontroll skriver rett inn i scenarioteksten nedenfor.

studio-advanced-in-the-editor-tab-indents = I editoren rykker Tab inn med to mellomrom. Trykk Escape og deretter Tab for å gå videre.

studio-mission-thread-time-axis = Tidsakse

studio-mission-thread-mission-thread = Oppdragstråd

studio-mission-thread-where-does-a-mission-s = Hvor går et oppdrags feilbudsjett for navigasjon og tidssynkronisering tomt?

studio-mission-thread-a-mission-is-a-chain = Et oppdrag er en kjede av faser: oppskyting, rendezvous, transfer til månen, landing, retur. Hver fase har sine egne sensorer og sitt eget feilbudsjett, og hver gir usikkerheten sin videre til den neste. Denne siden viser budsjettet for hele kjeden, fase for fase, og navngir det svakeste leddet.

studio-mission-thread-open-the-artemis-class-example = Åpne eksempelet i Artemis-klassen

studio-mission-thread-open-a-result-file = Åpne en resultatfil…

studio-mission-thread-the-thread = Tråden

studio-mission-thread-error-against-mission-elapsed-time = Feil mot medgått oppdragstid

studio-mission-thread-the-phases = Fasene

studio-mission-thread-the-budget-of-one-phase = Budsjettet for én fase
