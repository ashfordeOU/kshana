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

js-cat-lunar-station-coverage-public-sources-question = Welke gecorrigeerde fout geeft het station boven de zuidpool onder alleen de openbaar vermelde aannames? Het resultaat wordt bepaald door de baanelementen, die niet openbaar zijn en ILLUSTRATIEF zijn gesteld; dit is de invoer van de bevroren voorspelling. (gemodelleerd; geen uitspraak over enig echt systeem)

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

js-kind-note-parameters-are-public-with-a = Parameters zijn OPENBAAR (met een bron), REPRESENTATIEF of WORKSHOP, zoals elke voorinstelling aangeeft.

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
