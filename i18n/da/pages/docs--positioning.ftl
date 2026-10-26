# docs--positioning: translations (da)

seg-6555ff9a6d8e = Output

seg-0be9b5747c00 = Kshana

seg-94058315dfe4 = Input

seg-09721fbcf7fc = Kilde: <c1/>

seg-5b362d7b0903 = Kshana er en åben, reproducerbar <b>evidensmotor for robusthed i PNT (positionering, navigation og tidssynkronisering)</b>. Du beskriver et scenarie — sensorerne eller urene, et udfald af GNSS (global navigation satellite system), et jamming- eller spoofingangreb, et budget — og den fortæller, hvor godt tid og position holder, scoret mod operationelle kvalitetsmål (FoM). Hver funktion bag disse tal er i en maskinkontrolleret matrix mærket <b>VALIDATED</b> (kontrolleret mod en uafhængig ekstern reference), <b>MODELLED</b> (internt konsistent, ikke kontrolleret eksternt) eller <b>PARTNER</b> (ejet af en hardwarepartner). Denne side siger, hvor den fører an, hvad den er til, og hvad den ikke er.

seg-48d576a345e3 = Hvor den fører an: tidssynkronisering og holdover til kritisk infrastruktur

seg-f41d8a48ff13 = Den bedst validerede del af motoren er tidssynkronisering. Telekommunikationsnet, elnet og finansielle markedspladser henter deres tid fra GNSS, og hver af dem skal dimensionere <b>holdover</b>: hvor længe et lokalt ur kan køre frit gennem et tab af GNSS, før dets tidsfejl bryder budgettet.

seg-70d00c5fe203 = <b>Hvad der er VALIDATED.</b> De estimatorer for frekvensstabilitet, som et holdover-svar bygger på — Allan-deviation (ADEV), modificeret Allan-deviation (MDEV), tidsdeviation (TDEV), maksimal tidsintervalfejl (MTIE) og Theo1-estimatoren med udvidet område — kontrolleres mod Stable32-referencedeviationer, det uafhængige bibliotek <c1/> og et reelt målt cæsiumur. Beregningen af holdoverens kovarians ved frit løb og dens inversion til en holdover-tid kontrolleres mod SciPy. Se <a1><c2/></a1> for hver række, dens test og dens uafhængige reference.

seg-9fbedc930565 = <b>Hvad der forbliver MODELLED.</b> Støjbundgrænserne for hver urklasse (for eksempel den langsigtede bundgrænse for en given oscillatorklasse) afgør svaret for et stabilt ur, og de er repræsentative tal, ikke målinger af din enhed. Angiv målte bundgrænser for et tal, du agter at forsvare.

seg-700df4898ede = <b>Telekommunikationsenheder.</b> Scenariekinden <c1/> rapporterer MTIE og TDEV, kontrollerer dem mod masker fra International Telecommunication Unions standardiseringssektor for telekommunikation (ITU-T) — G.8272 for et primært referencetidsur (PRTC), G.8272.1 for et forbedret PRTC (ePRTC), G.8273.2 for et telekommunikationsgrænseur (T-BC) og G.8271.1 for netgrænserne ved referencepunkt C — og rapporterer, hvor længe en holdover holder sig inden for hvert tidsfejlbudget. Se <a1><c2/></a1>.

seg-50421d8247ab = Hvad der gør den anderledes

seg-7ec913b140ed = Fysikken og standarderne er ikke forskellen: Simplified General Perturbations { "4" } (SGP4)-propagering, Allan-deviation, referencesystemer og dilution of precision findes, gratis og korrekte, i andre biblioteker, og Kshana kontrollerer sig selv mod flere af dem. Forskellen er evidensdisciplinen:

seg-f7d466d5215b = <b>Åben.</b> Motoren er under GNU Affero General Public License (AGPL), så alle kan læse og køre den igen. En kommerciel licens findes til lukket integration.

seg-76ff24c1939b = <b>Reproducerbar.</b> Et resultat er bestemt af <c1/>, bit for bit, og en kørsel kan deles som et link til browserens playground.

seg-6df34e089b53 = <b>Mærket med proveniens.</b> Hver sensorparameter er henført til en publiceret kilde (<a1><c1/></a1>), og hver funktion bærer sit niveau VALIDATED / MODELLED / PARTNER. En kontrol i kontinuerlig integration (CI) afviser en VALIDATED række uden uafhængig ekstern reference, så en intern selvkontrol ikke kan fremstilles som en validering.

seg-8bccfe110f4c = Vi har ikke fundet noget andet åbent værktøj, der kombinerer disse på tværs af holdover, integritet, inertikørsel uden støtte og kvantesensorer, men en søgning, der intet finder, er ikke bevis for, at intet findes; vi påstår ikke at være de eneste.

seg-e942b2474960 = Kvante: en neutral afvejningsmetode, resultater mærket MODELLED

seg-655769464447 = Kshana sammenligner kvante- og klassiske ure og inertisensorer på det samme scenarie med den samme kode: hver enhed er en fejlmodel, og motoren ved ikke, hvilken der er "kvante". Betragt det som <b>en neutral afvejningsmetode mellem kvante og klassisk, hvis resultater er mærket MODELLED</b>. De fleste input er publicerede Allan-/støjbudgetkoefficienter; koldatom-interferometer-accelerometeret har et lag ud fra første principper, der udleder dets støjkoefficient. En partners målte Allan-deviationsdata kan føres ind gennem kinden <c1/>, som er vejen til at fremme en bestemt enheds tal. Se <a1><c2/></a1> og <a2><c3/></a2>.

seg-eb5d247b42aa = Månen, cislunar og dybt rum: vedligeholdt, ikke hovedpunktet

seg-4b9bd68b7fb1 = Suiten for Månen / cislunar (integritetsovervågning for Månen, Jord–Måne-trelegemekernen, månens tidsskalaer, analyse af servicevolumen) og motoren til radiometrisk navigation i dybt rum er vedligeholdte funktioner. De fleste af deres rækker er MODELLED, og dedikerede værktøjer betjener allerede månenavigation, så de tilbydes som funktioner i den samme motor, hver med sit eget niveau, og ikke som det førende.

seg-b9b2e29e51d9 = Den samme motor, med de samme niveauer, dækker også:

seg-89d1923b3ed9 = <b>PNT i lav jordbane (LEO), fra ende til anden.</b> Signaludformning (<c1/>), passage og linkbudget pr. bånd (<c2/>), udsendt navigationsmeddelelse (<c3/>), fusioneret positionering fra mellem og lav jordbane (<c4/>), konvergens af præcis punktpositionering (PPP) med LEO-augmentering (<c5/>), positionering fra et ikke-terrestrisk 5G-net (<c6/>) og <c7/>, som overdrager hvert trins output til det næste for ét system.

seg-2e5b57ccd454 = <b>Spektrum.</b> Et vandfald af effektspektraltæthed for L-bånd (og ultrahøjfrekvens (UHF), S- og C-bånd) under en scriptet tidslinje for en jammer, med jammer-til-signal-forhold pr. bånd og effektiv bærebølge-til-støjtæthed (<c1/>) samt Signal Metadata Format (SigMF)-optagelse ind og ud.

seg-0e7fd993a838 = <b>Solsystemet og ethvert centrallegeme.</b> Positioner og fysiske konstanter for planeterne og de store måner (<c1/>), positionering omkring hvert af disse legemer (<c2/>) samt udformning af Walker- og publicerede slotkonstellationer med dækning og dilution-of-precision-kort omkring hvert af dem (<c3/>).

seg-9d993a356eb0 = <b>Kampagner.</b> Eksisterende kinds kædet på én fælles tidslinje, sweepet, kørt som seedede Monte Carlo-ensembler eller kørt side om side under fælles betingelser (<c1/>).

seg-905a9aa8c47c = <b>Output.</b> Hver kørsel skriver et resultatdokument, et diagram og en rapport i HTML (HyperText Markup Language) og JSON (JavaScript Object Notation); <c1/> skriver en animation som SVG (Scalable Vector Graphics), HTML eller billedsekvens; <c2/> skriver CZML (Cesium Language), KML (Keyhole Markup Language), GeoJSON eller STK (Systems Tool Kit)-efemeride for de kinds, der placerer ting på Jorden, og SigMF for <c3/>.

seg-75206591a52a = De fleste af disse rækker er MODELLED; verifikationsmatrixen nævner de få, der er VALIDATED (for eksempel anbefalingerne fra International Telecommunication Union om regn og scintillation, Galileos algoritme for udsendt efemeride, CRC-24Q-rammekontrollen (24-bit cyklisk redundanskontrol) og løseren for planeternes lystid).

seg-785218a0ea66 = Hvad Kshana ikke er

seg-fae54ec38477 = <b>Ikke en radiofrekvens (RF)-signalsimulator eller hardware-in-the-loop (HIL)-rig.</b> Kshana styrer ingen radiohardware og udsender intet. Det meste af den arbejder på niveau med fejlmodeller og linkbudgetter, før hardware eller laboratorietid købes. På signalniveau er den kun software: GNSS IQ-laget (<c1/>) skriver IQ-sampelfiler (in-phase/quadrature) i basisbånd med legitime GNSS-signaler til softwaremodtagere og kører sin egen softwaremodtager på dem; kinden <c2/> skriver med sin <c3/>-sektion (siden { "0.29.0" }) et SigMF-øjebliksbillede (Signal Metadata Format) af sin analytiske model, der inkluderer de konfigurerede jammere (støjlignende jammere bin for bin, toner og chirps som bølgeformer); og <c4/> summerer et ægte signal og en spooferreplika i hukommelsen for at afprøve fangst af løkken, uden at skrive det ud. At afprøve en hardwaremodtager mod reel RF-stimulus er en RF-simulators opgave.

seg-ca243f3f8e8d = <b>Ikke en erstatning for MATLAB/Simulink, STK eller Orekit.</b> Den sidder ved siden af dem. Den læser og skriver de udvekslingsformater, de bruger — CCSDS (Consultative Committee for Space Data Systems) Orbit Ephemeris Messages, SP3 (Standard Product { "3" }) præcise baner, RINEX (Receiver Independent Exchange Format) — skriver CZML, KML, GeoJSON og STK-efemeride til deres viewere, og dens numeriske kraftmodel krydskontrolleres mod Orekit og tilbydes ikke i dens sted.

seg-8fa4e93c3d0e = <b>Ikke en GNSS-behandlingsmotor for bærebølgefase eller en positioneringstjeneste</b> (se nedenfor).

seg-8ba4b67bc813 = <b>Ikke en certificeringsmyndighed.</b> En mærkning VALIDATED betyder, at en funktion stemmer med en ekstern uafhængig reference; den er ikke en certificering af noget produkt eller nogen operatør.

seg-362b857140b9 = Hvad Kshana er og ikke er i forhold til en GNSS-behandlingsmotor

seg-f50951b2e9c8 = Kshana er <b>ikke</b> en GNSS-<em>behandlings</em>motor for bærebølgefase, og ingen scenariekind er en positioneringstjeneste. Den har dog en fod i måledomænet, som bibliotekskode, som ydeevnestudiet læner sig op ad, og som kontrolleres mod uafhængige referencer. Kinematisk positionering i realtid (RTK) over kort baseline med heltalsfiksering med LAMBDA (least-squares ambiguity decorrelation adjustment) kører på reelle RINEX-observationer med to frekvenser, ligesom et statisk float-filter til præcis punktpositionering (PPP) med IGS' endelige baner og ure, og det modtagerur, filteret estimerer, er en tidsløsning mod IGS' endelige stationsur. Hver af de tre er en VALIDATED række i <a1>verifikationsmatrixen</a1>, mod de IGS-stationsdata, den nævner dér, og hver kører på statiske, korte observationsvinduer og ikke som en streamingtjeneste med opløsning af heltalsmultiplicitet over lange baselines, bærebølgeudjævning eller en kinematisk rover. Kinden <c1/> kører et float-PPP-filter på kode og bærebølgefase, men på målinger, den selv simulerer, for at studere konvergenstid med og uden LEO-augmentering; den behandler ikke en observationsfil. Kinden <c2/> (position, hastighed og tid) løser en modtagerposition ud fra reelle RINEX-kodepseudoafstande plus udsendt efemeride, valideret mod en opmålt koordinat fra International GNSS Service (IGS) (station ABMF, 2018-05-13) til <b>{ "5.7" } m 3D RMS (root mean square) / { "1.1" } m vandret</b>. Men produktet er ydeevnestudiet, ikke positioneringstjenesten, og rammen nedenfor skal spare en kommende bruger for skuffelsen over det forkerte værktøj.

seg-169dd778c45f = En GNSS-behandlingsmotor (RTKLIB, et open source-bibliotek til kinematisk positionering i realtid; gLAB, GNSS-laboratoriets værktøjssuite fra gAGE-gruppen ved det tekniske universitet i Catalonien)

seg-4faa1de0ef70 = et scenarie: sensorfejlmodeller, udfaldsvinduer, geometri — eller, for <c1/>, en reel RINEX-observationsfil plus udsendt navigation

seg-ae60d0def8af = reelle GNSS-observationer (RINEX), efemerider, korrektioner

seg-5fce99bb803d = kvalitetsmål for ydeevne: holdover, tids-/positionsfejl, tilgængelighed, grænser for integritet/sikkerhed — plus en position med kodebaseret enkeltpunktspositionering (SPP) fra kinden <c1/>

seg-b752bb5c3f64 = en <b>løsning</b> for position/hastighed/tid (SPP, PPP, RTK)

seg-dd8a47d4f618 = Spørgsmål, den besvarer

seg-b52fd8e0c856 = "hvor god <em>ville</em> denne arkitektur være, og hvor bryder den sammen?"

seg-09672ca004ac = "hvor er jeg <em>nu</em> ud fra disse målinger?"

seg-00d5ebd56088 = Kvante-/optiske sensorer

seg-a55f2bd6c1bf = modelleret som fejlmodeller (optiske ure, koldatom-inertimåleenhed (IMU), optisk tidsoverførsel), resultater mærket MODELLED

seg-7ccfb3395d84 = ikke modelleret

seg-ec21dbf4b910 = Behandling af reelle observationer

seg-324ef9a933d5 = kode-SPP ud fra reelle RINEX-observationer (<c1/>, meterniveau); RTK over kort baseline med LAMBDA og statisk float-PPP på reel bærebølgefase, som bibliotekskode kontrolleret mod IGS-stationer (VALIDATED, statiske og korte vinduer, ikke en streamingtjeneste); plus geometri / dilution of precision (DOP) / tilgængelighed

seg-e15db8a33a9a = kernekompetencen, helt til PPP/RTK på bærebølgefase

seg-e6df7ccdba96 = nul — kører i en browserfane (WebAssembly)

seg-812c1c70ce63 = native bygning / værktøjskæde

seg-58df67617e1a = Supplerende, ikke konkurrerende — RTKLIB og gLAB

seg-29aeb97bd509 = <a1>RTKLIB</a1> og <a2>gLAB</a2> er modne, udbredt brugte GNSS-behandlingssuiter. De tager reelle målinger og frembringer en positionsløsning (SPP/PPP/RTK; gLAB er også et fremragende undervisningsværktøj med stærk arv hos Den Europæiske Rumorganisation (ESA) og European Geostationary Navigation Overlay Service (EGNOS)). Kshana erstatter dem <b>ikke</b> og forsøger det ikke. Dens observationssti er smal: kodebaseret enkeltpunktspositionering (<c1/>) og, som kontrolleret bibliotekskode, RTK over kort baseline med LAMBDA-heltalsfiksering og et statisk float-PPP-filter på reelle observationer med to frekvenser, hver VALIDATED mod IGS-stationsdata (PPP-filteret også mod en RTKLIB-kørsel på de samme input). Den har ingen bærebølgeudjævning, ingen kinematisk eller streaming-behandling og ingen opløsning af heltalsmultiplicitet over lange baselines, og <c2/> estimerer ikke troposfæren eller ionosfæren — den anvender troposfæremodellerne fra Saastamoinen/Niell og den ionosfærefrie L1/L2-kombination, den løser ikke for dem som tilstande.

seg-9c4e70ce8a55 = Værktøjskæden er supplerende:

seg-01f43da4858c = <b>RTKLIB / gLAB</b> besvarer <em>"hvor er jeg, ud fra disse signaler?"</em>

seg-f5370894cdd1 = <b>Kshana</b> besvarer <em>"hvor længe beholder jeg et godt svar, når disse signaler forsvinder — og hvad giver et bedre ur eller en bedre inertisensor, klassisk eller kvante, mig?"</em>

seg-2403d6b115de = Et naturligt arbejdsforløb bruger en behandlingsmotor til det segment, hvor GNSS er tilgængelig, og Kshana til at studere <b>holdover</b>-adfærden og sensorernes afvejningsrum omkring den. Hvis du har brug for en positioneringstjeneste på bærebølgefase — kinematisk PPP eller RTK, lange baselines, opløsning af heltalsmultiplicitet i net — så brug RTKLIB eller gLAB; hvis du har brug for reproducerbar, mærket evidens om robusthed og holdover, er det den opgave, Kshana er bygget til.

seg-21631e5c6be3 = Et browserniveau uden installation

seg-9b01dd6721ed = De fleste simuleringsværktøjer på dette område (RTKLIB, gLAB, General Mission Analysis Tool (GMAT), Orekit, STK) kræver en native installation eller en licens og en indlæringskurve før det første resultat. Kshana kompileres til WebAssembly og kører <b>helt i browseren</b> — <a1>playgrounden</a1> indlæser et gennemarbejdet scenarie, kører den reelle motor hos klienten (intet uploades) og viser resultatet på få sekunder. Guidede skydere og scenarier med ét klik betyder, at det første brugbare resultat hverken kræver TOML (Tom's Obvious Minimal Language, scenariefilens format) eller en værktøjskæde.

seg-b1cb4b8f0ef1 = Det niveau uden installation er en bevidst position:

seg-33b361bde50d = <b>Rækkevidde</b> — en reviewer, studerende eller indkøber kan prøve den faktiske motor fra et link, på enhver enhed, uden opsætning.

seg-a4a4ebf89cee = <b>Reproducerbarhed</b> — den samme motor, der leveres i browseren, er biblioteket, der leveres på crates.io, Python Package Index (PyPI) og npm; et resultat kan genskabes ud fra <c1/>, og en kørsel kan deles som en URL (webadresse).

seg-3d3d4bda606c = <b>Ærlighed</b> — at køre motoren selv, åbent, er det stærkeste svar på "stol på tallene": browserniveauet <em>er</em> revisionsfladen.

seg-6095bcacb725 = Browserniveauet gør ikke Kshana til en erstatning for en desktopbehandlingssuite — det gør spørgsmålet om afvejningsstudier af ydeevne tilgængeligt for folk, der aldrig ville installere en.

seg-26f242f1bef8 = Resten af motoren

seg-938ca8eab04c = <a1><c1/></a1> — oversigten over omfanget, række for række (omfanget og residualerne for <c2/>-solveren findes i rækken <b>GNSS / PNT processing</b>).

seg-9e94b1740386 = <a1><c1/></a1> — hvad der er valideret, med evidens.

seg-3a02f39bd90a = <a1><c1/></a1> — scenarietypen for telekommunikationens tidssynkronisering og dens masker.

seg-c5aa08e4ca55 = <a1><c1/></a1> — definitioner i klart sprog af de begreber, der bruges her.

seg-85aaaa34ea7c = <a1><c1/></a1> — browserens legeplads.

seg-54e2deeffc7d = <s1>Forrige</s1>Arkitektur

seg-b2f93c49d5c6 = <s1>Næste</s1>Ændringslog
