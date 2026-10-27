# docs--kind-lunar-jamming: translations (nl)

seg-37d16b499bc5 = dB

seg-59afd80736c5 = <b>PARTNER</b> Niet geleverd — Kshana modelleert signaalprestaties, geen payload- of antennehardware. Onafhankelijke referentie (NoneKind): geen: een discipline die van de partner is, met opzet zonder module en zonder test

seg-1f17ef6a853e = Scenariokind van de engine v{ $version }, familie <a1>Maan en cislunair</a1>. Adviserend: analyse-uitvoer van een onderzoeks- en engineeringhulpmiddel, geen typegoedgekeurde navigatieapparatuur en geen veiligheidskritieke dienst. Elk label hier is dat van de engine of van de verificatiematrix; een kind is MODELLED tenzij de matrix anders zegt (hoe een label wordt verdiend: de sectie Evidence van de README).

seg-1c1eeb2dcaa0 = Familiepagina: <a1>Maan en cislunair</a1>

seg-a3697ad561db = Hz

seg-9521a296d617 = dBi

seg-f85a85f0c7e4 = MHz

seg-7154243aabbe = broadband

seg-cec5c06d38af = <b>MODELLED</b> Maanspecifieke jammer-tot-signaalverhouding, effectieve C/N₀ en verlies van lock voor een selenografische oppervlaktegebruiker onder een jammer op het maanoppervlak (of verhoogd), over de illustratieve constellatie van het type Moonlight/LCNS uit openbare bronnen.

seg-edcd55ccc993 = <b>MODELLED</b> Het rapport <c1/> steunt zijn ontkenningscontour niet langer op één scalair.

seg-bcb02ffed4d0 = Bron: <c1/>

seg-612388918e36 = <c1/> (scenariosoort)

seg-a91a9ad5d8d1 = RF-jamming op de maan zelf: verhouding tussen stoorsignaal en signaal per satelliet, effectieve C/N₀ en verlies van lock voor een selenografische gebruiker op het oppervlak onder een jammer op het maanoppervlak (of verhoogd), over de illustratieve constellatie in een maanbaan van het type Moonlight/LCNS uit openbare bronnen. Voegt de bestaande open jammingfysica (jamming::j_over_s_db, effective_cn0_dbhz, rx_antenna_gain_db, lock_status, q_factor) samen met de bestaande hemelgeometrie van de maan (lunar_service::LunarConstellation + topocentric, lunar::selenographic_to_mcmf); er wordt geen geometrie of radiometrie opnieuw afgeleid. Anders dan bij de aardse soort <c1/> is het signaalbeen GEEN vast ontvangen vermogen: het isotrope ontvangen vermogen van elke satelliet is zijn eigen linkbudget EIRP − FSPL(schuine afstand), zodat de J/S per satelliet verschilt met maanafstand en elevatie. Rapporteert ÉÉN RIJ PER ZICHTBARE LINK (epoch, satelliet) — azimut, elevatie, schuine afstand, beide ontvangen vermogens waarvan de J/S het verschil is, de J/S, de nominale en effectieve C/N₀ en de lockstatus — plus samengevatte kwaliteitsmaten naast (nooit in plaats van) die tabel, en dezelfde tabel als CSV-artefact. Elk uitgegeven numeriek veld draagt een eenheid en een herkomstklasse. VALIDATED deelresultaten dragen de onafhankelijke referentie van hun bronmodule (de anti-jamvergelijking en J/S-link van Kaplan & Hegarty §{ "9.4" }, extern gerefereerd in tests/gnss_denied_jamming_resilience_reference.rs; de maangeometrie van lunar_service). De samenstelling zelf wordt gecontroleerd aan een onafhankelijk pad met twee linkbudgetten (linkbudget::received_signal_power_dbw, een andere uitdrukking voor vrije-ruimteverlies) tot { "1e-9" } dB. MODELLED: de illustratieve constellatie, de representatieve EIRP / jammervermogen / antennewinsten / ruistemperatuur, en de afwezigheid van terreinafscherming, multipad, AGC-dynamiek en adaptief nullen. Geen gecertificeerd product voor denial-of-service. Als een jammer is geconfigureerd, bevat het rapport ook een BLOKKADECONTOUR INCLUSIEF EEN ONZEKERHEIDSBAND in plaats van een contour die van één scalaire waarde wordt afgelezen: de volledige gemeten verdeling van de C/N₀ van het gewenste signaal over de tabel per satelliet (n, min, p05, p25, mediaan, p75, p95, max, gemiddelde, steekproefstandaardafwijking en de eigen asymmetrie van de steekproef), en de contour geëvalueerd bij elk van die rangstatistieken onder BEIDE blokkadecriteria die de engine kent — het gevestigde criterium van de vermogensverhouding (J/S = { "30" } dB, zoals in attack-surface en tracking-loop) en het criterium van verlies van lock (effectieve C/N₀ die daalt tot tracking_threshold_dbhz, het criterium dat de eigen statuskolom van dit rapport gebruikt) — op beide assen van het blokkadevlak (vereiste jammer-EIRP op de standoff van het scenario, blokkadestandoff bij de EIRP van het scenario). De randen van de band ZIJN contour(p05) en contour(p95), dezelfde afbeelding in gesloten vorm toegepast op de eigen kwantielen van de steekproef: geen sigma die aan de steekproef is gefit en niet mediaan ± k·stdev, waarbij stdev ter wille van de continuïteit wordt uitgegeven en door niets wordt gebruikt. Een kwantiel dat al op of onder de trackingdrempel ligt, heeft geen eindige blokkerende J/S en zijn kolommen voor verlies van lock zijn null met een getelde reden, nooit een afgekapte straal.

seg-6693c3ebcb07 = Eén run van <c1/> vat zich samen als: lunar-jamming | { "4" } sats, { "12" } epochs, { "38" } links vanaf (-89.67, { "129.78" }) | J/S { "33.651" }..36.668 dB (gemiddeld { "35.622" }) | { "0" } LOST | beschikbaarheid { "0.167" } van { "0.167" } nominaal

seg-6e01b6354e40 = Optionele velden: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>, <c19/>

seg-c61fb6515ed9 = Het voorbeeld <c1/> stelt onder meer in:

seg-6fe8b3c6c584 = De grafiek die de engine schrijft voor scenarios/lunar-jamming.toml, soort lunar-jamming

seg-d4ae2f589112 = <b>MODELLED</b> Verhouding tussen stoorsignaal en signaal op de maan zelf, effectieve C/N₀ en verlies van lock voor een selenografische gebruiker op het oppervlak onder een jammer op het maanoppervlak (of verhoogd), over de illustr. Onafhankelijke referentie (ReferenceImpl): Controle van de samenstelling aan een onafhankelijk codepad binnen de repository: elke J/S per link wordt opnieuw afgeleid als het verschil van twee linkbudgetten die zijn berekend met linkbudget::received_signal_power_dbw, waarvan het vrije-ruimteverlies de enkele uitdrukking { "20" }·log10(4πRf/c) is in plaats van de som van drie termen die jamming::free_space_path_loss_db gebruikt — de twee komen op elke rij overeen tot < { "1e-9" } dB (gemeten ongunstigste geval { "7.11e-14" } dB, dat wil zeggen afrondingsfout in drijvende komma)

seg-dbe54e7cc800 = <b>MODELLED</b> Het rapport <c1/> baseert zijn blokkadecontour niet langer op één scalaire waarde. Het geeft de volledige gemeten verdeling van de C/N₀ van het gewenste signaal over de tabel per sat uit. Onafhankelijke referentie (InternalConsistency): Interne consistentie ten opzichte van de eigen voorwaartse functies van de engine, het enige wat deze mogelijkheid eerlijk kan claimen. Elk contourpunt is een inversie in gesloten vorm, en elke inversie wordt gecontroleerd door haar antwoord terug te voeren door de VOORWAARTSE functie waarmee de eigen rijen van het rapport zijn gescoord: de J/S-kolom via jamming::effective_cn0_dbhz (die tracking_threshold_dbhz moet teruggeven tot < { "1e-9" } dB-Hz), de standoffkolom

seg-d48926e62856 = MODELLED: de illustratieve constellatie, de representatieve EIRP / jammervermogen / antennewinsten / ruistemperatuur, en de afwezigheid van terreinafscherming, multipad, AGC-dynamiek en adaptief nullen. (soortencatalogus (<c1/>))

seg-c455dbcb9f8c = MODELLED. De constellatie is de illustratieve geometrie van het type Moonlight/LCNS uit openbare bronnen (niet de echte efemeride; geen verbondenheid of onderschrijving geïmpliceerd), en het interferentiemodel is een linkbudget: geen terreinafscherming van de jammer (een eerste-orde-effect in terrein bij de zuidpool), geen multipad, geen AGC-dynamiek van dichtbij en veraf, geen adaptief nullen, geen hysterese tussen acquisitie en tracking. (commentaar in het scenariobestand, regels { "26" } tot { "30" })

seg-da57cc7f1aa4 = RF-jamming bij navigatie op het maanoppervlak (J/S per satelliet) is MODELLED, niet getoetst aan een onafhankelijke externe referentie: gecontroleerd aan een afzonderlijke implementatie in dezelfde codebase — onafhankelijk van de geteste eenheid, maar niet extern gezaghebbend. (verificatiematrix (docs/MODELLED-RATIONALE.md))

seg-dba1589d3c1e = De blokkadecontour op de maan met een onzekerheidsband uit de gemeten spreiding van de C/N₀ is MODELLED, niet getoetst aan een onafhankelijke externe referentie: gecontroleerd aan de hand van de eigen gesloten-vorm- of analytische identiteit; dit vangt transcriptie- en coëfficiëntfouten op, maar is geen externe onafhankelijke referentie. (verificatiematrix (docs/MODELLED-RATIONALE.md))

seg-a2889fb2b42a = Onderwerppagina: <a1>integrations.md</a1>

seg-03b50b21e5a8 = <s1>Vorige</s1>lunar-interop-export

seg-02568469f628 = <s1>Volgende</s1>lunar-joint-od-clock
