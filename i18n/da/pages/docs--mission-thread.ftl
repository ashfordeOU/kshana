# docs--mission-thread: translations (da)

seg-e27476e37522 = Jorden

seg-34bdcfd66ded = I den repository-gren, disse dokumenter kommer fra; endnu ikke på GitHub

seg-092dd691ca17 = Rapporten

seg-f942b36a11c4 = Endnu ikke på GitHub

seg-b03d56f501c3 = Type

seg-2afa300864a9 = Parametre

seg-b7cf72949a21 = Kilde: <c1/>

seg-32755afa0f78 = Missionstråden

seg-d4af67363efc = Vejledende software, ikke certificeret navigationsudstyr. Kun offentlige kilder; ikke tilknyttet eller støttet af nogen rumfartsorganisation, og intet her hævder overensstemmelse med noget programs krav.

seg-816770c97995 = <c1/> kæder faser af en mission sammen, hver en af otte registrerede typer med sine egne sensorer og sit eget filter, og rapporterer <b>fejlbudgettet for navigation og tidssynkronisering</b> for hele kæden: for hver fase 1-sigma for position, hastighed og urbias ved indgang, ved spidsen og ved udgang; hvert bidrag hertil med sin enhed; marginen mod et krav, du angiver; det svageste led; de daterede hændelser; og en tidslinjefigur. Hvert tal er <b>MODELLED</b>: et angivet input eller en model af et. De eneste rækker med ekstern uafhængig reference findes i <s1><c2/></s1> og siger, hvad de afprøver.

seg-c29a19879c84 = Kør eksemplet fra et checkout (det læser et indlagt udsnit af Månens kerne):

seg-00f84b734853 = Dokumentet

seg-9979b2c873df = <b>Et dokument afvises, der gættes ikke,</b> når et fase-id gentages, en liste <c1/> er tom, et navn er ukendt, en modelnøgle ikke er en, typen kender, en længdenøgle er uenig med <c2/>, eller en fase angiver en kilde, dens model ikke giver tal for.

seg-9b1e6ac618b5 = Hvad en overdragelse gør

seg-0e965f3e30fa = Den tilstand, der gives videre, er den fulde 6x6-kovarians af <c1/> i SI-enheder, uret (bias, drift og deres kovarians, mærket med en tidsskala), referencesystemet, missionstiden og en evidensetiket. En overdragelse nulstiller aldrig en kovarians.

seg-47599d03571d = Regel

seg-023113cc5afb = giver tilstanden videre uændret

seg-43967d0b6dd8 = hvid accelerationsstøj med PSD <c1/> over <c2/> på en retlinet model; rækken angiver begge

seg-2c791ab0fd0f = dødregning i <c1/>, derefter sættes en akse til kildens gulv kun, hvor gulvet er mindre; aldrig under gulvet, aldrig en nulstilling

seg-36b9117f5379 = Referencesystemer og tidsskalaer

seg-5853aaba827f = Tråden konverterer ved overdragelsen, aldrig inde i en fase, og hver konvertering er sin egen budgetrække. Referencesystemer: GCRF, MCI, MCMF (ITRF og LVLH afvises med begrundelsen). <c1/> flytter origo med Månens geocentriske tilstand: tilstanden i DE440-klassen fra kernen, hvor den dækker epoken (stand-in { "5" } m og { "1" } mm/s; målt værst { "2.6" } m mod fastlåst JPL Horizons), ellers den analytiske serie med dens målte { "195.7" } km RMS, som rækken angiver; et månemæssigt eksempel skal derfor bære en kerne, der dækker dets epoke. <c2/> er den gennemsnitlige sideriske rotation med akserne rettet ind ved epoken og ingen libration. Tidsskalaer går gennem TT: <c3/> eksakt, <c4/> tilføjer { "14" } us, <c5/> bruger den sekulære rate fra <c6/> med dens bånd på { "56" } til { "59" } us/døgn som ratens usikkerhed.

seg-5ee610d8ab89 = De otte fasetyper

seg-70b73f1acebf = Segment

seg-0e39a468de1d = drevet opstigning til en parkeringsbane: kovarians med konstant hastighed og hvid accelerationsstøj, GNSS-erhvervelse og fading, ur-holdover

seg-d359ae5982a6 = Nøgler i <c1/> i <c2/>

seg-57c44fd6e061 = relativ navigation over sensorstrækninger: Clohessy-Wiltshire-overgang i LVLH, 6x6 Kalman-kovarians, dockingvindue

seg-7dce961e2c67 = nedenfor

seg-4b233c6cdf8b = TLI-brænding og cislunart krydstogt: Cowell-propagering, tilstandsovergangsmatrix med endelig differens, opdateringer fra gnss-ssv og jordsporing

seg-352e27d02c86 = returkyst til indflyvningsgrænsefladen; sigma for flyvebanevinklen, korridorsandsynlighed, maksimal deceleration, fodaftryk

seg-95eb34012fe8 = måne

seg-cc72d2fc8a43 = relativ navigation til docking i en månebane

seg-2cfa6846c937 = budget for landingsspredning ved et polart sted

seg-e9f5fc58fe12 = samme

seg-ba3c65a210dd = tilgængelighed af PNT og tidssynkronisering på overfladen efter sted og årstid

seg-8b9c5124dd3c = drevet opstigning til en indsætningsbane

seg-4ce0fa85457c = Månetyperne er også selvstændige scenarietyper; udformningen og evidensen findes i <a1><c1/></a1>.

seg-d16877f38793 = Budgettet bærer de <b>relative</b> sigmaer; jagerens absolutte kovarians gives videre uændret, og en række siger det, fordi denne fase måler køretøjerne mod hinanden og ikke mod Jorden. Den relative begyndelseskovarians er jagerens absolutte plus målets angivne sigmaer, lagt sammen, som om de var uafhængige (konservativt). Nøgler: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, valgfrit <c6/> og <c7/> og en eller flere <c8/> med <c9/>, <c10/>, <c11/>, <c12/> (<c13/>, <c14/> eller <c15/>, ILLUSTRATIVE parametre i <c16/>) og <c17/>; strækningernes varigheder lægges sammen til fasens. Dockingvinduet er tiden fra det tidspunkt, hvor den relative sigma holder sig inden for indfangningsomhyllingen, til fasens slutning. Gentagelser er særskilte faser med deres egne id'er.

seg-088b78574ab4 = Middeltilstanden er motorens Cowell-propagator med jordtyngde og J2 og Solen og Månen som tredjelegemer. Kovariansen går gennem hvert segment af <c1/> med en fremadrettet differens-tilstandsovergangsmatrix (den nominelle kørsel og seks forstyrrede kørsler) og en hvid accelerationsstøj. Brændingen er langs indflyvningshastigheden med en angivet størrelsesandel og retningsfejl. <b>Angivet begrænsning:</b> de indlagte udsnit af Månens kerne rummer Månen, men ikke Solen, så propagatoren tager Månen fra kernen og Solen fra den analytiske serie (Solens tredjelegemeled er ufølsomt over for den series fejl); fasen siger i en hændelse, hvad den brugte, og hvor ingen kerne dækker et segment, bruger den den analytiske serie til begge. Brændingen er <b>ikke målrettet</b>: den nominelle tilstand er, hvor den angivne brænding fører hen, og månefaserne tager kun kovariansen.

seg-e5a67295a5ae = Opdateringer, kun brugt når dokumentet angiver kilden: <c1/> (positionsbestemmelser med tilgængelighed og PDOP fra motorens gennemløb af rumservicevolumen langs en oskulerende jordbane, der står i for buen, ét gennemløb pr. <c2/>; sigma for positionsbestemmelsen = median-PDOP gange <c3/>; formen med forventet information holder kørslen deterministisk) og <c4/> (afstand og afstandshastighed langs den geocentriske retning, så himmelplanet ikke observeres; opdateringsvariansen divideres med sporingsandelen). Nøgler: <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, valgfrit <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>, <c19/>.

seg-3a69ca6723ba = Kysten er kysten for <c1/> uden brænding, der ender ved indflyvningsgrænsefladen; dens nøgler er kystnøglerne ovenfor. Ved grænsefladen aflæser fasen flyvebanevinklen og dens sigma fra den fulde kovarians, sandsynligheden for, at vinklen ligger inden for en angivet korridor, den maksimale deceleration ved den nominelle vinkel og ved begge korridorkanter (motorens plane ballistiske indflyvning ved siden af den lukkede Allen-Eggers-form) mod en valgfri grænse og fodaftrykket: nedrækkevidde ud fra en angivet følsomhed, tværrækkevidde fra grænsefladekovariansen på tværs af banens plan. Nøgler: <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, valgfrit <c8/>, <c9/> og <c10/> (den nominelle returtilstand, seks tal, når kæden ikke har nogen trans-jord-brænding til at frembringe en). Intet her modellerer en kapsels løft, styring eller opvarmning.

seg-352783ef7181 = Overlayet af jordnetværk

seg-69d6ab8e93bc = En valgfri tabel <c1/> angiver stationer og den laveste sporingselevation; for hver fase, den nævner, beregner tråden den andel af fasen, en station kan spore, og giver den videre til fasen som den andel, der skalerer opdateringsraten for jordsporing. Geometrier: <c2/> (indflyvningstilstanden fløjet to-legemer med J2, til faser i lav bane), <c3/> (køretøjet ved Månens position, til det cislunare krydstogt) og <c4/> (en andel, du angiver). Et stationsskift taber <c5/>; fasens budget får det længste interval uden station i sigte, og en hændelse angiver andelen. Intet modellerer et netværks antenner eller tidsplaner.

seg-467b14d7ef59 = <c1/>: <c2/> (indeks, id, type, tider, etiket, navigations- og tidskilder, begrænsende kilde, sigmaer ved indgang, spids og udgang, krav, margin, <c3/> med en enhed pr. række, <c4/>), <c5/> (mindste margin mod et angivet krav, ellers den største positionsspids), <c6/>, trådens <c7/> (den svageste fases etiket) og en blok <c8/>. Figuren er 1-sigma for position og urbias mod missionstid, ét bånd pr. fase.

seg-a3c40c51c2ff = Hvad evidensen er

seg-1168810d4407 = Trådens etiket er den svageste fases etiket, og hver fase er MODELLED. Månepropagatoren sammenlignes med LRO og CAPSTONE (<s1><c1/></s1>); den cislunare bue sammenlignes med en offentlig Horizons-bane (<s2><c2/></s2>). En række når eller misser en tærskel, der er fastsat i en indlagt fil før kørslen, og en miss registreres som en miss. Intet er VALIDATED, medmindre registeret siger det.

seg-ee3c5b58e6fa = <s1>Forrige</s1>Månebane og -overflade som infrastruktur

seg-b963f8a02aed = <s1>Næste</s1>Missionstråd: månesegmentet

seg-af81a8087ca7 = indflyvning
