# docs--kind-hybrid: translations (nl)

seg-03442e4be82d = Microchip SA65 / SA.45s CSAC-gegevensblad sigma_y(1s)={ "3e-10" }

seg-f4cf8b629797 = Onderwerppagina: <a1>INTEGRITY.md</a1>

seg-98151954f217 = false

seg-f70076ea4a77 = <b>VALIDATED</b> Allan-/gemodificeerde/Hadamard-deviatie + machtswetruisidentificatie met χ²-betrouwbaarheidsintervallen. Onafhankelijke referentie (ExternalDataset): NIST SP { "1065" } (Riley) / referentiedeviaties van Stable32 op NBS14

seg-5278ccdaf16f = <b>MODELLED</b> Gesloten-vorm-groei van de driftfout tijdens coasting + holdover-tot-drempel; kwantumklasseklokken. Onafhankelijke referentie (ReferenceImpl): Recursie van de covariantie van clock_state in meerdere stappen (kruiscontrole binnen dezelfde codebase); de onderliggende kernel voor coast-variantie en holdover-inversie is extern getoetst tegen scipy (zie 'Clock-holdover coast-variance & threshold inversion'). De holdovercijfers per klasse met rode-ruisbodem blijven MODELLED

seg-3ea0aa9b3907 = <b>MODELLED</b> 3-toestanden (fase/frequentie/drift) van-Loan-Kalmanklok, Joseph-gestabiliseerd. Onafhankelijke referentie (ReferenceImpl): filterpy { "1.4.5" } KalmanFilter (R. Labbe, MIT), met F via scipy.linalg.expm en Q via de Van-Loan-blokmatrix van { "1978" } — een onafhankelijke referentie-implementatie die het volledige filtertraject van kshana reproduceert. Consistentie tussen implementaties: de klokfysica en de Allan-kalibratie zijn niet extern getoetst, dus dit blijft MODELLED. { "0.30" } externe vergelijking, een bevinding (blijft MODELLED): op IGS final { "30" } s-klokken van { "11" } GPS Blo

seg-e12f672ae71d = Klok-holdover bij GNSS-uitval is MODELLED, niet extern getoetst: gecontroleerd tegen een afzonderlijke implementatie in dezelfde codebase — onafhankelijk van de geteste eenheid, maar niet extern gezaghebbend. (verificatiematrix (docs/MODELLED-RATIONALE.md))

seg-8de95b3a9229 = Schatting van de toestand van de boordklok is MODELLED, niet extern getoetst: gecontroleerd tegen een afzonderlijke implementatie in dezelfde codebase — onafhankelijk van de geteste eenheid, maar niet extern gezaghebbend. (verificatiematrix (docs/MODELLED-RATIONALE.md))

seg-e4b64d7277da = Spoofingdetectie is MODELLED, niet extern getoetst: een deelclaim wordt extern gecontroleerd, maar de hele mogelijkheid is samengesteld uit gemodelleerde onderdelen, dus de mogelijkheid blijft gemodelleerd. (verificatiematrix (docs/MODELLED-RATIONALE.md))

seg-7b2721b7588d = Scenariosoort van de engine v{ $version }, familie <a1>Inertiële, fusie- en kwantumsensoren</a1>. Adviserend: uitvoer van een analyse door een onderzoeks- en engineeringhulpmiddel, geen typegoedgekeurde navigatieapparatuur en geen safety-of-life-dienst. Elk label hier is van de engine of van de verificatiematrix; een soort is MODELLED tenzij de matrix anders vermeldt (hoe een label wordt verdiend: de sectie Evidence van de README).

seg-dba20bb12cda = Verplichte velden: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>

seg-195347c63a8a = m/s^{ "2" }

seg-3a1d8c59a4c9 = (m/s^{ "2" })^2/Hz

seg-cc7a61264c3f = (m/s^{ "2" })^2/s

seg-e0633b308e4e = <b>MODELLED</b> Eén gestapeld Kalman-filter over positie, snelheid, klokfase en frequentie, gevoed met pseudoranges die positie en klok koppelen (Joseph-vormupdates die de kruiscovariantie meedragen); een 1-DOF-variant uitgebreid met een constante accelerometer-bias s Tests: <a1>fusion_coupled_filters.rs</a1>.

seg-451a304052c4 = <b>MODELLED</b> Koudeatoom-interferometeraccelerometer uit eerste principes (k_eff·T², QPN). Onafhankelijke referentie (ExternalDataset): Gepubliceerde numerieke vectoren uit primaire CAI-artikelen (Cheinet { "2008" }-overdrachtsfunctie; Peters/Freier-gevoeligheid): k_eff·T² exact gereproduceerd, shotruis-ASD een eenzijdige ondergrens binnen ~{ "2" }× van elk gepubliceerd instrument (echte apparaten hebben technische ruis boven de kwantumondergrens). Een bandbreedte, geen gelijkwaardigheid. { "0.30" } ronde { "2" } (vooraf vastgelegd fcb9ac64), een bevinding (blijft MODELLED): de alleen-QPN-rotatieruis tegenover de gemeten Gauguet et al.

seg-9955b1b1c018 = De prestaties van een kwantuminertiaalsensor zijn MODELLED, niet getoetst aan een onafhankelijke externe referentie: een deelclaim is extern gecontroleerd, maar de hele mogelijkheid is samengesteld uit gemodelleerde onderdelen, dus de mogelijkheid blijft gemodelleerd. (verificatiematrix (docs/MODELLED-RATIONALE.md))

seg-5fef5e8cc64e = De veerkracht van kwantuminertiale koppelnavigatie is MODELLED, niet getoetst aan een onafhankelijke externe referentie: gecontroleerd tegen een afzonderlijke implementatie in ditzelfde codebestand, onafhankelijk van het geteste onderdeel maar niet extern gezaghebbend. (verificatiematrix (docs/MODELLED-RATIONALE.md))

seg-f7f12029e0ec = Familiepagina: <a1>Inertiële, fusie- en kwantumsensoren</a1>

seg-d91dc5633e67 = Bron: <c1/>

seg-3b43d9c5624d = <c1/> (scenariosoort)

seg-22cd963c7042 = Hybride PNT-slotsteen: klok + IMU + ondersteuning met tijdoverdracht.

seg-166be08d5276 = Eén run van <c1/> vat samen als: scenario f33d734ecc51 | quantum PNT-holdover 6600s (t 6600s/p 6600s) integriteit { "0.998" } beveiliging n/a (no attack) | classical PNT-holdover 350s (t 6600s/p 350s) integriteit { "1.000" } beveiliging n/a (no attack)

seg-5a70fcb097dc = Optionele velden: geen

seg-f33278986879 = Het voorbeeld <c1/> stelt onder meer in:

seg-7bebd09c614b = Kwartsaccelerometer van navigatieklasse (Honeywell QA-2000 / G

seg-4f5fd1bc8a4e = Exail hybride kwantumaccelerometer-triade, biasstabiliteit { "5.8" }

seg-49bff8dc860e = Kwartsaccelerometer van navigatieklasse (H

seg-52378a7b074c = De grafiek die de engine schrijft voor scenarios/hybrid-pnt.toml, soort hybrid

seg-a1810bbca337 = <b>MODELLED</b> Tweerichtings-/TWSTFT (Sagnac), GNSS-common-view, PPP; linkjitter→afstand. Onafhankelijke referentie (ExternalDataset): Sagnac-grootte gecontroleerd tegen een gezaghebbende GEPUBLICEERDE WAARDE — N. Ashby, 'Relativity in the GPS', Living Reviews in Relativity { "6" }:{ "1" } ({ "2003" }), Vgl. { "1.29" }: een oostwaartse omloop langs de evenaar levert { "207.4" } ns op (2ωA_E/c²); kshana reproduceert { "207.386" } ns. Onafhankelijk bevestigd door RTKLIB { "2.4.3" } geodist() (Takasu, BSD-2-Clause), dat dezelfde 2Aω/c²-geometrie hanteert. De samengestelde BIPM-TWSTFT-transponder/common-view/

seg-a8beb8dfc757 = Foutbudgettering van tijdoverdracht is MODELLED, niet getoetst aan een onafhankelijke externe referentie: een deelclaim is extern gecontroleerd, maar de hele mogelijkheid is samengesteld uit gemodelleerde onderdelen, dus de mogelijkheid blijft gemodelleerd. (verificatiematrix (docs/MODELLED-RATIONALE.md))

seg-a9c56fc9608a = Onderwerppagina: <a1>MACHINE-INPUTS.md</a1>

seg-cc86939900fe = <s1>Vorige</s1>hybrid-ukf

seg-53b95026bf54 = <s1>Volgende</s1>impairment-eval
