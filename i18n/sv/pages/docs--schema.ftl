# docs--schema: translations (sv)

seg-2247a2344710 = Betydelse

seg-f42465f7d066 = ns

seg-f63dd3d7aad4 = Källa

seg-6940543aa3c0 = sträng

seg-f5e7215e6835 = objekt

seg-9da5d92757bd = objekt, valfritt

seg-c353e7bec219 = Nyckel

seg-a129b9e613d0 = Typ

seg-e28387d70be0 = Källa: <c1/>

seg-49d2afecf5f1 = Resultatschema — att läsa en Kshana-<c1/>

seg-c128455c353c = Varje körning skriver en versionshanterad, självbeskrivande JSON-artefakt (JavaScript Object Notation) bredvid scenariot. Den här sidan är den handskrivna läsarguiden till utbyteskuvertet och till resultatformerna för <b>klocka och bana</b>: varje fälts <b>enhet</b>, var det beräknas i källkoden och hur det ska läsas. Den kanoniska typen är <c1/> i <a1><c2/></a1>; kvalitetsmåtten är <c3/> i <a2><c4/></a2>.

seg-092ea1e33a05 = Den är <b>inte</b> den fullständiga fältreferensen. Motorn skickar vidare över många fler typer än dessa två, och var och en ger sitt eget paket. Den fullständiga referensen — enhet, proveniensklass och definition för varje numeriskt fält i varje inbyggd typ — är genererad, inte handskriven: se <a1>Enheter och proveniens, per fält, för varje typ</a1> nedan.

seg-e4c4b66a2f46 = Utbyteskuvert (KIF, Kshana Interchange Format) — att känna igen och versionskontrollera en artefakt

seg-9b83bb817814 = Kshana-artefakter kan paketeras i ett neutralt, självbeskrivande <b>utbyteskuvert</b> så att ett tredjepartsverktyg kan känna igen filen och avgöra om det kan läsa den <em>innan</em> det binder sig vid ett nyttolastschema. Den kanoniska typen är <c1/> i <a1><c2/></a1>.

seg-e4fd08930644 = Alltid <c1/> (<c2/>) — så känner ett främmande verktyg igen en Kshana-artefakt.

seg-abd853f2ce49 = Schemaversionen <c1/> (<c2/>, den enda sanningskällan för hela cratet).

seg-ee9f238072f1 = Artefakttyp, t.ex. <c1/>, <c2/>, <c3/> — låter en konsument styra utan att tolka innehållet.

seg-29ad4bedd64f = Crate-version (<c1/>) som producerade nyttolasten.

seg-52f3e962c049 = Den paketerade artefakten som kanonisk JSON (en <c1/>, en <c2/>, …).

seg-6fe0d7cd4165 = <b>Kompatibilitetsavtal.</b> Versioner är <c1/>. Nya fält läggs till med <c2/> (den <em>additiva disciplinen</em>), så en läsare kan tolka varje artefakt med <b>samma huvudversion och en lika gammal eller äldre delversion</b> (<c3/>). En strikt <b>nyare delversion</b> (<c4/>) kan bära fält som den här läsaren inte kan hantera, och en <b>annan huvudversion</b> (<c5/>) är ett strukturellt brott — båda avvisas av <c6/>, som validerar formattaggen och versionen vid gränsen istället för att i tysthet feltolka främmande indata.

seg-f7ae91002e56 = <b>Determinism.</b> Kuvertet bär <b>ingen tidsstämpel</b> — Kshanas reproducerbarhetslöfte (<c1/> reproducerar en körning) kräver det. Proveniensen finns i <c2/> och nyttolastens egen <c3/>.

seg-bb0b742d2df8 = En typad återläsning (<c1/>) fungerar för varje nyttolast som implementerar <c2/> (t.ex. <c3/>). Resultatartefakter är avsiktligt enbart serialiserbara och läses som det råa JSON-värdet <c4/>.

seg-87be7aa00b17 = Översta nivån (paketen för klocka och bana)

seg-cc22d9206eb4 = Typ / enhet

seg-3a821855c582 = Resultatschemats version (oberoende av motorversionen).

seg-cc6dded799f9 = Crate-version (<c1/>) som producerade filen.

seg-5a69a99b9a87 = hexsträng

seg-441eb1f43399 = SHA-256 (SHA: Secure Hash Algorithm) över det kanoniska scenariots JSON — körningen är reproducerbar utifrån <c1/>.

seg-ba73ba76873e = Frö för RNG (slumptalsgenerator) för kvantkörningen (den klassiska använder <c1/>).

seg-a688dd98c588 = nanosekunder

seg-24e0f04033fa = Tidssynkroniseringens specifikation: ett fel inom ±<c1/> är "in spec".

seg-f52388753a1a = scenario

seg-15b4082a6455 = objekt (<c1/>)

seg-7d3b92769bf5 = Kvantsensorns körning (se nedan).

seg-aa665b955931 = Den klassiska sensorns körning, för jämförelse.

seg-152ae43896b3 = Karta över enhet/proveniens per fält för det här dokumentet, nycklad på fältsökväg. Se §Enheter och proveniens nedan.

seg-119bac9b3e6f = Verifieringsnivån för varje rapporterat kvalitetsmått, och alltid dokumentets sista nyckel. <c1/> listar en post per närvarande värde: <c2/> (t.ex. <c3/>), <c4/> (<c5/> = kontrollerad mot en oberoende extern referens, <c6/> = utifrån grundprinciper, internt testad), <c7/> (den rad i verifieringsmatrisen som nivån läses från) och <c8/>. <c9/> är <c10/>, med ett <c11/>, för <c12/> i varje scenario utan konfigurerad attack: gränsen finns kvar i <c13/>, men den besvarar ingen fråga som scenariot ställer. <c14/> listar varje värde som ingen matrisrad äger (positionsvärdena för <c15/> och <c16/>), istället för att ge det en nivå. Ges av typerna <c17/> (enskild körning och Monte Carlo-ensemble), <c18/>, <c19/> och <c20/>, som bygger det inuti sin körning, och ({ "0.36" }, RM-04) av varje annan typ för sina huvudvärden, tillagt efter körningen från tabellen per typ <c21/>; <c22/> tar bort det igen till det onivåindelade dokumentet byte för byte. Ges inte av <c23/>, vars resultat är en frusen, förhandsregistrerad prediktion (<c24/>): den typen har inget <c25/> förrän en ny daterad prediktion ersätter den. Ges inte heller av <c26/>, <c27/>, <c28/> ({ "0.37" }; arrayer per plats), <c29/> och <c30/>, som saknar ett skalärt huvudvärde, eller av <c31/>, vars dokument är kompakt JSON (<c32/> anger skälet för var och en), eller av en kampanjs inbäddade medlemsdokument. Bär inga tal.

seg-1448f90f0086 = Geometrisammanfattning för banepaketet: <c1/>, <c2/>, <c3/> (m, det modellerade felbudgeten för avstånd per satellit), <c4/> / <c5/> (dimensionslösa) och <c6/> / <c7/> (m, PDOP (position dilution of precision) × <c8/>). <b>Endast banepaketet.</b>

seg-ae4f8eed06ac = array av <c1/> km, valfri

seg-d13d827f54b0 = Propagerat jordcentrerat tröghetsspår för användarens rymdfarkost, en post per samplad tidpunkt. <b>Endast banepaketet</b>; utelämnas annars. Endast utdata — hashas inte.

seg-8f511d5de657 = objekt (<c1/>), valfritt

seg-ea152e097d6f = Additiv rapportmetadata (studietitel, genereringsstämpel, författare, friskrivning). Utelämnas när den saknas, så en körning utan meta är byte för byte identisk med äldre utdata. Endast utdata — hashas inte.

seg-1041873fba1b = <c1/> (var och en av <c2/> / <c3/>)

seg-3fa81140c10d = Sensoridentifierare (t.ex. <c1/>).

seg-80765d202558 = Modelltyp (t.ex. <c1/>).

seg-6bf458d964fe = Citat/källa för sensorns parametrar.

seg-9145f04a557f = De råa modellparametrar som användes.

seg-697940342a28 = array av <c1/>

seg-b5f4216b55a2 = Tidsserie per steg: <c1/> sekunder, <c2/> tidsfelet i <b>nanosekunder</b>, <c3/> ett av <c4/>/<c5/>/<c6/>.

seg-7fba0b91b75e = objekt (<c1/>)

seg-5c4b60012f0e = De bedömda kvalitetsmåtten (nedan).

seg-1308a29c6a5b = array av <c1/>

seg-bbd42065492c = Överlappande Allan-deviation: <c1/> medelvärdestiden (s), <c2/> den dimensionslösa fraktionella frekvensstabiliteten σ_y(τ), <c3/> överlappsantalet bakom den punkten, <c4/> den potenslagstyp som identifierats utifrån lutningen för MDEV (modifierad Allan-deviation) (t.ex. <c5/>), <c6/> de brustypsspecifika effektiva frihetsgraderna, och <c7/>/<c8/> det χ²-baserade { "95" }-procentiga konfidensbandet på <c9/> vid det τ. Beräknas i <c10/>.

seg-1e61fd18257f = Bedömning av Kalmanfiltrets konsistens (NIS/NEES (NIS: normaliserat innovationskvadrat; NEES: normaliserat skattningsfelskvadrat) mot deras χ²-band), beräknad i <c1/>; utelämnas för körningar som inte bedömer den.

seg-9333864652b0 = <c1/> (objektet <c2/>)

seg-ce9caeaefd87 = Förbehåll

seg-b24de276d788 = RMS (kvadratmedelvärde) för klockfasfel (tidssynkronisering) under avbrottet.

seg-53e5018ae276 = ett mått på <b>tidssynkronisering</b>, inte position

seg-8cdec6da2072 = 95:e percentilen av tidsfelet under avbrottet.

seg-95f058adb809 = Sämsta (kortaste) glidning inom specifikation över avbrottssegmenten.

seg-48babfd3bd95 = <b>rutnätsbundet</b> — en nedre gräns vid tidstegsupplösningen

seg-41c08973baa1 = Tillväxttakt för |fel| under avbrottet enligt minsta kvadrat.

seg-707ee74c5c06 = andel [{ "0,1" }]

seg-32e5fe6415f8 = Andel av hela körningen med en lösning inom specifikation.

seg-361b3b923a45 = andel [{ "0,1" }] eller null

seg-5d55682f9349 = <b>Filtrets självkonsistens</b>: andel av avbrottets samplingar vars verkliga fel håller sig inom Kalmanfiltrets k-σ-gräns.

seg-636106cb4a40 = <b>INTE</b> integritet enligt HPL/VPL/RAIM (HPL: horisontell skyddsnivå; VPL: vertikal skyddsnivå; RAIM: receiver autonomous integrity monitoring) — se <a1><c1/></a1>

seg-f686ade3da21 = <b>Analytisk gräns för detekterbarhet av spoofing</b> utifrån klockans stabilitet.

seg-f8783db25141 = meningsfull bara med en konfigurerad attack, så paketen för klocka och bana (som inte konfigurerar någon) markerar den <c1/> i <c2/> och skriver ut den som <c3/> i sammanfattningen; <b>inte</b> en RAIM-detektor för flera satelliter

seg-90e2980430b9 = Hur "bra" ser ut

seg-c1afc6f3c545 = En <b>tystare klocka</b> (lägre <c1/>) ger en längre <c2/> och en högre gräns för detekterbarhet av <c3/> — det är kontrasten mellan kvant och klassisk.

seg-0fa38207813a = <c1/> nära { "1.0" } betyder att systemet höll sig inom specifikation nästan hela körningen; under ett långt avbrott sjunker det för den brusigare klockan.

seg-4dcba241d5a6 = <c1/> nära { "1.0" } betyder att filtrets egen osäkerhetsgräns var ärlig om sitt fel — ett påstående om <em>självkonsistens</em>, inte en garanti för liv och säkerhet.

seg-3099d75a04a5 = Andra scenariotyper

seg-43cd9f67f384 = Varje annan typ ger sin egen resultatform. Några av de vanligaste:

seg-6b59ef9dfe85 = <b>inertial</b>: kvalitetsmått i positionsdomänen i <b>meter</b> (<c1/>, <c2/>) — enaxlig (1-DOF (DOF: frihetsgrad)), ett enda frö (se <a1><c3/></a1>).

seg-3e3ec8985dde = <b>hybrid / fusion</b>: <c1/> och <c2/> på översta nivån, och per sida tidssynkroniserings- och positionsvärdena för en sensorsvit (<c3/>, <c4/> och <c5/>, tiden tills någon specifikation överskrids), med ett block <c6/> likt klockpaketets där positionsvärdena listas som <c7/>.

seg-e38e8a8adec8 = <b>spoof</b>: spoofingens offset per steg mot klockans detektionsgräns, plus om spoofingen nådde specifikationen före detektion (<c1/>).

seg-dfd972d160e1 = <b>skyline</b> (<c1/> och <c2/> med <c3/>, <c4/>, <c5/>, <c6/>, <c7/>; finns bara när scenariot har ett avsnitt <c8/>, så ett scenario utan ett är oförändrat): ett objekt <c9/> på översta nivån med <c10/> (sträng: <c11/>, <c12/> eller <c13/>), <c14/> (andel [{ "0,1" }] av den övre halvsfärens rymdvinkel ovanför <c15/>) och <c16/> (sträng); per sampling <c17/> (antal satelliter över masken men bakom skylinen: <c18/> av <c19/> och <c20/>, <c21/> av <c22/>, <c23/> av <c24/>); och för <c25/> <c26/> (antal epoker). Deras enheter och proveniensklasser finns i blocket <c27/> (<c28/> <c29/>; <a1><c30/></a1>).

seg-d113122b7454 = För den exakta fältuppsättningen för en viss typ, läs dess post i <a1><c1/></a1> (nedan), typens avsnitt i <a2><c2/></a2>, eller motsvarande struct <c3/> i <c4/>.

seg-e0c63207c019 = Andra filer som en körning skriver

seg-cc97989ca06b = Bredvid <c1/> skriver CLI (kommandoradsgränssnitt) <c2/>, en utskrivbar <c3/> och samma rapport som <c4/>, vars block <c5/> registrerar motorversionen, SHA-256 för scenariofilen, fröet, plattformen och det exakta kommandot (se <a1><c6/></a1> och <a2><c7/></a2>). Typer som publicerar en reproducerbarhetstabell skriver också <c8/> (CSV: kommaseparerade värden). <c9/> skriver utbytesfiler (se <a3><c10/></a3>) och <c11/> en animering (se <a4><c12/></a4>).

seg-489953601f3b = Enheter och proveniens, per fält, för varje typ

seg-61b33dbb44dd = Den här sidan är handskriven och täcker paketen för klocka och bana. Den maskinläsbara motsvarigheten täcker <b>varje</b> inbyggd typ:

seg-1e20fcda7f0b = <b>I själva resultatet.</b> Varje scenarios resultatdokument bär ett objekt <c1/> på översta nivån som kopplar ett utsänt fälts sökväg till <c2/>. Sökvägsgrammatiken (en array bidrar med ett segment med suffixet <c3/> som delas av dess rader; <c4/> är ett jokertecken för ett segment för dataindexerade objekt) och det slutna proveniensvokabuläret definieras i <a1><c5/></a1>.

seg-b8256437c0b7 = Som en fil.

seg-ae7136e34306 = <a1><c1/></a1> är den insamlade unionen: för varje typ, varje numeriskt fält den ger vid en angiven källa, med dess enhet, proveniensklass, evidensnivå och definition — och, namngivet snarare än utelämnat, varje fält som ännu inte har någon. Dess block <c2/> bär antalen.

seg-66af6dc065f7 = Båda upprätthålls av <c1/>, som kör varje registrerad typ och misslyckas om ett utsänt numeriskt fält saknar enhet och proveniensklass. Typer som ännu inte täcks namnges var för sig i filens <c2/> med skälet till att var och en är öppen, och antalet är fastlåst så att listan bara kan krympa.

seg-ca49a577a07b = Generera om JSON efter varje ändring av en rapports form eller av ett block <c1/>:

seg-ce4351cf7673 = <s1>Föregående</s1>Scenarioreferens

seg-b988dcc329a4 = <s1>Nästa</s1>Använda verkliga TLE:er

seg-6585c8a3643d = ClockRun (var och en av quantum / classical)

seg-299f8a9643f1 = FoMScores (objektet fom)

seg-d17376a1ea92 = ({ "0.40" }) Körningens evidensetikett: <c1/> (<c2/>, <c3/> eller <c4/>: den <em>svagaste</em> statusen bland raderna, så den hävdar aldrig mer än sin svagaste rad), <c5/> (<c6/>), <c7/> och <c8/>, en per rad i verifieringsmatrisen som körningen använde (de rader som dess avancerade rapport listar, från <c9/>): <c10/> (<c11/> och de första { "8" } hexsiffrorna i SHA-256 för radens kravtext), <c12/> och <c13/>, alla lästa från matrisen, inga inskrivna. Läggs till av <c14/> i varje typs resultat, före det avslutande blocket <c15/> när det finns ett (det blocket förblir den sista nyckeln); <c16/> tar bort den byte för byte. Diagrammets SVG och CSV-tabellen från samma körning bär samma etikett (<c17/> och en synlig rad under diagrammet; kommentarsraderna <c18/> först i CSV). Kampanjmedlemmar som är inbäddade i en annan typs resultat bär ingen: det yttre dokumentet gör det. Bär inga tal.
