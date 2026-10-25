# docs--interference-map: translations (sv)

seg-6555ff9a6d8e = Utdata

seg-2247a2344710 = Betydelse

seg-c3c260b7063e = Tester

seg-d4a762001549 = Licens

seg-e7b6d071246e = Källa: <c1/>

seg-143c73287d6c = <c1/> bygger en bild per dag av var flygplan och fartyg rapporterade försämrade navigeringsdata, utifrån öppet licensierade spårningsfiler som du tillhandahåller. <c2/> anger sedan hur stor del av en planerad rutt som låg inom de påverkade cellerna varje dag.

seg-158f33f95ec3 = Vad detta är: en beskrivning av hur publicerade positionsrapporter såg ut under tidigare dagar. Vad det inte är: en mätning av någon mottagare, en prognos eller ett bevis på störning. En försämrad eller avvikande cell har flera möjliga orsaker (listas nedan), och en cell utan post observerades helt enkelt inte.

seg-64d3ee269407 = Allt körs på lokala filer. Standardkommandona öppnar aldrig en nätverksanslutning; den enda valfria nedladdningshjälparen kräver en uttrycklig flagga.

seg-e251b385ff46 = Två syntetiska dagar i störningskartan, ritade från de incheckade exemplen i examples/interference-map/output, var och en med sin egen syntetiska rutt och de ruttexponeringsandelar som motorn redovisar. Till vänster en ADS-B-dag: { "1" } försämrad cell, { "6" } inte försämrade, { "4" } ej bedömda (snedstreckade) och celler utan post, ritade tomma, som inte observerades. Rutten är { "525" } km: { "11.5" }% av dess längd i försämrade celler, { "38.3" }% inte försämrade, { "9.1" }% ej bedömda och { "41.1" }% inte observerade. Till höger en AIS-dag: celler flaggade av cirkel- och landdetektorerna, icke-avvikande celler och tomma celler; rutten är { "454" } km med { "10.5" }% i avvikande celler, { "21.2" }% icke-avvikande, { "0.0" }% ej bedömda och { "68.3" }% inte observerade. ADS-B och AIS är separata lager och kombineras aldrig. En flaggad cell är inte ett fynd av störning, och en cell utan färg observerades inte, vilket inte är detsamma som fri. Alla data är påhittade, på öppet hav i mellersta Atlanten, och inte en mätning.

seg-765f43228dc6 = Båda dagarna är de syntetiska exemplen i <c1/>, var och en med en syntetisk rutt i <c2/>; ruttexponeringsandelarna är vad <c3/> skriver ut för dem. Ingenting i dem är en verklig plats, ett verkligt flygplan eller fartyg.

seg-228f39c0305b = Data och licenser

seg-d3336cc18ff7 = Endast de källor som granskats i <a1><c1/></a1> är inbyggda, och väljs med <c2/>:

seg-b03d56f501c3 = Typ

seg-2328672e782f = Licensfält i utdata

seg-2319c7a6f6e2 = ODbL { "1.0" }

seg-7464d3c830f3 = AIS

seg-c13f76567536 = Amerikansk allmän egendom (CC0 { "1.0" } enligt utgivaren)

seg-636c2bb6f29d = allmän egendom

seg-f6f4e431d36d = NLOD { "2.0" }

seg-5621e3a3908f = endera

seg-6b3a1f8ca649 = vad du än anger

seg-be349e2c455f = <c1/>, <c2/>, <c3/> krävs

seg-590344d1eae5 = Varje utdatafil bäddar in licensen, licensens URL, den krävda källangivelsen och källans täckningsbegränsningar. Det finns ingen inbyggd post för källor vars villkor förbjuder kommersiell användning eller vidaredistribution av härledda kartor.

seg-2d8eaefab0f8 = <b>ODbL och Kshana-utgåvor.</b> En ADS-B-fil per cell som görs av adsb.lol-data är en Derived Database och släpps under ODbL { "1.0" }; dess fält <c1/> säger det. Kshanas egen kod förblir AGPL-3.0. Kommersiella utgåvor av Kshana som skriver sådana filer bär samma notis, och den som återpublicerar filen måste behålla den. ADS-B- och AIS-resultat kombineras aldrig i en fil, så ODbL fäster inte vid AIS-lagret.

seg-bb4932d5d15c = <b>Täckningsbias.</b> Kartor ärver sin källas täckning. adsb.lol följer frivilliga mottagare, så öppet hav och glest täckta regioner är glesa. Kystverkets öppna data utelämnar fiskefartyg under { "15" } m och fritidsbåtar under { "45" } m, så dess karta speglar större fartyg. MarineCadastre täcker bara amerikanska vatten.

seg-713babc3963b = <b>Identifierare.</b> Indataraderna bär en identifierare för flygplan eller fartyg. Den hashas i minnet med ett slumpmässigt salt per körning, används bara för att räkna distinkta flygplan eller fartyg och skrivs, loggas eller skrivs ut aldrig. Utdata är aggregerade: ingen identifierare förekommer någonstans i dem.

seg-fa3c70a8997a = <b>Undertryckning.</b> En cell med färre än <c1/> distinkta flygplan eller fartyg observerade den dagen publiceras inte alls, och för AIS rapporteras ett flaggat antal på ett eller två i en publicerad cell som <c2/>. Inget publicerat värde kan peka ut ett flygplan eller ett fartyg.

seg-02dbfcb9c808 = Indataformat

seg-2f291f986a87 = Vanlig CSV med en rubrikrad, kommaseparerad, utan citattecken, UTC-tider. Kolumnordningen är fri; okända kolumner ignoreras. En tidsstämpel är Unix-sekunder eller <c1/>. Rader som inte kan tolkas räknas i utdatans metadata, och tappas inte tyst.

seg-571365be20a5 = ADS-B (<c1/>):

seg-aaeff8f42699 = Kolumn

seg-b10a51ed96c0 = Krävs

seg-357c2320b43a = ja

seg-14ac5d0f109b = rapporttid

seg-6dbe5595d0be = ogenomskinlig identifierare (hashas, sparas aldrig)

seg-c5fb6b91dc68 = grader

seg-e283838c85aa = höjd i fot; <c1/> eller tomt utesluter raden

seg-9ab90c35bd7d = minst en

seg-868e5b9c00ab = heltal { "0" } till { "11" }; tomt betyder inte rapporterat

seg-db907db790b1 = nej

seg-5c2ce9f61700 = om närvarande används bara värden som börjar med <c1/> (MLAT, TIS-B och liknande utesluts)

seg-412f40b8eeb1 = <b>adsb.lol readsb-historik, läst direkt.</b> De dagliga arkiven är en delad tar av readsb-spårfiler. Packa upp ett som utgivaren beskriver (sammanfoga delarna, <c1/>) och ge sedan Kshana den uppackade katalogen, en enskild <c2/>-fil eller en CSV:

seg-6e7d378bd89b = En katalog genomsöks rekursivt efter <c1/>-filer (andra filer, såsom <c2/>, ignoreras och symboliska länkar följs inte). Varje fil är gzip-komprimerad eller vanlig JSON, vilket avgörs av dess första byte, eftersom readsb skriver gzip under ett namn med <c3/>; dekomprimeringen begränsas till { "512" } MiB per fil. Från varje spårpost läser Kshana tidsförskjutningen, latitud, longitud, höjd (markören <c4/> utesluter posten), fälten <c5/> och <c6/> i flygplanets detaljobjekt samt positionskällans sträng (poster från något annat än ADS-B utesluts). En post utan detaljobjekt har inga noggrannhetsfält och räknas som utesluten. En fil som inte kan läsas räknas i <c7/> i utdatans metadata och hoppas över.

seg-b1502f7f4c98 = AIS (<c1/>):

seg-91395984ddac = grader; AIS-värdena ”inte tillgängligt” och ({ "0" }, { "0" }) kasseras

seg-34ae94eb1797 = fart över grund i knop; { "102.3" } (inte tillgängligt) behandlas som saknat

seg-a1e60af5adaa = Detektorn för land behöver en landpolygonfil (<c1/>): GeoJSON Polygon eller MultiPolygon. Natural Earths landlager i { "1" }:{ "10" } miljoner (allmän egendom) är den avsedda filen. Utan <c2/> är detektorn av och utdata säger det. För att ladda ned den (den enda nätverksåtkomsten i den här funktionen):

seg-cd55a09894c5 = Detta kör systemets <c1/> (som en argumentlista, inte via ett skal) över HTTPS, en gång, för en fil på en fast adress som namnger en enda incheckning i uppströmsförrådet. Nedladdningen behålls bara om dess SHA-256 är lika med värdet som är fastlåst i koden; en avvikelse raderar den och misslyckas. Om <c2/> inte är installerat säger kommandot det och anger adressen och kontrollsumman så att filen kan hämtas för hand. Ingenting medföljer i förrådet.

seg-95eeaa0033b3 = En GeoJSON-fil per källa och UTC-dag, i katalogen <c1/>, med namnet <c2/>, där <c3/> är <c4/> eller <c5/>, <c6/> är nyckeln <c7/> (<c8/>, <c9/>, <c10/> eller <c11/>) och datumet är rapporternas UTC-dag: <c12/>, <c13/>. Datamängden finns i namnet så att två datamängder av samma typ inte kan dela en fil, och <b>Kshana skriver aldrig över en fil</b>: om något mål finns misslyckas kommandot innan något skrivs. CLI skriver ut en rad per fil som skrivs. En läsare kan återskapa de tre delarna med <c14/>; samma information finns inuti filen (<c15/>, <c16/>, <c17/>). Syntetiska exempelfiler, en per källa, finns i <c18/>, med kommandot som återskapar dem, för att bygga och testa en visare. En medlem på toppnivå, <c19/>, innehåller schemanamnet, datum, rutnät, metod-id och varje parameter, siffrorna på dagsnivå, datalicensen och källangivelsen samt en notis. Varje objekt är en cellpolygon med <c20/>, <c21/>, <c22/>, <c23/> och de aggregerade antalen.

seg-1ee702004726 = Rutnätet är fast: kvadratiska celler på <c1/> grader (standard { "0.5" }) i latitud och longitud, indexerade från (-90, -180). Bredden öst–väst krymper med latituden: cirka { "55" } km vid ekvatorn och cirka { "28" } km vid { "60" } grader för standardvärdet. Latitud { "90" } hör till den sista raden och longitud { "180" } är samma meridian som -180. <b>De förhandsregistrerade metoderna är definierade på rutnätet med { "0.5" } grader.</b> Ett annat <c2/> körs, men är inte den förhandsregistrerade metoden: CLI säger det, och filen registrerar <c3/> och <c4/> (false) så att en visare också kan säga det.

seg-6e1e8f2a9082 = <b>Undanhållna antal.</b> Varje antal per cell under publiceringsminimum ({ "5" }) är <c1/>, noll inräknat, så <c2/> betyder aldrig ”inga” och inget publicerat tal kan peka ut ett flygplan eller ett fartyg. Fälten <c3/> och <c4/> anges fortfarande. I ADS-B-filer är <c5/> alltid minst { "5" } för en publicerad cell; <c6/> och <c7/> är <c8/> under { "5" }, och <c9/> är <c10/> om inte båda är minst { "5" } (en andel skulle avslöja ett undanhållet antal). I AIS-filer är varje post i <c11/> <c12/> under { "5" }.

seg-fd929d6ee90b = Formatversion och fält

seg-ff443e9cbd20 = Formatet är fastställt som <c1/>, <c2/>. En ändring som tar bort eller byter namn på ett fält, eller ändrar vad ett fält betyder, höjer versionen; att lägga till ett fält gör det inte, så en läsare måste ignorera fält den inte känner till. Ett antal som är <c3/> är undanhållet, inte noll.

seg-60818bfc3f90 = Värden för <c1/>: ADS-B <c2/>, <c3/>, <c4/>, <c5/>, <c6/>; AIS <c7/>, <c8/>. <c9/> är true endast för <c10/> och <c11/>. Ruttexponeringsrapporten har sitt eget schema <c12/>.

seg-ea526ebdd260 = Observatoriet: den dagliga produkten

seg-e33f63fe5c0a = <c1/> gör en UTC-dag av ADS-B-rapporter till observatoriets tre filer (GeoJSON, PNG och en JSON med incidentrapport) och ett hashmanifest, och <c2/> spelar upp den dagen igen under ändringar av de förhandsregistrerade parametrarna en i taget. Kommandot upprätthåller utgivningsreglerna: minst { "24" } h efter att dagen slutat (<c3/> får bara höjas), celler på { "0.5" } grader eller grövre, bara tre tillstånd (<c4/>, <c5/>, <c6/>), ingen orsak tillskrivs och inga OpenSky-data. Metodnoten, filformaten och begränsningarna finns i <a1><c7/></a1>. En regional körning (<c8/>) läser bara rapporterna i rutan och anger det i filen.

seg-31ce42fc05dc = Specifikation av Studios kartsida

seg-a9aca2e2d390 = För Studios kartsida, som läser in en GeoJSON-fil som användaren tillhandahåller (sidan byggs i Studios källkod, inte i det här förrådet). Ingenting laddas upp: filen läses i webbläsaren, och sidan gör inga anrop till någon datakälla.

seg-064ec5d4c91a = <b>Läsa en fil.</b> Godta en fil bara om <c1/> börjar med <c2/> och <c3/> är ett tal som sidan stöder; annars ska det sägas att filen inte är en Kshana-störningskarta som stöds. Läs fälten som listas ovan; ignorera okända. En fil innehåller en källa och en dag. Flera filer kan läsas in.

seg-5be32f8cff46 = <b>Celler.</b> Rita varje objekts polygon. Färglägg efter <c1/>, och ange alltid vad varje färg betyder i en förklaring. Fyra tillstånd, av vilka inget får döljas eller slås ihop:

seg-b652b86e6b8e = Tillstånd

seg-4a511b6a03e3 = Var det kommer ifrån

seg-f92da2236260 = Försämrad (eller avvikande för AIS)

seg-591ebe8007cb = en hög andel flygplan rapporterade låg noggrannhet, eller fartyg uppvisade avvikelser, den dagen

seg-bd993c64b6e8 = <c1/> är true

seg-88d43eb1c14a = Fri

seg-af5f7989fd09 = observerad med tillräckligt många flygplan eller fartyg och inte flaggad

seg-2bc810e02210 = <c1/> är <c2/> eller <c3/>

seg-d894eaa21369 = Ej bedömd

seg-38c88ed94111 = observerad men inte tillräckligt många samplade flygplan, dagen var förvirrad, eller dagens bakgrund kunde inte uppskattas

seg-e358a8c7903f = <c1/> är <c2/>, <c3/> eller <c4/>

seg-013b7c903426 = Inte observerad

seg-81bcffa57ec2 = för få flygplan eller fartyg, så cellen publicerades inte

seg-6828d71822bd = inget objekt för den cellen

seg-753192a770ac = ”Inte observerad” är frånvaron av ett objekt: rita den neutralt (ingen fyllning, eller en snedstreckning), aldrig i färgen för ”fri”. Använd ett färgschema som inte enbart förlitar sig på rött mot grönt. Celldetaljer vid hovring eller markering visar antalen i <c1/> som de anges, och varje antal <c2/> som ”undanhållet (färre än { "5" })”, aldrig som noll. En visare bör också säga, när <c3/> är false, att filen använder en cellstorlek utanför den förhandsregistrerade metoden.

seg-e90fedf7ad89 = <b>Lager.</b> ADS-B och AIS är separata lager med egna reglage, förklaringar och licensrader. Slå aldrig ihop dem till ett färgfält eller ett antal, rita dem aldrig som en kombinerad cell och summera aldrig deras celler. Olika dagar är olika filer: visa en dag i taget, med en dagsväljare, i stället för att lägga dagar över varandra.

seg-6d500d3c0baa = <b>Licens och källangivelse.</b> För varje synligt lager ska du på kartan, och i varje export eller skärmbild, visa texten i <c1/> ordagrant, <c2/> med en länk till <c3/>, och <c4/>. Om ett ADS-B-lager visas gäller dess ODbL-licens bara det lagret. Erbjud inte export av en kombinerad fil.

seg-6f786153ef8e = <b>Metod.</b> Erbjud metod-id och parametrar (<c1/>, <c2/>) och siffrorna för <c3/> i en detaljpanel, inklusive <c4/> (säg tydligt att ingen cell kallades försämrad på grund av dagens bakgrund) och <c5/>.

seg-905348837439 = <b>Förbehåll att behålla</b> (visa filens egna <c1/> och <c2/>, och håll den här formuleringen eller dess motsvarighet synlig vid kartan):

seg-1f70e308010a = En försämrad eller avvikande cell är inte ett fynd av störning. Andra orsaker finns.

seg-7cde0ddadb73 = En cell utan färg observerades inte. Det är inte evidens för att området var fritt.

seg-1135dfeadb8f = Det här är en beskrivning av tidigare positionsrapporter, inte en prognos och inte en mätning av någon mottagare.

seg-3ad1216bf3ed = Täckningen följer datakällan; läs täckningsanmärkningarna.

seg-046f6af48349 = Sidan får inte namnge eller visa något enskilt flygplan eller fartyg, och filerna innehåller inget.

seg-ae79b67c3b98 = <b>Ruttexponering.</b> Om sidan också läser in en <c1/>-rapport ska den visa dess rader per dag och källa med de fyra andelarna (försämrad, fri, ej bedömd, inte observerad) tillsammans, aldrig enbart den försämrade andelen, plus rapportens <c2/> och varje rads <c3/> och <c4/>.

seg-98131acf49d8 = ADS-B-metod (<c1/>)

seg-83b660b0bfa6 = Varje ADS-B-rapport från luften bär två självbedömda fält för navigeringskvalitet: NIC (positionens inneslutningsradie) och NACp (noggrannhetsgränsen på { "95" }%, EPU). När mottagaren ombord förlorar eller misstror sin satellitpositionsbestämning sjunker båda, och därför bär de en signatur av störning. De sjunker också av andra orsaker.

seg-4b9020a68db6 = <b>Förhandsregistrerade parametrar</b> (konstanter i koden, skrivna i varje fil; en ändring innebär en ny metodversion):

seg-e73ea9921fcf = Parameter

seg-8650fa804f14 = Höjdgolv

seg-25056ee5a36c = barometrisk höjd på minst { "5000" } ft

seg-17322eff480a = Rapport med låg noggrannhet

seg-48ab6ed5eedd = NACp högst { "6" } (den rapporterade EPU-gränsen är { "556" } m, { "0.3" } NM, eller större, eller okänd) eller NIC högst { "5" } (den rapporterade inneslutningsradiegränsen är { "1852" } m, { "1" } NM, eller större, eller okänd)

seg-84beb488319d = God rapport

seg-2595055d9593 = NACp minst { "8" } och NIC minst { "7" }; bedöms på de fält som indata har (båda när båda finns, annars det som finns)

seg-b4bbce695b2d = Utrustningsbaslinje

seg-4986ed51f600 = ett flygplan räknas i en cell bara med minst { "5" } goda rapporter utanför den cellen samma dag

seg-42859d1d785b = Samplade flygplan i en cell

seg-1ae26d6d99a9 = minst { "3" } rapporter i cellen

seg-48bba15e2e0e = Påverkade flygplan i en cell

seg-1fe9c3ab930c = minst { "50" }% av dess rapporter i cellen har låg noggrannhet

seg-b147473d133c = Minsta urval

seg-33060cda8536 = minst { "10" } samplade flygplan

seg-009ca23b9cd6 = Försämrad

seg-afef85ae2a25 = minst { "5" } påverkade flygplan, en påverkad andel av samplade flygplan på minst { "0.30" }, och minst { "0.15" } över dagens mediancellandel

seg-890dcc56fa5c = Förvirrad dag

seg-b27768e64d62 = mediancellandel (över minst { "5" } celler med fullt urval) minst { "0.15" }: ingen cell förklaras försämrad

seg-18fbf3c348c9 = Ingen bakgrund

seg-534111e0c6ad = färre än { "5" } celler med fullt urval, så medianen kan inte uppskattas: en cell som uppfyller tröskelvärdena är <c1/>, inte försämrad

seg-b571f127c595 = Publiceringsminimum

seg-60621ffc5bcf = minst { "5" } distinkta flygplan observerade

seg-f36389caf81b = De här värdena sattes utifrån definitionerna av NIC- och NACp-koderna och utifrån integritetsregeln innan några data hade tittats på. De trimmades inte på verkliga data, och testerna använder bara syntetiska data. Cellstatus: <c1/>, <c2/>, <c3/> (publicerad men färre än { "10" } samplade flygplan), <c4/> och <c5/>.

seg-c89afc07989b = <b>Version { "2" }.</b> Version { "1" } förklarade en cell försämrad från så få som { "3" } påverkade flygplan, färre än publiceringsminimum på 5 flygplan, och hoppade över kontrollen av dagens bakgrund utan att säga det när färre än { "5" } celler var fullt samplade. Version { "2" } kräver minst { "5" } påverkade flygplan och undanhåller bedömningen (<c1/>) när bakgrunden inte kan uppskattas. Båda ändringarna skärper metoden (inget som inte var försämrat i version { "1" } är försämrat i version { "2" }); skälet är att en publicerad bedömning aldrig får vila på färre flygplan än det antal under vilket antal undanhålls. Filer av version { "1" } släpptes inte.

seg-ffd0e5175548 = Varför noggrannhetsfälten sjunker av andra orsaker än störning, och skyddet mot var och en:

seg-12b613a77f64 = Orsak

seg-e30479c3e5d8 = Skydd

seg-ecac3d226210 = Äldre transpondrar som aldrig rapporterar NIC eller NACp, eller rapporterar dem med ett fast lågt värde

seg-8b504b60fcc0 = utrustningsbaslinjen: ett flygplan utan goda rapporter någon annanstans den dagen räknas inte

seg-1df45f128708 = Låg höjd och verksamhet på marken (terrängskuggning, andra positionsformat)

seg-cc5f23f0da05 = höjdgolv; rader markerade <c1/> utesluts

seg-ddf6aeb47dbe = MLAT eller andra positioner som inte kommer från GNSS

seg-51162a1835d1 = filtret <c1/> när kolumnen finns

seg-08196503a657 = Ett flygplan som skickar många rapporter

seg-bf13dfa85dbe = distinkta flygplan räknas, inte rapporter

seg-bbcb809624bc = Ett avbrott i en konstellation eller förstärkning, eller en rymdväderhändelse, som sänker noggrannheten över ett stort område

seg-5f428bb7ad4a = cellen måste överstiga dagens mediancellandel med en marginal, och en dag vars median i sig är hög markeras som förvirrad och förklarar ingen cell

seg-30290253a95d = Ett fel i ett enskilt flygplans utrustning

seg-b673195405ff = kräver en andel av många distinkta flygplan, med ett minsta urval

seg-aeebeded71be = Få flygplan i cellen

seg-c33c60b49b17 = minsta urval; under { "5" } observerade publiceras inte cellen

seg-dc8abb9b411f = Vad som återstår: metoden kan inte skilja störning från en regional orsak som är lokal snarare än utbredd (en lokal satellitgeometrieffekt eller ett avbrott i markbaserad förstärkning skulle se likadant ut), och den är försiktig i en riktning: ett flygplan som flyger enbart inom ett påverkat område hela dagen har ingen baslinje och räknas inte, så ihållande stora områden underrapporteras.

seg-41d725eeaba9 = AIS-metod (<c1/>)

seg-7fd53079dccf = Per fartyg och dag, fem detektorer. En detektor <b>kvalificerar</b> i en cell när den flaggar minst { "5" } distinkta fartyg som utgör minst { "20" }% av de fartyg som observerats där; cellen är <c1/> om någon detektor kvalificerar.

seg-6d599353e8e1 = Detektor

seg-551f38a9061c = Regel (förhandsregistrerad)

seg-295e8a28a5b9 = minst { "3" } rapporter i cellen mer än { "2000" } m inåt land från den angivna kustlinjen

seg-fd21160e6685 = ett fönster med { "20" } på varandra följande rapporter (stride { "10" }, luckor på högst { "30" } min) vars medelradie från tyngdpunkten är { "500" } m till { "20" } km, variationskoefficient för radien på högst { "0.15" }, en färdriktning med total vridning på minst { "270" } grader (steg på högst { "90" } grader, netto minst { "80" }% av totalen) och medelfart på minst { "2" } kn

seg-1aa30db06794 = minst { "2" } hopp som anländer i cellen: på varandra följande rapporter minst { "1000" } m från varandra, högst { "1" } h emellan, vilket innebär mer än { "70" } kn (den underförstådda farten använder minst { "1" } s mellan rapporterna, så två rapporter med samma tidsstämpel och positioner { "1" } km eller mer från varandra räknas som ett hopp)

seg-7f9b22254009 = minst { "3" } rapporterade farter över { "70" } kn i cellen

seg-e0d0968e8751 = minst { "5" } distinkta fartyg som rapporterar samma position (avrundad till { "1e-4" } grader, cirka { "11" } m) i samma 10-minutersfönster

seg-1bf4c460672c = Celler med färre än { "5" } distinkta fartyg publiceras inte; varje flaggat antal under { "5" }, noll inräknat, rapporteras som <c1/>.

seg-b2ea2ec6bad1 = <b>Version { "2" }.</b> Version { "1" } kvalificerade en detektor från { "3" } flaggade fartyg och publicerade antal på { "3" } och { "4" }. Version { "2" } höjer minimum för flaggade fartyg till { "5" }, publiceringsminimum, så att en <c1/>-bedömning aldrig vilar på färre fartyg än det antal under vilket antal undanhålls. Det skärper metoden och ingen fil av version { "1" } släpptes.

seg-25593339aeb0 = <b>Kända orsaker till falska positiva</b>, som andelsregeln och tröskelvärdena minskar men inte tar bort: fartyg i floder, kanaler och hamnar nära en grov kustlinje (bufferten på { "2" } km inåt land finns för detta); två fartyg som delar en identifierare, vilket ser ut som hopp; transpondrar med dålig positionsbestämning eller testutrustning; och drivande lodsbåtar och sökfartyg, som kan likna cirklar. En kustlinjefil i { "1" }:{ "10" } miljoner är noggrann till cirka en kilometer.

seg-ac661440a29a = Hopp- och fartdetektorerna jämför rapporter inom en indatafil; ett spår som delas över filer eller dagar sys inte ihop.

seg-05f789b26904 = <b>Minne.</b> Indata läses rad för rad och hålls aldrig i sin helhet. ADS-B behåller bara räknare per flygplan och cell. AIS behåller varje godtagen rapport i en kompakt post (cirka { "40" } bytes) tills dess dag har utvärderats, så minnet växer med antalet AIS-rapporter i indata; dela upp en mycket stor AIS-indata per dag.

seg-206c78a69ded = Ruttexponering

seg-0d8832796ab7 = <c1/> är en GeoJSON LineString (ensam, i en Feature eller i en FeatureCollection) eller en CSV med <c2/>-rader. <c3/> tar kartfiler eller kataloger med dem, och får upprepas. Vägpunkter förbinds med raka linjer i latitud och longitud, så förtäta långa sträckor; en sträcka tar den korta vägen runt i longitud, så en som korsar antimeridianen ({ "179.5" } E till { "179.5" } W) korsar den. Rutten delas upp i delar om cirka { "250" } m. Varje del mäts mellan sina egna två ändpunkter på en sfär med radien { "6371.0088" } km (samma väg som avgör vilken cell den ligger i) och tilldelas den cell som rymmer dess mittpunkt.

seg-cc5e2553700b = Per dag och källa anger rapporten ruttlängden och fyra andelar som summerar till { "1" }: <c1/>, <c2/>, <c3/> (cellen finns men saknar bedömning) och <c4/> (cellen saknas på kartan). Läs de två sista tillsammans med den första: en rutt med låg försämrad andel och hög andel inte observerat har inte visats vara fri. ADS-B- och AIS-rader redovisas separat och kombineras aldrig. Varje rad bär kartans licens och källangivelse.

seg-3a087d90e317 = Biblioteksfunktioner

seg-67ea1ff00bb8 = För anropare som håller data i minnet (bindningar, MCP-servern, webbläsarbygget) exponerar modulen <c1/> samma metoder med text eller bytes in och JSON ut, utan att röra någon fil eller något nätverk:

seg-4dbf41c0ec3b = Funktion

seg-95f87a38a522 = In

seg-0fe8ff25f4a1 = Ut

seg-9e99af2c1f84 = ADS-B CSV-text

seg-e144f449c5b4 = en byte-slice per readsb-spårfil (gzip eller vanlig)

seg-7effd7110c4c = AIS CSV-text, valfri GeoJSON-text för land

seg-10c5e0c0a9c8 = ruttext, GeoJSON-texter för kartor, valfria <c1/>-gränser

seg-be00d23d96e9 = <c1/> JSON

seg-20a842d675c2 = En <c1/> har <c2/> (<c3/>), <c4/> och <c5/> (v1-dokumentet). <c6/> är <c7/> eller <c8/>; <c9/> är { "0.5" }. Fel är <c10/>. Reglerna för datamängder (godkända förinställningar, licenstext krävs, typen måste stämma) gäller exakt som på kommandoraden.

seg-1195686de09b = Extern validering

seg-0de37085f544 = <c1/> jämför Kshana med oberoende implementationer på syntetiska indata, med toleranser som förhandsregistrerats i <c2/>: betydelsen av NIC- och NACp-koder mot pyModeS-avkodning av syntetiska ADS-B-ramar, AIS-värden för ”inte tillgängligt” mot pyais-avkodning av syntetiska AIVDM-meningar, tilldelning av rutnätsceller mot shapely, ruttlängd per celltillstånd mot shapely och GeographicLib, och maskning av inlandet mot shapely och pyproj. Testdata görs av <c3/>; CI behöver inget Python. Det här validerar hur koderna och fältvärdena läses och geometrin. Det validerar inte att en flaggad cell är störning.

seg-56a3e955cbcc = Alla tester använder syntetiskt genererade data och inget nätverk: enhetstester i <c1/>, och <c2/> för kommandona från början till slut, inklusive att ingen identifierare når en utdata och att vägranden inte lämnar några filer efter sig.

seg-212c43d1a41c = <s1>Föregående</s1>NMEA-träningsströmmar

seg-7f13ee5d254e = <s1>Nästa</s1>Störningskarta: datakällor och licenser

seg-1fc1794d9388 = ADS-B-metod (kshana-interference-map/adsb/v2)

seg-a3a97ab49ed1 = AIS-metod (kshana-interference-map/ais/v2)
