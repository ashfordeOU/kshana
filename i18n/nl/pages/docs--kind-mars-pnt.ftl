# docs--kind-mars-pnt: translations (nl)

seg-debc2f07db78 = true

seg-11e8c29ecb45 = Scenariokind van de engine v{ $version }, familie <a1>Constellaties, dekking en geometrie</a1>. Adviserend: analyse-uitvoer van een onderzoeks- en engineeringhulpmiddel, geen typegoedgekeurde navigatieapparatuur en geen veiligheidskritieke dienst. Elk label hier is dat van de engine of van de verificatiematrix; een kind is MODELLED tenzij de matrix anders zegt (hoe een label wordt verdiend: de sectie Evidence van de README).

seg-45259ad33a01 = <b>MODELLED</b> Het kind <c1/>: een orbiter of een lander op het oppervlak rond een bij naam gekozen lichaam navigeert met eenweg-pseudoafstanden van een Walker-navigatieconstellatie rond het lichaam (tweelichamenbanen met de seculaire J2-drift van het lichaam, een onbekende gebruikersk

seg-a4f1e7d2041e = Familiepagina: <a1>Constellaties, dekking en geometrie</a1>

seg-670191cf797f = Onderwerppagina: <a1>SOLAR-SYSTEM.md</a1>

seg-3ea0aa9b3907 = <b>MODELLED</b> 3-toestanden (fase/frequentie/drift) van-Loan-Kalmanklok, Joseph-gestabiliseerd. Onafhankelijke referentie (ReferenceImpl): filterpy { "1.4.5" } KalmanFilter (R. Labbe, MIT), met F via scipy.linalg.expm en Q via de Van-Loan-blokmatrix van { "1978" } — een onafhankelijke referentie-implementatie die het volledige filtertraject van kshana reproduceert. Consistentie tussen implementaties: de klokfysica en de Allan-kalibratie zijn niet extern getoetst, dus dit blijft MODELLED. { "0.30" } externe vergelijking, een bevinding (blijft MODELLED): op IGS final { "30" } s-klokken van { "11" } GPS Blo

seg-8de95b3a9229 = Schatting van de toestand van de boordklok is MODELLED, niet extern getoetst: gecontroleerd tegen een afzonderlijke implementatie in dezelfde codebase — onafhankelijk van de geteste eenheid, maar niet extern gezaghebbend. (verificatiematrix (docs/MODELLED-RATIONALE.md))

seg-3bc1761c76ab = { "3" } meegeleverde scenario's gebruiken dit kind; de overige staan in <a1><c1/></a1>.

seg-4be479b81f39 = <s1>Vorige</s1>lunar-vlbi

seg-2854e6a75833 = <s1>Volgende</s1>moonlight-service-volume

seg-c68502b9d675 = Bron: <c1/>

seg-46072326d616 = <c1/> (scenariosoort)

seg-3f749aef8d89 = PNT op Mars in de diepe ruimte: een gesimuleerde MARCONI-relayconstellatie (areostationaire + hellende relays die eenrichting uitzenden + tweerichting doorgeven aan een station in de diepe ruimte) navigeert een referentiegebruiker (transfer | lmo | surface) via de gezamenlijke radiometrische fusieschatter voor eenrichting en tweerichting. Rapporteert per epoch geometrie en zichtbaarheid, de behaalde RMS ten opzichte van de referentie en de formele covariantie (1σ / 3σ positie) — een eerlijke gesimuleerde kwaliteitsmaat, GEEN gecertificeerd beschermingsniveau.

seg-0254f9bd0ee6 = Eén run van <c1/> vat zich samen als: mars-pnt 5aad87fcc94a | lmo-gebruiker, uso-klok | { "5" } relays (gemiddeld { "3.1" } in zicht) | geconvergeerde pos-RMS { "0.25" } m, formele 1σ { "0.31" } m (3σ { "0.93" } m — covariantie-kwaliteitsmaat, geen gecertificeerd PL) | klokfrequentie-σ { "3.71e-13" } | cov-PD true

seg-8eb513e7aeea = Optionele velden: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>

seg-5a9640a3f9b4 = Het voorbeeld <c1/> stelt onder meer in:

seg-8e0fecea19fc = uso

seg-a16f2332397c = lmo

seg-c564dca90854 = De grafiek die de engine schrijft voor scenarios/mars-pnt-lmo.toml, soort mars-pnt

seg-83c3a84f6b98 = <b>VALIDATED</b> Herstel van een epochtoestand [r,v] uit afstanden van grondstations via een Gauss–Newton-batchcorrector voor differentiële correctie en een sequentieel filter, over een tweelichamen+J2-krachtmodel. Onafhankelijke referentie (ExternalDataset): Orekit { "12.2" } (CS GROUP, Apache-2.0) BatchLSEstimator (Levenberg–Marquardt) + KalmanEstimator (EKF) — een onafhankelijke schattingsbibliotheek van een derde partij op een afgestemd krachtmodel; herstelde epochtoestand + RMS van het residu na de fit komen overeen tot <{ "1e-3" } m zonder ruis en <{ "3" } m bij een ruisvloer van { "5" } m

seg-6d595f01ffcc = <s1>Volgende</s1>mission-thread
