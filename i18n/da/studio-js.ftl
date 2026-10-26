# studio-js.ftl (da): translations

js-adv-all-domains = Alle områder

js-adv-animation-frame-title = Animation af denne kørsel, skrevet af motoren

js-adv-animation-html-player = HTML-afspiller

js-adv-animation-html-player-title = Afspilleren i én enkelt fil, som motoren skrev den

js-adv-animation-load-failed = Den optagede animation kunne ikke indlæses ({ $reason }).

js-adv-animation-loading = Indlæser den optagede animation…

js-adv-animation-none = Der er ingen optaget animation for dette scenarie.

js-adv-animation-note = Motoren skriver en animation af enhver kørsel med en tidsakse: en selvafspillende SVG og en HTML-afspiller i én enkelt fil med egne knapper til afspilning og spoling. Browserudgaven indeholder ikke denne skrivefunktion, så det her er den fil, som den native kommandolinjemotor skrev for det medfølgende scenarie.

js-adv-animation-svg = Animeret SVG

js-adv-animation-svg-title = Den selvafspillende SVG, som motoren skrev den

js-adv-axis-averaging-time = middelværdidannelsestid τ (s)

js-adv-axis-observation-interval = observationsinterval τ (s)

js-adv-axis-value = værdi

js-adv-badge-live-engine = Live motor

js-adv-badge-recorded = Optaget

js-adv-badge-recorded-engine = Optaget kørsel, motor v{ $version }

js-adv-badge-recorded-native = Optaget kørsel, native motor v{ $version }

js-adv-band-carrier = Bærebølge

js-adv-band-carrier-not-set = ikke angivet i dette scenarie

js-adv-band-chip-rate = Chiprate

js-adv-band-jammer-bandwidth = Jammerens båndbredde

js-adv-band-jammer-label = jammer { $bandwidth } MHz

js-adv-band-jammer-power = Jammerens effekt

js-adv-band-jammer-type = Jammertype

js-adv-band-no-carrier-note = Motoren beregner jammer-til-signal-forholdet ud fra linkbudgettet. Dette scenarie angiver ingen bærefrekvens, så der tegnes intet spektrum.

js-adv-band-satellites = Satellitter

js-adv-band-signal-main-lobe = signalets hovedlobe

js-adv-band-svg-label = Signal- og jammerbånd omkring bærebølgen

js-adv-band-tracking-threshold = Sporingstærskel

js-adv-browser-cannot-run = Browserudgaven kan ikke køre dette scenarie.

js-adv-busy-running = Kører

js-adv-busy-sweeping = Sweeper

js-adv-chain-handed-on =
    { $n ->
        [one] { $n } værdi givet videre
       *[other] { $n } værdier givet videre
    }

js-adv-chain-note = Ét system fulgt gennem hvert trin i motoren. Tabellen nedenfor viser hvert tal, som et trin beregnede, og som det næste trin brugte.

js-adv-chain-stage = Trin { $n }

js-adv-chain-sub = hvert trins output føder det næste

js-adv-chain-title = Kæden

js-adv-chart-allan-title = Allan-deviation

js-adv-chart-budget-label = budget

js-adv-chart-default-title = Kshana-diagram

js-adv-chart-effective-cn0 = Effektiv C/N0 pr. satellit

js-adv-chart-ground-track = Sporet på jorden

js-adv-chart-holdover-budget = Holdover mod et tidsbudget

js-adv-chart-mtie-title = MTIE (maksimal tidsintervalfejl)

js-adv-chart-provenance = Kshana v{ $version } · kshana.dev

js-adv-chart-provenance-hash = Kshana v{ $version } · scenarie { $hash } · kshana.dev

js-adv-chart-stability-title = Urets stabilitet (overlappende Allan-deviation)

js-adv-chart-tdev-title = TDEV (tidsdeviation)

js-adv-chart-undrawable = Dette diagram kunne ikke tegnes.

js-adv-chip-live = Live motor · v{ $version }

js-adv-chip-live-title = Kshana-motoren kører i denne browser som WebAssembly

js-adv-chip-recorded = Optagede kørsler · v{ $version }

js-adv-chip-recorded-title = WebAssembly kunne ikke starte her. Viser rigtige optagede kørsler af de medfølgende scenarier.

js-adv-chip-recorded-title-reason = WebAssembly kunne ikke starte her ({ $reason }). Viser rigtige optagede kørsler af de medfølgende scenarier.

js-adv-chip-unavailable = Motoren er ikke tilgængelig

js-adv-cmd-all-fields = Vis alle numeriske felter

js-adv-cmd-compare = Sammenlign de fastgjorte kørsler

js-adv-cmd-embed-code = Kopiér indlejringskode

js-adv-cmd-exports = Download resultaterne (eksport)

js-adv-cmd-history = Åbn kørselshistorik

js-adv-cmd-parameters = Åbn parametrene

js-adv-cmd-pin = Fastgør denne kørsel til sammenligning

js-adv-cmd-report = Download rapporten

js-adv-cmd-reset = Nulstil scenarieteksten

js-adv-cmd-run = Kør scenariet

js-adv-cmd-share-link = Kopiér delingslink

js-adv-cmd-start = Gå til startskærmen

js-adv-cmd-theme = Skift mellem lyst og mørkt tema

js-adv-cmd-tour = Start den guidede rundvisning

js-adv-command-line-only = kun kommandolinje

js-adv-compare-deltas-note = Forskellene er i forhold til kørsel A. Grøn markerer den bedste værdi for hvert tal.

js-adv-compare-no-common = Disse kørsler har ingen sammenlignelige kvalitetsmål. Fastgør kørsler af samme scenariefamilie for at se tal og forskelle.

js-adv-compare-one-pinned = Én kørsel er fastgjort. Ændr en parameter, kør igen, og fastgør den kørsel for at sammenligne de to.

js-adv-compare-overlay = Overlejring af fastgjorte kørsler

js-adv-compare-overlay-diff = Overlejring med forskellen B − A

js-adv-compare-overlay-note = Fuldt optrukne linjer er kørsel A, stiplede linjer kørsel B, på de samme akser.

js-adv-compare-overlay-title = { $title }: kørsel { $a } (A) mod kørsel { $b } (B)

js-adv-compare-pin-two = Fastgør mindst to kørsler for at sammenligne dem side om side. Fastgør en kørsel, ændr en parameter eller vælg et andet scenarie i samme familie, kør det, og fastgør igen.

js-adv-compare-run-heading = { $letter } · kørsel { $run }

js-adv-copy-blocked = Kopiering er blokeret her.

js-adv-copy-command = Kopiér: { $command }

js-adv-could-not-load = Kunne ikke indlæse { $file }.

js-adv-coverage-dots = Prikkerne er { $shown } af { $total } satellitter, fløjet langs deres spor på jorden; afspil genafspilningen for at flytte dem.

js-adv-coverage-field-label = Felt, der skal vises på kortet

js-adv-coverage-map = Dækningskort

js-adv-coverage-map-over = over { $body }

js-adv-coverage-map-select = Kort

js-adv-coverage-note = Hver celle er ét gitterpunkt på { $body }, bedømt over hver epoke i kørslen.

js-adv-coverage-title = { $field } over { $body }

js-adv-crumb-studio = Studio

js-adv-crumb-studio-title = Startskærmen: alle områder

js-adv-decrease-field = Mindsk { $field }

js-adv-domain = Område

js-adv-domain-line-campaigns = Kædede missioner, sweeps og Monte Carlo-kørsler på ét ur.

js-adv-domain-line-constellations = Udform en konstellation, og kortlæg dens dækning og PDOP (positionsmæssig præcisionsforringelse).

js-adv-domain-line-deepspace = Navigation og tid ved Månen, i det cislunare rum og ved Mars.

js-adv-domain-line-integrity = Positionsbestemmelser, og om de kan stoles på: RAIM (modtagerens autonome integritetsovervågning) og dens avancerede form, ARAIM.

js-adv-domain-line-interference = Jammere mod GNSS-modtagere: hvad der går tabt, og hvornår.

js-adv-domain-line-leo = Navigationssignaler, passager, meddelelser og positionsbestemmelser i lav jordbane.

js-adv-domain-line-leo-missions = Undersøgelser og tjenester bygget på et lag i lav jordbane.

js-adv-domain-line-navigation = Inertial-, terræn-, tyngde- og anden navigation uden GNSS.

js-adv-domain-line-optional = En valgfri gruppe af scenarier.

js-adv-domain-line-orbits = Banepropagering, efemerider og GNSS-geometri.

js-adv-domain-line-solar = Alle planeter og måner på ét tidspunkt, med lystider.

js-adv-domain-line-spaceops = Passager, opsendelsesvinduer, genindtræden, link- og attitudebudgetter.

js-adv-domain-line-spectrum = Vandfaldsdiagrammer af radiobåndet: jammere, signaler og det, modtageren sporer.

js-adv-domain-line-spoofing = Falske signaler og meaconing og de monitorer, der fanger dem.

js-adv-domain-line-studies = Kvantesensorer, afvejningsundersøgelser og interoperabilitetsformater.

js-adv-domain-line-timing = Ure uden GNSS: holdover, stabilitet, telekommasker, tidsoverførsel.

js-adv-domain-pick-hint = Vælg ét: det åbner og kører i din browser. Bagefter kan du ændre dets parametre.

js-adv-domain-scenario-count =
    { $n ->
        [one] { $label }: { $n } scenarie
       *[other] { $label }: { $n } scenarier
    }

js-adv-domain-select-label = Vis ét område

js-adv-download = Download

js-adv-edited-cli-only-status = Redigeret: dette scenarie kører kun i kommandolinjemotoren.

js-adv-edited-needs-engine = Redigeret: kræver motor { $need }.

js-adv-edited-needs-live-engine = Redigerede scenarier kræver live motoren.

js-adv-embed-copied = Indlejringskode kopieret.

js-adv-engine-chart = Motordiagram

js-adv-engine-chart-alt = Motordiagram for denne kørsel

js-adv-engine-file-http-error = motorfilen returnerede HTTP { $status }

js-adv-engine-load-failed-no-recordings = motoren kunne ikke indlæses ({ $reason }), og der blev ikke fundet optagede kørsler

js-adv-engine-loading = Indlæser motoren…

js-adv-engine-loading-title = Live motoren downloades stadig. Dette optagede resultat erstattes af en live kørsel, når den er klar.

js-adv-engine-start-failed = Motoren kunne ikke starte: { $reason }. Server denne mappe over HTTP (for eksempel python3 -m http.server) i stedet for at åbne filen direkte.

js-adv-entries-count = { $n } poster

js-adv-export-card-title = Eksport som { $format }

js-adv-export-csv-desc = Præcis de samme bytes, som kommandolinjeværktøjet skriver som { $file }.

js-adv-export-csv-title = Reproducerbarhedstabel

js-adv-export-ephemeris-checking = Undersøger, hvilke efemeridformater denne kørsel kan eksportere…

js-adv-export-ephemeris-waiting = Efemerideeksporterne vises her, når motoren er indlæst.

js-adv-export-json-desc = Motorens komplette output for denne kørsel, inklusive enheder og proveniens.

js-adv-export-json-title = Fuldt resultatdokument

js-adv-export-large-not-recorded = Denne eksport er stor og blev derfor ikke optaget. Den kræver live motoren.

js-adv-export-oem-desc = CCSDS OEM 2.0 (Orbit Ephemeris Message) til GMAT, Orekit eller STK

js-adv-export-omm-desc = CCSDS OMM (Orbit Mean-elements Message) katalog

js-adv-export-report-desc = Én offlinefil: oversigt, tal med deres evidensniveauer, hvert diagram og den præcise scenarietekst, stemplet med motorversion og scenariehash.

js-adv-export-report-title = Reproducerbar rapport

js-adv-export-sp3-desc = SP3-c præcis efemeride for denne konstellation

js-adv-export-toml-desc = Den præcise input til denne kørsel. Kør den igen hvor som helst med kommandolinjeværktøjet eller Python- og npm-pakkerne.

js-adv-export-toml-title = Scenariefil

js-adv-export-too-large = { $desc }. For stor til at optage: kræver live motoren.

js-adv-field-find-match =
    { $n ->
        [one] { $n } guidet kontrol og { $fields } af { $total } felter matcher »{ $query }«.
       *[other] { $n } guidede kontroller og { $fields } af { $total } felter matcher »{ $query }«.
    }

js-adv-field-find-none = Intet felt i dette scenarie matcher »{ $query }«. Søg i alle scenarier med bibliotekssøgningen.

js-adv-field-hit-in = i { $title }

js-adv-field-not-single-number = Det felt er ikke ét enkelt tal i dette scenarie: redigér det i kilden.

js-adv-field-opened = Åbnet ved { $field }. Ændr det, så kører scenariet igen.

js-adv-fields-matching = Felter, der matcher »{ $query }«

js-adv-fields-more = { $n } flere: præciser ordene, eller søg på startskærmen.

js-adv-fields-top-level = øverste niveau

js-adv-filter-check-tuning = kontrollér afstemningen

js-adv-filter-consistent = konsistent

js-adv-from-the-link = fra linket

js-adv-geo-sub = { $name } · { $shown } af { $total } elementer tegnet · optaget med den native motor

js-adv-geo-title = GeoJSON-eksport: { $name }

js-adv-gt-note = Fremhævet: satellit, der er synlig fra stationen.

js-adv-gt-note-both = Fremhævet: satellit, der er synlig fra stationen. Maksimal elevation { $elevation }°. Maksimal Doppler { $doppler } Hz.

js-adv-gt-note-doppler = Fremhævet: satellit, der er synlig fra stationen. Maksimal Doppler { $doppler } Hz.

js-adv-gt-note-elevation = Fremhævet: satellit, der er synlig fra stationen. Maksimal elevation { $elevation }°.

js-adv-heatmap-label = Varmekort for { $metric }

js-adv-hist-runs-count = { $n } kørsler.

js-adv-history-pin = Fastgør

js-adv-history-restore = Gendan

js-adv-history-run-time = kørsel { $run } · { $time }

js-adv-holdover-engine-figure = Motorens holdover ved scenariets budget: { $duration }

js-adv-holdover-engine-figure-budget = Motorens holdover ved scenariets budget ({ $budget } { $unit }): { $duration }

js-adv-holdover-error-after-loss = fejl, efter at GNSS gik tabt ved t = { $loss } s

js-adv-holdover-error-since-fix = fejl siden den seneste positionsbestemmelse

js-adv-holdover-stays-inside = holder sig inden for dette budget i hele optagelsen

js-adv-holdover-until-breached = indtil budgettet overskrides

js-adv-honesty-modelled = Fysik ud fra grundprincipper med tests, endnu ikke kontrolleret mod en ekstern uafhængig reference. { $text }

js-adv-honesty-partner = Tal, som en partner ejer. { $text }

js-adv-honesty-validated = Kontrolleret mod en uafhængig ekstern reference. { $text }

js-adv-increase-field = Øg { $field }

js-adv-install-version = Installér v{ $version }

js-adv-interop-no-file = Motoren skrev ingen fil i dette format for denne kørsel.

js-adv-interop-not-applicable = Gælder ikke for dette scenarie: { $reason }.

js-adv-interop-not-bundled = Medfølger ikke her (størrelse): kommandoen ovenfor skriver den.

js-adv-interop-note = Motoren skriver en kørsels geometri og signalsamples i formater, som andre værktøjer åbner: CZML til Cesium, KML (Keyhole Markup Language) til Google Earth, GeoJSON til kort, STK-efemeride-filer (.e) og SigMF-optagelser (Signal Metadata Format). Browserudgaven indeholder ikke disse skrivefunktioner, så filerne nedenfor er dem, som den native kommandolinjemotor skrev for det medfølgende scenarie.

js-adv-js-range-label = J/S-område

js-adv-js-range-value = { $low } til { $high } dB

js-adv-json-copied = JSON kopieret.

js-adv-kind-default = kind: clock holdover (standard)

js-adv-kind-label = kind: { $kind }

js-adv-kpi-check = Kontrol

js-adv-kpi-delta-since-run = { $arrow } { $change } siden kørsel { $run }

js-adv-kpi-fail = Ikke bestået

js-adv-kpi-first-run = første kørsel

js-adv-kpi-not-in-previous = ikke i din forrige kørsel

js-adv-kpi-pass = Bestået

js-adv-lib-count-all = { $scenarios } scenarier · { $domains } områder

js-adv-lib-count-filtered = { $n } af { $total } scenarier

js-adv-lib-no-match = Intet scenarie eller felt matcher. Prøv et ord som jamming, ur, måne, bane, maske eller PDOP.

js-adv-loaded-shared = Indlæste et delt scenarie fra linket.

js-adv-mask-envelope = Omhyllingskurve for holdover-tidsfejl ({ $source })

js-adv-mask-exceeded-after = overskredet efter { $duration }

js-adv-mask-limit-label = grænse { $limit } ns

js-adv-mask-max-te = maks. |TE|

js-adv-mask-not-exceeded = ikke overskredet

js-adv-matrix-counts = { $validated } af { $total }

js-adv-matrix-line = { $counts } funktioner kontrolleret mod uafhængige eksterne referencer · { $modelled } beregnet ud fra en model · { $partner } ejet af partnere

js-adv-max-close = Luk

js-adv-max-close-label = Luk fuld skærm

js-adv-max-expand = Udvid

js-adv-max-expand-label = Udvid dette panel til fuld skærm

js-adv-max-title = Vis dette panel i fuld skærm (Escape lukker det)

js-adv-meta-engine = motor

js-adv-meta-file = fil

js-adv-meta-scenario = scenarie

js-adv-meta-seed = seed

js-adv-meta-time = tid

js-adv-mission-timeline = Missionens tidslinje

js-adv-native-edited-notice = { $why } Den optagede kørsel er af den medfølgende fil, så en redigeret kopi kan ikke vises her: kør den med kommandolinjeværktøjet, eller brug Nulstil for at se optagelsen.

js-adv-native-notice-command = { $why } Det, du ser, er en kørsel optaget med den native kommandolinjemotor v{ $version } ved at køre { $command }, vist uændret. Den kører ikke igen, når du redigerer.

js-adv-native-notice-plain = { $why } Det, du ser, er en kørsel optaget med den native kommandolinjemotor v{ $version }, vist uændret. Den kører ikke igen, når du redigerer.

js-adv-native-notice-platform = { $why } Det, du ser, er en kørsel optaget med den native kommandolinjemotor v{ $version } ({ $platform }), vist uændret. Den kører ikke igen, når du redigerer.

js-adv-native-notice-platform-command = { $why } Det, du ser, er en kørsel optaget med den native kommandolinjemotor v{ $version } ({ $platform }) ved at køre { $command }, vist uændret. Den kører ikke igen, når du redigerer.

js-adv-needs-live-engine = Dette kræver live motoren.

js-adv-needs-newer-engine-status = Kræver en nyere motor.

js-adv-nees-line = NEES { $mean } (95 %-bånd { $low }–{ $high }, mål 2.0)

js-adv-newer-engine-edited-notice = Dette scenarie kræver motor { $need } eller nyere; motoren, der kører her, er v{ $version }. Kun optagelsen af den medfølgende fil kan vises: brug Nulstil for at se den, eller kør en redigeret kopi med motor { $need }.

js-adv-newer-engine-no-recording = Dette scenarie kræver motor { $need } eller nyere; motoren, der kører her, er v{ $version }. Der er ingen optagelse af det her.

js-adv-newer-engine-shown-commit = Dette scenarie kræver motor { $need } eller nyere; motoren, der kører her, er v{ $version }. Det, du ser, er kørslen optaget med et motorbuild ved commit { $commit }, vist uændret; den kører ikke igen her.

js-adv-newer-engine-shown-version = Dette scenarie kræver motor { $need } eller nyere; motoren, der kører her, er v{ $version }. Det, du ser, er kørslen optaget med motor v{ $recorded }, vist uændret; den kører ikke igen her.

js-adv-nis-line = NIS { $mean } (95 %-bånd { $low }–{ $high }, mål 1.0)

js-adv-no-guided-controls = Dette scenarie har ingen af de guidede kontroller. Brug Alle felter, eller redigér kilden.

js-adv-no-numeric-fields = Ingen enkeltstående numeriske felter at justere her. Redigér kilden direkte.

js-adv-no-recorded-run = Der er ingen optaget kørsel for dette scenarie. Det kræver live motoren.

js-adv-no-summary = (dette scenarie udgiver ingen oversigt på én linje)

js-adv-noise-floor = støjgulv { $level }

js-adv-not-in-browser-status = Dette scenarie kører ikke i browseren.

js-adv-open-and-run = Åbn og kør

js-adv-open-at-field = åbn ved dette felt

js-adv-opened-from-simple = Åbnet med de indstillinger, du ændrede i den enkle visning.

js-adv-optional-preset = valgfri forudindstilling: scenarios/{ $file }

js-adv-orbit-canvas-label = Interaktiv 3D-visning af det propagerede spor

js-adv-orbit-fallback-alt = Ortografisk visning af det propagerede spor

js-adv-orbit-note-epoch = Træk for at rotere, rul eller knib for at zoome. Jorden i målestok, billeder fra NASA Blue Marble. Drejet til kørslens epoke.

js-adv-orbit-note-no-epoch = Træk for at rotere, rul eller knib for at zoome. Jorden i målestok, billeder fra NASA Blue Marble. Denne kørsel angiver ingen epoke, så Jordens rotationsvinkel er ikke meningsfuld her.

js-adv-orbit-static-note = Statisk visning (3D-biblioteket kunne ikke indlæses her).

js-adv-pal-commands = Kommandoer

js-adv-pal-domain = Område: { $name }

js-adv-pal-domains = Områder

js-adv-pal-field = Felt: { $name }

js-adv-pal-fields = Felter

js-adv-pal-nothing = Intet matcher

js-adv-pal-opens-page = åbner en side

js-adv-pal-page = Side: { $name }

js-adv-pal-pages = Sider

js-adv-pal-panel = Panel: { $name }

js-adv-pal-panels = Paneler

js-adv-pal-scenarios = Scenarier

js-adv-params-hint-all = Hvert enkelt tal i scenariet. Træd det, skriv det, eller brug piletasterne; scenariet kører igen.

js-adv-params-hint-guided = Træk i en skyder, så kører scenariet igen. Hver kontrol skriver direkte ind i scenarieteksten nedenfor.

js-adv-pin-already = Den kørsel er allerede fastgjort.

js-adv-pin-first = Kørsel { $run } fastgjort. Ændr en parameter, kør igen, og fastgør så også den kørsel.

js-adv-pin-label = { $letter } · { $title } · kørsel { $run }

js-adv-pin-opening-compare = { $n } kørsler fastgjort. Åbner Sammenlign.

js-adv-plan-view = Planvisning

js-adv-plan-view-epoch = ved { $epoch }

js-adv-plan-view-note = Hver prik er et legeme ved kørslens epoke, og hver kurve er det banespor, motoren beregnede for det. En stiplet linje er et link, som scenariet beder om. Vælg en planet for at se dens måner omkring den.

js-adv-player-name-mission = missionens genafspilning

js-adv-player-name-orbit = banens genafspilning

js-adv-player-name-replay = genafspilningen

js-adv-player-name-waterfall = vandfaldets genafspilning

js-adv-player-pause = Sæt { $name } på pause

js-adv-player-play = Afspil { $name }

js-adv-player-position = Position i { $name }

js-adv-png-download-title = Bitmap i høj opløsning til slides og dokumenter

js-adv-png-export-failed = PNG-eksport mislykkedes: { $reason }

js-adv-ready-live = Klar. Kører lokalt i din browser.

js-adv-ready-recorded = Klar. Viser optagede kørsler.

js-adv-receiver-at-time = Modtager ved t = { $time }

js-adv-recorded-edit-notice = WebAssembly er blokeret på denne side, så siden viser rigtige kørsler af de medfølgende scenarier optaget med motor v{ $version }. Redigerede scenarier, sweeps og nye eksporter kræver live motoren: åbn kshana.dev, eller server denne mappe lokalt. Nulstil gendanner det optagede scenarie.

js-adv-recorded-edited-warning = Du har redigeret scenariet: denne optagelse er af den medfølgende fil, ikke af din redigering. Kør kommandoen på din egen fil for at få din.

js-adv-recorded-intro = WebAssembly er blokeret på denne side, så siden viser rigtige kørsler af de medfølgende scenarier, optaget med motor v{ $version }. Redigering, sweeps og nye eksporter kræver live motoren på kshana.dev.

js-adv-recorded-run-native = optaget kørsel, native motor

js-adv-recorded-written-by = Skrevet af den native kommandolinjemotor v{ $version } ({ $platform }) med { $command }. Vist uændret.

js-adv-replay = Genafspilning

js-adv-report-downloaded = Rapport downloadet.

js-adv-report-frame-title = Kørselsrapport skrevet af motoren

js-adv-report-html = Rapport (HTML)

js-adv-report-html-title = Rapportfilen, som motoren skrev den

js-adv-report-load-failed = Den optagede rapport kunne ikke indlæses ({ $reason }).

js-adv-report-loading = Indlæser den optagede rapport…

js-adv-report-none = Der er ingen optaget rapport for dette scenarie.

js-adv-report-note = Hver kørsel i kommandolinjen skriver en rapport: oversigt, input, resultater, diagrammet, hvad der er kontrolleret mod en uafhængig reference, og hvad der er beregnet ud fra en model, samt en reproducerbarhedsjournal. Browserudgaven indeholder ikke denne skrivefunktion, så det her er den rapport, som den native kommandolinjemotor skrev for det medfølgende scenarie. Studioets egen rapport om kørslen på skærmen findes under Eksport.

js-adv-report-open-tab = Åbn i en ny fane

js-adv-report-open-tab-title = Åbn rapporten for sig selv

js-adv-report-orbit-title = Bane (jordcentreret inertisystem, ortografisk)

js-adv-report-stability-chart = Urets stabilitet

js-adv-report-stability-title = Urets stabilitet (Allan-deviation)

js-adv-restored-run = Kørsel { $run } gendannet.

js-adv-result = Resultat

js-adv-run-cancelled = Kørslen blev annulleret.

js-adv-run-cancelled-previous = Kørslen blev annulleret. Det forrige resultat vises stadig.

js-adv-run-failed = Kørslen mislykkedes. Se meddelelsen i resultaterne.

js-adv-scenario-copied = Scenarie kopieret.

js-adv-scenarios-count = { $n } scenarier

js-adv-share-link-copied = Delingslink kopieret. Det indeholder det præcise scenarie.

js-adv-share-link-in-bar = Linket er placeret i adresselinjen.

js-adv-shared-link = delt link

js-adv-shared-needs-live = Dette link indeholder sit eget scenarie, som kræver live motoren. Åbn det på kshana.dev.

js-adv-shared-scenario = Delt scenarie

js-adv-shared-scenario-question = Et scenarie åbnet fra et delingslink. Det kører præcis, som det blev delt.

js-adv-solar-bodies-label = Hvilke legemer der skal tegnes

js-adv-spectrum-part-label = Hvilken del af spektret

js-adv-spectrum-row-note = Spektret langs den vandfaldsrække, genafspilningen er på.

js-adv-spectrum-row-title = Spektrum langs den række, der vises

js-adv-start-field-meta = { $domain } · felt { $field }

js-adv-start-fields-hint = Hvert åbner scenariet med den kontrol fremhævet, klar til at blive ændret.

js-adv-start-fields-named =
    { $n ->
        [one] Felter med navne som »{ $query }«: i { $n } scenarie
       *[other] Felter med navne som »{ $query }«: i { $n } scenarier
    }

js-adv-start-more-matches = { $n } flere match: tilføj et ord for at indsnævre dem.

js-adv-start-nothing = Intet matcher »{ $query }«. Prøv et ord som jamming, ur, måne, bane, maske eller PDOP.

js-adv-start-scenarios-count = Scenarier ({ $count })

js-adv-status-fetching-recorded = Indlæser motoren… Henter det optagede resultat af dette scenarie.

js-adv-status-ran-locally = Kørt lokalt kl. { $time }, kørsel { $run }.

js-adv-status-ran-locally-secs = Kørt lokalt kl. { $time }, kørsel { $run }, { $secs } s.

js-adv-status-recorded-native = Optaget kørsel vist kl. { $time } (native motor).

js-adv-status-recorded-needs-engine = Optaget kørsel vist kl. { $time } (kræver motor { $need }).

js-adv-status-recorded-shown = Optaget kørsel vist kl. { $time }, kørsel { $run }.

js-adv-status-recorded-shown-secs = Optaget kørsel vist kl. { $time }, kørsel { $run }, { $secs } s.

js-adv-status-showing-recorded = Indlæser motoren… Viser det optagede resultat af dette scenarie, indtil live motoren er klar.

js-adv-subtabs-label = Felter i denne visning (telefon)

js-adv-suggest-campaign = Afspil en mission med jamming, spoofing og holdover igen

js-adv-suggest-coverage = Kortlæg dækningen af fire GNSS-konstellationer (globale navigationssatellitsystemer)

js-adv-suggest-holdover = Holdetid, når GNSS går tabt

js-adv-suggest-waterfall = Se en jammer på L-båndets vandfaldsdiagram

js-adv-svg-download-title = Vektordiagram med titel og proveniens

js-adv-sweep-cancelled = Sweep annulleret.

js-adv-sweep-done-grid = Sweepede { $total } kørsler ({ $columns } × { $rows }) lokalt på { $time }.

js-adv-sweep-done-line = Sweepede { $done } af { $total } kørsler lokalt på { $time }.

js-adv-sweep-enter-range = Angiv et numerisk interval.

js-adv-sweep-enter-range-second = Angiv et numerisk interval for den anden parameter.

js-adv-sweep-failed = Sweep mislykkedes: { $reason }

js-adv-sweep-interrupted = Sweepet blev afbrudt af en ny kørsel.

js-adv-sweep-needs-live = Et sweep kører motoren mange gange, så det kræver live motoren.

js-adv-sweep-none-line-chart = Ingen (kurvediagram)

js-adv-sweep-nothing = Intet at sweepe for dette scenarie.

js-adv-sweep-progress = Sweeper kørsel { $n } af { $total }…

js-adv-sweep-status-done = Sweepede { $total } kørsler kl. { $time }.

js-adv-sweep-title-grid = { $metric } over { $first } og { $second }

js-adv-sweep-title-line = { $metric } mod { $parameter }

js-adv-sweep-wait = Vent, til den aktuelle kørsel er færdig, og sweep så.

js-adv-tab-animation = Animation

js-adv-tab-compare = Sammenlign

js-adv-tab-engine-report = Motorrapport

js-adv-tab-exports-report = Eksport og rapport

js-adv-tab-ground-track = Sporet på jorden

js-adv-tab-holdover = Holdover

js-adv-tab-orbit-3d = 3D-bane

js-adv-tab-overview = Oversigt

js-adv-tab-signal-band = Signal og bånd

js-adv-tab-stability = Stabilitet

js-adv-tab-sweep = Sweep

js-adv-tab-time-series = Tidsserie

js-adv-tab-timing-masks = Tidsmasker

js-adv-th-at-tau-or-time = Ved τ eller tid

js-adv-th-body = Legeme

js-adv-th-clock = Ur

js-adv-th-distance-sun = Afstand fra Solen

js-adv-th-figure = Tal

js-adv-th-file = Fil

js-adv-th-format = Format

js-adv-th-key-figure = Nøgletal

js-adv-th-light-time-from = Lystid i én retning fra { $observer }

js-adv-th-light-time-observer = Lystid i én retning fra observatøren

js-adv-th-limit = Grænse

js-adv-th-margin = Margin

js-adv-th-mask-or-budget = Maske eller budget

js-adv-th-metric = Måleværdi

js-adv-th-orbital-period = Omløbstid

js-adv-th-provenance = Proveniens

js-adv-th-size = Størrelse

js-adv-th-source = Kilde

js-adv-th-tier = Evidensniveau

js-adv-th-unit = Enhed

js-adv-th-value = Værdi

js-adv-th-verdict = Dom

js-adv-th-what-it-is = Hvad det er

js-adv-the-body = legemet

js-adv-tile-scenario-count =
    { $n ->
        [one] { $n } scenarie
       *[other] { $n } scenarier
    }

js-adv-timeline-chart-title = Missionens tidslinje: { $title }

js-adv-timeline-latest-event = Seneste hændelse kl. { $time }: { $label }

js-adv-timeline-no-event = Endnu ingen hændelse på dette tidspunkt.

js-adv-timeline-note = Én scrubber styrer hvert diagram nedenfor. Hver fase kører almindelige scenarier; kampagnen læser deres output ind på ét tidsgitter. Skraverede bånd er faserne, lodrette streger hændelserne. Værdierne ovenfor er kampagnens kanaler på genafspilningstidspunktet.

js-adv-timeline-on-one-clock = { $duration } på ét ur

js-adv-timeline-phase = Fase: { $phase }

js-adv-tour-back = Tilbage

js-adv-tour-done = Færdig

js-adv-tour-eyebrow = Guidet rundvisning

js-adv-tour-headline-body = Oversigten på én linje, motorversionen og scenariets fingeraftryk samt om hvert tal er kontrolleret mod en uafhængig reference eller beregnet ud fra en model.

js-adv-tour-headline-title = Læs svaret

js-adv-tour-keyboard-body = ⌘K finder ethvert scenarie, enhver visning og enhver kommando. [ og ] skifter mellem visninger.

js-adv-tour-keyboard-title = Alt fra tastaturet

js-adv-tour-library-body = Hvert medfølgende scenarie, grupperet efter missionsområde: jamming, spektrum, spoofing, ure, navigation, integritet, baner, konstellationsudformning, navigation i lav jordbane, kampagner, Månen, Mars og solsystemet. Søg med /.

js-adv-tour-library-title = Vælg en mission

js-adv-tour-next = Næste

js-adv-tour-params-body = Guidede skydere til de almindelige indstillinger, eller hvert numerisk felt i scenariet. Hver ændring kører igen.

js-adv-tour-params-title = Justér det

js-adv-tour-pin-body = Fastgør op til fire kørsler, og se dem side om side med forskelle og et differenssporet.

js-adv-tour-pin-title = Sammenlign kørsler

js-adv-tour-run-body = Rust-motoren kører i din browser som WebAssembly. Intet uploades. ⌘↵ kører fra hvor som helst.

js-adv-tour-run-title = Kør det lokalt

js-adv-tour-share-body = Download rapporten, resultatet, scenariet og motorens eksporter, eller kopiér et link med det præcise scenarie, eller en iframe til en kursusside eller en wiki.

js-adv-tour-share-title = Del eller eksportér

js-adv-tour-skip = Spring over

js-adv-tour-source-body = Det fulde scenarie i TOML. Det, du kører, er præcis det, du kan dele og reproducere.

js-adv-tour-source-title = Eller redigér alt

js-adv-tour-tabs-body = Visninger vises, når resultatet understøtter dem: signal og bånd for jamming, vandfaldet for spektrum, missionens tidslinje for kampagner, dækningskort for konstellationer, holdover for ure, masker for telekommunikationens tidssynkronisering, 3D-baner, spor på jorden, sweeps samt motorens egen animation og rapport.

js-adv-tour-tabs-title = Hver visning af kørslen

js-adv-tracking-threshold-value = Sporingstærskel { $value }

js-adv-transport-label = Genafspilning: én scrubber styrer hvert panel i denne kørsel

js-adv-transport-sub = én scrubber styrer hvert panel i denne kørsel

js-adv-unpin-run = Frigør kørsel { $run }

js-adv-waterfall = Vandfald

js-adv-waterfall-note = Farven er effekt over modtagerens støjgulv. Navigationssignalerne ligger under dette gulv, så det, der lyser op, er jammerne. Afspil genafspilningen, eller træk i den, og båndene til højre viser, hvad modtageren stadig sporer i det øjeblik.

js-adv-waterfall-sub = effekttæthedsspektrum: frekvens på tværs, tid nedad

js-adv-waterfall-title = Vandfald, { $name }

js-adv-webassembly-unavailable = WebAssembly er ikke tilgængelig

js-app-all-questions = Alle spørgsmål

js-app-anim-frame-title = Animation af denne kørsel, skrevet af motoren

js-app-anim-html-player = HTML-afspiller

js-app-anim-html-player-title = Afspilleren i én enkelt fil, som motoren skrev den

js-app-anim-load-failed = Den optagede animation kunne ikke indlæses ({ $reason }).

js-app-anim-loading = Indlæser den optagede animation…

js-app-anim-none = Der er ingen optaget animation for dette scenarie.

js-app-anim-note = Motoren skriver en animation af enhver kørsel med en tidsakse: en selvafspillende SVG og en HTML-afspiller i én enkelt fil med egne knapper til afspilning og spoling. Browserudgaven indeholder ikke denne skrivefunktion, så det her er den fil, som den native kommandolinjemotor skrev for det medfølgende scenarie.

js-app-anim-svg = Animeret SVG

js-app-anim-svg-title = Den selvafspillende SVG, som motoren skrev den

js-app-axis-averaging-time = middelværdidannelsestid τ (s)

js-app-axis-observation-interval = observationsinterval τ (s)

js-app-axis-value = værdi

js-app-badge-modelled = { $n } beregnet ud fra en model

js-app-badge-recorded = Optaget

js-app-badge-validated = { $n } kontrolleret mod en uafhængig reference

js-app-band-carrier = Bærebølge

js-app-band-carrier-unset = ikke angivet i dette scenarie

js-app-band-chip-rate = Chiprate

js-app-band-jammer-bandwidth = Jammerens båndbredde

js-app-band-jammer-mhz = jammer { $mhz } MHz

js-app-band-jammer-power = Jammerens effekt

js-app-band-jammer-type = Jammertype

js-app-band-main-lobe = signalets hovedlobe

js-app-band-no-carrier-note = Motoren beregner jammer-til-signal-forholdet ud fra linkbudgettet. Dette scenarie angiver ingen bærefrekvens, så der tegnes intet spektrum.

js-app-band-satellites = Satellitter

js-app-band-svg-label = Signal- og jammerbånd omkring bærebølgen

js-app-band-tracking-threshold = Sporingstærskel

js-app-browse-all-title = Alle { $n } scenarier

js-app-browse-area-kicker =
    { $n ->
        [one] Område · { $n } scenarie
       *[other] Område · { $n } scenarier
    }

js-app-browse-area-lede = Vælg ét: det åbner straks på sit resultat.

js-app-browse-evidence = De motormetoder, dets scenarier kører, har { $validated } rækker, der er kontrolleret mod en uafhængig reference, og { $modelled } rækker, der er beregnet ud fra en model, i verifikationsmatrixen.

js-app-browse-evidence-title = Evidensen bag dette område.

js-app-browse-kicker = Gennemse

js-app-browse-lede = Søg, eller vælg et område. Hvert scenarie åbner straks på sit resultat.

js-app-browse-validated-examples = Kontrolleret mod en uafhængig reference, for eksempel: { $examples }.

js-app-browser-cannot-run = Browserudgaven kan ikke køre dette scenarie.

js-app-btn-all-exports = Alle eksporter

js-app-btn-all-exports-title = Alle eksporter af denne kørsel, også motorens egne formater

js-app-btn-compare-pinned = Sammenlign fastgjorte kørsler

js-app-btn-copy-embed = Kopiér indlejringskode

js-app-btn-copy-link = Kopiér et link til netop dette scenarie

js-app-btn-figure-png = Figur (PNG)

js-app-btn-figure-png-title = Diagrammet på skærmen som en bitmap i høj opløsning

js-app-btn-figure-svg = Figur (SVG)

js-app-btn-figure-svg-title = Diagrammet på skærmen med sin titel, motorversion og DOI

js-app-btn-pin-compare = Fastgør denne kørsel til sammenligning

js-app-btn-pin-count = Fastgør denne kørsel ({ $n } fastgjort)

js-app-btn-report-html = Reproducerbar rapport (HTML)

js-app-btn-report-html-title = Én offlinefil: oversigt, tal med evidensniveauer, diagrammer og det præcise scenarie

js-app-btn-result-json = Resultatdata (JSON)

js-app-btn-result-json-title = Motorens komplette output for denne kørsel

js-app-btn-run-history = Kørselshistorik

js-app-btn-scenario-toml = Scenariefil (TOML)

js-app-btn-scenario-toml-title = Det præcise input til denne kørsel

js-app-btn-table-csv = Tabel (CSV)

js-app-btn-table-csv-title = Præcis de samme bytes, som kommandolinjeværktøjet skriver som { $file }

js-app-bytes =
    { $n ->
        [one] { $n } bytes
       *[other] { $n } bytes
    }

js-app-cap-sub = { $areas } områder, { $total } scenarier klar til at køre. Hvert område viser et rigtigt optaget resultat og sammensætningen af evidensen bag det: andelen af dets motormetoder, der er kontrolleret mod en ekstern reference.

js-app-chain-hint = hvert trins output føder det næste

js-app-chain-note = Ét system fulgt gennem hvert trin i motoren. Tabellen nedenfor viser hvert tal, som et trin beregnede, og som det næste trin brugte.

js-app-chain-stage = Trin { $n }

js-app-chain-values-handed =
    { $n ->
        [one] { $n } værdi givet videre
       *[other] { $n } værdier givet videre
    }

js-app-chart-allan-deviation = Allan-deviation

js-app-chart-cn0-by-satellite = Effektiv C/N0 pr. satellit

js-app-chart-default-title = Kshana-diagram

js-app-chart-ground-track = Sporet på jorden

js-app-chart-holdover-title = Holdover mod et tidsbudget

js-app-chart-mtie-title = MTIE (maksimal tidsintervalfejl)

js-app-chart-not-drawn = Dette diagram kunne ikke tegnes.

js-app-chart-scenario-hash = scenarie { $hash }

js-app-chart-stability-title = Urets stabilitet (overlappende Allan-deviation)

js-app-chart-tdev-title = TDEV (tidsdeviation)

js-app-chip-failed-title = WebAssembly kunne ikke starte her. Viser rigtige optagede kørsler af de medfølgende scenarier.

js-app-chip-failed-title-reason = WebAssembly kunne ikke starte her ({ $reason }). Viser rigtige optagede kørsler af de medfølgende scenarier.

js-app-chip-live = Live motor · v{ $version }

js-app-chip-live-title = Kshana-motoren kører i denne browser som WebAssembly

js-app-chip-loading = Indlæser motoren

js-app-chip-loading-title = Motoren downloades. Optagede resultater vises i mellemtiden.

js-app-chip-recorded = Optagede kørsler · v{ $version }

js-app-chip-unavailable = Motoren er ikke tilgængelig

js-app-cli-note = Installér med { $command }. Kørslen skriver { $file }, et diagram og en rapport.

js-app-cli-only-title = Denne kører i kommandolinjen, ikke i browseren.

js-app-cli-save-comment = # gem scenariefilen nedenfor som { $file }, og kør så

js-app-cmd-advanced = Vis alle indstillinger (avancerede indstillinger)

js-app-cmd-browse = Gennemse alle scenarier

js-app-cmd-compare = Sammenlign de fastgjorte kørsler

js-app-cmd-embed = Kopiér indlejringskode

js-app-cmd-exports = Download resultaterne (eksport)

js-app-cmd-history = Åbn kørselshistorik

js-app-cmd-home = Gå til åbningsskærmen

js-app-cmd-how = Sådan beregnes det

js-app-cmd-pin = Fastgør denne kørsel til sammenligning

js-app-cmd-report = Download rapporten

js-app-cmd-research = Kode, data og citation (til forskere)

js-app-cmd-reset = Nulstil scenarieteksten

js-app-cmd-run = Kør scenariet

js-app-cmd-share = Kopiér delingslink

js-app-cmd-theme = Skift mellem lyst og mørkt tema

js-app-cmd-tour = Start den guidede rundvisning

js-app-compare-deltas = Forskellene er i forhold til kørsel A. Grøn markerer den bedste værdi for hvert tal.

js-app-compare-none = Disse kørsler har ingen sammenlignelige kvalitetsmål. Fastgør kørsler af samme scenariefamilie for at se tal og forskelle.

js-app-compare-pin-two = Fastgør mindst to kørsler for at sammenligne dem side om side. Fastgør en kørsel, ændr en parameter eller vælg et andet scenarie i samme familie, kør det, og fastgør igen.

js-app-compare-run-head = { $letter } · kørsel { $id }

js-app-coverage-cell-note = Hver celle er ét gitterpunkt på { $body }, bedømt over hver epoke i kørslen.

js-app-coverage-dots-of = af

js-app-coverage-dots-post = satellitter, fløjet langs deres spor på jorden; afspil genafspilningen for at flytte dem.

js-app-coverage-dots-pre = Prikkerne er

js-app-coverage-field-label = Felt, der skal vises på kortet

js-app-coverage-map = Dækningskort

js-app-coverage-map-select = Kort

js-app-coverage-over = over

js-app-coverage-title = { $field } over { $body }

js-app-crumb-all-scenarios = Alle scenarier

js-app-crumb-area = Område

js-app-crumb-search = Søgning: { $query }

js-app-crumb-studio = Studio

js-app-download-label = Download

js-app-edited-cli-only = Redigeret: dette scenarie kører kun i kommandolinjemotoren.

js-app-edited-needs-engine = Redigeret: kræver motor { $need }.

js-app-edited-needs-live = Redigerede scenarier kræver live motoren.

js-app-embed-copied = Indlejringskode kopieret.

js-app-engine-chart = Motordiagram

js-app-engine-chart-alt = Motordiagram for denne kørsel

js-app-engine-could-not-start = Motoren kunne ikke starte: { $reason }. Server denne mappe over HTTP (for eksempel { $command }) i stedet for at åbne filen direkte.

js-app-engine-failed = Motoren kunne ikke indlæses ({ $reason }).

js-app-engine-file-http = Motorfilen returnerede HTTP { $status }.

js-app-engine-no-recordings = Motoren kunne ikke indlæses ({ $reason }), og der blev ikke fundet optagede kørsler.

js-app-entries-count =
    { $n ->
        [one] { $n } post
       *[other] { $n } poster
    }

js-app-ev-aria = { $validated } kontrollerede og { $modelled } modelberegnede rækker i verifikationsmatrixen

js-app-ev-title = { $validated } kontrollerede · { $modelled } modelberegnede rækker i verifikationsmatrixen

js-app-ev-validated = kontrolleret

js-app-export-card-title = Eksport som { $format }

js-app-export-checking = Undersøger, hvilke efemeridformater denne kørsel kan eksportere…

js-app-export-csv-desc = Præcis de samme bytes, som kommandolinjeværktøjet skriver som { $file }.

js-app-export-csv-title = Reproducerbarhedstabel

js-app-export-engine-loading = Efemerideeksporterne vises her, når motoren er indlæst.

js-app-export-json-desc = Motorens komplette output for denne kørsel, inklusive enheder og proveniens.

js-app-export-json-title = Fuldt resultatdokument

js-app-export-not-recorded = Denne eksport er stor og blev derfor ikke optaget. Den kræver live motoren.

js-app-export-oem-desc = CCSDS OEM 2.0 (Orbit Ephemeris Message) til GMAT, Orekit eller STK

js-app-export-omm-desc = CCSDS OMM (Orbit Mean-elements Message) katalog

js-app-export-report-desc = Én offlinefil: oversigt, tal med deres evidensniveauer, hvert diagram og den præcise scenarietekst, stemplet med motorversion og scenariehash.

js-app-export-report-title = Reproducerbar rapport

js-app-export-sp3-desc = SP3-c præcis efemeride for denne konstellation

js-app-export-toml-desc = Den præcise input til denne kørsel. Kør den igen hvor som helst med kommandolinjeværktøjet eller Python- og npm-pakkerne.

js-app-export-toml-title = Scenariefil

js-app-export-too-large = { $desc }. For stor til at optage: kræver live motoren.

js-app-fields-more = { $n } flere

js-app-fields-none = ingen

js-app-fields-none-hint = Ingen andre enkeltstående tal at ændre her. Redigér filen under »Til forskere«.

js-app-fields-top-of-file = filens begyndelse

js-app-find-matches =
    { $n ->
        [one] { $n } guidet kontrol og { $m } af { $total } felter matcher »{ $query }«.
       *[other] { $n } guidede kontroller og { $m } af { $total } felter matcher »{ $query }«.
    }

js-app-find-none = Intet felt i dette scenarie matcher »{ $query }«. Søg i alle scenarier med bibliotekssøgningen.

js-app-geo-sub = { $name } · { $features } af { $total } elementer tegnet · optaget med den native motor

js-app-geojson-title = GeoJSON-eksport: { $name }

js-app-gt-highlighted = Fremhævet: satellit, der er synlig fra stationen.

js-app-gt-peak-doppler = Maksimal Doppler { $value } Hz.

js-app-gt-peak-elevation = Maksimal elevation { $value }°.

js-app-health-check-tuning = kontrollér afstemningen

js-app-health-consistent = konsistent

js-app-health-nees-band = NEES { $mean } (95 %-bånd { $lo }–{ $hi }, mål 2.0)

js-app-health-nis-band = NIS { $mean } (95 %-bånd { $lo }–{ $hi }, mål 1.0)

js-app-heat-map-label = Varmekort for { $metric }

js-app-hero-clock = { $elapsed } af { $total }

js-app-hero-mask = { $deg }° elevationsmaske

js-app-hero-places =
    { $n ->
        [one] { $n } sted
       *[other] { $n } steder
    }

js-app-hero-positions-only = Kun satellitpositioner: ingen signaleffekt, ingen satellitsundhed og intet terræn.

js-app-hero-ramp = { $lo } til { $hi } { $field }

js-app-hero-ramp-over = { $lo } til { $hi } { $field }, over { $duration }

js-app-hero-recorded-bare = Optaget resultat

js-app-hero-satellites =
    { $n ->
        [one] { $n } satellit
       *[other] { $n } satellitter
    }

js-app-hero-steps =
    { $n ->
        [one] { $n } tidstrin
       *[other] { $n } tidstrin
    }

js-app-hist-runs = { $n } kørsler.

js-app-history-pin = Fastgør

js-app-history-restore = Gendan

js-app-history-restored = Kørsel { $id } gendannet.

js-app-history-run = kørsel { $id } · { $time }

js-app-hit-in-scenario = i { $title }

js-app-hit-native-note = optaget kørsel, native motor

js-app-hit-setting-meta = { $area } · indstilling { $name }

js-app-ho-budget = budget

js-app-ho-engine-budget = Motorens holdover ved scenariets budget ({ $budget } { $unit }): { $duration }

js-app-ho-engine-budget-bare = Motorens holdover ved scenariets budget: { $duration }

js-app-ho-error-after-loss = fejl, efter at GNSS gik tabt ved t = { $t } s

js-app-ho-error-since-fix = fejl siden den seneste positionsbestemmelse

js-app-ho-stays-inside = holder sig inden for dette budget i hele optagelsen

js-app-ho-until-breached = indtil budgettet overskrides

js-app-hover-classical = klassisk

js-app-hover-quantum = kvante

js-app-how-checks = (kontrollerer: { $requirement })

js-app-how-matrix = De motormetoder, dette scenarie kører, har { $validated } rækker, der er kontrolleret mod en uafhængig reference, og { $modelled } rækker, der er beregnet ud fra en model, i verifikationsmatrixen:

js-app-how-matrix-partner = De motormetoder, dette scenarie kører, har { $validated } rækker, der er kontrolleret mod en uafhængig reference, og { $modelled } rækker, der er beregnet ud fra en model, i verifikationsmatrixen, og { $partner } ejet af partnere:

js-app-how-mix-chip = { $validated } kontrollerede · { $modelled } modelberegnede

js-app-how-more-notes =
    { $n ->
        [one] { $n } note mere fra scenariefilen
       *[other] { $n } noter mere fra scenariefilen
    }

js-app-how-more-rows =
    { $n ->
        [one] { $n } række mere i verifikationsmatrixen (siden Evidens på webstedet).
       *[other] { $n } rækker mere i verifikationsmatrixen (siden Evidens på webstedet).
    }

js-app-how-no-header = Denne scenariefil har ingen overskriftsnote. Motoroversigten nedenfor siger, hvad der blev kørt.

js-app-how-no-matrix-row = Endnu ingen række i verifikationsmatrixen nævner dette scenaries motortype.

js-app-how-no-sources = Scenariefilen citerer ingen kilde, og ingen kontrolleret række i matrixen dækker dens type.

js-app-how-own-label = Denne kørsels egen etiket: { $label }

js-app-how-per-figure = Pr. tal, fra motorens figure_tiers-blok: { $validated } kontrolleret, { $modelled } modelberegnet. Hvert tals evidensniveau findes i visningen Oversigt.

js-app-install-copy = Kopiér: { $command }

js-app-install-label = Installér v{ $version }

js-app-interop-no-file = Motoren skrev ingen fil i dette format for denne kørsel.

js-app-interop-not-apply = Gælder ikke for dette scenarie: { $reason }.

js-app-interop-not-bundled = Medfølger ikke her (størrelse): kommandoen ovenfor skriver den.

js-app-interop-note = Motoren skriver en kørsels geometri og signalsamples i formater, som andre værktøjer åbner: CZML til Cesium, KML (Keyhole Markup Language) til Google Earth, GeoJSON til kort, STK-efemeride-filer (.e) og SigMF-optagelser (Signal Metadata Format). Browserudgaven indeholder ikke disse skrivefunktioner, så filerne nedenfor er dem, som den native kommandolinjemotor skrev for det medfølgende scenarie.

js-app-job-running = Kører

js-app-job-sweeping = Sweeper

js-app-js-range-label = J/S-område

js-app-js-range-value = { $lo } til { $hi } dB

js-app-latest-event-at = Seneste hændelse kl.

js-app-legend-all = motorfunktioner er kontrolleret i hele verifikationsmatrixen; { $modelled } er beregnet ud fra en model, og { $partner } ejes af partnere.

js-app-legend-count = { $validated } af { $total }

js-app-load-failed = Kunne ikke indlæse { $file }.

js-app-mask-envelope = Omhyllingskurve for holdover-tidsfejl ({ $source })

js-app-mask-exceeded-after = overskredet efter { $duration }

js-app-mask-limit = grænse { $value } ns

js-app-mask-not-exceeded = ikke overskredet

js-app-meta-engine = motor

js-app-meta-file = fil

js-app-meta-scenario = scenarie

js-app-meta-seed = seed

js-app-meta-shared-link = delt link

js-app-meta-time = tid

js-app-mission-timeline = Missionens tidslinje

js-app-native-edited-notice = Den optagede kørsel er af den medfølgende fil, så en redigeret kopi kan ikke vises her: kør den med kommandolinjeværktøjet, eller brug Nulstil for at se optagelsen.

js-app-native-recorded = Det, du ser, er en kørsel optaget med den native kommandolinjemotor v{ $version }, vist uændret. Den kører ikke igen, når du redigerer.

js-app-native-recorded-c = Det, du ser, er en kørsel optaget med den native kommandolinjemotor v{ $version } ved at køre { $command }, vist uændret. Den kører ikke igen, når du redigerer.

js-app-native-recorded-p = Det, du ser, er en kørsel optaget med den native kommandolinjemotor v{ $version } ({ $platform }), vist uændret. Den kører ikke igen, når du redigerer.

js-app-native-recorded-pc = Det, du ser, er en kørsel optaget med den native kommandolinjemotor v{ $version } ({ $platform }) ved at køre { $command }, vist uændret. Den kører ikke igen, når du redigerer.

js-app-needs-live-engine = Dette kræver live motoren.

js-app-needs-newer-engine = Kræver en nyere motor.

js-app-needs-newer-why = Dette scenarie kræver motor { $need } eller nyere; motoren, der kører her, er v{ $version }.

js-app-no-chart-export = Denne visning har intet diagram at eksportere.

js-app-no-event-yet = Endnu ingen hændelse på dette tidspunkt.

js-app-no-recorded-run = Der er ingen optaget kørsel for dette scenarie. Det kræver live motoren.

js-app-no-recording-here = Der er ingen optagelse af det her.

js-app-no-summary = (dette scenarie udgiver ingen oversigt på én linje)

js-app-noise-floor = støjgulv { $value }

js-app-not-in-browser = Dette scenarie kører ikke i browseren.

js-app-notice-shared-needs-live = Dette link indeholder sit eget scenarie, som kræver live motoren. Åbn det på kshana.dev.

js-app-on-one-clock = på ét ur

js-app-only-bundled-recording = Kun optagelsen af den medfølgende fil kan vises: brug Nulstil for at se den, eller kør en redigeret kopi med motor { $need }.

js-app-opening-result = Åbner resultatet…

js-app-orbit-canvas-label = Interaktiv 3D-visning af det propagerede spor

js-app-orbit-epoch-set = Drejet til kørslens epoke.

js-app-orbit-epoch-unset = Denne kørsel angiver ingen epoke, så Jordens rotationsvinkel er ikke meningsfuld her.

js-app-orbit-img-alt = Ortografisk visning af det propagerede spor

js-app-orbit-note = Træk for at rotere, rul eller knib for at zoome. Jorden i målestok, billeder fra NASA Blue Marble.

js-app-orbit-static = Statisk visning (3D-biblioteket kunne ikke indlæses her).

js-app-overlay-note = Fuldt optrukne linjer er kørsel A, stiplede linjer kørsel B, på de samme akser.

js-app-overlay-pinned = Overlejring af fastgjorte kørsler

js-app-overlay-title = { $title }: kørsel { $a } (A) mod kørsel { $b } (B)

js-app-overlay-with-diff = Overlejring med forskellen B − A

js-app-pal-area = Område: { $label }

js-app-pal-nothing = Intet matcher

js-app-pal-scenario-count =
    { $n ->
        [one] { $n } scenarie
       *[other] { $n } scenarier
    }

js-app-pal-sec-areas = Områder

js-app-pal-sec-commands = Kommandoer

js-app-pal-sec-scenarios = Scenarier

js-app-pal-sec-settings = Indstillinger

js-app-pal-sec-views = Visninger

js-app-pal-setting = Indstilling: { $label }

js-app-pal-view = Visning: { $label }

js-app-panel-close = Luk

js-app-panel-close-full = Luk fuld skærm

js-app-panel-expand = Udvid

js-app-panel-expand-full = Udvid dette panel til fuld skærm

js-app-panel-expand-title = Vis dette panel i fuld skærm (Escape lukker det)

js-app-params-hint = Ændr en værdi, og kør så igen. Svaret og diagrammet opdateres på stedet.

js-app-phase = Fase:

js-app-pin-already = Den kørsel er allerede fastgjort.

js-app-pin-compare = { $n } kørsler fastgjort. Åbner Sammenlign.

js-app-pin-first = Kørsel { $id } fastgjort. Ændr en parameter, kør igen, og fastgør så også den kørsel.

js-app-pin-label = { $letter } · { $title } · kørsel { $id }

js-app-plan-view = Planvisning

js-app-plan-view-at = ved

js-app-player-pause = Sæt genafspilningen på pause

js-app-player-pause-mission = Sæt missionens genafspilning på pause

js-app-player-pause-orbit = Sæt banens genafspilning på pause

js-app-player-pause-waterfall = Sæt vandfaldets genafspilning på pause

js-app-player-play = Afspil genafspilningen

js-app-player-play-mission = Afspil missionens genafspilning

js-app-player-play-orbit = Afspil banens genafspilning

js-app-player-play-waterfall = Afspil vandfaldets genafspilning

js-app-player-position = Position i genafspilningen

js-app-player-position-mission = Position i missionens genafspilning

js-app-player-position-orbit = Position i banens genafspilning

js-app-player-position-waterfall = Position i vandfaldets genafspilning

js-app-png-button-title = Bitmap i høj opløsning til slides og dokumenter

js-app-png-export-failed = PNG-eksport mislykkedes: { $reason }

js-app-py-note = Installér med { $command }.

js-app-ran-locally = Kørt lokalt kl. { $time }, kørsel { $n }.

js-app-ran-locally-took = Kørt lokalt kl. { $time }, kørsel { $n }, { $took } s.

js-app-receiver-at = Modtager ved t =

js-app-recorded-edit-notice = WebAssembly er blokeret på denne side, så siden viser rigtige kørsler af de medfølgende scenarier optaget med motor v{ $version }. Redigerede scenarier, sweeps og nye eksporter kræver live motoren: åbn kshana.dev, eller server denne mappe lokalt. Nulstil gendanner det optagede scenarie.

js-app-recorded-intro = WebAssembly er blokeret på denne side, så siden viser rigtige kørsler af de medfølgende scenarier, optaget med motor v{ $version }. Redigering, sweeps og nye eksporter kræver live motoren på kshana.dev.

js-app-recorded-shown-native = Optaget kørsel vist kl. { $time } (native motor).

js-app-recorded-shown-needs = Optaget kørsel vist kl. { $time } (kræver motor { $need }).

js-app-recorded-shown-run = Optaget kørsel vist kl. { $time }, kørsel { $n }.

js-app-recorded-shown-took = Optaget kørsel vist kl. { $time }, kørsel { $n }, { $took } s.

js-app-recorded-with-commit = Det, du ser, er kørslen optaget med et motorbuild ved commit { $commit }, vist uændret; den kører ikke igen her.

js-app-recorded-with-engine = Det, du ser, er kørslen optaget med motor v{ $version }, vist uændret; den kører ikke igen her.

js-app-recording-edited-warning = Du har redigeret scenariet: denne optagelse er af den medfølgende fil, ikke af din redigering. Kør kommandoen på din egen fil for at få din.

js-app-replay = Genafspilning

js-app-report-downloaded = Rapport downloadet.

js-app-report-frame-title = Kørselsrapport skrevet af motoren

js-app-report-html = Rapport (HTML)

js-app-report-html-title = Rapportfilen, som motoren skrev den

js-app-report-load-failed = Den optagede rapport kunne ikke indlæses ({ $reason }).

js-app-report-loading = Indlæser den optagede rapport…

js-app-report-none = Der er ingen optaget rapport for dette scenarie.

js-app-report-note = Hver kørsel i kommandolinjen skriver en rapport: oversigt, input, resultater, diagrammet, hvad der er kontrolleret mod en uafhængig reference, og hvad der er beregnet ud fra en model, samt en reproducerbarhedsjournal. Browserudgaven indeholder ikke denne skrivefunktion, så det her er den rapport, som den native kommandolinjemotor skrev for det medfølgende scenarie. Studioets egen rapport om kørslen på skærmen findes under Eksport.

js-app-report-open-tab = Åbn i en ny fane

js-app-report-open-tab-title = Åbn rapporten for sig selv

js-app-report-orbit-title = Bane (jordcentreret inertisystem, ortografisk)

js-app-report-stability-short = Urets stabilitet

js-app-report-stability-title = Urets stabilitet (Allan-deviation)

js-app-run-again = Kør igen

js-app-run-cancelled = Kørslen blev annulleret.

js-app-run-cancelled-previous = Kørslen blev annulleret. Det forrige resultat vises stadig.

js-app-run-failed = Kørslen mislykkedes. Se meddelelsen i resultaterne.

js-app-run-when-ready = Kør, når motoren er klar

js-app-run-will-run = Kører, når motoren er klar

js-app-run-with-settings = Kør med disse indstillinger

js-app-search-more-matches =
    { $n ->
        [one] { $n } match mere: tilføj et ord for at indsnævre dem.
       *[other] { $n } match mere: tilføj et ord for at indsnævre dem.
    }

js-app-search-nothing = Intet matcher »{ $query }«. Prøv et ord som jamming, ur, måne, bane, maske eller PDOP.

js-app-search-scenarios = Scenarier ({ $n })

js-app-search-settings =
    { $n ->
        [one] Indstillinger med navne som »{ $query }«: i { $n } scenarie
       *[other] Indstillinger med navne som »{ $query }«: i { $n } scenarier
    }

js-app-search-settings-hint = Hver åbner scenariet med den indstilling fremhævet, klar til at blive ændret.

js-app-share-copied = Delingslink kopieret. Det indeholder det præcise scenarie.

js-app-share-in-address-bar = Linket er placeret i adresselinjen.

js-app-share-link-sub = Det kører præcis, som det blev delt.

js-app-share-link-title = Et scenarie åbnet fra et delingslink

js-app-shared-scenario = Delt scenarie

js-app-shown-unchanged = Vist uændret.

js-app-solar-note = Hver prik er et legeme ved kørslens epoke, og hver kurve er det banespor, motoren beregnede for det. En stiplet linje er et link, som scenariet beder om. Vælg en planet for at se dens måner omkring den.

js-app-solar-which-bodies = Hvilke legemer der skal tegnes

js-app-source-live = Live resultat · motor v{ $version }

js-app-source-native = Optaget resultat, native motor · v{ $version }

js-app-source-recorded = Optaget resultat · v{ $version }

js-app-source-recorded-loading = Optaget resultat · v{ $version } · motoren indlæses

js-app-spectrum-row-note = Spektret langs den vandfaldsrække, genafspilningen er på.

js-app-spectrum-row-title = Spektrum langs den række, der vises

js-app-spectrum-which-part = Hvilken del af spektret

js-app-status-last-run-took = Den seneste kørsel tog { $ms } ms i din browser. Intet uploades.

js-app-status-loading-kept = Motoren indlæses stadig. Dine ændringer bevares og køres, så snart den er klar.

js-app-status-loading-recorded = Motoren indlæses stadig. Resultatet ovenfor er en optaget kørsel.

js-app-status-not-run-yet = Dine ændringer er ikke kørt endnu.

js-app-status-runs-in-browser = Kører i din browser. Intet uploades.

js-app-status-wasm-blocked = WebAssembly er blokeret her, så dette viser optagede kørsler af de medfølgende scenarier.

js-app-stepper-decrease = Mindsk { $key }

js-app-stepper-increase = Øg { $key }

js-app-subtabs-label = Felter i denne visning (telefon)

js-app-svg-button-title = Vektordiagram med titel og proveniens

js-app-sweep-cancelled = Sweep annulleret.

js-app-sweep-done-1d = Sweepede { $done } af { $total } kørsler lokalt på { $duration }.

js-app-sweep-done-2d = Sweepede { $total } kørsler ({ $a } × { $b }) lokalt på { $duration }.

js-app-sweep-enter-range = Angiv et numerisk interval.

js-app-sweep-enter-range-2 = Angiv et numerisk interval for den anden parameter.

js-app-sweep-failed = Sweep mislykkedes: { $reason }

js-app-sweep-interrupted = Sweepet blev afbrudt af en ny kørsel.

js-app-sweep-needs-live = Et sweep kører motoren mange gange, så det kræver live motoren.

js-app-sweep-none-line = Ingen (kurvediagram)

js-app-sweep-nothing = Intet at sweepe for dette scenarie.

js-app-sweep-progress = Sweeper kørsel { $n } af { $total }…

js-app-sweep-status-done = Sweepede { $total } kørsler kl. { $time }.

js-app-sweep-title-1d = { $metric } mod { $knob }

js-app-sweep-title-2d = { $metric } over { $knob1 } og { $knob2 }

js-app-sweep-wait = Vent, til den aktuelle kørsel er færdig, og sweep så.

js-app-tab-animation = Animation

js-app-tab-compare = Sammenlign

js-app-tab-exports = Eksport og rapport

js-app-tab-ground = Sporet på jorden

js-app-tab-holdover = Holdover

js-app-tab-json = JSON

js-app-tab-masks = Tidsmasker

js-app-tab-orbit = 3D-bane

js-app-tab-overview = Oversigt

js-app-tab-report = Motorrapport

js-app-tab-signal = Signal og bånd

js-app-tab-stability = Stabilitet

js-app-tab-sweep = Sweep

js-app-tab-timeseries = Tidsserie

js-app-th-at-tau = Ved τ eller tid

js-app-th-body = Legeme

js-app-th-clock = Ur

js-app-th-figure = Tal

js-app-th-file = Fil

js-app-th-format = Format

js-app-th-key-figure = Nøgletal

js-app-th-light-time = Lystid i én retning fra { $observer }

js-app-th-limit = Grænse

js-app-th-margin = Margin

js-app-th-mask-or-budget = Maske eller budget

js-app-th-metric = Måleværdi

js-app-th-metric-2 = Måleværdi

js-app-th-orbital-period = Omløbstid

js-app-th-provenance = Proveniens

js-app-th-size = Størrelse

js-app-th-source = Kilde

js-app-th-sun-distance = Afstand fra Solen

js-app-th-tier = Evidensniveau

js-app-th-unit = Enhed

js-app-th-value = Værdi

js-app-th-value-2 = Værdi

js-app-th-value-3 = Værdi

js-app-th-verdict = Dom

js-app-th-what-it-is = Hvad det er

js-app-the-body = legemet

js-app-the-chain = Kæden

js-app-the-observer = observatøren

js-app-tile-browse-all = Gennemse alle { $n } scenarier

js-app-tile-browse-sub = Søg efter navn, spørgsmål eller indstilling

js-app-tile-preview-label = Optaget forhåndsvisning fra { $source }: { $title }

js-app-tile-scenario-count =
    { $n ->
        [one] { $n } scenarie
       *[other] { $n } scenarier
    }

js-app-timeline-chart-title = Missionens tidslinje: { $title }

js-app-timeline-note = Én scrubber styrer hvert diagram nedenfor. Hver fase kører almindelige scenarier; kampagnen læser deres output ind på ét tidsgitter. Skraverede bånd er faserne, lodrette streger hændelserne. Værdierne ovenfor er kampagnens kanaler på genafspilningstidspunktet.

js-app-toast-copied = Kopieret.

js-app-toast-copy-blocked = Kopiering er blokeret her.

js-app-toast-copy-blocked-select = Kopiering er blokeret her: markér teksten i stedet.

js-app-toast-json-copied = JSON kopieret.

js-app-toast-loading-run = Motoren indlæses stadig. Din kørsel starter, så snart den er klar.

js-app-toast-no-scenario = Der findes ikke noget scenarie ved navn { $name } her. Det er de nærmeste match.

js-app-toast-not-single-number = Den indstilling er ikke ét enkelt tal i dette scenarie: redigér den i scenariefilen.

js-app-toast-one-pinned = Én kørsel er fastgjort. Ændr en indstilling, kør igen, og fastgør den kørsel for at sammenligne de to.

js-app-toast-opened-advanced = Åbnet med de indstillinger, du ændrede i den avancerede visning.

js-app-toast-opened-at = Åbnet ved { $label }. Ændr det, og kør så igen.

js-app-toast-scenario-copied = Scenarie kopieret.

js-app-tour-answer-body = En almindelig sætning aflæst af resultatet, og hvor resultatet kommer fra: en live kørsel i din browser eller en kørsel optaget med den samme motor.

js-app-tour-answer-title = Svaret først

js-app-tour-back = Tilbage

js-app-tour-done = Færdig

js-app-tour-eyebrow = Guidet rundvisning

js-app-tour-figures-body = Hvert kort er aflæst af motorens resultatdokument.

js-app-tour-figures-title = Tallene, der besvarer det

js-app-tour-how-body = Metoden, evidensniveauet og referencerne.

js-app-tour-how-title = Sådan beregnes det

js-app-tour-next = Næste

js-app-tour-research-body = Kommandolinjen og Python, så du selv kan køre det, dataene og tallene, og hvordan det citeres.

js-app-tour-research-title = Til forskere

js-app-tour-search-body = ⌘K finder ethvert scenarie, område, indstilling, visning eller kommando.

js-app-tour-search-title = Søg

js-app-tour-settings-body = De fem indstillinger, der betyder mest for dette spørgsmål. Ændr én, og kør så igen. Motoren kører i din browser; intet uploades.

js-app-tour-settings-title = Prøv andre indstillinger

js-app-tour-skip = Spring over

js-app-tour-views-body = Diagrammer, kort, genafspilninger, motorens egen rapport og eksporter. [ og ] skifter mellem visninger.

js-app-tour-views-title = Hver visning af kørslen

js-app-tracking-threshold = Sporingstærskel

js-app-transport-hint = én scrubber styrer hvert panel i denne kørsel

js-app-transport-label = Genafspilning: én scrubber styrer hvert panel i denne kørsel

js-app-unpin-run = Frigør kørsel { $id }

js-app-waterfall = Vandfald

js-app-waterfall-hint = effekttæthedsspektrum: frekvens på tværs, tid nedad

js-app-waterfall-note = Farven er effekt over modtagerens støjgulv. Navigationssignalerne ligger under dette gulv, så det, der lyser op, er jammerne. Afspil genafspilningen, eller træk i den, og båndene til højre viser, hvad modtageren stadig sporer i det øjeblik.

js-app-waterfall-title = Vandfald, { $name }

js-app-webassembly-unavailable = WebAssembly er ikke tilgængelig

js-app-written-by-native = Skrevet af den native kommandolinjemotor v{ $version } ({ $platform }) med

js-cat-acm-link-question = Hvilken DVB-S2-tilstand holder linket langs hver passage, og hvor mange data flytter passagen? (modelberegnet)

js-cat-acm-link-title = Satellitnedlink med adaptiv kodning

js-cat-aocs-slew-mekf-question = Når regulatoren fødes af et attitudefilter og et gyroskop med bias, hvordan sammenligner drejningen sig så med tilfældet med den sande tilstand? (modelberegnet)

js-cat-aocs-slew-mekf-title = Drejning på et attitudeestimat

js-cat-aocs-slew-question = Får feedbackloven en drejning med stor vinkel til at falde til ro med fire hjul, og hvor hårdt arbejder hjulene? (reguleringssløjfen er kontrolleret mod en uafhængig reference; rumfartøjet er illustrativt)

js-cat-aocs-slew-title = Drejning med reaktionshjul

js-cat-aperture-duty-cycle-question = Når én apertur betjener både navigation og kommunikation, hvilket udfald koster det? (modelberegnet)

js-cat-aperture-duty-cycle-title = Aperturens driftscyklus

js-cat-araim-gps-galileo-question = Med GPS + Galileo og hypotesen om fejl i hele konstellationen, hvor tilgængelig er avanceret RAIM?

js-cat-araim-gps-galileo-title = ARAIM med to konstellationer

js-cat-araim-reference-check-question = Rammer motorens beskyttelsesniveauer de offentliggjorte gennemregnede eksempler fra Working Group C?

js-cat-araim-reference-check-title = ARAIM-referencekontrol

js-cat-ascent-losses-question = Hvor meget af en totrins løfteraketts ideelle hastighedstilvækst tager tyngdekraft, luftmodstand, styring og modtryk? (modelberegnet)

js-cat-ascent-losses-title = Tab under opsendelsens stigning

js-cat-attitude-budget-question = Hvad er det værst tænkelige forstyrrelsesmoment og pegefejlbudget?

js-cat-attitude-budget-title = Pegebudget

js-cat-automotive-urban-canyon-question = Gennem en underføring og en jammer ved vejkanten, holder en bil sig så inden for et budget på en halv vognbane? (modelberegnet)

js-cat-automotive-urban-canyon-title = Bil gennem en bykløft

js-cat-campaign-jam-spoof-holdover-integrity-question = Hvad sker der med én modtager gennem jamming, spoofing, tab af GNSS, en integritetsalarm og genopretning, på én tidslinje? (modelberegnet)

js-cat-campaign-jam-spoof-holdover-integrity-title = Kædet mission: jamming, spoofing, holdover, alarm

js-cat-campaign-monte-carlo-clock-holdover-question = Over mange kørsler med seed, svarer et frit løbende urs tidsfejl så til dets spredning på lukket form?

js-cat-campaign-monte-carlo-clock-holdover-title = Monte Carlo-holdover for ur

js-cat-campaign-optimize-link-budget-question = Over afstand og datahastighed, hvor efterlader et X-bånd-link præcis 3 dB margin?

js-cat-campaign-optimize-link-budget-title = Optimér et linkbudget

js-cat-campaign-shared-jammer-sea-road-question = Under én jammer, hvilken platform mister sin positionsbestemmelse: skibet 30 km væk eller bilen 50 km væk? (modelberegnet)

js-cat-campaign-shared-jammer-sea-road-title = Én jammer, et skib og en bil

js-cat-campaign-spectrum-holdover-integrity-question = En jammer tager to L-båndssignaler, uret går i holdover, og modtageren falder tilbage til Galileo alene: holder integritetsovervågningen stadig? (modelberegnet)

js-cat-campaign-spectrum-holdover-integrity-title = Spektrumdrevet mission

js-cat-campaign-sweep-jammer-power-question = Når en jammer 1 km væk skrues op fra 10 nW til 10 W, hvornår mister modtageren så sin positionsbestemmelse? (modelberegnet)

js-cat-campaign-sweep-jammer-power-title = Sweep af jammereffekt

js-cat-cislunar-arc-recovery-question = Genfinder en uafhængig mindste kvadraters estimator faktisk tilstanden ud fra den buelængde, som rangtesten forudsiger? (modelberegnet; langsom: omkring 15 s i en browser)

js-cat-cislunar-arc-recovery-title = Genfinding af en cislunar bue

js-cat-cislunar-observability-question = Hvor meget af et cislunart rumfartøjs tilstand gør en bue mellem satellitter observerbar?

js-cat-cislunar-observability-title = Cislunar observerbarhed

js-cat-clock-ensemble-question = Over mange støjtræk, hvilket konfidensbånd falder holdover i?

js-cat-clock-ensemble-title = Ensemble af ur-holdover

js-cat-clock-holdover-labsr-question = Hvordan sammenligner et strontium-optisk ur af laboratoriekvalitet sig med et chipskala-atomur i holdover?

js-cat-clock-holdover-labsr-title = Ur-holdover, optisk laboratorieur

js-cat-clock-holdover-question = Hvor længe kan et ur holde tiden, efter at GNSS falder ud?

js-cat-clock-holdover-title = Ur-holdover

js-cat-combined-altpnt-question = Hvad giver det at fusionere tre skalare kortkanaler i forhold til hver enkelt alene?

js-cat-combined-altpnt-title = Kombineret alt-PNT

js-cat-conflict-resilience-question = Hvordan forringes en lagdelt PNT-arkitektur under trusler fra jamming / spoofing / kinetiske angreb / cyberangreb? (modelberegnet)

js-cat-conflict-resilience-title = Modstandsdygtighed i konflikt

js-cat-constellation-multi-gnss-coverage-question = Med de fire globale systemer samlet, hvor mange satellitter er i sigte, og hvor god er geometrien, overalt på Jorden? (modelberegnet)

js-cat-constellation-multi-gnss-coverage-title = Fire GNSS-konstellationer, ét kort

js-cat-contact-schedule-question = For tre satellitter og tre stationer over 12 timer, hvilke passager beholder en konfliktfri plan, og hvor mange data flytter den? (modelberegnet)

js-cat-contact-schedule-title = Plan for jordkontakt

js-cat-domain-campaigns-label = Kampagner

js-cat-domain-campaigns-line = Kædede missioner, sweeps og Monte Carlo-kørsler på ét ur.

js-cat-domain-constellations-label = Konstellationsudformning

js-cat-domain-constellations-line = Udform en konstellation, og kortlæg dens dækning og PDOP (positionsmæssig præcisionsforringelse).

js-cat-domain-deepspace-label = Månen, cislunart rum og Mars

js-cat-domain-deepspace-line = Navigation og tid ved Månen, i det cislunare rum og ved Mars.

js-cat-domain-integrity-label = Integritet og positionsbestemmelse

js-cat-domain-integrity-line = Positionsbestemmelser, og om de kan stoles på: RAIM (modtagerens autonome integritetsovervågning) og dens avancerede form, ARAIM.

js-cat-domain-interference-label = Jamming og interferens

js-cat-domain-interference-line = Jammere mod modtagere til satellitnavigation: hvad der går tabt, og hvornår.

js-cat-domain-leo-label = Navigation i lav jordbane (LEO)

js-cat-domain-leo-line = Navigationssignaler, passager, meddelelser og positionsbestemmelser i lav jordbane.

js-cat-domain-leo-missions-label = LEO-missioner og undersøgelser

js-cat-domain-leo-missions-line = Undersøgelser og tjenester bygget på et lag i lav jordbane.

js-cat-domain-navigation-label = Inertial og alternativ navigation

js-cat-domain-navigation-line = Inertial-, terræn-, tyngde- og anden navigation uden satellitter.

js-cat-domain-orbits-label = Baner og GNSS-geometri

js-cat-domain-orbits-line = Banepropagering, efemerider og navigationssatellitternes geometri.

js-cat-domain-solar-label = Solsystemet

js-cat-domain-solar-line = Alle planeter og måner på ét tidspunkt, med lystider.

js-cat-domain-spaceops-label = Missionsanalyse og rumoperationer

js-cat-domain-spaceops-line = Passager, opsendelsesvinduer, genindtræden, link- og attitudebudgetter.

js-cat-domain-spectrum-label = Spektrum

js-cat-domain-spectrum-line = Vandfaldsdiagrammer af radiobåndet: jammere, signaler og det, modtageren sporer.

js-cat-domain-spoofing-label = Spoofing og signalsikkerhed

js-cat-domain-spoofing-line = Falske signaler og meaconing og de monitorer, der fanger dem.

js-cat-domain-studies-label = Kvante, afvejningsundersøgelser og interoperabilitet

js-cat-domain-studies-line = Kvantesensorer, afvejningsundersøgelser og interoperabilitetsformater.

js-cat-domain-timing-label = Ure og tidssynkronisering

js-cat-domain-timing-line = Ure uden satellitter: holdover, stabilitet, telekommasker, tidsoverførsel.

js-cat-earth-gnss-lunar-question = Kan en modtager nær Månen høre Jordens GNSS, og er det nogensinde nok til en positionsbestemmelse? (modelberegnet)

js-cat-earth-gnss-lunar-title = Jordens GNSS ved Månen

js-cat-entry-heating-stardust-question = Gengiver indtrædensmodellen den offentliggjorte maksimale deceleration for Stardust-prøvehjemtagningskapslen?

js-cat-entry-heating-stardust-title = Stardust-kapslens indtræden

js-cat-eo-coverage-question = Hvilken strimmelbredde, jordopløsning og genbesøgstid giver en EO-bane?

js-cat-eo-coverage-title = EO-dækning

js-cat-eo-radiometry-question = For et lille jordobservationskamera, hvilket signal-til-støj-forhold, hvilken MTF ved Nyquist og hvilken NIIRS giver en scene med 15 % reflektans? (modelberegnet)

js-cat-eo-radiometry-title = Kameraets radiometri og billedkvalitet

js-cat-ephemeris-question = Hvor er satellitten, og hvornår passerer den overhead?

js-cat-ephemeris-title = Sporet på jorden

js-cat-europa-surface-pnt-question = Kan en lander på Jupiters måne Europa positionsbestemmes ud fra en lille konstellation af relæer og en afstandsmåling fra Jorden? (modelberegnet)

js-cat-europa-surface-pnt-title = Lander på Europa

js-cat-fusion-pnt-coupled-question = Med ét stablet Kalman-filter over position, ur og accelerometerbias, hvordan kommer navigatoren så igennem et GNSS-udfald? (modelberegnet)

js-cat-fusion-pnt-coupled-title = Koblet sensorfusionsnavigator

js-cat-fusion-pnt-question = Hvad giver en enkelt fælles estimator på tværs af ur + position?

js-cat-fusion-pnt-title = Sensorfusion

js-cat-gnss-ins-aviation-question = Gennem et to minutter langt GNSS-udfald med en krængende drejning, hvor langt driver et tæt koblet INS af navigations- eller taktisk kvalitet? (modelberegnet)

js-cat-gnss-ins-aviation-title = Flys drejning gennem et GNSS-hul

js-cat-gnss-ins-maritime-question = Efter et fem minutter langt GNSS-udfald på et sejlende fartøj, der slingrer, hvor langt driver et INS af navigations- eller taktisk kvalitet? (modelberegnet)

js-cat-gnss-ins-maritime-title = Skib, der slingrer gennem et GNSS-udfald

js-cat-gnss-ins-question = Hvor godt glider en støttet inertinavigator gennem et GNSS-udfald?

js-cat-gnss-ins-rail-question = Gennem et dybt afgravet jernbanefag med to satellitter og derefter en tunnel, hvor langt driver et tæt koblet INS? (modelberegnet)

js-cat-gnss-ins-rail-title = Tog gennem et afgravet fag og en tunnel

js-cat-gnss-ins-title = GNSS/INS-fusion

js-cat-gnss-sim-container-terminal-skyline-question = Med kraner mod havet og stakke mod land, hvor mange satellitter er der tilbage, og hvad sker der med RAIM-beskyttelsen? (modelberegnet; repræsentativ horisontprofil)

js-cat-gnss-sim-container-terminal-skyline-title = Portalkran-truck på en containerkaj

js-cat-gnss-sim-raim-question = Hvordan former ionosfæren og troposfæren de rå pseudoafstande, og beskytter RAIM stadig?

js-cat-gnss-sim-raim-title = GNSS-målinger

js-cat-gnss-ssv-formation-heo-question = Hvor godt kender et filter den relative position af to rumfartøjer med en kilometers afstand, sammenlignet med at differensere deres absolutte positionsbestemmelser? (modelberegnet; en kørsel optaget med den native motor)

js-cat-gnss-ssv-formation-heo-title = Relativ navigation i formation, stærkt elliptisk bane

js-cat-gnss-ssv-heo-question = Hvad hører en stærkt elliptisk bane langs sin vej: signaler i sigte, bedste C/N0, hovedlobe mod sidelobe, DOP og strejfende signaler? (modelberegnet; en kørsel optaget med den native motor)

js-cat-gnss-ssv-heo-title = GNSS-signaler i en stærkt elliptisk bane

js-cat-gnss-ssv-lunar-weak-question = Hvad kan en modtager, der er udformet til de svageste signaler, bruge på vejen til Månen? (modelberegnet; en kørsel optaget med den native motor)

js-cat-gnss-ssv-lunar-weak-title = GNSS-signaler på en månetransfer, modtager til svage signaler

js-cat-gnss-ssv-nav-lunar-question = Hvor godt holder et filter om bord en månetransfer, målt mod den grænse, det selv angiver? (modelberegnet; en kørsel optaget med den native motor)

js-cat-gnss-ssv-nav-lunar-title = GNSS-filter om bord på en månetransfer

js-cat-gnss-ssv-shell-question = Hvor ofte hører et rumfartøj i geostationær højde mindst ét og mindst fire navigationssignaler, pr. konstellation og bånd? (modelberegnet; en kørsel optaget med den native motor)

js-cat-gnss-ssv-shell-title = GNSS-signaler over satellitterne: en skal ved 36 000 km

js-cat-gps-denied-gravity-nav-egm2008-question = På det virkelige EGM2008-tyngdefelt til grad 70, kan kortmatchning holde et spor uden GPS? (modelberegnet)

js-cat-gps-denied-gravity-nav-egm2008-title = Tyngdenavigation på det virkelige felt

js-cat-gps-denied-gravity-nav-question = Hvor langt driver positionen over en hel time uden GNSS, og kan et tyngdekort tøjle den?

js-cat-gps-denied-gravity-nav-title = Navigation uden GNSS

js-cat-gravity-map-error-mc-question = Efterhånden som det lagrede tyngdekort bliver mere støjfyldt, hvor ofte holder kortmatchning så stadig en positionsbestemmelse uden GPS inden for sit mål? (modelberegnet)

js-cat-gravity-map-error-mc-title = Monte Carlo af fejl i tyngdekort

js-cat-gravity-map-nav-question = Kan et koldatom-gravimeter holde positionen uden GNSS ved at matche det tyngdefelt, det flyver igennem?

js-cat-gravity-map-nav-title = Navigation med tyngdekort

js-cat-holdover-test-example-question = Træk antennen ud, bedøm holdover: en optagelse delt ved de to tidspunkter, operatøren angiver, hvert trin målt mod de ITU-T-masker, der er skrevet til det. (modelberegnet; optagelsen er opfundet til eksemplet)

js-cat-holdover-test-example-title = Holdover-test: en tidsfejlsoptagelse mod maskerne

js-cat-holdover-test-ptp4l-question = De samme fire trin aflæst af en ptp4l-servolog: hvor langt holder dæmonens egen offset sig fra maskerne, mens GNSS er væk? (modelberegnet; loggen er opfundet til eksemplet)

js-cat-holdover-test-ptp4l-title = Holdover-test: en linuxptp-log

js-cat-hybrid-optical-rf-question = Hvilken kontinuitet og integritet giver det at kombinere optisk og RF-PNT? (modelberegnet)

js-cat-hybrid-optical-rf-title = Optisk/RF-hybrid

js-cat-hybrid-pnt-question = Hvad giver en kombineret ur- og inertisuite?

js-cat-hybrid-pnt-title = Hybrid PNT

js-cat-hybrid-ukf-question = Er den tæt koblede UKF med 17 tilstande selvkonsistent (NEES + innovationshvidhed)? Et selvkonsistenstjek, ikke et krav om nøjagtighed.

js-cat-hybrid-ukf-title = Hybrid UKF med 17 tilstande

js-cat-impairment-eval-question = Hvor godt adskiller en detektor jamming / spoofing / flervejsudbredelse fra det nominelle? (modelberegnet ROC/AUC)

js-cat-impairment-eval-title = Evaluering af RF-forringelser

js-cat-imu-deadreckoning-question = Hvor langt driver positionen, når den glider på en IMU alene?

js-cat-imu-deadreckoning-title = Inertial dødregning

js-cat-ins-trn-coast-question = Hvor langt driver positionen under et navigationsudfald, og hvornår passerer den 10 m og 50 m? (modelberegnet)

js-cat-ins-trn-coast-title = INS/TRN-glidning

js-cat-integrity-harbour-approach-question = Med kajbygninger og en bølgebryder, der skjuler lave satellitter, holder GPS og Galileo så ARAIM-beskyttelsen inden for alarmgrænserne? (modelberegnet; repræsentativ horisontprofil)

js-cat-integrity-harbour-approach-title = ARAIM ved indsejling til havn

js-cat-integrity-raim-question = Opfylder geometrien alarmgrænserne (HPL / VPL)?

js-cat-integrity-raim-title = RAIM-integritet

js-cat-jamming-demo-question = Ved hvilket jammer-til-signal-forhold mister modtageren låsningen?

js-cat-jamming-demo-title = Jamming

js-cat-jamming-harbour-approach-skyline-question = Under en jammer på 2 W på land, hvor mange satellitter beholder et skib, og hvor mange skjuler kajen selv? (modelberegnet; repræsentativ horisontprofil)

js-cat-jamming-harbour-approach-skyline-title = Skib med jamming ved indsejling til havn

js-cat-l-band-waterfall-jamming-question = Hvordan ser hele GNSS L-båndet ud, mens en chirp-, en tone- og en støjjammer tændes, og hvilke signaler tager hver af dem væk? (modelberegnet)

js-cat-l-band-waterfall-jamming-title = L-båndets vandfald under jamming

js-cat-launch-window-question = Hvilken opsendelsesazimut og dogleg-Δv når en målinklination fra et opsendelsessted?

js-cat-launch-window-title = Opsendelsesvindue

js-cat-leo-band-trade-question = Hvad vinder og mister et navigationssignal i lav bane i hvert bånd, fra ultrahøj frekvens (UHF) til C-bånd? (repræsentative udformninger)

js-cat-leo-band-trade-title = Båndafvejning, UHF til C-bånd

js-cat-leo-doppler-positioning-question = Hvor god er en positionsbestemmelse ud fra ti minutters Doppler fra en navigationskonstellation i lav bane? (modelberegnet)

js-cat-leo-doppler-positioning-title = Positionsbestemmelse ud fra Doppler alene

js-cat-leo-focus-data-services-question = Hvad koster hver ekstra datatjeneste i bits i navigationsmeddelelsen? (modelberegnet)

js-cat-leo-focus-data-services-title = Tjenestedata mod rammelængde

js-cat-leo-focus-fused-pnt-sisre-question = Hvor god skal signal-i-rummet-afstandsfejlen i lav bane være, før laget i lav bane hjælper en fusioneret positionsbestemmelse? (modelberegnet)

js-cat-leo-focus-fused-pnt-sisre-title = Fusioneret positionsbestemmelse mod bane- og urfejl

js-cat-leo-focus-indoor-uhf-question = Hvilket bånd når stadig en bruger inde i en traditionel og en termisk effektiv bygning? (modelberegnet)

js-cat-leo-focus-indoor-uhf-title = Modtagelse indendørs efter bånd og bygning

js-cat-leo-focus-iot-eirp-question = Hvor meget satellitsendeeffekt skal en batteritag bruge for at holde? (modelberegnet)

js-cat-leo-focus-iot-eirp-title = Trackerens energi mod sendeeffekt

js-cat-leo-focus-ntn-bandwidth-question = Hvordan falder positioneringsfejlen, når referencesignalet bliver bredere fra 180 kHz til 20 MHz? (modelberegnet)

js-cat-leo-focus-ntn-bandwidth-title = 5G-downlink-positionering mod båndbredde

js-cat-leo-focus-ppp-altitude-question = Forkorter et lavere eller et højere lag i lav bane konvergensen mest? (modelberegnet; langsom, omkring et minut i en browser)

js-cat-leo-focus-ppp-altitude-title = Præcis positionsbestemmelse mod lagets højde

js-cat-leo-focus-science-iono-sounding-question = Hvor godt måler forsinkelsesforskellen mellem to bånd elektronindholdet under en satellit i lav bane? (modelberegnet)

js-cat-leo-focus-science-iono-sounding-title = Ionosfæreloddning fra to bånd

js-cat-leo-indoor-uhf-question = Hvorfor når en UHF-bærebølge ind i en bygning, når L-, S- og C-båndet har svært ved det? (modelberegnet)

js-cat-leo-indoor-uhf-title = Indendørs på UHF

js-cat-leo-iot-energy-question = Hvor meget energi bruger en batteritag på hver positionsbestemmelse ud fra et signal i lav bane? (modelberegnet)

js-cat-leo-iot-energy-title = Energi pr. positionsbestemmelse for en tracker

js-cat-leo-navmsg-encode-decode-question = Hvad koster hvert felts kvantisering, og overlever rammen kodning, afkodning og en ødelagt bit? (modelberegnet)

js-cat-leo-navmsg-encode-decode-title = Navigationsmeddelelse: binær ramme

js-cat-leo-navmsg-fit-interval-trade-question = Hvor længe kan én udsendt meddelelse dække, før dens banefejl vokser ud over målet? (modelberegnet; langsom, omkring 30 s i en browser)

js-cat-leo-navmsg-fit-interval-trade-title = Navigationsmeddelelse: tilpasningsinterval

js-cat-leo-navmsg-midpass-update-question = Når en satellit skifter til en ny meddelelse midt i en passage, ser brugeren så et spring? (modelberegnet)

js-cat-leo-navmsg-midpass-update-title = Navigationsmeddelelse: opdatering midt i passagen

js-cat-leo-navmsg-model-comparison-question = Hvilken efemeridemodel gengiver en lav bane bedst, og hvordan ligger den i forhold til en offentliggjort tabel? (modelberegnet)

js-cat-leo-navmsg-model-comparison-title = Navigationsmeddelelse: fire modeller

js-cat-leo-pass-iridium-question = Hvilken signalstyrke og Doppler ser et rutefly over én Iridium-passage? (modelberegnet)

js-cat-leo-pass-iridium-title = Iridium-bursts fra et fly

js-cat-leo-pass-vs-gnss-cn0-question = Hvordan sammenligner signalstyrken fra én passage i lav bane sig med de Galileo-satellitter, der er i sigte? (modelberegnet)

js-cat-leo-pass-vs-gnss-cn0-title = Én passage mod GNSS

js-cat-leo-pass-xona-pulsar-question = Hvordan ser X1- og X5-signalerne ud over én passage for et skib i Biscayabugten? (modelberegnet)

js-cat-leo-pass-xona-pulsar-title = Xona Pulsar-passage

js-cat-leo-pnt-end-to-end-question = Fra signaludformning til den endelige positionsbestemmelse, hvad giver hvert trin videre til det næste? (modelberegnet)

js-cat-leo-pnt-end-to-end-title = Fra ende til anden, generisk konstellation

js-cat-leo-pnt-mega-shell-question = Hvilken dækning og geometri giver en navigationskonstellation på 5.000 satellitter i lav jordbane? (modelberegnet; en eksempeludformning)

js-cat-leo-pnt-mega-shell-title = Udformning i lav bane med 5.000 satellitter

js-cat-leo-ppp-convergence-question = Hvor meget hurtigere konvergerer præcis punktpositionering (PPP), når et lag i lav bane tilføjes? (modelberegnet; langsom, omkring 30 s i en browser)

js-cat-leo-ppp-convergence-title = Konvergens for præcis positionsbestemmelse

js-cat-leo-pvt-fjord-skyline-question = Hvor fjordens vægge efterlader en stribe himmel langs renden, hvor meget tilføjer et lag i lav bane til GPS og Galileo? (modelberegnet; repræsentativ horisontprofil)

js-cat-leo-pvt-fjord-skyline-title = Færge dybt inde i en fjord

js-cat-leo-resilience-gnss-jammed-leo-carries-question = Når GNSS jammes, kan et lag i lav bane i andre bånd så bevare positionsbestemmelsen og dens integritet? (modelberegnet)

js-cat-leo-resilience-gnss-jammed-leo-carries-title = GNSS jammet, lav bane fører videre

js-cat-leo-resilience-js-margin-question = Hvor meget mere jamming overlever et stærkere signal fra lav bane end et GNSS-signal fra middelhøj bane? (modelberegnet)

js-cat-leo-resilience-js-margin-title = Jammermargin ud fra modtaget effekt

js-cat-leo-resilience-multiband-diversity-question = Når én L-båndsjammer skrues op, hvilke af fire bånd bliver ved med at spore? (modelberegnet)

js-cat-leo-resilience-multiband-diversity-title = Banddiversitet under en bredbåndsjammer

js-cat-leo-resilience-spoof-doppler-question = Når en spoofer flytter den beregnede position 30 m, hvor hurtigt fanger en kontrol af Doppler og passagegeometri det? (modelberegnet)

js-cat-leo-resilience-spoof-doppler-title = Spoofing fanget af Doppler

js-cat-leo-resilience-spoof-monitors-question = Hvilken monitor ser hvilken slags spoofer? (modelberegnet)

js-cat-leo-resilience-spoof-monitors-title = Spoofingmonitorer mod fire spoofere

js-cat-leo-timing-utc-question = Hvor tæt kan en modtager genfinde koordineret universaltid (UTC) fra satellitter i lav bane, efter oscillator og signalniveau? (modelberegnet)

js-cat-leo-timing-utc-title = Tidsoverførsel til UTC

js-cat-leo-vertical-5g-network-timing-question = Når GNSS går tabt i et døgn, holder tid fra lav bane så en basestation inden for dens tidsgrænse? (modelberegnet)

js-cat-leo-vertical-5g-network-timing-title = Tidssynkronisering af 5G-basestation

js-cat-leo-vertical-asset-tracking-iot-question = Hvad koster hver positionsbestemmelse en batteritag undervejs på en containers rejse? (modelberegnet)

js-cat-leo-vertical-asset-tracking-iot-title = Containersporing

js-cat-leo-vertical-autonomous-vehicle-question = Når bygninger skjuler de lave satellitter, holder et lag i lav bane så en bil inden for en fejl på vognbaneniveau? (modelberegnet)

js-cat-leo-vertical-autonomous-vehicle-skyline-question = Modelleret som en virkelig gade i stedet for en flad afskæring ved 35°, holder et lag i lav bane stadig en bil inden for en fejl på vognbaneniveau? (modelberegnet; repræsentativ horisontprofil)

js-cat-leo-vertical-autonomous-vehicle-skyline-title = Køretøj i en gade, ikke en flad afskæring

js-cat-leo-vertical-autonomous-vehicle-title = Køretøj i en bykløft

js-cat-leo-vertical-critical-infrastructure-timing-question = Når GNSS går tabt, holder tid fra lav bane så en transformerstations synkronisering? (modelberegnet)

js-cat-leo-vertical-critical-infrastructure-timing-title = Tidssynkronisering af en transformerstation

js-cat-leo-vertical-polar-arctic-question = Fra Tromsø til Nordpolen, hvad tilføjer et polært lag i lav bane til GNSS? (modelberegnet)

js-cat-leo-vertical-polar-arctic-title = Rejse i Arktis

js-cat-leo-vertical-rail-maritime-question = Når de medfølgende skibs- og togscenarier mister GNSS, når en passage i lav bane dem så stadig? (modelberegnet)

js-cat-leo-vertical-rail-maritime-title = Jernbane og søfart med et lag i lav bane

js-cat-link-budget-question = Lukker envejslinket med margin ved den givne afstand og datahastighed?

js-cat-link-budget-title = Linkbudget

js-cat-lunanet-araim-question = Opfylder et spredt sæt af månerelæer integritetsgrænserne for en modtager i Artemis-området?

js-cat-lunanet-araim-title = Månens integritet

js-cat-lunar-attack-surface-question = Hvad kræver det at spoofe eller afvise en modtager på månens overflade, og hvilket autentificeringsbudget besvarer det? (modelberegnet)

js-cat-lunar-attack-surface-title = Månens angrebsflade

js-cat-lunar-beacon-question = Hvor meget får en håndfuld opmålte overfladefyr DOP ved sydpolen til at falde sammen? (modelberegnet)

js-cat-lunar-beacon-title = Fyr på månens overflade

js-cat-lunar-differential-pnt-question = Hvor meget ophæver differentiel korrektion fællesmodefejl i forhold til baseline på Månen? (modelberegnet)

js-cat-lunar-differential-pnt-title = Differentiel PNT på Månen

js-cat-lunar-frame-campaign-question = Hvilken datumnøjagtighed kommer der ud af en observationskampagne i stedet for en indsat transformation? (modelberegnet)

js-cat-lunar-frame-campaign-title = Kampagne for månens referencesystem

js-cat-lunar-frame-realisation-question = Kan en Helmert-datumtilpasning genfinde en transformation af månens referencesystem? (modelberegnet)

js-cat-lunar-frame-realisation-title = Månens referencesystem

js-cat-lunar-infrastructure-carrier-phase-question = Kan en overfladestation og en orbiter sammen fastlægge heltalsmultipliciteterne i bærebølgefasen for Jordens GNSS-signaler? Den hurtige eksempelkørsel. (modelberegnet; en kørsel optaget med den native motor)

js-cat-lunar-infrastructure-carrier-phase-title = Bærebølgefase på Månen: overfladestation og orbiter

js-cat-lunar-infrastructure-frame-coestimation-question = Hvor meget mere information tilføjer afstandsmålinger mellem orbiter og overfladestation til månedatummets syv parametre? (modelberegnet; en kørsel optaget med den native motor)

js-cat-lunar-infrastructure-frame-coestimation-title = Samestimering af månens referencesystem med orbiterlink

js-cat-lunar-infrastructure-geodesy-sensitivity-question = Hvor følsomme er laserafstandsmåling, orbitersporing, et gravimeter og et overfladeur over for h2, k2, l2 og libration? (modelberegnet; en kørsel optaget med den native motor)

js-cat-lunar-infrastructure-geodesy-sensitivity-title = Følsomhed over for Månens Love-tal og libration

js-cat-lunar-infrastructure-od-consistency-model-error-question = Den samme sammenligning med en lille umodelleret acceleration indsat: opdager konsistenskontrollen den? (modelberegnet; en kørsel optaget med den native motor)

js-cat-lunar-infrastructure-od-consistency-model-error-title = Banebestemmelse på Månen, med en indsat modelfejl

js-cat-lunar-infrastructure-od-consistency-question = Stemmer banebestemmelse om bord med Jordens GNSS i en måneglorie-bane og uafhængig radiometrisk banebestemmelse fra jorden overens inden for deres angivne usikkerheder? (modelberegnet; en kørsel optaget med den native motor)

js-cat-lunar-infrastructure-od-consistency-title = Banebestemmelse på Månen: GNSS om bord mod sporing fra jorden

js-cat-lunar-infrastructure-space-tie-question = Hvor præcist kan forskydningerne mellem tre teknikker knyttes sammen, målt mod fejlen i den lokale kobling? (modelberegnet; en kørsel optaget med den native motor)

js-cat-lunar-infrastructure-space-tie-title = Rumkobling: GNSS, VLBI og laserafstandsmåling på ét rumfartøj

js-cat-lunar-interop-export-question = Kan månens referencesystem, tid og efemeride føres frem og tilbage gennem CCSDS OEM + en KIF-kuvert?

js-cat-lunar-interop-export-title = Interoperabilitetseksport for Månen

js-cat-lunar-jamming-question = Hvor langt væk kan en jammer stå og stadig afvise en modtager på månens overflade? (modelberegnet)

js-cat-lunar-jamming-title = Jamming på Månen

js-cat-lunar-joint-od-clock-question = Gør en VLBI-kobling med Jorden som baseline en månestations absolutte position observerbar? (modelberegnet)

js-cat-lunar-joint-od-clock-title = Fælles OD + ur på Månen

js-cat-lunar-llr-datum-question = Hvordan ser månedatummet ud, når kampagnen er rigtig arkiveret lasermåling af afstanden til Månen (LLR)? (modelberegnet; en kørsel optaget med den native motor)

js-cat-lunar-llr-datum-title = Månedatum fra laserafstandsmåling

js-cat-lunar-relay-constellation-question = Hvilken dækning giver en konstellation af relæer og navigation i frosne og lave månebaner over hele Månen? (modelberegnet; en eksempeludformning)

js-cat-lunar-relay-constellation-title = Relækonstellation på Månen

js-cat-lunar-station-coverage-public-sources-question = Alene under de offentligt angivne antagelser, hvilken korrigeret fejl giver stationen over sydpolen? Resultatet domineres af banelementerne, som ikke er offentlige og er sat ILLUSTRATIVT; dette er input til den frosne forudsigelse. (modelberegnet; ikke en udtalelse om noget virkeligt system)

js-cat-lunar-station-coverage-public-sources-title = Referencestation på Månen, offentlige antagelser

js-cat-lunar-station-coverage-question = Over sydpolsområdet og et døgn, hvilken korrigeret fejl giver en referencestation på Månen, og hvor langt fra den holder dækningen? (modelberegnet; ikke en udtalelse om noget virkeligt system)

js-cat-lunar-station-coverage-terrain-question = Når hvert steds horisont er ray-marchet over en virkelig højdemodel af Månen, hvor meget dækning mister stationen til terrænet? (modelberegnet)

js-cat-lunar-station-coverage-terrain-title = Månestation med virkeligt terræn

js-cat-lunar-station-coverage-title = Dækning fra referencestation på Månen

js-cat-lunar-station-geodesy-baseline-question = Hvor godt fastlægger nutidens fem retroreflektorfelter månedatummet på en virkelig tidsplan, før der er tilføjet nogen station? Baseline for et par. (modelberegnet; en kørsel optaget med den native motor)

js-cat-lunar-station-geodesy-baseline-title = Månestationens geodæsi: de fem felter alene

js-cat-lunar-station-geodesy-with-station-question = Den samme arkiverede tidsplan med én tilføjet reflektor og ét VLBI-fyr ved sydpolen: hvor meget strammes datumgrænsen? (modelberegnet, illustrativt sted; en kørsel optaget med den native motor)

js-cat-lunar-station-geodesy-with-station-title = Månestationens geodæsi: med en station ved sydpolen

js-cat-lunar-station-time-lab-question = Når en stations miniaturerubidiumur sidst er styret til månetid, hvor længe holder det sig så inden for 1, 10 og 100 ns, og hvilket fejlled dominerer? (modelberegnet)

js-cat-lunar-station-time-lab-title = Månestationens tidslaboratorium

js-cat-lunar-time-budget-question = Hvor stor er koordinattidsforskellen mellem Jorden og Månen, og hvad er dens fejlbudget? (modelberegnet)

js-cat-lunar-time-budget-title = Tidsbudget for Månen

js-cat-lunar-time-offset-question = Hvor hurtigt divergerer et månesur fra jordtid (~56–59 µs/døgn)?

js-cat-lunar-time-offset-title = Tidsforskydning på Månen

js-cat-lunar-vlbi-fim-question = Hvilken nøjagtighed af stationskoordinater giver en given VLBI-sporingsplan faktisk? (modelberegnet)

js-cat-lunar-vlbi-fim-title = VLBI-information for Månen

js-cat-lunar-vlbi-question = Hvilken forsinkelse ser et VLBI-par med Jorden som baseline for et fyr på månens overflade? (modelberegnet)

js-cat-lunar-vlbi-title = VLBI på Månen

js-cat-maritime-port-approach-coast-question = Ved indsejling til havn uden GNSS, hvornår forlader et INS af navigationskvalitet havne- og havbudgetterne? (modelberegnet)

js-cat-maritime-port-approach-coast-title = Indsejling til havn på inertial

js-cat-maritime-spoof-position-push-question = Når en spoofer trækker et skibs positionsbestemmelse 500 m, hvilke detektionslag fanger det? (modelberegnet)

js-cat-maritime-spoof-position-push-title = Skibets position spoofet

js-cat-maritime-strait-jamming-question = Over 30 km åbent vand, tager en jammer på 50 W så et fartøjs GNSS væk? (modelberegnet)

js-cat-maritime-strait-jamming-title = Skib med jamming i et stræde

js-cat-mars-orbit-pnt-question = Hvor godt positionsbestemmes en lav Mars-orbiter ud fra tolv navigationsrelæer, og hvad tilføjer en afstandsmåling fra Jorden? (modelberegnet)

js-cat-mars-orbit-pnt-title = Mars-orbiter med relæer og et link til Jorden

js-cat-mars-pnt-lmo-question = Kan en MARCONI-relækonstellation navigere en bruger ved Mars? (kovarians-FoM, ikke et certificeret PL)

js-cat-mars-pnt-lmo-title = PNT ved Mars, lav bane

js-cat-mars-pnt-surface-question = Hvor godt kan en lander eller rover på Mars' roterende overflade navigeres mod relækonstellationen?

js-cat-mars-pnt-surface-title = PNT ved Mars, overflade

js-cat-mars-pnt-transfer-question = Hvor godt navigeres et køretøj på en høj, excentrisk tilflyvnings- eller indfangningsbue ved Mars?

js-cat-mars-pnt-transfer-title = PNT ved Mars, transfer

js-cat-meo-leo-fused-pvt-question = Hvad gør det ved positionsfejl og geometri at tilføje et lag i lav bane til GPS og Galileo? (modelberegnet)

js-cat-meo-leo-fused-pvt-title = Fusioneret positionsbestemmelse med GNSS og lav bane

js-cat-moonlight-service-volume-question = Hvilken DOP, dækning og integritet giver en konstellation af Moonlight/LCNS-klassen ved sydpolen? (modelberegnet)

js-cat-moonlight-service-volume-title = Tjenestevolumen på Månen

js-cat-multi-band-jamming-waterfall-question = Med navigationssignaler fordelt over fire bånd, hvad lader en jammer bygget til ét bånd stå tilbage? (modelberegnet)

js-cat-multi-band-jamming-waterfall-title = Vandfald med jamming i flere bånd

js-cat-notinbrowser-elevation-model = Kræver udsnittet af månens højdemodel ({ $path }), som følger med repositoriet, ikke med browserudgaven.

js-cat-notinbrowser-laser-ranging-data = Kræver det arkiverede udsnit af laserafstandsdata, som følger med repositoriet, ikke med browserudgaven.

js-cat-notinbrowser-study-suite = En undersøgelsessuite, ikke ét enkelt scenarie. Kør den med kommandolinjeværktøjet: { $command }.

js-cat-ntn-5g-positioning-question = Hvor præcist kan en håndholdt enhed bestemme sin egen position ud fra en downlink i et ikke-terrestrisk 5G-net, efter signalbåndbredde? (modelberegnet)

js-cat-ntn-5g-positioning-title = Positionering ud fra 5G-satellitdownlink

js-cat-oem-interop-question = Kan en OEM-efemeride fra GMAT / Orekit / STK importeres og føres frem og tilbage?

js-cat-oem-interop-title = CCSDS OEM-bro

js-cat-optical-atmosphere-network-question = Hvor ofte er et optisk tidslink oppe gennem skyer og turbulens, og hvad giver ekstra jordstationer? (modelberegnet; illustrative skyklimaer)

js-cat-optical-atmosphere-network-title = Optisk link gennem atmosfæren, tre steder

js-cat-optical-atmosphere-techniques-question = Hvad giver en større apertur, en anden bølgelængde eller adaptiv optik ét optisk uplink i sky og turbulens? (modelberegnet; illustrativt skyklima)

js-cat-optical-atmosphere-techniques-title = Teknikker til optisk link

js-cat-orbit-gnss-challenged-question = Hvornår er en positionsbestemmelse overhovedet mulig ud fra satellitgeometrien?

js-cat-orbit-gnss-challenged-title = GNSS-tilgængelighed

js-cat-orbit-molniya-question = Kan en bruger i en stærkt excentrisk Molniya-bane stadig se nok GNSS-satellitter nær apogæum?

js-cat-orbit-molniya-title = Molniya-bruger

js-cat-orbit-multignss-question = Hvor meget løfter GPS + Galileo sammen tilgængeligheden og strammer præcisionsforringelsen?

js-cat-orbit-multignss-title = Multi-GNSS-tilgængelighed

js-cat-orbit-real-tle-question = Hvilken dækning giver en faktisk konstellation, angivet som two-line element sets?

js-cat-orbit-real-tle-title = Rigtige two-line elements

js-cat-orbit-rinex-question = Hvilken tilgængelighed kommer der ud af en rigtig RINEX 3-udsendt efemeride?

js-cat-orbit-rinex-title = Udsendt efemeride

js-cat-orbit-sgp4-gps-question = Hvordan propagerer en virkelig GPS-lignende konstellation over et døgn?

js-cat-orbit-sgp4-gps-title = SGP4-baner

js-cat-orbit-urban-canyon-skyline-question = I bunden af en bygade, hvor stor en del af døgnet giver GPS og Galileo fire satellitter, og hvad gør striben af himmel ved PDOP? (modelberegnet; repræsentativ horisontprofil)

js-cat-orbit-urban-canyon-skyline-title = Tilgængelighed i en bygade

js-cat-passes-question = Hvornår står en satellit op og går ned over en station, og hvor længe?

js-cat-passes-title = Passager over jorden

js-cat-polar-arctic-leo-coverage-question = Fra ækvator til polen, hvordan ændres satellitter i sigte og geometri med GNSS alene, et polart lag i lav bane alene og begge dele? (modelberegnet)

js-cat-polar-arctic-leo-coverage-title = Fra ækvator til pol

js-cat-pvt-abmf-question = Kan en rigtig modtagerposition beregnes ud fra rå RINEX-målinger?

js-cat-pvt-abmf-title = Positionsbestemmelse (SPP)

js-cat-quantum-anomaly-detect-question = Hvor godt opdages fejl i kvantesystemer ved en fast falsk alarmrate? (modelberegnet)

js-cat-quantum-anomaly-detect-title = Detektion af kvanteanomalier

js-cat-quantum-cai-coast-question = Hvor længe holder et koldatom-interferometer, specificeret ud fra sin fysik, dødregning inden for 100 m, efter at GNSS er gået tabt, sammenlignet med et kvartsaccelerometer af navigationskvalitet? (modelberegnet)

js-cat-quantum-cai-coast-title = Glidning med kvanteaccelerometer

js-cat-quantum-gnss-free-nav-question = Hvor langt glider en koldatom-navigator i forhold til et INS af navigationskvalitet uden GNSS? (modelberegnet)

js-cat-quantum-gnss-free-nav-title = Kvantenavigation uden GNSS

js-cat-quantum-pnt-demonstrator-suite-question = De tre kvanteanvendelsesområder som én undersøgelse (en undersøgelsessuite til kommandolinjen: kshana --study).

js-cat-quantum-pnt-demonstrator-suite-title = Undersøgelse af kvante-PNT-demonstrator

js-cat-quantum-time-transfer-question = Hvad giver betroet kvantetid i forhold til en klassisk CSAC + RF-kæde? (modelberegnet)

js-cat-quantum-time-transfer-title = Kvantetidsoverførsel

js-cat-quantum-trade-question = Hvilken tids- / inertialholdover giver et kandidatur-ur i forhold til en klassisk baseline? (modelberegnet)

js-cat-quantum-trade-title = Afvejning af kvante-PNT

js-cat-rail-tunnel-coast-question = Ved 160 km/t gennem en tunnel, hvor hurtigt forlader et INS af taktisk kvalitet sit budget? (modelberegnet)

js-cat-rail-tunnel-coast-title = Tog gennem en tunnel

js-cat-realtime-frame-eop-question = Hvor stor en referencesystemfejl indfører Jordens orientering i realtid (forudsagt)? (modelberegnet)

js-cat-realtime-frame-eop-title = Referencesystem/EOP i realtid

js-cat-reentry-question = Hvilken maksimal g-belastning og hvilken hastighed ved maksimal opvarmning ser en ballistisk genindtræden?

js-cat-reentry-title = Genindtrædenskorridor

js-cat-slot-timing-ocxo-leo-question = Hvor længe holder en ovnstyret krystaloscillator på en lille satellit i lav bane sig inden for sin slotbeskyttelse efter den seneste GNSS-positionsbestemmelse? (modelberegnet)

js-cat-slot-timing-ocxo-leo-title = Slottidssynkronisering

js-cat-small-uas-jammed-nav-question = Efter at en jammer har taget GNSS væk, hvor langt driver en inertienhed af flightcontrollerklassen, sammenlignet med en af taktisk kvalitet?

js-cat-small-uas-jammed-nav-title = Lille drone under jamming

js-cat-solar-system-tour-question = Hvor er hvert legeme, motoren kender, fra Solen til Pluto og de store måner, og hvor lang tid tager lyset mellem dem?

js-cat-solar-system-tour-title = Solsystemet på ét tidspunkt

js-cat-space-packet-question = Kodes og afkodes en CCSDS 133.0-pakkestrøm bit for bit nøjagtigt?

js-cat-space-packet-title = Space Packet

js-cat-space-weather-question = Hvordan ændrer sol- / geomagnetisk aktivitet termosfærens massefylde? (modelberegnet)

js-cat-space-weather-title = Rumvejr

js-cat-spoof-attack-question = Fanges en stigende tidsspoofing, før den når specifikationen?

js-cat-spoof-attack-title = Spoofingdetektion

js-cat-spoof-detect-question = Kan en fusioneret RF- og målingsmonitor fange en koordineret spoofing?

js-cat-spoof-detect-title = Spoofingdetektion i flere lag

js-cat-spoof-meaconing-question = Med en eksplicit angrebsform, hvor ofte fanger en urstøttet energidetektor spoofingen ved en fast falsk alarmrate?

js-cat-spoof-meaconing-title = Statistik for spoofingdetektor

js-cat-starlink-sop-doppler-positioning-question = Hvor godt kan en modtager bestemme sin position ud fra Doppler fra en bredbåndskonstellation, der ikke sender nogen navigationsmeddelelse? (modelberegnet)

js-cat-starlink-sop-doppler-positioning-title = Bredbåndssignaler ved lejlighed

js-cat-sweep-clock-stability-question = Hvordan ændres holdover, når én urparameter sweepes?

js-cat-sweep-clock-stability-title = Parametersweep

js-cat-sweep-nd-inertial-question = Hvordan varierer et kvalitetsmål over et gitter med flere parametre?

js-cat-sweep-nd-inertial-title = N-D-sweep

js-cat-telecom-prtc-holdover-24h-question = Holder en rubidiumreference, der mister GNSS i 24 timer, sig inden for ITU-T-masker for tidsfejl? (modelberegnet)

js-cat-telecom-prtc-holdover-24h-title = Telekom-holdover, 24 timer

js-cat-telecom-synce-eec-question = Holder en frit løbende ovnstyret oscillator sig inden for wander-masker for udstyrsuret i synkron Ethernet? (modelberegnet)

js-cat-telecom-synce-eec-title = Frekvenssynkronisering mod SyncE-masker

js-cat-telecom-tie-ingest-question = Består en optagelse af tidsintervalfejl ITU-T's MTIE- og TDEV-masker?

js-cat-telecom-tie-ingest-title = Kontrol af telekommaske, dine data

js-cat-terrain-nav-question = Kan et højdemåler rette INS-drift ved at matche en terrænhøjdeprofil?

js-cat-terrain-nav-title = Terrænnavigation

js-cat-terrain-slam-question = Kan et partikelfilter følge en tidsvarierende INS-drift mod et terrænkort?

js-cat-terrain-slam-title = Terræn-SLAM

js-cat-time-transfer-budget-question = Hvad gør stations-, transponder-, ionosfære- og Sagnac-led ved en tovejs tidsforskydning, og hvad er dens usikkerhedsbudget? (modelberegnet)

js-cat-time-transfer-budget-title = Tovejs satellittidsoverførsel

js-cat-timetransfer-question = Hvor tæt kan to steder holde sig synkroniseret over et link?

js-cat-timetransfer-title = Tidsoverførsel

js-cat-tracking-loop-question = Ved hvilken C/N0 mister en modtager faktisk låsningen, og kan en spoofer trække løkkerne over? (modelberegnet)

js-cat-tracking-loop-title = Sporingsløkke

js-cat-xona-pulsar-end-to-end-question = Den samme kæde på offentlige Xona Pulsar-tal: signal, passage, meddelelse, fusioneret positionsbestemmelse og præcis positionsbestemmelse. (modelberegnet)

js-cat-xona-pulsar-end-to-end-title = Fra ende til anden, Xona Pulsar

js-cat-xona-pulsar-signals-question = Hvor præcist kan en modtager måle afstand på de offentliggjorte X1- og X5-signaler, og hvor stort er søgerummet for erhvervelsen? (offentlig signaltabel)

js-cat-xona-pulsar-signals-title = Xona Pulsar-signaler

js-geo-a-place = Et sted…

js-geo-axis-east = Ø +{ $ext } m

js-geo-axis-north = N +{ $ext } m

js-geo-canyon-needs = Gadekløftformen kræver motor 0.36.

js-geo-canyon-out-of-range = Værdierne for gadekløften er uden for intervallet (azimut 0 til 359.9°, bredde 1 til 200 m, højder 0 til 500 m, antenne 0 til 50 m); en åben horisont bruges.

js-geo-canyon-reduced = Motorens reduktion af kløften til en tabel med 360 bins.

js-geo-compute-failed = Motoren kunne ikke beregne denne himmel: { $reason }

js-geo-computing = Beregner…

js-geo-copy-link = Kopiér dette link: { $url }

js-geo-count-below = Under horisonten

js-geo-count-hidden = Skjult af horisontprofilen

js-geo-count-in-view = I sigte

js-geo-count-open-sky = Åben himmel

js-geo-count-used = I løsningen

js-geo-cursor-live = Azimut { $az }°, horisontprofil { $el }°.

js-geo-dated-sky = En dateret himmel er kun så god som elementerne og deres alder; forudindstillingerne er udeladt.

js-geo-dop-geometric = geometrisk

js-geo-dop-geometric-title = geometrisk præcisionsforringelse

js-geo-dop-horizontal = horisontal

js-geo-dop-horizontal-title = horisontal præcisionsforringelse

js-geo-dop-position = position, 3-D

js-geo-dop-position-title = præcisionsforringelse for position, 3-D

js-geo-dop-time = tid

js-geo-dop-time-title = præcisionsforringelse for tid

js-geo-dop-vertical = vertikal

js-geo-dop-vertical-title = vertikal præcisionsforringelse

js-geo-east = Ø

js-geo-engine-not-running = Motoren kører ikke i denne browser ({ $reason }).

js-geo-err-geometry-object = motorens geometrisvar er ikke et objekt

js-geo-err-mc-object = motorens Monte Carlo-svar er ikke et objekt

js-geo-err-no-sentences = motorens svar indeholder ingen sætninger

js-geo-err-reply-kind-not-json = motorens svar ({ $what }) var ikke JSON

js-geo-err-reply-not-json = motorens svar var ikke JSON

js-geo-error-line = Med σ_UERE = { $uere } m under den angivne fejlmodel (motorens tal): { $bits }.

js-geo-error-line-needs = Positionsfejl ≈ σ_UERE × HDOP horisontalt og σ_UERE × VDOP vertikalt; tallet kræver motor 0.36.

js-geo-error-rms-3d = 3-D RMS σ_UERE × PDOP = { $m } m

js-geo-error-rms-h = horisontal RMS σ_UERE × HDOP = { $m } m

js-geo-error-sigma = 1-sigma-fejl øst { $east } m, nord { $north } m

js-geo-fact-ellipse-1s = Ellipse, 1-sigma

js-geo-fact-ellipse-1s-value = { $major } m × { $minor } m, lang akse { $deg }° fra nord

js-geo-fact-ellipse-pct = Ellipse, { $pct } %

js-geo-fact-ellipse-pct-scaled = { $major } m × { $minor } m (1-sigma × { $k })

js-geo-fact-ellipse-pct-value = { $major } m × { $minor } m

js-geo-fact-inside = Inden for 95 %-ellipsen

js-geo-fact-inside-value = { $pct } % af punkterne

js-geo-fact-line = { $key }: { $value }.

js-geo-fact-mc = Monte Carlo

js-geo-fact-mc-value =
    { $n ->
        [one] { $n } mindste kvadraters løsning, seed { $seed }
       *[other] { $n } mindste kvadraters løsninger, seed { $seed }
    }

js-geo-fact-rms-3d = Skyens RMS, 3-D

js-geo-fact-rms-3d-beside = { $rms } m, ved siden af σ_UERE × PDOP = { $predicted } m

js-geo-fact-rms-h = Skyens RMS, horisontal

js-geo-fact-rms-h-beside = { $rms } m, ved siden af σ_UERE × HDOP = { $predicted } m

js-geo-fact-rms-value = { $rms } m

js-geo-gj-not-geojson = { $name }: ikke GeoJSON (en FeatureCollection, Feature eller geometri var forventet).

js-geo-gj-not-json = { $name }: ikke JSON ({ $reason }).

js-geo-gj-not-object = { $name }: ikke et GeoJSON-objekt.

js-geo-gj-too-many =
    { $name }: { $count ->
        [one] { $count } objekt
       *[other] { $count } objekter
    }; denne side tegner højst { $max }.

js-geo-legend-item = { $label }: { $used } i løsningen af { $total }

js-geo-link-copied = Link kopieret.

js-geo-link-copied-no-tle = Link kopieret (uden dine indsatte elementer: et link åbner forudindstillingerne).

js-geo-mc-off = Fra

js-geo-missing-ellipse = fejlellipsen

js-geo-missing-gdop = GDOP

js-geo-missing-leo = LEO

js-geo-missing-monte-carlo = Monte Carlo-skyen

js-geo-missing-open-sky = andelen af åben himmel

js-geo-missing-skyline = horisontprofilen

js-geo-missing-tdop = TDOP

js-geo-needs = kræver motor 0.36

js-geo-needs-cap = Kræver motor 0.36

js-geo-no = Nej

js-geo-no-ellipse = Ingen ellipse

js-geo-no-sats = Ingen satellitter at vise.

js-geo-north = N

js-geo-not-given = ikke angivet

js-geo-note-elements-skipped = { $count } elementsæt blev sprunget over: { $list }.

js-geo-note-latitude-limited = Denne motorversion modellerer steder inden for 89° fra ækvator; breddegraden blev begrænset til det.

js-geo-note-leo-left-out = LEO: kræver motor 0.36; udeladt.

js-geo-note-no-engine = Motoren kører ikke i denne browser, så der er intet at vise. Den kører som WebAssembly; en browser eller vært, der blokerer WebAssembly, kan ikke køre denne visning.

js-geo-note-pick-one = Vælg mindst ét af GPS, Galileo og BeiDou.

js-geo-note-skyline-not-applied = Horisontprofilen er tegnet, men ikke anvendt: at anvende den kræver motor 0.36. Satellitter bag den tæller stadig med her.

js-geo-note-skyline-source = Horisontprofil: { $source }.

js-geo-note-training-model = Motor { $version }, træningshimmelmodel (nmea_training) ved { $instant }: vinkler i hele grader og DOP med én decimal, som modtagersætninger angiver dem; positionsbestemmelsen bruger højst 12 satellitter, valgt efter signalstyrke.

js-geo-note-unknown-systems =
    { $count ->
        [one] { $count } satellitpost
       *[other] { $count } satellitposter
    } fra et system, som denne visning ikke tegner, blev udeladt.

js-geo-off-leo = LEO: kræver motor 0.36.

js-geo-off-monte-carlo = Monte Carlo-skyen kræver motor 0.36.

js-geo-off-skyline = At anvende en horisontprofil kræver motor 0.36: her bliver den kun tegnet.

js-geo-offset-own = Forskydning fra dine elementers epoke ({ $epoch })

js-geo-offset-ref = Forskydning fra konstellationernes referenceepoke

js-geo-open-sky-share = { $pct } % af den øvre halvkugle

js-geo-out-of-range = Uden for intervallet og derfor holdt på den sidste gode værdi: { $names }.

js-geo-own-elements-at = Dine egne elementer ved { $epoch }.

js-geo-pick-constellation = Vælg mindst én konstellation.

js-geo-place-geiranger = Geirangerfjord, Norge

js-geo-place-manhattan = Midtown Manhattan, USA

js-geo-place-oslo = Oslo havn, Norge

js-geo-place-rotterdam = Rotterdams havn, Holland

js-geo-place-singapore = Singapore-strædet

js-geo-place-tallinn = Tallinn havn, Estland

js-geo-place-tromso = Tromsø, Norge

js-geo-plot-desc =
    { $total ->
        [one] { $total } satellit
       *[other] { $total } satellitter
    } i plottet, { $used } i løsningen.

js-geo-preset-illustrative = Illustrativ kontur tegnet af denne side; at anvende en horisontprofil kræver motor 0.36.

js-geo-ready = Klar.

js-geo-ready-needs = Klar. Kræver motor 0.36: { $list }.

js-geo-sat-masked = { $label } { $id }: azimut { $az }°, elevation { $el }°, skjult af horisontprofilen

js-geo-sat-unused = { $label } { $id }: azimut { $az }°, elevation { $el }°, bruges ikke

js-geo-sat-used = { $label } { $id }: azimut { $az }°, elevation { $el }°, i løsningen

js-geo-scenarios-under = Motorens scenarier under denne horisontprofil:

js-geo-sky-canyon = Gadekløft

js-geo-sky-drawn = Tegnet på skyplottet

js-geo-sky-open = Åben horisont

js-geo-sky-preset = Forudindstilling: { $name }

js-geo-sky-source = Himmel: { $source }.

js-geo-skyline-city-street = Bygade

js-geo-skyline-container = Containerterminal

js-geo-skyline-fjord = Fjord

js-geo-skyline-harbour = Havneindsejling

js-geo-skyline-load-failed = Horisontprofilen kunne ikke indlæses ({ $reason }).

js-geo-skyplot-downloaded = Skyplottet er downloadet.

js-geo-skyplot-export-failed = Skyplottet kunne ikke eksporteres ({ $reason }).

js-geo-source-geometry = Kshana-motor { $version }, sky_geometry

js-geo-source-line = { $source }.

js-geo-source-training = Kshana-motor { $version }, træningshimmelmodel

js-geo-south = S

js-geo-style-own-elements = Dine elementer

js-geo-svg-refused = motorens SVG blev afvist

js-geo-table-count =
    { $n ->
        [one] { $n } satellit
       *[other] { $n } satellitter
    }, de samme som i skyplottet.

js-geo-tle-epoch = Angiv en UTC-epoke fra 2000 til 2099.

js-geo-tle-paste-first = Indsæt først et eller flere tolinjede elementsæt.

js-geo-tle-too-large = De indsatte elementer er større end 4 MiB, motorens grænse for input.

js-geo-used-masked = Nej: skjult af horisontprofilen

js-geo-using-own = Bruger dine egne elementer. Et link angiver kun, at du brugte dem, ikke selve elementerne.

js-geo-wasm-blocked = WebAssembly er blokeret

js-geo-west = V

js-geo-why = Hvorfor

js-geo-why-interim = Fejlellipsen og Monte Carlo-skyen kræver motor 0.36 (dens funktioner sky_geometry og sky_monte_carlo); motoren på denne side er ældre.

js-geo-why-no-ellipse = Motoren gav ingen ellipse for denne geometri (for få satellitter til en positionsbestemmelse, eller en singulær geometri).

js-geo-why-no-ellipse-reason = Motoren gav ingen ellipse for denne geometri (for få satellitter til en positionsbestemmelse, eller en singulær geometri): { $reason }.

js-geo-why-waiting = Venter på motoren.

js-geo-yes = Ja

js-hold-axis-seconds = sekunder fra det første sampel

js-hold-axis-tau = observationstid τ, s (log)

js-hold-axis-te = tidsfejl, ns

js-hold-band-title = Genopretningsbånd ±{ $band } ns

js-hold-blurb-example = Et sampel hvert 5. s: 600 s låst, GNSS fjernet ved 600 s, holdover, GNSS genoprettet ved 2400 s. Optagelsen er genereret til eksemplet; den er ikke en måling.

js-hold-blurb-ptp4l = De samme fire trin aflæst fra en ptp4l-servolog (dæmonens egen forskydning, i ns). Loggen er skrevet til eksemplet; ingen dæmon kørte.

js-hold-budget-exceeded = { $name } blev første gang overskredet { $s } s efter fjernelsen

js-hold-chip-baseline = Baseline mod sine masker

js-hold-chip-envelope = ePRTC-A-holdover-kuvert

js-hold-chip-holdover = Holdover mod sine masker

js-hold-chip-measured = målt mod masken

js-hold-chip-recovery = Genopretning

js-hold-chip-words = Ord

js-hold-curve-title = { $step }: { $which }, ns

js-hold-curves-aria = { $which } mod observationstid, med maskegrænserne

js-hold-envelope-exceeded = ePRTC-A-holdover-kuverten blev første gang overskredet { $s } s efter fjernelsen

js-hold-envelope-exceeded-short = { $verdict }, første gang overskredet { $s } s efter fjernelsen (optagelsen er kortere end kuvertens periode)

js-hold-envelope-exceeded-value = { $verdict }, første gang overskredet { $s } s efter fjernelsen

js-hold-envelope-short = { $verdict } (optagelsen er kortere end kuvertens periode)

js-hold-file-error = { $name }: { $error }.

js-hold-file-not-json = { $name }: ikke JSON.

js-hold-file-read-here = { $name }, læst her; intet blev uploadet.

js-hold-file-too-large = { $name } er større, end denne side læser.

js-hold-from-record = resultatets optagelse

js-hold-from-record-decimated = resultatets optagelse, udtyndet til { $have } af { $total } sampler

js-hold-gnss-removed = GNSS fjernet

js-hold-gnss-removed-stated = GNSS fjernet (angivet af operatøren)

js-hold-gnss-restored = GNSS genoprettet

js-hold-gnss-restored-stated = GNSS genoprettet (angivet af operatøren)

js-hold-largest-at = { $value } ved T+{ $time } s

js-hold-limit-label = ±{ $ns } ns { $step }-maske

js-hold-limit-title = { $id }: ±{ $ns } ns, den maksimale absolutte tidsfejl på trinnet { $step }

js-hold-mark-title = { $id }-grænse { $limit } ns ved τ { $tau } s ({ $verdict }; { $source })

js-hold-marker-time = { $name }, T+{ $time } s

js-hold-na = n/a

js-hold-no-curve = Ingen tidsfejlskurve: optagelsen kunne ikke gengives til tegning.

js-hold-no-which-curve = Ingen { $which }-kurve i dette resultat.

js-hold-not-exceeded = ikke overskredet

js-hold-not-recovered = forblev ikke inden for båndet

js-hold-not-result = dette er ikke et resultat af en holdover-test

js-hold-open-failed = { $title } kunne ikke åbnes: { $reason }.

js-hold-opening = Åbner { $title }…

js-hold-phase-baseline = Baseline: låst

js-hold-phase-holdover = Holdover: GNSS fjernet

js-hold-phase-recovery = Genopretning: GNSS genoprettet

js-hold-phase-title = { $phase }, T+{ $from } s til { $to } s

js-hold-read-failed = Kunne ikke læses eller tegnes ({ $reason }).

js-hold-recorded = { $title }: motorens optagede resultat (version { $version }).

js-hold-recovered = inden for ±{ $band } ns i { $dwell } s, { $after } s efter GNSS vendte tilbage

js-hold-result-not-json = resultatet er ikke JSON ({ $reason })

js-hold-result-not-loaded = det optagede resultat blev ikke indlæst

js-hold-row-envelope = ePRTC-A-holdover-kuvert

js-hold-row-frequency = Fastholdt frekvensforskydning (tilpasset hældning)

js-hold-row-largest = Største absolutte tidsfejl

js-hold-row-length = Holdover-længde

js-hold-row-margin = Mindste margin inden for kuverten

js-hold-row-peak = Spids efter genoprettelsen

js-hold-row-recovery = Genopretning

js-hold-row-recovery-step = Største trin under genopretningen

js-hold-row-residual = Residual omkring den linje (rms)

js-hold-row-step = Trin ved fjernelsen

js-hold-status-final = { $status } { $label }; målt mod masken.

js-hold-step-span = T+{ $from } til { $to } s

js-hold-te-aria = Tidsfejl over optagelsen, med faserne og maskegrænserne

js-hold-te-line-title = Tidsfejl, ns

js-hold-te-note = Tidsfejl fra { $from }. De to tidspunkter blev angivet af { $by }.

js-hold-th-budget = Budget

js-hold-th-budget-limit = Grænse |TE|, ns

js-hold-th-first-exceeded = Først overskredet efter fjernelsen, s

js-hold-th-largest = Største |TE|, ns

js-hold-th-limit = Grænse, ns

js-hold-th-margin = Margin, ns

js-hold-th-mask = Maske

js-hold-th-mean = Middel, ns

js-hold-th-measured-on = Målt på

js-hold-th-metric = Metrik

js-hold-th-rms = RMS, ns

js-hold-th-samples = Sampler

js-hold-th-source = Kilde

js-hold-th-span = Interval

js-hold-th-step = Trin

js-hold-th-value = Værdi, ns

js-hold-th-verdict = Vurdering

js-hold-th-worst-at = Værst ved τ eller T+, s

js-hold-title-example = En tidsfejlsoptegnelse

js-hold-title-ptp4l = En linuxptp-log

js-hold-why-no-samples = resultatet indeholder ingen tidsfejlsmålinger (record.series), så der tegnes ingen kurve

js-hold-why-not-series = serien i resultatet er ikke en tidsserie (færre end to sampler, eller tiden stiger ikke), så der tegnes ingen kurve

js-hold-why-sentence = { $why }.

js-hold-why-too-many =
    serien i resultatet har { $have ->
        [one] { $have } sampel
       *[other] { $have } sampler
    }, hvor motoren scorede { $scored }, så der tegnes ingen kurve

js-interf-attribution = Tilskrivning

js-interf-build-failed = { $name }: kunne ikke bygges ({ $reason }).

js-interf-built-day-maps =
    { $n ->
        [one] Byggede { $n } dagskort ud fra { $name } med motor { $version }, i denne browser.
       *[other] Byggede { $n } dagskort ud fra { $name } med motor { $version }, i denne browser.
    }

js-interf-built-detail = { $date }: { $published } celler publiceret, { $flagged } markeret

js-interf-built-from-sample = Bygget ud fra den syntetiske { $kind }-prøve med motoren, i denne browser. Opdigtede rapporter; intet virkeligt luftfartøj, skib eller dag.

js-interf-built-maps =
    { $n ->
        [one] Byggede { $n } kort ({ $detail }). Kun aggregeret: en markeret celle peger ikke på interferens som årsag.
       *[other] Byggede { $n } kort ({ $detail }). Kun aggregeret: en markeret celle peger ikke på interferens som årsag.
    }

js-interf-built-none = { $name }: motoren byggede intet kort.

js-interf-caveat-coverage = Dækningen følger datakilden; læs dækningsnoterne.

js-interf-caveat-no-colour = En celle uden farve blev ikke observeret. Det er ikke bevis for, at området var frit.

js-interf-caveat-not-finding = En forringet eller anomal celle er ikke et fund af interferens. Der findes andre årsager.

js-interf-caveat-past-reports = Dette er en beskrivelse af tidligere positionsrapporter, ikke en prognose og ikke en måling af nogen modtager.

js-interf-caveats = Forbehold

js-interf-cell-size-rule = Cellestørrelsen skal være et antal grader over 0 og højst 10, eller tom for 0,5.

js-interf-check-failed = { $name }: kunne ikke kontrolleres ({ $reason }).

js-interf-click-cell = Klik på en celle, eller giv kortet fokus og brug piletasterne, for at se dens tal.

js-interf-close = Luk

js-interf-close-file = Luk { $name }

js-interf-col-affected = Berørt

js-interf-col-cell-area = Cellens areal

js-interf-col-detectors = Detektorer

js-interf-col-observed = Observeret

js-interf-col-sampled = Udtaget

js-interf-col-share = Andel

js-interf-col-status = Status

js-interf-coverage-limits = Dækningsgrænser for denne kilde

js-interf-csv-too-big = { $name }: større end 24 MiB; byg ud fra et udsnit (kommandolinjeværktøjet tager en hel fil).

js-interf-csv-too-big-short = { $name }: større end 24 MiB; byg ud fra et udsnit.

js-interf-custom-needs-licence = Et brugerdefineret datasæt kræver licensen, dens URL og tilskrivningsteksten: de skrives ind i kortfilen.

js-interf-dataset = Datasæt

js-interf-dates-rule = Datoer skrives ÅÅÅÅ-MM-DD, eller tomt for ingen grænse.

js-interf-day = Dag

js-interf-day-aria = { $kind }-dag

js-interf-day-confounded-note = Denne dag er konfunderet: ingen celle blev erklæret forringet på grund af dagens baggrund. Celler, der ellers ville have skilt sig ud, vises som ikke vurderet.

js-interf-day-figures-aria = Tal for dagen

js-interf-demo-csv-name = { $file } (syntetisk eksempel)

js-interf-demo-failed = Demoen kunne ikke åbnes: { $reason }.

js-interf-demo-opened = Syntetisk demo: tre opdigtede filer for en opdigtet region på åbent hav (to ADS-B-dage, hvoraf den ene er konfunderet, og en AIS-dag). Intet virkeligt luftfartøj, fartøj eller dag ligger bag dem. Brug dagsvælgeren på ADS-B-laget.

js-interf-demo-route-name = route.csv (syntetisk)

js-interf-describe-map = { $kind }-kort for { $date }: { $cells } celler tegnet, { $parts }. Celler, der ikke er tegnet, blev ikke observeret.

js-interf-did-not-load = { $url } blev ikke indlæst

js-interf-engine-no-fn = Denne motorversion (version { $version }) har ikke { $fn }; den er ældre end denne side. Kommandolinjeækvivalenten findes på siden Værktøjer.

js-interf-engine-start-failed = Motoren kunne ikke starte her ({ $reason }). Det virker stadig at åbne kortfiler ovenfor.

js-interf-err-format-version = { $name }: ikke et understøttet Kshana-interferenskort (format_version { $version }; denne side understøtter { $supported }).

js-interf-err-no-rows = { $name }: ingen rows[] i denne rapport.

js-interf-err-not-json = { $name }: ikke JSON ({ $reason }).

js-interf-err-not-map = { $name }: dette er GeoJSON, men ikke et Kshana-interferenskort (intet kshana_interference_map-medlem).

js-interf-err-not-route = { $name }: ikke en Kshana-rapport om ruteeksponering (intet kshana_route_exposure-medlem).

js-interf-err-route-schema = { $name }: skemaet { $schema } er ikke { $expected }, som denne side læser.

js-interf-err-source-kind = { $name }: source_kind { $kind } er hverken adsb eller ais.

js-interf-err-unknown-schema = { $name }: ukendt skema { $schema }; denne side læser { $supported }.

js-interf-foot-attribution = Tilskrivning: { $text }

js-interf-foot-coverage = Dækning: { $notes }

js-interf-foot-layer = { $kind }-lag, { $date }. Celler, der ikke er tegnet, blev ikke observeret.

js-interf-foot-licence = Licens: { $licence }

js-interf-foot-licence-url = Licens: { $licence } ({ $url })

js-interf-grid = Gitter: kvadratiske celler på { $size }° i breddegrad og længdegrad ({ $type }). Bredden øst-vest skrumper med breddegraden.

js-interf-guards = Værn mod andre årsager

js-interf-input = Input

js-interf-land-set = Landpolygoner: { $name }.

js-interf-land-too-big = Den landfil er større end 24 MiB.

js-interf-larger-than = { $name }: større end { $limit }; denne side læser kortfiler op til den størrelse.

js-interf-layer-adsb-sub = celler, hvor luftfartøjer rapporterede lav navigationsnøjagtighed

js-interf-layer-ais-sub = celler, hvor fartøjer rapporterede usandsynlige positioner eller bevægelser

js-interf-layer-heading = { $kind }-lag

js-interf-layer-hidden = { $kind }-laget er skjult.

js-interf-layers-separate = ADS-B og AIS er separate lag med hver sine til/fra-knapper, signaturforklaringer og licenslinjer. De slås aldrig sammen til ét farvefelt eller ét antal.

js-interf-legend-aria = Hvad hver celletilstand betyder; fjern et flueben for at gøre de celler svagere

js-interf-licence = Licens

js-interf-licence-aria = Datalicens for { $name }

js-interf-licence-heading = Datalicens og tilskrivning

js-interf-map-aria = { $summary } Piletasterne flytter mellem tegnede celler.

js-interf-maps-open =
    { $n ->
        [one] { $n } kort åbent.
       *[other] { $n } kort åbne.
    }

js-interf-method-summary = Metode og forbehold

js-interf-no-cell-at = Ingen celle ved { $lat }, { $lon }: ikke observeret. Det er ikke bevis for, at området var frit.

js-interf-no-cell-drawn = ingen celle tegnet

js-interf-no-cells-draw = Denne fil har ingen celler at tegne.

js-interf-no-day-figures = Denne fil angiver ingen tal på dagsniveau.

js-interf-no-file-opened = Ingen fil kunne åbnes.

js-interf-no-file-text = De åbne kort har ingen filtekst at kontrollere (de blev ikke åbnet som filer).

js-interf-none = ingen

js-interf-none-stated = (ingen angivet)

js-interf-none-stated-file = (ingen angivet i denne fil)

js-interf-north-abbr = N

js-interf-not-evaluated = ikke evalueret

js-interf-not-opened-full = { $name }: ikke åbnet, { $max } kort er allerede åbne. Luk nogle først.

js-interf-nothing-open = Intet åbent endnu.

js-interf-nothing-opened = Intet åbnet.

js-interf-one-day = én dag ad gangen

js-interf-opened-file-map = Åbnede { $files } fil; { $maps } kort åbent.

js-interf-opened-file-maps = Åbnede { $files } fil; { $maps } kort åbne.

js-interf-opened-files-map = Åbnede { $files } filer; { $maps } kort åbent.

js-interf-opened-files-maps = Åbnede { $files } filer; { $maps } kort åbne.

js-interf-opening-demo = Åbner den syntetiske demo…

js-interf-parameters = Parametre, fastlagt før nogen data blev læst

js-interf-read-draw-failed = { $name }: kunne ikke læses eller tegnes ({ $reason }).

js-interf-read-failed = { $name }: kunne ikke læses ({ $reason }).

js-interf-read-with-map = Læs dette sammen med kortet

js-interf-reading = Læser…

js-interf-route-aria = Ruteeksponering { $name }

js-interf-route-chip = Rute

js-interf-route-done =
    { $n ->
        [one] Ruteeksponering beregnet ud fra { $n } kort med motor { $version }; rapporten vises nedenfor.
       *[other] Ruteeksponering beregnet ud fra { $n } kort med motor { $version }; rapporten vises nedenfor.
    }

js-interf-route-explain = Andel af rutens længde i hver tilstand, pr. dag og kilde. De fire andele summerer til 1 og læses sammen: en lav forringet andel sammen med en høj andel ikke observeret er ikke vist at være fri. ADS-B- og AIS-rækker kombineres aldrig.

js-interf-route-exposure = Ruteeksponering

js-interf-route-needs-map = Åbn eller byg mindst ét kort først: ruten kontrolleres mod kortene på denne side.

js-interf-route-open-failed = Ruten kunne ikke åbnes: { $reason }.

js-interf-route-range = { $from } til { $to }

js-interf-route-too-big = { $name }: større end 24 MiB.

js-interf-row-affected-share = Berørt andel

js-interf-row-aircraft-affected = Berørte luftfartøjer

js-interf-row-aircraft-observed = Observerede luftfartøjer

js-interf-row-aircraft-sampled = Udtagne luftfartøjer

js-interf-row-area = Areal

js-interf-row-cell = Celle

js-interf-row-detectors = Detektorer, der kvalificerede sig

js-interf-row-flagged = Markeret: { $detector }

js-interf-row-status = Status

js-interf-row-vessels-observed = Observerede fartøjer

js-interf-rows-skipped =
    { $count ->
        [one] { $count } række var ikke gyldig og blev sprunget over.
       *[other] { $count } rækker var ikke gyldige og blev sprunget over.
    }

js-interf-rt-day = Dag

js-interf-rt-km = Rute-km

js-interf-rt-licence = Kortets licens og tilskrivning

js-interf-rt-shares = Andele af ruten

js-interf-rt-source = Kilde

js-interf-sample-failed = Eksemplet kunne ikke åbnes: { $reason }.

js-interf-save = Gem:

js-interf-save-report = Gem rapporten (JSON)

js-interf-show-layer = Vis dette lag

js-interf-st-anomalous-label = Anomal

js-interf-st-anomalous-text = Mindst én detektor markerede her den dag nok forskellige fartøjer (mindst 3 fartøjer og 20 % af de observerede). Mulige årsager omfatter interferens, men også mange almindelige.

js-interf-st-confounded-label = Dagen er konfunderet

js-interf-st-confounded-text = Hele dagens median for cellernes andel var høj, hvilket peger på en årsag over et stort område. Ingen celle erklæres forringet på sådan en dag; denne celle ville ellers have skilt sig ud.

js-interf-st-degraded-label = Forringet

js-interf-st-degraded-text = En høj andel af de udtagne luftfartøjer rapporterede her den dag lav navigationsnøjagtighed, langt over dagens mediancelle. Den siger ikke hvorfor.

js-interf-st-no-background-label = Intet baggrundsestimat

js-interf-st-no-background-text = Dagens baggrund (den typiske andel af luftfartøjer, der rapporterer lav nøjagtighed) kunne ikke estimeres ud fra nok celler, så ingen celle sammenlignes med den, og ingen afgøres.

js-interf-st-not-anomalous-label = Ikke anomal

js-interf-st-not-anomalous-text = Observeret, og ingen detektor kvalificerede sig. Ikke bevis for, at intet skete.

js-interf-st-not-degraded-label = Ikke forringet

js-interf-st-not-degraded-text = Udtaget, og andelen af luftfartøjer, der rapporterer lav nøjagtighed, skilte sig ikke ud. Ikke bevis for, at intet skete.

js-interf-st-too-few-label = For få luftfartøjer

js-interf-st-too-few-text = Publiceret (mindst 5 forskellige luftfartøjer observeret), men færre end 10 luftfartøjer kunne udtages, så der træffes ingen afgørelse.

js-interf-starting-build = Starter motoren og bygger…

js-interf-starting-route = Starter motoren og kontrollerer ruten…

js-interf-state-clear-adsb = Fri

js-interf-state-clear-adsb-text = Observeret med nok luftfartøjer og ikke markeret. Ikke bevis for, at intet skete.

js-interf-state-clear-ais = Fri

js-interf-state-clear-ais-text = Observeret med nok fartøjer og ikke markeret. Ikke bevis for, at intet skete.

js-interf-state-degraded-adsb = Forringet

js-interf-state-degraded-adsb-text = En høj andel af de udtagne luftfartøjer rapporterede her den dag lav navigationsnøjagtighed, langt over dagens mediancelle.

js-interf-state-degraded-ais = Anomal

js-interf-state-degraded-ais-text = Mindst én detektor markerede her den dag nok forskellige fartøjer (mindst 3 fartøjer og 20 % af de observerede).

js-interf-state-notobs-adsb = Ikke observeret

js-interf-state-notobs-adsb-text = Ingen celle tegnet: for få luftfartøjer blev observeret til at publicere den. Det er ikke bevis for, at området var frit.

js-interf-state-notobs-ais = Ikke observeret

js-interf-state-notobs-ais-text = Ingen celle tegnet: for få fartøjer blev observeret til at publicere den. Det er ikke bevis for, at området var frit.

js-interf-state-unassessed-adsb = Ikke vurderet

js-interf-state-unassessed-adsb-text = Observeret, men for få luftfartøjer kunne udtages, dagen var konfunderet, eller dagens baggrund kunne ikke estimeres, så der træffes ingen afgørelse.

js-interf-state-unassessed-ais = Ikke vurderet

js-interf-state-unassessed-ais-text = Observeret, men der træffes ingen afgørelse.

js-interf-status-unknown = En status, som denne side ikke beskriver.

js-interf-table-first = De første { $shown } af { $total } celler vist, afgørelser der betyder noget først.

js-interf-table-summary = Hver tegnet celle som en tabel ({ $n })

js-interf-the-day = Dagen

js-interf-unknown-date = ukendt dato

js-interf-warn-cell-size = Denne fil bruger en cellestørrelse på { $size }°, som ikke er den præregistrerede: det er ikke den præregistrerede metode, så dens afgørelser kan ikke sammenlignes med filer, der bruger den.

js-interf-warn-cell-size-known = Denne fil bruger en cellestørrelse på { $size }°, som ikke er den præregistrerede ({ $registered }°): det er ikke den præregistrerede metode, så dens afgørelser kan ikke sammenlignes med filer, der bruger den.

js-interf-warn-day-confounded = Denne dag er konfunderet: ingen celle blev erklæret forringet på grund af dagens baggrund (medianen for cellernes andel var selv høj).

js-interf-warn-flag-disagrees =
    { $count ->
        [one] { $count } celle har et "degraded"-flag, der er uenigt med dens status. Det er statussen, der tegnes.
       *[other] { $count } celler har et "degraded"-flag, der er uenigt med deres status. Det er statussen, der tegnes.
    }

js-interf-warn-no-licence = Denne fil indeholder ingen { $fields }-tekst. Den vises, men et kort uden sin licens og tilskrivning bør ikke genpubliceres.

js-interf-warn-on-land-off = Detektoren for positioner på land var slået fra for denne fil (der blev ikke angivet landpolygoner).

js-interf-warn-skipped =
    { $count ->
        [one] { $count } objekt var ikke gyldig GeoJSON og blev sprunget over.
       *[other] { $count } objekter var ikke gyldig GeoJSON og blev sprunget over.
    }

js-interf-warn-unknown-status = Statusværdier, som denne side ikke kender: { $values }. De tegnes som "ingen afgørelse".

js-interf-withheld = tilbageholdt (færre end 5)

js-interf-written-by = skrevet af Kshana { $version }

js-kind-axis-3-d-position-error-m = 3-D-positionsfejl (m)

js-kind-axis-c-n0-db-hz = C/N0 (dB-Hz)

js-kind-axis-code-jitter-m = kodejitter (m)

js-kind-axis-code-tracking-jitter-m = kodesporingsjitter (m)

js-kind-axis-doppler-shift-hz = Dopplerforskydning (Hz)

js-kind-axis-effective-c-n0-db-hz = effektivt C/N0 (dB-Hz)

js-kind-axis-elevation = elevation (°)

js-kind-axis-fit-interval-s = tilpasningsinterval (s)

js-kind-axis-formal-position-sigma-m = formel positionssigma (m)

js-kind-axis-latitude = breddegrad (°)

js-kind-axis-leo-satellites-added-to-the = LEO-satellitter føjet til positionsbestemmelsen

js-kind-axis-mean-satellites-in-view = gennemsnitligt antal satellitter i sigte

js-kind-axis-median-dilution-of-precision = median præcisionsforringelse

js-kind-axis-median-error-m = medianfejl (m)

js-kind-axis-median-pdop = median PDOP

js-kind-axis-metres = meter

js-kind-axis-observation-window-s = observationsvindue (s)

js-kind-axis-offset-from-the-signal-s = forskydning fra signalets midte (MHz)

js-kind-axis-offset-from-the-snapshot-centre = forskydning fra øjebliksbilledets midte (MHz)

js-kind-axis-pdop = PDOP

js-kind-axis-position-error-m = positionsfejl (m)

js-kind-axis-power-spectral-density-db-hz = effektspektraltæthed (dB/Hz, enhedseffekt)

js-kind-axis-power-spectral-density-dbw-hz = effektspektraltæthed (dBW/Hz)

js-kind-axis-probability-of-detection = detektionssandsynlighed

js-kind-axis-range-error-m = afstandsfejl (m)

js-kind-axis-relays = relæer

js-kind-axis-sisre-root-mean-square-m = SISRE, kvadratmiddelværdi (m)

js-kind-axis-time-error-ns = tidsfejl (ns)

js-kind-axis-time-s = tid (s)

js-kind-axis-time-since-the-start-min = tid siden start (min)

js-kind-axis-update-period-s = opdateringsperiode (s)

js-kind-cap-body-pnt-label = Positionsbestemmelse via relæer

js-kind-cap-campaign-label = Kampagne

js-kind-cap-constellation-design-label = Dækning

js-kind-cap-leo-navmsg-label = Navigationsbesked

js-kind-cap-leo-pass-label = Overflyvning og link

js-kind-cap-leo-pnt-chain-label = Kæde fra ende til ende

js-kind-cap-leo-ppp-label = Positionsbestemmelse

js-kind-cap-leo-pvt-label = Positionsbestemmelse

js-kind-cap-leo-signal-label = Signaludformning

js-kind-cap-lunar-llr-datum-label = Laserafstandsmålingens datum

js-kind-cap-ntn-positioning-label = Positionsbestemmelse

js-kind-cap-solar-system-label = Solsystemet

js-kind-cap-spectrum-label = Spektrum

js-kind-guided-doppler-error-hz = Dopplerfejl (Hz)

js-kind-guided-duration-s = Varighed (s)

js-kind-guided-earth-range-error-m = Afstandsfejl på Jorden (m)

js-kind-guided-elevation-mask = Elevationsmaske (°)

js-kind-guided-first-jammer-bandwidth-mhz = Første jammers båndbredde (MHz)

js-kind-guided-first-jammer-power-dbw = Første jammers effekt (dBW)

js-kind-guided-first-jammer-range-m = Første jammers afstand (m)

js-kind-guided-first-jammer-received-power-dbw = Første jammers modtagne effekt (dBW)

js-kind-guided-first-phase-length-s = Første fases længde (s)

js-kind-guided-first-shell-altitude-km = Første skals højde (km)

js-kind-guided-first-shell-inclination = Første skals inklination (°)

js-kind-guided-first-signal-bandwidth-hz = Første signals båndbredde (Hz)

js-kind-guided-first-system-range-error-m = Første systems afstandsfejl (m)

js-kind-guided-fit-interval-s = Tilpasningsinterval (s)

js-kind-guided-gravity-field-degree = Tyngdefeltets grad

js-kind-guided-grid-step = Gittertrin (°)

js-kind-guided-integration-time-s = Integrationstid (s)

js-kind-guided-leo-satellites-in-the-sweep = LEO-satellitter i sweepet

js-kind-guided-loop-bandwidth-hz = Sløjfebåndbredde (Hz)

js-kind-guided-monte-carlo-runs = Monte Carlo-kørsler

js-kind-guided-network-synchronisation-error-m = Netværkssynkroniseringsfejl (m)

js-kind-guided-orbit-altitude-km = Banehøjde (km)

js-kind-guided-orbit-determination-error-m = Banebestemmelsesfejl (m)

js-kind-guided-orbit-inclination = Banens inklination (°)

js-kind-guided-pdop-threshold = PDOP-tærskel

js-kind-guided-peak-elevation-of-the-pass = Overflyvningens maksimale elevation (°)

js-kind-guided-points-per-orbit-track = Punkter pr. banespor

js-kind-guided-receiver-noise-figure-db = Modtagerens støjtal (dB)

js-kind-guided-receiver-power-when-awake-mw = Modtagereffekt, når den er vågen (mW)

js-kind-guided-reference-c-n0-db-hz = Reference-C/N0 (dB-Hz)

js-kind-guided-relay-altitude-km = Relæhøjde (km)

js-kind-guided-relay-inclination = Relæinklination (°)

js-kind-guided-relay-planes = Relæplaner

js-kind-guided-relay-range-error-m = Relæafstandsfejl (m)

js-kind-guided-relays-per-plane = Relæer pr. plan

js-kind-guided-runs-per-case = Kørsler pr. tilfælde

js-kind-guided-satellite-altitude-km = Satellithøjde (km)

js-kind-guided-second-system-range-error-m = Andet systems afstandsfejl (m)

js-kind-guided-shared-condition = Fælles betingelse

js-kind-guided-slant-electron-content-tecu = Skråt elektronindhold (TECU)

js-kind-guided-slant-range-km = Skråafstand (km)

js-kind-guided-spoofed-offset-m = Spoofet forskydning (m)

js-kind-guided-spoofing-starts-s = Spoofing starter (s)

js-kind-guided-sweep-from = Sweep fra

js-kind-guided-sweep-steps = Sweeptrin

js-kind-guided-sweep-to = Sweep til

js-kind-guided-timeline-step-s = Tidslinjetrin (s)

js-kind-guided-tracking-threshold-db-hz = Sporingstærskel (dB-Hz)

js-kind-guided-transmit-power-dbw = Sendeeffekt (dBW)

js-kind-guided-update-period-s = Opdateringsperiode (s)

js-kind-guided-user-latitude = Brugerens breddegrad (°)

js-kind-hint-a-band-under-this-carrier = et bånd under denne bærebølge-til-støj-tæthed har mistet låsen

js-kind-hint-a-grid-point-is-available = et gitterpunkt er tilgængeligt, så længe dets positions-præcisionsforringelse er under dette

js-kind-hint-a-satellite-must-be-this = en satellit skal være så høj for at tælle som i sigte

js-kind-hint-a-satellite-must-be-this-2 = en satellit skal være så høj for at blive brugt

js-kind-hint-a-satellite-of-the-first = en satellit i det første system skal være så høj

js-kind-hint-arc-one-message-is-fitted = den bue, en besked tilpasses over

js-kind-hint-code-tracking-loop-noise-bandwidth = kodesporingssløjfens støjbåndbredde

js-kind-hint-detail-of-the-truth-orbit = detaljegraden i referencebanens tyngdemodel

js-kind-hint-distance-from-the-first-jammer = afstanden fra den første jammer til modtageren

js-kind-hint-distance-to-the-satellite-in = afstanden til satellitten i båndafvejningen

js-kind-hint-drawn-while-acquiring-and-tracking = tegnes under søgning og sporing

js-kind-hint-equivalent-isotropically-radiated-power-of = ækvivalent isotropt udstrålet effekt for den første jammer

js-kind-hint-equivalent-isotropically-radiated-power-of-2 = ækvivalent isotropt udstrålet effekt for båndet

js-kind-hint-filter-runs-averaged-for-each = filterkørsler, der midles for hvert tilfælde (flere er langsommere)

js-kind-hint-first-value-of-the-swept = første værdi af den parameter, der sweepes

js-kind-hint-height-of-the-chain-s = højden af kædens satellit

js-kind-hint-height-of-the-first-shell = højden af den første skals baner

js-kind-hint-height-of-the-relay-orbits = højden af relæbanerne over legemet

js-kind-hint-height-of-the-satellite-whose = højden af den satellit, hvis besked tilpasses

js-kind-hint-how-far-the-spoofer-moves = hvor langt spooferen flytter den beregnede position

js-kind-hint-how-finely-each-orbit-is = hvor fint hver bane samples til tegningen

js-kind-hint-how-high-the-satellite-climbs = hvor højt satellitten stiger

js-kind-hint-how-long-the-first-phase = hvor længe den første fase varer

js-kind-hint-how-long-the-receiver-integrates = hvor længe modtageren integrerer for én afstand

js-kind-hint-how-many-low-orbit-satellites = hvor mange lavbanesatellitter geometri-sweepet tilføjer

js-kind-hint-how-many-seeded-runs-make = hvor mange kørsler med seed der udgør ensemblet

js-kind-hint-how-many-values-are-run = hvor mange værdier der køres

js-kind-hint-how-often-a-new-message = hvor ofte en ny besked udsendes

js-kind-hint-how-wide-the-first-jammer = hvor bredt den første jammer spreder sin effekt

js-kind-hint-ionosphere-along-the-path-in = ionosfæren langs vejen, i enheder af totalt elektronindhold

js-kind-hint-last-value-of-the-swept = sidste værdi af den parameter, der sweepes

js-kind-hint-length-of-each-filter-run = længden af hver filterkørsel

js-kind-hint-length-of-the-run = længden af kørslen

js-kind-hint-length-of-the-timeline = længden af tidslinjen

js-kind-hint-occupied-bandwidth-of-the-first = den optagne båndbredde for det første referencesignal

js-kind-hint-one-sigma-doppler-measurement-error = ét-sigma-målefejl for Doppler

js-kind-hint-one-sigma-error-of-a = ét-sigma-fejl for en afstand til et relæ

js-kind-hint-one-sigma-error-of-the = ét-sigma-fejl for den tovejs afstand fra Jorden

js-kind-hint-orbital-planes-of-the-navigation = navigationsrelæernes baneplaner

js-kind-hint-power-of-the-first-jammer = den første jammers effekt ved modtageren

js-kind-hint-raises-the-noise-floor-under = hæver støjgulvet under hvert bånd

js-kind-hint-satellites-in-each-plane = satellitter i hvert plan

js-kind-hint-sets-the-doppler-range-a = fastlægger det Doppler-interval, en kold søgning skal dække

js-kind-hint-signal-in-space-range-error = signal-i-rummet-afstandsfejl for det første system

js-kind-hint-signal-in-space-range-error-2 = signal-i-rummet-afstandsfejl for det andet system

js-kind-hint-signal-level-the-tracking-figures = det signalniveau, sporingstallene opgives ved

js-kind-hint-spacing-of-the-latitude-and = afstanden mellem bredde- og længdegittrets punkter

js-kind-hint-spacing-of-the-shared-mission = afstanden mellem punkterne i det fælles missionstidsgitter

js-kind-hint-the-part-of-the-range = den del af afstandsfejlen, som beskeden ikke kan fjerne

js-kind-hint-the-value-every-member-runs = den værdi, hvert medlem kører under

js-kind-hint-tilt-of-that-orbit = den banes hældning

js-kind-hint-tilt-of-the-first-shell = hældningen af den første skals planer

js-kind-hint-tilt-of-the-relay-planes = hældningen af relæplanerne

js-kind-hint-timing-error-between-satellites-as = tidsfejl mellem satellitter, som afstand

js-kind-hint-when-the-spoofer-captures-the = hvornår spooferen overtager modtageren

js-kind-hint-where-the-receiver-stands = hvor modtageren står

js-kind-hint-where-the-user-stands = hvor brugeren står

js-kind-label-3-d-error = 3-D-fejl

js-kind-label-3-d-error-time-of = 3-D-fejl, ankomsttid

js-kind-label-a-corrupted-frame-is-rejected = en ødelagt ramme afvises

js-kind-label-all-channels = alle kanaler

js-kind-label-availability = Tilgængelighed

js-kind-label-band = Bånd

js-kind-label-bodies = Legemer

js-kind-label-body = Legeme

js-kind-label-both = begge

js-kind-label-case = Tilfælde

js-kind-label-class = Klasse

js-kind-label-code-jitter = kodejitter

js-kind-label-constellation = Konstellation

js-kind-label-doppler = Doppler

js-kind-label-event = Hændelse

js-kind-label-evidence = Evidens

js-kind-label-fewest-in-view = Færrest i sigte

js-kind-label-field = Felt

js-kind-label-first-detection-after-onset = Første detektion efter start

js-kind-label-frame-length = Rammelængde

js-kind-label-fused = fusioneret

js-kind-label-fused-cap = Fusioneret

js-kind-label-gnss = GNSS

js-kind-label-gnss-and-leo = GNSS og LEO

js-kind-label-gnss-channels = GNSS-kanaler

js-kind-label-gnss-highest-in-sky = GNSS { $id } (højest på himlen)

js-kind-label-gnss-only = kun GNSS

js-kind-label-gnss-only-cap = Kun GNSS

js-kind-label-gnss-signal = GNSS-signal

js-kind-label-hdop = HDOP

js-kind-label-highest = Højeste

js-kind-label-horizontal-error = horisontal fejl

js-kind-label-horizontal-error-2 = Horisontal fejl

js-kind-label-jammer = Jammer

js-kind-label-jump-threshold = Springtærskel

js-kind-label-largest-range-jump = Største afstandsspring

js-kind-label-largest-range-jump-against-the = største afstandsspring mod tærsklen

js-kind-label-leo = LEO

js-kind-label-leo-channels = LEO-kanaler

js-kind-label-leo-only = kun LEO

js-kind-label-light-time-from-observer = Lystid fra { $observer }

js-kind-label-light-time-from-the-observer = Lystid fra observatøren

js-kind-label-light-time-one-way = Lystid, én vej

js-kind-label-lowest = Laveste

js-kind-label-lowest-c-n0 = Laveste C/N0

js-kind-label-mean = Middel

js-kind-label-mean-in-view = Middel i sigte

js-kind-label-median-convergence = Mediankonvergens

js-kind-label-median-pdop = Median PDOP

js-kind-label-member-runs = Medlemskørsler

js-kind-label-message-switch-iod = beskedskift, dataudgave { $old } til { $new }

js-kind-label-mission-length = Missionslængde

js-kind-label-model = model

js-kind-label-monte-carlo-runs = Monte Carlo-kørsler

js-kind-label-noise-floor = Støjgulv

js-kind-label-parameters = Parametre

js-kind-label-payload = Nyttelast

js-kind-label-pdop = PDOP

js-kind-label-pdop-95th-percentile = PDOP, 95. percentil

js-kind-label-peak-elevation = Maksimal elevation

js-kind-label-peak-tracked-c-n0 = Højeste sporede C/N0

js-kind-label-phase = Fase

js-kind-label-predicted-horizontal-sigma = forudsagt horisontal sigma

js-kind-label-quantisation-position = Kvantisering, position

js-kind-label-range-error = afstandsfejl

js-kind-label-relays-above-the-mask = relæer over masken

js-kind-label-relays-and-earth-link = relæer og Jord-link

js-kind-label-relays-only = kun relæer

js-kind-label-satellite = Satellit

js-kind-label-satellites = Satellitter

js-kind-label-satellites-used = Anvendte satellitter

js-kind-label-signal = Signal

js-kind-label-signal-chip-spacing = { $name } ({ $spacing } chipafstand)

js-kind-label-sisre-after-quantisation = SISRE efter kvantisering

js-kind-label-sisre-root-mean-square = SISRE, kvadratmiddelværdi

js-kind-label-spoofing-starts = spoofing starter

js-kind-label-standard-deviation = Standardafvigelse

js-kind-label-sun-separation = Vinkelafstand til Solen

js-kind-label-sweep-runs = Sweepkørsler

js-kind-label-system = System

js-kind-label-time-above-the-mask = Tid over masken

js-kind-label-time-error-root-mean-square = Tidsfejl, kvadratmiddelværdi

js-kind-label-tracked-component = sporet komponent

js-kind-label-tracking-threshold = Sporingstærskel

js-kind-label-transmit-bandwidth = Senderbåndbredde

js-kind-label-vdop = VDOP

js-kind-label-welch-estimate-of-the-synthesised = Welch-estimat af de syntetiserede sampler

js-kind-label-whole-signal = hele signalet

js-kind-label-wideband-j-s-tolerated = Tolereret bredbånds-J/S

js-kind-label-with-unit = { $label } ({ $unit })

js-kind-label-worst-site-availability = Tilgængelighed på det værste sted

js-kind-no = nej

js-kind-note-a-gap-is-an-epoch = Et hul er en epoke med for få relæer i sigte til en positionsbestemmelse.

js-kind-note-a-helmert-transform-is-the = En Helmert-transformation er den syvparametrede forskydning, rotation og skalering mellem to referencesystemer.

js-kind-note-a-low-earth-orbit-leo = En satellit i lav jordbane (LEO) krydser himlen på få minutter, så dens C/N0 (bærebølge-til-støj-tæthedsforhold) stiger og falder som en klokke; en GNSS-satellit bevæger sig næsten ikke i samme tid.

js-kind-note-a-receiver-independent-exchange-format = En post i stil med Receiver Independent Exchange Format (RINEX) 4. LEO-posttyperne er en Kshana-udvidelse, som headeren angiver.

js-kind-note-a-single-pass-fixes-the = En enkelt overflyvning fastlægger retningen langs sporet langt bedre end retningen på tværs af sporet.

js-kind-note-aos-is-acquisition-of-signal = AOS er signalopfangning (acquisition of signal), TCA tidspunktet for tætteste passage (time of closest approach) og LOS tab af signal (loss of signal).

js-kind-note-c-n0-is-the-carrier = C/N0 er bærebølge-til-støj-tæthedsforholdet. Et bånd under modtagerens sporingstærskel har mistet låsen.

js-kind-note-cells-are-the-code-and = Celler er de kode- og Doppler-bins, en kold søgning skal teste.

js-kind-note-cold-is-a-first-fix = Kold er en første positionsbestemmelse uden forhåndsviden; varm er en positionsbestemmelse kort efter den sidste.

js-kind-note-dilution-of-precision-dop-scales = Præcisionsforringelse (DOP) skalerer en afstandsfejl til en positionsfejl: G er geometrisk, P position, H horisontal, V vertikal. Percentiler gælder over hvert gitterpunkt og hver epoke.

js-kind-note-drawn-at-the-strongest-signal = Tegnet ved kørslens stærkeste signalniveau. Et hul er et stykke uden satellit i sigte.

js-kind-note-each-body-carries-its-own = Hvert legeme bærer sin egen evidensmærkat. Lystid er én vej, fra den observatør, der er angivet i scenariet.

js-kind-note-each-row-is-one-full = Hver række er en fuld motorkørsel af det sweepede scenarie.

js-kind-note-each-rule-is-a-switch = Hver regel er et skift til en nyere besked midt i overflyvningen.

js-kind-note-each-signal-is-drawn-about = Hvert signal er tegnet omkring sin egen centerfrekvens. Et hul er et spektralt nul.

js-kind-note-eirp-is-the-equivalent-isotropically = EIRP er den ækvivalente isotropt udstrålede effekt.

js-kind-note-every-phase-is-an-ordinary = Hver fase er en almindelig scenariekørsel. Hashene identificerer hvert medlems input og dets resultatdokument.

js-kind-note-iod-is-the-issue-of = IOD er dataudgaven (issue of data): beskedens løbenummer.

js-kind-note-j-s-is-the-jammer = J/S er forholdet mellem jammer- og signaleffekt. Sporingsandel er den del af kørslen, båndet bliver over tærsklen.

js-kind-note-p05-p50-and-p95-are = p05, p50 og p95 er 5., 50. og 95. percentil. ci95 er 95 %-konfidensintervallet for middelværdien.

js-kind-note-parameters-are-public-with-a = Parametre er PUBLIC (med en kilde), REPRESENTATIVE eller WORKSHOP, som hver forudindstilling angiver.

js-kind-note-precise-point-positioning-ppp-converges = Præcis punktpositionering (PPP) konvergerer, når fejlen holder sig under kriteriet. NEES er den normaliserede estimationsfejl i anden (normalised estimation error squared), en kontrol af filterkonsistens.

js-kind-note-sisre-defined = SISRE er signal-i-rummet-afstandsfejlen: det, den udsendte besked lægger til en brugers afstand. Her er det beskedens repræsentationsfejl mod motorens egen referencebane.

js-kind-note-sisre-is-the-signal-in = SISRE er den signal-i-rummet-afstandsfejl, der antages for hvert systems udsendte bane og ur.

js-kind-note-ssc-is-the-spectral-separation = SSC er den spektrale separationskoefficient: hvor stor en del af det ene signals effekt der falder inden for det andets modtager. En tankestreg betyder, at de to ikke overlapper.

js-kind-note-the-chain-runs-the-signal = Kæden kører trinnene signal, overflyvning, navigationsbesked, positionsbestemmelse og præcis positionsbestemmelse i rækkefølge. Hver række er et tal, ét trin beregnede og det næste brugte.

js-kind-note-the-doppler-and-pass-geometry = Monitoren for Doppler og overflyvningsgeometri sammenligner målte afstandsrater med dem, der er forudsagt ud fra banerne. Reglen markerer spooferens start.

js-kind-note-the-engine-draws-its-spectrum = Motoren tegner sin spektrummodel som in-fase- og kvadratursampler (IQ) på ét tidspunkt og estimerer spektret tilbage ud fra dem. De samme sampler er SigMF-eksporten (Signal Metadata Format).

js-kind-note-the-engine-s-own-documented = Motorens egen dokumenterede binære ramme, afsluttet med et 24-bit cyklisk redundanstjek (CRC-24Q).

js-kind-note-the-gabor-root-mean-square = Gabor-båndbredden (kvadratmiddelværdi) bestemmer, hvor skarpt der kan måles afstand på et signal.

js-kind-note-the-largest-jammer-to-signal = Det største forhold mellem jammer og signal (J/S), hvert signal kan spore igennem, for en kontinuerlig bølge (CW), en matchet-spektrum- og en bredbåndsjammer.

js-kind-note-the-shapiro-delay-is-the = Shapiro-forsinkelsen er den ekstra lystid fra Solens tyngdekraft langs vejen.

js-kind-note-the-spectrum-kind-and-the = Spektrumtypen og jamming-typen beregner det samme link på to måder; den sidste kolonne er deres forskel.

js-kind-note-time-of-arrival-toa-ranging = Afstandsmåling med ankomsttid (TOA) på et ikke-terrestrisk netværks (NTN) downlink: et bredere signal måler afstand skarpere.

js-kind-note-what-half-a-least-significant = Hvad en halv mindst betydende bit (LSB) i hvert felt koster i position og i ur, som afstand.

js-kind-rowhead-block = Blok

js-kind-rowhead-condition = Betingelse

js-kind-rowhead-figure = Tal

js-kind-rowhead-member = Medlem

js-kind-rowhead-metric = Metrik

js-kind-rowhead-monitor = Monitor

js-kind-rowhead-phase = Fase

js-kind-rowhead-satellite = Satellit

js-kind-rowhead-signal = Signal

js-kind-rowhead-solution = Løsning

js-kind-sub-clock-offset-db = { $clock }, { $offset } dB

js-kind-sub-doppler-only = kun Doppler

js-kind-sub-from-to = { $from } til { $to }

js-kind-sub-fused = fusioneret

js-kind-sub-gnss-and-leo-latitude = GNSS og LEO, breddegrad { $lat }°

js-kind-sub-gnss-only = kun GNSS

js-kind-sub-gnss-only-latitude = kun GNSS, breddegrad { $lat }°

js-kind-sub-model-fit-seconds = { $model }, { $fit } s tilpasning

js-kind-threshold-4-needed-for-a-fix = 4 kræves til en positionsbestemmelse

js-kind-threshold-convergence-criterion = konvergenskriterium

js-kind-threshold-elevation-mask = elevationsmaske

js-kind-threshold-gnss-median = GNSS-median

js-kind-threshold-tracking-threshold = sporingstærskel

js-kind-title-acquisition = Acquisition

js-kind-title-against-a-simulated-campaign = Mod en simuleret kampagne

js-kind-title-assumptions = Antagelser

js-kind-title-band-trade-at-equal-transmit = Båndafvejning ved samme sendeeffekt

js-kind-title-bands = Bånd

js-kind-title-beside-the-published-figures = Ved siden af de offentliggjorte tal

js-kind-title-beside-the-published-speed-up = Ved siden af den offentliggjorte hastighedsforøgelse

js-kind-title-bodies = Legemer

js-kind-title-body = Legeme

js-kind-title-by-latitude = Efter breddegrad

js-kind-title-c-n0-by-band-over = C/N0 pr. bånd over kørslen

js-kind-title-c-n0-over-the-pass = C/N0 over overflyvningen

js-kind-title-cases = Tilfælde

js-kind-title-central-body = Centrallegeme

js-kind-title-closed-form-doppler-against-finite = Lukket-form-Doppler mod endelige differenser

js-kind-title-code-tracking-jitter = Kodesporingsjitter

js-kind-title-code-tracking-jitter-against-c = Kodesporingsjitter mod C/N0

js-kind-title-combined-over-the-members = Kombineret over medlemmerne

js-kind-title-compatibility-with-gnss-signals = Forenelighed med GNSS-signaler

js-kind-title-constellations = Konstellationer

js-kind-title-continuity-across-message-switches = Kontinuitet over beskedskift

js-kind-title-cross-check-against-the-jamming = Krydskontrol mod jamming-typen

js-kind-title-datum-accuracy = Datumnøjagtighed

js-kind-title-dilution-of-precision-over-the = Præcisionsforringelse over hele gitteret

js-kind-title-doppler = Doppler

js-kind-title-doppler-envelopes = Doppler-kuverter

js-kind-title-doppler-only-fix = Positionsbestemmelse kun med Doppler

js-kind-title-doppler-over-the-pass = Doppler over overflyvningen

js-kind-title-doppler-positioning-from-one-pass = Doppler-positionering fra én overflyvning

js-kind-title-earth-link = Jord-link

js-kind-title-elevation = Elevation

js-kind-title-encoded-frame = Kodet ramme

js-kind-title-epoch = Epoke

js-kind-title-epoch-and-frame = Epoke og referencesystem

js-kind-title-events = Hændelser

js-kind-title-every-node-of-the-sweep = Hver knude i sweepet

js-kind-title-field-table = Felttabel

js-kind-title-figures-of-merit = Kvalitetsmål

js-kind-title-filter-noise = Filterstøj

js-kind-title-fit-interval-trade = Afvejning af tilpasningsinterval

js-kind-title-fix-quality-against-observation-window = Positionskvalitet mod observationsvindue

js-kind-title-frame-checks = Rammekontroller

js-kind-title-frame-hexadecimal = Ramme, hexadecimal

js-kind-title-geometry-against-latitude = Geometri mod breddegrad

js-kind-title-geometry-as-leo-satellites-are = Geometri, når LEO-satellitter tilføjes

js-kind-title-geometry-position-dilution-of-precision = Geometri: positionspræcisionsforringelse

js-kind-title-global-coverage = Global dækning

js-kind-title-gnss-leo-and-fused = GNSS, LEO og fusioneret

js-kind-title-gnss-reference = GNSS-reference

js-kind-title-hand-offs-between-phases = Overdragelser mellem faser

js-kind-title-helmert-fit = Helmert-tilpasning

js-kind-title-helmert-transform-parameters = Helmert-transformationsparametre

js-kind-title-inputs = Input

js-kind-title-ionosphere-free-band-pairs = Ionosfærefrie båndpar

js-kind-title-jammer-tolerance = Jammertolerance

js-kind-title-jammers = Jammere

js-kind-title-joint-fix = Fælles positionsbestemmelse

js-kind-title-leo-against-gnss = LEO mod GNSS

js-kind-title-limitations = Begrænsninger

js-kind-title-links = Links

js-kind-title-member-runs = Medlemskørsler

js-kind-title-members-under-the-shared-conditions = Medlemmer under de fælles betingelser

js-kind-title-message = Besked

js-kind-title-message-models-compared = Beskedmodeller sammenlignet

js-kind-title-message-switches = Beskedskift

js-kind-title-metric-against-axis = { $metric } mod { $axis }

js-kind-title-metric-distribution-over-runs = { $metric }: fordeling over kørslerne

js-kind-title-mid-pass-update = Opdatering midt i overflyvningen

js-kind-title-modelled = Modelleret

js-kind-title-monte-carlo = Monte Carlo

js-kind-title-navigation-message-stage = Trinnet navigationsbesked

js-kind-title-not-modelled = Ikke modelleret

js-kind-title-notes = Noter

js-kind-title-notes-on-the-spoofing-model = Noter om spoofing-modellen

js-kind-title-observation-windows = Observationsvinduer

js-kind-title-one-pass-alone = Én overflyvning alene

js-kind-title-orbit = Bane

js-kind-title-over-the-message-sequence = Over beskedsekvensen

js-kind-title-pass = Overflyvning

js-kind-title-pass-c-n0-of-the = Overflyvning: C/N0 for hele signalet og for den sporede komponent

js-kind-title-pass-code-tracking-jitter = Overflyvning: kodesporingsjitter

js-kind-title-pass-doppler = Overflyvning: Doppler

js-kind-title-pass-stage = Overflyvningstrin

js-kind-title-passes = Overflyvninger

js-kind-title-phases = Faser

js-kind-title-position-error-gnss-leo-and = Positionsfejl: GNSS, LEO og den fusionerede positionsbestemmelse

js-kind-title-position-uncertainty-relays-alone-and = Positionsusikkerhed: relæer alene og med Jord-linket

js-kind-title-positioning-by-signal-bandwidth = Positionsbestemmelse efter signalbåndbredde

js-kind-title-positioning-gnss-alone-against-the = Positionsbestemmelse: GNSS alene mod den fusionerede positionsbestemmelse

js-kind-title-power-spectral-density = Effektspektraltæthed

js-kind-title-power-spectral-density-of-each = Effektspektraltæthed for hvert signal

js-kind-title-precise-point-positioning = Præcis punktpositionering

js-kind-title-published-comparison = Offentliggjort sammenligning

js-kind-title-quantisation-budget = Kvantiseringsbudget

js-kind-title-range-residuals = Afstandsresidualer

js-kind-title-ranging-stations = Afstandsmålingsstationer

js-kind-title-reading-the-trade = Sådan læses afvejningen

js-kind-title-realised-position-error = Opnået positionsfejl

js-kind-title-receiver = Modtager

js-kind-title-receiver-power-budget = Modtagerens effektbudget

js-kind-title-reflector-information = Reflektoroplysninger

js-kind-title-relay-constellation = Relækonstellation

js-kind-title-relays-in-view = Relæer i sigte

js-kind-title-reproducibility = Gentagelighed

js-kind-title-retroreflectors = Retroreflektorer

js-kind-title-rinex-style-record = RINEX-lignende post

js-kind-title-round-trips = Rundture

js-kind-title-run = Kørsel

js-kind-title-satellites-in-view-against-latitude = Satellitter i sigte mod breddegrad

js-kind-title-sensitivity-to-a-line-of = Følsomhed over for en hældning af sigtelinjen

js-kind-title-shared-conditions = Fælles betingelser

js-kind-title-signal-components = Signalkomponenter

js-kind-title-signal-stage = Signaltrin

js-kind-title-signals = Signaler

js-kind-title-sisre-against-fit-interval = SISRE mod tilpasningsinterval

js-kind-title-sisre-against-update-period = SISRE mod opdateringsperiode

js-kind-title-sisre-weights = SISRE-vægte

js-kind-title-snapshot = Øjebliksbillede

js-kind-title-snapshot-against-the-model = Øjebliksbillede mod modellen

js-kind-title-snapshot-spectrum-welch-estimate-against = Øjebliksbilledets spektrum: Welch-estimat mod modellen

js-kind-title-sources = Kilder

js-kind-title-spoofer-and-monitor-settings = Indstillinger for spoofer og monitor

js-kind-title-spoofing-monitor-probability-of-detection = Spoofing-monitor: detektionssandsynlighed

js-kind-title-statistics-over-the-runs = Statistik over kørslerne

js-kind-title-sweep = Sweep

js-kind-title-systems = Systemer

js-kind-title-systems-in-the-fix = Systemer i positionsbestemmelsen

js-kind-title-the-archived-campaign = Den arkiverede kampagne

js-kind-title-time-error = Tidsfejl

js-kind-title-time-error-by-receiver-clock = Tidsfejl efter modtagerur

js-kind-title-time-scale = Tidsskala

js-kind-title-time-to-first-fix-and = Tid til første positionsbestemmelse og energi pr. positionsbestemmelse

js-kind-title-time-transfer-by-clock-and = Tidsoverførsel efter ur og signalniveau

js-kind-title-trade-conditions = Afvejningsbetingelser

js-kind-title-update-period-trade = Afvejning af opdateringsperiode

js-kind-title-user = Bruger

js-kind-title-user-range-error-through-the = Brugerens afstandsfejl gennem overflyvningen

js-kind-title-validated = Valideret

js-kind-title-what-each-stage-hands-to = Hvad hvert trin giver videre til det næste

js-kind-title-what-this-run-is-and = Hvad denne kørsel er, og hvad den ikke er

js-kind-title-when-each-monitor-detects = Hvornår hver monitor detekterer

js-kind-title-work-done = Udført arbejde

js-kind-yes = ja

js-ledger-rows =
    { $n ->
        [one] { $n } registerrække
       *[other] { $n } registerrækker
    }

js-lib-abbr-apv = indflyvning med vertikal vejledning

js-lib-abbr-araim = avanceret autonom integritetsovervågning i modtageren

js-lib-abbr-auc = areal under kurven

js-lib-abbr-c-n0 = bærebølge-til-støj-tæthed

js-lib-abbr-ccsds = Consultative Committee for Space Data Systems

js-lib-abbr-cli = kommandolinjegrænseflade

js-lib-abbr-csac = atomur i chipstørrelse

js-lib-abbr-cw = kontinuerlig bølge

js-lib-abbr-doi = digital objektidentifikator

js-lib-abbr-dop = præcisionsforringelse

js-lib-abbr-eo = jordobservation

js-lib-abbr-gnss = globalt navigationssatellitsystem

js-lib-abbr-gps = Global Positioning System

js-lib-abbr-hal = horisontal alarmgrænse

js-lib-abbr-hpl = horisontalt beskyttelsesniveau

js-lib-abbr-imu = inertimåleenhed

js-lib-abbr-ins = inertinavigationssystem

js-lib-abbr-iot = tingenes internet

js-lib-abbr-itu-t = International Telecommunication Union, Telecommunication Standardization Sector

js-lib-abbr-j-s = forhold mellem jammer- og signaleffekt

js-lib-abbr-leo = lav jordbane

js-lib-abbr-llr = månelaserafstandsmåling

js-lib-abbr-meo = mellemhøj jordbane

js-lib-abbr-mtie = maksimal tidsintervalfejl

js-lib-abbr-ntn = ikke-terrestrisk netværk

js-lib-abbr-ocxo = ovnstyret krystaloscillator

js-lib-abbr-oem = Orbit Ephemeris Message

js-lib-abbr-omm = Orbit Mean-elements Message

js-lib-abbr-pdop = positionspræcisionsforringelse

js-lib-abbr-pnt = positionering, navigation og tidssynkronisering

js-lib-abbr-ppp = præcis punktpositionering

js-lib-abbr-raim = autonom integritetsovervågning i modtageren

js-lib-abbr-rf = radiofrekvens

js-lib-abbr-rinex = Receiver Independent Exchange Format

js-lib-abbr-roc = modtagerens operationelle karakteristik

js-lib-abbr-sbas = satellitbaseret supplerende system

js-lib-abbr-sgp4 = Simplified General Perturbations 4, en banepropagator

js-lib-abbr-sisre = signal-i-rummet-afstandsfejl

js-lib-abbr-slam = samtidig lokalisering og kortlægning

js-lib-abbr-spp = enkeltpunktspositionering

js-lib-abbr-tdev = tidsafvigelse

js-lib-abbr-tle = tolinjet elementsæt

js-lib-abbr-toml = scenariefilformatet

js-lib-abbr-trn = terrænreferenceret navigation

js-lib-abbr-uhf = ultrahøj frekvens

js-lib-abbr-ukf = unscented Kalman-filter

js-lib-abbr-utc = Coordinated Universal Time

js-lib-abbr-val = vertikal alarmgrænse

js-lib-abbr-vlbi = interferometri med meget lang basislinje

js-lib-abbr-vpl = vertikalt beskyttelsesniveau

js-lib-abbr-wg = Arbejdsgruppe

js-lib-areas-ground-track = Jordspor

js-lib-areas-holdover = Holdover

js-lib-compare-availability = Tilgængelighed

js-lib-compare-holdover = Holdover

js-lib-compare-timing-p95 = Tidssynkronisering p95

js-lib-compare-timing-rms = Tidssynkronisering RMS

js-lib-counts-explorer-tally = { $validated } af { $total } funktioner valideret mod en uafhængig ekstern reference · { $modelled } modelleret · { $partner } ejet af partneren — vist her som { $cards } funktionskort i { $domains } områder, { $evidence } evidenspåstande

js-lib-counts-validated-tally = { $validated } af { $total } funktioner valideret mod en uafhængig ekstern reference — vist her som { $cards } funktionskort og { $evidence } evidenspåstande

js-lib-engine-busy = { $verb }…

js-lib-engine-busy-seconds = { $verb }… { $s } s

js-lib-engine-page-http = motorfilen returnerede HTTP { $status }

js-lib-engine-page-not-running = motoren kører ikke her

js-lib-engine-worker-crashed = motorens arbejdstråd gik ned

js-lib-evidence-aria = Evidens: { $tier }, { $count }

js-lib-evidence-ledger-rows =
    { $n ->
        [one] { $n } registerrække
       *[other] { $n } registerrækker
    }

js-lib-evidence-rows-behind = Registerrækker bag dette resultat

js-lib-geometry-url-bad-mc = Antallet af Monte Carlo-stikprøver er ikke et af { $choices }; { $default } bruges.

js-lib-geometry-url-bad-number = "{ $key }" er ikke et tal fra { $min } til { $max }; standarden bruges.

js-lib-geometry-url-bad-site = Stedet er ikke breddegrad,længdegrad[,højde] inden for intervallet; standardstedet bruges.

js-lib-geometry-url-bad-sky = Horisontprofilen er hverken en forudindstilling, en tabel med 360 intervaller eller en gadekløft inden for intervallet; en åben horisont bruges.

js-lib-geometry-url-bad-sys = Konstellationslisten er ikke G, E, C og højst én L:<LEO preset>, som denne visning kender; standardblandingen bruges.

js-lib-geometry-url-own-tle = Afsenderen brugte sine egne baneelementer (TLE), som et link ikke bærer; forudindstillingerne vises i stedet.

js-lib-geometry-url-repeated = "{ $key }" forekommer mere end én gang; den første værdi bruges.

js-lib-geometry-url-too-long = Adressen er længere end { $max } tegn, så ingen af dens indstillinger blev læst.

js-lib-geometry-url-unreadable = Adressen kunne ikke læses.

js-lib-guided-duration-s-hint = hvor længe jordsporet skal propageres

js-lib-guided-duration-s-label = Varighed (s)

js-lib-guided-dut1-s-hint = Jordens rotationsforskydning; flytter jordsporet mod øst/vest

js-lib-guided-dut1-s-label = UT1−UTC (s)

js-lib-guided-mask-deg-hint = en satellit skal være så høj for at tælle som synlig

js-lib-guided-mask-deg-label = Elevationsmaske (°)

js-lib-guided-seed-hint = et andet støjudtræk af den samme fysik

js-lib-guided-seed-label = Tilfældigt seed

js-lib-guided-sigma-uere-m-hint = 1-σ brugerækvivalent afstandsfejl til positionsopsummeringen

js-lib-guided-sigma-uere-m-label = Afstandsfejl σ (m)
