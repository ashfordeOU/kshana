# docs--reports: translations (da)

seg-3ea93ae372ca = Hvad det indeholder

seg-245adc6e6766 = <s1>Forrige</s1>Kampagner

seg-aa5482ac34ff = Begrænsninger, åbent angivet

seg-b0dcf3142564 = Kilde: <c1/>

seg-4c412bb0ce63 = Hver kørsel af kommandolinjegrænsefladen (CLI) skriver en rapport ved siden af sit resultat: en udskrivbar HyperText Markup Language-side (HTML), <c1/>, og et maskinlæsbart JavaScript Object Notation-dokument (JSON), <c2/>, med det samme indhold. Rapporten virker for enhver scenarietype og for kampagner.

seg-e26b1a83a86d = Resultatdokumentet svarer på, <em>hvad motoren beregnede</em>. Rapporten tilføjer det, en læser har brug for, før der handles på det: hvad der gik ind, hvad tallene hviler på, hvad der blev udeladt, og hvordan man får de samme bytes igen. Den opfinder intet af det. Hvert afsnit læses fra en kilde, motoren allerede fører, og nævner kilden ved siden af det, den citerer.

seg-bf0456f18e4f = Bygningen sker med <c1/> (<c2/>). Det er en ren funktion af kørslens output, scenariefilens bytes og kommandolinjen: den læser intet ur, ingen fil og intet netværk, og den bygges til WebAssembly.

seg-bed0af192da5 = Afsnit

seg-fca842769048 = Afsnit

seg-2654051d8292 = Læst fra

seg-5790851a4a5f = Resumé for ledelsen

seg-3d34b2ef5988 = hvad typen gør, kørslens sammenfatning på én linje, hovedtal, mærket for redelighed for hele kørslen, antallet af VALIDATED / MODELLED / PARTNER-funktioner, der er brugt

seg-923111083001 = typekataloget (<c1/>), resultatets <c2/>, dets <c3/>-blok eller blok med kvalitetsmål, en Monte Carlo-kampagnes percentiler

seg-e1ce0e8d5c61 = hvert felt, scenariefilen sætter, fladet ud til sin sti, med sin enhed og hvor enheden kom fra

seg-fbd2e96c92c7 = scenariefilen; enheder fra resultatets <c1/>-blok (skemaet for feltenheder, <c2/>), ellers feltnavnets suffiks (<c3/>, <c4/>, <c5/>, <c6/>, <c7/>, …); en enhed, ingen af dem angiver, udskrives som <b>not stated</b>

seg-88ccaef6fc49 = kørslens diagram, hver skalar i resultatdokumentet med sin enhed og en sammenfatning med antal / minimum / maksimum / første / sidste for hver numerisk kolonne

seg-42a82485f8c8 = resultatdokumentet og dets <c1/>-blok

seg-f554fbcdd85c = Aggregering (kampagner og sweeps)

seg-7c0466805f54 = et sweeps nodetabel; en Monte Carlo-kørsels middelværdi, standardafvigelse, 5., 50. og 95. percentil og det { "95" }%-konfidensinterval for middelværdien, med et histogram for hver metrik; en kædes fasetabel; en sammensætnings fælles betingelser, medlemmer og samlede oversigt

seg-7b5f5b635905 = kampagneresultatets sektion <c1/>, <c2/>, <c3/> eller <c4/>; gitteret i et <c5/>- eller <c6/>-resultat

seg-3bf44008fc65 = Animation og eksport

seg-64d1073dfadc = kørslens animerede tegning (outputtet fra <c1/>) indlejret som et inaktivt billede, eller hvorfor der ikke er nogen; links til de animations- og interoperabilitetsfiler, som den samme kommando skrev ved siden af rapporten; hvert eksportformat med oplysning om, om det gælder for scenariet, hvorfor ikke, og dets specifikation

seg-ad7792e04197 = animationseksportøren (<c1/>), <c2/> og de filer, kommandolinjen skrev (<c3/>, <c4/>)

seg-3d3781a3691b = Hændelsestidslinje

seg-f29f1b90edbd = tidsfastsatte vinduer og punkthændelser, tegnet og vist i tabel på kørslens tidsakse

seg-4271c092fa45 = scenarietabeller med <c1/>/<c2/>, <c3/>/<c4/>, <c5/>/<c6/> eller et indsætningstidspunkt; kørslens tidsrum <c7/>; ethvert <c8/>-array i resultatet; en kampagnes faser og overdragelser

seg-00bee96167aa = Verifikationsmærkater

seg-6dea392111a6 = hver række i verifikationsmatrixen, som kørslens typer berører, med dens mærkat, uafhængige reference og testbevis samt de niveauer for hvert tal, som resultatet angiver

seg-ca56309b9693 = verifikationsmatrixen (<c1/>, <c2/>) gennem krydsreferencen fra type til række <c3/>

seg-c19ae28a2355 = Ikke modelleret, og antagelser

seg-aff7a016c7e2 = hver begrænsning, citeret

seg-9be853632d3a = resultatets blokke <c1/>, <c2/> og <c3/>; MODELLED-klausuler i typekataloget; scenariekommentarer og inputtekst, der siger "not modelled"; matrixens begrundelse for, hvorfor hver MODELLED-række forbliver modelleret (<c4/>)

seg-a3ee5ba71183 = Reproducerbarhedsoptegnelse

seg-a9746c2f1881 = motorversion, kildecommit, Secure Hash Algorithm 256-bit (SHA-256)-digests af scenariefilen og af resultatdokumentet, seed, platform, den præcise kommando, reglen om arbejdsmappen og digest af hver yderligere inputfil

seg-ec1f62f6bbd1 = buildet, filerne, kommandolinjen

seg-ea460048debd = En sektion uden noget at opregne angiver årsagen i én sætning (for eksempel "No timed event: the scenario scripts no window or onset time and the result reports no event"). Ingen sektion er nogensinde tom og tavs.

seg-b99234469953 = Hvad en mærkat i rapporten betyder

seg-f9060b1e8077 = En verifikationsmærkat bedømmer den <b>funktion</b>, der er nævnt i en matrixrække, sådan som matrixen registrerer den. Den bedømmer ikke scenariets konfiguration, og en VALIDATED-række gør ikke en kørsels input til målte data. En PARTNER-række er en disciplin, som kørslen bygger på, og som Kshana ikke leverer (antennehardware til radiofrekvenstyperne, den kvantemæssige nyttelast til kvantetyperne, rumfartøjets bus til attitudebudgettet); rapporten viser den som <em>relied on, not provided</em>.

seg-da422ae044d2 = Krydsreferencen fra type til rækker er en tabel af matrixens <c1/>-strenge. Mærkaten, den uafhængige reference og beviset læses tilbage fra matrixen, når rapporten bygges, så når en række flyttes mellem VALIDATED og MODELLED, flytter hver rapport med. En kampagne bærer rækken for sin tilstand (kæde, sweep eller Monte Carlo, sammensætning) samt hver række for hver medlemstype, den har kørt; <c2/> bærer rækkerne for den type, den har sweepet. Hver kørsel bærer også rækken "Reproducibility & software assurance", som reproducerbarhedsoptegnelsen hviler på.

seg-f38434695c28 = En række, der kun bedømmer én inputsti for en type, opregnes kun, når kørslen har fulgt den sti (<c1/>): <c2/> og <c3/> bærer rækken "Orbit propagation & determination" kun med en <c4/> (stien med Simplified General Perturbations { "4" } (SGP4); en analytisk bane er en to-legemers propagering), og <c5/> bærer rækken for målt optegnelse kun med en <c6/>. Den samme tabel styrer rækken for flere bånd under <c7/> efter, om kørslen tegner <c8/>, og rækkerne for typerne med lav jordbane (LEO) efter den sti, hver kørsel har fulgt: en række for regn, indtrængen i bygning, lav energi eller spoofer for <c9/> eller <c10/> kun når scenariet sætter det led, rækken for scintillation medmindre scenariet slår den fra, en række for <c11/>, <c12/> eller kædens præcise punktpositionering kun for den analyse eller tilstand, resultatet bærer, og rækken for LEO-systemforudindstilling kun når en navngiven forudindstilling bruges. Læserrækken for Shuttle Radar Topography Mission (SRTM) bæres af ingen type: <c13/> og <c14/> kører på en syntetisk digital højdemodel (DEM), og intet scenariefelt læser en SRTM-flise. En VALIDATED-række, som kørslen aldrig har berørt, ville ellers hævde et belæg, som kørslen ikke har.

seg-29efeadac5c7 = Gengivelse af en kørsel ud fra dens rapport

seg-e859939f0f42 = <c1/> → <c2/> indeholder alt, hvad der skal bruges:

seg-d65ad1b942e3 = Kontrollér scenariefilen mod <c1/> og enhver fil i <c2/> (en <c3/>-fil om jordens orientering) mod dens digest.

seg-5b3c59266451 = Kør <c1/> fra den mappe, som den oprindelige kørsel blev startet i. Scenariets sti og enhver relativ datasti i scenariet opløses i forhold til den.

seg-9f38218af0f0 = Den nye <c1/> har den SHA-256, der står i <c2/>, og den nye <c3/> og <c4/> er byte-identiske med de gamle.

seg-a04db3e1c7f5 = <c1/> gør præcis dette for et urscenarie, en kædet kampagne, en sweep-kampagne og en banekørsel med en <c2/>-fil: den læser kommandoen ud af rapporten, kører den i en ny mappe med kun de registrerede input og sammenligner bytes.

seg-1e2e9158544d = <c1/> er digest af filens præcise bytes. Resultatets eget <c2/> er noget andet, nemlig typens fingeraftryk af scenariet (ofte af en kanonisk form), og rapporten udskriver begge med mærkater.

seg-3d72d2059a6c = <b>Seed.</b> Seed er scenariets <c1/>, ellers det, som resultatet angiver. For en type, der ikke tager noget seed, siger rapporten det, og at scenariefilen og motorbuildet alene fastlægger resultatet.

seg-50457327734e = <b>Kildecommit.</b> Motoren registrerer kun commit, hvis den er bygget med miljøvariablen <c1/> sat, læst ved kompilering:

seg-3c7ed74729d3 = Et build uden den rapporterer commit som ikke registreret, og motorversionen identificerer udgivelsen. Intet gættes.

seg-86ff67531a0e = <b>Platform.</b> Buildets operativsystem, arkitektur og familie. Resultaterne er byte-identiske på én platform; på tværs af platforme kan flydende-komma-resultater afvige i de sidste cifre (se <a1>REPRODUCIBILITY.md</a1>).

seg-eeb07da80914 = Determinisme og det ene tidsstempel

seg-995ad516f5ae = Samme scenariebytes, seed og motorbuild giver en byte-identisk <c1/> og <c2/>. Rapporten bærer intet tidsstempel. Den eneste urlæsning i hele cratet er den, som <c3/> foretager, og som stempler <c4/> ind i resultatdokumentet; rapporten viser derefter dette stempel og siger, at det er det ene felt, som en reproduktion ikke vil matche. For at undgå det køres uden <c5/>. <c6/> bygger rapporten for hver scenariefil under <c7/> (suitemanifestet undtaget) to gange og genkører seks scenarier (blandt dem én kampagne i hver af tilstandene kæde, sweep og sammensætning) for at kontrollere dette fra ende til anden.

seg-8a3fc60a5b54 = Udskrivning til PDF

seg-201bcec2caa3 = Motoren skriver ikke Portable Document Format (PDF)-filer. En PDF-skriver, der gengiver diagrammerne, ville betyde en ny, tung afhængighed, så der er ingen <c1/>-indstilling. I stedet bærer <c2/> et udskriftsformatark: åbn den i en browser, udskriv, og vælg "Gem som PDF".

seg-13f1f294ede1 = Formatarket er skrevet til både A4 og US Letter. Det fastsætter ingen papirstørrelse (udskriftsdialogens valg gælder), bruger marginer på { "15" } mm / { "14" } mm, som passer til begge ark, skifter til sort på hvid, gentager tabeloverskrifter på hver side, forhindrer, at tabelrækker, figurer og kort deles over flere sider, holder overskrifter sammen med den tekst, der følger, og starter sektionerne input, resultater, verifikationsmærkater og reproducerbarhed på en ny side. Navigationslinjen er skjult ved udskrift.

seg-a25bb320665d = JSON-dokumentet

seg-9d9af39942a7 = <c1/> har <c2/> og <c3/>, derefter <c4/> og <c5/> og én nøgle for hver sektion: <c6/>, <c7/>, <c8/>, <c9/> (kun kampagner og sweeps), <c10/>, <c11/>, <c12/>, <c13/> (afsnit 3b: <c14/>, <c15/> og <c16/>) og <c17/>. En listesektion har <c18/>, <c19/> (de rækker, som sidens loft udelod; resultatdokumentet bærer hver værdi) og, når <c20/> er tom, en <c21/>, der siger hvorfor. En værdi beholder sin rå JSON-form i <c22/> og den tekst, siden viser, i <c23/>; en manglende værdi er <c24/> i <c25/> og "no value" i <c26/>.

seg-06cc70ca3601 = <b>Enheder.</b> Hvor hverken skemaet for feltenheder eller feltnavnet angiver en enhed, siger rapporten "not stated" i stedet for at gætte. Input, der er indlejret i en kampagnes medlemsscenarier, opløses kun mod kampagnens egen units-blok og feltnavnets endelse, så flere af dem lyder "not stated" end i en selvstændig kørsel.

seg-023d5a1fbffc = <b>Skøn i krydsreferencen.</b> Hvilke matrixrækker en type berører, er en kurateret tabel, som en test kontrollerer, så den nævner præcis én eksisterende række for hver post og dækker hver indbygget type. Om hver tilknytning er den rigtige, er et menneskeligt skøn, ligesom matrixens eget valg af uafhængig reference.

seg-0a7465f4c29a = <b>Lofter.</b> Siden opregner højst { "400" } input, { "150" } skalare resultater, { "60" } numeriske kolonner og { "200" } hændelser; <c1/> tæller resten. En tabel med mere end { "24" } rækker inde i et scenarie (en indlæst serie) opsummeres for hver kolonne.

seg-1fa26ed86bb8 = <c1/> beholder sin egen <c2/> og <c3/>; den skriver ikke denne rapport.

seg-1ccdffd389fb = <b>Bindinger.</b> Python- og WebAssembly-bindingerne beholder <c1/>, resultatkortet på én side; legepladsens rapport, der kan hentes, er en side for sig (<c2/>). Denne rapport skrives af CLI'en, og Rust-kaldere kan bygge den med <c3/>. Model Context Protocol (MCP)-serveren returnerer den fra sit værktøj <c4/>, som JSON eller som HTML-siden; scenariefilens navn i dens reproduktionskommando er det, kalderen angiver (standard <c5/>), og den opregner ingen ledsagefil, da serveren ikke skriver nogen.

seg-c8ab7b4605cf = <s1>Næste</s1>Animationseksport
