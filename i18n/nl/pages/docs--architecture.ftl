# docs--architecture: translations (nl)

seg-e366c6dd500e = Bron: <c1/>

seg-1f25b7fa1187 = { -brand } — Architectuur

seg-b0136a82669c = { -brand } is <b>één engine</b>, in lagen georganiseerd boven een gedeelde kern: de <b>sensorpakketten</b> (klok, inertiaal, tijdoverdracht, hybride); een laag voor <b>astrodynamica / numeriek</b> (analytische SGP4/SDP4 (SGP4: Simplified General Perturbations { "4" }; SDP4: Simplified Deep-space Perturbations { "4" }), een numerieke Cowell-propagator met zijn krachtmodel van zeven verstoringen, manoeuvreontwerp, baanbepaling uit afstanden van grondstations en de fit van het krachtmodel aan precieze efemeriden van instanties); een laag voor <b>tijd en referentiestelsels</b> (IERS-tijdschalen (International Earth Rotation and Reference Systems Service), IAU-precessie–nutatie (International Astronomical Union) 2006/2000A en de CIO-reductie (Celestial Intermediate Origin) GCRS↔ITRS (GCRS: Geocentric Celestial Reference System; ITRS: International Terrestrial Reference System)); een <b>fusie</b>laag (de GNSS/INS-schatters (GNSS: global navigation satellite system; INS: inertial navigation system)); en de lagen voor <b>integriteit, veerkracht, alt-PNT (PNT: positiebepaling, navigatie en tijdsynchronisatie) en maan</b> (RAIM/ARAIM/SBAS (RAIM: receiver autonomous integrity monitoring; ARAIM: advanced receiver autonomous integrity monitoring; SBAS: satellite-based augmentation system), jamming en spoofdetectie in meerdere lagen, map-matching op zwaartekracht/terrein/magnetisme en cislunaire PNT); en de nieuwere lagen <b>LEO-PNT</b> (PNT in een lage baan om de aarde), <b>spectrum</b>, <b>zonnestelsel en constellatieontwerp</b>, <b>nettijdsynchronisatie</b> en <b>campagne</b>, met de rapport-, animatie- en interoperabiliteitsschrijvers die elke run kan gebruiken (§1d). Over al deze lagen heen weet de engine niets van „kwantum” tegenover „klassiek”: hij stuurt <em>foutmodellen</em> van sensoren door een GNSS-uitvalscenario, voert een schatter uit en scoort de uitkomst. Een kwantumapparaat en een klassiek apparaat worden dus op hetzelfde scenario vergeleken, en verschillen alleen in hun (gepubliceerde, geciteerde) foutparameters en hun onafhankelijke ruisseeds.

seg-02110864419e = Dit document verzamelt de structurele en gedragsdiagrammen. §{ "1" } is de kern met sensorpakketten; §1a brengt de sindsdien toegevoegde lagen voor astrodynamica, fusie en alt-PNT in kaart; §1b–§1d de studie-, domein- en uitvoerlagen. Voor gebruik zie de <a1>README</a1>; voor wat wel en niet is getoetst zie <a2>VALIDATION</a2>; voor de rijpheidstabel per mogelijkheid zie <a3>CAPABILITY</a3>.

seg-7bcc7b5cd049 = Afkortingen die in de diagrammen worden gebruikt en niet worden uitgeschreven waar ze voorkomen: ADEV, Allan-deviatie; BW, bandbreedte; CAI, koudeatoom-interferometer; CZML, de Cesium Language; Δ-DOR, delta differential one-way ranging; DO-229E, de SBAS-ontvangerstandaard van de RTCA (Radio Technical Commission for Aeronautics); EKF, extended Kalman-filter; FM, frequentiemodulatie; GSE, grondondersteuningsapparatuur; HPL/VPL, horizontaal/verticaal beschermingsniveau; IMU, inertiële meeteenheid; IOAG, Interagency Operations Advisory Group; IQ, in-phase/quadrature-samples; ISL, inter-satellietverbinding; ITU-T, de Telecommunication Standardization Sector van de International Telecommunication Union; J2–J6, de zonale zwaartekrachtharmonischen van de aarde van graad { "2" } tot { "6" }; KIF, het Kshana Interchange Format; KML, Keyhole Markup Language; KPI, kritieke prestatie-indicator; L1/L5, GNSS-draaggolfbanden (de L2 van de CR3BP-halobanen is in plaats daarvan het Lagrangepunt { "2" } van aarde–maan); LEO, lage baan om de aarde; LOO, leave-one-out; LTC, Coordinated Lunar Time; MEO, middelhoge baan om de aarde; MTIE, maximale tijdintervalfout; N2, het Hill-diversiteitsgetal van orde 2; NED, noord-oost-omlaag; NTN, niet-terrestrisch netwerk; OD, baanbepaling; OPS-SAT, de in-orbitsoftwarelaboratoriumsatelliet van de European Space Agency; PPP, precise point positioning; PSD, vermogensspectrale dichtheid; PVT, positie, snelheid en tijd; RINEX, Receiver Independent Exchange Format; RK4 / RK5({ "4" }), Runge–Kutta-integratoren van de vierde orde en ingebed vijfde(vierde) orde; SH, bolfunctieharmonische; SigMF, Signal Metadata Format; SIR, sampling importance resampling; SRIF, square-root information filter; SRP, zonnestralingsdruk; SSC, spectrale scheidingscoëfficiënt; STK, Systems Tool Kit; SVG, Scalable Vector Graphics; TDEV, tijdsdeviatie; TDM, het Tracking Data Message van de CCSDS (Consultative Committee for Space Data Systems); TLE, two-line element set; TPL, Timing Protection Level; UBX, het binaire protocol van u-blox; UHF, ultrahoge frequentie; VLBI, interferometrie met zeer lange basislijn; VRW / ARW, velocity / angle random walk; WASM, WebAssembly.

seg-a87f668a8f97 = { "1" }. Modulestructuur

seg-0388999448a6 = De CLI (opdrachtregelinterface) en beide bindings lopen via één toegangspunt <c1/>, zodat ze nooit uiteenlopen. De pakketten hergebruiken de gedeelde kern (<c2/>, <c3/>, <c4/>); Pack { "4" } (<c5/>) stelt de modellen en schatters van Packs { "1" }–{ "3" } samen in plaats van ze opnieuw te implementeren; <c6/> leidt een GNSS-tijdlijn af uit geometrie die dan de run van Pack { "1" } voedt. De module <c7/> zit op signaalniveau tussen het linkbudget en het meetdomein: zij leidt de spectrale scheidingscoëfficiënt <c8/> af uit de werkelijke vermogensspectra van signaal en jammer, waaruit <c9/> nu zijn anti-jam-<c10/> berekent in plaats van een representatieve constante te nemen (gecontroleerd in CI (continue integratie)); zij bevat ook de ontwerpafweging voor de rangeringscode (m-sequentie/Gold).

seg-cee4eb61a8e9 = Drie verdere modules vormen de ruggengraat van <b>veerkracht bij GNSS-uitval</b>. <c1/> beantwoordt rechtstreeks de operationele vraag — <em>hoe lang kan deze klok vrij lopen voordat zijn tijdfout het budget overschrijdt?</em> — door de gesloten vorm van de van-Loan-coastfout beschikbaar te stellen als inversie van holdover naar drempel, gecontroleerd tegen de meerstaps-covariantierecursie van <c2/>. Haar inertiële tegenhanger staat in <c3/> (<c4/>), die de witte-ruisdrift van de koudeatoom-interferometer samenstelt met bias- en schaalfactorfout tot een budget voor positiedrift over holdover (de biasterm is gecontroleerd tegen de onafhankelijke <c5/>-integrator). <c6/> toont de hele matrix van de engine, van eis naar module naar test naar onafhankelijke referentie naar status, met unit-geteste invarianten die een label <em>getoetst</em> zonder onafhankelijke externe referentie verbieden — zodat de zekerheidsbewering niet van de code kan afdrijven.

seg-c7bee352c04d = 1a. Lagen voor astrodynamica, fusie en alt-PNT

seg-99c44e3a86d5 = Naast de kern met sensorpakketten delen drie subsystemen dezelfde gedeelde kern en voeden ze <c1/> (of worden erdoor gevoed). De laag voor <b>astrodynamica / numeriek</b> voegt een niet-analytische Cowell-propagator toe naast het analytische pad SGP4/SDP4; de <b>fusie</b>laag bevat de GNSS/INS-schatters; en de <b>alt-PNT</b>-laag is matching van zwaartekrachtkaarten zonder GPS (GPS: Global Positioning System). Dit zijn bibliotheek-/scenariomogelijkheden (zie <a1>CAPABILITY</a1> voor welke aan een scenario-<c2/> zijn gekoppeld en welke bereikbaar zijn als Rust-API (application programming interface)).

seg-69f93294d2c8 = De krachttermen van de numerieke propagator staan standaard uit, zodat het inschakelen ervan de vrijgegeven golden-bestanden nooit verstoort. De strak gekoppelde UKF (unscented Kalman filter) met 17 toestanden overbrugt een GNSS-uitval op de afgeleide velocity-random-walk van de kwantum-CAI-versnellingsmeter; baanbepaling hergebruikt dezelfde <c1/>/<c2/> om een kandidaattoestand over de trackingboog te propageren.

seg-bd87e20c284b = Dezelfde gedeelde kern bevat ook vier verdere subsystemen die hierboven niet zijn getekend (hun pakketten staan in de dispatch van §{ "4" }): een laag voor <b>tijd en referentiestelsels</b> (<c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>) die TEME↔GCRS↔ITRS (TEME: true equator, mean equinox) reduceert en het pakket <c8/>/grondspoor voedt; een laag voor <b>integriteit</b> (<c9/>, <c10/>) voor RAIM/ARAIM/SBAS; een laag voor <b>veerkracht</b> (<c11/>, <c12/>, <c13/>, <c14/>, <c15/>) voor jamming en spoofdetectie in meerdere lagen, met een laag voor <b>navigatiesignalen</b> (<c16/>) op signaalniveau — vermogensspectrale dichtheden van BPSK-R (BPSK: binary phase-shift keying) / sinus-BOC (BOC: binary offset carrier), de spectrale scheidingscoëfficiënt <c17/> die nu de anti-jam-<c19/> van <c18/> afleidt, de RMS-rangeringsbandbreedte (Gabor), de jitter van de coherente early–late-DLL (delay-locked loop) bij codetracking en de omhullende van de multipathfout (analyse van signaalprestaties, <b>niet</b> het ontwerp van RF-payload (RF: radiofrequent)/antennehardware — de rol van een payloadpartner); en een laag voor <b>maan / cislunair</b> (<c20/>, <c21/>, <c22/>, <c23/>) voor CR3BP-dynamica (circular restricted three-body problem) — waaronder de toestandsovergangsmatrix van { "6" }×{ "6" } en een differentiële corrector met single shooting (<c24/>, <c25/>, <c26/>) die echt periodieke halo-/NRHO-banen (NRHO: near-rectilinear halo orbit) levert, en die de gepubliceerde zuidelijke L2-NRHO van { "9" }:{ "2" } (de Gateway-baan) reproduceert met periode ≈ { "6.57" } d / perilune ≈ { "3,250" } km (gepubliceerd ≈ { "6.56" } d / ≈ { "3,370" } km); de selenocentrische MCI/MCMF-transformatie (MCI: Moon-centred inertial; MCMF: Moon-centred, Moon-fixed) van een gecorrigeerde baan en de voortzetting van families blijven vervolgwerk, en de NRHO is een CR3BP-oplossing (circulair, zonder zon), niet getoetst aan een echte LANS/Gateway-efemeride (LANS: Lunar Augmented Navigation Service) — en LunaNet-integriteit. De fit van het krachtmodel aan efemeriden van instanties (<c27/>, <c28/>, <c29/>, <c30/>) en de volledige alt-PNT-veldenset (<c31/>, <c32/>, <c33/>) completeren de modulelijst; zie <a1>CAPABILITY</a1> voor de rijpheid per module.

seg-05f8c8c84d15 = 1b. Veerkrachtstudies, evaluatie van machine learning en reproduceerbare artefacten

seg-7350971daf4e = Vijf verdere modulegroepen vormen de <b>open, reproduceerbare studielaag</b> achter de onderzoekspapers van het project. Anders dan de scenario-<c1/>s worden deze bereikt als generatoren <c2/> / <c3/> die <b>byte-deterministische</b> artefacten schrijven (vaste seeds, vastgelegde engineversie + confighash). Alle zijn <b>MODELLED</b> (synthetische of publieke datasetkalibratie) en dragen eerlijke validatielabels — geen ervan is een certificering.

seg-86b177166f0e = <b><c1/></b> — het conditionele Timing Protection Level: een door holdover beperkte grens voor de <em>niet-gedetecteerde</em> tijdfout onder spoofing, die een k-σ-monitorondergrens, de van-Loan-coastvariantie over de detectielatentie en een CUSUM-tijd tot alarm (cumulative sum) samenstelt; gekalibreerd op een echte opgenomen spoof (JammerTest { "2024" }). Er is geen eindige <em>onvoorwaardelijke</em> grens — de TPL is voorwaardelijk aan het feit dat een onafhankelijke kruiscontrole de aanval detecteert.

seg-8c9d1d90dc8e = <b><c1/></b> — een scoringsengine voor PNT-veerkracht in lijn met raamwerken (categorieën van DHS (Department of Homeland Security) RPCF (Resilient PNT Conformance Framework)) plus een studie naar beslissingsinstabiliteit: een Dirichlet-wegingssimplex, Kendall-τ-rangorde-instabiliteit, de omslagfrequentie van de top-1-winnaar en <b>diversiteitscollaps</b> door common mode (Hill-N2), met een rapport van zekerheid met integriteitshash en { "35" } met de hand afgeleide oracletests. Zie <a1>RESILIENCE-CROSSWALK</a1>. Synthetische architecturen in lijn met RPCF v2.0 — een zelfbeoordeling, geen certificering.

seg-b347924b874e = <b><c1/> / <c2/> / <c3/> / <c4/></b> — de studie naar de optimismekloof bij RF-verstoringen: een gelabeld synthetisch corpus en een detectoronafhankelijk ROC/AUC-harnas (ROC: receiver operating characteristic; AUC: area under the curve), een panel van 13 detectoren (energie/AGC/SQM/pariteit (AGC: automatic gain control; SQM: signal-quality monitoring) plus geseede logistische-regressiedetectoren en detectoren met een MLP van één verborgen laag (MLP: multi-layer perceptron)), schaalwetten binnen en buiten de verdeling met een permutatienulmodel, en een leave-one-out-voorspeller van de achteruitgang buiten de verdeling. De evaluatiemaatstaven zijn bit voor bit getoetst aan scikit-learn.

seg-36206681024f = <b><c1/> / <c2/></b> — een front end voor een software-defined receiver (ruwe IQ/IF (IQ: in-phase/quadrature; IF: intermediate frequency) → early/prompt/late-aftakkingen van de correlator → SQM) en inleesadapters (RINEX, u-blox UBX, GnssLogger, JammerTest, Yunnan, SatGrid) waarmee dezelfde detectoren over lokaal aangeleverde opnamen kunnen lopen; er worden geen datasets in de repository vastgelegd.

seg-fefd78868fc2 = <b><c1/> / <c2/></b> — de kaart van het kruispunt in veerkracht tussen kwantum en klassiek bij parameteronzekerheid, en de afweging van het holdover-voordeel op basis van gemeten ADEV; de numerieke kernels van de afweging zijn getoetst aan scipy.

seg-5749f1300772 = 1c. Lagen voor integriteit, GNSS, diepe ruimte, maan en missies

seg-f44755d6d921 = De overige domeinen sluiten aan op dezelfde dispatch <c1/> en hergebruiken de gedeelde kern, de stelsels en de geometrie. Alles hier is <b>MODELLED</b> tenzij een rij van de <c2/>-matrix een externe onafhankelijke referentie noemt (RAIM-kernel tegen SciPy, SBAS tegen de fork van RTKLIB (een opensourcebibliotheek voor real-time kinematische positiebepaling), de DOP-kernel (dilution of precision) van gnss_lib_py, de OPS-SAT-evaluatie, de ARAIM-beschermingsniveaukernel voor de maan, de consistentie van maanefemeriden tussen aanbieders) — de rest van de maansuite en de kwantumdemonstrator zijn gemodelleerd, illustratief, uit publieke bronnen en dragen geen bewering over TRL (technology readiness level) / heritage / onderschrijving door een instantie.

seg-044940c8d052 = 1d. LEO-PNT, spectrum, zonnestelsel, nettijdsynchronisatie, campagnes en uitvoer

seg-253a26d9cc5d = De nieuwste lagen volgen hetzelfde patroon: elk is een of meer scenario-<c1/>s die vanuit <c2/> worden verzonden, op de gedeelde kern zijn gebouwd en MODELLED zijn tenzij een matrixrij een externe onafhankelijke referentie noemt.

seg-e47cccd54da3 = Het detail per soort staat in <a1>LEO-PNT</a1>, <a2>LEO-SIGNAL</a2>, <a3>LEO-PASS</a3>, <a4>LEO-NAVMSG</a4>, <a5>LEO-PNT-FUSION</a5>, <a6>SPECTRUM</a6>, <a7>CONSTELLATION-DESIGN</a7>, <a8>TELECOM-TIMING</a8>, <a9>SLOT-TIMING</a9>, <a10>CAMPAIGNS</a10>, <a11>REPORTS</a11>, <a12>ANIMATION</a12> en <a13>INTEROP</a13>.

seg-d04b21c7cb6c = 1e. Lagen voor ontvangervertrouwen, bewijs, telemetrie, training en compliance ({ "0.35" })

seg-84ee122959b4 = Deze lagen lezen het eigen log van een ontvanger of schrijven bestanden voor andere hulpmiddelen; geen ervan synthetiseert of zendt een radiofrequent signaal uit. Ze staan naast <c1/> in plaats van onder de scenariosoorten, behalve <c2/> zelf, dat een scenariosoort is. Alle zijn MODELLED tenzij een matrixrij een externe onafhankelijke referentie noemt, en de maritieme uitvoer is adviserend, geen typegoedgekeurde navigatieapparatuur.

seg-aab745a65e76 = Module

seg-9d17ad3e87c8 = Gedocumenteerd in

seg-920b6b14c0e2 = scoort een ontvangerlog epoch voor epoch met de vertrouwensmonitors; een vaartuigplatform voegt de maritieme monitors en de score van 0-100 met redenen toe

seg-a77d1a8a62b5 = <a1>RECEIVER-TRUST</a1>, <a2>MARITIME-TRUST</a2>

seg-c311dfc2a161 = dezelfde scoring op een stroom terwijl die binnenkomt (stdin, een bestand waaraan wordt toegevoegd, TCP of UDP), de zin <c1/> en de optionele gate; <c2/> is het geheel zonder invoer of uitvoer

seg-07b2d6edf7b9 = een ondertekend, met hashes geketend pakket van een logvenster, zijn configuratie en het resultaat van de engine, offline verifieerbaar; optioneel RFC { "3161" }-tijdstempeltoken

seg-32d08730b9c0 = de vertrouwensstroom als Prometheus-metrics, syslog-gebeurtenissen (CEF of LEEF) en optioneel OpenTelemetry (feature <c1/>, standaard uitgeschakeld)

seg-53311b8c3b93 = synthetische brug-NMEA { "0183" } met gescripte jamming-, drag-off-, tijdspoof- en replay-gebeurtenissen en een instructeurslogboek, voor bemanningstraining (alleen tekst)

seg-f7cc3cfbdfc6 = geaggregeerde kaarten van gedegradeerde navigatie uit openlijk gelicentieerde meldingen van vliegtuigen en schepen, en de blootstelling van een route eraan; alleen lokale bestanden

seg-83fe3c87e2d5 = een verificatiehulpmiddel aan ontvangerszijde voor Galileo OSNMA: leest I/NAV-pagina's (gewone pagina's, vector-CSV, een UBX-stream), controleert de ondertekende sleutel, de TESLA-keten en de MAC's, en meldt per satelliet of de navigatiegegevens zijn geauthenticeerd; <c1/> is het ene pad dat de opdrachtregel, Python en WebAssembly delen; alleen authenticatiestatus, geen integriteitsdienst

seg-bf8cd5a45deb = OSNMA

seg-843a83b82283 = koppelt { -brand }-uitvoer aan openbare veerkrachtkaders en vult die koppeling in vanuit resultaatdocumenten; <c1/> en <c2/> nemen teksten, geen paden

seg-e16c483479ce = de voertuigbeweging en gebeurtenissen van een scenario als bewegings-CSV, NMEA, waypointtekst en gebeurtenisbestanden voor een GNSS-simulator in een laboratorium; er wordt geen signaal geschreven

seg-044c58c98397 = Integraties voor boten (de Signal K-plugin, de gatemodus van OpenCPN en de referentiebuild) roepen het opdrachtregelprogramma aan; zie <a1>MARINE-INTEGRATIONS</a1>.

seg-cb8d8ff847eb = { "2" }. Enginepijplijn (per run)

seg-53e9e596ca44 = Elke run laat één sensormodel stap voor stap door het tijdraster lopen: het wordt gedisciplineerd zolang GNSS nominaal is en loopt vrij (holdover / dead-reckoning) tijdens de onderbreking.

seg-257407f3c375 = Een scenario doorloopt deze pijplijn twee keer, een keer voor de kwantumsensor en een keer voor de klassieke sensor, met <b>onafhankelijke seeds</b> (<c1/>), zodat de twee ruisrealisaties ongecorreleerd zijn.

seg-4659e89ba5f5 = { "3" }. De interface van het foutmodel (het uitbreidingspunt)

seg-7b70e8b1b98a = Elke sensor implementeert hetzelfde idee: een object met toestand waarvan <c1/> zijn interne stochastische fout laat doorlopen en waarvan de opgebouwde toestand elke tik wordt uitgelezen. Klokken geven de opgebouwde fase vrij; versnellingsmeters geven de dubbel geïntegreerde positie vrij; verbindingen geven jitter per meting vrij.

seg-79ab76c6dbc0 = <c1/> gaat mee in het resultaat, zodat elk cijfer in de uitvoer herleidbaar is tot de gepubliceerde bron die in <c2/> is genoemd.

seg-514c49659947 = Naast de analytische <c1/> draait het klokpakket een Kalman-filter met twee toestanden (fase, frequentie) (<c2/>) waarvan de procesruis overeenkomt met het referentiemodel. Tijdens het uitlopen door een onderbreking groeit de variantie van de fasefout tot precies <c3/>, de analytische holdover-relatie, en de online 1-σ-grens ervan wordt gebruikt om de kwaliteitsmaat <b>Integriteit</b> te vullen (het deel van de samples tijdens de onderbreking waarvan de fout binnen de k-σ-grens blijft).

seg-7404589deb40 = { "4" }. Dispatch (CLI en bindings)

seg-6138513a43f7 = <c1/> is het enige ingangspunt: het kijkt naar de <c2/> op het hoogste niveau, deserialiseert het bijbehorende scenario, draait het pakket en geeft <c3/> terug (<c4/> is alleen aanwezig voor de soorten die een reproduceerbaarheidstabel publiceren). De CLI schrijft die naar bestanden, plus het rapport (<c5/>, <c6/>) en eventuele <c7/>- / <c8/>-uitvoer; de Python- en WebAssembly-bindings geven ze terug aan de host. Eén dispatch, geen afwijking.

seg-524f749be364 = De dispatch gebeurt op een getypeerde enum <c1/>, uitputtend gematcht (zie de volgende paragraaf), zodat het toevoegen van een pakket een door de compiler gecontroleerde wijziging is. Een ontbrekende <c2/> valt terug op het pakket <c3/>, zodat bestaande scenario's van één soort ongewijzigd worden gedeserialiseerd (<c4/> negeert het veld <c5/> op elke scenariostruct). Een onbekende <c6/> wordt geweigerd met <c7/>, die de dichtstbijzijnde ingebouwde soort noemt als de naam op een typfout lijkt.

seg-eedaeae2a7e7 = Getypeerde dispatch en de gestructureerde API

seg-ca47f566eaee = De dispatch gebeurt op een getypeerde enum <c1/>, niet op een ruwe stringmatch: <c2/> zet het veld <c3/> om in een variant en de dispatcher matcht die uitputtend, zodat het toevoegen van een pakket een door de compiler gecontroleerde wijziging is en geen typefout in een string. Twee getypeerde oppervlakken staan naast de stringteruggevende <c4/> (behouden voor de CLI en bestaande bindings):

seg-167c47049329 = <b><c1/></b>: de getypeerde ingang, met een gestructureerde foutentaxonomie (<c2/>, <c3/>, <c4/>, <c5/>). Elke fout draagt een stabiele <c6/>, zodat een aanroeper kan vertakken op de foutcategorie in plaats van het bericht te ontleden. De bindings bieden dit aan als <c7/>.

seg-1943051b3b20 = <b><c1/></b> (en <c2/>, in de bindings beschikbaar als <c3/>): programmatische introspectie: naam, beschrijving en verplichte/optionele velden van elke soort, voor automatisch aanvullen in de UI (gebruikersinterface) en in notebooks.

seg-630243592256 = { -brand } uitbreiden met een extern pakket

seg-d1adedd2c08b = Een pakket van een derde partij implementeert twee kleine, semver-stabiele traits uit <c1/>:

seg-d01471b13324 = <c1/> heeft ook een standaardmethode <c2/>, die niets doet tenzij een pakket kiest voor de registry-dispatchaansluiting in <c3/>. Het ingebouwde pakket <c4/> is via <c5/> aangesloten als uitgewerkt voorbeeld; pakketten buiten de boom volgen hetzelfde contract zonder de kern te forken (naar het voorbeeld van het uitbreidingspunt <c6/> in §{ "3" }, dat de privé-veerkrachtoverlay gebruikt).

seg-5b0449d96bc3 = { -brand } heeft daarom <b>twee stabiele uitbreidingsaansluitingen</b>: voeg een <em>sensor</em> toe door <c1/> te implementeren (§{ "3" }), of een heel <em>scenariosoort</em> door <c2/> + <c3/> te implementeren; beide zijn semver-stabiel en geen van beide vereist een fork van de kern:

seg-3928a007756b = { "5" }. De hybride afsluiter

seg-7f38e825519a = Het hybride pakket draait een <em>suite</em> (één klok + één traagheidssensor) en vereist dat <b>zowel</b> tijdsynchronisatie als positie binnen de specificatie blijven; <c1/> is de tijd tot een van beide die overschrijdt. Optioneel synchroniseert een optische intersatellietverbinding de <b>klok</b> tijdens de onderbreking opnieuw: alleen tijdondersteuning; de positie wordt niet opnieuw gesynchroniseerd, omdat tijdoverdracht tijd geeft en geen positie. Hierdoor springt de traagheidssensor eruit als beperkende factor.

seg-17a8683f0982 = { "6" }. Uit geometrie afgeleide GNSS-beschikbaarheid

seg-afdb141ac367 = <c1/> is een deterministische geometrielaag zonder afhankelijkheden. Een <c2/> is ofwel de analytische Kepler-<c3/> (twee-lichamen, optioneel met seculiere J2) ofwel een volledige <c4/>-propagator die is opgebouwd uit een complete two-line-elementenset; een Walker-delta-generator maakt synthetische constellaties, en zichtbaarheid in rechte lijn = aardbedekking + elevatiemasker. Het aantal zichtbare satellieten wordt afgebeeld op een GNSS-toestand (≥{ "4" } = nominaal, { "1" }–{ "3" } = gedegradeerd, { "0" } = geweigerd), en <c5/> zet dat om in de beschikbaarheidstijdlijn die de standaard klok-holdoverrun aanstuurt. Beschikbaarheid is dus <em>afgeleid uit geometrie</em> in plaats van met de hand opgesteld, terwijl de run, de schatter en de scoring ongewijzigd blijven.

seg-da82c97ac5c8 = Een constellatie die als volledige TLE's wordt aangeleverd, wordt gepropageerd met het SGP4/SDP4-model in <c1/> (getoetst aan de vectoren van AIAA (American Institute of Aeronautics and Astronautics) 2006-6753); elementen met alleen regel 2 blijven het analytische tweelichamenpad volgen. De twee kunnen binnen één constellatieblok worden gemengd.

seg-a47031620b54 = { "7" }. Bindings

seg-57fb29fdd9d9 = De kern compileert ongewijzigd naar native, naar een Python-extensie en naar WebAssembly. De Python-module (<c1/>, PyO3 abi3) en de WebAssembly-module (<c2/>, wasm-bindgen) zijn optionele, feature-gated afhankelijkheden (<c3/> / <c4/>): de standaardbuild en de testsuite compileren ze nooit, terwijl de poort voor de audit van afhankelijkheden (<c5/>) wel hun afhankelijkheidsbomen inspecteert, omdat die crates in het wheel en in het npm-pakket worden meegeleverd. Beide roepen <c6/> aan, zodat elk oppervlak identieke resultaten geeft. De WebAssembly-module ondersteunt de browser-playground in <c7/> en exporteert dertien functies: <c8/>, <c9/> (één enginerun die resultaat, grafiek, samenvatting en tabel samen teruggeeft), <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, de codec <c16/> / <c17/> voor deelbare URL's (URL: webadres), en de drie exporteurs <c18/> / <c19/> / <c20/> achter het exportmenu van de playground. Twee verdere toegangspoorten bereiken dezelfde <c21/>: de <b>MCP-server (Model Context Protocol)</b> (<c22/>, een van de workspace uitgesloten <c23/>-crate die vijftien tools aanbiedt: <c24/>, <c25/>, <c26/>, <c27/>, <c28/>, <c29/>, <c30/>, <c31/>, <c32/>, <c33/>, <c34/>, <c35/>, <c36/>, <c37/>, <c38/>; de twee voorbeeldtools lezen de meegeleverde scenario's via de standaard uitgeschakelde feature <c39/> van de bibliotheek, die alleen deze server inschakelt) en de <b>JetBrains-IDE-plugin (integrated development environment)</b> (<c40/>, een Kotlin-project dat de CLI <c41/> aanroept in plaats van de bibliotheek te linken).

seg-a6620e0d6eef = Feature-gating: Python en WASM zijn <c1/> / <c2/>; de meegeleverde scenariotabel is <c3/> (het enige gebruik ervan door de MCP-server); de MCP-server en de kruiscontroles <c4/> zijn crates die van de workspace zijn UITGESLOTEN; de IDE-plugin linkt niets: hij draait de CLI.

seg-7bc5df56e4e5 = { "8" }. Determinisme en reproduceerbaarheid

seg-fb95c37c7bb9 = Alle willekeur loopt per run via één geseede <c1/>; de volgorde van de stappen ligt vast, dus <c2/>.

seg-e026c87beb26 = Het resultaat draagt een SHA-256 (SHA: Secure Hash Algorithm) <c1/>; <c2/> draait een referentiescenario twee keer en controleert dat de uitvoer byte-identiek is.

seg-42a3bdcbd99f = Dezelfde engine compileert naar native, naar een Python-extensie en naar <c1/> voor runs in de browser die dezelfde getallen opleveren.

seg-12e00717c2d4 = { "9" }. Uitgestelde / toekomstige structuur

seg-8a8e1b93b704 = De lagen voor astrodynamica, fusie en alt-PNT in §1a (de volledige SGP4/SDP4-propagator, de numerieke Cowell-propagator met zijn krachtenmodel van zeven verstoringen en twee adaptieve integratoren, manoeuvre-/trajectontwerp, baanbepaling, de GNSS/INS-schatters met 15, 8 en 17 toestanden, het gekoppelde klok+positiefilter en matching van zwaartekrachtkaarten) zijn allemaal opgeleverd, samen met de Security-kwaliteitsmaat met een actieve spoof-demonstrator, echte TLE-/multiconstellatiegeometrie, Monte Carlo-banden, afwegingsstudies met sweeps, het afdrukbare HTML-rapport (HyperText Markup Language) met zijn machineleesbare tegenhanger, en de release-/publish-/wheels-/pages-workflows.

seg-318ad50d3826 = Verschillende mogelijkheden die hier eerder als toekomstig werk stonden, zijn inmiddels <b>opgeleverd</b> en worden hierboven of in <a1>VALIDATION</a1> behandeld: de volledige IAU 2000A-nutatie en de equinoxvrije CIO-reductie GCRS↔ITRS / ITRF (International Terrestrial Reference Frame) (bit voor bit getoetst aan SOFA/ERFA (SOFA: Standards of Fundamental Astronomy; ERFA: Essential Routines for Fundamental Astronomy)), het EGM2008-geopotentiaal (Earth Gravitational Model { "2008" }) tot graad/orde { "70" }, de <b>Lense–Thirring</b>-term voor frame-dragging, vaste-aarde-, oceaan- en atmosferische getijden, een kruisvalidatie van de efemeride op DE-niveau (DE440/ANISE (DE440: Development Ephemeris { "440" }; ANISE: Attitude, Navigation, Instrument, Spacecraft, Ephemeris, een zuivere Rust-toolkit voor planeetgeometrie)), de externe kruisvalidatie met Orekit { "12.2" } van de numerieke Cowell-propagator ({ "0.08" } m over { "24" } h) en van batch- en sequentiële baanbepaling, en de strak gekoppelde navigator met 17 toestanden, beschikbaar als scenariosoort <c1/>.

seg-068119b15b27 = De resterende vervolgstappen worden bijgehouden in <a1>CHANGELOG</a1> <c1/> en in de roadmap per mogelijkheid in <a2>CAPABILITY</a2>: een externe referentiewaarde voor de EGM-evaluator (Earth Gravitational Model) van hoge graad precies op de poolas en een pyshtools-zuivere vergelijking nabij de pool (de evaluator tot graad { "2190" } en zijn runtime-lader voor <c2/> worden opgeleverd, MODELLED; zie <c3/>), een tijdsvariërende ruimteweerdriver voor het opt-in-niveau van de luchtweerstandsdichtheid van NRLMSISE-00 (NRLMSISE: Naval Research Laboratory Mass Spectrometer and Incoherent Scatter Radar Extended atmosphere model) (de standaarddichtheid is het statische exponentiële model, en de Jacchia-71-dichtheid van de soort <c4/> is gekarakteriseerd ten opzichte van NRLMSISE-00 maar niet erdoor vervangen), een externe controle van de opt-in-schaduw met zonneschijfverduistering, strakke koppeling van GNSS/INS met draaggolffase, en een echte EGM2008/EIGEN-zwaartekrachtkaart (EIGEN: European Improved Gravity model of the Earth by New techniques) voor de alt-PNT-matcher.

seg-b48f69ea54b3 = Een privé-overlayrepo bevat veerkrachtdiepgang die onder exportbeperkingen valt; die sluit aan via dezelfde interface <c1/> (en het contract <c2/> in §{ "4" }) zonder de publieke engine te wijzigen.

seg-2f88ab8f67e8 = <s1>Vorige</s1>Waar { -brand } draait

seg-02b0e0fdcdbe = <s1>Volgende</s1>Waar { -brand } staat
