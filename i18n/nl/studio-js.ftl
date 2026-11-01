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

js-adv-lib-count-all =
    { $scenarios ->
        [one] { $scenarios } scenario
       *[other] { $scenarios } scenario's
    } · { $domains ->
        [one] { $domains } domein
       *[other] { $domains } domeinen
    }

js-adv-lib-count-filtered =
    { $total ->
        [one] { $n } van { $total } scenario
       *[other] { $n } van { $total } scenario's
    }

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

js-adv-scenarios-count =
    { $n ->
        [one] { $n } scenario
       *[other] { $n } scenario's
    }

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

js-adv-start-more-matches =
    { $n ->
        [one] nog { $n } treffer: voeg een woord toe om hem te beperken.
       *[other] nog { $n } treffers: voeg een woord toe om ze te beperken.
    }

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

js-app-btn-copy-embed = Insluitcode kopiëren

js-app-btn-copy-link = Een link naar precies dit scenario kopiëren

js-app-btn-figure-png = Figuur (PNG)

js-app-btn-figure-png-title = De grafiek op het scherm als bitmap met hoge resolutie

js-app-btn-figure-svg = Figuur (SVG)

js-app-btn-figure-svg-title = De grafiek op het scherm, met titel, engineversie en DOI

js-app-btn-pin-compare = Deze run vastzetten om te vergelijken

js-app-btn-pin-count = Deze run vastzetten ({ $n } vastgezet)

js-app-btn-report-html = Reproduceerbaar rapport (HTML)

js-app-btn-report-html-title = Eén offlinebestand: samenvatting, kwaliteitsmaten met niveaus, grafieken en het exacte scenario

js-app-btn-result-json = Resultaatgegevens (JSON)

js-app-btn-result-json-title = De volledige uitvoer van de engine voor deze run

js-app-btn-run-history = Runhistorie

js-app-btn-scenario-toml = Scenariobestand (TOML)

js-app-btn-scenario-toml-title = De exacte invoer van deze run

js-app-btn-table-csv = Tabel (CSV)

js-app-btn-table-csv-title = Dezelfde bytes die het opdrachtregelprogramma schrijft als { $file }

js-app-bytes =
    { $n ->
        [one] { $n } byte
       *[other] { $n } bytes
    }

js-app-cap-sub = { $areas } gebieden, { $total } direct uitvoerbare scenario's. Elk gebied toont een echt vastgelegd resultaat en de mix van bewijs erachter: het aandeel van zijn enginemethoden dat is getoetst aan een externe referentie.

js-app-chain-hint = de uitvoer van elke fase voedt de volgende

js-app-chain-note = Eén systeem, gevolgd door elke fase van de engine. De tabel hieronder toont elk getal dat een fase berekende en de volgende fase gebruikte.

js-app-chain-stage = Fase { $n }

js-app-chain-values-handed =
    { $n ->
        [one] { $n } waarde doorgegeven
       *[other] { $n } waarden doorgegeven
    }

js-app-chart-allan-deviation = Allan-deviatie

js-app-chart-cn0-by-satellite = Effectieve C/N0 per satelliet

js-app-chart-default-title = Kshana-grafiek

js-app-chart-ground-track = Grondspoor

js-app-chart-holdover-title = Holdover tegenover een tijdsynchronisatiebudget

js-app-chart-mtie-title = MTIE (maximale tijdsintervalfout)

js-app-chart-not-drawn = Deze grafiek kon niet worden getekend.

js-app-chart-scenario-hash = scenario { $hash }

js-app-chart-stability-title = Klokstabiliteit (overlappende Allan-deviatie)

js-app-chart-tdev-title = TDEV (tijdsdeviatie)

js-app-chip-failed-title = WebAssembly kon hier niet starten. Er worden echte vastgelegde runs van de meegeleverde scenario's getoond.

js-app-chip-failed-title-reason = WebAssembly kon hier niet starten ({ $reason }). Er worden echte vastgelegde runs van de meegeleverde scenario's getoond.

js-app-chip-live = Live engine · v{ $version }

js-app-chip-live-title = De Kshana-engine draait in deze browser als WebAssembly

js-app-chip-loading = Engine wordt geladen

js-app-chip-loading-title = De engine wordt gedownload. Intussen worden vastgelegde resultaten getoond.

js-app-chip-recorded = Vastgelegde runs · v{ $version }

js-app-chip-unavailable = Engine niet beschikbaar

js-app-cli-note = Installeer met { $command }. De run schrijft { $file }, een grafiek en een rapport.

js-app-cli-only-title = Deze draait op de opdrachtregel, niet in de browser.

js-app-cli-save-comment = # sla het scenariobestand hieronder op als { $file } en voer dan uit:

js-app-cmd-advanced = Elke instelling tonen (geavanceerde instellingen)

js-app-cmd-browse = Alle scenario's doorbladeren

js-app-cmd-compare = De vastgezette runs vergelijken

js-app-cmd-embed = Insluitcode kopiëren

js-app-cmd-exports = De resultaten downloaden (exports)

js-app-cmd-history = Runhistorie openen

js-app-cmd-home = Naar het openingsscherm gaan

js-app-cmd-how = Hoe dit wordt berekend

js-app-cmd-pin = Deze run vastzetten om te vergelijken

js-app-cmd-report = Het rapport downloaden

js-app-cmd-research = Code, gegevens en citatie (voor onderzoekers)

js-app-cmd-reset = De scenariotekst herstellen

js-app-cmd-run = Het scenario uitvoeren

js-app-cmd-share = Deellink kopiëren

js-app-cmd-theme = Wisselen tussen licht en donker

js-app-cmd-tour = De rondleiding starten

js-app-compare-deltas = De verschillen zijn ten opzichte van run A. Groen markeert de betere waarde per kwaliteitsmaat.

js-app-compare-none = Deze runs delen geen vergelijkbare kwaliteitsmaten. Zet runs van dezelfde scenariofamilie vast om getallen en verschillen te zien.

js-app-compare-pin-two = Zet ten minste twee runs vast om ze naast elkaar te vergelijken. Zet een run vast, wijzig een parameter of kies een ander scenario van dezelfde familie, voer het uit en zet opnieuw vast.

js-app-compare-run-head = { $letter } · run { $id }

js-app-coverage-cell-note = Elke cel is één rasterpunt op { $body }, gescoord over elke epoch van de run.

js-app-coverage-dots-of = van

js-app-coverage-dots-post = satellieten, gevlogen langs hun grondsporen; speel de replay af om ze te verplaatsen.

js-app-coverage-dots-pre = De stippen zijn

js-app-coverage-field-label = Te tonen veld op de kaart

js-app-coverage-map = Dekkingskaart

js-app-coverage-map-select = Kaart

js-app-coverage-over = boven

js-app-coverage-title = { $field } boven { $body }

js-app-crumb-all-scenarios = Alle scenario's

js-app-crumb-area = Gebied

js-app-crumb-search = Zoeken: { $query }

js-app-crumb-studio = Studio

js-app-download-label = Downloaden

js-app-edited-cli-only = Bewerkt: dit scenario draait alleen in de opdrachtregelengine.

js-app-edited-needs-engine = Bewerkt: vereist engine { $need }.

js-app-edited-needs-live = Bewerkte scenario's vereisen de live engine.

js-app-embed-copied = Insluitcode gekopieerd.

js-app-engine-chart = Enginegrafiek

js-app-engine-chart-alt = Enginegrafiek voor deze run

js-app-engine-could-not-start = De engine kon niet starten: { $reason }. Serveer deze map via HTTP (bijvoorbeeld { $command }) in plaats van het bestand rechtstreeks te openen.

js-app-engine-failed = De engine kon niet worden geladen ({ $reason }).

js-app-engine-file-http = Het enginebestand gaf HTTP { $status } terug.

js-app-engine-no-recordings = De engine kon niet worden geladen ({ $reason }) en er zijn geen vastgelegde runs gevonden.

js-app-entries-count =
    { $n ->
        [one] { $n } item
       *[other] { $n } items
    }

js-app-ev-aria = { $validated } getoetste en { $modelled } gemodelleerde rijen van de verificatiematrix

js-app-ev-title = { $validated } getoetst · { $modelled } gemodelleerde rijen in de verificatiematrix

js-app-ev-validated = getoetst

js-app-export-card-title = Export { $format }

js-app-export-checking = Er wordt gecontroleerd welke efemeridenformaten deze run kan exporteren…

js-app-export-csv-desc = Dezelfde bytes die het opdrachtregelprogramma schrijft als { $file }.

js-app-export-csv-title = Reproduceerbaarheidstabel

js-app-export-engine-loading = De efemeridenexports verschijnen hier zodra de engine is geladen.

js-app-export-json-desc = De volledige uitvoer van de engine voor deze run, inclusief eenheden en herkomst.

js-app-export-json-title = Volledig resultaatdocument

js-app-export-not-recorded = Deze export is groot en is daarom niet vastgelegd. Hij vereist de live engine.

js-app-export-oem-desc = CCSDS OEM 2.0 (Orbit Ephemeris Message) voor GMAT, Orekit of STK

js-app-export-omm-desc = CCSDS OMM-catalogus (Orbit Mean-elements Message)

js-app-export-report-desc = Eén offlinebestand: samenvatting, kwaliteitsmaten met hun niveaus, elke grafiek en de exacte scenariotekst, gestempeld met engineversie en scenario-hash.

js-app-export-report-title = Reproduceerbaar rapport

js-app-export-sp3-desc = SP3-c-precisie-efemeride van deze constellatie

js-app-export-toml-desc = De exacte invoer van deze run. Voer hem overal opnieuw uit met het opdrachtregelprogramma of de Python- en npm-pakketten.

js-app-export-toml-title = Scenariobestand

js-app-export-too-large = { $desc }. Te groot om vast te leggen: vereist de live engine.

js-app-fields-more = nog { $n }

js-app-fields-none = geen

js-app-fields-none-hint = Geen andere afzonderlijke getallen om hier te wijzigen. Bewerk het bestand onder “Voor onderzoekers”.

js-app-fields-top-of-file = begin van het bestand

js-app-find-matches =
    { $n ->
        [one] { $n } begeleid besturingselement en { $m } van { $total } velden komen overeen met “{ $query }”.
       *[other] { $n } begeleide besturingselementen en { $m } van { $total } velden komen overeen met “{ $query }”.
    }

js-app-find-none = Geen veld van dit scenario komt overeen met “{ $query }”. Doorzoek alle scenario's met de bibliotheekzoekfunctie.

js-app-geo-sub = { $name } · { $features } van { $total } objecten getekend · vastgelegd met de native engine

js-app-geojson-title = GeoJSON-export: { $name }

js-app-gt-highlighted = Gemarkeerd: satelliet zichtbaar vanaf het station.

js-app-gt-peak-doppler = Maximale Doppler { $value } Hz.

js-app-gt-peak-elevation = Maximale elevatie { $value }°.

js-app-health-check-tuning = afstemming controleren

js-app-health-consistent = consistent

js-app-health-nees-band = NEES { $mean } (95%-band { $lo }–{ $hi }, doel 2.0)

js-app-health-nis-band = NIS { $mean } (95%-band { $lo }–{ $hi }, doel 1.0)

js-app-heat-map-label = Heatmap van { $metric }

js-app-hero-clock = { $elapsed } van { $total }

js-app-hero-mask = elevatiemasker van { $deg }°

js-app-hero-places =
    { $n ->
        [one] { $n } plaats
       *[other] { $n } plaatsen
    }

js-app-hero-positions-only = Alleen satellietposities: geen signaalvermogen, satellietstatus of terrein.

js-app-hero-ramp = { $lo } tot { $hi } { $field }

js-app-hero-ramp-over = { $lo } tot { $hi } { $field }, over { $duration }

js-app-hero-recorded-bare = Vastgelegd resultaat

js-app-hero-satellites =
    { $n ->
        [one] { $n } satelliet
       *[other] { $n } satellieten
    }

js-app-hero-steps =
    { $n ->
        [one] { $n } tijdstap
       *[other] { $n } tijdstappen
    }

js-app-hist-runs =
    { $n ->
        [one] { $n } run.
       *[other] { $n } runs.
    }

js-app-history-pin = Vastzetten

js-app-history-restore = Herstellen

js-app-history-restored = Run { $id } hersteld.

js-app-history-run = run { $id } · { $time }

js-app-hit-in-scenario = in { $title }

js-app-hit-native-note = vastgelegde run, native engine

js-app-hit-setting-meta = { $area } · instelling { $name }

js-app-ho-budget = budget

js-app-ho-engine-budget = Holdover van de engine bij het scenariobudget ({ $budget } { $unit }): { $duration }

js-app-ho-engine-budget-bare = Holdover van de engine bij het scenariobudget: { $duration }

js-app-ho-error-after-loss = fout nadat GNSS verloren ging op t = { $t } s

js-app-ho-error-since-fix = fout sinds de laatste positiebepaling

js-app-ho-stays-inside = blijft binnen dit budget gedurende de hele registratie

js-app-ho-until-breached = tot het budget wordt overschreden

js-app-hover-classical = klassiek

js-app-hover-quantum = kwantum

js-app-how-checks = (controleert: { $requirement })

js-app-how-matrix = De enginemethoden die dit scenario uitvoert hebben { $validated } getoetste en { $modelled } gemodelleerde rijen in de verificatiematrix:

js-app-how-matrix-partner = De enginemethoden die dit scenario uitvoert hebben { $validated } getoetste en { $modelled } gemodelleerde rijen in de verificatiematrix, en { $partner } in handen van partners:

js-app-how-mix-chip = { $validated } getoetst · { $modelled } gemodelleerd

js-app-how-more-notes =
    { $n ->
        [one] { $n } andere notitie uit het scenariobestand
       *[other] { $n } andere notities uit het scenariobestand
    }

js-app-how-more-rows =
    { $n ->
        [one] { $n } andere rij in de verificatiematrix (pagina Bewijs van de site).
       *[other] { $n } andere rijen in de verificatiematrix (pagina Bewijs van de site).
    }

js-app-how-no-header = Dit scenariobestand heeft geen koptekstnotitie. De samenvatting van de engine hieronder zegt wat er is uitgevoerd.

js-app-how-no-matrix-row = Nog geen enkele rij van de verificatiematrix noemt het enginetype van dit scenario.

js-app-how-no-sources = Het scenariobestand citeert geen bron, en geen getoetste matrixrij dekt zijn type.

js-app-how-own-label = Het eigen label van deze run: { $label }

js-app-how-per-figure = Per kwaliteitsmaat, uit het blok figure_tiers van de engine: { $validated } getoetst, { $modelled } gemodelleerd. Het niveau van elke kwaliteitsmaat staat in de weergave Overzicht.

js-app-install-copy = Kopiëren: { $command }

js-app-install-label = v{ $version } installeren

js-app-interop-no-file = De engine schreef voor deze run geen bestand in dit formaat.

js-app-interop-not-apply = Is niet van toepassing op dit scenario: { $reason }.

js-app-interop-not-bundled = Hier niet meegeleverd (grootte): de opdracht hierboven schrijft het.

js-app-interop-note = De engine schrijft de geometrie en de signaalsamples van een run in formaten die andere hulpmiddelen openen: CZML voor Cesium, KML (Keyhole Markup Language) voor Google Earth, GeoJSON voor kaarten, STK-efemeridebestanden (.e) en SigMF-opnamen (Signal Metadata Format). De browserbuild bevat deze schrijvers niet, dus de bestanden hieronder zijn die welke de native opdrachtregelengine voor het meegeleverde scenario schreef.

js-app-job-running = Bezig met uitvoeren

js-app-job-sweeping = Bezig met sweepen

js-app-js-range-label = J/S-bereik

js-app-js-range-value = { $lo } tot { $hi } dB

js-app-latest-event-at = Laatste gebeurtenis, om

js-app-legend-all = enginemogelijkheden zijn getoetst over de hele verificatiematrix; { $modelled } zijn gemodelleerd en { $partner } zijn in handen van partners.

js-app-legend-count = { $validated } van { $total }

js-app-load-failed = { $file } kon niet worden geladen.

js-app-mask-envelope = Tijdfoutomhullende voor holdover ({ $source })

js-app-mask-exceeded-after = overschreden na { $duration }

js-app-mask-limit = limiet { $value } ns

js-app-mask-not-exceeded = niet overschreden

js-app-meta-engine = engine

js-app-meta-file = bestand

js-app-meta-scenario = scenario

js-app-meta-seed = seed

js-app-meta-shared-link = gedeelde link

js-app-meta-time = tijd

js-app-mission-timeline = Missietijdlijn

js-app-native-edited-notice = De vastgelegde run is van het meegeleverde bestand, dus een bewerkte kopie kan hier niet worden getoond: voer die uit met het opdrachtregelprogramma, of gebruik Herstellen om de opname te zien.

js-app-native-recorded = Wat u ziet is een run die is vastgelegd met de native opdrachtregelengine v{ $version }, ongewijzigd getoond. Hij wordt niet opnieuw uitgevoerd als u bewerkt.

js-app-native-recorded-c = Wat u ziet is een run die is vastgelegd met de native opdrachtregelengine v{ $version } door { $command } uit te voeren, ongewijzigd getoond. Hij wordt niet opnieuw uitgevoerd als u bewerkt.

js-app-native-recorded-p = Wat u ziet is een run die is vastgelegd met de native opdrachtregelengine v{ $version } ({ $platform }), ongewijzigd getoond. Hij wordt niet opnieuw uitgevoerd als u bewerkt.

js-app-native-recorded-pc = Wat u ziet is een run die is vastgelegd met de native opdrachtregelengine v{ $version } ({ $platform }) door { $command } uit te voeren, ongewijzigd getoond. Hij wordt niet opnieuw uitgevoerd als u bewerkt.

js-app-needs-live-engine = Dit vereist de live engine.

js-app-needs-newer-engine = Vereist een nieuwere engine.

js-app-needs-newer-why = Dit scenario vereist engine { $need } of nieuwer; de engine die hier draait is v{ $version }.

js-app-no-chart-export = Deze weergave heeft geen grafiek om te exporteren.

js-app-no-event-yet = Nog geen gebeurtenis op dit tijdstip.

js-app-no-recorded-run = Er is geen vastgelegde run voor dit scenario. Het vereist de live engine.

js-app-no-recording-here = Hier is er geen opname van.

js-app-no-summary = (dit scenario publiceert geen samenvatting in één regel)

js-app-noise-floor = ruisvloer { $value }

js-app-not-in-browser = Dit scenario draait niet in de browser.

js-app-notice-shared-needs-live = Deze link bevat een eigen scenario, dat de live engine vereist. Open hem op kshana.dev.

js-app-on-one-clock = op één klok

js-app-only-bundled-recording = Alleen de opname van het meegeleverde bestand kan worden getoond: gebruik Herstellen om die te zien, of voer een bewerkte kopie uit met engine { $need }.

js-app-opening-result = Het resultaat wordt geopend…

js-app-orbit-canvas-label = Interactieve 3D-weergave van het gepropageerde spoor

js-app-orbit-epoch-set = Gedraaid naar de epoch van de run.

js-app-orbit-epoch-unset = Deze run vermeldt geen epoch, dus de rotatiehoek van de aarde is hier niet zinvol.

js-app-orbit-img-alt = Orthografische weergave van het gepropageerde spoor

js-app-orbit-note = Sleep om te draaien, scrol of knijp om te zoomen. Aarde op schaal, NASA Blue Marble-beeldmateriaal.

js-app-orbit-static = Statische weergave (de 3D-bibliotheek kon hier niet worden geladen).

js-app-overlay-note = Doorgetrokken lijnen zijn run A, gestippelde lijnen run B, op dezelfde assen.

js-app-overlay-pinned = Overlay van de vastgezette runs

js-app-overlay-title = { $title }: run { $a } (A) tegenover run { $b } (B)

js-app-overlay-with-diff = Overlay met het verschil B − A

js-app-pal-area = Gebied: { $label }

js-app-pal-nothing = Niets komt overeen

js-app-pal-scenario-count =
    { $n ->
        [one] { $n } scenario
       *[other] { $n } scenario's
    }

js-app-pal-sec-areas = Gebieden

js-app-pal-sec-commands = Opdrachten

js-app-pal-sec-scenarios = Scenario's

js-app-pal-sec-settings = Instellingen

js-app-pal-sec-views = Weergaven

js-app-pal-setting = Instelling: { $label }

js-app-pal-view = Weergave: { $label }

js-app-panel-close = Sluiten

js-app-panel-close-full = Volledig scherm sluiten

js-app-panel-expand = Uitvouwen

js-app-panel-expand-full = Dit paneel uitvouwen naar volledig scherm

js-app-panel-expand-title = Dit paneel op volledig scherm tonen (Escape sluit het)

js-app-params-hint = Wijzig een waarde en voer dan opnieuw uit. Het antwoord en de grafiek worden ter plekke bijgewerkt.

js-app-phase = Fase:

js-app-pin-already = Die run is al vastgezet.

js-app-pin-compare =
    { $n ->
        [one] { $n } run vastgezet. Vergelijken wordt geopend.
       *[other] { $n } runs vastgezet. Vergelijken wordt geopend.
    }

js-app-pin-first = Run { $id } vastgezet. Wijzig een parameter, voer opnieuw uit en zet die run ook vast.

js-app-pin-label = { $letter } · { $title } · run { $id }

js-app-plan-view = Bovenaanzicht

js-app-plan-view-at = op

js-app-player-pause = De replay pauzeren

js-app-player-pause-mission = De missie-replay pauzeren

js-app-player-pause-orbit = De baanreplay pauzeren

js-app-player-pause-waterfall = De waterfall-replay pauzeren

js-app-player-play = De replay afspelen

js-app-player-play-mission = De missie-replay afspelen

js-app-player-play-orbit = De baanreplay afspelen

js-app-player-play-waterfall = De waterfall-replay afspelen

js-app-player-position = Positie in de replay

js-app-player-position-mission = Positie in de missie-replay

js-app-player-position-orbit = Positie in de baanreplay

js-app-player-position-waterfall = Positie in de waterfall-replay

js-app-png-button-title = Bitmap met hoge resolutie voor dia's en documenten

js-app-png-export-failed = PNG-export mislukt: { $reason }

js-app-py-note = Installeer met { $command }.

js-app-ran-locally = Lokaal uitgevoerd om { $time }, run { $n }.

js-app-ran-locally-took = Lokaal uitgevoerd om { $time }, run { $n }, { $took } s.

js-app-receiver-at = Ontvanger op t =

js-app-recorded-edit-notice = WebAssembly is op deze pagina geblokkeerd, dus deze pagina toont echte runs van de meegeleverde scenario's, vastgelegd met engine v{ $version }. Bewerkte scenario's, sweeps en nieuwe exports vereisen de live engine: open kshana.dev, of serveer deze map lokaal. Herstellen zet het vastgelegde scenario terug.

js-app-recorded-intro = WebAssembly is op deze pagina geblokkeerd, dus deze pagina toont echte runs van de meegeleverde scenario's, vastgelegd met engine v{ $version }. Bewerken, sweeps en nieuwe exports vereisen de live engine op kshana.dev.

js-app-recorded-shown-native = Vastgelegde run getoond om { $time } (native engine).

js-app-recorded-shown-needs = Vastgelegde run getoond om { $time } (vereist engine { $need }).

js-app-recorded-shown-run = Vastgelegde run getoond om { $time }, run { $n }.

js-app-recorded-shown-took = Vastgelegde run getoond om { $time }, run { $n }, { $took } s.

js-app-recorded-with-commit = Wat u ziet is de run die is vastgelegd met een enginebuild op commit { $commit }, ongewijzigd getoond; hij wordt hier niet opnieuw uitgevoerd.

js-app-recorded-with-engine = Wat u ziet is de run die is vastgelegd met engine v{ $version }, ongewijzigd getoond; hij wordt hier niet opnieuw uitgevoerd.

js-app-recording-edited-warning = U hebt het scenario bewerkt: deze opname is van het meegeleverde bestand, niet van uw bewerking. Voer de opdracht uit op uw eigen bestand om de uwe te krijgen.

js-app-replay = Replay

js-app-report-downloaded = Rapport gedownload.

js-app-report-frame-title = Runrapport geschreven door de engine

js-app-report-html = Rapport (HTML)

js-app-report-html-title = Het rapportbestand, zoals de engine het schreef

js-app-report-load-failed = Het vastgelegde rapport kon niet worden geladen ({ $reason }).

js-app-report-loading = Het vastgelegde rapport wordt geladen…

js-app-report-none = Er is geen vastgelegd rapport voor dit scenario.

js-app-report-note = Elke run via de opdrachtregel schrijft een rapport: samenvatting, invoer, resultaten, de grafiek, wat is getoetst en wat is gemodelleerd, en een reproduceerbaarheidsrecord. De browserbuild bevat die schrijver niet, dus dit is het rapport dat de native opdrachtregelengine voor het meegeleverde scenario schreef. Het eigen rapport van de Studio over de run op het scherm staat onder Exports.

js-app-report-open-tab = Openen in een nieuw tabblad

js-app-report-open-tab-title = Het rapport afzonderlijk openen

js-app-report-orbit-title = Baan (aardgecentreerd inertiaal, orthografisch)

js-app-report-stability-short = Klokstabiliteit

js-app-report-stability-title = Klokstabiliteit (Allan-deviatie)

js-app-run-again = Opnieuw uitvoeren

js-app-run-cancelled = Run geannuleerd.

js-app-run-cancelled-previous = Run geannuleerd. Het vorige resultaat wordt nog getoond.

js-app-run-failed = Run mislukt. Zie het bericht in de resultaten.

js-app-run-when-ready = Uitvoeren zodra de engine gereed is

js-app-run-will-run = Wordt uitgevoerd zodra de engine gereed is

js-app-run-with-settings = Uitvoeren met deze instellingen

js-app-search-more-matches =
    { $n ->
        [one] nog { $n } treffer: voeg een woord toe om hem te beperken.
       *[other] nog { $n } treffers: voeg een woord toe om ze te beperken.
    }

js-app-search-nothing = Niets komt overeen met “{ $query }”. Probeer een woord als jamming, klok, maan, baan, masker of PDOP.

js-app-search-scenarios = Scenario's ({ $n })

js-app-search-settings =
    { $n ->
        [one] Instellingen met een naam als “{ $query }”: in { $n } scenario
       *[other] Instellingen met een naam als “{ $query }”: in { $n } scenario's
    }

js-app-search-settings-hint = Elk opent het scenario met die instelling gemarkeerd, klaar om te wijzigen.

js-app-share-copied = Deellink gekopieerd. Hij bevat het exacte scenario.

js-app-share-in-address-bar = Link in de adresbalk geplaatst.

js-app-share-link-sub = Het draait precies zoals het is gedeeld.

js-app-share-link-title = Een scenario dat is geopend via een deellink

js-app-shared-scenario = Gedeeld scenario

js-app-shown-unchanged = Ongewijzigd getoond.

js-app-solar-note = Elke stip is een lichaam op de epoch van de run en elke curve is het baanspoor dat de engine ervoor berekende. Een gestippelde lijn is een link die het scenario vraagt. Kies een planeet om de manen eromheen te zien.

js-app-solar-which-bodies = Welke lichamen te tekenen

js-app-source-live = Live resultaat · engine v{ $version }

js-app-source-native = Vastgelegd resultaat, native engine · v{ $version }

js-app-source-recorded = Vastgelegd resultaat · v{ $version }

js-app-source-recorded-loading = Vastgelegd resultaat · v{ $version } · engine wordt geladen

js-app-spectrum-row-note = Het spectrum langs de waterfallrij waarop de replay zich bevindt.

js-app-spectrum-row-title = Spectrum langs de getoonde rij

js-app-spectrum-which-part = Welk deel van het spectrum

js-app-status-last-run-took = De laatste run duurde { $ms } ms in uw browser. Er wordt niets geüpload.

js-app-status-loading-kept = De engine wordt nog geladen. Uw wijzigingen blijven bewaard en worden uitgevoerd zodra hij gereed is.

js-app-status-loading-recorded = De engine wordt nog geladen. Het resultaat hierboven is een vastgelegde run.

js-app-status-not-run-yet = Uw wijzigingen zijn nog niet uitgevoerd.

js-app-status-runs-in-browser = Draait in uw browser. Er wordt niets geüpload.

js-app-status-wasm-blocked = WebAssembly is hier geblokkeerd, dus dit toont vastgelegde runs van de meegeleverde scenario's.

js-app-stepper-decrease = { $key } verlagen

js-app-stepper-increase = { $key } verhogen

js-app-subtabs-label = Tegels van deze weergave (telefoon)

js-app-svg-button-title = Vectorgrafiek met titel en herkomst

js-app-sweep-cancelled = Sweep geannuleerd.

js-app-sweep-done-1d = { $done } van { $total } runs lokaal gesweept in { $duration }.

js-app-sweep-done-2d = { $total } runs ({ $a } × { $b }) lokaal gesweept in { $duration }.

js-app-sweep-enter-range = Voer een numeriek bereik in.

js-app-sweep-enter-range-2 = Voer een numeriek bereik in voor de tweede parameter.

js-app-sweep-failed = Sweep mislukt: { $reason }

js-app-sweep-interrupted = Sweep onderbroken door een nieuwe run.

js-app-sweep-needs-live = Een sweep voert de engine vele malen uit, dus de live engine is vereist.

js-app-sweep-none-line = Geen (lijngrafiek)

js-app-sweep-nothing = Niets om te sweepen voor dit scenario.

js-app-sweep-progress = Sweepen: run { $n } van { $total }…

js-app-sweep-status-done = { $total } runs gesweept om { $time }.

js-app-sweep-title-1d = { $metric } tegenover { $knob }

js-app-sweep-title-2d = { $metric } over { $knob1 } en { $knob2 }

js-app-sweep-wait = Wacht tot de huidige run klaar is en sweep dan.

js-app-tab-animation = Animatie

js-app-tab-compare = Vergelijken

js-app-tab-exports = Exports & rapport

js-app-tab-ground = Grondspoor

js-app-tab-holdover = Holdover

js-app-tab-json = JSON

js-app-tab-masks = Tijdsynchronisatiemaskers

js-app-tab-orbit = 3D-baan

js-app-tab-overview = Overzicht

js-app-tab-report = Enginerapport

js-app-tab-signal = Signaal & band

js-app-tab-stability = Stabiliteit

js-app-tab-sweep = Sweep

js-app-tab-timeseries = Tijdreeks

js-app-th-at-tau = Bij τ of tijd

js-app-th-body = Lichaam

js-app-th-clock = Klok

js-app-th-figure = Kwaliteitsmaat

js-app-th-file = Bestand

js-app-th-format = Formaat

js-app-th-key-figure = Kerncijfer

js-app-th-light-time = Enkele lichttijd vanaf { $observer }

js-app-th-limit = Limiet

js-app-th-margin = Marge

js-app-th-mask-or-budget = Masker of budget

js-app-th-metric = Maat

js-app-th-metric-2 = Maat

js-app-th-orbital-period = Omlooptijd

js-app-th-provenance = Herkomst

js-app-th-size = Grootte

js-app-th-source = Bron

js-app-th-sun-distance = Afstand tot de zon

js-app-th-tier = Niveau

js-app-th-unit = Eenheid

js-app-th-value = Waarde

js-app-th-value-2 = Waarde

js-app-th-value-3 = Waarde

js-app-th-verdict = Oordeel

js-app-th-what-it-is = Wat het is

js-app-the-body = het lichaam

js-app-the-chain = De keten

js-app-the-observer = de waarnemer

js-app-tile-browse-all = Alle { $n } scenario's doorbladeren

js-app-tile-browse-sub = Zoek op naam, vraag of instelling

js-app-tile-preview-label = Vastgelegde voorvertoning van { $source }: { $title }

js-app-tile-scenario-count =
    { $n ->
        [one] { $n } scenario
       *[other] { $n } scenario's
    }

js-app-timeline-chart-title = Missietijdlijn: { $title }

js-app-timeline-note = Eén scrubber stuurt elke grafiek hieronder aan. Elke fase voert gewone scenario's uit; de campagne leest hun uitvoer op één tijdraster. Gearceerde banden zijn de fasen, verticale lijnen de gebeurtenissen. De waarden hierboven zijn de kanalen van de campagne op het replaytijdstip.

js-app-toast-copied = Gekopieerd.

js-app-toast-copy-blocked = Kopiëren is hier geblokkeerd.

js-app-toast-copy-blocked-select = Kopiëren is hier geblokkeerd: selecteer in plaats daarvan de tekst.

js-app-toast-json-copied = JSON gekopieerd.

js-app-toast-loading-run = De engine wordt nog geladen. Uw run start zodra hij gereed is.

js-app-toast-no-scenario = Er is hier geen scenario met de naam { $name }. Dit zijn de beste treffers.

js-app-toast-not-single-number = Die instelling is in dit scenario geen enkel getal: bewerk haar in het scenariobestand.

js-app-toast-one-pinned = Eén run is vastgezet. Wijzig een instelling, voer opnieuw uit en zet die run vast om de twee te vergelijken.

js-app-toast-opened-advanced = Geopend met de instellingen die u in de geavanceerde weergave hebt gewijzigd.

js-app-toast-opened-at = Geopend bij { $label }. Wijzig het en voer dan opnieuw uit.

js-app-toast-scenario-copied = Scenario gekopieerd.

js-app-tour-answer-body = Een gewone zin, gelezen uit het resultaat, en waar het resultaat vandaan komt: een live run in uw browser, of een run die met dezelfde engine is vastgelegd.

js-app-tour-answer-title = Eerst het antwoord

js-app-tour-back = Terug

js-app-tour-done = Klaar

js-app-tour-eyebrow = Rondleiding

js-app-tour-figures-body = Elke kaart is gelezen uit het resultaatdocument van de engine.

js-app-tour-figures-title = De kwaliteitsmaten die het beantwoorden

js-app-tour-how-body = De methode, het bewijsniveau en de referenties.

js-app-tour-how-title = Hoe dit wordt berekend

js-app-tour-next = Volgende

js-app-tour-research-body = De opdrachtregel en Python om het zelf uit te voeren, de gegevens en figuren, en hoe u het citeert.

js-app-tour-research-title = Voor onderzoekers

js-app-tour-search-body = ⌘K vindt elk scenario, gebied, elke instelling, weergave of opdracht.

js-app-tour-search-title = Zoeken

js-app-tour-settings-body = De vijf instellingen die voor deze vraag het meest uitmaken. Wijzig er een en voer dan opnieuw uit. De engine draait in uw browser; er wordt niets geüpload.

js-app-tour-settings-title = Probeer andere instellingen

js-app-tour-skip = Overslaan

js-app-tour-views-body = Grafieken, kaarten, replays, het eigen rapport van de engine en exports. [ en ] schakelen tussen weergaven.

js-app-tour-views-title = Elke weergave van de run

js-app-tracking-threshold = Volgdrempel

js-app-transport-hint = één scrubber stuurt elk paneel van deze run aan

js-app-transport-label = Replay: één scrubber stuurt elk paneel van deze run aan

js-app-unpin-run = Run { $id } losmaken

js-app-waterfall = Waterfall

js-app-waterfall-hint = spectrale vermogensdichtheid: frequentie horizontaal, tijd naar beneden

js-app-waterfall-note = Kleur is vermogen boven de ruisvloer van de ontvanger. De navigatiesignalen liggen onder die vloer, dus wat oplicht zijn de jammers. Speel de replay af of sleep erdoorheen, en de banden rechts tonen wat de ontvanger op dat moment nog volgt.

js-app-waterfall-title = Waterfall, { $name }

js-app-webassembly-unavailable = WebAssembly niet beschikbaar

js-app-written-by-native = Geschreven door de native opdrachtregelengine v{ $version } ({ $platform }) met

js-cat-acm-link-question = Welke DVB-S2-modus houdt de link langs elke passage aan, en hoeveel gegevens verplaatst de passage? (gemodelleerd)

js-cat-acm-link-title = Satellietdownlink met adaptieve codering

js-cat-aocs-slew-mekf-question = Hoe verhoudt de slew zich tot het geval met de ware toestand, als de regelaar wordt gevoed door een standfilter en een gyro met bias? (gemodelleerd)

js-cat-aocs-slew-mekf-title = Slew op een standschatting

js-cat-aocs-slew-question = Brengt de terugkoppelwet een slew over een grote hoek met vier wielen tot rust, en hoe zwaar worden de wielen belast? (de regellus is getoetst; het ruimtevaartuig is illustratief)

js-cat-aocs-slew-title = Slew met reactiewielen

js-cat-aperture-duty-cycle-question = Welke uitval kost het als één apertuur zowel navigatie als communicatie bedient? (gemodelleerd)

js-cat-aperture-duty-cycle-title = Inschakelduur van de apertuur

js-cat-araim-gps-galileo-question = Hoe beschikbaar is geavanceerde RAIM met GPS + Galileo en de constellatiebrede foutenhypothese?

js-cat-araim-gps-galileo-title = ARAIM met twee constellaties

js-cat-araim-reference-check-question = Komen de beschermingsniveaus van de engine overeen met de gepubliceerde uitgewerkte voorbeelden van Working Group C?

js-cat-araim-reference-check-title = ARAIM-referentiecontrole

js-cat-ascent-losses-question = Hoeveel van de ideale snelheidswinst van een tweetrapsraket nemen zwaartekracht, luchtweerstand, bijsturing en tegendruk weg? (gemodelleerd)

js-cat-ascent-losses-title = Verliezen tijdens de lanceringsstijging

js-cat-attitude-budget-question = Wat is het ongunstigste storingskoppel en het budget voor de richtfout?

js-cat-attitude-budget-title = Richtbudget

js-cat-automotive-urban-canyon-question = Blijft een auto, door een onderdoorgang en langs een jammer aan de weg, binnen een budget van een halve rijstrook? (gemodelleerd)

js-cat-automotive-urban-canyon-title = Auto door een stadscanyon

js-cat-campaign-jam-spoof-holdover-integrity-question = Wat gebeurt er met één ontvanger bij jamming, spoofing, GNSS-verlies, een integriteitsalarm en herstel, op één tijdlijn? (gemodelleerd)

js-cat-campaign-jam-spoof-holdover-integrity-title = Aaneengeschakelde missie: jam, spoof, holdover, alarm

js-cat-campaign-monte-carlo-clock-holdover-question = Komt de tijdfout van een vrijlopende klok over vele runs met een vaste seed overeen met haar spreiding in gesloten vorm?

js-cat-campaign-monte-carlo-clock-holdover-title = Monte Carlo-klokholdover

js-cat-campaign-optimize-link-budget-question = Waar laat een X-bandlink over afstand en datasnelheid precies 3 dB marge over?

js-cat-campaign-optimize-link-budget-title = Een linkbudget optimaliseren

js-cat-campaign-shared-jammer-sea-road-question = Welk platform verliest bij één jammer zijn positiebepaling: het schip op 30 km of de auto op 50 km? (gemodelleerd)

js-cat-campaign-shared-jammer-sea-road-title = Eén jammer, een schip en een auto

js-cat-campaign-spectrum-holdover-integrity-question = Een jammer neemt twee L-bandsignalen weg, de klok gaat in holdover en de ontvanger valt terug op alleen Galileo: houdt de integriteitsbewaking dan nog stand? (gemodelleerd)

js-cat-campaign-spectrum-holdover-integrity-title = Door het spectrum gestuurde missie

js-cat-campaign-sweep-jammer-power-question = Wanneer verliest de ontvanger zijn positiebepaling als een jammer op 1 km wordt opgevoerd van 10 nW tot 10 W? (gemodelleerd)

js-cat-campaign-sweep-jammer-power-title = Sweep van het jammervermogen

js-cat-cislunar-arc-recovery-question = Herstelt een onafhankelijke kleinstekwadratenschatter de toestand daadwerkelijk uit de booglengte die de rangtest voorspelt? (gemodelleerd; traag: ongeveer 15 s in een browser)

js-cat-cislunar-arc-recovery-title = Herstel van een cislunaire boog

js-cat-cislunar-observability-question = Hoeveel van de toestand van een cislunair ruimtevaartuig maakt een boog tussen satellieten waarneembaar?

js-cat-cislunar-observability-title = Cislunaire waarneembaarheid

js-cat-clock-ensemble-question = In welke betrouwbaarheidsband valt holdover over vele ruistrekkingen?

js-cat-clock-ensemble-title = Holdover-ensemble van klokken

js-cat-clock-holdover-labsr-question = Hoe verhoudt een optische strontiumklok van laboratoriumklasse zich tot een atoomklok op chipschaal in holdover?

js-cat-clock-holdover-labsr-title = Klokholdover, optische laboratoriumklok

js-cat-clock-holdover-question = Hoe lang kan een klok de tijd bijhouden nadat GNSS uitvalt?

js-cat-clock-holdover-title = Klokholdover

js-cat-combined-altpnt-question = Wat levert het samenvoegen van drie scalaire kaartkanalen op ten opzichte van elk afzonderlijk?

js-cat-combined-altpnt-title = Gecombineerde alt-PNT

js-cat-conflict-resilience-question = Hoe degradeert een gelaagde PNT-architectuur onder bedreigingen als jamming, spoofing, kinetische en cyberaanvallen? (gemodelleerd)

js-cat-conflict-resilience-title = Veerkracht in een conflict

js-cat-constellation-multi-gnss-coverage-question = Hoeveel satellieten zijn er met de vier mondiale systemen samen in zicht en hoe goed is de geometrie, overal op aarde? (gemodelleerd)

js-cat-constellation-multi-gnss-coverage-title = Vier GNSS-constellaties, één kaart

js-cat-contact-schedule-question = Welke passages houdt een conflictvrij plan over voor drie satellieten en drie stations in 12 uur, en hoeveel gegevens verplaatst het? (gemodelleerd)

js-cat-contact-schedule-title = Grondcontactplan

js-cat-domain-campaigns-label = Campagnes

js-cat-domain-campaigns-line = Aaneengeschakelde missies, sweeps en Monte Carlo-runs op één klok.

js-cat-domain-constellations-label = Constellatieontwerp

js-cat-domain-constellations-line = Ontwerp een constellatie en breng de dekking en PDOP (positie-DOP, dilution of precision) in kaart.

js-cat-domain-deepspace-label = Maan, cislunair & Mars

js-cat-domain-deepspace-line = Navigatie en tijd bij de Maan, in de cislunaire ruimte en bij Mars.

js-cat-domain-integrity-label = Integriteit & positiebepaling

js-cat-domain-integrity-line = Positiebepalingen en of ze te vertrouwen zijn: RAIM (receiver autonomous integrity monitoring) en de geavanceerde vorm daarvan, ARAIM.

js-cat-domain-interference-label = Jamming & interferentie

js-cat-domain-interference-line = Jammers tegen ontvangers voor satellietnavigatie: wat verloren gaat, en wanneer.

js-cat-domain-leo-label = Navigatie in een lage baan om de aarde (LEO)

js-cat-domain-leo-line = Navigatiesignalen, passages, berichten en positiebepalingen in een lage baan om de aarde.

js-cat-domain-leo-missions-label = LEO-missies & -studies

js-cat-domain-leo-missions-line = Studies en diensten op basis van een laag in een lage baan om de aarde.

js-cat-domain-navigation-label = Traagheids- & alternatieve navigatie

js-cat-domain-navigation-line = Traagheids-, terrein-, zwaartekracht- en andere navigatie zonder satellieten.

js-cat-domain-orbits-label = Banen & GNSS-geometrie

js-cat-domain-orbits-line = Baanpropagatie, efemeriden en de geometrie van navigatiesatellieten.

js-cat-domain-solar-label = Zonnestelsel

js-cat-domain-solar-line = Elke planeet en maan op één epoch, met lichttijden.

js-cat-domain-spaceops-label = Missieanalyse & ruimteoperaties

js-cat-domain-spaceops-line = Passages, lanceervensters, terugkeer, link- en standbudgetten.

js-cat-domain-spectrum-label = Spectrum

js-cat-domain-spectrum-line = Waterfalls van de radioband: jammers, signalen en wat de ontvanger volgt.

js-cat-domain-spoofing-label = Spoofing & signaalbeveiliging

js-cat-domain-spoofing-line = Valse signalen en meaconing, en de monitors die ze opsporen.

js-cat-domain-studies-label = Kwantum, afwegingsstudies & interoperabiliteit

js-cat-domain-studies-line = Kwantumsensoren, afwegingsstudies en interoperabiliteitsformaten.

js-cat-domain-timing-label = Klokken & tijdsynchronisatie

js-cat-domain-timing-line = Klokken zonder satellieten: holdover, stabiliteit, telecommaskers, tijdoverdracht.

js-cat-earth-gnss-lunar-question = Kan een ontvanger bij de Maan het GNSS van de aarde horen, en is dat ooit genoeg voor een positiebepaling? (gemodelleerd)

js-cat-earth-gnss-lunar-title = Aarde-GNSS bij de Maan

js-cat-entry-heating-stardust-question = Reproduceert het intreemodel de gepubliceerde maximale vertraging van de Stardust-capsule voor het terugbrengen van monsters?

js-cat-entry-heating-stardust-title = Intrede van de Stardust-capsule

js-cat-eo-coverage-question = Welke zwadbreedte, grondresolutie en herbezoektijd geeft een EO-baan?

js-cat-eo-coverage-title = EO-dekking

js-cat-eo-radiometry-question = Welke signaal-ruisverhouding, MTF bij Nyquist en NIIRS geeft een scène met 15 % reflectie voor een kleine aardobservatiecamera? (gemodelleerd)

js-cat-eo-radiometry-title = Radiometrie en beeldkwaliteit van een camera

js-cat-ephemeris-question = Waar is de satelliet en wanneer passeert hij boven ons?

js-cat-ephemeris-title = Grondspoor

js-cat-europa-surface-pnt-question = Kan een lander op de Jupitermaan Europa worden gepositioneerd met een kleine constellatie van relays en een afstandsmeting vanaf de aarde? (gemodelleerd)

js-cat-europa-surface-pnt-title = Lander op Europa

js-cat-fusion-pnt-coupled-question = Hoe komt de navigator door een GNSS-uitval heen met één gestapeld Kalman-filter over positie, klok en bias van de versnellingsmeter? (gemodelleerd)

js-cat-fusion-pnt-coupled-title = Gekoppelde navigator met sensorfusie

js-cat-fusion-pnt-question = Wat levert één gezamenlijke schatter op voor klok + positie?

js-cat-fusion-pnt-title = Sensorfusie

js-cat-gnss-ins-aviation-question = Hoe ver drijft een strak gekoppelde INS van navigatie- of tactische klasse weg tijdens een GNSS-onderbreking van twee minuten die een bocht met rolhoek omvat? (gemodelleerd)

js-cat-gnss-ins-aviation-title = Vliegtuigbocht door een GNSS-gat

js-cat-gnss-ins-maritime-question = Hoe ver drijft een INS van navigatie- of tactische klasse weg na een GNSS-uitval van vijf minuten op een slingerend vaartuig? (gemodelleerd)

js-cat-gnss-ins-maritime-title = Slingerend schip door een GNSS-uitval

js-cat-gnss-ins-question = Hoe goed vaart een ondersteunde traagheidsnavigator door een GNSS-uitval heen?

js-cat-gnss-ins-rail-question = Hoe ver drijft een strak gekoppelde INS weg door een diepe insnijding met twee satellieten en daarna een tunnel? (gemodelleerd)

js-cat-gnss-ins-rail-title = Trein door een insnijding en een tunnel

js-cat-gnss-ins-title = GNSS/INS-fusie

js-cat-gnss-sim-container-terminal-skyline-question = Met kranen aan zeezijde en stapels aan landzijde, hoeveel satellieten blijven er over, en wat gebeurt er met de RAIM-bescherming? (gemodelleerd; representatieve skyline)

js-cat-gnss-sim-container-terminal-skyline-title = Straddle carrier op een containerkade

js-cat-gnss-sim-raim-question = Hoe vormen de ionosfeer en de troposfeer ruwe pseudoafstanden, en beschermt RAIM nog?

js-cat-gnss-sim-raim-title = GNSS-metingen

js-cat-gnss-ssv-formation-heo-question = Hoe goed kent een filter de relatieve positie van twee ruimtevaartuigen op een kilometer van elkaar, tegenover het aftrekken van hun absolute positiebepalingen? (gemodelleerd; een run vastgelegd met de native engine)

js-cat-gnss-ssv-formation-heo-title = Relatieve navigatie in formatie, sterk elliptische baan

js-cat-gnss-ssv-heo-question = Wat hoort een sterk elliptische baan langs zijn pad: signalen in zicht, beste C/N0, hoofdlob tegenover zijlob, DOP en strijkende signalen? (gemodelleerd; een run vastgelegd met de native engine)

js-cat-gnss-ssv-heo-title = GNSS-signalen in een sterk elliptische baan

js-cat-gnss-ssv-lunar-weak-question = Wat kan een ontvanger die is ontworpen voor de zwakste signalen gebruiken op weg naar de Maan? (gemodelleerd; een run vastgelegd met de native engine)

js-cat-gnss-ssv-lunar-weak-title = GNSS-signalen op een maanovergang, ontvanger voor zwakke signalen

js-cat-gnss-ssv-nav-lunar-question = Hoe goed houdt een boordfilter een maanovergang vast, tegenover de grens die het zelf opgeeft? (gemodelleerd; een run vastgelegd met de native engine)

js-cat-gnss-ssv-nav-lunar-title = GNSS-filter aan boord op een maanovergang

js-cat-gnss-ssv-shell-question = Hoe vaak hoort een ruimtevaartuig op geostationaire hoogte ten minste één en ten minste vier navigatiesignalen, per constellatie en band? (gemodelleerd; een run vastgelegd met de native engine)

js-cat-gnss-ssv-shell-title = GNSS-signalen boven de satellieten: een schil op 36 000 km

js-cat-gps-denied-gravity-nav-egm2008-question = Kan kaartvergelijking op het echte EGM2008-zwaartekrachtveld tot graad 70 een GPS-vrij traject vasthouden? (gemodelleerd)

js-cat-gps-denied-gravity-nav-egm2008-title = Zwaartekrachtnavigatie op het echte veld

js-cat-gps-denied-gravity-nav-question = Hoe ver drijft de positie weg over een heel uur zonder GNSS, en kan een zwaartekrachtkaart haar in toom houden?

js-cat-gps-denied-gravity-nav-title = Navigatie zonder GNSS

js-cat-gravity-map-error-mc-question = Naarmate de opgeslagen zwaartekrachtkaart ruisiger wordt, hoe vaak houdt kaartvergelijking een GPS-vrije positiebepaling dan nog binnen haar doel? (gemodelleerd)

js-cat-gravity-map-error-mc-title = Monte Carlo van de fout in de zwaartekrachtkaart

js-cat-gravity-map-nav-question = Kan een koude-atoomgravimeter zijn positie zonder GNSS vasthouden door het zwaartekrachtveld te vergelijken waar hij doorheen vliegt?

js-cat-gravity-map-nav-title = Navigatie met een zwaartekrachtkaart

js-cat-holdover-test-example-question = Trek de antenne eruit, beoordeel de holdover: een registratie gesplitst op de twee tijdstippen die de operator opgeeft, elke stap gemeten tegen de ITU-T-maskers die ervoor zijn geschreven. (gemodelleerd; de registratie is verzonnen voor het voorbeeld)

js-cat-holdover-test-example-title = Holdover-test: een tijdfoutregistratie tegenover de maskers

js-cat-holdover-test-ptp4l-question = Dezelfde vier stappen gelezen uit een ptp4l-servolog: hoe ver blijft de eigen offset van de daemon van de maskers terwijl GNSS weg is? (gemodelleerd; de log is verzonnen voor het voorbeeld)

js-cat-holdover-test-ptp4l-title = Holdover-test: een linuxptp-log

js-cat-hybrid-optical-rf-question = Welke continuïteit en integriteit levert het combineren van optische en RF-PNT op? (gemodelleerd)

js-cat-hybrid-optical-rf-title = Hybride optisch/RF

js-cat-hybrid-pnt-question = Wat levert een gecombineerde suite van klok + traagheid u op?

js-cat-hybrid-pnt-title = Hybride PNT

js-cat-hybrid-ukf-question = Is de strak gekoppelde UKF met 17 toestanden zelfconsistent (NEES + innovatiewitheid)? Een zelfconsistentiecontrole, geen nauwkeurigheidsclaim.

js-cat-hybrid-ukf-title = Hybride UKF met 17 toestanden

js-cat-impairment-eval-question = Hoe goed scheidt een detector jamming / spoofing / multipad van nominaal? (gemodelleerde ROC/AUC)

js-cat-impairment-eval-title = Evaluatie van RF-verstoringen

js-cat-imu-deadreckoning-question = Hoe ver drijft de positie weg als alleen een IMU de koers aanhoudt?

js-cat-imu-deadreckoning-title = Traagheidskoppelnavigatie

js-cat-ins-trn-coast-question = Hoe ver drijft de positie weg tijdens een navigatie-uitval, en wanneer passeert ze 10 m en 50 m? (gemodelleerd)

js-cat-ins-trn-coast-title = INS/TRN-overbrugging

js-cat-integrity-harbour-approach-question = Houden GPS en Galileo de ARAIM-bescherming binnen de alarmlimieten als kadegebouwen en een golfbreker lage satellieten verbergen? (gemodelleerd; representatieve skyline)

js-cat-integrity-harbour-approach-title = ARAIM bij het binnenvaren van de haven

js-cat-integrity-raim-question = Voldoet de geometrie aan de alarmlimieten (HPL / VPL)?

js-cat-integrity-raim-title = RAIM-integriteit

js-cat-jamming-demo-question = Bij welke jammer-signaalverhouding verliest de ontvanger de vergrendeling?

js-cat-jamming-demo-title = Jamming

js-cat-jamming-harbour-approach-skyline-question = Hoeveel satellieten houdt een schip onder een jammer van 2 W aan de wal, en hoeveel verbergt de kade zelf? (gemodelleerd; representatieve skyline)

js-cat-jamming-harbour-approach-skyline-title = Schip met jamming bij het binnenvaren van de haven

js-cat-l-band-waterfall-jamming-question = Hoe ziet de hele GNSS L-band eruit terwijl een chirp-, een toon- en een ruisjammer worden ingeschakeld, en welke signalen neemt elk ervan weg? (gemodelleerd)

js-cat-l-band-waterfall-jamming-title = L-band-waterfall onder jamming

js-cat-launch-window-question = Welk lanceerazimut en welke dogleg-Δv bereiken vanaf een locatie een doelinclinatie?

js-cat-launch-window-title = Lanceervenster

js-cat-leo-band-trade-question = Wat wint en verliest een navigatiesignaal in een lage baan in elke band, van ultrahoge frequentie (UHF) tot C-band? (representatieve ontwerpen)

js-cat-leo-band-trade-title = Bandafweging, UHF tot C-band

js-cat-leo-doppler-positioning-question = Hoe goed is een positiebepaling uit tien minuten Doppler op een navigatieconstellatie in een lage baan? (gemodelleerd)

js-cat-leo-doppler-positioning-title = Positiebepaling uit Doppler alleen

js-cat-leo-focus-data-services-question = Wat kost elke extra gegevensdienst aan bits in het navigatiebericht? (gemodelleerd)

js-cat-leo-focus-data-services-title = Servicegegevens tegenover framelengte

js-cat-leo-focus-fused-pnt-sisre-question = Hoe goed moet de afstandsfout van het signaal in de ruimte in een lage baan zijn voordat de laag in een lage baan een gefuseerde positiebepaling helpt? (gemodelleerd)

js-cat-leo-focus-fused-pnt-sisre-title = Gefuseerde positiebepaling tegenover baan- en klokfout

js-cat-leo-focus-indoor-uhf-question = Welke band bereikt nog een gebruiker binnen een traditioneel en een thermisch efficiënt gebouw? (gemodelleerd)

js-cat-leo-focus-indoor-uhf-title = Ontvangst binnenshuis per band en gebouw

js-cat-leo-focus-iot-eirp-question = Hoeveel zendvermogen van de satelliet heeft een batterijtag nodig om het vol te houden? (gemodelleerd)

js-cat-leo-focus-iot-eirp-title = Energie van de tracker tegenover zendvermogen

js-cat-leo-focus-ntn-bandwidth-question = Hoe daalt de positioneringsfout naarmate het referentiesignaal verbreedt van 180 kHz naar 20 MHz? (gemodelleerd)

js-cat-leo-focus-ntn-bandwidth-title = 5G-downlinkpositionering tegenover bandbreedte

js-cat-leo-focus-ppp-altitude-question = Verkort een lagere of een hogere laag in een lage baan de convergentie meer? (gemodelleerd; traag, ongeveer een minuut in een browser)

js-cat-leo-focus-ppp-altitude-title = Nauwkeurige positiebepaling tegenover laaghoogte

js-cat-leo-focus-science-iono-sounding-question = Hoe goed meet het vertragingsverschil tussen twee banden de elektroneninhoud onder een satelliet in een lage baan? (gemodelleerd)

js-cat-leo-focus-science-iono-sounding-title = Ionosfeersondering uit twee banden

js-cat-leo-indoor-uhf-question = Waarom bereikt een UHF-draaggolf het binnenste van een gebouw terwijl de L-, S- en C-band moeite hebben? (gemodelleerd)

js-cat-leo-indoor-uhf-title = Binnenshuis op UHF

js-cat-leo-iot-energy-question = Hoeveel energie besteedt een batterijtag aan elke positiebepaling uit een signaal in een lage baan? (gemodelleerd)

js-cat-leo-iot-energy-title = Energie per positiebepaling voor een tracker

js-cat-leo-navmsg-encode-decode-question = Wat kost de kwantisatie van elk veld, en overleeft het frame het coderen, decoderen en een beschadigde bit? (gemodelleerd)

js-cat-leo-navmsg-encode-decode-title = Navigatiebericht: binair frame

js-cat-leo-navmsg-fit-interval-trade-question = Hoe lang kan één uitgezonden bericht dekken voordat zijn baanfout het doel overschrijdt? (gemodelleerd; traag, ongeveer 30 s in een browser)

js-cat-leo-navmsg-fit-interval-trade-title = Navigatiebericht: fitinterval

js-cat-leo-navmsg-midpass-update-question = Ziet de gebruiker een sprong wanneer een satelliet midden in een passage naar een nieuw bericht overschakelt? (gemodelleerd)

js-cat-leo-navmsg-midpass-update-title = Navigatiebericht: update midden in de passage

js-cat-leo-navmsg-model-comparison-question = Welk efemeridemodel beschrijft een lage baan het best, en hoe verhoudt het zich tot een gepubliceerde tabel? (gemodelleerd)

js-cat-leo-navmsg-model-comparison-title = Navigatiebericht: vier modellen

js-cat-leo-pass-iridium-question = Welke signaalsterkte en Doppler ziet een lijnvliegtuig bij één Iridium-passage? (gemodelleerd)

js-cat-leo-pass-iridium-title = Iridium-bursts vanuit een vliegtuig

js-cat-leo-pass-vs-gnss-cn0-question = Hoe verhoudt de signaalsterkte van één passage in een lage baan zich tot de Galileo-satellieten in zicht? (gemodelleerd)

js-cat-leo-pass-vs-gnss-cn0-title = Eén passage tegenover GNSS

js-cat-leo-pass-xona-pulsar-question = Hoe zien de X1- en X5-signalen eruit tijdens één passage, voor een schip in de Golf van Biskaje? (gemodelleerd)

js-cat-leo-pass-xona-pulsar-title = Passage van Xona Pulsar

js-cat-leo-pnt-end-to-end-question = Wat geeft elke fase door aan de volgende, van het signaalontwerp tot de uiteindelijke positiebepaling? (gemodelleerd)

js-cat-leo-pnt-end-to-end-title = Van begin tot eind, generieke constellatie

js-cat-leo-pnt-mega-shell-question = Welke dekking en geometrie geeft een navigatieconstellatie van 5.000 satellieten in een lage baan om de aarde? (gemodelleerd; een voorbeeldontwerp)

js-cat-leo-pnt-mega-shell-title = Ontwerp met 5.000 satellieten in een lage baan

js-cat-leo-ppp-convergence-question = Hoeveel sneller convergeert nauwkeurige puntpositiebepaling (PPP) wanneer een laag in een lage baan wordt toegevoegd? (gemodelleerd; traag, ongeveer 30 s in een browser)

js-cat-leo-ppp-convergence-title = Convergentie van nauwkeurige positiebepaling

js-cat-leo-pvt-fjord-skyline-question = Waar de fjordwanden een strook lucht langs het vaarwater overlaten, hoeveel voegt een laag in een lage baan toe aan GPS en Galileo? (gemodelleerd; representatieve skyline)

js-cat-leo-pvt-fjord-skyline-title = Veerboot diep in een fjord

js-cat-leo-resilience-gnss-jammed-leo-carries-question = Kan een laag in een lage baan in andere banden de positiebepaling en haar integriteit behouden wanneer GNSS gejamd wordt? (gemodelleerd)

js-cat-leo-resilience-gnss-jammed-leo-carries-title = GNSS gejamd, lage baan gaat door

js-cat-leo-resilience-js-margin-question = Hoeveel meer jamming overleeft een sterker signaal in een lage baan dan een GNSS-signaal uit een middelhoge baan? (gemodelleerd)

js-cat-leo-resilience-js-margin-title = Jammermarge uit ontvangen vermogen

js-cat-leo-resilience-multiband-diversity-question = Welke van vier banden blijven volgen naarmate één L-bandjammer wordt opgevoerd? (gemodelleerd)

js-cat-leo-resilience-multiband-diversity-title = Banddiversiteit onder een breedbandjammer

js-cat-leo-resilience-spoof-doppler-question = Hoe snel betrapt een controle op Doppler en passagegeometrie een spoofer die de berekende positie 30 m verplaatst? (gemodelleerd)

js-cat-leo-resilience-spoof-doppler-title = Spoofing betrapt door Doppler

js-cat-leo-resilience-spoof-monitors-question = Welke monitor ziet welk soort spoofer? (gemodelleerd)

js-cat-leo-resilience-spoof-monitors-title = Spoofingmonitors tegenover vier spoofers

js-cat-leo-timing-utc-question = Hoe nauwkeurig kan een ontvanger gecoördineerde wereldtijd (UTC) terugwinnen uit satellieten in een lage baan, per oscillator en signaalniveau? (gemodelleerd)

js-cat-leo-timing-utc-title = Tijdoverdracht naar UTC

js-cat-leo-vertical-5g-network-timing-question = Houdt tijd uit een lage baan een basisstation binnen zijn tijdsynchronisatielimiet wanneer GNSS een dag verloren gaat? (gemodelleerd)

js-cat-leo-vertical-5g-network-timing-title = Tijdsynchronisatie van een 5G-basisstation

js-cat-leo-vertical-asset-tracking-iot-question = Wat kost elke positiebepaling een batterijtag langs de reis van een container? (gemodelleerd)

js-cat-leo-vertical-asset-tracking-iot-title = Containertracking

js-cat-leo-vertical-autonomous-vehicle-question = Houdt een laag in een lage baan een auto binnen een fout op rijstrookniveau wanneer gebouwen de lage satellieten verbergen? (gemodelleerd)

js-cat-leo-vertical-autonomous-vehicle-skyline-question = Houdt een laag in een lage baan een auto nog steeds binnen een fout op rijstrookniveau, gemodelleerd als een echte straat in plaats van een vlakke afkap op 35°? (gemodelleerd; representatieve skyline)

js-cat-leo-vertical-autonomous-vehicle-skyline-title = Voertuig in een straat, niet bij een vlakke afkap

js-cat-leo-vertical-autonomous-vehicle-title = Voertuig in een stadscanyon

js-cat-leo-vertical-critical-infrastructure-timing-question = Houdt tijd uit een lage baan de synchronisatie van een onderstation vast wanneer GNSS verloren gaat? (gemodelleerd)

js-cat-leo-vertical-critical-infrastructure-timing-title = Tijdsynchronisatie van een onderstation

js-cat-leo-vertical-polar-arctic-question = Wat voegt een polaire laag in een lage baan toe aan GNSS, van Tromsø tot de Noordpool? (gemodelleerd)

js-cat-leo-vertical-polar-arctic-title = Poolreis

js-cat-leo-vertical-rail-maritime-question = Bereikt een passage in een lage baan de meegeleverde schip- en treinscenario's nog wanneer die GNSS verliezen? (gemodelleerd)

js-cat-leo-vertical-rail-maritime-title = Spoor en scheepvaart met een laag in een lage baan

js-cat-link-budget-question = Sluit de eenrichtingslink met marge bij de gegeven afstand en datasnelheid?

js-cat-link-budget-title = Linkbudget

js-cat-lunanet-araim-question = Voldoet een ijle set maanrelays aan de integriteitslimieten voor een ontvanger in het Artemis-gebied?

js-cat-lunanet-araim-title = Maanintegriteit

js-cat-lunar-attack-surface-question = Wat is er nodig om een ontvanger op het maanoppervlak te spoofen of te blokkeren, en welk authenticatiebudget biedt daar antwoord op? (gemodelleerd)

js-cat-lunar-attack-surface-title = Aanvalsoppervlak op de Maan

js-cat-lunar-beacon-question = In hoeverre doet een handvol opgemeten bakens op het oppervlak de DOP bij de zuidpool instorten? (gemodelleerd)

js-cat-lunar-beacon-title = Bakens op het maanoppervlak

js-cat-lunar-differential-pnt-question = In hoeverre heft differentiële correctie de gemeenschappelijke fout op tegenover de basislijn op de Maan? (gemodelleerd)

js-cat-lunar-differential-pnt-title = Differentiële PNT op de Maan

js-cat-lunar-frame-campaign-question = Welke datumnauwkeurigheid komt uit een waarneemcampagne in plaats van uit een geïnjecteerde transformatie? (gemodelleerd)

js-cat-lunar-frame-campaign-title = Campagne voor het maanstelsel

js-cat-lunar-frame-realisation-question = Kan een Helmert-datumfit een transformatie van het maanreferentiestelsel terugvinden? (gemodelleerd)

js-cat-lunar-frame-realisation-title = Maanstelsel

js-cat-lunar-infrastructure-carrier-phase-question = Kunnen een oppervlaktestation en een orbiter samen de geheeltallige draaggolffase-ambiguïteiten van Aarde-GNSS-signalen oplossen? De snelle voorbeeldrun. (gemodelleerd; een run vastgelegd met de native engine)

js-cat-lunar-infrastructure-carrier-phase-title = Draaggolffase op de Maan: oppervlaktestation en orbiter

js-cat-lunar-infrastructure-frame-coestimation-question = Hoeveel meer informatie voegen afstanden tussen orbiter en oppervlaktestation toe aan de zeven parameters van het maandatum? (gemodelleerd; een run vastgelegd met de native engine)

js-cat-lunar-infrastructure-frame-coestimation-title = Gezamenlijke schatting van het maanstelsel met orbiterlinks

js-cat-lunar-infrastructure-geodesy-sensitivity-question = Hoe gevoelig zijn laserafstandsmeting, orbitertracking, een gravimeter en een oppervlakteklok voor h2, k2, l2 en de libratie? (gemodelleerd; een run vastgelegd met de native engine)

js-cat-lunar-infrastructure-geodesy-sensitivity-title = Gevoeligheid voor Love-getallen en libratie van de Maan

js-cat-lunar-infrastructure-od-consistency-model-error-question = Dezelfde vergelijking met een kleine niet-gemodelleerde versnelling erin geïnjecteerd: merkt de consistentiecontrole dat op? (gemodelleerd; een run vastgelegd met de native engine)

js-cat-lunar-infrastructure-od-consistency-model-error-title = Baanbepaling bij de Maan, met een geïnjecteerde modelleringsfout

js-cat-lunar-infrastructure-od-consistency-question = Komen baanbepaling aan boord met Aarde-GNSS in een maanhalobaan en onafhankelijke radiometrische baanbepaling vanaf de grond overeen binnen hun opgegeven onzekerheden? (gemodelleerd; een run vastgelegd met de native engine)

js-cat-lunar-infrastructure-od-consistency-title = Baanbepaling bij de Maan: GNSS aan boord tegenover tracking vanaf de grond

js-cat-lunar-infrastructure-space-tie-question = Hoe nauwkeurig kunnen de offsets tussen drie technieken worden gekoppeld, tegenover de fout van de lokale koppeling? (gemodelleerd; een run vastgelegd met de native engine)

js-cat-lunar-infrastructure-space-tie-title = Koppeling in de ruimte: GNSS, VLBI en laserafstandsmeting op één ruimtevaartuig

js-cat-lunar-interop-export-question = Kunnen maanstelsel, tijd en efemeride heen en terug via CCSDS OEM + een KIF-envelop?

js-cat-lunar-interop-export-title = Interop-export voor de Maan

js-cat-lunar-jamming-question = Hoe ver weg kan een jammer staan en toch een ontvanger op het maanoppervlak blokkeren? (gemodelleerd)

js-cat-lunar-jamming-title = Jamming op de Maan

js-cat-lunar-joint-od-clock-question = Maakt een VLBI-koppeling met een aardbasislijn de absolute positie van een maanstation waarneembaar? (gemodelleerd)

js-cat-lunar-joint-od-clock-title = Gezamenlijke OD+klok op de Maan

js-cat-lunar-llr-datum-question = Hoe ziet het maandatum eruit wanneer de campagne uit echte gearchiveerde maanlaserafstandsmetingen (LLR) bestaat? (gemodelleerd; een run vastgelegd met de native engine)

js-cat-lunar-llr-datum-title = Maandatum uit laserafstandsmeting

js-cat-lunar-relay-constellation-question = Welke dekking geeft een relay- en navigatieconstellatie in bevroren en lage maanbanen over de hele Maan? (gemodelleerd; een voorbeeldontwerp)

js-cat-lunar-relay-constellation-title = Relayconstellatie bij de Maan

js-cat-lunar-station-coverage-public-sources-question = Welke gecorrigeerde fout geeft het station boven de zuidpool onder alleen de openbaar vermelde aannames? Het resultaat wordt bepaald door de baanelementen, die niet openbaar zijn en ILLUSTRATIVE zijn gesteld; dit is de invoer van de bevroren voorspelling. (gemodelleerd; geen uitspraak over enig echt systeem)

js-cat-lunar-station-coverage-public-sources-title = Maanreferentiestation, openbare aannames

js-cat-lunar-station-coverage-question = Welke gecorrigeerde fout geeft een maanreferentiestation boven het zuidpoolgebied gedurende een dag, en hoe ver van het station houdt de dekking stand? (gemodelleerd; geen uitspraak over enig echt systeem)

js-cat-lunar-station-coverage-terrain-question = Hoeveel dekking verliest het station aan terrein, als de horizon van elke locatie met ray-marching over een echt maanhoogtemodel wordt bepaald? (gemodelleerd)

js-cat-lunar-station-coverage-terrain-title = Maanstation met echt terrein

js-cat-lunar-station-coverage-title = Dekking van een maanreferentiestation

js-cat-lunar-station-geodesy-baseline-question = Hoe goed leggen de huidige vijf retroreflectorarrays het maandatum vast op een echt schema, voordat er een station wordt toegevoegd? De basislijn van een paar. (gemodelleerd; een run vastgelegd met de native engine)

js-cat-lunar-station-geodesy-baseline-title = Geodesie met een maanstation: alleen de vijf arrays

js-cat-lunar-station-geodesy-with-station-question = Hetzelfde gearchiveerde schema met één toegevoegde zuidpoolreflector en VLBI-baken: hoeveel wordt de grens van het datum strakker? (gemodelleerd, illustratieve locatie; een run vastgelegd met de native engine)

js-cat-lunar-station-geodesy-with-station-title = Geodesie met een maanstation: met een station aan de zuidpool

js-cat-lunar-station-time-lab-question = Hoe lang blijft de miniatuur-rubidiumklok van een station binnen 1, 10 en 100 ns nadat hij voor het laatst op maantijd is bijgestuurd, en welke foutterm domineert? (gemodelleerd)

js-cat-lunar-station-time-lab-title = Tijdlaboratorium van een maanstation

js-cat-lunar-time-budget-question = Hoe groot is het coördinatietijdverschil tussen Aarde en Maan, en wat is het foutenbudget daarvan? (gemodelleerd)

js-cat-lunar-time-budget-title = Tijdbudget voor de Maan

js-cat-lunar-time-offset-question = Hoe snel loopt een maanklok uiteen met de tijd op aarde (~56–59 µs/dag)?

js-cat-lunar-time-offset-title = Tijdsverschil op de Maan

js-cat-lunar-vlbi-fim-question = Welke nauwkeurigheid van stationscoördinaten levert een gegeven VLBI-trackingschema werkelijk op? (gemodelleerd)

js-cat-lunar-vlbi-fim-title = VLBI-informatie voor de Maan

js-cat-lunar-vlbi-question = Welke vertraging ziet een VLBI-paar met een aardbasislijn voor een baken op het maanoppervlak? (gemodelleerd)

js-cat-lunar-vlbi-title = VLBI voor de Maan

js-cat-maritime-port-approach-coast-question = Wanneer verlaat een INS van navigatieklasse bij het binnenvaren van een haven zonder GNSS het haven- en het oceaanbudget? (gemodelleerd)

js-cat-maritime-port-approach-coast-title = Havenanadering op traagheid

js-cat-maritime-spoof-position-push-question = Welke detectielagen betrappen een spoofer die de positiebepaling van een schip 500 m wegtrekt? (gemodelleerd)

js-cat-maritime-spoof-position-push-title = Schippositie gespoofd

js-cat-maritime-strait-jamming-question = Neemt een jammer van 50 W over 30 km open water het GNSS van een vaartuig weg? (gemodelleerd)

js-cat-maritime-strait-jamming-title = Schip met jamming in een zeestraat

js-cat-mars-orbit-pnt-question = Hoe goed wordt een Mars-orbiter in een lage baan gepositioneerd met twaalf navigatierelays, en wat voegt een afstandsmeting vanaf de aarde toe? (gemodelleerd)

js-cat-mars-orbit-pnt-title = Mars-orbiter met relays en een aardlink

js-cat-mars-pnt-lmo-question = Kan een MARCONI-relayconstellatie een gebruiker bij Mars navigeren? (kwaliteitsmaat van de covariantie, geen gecertificeerd PL)

js-cat-mars-pnt-lmo-title = PNT bij Mars, lage baan

js-cat-mars-pnt-surface-question = Hoe goed kan een lander of rover op het roterende Mars-oppervlak worden genavigeerd ten opzichte van de relayconstellatie?

js-cat-mars-pnt-surface-title = PNT bij Mars, oppervlak

js-cat-mars-pnt-transfer-question = Hoe goed wordt een voertuig op een hoge, excentrische naderings- of invangboog bij Mars genavigeerd?

js-cat-mars-pnt-transfer-title = PNT bij Mars, overgang

js-cat-meo-leo-fused-pvt-question = Wat doet het toevoegen van een laag in een lage baan aan GPS en Galileo met de positiefout en de geometrie? (gemodelleerd)

js-cat-meo-leo-fused-pvt-title = Gefuseerde positiebepaling met GNSS en een lage baan

js-cat-moonlight-service-volume-question = Welke DOP, dekking en integriteit geeft een constellatie van het type Moonlight/LCNS aan de zuidpool? (gemodelleerd)

js-cat-moonlight-service-volume-title = Dienstvolume op de Maan

js-cat-multi-band-jamming-waterfall-question = Wat laat een jammer voor één band overeind als navigatiesignalen over vier banden zijn verdeeld? (gemodelleerd)

js-cat-multi-band-jamming-waterfall-title = Waterfall met jamming in meerdere banden

js-cat-notinbrowser-elevation-model = Vereist het uitgesneden maanhoogtemodel ({ $path }) dat met de repository wordt meegeleverd, niet met de browserbuild.

js-cat-notinbrowser-laser-ranging-data = Vereist het gearchiveerde fragment met laserafstandsgegevens dat met de repository wordt meegeleverd, niet met de browserbuild.

js-cat-notinbrowser-study-suite = Een studiesuite, geen afzonderlijk scenario. Voer haar uit met het opdrachtregelprogramma: { $command }.

js-cat-ntn-5g-positioning-question = Hoe nauwkeurig kan een toestel zichzelf positioneren uit een downlink van een niet-terrestrisch 5G-netwerk, per signaalbandbreedte? (gemodelleerd)

js-cat-ntn-5g-positioning-title = Positionering via 5G-satellietdownlink

js-cat-oem-interop-question = Kan een OEM-efemeride uit GMAT / Orekit / STK worden geïmporteerd en heen en terug worden gevoerd?

js-cat-oem-interop-title = CCSDS OEM-brug

js-cat-optical-atmosphere-network-question = Hoe vaak is een optische tijdsynchronisatielink beschikbaar door wolken en turbulentie, en wat leveren extra grondstations op? (gemodelleerd; illustratieve wolkenklimaten)

js-cat-optical-atmosphere-network-title = Optische link door de atmosfeer, drie locaties

js-cat-optical-atmosphere-techniques-question = Wat leveren een grotere apertuur, een andere golflengte of adaptieve optiek op voor één optische uplink bij wolken en turbulentie? (gemodelleerd; illustratief wolkenklimaat)

js-cat-optical-atmosphere-techniques-title = Technieken voor optische links

js-cat-orbit-gnss-challenged-question = Wanneer is een positiebepaling uit de satellietgeometrie überhaupt mogelijk?

js-cat-orbit-gnss-challenged-title = GNSS-beschikbaarheid

js-cat-orbit-molniya-question = Ziet een gebruiker in een sterk excentrische Molniya-baan nog genoeg GNSS-satellieten nabij het apogeum?

js-cat-orbit-molniya-title = Molniya-gebruiker

js-cat-orbit-multignss-question = Hoeveel verhogen GPS + Galileo samen de beschikbaarheid en hoeveel verkleinen ze de DOP?

js-cat-orbit-multignss-title = Multi-GNSS-beschikbaarheid

js-cat-orbit-real-tle-question = Welke dekking biedt een echte constellatie, gegeven als two-line element sets?

js-cat-orbit-real-tle-title = Echte two-line elements

js-cat-orbit-rinex-question = Welke beschikbaarheid komt uit een echte RINEX 3-uitzendefemeride?

js-cat-orbit-rinex-title = Uitgezonden efemeride

js-cat-orbit-sgp4-gps-question = Hoe propageert een echte GPS-achtige constellatie over een dag?

js-cat-orbit-sgp4-gps-title = SGP4-banen

js-cat-orbit-urban-canyon-skyline-question = Hoeveel van de dag geven GPS en Galileo onderaan een stadsstraat vier satellieten, en wat doet de strook lucht met de PDOP? (gemodelleerd; representatieve skyline)

js-cat-orbit-urban-canyon-skyline-title = Beschikbaarheid in een stadsstraat

js-cat-passes-question = Wanneer komt een satelliet boven een station op en gaat hij onder, en voor hoe lang?

js-cat-passes-title = Grondpassages

js-cat-polar-arctic-leo-coverage-question = Van de evenaar tot de pool, hoe veranderen satellieten in zicht en geometrie met alleen GNSS, alleen een polaire laag in een lage baan, en beide? (gemodelleerd)

js-cat-polar-arctic-leo-coverage-title = Van evenaar tot pool

js-cat-pvt-abmf-question = Kan een echte ontvangerpositie worden opgelost uit ruwe RINEX-metingen?

js-cat-pvt-abmf-title = Positiebepaling (SPP)

js-cat-quantum-anomaly-detect-question = Hoe goed worden fouten in kwantumsystemen gedetecteerd bij een vast percentage valse alarmen? (gemodelleerd)

js-cat-quantum-anomaly-detect-title = Detectie van kwantumanomalieën

js-cat-quantum-cai-coast-question = Hoe lang houdt een koude-atoominterferometer, gespecificeerd door zijn fysica, koppelnavigatie binnen 100 m nadat GNSS verloren is, tegenover een kwartsversnellingsmeter van navigatieklasse? (gemodelleerd)

js-cat-quantum-cai-coast-title = Overbrugging met een kwantumversnellingsmeter

js-cat-quantum-gnss-free-nav-question = Hoe ver drijft een koude-atoomnavigator weg tegenover een INS van navigatieklasse zonder GNSS? (gemodelleerd)

js-cat-quantum-gnss-free-nav-title = Kwantumnavigatie zonder GNSS

js-cat-quantum-pnt-demonstrator-suite-question = De drie kwantumtoepassingsgebieden als één studie (een studiesuite voor de opdrachtregel: kshana --study).

js-cat-quantum-pnt-demonstrator-suite-title = Studie van een kwantum-PNT-demonstrator

js-cat-quantum-time-transfer-question = Wat levert vertrouwde kwantumtijdsynchronisatie op ten opzichte van een klassieke CSAC + RF-keten? (gemodelleerd)

js-cat-quantum-time-transfer-title = Kwantumtijdoverdracht

js-cat-quantum-trade-question = Welke holdover voor tijd en traagheid levert een kandidaatklok op ten opzichte van een klassieke basislijn? (gemodelleerd)

js-cat-quantum-trade-title = Afweging voor kwantum-PNT

js-cat-rail-tunnel-coast-question = Hoe snel verlaat een INS van tactische klasse zijn budget bij 160 km/h door een tunnel? (gemodelleerd)

js-cat-rail-tunnel-coast-title = Trein door een tunnel

js-cat-realtime-frame-eop-question = Hoeveel stelselfout introduceert aardoriëntatie in realtime (voorspeld)? (gemodelleerd)

js-cat-realtime-frame-eop-title = Realtime stelsel/EOP

js-cat-reentry-question = Welke piek-g en welke snelheid bij piekverhitting ziet een ballistische terugkeer?

js-cat-reentry-title = Terugkeercorridor

js-cat-slot-timing-ocxo-leo-question = Hoe lang blijft een oven-gestuurde kristaloscillator op een kleine satelliet in een lage baan binnen zijn slotbewaking na de laatste GNSS-positiebepaling? (gemodelleerd)

js-cat-slot-timing-ocxo-leo-title = Slottiming

js-cat-small-uas-jammed-nav-question = Hoe ver drijft een traagheidseenheid van het type vluchtregelaar weg nadat een jammer GNSS heeft weggenomen, tegenover een van tactische klasse?

js-cat-small-uas-jammed-nav-title = Kleine drone onder jamming

js-cat-solar-system-tour-question = Waar is elk lichaam dat de engine kent, van de Zon tot Pluto en de grote manen, en hoe lang doet licht erover om ertussen te reizen?

js-cat-solar-system-tour-title = Zonnestelsel op één epoch

js-cat-space-packet-question = Worden CCSDS 133.0-pakketstromen bitexact gecodeerd en gedecodeerd?

js-cat-space-packet-title = Space Packet

js-cat-space-weather-question = Hoe verandert zonne- of geomagnetische activiteit de dichtheid van de thermosfeer? (gemodelleerd)

js-cat-space-weather-title = Ruimteweer

js-cat-spoof-attack-question = Wordt een oplopende tijdspoof opgemerkt voordat hij de specificatie bereikt?

js-cat-spoof-attack-title = Spoofdetectie

js-cat-spoof-detect-question = Kan een gefuseerde RF- en metingmonitor een gecoördineerde spoof opsporen?

js-cat-spoof-detect-title = Spoofdetectie in meerdere lagen

js-cat-spoof-meaconing-question = Hoe vaak vangt een kloksgestuurde energiedetector de spoof bij een vast percentage valse alarmen, met een expliciete aanvalsvorm?

js-cat-spoof-meaconing-title = Statistieken van een spoofdetector

js-cat-starlink-sop-doppler-positioning-question = Hoe goed kan een ontvanger zichzelf positioneren uit de Doppler van een breedbandconstellatie die geen navigatiebericht uitzendt? (gemodelleerd)

js-cat-starlink-sop-doppler-positioning-title = Breedbandsignalen van gelegenheid

js-cat-sweep-clock-stability-question = Hoe verandert holdover wanneer één klokparameter wordt gesweept?

js-cat-sweep-clock-stability-title = Parametersweep

js-cat-sweep-nd-inertial-question = Hoe varieert een kwaliteitsmaat over een raster met meerdere parameters?

js-cat-sweep-nd-inertial-title = N-D-sweep

js-cat-telecom-prtc-holdover-24h-question = Blijft een rubidiumreferentie die GNSS 24 uur verliest binnen de ITU-T-tijdfoutmaskers? (gemodelleerd)

js-cat-telecom-prtc-holdover-24h-title = Telecomholdover, 24 uur

js-cat-telecom-synce-eec-question = Blijft een vrijlopende oven-gestuurde oscillator binnen de wandermaskers voor de equipmentklok van synchrone Ethernet? (gemodelleerd)

js-cat-telecom-synce-eec-title = Frequentiesynchronisatie tegenover SyncE-maskers

js-cat-telecom-tie-ingest-question = Doorstaat een registratie van de tijdsintervalfout de ITU-T-maskers voor MTIE en TDEV?

js-cat-telecom-tie-ingest-title = Controle van telecommaskers, uw gegevens

js-cat-terrain-nav-question = Kan een hoogtemeter INS-drift corrigeren door een terreinhoogteprofiel te vergelijken?

js-cat-terrain-nav-title = Terreinnavigatie

js-cat-terrain-slam-question = Kan een deeltjesfilter een in de tijd variërende INS-drift volgen tegenover een terreinkaart?

js-cat-terrain-slam-title = Terrein-SLAM

js-cat-time-transfer-budget-question = Wat doen de termen van station, transponder, ionosfeer en Sagnac met een tweerichtingstijdsverschil, en wat is het onzekerheidsbudget ervan? (gemodelleerd)

js-cat-time-transfer-budget-title = Tweerichtingstijdoverdracht via satelliet

js-cat-timetransfer-question = Hoe strak kunnen twee locaties via een link gesynchroniseerd blijven?

js-cat-timetransfer-title = Tijdoverdracht

js-cat-tracking-loop-question = Bij welke C/N0 verliest een ontvanger werkelijk de vergrendeling, en kan een spoofer de lussen overnemen? (gemodelleerd)

js-cat-tracking-loop-title = Volglus

js-cat-xona-pulsar-end-to-end-question = Dezelfde keten op openbare Xona Pulsar-getallen: signaal, passage, bericht, gefuseerde positiebepaling en nauwkeurige positiebepaling. (gemodelleerd)

js-cat-xona-pulsar-end-to-end-title = Van begin tot eind, Xona Pulsar

js-cat-xona-pulsar-signals-question = Hoe nauwkeurig kan een ontvanger afstanden meten op de gepubliceerde X1- en X5-signalen, en hoe groot is de acquisitiezoekruimte? (openbare signaaltabel)

js-cat-xona-pulsar-signals-title = Xona Pulsar-signalen

js-geo-a-place = Een plaats…

js-geo-axis-east = O +{ $ext } m

js-geo-axis-north = N +{ $ext } m

js-geo-canyon-needs = De vorm voor een straatcanyon vereist engine 0.36.

js-geo-canyon-out-of-range = De waarden van de straatcanyon vallen buiten het bereik (azimut 0 tot 359.9°, breedte 1 tot 200 m, hoogten 0 tot 500 m, antenne 0 tot 50 m); er wordt een open horizon gebruikt.

js-geo-canyon-reduced = De reductie van de canyon door de engine tot een tabel met 360 bins.

js-geo-compute-failed = De engine kon deze hemel niet berekenen: { $reason }

js-geo-computing = Berekenen…

js-geo-copy-link = Kopieer deze link: { $url }

js-geo-count-below = Onder de horizon

js-geo-count-hidden = Verborgen door de skyline

js-geo-count-in-view = In zicht

js-geo-count-open-sky = Open hemel

js-geo-count-used = In de oplossing

js-geo-cursor-live = Azimut { $az }°, skyline { $el }°.

js-geo-dated-sky = Een gedateerde hemel is slechts zo goed als de elementen en hun leeftijd; de voorinstellingen zijn weggelaten.

js-geo-dop-geometric = geometrisch

js-geo-dop-geometric-title = geometrische dilution of precision

js-geo-dop-horizontal = horizontaal

js-geo-dop-horizontal-title = horizontale dilution of precision

js-geo-dop-position = positie, 3D

js-geo-dop-position-title = positie, 3D-dilution of precision

js-geo-dop-time = tijd

js-geo-dop-time-title = tijd-dilution of precision

js-geo-dop-vertical = verticaal

js-geo-dop-vertical-title = verticale dilution of precision

js-geo-east = O

js-geo-engine-not-running = De engine draait niet in deze browser ({ $reason }).

js-geo-err-geometry-object = het geometrieantwoord van de engine is geen object

js-geo-err-mc-object = het Monte Carlo-antwoord van de engine is geen object

js-geo-err-no-sentences = het antwoord van de engine bevat geen zinnen

js-geo-err-reply-kind-not-json = het antwoord van de engine over { $what } was geen JSON

js-geo-err-reply-not-json = het antwoord van de engine was geen JSON

js-geo-error-line = Met σ_UERE = { $uere } m, onder het opgegeven foutmodel (cijfers van de engine): { $bits }.

js-geo-error-line-needs = Positiefout ≈ σ_UERE × HDOP horizontaal en σ_UERE × VDOP verticaal; deze waarde vereist engine 0.36.

js-geo-error-rms-3d = 3D-RMS σ_UERE × PDOP = { $m } m

js-geo-error-rms-h = horizontale RMS σ_UERE × HDOP = { $m } m

js-geo-error-sigma = 1-sigmafout oost { $east } m, noord { $north } m

js-geo-fact-ellipse-1s = Ellips, 1-sigma

js-geo-fact-ellipse-1s-value = { $major } m × { $minor } m, lange as { $deg }° vanaf het noorden

js-geo-fact-ellipse-pct = Ellips, { $pct } %

js-geo-fact-ellipse-pct-scaled = { $major } m × { $minor } m (1-sigma × { $k })

js-geo-fact-ellipse-pct-value = { $major } m × { $minor } m

js-geo-fact-inside = Binnen de 95 %-ellips

js-geo-fact-inside-value = { $pct } % van de punten

js-geo-fact-line = { $key }: { $value }.

js-geo-fact-mc = Monte Carlo

js-geo-fact-mc-value = { $n } kleinstekwadratenoplossingen, seed { $seed }

js-geo-fact-rms-3d = Wolk-RMS, 3D

js-geo-fact-rms-3d-beside = { $rms } m, naast σ_UERE × PDOP = { $predicted } m

js-geo-fact-rms-h = Wolk-RMS, horizontaal

js-geo-fact-rms-h-beside = { $rms } m, naast σ_UERE × HDOP = { $predicted } m

js-geo-fact-rms-value = { $rms } m

js-geo-gj-not-geojson = { $name }: geen GeoJSON (een FeatureCollection, Feature of geometrie werd verwacht).

js-geo-gj-not-json = { $name }: geen JSON ({ $reason }).

js-geo-gj-not-object = { $name }: geen GeoJSON-object.

js-geo-gj-too-many =
    { $name }: { $count ->
        [one] { $count } object
       *[other] { $count } objecten
    }; deze pagina tekent er ten hoogste { $max }.

js-geo-legend-item = { $label }: { $used } in de oplossing van { $total }

js-geo-link-copied = Link gekopieerd.

js-geo-link-copied-no-tle = Link gekopieerd (zonder uw geplakte elementen: een link opent de voorinstellingen).

js-geo-mc-off = Uit

js-geo-missing-ellipse = de foutellips

js-geo-missing-gdop = GDOP

js-geo-missing-leo = LEO

js-geo-missing-monte-carlo = de Monte Carlo-wolk

js-geo-missing-open-sky = het aandeel open hemel

js-geo-missing-skyline = de skyline

js-geo-missing-tdop = TDOP

js-geo-needs = vereist engine 0.36

js-geo-needs-cap = Vereist engine 0.36

js-geo-no = Nee

js-geo-no-ellipse = Geen ellips

js-geo-no-sats = Geen satellieten om te tonen.

js-geo-north = N

js-geo-not-given = niet opgegeven

js-geo-note-elements-skipped =
    { $count ->
        [one] { $count } elementenset is overgeslagen: { $list }.
       *[other] { $count } elementensets zijn overgeslagen: { $list }.
    }

js-geo-note-latitude-limited = Deze enginebuild modelleert locaties binnen 89° van de evenaar; de breedtegraad is daartoe beperkt.

js-geo-note-leo-left-out = LEO: vereist engine 0.36; weggelaten.

js-geo-note-no-engine = De engine draait niet in deze browser, dus er is niets te tonen. Hij draait als WebAssembly; een browser of host die WebAssembly blokkeert kan deze weergave niet uitvoeren.

js-geo-note-pick-one = Kies ten minste één van GPS, Galileo en BeiDou.

js-geo-note-skyline-not-applied = De skyline wordt getekend maar niet toegepast: toepassen vereist engine 0.36. Satellieten erachter tellen hier nog mee.

js-geo-note-skyline-source = Skyline: { $source }.

js-geo-note-training-model = Engine { $version }, trainingshemelmodel (nmea_training) op { $instant }: hoeken in hele graden en DOP's op één decimaal, zoals ontvangerzinnen ze dragen; de positiebepaling gebruikt ten hoogste 12 satellieten, gekozen op signaalsterkte.

js-geo-note-unknown-systems =
    { $count ->
        [one] { $count } satellietrecord van een systeem dat deze weergave niet tekent is weggelaten.
       *[other] { $count } satellietrecords van een systeem dat deze weergave niet tekent zijn weggelaten.
    }

js-geo-off-leo = LEO: vereist engine 0.36.

js-geo-off-monte-carlo = De Monte Carlo-wolk vereist engine 0.36.

js-geo-off-skyline = Een skyline toepassen vereist engine 0.36: hier wordt hij alleen getekend.

js-geo-offset-own = Offset ten opzichte van de epoch van uw elementen ({ $epoch })

js-geo-offset-ref = Offset ten opzichte van de referentie-epoch van de constellaties

js-geo-open-sky-share = { $pct } % van het bovenste halfrond

js-geo-out-of-range = Buiten het bereik, daarom op de laatste goede waarde gehouden: { $names }.

js-geo-own-elements-at = Uw eigen elementen op { $epoch }.

js-geo-pick-constellation = Kies ten minste één constellatie.

js-geo-place-geiranger = Geirangerfjord, Noorwegen

js-geo-place-manhattan = Midtown Manhattan, Verenigde Staten

js-geo-place-oslo = Haven van Oslo, Noorwegen

js-geo-place-rotterdam = Haven van Rotterdam, Nederland

js-geo-place-singapore = Straat van Singapore

js-geo-place-tallinn = Haven van Tallinn, Estland

js-geo-place-tromso = Tromsø, Noorwegen

js-geo-plot-desc =
    { $total ->
        [one] { $total } satelliet in de plot, { $used } in de oplossing.
       *[other] { $total } satellieten in de plot, { $used } in de oplossing.
    }

js-geo-preset-illustrative = Illustratieve omtrek getekend door deze pagina; een skyline toepassen vereist engine 0.36.

js-geo-ready = Gereed.

js-geo-ready-needs = Gereed. Vereist engine 0.36: { $list }.

js-geo-sat-masked = { $label } { $id }: azimut { $az }°, elevatie { $el }°, verborgen door de skyline

js-geo-sat-unused = { $label } { $id }: azimut { $az }°, elevatie { $el }°, niet gebruikt

js-geo-sat-used = { $label } { $id }: azimut { $az }°, elevatie { $el }°, in de oplossing

js-geo-scenarios-under = De scenario's van de engine onder deze skyline:

js-geo-sky-canyon = Straatcanyon

js-geo-sky-drawn = Getekend op de skyplot

js-geo-sky-open = Open horizon

js-geo-sky-preset = Voorinstelling: { $name }

js-geo-sky-source = Hemel: { $source }.

js-geo-skyline-city-street = Stadsstraat

js-geo-skyline-container = Containerterminal

js-geo-skyline-fjord = Fjord

js-geo-skyline-harbour = Havenanadering

js-geo-skyline-load-failed = De skyline kon niet worden geladen ({ $reason }).

js-geo-skyplot-downloaded = Skyplot gedownload.

js-geo-skyplot-export-failed = De skyplot kon niet worden geëxporteerd ({ $reason }).

js-geo-source-geometry = Kshana-engine { $version }, sky_geometry

js-geo-source-line = { $source }.

js-geo-source-training = Kshana-engine { $version }, trainingshemelmodel

js-geo-south = Z

js-geo-style-own-elements = Uw elementen

js-geo-svg-refused = de SVG van de engine werd geweigerd

js-geo-table-count =
    { $n ->
        [one] { $n } satelliet, hetzelfde als de skyplot.
       *[other] { $n } satellieten, hetzelfde als de skyplot.
    }

js-geo-tle-epoch = Geef een UTC-epoch van 2000 tot 2099.

js-geo-tle-paste-first = Plak eerst een of meer two-line element sets.

js-geo-tle-too-large = De geplakte elementen zijn groter dan 4 MiB, de invoerlimiet van de engine.

js-geo-used-masked = Nee: verborgen door de skyline

js-geo-using-own = Uw eigen elementen worden gebruikt. Een link bevat alleen dát u ze hebt gebruikt, niet de elementen zelf.

js-geo-wasm-blocked = WebAssembly is geblokkeerd

js-geo-west = W

js-geo-why = Waarom

js-geo-why-interim = De foutellips en de Monte Carlo-wolk vereisen engine 0.36 (de functies sky_geometry en sky_monte_carlo); de engine in deze pagina is ouder.

js-geo-why-no-ellipse = De engine gaf geen ellips voor deze geometrie (te weinig satellieten voor een positiebepaling, of een singuliere geometrie).

js-geo-why-no-ellipse-reason = De engine gaf geen ellips voor deze geometrie (te weinig satellieten voor een positiebepaling, of een singuliere geometrie): { $reason }.

js-geo-why-waiting = Wachten op de engine.

js-geo-yes = Ja

js-hold-axis-seconds = seconden vanaf het eerste sample

js-hold-axis-tau = observatietijd τ, s (log)

js-hold-axis-te = tijdfout, ns

js-hold-band-title = Herstelband ±{ $band } ns

js-hold-blurb-example = Samples elke 5 s: 600 s vergrendeld, GNSS verwijderd op 600 s, holdover, GNSS hersteld op 2400 s. De registratie is gegenereerd voor het voorbeeld; het is geen meting.

js-hold-blurb-ptp4l = Dezelfde vier stappen gelezen uit een ptp4l-servolog (de eigen offset van de daemon, in ns). De log is geschreven voor het voorbeeld; er draaide geen daemon.

js-hold-budget-exceeded = { $name } voor het eerst overschreden { $s } s na verwijdering

js-hold-chip-baseline = Basislijn tegenover zijn maskers

js-hold-chip-envelope = ePRTC-A-holdoveromhullende

js-hold-chip-holdover = Holdover tegenover zijn maskers

js-hold-chip-measured = gemeten tegenover het masker

js-hold-chip-recovery = Herstel

js-hold-chip-words = Woorden

js-hold-curve-title = { $step }: { $which }, ns

js-hold-curves-aria = { $which } tegenover observatietijd, met de maskerlimieten

js-hold-envelope-exceeded = ePRTC-A-holdoveromhullende voor het eerst overschreden { $s } s na verwijdering

js-hold-envelope-exceeded-short = { $verdict }, voor het eerst overschreden { $s } s na verwijdering (de registratie is korter dan de periode van de omhullende)

js-hold-envelope-exceeded-value = { $verdict }, voor het eerst overschreden { $s } s na verwijdering

js-hold-envelope-short = { $verdict } (de registratie is korter dan de periode van de omhullende)

js-hold-file-error = { $name }: { $error }.

js-hold-file-not-json = { $name }: geen JSON.

js-hold-file-read-here = { $name }, hier gelezen; er is niets geüpload.

js-hold-file-too-large = { $name } is groter dan deze pagina leest.

js-hold-from-record = de registratie van het resultaat

js-hold-from-record-decimated = de registratie van het resultaat, uitgedund tot { $have } van { $total } samples

js-hold-gnss-removed = GNSS verwijderd

js-hold-gnss-removed-stated = GNSS verwijderd (opgegeven door de operator)

js-hold-gnss-restored = GNSS hersteld

js-hold-gnss-restored-stated = GNSS hersteld (opgegeven door de operator)

js-hold-largest-at = { $value } op T+{ $time } s

js-hold-limit-label = ±{ $ns } ns { $step }-masker

js-hold-limit-title = { $id }: ±{ $ns } ns, de maximale absolute tijdfout in de stap { $step }

js-hold-mark-title = { $id }-limiet { $limit } ns bij τ { $tau } s ({ $verdict }; { $source })

js-hold-marker-time = { $name }, T+{ $time } s

js-hold-na = n.v.t.

js-hold-no-curve = Geen tijdfoutcurve: de registratie kon niet worden gereproduceerd om te tekenen.

js-hold-no-which-curve = Geen { $which }-curve in dit resultaat.

js-hold-not-exceeded = niet overschreden

js-hold-not-recovered = bleef niet binnen de band

js-hold-not-result = dit is geen resultaat van een holdover-test

js-hold-open-failed = { $title } kon niet worden geopend: { $reason }.

js-hold-opening = { $title } wordt geopend…

js-hold-phase-baseline = Basislijn: vergrendeld

js-hold-phase-holdover = Holdover: GNSS verwijderd

js-hold-phase-recovery = Herstel: GNSS hersteld

js-hold-phase-title = { $phase }, T+{ $from } s tot { $to } s

js-hold-read-failed = Kon niet worden gelezen of getekend ({ $reason }).

js-hold-recorded = { $title }: het vastgelegde resultaat van de engine (versie { $version }).

js-hold-recovered = binnen ±{ $band } ns gedurende { $dwell } s, { $after } s nadat GNSS terugkeerde

js-hold-result-not-json = het resultaat is geen JSON ({ $reason })

js-hold-result-not-loaded = het vastgelegde resultaat is niet geladen

js-hold-row-envelope = ePRTC-A-holdoveromhullende

js-hold-row-frequency = Vastgehouden frequentie-offset (gefitte helling)

js-hold-row-largest = Grootste absolute tijdfout

js-hold-row-length = Duur van de holdover

js-hold-row-margin = Kleinste marge binnen de omhullende

js-hold-row-peak = Piek na herstel

js-hold-row-recovery = Herstel

js-hold-row-recovery-step = Grootste stap tijdens het herstel

js-hold-row-residual = Residu rond die lijn (rms)

js-hold-row-step = Stap op het moment van verwijdering

js-hold-status-final = { $status } { $label }; gemeten tegenover het masker.

js-hold-step-span = T+{ $from } tot { $to } s

js-hold-te-aria = Tijdfout over de registratie, met de fasen en de maskerlimieten

js-hold-te-line-title = Tijdfout, ns

js-hold-te-note = Tijdfout vanaf { $from }. De twee tijdstippen zijn opgegeven door { $by }.

js-hold-th-budget = Budget

js-hold-th-budget-limit = Limiet |TE|, ns

js-hold-th-first-exceeded = Eerst overschreden na verwijdering, s

js-hold-th-largest = Grootste |TE|, ns

js-hold-th-limit = Limiet, ns

js-hold-th-margin = Marge, ns

js-hold-th-mask = Masker

js-hold-th-mean = Gemiddelde, ns

js-hold-th-measured-on = Gemeten op

js-hold-th-metric = Maat

js-hold-th-rms = RMS, ns

js-hold-th-samples = Samples

js-hold-th-source = Bron

js-hold-th-span = Bereik

js-hold-th-step = Stap

js-hold-th-value = Waarde, ns

js-hold-th-verdict = Oordeel

js-hold-th-worst-at = Slechtst bij τ of T+, s

js-hold-title-example = Een tijdfoutregistratie

js-hold-title-ptp4l = Een linuxptp-log

js-hold-why-no-samples = het resultaat bevat geen tijdfoutsamples (record.series), dus er wordt geen curve getekend

js-hold-why-not-series = de reeks in het resultaat is geen tijdreeks (minder dan twee samples, of de tijd neemt niet toe), dus er wordt geen curve getekend

js-hold-why-sentence = { $why }.

js-hold-why-too-many = de reeks in het resultaat heeft { $have } samples waar de engine { $scored } scoorde, dus er wordt geen curve getekend

js-interf-attribution = Toeschrijving

js-interf-build-failed = { $name }: kon niet worden opgebouwd ({ $reason }).

js-interf-built-day-maps =
    { $n ->
        [one] { $n } dagkaart opgebouwd uit { $name } met engine { $version }, in deze browser.
       *[other] { $n } dagkaarten opgebouwd uit { $name } met engine { $version }, in deze browser.
    }

js-interf-built-detail = { $date }: { $published } cellen gepubliceerd, { $flagged } gemarkeerd

js-interf-built-from-sample = Opgebouwd uit het synthetische voorbeeld { $kind } met de engine, in deze browser. Verzonnen meldingen; geen echt vliegtuig, vaartuig of echte dag.

js-interf-built-maps =
    { $n ->
        [one] { $n } kaart opgebouwd ({ $detail }). Alleen geaggregeerd: een gemarkeerde cel noemt interferentie niet als oorzaak.
       *[other] { $n } kaarten opgebouwd ({ $detail }). Alleen geaggregeerd: een gemarkeerde cel noemt interferentie niet als oorzaak.
    }

js-interf-built-none = { $name }: de engine bouwde geen kaart.

js-interf-caveat-coverage = De dekking volgt de gegevensbron; lees de opmerkingen over de dekking.

js-interf-caveat-no-colour = Een cel zonder kleur is niet waargenomen. Het is geen bewijs dat het gebied vrij was.

js-interf-caveat-not-finding = Een gedegradeerde of afwijkende cel is geen constatering van interferentie. Er zijn andere oorzaken.

js-interf-caveat-past-reports = Dit is een beschrijving van eerdere positiemeldingen, geen voorspelling en geen meting van enige ontvanger.

js-interf-caveats = Kanttekeningen

js-interf-cell-size-rule = De celgrootte moet een aantal graden boven 0 en ten hoogste 10 zijn, of leeg voor 0.5.

js-interf-check-failed = { $name }: kon niet worden gecontroleerd ({ $reason }).

js-interf-click-cell = Klik op een cel, of focus de kaart en gebruik de pijltjestoetsen, om de cijfers ervan te zien.

js-interf-close = Sluiten

js-interf-close-file = { $name } sluiten

js-interf-col-affected = Getroffen

js-interf-col-cell-area = Celoppervlak

js-interf-col-detectors = Detectoren

js-interf-col-observed = Waargenomen

js-interf-col-sampled = Bemonsterd

js-interf-col-share = Aandeel

js-interf-col-status = Status

js-interf-coverage-limits = Dekkingsgrenzen van deze bron

js-interf-csv-too-big = { $name }: groter dan 24 MiB; bouw vanuit een uittreksel (het opdrachtregelprogramma accepteert een heel bestand).

js-interf-csv-too-big-short = { $name }: groter dan 24 MiB; bouw vanuit een uittreksel.

js-interf-custom-needs-licence = Een eigen dataset heeft de licentie, de URL ervan en de bronvermelding nodig: ze worden in het kaartbestand geschreven.

js-interf-dataset = Dataset

js-interf-dates-rule = Datums zijn JJJJ-MM-DD, of leeg voor geen grens.

js-interf-day = Dag

js-interf-day-aria = Dag { $kind }

js-interf-day-confounded-note = Deze dag is verstoord door een confounder: geen enkele cel is als gedegradeerd bestempeld vanwege de achtergrond van de dag. Cellen die anders zouden zijn opgevallen, worden als niet beoordeeld getoond.

js-interf-day-figures-aria = Cijfers van de dag

js-interf-demo-csv-name = { $file } (synthetisch voorbeeld)

js-interf-demo-failed = De demo kon niet worden geopend: { $reason }.

js-interf-demo-opened = Synthetische demo: drie verzonnen bestanden over een verzonnen gebied op open oceaan (twee ADS-B-dagen, waarvan één verstoord, en één AIS-dag). Er zit geen echt vliegtuig, vaartuig of echte dag achter. Gebruik de dagkiezer op de ADS-B-laag.

js-interf-demo-route-name = route.csv (synthetisch)

js-interf-describe-map = Kaart van { $kind } voor { $date }: { $cells } cellen getekend, { $parts }. Niet getekende cellen zijn niet waargenomen.

js-interf-did-not-load = { $url } is niet geladen

js-interf-engine-no-fn = Deze enginebuild (versie { $version }) heeft geen { $fn }; hij is ouder dan deze pagina. Het equivalent op de opdrachtregel staat op de pagina Hulpmiddelen.

js-interf-engine-start-failed = De engine kon hier niet starten ({ $reason }). Kaartbestanden hierboven openen werkt nog steeds.

js-interf-err-format-version = { $name }: geen ondersteunde Kshana-interferentiekaart (format_version { $version }; deze pagina ondersteunt { $supported }).

js-interf-err-no-rows = { $name }: geen rows[] in dit rapport.

js-interf-err-not-json = { $name }: geen JSON ({ $reason }).

js-interf-err-not-map = { $name }: dit is GeoJSON maar geen Kshana-interferentiekaart (geen kshana_interference_map-lid).

js-interf-err-not-route = { $name }: geen Kshana-routeblootstellingsrapport (geen kshana_route_exposure-lid).

js-interf-err-route-schema = { $name }: schema { $schema } is niet { $expected }, dat deze pagina leest.

js-interf-err-source-kind = { $name }: source_kind { $kind } is noch adsb noch ais.

js-interf-err-unknown-schema = { $name }: onbekend schema { $schema }; deze pagina leest { $supported }.

js-interf-foot-attribution = Bronvermelding: { $text }

js-interf-foot-coverage = Dekking: { $notes }

js-interf-foot-layer = Laag { $kind }, { $date }. Niet getekende cellen zijn niet waargenomen.

js-interf-foot-licence = Licentie: { $licence }

js-interf-foot-licence-url = Licentie: { $licence } ({ $url })

js-interf-grid = Raster: vierkante cellen van { $size }° in breedte- en lengtegraad ({ $type }). De oost-westbreedte neemt af met de breedtegraad.

js-interf-guards = Controles op andere oorzaken

js-interf-input = Invoer

js-interf-land-set = Landpolygonen: { $name }.

js-interf-land-too-big = Dat landbestand is groter dan 24 MiB.

js-interf-larger-than = { $name }: groter dan { $limit }; deze pagina leest kaartbestanden tot die grootte.

js-interf-layer-adsb-sub = cellen waar vliegtuigen een lage navigatienauwkeurigheid meldden

js-interf-layer-ais-sub = cellen waar vaartuigen onaannemelijke posities of bewegingen meldden

js-interf-layer-heading = Laag { $kind }

js-interf-layer-hidden = De laag { $kind } is verborgen.

js-interf-layers-separate = ADS-B en AIS zijn aparte lagen met eigen schakelaars, legenda's en licentieregels. Ze worden nooit samengevoegd tot één kleurveld of één telling.

js-interf-legend-aria = Wat elke celstatus betekent; vink er een uit om die cellen te laten vervagen

js-interf-licence = Licentie

js-interf-licence-aria = Datalicentie van { $name }

js-interf-licence-heading = Datalicentie en bronvermelding

js-interf-map-aria = { $summary } Met de pijltjestoetsen gaat u tussen getekende cellen.

js-interf-maps-open =
    { $n ->
        [one] { $n } kaart open.
       *[other] { $n } kaarten open.
    }

js-interf-method-summary = Methode en kanttekeningen

js-interf-no-cell-at = Geen cel op { $lat }, { $lon }: niet waargenomen. Dat is geen bewijs dat het gebied vrij was.

js-interf-no-cell-drawn = geen cel getekend

js-interf-no-cells-draw = Dit bestand heeft geen cellen om te tekenen.

js-interf-no-day-figures = Dit bestand vermeldt geen cijfers op dagniveau.

js-interf-no-file-opened = Er kon geen bestand worden geopend.

js-interf-no-file-text = De geopende kaarten bevatten geen bestandstekst om te controleren (ze zijn niet als bestand geopend).

js-interf-none = geen

js-interf-none-stated = (geen vermeld)

js-interf-none-stated-file = (geen vermeld in dit bestand)

js-interf-north-abbr = N

js-interf-not-evaluated = niet geëvalueerd

js-interf-not-opened-full = { $name }: niet geopend, er zijn al { $max } kaarten open. Sluit er eerst enkele.

js-interf-nothing-open = Nog niets geopend.

js-interf-nothing-opened = Niets geopend.

js-interf-one-day = één dag tegelijk

js-interf-opened-file-map = { $files } bestand geopend; { $maps } kaart open.

js-interf-opened-file-maps = { $files } bestand geopend; { $maps } kaarten open.

js-interf-opened-files-map = { $files } bestanden geopend; { $maps } kaart open.

js-interf-opened-files-maps = { $files } bestanden geopend; { $maps } kaarten open.

js-interf-opening-demo = De synthetische demo wordt geopend…

js-interf-parameters = Parameters, vastgelegd voordat er data werd gelezen

js-interf-read-draw-failed = { $name }: kon niet worden gelezen of getekend ({ $reason }).

js-interf-read-failed = { $name }: kon niet worden gelezen ({ $reason }).

js-interf-read-with-map = Lees dit samen met de kaart

js-interf-reading = Lezen…

js-interf-route-aria = Routeblootstelling { $name }

js-interf-route-chip = Route

js-interf-route-done =
    { $n ->
        [one] Routeblootstelling berekend uit { $n } kaart met engine { $version }; het rapport staat hieronder.
       *[other] Routeblootstelling berekend uit { $n } kaarten met engine { $version }; het rapport staat hieronder.
    }

js-interf-route-explain = Aandeel van de routelengte in elke status, per dag en bron. De vier aandelen tellen op tot 1 en worden samen gelezen: een laag aandeel gedegradeerd met een hoog aandeel niet waargenomen is niet als vrij aangetoond. Rijen van ADS-B en AIS worden nooit gecombineerd.

js-interf-route-exposure = Routeblootstelling

js-interf-route-needs-map = Open of bouw eerst minstens één kaart: de route wordt gecontroleerd aan de hand van de kaarten op deze pagina.

js-interf-route-open-failed = De route kon niet worden geopend: { $reason }.

js-interf-route-range = { $from } tot { $to }

js-interf-route-too-big = { $name }: groter dan 24 MiB.

js-interf-row-affected-share = Getroffen aandeel

js-interf-row-aircraft-affected = Getroffen vliegtuigen

js-interf-row-aircraft-observed = Waargenomen vliegtuigen

js-interf-row-aircraft-sampled = Bemonsterde vliegtuigen

js-interf-row-area = Gebied

js-interf-row-cell = Cel

js-interf-row-detectors = Gekwalificeerde detectoren

js-interf-row-flagged = Gemarkeerd: { $detector }

js-interf-row-status = Status

js-interf-row-vessels-observed = Waargenomen vaartuigen

js-interf-rows-skipped =
    { $count ->
        [one] { $count } rij was niet geldig en is overgeslagen.
       *[other] { $count } rijen waren niet geldig en zijn overgeslagen.
    }

js-interf-rt-day = Dag

js-interf-rt-km = Routekm

js-interf-rt-licence = Licentie en bronvermelding van de kaart

js-interf-rt-shares = Aandelen van de route

js-interf-rt-source = Bron

js-interf-sample-failed = Het voorbeeld kon niet worden geopend: { $reason }.

js-interf-save = Opslaan:

js-interf-save-report = Het rapport opslaan (JSON)

js-interf-show-layer = Deze laag tonen

js-interf-st-anomalous-label = Afwijkend

js-interf-st-anomalous-text = Minstens één detector markeerde die dag hier genoeg verschillende vaartuigen (minstens 3 vaartuigen en 20% van de waargenomen vaartuigen). Mogelijke oorzaken zijn interferentie, maar ook veel gewone.

js-interf-st-confounded-label = Dag verstoord

js-interf-st-confounded-text = Het mediane celaandeel van de hele dag was hoog, wat wijst op een oorzaak over een groot gebied. Op zo'n dag wordt geen cel als gedegradeerd bestempeld; deze cel zou anders zijn opgevallen.

js-interf-st-degraded-label = Gedegradeerd

js-interf-st-degraded-text = Een hoog aandeel van de bemonsterde vliegtuigen meldde die dag hier een lage navigatienauwkeurigheid, ruim boven de mediane cel van de dag. Het zegt niet waarom.

js-interf-st-no-background-label = Geen achtergrondschatting

js-interf-st-no-background-text = De achtergrond van de dag (het gebruikelijke aandeel vliegtuigen dat een lage nauwkeurigheid meldt) kon niet uit voldoende cellen worden geschat, dus geen enkele cel wordt ermee vergeleken en er wordt geen oordeel geveld.

js-interf-st-not-anomalous-label = Niet afwijkend

js-interf-st-not-anomalous-text = Waargenomen, en geen detector kwalificeerde. Geen bewijs dat er niets gebeurde.

js-interf-st-not-degraded-label = Niet gedegradeerd

js-interf-st-not-degraded-text = Bemonsterd, en het aandeel vliegtuigen dat een lage nauwkeurigheid meldde viel niet op. Geen bewijs dat er niets gebeurde.

js-interf-st-too-few-label = Te weinig vliegtuigen

js-interf-st-too-few-text = Gepubliceerd (minstens 5 verschillende vliegtuigen waargenomen), maar er konden minder dan 10 vliegtuigen worden bemonsterd, dus er wordt geen oordeel geveld.

js-interf-starting-build = De engine wordt gestart en de kaart gebouwd…

js-interf-starting-route = De engine wordt gestart en de route gecontroleerd…

js-interf-state-clear-adsb = Vrij

js-interf-state-clear-adsb-text = Waargenomen met genoeg vliegtuigen en niet gemarkeerd. Geen bewijs dat er niets gebeurde.

js-interf-state-clear-ais = Vrij

js-interf-state-clear-ais-text = Waargenomen met genoeg vaartuigen en niet gemarkeerd. Geen bewijs dat er niets gebeurde.

js-interf-state-degraded-adsb = Gedegradeerd

js-interf-state-degraded-adsb-text = Een hoog aandeel van de bemonsterde vliegtuigen meldde die dag hier een lage navigatienauwkeurigheid, ruim boven de mediane cel van de dag.

js-interf-state-degraded-ais = Afwijkend

js-interf-state-degraded-ais-text = Minstens één detector markeerde die dag hier genoeg verschillende vaartuigen (minstens 3 vaartuigen en 20% van de waargenomen vaartuigen).

js-interf-state-notobs-adsb = Niet waargenomen

js-interf-state-notobs-adsb-text = Geen cel getekend: er werden te weinig vliegtuigen waargenomen om haar te publiceren. Dit is geen bewijs dat het gebied vrij was.

js-interf-state-notobs-ais = Niet waargenomen

js-interf-state-notobs-ais-text = Geen cel getekend: er werden te weinig vaartuigen waargenomen om haar te publiceren. Dit is geen bewijs dat het gebied vrij was.

js-interf-state-unassessed-adsb = Niet beoordeeld

js-interf-state-unassessed-adsb-text = Waargenomen, maar er konden te weinig vliegtuigen worden bemonsterd, de dag was verstoord, of de achtergrond van de dag kon niet worden geschat, dus er wordt geen oordeel geveld.

js-interf-state-unassessed-ais = Niet beoordeeld

js-interf-state-unassessed-ais-text = Waargenomen, maar er wordt geen oordeel geveld.

js-interf-status-unknown = Een status die deze pagina niet beschrijft.

js-interf-table-first = Eerste { $shown } van { $total } cellen getoond, relevante oordelen eerst.

js-interf-table-summary = Elke getekende cel als tabel ({ $n })

js-interf-the-day = De dag

js-interf-unknown-date = onbekende datum

js-interf-warn-cell-size = Dit bestand gebruikt een celgrootte van { $size }° die niet de vooraf vastgelegde is: het is niet de vooraf vastgelegde methode, dus de oordelen ervan zijn niet vergelijkbaar met bestanden die haar wel gebruiken.

js-interf-warn-cell-size-known = Dit bestand gebruikt een celgrootte van { $size }° die niet de vooraf vastgelegde is ({ $registered }°): het is niet de vooraf vastgelegde methode, dus de oordelen ervan zijn niet vergelijkbaar met bestanden die haar wel gebruiken.

js-interf-warn-day-confounded = Deze dag is verstoord: geen enkele cel is als gedegradeerd bestempeld vanwege de achtergrond van de dag (het mediane celaandeel was zelf hoog).

js-interf-warn-flag-disagrees =
    { $count ->
        [one] { $count } cel heeft een vlag "gedegradeerd" die niet overeenkomt met haar status. De status is wat wordt getekend.
       *[other] { $count } cellen hebben een vlag "gedegradeerd" die niet overeenkomt met hun status. De status is wat wordt getekend.
    }

js-interf-warn-no-licence = Dit bestand bevat geen tekst voor { $fields }. Het wordt getoond, maar een kaart zonder licentie en bronvermelding mag niet opnieuw worden gepubliceerd.

js-interf-warn-on-land-off = De detector voor posities op land stond uit voor dit bestand (er waren geen landpolygonen aangeleverd).

js-interf-warn-skipped =
    { $count ->
        [one] { $count } feature was geen geldige GeoJSON en is overgeslagen.
       *[other] { $count } features waren geen geldige GeoJSON en zijn overgeslagen.
    }

js-interf-warn-unknown-status = Statuswaarde(n) die deze pagina niet kent: { $values }. Ze worden getekend als "geen oordeel".

js-interf-withheld = achtergehouden (minder dan 5)

js-interf-written-by = geschreven door Kshana { $version }

js-kind-axis-3-d-position-error-m = 3D-positiefout (m)

js-kind-axis-c-n0-db-hz = C/N0 (dB-Hz)

js-kind-axis-code-jitter-m = codejitter (m)

js-kind-axis-code-tracking-jitter-m = codevolgjitter (m)

js-kind-axis-doppler-shift-hz = Dopplerverschuiving (Hz)

js-kind-axis-effective-c-n0-db-hz = effectieve C/N0 (dB-Hz)

js-kind-axis-elevation = elevatie (°)

js-kind-axis-fit-interval-s = fitinterval (s)

js-kind-axis-formal-position-sigma-m = formele positiesigma (m)

js-kind-axis-latitude = breedtegraad (°)

js-kind-axis-leo-satellites-added-to-the = LEO-satellieten toegevoegd aan de positiebepaling

js-kind-axis-mean-satellites-in-view = gemiddeld aantal satellieten in zicht

js-kind-axis-median-dilution-of-precision = mediane precisieverdunning

js-kind-axis-median-error-m = mediane fout (m)

js-kind-axis-median-pdop = mediane PDOP

js-kind-axis-metres = meter

js-kind-axis-observation-window-s = waarnemingsvenster (s)

js-kind-axis-offset-from-the-signal-s = afstand tot het midden van het signaal (MHz)

js-kind-axis-offset-from-the-snapshot-centre = afstand tot het midden van de momentopname (MHz)

js-kind-axis-pdop = PDOP

js-kind-axis-position-error-m = positiefout (m)

js-kind-axis-power-spectral-density-db-hz = spectrale vermogensdichtheid (dB/Hz, eenheidsvermogen)

js-kind-axis-power-spectral-density-dbw-hz = spectrale vermogensdichtheid (dBW/Hz)

js-kind-axis-probability-of-detection = detectiekans

js-kind-axis-range-error-m = afstandsfout (m)

js-kind-axis-relays = relais

js-kind-axis-sisre-root-mean-square-m = SISRE, kwadratisch gemiddelde (m)

js-kind-axis-time-error-ns = tijdfout (ns)

js-kind-axis-time-s = tijd (s)

js-kind-axis-time-since-the-start-min = tijd sinds de start (min)

js-kind-axis-update-period-s = updateperiode (s)

js-kind-cap-body-pnt-label = Relaispositiebepaling

js-kind-cap-campaign-label = Campagne

js-kind-cap-constellation-design-label = Dekking

js-kind-cap-leo-navmsg-label = Navigatiebericht

js-kind-cap-leo-pass-label = Passage en link

js-kind-cap-leo-pnt-chain-label = Keten van begin tot eind

js-kind-cap-leo-ppp-label = Positiebepaling

js-kind-cap-leo-pvt-label = Positiebepaling

js-kind-cap-leo-signal-label = Signaalontwerp

js-kind-cap-lunar-llr-datum-label = Laserafstandsmeting-datum

js-kind-cap-ntn-positioning-label = Positiebepaling

js-kind-cap-solar-system-label = Zonnestelsel

js-kind-cap-spectrum-label = Spectrum

js-kind-guided-doppler-error-hz = Dopplerfout (Hz)

js-kind-guided-duration-s = Duur (s)

js-kind-guided-earth-range-error-m = Afstandsfout aarde (m)

js-kind-guided-elevation-mask = Elevatiemasker (°)

js-kind-guided-first-jammer-bandwidth-mhz = Bandbreedte eerste jammer (MHz)

js-kind-guided-first-jammer-power-dbw = Vermogen eerste jammer (dBW)

js-kind-guided-first-jammer-range-m = Afstand eerste jammer (m)

js-kind-guided-first-jammer-received-power-dbw = Ontvangen vermogen eerste jammer (dBW)

js-kind-guided-first-phase-length-s = Duur van de eerste fase (s)

js-kind-guided-first-shell-altitude-km = Hoogte van de eerste schil (km)

js-kind-guided-first-shell-inclination = Inclinatie van de eerste schil (°)

js-kind-guided-first-signal-bandwidth-hz = Bandbreedte van het eerste signaal (Hz)

js-kind-guided-first-system-range-error-m = Afstandsfout eerste systeem (m)

js-kind-guided-fit-interval-s = Fitinterval (s)

js-kind-guided-gravity-field-degree = Graad van het zwaartekrachtveld

js-kind-guided-grid-step = Rasterstap (°)

js-kind-guided-integration-time-s = Integratietijd (s)

js-kind-guided-leo-satellites-in-the-sweep = LEO-satellieten in de sweep

js-kind-guided-loop-bandwidth-hz = Lusbandbreedte (Hz)

js-kind-guided-monte-carlo-runs = Monte Carlo-runs

js-kind-guided-network-synchronisation-error-m = Synchronisatiefout van het netwerk (m)

js-kind-guided-orbit-altitude-km = Baanhoogte (km)

js-kind-guided-orbit-determination-error-m = Fout in de baanbepaling (m)

js-kind-guided-orbit-inclination = Baaninclinatie (°)

js-kind-guided-pdop-threshold = PDOP-drempel

js-kind-guided-peak-elevation-of-the-pass = Piekelevatie van de passage (°)

js-kind-guided-points-per-orbit-track = Punten per baanspoor

js-kind-guided-receiver-noise-figure-db = Ruisgetal van de ontvanger (dB)

js-kind-guided-receiver-power-when-awake-mw = Vermogen van de ontvanger in actieve toestand (mW)

js-kind-guided-reference-c-n0-db-hz = Referentie-C/N0 (dB-Hz)

js-kind-guided-relay-altitude-km = Hoogte van de relais (km)

js-kind-guided-relay-inclination = Inclinatie van de relais (°)

js-kind-guided-relay-planes = Relaisvlakken

js-kind-guided-relay-range-error-m = Afstandsfout relais (m)

js-kind-guided-relays-per-plane = Relais per vlak

js-kind-guided-runs-per-case = Runs per geval

js-kind-guided-satellite-altitude-km = Hoogte van de satelliet (km)

js-kind-guided-second-system-range-error-m = Afstandsfout tweede systeem (m)

js-kind-guided-shared-condition = Gedeelde voorwaarde

js-kind-guided-slant-electron-content-tecu = Schuine elektronendichtheid (TECU)

js-kind-guided-slant-range-km = Schuine afstand (km)

js-kind-guided-spoofed-offset-m = Spoofing-afwijking (m)

js-kind-guided-spoofing-starts-s = Spoofing begint (s)

js-kind-guided-sweep-from = Sweep van

js-kind-guided-sweep-steps = Sweepstappen

js-kind-guided-sweep-to = Sweep tot

js-kind-guided-timeline-step-s = Tijdlijnstap (s)

js-kind-guided-tracking-threshold-db-hz = Volgdrempel (dB-Hz)

js-kind-guided-transmit-power-dbw = Zendvermogen (dBW)

js-kind-guided-update-period-s = Updateperiode (s)

js-kind-guided-user-latitude = Breedtegraad van de gebruiker (°)

js-kind-hint-a-band-under-this-carrier = een band onder deze draaggolf-ruisdichtheidsverhouding heeft de vergrendeling verloren

js-kind-hint-a-grid-point-is-available = een rasterpunt is beschikbaar zolang de positionele precisieverdunning daar onder blijft

js-kind-hint-a-satellite-must-be-this = een satelliet moet zo hoog staan om als in zicht te tellen

js-kind-hint-a-satellite-must-be-this-2 = een satelliet moet zo hoog staan om te worden gebruikt

js-kind-hint-a-satellite-of-the-first = een satelliet van het eerste systeem moet zo hoog staan

js-kind-hint-arc-one-message-is-fitted = boog waarover één bericht wordt gefit

js-kind-hint-code-tracking-loop-noise-bandwidth = ruisbandbreedte van de codevolglus

js-kind-hint-detail-of-the-truth-orbit = detailniveau van het zwaartekrachtmodel van de referentiebaan

js-kind-hint-distance-from-the-first-jammer = afstand van de eerste jammer tot de ontvanger

js-kind-hint-distance-to-the-satellite-in = afstand tot de satelliet in de bandafweging

js-kind-hint-drawn-while-acquiring-and-tracking = opgenomen tijdens acquisitie en tracking

js-kind-hint-equivalent-isotropically-radiated-power-of = equivalent isotroop uitgestraald vermogen van de eerste jammer

js-kind-hint-equivalent-isotropically-radiated-power-of-2 = equivalent isotroop uitgestraald vermogen van de band

js-kind-hint-filter-runs-averaged-for-each = filterruns waarover per geval wordt gemiddeld (meer is trager)

js-kind-hint-first-value-of-the-swept = eerste waarde van de doorlopen parameter

js-kind-hint-height-of-the-chain-s = hoogte van de satelliet van de keten

js-kind-hint-height-of-the-first-shell = hoogte van de banen van de eerste schil

js-kind-hint-height-of-the-relay-orbits = hoogte van de relaisbanen boven het hemellichaam

js-kind-hint-height-of-the-satellite-whose = hoogte van de satelliet waarvan het bericht wordt gefit

js-kind-hint-how-far-the-spoofer-moves = hoever de spoofer de berekende positie verschuift

js-kind-hint-how-finely-each-orbit-is = hoe fijn elke baan voor de tekening wordt bemonsterd

js-kind-hint-how-high-the-satellite-climbs = hoe hoog de satelliet klimt

js-kind-hint-how-long-the-first-phase = hoe lang de eerste fase duurt

js-kind-hint-how-long-the-receiver-integrates = hoe lang de ontvanger integreert voor één afstand

js-kind-hint-how-many-low-orbit-satellites = hoeveel satellieten in een lage baan de geometrie-sweep toevoegt

js-kind-hint-how-many-seeded-runs-make = hoeveel runs met een seed het ensemble vormen

js-kind-hint-how-many-values-are-run = hoeveel waarden worden doorlopen

js-kind-hint-how-often-a-new-message = hoe vaak een nieuw bericht wordt uitgegeven

js-kind-hint-how-wide-the-first-jammer = hoe breed de eerste jammer zijn vermogen verspreidt

js-kind-hint-ionosphere-along-the-path-in = ionosfeer langs het pad, in eenheden van totale elektronendichtheid

js-kind-hint-last-value-of-the-swept = laatste waarde van de doorlopen parameter

js-kind-hint-length-of-each-filter-run = duur van elke filterrun

js-kind-hint-length-of-the-run = duur van de run

js-kind-hint-length-of-the-timeline = duur van de tijdlijn

js-kind-hint-occupied-bandwidth-of-the-first = bezette bandbreedte van het eerste referentiesignaal

js-kind-hint-one-sigma-doppler-measurement-error = Doppler-meetfout van één sigma

js-kind-hint-one-sigma-error-of-a = fout van één sigma van een afstand tot een relais

js-kind-hint-one-sigma-error-of-the = fout van één sigma van de tweewegsafstand vanaf de aarde

js-kind-hint-orbital-planes-of-the-navigation = baanvlakken van de navigatierelais

js-kind-hint-power-of-the-first-jammer = vermogen van de eerste jammer bij de ontvanger

js-kind-hint-raises-the-noise-floor-under = verhoogt de ruisvloer onder elke band

js-kind-hint-satellites-in-each-plane = satellieten in elk vlak

js-kind-hint-sets-the-doppler-range-a = bepaalt het Dopplerbereik dat een koude zoekactie moet dekken

js-kind-hint-signal-in-space-range-error = signal-in-space-afstandsfout van het eerste systeem

js-kind-hint-signal-in-space-range-error-2 = signal-in-space-afstandsfout van het tweede systeem

js-kind-hint-signal-level-the-tracking-figures = signaalniveau waarop de volgcijfers worden opgegeven

js-kind-hint-spacing-of-the-latitude-and = afstand tussen de lijnen van het breedte- en lengtegraadraster

js-kind-hint-spacing-of-the-shared-mission = stapgrootte van het gedeelde tijdraster van de missie

js-kind-hint-the-part-of-the-range = het deel van de afstandsfout dat het bericht niet kan wegnemen

js-kind-hint-the-value-every-member-runs = de waarde waaronder elk lid draait

js-kind-hint-tilt-of-that-orbit = helling van die baan

js-kind-hint-tilt-of-the-first-shell = helling van de vlakken van de eerste schil

js-kind-hint-tilt-of-the-relay-planes = helling van de relaisvlakken

js-kind-hint-timing-error-between-satellites-as = tijdfout tussen satellieten, als afstand

js-kind-hint-when-the-spoofer-captures-the = wanneer de spoofer de ontvanger overneemt

js-kind-hint-where-the-receiver-stands = waar de ontvanger zich bevindt

js-kind-hint-where-the-user-stands = waar de gebruiker zich bevindt

js-kind-label-3-d-error = 3D-fout

js-kind-label-3-d-error-time-of = 3D-fout, aankomsttijd

js-kind-label-a-corrupted-frame-is-rejected = een beschadigd frame wordt geweigerd

js-kind-label-all-channels = alle kanalen

js-kind-label-availability = Beschikbaarheid

js-kind-label-band = Band

js-kind-label-bodies = Hemellichamen

js-kind-label-body = Hemellichaam

js-kind-label-both = beide

js-kind-label-case = Geval

js-kind-label-class = Klasse

js-kind-label-code-jitter = codejitter

js-kind-label-constellation = Constellatie

js-kind-label-doppler = Doppler

js-kind-label-event = Gebeurtenis

js-kind-label-evidence = Bewijs

js-kind-label-fewest-in-view = Minste in zicht

js-kind-label-field = Veld

js-kind-label-first-detection-after-onset = Eerste detectie na het begin

js-kind-label-frame-length = Framelengte

js-kind-label-fused = gefuseerd

js-kind-label-fused-cap = Gefuseerd

js-kind-label-gnss = GNSS

js-kind-label-gnss-and-leo = GNSS en LEO

js-kind-label-gnss-channels = GNSS-kanalen

js-kind-label-gnss-highest-in-sky = GNSS { $id } (het hoogst aan de hemel)

js-kind-label-gnss-only = alleen GNSS

js-kind-label-gnss-only-cap = Alleen GNSS

js-kind-label-gnss-signal = GNSS-signaal

js-kind-label-hdop = HDOP

js-kind-label-highest = Hoogste

js-kind-label-horizontal-error = horizontale fout

js-kind-label-horizontal-error-2 = Horizontale fout

js-kind-label-jammer = Jammer

js-kind-label-jump-threshold = Sprongdrempel

js-kind-label-largest-range-jump = Grootste afstandssprong

js-kind-label-largest-range-jump-against-the = grootste afstandssprong ten opzichte van de drempel

js-kind-label-leo = LEO

js-kind-label-leo-channels = LEO-kanalen

js-kind-label-leo-only = alleen LEO

js-kind-label-light-time-from-observer = Lichttijd vanaf { $observer }

js-kind-label-light-time-from-the-observer = Lichttijd vanaf de waarnemer

js-kind-label-light-time-one-way = Lichttijd, enkele reis

js-kind-label-lowest = Laagste

js-kind-label-lowest-c-n0 = Laagste C/N0

js-kind-label-mean = Gemiddelde

js-kind-label-mean-in-view = Gemiddeld in zicht

js-kind-label-median-convergence = Mediane convergentie

js-kind-label-median-pdop = Mediane PDOP

js-kind-label-member-runs = Runs van de leden

js-kind-label-message-switch-iod = berichtwissel, issue of data { $old } naar { $new }

js-kind-label-mission-length = Missieduur

js-kind-label-model = model

js-kind-label-monte-carlo-runs = Monte Carlo-runs

js-kind-label-noise-floor = Ruisvloer

js-kind-label-parameters = Parameters

js-kind-label-payload = Payload

js-kind-label-pdop = PDOP

js-kind-label-pdop-95th-percentile = PDOP, 95e percentiel

js-kind-label-peak-elevation = Piekelevatie

js-kind-label-peak-tracked-c-n0 = Hoogste gevolgde C/N0

js-kind-label-phase = Fase

js-kind-label-predicted-horizontal-sigma = voorspelde horizontale sigma

js-kind-label-quantisation-position = Kwantisatie, positie

js-kind-label-range-error = afstandsfout

js-kind-label-relays-above-the-mask = relais boven het masker

js-kind-label-relays-and-earth-link = relais en aardlink

js-kind-label-relays-only = alleen relais

js-kind-label-satellite = Satelliet

js-kind-label-satellites = Satellieten

js-kind-label-satellites-used = Gebruikte satellieten

js-kind-label-signal = Signaal

js-kind-label-signal-chip-spacing = { $name } ({ $spacing } chipafstand)

js-kind-label-sisre-after-quantisation = SISRE na kwantisatie

js-kind-label-sisre-root-mean-square = SISRE, kwadratisch gemiddelde

js-kind-label-spoofing-starts = spoofing begint

js-kind-label-standard-deviation = Standaardafwijking

js-kind-label-sun-separation = Afstand tot de zon

js-kind-label-sweep-runs = Sweep-runs

js-kind-label-system = Systeem

js-kind-label-time-above-the-mask = Tijd boven het masker

js-kind-label-time-error-root-mean-square = Tijdfout, kwadratisch gemiddelde

js-kind-label-tracked-component = gevolgde component

js-kind-label-tracking-threshold = Volgdrempel

js-kind-label-transmit-bandwidth = Zendbandbreedte

js-kind-label-vdop = VDOP

js-kind-label-welch-estimate-of-the-synthesised = Welch-schatting van de gesynthetiseerde samples

js-kind-label-whole-signal = heel signaal

js-kind-label-wideband-j-s-tolerated = Getolereerde J/S, breedband

js-kind-label-with-unit = { $label } ({ $unit })

js-kind-label-worst-site-availability = Beschikbaarheid van de slechtste locatie

js-kind-no = nee

js-kind-note-a-gap-is-an-epoch = Een gat is een epoch met te weinig relais in zicht voor een positiebepaling.

js-kind-note-a-helmert-transform-is-the = Een Helmert-transformatie is de verschuiving, rotatie en schaling met zeven parameters tussen twee referentiestelsels.

js-kind-note-a-low-earth-orbit-leo = Een satelliet in een lage aardbaan (LEO) trekt in enkele minuten over de hemel, dus zijn C/N0 (draaggolf-ruisdichtheidsverhouding) stijgt en daalt in een klokvorm; een GNSS-satelliet beweegt in dezelfde tijd nauwelijks.

js-kind-note-a-receiver-independent-exchange-format = Een record in de stijl van Receiver Independent Exchange Format (RINEX) 4. De LEO-recordtypen zijn een Kshana-uitbreiding, zoals de header aangeeft.

js-kind-note-a-single-pass-fixes-the = Eén passage legt de richting langs het spoor veel beter vast dan die dwars op het spoor.

js-kind-note-aos-is-acquisition-of-signal = AOS is acquisitie van het signaal, TCA het tijdstip van dichtste nadering en LOS verlies van het signaal.

js-kind-note-c-n0-is-the-carrier = C/N0 is de draaggolf-ruisdichtheidsverhouding. Een band onder de volgdrempel van de ontvanger heeft de vergrendeling verloren.

js-kind-note-cells-are-the-code-and = Cellen zijn de code- en Dopplerbins die een koude zoekactie moet testen.

js-kind-note-cold-is-a-first-fix = Koud is een eerste positiebepaling zonder voorkennis; heet is een positiebepaling kort na de vorige.

js-kind-note-dilution-of-precision-dop-scales = Precisieverdunning (DOP) schaalt een afstandsfout om naar een positiefout: G is geometrisch, P positie, H horizontaal, V verticaal. Percentielen gelden over elk rasterpunt en elke epoch.

js-kind-note-drawn-at-the-strongest-signal = Getekend bij het sterkste signaalniveau van de run. Een gat is een stuk zonder satelliet in zicht.

js-kind-note-each-body-carries-its-own = Elk hemellichaam heeft zijn eigen bewijslabel. Lichttijd is enkele reis, vanaf de waarnemer die in het scenario is genoemd.

js-kind-note-each-row-is-one-full = Elke rij is één volledige engine-run van het doorlopen scenario.

js-kind-note-each-rule-is-a-switch = Elke regel is een wissel naar een nieuwer bericht halverwege de passage.

js-kind-note-each-signal-is-drawn-about = Elk signaal wordt getekend rond zijn eigen middenfrequentie. Een gat is een spectrale nul.

js-kind-note-eirp-is-the-equivalent-isotropically = EIRP is het equivalent isotroop uitgestraald vermogen.

js-kind-note-every-phase-is-an-ordinary = Elke fase is een gewone scenario-run. De hashes identificeren de invoer en het resultaatdocument van elk lid.

js-kind-note-iod-is-the-issue-of = IOD is de issue of data: het serienummer van het bericht.

js-kind-note-j-s-is-the-jammer = J/S is de vermogensverhouding tussen jammer en signaal. Volgfractie is het aandeel van de run waarin de band boven de drempel blijft.

js-kind-note-p05-p50-and-p95-are = p05, p50 en p95 zijn het 5e, 50e en 95e percentiel. ci95 is het betrouwbaarheidsinterval van 95% voor het gemiddelde.

js-kind-note-parameters-are-public-with-a = Parameters zijn PUBLIC (met een bron), REPRESENTATIVE of WORKSHOP, zoals elke voorinstelling aangeeft.

js-kind-note-precise-point-positioning-ppp-converges = Precise point positioning (PPP) convergeert wanneer de fout onder het criterium blijft. NEES is de genormaliseerde gekwadrateerde schattingsfout, een controle op de consistentie van het filter.

js-kind-note-sisre-defined = SISRE is de signal-in-space-afstandsfout: wat het uitgezonden bericht aan de afstand van een gebruiker toevoegt. Hier is het de representatiefout van het bericht ten opzichte van de eigen referentiebaan van de engine.

js-kind-note-sisre-is-the-signal-in = SISRE is de signal-in-space-afstandsfout die wordt aangenomen voor de uitgezonden baan en klok van elk systeem.

js-kind-note-ssc-is-the-spectral-separation = SSC is de spectrale scheidingscoëfficiënt: hoeveel van het vermogen van het ene signaal binnen de ontvanger van het andere valt. Een streepje betekent dat de twee elkaar niet overlappen.

js-kind-note-the-chain-runs-the-signal = De keten doorloopt de fasen signaal, passage, navigatiebericht, positiebepaling en precieze positiebepaling in volgorde. Elke rij is een getal dat één fase berekende en de volgende gebruikte.

js-kind-note-the-doppler-and-pass-geometry = De monitor voor Doppler en passagegeometrie vergelijkt gemeten afstandssnelheden met die voorspeld uit de banen. De regel markeert het begin van de spoofer.

js-kind-note-the-engine-draws-its-spectrum = De engine tekent zijn spectrummodel als in-phase- en quadrature-samples (IQ) op één moment en schat het spectrum daaruit terug. Dezelfde samples vormen de SigMF-export (Signal Metadata Format).

js-kind-note-the-engine-s-own-documented = Het eigen gedocumenteerde binaire frame van de engine, afgesloten met een cyclische redundantiecontrole van 24 bits (CRC-24Q).

js-kind-note-the-gabor-root-mean-square = De Gabor-bandbreedte (kwadratisch gemiddelde) bepaalt hoe scherp op een signaal kan worden gemeten.

js-kind-note-the-largest-jammer-to-signal = De grootste jammer-signaalverhouding (J/S) waar elk signaal doorheen blijft volgen, voor een continue golf (CW), een jammer met aangepast spectrum en een breedbandjammer.

js-kind-note-the-shapiro-delay-is-the = De Shapiro-vertraging is de extra lichttijd door de zwaartekracht van de zon langs het pad.

js-kind-note-the-spectrum-kind-and-the = De soort spectrum en de soort jamming berekenen dezelfde link op twee manieren; de laatste kolom is hun verschil.

js-kind-note-time-of-arrival-toa-ranging = Afstandsmeting met aankomsttijd (TOA) op een downlink van een niet-terrestrisch netwerk (NTN): een breder signaal meet scherper.

js-kind-note-what-half-a-least-significant = Wat een half minst significant bit (LSB) van elk veld kost in positie en in klok, als afstand.

js-kind-rowhead-block = Blok

js-kind-rowhead-condition = Voorwaarde

js-kind-rowhead-figure = Cijfer

js-kind-rowhead-member = Lid

js-kind-rowhead-metric = Maat

js-kind-rowhead-monitor = Monitor

js-kind-rowhead-phase = Fase

js-kind-rowhead-satellite = Satelliet

js-kind-rowhead-signal = Signaal

js-kind-rowhead-solution = Oplossing

js-kind-sub-clock-offset-db = { $clock }, { $offset } dB

js-kind-sub-doppler-only = Alleen Doppler

js-kind-sub-from-to = { $from } tot { $to }

js-kind-sub-fused = gefuseerd

js-kind-sub-gnss-and-leo-latitude = GNSS en LEO, breedtegraad { $lat }°

js-kind-sub-gnss-only = alleen GNSS

js-kind-sub-gnss-only-latitude = alleen GNSS, breedtegraad { $lat }°

js-kind-sub-model-fit-seconds = { $model }, fit van { $fit } s

js-kind-threshold-4-needed-for-a-fix = 4 nodig voor een positiebepaling

js-kind-threshold-convergence-criterion = convergentiecriterium

js-kind-threshold-elevation-mask = elevatiemasker

js-kind-threshold-gnss-median = GNSS-mediaan

js-kind-threshold-tracking-threshold = volgdrempel

js-kind-title-acquisition = Acquisitie

js-kind-title-against-a-simulated-campaign = Tegenover een gesimuleerde campagne

js-kind-title-assumptions = Aannames

js-kind-title-band-trade-at-equal-transmit = Bandafweging bij gelijk zendvermogen

js-kind-title-bands = Banden

js-kind-title-beside-the-published-figures = Naast de gepubliceerde cijfers

js-kind-title-beside-the-published-speed-up = Naast de gepubliceerde versnelling

js-kind-title-bodies = Hemellichamen

js-kind-title-body = Hemellichaam

js-kind-title-by-latitude = Per breedtegraad

js-kind-title-c-n0-by-band-over = C/N0 per band over de run

js-kind-title-c-n0-over-the-pass = C/N0 over de passage

js-kind-title-cases = Gevallen

js-kind-title-central-body = Centraal hemellichaam

js-kind-title-closed-form-doppler-against-finite = Doppler in gesloten vorm tegenover eindige verschillen

js-kind-title-code-tracking-jitter = Codevolgjitter

js-kind-title-code-tracking-jitter-against-c = Codevolgjitter tegenover C/N0

js-kind-title-combined-over-the-members = Gecombineerd over de leden

js-kind-title-compatibility-with-gnss-signals = Compatibiliteit met GNSS-signalen

js-kind-title-constellations = Constellaties

js-kind-title-continuity-across-message-switches = Continuïteit over berichtwissels heen

js-kind-title-cross-check-against-the-jamming = Kruiscontrole tegenover de soort jamming

js-kind-title-datum-accuracy = Nauwkeurigheid van het datum

js-kind-title-dilution-of-precision-over-the = Precisieverdunning over het hele raster

js-kind-title-doppler = Doppler

js-kind-title-doppler-envelopes = Dopplerenveloppen

js-kind-title-doppler-only-fix = Positiebepaling met alleen Doppler

js-kind-title-doppler-over-the-pass = Doppler over de passage

js-kind-title-doppler-positioning-from-one-pass = Dopplerpositiebepaling uit één passage

js-kind-title-earth-link = Aardlink

js-kind-title-elevation = Elevatie

js-kind-title-encoded-frame = Gecodeerd frame

js-kind-title-epoch = Epoch

js-kind-title-epoch-and-frame = Epoch en referentiestelsel

js-kind-title-events = Gebeurtenissen

js-kind-title-every-node-of-the-sweep = Elk knooppunt van de sweep

js-kind-title-field-table = Veldentabel

js-kind-title-figures-of-merit = Kwaliteitsmaten

js-kind-title-filter-noise = Filterruis

js-kind-title-fit-interval-trade = Afweging van het fitinterval

js-kind-title-fix-quality-against-observation-window = Kwaliteit van de positiebepaling tegenover het waarnemingsvenster

js-kind-title-frame-checks = Framecontroles

js-kind-title-frame-hexadecimal = Frame, hexadecimaal

js-kind-title-geometry-against-latitude = Geometrie tegenover breedtegraad

js-kind-title-geometry-as-leo-satellites-are = Geometrie naarmate LEO-satellieten worden toegevoegd

js-kind-title-geometry-position-dilution-of-precision = Geometrie: positionele precisieverdunning

js-kind-title-global-coverage = Wereldwijde dekking

js-kind-title-gnss-leo-and-fused = GNSS, LEO en gefuseerd

js-kind-title-gnss-reference = GNSS-referentie

js-kind-title-hand-offs-between-phases = Overdrachten tussen fasen

js-kind-title-helmert-fit = Helmert-fit

js-kind-title-helmert-transform-parameters = Parameters van de Helmert-transformatie

js-kind-title-inputs = Invoer

js-kind-title-ionosphere-free-band-pairs = Ionosfeervrije bandparen

js-kind-title-jammer-tolerance = Jammertolerantie

js-kind-title-jammers = Jammers

js-kind-title-joint-fix = Gezamenlijke positiebepaling

js-kind-title-leo-against-gnss = LEO tegenover GNSS

js-kind-title-limitations = Beperkingen

js-kind-title-links = Links

js-kind-title-member-runs = Runs van de leden

js-kind-title-members-under-the-shared-conditions = Leden onder de gedeelde voorwaarden

js-kind-title-message = Bericht

js-kind-title-message-models-compared = Vergelijking van berichtmodellen

js-kind-title-message-switches = Berichtwissels

js-kind-title-metric-against-axis = { $metric } tegenover { $axis }

js-kind-title-metric-distribution-over-runs = { $metric }: verdeling over de runs

js-kind-title-mid-pass-update = Update halverwege de passage

js-kind-title-modelled = Gemodelleerd

js-kind-title-monte-carlo = Monte Carlo

js-kind-title-navigation-message-stage = Fase navigatiebericht

js-kind-title-not-modelled = Niet gemodelleerd

js-kind-title-notes = Notities

js-kind-title-notes-on-the-spoofing-model = Notities bij het spoofingmodel

js-kind-title-observation-windows = Waarnemingsvensters

js-kind-title-one-pass-alone = Eén passage alleen

js-kind-title-orbit = Baan

js-kind-title-over-the-message-sequence = Over de berichtenreeks

js-kind-title-pass = Passage

js-kind-title-pass-c-n0-of-the = Passage: C/N0 van het hele signaal en van de gevolgde component

js-kind-title-pass-code-tracking-jitter = Passage: codevolgjitter

js-kind-title-pass-doppler = Passage: Doppler

js-kind-title-pass-stage = Fase passage

js-kind-title-passes = Passages

js-kind-title-phases = Fasen

js-kind-title-position-error-gnss-leo-and = Positiefout: GNSS, LEO en de gefuseerde positiebepaling

js-kind-title-position-uncertainty-relays-alone-and = Positieonzekerheid: alleen relais, en met de aardlink

js-kind-title-positioning-by-signal-bandwidth = Positiebepaling naar signaalbandbreedte

js-kind-title-positioning-gnss-alone-against-the = Positiebepaling: GNSS alleen tegenover de gefuseerde positiebepaling

js-kind-title-power-spectral-density = Spectrale vermogensdichtheid

js-kind-title-power-spectral-density-of-each = Spectrale vermogensdichtheid van elk signaal

js-kind-title-precise-point-positioning = Precise point positioning

js-kind-title-published-comparison = Gepubliceerde vergelijking

js-kind-title-quantisation-budget = Kwantisatiebudget

js-kind-title-range-residuals = Afstandsresiduen

js-kind-title-ranging-stations = Afstandsmetingsstations

js-kind-title-reading-the-trade = De afweging lezen

js-kind-title-realised-position-error = Gerealiseerde positiefout

js-kind-title-receiver = Ontvanger

js-kind-title-receiver-power-budget = Vermogensbudget van de ontvanger

js-kind-title-reflector-information = Informatie over de reflector

js-kind-title-relay-constellation = Relaisconstellatie

js-kind-title-relays-in-view = Relais in zicht

js-kind-title-reproducibility = Reproduceerbaarheid

js-kind-title-retroreflectors = Retroreflectoren

js-kind-title-rinex-style-record = Record in RINEX-stijl

js-kind-title-round-trips = Rondreizen

js-kind-title-run = Run

js-kind-title-satellites-in-view-against-latitude = Satellieten in zicht tegenover breedtegraad

js-kind-title-sensitivity-to-a-line-of = Gevoeligheid voor een kanteling van de zichtlijn

js-kind-title-shared-conditions = Gedeelde voorwaarden

js-kind-title-signal-components = Signaalcomponenten

js-kind-title-signal-stage = Fase signaal

js-kind-title-signals = Signalen

js-kind-title-sisre-against-fit-interval = SISRE tegenover fitinterval

js-kind-title-sisre-against-update-period = SISRE tegenover updateperiode

js-kind-title-sisre-weights = SISRE-gewichten

js-kind-title-snapshot = Momentopname

js-kind-title-snapshot-against-the-model = Momentopname tegenover het model

js-kind-title-snapshot-spectrum-welch-estimate-against = Spectrum van de momentopname: Welch-schatting tegenover het model

js-kind-title-sources = Bronnen

js-kind-title-spoofer-and-monitor-settings = Instellingen van spoofer en monitor

js-kind-title-spoofing-monitor-probability-of-detection = Spoofingmonitor: detectiekans

js-kind-title-statistics-over-the-runs = Statistieken over de runs

js-kind-title-sweep = Sweep

js-kind-title-systems = Systemen

js-kind-title-systems-in-the-fix = Systemen in de positiebepaling

js-kind-title-the-archived-campaign = De gearchiveerde campagne

js-kind-title-time-error = Tijdfout

js-kind-title-time-error-by-receiver-clock = Tijdfout per ontvangerklok

js-kind-title-time-scale = Tijdschaal

js-kind-title-time-to-first-fix-and = Tijd tot de eerste positiebepaling en energie per positiebepaling

js-kind-title-time-transfer-by-clock-and = Tijdoverdracht per klok en signaalniveau

js-kind-title-trade-conditions = Voorwaarden van de afweging

js-kind-title-update-period-trade = Afweging van de updateperiode

js-kind-title-user = Gebruiker

js-kind-title-user-range-error-through-the = Gebruikersafstandsfout over de passage

js-kind-title-validated = Getoetst

js-kind-title-what-each-stage-hands-to = Wat elke fase aan de volgende doorgeeft

js-kind-title-what-this-run-is-and = Wat deze run is, en wat niet

js-kind-title-when-each-monitor-detects = Wanneer elke monitor detecteert

js-kind-title-work-done = Verrichte arbeid

js-kind-yes = ja

js-ledger-rows =
    { $n ->
        [one] { $n } registerrij
       *[other] { $n } registerrijen
    }

js-lib-abbr-apv = naderingsprocedure met verticale geleiding

js-lib-abbr-araim = geavanceerde autonome integriteitsbewaking door de ontvanger

js-lib-abbr-auc = oppervlakte onder de curve

js-lib-abbr-c-n0 = draaggolf-ruisdichtheid

js-lib-abbr-ccsds = Consultative Committee for Space Data Systems

js-lib-abbr-cli = opdrachtregelinterface

js-lib-abbr-csac = atoomklok op chipschaal

js-lib-abbr-cw = continue golf

js-lib-abbr-doi = digital object identifier

js-lib-abbr-dop = precisieverdunning

js-lib-abbr-eo = aardobservatie

js-lib-abbr-gnss = wereldwijd navigatiesatellietsysteem

js-lib-abbr-gps = Global Positioning System

js-lib-abbr-hal = horizontale alarmgrens

js-lib-abbr-hpl = horizontaal beschermingsniveau

js-lib-abbr-imu = traagheidsmeeteenheid

js-lib-abbr-ins = traagheidsnavigatiesysteem

js-lib-abbr-iot = Internet of Things

js-lib-abbr-itu-t = International Telecommunication Union, Telecommunication Standardization Sector

js-lib-abbr-j-s = jammer-signaalverhouding

js-lib-abbr-leo = lage aardbaan

js-lib-abbr-llr = laserafstandsmeting naar de maan

js-lib-abbr-meo = middelhoge aardbaan

js-lib-abbr-mtie = maximale tijdintervalfout

js-lib-abbr-ntn = niet-terrestrisch netwerk

js-lib-abbr-ocxo = thermostaatgestuurde kristaloscillator

js-lib-abbr-oem = Orbit Ephemeris Message

js-lib-abbr-omm = Orbit Mean-elements Message

js-lib-abbr-pdop = positionele precisieverdunning

js-lib-abbr-pnt = positiebepaling, navigatie en tijdsynchronisatie

js-lib-abbr-ppp = precise point positioning

js-lib-abbr-raim = autonome integriteitsbewaking door de ontvanger

js-lib-abbr-rf = radiofrequentie

js-lib-abbr-rinex = Receiver Independent Exchange Format

js-lib-abbr-roc = ontvangerkarakteristiek

js-lib-abbr-sbas = satellietgebaseerd augmentatiesysteem

js-lib-abbr-sgp4 = Simplified General Perturbations 4, een baanpropagator

js-lib-abbr-sisre = signal-in-space-afstandsfout

js-lib-abbr-slam = gelijktijdige lokalisatie en kaartvorming

js-lib-abbr-spp = positiebepaling met één punt

js-lib-abbr-tdev = tijdafwijking

js-lib-abbr-tle = tweeregelige elementenset

js-lib-abbr-toml = het bestandsformaat van het scenario

js-lib-abbr-trn = terreingebonden navigatie

js-lib-abbr-uhf = ultrahoge frequentie

js-lib-abbr-ukf = unscented Kalman-filter

js-lib-abbr-utc = gecoördineerde wereldtijd

js-lib-abbr-val = verticale alarmgrens

js-lib-abbr-vlbi = interferometrie met zeer lange basislijn

js-lib-abbr-vpl = verticaal beschermingsniveau

js-lib-abbr-wg = Working Group

js-lib-areas-ground-track = Grondspoor

js-lib-areas-holdover = Holdover

js-lib-compare-availability = Beschikbaarheid

js-lib-compare-holdover = Holdover

js-lib-compare-timing-p95 = Tijdsynchronisatie p95

js-lib-compare-timing-rms = Tijdsynchronisatie RMS

js-lib-counts-explorer-tally = { $validated } van { $total } mogelijkheden getoetst aan een onafhankelijke externe referentie · { $modelled } gemodelleerd · { $partner } in handen van partners — hier getoond als { $cards } mogelijkheidskaarten in { $domains } domeinen, { $evidence } bewijsclaims

js-lib-counts-validated-tally = { $validated } van { $total } mogelijkheden getoetst aan een onafhankelijke externe referentie — hier getoond als { $cards } mogelijkheidskaarten en { $evidence } bewijsclaims

js-lib-engine-busy = { $verb }…

js-lib-engine-busy-seconds = { $verb }… { $s } s

js-lib-engine-page-http = het enginebestand gaf HTTP { $status } terug

js-lib-engine-page-not-running = de engine draait hier niet

js-lib-engine-worker-crashed = engine-worker is gecrasht

js-lib-evidence-aria = Bewijs: { $tier }, { $count }

js-lib-evidence-ledger-rows =
    { $n ->
        [one] { $n } registerrij
       *[other] { $n } registerrijen
    }

js-lib-evidence-rows-behind = Registerrijen achter dit resultaat

js-lib-geometry-url-bad-mc = Het aantal Monte Carlo-samples is niet een van { $choices }; { $default } wordt gebruikt.

js-lib-geometry-url-bad-number = "{ $key }" is geen getal van { $min } tot { $max }; de standaardwaarde wordt gebruikt.

js-lib-geometry-url-bad-site = De locatie is niet breedtegraad,lengtegraad[,hoogte] binnen het bereik; de standaardlocatie wordt gebruikt.

js-lib-geometry-url-bad-sky = De skyline is geen voorinstelling, geen tabel van 360 bins en geen canyon binnen het bereik; een open horizon wordt gebruikt.

js-lib-geometry-url-bad-sys = De constellatielijst is niet G, E, C en hoogstens één L:<LEO-voorinstelling> die deze weergave kent; de standaardmix wordt gebruikt.

js-lib-geometry-url-own-tle = De afzender gebruikte eigen baanelementen (TLE), die een link niet meedraagt; in plaats daarvan worden de voorinstellingen getoond.

js-lib-geometry-url-repeated = "{ $key }" komt meer dan eens voor; de eerste waarde wordt gebruikt.

js-lib-geometry-url-too-long = Het adres is langer dan { $max } tekens, dus geen van de instellingen is gelezen.

js-lib-geometry-url-unreadable = Het adres kon niet worden gelezen.

js-lib-guided-duration-s-hint = hoe lang het grondspoor wordt gepropageerd

js-lib-guided-duration-s-label = Duur (s)

js-lib-guided-dut1-s-hint = afwijking van de aardrotatie; verschuift het grondspoor oost/west

js-lib-guided-dut1-s-label = UT1−UTC (s)

js-lib-guided-mask-deg-hint = een satelliet moet zo hoog staan om als zichtbaar te tellen

js-lib-guided-mask-deg-label = Elevatiemasker (°)

js-lib-guided-seed-hint = een andere ruisdraw van dezelfde fysica

js-lib-guided-seed-label = Willekeurige seed

js-lib-guided-sigma-uere-m-hint = 1-σ gebruikersequivalente afstandsfout voor de positiesamenvatting

js-lib-guided-sigma-uere-m-label = Afstandsfout σ (m)

js-lib-guided-station-lat-deg-hint = breedtegraad van het grondstation — bepaalt de passagegeometrie

js-lib-guided-station-lat-deg-label = Breedtegraad van het station (°)

js-lib-guided-station-lon-deg-hint = lengtegraad van het grondstation

js-lib-guided-station-lon-deg-label = Lengtegraad van het station (°)

js-lib-guided-step-s-hint = bemonsteringsinterval van het grondspoor

js-lib-guided-step-s-label = Tijdstap (s)

js-lib-guided-threshold-ns-hint = budget binnen de specificatie; "beschikbaar" zolang de fout eronder blijft

js-lib-guided-threshold-ns-label = Specificatiedrempel (ns)

js-lib-guided-time-duration-s-hint = totale duur van de run

js-lib-guided-time-duration-s-label = Duur (s)

js-lib-guided-time-step-s-hint = integratie- en bemonsteringsinterval

js-lib-guided-time-step-s-label = Tijdstap (s)

js-lib-guided-user-altitude-km-hint = de baanhoogte van het gebruikersruimtevaartuig

js-lib-guided-user-altitude-km-label = Hoogte van de gebruiker (km)

js-lib-guided-user-inclination-deg-hint = de inclinatie van de baan van de gebruiker

js-lib-guided-user-inclination-deg-label = Inclinatie van de gebruiker (°)

js-lib-imufit-card-accel-slope = Allan-helling van de accelerometer, vroeg (circa -0,5 voor witte ruis)

js-lib-imufit-card-bias = Bias van de accelerometer, gemiddeld (m/s²)

js-lib-imufit-card-bias-instability = Biasinstabiliteit van de accelerometer (m/s²), 0 wanneer de curve geen bodem heeft

js-lib-imufit-card-gyro-bias = Bias van de gyro, gemiddeld (rad/s)

js-lib-imufit-card-gyro-slope = Allan-helling van de gyro, vroeg (circa -0,5 voor witte ruis)

js-lib-imufit-card-note-n = Notitie { $n }

js-lib-imufit-card-q-arw = Hoekrandomwalk van de gyro, q_arw (rad²/s)

js-lib-imufit-card-q-va = Snelheidsrandomwalk van de accelerometer, q_va (m²/s³)

js-lib-imufit-card-sample-rate = Samplefrequentie

js-lib-imufit-card-samples = Samples

js-lib-imufit-card-span = Spanwijdte

js-lib-jammertest-card-clean-epochs = Schone epochs

js-lib-jammertest-card-clean-hours = Schone uren

js-lib-jammertest-card-detected = Gedetecteerd binnen tolerantie

js-lib-jammertest-card-detection-rate = Detectiepercentage (elk alarm)

js-lib-jammertest-card-evaluable = Beoordeelbaar

js-lib-jammertest-card-fa-epochs = Epochs met vals alarm

js-lib-jammertest-card-fa-per-hour = Runs met vals alarm per uur

js-lib-jammertest-card-fa-runs = Runs met vals alarm

js-lib-jammertest-card-in-tol-rate = Gedetecteerd binnen tolerantie, percentage

js-lib-jammertest-card-late = Te laat

js-lib-jammertest-card-median-latency = Mediane detectievertraging

js-lib-jammertest-card-median-recover = Mediane hersteltijd

js-lib-jammertest-card-missed = Gemist

js-lib-jammertest-card-na = n.v.t.

js-lib-jammertest-card-not-assessable = Geen enkele test was beoordeelbaar in dit logboek, dus er kan geen detectiepercentage of vertraging worden opgegeven. Dat is een resultaat, geen fout van de pagina: niets hier is geslaagd.

js-lib-jammertest-card-not-json = { $name }: geen JSON ({ $reason }).

js-lib-jammertest-card-not-scorecard = { $name }: geen jammertest-scorekaart (tests[] en summary zijn vereist).

js-lib-jammertest-card-tests = Tests in het deel van het plan

js-lib-jammertest-card-too-large = { $name }: groter dan 8 MiB; deze pagina leest een scorekaart tot die grootte.

js-lib-kpi-available-everywhere = overal beschikbaar, elke epoch

js-lib-kpi-available-everywhere-pdop = overal beschikbaar, elke epoch (PDOP, positionele precisieverdunning, onder { $thr })

js-lib-kpi-drops-under = zakt onder de volgdrempel van { $thr } dB-Hz: vergrendeling verloren

js-lib-kpi-end-of-mission = aan het einde van de missie

js-lib-kpi-figure-tiers = Niveaus van de cijfers: { $parts }.

js-lib-kpi-n-modelled = { $n } gemodelleerd

js-lib-kpi-n-partner = { $n } in handen van partners

js-lib-kpi-n-validated = { $n } getoetst

js-lib-kpi-no-change = geen verandering

js-lib-kpi-no-fix = { $pct } % van de tijd of plaatsen zonder positiebepaling

js-lib-kpi-no-fix-pdop = { $pct } % van de tijd of plaatsen zonder positiebepaling bij PDOP onder { $thr }

js-lib-kpi-over-jump = boven de sprongdrempel van { $thr } m

js-lib-kpi-over-pdop = boven de PDOP-drempel { $thr }

js-lib-kpi-stays-above = blijft boven de volgdrempel van { $thr } dB-Hz

js-lib-kpi-under-jump = onder de sprongdrempel van { $thr } m

js-lib-kpi-under-pdop = onder de PDOP-drempel { $thr }

js-lib-orbit3d-apogee = apogeum

js-lib-orbit3d-perigee = perigeum

js-lib-orbit3d-prov-scenario = scenario { $hash }

js-lib-orbit3d-title = Baan (ECI, orthografisch)

js-lib-orbit3d-view-angles = az { $az }° · el { $el }°

js-lib-overlay-meta-clock-bias-m = Klokbias

js-lib-overlay-meta-converged-pos-3sigma-m = Positie 3σ

js-lib-overlay-meta-converged-pos-rms-m = Positie RMS

js-lib-overlay-meta-converged-pos-sigma-m = Positie σ

js-lib-overlay-meta-final-clock-freq-sigma = Klokfrequentie σ

js-lib-overlay-meta-mean-relays-in-view = Relais in zicht

js-lib-overlay-meta-pos-p95-m = Positie p95

js-lib-overlay-meta-pos-rms-m = Positie RMS

js-lib-overlay-meta-postfit-rms-m = Postfit-RMS

js-lib-overlay-prov-scenario = scenario { $hash }

js-lib-overlay-subtitle = |fout| (ns) tegenover tijd — { $n } runs

js-lib-overlay-time-s = tijd (s)

js-lib-overlay-title = Overlay: tijdfout tijdens uitval

js-lib-packs-cannot-unpack = deze browser kan het vastgelegde bestand niet uitpakken

js-lib-replay-demos-below-130 = Alleen azimuts onder 130° behouden (vermeld)

js-lib-replay-demos-coastal-drag-off = Drag-off langs de kust

js-lib-replay-demos-combined-event = Gecombineerde gebeurtenis

js-lib-replay-demos-drag-off-stated = Positie-drag-off (vermeld door de demo)

js-lib-replay-demos-ferry-drag-off = Veerboottraject, positie-drag-off

js-lib-replay-demos-ferry-drag-off-description = Een verzonnen logboek van een veerboot, Tallinn naar Helsinki, 1 Hz. Vanaf 1500 s trekt een positie-drag-off de gemelde positie weg terwijl de ontvanger een geldige positiebepaling blijft melden.

js-lib-replay-demos-fjord = Natuurlijke degradatie in een fjord

js-lib-replay-demos-masked-sky = Veerboottraject, halve hemel afgeschermd

js-lib-replay-demos-masked-sky-description = Hetzelfde veerbootlogboek, met de westelijke helft van de hemel uitgeschakeld vanaf 600 s, een smallere hemel van 900 s tot 1200 s, en de drag-off vanaf 1500 s: één run waarin de hemel, het signaal en de positie na elkaar uitvallen.

js-lib-replay-demos-open-sea-jamming = Jamming op open zee

js-lib-replay-demos-port-approach = Tijd-spoofing bij havenanadering

js-lib-replay-demos-source-training = Synthetisch scenario { $id }: de nmea_training-stroom en het instructeurslogboek van de engine, gescoord door de receiver-trust ervan.

js-lib-replay-demos-source-trust = Synthetisch logboek { $id }: verzonnen NMEA, gescoord door de receiver-trust van de engine.

js-lib-replay-demos-west-masked = Westelijke helft van de hemel afgeschermd (vermeld)

js-lib-replay-demos-west-masked-again = Westelijke helft opnieuw afgeschermd (vermeld)

js-lib-report-charts = Grafieken

js-lib-report-eyebrow = het precieze moment

js-lib-report-figures-of-merit = Kwaliteitsmaten

js-lib-report-footer = Kshana { $version } · scenario { $hash } · gegenereerd { $iso }. Reproduceerbaar uit scenario + seed + engineversie. Draait lokaal; er wordt niets geüpload.

js-lib-report-not-applicable = niet van toepassing (geen aanval ingesteld)

js-lib-report-scenario-definition = Scenariodefinitie (TOML)

js-lib-report-th-clock = Klok

js-lib-report-th-metric = Maat

js-lib-report-th-validation = Validatie

js-lib-report-th-value = Waarde

js-lib-report-tier-note = Elke kwaliteitsmaat is gelabeld { $validated } (getoetst aan een onafhankelijke externe referentie) of { $modelled } (uit eerste principes, intern getest) — afgeleid uit de verificatiematrix.

js-lib-report-title = Kshana — scenariorapport

js-lib-skydraw-azimuth-range = azimut { $from } tot { $to } graden

js-lib-skydraw-describe = { $listed } satellieten vermeld, { $heard } met een signaal

js-lib-skydraw-describe-mean = { $listed } satellieten vermeld, { $heard } met een signaal, gemiddeld { $snr } dB-Hz

js-lib-skydraw-east = O

js-lib-skydraw-no-signal-from = geen signaal uit { $sectors }

js-lib-skydraw-none-listed = Op dit moment staan er geen satellieten in het logboek.

js-lib-skydraw-north = N

js-lib-skydraw-sat-heard = { $sys } { $prn }: elevatie { $el }, azimut { $az }, signaal { $snr } dB-Hz

js-lib-skydraw-sat-quiet = { $sys } { $prn }: elevatie { $el }, azimut { $az }, vermeld, geen signaal

js-lib-skydraw-south = Z

js-lib-skydraw-unheard-sector = Satellieten vermeld tussen azimut { $from } en { $to } graden, geen met een signaal

js-lib-skydraw-west = W

js-lib-skyline-edit-describe = Skyline over { $blocked } van 360 graden azimut; hoogste { $el }° bij azimut { $az }°.

js-lib-skyline-edit-open = Open horizon: geen skyline.

js-lib-stages-all-planets = Alle planeten

js-lib-stages-au-from-sun = { $d } au van de zon

js-lib-stages-band-carrier = Draaggolf { $name }, { $mhz } MHz

js-lib-stages-bin-title = { $from } tot { $to }{ $unit }: { $count } runs

js-lib-stages-body-and-moons = { $name } en zijn manen

js-lib-stages-cell-title = breedtegraad { $lat }°, lengtegraad { $lon }° · { $field } { $value }

js-lib-stages-chain-navmsg = Navigatiebericht

js-lib-stages-chain-pass = Passage en link

js-lib-stages-chain-ppp = Precise point positioning

js-lib-stages-chain-pvt = Gefuseerde positiebepaling

js-lib-stages-chain-signal = Signaalontwerp

js-lib-stages-coverage-aria = { $field } over { $body }, per breedte- en lengtegraad

js-lib-stages-feature-n = feature { $n }

js-lib-stages-flag = vlag

js-lib-stages-frequency-mhz = frequentie (MHz)

js-lib-stages-from-to = { $from } tot { $to }

js-lib-stages-geojson-aria = De GeoJSON-export getekend op een kaart

js-lib-stages-histogram = Histogram

js-lib-stages-inner-planets = Binnenplaneten

js-lib-stages-km-from-centre = { $d } km van { $centre }

js-lib-stages-linear-scale = lineaire schaal

js-lib-stages-link-light-time = { $from } tot { $to }: enkele-reis-lichttijd { $time } s

js-lib-stages-longitude-axis = lengtegraad · breedtegraad langs de zijkant omhoog

js-lib-stages-mission-time = missietijd (s)

js-lib-stages-noise-floor = ruisvloer

js-lib-stages-orrery-note = { $scale } · xy-vlak van het referentiestelsel, gezien vanaf de noordpool

js-lib-stages-panel-n = Paneel { $n }

js-lib-stages-plan-view-aria = Bovenaanzicht van { $centre } en de hemellichamen eromheen, { $scale }

js-lib-stages-psd-at-t = Spectrale vermogensdichtheid bij t = { $t } s

js-lib-stages-psd-axis = spectrale vermogensdichtheid (dBW/Hz)

js-lib-stages-runs = runs

js-lib-stages-sat-title = { $constellation } { $id } · breedtegraad { $lat }°, lengtegraad { $lon }°

js-lib-stages-satellites = satellieten

js-lib-stages-spectrum-at-t = spectrum bij t = { $t } s

js-lib-stages-sqrt-scale = afstandsschaal met vierkantswortel

js-lib-stages-the-body = het hemellichaam

js-lib-stages-time-s = tijd (s)

js-lib-stages-unit-alarm = Alarm

js-lib-stages-unit-cn0 = Draaggolf-ruisdichtheid

js-lib-stages-unit-position = Positie en bescherming

js-lib-stages-unit-satellites = Satellieten

js-lib-stages-unit-time-error = Tijdfout

js-lib-stages-waterfall-aria = Waterfall van de spectrale vermogensdichtheid: frequentie horizontaal, tijd naar beneden

js-lib-stages-whole-band = Hele band

js-lib-sweep-clock-availability = Beschikbaarheid van { $who }

js-lib-sweep-clock-holdover = Holdover van { $who } (s)

js-lib-sweep-clock-timing-p95 = Tijdsynchronisatie p95 van { $who } (ns)

js-lib-sweep-clock-timing-rms = Tijdsynchronisatie RMS van { $who } (ns)

js-lib-sweep-max-altitude = maximale hoogte (km)

js-lib-sweep-max-elevation = maximale elevatie (°)

js-lib-sweep-max-speed = maximale snelheid (m/s)

js-lib-sweep-min-altitude = minimale hoogte (km)

js-lib-sweep-peak-doppler = piek-Doppler (Hz)

js-lib-sweep-prov-scenario = scenario { $hash }

js-lib-sweep-y-vs-x = { $y } tegenover { $x }

js-lib-tabs-3d-orbit = 3D-baan

js-lib-tabs-figures-of-merit = Kwaliteitsmaten

js-lib-tabs-stability = Stabiliteit

js-lib-tabs-sweep = Sweep

js-lib-tabs-time-series = Tijdreeks

js-lib-tour-ashforde-body = Bedankt voor het verkennen van Kshana. Wij bouwen open, reproduceerbare, op bewijs gebaseerde techniek voor missies die niet mogen falen — eerlijk over wat getoetst is en wat gemodelleerd. Vragen, een samenwerking of een studie? Neem contact met ons op via contact@ashforde.org.

js-lib-tour-ashforde-title = Van Ashforde® OÜ

js-lib-tour-capabilities-body = Kies een domeintab — Banen, Tijdsynchronisatie, Traagheid, GNSS, Veerkracht, Maan, AI/ML, Interoperabiliteit — om de mogelijkheden te zien, elk gelabeld als getoetst of gemodelleerd, met een uitvoerknop ▸ voor de uitgewerkte scenario's. Open “Bewijs en herkomst” in een domein om het bewijs na te gaan, of schakel “Alleen getoetst” in om alleen te tonen wat aan een onafhankelijke externe referentie is getoetst.

js-lib-tour-capabilities-title = Verken de engine, domein voor domein

js-lib-tour-cite-body = Kshana is gebouwd om naar te verwijzen — een citeerbare softwarerelease met een DOI, plus papers in peer-stijl over de optimismekloof bij RF-verstoringen en een voorwaardelijk beschermingsniveau voor tijdsynchronisatie. Kopieer de citatie rechtstreeks vanaf hier.

js-lib-tour-cite-title = Publicaties en hoe te citeren

js-lib-tour-download-report-body = Het tabblad Sweep varieert één parameter over een bereik; “Vastpinnen om te vergelijken” legt twee of meer runs naast elkaar met het Δ ertussen (werkt voor alle scenariotypen — klok, Mars-PNT, positiebepaling…); en deze knop downloadt de run als een op zichzelf staand, offline HTML-rapport.

js-lib-tour-download-report-title = Sweepen, vergelijken en exporteren

js-lib-tour-guided-body = Begeleide instellingen passen zich aan het scenario aan — seed, specificatiedrempel, duur, elevatiemasker, baanhoogte — en elke wijziging draait direct opnieuw.

js-lib-tour-guided-title = Stel de schuifregelaars af

js-lib-tour-mcp-body = Een MCP-server laat AI-assistenten de getoetste engine draaien in plaats van te raden; een JetBrains-plugin draait scenario's vanuit het rechtsklikmenu.

js-lib-tour-mcp-title = Gebruik het vanuit een AI-agent of uw IDE

js-lib-tour-playground-body = Kies een scenario uit de keuzelijst — of klik op ▸ uitvoeren bij een mogelijkheid hierboven — en de engine draait als WebAssembly op uw machine. Er wordt niets geüpload.

js-lib-tour-playground-title = Draai het in uw browser

js-lib-tour-run-body = Draai het huidige scenario. Open “Geavanceerd” om de TOML te bewerken en alles te wijzigen; “Deellink kopiëren” reproduceert precies deze run voor iemand anders.

js-lib-tour-run-title = Draai het

js-lib-tour-tabs-body = Wissel tussen de kwaliteitsmaten, de tijdreeksgrafiek, de klokstabiliteit (Allan-deviatie) en — voor banenruns — een interactieve 3D-baanweergave.

js-lib-tour-tabs-title = Lees de resultaten

js-lib-tour-validation-body = Dezelfde verkenner is ook het bewijsregister: elk domein heeft een lade “Bewijs en herkomst” — het cijfer, de externe referentie waaraan het is getoetst en een eerlijke status getoetst / gemodelleerd per claim. “Alleen getoetst” filtert op de rijen die aan een dataset zijn getoetst.

js-lib-tour-validation-title = Bewijs, geen bijvoeglijke naamwoorden

js-lib-views-3-sigma-bound = 3-sigmagrens

js-lib-views-3d-position-error = 3D-positiefout

js-lib-views-a-parameter = een parameter

js-lib-views-band-runs = Tijdfoutband over { $runs } Monte Carlo-runs

js-lib-views-band-the-runs = Tijdfoutband over de Monte Carlo-runs

js-lib-views-below-tracking = onder de volgdrempel

js-lib-views-chart = grafiek

js-lib-views-classical = klassiek

js-lib-views-epoch = epoch

js-lib-views-four-needed = 4 nodig voor een positiebepaling

js-lib-views-free-inertial = vrij traagheidsnavigeren

js-lib-views-gnss-denied = GNSS geblokkeerd

js-lib-views-ground-track = Grondspoor

js-lib-views-heatmap-effective = Effectieve draaggolf-ruisdichtheid per satelliet en tijd

js-lib-views-heatmap-nominal = Nominale draaggolf-ruisdichtheid (geen jammer) per satelliet en tijd

js-lib-views-horizontal-alert-limit = horizontale alarmgrens

js-lib-views-horizontal-hpl = horizontaal (HPL)

js-lib-views-id-bound = grens { $id }

js-lib-views-id-median = mediaan { $id }

js-lib-views-id-offset = afwijking { $id }

js-lib-views-id-p95 = p95 { $id }

js-lib-views-map-matched = kaartgekoppeld

js-lib-views-map-matched-title = Kaartgekoppeld tegenover positiefout bij vrij traagheidsnavigeren

js-lib-views-metric = maat

js-lib-views-oscillator = oscillator

js-lib-views-oscillator-source = oscillator ({ $source })

js-lib-views-position-error-axis = positiefout ({ $unit })

js-lib-views-position-error-m = positiefout (m)

js-lib-views-position-error-run = Positiefout over de run

js-lib-views-position-m = positie (m)

js-lib-views-predicted-time-error = Voorspelde tijdfout sinds de laatste positiebepaling

js-lib-views-protection-level-m = beschermingsniveau (m)

js-lib-views-protection-levels = Beschermingsniveaus tegenover de alarmgrens

js-lib-views-quantum = kwantum

js-lib-views-relay-error-bound = Positiefout van relaisnavigatie en de 3-sigmagrens ervan

js-lib-views-satellites = satellieten

js-lib-views-satellites-tracking = Satellieten in zicht en nog in tracking

js-lib-views-shaded-gnss-denied = gearceerd: GNSS geblokkeerd

js-lib-views-slot-guard = slotbewaking

js-lib-views-spoofed-offset = Tijdafwijking door spoofing tegenover de detectiegrens

js-lib-views-sweep-of = Sweep van { $parameter }: { $metric }

js-lib-views-sync-error-axis = synchronisatiefout ({ $unit })

js-lib-views-sync-error-run = Synchronisatiefout over de run

js-lib-views-threshold = drempel

js-lib-views-time-error-ns = tijdfout (ns)

js-lib-views-time-ns = tijd (ns)

js-lib-views-time-s = tijd (s)

js-lib-views-time-since-fix = tijd sinds de laatste positiebepaling (s)

js-lib-views-timing-error-axis = tijdsynchronisatiefout ({ $unit })

js-lib-views-timing-error-run = Tijdsynchronisatiefout over de run

js-lib-views-tracking = in tracking

js-lib-views-value = waarde

js-lib-views-vertical-vpl = verticaal (VPL)

js-lib-views-visible = zichtbaar

js-lib-views-word-enbw = equivalente ruisbandbreedte

js-lib-views-word-nfft = FFT-lengte

js-lib-views-word-stec = schuine TEC

js-lib-views-word-toa = aankomsttijd

js-lib-views-word-ttff = tijd tot de eerste positiebepaling

js-lib-views-word-tx = zenden

js-lib-views-word-zwd = natte vertraging in het zenit

js-lunar-address-outside-range = { $label }: "{ $raw }" valt buiten { $min } tot { $max }; de waarde uit het bestand wordt gebruikt.

js-lunar-address-too-long = Het adres was te lang; de standaardwaarden worden getoond.

js-lunar-address-unknown-source = Onbekende bron in het adres; de opname wordt getoond.

js-lunar-alert-limit = alarmgrens { $value } (illustratief)

js-lunar-alert-not-stated = alarmgrens niet vermeld

js-lunar-bearing-east = 90° O

js-lunar-bearing-west = 90° W

js-lunar-cell-title = { $lat }°, { $lon }°: gecorrigeerd { $corrected }, beschikbaarheid { $availability }, dekking { $coverage }

js-lunar-copy-address = Kopieer het adres uit de adresbalk.

js-lunar-counts = { $sats } satellieten, { $points } rasterpunten, { $epochs } epochs, { $trials } Monte Carlo-trials per epoch. Label: { $label }.

js-lunar-engine-no-start = De engine kon in deze browser niet starten ({ $reason }). Open in plaats daarvan een resultaatbestand.

js-lunar-engine-unknown-kind = Deze engine ({ $version }) kent de soort { $kind } niet; engine 0.36 is nodig.

js-lunar-fig-availability-region = Beschikbaarheid over het gebied

js-lunar-fig-corrected-3d = Gecorrigeerde fout, { $n } %, 3D

js-lunar-fig-coverage = Dekking

js-lunar-fig-epochs-within = epochs binnen { $value }

js-lunar-fig-horizontal-vertical = horizontaal { $h }, verticaal { $v }

js-lunar-fig-hpl-below-alert = HPL onder de alarmgrens

js-lunar-fig-hpl-vpl = HPL, VPL hoogstens

js-lunar-fig-improvement = Verbeteringsfactor

js-lunar-fig-lowest-point = Laagste in een punt

js-lunar-fig-points-always-available = Punten beschikbaar op elke epoch

js-lunar-fig-uncorrected-3d = Ongecorrigeerde fout, { $n } %, 3D

js-lunar-fig-worst-point = Slechtste punt

js-lunar-file-not-json = Dit bestand is geen JSON.

js-lunar-file-not-object = Dit bestand is geen JSON-object.

js-lunar-file-too-large = { $name }: groter dan 32 MiB; deze pagina leest resultaatbestanden tot die grootte.

js-lunar-file-value = bestand: { $value }

js-lunar-full-of-total = { $full } van { $total }

js-lunar-give-value = { $label }: geef een waarde van { $min } tot { $max }.

js-lunar-give-whole-value = { $label }: geef een waarde van { $min } tot { $max } (een geheel getal).

js-lunar-honesty-affiliation = Niet verbonden aan of onderschreven door enig agentschap.

js-lunar-honesty-assumptions = Onder de vermelde openbare aannames, geen uitspraak over de prestaties van enig echt systeem.

js-lunar-in-grid-spacing = Ringafstand van het raster, graden

js-lunar-in-latency = Vertraging van de correctie, seconden

js-lunar-in-seed = Seed

js-lunar-in-station-lat = Breedtegraad van het station, graden

js-lunar-in-station-lon = Lengtegraad van het station, graden

js-lunar-in-survey-error = Opmetingsfout van het station (1-sigma), meter

js-lunar-in-threshold = Nauwkeurigheidsdrempel, meter

js-lunar-in-time-step = Tijdstap, seconden

js-lunar-in-trials = Monte Carlo-trials per epoch

js-lunar-input-out-of-range = { $label } valt buiten het bereik.

js-lunar-json-field-not-json = Het veld json van het bestand is geen JSON.

js-lunar-key-50-or-more = 50 % of meer

js-lunar-key-90-or-more = 90 % of meer

js-lunar-key-95-or-more = 95 % of meer

js-lunar-key-99-or-more = 99 % of meer

js-lunar-key-above = boven { $value }

js-lunar-key-above-threshold = boven { $value } × drempel

js-lunar-key-below-50 = onder 50 %

js-lunar-key-between = { $from } tot { $to }

js-lunar-key-between-threshold = { $from } tot { $to } × drempel

js-lunar-key-up-to = tot { $value }

js-lunar-key-up-to-threshold = tot { $value } × drempel

js-lunar-layer-availability = beschikbaarheid

js-lunar-layer-coverage = dekking

js-lunar-layer-error = gecorrigeerde fout

js-lunar-layer-range = gecorrigeerde fout over het eigen bereik

js-lunar-legend-no-figure = geen cijfer (overal niet beschikbaar)

js-lunar-legend-radius = dekkingsstraal

js-lunar-legend-threshold = drempel, { $value }

js-lunar-legend-worst = slechtste punt

js-lunar-link-copied = Link gekopieerd.

js-lunar-map-desc = { $points } rasterpunten van de pool tot { $rim }° breedtegraad. Bij { $meet } ervan ligt de gecorrigeerde fout op het { $percentile }e percentiel binnen de drempel van { $threshold }. Gekleurd naar { $layer }. Het station ligt op { $lat }°, { $lon }°.

js-lunar-map-note-one-band = { $share } % van de punten valt in één band van de drempelschaal, dus de kaart toont weinig variatie: kleur op "eigen bereik" om te zien hoe de fout over het gebied varieert.

js-lunar-needs-newer-engine = Deze studie heeft engine { $need } of nieuwer nodig; de engine die hier draait is v{ $version }. De opname of een resultaatbestand kan nog wel worden getoond.

js-lunar-no = nee

js-lunar-no-recording = Er wordt nog geen opname van deze studie meegeleverd: die wordt bij de release gemaakt met engine 0.36. Draai haar hier met een engine die de soort kent, of open een resultaatbestand.

js-lunar-no-scenario = Deze site heeft nog geen { $file }: het komt met engine 0.36. Open in plaats daarvan een resultaatbestand.

js-lunar-no-scenario-note = Deze site heeft nog geen { $file } (het komt met engine 0.36), dus een run hier is niet mogelijk; open in plaats daarvan een resultaatbestand.

js-lunar-not-report = Dit is geen rapport van de soort { $kind }.

js-lunar-not-stated = niet vermeld

js-lunar-note-none = Het bestand vermeldt geen notitie.

js-lunar-note-withheld = De eigen verklaring van het bestand noemt een programma of een agentschap, dus deze pagina toont haar niet; de verklaring bovenaan de pagina geldt.

js-lunar-point-epochs-reason = point-epochs: { $reason }

js-lunar-radius-desc = Dekkingsstraal over { $count } azimuts: kortste { $lo } km bij { $loAz }°, langste { $hi } km bij { $hiAz }°.

js-lunar-radius-desc-limited =
    { $count ->
        [one] { $count } bereikt de rand van het raster, dus de dekking reikt daar minstens zo ver.
       *[other] { $count } bereiken de rand van het raster, dus de dekking reikt daar minstens zo ver.
    }

js-lunar-radius-hollow = Holle punten bereiken de rand van het raster: de dekking houdt minstens zo ver stand langs die peiling.

js-lunar-radius-none = Het rapport vermeldt geen dekkingsstraal.

js-lunar-radius-per-azimuth = dekkingsstraal per azimut

js-lunar-radius-point = { $az }°: { $km } km

js-lunar-radius-point-limited = { $az }°: { $km } km (bereikt de rand van het raster: minstens zo ver)

js-lunar-radius-zero = Op elke peiling ligt de dekking al bij het station onder 95 %, dus de straal is 0 km: de gecorrigeerde fout overschrijdt daar de drempel van { $value }.

js-lunar-reason-station-missing = het station ziet niet elke satelliet die de gebruiker gebruikt

js-lunar-reason-user-lt4 = minder dan vier satellieten in zicht van de gebruiker

js-lunar-run-stopped = De run is gestopt: { $message }

js-lunar-running = De studie wordt in deze browser uitgevoerd…

js-lunar-running-elapsed = De studie wordt in deze browser uitgevoerd… { $seconds } s

js-lunar-scenario-missing-keys = Het scenariobestand heeft geen { $keys }; het kan hier niet worden gewijzigd.

js-lunar-set-inputs = Stel de invoer in en druk op Hier uitvoeren.

js-lunar-showing = { $what } wordt getoond.

js-lunar-showing-engine = { $what } wordt getoond (engine { $version }).

js-lunar-source-error = { $what }: { $error }

js-lunar-station = station

js-lunar-station-title = station { $lat }°, { $lon }°

js-lunar-table-count =
    { $n ->
        [one] { $n } punt, het dichtst bij het station eerst.
       *[other] { $n } punten, de dichtstbijzijnde bij het station eerst.
    }

js-lunar-th-corrected = Gecorrigeerde fout, { $n } %

js-lunar-threshold-title = gecorrigeerde fout { $value } (de drempel)

js-lunar-what-file = het bestand { $name }

js-lunar-what-recording = de opname die met de Studio wordt meegeleverd

js-lunar-what-run = een run in deze browser (engine { $version })

js-lunar-worst-at = bij { $lat }°, { $lon }°

js-lunar-worst-title = slechtste punt { $lat }°, { $lon }°: { $value }

js-lunar-yes-at-least = ja: minstens zo ver

js-lunarinfra-above-95-point = boven het 95 %-punt

js-lunarinfra-advisory = Adviserende software, geen typegoedgekeurde apparatuur; geen enkel zendpad van welke aard ook.

js-lunarinfra-arc-note = Golflengte van de draaggolf { $value } m.

js-lunarinfra-arc-title = Elke boog

js-lunarinfra-bars-not-loaded = het drempelbestand is niet geladen

js-lunarinfra-bars-not-shown = De vooraf vastgelegde drempels konden niet worden getoond ({ $reason }).

js-lunarinfra-bars-note = Vastgelegd voordat een studie werd gescoord, met de oordelen van record (engine-commit { $commit }). Niets is VALIDATED; een drempel gemarkeerd als NOT MET wordt vastgepind door een test die de misser vastlegt, en geen enkele is versoepeld.

js-lunarinfra-bars-title = Tegenover de vooraf vastgelegde drempels

js-lunarinfra-bars-wrong-file = het drempelbestand is niet het bestand dat deze pagina leest

js-lunarinfra-blurb-carrier-phase = Een oppervlaktestation en een orbiter die dubbelverschillen van draaggolffase van GNSS-signalen van de aarde gebruiken: kunnen de geheeltallige ambiguïteiten worden vastgelegd, en wat doet dat met de positiegrens? Het snelle voorbeeld.

js-lunarinfra-blurb-frame-coestimation = De zeven parameters van het maandatum uit laserafstandsmeting vanaf aardstations, met en zonder afstanden tussen orbiter en oppervlaktestation: hoeveel verbetert de informatie?

js-lunarinfra-blurb-geodesy-sensitivity = Hoe gevoelig zijn laserafstandsmeting, orbitervolging, een gravimeter en een oppervlakteklok voor de getijden-Love-getallen h2, k2 en l2 van de maan en zijn fysieke libratie?

js-lunarinfra-blurb-od-consistency = Baanbepaling aan boord met GNSS van de aarde in een bijna-rechtlijnige halobaan, tegenover een onafhankelijke radiometrische grondoplossing van dezelfde boog: komen de twee overeen binnen hun vermelde onzekerheden, en merkt de consistentiecontrole een modelleringsfout op wanneer er een wordt aangebracht? Naast elkaar getoond.

js-lunarinfra-blurb-space-tie = GNSS, VLBI en laserafstandsmeting op één ruimtevaartuig: hoe nauwkeurig kunnen de afwijkingen tussen de drie technieken worden gekoppeld, tegenover de fout van de lokale koppeling op het ruimtevaartuig?

js-lunarinfra-bound-label = Positieonzekerheid, float en vastgelegd, logaritmische schaal

js-lunarinfra-bound-note = Positieonzekerheid van één sigma van het station en de orbiter met de ambiguïteiten als float en met ze vastgelegd (wat vastleggen zou opleveren als het werd bereikt).

js-lunarinfra-bound-title = Positiegrens, float en vastgelegd

js-lunarinfra-chip-na = n.v.t.

js-lunarinfra-comp-normal = normaal

js-lunarinfra-comp-position = positie (3D)

js-lunarinfra-comp-radial = radiaal

js-lunarinfra-comp-transverse = transversaal

js-lunarinfra-compare-note = Over { $sets } willekeurige stationssets was de kleinste eigenwaarde met de orbiterlinks niet kleiner in { $lambda } en het spoor niet groter in { $trace }; de mediane stijging van de kleinste eigenwaarde was { $median } keer.

js-lunarinfra-compare-title = De vergelijking in cijfers

js-lunarinfra-crsigma-label = Cramér-Rao-sigma, logaritmische schaal

js-lunarinfra-crsigma-note = In meter aan het oppervlak.

js-lunarinfra-crsigma-title = Cramér-Rao-sigma per parameter

js-lunarinfra-days =
    { $n ->
        [one] { $n } dag
       *[other] { $n } dagen
    }

js-lunarinfra-direction = richting { $n }

js-lunarinfra-disclosures = Openbaarmakingen

js-lunarinfra-eig-label = Eigenwaarden van de informatie, logaritmische schaal

js-lunarinfra-eig-note = De zeven eigenwaarden van de informatiematrix, de kleinste eerst, zonder en met de links tussen orbiter en station. De kleinste stijgt { $times } keer, en het Cramér-Rao-spoor daalt tot { $share } van zijn waarde. Dit veronderstelt dat de baan bekend is in de maanassen (de fout ervan zit in de afstandssigma van de orbiter).

js-lunarinfra-eig-title = Informatie in elke richting van het datum

js-lunarinfra-fact-arc = Boog

js-lunarinfra-fact-hash = Scenariohash

js-lunarinfra-fact-llr-rows = Rijen laserafstandsmeting

js-lunarinfra-fact-orbit-family = Baanfamilie

js-lunarinfra-fact-orbiter-arc = Boog van de orbiter

js-lunarinfra-fact-orbiter-rows = Rijen van de orbiter

js-lunarinfra-fact-study = Studie

js-lunarinfra-fact-wavelength = Golflengte van de draaggolf

js-lunarinfra-families-note = De RMS van de partiële afgeleide van elke parameter over de rijen van de familie, en het aantal rijen. Een nul is een parameter waarvoor die familie blind is. De k2-gevoeligheid van de orbiterfamilie is een cijfer aan de bovenkant.

js-lunarinfra-families-title = Wat elke familie ziet

js-lunarinfra-findings = Bevindingen

js-lunarinfra-fix-note-a = Het aandeel Monte Carlo-trials dat elke geheeltallige ambiguïteit correct vastlegde (met de standaardfout ervan), en het percentage dat de bootstrapschatting voorspelt.

js-lunarinfra-fix-note-b = Het vastleggen van gehele getallen wordt bij deze invoer NIET bereikt: de beste boog legt { $share } van de trials vast.

js-lunarinfra-fix-note-c = Er is geen tijd tot vastleggen om te tonen, omdat vastleggen niet wordt bereikt.

js-lunarinfra-fix-rate-label = Percentage geheeltallig vastgelegd tegenover booglengte

js-lunarinfra-fix-title = Vastlegpercentage tegenover booglengte

js-lunarinfra-fixed = vastgelegd

js-lunarinfra-float = float

js-lunarinfra-fraction-above-95 = Deel van de trials boven het 95 %-punt

js-lunarinfra-ground-radiometric = onafhankelijke radiometrische grondoplossing

js-lunarinfra-injected-error = aangebrachte fout { $value } m/s²

js-lunarinfra-mean-consistency = Gemiddelde consistentiestatistiek

js-lunarinfra-mean-q = gemiddelde q

js-lunarinfra-miss-line = { $id } is { $status }: { $value }

js-lunarinfra-miss-no-fix = Het vastleggen van geheeltallige ambiguïteiten wordt bij deze invoer NIET bereikt: de beste boog legt { $share } van de Monte Carlo-trials vast.

js-lunarinfra-na = n.v.t.

js-lunarinfra-nominal = nominaal

js-lunarinfra-not-result = dit is geen resultaat van maaninfrastructuur

js-lunarinfra-not-verified = Niet geverifieerd

js-lunarinfra-offset-precision-label = Precisie van de afwijking tegenover de lokale koppeling, log-log

js-lunarinfra-offsets-note = Translatiesigma per as, schaal- en rotatiesigma aan het oppervlak, in meter.

js-lunarinfra-offsets-title = De afwijkingen bij elke koppelfout (boog van { $days } dagen, { $epochs } epochs)

js-lunarinfra-onboard-gnss = GNSS van de aarde aan boord

js-lunarinfra-open-failed = { $title } kon niet worden geopend: { $reason }.

js-lunarinfra-opening = { $title } wordt geopend…

js-lunarinfra-orbit-uncertainty-log = Baanonzekerheid per component, logaritmische schaal

js-lunarinfra-orbiter-days = orbiter, { $days } d

js-lunarinfra-q-note = Gemiddelde van de consistentiestatistiek q over { $trials } trials; { $expected } is wat een consistent paar oplossingen geeft. Het deel van de trials boven het 95 %-punt is het detectiepercentage van de controle.

js-lunarinfra-q-title = De consistentiecontrole, nominaal tegenover aangebrachte fout

js-lunarinfra-recorded =
    { $n ->
        [one] { $title }: het vastgelegde resultaat van de engine (versie { $version }).
       *[other] { $title }: de vastgelegde resultaten van de engine (versie { $version }).
    }

js-lunarinfra-rel-label = Sigma ten opzichte van nominaal, logaritmische schaal

js-lunarinfra-rel-note = Cramér-Rao-sigma als percentage van de nominale waarde, met alle vier de families samen. h2 en l2 zijn linearisatiepunten, geen geverifieerde waarden; k2 komt uit een gepubliceerde fit.

js-lunarinfra-rel-title = Hoe goed elke parameter kan worden vastgepind, tegenover zijn nominale waarde

js-lunarinfra-result-not-json = het resultaat is geen JSON ({ $reason })

js-lunarinfra-result-not-loaded = het vastgelegde resultaat { $file } is niet geladen

js-lunarinfra-row-above-95 = Trials boven het 95 %-punt (chikwadraat 95 % = { $chi })

js-lunarinfra-row-crtrace = Cramér-Rao-spoor

js-lunarinfra-row-degeneracy = Degeneratiemaat

js-lunarinfra-row-formal-diff = Formele sigma van dat verschil

js-lunarinfra-row-ground-meas = Grond: metingen, epochs met een station

js-lunarinfra-row-mean-diff = Gemiddeld verschil van de twee banen

js-lunarinfra-row-mean-q = Gemiddelde q (6 verwacht)

js-lunarinfra-row-observations = Waarnemingen

js-lunarinfra-row-onboard-epochs = Aan boord: epochs met een of meer / vier of meer satellieten

js-lunarinfra-row-onboard-meas = Aan boord: metingen, gemiddeld aantal gevolgde satellieten

js-lunarinfra-row-origin-scale = Correlatie tussen oorsprong en schaal

js-lunarinfra-row-origin-sigma = Sigma van de oorsprong, m

js-lunarinfra-row-rank-defect = Rang (defect)

js-lunarinfra-row-smallest-eig = Kleinste eigenwaarde

js-lunarinfra-row-trace-ground = Steekproef over formeel spoor, grond

js-lunarinfra-row-trace-onboard = Steekproef over formeel spoor, aan boord

js-lunarinfra-row-within-95 = Trials binnen het 95 %-punt

js-lunarinfra-series-bootstrapped = bootstrapped

js-lunarinfra-series-floor = ondergrens

js-lunarinfra-series-monte-carlo = Monte Carlo

js-lunarinfra-side-note = De baan: { $family }, een boog van { $arc } dagen van een baan van { $period } dagen, elke { $sample } s bemonsterd.

js-lunarinfra-side-title = Naast elkaar

js-lunarinfra-sigma-note = Positieonzekerheid van één sigma per component, in meter, uit de twee schattingen van dezelfde boog.

js-lunarinfra-sigma-over-nominal = sigma / nominaal

js-lunarinfra-sigma-title = Hoe goed elke kant de baan kent

js-lunarinfra-station-days = station, { $days } d

js-lunarinfra-status-verdict = { $status }: { $verdict }

js-lunarinfra-subsets-note = Het toevoegen van een familie verlaagde de kleinste eigenwaarde nooit ({ $lambda } van { $pairs } toevoegingen), maar het spoor van de pseudo-inverse was slechts in { $trace } van { $pairs } niet groter, omdat een toegevoegde familie de rang kan verhogen.

js-lunarinfra-subsets-title = Elke combinatie van families

js-lunarinfra-sweep-note = De slechtste translatiecomponent van elke afwijking, in meter, terwijl de fout van de koppeling tussen de drie technieken op het ruimtevaartuig wordt doorlopen. Met de vastgelegde sigma's van de technieken (GNSS { $gnss } m, VLBI { $vlbi } m, laser { $slr } m) worden de afwijkingen beperkt door meetruis, niet door de koppeling; de koppeling bepaalt de ondergrens alleen voor bijna perfecte technieken.

js-lunarinfra-sweep-title = Precisie van de technieksafwijkingen tegenover de lokale koppeling (boog van { $days } dagen)

js-lunarinfra-th-arc-days = Boog, dagen

js-lunarinfra-th-bar = Drempel

js-lunarinfra-th-bootstrapped = Bootstrap-percentage

js-lunarinfra-th-budget-exhausted = Zoekbudget uitgeput (trials)

js-lunarinfra-th-common-sats = Epochs met 2 of meer gemeenschappelijke satellieten

js-lunarinfra-th-crtrace = Cramér-Rao-spoor

js-lunarinfra-th-dd-ambiguities = Dubbelverschil-ambiguïteiten

js-lunarinfra-th-epochs = Epochs

js-lunarinfra-th-families = Families

js-lunarinfra-th-family = Familie

js-lunarinfra-th-local-tie = Sigma van de lokale koppeling, m

js-lunarinfra-th-mc-fix-rate = Monte Carlo-vastlegpercentage

js-lunarinfra-th-median-ambiguity = Mediane ambiguïteitssigma, cycli

js-lunarinfra-th-offset = Afwijking

js-lunarinfra-th-quantity = Grootheid

js-lunarinfra-th-rank = Rang

js-lunarinfra-th-rotation = Rotatie aan het oppervlak, m

js-lunarinfra-th-rows = Rijen

js-lunarinfra-th-scale = Schaal aan het oppervlak, m

js-lunarinfra-th-smallest-eig = Kleinste eigenwaarde

js-lunarinfra-th-translation = Translatie x, y, z, m

js-lunarinfra-th-value = Waarde

js-lunarinfra-th-verdict = Oordeel

js-lunarinfra-th-with-links = Met orbiterlinks

js-lunarinfra-th-without-links = Zonder orbiterlinks

js-lunarinfra-title-carrier-phase = Draaggolffase, oppervlak en orbiter

js-lunarinfra-title-frame-coestimation = Gezamenlijke schatting van het referentiestelsel

js-lunarinfra-title-geodesy-sensitivity = Love-getallen en libratie

js-lunarinfra-title-od-consistency = Consistentie van de baanbepaling

js-lunarinfra-title-space-tie = Koppeling in de ruimte

js-lunarinfra-unknown-study = dit resultaat van maaninfrastructuur is de studie "{ $study }", die deze pagina niet leest

js-lunarinfra-where-missed = Waar deze studie de drempel miste.

js-lunarinfra-with-links = met orbiterlinks

js-lunarinfra-without-links = zonder orbiterlinks

js-lunarinfra-x-arc-length = booglengte, dagen

js-lunarinfra-x-local-tie = sigma van de lokale koppeling, m (log)

js-lunarinfra-y-fixed-correctly = correct vastgelegd, %

js-lunarinfra-y-offset-sigma = sigma van de afwijking, m (log); de gestippelde ondergrens is de koppeling alleen, sqrt(2) × de koppelfout

js-meaning-body-generic = het hemellichaam

js-meaning-body-the = het hemellichaam { $name }

js-meaning-card-label-sub = { $k }, { $sub }

js-meaning-checks-of =
    { $n ->
        [one] { $av } van { $n } controle
       *[other] { $av } van { $n } controles
    }

js-meaning-coverage-average-label = Gemiddeld in zicht

js-meaning-coverage-big-min =
    { $n ->
        [one] Minstens { $n } satelliet in zicht op elke plaats, gemiddeld { $mean }.
       *[other] Minstens { $n } satellieten in zicht op elke plaats, gemiddeld { $mean }.
    }

js-meaning-coverage-big-none = Sommige plaatsen zien soms geen satelliet; gemiddeld zijn er { $mean } in zicht.

js-meaning-coverage-fewest-label = Minste in zicht, ergens

js-meaning-coverage-line-many = Met { $names } samen is een positiebepaling mogelijk op { $share } % van de plaatsen en tijden rond { $body }.

js-meaning-coverage-line-many-pdop = Met { $names } samen is een positiebepaling mogelijk op { $share } % van de plaatsen en tijden rond { $body } (geometriekwaliteit, PDOP, onder { $thr }).

js-meaning-coverage-line-none = Een positiebepaling is mogelijk op { $share } % van de plaatsen en tijden rond { $body }.

js-meaning-coverage-line-none-pdop = Een positiebepaling is mogelijk op { $share } % van de plaatsen en tijden rond { $body } (geometriekwaliteit, PDOP, onder { $thr }).

js-meaning-coverage-line-one = Met { $names } is een positiebepaling mogelijk op { $share } % van de plaatsen en tijden rond { $body }.

js-meaning-coverage-line-one-pdop = Met { $names } is een positiebepaling mogelijk op { $share } % van de plaatsen en tijden rond { $body } (geometriekwaliteit, PDOP, onder { $thr }).

js-meaning-coverage-places-label = Plaatsen met een positiebepaling

js-meaning-duration-days =
    { $n ->
        [one] { $days } dag
       *[other] { $days } dagen
    }

js-meaning-ensemble-big-many = Over veel ruisdraws houdt { $q } gemiddeld { $thr } ns aan gedurende { $qd }; { $c } gedurende { $cd }.

js-meaning-ensemble-big-runs =
    { $n ->
        [one] Over { $n } ruisdraw houdt { $q } gemiddeld { $thr } ns aan gedurende { $qd }; { $c } gedurende { $cd }.
       *[other] Over { $n } ruisdraws houdt { $q } gemiddeld { $thr } ns aan gedurende { $qd }; { $c } gedurende { $cd }.
    }

js-meaning-ensemble-line = Negen van de tien draws van { $name } houden stand gedurende { $band }.

js-meaning-ensemble-mean = gemiddelde

js-meaning-ensemble-mean-band = gemiddelde; 90 %-band { $band }

js-meaning-error-p95-label = Fout, 95 % van de tijd, { $name }

js-meaning-generic-big = { $label }: { $value }.

js-meaning-generic-line-one = Ook uit deze run: { $a }.

js-meaning-generic-line-two = Ook uit deze run: { $a } en { $b }.

js-meaning-generic-none = Deze run heeft geen enkel hoofdcijfer; de grafiek hieronder toont het resultaat.

js-meaning-holdover-label = Holdover, { $name }

js-meaning-hpl-sub = horizontaal beschermingsniveau

js-meaning-inside-budget = binnen { $budget }

js-meaning-integrity-big-checks-mostly = Ja, grotendeels: bij { $share } % van de controles.

js-meaning-integrity-big-checks-no = Nee: bij { $share } % van de controles.

js-meaning-integrity-big-checks-partly = Slechts gedeeltelijk: bij { $share } % van de controles.

js-meaning-integrity-big-checks-yes = Ja: bij { $share } % van de controles.

js-meaning-integrity-big-span-mostly = Ja, grotendeels: gedurende { $share } % van { $span }.

js-meaning-integrity-big-span-no = Nee: gedurende { $share } % van { $span }.

js-meaning-integrity-big-span-partly = Slechts gedeeltelijk: gedurende { $share } % van { $span }.

js-meaning-integrity-big-span-yes = Ja: gedurende { $share } % van { $span }.

js-meaning-integrity-bound-label = Typische foutgrens

js-meaning-integrity-bound-sub = horizontaal / verticaal, mediaan

js-meaning-integrity-gap-all-passed = elke controle is geslaagd

js-meaning-integrity-gap-label = Langste reeks

js-meaning-integrity-gap-none = geen

js-meaning-integrity-gap-sub =
    { $n ->
        [one] { $n } controle op rij, vanaf { $from }
       *[other] { $n } controles op rij, vanaf { $from }
    }

js-meaning-integrity-line-h =
    { $n ->
        [one] De foutgrens van de ontvanger (het beschermingsniveau) bleef onder de alarmgrenzen ({ $h } m horizontaal) bij { $av } van { $tot } controle.
       *[other] De foutgrens van de ontvanger (het beschermingsniveau) bleef onder de alarmgrenzen ({ $h } m horizontaal) bij { $av } van { $tot } controles.
    }

js-meaning-integrity-line-h-clean =
    { $n ->
        [one] De foutgrens van de ontvanger (het beschermingsniveau) bleef onder de alarmgrenzen ({ $h } m horizontaal) bij { $av } van { $tot } controle, en geen enkele positiebepaling was misleidend.
       *[other] De foutgrens van de ontvanger (het beschermingsniveau) bleef onder de alarmgrenzen ({ $h } m horizontaal) bij { $av } van { $tot } controles, en geen enkele positiebepaling was misleidend.
    }

js-meaning-integrity-line-h-some =
    { $n ->
        [one] De foutgrens van de ontvanger (het beschermingsniveau) bleef onder de alarmgrenzen ({ $h } m horizontaal) bij { $av } van { $tot } controles; { $n } positiebepaling was misleidend.
       *[other] De foutgrens van de ontvanger (het beschermingsniveau) bleef onder de alarmgrenzen ({ $h } m horizontaal) bij { $av } van { $tot } controles; { $n } positiebepalingen waren misleidend.
    }

js-meaning-integrity-line-hv =
    { $n ->
        [one] De foutgrens van de ontvanger (het beschermingsniveau) bleef onder de alarmgrenzen ({ $h } m horizontaal en { $v } m verticaal) bij { $av } van { $tot } controle.
       *[other] De foutgrens van de ontvanger (het beschermingsniveau) bleef onder de alarmgrenzen ({ $h } m horizontaal en { $v } m verticaal) bij { $av } van { $tot } controles.
    }

js-meaning-integrity-line-hv-clean =
    { $n ->
        [one] De foutgrens van de ontvanger (het beschermingsniveau) bleef onder de alarmgrenzen ({ $h } m horizontaal en { $v } m verticaal) bij { $av } van { $tot } controle, en geen enkele positiebepaling was misleidend.
       *[other] De foutgrens van de ontvanger (het beschermingsniveau) bleef onder de alarmgrenzen ({ $h } m horizontaal en { $v } m verticaal) bij { $av } van { $tot } controles, en geen enkele positiebepaling was misleidend.
    }

js-meaning-integrity-line-hv-some =
    { $n ->
        [one] De foutgrens van de ontvanger (het beschermingsniveau) bleef onder de alarmgrenzen ({ $h } m horizontaal en { $v } m verticaal) bij { $av } van { $tot } controles; { $n } positiebepaling was misleidend.
       *[other] De foutgrens van de ontvanger (het beschermingsniveau) bleef onder de alarmgrenzen ({ $h } m horizontaal en { $v } m verticaal) bij { $av } van { $tot } controles; { $n } positiebepalingen waren misleidend.
    }

js-meaning-integrity-line-none =
    { $n ->
        [one] De foutgrens van de ontvanger (het beschermingsniveau) bleef onder de alarmgrens bij { $av } van { $tot } controle.
       *[other] De foutgrens van de ontvanger (het beschermingsniveau) bleef onder de alarmgrens bij { $av } van { $tot } controles.
    }

js-meaning-integrity-line-none-clean =
    { $n ->
        [one] De foutgrens van de ontvanger (het beschermingsniveau) bleef onder de alarmgrens bij { $av } van { $tot } controle, en geen enkele positiebepaling was misleidend.
       *[other] De foutgrens van de ontvanger (het beschermingsniveau) bleef onder de alarmgrens bij { $av } van { $tot } controles, en geen enkele positiebepaling was misleidend.
    }

js-meaning-integrity-line-none-some =
    { $n ->
        [one] De foutgrens van de ontvanger (het beschermingsniveau) bleef onder de alarmgrens bij { $av } van { $tot } controles; { $n } positiebepaling was misleidend.
       *[other] De foutgrens van de ontvanger (het beschermingsniveau) bleef onder de alarmgrens bij { $av } van { $tot } controles; { $n } positiebepalingen waren misleidend.
    }

js-meaning-integrity-line-v =
    { $n ->
        [one] De foutgrens van de ontvanger (het beschermingsniveau) bleef onder de alarmgrenzen ({ $v } m verticaal) bij { $av } van { $tot } controle.
       *[other] De foutgrens van de ontvanger (het beschermingsniveau) bleef onder de alarmgrenzen ({ $v } m verticaal) bij { $av } van { $tot } controles.
    }

js-meaning-integrity-line-v-clean =
    { $n ->
        [one] De foutgrens van de ontvanger (het beschermingsniveau) bleef onder de alarmgrenzen ({ $v } m verticaal) bij { $av } van { $tot } controle, en geen enkele positiebepaling was misleidend.
       *[other] De foutgrens van de ontvanger (het beschermingsniveau) bleef onder de alarmgrenzen ({ $v } m verticaal) bij { $av } van { $tot } controles, en geen enkele positiebepaling was misleidend.
    }

js-meaning-integrity-line-v-some =
    { $n ->
        [one] De foutgrens van de ontvanger (het beschermingsniveau) bleef onder de alarmgrenzen ({ $v } m verticaal) bij { $av } van { $tot } controles; { $n } positiebepaling was misleidend.
       *[other] De foutgrens van de ontvanger (het beschermingsniveau) bleef onder de alarmgrenzen ({ $v } m verticaal) bij { $av } van { $tot } controles; { $n } positiebepalingen waren misleidend.
    }

js-meaning-integrity-misleading-label = Misleidende positiebepalingen

js-meaning-integrity-misleading-sub = werkelijke fout boven de grens

js-meaning-integrity-trusted-label = Tijd dat de positiebepaling te vertrouwen is

js-meaning-jamming-above-label = Jammer boven het signaal

js-meaning-jamming-above-sub = gemiddelde jammer-signaalverhouding

js-meaning-jamming-big-gone = De jammer neemt de positiebepaling volledig weg.

js-meaning-jamming-big-share = Met de jammer is een positiebepaling { $share } % van de tijd beschikbaar.

js-meaning-jamming-clear-label = Positiebepaling beschikbaar, zonder jammer

js-meaning-jamming-fewest-label = Minste gevolgde satellieten

js-meaning-jamming-fewest-sub = op het slechtste moment

js-meaning-jamming-jammed-label = Positiebepaling beschikbaar, gejamd

js-meaning-jamming-line = Zonder de jammer is de positiebepaling { $share } % van de tijd beschikbaar.

js-meaning-jamming-line-js = Zonder de jammer is de positiebepaling { $share } % van de tijd beschikbaar; de jammer komt gemiddeld { $db } dB boven het signaal aan.

js-meaning-kicker = { $domain } · { $title }

js-meaning-lunar-big-all =
    { $n ->
        [one] Ja: bij de enige controle ({ $n }).
       *[other] Ja: bij elk van de { $n } controles.
    }

js-meaning-lunar-big-none =
    { $n ->
        [one] Nee: bij de enige controle ({ $n }) niet.
       *[other] Nee: bij geen van de { $n } controles.
    }

js-meaning-lunar-big-some =
    { $n ->
        [one] Bij { $av } van { $n } controle ({ $share } %).
       *[other] Bij { $av } van { $n } controles ({ $share } %).
    }

js-meaning-lunar-largest-label = Grootste foutgrens

js-meaning-lunar-line = Het beschermingsniveau lag tussen { $min } en { $max } m, tegenover een alarmgrens van { $limit } m.

js-meaning-lunar-meet-label = Controles die aan de grens voldoen

js-meaning-lunar-meet-value = { $av } van { $tot }

js-meaning-lunar-smallest-label = Kleinste foutgrens

js-meaning-median-lower-better = mediaan, lager is beter

js-meaning-of-the-time = van de tijd

js-meaning-orbit-best-label = Beste geometrie (PDOP)

js-meaning-orbit-best-sub = laagste over de run

js-meaning-orbit-big-always = Een positiebepaling is de hele tijd mogelijk.

js-meaning-orbit-big-share = Een positiebepaling is { $share } % van de tijd mogelijk.

js-meaning-orbit-error-label = Typische positiefout

js-meaning-orbit-error-sub = 1-sigma, mediaan

js-meaning-orbit-line =
    { $n ->
        [one] Op { $fix } van { $n } moment waren er genoeg satellieten in zicht.
       *[other] Op { $fix } van { $n } momenten waren er genoeg satellieten in zicht.
    }

js-meaning-orbit-line-pdop =
    { $n ->
        [one] Op { $fix } van { $n } moment waren er genoeg satellieten in zicht; de typische geometriekwaliteit (PDOP, positionele precisieverdunning) is { $pdop }, lager is beter.
       *[other] Op { $fix } van { $n } momenten waren er genoeg satellieten in zicht; de typische geometriekwaliteit (PDOP, positionele precisieverdunning) is { $pdop }, lager is beter.
    }

js-meaning-orbit-moments =
    { $n ->
        [one] { $fix } van { $n } moment
       *[other] { $fix } van { $n } momenten
    }

js-meaning-orbit-time-label = Tijd dat een positiebepaling mogelijk is

js-meaning-pair-big-diff-pos = { $best } blijft binnen { $budget } gedurende { $bestDur }; { $other } gedurende { $otherDur }.

js-meaning-pair-big-diff-time = { $best } houdt de tijd binnen { $budget } gedurende { $bestDur }; { $other } gedurende { $otherDur }.

js-meaning-pair-big-same-pos = Zowel { $q } als { $c } blijven binnen { $budget } gedurende { $dur }.

js-meaning-pair-big-same-time = Zowel { $q } als { $c } houden de tijd binnen { $budget } gedurende { $dur }.

js-meaning-pair-line-clock = Holdover is hoe lang elke klok binnen het budget van { $budget } blijft nadat de satellietnavigatie is verloren.

js-meaning-pair-line-navigator = Holdover is hoe lang elk navigatiesysteem binnen het budget van { $budget } blijft nadat de satellietnavigatie is verloren.

js-meaning-pdop-label = Geometriekwaliteit (PDOP)

js-meaning-places-times = van de plaatsen en tijden

js-meaning-range-to = { $from } tot { $to }

js-meaning-satellites =
    { $n ->
        [one] satelliet
       *[other] satellieten
    }

js-meaning-spectrum-above = boven de drempel

js-meaning-spectrum-below = onder de drempel: verloren

js-meaning-spectrum-big-kept =
    { $n ->
        [one] Het enige signaal ({ $n }) blijft gevolgd worden.
       *[other] Elk van de { $n } signalen blijft gevolgd worden.
    }

js-meaning-spectrum-big-lost =
    { $n ->
        [one] De jammers nemen { $lost } van { $n } signaal weg: { $names }.
       *[other] De jammers nemen { $lost } van { $n } signalen weg: { $names }.
    }

js-meaning-spectrum-line-kept =
    { $n ->
        [one] { $names } blijft de hele run boven de volgdrempel van de ontvanger.
       *[other] { $names } blijven de hele run boven de volgdrempel van de ontvanger.
    }

js-meaning-spectrum-line-kept-thr =
    { $n ->
        [one] { $names } blijft de hele run boven de volgdrempel van { $thr } dB-Hz van de ontvanger.
       *[other] { $names } blijven de hele run boven de volgdrempel van { $thr } dB-Hz van de ontvanger.
    }

js-meaning-spectrum-line-none = Geen enkel signaal blijft de hele run boven de volgdrempel van de ontvanger.

js-meaning-spectrum-line-none-thr = Geen enkel signaal blijft de hele run boven de volgdrempel van { $thr } dB-Hz van de ontvanger.

js-meaning-spectrum-weakest-label = Zwakste signaal, { $name }

js-meaning-whole-run = over de hele run

js-meaning-your-setting = uw instelling

js-meankind-acm-big =
    { $n ->
        [one] Adaptieve codering verplaatst { $gain } keer zoveel data als de beste vaste modus: { $acm } Gbit tegenover { $ccm } Gbit over { $n } passage.
       *[other] Adaptieve codering verplaatst { $gain } keer zoveel data als de beste vaste modus: { $acm } Gbit tegenover { $ccm } Gbit over { $n } passages.
    }

js-meankind-acm-line = Vaste modus { $mode }; { $dur } uitval.

js-meankind-anomaly-big = De kwantumstoringsmonitor scoort { $q } tegenover { $c } voor de klassieke (oppervlakte onder de curve, 1 is perfect).

js-meankind-anomaly-line = De kleinste detecteerbare storing is { $q } tegenover { $c }.

js-meankind-aocs-big-open = De zwenking van { $slew } graden komt niet onder { $threshold } graden tot rust.

js-meankind-aocs-big-settles = De zwenking van { $slew } graden komt na { $dur } onder { $threshold } graden tot rust.

js-meankind-aocs-line = Uiteindelijke richtfout { $final } graden.

js-meankind-aocs-line-filter = Uiteindelijke richtfout { $final } graden. Een standfilter in de lus wijkt { $arcsec } boogseconden RMS af.

js-meankind-aocs-line-wheel = Uiteindelijke richtfout { $final } graden. Piekkoppel van het wiel { $torque } N m.

js-meankind-aocs-line-wheel-filter = Uiteindelijke richtfout { $final } graden. Piekkoppel van het wiel { $torque } N m. Een standfilter in de lus wijkt { $arcsec } boogseconden RMS af.

js-meankind-aperture-big = Navigatie gebruikt { $nav } % van de antennetijd en communicatie { $comms } %.

js-meankind-aperture-big-idle = Navigatie gebruikt { $nav } % van de antennetijd en communicatie { $comms } %; { $idle } % is ongebruikt.

js-meankind-aperture-line-all =
    { $n ->
        [one] { $n } apertuur onder de regel { $policy }, met { $dur } contentie.
       *[other] { $n } aperturen onder de regel { $policy }, met { $dur } contentie.
    }

js-meankind-aperture-line-contention =
    { $n ->
        [one] { $n } apertuur, met { $dur } contentie.
       *[other] { $n } aperturen, met { $dur } contentie.
    }

js-meankind-aperture-line-count =
    { $n ->
        [one] { $n } apertuur.
       *[other] { $n } aperturen.
    }

js-meankind-aperture-line-nocount = De aperturen.

js-meankind-aperture-line-nocount-all = De aperturen onder de regel { $policy }, met { $dur } contentie.

js-meankind-aperture-line-nocount-contention = De aperturen, met { $dur } contentie.

js-meankind-aperture-line-nocount-policy = De aperturen onder de regel { $policy }.

js-meankind-aperture-line-policy =
    { $n ->
        [one] { $n } apertuur onder de regel { $policy }.
       *[other] { $n } aperturen onder de regel { $policy }.
    }

js-meankind-araim-big-no = Nee: de beschermingsniveaus van de engine wijken af van de gepubliceerde referentie.

js-meankind-araim-big-yes = Ja: de beschermingsniveaus van de engine komen overeen met de gepubliceerde referentie.

js-meankind-araim-line = Het grootste verschil is { $worst } m tegenover de eigen tolerantie van de referentie van { $tol } m.

js-meankind-araim-line-vectors =
    { $n ->
        [one] Het grootste verschil is { $worst } m tegenover de eigen tolerantie van de referentie van { $tol } m, over { $n } referentievector.
       *[other] Het grootste verschil is { $worst } m tegenover de eigen tolerantie van de referentie van { $tol } m, over { $n } referentievectoren.
    }

js-meankind-arc-big = De schatter herstelt de baan zodra hij { $dur } van de boog van { $h } uur heeft.

js-meankind-arc-line = { $n } ruimtevaartuigen, { $observable }-metingen.

js-meankind-ascent-big = Zwaartekracht, luchtweerstand, sturing en tegendruk nemen { $loss } m/s weg van de ideale snelheidswinst van { $ideal } m/s.

js-meankind-ascent-line = Uitbranding op { $km } km en { $speed } m/s; piek van de dynamische druk { $kpa } kPa.

js-meankind-attack-big-no = Een spoofer op het oppervlak kan een maanontvanger niet overnemen.

js-meankind-attack-big-yes = Een spoofer op het oppervlak kan een maanontvanger overnemen.

js-meankind-attack-line = Een zender op het oppervlak reikt { $km } km voordat de horizon hem blokkeert.

js-meankind-attitude-big = De richtfout bedraagt in totaal { $total } boogseconden.

js-meankind-attitude-big-from = De richtfout bedraagt in totaal { $total } boogseconden, grotendeels door { $from }.

js-meankind-attitude-line = Het grootste zwaartekrachtgradiëntkoppel is { $torque } N·m.

js-meankind-beacon-big = Bakens op het oppervlak verbeteren de geometriekwaliteit (PDOP) { $x } keer.

js-meankind-beacon-line = Satellieten toevoegen verbetert haar in plaats daarvan { $x } keer.

js-meankind-bodypnt-big = Relais alleen geven { $share } % van de tijd een positiebepaling rond { $body }.

js-meankind-bodypnt-big-earth = Relais alleen geven { $share } % van de tijd een positiebepaling rond { $body }; { $earth } % met links naar de aarde.

js-meankind-bodypnt-line = Gemiddeld zijn { $mean } relais in zicht.

js-meankind-by = { $a } per { $b }

js-meankind-campaign-compose-line = Elk lid is een gewone engine-run; de campagne leest hun resultaten naast elkaar.

js-meankind-campaign-compose-range =
    { $n ->
        [one] Over { $n } scenario onder dezelfde voorwaarden loopt { $what } van { $low } tot { $high }.
       *[other] Over { $n } scenario's onder dezelfde voorwaarden loopt { $what } van { $low } tot { $high }.
    }

js-meankind-campaign-compose-same =
    { $n ->
        [one] Over { $n } scenario onder dezelfde voorwaarden is { $what } { $value } in elk ervan.
       *[other] Over { $n } scenario's onder dezelfde voorwaarden is { $what } { $value } in elk ervan.
    }

js-meankind-campaign-line =
    { $n ->
        [one] { $n } fase.
       *[other] { $n } fasen.
    }

js-meankind-campaign-line-all =
    { $n ->
        [one] { $n } fase en { $events }, uit { $runs }; aan het einde is { $label } { $value }.
       *[other] { $n } fasen en { $events }, uit { $runs }; aan het einde is { $label } { $value }.
    }

js-meankind-campaign-line-end =
    { $n ->
        [one] { $n } fase; aan het einde is { $label } { $value }.
       *[other] { $n } fasen; aan het einde is { $label } { $value }.
    }

js-meankind-campaign-line-events =
    { $n ->
        [one] { $n } fase en { $events }.
       *[other] { $n } fasen en { $events }.
    }

js-meankind-campaign-line-events-end =
    { $n ->
        [one] { $n } fase en { $events }; aan het einde is { $label } { $value }.
       *[other] { $n } fasen en { $events }; aan het einde is { $label } { $value }.
    }

js-meankind-campaign-line-events-runs =
    { $n ->
        [one] { $n } fase en { $events }, uit { $runs }.
       *[other] { $n } fasen en { $events }, uit { $runs }.
    }

js-meankind-campaign-line-runs =
    { $n ->
        [one] { $n } fase, uit { $runs }.
       *[other] { $n } fasen, uit { $runs }.
    }

js-meankind-campaign-line-runs-end =
    { $n ->
        [one] { $n } fase, uit { $runs }; aan het einde is { $label } { $value }.
       *[other] { $n } fasen, uit { $runs }; aan het einde is { $label } { $value }.
    }

js-meankind-campaign-mission-alarm = Het alarm gaat af gedurende { $alarm } van de missie van { $dur }.

js-meankind-campaign-mission-phases = Een missie van { $phases } fasen over { $dur }, aaneengeschakeld op één klok.

js-meankind-campaign-mission-quiet = Geen alarm in de hele missie van { $dur }.

js-meankind-campaign-montecarlo =
    { $n ->
        [one] Over { $n } run met seed middelt { $name } { $mean }, met een spreiding van { $std }.
       *[other] Over { $n } runs met seed middelt { $name } { $mean }, met een spreiding van { $std }.
    }

js-meankind-campaign-montecarlo-line = De spreiding is één standaardafwijking over de runs.

js-meankind-campaign-optimize =
    { $n ->
        [one] De zoektocht komt uit op { $name } van { $value } na { $n } run.
       *[other] De zoektocht komt uit op { $name } van { $value } na { $n } runs.
    }

js-meankind-campaign-optimize-at = Bij { $at }.

js-meankind-campaign-optimize-kind =
    { $n ->
        [one] De zoektocht komt uit op { $name } van { $value } na { $n } run van { $kind }.
       *[other] De zoektocht komt uit op { $name } van { $value } na { $n } runs van { $kind }.
    }

js-meankind-campaign-sweep-flat =
    { $n ->
        [one] Over { $n } run van { $axis } van { $from } tot { $to } blijft { $metric } op { $value }.
       *[other] Over { $n } runs van { $axis } van { $from } tot { $to } blijft { $metric } op { $value }.
    }

js-meankind-campaign-sweep-flat-line = De grafiek toont elke run.

js-meankind-campaign-sweep-goes =
    { $n ->
        [one] Over { $n } run van { $axis } van { $from } tot { $to } gaat { $metric } van { $first } naar { $last }.
       *[other] Over { $n } runs van { $axis } van { $from } tot { $to } gaat { $metric } van { $first } naar { $last }.
    }

js-meankind-campaign-sweep-goes-line = De grafiek toont elke run; ze loopt van { $min } tot { $max }.

js-meankind-classical-link = klassieke link

js-meankind-clock-word = klok

js-meankind-conflict-big = De gelaagde architectuur overleeft { $ratio } keer beter dan één enkele laag.

js-meankind-conflict-line-threats = Een Monte Carlo van de bedreigingen geeft { $ratio } keer.

js-meankind-conflict-line-threats-corr = Een Monte Carlo van de bedreigingen geeft { $ratio } keer; met gecorreleerde bedreigingen kan het dalen tot { $low } keer.

js-meankind-conflict-line-trials =
    { $n ->
        [one] Een Monte Carlo van { $n } trial geeft { $ratio } keer.
       *[other] Een Monte Carlo van { $n } trials geeft { $ratio } keer.
    }

js-meankind-conflict-line-trials-corr =
    { $n ->
        [one] Een Monte Carlo van { $n } trial geeft { $ratio } keer; met gecorreleerde bedreigingen kan het dalen tot { $low } keer.
       *[other] Een Monte Carlo van { $n } trials geeft { $ratio } keer; met gecorreleerde bedreigingen kan het dalen tot { $low } keer.
    }

js-meankind-contacts-big =
    { $n ->
        [one] Het plan houdt { $kept } van { $n } kandidaatcontact en levert { $gbit } Gbit.
       *[other] Het plan houdt { $kept } van { $n } kandidaatcontacten en levert { $gbit } Gbit.
    }

js-meankind-contacts-big-waiting =
    { $n ->
        [one] Het plan houdt { $kept } van { $n } kandidaatcontact en levert { $gbit } Gbit van de { $waiting } Gbit die wachten.
       *[other] Het plan houdt { $kept } van { $n } kandidaatcontacten en levert { $gbit } Gbit van de { $waiting } Gbit die wachten.
    }

js-meankind-contacts-line = { $sats } satellieten en { $stations } stations over { $hours } uur.

js-meankind-dpnt-big = Differentiële correcties brengen de fout van { $from } m naar { $to } m.

js-meankind-dpnt-line = Met een referentiestation op { $km } km afstand.

js-meankind-duration-days =
    { $n ->
        [one] { $days } dag
       *[other] { $days } dagen
    }

js-meankind-earthgnss-big =
    { $n ->
        [one] Op de afstand van de maan zijn { $visible } van { $n } satelliet in zicht, maar { $trackable } kunnen worden gevolgd.
       *[other] Op de afstand van de maan zijn { $visible } van { $n } satellieten in zicht, maar { $trackable } kunnen worden gevolgd.
    }

js-meankind-earthgnss-line = Het beste signaal is { $best } dB-Hz tegenover een volgdrempel van { $threshold } dB-Hz.

js-meankind-engine-run-count =
    { $n ->
        [one] { $n } engine-run
       *[other] { $n } engine-runs
    }

js-meankind-entry-big = De piekvertraging is { $g } g op { $km } km, met een piekwarmtestroom van { $flux } W/cm².

js-meankind-entry-line = Binnenkomst met { $speed } m/s, { $angle } graden onder de horizon.

js-meankind-eo-big = De camera ziet een strook van { $swath } km breed met een resolutie van { $gsd } m.

js-meankind-eo-line-contiguous = Grondsporen liggen { $km } km uit elkaar op de evenaar, dus de dekking is aaneengesloten.

js-meankind-eo-line-gapped = Grondsporen liggen { $km } km uit elkaar op de evenaar, dus de dekking heeft gaten.

js-meankind-eop-big = Op de afstand van de maan legt de rotatie van de aarde elke seconde { $m } m af, dus de ouderdom van de gegevens over de aardoriëntatie ({ $dur } hier) doet ertoe.

js-meankind-eop-line = Invoer: { $source }.

js-meankind-ephemeris-big = De satelliet vliegt tussen { $min } en { $max } km, tot { $lat }° breedtegraad.

js-meankind-ephemeris-line = Vanaf het station gezien komt hij tot { $deg }°.

js-meankind-ephemeris-line-doppler = Vanaf het station gezien komt hij tot { $deg }°, met tot { $khz } kHz Doppler.

js-meankind-event-count =
    { $n ->
        [one] { $n } gebeurtenis
       *[other] { $n } gebeurtenissen
    }

js-meankind-framecampaign-big-open =
    { $n ->
        [one] De campagne laat { $n } datumrichting onbepaald.
       *[other] De campagne laat { $n } datumrichtingen onbepaald.
    }

js-meankind-framecampaign-big-yes = Ja: de campagne legt het datum van het maanreferentiestelsel volledig vast.

js-meankind-framecampaign-line = Conditiegetal { $n }.

js-meankind-framereal-big = Het maanreferentiestelsel wordt gerealiseerd met { $m } m restfout.

js-meankind-framereal-big-open = Het maanreferentiestelsel wordt gerealiseerd met { $m } m restfout, hoewel de fit niet convergeerde.

js-meankind-framereal-line = Translatiefout { $trans } m, schaalfout { $scale } parts per billion.

js-meankind-gnsssim-big = Integriteitsbewaking beschermt de positiebepaling { $share } % van de tijd.

js-meankind-gnsssim-line = De ionosfeer voegt gemiddeld { $iono } m en de troposfeer { $tropo } m toe aan elke afstand.

js-meankind-headline-figure = hoofdcijfer

js-meankind-holdovertest-big = Gemeten tegen de maskers bereikt de holdover van { $dur } s van het record { $te } ns tijdfout.

js-meankind-holdovertest-big-open = Gemeten tegen de maskers bereikt de holdover van { $dur } s van het record { $te } ns tijdfout, en herstelde niet binnen de band.

js-meankind-holdovertest-big-recovered = Gemeten tegen de maskers bereikt de holdover van { $dur } s van het record { $te } ns tijdfout, en herstelde { $recover } s nadat GNSS terugkwam.

js-meankind-holdovertest-line = Gemeten tegen het masker, nooit een uitspraak dat een systeem voldoet; de twee tijden zijn de verklaring van de operator.

js-meankind-holdovertest-line-masks = { $masks }. Gemeten tegen het masker, nooit een uitspraak dat een systeem voldoet; de twee tijden zijn de verklaring van de operator.

js-meankind-impairment-big = De detector scheidt verstoorde signalen van schone met een oppervlakte onder de curve van { $auc } (1 is perfect).

js-meankind-impairment-line = Op gevallen die niet op de trainingsset lijken scoort hij { $auc }.

js-meankind-infra-carrier = Het vastleggen van geheeltallige draaggolffase tussen een oppervlaktestation en een orbiter slaagde bij { $share } % van de trials op de langste boog ({ $days } dagen).

js-meankind-infra-frame = Links tussen orbiter en station verhogen de kleinste informatie-eigenwaarde van het maandatum { $x } keer en verlagen het Cramér-Rao-spoor tot { $share } %, als de baan bekend is in de maanassen.

js-meankind-infra-geodesy = Met alle vier de families samen worden h2, k2 en l2 vastgepind op { $h2 } %, { $k2 } % en { $l2 } % van hun nominale waarden.

js-meankind-infra-od = Baanbepaling aan boord met GNSS van de aarde in een maanbaan is goed tot { $gnss } m, onafhankelijke grondvolging tot { $ground } m; de consistentiestatistiek middelt { $mean } ({ $expected } verwacht).

js-meankind-infra-tail = MODELLED: een beperkt model met illustratieve invoer, geen uitspraak over enige missie.

js-meankind-infra-tie =
    { $n ->
        [one] Een lokale koppeling van { $mm } mm op één ruimtevaartuig koppelt de GNSS-, VLBI- en laserafstandsmetingsreferentiestelsels over { $n } doorlopen koppelfout.
       *[other] Een lokale koppeling van { $mm } mm op één ruimtevaartuig koppelt de GNSS-, VLBI- en laserafstandsmetingsreferentiestelsels over { $n } doorlopen koppelfouten.
    }

js-meankind-inside-spec = binnen { $spec }

js-meankind-instrn-big = Bij uitrollen op traagheid alleen passeert de positiefout { $threshold } m na { $dur }.

js-meankind-instrn-dom = { $dominant } overheerst.

js-meankind-instrn-line = Ze passeert { $passes }.

js-meankind-instrn-line-dom = Ze passeert { $passes }; { $dominant } overheerst.

js-meankind-instrn-pass = { $threshold } m na { $dur }

js-meankind-interop-big-no = Nee: het maanefemeridebestand doorstaat de heen-en-terugreis niet.

js-meankind-interop-big-yes = Ja: het maanefemeridebestand doorstaat de heen-en-terugreis intact.

js-meankind-interop-line = { $n } toestanden in het referentiestelsel { $frame }, tijd { $time }.

js-meankind-its-spec = zijn specificatie

js-meankind-jointod-big = Het toevoegen van een interferometrievertraging vanaf de aarde verscherpt de stationspositie { $x } keer.

js-meankind-jointod-line = Het station is dan bekend tot { $m } m.

js-meankind-launch-big =
    { $n ->
        [one] { $n } lanceermogelijkheid per dag bereikt een baan van { $incl }° vanaf breedtegraad { $lat }°.
       *[other] { $n } lanceermogelijkheden per dag bereiken een baan van { $incl }° vanaf breedtegraad { $lat }°.
    }

js-meankind-launch-line = De rotatie van de aarde levert { $speed } m/s gratis.

js-meankind-layer-agc = AGC (automatische versterkingsregeling)

js-meankind-layer-raim = RAIM (autonome integriteitsbewaking door de ontvanger)

js-meankind-layer-sqm = SQM (bewaking van de signaalkwaliteit)

js-meankind-leochain-big = Van begin tot eind brengt het systeem in een lage baan de positiefout van { $from } m naar { $to } m.

js-meankind-leochain-line = Het signaal wordt gevolgd tot { $cn0 } dB-Hz.

js-meankind-leopass-big-many = De satellieten passeren op { $elev }° hoogte en blijven { $dur } boven het masker (de eerste van { $n }).

js-meankind-leopass-big-one = De satelliet passeert op { $elev }° hoogte en blijft { $dur } boven het masker.

js-meankind-leopass-line = Op zijn hoogtepunt komt het signaal uit de lage baan { $db } dB sterker aan dan een gangbaar satellietnavigatiesignaal.

js-meankind-leoppp-big = Precieze positiebepaling convergeert in { $best } min met de grootste laag in een lage baan, tegenover { $base } min met alleen satellietnavigatie.

js-meankind-leoppp-line = Mediaan van de runs per geval, tot { $m } m.

js-meankind-leoppp-line-runs =
    { $n ->
        [one] Mediaan van { $n } run per geval, tot { $m } m.
       *[other] Mediaan van { $n } runs per geval, tot { $m } m.
    }

js-meankind-leopvt-doppler-big = Dopplerpositiebepaling vanaf satellieten in een lage baan komt { $m } m van de referentie uit (horizontaal).

js-meankind-leopvt-doppler-line =
    { $n ->
        [one] { $n } satelliet gebruikt.
       *[other] { $n } satellieten gebruikt.
    }

js-meankind-leopvt-joint-big = Het toevoegen van de laag in een lage baan brengt de fout van { $from } m naar { $to } m (3D, kwadratisch gemiddelde).

js-meankind-leopvt-joint-line = De geometriekwaliteit (PDOP) gaat van { $from } naar { $to }.

js-meankind-leopvt-polar-big = Dicht bij de pool verbetert de laag in een lage baan de geometriekwaliteit (PDOP) van { $from } naar { $to }.

js-meankind-leopvt-polar-line =
    { $n ->
        [one] Over { $n } breedtegraad.
       *[other] Over { $n } breedtegraden.
    }

js-meankind-leopvt-timing-big = Tijdoverdracht via een lage baan houdt de beste klok binnen { $ns } ns van UTC (kwadratisch gemiddelde).

js-meankind-leopvt-timing-line =
    { $n ->
        [one] { $n } geval van klok en signaal vergeleken.
       *[other] { $n } gevallen van klok en signaal vergeleken.
    }

js-meankind-leosignal-big =
    { $n ->
        [one] Van { $n } signaalontwerp verdraagt { $best } de meeste jamming: { $db } dB boven het signaal.
       *[other] Van { $n } signaalontwerpen verdraagt { $best } de meeste jamming: { $db } dB boven het signaal.
    }

js-meankind-leosignal-line-fail = De controles van de spectrumvorm mislukken.

js-meankind-leosignal-line-pass = De controles van de spectrumvorm slagen.

js-meankind-link-big-closes = De verbinding sluit met { $margin } dB marge.

js-meankind-link-big-open = De verbinding sluit niet: { $margin } dB marge.

js-meankind-link-line = Over { $km } km.

js-meankind-link-line-band = { $band }-band over { $km } km.

js-meankind-link-line-band-rate = { $band }-band over { $km } km met { $rate } bit/s.

js-meankind-link-line-rate = Over { $km } km met { $rate } bit/s.

js-meankind-list-and = { $head } en { $last }

js-meankind-llr-big = Echte laserafstandsmeting legt het maanreferentiestelsel vast op { $mm } mm.

js-meankind-llr-line = Schaal tot op { $ppb } deeltjes per miljard.

js-meankind-mapmatch-altimeter = De hoogtemeter meet tot op { $sigma } m.

js-meankind-mapmatch-big = Kaartvergelijking houdt de positie op { $matched } m, tegenover { $free } m drift met alleen traagheidsnavigatie.

js-meankind-mapmatch-gravimeter = De gravimeter meet tot op { $sigma } mGal.

js-meankind-mapmatch-sources = Zwaartekracht alleen geeft { $gravity } m, magnetisch { $magnetic } m, terrein { $terrain } m.

js-meankind-marspnt-big = De navigator van { $user } komt tot rust op { $m } m (kwadratisch gemiddelde).

js-meankind-marspnt-line =
    { $n ->
        [one] Gemiddeld { $mean } relais in zicht, over { $n } epoche.
       *[other] Gemiddeld { $mean } relais in zicht, over { $n } epochen.
    }

js-meankind-moonlight-big = De dienst dekt { $share } % van de gecontroleerde plaatsen en tijden.

js-meankind-moonlight-line =
    { $n ->
        [one] Tussen { $min } en { $n } satelliet zijn in zicht; de geometriekwaliteit (PDOP) loopt van { $pmin } tot { $pmax }.
       *[other] Tussen { $min } en { $n } satellieten zijn in zicht; de geometriekwaliteit (PDOP) loopt van { $pmin } tot { $pmax }.
    }

js-meankind-navmsg-big =
    { $n ->
        [one] Eén navigatiebericht past in { $n } byte.
       *[other] Eén navigatiebericht past in { $n } bytes.
    }

js-meankind-navmsg-cases-big =
    { $n ->
        [one] Over { $n } geval is de afstandsfout van de uitgezonden baan { $min } tot { $max } mm.
       *[other] Over { $n } gevallen is de afstandsfout van de uitgezonden baan { $min } tot { $max } mm.
    }

js-meankind-navmsg-cases-line = Afstandsfout van het signaal in de ruimte, kwadratisch gemiddelde.

js-meankind-navmsg-line = Afronden naar het berichtformaat kost { $mm } mm afstandsfout.

js-meankind-navmsg-midpass-big = Het bijwerken van het bericht midden in een overpassage laat de afstand met hooguit { $mm } mm springen.

js-meankind-navmsg-midpass-line = De grens is { $mm } mm.

js-meankind-ntn-big = 5G-positiebepaling vanuit een baan bereikt { $m } m met { $signal }.

js-meankind-ntn-line = Doppler over één overpassage geeft { $m } m.

js-meankind-obs-big-full = De baan wordt volledig waarneembaar na { $dur } volgen.

js-meankind-obs-big-partly = De baan blijft gedeeltelijk waarneembaar over de boog van { $h } h.

js-meankind-obs-line = Rang { $rank } van { $dim } aan het einde van de boog.

js-meankind-oem-big = Het efemeridebestand komt na een heen-en-terugomzetting terug met hooguit { $mm } mm positiefout.

js-meankind-oem-line =
    { $n ->
        [one] { $states } toestanden in { $n } segment.
       *[other] { $states } toestanden in { $n } segmenten.
    }

js-meankind-optical-big-alone = De beste afzonderlijke locatie houdt de optische verbinding { $best } % van de tijd in stand (plafond bij wolkenvrij { $ceiling } %); geen enkele wolkenvrije marge tilt dit boven { $ceiling } %.

js-meankind-optical-big-team = De beste afzonderlijke locatie houdt de optische verbinding { $best } % van de tijd in stand (plafond bij wolkenvrij { $ceiling } %); { $n } locaties samen halen { $independent } % als hun weer onafhankelijk is, { $correlated } % met de opgegeven correlatie.

js-meankind-optical-line-sites =
    { $n ->
        [one] { $n } locatie gemodelleerd; de wolkenklimaten zijn illustratief.
       *[other] { $n } locaties gemodelleerd; de wolkenklimaten zijn illustratief.
    }

js-meankind-optical-line-tech = { $name }: { $base } % wordt { $with } %.

js-meankind-opticalrf-big = Het combineren van optische en radioafstandsmeting geeft beschermingsniveaus van { $h } m horizontaal en { $v } m verticaal.

js-meankind-opticalrf-line-fault = De consistentietest geeft { $stat } tegenover een drempel van { $threshold }: een fout wordt gemeld.

js-meankind-opticalrf-line-ok = De consistentietest geeft { $stat } tegenover een drempel van { $threshold }: er wordt geen fout gemeld.

js-meankind-packet-big-no = Nee: de gedecodeerde stroom wijkt af van wat is verzonden.

js-meankind-packet-big-yes = Ja: de pakketstroom decodeert bit voor bit terug.

js-meankind-packet-line =
    { $n ->
        [one] { $n } pakket, in totaal { $octets } octetten.
       *[other] { $n } pakketten, in totaal { $octets } octetten.
    }

js-meankind-passes-big-day =
    { $n ->
        [one] { $n } overpassage per dag, in totaal { $dur } contact.
       *[other] { $n } overpassages per dag, in totaal { $dur } contact.
    }

js-meankind-passes-big-window =
    { $n ->
        [one] { $n } overpassage in een venster van { $hours } uur, in totaal { $dur } contact.
       *[other] { $n } overpassages in een venster van { $hours } uur, in totaal { $dur } contact.
    }

js-meankind-passes-line = De beste overpassage stijgt tot { $deg }°.

js-meankind-percentile-word = percentiel

js-meankind-pnt-big = De kwantumsuite houdt positie en tijd vast gedurende { $q }; de klassieke suite gedurende { $c }.

js-meankind-pnt-classical-label = Holdover, klassieke suite

js-meankind-pnt-line = Holdover is hoe lang elke suite (klok { $q }, tegenover klok { $c }) binnen { $spec } blijft nadat de satellietnavigatie is verloren.

js-meankind-pnt-quantum-label = Holdover, kwantumsuite

js-meankind-pnt-timing-classical-label = Tijdfout, 95 %, klassiek

js-meankind-pnt-timing-quantum-label = Tijdfout, 95 %, kwantum

js-meankind-pvt-big =
    { $n ->
        [one] Een positie wordt opgelost bij { $solved } van { $n } epoche, tot op { $rms } m (3D-kwadratisch gemiddelde).
       *[other] Een positie wordt opgelost bij { $solved } van { $n } epochen, tot op { $rms } m (3D-kwadratisch gemiddelde).
    }

js-meankind-pvt-line = Uit gemiddeld { $mean } satellieten, afgelezen uit echte ontvangermetingen.

js-meankind-qnav-big = Na de uitval wijkt de koudeatoomnavigator { $q } m af; die van navigatiekwaliteit { $c } m.

js-meankind-qnav-big-outage = Na { $dur } zonder satellieten wijkt de koudeatoomnavigator { $q } m af; die van navigatiekwaliteit { $c } m.

js-meankind-qnav-line = Binnen het budget: { $q } tegenover { $c }.

js-meankind-qnav-line-threshold = Binnen { $threshold } m: { $q } tegenover { $c }.

js-meankind-qtt-big = Kwantumtijdoverdracht houdt { $q } ps (1 sigma) vast, tegenover { $c } ns voor de klassieke keten.

js-meankind-qtt-line = De beveiligingsmonitor detecteert { $pd } % van de aanvallen.

js-meankind-qtt-line-pfa = De beveiligingsmonitor detecteert { $pd } % van de aanvallen bij een valsealarmpercentage van { $pfa }.

js-meankind-quantum-link = kwantumverbinding

js-meankind-radiometry-big = De camera bereikt NIIRS { $niirs } bij { $gsd } m grondmonsterafstand, met een signaal-ruisverhouding van { $snr }.

js-meankind-radiometry-line = Systeem-MTF bij Nyquist { $mtf }.

js-meankind-reentry-big = De piekvertraging is { $g } g, op { $km } km.

js-meankind-reentry-line = Het voertuig bevindt zich dan op { $speed } m/s.

js-meankind-slam-big = Terreinvergelijking eindigt { $matched } m ernaast, tegenover { $free } m met alleen traagheidsnavigatie.

js-meankind-slam-line =
    { $n ->
        [one] Over { $n } waypoint, vergeleken met een terreinkaart met { $sigma } m hoogtemeterruis.
       *[other] Over { $n } waypoints, vergeleken met een terreinkaart met { $sigma } m hoogtemeterruis.
    }

js-meankind-slot-big = De klok verlaat zijn slotbewaking { $dur } na de laatste satellietpositiebepaling.

js-meankind-slot-line = Er is dus elke { $interval } een positiebepaling nodig, ongeveer { $perDay } per dag.

js-meankind-solar-big =
    { $n ->
        [one] { $n } hemellichaam geplaatst op één epoche.
       *[other] { $n } hemellichamen geplaatst op één epoche.
    }

js-meankind-solar-big-link =
    { $n ->
        [one] { $n } hemellichaam geplaatst op één epoche; licht doet er { $dur } over van { $from } naar { $to }.
       *[other] { $n } hemellichamen geplaatst op één epoche; licht doet er { $dur } over van { $from } naar { $to }.
    }

js-meankind-solar-line = In totaal worden { $n } verbindingen getimed.

js-meankind-spoof-caught = De spoofing wordt gevangen voordat de tijdsynchronisatiespecificatie wordt overschreden.

js-meankind-spoof-caught-both = De spoofing wordt door beide klokken gevangen voordat de tijdsynchronisatiespecificatie wordt overschreden.

js-meankind-spoof-caught-label = Gevangen na, { $name }

js-meankind-spoof-caught-thr = De spoofing wordt gevangen voordat de tijdsynchronisatiespecificatie van { $thr } ns wordt overschreden.

js-meankind-spoof-caught-thr-both = De spoofing wordt door beide klokken gevangen voordat de tijdsynchronisatiespecificatie van { $thr } ns wordt overschreden.

js-meankind-spoof-detects = { $name } detecteert dit na { $dur }, bij een offset van { $offset } ns.

js-meankind-spoof-missed =
    { $n ->
        [one] De spoofing overschrijdt de tijdsynchronisatiespecificatie voordat { $names } hem vangt.
       *[other] De spoofing overschrijdt de tijdsynchronisatiespecificatie voordat { $names } hem vangen.
    }

js-meankind-spoof-offset = offset { $offset } ns

js-meankind-spoofdetect-big-by = Ja: de spoofing wordt gevangen, door { $by }.

js-meankind-spoofdetect-big-no = Nee: de gefuseerde monitor vangt de spoofing niet.

js-meankind-spoofdetect-big-yes = Ja: de spoofing wordt gevangen.

js-meankind-spoofdetect-line =
    { $n ->
        [one] { $on } van { $n } detectielaag slaat alarm.
       *[other] { $on } van { $n } detectielagen slaan alarm.
    }

js-meankind-spoofdetect-line-score =
    { $n ->
        [one] { $on } van { $n } detectielaag slaat alarm; de gefuseerde score is { $score }.
       *[other] { $on } van { $n } detectielagen slaan alarm; de gefuseerde score is { $score }.
    }

js-meankind-ssv-formation = Op { $km } km van elkaar kent het filter de relatieve positie tot op { $filter } m RMS, tegenover { $absolute } m door de twee absolute positiebepalingen van elkaar af te trekken.

js-meankind-ssv-navigation = Het filter aan boord houdt de positie op { $inside } m RMS binnen de GNSS-banen en { $above } m erboven.

js-meankind-ssv-shell = Op de schil geven alle constellaties samen minstens één signaal gedurende { $one } % van de tijd en minstens vier gedurende { $four } % (L1).

js-meankind-ssv-tail = MODELLED: een geometrische doorrekening en doorrekening van het linkbudget, geen meting van enig signaal in de ruimte.

js-meankind-ssv-trajectory = Van { $from } tot { $to } km hoogte is minstens één signaal in zicht gedurende { $one } % van de epochen en minstens vier gedurende { $four } % (L1, alle constellaties).

js-meankind-station-big = Boven het zuidpoolgebied brengen de correcties van een maanreferentiestation de { $percentile }fout van { $from } m naar { $to } m (gemodelleerd).

js-meankind-station-line = Binnen de nauwkeurigheidsdrempel gedurende { $share } % van de epochen; geen uitspraak over enig echt systeem.

js-meankind-sweep-big =
    { $n ->
        [one] Over { $n } waarde van { $param }: { $parts }.
       *[other] Over { $n } waarden van { $param }: { $parts }.
    }

js-meankind-sweep-line = De { $param } loopt van { $from } tot { $to }.

js-meankind-sweep-line-log = De { $param } loopt van { $from } tot { $to } op een logaritmische schaal.

js-meankind-sweep-part-flat = de { $metric } van { $key } blijft op { $value }

js-meankind-sweep-part-goes = de { $metric } van { $key } gaat van { $first } naar { $last }

js-meankind-sweep-result-word = resultaat

js-meankind-sweepnd-big =
    { $n ->
        [one] Over { $n } combinatie van { $keys } loopt de { $metric } van { $min } tot { $max }.
       *[other] Over { $n } combinaties van { $keys } loopt de { $metric } van { $min } tot { $max }.
    }

js-meankind-sweepnd-line = Een raster van { $shape } engine-runs.

js-meankind-telecom-fail =
    { $n ->
        [one] De klok faalt bij { $fail } van { $n } telecomtijdfoutcontrole.
       *[other] De klok faalt bij { $fail } van { $n } telecomtijdfoutcontroles.
    }

js-meankind-telecom-line = Controles van MTIE (maximale tijdintervalfout), TDEV (tijdafwijking) en de holdover-envelop tegen de ITU-T-maskers die in elke rij zijn genoemd.

js-meankind-telecom-line-margin = Controles van MTIE (maximale tijdintervalfout), TDEV (tijdafwijking) en de holdover-envelop tegen de ITU-T-maskers die in elke rij zijn genoemd. De kleinste marge tot de holdover-envelop is { $margin } ns.

js-meankind-telecom-pass =
    { $n ->
        [one] De klok slaagt voor alle { $n } telecomtijdfoutcontrole.
       *[other] De klok slaagt voor alle { $n } telecomtijdfoutcontroles.
    }

js-meankind-the-best = de beste

js-meankind-the-body = het hemellichaam

js-meankind-the-first = de eerste

js-meankind-the-name = de { $name }

js-meankind-the-second = de tweede

js-meankind-the-widest-signal = het breedste signaal

js-meankind-timebudget-big = De fout van { $clock } en de fout van het referentiestelsel kruisen elkaar bij een middelingstijd van { $tau }.

js-meankind-timebudget-line = Bij die kruising is de tijdfout { $x } s.

js-meankind-timeoffset-big = Een klok op de Maan loopt { $rate } µs per dag voor op een klok op de Aarde.

js-meankind-timeoffset-line = De gepubliceerde band is { $low } tot { $high } µs per dag.

js-meankind-timetransfer-big = { $q } houdt de twee locaties binnen { $qps } ps (kwadratisch gemiddelde); { $c } binnen { $cps } ps.

js-meankind-timetransfer-line = Binnen de afstandsspecificatie gedurende { $q } % van de tijd, tegenover { $c } %.

js-meankind-timetransfer-line-mm = Binnen de afstandsspecificatie van { $mm } mm gedurende { $q } % van de tijd, tegenover { $c } %.

js-meankind-tracking-big = Een spoofer kan de ontvanger overnemen vanaf maximaal { $km } km afstand.

js-meankind-tracking-line = Onder de eigen lusdynamica van de ontvanger gaat de lock verloren bij { $db } dB aan stoorzender boven het signaal.

js-meankind-trade-big = De kwantumsensoren zijn { $timing } keer beter in tijdsynchronisatie en { $inertial } keer beter in traagheidsnavigatie dan de klassieke basislijn.

js-meankind-trade-line = Zonder satellieten kan de kwantumsuite { $dur } doorvaren.

js-meankind-ttbudget-big = De tweewegoffset is { $offset } ns, met een gecombineerde onzekerheid van { $uncertainty } ns.

js-meankind-ttbudget-line = Sagnac { $sagnac } ns; ionosfeer { $iono } ns.

js-meankind-ukf-big-no = Nee: het filter is niet zelfconsistent.

js-meankind-ukf-big-yes = Ja: het filter is zelfconsistent.

js-meankind-ukf-line-in = De genormaliseerde innovatie in het kwadraat middelt { $mean }, binnen de 95 %-band van { $low } tot { $high }. Dit controleert consistentie, geen nauwkeurigheid.

js-meankind-ukf-line-in-seeds =
    { $n ->
        [one] De genormaliseerde innovatie in het kwadraat middelt { $mean }, binnen de 95 %-band van { $low } tot { $high }, over { $n } seed. Dit controleert consistentie, geen nauwkeurigheid.
       *[other] De genormaliseerde innovatie in het kwadraat middelt { $mean }, binnen de 95 %-band van { $low } tot { $high }, over { $n } seeds. Dit controleert consistentie, geen nauwkeurigheid.
    }

js-meankind-ukf-line-out = De genormaliseerde innovatie in het kwadraat middelt { $mean }, buiten de 95 %-band van { $low } tot { $high }. Dit controleert consistentie, geen nauwkeurigheid.

js-meankind-ukf-line-out-seeds =
    { $n ->
        [one] De genormaliseerde innovatie in het kwadraat middelt { $mean }, buiten de 95 %-band van { $low } tot { $high }, over { $n } seed. Dit controleert consistentie, geen nauwkeurigheid.
       *[other] De genormaliseerde innovatie in het kwadraat middelt { $mean }, buiten de 95 %-band van { $low } tot { $high }, over { $n } seeds. Dit controleert consistentie, geen nauwkeurigheid.
    }

js-meankind-user-word = gebruiker

js-meankind-vlbi-big = Over een basislijn van { $km } km komt het signaal van het baken { $ms } ms uiteen aan bij de twee stations.

js-meankind-vlbi-line = De nabijveldcorrectie is { $us } µs.

js-meankind-vlbifim-big = Elke stationscoördinaat is met dit waarneemschema bekend tot op { $m } m.

js-meankind-vlbifim-line = De eenvoudige schatting met gelijke aandelen zou { $m } m claimen.

js-meankind-weather-big = De hoge atmosfeer warmt op tot { $k } K.

js-meankind-weather-big-ref = De hoge atmosfeer warmt op tot { $k } K, tegenover { $ref } K voor de referentie.

js-meankind-weather-line = De geomagnetische activiteitsindex ap is { $ap }.

js-meankind-whole-run = over de hele run

js-mthread-bcol-label = Label

js-mthread-bcol-share = Grootte ten opzichte van de grootste positieterm

js-mthread-bcol-sigma = 1 sigma

js-mthread-bcol-source = Bijdrage

js-mthread-budget-caption = { $phase }: 1 sigma bij binnenkomst { $entry }, op het hoogtepunt { $peak }, bij vertrek { $exit } (positie); hieronder elke bijdrage, de grootste eerst.

js-mthread-chart-title = { $metric } tegen verstreken missietijd, één band per fase

js-mthread-col-kind = Soort

js-mthread-col-label = Label

js-mthread-col-limit = Grootste bijdrage

js-mthread-col-margin = Tegenover de limiet

js-mthread-col-peak-pos = Piekpositie

js-mthread-col-peak-time = Piek in klokbias

js-mthread-col-peak-vel = Pieksnelheid

js-mthread-col-phase = Fase

js-mthread-col-window = Missietijd

js-mthread-example-not-loaded = het vastgelegde resultaat is niet geladen

js-mthread-file-failed = { $name } kon niet worden gelezen: { $reason }.

js-mthread-kv-elapsed = Verstreken missietijd

js-mthread-kv-engine = Engine

js-mthread-kv-epoch = Epoche (UTC)

js-mthread-kv-limits = Fasen met een opgegeven limiet

js-mthread-kv-limits-value = { $n } ({ $met } gehaald, { $missed } niet gehaald)

js-mthread-kv-phases = Fasen

js-mthread-kv-seed = Seed

js-mthread-kv-title = Thread

js-mthread-layout-phases = Gelijke breedte per fase

js-mthread-layout-time = Ware missietijd

js-mthread-limit-title = { $phase }: de opgegeven limiet, { $limit }

js-mthread-log-scale = logaritmische schaal

js-mthread-margin-met = { $m }× de limiet, gehaald

js-mthread-margin-missed = { $m }× de limiet, niet gehaald

js-mthread-metric-pos = Positie, 1 sigma

js-mthread-metric-time = Klokbias, 1 sigma

js-mthread-metric-vel = Snelheid, 1 sigma

js-mthread-na = n.v.t.

js-mthread-no-events = Deze fase legt geen gebeurtenissen vast.

js-mthread-no-phases = het resultaat bevat geen fasen

js-mthread-no-requirement = geen limiet opgegeven

js-mthread-no-series = Het resultaat bevat geen samples van deze grootheid.

js-mthread-no-weak = Het resultaat noemt geen zwakste schakel.

js-mthread-not-json = het resultaat is geen JSON ({ $reason })

js-mthread-not-thread = dit is geen missiethreadresultaat (schema { $schema } verwacht)

js-mthread-note-phases = Elke fase wordt met dezelfde breedte getekend, zodat een korte fase even goed zichtbaar is als een lange; het tijdstip waarop elke fase begint staat onder de band. Schakel over naar ware missietijd om de werkelijke verhoudingen te zien. Onderbroken lijnen zijn de limieten die het document opgeeft; een onderbreking in de lijn is een overdracht.

js-mthread-note-time = Ware missietijd: een fase van enkele minuten kan te smal zijn om te zien. Schakel over naar gelijke breedtes om haar te lezen. Onderbroken lijnen zijn de limieten die het document opgeeft; een onderbreking in de lijn is een overdracht.

js-mthread-open-failed = Het voorbeeld kon niet worden geopend: { $reason }.

js-mthread-opened = { $name } is in deze pagina gelezen; er is niets naar buiten verzonden.

js-mthread-opening = Het voorbeeld van het Artemis-type wordt geopend…

js-mthread-prov = Elk label op deze pagina is van de engine zelf; de pagina neemt elk getal over uit het resultaat en schaalt het alleen.

js-mthread-recorded = Het vastgelegde resultaat van de engine (versie { $version }): een illustratieve keten, opgebouwd uit openbare missiebeschrijvingen; de getallen zijn gemodelleerd en staan voor niets echts.

js-mthread-sets-peak = bepaalt de piek

js-mthread-too-large = Dat bestand is groter dan { $mb } MB; het wordt niet gelezen.

js-mthread-weak-line = De zwakste schakel is de fase <b>{ $phase }</b>: { $margin }× de opgegeven limiet, bepaald door { $source }. De marge is de kleinste verhouding van een opgegeven limiet tot de piek van de fase; boven 1 is de eis gehaald.

js-mthread-weakest-flag = zwakste schakel

js-mthread-weakest-mark = zwakste schakel

js-obs-cell-extent = { $south }° tot { $north }° N, { $west }° tot { $east }° O

js-obs-cell-read = { $state }: { $cell }. Bemonsterd { $sampled }, getroffen { $affected }.

js-obs-cell-title = { $state }; bemonsterd { $sampled }, getroffen { $affected }

js-obs-cell-title-reason = { $state } ({ $reason }); bemonsterd { $sampled }, getroffen { $affected }

js-obs-clear-note = { $notClear } Een cel zonder vermelding is door minder dan 5 verschillende vliegtuigen gezien en wordt achtergehouden; ze wordt niet getekend. Kleur is nooit het enige signaal: niet waargenomen is gearceerd, en de tabel schrijft elke toestand uit.

js-obs-col-affected = Getroffen vliegtuigen

js-obs-col-bbox = Omsluitend vak (Z, W, N, O)

js-obs-col-bytes = Bytes

js-obs-col-cause = Oorzaak

js-obs-col-cell = Cel (breedtegraad, lengtegraad)

js-obs-col-cells = Cellen

js-obs-col-check = Controle

js-obs-col-file = Bestand

js-obs-col-incident = Incident

js-obs-col-sampled = Bemonsterde vliegtuigen

js-obs-col-sha = SHA-256 (manifest)

js-obs-col-share = Getroffen aandeel

js-obs-col-state = Toestand

js-obs-col-why = Waarom niet waargenomen

js-obs-day-alt = { $degraded } cellen verslechterd, { $notDegraded } niet verslechterd, { $notObserved } niet waargenomen, op { $date }.

js-obs-day-heading = Dag { $date } (UTC)

js-obs-ds-attribution = Naamsvermelding

js-obs-ds-coverage = Dekking

js-obs-ds-dataset = Dataset

js-obs-ds-licence = Licentie

js-obs-ds-licence-address = Licentieadres

js-obs-ds-product = Product

js-obs-ds-written-by = Geschreven door Kshana

js-obs-err-cause = { $name } vermeldt een andere oorzaak dan "niet toegeschreven"; deze pagina toont er geen

js-obs-err-feature-polygon = { $name }: kenmerk { $n } is geen celpolygoon

js-obs-err-feature-state = { $name }: kenmerk { $n } heeft de toestand "{ $state }", die niet een van { $states } is

js-obs-err-incident-object = { $name }: incident { $n } is geen object

js-obs-err-no-date = { $name } vermeldt geen datum

js-obs-err-no-features = { $name } heeft geen kenmerken

js-obs-err-no-incidents = { $name } heeft geen incidentenlijst

js-obs-err-not-day = { $name } is geen { $schema }-bestand

js-obs-err-not-incident = { $name } is geen { $schema }-bestand

js-obs-err-not-json = { $what } is geen JSON ({ $reason })

js-obs-err-not-manifest = { $name } is geen { $schema }-bestand

js-obs-err-not-object = { $what } is geen JSON-object

js-obs-err-not-text = { $what } is geen tekst of is groter dan { $mib } MiB

js-obs-err-states = { $name } noemt andere toestanden dan de drie die deze pagina toont

js-obs-file-matches = komt overeen

js-obs-file-mismatch = komt niet overeen

js-obs-file-no-hash = geen hash opgegeven

js-obs-file-not-opened = niet geopend

js-obs-files-note = Methode { $method }. De SHA-256 van elk bestand wordt hier berekend uit het bestand dat u hebt geopend en vergeleken met het manifest; een bestand dat u niet hebt geopend wordt niet gecontroleerd.

js-obs-incident = incident

js-obs-incident-note = Aangrenzende verslechterde cellen (diagonalen inbegrepen) vormen één incident. De oorzaak van elk incident is: niet toegeschreven. Dit is geen bevestiging en geen NOTAM.

js-obs-kv-cells = Gepubliceerde cellen

js-obs-kv-day-wide = Effect over de hele dag

js-obs-kv-degraded = Verslechterd

js-obs-kv-not-degraded = Niet verslechterd

js-obs-kv-not-observed = Niet waargenomen (gepubliceerd)

js-obs-kv-scope = Reikwijdte

js-obs-map-aria = { $summary } De tabel hieronder somt elke cel op.

js-obs-means-degraded = Een groot aandeel van de in de cel bemonsterde vliegtuigen meldde die dag een lage navigatienauwkeurigheid, duidelijk boven de achtergrond van die dag.

js-obs-means-not-degraded = Er zijn genoeg vliegtuigen bemonsterd en het aandeel haalde de regel niet.

js-obs-means-not-observed = De gegevens lieten geen oordeel toe. Dit is niet "vrij".

js-obs-na = n.v.t.

js-obs-no = nee

js-obs-no-cells = Geen cellen in dit bestand

js-obs-no-day-file = De bestanden voor { $date } hebben geen dagbestand (.geojson), dus er is niets om voor die dag te tonen.

js-obs-no-degraded = Geen verslechterde cellen op deze dag.

js-obs-no-file-read = Er kon geen bestand worden gelezen.

js-obs-no-incident-file = Voor deze dag is geen incidentenbestand geopend.

js-obs-no-manifest = Voor deze dag is geen manifest geopend, dus de bestanden kunnen niet aan hun hashes worden getoetst.

js-obs-no-notice = Dit bestand bevat geen mededeling. De adviserende verklaring bovenaan deze pagina geldt toch.

js-obs-no-reason = geen reden opgegeven

js-obs-not-clear = Niet waargenomen is niet vrij.

js-obs-not-readable = { $name }: geen bestand dat deze pagina leest (.geojson, .incidents.json, .manifest.json of .png).

js-obs-not-stated = niet opgegeven

js-obs-note-day-wide = Dit was een dag met een effect over de hele dag: de achtergrond van de dag was zelf hoog, dus geen enkele cel kon die dag worden beoordeeld. Dat is geen uitspraak dat de lucht schoon was.

js-obs-note-summary-mismatch = De samenvatting die het bestand opgeeft komt niet overeen met de cellen die het vermeldt; de getallen worden getoond zoals ze zijn geschreven.

js-obs-nothing-yet = Nog niets te tonen: open ook het .geojson-bestand van de dag.

js-obs-notice = Mededeling in het bestand: { $notice }

js-obs-opened-day-file = { $days } dag geopend uit { $files } bestand. Hier gelezen; er is niets geüpload.

js-obs-opened-day-files = { $days } dag geopend uit { $files } bestanden. Hier gelezen; er is niets geüpload.

js-obs-opened-days-file = { $days } dagen geopend uit { $files } bestand. Hier gelezen; er is niets geüpload.

js-obs-opened-days-files = { $days } dagen geopend uit { $files } bestanden. Hier gelezen; er is niets geüpload.

js-obs-read-failed = { $name }: kon niet worden gelezen ({ $reason }).

js-obs-reason-day-wide = de achtergrond van de dag was zelf hoog, dus geen enkele cel kon die dag worden beoordeeld

js-obs-reason-insufficient = er zijn te weinig vliegtuigen bemonsterd om een oordeel te vellen

js-obs-reason-no-background = er was voor de dag geen achtergrond om de cel mee te vergelijken

js-obs-release = Vrijgegeven niet eerder dan { $when }: producten worden minstens { $hours } uur nadat de dag eindigt gepubliceerd, op cellen van { $deg } graden. Dit is geen live weergave.

js-obs-release-default = het einde van de dag plus de vertraging

js-obs-show-all = Alle { $n } cellen tonen

js-obs-state-degraded = Verslechterd

js-obs-state-not-degraded = Niet verslechterd

js-obs-state-not-observed = Niet waargenomen

js-obs-the-day-file = het dagbestand

js-obs-the-incident-file = het incidentenbestand

js-obs-the-manifest = het manifest

js-obs-too-large = { $name }: groter dan { $mib } MiB; open een kleiner bestand.

js-obs-unstated-number = een niet opgegeven aantal

js-obs-withheld = achtergehouden

js-obs-yes-no-call = ja: geen enkele cel kon worden beoordeeld

js-opt-avail-label = Beschikbaarheid, plafond en beschikbaarheid bij heldere hemel per locatie

js-opt-avail-note = Per locatie: de beschikbaarheid van de verbinding tegen wolken- en turbulentiefading, het plafond dat geen extra marge kan verhogen (wolken en richting), en de beschikbaarheid zonder enige wolk.

js-opt-avail-title = Beschikbaarheid tegenover het plafond

js-opt-bar-available = { $name }: beschikbaar

js-opt-bar-ceiling = { $name }: plafond

js-opt-bar-clear-sky = { $name }: heldere hemel

js-opt-blurb-network = Een bewolktere noordelijke, een gemiddelde centrale en een helderdere zuidelijke locatie kijken naar een optische LEO-terminal onder 30 graden: hoe vaak is de verbinding in de lucht, en wat leveren extra locaties op?

js-opt-blurb-techniques = Eén uplink onder 25 graden in wolken en turbulentie: wat leveren een andere golflengte, een grotere apertuur, adaptieve optica of meer marge op?

js-opt-cloud-episode = wolkenepisode

js-opt-correlated = gecorreleerd

js-opt-default-bars = balken

js-opt-default-chart = grafiek

js-opt-direction-wave = { $direction }, golf { $wave }

js-opt-diversity-label = Netwerkbeschikbaarheid tegenover het aantal locaties

js-opt-diversity-note = Beschikbaarheid van de beste 1, 2 en 3 locaties, met onafhankelijk weer en met weer dat over { $km } km gecorreleerd is.

js-opt-diversity-title = Locatiediversiteit

js-opt-fact-capture-loss = Geometrisch invangverlies

js-opt-fact-direction = Richting

js-opt-fact-elevation = Elevatie

js-opt-fact-footprint = Bundelvoetafdruk

js-opt-fact-margin = Marge zonder atmosfeer

js-opt-fact-received = Ontvangen vermogen, zonder atmosfeer

js-opt-fact-sensitivity = Gevoeligheid van de ontvanger

js-opt-fact-wavelength = Golflengte

js-opt-gain-points = +{ $n } punten

js-opt-hours = uur

js-opt-independent = onafhankelijk

js-opt-link-down = verbinding uit

js-opt-margin-label = Extra marge nodig voor elk beschikbaarheidsdoel

js-opt-margin-line-title = { $name }: linkmarge, dB

js-opt-margin-note = Extra linkmarge, in dB bovenop de huidige verbinding, voor elk beschikbaarheidsdoel; negatief betekent dat de verbinding al meer heeft dan nodig is. Voor een doel boven het plafond van een locatie bestaat geen marge die het bereikt (de engine laat het weg).

js-opt-margin-title = Marge die elk beschikbaarheidsdoel nodig heeft

js-opt-model-output = Modeluitvoer

js-opt-na = n.v.t.

js-opt-no-data = Geen gegevens in dit resultaat.

js-opt-no-series = Geen tijdreeks in dit resultaat.

js-opt-no-source = geen bron opgegeven

js-opt-not-result = dit is geen resultaat van optische atmosfeer met locaties

js-opt-open-failed = { $title } kon niet worden geopend: { $reason }.

js-opt-opening = { $title } wordt geopend…

js-opt-outage-label = Kans dat een uitval langer duurt dan een bepaalde duur

js-opt-outage-note = Kans dat een uitval langer duurt dan een bepaalde duur, per locatie (logaritmische tijdas).

js-opt-outage-title = Hoe lang uitvallen duren

js-opt-point-title = { $name }: { $xLabel } { $x }, { $yLabel } { $y }

js-opt-prov = { $label } Locaties: { $sites }.

js-opt-realised-up = { $value } in de lucht

js-opt-recorded = { $title }: het vastgelegde resultaat van de engine (versie { $version }). Modeluitvoer, geen meting.

js-opt-result-not-json = het resultaat is geen JSON ({ $reason })

js-opt-result-not-loaded = het vastgelegde resultaat is niet geladen

js-opt-series-label = Linkmarge tegenover tijd

js-opt-series-note = Eén seeded realisatie van het opgegeven locatiemodel (seed { $seed }, { $hours } h in stappen van { $step } s): wolkenepisodes, voor elk een vloeibarewaterkolom, per stap één scintillatiesample. De marge is het fadingbudget min de wolken- en scintillatiefading; de verbinding is uit onder 0 dB. Het is één trekking, niet het klimaat: de beschikbaarheid ervan wijkt af van de opgegeven beschikbaarheid met de steekproeffout van de trekking. De marge wordt voor het tekenen bij −40 dB afgekapt.

js-opt-series-title = Linkmarge tegenover tijd

js-opt-stated = opgegeven { $value }

js-opt-stripe-cloud = wolk

js-opt-stripe-down = uit

js-opt-stripe-title = { $what }, uur { $from } tot { $to }

js-opt-techniques-label = Beschikbaarheidswinst per techniek

js-opt-techniques-note = Beschikbaarheidswinst in procentpunten ten opzichte van de basislijn, voor één locatie.

js-opt-techniques-title = Wat elke techniek oplevert

js-opt-th-availability = Beschikbaarheid

js-opt-th-ceiling = Plafond

js-opt-th-clear-air = Verlies bij heldere lucht

js-opt-th-cloud-prob = Wolkenkans (invoer)

js-opt-th-fade-budget = Fadingbudget

js-opt-th-latlon = Breedtegraad, lengtegraad

js-opt-th-mean-outage = Gemiddelde uitval

js-opt-th-outages-year = Uitvallen per jaar

js-opt-th-scint = Scintillatie-index

js-opt-th-site = Locatie

js-opt-timing-label = Beschikbaarheid van tijdsynchronisatie per locatie en klok

js-opt-timing-note = Deel van alle tijd dat de tijdfout binnen de drempel blijft, per locatie en klokklasse: de holdover van de klok tegenover de uitvalduren.

js-opt-timing-title = Tijdsynchronisatie behouden tijdens de uitvallen

js-opt-title-network = Drie grondlocaties, locatiediversiteit

js-opt-title-techniques = Eén uplink, verbeteringstechnieken

js-opt-x-best-n = beste n locaties

js-opt-x-outage-duration = uitvalduur, h (log)

js-opt-x-target = beschikbaarheidsdoel, %

js-opt-y-availability = beschikbaarheid, %

js-opt-y-extra-margin = extra marge, dB

js-opt-y-p-longer = P(langer)

js-replay-band-calibrating = kalibreren

js-replay-band-degraded = verslechterd

js-replay-band-nominal = nominaal

js-replay-band-run-ended = { $band } · run beëindigd

js-replay-band-untrusted = niet vertrouwd

js-replay-clock = T+{ $t } van { $max }

js-replay-coast-hidden = kust verborgen: de verzonnen posities van dit log vallen op land

js-replay-coast-note = Kust: { $source }, alleen ter illustratie.

js-replay-coast-note-hidden = { $reason }.

js-replay-coast-window = Natural Earth 1:10 miljoen, venster { $window }

js-replay-coast-world = Natural Earth 1:110 miljoen (de wereldomtrek van de Studio), grof

js-replay-demo-trust-log = { $title } (vertrouwenslog)

js-replay-dir-east = oost

js-replay-dir-north = noord

js-replay-dir-south = zuid

js-replay-dir-west = west

js-replay-dirs-and = { $list } en { $last }

js-replay-drawing-animation = De animatie wordt getekend…

js-replay-drawing-frames = De frames worden getekend…

js-replay-every-direction = elke richting

js-replay-file-error = { $name }: { $error }

js-replay-kinds-convergence-horizontal = Convergentie: mediane horizontale fout

js-replay-kinds-convergence-vertical = Convergentie: mediane verticale fout

js-replay-kv-course = Gemelde koers

js-replay-kv-heading = Heading (gyro)

js-replay-kv-position-error = Positiefout

js-replay-kv-receiver = Ontvanger

js-replay-kv-run-time = Runtijd

js-replay-kv-satellites = Gebruikte satellieten / in zicht

js-replay-kv-sky = Hemel

js-replay-legend = Legenda

js-replay-legend-no-fix = geen positiebepaling

js-replay-legend-true-track = ware track

js-replay-moment = Moment op T+{ $t }:

js-replay-no-coast = Er wordt geen kust getekend: voor dit venster is er geen meegeleverd.

js-replay-no-gsv = geen GSV in dit log

js-replay-not-json = { $name }: geen JSON.

js-replay-not-scored = niet gescoord

js-replay-obs-not-attributed = niet toegeschreven

js-replay-open-failed = { $id } kon niet worden geopend: { $reason }.

js-replay-open-file = Een bestand openen…

js-replay-opened = { $name } geopend in paneel { $n }. Hier gelezen; er is niets geüpload.

js-replay-opening = { $id } wordt geopend…

js-replay-pause = Pauzeren

js-replay-play = Afspelen

js-replay-read-failed = { $name }: kon niet worden gelezen of getekend ({ $reason }).

js-replay-reading = { $name } wordt gelezen…

js-replay-reduced-motion = Verminderde beweging heeft de voorkeur, dus de replay start op 1x en speelt niet vanzelf af.

js-replay-run = Run

js-replay-run-shown = Run getoond in paneel { $n }

js-replay-saved-svg = { $name } opgeslagen ({ $size } kB): elk frame in één bestand, getekend uit dezelfde rijen als deze pagina.

js-replay-saved-zip = { $name } opgeslagen ({ $size } MB): één SVG per frame, een manifest van de rijen erachter en een README.

js-replay-src-instructor = Uw bestand { $name }: bij een instructeurslog alleen komt geen enginescore of hemel mee.

js-replay-src-trust = Uw bestand { $name }: een vertrouwensresultaat bevat geen hemel of heading, dus die worden niet getekend.

js-replay-status-ready = { $a } en { $b }: synthetische runs, gescoord door de engine. Druk op Afspelen of verschuif de klok.

js-replay-status-synthetic = { $titles }: synthetische runs, gescoord door de engine.

js-replay-status-synthetic-no-coast = { $titles }: synthetische runs, gescoord door de engine. Kustlijn niet beschikbaar.

js-replay-strip-label = Vertrouwensscore over de run

js-replay-titles-and = { $a } en { $b }

js-replay-too-large = { $name } is groter dan deze pagina leest.

js-replay-track = Track van { $n } logrijen, noord boven.

js-replay-track-widened = Track van { $n } logrijen, noord boven, verbreed om de dichtstbijzijnde kust te tonen.

js-replay-verdict = Oordeel

js-replay-verdict-degraded = { $dur } verslechterd, niets in de niet-vertrouwde band

js-replay-verdict-early = Oordeel (vroeg)

js-replay-verdict-fine = Alleen uit het log en de score van de engine; synthetisch, adviserend, geen cijfer voor detectieprestaties.

js-replay-verdict-first = eerst onder nominaal op T+{ $t }

js-replay-verdict-first-after = eerst onder nominaal op T+{ $t }, { $dur } nadat de eerste gebeurtenis begon (T+{ $onset })

js-replay-verdict-first-before = eerst onder nominaal op T+{ $t }, vóór het begin van de eerste gebeurtenis (T+{ $onset })

js-replay-verdict-lowest = Laagste vertrouwensscore { $score } ({ $band }) op T+{ $t }

js-replay-verdict-never-left = de score verliet de nominale band nooit

js-replay-verdict-no-fix = geen positiebepaling gedurende { $dur }

js-replay-verdict-not-scored = Niet gescoord: de vertrouwensscore van de engine wordt getoond voor de bibliotheekruns

js-replay-verdict-peak-error = grootste gelogde positiefout { $err } m op T+{ $t }

js-replay-verdict-untrusted = { $dur } in de niet-vertrouwde band

js-replay-verdict-wait = Getoond wanneer deze run eindigt, op T+{ $t }.

js-ssv-altitude-label = Hoogte en gebruikte metingen

js-ssv-at-least-1 = minstens 1 signaal

js-ssv-at-least-4 = minstens 4 signalen

js-ssv-avail-label = Beschikbaarheid, { $band }

js-ssv-bar-title = { $label }, { $name }: { $value }{ $unit }

js-ssv-blurb-formation-heo = Een chief en een deputy op een kilometer van elkaar in een sterk elliptische baan: hoe goed kent het filter hun relatieve positie, tegenover wat de twee absolute positiebepalingen zouden geven.

js-ssv-blurb-heo = Een sterk elliptische baan (apogeum bij 58 600 km) met een nadir-antenne met hoge winst, een zenit-patchantenne en een parametrisch zijlobmodel: signalen in zicht, beste C/N0, hoofdlob tegenover zijlob, precisieverdunning en de signalen die de atmosfeer schampen.

js-ssv-blurb-lunar-weak = Een maanoverdrachtstraject met een ontvanger gebouwd om bij de zwakste signalen te werken: wat hij nodig heeft om te acquireren en te volgen, en hoeveel van het traject hij kan gebruiken.

js-ssv-blurb-nav-lunar = Een navigatiefilter aan boord op een maanoverdracht: zijn positiefout tegenover de grens die het opgeeft, onder en boven de eigen banen van de GNSS-satellieten.

js-ssv-blurb-shell = Een bolvormige schil op geostationaire hoogte, bemonsterd op een raster: hoe vaak hoort een ruimtevaartuig daar minstens één en minstens vier signalen van 20 dB-Hz, op L1 en L5, voor elke constellatie en voor alle samen?

js-ssv-cn0-altitude-label = Beste C/N0 en hoogte tegenover tijd, { $band }

js-ssv-cn0-label = Beste C/N0, { $band }

js-ssv-cn0-note = Van de signalen in zicht het sterkste op elke epoche: van klein naar groot over de epochen, met het gemiddelde gemarkeerd.

js-ssv-cn0-title = Beste draaggolf-ruisdichtheid, { $band }

js-ssv-comparison-failed = De vergelijking kon niet worden getoond ({ $reason }).

js-ssv-comparison-not-loaded = het vergelijkingsbestand is niet geladen

js-ssv-default-bars = balken

js-ssv-default-chart = grafiek

js-ssv-default-ranges = bereiken

js-ssv-deputies-note = Absolute RMS van de chief { $rms } m over { $epochs } epochen.

js-ssv-deputies-title = Elke deputy

js-ssv-dop-note = Mediaan, 95e percentiel en slechtste PDOP over de epochen met een positiebepaling en, waar het scenario een atmosfeer instelt, de signalen die haar schampen.

js-ssv-dop-title = Precisieverdunning en de atmosfeer, { $band }

js-ssv-err-label = Positiefout tegenover de opgegeven grens

js-ssv-err-note = De onderbroken lijn is de één-sigmagrens die het filter opgeeft; de ononderbroken lijn is zijn fout tegenover de referentie die het scenario kent. Gedecimeerd door de engine.

js-ssv-err-title = Positiefout tegenover de eigen grens van het filter

js-ssv-fact-antenna = Antenne

js-ssv-fact-apogee = Apogeumhoogte

js-ssv-fact-cn0-threshold = Drempel voor draaggolf-ruisdichtheid

js-ssv-fact-duration = Duur

js-ssv-fact-eccentricity = Excentriciteit

js-ssv-fact-grid-points = Rasterpunten

js-ssv-fact-inclination = Inclinatie

js-ssv-fact-mode = Modus

js-ssv-fact-perigee = Perigeumhoogte

js-ssv-fact-period = Periode

js-ssv-fact-shell-altitude = Schilhoogte

js-ssv-fact-sma = Halve lange as

js-ssv-fact-step = Stap

js-ssv-filter = filter

js-ssv-formation-note = RMS van de relatieve positiefout, van het filter en van het aftrekken van de twee absolute positiebepalingen, over de hele run en boven de GNSS-banen.

js-ssv-formation-title = Relatieve positie van de deputy's

js-ssv-from-absolute = uit twee absolute positiebepalingen

js-ssv-group-combined = alle samen

js-ssv-icg-note = { $label }; de oordelen per drempel van de vastgelegde resultaatbestanden van de engine (engine-commit { $commit }). De tabellen van het boekje zijn openbaar; niets hier is VALIDATED.

js-ssv-icg-wrong-file = het ICG-vergelijkingsbestand is niet het bestand dat deze pagina leest

js-ssv-lobe-note = Hoeveel van de bruikbare verbindingen via de hoofdlob kwamen en hoeveel via een zijlob, zoals geteld door de engine.

js-ssv-lobe-title = Hoofdlob en zijlob, { $band }

js-ssv-na = n.v.t.

js-ssv-nav-note = Gebruikte en afgewezen metingen, de langste onderbreking met minder dan vier signalen, de eindfout en de schatting van de zonnestralingsdruk tegenover de referentie die het scenario kent.

js-ssv-nav-title = De run in getallen

js-ssv-never = nooit

js-ssv-never-had-four = had er nooit vier

js-ssv-never-had-one = had er nooit één

js-ssv-no-range = Geen bereik in dit resultaat.

js-ssv-no-series = Het resultaat bevat geen reeks voor deze grafiek.

js-ssv-not-in-variant = geen onderdeel van de variant

js-ssv-not-result = dit is geen gnss-ssv-resultaat

js-ssv-of = { $n } van { $total }

js-ssv-offset = { $deg }° offset

js-ssv-open-failed = { $title } kon niet worden geopend: { $reason }.

js-ssv-opening = { $title } wordt geopend…

js-ssv-outage-note = In minuten, over de run. "Nooit" markeert een groep die nergens op de schil ooit zoveel signalen had.

js-ssv-outage-title = Langste uitvallen op de schil

js-ssv-phases-note = Een statistiek van het filter over de run en over de twee delen ervan. Een gemiddelde positie-NEES dicht bij 3 betekent dat de opgegeven grens van het filter consistent is met zijn fout.

js-ssv-phases-title = Positiefout per fase

js-ssv-point-title = { $name }: { $xLabel } { $x }, { $yLabel } { $y }

js-ssv-range-title = { $label }: min { $min }, gemiddeld { $mean }, max { $max } { $unit }

js-ssv-range-value = { $min } tot { $max }

js-ssv-recorded = { $title }: het vastgelegde resultaat van de engine (versie { $version }).

js-ssv-relative-label = Relatieve positiefout

js-ssv-result-not-json = het resultaat is geen JSON ({ $reason })

js-ssv-result-not-loaded = het vastgelegde resultaat is niet geladen

js-ssv-row-acquires = Acquireert tot

js-ssv-row-carrier = Draaggolfvolging tot

js-ssv-row-code = Codevolging tot

js-ssv-row-coherent = Coherente integratie

js-ssv-row-delay-mean = Vertraging, gemiddeld

js-ssv-row-detection = Detectiedrempel

js-ssv-row-false-alarm = Kans op vals alarm per cel

js-ssv-row-final-error = Uiteindelijke positiefout

js-ssv-row-gap = Langste onderbreking

js-ssv-row-gated = Afgewezen metingen

js-ssv-row-grazing = Schampend onder 100 km

js-ssv-row-limb-links = Verbindingen door de rand

js-ssv-row-loss-mean = Verlies, gemiddeld

js-ssv-row-lost = Verloren aan de atmosfeer

js-ssv-row-pdop-median = PDOP, mediaan

js-ssv-row-pdop-p95 = PDOP, 95e percentiel

js-ssv-row-pdop-worst = PDOP, slechtste

js-ssv-row-plasma-mean = Plasmasferische TEC, gemiddeld

js-ssv-row-search-cells = Zoekcellen

js-ssv-row-search-time = Zoektijd

js-ssv-row-srp-est = Zonnestralingsdruk, geschat

js-ssv-row-srp-truth = Zonnestralingsdruk, referentie

js-ssv-row-stec-mean = Slant-TEC, gemiddeld

js-ssv-row-tangent = Raakpunthoogte, min tot max

js-ssv-row-tracking = Gebruikte volgdrempel

js-ssv-row-used = Gebruikte metingen

js-ssv-series-altitude = hoogte/1000

js-ssv-series-altitude-name = hoogte

js-ssv-series-best-cn0 = beste C/N0

js-ssv-series-error = fout

js-ssv-series-measurements = metingen

js-ssv-series-note = Eén gedecimeerde reeks van het gecombineerde aantal over alle constellaties. De engine schrijft geen reeks per constellatie, dus er wordt er geen getekend.

js-ssv-series-signals = signalen in zicht

js-ssv-series-signals-label = Signalen in zicht tegenover tijd, { $band }

js-ssv-series-stated-bound = opgegeven grens

js-ssv-series-title = Signalen en beste C/N0 langs de baan, { $band }

js-ssv-shell-avail-note = Aandeel van rasterpunten en tijden met minstens één en minstens vier signalen boven { $cn0 } dB-Hz.

js-ssv-shell-avail-title = Beschikbaarheid op de schil, { $band }

js-ssv-tangent-value = { $min } tot { $max } km

js-ssv-th-above-absolute = Boven GNSS: uit absoluut, m

js-ssv-th-above-filter = Boven GNSS: filter, m

js-ssv-th-band-group = Band en groep

js-ssv-th-bar = Drempel

js-ssv-th-baseline = Basislijn, km

js-ssv-th-common-4 = Epochen met 4 gemeenschappelijke signalen

js-ssv-th-common-mean = Gemiddeld aantal gemeenschappelijke signalen

js-ssv-th-compares = Wat het vergelijkt

js-ssv-th-deputy = Deputy

js-ssv-th-epochs = Epochen

js-ssv-th-group = Groep

js-ssv-th-main-lobe = Hoofdlobverbindingen

js-ssv-th-nees = Gemiddelde positie-NEES

js-ssv-th-phase = Fase

js-ssv-th-pos-p95 = Positie 95e percentiel, m

js-ssv-th-pos-rms = Positie-RMS, m

js-ssv-th-quantity = Grootheid

js-ssv-th-rel-absolute = Relatieve RMS, uit absoluut, m

js-ssv-th-rel-filter = Relatieve RMS, filter, m

js-ssv-th-rel-vel = Relatieve snelheids-RMS, m/s

js-ssv-th-run1-cells = Run 1: cellen binnen tolerantie

js-ssv-th-run1-verdict = Oordeel van run 1

js-ssv-th-sidelobe = Zijlobverbindingen

js-ssv-th-sidelobe-share = Zijlobaandeel

js-ssv-th-value = Waarde

js-ssv-th-variant = Variant (diagnostisch, GLONASS-referentiehoeken uit tabel 4.2)

js-ssv-th-vel-rms = Snelheids-RMS, m/s

js-ssv-th-with-4 = Met 4 of meer signalen

js-ssv-th-without-1 = Langste zonder 1 signaal

js-ssv-th-without-4 = Langste zonder 4 signalen

js-ssv-title-formation-heo = Formatie, sterk elliptische baan

js-ssv-title-heo = Sterk elliptische baan

js-ssv-title-lunar-weak = Maanoverdracht, ontvanger voor zwakke signalen

js-ssv-title-nav-lunar = Filter aan boord, maanoverdracht

js-ssv-title-shell = Schil op 36 000 km

js-ssv-traj-avail-note = Aandeel van de epochen met minstens één en minstens vier signalen boven { $cn0 } dB-Hz.

js-ssv-traj-avail-title = Beschikbaarheid langs het traject, { $band }

js-ssv-transmit-pattern = Zendpatroon: { $pattern }

js-ssv-unit-signals = signalen

js-ssv-unknown-mode = dit gnss-ssv-resultaat heeft de modus "{ $mode }", die deze pagina niet leest

js-ssv-variant-met = { $n } van { $total }, zou gehaald zijn

js-ssv-variant-not-met = { $n } van { $total }, nog steeds niet gehaald

js-ssv-view-note = Kleinste tot grootste aantal in zicht over de epochen, met het gemiddelde gemarkeerd.

js-ssv-view-title = Signalen in zicht, { $band }

js-ssv-weak-note = Wat het ontvangerontwerp nodig heeft, zoals de engine het berekent uit de opgegeven integratie.

js-ssv-weak-title = De ontvanger voor zwakke signalen

js-ssv-x-minutes = minuten

js-ssv-y-altitude-measurements = hoogte, duizend km; gebruikte metingen

js-ssv-y-cn0-altitude = dB-Hz; hoogte in duizend km

js-ssv-y-position-log = positie, meter (log)

js-ssv-y-signals-all = signalen in zicht, alle constellaties

js-t35data-ai-q-bench-export = De beweging en gebeurtenissen van een scenario exporteren voor een laboratoriumsimulator

js-t35data-ai-q-compliance-rows = Voor welke rijen van openbare kaders leveren deze runs bewijs?

js-t35data-ai-q-evidence-pack = Een bewijspakket van een vertrouwensgebeurtenis controleren of maken

js-t35data-ai-q-interference-route = Waar zag GNSS er verslechterd uit, en hoeveel van deze route valt daarin?

js-t35data-ai-q-iq-recordings = GNSS-IQ-opnamen (scène, acquisitie, volging, front-end, campagnes)

js-t35data-ai-q-osnma-satellites = De navigatiegegevens van welke Galileo-satellieten authenticeert deze ontvangerstroom (OSNMA)?

js-t35data-ai-q-run-scenario = Een PNT-scenario uitvoeren of uitleggen (banen, GNSS, tijdsynchronisatie, fusie, maan)

js-t35data-ai-q-training-nmea = Ik heb synthetische NMEA nodig met een jamming-, drag-off-, tijdspoof- of replay-gebeurtenis voor training

js-t35data-ai-q-trustworthy-log = Was dit ontvangerlog, of de NMEA van dit vaartuig, betrouwbaar, en wanneer hield het op dat te zijn?

js-t35data-ai-tool-osnma-satellites = geen via MCP: gebruik osnma_verify (de OSNMA-kaart hier, WebAssembly), kshana osnma verify (CLI) of kshana.osnma_verify (Python)

js-t35data-card-evidence-create-title = Een bewijspakket maken

js-t35data-card-evidence-create-what = Ondertekent een venster van een ontvangerlog en wat de engine daaruit berekende, zodat iedereen kan controleren dat er achteraf niets is gewijzigd. De Studio verifieert pakketten.

js-t35data-card-evidence-create-why = Ondertekenen vereist een privésleutel, die niet via een webpagina hoort te lopen.

js-t35data-card-iq-title = GNSS-IQ-monitors en -hulpmiddelen

js-t35data-card-iq-what = Bouw een scène, acquireer en volg signalen, doorloop parameters, modelleer een front-end, voer IQ-monitors en campagnes uit, fit een laboratoriumlog. Ook beschikbaar vanuit Python en, binnen één werkmap, vanuit de hulpmiddelen van de AI-assistent.

js-t35data-card-iq-why = Een opname bestaat uit gigabytes aan samples. Een pagina kan die niet bevatten, en de opdrachten die converteren, extraheren en decimeren herschrijven opnamen op schijf.

js-t35data-card-land-title = Download van landpolygonen voor de AIS-detector voor op land

js-t35data-card-land-what = Haalt één vastgepind landbestand op (Natural Earth, publiek domein) en controleert de SHA-256 ervan. De kaartbouwer neemt het landbestand in plaats daarvan als tekst.

js-t35data-card-land-why = Het is de enige opdracht die een netwerkverbinding opent, en ze heeft de curl van het systeem en een expliciete vlag nodig.

js-t35data-card-marine-title = Maritieme integraties

js-t35data-card-marine-what = Een Signal K-serverplugin en OpenCPN via NMEA in gate-modus over TCP brengen de vertrouwensscore naar software die schippers al gebruiken; een referentiebuild brengt hem naar een kleine computer naast de ontvanger.

js-t35data-card-marine-why = Ze zijn afnemers van het draaiende live proces en van de TCP-gate ervan: installaties op de computer van de boot.

js-t35data-card-telemetry-title = Vertrouwen als beveiligingstelemetrie

js-t35data-card-telemetry-what = Zet de vertrouwensstroom (score, band, redenen) om in Prometheus-metrics, syslog-gebeurtenissen in CEF of LEEF voor een SIEM, en OpenTelemetry. Het leest de stroom en wijzigt de beoordeling nooit.

js-t35data-card-telemetry-why = Het is een proces dat metrics aanbiedt en naar uw monitoringsystemen verzendt, dus het draait naast de ontvanger, niet in een pagina.

js-t35data-card-training-stream-title = Trainingsstromen naar een TCP- of UDP-adres

js-t35data-card-training-stream-what = Verzendt een gegenereerde trainingsstroom in realtime of sneller naar een brugsimulator of een kaartplotter. De trainingspagina van de Studio genereert dezelfde tekst en laat u die downloaden.

js-t35data-card-training-stream-why = Verzenden naar een netwerkadres doet een browserpagina niet. De stroom is alleen tekst en nooit bedoeld voor de live navigatiesystemen van een vaartuig.

js-t35data-feat-ai-ai = Installatieopties voor de MCP-server, met de vragen die elk hulpmiddel beantwoordt

js-t35data-feat-ai-name = Gebruiken vanuit een AI-assistent (MCP-server)

js-t35data-feat-bench-bench = Exporteer hier de beweging, NMEA, waypoints en gebeurtenissen van een scenario

js-t35data-feat-bench-name = Test-bench-export voor een laboratoriumsimulator

js-t35data-feat-compliance-compliance = Zie hier voor welke rijen van een kader uw runs bewijs leveren, en de mappingtabellen

js-t35data-feat-compliance-name = Compliance-mapping naar openbare veerkrachtkaders

js-t35data-feat-evidence-evidence = Verifieer hier een pakket en voeg een tijdstempeltoken toe

js-t35data-feat-evidence-name = Ondertekende bewijspakketten

js-t35data-feat-evidence-why = Het maken van een pakket vereist een privé-ondertekeningssleutel, die niet via een webpagina hoort te lopen. Pakketten worden gemaakt met de opdrachtregel, Python of de hulpmiddelen van de AI-assistent.

js-t35data-feat-interference-map-interference = Open kaartbestanden, of bouw hier een kaart uit CSV, en controleer er een route tegen

js-t35data-feat-interference-map-name = Interferentiekaart (ADS-B en AIS) en blootstelling van een route

js-t35data-feat-iq-name = GNSS-IQ-monitors en -hulpmiddelen (scène, acquisitie, volging, doorloop, front-end, monitor, campagnes)

js-t35data-feat-iq-why = Een opname bestaat uit gigabytes aan samples, die een pagina niet kan bevatten, en sommige opdrachten herschrijven opnamen op schijf. De browserbuild heeft geen IQ-functies.

js-t35data-feat-jammertest-jammertest = Importeer het plan voor het tijdsbestek van een log, of score een ontvangerlog (UBX, RINEX, Android, NMEA of Septentrio SBF) per test: detectielatentie, gemist, valse alarmen, hersteltijd; MODELLED

js-t35data-feat-jammertest-name = Jammertest als scheidsrechter: het gepubliceerde testplan als geplande referentie, een ontvangerlog daartegen gescoord (0.38)

js-t35data-feat-live-gate-name = Live vertrouwensstroom, gate en listener (stdin, bestand, TCP, UDP, --gate, --listen)

js-t35data-feat-live-gate-why = Het is een draaiend proces in het datapad. Een pagina keert terug wanneer ze klaar is en kan geen socket open houden voor een kaartplotter, noch een positiebepaling ongeldig markeren in een live stroom. De Studio scoort in plaats daarvan een begrensd fragment, in hetzelfde liveformaat, zonder gate.

js-t35data-feat-machines-imufit = Fit de accelerometer- en gyroparameters van de hybride en fusiescenario's uit een stilstaand IMU-log; MODELLED

js-t35data-feat-machines-name = Ontvanger- en sensoringangen: RTKLIB .pos, NovAtel OEM7, RTCM 3 MSM, GNSS-SDR, een IMU voor de heading, en een IMU-fit voor de hybride en fusiescenario's (0.38)

js-t35data-feat-machines-trust = Open een log in een van deze formaten (en een optioneel IMU-bestand) in de generieke receiver-trust-run; de eigen jammervlag van NovAtel wordt vergeleken met de alarmen van Kshana

js-t35data-feat-marine-name = Maritieme integraties: Signal K-plugin en OpenCPN

js-t35data-feat-marine-why = Ze gebruiken het draaiende live proces en de TCP-gate ervan, dus het zijn installaties op een bootcomputer, niet iets wat een pagina kan uitvoeren.

js-t35data-feat-maritime-trust-name = Maritieme vertrouwensscore voor een varend vaartuig (0 tot 100, met redenen)

js-t35data-feat-maritime-trust-trust = Open een resultaat of een live JSON-lines-run en bekijk de track, score, redenen en gate; score hier een NMEA-log

js-t35data-feat-nmea-training-name = NMEA-trainingsstromen met een instructeurslog

js-t35data-feat-nmea-training-training = Genereer hier een stroom en het bijbehorende instructeurslog, download ze en voer de trainersdebriefing uit

js-t35data-feat-osnma-name = Galileo-OSNMA-verificatie (UBX SFRBX-invoer)

js-t35data-feat-osnma-osnma = Laad een opgenomen bestand en bekijk de authenticatiestatus per satelliet en per tag

js-t35data-feat-telemetry-name = Telemetrie-export: Prometheus-metrics, syslog CEF en LEEF, OpenTelemetry

js-t35data-feat-telemetry-why = Het biedt metrics aan, verzendt syslog en exporteert OpenTelemetry vanuit een draaiende stroom: een proces dat met uw monitoringsystemen praat, wat een pagina niet kan zijn.

js-t35data-feat-training-stream-name = Een trainingsstroom streamen naar een TCP- of UDP-adres

js-t35data-feat-training-stream-why = Het verzendt naar een netwerkadres, wat een webpagina niet doet. De Studio genereert de tekst en u downloadt die.

js-t35data-page-ai = Gebruiken vanuit uw AI-assistent

js-t35data-page-bench = Test-bench-export

js-t35data-page-cli = Opdrachtregelfuncties

js-t35data-page-compliance = Compliance-mapping

js-t35data-page-evidence = Bewijspakketten

js-t35data-page-geometry = Geometrie: skyplot, skyline en DOP

js-t35data-page-imufit = IMU-fit

js-t35data-page-interference = Interferentiekaart

js-t35data-page-jammertest = Jammertest-scoring

js-t35data-page-osnma = OSNMA-verificatie

js-t35data-page-training = Trainingsdebriefing

js-t35data-page-trust = Maritiem vertrouwen

js-t35data-sample-iq-help = De lijst met IQ-opdrachten

js-t35data-sample-telemetry-cef = Syslog in CEF voor de demorun

js-t35data-sample-telemetry-leef = Syslog in LEEF voor de demorun

js-t35data-sample-telemetry-metrics = Prometheus-metrics voor de demorun

js-tools-ai-group-engine = De engine en zijn bibliotheken installeren

js-tools-ai-group-integrations = Maritieme, plugin- en dashboardintegraties

js-tools-ai-group-mcp = De MCP-server voor uw assistent installeren

js-tools-ai-heading = Kshana gebruiken vanuit uw AI-assistent

js-tools-ai-install-mcp = De MCP-server installeren

js-tools-ai-intro = Met de Kshana MCP-server laat een AI-assistent de engine draaien in plaats van getallen te raden. Hij draait op uw computer; er wordt niets naar Kshana verzonden. Kies de manier die bij uw hulpmiddel past.

js-tools-ai-load-failed = De installatieopties zijn niet geladen ({ $reason }). Zie de documentatie van de MCP-server.

js-tools-ai-mcp-docs = Documentatie van de MCP-server

js-tools-ai-more-ways = Meer manieren om te installeren

js-tools-ai-none-listed = In deze build zijn geen installatieopties vermeld.

js-tools-ai-other-ways = Andere manieren om Kshana te installeren

js-tools-ai-read-agent-guide = De agentgids lezen

js-tools-ai-rule = De regel voor elk antwoord: de assistent draait de engine en meldt wat een hulpmiddel teruggaf, met eenheid en bewijsniveau (gevalideerd tegen een onafhankelijke externe referentie, of gemodelleerd), het scenario, de seed en de engineversie, zodat de run kan worden herhaald. De eigen kanttekeningen van een resultaat blijven erbij. De MCP-server leest en schrijft geen bestanden buiten één opt-in-map.

js-tools-ai-what-to-ask = Wat te vragen, en welk hulpmiddel antwoordt

js-tools-ai-where-reachable = Waar elke mogelijkheid bereikbaar is

js-tools-bench-files-written =
    { $n ->
        [one] { $n } bestand naar het geheugen van uw browser geschreven
       *[other] { $n } bestanden naar het geheugen van uw browser geschreven
    }

js-tools-bench-note = Alleen beweging en gelabelde gebeurtenisintervallen. Download ze om ze in een laboratoriumsimulator te laden.

js-tools-bench-wrong-kind = { $name } is een { $kind }-scenario. Een voertuigtraject bestaat voor de soorten { $kinds }; andere soorten geven aan waarom ze er geen hebben.

js-tools-building-report = Het rapport wordt opgebouwd…

js-tools-choose-catalogue-first = Kies eerst de catalogus-JSON.

js-tools-choose-file-first = Kies eerst een bestand.

js-tools-choose-imu-log = Kies eerst een stilstaand IMU-log.

js-tools-choose-pack-first = Kies eerst de bestanden van het pakket.

js-tools-choose-pack-first-above = Kies eerst de bestanden van het pakket (hierboven).

js-tools-choose-plan-file = Kies minstens één planbestand.

js-tools-choose-receiver-log = Kies eerst het ontvangerlog.

js-tools-choose-result-first = Kies eerst minstens één resultaatbestand (*.result.json).

js-tools-choose-scenario-first = Kies eerst een scenario.

js-tools-choose-tsr-first = Kies eerst het tijdstempelantwoord (.tsr).

js-tools-chosen = Gekozen

js-tools-col-check = Controle

js-tools-col-detail = Detail

js-tools-col-first-monitors = Eerste monitors

js-tools-col-gap-that-stays = Resterende kloof

js-tools-col-last-auth-tag = Laatste geauthenticeerde tag (Galileo System Time)

js-tools-col-latency = Latentie, s

js-tools-col-name = Naam

js-tools-col-outcome = Uitkomst

js-tools-col-question = Vraag

js-tools-col-recovered = Hersteld

js-tools-col-reference = Referentie

js-tools-col-result = Resultaat

js-tools-col-row = Rij

js-tools-col-satellite = Satelliet

js-tools-col-slot = Slot, s

js-tools-col-status = Status

js-tools-col-tags = Tags

js-tools-col-test = Test

js-tools-col-these-runs = Deze runs

js-tools-col-tool = Hulpmiddel

js-tools-col-what-is-missing = Wat ontbreekt

js-tools-col-what-it-asks = Wat het vraagt

js-tools-col-why-not-auth = Waarom niet geauthenticeerd

js-tools-copied = Gekopieerd

js-tools-copy = Kopiëren

js-tools-copy-command-aria = Kopiëren: { $cmd }

js-tools-copy-labelled-aria = { $label } kopiëren: { $text }

js-tools-did-not-work = Dat is niet gelukt

js-tools-documentation = Documentatie

js-tools-download = Downloaden

js-tools-download-all-zip = Alles downloaden (zip)

js-tools-download-events-toml = De gebeurtenissen downloaden (TOML)

js-tools-download-md = Downloaden (Markdown)

js-tools-download-report-json = Het rapport downloaden (JSON)

js-tools-download-report-md = Het rapport downloaden (Markdown)

js-tools-download-scorecard-json = De scorekaart downloaden (JSON)

js-tools-download-table-toml = De tabel downloaden (TOML)

js-tools-download-updated-pack = Het bijgewerkte pakket downloaden (zip)

js-tools-download-whole-report-json = Het hele rapport downloaden (JSON)

js-tools-engine-lacks-error = Deze enginebuild (versie { $version }) heeft geen { $need }, dus hij kan dit hier nog niet uitvoeren. De vastgelegde resultaten en de opdrachtregel werken nog.

js-tools-engine-lacks-status = Deze enginebuild (versie { $version }) heeft geen { $need }: hij is ouder dan de versie die dit hulpmiddel nodig heeft. Het equivalent op de opdrachtregel staat op het tabblad Opdrachtregel.

js-tools-engine-running = De engine (versie { $version }) draait in deze browser. Er wordt niets geüpload.

js-tools-engine-starting = De engine wordt in deze browser gestart…

js-tools-engine-unavailable = De engine kon hier niet starten ({ $reason }). Bestanden openen werkt; voor het uitvoeren van de hulpmiddelen is WebAssembly nodig.

js-tools-epoch-format = Gebruik JJJJ-MM-DDTUU:MM:SS, met een optionele Z (UTC).

js-tools-epoch-not-real = Dat is geen echt UTC-tijdstip tussen de jaren 2000 en 2099.

js-tools-every-check = Elke controle

js-tools-evidence-disclaimer = Een bewijspakket is een technisch record van wat de engine uit een opgegeven log onder opgegeven instellingen berekende. Het is geen juridisch oordeel, geen vaststelling van feiten over enige gebeurtenis en geen certificering. Een geslaagde controle zegt dat het record ongewijzigd is.

js-tools-example-pack = Synthetisch voorbeeldpakket

js-tools-example-pack-note = Een synthetisch pakket, gemaakt met de opdrachtregel van de engine uit het demo-veerbootlog met een demonstratiesleutel. De sleutel is hieronder ingevuld; de sleutel van een echte ondertekenaar komt via een andere weg van de ondertekenaar.

js-tools-example-pack-tampered = Voorbeeldpakket waarin één byte van epochs.json is gewijzigd

js-tools-example-runs = Synthetische voorbeeldruns

js-tools-example-tampered-note = Eén byte van een bestand in het pakket is na het ondertekenen gewijzigd. Verifieer het: de controle noemt het bestand.

js-tools-exporting = Exporteren…

js-tools-field-whole-number = { $field } moet een geheel getal zijn

js-tools-file-not-chosen = { $file } is niet een van de gekozen bestanden

js-tools-file-too-large = { $name } is groter dan 64 MiB

js-tools-files-selected = { $label }: { $files }

js-tools-fingerprint-not-pinned = Vingerafdruk van de ondertekenaar: { $fingerprint } (niet vastgepind: de sleutel die het pakket zelf noemt)

js-tools-fingerprint-pinned = Vingerafdruk van de ondertekenaar: { $fingerprint } (vastgepind)

js-tools-fitting = Fitten…

js-tools-framework-summary = { $name }: { $evidenced } onderbouwd, { $partly } gedeeltelijk, { $notEvidenced } niet onderbouwd, { $outOfScope } buiten de reikwijdte

js-tools-fw-dhs-rpcf = US DHS Resilient PNT Conformance Framework, v2.0

js-tools-fw-easa-aviation = EASA-richtsnoeren voor GNSS-interferentie in de luchtvaart

js-tools-fw-en-16803 = EN 16803 (alleen per deel en clausulenummer)

js-tools-fw-imo-ships = IMO-richtsnoeren voor GNSS-interferentie voor schepen

js-tools-fw-nis2-art21 = NIS2-richtlijn van de EU, artikel 21

js-tools-gst-none = geen

js-tools-gst-text = week { $week }, { $tow } s

js-tools-how-to-run = Hoe het uit te voeren

js-tools-imu-file-too-large = { $name } is groter dan 32 MiB; open een fragment.

js-tools-imu-mean-not-number = De specifieke kracht in rust is geen getal (0 voor een horizontale as, ongeveer 9.80665 voor de verticale).

js-tools-imu-notice = { $evidence }: de schatter is gecontroleerd op synthetische witteruislogs met bekende coëfficiënten, niet tegen een externe onafhankelijke referentie. De tabel noemt de SHA-256 van het log ({ $sha }…).

js-tools-imu-selected = { $name } ({ $size }), hier gelezen, nooit geüpload.

js-tools-jt-events-count = { $n } geplande gebeurtenis(sen)

js-tools-jt-events-note = als geplande referentie: geplande slots, geen opgenomen uitzendtijden. Niet-RF: { $nonRf }; buiten het log: { $outside }; onbekende id's: { $unknown }.

js-tools-jt-guard-hold = Bewaking { $guard } s, herstelhouding { $hold } s.

js-tools-jt-guard-hold-overlap = Bewaking { $guard } s, herstelhouding { $hold } s. De kalibratiebasislijn overlapte een gepland slot.

js-tools-jt-import-needs-start = Importeren heeft de eerste epoche van het log in UTC nodig (ISO 8601), omdat het plan in lokale tijd staat.

js-tools-jt-sel-catalogue = catalogus { $name }

js-tools-jt-sel-log = log { $name } ({ $size })

js-tools-jt-sel-no-catalogue = geen catalogus

js-tools-jt-sel-no-log = geen log

js-tools-jt-sel-no-plan = geen plan

js-tools-jt-sel-plans = { $n } planbestand(en)

js-tools-jt-slot-range = { $from } tot { $to }

js-tools-jt-what-area = Het testgebied

js-tools-jt-what-guard = De bewaking

js-tools-jt-what-hold = De herstelhouding

js-tools-jt-what-offset = De afwijking ten opzichte van UTC

js-tools-jt-what-year = Het planjaar

js-tools-label-command = opdracht

js-tools-label-pinned-command = vastgepinde opdracht

js-tools-label-settings-example = instellingenvoorbeeld { $n }

js-tools-loading = Laden…

js-tools-max-runs = Hooguit { $max } runs.

js-tools-merkle-root-format = De Merkle-wortel bestaat uit 64 hexadecimale cijfers.

js-tools-must-be-number = { $what } moet een getal zijn

js-tools-must-be-whole-zero = { $what } moet een geheel getal zijn, 0 voor "niet opgegeven"

js-tools-na = n.v.t.

js-tools-needs = Vereist: { $requires }

js-tools-no = nee

js-tools-none = geen

js-tools-none-in-build = geen in deze build

js-tools-not-in-browser = Niet in een browser.

js-tools-not-osnma = Geen OSNMA-resultaat

js-tools-not-used = Niet gebruikt: { $item }

js-tools-notes = Notities

js-tools-open = Openen

js-tools-osnma-advisory = Adviserend: dit is analyse- en monitoringuitvoer en geen typegoedgekeurde navigatieapparatuur. De hier gemelde authenticatiestatus is geen navigatie-integriteitsdienst en mag niet de enige basis zijn voor enige navigatie- of veiligheidsbeslissing.

js-tools-osnma-authenticated = Geauthenticeerd

js-tools-osnma-caption = Authenticatiestatus per satelliet

js-tools-osnma-demo-note = De publieke wegwerpsleutel is ingevuld; druk op Verifiëren om de verifier hier uit te voeren, of toon het vastgelegde resultaat.

js-tools-osnma-discarded = Verworpen

js-tools-osnma-events = Wat de verifier zag

js-tools-osnma-examples-missing = de synthetische voorbeelden zitten nog niet in deze build

js-tools-osnma-failed = Mislukt

js-tools-osnma-nma-alert = NMA-status { $status }; het systeem gaf een alarmbericht af.

js-tools-osnma-nma-status = NMA-status { $status }.

js-tools-osnma-not-json = Dit is niet de JSON van kshana osnma verify --json (die heeft overall en satellites nodig).

js-tools-osnma-overall = Totaal: { $status }

js-tools-osnma-pages-read =
    { $n ->
        [one] { $n } pagina gelezen.
       *[other] { $n } pagina's gelezen.
    }

js-tools-osnma-pending = In afwachting

js-tools-osnma-recorded-failed = het vastgelegde resultaat is niet geladen

js-tools-osnma-recorded-result = Vastgelegd resultaat van kshana osnma verify --json voor { $file }.

js-tools-osnma-tag-counts = { $authenticated } geauthenticeerd, { $failed } mislukt, { $pending } in afwachting, { $discarded } verworpen

js-tools-osnma-tag-totals =
    { $n ->
        [one] { $n } tag: { $authenticated } geauthenticeerd, { $failed } mislukt, { $pending } in afwachting, { $discarded } verworpen.
       *[other] { $n } tags: { $authenticated } geauthenticeerd, { $failed } mislukt, { $pending } in afwachting, { $discarded } verworpen.
    }

js-tools-osnma-time-caveat = Tijd: elke controle is relatief ten opzichte van de tijdstempels van de pagina's die aan de verifier zijn gegeven, die hier uit de gegevens zelf komen en geen bescherming bieden tegen herhaalde oude gegevens. Authenticatie zegt dat de gegevens van het systeem kwamen; ze zegt niets over het signaal waarop ze aankwamen of over de kwaliteit van de positiebepaling.

js-tools-osnma-unavailable = Niet beschikbaar

js-tools-osnma-word-authenticated = Minstens één satelliet is geauthenticeerd en geen enkele is mislukt

js-tools-osnma-word-failed = Een controle op de gegevens van een satelliet is mislukt

js-tools-osnma-word-unavailable = Geen enkele satelliet is geauthenticeerd

js-tools-pack-selected = { $label }: { $files } ({ $size })

js-tools-pinned-to-release = Vastgepind op deze release:

js-tools-preview = Voorbeeld

js-tools-public-key-format = Een publieke sleutel bestaat uit 64 hexadecimale cijfers (32 bytes). Niets anders wordt geaccepteerd.

js-tools-read-documentation = De documentatie lezen

js-tools-reading-plan = Het plan wordt gelezen…

js-tools-refused-file-name = geweigerde bestandsnaam: { $name }

js-tools-run = Uitvoeren

js-tools-runs-read =
    { $n ->
        [one] { $n } run gelezen: { $runs }
       *[other] { $n } runs gelezen: { $runs }
    }

js-tools-runs-read-engine =
    { $n ->
        [one] { $n } run gelezen, door engine { $engine }: { $runs }
       *[other] { $n } runs gelezen, door engine { $engine }: { $runs }
    }

js-tools-sample-load-failed = Het voorbeeld is niet geladen ({ $reason }).

js-tools-sample-note = Een echte uitvoer van de opdracht, vastgelegd uit de engine op de synthetische demorun. Geen meting van wat dan ook.

js-tools-sample-output = Voorbeelduitvoer: { $label }

js-tools-scenario-list-failed = De scenariolijst is niet geladen

js-tools-scoring = Scoren…

js-tools-select-and-copy = Selecteren en kopiëren

js-tools-settings-example = Instellingenvoorbeeld { $n }:

js-tools-status-evidenced-label = Runs leveren bewijs voor deze rij

js-tools-status-evidenced-short = Onderbouwd

js-tools-status-not-evidenced-label = Deze runs tonen niets voor deze rij

js-tools-status-not-evidenced-short = Niet onderbouwd

js-tools-status-out-of-scope-label = Buiten wat Kshana kan tonen

js-tools-status-out-of-scope-short = Buiten de reikwijdte

js-tools-status-partly-label = Runs leveren bewijs voor een deel van deze rij

js-tools-status-partly-short = Gedeeltelijk

js-tools-tab-ai = AI-assistent

js-tools-tab-bench = Test bench

js-tools-tab-cli = Opdrachtregel

js-tools-tab-compliance = Compliance

js-tools-tab-evidence = Bewijspakketten

js-tools-tab-imufit = IMU-fit

js-tools-tab-jammertest = Jammertest

js-tools-tab-osnma = OSNMA

js-tools-tele-all-events = Eén syslog-gebeurtenis per epoche (standaard: één per bandwisseling)

js-tools-tele-file-aria = Resultaat- of JSON-lines-bestand

js-tools-tele-fmt-cef = Syslog, CEF

js-tools-tele-fmt-leef = Syslog, LEEF

js-tools-tele-fmt-mqtt = MQTT, Home Assistant-discovery (topic, tab, payload)

js-tools-tele-fmt-otlp = OpenTelemetry (OTLP JSON)

js-tools-tele-fmt-prometheus = Prometheus-metrics

js-tools-tele-format-aria = Formaat

js-tools-tele-host = Host

js-tools-tele-host-aria = Hostnaam die in syslog-gebeurtenissen wordt geschreven

js-tools-tele-include-position = De gemelde positie opnemen (standaard uit)

js-tools-tele-intro = Zet in deze browser een resultaatbestand (session.result.json) of de live JSON-lines om in een van de formaten. Vereist een enginebuild met de telemetrie-export (0.35 en later met de export); de opdrachten hierboven werken overal.

js-tools-tele-note = Syslog-regels dragen hier geen tijdstempel (de pagina leest geen klok); het opdrachtregelprogramma stempelt ze. Prometheus geeft de eindtoestand. MQTT geeft één regel per bericht, het topic, dan een tab, dan de payload; vanaf hier wordt niets gepubliceerd. De tekst is dezelfde die de opdracht afdrukt.

js-tools-tele-run-here = Hier uitvoeren

js-tools-that-file-too-large = Dat bestand is groter dan 64 MiB.

js-tools-token-attached = Token toegevoegd

js-tools-token-attached-note = Het bijgewerkte pakket staat hieronder. De handtekening van de tijdstempelautoriteit is hier NIET gecontroleerd: voer openssl ts -verify uit.

js-tools-trust-monitor-sentence = Zin van de vertrouwensmonitor: { $sentence }

js-tools-two-files-same-name = twee bestanden heten { $name }

js-tools-ubx-bad-crc = { $n } pagina's faalden hun CRC.

js-tools-ubx-file = Het UBX-bestand

js-tools-ubx-frames-pages = { $frames } UBX-frames; { $pages } I/NAV-pagina's gedecodeerd.

js-tools-ubx-ignored-sfrbx = { $n } SFRBX-berichten zijn genegeerd (andere systemen, E5b, alarmen, foute controlesommen).

js-tools-ubx-skipped-bytes = { $n } bytes zijn tussen frames overgeslagen.

js-tools-ubx-time-conflicts = { $n } pagina's hadden een tijd die botste met die van hun buren.

js-tools-ubx-unstamped = { $n } pagina's konden niet in de tijd worden geplaatst.

js-tools-unknown = onbekend

js-tools-unused-scenarios = Scenariobestanden zonder bijbehorend resultaat zijn niet gebruikt: { $files }.

js-tools-verdict-failed-text = Verificatie mislukt.

js-tools-verdict-failed-title = Mislukt

js-tools-verdict-intact-text = Het pakket is intact ten opzichte van de sleutel die het zelf noemt, en die kan iedereen genereren. Haal de publieke sleutel van de ondertekenaar langs een andere weg bij de ondertekenaar op en pin hem vast.

js-tools-verdict-intact-title = Intact, maar de ondertekenaar is niet vastgepind

js-tools-verdict-verified-text = Het pakket is ongewijzigd en ondertekend met de sleutel die u hebt vastgepind.

js-tools-verdict-verified-title = Geverifieerd

js-tools-verifying = Verifiëren…

js-tools-what-failed = Wat is mislukt

js-tools-why-not-browser = Waarom niet in een browser:

js-tools-yes = ja

js-training-active-events = Actieve gebeurtenissen

js-training-band-large = boven 100 m

js-training-band-medium = 25 tot 100 m

js-training-band-small = onder 25 m

js-training-chart-max = max { $v }

js-training-chart-mean-cn0 = gemiddelde C/N0

js-training-chart-position-error = positiefout

js-training-chart-s-reported-minus-true = s, gemeld min werkelijk

js-training-chart-satellites = satellieten

js-training-chart-time-offset = tijdoffset

js-training-chart-used-tracked = gebruikt / gevolgd

js-training-col-reported = Gemeld door de ontvanger

js-training-col-true = Werkelijk

js-training-cue-course = De gyro-heading en de logsnelheid worden door geen enkele gebeurtenis aangetast. Hier verschilt de gemelde koers { $course } van de gyro-heading. Een stroming scheidt ook heading van koers, dus vergelijk met het begin van de run.

js-training-cue-course-speed = De gyro-heading en de logsnelheid worden door geen enkele gebeurtenis aangetast. Hier verschilt de gemelde koers { $course } van de gyro-heading en de gemelde snelheid { $speed } kn van de werkelijke snelheid. Een stroming scheidt ook heading van koers, dus vergelijk met het begin van de run.

js-training-cue-title = Debriefaanwijzing.

js-training-cue-unknown-amount = een onbekende hoeveelheid

js-training-debrief-now = Nu debriefen

js-training-default-warning = Synthetische trainingsgegevens. Alleen voor training en testen: voer deze stroom nooit aan de live navigatiesystemen van een vaartuig.

js-training-demo-coastal-drag-off = Drag-off bij de kust

js-training-demo-combined-event = Gecombineerde gebeurtenis

js-training-demo-fjord-degradation = Natuurlijke verslechtering in een fjord

js-training-demo-open-sea-jamming = Jamming op open zee

js-training-demo-port-time-spoof = Tijdspoofing bij havenanadering

js-training-dl-log-json = Het instructeurslog downloaden (JSON)

js-training-dl-log-text = Het instructeurslog downloaden (tekst)

js-training-dl-nmea = De NMEA-stroom downloaden

js-training-err-demo-open = { $title } kon niet worden geopend: { $reason }.

js-training-err-engine-old = Deze enginebuild (versie { $version }) heeft geen NMEA-traininggenerator; hij is ouder dan deze pagina. De opdracht is { $command }.

js-training-err-engine-start = De engine kon hier niet starten ({ $reason }). De bibliotheekscenario's hierboven openen nog steeds zonder.

js-training-err-file-not-loaded = het bestand is niet geladen

js-training-err-generate = Kon niet genereren: { $reason }.

js-training-err-newer-schema = { $name }: schema { $schema } is nieuwer dan of anders dan { $supported }, dat deze pagina leest. Werk de Studio bij in plaats van de velden ervan te raden.

js-training-err-no-schema = { $name }: geen Kshana-trainingsinstructeurslog (geen schematag).

js-training-err-no-track = { $name }: het log heeft geen trackrijen om te tekenen.

js-training-err-no-usable-rows = { $name }: geen bruikbare trackrijen.

js-training-err-not-json = { $name }: geen JSON ({ $reason }).

js-training-err-read = { $name }: kon niet worden gelezen ({ $reason }).

js-training-err-read-or-draw = { $name }: kon niet worden gelezen of getekend ({ $reason }).

js-training-err-scenario-not-loaded = het scenariobestand is niet geladen

js-training-err-seed = De seed moet een geheel getal zijn, of leeg om die van het scenario zelf te gebruiken.

js-training-err-too-large = { $name }: groter dan { $max }. Deze pagina leest logs tot die grootte.

js-training-err-too-many-rows = { $name }: het log heeft { $count } trackrijen; deze pagina tekent er hooguit { $max }. Log minder vaak (log_interval_s) of open een fragment.

js-training-err-unknown-schema = { $name }: onbekend schema { $schema }; deze pagina leest { $supported }.

js-training-event-n = Gebeurtenis { $id }

js-training-event-onset = Begin { $utc }

js-training-extra-bearing = Peiling zoals toegepast, graden t.o.v. ware noorden

js-training-extra-peak-accel = Piekversnelling die de drag toevoegt, m/s²

js-training-extra-peak-speed = Pieksnelheid die de drag toevoegt, m/s

js-training-fact-duration = Duur

js-training-fact-events = Geïnjecteerde gebeurtenissen

js-training-fact-max-error = Grootste positiefout

js-training-fact-max-time-offset = Grootste tijdoffset

js-training-fact-no-fix = Tijd zonder positiebepaling

js-training-fact-peak-accel = Piekversnelling, werkelijk / gemeld

js-training-fact-peak-speed = Pieksnelheid, werkelijk / gemeld

js-training-fact-seed = Seed

js-training-fact-start = Start (UTC)

js-training-fix-reported-span = positie gemeld, { $from } tot { $to }

js-training-generated = "{ $title }" gegenereerd met engine { $version }: { $lines } NMEA-zinnen. Synthetisch: alleen voor training en testen; voer het nooit aan de live navigatiesystemen van een vaartuig.

js-training-generated-here = Hier gegenereerd door de engine ("{ $title }"). Synthetisch: verzonnen posities en datums.

js-training-generating = De engine wordt gestart en er wordt gegenereerd…

js-training-kind-drag-off = Positie-drag-off

js-training-kind-jamming = Jamming

js-training-kind-natural-degradation = Natuurlijke verslechtering (afgeschermde hemel)

js-training-kind-replay-delay = Replayvertraging

js-training-kind-time-spoof = Tijdspoofing

js-training-legend-no-fix = Geen positiebepaling: de ontvanger meldde niets

js-training-legend-reported = Gemeld, { $band } van de werkelijke positie

js-training-legend-true = Ware track

js-training-library-label = Synthetisch bibliotheekscenario "{ $title }", geschreven door { $command }. Verzonnen posities en datums; geen echt vaartuig of echte opname.

js-training-log-row = Logrij { $row } van { $total }, { $utc }

js-training-max-error-at = { $m } m op T+{ $s } s

js-training-moment-event = (gebeurtenis { $id })

js-training-moment-title = T+{ $s } s { $what }: { $text }

js-training-moments-shown = Eerste { $shown } van { $total } momenten getoond.

js-training-no-events = Geen: dit is een schone run.

js-training-no-fix-nothing = geen positiebepaling: niets gemeld

js-training-no-fix-span = geen positiebepaling, { $from } tot { $to }

js-training-no-moments = Geen momenten vastgelegd.

js-training-none = geen

js-training-none-now = Geen op dit moment.

js-training-none-reported = geen gemeld

js-training-north = N

js-training-not-touched = door geen enkele gebeurtenis aangetast

js-training-opened = { $name } geopend: { $rows } logrijen over { $secs } s.

js-training-opening = { $title } wordt geopend…

js-training-param-affect-time = Beïnvloedt de tijd

js-training-param-bearing-deg = Peiling, graden t.o.v. ware noorden

js-training-param-cn0-drop-db = C/N0-daling, dB

js-training-param-counterfeit-cn0-dbhz = Nagemaakte C/N0, dB-Hz

js-training-param-delay-s = Vertraging, s

js-training-param-duration-s = Duur, s

js-training-param-final-offset-m = Eindoffset, m

js-training-param-kind = Soort

js-training-param-label = Label

js-training-param-offset-s = Tijdoffset, s

js-training-param-ramp-s = Opbouwhelling bij begin, s

js-training-param-recovery-s = Herstelhelling, s

js-training-param-relative-bearing-deg = Peiling ten opzichte van de koers, graden

js-training-param-skyline = Skyline

js-training-param-spread-db = Spreiding per satelliet, dB

js-training-param-start-s = Begin, s

js-training-pause = Pauzeren

js-training-play = Afspelen

js-training-reading = Lezen…

js-training-readout-fix = positiebepaling

js-training-readout-no-fix = geen positiebepaling

js-training-reduced-motion = Verminderde beweging heeft de voorkeur, dus de replay start op 1x. Gebruik de schuifregelaar of de pijltoetsen om zonder animatie te bewegen.

js-training-row-cn0 = Gemiddelde C/N0, dB-Hz

js-training-row-cog = Koers over de grond, graden

js-training-row-error = Positiefout, m

js-training-row-fix = positiebepaling

js-training-row-heading = Heading (gyro), graden

js-training-row-moments = momenten

js-training-row-position = Positie

js-training-row-sats = Gebruikte / gevolgde satellieten

js-training-row-sog = Snelheid over de grond, kn

js-training-row-time-offset = Tijdoffset, s

js-training-say-active = actief: { $list }

js-training-say-event-id = gebeurtenis { $id }

js-training-say-fix = ontvanger meldt een positiebepaling

js-training-say-mean-cn0 = gemiddelde C/N0 { $cn0 } dB-Hz

js-training-say-no-fix = geen positiebepaling

js-training-say-position-from-true = gemelde positie { $m } m van de werkelijke

js-training-say-sats-used = { $used } van { $tracked } satellieten gebruikt

js-training-say-time-ahead = gemelde tijd { $s } s voor op de werkelijke

js-training-say-time-behind = gemelde tijd { $s } s achter op de werkelijke

js-training-sky-no-gsv = geen GSV

js-training-sky-none = Geen hemel voor dit log: een instructeurslog alleen heeft geen satellieten. Open een bibliotheekscenario, of genereer hier een stroom en debrief die, om de satellieten uit de GSV ervan te zien.

js-training-skyline-preset = voorinstelling { $name }

js-training-skyline-stated = opgegeven profiel

js-training-span-no-fix = T+{ $from } tot { $to } s

js-training-track-desc = Ware track en gemelde track, noord boven. Grootste positiefout { $error }. { $periods } periode(n) zonder positiebepaling.

js-training-track-end = einde

js-training-track-start = start

js-training-trainer-note = Notitie van de trainer

js-training-warn-no-warning-text = Dit bestand bevat geen waarschuwingstekst. Het is een traininglog: voer de stroom ervan niet aan live navigatie.

js-training-warn-rows-skipped = { $count } trackrij(en) waren niet geldig en zijn overgeslagen.

js-training-what-fix-lost = Positiebepaling verloren

js-training-what-fix-regained = Positiebepaling hersteld

js-training-what-full-effect = Volledig effect

js-training-what-onset = Begin

js-training-what-recovered = Hersteld

js-training-what-recovery-begins = Herstel begint

js-trust-adv-carried = Adviserende verklaring in dit bestand:

js-trust-adv-none = Dit bestand bevat geen adviserende verklaring

js-trust-adv-none-rest = (oudere uitvoer doet dat niet). De adviserende verklaring bovenaan deze pagina geldt toch voor alles.

js-trust-agree-both = beide melden: de eigen vlag van de ontvanger en een Kshana-monitor

js-trust-agree-calibrating = binnen het kalibratievenster: niet vergeleken

js-trust-agree-kshana-only = alleen Kshana slaat alarm: de ontvanger meldt niets

js-trust-agree-neither = geen van beide meldt

js-trust-agree-receiver-only = alleen de ontvanger meldt: geen enkele Kshana-monitor slaat alarm

js-trust-assessed = { $name } beoordeeld met engine { $version }, in deze browser.

js-trust-assessed-as = { $name } beoordeeld als { $format }, met de engine, in deze browser. Er is niets geüpload.

js-trust-assessing = De engine wordt gestart en er wordt beoordeeld…

js-trust-class-also-costing = { $class } (kost ook punten)

js-trust-class-environment = omgeving: het signaal (vermogen, jamming, satellieten verloren terwijl de hemel open is)

js-trust-class-geometry = geometrie: de hemel, niet het signaal

js-trust-class-inconsistency = inconsistentie: aanvalsachtig, niet verklaard door de hemel of het signaal

js-trust-dl-result-json = Het resultaat downloaden (JSON)

js-trust-dl-table-csv = De tabel per epoche downloaden (CSV)

js-trust-edge-degraded = { $v } verslechterd

js-trust-edge-nominal = { $v } nominaal

js-trust-err-assess = { $name }: kon niet worden beoordeeld ({ $reason }).

js-trust-err-demo-files = de demobestanden zijn niet geladen

js-trust-err-demo-log-open = Het demolog kon niet worden geopend: { $reason }.

js-trust-err-demo-open = De demo kon niet worden geopend: { $reason }.

js-trust-err-engine-no-receiver-trust = Deze enginebuild (versie { $version }) heeft geen receiver_trust.

js-trust-err-engine-no-scorer = Deze enginebuild (versie { $version }) heeft geen logscorer; hij is ouder dan deze pagina. De opdracht is { $command }.

js-trust-err-engine-start = De engine kon hier niet starten ({ $reason }).

js-trust-err-engine-start-open = De engine kon hier niet starten ({ $reason }). Resultaatbestanden hierboven openen werkt nog.

js-trust-err-example-files = de voorbeeldbestanden zijn niet geladen

js-trust-err-example-open = Het voorbeeld kon niet worden geopend: { $reason }.

js-trust-err-file-2mib = { $name }: groter dan 2 MiB. Open een fragment.

js-trust-err-file-too-large = { $name }: groter dan { $max }. Deze pagina leest bestanden tot die grootte; open een fragment.

js-trust-err-gen-too-large = { $name }: groter dan 2 MiB. Open een fragment (het opdrachtregelprogramma neemt een heel log).

js-trust-err-imu-format = "{ $format }" is geen IMU-formaat dat deze pagina leest (csv of euroc)

js-trust-err-imu-heading = de heading van de IMU bij zijn eerste sample is geen getal

js-trust-err-log-format = "{ $format }" is geen logformaat dat deze pagina naar de engine kan sturen

js-trust-err-no-epochs = Het bestand heeft geen epochen.

js-trust-err-no-epochs-result = Dit resultaatbestand heeft geen epochs[]. Het moet afkomstig zijn van `{ $command }` voor een vaartuigsessie.

js-trust-err-no-epochs-returned = { $name }: de engine gaf geen epochen terug.

js-trust-err-no-score-model = Dit resultaat heeft geen score_model, dus het is een run met een stilstaand platform zonder vertrouwensscore. De weergave tekent runs van vaartuigen (bewegend platform).

js-trust-err-not-readable = { $name }: geen bestand dat deze weergave leest (een resultaat-JSON, JSON lines, trust.csv, een NMEA-log of een referentiebestand).

js-trust-err-nothing-to-draw = Niets om te tekenen: kies een resultaat-JSON, JSON lines of trust.csv.

js-trust-err-read = { $name }: kon niet worden gelezen ({ $reason }).

js-trust-err-read-or-draw = { $name }: kon niet worden gelezen of getekend ({ $reason }).

js-trust-err-score = { $name }: kon niet worden gescoord ({ $reason }).

js-trust-err-score-file-too-large = { $name }: groter dan 2 MiB. De scorer in de browser neemt een fragment dat het kalibratievenster van vijf minuten bevat.

js-trust-err-score-too-large = { $name }: groter dan 2 MiB. De scorer in de browser neemt een fragment (de opdracht { $command } neemt een heel log); open een fragment dat het kalibratievenster van vijf minuten bevat.

js-trust-err-scorecard-too-large = { $name }: groter dan 8 MiB; deze pagina leest een scorekaart tot die grootte.

js-trust-err-session-empty = De sessie-instellingen zijn leeg. Ze geven het vaartuig op ({ $setting }).

js-trust-err-too-many-epochs = Het bestand heeft { $count } epochen; deze pagina tekent er hooguit { $max }. Open een fragment.

js-trust-err-triple-quote = { $what } bevat drie enkele aanhalingstekens achter elkaar, wat niet in de instellingen kan worden ingebed

js-trust-err-what-file = het bestand

js-trust-err-what-imu = het IMU-bestand

js-trust-event-label = gebeurtenis: { $label }

js-trust-event-onset = begin

js-trust-evt-col-first-alarm = Eerste alarm, s

js-trust-evt-col-latency = Latentie, s

js-trust-evt-col-onset = Begin, s

js-trust-evt-col-outcome = Uitkomst

js-trust-evt-col-stated = Opgegeven gebeurtenis

js-trust-fmt-android = Android GNSS Logger (tekst)

js-trust-fmt-gnss-sdr = Doorgegeven JSON-lines van GNSS-SDR (tekst)

js-trust-fmt-nmea = NMEA 0183 (tekst)

js-trust-fmt-novatel = NovAtel OEM7 (ASCII of binair)

js-trust-fmt-rinex = RINEX-waarnemingen (tekst)

js-trust-fmt-rtcm3 = RTCM 3 MSM4 / MSM7 (binair)

js-trust-fmt-rtklib-pos = RTKLIB .pos-oplossing (tekst)

js-trust-fmt-sbf = Septentrio SBF (binair)

js-trust-fmt-ubx = u-blox UBX (binair)

js-trust-gate-note-derived = Deze run heeft geen gate-record. De strook toont waar een gate de positiebepaling zou hebben tegengehouden: epochen in de niet-vertrouwde band, vastgehouden tot 30 s nadat ze die verlaten. Hier afgeleid, niet uit een gate gelezen. Een gate is opt-in en voegt latentie toe.

js-trust-gate-note-read = De gate van elke epoche zoals de livestroom die meldde: uit, doorgelaten of tegengehouden (de positiebepaling is in de doorgestuurde cyclus als ongeldig gemarkeerd).

js-trust-gate-now-derived = { $gate } · afgeleid

js-trust-gate-off = Uit

js-trust-gate-off-cal = Uit (kalibreren)

js-trust-gate-passed = Doorgelaten: de positiebepaling wordt ongewijzigd doorgestuurd

js-trust-gate-span = gate { $gate }, { $from } tot { $to }

js-trust-gate-span-derived = gate { $gate } (afgeleid), { $from } tot { $to }

js-trust-gate-withheld = Tegengehouden: de positiebepaling zou verderop als ongeldig worden gemarkeerd

js-trust-gen-chart-label = De grafiek van de engine van de run: draaggolf-ruisdichtheid, toestand en alarmen in de tijd

js-trust-gen-epochs = Epochen: { $nominal } nominaal, { $degraded } verslechterd, { $untrusted } niet vertrouwd na het kalibratievenster van { $window } epochen.

js-trust-gen-self-heading = De eigen vlaggen van de ontvanger, tegenover de alarmen van Kshana

js-trust-gen-self-note = Een vergelijking, geen controle van een van beide: de vlag van de ontvanger is zijn eigen melding.

js-trust-geo-deduction-class = { $points } punten ({ $class })

js-trust-geo-deduction-points = { $points } punten

js-trust-geo-flag-mismatch = De HDOP die de ontvanger opgeeft wijkt af van de HDOP die is afgeleid uit de hemel die hij meldt: een geometrie-aftrek telt als inconsistentie.

js-trust-geo-flag-signal-loss = Signaalverlies: satellieten in zicht worden niet gevolgd hoewel hun geometrie goed is, dus een geometrie-aftrek telt als omgeving.

js-trust-geo-heading-label = geometrie { $label }

js-trust-geo-label-fair = { $label } (niet gescoord)

js-trust-geo-label-poor = { $label } (het enige label waarvoor de score aftrekt)

js-trust-geo-none-in-run = Geen geometrie in deze run (een engine van vóór 0.36 schrijft er geen).

js-trust-geo-reason-few-satellites = minder satellieten dan het minimum

js-trust-geo-reason-high-hdop = HDOP boven zijn drempel

js-trust-geo-reason-high-pdop = PDOP boven zijn drempel

js-trust-geo-reason-sky-blocked = de gevolgde satellieten laten een grote leemte in azimut (één kant van de hemel is geblokkeerd)

js-trust-geo-row-deduction = Geometrie-aftrek

js-trust-geo-row-from = Van

js-trust-geo-row-gap = Grootste azimutleemte

js-trust-geo-row-label = Label

js-trust-geo-row-open-sky = Open hemel

js-trust-geo-row-reported-hdop = HDOP die de ontvanger opgeeft

js-trust-geo-row-sats-used = Gebruikte satellieten

js-trust-geo-row-sky-age = Leeftijd van de hemel

js-trust-geo-row-status = Status

js-trust-geo-say-deduction = geometrie-aftrek { $points } punten

js-trust-geo-say-label-hdop = geometrie { $label } (HDOP { $hdop })

js-trust-geo-say-mismatch = opgegeven HDOP wijkt af

js-trust-geo-source-derived = afgeleid uit de satellieten die het log meldt (GSV)

js-trust-geo-source-none = niets

js-trust-geo-source-reported = de door de ontvanger opgegeven DOP (GSA)

js-trust-geo-status-reasons = { $status }: { $reasons }

js-trust-geo-status-title = geometrie { $status }

js-trust-geo-unknown-no-gsv = geometrie onbekend: geen GSV of GSA in het log

js-trust-geo-unknown-no-gsv-sentence = Geometrie onbekend: geen GSV of GSA in het log.

js-trust-geo-unknown-odd = Geometrie onbekend (het bestand zegt "{ $odd }", wat deze pagina niet kent).

js-trust-geo-used-of-view = { $used } van { $inView } in zicht

js-trust-got-file-kind = { $name }: { $kind }

js-trust-got-lines-skipped = { $count } regel(s) van { $name } waren geen epochen en zijn overgeslagen

js-trust-imu-csv = CSV met een koprij

js-trust-imu-euroc = EuRoC MAV imu0 data.csv

js-trust-imu-file = IMU-bestand: { $name } ({ $chars } tekens). Gebruikt bij de volgende beoordeling.

js-trust-imu-file-press = IMU-bestand: { $name } ({ $chars } tekens). Gebruikt bij de volgende beoordeling; druk op Het gekozen bestand beoordelen.

js-trust-imu-none = Geen IMU-bestand.

js-trust-jt-col-latency = Latentie, s

js-trust-jt-col-monitors = Eerste monitors

js-trust-jt-col-name = Naam

js-trust-jt-col-outcome = Uitkomst

js-trust-jt-col-recovered = Hersteld

js-trust-jt-col-slot = Slot, s

js-trust-jt-col-test = Test

js-trust-jt-label = { $label } Bewaking { $guard } s, herstelhouding { $hold } s.

js-trust-jt-label-contaminated = { $label } Bewaking { $guard } s, herstelhouding { $hold } s. De kalibratiebasislijn overlapte een gepland slot.

js-trust-jt-opened = { $name } geopend: { $count } test(s). Hier gelezen; er is niets geüpload.

js-trust-kind-batch-result = batchresultaat

js-trust-kind-json-lines = JSON lines

js-trust-kind-nmea-log = NMEA-log

js-trust-kind-truth-file = referentiebestand

js-trust-label-demo = Synthetische demo: een verzonnen veerbootlog met een verzonnen positie-drag-off, gescoord door Kshana. Vastgelegd uit de engine; het log is tekst, geen meting.

js-trust-label-example = Illustratief voorbeeld: een verzonnen NMEA-log met een verzonnen stoorzender van 120 s tot 240 s, hier door de engine beoordeeld. Tekst, geen meting.

js-trust-label-geo-demo = Synthetische demo met afgeschermde hemel: het veerbootlog met de westelijke helft van de hemel leeggemaakt vanaf 600 s (natuurlijke verslechtering, toegeschreven aan geometrie) en dezelfde verzonnen drag-off vanaf 1500 s (aanvalsachtig). Vastgelegd uit een engine met de 0.36-geometrie; tekst, geen meting.

js-trust-label-score-demo = Synthetisch demolog, hier door de engine gescoord. Verzonnen veerbootlog en drag-off; tekst, geen meting.

js-trust-legend-calibrating = Kalibreren (nooit gescoord)

js-trust-legend-class = Aftrekklasse:

js-trust-legend-class-environment = omgeving: het signaal

js-trust-legend-class-geometry = geometrie: de hemel, niet het signaal

js-trust-legend-class-inconsistency = inconsistentie (aanvalsachtig)

js-trust-legend-degraded = Verslechterd

js-trust-legend-demo = In deze demo meldt de ontvanger de hele tijd een geldige positiebepaling (GGA-kwaliteit 1, RMC-status A). De score is wat daalt.

js-trust-legend-geo-degraded = geometrie verslechterd

js-trust-legend-geo-good = geometrie goed

js-trust-legend-geo-unknown = geometrie onbekend (geen GSV of GSA; niet goed)

js-trust-legend-nominal = Nominaal

js-trust-legend-self = Eigen vlag van de ontvanger tegenover de alarmen van Kshana:

js-trust-legend-self-both = beide melden

js-trust-legend-self-kshana = alleen Kshana

js-trust-legend-self-neither = geen van beide

js-trust-legend-self-receiver = alleen de ontvanger

js-trust-legend-sky = Hemel:

js-trust-legend-true-track = Ware track (alleen synthetische gegevens)

js-trust-legend-underline = onderstreept: geometrie kost ook punten

js-trust-legend-untrusted = Niet vertrouwd

js-trust-marks-cleared = Markeringen gewist.

js-trust-marks-set = { $name } lag in { $count } epochen boven zijn begin; ze zijn gemarkeerd op de tijdlijn en de track.

js-trust-mon-agc = De automatische versterkingsregeling is verschoven ten opzichte van haar basislijn.

js-trust-mon-clock = De klokondersteunde monitor: de klok van de ontvanger tegenover zijn voorspelde lijn.

js-trust-mon-cn0-drop = Vermogensontzegging: signaalsterkte gedaald ten opzichte van de kalibratiebasislijn.

js-trust-mon-cn0-rise = Zoekt naar de signatuur van één zender: signaalsterkte over de satellieten die samen stijgt ten opzichte van de basislijn.

js-trust-mon-cn0-spread = Zoekt naar de signatuur van één zender: signaalsterkte over de satellieten die samen instort ten opzichte van de kalibratiebasislijn.

js-trust-mon-geometry = De satellietgeometrie (0.36): kost alleen punten wanneer de geometrie slecht is (HDOP, PDOP of de gebruikte satellieten voorbij hun drempels), begrensd en nooit onder de verslechterde band.

js-trust-mon-heading-course = Vergelijkt de richting van de track met waar het schip heen wijst, binnen de opgegeven afdrijfhoek.

js-trust-mon-jam-ind = De eigen jamming-indicator van de ontvanger.

js-trust-mon-kinematic = Vergelijkt elke positiestap met de gemelde snelheid en koers, en met de opgegeven limieten van het vaartuig voor snelheid, versnelling en draaisnelheid.

js-trust-mon-loss-of-lock = Verlies van gevolgde satellieten.

js-trust-mon-osnma = Leest een gemelde OSNMA-authenticatiefout. De status wordt gelezen, niet geverifieerd.

js-trust-mon-position-jump = Een stap in de gemelde positie groter dan de basislijn toestaat.

js-trust-mon-raim = De teststatistiek van de autonome integriteitsmonitoring van de ontvanger tegenover haar drempel.

js-trust-mon-receiver-self-report = De eigen spoofing- of jammingvlag van de ontvanger (bijvoorbeeld u-blox UBX-SEC-SIG of NAV-STATUS spoofDetState), getoond naast de monitors van Kshana. Uit het log gelezen, niet geverifieerd; de plek is klaar voor de monitor van de 0.38-engine en wordt als strook getekend zodra een resultaat die bevat.

js-trust-mon-sea-level = Controleert of de hoogte is waar het zeeoppervlak en de opgegeven antennehoogte haar zouden plaatsen.

js-trust-mon-solve-failure = De positie-oplossing kon niet worden berekend.

js-trust-mon-speed-log = Vergelijkt snelheid over de grond met vaart door het water, binnen de opgegeven stroomtolerantie.

js-trust-mon-time-consistency = Controleert de tijd van de ontvanger op onregelmatige stappen of achteruit lopen, en bij realtimestromen tegen de klok van deze computer.

js-trust-mon-unknown = Een monitor waarvoor deze weergave geen beschrijving heeft (nieuwer dan de pagina). Behandel hem als een monitor.

js-trust-na = n.v.t.

js-trust-name-colon-text = { $name }: { $text }

js-trust-never = nooit

js-trust-no = nee

js-trust-no-deduction = geen aftrek

js-trust-none = geen

js-trust-north = N

js-trust-not-stated = niet opgegeven

js-trust-note-advisories = De regels bevatten { $count } verschillende adviserende verklaringen; de eerste wordt getoond.

js-trust-note-csv-limits = trust.csv bevat scores en redenen maar geen verhoudingen of posities.

js-trust-note-live-no-model = Een livestroom geeft niet op welke monitors liepen of welk scoremodel gold; de bandgrenzen hieronder zijn de gedocumenteerde standaardwaarden en de monitorstroken tonen alleen monitors die punten kosten.

js-trust-note-nmea-no-match = Geen enkele NMEA-positiebepaling kon op tijd aan een epoche worden gekoppeld.

js-trust-note-nmea-skipped = { $count } NMEA-zin(nen) met een foute controlesom of foute velden zijn overgeslagen.

js-trust-note-skipped-epochs = { $count } epoche(n) zonder numerieke t_s zijn overgeslagen.

js-trust-note-truth-no-match = De tijden van het referentiebestand komen met geen enkele epoche overeen.

js-trust-note-unknown-state = { $count } epoche(n) dragen een toestand die deze pagina niet kent ({ $states }); ze worden getekend als kalibrerend, nooit gescoord.

js-trust-offset-at = Op { $time } ligt de door de ontvanger gemelde positie { $m } m van waar het vaartuig werkelijk was (synthetische referentie).

js-trust-offset-no-truth = Geen werkelijke positie op dit tijdstip.

js-trust-opened = { $count } epochen geopend ({ $source }).

js-trust-opening-demo = De synthetische demo wordt geopend…

js-trust-opening-demo-log = Het synthetische demolog wordt geopend…

js-trust-opening-example = Het illustratieve voorbeeld wordt geopend…

js-trust-opening-geo-demo = De demo met afgeschermde hemel wordt geopend…

js-trust-pause = Pauzeren

js-trust-play = Afspelen

js-trust-reading = Lezen…

js-trust-reasons-calibrating = Kalibreren: de eerste seconden vormen de basislijn en worden nooit gescoord.

js-trust-reasons-class-note = Elke aftrek draagt de klasse van de engine: geometrie (de hemel), omgeving (het signaal) of inconsistentie (aanvalsachtig)

js-trust-reasons-live-unknown = Welke monitors liepen wordt in een livestroom niet opgegeven; een controle die hier ontbreekt is mogelijk niet uitgevoerd.

js-trust-reasons-marked-none = gemarkeerd; hier geen aftrek

js-trust-reasons-no-score = Geen score bij deze epoche.

js-trust-reasons-no-score-note = Geen score bij deze epoche: { $note }.

js-trust-reasons-not-run = Niet uitgevoerd (geen geslaagde controle)

js-trust-reasons-nothing = Bij deze epoche is niets afgetrokken. Dat is geen bewijs dat de positiebepaling goed is: zie hieronder wat de controles niet kunnen zien.

js-trust-reasons-pts = { $points } pnt

js-trust-reasons-ran-free = Uitgevoerd, kostte niets

js-trust-reasons-ratio = verhouding { $ratio }

js-trust-reasons-row-title = { $name }: { $text } Klik om te markeren waar hij boven zijn begin lag.

js-trust-reasons-weight = gewicht { $weight }

js-trust-reduced-motion = Verminderde beweging heeft de voorkeur, dus de replay start op 1x. Gebruik de schuifregelaar of de pijltoetsen om zonder animatie te bewegen.

js-trust-say-gate = gate { $gate }

js-trust-say-gate-derived = gate { $gate } (afgeleid)

js-trust-say-monitor-points = { $monitor } { $points } punten

js-trust-say-position-from-true = gemelde positie { $m } m van de werkelijke

js-trust-say-reasons = redenen: { $list }

js-trust-say-score = score { $score }

js-trust-scored-label = { $count } epochen van { $name } gescoord met engine { $version }, in deze browser.

js-trust-scored-summary = { $count } epochen gescoord met engine { $version }: { $summary }. Alleen adviserend.

js-trust-scoring = De engine wordt gestart en er wordt gescoord…

js-trust-self-code-meaning = { $code }: { $meaning }

js-trust-self-none-at-time = Het log bevat op dit tijdstip geen ontvangervlag.

js-trust-self-not-in-log = niet in het log

js-trust-self-row-flags = Vlaggen van de ontvanger

js-trust-self-row-jamming = Jammingtoestand van de ontvanger

js-trust-self-row-kshana-alarms = Een Kshana-monitor slaat alarm

js-trust-self-row-spoofing = Spoofingtoestand van de ontvanger

js-trust-self-unknown-agreement = een overeenstemming die deze pagina niet kent ({ $odd })

js-trust-self-yes-state-2 = ja (toestand 2 of hoger)

js-trust-set-degraded-edge = de verslechterde grens

js-trust-set-degraded-min = verslechterd bij of boven

js-trust-set-epochs = Epochen

js-trust-set-epochs-counts = { $total } in totaal: { $calibrating } kalibrerend, { $nominal } nominaal, { $degraded } verslechterd, { $untrusted } niet vertrouwd.

js-trust-set-epochs-counts-class = { $total } in totaal: { $calibrating } kalibrerend, { $nominal } nominaal, { $degraded } verslechterd, { $untrusted } niet vertrouwd. Per aftrekklasse: geometrie { $geometry }, omgeving { $environment }, inconsistentie { $inconsistency }.

js-trust-set-evidence-hold = bewijshouding, s

js-trust-set-full-ratio = vol gewicht bij verhouding

js-trust-set-geo-counts = Hemel: { $good } goed, { $degraded } verslechterd, { $unknown } onbekend. Label: { $lgood } goed, { $fair } redelijk, { $poor } slecht (alleen slecht kost punten). Epochen met een aftrek van klasse geometrie { $geometry }, omgeving { $environment }, inconsistentie { $inconsistency }.

js-trust-set-geo-counts-odd = Hemel: { $good } goed, { $degraded } verslechterd, { $unknown } onbekend ({ $odd } met een waarde die deze pagina niet kent, gelezen als onbekend). Label: { $lgood } goed, { $fair } redelijk, { $poor } slecht (alleen slecht kost punten). Epochen met een aftrek van klasse geometrie { $geometry }, omgeving { $environment }, inconsistentie { $inconsistency }.

js-trust-set-geometry = Geometrie (instellingen van [geometry])

js-trust-set-gloss = Waar elke controle naar kijkt

js-trust-set-live-geometry = Een livestroom geeft de geometriedrempels niet op; de gedocumenteerde standaardwaarden gelden (slecht boven HDOP 4 of PDOP 6, of onder 5 satellieten; hooguit 15 punten, nooit onder de verslechterde band).

js-trust-set-no-geometry = Deze run bevat geen geometrie: ze komt van een engine van vóór 0.36, of van trust.csv. Er wordt niets over de hemel getoond, en niets wordt als goed getoond.

js-trust-set-nominal-min = nominaal bij of boven

js-trust-set-onset-ratio = kost punten vanaf verhouding

js-trust-set-provenance = Waar de drempels vandaan komen, en hoe aftrekken worden ingedeeld

js-trust-set-ran = Controles die liepen

js-trust-set-weights = Gewicht van elke controle, punten

js-trust-settings-assumed = Deze stroom geeft zijn scoremodel niet op. De getoonde bandgrenzen zijn de gedocumenteerde standaardwaarden, aangenomen.

js-trust-show-in-replay = Deze run tonen in de replay hieronder (track, score, de eigen vlag van de ontvanger)

js-trust-sky-no-gsv = geen GSV

js-trust-sky-none = Geen hemel: open het NMEA-log bij de run (of een demo) om de satellieten te zien die het vermeldt.

js-trust-span-title = { $what }, { $from } tot { $to }

js-trust-state-0 = onbekend of niet ingeschakeld

js-trust-state-1 = geen aanwijzing

js-trust-state-2 = aangegeven

js-trust-state-3 = meerdere aanwijzingen of bevestigd

js-trust-strip-band = band

js-trust-strip-class = klasse

js-trust-strip-gate = gate

js-trust-strip-marked = gemarkeerd

js-trust-strip-receiver = ontvanger

js-trust-strip-sky = hemel

js-trust-strips-none = Geen monitorverhoudingen in dit bestand.

js-trust-strips-note-ran = verhouding van statistiek tot drempel; onderbroken lijn is het alarm bij 1

js-trust-strips-note-seen = alleen monitors die punten bleken te kosten; verhouding ten opzichte van drempel

js-trust-sum-both-flag = Beide melden

js-trust-sum-epochs-compared = Vergeleken epochen (na kalibratie)

js-trust-sum-first-kshana = Eerste Kshana-alarm onder die epochen

js-trust-sum-first-receiver = Eerste ontvangervlag

js-trust-sum-jamming-flag = Jammingvlag van de ontvanger (toestand 2+)

js-trust-sum-neither = Geen van beide

js-trust-sum-only-kshana = Alleen Kshana slaat alarm

js-trust-sum-only-receiver = Alleen de ontvanger meldt

js-trust-sum-spoofing-flag = Spoofingvlag van de ontvanger (toestand 2+)

js-trust-thr-azimuth-gap = azimutleemte, graden, vanaf welke de hemel gedeeltelijk geblokkeerd is

js-trust-thr-cap-in-force = hoogste aantal punten dat de geometrie-aftrek in deze run neemt

js-trust-thr-cap-points = hoogste aantal punten dat de geometrie-aftrek mag nemen

js-trust-thr-floor = laagste score die de geometrie alleen mag overlaten (leeg: de grens van de verslechterde band)

js-trust-thr-floor-in-force = laagste score die de geometrie alleen in deze run kan overlaten

js-trust-thr-full-ratio = verhouding waarbij de geometrie-aftrek zijn maximum bereikt

js-trust-thr-hdop-good = HDOP bij of onder welke de geometrie goed is

js-trust-thr-hdop-max = HDOP boven welke de geometrie slecht is

js-trust-thr-hold = hoe lang hemelposities en GSA tellen nadat ze zijn aangekomen, s

js-trust-thr-low-elev = elevatie, graden, waaronder een verloren satelliet aan de hemel wordt toegeschreven

js-trust-thr-min-used = minste aantal gebruikte satellieten voordat de geometrie slecht is

js-trust-thr-pdop-good = PDOP bij of onder welke de geometrie goed is

js-trust-thr-pdop-max = PDOP boven welke de geometrie slecht is

js-trust-thr-reported-rel = hetzelfde, als aandeel van de afgeleide HDOP

js-trust-thr-reported-tol = verschil tussen opgegeven en afgeleide HDOP voordat de twee het oneens zijn

js-trust-thr-sigma-uere = door de drempels aangenomen gebruikersequivalente afstandsfout, meter

js-trust-thr-used-good = aantal gebruikte satellieten bij of boven welk de geometrie goed is

js-trust-track-desc = Track van { $positions } gemelde posities, noord boven. { $untrusted } epochen zijn niet vertrouwd.

js-trust-track-desc-none = Geen track: de bestanden bevatten geen posities.

js-trust-track-desc-truth = Track van { $positions } gemelde posities, noord boven. { $untrusted } epochen zijn niet vertrouwd. Een dunne grijze lijn toont de ware track.

js-trust-track-end = einde

js-trust-track-no-positions = Geen posities in de geopende bestanden

js-trust-track-note = Noord boven, één schaal op beide assen. De lijn is waar de ontvanger zei dat het vaartuig was, gekleurd naar de vertrouwensband van elke epoche.

js-trust-track-note-none = Dit bestand bevat geen posities. Voeg het NMEA-log toe waaruit de run kwam (of een v1.1-stroom met een positie) om de track te tekenen.

js-trust-track-start = start

js-trust-unknown-agreement = een overeenstemming die deze pagina niet kent

js-trust-yes = ja

js-mthread-limiting-phase = De engine noemt de beperkende bron van deze fase als { $source }: een bron van de fase, niet één rij van deze tabel.

js-mthread-limiting-row = de beperkende bron van de engine

js-cat-mission-thread-short-question = Welke fase heeft langs één stack van lancering tot intrede, via een rendez-vous in een lage baan en een dag translunaire vlucht, de kleinste marge voor navigatie en tijdsynchronisatie? (gemodelleerd)

js-cat-mission-thread-short-title = Korte missieketen, van lancering tot intrede

js-meankind-mthread-big = Langs de keten ligt de kleinste marge ten opzichte van de eis in de fase { $phase }.

js-meankind-mthread-big-source = Langs de keten ligt de kleinste marge ten opzichte van de eis in de fase { $phase }, beperkt door { $source }.

js-meankind-mthread-line =
    { $n ->
        [one] { $n } fase.
       *[other] { $n } fasen.
    }
