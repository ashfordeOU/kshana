# docs--kind-oem-interop: translations (nl)

seg-99ef7c1d552c = Scenariotype van de engine v{ $version }, familie <a1>Missieanalyse, verbindingen en ruimteoperaties</a1>. Adviserend: analyse-uitvoer van een onderzoeks- en engineeringhulpmiddel, geen typegoedgekeurde navigatieapparatuur en geen dienst voor het redden van mensenlevens. Elk label hier is dat van de engine of van de verificatiematrix; een type is MODELLED tenzij de matrix anders zegt (hoe een label wordt verdiend: de sectie Evidence van de README).

seg-37d29d8303fe = km

seg-8f1e7d3f5a07 = Familiepagina: <a1>Missieanalyse, verbindingen en ruimteoperaties</a1>

seg-3068552e4ab4 = VALIDATED: de rijen van de <a1>verificatiematrix</a1> die dit kind noemen.

seg-4abcbdaddcf8 = Bron: <c1/>

seg-a92dcafd670e = <c1/> (scenariosoort)

seg-dbffff25b57f = CCSDS OEM-interoperabiliteitsbrug: importeer een Orbit Ephemeris Message die is geproduceerd door een externe vluchtdynamicatool (GMAT/Orekit/STK geven allemaal OEM af) en rapporteer de segmenten/objecten/referentiestelsels/epochspanne plus een controle op snelheidsconsistentie; zonder invoer doorloopt zij een rondreis met een gegenereerde referentiebaan en rapporteert zij de getrouwheid van import↔export. MODELLED structurele/fysische invoercontrole, GEEN valideringsonderzoek naar de baannauwkeurigheid van de bron.

seg-21eb1c9d7571 = Eén run van <c1/> vat samen als: oem-interop: rondreis met { "2" } segment(en), { "12" } toestanden; maximale rondreisfout { "4.88e-7" } km / { "4.61e-10" } km/s (MODELLED interop)

seg-54c35d9fbfd9 = Optionele velden: <c1/>

seg-d4117f615cd8 = Het voorbeeld <c1/> stelt onder meer in:

seg-d7db74d14617 = KSHANA

seg-b16f858574ca = Resultaatlabel (van de engine): MODELLED — CCSDS OEM-importbrug voor import/rondreis (GMAT/Orekit/STK geven OEM af); een structurele + fysische invoercontrole, GEEN valideringsonderzoek naar de baannauwkeurigheid van de bron

seg-5db5a7c812ca = De grafiek die de engine schrijft voor scenarios/oem-interop.toml, soort oem-interop

seg-cd29f08ef235 = <b>VALIDATED</b> CCSDS { "502.0" } OEM-importer (parse_oem), tolerant voor COMMENT-regels / extra metadatatrefwoorden / covariantieblokken en de exacte inverse van de schrijver; rondreis + invoer van externe bestanden met een controle op snelheidsconsistentie. Tests: <a1>ccsds_oem_interop_reference.rs</a1>.

seg-20071a16b316 = <b>VALIDATED</b> CCSDS { "502.0" } OEM-importer (parse_oem), tolerant voor COMMENT-regels / extra metadatatrefwoorden / covariantieblokken en de exacte inverse van de schrijver; rondreis + . Onafhankelijke referentie (ExternalDataset): onafhankelijke externe CCSDS-502-parser <c1/> { "0.4.5" } (MIT, <a1>https://pypi.org/project/oem/</a1>) — een aparte codebasis die de door kshana uitgegeven EME2000/UTC-OEM byte-voor-byte identiek decodeert ({ "24" } toestanden over { "2" } fixtures, pos/vel Δ = { "0" }) en waarvan de strikte lezer de metadatatokens bevestigt; de parser van kshana komt eveneens overeen met die van de bibliotheek op een meegeleverd extern OEM. Twee eerlijke interoperabiliteitsbevindingen (de oem-bibliotheek weigert de mu per satelliet van kshana

seg-7ab6bb7a1b8a = MODELLED — CCSDS OEM-importbrug voor import/rondreis (GMAT/Orekit/STK geven OEM af); een structurele + fysische invoercontrole, GEEN valideringsonderzoek naar de baannauwkeurigheid van de bron (resultaat <c1/>)

seg-343a56c07d02 = MODELLED structurele/fysische invoercontrole, GEEN valideringsonderzoek naar de baannauwkeurigheid van de bron. (soortencatalogus (<c1/>))

seg-44aba1ad1d37 = EERLIJKE REIKWIJDTE: MODELLED structurele + fysische invoercontrole, GEEN valideringsonderzoek naar de baannauwkeurigheid van de bronefemeride. Run: kshana scenarios/oem-interop.toml (opmerking in het scenariobestand, regels { "11" } tot { "13" })

seg-833df8eedc34 = <s1>Vorige</s1>ntn-positioning

seg-28254e1b38d4 = <s1>Volgende</s1>optical-atmosphere
