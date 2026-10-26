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
