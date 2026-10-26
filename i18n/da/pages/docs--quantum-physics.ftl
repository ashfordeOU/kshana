# docs--quantum-physics: translations (da)

seg-5ad814c7ef9e = Noter

seg-ad856ad710eb = Status

seg-f2f359447cd9 = Kilde: <c1/>

seg-5df810623ef1 = Fysik for kvante-inertialsensorer (kold-atom-interferometer)

seg-b2915c3652a1 = Det meste af Kshana driver sine kvantesensorer ud fra <b>offentliggjorte Allan-/støjkoefficienter</b> — opslag i datablade (se <a1><c1/></a1> og <a2><c2/></a2>). Dette dokument dækker det ene sted, hvor motoren i stedet beregner sensorens ydeevne <b>ud fra grundlæggende principper</b>: modellen for kold-atom-interferometer-accelerometeret (CAI) i <a3><c3/></a3>.

seg-9ae4b2dc84ba = Det er bevidst et <em>minimalt, redeligt</em> fysiklag — gulvet for kvanteprojektionsstøj og interferometerets skalafaktor — ikke en fuld instrumentsimulator. Afsnittene nedenfor angiver præcis, hvad der modelleres, og hvad der ikke gør.

seg-64509c048541 = Hvad der modelleres

seg-9fa6211c962e = Et Mach–Zehnder-atominterferometer med tre pulser (π/2–π–π/2) (Kasevich & Chu { "1991" }; Peters, Chung & Chu { "2001" }), standardgeometrien for et kold-atom-accelerometer:

seg-3c513ef2fd3b = Størrelse

seg-c0a13eeb346d = Formel

seg-f838cd800e16 = Effektiv bølgevektor

seg-79e00267b79f = To-fotons Raman; Rb-87 D2 ({ "780.241" } nm) → <c1/>.

seg-5c0a84157352 = Interferometerfase

seg-31f4f718d896 = Ensartet specifik kraft <c1/> langs <c2/>, pulsafstand <c3/>. Skaleringen med <c4/> er den dominerende følsomhedsløftestang (mikrotyngde giver lang <c5/>).

seg-f5b8b6c35dce = Kvanteprojektionsstøj

seg-8902ae6f313c = Pr. skud, frynsekontrast <c1/>, antal atomer <c2/> — skudstøjgrænsen for en udlæsning af to porte i populationen.

seg-b95d4d1e45f0 = Accelerationsfølsomhed pr. skud

seg-c97f2fd35d48 = Fasestøj omregnet til acceleration.

seg-cda09ac79409 = Skudstøjbegrænset ASD (amplitude spectral density)

seg-4d84800a3adb = Sampling hver cyklustid <c1/>; enheder (m/s²)/√Hz.

seg-707ee648d1d5 = PSD for velocity random walk (power spectral density)

seg-be0ac61054db = <b>Koefficienten, som den klassiske <c1/> forbruger</b> — nu <em>udledt</em>, ikke leveret.

seg-939e12a62637 = Henfald af kontrast

seg-05b0e7130b78 = Dekohærens over interrogationen.

seg-e64f748b35ab = Overføringsfunktion for vibration

seg-1754ac375452 = Respons fra acceleration til fase for den ideelle geometri med tre pulser (Cheinet m.fl. { "2008" }); DC-grænse (nul frekvens) <c1/>.

seg-a710cfe4f533 = Vibrationsbegrænset fase

seg-f5d2223218c8 = Flad acceleration-PSD <c1/> langs Raman-aksen; <c2/>.

seg-13109dcfc52b = Vibrationsbegrænset acceleration

seg-812990a8f058 = Pr. skud; bemærk, at <c1/> forsvinder — fastlagt alene af platformens PSD og interrogationstiden.

seg-1c2764469718 = Frynsemultiplicitet

seg-e9cf2dcc0274 = <c1/>, område i celler <c2/>

seg-817e06834263 = Frynsefasen aflæses modulo 2π, så en enkelt aflæsning er kun entydig inden for ±<c1/> og alias'er for hver <c2/> uden for; antallet af celler afhænger ikke af <c3/> eller <c4/>.

seg-14bbedf1cd0d = Projektion på aksen

seg-1ac2d4904b8a = Førsteordenskobling har rang 1: kun komponenten langs strålen indgår i fasen.

seg-7200f91fa19a = Coriolis- / rotationsfase

seg-f8b407b3b2fb = Systematisk rotationsfejl for et køretøj i bevægelse (Lan m.fl. { "2012" }); tilsvarende bias <c1/> = det klassiske Coriolis-led.

seg-9eaff8d90a83 = AC-Stark-fase (lysforskydning) (AC: vekselstrøm)

seg-62630dc178e6 = Lysforskydning med én foton; en <em>konstant</em> forskydning ophæves af symmetrien π/2–π–π/2 (Peters { "2001" }; Gauguet { "2008" }).

seg-bcb9cb9c6219 = Pointen er, at løkken lukkes: <c1/> giver præcis den hvide acceleration-PSD, som resten af inertialstakken allerede integrerer til en fejl i hastighed/position — så en kvantesensors støj kan føres tilbage til dens antal atomer, interrogationstid og kontrast frem for til en linje i et datablad.

seg-e2363d639ccc = Et gennemregnet tal (Rb-87, <c1/>, <c2/>, <c3/>, <c4/>): <c5/>, <c6/>, <c7/> (≈ { "0.13" } µg) pr. skud og et skudstøjgulv <c8/>. Med en beskeden vibrations-PSD for platformen <c9/> er det <b>vibrationsbegrænsede</b> gulv pr. skud <c10/> (≈ { "5.9" } µg) — omkring { "46" }× skudstøjgulvet, hvilket viser, hvorfor virkelige instrumenter er begrænset af vibration, ikke af projektion. Det samme interferometer aflæser specifik kraft entydigt kun inden for <c11/> (≈ { "199" } µg), omkring { "1 571" } opløsningsceller: <c12/> er tusindvis af frynser, så en enkelt aflæsning af { "1" } g er aliaseret.

seg-c209b86f41d8 = Hvad der IKKE modelleres (og hvorfor gulvet er optimistisk)

seg-964c5f546c2a = Skudstøjgulvet ovenfor er en <b>grundlæggende nedre grænse</b>. Virkelige CAI-instrumenter ligger over det: et statisk gravimeter i laboratorium (Freier m.fl. { "2016" }, { "96" } nm/s²/√Hz) omkring { "60" }× over det gulv, der er beregnet for dets parametre, og en accelerometertriade i felten meget længere over (Exail-enheden, der er citeret i <c1/>, angiver { "22" } µg/√Hz). Det dominerende led — <b>vibrationskobling</b> — og de to førende deterministiske systematiske fejl — <b>Coriolis/rotation</b> og <b>AC-Stark-lysforskydningen</b> — modelleres (rækkerne ovenfor for overføringsfunktion, Coriolis og lysforskydning), og det gør <b>det dynamiske område for frynsemultiplicitet</b> også (<c2/>, <c3/>, <c4/>, <c5/>). Det resterende hul er det, dette lag stadig ikke indeholder:

seg-c56d85817bc6 = <b>Bølgefrontaberration</b> og systematiske fejl af højere orden i strålens pejling — <b>modelleres ikke</b>.

seg-525c382e813b = <b>Opløsning af frynsemultiplicitet</b> — modellen angiver det entydige område og returnerer den indpakkede fase; den afvikler ikke en aflæsning uden for ±<c1/> (for eksempel med et klassisk accelerometer eller flere interrogationstider), og den afgrænser området for en ideel tre-pulsfrynse, uden led for bølgefront eller tab af kontrast.

seg-7555132ef2c6 = Kortlægning til litteraturen: Groves, <em>Principles of GNSS, Inertial, and Multisensor Integrated Navigation Systems</em> §{ "12.5" } (kvanteteknologi; GNSS: global navigation satellite system); Cheinet m.fl., <em>IEEE Trans. Instrum. Meas.</em> { "57" } ({ "2008" }) for interferometerets følsomhed og overføringsfunktion (IEEE: Institute of Electrical and Electronics Engineers); Freier m.fl., <em>J. Phys.: Conf. Ser.</em> { "723" } ({ "2016" }) for fejlbudgettet for det mobile gravimeter; CARIOQA-PMP (Cold Atom Rubidium Interferometer in Orbit for Quantum Accelerometry – Pathfinder Mission Preparation) for parameterområdet for accelerometre i rummet.

seg-c50f3befe165 = Dette er punktet <b>P2 kvantefysiklag</b> fra <c1/>: Mach–Zehnder-fasen, projektionsstøj, skalafaktor, udledt <c2/>, henfald af kontrast <b>og overføringsfunktionen for vibrationskobling / variansen for hvid PSD</b> er implementeret og enhedstestet mod håndregning (herunder en numerisk krydskontrol med båndintegral af overføringsfunktionen mod dens analytiske <c3/>-resultat).

seg-42e8dc204be9 = Modellen er også <b>koblet ind i scenarier, der kan køres</b>: et accelerometer opløses til <c1/>, når det har en <c2/>-tabel — <c3/> eller <c4/> i et <c5/>-scenarie, <c6/> i et <c7/>-scenarie (<c8/> leveres med et, og den medfølgende forudindstilling <c9/> stiller et CAI specificeret ud fra fysik over for et kvartsaccelerometer i navigationsklasse gennem et GNSS-udfald) — med felterne <c10/>, <c11/> (<c12/>), <c13/> (<c14/>), <c15/> (<c16/>), <c17/> (<c18/>) og en valgfri <c19/> for platformen. Dets PSD for velocity random walk <c20/> <b>udledes</b> så af interferometerets fysik — skudstøjgulvet plus, når en vibrations-PSD er angivet, det vibrationsbegrænsede bidrag i kvadratur — frem for at blive leveret som en databladskoefficient. Scenarier uden en <c21/>-blok er klassiske og uændrede byte for byte.

seg-51da20726ade = De systematiske fejl Coriolis (<c1/> / <c2/>) og AC-Stark-lysforskydning (<c3/>) er implementeret og enhedstestet (den tilsvarende Coriolis-bias er kontrolleret mod det klassiske <c4/>; AC-Stark-fasen mod dens symmetriske ophævelse). Et sweep af driften over cyklustid (<c5/>) rapporterer den positionsdrift ved dead reckoning, som kvante-CAI'et giver, som funktion af cyklustid — den beregningsmæssige kerne i en sammenligning af kvante mod klassisk. Typen <c6/> genbruger det samme accelerometer gennem <c7/>, og <c8/> bærer et parameterark med intervaller (bedst, nominelt, konservativt) med en henvisning for hvert tal.

seg-e2acbef44395 = Hvad de eksterne kontroller viser.

seg-353a2b2e1434 = <c1/> kontrollerer overføringsfunktionen mod et numerisk tidsdomæneintegral af Cheinets følsomhedsfunktion, <c2/> mod offentliggjorte linjebølgelængder og Coriolis-bias mod <c3/> — nøjagtige sammenfald med de offentliggjorte former. Skudstøjgulvet er en ensidet indkapsling: for de offentliggjorte parametre for Peters m.fl.'s cæsiumgravimeter fra { "2001" } og Freier m.fl.'s GAIN-rubidiumgravimeter fra { "2016" } (arXiv:{ "1512.05660" }) ligger det modellerede gulv på eller under hvert instruments opnåede støj og inden for tre størrelsesordener af den (for GAIN er gulvet { "1.53" }×{ "10" }⁻⁹ m/s²/√Hz mod den opnåede { "9.6" }×{ "10" }⁻⁸, en faktor omkring { "63" }). Det er i tråd med, at virkelige instrumenter er begrænset af vibration eller teknik, men det er en indkapsling, ikke en validering af en støjmodel for et instrument, så matrixrækken forbliver MODELLED.

seg-82dffa95c0e8 = De resterende opfølgninger er systematiske fejl i bølgefront og strålepejling, opløsning af frynsemultiplicitet, en numerisk nøjagtig gengivelse af Monte Carlo for CARIOQA-PMP og af budgetterne for flyveforsøg uden GPS (GPS: Global Positioning System) fra Boeing/AOSense (som kræver de offentliggjorte PSD'er for platformen og SNR pr. skud, signal-til-støj-forholdet) og en forudindstilling for sammenligning af kvante mod klassisk i browserens legeplads oven på <c1/>.

seg-2452f58aedf0 = <s1>Forrige</s1>Modeller af kvantesensorer

seg-206d5a9704f0 = <s1>Næste</s1>Python API
