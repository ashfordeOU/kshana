# docs--mission-thread-lunar: translations (da)

seg-f942b36a11c4 = Endnu ikke på GitHub

seg-3b01a756c305 = Hvad den beregner

seg-b478421b21bb = Kilde: <c1/>

seg-dbd59cc01982 = Månesegmentet i missionstråden i Artemis-klassen

seg-7b56ed698c30 = Fire scenarietyper, hver også en fasetype i grænsefladen <c1/> (<c2/>): de fører et fejlbudget for navigation og tidssynkronisering gennem en månemission til sydpolen, fra rendezvous i månebane til landing, ophold på overfladen og opstigningen tilbage til banen. <b>Hvert tal her er MODELLED</b>: en angivet model med ILLUSTRATIVE input, intet af det en påstand om nogen mission, noget system eller noget sted. "Artemis-klassen" betegner en klasse af missionskoncepter og intet mere; ingen organisations data, produkter eller støtte bruges eller hævdes, og intet her er tilknyttet nogen. Vejledende software, ikke certificeret navigationsudstyr. Kshana udsender intet og styrer ingen hardware.

seg-5282ad2c498a = Fase og type

seg-9b927127e042 = Eksempelscenarie

seg-40f3e1b2d58b = Kerne

seg-2cfaaa8be402 = relativ navigation til docking, cirkulær polar på { "100" } km eller elliptisk polar på { "100" } km gange { "3000" } km

seg-9ee09d63fed3 = budgettet for landingsspredning ved et sted ved sydpolen

seg-c4568984e75c = <c1/>, <c2/> (kræver DEM, et checkout)

seg-a098e14e6a63 = tilgængelighed af positionering og tidssynkronisering efter sted og årstid

seg-8278ae655fcc = <c1/>, <c2/> (kræver DEM, et checkout)

seg-249eff5159d0 = opstigning til rendezvous-banen og kovariansen ført tilbage til banen

seg-36184e593ade = Hver kerne er en funktion af <c1/>; en selvstændig kørsel bygger standardindgangen (en månecentreret inertiel kovarians på { "100" } m og { "0.1" } m/s, et LTC-ur på { "1" } mikrosekund) og standardepoken 2028-01-01, og en trådkørsel tager indgangen fra den foregående fase. Tråden, ikke en kerne, konverterer referencesystemer og tidsskalaer og anvender overdragelsesreglen: en faseindpakning konverterer indgangstilstanden til <c2/> (eller <c3/> for overfladekortet) og et LTC-ur gennem trådens konverteringer, og konverteringslinjerne føjes til fasens budget. Et referencesystem eller en tidsskala, tråden ikke kan konvertere (f.eks. ITRF), afvises med trådens meddelelse; en kerne, der kaldes direkte med et referencesystem, den ikke kan bruge, afviser det med begrundelsen. En fase nulstiller aldrig en kovarians, den giver kun den videre, den slutter med.

seg-59f4a1a2684e = Hvad hver fase gør

seg-e112a34ef118 = To køretøjer, et jagerfartøj og et mål, flyver i samme bane under cratens månekraftmodel (et tyngdefelt og Jorden og Solen som tredjelegemer). Et batch-Gauss-Newton-estimat over buen genfinder begge begyndelsestilstande ud fra:

seg-33bb01b1e72a = en absolut positionsbestemmelse pr. køretøj fra et ILLUSTRATIVE relæsæt i LCNS-klassen (relæer bag Månen udeladt, fire kræves), hvis hvide del er kodesporingsgrænsen på AFS-piloten (BPSK({ "5" }), { "5.115" } Mchip/s) ved den angivne C/N0 gange DOP-kofaktoren;

seg-b061f6742a86 = en <b>vedvarende</b> fejl i signal i rummet på hver positionsbestemmelse: relæfejl midles ikke væk over en bue på timer, så den føres som konstante positionsbiaser, én fælles for begge køretøjer (<c1/> af variansen, standard { "0.9" }, ILLUSTRATIVE) og én uafhængig pr. køretøj. En konstant bias giver ingen midlingsfordel, den konservative læsning;

seg-437ac74b1400 = en krydslinkafstand fra det samme signal ved dets eget C/N0.

seg-3513a55e44e5 = Den rapporterer den formelle og Monte Carlo-baserede relative positions- og hastighedsfejl i målets lokale akser, andelen af epoker med positionsbestemmelser på begge køretøjer, den gennemsnitlige normaliserede estimeringsfejl i anden (NEES) for den relative tilstand mod dens forventede værdi på { "6" }, den relative drift ved at ignorere tyngdeharmonikkerne, en lukket Hill-kontrol (Clohessy-Wiltshire) for det cirkulære tilfælde, de afsluttende relative sensormodeller fra trådens <c1/> (ILLUSTRATIVE parametre) ved siden af tallet med kun signaler og chaserens 6x6-kovarians til sidst.

seg-5d3fa3e8486c = <b>Hvad resultatet siger.</b> Med signaler alene fastlægger krydslinkafstanden den relative position langs sigtlinjen, men den relative position på tværs af den er begrænset af den uafhængige fejl i signal i rummet og af det, dynamikken giver; docking kræver en relativ sensor, og rækkerne <c1/> viser, ved hvilken afstand hver af trådens sensormodeller slår signalerne. Resultatet afhænger også af, at referencen og estimatoren deler en kraftmodel; estimatorindstillingen <c2/> viser prisen ved at ignorere harmonikkerne, og den kørsel forventes ikke at være konsistent.

seg-66c4eb27641b = Fasen flyver sin egen nominelle bane (felterne <c1/>), så indgangens positions- og hastighedsvektor bruges ikke, kun dens kovarians, referencesystem og ur; en hændelse i tråden siger det.

seg-751f29ab7a35 = Pr. vandret akse en inertiel fejlmodel med fem tilstande (position, hastighed, accelerometerbias, attitudehældning, gyrobias, drevet af nedstigningens specifikke kraft) ud fra indgangskovariansen og IMU'en, derefter et sekventielt filter over de aktiverede støtter:

seg-c2eae4508a2f = <b>AFS-positionsbestemmelse</b>: fra de relæer, der er synlige over en flad maske, med ENU-DOP-kofaktoren gange en brugerafstandsfejl. <c1/> bruger fejlen i signal i rummet; <c2/> bruger korrektionslinkets residual fra <c3/>. Med præcis tre relæer i sigte er uret støttet, ikke estimeret, og positionsbestemmelsen bærer da <c4/>: det er her, månetid indgår i positionsbestemmelsen.

seg-39c938fb24e9 = <b>Terrænrelativ positionsbestemmelse</b>: <c1/> kører cratens TERCOM/SITAN-matcher på sit syntetiske relief og en jordisk meterskala (en stand-in, ikke relieffet ved sydpolen); <c2/> tager Cramer-Rao-grænsen for matchning af et højdevindue i den virkelige LOLA-DEM ved stedet, <c3/>, og hævder ingen positionsbestemmelse, hvor relieffet kun begrænser én retning (aperturproblemet).

seg-795ef82edc61 = <b>Månetid</b>: urfejlen ved positionsbestemmelsen kombinerer indgangsuret, dets vækst siden synkroniseringen og LTC-TT-leddet fra <c1/>. Med <c2/> tikker køretøjet TT, og den akkumulerede offset er en ukorrigeret bias; med <c3/> er det kun usikkerheden i det offentliggjorte bånd på { "56" } til { "59" } mikrosekunder pr. døgn over horisonten, der er tilbage. En tidsmærkefejl flytter en positionsbestemmelse langs banen med <c4/>.

seg-d655c932abbf = Landingsspredningen er navigationsfejlen ved berøring plus et uafhængigt styringsled (<c1/>, ILLUSTRATIVE, { "20" } m pr. akse som standard). Tabellen <c2/> kører hver kombination af støtterne. Ellipsen kalibreres ved Monte Carlo (andelen af simulerede landinger inden for 3-sigma-konturen mod de { "98.9" } %, en 2D-gaussisk fordeling giver).

seg-82b71e26bc89 = <b>Læs den med omhu.</b> Standardspredningen domineres af det antagne styringsled, og ved hvert sted ved sydpolen er relægeometrien næsten den samme, så stederne adskiller sig kun lidt. Månetid betyder lidt gennem tidsmærkning ({ "150" } m/s gange nogle få mikrosekunder er under en millimeter); den betyder noget, når geometrien forringes til tre relæer.

seg-f5af0aef6649 = For hvert sted og hver årstid (en epoke og et vindue efter den): positionering via relæer (fire eller flere relæer i sigte over masken og stedets terrænhorisont med PDOP under tærsklen, fra de samme funktioner og den samme konstellation som <c1/>; resultatet for ét sted er lig med dens tal til sidste bit), om Jorden og Solen er over horisonten (analytisk Sol, Måne og månens orientering, libration medregnet) og tilgængelighed af tidssynkronisering (et relæ eller Jorden i sigte) med den længste strækning uden nogen af dem. Relætallet ændrer sig ikke med årstiden i denne model (keplersk sæt, middelrotation); tallene for Jorden og Solen gør. Fasen giver kovariansen videre uændret og disciplinerer uret til et gulv for tidssynkronisering (ILLUSTRATIVE, { "50" } ns), så kun det længste hul i tidssynkroniseringen er tilbage at holde over.

seg-0890ec65a04e = Nedstigningens model med fem tilstande på alle tre stedsakser ud fra overfladetilstanden, en AFS-positionsbestemmelse ved et angivet interval med den samme behandling af månetid og den fulde 6x6 position-hastighedskovarians ved indsætning givet videre, med position-hastighedskorrelationen for hver akse bevaret. Spredningen ved motorafbrydelse flytter, hvor køretøjet er, og rapporteres ved siden af navigationskovariansen, ikke ført videre. Fejlene holdes i affyringsstedets akser (ingen krumning i nedrækkevidde), og den nominelle sluttilstand er en stand-in; kun kovariansen er resultatet.

seg-f60b576fabcd = Hvordan et dokument angiver en fase

seg-be8e0001ed0c = I en tråd er en fases tabel <c1/> det selvstændige scenaries egen tabel. Fasens længde er trådens <c2/>: en model, der også angiver sin egen længdenøgle (<c3/>, <c4/>, <c5/>, <c6/>), skal være enig med den, ellers afvises fasen, og en model, der udelader nøglen, tager trådens. Frøet er trådens id-nøglede fasefrø, så en fase, der køres alene under samme id og trådfrø, returnerer de tal, den returnerer i tråden. En fejlstavet modelnøgle afvises, ikke ignoreres. Overdragelsen mellem faser og de konverteringer af referencesystem og tidsskala, den kræver (månecentreret inertiel og månefast, Jorden til Månen, LTC-parrene), hører til tråden.

seg-52a6e2ec0a99 = Udformninger, input og tærskler blev fastsat i <c1/> før enhver kørsel, med seks daterede ændringer, hver oplyst i filen; afgørelsen for hver tærskel, misserne og estimatorens historik medregnet, findes i <c2/>.

seg-a1cf56c505d0 = <b>A1</b> (propagatoren mod LRO's rekonstruerede bane, { "24" } timer): MET, { "33" } m maksimal 3D-forskel mod { "500" } m, { "2.4" } m radial RMS mod { "60" } m.

seg-25464238f6bd = <b>A2</b> (samme propagator mod CAPSTONE's næsten retlinede halobane over ét omløb på 6,5 dage): <b>NOT MET</b>, { "136.8" } km forskel i slutposition mod { "25" } km og { "28.4" } km forskel i den oskulerende periapsisradius mod { "10" } km. Årsagerne blev ikke isoleret (kandidater er det udeladte strålingstryk og albedo, banens følsomhed over for begyndelsestilstanden og de analytiske serier for Jorden og Solen); rækken forbliver MODELLED.

seg-e1099ad81a5d = Disse to rækker afprøver den propagator, månetyperne deler. <b>De afprøver intet navigationsfilter, signal eller budget, og intet andet her har en ekstern uafhængig reference.</b>

seg-9a4b2392aa92 = Alt andet er MODELLED, og typernes konsistenskontroller (B1 til B8 i præregistreringen) afprøver en implementering mod dens egen angivne model, ikke mod Månen.

seg-3365490b59b7 = <s1>Forrige</s1>Missionstråd: fra opsendelse til indflyvning

seg-90932eed0074 = <s1>Næste</s1>LEO-positionering, navigation og tidssynkronisering
