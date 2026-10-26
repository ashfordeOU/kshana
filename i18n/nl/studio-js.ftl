# studio-js.ftl (nl): translations

js-adv-all-domains = Alle domeinen

js-adv-animation-frame-title = Animatie van deze run, geschreven door de engine

js-adv-animation-html-player = HTML-speler

js-adv-animation-html-player-title = De speler in één bestand, zoals de engine hem schreef

js-adv-animation-load-failed = De vastgelegde animatie kon niet worden geladen ({ $reason }).

js-adv-animation-loading = De vastgelegde animatie wordt geladen…

js-adv-animation-none = Er is geen vastgelegde animatie voor dit scenario.

js-adv-animation-note = De engine schrijft een animatie van elke run met een tijdas: een zelfspelende SVG en een HTML-speler in één bestand met eigen afspeel- en scrubbesturing. De browserbuild bevat die schrijver niet, dus dit is het bestand dat de native opdrachtregelengine voor het meegeleverde scenario schreef.

js-adv-animation-svg = Geanimeerde SVG

js-adv-animation-svg-title = De zelfspelende SVG, zoals de engine hem schreef

js-adv-axis-averaging-time = middelingstijd τ (s)

js-adv-axis-observation-interval = observatie-interval τ (s)

js-adv-axis-value = waarde

js-adv-badge-live-engine = Live engine

js-adv-badge-recorded = Vastgelegd

js-adv-badge-recorded-engine = Vastgelegde run, engine v{ $version }

js-adv-badge-recorded-native = Vastgelegde run, native engine v{ $version }

js-adv-band-carrier = Draaggolf

js-adv-band-carrier-not-set = niet ingesteld in dit scenario

js-adv-band-chip-rate = Chipsnelheid

js-adv-band-jammer-bandwidth = Bandbreedte van de jammer

js-adv-band-jammer-label = jammer { $bandwidth } MHz

js-adv-band-jammer-power = Vermogen van de jammer

js-adv-band-jammer-type = Type jammer

js-adv-band-no-carrier-note = De engine berekent de jammer-signaalverhouding uit het linkbudget. Dit scenario noemt geen draaggolffrequentie, dus er wordt geen spectrum getekend.

js-adv-band-satellites = Satellieten

js-adv-band-signal-main-lobe = hoofdlob van het signaal

js-adv-band-svg-label = Signaal- en jammerbanden rond de draaggolf

js-adv-band-tracking-threshold = Volgdrempel

js-adv-browser-cannot-run = De browserbuild kan dit scenario niet uitvoeren.

js-adv-busy-running = Bezig met uitvoeren

js-adv-busy-sweeping = Bezig met sweepen

js-adv-chain-handed-on =
    { $n ->
        [one] { $n } waarde doorgegeven
       *[other] { $n } waarden doorgegeven
    }

js-adv-chain-note = Eén systeem, gevolgd door elke fase van de engine. De tabel hieronder toont elk getal dat een fase berekende en de volgende fase gebruikte.

js-adv-chain-stage = Fase { $n }

js-adv-chain-sub = de uitvoer van elke fase voedt de volgende

js-adv-chain-title = De keten

js-adv-chart-allan-title = Allan-deviatie

js-adv-chart-budget-label = budget

js-adv-chart-default-title = Kshana-grafiek

js-adv-chart-effective-cn0 = Effectieve C/N0 per satelliet

js-adv-chart-ground-track = Grondspoor

js-adv-chart-holdover-budget = Holdover tegenover een tijdsynchronisatiebudget

js-adv-chart-mtie-title = MTIE (maximale tijdsintervalfout)

js-adv-chart-provenance = Kshana v{ $version } · kshana.dev

js-adv-chart-provenance-hash = Kshana v{ $version } · scenario { $hash } · kshana.dev

js-adv-chart-stability-title = Klokstabiliteit (overlappende Allan-deviatie)

js-adv-chart-tdev-title = TDEV (tijdsdeviatie)

js-adv-chart-undrawable = Deze grafiek kon niet worden getekend.

js-adv-chip-live = Live engine · v{ $version }

js-adv-chip-live-title = De Kshana-engine draait in deze browser als WebAssembly

js-adv-chip-recorded = Vastgelegde runs · v{ $version }

js-adv-chip-recorded-title = WebAssembly kon hier niet starten. Er worden echte vastgelegde runs van de meegeleverde scenario's getoond.

js-adv-chip-recorded-title-reason = WebAssembly kon hier niet starten ({ $reason }). Er worden echte vastgelegde runs van de meegeleverde scenario's getoond.

js-adv-chip-unavailable = Engine niet beschikbaar

js-adv-cmd-all-fields = Elk numeriek veld tonen

js-adv-cmd-compare = De vastgezette runs vergelijken

js-adv-cmd-embed-code = Insluitcode kopiëren

js-adv-cmd-exports = De resultaten downloaden (exports)

js-adv-cmd-history = Runhistorie openen

js-adv-cmd-parameters = De parameters openen

js-adv-cmd-pin = Deze run vastzetten om te vergelijken

js-adv-cmd-report = Het rapport downloaden

js-adv-cmd-reset = De scenariotekst herstellen

js-adv-cmd-run = Het scenario uitvoeren

js-adv-cmd-share-link = Deellink kopiëren

js-adv-cmd-start = Naar het startscherm gaan

js-adv-cmd-theme = Wisselen tussen licht en donker

js-adv-cmd-tour = De rondleiding starten

js-adv-command-line-only = alleen opdrachtregel

js-adv-compare-deltas-note = De verschillen zijn ten opzichte van run A. Groen markeert de betere waarde per kwaliteitsmaat.

js-adv-compare-no-common = Deze runs delen geen vergelijkbare kwaliteitsmaten. Zet runs van dezelfde scenariofamilie vast om getallen en verschillen te zien.

js-adv-compare-one-pinned = Eén run is vastgezet. Wijzig een parameter, voer opnieuw uit en zet die run vast om de twee te vergelijken.

js-adv-compare-overlay = Overlay van de vastgezette runs

js-adv-compare-overlay-diff = Overlay met het verschil B − A

js-adv-compare-overlay-note = Doorgetrokken lijnen zijn run A, gestippelde lijnen run B, op dezelfde assen.

js-adv-compare-overlay-title = { $title }: run { $a } (A) tegenover run { $b } (B)

js-adv-compare-pin-two = Zet ten minste twee runs vast om ze naast elkaar te vergelijken. Zet een run vast, wijzig een parameter of kies een ander scenario van dezelfde familie, voer het uit en zet opnieuw vast.

js-adv-compare-run-heading = { $letter } · run { $run }

js-adv-copy-blocked = Kopiëren is hier geblokkeerd.

js-adv-copy-command = Kopiëren: { $command }

js-adv-could-not-load = { $file } kon niet worden geladen.

js-adv-coverage-dots = De stippen zijn { $shown } van { $total } satellieten, gevlogen langs hun grondsporen; speel de replay af om ze te verplaatsen.

js-adv-coverage-field-label = Te tonen veld op de kaart

js-adv-coverage-map = Dekkingskaart

js-adv-coverage-map-over = boven { $body }

js-adv-coverage-map-select = Kaart

js-adv-coverage-note = Elke cel is één rasterpunt op { $body }, gescoord over elke epoch van de run.

js-adv-coverage-title = { $field } boven { $body }

js-adv-crumb-studio = Studio

js-adv-crumb-studio-title = Het startscherm: alle domeinen

js-adv-decrease-field = { $field } verlagen

js-adv-domain = Domein

js-adv-domain-line-campaigns = Aaneengeschakelde missies, sweeps en Monte Carlo-runs op één klok.

js-adv-domain-line-constellations = Ontwerp een constellatie en breng de dekking en PDOP (positie-DOP, dilution of precision) in kaart.

js-adv-domain-line-deepspace = Navigatie en tijd bij de Maan, in de cislunaire ruimte en bij Mars.

js-adv-domain-line-integrity = Positiebepalingen en of ze te vertrouwen zijn: RAIM (receiver autonomous integrity monitoring) en de geavanceerde vorm daarvan, ARAIM.

js-adv-domain-line-interference = Jammers tegen GNSS-ontvangers: wat verloren gaat, en wanneer.

js-adv-domain-line-leo = Navigatiesignalen, passages, berichten en positiebepalingen in een lage baan om de aarde.

js-adv-domain-line-leo-missions = Studies en diensten op basis van een laag in een lage baan om de aarde.

js-adv-domain-line-navigation = Traagheids-, terrein-, zwaartekracht- en andere navigatie zonder GNSS.

js-adv-domain-line-optional = Een optionele groep scenario's.

js-adv-domain-line-orbits = Baanpropagatie, efemeriden en GNSS-geometrie.

js-adv-domain-line-solar = Elke planeet en maan op één epoch, met lichttijden.

js-adv-domain-line-spaceops = Passages, lanceervensters, terugkeer, link- en standbudgetten.

js-adv-domain-line-spectrum = Waterfalls van de radioband: jammers, signalen en wat de ontvanger volgt.

js-adv-domain-line-spoofing = Valse signalen en meaconing, en de monitors die ze opsporen.

js-adv-domain-line-studies = Kwantumsensoren, afwegingsstudies en interoperabiliteitsformaten.

js-adv-domain-line-timing = Klokken zonder GNSS: holdover, stabiliteit, telecommaskers, tijdoverdracht.

js-adv-domain-pick-hint = Kies er één: het opent en draait in uw browser. Daarna kunt u de parameters wijzigen.

js-adv-domain-scenario-count =
    { $n ->
        [one] { $label }: { $n } scenario
       *[other] { $label }: { $n } scenario's
    }

js-adv-domain-select-label = Eén domein tonen

js-adv-download = Downloaden

js-adv-edited-cli-only-status = Bewerkt: dit scenario draait alleen in de opdrachtregelengine.

js-adv-edited-needs-engine = Bewerkt: vereist engine { $need }.

js-adv-edited-needs-live-engine = Bewerkte scenario's vereisen de live engine.

js-adv-embed-copied = Insluitcode gekopieerd.

js-adv-engine-chart = Enginegrafiek

js-adv-engine-chart-alt = Enginegrafiek voor deze run

js-adv-engine-file-http-error = het enginebestand gaf HTTP { $status } terug

js-adv-engine-load-failed-no-recordings = de engine kon niet worden geladen ({ $reason }) en er zijn geen vastgelegde runs gevonden

js-adv-engine-loading = Engine wordt geladen…

js-adv-engine-loading-title = De live engine wordt nog gedownload. Dit vastgelegde resultaat wordt vervangen door een live run zodra die klaar is.

js-adv-engine-start-failed = De engine kon niet starten: { $reason }. Serveer deze map via HTTP (bijvoorbeeld python3 -m http.server) in plaats van het bestand rechtstreeks te openen.

js-adv-entries-count =
    { $n ->
        [one] { $n } item
       *[other] { $n } items
    }

js-adv-export-card-title = Export { $format }

js-adv-export-csv-desc = Dezelfde bytes die het opdrachtregelprogramma schrijft als { $file }.

js-adv-export-csv-title = Reproduceerbaarheidstabel

js-adv-export-ephemeris-checking = Er wordt gecontroleerd welke efemeridenformaten deze run kan exporteren…

js-adv-export-ephemeris-waiting = De efemeridenexports verschijnen hier zodra de engine is geladen.

js-adv-export-json-desc = De volledige uitvoer van de engine voor deze run, inclusief eenheden en herkomst.

js-adv-export-json-title = Volledig resultaatdocument

js-adv-export-large-not-recorded = Deze export is groot en is daarom niet vastgelegd. Hij vereist de live engine.

js-adv-export-oem-desc = CCSDS OEM 2.0 (Orbit Ephemeris Message) voor GMAT, Orekit of STK

js-adv-export-omm-desc = CCSDS OMM-catalogus (Orbit Mean-elements Message)

js-adv-export-report-desc = Eén offlinebestand: samenvatting, kwaliteitsmaten met hun niveaus, elke grafiek en de exacte scenariotekst, gestempeld met engineversie en scenario-hash.

js-adv-export-report-title = Reproduceerbaar rapport

js-adv-export-sp3-desc = SP3-c-precisie-efemeride van deze constellatie

js-adv-export-toml-desc = De exacte invoer van deze run. Voer hem overal opnieuw uit met het opdrachtregelprogramma of de Python- en npm-pakketten.

js-adv-export-toml-title = Scenariobestand

js-adv-export-too-large = { $desc }. Te groot om vast te leggen: vereist de live engine.

js-adv-field-find-match =
    { $n ->
        [one] { $n } begeleid besturingselement en { $fields } van { $total } velden komen overeen met “{ $query }”.
       *[other] { $n } begeleide besturingselementen en { $fields } van { $total } velden komen overeen met “{ $query }”.
    }

js-adv-field-find-none = Geen veld van dit scenario komt overeen met “{ $query }”. Doorzoek alle scenario's met de bibliotheekzoekfunctie.

js-adv-field-hit-in = in { $title }

js-adv-field-not-single-number = Dat veld is in dit scenario geen enkel getal: bewerk het in de bron.

js-adv-field-opened = Geopend bij { $field }. Wijzig het en het scenario wordt opnieuw uitgevoerd.

js-adv-fields-matching = Velden die overeenkomen met “{ $query }”

js-adv-fields-more = nog { $n }: verfijn de woorden of zoek op het startscherm.

js-adv-fields-top-level = hoogste niveau

js-adv-filter-check-tuning = afstemming controleren

js-adv-filter-consistent = consistent

js-adv-from-the-link = uit de link

js-adv-geo-sub = { $name } · { $shown } van { $total } objecten getekend · vastgelegd met de native engine

js-adv-geo-title = GeoJSON-export: { $name }

js-adv-gt-note = Gemarkeerd: satelliet zichtbaar vanaf het station.

js-adv-gt-note-both = Gemarkeerd: satelliet zichtbaar vanaf het station. Maximale elevatie { $elevation }°. Maximale Doppler { $doppler } Hz.

js-adv-gt-note-doppler = Gemarkeerd: satelliet zichtbaar vanaf het station. Maximale Doppler { $doppler } Hz.

js-adv-gt-note-elevation = Gemarkeerd: satelliet zichtbaar vanaf het station. Maximale elevatie { $elevation }°.

js-adv-heatmap-label = Heatmap van { $metric }

js-adv-hist-runs-count =
    { $n ->
        [one] { $n } run.
       *[other] { $n } runs.
    }

js-adv-history-pin = Vastzetten

js-adv-history-restore = Herstellen

js-adv-history-run-time = run { $run } · { $time }

js-adv-holdover-engine-figure = Holdover van de engine bij het scenariobudget: { $duration }

js-adv-holdover-engine-figure-budget = Holdover van de engine bij het scenariobudget ({ $budget } { $unit }): { $duration }

js-adv-holdover-error-after-loss = fout nadat GNSS verloren ging op t = { $loss } s

js-adv-holdover-error-since-fix = fout sinds de laatste positiebepaling

js-adv-holdover-stays-inside = blijft binnen dit budget gedurende de hele registratie

js-adv-holdover-until-breached = tot het budget wordt overschreden

js-adv-honesty-modelled = Fysica uit eerste principes, met tests, nog niet getoetst aan een externe onafhankelijke referentie. { $text }

js-adv-honesty-partner = Cijfers die van een partner zijn. { $text }

js-adv-honesty-validated = Getoetst aan een onafhankelijke externe referentie. { $text }

js-adv-increase-field = { $field } verhogen

js-adv-install-version = v{ $version } installeren

js-adv-interop-no-file = De engine schreef voor deze run geen bestand in dit formaat.

js-adv-interop-not-applicable = Is niet van toepassing op dit scenario: { $reason }.

js-adv-interop-not-bundled = Hier niet meegeleverd (grootte): de opdracht hierboven schrijft het.

js-adv-interop-note = De engine schrijft de geometrie en de signaalsamples van een run in formaten die andere hulpmiddelen openen: CZML voor Cesium, KML (Keyhole Markup Language) voor Google Earth, GeoJSON voor kaarten, STK-efemeridebestanden (.e) en SigMF-opnamen (Signal Metadata Format). De browserbuild bevat deze schrijvers niet, dus de bestanden hieronder zijn die welke de native opdrachtregelengine voor het meegeleverde scenario schreef.

js-adv-js-range-label = J/S-bereik

js-adv-js-range-value = { $low } tot { $high } dB

js-adv-json-copied = JSON gekopieerd.

js-adv-kind-default = kind: clock holdover (de standaard)

js-adv-kind-label = kind: { $kind }

js-adv-kpi-check = Controle

js-adv-kpi-delta-since-run = { $arrow } { $change } sinds run { $run }

js-adv-kpi-fail = Mislukt

js-adv-kpi-first-run = eerste run

js-adv-kpi-not-in-previous = niet in uw vorige run

js-adv-kpi-pass = Geslaagd

js-adv-lib-count-all = { $scenarios } scenario's · { $domains } domeinen

js-adv-lib-count-filtered = { $n } van { $total } scenario's

js-adv-lib-no-match = Geen scenario of veld komt overeen. Probeer een woord als jamming, klok, maan, baan, masker of PDOP.

js-adv-loaded-shared = Een gedeeld scenario uit de link geladen.

js-adv-mask-envelope = Tijdfoutomhullende voor holdover ({ $source })

js-adv-mask-exceeded-after = overschreden na { $duration }

js-adv-mask-limit-label = limiet { $limit } ns

js-adv-mask-max-te = max |TE|

js-adv-mask-not-exceeded = niet overschreden

js-adv-matrix-counts = { $validated } van { $total }

js-adv-matrix-line = { $counts } mogelijkheden getoetst aan onafhankelijke externe referenties · { $modelled } gemodelleerd · { $partner } in handen van partners

js-adv-max-close = Sluiten

js-adv-max-close-label = Volledig scherm sluiten

js-adv-max-expand = Uitvouwen

js-adv-max-expand-label = Dit paneel uitvouwen naar volledig scherm

js-adv-max-title = Dit paneel op volledig scherm tonen (Escape sluit het)

js-adv-meta-engine = engine

js-adv-meta-file = bestand

js-adv-meta-scenario = scenario

js-adv-meta-seed = seed

js-adv-meta-time = tijd

js-adv-mission-timeline = Missietijdlijn

js-adv-native-edited-notice = { $why } De vastgelegde run is van het meegeleverde bestand, dus een bewerkte kopie kan hier niet worden getoond: voer die uit met het opdrachtregelprogramma, of gebruik Herstellen om de opname te zien.

js-adv-native-notice-command = { $why } Wat u ziet is een run die is vastgelegd met de native opdrachtregelengine v{ $version } door { $command } uit te voeren, ongewijzigd getoond. Hij wordt niet opnieuw uitgevoerd als u bewerkt.

js-adv-native-notice-plain = { $why } Wat u ziet is een run die is vastgelegd met de native opdrachtregelengine v{ $version }, ongewijzigd getoond. Hij wordt niet opnieuw uitgevoerd als u bewerkt.

js-adv-native-notice-platform = { $why } Wat u ziet is een run die is vastgelegd met de native opdrachtregelengine v{ $version } ({ $platform }), ongewijzigd getoond. Hij wordt niet opnieuw uitgevoerd als u bewerkt.

js-adv-native-notice-platform-command = { $why } Wat u ziet is een run die is vastgelegd met de native opdrachtregelengine v{ $version } ({ $platform }) door { $command } uit te voeren, ongewijzigd getoond. Hij wordt niet opnieuw uitgevoerd als u bewerkt.

js-adv-needs-live-engine = Dit vereist de live engine.

js-adv-needs-newer-engine-status = Vereist een nieuwere engine.

js-adv-nees-line = NEES { $mean } (95%-band { $low }–{ $high }, doel 2.0)

js-adv-newer-engine-edited-notice = Dit scenario vereist engine { $need } of nieuwer; de engine die hier draait is v{ $version }. Alleen de opname van het meegeleverde bestand kan worden getoond: gebruik Herstellen om die te zien, of voer een bewerkte kopie uit met engine { $need }.

js-adv-newer-engine-no-recording = Dit scenario vereist engine { $need } of nieuwer; de engine die hier draait is v{ $version }. Hier is er geen opname van.

js-adv-newer-engine-shown-commit = Dit scenario vereist engine { $need } of nieuwer; de engine die hier draait is v{ $version }. Wat u ziet is de run die is vastgelegd met een enginebuild op commit { $commit }, ongewijzigd getoond; hij wordt hier niet opnieuw uitgevoerd.

js-adv-newer-engine-shown-version = Dit scenario vereist engine { $need } of nieuwer; de engine die hier draait is v{ $version }. Wat u ziet is de run die is vastgelegd met engine v{ $recorded }, ongewijzigd getoond; hij wordt hier niet opnieuw uitgevoerd.

js-adv-nis-line = NIS { $mean } (95%-band { $low }–{ $high }, doel 1.0)

js-adv-no-guided-controls = Dit scenario heeft geen van de begeleide besturingselementen. Gebruik Alle velden of bewerk de bron.

js-adv-no-numeric-fields = Geen afzonderlijke numerieke velden om hier af te stemmen. Bewerk de bron rechtstreeks.

js-adv-no-recorded-run = Er is geen vastgelegde run voor dit scenario. Het vereist de live engine.

js-adv-no-summary = (dit scenario publiceert geen samenvatting in één regel)

js-adv-noise-floor = ruisvloer { $level }

js-adv-not-in-browser-status = Dit scenario draait niet in de browser.

js-adv-open-and-run = Openen en uitvoeren

js-adv-open-at-field = openen bij dit veld

js-adv-opened-from-simple = Geopend met de instellingen die u in de eenvoudige weergave hebt gewijzigd.

js-adv-optional-preset = optionele voorinstelling: scenarios/{ $file }

js-adv-orbit-canvas-label = Interactieve 3D-weergave van het gepropageerde spoor

js-adv-orbit-fallback-alt = Orthografische weergave van het gepropageerde spoor

js-adv-orbit-note-epoch = Sleep om te draaien, scrol of knijp om te zoomen. Aarde op schaal, NASA Blue Marble-beeldmateriaal. Gedraaid naar de epoch van de run.

js-adv-orbit-note-no-epoch = Sleep om te draaien, scrol of knijp om te zoomen. Aarde op schaal, NASA Blue Marble-beeldmateriaal. Deze run vermeldt geen epoch, dus de rotatiehoek van de aarde is hier niet zinvol.

js-adv-orbit-static-note = Statische weergave (de 3D-bibliotheek kon hier niet worden geladen).

js-adv-pal-commands = Opdrachten

js-adv-pal-domain = Domein: { $name }

js-adv-pal-domains = Domeinen

js-adv-pal-field = Veld: { $name }

js-adv-pal-fields = Velden

js-adv-pal-nothing = Niets komt overeen

js-adv-pal-opens-page = opent een pagina

js-adv-pal-page = Pagina: { $name }

js-adv-pal-pages = Pagina's

js-adv-pal-panel = Paneel: { $name }

js-adv-pal-panels = Panelen

js-adv-pal-scenarios = Scenario's

js-adv-params-hint-all = Elk afzonderlijk getal in het scenario. Verhoog of verlaag het in stappen, typ het in of gebruik de pijltjestoetsen; het scenario wordt opnieuw uitgevoerd.

js-adv-params-hint-guided = Sleep een schuifregelaar en het scenario wordt opnieuw uitgevoerd. Elk besturingselement schrijft rechtstreeks in de scenariotekst hieronder.

js-adv-pin-already = Die run is al vastgezet.

js-adv-pin-first = Run { $run } vastgezet. Wijzig een parameter, voer opnieuw uit en zet die run ook vast.

js-adv-pin-label = { $letter } · { $title } · run { $run }

js-adv-pin-opening-compare =
    { $n ->
        [one] { $n } run vastgezet. Vergelijken wordt geopend.
       *[other] { $n } runs vastgezet. Vergelijken wordt geopend.
    }

js-adv-plan-view = Bovenaanzicht

js-adv-plan-view-epoch = op { $epoch }

js-adv-plan-view-note = Elke stip is een lichaam op de epoch van de run en elke curve is het baanspoor dat de engine ervoor berekende. Een gestippelde lijn is een link die het scenario vraagt. Kies een planeet om de manen eromheen te zien.

js-adv-player-name-mission = missie-replay

js-adv-player-name-orbit = baanreplay

js-adv-player-name-replay = replay

js-adv-player-name-waterfall = waterfall-replay

js-adv-player-pause = De { $name } pauzeren

js-adv-player-play = De { $name } afspelen

js-adv-player-position = Positie in de { $name }

js-adv-png-download-title = Bitmap met hoge resolutie voor dia's en documenten

js-adv-png-export-failed = PNG-export mislukt: { $reason }

js-adv-ready-live = Gereed. Draait lokaal in uw browser.

js-adv-ready-recorded = Gereed. Vastgelegde runs worden getoond.

js-adv-receiver-at-time = Ontvanger op t = { $time }

js-adv-recorded-edit-notice = WebAssembly is op deze pagina geblokkeerd, dus deze pagina toont echte runs van de meegeleverde scenario's, vastgelegd met engine v{ $version }. Bewerkte scenario's, sweeps en nieuwe exports vereisen de live engine: open kshana.dev, of serveer deze map lokaal. Herstellen zet het vastgelegde scenario terug.

js-adv-recorded-edited-warning = U hebt het scenario bewerkt: deze opname is van het meegeleverde bestand, niet van uw bewerking. Voer de opdracht uit op uw eigen bestand om de uwe te krijgen.

js-adv-recorded-intro = WebAssembly is op deze pagina geblokkeerd, dus deze pagina toont echte runs van de meegeleverde scenario's, vastgelegd met engine v{ $version }. Bewerken, sweeps en nieuwe exports vereisen de live engine op kshana.dev.

js-adv-recorded-run-native = vastgelegde run, native engine

js-adv-recorded-written-by = Geschreven door de native opdrachtregelengine v{ $version } ({ $platform }) met { $command }. Ongewijzigd getoond.

js-adv-replay = Replay

js-adv-report-downloaded = Rapport gedownload.

js-adv-report-frame-title = Runrapport geschreven door de engine

js-adv-report-html = Rapport (HTML)

js-adv-report-html-title = Het rapportbestand, zoals de engine het schreef

js-adv-report-load-failed = Het vastgelegde rapport kon niet worden geladen ({ $reason }).

js-adv-report-loading = Het vastgelegde rapport wordt geladen…

js-adv-report-none = Er is geen vastgelegd rapport voor dit scenario.

js-adv-report-note = Elke run via de opdrachtregel schrijft een rapport: samenvatting, invoer, resultaten, de grafiek, wat is getoetst en wat is gemodelleerd, en een reproduceerbaarheidsrecord. De browserbuild bevat die schrijver niet, dus dit is het rapport dat de native opdrachtregelengine voor het meegeleverde scenario schreef. Het eigen rapport van de Studio over de run op het scherm staat onder Exports.

js-adv-report-open-tab = Openen in een nieuw tabblad

js-adv-report-open-tab-title = Het rapport afzonderlijk openen

js-adv-report-orbit-title = Baan (aardgecentreerd inertiaal, orthografisch)

js-adv-report-stability-chart = Klokstabiliteit

js-adv-report-stability-title = Klokstabiliteit (Allan-deviatie)

js-adv-restored-run = Run { $run } hersteld.

js-adv-result = Resultaat

js-adv-run-cancelled = Run geannuleerd.

js-adv-run-cancelled-previous = Run geannuleerd. Het vorige resultaat wordt nog getoond.

js-adv-run-failed = Run mislukt. Zie het bericht in de resultaten.

js-adv-scenario-copied = Scenario gekopieerd.

js-adv-scenarios-count = { $n } scenario's

js-adv-share-link-copied = Deellink gekopieerd. Hij bevat het exacte scenario.

js-adv-share-link-in-bar = Link in de adresbalk geplaatst.

js-adv-shared-link = gedeelde link

js-adv-shared-needs-live = Deze link bevat een eigen scenario, dat de live engine vereist. Open hem op kshana.dev.

js-adv-shared-scenario = Gedeeld scenario

js-adv-shared-scenario-question = Een scenario dat is geopend via een deellink. Het draait precies zoals het is gedeeld.

js-adv-solar-bodies-label = Welke lichamen te tekenen

js-adv-spectrum-part-label = Welk deel van het spectrum

js-adv-spectrum-row-note = Het spectrum langs de waterfallrij waarop de replay zich bevindt.

js-adv-spectrum-row-title = Spectrum langs de getoonde rij

js-adv-start-field-meta = { $domain } · veld { $field }

js-adv-start-fields-hint = Elk opent het scenario met dat besturingselement gemarkeerd, klaar om te wijzigen.

js-adv-start-fields-named =
    { $n ->
        [one] Velden met een naam als “{ $query }”: in { $n } scenario
       *[other] Velden met een naam als “{ $query }”: in { $n } scenario's
    }

js-adv-start-more-matches = nog { $n } treffers: voeg een woord toe om ze te beperken.

js-adv-start-nothing = Niets komt overeen met “{ $query }”. Probeer een woord als jamming, klok, maan, baan, masker of PDOP.

js-adv-start-scenarios-count = Scenario's ({ $count })

js-adv-status-fetching-recorded = Engine wordt geladen… Het vastgelegde resultaat van dit scenario wordt opgehaald.

js-adv-status-ran-locally = Lokaal uitgevoerd om { $time }, run { $run }.

js-adv-status-ran-locally-secs = Lokaal uitgevoerd om { $time }, run { $run }, { $secs } s.

js-adv-status-recorded-native = Vastgelegde run getoond om { $time } (native engine).

js-adv-status-recorded-needs-engine = Vastgelegde run getoond om { $time } (vereist engine { $need }).

js-adv-status-recorded-shown = Vastgelegde run getoond om { $time }, run { $run }.

js-adv-status-recorded-shown-secs = Vastgelegde run getoond om { $time }, run { $run }, { $secs } s.

js-adv-status-showing-recorded = Engine wordt geladen… Het vastgelegde resultaat van dit scenario wordt getoond totdat de live engine gereed is.

js-adv-subtabs-label = Tegels van deze weergave (telefoon)

js-adv-suggest-campaign = Een missie met jamming, spoofing en holdover opnieuw afspelen

js-adv-suggest-coverage = De dekking van vier GNSS-constellaties (global navigation satellite system) in kaart brengen

js-adv-suggest-holdover = Holdovertijd als GNSS verloren gaat

js-adv-suggest-waterfall = Een jammer volgen op de L-band-waterfall

js-adv-svg-download-title = Vectorgrafiek met titel en herkomst

js-adv-sweep-cancelled = Sweep geannuleerd.

js-adv-sweep-done-grid = { $total } runs ({ $columns } × { $rows }) lokaal gesweept in { $time }.

js-adv-sweep-done-line = { $done } van { $total } runs lokaal gesweept in { $time }.

js-adv-sweep-enter-range = Voer een numeriek bereik in.

js-adv-sweep-enter-range-second = Voer een numeriek bereik in voor de tweede parameter.

js-adv-sweep-failed = Sweep mislukt: { $reason }

js-adv-sweep-interrupted = Sweep onderbroken door een nieuwe run.

js-adv-sweep-needs-live = Een sweep voert de engine vele malen uit, dus de live engine is vereist.

js-adv-sweep-none-line-chart = Geen (lijngrafiek)

js-adv-sweep-nothing = Niets om te sweepen voor dit scenario.

js-adv-sweep-progress = Sweepen: run { $n } van { $total }…

js-adv-sweep-status-done = { $total } runs gesweept om { $time }.

js-adv-sweep-title-grid = { $metric } over { $first } en { $second }

js-adv-sweep-title-line = { $metric } tegenover { $parameter }

js-adv-sweep-wait = Wacht tot de huidige run klaar is en sweep dan.

js-adv-tab-animation = Animatie

js-adv-tab-compare = Vergelijken

js-adv-tab-engine-report = Enginerapport

js-adv-tab-exports-report = Exports & rapport

js-adv-tab-ground-track = Grondspoor

js-adv-tab-holdover = Holdover

js-adv-tab-orbit-3d = 3D-baan

js-adv-tab-overview = Overzicht

js-adv-tab-signal-band = Signaal & band

js-adv-tab-stability = Stabiliteit

js-adv-tab-sweep = Sweep

js-adv-tab-time-series = Tijdreeks

js-adv-tab-timing-masks = Tijdsynchronisatiemaskers

js-adv-th-at-tau-or-time = Bij τ of tijd

js-adv-th-body = Lichaam

js-adv-th-clock = Klok

js-adv-th-distance-sun = Afstand tot de zon

js-adv-th-figure = Kwaliteitsmaat

js-adv-th-file = Bestand

js-adv-th-format = Formaat

js-adv-th-key-figure = Kerncijfer

js-adv-th-light-time-from = Enkele lichttijd vanaf { $observer }

js-adv-th-light-time-observer = Enkele lichttijd vanaf de waarnemer

js-adv-th-limit = Limiet

js-adv-th-margin = Marge

js-adv-th-mask-or-budget = Masker of budget

js-adv-th-metric = Maat

js-adv-th-orbital-period = Omlooptijd

js-adv-th-provenance = Herkomst

js-adv-th-size = Grootte

js-adv-th-source = Bron

js-adv-th-tier = Niveau

js-adv-th-unit = Eenheid

js-adv-th-value = Waarde

js-adv-th-verdict = Oordeel

js-adv-th-what-it-is = Wat het is

js-adv-the-body = het lichaam

js-adv-tile-scenario-count =
    { $n ->
        [one] { $n } scenario
       *[other] { $n } scenario's
    }

js-adv-timeline-chart-title = Missietijdlijn: { $title }

js-adv-timeline-latest-event = Laatste gebeurtenis, om { $time }: { $label }

js-adv-timeline-no-event = Nog geen gebeurtenis op dit tijdstip.

js-adv-timeline-note = Eén scrubber stuurt elke grafiek hieronder aan. Elke fase voert gewone scenario's uit; de campagne leest hun uitvoer op één tijdraster. Gearceerde banden zijn de fasen, verticale lijnen de gebeurtenissen. De waarden hierboven zijn de kanalen van de campagne op het replaytijdstip.

js-adv-timeline-on-one-clock = { $duration } op één klok

js-adv-timeline-phase = Fase: { $phase }

js-adv-tour-back = Terug

js-adv-tour-done = Klaar

js-adv-tour-eyebrow = Rondleiding

js-adv-tour-headline-body = De samenvatting in één regel, de engineversie en de vingerafdruk van het scenario, en of elke kwaliteitsmaat is getoetst of gemodelleerd.

js-adv-tour-headline-title = Lees het antwoord

js-adv-tour-keyboard-body = ⌘K vindt elk scenario, elke weergave of opdracht. [ en ] schakelen tussen weergaven.

js-adv-tour-keyboard-title = Alles via het toetsenbord

js-adv-tour-library-body = Elk meegeleverd scenario, gegroepeerd per missiedomein: jamming, spectrum, spoofing, klokken, navigatie, integriteit, banen, constellatieontwerp, navigatie in een lage baan om de aarde, campagnes, de Maan, Mars en het zonnestelsel. Zoek met /.

js-adv-tour-library-title = Kies een missie

js-adv-tour-next = Volgende

js-adv-tour-params-body = Begeleide schuifregelaars voor de gangbare instellingen, of elk numeriek veld in het scenario. Elke wijziging voert opnieuw uit.

js-adv-tour-params-title = Stem het af

js-adv-tour-pin-body = Zet maximaal vier runs vast en bekijk ze naast elkaar, met verschillen en een verschilspoor.

js-adv-tour-pin-title = Runs vergelijken

js-adv-tour-run-body = De Rust-engine draait in uw browser als WebAssembly. Er wordt niets geüpload. ⌘↵ voert overal uit.

js-adv-tour-run-title = Voer het lokaal uit

js-adv-tour-share-body = Download het rapport, het resultaat, het scenario en de exports van de engine, kopieer een link met het exacte scenario, of een iframe voor een cursuspagina of wiki.

js-adv-tour-share-title = Delen of exporteren

js-adv-tour-skip = Overslaan

js-adv-tour-source-body = Het volledige scenario in TOML. Wat u uitvoert is precies wat u kunt delen en reproduceren.

js-adv-tour-source-title = Of bewerk alles

js-adv-tour-tabs-body = Weergaven verschijnen wanneer het resultaat ze ondersteunt: signaal en band voor jamming, de waterfall voor spectrum, de missietijdlijn voor campagnes, dekkingskaarten voor constellaties, holdover voor klokken, maskers voor telecomtijdsynchronisatie, 3D-banen, grondsporen, sweeps, en de eigen animatie en het eigen rapport van de engine.

js-adv-tour-tabs-title = Elke weergave van de run

js-adv-tracking-threshold-value = Volgdrempel { $value }

js-adv-transport-label = Replay: één scrubber stuurt elk paneel van deze run aan

js-adv-transport-sub = één scrubber stuurt elk paneel van deze run aan

js-adv-unpin-run = Run { $run } losmaken

js-adv-waterfall = Waterfall

js-adv-waterfall-note = Kleur is vermogen boven de ruisvloer van de ontvanger. De navigatiesignalen liggen onder die vloer, dus wat oplicht zijn de jammers. Speel de replay af of sleep erdoorheen, en de banden rechts tonen wat de ontvanger op dat moment nog volgt.

js-adv-waterfall-sub = spectrale vermogensdichtheid: frequentie horizontaal, tijd naar beneden

js-adv-waterfall-title = Waterfall, { $name }

js-adv-webassembly-unavailable = WebAssembly niet beschikbaar

js-app-all-questions = Alle vragen

js-app-anim-frame-title = Animatie van deze run, geschreven door de engine

js-app-anim-html-player = HTML-speler

js-app-anim-html-player-title = De speler in één bestand, zoals de engine hem schreef

js-app-anim-load-failed = De vastgelegde animatie kon niet worden geladen ({ $reason }).

js-app-anim-loading = De vastgelegde animatie wordt geladen…

js-app-anim-none = Er is geen vastgelegde animatie voor dit scenario.

js-app-anim-note = De engine schrijft een animatie van elke run met een tijdas: een zelfspelende SVG en een HTML-speler in één bestand met eigen afspeel- en scrubbesturing. De browserbuild bevat die schrijver niet, dus dit is het bestand dat de native opdrachtregelengine voor het meegeleverde scenario schreef.

js-app-anim-svg = Geanimeerde SVG

js-app-anim-svg-title = De zelfspelende SVG, zoals de engine hem schreef

js-app-axis-averaging-time = middelingstijd τ (s)

js-app-axis-observation-interval = observatie-interval τ (s)

js-app-axis-value = waarde

js-app-badge-modelled = { $n } gemodelleerd

js-app-badge-recorded = Vastgelegd

js-app-badge-validated = { $n } getoetst

js-app-band-carrier = Draaggolf

js-app-band-carrier-unset = niet ingesteld in dit scenario

js-app-band-chip-rate = Chipsnelheid

js-app-band-jammer-bandwidth = Bandbreedte van de jammer

js-app-band-jammer-mhz = jammer { $mhz } MHz

js-app-band-jammer-power = Vermogen van de jammer

js-app-band-jammer-type = Type jammer

js-app-band-main-lobe = hoofdlob van het signaal

js-app-band-no-carrier-note = De engine berekent de jammer-signaalverhouding uit het linkbudget. Dit scenario noemt geen draaggolffrequentie, dus er wordt geen spectrum getekend.

js-app-band-satellites = Satellieten

js-app-band-svg-label = Signaal- en jammerbanden rond de draaggolf

js-app-band-tracking-threshold = Volgdrempel

js-app-browse-all-title = Alle { $n } scenario's

js-app-browse-area-kicker =
    { $n ->
        [one] Gebied · { $n } scenario
       *[other] Gebied · { $n } scenario's
    }

js-app-browse-area-lede = Kies er één: het opent meteen op zijn resultaat.

js-app-browse-evidence = De enginemethoden die de scenario's uitvoeren hebben { $validated } getoetste en { $modelled } gemodelleerde rijen in de verificatiematrix.

js-app-browse-evidence-title = Het bewijs achter dit gebied.

js-app-browse-kicker = Bladeren

js-app-browse-lede = Zoek, of kies een gebied. Elk scenario opent meteen op zijn resultaat.

js-app-browse-validated-examples = Getoetst, bijvoorbeeld: { $examples }.

js-app-browser-cannot-run = De browserbuild kan dit scenario niet uitvoeren.

js-app-btn-all-exports = Alle exports

js-app-btn-all-exports-title = Elke export van deze run, inclusief de eigen formaten van de engine

js-app-btn-compare-pinned = Vastgezette runs vergelijken
