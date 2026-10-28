# docs--kind-lunar-attack-surface: translations (nl)

seg-8784979d6569 = dBW

seg-37d16b499bc5 = dB

seg-98151954f217 = false

seg-cc2ad9e12064 = <b>MODELLED</b> J/S-linkbudget uit geometrie, anti-jam-C/N₀, verlies van lock per satelliet. Onafhankelijke referentie (InternalConsistency): De linkbudgetvergelijking voor anti-jam-C/N₀ is gecontroleerd tegen een onafhankelijke numpy-herafleiding (deelt dezelfde gesloten vorm → InternalConsistency) plus een karakterisering van de C/N₀-degradatie in de echte JammerTest-2024. { "0.30" } round { "2" }, geblokkeerd (blijft MODELLED): de gemeten JammerTest { "2024" }-C/N0-daling tegenover een linkbudgetvoorspelling (vooraf vastgelegd 6a66994b, binnen { "3" } dB) is niet uitgevoerd omdat de antennepositie en -richting van F8.1 at

seg-143f3f1cc521 = Jamming-veerkracht bij GNSS-uitval is MODELLED, niet extern getoetst: gecontroleerd tegen zijn eigen gesloten-vorm- of analytische identiteit — dat vangt transcriptie- en coëfficiëntfouten, maar is geen externe referentie. (verificatiematrix (docs/MODELLED-RATIONALE.md))

seg-1f17ef6a853e = Scenariokind van de engine v{ $version }, familie <a1>Maan en cislunair</a1>. Adviserend: analyse-uitvoer van een onderzoeks- en engineeringhulpmiddel, geen typegoedgekeurde navigatieapparatuur en geen veiligheidskritieke dienst. Elk label hier is dat van de engine of van de verificatiematrix; een kind is MODELLED tenzij de matrix anders zegt (hoe een label wordt verdiend: de sectie Evidence van de README).

seg-1c1eeb2dcaa0 = Familiepagina: <a1>Maan en cislunair</a1>

seg-619127334cf3 = Geen rij van de matrix noemt dit kind bij naam; het label op het resultaat is dat van de engine zelf, hierboven.

seg-a3697ad561db = Hz

seg-9521a296d617 = dBi

seg-c14d2343d802 = Bron: <c1/>

seg-9c0b5e933472 = <c1/> (scenariosoort)

seg-004c56ded47f = Aanvalsoppervlak voor signaalbeveiliging bij navigatie op het maanoppervlak (P1): voegt de open analyses van signaalbeveiliging samen tot één run die via het binaire bestand bereikbaar is. Rapporteert ({ "1" }) het ontvangen AFS-vermogen en het vermogens-OVERSCHOT ten opzichte van een terrestrische GPS-referentie, plus de gevoeligheidsband van 12-18 dB als een echte meerassige sweep over de linkinvoer (referentieniveau x EIRP x schuine afstand) met de afstemming van de lineaire factor van 25x afgerond / 28x niet afgerond. HERZIEN (regel R4): dit rapporteerde een vermogens-TEKORT van { "15.6" } dB en een factor 32x/36x totdat de GPS-referentie werd gecorrigeerd van -125 / -128.5 (de dBm-cijfers) naar -155 / -158.5 dBW, de ICD-GPS-200-waarden die de jammingmodule altijd heeft gehanteerd. Het teken keert om: het gemodelleerde AFS-signaal op de maan is { "14.4" } dB STERKER dan terrestrische GPS L1 C/A, niet zwakker. Het ontvangen vermogen zelf is geen bit verschoven, en de lineaire factor is de oude gedeeld door precies { "1000" }, wat precies de dBm-naar-dBW-offset van { "30" } dB is; ({ "2" }) het vereiste zendvermogen van de aanvaller om te spoofen (J/S = { "3" } dB) en om te blokkeren (J/S = { "30" } dB) op elke afstand, het omgekeerde van de J/S-link; ({ "3" }) de baanvoetafdruk voor opvang onder een echt antennepatroon met uniforme apertuur (Airy [{ "2" } J1(x)/x]^{ "2" }), een door de hoogte begrensde sub-hemisferische kap waarvan de rand NIET wordt opgevangen; ({ "4" }) een berekende uitkomst van het intrekken van de spoofopvang door de volglus (sleept een spoofer met dezelfde code bij een gegeven vermogensvoordeel en codeoffset de DLL/PLL daadwerkelijk mee) in plaats van de beweerde drempel van { "3" } dB; ({ "5" }) het geometrische horizonbereik op een luchtloos hemellichaam van een verhoogde oppervlaktezender; en ({ "6" }) het OSNMA/TESLA-authenticatiebudget ({ "20" } bit/s overhead = ~{ "40" } % van een AFS-navigatiebericht van { "50" } bit/s, vertraging bij sleutelvrijgave, { "2" }^-40 vervalsing). Een lege body reproduceert de P1-basislijn; elke invoer heeft een standaardwaarde en kan worden overschreven. VALIDATED deelresultaten dragen de onafhankelijke referentie van hun bronmodule (dB-radiometrie in gesloten vorm; omgekeerde J/S-heen-en-terugreis; Airy-patroon ten opzichte van Bessel uit A&S en de geometrie van de bolkap; DLL/PLL-intrekking ten opzichte van Kaplan & Hegarty; identiteit van de bolvormige raaklijnhorizon ten opzichte van eo_payload; veldafmetingen volgens de OSNMA SIS-ICD). MODELLED: de representatieve geometrie- en vermogensgrootten en de specifieke celwaarden van de opvangkaart. Geen gecertificeerd beveiligingsproduct.

seg-e5edd5b9ef27 = Eén run van <c1/> vat zich samen als: lunar-attack-surface | AFS -140.6 dBW, overschot { "14.4" } dB (band -17.9–-12.0, { "25" }×/28× overschot) | spoof@{ "1000" } m { "0.000" } W | voetafdruk { "3" }% kap, rand onwaar | spoofopvang waar (lock { "0.00" } s) | masttoereik { "21.0" } km | OSNMA { "20" } bit/s ({ "40" }% van { "50" } bit/s), { "30" } s vertraging | voetafdruksweep 7x5 (hoogte 20-500 km x HPBW 1.83-29.20 deg), opvang 0.6-42.9% | rand NIET bereikt op dit raster (beste -0.8 dB, { "3.8" } dB tekort; vereist { "19.8" } dBW tegen { "16.0" } dBW)

seg-781a7094b955 = Optionele velden: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>, <c19/>, <c20/>, <c21/>, <c22/>, <c23/>, <c24/>, <c25/>, <c26/>, <c27/>, <c28/>

seg-87e0c97de011 = Het voorbeeld <c1/> stelt onder meer in:

seg-6ea8f1132b57 = lineair

seg-8b701f465117 = log

seg-de295af20c55 = De grafiek die de engine schrijft voor scenarios/lunar-attack-surface.toml, soort lunar-attack-surface

seg-c853e3e832c0 = <b>MODELLED</b> Tweeassige sweep van de naar patroon gewogen, door de hoogte begrensde opvangvoetafdruk op het oppervlak over zenderhoogte en schotelafmeting, uitgegeven als één rij per werkpun. Onafhankelijke referentie (InternalConsistency): Verzamelingsinclusie: de verhouding tussen stoorsignaal en signaal komt binnen als een uniforme offset in decibel, zodat de opgevangen verzameling bij een hoger zendvermogen de verzameling bij een lager vermogen bevat en de fractie alleen kan stijgen -- een eigenschap die het Airy-patroon NIET geeft in bundelbreedte of hoogte, waar het opgevangen gebied uiteenvalt in ringen en de fractie echt niet-monotoon is. Geen gepubliceerde tabel geeft de opgevangen schijffractie van een maanbaan

seg-d11486381332 = MODELLED: de representatieve geometrie- en vermogensgrootten en de specifieke celwaarden van de opvangkaart. (soortencatalogus (<c1/>))

seg-95be70748647 = De opvangvoetafdruk als functie van hoogte en bundelbreedte is MODELLED, niet getoetst aan een onafhankelijke externe referentie: gecontroleerd aan de hand van de eigen gesloten-vorm- of analytische identiteit; dit vangt transcriptie- en coëfficiëntfouten op, maar is geen externe onafhankelijke referentie. (verificatiematrix (docs/MODELLED-RATIONALE.md))

seg-1a1799e01ac4 = <s1>Vorige</s1>link-budget

seg-4b0efe4b9b85 = <s1>Volgende</s1>lunar-beacon

seg-ca1c7e92b98e = <s1>Vorige</s1>lunar-ascent
