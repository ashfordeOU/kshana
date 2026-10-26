# studio-js.ftl (sv): translations

js-adv-all-domains = Alla områden

js-adv-animation-frame-title = Animation av den här körningen, skriven av motorn

js-adv-animation-html-player = HTML-spelare

js-adv-animation-html-player-title = Spelaren i en enda fil, så som motorn skrev den

js-adv-animation-load-failed = Den registrerade animationen kunde inte läsas in ({ $reason }).

js-adv-animation-loading = Läser in den registrerade animationen…

js-adv-animation-none = Det finns ingen registrerad animation för det här scenariot.

js-adv-animation-note = Motorn skriver en animation av varje körning som har en tidsaxel: en SVG som spelas upp av sig själv och en HTML-spelare i en enda fil med egna kontroller för uppspelning och skrubbning. Webbläsarversionen har inte den skrivaren, så det här är filen som den inbyggda motorn för kommandoraden skrev för det medföljande scenariot.

js-adv-animation-svg = Animerad SVG

js-adv-animation-svg-title = SVG:n som spelas upp av sig själv, så som motorn skrev den

js-adv-axis-averaging-time = medelvärdestid τ (s)

js-adv-axis-observation-interval = observationsintervall τ (s)

js-adv-axis-value = värde

js-adv-badge-live-engine = Levande motor

js-adv-badge-recorded = Registrerad

js-adv-badge-recorded-engine = Registrerad körning, motor v{ $version }

js-adv-badge-recorded-native = Registrerad körning, inbyggd motor v{ $version }

js-adv-band-carrier = Bärvåg

js-adv-band-carrier-not-set = inte angiven i det här scenariot

js-adv-band-chip-rate = Chipfrekvens

js-adv-band-jammer-bandwidth = Störsändarens bandbredd

js-adv-band-jammer-label = störsändare { $bandwidth } MHz

js-adv-band-jammer-power = Störsändarens effekt

js-adv-band-jammer-type = Typ av störsändare

js-adv-band-no-carrier-note = Motorn beräknar förhållandet mellan störsändare och signal utifrån länkbudgeten. Det här scenariot anger ingen bärfrekvens, så inget spektrum ritas.

js-adv-band-satellites = Satelliter

js-adv-band-signal-main-lobe = signalens huvudlob

js-adv-band-svg-label = Signal- och störsändarband kring bärvågen

js-adv-band-tracking-threshold = Spårningströskel

js-adv-browser-cannot-run = Webbläsarversionen kan inte köra det här scenariot.

js-adv-busy-running = Kör

js-adv-busy-sweeping = Svepar

js-adv-chain-handed-on =
    { $n ->
        [one] { $n } värde överlämnat
       *[other] { $n } värden överlämnade
    }

js-adv-chain-note = Ett system följt genom varje steg i motorn. Tabellen nedan listar varje tal som ett steg beräknade och som nästa steg använde.

js-adv-chain-stage = Steg { $n }

js-adv-chain-sub = varje stegs utdata matar nästa steg

js-adv-chain-title = Kedjan

js-adv-chart-allan-title = Allan-deviation

js-adv-chart-budget-label = budget

js-adv-chart-default-title = Kshana-diagram

js-adv-chart-effective-cn0 = Effektivt C/N0 per satellit

js-adv-chart-ground-track = Markspår

js-adv-chart-holdover-budget = Holdover mot en tidsbudget

js-adv-chart-mtie-title = MTIE (största tidsintervallfel)

js-adv-chart-provenance = Kshana v{ $version } · kshana.dev

js-adv-chart-provenance-hash = Kshana v{ $version } · scenario { $hash } · kshana.dev

js-adv-chart-stability-title = Klockstabilitet (överlappande Allan-deviation)

js-adv-chart-tdev-title = TDEV (tidsdeviation)

js-adv-chart-undrawable = Det här diagrammet kunde inte ritas.

js-adv-chip-live = Levande motor · v{ $version }

js-adv-chip-live-title = Kshana-motorn körs i den här webbläsaren som WebAssembly

js-adv-chip-recorded = Registrerade körningar · v{ $version }

js-adv-chip-recorded-title = WebAssembly kunde inte starta här. Visar verkliga registrerade körningar av de medföljande scenarierna.

js-adv-chip-recorded-title-reason = WebAssembly kunde inte starta här ({ $reason }). Visar verkliga registrerade körningar av de medföljande scenarierna.

js-adv-chip-unavailable = Motorn är inte tillgänglig

js-adv-cmd-all-fields = Visa varje numeriskt fält

js-adv-cmd-compare = Jämför de fästa körningarna

js-adv-cmd-embed-code = Kopiera inbäddningskod

js-adv-cmd-exports = Ladda ned resultaten (exporter)

js-adv-cmd-history = Öppna körningshistoriken

js-adv-cmd-parameters = Öppna parametrarna

js-adv-cmd-pin = Fäst den här körningen för jämförelse

js-adv-cmd-report = Ladda ned rapporten

js-adv-cmd-reset = Återställ scenariotexten

js-adv-cmd-run = Kör scenariot

js-adv-cmd-share-link = Kopiera delningslänk

js-adv-cmd-start = Gå till startskärmen

js-adv-cmd-theme = Växla mellan ljust och mörkt

js-adv-cmd-tour = Starta den guidade rundturen

js-adv-command-line-only = endast kommandoraden

js-adv-compare-deltas-note = Skillnaderna avser körning A. Grönt markerar det bättre värdet för varje mått.

js-adv-compare-no-common = De här körningarna har inga jämförbara nyckeltal gemensamt. Fäst körningar av samma scenariofamilj för att se tal och skillnader.

js-adv-compare-one-pinned = En körning är fäst. Ändra en parameter, kör igen och fäst den körningen för att jämföra de två.

js-adv-compare-overlay = Överlagring av fästa körningar

js-adv-compare-overlay-diff = Överlagring med skillnaden B − A

js-adv-compare-overlay-note = Heldragna linjer är körning A och streckade linjer körning B, på samma axlar.

js-adv-compare-overlay-title = { $title }: körning { $a } (A) mot körning { $b } (B)

js-adv-compare-pin-two = Fäst minst två körningar för att jämföra dem sida vid sida. Fäst en körning, ändra en parameter eller välj ett annat scenario i samma familj, kör det och fäst igen.

js-adv-compare-run-heading = { $letter } · körning { $run }

js-adv-copy-blocked = Kopiering är blockerad här.

js-adv-copy-command = Kopiera: { $command }

js-adv-could-not-load = Kunde inte läsa in { $file }.

js-adv-coverage-dots = Prickarna är { $shown } av { $total } satelliter, flugna längs sina markspår; spela upp repriseringen för att flytta dem.

js-adv-coverage-field-label = Fält att kartlägga

js-adv-coverage-map = Täckningskarta

js-adv-coverage-map-over = över { $body }

js-adv-coverage-map-select = Karta

js-adv-coverage-note = Varje ruta är en rutnätspunkt på { $body }, poängsatt över varje epok i körningen.

js-adv-coverage-title = { $field } över { $body }

js-adv-crumb-studio = Studio

js-adv-crumb-studio-title = Startskärmen: alla områden

js-adv-decrease-field = Minska { $field }

js-adv-domain = Område

js-adv-domain-line-campaigns = Kedjade uppdrag, svep och Monte Carlo-körningar på en klocka.

js-adv-domain-line-constellations = Utforma en konstellation och kartlägg dess täckning och PDOP (positionsutspädning av precision).

js-adv-domain-line-deepspace = Navigering och tid vid månen, i det cislunara rymden och vid Mars.

js-adv-domain-line-integrity = Positionsbestämningar och om de går att lita på: RAIM (mottagarens autonoma integritetsövervakning) och dess avancerade form, ARAIM.

js-adv-domain-line-interference = Störsändare mot GNSS-mottagare: vad som förloras och när.

js-adv-domain-line-leo = Navigeringssignaler, passager, meddelanden och positionsbestämningar i låg omloppsbana runt jorden.

js-adv-domain-line-leo-missions = Studier och tjänster byggda på ett lager i låg omloppsbana runt jorden.

js-adv-domain-line-navigation = Tröghets-, terräng-, gravitations- och annan navigering utan GNSS.

js-adv-domain-line-optional = En valfri grupp av scenarier.

js-adv-domain-line-orbits = Banpropagering, efemerider och GNSS-geometri.

js-adv-domain-line-solar = Varje planet och måne vid en epok, med ljustider.

js-adv-domain-line-spaceops = Passager, uppskjutningsfönster, återinträde, länk- och attitydbudgetar.

js-adv-domain-line-spectrum = Vattenfall över radiobandet: störsändare, signaler och vad mottagaren spårar.

js-adv-domain-line-spoofing = Falska signaler och meaconing, och de övervakare som fångar dem.

js-adv-domain-line-studies = Kvantsensorer, avvägningsstudier och format för interoperabilitet.

js-adv-domain-line-timing = Klockor utan GNSS: holdover, stabilitet, telekommasker, tidsöverföring.

js-adv-domain-pick-hint = Välj ett: det öppnas och körs i din webbläsare. Du kan ändra dess parametrar därefter.

js-adv-domain-scenario-count =
    { $n ->
        [one] { $label }: { $n } scenario
       *[other] { $label }: { $n } scenarier
    }

js-adv-domain-select-label = Visa ett område

js-adv-download = Ladda ned

js-adv-edited-cli-only-status = Ändrat: det här scenariot körs bara i motorn för kommandoraden.

js-adv-edited-needs-engine = Ändrat: kräver motor { $need }.

js-adv-edited-needs-live-engine = Ändrade scenarier kräver den levande motorn.

js-adv-embed-copied = Inbäddningskoden har kopierats.

js-adv-engine-chart = Motordiagram

js-adv-engine-chart-alt = Motordiagram för den här körningen

js-adv-engine-file-http-error = motorfilen returnerade HTTP { $status }

js-adv-engine-load-failed-no-recordings = motorn kunde inte läsas in ({ $reason }) och inga registrerade körningar hittades

js-adv-engine-loading = Motorn läses in…

js-adv-engine-loading-title = Den levande motorn laddas fortfarande ned. Det här registrerade resultatet ersätts av en levande körning när den är klar.

js-adv-engine-start-failed = Motorn kunde inte starta: { $reason }. Servera den här mappen över HTTP (till exempel python3 -m http.server) i stället för att öppna filen direkt.

js-adv-entries-count =
    { $n ->
        [one] { $n } post
       *[other] { $n } poster
    }

js-adv-export-card-title = Export som { $format }

js-adv-export-csv-desc = Samma byte som kommandoradsverktyget skriver som { $file }.

js-adv-export-csv-title = Reproducerbarhetstabell

js-adv-export-ephemeris-checking = Kontrollerar vilka efemeridformat den här körningen kan exportera…

js-adv-export-ephemeris-waiting = Efemeridexporterna visas här när motorn har lästs in.

js-adv-export-json-desc = Motorns fullständiga utdata för den här körningen, inklusive enheter och proveniens.

js-adv-export-json-title = Fullständigt resultatdokument

js-adv-export-large-not-recorded = Den här exporten är stor, så den registrerades inte. Den kräver den levande motorn.

js-adv-export-oem-desc = CCSDS OEM 2.0 (Orbit Ephemeris Message) för GMAT, Orekit eller STK

js-adv-export-omm-desc = Katalog i CCSDS OMM (Orbit Mean-elements Message)

js-adv-export-report-desc = En fil för användning offline: sammanfattning, tal med sina nivåer, varje diagram och den exakta scenariotexten, stämplad med motorversion och scenariohash.

js-adv-export-report-title = Reproducerbar rapport

js-adv-export-sp3-desc = Precis SP3-c-efemerid för den här konstellationen

js-adv-export-toml-desc = Den här körningens exakta indata. Kör den igen var som helst med kommandoradsverktyget eller Python- och npm-paketen.

js-adv-export-toml-title = Scenariofil

js-adv-export-too-large = { $desc }. För stor för att registreras: kräver den levande motorn.

js-adv-field-find-match =
    { $n ->
        [one] { $n } guidad kontroll och { $fields } av { $total } fält matchar ”{ $query }”.
       *[other] { $n } guidade kontroller och { $fields } av { $total } fält matchar ”{ $query }”.
    }

js-adv-field-find-none = Inget fält i det här scenariot matchar ”{ $query }”. Sök i alla scenarier med biblioteksökningen.

js-adv-field-hit-in = i { $title }

js-adv-field-not-single-number = Det fältet är inte ett enskilt tal i det här scenariot: redigera det i källan.

js-adv-field-opened = Öppnat vid { $field }. Ändra det så körs scenariot igen.

js-adv-fields-matching = Fält som matchar ”{ $query }”

js-adv-fields-more = { $n } till: förfina orden eller sök på startskärmen.

js-adv-fields-top-level = översta nivån

js-adv-filter-check-tuning = kontrollera inställningen

js-adv-filter-consistent = konsekvent

js-adv-from-the-link = från länken

js-adv-geo-sub = { $name } · { $shown } av { $total } objekt ritade · registrerad med den inbyggda motorn

js-adv-geo-title = GeoJSON-export: { $name }

js-adv-gt-note = Markerad: satelliten är synlig från stationen.

js-adv-gt-note-both = Markerad: satelliten är synlig från stationen. Högsta elevation { $elevation }°. Högsta Doppler { $doppler } Hz.

js-adv-gt-note-doppler = Markerad: satelliten är synlig från stationen. Högsta Doppler { $doppler } Hz.

js-adv-gt-note-elevation = Markerad: satelliten är synlig från stationen. Högsta elevation { $elevation }°.

js-adv-heatmap-label = Värmekarta för { $metric }

js-adv-hist-runs-count =
    { $n ->
        [one] { $n } körning.
       *[other] { $n } körningar.
    }

js-adv-history-pin = Fäst

js-adv-history-restore = Återställ

js-adv-history-run-time = körning { $run } · { $time }

js-adv-holdover-engine-figure = Motorns holdover vid scenariots budget: { $duration }

js-adv-holdover-engine-figure-budget = Motorns holdover vid scenariots budget ({ $budget } { $unit }): { $duration }

js-adv-holdover-error-after-loss = fel efter att GNSS förlorades vid t = { $loss } s

js-adv-holdover-error-since-fix = fel sedan den senaste positionsbestämningen

js-adv-holdover-stays-inside = håller sig inom den här budgeten under hela registreringen

js-adv-holdover-until-breached = tills budgeten överskrids

js-adv-honesty-modelled = Fysik från grundprinciper med tester, ännu inte kontrollerad mot en extern oberoende referens. { $text }

js-adv-honesty-partner = Tal som ägs av en partner. { $text }

js-adv-honesty-validated = Kontrollerad mot en oberoende extern referens. { $text }

js-adv-increase-field = Öka { $field }

js-adv-install-version = Installera v{ $version }

js-adv-interop-no-file = Motorn skrev ingen fil i det här formatet för den här körningen.

js-adv-interop-not-applicable = Gäller inte för det här scenariot: { $reason }.

js-adv-interop-not-bundled = Medföljer inte här (storlek): kommandot ovan skriver den.

js-adv-interop-note = Motorn skriver en körnings geometri och signalsamplingar i format som andra verktyg öppnar: CZML för Cesium, KML (Keyhole Markup Language) för Google Earth, GeoJSON för kartor, STK-efemerisfiler (.e) och SigMF-inspelningar (Signal Metadata Format). Webbläsarversionen har inte de skrivarna, så filerna nedan är de som den inbyggda motorn för kommandoraden skrev för det medföljande scenariot.

js-adv-js-range-label = J/S-intervall

js-adv-js-range-value = { $low } till { $high } dB

js-adv-json-copied = JSON har kopierats.

js-adv-kind-default = kind: clock holdover (standard)

js-adv-kind-label = kind: { $kind }

js-adv-kpi-check = Kontroll

js-adv-kpi-delta-since-run = { $arrow } { $change } sedan körning { $run }

js-adv-kpi-fail = Ej klarad

js-adv-kpi-first-run = första körningen

js-adv-kpi-not-in-previous = fanns inte i din föregående körning

js-adv-kpi-pass = Klarad

js-adv-lib-count-all =
    { $scenarios ->
        [one] { $scenarios } scenario
       *[other] { $scenarios } scenarier
    } · { $domains ->
        [one] { $domains } område
       *[other] { $domains } områden
    }

js-adv-lib-count-filtered =
    { $n } av { $total ->
        [one] { $total } scenario
       *[other] { $total } scenarier
    }

js-adv-lib-no-match = Inget scenario eller fält matchar. Prova ett ord som jamming, klocka, månen, bana, mask eller PDOP.

js-adv-loaded-shared = Läste in ett delat scenario från länken.

js-adv-mask-envelope = Tidsfelskuvert för holdover ({ $source })

js-adv-mask-exceeded-after = överskreds efter { $duration }

js-adv-mask-limit-label = gräns { $limit } ns

js-adv-mask-max-te = största |TE|

js-adv-mask-not-exceeded = inte överskriden

js-adv-matrix-counts = { $validated } av { $total }

js-adv-matrix-line = { $counts } förmågor kontrollerade mot oberoende externa referenser · { $modelled } modellerade · { $partner } ägda av partner

js-adv-max-close = Stäng

js-adv-max-close-label = Stäng helskärm

js-adv-max-expand = Expandera

js-adv-max-expand-label = Expandera den här panelen till helskärm

js-adv-max-title = Visa den här panelen i helskärm (Escape stänger den)

js-adv-meta-engine = motor

js-adv-meta-file = fil

js-adv-meta-scenario = scenario

js-adv-meta-seed = frö

js-adv-meta-time = tid

js-adv-mission-timeline = Uppdragstidslinje

js-adv-native-edited-notice = { $why } Den registrerade körningen avser den medföljande filen, så en ändrad kopia kan inte visas här: kör den med kommandoradsverktyget, eller använd Återställ för att se inspelningen.

js-adv-native-notice-command = { $why } Det du ser är en körning registrerad med den inbyggda kommandoradsmotorn v{ $version } genom att köra { $command }, visad oförändrad. Den körs inte om när du redigerar.

js-adv-native-notice-plain = { $why } Det du ser är en körning registrerad med den inbyggda kommandoradsmotorn v{ $version }, visad oförändrad. Den körs inte om när du redigerar.

js-adv-native-notice-platform = { $why } Det du ser är en körning registrerad med den inbyggda kommandoradsmotorn v{ $version } ({ $platform }), visad oförändrad. Den körs inte om när du redigerar.

js-adv-native-notice-platform-command = { $why } Det du ser är en körning registrerad med den inbyggda kommandoradsmotorn v{ $version } ({ $platform }) genom att köra { $command }, visad oförändrad. Den körs inte om när du redigerar.

js-adv-needs-live-engine = Det här kräver den levande motorn.

js-adv-needs-newer-engine-status = Kräver en nyare motor.

js-adv-nees-line = NEES { $mean } (95 %-band { $low }–{ $high }, mål 2.0)

js-adv-newer-engine-edited-notice = Det här scenariot kräver motor { $need } eller senare; motorn som körs här är v{ $version }. Bara inspelningen av den medföljande filen kan visas: använd Återställ för att se den, eller kör en ändrad kopia med motor { $need }.

js-adv-newer-engine-no-recording = Det här scenariot kräver motor { $need } eller senare; motorn som körs här är v{ $version }. Det finns ingen inspelning av det här.

js-adv-newer-engine-shown-commit = Det här scenariot kräver motor { $need } eller senare; motorn som körs här är v{ $version }. Det du ser är körningen registrerad med en motorbyggnad vid commit { $commit }, visad oförändrad; den körs inte om här.

js-adv-newer-engine-shown-version = Det här scenariot kräver motor { $need } eller senare; motorn som körs här är v{ $version }. Det du ser är körningen registrerad med motor v{ $recorded }, visad oförändrad; den körs inte om här.

js-adv-nis-line = NIS { $mean } (95 %-band { $low }–{ $high }, mål 1.0)

js-adv-no-guided-controls = Det här scenariot har inga av de guidade kontrollerna. Använd Alla fält eller redigera källan.

js-adv-no-numeric-fields = Inga enskilda numeriska fält att justera här. Redigera källan direkt.

js-adv-no-recorded-run = Det finns ingen registrerad körning för det här scenariot. Det kräver den levande motorn.

js-adv-no-summary = (det här scenariot publicerar ingen sammanfattning på en rad)

js-adv-noise-floor = brusgolv { $level }

js-adv-not-in-browser-status = Det här scenariot körs inte i webbläsaren.

js-adv-open-and-run = Öppna och kör

js-adv-open-at-field = öppna vid det här fältet

js-adv-opened-from-simple = Öppnat med de inställningar du ändrade i den enkla vyn.

js-adv-optional-preset = valfri förinställning: scenarios/{ $file }

js-adv-orbit-canvas-label = Interaktiv 3D-vy av det propagerade spåret

js-adv-orbit-fallback-alt = Ortografisk vy av det propagerade spåret

js-adv-orbit-note-epoch = Dra för att rotera, scrolla eller nyp för att zooma. Jorden i skala, bilder från NASA Blue Marble. Vriden till körningens epok.

js-adv-orbit-note-no-epoch = Dra för att rotera, scrolla eller nyp för att zooma. Jorden i skala, bilder från NASA Blue Marble. Den här körningen anger ingen epok, så jordens rotationsvinkel är inte meningsfull här.

js-adv-orbit-static-note = Statisk vy (3D-biblioteket kunde inte läsas in här).

js-adv-pal-commands = Kommandon

js-adv-pal-domain = Område: { $name }

js-adv-pal-domains = Områden

js-adv-pal-field = Fält: { $name }

js-adv-pal-fields = Fält

js-adv-pal-nothing = Inget matchar

js-adv-pal-opens-page = öppnar en sida

js-adv-pal-page = Sida: { $name }

js-adv-pal-pages = Sidor

js-adv-pal-panel = Panel: { $name }

js-adv-pal-panels = Paneler

js-adv-pal-scenarios = Scenarier

js-adv-params-hint-all = Varje enskilt tal i scenariot. Stega det, skriv det eller använd piltangenterna; scenariot körs igen.

js-adv-params-hint-guided = Dra i ett reglage så körs scenariot igen. Varje kontroll skriver rakt in i scenariotexten nedan.

js-adv-pin-already = Den körningen är redan fäst.

js-adv-pin-first = Körning { $run } fäst. Ändra en parameter, kör igen och fäst sedan den körningen också.

js-adv-pin-label = { $letter } · { $title } · körning { $run }

js-adv-pin-opening-compare =
    { $n ->
        [one] { $n } körning fäst. Öppnar Jämför.
       *[other] { $n } körningar fästa. Öppnar Jämför.
    }

js-adv-plan-view = Planvy

js-adv-plan-view-epoch = vid { $epoch }

js-adv-plan-view-note = Varje prick är en kropp vid körningens epok och varje kurva är det banspår som motorn beräknade för den. En streckad linje är en länk som scenariot begär. Välj en planet för att se dess månar runt den.

js-adv-player-name-mission = uppdragsreprisen

js-adv-player-name-orbit = banreprisen

js-adv-player-name-replay = reprisen

js-adv-player-name-waterfall = vattenfallsreprisen

js-adv-player-pause = Pausa { $name }

js-adv-player-play = Spela upp { $name }

js-adv-player-position = Position i { $name }

js-adv-png-download-title = Bitmapp med hög upplösning för bildspel och dokument

js-adv-png-export-failed = PNG-exporten misslyckades: { $reason }

js-adv-ready-live = Klar. Körs lokalt i din webbläsare.

js-adv-ready-recorded = Klar. Visar registrerade körningar.

js-adv-receiver-at-time = Mottagare vid t = { $time }

js-adv-recorded-edit-notice = WebAssembly är blockerat på den här sidan, så sidan visar verkliga körningar av de medföljande scenarierna, registrerade med motor v{ $version }. Ändrade scenarier, svep och nya exporter kräver den levande motorn: öppna kshana.dev eller servera den här mappen lokalt. Återställ återför det registrerade scenariot.

js-adv-recorded-edited-warning = Du har ändrat scenariot: den här inspelningen avser den medföljande filen, inte din ändring. Kör kommandot på din egen fil för att få din.

js-adv-recorded-intro = WebAssembly är blockerat på den här sidan, så sidan visar verkliga körningar av de medföljande scenarierna, registrerade med motor v{ $version }. Redigering, svep och nya exporter kräver den levande motorn på kshana.dev.

js-adv-recorded-run-native = registrerad körning, inbyggd motor

js-adv-recorded-written-by = Skriven av den inbyggda kommandoradsmotorn v{ $version } ({ $platform }) med { $command }. Visas oförändrad.

js-adv-replay = Repris

js-adv-report-downloaded = Rapporten har laddats ned.

js-adv-report-frame-title = Körningsrapport skriven av motorn

js-adv-report-html = Rapport (HTML)

js-adv-report-html-title = Rapportfilen, så som motorn skrev den

js-adv-report-load-failed = Den registrerade rapporten kunde inte läsas in ({ $reason }).

js-adv-report-loading = Läser in den registrerade rapporten…

js-adv-report-none = Det finns ingen registrerad rapport för det här scenariot.

js-adv-report-note = Varje körning från kommandoraden skriver en rapport: sammanfattning, indata, resultat, diagrammet, vad som är kontrollerat och vad som är modellerat, samt en reproducerbarhetspost. Webbläsarversionen har inte den skrivaren, så det här är rapporten som den inbyggda kommandoradsmotorn skrev för det medföljande scenariot. Studions egen rapport om körningen på skärmen finns under Exporter.

js-adv-report-open-tab = Öppna i en ny flik

js-adv-report-open-tab-title = Öppna rapporten för sig

js-adv-report-orbit-title = Bana (jordcentrerad tröghet, ortografisk)

js-adv-report-stability-chart = Klockstabilitet

js-adv-report-stability-title = Klockstabilitet (Allan-deviation)

js-adv-restored-run = Återställde körning { $run }.

js-adv-result = Resultat

js-adv-run-cancelled = Körningen avbröts.

js-adv-run-cancelled-previous = Körningen avbröts. Det föregående resultatet visas fortfarande.

js-adv-run-failed = Körningen misslyckades. Se meddelandet bland resultaten.

js-adv-scenario-copied = Scenariot har kopierats.

js-adv-scenarios-count =
    { $n ->
        [one] { $n } scenario
       *[other] { $n } scenarier
    }

js-adv-share-link-copied = Delningslänken har kopierats. Den innehåller det exakta scenariot.

js-adv-share-link-in-bar = Länken placerades i adressfältet.

js-adv-shared-link = delad länk

js-adv-shared-needs-live = Den här länken innehåller ett eget scenario, som kräver den levande motorn. Öppna den på kshana.dev.

js-adv-shared-scenario = Delat scenario

js-adv-shared-scenario-question = Ett scenario som öppnats från en delningslänk. Det körs exakt så som det delades.

js-adv-solar-bodies-label = Vilka kroppar som ska ritas

js-adv-spectrum-part-label = Vilken del av spektrumet

js-adv-spectrum-row-note = Spektrumet längs den vattenfallsrad som reprisen befinner sig på.

js-adv-spectrum-row-title = Spektrum längs den visade raden

js-adv-start-field-meta = { $domain } · fält { $field }

js-adv-start-fields-hint = Var och en öppnar scenariot med den kontrollen markerad, redo att ändras.

js-adv-start-fields-named =
    { $n ->
        [one] Fält med namn som liknar ”{ $query }”: i { $n } scenario
       *[other] Fält med namn som liknar ”{ $query }”: i { $n } scenarier
    }

js-adv-start-more-matches =
    { $n ->
        [one] { $n } träff till: lägg till ett ord för att begränsa.
       *[other] { $n } träffar till: lägg till ett ord för att begränsa dem.
    }

js-adv-start-nothing = Inget matchar ”{ $query }”. Prova ett ord som jamming, klocka, månen, bana, mask eller PDOP.

js-adv-start-scenarios-count = Scenarier ({ $count })

js-adv-status-fetching-recorded = Motorn läses in… Hämtar det registrerade resultatet för det här scenariot.

js-adv-status-ran-locally = Kördes lokalt kl. { $time }, körning { $run }.

js-adv-status-ran-locally-secs = Kördes lokalt kl. { $time }, körning { $run }, { $secs } s.

js-adv-status-recorded-native = Registrerad körning visas kl. { $time } (inbyggd motor).

js-adv-status-recorded-needs-engine = Registrerad körning visas kl. { $time } (kräver motor { $need }).

js-adv-status-recorded-shown = Registrerad körning visas kl. { $time }, körning { $run }.

js-adv-status-recorded-shown-secs = Registrerad körning visas kl. { $time }, körning { $run }, { $secs } s.

js-adv-status-showing-recorded = Motorn läses in… Visar det registrerade resultatet för det här scenariot tills den levande motorn är redo.

js-adv-subtabs-label = Brickor i den här vyn (telefon)

js-adv-suggest-campaign = Spela upp ett uppdrag med jamming, spoofing och holdover

js-adv-suggest-coverage = Kartlägg täckningen för fyra GNSS-konstellationer (globala satellitnavigeringssystem)

js-adv-suggest-holdover = Hållstid när GNSS förloras

js-adv-suggest-waterfall = Se en störsändare på L-bandets vattenfall

js-adv-svg-download-title = Vektordiagram med titel och proveniens

js-adv-sweep-cancelled = Svepet avbröts.

js-adv-sweep-done-grid =
    { $total ->
        [one] Svepade { $total } körning ({ $columns } × { $rows }) lokalt på { $time }.
       *[other] Svepade { $total } körningar ({ $columns } × { $rows }) lokalt på { $time }.
    }

js-adv-sweep-done-line =
    { $total ->
        [one] Svepade { $done } av { $total } körning lokalt på { $time }.
       *[other] Svepade { $done } av { $total } körningar lokalt på { $time }.
    }

js-adv-sweep-enter-range = Ange ett numeriskt intervall.

js-adv-sweep-enter-range-second = Ange ett numeriskt intervall för den andra parametern.

js-adv-sweep-failed = Svepet misslyckades: { $reason }

js-adv-sweep-interrupted = Svepet avbröts av en ny körning.

js-adv-sweep-needs-live = Ett svep kör motorn många gånger, så det kräver den levande motorn.

js-adv-sweep-none-line-chart = Ingen (linjediagram)

js-adv-sweep-nothing = Inget att svepa för det här scenariot.

js-adv-sweep-progress = Svepar körning { $n } av { $total }…

js-adv-sweep-status-done =
    { $total ->
        [one] Svepade { $total } körning kl. { $time }.
       *[other] Svepade { $total } körningar kl. { $time }.
    }

js-adv-sweep-title-grid = { $metric } över { $first } och { $second }

js-adv-sweep-title-line = { $metric } mot { $parameter }

js-adv-sweep-wait = Vänta tills den pågående körningen är klar och svep sedan.

js-adv-tab-animation = Animation

js-adv-tab-compare = Jämför

js-adv-tab-engine-report = Motorrapport

js-adv-tab-exports-report = Exporter och rapport

js-adv-tab-ground-track = Markspår

js-adv-tab-holdover = Holdover

js-adv-tab-orbit-3d = 3D-bana

js-adv-tab-overview = Översikt

js-adv-tab-signal-band = Signal och band

js-adv-tab-stability = Stabilitet

js-adv-tab-sweep = Svep

js-adv-tab-time-series = Tidsserie

js-adv-tab-timing-masks = Tidsmasker

js-adv-th-at-tau-or-time = Vid τ eller tid

js-adv-th-body = Kropp

js-adv-th-clock = Klocka

js-adv-th-distance-sun = Avstånd från solen

js-adv-th-figure = Tal

js-adv-th-file = Fil

js-adv-th-format = Format

js-adv-th-key-figure = Nyckeltal

js-adv-th-light-time-from = Enkelriktad ljustid från { $observer }

js-adv-th-light-time-observer = Enkelriktad ljustid från observatören

js-adv-th-limit = Gräns

js-adv-th-margin = Marginal

js-adv-th-mask-or-budget = Mask eller budget

js-adv-th-metric = Mått

js-adv-th-orbital-period = Omloppstid

js-adv-th-provenance = Proveniens

js-adv-th-size = Storlek

js-adv-th-source = Källa

js-adv-th-tier = Nivå

js-adv-th-unit = Enhet

js-adv-th-value = Värde

js-adv-th-verdict = Utfall

js-adv-th-what-it-is = Vad det är

js-adv-the-body = kroppen

js-adv-tile-scenario-count =
    { $n ->
        [one] { $n } scenario
       *[other] { $n } scenarier
    }

js-adv-timeline-chart-title = Uppdragstidslinje: { $title }

js-adv-timeline-latest-event = Senaste händelse, kl. { $time }: { $label }

js-adv-timeline-no-event = Ingen händelse ännu vid den här tiden.

js-adv-timeline-note = En skrubber styr varje diagram nedan. Varje fas kör vanliga scenarier; kampanjen läser deras utdata till ett enda tidsrutnät. Skuggade band är faserna, lodräta linjer händelserna. Värdena ovan är kampanjens kanaler vid repristiden.

js-adv-timeline-on-one-clock = { $duration } på en klocka

js-adv-timeline-phase = Fas: { $phase }

js-adv-tour-back = Tillbaka

js-adv-tour-done = Klar

js-adv-tour-eyebrow = Guidad rundtur

js-adv-tour-headline-body = Sammanfattningen på en rad, motorversionen och scenariots fingeravtryck, och om varje tal är kontrollerat eller modellerat.

js-adv-tour-headline-title = Läs svaret

js-adv-tour-keyboard-body = ⌘K hittar alla scenarier, vyer eller kommandon. [ och ] växlar mellan vyer.

js-adv-tour-keyboard-title = Allt från tangentbordet

js-adv-tour-library-body = Varje medföljande scenario, grupperat efter uppdragsområde: jamming, spektrum, spoofing, klockor, navigering, integritet, banor, konstellationsutformning, navigering i låg omloppsbana runt jorden, kampanjer, månen, Mars och solsystemet. Sök med /.

js-adv-tour-library-title = Välj ett uppdrag

js-adv-tour-next = Nästa

js-adv-tour-params-body = Guidade reglage för de vanliga inställningarna, eller varje numeriskt fält i scenariot. Varje ändring kör igen.

js-adv-tour-params-title = Justera det

js-adv-tour-pin-body = Fäst upp till fyra körningar och se dem sida vid sida, med skillnader och ett differensspår.

js-adv-tour-pin-title = Jämför körningar

js-adv-tour-run-body = Rust-motorn körs i din webbläsare som WebAssembly. Ingenting laddas upp. ⌘↵ kör var du än är.

js-adv-tour-run-title = Kör det, lokalt

js-adv-tour-share-body = Ladda ned rapporten, resultatet, scenariot och motorns exporter, eller kopiera en länk som innehåller det exakta scenariot, eller en iframe för en kurssida eller wiki.

js-adv-tour-share-title = Dela eller exportera

js-adv-tour-skip = Hoppa över

js-adv-tour-source-body = Hela scenariot i TOML. Det du kör är exakt det du kan dela och reproducera.

js-adv-tour-source-title = Eller redigera vad som helst

js-adv-tour-tabs-body = Vyer visas när resultatet stöder dem: signal och band för jamming, vattenfallet för spektrum, uppdragstidslinjen för kampanjer, täckningskartor för konstellationer, holdover för klockor, masker för telekomtidssynkronisering, 3D-banor, markspår, svep samt motorns egen animation och rapport.

js-adv-tour-tabs-title = Varje vy av körningen

js-adv-tracking-threshold-value = Spårningströskel { $value }

js-adv-transport-label = Repris: en skrubber styr varje panel i den här körningen

js-adv-transport-sub = en skrubber styr varje panel i den här körningen

js-adv-unpin-run = Lossa körning { $run }

js-adv-waterfall = Vattenfall

js-adv-waterfall-note = Färgen är effekt över mottagarens brusgolv. Navigeringssignalerna ligger under det golvet, så det som lyser upp är störsändarna. Spela upp reprisen eller dra i den, så visar banden till höger vad mottagaren fortfarande spårar vid det ögonblicket.

js-adv-waterfall-sub = effektspektraltäthet: frekvens i sidled, tid nedåt

js-adv-waterfall-title = Vattenfall, { $name }

js-adv-webassembly-unavailable = WebAssembly är inte tillgängligt

js-app-all-questions = Alla frågor

js-app-anim-frame-title = Animation av den här körningen, skriven av motorn

js-app-anim-html-player = HTML-spelare

js-app-anim-html-player-title = Spelaren i en enda fil, så som motorn skrev den

js-app-anim-load-failed = Den registrerade animationen kunde inte läsas in ({ $reason }).

js-app-anim-loading = Läser in den registrerade animationen…

js-app-anim-none = Det finns ingen registrerad animation för det här scenariot.

js-app-anim-note = Motorn skriver en animation av varje körning som har en tidsaxel: en SVG som spelas upp av sig själv och en HTML-spelare i en enda fil med egna kontroller för uppspelning och skrubbning. Webbläsarversionen har inte den skrivaren, så det här är filen som den inbyggda motorn för kommandoraden skrev för det medföljande scenariot.

js-app-anim-svg = Animerad SVG

js-app-anim-svg-title = SVG:n som spelas upp av sig själv, så som motorn skrev den

js-app-axis-averaging-time = medelvärdestid τ (s)

js-app-axis-observation-interval = observationsintervall τ (s)

js-app-axis-value = värde

js-app-badge-modelled = { $n } modellerade

js-app-badge-recorded = Registrerad

js-app-badge-validated = { $n } kontrollerade

js-app-band-carrier = Bärvåg

js-app-band-carrier-unset = inte angiven i det här scenariot

js-app-band-chip-rate = Chipfrekvens

js-app-band-jammer-bandwidth = Störsändarens bandbredd

js-app-band-jammer-mhz = störsändare { $mhz } MHz

js-app-band-jammer-power = Störsändarens effekt

js-app-band-jammer-type = Typ av störsändare

js-app-band-main-lobe = signalens huvudlob

js-app-band-no-carrier-note = Motorn beräknar förhållandet mellan störsändare och signal utifrån länkbudgeten. Det här scenariot anger ingen bärfrekvens, så inget spektrum ritas.

js-app-band-satellites = Satelliter

js-app-band-svg-label = Signal- och störsändarband kring bärvågen

js-app-band-tracking-threshold = Spårningströskel

js-app-browse-all-title = Alla { $n } scenarier

js-app-browse-area-kicker =
    { $n ->
        [one] Område · { $n } scenario
       *[other] Område · { $n } scenarier
    }

js-app-browse-area-lede = Välj ett: det öppnas direkt på sitt resultat.

js-app-browse-evidence = De motormetoder som scenarierna kör har { $validated } kontrollerade och { $modelled } modellerade rader i verifieringsmatrisen.

js-app-browse-evidence-title = Evidensen bakom det här området.

js-app-browse-kicker = Bläddra

js-app-browse-lede = Sök, eller välj ett område. Varje scenario öppnas direkt på sitt resultat.

js-app-browse-validated-examples = Kontrollerade, till exempel: { $examples }.

js-app-browser-cannot-run = Webbläsarversionen kan inte köra det här scenariot.

js-app-btn-all-exports = Alla exporter

js-app-btn-all-exports-title = Varje export av den här körningen, inklusive motorns egna format

js-app-btn-compare-pinned = Jämför fästa körningar

js-app-btn-copy-embed = Kopiera inbäddningskod

js-app-btn-copy-link = Kopiera en länk till exakt det här scenariot

js-app-btn-figure-png = Figur (PNG)

js-app-btn-figure-png-title = Diagrammet på skärmen som en bitmapp med hög upplösning

js-app-btn-figure-svg = Figur (SVG)

js-app-btn-figure-svg-title = Diagrammet på skärmen, med sin titel, motorversion och DOI

js-app-btn-pin-compare = Fäst den här körningen för jämförelse

js-app-btn-pin-count = Fäst den här körningen ({ $n } fästa)

js-app-btn-report-html = Reproducerbar rapport (HTML)

js-app-btn-report-html-title = En fil för användning offline: sammanfattning, tal med nivåer, diagram och det exakta scenariot

js-app-btn-result-json = Resultatdata (JSON)

js-app-btn-result-json-title = Motorns fullständiga utdata för den här körningen

js-app-btn-run-history = Körningshistorik

js-app-btn-scenario-toml = Scenariofil (TOML)

js-app-btn-scenario-toml-title = Den här körningens exakta indata

js-app-btn-table-csv = Tabell (CSV)

js-app-btn-table-csv-title = Samma byte som kommandoradsverktyget skriver som { $file }

js-app-bytes =
    { $n ->
        [one] { $n } bytes
       *[other] { $n } bytes
    }

js-app-cap-sub = { $areas } områden, { $total } färdiga scenarier. Varje område visar ett verkligt registrerat resultat och blandningen av evidens bakom det: andelen av dess motormetoder som är kontrollerade mot en extern referens.

js-app-chain-hint = varje stegs utdata matar nästa steg

js-app-chain-note = Ett system följt genom varje steg i motorn. Tabellen nedan listar varje tal som ett steg beräknade och som nästa steg använde.

js-app-chain-stage = Steg { $n }

js-app-chain-values-handed =
    { $n ->
        [one] { $n } värde överlämnat
       *[other] { $n } värden överlämnade
    }

js-app-chart-allan-deviation = Allan-deviation

js-app-chart-cn0-by-satellite = Effektivt C/N0 per satellit

js-app-chart-default-title = Kshana-diagram

js-app-chart-ground-track = Markspår

js-app-chart-holdover-title = Holdover mot en tidsbudget

js-app-chart-mtie-title = MTIE (största tidsintervallfel)

js-app-chart-not-drawn = Det här diagrammet kunde inte ritas.

js-app-chart-scenario-hash = scenario { $hash }

js-app-chart-stability-title = Klockstabilitet (överlappande Allan-deviation)

js-app-chart-tdev-title = TDEV (tidsdeviation)

js-app-chip-failed-title = WebAssembly kunde inte starta här. Visar verkliga registrerade körningar av de medföljande scenarierna.

js-app-chip-failed-title-reason = WebAssembly kunde inte starta här ({ $reason }). Visar verkliga registrerade körningar av de medföljande scenarierna.

js-app-chip-live = Levande motor · v{ $version }

js-app-chip-live-title = Kshana-motorn körs i den här webbläsaren som WebAssembly

js-app-chip-loading = Motorn läses in

js-app-chip-loading-title = Motorn laddas ned. Under tiden visas registrerade resultat.

js-app-chip-recorded = Registrerade körningar · v{ $version }

js-app-chip-unavailable = Motorn är inte tillgänglig

js-app-cli-note = Installera med { $command }. Körningen skriver { $file }, ett diagram och en rapport.

js-app-cli-only-title = Det här körs på kommandoraden, inte i webbläsaren.

js-app-cli-save-comment = # spara scenariofilen nedan som { $file } och kör sedan

js-app-cmd-advanced = Visa varje inställning (avancerade inställningar)

js-app-cmd-browse = Bläddra bland alla scenarier

js-app-cmd-compare = Jämför de fästa körningarna

js-app-cmd-embed = Kopiera inbäddningskod

js-app-cmd-exports = Ladda ned resultaten (exporter)

js-app-cmd-history = Öppna körningshistoriken

js-app-cmd-home = Gå till startskärmen

js-app-cmd-how = Hur det här beräknas

js-app-cmd-pin = Fäst den här körningen för jämförelse

js-app-cmd-report = Ladda ned rapporten

js-app-cmd-research = Kod, data och citering (för forskare)

js-app-cmd-reset = Återställ scenariotexten

js-app-cmd-run = Kör scenariot

js-app-cmd-share = Kopiera delningslänk

js-app-cmd-theme = Växla mellan ljust och mörkt

js-app-cmd-tour = Starta den guidade rundturen

js-app-compare-deltas = Skillnaderna avser körning A. Grönt markerar det bättre värdet för varje mått.

js-app-compare-none = De här körningarna har inga jämförbara nyckeltal gemensamt. Fäst körningar av samma scenariofamilj för att se tal och skillnader.

js-app-compare-pin-two = Fäst minst två körningar för att jämföra dem sida vid sida. Fäst en körning, ändra en parameter eller välj ett annat scenario i samma familj, kör det och fäst igen.

js-app-compare-run-head = { $letter } · körning { $id }

js-app-coverage-cell-note = Varje ruta är en rutnätspunkt på { $body }, poängsatt över varje epok i körningen.

js-app-coverage-dots-of = av

js-app-coverage-dots-post = satelliter, flugna längs sina markspår; spela upp reprisen för att flytta dem.

js-app-coverage-dots-pre = Prickarna är

js-app-coverage-field-label = Fält att kartlägga

js-app-coverage-map = Täckningskarta

js-app-coverage-map-select = Karta

js-app-coverage-over = över

js-app-coverage-title = { $field } över { $body }

js-app-crumb-all-scenarios = Alla scenarier

js-app-crumb-area = Område

js-app-crumb-search = Sökning: { $query }

js-app-crumb-studio = Studio

js-app-download-label = Ladda ned

js-app-edited-cli-only = Ändrat: det här scenariot körs bara i motorn för kommandoraden.

js-app-edited-needs-engine = Ändrat: kräver motor { $need }.

js-app-edited-needs-live = Ändrade scenarier kräver den levande motorn.

js-app-embed-copied = Inbäddningskoden har kopierats.

js-app-engine-chart = Motordiagram

js-app-engine-chart-alt = Motordiagram för den här körningen

js-app-engine-could-not-start = Motorn kunde inte starta: { $reason }. Servera den här mappen över HTTP (till exempel { $command }) i stället för att öppna filen direkt.

js-app-engine-failed = Motorn kunde inte läsas in ({ $reason }).

js-app-engine-file-http = Motorfilen returnerade HTTP { $status }.

js-app-engine-no-recordings = Motorn kunde inte läsas in ({ $reason }) och inga registrerade körningar hittades.

js-app-entries-count =
    { $n ->
        [one] { $n } post
       *[other] { $n } poster
    }

js-app-ev-aria = { $validated } kontrollerade och { $modelled } modellerade rader i verifieringsmatrisen

js-app-ev-title = { $validated } kontrollerade · { $modelled } modellerade rader i verifieringsmatrisen

js-app-ev-validated = kontrollerade

js-app-export-card-title = Export som { $format }

js-app-export-checking = Kontrollerar vilka efemeridformat den här körningen kan exportera…

js-app-export-csv-desc = Samma byte som kommandoradsverktyget skriver som { $file }.

js-app-export-csv-title = Reproducerbarhetstabell

js-app-export-engine-loading = Efemeridexporterna visas här när motorn har lästs in.

js-app-export-json-desc = Motorns fullständiga utdata för den här körningen, inklusive enheter och proveniens.

js-app-export-json-title = Fullständigt resultatdokument

js-app-export-not-recorded = Den här exporten är stor, så den registrerades inte. Den kräver den levande motorn.

js-app-export-oem-desc = CCSDS OEM 2.0 (Orbit Ephemeris Message) för GMAT, Orekit eller STK

js-app-export-omm-desc = Katalog i CCSDS OMM (Orbit Mean-elements Message)

js-app-export-report-desc = En fil för användning offline: sammanfattning, tal med sina nivåer, varje diagram och den exakta scenariotexten, stämplad med motorversion och scenariohash.

js-app-export-report-title = Reproducerbar rapport

js-app-export-sp3-desc = Precis SP3-c-efemerid för den här konstellationen

js-app-export-toml-desc = Den här körningens exakta indata. Kör den igen var som helst med kommandoradsverktyget eller Python- och npm-paketen.

js-app-export-toml-title = Scenariofil

js-app-export-too-large = { $desc }. För stor för att registreras: kräver den levande motorn.

js-app-fields-more = { $n } till

js-app-fields-none = inga

js-app-fields-none-hint = Inga andra enskilda tal att ändra här. Redigera filen under ”För forskare”.

js-app-fields-top-of-file = filens början

js-app-find-matches =
    { $n ->
        [one] { $n } guidad kontroll och { $m } av { $total } fält matchar ”{ $query }”.
       *[other] { $n } guidade kontroller och { $m } av { $total } fält matchar ”{ $query }”.
    }

js-app-find-none = Inget fält i det här scenariot matchar ”{ $query }”. Sök i alla scenarier med biblioteksökningen.

js-app-geo-sub = { $name } · { $features } av { $total } objekt ritade · registrerad med den inbyggda motorn

js-app-geojson-title = GeoJSON-export: { $name }

js-app-gt-highlighted = Markerad: satelliten är synlig från stationen.

js-app-gt-peak-doppler = Högsta Doppler { $value } Hz.

js-app-gt-peak-elevation = Högsta elevation { $value }°.

js-app-health-check-tuning = kontrollera inställningen

js-app-health-consistent = konsekvent

js-app-health-nees-band = NEES { $mean } (95 %-band { $lo }–{ $hi }, mål 2.0)

js-app-health-nis-band = NIS { $mean } (95 %-band { $lo }–{ $hi }, mål 1.0)

js-app-heat-map-label = Värmekarta för { $metric }

js-app-hero-clock = { $elapsed } av { $total }

js-app-hero-mask = elevationsmask { $deg }°

js-app-hero-places =
    { $n ->
        [one] { $n } plats
       *[other] { $n } platser
    }

js-app-hero-positions-only = Endast satellitpositioner: ingen signaleffekt, satellithälsa eller terräng.

js-app-hero-ramp = { $lo } till { $hi } { $field }

js-app-hero-ramp-over = { $lo } till { $hi } { $field }, över { $duration }

js-app-hero-recorded-bare = Registrerat resultat

js-app-hero-satellites =
    { $n ->
        [one] { $n } satellit
       *[other] { $n } satelliter
    }

js-app-hero-steps =
    { $n ->
        [one] { $n } tidssteg
       *[other] { $n } tidssteg
    }

js-app-hist-runs =
    { $n ->
        [one] { $n } körning.
       *[other] { $n } körningar.
    }

js-app-history-pin = Fäst

js-app-history-restore = Återställ

js-app-history-restored = Återställde körning { $id }.

js-app-history-run = körning { $id } · { $time }

js-app-hit-in-scenario = i { $title }

js-app-hit-native-note = registrerad körning, inbyggd motor

js-app-hit-setting-meta = { $area } · inställning { $name }

js-app-ho-budget = budget

js-app-ho-engine-budget = Motorns holdover vid scenariots budget ({ $budget } { $unit }): { $duration }

js-app-ho-engine-budget-bare = Motorns holdover vid scenariots budget: { $duration }

js-app-ho-error-after-loss = fel efter att GNSS förlorades vid t = { $t } s

js-app-ho-error-since-fix = fel sedan den senaste positionsbestämningen

js-app-ho-stays-inside = håller sig inom den här budgeten under hela registreringen

js-app-ho-until-breached = tills budgeten överskrids

js-app-hover-classical = klassisk

js-app-hover-quantum = kvant

js-app-how-checks = (kontrollerar: { $requirement })

js-app-how-matrix = De motormetoder som det här scenariot kör har { $validated } kontrollerade och { $modelled } modellerade rader i verifieringsmatrisen:

js-app-how-matrix-partner = De motormetoder som det här scenariot kör har { $validated } kontrollerade och { $modelled } modellerade rader i verifieringsmatrisen, och { $partner } som ägs av partner:

js-app-how-mix-chip = { $validated } kontrollerade · { $modelled } modellerade

js-app-how-more-notes =
    { $n ->
        [one] { $n } anteckning till från scenariofilen
       *[other] { $n } anteckningar till från scenariofilen
    }

js-app-how-more-rows =
    { $n ->
        [one] { $n } rad till i verifieringsmatrisen (sidan Evidens på webbplatsen).
       *[other] { $n } rader till i verifieringsmatrisen (sidan Evidens på webbplatsen).
    }

js-app-how-no-header = Den här scenariofilen har ingen rubrikanteckning. Motorns sammanfattning nedan säger vad som kördes.

js-app-how-no-matrix-row = Ingen rad i verifieringsmatrisen nämner ännu det här scenariots motortyp.

js-app-how-no-sources = Scenariofilen anger ingen källa, och ingen kontrollerad rad i matrisen täcker dess typ.

js-app-how-own-label = Den här körningens egen etikett: { $label }

js-app-how-per-figure = Per tal, från motorns block figure_tiers: { $validated } kontrollerade, { $modelled } modellerade. Nivån för varje tal finns i vyn Översikt.

js-app-install-copy = Kopiera: { $command }

js-app-install-label = Installera v{ $version }

js-app-interop-no-file = Motorn skrev ingen fil i det här formatet för den här körningen.

js-app-interop-not-apply = Gäller inte för det här scenariot: { $reason }.

js-app-interop-not-bundled = Medföljer inte här (storlek): kommandot ovan skriver den.

js-app-interop-note = Motorn skriver en körnings geometri och signalsamplingar i format som andra verktyg öppnar: CZML för Cesium, KML (Keyhole Markup Language) för Google Earth, GeoJSON för kartor, STK-efemerisfiler (.e) och SigMF-inspelningar (Signal Metadata Format). Webbläsarversionen har inte de skrivarna, så filerna nedan är de som den inbyggda motorn för kommandoraden skrev för det medföljande scenariot.

js-app-job-running = Kör

js-app-job-sweeping = Svepar

js-app-js-range-label = J/S-intervall

js-app-js-range-value = { $lo } till { $hi } dB

js-app-latest-event-at = Senaste händelse, kl.

js-app-legend-all = förmågor i motorn är kontrollerade i hela verifieringsmatrisen; { $modelled } är modellerade och { $partner } ägs av partner.

js-app-legend-count = { $validated } av { $total }

js-app-load-failed = Kunde inte läsa in { $file }.

js-app-mask-envelope = Tidsfelskuvert för holdover ({ $source })

js-app-mask-exceeded-after = överskreds efter { $duration }

js-app-mask-limit = gräns { $value } ns

js-app-mask-not-exceeded = inte överskriden

js-app-meta-engine = motor

js-app-meta-file = fil

js-app-meta-scenario = scenario

js-app-meta-seed = frö

js-app-meta-shared-link = delad länk

js-app-meta-time = tid

js-app-mission-timeline = Uppdragstidslinje

js-app-native-edited-notice = Den registrerade körningen avser den medföljande filen, så en ändrad kopia kan inte visas här: kör den med kommandoradsverktyget, eller använd Återställ för att se inspelningen.

js-app-native-recorded = Det du ser är en körning registrerad med den inbyggda kommandoradsmotorn v{ $version }, visad oförändrad. Den körs inte om när du redigerar.

js-app-native-recorded-c = Det du ser är en körning registrerad med den inbyggda kommandoradsmotorn v{ $version } genom att köra { $command }, visad oförändrad. Den körs inte om när du redigerar.

js-app-native-recorded-p = Det du ser är en körning registrerad med den inbyggda kommandoradsmotorn v{ $version } ({ $platform }), visad oförändrad. Den körs inte om när du redigerar.

js-app-native-recorded-pc = Det du ser är en körning registrerad med den inbyggda kommandoradsmotorn v{ $version } ({ $platform }) genom att köra { $command }, visad oförändrad. Den körs inte om när du redigerar.

js-app-needs-live-engine = Det här kräver den levande motorn.

js-app-needs-newer-engine = Kräver en nyare motor.

js-app-needs-newer-why = Det här scenariot kräver motor { $need } eller senare; motorn som körs här är v{ $version }.

js-app-no-chart-export = Den här vyn har inget diagram att exportera.

js-app-no-event-yet = Ingen händelse ännu vid den här tiden.

js-app-no-recorded-run = Det finns ingen registrerad körning för det här scenariot. Det kräver den levande motorn.

js-app-no-recording-here = Det finns ingen inspelning av det här.

js-app-no-summary = (det här scenariot publicerar ingen sammanfattning på en rad)

js-app-noise-floor = brusgolv { $value }

js-app-not-in-browser = Det här scenariot körs inte i webbläsaren.

js-app-notice-shared-needs-live = Den här länken innehåller ett eget scenario, som kräver den levande motorn. Öppna den på kshana.dev.

js-app-on-one-clock = på en klocka

js-app-only-bundled-recording = Bara inspelningen av den medföljande filen kan visas: använd Återställ för att se den, eller kör en ändrad kopia med motor { $need }.

js-app-opening-result = Öppnar resultatet…

js-app-orbit-canvas-label = Interaktiv 3D-vy av det propagerade spåret

js-app-orbit-epoch-set = Vriden till körningens epok.

js-app-orbit-epoch-unset = Den här körningen anger ingen epok, så jordens rotationsvinkel är inte meningsfull här.

js-app-orbit-img-alt = Ortografisk vy av det propagerade spåret

js-app-orbit-note = Dra för att rotera, scrolla eller nyp för att zooma. Jorden i skala, bilder från NASA Blue Marble.

js-app-orbit-static = Statisk vy (3D-biblioteket kunde inte läsas in här).

js-app-overlay-note = Heldragna linjer är körning A och streckade linjer körning B, på samma axlar.

js-app-overlay-pinned = Överlagring av fästa körningar

js-app-overlay-title = { $title }: körning { $a } (A) mot körning { $b } (B)

js-app-overlay-with-diff = Överlagring med skillnaden B − A

js-app-pal-area = Område: { $label }

js-app-pal-nothing = Inget matchar

js-app-pal-scenario-count =
    { $n ->
        [one] { $n } scenario
       *[other] { $n } scenarier
    }

js-app-pal-sec-areas = Områden

js-app-pal-sec-commands = Kommandon

js-app-pal-sec-scenarios = Scenarier

js-app-pal-sec-settings = Inställningar

js-app-pal-sec-views = Vyer

js-app-pal-setting = Inställning: { $label }

js-app-pal-view = Vy: { $label }

js-app-panel-close = Stäng

js-app-panel-close-full = Stäng helskärm

js-app-panel-expand = Expandera

js-app-panel-expand-full = Expandera den här panelen till helskärm

js-app-panel-expand-title = Visa den här panelen i helskärm (Escape stänger den)

js-app-params-hint = Ändra ett värde och kör sedan igen. Svaret och diagrammet uppdateras på plats.

js-app-phase = Fas:

js-app-pin-already = Den körningen är redan fäst.

js-app-pin-compare =
    { $n ->
        [one] { $n } körning fäst. Öppnar Jämför.
       *[other] { $n } körningar fästa. Öppnar Jämför.
    }

js-app-pin-first = Körning { $id } fäst. Ändra en parameter, kör igen och fäst sedan den körningen också.

js-app-pin-label = { $letter } · { $title } · körning { $id }

js-app-plan-view = Planvy

js-app-plan-view-at = vid

js-app-player-pause = Pausa reprisen

js-app-player-pause-mission = Pausa uppdragsreprisen

js-app-player-pause-orbit = Pausa banreprisen

js-app-player-pause-waterfall = Pausa vattenfallsreprisen

js-app-player-play = Spela upp reprisen

js-app-player-play-mission = Spela upp uppdragsreprisen

js-app-player-play-orbit = Spela upp banreprisen

js-app-player-play-waterfall = Spela upp vattenfallsreprisen

js-app-player-position = Position i reprisen

js-app-player-position-mission = Position i uppdragsreprisen

js-app-player-position-orbit = Position i banreprisen

js-app-player-position-waterfall = Position i vattenfallsreprisen

js-app-png-button-title = Bitmapp med hög upplösning för bildspel och dokument

js-app-png-export-failed = PNG-exporten misslyckades: { $reason }

js-app-py-note = Installera med { $command }.

js-app-ran-locally = Kördes lokalt kl. { $time }, körning { $n }.

js-app-ran-locally-took = Kördes lokalt kl. { $time }, körning { $n }, { $took } s.

js-app-receiver-at = Mottagare vid t =

js-app-recorded-edit-notice = WebAssembly är blockerat på den här sidan, så sidan visar verkliga körningar av de medföljande scenarierna, registrerade med motor v{ $version }. Ändrade scenarier, svep och nya exporter kräver den levande motorn: öppna kshana.dev eller servera den här mappen lokalt. Återställ återför det registrerade scenariot.

js-app-recorded-intro = WebAssembly är blockerat på den här sidan, så sidan visar verkliga körningar av de medföljande scenarierna, registrerade med motor v{ $version }. Redigering, svep och nya exporter kräver den levande motorn på kshana.dev.

js-app-recorded-shown-native = Registrerad körning visas kl. { $time } (inbyggd motor).

js-app-recorded-shown-needs = Registrerad körning visas kl. { $time } (kräver motor { $need }).

js-app-recorded-shown-run = Registrerad körning visas kl. { $time }, körning { $n }.

js-app-recorded-shown-took = Registrerad körning visas kl. { $time }, körning { $n }, { $took } s.

js-app-recorded-with-commit = Det du ser är körningen registrerad med en motorbyggnad vid commit { $commit }, visad oförändrad; den körs inte om här.

js-app-recorded-with-engine = Det du ser är körningen registrerad med motor v{ $version }, visad oförändrad; den körs inte om här.

js-app-recording-edited-warning = Du har ändrat scenariot: den här inspelningen avser den medföljande filen, inte din ändring. Kör kommandot på din egen fil för att få din.

js-app-replay = Repris

js-app-report-downloaded = Rapporten har laddats ned.

js-app-report-frame-title = Körningsrapport skriven av motorn

js-app-report-html = Rapport (HTML)

js-app-report-html-title = Rapportfilen, så som motorn skrev den

js-app-report-load-failed = Den registrerade rapporten kunde inte läsas in ({ $reason }).

js-app-report-loading = Läser in den registrerade rapporten…

js-app-report-none = Det finns ingen registrerad rapport för det här scenariot.

js-app-report-note = Varje körning från kommandoraden skriver en rapport: sammanfattning, indata, resultat, diagrammet, vad som är kontrollerat och vad som är modellerat, samt en reproducerbarhetspost. Webbläsarversionen har inte den skrivaren, så det här är rapporten som den inbyggda kommandoradsmotorn skrev för det medföljande scenariot. Studions egen rapport om körningen på skärmen finns under Exporter.

js-app-report-open-tab = Öppna i en ny flik

js-app-report-open-tab-title = Öppna rapporten för sig

js-app-report-orbit-title = Bana (jordcentrerad tröghet, ortografisk)

js-app-report-stability-short = Klockstabilitet

js-app-report-stability-title = Klockstabilitet (Allan-deviation)

js-app-run-again = Kör igen

js-app-run-cancelled = Körningen avbröts.

js-app-run-cancelled-previous = Körningen avbröts. Det föregående resultatet visas fortfarande.

js-app-run-failed = Körningen misslyckades. Se meddelandet bland resultaten.

js-app-run-when-ready = Kör när motorn är redo

js-app-run-will-run = Körs när motorn är redo

js-app-run-with-settings = Kör med de här inställningarna

js-app-search-more-matches =
    { $n ->
        [one] { $n } träff till: lägg till ett ord för att begränsa.
       *[other] { $n } träffar till: lägg till ett ord för att begränsa dem.
    }

js-app-search-nothing = Inget matchar ”{ $query }”. Prova ett ord som jamming, klocka, månen, bana, mask eller PDOP.

js-app-search-scenarios = Scenarier ({ $n })

js-app-search-settings =
    { $n ->
        [one] Inställningar med namn som liknar ”{ $query }”: i { $n } scenario
       *[other] Inställningar med namn som liknar ”{ $query }”: i { $n } scenarier
    }

js-app-search-settings-hint = Var och en öppnar scenariot med den inställningen markerad, redo att ändras.

js-app-share-copied = Delningslänken har kopierats. Den innehåller det exakta scenariot.

js-app-share-in-address-bar = Länken placerades i adressfältet.

js-app-share-link-sub = Det körs exakt så som det delades.

js-app-share-link-title = Ett scenario som öppnats från en delningslänk

js-app-shared-scenario = Delat scenario

js-app-shown-unchanged = Visas oförändrad.

js-app-solar-note = Varje prick är en kropp vid körningens epok och varje kurva är det banspår som motorn beräknade för den. En streckad linje är en länk som scenariot begär. Välj en planet för att se dess månar runt den.

js-app-solar-which-bodies = Vilka kroppar som ska ritas

js-app-source-live = Levande resultat · motor v{ $version }

js-app-source-native = Registrerat resultat, inbyggd motor · v{ $version }

js-app-source-recorded = Registrerat resultat · v{ $version }

js-app-source-recorded-loading = Registrerat resultat · v{ $version } · motorn läses in

js-app-spectrum-row-note = Spektrumet längs den vattenfallsrad som reprisen befinner sig på.

js-app-spectrum-row-title = Spektrum längs den visade raden

js-app-spectrum-which-part = Vilken del av spektrumet

js-app-status-last-run-took = Den senaste körningen tog { $ms } ms i din webbläsare. Ingenting laddas upp.

js-app-status-loading-kept = Motorn läses fortfarande in. Dina ändringar sparas och körs så snart den är redo.

js-app-status-loading-recorded = Motorn läses fortfarande in. Resultatet ovan är en registrerad körning.

js-app-status-not-run-yet = Dina ändringar har inte körts än.

js-app-status-runs-in-browser = Körs i din webbläsare. Ingenting laddas upp.

js-app-status-wasm-blocked = WebAssembly är blockerat här, så det här visar registrerade körningar av de medföljande scenarierna.

js-app-stepper-decrease = Minska { $key }

js-app-stepper-increase = Öka { $key }

js-app-subtabs-label = Brickor i den här vyn (telefon)

js-app-svg-button-title = Vektordiagram med titel och proveniens

js-app-sweep-cancelled = Svepet avbröts.

js-app-sweep-done-1d =
    { $total ->
        [one] Svepade { $done } av { $total } körning lokalt på { $duration }.
       *[other] Svepade { $done } av { $total } körningar lokalt på { $duration }.
    }

js-app-sweep-done-2d =
    { $total ->
        [one] Svepade { $total } körning ({ $a } × { $b }) lokalt på { $duration }.
       *[other] Svepade { $total } körningar ({ $a } × { $b }) lokalt på { $duration }.
    }

js-app-sweep-enter-range = Ange ett numeriskt intervall.

js-app-sweep-enter-range-2 = Ange ett numeriskt intervall för den andra parametern.

js-app-sweep-failed = Svepet misslyckades: { $reason }

js-app-sweep-interrupted = Svepet avbröts av en ny körning.

js-app-sweep-needs-live = Ett svep kör motorn många gånger, så det kräver den levande motorn.

js-app-sweep-none-line = Ingen (linjediagram)

js-app-sweep-nothing = Inget att svepa för det här scenariot.

js-app-sweep-progress = Svepar körning { $n } av { $total }…

js-app-sweep-status-done =
    { $total ->
        [one] Svepade { $total } körning kl. { $time }.
       *[other] Svepade { $total } körningar kl. { $time }.
    }

js-app-sweep-title-1d = { $metric } mot { $knob }

js-app-sweep-title-2d = { $metric } över { $knob1 } och { $knob2 }

js-app-sweep-wait = Vänta tills den pågående körningen är klar och svep sedan.

js-app-tab-animation = Animation

js-app-tab-compare = Jämför

js-app-tab-exports = Exporter och rapport

js-app-tab-ground = Markspår

js-app-tab-holdover = Holdover

js-app-tab-json = JSON

js-app-tab-masks = Tidsmasker

js-app-tab-orbit = 3D-bana

js-app-tab-overview = Översikt

js-app-tab-report = Motorrapport

js-app-tab-signal = Signal och band

js-app-tab-stability = Stabilitet

js-app-tab-sweep = Svep

js-app-tab-timeseries = Tidsserie

js-app-th-at-tau = Vid τ eller tid

js-app-th-body = Kropp

js-app-th-clock = Klocka

js-app-th-figure = Tal

js-app-th-file = Fil

js-app-th-format = Format

js-app-th-key-figure = Nyckeltal

js-app-th-light-time = Enkelriktad ljustid från { $observer }

js-app-th-limit = Gräns

js-app-th-margin = Marginal

js-app-th-mask-or-budget = Mask eller budget

js-app-th-metric = Mått

js-app-th-metric-2 = Mått

js-app-th-orbital-period = Omloppstid

js-app-th-provenance = Proveniens

js-app-th-size = Storlek

js-app-th-source = Källa

js-app-th-sun-distance = Avstånd från solen

js-app-th-tier = Nivå

js-app-th-unit = Enhet

js-app-th-value = Värde

js-app-th-value-2 = Värde

js-app-th-value-3 = Värde

js-app-th-verdict = Utfall

js-app-th-what-it-is = Vad det är

js-app-the-body = kroppen

js-app-the-chain = Kedjan

js-app-the-observer = observatören

js-app-tile-browse-all = Bläddra bland alla { $n } scenarier

js-app-tile-browse-sub = Sök på namn, fråga eller inställning

js-app-tile-preview-label = Registrerad förhandsvisning från { $source }: { $title }

js-app-tile-scenario-count =
    { $n ->
        [one] { $n } scenario
       *[other] { $n } scenarier
    }

js-app-timeline-chart-title = Uppdragstidslinje: { $title }

js-app-timeline-note = En skrubber styr varje diagram nedan. Varje fas kör vanliga scenarier; kampanjen läser deras utdata till ett enda tidsrutnät. Skuggade band är faserna, lodräta linjer händelserna. Värdena ovan är kampanjens kanaler vid repristiden.

js-app-toast-copied = Kopierat.

js-app-toast-copy-blocked = Kopiering är blockerad här.

js-app-toast-copy-blocked-select = Kopiering är blockerad här: markera texten i stället.

js-app-toast-json-copied = JSON har kopierats.

js-app-toast-loading-run = Motorn läses fortfarande in. Din körning startar så snart den är redo.

js-app-toast-no-scenario = Det finns inget scenario som heter { $name } här. Det här är de närmaste träffarna.

js-app-toast-not-single-number = Den inställningen är inte ett enskilt tal i det här scenariot: redigera den i scenariofilen.

js-app-toast-one-pinned = En körning är fäst. Ändra en inställning, kör igen och fäst den körningen för att jämföra de två.

js-app-toast-opened-advanced = Öppnat med de inställningar du ändrade i den avancerade vyn.

js-app-toast-opened-at = Öppnat vid { $label }. Ändra det och kör sedan igen.

js-app-toast-scenario-copied = Scenariot har kopierats.

js-app-tour-answer-body = En enkel mening som läses ur resultatet, och varifrån resultatet kommer: en levande körning i din webbläsare, eller en körning registrerad med samma motor.

js-app-tour-answer-title = Svaret först

js-app-tour-back = Tillbaka

js-app-tour-done = Klar

js-app-tour-eyebrow = Guidad rundtur

js-app-tour-figures-body = Varje kort läses ur motorns resultatdokument.

js-app-tour-figures-title = Talen som besvarar det

js-app-tour-how-body = Metoden, evidensnivån och referenserna.

js-app-tour-how-title = Hur det här beräknas

js-app-tour-next = Nästa

js-app-tour-research-body = Kommandoraden och Python för att köra det själv, data och figurer, och hur du citerar det.

js-app-tour-research-title = För forskare

js-app-tour-search-body = ⌘K hittar alla scenarier, områden, inställningar, vyer eller kommandon.

js-app-tour-search-title = Sök

js-app-tour-settings-body = De fem inställningar som betyder mest för den här frågan. Ändra en och kör sedan igen. Motorn körs i din webbläsare; ingenting laddas upp.

js-app-tour-settings-title = Prova andra inställningar

js-app-tour-skip = Hoppa över

js-app-tour-views-body = Diagram, kartor, repriser, motorns egen rapport och exporter. [ och ] växlar mellan vyer.

js-app-tour-views-title = Varje vy av körningen

js-app-tracking-threshold = Spårningströskel

js-app-transport-hint = en skrubber styr varje panel i den här körningen

js-app-transport-label = Repris: en skrubber styr varje panel i den här körningen

js-app-unpin-run = Lossa körning { $id }

js-app-waterfall = Vattenfall

js-app-waterfall-hint = effektspektraltäthet: frekvens i sidled, tid nedåt

js-app-waterfall-note = Färgen är effekt över mottagarens brusgolv. Navigeringssignalerna ligger under det golvet, så det som lyser upp är störsändarna. Spela upp reprisen eller dra i den, så visar banden till höger vad mottagaren fortfarande spårar vid det ögonblicket.

js-app-waterfall-title = Vattenfall, { $name }

js-app-webassembly-unavailable = WebAssembly är inte tillgängligt

js-app-written-by-native = Skriven av den inbyggda kommandoradsmotorn v{ $version } ({ $platform }) med

js-cat-acm-link-question = Vilket DVB-S2-läge håller länken längs varje passage, och hur mycket data för passagen över? (modellerad)

js-cat-acm-link-title = Satellitnedlänk med adaptiv kodning

js-cat-aocs-slew-mekf-question = När regulatorn matas av ett attitydfilter och ett gyro med bias, hur står sig svängningen mot fallet med det sanna tillståndet? (modellerad)

js-cat-aocs-slew-mekf-title = Sväng på en attityduppskattning

js-cat-aocs-slew-question = Lugnar återkopplingslagen en sväng med stor vinkel med fyra hjul, och hur hårt arbetar hjulen? (reglerslingan är kontrollerad; rymdfarkosten är illustrativ)

js-cat-aocs-slew-title = Sväng med reaktionshjul

js-cat-aperture-duty-cycle-question = När en apertur tjänar både navigering och kommunikation, vilket avbrott kostar det? (modellerad)

js-cat-aperture-duty-cycle-title = Aperturens driftcykel

js-cat-araim-gps-galileo-question = Med GPS + Galileo och feghypotesen för hela konstellationen, hur tillgänglig är avancerad RAIM?

js-cat-araim-gps-galileo-title = ARAIM med två konstellationer

js-cat-araim-reference-check-question = Hamnar motorns skyddsnivåer på de publicerade räkneexemplen från Working Group C?

js-cat-araim-reference-check-title = Referenskontroll av ARAIM

js-cat-ascent-losses-question = Hur mycket av en tvåstegsraketens ideala hastighetsökning tar gravitation, luftmotstånd, styrning och mottryck? (modellerad)

js-cat-ascent-losses-title = Förluster under uppskjutningens stigning

js-cat-attitude-budget-question = Vilket är det värsta fallets störmoment och pekfelsbudget?

js-cat-attitude-budget-title = Pekbudget

js-cat-automotive-urban-canyon-question = Håller sig en bil inom en budget på en halv filbredd genom en underfart och en störsändare vid vägkanten? (modellerad)

js-cat-automotive-urban-canyon-title = Bil genom en stadskanjon

js-cat-campaign-jam-spoof-holdover-integrity-question = Vad händer med en mottagare genom jamming, spoofing, GNSS-förlust, ett integritetslarm och återhämtning, på en tidslinje? (modellerad)

js-cat-campaign-jam-spoof-holdover-integrity-title = Kedjat uppdrag: jamming, spoofing, holdover, larm

js-cat-campaign-monte-carlo-clock-holdover-question = Över många körningar med fast frö, stämmer en fritt gående klockas tidsfel med dess spridning i sluten form?

js-cat-campaign-monte-carlo-clock-holdover-title = Monte Carlo-holdover för klocka

js-cat-campaign-optimize-link-budget-question = Över avstånd och datatakt, var lämnar en X-bandslänk exakt 3 dB marginal?

js-cat-campaign-optimize-link-budget-title = Optimera en länkbudget

js-cat-campaign-shared-jammer-sea-road-question = Under en störsändare, vilken plattform förlorar sin positionsbestämning: fartyget 30 km bort eller bilen 50 km bort? (modellerad)

js-cat-campaign-shared-jammer-sea-road-title = En störsändare, ett fartyg och en bil

js-cat-campaign-spectrum-holdover-integrity-question = En störsändare tar två L-bandssignaler, klockan går i holdover och mottagaren faller tillbaka på enbart Galileo: håller integritetsövervakningen fortfarande? (modellerad)

js-cat-campaign-spectrum-holdover-integrity-title = Spektrumdrivet uppdrag

js-cat-campaign-sweep-jammer-power-question = När en störsändare 1 km bort skruvas upp från 10 nW till 10 W, när förlorar mottagaren sin positionsbestämning? (modellerad)

js-cat-campaign-sweep-jammer-power-title = Svep av störsändarens effekt

js-cat-cislunar-arc-recovery-question = Återskapar en oberoende minsta kvadrat-skattare verkligen tillståndet från den båglängd som rangtestet förutsäger? (modellerad; långsam — cirka 15 s i en webbläsare)

js-cat-cislunar-arc-recovery-title = Återskapande av cislunar båge

js-cat-cislunar-observability-question = Hur stor del av en cislunar rymdfarkosts tillstånd gör en inbördes båge mellan satelliter observerbar?

js-cat-cislunar-observability-title = Cislunar observerbarhet

js-cat-clock-ensemble-question = Över många brusdragningar, inom vilket konfidensband hamnar holdover?

js-cat-clock-ensemble-title = Holdover-ensemble för klocka

js-cat-clock-holdover-labsr-question = Hur står sig en optisk strontiumklocka av laboratoriekvalitet mot en atomklocka i chipformat i holdover?

js-cat-clock-holdover-labsr-title = Klock-holdover, optisk laboratorieklocka

js-cat-clock-holdover-question = Hur länge kan en klocka hålla tiden efter att GNSS fallit bort?

js-cat-clock-holdover-title = Klock-holdover

js-cat-combined-altpnt-question = Vad vinner man på att fusionera tre skalära kartkanaler jämfört med någon enskild?

js-cat-combined-altpnt-title = Kombinerad alt-PNT

js-cat-conflict-resilience-question = Hur försämras en skiktad PNT-arkitektur under hot i form av jamming / spoofing / kinetiska / cyberhot? (modellerad)

js-cat-conflict-resilience-title = Konfliktresiliens

js-cat-constellation-multi-gnss-coverage-question = Med de fyra globala systemen tillsammans, hur många satelliter är synliga och hur bra är geometrin, överallt på jorden? (modellerad)

js-cat-constellation-multi-gnss-coverage-title = Fyra GNSS-konstellationer, en karta

js-cat-contact-schedule-question = För tre satelliter och tre stationer under 12 timmar, vilka passager behåller en konfliktfri plan, och hur mycket data för den över? (modellerad)

js-cat-contact-schedule-title = Plan för markkontakter

js-cat-domain-campaigns-label = Kampanjer

js-cat-domain-campaigns-line = Kedjade uppdrag, svep och Monte Carlo-körningar på en klocka.

js-cat-domain-constellations-label = Konstellationsutformning

js-cat-domain-constellations-line = Utforma en konstellation och kartlägg dess täckning och PDOP (positionsutspädning av precision).

js-cat-domain-deepspace-label = Månen, cislunart och Mars

js-cat-domain-deepspace-line = Navigering och tid vid månen, i det cislunara rymden och vid Mars.

js-cat-domain-integrity-label = Integritet och positionering

js-cat-domain-integrity-line = Positionsbestämningar och om de går att lita på: RAIM (mottagarens autonoma integritetsövervakning) och dess avancerade form, ARAIM.

js-cat-domain-interference-label = Jamming och störning

js-cat-domain-interference-line = Störsändare mot mottagare för satellitnavigering: vad som förloras och när.

js-cat-domain-leo-label = Navigering i låg omloppsbana runt jorden (LEO)

js-cat-domain-leo-line = Navigeringssignaler, passager, meddelanden och positionsbestämningar i låg omloppsbana runt jorden.

js-cat-domain-leo-missions-label = LEO-uppdrag och studier

js-cat-domain-leo-missions-line = Studier och tjänster byggda på ett lager i låg omloppsbana runt jorden.

js-cat-domain-navigation-label = Tröghetsnavigering och alternativ navigering

js-cat-domain-navigation-line = Tröghets-, terräng-, gravitations- och annan navigering utan satelliter.

js-cat-domain-orbits-label = Banor och GNSS-geometri

js-cat-domain-orbits-line = Banpropagering, efemerider och navigeringssatelliternas geometri.

js-cat-domain-solar-label = Solsystemet

js-cat-domain-solar-line = Varje planet och måne vid en epok, med ljustider.

js-cat-domain-spaceops-label = Uppdragsanalys och rymdoperationer

js-cat-domain-spaceops-line = Passager, uppskjutningsfönster, återinträde, länk- och attitydbudgetar.

js-cat-domain-spectrum-label = Spektrum

js-cat-domain-spectrum-line = Vattenfall över radiobandet: störsändare, signaler och vad mottagaren spårar.

js-cat-domain-spoofing-label = Spoofing och signalsäkerhet

js-cat-domain-spoofing-line = Falska signaler och meaconing, och de övervakare som fångar dem.

js-cat-domain-studies-label = Kvant, avvägningsstudier och interoperabilitet

js-cat-domain-studies-line = Kvantsensorer, avvägningsstudier och format för interoperabilitet.

js-cat-domain-timing-label = Klockor och tidssynkronisering

js-cat-domain-timing-line = Klockor utan satelliter: holdover, stabilitet, telekommasker, tidsöverföring.

js-cat-earth-gnss-lunar-question = Kan en mottagare nära månen höra jordens GNSS, och räcker det någonsin för en positionsbestämning? (modellerad)

js-cat-earth-gnss-lunar-title = Jordens GNSS vid månen

js-cat-entry-heating-stardust-question = Återger inträdesmodellen den publicerade högsta retardationen för Stardusts kapsel för provåterföring?

js-cat-entry-heating-stardust-title = Inträde för Stardust-kapseln

js-cat-eo-coverage-question = Vilken svepbredd, markupplösning och återbesökstid ger en EO-bana?

js-cat-eo-coverage-title = EO-täckning

js-cat-eo-radiometry-question = För en liten jordobservationskamera, vilket signal-brusförhållande, vilken MTF vid Nyquist och vilken NIIRS ger en scen med 15 % reflektans? (modellerad)

js-cat-eo-radiometry-title = Radiometri och bildkvalitet för en bildsensor

js-cat-ephemeris-question = Var är satelliten, och när passerar den rakt över?

js-cat-ephemeris-title = Markspår

js-cat-europa-surface-pnt-question = Kan en landare på Jupiters måne Europa positioneras från en liten konstellation av reläer och ett avstånd från jorden? (modellerad)

js-cat-europa-surface-pnt-title = Landare på Europa

js-cat-fusion-pnt-coupled-question = Med ett staplat Kalmanfilter över position, klocka och accelerometerbias, hur klarar navigatören ett GNSS-avbrott? (modellerad)

js-cat-fusion-pnt-coupled-title = Kopplad navigatör med sensorfusion

js-cat-fusion-pnt-question = Vad vinner man på en enda gemensam skattare över klocka + position?

js-cat-fusion-pnt-title = Sensorfusion

js-cat-gnss-ins-aviation-question = Genom ett två minuter långt GNSS-bortfall som omfattar en lutande sväng, hur långt driver en tätt kopplad INS av navigeringsklass eller taktisk klass? (modellerad)

js-cat-gnss-ins-aviation-title = Flygplanssväng genom ett GNSS-gap

js-cat-gnss-ins-maritime-question = Efter ett fem minuter långt GNSS-bortfall på ett fartyg som slingrar, hur långt driver en INS av navigeringsklass eller taktisk klass? (modellerad)

js-cat-gnss-ins-maritime-title = Fartyg som slingrar genom ett GNSS-bortfall

js-cat-gnss-ins-question = Hur väl glider en stödd tröghetsnavigator genom ett GNSS-bortfall?

js-cat-gnss-ins-rail-question = Genom en djup skärning med två satelliter och sedan en tunnel, hur långt driver en tätt kopplad INS? (modellerad)

js-cat-gnss-ins-rail-title = Tåg genom en skärning och en tunnel

js-cat-gnss-ins-title = GNSS/INS-fusion

js-cat-gnss-sim-container-terminal-skyline-question = Med kranar mot sjösidan och containerstaplar mot landsidan, hur många satelliter finns kvar, och vad händer med RAIM-skyddet? (modellerad; representativ skyline)

js-cat-gnss-sim-container-terminal-skyline-title = Portalbil vid en containerkaj

js-cat-gnss-sim-raim-question = Hur formar jonosfären och troposfären råa pseudoavstånd, och skyddar RAIM fortfarande?

js-cat-gnss-sim-raim-title = GNSS-mätningar

js-cat-gnss-ssv-formation-heo-question = Hur väl känner ett filter den relativa positionen för två rymdfarkoster en kilometer från varandra, jämfört med att ta differensen mellan deras absoluta positionsbestämningar? (modellerad; en körning registrerad med den inbyggda motorn)

js-cat-gnss-ssv-formation-heo-title = Relativ navigering i formation, mycket elliptisk bana

js-cat-gnss-ssv-heo-question = Vad hör en mycket elliptisk bana längs sin väg: signaler i sikte, bästa C/N0, huvudlob mot sidolob, DOP och strykande signaler? (modellerad; en körning registrerad med den inbyggda motorn)

js-cat-gnss-ssv-heo-title = GNSS-signaler i en mycket elliptisk bana

js-cat-gnss-ssv-lunar-weak-question = Vad kan en mottagare som är utformad för de svagaste signalerna använda på väg till månen? (modellerad; en körning registrerad med den inbyggda motorn)

js-cat-gnss-ssv-lunar-weak-title = GNSS-signaler på en månövergång, mottagare för svaga signaler

js-cat-gnss-ssv-nav-lunar-question = Hur väl håller ett filter ombord en månövergång, mot den gräns det anger? (modellerad; en körning registrerad med den inbyggda motorn)

js-cat-gnss-ssv-nav-lunar-title = GNSS-filter ombord på en månövergång

js-cat-gnss-ssv-shell-question = Hur ofta hör en rymdfarkost på geostationär höjd minst en, och minst fyra, navigeringssignaler, per konstellation och band? (modellerad; en körning registrerad med den inbyggda motorn)

js-cat-gnss-ssv-shell-title = GNSS-signaler ovanför satelliterna: ett skal på 36 000 km

js-cat-gps-denied-gravity-nav-egm2008-question = På det verkliga gravitationsfältet EGM2008 till grad 70, kan kartmatchning hålla ett spår utan GPS? (modellerad)

js-cat-gps-denied-gravity-nav-egm2008-title = Gravitationsnavigering på det verkliga fältet

js-cat-gps-denied-gravity-nav-question = Hur långt driver positionen under en hel timme utan GNSS — och kan en gravitationskarta hålla den i schack?

js-cat-gps-denied-gravity-nav-title = GNSS-fri navigering

js-cat-gravity-map-error-mc-question = När den lagrade gravitationskartan blir brusigare, hur ofta håller kartmatchning fortfarande en positionsbestämning utan GPS inom sitt mål? (modellerad)

js-cat-gravity-map-error-mc-title = Monte Carlo av fel i gravitationskarta

js-cat-gravity-map-nav-question = Kan en kallatomsgravimeter hålla positionen utan GNSS genom att matcha gravitationsfältet den flyger genom?

js-cat-gravity-map-nav-title = Navigering med gravitationskarta

js-cat-holdover-test-example-question = Dra ut antennen, poängsätt holdover: en registrering delad vid de två tidpunkter som operatören anger, varje steg mätt mot de ITU-T-masker som skrivits för det. (modellerad; registreringen är påhittad för exemplet)

js-cat-holdover-test-example-title = Holdover-test: en tidsfelsregistrering mot maskerna

js-cat-holdover-test-ptp4l-question = Samma fyra steg lästa ur en ptp4l-servologg: hur långt håller sig demonens egen avvikelse från maskerna medan GNSS är borta? (modellerad; loggen är påhittad för exemplet)

js-cat-holdover-test-ptp4l-title = Holdover-test: en linuxptp-logg

js-cat-hybrid-optical-rf-question = Vilken kontinuitet och integritet ger en kombination av optisk PNT och RF-PNT? (modellerad)

js-cat-hybrid-optical-rf-title = Hybrid av optisk och RF

js-cat-hybrid-pnt-question = Vad ger en kombinerad svit av klocka + tröghet?

js-cat-hybrid-pnt-title = Hybrid-PNT

js-cat-hybrid-ukf-question = Är det tätt kopplade UKF-filtret med 17 tillstånd självkonsistent (NEES + innovationsvithet)? En kontroll av självkonsistens, inte ett påstående om noggrannhet.

js-cat-hybrid-ukf-title = Hybrid-UKF med 17 tillstånd

js-cat-impairment-eval-question = Hur väl skiljer en detektor jamming / spoofing / flervägsutbredning från nominellt? (modellerad ROC/AUC)

js-cat-impairment-eval-title = Utvärdering av RF-störningar

js-cat-imu-deadreckoning-question = Hur långt driver positionen när den glider på enbart en IMU?

js-cat-imu-deadreckoning-title = Tröghetsbaserad dödräkning

js-cat-ins-trn-coast-question = Hur långt driver positionen under ett navigeringsavbrott, och när passerar den 10 m och 50 m? (modellerad)

js-cat-ins-trn-coast-title = INS/TRN-glidning

js-cat-integrity-harbour-approach-question = Med kajbyggnader och en vågbrytare som döljer låga satelliter, håller GPS och Galileo ARAIM-skyddet inom larmgränserna? (modellerad; representativ skyline)

js-cat-integrity-harbour-approach-title = ARAIM vid inlöpning i hamn

js-cat-integrity-raim-question = Uppfyller geometrin larmgränserna (HPL / VPL)?

js-cat-integrity-raim-title = RAIM-integritet

js-cat-jamming-demo-question = Vid vilket förhållande mellan störsändare och signal tappar mottagaren låsningen?

js-cat-jamming-demo-title = Jamming

js-cat-jamming-harbour-approach-skyline-question = Under en störsändare på 2 W vid land, hur många satelliter behåller ett fartyg, och hur många döljer själva kajen? (modellerad; representativ skyline)

js-cat-jamming-harbour-approach-skyline-title = Fartyg som störs vid inlöpning i hamn

js-cat-l-band-waterfall-jamming-question = Hur ser hela GNSS L-bandet ut medan en chirp-, en ton- och en brusstörsändare slås på, och vilka signaler tar var och en bort? (modellerad)

js-cat-l-band-waterfall-jamming-title = L-bandets vattenfall under jamming

js-cat-launch-window-question = Vilken uppskjutningsazimut och vilket dogleg-Δv når en målinklination från en plats?

js-cat-launch-window-title = Uppskjutningsfönster

js-cat-leo-band-trade-question = Vad vinner och förlorar en navigeringssignal i låg bana i varje band, från ultrahög frekvens (UHF) till C-band? (representativa utformningar)

js-cat-leo-band-trade-title = Bandavvägning, UHF till C-band

js-cat-leo-doppler-positioning-question = Hur bra är en positionsbestämning av tio minuters Doppler från en navigeringskonstellation i låg bana? (modellerad)

js-cat-leo-doppler-positioning-title = Positionering enbart med Doppler

js-cat-leo-focus-data-services-question = Vad kostar varje extra datatjänst i bitar i navigeringsmeddelandet? (modellerad)

js-cat-leo-focus-data-services-title = Tjänstedata mot ramlängd

js-cat-leo-focus-fused-pnt-sisre-question = Hur bra måste signal-i-rymden-avståndsfelet i låg bana vara innan lagret i låg bana hjälper en fuserad positionsbestämning? (modellerad)

js-cat-leo-focus-fused-pnt-sisre-title = Fuserad positionsbestämning mot ban- och klockfel

js-cat-leo-focus-indoor-uhf-question = Vilket band når fortfarande en användare inne i en traditionell och en termiskt effektiv byggnad? (modellerad)

js-cat-leo-focus-indoor-uhf-title = Mottagning inomhus per band och byggnad

js-cat-leo-focus-iot-eirp-question = Hur mycket sändeffekt från satelliten behöver en batteritagg för att hålla? (modellerad)

js-cat-leo-focus-iot-eirp-title = Spårarens energi mot sändeffekt

js-cat-leo-focus-ntn-bandwidth-question = Hur sjunker positioneringsfelet när referenssignalen breddas från 180 kHz till 20 MHz? (modellerad)

js-cat-leo-focus-ntn-bandwidth-title = Positionering med 5G-nedlänk mot bandbredd

js-cat-leo-focus-ppp-altitude-question = Förkortar ett lägre eller ett högre lager i låg bana konvergensen mer? (modellerad; långsam, ungefär en minut i en webbläsare)

js-cat-leo-focus-ppp-altitude-title = Precis positionering mot lagrets höjd

js-cat-leo-focus-science-iono-sounding-question = Hur väl mäter fördröjningsskillnaden mellan två band elektroninnehållet under en satellit i låg bana? (modellerad)

js-cat-leo-focus-science-iono-sounding-title = Jonosfärsondering från två band

js-cat-leo-indoor-uhf-question = Varför når en UHF-bärvåg in i en byggnad när L-, S- och C-banden har svårt? (modellerad)

js-cat-leo-indoor-uhf-title = Inomhus på UHF

js-cat-leo-iot-energy-question = Hur mycket energi går åt för en batteritagg vid varje positionsbestämning från en signal i låg bana? (modellerad)

js-cat-leo-iot-energy-title = Energi per positionsbestämning för en spårare

js-cat-leo-navmsg-encode-decode-question = Vad kostar kvantiseringen av varje fält, och överlever ramen kodning, avkodning och en skadad bit? (modellerad)

js-cat-leo-navmsg-encode-decode-title = Navigeringsmeddelande: binär ram

js-cat-leo-navmsg-fit-interval-trade-question = Hur länge kan ett enda utsänt meddelande täcka innan dess banfel överstiger målet? (modellerad; långsam, ungefär 30 s i en webbläsare)

js-cat-leo-navmsg-fit-interval-trade-title = Navigeringsmeddelande: anpassningsintervall

js-cat-leo-navmsg-midpass-update-question = När en satellit byter till ett nytt meddelande mitt i en passage, ser användaren ett hopp? (modellerad)

js-cat-leo-navmsg-midpass-update-title = Navigeringsmeddelande: uppdatering mitt i passagen

js-cat-leo-navmsg-model-comparison-question = Vilken efemeridmodell representerar en låg bana bäst, och hur står den sig mot en publicerad tabell? (modellerad)

js-cat-leo-navmsg-model-comparison-title = Navigeringsmeddelande: fyra modeller

js-cat-leo-pass-iridium-question = Vilken signalstyrka och vilken Doppler ser ett trafikflygplan över en Iridium-passage? (modellerad)

js-cat-leo-pass-iridium-title = Iridium-skurar från ett flygplan

js-cat-leo-pass-vs-gnss-cn0-question = Hur står sig signalstyrkan för en passage i låg bana mot de Galileo-satelliter som är i sikte? (modellerad)

js-cat-leo-pass-vs-gnss-cn0-title = En passage mot GNSS

js-cat-leo-pass-xona-pulsar-question = Hur ser signalerna X1 och X5 ut över en passage, för ett fartyg i Biscayabukten? (modellerad)

js-cat-leo-pass-xona-pulsar-title = Passage med Xona Pulsar

js-cat-leo-pnt-end-to-end-question = Från signalutformning till den slutliga positionsbestämningen, vad lämnar varje steg över till nästa? (modellerad)

js-cat-leo-pnt-end-to-end-title = Från början till slut, generisk konstellation

js-cat-leo-pnt-mega-shell-question = Vilken täckning och geometri ger en navigeringskonstellation med 5 000 satelliter i låg omloppsbana runt jorden? (modellerad; en exempelutformning)

js-cat-leo-pnt-mega-shell-title = Utformning med 5 000 satelliter i låg bana

js-cat-leo-ppp-convergence-question = Hur mycket snabbare konvergerar precis punktpositionering (PPP) när ett lager i låg bana läggs till? (modellerad; långsam, ungefär 30 s i en webbläsare)

js-cat-leo-ppp-convergence-title = Konvergens för precis positionering

js-cat-leo-pvt-fjord-skyline-question = Där fjordväggarna lämnar en remsa himmel längs rännan, hur mycket tillför ett lager i låg bana till GPS och Galileo? (modellerad; representativ skyline)

js-cat-leo-pvt-fjord-skyline-title = Färja djupt inne i en fjord

js-cat-leo-resilience-gnss-jammed-leo-carries-question = När GNSS störs, kan ett lager i låg bana i andra band behålla positionsbestämningen och dess integritet? (modellerad)

js-cat-leo-resilience-gnss-jammed-leo-carries-title = GNSS störs, låg bana fortsätter

js-cat-leo-resilience-js-margin-question = Hur mycket mer jamming överlever en starkare signal i låg bana än en GNSS-signal från medelhög bana? (modellerad)

js-cat-leo-resilience-js-margin-title = Störsändarmarginal från mottagen effekt

js-cat-leo-resilience-multiband-diversity-question = När en L-bandsstörsändare skruvas upp, vilka av fyra band fortsätter att spåra? (modellerad)

js-cat-leo-resilience-multiband-diversity-title = Banddiversitet under en bredbandig störsändare

js-cat-leo-resilience-spoof-doppler-question = När en spoofer flyttar den beräknade positionen 30 m, hur snabbt fångar en kontroll av Doppler och passagegeometri det? (modellerad)

js-cat-leo-resilience-spoof-doppler-title = Spoofing fångad med Doppler

js-cat-leo-resilience-spoof-monitors-question = Vilken övervakare ser vilken sorts spoofer? (modellerad)

js-cat-leo-resilience-spoof-monitors-title = Övervakare av spoofing mot fyra spoofers

js-cat-leo-timing-utc-question = Hur nära kan en mottagare återskapa koordinerad universell tid (UTC) från satelliter i låg bana, per oscillator och signalnivå? (modellerad)

js-cat-leo-timing-utc-title = Tidsöverföring till UTC

js-cat-leo-vertical-5g-network-timing-question = När GNSS förloras i ett dygn, håller tid från låg bana en basstation inom sin tidsgräns? (modellerad)

js-cat-leo-vertical-5g-network-timing-title = Tidssynkronisering för 5G-basstation

js-cat-leo-vertical-asset-tracking-iot-question = Längs en containers resa, vad kostar varje positionsbestämning en batteritagg? (modellerad)

js-cat-leo-vertical-asset-tracking-iot-title = Spårning av container

js-cat-leo-vertical-autonomous-vehicle-question = När byggnader döljer de låga satelliterna, håller ett lager i låg bana en bil inom ett fel på filnivå? (modellerad)

js-cat-leo-vertical-autonomous-vehicle-skyline-question = Modellerad som en verklig gata i stället för en platt avskärning vid 35°, håller ett lager i låg bana fortfarande en bil inom ett fel på filnivå? (modellerad; representativ skyline)

js-cat-leo-vertical-autonomous-vehicle-skyline-title = Fordon i en gata, inte en platt avskärning

js-cat-leo-vertical-autonomous-vehicle-title = Fordon i en stadskanjon

js-cat-leo-vertical-critical-infrastructure-timing-question = När GNSS förloras, håller tid från låg bana en krafttransformatorstations synkronisering? (modellerad)

js-cat-leo-vertical-critical-infrastructure-timing-title = Tidssynkronisering för transformatorstation

js-cat-leo-vertical-polar-arctic-question = Från Tromsø till nordpolen, vad tillför ett polärt lager i låg bana till GNSS? (modellerad)

js-cat-leo-vertical-polar-arctic-title = Resa i Arktis

js-cat-leo-vertical-rail-maritime-question = När de medföljande scenarierna för fartyg och tåg förlorar GNSS, når en passage i låg bana dem fortfarande? (modellerad)

js-cat-leo-vertical-rail-maritime-title = Järnväg och sjöfart med ett lager i låg bana

js-cat-link-budget-question = Sluter sig den enkelriktade länken med marginal vid det givna avståndet och den givna datatakten?

js-cat-link-budget-title = Länkbudget

js-cat-lunanet-araim-question = Uppfyller en gles uppsättning månreläer integritetsgränserna för en mottagare i Artemis-regionen?

js-cat-lunanet-araim-title = Integritet på månen

js-cat-lunar-attack-surface-question = Vad krävs för att spoofa eller blockera en mottagare på månytan, och vilken autentiseringsbudget svarar mot det? (modellerad)

js-cat-lunar-attack-surface-title = Angreppsyta på månen
