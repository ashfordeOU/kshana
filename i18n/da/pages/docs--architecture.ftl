# docs--architecture: translations (da)

seg-e366c6dd500e = Kilde: <c1/>

seg-1f25b7fa1187 = Kshana — Arkitektur

seg-b0136a82669c = Kshana er <b>én motor</b> organiseret i lag over en fælles kerne: <b>sensorpakkerne</b> (ur, inerti, tidsoverførsel, hybrid); et <b>astrodynamisk / numerisk</b> lag (analytisk SGP4/SDP4 (SGP4: Simplified General Perturbations { "4" }; SDP4: Simplified Deep-space Perturbations { "4" }), en numerisk Cowell-propagator med dens kraftmodel med syv perturbationer, manøvredesign, banebestemmelse ud fra afstande fra jordstationer og tilpasningen af kraftmodellen til agenturers præcise efemerider); et lag for <b>tid og referencesystem</b> (IERS (International Earth Rotation and Reference Systems Service) tidsskalaer, IAU (International Astronomical Union) 2006/2000A præcession–nutation og CIO (Celestial Intermediate Origin) GCRS↔ITRS-reduktionen (GCRS: Geocentric Celestial Reference System; ITRS: International Terrestrial Reference System)); et <b>fusions</b>lag (GNSS/INS-estimatorerne (GNSS: global navigation satellite system; INS: inertial navigation system)); og lagene for <b>integritet, robusthed, alt-PNT (PNT: positionering, navigation og tidssynkronisering) og måne</b> (RAIM/ARAIM/SBAS (RAIM: receiver autonomous integrity monitoring; ARAIM: advanced receiver autonomous integrity monitoring; SBAS: satellite-based augmentation system), jamming og spoof-detektion i flere lag, map-matching mod tyngdekraft/terræn/magnetfelt og cislunar PNT); og de nyere lag for <b>LEO-PNT</b> (PNT fra lav jordbane), <b>spektrum</b>, <b>solsystem og konstellationsdesign</b>, <b>nettidssynkronisering</b> og <b>kampagner</b> med de skrivere til rapporter, animation og interoperabilitet, som enhver kørsel kan bruge (§1d). På tværs af dem alle kender motoren intet til "quantum" mod "klassisk": den driver sensorernes <em>fejlmodeller</em> gennem et GNSS-udfaldsscenarie, kører en estimator og scorer udfaldet. En kvanteenhed og en klassisk enhed sammenlignes derfor på det samme scenarie og adskiller sig kun i deres (offentliggjorte, citerede) fejlparametre og deres uafhængige støj-seeds.

seg-02110864419e = Dette dokument samler de strukturelle og adfærdsmæssige diagrammer. §{ "1" } er sensorpakkernes kerne; §1a kortlægger de astrodynamiske lag, fusionslagene og alt-PNT-lagene, der er tilføjet siden; §1b–§1d lagene for studier, domæner og output. Se <a1>README</a1> for brug; se <a2>VALIDATION</a2> for, hvad der er og ikke er valideret; se <a3>CAPABILITY</a3> for modenhedstabellen pr. funktion.

seg-7bcc7b5cd049 = Forkortelser brugt i diagrammerne og ikke skrevet ud, hvor de optræder: ADEV, Allan-deviation; BW, båndbredde; CAI, koldatom-interferometer; CZML, Cesium Language; Δ-DOR, delta differential one-way ranging; DO-229E, RTCA's (Radio Technical Commission for Aeronautics) modtagerstandard for SBAS; EKF, udvidet Kalman-filter; FM, frekvensmodulation; GSE, ground support equipment; HPL/VPL, vandret/lodret beskyttelsesniveau; IMU, inertial måleenhed; IOAG, Interagency Operations Advisory Group; IQ, in-phase/quadrature-sampel; ISL, link mellem satellitter; ITU-T, telekommunikationssektoren i International Telecommunication Union; J2–J6, Jordens zonale tyngdeharmoniske af grad { "2" } til { "6" }; KIF, Kshana Interchange Format; KML, Keyhole Markup Language; KPI, nøgletal for ydeevne; L1/L5, GNSS-bærebølgebånd (L2 for CR3BP-halobaner er i stedet Jord–Måne-Lagrange-punktet { "2" }); LEO, lav jordbane; LOO, leave-one-out; LTC, Coordinated Lunar Time; MEO, mellemhøj jordbane; MTIE, maksimal tidsintervalfejl; N2, Hill-diversitetstallet af orden 2; NED, nord-øst-ned; NTN, ikke-terrestrisk net; OD, banebestemmelse; OPS-SAT, Den Europæiske Rumorganisations satellit til softwareforsøg i kredsløb; PPP, præcis punktpositionering; PSD, effekttæthedsspektrum; PVT, position, hastighed og tid; RINEX, Receiver Independent Exchange Format; RK4 / RK5({ "4" }), Runge–Kutta-integratorer af fjerde orden og indlejret femte(fjerde) orden; SH, kugleflade-harmonisk; SigMF, Signal Metadata Format; SIR, sampling importance resampling; SRIF, kvadratrods-informationsfilter; SRP, solstrålingstryk; SSC, spektral separationskoefficient; STK, Systems Tool Kit; SVG, Scalable Vector Graphics; TDEV, tidsdeviation; TDM, CCSDS' (Consultative Committee for Space Data Systems) Tracking Data Message; TLE, two-line element-sæt; TPL, Timing Protection Level; UBX, u-blox' binære protokol; UHF, ultrahøj frekvens; VLBI, interferometri med meget lang baseline; VRW / ARW, tilfældig gang i hastighed / vinkel; WASM, WebAssembly.

seg-a87f668a8f97 = { "1" }. Modulstruktur

seg-0388999448a6 = CLI'en (kommandolinjegrænsefladen) og begge bindinger løber gennem ét indgangspunkt <c1/>, så de aldrig glider fra hinanden. Pakkerne genbruger den fælles kerne (<c2/>, <c3/>, <c4/>); Pakke { "4" } (<c5/>) sammensætter modellerne og estimatorerne fra pakkerne { "1" }–{ "3" } frem for at genimplementere dem; <c6/> udleder en GNSS-tidslinje ud fra geometri, som så fodrer kørslen af Pakke { "1" }. Modulet <c7/> ligger på signalniveau mellem linkbudgettet og måledomænet: det udleder den spektrale separationskoefficient <c8/> ud fra de faktiske spektre for signal og jammer, hvoraf <c9/> nu beregner sin anti-jam-<c10/> frem for at tage en repræsentativ konstant (krydskontrolleret i CI (kontinuerlig integration)); det rummer også designafvejningen for rækkeviddekoden (m-sekvens/Gold).

seg-cee4eb61a8e9 = Tre yderligere moduler udgør rygraden i <b>robusthed uden GNSS</b>. <c1/> besvarer det operative spørgsmål direkte — <em>hvor længe kan dette ur køre frit, før dets tidsfejl overskrider budgettet?</em> — ved at udstille van-Loan-udtrykket i lukket form for fejl under frit forløb som en inversion fra holdover til tærskel, krydskontrolleret mod den flertrins <c2/>-kovariansrekursion. Dets inertielle tvilling findes i <c3/> (<c4/>), som sammensætter koldatom-interferometrets hvide-støjdrift med bias og skalafaktorfejl til et budget for positionsdrift over holdover (bias-leddet krydskontrolleret mod den uafhængige <c5/>-integrator). <c6/> gengiver hele motorens matrix fra krav til modul til test til uafhængig reference til status, med enhedstestede invarianter, der forbyder en <em>valideret</em>-mærkat uden en uafhængig ekstern reference — så påstanden om sikkerhed i beviserne ikke kan glide fra koden.

seg-c7bee352c04d = 1a. Lag for astrodynamik, fusion og alt-PNT

seg-99c44e3a86d5 = Ud over sensorpakkernes kerne deler tre delsystemer den samme fælles kerne og fodrer (eller fodres af) <c1/>. Det <b>astrodynamiske / numeriske</b> lag tilføjer en ikke-analytisk Cowell-propagator ved siden af den analytiske SGP4/SDP4-vej; <b>fusions</b>laget rummer GNSS/INS-estimatorerne; og <b>alt-PNT</b>-laget er map-matching mod tyngdekraften uden GPS (GPS: Global Positioning System). Det er funktioner i biblioteket/scenarierne (se <a1>CAPABILITY</a1> for, hvilke der er koblet til en scenarietype <c2/>, og hvilke der kan nås som en Rust-API (programmeringsgrænseflade)).

seg-69f93294d2c8 = Den numeriske propagators kraftled er slået fra som standard, så aktivering aldrig forstyrrer de udgivne golden-filer. Det 17-tilstands tæt koblede UKF (unscented Kalman filter) driver gennem et GNSS-udfald på den afledte tilfældige gang i hastighed fra kvante-CAI-accelerometret; banebestemmelsen genbruger de samme <c1/>/<c2/> til at propagere en kandidattilstand over sporingsbuen.

seg-bd87e20c284b = Den samme fælles kerne bærer også fire yderligere delsystemer, der ikke er tegnet ovenfor (deres pakker optræder i fordelingen i §{ "4" }): et lag for <b>tid og referencesystem</b> (<c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>), der reducerer TEME↔GCRS↔ITRS (TEME: true equator, mean equinox) og fodrer pakken <c8/>/jordspor; et <b>integritets</b>lag (<c9/>, <c10/>) for RAIM/ARAIM/SBAS; et <b>robusthedslag</b> (<c11/>, <c12/>, <c13/>, <c14/>, <c15/>) for jamming og spoof-detektion i flere lag, med et <b>navigationssignal</b>lag (<c16/>) på signalniveau — effekttæthedsspektre for BPSK-R (BPSK: binary phase-shift keying) / sinus-BOC (BOC: binary offset carrier), den spektrale separationskoefficient <c17/>, der nu udleder anti-jam-<c19/> for <c18/>,RMS-båndbredden (Gabor) for afstandsmåling, den koherente early–late DLL's (delay-locked loop) jitter i kodesporing og envelopen for multipath-fejl (analyse af signalydelse, <b>ikke</b> design af RF-nyttelast (RF: radiofrekvens) / antennehardware — en nyttelastpartners rolle); og et <b>måne- / cislunar</b>lag (<c20/>, <c21/>, <c22/>, <c23/>) for CR3BP-dynamik (circular restricted three-body problem) — herunder { "6" }×{ "6" } tilstandsovergangsmatricen og en differentialkorrektor med enkelt skydning (<c24/>, <c25/>, <c26/>), der frembringer ægte periodiske halo-/NRHO-baner (NRHO: near-rectilinear halo orbit), som gengiver den offentliggjorte L2-sydlige { "9" }:{ "2" } NRHO (Gateway-banen) med periode ≈ { "6.57" } d / perilun ≈ { "3,250" } km (offentliggjort ≈ { "6.56" } d / ≈ { "3,370" } km); den selenocentriske MCI/MCMF-transformation (MCI: Moon-centred inertial; MCMF: Moon-centred, Moon-fixed) af en korrigeret bane og fortsættelse af familier er fortsat opfølgende arbejde, og NRHO'en er en CR3BP-løsning (cirkulær, uden Solen), ikke valideret mod en reel LANS/Gateway-efemeride (LANS: Lunar Augmented Navigation Service) — og LunaNet-integritet. Tilpasningen af kraftmodellen til agenturers efemerider (<c27/>, <c28/>, <c29/>, <c30/>) og det fulde alt-PNT-feltsæt (<c31/>, <c32/>, <c33/>) runder modullisten af; se <a1>CAPABILITY</a1> for modenhed pr. modul.

seg-05f8c8c84d15 = 1b. Robusthedsstudier, evaluering af maskinlæring og reproducerbare artefakter

seg-7350971daf4e = Fem yderligere modulgrupper udgør laget for <b>åbne, reproducerbare studier</b> bag projektets forskningsartikler. I modsætning til scenarie-<c1/>-typerne nås disse som <c2/> / <c3/>-generatorer, der skriver <b>byte-deterministiske</b> artefakter (faste seeds, registreret motorversion + konfigurations-hash). Alle er <b>MODELLED</b> (syntetisk eller kalibrering til offentligt datasæt) og bærer ærlige valideringsmærkater — ingen af dem er en certificering.

seg-86b177166f0e = <b><c1/></b> — det betingede Timing Protection Level: en grænse begrænset af holdover for den <em>uopdagede</em> tidsfejl under spoofing, der sammensætter et k-σ-gulv for monitoren, van-Loan-variansen for frit forløb over detektionsforsinkelsen og en CUSUM-tid til alarm (cumulative sum); kalibreret på en reel optaget spoof (JammerTest { "2024" }). Der findes ingen endelig <em>ubetinget</em> grænse — TPL er betinget af, at en uafhængig krydskontrol opdager angrebet.

seg-8c9d1d90dc8e = <b><c1/></b> — en scoringsmotor for PNT-robusthed afstemt efter rammeværker (DHS (Department of Homeland Security) RPCF (Resilient PNT Conformance Framework) kategorier) plus et studie af beslutningsustabilitet: et Dirichlet-vægtsimpleks, Kendall-τ-rangustabilitet, hyppighed af skift af nr. 1, og fælles <b>diversitetskollaps</b> (Hill-N2), med en integritets-hashet rapport om sikkerhed i beviserne og { "35" } håndudledte tests mod en uafhængig reference. Se <a1>RESILIENCE-CROSSWALK</a1>. Syntetiske arkitekturer afstemt efter RPCF v2.0 — en selvvurdering, ikke en certificering.

seg-b347924b874e = <b><c1/> / <c2/> / <c3/> / <c4/></b> — studiet af optimismegabet ved RF-forringelser: et mærket syntetisk korpus og en detektoragnostisk ROC/AUC-ramme (ROC: receiver operating characteristic; AUC: area under the curve), et panel med 13 detektorer (energi/AGC/SQM/paritet (AGC: automatic gain control; SQM: signal-quality monitoring) plus detektorer med seedet logistisk regression og MLP med ét skjult lag (MLP: multi-layer perceptron)), skaleringslove inden for og uden for fordelingen med en permutationsnulhypotese og en leave-one-out-prædiktor for forringelse uden for fordelingen. Evalueringsmålene er valideret bit for bit mod scikit-learn.

seg-36206681024f = <b><c1/> / <c2/></b> — en front end til softwaredefineret modtager (rå IQ/IF (IQ: in-phase/quadrature; IF: mellemfrekvens) → korrelatorens early/prompt/late-aftapninger → SQM) og indlæsningsadaptere (RINEX, u-blox UBX, GnssLogger, JammerTest, Yunnan, SatGrid), der lader de samme detektorer køre over optagelser leveret lokalt; ingen datasæt er committet til repositoriet.

seg-fefd78868fc2 = <b><c1/> / <c2/></b> — krydsningskortet for robusthed, kvante mod klassisk, under parameterusikkerhed og afvejningen af holdover-fordelen ud fra målt ADEV; afvejningens numeriske kerner er valideret mod scipy.

seg-5749f1300772 = 1c. Lag for integritet, GNSS, dybt rum, måne og mission

seg-f44755d6d921 = De øvrige domæner kobles til den samme <c1/>-fordeling og genbruger den fælles kerne, referencesystemerne og geometrien. Alt her er <b>MODELLED</b>, medmindre en række i <c2/>-matricen henviser til en ekstern uafhængig reference (RAIM-kerne mod SciPy, SBAS mod RTKLIB-forken (et open source-bibliotek til kinematisk positionering i realtid), gnss_lib_py's DOP-kerne (dilution of precision), OPS-SAT-evalueringen, ARAIM-kernen for beskyttelsesniveau på månen, konsistensen mellem leverandørers månefemerider) — resten af månepakken og kvantedemonstratoren er modelleret, illustrativ, baseret på offentlige kilder og bærer ingen påstand om TRL (technology readiness level) / heritage / tilslutning fra et agentur.

seg-044940c8d052 = 1d. LEO PNT, spektrum, solsystem, nettidssynkronisering, kampagner og output

seg-253a26d9cc5d = De nyeste lag følger samme mønster: hvert er en eller flere scenarie-<c1/>-typer, fordelt fra <c2/>, bygget på den fælles kerne og MODELLED, medmindre en matrixrække navngiver en ekstern uafhængig reference.

seg-e47cccd54da3 = Detaljerne pr. type findes i <a1>LEO-PNT</a1>, <a2>LEO-SIGNAL</a2>, <a3>LEO-PASS</a3>, <a4>LEO-NAVMSG</a4>, <a5>LEO-PNT-FUSION</a5>, <a6>SPECTRUM</a6>, <a7>CONSTELLATION-DESIGN</a7>, <a8>TELECOM-TIMING</a8>, <a9>SLOT-TIMING</a9>, <a10>CAMPAIGNS</a10>, <a11>REPORTS</a11>, <a12>ANIMATION</a12> og <a13>INTEROP</a13>.

seg-d04b21c7cb6c = 1e. Lag for modtagertillid, evidens, telemetri, træning og compliance ({ "0.35" })

seg-84ee122959b4 = Disse lag læser en modtagers egen log eller skriver filer til andre værktøjer; ingen af dem syntetiserer eller udsender et radiofrekvenssignal. De ligger ved siden af <c1/> frem for under scenarietyperne, bortset fra <c2/> selv, som er en scenarietype. Alle er MODELLED, medmindre en matrixrække navngiver en ekstern uafhængig reference, og de maritime output er vejledende, ikke typegodkendt navigationsudstyr.

seg-aab745a65e76 = Modul

seg-9d17ad3e87c8 = Beskrevet i

seg-920b6b14c0e2 = scorer en modtagerlog epoke for epoke med tillidsmonitorerne; en fartøjsplatform tilføjer de maritime monitorer og scoren på 0-100 med årsager

seg-a77d1a8a62b5 = <a1>RECEIVER-TRUST</a1>, <a2>MARITIME-TRUST</a2>

seg-c311dfc2a161 = den samme scoring på en strøm, mens den ankommer (stdin, en fil, der tilføjes til, TCP eller UDP), <c1/>-sætningen og den valgfri gate; <c2/> er det hele uden input eller output

seg-07b2d6edf7b9 = en signeret, hashkædet pakke med et logvindue, dets konfiguration og motorens resultat, der kan verificeres offline; valgfrit RFC { "3161" }-tidsstempeltoken

seg-32d08730b9c0 = tillidsstrømmen som Prometheus-metrikker, syslog-hændelser (CEF eller LEEF) og valgfri OpenTelemetry (funktionen <c1/>, slået fra som standard)

seg-53311b8c3b93 = syntetisk bro-NMEA { "0183" } med scriptede hændelser for jamming, drag-off, tidsspoofing og replay samt en instruktørlog, til besætningstræning (kun tekst)

seg-f7cc3cfbdfc6 = aggregerede kort over forringet navigation ud fra åbent licenserede fly- og skibsrapporter, og en rutes eksponering for dem; kun lokale filer

seg-83fe3c87e2d5 = en verifikator i modtagersiden for Galileo OSNMA: læser I/NAV-sider (rene sider, vektor-CSV, en UBX-strøm), kontrollerer den signerede nøgle, TESLA-kæden og MAC'erne og rapporterer pr. satellit, om navigationsdataene er autentificeret; <c1/> er den ene vej, som kommandolinjen, Python og WebAssembly deler; kun autentificeringsstatus, ikke en integritetstjeneste

seg-bf8cd5a45deb = OSNMA

seg-843a83b82283 = kortlægger Kshana-output til offentlige robusthedsrammeværker og udfylder kortlægningen ud fra resultatdokumenter; <c1/> og <c2/> tager tekster, ikke stier

seg-e16c483479ce = et scenaries køretøjsbevægelse og hændelser som en bevægelses-CSV, NMEA, waypoint-tekst og hændelsesfiler til en GNSS-simulator i laboratoriet; der skrives intet signal

seg-044c58c98397 = Integrationer til både (Signal K-pluginet, OpenCPN i gate-tilstand og referencebygget) kalder kommandolinjeværktøjet; se <a1>MARINE-INTEGRATIONS</a1>.

seg-cb8d8ff847eb = { "2" }. Motorens pipeline (pr. kørsel)

seg-53e9e596ca44 = Hver kørsel stepper en enkelt sensormodel gennem tidsgitteret, styrer den, så længe GNSS er nominelt, og lader den løbe frit (holdover / dead-reckoning) under udfaldet.

seg-257407f3c375 = Et scenarie kører denne pipeline to gange, én gang for kvantesensoren og én gang for den klassiske sensor, med <b>uafhængige seeds</b> (<c1/>), så de to støjrealiseringer er ukorrelerede.

seg-4659e89ba5f5 = { "3" }. Fejlmodelgrænsefladen (udvidelsespunktet)

seg-7b70e8b1b98a = Enhver sensor implementerer den samme idé: et tilstandsfuldt objekt, hvis <c1/> fremfører dets interne stokastiske fejl, og hvis akkumulerede tilstand aflæses i hvert tick. Ure udstiller akkumuleret fase; accelerometre udstiller dobbeltintegreret position; forbindelser udstiller jitter pr. måling.

seg-79ab76c6dbc0 = <c1/> følger med ind i resultatet, så hvert tal i outputtet kan spores til den publicerede kilde, som er angivet i <c2/>.

seg-514c49659947 = Ved siden af den analytiske <c1/> kører urpakken et Kalman-filter med to tilstande (fase, frekvens) (<c2/>), hvis processtøj svarer til sandhedsmodellen. Under frit løb gennem et udfald vokser dets fasefejlvarians til præcis <c3/>, den analytiske holdover-relation, og dets online 1-σ-grænse bruges til at udfylde kvalitetsmålet <b>Integritet</b> (andelen af udfaldets sampler, hvor fejlen holder sig inden for k-σ-grænsen).

seg-7404589deb40 = { "4" }. Dispatch (CLI og bindinger)

seg-6138513a43f7 = <c1/> er det eneste indgangspunkt: den kigger på det øverste <c2/>, deserialiserer det tilsvarende scenarie, kører pakken og returnerer <c3/> (<c4/> er kun med for de typer, der udgiver en reproducerbarhedstabel). CLI'en skriver dem til filer, plus rapporten (<c5/>, <c6/>) og eventuelt output fra <c7/> / <c8/>; Python- og WebAssembly-bindingerne returnerer dem til værten. Én dispatch, ingen afdrift.

seg-524f749be364 = Dispatch sker på en typet enum <c1/>, som matches udtømmende (se næste underafsnit), så tilføjelse af en pakke er en ændring, der kontrolleres af compileren. Et manglende <c2/> falder tilbage på pakken <c3/>, så eksisterende scenarier med én type deserialiseres uændret (<c4/> ignorerer feltet <c5/> på hver scenariestruktur). En ukendt <c6/> afvises med <c7/>, som nævner den nærmeste indbyggede type, når navnet ligner en tastefejl.

seg-eedaeae2a7e7 = Typet dispatch og det strukturerede API

seg-ca47f566eaee = Dispatch sker på en typet enum <c1/>, ikke på et råt strengmatch: <c2/> afgør feltet <c3/> til en variant, og dispatcheren matcher på den udtømmende, så tilføjelse af en pakke er en ændring, der kontrolleres af compileren, ikke en tastefejl i en streng. To typede flader ligger ved siden af den strengreturnerende <c4/> (bevaret til CLI'en og eksisterende bindinger):

seg-167c47049329 = <b><c1/></b> — den typede indgang med en struktureret fejltaksonomi (<c2/>, <c3/>, <c4/>, <c5/>). Hver fejl bærer en stabil <c6/>, så en kalder kan forgrene sig på fejlkategorien i stedet for at parse meddelelsen. Bindingerne udstiller den som <c7/>.

seg-1943051b3b20 = <b><c1/></b> (og <c2/>, udstillet i bindingerne som <c3/>) — programmatisk introspektion: hver types navn, beskrivelse og påkrævede/valgfrie felter, til autofuldførelse i brugerflader og notebooks.

seg-630243592256 = Udvidelse af Kshana med en ekstern pakke

seg-d1adedd2c08b = En tredjepartspakke implementerer to små, semver-stabile traits fra <c1/>:

seg-d01471b13324 = <c1/> har også en standardmetode <c2/>, som ikke gør noget, medmindre en pakke vælger at bruge registrets dispatch-søm i <c3/>. Den indbyggede pakke <c4/> er koblet ind gennem <c5/> som gennemarbejdet eksempel; pakker uden for træet følger den samme kontrakt uden at forke kernen (efter samme mønster som udvidelsespunktet <c6/> i §{ "3" }, som det private robusthedsoverlay bruger).

seg-5b0449d96bc3 = Kshana har derfor <b>to stabile udvidelsessømme</b> — tilføj en <em>sensor</em> ved at implementere <c1/> (§{ "3" }), eller tilføj en hel <em>scenarietype</em> ved at implementere <c2/> + <c3/> — begge semver-stabile, og ingen kræver en fork af kernen:

seg-3928a007756b = { "5" }. Den hybride slutsten

seg-7f38e825519a = Den hybride pakke kører en <em>suite</em> (ét ur + én inertisensor) og kræver, at <b>både</b> tidssynkronisering og position holder sig inden for specifikationen; <c1/> er tiden, indtil en af dem brydes. Eventuelt resynkroniserer et optisk inter-satellitlink <b>uret</b> under udfaldet — kun tidsstøtte; positionen resynkroniseres ikke, fordi tidsoverførsel giver tid, ikke position. Det er det, der isolerer inertisensoren som den begrænsende faktor.

seg-17a8683f0982 = { "6" }. GNSS-tilgængelighed udledt af geometri

seg-afdb141ac367 = <c1/> er et deterministisk geometrilag uden afhængigheder. En <c2/> er enten den analytiske Kepler-<c3/> (to-legeme, eventuelt sekulær J2) eller en fuld <c4/>-propagator bygget ud fra et komplet two-line element-sæt; en Walker-delta-generator producerer syntetiske konstellationer, og sigtelinjesynlighed = jordens okkultation + elevationsmaske. Antallet af synlige satellitter afbildes til en GNSS-tilstand (≥{ "4" } = nominel, { "1" }–{ "3" } = forringet, { "0" } = nægtet), og <c5/> omsætter det til den tilgængelighedstidslinje, der driver den almindelige ur-holdover-kørsel. Tilgængelighed er altså <em>udledt af geometri</em> frem for håndskrevet, mens kørslen, estimatoren og scoringen er uændrede.

seg-da82c97ac5c8 = En konstellation, der leveres som fulde TLE'er, propageres med SGP4/SDP4-modellen i <c1/> (valideret mod AIAA (American Institute of Aeronautics and Astronautics) 2006-6753-vektorerne); elementer med kun linje 2 følger den analytiske to-legeme-vej. De to kan blandes i én konstellationsblok.

seg-a47031620b54 = { "7" }. Bindinger

seg-57fb29fdd9d9 = Kernen kompilerer uændret til native, til en Python-udvidelse og til WebAssembly. Python-modulerne (<c1/>, PyO3 abi3) og WebAssembly-modulerne (<c2/>, wasm-bindgen) er valgfrie afhængigheder bag feature-flag (<c3/> / <c4/>): standardbygget og testsuiten kompilerer dem aldrig, mens afhængighedsrevisionens gate (<c5/>) inspicerer deres afhængighedstræer, fordi disse crates leveres inde i wheel-filen og npm-pakken. Begge kalder <c6/>, så alle flader returnerer identiske resultater. WebAssembly-modulet bærer browser-legepladsen i <c7/> og eksporterer tretten funktioner: <c8/>, <c9/> (én motorkørsel, der returnerer resultat, diagram, oversigt og tabel samlet), <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, kodeken <c16/> / <c17/> til delbare URL'er (URL: webadresse) og de tre eksportører <c18/> / <c19/> / <c20/>, som bærer legepladsens eksportmenu. To yderligere indgange når det samme <c21/>: <b>MCP-serveren (Model Context Protocol)</b> (<c22/>, en <c23/>-crate uden for workspace, der udstiller femten værktøjer — <c24/>, <c25/>, <c26/>, <c27/>, <c28/>, <c29/>, <c30/>, <c31/>, <c32/>, <c33/>, <c34/>, <c35/>, <c36/>, <c37/>, <c38/>; de to eksempelværktøjer læser de medfølgende scenarier gennem bibliotekets funktion <c39/>, som er slået fra som standard, og som kun denne server slår til) og <b>JetBrains IDE-pluginet (integrated development environment)</b> (<c40/>, et Kotlin-projekt, der kalder CLI'en <c41/> i stedet for at linke biblioteket).

seg-a6620e0d6eef = Feature-gating: Python og WASM er <c1/> / <c2/>; tabellen med medfølgende scenarier er <c3/> (MCP-serverens eneste brug af den); MCP-serveren og krydskontrollerne i <c4/> er crates, der er UDELADT fra workspace; IDE-pluginet linker ingenting — det kører CLI'en.

seg-7bc5df56e4e5 = { "8" }. Determinisme og reproducerbarhed

seg-fb95c37c7bb9 = Al tilfældighed løber gennem én seedet <c1/> pr. kørsel; rækkefølgen af trin er fast, så <c2/>.

seg-e026c87beb26 = Resultatet bærer en SHA-256 (SHA: Secure Hash Algorithm) <c1/>; <c2/> kører et referencescenarie to gange og kontrollerer, at outputtet er identisk byte for byte.

seg-42a3bdcbd99f = Den samme motor kompilerer til native, til en Python-udvidelse og til <c1/> til kørsler i browseren, der giver de samme tal.

seg-12e00717c2d4 = { "9" }. Udskudt / fremtidig struktur

seg-8a8e1b93b704 = Astrodynamik-, fusions- og alt-PNT-lagene i §1a — den fulde SGP4/SDP4-propagator, den numeriske Cowell-propagator med en kraftmodel med syv perturbationer og to adaptive integratorer, manøvre- og banedesign, banebestemmelse, GNSS/INS-estimatorerne med 15, 8 og 17 tilstande, det koblede ur+positionsfilter og gravitationskortmatchning — er alle leveret, sammen med Security FoM med en aktiv spoof-demonstrator, ægte TLE-/multikonstellationsgeometri, Monte Carlo-bånd, trade-study-sweeps, den udskrivbare HTML-rapport (HyperText Markup Language) med dens maskinlæsbare tvilling og workflows til release, publish, wheels og pages.

seg-318ad50d3826 = Flere funktioner, der engang stod her som fremtidigt arbejde, er siden <b>leveret</b> og er beskrevet ovenfor eller i <a1>VALIDATION</a1>: den fulde IAU 2000A-nutation og den ækvinoksfrie CIO GCRS↔ITRS / ITRF-reduktion (International Terrestrial Reference Frame) (valideret bit for bit mod SOFA/ERFA (SOFA: Standards of Fundamental Astronomy; ERFA: Essential Routines for Fundamental Astronomy)), EGM2008-geopotentialet (Earth Gravitational Model { "2008" }) til grad/orden { "70" }, leddet <b>Lense–Thirring</b> (frame-dragging), tidevand i fast jord, hav og atmosfære, en krydsvalidering af efemeriden på DE-niveau (DE440/ANISE (DE440: Development Ephemeris { "440" }; ANISE: Attitude, Navigation, Instrument, Spacecraft, Ephemeris — et rent Rust-værktøjssæt til planetgeometri)), den eksterne krydsvalidering mod Orekit { "12.2" } af den numeriske Cowell-propagator ({ "0.08" } m over { "24" } h) og af batch- og sekventiel banebestemmelse samt den tæt koblede navigator med 17 tilstande, der er gjort tilgængelig som scenarietypen <c1/>.

seg-068119b15b27 = De resterende opfølgninger spores i <a1>CHANGELOG</a1> <c1/> og i køreplanen pr. funktion i <a2>CAPABILITY</a2>: en ekstern orakelværdi til EGM-evaluatoren (Earth Gravitational Model) af høj grad netop på polaksen og en pyshtools-ren sammenligning nær polen (evaluatoren til grad { "2190" } og dens indlæser <c2/> til kørselstid er leveret, MODELLED; se <c3/>), en tidsvarierende rumvejrsdriver til den valgfrie densitetsmodel NRLMSISE-00 for atmosfærisk modstand (NRLMSISE: Naval Research Laboratory Mass Spectrometer and Incoherent Scatter Radar Extended atmosfæremodel) (standardtætheden for modstand er den statiske eksponentielle model, og tætheden Jacchia-71 for typen <c4/> er karakteriseret mod NRLMSISE-00, men ikke erstattet af den), en ekstern kontrol af den valgfrie skygge med solens randformørkelse, bærebølgefase-GNSS/INS-tætkobling og et ægte EGM2008/EIGEN-gravitationskort (EIGEN: European Improved Gravity model of the Earth by New techniques) til alt-PNT-matcheren.

seg-b48f69ea54b3 = Et privat overlay-repo rummer eksportfølsom robusthedsdybde; det kobles ind gennem den samme grænseflade <c1/> (og kontrakten <c2/> i §{ "4" }) uden at ændre den offentlige motor.

seg-2f88ab8f67e8 = <s1>Forrige</s1>Hvor Kshana kører

seg-02b0e0fdcdbe = <s1>Næste</s1>Hvor Kshana står
