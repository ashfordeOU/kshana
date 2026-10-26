# docs--kinds-mission-analysis-links-and-space-operations: translations (nl)

seg-6e0cb6acc073 = VALIDATED

seg-b03d56f501c3 = Type

seg-cb9447893c7f = Eén satelliet boven één station: de schuine afstand, elevatie en Es/N0 van elke passage langs de passage, de DVB-S2-MODCOD die bij elke stap is gekozen (drempels van ETSI EN { "302" } 307-1 Table { "13" } plus een implementatiemarge) en het datavolume dat ACM verplaatst tegen de basislijn met constante codering die bij het masker sluit. MODELLED.

seg-046f69293874 = De grafiek die de engine schrijft voor scenarios/acm-link.toml, type acm-link

seg-7eff466eb018 = Standregeling van ruimtevaartuigen: een traagheidsgerichte slew van een stijve hub met drie of meer gebalanceerde reactiewielen onder MRP-terugkoppeling (L = -K sigma - P omega), wieltorques met minimale norm begrensd tot de limiet van elke motor, RK4 met een zero-order hold; optioneel gesloten op een multiplicatieve EKF vanuit een gesimuleerde gyro (hoek- en snelheidsrandomwalk) en sterrenzoeker. Rapporteert insteltijd, einde- en piekrichtfout, piekwielsnelheid en -torque, de verzadigde fractie, drift van het impulsmoment en, met de schatter, de standfout en NEES. De lus met ware toestand is VALIDATED tegen Basilisk { "2.9.1" }; de schatter is MODELLED.

seg-08c624d5324d = De grafiek die de engine schrijft voor scenarios/aocs-slew.toml, kind aocs

seg-0cef33b41040 = Aperture duty cycle: het tijdsaandeel navigatie versus communicatie dat een contactplan impliceert voor een pool van stuurbare aperturen. Neemt een contactplan (een lijst van <c1/> aos_s/los_s-vensters, elk met een verzoek om navigatie of communicatie — dezelfde aos_s/los_s-woordenschat die de <c2/>-voorspeller uitgeeft), een aantal aperturen en een ARBITRAGEBELEID (standaard navigatieprioriteit, of communicatieprioriteit, of niet-preëmptief first-come-first-served) en rapporteert de navigatieduty, de communicatieduty, de idle duty en de uitval per sessie — de contacttijd die een sessie vroeg en die geen apertuur bediende. Een exacte intervalsweep over de venstergrenzen, zodat aansluitende vensters nooit concurreren en geen apertuurseconde dubbel wordt geteld; navigatie-, communicatie- en idle-apertuurseconden worden onafhankelijk opgeteld en sluiten tegen apertures*horizon_s. Het rapport vermeldt het opgeloste beleid, de volledige definitie ervan en de definities van duty en uitval, omdat een duty-cijfer dat zonder zijn arbitragebeleid wordt genoemd niet reproduceerbaar is. MODELLED planningsrekenwerk: er wordt geen slew-, hertuning- of omschakeltijd gerekend wanneer een apertuur van dienst of sessie wisselt, er is geen datavolume, bufferstatus, energiebudget of linksluiting die in de beslissing meespeelt, en de contactvensters zijn invoer — hun geometrie is wat ze ook heeft voortgebracht. Geen planningsproduct voor het grondsegment.

seg-a8b38ed8e029 = De grafiek die de engine schrijft voor scenarios/aperture-duty-cycle.toml, kind aperture-duty-cycle

seg-34d041d6bd9f = Vlakke zwaartekrachtbocht-opstijging van een meertrapsvoertuig boven een niet-roterende bolvormige aarde door de US Standard Atmosphere { "1976" } (verticale stijging, pitch-kick, stuwkracht langs de snelheid), waarbij de zwaartekracht-, weerstands-, stuur- en tegendrukverliezen worden geïntegreerd en wordt gecontroleerd of ideale dv min verliezen gelijk is aan de burn-outsnelheid; max-Q, piekversnelling en burn-outtoestand. MODELLED.

seg-ccf2185b0b5e = De grafiek die de engine schrijft voor scenarios/ascent-losses.toml, kind ascent-losses

seg-62c0dda9fc56 = 3-DOF-stand- en richtfoutbudget: het worstcase-verstoringsmoment van de zwaartekrachtgradiënt ((3/2)(μ/R³)ΔI) en een root-sum-square-richtfoutbudget over benoemde 1σ-bijdragers (sensorruis, reactiewieljitter, thermisch, uitlijning) met de dominante term, voor een baanhoogte + spreiding van het lichaamstraagheidsmoment. MODELLED scalair AOCS-budget — een pre-hardwarecomplement op Basilisk/42, geen simulatie van regellus, 6-DoF of flexibele modi.

seg-ad0e72e3b688 = De grafiek die de engine schrijft voor scenarios/attitude-budget.toml, kind attitude-budget

seg-be4e928a5865 = Planning van grondcontacten voor meerdere satellieten boven meerdere stations: schijnbare toegangsvensters (SGP4, aardvast frame IAU 2006/2000A, refractie ITU-R P.834, lichttijd), het DVB-S2-ACM-datavolume van elke passage (drempels van ETSI EN { "302" } 307-1 Table { "13" }) en een conflictvrij schema (één satelliet per antenne met een omschakeltijd, één station per satelliet, prioriteitsgewogen aflevering begrensd tot elke achterstand) door een greedy-methode op marginale waarde, een first-come-basislijn en een exacte branch-and-bound op kleine verzamelingen, met de optimaliteitskloof van de greedy-methode. MODELLED.

seg-e26b549579e2 = De grafiek die de engine schrijft voor scenarios/contact-schedule.toml, kind contact-schedule

seg-b843e2e0a4ee = 3-DoF-puntmassa-atmosferische-intrede boven een roterende bolvormige Aarde of Mars (ballistisch of liftend bij constante rolhoek), RK4, door US76, een exponentiële of de Mars-atmosfeer, met convectieve verwarming van het stuwpunt volgens Sutton-Graves (NASA TR R-376): piekvertraging, warmteflux en dynamische druk, warmtelast, downrange, een energiecontrole in het roterende frame en de gesloten vorm van Allen-Eggers ernaast. De piekvertraging wordt gecontroleerd tegen de gepubliceerde nominale waarde van Stardust; de verwarming is MODELLED.

seg-dbb618cd6357 = De grafiek die de engine schrijft voor scenarios/entry-heating-stardust.toml, kind entry-heating

seg-47b4aea6ed01 = Voetafdruk van een aardobservatiepayload en dekkingsgeometrie (SMAD-ruimtedriehoek): hoekstraal van de Aarde, zwadbreedte, grondafstand van een sample in nadir, maximale toegang buiten nadir, cirkelvormige periode, J2-knoopperiode en equatoriale grondspoorafstand met een vlag voor aaneengesloten dekking, voor een baanhoogte, inclinatie (standaard zonsynchroon) en sensor-FOV/IFOV. MODELLED bolvormige-Aardegeometrie (geen radiometrie/MTF/atmosfeer/jitter/glint); knoopafstand R_e·(ω − Ω̇)·T_nodal met eerste-orde seculaire J2-snelheden.

seg-c2a8332f2ee2 = De grafiek die de engine schrijft voor scenarios/eo-coverage.toml, kind eo-coverage

seg-816bd5a5808a = Radiometrie en beeldkwaliteit van een nadirbeeldvormer: radiantie van een lambertiaanse scène aan de apertuur, de cameravergelijking, signaal en shot-/donker-/lees-/kwantisatieruis en SNR; de systeem-MTF bij Nyquist (diffractie x detector x smear x jitter), de daaruit afgeleide relatieve randrespons, Q = lambda F/p en de GIQE-versie { "4" }-NIIRS zonder MTF-compensatie. MODELLED.

seg-7a4e6215a488 = Lanceer- en stijggeometrie met twee lichamen: lanceerazimut(s) (sin Az = cos i / cos lat), minimaal bereikbare inclinatie, cirkelsnelheid, de oostwaartse bonus van de aardrotatie, Δv voor een dogleg-vlakwijziging wanneer de doelinclinatie lager is dan de breedtegraad van de locatie, en het aantal dagelijkse lanceermogelijkheden. MODELLED geometrie met een bolvormige aarde (geen correctie met snelheidsdriehoek voor de roterende aarde, geen model voor stijg-/weerstandsverlies).

seg-9696283a95ae = De grafiek die de engine schrijft voor scenarios/launch-window.toml, soort launch-window

seg-dbffff25b57f = CCSDS OEM-interoperabiliteitsbrug: importeer een Orbit Ephemeris Message die is geproduceerd door een externe vluchtdynamicatool (GMAT/Orekit/STK geven allemaal OEM af) en rapporteer de segmenten/objecten/referentiestelsels/epochspanne plus een controle op snelheidsconsistentie; zonder invoer doorloopt zij een rondreis met een gegenereerde referentiebaan en rapporteert zij de getrouwheid van import↔export. MODELLED structurele/fysische invoercontrole, GEEN valideringsonderzoek naar de baannauwkeurigheid van de bron.

seg-5db5a7c812ca = De grafiek die de engine schrijft voor scenarios/oem-interop.toml, soort oem-interop

seg-039f77066d97 = Ballistisch terugkeercorridor volgens Allen-Eggers: piekvertraging (onafhankelijk van de ballistische coëfficiënt, V_e^{ "2" } sin|γ|/(2eH)), de snelheid en hoogte bij de piek-g, en de snelheid bij piekverhitting, voor een intreesnelheid/baanhoek/ballistische coëfficiënt door een exponentiële atmosfeer, plus een vlakke puntmassa-integratie van dezelfde ballistische intrede met zwaartekracht, aardkromming en de US Standard Atmosphere { "1976" } (piekvertraging, snelheid, hoogte en tijd bij de piek). MODELLED ballistische intrede (zonder lift); de verhittingsuitvoer is de SNELHEID bij piekverhitting, geen warmtestroom (geen aerothermisch model/TPS-model).

seg-b0109481e8ff = De grafiek die de engine schrijft voor scenarios/reentry.toml, soort reentry

seg-de2448d74c2b = CCSDS 133.0-B Space Packet Protocol-framing: codeer een synthetische TM/TC-pakketstroom (primaire header van 6 octetten + gegevensveld) en rapporteer per pakket de decodering van de header, het totaal aantal octetten en een exacte rondreis van codering↔decodering. Deterministische framing met exacte bitindeling — de interoperabiliteitslaag voor pakketformaten van ruimtevaartorganisaties; GEEN certificering van conformiteit (geen logica voor secundaire header/CRC/segmentatie buiten de vlaggen).

seg-af1cf9aa9938 = De grafiek die de engine schrijft voor scenarios/space-packet.toml, soort space-packet

seg-953188c11165 = Eenrichtings-linkbudget volgens de linkvergelijking van CCSDS { "401" } / DSN 810-005: vrije-ruimtepadverlies, C/N₀, Eb/N₀, marge en sluiting voor een zend-EIRP, ontvangst-G/T, afstand, datasnelheid en band (s|x|ka) ten opzichte van een vereiste Eb/N₀. Een deterministische technische berekening op basis van de aangeleverde invoer (geen gekalibreerd terminaldatablad).

seg-bd375631bc7e = De grafiek die de engine schrijft voor scenarios/link-budget.toml, soort link-budget

seg-4e31c8daf798 = Register

seg-436e412d99fd = MODELLED { "1" } · VALIDATED { "1" }

seg-69ee217ed8e0 = Bron: <c1/>

seg-f5091cbeecbf = Missieanalyse, verbindingen en ruimteoperaties (familie van scenariosoorten)

seg-d0eea6d9d1ad = { "14" } scenariosoorten van de engine v{ $version }. Adviserend: analyse-uitvoer van een onderzoeks- en engineeringhulpmiddel, geen typegoedgekeurde navigatieapparatuur en geen veiligheidsdienst voor mensenlevens. Elk label hier is dat van de engine of van de verificatiematrix; een soort is MODELLED tenzij de matrix anders aangeeft (hoe een label wordt verdiend: het onderdeel Bewijs van de README).

seg-6481dabc9458 = Themapagina's: <a1>ENTRY-EO-ASCENT</a1>, <a2>CONTACT-SCHEDULING</a2>, <a3>AOCS</a3>. Voer er een uit: <c1/>. Alle families: <a4>KINDS.md</a4>.

seg-d6c5a581ffaf = Contactblad met de grafieken die de engine schrijft voor de soorten van de familie Missieanalyse, verbindingen en ruimteoperaties

seg-8d65a4a1948d = Tweelichamen-lanceer- en stijggeometrie: lanceerazimut(en) (sin Az = cos i / cos lat), minimaal bereikbare inclinatie, cirkelsnelheid, de oostwaartse bonus van de aardrotatie, Δv voor vlakwijziging met dogleg wanneer de

seg-dd47e755d262 = Vlakke zwaartekrachtbocht-stijging van een voertuig met meerdere trappen boven een niet-roterende bolvormige Aarde door de US Standard Atmosphere { "1976" } (verticale stijging, pitch-kick, stuwkracht langs de snelheid), met integratie van de zwaartekracht

seg-cc88f37328a3 = Allen-Eggers-corridor voor ballistische terugkeer: piekvertraging (onafhankelijk van de ballistische coëfficiënt, V_e^{ "2" } sin/γ//(2eH)), de snelheid en hoogte bij de piek-g, en de snelheid bij piekverhitting, voor een intreesnelheid

seg-8ad7c34d8c25 = 3-DoF-puntmassa-atmosferische intrede boven een roterende bolvormige Aarde of Mars (ballistisch of met lift bij constante rolhoek), RK4, door US76, een exponentiële of de Mars-atmosfeer, met Sutton-Graves-stagnatie

seg-efe896d3f43b = Voetafdruk- en dekkingsgeometrie van een aardobservatielading (SMAD-ruimtedriehoek): hoekstraal van de Aarde, zwadbreedte, grondresolutie in nadir, maximale toegang buiten nadir, cirkelvormige periode, J2-knooppuntperiode

seg-d3d9652fd8a0 = Radiometrie en beeldkwaliteit van een nadirbeeldvormer: stralingsdichtheid aan de apertuur van een Lambertiaans tafereel, de cameravergelijking, signaal en shot-/donker-/lees-/kwantisatieruis en SNR; de systeem-MTF bij Nyquist (diffractie

seg-1940d5c75a98 = 3-DOF-houdings- en richtfoutbudget: het worstcase-verstoringsmoment door zwaartekrachtgradiënt ((3/2)(μ/R³)ΔI) en een root-sum-square-richtfoutbudget over benoemde 1σ-bijdragers (sensorruis, reactie

seg-e00d18fbb52b = Standregeling van ruimtevaartuigen: een traagheidsgerichte slew van een stijve hub met drie of meer gebalanceerde reactiewielen onder MRP-terugkoppeling (L = -K sigma - P omega), minimale-normwielmomenten begrensd tot elk

seg-496fa280de7b = Eenwegslinkbudget volgens de CCSDS { "401" } / DSN 810-005-linkvergelijking: padverlies in vrije ruimte, C/N₀, Eb/N₀, marge en sluiting voor een zend-EIRP, ontvangst-G/T, afstand, datasnelheid en band (s/x/ka) tegen een

seg-f0aca7ea1ffa = Eén satelliet boven één station: per passage de schuine afstand, elevatie en Es/N0 langs de passage, de bij elke stap gekozen DVB-S2-MODCOD (drempels uit ETSI EN { "302" } 307-1 Table { "13" } plus een implementatiemarge)

seg-44c4890ba07e = Planning van grondcontacten voor meerdere satellieten boven meerdere stations: schijnbare toegangsvensters (SGP4, aardvast IAU 2006/2000A-stelsel, ITU-R P.834-refractie, lichttijd), het DVB-S2-ACM-datavolume o

seg-19ab136e9f9b = Aperture-bezettingsgraad: de verdeling van de tijd tussen navigatie en communicatie die een contactplan impliceert voor een pool van stuurbare aperturen.

seg-ee0c649ca8b2 = CCSDS 133.0-B Space Packet Protocol-framing: codeer een synthetische TM/TC-pakketstroom (primaire header van 6 octetten + gegevensveld) en rapporteer per pakket de headerdecodering, het totaal aantal octetten en een exacte codering↔deco

seg-e561f3a749db = CCSDS OEM-interoperabiliteitsbrug: importeer een Orbit Ephemeris Message die door een extern vluchtdynamicahulpmiddel is geproduceerd (GMAT/Orekit/STK leveren allemaal OEM) en rapporteer de segmenten/objecten/frames/epochspanne plus

seg-1f074d7beccc = Verplichte velden: geen. Optioneel: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>.

seg-8f65824c39c5 = <b>Register:</b> MODELLED. Volledige pagina, met de invoer, resultaten, bewijs en beperkingen: <a1>launch-window</a1>.

seg-2926bde689d3 = Verplichte velden: geen. Optioneel: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>.

seg-66f6489411d0 = <b>Register:</b> MODELLED. Volledige pagina, met de invoer, resultaten, bewijs en beperkingen: <a1>ascent-losses</a1>.

seg-481ce1d98bc7 = Verplichte velden: geen. Optioneel: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>.

seg-fff98550eb48 = <b>Register:</b> MODELLED. Volledige pagina, met de invoer, resultaten, bewijs en beperkingen: <a1>reentry</a1>.

seg-9cf8d4b6064f = Verplichte velden: geen. Optioneel: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>, <c19/>, <c20/>, <c21/>.

seg-84e1bddcbc95 = <b>Register:</b> MODELLED { "1" } · VALIDATED { "1" }. Volledige pagina, met de invoer, resultaten, bewijs en beperkingen: <a1>entry-heating</a1>.

seg-eab43348803e = Verplichte velden: geen. Optioneel: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>.

seg-9c6ce756a89a = <b>Register:</b> VALIDATED. Volledige pagina, met de invoer, resultaten, bewijs en beperkingen: <a1>eo-coverage</a1>.

seg-cd84a7bdbe57 = Verplichte velden: geen. Optioneel: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>, <c19/>, <c20/>, <c21/>.

seg-320d724ac797 = <b>Register:</b> MODELLED. Volledige pagina, met de invoer, resultaten, bewijs en beperkingen: <a1>eo-radiometry</a1>.

seg-905487bf50f1 = Verplichte velden: geen. Optioneel: <c1/>, <c2/>, <c3/>, <c4/>.

seg-14511e367361 = <b>Register:</b> VALIDATED. Volledige pagina, met de invoer, resultaten, bewijs en beperkingen: <a1>attitude-budget</a1>.

seg-540fa1932dad = Verplichte velden: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>. Optioneel: <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>.

seg-6d2e9b9ce87f = <b>Register:</b> MODELLED { "1" } · VALIDATED { "1" }. Volledige pagina, met de invoer, resultaten, bewijs en beperkingen: <a1>aocs</a1>.

seg-3345731b5729 = Verplichte velden: geen. Optioneel: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>.

seg-f8b896b81014 = <b>Register:</b> MODELLED { "1" } · VALIDATED { "1" }. Volledige pagina, met de invoer, resultaten, bewijs en beperkingen: <a1>link-budget</a1>.

seg-e38e356f4b71 = Verplichte velden: geen. Optioneel: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>.

seg-eed876ed5aab = <b>Register:</b> MODELLED. Volledige pagina, met de invoer, resultaten, bewijs en beperkingen: <a1>acm-link</a1>.

seg-5fddd2460fb0 = Verplichte velden: geen. Optioneel: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>.

seg-58d00faa1eda = <b>Register:</b> MODELLED. Volledige pagina, met de invoer, resultaten, bewijs en beperkingen: <a1>contact-schedule</a1>.

seg-5d4f6861f301 = Verplichte velden: geen. Optioneel: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>.

seg-1e06e06d4325 = <b>Register:</b> MODELLED. Volledige pagina, met de invoer, resultaten, bewijs en beperkingen: <a1>aperture-duty-cycle</a1>.

seg-9bb424e01c84 = Verplichte velden: geen. Optioneel: <c1/>, <c2/>, <c3/>, <c4/>.

seg-688071019c9e = <b>Register:</b> VALIDATED. Volledige pagina, met de invoer, resultaten, bewijs en beperkingen: <a1>space-packet</a1>.

seg-03c06f9fdc85 = Verplichte velden: geen. Optioneel: <c1/>.

seg-568c484ce9a0 = <b>Register:</b> VALIDATED. Volledige pagina, met de invoer, resultaten, bewijs en beperkingen: <a1>oem-interop</a1>.

seg-41996765fcf1 = <s1>Vorige</s1>Maan en cislunair

seg-1951c46fe429 = <s1>Volgende</s1>Optische PNT
