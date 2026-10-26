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
