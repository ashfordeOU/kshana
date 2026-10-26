# Brugerfladetekst (dansk): websidens ramme, meddelelser, sprogvælger, Studio-skallen.

## Site chrome
site-skip-link = Gå til indholdet
site-nav-primary = Hovedmenu
site-nav-missions = Missioner
site-nav-capabilities = Funktioner
site-nav-evidence = Evidens
site-nav-research = Forskning
site-nav-developers = Udviklere
site-nav-docs = Dokumentation
site-nav-editions = Udgaver
site-nav-search = Søg
site-nav-launch = Start
site-nav-studio = { -brand } Studio
site-nav-home = { -brand } forside
site-nav-theme = Skift mellem lyst og mørkt tema
site-version = v{ $version }

site-footer-tagline = Open source-simulator til PNT-robusthed (positionering, navigation og tidssynkronisering). Den styrer ingen radiohardware og udsender intet: dens output på signalniveau er IQ-sampelfiler i basisbånd, og dens software-GNSS-modtager er et analyseværktøj. Ikke et produkt til flyvning.
site-footer-product = Produkt
site-footer-company = Virksomhed
site-footer-benchmark = Benchmark
site-footer-install = Installation
site-footer-mcp = MCP-server
site-footer-github = GitHub
site-footer-kshana-pro = { -brand } Pro
site-footer-licence = { -brand } v{ $version } · af Ashforde® OÜ · AGPL-3.0, med mulighed for en kommerciel licens
site-footer-provenance = Hvert diagram er tegnet ud fra en optaget kørsel af motoren v{ $version } og angiver sit scenarie, sit seed og sin fremgangsmåde til at gengive det.

## Language switcher
site-lang-label = Sprog
site-lang-switch-aria = Vælg sproget på denne side
site-lang-auto = Browserens sprog
site-lang-remembered = Dit valg huskes på denne enhed.

## Notices (shown at the top of a page's content)
notice-machine-translation = { -mt-notice }
notice-fallback =
    { $n ->
        [one] { $n } del af denne side er ændret, siden den blev oversat, og vises på engelsk.
       *[other] { $n } dele af denne side er ændret, siden de blev oversat, og vises på engelsk.
    }
notice-not-started = Denne side er endnu ikke oversat. Den vises på engelsk.
notice-detected = Viser { $language }. <a1>Skift til engelsk</a1>
notice-dismiss = Luk
notice-recorded-in-english = Optaget på engelsk
notice-advisory = { -advisory }

## Studio shell
studio-title = { -brand } Studio
studio-home = { -brand } forside
studio-search-label = Find et scenarie, et område, en indstilling eller en kommando
studio-search-placeholder = Søg efter navn, spørgsmål eller indstilling, for eksempel elevationsmaske
studio-search-scenarios = Søg efter scenarier, områder eller indstillinger
studio-search-commands = Søg efter scenarier og kommandoer
studio-search-all = Find et scenarie, et område, en indstilling, en visning eller en kommando
studio-search = Søg
studio-theme = Skift mellem lyst og mørkt tema
studio-starting-questions = Spørgsmål at starte med
studio-where-you-are = Hvor du er
studio-engine-status = Hvor motoren kører
studio-views = Visninger: Geometri, Modtagertillid, Interferenskort, Træningsdebriefing, Værktøjer
studio-more-views = Flere visninger
studio-advanced-full = Det fulde dashboard: alle paneler, felter og faner
studio-advanced-switch = Skift til den avancerede visning
studio-view-geometry = Geometri: skyplot, horisontprofil og DOP
studio-view-training = Træningsdebriefing: åbn en instruktørlog
studio-view-interference = Interferenskort: åbn kortfiler
studio-view-receiver-trust = Modtagertillid: åbn en skibskørsel
studio-view-tools = Værktøjer: evidens, bench, compliance, OSNMA
studio-result = Resultat
studio-result-meaning = Hvad resultatet betyder
studio-key-figures = Nøgletal
studio-result-views = Visninger af dette resultat
studio-figures-of-merit = Kvalitetsmål
studio-find-result-field = Find et resultatfelt
studio-capability-view = Funktionsvisning
studio-time-series = Tidsserie
studio-chart-source = Diagrammets kilde
studio-signal-band = Signal og bånd
studio-signal-field = Signalfelt
studio-clock-holdover = Urets holdover
studio-telecom-masks = Tidsmasker for telekommunikation
studio-clock-stability = Urets stabilitet
studio-orbit-3d = 3D-bane
studio-ground-track = Sporet på jorden
studio-parameter-sweep = Parametersweep
studio-compare-runs = Sammenlign kørsler
studio-animation = Animation
studio-engine-report = Motorrapport
studio-exports = Eksport og rapport
studio-full-result = Fuldt resultatdokument
studio-settings = Indstillinger og detaljer
studio-find-setting = Find en indstilling, for eksempel maske
studio-find-scenario-setting = Find en indstilling i dette scenarie
studio-engine-summary = Motorens egen oversigt
studio-restore-scenario = Gendan det medfølgende scenarie
studio-copy-scenario = Kopiér scenarietekst
studio-scenario-source = Scenariekilde (TOML)
studio-install-engine = Installér motoren
studio-run-history = Kørselshistorik
studio-scenarios-count =
    { $n ->
        [one] Scenarie, den kører ({ $n })
       *[other] Scenarier, den kører ({ $n })
    }
studio-ledger-rows =
    { $n ->
        [one] { $n } registerrække
       *[other] { $n } registerrækker
    }
studio-recorded-in-english = Optaget på engelsk
studio-lang-engine-fallback = Motorens tekst for dette sprog kunne ikke indlæses; engelsk vises.

studio-geometry-kshana-home = { -brand } forside

studio-geometry-back-to-the-studio = Tilbage til Studio

studio-geometry-step-the-time = Trin gennem tiden

studio-geometry-draw-the-skyline = Tegn horisontprofilen

studio-geometry-skip-to-the-view = Gå til visningen

studio-geometry-which-satellites-can-you-see = Hvilke satellitter kan du se, og hvor god er deres geometri?

studio-geometry-what-this-shows = Hvad dette viser

studio-geometry-starting-the-engine = Starter motoren…

studio-geometry-every-setting-is-in-the = Hver indstilling står i sidens adresse, så et kopieret link åbner den samme himmel.

studio-geometry-offset-from-the-constellations-reference = Forskydning fra konstellationernes referenceepoke

studio-geometry-10-min = −10 min

studio-geometry-10-min-2 = +10 min

studio-geometry-your-own-orbital-elements-tle = Dine egne baneelementer (TLE)

studio-geometry-use-these-elements = Brug disse elementer

studio-geometry-back-to-the-presets = Tilbage til forudindstillingerne

studio-geometry-clear-the-skyline = Ryd horisontprofilen

studio-geometry-drag-on-the-skyplot-to = Træk på skyplottet for at tegne horisontprofilen (trin på 1° azimut og 0,5° elevation). Når skyplottet har fokus: venstre og højre flytter rundt langs horisonten (Skift for 10°), op og ned hæver eller sænker horisontprofilen dér (Skift for 5°), Delete rydder den.

studio-geometry-copy-a-link-to-this = Kopiér et link til denne himmel

studio-geometry-download-the-skyplot-svg = Download skyplottet (SVG)

studio-geometry-zenith-in-the-centre-the = Zenit i midten, horisonten ved kanten, nord opad. Udfyldte markeringer er satellitter i løsningen; hule markeringer er skjult af masken eller horisontprofilen, eller bruges ikke.

studio-geometry-dilution-of-precision = Præcisionsforringelse

studio-geometry-how-much-the-geometry-multiplies = Hvor meget geometrien ganger afstandsfejlen op. Lavere er bedre; omkring 1 er fremragende, over 6 er dårligt.

studio-geometry-horizontal-position-error = Horisontal positionsfejl

studio-geometry-satellites-as-a-table = Satellitter, som tabel

studio-geometry-the-same-satellites-as-the = De samme satellitter som i skyplottet.

studio-geometry-azimuth = Azimut, °

studio-geometry-elevation = Elevation, °

studio-geometry-in-the-solution = I løsningen

studio-geometry-the-engine-runs-here-as = Motoren kører her som WebAssembly. Intet hentes fra et andet websted, og intet, du indstiller, sendes nogen steder hen.

studio-holdover-holdover-test-scenarios = Scenarier til holdover-test

studio-holdover-holdover-test = Holdover-test

studio-holdover-how-far-does-the-time = Hvor langt når tidsfejlen, når GNSS er væk?

studio-holdover-opening-the-scenarios = Åbner scenarierne…

studio-holdover-verdict-step-by-step = Vurderingen, trin for trin

studio-holdover-time-error-over-the-record = Tidsfejl over optagelsen

studio-holdover-the-three-phases-are-shaded = De tre faser er skraveret; de stiplede lodrette linjer er de to tidspunkter, operatøren angav. De stiplede vandrette linjer er maskernes grænser for den maksimale absolutte tidsfejl, hver tegnet over det trin, dens maske nævner, samt genopretningsbåndet; en trekant markerer, hvornår et budget eller ePRTC-A-holdover-kuverten først overskrides.

studio-holdover-of-the-baseline-and-the = Af baseline og holdover; et kryds er en maskegrænse på det tidspunkt, hvor dens kontrol var værst.

studio-holdover-the-same-two-steps-against = De samme to trin mod TDEV-grænserne.

studio-holdover-the-numbers = Tallene

studio-holdover-everything-below-is-the-engine = Alt herunder stammer fra motoren, i de enheder, den angiver.

studio-holdover-mask-checks = Maskekontroller

studio-holdover-each-mask-is-measured-on = Hver maske måles på det trin, dens betingelse nævner. En maske, der kræver en længere optagelse, end trinnet gav, er INCOMPLETE og ekstrapoleres aldrig; hver post, en anbefaling overlader til videre undersøgelse, mangler.

studio-holdover-what-this-does-not-cover = Hvad dette ikke dækker

studio-interference-cell-size-in-degrees-empty = Cellestørrelse i grader (tom for 0,5)

studio-interference-https = https://…

studio-interference-about-this-page = Om denne side

studio-interference-interference-map = Interferenskort

studio-interference-where-did-position-reports-look = Hvor så positionsrapporterne forringede ud?

studio-interference-open-map-files = Åbn kortfiler

studio-interference-or-drop-them-here = eller slip dem her

studio-interference-open-the-synthetic-demo = Åbn den syntetiske demo

studio-interference-close-all-maps = Luk alle kort

studio-interference-nothing-open-yet = Intet er åbent endnu.

studio-interference-build-a-map-here = Byg et kort her

studio-interference-build-from-the-synthetic-sample = Byg ud fra den syntetiske prøve

studio-interference-route-exposure-here = Rute-eksponering her

studio-interference-use-the-synthetic-route = Brug den syntetiske rute

studio-interference-reading-these-maps = Sådan læses disse kort

studio-interference-maps-inherit-the-coverage-of = Kortene arver deres kildes dækning: frivillige ADS-B-modtagere lader åbent hav være tyndt dækket, og åbne AIS-data udelader nogle skibsklasser. Læs dækningsnoterne i hver fil.

studio-interference-no-coastline-or-basemap-is = Der tegnes ingen kystlinje eller basiskort, og intet hentes fra nogen server; gitteret består kun af breddegrad og længdegrad.

studio-interference-no-identifier-of-any-aircraft = Ingen identifikator for noget fly eller skib findes i disse filer; celler med for få forskellige fly eller skibe offentliggøres slet ikke, og et AIS-antal på ét eller to tilbageholdes.

studio-lunar-infra-lunar-infrastructure-scenarios = Scenarier for månens infrastruktur

studio-lunar-infra-lunar-infrastructure = Månens infrastruktur

studio-lunar-infra-what-can-the-moon-s = Hvad kan månens kredsløb og overflade gøre som infrastruktur til navigation og geodæsi, og hvor kommer den til kort?

studio-lunar-infra-five-studies-of-what-lunar = Fem undersøgelser af, hvad månekredsløb og en månestation på overfladen kan gøre sammen som infrastruktur til navigation og geodæsi: banebestemmelse ud fra GNSS-signaler fra jorden mod sporing fra jorden, bærebølgefasefiksering mellem en overfladestation og en satellit i kredsløb, samtidig estimering af månens referencesystem, sammenkobling af GNSS, VLBI og laserafstandsmåling på ét rumfartøj, og hvor følsomme laserafstandsmåling og sporing er over for månens tidevand og libration. Inputtene er illustrative, og modellen er begrænset; hvor en undersøgelse ikke nåede den tærskel, den blev præregistreret mod, siger denne side det. Hvert tal er kopieret fra et resultat, motoren har optaget; siden skalerer det og tegner det og beregner ikke andet.

studio-lunar-infra-what-the-result-holds = Hvad resultatet indeholder

studio-lunar-infra-findings-disclosures-and-what-was = Fund, oplysninger og hvad der ikke blev verificeret

studio-lunar-what-these-figures-are = Hvad disse tal er

studio-lunar-map-key = Kortforklaring

studio-lunar-lunar-station = Månestation

studio-lunar-what-accuracy-could-a-reference = Hvilken nøjagtighed kunne en referencestation nær månens sydpol give, og hvor?

studio-lunar-the-constellation-its-signal-in = Konstellationen, dens signal-i-rummet-fejl, stationens opmålingsfejl, korrektionsforsinkelsen og linkkvantiseringen er input angivet i scenariefilen, hver med sin kilde eller markeret som illustrativ. Intet tal her er kontrolleret mod en rigtig station eller flydata.

studio-lunar-the-source-and-every-input = Kilden og hvert input, du ændrer, står i sidens adresse, så et kopieret link åbner den samme undersøgelse.

studio-lunar-a-result-file-is-the = En resultatfil er den JSON, motoren skriver for denne type (kommandolinjens JSON-output eller en kørsel gemt herfra). Den læses på denne side; intet sendes.

studio-lunar-each-field-shows-the-scenario = Hvert felt viser scenariefilens værdi, indtil du ændrer det. Et døgn af epoker over hele gitteret tager et stykke tid: færre forsøg eller et længere tidstrin kører hurtigere.

studio-lunar-run-it-here = Kør det her

studio-lunar-back-to-the-file-s = Tilbage til filens værdier

studio-lunar-copy-a-link = Kopiér et link

studio-lunar-save-this-result-json = Gem dette resultat (JSON)

studio-lunar-corrected-error-over-the-south = Korrigeret fejl over sydpolsområdet

studio-lunar-south-polar-stereographic-the-pole = Sydpolær stereografisk: polen i midten, gitterets kant ved kanten, 0° længdegrad opad, 90° øst mod højre. Hver celle er ét gitterpunkt; den kraftige linje er, hvor den korrigerede fejl krydser tærsklen, og den stiplede linje er dækningsradius pr. azimut.

studio-lunar-region-figures = Områdets tal

studio-lunar-over-the-whole-grid-means = Over hele gitteret: gennemsnit vægtet efter areal og det værste punkt.

studio-lunar-coverage-radius-per-azimuth = Dækningsradius pr. azimut

studio-lunar-along-each-bearing-from-the = Langs hver retning fra stationen, den afstand hvor dækningen første gang falder under 95 %.

studio-lunar-as-a-table = Som tabel

studio-lunar-radius-km = Radius, km

studio-lunar-at-the-grid-edge = Ved gitterets kant

studio-lunar-points-along-it = Punkter langs den

studio-lunar-an-epoch-is-unavailable-at = En epoke er utilgængelig i et punkt, når brugeren ser færre end fire satellitter, eller stationen ikke ser alle de satellitter, brugeren bruger; der beregnes ingen fejl for den.

studio-lunar-grid-points-as-a-table = Gitterpunkter, som tabel

studio-lunar-the-same-points-as-the = De samme punkter som på kortet, nærmest stationen først.

studio-lunar-latitude = Breddegrad, °

studio-lunar-longitude = Længdegrad, °

studio-lunar-from-the-station-km = Fra stationen, km

studio-lunar-corrected-error = Korrigeret fejl

studio-lunar-uncorrected-error = Ukorrigeret fejl

studio-lunar-hpl-median = HPL-median

studio-lunar-the-engine-s-statement-inputs = Motorens redegørelse, input og linkbudget

studio-lunar-inputs-as-the-engine-read = Input, som motoren læste dem

studio-lunar-error-model = Fejlmodel

studio-lunar-correction-link-budget-at-the = Linkbudget for korrektionslinket ved stationen og ved det værste punkt

studio-observatory-previous-day = Forrige dag

studio-observatory-day-opened = Åbnet dag

studio-observatory-next-day = Næste dag

studio-observatory-interference-observatory = Interferensobservatorium

studio-observatory-what-did-one-day-s = Hvordan så én dags positionsrapporter ud?

studio-observatory-the-observatory-writes-a-few = Observatoriet skriver nogle få filer for hver UTC-dag og region: gitterceller med en af tre tilstande, en hændelsesliste og en manifest. Åbn de filer, du har produceret, her og læs dem. Siden beregner intet og viser kun, hvad filerne siger. Den leveres uden observatoriedata, henter intet og uploader intet.

studio-observatory-open-a-day = Åbn en dag

studio-observatory-larr = ←

studio-observatory-rarr = →

studio-observatory-the-three-states = De tre tilstande

studio-observatory-the-picture-the-observatory-wrote = Billedet, observatoriet skrev

studio-observatory-the-png-you-opened-as = PNG-filen, du åbnede, som den er. Celler, der ikke er tegnet, blev ikke observeret.

studio-observatory-cells-drawn-from-the-file = Celler, tegnet ud fra filen

studio-observatory-plate-carr-eacute-e-no = Plate carrée, intet basiskort. Hold musen over en celle, eller brug tabellen, for dens tilstand og antal. Et sted uden celle blev ikke observeret.

studio-observatory-hover-or-focus-a-cell = Hold musen over eller fokuser en celle for dens tilstand.

studio-observatory-every-cell-in-the-file = Hver celle i filen

studio-observatory-a-count-the-file-withholds = Et antal, som filen tilbageholder (færre end 5 fly), læses »tilbageholdt«, aldrig 0.

studio-observatory-files-and-their-hashes = Filer og deres hashværdier

studio-observatory-dataset-licence-and-notice = Datasæt, licens og meddelelse

studio-observatory-what-this-page-does-and = Hvad denne side viser og ikke viser

studio-observatory-products-are-released-at-least = Produkter udgives mindst 24 timer efter udgangen af UTC-dagen, på celler på 0,5 grader eller grovere. Dette er aldrig en live-visning, og det siger aldrig »nu«.

studio-observatory-it-shows-no-cause-no = Den viser ingen årsag, intet land, ingen styrke og ingen kilde til interferens, ingen alarm, ingen sammenligning mellem steder eller dage og ingen AIS. ADS-B og AIS kombineres aldrig.

studio-observatory-the-page-ships-none-of = Siden leveres uden nogen af observatoriets produkter. At offentliggøre dem er ejerens beslutning.

studio-optical-optical-atmosphere-scenarios = Scenarier for optisk atmosfære

studio-optical-optical-pnt = Optisk PNT

studio-optical-can-an-optical-link-get = Kan et optisk link komme igennem vejret?

studio-optical-the-link = Linket

studio-optical-sites-as-the-engine-states = Steder, som motoren angiver dem

studio-optical-inputs-are-marked-everything-else = Input er markeret; alt andet er motorens output for dem.

studio-optical-it-draws-only-what-the = Den tegner kun, hvad motoren optog for hvert scenarie, herunder dens tidsserie med fast seed. Siden beregner intet: den skalerer motorens tal til diagrammet.

studio-optical-the-sites-their-cloud-climates = Stederne, deres skyklima, urklasserne og teknikkerne er input valgt til at illustrere og er mærket sådan. Ingen målt tilgængelighedsoptegnelse er blevet sammenlignet.

studio-replay-replay-controls = Afspilningskontroller

studio-replay-previous-moment-page-up = Forrige øjeblik (Page Up)

studio-replay-step-back = Et trin tilbage

studio-replay-step-back-left-arrow = Et trin tilbage (venstrepil)

studio-replay-play-or-pause-space = Afspil eller pause (mellemrum)

studio-replay-step-forward = Et trin frem

studio-replay-step-forward-right-arrow = Et trin frem (højrepil)

studio-replay-next-moment-page-down = Næste øjeblik (Page Down)

studio-replay-replay-speed-mission-seconds-per = Afspilningshastighed, missionssekunder pr. sekund

studio-replay-mission-clock-seconds-from-the = Missionsur, sekunder fra starten af hver kørsel

studio-replay-bridge-replay = Afspilning af broen

studio-replay-two-runs-one-clock-when = To kørsler, ét ur: hvornår vidste broen det?

studio-replay-put-two-synthetic-runs-side = Stil to syntetiske kørsler side om side og afspil dem på ét missionsur. Hvert panel viser, hvor skibet virkelig var, mod hvor modtageren sagde, det var, motorens tillidsscore og bånd over tid, de satellitter, loggen selv opregner (himlen bliver tom, hvor loggen ikke hører nogen), og en vurdering, når kørslen slutter. Alt, der tegnes, kommer fra en log eller fra motorens resultat for den; intet læses fra netværket.

studio-replay-save-animated-svg = Gem animeret SVG

studio-replay-save-frames-zip = Gem billeder (ZIP)

studio-replay-opening-the-two-demo-runs = Åbner de to demokørsler…

studio-replay-the-skyplot-is-the-log = Skyplottet er logens egen GSV: en udfyldt markør er en satellit med en signalstyrke, en hul er opregnet uden nogen, og en skraveret sektor er et azimutområde, hvor loggen opregner satellitter og ikke hører nogen af dem. En blokeret himmel og et forstyrret signal ser ens ud her. Det er ikke en horisontprofil, og konstellationen er nominel, ikke en efemeride for logens dato.

studio-replay-position-error-is-the-logged = "Positionsfejl" er den loggede afstand mellem den sande og den rapporterede position; ringen omkring skibet er denne afstand tegnet i målestok. Tiden fra en hændelses begyndelse til den første score under nominel er en subtraktion af to loggede tidspunkter, ikke et mål for detektionsydelse.

studio-replay-the-vessel-glyph-points-along = Skibssymbolet peger langs gyrokursen (HDT), som ingen hændelse berører; den stiplede kontur er, hvor modtageren placerer skibet, langs den kurs, den rapporterer. Et mellemrum mellem de to er et signal til debriefingen.

studio-replay-the-coast-is-natural-earth = Kysten er Natural Earths landdata i public domain i 1:10 millioner, medfølgende denne side (intet hentes). Demoernes positioner er opdigtede, så kysten viser, hvor de opdigtede koordinater falder. Kun illustration, aldrig til navigation.

studio-ssv-space-user-gnss-scenarios = Scenarier for GNSS til rumbrugere

studio-ssv-space-user-gnss = GNSS til rumbrugere

studio-ssv-which-navigation-signals-can-a = Hvilke navigationssignaler kan et rumfartøj langt over GNSS-satellitterne stadig bruge?

studio-ssv-the-satellites-of-a-navigation = Et navigationssystems satellitter peger mod jorden, så et rumfartøj over dem hører kun det, der spilder forbi randen eller lækker gennem sidelobes. Denne side viser, hvad motoren finder i fem tilfælde: tilgængelighed på et skal i geostationær højde, et stærkt elliptisk kredsløb, en måneoverføring med en modtager til svage signaler, et filter om bord og en formation af to rumfartøjer. Hvert tal er kopieret fra et resultat, motoren har optaget; siden skalerer det og tegner det og beregner ikke andet.

studio-ssv-against-the-icg-booklet = Mod ICG-hæftet

studio-tools-leave-empty-to-check-integrity = lad stå tomt for kun at kontrollere integriteten

studio-tools-synthetic-osnma-example = Syntetisk OSNMA-eksempel

studio-tools-trust-and-evidence-tools = Værktøjer til tillid og evidens

studio-tools-trust-evidence-and-test-tools = Værktøjer til tillid, evidens og test

studio-tools-the-0-35-features-that = De funktioner i 0.35, der kører i din browser, og hvor du finder dem, der ikke kan. Filer, du åbner her, læses på denne side og uploades aldrig; motoren kører på din computer som WebAssembly.

studio-tools-maritime-trust = Maritim tillid

studio-tools-training-debrief = Træningsdebriefing

studio-tools-the-engine-starts-when-you = Motoren starter, når du bruger et værktøj.

studio-tools-every-0-35-feature-and = Hver funktion i 0.35, og hvor den findes

studio-tools-in-this-browser-where-it = I denne browser, hvor den kan køre. Resten er kommandolinje- eller serverfunktioner, og årsagen angives.

studio-tools-in-the-studio = I Studio

studio-tools-verify-an-evidence-pack = Verificér en bevispakke

studio-tools-open-the-synthetic-example-pack = Åbn den syntetiske eksempelpakke

studio-tools-open-it-with-one-byte = Åbn den med én byte ændret

studio-tools-no-pack-files-chosen = Ingen pakkefiler valgt.

studio-tools-verify-the-pack = Verificér pakken

studio-tools-attach-a-timestamp-token = Vedhæft et tidsstempel-token

studio-tools-attach-to-the-chosen-pack = Vedhæft til den valgte pakke

studio-tools-export-a-scenario-for-a = Eksportér et scenarie til en laboratoriesimulator

studio-tools-which-public-framework-rows-do = Hvilke rækker i offentlige rammer leverer dine kørsler belæg for?

studio-tools-use-the-synthetic-example-runs = Brug de syntetiske eksempelkørsler

studio-tools-show-the-mapping-tables = Vis mappingtabellerne

studio-tools-show-the-sources-they-cite = Vis de kilder, de henviser til

studio-tools-no-result-files-chosen = Ingen resultatfiler valgt.

studio-tools-build-the-report = Byg rapporten

studio-tools-galileo-osnma-is-the-navigation = Galileo OSNMA: er navigationsdata autentificeret?

studio-tools-load-it = Indlæs den

studio-tools-show-the-recorded-result = Vis det optagne resultat

studio-tools-imu-fit-sensor-parameters-for = IMU-tilpasning: sensorparametre til hybrid- og fusionsscenarierne

studio-tools-fit-the-parameters = Tilpas parametrene

studio-tools-jammertest-score-a-receiver-log = Jammertest: giv en modtagerlog point mod den offentliggjorte testplan

studio-tools-import-the-schedule = Importér planen

studio-tools-score-the-log = Giv loggen point

studio-training-synthetic-library-scenarios = Syntetiske biblioteksscenarier

studio-training-library-scenario-to-generate = Biblioteksscenarie, der skal genereres

studio-training-random-seed-optional = Tilfældigt seed (valgfrit)

studio-training-from-the-scenario = fra scenariet

studio-training-time-cursor = Tidsmarkør

studio-training-replay-speed = Afspilningshastighed

studio-training-time-cursor-in-log-rows = Tidsmarkør, i logrækker

studio-training-debrief-timeline-time-cursor = Debriefingens tidslinje: tidsmarkør

studio-training-what-did-the-crew-see = Hvad så besætningen, og hvad skete der i virkeligheden?

studio-training-open-a-log = Åbn en log

studio-training-choose-an-instructor-log-or = Vælg en instruktørlog, eller åbn et af de fem syntetiske biblioteksscenarier skrevet af CLI.

studio-training-or-drop-it-here-or = eller slip den her, eller åbn et biblioteksscenarie:

studio-training-generate-a-stream-here = Generér en strøm her

studio-training-run-the-engine-s-nmea = Kør motorens NMEA-træningsgenerator i denne browser. Du får den syntetiske NMEA 0183-strøm til øvelsen og instruktørloggen og kan debriefe den med det samme. Intet uploades; streaming til en brosimulator over TCP eller UDP er en kommandolinjefunktion (se siden Værktøjer).

studio-training-previous-moment = Forrige øjeblik

studio-training-next-moment = Næste øjeblik

studio-training-true-track-against-reported = Sandt spor mod rapporteret

studio-training-north-up-one-scale-on = Nord opad, én skala på begge akser. Den tynde grå linje er, hvor skibet virkelig var. Den farvede linje er, hvad modtageren rapporterede, farvet efter hvor langt den lå fra sandheden. Hvor modtageren ikke rapporterede nogen positionsbestemmelse, tegnes intet for den.

studio-training-events-and-what-the-receiver = Hændelser og hvad modtageren sagde

studio-training-one-shared-time-axis-drag = Én fælles tidsakse. Træk eller klik for at flytte markøren; piletasterne træder den. Hændelsessøjler viser styrken af hver injiceret hændelse over tid.

studio-training-sky-at-the-cursor = Himlen ved markøren

studio-training-the-satellites-the-stream-s = De satellitter, strømmens egen GSV opregner. En udfyldt markør har en signalstyrke; en hul er opregnet uden nogen; en skraveret sektor er, hvor strømmen opregner satellitter, og ingen høres. Nominel konstellation, ikke en efemeride for strømmens dato.

studio-training-at-the-cursor = Ved markøren

studio-training-events-injected = Injicerede hændelser

studio-training-as-the-instructor-log-states = Som instruktørloggen angiver dem, med alle parametre.

studio-training-debrief-timeline = Debriefingens tidslinje

studio-training-choose-a-moment-to-move = Vælg et øjeblik for at flytte markøren dertil.

studio-training-the-satellite-sky-is-a = Satellithimlen er en nominel konstellation, ikke en efemeride for strømmens dato.

studio-training-nothing-here-is-a-measure = Intet her er et mål for, hvordan nogen modtager eller noget system klarer sig mod interferens.

studio-trust-session-settings-in-toml = Sessionsindstillinger i TOML

studio-trust-receiver-trust-session-settings-in = Sessionsindstillinger for modtagertillid i TOML

studio-trust-time-cursor-and-filters = Tidsmarkør og filtre

studio-trust-time-cursor-in-epochs = Tidsmarkør, i epoker

studio-trust-score-timeline-time-cursor = Scorens tidslinje: tidsmarkør

studio-trust-each-monitor-s-alarm-ratio = Hver overvågers alarmforhold over tid

studio-trust-about-this-view = Om denne visning

studio-trust-can-the-bridge-trust-this = Kan broen stole på denne positionsbestemmelse?

studio-trust-open-a-run = Åbn en kørsel

studio-trust-open-the-masked-sky-demo = Åbn demoen med maskeret himmel (geometri, 0.36)

studio-trust-score-an-nmea-log-here = Giv en NMEA-log point her

studio-trust-run-the-engine-in-this = Kør motoren i denne browser på et skibs NMEA 0183-log og se resultatet i visningen nedenfor. Loggen læses på denne side og uploades aldrig. Den skal være et udsnit på højst 2 MiB (omkring 20.000 epoker) og skal indeholde kalibreringsvinduet på fem minutter. Indstillingerne er skibets grænser og scorens vægte, som i en sessionsfil.

studio-trust-score-the-synthetic-demo-log = Giv den syntetiske demolog point

studio-trust-session-settings-toml = Sessionsindstillinger (TOML)

studio-trust-starts-from-the-demo-s = Tager udgangspunkt i demoens indstillinger: redigér skibets grænser for fart, acceleration og drejningshastighed, så de passer til dine. En indstillingsfil til dit eget skib kan indsættes her.

studio-trust-jammertest-scorecard = Jammertest-resultatkort

studio-trust-no-scorecard-open = Intet resultatkort åbent.

studio-trust-generic-receiver-trust-run-not = Generisk kørsel af modtagertillid (ikke et skib)

studio-trust-run-the-illustrative-jamming-example = Kør det illustrative jamming-eksempel

studio-trust-assess-the-chosen-file = Vurdér den valgte fil

studio-trust-the-format-is-guessed-from = Formatet gættes ud fra filnavnet; ændr det her, når det er forkert, og vurdér derefter igen. NovAtel OEM7, RTCM 3 og Septentrio SBF er binære formater; de sendes til motoren, som de er, i denne browser.

# trust
studio-trust-imu-file-optional-a-second = IMU-fil (valgfri): en ekstra sensor til kursen

# trust
studio-trust-an-imu-log-on-the = En IMU-log på modtagerlogens ur udfylder den kurs, som overvågningen af kurs mod sejlretning læser, hvor modtagerloggen ikke har nogen. Kun en skibssession bruger den.

# trust
studio-trust-remove-the-imu-file = Fjern IMU-filen

# trust
studio-trust-no-imu-file = Ingen IMU-fil.

# trust
studio-trust-session-settings-toml-the-log = Sessionsindstillinger (TOML, loggen leveres inline)

# trust
studio-trust-first-deduction = Første fradrag

# trust
studio-trust-first-untrusted = Første upålidelige

# trust
studio-trust-receiver-reported-track = Spor rapporteret af modtageren

# trust
studio-trust-the-satellites-the-log-s = De satellitter, som logens egen GSV opregner. En udfyldt markør har en signalstyrke; en hul er opregnet uden nogen; en skraveret sektor er der, hvor loggen opregner satellitter og ikke hører nogen af dem (en blokeret himmel og et forstyrret signal ser ens ud her). Nominel konstellation, ikke en efemeride for logens dato.

# trust
studio-trust-score-over-time = Score over tid

# trust
studio-trust-score-0-to-100-dashed = Score 0 til 100. De stiplede linjer er båndgrænserne; strimlerne nedenunder er båndet og porten. Træk eller klik for at flytte tidsmarkøren; piletasterne flytter den trinvis.

# trust
studio-trust-reasons-at-the-cursor = Årsager ved markøren

# trust
studio-trust-points-each-check-took-off = De point, hver kontrol trak fra i denne epoke, de største først. Klik på en kontrol for at markere, hvor den lå over sin indsættelsestærskel.

# trust
studio-trust-geometry-at-the-cursor = Geometri ved markøren

# trust
studio-trust-the-satellite-geometry-always-shown = Satellitgeometrien, altid vist: dens betegnelse (god, middel eller dårlig) og DOP-værdierne. En maskeret himmel (et skrog, en kaj, en fjordvæg) er naturlig forringelse, adskilt fra angrebslignende inkonsistens. Scoren trækker kun point for geometri, når den er dårlig, højst 15, og aldrig under det forringede bånd.

# trust
studio-trust-the-receiver-s-own-flag = Modtagerens eget flag

# trust
studio-trust-what-the-receiver-itself-says = Hvad modtageren selv siger om spoofing og jamming (u-blox UBX-NAV-STATUS og UBX-SEC-SIG), sat ved siden af Kshanas monitorer. Koderne er modtagerens; ingen af detektorerne er sandhed, og enighed er ikke validering. Flaget ændrer ingen score.

# trust
studio-trust-over-the-run = Over kørslen

# trust
studio-trust-what-the-score-used = Hvad scoren brugte

# trust
studio-trust-read-from-the-run-read = Læst fra kørslen, skrivebeskyttet.

# trust
studio-trust-what-this-view-does-and = Hvad denne visning viser og ikke viser

# trust
studio-trust-nmea-only-checks-cannot-see = Kontroller baseret kun på NMEA kan ikke se en spoofer, der gengiver hele konstellationen med en selvkonsistent position, hastighed, kurs, effekt og ur, og heller ikke en afspilning af optagede ægte signaler. En positionsbestemmelse uden alarm er ikke dermed en god positionsbestemmelse.

# trust
studio-trust-nothing-on-this-page-is = Intet på denne side er et mål for, hvordan kontrollerne klarer sig på ægte interferens. Scoreafbildningen og hver vægt er fastlagt, før en log scores, uden indlæring og uden noget tilpasset til hændelser.

# main
studio-main-which-satellites-can-you-see = Hvilke satellitter kan du se fra et sted, og hvor god er deres geometri? Skyplot, horisontprofil og DOP fra motoren i din browser

# main
studio-main-trainer-debrief-for-kshana-nmea = Træningsdebriefing til instruktørlogs fra kshana nmea-scenario (kun til træning; filerne bliver i din browser)

# main
studio-main-where-did-aircraft-and-ships = Hvor rapporterede fly og skibe forringede navigationsdata på en tidligere dag? Åbn kortfiler for hver dag (de bliver i din browser)

# main
studio-main-can-the-bridge-trust-this = Kan broen stole på denne positionsbestemmelse? Åbn en modtagertillidskørsel for et skib (filerne bliver i din browser)

# main
studio-main-evidence-packs-test-bench-export = Bevispakker, test-bench-eksport, compliance-mapping, OSNMA, kommandolinjeværktøjer og AI-assistenten (filerne bliver i din browser)

# main
studio-main-map-of-satellites-in-view = Kort over satellitter i sigte over Jorden, fra den optagede kørsel

# main
studio-main-interactive-3-d-view-of = Interaktiv 3D-visning af det propagerede spor

# main
studio-main-close-history = Luk historik

# main
studio-main-skip-to-the-content = Gå til indholdet

# main
studio-main-receiver-trust = Modtagertillid

# main
studio-main-advanced-view = Avanceret visning

# main
studio-main-what-would-you-like-to = Hvad vil du gerne finde ud af?

# main
studio-main-pick-a-question-or-start = Vælg et spørgsmål, eller start fra resultatet nedenfor.

# main
studio-main-showing-below = Vises nedenfor

# main
studio-main-integrity-over-12-hours = Integritet over 12 timer

# main
studio-main-a-radio-waterfall = Et radiovandfald

# main
studio-main-recorded-result = Optaget resultat

# main
studio-main-how-many-navigation-satellites-can = Hvor mange navigationssatellitter kan du se fra et vilkårligt sted på Jorden?

# main
studio-main-loading-the-recorded-result = Indlæser det optagede resultat…

# main
studio-main-everything-kshana-can-do = Alt, hvad Kshana kan

# main
studio-main-each-area-shows-a-real = Hvert område viser et ægte optaget resultat og den blanding af evidens, der ligger bag.

# main
studio-main-open-your-own-files = Åbn dine egne filer

# main
studio-main-pages-that-run-the-engine = Sider, der kører motoren på dine egne indstillinger og filer. Hver af dem virker i denne browser; intet uploades.

# main
studio-main-which-satellites-can-you-see-2 = Hvilke satellitter kan du se fra et sted, og hvor god er deres geometri? Tegn horisontprofilen.

# main
studio-main-what-accuracy-could-a-reference = Hvilken nøjagtighed kunne en referencestation nær den lunare sydpol give, og hvor? MODELLED.

# main
studio-main-can-the-bridge-trust-this-2 = Kan broen stole på denne positionsbestemmelse? Score et skibs NMEA-log.

# main
studio-main-where-aircraft-and-ships-reported = Hvor fly og skibe rapporterede forringede navigationsdata, og en rutes eksponering.

# main
studio-main-generate-a-drift-or-jamming = Generér en øvelsesstrøm med drift eller jamming, og debrief instruktørloggen.

# main
studio-main-two-synthetic-runs-on-one = To syntetiske kørsler på ét ur: spor, tillidsscore, live skyplot og dommen.

# main
studio-main-the-two-optical-atmosphere-scenarios = De to scenarier for den optiske atmosfære: tilgængelighed mod skylaget, udfald og stedsdiversitet.

# main
studio-main-which-navigation-signals-a-spacecraft = Hvilke navigationssignaler et rumfartøj langt over satellitterne stadig kan bruge, og hvor godt et filter om bord og en formation klarer sig med dem.

# main
studio-main-what-lunar-orbiters-and-a = Hvad lunare orbitere og en overfladestation kan gøre som navigations- og geodætisk infrastruktur, med de ikke opnåede mål anført.

# main
studio-main-open-a-day-s-observatory = Åbn en dags observatoriefiler og læs dem: tre tilstande, ingen årsag, intet uploadet.

# main
studio-main-pull-the-antenna-score-the = Træk antennen ud, score holdover: en tidsfejlsoptegnelse målt mod ITU-T-maskerne.

# main
studio-main-check-a-signed-pack-or = Kontrollér en signeret pakke, eller vedhæft et tidsstempel.

# main
studio-main-motion-and-event-files-for = Bevægelses- og hændelsesfiler til en laboratoriesimulator.

# main
studio-main-what-your-runs-evidence-against = Hvad dine kørsler leverer evidens for i forhold til offentliggjorte rammeværker.

# main
studio-main-whether-recorded-galileo-data-is = Om optagne Galileo-data er autentificeret, tag for tag.

# main
studio-main-use-kshana-from-your-assistant = Brug Kshana fra din assistent via MCP-serveren.

# main
studio-main-all-scenarios = Alle scenarier

# main
studio-main-pick-one-it-opens-on = Vælg et: det åbner straks på sit resultat.

# main
studio-main-all-questions = Alle spørgsmål

# main
studio-main-every-published-figure = Hvert offentliggjort tal

# main
studio-main-read-from-the-result-document = Læst fra resultatdokumentet med den enhed, note og proveniens, som motoren registrerer for hvert enkelt.

# main
studio-main-kalman-self-consistency = Kalman-selvkonsistens

# main
studio-main-a-consistent-filter-s-reported = Et konsistent filters rapporterede usikkerhed svarer til dets faktiske fejl. NIS (normaliseret innovation i anden) bør ligge nær 1 og NEES (normaliseret estimeringsfejl i anden) nær 2, hver inden for sit 95 %-χ²-bånd.

# main
studio-main-engine-chart = Motordiagram

# main
studio-main-each-series-this-run-publishes = Hver serie, denne kørsel udgiver, mod tid. Hold musen over eller træk hen over diagrammet for at læse værdierne.

# main
studio-main-carrier-to-noise-density-db = bærebølge-til-støj-tæthed, dB-Hz

# main
studio-main-with-the-jammer = Med jammeren

# main
studio-main-without-it = Uden den

# main
studio-main-each-cell-is-one-satellite = Hver celle er én satellit ved én epoke fra denne kørsel. Skraverede celler ligger under modtagerens sporingstærskel: den satellit er tabt.

# main
studio-main-interference-outcome = Interferensresultat

# main
studio-main-error-since-gnss-was-lost = fejl siden GNSS blev tabt

# main
studio-main-scenario-budget = Scenariebudget

# main
studio-main-move-the-budget-and-the = Flyt budgettet, og tiden til overskridelse aflæses i denne kørsels egen fejloptegnelse. Motorens holdover-tal, beregnet ved scenariets budget, vises ved siden af og er det autoritative tal. Ændr uret eller udfaldet i parametrene for at køre fysikken igen.

# main
studio-main-maximum-time-interval-error = maksimal tidsintervalfejl

# main
studio-main-time-deviation = tidsafvigelse

# main
studio-main-mask-checks-and-holdover-budgets = Maskekontroller og holdover-budgetter

# main
studio-main-each-check-s-limit-is = Hver kontrols grænse er tegnet som en ring ved den middeltid, hvor marginen var dårligst. Maskerne er afskrevet fra de ITU-T-anbefalinger (International Telecommunication Union Telecommunication Standardization Sector), der er nævnt i hver række.

# main
studio-main-lower-is-better-fractional-frequency = Lavere er bedre. Relativ frekvensstabilitet mod middeltid τ, på logaritmiske akser.

# main
studio-main-earth-centred-inertial-frame = Jordcentreret inertialsystem

# main
studio-main-drag-to-rotate-scroll-to = Træk for at rotere, rul for at zoome.

# main
studio-main-run-the-engine-once-per = Kør motoren én gang pr. værdi og afbild ét kvalitetsmål. Tilføj en anden parameter for et varmekort. Hvert punkt er en ægte motorkørsel, op til 60.

# main
studio-main-pinned-runs-side-by-side = fastgjorte kørsler side om side

# main
studio-main-clear-pins = Ryd fastgørelser

# main
studio-main-key-figures-run-against-run = Nøgletal, kørsel mod kørsel

# main
studio-main-the-headline-readouts-of-each = De overordnede aflæsninger for hver fastgjort kørsel; ændringen er i forhold til kørsel A.

# main
studio-main-the-engine-s-own-export = motorens egen eksport

# main
studio-main-written-by-the-engine = skrevet af motoren

# main
studio-main-czml-kml-geojson-stk-ephemeris = CZML, KML, GeoJSON, STK-efemeride, SigMF

# main
studio-main-try-other-settings = Prøv andre indstillinger

# main
studio-main-change-a-value-then-run = Ændr en værdi, og kør igen. Svaret og diagrammet opdateres på stedet.

# main
studio-main-run-again = Kør igen

# main
studio-main-cancel-the-run = Annullér kørslen

# main
studio-main-runs-in-your-browser-nothing = Kører i din browser. Intet uploades.

# main
studio-main-advanced-settings = Avancerede indstillinger

# main
studio-main-every-setting-comes-from-the = Hver indstilling kommer fra scenariefilen. Redigér hele filen under “For forskere”.

# main
studio-main-how-this-is-computed = Sådan beregnes dette

# main
studio-main-level-of-evidence = Evidensniveau

# main
studio-main-the-engine-s-own-one = Motorens egen oversigt på én linje

# main
studio-main-every-figure-is-labelled-with = Hvert tal er mærket med sit evidensniveau. Valideret betyder kontrolleret mod en uafhængig ekstern reference; modelleret betyder fysik fra grundprincipper med tests, endnu ikke kontrolleret mod en reference.

# main
studio-main-for-researchers = For forskere

# main
studio-main-code-data-citation = kode, data, citation

# main
studio-main-run-it-on-your-computer = Kør den på din computer

# main
studio-main-run-it-from-python = Kør den fra Python

# main
studio-main-exported-figures-carry-this-doi = Eksporterede figurer bærer denne DOI (digital object identifier) i deres billedtekst. Samme scenarie, seed og motorversion giver de samme tal.

# main
studio-main-toml-tom-s-obvious-minimal = TOML (Tom's Obvious, Minimal Language)

# main
studio-main-in-the-editor-tab-indents = I editoren indrykker Tab med to mellemrum. Tryk på Escape og derefter Tab for at gå videre. Kør igen for at bruge din redigering.

# main
studio-main-every-panel-and-field = Hvert panel og hvert felt

# main
studio-main-the-advanced-view-is-the = Den avancerede visning er det fulde dashboard: hvert panel for denne kørsel side om side, hvert felt i scenariet, sweeps, sammenligninger og motorens egen rapport. Den åbner på dette scenarie med dine indstillinger.

# main
studio-main-kshana-pro = Kshana Pro

# main
studio-main-kshana-studio = Kshana Studio

# main
studio-main-request-an-evaluation = Anmod om en evaluering

# main
studio-main-talk-to-us-about-a = Tal med os om en kommerciel licens

# main
studio-main-request-a-study = Anmod om et studie

# main
studio-main-imagery-nasa-visible-earth-blue = Billeder: NASA Visible Earth (Blue Marble). Kystlinjer: Natural Earth. Hvert diagram her er tegnet ud fra en motorkørsel; en kørsel, rapport, animation eller eksport lavet af den native kommandolinjemotor er mærket som optaget.

# main
studio-main-this-session = denne session

# main
studio-main-runs-you-make-appear-here = De kørsler, du laver, vises her. Vælg en for at få dens scenarie og resultat tilbage, eller fastgør den for at sammenligne.

# advanced
studio-advanced-find-a-scenario-a-domain = Find et scenarie, et område, en indstilling eller en kommando

# advanced
studio-advanced-the-runs-you-made-in = De kørsler, du har lavet i denne session

# advanced
studio-advanced-a-short-tour-of-the = En kort rundvisning i Studio

# advanced
studio-advanced-toggle-colour-theme = Skift farvetema

# advanced
studio-advanced-switch-to-the-simple-view = Skift til den enkle visning

# advanced
studio-advanced-the-simple-view-the-answer = Den enkle visning: svaret først, fem indstillinger, detaljer efter behov

# advanced
studio-advanced-scenario-library = Scenariebibliotek

# advanced
studio-advanced-close-the-library = Luk biblioteket

# advanced
studio-advanced-find-a-scenario-a-domain-2 = Find et scenarie, et område eller en indstilling

# advanced
studio-advanced-scenario-domain-or-field = Scenarie, område eller indstilling

# advanced
studio-advanced-filter-by-domain = Filtrér efter område

# advanced
studio-advanced-scenarios-by-mission-domain = Scenarier efter missionsområde

# advanced
studio-advanced-how-the-studio-works = Sådan virker Studio

# advanced
studio-advanced-search-scenarios-domains-or-fields = Søg efter scenarier, områder eller indstillinger

# advanced
studio-advanced-search-scenarios-domains-or-fields-2 = Søg efter scenarier, områder eller indstillinger, for eksempel elevationsmaske

# advanced
studio-advanced-the-engine-kind-this-scenario = Den motortype, dette scenarie kører

# advanced
studio-advanced-open-the-scenario-library = Åbn scenariebiblioteket

# advanced
studio-advanced-show-the-parameters-and-the = Vis parametrene og scenariekilden

# advanced
studio-advanced-keep-this-run-to-compare = Behold denne kørsel til sammenligning med en anden (op til 4)

# advanced
studio-advanced-compare-the-pinned-runs = Sammenlign de fastgjorte kørsler

# advanced
studio-advanced-share-this-run-or-download = Del denne kørsel, eller download den

# advanced
studio-advanced-result-panels = Resultatpaneler

# advanced
studio-advanced-run-summary = Kørselsoversigt

# advanced
studio-advanced-parameters-and-scenario-source = Parametre og scenariekilde

# advanced
studio-advanced-close-the-parameters-and-show = Luk parametrene, og vis resultaterne

# advanced
studio-advanced-find-a-field-of-this = Find en indstilling i dette scenarie

# advanced
studio-advanced-find-a-field-for-example = Find en indstilling, for eksempel maske

# advanced
studio-advanced-parameter-view = Parametervisning

# advanced
studio-advanced-find-a-scenario-domain-field = Find et scenarie, område, indstilling, panel eller kommando

# advanced
studio-advanced-skip-to-results = Gå til resultaterne

# advanced
studio-advanced-find-anything = Find alt

# advanced
studio-advanced-lunar-station-coverage-of-a = Lunar station: dækning af en referencestation (MODELLED)

# advanced
studio-advanced-simple-view = Enkel visning

# advanced
studio-advanced-choose-a-scenario = Vælg et scenarie

# advanced
studio-advanced-what-do-you-want-to = Hvad vil du gøre?

# advanced
studio-advanced-pick-a-domain-and-a = Vælg et område og et scenarie, sæt det op, kør motoren i din browser, og læs, sammenlign og eksportér derefter resultaterne. Intet uploades.

# advanced
studio-advanced-share-or-export = Del eller eksportér

# advanced
studio-advanced-good-first-runs = Gode første kørsler

# advanced
studio-advanced-pin-run = Fastgør kørsel

# advanced
studio-advanced-report-json-scenario-tables-and = rapport, JSON, scenarie, tabeller og eksporter

# advanced
studio-advanced-the-exact-scenario-in-the = det præcise scenarie, i linket

# advanced
studio-advanced-an-iframe-for-a-course = en iframe til en kursusside eller wiki

# advanced
studio-advanced-opens-in-a-new-tab = åbner i et nyt faneblad

# advanced
studio-advanced-loading-the-engine-the-recorded = Indlæser motoren. Dette scenaries optagede resultat vises først.

# advanced
studio-advanced-got-it = Forstået

# advanced
studio-advanced-headline-numbers-from-the-engine = Overordnede tal fra motorens resultat, med ændringen siden din forrige kørsel af dette scenarie og en bestået eller ikke bestået, hvor kørslen angiver en tærskel.

# advanced
studio-advanced-set-parameters = Indstil parametre

# advanced
studio-advanced-every-change-re-runs-the = Hver ændring kører motoren igen og opdaterer nøgletallene og panelerne.

# advanced
studio-advanced-drag-a-slider-and-the = Træk i en skyder, og scenariet kører igen. Hver kontrol skriver direkte ind i scenarieteksten nedenfor.

# advanced
studio-advanced-in-the-editor-tab-indents = I editoren indrykker Tab med to mellemrum. Tryk på Escape og derefter Tab for at gå videre.

# mission-thread
studio-mission-thread-time-axis = Tidsakse

# mission-thread
studio-mission-thread-mission-thread = Missionsforløb

# mission-thread
studio-mission-thread-where-does-a-mission-s = Hvor slipper en missions budget for navigations- og tidsfejl op?

# mission-thread
studio-mission-thread-a-mission-is-a-chain = En mission er en kæde af faser: opsendelse, rendezvous, overførsel til Månen, landing, hjemrejse. Hver fase har sine egne sensorer og sit eget fejlbudget, og hver giver sin usikkerhed videre til den næste. Denne side viser budgettet for hele kæden, fase for fase, og peger på det svageste led.

# mission-thread
studio-mission-thread-open-the-artemis-class-example = Åbn eksemplet i Artemis-klassen

# mission-thread
studio-mission-thread-open-a-result-file = Åbn en resultatfil…

# mission-thread
studio-mission-thread-the-thread = Forløbet

# mission-thread
studio-mission-thread-error-against-mission-elapsed-time = Fejl mod forløbet missionstid

# mission-thread
studio-mission-thread-the-phases = Faserne

# mission-thread
studio-mission-thread-the-budget-of-one-phase = Budgettet for én fase
