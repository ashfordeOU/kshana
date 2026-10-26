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

js-cat-lunar-beacon-question = Hur mycket minskar en handfull inmätta fyrar på ytan DOP vid sydpolen? (modellerad)

js-cat-lunar-beacon-title = Fyrar på månytan

js-cat-lunar-differential-pnt-question = Hur mycket tar differentialkorrektion bort av gemensamt fel mot baslinje på månen? (modellerad)

js-cat-lunar-differential-pnt-title = Differentiell PNT på månen

js-cat-lunar-frame-campaign-question = Vilken datumnoggrannhet ger en observationskampanj jämfört med en injicerad transformation? (modellerad)

js-cat-lunar-frame-campaign-title = Kampanj för månens referenssystem

js-cat-lunar-frame-realisation-question = Kan en Helmert-datumanpassning återskapa en transformation för månens referenssystem? (modellerad)

js-cat-lunar-frame-realisation-title = Månens referenssystem

js-cat-lunar-infrastructure-carrier-phase-question = Kan en markstation och en omloppsbana tillsammans fastställa heltalsosäkerheterna i bärvågsfasen för jordens GNSS-signaler? Den snabba exempelkörningen. (modellerad; en körning registrerad med den inbyggda motorn)

js-cat-lunar-infrastructure-carrier-phase-title = Bärvågsfas på månen: markstation och omloppsbana

js-cat-lunar-infrastructure-frame-coestimation-question = Hur mycket mer information tillför avstånd mellan omloppsbana och markstation till de sju parametrarna i månens datum? (modellerad; en körning registrerad med den inbyggda motorn)

js-cat-lunar-infrastructure-frame-coestimation-title = Samskattning av månens referenssystem med länkar till omloppsbanan

js-cat-lunar-infrastructure-geodesy-sensitivity-question = Hur känsliga är laseravstånd, banspårning, en gravimeter och en klocka på ytan för h2, k2, l2 och librationen? (modellerad; en körning registrerad med den inbyggda motorn)

js-cat-lunar-infrastructure-geodesy-sensitivity-title = Känslighet för Love-tal och libration på månen

js-cat-lunar-infrastructure-od-consistency-model-error-question = Samma jämförelse med en liten omodellerad acceleration injicerad: märker konsekvenskontrollen det? (modellerad; en körning registrerad med den inbyggda motorn)

js-cat-lunar-infrastructure-od-consistency-model-error-title = Banbestämning på månen, med ett injicerat modellfel

js-cat-lunar-infrastructure-od-consistency-question = Stämmer banbestämning ombord med jordens GNSS i en månhalobana och oberoende radiometrisk banbestämning från marken överens inom sina angivna osäkerheter? (modellerad; en körning registrerad med den inbyggda motorn)

js-cat-lunar-infrastructure-od-consistency-title = Banbestämning på månen: GNSS ombord mot spårning från marken

js-cat-lunar-infrastructure-space-tie-question = Hur exakt kan förskjutningarna mellan tre tekniker knytas ihop, mot felet i den lokala knytningen? (modellerad; en körning registrerad med den inbyggda motorn)

js-cat-lunar-infrastructure-space-tie-title = Rymdknytning: GNSS, VLBI och laseravstånd på en rymdfarkost

js-cat-lunar-interop-export-question = Kan månens referenssystem / tid / efemerid gå tur och retur genom CCSDS OEM + ett KIF-kuvert?

js-cat-lunar-interop-export-title = Interoperabilitetsexport för månen

js-cat-lunar-jamming-question = Hur långt bort kan en störsändare stå och ändå blockera en mottagare på månytan? (modellerad)

js-cat-lunar-jamming-title = Jamming på månen

js-cat-lunar-joint-od-clock-question = Gör en VLBI-knytning med jordbaslinje att en månstations absoluta position blir observerbar? (modellerad)

js-cat-lunar-joint-od-clock-title = Gemensam banbestämning och klocka på månen

js-cat-lunar-llr-datum-question = Hur ser månens datum ut när kampanjen är verkliga arkiverade laseravstånd till månen (LLR)? (modellerad; en körning registrerad med den inbyggda motorn)

js-cat-lunar-llr-datum-title = Datum från laseravstånd till månen

js-cat-lunar-relay-constellation-question = Vilken täckning ger en konstellation av reläer och navigering i frusna och låga månbanor över hela månen? (modellerad; en exempelutformning)

js-cat-lunar-relay-constellation-title = Reläkonstellation för månen

js-cat-lunar-station-coverage-public-sources-question = Med enbart de offentligt angivna antagandena, vilket korrigerat fel ger stationen över sydpolen? Resultatet domineras av banelementen, som inte är offentliga och är satta som ILLUSTRATIVA; det här är indata till den frusna prediktionen. (modellerad; inget påstående om något verkligt system)

js-cat-lunar-station-coverage-public-sources-title = Referensstation på månen, offentliga antaganden

js-cat-lunar-station-coverage-question = Över sydpolsregionen och ett dygn, vilket korrigerat fel ger en referensstation på månen, och hur långt från den håller täckningen? (modellerad; inget påstående om något verkligt system)

js-cat-lunar-station-coverage-terrain-question = Med varje platss horisont strålföljd över en verklig höjdmodell av månen, hur mycket täckning förlorar stationen på grund av terrängen? (modellerad)

js-cat-lunar-station-coverage-terrain-title = Månstation med verklig terräng

js-cat-lunar-station-coverage-title = Täckning för referensstation på månen

js-cat-lunar-station-geodesy-baseline-question = Hur väl fastlåser dagens fem retroreflektorfält månens datum på ett verkligt schema, innan någon station läggs till? Baslinjen för ett par. (modellerad; en körning registrerad med den inbyggda motorn)

js-cat-lunar-station-geodesy-baseline-title = Geodesi med månstation: enbart de fem fälten

js-cat-lunar-station-geodesy-with-station-question = Samma arkiverade schema med en tillagd reflektor och VLBI-fyr vid sydpolen: hur mycket skärps gränsen för datumet? (modellerad, illustrativ plats; en körning registrerad med den inbyggda motorn)

js-cat-lunar-station-geodesy-with-station-title = Geodesi med månstation: med en station vid sydpolen

js-cat-lunar-station-time-lab-question = Efter att en stations miniatyrrubidiumklocka senast styrts mot månens tid, hur länge håller den sig inom 1, 10 och 100 ns, och vilken felterm som dominerar? (modellerad)

js-cat-lunar-station-time-lab-title = Tidslaboratorium för månstation

js-cat-lunar-time-budget-question = Hur stor är koordinattidsskillnaden mellan jorden och månen, och dess felbudget? (modellerad)

js-cat-lunar-time-budget-title = Tidsbudget för månen

js-cat-lunar-time-offset-question = Hur snabbt glider en månklocka isär från jordens tid (~56–59 µs/dygn)?

js-cat-lunar-time-offset-title = Tidsförskjutning på månen

js-cat-lunar-vlbi-fim-question = Vilken noggrannhet i stationskoordinater ger ett givet VLBI-spårningsschema i själva verket? (modellerad)

js-cat-lunar-vlbi-fim-title = VLBI-information för månen

js-cat-lunar-vlbi-question = Vilken fördröjning ser ett VLBI-par med jordbaslinje för en fyr på månytan? (modellerad)

js-cat-lunar-vlbi-title = VLBI på månen

js-cat-maritime-port-approach-coast-question = Vid inlöpning i hamn utan GNSS, när lämnar en INS av navigeringsklass hamn- och havsbudgetarna? (modellerad)

js-cat-maritime-port-approach-coast-title = Hamninlöpning på tröghet

js-cat-maritime-spoof-position-push-question = När en spoofer drar ett fartygs positionsbestämning 500 m, vilka detekteringslager fångar det? (modellerad)

js-cat-maritime-spoof-position-push-title = Fartygets position spooffad

js-cat-maritime-strait-jamming-question = Över 30 km öppet vatten, tar en störsändare på 50 W bort ett fartygs GNSS? (modellerad)

js-cat-maritime-strait-jamming-title = Fartyg som störs i ett sund

js-cat-mars-orbit-pnt-question = Hur väl positioneras en omloppsfarkost i låg bana runt Mars från tolv navigeringsreläer, och vad tillför ett avstånd från jorden? (modellerad)

js-cat-mars-orbit-pnt-title = Omloppsfarkost vid Mars med reläer och en länk till jorden

js-cat-mars-pnt-lmo-question = Kan en MARCONI-reläkonstellation navigera en användare vid Mars? (kovarians-FoM, inte en certifierad PL)

js-cat-mars-pnt-lmo-title = PNT vid Mars, låg bana

js-cat-mars-pnt-surface-question = Hur väl kan en landare eller rover på den roterande Marsytan navigeras mot reläkonstellationen?

js-cat-mars-pnt-surface-title = PNT vid Mars, ytan

js-cat-mars-pnt-transfer-question = Hur väl navigeras ett fordon på en hög, excentrisk anflygnings- eller infångningsbåge vid Mars?

js-cat-mars-pnt-transfer-title = PNT vid Mars, överföring

js-cat-meo-leo-fused-pvt-question = Vad gör ett lager i låg bana, lagt till GPS och Galileo, med positionsfelet och geometrin? (modellerad)

js-cat-meo-leo-fused-pvt-title = Fuserad positionsbestämning med GNSS och låg bana

js-cat-moonlight-service-volume-question = Vilken DOP, täckning och integritet ger en konstellation av klassen Moonlight/LCNS vid sydpolen? (modellerad)

js-cat-moonlight-service-volume-title = Tjänstevolym på månen

js-cat-multi-band-jamming-waterfall-question = Med navigeringssignaler fördelade över fyra band, vad lämnar en störsändare byggd för ett band kvar? (modellerad)

js-cat-multi-band-jamming-waterfall-title = Vattenfall för flerbandig jamming

js-cat-notinbrowser-elevation-model = Kräver utsnittet av månens höjdmodell ({ $path }) som levereras med arkivet, inte med webbläsarversionen.

js-cat-notinbrowser-laser-ranging-data = Kräver det arkiverade utsnittet av laseravståndsdata som levereras med arkivet, inte med webbläsarversionen.

js-cat-notinbrowser-study-suite = En studiesvit, inte ett enskilt scenario. Kör den med kommandoradsverktyget: { $command }.

js-cat-ntn-5g-positioning-question = Hur exakt kan en handenhet positionera sig själv från en nedlänk i ett icke-terrestert 5G-nät, per signalbandbredd? (modellerad)

js-cat-ntn-5g-positioning-title = Positionering med 5G-satellitnedlänk

js-cat-oem-interop-question = Kan en OEM-efemerid från GMAT / Orekit / STK importeras och gå tur och retur?

js-cat-oem-interop-title = CCSDS OEM-brygga

js-cat-optical-atmosphere-network-question = Hur ofta är en optisk tidslänk uppe genom moln och turbulens, och vad tillför extra markplatser? (modellerad; illustrativa molnklimat)

js-cat-optical-atmosphere-network-title = Optisk länk genom atmosfären, tre platser

js-cat-optical-atmosphere-techniques-question = Vad tillför en större apertur, en annan våglängd eller adaptiv optik för en optisk upplänk i moln och turbulens? (modellerad; illustrativt molnklimat)

js-cat-optical-atmosphere-techniques-title = Tekniker för optiska länkar

js-cat-orbit-gnss-challenged-question = När är en positionsbestämning ens möjlig utifrån satellitgeometrin?

js-cat-orbit-gnss-challenged-title = GNSS-tillgänglighet

js-cat-orbit-molniya-question = Kan en användare i en mycket excentrisk Molniya-bana fortfarande se tillräckligt många GNSS-satelliter nära apogeum?

js-cat-orbit-molniya-title = Molniya-användare

js-cat-orbit-multignss-question = Hur mycket höjer GPS + Galileo tillsammans tillgängligheten och förbättrar positionsutspädningen?

js-cat-orbit-multignss-title = Multi-GNSS-tillgänglighet

js-cat-orbit-real-tle-question = Vilken täckning ger en verklig konstellation, given som tvåradiga elementsatser?

js-cat-orbit-real-tle-title = Verkliga tvåradiga element

js-cat-orbit-rinex-question = Vilken tillgänglighet ger en verklig utsänd RINEX 3-efemerid?

js-cat-orbit-rinex-title = Utsänd efemerid

js-cat-orbit-sgp4-gps-question = Hur propagerar en verklig GPS-liknande konstellation under ett dygn?

js-cat-orbit-sgp4-gps-title = SGP4-banor

js-cat-orbit-urban-canyon-skyline-question = Längst ned i en stadsgata, hur stor del av dygnet ger GPS och Galileo fyra satelliter, och vad gör himmelsremsan med PDOP? (modellerad; representativ skyline)

js-cat-orbit-urban-canyon-skyline-title = Tillgänglighet i en stadsgata

js-cat-passes-question = När går en satellit upp och ned över en station, och hur länge?

js-cat-passes-title = Markpassager

js-cat-polar-arctic-leo-coverage-question = Från ekvatorn till polen, hur ändras satelliter i sikte och geometri med enbart GNSS, enbart ett polärt lager i låg bana, och båda? (modellerad)

js-cat-polar-arctic-leo-coverage-title = Från ekvator till pol

js-cat-pvt-abmf-question = Kan en verklig mottagarposition lösas ur råa RINEX-mätningar?

js-cat-pvt-abmf-title = Positionering (SPP)

js-cat-quantum-anomaly-detect-question = Hur väl upptäcks fel i kvantsystem vid en fast falsklarmsfrekvens? (modellerad)

js-cat-quantum-anomaly-detect-title = Detektering av kvantanomalier

js-cat-quantum-cai-coast-question = Hur länge håller en kallatomsinterferometer, specificerad av sin fysik, dödräkningen inom 100 m efter att GNSS förlorats, mot en kvartsaccelerometer av navigeringsklass? (modellerad)

js-cat-quantum-cai-coast-title = Glidning med kvantaccelerometer

js-cat-quantum-gnss-free-nav-question = Hur långt glider en kallatomsnavigatör jämfört med en INS av navigeringsklass utan GNSS? (modellerad)

js-cat-quantum-gnss-free-nav-title = GNSS-fri kvantnavigering

js-cat-quantum-pnt-demonstrator-suite-question = De tre kvanttillämpningsområdena som en studie (en studiesvit för kommandoraden: kshana --study).

js-cat-quantum-pnt-demonstrator-suite-title = Demonstratorstudie för kvant-PNT

js-cat-quantum-time-transfer-question = Vad ger betrodd kvanttidsöverföring jämfört med en klassisk CSAC + RF-kedja? (modellerad)

js-cat-quantum-time-transfer-title = Kvanttidsöverföring

js-cat-quantum-trade-question = Vilken holdover för tid / tröghet ger en kandidatklocka jämfört med en klassisk baslinje? (modellerad)

js-cat-quantum-trade-title = Avvägning för kvant-PNT

js-cat-rail-tunnel-coast-question = Vid 160 km/h genom en tunnel, hur snart lämnar en INS av taktisk klass sin budget? (modellerad)

js-cat-rail-tunnel-coast-title = Tåg genom en tunnel

js-cat-realtime-frame-eop-question = Hur stort fel i referenssystemet ger jordorientering i realtid (predikterad)? (modellerad)

js-cat-realtime-frame-eop-title = Referenssystem/EOP i realtid

js-cat-reentry-question = Vilken högsta g-belastning och vilken hastighet vid högsta uppvärmning ser ett ballistiskt återinträde?

js-cat-reentry-title = Återinträdeskorridor

js-cat-slot-timing-ocxo-leo-question = Hur länge håller sig en ugnsstyrd kristalloscillator på en småsatellit i låg bana inom sin tidsluckas skyddsmarginal efter den senaste GNSS-positionsbestämningen? (modellerad)

js-cat-slot-timing-ocxo-leo-title = Tidsluckors synkronisering

js-cat-small-uas-jammed-nav-question = Efter att en störsändare tagit bort GNSS, hur långt driver en tröghetsenhet av flygkontrollerklass, mot en av taktisk klass?

js-cat-small-uas-jammed-nav-title = Liten drönare under jamming

js-cat-solar-system-tour-question = Var finns varje kropp som motorn känner till, från solen till Pluto och de stora månarna, och hur lång tid tar det för ljuset mellan dem?

js-cat-solar-system-tour-title = Solsystemet vid en epok

js-cat-space-packet-question = Kodas och avkodas en CCSDS 133.0-paketström bitexakt?

js-cat-space-packet-title = Space Packet

js-cat-space-weather-question = Hur ändrar sol- / geomagnetisk aktivitet densiteten i termosfären? (modellerad)

js-cat-space-weather-title = Rymdväder

js-cat-spoof-attack-question = Fångas en tidsspoofing med ramp innan den når specifikationen?

js-cat-spoof-attack-title = Detektering av spoofing

js-cat-spoof-detect-question = Kan en fuserad övervakare av RF + mätningar fånga en samordnad spoofing?

js-cat-spoof-detect-title = Flerskiktsdetektering av spoofing

js-cat-spoof-meaconing-question = Med en uttrycklig attackform, hur ofta fångar en klockstödd energidetektor spoofingen vid en fast falsklarmsfrekvens?

js-cat-spoof-meaconing-title = Statistik för spoofingdetektor

js-cat-starlink-sop-doppler-positioning-question = Hur väl kan en mottagare positionera sig själv utifrån Doppler från en bredbandskonstellation som inte sänder något navigeringsmeddelande? (modellerad)

js-cat-starlink-sop-doppler-positioning-title = Bredbandssignaler vid tillfälle

js-cat-sweep-clock-stability-question = Hur ändras holdover när en klockparameter sveps?

js-cat-sweep-clock-stability-title = Parametersvep

js-cat-sweep-nd-inertial-question = Hur varierar ett nyckeltal över ett rutnät med flera parametrar?

js-cat-sweep-nd-inertial-title = N-D-svep

js-cat-telecom-prtc-holdover-24h-question = Håller sig en rubidiumreferens som förlorar GNSS i 24 timmar inom ITU-T-maskerna för tidsfel? (modellerad)

js-cat-telecom-prtc-holdover-24h-title = Telekom-holdover, 24 h

js-cat-telecom-synce-eec-question = Håller sig en fritt gående ugnsstyrd oscillator inom maskerna för vandring hos utrustningsklockan i synkron Ethernet? (modellerad)

js-cat-telecom-synce-eec-title = Frekvenssynkronisering mot SyncE-masker

js-cat-telecom-tie-ingest-question = Klarar en registrering av tidsintervallfel ITU-T-maskerna för MTIE och TDEV?

js-cat-telecom-tie-ingest-title = Kontroll av telekommask, dina data

js-cat-terrain-nav-question = Kan en höjdmätare rätta INS-drift genom att matcha en terränghöjdprofil?

js-cat-terrain-nav-title = Terrängnavigering

js-cat-terrain-slam-question = Kan ett partikelfilter följa en tidsvarierande INS-drift mot en terrängkarta?

js-cat-terrain-slam-title = Terräng-SLAM

js-cat-time-transfer-budget-question = Vad gör termer för station, transponder, jonosfär och Sagnac med en dubbelriktad tidsförskjutning, och vad är dess osäkerhetsbudget? (modellerad)

js-cat-time-transfer-budget-title = Dubbelriktad tidsöverföring via satellit

js-cat-timetransfer-question = Hur tätt kan två platser hållas synkroniserade över en länk?

js-cat-timetransfer-title = Tidsöverföring

js-cat-tracking-loop-question = Vid vilket C/N0 tappar en mottagare faktiskt låsningen, och kan en spoofer dra över slingorna? (modellerad)

js-cat-tracking-loop-title = Spårningsslinga

js-cat-xona-pulsar-end-to-end-question = Samma kedja på offentliga siffror för Xona Pulsar: signal, passage, meddelande, fuserad positionsbestämning och precis positionering. (modellerad)

js-cat-xona-pulsar-end-to-end-title = Från början till slut, Xona Pulsar

js-cat-xona-pulsar-signals-question = Hur exakt kan en mottagare mäta avstånd på de publicerade signalerna X1 och X5, och hur stor är förvärvssökningen? (offentlig signaltabell)

js-cat-xona-pulsar-signals-title = Signaler från Xona Pulsar

js-geo-a-place = En plats…

js-geo-axis-east = Ö +{ $ext } m

js-geo-axis-north = N +{ $ext } m

js-geo-canyon-needs = Gatukanjonsformen kräver motor 0.36.

js-geo-canyon-out-of-range = Värdena för gatukanjonen är utanför intervallet (azimut 0 till 359.9°, bredd 1 till 200 m, höjder 0 till 500 m, antenn 0 till 50 m); en öppen horisont används.

js-geo-canyon-reduced = Motorns reducering av kanjonen till en tabell med 360 fack.

js-geo-compute-failed = Motorn kunde inte beräkna den här himlen: { $reason }

js-geo-computing = Beräknar…

js-geo-copy-link = Kopiera den här länken: { $url }

js-geo-count-below = Under horisonten

js-geo-count-hidden = Dolda av skylinen

js-geo-count-in-view = I sikte

js-geo-count-open-sky = Öppen himmel

js-geo-count-used = I lösningen

js-geo-cursor-live = Azimut { $az }°, skyline { $el }°.

js-geo-dated-sky = En daterad himmel är bara så bra som elementen och deras ålder; förinställningarna är utelämnade.

js-geo-dop-geometric = geometrisk

js-geo-dop-geometric-title = geometrisk utspädning av precision

js-geo-dop-horizontal = horisontell

js-geo-dop-horizontal-title = horisontell utspädning av precision

js-geo-dop-position = position, 3D

js-geo-dop-position-title = position, 3D-utspädning av precision

js-geo-dop-time = tid

js-geo-dop-time-title = tidsutspädning av precision

js-geo-dop-vertical = vertikal

js-geo-dop-vertical-title = vertikal utspädning av precision

js-geo-east = Ö

js-geo-engine-not-running = Motorn körs inte i den här webbläsaren ({ $reason }).

js-geo-err-geometry-object = motorns geometrisvar är inte ett objekt

js-geo-err-mc-object = motorns Monte Carlo-svar är inte ett objekt

js-geo-err-no-sentences = motorns svar har inga meningar

js-geo-err-reply-kind-not-json = motorns svar av typen { $what } var inte JSON

js-geo-err-reply-not-json = motorns svar var inte JSON

js-geo-error-line = Med σ_UERE = { $uere } m, under den angivna felmodellen (motorns tal): { $bits }.

js-geo-error-line-needs = Positionsfel ≈ σ_UERE × HDOP horisontellt och σ_UERE × VDOP vertikalt; talet kräver motor 0.36.

js-geo-error-rms-3d = 3D-RMS σ_UERE × PDOP = { $m } m

js-geo-error-rms-h = horisontell RMS σ_UERE × HDOP = { $m } m

js-geo-error-sigma = 1-sigma-fel öst { $east } m, nord { $north } m

js-geo-fact-ellipse-1s = Ellips, 1-sigma

js-geo-fact-ellipse-1s-value = { $major } m × { $minor } m, långaxel { $deg }° från norr

js-geo-fact-ellipse-pct = Ellips, { $pct } %

js-geo-fact-ellipse-pct-scaled = { $major } m × { $minor } m (1-sigma × { $k })

js-geo-fact-ellipse-pct-value = { $major } m × { $minor } m

js-geo-fact-inside = Inom 95 %-ellipsen

js-geo-fact-inside-value = { $pct } % av punkterna

js-geo-fact-line = { $key }: { $value }.

js-geo-fact-mc = Monte Carlo

js-geo-fact-mc-value =
    { $n ->
        [one] { $n } minstakvadratlösning, frö { $seed }
       *[other] { $n } minstakvadratlösningar, frö { $seed }
    }

js-geo-fact-rms-3d = Molnets RMS, 3D

js-geo-fact-rms-3d-beside = { $rms } m, jämfört med σ_UERE × PDOP = { $predicted } m

js-geo-fact-rms-h = Molnets RMS, horisontell

js-geo-fact-rms-h-beside = { $rms } m, jämfört med σ_UERE × HDOP = { $predicted } m

js-geo-fact-rms-value = { $rms } m

js-geo-gj-not-geojson = { $name }: inte GeoJSON (en FeatureCollection, Feature eller geometri förväntades).

js-geo-gj-not-json = { $name }: inte JSON ({ $reason }).

js-geo-gj-not-object = { $name }: inte ett GeoJSON-objekt.

js-geo-gj-too-many = { $name }: { $count } objekt; den här sidan ritar högst { $max }.

js-geo-legend-item = { $label }: { $used } av { $total } i lösningen

js-geo-link-copied = Länken har kopierats.

js-geo-link-copied-no-tle = Länken har kopierats (utan dina inklistrade element: en länk öppnar förinställningarna).

js-geo-mc-off = Av

js-geo-missing-ellipse = felellipsen

js-geo-missing-gdop = GDOP

js-geo-missing-leo = LEO

js-geo-missing-monte-carlo = Monte Carlo-molnet

js-geo-missing-open-sky = andelen öppen himmel

js-geo-missing-skyline = skylinen

js-geo-missing-tdop = TDOP

js-geo-needs = kräver motor 0.36

js-geo-needs-cap = Kräver motor 0.36

js-geo-no = Nej

js-geo-no-ellipse = Ingen ellips

js-geo-no-sats = Inga satelliter att visa.

js-geo-north = N

js-geo-not-given = inte angiven

js-geo-note-elements-skipped =
    { $count ->
        [one] { $count } elementsats hoppades över: { $list }.
       *[other] { $count } elementsatser hoppades över: { $list }.
    }

js-geo-note-latitude-limited = Det här motorbygget modellerar platser inom 89° från ekvatorn; latituden begränsades till det.

js-geo-note-leo-left-out = LEO: kräver motor 0.36; utelämnad.

js-geo-note-no-engine = Motorn körs inte i den här webbläsaren, så det finns inget att visa. Den körs som WebAssembly; en webbläsare eller värd som blockerar WebAssembly kan inte köra den här vyn.

js-geo-note-pick-one = Välj minst ett av GPS, Galileo och BeiDou.

js-geo-note-skyline-not-applied = Skylinen är ritad men inte tillämpad: att tillämpa den kräver motor 0.36. Satelliter bakom den räknas fortfarande här.

js-geo-note-skyline-source = Skyline: { $source }.

js-geo-note-training-model = Motor { $version } övningshimmelmodell (nmea_training) vid { $instant }: vinklar i hela grader och DOP med en decimal, så som mottagarmeddelanden bär dem; positionsbestämningen använder högst 12 satelliter, valda efter signalstyrka.

js-geo-note-unknown-systems =
    { $count ->
        [one] { $count } satellitpost för ett system som den här vyn inte ritar utelämnades.
       *[other] { $count } satellitposter för system som den här vyn inte ritar utelämnades.
    }

js-geo-off-leo = LEO: kräver motor 0.36.

js-geo-off-monte-carlo = Monte Carlo-molnet kräver motor 0.36.

js-geo-off-skyline = Att tillämpa en skyline kräver motor 0.36: här ritas den bara.

js-geo-offset-own = Förskjutning från dina elements epok ({ $epoch })

js-geo-offset-ref = Förskjutning från konstellationernas referensepok

js-geo-open-sky-share = { $pct } % av den övre halvsfären

js-geo-out-of-range = Utanför intervallet, så värdet behålls vid det senaste goda: { $names }.

js-geo-own-elements-at = Dina egna element vid { $epoch }.

js-geo-pick-constellation = Välj minst en konstellation.

js-geo-place-geiranger = Geirangerfjorden, Norge

js-geo-place-manhattan = Midtown Manhattan, USA

js-geo-place-oslo = Oslo hamn, Norge

js-geo-place-rotterdam = Rotterdams hamn, Nederländerna

js-geo-place-singapore = Singaporesundet

js-geo-place-tallinn = Tallinns hamn, Estland

js-geo-place-tromso = Tromsø, Norge

js-geo-plot-desc =
    { $total ->
        [one] { $total } satellit i diagrammet, { $used } i lösningen.
       *[other] { $total } satelliter i diagrammet, { $used } i lösningen.
    }

js-geo-preset-illustrative = Illustrativ kontur ritad av den här sidan; att tillämpa en skyline kräver motor 0.36.

js-geo-ready = Klar.

js-geo-ready-needs = Klar. Kräver motor 0.36: { $list }.

js-geo-sat-masked = { $label } { $id }: azimut { $az }°, elevation { $el }°, dold av skylinen

js-geo-sat-unused = { $label } { $id }: azimut { $az }°, elevation { $el }°, används inte

js-geo-sat-used = { $label } { $id }: azimut { $az }°, elevation { $el }°, i lösningen

js-geo-scenarios-under = Motorns scenarier under den här skylinen:

js-geo-sky-canyon = Gatukanjon

js-geo-sky-drawn = Ritad på skyplotten

js-geo-sky-open = Öppen horisont

js-geo-sky-preset = Förinställning: { $name }

js-geo-sky-source = Himmel: { $source }.

js-geo-skyline-city-street = Stadsgata

js-geo-skyline-container = Containerterminal

js-geo-skyline-fjord = Fjord

js-geo-skyline-harbour = Hamninlöpning

js-geo-skyline-load-failed = Skylinen kunde inte läsas in ({ $reason }).

js-geo-skyplot-downloaded = Skyplotten har laddats ned.

js-geo-skyplot-export-failed = Skyplotten kunde inte exporteras ({ $reason }).

js-geo-source-geometry = Kshana-motor { $version }, sky_geometry

js-geo-source-line = { $source }.

js-geo-source-training = Kshana-motor { $version }, övningshimmelmodell

js-geo-south = S

js-geo-style-own-elements = Dina element

js-geo-svg-refused = motorns SVG avvisades

js-geo-table-count =
    { $n ->
        [one] { $n } satellit, samma som i skyplotten.
       *[other] { $n } satelliter, samma som i skyplotten.
    }

js-geo-tle-epoch = Ange en UTC-epok från 2000 till 2099.

js-geo-tle-paste-first = Klistra först in en eller flera tvåradiga elementsatser.

js-geo-tle-too-large = De inklistrade elementen är större än 4 MiB, motorns gräns för indata.

js-geo-used-masked = Nej: dold av skylinen

js-geo-using-own = Använder dina egna element. En länk bär bara att du använde dem, inte själva elementen.

js-geo-wasm-blocked = WebAssembly är blockerat

js-geo-west = V

js-geo-why = Varför

js-geo-why-interim = Felellipsen och Monte Carlo-molnet kräver motor 0.36 (dess funktioner sky_geometry och sky_monte_carlo); motorn på den här sidan är äldre.

js-geo-why-no-ellipse = Motorn gav ingen ellips för den här geometrin (för få satelliter för en positionsbestämning, eller en singulär geometri).

js-geo-why-no-ellipse-reason = Motorn gav ingen ellips för den här geometrin (för få satelliter för en positionsbestämning, eller en singulär geometri): { $reason }.

js-geo-why-waiting = Väntar på motorn.

js-geo-yes = Ja

js-hold-axis-seconds = sekunder från det första samplet

js-hold-axis-tau = observationstid τ, s (log)

js-hold-axis-te = tidsfel, ns

js-hold-band-title = Återhämtningsband ±{ $band } ns

js-hold-blurb-example = Sampel var 5:e s: 600 s låst, GNSS borttaget vid 600 s, holdover, GNSS återställt vid 2400 s. Registreringen är genererad för exemplet; den är ingen mätning.

js-hold-blurb-ptp4l = Samma fyra steg lästa ur en ptp4l-servologg (demonens egen avvikelse, i ns). Loggen är skriven för exemplet; ingen demon kördes.

js-hold-budget-exceeded = { $name } överskreds första gången { $s } s efter borttagningen

js-hold-chip-baseline = Baslinje mot sina masker

js-hold-chip-envelope = ePRTC-A-kuvert för holdover

js-hold-chip-holdover = Holdover mot sina masker

js-hold-chip-measured = uppmätt mot masken

js-hold-chip-recovery = Återhämtning

js-hold-chip-words = Ord

js-hold-curve-title = { $step }: { $which }, ns

js-hold-curves-aria = { $which } mot observationstid, med maskgränserna

js-hold-envelope-exceeded = ePRTC-A-kuvertet för holdover överskreds första gången { $s } s efter borttagningen

js-hold-envelope-exceeded-short = { $verdict }, överskreds första gången { $s } s efter borttagningen (registreringen är kortare än kuvertets period)

js-hold-envelope-exceeded-value = { $verdict }, överskreds första gången { $s } s efter borttagningen

js-hold-envelope-short = { $verdict } (registreringen är kortare än kuvertets period)

js-hold-file-error = { $name }: { $error }.

js-hold-file-not-json = { $name }: inte JSON.

js-hold-file-read-here = { $name }, läst här; ingenting laddades upp.

js-hold-file-too-large = { $name } är större än vad den här sidan läser.

js-hold-from-record = resultatets registrering

js-hold-from-record-decimated = resultatets registrering, decimerad till { $have } av { $total } sampel

js-hold-gnss-removed = GNSS borttaget

js-hold-gnss-removed-stated = GNSS borttaget (angivet av operatören)

js-hold-gnss-restored = GNSS återställt

js-hold-gnss-restored-stated = GNSS återställt (angivet av operatören)

js-hold-largest-at = { $value } vid T+{ $time } s

js-hold-limit-label = ±{ $ns } ns { $step }-mask

js-hold-limit-title = { $id }: ±{ $ns } ns, det största absoluta tidsfelet i steget { $step }

js-hold-mark-title = { $id } gräns { $limit } ns vid τ { $tau } s ({ $verdict }; { $source })

js-hold-marker-time = { $name }, T+{ $time } s

js-hold-na = saknas

js-hold-no-curve = Ingen tidsfelskurva: registreringen kunde inte återskapas för ritning.

js-hold-no-which-curve = Ingen { $which }-kurva i det här resultatet.

js-hold-not-exceeded = inte överskriden

js-hold-not-recovered = höll sig inte inom bandet

js-hold-not-result = det här är inte ett resultat av ett holdover-test

js-hold-open-failed = { $title } kunde inte öppnas: { $reason }.

js-hold-opening = Öppnar { $title }…

js-hold-phase-baseline = Baslinje: låst

js-hold-phase-holdover = Holdover: GNSS borttaget

js-hold-phase-recovery = Återhämtning: GNSS återställt

js-hold-phase-title = { $phase }, T+{ $from } s till { $to } s

js-hold-read-failed = Kunde inte läsas eller ritas ({ $reason }).

js-hold-recorded = { $title }: motorns registrerade resultat (version { $version }).

js-hold-recovered = inom ±{ $band } ns i { $dwell } s, { $after } s efter att GNSS återkom

js-hold-result-not-json = resultatet är inte JSON ({ $reason })

js-hold-result-not-loaded = det registrerade resultatet lästes inte in

js-hold-row-envelope = ePRTC-A-kuvert för holdover

js-hold-row-frequency = Bibehållen frekvensförskjutning (anpassad lutning)

js-hold-row-largest = Största absoluta tidsfel

js-hold-row-length = Holdover-längd

js-hold-row-margin = Minsta marginal inom kuvertet

js-hold-row-peak = Topp efter återställningen

js-hold-row-recovery = Återhämtning

js-hold-row-recovery-step = Största steg under återhämtningen

js-hold-row-residual = Residual kring den linjen (rms)

js-hold-row-step = Steg vid borttagningsögonblicket

js-hold-status-final = { $status } { $label }; uppmätt mot masken.

js-hold-step-span = T+{ $from } till { $to } s

js-hold-te-aria = Tidsfel över registreringen, med faserna och maskgränserna

js-hold-te-line-title = Tidsfel, ns

js-hold-te-note = Tidsfel från { $from }. De två tiderna angavs av { $by }.

js-hold-th-budget = Budget

js-hold-th-budget-limit = Gräns |TE|, ns

js-hold-th-first-exceeded = Först överskriden efter borttagning, s

js-hold-th-largest = Största |TE|, ns

js-hold-th-limit = Gräns, ns

js-hold-th-margin = Marginal, ns

js-hold-th-mask = Mask

js-hold-th-mean = Medelvärde, ns

js-hold-th-measured-on = Uppmätt på

js-hold-th-metric = Mått

js-hold-th-rms = RMS, ns

js-hold-th-samples = Sampel

js-hold-th-source = Källa

js-hold-th-span = Spann

js-hold-th-step = Steg

js-hold-th-value = Värde, ns

js-hold-th-verdict = Utfall

js-hold-th-worst-at = Sämst vid τ eller T+, s

js-hold-title-example = En tidsfelsregistrering

js-hold-title-ptp4l = En linuxptp-logg

js-hold-why-no-samples = resultatet innehåller inga tidsfelssampel (record.series), så ingen kurva ritas

js-hold-why-not-series = serien i resultatet är ingen tidsserie (färre än två sampel, eller tiden ökar inte), så ingen kurva ritas

js-hold-why-sentence = { $why }.

js-hold-why-too-many = serien i resultatet har { $have } sampel där motorn poängsatte { $scored }, så ingen kurva ritas

js-interf-attribution = Tillskrivning

js-interf-build-failed = { $name }: kunde inte byggas ({ $reason }).

js-interf-built-day-maps =
    { $n ->
        [one] Byggde { $n } dagskarta från { $name } med motor { $version }, i den här webbläsaren.
       *[other] Byggde { $n } dagskartor från { $name } med motor { $version }, i den här webbläsaren.
    }

js-interf-built-detail = { $date }: { $published } rutor publicerade, { $flagged } flaggade

js-interf-built-from-sample = Byggd från det syntetiska { $kind }-urvalet med motorn, i den här webbläsaren. Påhittade rapporter; inget verkligt flygplan, fartyg eller dygn.

js-interf-built-maps =
    { $n ->
        [one] Byggde { $n } karta ({ $detail }). Endast aggregat: en flaggad ruta pekar inte ut störning som orsak.
       *[other] Byggde { $n } kartor ({ $detail }). Endast aggregat: en flaggad ruta pekar inte ut störning som orsak.
    }

js-interf-built-none = { $name }: motorn byggde ingen karta.

js-interf-caveat-coverage = Täckningen följer datakällan; läs täckningsanmärkningarna.

js-interf-caveat-no-colour = En ruta utan färg observerades inte. Det är inget belägg för att området var fritt.

js-interf-caveat-not-finding = En försämrad eller avvikande ruta är inte ett fynd av störning. Det finns andra orsaker.

js-interf-caveat-past-reports = Det här är en beskrivning av tidigare positionsrapporter, inte en prognos och inte en mätning av någon mottagare.

js-interf-caveats = Förbehåll

js-interf-cell-size-rule = Rutstorleken måste vara ett antal grader över 0 och högst 10, eller tom för 0,5.

js-interf-check-failed = { $name }: kunde inte kontrolleras ({ $reason }).

js-interf-click-cell = Klicka på en ruta, eller fokusera kartan och använd piltangenterna, för att se dess tal.

js-interf-close = Stäng

js-interf-close-file = Stäng { $name }

js-interf-col-affected = Påverkade

js-interf-col-cell-area = Rutans yta

js-interf-col-detectors = Detektorer

js-interf-col-observed = Observerade

js-interf-col-sampled = Samplade

js-interf-col-share = Andel

js-interf-col-status = Status

js-interf-coverage-limits = Den här källans täckningsgränser

js-interf-csv-too-big = { $name }: större än 24 MiB; bygg från ett utdrag (kommandoradsverktyget tar en hel fil).

js-interf-csv-too-big-short = { $name }: större än 24 MiB; bygg från ett utdrag.

js-interf-custom-needs-licence = En anpassad datamängd kräver licensen, dess URL och texten om upphov: de skrivs in i kartfilen.

js-interf-dataset = Datamängd

js-interf-dates-rule = Datum anges som ÅÅÅÅ-MM-DD, eller lämnas tomma för ingen gräns.

js-interf-day = Dag

js-interf-day-aria = { $kind }-dag

js-interf-day-confounded-note = Den här dagen är förvillad: ingen ruta bedömdes som försämrad på grund av dagens bakgrund. Rutor som annars hade stuckit ut visas som obedömda.

js-interf-day-figures-aria = Tal för dagen

js-interf-demo-csv-name = { $file } (syntetiskt urval)

js-interf-demo-failed = Demon kunde inte öppnas: { $reason }.

js-interf-demo-opened = Syntetisk demo: tre påhittade filer över en påhittad region på öppet hav (två ADS-B-dagar, varav en förvillad, och en AIS-dag). Inget verkligt flygplan, fartyg eller dygn ligger bakom dem. Använd dagväljaren på ADS-B-lagret.

js-interf-demo-route-name = route.csv (syntetisk)

js-interf-describe-map = { $kind }-karta för { $date }: { $cells } rutor ritade, { $parts }. Rutor som inte är ritade observerades inte.

js-interf-did-not-load = { $url } lästes inte in

js-interf-engine-no-fn = Den här motorversionen (version { $version }) har ingen { $fn }; den är äldre än den här sidan. Motsvarigheten för kommandoraden finns på sidan Verktyg.

js-interf-engine-start-failed = Motorn kunde inte starta här ({ $reason }). Att öppna kartfiler ovan fungerar ändå.

js-interf-err-format-version = { $name }: inte en kartfil för störningar som stöds av Kshana (format_version { $version }; den här sidan stöder { $supported }).

js-interf-err-no-rows = { $name }: ingen rows[] i den här rapporten.

js-interf-err-not-json = { $name }: inte JSON ({ $reason }).

js-interf-err-not-map = { $name }: det här är GeoJSON men inte en Kshana-karta över störningar (ingen kshana_interference_map-medlem).

js-interf-err-not-route = { $name }: inte en Kshana-rapport om ruttexponering (ingen kshana_route_exposure-medlem).

js-interf-err-route-schema = { $name }: schemat { $schema } är inte { $expected }, som den här sidan läser.

js-interf-err-source-kind = { $name }: source_kind { $kind } är varken adsb eller ais.

js-interf-err-unknown-schema = { $name }: okänt schema { $schema }; den här sidan läser { $supported }.

js-interf-foot-attribution = Upphov: { $text }

js-interf-foot-coverage = Täckning: { $notes }

js-interf-foot-layer = { $kind }-lager, { $date }. Rutor som inte är ritade observerades inte.

js-interf-foot-licence = Licens: { $licence }

js-interf-foot-licence-url = Licens: { $licence } ({ $url })

js-interf-grid = Rutnät: kvadratiska rutor på { $size }° i latitud och longitud ({ $type }). Bredden i öst–västlig riktning krymper med latituden.

js-interf-guards = Skydd mot andra orsaker

js-interf-input = Indata

js-interf-land-set = Landpolygoner: { $name }.

js-interf-land-too-big = Den landfilen är större än 24 MiB.

js-interf-larger-than = { $name }: större än { $limit }; den här sidan läser kartfiler upp till den storleken.

js-interf-layer-adsb-sub = rutor där flygplan rapporterade låg navigeringsnoggrannhet

js-interf-layer-ais-sub = rutor där fartyg rapporterade orimliga positioner eller rörelser

js-interf-layer-heading = { $kind }-lager

js-interf-layer-hidden = { $kind }-lagret är dolt.

js-interf-layers-separate = ADS-B och AIS är separata lager med egna reglage, förklaringar och licensrader. De slås aldrig ihop till ett färgfält eller ett antal.

js-interf-legend-aria = Vad varje rutstatus betyder; avmarkera en för att tona ned de rutorna

js-interf-licence = Licens

js-interf-licence-aria = Datalicens för { $name }

js-interf-licence-heading = Datalicens och upphov

js-interf-map-aria = { $summary } Piltangenterna flyttar mellan ritade rutor.

js-interf-maps-open =
    { $n ->
        [one] { $n } karta öppen.
       *[other] { $n } kartor öppna.
    }

js-interf-method-summary = Metod och förbehåll

js-interf-no-cell-at = Ingen ruta vid { $lat }, { $lon }: inte observerad. Det är inget belägg för att området var fritt.

js-interf-no-cell-drawn = ingen ruta ritad

js-interf-no-cells-draw = Den här filen har inga rutor att rita.

js-interf-no-day-figures = Den här filen anger inga tal på dagsnivå.

js-interf-no-file-opened = Ingen fil kunde öppnas.

js-interf-no-file-text = De öppna kartorna har ingen filtext att kontrollera (de öppnades inte som filer).

js-interf-none = inga

js-interf-none-stated = (inga angivna)

js-interf-none-stated-file = (inga angivna i den här filen)

js-interf-north-abbr = N

js-interf-not-evaluated = inte utvärderad

js-interf-not-opened-full = { $name }: inte öppnad, { $max } kartor är redan öppna. Stäng några först.

js-interf-nothing-open = Inget öppet ännu.

js-interf-nothing-opened = Inget öppnades.

js-interf-one-day = en dag i taget

js-interf-opened-file-map = Öppnade { $files } fil; { $maps } karta öppen.

js-interf-opened-file-maps = Öppnade { $files } fil; { $maps } kartor öppna.

js-interf-opened-files-map = Öppnade { $files } filer; { $maps } karta öppen.

js-interf-opened-files-maps = Öppnade { $files } filer; { $maps } kartor öppna.

js-interf-opening-demo = Öppnar den syntetiska demon…

js-interf-parameters = Parametrar, fastställda innan några data lästes

js-interf-read-draw-failed = { $name }: kunde inte läsas eller ritas ({ $reason }).

js-interf-read-failed = { $name }: kunde inte läsas ({ $reason }).

js-interf-read-with-map = Läs det här tillsammans med kartan

js-interf-reading = Läser…

js-interf-route-aria = Ruttexponering { $name }

js-interf-route-chip = Rutt

js-interf-route-done =
    { $n ->
        [one] Ruttexponeringen beräknades från { $n } karta med motor { $version }; rapporten visas nedan.
       *[other] Ruttexponeringen beräknades från { $n } kartor med motor { $version }; rapporten visas nedan.
    }

js-interf-route-explain = Andel av ruttens längd i varje tillstånd, per dag och källa. De fyra andelarna summerar till 1 och läses tillsammans: en låg andel försämrade tillsammans med en hög andel inte observerade har inte visats vara fri. Rader för ADS-B och AIS kombineras aldrig.

js-interf-route-exposure = Ruttexponering

js-interf-route-needs-map = Öppna eller bygg minst en karta först: rutten kontrolleras mot kartorna på den här sidan.

js-interf-route-open-failed = Rutten kunde inte öppnas: { $reason }.

js-interf-route-range = { $from } till { $to }

js-interf-route-too-big = { $name }: större än 24 MiB.

js-interf-row-affected-share = Påverkad andel

js-interf-row-aircraft-affected = Påverkade flygplan

js-interf-row-aircraft-observed = Observerade flygplan

js-interf-row-aircraft-sampled = Samplade flygplan

js-interf-row-area = Yta

js-interf-row-cell = Ruta

js-interf-row-detectors = Detektorer som kvalificerade

js-interf-row-flagged = Flaggad: { $detector }

js-interf-row-status = Status

js-interf-row-vessels-observed = Observerade fartyg

js-interf-rows-skipped = { $count } rad(er) var inte giltiga och hoppades över.

js-interf-rt-day = Dag

js-interf-rt-km = Rutt, km

js-interf-rt-licence = Kartans licens och upphov

js-interf-rt-shares = Ruttens andelar

js-interf-rt-source = Källa

js-interf-sample-failed = Urvalet kunde inte öppnas: { $reason }.

js-interf-save = Spara:

js-interf-save-report = Spara rapporten (JSON)

js-interf-show-layer = Visa det här lagret

js-interf-st-anomalous-label = Avvikande

js-interf-st-anomalous-text = Minst en detektor flaggade tillräckligt många olika fartyg här den dagen (minst 3 fartyg och 20 % av de observerade). Möjliga orsaker är störning men också många vanliga.

js-interf-st-confounded-label = Förvillad dag

js-interf-st-confounded-text = Hela dagens mediandel per ruta var hög, vilket tyder på en orsak över ett stort område. Ingen ruta förklaras försämrad en sådan dag; den här rutan hade annars stuckit ut.

js-interf-st-degraded-label = Försämrad

js-interf-st-degraded-text = En hög andel av de samplade flygplanen rapporterade låg navigeringsnoggrannhet här den dagen, långt över dagens medianruta. Det säger inte varför.

js-interf-st-no-background-label = Ingen bakgrundsuppskattning

js-interf-st-no-background-text = Dagens bakgrund (den typiska andelen flygplan som rapporterar låg noggrannhet) kunde inte uppskattas utifrån tillräckligt många rutor, så ingen ruta jämförs med den och ingen bedöms.

js-interf-st-not-anomalous-label = Inte avvikande

js-interf-st-not-anomalous-text = Observerad, och ingen detektor kvalificerade. Inget bevis för att ingenting hände.

js-interf-st-not-degraded-label = Inte försämrad

js-interf-st-not-degraded-text = Samplad, och andelen flygplan som rapporterade låg noggrannhet stack inte ut. Inget bevis för att ingenting hände.

js-interf-st-too-few-label = För få flygplan

js-interf-st-too-few-text = Publicerad (minst 5 olika flygplan observerade) men färre än 10 flygplan kunde samplas, så ingen bedömning görs.

js-interf-starting-build = Startar motorn och bygger…

js-interf-starting-route = Startar motorn och kontrollerar rutten…

js-interf-state-clear-adsb = Fri

js-interf-state-clear-adsb-text = Observerad med tillräckligt många flygplan och inte flaggad. Inget bevis för att ingenting hände.

js-interf-state-clear-ais = Fri

js-interf-state-clear-ais-text = Observerad med tillräckligt många fartyg och inte flaggad. Inget bevis för att ingenting hände.

js-interf-state-degraded-adsb = Försämrad

js-interf-state-degraded-adsb-text = En hög andel av de samplade flygplanen rapporterade låg navigeringsnoggrannhet här den dagen, långt över dagens medianruta.

js-interf-state-degraded-ais = Avvikande

js-interf-state-degraded-ais-text = Minst en detektor flaggade tillräckligt många olika fartyg här den dagen (minst 3 fartyg och 20 % av de observerade).

js-interf-state-notobs-adsb = Inte observerad

js-interf-state-notobs-adsb-text = Ingen ruta ritad: för få flygplan observerades för att publicera den. Det är inget belägg för att området var fritt.

js-interf-state-notobs-ais = Inte observerad

js-interf-state-notobs-ais-text = Ingen ruta ritad: för få fartyg observerades för att publicera den. Det är inget belägg för att området var fritt.

js-interf-state-unassessed-adsb = Obedömd

js-interf-state-unassessed-adsb-text = Observerad, men för få flygplan kunde samplas, dagen var förvillad eller dagens bakgrund kunde inte uppskattas, så ingen bedömning görs.

js-interf-state-unassessed-ais = Obedömd

js-interf-state-unassessed-ais-text = Observerad, men ingen bedömning görs.

js-interf-status-unknown = En status som den här sidan inte beskriver.

js-interf-table-first = De första { $shown } av { $total } rutor visas, de viktigaste bedömningarna först.

js-interf-table-summary = Varje ritad ruta som tabell ({ $n })

js-interf-the-day = Dagen

js-interf-unknown-date = okänt datum

js-interf-warn-cell-size = Den här filen använder en rutstorlek på { $size }° som inte är den förhandsregistrerade: det är inte den förhandsregistrerade metoden, så dess bedömningar går inte att jämföra med filer som använder den.

js-interf-warn-cell-size-known = Den här filen använder en rutstorlek på { $size }° som inte är den förhandsregistrerade ({ $registered }°): det är inte den förhandsregistrerade metoden, så dess bedömningar går inte att jämföra med filer som använder den.

js-interf-warn-day-confounded = Den här dagen är förvillad: ingen ruta bedömdes som försämrad på grund av dagens bakgrund (medianandelen per ruta var i sig hög).

js-interf-warn-flag-disagrees = { $count } ruta/rutor har en flagga ”degraded” som inte stämmer med deras status. Det är statusen som ritas.

js-interf-warn-no-licence = Den här filen saknar { $fields }-text. Den visas, men en karta utan sin licens och sitt upphov bör inte publiceras på nytt.

js-interf-warn-on-land-off = Detektorn för position på land var avstängd för den här filen (inga landpolygoner angavs).

js-interf-warn-skipped = { $count } objekt var inte giltig GeoJSON och hoppades över.

js-interf-warn-unknown-status = Statusvärden som den här sidan inte känner till: { $values }. De ritas som ”ingen bedömning”.

js-interf-withheld = undanhållen (färre än 5)

js-interf-written-by = skriven av Kshana { $version }

js-kind-axis-3-d-position-error-m = 3D-positionsfel (m)

js-kind-axis-c-n0-db-hz = C/N0 (dB-Hz)

js-kind-axis-code-jitter-m = kodjitter (m)

js-kind-axis-code-tracking-jitter-m = kodföljningsjitter (m)

js-kind-axis-doppler-shift-hz = Dopplerförskjutning (Hz)

js-kind-axis-effective-c-n0-db-hz = effektiv C/N0 (dB-Hz)

js-kind-axis-elevation = elevation (°)

js-kind-axis-fit-interval-s = anpassningsintervall (s)

js-kind-axis-formal-position-sigma-m = formellt positionssigma (m)

js-kind-axis-latitude = latitud (°)

js-kind-axis-leo-satellites-added-to-the = LEO-satelliter som lagts till positionsbestämningen

js-kind-axis-mean-satellites-in-view = genomsnittligt antal satelliter i sikte

js-kind-axis-median-dilution-of-precision = median av precisionsförsämring

js-kind-axis-median-error-m = medianfel (m)

js-kind-axis-median-pdop = median-PDOP

js-kind-axis-metres = meter

js-kind-axis-observation-window-s = observationsfönster (s)

js-kind-axis-offset-from-the-signal-s = avstånd från signalens mitt (MHz)

js-kind-axis-offset-from-the-snapshot-centre = avstånd från ögonblicksbildens mitt (MHz)

js-kind-axis-pdop = PDOP

js-kind-axis-position-error-m = positionsfel (m)

js-kind-axis-power-spectral-density-db-hz = effektspektraltäthet (dB/Hz, enhetseffekt)

js-kind-axis-power-spectral-density-dbw-hz = effektspektraltäthet (dBW/Hz)

js-kind-axis-probability-of-detection = detektionssannolikhet

js-kind-axis-range-error-m = avståndsfel (m)

js-kind-axis-relays = reläer

js-kind-axis-sisre-root-mean-square-m = SISRE, kvadratiskt medelvärde (m)

js-kind-axis-time-error-ns = tidsfel (ns)

js-kind-axis-time-s = tid (s)

js-kind-axis-time-since-the-start-min = tid sedan starten (min)

js-kind-axis-update-period-s = uppdateringsperiod (s)

js-kind-cap-body-pnt-label = Reläpositionering

js-kind-cap-campaign-label = Kampanj

js-kind-cap-constellation-design-label = Täckning

js-kind-cap-leo-navmsg-label = Navigeringsmeddelande

js-kind-cap-leo-pass-label = Överflygning och länk

js-kind-cap-leo-pnt-chain-label = Kedja från början till slut

js-kind-cap-leo-ppp-label = Positionering

js-kind-cap-leo-pvt-label = Positionering

js-kind-cap-leo-signal-label = Signalutformning

js-kind-cap-lunar-llr-datum-label = Referens för laseravstånd

js-kind-cap-ntn-positioning-label = Positionering

js-kind-cap-solar-system-label = Solsystemet

js-kind-cap-spectrum-label = Spektrum

js-kind-guided-doppler-error-hz = Dopplerfel (Hz)

js-kind-guided-duration-s = Varaktighet (s)

js-kind-guided-earth-range-error-m = Jordens avståndsfel (m)

js-kind-guided-elevation-mask = Elevationsmask (°)

js-kind-guided-first-jammer-bandwidth-mhz = Första störsändarens bandbredd (MHz)

js-kind-guided-first-jammer-power-dbw = Första störsändarens effekt (dBW)

js-kind-guided-first-jammer-range-m = Första störsändarens avstånd (m)

js-kind-guided-first-jammer-received-power-dbw = Första störsändarens mottagna effekt (dBW)

js-kind-guided-first-phase-length-s = Längd på första fasen (s)

js-kind-guided-first-shell-altitude-km = Höjd för första skalet (km)

js-kind-guided-first-shell-inclination = Inklination för första skalet (°)

js-kind-guided-first-signal-bandwidth-hz = Första signalens bandbredd (Hz)

js-kind-guided-first-system-range-error-m = Första systemets avståndsfel (m)

js-kind-guided-fit-interval-s = Anpassningsintervall (s)

js-kind-guided-gravity-field-degree = Gravitationsfältets grad

js-kind-guided-grid-step = Rutnätssteg (°)

js-kind-guided-integration-time-s = Integrationstid (s)

js-kind-guided-leo-satellites-in-the-sweep = LEO-satelliter i svepet

js-kind-guided-loop-bandwidth-hz = Slingbandbredd (Hz)

js-kind-guided-monte-carlo-runs = Monte Carlo-körningar

js-kind-guided-network-synchronisation-error-m = Nätverkets synkroniseringsfel (m)

js-kind-guided-orbit-altitude-km = Banhöjd (km)

js-kind-guided-orbit-determination-error-m = Fel i banbestämningen (m)

js-kind-guided-orbit-inclination = Banans inklination (°)

js-kind-guided-pdop-threshold = PDOP-tröskel

js-kind-guided-peak-elevation-of-the-pass = Passagens högsta elevation (°)

js-kind-guided-points-per-orbit-track = Punkter per banspår

js-kind-guided-receiver-noise-figure-db = Mottagarens brusfaktor (dB)

js-kind-guided-receiver-power-when-awake-mw = Mottagarens effekt när den är vaken (mW)

js-kind-guided-reference-c-n0-db-hz = Referens-C/N0 (dB-Hz)

js-kind-guided-relay-altitude-km = Reläernas höjd (km)

js-kind-guided-relay-inclination = Reläernas inklination (°)

js-kind-guided-relay-planes = Relä-plan

js-kind-guided-relay-range-error-m = Reläernas avståndsfel (m)

js-kind-guided-relays-per-plane = Reläer per plan

js-kind-guided-runs-per-case = Körningar per fall

js-kind-guided-satellite-altitude-km = Satellitens höjd (km)

js-kind-guided-second-system-range-error-m = Andra systemets avståndsfel (m)

js-kind-guided-shared-condition = Gemensamt villkor

js-kind-guided-slant-electron-content-tecu = Elektroninnehåll längs sikten (TECU)

js-kind-guided-slant-range-km = Snedavstånd (km)

js-kind-guided-spoofed-offset-m = Förskjutning vid spoofing (m)

js-kind-guided-spoofing-starts-s = Spoofing börjar (s)

js-kind-guided-sweep-from = Svep från

js-kind-guided-sweep-steps = Svepsteg

js-kind-guided-sweep-to = Svep till

js-kind-guided-timeline-step-s = Tidslinjens steg (s)

js-kind-guided-tracking-threshold-db-hz = Följningströskel (dB-Hz)

js-kind-guided-transmit-power-dbw = Sändeffekt (dBW)

js-kind-guided-update-period-s = Uppdateringsperiod (s)

js-kind-guided-user-latitude = Användarens latitud (°)

js-kind-hint-a-band-under-this-carrier = ett band under den här bärvågsbrustätheten har förlorat låsning

js-kind-hint-a-grid-point-is-available = en rutnätspunkt är tillgänglig så länge dess positionsutspädning av precision ligger under det här

js-kind-hint-a-satellite-must-be-this = en satellit måste vara så här hög för att räknas som i sikte

js-kind-hint-a-satellite-must-be-this-2 = en satellit måste vara så här hög för att användas

js-kind-hint-a-satellite-of-the-first = en satellit i det första systemet måste vara så här hög

js-kind-hint-arc-one-message-is-fitted = båge som ett meddelande anpassas över

js-kind-hint-code-tracking-loop-noise-bandwidth = kodföljningsslingans brusbandbredd

js-kind-hint-detail-of-the-truth-orbit = detaljnivå i referensbanans gravitationsmodell

js-kind-hint-distance-from-the-first-jammer = avståndet från den första störsändaren till mottagaren

js-kind-hint-distance-to-the-satellite-in = avståndet till satelliten i bandavvägningen

js-kind-hint-drawn-while-acquiring-and-tracking = ritas under inlåsning och följning

js-kind-hint-equivalent-isotropically-radiated-power-of = ekvivalent isotropiskt utstrålad effekt för den första störsändaren

js-kind-hint-equivalent-isotropically-radiated-power-of-2 = ekvivalent isotropiskt utstrålad effekt för bandet

js-kind-hint-filter-runs-averaged-for-each = filterkörningar som medelvärdesbildas för varje fall (fler är långsammare)

js-kind-hint-first-value-of-the-swept = första värdet för den svepta parametern

js-kind-hint-height-of-the-chain-s = höjden på kedjans satellit

js-kind-hint-height-of-the-first-shell = höjden på det första skalets banor

js-kind-hint-height-of-the-relay-orbits = höjden på reläbanorna över himlakroppen

js-kind-hint-height-of-the-satellite-whose = höjden på satelliten vars meddelande anpassas

js-kind-hint-how-far-the-spoofer-moves = hur långt spoofern flyttar den beräknade positionen

js-kind-hint-how-finely-each-orbit-is = hur finmaskigt varje bana samplas för ritningen

js-kind-hint-how-high-the-satellite-climbs = hur högt satelliten stiger

js-kind-hint-how-long-the-first-phase = hur länge den första fasen varar

js-kind-hint-how-long-the-receiver-integrates = hur länge mottagaren integrerar för ett avstånd

js-kind-hint-how-many-low-orbit-satellites = hur många satelliter i låg bana geometrisvepet lägger till

js-kind-hint-how-many-seeded-runs-make = hur många körningar med fast frö som utgör ensemblen

js-kind-hint-how-many-values-are-run = hur många värden som körs

js-kind-hint-how-often-a-new-message = hur ofta ett nytt meddelande utfärdas

js-kind-hint-how-wide-the-first-jammer = hur brett den första störsändaren sprider sin effekt

js-kind-hint-ionosphere-along-the-path-in = jonosfären längs vägen, i enheter av totalt elektroninnehåll

js-kind-hint-last-value-of-the-swept = sista värdet för den svepta parametern

js-kind-hint-length-of-each-filter-run = längden på varje filterkörning

js-kind-hint-length-of-the-run = körningens längd

js-kind-hint-length-of-the-timeline = tidslinjens längd

js-kind-hint-occupied-bandwidth-of-the-first = upptagen bandbredd för den första referenssignalen

js-kind-hint-one-sigma-doppler-measurement-error = Doppler-mätfel på en sigma

js-kind-hint-one-sigma-error-of-a = fel på en sigma för ett avstånd till ett relä

js-kind-hint-one-sigma-error-of-the = fel på en sigma för det tvåvägsavstånd från jorden

js-kind-hint-orbital-planes-of-the-navigation = banplan för navigeringsreläerna

js-kind-hint-power-of-the-first-jammer = den första störsändarens effekt vid mottagaren

js-kind-hint-raises-the-noise-floor-under = höjer brusgolvet under varje band

js-kind-hint-satellites-in-each-plane = satelliter i varje plan

js-kind-hint-sets-the-doppler-range-a = bestämmer det Doppler-intervall som en kallsökning måste täcka

js-kind-hint-signal-in-space-range-error = signal-i-rymden-avståndsfel för det första systemet

js-kind-hint-signal-in-space-range-error-2 = signal-i-rymden-avståndsfel för det andra systemet

js-kind-hint-signal-level-the-tracking-figures = signalnivå som följningstalen anges vid

js-kind-hint-spacing-of-the-latitude-and = avståndet i latitud- och longitudrutnätet

js-kind-hint-spacing-of-the-shared-mission = avståndet i det gemensamma uppdragets tidsrutnät

js-kind-hint-the-part-of-the-range = den del av avståndsfelet som meddelandet inte kan ta bort

js-kind-hint-the-value-every-member-runs = värdet som varje medlem körs med

js-kind-hint-tilt-of-that-orbit = lutningen på den banan

js-kind-hint-tilt-of-the-first-shell = lutningen på det första skalets plan

js-kind-hint-tilt-of-the-relay-planes = lutningen på reläplanen

js-kind-hint-timing-error-between-satellites-as = tidsfel mellan satelliter, som avstånd

js-kind-hint-when-the-spoofer-captures-the = när spoofern fångar mottagaren

js-kind-hint-where-the-receiver-stands = där mottagaren befinner sig

js-kind-hint-where-the-user-stands = där användaren befinner sig

js-kind-label-3-d-error = 3D-fel

js-kind-label-3-d-error-time-of = 3D-fel, ankomsttid

js-kind-label-a-corrupted-frame-is-rejected = en skadad ram avvisas

js-kind-label-all-channels = alla kanaler

js-kind-label-availability = Tillgänglighet

js-kind-label-band = Band

js-kind-label-bodies = Himlakroppar

js-kind-label-body = Himlakropp

js-kind-label-both = båda

js-kind-label-case = Fall

js-kind-label-class = Klass

js-kind-label-code-jitter = kodjitter

js-kind-label-constellation = Konstellation

js-kind-label-doppler = Doppler

js-kind-label-event = Händelse

js-kind-label-evidence = Evidens

js-kind-label-fewest-in-view = Minst i sikte

js-kind-label-field = Fält

js-kind-label-first-detection-after-onset = Första detektion efter start

js-kind-label-frame-length = Ramlängd

js-kind-label-fused = fuserad

js-kind-label-fused-cap = Fuserad

js-kind-label-gnss = GNSS

js-kind-label-gnss-and-leo = GNSS och LEO

js-kind-label-gnss-channels = GNSS-kanaler

js-kind-label-gnss-highest-in-sky = GNSS { $id } (högst på himlen)

js-kind-label-gnss-only = Endast GNSS

js-kind-label-gnss-only-cap = Endast GNSS

js-kind-label-gnss-signal = GNSS-signal

js-kind-label-hdop = HDOP

js-kind-label-highest = Högst

js-kind-label-horizontal-error = horisontellt fel

js-kind-label-horizontal-error-2 = Horisontellt fel

js-kind-label-jammer = Störsändare

js-kind-label-jump-threshold = Hopptröskel

js-kind-label-largest-range-jump = Största avståndshopp

js-kind-label-largest-range-jump-against-the = största avståndshopp mot tröskeln

js-kind-label-leo = LEO

js-kind-label-leo-channels = LEO-kanaler

js-kind-label-leo-only = Endast LEO

js-kind-label-light-time-from-observer = Ljustid från { $observer }

js-kind-label-light-time-from-the-observer = Ljustid från observatören

js-kind-label-light-time-one-way = Ljustid, enkel väg

js-kind-label-lowest = Lägst

js-kind-label-lowest-c-n0 = Lägsta C/N0

js-kind-label-mean = Medelvärde

js-kind-label-mean-in-view = Medelvärde i sikte

js-kind-label-median-convergence = Mediankonvergens

js-kind-label-median-pdop = Median-PDOP

js-kind-label-member-runs = Medlemskörningar

js-kind-label-message-switch-iod = meddelandebyte, datautgåva { $old } till { $new }

js-kind-label-mission-length = Uppdragets längd

js-kind-label-model = modell

js-kind-label-monte-carlo-runs = Monte Carlo-körningar

js-kind-label-noise-floor = Brusgolv

js-kind-label-parameters = Parametrar

js-kind-label-payload = Nyttolast

js-kind-label-pdop = PDOP

js-kind-label-pdop-95th-percentile = PDOP, 95:e percentilen

js-kind-label-peak-elevation = Högsta elevation

js-kind-label-peak-tracked-c-n0 = Högsta följda C/N0

js-kind-label-phase = Fas

js-kind-label-predicted-horizontal-sigma = förutsagt horisontellt sigma

js-kind-label-quantisation-position = Kvantisering, position

js-kind-label-range-error = avståndsfel

js-kind-label-relays-above-the-mask = reläer över masken

js-kind-label-relays-and-earth-link = reläer och jordlänk

js-kind-label-relays-only = endast reläer

js-kind-label-satellite = Satellit

js-kind-label-satellites = Satelliter

js-kind-label-satellites-used = Använda satelliter

js-kind-label-signal = Signal

js-kind-label-signal-chip-spacing = { $name } ({ $spacing } chip-avstånd)

js-kind-label-sisre-after-quantisation = SISRE efter kvantisering

js-kind-label-sisre-root-mean-square = SISRE, kvadratiskt medelvärde

js-kind-label-spoofing-starts = spoofing börjar

js-kind-label-standard-deviation = Standardavvikelse

js-kind-label-sun-separation = Avstånd från solen

js-kind-label-sweep-runs = Svepkörningar

js-kind-label-system = System

js-kind-label-time-above-the-mask = Tid över masken

js-kind-label-time-error-root-mean-square = Tidsfel, kvadratiskt medelvärde

js-kind-label-tracked-component = följd komponent

js-kind-label-tracking-threshold = Följningströskel

js-kind-label-transmit-bandwidth = Sändningsbandbredd

js-kind-label-vdop = VDOP

js-kind-label-welch-estimate-of-the-synthesised = Welch-skattning av de syntetiserade samplen

js-kind-label-whole-signal = hela signalen

js-kind-label-wideband-j-s-tolerated = Tolererad J/S för bredband

js-kind-label-with-unit = { $label } ({ $unit })

js-kind-label-worst-site-availability = Sämsta platsens tillgänglighet

js-kind-no = nej

js-kind-note-a-gap-is-an-epoch = Ett glapp är en epok med för få reläer i sikte för en positionsbestämning.

js-kind-note-a-helmert-transform-is-the = En Helmert-transformation är förskjutningen, rotationen och skalan med sju parametrar mellan två referenssystem.

js-kind-note-a-low-earth-orbit-leo = En satellit i låg jordbana (LEO) korsar himlen på några minuter, så dess C/N0 (förhållandet mellan bärvåg och brustäthet) stiger och sjunker i en klockform; en GNSS-satellit rör sig knappt alls på samma tid.

js-kind-note-a-receiver-independent-exchange-format = En post i stil med Receiver Independent Exchange Format (RINEX) 4. LEO-posttyperna är en Kshana-utökning, som huvudet anger.

js-kind-note-a-single-pass-fixes-the = En enda överflygning bestämmer riktningen längs banan mycket bättre än den tvärs över banan.

js-kind-note-aos-is-acquisition-of-signal = AOS är signalinlåsning (acquisition of signal), TCA tidpunkten för närmaste passage och LOS signalförlust (loss of signal).

js-kind-note-c-n0-is-the-carrier = C/N0 är förhållandet mellan bärvåg och brustäthet. Ett band under mottagarens följningströskel har förlorat låsning.

js-kind-note-cells-are-the-code-and = Cellerna är de kod- och Doppler-fack som en kallsökning måste testa.

js-kind-note-cold-is-a-first-fix = Kall är en första positionsbestämning utan förkunskap; het är en positionsbestämning kort efter den förra.

js-kind-note-dilution-of-precision-dop-scales = Precisionsförsämring (DOP) skalar ett avståndsfel till ett positionsfel: G är geometrisk, P position, H horisontell, V vertikal. Percentilerna gäller alla rutnätspunkter och epoker.

js-kind-note-drawn-at-the-strongest-signal = Ritad vid körningens starkaste signalnivå. Ett glapp är en sträcka utan satellit i sikte.

js-kind-note-each-body-carries-its-own = Varje himlakropp bär sin egen evidensetikett. Ljustiden är enkel väg, från den observatör som anges i scenariot.

js-kind-note-each-row-is-one-full = Varje rad är en hel motorkörning av det svepta scenariot.

js-kind-note-each-rule-is-a-switch = Varje regel är ett byte till ett nyare meddelande mitt under överflygningen.

js-kind-note-each-signal-is-drawn-about = Varje signal ritas kring sin egen mittfrekvens. Ett glapp är en spektral nolla.

js-kind-note-eirp-is-the-equivalent-isotropically = EIRP är den ekvivalenta isotropiskt utstrålade effekten.

js-kind-note-every-phase-is-an-ordinary = Varje fas är en vanlig scenariokörning. Hashvärdena identifierar varje medlems indata och dess resultatdokument.

js-kind-note-iod-is-the-issue-of = IOD är datautgåvan (issue of data): meddelandets löpnummer.

js-kind-note-j-s-is-the-jammer = J/S är förhållandet mellan störsändarens effekt och signalens. Följningsandelen är den del av körningen som bandet håller sig över tröskeln.

js-kind-note-p05-p50-and-p95-are = p05, p50 och p95 är 5:e, 50:e och 95:e percentilen. ci95 är 95-procentigt konfidensintervall för medelvärdet.

js-kind-note-parameters-are-public-with-a = Parametrarna är OFFENTLIGA (med källa), REPRESENTATIVA eller WORKSHOP, som varje förinställning anger.

js-kind-note-precise-point-positioning-ppp-converges = Precis punktpositionering (PPP) konvergerar när felet håller sig under kriteriet. NEES är det normaliserade kvadrerade skattningsfelet, en kontroll av filtrets konsistens.

js-kind-note-sisre-defined = SISRE är signal-i-rymden-avståndsfelet: det som det utsända meddelandet tillför en användares avstånd. Här är det meddelandets representationsfel mot motorns egen referensbana.

js-kind-note-sisre-is-the-signal-in = SISRE är det signal-i-rymden-avståndsfel som antas för varje systems utsända bana och klocka.

js-kind-note-ssc-is-the-spectral-separation = SSC är spektralseparationskoefficienten: hur mycket av en signals effekt som hamnar inom den andras mottagare. Ett streck betyder att de två inte överlappar.

js-kind-note-the-chain-runs-the-signal = Kedjan kör stegen signal, överflygning, navigeringsmeddelande, positionering och precis positionering i ordning. Varje rad är ett tal som ett steg beräknade och nästa använde.

js-kind-note-the-doppler-and-pass-geometry = Monitorn för Doppler och överflygningsgeometri jämför uppmätta avståndshastigheter med dem som förutsägs från banorna. Regeln markerar när spoofern börjar.

js-kind-note-the-engine-draws-its-spectrum = Motorn ritar sin spektrummodell som fas- och kvadratursampel (IQ) vid ett ögonblick och skattar spektrumet tillbaka från dem. Samma sampel är exporten i SigMF (Signal Metadata Format).

js-kind-note-the-engine-s-own-documented = Motorns egen dokumenterade binära ram, avslutad med en 24-bitars cyklisk redundanskontroll (CRC-24Q).

js-kind-note-the-gabor-root-mean-square = Gabor-bandbredden (kvadratiskt medelvärde) avgör hur skarpt en signal kan användas för avståndsmätning.

js-kind-note-the-largest-jammer-to-signal = Det största förhållandet mellan störsändare och signal (J/S) som varje signal följer igenom, för en kontinuerlig våg (CW), en störsändare med matchat spektrum och en bredbandig störsändare.

js-kind-note-the-shapiro-delay-is-the = Shapiro-fördröjningen är den extra ljustiden från solens gravitation längs vägen.

js-kind-note-the-spectrum-kind-and-the = Spektrumtypen och jammingtypen beräknar samma länk på två sätt; sista kolumnen är skillnaden mellan dem.

js-kind-note-time-of-arrival-toa-ranging = Avståndsmätning med ankomsttid (TOA) på en nedlänk i ett icke-jordbundet nät (NTN): en bredare signal ger skarpare avståndsmätning.

js-kind-note-what-half-a-least-significant = Vad en halv minst signifikant bit (LSB) av varje fält kostar i position och i klocka, som avstånd.

js-kind-rowhead-block = Block

js-kind-rowhead-condition = Villkor

js-kind-rowhead-figure = Tal

js-kind-rowhead-member = Medlem

js-kind-rowhead-metric = Mått

js-kind-rowhead-monitor = Monitor

js-kind-rowhead-phase = Fas

js-kind-rowhead-satellite = Satellit

js-kind-rowhead-signal = Signal

js-kind-rowhead-solution = Lösning

js-kind-sub-clock-offset-db = { $clock }, { $offset } dB

js-kind-sub-doppler-only = Endast Doppler

js-kind-sub-from-to = { $from } till { $to }

js-kind-sub-fused = fuserad

js-kind-sub-gnss-and-leo-latitude = GNSS och LEO, latitud { $lat }°

js-kind-sub-gnss-only = Endast GNSS

js-kind-sub-gnss-only-latitude = Endast GNSS, latitud { $lat }°

js-kind-sub-model-fit-seconds = { $model }, anpassning på { $fit } s

js-kind-threshold-4-needed-for-a-fix = 4 behövs för en positionsbestämning

js-kind-threshold-convergence-criterion = konvergenskriterium

js-kind-threshold-elevation-mask = elevationsmask

js-kind-threshold-gnss-median = GNSS-median

js-kind-threshold-tracking-threshold = följningströskel

js-kind-title-acquisition = Inlåsning

js-kind-title-against-a-simulated-campaign = Mot en simulerad kampanj

js-kind-title-assumptions = Antaganden

js-kind-title-band-trade-at-equal-transmit = Bandavvägning vid lika sändeffekt

js-kind-title-bands = Band

js-kind-title-beside-the-published-figures = Bredvid de publicerade talen

js-kind-title-beside-the-published-speed-up = Bredvid den publicerade snabbare konvergensen

js-kind-title-bodies = Himlakroppar

js-kind-title-body = Himlakropp

js-kind-title-by-latitude = Efter latitud

js-kind-title-c-n0-by-band-over = C/N0 per band under körningen

js-kind-title-c-n0-over-the-pass = C/N0 under överflygningen

js-kind-title-cases = Fall

js-kind-title-central-body = Centralkropp

js-kind-title-closed-form-doppler-against-finite = Doppler i sluten form mot finita differenser

js-kind-title-code-tracking-jitter = Kodföljningsjitter

js-kind-title-code-tracking-jitter-against-c = Kodföljningsjitter mot C/N0

js-kind-title-combined-over-the-members = Kombinerat över medlemmarna

js-kind-title-compatibility-with-gnss-signals = Kompatibilitet med GNSS-signaler

js-kind-title-constellations = Konstellationer

js-kind-title-continuity-across-message-switches = Kontinuitet över meddelandebyten

js-kind-title-cross-check-against-the-jamming = Korskontroll mot jammingtypen

js-kind-title-datum-accuracy = Datumets noggrannhet

js-kind-title-dilution-of-precision-over-the = Precisionsförsämring över hela rutnätet

js-kind-title-doppler = Doppler

js-kind-title-doppler-envelopes = Doppler-envelopper

js-kind-title-doppler-only-fix = Positionsbestämning endast med Doppler

js-kind-title-doppler-over-the-pass = Doppler under överflygningen

js-kind-title-doppler-positioning-from-one-pass = Doppler-positionering från en överflygning

js-kind-title-earth-link = Jordlänk

js-kind-title-elevation = Elevation

js-kind-title-encoded-frame = Kodad ram

js-kind-title-epoch = Epok

js-kind-title-epoch-and-frame = Epok och referenssystem

js-kind-title-events = Händelser

js-kind-title-every-node-of-the-sweep = Varje nod i svepet

js-kind-title-field-table = Fälttabell

js-kind-title-figures-of-merit = Kvalitetsmått

js-kind-title-filter-noise = Filterbrus

js-kind-title-fit-interval-trade = Avvägning av anpassningsintervall

js-kind-title-fix-quality-against-observation-window = Positionsbestämningens kvalitet mot observationsfönster

js-kind-title-frame-checks = Ramkontroller

js-kind-title-frame-hexadecimal = Ram, hexadecimal

js-kind-title-geometry-against-latitude = Geometri mot latitud

js-kind-title-geometry-as-leo-satellites-are = Geometri när LEO-satelliter läggs till

js-kind-title-geometry-position-dilution-of-precision = Geometri: positionsutspädning av precision

js-kind-title-global-coverage = Global täckning

js-kind-title-gnss-leo-and-fused = GNSS, LEO och fuserad

js-kind-title-gnss-reference = GNSS-referens

js-kind-title-hand-offs-between-phases = Överlämningar mellan faser

js-kind-title-helmert-fit = Helmert-anpassning

js-kind-title-helmert-transform-parameters = Parametrar för Helmert-transformation

js-kind-title-inputs = Indata

js-kind-title-ionosphere-free-band-pairs = Jonosfärsfria bandpar

js-kind-title-jammer-tolerance = Tolerans mot störsändare

js-kind-title-jammers = Störsändare

js-kind-title-joint-fix = Gemensam positionsbestämning

js-kind-title-leo-against-gnss = LEO mot GNSS

js-kind-title-limitations = Begränsningar

js-kind-title-links = Länkar

js-kind-title-member-runs = Medlemskörningar

js-kind-title-members-under-the-shared-conditions = Medlemmar under de gemensamma villkoren

js-kind-title-message = Meddelande

js-kind-title-message-models-compared = Jämförelse av meddelandemodeller

js-kind-title-message-switches = Meddelandebyten

js-kind-title-metric-against-axis = { $metric } mot { $axis }

js-kind-title-metric-distribution-over-runs = { $metric }: fördelning över körningarna

js-kind-title-mid-pass-update = Uppdatering mitt i överflygningen

js-kind-title-modelled = Modellerad

js-kind-title-monte-carlo = Monte Carlo

js-kind-title-navigation-message-stage = Steg för navigeringsmeddelande

js-kind-title-not-modelled = Inte modellerad

js-kind-title-notes = Anmärkningar

js-kind-title-notes-on-the-spoofing-model = Anmärkningar om spoofingmodellen

js-kind-title-observation-windows = Observationsfönster

js-kind-title-one-pass-alone = En överflygning ensam

js-kind-title-orbit = Bana

js-kind-title-over-the-message-sequence = Över meddelandesekvensen

js-kind-title-pass = Överflygning

js-kind-title-pass-c-n0-of-the = Överflygning: C/N0 för hela signalen och för den följda komponenten

js-kind-title-pass-code-tracking-jitter = Överflygning: kodföljningsjitter

js-kind-title-pass-doppler = Överflygning: Doppler

js-kind-title-pass-stage = Steg för överflygning

js-kind-title-passes = Överflygningar

js-kind-title-phases = Faser

js-kind-title-position-error-gnss-leo-and = Positionsfel: GNSS, LEO och den fuserade positionsbestämningen

js-kind-title-position-uncertainty-relays-alone-and = Positionsosäkerhet: enbart reläer, och med jordlänken

js-kind-title-positioning-by-signal-bandwidth = Positionering efter signalbandbredd

js-kind-title-positioning-gnss-alone-against-the = Positionering: enbart GNSS mot den fuserade positionsbestämningen

js-kind-title-power-spectral-density = Effektspektraltäthet

js-kind-title-power-spectral-density-of-each = Effektspektraltäthet för varje signal

js-kind-title-precise-point-positioning = Precis punktpositionering

js-kind-title-published-comparison = Publicerad jämförelse

js-kind-title-quantisation-budget = Kvantiseringsbudget

js-kind-title-range-residuals = Avståndsresidualer

js-kind-title-ranging-stations = Avståndsmätningsstationer

js-kind-title-reading-the-trade = Att läsa avvägningen

js-kind-title-realised-position-error = Uppnått positionsfel

js-kind-title-receiver = Mottagare

js-kind-title-receiver-power-budget = Mottagarens effektbudget

js-kind-title-reflector-information = Information om reflektorer

js-kind-title-relay-constellation = Relä-konstellation

js-kind-title-relays-in-view = Reläer i sikte

js-kind-title-reproducibility = Reproducerbarhet

js-kind-title-retroreflectors = Retroreflektorer

js-kind-title-rinex-style-record = Post i RINEX-stil

js-kind-title-round-trips = Rundturer

js-kind-title-run = Körning

js-kind-title-satellites-in-view-against-latitude = Satelliter i sikte mot latitud

js-kind-title-sensitivity-to-a-line-of = Känslighet för en lutning av siktlinjen

js-kind-title-shared-conditions = Gemensamma villkor

js-kind-title-signal-components = Signalkomponenter

js-kind-title-signal-stage = Steg för signal

js-kind-title-signals = Signaler

js-kind-title-sisre-against-fit-interval = SISRE mot anpassningsintervall

js-kind-title-sisre-against-update-period = SISRE mot uppdateringsperiod

js-kind-title-sisre-weights = SISRE-vikter

js-kind-title-snapshot = Ögonblicksbild

js-kind-title-snapshot-against-the-model = Ögonblicksbild mot modellen

js-kind-title-snapshot-spectrum-welch-estimate-against = Spektrum för ögonblicksbilden: Welch-skattning mot modellen

js-kind-title-sources = Källor

js-kind-title-spoofer-and-monitor-settings = Inställningar för spoofer och monitor

js-kind-title-spoofing-monitor-probability-of-detection = Spoofingmonitor: detektionssannolikhet

js-kind-title-statistics-over-the-runs = Statistik över körningarna

js-kind-title-sweep = Svep

js-kind-title-systems = System

js-kind-title-systems-in-the-fix = System i positionsbestämningen

js-kind-title-the-archived-campaign = Den arkiverade kampanjen

js-kind-title-time-error = Tidsfel

js-kind-title-time-error-by-receiver-clock = Tidsfel per mottagarklocka

js-kind-title-time-scale = Tidsskala

js-kind-title-time-to-first-fix-and = Tid till första positionsbestämning och energi per positionsbestämning

js-kind-title-time-transfer-by-clock-and = Tidsöverföring per klocka och signalnivå

js-kind-title-trade-conditions = Villkor för avvägningen

js-kind-title-update-period-trade = Avvägning av uppdateringsperiod

js-kind-title-user = Användare

js-kind-title-user-range-error-through-the = Användarens avståndsfel under överflygningen

js-kind-title-validated = Validerad

js-kind-title-what-each-stage-hands-to = Vad varje steg lämnar vidare till nästa

js-kind-title-what-this-run-is-and = Vad den här körningen är och inte är

js-kind-title-when-each-monitor-detects = När varje monitor detekterar

js-kind-title-work-done = Utfört arbete

js-kind-yes = ja

js-ledger-rows =
    { $n ->
        [one] { $n } registerrad
       *[other] { $n } registerrader
    }

js-lib-abbr-apv = inflygning med vertikal ledning

js-lib-abbr-araim = avancerad autonom integritetsövervakning i mottagaren

js-lib-abbr-auc = arean under kurvan

js-lib-abbr-c-n0 = bärvågs-till-brustäthet

js-lib-abbr-ccsds = Consultative Committee for Space Data Systems

js-lib-abbr-cli = kommandoradsgränssnitt

js-lib-abbr-csac = atomklocka i chipskala

js-lib-abbr-cw = kontinuerlig våg

js-lib-abbr-doi = digital objektidentifierare

js-lib-abbr-dop = precisionsförsämring

js-lib-abbr-eo = jordobservation

js-lib-abbr-gnss = globalt satellitnavigeringssystem

js-lib-abbr-gps = Global Positioning System

js-lib-abbr-hal = horisontell larmgräns

js-lib-abbr-hpl = horisontell skyddsnivå

js-lib-abbr-imu = tröghetsmätenhet

js-lib-abbr-ins = tröghetsnavigeringssystem

js-lib-abbr-iot = sakernas internet

js-lib-abbr-itu-t = International Telecommunication Union, Telecommunication Standardization Sector

js-lib-abbr-j-s = förhållandet mellan störsändare och signal

js-lib-abbr-leo = låg jordbana

js-lib-abbr-llr = laseravståndsmätning mot månen

js-lib-abbr-meo = medelhög jordbana

js-lib-abbr-mtie = största tidsintervallfel

js-lib-abbr-ntn = icke-jordbundet nät

js-lib-abbr-ocxo = ugnsstyrd kristalloscillator

js-lib-abbr-oem = Orbit Ephemeris Message

js-lib-abbr-omm = Orbit Mean-elements Message

js-lib-abbr-pdop = positionsutspädning av precision

js-lib-abbr-pnt = positionering, navigering och tidssynkronisering

js-lib-abbr-ppp = precis punktpositionering

js-lib-abbr-raim = autonom integritetsövervakning i mottagaren

js-lib-abbr-rf = radiofrekvens

js-lib-abbr-rinex = Receiver Independent Exchange Format

js-lib-abbr-roc = mottagarens driftkarakteristik

js-lib-abbr-sbas = satellitbaserat förstärkningssystem

js-lib-abbr-sgp4 = Simplified General Perturbations 4, en banpropagator

js-lib-abbr-sisre = signal-i-rymden-avståndsfel

js-lib-abbr-slam = samtidig lokalisering och kartläggning

js-lib-abbr-spp = enpunktspositionering

js-lib-abbr-tdev = tidsavvikelse

js-lib-abbr-tle = tvåradig elementsats

js-lib-abbr-toml = filformatet för scenarier

js-lib-abbr-trn = terrängreferensnavigering

js-lib-abbr-uhf = ultrahög frekvens

js-lib-abbr-ukf = unscented Kalman-filter

js-lib-abbr-utc = koordinerad universell tid

js-lib-abbr-val = vertikal larmgräns

js-lib-abbr-vlbi = interferometri med mycket lång baslinje

js-lib-abbr-vpl = vertikal skyddsnivå

js-lib-abbr-wg = Arbetsgrupp

js-lib-areas-ground-track = Markspår

js-lib-areas-holdover = Holdover

js-lib-compare-availability = Tillgänglighet

js-lib-compare-holdover = Holdover

js-lib-compare-timing-p95 = Tidssynkronisering p95

js-lib-compare-timing-rms = Tidssynkronisering RMS

js-lib-counts-explorer-tally = { $validated } av { $total } förmågor validerade mot en oberoende extern referens · { $modelled } modellerade · { $partner } ägda av partner — visas här som { $cards } förmågekort i { $domains } områden, { $evidence } evidensanspråk

js-lib-counts-validated-tally = { $validated } av { $total } förmågor validerade mot en oberoende extern referens — visas här som { $cards } förmågekort och { $evidence } evidensanspråk

js-lib-engine-busy = { $verb }…

js-lib-engine-busy-seconds = { $verb }… { $s } s

js-lib-engine-page-http = motorfilen returnerade HTTP { $status }

js-lib-engine-page-not-running = motorn körs inte här

js-lib-engine-worker-crashed = motorns arbetstråd kraschade

js-lib-evidence-aria = Evidens: { $tier }, { $count }

js-lib-evidence-ledger-rows =
    { $n ->
        [one] { $n } registerrad
       *[other] { $n } registerrader
    }

js-lib-evidence-rows-behind = Registerrader bakom det här resultatet

js-lib-geometry-url-bad-mc = Antalet Monte Carlo-sampel är inte ett av { $choices }; { $default } används.

js-lib-geometry-url-bad-number = "{ $key }" är inte ett tal från { $min } till { $max }; standardvärdet används.

js-lib-geometry-url-bad-site = Platsen är inte latitud,longitud[,höjd] inom intervallet; standardplatsen används.

js-lib-geometry-url-bad-sky = Skylinen är inte en förinställning, en tabell med 360 fack eller en kanjon inom intervallet; en öppen horisont används.

js-lib-geometry-url-bad-sys = Konstellationslistan är inte G, E, C och högst en L:<LEO-förinställning> som den här vyn känner till; standardblandningen används.

js-lib-geometry-url-own-tle = Avsändaren använde egna banelement (TLE), som en länk inte bär med sig; förinställningarna visas i stället.

js-lib-geometry-url-repeated = "{ $key }" förekommer mer än en gång; det första värdet används.

js-lib-geometry-url-too-long = Adressen är längre än { $max } tecken, så ingen av dess inställningar lästes.

js-lib-geometry-url-unreadable = Adressen kunde inte läsas.

js-lib-guided-duration-s-hint = hur länge markspåret ska propageras

js-lib-guided-duration-s-label = Varaktighet (s)

js-lib-guided-dut1-s-hint = jordrotationsförskjutning; flyttar markspåret öst–väst

js-lib-guided-dut1-s-label = UT1−UTC (s)

js-lib-guided-mask-deg-hint = en satellit måste vara så här hög för att räknas som synlig

js-lib-guided-mask-deg-label = Elevationsmask (°)

js-lib-guided-seed-hint = en annan brusdragning av samma fysik

js-lib-guided-seed-label = Slumpfrö

js-lib-guided-sigma-uere-m-hint = användarekvivalent avståndsfel på 1 σ för positionssammanfattningen

js-lib-guided-sigma-uere-m-label = Avståndsfel σ (m)

js-lib-guided-station-lat-deg-hint = markstationens latitud — styr överflygningens geometri

js-lib-guided-station-lat-deg-label = Stationens latitud (°)

js-lib-guided-station-lon-deg-hint = markstationens longitud

js-lib-guided-station-lon-deg-label = Stationens longitud (°)

js-lib-guided-step-s-hint = samplingstakt för markspåret

js-lib-guided-step-s-label = Tidssteg (s)

js-lib-guided-threshold-ns-hint = budget inom specifikationen; "tillgänglig" så länge felet ligger under den

js-lib-guided-threshold-ns-label = Specifikationströskel (ns)

js-lib-guided-time-duration-s-hint = körningens totala längd

js-lib-guided-time-duration-s-label = Varaktighet (s)

js-lib-guided-time-step-s-hint = integrations- och samplingstakt

js-lib-guided-time-step-s-label = Tidssteg (s)

js-lib-guided-user-altitude-km-hint = användarfarkostens banhöjd

js-lib-guided-user-altitude-km-label = Användarens höjd (km)

js-lib-guided-user-inclination-deg-hint = användarbanans inklination

js-lib-guided-user-inclination-deg-label = Användarens inklination (°)

js-lib-imufit-card-accel-slope = Accelerometerns Allan-lutning, tidig (cirka -0,5 för vitt brus)

js-lib-imufit-card-bias = Accelerometerns bias, medelvärde (m/s²)

js-lib-imufit-card-bias-instability = Accelerometerns biasinstabilitet (m/s²), 0 när kurvan saknar golv

js-lib-imufit-card-gyro-bias = Gyrots bias, medelvärde (rad/s)

js-lib-imufit-card-gyro-slope = Gyrots Allan-lutning, tidig (cirka -0,5 för vitt brus)

js-lib-imufit-card-note-n = Anmärkning { $n }

js-lib-imufit-card-q-arw = Gyrots vinkelslumpvandring, q_arw (rad²/s)

js-lib-imufit-card-q-va = Accelerometerns hastighetsslumpvandring, q_va (m²/s³)

js-lib-imufit-card-sample-rate = Samplingsfrekvens

js-lib-imufit-card-samples = Sampel

js-lib-imufit-card-span = Spann

js-lib-jammertest-card-clean-epochs = Rena epoker

js-lib-jammertest-card-clean-hours = Rena timmar

js-lib-jammertest-card-detected = Detekterade inom toleransen

js-lib-jammertest-card-detection-rate = Detektionsandel (valfritt larm)

js-lib-jammertest-card-evaluable = Utvärderingsbara

js-lib-jammertest-card-fa-epochs = Epoker med falsklarm

js-lib-jammertest-card-fa-per-hour = Falsklarmskörningar per timme

js-lib-jammertest-card-fa-runs = Falsklarmskörningar

js-lib-jammertest-card-in-tol-rate = Detekterade inom toleransen, andel

js-lib-jammertest-card-late = Sena

js-lib-jammertest-card-median-latency = Mediandröjsmål för detektion

js-lib-jammertest-card-median-recover = Mediantid för återhämtning

js-lib-jammertest-card-missed = Missade

js-lib-jammertest-card-na = saknas

js-lib-jammertest-card-not-assessable = Inget test gick att utvärdera i den här loggen, så ingen detektionsandel eller latens kan anges. Det är ett resultat, inte ett fel hos sidan: ingenting här är ett lyckat utfall.

js-lib-jammertest-card-not-json = { $name }: inte JSON ({ $reason }).

js-lib-jammertest-card-not-scorecard = { $name }: inte ett jammertest-resultatkort (det behöver tests[] och summary).

js-lib-jammertest-card-tests = Test i planens avsnitt

js-lib-jammertest-card-too-large = { $name }: större än 8 MiB; den här sidan läser ett resultatkort upp till den storleken.

js-lib-kpi-available-everywhere = tillgänglig överallt, varje epok

js-lib-kpi-available-everywhere-pdop = tillgänglig överallt, varje epok (PDOP, positionsutspädning av precision, under { $thr })

js-lib-kpi-drops-under = sjunker under följningströskeln på { $thr } dB-Hz: låsningen förloras

js-lib-kpi-end-of-mission = vid uppdragets slut

js-lib-kpi-figure-tiers = Nivåer för talen: { $parts }.

js-lib-kpi-n-modelled = { $n } modellerade

js-lib-kpi-n-partner = { $n } ägda av partner

js-lib-kpi-n-validated = { $n } validerade

js-lib-kpi-no-change = ingen ändring

js-lib-kpi-no-fix = { $pct } % av tiden eller platserna utan positionsbestämning

js-lib-kpi-no-fix-pdop = { $pct } % av tiden eller platserna utan positionsbestämning vid PDOP under { $thr }

js-lib-kpi-over-jump = över hopptröskeln på { $thr } m

js-lib-kpi-over-pdop = över PDOP-tröskeln { $thr }

js-lib-kpi-stays-above = håller sig över följningströskeln på { $thr } dB-Hz

js-lib-kpi-under-jump = under hopptröskeln på { $thr } m

js-lib-kpi-under-pdop = under PDOP-tröskeln { $thr }

js-lib-orbit3d-apogee = apogeum

js-lib-orbit3d-perigee = perigeum

js-lib-orbit3d-prov-scenario = scenario { $hash }

js-lib-orbit3d-title = Bana (ECI, ortografisk)

js-lib-orbit3d-view-angles = az { $az }° · el { $el }°

js-lib-overlay-meta-clock-bias-m = Klockbias

js-lib-overlay-meta-converged-pos-3sigma-m = Position 3σ

js-lib-overlay-meta-converged-pos-rms-m = Position RMS

js-lib-overlay-meta-converged-pos-sigma-m = Position σ

js-lib-overlay-meta-final-clock-freq-sigma = Klockfrekvens σ

js-lib-overlay-meta-mean-relays-in-view = Reläer i sikte

js-lib-overlay-meta-pos-p95-m = Position p95

js-lib-overlay-meta-pos-rms-m = Position RMS

js-lib-overlay-meta-postfit-rms-m = RMS efter anpassning

js-lib-overlay-prov-scenario = scenario { $hash }

js-lib-overlay-subtitle = |fel| (ns) mot tid — { $n } körningar

js-lib-overlay-time-s = tid (s)

js-lib-overlay-title = Överlagring: tidsfel under avbrottet

js-lib-packs-cannot-unpack = den här webbläsaren kan inte packa upp den registrerade filen

js-lib-replay-demos-below-130 = Endast azimut under 130° behölls (angivet)

js-lib-replay-demos-coastal-drag-off = Kustnära bortdragning

js-lib-replay-demos-combined-event = Kombinerad händelse

js-lib-replay-demos-drag-off-stated = Positionsbortdragning (angiven av demon)

js-lib-replay-demos-ferry-drag-off = Färjeöverfart, positionsbortdragning

js-lib-replay-demos-ferry-drag-off-description = En påhittad färjelogg, Tallinn till Helsingfors, 1 Hz. Från 1500 s drar en positionsbortdragning bort den rapporterade positionen medan mottagaren fortsätter rapportera en giltig positionsbestämning.

js-lib-replay-demos-fjord = Naturlig försämring i fjord

js-lib-replay-demos-masked-sky = Färjeöverfart, halva himlen maskerad

js-lib-replay-demos-masked-sky-description = Samma färjelogg med västra halvan av himlen tystad från 600 s, en smalare himmel från 900 s till 1200 s och bortdragningen från 1500 s: en körning där himlen, signalen och positionen i tur och ordning sviker.

js-lib-replay-demos-open-sea-jamming = Jamming på öppet hav

js-lib-replay-demos-port-approach = Tidsspoofing vid hamninlopp

js-lib-replay-demos-source-training = Syntetiskt scenario { $id }: motorns nmea_training-ström och instruktörslogg, poängsatta av dess receiver-trust.

js-lib-replay-demos-source-trust = Syntetisk logg { $id }: påhittad NMEA, poängsatt av motorns receiver-trust.

js-lib-replay-demos-west-masked = Västra halvan av himlen maskerad (angivet)

js-lib-replay-demos-west-masked-again = Västra halvan maskerad igen (angivet)

js-lib-report-charts = Diagram

js-lib-report-eyebrow = det exakta ögonblicket

js-lib-report-figures-of-merit = Kvalitetsmått

js-lib-report-footer = Kshana { $version } · scenario { $hash } · genererad { $iso }. Reproducerbar utifrån scenario + frö + motorversion. Körs lokalt; inget laddas upp.

js-lib-report-not-applicable = ej tillämpligt (ingen attack konfigurerad)

js-lib-report-scenario-definition = Scenariodefinition (TOML)

js-lib-report-th-clock = Klocka

js-lib-report-th-metric = Mått

js-lib-report-th-validation = Validering

js-lib-report-th-value = Värde

js-lib-report-tier-note = Varje kvalitetsmått är märkt { $validated } (kontrollerat mot en oberoende extern referens) eller { $modelled } (utifrån grundprinciper, internt testat) — härlett ur verifieringsmatrisen.

js-lib-report-title = Kshana — scenariorapport

js-lib-skydraw-azimuth-range = azimut { $from } till { $to } grader

js-lib-skydraw-describe = { $listed } satelliter listade, { $heard } med signal

js-lib-skydraw-describe-mean = { $listed } satelliter listade, { $heard } med signal, medelvärde { $snr } dB-Hz

js-lib-skydraw-east = Ö

js-lib-skydraw-no-signal-from = ingen signal från { $sectors }

js-lib-skydraw-none-listed = Inga satelliter listade i loggen vid den här tidpunkten.

js-lib-skydraw-north = N

js-lib-skydraw-sat-heard = { $sys } { $prn }: elevation { $el }, azimut { $az }, signal { $snr } dB-Hz

js-lib-skydraw-sat-quiet = { $sys } { $prn }: elevation { $el }, azimut { $az }, listad, ingen signal

js-lib-skydraw-south = S

js-lib-skydraw-unheard-sector = Satelliter listade mellan azimut { $from } och { $to } grader, ingen med signal

js-lib-skydraw-west = V

js-lib-skyline-edit-describe = Skyline över { $blocked } av 360 grader azimut; högst { $el }° vid azimut { $az }°.

js-lib-skyline-edit-open = Öppen horisont: ingen skyline.

js-lib-stages-all-planets = Alla planeter

js-lib-stages-au-from-sun = { $d } au från solen

js-lib-stages-band-carrier = { $name }-bärvåg, { $mhz } MHz

js-lib-stages-bin-title = { $from } till { $to }{ $unit }: { $count } körningar

js-lib-stages-body-and-moons = { $name } och dess månar

js-lib-stages-cell-title = lat { $lat }°, lon { $lon }° · { $field } { $value }

js-lib-stages-chain-navmsg = Navigeringsmeddelande

js-lib-stages-chain-pass = Överflygning och länk

js-lib-stages-chain-ppp = Precis punktpositionering

js-lib-stages-chain-pvt = Fuserad positionering

js-lib-stages-chain-signal = Signalutformning

js-lib-stages-coverage-aria = { $field } över { $body }, per latitud och longitud

js-lib-stages-feature-n = objekt { $n }

js-lib-stages-flag = flagga

js-lib-stages-frequency-mhz = frekvens (MHz)

js-lib-stages-from-to = { $from } till { $to }

js-lib-stages-geojson-aria = GeoJSON-exporten ritad på en karta

js-lib-stages-histogram = Histogram

js-lib-stages-inner-planets = Inre planeter

js-lib-stages-km-from-centre = { $d } km från { $centre }

js-lib-stages-linear-scale = linjär skala

js-lib-stages-link-light-time = { $from } till { $to }: ljustid enkel väg { $time } s

js-lib-stages-longitude-axis = longitud · latitud uppåt på sidan

js-lib-stages-mission-time = uppdragstid (s)

js-lib-stages-noise-floor = brusgolv

js-lib-stages-orrery-note = { $scale } · referenssystemets x-y-plan, sett från dess nordpol

js-lib-stages-panel-n = Panel { $n }

js-lib-stages-plan-view-aria = Planvy av { $centre } och himlakropparna runt den, { $scale }

js-lib-stages-psd-at-t = Effektspektraltäthet vid t = { $t } s

js-lib-stages-psd-axis = effektspektraltäthet (dBW/Hz)

js-lib-stages-runs = körningar

js-lib-stages-sat-title = { $constellation } { $id } · lat { $lat }°, lon { $lon }°

js-lib-stages-satellites = satelliter

js-lib-stages-spectrum-at-t = spektrum vid t = { $t } s

js-lib-stages-sqrt-scale = avståndsskala med kvadratrot

js-lib-stages-the-body = himlakroppen

js-lib-stages-time-s = tid (s)

js-lib-stages-unit-alarm = Larm

js-lib-stages-unit-cn0 = Bärvågs-till-brustäthet

js-lib-stages-unit-position = Position och skydd

js-lib-stages-unit-satellites = Satelliter

js-lib-stages-unit-time-error = Tidsfel

js-lib-stages-waterfall-aria = Vattenfall av effektspektraltäthet: frekvens i sidled, tid nedåt

js-lib-stages-whole-band = Hela bandet

js-lib-sweep-clock-availability = Tillgänglighet för { $who }

js-lib-sweep-clock-holdover = Holdover för { $who } (s)

js-lib-sweep-clock-timing-p95 = Tidssynkronisering p95 för { $who } (ns)

js-lib-sweep-clock-timing-rms = Tidssynkronisering RMS för { $who } (ns)

js-lib-sweep-max-altitude = största höjd (km)

js-lib-sweep-max-elevation = största elevation (°)

js-lib-sweep-max-speed = största hastighet (m/s)

js-lib-sweep-min-altitude = lägsta höjd (km)

js-lib-sweep-peak-doppler = högsta Doppler (Hz)

js-lib-sweep-prov-scenario = scenario { $hash }

js-lib-sweep-y-vs-x = { $y } mot { $x }

js-lib-tabs-3d-orbit = 3D-bana

js-lib-tabs-figures-of-merit = Kvalitetsmått

js-lib-tabs-stability = Stabilitet

js-lib-tabs-sweep = Svep

js-lib-tabs-time-series = Tidsserie

js-lib-tour-ashforde-body = Tack för att du utforskar Kshana. Vi bygger öppen, reproducerbar och evidensbaserad ingenjörskonst för uppdrag som inte får misslyckas — ärliga om vad som är validerat och vad som är modellerat. Frågor, ett samarbete eller en studie? Nå oss på contact@ashforde.org.

js-lib-tour-ashforde-title = Från Ashforde® OÜ

js-lib-tour-capabilities-body = Välj en områdesflik — Banor, Tidssynkronisering, Tröghet, GNSS, Resiliens, Månen, AI/ML, Interop — för att se dess förmågor, var och en märkt Validerad eller Modellerad, med en ▸ kör-knapp för de genomarbetade scenarierna. Öppna ”Evidens och proveniens” i vilket område som helst för att följa beviset, eller slå på ”Endast validerade” för att bara visa det som är kontrollerat mot en oberoende extern referens.

js-lib-tour-capabilities-title = Utforska motorn, ett område i taget

js-lib-tour-cite-body = Kshana är byggd för att refereras — en citerbar programvaruversion med DOI, plus artiklar i kamratgranskningsstil om optimismgapet vid RF-störningar och en villkorad skyddsnivå för tidssynkronisering. Kopiera citatet direkt härifrån.

js-lib-tour-cite-title = Publikationer och hur man citerar

js-lib-tour-download-report-body = Fliken Svep varierar en parameter över ett intervall; ”Fäst för jämförelse” lägger två eller flera körningar över varandra med Δ mellan dem (fungerar över scenariotyper — klocka, Mars-PNT, positionering…); och den här knappen laddar ned körningen som en fristående HTML-rapport som fungerar offline.

js-lib-tour-download-report-title = Svep, jämför och exportera

js-lib-tour-guided-body = De guidade reglagen anpassar sig efter scenariot — frö, specifikationströskel, varaktighet, elevationsmask, banhöjd — och varje ändring kör om direkt.

js-lib-tour-guided-title = Justera reglagen

js-lib-tour-mcp-body = En MCP-server låter AI-assistenter köra den validerade motorn i stället för att gissa; ett JetBrains-tillägg kör scenarier med ett högerklick.

js-lib-tour-mcp-title = Använd den från en AI-agent eller din IDE

js-lib-tour-playground-body = Välj ett scenario i listan — eller tryck på ▸ kör vid någon förmåga ovan — så körs motorn som WebAssembly på din dator. Inget laddas upp.

js-lib-tour-playground-title = Kör den i din webbläsare

js-lib-tour-run-body = Kör det aktuella scenariot. Öppna ”Avancerat” för att redigera TOML och ändra vad som helst; ”Kopiera delningslänk” återskapar exakt den här körningen åt någon annan.

js-lib-tour-run-title = Kör den

js-lib-tour-tabs-body = Växla mellan kvalitetsmåtten, tidsseriediagrammet, klockstabiliteten (Allan-avvikelse) och — för banor — en interaktiv 3D-banvy.

js-lib-tour-tabs-title = Läs resultaten

js-lib-tour-validation-body = Samma utforskare är också evidensregistret: varje område har en låda ”Evidens och proveniens” — talet, den oberoende externa referens det kontrolleras mot och en ärlig status Validerad / Modellerad per påstående. ”Endast validerade” filtrerar till de rader som är kontrollerade mot data.

js-lib-tour-validation-title = Evidens, inte adjektiv

js-lib-views-3-sigma-bound = 3-sigma-gräns

js-lib-views-3d-position-error = 3D-positionsfel

js-lib-views-a-parameter = en parameter

js-lib-views-band-runs = Tidsfelsband över { $runs } Monte Carlo-körningar

js-lib-views-band-the-runs = Tidsfelsband över Monte Carlo-körningarna

js-lib-views-below-tracking = under följningströskeln

js-lib-views-chart = diagram

js-lib-views-classical = klassisk

js-lib-views-epoch = epok

js-lib-views-four-needed = 4 behövs för en positionsbestämning

js-lib-views-free-inertial = fri tröghet

js-lib-views-gnss-denied = GNSS nekad

js-lib-views-ground-track = Markspår

js-lib-views-heatmap-effective = Effektiv bärvågs-till-brustäthet per satellit och tid

js-lib-views-heatmap-nominal = Nominell (ingen störsändare) bärvågs-till-brustäthet per satellit och tid

js-lib-views-horizontal-alert-limit = horisontell larmgräns

js-lib-views-horizontal-hpl = horisontell (HPL)

js-lib-views-id-bound = gräns för { $id }

js-lib-views-id-median = median för { $id }

js-lib-views-id-offset = förskjutning för { $id }

js-lib-views-id-p95 = p95 för { $id }

js-lib-views-map-matched = kartmatchad

js-lib-views-map-matched-title = Kartmatchad mot positionsfel med fri tröghet

js-lib-views-metric = mått

js-lib-views-oscillator = oscillator

js-lib-views-oscillator-source = oscillator ({ $source })

js-lib-views-position-error-axis = positionsfel ({ $unit })

js-lib-views-position-error-m = positionsfel (m)

js-lib-views-position-error-run = Positionsfel under körningen

js-lib-views-position-m = position (m)

js-lib-views-predicted-time-error = Förutsagt tidsfel sedan den senaste positionsbestämningen

js-lib-views-protection-level-m = skyddsnivå (m)

js-lib-views-protection-levels = Skyddsnivåer mot larmgränsen

js-lib-views-quantum = kvantum

js-lib-views-relay-error-bound = Positionsfel vid relänavigering och dess 3-sigma-gräns

js-lib-views-satellites = satelliter

js-lib-views-satellites-tracking = Satelliter som är synliga och fortfarande följs

js-lib-views-shaded-gnss-denied = skuggat: GNSS nekad

js-lib-views-slot-guard = skyddstid i tidslucka

js-lib-views-spoofed-offset = Spoofad tidsförskjutning mot detektionsgränsen

js-lib-views-sweep-of = Svep av { $parameter }: { $metric }

js-lib-views-sync-error-axis = synkroniseringsfel ({ $unit })

js-lib-views-sync-error-run = Synkroniseringsfel under körningen

js-lib-views-threshold = tröskel

js-lib-views-time-error-ns = tidsfel (ns)

js-lib-views-time-ns = tid (ns)

js-lib-views-time-s = tid (s)

js-lib-views-time-since-fix = tid sedan senaste positionsbestämning (s)

js-lib-views-timing-error-axis = fel i tidssynkronisering ({ $unit })

js-lib-views-timing-error-run = Fel i tidssynkroniseringen under körningen

js-lib-views-tracking = följer

js-lib-views-value = värde

js-lib-views-vertical-vpl = vertikal (VPL)

js-lib-views-visible = synlig

js-lib-views-word-enbw = ekvivalent brusbandbredd

js-lib-views-word-nfft = FFT-längd

js-lib-views-word-stec = snedriktat TEC

js-lib-views-word-toa = ankomsttid

js-lib-views-word-ttff = tid till första positionsbestämning

js-lib-views-word-tx = sändning

js-lib-views-word-zwd = våt zenitfördröjning

js-lunar-address-outside-range = { $label }: "{ $raw }" ligger utanför { $min } till { $max }; filens värde används.

js-lunar-address-too-long = Adressen var för lång; standardvärdena visas.

js-lunar-address-unknown-source = Okänd källa i adressen; inspelningen visas.

js-lunar-alert-limit = larmgräns { $value } (illustrativ)

js-lunar-alert-not-stated = larmgräns inte angiven

js-lunar-bearing-east = 90° Ö

js-lunar-bearing-west = 90° V

js-lunar-cell-title = { $lat }°, { $lon }°: korrigerat { $corrected }, tillgänglighet { $availability }, täckning { $coverage }

js-lunar-copy-address = Kopiera adressen från adressfältet.

js-lunar-counts = { $sats } satelliter, { $points } rutnätspunkter, { $epochs } epoker, { $trials } Monte Carlo-försök per epok. Etikett: { $label }.

js-lunar-engine-no-start = Motorn kunde inte starta i den här webbläsaren ({ $reason }). Öppna en resultatfil i stället.

js-lunar-engine-unknown-kind = Den här motorn ({ $version }) känner inte till typen { $kind }; den kräver motor 0.36.

js-lunar-fig-availability-region = Tillgänglighet över regionen

js-lunar-fig-corrected-3d = Korrigerat fel, { $n } %, 3D

js-lunar-fig-coverage = Täckning

js-lunar-fig-epochs-within = epoker inom { $value }

js-lunar-fig-horizontal-vertical = horisontellt { $h }, vertikalt { $v }

js-lunar-fig-hpl-below-alert = HPL under larmgränsen

js-lunar-fig-hpl-vpl = HPL, VPL högst

js-lunar-fig-improvement = Förbättringsfaktor

js-lunar-fig-lowest-point = Lägst i en punkt

js-lunar-fig-points-always-available = Punkter som är tillgängliga vid varje epok

js-lunar-fig-uncorrected-3d = Okorrigerat fel, { $n } %, 3D

js-lunar-fig-worst-point = Sämsta punkten

js-lunar-file-not-json = Den här filen är inte JSON.

js-lunar-file-not-object = Den här filen är inte ett JSON-objekt.

js-lunar-file-too-large = { $name }: större än 32 MiB; den här sidan läser resultatfiler upp till den storleken.

js-lunar-file-value = fil: { $value }

js-lunar-full-of-total = { $full } av { $total }

js-lunar-give-value = { $label }: ange ett värde från { $min } till { $max }.

js-lunar-give-whole-value = { $label }: ange ett värde från { $min } till { $max } (ett heltal).

js-lunar-honesty-affiliation = Inte knuten till och inte understödd av någon myndighet.

js-lunar-honesty-assumptions = Under de angivna offentliga antagandena, inte ett uttalande om prestandan hos något verkligt system.

js-lunar-in-grid-spacing = Avstånd mellan rutnätsringar, grader

js-lunar-in-latency = Korrektionens latens, sekunder

js-lunar-in-seed = Frö

js-lunar-in-station-lat = Stationens latitud, grader

js-lunar-in-station-lon = Stationens longitud, grader

js-lunar-in-survey-error = Stationens inmätningsfel (1 sigma), meter

js-lunar-in-threshold = Noggrannhetströskel, meter

js-lunar-in-time-step = Tidssteg, sekunder

js-lunar-in-trials = Monte Carlo-försök per epok

js-lunar-input-out-of-range = { $label } ligger utanför intervallet.

js-lunar-json-field-not-json = Filens json-fält är inte JSON.

js-lunar-key-50-or-more = 50 % eller mer

js-lunar-key-90-or-more = 90 % eller mer

js-lunar-key-95-or-more = 95 % eller mer

js-lunar-key-99-or-more = 99 % eller mer

js-lunar-key-above = över { $value }

js-lunar-key-above-threshold = över { $value } × tröskeln

js-lunar-key-below-50 = under 50 %

js-lunar-key-between = { $from } till { $to }

js-lunar-key-between-threshold = { $from } till { $to } × tröskeln

js-lunar-key-up-to = upp till { $value }

js-lunar-key-up-to-threshold = upp till { $value } × tröskeln

js-lunar-layer-availability = tillgänglighet

js-lunar-layer-coverage = täckning

js-lunar-layer-error = korrigerat fel

js-lunar-layer-range = korrigerat fel över sitt eget intervall

js-lunar-legend-no-figure = inget tal (otillgänglig hela tiden)

js-lunar-legend-radius = täckningsradie

js-lunar-legend-threshold = tröskel, { $value }

js-lunar-legend-worst = sämsta punkten

js-lunar-link-copied = Länken kopierades.

js-lunar-map-desc = { $points } rutnätspunkter från polen till { $rim }° latitud. För { $meet } av dem ligger det korrigerade felet för percentilen { $percentile } inom tröskeln på { $threshold }. Färgat efter { $layer }. Stationen ligger vid { $lat }°, { $lon }°.

js-lunar-map-note-one-band = { $share } % av punkterna hamnar i ett enda band på tröskelskalan, så kartan visar liten variation: färga efter "eget intervall" för att se hur felet varierar över regionen.

js-lunar-needs-newer-engine = Den här studien kräver motor { $need } eller senare; motorn som körs här är v{ $version }. Inspelningen, eller en resultatfil, kan fortfarande visas.

js-lunar-no = nej

js-lunar-no-recording = Ingen inspelning av den här studien medföljer ännu: den görs vid utgåvan med motor 0.36. Kör den här med en motor som har typen, eller öppna en resultatfil.

js-lunar-no-scenario = Den här webbplatsen har ingen { $file } än: den kommer med motor 0.36. Öppna en resultatfil i stället.

js-lunar-no-scenario-note = Den här webbplatsen har ingen { $file } än (den kommer med motor 0.36), så en körning här är inte möjlig; öppna en resultatfil i stället.

js-lunar-not-report = Det här är inte en { $kind }-rapport.

js-lunar-not-stated = inte angivet

js-lunar-note-none = Filen anger ingen anmärkning.

js-lunar-note-withheld = Filens egen deklaration nämner ett program eller en myndighet, så den här sidan visar den inte; uttalandet överst på sidan gäller.

js-lunar-point-epochs-reason = punktepoker: { $reason }

js-lunar-radius-desc = Täckningsradie över { $count } azimut: kortast { $lo } km vid { $loAz }°, längst { $hi } km vid { $hiAz }°.

js-lunar-radius-desc-limited = { $count } når rutnätets kant, så täckningen sträcker sig minst så långt där.

js-lunar-radius-hollow = Ihåliga punkter når rutnätets kant: täckningen håller minst så långt längs den bäringen.

js-lunar-radius-none = Rapporten anger ingen täckningsradie.

js-lunar-radius-per-azimuth = täckningsradie per azimut

js-lunar-radius-point = { $az }°: { $km } km

js-lunar-radius-point-limited = { $az }°: { $km } km (når rutnätets kant: minst så långt)

js-lunar-radius-zero = Åt alla håll ligger täckningen redan vid stationen under 95 %, så radien är 0 km: det korrigerade felet överstiger tröskeln på { $value } där.

js-lunar-reason-station-missing = stationen ser inte alla satelliter som användaren använder

js-lunar-reason-user-lt4 = färre än fyra satelliter i sikte för användaren

js-lunar-run-stopped = Körningen stoppades: { $message }

js-lunar-running = Kör studien i den här webbläsaren…

js-lunar-running-elapsed = Kör studien i den här webbläsaren… { $seconds } s

js-lunar-scenario-missing-keys = Scenariofilen saknar { $keys }; den kan inte ändras här.

js-lunar-set-inputs = Ange indata och tryck på Kör den här.

js-lunar-showing = Visar { $what }.

js-lunar-showing-engine = Visar { $what } (motor { $version }).

js-lunar-source-error = { $what }: { $error }

js-lunar-station = station

js-lunar-station-title = station { $lat }°, { $lon }°

js-lunar-table-count = { $n } punkter, de närmaste stationen först.

js-lunar-th-corrected = Korrigerat fel, { $n } %

js-lunar-threshold-title = korrigerat fel { $value } (tröskeln)

js-lunar-what-file = filen { $name }

js-lunar-what-recording = inspelningen som följer med Studio

js-lunar-what-run = en körning i den här webbläsaren (motor { $version })

js-lunar-worst-at = vid { $lat }°, { $lon }°

js-lunar-worst-title = sämsta punkt { $lat }°, { $lon }°: { $value }

js-lunar-yes-at-least = ja: minst så långt

js-lunarinfra-above-95-point = över 95-procentspunkten

js-lunarinfra-advisory = Rådgivande programvara, inte typgodkänd utrustning; ingen sändningsväg av något slag.

js-lunarinfra-arc-note = Bärvågens våglängd { $value } m.

js-lunarinfra-arc-title = Varje båge

js-lunarinfra-bars-not-loaded = filen med trösklar lästes inte in

js-lunarinfra-bars-not-shown = De förhandsregistrerade trösklarna kunde inte visas ({ $reason }).

js-lunarinfra-bars-note = Fastställda innan någon studie poängsattes, med de utfall som gäller (motorns incheckning { $commit }). Ingenting är VALIDATED; en tröskel markerad NOT MET fastställs av ett test som hävdar missen, och ingen har lättats.

js-lunarinfra-bars-title = Mot de förhandsregistrerade trösklarna

js-lunarinfra-bars-wrong-file = filen med trösklar är inte den som den här sidan läser

js-lunarinfra-blurb-carrier-phase = En markstation och en omloppsfarkost som använder dubbeldifferentierad bärvågsfas från jord-GNSS-signaler: kan heltalsosäkerheterna lösas, och vad gör det med positionsgränsen? Den snabba exempelkörningen.

js-lunarinfra-blurb-frame-coestimation = De sju parametrarna för månens datum från laseravståndsmätning från jordstationer, med och utan avstånd mellan omloppsfarkost och markstation: hur mycket förbättras informationen?

js-lunarinfra-blurb-geodesy-sensitivity = Hur känsliga är laseravståndsmätning, farkostspårning, en gravimeter och en klocka på ytan för månens tidvattens-Love-tal h2, k2 och l2 och dess fysiska libration?

js-lunarinfra-blurb-od-consistency = Banbestämning ombord med jord-GNSS i en nästan rätlinjig haloomloppsbana, mot en oberoende radiometrisk lösning från marken för samma båge: stämmer de två överens inom sina angivna osäkerheter, och märker konsistenskontrollen ett modelleringsfel när ett läggs in? Visas sida vid sida.

js-lunarinfra-blurb-space-tie = GNSS, VLBI och laseravståndsmätning på en farkost: hur exakt kan förskjutningarna mellan de tre teknikerna knytas ihop, mot felet i den lokala knytningen på farkosten?

js-lunarinfra-bound-label = Positionsosäkerhet, flytande och fast, logaritmisk skala

js-lunarinfra-bound-note = Positionsosäkerhet på en sigma för stationen och omloppsfarkosten med osäkerheterna lämnade flytande och med dem fasta (vad fastlåsning skulle ge om den uppnåddes).

js-lunarinfra-bound-title = Positionsgräns, flytande och fast

js-lunarinfra-chip-na = saknas

js-lunarinfra-comp-normal = normal

js-lunarinfra-comp-position = position (3D)

js-lunarinfra-comp-radial = radiell

js-lunarinfra-comp-transverse = tvärgående

js-lunarinfra-compare-note = Över { $sets } slumpmässiga stationsuppsättningar var det minsta egenvärdet inte mindre med farkostlänkarna i { $lambda } och spåret inte större i { $trace }; medianökningen av det minsta egenvärdet var { $median } gånger.

js-lunarinfra-compare-title = Jämförelsen i siffror

js-lunarinfra-crsigma-label = Cramér-Rao-sigma, logaritmisk skala

js-lunarinfra-crsigma-note = I meter vid ytan.

js-lunarinfra-crsigma-title = Cramér-Rao-sigma per parameter

js-lunarinfra-days =
    { $n ->
        [one] { $n } dag
       *[other] { $n } dagar
    }

js-lunarinfra-direction = riktning { $n }

js-lunarinfra-disclosures = Upplysningar

js-lunarinfra-eig-label = Informationens egenvärden, logaritmisk skala

js-lunarinfra-eig-note = Informationsmatrisens sju egenvärden, minst först, utan och med länkarna mellan omloppsfarkost och station. Det minsta stiger { $times } gånger, och Cramér-Rao-spåret faller till { $share } av sitt värde. Det här förutsätter att banan är känd i månens axlar (dess fel bärs av farkostens avståndssigma).

js-lunarinfra-eig-title = Information i varje riktning av datumet

js-lunarinfra-fact-arc = Båge

js-lunarinfra-fact-hash = Scenariots hash

js-lunarinfra-fact-llr-rows = Rader med laseravståndsmätning

js-lunarinfra-fact-orbit-family = Banfamilj

js-lunarinfra-fact-orbiter-arc = Farkostens båge

js-lunarinfra-fact-orbiter-rows = Rader för farkosten

js-lunarinfra-fact-study = Studie

js-lunarinfra-fact-wavelength = Bärvågens våglängd

js-lunarinfra-families-note = RMS för varje parameters partiella derivata över familjens rader, och antalet rader. En nolla är en parameter som den familjen är blind för. Farkostfamiljens k2-känslighet är ett värde i den övre delen av intervallet.

js-lunarinfra-families-title = Vad varje familj ser

js-lunarinfra-findings = Fynd

js-lunarinfra-fix-note-a = Andelen Monte Carlo-försök som löste varje heltalsosäkerhet korrekt (med dess standardfel), och den andel som den bootstrappade skattningen förutsäger.

js-lunarinfra-fix-note-b = Heltalsfixering uppnås INTE vid den här indatan: den bästa bågen löser { $share } av försöken.

js-lunarinfra-fix-note-c = Det finns ingen tid till fixering att visa, eftersom fixering inte nås.

js-lunarinfra-fix-rate-label = Andel heltalsfixeringar mot båglängd

js-lunarinfra-fix-title = Fixeringsandel mot båglängd

js-lunarinfra-fixed = fast

js-lunarinfra-float = flytande

js-lunarinfra-fraction-above-95 = Andel försök över 95-procentspunkten

js-lunarinfra-ground-radiometric = oberoende radiometrisk från marken

js-lunarinfra-injected-error = inlagt fel { $value } m/s²

js-lunarinfra-mean-consistency = Medelvärde av konsistensstatistikan

js-lunarinfra-mean-q = medel-q

js-lunarinfra-miss-line = { $id } är { $status }: { $value }

js-lunarinfra-miss-no-fix = Fixering av heltalsosäkerheter uppnås INTE vid den här indatan: den bästa bågen löser { $share } av Monte Carlo-försöken.

js-lunarinfra-na = saknas

js-lunarinfra-nominal = nominell

js-lunarinfra-not-result = det här är inte ett resultat för månens infrastruktur

js-lunarinfra-not-verified = Inte verifierad

js-lunarinfra-offset-precision-label = Förskjutningens precision mot lokal knytning, log-log

js-lunarinfra-offsets-note = Translationssigma per axel, skal- och rotationssigma vid ytan, i meter.

js-lunarinfra-offsets-title = Förskjutningarna vid varje knytningsfel (båge på { $days } dagar, { $epochs } epoker)

js-lunarinfra-onboard-gnss = ombord med jord-GNSS

js-lunarinfra-open-failed = { $title } kunde inte öppnas: { $reason }.

js-lunarinfra-opening = Öppnar { $title }…

js-lunarinfra-orbit-uncertainty-log = Banosäkerhet per komponent, logaritmisk skala

js-lunarinfra-orbiter-days = omloppsfarkost, { $days } d

js-lunarinfra-q-note = Medelvärdet av konsistensstatistikan q över { $trials } försök; { $expected } är vad ett konsistent par lösningar ger. Andelen försök över 95-procentspunkten är kontrollens detektionsandel.

js-lunarinfra-q-title = Konsistenskontrollen, nominell mot inlagt fel

js-lunarinfra-recorded =
    { $n ->
        [one] { $title }: motorns registrerade resultat (version { $version }).
       *[other] { $title }: motorns registrerade resultat (version { $version }).
    }

js-lunarinfra-rel-label = Sigma i förhållande till nominellt, logaritmisk skala

js-lunarinfra-rel-note = Cramér-Rao-sigma som procent av det nominella värdet, med alla fyra familjerna tillsammans. h2 och l2 är linjäriseringspunkter, inte verifierade värden; k2 kommer från en publicerad anpassning.

js-lunarinfra-rel-title = Hur väl varje parameter kan låsas fast, mot sitt nominella värde

js-lunarinfra-result-not-json = resultatet är inte JSON ({ $reason })

js-lunarinfra-result-not-loaded = det registrerade resultatet { $file } lästes inte in
