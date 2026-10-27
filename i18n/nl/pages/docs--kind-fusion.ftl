# docs--kind-fusion: translations (nl)

seg-03442e4be82d = Microchip SA65 / SA.45s CSAC-gegevensblad sigma_y(1s)={ "3e-10" }

seg-51362910dcb7 = { "2" } meegeleverde scenario's gebruiken dit kind; de overige staan in <a1><c1/></a1>.

seg-f4cf8b629797 = Onderwerppagina: <a1>INTEGRITY.md</a1>

seg-98151954f217 = false

seg-be831b52a339 = en { "4" } meer in de matrix.

seg-f70076ea4a77 = <b>VALIDATED</b> Allan-/gemodificeerde/Hadamard-deviatie + machtswetruisidentificatie met χ²-betrouwbaarheidsintervallen. Onafhankelijke referentie (ExternalDataset): NIST SP { "1065" } (Riley) / referentiedeviaties van Stable32 op NBS14

seg-5278ccdaf16f = <b>MODELLED</b> Gesloten-vorm-groei van de driftfout tijdens coasting + holdover-tot-drempel; kwantumklasseklokken. Onafhankelijke referentie (ReferenceImpl): Recursie van de covariantie van clock_state in meerdere stappen (kruiscontrole binnen dezelfde codebase); de onderliggende kernel voor coast-variantie en holdover-inversie is extern getoetst tegen scipy (zie 'Clock-holdover coast-variance & threshold inversion'). De holdovercijfers per klasse met rode-ruisbodem blijven MODELLED

seg-3ea0aa9b3907 = <b>MODELLED</b> 3-toestanden (fase/frequentie/drift) van-Loan-Kalmanklok, Joseph-gestabiliseerd. Onafhankelijke referentie (ReferenceImpl): filterpy { "1.4.5" } KalmanFilter (R. Labbe, MIT), met F via scipy.linalg.expm en Q via de Van-Loan-blokmatrix van { "1978" } — een onafhankelijke referentie-implementatie die het volledige filtertraject van kshana reproduceert. Consistentie tussen implementaties: de klokfysica en de Allan-kalibratie zijn niet extern getoetst, dus dit blijft MODELLED. { "0.30" } externe vergelijking, een bevinding (blijft MODELLED): op IGS final { "30" } s-klokken van { "11" } GPS Blo

seg-e12f672ae71d = Klok-holdover bij GNSS-uitval is MODELLED, niet extern getoetst: gecontroleerd tegen een afzonderlijke implementatie in dezelfde codebase — onafhankelijk van de geteste eenheid, maar niet extern gezaghebbend. (verificatiematrix (docs/MODELLED-RATIONALE.md))

seg-8de95b3a9229 = Schatting van de toestand van de boordklok is MODELLED, niet extern getoetst: gecontroleerd tegen een afzonderlijke implementatie in dezelfde codebase — onafhankelijk van de geteste eenheid, maar niet extern gezaghebbend. (verificatiematrix (docs/MODELLED-RATIONALE.md))

seg-e4b64d7277da = Spoofingdetectie is MODELLED, niet extern getoetst: een deelclaim wordt extern gecontroleerd, maar de hele mogelijkheid is samengesteld uit gemodelleerde onderdelen, dus de mogelijkheid blijft gemodelleerd. (verificatiematrix (docs/MODELLED-RATIONALE.md))

seg-4de09fe367df = Bron: <c1/>

seg-53e498cffeba = <c1/> (scenariosoort)

seg-7b2721b7588d = Scenariosoort van de engine v{ $version }, familie <a1>Inertiële, fusie- en kwantumsensoren</a1>. Adviserend: uitvoer van een analyse door een onderzoeks- en engineeringhulpmiddel, geen typegoedgekeurde navigatieapparatuur en geen safety-of-life-dienst. Elk label hier is van de engine of van de verificatiematrix; een soort is MODELLED tenzij de matrix anders vermeldt (hoe een label wordt verdiend: de sectie Evidence van de README).

seg-ec26df467b88 = Gezamenlijke Kalman-sensorfusie voor PNT op dezelfde hybride invoer.

seg-25708bf88728 = Eén run van <c1/> vat samen als: scenario c8eac911bbe0 | fused | quantum PNT-holdover 6600s (t 6600s/p 6600s) integriteit { "1.000" } beveiliging n/a (no attack) | classical PNT-holdover 1330s (t 1330s/p 6600s) integriteit { "0.973" } beveiliging n/a (no attack)

seg-dba20bb12cda = Verplichte velden: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>

seg-3d5cae65f093 = Optionele velden: <c1/>

seg-56bca36cabba = Het voorbeeld <c1/> stelt onder meer in:

seg-195347c63a8a = m/s^{ "2" }

seg-5d3f15c0688a = Kwartsaccelerometer van navigatieklasse; illustratieve ruis-dr

seg-3a1d8c59a4c9 = (m/s^{ "2" })^2/Hz

seg-6ddd8a067e26 = Koudeatoomaccelerometer, lage velocity-random-walk bij lange tau;

seg-cc7a61264c3f = (m/s^{ "2" })^2/s

seg-e79eecc14bea = Kwartsaccelerometer van navigatieklasse; i

seg-c8a1c797f4b1 = De grafiek die de engine schrijft voor scenarios/fusion-pnt.toml, soort fusion

seg-5c031aaa3a33 = MODELLED { "4" } · VALIDATED { "4" }: de rijen van de <a1>verificatiematrix</a1> die deze soort noemen.

seg-46c0903ff7b5 = <b>VALIDATED</b> Een epochetoestand [r,v] herstellen uit afstanden tot grondstations met een Gauss–Newton-batchdifferentiaalcorrector en een sequentieel filter, over een tweelichamen-+J2-krachtmodel Tests: <a1>batch_sequential_orbit_determination_reference.rs</a1>.

seg-44f77aaf9d7e = <b>MODELLED</b> Error-state-EKF over { "15" } INS-toestanden, een klok van de ontvanger met twee toestanden en één float-draaggolfambiguïteit per gevolgde satelliet; pseudorange, draaggolffase en optionele range rate van een SGP4-Walker-constellatie (lichttijd en Sagnac), Klobuchar an Tests: <a1>fusion_carrier_tc.rs</a1>.

seg-509f93c7e9ce = <b>MODELLED</b> Drie gnss-ins-scenario's op de trajectbibliotheek (een vaartuig dat met { "8" } m/s zigzagt met een uitval van vijf minuten; een trein door een insnijding met twee satellieten en een tunnel; een vliegtuig waarvan de uitval een bocht met 25 graden rolhoek omvat) en de optionele van het pakket Tests: <a1>gnss_ins_packs.rs</a1>.

seg-e0633b308e4e = <b>MODELLED</b> Eén gestapeld Kalman-filter over positie, snelheid, klokfase en frequentie, gevoed met pseudoranges die positie en klok koppelen (Joseph-vormupdates die de kruiscovariantie meedragen); een 1-DOF-variant uitgebreid met een constante accelerometer-bias s Tests: <a1>fusion_coupled_filters.rs</a1>.

seg-451a304052c4 = <b>MODELLED</b> Koudeatoom-interferometeraccelerometer uit eerste principes (k_eff·T², QPN). Onafhankelijke referentie (ExternalDataset): Gepubliceerde numerieke vectoren uit primaire CAI-artikelen (Cheinet { "2008" }-overdrachtsfunctie; Peters/Freier-gevoeligheid): k_eff·T² exact gereproduceerd, shotruis-ASD een eenzijdige ondergrens binnen ~{ "2" }× van elk gepubliceerd instrument (echte apparaten hebben technische ruis boven de kwantumondergrens). Een bandbreedte, geen gelijkwaardigheid. { "0.30" } ronde { "2" } (vooraf vastgelegd fcb9ac64), een bevinding (blijft MODELLED): de alleen-QPN-rotatieruis tegenover de gemeten Gauguet et al.

seg-7e95210bcc48 = <b>MODELLED</b> Samengesteld positiebudget van bias + schaalfactor + VRW + stabiliteitsverval over holdover. Onafhankelijke referentie (ReferenceImpl): Onafhankelijke numpy-Monte-Carlo-SDE-integratie van dubbel geïntegreerde witte-versnellingsruis (valideert de analytische VRW-variantie met een werkelijk onafhankelijk algoritme) + een gepubliceerde ankerwaarde van Groves { "2013" } voor de bias- en schaalfactortermen; de CAI-apparaatcijfers kwantificeren hardware van partners en blijven MODELLED

seg-9955b1b1c018 = De prestaties van een kwantuminertiaalsensor zijn MODELLED, niet getoetst aan een onafhankelijke externe referentie: een deelclaim is extern gecontroleerd, maar de hele mogelijkheid is samengesteld uit gemodelleerde onderdelen, dus de mogelijkheid blijft gemodelleerd. (verificatiematrix (docs/MODELLED-RATIONALE.md))

seg-5fef5e8cc64e = De veerkracht van kwantuminertiale koppelnavigatie is MODELLED, niet getoetst aan een onafhankelijke externe referentie: gecontroleerd tegen een afzonderlijke implementatie in ditzelfde codebestand, onafhankelijk van het geteste onderdeel maar niet extern gezaghebbend. (verificatiematrix (docs/MODELLED-RATIONALE.md))

seg-f7f12029e0ec = Familiepagina: <a1>Inertiële, fusie- en kwantumsensoren</a1>

seg-a849735fcc6e = Onderwerppagina: <a1>LEO-PNT-FUSION.md</a1>

seg-c894aa7d9585 = <s1>Vorige</s1>ephemeris

seg-d14a7850df1c = <s1>Volgende</s1>gnss-ins
