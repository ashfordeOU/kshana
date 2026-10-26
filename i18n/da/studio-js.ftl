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

js-cat-lunar-station-coverage-public-sources-question = Alene under de offentligt angivne antagelser, hvilken korrigeret fejl giver stationen over sydpolen? Resultatet domineres af banelementerne, som ikke er offentlige og er sat ILLUSTRATIVE; dette er input til den frosne forudsigelse. (modelberegnet; ikke en udtalelse om noget virkeligt system)

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

js-lib-guided-station-lat-deg-hint = jordstationens breddegrad — styrer overflyvningens geometri

js-lib-guided-station-lat-deg-label = Stationens breddegrad (°)

js-lib-guided-station-lon-deg-hint = jordstationens længdegrad

js-lib-guided-station-lon-deg-label = Stationens længdegrad (°)

js-lib-guided-step-s-hint = samplingtakt for jordsporet

js-lib-guided-step-s-label = Tidstrin (s)

js-lib-guided-threshold-ns-hint = budget inden for specifikationen; "tilgængelig", så længe fejlen forbliver under det

js-lib-guided-threshold-ns-label = Specifikationstærskel (ns)

js-lib-guided-time-duration-s-hint = samlet kørselslængde

js-lib-guided-time-duration-s-label = Varighed (s)

js-lib-guided-time-step-s-hint = integrations-/samplingtakt

js-lib-guided-time-step-s-label = Tidstrin (s)

js-lib-guided-user-altitude-km-hint = brugerrumfartøjets banehøjde

js-lib-guided-user-altitude-km-label = Brugerens højde (km)

js-lib-guided-user-inclination-deg-hint = brugerbanens inklination

js-lib-guided-user-inclination-deg-label = Brugerens inklination (°)

js-lib-imufit-card-accel-slope = Accelerometerets Allan-hældning, tidligt (omkring -0.5 for hvid støj)

js-lib-imufit-card-bias = Accelerometerbias, middel (m/s²)

js-lib-imufit-card-bias-instability = Accelerometerets biasinstabilitet (m/s²), 0 når kurven ikke har noget bundniveau

js-lib-imufit-card-gyro-bias = Gyrobias, middel (rad/s)

js-lib-imufit-card-gyro-slope = Gyroens Allan-hældning, tidligt (omkring -0.5 for hvid støj)

js-lib-imufit-card-note-n = Note { $n }

js-lib-imufit-card-q-arw = Gyroens vinkelrandomwalk, q_arw (rad²/s)

js-lib-imufit-card-q-va = Accelerometerets hastighedsrandomwalk, q_va (m²/s³)

js-lib-imufit-card-sample-rate = Samplingrate

js-lib-imufit-card-samples = Sampler

js-lib-imufit-card-span = Interval

js-lib-jammertest-card-clean-epochs = Rene epoker

js-lib-jammertest-card-clean-hours = Rene timer

js-lib-jammertest-card-detected = Detekteret inden for tolerancen

js-lib-jammertest-card-detection-rate = Detektionsrate (enhver alarm)

js-lib-jammertest-card-evaluable = Evaluerbare

js-lib-jammertest-card-fa-epochs = Epoker med falsk alarm

js-lib-jammertest-card-fa-per-hour = Kørsler med falsk alarm pr. time

js-lib-jammertest-card-fa-runs = Kørsler med falsk alarm

js-lib-jammertest-card-in-tol-rate = Detekteret inden for tolerancen, rate

js-lib-jammertest-card-late = Sene

js-lib-jammertest-card-median-latency = Median detektionslatenstid

js-lib-jammertest-card-median-recover = Mediantid til genopretning

js-lib-jammertest-card-missed = Overset

js-lib-jammertest-card-na = n/a

js-lib-jammertest-card-not-assessable = Ingen test kunne evalueres i denne log, så der kan ikke angives en detektionsrate eller latenstid. Det er et resultat, ikke en fejl i siden: intet her er bestået.

js-lib-jammertest-card-not-json = { $name }: ikke JSON ({ $reason }).

js-lib-jammertest-card-not-scorecard = { $name }: ikke et jammertest-resultatkort (det kræver tests[] og summary).

js-lib-jammertest-card-tests = Tests i planudsnittet

js-lib-jammertest-card-too-large = { $name }: større end 8 MiB; denne side læser et resultatkort op til den størrelse.

js-lib-kpi-available-everywhere = tilgængelig overalt, i hver epoke

js-lib-kpi-available-everywhere-pdop = tilgængelig overalt, i hver epoke (PDOP, positionspræcisionsforringelse, under { $thr })

js-lib-kpi-drops-under = falder under sporingstærsklen på { $thr } dB-Hz: låsen mistes

js-lib-kpi-end-of-mission = ved missionens slutning

js-lib-kpi-figure-tiers = Niveauer for tallene: { $parts }.

js-lib-kpi-n-modelled = { $n } modelleret

js-lib-kpi-n-partner = { $n } ejet af partneren

js-lib-kpi-n-validated = { $n } valideret

js-lib-kpi-no-change = ingen ændring

js-lib-kpi-no-fix = { $pct } % af tiden eller stederne uden positionsbestemmelse

js-lib-kpi-no-fix-pdop = { $pct } % af tiden eller stederne uden positionsbestemmelse ved PDOP under { $thr }

js-lib-kpi-over-jump = over springtærsklen på { $thr } m

js-lib-kpi-over-pdop = over PDOP-tærsklen { $thr }

js-lib-kpi-stays-above = forbliver over sporingstærsklen på { $thr } dB-Hz

js-lib-kpi-under-jump = under springtærsklen på { $thr } m

js-lib-kpi-under-pdop = under PDOP-tærsklen { $thr }

js-lib-orbit3d-apogee = apogæum

js-lib-orbit3d-perigee = perigæum

js-lib-orbit3d-prov-scenario = scenarie { $hash }

js-lib-orbit3d-title = Bane (ECI, ortografisk)

js-lib-orbit3d-view-angles = az { $az }° · el { $el }°

js-lib-overlay-meta-clock-bias-m = Urbias

js-lib-overlay-meta-converged-pos-3sigma-m = Position 3σ

js-lib-overlay-meta-converged-pos-rms-m = Position RMS

js-lib-overlay-meta-converged-pos-sigma-m = Position σ

js-lib-overlay-meta-final-clock-freq-sigma = Urfrekvens-σ

js-lib-overlay-meta-mean-relays-in-view = Relæer i sigte

js-lib-overlay-meta-pos-p95-m = Position p95

js-lib-overlay-meta-pos-rms-m = Position RMS

js-lib-overlay-meta-postfit-rms-m = RMS efter tilpasning

js-lib-overlay-prov-scenario = scenarie { $hash }

js-lib-overlay-subtitle =
    |fejl| (ns) mod tid — { $n ->
        [one] { $n } kørsel
       *[other] { $n } kørsler
    }

js-lib-overlay-time-s = tid (s)

js-lib-overlay-title = Overlay: tidsfejl under udfald

js-lib-packs-cannot-unpack = denne browser kan ikke pakke den optagne fil ud

js-lib-replay-demos-below-130 = Kun azimutter under 130° bevaret (angivet)

js-lib-replay-demos-coastal-drag-off = Kystnær drag-off

js-lib-replay-demos-combined-event = Kombineret hændelse

js-lib-replay-demos-drag-off-stated = Positions-drag-off (angivet af demoen)

js-lib-replay-demos-ferry-drag-off = Færgepassage, positions-drag-off

js-lib-replay-demos-ferry-drag-off-description = En opdigtet færgelog, Tallinn til Helsinki, 1 Hz. Fra 1500 s trækker en positions-drag-off den rapporterede position væk, mens modtageren fortsat rapporterer en gyldig positionsbestemmelse.

js-lib-replay-demos-fjord = Naturlig forringelse i fjord

js-lib-replay-demos-masked-sky = Færgepassage, halvdelen af himlen maskeret

js-lib-replay-demos-masked-sky-description = Den samme færgelog, hvor den vestlige halvdel af himlen er gjort tavs fra 600 s, en smallere himmel fra 900 s til 1200 s og drag-off fra 1500 s: én kørsel, hvor himlen, signalet og positionen svigter efter tur.

js-lib-replay-demos-open-sea-jamming = Jamming på åbent hav

js-lib-replay-demos-port-approach = Tids-spoofing ved havneindsejling

js-lib-replay-demos-source-training = Syntetisk scenarie { $id }: motorens nmea_training-strøm og instruktørlog, scoret af dens receiver-trust.

js-lib-replay-demos-source-trust = Syntetisk log { $id }: opdigtet NMEA, scoret af motorens receiver-trust.

js-lib-replay-demos-west-masked = Vestlig halvdel af himlen maskeret (angivet)

js-lib-replay-demos-west-masked-again = Vestlig halvdel maskeret igen (angivet)

js-lib-report-charts = Diagrammer

js-lib-report-eyebrow = det præcise øjeblik

js-lib-report-figures-of-merit = Kvalitetsmål

js-lib-report-footer = Kshana { $version } · scenarie { $hash } · genereret { $iso }. Kan gengives ud fra scenarie + seed + motorversion. Kører lokalt; intet uploadet.

js-lib-report-not-applicable = ikke relevant (intet angreb konfigureret)

js-lib-report-scenario-definition = Scenariedefinition (TOML)

js-lib-report-th-clock = Ur

js-lib-report-th-metric = Metrik

js-lib-report-th-validation = Validering

js-lib-report-th-value = Værdi

js-lib-report-tier-note = Hvert kvalitetsmål er mærket { $validated } (kontrolleret mod en uafhængig ekstern reference) eller { $modelled } (fra grundprincipper, internt testet) — afledt af verifikationsmatricen.

js-lib-report-title = Kshana — scenarierapport

js-lib-skydraw-azimuth-range = azimut { $from } til { $to } grader

js-lib-skydraw-describe =
    { $listed ->
        [one] { $listed } satellit opført
       *[other] { $listed } satellitter opført
    }, { $heard } med et signal

js-lib-skydraw-describe-mean =
    { $listed ->
        [one] { $listed } satellit opført
       *[other] { $listed } satellitter opført
    }, { $heard } med et signal, middel { $snr } dB-Hz

js-lib-skydraw-east = Ø

js-lib-skydraw-no-signal-from = intet signal fra { $sectors }

js-lib-skydraw-none-listed = Ingen satellitter opført i loggen på dette tidspunkt.

js-lib-skydraw-north = N

js-lib-skydraw-sat-heard = { $sys } { $prn }: elevation { $el }, azimut { $az }, signal { $snr } dB-Hz

js-lib-skydraw-sat-quiet = { $sys } { $prn }: elevation { $el }, azimut { $az }, opført, intet signal

js-lib-skydraw-south = S

js-lib-skydraw-unheard-sector = Satellitter opført mellem azimut { $from } og { $to } grader, ingen med signal

js-lib-skydraw-west = V

js-lib-skyline-edit-describe = Horisontprofil over { $blocked } af 360 grader azimut; højeste { $el }° ved azimut { $az }°.

js-lib-skyline-edit-open = Åben horisont: ingen horisontprofil.

js-lib-stages-all-planets = Alle planeter

js-lib-stages-au-from-sun = { $d } au fra Solen

js-lib-stages-band-carrier = { $name }-bærebølge, { $mhz } MHz

js-lib-stages-bin-title =
    { $from } til { $to }{ $unit }: { $count ->
        [one] { $count } kørsel
       *[other] { $count } kørsler
    }

js-lib-stages-body-and-moons = { $name } og dens måner

js-lib-stages-cell-title = bredde { $lat }°, længde { $lon }° · { $field } { $value }

js-lib-stages-chain-navmsg = Navigationsbesked

js-lib-stages-chain-pass = Overflyvning og link

js-lib-stages-chain-ppp = Præcis punktpositionering

js-lib-stages-chain-pvt = Fusioneret positionsbestemmelse

js-lib-stages-chain-signal = Signaludformning

js-lib-stages-coverage-aria = { $field } over { $body }, efter breddegrad og længdegrad

js-lib-stages-feature-n = objekt { $n }

js-lib-stages-flag = flag

js-lib-stages-frequency-mhz = frekvens (MHz)

js-lib-stages-from-to = { $from } til { $to }

js-lib-stages-geojson-aria = GeoJSON-eksporten tegnet på et kort

js-lib-stages-histogram = Histogram

js-lib-stages-inner-planets = Indre planeter

js-lib-stages-km-from-centre = { $d } km fra { $centre }

js-lib-stages-linear-scale = lineær skala

js-lib-stages-link-light-time = { $from } til { $to }: envejs-lystid { $time } s

js-lib-stages-longitude-axis = længdegrad · breddegrad op ad siden

js-lib-stages-mission-time = missionstid (s)

js-lib-stages-noise-floor = støjgulv

js-lib-stages-orrery-note = { $scale } · referencesystemets x-y-plan, set fra dets nordpol

js-lib-stages-panel-n = Panel { $n }

js-lib-stages-plan-view-aria = Planvisning af { $centre } og legemerne omkring det, { $scale }

js-lib-stages-psd-at-t = Effektspektraltæthed ved t = { $t } s

js-lib-stages-psd-axis = effektspektraltæthed (dBW/Hz)

js-lib-stages-runs = kørsler

js-lib-stages-sat-title = { $constellation } { $id } · bredde { $lat }°, længde { $lon }°

js-lib-stages-satellites = satellitter

js-lib-stages-spectrum-at-t = spektrum ved t = { $t } s

js-lib-stages-sqrt-scale = kvadratrodsskala for afstand

js-lib-stages-the-body = legemet

js-lib-stages-time-s = tid (s)

js-lib-stages-unit-alarm = Alarm

js-lib-stages-unit-cn0 = Bærebølge-til-støj-tæthed

js-lib-stages-unit-position = Position og beskyttelse

js-lib-stages-unit-satellites = Satellitter

js-lib-stages-unit-time-error = Tidsfejl

js-lib-stages-waterfall-aria = Vandfaldsdiagram over effektspektraltæthed: frekvens på tværs, tid nedad

js-lib-stages-whole-band = Hele båndet

js-lib-sweep-clock-availability = { $who } tilgængelighed

js-lib-sweep-clock-holdover = { $who } holdover (s)

js-lib-sweep-clock-timing-p95 = { $who } tidssynkronisering p95 (ns)

js-lib-sweep-clock-timing-rms = { $who } tidssynkronisering RMS (ns)

js-lib-sweep-max-altitude = maks. højde (km)

js-lib-sweep-max-elevation = maks. elevation (°)

js-lib-sweep-max-speed = maks. hastighed (m/s)

js-lib-sweep-min-altitude = min. højde (km)

js-lib-sweep-peak-doppler = spidsværdi for Doppler (Hz)

js-lib-sweep-prov-scenario = scenarie { $hash }

js-lib-sweep-y-vs-x = { $y } mod { $x }

js-lib-tabs-3d-orbit = 3D-bane

js-lib-tabs-figures-of-merit = Kvalitetsmål

js-lib-tabs-stability = Stabilitet

js-lib-tabs-sweep = Sweep

js-lib-tabs-time-series = Tidsserie

js-lib-tour-ashforde-body = Tak, fordi du udforskede Kshana. Vi bygger åben, reproducerbar og evidensbaseret teknik til missioner, der ikke må fejle — ærlige om, hvad der er valideret, og hvad der er modelleret. Spørgsmål, et samarbejde eller en undersøgelse? Skriv til os på contact@ashforde.org.

js-lib-tour-ashforde-title = Fra Ashforde® OÜ

js-lib-tour-capabilities-body = Vælg en områdefane — Baner, Tidssynkronisering, Inertial, GNSS, Robusthed, Måne, AI/ML, Interoperabilitet — for at se dens funktioner, hver mærket Valideret eller Modelleret, med en ▸ kør-knap til de gennemarbejdede scenarier. Åbn “Evidens og proveniens” i et hvilket som helst område for at spore beviset, eller slå “Kun valideret” til for kun at vise det, der er kontrolleret mod en uafhængig ekstern reference.

js-lib-tour-capabilities-title = Udforsk motoren, ét område ad gangen

js-lib-tour-cite-body = Kshana er bygget til at blive henvist til — en citérbar softwareudgivelse med en DOI samt artikler i peer-stil om optimismegabet ved RF-forringelser og et betinget beskyttelsesniveau for tidssynkronisering. Kopiér citatet direkte herfra.

js-lib-tour-cite-title = Publikationer og sådan citerer du

js-lib-tour-download-report-body = Fanen Sweep varierer én parameter over et interval; “Fastgør til sammenligning” lægger to eller flere kørsler ovenpå hinanden side om side med Δ imellem dem (virker på tværs af scenarietyper — ur, Mars-PNT, positionering…); og denne knap downloader kørslen som en selvstændig HTML-rapport til offline brug.

js-lib-tour-download-report-title = Sweep, sammenlign og eksporter

js-lib-tour-guided-body = De guidede knapper tilpasser sig scenariet — seed, specifikationstærskel, varighed, elevationsmaske, banehøjde — og hver ændring kører straks igen.

js-lib-tour-guided-title = Justér skyderne

js-lib-tour-mcp-body = En MCP-server lader AI-assistenter køre den validerede motor i stedet for at gætte; et JetBrains-plugin kører scenarier med et højreklik.

js-lib-tour-mcp-title = Brug den fra en AI-agent eller din IDE

js-lib-tour-playground-body = Vælg et scenarie i rullemenuen — eller tryk på ▸ kør ved en vilkårlig funktion ovenfor — og motoren kører som WebAssembly på din maskine. Intet uploades.

js-lib-tour-playground-title = Kør den i din browser

js-lib-tour-run-body = Kør det aktuelle scenarie. Åbn “Avanceret” for at redigere TOML og ændre hvad som helst; “Kopiér delingslink” gengiver netop denne kørsel for en anden.

js-lib-tour-run-title = Kør den

js-lib-tour-tabs-body = Skift mellem kvalitetsmålene, tidsseriediagrammet, urets stabilitet (Allan-deviation) og — for banekørsler — en interaktiv 3D-banevisning.

js-lib-tour-tabs-title = Læs resultaterne

js-lib-tour-validation-body = Den samme udforsker er også evidensregisteret: hvert område har en skuffe “Evidens og proveniens” — tallet, den uafhængige reference, det er kontrolleret mod, og en ærlig status Valideret / Modelleret for hver påstand. “Kun valideret” filtrerer til de rækker, der er kontrolleret mod et datasæt.

js-lib-tour-validation-title = Evidens, ikke tillægsord

js-lib-views-3-sigma-bound = 3-sigma-grænse

js-lib-views-3d-position-error = 3-D-positionsfejl

js-lib-views-a-parameter = en parameter

js-lib-views-band-runs =
    Tidsfejlsbånd over { $runs ->
        [one] { $runs } Monte Carlo-kørsel
       *[other] { $runs } Monte Carlo-kørsler
    }

js-lib-views-band-the-runs = Tidsfejlsbånd over Monte Carlo-kørslerne

js-lib-views-below-tracking = under sporingstærsklen

js-lib-views-chart = diagram

js-lib-views-classical = klassisk

js-lib-views-epoch = epoke

js-lib-views-four-needed = 4 kræves til en positionsbestemmelse

js-lib-views-free-inertial = fri inertial

js-lib-views-gnss-denied = GNSS nægtet

js-lib-views-ground-track = Jordspor

js-lib-views-heatmap-effective = Effektiv bærebølge-til-støj-tæthed efter satellit og tid

js-lib-views-heatmap-nominal = Nominel (uden jammer) bærebølge-til-støj-tæthed efter satellit og tid

js-lib-views-horizontal-alert-limit = horisontal alarmgrænse

js-lib-views-horizontal-hpl = horisontal (HPL)

js-lib-views-id-bound = { $id }-grænse

js-lib-views-id-median = { $id } median

js-lib-views-id-offset = { $id }-forskydning

js-lib-views-id-p95 = { $id } p95

js-lib-views-map-matched = kortmatchet

js-lib-views-map-matched-title = Kortmatchet mod positionsfejl for fri inertial

js-lib-views-metric = metrik

js-lib-views-oscillator = oscillator

js-lib-views-oscillator-source = oscillator ({ $source })

js-lib-views-position-error-axis = positionsfejl ({ $unit })

js-lib-views-position-error-m = positionsfejl (m)

js-lib-views-position-error-run = Positionsfejl over kørslen

js-lib-views-position-m = position (m)

js-lib-views-predicted-time-error = Forudsagt tidsfejl siden sidste positionsbestemmelse

js-lib-views-protection-level-m = beskyttelsesniveau (m)

js-lib-views-protection-levels = Beskyttelsesniveauer mod alarmgrænsen

js-lib-views-quantum = kvante

js-lib-views-relay-error-bound = Relænavigationens positionsfejl og dens 3-sigma-grænse

js-lib-views-satellites = satellitter

js-lib-views-satellites-tracking = Satellitter synlige og stadig sporet

js-lib-views-shaded-gnss-denied = skraveret: GNSS nægtet

js-lib-views-slot-guard = slotbeskyttelse

js-lib-views-spoofed-offset = Spoofet tidsforskydning mod detektionsgrænsen

js-lib-views-sweep-of = Sweep af { $parameter }: { $metric }

js-lib-views-sync-error-axis = synkroniseringsfejl ({ $unit })

js-lib-views-sync-error-run = Synkroniseringsfejl over kørslen

js-lib-views-threshold = tærskel

js-lib-views-time-error-ns = tidsfejl (ns)

js-lib-views-time-ns = tid (ns)

js-lib-views-time-s = tid (s)

js-lib-views-time-since-fix = tid siden sidste positionsbestemmelse (s)

js-lib-views-timing-error-axis = tidssynkroniseringsfejl ({ $unit })

js-lib-views-timing-error-run = Tidssynkroniseringsfejl over kørslen

js-lib-views-tracking = sporer

js-lib-views-value = værdi

js-lib-views-vertical-vpl = vertikal (VPL)

js-lib-views-visible = synlig

js-lib-views-word-enbw = ækvivalent støjbåndbredde

js-lib-views-word-nfft = FFT-længde

js-lib-views-word-stec = skrå TEC

js-lib-views-word-toa = ankomsttid

js-lib-views-word-ttff = tid til første positionsbestemmelse

js-lib-views-word-tx = send

js-lib-views-word-zwd = zenit-vådforsinkelse

js-lunar-address-outside-range = { $label }: "{ $raw }" er uden for { $min } til { $max }; filens værdi bruges.

js-lunar-address-too-long = Adressen var for lang; standardværdierne vises.

js-lunar-address-unknown-source = Ukendt kilde i adressen; optagelsen vises.

js-lunar-alert-limit = alarmgrænse { $value } (illustrativ)

js-lunar-alert-not-stated = alarmgrænse ikke angivet

js-lunar-bearing-east = 90° Ø

js-lunar-bearing-west = 90° V

js-lunar-cell-title = { $lat }°, { $lon }°: korrigeret { $corrected }, tilgængelighed { $availability }, dækning { $coverage }

js-lunar-copy-address = Kopiér adressen fra adressefeltet.

js-lunar-counts =
    { $sats ->
        [one] { $sats } satellit
       *[other] { $sats } satellitter
    }, { $points ->
        [one] { $points } gitterpunkt
       *[other] { $points } gitterpunkter
    }, { $epochs ->
        [one] { $epochs } epoke
       *[other] { $epochs } epoker
    }, { $trials } Monte Carlo-forsøg pr. epoke. Mærkat: { $label }.

js-lunar-engine-no-start = Motoren kunne ikke starte i denne browser ({ $reason }). Åbn i stedet en resultatfil.

js-lunar-engine-unknown-kind = Denne motor ({ $version }) kender ikke typen { $kind }; den kræver motor 0.36.

js-lunar-fig-availability-region = Tilgængelighed over området

js-lunar-fig-corrected-3d = Korrigeret fejl, { $n } %, 3‑D

js-lunar-fig-coverage = Dækning

js-lunar-fig-epochs-within = epoker inden for { $value }

js-lunar-fig-horizontal-vertical = horisontal { $h }, vertikal { $v }

js-lunar-fig-hpl-below-alert = HPL under alarmgrænsen

js-lunar-fig-hpl-vpl = HPL, VPL højst

js-lunar-fig-improvement = Forbedringsfaktor

js-lunar-fig-lowest-point = Laveste i et punkt

js-lunar-fig-points-always-available = Punkter tilgængelige i hver epoke

js-lunar-fig-uncorrected-3d = Ukorrigeret fejl, { $n } %, 3‑D

js-lunar-fig-worst-point = Dårligste punkt

js-lunar-file-not-json = Denne fil er ikke JSON.

js-lunar-file-not-object = Denne fil er ikke et JSON-objekt.

js-lunar-file-too-large = { $name }: større end 32 MiB; denne side læser resultatfiler op til den størrelse.

js-lunar-file-value = fil: { $value }

js-lunar-full-of-total = { $full } af { $total }

js-lunar-give-value = { $label }: angiv en værdi fra { $min } til { $max }.

js-lunar-give-whole-value = { $label }: angiv en værdi fra { $min } til { $max } (et helt tal).

js-lunar-honesty-affiliation = Ikke tilknyttet eller anbefalet af nogen myndighed.

js-lunar-honesty-assumptions = Under de angivne offentlige antagelser, ikke en udtalelse om ydeevnen i noget virkeligt system.

js-lunar-in-grid-spacing = Gitterringenes afstand, grader

js-lunar-in-latency = Korrektionslatenstid, sekunder

js-lunar-in-seed = Seed

js-lunar-in-station-lat = Stationens breddegrad, grader

js-lunar-in-station-lon = Stationens længdegrad, grader

js-lunar-in-survey-error = Stationens opmålingsfejl (1-sigma), meter

js-lunar-in-threshold = Nøjagtighedstærskel, meter

js-lunar-in-time-step = Tidstrin, sekunder

js-lunar-in-trials = Monte Carlo-forsøg pr. epoke

js-lunar-input-out-of-range = { $label } er uden for intervallet.

js-lunar-json-field-not-json = Filens json-felt er ikke JSON.

js-lunar-key-50-or-more = 50 % eller mere

js-lunar-key-90-or-more = 90 % eller mere

js-lunar-key-95-or-more = 95 % eller mere

js-lunar-key-99-or-more = 99 % eller mere

js-lunar-key-above = over { $value }

js-lunar-key-above-threshold = over { $value } × tærskel

js-lunar-key-below-50 = under 50 %

js-lunar-key-between = { $from } til { $to }

js-lunar-key-between-threshold = { $from } til { $to } × tærskel

js-lunar-key-up-to = op til { $value }

js-lunar-key-up-to-threshold = op til { $value } × tærskel

js-lunar-layer-availability = tilgængelighed

js-lunar-layer-coverage = dækning

js-lunar-layer-error = korrigeret fejl

js-lunar-layer-range = korrigeret fejl over eget interval

js-lunar-legend-no-figure = ingen værdi (utilgængelig overalt)

js-lunar-legend-radius = dækningsradius

js-lunar-legend-threshold = tærskel, { $value }

js-lunar-legend-worst = dårligste punkt

js-lunar-link-copied = Link kopieret.

js-lunar-map-desc =
    { $points ->
        [one] { $points } gitterpunkt
       *[other] { $points } gitterpunkter
    } fra polen til { $rim }° bredde. { $meet } af dem har en korrigeret fejl ved percentil { $percentile } inden for tærsklen på { $threshold }. Farvet efter { $layer }. Stationen ligger ved { $lat }°, { $lon }°.

js-lunar-map-note-one-band = { $share } % af punkterne falder i ét bånd på tærskelskalaen, så kortet viser kun lidt variation: farv efter "eget interval" for at se, hvordan fejlen varierer henover området.

js-lunar-needs-newer-engine = Denne undersøgelse kræver motor { $need } eller nyere; motoren, der kører her, er v{ $version }. Optagelsen eller en resultatfil kan stadig vises.

js-lunar-no = nej

js-lunar-no-recording = Der følger endnu ingen optagelse af denne undersøgelse med: den laves ved udgivelsen med motor 0.36. Kør den her med en motor, der har typen, eller åbn en resultatfil.

js-lunar-no-scenario = Dette websted har endnu ingen { $file }: den kommer med motor 0.36. Åbn i stedet en resultatfil.

js-lunar-no-scenario-note = Dette websted har endnu ingen { $file } (den kommer med motor 0.36), så en kørsel her er ikke mulig; åbn i stedet en resultatfil.

js-lunar-not-report = Dette er ikke en { $kind }-rapport.

js-lunar-not-stated = ikke angivet

js-lunar-note-none = Filen angiver ingen note.

js-lunar-note-withheld = Filens egen erklæring nævner et program eller en myndighed, så denne side viser den ikke; erklæringen øverst på siden gælder.

js-lunar-point-epochs-reason = punktepoker: { $reason }

js-lunar-radius-desc = Dækningsradius over { $count } azimutter: korteste { $lo } km ved { $loAz }°, længste { $hi } km ved { $hiAz }°.

js-lunar-radius-desc-limited = { $count } når kanten af gitteret, så dækningen rækker mindst så langt dér.

js-lunar-radius-hollow = Hule punkter når kanten af gitteret: dækningen holder mindst så langt langs den retning.

js-lunar-radius-none = Rapporten angiver ingen dækningsradius.

js-lunar-radius-per-azimuth = dækningsradius pr. azimut

js-lunar-radius-point = { $az }°: { $km } km

js-lunar-radius-point-limited = { $az }°: { $km } km (når kanten af gitteret: mindst så langt)

js-lunar-radius-zero = I alle retninger er dækningen allerede under 95 % ved stationen, så radius er 0 km: den korrigerede fejl overstiger tærsklen på { $value } dér.

js-lunar-reason-station-missing = stationen ser ikke alle de satellitter, brugeren bruger

js-lunar-reason-user-lt4 = færre end fire satellitter i sigte for brugeren

js-lunar-run-stopped = Kørslen stoppede: { $message }

js-lunar-running = Kører undersøgelsen i denne browser…

js-lunar-running-elapsed = Kører undersøgelsen i denne browser… { $seconds } s

js-lunar-scenario-missing-keys = Scenariefilen har ingen { $keys }; den kan ikke ændres her.

js-lunar-set-inputs = Angiv input, og tryk på Kør den her.

js-lunar-showing = Viser { $what }.

js-lunar-showing-engine = Viser { $what } (motor { $version }).

js-lunar-source-error = { $what }: { $error }

js-lunar-station = station

js-lunar-station-title = station { $lat }°, { $lon }°

js-lunar-table-count =
    { $n ->
        [one] { $n } punkt
       *[other] { $n } punkter
    }, nærmest stationen først.

js-lunar-th-corrected = Korrigeret fejl, { $n } %

js-lunar-threshold-title = korrigeret fejl { $value } (tærsklen)

js-lunar-what-file = filen { $name }

js-lunar-what-recording = optagelsen, der følger med Studio

js-lunar-what-run = en kørsel i denne browser (motor { $version })

js-lunar-worst-at = ved { $lat }°, { $lon }°

js-lunar-worst-title = dårligste punkt { $lat }°, { $lon }°: { $value }

js-lunar-yes-at-least = ja: mindst så langt

js-lunarinfra-above-95-point = over 95 %-punktet

js-lunarinfra-advisory = Vejledende software, ikke typegodkendt udstyr; ingen sendesti af nogen art.

js-lunarinfra-arc-note = Bærebølgens bølgelængde { $value } m.

js-lunarinfra-arc-title = Hver bue

js-lunarinfra-bars-not-loaded = tærskelfilen blev ikke indlæst

js-lunarinfra-bars-not-shown = De præregistrerede tærskler kunne ikke vises ({ $reason }).

js-lunarinfra-bars-note = Fastlagt, før nogen undersøgelse blev scoret, med de registrerede afgørelser (motorcommit { $commit }). Intet er VALIDATED; en tærskel mærket NOT MET er fastholdt af en test, der fastslår, at den ikke blev nået, og ingen er blevet lempet.

js-lunarinfra-bars-title = Mod de præregistrerede tærskler

js-lunarinfra-bars-wrong-file = tærskelfilen er ikke den, denne side læser

js-lunarinfra-blurb-carrier-phase = En overfladestation og en orbiter, der bruger dobbeltdifferentieret bærebølgefase fra Jord-GNSS-signaler: kan heltalsmultipliciteterne fastlægges, og hvad gør det ved positionsgrænsen? Den hurtige eksempelkørsel.

js-lunarinfra-blurb-frame-coestimation = Månens datums syv parametre ud fra laserafstandsmåling fra jordstationer, med og uden afstande fra orbiter til overfladestation: hvor meget forbedres informationen?

js-lunarinfra-blurb-geodesy-sensitivity = Hvor følsomme er laserafstandsmåling, orbitersporing, et gravimeter og et overfladeur over for Månens tidevands-Love-tal h2, k2 og l2 og dens fysiske libration?

js-lunarinfra-blurb-od-consistency = Banebestemmelse om bord med Jord-GNSS i en næsten retlinet halobane, mod en uafhængig radiometrisk løsning fra jorden for den samme bue: stemmer de to overens inden for deres angivne usikkerheder, og opdager konsistenskontrollen en modelfejl, når en indsprøjtes? Vist side om side.

js-lunarinfra-blurb-space-tie = GNSS, VLBI og laserafstandsmåling på ét rumfartøj: hvor præcist kan forskydningerne mellem de tre teknikker bindes sammen, set mod fejlen i den lokale forbindelse på rumfartøjet?

js-lunarinfra-bound-label = Positionsusikkerhed, float og fixed, logaritmisk skala

js-lunarinfra-bound-note = Ét-sigma positionsusikkerhed for stationen og orbiteren, med multipliciteterne holdt som float og med dem fixed (hvad fixing ville give, hvis den blev nået).

js-lunarinfra-bound-title = Positionsgrænse, float og fixed

js-lunarinfra-chip-na = n/a

js-lunarinfra-comp-normal = normal

js-lunarinfra-comp-position = position (3-D)

js-lunarinfra-comp-radial = radial

js-lunarinfra-comp-transverse = tværgående

js-lunarinfra-compare-note = Over { $sets } tilfældige stationssæt var den mindste egenværdi ikke mindre med orbiterlinkene i { $lambda } og sporet ikke større i { $trace }; den mediane stigning i den mindste egenværdi var { $median } gange.

js-lunarinfra-compare-title = Sammenligningen i tal

js-lunarinfra-crsigma-label = Cramér-Rao-sigma, logaritmisk skala

js-lunarinfra-crsigma-note = I meter ved overfladen.

js-lunarinfra-crsigma-title = Cramér-Rao-sigma pr. parameter

js-lunarinfra-days =
    { $n ->
        [one] { $n } dag
       *[other] { $n } dage
    }

js-lunarinfra-direction = retning { $n }

js-lunarinfra-disclosures = Oplysninger

js-lunarinfra-eig-label = Informationens egenværdier, logaritmisk skala

js-lunarinfra-eig-note = De syv egenværdier i informationsmatricen, mindste først, uden og med linkene mellem orbiter og station. Den mindste stiger { $times } gange, og Cramér-Rao-sporet falder til { $share } af sin værdi. Dette forudsætter, at banen er kendt i månens akser (dens fejl bæres af orbiterens afstandssigma).

js-lunarinfra-eig-title = Information i hver retning af datummet

js-lunarinfra-fact-arc = Bue

js-lunarinfra-fact-hash = Scenariehash

js-lunarinfra-fact-llr-rows = Laserafstandsmålingsrækker

js-lunarinfra-fact-orbit-family = Banefamilie

js-lunarinfra-fact-orbiter-arc = Orbiterbue

js-lunarinfra-fact-orbiter-rows = Orbiterrækker

js-lunarinfra-fact-study = Undersøgelse

js-lunarinfra-fact-wavelength = Bærebølgens bølgelængde

js-lunarinfra-families-note = Kvadratmiddelværdien af hver parameters partielle afledede over familiens rækker og antallet af rækker. Et nul er en parameter, den familie er blind over for. Orbiterfamiliens k2-følsomhed er et tal i den høje ende.

js-lunarinfra-families-title = Hvad hver familie ser

js-lunarinfra-findings = Fund

js-lunarinfra-fix-note-a = Andelen af Monte Carlo-forsøg, der fastlagde hver heltalsmultiplicitet korrekt (med dens standardfejl), og den rate, det bootstrappede estimat forudsiger.

js-lunarinfra-fix-note-b = Heltalsfastlæggelse opnås IKKE ved dette input: den bedste bue fastlægger { $share } af forsøgene.

js-lunarinfra-fix-note-c = Der er ingen tid til fastlæggelse at vise, fordi fastlæggelse ikke nås.

js-lunarinfra-fix-rate-label = Rate for heltalsfastlæggelse mod buelængde

js-lunarinfra-fix-title = Fastlæggelsesrate mod buelængde

js-lunarinfra-fixed = fixed

js-lunarinfra-float = float

js-lunarinfra-fraction-above-95 = Andel af forsøg over 95 %-punktet

js-lunarinfra-ground-radiometric = uafhængig radiometrisk fra jorden

js-lunarinfra-injected-error = indsprøjtet fejl { $value } m/s²

js-lunarinfra-mean-consistency = Gennemsnitlig konsistensstatistik

js-lunarinfra-mean-q = gennemsnitlig q

js-lunarinfra-miss-line = { $id } er { $status }: { $value }

js-lunarinfra-miss-no-fix = Fastlæggelse af heltalsmultiplicitet opnås IKKE ved dette input: den bedste bue fastlægger { $share } af Monte Carlo-forsøgene.

js-lunarinfra-na = n/a

js-lunarinfra-nominal = nominel

js-lunarinfra-not-result = dette er ikke et resultat for månens infrastruktur

js-lunarinfra-not-verified = Ikke verificeret

js-lunarinfra-offset-precision-label = Forskydningspræcision mod lokal forbindelse, log-log

js-lunarinfra-offsets-note = Translationssigma pr. akse, skalerings- og rotationssigma ved overfladen, i meter.

js-lunarinfra-offsets-title =
    Forskydningerne ved hver forbindelsesfejl ({ $days }-dages bue, { $epochs ->
        [one] { $epochs } epoke
       *[other] { $epochs } epoker
    })

js-lunarinfra-onboard-gnss = Jord-GNSS om bord

js-lunarinfra-open-failed = { $title } kunne ikke åbnes: { $reason }.

js-lunarinfra-opening = Åbner { $title }…

js-lunarinfra-orbit-uncertainty-log = Banens usikkerhed efter komponent, logaritmisk skala

js-lunarinfra-orbiter-days = orbiter, { $days } d

js-lunarinfra-q-note = Middelværdi af konsistensstatistikken q over { $trials } forsøg; { $expected } er, hvad et konsistent par løsninger giver. Andelen af forsøg over 95 %-punktet er kontrollens detektionsrate.

js-lunarinfra-q-title = Konsistenskontrollen, nominel mod indsprøjtet fejl

js-lunarinfra-recorded =
    { $n ->
        [one] { $title }: motorens optagede resultat (version { $version }).
       *[other] { $title }: motorens optagede resultater (version { $version }).
    }

js-lunarinfra-rel-label = Sigma over nominel, logaritmisk skala

js-lunarinfra-rel-note = Cramér-Rao-sigma som procent af den nominelle værdi, med alle fire familier samlet. h2 og l2 er linearisationspunkter, ikke verificerede værdier; k2 stammer fra en offentliggjort tilpasning.

js-lunarinfra-rel-title = Hvor godt hver parameter kan fastlægges, set mod dens nominelle værdi

js-lunarinfra-result-not-json = resultatet er ikke JSON ({ $reason })

js-lunarinfra-result-not-loaded = det optagede resultat { $file } blev ikke indlæst

js-lunarinfra-row-above-95 = Forsøg over 95 %-punktet (chi-i-anden 95 % = { $chi })

js-lunarinfra-row-crtrace = Cramér-Rao-spor

js-lunarinfra-row-degeneracy = Degenerationsmål

js-lunarinfra-row-formal-diff = Formel sigma for den forskel

js-lunarinfra-row-ground-meas = Jord: målinger, epoker med en station

js-lunarinfra-row-mean-diff = Gennemsnitlig forskel mellem de to baner

js-lunarinfra-row-mean-q = Gennemsnitlig q (6 forventet)

js-lunarinfra-row-observations = Observationer

js-lunarinfra-row-onboard-epochs = Om bord: epoker med ét eller flere / fire eller flere satellitter

js-lunarinfra-row-onboard-meas = Om bord: målinger, gennemsnitligt antal satellitter sporet

js-lunarinfra-row-origin-scale = Korrelation mellem oprindelse og skala

js-lunarinfra-row-origin-sigma = Oprindelsessigma, m

js-lunarinfra-row-rank-defect = Rang (defekt)

js-lunarinfra-row-smallest-eig = Mindste egenværdi

js-lunarinfra-row-trace-ground = Stikprøve over formelt spor, jord

js-lunarinfra-row-trace-onboard = Stikprøve over formelt spor, om bord

js-lunarinfra-row-within-95 = Forsøg inden for 95 %-punktet

js-lunarinfra-series-bootstrapped = bootstrappet

js-lunarinfra-series-floor = bundniveau

js-lunarinfra-series-monte-carlo = Monte Carlo

js-lunarinfra-side-note = Banen: { $family }, en { $arc }-dages bue af en { $period }-dages bane, samplet hvert { $sample } s.

js-lunarinfra-side-title = Side om side

js-lunarinfra-sigma-note = Ét-sigma positionsusikkerhed pr. komponent, i meter, fra de to estimater af den samme bue.

js-lunarinfra-sigma-over-nominal = sigma / nominel

js-lunarinfra-sigma-title = Hvor godt hver side kender banen

js-lunarinfra-station-days = station, { $days } d

js-lunarinfra-status-verdict = { $status }: { $verdict }

js-lunarinfra-subsets-note = Tilføjelse af en familie sænkede aldrig den mindste egenværdi ({ $lambda } af { $pairs } tilføjelser), men sporet af pseudoinversen var kun i { $trace } af { $pairs } ikke større, fordi en tilføjet familie kan hæve rangen.

js-lunarinfra-subsets-title = Hver kombination af familier

js-lunarinfra-sweep-note = Den værste translationskomponent for hver forskydning, i meter, mens fejlen i forbindelsen mellem de tre teknikker på rumfartøjet sweepes. Med de registrerede teknik-sigmaer (GNSS { $gnss } m, VLBI { $vlbi } m, laser { $slr } m) er forskydningerne begrænset af målestøj, ikke af forbindelsen; forbindelsen sætter kun bundniveauet for næsten perfekte teknikker.

js-lunarinfra-sweep-title = Præcision af teknikforskydningerne mod den lokale forbindelse ({ $days }-dages bue)

js-lunarinfra-th-arc-days = Bue, dage

js-lunarinfra-th-bar = Tærskel

js-lunarinfra-th-bootstrapped = Bootstrappet rate

js-lunarinfra-th-budget-exhausted = Søgebudget opbrugt (forsøg)

js-lunarinfra-th-common-sats = Epoker med 2 eller flere fælles satellitter

js-lunarinfra-th-crtrace = Cramér-Rao-spor

js-lunarinfra-th-dd-ambiguities = Dobbeltdifferencerede multipliciteter

js-lunarinfra-th-epochs = Epoker

js-lunarinfra-th-families = Familier

js-lunarinfra-th-family = Familie

js-lunarinfra-th-local-tie = Lokal forbindelses-sigma, m

js-lunarinfra-th-mc-fix-rate = Monte Carlo-fixrate

js-lunarinfra-th-median-ambiguity = Median multiplicitetssigma, cyklusser

js-lunarinfra-th-offset = Forskydning

js-lunarinfra-th-quantity = Størrelse

js-lunarinfra-th-rank = Rang

js-lunarinfra-th-rotation = Rotation ved overfladen, m

js-lunarinfra-th-rows = Rækker

js-lunarinfra-th-scale = Skala ved overfladen, m

js-lunarinfra-th-smallest-eig = Mindste egenværdi

js-lunarinfra-th-translation = Translation x, y, z, m

js-lunarinfra-th-value = Værdi

js-lunarinfra-th-verdict = Vurdering

js-lunarinfra-th-with-links = Med orbiterlinks

js-lunarinfra-th-without-links = Uden orbiterlinks

js-lunarinfra-title-carrier-phase = Bærebølgefase, overflade og orbiter

js-lunarinfra-title-frame-coestimation = Samtidig estimering af referencesystem

js-lunarinfra-title-geodesy-sensitivity = Love-tal og libration

js-lunarinfra-title-od-consistency = Konsistens i banebestemmelse

js-lunarinfra-title-space-tie = Forbindelse i rummet

js-lunarinfra-unknown-study = dette resultat for månens infrastruktur gælder undersøgelsen "{ $study }", som denne side ikke læser

js-lunarinfra-where-missed = Hvor denne undersøgelse ikke nåede målet.

js-lunarinfra-with-links = med orbiterlinks

js-lunarinfra-without-links = uden orbiterlinks

js-lunarinfra-x-arc-length = buelængde, dage

js-lunarinfra-x-local-tie = lokal forbindelses-sigma, m (log)

js-lunarinfra-y-fixed-correctly = fastlagt korrekt, %

js-lunarinfra-y-offset-sigma = forskydningssigma, m (log); den stiplede bundlinje er forbindelsen alene, sqrt(2) × forbindelsesfejlen

js-meaning-body-generic = legemet

js-meaning-body-the = { $name }

js-meaning-card-label-sub = { $k }, { $sub }

js-meaning-checks-of =
    { $n ->
        [one] { $av } af { $n } kontrol
       *[other] { $av } af { $n } kontroller
    }

js-meaning-coverage-average-label = Gennemsnit i sigte

js-meaning-coverage-big-min =
    { $n ->
        [one] Mindst { $n } satellit i sigte alle steder, { $mean } i gennemsnit.
       *[other] Mindst { $n } satellitter i sigte alle steder, { $mean } i gennemsnit.
    }

js-meaning-coverage-big-none = Nogle steder ser til tider ingen satellit; { $mean } er i sigte i gennemsnit.

js-meaning-coverage-fewest-label = Færrest i sigte, hvor som helst

js-meaning-coverage-line-many = Med { $names } tilsammen er en positionsbestemmelse mulig på { $share } % af stederne og tidspunkterne omkring { $body }.

js-meaning-coverage-line-many-pdop = Med { $names } tilsammen er en positionsbestemmelse mulig på { $share } % af stederne og tidspunkterne omkring { $body } (geometrikvalitet, PDOP, under { $thr }).

js-meaning-coverage-line-none = En positionsbestemmelse er mulig på { $share } % af stederne og tidspunkterne omkring { $body }.

js-meaning-coverage-line-none-pdop = En positionsbestemmelse er mulig på { $share } % af stederne og tidspunkterne omkring { $body } (geometrikvalitet, PDOP, under { $thr }).

js-meaning-coverage-line-one = Med { $names } er en positionsbestemmelse mulig på { $share } % af stederne og tidspunkterne omkring { $body }.

js-meaning-coverage-line-one-pdop = Med { $names } er en positionsbestemmelse mulig på { $share } % af stederne og tidspunkterne omkring { $body } (geometrikvalitet, PDOP, under { $thr }).

js-meaning-coverage-places-label = Steder, der får en positionsbestemmelse

js-meaning-duration-days =
    { $n ->
        [one] { $days } dag
       *[other] { $days } dage
    }

js-meaning-ensemble-big-many = Over mange støjudtræk holder { $q } { $thr } ns i { $qd } i gennemsnit; { $c } i { $cd }.

js-meaning-ensemble-big-runs =
    { $n ->
        [one] Over { $n } støjudtræk holder { $q } { $thr } ns i { $qd } i gennemsnit; { $c } i { $cd }.
       *[other] Over { $n } støjudtræk holder { $q } { $thr } ns i { $qd } i gennemsnit; { $c } i { $cd }.
    }

js-meaning-ensemble-line = Ni udtræk ud af ti for { $name } holder sig fra { $band }.

js-meaning-ensemble-mean = middel

js-meaning-ensemble-mean-band = middel; 90 %-bånd { $band }

js-meaning-error-p95-label = Fejl, 95 % af tiden, { $name }

js-meaning-generic-big = { $label }: { $value }.

js-meaning-generic-line-one = Også fra denne kørsel: { $a }.

js-meaning-generic-line-two = Også fra denne kørsel: { $a } og { $b }.

js-meaning-generic-none = Denne kørsel har intet enkelt hovedtal; diagrammet nedenfor viser dens resultat.

js-meaning-holdover-label = Holdover, { $name }

js-meaning-hpl-sub = horisontalt beskyttelsesniveau

js-meaning-inside-budget = inden for { $budget }

js-meaning-integrity-big-checks-mostly = Ja, for det meste: ved { $share } % af kontrollerne.

js-meaning-integrity-big-checks-no = Nej: ved { $share } % af kontrollerne.

js-meaning-integrity-big-checks-partly = Kun delvist: ved { $share } % af kontrollerne.

js-meaning-integrity-big-checks-yes = Ja: ved { $share } % af kontrollerne.

js-meaning-integrity-big-span-mostly = Ja, for det meste: i { $share } % af { $span }.

js-meaning-integrity-big-span-no = Nej: i { $share } % af { $span }.

js-meaning-integrity-big-span-partly = Kun delvist: i { $share } % af { $span }.

js-meaning-integrity-big-span-yes = Ja: i { $share } % af { $span }.

js-meaning-integrity-bound-label = Typisk fejlgrænse

js-meaning-integrity-bound-sub = horisontalt / vertikalt, median

js-meaning-integrity-gap-all-passed = alle kontroller bestået

js-meaning-integrity-gap-label = Længste hul

js-meaning-integrity-gap-none = ingen

js-meaning-integrity-gap-sub =
    { $n ->
        [one] { $n } kontrol i træk, fra { $from }
       *[other] { $n } kontroller i træk, fra { $from }
    }

js-meaning-integrity-line-h =
    { $n ->
        [one] Modtagerens fejlgrænse (dens beskyttelsesniveau) holdt sig under alarmgrænserne ({ $h } m horisontalt) ved { $av } af { $tot } kontrol.
       *[other] Modtagerens fejlgrænse (dens beskyttelsesniveau) holdt sig under alarmgrænserne ({ $h } m horisontalt) ved { $av } af { $tot } kontroller.
    }

js-meaning-integrity-line-h-clean =
    { $n ->
        [one] Modtagerens fejlgrænse (dens beskyttelsesniveau) holdt sig under alarmgrænserne ({ $h } m horisontalt) ved { $av } af { $tot } kontrol, og ingen positionsbestemmelse var vildledende.
       *[other] Modtagerens fejlgrænse (dens beskyttelsesniveau) holdt sig under alarmgrænserne ({ $h } m horisontalt) ved { $av } af { $tot } kontroller, og ingen positionsbestemmelse var vildledende.
    }

js-meaning-integrity-line-h-some =
    { $n ->
        [one] Modtagerens fejlgrænse (dens beskyttelsesniveau) holdt sig under alarmgrænserne ({ $h } m horisontalt) ved { $av } af { $tot } kontroller; { $n } positionsbestemmelse var vildledende.
       *[other] Modtagerens fejlgrænse (dens beskyttelsesniveau) holdt sig under alarmgrænserne ({ $h } m horisontalt) ved { $av } af { $tot } kontroller; { $n } positionsbestemmelser var vildledende.
    }

js-meaning-integrity-line-hv =
    { $n ->
        [one] Modtagerens fejlgrænse (dens beskyttelsesniveau) holdt sig under alarmgrænserne ({ $h } m horisontalt og { $v } m vertikalt) ved { $av } af { $tot } kontrol.
       *[other] Modtagerens fejlgrænse (dens beskyttelsesniveau) holdt sig under alarmgrænserne ({ $h } m horisontalt og { $v } m vertikalt) ved { $av } af { $tot } kontroller.
    }

js-meaning-integrity-line-hv-clean =
    { $n ->
        [one] Modtagerens fejlgrænse (dens beskyttelsesniveau) holdt sig under alarmgrænserne ({ $h } m horisontalt og { $v } m vertikalt) ved { $av } af { $tot } kontrol, og ingen positionsbestemmelse var vildledende.
       *[other] Modtagerens fejlgrænse (dens beskyttelsesniveau) holdt sig under alarmgrænserne ({ $h } m horisontalt og { $v } m vertikalt) ved { $av } af { $tot } kontroller, og ingen positionsbestemmelse var vildledende.
    }

js-meaning-integrity-line-hv-some =
    { $n ->
        [one] Modtagerens fejlgrænse (dens beskyttelsesniveau) holdt sig under alarmgrænserne ({ $h } m horisontalt og { $v } m vertikalt) ved { $av } af { $tot } kontroller; { $n } positionsbestemmelse var vildledende.
       *[other] Modtagerens fejlgrænse (dens beskyttelsesniveau) holdt sig under alarmgrænserne ({ $h } m horisontalt og { $v } m vertikalt) ved { $av } af { $tot } kontroller; { $n } positionsbestemmelser var vildledende.
    }

js-meaning-integrity-line-none =
    { $n ->
        [one] Modtagerens fejlgrænse (dens beskyttelsesniveau) holdt sig under alarmgrænsen ved { $av } af { $tot } kontrol.
       *[other] Modtagerens fejlgrænse (dens beskyttelsesniveau) holdt sig under alarmgrænsen ved { $av } af { $tot } kontroller.
    }

js-meaning-integrity-line-none-clean =
    { $n ->
        [one] Modtagerens fejlgrænse (dens beskyttelsesniveau) holdt sig under alarmgrænsen ved { $av } af { $tot } kontrol, og ingen positionsbestemmelse var vildledende.
       *[other] Modtagerens fejlgrænse (dens beskyttelsesniveau) holdt sig under alarmgrænsen ved { $av } af { $tot } kontroller, og ingen positionsbestemmelse var vildledende.
    }

js-meaning-integrity-line-none-some =
    { $n ->
        [one] Modtagerens fejlgrænse (dens beskyttelsesniveau) holdt sig under alarmgrænsen ved { $av } af { $tot } kontroller; { $n } positionsbestemmelse var vildledende.
       *[other] Modtagerens fejlgrænse (dens beskyttelsesniveau) holdt sig under alarmgrænsen ved { $av } af { $tot } kontroller; { $n } positionsbestemmelser var vildledende.
    }

js-meaning-integrity-line-v =
    { $n ->
        [one] Modtagerens fejlgrænse (dens beskyttelsesniveau) holdt sig under alarmgrænserne ({ $v } m vertikalt) ved { $av } af { $tot } kontrol.
       *[other] Modtagerens fejlgrænse (dens beskyttelsesniveau) holdt sig under alarmgrænserne ({ $v } m vertikalt) ved { $av } af { $tot } kontroller.
    }

js-meaning-integrity-line-v-clean =
    { $n ->
        [one] Modtagerens fejlgrænse (dens beskyttelsesniveau) holdt sig under alarmgrænserne ({ $v } m vertikalt) ved { $av } af { $tot } kontrol, og ingen positionsbestemmelse var vildledende.
       *[other] Modtagerens fejlgrænse (dens beskyttelsesniveau) holdt sig under alarmgrænserne ({ $v } m vertikalt) ved { $av } af { $tot } kontroller, og ingen positionsbestemmelse var vildledende.
    }

js-meaning-integrity-line-v-some =
    { $n ->
        [one] Modtagerens fejlgrænse (dens beskyttelsesniveau) holdt sig under alarmgrænserne ({ $v } m vertikalt) ved { $av } af { $tot } kontroller; { $n } positionsbestemmelse var vildledende.
       *[other] Modtagerens fejlgrænse (dens beskyttelsesniveau) holdt sig under alarmgrænserne ({ $v } m vertikalt) ved { $av } af { $tot } kontroller; { $n } positionsbestemmelser var vildledende.
    }

js-meaning-integrity-misleading-label = Vildledende positionsbestemmelser

js-meaning-integrity-misleading-sub = reel fejl over grænsen

js-meaning-integrity-trusted-label = Tid, positionsbestemmelsen kan stoles på

js-meaning-jamming-above-label = Jammer over signalet

js-meaning-jamming-above-sub = gennemsnitligt jammer-til-signal-forhold

js-meaning-jamming-big-gone = Jammeren fjerner positionsbestemmelsen helt.

js-meaning-jamming-big-share = Med jammeren er en positionsbestemmelse tilgængelig { $share } % af tiden.

js-meaning-jamming-clear-label = Positionsbestemmelse tilgængelig, ingen jammer

js-meaning-jamming-fewest-label = Færrest satellitter sporet

js-meaning-jamming-fewest-sub = i det værste øjeblik

js-meaning-jamming-jammed-label = Positionsbestemmelse tilgængelig, jammet

js-meaning-jamming-line = Uden jammeren er positionsbestemmelsen tilgængelig { $share } % af tiden.

js-meaning-jamming-line-js = Uden jammeren er positionsbestemmelsen tilgængelig { $share } % af tiden; jammeren ankommer i gennemsnit { $db } dB over signalet.

js-meaning-kicker = { $domain } · { $title }

js-meaning-lunar-big-all =
    { $n ->
        [one] Ja: ved hver eneste af { $n } kontrol.
       *[other] Ja: ved hver eneste af { $n } kontroller.
    }

js-meaning-lunar-big-none =
    { $n ->
        [one] Nej: ved ingen af { $n } kontrol.
       *[other] Nej: ved ingen af { $n } kontroller.
    }

js-meaning-lunar-big-some =
    { $n ->
        [one] Ved { $av } af { $n } kontrol ({ $share } %).
       *[other] Ved { $av } af { $n } kontroller ({ $share } %).
    }

js-meaning-lunar-largest-label = Største fejlgrænse

js-meaning-lunar-line = Beskyttelsesniveauet lå fra { $min } til { $max } m mod en alarmgrænse på { $limit } m.

js-meaning-lunar-meet-label = Kontroller inden for grænsen

js-meaning-lunar-meet-value = { $av } af { $tot }

js-meaning-lunar-smallest-label = Mindste fejlgrænse

js-meaning-median-lower-better = median, lavere er bedre

js-meaning-of-the-time = af tiden

js-meaning-orbit-best-label = Bedste geometri (PDOP)

js-meaning-orbit-best-sub = lavest over kørslen

js-meaning-orbit-big-always = En positionsbestemmelse er mulig hele tiden.

js-meaning-orbit-big-share = En positionsbestemmelse er mulig { $share } % af tiden.

js-meaning-orbit-error-label = Typisk positionsfejl

js-meaning-orbit-error-sub = 1-sigma, median

js-meaning-orbit-line =
    { $n ->
        [one] Nok satellitter var i sigte ved { $fix } af { $n } tidspunkt.
       *[other] Nok satellitter var i sigte ved { $fix } af { $n } tidspunkter.
    }

js-meaning-orbit-line-pdop =
    { $n ->
        [one] Nok satellitter var i sigte ved { $fix } af { $n } tidspunkt; den typiske geometrikvalitet (PDOP, positionspræcisionsforringelse) er { $pdop }, lavere er bedre.
       *[other] Nok satellitter var i sigte ved { $fix } af { $n } tidspunkter; den typiske geometrikvalitet (PDOP, positionspræcisionsforringelse) er { $pdop }, lavere er bedre.
    }

js-meaning-orbit-moments =
    { $n ->
        [one] { $fix } af { $n } tidspunkt
       *[other] { $fix } af { $n } tidspunkter
    }

js-meaning-orbit-time-label = Tid, en positionsbestemmelse er mulig

js-meaning-pair-big-diff-pos = { $best } holder sig inden for { $budget } i { $bestDur }; { $other } i { $otherDur }.

js-meaning-pair-big-diff-time = { $best } holder tiden inden for { $budget } i { $bestDur }; { $other } i { $otherDur }.

js-meaning-pair-big-same-pos = Både { $q } og { $c } holder sig inden for { $budget } i { $dur }.

js-meaning-pair-big-same-time = Både { $q } og { $c } holder tiden inden for { $budget } i { $dur }.

js-meaning-pair-line-clock = Holdover er, hvor længe hvert ur holder sig inden for { $budget }-budgettet, efter at satellitnavigationen er tabt.

js-meaning-pair-line-navigator = Holdover er, hvor længe hver navigationsenhed holder sig inden for { $budget }-budgettet, efter at satellitnavigationen er tabt.

js-meaning-pdop-label = Geometrikvalitet (PDOP)

js-meaning-places-times = af steder og tidspunkter

js-meaning-range-to = { $from } til { $to }

js-meaning-satellites =
    { $n ->
        [one] satellit
       *[other] satellitter
    }

js-meaning-spectrum-above = over tærsklen

js-meaning-spectrum-below = under tærsklen: tabt

js-meaning-spectrum-big-kept =
    { $n ->
        [one] Hvert eneste af { $n } signal bliver ved med at blive sporet.
       *[other] Hvert eneste af { $n } signaler bliver ved med at blive sporet.
    }

js-meaning-spectrum-big-lost =
    { $n ->
        [one] Jammerne fjerner { $lost } af { $n } signal: { $names }.
       *[other] Jammerne fjerner { $lost } af { $n } signaler: { $names }.
    }

js-meaning-spectrum-line-kept =
    { $n ->
        [one] { $names } bliver over modtagerens sporingstærskel under hele kørslen.
       *[other] { $names } bliver over modtagerens sporingstærskel under hele kørslen.
    }

js-meaning-spectrum-line-kept-thr =
    { $n ->
        [one] { $names } bliver over modtagerens sporingstærskel på { $thr } dB-Hz under hele kørslen.
       *[other] { $names } bliver over modtagerens sporingstærskel på { $thr } dB-Hz under hele kørslen.
    }

js-meaning-spectrum-line-none = Intet signal bliver over modtagerens sporingstærskel under hele kørslen.

# 2026-10-01-studio-rebuild/lib/meaning.mjs:195
js-meaning-spectrum-line-none-thr = Intet signal holder sig over modtagerens sporingstærskel på { $thr } dB-Hz i hele kørslen.

# 2026-10-01-studio-rebuild/lib/meaning.mjs:196
js-meaning-spectrum-weakest-label = Svageste signal, { $name }

# 2026-10-01-studio-rebuild/lib/meaning.mjs:155
js-meaning-whole-run = i hele kørslen

# 2026-10-01-studio-rebuild/lib/meaning.mjs:249
js-meaning-your-setting = din indstilling

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:506
js-meankind-acm-big =
    { $n ->
        [one] Adaptiv kodning flytter { $gain } gange så mange data som den bedste faste tilstand: { $acm } Gbit mod { $ccm } Gbit over { $n } overflyvning.
       *[other] Adaptiv kodning flytter { $gain } gange så mange data som den bedste faste tilstand: { $acm } Gbit mod { $ccm } Gbit over { $n } overflyvninger.
    }

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:506
js-meankind-acm-line = Fast tilstand { $mode }; { $dur } udfald.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:246
js-meankind-anomaly-big = Den kvantebaserede fejlovervågning opnår { $q } mod { $c } for den klassiske (areal under kurven, 1 er perfekt).

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:246
js-meankind-anomaly-line = Den mindste fejl, der kan opdages, er { $q } mod { $c }.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:511
js-meankind-aocs-big-open = Drejningen på { $slew } grader falder ikke til ro under { $threshold } grader.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:511
js-meankind-aocs-big-settles = Drejningen på { $slew } grader falder til ro under { $threshold } grader efter { $dur }.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:517
js-meankind-aocs-line = Endelig pejlefejl { $final } grader.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:516
js-meankind-aocs-line-filter = Endelig pejlefejl { $final } grader. Et attitudefilter i sløjfen afviger med { $arcsec } buesekunder RMS.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:515
js-meankind-aocs-line-wheel = Endelig pejlefejl { $final } grader. Maksimalt hjulmoment { $torque } N m.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:514
js-meankind-aocs-line-wheel-filter = Endelig pejlefejl { $final } grader. Maksimalt hjulmoment { $torque } N m. Et attitudefilter i sløjfen afviger med { $arcsec } buesekunder RMS.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:360
js-meankind-aperture-big = Navigation bruger { $nav } % af antennetiden og kommunikation { $comms } %.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:360
js-meankind-aperture-big-idle = Navigation bruger { $nav } % af antennetiden og kommunikation { $comms } %; { $idle } % er ledig.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:350
js-meankind-aperture-line-all =
    { $n ->
        [one] { $n } apertur under reglen { $policy }, med { $dur } konflikt.
       *[other] { $n } aperturer under reglen { $policy }, med { $dur } konflikt.
    }

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:352
js-meankind-aperture-line-contention =
    { $n ->
        [one] { $n } apertur, med { $dur } konflikt.
       *[other] { $n } aperturer, med { $dur } konflikt.
    }

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:353
js-meankind-aperture-line-count =
    { $n ->
        [one] { $n } apertur.
       *[other] { $n } aperturer.
    }

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:358
js-meankind-aperture-line-nocount = Aperturerne.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:355
js-meankind-aperture-line-nocount-all = Aperturerne under reglen { $policy }, med { $dur } konflikt.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:357
js-meankind-aperture-line-nocount-contention = Aperturerne, med { $dur } konflikt.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:356
js-meankind-aperture-line-nocount-policy = Aperturerne under reglen { $policy }.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:351
js-meankind-aperture-line-policy =
    { $n ->
        [one] { $n } apertur under reglen { $policy }.
       *[other] { $n } aperturer under reglen { $policy }.
    }

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:257
js-meankind-araim-big-no = Nej: motorens beskyttelsesniveauer afviger fra den publicerede reference.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:257
js-meankind-araim-big-yes = Ja: motorens beskyttelsesniveauer stemmer med den publicerede reference.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:257
js-meankind-araim-line = Den største forskel er { $worst } m mod referencens egen tolerance på { $tol } m.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:257
js-meankind-araim-line-vectors =
    { $n ->
        [one] Den største forskel er { $worst } m mod referencens egen tolerance på { $tol } m, over { $n } referencevektor.
       *[other] Den største forskel er { $worst } m mod referencens egen tolerance på { $tol } m, over { $n } referencevektorer.
    }

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:499
js-meankind-arc-big = Estimatoren genfinder banen, så snart den har { $dur } af buen på { $h } h.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:499
js-meankind-arc-line = { $n } rumfartøjer, { $observable }-målinger.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:522
js-meankind-ascent-big = Tyngdekraft, luftmodstand, styring og modtryk tager { $loss } m/s af den ideelle hastighedsforøgelse på { $ideal } m/s.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:522
js-meankind-ascent-line = Udbrænding ved { $km } km og { $speed } m/s; maksimalt dynamisk tryk { $kpa } kPa.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:456
js-meankind-attack-big-no = En spoofer på overfladen kan ikke overtage en månemodtager.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:456
js-meankind-attack-big-yes = En spoofer på overfladen kan overtage en månemodtager.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:456
js-meankind-attack-line = En sender på overfladen når { $km } km, før horisonten blokerer den.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:341
js-meankind-attitude-big = Pejlefejlen udgør i alt { $total } buesekunder.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:341
js-meankind-attitude-big-from = Pejlefejlen udgør i alt { $total } buesekunder, mest fra { $from }.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:341
js-meankind-attitude-line = Det største tyngdegradientmoment er { $torque } N·m.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:442
js-meankind-beacon-big = Overfladefyr forbedrer geometrikvaliteten (PDOP) { $x } gange.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:442
js-meankind-beacon-line = Hvis man i stedet tilføjer satellitter, forbedres den { $x } gange.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:424
js-meankind-bodypnt-big = Relæer alene giver en positionsbestemmelse { $share } % af tiden omkring { $body }.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:424
js-meankind-bodypnt-big-earth = Relæer alene giver en positionsbestemmelse { $share } % af tiden omkring { $body }; { $earth } % med forbindelser til Jorden.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:424
js-meankind-bodypnt-line = { $mean } relæer er i sigte i gennemsnit.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:23
js-meankind-by = { $a } gange { $b }

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:90
js-meankind-campaign-compose-line = Hvert medlem er en almindelig motorkørsel; kampagnen viser deres resultater side om side.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:90
js-meankind-campaign-compose-range =
    { $n ->
        [one] På tværs af { $n } scenarie under de samme betingelser varierer { $what } fra { $low } til { $high }.
       *[other] På tværs af { $n } scenarier under de samme betingelser varierer { $what } fra { $low } til { $high }.
    }

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:90
js-meankind-campaign-compose-same =
    { $n ->
        [one] På tværs af { $n } scenarie under de samme betingelser er { $what } { $value } i hvert enkelt.
       *[other] På tværs af { $n } scenarier under de samme betingelser er { $what } { $value } i hvert enkelt.
    }

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:67
js-meankind-campaign-line =
    { $n ->
        [one] { $n } fase.
       *[other] { $n } faser.
    }

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:74
js-meankind-campaign-line-all =
    { $n ->
        [one] { $n } fase og { $events }, fra { $runs }; til sidst er { $label } { $value }.
       *[other] { $n } faser og { $events }, fra { $runs }; til sidst er { $label } { $value }.
    }

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:68
js-meankind-campaign-line-end =
    { $n ->
        [one] { $n } fase; til sidst er { $label } { $value }.
       *[other] { $n } faser; til sidst er { $label } { $value }.
    }

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:71
js-meankind-campaign-line-events =
    { $n ->
        [one] { $n } fase og { $events }.
       *[other] { $n } faser og { $events }.
    }

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:72
js-meankind-campaign-line-events-end =
    { $n ->
        [one] { $n } fase og { $events }; til sidst er { $label } { $value }.
       *[other] { $n } faser og { $events }; til sidst er { $label } { $value }.
    }

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:73
js-meankind-campaign-line-events-runs =
    { $n ->
        [one] { $n } fase og { $events }, fra { $runs }.
       *[other] { $n } faser og { $events }, fra { $runs }.
    }

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:69
js-meankind-campaign-line-runs =
    { $n ->
        [one] { $n } fase, fra { $runs }.
       *[other] { $n } faser, fra { $runs }.
    }

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:70
js-meankind-campaign-line-runs-end =
    { $n ->
        [one] { $n } fase, fra { $runs }; til sidst er { $label } { $value }.
       *[other] { $n } faser, fra { $runs }; til sidst er { $label } { $value }.
    }

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:56
js-meankind-campaign-mission-alarm = Alarmen udløses i { $alarm } af missionen på { $dur }.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:56
js-meankind-campaign-mission-phases = En mission med { $phases } faser over { $dur }, kædet sammen på ét ur.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:56
js-meankind-campaign-mission-quiet = Ingen alarm i hele missionen på { $dur }.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:82
js-meankind-campaign-montecarlo =
    { $n ->
        [one] På tværs af { $n } seedet kørsel er { $name } i gennemsnit { $mean }, med en spredning på { $std }.
       *[other] På tværs af { $n } seedede kørsler er { $name } i gennemsnit { $mean }, med en spredning på { $std }.
    }

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:82
js-meankind-campaign-montecarlo-line = Spredningen er én standardafvigelse over kørslerne.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:47
js-meankind-campaign-optimize =
    { $n ->
        [one] Søgningen lander på { $name } på { $value } efter { $n } kørsel.
       *[other] Søgningen lander på { $name } på { $value } efter { $n } kørsler.
    }

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:47
js-meankind-campaign-optimize-at = Ved { $at }.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:47
js-meankind-campaign-optimize-kind =
    { $n ->
        [one] Søgningen lander på { $name } på { $value } efter { $n } kørsel af { $kind }.
       *[other] Søgningen lander på { $name } på { $value } efter { $n } kørsler af { $kind }.
    }

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:102
js-meankind-campaign-sweep-flat =
    { $n ->
        [one] Over { $n } kørsel af { $axis } fra { $from } til { $to } forbliver { $metric } på { $value }.
       *[other] Over { $n } kørsler af { $axis } fra { $from } til { $to } forbliver { $metric } på { $value }.
    }

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:102
js-meankind-campaign-sweep-flat-line = Diagrammet viser hver kørsel.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:103
js-meankind-campaign-sweep-goes =
    { $n ->
        [one] Over { $n } kørsel af { $axis } fra { $from } til { $to } går { $metric } fra { $first } til { $last }.
       *[other] Over { $n } kørsler af { $axis } fra { $from } til { $to } går { $metric } fra { $first } til { $last }.
    }

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:103
js-meankind-campaign-sweep-goes-line = Diagrammet viser hver kørsel; den spænder fra { $min } til { $max }.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:163
js-meankind-classical-link = klassisk forbindelse

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:180
js-meankind-clock-word = ur

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:237
js-meankind-conflict-big = Den lagdelte arkitektur klarer sig { $ratio } gange bedre end et enkelt lag.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:236
js-meankind-conflict-line-threats = En Monte Carlo af truslerne giver { $ratio } gange.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:236
js-meankind-conflict-line-threats-corr = En Monte Carlo af truslerne giver { $ratio } gange; med korrelerede trusler kan det falde til { $low } gange.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:235
js-meankind-conflict-line-trials =
    { $n ->
        [one] En Monte Carlo med { $n } forsøg giver { $ratio } gange.
       *[other] En Monte Carlo med { $n } forsøg giver { $ratio } gange.
    }

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:235
js-meankind-conflict-line-trials-corr =
    { $n ->
        [one] En Monte Carlo med { $n } forsøg giver { $ratio } gange; med korrelerede trusler kan det falde til { $low } gange.
       *[other] En Monte Carlo med { $n } forsøg giver { $ratio } gange; med korrelerede trusler kan det falde til { $low } gange.
    }

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:529
js-meankind-contacts-big =
    { $n ->
        [one] Planen beholder { $kept } af { $n } mulig kontakt og leverer { $gbit } Gbit.
       *[other] Planen beholder { $kept } af { $n } mulige kontakter og leverer { $gbit } Gbit.
    }

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:529
js-meankind-contacts-big-waiting =
    { $n ->
        [one] Planen beholder { $kept } af { $n } mulig kontakt og leverer { $gbit } Gbit af de { $waiting } Gbit, der venter.
       *[other] Planen beholder { $kept } af { $n } mulige kontakter og leverer { $gbit } Gbit af de { $waiting } Gbit, der venter.
    }

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:529
js-meankind-contacts-line = { $sats } satellitter og { $stations } stationer over { $hours } h.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:446
js-meankind-dpnt-big = Differentielle korrektioner bringer fejlen fra { $from } m til { $to } m.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:446
js-meankind-dpnt-line = Med en referencestation { $km } km væk.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:33
js-meankind-duration-days =
    { $n ->
        [one] { $days } dag
       *[other] { $days } dage
    }

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:438
js-meankind-earthgnss-big =
    { $n ->
        [one] I Månens afstand er { $visible } af { $n } satellit i sigte, men { $trackable } kan spores.
       *[other] I Månens afstand er { $visible } af { $n } satellitter i sigte, men { $trackable } kan spores.
    }

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:438
js-meankind-earthgnss-line = Det bedste signal er { $best } dB-Hz mod en sporingstærskel på { $threshold } dB-Hz.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:61
js-meankind-engine-run-count =
    { $n ->
        [one] { $n } motorkørsel
       *[other] { $n } motorkørsler
    }

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:533
js-meankind-entry-big = Maksimal deceleration er { $g } g ved { $km } km, med en maksimal varmefluks på { $flux } W/cm².

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:533
js-meankind-entry-line = Indflyvning med { $speed } m/s, { $angle } grader under horisonten.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:365
js-meankind-eo-big = Kameraet ser en strimmel på { $swath } km i en opløsning på { $gsd } m.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:365
js-meankind-eo-line-contiguous = Sporene på jorden ligger { $km } km fra hinanden ved ækvator, så dækningen er sammenhængende.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:365
js-meankind-eo-line-gapped = Sporene på jorden ligger { $km } km fra hinanden ved ækvator, så dækningen har huller.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:415
js-meankind-eop-big = I Månens afstand fejer Jordens rotation { $m } m hvert sekund, så alderen på data om Jordens orientering ({ $dur } her) har betydning.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:415
js-meankind-eop-line = Input: { $source }.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:392
js-meankind-ephemeris-big = Satellitten flyver mellem { $min } og { $max } km, op til { $lat }° bredde.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:392
js-meankind-ephemeris-line = Set fra stationen stiger den til { $deg }°.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:392
js-meankind-ephemeris-line-doppler = Set fra stationen stiger den til { $deg }°, med op til { $khz } kHz Doppler.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:60
js-meankind-event-count =
    { $n ->
        [one] { $n } hændelse
       *[other] { $n } hændelser
    }

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:483
js-meankind-framecampaign-big-open =
    { $n ->
        [one] Kampagnen efterlader { $n } datumretning ubestemt.
       *[other] Kampagnen efterlader { $n } datumretninger ubestemte.
    }

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:483
js-meankind-framecampaign-big-yes = Ja: kampagnen fastlægger månens referencesystemdatum fuldt ud.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:483
js-meankind-framecampaign-line = Konditionstal { $n }.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:465
js-meankind-framereal-big = Månens referencesystem realiseres med { $m } m restfejl.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:465
js-meankind-framereal-big-open = Månens referencesystem realiseres med { $m } m restfejl, selv om tilpasningen ikke konvergerede.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:465
js-meankind-framereal-line = Translationsfejl { $trans } m, skalafejl { $scale } dele pr. milliard.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:261
js-meankind-gnsssim-big = Integritetsovervågning beskytter positionsbestemmelsen { $share } % af tiden.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:261
js-meankind-gnsssim-line = Ionosfæren tilfører i gennemsnit { $iono } m og troposfæren { $tropo } m til hver afstandsmåling.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:89
js-meankind-headline-figure = hovedtallet

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:561
js-meankind-holdovertest-big = Målt mod maskerne når postens holdover på { $dur } s op på { $te } ns tidsfejl.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:561
js-meankind-holdovertest-big-open = Målt mod maskerne når postens holdover på { $dur } s op på { $te } ns tidsfejl og kom sig ikke inden for båndet.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:561
js-meankind-holdovertest-big-recovered = Målt mod maskerne når postens holdover på { $dur } s op på { $te } ns tidsfejl og kom sig { $recover } s efter, at GNSS vendte tilbage.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:561
js-meankind-holdovertest-line = Målt mod masken, aldrig en udtalelse om, at et system opfylder kravene; de to tidspunkter er operatørens egen angivelse.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:561
js-meankind-holdovertest-line-masks = { $masks }. Målt mod masken, aldrig en udtalelse om, at et system opfylder kravene; de to tidspunkter er operatørens egen angivelse.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:242
js-meankind-impairment-big = Detektoren adskiller forringede signaler fra rene med et areal under kurven på { $auc } (1 er perfekt).

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:242
js-meankind-impairment-line = På tilfælde, der ikke ligner træningssættet, opnår den { $auc }.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:602
js-meankind-infra-carrier = Heltals-bærebølgefasefiksering mellem en overfladestation og en orbiter fikserede { $share } % af forsøgene på den længste bue ({ $days } dage).

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:606
js-meankind-infra-frame = Forbindelser mellem orbiter og station hæver den mindste informationsegenværdi for månens datum { $x } gange og skærer Cramér-Rao-sporet ned til { $share } %, hvis banen er kendt i månens akser.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:612
js-meankind-infra-geodesy = Med alle fire familier sammen er h2, k2 og l2 bundet til { $h2 } %, { $k2 } % og { $l2 } % af deres nominelle værdier.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:598
js-meankind-infra-od = Banebestemmelse om bord med Jord-GNSS i månebane er god til { $gnss } m, uafhængig jordsporing til { $ground } m; konsistensstatistikken har et gennemsnit på { $mean } ({ $expected } forventet).

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:594
js-meankind-infra-tail = MODELLED: en begrænset model med illustrative inputdata, ikke en udtalelse om nogen mission.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:609
js-meankind-infra-tie =
    { $n ->
        [one] Et lokalt bindeled på { $mm } mm på ét rumfartøj binder GNSS-, VLBI- og laserafstandsmålings-referencesystemerne over { $n } gennemløbet bindeledsfejl.
       *[other] Et lokalt bindeled på { $mm } mm på ét rumfartøj binder GNSS-, VLBI- og laserafstandsmålings-referencesystemerne over { $n } gennemløbne bindeledsfejl.
    }

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:148
js-meankind-inside-spec = inden for { $spec }

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:206
js-meankind-instrn-big = Når man glider på inerti alene, passerer positionsfejlen { $threshold } m efter { $dur }.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:206
js-meankind-instrn-dom = { $dominant } dominerer.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:206
js-meankind-instrn-line = Den passerer { $passes }.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:206
js-meankind-instrn-line-dom = Den passerer { $passes }; { $dominant } dominerer.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:205
js-meankind-instrn-pass = { $threshold } m efter { $dur }

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:469
js-meankind-interop-big-no = Nej: filen med månens efemerider kan ikke gemmes og indlæses uden ændringer.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:469
js-meankind-interop-big-yes = Ja: filen med månens efemerider kan gemmes og indlæses uden ændringer.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:469
js-meankind-interop-line = { $n } tilstande i referencesystemet { $frame }, tid { $time }.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:151
js-meankind-its-spec = dens specifikation

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:460
js-meankind-jointod-big = Tilføjelse af en jordbaseret interferometriforsinkelse gør stationens position { $x } gange skarpere.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:460
js-meankind-jointod-line = Stationen er så kendt til { $m } m.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:369
js-meankind-launch-big =
    { $n ->
        [one] { $n } opsendelsesmulighed om dagen når en bane på { $incl }° fra breddegrad { $lat }°.
       *[other] { $n } opsendelsesmuligheder om dagen når en bane på { $incl }° fra breddegrad { $lat }°.
    }

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:369
js-meankind-launch-line = Jordens rotation giver { $speed } m/s gratis.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:269
js-meankind-layer-agc = AGC (automatisk forstærkningsregulering)

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:268
js-meankind-layer-raim = RAIM (modtagerens autonome integritetsovervågning)

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:270
js-meankind-layer-sqm = SQM (overvågning af signalkvalitet)

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:328
js-meankind-leochain-big = Fra ende til anden bringer systemet i lav bane positionsfejlen fra { $from } m til { $to } m.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:328
js-meankind-leochain-line = Dets signal spores ved op til { $cn0 } dB-Hz.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:300
js-meankind-leopass-big-many = Satellitterne passerer { $elev }° højt og forbliver over masken i { $dur } (den første af { $n }).

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:300
js-meankind-leopass-big-one = Satellitten passerer { $elev }° højt og forbliver over masken i { $dur }.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:300
js-meankind-leopass-line = På sit højeste ankommer signalet fra lav bane { $db } dB stærkere end et typisk satellitnavigationssignal.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:315
js-meankind-leoppp-big = Præcis positionering konvergerer på { $best } min med det største lag i lav bane, mod { $base } min med kun satellitnavigation.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:315
js-meankind-leoppp-line = Median af kørslerne pr. tilfælde, til { $m } m.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:315
js-meankind-leoppp-line-runs =
    { $n ->
        [one] Median af { $n } kørsel pr. tilfælde, til { $m } m.
       *[other] Median af { $n } kørsler pr. tilfælde, til { $m } m.
    }

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:303
js-meankind-leopvt-doppler-big = Dopplerpositionering fra satellitter i lav bane lander { $m } m fra referencen (vandret).

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:303
js-meankind-leopvt-doppler-line =
    { $n ->
        [one] { $n } satellit brugt.
       *[other] { $n } satellitter brugt.
    }

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:304
js-meankind-leopvt-joint-big = Tilføjelse af laget i lav bane bringer fejlen fra { $from } m til { $to } m (3D kvadratisk middelværdi).

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:304
js-meankind-leopvt-joint-line = Geometrikvaliteten (PDOP) går fra { $from } til { $to }.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:308
js-meankind-leopvt-polar-big = Nær polen forbedrer laget i lav bane geometrikvaliteten (PDOP) fra { $from } til { $to }.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:308
js-meankind-leopvt-polar-line =
    { $n ->
        [one] På tværs af { $n } breddegrad.
       *[other] På tværs af { $n } breddegrader.
    }

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:306
js-meankind-leopvt-timing-big = Tidsoverførsel fra lav bane holder det bedste ur inden for { $ns } ns af UTC (kvadratisk middelværdi).

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:306
js-meankind-leopvt-timing-line =
    { $n ->
        [one] { $n } ur- og signaltilfælde sammenlignet.
       *[other] { $n } ur- og signaltilfælde sammenlignet.
    }

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:290
js-meankind-leosignal-big =
    { $n ->
        [one] Af { $n } signaludformning tåler { $best } mest jamming: { $db } dB over signalet.
       *[other] Af { $n } signaludformninger tåler { $best } mest jamming: { $db } dB over signalet.
    }

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:290
js-meankind-leosignal-line-fail = Kontrollerne af spektrets form fejler.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:290
js-meankind-leosignal-line-pass = Kontrollerne af spektrets form består.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:378
js-meankind-link-big-closes = Forbindelsen holder med { $margin } dB i overskud.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:378
js-meankind-link-big-open = Forbindelsen holder ikke: { $margin } dB margin.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:377
js-meankind-link-line = Over { $km } km.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:376
js-meankind-link-line-band = { $band }-bånd over { $km } km.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:376
js-meankind-link-line-band-rate = { $band }-bånd over { $km } km ved { $rate } bit/s.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:377
js-meankind-link-line-rate = Over { $km } km ved { $rate } bit/s.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:21
js-meankind-list-and = { $head } og { $last }

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:488
js-meankind-llr-big = Ægte laserafstandsmåling fastlægger månens referencesystem til { $mm } mm.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:488
js-meankind-llr-line = Skala til { $ppb } dele pr. milliard.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:195
js-meankind-mapmatch-altimeter = Højdemåleren måler til { $sigma } m.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:195
js-meankind-mapmatch-big = Kortmatchning holder positionen til { $matched } m, mod { $free } m drift på inerti alene.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:195
js-meankind-mapmatch-gravimeter = Gravimeteret måler til { $sigma } mGal.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:195
js-meankind-mapmatch-sources = Tyngdekraft alene giver { $gravity } m, magnetisme { $magnetic } m, terræn { $terrain } m.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:429
js-meankind-marspnt-big = { $user }-navigatoren falder til ro på { $m } m (kvadratisk middelværdi).

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:429
js-meankind-marspnt-line =
    { $n ->
        [one] { $mean } relæer i sigte i gennemsnit, over { $n } epoke.
       *[other] { $mean } relæer i sigte i gennemsnit, over { $n } epoker.
    }

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:433
js-meankind-moonlight-big = Tjenesten dækker { $share } % af de kontrollerede steder og tidspunkter.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:433
js-meankind-moonlight-line =
    { $n ->
        [one] Mellem { $min } og { $n } satellit er i sigte; geometrikvaliteten (PDOP) varierer fra { $pmin } til { $pmax }.
       *[other] Mellem { $min } og { $n } satellitter er i sigte; geometrikvaliteten (PDOP) varierer fra { $pmin } til { $pmax }.
    }

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:318
js-meankind-navmsg-big =
    { $n ->
        [one] Én navigationsmeddelelse passer i { $n } byte.
       *[other] Én navigationsmeddelelse passer i { $n } bytes.
    }

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:321
js-meankind-navmsg-cases-big =
    { $n ->
        [one] På tværs af { $n } tilfælde er afstandsfejlen fra den udsendte bane { $min } til { $max } mm.
       *[other] På tværs af { $n } tilfælde er afstandsfejlen fra den udsendte bane { $min } til { $max } mm.
    }

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:321
js-meankind-navmsg-cases-line = Afstandsfejl for signal i rummet, kvadratisk middelværdi.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:318
js-meankind-navmsg-line = Afrunding til meddelelsesformatet koster { $mm } mm afstandsfejl.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:322
js-meankind-navmsg-midpass-big = Opdatering af meddelelsen midt i overflyvningen får afstanden til at springe med højst { $mm } mm.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:322
js-meankind-navmsg-midpass-line = Grænsen er { $mm } mm.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:334
js-meankind-ntn-big = 5G-positionering fra kredsløb når { $m } m med { $signal }.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:334
js-meankind-ntn-line = Doppler over én overflyvning giver { $m } m.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:494
js-meankind-obs-big-full = Banen bliver fuldt observerbar efter { $dur } sporing.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:494
js-meankind-obs-big-partly = Banen forbliver delvist observerbar over buen på { $h } h.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:494
js-meankind-obs-line = Rang { $rank } af { $dim } ved buens slutning.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:405
js-meankind-oem-big = Efemeridefilen kan gemmes og indlæses med højst { $mm } mm positionsfejl.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:405
js-meankind-oem-line =
    { $n ->
        [one] { $states } tilstande i { $n } segment.
       *[other] { $states } tilstande i { $n } segmenter.
    }

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:552
js-meankind-optical-big-alone = Det bedste enkelte sted holder den optiske forbindelse oppe { $best } % af tiden (loft uden skyer { $ceiling } %); ingen skyfri margin løfter den over { $ceiling } %.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:552
js-meankind-optical-big-team = Det bedste enkelte sted holder den optiske forbindelse oppe { $best } % af tiden (loft uden skyer { $ceiling } %); { $n } steder sammen når { $independent } %, hvis deres vejr er uafhængigt, { $correlated } % med den angivne korrelation.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:552
js-meankind-optical-line-sites =
    { $n ->
        [one] { $n } sted modelleret; skyklimaerne er illustrative.
       *[other] { $n } steder modelleret; skyklimaerne er illustrative.
    }

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:552
js-meankind-optical-line-tech = { $name }: { $base } % bliver til { $with } %.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:227
js-meankind-opticalrf-big = Kombination af optisk og radiobaseret afstandsmåling giver beskyttelsesniveauer på { $h } m vandret og { $v } m lodret.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:227
js-meankind-opticalrf-line-fault = Konsistenstesten viser { $stat } mod en tærskel på { $threshold }: en fejl markeres.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:227
js-meankind-opticalrf-line-ok = Konsistenstesten viser { $stat } mod en tærskel på { $threshold }: ingen fejl markeres.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:401
js-meankind-packet-big-no = Nej: den afkodede strøm afviger fra det, der blev sendt.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:401
js-meankind-packet-big-yes = Ja: pakkestrømmen afkodes tilbage bit for bit.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:401
js-meankind-packet-line =
    { $n ->
        [one] { $n } pakke, i alt { $octets } oktetter.
       *[other] { $n } pakker, i alt { $octets } oktetter.
    }

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:383
js-meankind-passes-big-day =
    { $n ->
        [one] { $n } overflyvning om dagen, i alt { $dur } kontakt.
       *[other] { $n } overflyvninger om dagen, i alt { $dur } kontakt.
    }

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:383
js-meankind-passes-big-window =
    { $n ->
        [one] { $n } overflyvning i et vindue på { $hours } timer, i alt { $dur } kontakt.
       *[other] { $n } overflyvninger i et vindue på { $hours } timer, i alt { $dur } kontakt.
    }

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:383
js-meankind-passes-line = Den bedste overflyvning stiger til { $deg }°.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:451
js-meankind-percentile-word = percentil

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:150
js-meankind-pnt-big = Kvantesættet holder position og tid i { $q }; det klassiske sæt i { $c }.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:154
js-meankind-pnt-classical-label = Holdover, klassisk sæt

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:151
js-meankind-pnt-line = Holdover er, hvor længe hvert sæt (ur { $q } mod ur { $c }) bliver inden for { $spec }, efter satellitnavigationen er tabt.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:153
js-meankind-pnt-quantum-label = Holdover, kvantesæt

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:156
js-meankind-pnt-timing-classical-label = Tidsfejl, 95 %, klassisk

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:155
js-meankind-pnt-timing-quantum-label = Tidsfejl, 95 %, kvante

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:265
js-meankind-pvt-big =
    { $n ->
        [one] En position bestemmes ved { $solved } af { $n } epoke, til { $rms } m (3D kvadratisk middelværdi).
       *[other] En position bestemmes ved { $solved } af { $n } epoker, til { $rms } m (3D kvadratisk middelværdi).
    }

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:265
js-meankind-pvt-line = Ud fra { $mean } satellitter i gennemsnit, aflæst fra ægte modtagermålinger.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:221
js-meankind-qnav-big = Efter udfaldet er koldatom-navigatoren { $q } m ved siden af; den i navigationsklasse { $c } m.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:221
js-meankind-qnav-big-outage = Efter { $dur } uden satellitter er koldatom-navigatoren { $q } m ved siden af; den i navigationsklasse { $c } m.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:221
js-meankind-qnav-line = Inden for budgettet: { $q } mod { $c }.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:221
js-meankind-qnav-line-threshold = Inden for { $threshold } m: { $q } mod { $c }.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:188
js-meankind-qtt-big = Kvantetidsoverførsel holder { $q } ps (1 sigma) mod { $c } ns for den klassiske kæde.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:188
js-meankind-qtt-line = Sikkerhedsovervågningen opdager { $pd } % af angrebene.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:188
js-meankind-qtt-line-pfa = Sikkerhedsovervågningen opdager { $pd } % af angrebene ved en falsk-alarm-rate på { $pfa }.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:163
js-meankind-quantum-link = kvanteforbindelse

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:537
js-meankind-radiometry-big = Kameraet når NIIRS { $niirs } ved { $gsd } m jordprøveafstand, med et signal-til-støj-forhold på { $snr }.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:537
js-meankind-radiometry-line = System-MTF ved Nyquist { $mtf }.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:387
js-meankind-reentry-big = Maksimal deceleration er { $g } g, ved { $km } km.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:387
js-meankind-reentry-line = Fartøjet er da på { $speed } m/s.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:199
js-meankind-slam-big = Terrænmatchning ender { $matched } m ved siden af, mod { $free } m på inerti alene.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:199
js-meankind-slam-line =
    { $n ->
        [one] Over { $n } rutepunkt, matchet til et terrænkort med { $sigma } m højdemålerstøj.
       *[other] Over { $n } rutepunkter, matchet til et terrænkort med { $sigma } m højdemålerstøj.
    }

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:176
js-meankind-slot-big = Uret forlader sin tidsslotgrænse { $dur } efter den sidste satellitbestemmelse.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:176
js-meankind-slot-line = Så det har brug for en positionsbestemmelse hver { $interval }, omkring { $perDay } om dagen.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:411
js-meankind-solar-big =
    { $n ->
        [one] { $n } legeme placeret til én epoke.
       *[other] { $n } legemer placeret til én epoke.
    }

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:411
js-meankind-solar-big-link =
    { $n ->
        [one] { $n } legeme placeret til én epoke; lyset bruger { $dur } fra { $from } til { $to }.
       *[other] { $n } legemer placeret til én epoke; lyset bruger { $dur } fra { $from } til { $to }.
    }

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:411
js-meankind-solar-line = { $n } forbindelser tidsmåles i alt.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:135
js-meankind-spoof-caught = Spoofingen opdages, før den bryder tidsspecifikationen.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:135
js-meankind-spoof-caught-both = Spoofingen opdages af begge ure, før den bryder tidsspecifikationen.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:140
js-meankind-spoof-caught-label = Opdaget efter, { $name }

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:134
js-meankind-spoof-caught-thr = Spoofingen opdages, før den bryder tidsspecifikationen på { $thr } ns.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:134
js-meankind-spoof-caught-thr-both = Spoofingen opdages af begge ure, før den bryder tidsspecifikationen på { $thr } ns.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:139
js-meankind-spoof-detects = { $name } opdager den efter { $dur }, ved en forskydning på { $offset } ns.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:138
js-meankind-spoof-missed =
    { $n ->
        [one] Spoofingen bryder tidsspecifikationen, før { $names } opdager den.
       *[other] Spoofingen bryder tidsspecifikationen, før { $names } opdager den.
    }

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:140
js-meankind-spoof-offset = forskydning { $offset } ns

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:278
js-meankind-spoofdetect-big-by = Ja: spoofingen opdages, af { $by }.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:278
js-meankind-spoofdetect-big-no = Nej: den fusionerede overvågning opdager ikke spoofingen.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:278
js-meankind-spoofdetect-big-yes = Ja: spoofingen opdages.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:278
js-meankind-spoofdetect-line =
    { $n ->
        [one] { $on } af { $n } detektionslag giver alarm.
       *[other] { $on } af { $n } detektionslag giver alarm.
    }

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:278
js-meankind-spoofdetect-line-score =
    { $n ->
        [one] { $on } af { $n } detektionslag giver alarm; den fusionerede score er { $score }.
       *[other] { $on } af { $n } detektionslag giver alarm; den fusionerede score er { $score }.
    }

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:587
js-meankind-ssv-formation = Ved { $km } km afstand kender filteret den relative position til { $filter } m RMS, mod { $absolute } m ved at tage differensen af de to absolutte positionsbestemmelser.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:582
js-meankind-ssv-navigation = Filteret om bord holder positionen til { $inside } m RMS inden for GNSS-banerne og { $above } m over dem.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:572
js-meankind-ssv-shell = På skallen giver alle konstellationer sammen mindst ét signal { $one } % af tiden og mindst fire { $four } % (L1).

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:568
js-meankind-ssv-tail = MODELLED: en geometri- og linkbudgetgennemkørsel, ikke en måling af noget signal i rummet.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:577
js-meankind-ssv-trajectory = Fra { $from } til { $to } km højde er mindst ét signal i sigte { $one } % af epokerne og mindst fire { $four } % (L1, alle konstellationer).

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:452
js-meankind-station-big = Over det sydpolare område bringer en månereferencestations korrektioner { $percentile }-fejlen fra { $from } m til { $to } m (modelleret).

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:452
js-meankind-station-line = Inden for nøjagtighedstærsklen i { $share } % af epokerne; ikke en udtalelse om noget virkeligt system.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:116
js-meankind-sweep-big =
    { $n ->
        [one] Over { $n } værdi af { $param }, { $parts }.
       *[other] Over { $n } værdier af { $param }, { $parts }.
    }

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:116
js-meankind-sweep-line = { $param } løber fra { $from } til { $to }.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:116
js-meankind-sweep-line-log = { $param } løber fra { $from } til { $to } på en logaritmisk skala.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:114
js-meankind-sweep-part-flat = { $metric } for { $key } forbliver på { $value }

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:114
js-meankind-sweep-part-goes = { $metric } for { $key } går fra { $first } til { $last }

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:113
js-meankind-sweep-result-word = resultat

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:122
js-meankind-sweepnd-big =
    { $n ->
        [one] Over { $n } kombination af { $keys } varierer { $metric } fra { $min } til { $max }.
       *[other] Over { $n } kombinationer af { $keys } varierer { $metric } fra { $min } til { $max }.
    }

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:122
js-meankind-sweepnd-line = Et gitter af { $shape } motorkørsler.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:172
js-meankind-telecom-fail =
    { $n ->
        [one] Uret fejler { $fail } af { $n } telekom-tidsfejlkontrol.
       *[other] Uret fejler { $fail } af { $n } telekom-tidsfejlkontroller.
    }

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:172
js-meankind-telecom-line = Kontrol af MTIE (maksimal tidsintervalfejl), TDEV (tidsafvigelse) og holdover-indhyllingskurven mod de ITU-T-masker, der er nævnt i hver række.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:172
js-meankind-telecom-line-margin = Kontrol af MTIE (maksimal tidsintervalfejl), TDEV (tidsafvigelse) og holdover-indhyllingskurven mod de ITU-T-masker, der er nævnt i hver række. Den mindste margin til holdover-indhyllingskurven er { $margin } ns.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:172
js-meankind-telecom-pass =
    { $n ->
        [one] Uret består alle { $n } telekom-tidsfejlkontrol.
       *[other] Uret består alle { $n } telekom-tidsfejlkontroller.
    }

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:289
js-meankind-the-best = den bedste

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:422
js-meankind-the-body = legemet

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:410
js-meankind-the-first = den første

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:138
js-meankind-the-name = { $name }

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:410
js-meankind-the-second = den anden

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:334
js-meankind-the-widest-signal = det bredeste signal

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:180
js-meankind-timebudget-big = Fejlen for { $clock } og fejlen for referencesystemet krydser hinanden ved en middelværdidannelsestid på { $tau }.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:180
js-meankind-timebudget-line = Ved dette skæringspunkt er tidsfejlen { $x } s.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:184
js-meankind-timeoffset-big = Et ur på Månen går { $rate } µs om dagen foran et ur på Jorden.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:184
js-meankind-timeoffset-line = Det publicerede bånd er { $low } til { $high } µs om dagen.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:165
js-meankind-timetransfer-big = { $q } holder de to steder inden for { $qps } ps (kvadratisk middelværdi); { $c } inden for { $cps } ps.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:165
js-meankind-timetransfer-line = Inden for afstandsmålingsspecifikationen { $q } % af tiden, mod { $c } %.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:165
js-meankind-timetransfer-line-mm = Inden for afstandsmålingsspecifikationen på { $mm } mm { $q } % af tiden, mod { $c } %.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:283
js-meankind-tracking-big = En spoofer kan overtage modtageren fra op til { $km } km væk.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:283
js-meankind-tracking-line = Under modtagerens egen sløjfedynamik går låsen tabt ved { $db } dB jammer over signalet.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:250
js-meankind-trade-big = Kvantesensorerne er { $timing } gange bedre til tidssynkronisering og { $inertial } gange bedre til inertinavigation end den klassiske baseline.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:250
js-meankind-trade-line = Uden satellitter glider kvantesættet i { $dur }.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:541
js-meankind-ttbudget-big = Tovejsforskydningen er { $offset } ns, med en samlet usikkerhed på { $uncertainty } ns.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:541
js-meankind-ttbudget-line = Sagnac { $sagnac } ns; ionosfære { $iono } ns.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:215
js-meankind-ukf-big-no = Nej: filteret er ikke selvkonsistent.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:215
js-meankind-ukf-big-yes = Ja: filteret er selvkonsistent.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:213
js-meankind-ukf-line-in = Dets normaliserede innovationskvadrat er i gennemsnit { $mean }, inden for 95 %-båndet fra { $low } til { $high }. Det kontrollerer konsistens, ikke nøjagtighed.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:213
js-meankind-ukf-line-in-seeds =
    { $n ->
        [one] Dets normaliserede innovationskvadrat er i gennemsnit { $mean }, inden for 95 %-båndet fra { $low } til { $high }, over { $n } seed. Det kontrollerer konsistens, ikke nøjagtighed.
       *[other] Dets normaliserede innovationskvadrat er i gennemsnit { $mean }, inden for 95 %-båndet fra { $low } til { $high }, over { $n } seeds. Det kontrollerer konsistens, ikke nøjagtighed.
    }

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:214
js-meankind-ukf-line-out = Dets normaliserede innovationskvadrat er i gennemsnit { $mean }, uden for 95 %-båndet fra { $low } til { $high }. Det kontrollerer konsistens, ikke nøjagtighed.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:214
js-meankind-ukf-line-out-seeds =
    { $n ->
        [one] Dets normaliserede innovationskvadrat er i gennemsnit { $mean }, uden for 95 %-båndet fra { $low } til { $high }, over { $n } seed. Det kontrollerer konsistens, ikke nøjagtighed.
       *[other] Dets normaliserede innovationskvadrat er i gennemsnit { $mean }, uden for 95 %-båndet fra { $low } til { $high }, over { $n } seeds. Det kontrollerer konsistens, ikke nøjagtighed.
    }

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:429
js-meankind-user-word = bruger

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:473
js-meankind-vlbi-big = Over en baseline på { $km } km ankommer fyrets signal { $ms } ms forskudt ved de to stationer.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:473
js-meankind-vlbi-line = Nærfeltskorrektionen er { $us } µs.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:478
js-meankind-vlbifim-big = Hver stationskoordinat er kendt til { $m } m ud fra denne observationsplan.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:478
js-meankind-vlbifim-line = Det simple estimat med lige andele ville angive { $m } m.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:397
js-meankind-weather-big = Den øvre atmosfære opvarmes til { $k } K.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:397
js-meankind-weather-big-ref = Den øvre atmosfære opvarmes til { $k } K, mod { $ref } K for referencen.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:397
js-meankind-weather-line = Det geomagnetiske aktivitetsindeks ap er { $ap }.

# 2026-10-01-studio-rebuild/lib/meaning-kinds.mjs:155
js-meankind-whole-run = i hele kørslen

# 2026-10-01-studio-rebuild/mission-thread/mission-thread.js:64
js-mthread-bcol-label = Etiket

# 2026-10-01-studio-rebuild/mission-thread/mission-thread.js:64
js-mthread-bcol-share = Størrelse i forhold til det største positionsbidrag

# 2026-10-01-studio-rebuild/mission-thread/mission-thread.js:64
js-mthread-bcol-sigma = 1 sigma

# 2026-10-01-studio-rebuild/mission-thread/mission-thread.js:64
js-mthread-bcol-source = Bidrag

# 2026-10-01-studio-rebuild/mission-thread/mission-thread.js:65
js-mthread-budget-caption = { $phase }: 1 sigma ved indgang { $entry }, ved toppen { $peak }, ved udgang { $exit } (position); hvert bidrag nedenfor, det største først.

# 2026-10-01-studio-rebuild/lib/mission-thread.mjs:131
js-mthread-chart-title = { $metric } mod forløbet missionstid, ét bånd pr. fase

# 2026-10-01-studio-rebuild/mission-thread/mission-thread.js:52
js-mthread-col-kind = Type

# 2026-10-01-studio-rebuild/mission-thread/mission-thread.js:52
js-mthread-col-label = Etiket

# 2026-10-01-studio-rebuild/mission-thread/mission-thread.js:52
js-mthread-col-limit = Største bidrag

# 2026-10-01-studio-rebuild/mission-thread/mission-thread.js:52
js-mthread-col-margin = I forhold til grænsen

# 2026-10-01-studio-rebuild/mission-thread/mission-thread.js:52
js-mthread-col-peak-pos = Maksimal position

# 2026-10-01-studio-rebuild/mission-thread/mission-thread.js:52
js-mthread-col-peak-time = Maksimal urbias

# 2026-10-01-studio-rebuild/mission-thread/mission-thread.js:52
js-mthread-col-peak-vel = Maksimal hastighed

# 2026-10-01-studio-rebuild/mission-thread/mission-thread.js:52
js-mthread-col-phase = Fase

# 2026-10-01-studio-rebuild/mission-thread/mission-thread.js:52
js-mthread-col-window = Missionstid

# 2026-10-01-studio-rebuild/mission-thread/mission-thread.js:81
js-mthread-example-not-loaded = det optagede resultat blev ikke indlæst

# 2026-10-01-studio-rebuild/mission-thread/mission-thread.js:97
js-mthread-file-failed = { $name } kunne ikke læses: { $reason }.

# 2026-10-01-studio-rebuild/mission-thread/mission-thread.js:27
js-mthread-kv-elapsed = Forløbet missionstid

# 2026-10-01-studio-rebuild/mission-thread/mission-thread.js:31
js-mthread-kv-engine = Motor

# 2026-10-01-studio-rebuild/mission-thread/mission-thread.js:29
js-mthread-kv-epoch = Epoke (UTC)

# 2026-10-01-studio-rebuild/mission-thread/mission-thread.js:28
js-mthread-kv-limits = Faser med en angivet grænse

# 2026-10-01-studio-rebuild/mission-thread/mission-thread.js:28
js-mthread-kv-limits-value = { $n } ({ $met } nået, { $missed } ikke nået)

# 2026-10-01-studio-rebuild/mission-thread/mission-thread.js:26
js-mthread-kv-phases = Faser

# 2026-10-01-studio-rebuild/mission-thread/mission-thread.js:30
js-mthread-kv-seed = Seed

# 2026-10-01-studio-rebuild/mission-thread/mission-thread.js:25
js-mthread-kv-title = Forløb

# 2026-10-01-studio-rebuild/mission-thread/mission-thread.js:39
js-mthread-layout-phases = Lige bredde pr. fase

# 2026-10-01-studio-rebuild/mission-thread/mission-thread.js:39
js-mthread-layout-time = Sand missionstid

# 2026-10-01-studio-rebuild/lib/mission-thread.mjs:148
js-mthread-limit-title = { $phase }: den angivne grænse, { $limit }

# 2026-10-01-studio-rebuild/lib/mission-thread.mjs:163
js-mthread-log-scale = logaritmisk skala

# 2026-10-01-studio-rebuild/lib/mission-thread.mjs:84
js-mthread-margin-met = { $m }× grænsen, nået

# 2026-10-01-studio-rebuild/lib/mission-thread.mjs:84
js-mthread-margin-missed = { $m }× grænsen, ikke nået

# 2026-10-01-studio-rebuild/lib/mission-thread.mjs:107
js-mthread-metric-pos = Position, 1 sigma

# 2026-10-01-studio-rebuild/lib/mission-thread.mjs:107
js-mthread-metric-time = Urbias, 1 sigma

# 2026-10-01-studio-rebuild/lib/mission-thread.mjs:107
js-mthread-metric-vel = Hastighed, 1 sigma

# 2026-10-01-studio-rebuild/lib/mission-thread.mjs:21
js-mthread-na = n/a

# 2026-10-01-studio-rebuild/mission-thread/mission-thread.js:67
js-mthread-no-events = Denne fase registrerer ingen hændelser.

# 2026-10-01-studio-rebuild/lib/mission-thread.mjs:67
js-mthread-no-phases = resultatet indeholder ingen faser

# 2026-10-01-studio-rebuild/lib/mission-thread.mjs:84
js-mthread-no-requirement = ingen grænse angivet

# 2026-10-01-studio-rebuild/lib/mission-thread.mjs:127
js-mthread-no-series = Resultatet indeholder ingen sampler af denne størrelse.

# 2026-10-01-studio-rebuild/mission-thread/mission-thread.js:23
js-mthread-no-weak = Resultatet angiver intet svageste led.

# 2026-10-01-studio-rebuild/lib/mission-thread.mjs:46
js-mthread-not-json = resultatet er ikke JSON ({ $reason })

# 2026-10-01-studio-rebuild/lib/mission-thread.mjs:47
js-mthread-not-thread = dette er ikke et missionsforløbsresultat (skema { $schema } forventet)

# 2026-10-01-studio-rebuild/mission-thread/mission-thread.js:46
js-mthread-note-phases = Hver fase tegnes med samme bredde, så en kort fase er lige så synlig som en lang; tidspunktet, hvor hver begynder, står under båndet. Skift til sand missionstid for at se de virkelige proportioner. Stiplede linjer er de grænser, dokumentet angiver; et brud i linjen er en overdragelse.

# 2026-10-01-studio-rebuild/mission-thread/mission-thread.js:47
js-mthread-note-time = Sand missionstid: en fase på få minutter kan være for smal til at kunne ses. Skift til lige brede faser for at læse den. Stiplede linjer er de grænser, dokumentet angiver; et brud i linjen er en overdragelse.

# 2026-10-01-studio-rebuild/mission-thread/mission-thread.js:86
js-mthread-open-failed = Eksemplet kunne ikke åbnes: { $reason }.

# 2026-10-01-studio-rebuild/mission-thread/mission-thread.js:96
js-mthread-opened = { $name } læst på denne side; intet blev sendt nogen steder hen.

# 2026-10-01-studio-rebuild/mission-thread/mission-thread.js:78
js-mthread-opening = Åbner Artemis-klasse-eksemplet…

# 2026-10-01-studio-rebuild/mission-thread/mission-thread.js:74
js-mthread-prov = Hver etiket på denne side er motorens egen; siden kopierer hvert tal fra resultatet og skalerer det kun.

# 2026-10-01-studio-rebuild/mission-thread/mission-thread.js:85
js-mthread-recorded = Motorens optagede resultat (version { $version }): en illustrativ kæde bygget ud fra offentlige missionsbeskrivelser; tallene er modellerede og står ikke for noget virkeligt.

# 2026-10-01-studio-rebuild/mission-thread/mission-thread.js:66
js-mthread-sets-peak = fastsætter toppen

# 2026-10-01-studio-rebuild/mission-thread/mission-thread.js:91
js-mthread-too-large = Den fil er større end { $mb } MB; den læses ikke.

# 2026-10-01-studio-rebuild/mission-thread/mission-thread.js:22
js-mthread-weak-line = Det svageste led er fasen <b>{ $phase }</b>: { $margin }× dens angivne grænse, fastsat af { $source }. Marginen er det mindste forhold mellem en angivet grænse og fasens top; over 1 ligger inden for kravet.

# 2026-10-01-studio-rebuild/mission-thread/mission-thread.js:53
js-mthread-weakest-flag = svageste led

# 2026-10-01-studio-rebuild/lib/mission-thread.mjs:158
js-mthread-weakest-mark = svageste led

# 2026-10-01-studio-rebuild/lib/observatory.mjs:147
js-obs-cell-extent = { $south }° til { $north }° N, { $west }° til { $east }° Ø

# 2026-10-01-studio-rebuild/observatory/observatory.js:89
js-obs-cell-read = { $state }: { $cell }. Samplet { $sampled }, berørt { $affected }.

# 2026-10-01-studio-rebuild/lib/observatory.mjs:175
js-obs-cell-title = { $state }; samplet { $sampled }, berørt { $affected }

# 2026-10-01-studio-rebuild/lib/observatory.mjs:174
js-obs-cell-title-reason = { $state } ({ $reason }); samplet { $sampled }, berørt { $affected }

# 2026-10-01-studio-rebuild/observatory/observatory.js:71
js-obs-clear-note = { $notClear } En celle uden en post blev set af færre end 5 forskellige fly og er tilbageholdt; den tegnes ikke. Farve er aldrig det eneste signal: ikke observeret er skraveret, og tabellen angiver hver tilstand i ord.

# 2026-10-01-studio-rebuild/observatory/observatory.js:111
js-obs-col-affected = Berørte fly

# 2026-10-01-studio-rebuild/observatory/observatory.js:99
js-obs-col-bbox = Afgrænsningsramme (S, V, N, Ø)

# 2026-10-01-studio-rebuild/observatory/observatory.js:122
js-obs-col-bytes = Bytes

# 2026-10-01-studio-rebuild/observatory/observatory.js:99
js-obs-col-cause = Årsag

# 2026-10-01-studio-rebuild/observatory/observatory.js:111
js-obs-col-cell = Celle (breddegrad, længdegrad)

# 2026-10-01-studio-rebuild/observatory/observatory.js:99
js-obs-col-cells = Celler

# 2026-10-01-studio-rebuild/observatory/observatory.js:122
js-obs-col-check = Kontrol

# 2026-10-01-studio-rebuild/observatory/observatory.js:122
js-obs-col-file = Fil

# 2026-10-01-studio-rebuild/observatory/observatory.js:99
js-obs-col-incident = Hændelse

# 2026-10-01-studio-rebuild/observatory/observatory.js:111
js-obs-col-sampled = Fly samplet

# 2026-10-01-studio-rebuild/observatory/observatory.js:122
js-obs-col-sha = SHA-256 (manifest)

# 2026-10-01-studio-rebuild/observatory/observatory.js:111
js-obs-col-share = Berørt andel

# 2026-10-01-studio-rebuild/observatory/observatory.js:111
js-obs-col-state = Tilstand

# 2026-10-01-studio-rebuild/observatory/observatory.js:111
js-obs-col-why = Hvorfor ikke observeret

# 2026-10-01-studio-rebuild/lib/observatory.mjs:132
js-obs-day-alt = { $degraded } celler forringet, { $notDegraded } ikke forringet, { $notObserved } ikke observeret, den { $date }.

# 2026-10-01-studio-rebuild/observatory/observatory.js:63
js-obs-day-heading = Dag { $date } (UTC)

# 2026-10-01-studio-rebuild/observatory/observatory.js:128
js-obs-ds-attribution = Kildeangivelse

# 2026-10-01-studio-rebuild/observatory/observatory.js:128
js-obs-ds-coverage = Dækning

# 2026-10-01-studio-rebuild/observatory/observatory.js:128
js-obs-ds-dataset = Datasæt

# 2026-10-01-studio-rebuild/observatory/observatory.js:128
js-obs-ds-licence = Licens

# 2026-10-01-studio-rebuild/observatory/observatory.js:128
js-obs-ds-licence-address = Licensadresse

# 2026-10-01-studio-rebuild/observatory/observatory.js:128
js-obs-ds-product = Produkt

# 2026-10-01-studio-rebuild/observatory/observatory.js:128
js-obs-ds-written-by = Skrevet af Kshana

# 2026-10-01-studio-rebuild/lib/observatory.mjs:96
js-obs-err-cause = { $name } angiver en anden årsag end "ikke tillagt"; denne side viser ingen

# 2026-10-01-studio-rebuild/lib/observatory.mjs:70
js-obs-err-feature-polygon = { $name }: objekt { $n } er ikke et cellepolygon

# 2026-10-01-studio-rebuild/lib/observatory.mjs:68
js-obs-err-feature-state = { $name }: objekt { $n } har tilstanden "{ $state }", som ikke er en af { $states }

# 2026-10-01-studio-rebuild/lib/observatory.mjs:100
js-obs-err-incident-object = { $name }: hændelse { $n } er ikke et objekt

# 2026-10-01-studio-rebuild/lib/observatory.mjs:62
js-obs-err-no-date = { $name } angiver ingen dato

# 2026-10-01-studio-rebuild/lib/observatory.mjs:63
js-obs-err-no-features = { $name } har ingen objekter

# 2026-10-01-studio-rebuild/lib/observatory.mjs:97
js-obs-err-no-incidents = { $name } har ingen hændelsesliste

# 2026-10-01-studio-rebuild/lib/observatory.mjs:61
js-obs-err-not-day = { $name } er ikke en { $schema }-fil

# 2026-10-01-studio-rebuild/lib/observatory.mjs:95
js-obs-err-not-incident = { $name } er ikke en { $schema }-fil

# 2026-10-01-studio-rebuild/lib/observatory.mjs:46
js-obs-err-not-json = { $what } er ikke JSON ({ $reason })

# 2026-10-01-studio-rebuild/lib/observatory.mjs:110
js-obs-err-not-manifest = { $name } er ikke en { $schema }-fil

# 2026-10-01-studio-rebuild/lib/observatory.mjs:46
js-obs-err-not-object = { $what } er ikke et JSON-objekt

# 2026-10-01-studio-rebuild/lib/observatory.mjs:45
js-obs-err-not-text = { $what } er ikke tekst eller er større end { $mib } MiB

# 2026-10-01-studio-rebuild/lib/observatory.mjs:64
js-obs-err-states = { $name } nævner andre tilstande end de tre, denne side viser

# 2026-10-01-studio-rebuild/lib/observatory.mjs:124
js-obs-file-matches = stemmer

# 2026-10-01-studio-rebuild/lib/observatory.mjs:124
js-obs-file-mismatch = stemmer ikke

# 2026-10-01-studio-rebuild/lib/observatory.mjs:124
js-obs-file-no-hash = ingen hashværdi angivet

# 2026-10-01-studio-rebuild/lib/observatory.mjs:122
js-obs-file-not-opened = ikke åbnet

# 2026-10-01-studio-rebuild/observatory/observatory.js:119
js-obs-files-note = Metode { $method }. Hver fils SHA-256 beregnes her ud fra den fil, du åbnede, og sammenlignes med manifestet; en fil, du ikke åbnede, kontrolleres ikke.

# 2026-10-01-studio-rebuild/observatory/observatory.js:102
js-obs-incident = hændelse

# 2026-10-01-studio-rebuild/observatory/observatory.js:97
js-obs-incident-note = Tilstødende forringede celler (diagonaler medregnet) udgør én hændelse. Årsagen til hver hændelse er: ikke tillagt. Dette er ikke en bekræftelse og ikke en NOTAM.

# 2026-10-01-studio-rebuild/observatory/observatory.js:69
js-obs-kv-cells = Offentliggjorte celler

# 2026-10-01-studio-rebuild/observatory/observatory.js:69
js-obs-kv-day-wide = Effekt for hele dagen

# 2026-10-01-studio-rebuild/observatory/observatory.js:69
js-obs-kv-degraded = Forringet

# 2026-10-01-studio-rebuild/observatory/observatory.js:69
js-obs-kv-not-degraded = Ikke forringet

# 2026-10-01-studio-rebuild/observatory/observatory.js:69
js-obs-kv-not-observed = Ikke observeret (offentliggjort)

# 2026-10-01-studio-rebuild/observatory/observatory.js:69
js-obs-kv-scope = Omfang

# 2026-10-01-studio-rebuild/lib/observatory.mjs:178
js-obs-map-aria = { $summary } Tabellen nedenfor viser hver celle.

# 2026-10-01-studio-rebuild/lib/observatory.mjs:20
js-obs-means-degraded = En høj andel af de fly, der blev samplet i cellen, rapporterede lav navigationsnøjagtighed den dag, tydeligt over dagens baggrund.

# 2026-10-01-studio-rebuild/lib/observatory.mjs:21
js-obs-means-not-degraded = Der blev samplet nok fly, og andelen opfyldte ikke reglen.

# 2026-10-01-studio-rebuild/lib/observatory.mjs:22
js-obs-means-not-observed = Data gav ikke grundlag for en vurdering. Det er ikke "klart".

# 2026-10-01-studio-rebuild/observatory/observatory.js:122
js-obs-na = n/a

# 2026-10-01-studio-rebuild/observatory/observatory.js:69
js-obs-no = nej

# 2026-10-01-studio-rebuild/lib/observatory.mjs:161
js-obs-no-cells = Ingen celler i denne fil

# 2026-10-01-studio-rebuild/observatory/observatory.js:45
js-obs-no-day-file = Filerne for { $date } har ingen dagsfil (.geojson), så der er intet at vise for den.

# 2026-10-01-studio-rebuild/lib/observatory.mjs:139
js-obs-no-degraded = Ingen forringede celler denne dag.

# 2026-10-01-studio-rebuild/observatory/observatory.js:47
js-obs-no-file-read = Ingen fil kunne læses.

# 2026-10-01-studio-rebuild/observatory/observatory.js:96
js-obs-no-incident-file = Der blev ikke åbnet nogen hændelsesfil for denne dag.

# 2026-10-01-studio-rebuild/observatory/observatory.js:118
js-obs-no-manifest = Der blev ikke åbnet noget manifest for denne dag, så filerne kan ikke kontrolleres mod deres hashværdier.

# 2026-10-01-studio-rebuild/observatory/observatory.js:129
js-obs-no-notice = Denne fil bærer ingen meddelelse. Den vejledende erklæring øverst på siden gælder alligevel.

# 2026-10-01-studio-rebuild/lib/observatory.mjs:148
js-obs-no-reason = ingen årsag angivet

# 2026-10-01-studio-rebuild/lib/observatory.mjs:28
js-obs-not-clear = Ikke observeret er ikke klart.

# 2026-10-01-studio-rebuild/observatory/observatory.js:41
js-obs-not-readable = { $name }: ikke en fil, som denne side læser (.geojson, .incidents.json, .manifest.json eller .png).

# 2026-10-01-studio-rebuild/observatory/observatory.js:68
js-obs-not-stated = ikke angivet

# 2026-10-01-studio-rebuild/lib/observatory.mjs:138
js-obs-note-day-wide = Dette var en dag med effekt for hele dagen: dagens baggrund var i sig selv høj, så ingen celle kunne vurderes den dag. Det er ikke en udtalelse om, at himlen var ren.

# 2026-10-01-studio-rebuild/lib/observatory.mjs:141
js-obs-note-summary-mismatch = Det sammendrag, filen angiver, stemmer ikke med de celler, den opregner; tallene vises, som de står.

# 2026-10-01-studio-rebuild/observatory/observatory.js:47
js-obs-nothing-yet = Intet at vise endnu: åbn også dagens .geojson-fil.

# 2026-10-01-studio-rebuild/observatory/observatory.js:129
js-obs-notice = Meddelelse i filen: { $notice }

# 2026-10-01-studio-rebuild/observatory/observatory.js:24
js-obs-opened-day-file = Åbnede { $days } dag fra { $files } fil. Læst her; intet blev uploadet.

# 2026-10-01-studio-rebuild/observatory/observatory.js:23
js-obs-opened-day-files = Åbnede { $days } dag fra { $files } filer. Læst her; intet blev uploadet.

# 2026-10-01-studio-rebuild/observatory/observatory.js:22
js-obs-opened-days-file = Åbnede { $days } dage fra { $files } fil. Læst her; intet blev uploadet.

# 2026-10-01-studio-rebuild/observatory/observatory.js:21
js-obs-opened-days-files = Åbnede { $days } dage fra { $files } filer. Læst her; intet blev uploadet.

# 2026-10-01-studio-rebuild/observatory/observatory.js:43
js-obs-read-failed = { $name }: kunne ikke læses ({ $reason }).

# 2026-10-01-studio-rebuild/lib/observatory.mjs:32
js-obs-reason-day-wide = dagens baggrund var i sig selv høj, så ingen celle kunne vurderes den dag

# 2026-10-01-studio-rebuild/lib/observatory.mjs:30
js-obs-reason-insufficient = der blev samplet for få fly til at foretage en vurdering

# 2026-10-01-studio-rebuild/lib/observatory.mjs:31
js-obs-reason-no-background = der var ingen baggrund for dagen at sammenligne cellen med

# 2026-10-01-studio-rebuild/observatory/observatory.js:66
js-obs-release = Frigivet tidligst { $when }: produkter offentliggøres mindst { $hours } timer efter dagens afslutning, på celler på { $deg } grader. Dette er ikke en levende visning.

# 2026-10-01-studio-rebuild/observatory/observatory.js:66
js-obs-release-default = dagens afslutning plus forsinkelsen

# 2026-10-01-studio-rebuild/observatory/observatory.js:113
js-obs-show-all = Vis alle { $n } celler

# 2026-10-01-studio-rebuild/lib/observatory.mjs:15
js-obs-state-degraded = Forringet

# 2026-10-01-studio-rebuild/lib/observatory.mjs:16
js-obs-state-not-degraded = Ikke forringet

# 2026-10-01-studio-rebuild/lib/observatory.mjs:17
js-obs-state-not-observed = Ikke observeret

# 2026-10-01-studio-rebuild/lib/observatory.mjs:57
js-obs-the-day-file = dagsfilen

# 2026-10-01-studio-rebuild/lib/observatory.mjs:92
js-obs-the-incident-file = hændelsesfilen

# 2026-10-01-studio-rebuild/lib/observatory.mjs:107
js-obs-the-manifest = manifestet

# 2026-10-01-studio-rebuild/observatory/observatory.js:32
js-obs-too-large = { $name }: større end { $mib } MiB; åbn en mindre fil.

# 2026-10-01-studio-rebuild/lib/observatory.mjs:131
js-obs-unstated-number = et uangivet antal

# 2026-10-01-studio-rebuild/lib/observatory.mjs:40
js-obs-withheld = tilbageholdt

# 2026-10-01-studio-rebuild/observatory/observatory.js:69
js-obs-yes-no-call = ja: ingen celle kunne vurderes

# 2026-10-01-studio-rebuild/lib/optical.mjs:146
js-opt-avail-label = Tilgængelighed, loft og tilgængelighed ved klar himmel pr. sted

# 2026-10-01-studio-rebuild/lib/optical.mjs:145
js-opt-avail-note = Pr. sted: forbindelsens tilgængelighed mod fading fra skyer og turbulens, det loft, ingen ekstra margin kan løfte (skyer og pejling), og tilgængeligheden helt uden skyer.

# 2026-10-01-studio-rebuild/lib/optical.mjs:145
js-opt-avail-title = Tilgængelighed mod loftet

# 2026-10-01-studio-rebuild/lib/optical.mjs:146
js-opt-bar-available = { $name }: tilgængelig

# 2026-10-01-studio-rebuild/lib/optical.mjs:146
js-opt-bar-ceiling = { $name }: loft

# 2026-10-01-studio-rebuild/lib/optical.mjs:146
js-opt-bar-clear-sky = { $name }: klar himmel

# 2026-10-01-studio-rebuild/lib/optical.mjs:19
js-opt-blurb-network = Et skyet nordligt, et middelskyet centralt og et klarere sydligt sted ser en optisk terminal i lav jordbane ved 30 grader: hvor ofte er forbindelsen oppe, og hvad giver ekstra steder?

# 2026-10-01-studio-rebuild/lib/optical.mjs:20
js-opt-blurb-techniques = Én uplink ved 25 grader i skyer og turbulens: hvad giver en anden bølgelængde, en større apertur, adaptiv optik eller mere margin?

# 2026-10-01-studio-rebuild/lib/optical.mjs:128
js-opt-cloud-episode = skyepisode

# 2026-10-01-studio-rebuild/lib/optical.mjs:154
js-opt-correlated = korrelerede

# 2026-10-01-studio-rebuild/lib/optical.mjs:69
js-opt-default-bars = søjler

# 2026-10-01-studio-rebuild/lib/optical.mjs:80
js-opt-default-chart = diagram

# 2026-10-01-studio-rebuild/lib/optical.mjs:173
js-opt-direction-wave = { $direction }, { $wave } bølge

# 2026-10-01-studio-rebuild/lib/optical.mjs:154
js-opt-diversity-label = Netværkets tilgængelighed mod antallet af steder

# 2026-10-01-studio-rebuild/lib/optical.mjs:153
js-opt-diversity-note = Tilgængelighed for de bedste 1, 2 og 3 steder, med uafhængigt vejr og med vejr korreleret over { $km } km.

# 2026-10-01-studio-rebuild/lib/optical.mjs:153
js-opt-diversity-title = Stedsdiversitet

# 2026-10-01-studio-rebuild/lib/optical.mjs:174
js-opt-fact-capture-loss = Geometrisk opsamlingstab

# 2026-10-01-studio-rebuild/lib/optical.mjs:173
js-opt-fact-direction = Retning

# 2026-10-01-studio-rebuild/lib/optical.mjs:173
js-opt-fact-elevation = Elevation

# 2026-10-01-studio-rebuild/lib/optical.mjs:175
js-opt-fact-footprint = Strålens fodaftryk

# 2026-10-01-studio-rebuild/lib/optical.mjs:174
js-opt-fact-margin = Margin uden atmosfære

# 2026-10-01-studio-rebuild/lib/optical.mjs:174
js-opt-fact-received = Modtaget effekt, uden atmosfære

# 2026-10-01-studio-rebuild/lib/optical.mjs:175
js-opt-fact-sensitivity = Modtagerens følsomhed

# 2026-10-01-studio-rebuild/lib/optical.mjs:173
js-opt-fact-wavelength = Bølgelængde

# 2026-10-01-studio-rebuild/lib/optical.mjs:155
js-opt-gain-points = +{ $n } point

# 2026-10-01-studio-rebuild/lib/optical.mjs:133
js-opt-hours = timer

# 2026-10-01-studio-rebuild/lib/optical.mjs:154
js-opt-independent = uafhængige

# 2026-10-01-studio-rebuild/lib/optical.mjs:127
js-opt-link-down = forbindelsen nede

# 2026-10-01-studio-rebuild/lib/optical.mjs:148
js-opt-margin-label = Ekstra margin, der er brug for til hvert tilgængelighedsmål

# 2026-10-01-studio-rebuild/lib/optical.mjs:125
js-opt-margin-line-title = { $name }: forbindelsesmargin, dB

# 2026-10-01-studio-rebuild/lib/optical.mjs:147
js-opt-margin-note = Ekstra forbindelsesmargin, i dB oven på den nuværende forbindelse, for hvert tilgængelighedsmål; negativ betyder, at forbindelsen allerede har mere, end den behøver. Et mål over et steds loft har ingen margin, der når det (motoren udelader det).

# 2026-10-01-studio-rebuild/lib/optical.mjs:147
js-opt-margin-title = Den margin, hvert tilgængelighedsmål har brug for

# 2026-10-01-studio-rebuild/optical/optical.js:39
js-opt-model-output = Modeloutput

# 2026-10-01-studio-rebuild/lib/optical.mjs:167
js-opt-na = n/a

# 2026-10-01-studio-rebuild/lib/optical.mjs:83
js-opt-no-data = Ingen data i dette resultat.

# 2026-10-01-studio-rebuild/lib/optical.mjs:112
js-opt-no-series = Ingen tidsserie i dette resultat.

# 2026-10-01-studio-rebuild/optical/optical.js:42
js-opt-no-source = ingen kilde angivet

# 2026-10-01-studio-rebuild/lib/optical.mjs:37
js-opt-not-result = dette er ikke et resultat for optisk atmosfære med steder

# 2026-10-01-studio-rebuild/optical/optical.js:30
js-opt-open-failed = { $title } kunne ikke åbnes: { $reason }.

# 2026-10-01-studio-rebuild/optical/optical.js:20
js-opt-opening = Åbner { $title }…

# 2026-10-01-studio-rebuild/lib/optical.mjs:150
js-opt-outage-label = Sandsynlighed for, at et udfald varer længere end en given varighed

# 2026-10-01-studio-rebuild/lib/optical.mjs:149
js-opt-outage-note = Sandsynlighed for, at et udfald varer længere end en given varighed, pr. sted (logaritmisk tidsakse).

# 2026-10-01-studio-rebuild/lib/optical.mjs:149
js-opt-outage-title = Hvor længe udfald varer

# 2026-10-01-studio-rebuild/lib/optical.mjs:96
js-opt-point-title = { $name }: { $xLabel } { $x }, { $yLabel } { $y }

# 2026-10-01-studio-rebuild/optical/optical.js:42
js-opt-prov = { $label } Steder: { $sites }.

# 2026-10-01-studio-rebuild/lib/optical.mjs:119
js-opt-realised-up = { $value } oppe

# 2026-10-01-studio-rebuild/optical/optical.js:28
js-opt-recorded = { $title }: motorens optagede resultat (version { $version }). Modeloutput, ikke en måling.

# 2026-10-01-studio-rebuild/lib/optical.mjs:36
js-opt-result-not-json = resultatet er ikke JSON ({ $reason })

# 2026-10-01-studio-rebuild/optical/optical.js:23
js-opt-result-not-loaded = det optagede resultat blev ikke indlæst

# 2026-10-01-studio-rebuild/lib/optical.mjs:110
js-opt-series-label = Forbindelsesmargin mod tid

# 2026-10-01-studio-rebuild/lib/optical.mjs:143
js-opt-series-note = Én seedet realisering af den angivne stedsmodel (seed { $seed }, { $hours } h med trin på { $step } s): skyepisoder, en væskevandssøjle for hver, ét scintillationssample pr. trin. Marginen er fadingbudgettet minus fadingen fra skyer og scintillation; forbindelsen er nede under 0 dB. Det er ét udtræk, ikke klimaet: dens tilgængelighed afviger fra den angivne med udtrækkets stikprøvefejl. Marginen er beskåret ved −40 dB af hensyn til tegningen.

# 2026-10-01-studio-rebuild/lib/optical.mjs:143
js-opt-series-title = Forbindelsesmargin mod tid

# 2026-10-01-studio-rebuild/lib/optical.mjs:119
js-opt-stated = angivet { $value }

# 2026-10-01-studio-rebuild/lib/optical.mjs:129
js-opt-stripe-cloud = sky

# 2026-10-01-studio-rebuild/lib/optical.mjs:129
js-opt-stripe-down = nede

# 2026-10-01-studio-rebuild/lib/optical.mjs:126
js-opt-stripe-title = { $what }, time { $from } til { $to }

# 2026-10-01-studio-rebuild/lib/optical.mjs:156
js-opt-techniques-label = Tilgængelighedsgevinst pr. teknik

# 2026-10-01-studio-rebuild/lib/optical.mjs:156
js-opt-techniques-note = Tilgængelighedsgevinst i procentpoint over baseline, for ét sted.

# 2026-10-01-studio-rebuild/lib/optical.mjs:156
js-opt-techniques-title = Hvad hver teknik giver

# 2026-10-01-studio-rebuild/optical/optical.js:41
js-opt-th-availability = Tilgængelighed

# 2026-10-01-studio-rebuild/optical/optical.js:41
js-opt-th-ceiling = Loft

# 2026-10-01-studio-rebuild/optical/optical.js:41
js-opt-th-clear-air = Tab i klar luft

# 2026-10-01-studio-rebuild/optical/optical.js:41
js-opt-th-cloud-prob = Skysandsynlighed (input)

# 2026-10-01-studio-rebuild/optical/optical.js:41
js-opt-th-fade-budget = Fadingbudget

# 2026-10-01-studio-rebuild/optical/optical.js:41
js-opt-th-latlon = Breddegrad, længdegrad

# 2026-10-01-studio-rebuild/optical/optical.js:41
js-opt-th-mean-outage = Gennemsnitligt udfald

# 2026-10-01-studio-rebuild/optical/optical.js:41
js-opt-th-outages-year = Udfald pr. år

# 2026-10-01-studio-rebuild/optical/optical.js:41
js-opt-th-scint = Scintillationsindeks

# 2026-10-01-studio-rebuild/optical/optical.js:41
js-opt-th-site = Sted

# 2026-10-01-studio-rebuild/lib/optical.mjs:152
js-opt-timing-label = Tilgængelighed af tidssynkronisering pr. sted og ur

# 2026-10-01-studio-rebuild/lib/optical.mjs:152
js-opt-timing-note = Andel af hele tiden, hvor tidsfejlen holder sig inden for tærsklen, pr. sted og urklasse: urets holdover mod udfaldenes varighed.

# 2026-10-01-studio-rebuild/lib/optical.mjs:152
js-opt-timing-title = Tidssynkronisering holdt gennem udfaldene

# 2026-10-01-studio-rebuild/lib/optical.mjs:19
js-opt-title-network = Tre jordstationer, stedsdiversitet

# 2026-10-01-studio-rebuild/lib/optical.mjs:20
js-opt-title-techniques = Én uplink, forbedringsteknikker

# 2026-10-01-studio-rebuild/lib/optical.mjs:154
js-opt-x-best-n = de bedste n steder

# 2026-10-01-studio-rebuild/lib/optical.mjs:150
js-opt-x-outage-duration = udfaldets varighed, h (log)

# 2026-10-01-studio-rebuild/lib/optical.mjs:148
js-opt-x-target = tilgængelighedsmål, %

# 2026-10-01-studio-rebuild/lib/optical.mjs:154
js-opt-y-availability = tilgængelighed, %

# 2026-10-01-studio-rebuild/lib/optical.mjs:148
js-opt-y-extra-margin = ekstra margin, dB

# 2026-10-01-studio-rebuild/lib/optical.mjs:150
js-opt-y-p-longer = P(længere)

# 2026-10-01-studio-rebuild/lib/replay.mjs:47
js-replay-band-calibrating = kalibrerer

# 2026-10-01-studio-rebuild/lib/replay.mjs:49
js-replay-band-degraded = forringet

# 2026-10-01-studio-rebuild/lib/replay.mjs:48
js-replay-band-nominal = nominel

# 2026-10-01-studio-rebuild/replay/replay.js:89
js-replay-band-run-ended = { $band } · kørslen sluttede

# 2026-10-01-studio-rebuild/lib/replay.mjs:50
js-replay-band-untrusted = upålidelig

# 2026-10-01-studio-rebuild/replay/replay.js:101
js-replay-clock = T+{ $t } af { $max }

# 2026-10-01-studio-rebuild/lib/replay.mjs:235
js-replay-coast-hidden = kyst skjult: denne logs opdigtede positioner ligger på land

# 2026-10-01-studio-rebuild/replay/replay.js:76
js-replay-coast-note = Kyst: { $source }, kun til illustration.

# 2026-10-01-studio-rebuild/replay/replay.js:76
js-replay-coast-note-hidden = { $reason }.

# 2026-10-01-studio-rebuild/lib/replay.mjs:217
js-replay-coast-window = Natural Earth 1:10 millioner, vindue { $window }

# 2026-10-01-studio-rebuild/lib/replay.mjs:226
js-replay-coast-world = Natural Earth 1:110 millioner (Studios verdensomrids), grov

# 2026-10-01-studio-rebuild/replay/replay.js:63
js-replay-demo-trust-log = { $title } (tillidslog)

# 2026-10-01-studio-rebuild/lib/replay.mjs:138
js-replay-dir-east = øst

# 2026-10-01-studio-rebuild/lib/replay.mjs:138
js-replay-dir-north = nord

# 2026-10-01-studio-rebuild/lib/replay.mjs:138
js-replay-dir-south = syd

# 2026-10-01-studio-rebuild/lib/replay.mjs:138
js-replay-dir-west = vest

# 2026-10-01-studio-rebuild/lib/replay.mjs:141
js-replay-dirs-and = { $list } og { $last }

# 2026-10-01-studio-rebuild/replay/replay.js:168
js-replay-drawing-animation = Tegner animationen…

# 2026-10-01-studio-rebuild/replay/replay.js:177
js-replay-drawing-frames = Tegner billedene…

# 2026-10-01-studio-rebuild/lib/replay.mjs:140
js-replay-every-direction = alle retninger

# 2026-10-01-studio-rebuild/replay/replay.js:149
js-replay-file-error = { $name }: { $error }

# 2026-10-01-studio-rebuild/lib/kinds.mjs:481
js-replay-kinds-convergence-horizontal = Konvergens: median af den horisontale fejl

# 2026-10-01-studio-rebuild/lib/kinds.mjs:482
js-replay-kinds-convergence-vertical = Konvergens: median af den vertikale fejl

# 2026-10-01-studio-rebuild/replay/replay.js:91
js-replay-kv-course = Rapporteret kurs

# 2026-10-01-studio-rebuild/replay/replay.js:91
js-replay-kv-heading = Kursretning (gyro)

# 2026-10-01-studio-rebuild/replay/replay.js:91
js-replay-kv-position-error = Positionsfejl

# 2026-10-01-studio-rebuild/replay/replay.js:91
js-replay-kv-receiver = Modtager

# 2026-10-01-studio-rebuild/replay/replay.js:91
js-replay-kv-run-time = Kørselstid

# 2026-10-01-studio-rebuild/replay/replay.js:91
js-replay-kv-satellites = Satellitter brugt / i sigte

# 2026-10-01-studio-rebuild/replay/replay.js:91
js-replay-kv-sky = Himmel

# 2026-10-01-studio-rebuild/replay/replay.js:52
js-replay-legend = Signaturforklaring

# 2026-10-01-studio-rebuild/replay/replay.js:54
js-replay-legend-no-fix = ingen positionsbestemmelse

# 2026-10-01-studio-rebuild/replay/replay.js:54
js-replay-legend-true-track = reelt spor

# 2026-10-01-studio-rebuild/replay/replay.js:107
js-replay-moment = Øjeblik ved T+{ $t }:

# 2026-10-01-studio-rebuild/replay/replay.js:76
js-replay-no-coast = Ingen kyst tegnes: der følger ingen med for dette vindue.

# 2026-10-01-studio-rebuild/replay/replay.js:92
js-replay-no-gsv = ingen GSV i denne log

# 2026-10-01-studio-rebuild/replay/replay.js:143
js-replay-not-json = { $name }: ikke JSON.

# 2026-10-01-studio-rebuild/replay/replay.js:89
js-replay-not-scored = ikke vurderet

# 2026-10-01-studio-rebuild/lib/observatory.mjs:27
js-replay-obs-not-attributed = ikke tillagt

# 2026-10-01-studio-rebuild/replay/replay.js:135
js-replay-open-failed = { $id } kunne ikke åbnes: { $reason }.

# 2026-10-01-studio-rebuild/replay/replay.js:47
js-replay-open-file = Åbn en fil…

# 2026-10-01-studio-rebuild/replay/replay.js:153
js-replay-opened = Åbnede { $name } i panel { $n }. Læst her; intet blev uploadet.

# 2026-10-01-studio-rebuild/replay/replay.js:133
js-replay-opening = Åbner { $id }…

# 2026-10-01-studio-rebuild/replay/replay.js:104
js-replay-pause = Pause

# 2026-10-01-studio-rebuild/replay/replay.js:104
js-replay-play = Afspil

# 2026-10-01-studio-rebuild/replay/replay.js:154
js-replay-read-failed = { $name }: kunne ikke læses eller tegnes ({ $reason }).

# 2026-10-01-studio-rebuild/replay/replay.js:139
js-replay-reading = Læser { $name }…

# 2026-10-01-studio-rebuild/replay/replay.js:217
js-replay-reduced-motion = Reduceret bevægelse foretrækkes, så afspilningen starter ved 1x og afspilles ikke af sig selv.

# 2026-10-01-studio-rebuild/replay/replay.js:46
js-replay-run = Kørsel

# 2026-10-01-studio-rebuild/replay/replay.js:46
js-replay-run-shown = Kørsel vist i panel { $n }

# 2026-10-01-studio-rebuild/replay/replay.js:172
js-replay-saved-svg = Gemte { $name } ({ $size } kB): hvert billede i én fil, tegnet ud fra de samme rækker som denne side.

# 2026-10-01-studio-rebuild/replay/replay.js:181
js-replay-saved-zip = Gemte { $name } ({ $size } MB): én SVG pr. billede, et manifest over rækkerne bag hver og en README.

# 2026-10-01-studio-rebuild/replay/replay.js:147
js-replay-src-instructor = Din fil { $name }: ingen motorvurdering eller himmel følger med en instruktørlog alene.

# 2026-10-01-studio-rebuild/replay/replay.js:150
js-replay-src-trust = Din fil { $name }: et tillidsresultat indeholder hverken himmel eller kursretning, så de tegnes ikke.

# 2026-10-01-studio-rebuild/replay/replay.js:254
js-replay-status-ready = { $a } og { $b }: syntetiske kørsler, vurderet af motoren. Tryk på Afspil, eller flyt uret.

# 2026-10-01-studio-rebuild/replay/replay.js:134
js-replay-status-synthetic = { $titles }: syntetiske kørsler, vurderet af motoren.

# 2026-10-01-studio-rebuild/replay/replay.js:134
js-replay-status-synthetic-no-coast = { $titles }: syntetiske kørsler, vurderet af motoren. Kystlinjen er ikke tilgængelig.

# 2026-10-01-studio-rebuild/replay/replay.js:51
js-replay-strip-label = Tillidsscore over kørslen

# 2026-10-01-studio-rebuild/replay/replay.js:23
js-replay-titles-and = { $a } og { $b }

# 2026-10-01-studio-rebuild/replay/replay.js:141
js-replay-too-large = { $name } er større, end denne side læser.

# 2026-10-01-studio-rebuild/replay/replay.js:75
js-replay-track = Spor af { $n } logrækker, nord opad.

# 2026-10-01-studio-rebuild/replay/replay.js:75
js-replay-track-widened = Spor af { $n } logrækker, nord opad, udvidet for at vise den nærmeste kyst.

# 2026-10-01-studio-rebuild/replay/replay.js:98
js-replay-verdict = Vurdering

# 2026-10-01-studio-rebuild/lib/replay.mjs:198
js-replay-verdict-degraded = { $dur } forringet, ingen upålidelig

# 2026-10-01-studio-rebuild/replay/replay.js:98
js-replay-verdict-early = Vurdering (tidlig)

# 2026-10-01-studio-rebuild/replay/replay.js:98
js-replay-verdict-fine = Kun ud fra loggen og motorens vurdering; syntetisk, vejledende, ikke et tal for detektionsevne.

# 2026-10-01-studio-rebuild/lib/replay.mjs:196
js-replay-verdict-first = første gang under nominel ved T+{ $t }

# 2026-10-01-studio-rebuild/lib/replay.mjs:195
js-replay-verdict-first-after = første gang under nominel ved T+{ $t }, { $dur } efter, at den første hændelse begyndte (T+{ $onset })

# 2026-10-01-studio-rebuild/lib/replay.mjs:196
js-replay-verdict-first-before = første gang under nominel ved T+{ $t }, før den første hændelses begyndelse (T+{ $onset })

# 2026-10-01-studio-rebuild/lib/replay.mjs:193
js-replay-verdict-lowest = Laveste tillidsscore { $score } ({ $band }) ved T+{ $t }

# 2026-10-01-studio-rebuild/lib/replay.mjs:194
js-replay-verdict-never-left = scoren forlod aldrig det nominelle bånd

# 2026-10-01-studio-rebuild/lib/replay.mjs:201
js-replay-verdict-no-fix = ingen positionsbestemmelse i { $dur }

# 2026-10-01-studio-rebuild/lib/replay.mjs:199
js-replay-verdict-not-scored = Ikke vurderet: motorens tillidsscore vises for bibliotekskørslerne

# 2026-10-01-studio-rebuild/lib/replay.mjs:200
js-replay-verdict-peak-error = største loggede positionsfejl { $err } m ved T+{ $t }

# 2026-10-01-studio-rebuild/lib/replay.mjs:197
js-replay-verdict-untrusted = { $dur } i det upålidelige bånd

# 2026-10-01-studio-rebuild/replay/replay.js:98
js-replay-verdict-wait = Vises, når denne kørsel slutter, ved T+{ $t }.

# 2026-10-01-studio-rebuild/lib/ssv.mjs:178
js-ssv-altitude-label = Højde og brugte målinger

# 2026-10-01-studio-rebuild/lib/ssv.mjs:156
js-ssv-at-least-1 = mindst 1 signal

# 2026-10-01-studio-rebuild/lib/ssv.mjs:156
js-ssv-at-least-4 = mindst 4 signaler

# 2026-10-01-studio-rebuild/lib/ssv.mjs:156
js-ssv-avail-label = Tilgængelighed, { $band }

# 2026-10-01-studio-rebuild/lib/ssv.mjs:96
js-ssv-bar-title = { $label }, { $name }: { $value }{ $unit }

# 2026-10-01-studio-rebuild/lib/ssv.mjs:26
js-ssv-blurb-formation-heo = En chief og en deputy med en kilometers afstand i en stærkt elliptisk bane: hvor godt filteret kender deres relative position, mod hvad de to absolutte positionsbestemmelser ville give.

# 2026-10-01-studio-rebuild/lib/ssv.mjs:23
js-ssv-blurb-heo = En stærkt elliptisk bane (apogæum nær 58 600 km) med en nadir-antenne med høj forstærkning og en zenit-patchantenne og en parametrisk sidelobemodel: signaler i sigte, bedste C/N0, hovedlobe mod sidelobe, præcisionsudvanding og de signaler, der strejfer atmosfæren.

# 2026-10-01-studio-rebuild/lib/ssv.mjs:24
js-ssv-blurb-lunar-weak = En månetransferbane med en modtager bygget til at fungere ved de svageste signaler: hvad den skal bruge for at opfange og spore, og hvor stor en del af banen den kan bruge.

# 2026-10-01-studio-rebuild/lib/ssv.mjs:25
js-ssv-blurb-nav-lunar = Et navigationsfilter om bord på en månetransfer: dets positionsfejl mod den grænse, det selv angiver, under og over GNSS-satellitternes egne baner.

# 2026-10-01-studio-rebuild/lib/ssv.mjs:22
js-ssv-blurb-shell = En kugleskal i geostationær højde, samplet på et gitter: hvor ofte hører et rumfartøj dér mindst ét og mindst fire signaler ved 20 dB-Hz, på L1 og L5, for hver konstellation og alle samlet?

# 2026-10-01-studio-rebuild/lib/ssv.mjs:168
js-ssv-cn0-altitude-label = Bedste C/N0 og højde mod tid, { $band }

# 2026-10-01-studio-rebuild/lib/ssv.mjs:164
js-ssv-cn0-label = Bedste C/N0, { $band }

# 2026-10-01-studio-rebuild/lib/ssv.mjs:164
js-ssv-cn0-note = Af de signaler, der er i sigte, det stærkeste ved hver epoke: mindste til største over epokerne, med middelværdien markeret.

# 2026-10-01-studio-rebuild/lib/ssv.mjs:164
js-ssv-cn0-title = Bedste bærebølge-til-støj-tæthed, { $band }

# 2026-10-01-studio-rebuild/ssv/ssv.js:57
js-ssv-comparison-failed = Sammenligningen kunne ikke vises ({ $reason }).

# 2026-10-01-studio-rebuild/ssv/ssv.js:53
js-ssv-comparison-not-loaded = sammenligningsfilen blev ikke indlæst

# 2026-10-01-studio-rebuild/lib/ssv.mjs:82
js-ssv-default-bars = søjler

# 2026-10-01-studio-rebuild/lib/ssv.mjs:104
js-ssv-default-chart = diagram

# 2026-10-01-studio-rebuild/lib/ssv.mjs:133
js-ssv-default-ranges = intervaller

# 2026-10-01-studio-rebuild/lib/ssv.mjs:184
js-ssv-deputies-note = Absolut RMS for chief { $rms } m over { $epochs } epoker.

# 2026-10-01-studio-rebuild/lib/ssv.mjs:184
js-ssv-deputies-title = Hver deputy

# 2026-10-01-studio-rebuild/lib/ssv.mjs:170
js-ssv-dop-note = Median, 95. percentil og værste PDOP over de epoker, der har en positionsbestemmelse, og, hvor scenariet angiver en atmosfære, de signaler, der strejfer den.

# 2026-10-01-studio-rebuild/lib/ssv.mjs:170
js-ssv-dop-title = Præcisionsudvanding og atmosfæren, { $band }

# 2026-10-01-studio-rebuild/lib/ssv.mjs:177
js-ssv-err-label = Positionsfejl mod den angivne grænse

# 2026-10-01-studio-rebuild/lib/ssv.mjs:176
js-ssv-err-note = Den stiplede linje er den ét-sigma-grænse, filteret angiver; den hele linje er dets fejl mod den reference, scenariet kender. Udtyndet af motoren.

# 2026-10-01-studio-rebuild/lib/ssv.mjs:176
js-ssv-err-title = Positionsfejl mod filterets egen grænse

# 2026-10-01-studio-rebuild/lib/ssv.mjs:222
js-ssv-fact-antenna = Antenne

# 2026-10-01-studio-rebuild/lib/ssv.mjs:224
js-ssv-fact-apogee = Apogæumshøjde

# 2026-10-01-studio-rebuild/lib/ssv.mjs:225
js-ssv-fact-cn0-threshold = Tærskel for bærebølge-til-støj-tæthed

# 2026-10-01-studio-rebuild/lib/ssv.mjs:222
js-ssv-fact-duration = Varighed

# 2026-10-01-studio-rebuild/lib/ssv.mjs:223
js-ssv-fact-eccentricity = Excentricitet

# 2026-10-01-studio-rebuild/lib/ssv.mjs:222
js-ssv-fact-grid-points = Gitterpunkter

# 2026-10-01-studio-rebuild/lib/ssv.mjs:223
js-ssv-fact-inclination = Inklination

# 2026-10-01-studio-rebuild/lib/ssv.mjs:221
js-ssv-fact-mode = Tilstand

# 2026-10-01-studio-rebuild/lib/ssv.mjs:224
js-ssv-fact-perigee = Perigæumshøjde

# 2026-10-01-studio-rebuild/lib/ssv.mjs:224
js-ssv-fact-period = Omløbstid

# 2026-10-01-studio-rebuild/lib/ssv.mjs:222
js-ssv-fact-shell-altitude = Skalhøjde

# 2026-10-01-studio-rebuild/lib/ssv.mjs:223
js-ssv-fact-sma = Store halvakse

# 2026-10-01-studio-rebuild/lib/ssv.mjs:222
js-ssv-fact-step = Trin

# 2026-10-01-studio-rebuild/lib/ssv.mjs:183
js-ssv-filter = filter

# 2026-10-01-studio-rebuild/lib/ssv.mjs:182
js-ssv-formation-note = RMS af den relative positionsfejl, fra filteret og ved at tage differensen af de to absolutte positionsbestemmelser, over hele kørslen og over GNSS-banerne.

# 2026-10-01-studio-rebuild/lib/ssv.mjs:182
js-ssv-formation-title = Relativ position af deputies

# 2026-10-01-studio-rebuild/lib/ssv.mjs:183
js-ssv-from-absolute = fra to absolutte positionsbestemmelser

# 2026-10-01-studio-rebuild/lib/ssv.mjs:78
js-ssv-group-combined = alle samlet

# 2026-10-01-studio-rebuild/ssv/ssv.js:56
js-ssv-icg-note = { $label }; tærskelafgørelserne fra motorens committede resultatfiler (motorens commit { $commit }). Hæftets tabeller er offentlige; intet her er VALIDATED.

# 2026-10-01-studio-rebuild/lib/ssv.mjs:208
js-ssv-icg-wrong-file = ICG-sammenligningsfilen er ikke den, denne side læser

# 2026-10-01-studio-rebuild/lib/ssv.mjs:165
js-ssv-lobe-note = Hvor mange af de brugbare forbindelser, der kom gennem hovedloben, og hvor mange gennem en sidelobe, talt af motoren.

# 2026-10-01-studio-rebuild/lib/ssv.mjs:165
js-ssv-lobe-title = Hovedlobe og sidelobe, { $band }

# 2026-10-01-studio-rebuild/lib/ssv.mjs:17
js-ssv-na = n/a

# 2026-10-01-studio-rebuild/lib/ssv.mjs:179
js-ssv-nav-note = Brugte og udsorterede målinger, det længste hul med færre end fire signaler, den endelige fejl og estimatet af solstrålingstrykket mod den reference, scenariet kender.

# 2026-10-01-studio-rebuild/lib/ssv.mjs:179
js-ssv-nav-title = Kørslen i tal

# 2026-10-01-studio-rebuild/lib/ssv.mjs:190
js-ssv-never = aldrig

# 2026-10-01-studio-rebuild/lib/ssv.mjs:192
js-ssv-never-had-four = havde aldrig fire

# 2026-10-01-studio-rebuild/lib/ssv.mjs:192
js-ssv-never-had-one = havde aldrig ét

# 2026-10-01-studio-rebuild/lib/ssv.mjs:135
js-ssv-no-range = Intet interval i dette resultat.

# 2026-10-01-studio-rebuild/lib/ssv.mjs:107
js-ssv-no-series = Resultatet indeholder ingen serie til dette diagram.

# 2026-10-01-studio-rebuild/lib/ssv.mjs:216
js-ssv-not-in-variant = ikke en del af varianten

# 2026-10-01-studio-rebuild/lib/ssv.mjs:35
js-ssv-not-result = dette er ikke et gnss-ssv-resultat

# 2026-10-01-studio-rebuild/lib/ssv.mjs:215
js-ssv-of = { $n } af { $total }

# 2026-10-01-studio-rebuild/lib/ssv.mjs:204
js-ssv-offset = { $deg }° forskydning

# 2026-10-01-studio-rebuild/ssv/ssv.js:29
js-ssv-open-failed = { $title } kunne ikke åbnes: { $reason }.

# 2026-10-01-studio-rebuild/ssv/ssv.js:19
js-ssv-opening = Åbner { $title }…

# 2026-10-01-studio-rebuild/lib/ssv.mjs:157
js-ssv-outage-note = I minutter, over kørslen. "Aldrig" markerer en gruppe, der aldrig havde så mange signaler nogen steder på skallen.

# 2026-10-01-studio-rebuild/lib/ssv.mjs:157
js-ssv-outage-title = Længste udfald på skallen

# 2026-10-01-studio-rebuild/lib/ssv.mjs:175
js-ssv-phases-note = En statistik for filteret over kørslen og over dens to dele. En gennemsnitlig positions-NEES nær 3 betyder, at filterets angivne grænse er konsistent med dets fejl.

# 2026-10-01-studio-rebuild/lib/ssv.mjs:175
js-ssv-phases-title = Positionsfejl pr. fase

# 2026-10-01-studio-rebuild/lib/ssv.mjs:122
js-ssv-point-title = { $name }: { $xLabel } { $x }, { $yLabel } { $y }

# 2026-10-01-studio-rebuild/lib/ssv.mjs:143
js-ssv-range-title = { $label }: min. { $min }, middel { $mean }, maks. { $max } { $unit }

# 2026-10-01-studio-rebuild/lib/ssv.mjs:145
js-ssv-range-value = { $min } til { $max }

# 2026-10-01-studio-rebuild/ssv/ssv.js:27
js-ssv-recorded = { $title }: motorens optagede resultat (version { $version }).

# 2026-10-01-studio-rebuild/lib/ssv.mjs:183
js-ssv-relative-label = Relativ positionsfejl

# 2026-10-01-studio-rebuild/lib/ssv.mjs:34
js-ssv-result-not-json = resultatet er ikke JSON ({ $reason })

# 2026-10-01-studio-rebuild/ssv/ssv.js:22
js-ssv-result-not-loaded = det optagede resultat blev ikke indlæst

# 2026-10-01-studio-rebuild/lib/ssv.mjs:201
js-ssv-row-acquires = Opfanger ned til

# 2026-10-01-studio-rebuild/lib/ssv.mjs:201
js-ssv-row-carrier = Bærebølgesporing ned til

# 2026-10-01-studio-rebuild/lib/ssv.mjs:201
js-ssv-row-code = Kodesporing ned til

# 2026-10-01-studio-rebuild/lib/ssv.mjs:201
js-ssv-row-coherent = Kohærent integration

# 2026-10-01-studio-rebuild/lib/ssv.mjs:198
js-ssv-row-delay-mean = Forsinkelse, middel

# 2026-10-01-studio-rebuild/lib/ssv.mjs:201
js-ssv-row-detection = Detektionstærskel

# 2026-10-01-studio-rebuild/lib/ssv.mjs:201
js-ssv-row-false-alarm = Sandsynlighed for falsk alarm pr. celle

# 2026-10-01-studio-rebuild/lib/ssv.mjs:203
js-ssv-row-final-error = Endelig positionsfejl

# 2026-10-01-studio-rebuild/lib/ssv.mjs:203
js-ssv-row-gap = Længste hul

# 2026-10-01-studio-rebuild/lib/ssv.mjs:203
js-ssv-row-gated = Udsorterede målinger

# 2026-10-01-studio-rebuild/lib/ssv.mjs:197
js-ssv-row-grazing = Strejfer under 100 km

# 2026-10-01-studio-rebuild/lib/ssv.mjs:197
js-ssv-row-limb-links = Forbindelser gennem randen

# 2026-10-01-studio-rebuild/lib/ssv.mjs:198
js-ssv-row-loss-mean = Tab, middel

# 2026-10-01-studio-rebuild/lib/ssv.mjs:197
js-ssv-row-lost = Tabt til atmosfæren

# 2026-10-01-studio-rebuild/lib/ssv.mjs:196
js-ssv-row-pdop-median = PDOP, median

# 2026-10-01-studio-rebuild/lib/ssv.mjs:196
js-ssv-row-pdop-p95 = PDOP, 95. percentil

# 2026-10-01-studio-rebuild/lib/ssv.mjs:196
js-ssv-row-pdop-worst = PDOP, værste

# 2026-10-01-studio-rebuild/lib/ssv.mjs:198
js-ssv-row-plasma-mean = Plasmasfærisk TEC, middel

# 2026-10-01-studio-rebuild/lib/ssv.mjs:201
js-ssv-row-search-cells = Søgeceller

# 2026-10-01-studio-rebuild/lib/ssv.mjs:201
js-ssv-row-search-time = Søgetid

# 2026-10-01-studio-rebuild/lib/ssv.mjs:203
js-ssv-row-srp-est = Solstrålingstryk, estimeret

# 2026-10-01-studio-rebuild/lib/ssv.mjs:203
js-ssv-row-srp-truth = Solstrålingstryk, reference

# 2026-10-01-studio-rebuild/lib/ssv.mjs:198
js-ssv-row-stec-mean = Skrå TEC, middel

# 2026-10-01-studio-rebuild/lib/ssv.mjs:197
js-ssv-row-tangent = Tangenthøjde, min. til maks.

# 2026-10-01-studio-rebuild/lib/ssv.mjs:201
js-ssv-row-tracking = Anvendt sporingstærskel

# 2026-10-01-studio-rebuild/lib/ssv.mjs:203
js-ssv-row-used = Brugte målinger

# 2026-10-01-studio-rebuild/lib/ssv.mjs:168
js-ssv-series-altitude = højde/1000

# 2026-10-01-studio-rebuild/lib/ssv.mjs:178
js-ssv-series-altitude-name = højde

# 2026-10-01-studio-rebuild/lib/ssv.mjs:168
js-ssv-series-best-cn0 = bedste C/N0

# 2026-10-01-studio-rebuild/lib/ssv.mjs:177
js-ssv-series-error = fejl

# 2026-10-01-studio-rebuild/lib/ssv.mjs:178
js-ssv-series-measurements = målinger

# 2026-10-01-studio-rebuild/lib/ssv.mjs:167
js-ssv-series-note = Én udtyndet serie af det samlede antal over alle konstellationer. Motoren skriver ingen serie pr. konstellation, så ingen tegnes.

# 2026-10-01-studio-rebuild/lib/ssv.mjs:168
js-ssv-series-signals = signaler i sigte

# 2026-10-01-studio-rebuild/lib/ssv.mjs:168
js-ssv-series-signals-label = Signaler i sigte mod tid, { $band }

# 2026-10-01-studio-rebuild/lib/ssv.mjs:177
js-ssv-series-stated-bound = angivet grænse

# 2026-10-01-studio-rebuild/lib/ssv.mjs:167
js-ssv-series-title = Signaler og bedste C/N0 langs banen, { $band }

# 2026-10-01-studio-rebuild/lib/ssv.mjs:155
js-ssv-shell-avail-note = Andel af gitterpunkter og tidspunkter med mindst ét og mindst fire signaler over { $cn0 } dB-Hz.

# 2026-10-01-studio-rebuild/lib/ssv.mjs:155
js-ssv-shell-avail-title = Tilgængelighed på skallen, { $band }

# 2026-10-01-studio-rebuild/lib/ssv.mjs:197
js-ssv-tangent-value = { $min } til { $max } km

# 2026-10-01-studio-rebuild/lib/ssv.mjs:204
js-ssv-th-above-absolute = Over GNSS: ud fra absolut, m

# 2026-10-01-studio-rebuild/lib/ssv.mjs:204
js-ssv-th-above-filter = Over GNSS: filter, m

# 2026-10-01-studio-rebuild/lib/ssv.mjs:192
js-ssv-th-band-group = Bånd og gruppe

# 2026-10-01-studio-rebuild/lib/ssv.mjs:217
js-ssv-th-bar = Tærskel

# 2026-10-01-studio-rebuild/lib/ssv.mjs:204
js-ssv-th-baseline = Baseline, km

# 2026-10-01-studio-rebuild/lib/ssv.mjs:204
js-ssv-th-common-4 = Epoker med 4 fælles signaler

# 2026-10-01-studio-rebuild/lib/ssv.mjs:204
js-ssv-th-common-mean = Gennemsnitlige fælles signaler

# 2026-10-01-studio-rebuild/lib/ssv.mjs:217
js-ssv-th-compares = Hvad den sammenligner

# 2026-10-01-studio-rebuild/lib/ssv.mjs:204
js-ssv-th-deputy = Deputy

# 2026-10-01-studio-rebuild/lib/ssv.mjs:202
js-ssv-th-epochs = Epoker

# 2026-10-01-studio-rebuild/lib/ssv.mjs:194
js-ssv-th-group = Gruppe

# 2026-10-01-studio-rebuild/lib/ssv.mjs:194
js-ssv-th-main-lobe = Hovedlobeforbindelser

# 2026-10-01-studio-rebuild/lib/ssv.mjs:202
js-ssv-th-nees = Gennemsnitlig positions-NEES

# 2026-10-01-studio-rebuild/lib/ssv.mjs:202
js-ssv-th-phase = Fase

# 2026-10-01-studio-rebuild/lib/ssv.mjs:202
js-ssv-th-pos-p95 = Position, 95. percentil, m

# 2026-10-01-studio-rebuild/lib/ssv.mjs:202
js-ssv-th-pos-rms = Position, RMS, m

# 2026-10-01-studio-rebuild/lib/ssv.mjs:199
js-ssv-th-quantity = Størrelse

# 2026-10-01-studio-rebuild/lib/ssv.mjs:204
js-ssv-th-rel-absolute = Relativ RMS, ud fra absolut, m

# 2026-10-01-studio-rebuild/lib/ssv.mjs:204
js-ssv-th-rel-filter = Relativ RMS, filter, m

# 2026-10-01-studio-rebuild/lib/ssv.mjs:204
js-ssv-th-rel-vel = Relativ hastigheds-RMS, m/s

# 2026-10-01-studio-rebuild/lib/ssv.mjs:217
js-ssv-th-run1-cells = Kørsel 1: celler inden for tolerancen

# 2026-10-01-studio-rebuild/lib/ssv.mjs:217
js-ssv-th-run1-verdict = Afgørelse for kørsel 1

# 2026-10-01-studio-rebuild/lib/ssv.mjs:194
js-ssv-th-sidelobe = Sidelobeforbindelser

# 2026-10-01-studio-rebuild/lib/ssv.mjs:194
js-ssv-th-sidelobe-share = Sidelobeandel

# 2026-10-01-studio-rebuild/lib/ssv.mjs:199
js-ssv-th-value = Værdi

# 2026-10-01-studio-rebuild/lib/ssv.mjs:217
js-ssv-th-variant = Variant (diagnostisk, GLONASS-referencevinkler fra tabel 4.2)

# 2026-10-01-studio-rebuild/lib/ssv.mjs:202
js-ssv-th-vel-rms = Hastigheds-RMS, m/s

# 2026-10-01-studio-rebuild/lib/ssv.mjs:202
js-ssv-th-with-4 = Med 4 eller flere signaler

# 2026-10-01-studio-rebuild/lib/ssv.mjs:192
js-ssv-th-without-1 = Længste uden 1 signal

# 2026-10-01-studio-rebuild/lib/ssv.mjs:192
js-ssv-th-without-4 = Længste uden 4 signaler

# 2026-10-01-studio-rebuild/lib/ssv.mjs:26
js-ssv-title-formation-heo = Formation, stærkt elliptisk bane

# 2026-10-01-studio-rebuild/lib/ssv.mjs:23
js-ssv-title-heo = Stærkt elliptisk bane

# 2026-10-01-studio-rebuild/lib/ssv.mjs:24
js-ssv-title-lunar-weak = Månetransfer, modtager for svage signaler

# 2026-10-01-studio-rebuild/lib/ssv.mjs:25
js-ssv-title-nav-lunar = Filter om bord, månetransfer

# 2026-10-01-studio-rebuild/lib/ssv.mjs:22
js-ssv-title-shell = Skal ved 36 000 km

# 2026-10-01-studio-rebuild/lib/ssv.mjs:161
js-ssv-traj-avail-note = Andel af epokerne med mindst ét og mindst fire signaler over { $cn0 } dB-Hz.

# 2026-10-01-studio-rebuild/lib/ssv.mjs:161
js-ssv-traj-avail-title = Tilgængelighed langs banen, { $band }

# 2026-10-01-studio-rebuild/ssv/ssv.js:37
js-ssv-transmit-pattern = Sendemønster: { $pattern }

# 2026-10-01-studio-rebuild/lib/ssv.mjs:163
js-ssv-unit-signals = signaler

# 2026-10-01-studio-rebuild/lib/ssv.mjs:36
js-ssv-unknown-mode = dette gnss-ssv-resultat har tilstanden "{ $mode }", som denne side ikke læser

# 2026-10-01-studio-rebuild/lib/ssv.mjs:215
js-ssv-variant-met = { $n } af { $total }, ville være nået

# 2026-10-01-studio-rebuild/lib/ssv.mjs:215
js-ssv-variant-not-met = { $n } af { $total }, stadig ikke nået

# 2026-10-01-studio-rebuild/lib/ssv.mjs:163
js-ssv-view-note = Mindste til største antal i sigte over epokerne, med middelværdien markeret.

# 2026-10-01-studio-rebuild/lib/ssv.mjs:163
js-ssv-view-title = Signaler i sigte, { $band }

# 2026-10-01-studio-rebuild/lib/ssv.mjs:172
js-ssv-weak-note = Hvad modtagerudformningen kræver, som motoren beregner det ud fra den angivne integration.

# 2026-10-01-studio-rebuild/lib/ssv.mjs:172
js-ssv-weak-title = Modtageren til svage signaler

# 2026-10-01-studio-rebuild/lib/ssv.mjs:168
js-ssv-x-minutes = minutter

# 2026-10-01-studio-rebuild/lib/ssv.mjs:178
js-ssv-y-altitude-measurements = højde, tusind km; brugte målinger

# 2026-10-01-studio-rebuild/lib/ssv.mjs:168
js-ssv-y-cn0-altitude = dB-Hz; højde i tusind km

# 2026-10-01-studio-rebuild/lib/ssv.mjs:177
js-ssv-y-position-log = position, meter (log)

# 2026-10-01-studio-rebuild/lib/ssv.mjs:168
js-ssv-y-signals-all = signaler i sigte, alle konstellationer

# 2026-10-01-studio-rebuild/lib/tools35-data.mjs:127
js-t35data-ai-q-bench-export = Eksportér et scenaries bevægelse og hændelser til en laboratoriesimulator

# 2026-10-01-studio-rebuild/lib/tools35-data.mjs:128
js-t35data-ai-q-compliance-rows = Hvilke rækker i offentlige rammeværk leverer disse kørsler belæg for?

# 2026-10-01-studio-rebuild/lib/tools35-data.mjs:125
js-t35data-ai-q-evidence-pack = Kontrollér eller opret en bevispakke for en tillidshændelse

# 2026-10-01-studio-rebuild/lib/tools35-data.mjs:124
js-t35data-ai-q-interference-route = Hvor har GNSS set forringet ud, og hvor stor en del af denne rute ligger i det?

# 2026-10-01-studio-rebuild/lib/tools35-data.mjs:129
js-t35data-ai-q-iq-recordings = GNSS IQ-optagelser (scene, opfangning, sporing, front end, kampagner)

# 2026-10-01-studio-rebuild/lib/tools35-data.mjs:126
js-t35data-ai-q-osnma-satellites = Hvilke Galileo-satellitters navigationsdata autentificerer denne modtagerstrøm (OSNMA)?

# 2026-10-01-studio-rebuild/lib/tools35-data.mjs:121
js-t35data-ai-q-run-scenario = Kør eller forklar et PNT-scenarie (baner, GNSS, tidssynkronisering, fusion, måne)

# 2026-10-01-studio-rebuild/lib/tools35-data.mjs:123
js-t35data-ai-q-training-nmea = Jeg har brug for syntetisk NMEA med en jamming-, drag-off-, tidsspoofing- eller replay-hændelse til træning

# 2026-10-01-studio-rebuild/lib/tools35-data.mjs:122
js-t35data-ai-q-trustworthy-log = Var denne modtagerlog eller dette fartøjs NMEA troværdig, og hvornår holdt den op med at være det?

# 2026-10-01-studio-rebuild/lib/tools35-data.mjs:126
js-t35data-ai-tool-osnma-satellites = ingen på MCP: brug osnma_verify (OSNMA-kortet her, WebAssembly), kshana osnma verify (CLI) eller kshana.osnma_verify (Python)

# 2026-10-01-studio-rebuild/lib/tools35-data.mjs:104
js-t35data-card-evidence-create-title = Opret en bevispakke

# 2026-10-01-studio-rebuild/lib/tools35-data.mjs:105
js-t35data-card-evidence-create-what = Signerer et vindue af en modtagerlog og det, motoren beregnede ud fra det, så alle kan kontrollere, at intet blev ændret bagefter. Studio verificerer pakker.

# 2026-10-01-studio-rebuild/lib/tools35-data.mjs:106
js-t35data-card-evidence-create-why = Signering kræver en privat nøgle, som ikke bør passere gennem en webside.

# 2026-10-01-studio-rebuild/lib/tools35-data.mjs:89
js-t35data-card-iq-title = GNSS IQ-overvågninger og -værktøjer

# 2026-10-01-studio-rebuild/lib/tools35-data.mjs:90
js-t35data-card-iq-what = Byg en scene, opfang og spor signaler, gennemløb parametre, modellér en front end, kør IQ-overvågninger og kampagner, tilpas en laboratorielog. Også tilgængeligt fra Python og, inden for én arbejdsmappe, fra AI-assistentens værktøjer.

# 2026-10-01-studio-rebuild/lib/tools35-data.mjs:91
js-t35data-card-iq-why = En optagelse er gigabytes af samples. En side kan ikke rumme den, og kommandoerne, der konverterer, udtrækker og udtynder, omskriver optagelser på disken.

# 2026-10-01-studio-rebuild/lib/tools35-data.mjs:109
js-t35data-card-land-title = Download af landpolygoner til AIS-detektoren for position på land

# 2026-10-01-studio-rebuild/lib/tools35-data.mjs:110
js-t35data-card-land-what = Henter én fastlåst landfil (Natural Earth, public domain) og kontrollerer dens SHA-256. Kortbyggeren tager landfilen som tekst i stedet.

# 2026-10-01-studio-rebuild/lib/tools35-data.mjs:111
js-t35data-card-land-why = Det er den eneste kommando, der åbner en netværksforbindelse, og den kræver systemets curl og et udtrykkeligt flag.

# 2026-10-01-studio-rebuild/lib/tools35-data.mjs:94
js-t35data-card-marine-title = Maritime integrationer

# 2026-10-01-studio-rebuild/lib/tools35-data.mjs:95
js-t35data-card-marine-what = En Signal K-serverplugin og OpenCPN gennem gate-mode NMEA over TCP lægger tillidsscoren på software, som lystsejlere allerede bruger; en referencebygning lægger den på en lille computer ved siden af modtageren.
