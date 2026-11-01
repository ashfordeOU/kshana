# docs--kinds-inertial-fusion-and-quantum-sensors: translations (da)

seg-6e0cb6acc073 = VALIDATED

seg-b03d56f501c3 = Type

seg-ec26df467b88 = Fælles Kalman-sensorfusion til PNT over de samme hybride input.

seg-c8a1c797f4b1 = Diagrammet, som motoren skriver for scenarios/fusion-pnt.toml, scenarietype fusion

seg-38df285a3f25 = Løst og tæt koblet GNSS/INS-fejltilstands-EKF.

seg-7d993b676006 = Diagrammet, som motoren skriver for scenarios/gnss-ins.toml, scenarietype gnss-ins

seg-c6edf89eb8d4 = Hybrid kvante+klassisk tæt koblet GNSS/INS-UKF med 17 tilstande (MODELLED): { "15" } INS-fejltilstande + CAI-afledet korrektion af accelerometer-bias + et ur med 2 tilstande (fase+frekvens) fra q-parameter-urmotoren, drevet af den afgrænsede CAI-fejlmodel. Kvalitetsmålet er filterets selvkonsistens (NEES + innovationshvidhed mod χ²-grænser), en udtalelse om selvkonsistens, IKKE en garanti for nøjagtighed i den virkelige verden. Kun simulering; ingen TRL>{ "3" }, ingen flyvearv, ingen ekstern validering.

seg-2968660fa880 = Diagrammet, som motoren skriver for scenarios/hybrid-ukf.toml, scenarietype hybrid-ukf

seg-22cd963c7042 = Hybrid PNT-slutsten: ur + IMU + støtte fra tidsoverførsel.

seg-52378a7b074c = Diagrammet, som motoren skriver for scenarios/hybrid-pnt.toml, scenarietype hybrid

seg-bdedf28adc48 = Inertial dødregning med 1 DOF under et GNSS-udfald.

seg-873c402bb724 = Diagrammet, som motoren skriver for scenarios/imu-deadreckoning.toml, scenarietype inertial

seg-5b9a6efe6337 = Fejlmodel for INS/TRN-coasting: positionsfejl mod coasting-varighed, bygget ud fra IMU-koefficienter frem for at blive sweepet som en antaget driftrate. Fem vækstbidrag (accelerometer-bias, gyro-bias-hældning via tyngdekraften, velocity random walk, angle random walk og skalafaktor mod tilbagelagt distance) propageres hver gennem en inertial fejlmodel med ni tilstande i lokalt plan med Schuler-feedback ved en angivet breddegrad og højde (de ledende ordens love for kort coasting t², t³, t^{ "1.5" }, t^{ "2.5" } og t¹/t² rapporteres ved siden af) og kombineres under en ANGIVET regel (kvadratsum som standard, eller lineær sum, eller deterministisk sum med stokastisk rss; alle tre beregnes ved hver kørsel, så valget er synligt frem for gemt væk). De coasting-varigheder, der når tærskler for position leveret af kalderen ({ "10" } m og { "50" } m som standard), findes med motorens eksisterende bisektion, hver med en opdeling pr. bidrag, der angiver den dominerende kilde, og hvert enkelt bidrags krydsning inverteres desuden algebraisk, så de to stemmer overens. En tilstand for terrænrelativ navigation afgrænser coastingen med periodiske positionsbestemmelser og rapporterer det største interval mellem bestemmelser, der holder hver tærskel; en positionsbestemmelse kun af position lader hastighedsfejl og hældning leve videre hen over bestemmelsen, så den ikke altid afgrænser coastingen ved nogen bestemmelsesrate, og rapporten siger det frem for at returnere et nul. MODELLED: IMU-klassens koefficienter er repræsentative båndtal, ikke et datablad, og terrænbestemmelsens residual er et input. En tærskel, der ikke nås, rapporteres som null med en status, aldrig som et nul. Ikke et certificeret ydelsesprodukt til inertial navigation.

seg-134a4c91da3a = Diagrammet, som motoren skriver for scenarios/ins-trn-coast.toml, scenarietype ins-trn-coast

seg-04310cd6cbec = MODELLED detektion af fejl og anomalier for kvante-PNT-systemer: et mærket fejlkatalog (urets frekvensspring, drift og tab af lås; sensorens biastrin og udfald), en ROC-AUC for detektionsstatistikken (med et bootstrap-konfidensinterval fra den eksternt validerede eval_stats) og en mindste detekterbare fejl ved en fast falsk alarmrate, hvor den kvanteur-støttede monitor (lavere støj) detekterer mindre fejl — som ærlig TradeEvidence + repræsentativitet. Gaussisk model af detektionsstatistikken (AUC = Phi(mu/(sigma*sqrt2))); modellerer klassen, illustrative parametre fra offentlige kilder, ingen TRL/flyvning/certificering.

seg-2f1d14239d1a = Diagrammet, som motoren skriver for scenarios/quantum-anomaly-detect.toml, type quantum-anomaly-detect

seg-790fbfdd80f0 = MODELLED GNSS-fri kvantenavigation: under et GNSS-udfald et inertibudget for kvante (kold-atom-interferometer) mod et klassisk INS af navigationskvalitet — vækst af positionsfejl over coast-perioden, holdover til en tærskel for position og afvejningen mellem kvante og klassisk som ærlig TradeEvidence med repræsentativitet. Ærlig note om observerbarhed: uden en ekstern positionsbestemmelse er accelerometerets bias uobserverbar, så fejlen vokser; kvantesensoren bremser, men lukker ikke dette hul. Illustrative enhedsparametre fra offentlige kilder; modellerer klassen, ingen TRL/flyvning/certificering.

seg-1bdbf1a737b2 = Diagrammet, som motoren skriver for scenarios/quantum-gnss-free-nav.toml, type quantum-gnss-free-nav

seg-eb55d253dd11 = Afvejning mellem kvante og klassisk PNT ({ "13503" }): fordelen ved holdover for tidssynkronisering + holdover for inerti for et kandidat-ur (en målt ADEV-kurve — forsvarlighedens omdrejningspunkt — eller en kvanteurklasse) mod en klassisk baseline-klasse, hvor forbeholdet om antagelsen for gulvet ved lang tau følger med artefaktet, plus en envelope for modstandsdygtighed mod tid ved GNSS-nægtelse. MODELLED; kvantificerer (validerer aldrig) en partners enhed. Kandidatens ur er en målt kurve (<c1/> + <c2/>, lige lange, mindst { "2" } punkter; den vinder, når begge former er angivet) eller en <c3/>.

seg-c74c63ffd859 = Diagrammet, som motoren skriver for scenarios/quantum-trade.toml, type quantum-trade

seg-4e31c8daf798 = Register

seg-9095869ec445 = { "9" } scenarietyper i motoren v{ $version }. Vejledende: analyseoutput fra et forsknings- og ingeniørværktøj, ikke typegodkendt navigationsudstyr og ikke en safety-of-life-tjeneste. Hver betegnelse her er motorens eller verifikationsmatricens; en type er MODELLED, medmindre matricen angiver andet (hvordan en betegnelse opnås: afsnittet Evidens i README).

seg-efd15cff3d32 = MODELLED (resultatbetegnelse)

seg-be0cfeeb1680 = MODELLED { "4" } · VALIDATED { "4" }

seg-d1c67e3dd12e = MODELLED { "1" } · VALIDATED { "2" }

seg-e6f2ab1647e2 = Kilde: <c1/>

seg-23762f3a250b = Inertial, fusion og kvantesensorer (scenarietypefamilie)

seg-6ec3ad751007 = Emnesider: <a1>QUANTUM-MODELS</a1>, <a2>QUANTUM</a2>, <a3>LEO-PNT-FUSION</a3>. Kør én: <c1/>. Alle familier: <a4>KINDS.md</a4>.

seg-0e73a37b716b = Kontaktark med de diagrammer, som motoren skriver for typerne i familien Inertial, fusion og kvantesensorer

seg-c2245de16d5f = MODELLED { "6" } · VALIDATED { "2" }

seg-084cf4eeccb5 = 17-tilstands hybrid kvante+klassisk tæt koblet GNSS/INS UKF (MODELLED): { "15" } INS-fejltilstande + CAI-afledt accelerometerbias-korrektion + et 2-tilstands (fase+frekvens) ur fra q-parameter-urmotoren

seg-a7d3c32b29b3 = INS/TRN-fejlmodel for fri flyvning: positionsfejl mod varighed af fri flyvning, bygget ud fra IMU-koefficienter frem for fejet som en antaget driftrate.

seg-beb568dec44f = MODELLED GNSS-fri kvantenavigation: under et GNSS-udfald et kvante- (koldatom-interferometer) inertialbudget mod et klassisk INS på navigationsniveau — positionsfejlvækst over den frie flyvning, holdover t

seg-d948ea4d1f33 = MODELLED fejl-/anomalidetektion for kvante-PNT-systemer: et mærket fejlkatalog (urets frekvenssprang/-drift/låsetab; sensorbias-trin/udfald), en detektionsstatistik med ROC AUC (med en bootstrap-CI

seg-48e72d451a50 = Afvejning mellem kvante og klassisk PNT ({ "13503" }): fordel i tidssynkroniserings-holdover + inertial holdover for et kandidatur (en målt ADEV-kurve — det forsvarlighedsafgørende punkt — eller en kvanteurklasse) mod en klassisk bas

seg-5330b47bc0b6 = Obligatoriske felter: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>. Valgfrie: <c7/>.

seg-75867e8b4b4f = <b>Register:</b> MODELLED { "6" } · VALIDATED { "2" }. Fuld side med input, resultater, evidens og begrænsninger: <a1>inertial</a1>.

seg-fdf140d4ce68 = Obligatoriske felter: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>.

seg-44c6371da5f9 = <b>Register:</b> MODELLED. Fuld side med input, resultater, evidens og begrænsninger: <a1>hybrid</a1>.

seg-3246c9e1e0cb = Obligatoriske felter: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>. Valgfrie: <c11/>.

seg-e2bd8fd0d9e5 = <b>Register:</b> MODELLED { "4" } · VALIDATED { "4" }. Fuld side med input, resultater, evidens og begrænsninger: <a1>fusion</a1>.

seg-d0790a2643ae = Obligatoriske felter: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>. Valgfrie: <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>.

seg-85ab600e3050 = <b>Register:</b> ingen matrixrække nævner denne type; motoren betegner selv sit resultat. Fuld side med input, resultater, evidens og begrænsninger: <a1>hybrid-ukf</a1>.

seg-3bbd5ce09bee = Obligatoriske felter: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>. Valgfrie: <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>.

seg-08ad3969f65b = <b>Register:</b> ingen matrixrække nævner denne type; motoren betegner selv sit resultat. Fuld side med input, resultater, evidens og begrænsninger: <a1>gnss-ins</a1>.

seg-1703619ca20e = Obligatoriske felter: ingen. Valgfrie: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>, <c19/>.

seg-ab3453d1ee51 = <b>Register:</b> VALIDATED. Fuld side med input, resultater, evidens og begrænsninger: <a1>ins-trn-coast</a1>.

seg-a77cdf6e8e31 = Obligatoriske felter: ingen. Valgfrie: <c1/>, <c2/>, <c3/>, <c4/>.

seg-b05e96ce392d = <b>Register:</b> ingen matrixrække nævner denne type; motoren betegner selv sit resultat. Fuld side med input, resultater, evidens og begrænsninger: <a1>quantum-gnss-free-nav</a1>.

seg-3f3e48045d31 = Obligatoriske felter: ingen. Valgfrie: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>.

seg-cbefb1538dec = <b>Register:</b> ingen matrixrække nævner denne type; motoren betegner selv sit resultat. Fuld side med input, resultater, evidens og begrænsninger: <a1>quantum-anomaly-detect</a1>.

seg-6eee03151521 = Obligatoriske felter: <c1/>, <c2/>, <c3/>, <c4/>. Valgfrie: <c5/>, <c6/>, <c7/>, <c8/>.

seg-6cb57dc94549 = <b>Register:</b> MODELLED { "1" } · VALIDATED { "2" }. Fuld side med input, resultater, evidens og begrænsninger: <a1>quantum-trade</a1>.

seg-b6c31bdda166 = <s1>Forrige</s1>GPS-nægtet alternativ PNT

seg-0585e4ae329e = <s1>Næste</s1>Jamming spoofing og spektret
