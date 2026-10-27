# docs--schema: translations (da)

seg-2247a2344710 = Betydning

seg-f42465f7d066 = ns

seg-f63dd3d7aad4 = Kilde

seg-6940543aa3c0 = streng

seg-f5e7215e6835 = objekt

seg-9da5d92757bd = objekt, valgfrit

seg-c353e7bec219 = Nøgle

seg-a129b9e613d0 = Type

seg-e28387d70be0 = Kilde: <c1/>

seg-49d2afecf5f1 = Resultatskema — læsning af en Kshana-<c1/>

seg-c128455c353c = Hver kørsel skriver en versioneret, selvbeskrivende JSON (JavaScript Object Notation)-artefakt ved siden af scenariet. Denne side er den håndskrevne læsers vejledning til udvekslingskonvolutten og til resultatformerne for <b>ur og bane</b>: hvert felts <b>enhed</b>, hvor det beregnes i kilden, og hvordan det læses. Den kanoniske type er <c1/> i <a1><c2/></a1>; kvalitetsmålene er <c3/> i <a2><c4/></a2>.

seg-092ea1e33a05 = Den er <b>ikke</b> den komplette feltreference. Motoren afsender over langt flere typer end disse to, og hver udsender sin egen pakke. Den komplette reference — enhed, proveniensklasse og definition for hvert numerisk felt i hver indbygget type — er genereret, ikke håndskrevet: se <a1>Enheder og proveniens, for hvert felt, for hver type</a1> nedenfor.

seg-e4c4b66a2f46 = Udvekslingskonvolut (KIF, Kshana Interchange Format) — genkendelse og versionskontrol af en artefakt

seg-9b83bb817814 = Kshana-artefakter kan pakkes ind i en neutral, selvbeskrivende <b>udvekslingskonvolut</b>, så et tredjepartsværktøj kan genkende filen og afgøre, om det kan læse den, <em>før</em> det forpligter sig til et nyttelastskema. Den kanoniske type er <c1/> i <a1><c2/></a1>.

seg-e4fd08930644 = Altid <c1/> (<c2/>) — sådan genkender et fremmed værktøj en Kshana-artefakt.

seg-abd853f2ce49 = Skemaversionen <c1/> (<c2/>, den eneste sandhedskilde for hele cratet).

seg-ee9f238072f1 = Artefakttype, fx <c1/>, <c2/>, <c3/> — lader en forbruger route uden at parse indholdet.

seg-29ad4bedd64f = Crateversion (<c1/>), der frembragte nyttelasten.

seg-52f3e962c049 = Den indpakkede artefakt som kanonisk JSON (en <c1/>, en <c2/>, …).

seg-6fe0d7cd4165 = <b>Kompatibilitetskontrakt.</b> Versioner er <c1/>. Nye felter tilføjes med <c2/> (den <em>additive disciplin</em>), så en læser kan parse enhver artefakt med <b>samme hovedversion og en lige så gammel eller ældre delversion</b> (<c3/>). En strengt <b>nyere delversion</b> (<c4/>) kan bære felter, som denne læser ikke kan honorere, og en <b>anden hovedversion</b> (<c5/>) er et strukturelt brud — begge afvises af <c6/>, som kontrollerer formatmærket og versionen ved grænsen i stedet for i det skjulte at misparse fremmed input.

seg-f7ae91002e56 = <b>Determinisme.</b> Konvolutten bærer <b>intet tidsstempel</b> — Kshanas løfte om reproducerbarhed (<c1/> reproducerer en kørsel) kræver det. Proveniens ligger i <c2/> og i nyttelastens eget <c3/>.

seg-bb0b742d2df8 = En typet tilbagelæsning (<c1/>) virker for enhver nyttelast, der implementerer <c2/> (fx <c3/>). Resultatartefakter kan efter udformningen kun serialiseres og læses som den rå JSON-værdi <c4/>.

seg-87be7aa00b17 = Øverste niveau (pakkerne for ur og bane)

seg-cc22d9206eb4 = Type / enhed

seg-3a821855c582 = Version af resultatskemaet (uafhængig af motorversionen).

seg-cc6dded799f9 = Crateversion (<c1/>), der frembragte filen.

seg-5a69a99b9a87 = hex-streng

seg-441eb1f43399 = SHA-256 (SHA: Secure Hash Algorithm) over det kanoniske scenarie-JSON — kørslen kan reproduceres ud fra <c1/>.

seg-ba73ba76873e = RNG (random-number generator)-seed til kvantekørslen (den klassiske bruger <c1/>).

seg-a688dd98c588 = nanosekunder

seg-24e0f04033fa = Tidssynkroniseringens specifikation: en fejl inden for ±<c1/> er "in spec".

seg-f52388753a1a = scenarie

seg-15b4082a6455 = objekt (<c1/>)

seg-7d3b92769bf5 = Kvantesensorens kørsel (se nedenfor).

seg-aa665b955931 = Den klassiske sensors kørsel, til sammenligning.

seg-152ae43896b3 = Kort over enhed/proveniens for hvert felt i dette dokument, nøglet efter feltsti. Se §Enheder og proveniens nedenfor.

seg-119bac9b3e6f = Verifikationsniveauet for hvert rapporteret kvalitetsmål, og altid dokumentets sidste nøgle. <c1/> opregner én post for hvert tal, der er til stede: <c2/> (fx <c3/>), <c4/> (<c5/> = kontrolleret mod en uafhængig ekstern reference, <c6/> = ud fra grundprincipper, internt testet), <c7/> (den række i verifikationsmatrixen, som niveauet læses fra) og <c8/>. <c9/> er <c10/>, med en <c11/>, for <c12/> i hvert scenarie uden konfigureret angreb: grænsen bliver i <c13/>, men den besvarer ikke et spørgsmål, scenariet stiller. <c14/> opregner ethvert tal, som ingen matrixrække ejer (positionstallene for <c15/> og <c16/>), i stedet for at give det et niveau. Udsendt af typerne <c17/> (enkeltkørsel og Monte Carlo-ensemble), <c18/>, <c19/> og <c20/>, som bygger den inde i deres kørsel, og ({ "0.36" }, RM-04) af hver anden type for dens hovedtal, tilføjet efter kørslen fra tabellen for hver type <c21/>; <c22/> fjerner den igen til dokumentet uden niveauer byte for byte. Udsendes ikke af <c23/>, hvis resultat er en frosset, på forhånd registreret forudsigelse (<c24/>): den type har ingen <c25/>, før en ny dateret forudsigelse erstatter den. Udsendes heller ikke af <c26/>, <c27/>, <c28/> ({ "0.37" }; arrays for hvert sted), <c29/> og <c30/>, som ikke har noget skalart hovedtal, eller af <c31/>, hvis dokument er kompakt JSON (<c32/> giver hver årsag), eller af en kampagnes indlejrede medlemsdokumenter. Bærer ingen tal.

seg-1448f90f0086 = Opsummering af geometri i bane-pakken: <c1/>, <c2/>, <c3/> (m, det modellerede budget for afstandsfejl for hver satellit), <c4/> / <c5/> (dimensionsløse) og <c6/> / <c7/> (m, PDOP (positionens dilution of precision) × <c8/>). <b>Kun bane-pakken.</b>

seg-ae4f8eed06ac = array af <c1/> km, valgfrit

seg-d13d827f54b0 = Propageret spor i jordcentreret inertialsystem for brugerens rumfartøj, én post for hvert samplet tidspunkt. <b>Kun bane-pakken</b>; ellers udeladt. Kun output — ikke hashet.

seg-8f511d5de657 = objekt (<c1/>), valgfrit

seg-ea152e097d6f = Additiv rapportmetadata (studiets titel, genereringsstempel, forfatter, ansvarsfraskrivelse). Udeladt, når den ikke er der, så en kørsel uden meta er byte-identisk med ældre output. Kun output — ikke hashet.

seg-1041873fba1b = <c1/> (hver af <c2/> / <c3/>)

seg-3fa81140c10d = Sensoridentifikator (fx <c1/>).

seg-80765d202558 = Modeltype (fx <c1/>).

seg-6bf458d964fe = Henvisning/kilde til sensorens parametre.

seg-9145f04a557f = De rå modelparametre, der er brugt.

seg-697940342a28 = array af <c1/>

seg-b5f4216b55a2 = Tidsserie for hvert trin: <c1/> sekunder, <c2/> tidsfejlen i <b>nanosekunder</b>, <c3/> en af <c4/>/<c5/>/<c6/>.

seg-7fba0b91b75e = objekt (<c1/>)

seg-5c4b60012f0e = De bedømte kvalitetsmål (nedenfor).

seg-1308a29c6a5b = array af <c1/>

seg-bbd42065492c = Overlappende Allan-deviation: <c1/> middeltiden (s), <c2/> den dimensionsløse fraktionelle frekvensstabilitet σ_y(τ), <c3/> antallet af overlap bag det punkt, <c4/> den potenslovstype, der er identificeret ud fra MDEV (modificeret Allan-deviation)-hældningen (fx <c5/>), <c6/> de støjtypespecifikke effektive frihedsgrader, og <c7/>/<c8/> det χ²-baserede { "95" }%-konfidensbånd for <c9/> ved det τ. Beregnet i <c10/>.

seg-1e61fd18257f = Vurdering af Kalman-filterets konsistens (NIS/NEES (NIS: normaliseret innovation i anden; NEES: normaliseret estimeringsfejl i anden) mod deres χ²-bånd), beregnet i <c1/>; udeladt for kørsler, der ikke vurderer den.

seg-9333864652b0 = <c1/> (objektet <c2/>)

seg-ce9caeaefd87 = Forbehold

seg-b24de276d788 = RMS (root mean square) for urfasefejl (tidssynkronisering) over udfaldet.

seg-53e5018ae276 = en metrik for <b>tidssynkronisering</b>, ikke position

seg-8cdec6da2072 = 95. percentil af tidsfejlen over udfaldet.

seg-95f058adb809 = Værste (korteste) glidning inden for specifikationen på tværs af udfaldssegmenter.

seg-48babfd3bd95 = <b>begrænset af gitteret</b> — en nedre grænse ved tidstrinnets opløsning

seg-41c08973baa1 = Vækstrate for |fejl| efter mindste kvadrater under udfaldet.

seg-707ee74c5c06 = andel [{ "0,1" }]

seg-32e5fe6415f8 = Andelen af hele kørslen med en løsning inden for specifikationen.

seg-361b3b923a45 = andel [{ "0,1" }] eller null

seg-5d55682f9349 = <b>Filterets selvkonsistens</b>: andelen af udfaldssamples, hvis sande fejl bliver inden for Kalman-grænsen k-σ.

seg-636106cb4a40 = <b>IKKE</b> integritet efter HPL/VPL/RAIM (HPL: horisontalt beskyttelsesniveau; VPL: vertikalt beskyttelsesniveau; RAIM: receiver autonomous integrity monitoring) — se <a1><c1/></a1>

seg-f686ade3da21 = <b>Analytisk grænse for detekterbarhed af spoofing</b> ud fra urets stabilitet.

seg-f8783db25141 = kun meningsfuldt med et konfigureret angreb, så pakkerne for ur og bane (som ikke konfigurerer nogen) markerer det <c1/> i <c2/> og udskriver det som <c3/> i oversigten; <b>ikke</b> en RAIM-detektor for flere satellitter

seg-90e2980430b9 = Hvordan "godt" ser ud

seg-c1afc6f3c545 = Et <b>roligere ur</b> (lavere <c1/>) giver et længere <c2/> og en højere grænse for detekterbarhed i <c3/> — det er kontrasten mellem kvante og klassisk.

seg-0fa38207813a = <c1/> nær { "1.0" } betyder, at systemet blev inden for specifikationen næsten hele kørslen; under et langt udfald falder den for det mere støjede ur.

seg-4dcba241d5a6 = <c1/> nær { "1.0" } betyder, at filterets egen usikkerhedsgrænse var ærlig om sin fejl — en udtalelse om <em>selvkonsistens</em>, ikke en garanti for sikkerhed for liv.

seg-3099d75a04a5 = Andre scenarietyper

seg-43cd9f67f384 = Hver anden type udsender sin egen resultatform. Nogle af de almindelige:

seg-6b59ef9dfe85 = <b>inertial</b>: kvalitetsmål i positionsdomænet i <b>meter</b> (<c1/>, <c2/>) — enkelt akse (1-DOF (DOF: frihedsgrad)), enkelt seed (se <a1><c3/></a1>).

seg-3e3ec8985dde = <b>hybrid / fusion</b>: <c1/> og <c2/> på øverste niveau og, for hver side, tids- og positionstallene for én sensorsuite (<c3/>, <c4/> og <c5/>, tiden indtil en af specifikationerne brydes), med en blok <c6/> som i urpakken, hvor positionstallene er opregnet som <c7/>.

seg-e38e8a8adec8 = <b>spoof</b>: spoofer-forskydning for hvert trin mod urets detektionsgrænse samt om spoofingen nåede specifikationen før detektion (<c1/>).

seg-dfd972d160e1 = <b>skyline</b> (<c1/> og <c2/> med <c3/>, <c4/>, <c5/>, <c6/>, <c7/>; kun til stede, når scenariet har en sektion <c8/>, så et scenarie uden en er uændret): et objekt <c9/> på øverste niveau med <c10/> (streng: <c11/>, <c12/> eller <c13/>), <c14/> (andel [{ "0,1" }] af den øvre halvkugles rumvinkel over <c15/>) og <c16/> (streng); for hver sample <c17/> (antal satellitter over masken, men bag skylinen: <c18/> for <c19/> og <c20/>, <c21/> for <c22/>, <c23/> for <c24/>); og for <c25/> <c26/> (antal epoker). Deres enheder og proveniensklasser står i blokken <c27/> (<c28/> <c29/>; <a1><c30/></a1>).

seg-d113122b7454 = For det præcise feltsæt for en vilkårlig type, læs dens post i <a1><c1/></a1> (nedenfor), typens sektion i <a2><c2/></a2> eller den tilsvarende struct <c3/> i <c4/>.

seg-e0c63207c019 = Andre filer, en kørsel skriver

seg-cc97989ca06b = Ved siden af <c1/> skriver CLI'en (kommandolinjegrænsefladen) <c2/>, en udskrivbar <c3/> og den samme rapport som <c4/>, hvis blok <c5/> registrerer motorversionen, SHA-256 af scenariefilen, seed, platformen og den præcise kommando (se <a1><c6/></a1> og <a2><c7/></a2>). Typer, der udgiver en reproducerbarhedstabel, skriver også <c8/> (CSV: comma-separated values). <c9/> skriver udvekslingsfiler (se <a3><c10/></a3>) og <c11/> en animation (se <a4><c12/></a4>).

seg-489953601f3b = Enheder og proveniens, for hvert felt, for hver type

seg-61b33dbb44dd = Denne side er håndskrevet og dækker pakkerne for ur og bane. Den maskinlæsbare modpart dækker <b>hver</b> indbygget type:

seg-1e20fcda7f0b = <b>I selve resultatet.</b> Hvert scenaries resultatdokument bærer et objekt <c1/> på øverste niveau, der kobler et udsendt felts sti til <c2/>. Stigrammatikken (et array bidrager med ét segment med suffikset <c3/>, som deles af dets rækker; <c4/> er et jokertegn for ét segment for objekter med datanøgler) og det lukkede proveniensvokabular er defineret i <a1><c5/></a1>.

seg-b8256437c0b7 = Som én fil.

seg-ae7136e34306 = <a1><c1/></a1> er den høstede foreningsmængde: for hver type hvert numerisk felt, den udsender ved en angivet kilde, med dets enhed, proveniensklasse, evidensniveau og definition — og, nævnt frem for udeladt, hvert felt, der endnu ikke har nogen. Dens blok <c2/> bærer antallene.

seg-66af6dc065f7 = Begge håndhæves af <c1/>, som kører hver registreret type og fejler, hvis et udsendt numerisk felt mangler en enhed og en proveniensklasse. Typer, der endnu ikke er dækket, er nævnt enkeltvis i filens <c2/> med årsagen til, at hver er åben, og antallet er fastlåst, så listen kun kan blive kortere.

seg-ca49a577a07b = Regenerér JSON'en efter enhver ændring af en rapports form eller af en <c1/>-blok:

seg-ce4351cf7673 = <s1>Forrige</s1>Scenarioreference

seg-b988dcc329a4 = <s1>Næste</s1>Brug af virkelige TLE'er

seg-6585c8a3643d = ClockRun (hver af quantum / classical)

seg-299f8a9643f1 = FoMScores (objektet fom)
