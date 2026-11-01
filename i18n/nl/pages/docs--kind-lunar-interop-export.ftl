# docs--kind-lunar-interop-export: translations (nl)

seg-debc2f07db78 = true

seg-1f17ef6a853e = Scenariokind van de engine v{ $version }, familie <a1>Maan en cislunair</a1>. Adviserend: analyse-uitvoer van een onderzoeks- en engineeringhulpmiddel, geen typegoedgekeurde navigatieapparatuur en geen veiligheidskritieke dienst. Elk label hier is dat van de engine of van de verificatiematrix; een kind is MODELLED tenzij de matrix anders zegt (hoe een label wordt verdiend: de sectie Evidence van de README).

seg-1c1eeb2dcaa0 = Familiepagina: <a1>Maan en cislunair</a1>

seg-619127334cf3 = Geen rij van de matrix noemt dit kind bij naam; het label op het resultaat is dat van de engine zelf, hierboven.

seg-834408a40783 = min

seg-d36e6d7d8a10 = Bron: <c1/>

seg-fdf560e675f4 = <c1/> (scenariosoort)

seg-5a4dcb93a643 = Gemodelleerde interoperabiliteitsexport voor de maan: geeft het maanreferentiestelsel, de maantijdschaal en de maanefemeride uit in op LunaNet/IOAG afgestemde, op CCSDS gebaseerde uitwisselingsvormen met controle van heen-en-terugvertaling en velden. HERGEBRUIKT de CCSDS OEM { "2.0" }-emitter en -parser van de crate (crate::oem), opnieuw getagd voor de maancontext — de OEM REF_FRAME draagt het maanlichaamsstelsel IAU { "2015" } WGCCRE (MOON_ME / MOON_PA), TIME_SYSTEM de maantijdschaal (LTC / TCL / UTC), CENTER_NAME = MOON — over een voorbeeldefemeride van het illustratieve type LCNS (posities uit crate::lunar_service, snelheid via eindig verschil). Geeft ook een op LunaNet/IOAG afgestemde beschrijving van de maantijd uit (schaal-id, seculiere snelheid µs/dag uit crate::lunar_time, gepubliceerde band, referentieoppervlak) die via serde_json heen en terug wordt vertaald, en verpakt de artefacten in de bestaande KIF-envelop (crate::interchange) met het eerlijkheidslabel MODELLED. Rapporteert uitgegeven artefacten, aantal OEM-regels, veldformaatcontrole geslaagd + lijst van aanwezige/ontbrekende velden, OEM-heen-en-terugvertaling in orde, tijdmetadata-heen-en-terugvertaling in orde, en KIF-grootte in bytes. MODELLED — deterministische heen-en-terugvertaling + controle van veldnamen ten opzichte van gepubliceerde CCSDS OEM- en LunaNet/IOAG-veldsemantiek is de onafhankelijke referentie; GEEN gecertificeerde formaatcontrole voor interoperabiliteit; illustratieve efemeride uit openbare bronnen, niet gelieerd aan ESA; geen TRL, geen heritage, geen onderschrijving door een ruimtevaartorganisatie.

seg-1726861e444f = Eén run van <c1/> vat zich samen als: lunar-interop-export | REF_FRAME MOON_ME / TIME_SYSTEM LTC | { "9" } toestanden, OEM { "23" } regels | formaatcontrole PASS ({ "9" } aanwezig / { "0" } ontbrekend) | OEM-heen-en-terugvertaling ok | tijdmetadata-heen-en-terugvertaling ok | KIF { "1640" } bytes | MODELLED

seg-f8353e15aabd = Optionele velden: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>

seg-169f9446e90d = Het voorbeeld <c1/> stelt onder meer in:

seg-b8135da5a99a = 2030-01-01T00:{ "00" }:{ "00" }

seg-3f36bd2ec5ea = LTC

seg-2ac27c1e55c0 = octet

seg-0e86ff364c17 = De grafiek die de engine schrijft voor scenarios/lunar-interop-export.toml, soort lunar-interop-export

seg-98acb538942f = <b>MODELLED</b> Op LunaNet/IOAG afgestemde export van maanstelsel + tijd + efemeride (CCSDS OEM + KIF) met controle van de heen-en-terugvertaling. Onafhankelijke referentie (InternalConsistency): de maan-OEM-export van kshana, opnieuw geparseerd door de onafhankelijke bibliotheek <c1/> van een derde partij (R. J. Anderson): de tokens voor stelsel en tijd en de toestand per epoch komen overeen binnen de schrijfprecisie ({ "1" } mm / { "1e-9" } km/s) en een export zonder TIME_SYSTEM wordt afgewezen — een structurele heen-en-terugvertaling van de uitwisseling; de fysische semantiek van maanstelsel en maantijd wordt getoetst in hun eigen rijen, dus dit blijft MODELLED. { "0.30" } externe vergelijking, een bevinding (blijft MODELLED): een se

seg-c9a1d76625d6 = MODELLED (resultaat <c1/>)

seg-633bcd62ce93 = Geeft ook een op LunaNet/IOAG afgestemde beschrijving van de maantijd uit (schaal-id, seculiere snelheid µs/dag uit crate::lunar_time, gepubliceerde band, referentieoppervlak) die via serde_json heen en terug wordt vertaald, en verpakt de artefacten in de bestaande KIF-envelop (crate::interchange) met het eerlijkheidslabel MODELLED. (soortencatalogus (<c1/>))

seg-0e91697e3036 = MODELLED — deterministische heen-en-terugvertaling + controle van veldnamen ten opzichte van gepubliceerde CCSDS OEM- en LunaNet/IOAG-veldsemantiek is de onafhankelijke referentie; GEEN gecertificeerde formaatcontrole voor interoperabiliteit; illustratieve efemeride uit openbare bronnen, niet gelieerd aan ESA; geen TRL, geen heritage, geen onderschrijving door een ruimtevaartorganisatie. (soortencatalogus (<c1/>))

seg-11d0ccba5ee7 = WAT src/lunar_interop.rs doet: * export_lunar_oem — HERGEBRUIKT de CCSDS OEM { "2.0" }-emitter van de crate (crate::oem), opnieuw getagd voor de maancontext: REF_FRAME = het maanlichaamsstelsel IAU { "2015" } WGCCRE (MOON_ME / MOON_PA), TIME_SYSTEM = de maantijdschaal (LTC / TCL / UTC), CENTER_NAME = MOON, over een voorbeeldefemeride van het type LCNS die ILLUSTRATIVE is (posities uit crate::lunar_service, snelheid via centraal eindig verschil). * export_ (commentaar in het scenariobestand, regels { "6" } tot { "19" })

seg-f730e8f789cf = EERLIJKHEID: MODELLED. De veld-NAMEN en eenheden zijn afgestemd op PUBLIC-standaarden (CCSDS 502.0-B OEM, IAU WGCCRE { "2015" }-maanstelsels, LunaNet Interoperability Specification / IOAG-maanarchitectuur). De deterministische heen-en-terugvertaling en de controle van veldnamen zijn de onafhankelijke referentie. Dit is GEEN gecertificeerde formaatcontrole voor interoperabiliteit. De efemeride is illustratief, uit openbare bronnen, NIET gelieerd aan ESA, en impliceert geen TRL (commentaar in het scenariobestand, regels { "21" } tot { "26" })

seg-254d48fe58a5 = De interoperabiliteitsexport voor de maan is MODELLED, niet getoetst aan een onafhankelijke externe referentie: gecontroleerd aan de hand van de eigen gesloten-vorm- of analytische identiteit; dit vangt transcriptie- en coëfficiëntfouten op, maar is geen externe onafhankelijke referentie. (verificatiematrix (docs/MODELLED-RATIONALE.md))

seg-07d6cc44724f = <s1>Vorige</s1>lunar-integrity

seg-9669cd9b1d04 = <s1>Volgende</s1>lunar-jamming
