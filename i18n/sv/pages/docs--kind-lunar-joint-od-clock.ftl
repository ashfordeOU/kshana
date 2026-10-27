# docs--kind-lunar-joint-od-clock: translations (sv)

seg-37d29d8303fe = km

seg-1f17ef6a853e = Scenariotyp i motor v{ $version }, familj <a1>Måne och cislunart</a1>. Rådgivande: analysutdata från ett forsknings- och ingenjörsverktyg, inte typgodkänd navigationsutrustning och inte en livräddande säkerhetstjänst. Varje etikett här är motorns eller verifieringsmatrisens; en typ är MODELLED om inte matrisen säger något annat (hur en etikett förtjänas: avsnittet Evidens i README).

seg-1c1eeb2dcaa0 = Familjesida: <a1>Måne och cislunart</a1>

seg-619127334cf3 = Ingen matrisrad nämner den här typen vid namn; etiketten på dess resultat är motorns egen, ovan.

seg-593938ee5995 = Källa: <c1/>

seg-d54a85227f43 = <c1/> (scenariotyp)

seg-200e58e189c2 = Modellerad gemensam estimator i batch för lunar banbestämning med flera tekniker + klocka på ett SIMULERAT nätverk: en Gauss-Newton-anpassning av en ögonblicksbild som sammanväger geodetiska VLBI-fördröjningar med jordbaslinjer, lunart lokala avstånd mellan station och satellit och avstånd mellan satelliter för att tillsammans återvinna en lunar markstations 3D-position, en liten konstellations positioner och varje enhets klockförskjutning ur en injicerad referens. Det ärliga huvudresultatet — VLBI gör stationens fullständiga 3D-position observerbar där enbart lunart lokal avståndsmätning lämnar en svagt observerad riktning — redovisas som kontrasten i stationsfel med respektive utan VLBI. MODELLED simulerad återvinning i sluten slinga (referensen delar observationsmodell), deterministisk (frö), INTE validerad med verkliga data; ingen propagering med kraftmodell inne i lösaren; inget TRL, inget flygarv och inget stöd från någon myndighet.

seg-6419390eeae4 = En körning av <c1/> sammanfattas som: lunar-joint-od-clock | { "3" } sat., { "6" } jordstationer | stationens 3D-fel med VLBI { "3.54" } m jämfört med enbart avstånd { "2184.02" } m ({ "617.5" }× skarpare) | sat. pos. RMS { "2.20" } m | stationsklockfel { "2.87e-10" } s | obs 40/16 parametrar

seg-be3bcad756cc = Valfria fält: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>

seg-ef164af52468 = Exemplet <c1/> anger bland annat:

seg-6f788a1278b9 = 1/({ "10" }^{ "6" } m)^{ "2" }

seg-cfa051b87e59 = Diagrammet som motorn skriver för scenarios/lunar-joint-od-clock.toml, typ lunar-joint-od-clock

seg-4c6914c162d1 = <b>VALIDATED</b> Batchfusion av VLBI + lunart lokalt avstånd + avstånd mellan satelliter för att återvinna positioner och klockor för station och konstellation. Oberoende referens (ExternalDataset): P2: numpy { "2.4.6" } (numpy.linalg.lstsq med LAPACK gelsd, numpy.linalg.inv; BSD-3) räknar om varje Gauss-Newton-steg, den konvergerade viktade minsta kvadrat-lösningen, de formella sigmavärdena och stationsfelet på de incheckade jakobianerna och observationerna för sex simulerade nätverk, förhandsregistrerad (5094bc31) vid max({ "1e-8" }, { "100" } kappa eps) relativt. Den första körningen misslyckades för nätverket utan VLBI ({ "6.1e-7" } mot { "1e-8" }, en normalekvation

seg-5b3f6008f5a7 = <b>VALIDATED</b> Fisher-information M=HᵀWH, Cramér–Rao-gräns, observerbarhetsrang / nollrum för datumdefekt (Moore–Penrose-pseudoinvers) och D/A/E/T-optimal experimentutformning. Oberoende referens (ExternalDataset): NumPy { "2.4.1" } (numpy.linalg.eigh / .inv; BSD-3-Clause, LAPACK-baserad) — en oberoende auktoritet från tredje part som beräknar samma entydigt definierade egenvärden, Cramér–Rao-kovarians σ²(XᵀX)⁻¹ och GNSS-faktorer för försämring av precision med en annan algoritm (LAPACK divide-and-conquer + LU) än Kshanas cykliska Jacobi-svep och spektrala pseudoinvers; överensstämmande till { "1e-9" }. Samma externa biblioteksklass validerar redan D

seg-af12da412a10 = <b>MODELLED</b> Observerbarhet med Fisher-information för den gemensamma lunara lösningen: utan jordbaslinjer ligger det absoluta referenssystemsdatumet i nollrummet för HᵀWH (stationens position oobs. Oberoende referens (InternalConsistency): Analytisk datumdefektstruktur — det oobserverbara läget för det absoluta referenssystemet ligger i nollrummet för Fisher-informationen (sluten form), rangtröskeln stämmer med den publicerade motiveringen för 3-stationsutformningen, och estimatorn når den resulterande CRLB i Monte Carlo. Den lunara geometrin är i sig ett representativt nätverk (inte en flugen efemerid), så raden förblir MODELLED; den underliggande FIM/CRLB-motorn kontrolleras mot

seg-865ba2668582 = MODELLED simulerad återvinning i sluten slinga (referensen delar observationsmodell), deterministisk (frö), INTE validerad med verkliga data; ingen propagering med kraftmodell inne i lösaren; inget TRL, inget flygarv och inget stöd från någon myndighet. (typkatalog (<c1/>))

seg-a0d4350a1c66 = Ärlighet: MODELLED simulerad återvinning i sluten slinga. En injicerad referens avbildas på syntetiska observabler genom SAMMA geometrimodell som lösaren inverterar, gaussiskt brus från ett frö läggs till, och estimatorn återvinner den injicerade referensen inom bruset. Den oberoende referensen är intern konsistens (återvinning av referensen + realism i NEES-kovariansen), INTE validering med verkliga data. Det finns ingen propagering med kraftmodell inne i lösaren — sate (kommentar i scenariofilen, rad { "24" } till { "29" })

seg-1465694e7e4f = Lunar observerbarhet för absolut station (datumdefekt) är MODELLED, inte validerad: kontrollerad mot sin egen slutna eller analytiska identitet — fångar avskrivnings- och koefficientfel, men är ingen extern oberoende referens. (verifieringsmatris (docs/MODELLED-RATIONALE.md))

seg-e6962535ee72 = <s1>Föregående</s1>lunar-jamming

seg-2ef5c8112d1b = <s1>Nästa</s1>lunar-llr-datum
