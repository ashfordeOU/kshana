# docs--lunar-reference-station: translations (sv)

seg-f37311ad7ef0 = Utdata

seg-f63dd3d7aad4 = Källa

seg-9872e31ebd72 = Källor

seg-38afa54b0306 = Källa: <c1/>

seg-e8ee3794bac6 = <b>MODELLED.</b> Under de angivna antagandena (konstellationen, dess signal-i-rymden-fel, stationens inmätningsnoggrannhet, korrektionsfördröjningen och länkkvantiseringen, där varje indata är märkt med sin offentliga källa eller som ILLUSTRATIVE) ger modellen siffrorna nedan. De är <b>inte</b> ett påstående om hur något verkligt system presterar. Kshana är <b>inte</b> knutet till eller godkänt av någon myndighet och gör inga påståenden om TRL eller flygarv. Endast rådgivande.

seg-22eb5bd00092 = Syfte

seg-25678ae41147 = Offentligt material beskriver en referensstation vid månens sydpol som övervakar en navigationstjänst på månen, beräknar lokala differentialkorrektioner, håller en månreferenstid på en atomklocka och bär en laserretroreflektor och en VLBI-sändare för månens referenssystem (den klass som offentligt beskrivs för ESA:s NovaMoon-koncept; källor nedan). Kshana modellerar redan varje del för sig. Den här studien sätter ihop dem till en enda reproducerbar, öppen analys av vad en sådan station skulle kunna göra under offentliga antaganden, och förhandsregistrerar den så att den kan jämföras med publicerade resultat och till slut med flygresultat.

seg-6ac04119fc30 = eller <c1/> från Python, WebAssembly eller MCP-serverns <c2/> med <c3/>.

seg-671e68d341fd = Täckning och noggrannhetskarta (<c1/>)

seg-f034e2642dab = För en differentiell referensstation på en känd plats nära sydpolen: vid varje användarpunkt på ett ringrutnät från { "80" }° S till polen och över regionen, över ett dygn av epoker och Monte Carlo-försök, percentilerna för korrigerat och okorrigerat positionsfel (3D, horisontellt, vertikalt), tillgänglighet med en orsak för varje otillgänglig epok, täckning mot en tröskel som anges före körningen, skyddsnivåer enligt DO-229E, täckningsradien per azimutsektor och korrektionslänkens budget vid stationen och vid den sämsta punkten. Ingen ny fysik: den svepar över de testade funktionerna i <c1/> och reduceras exakt till den typen vid en punkt, en epok och ett försök.

seg-94058315dfe4 = Indata

seg-7670cf4ceda3 = Standardvärde

seg-98b42925ad5c = Konstellation (<c1/>, <c2/>, <c3/>, <c4/>, <c5/>) eller <c6/>

seg-bfdd053b2611 = den interna uppsättningen av LCNS-klass

seg-389db26524b4 = ILLUSTRATIVE i det medföljande standardvärdet; exemplet med offentliga källor anger fyra satelliter och omloppstiden { "24" } h från S2 och S4, medan elementuppsättningen förblir ILLUSTRATIVE (ingen källa anger den)

seg-91231bdcc599 = ILLUSTRATIVE

seg-6b9d48431e4b = Station (<c1/>, <c2/>, <c3/>)

seg-fcdb2f3ac330 = { "89" }° S, { "0" }°, { "0" } m

seg-f32dcb376b51 = { "0.30" } m

seg-93d78578585f = ILLUSTRATIVE (den interna tilldelningen för realisering av referenssystemet, själv MODELLED)

seg-59286c0377ce = <c1/>, <c2/> eller <c3/> med <c4/>

seg-fe90a6f490f9 = { "100" } m, { "30" } m (SISE längs siktlinjen { "65" } m)

seg-9a432ef35cac = ILLUSTRATIVE i det medföljande standardvärdet; exemplet med offentliga källor sätter <c1/> = { "10" } / { "1.96" } m från S4 s. 8

seg-970357ba3630 = { "0" } m, { "10" } s, { "8" } bitar

seg-311a924e2133 = Rutnät (<c1/>, <c2/>) eller <c3/>

seg-49a2022b83c0 = { "80" }° S, { "1" }° ({ "346" } punkter)

seg-e945f5407b12 = studieregionen

seg-fed48a6c31be = Tid (<c1/>, <c2/>, <c3/>), <c4/>

seg-0fec404c8c7c = { "0" } s, en dag, { "600" } s, { "200" }

seg-d35d88b0753b = { "20" } m vid p95 i det medföljande standardvärdet ({ "1" } m i exemplet med offentliga källor)

seg-fa7858b14f89 = anges före körningen; { "20" } m är ILLUSTRATIVE, dimensionerat efter standardvärdets illustrativa fel

seg-a6ee5e2a8b61 = { "10" } m

seg-329ad585cd9b = ILLUSTRATIVE: inget offentligt värde finns

seg-422a316b806b = { "5" } m, { "1e-4" }, { "42" }

seg-c530b459b0ef = Varje numeriskt fält har en enhet och en proveniensklass i resultatets <c1/>-block (kontrolleras av <c2/>). Regionblocket: <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>; <c14/> per azimutsektor på { "30" }°; <c15/> per punkt; samt <c16/>.

seg-4aa380258574 = Vad kontrollerna kan och inte kan visa

seg-112cb6bffc03 = <c1/>: reduktionen till <c2/>, nollbaslinje- och inmätningsgolven, monotonicitet, orsaker till otillgänglighet, determinism och arbetsspärren. De visar att svepet är den modell det påstår sig svepa över.

seg-695ed4f23f3c = <c1/>: en oberoende omräkning av aritmetiken i numpy på exporterade fall, förhandsregistrerad innan den kördes. Positioner och percentiler nådde sina trösklar; stationskorrektionerna missade sina på grund av avrundning i dubbel precision (registrerat, med siffror, i <c2/>).

seg-be6ecf79d22c = Ingen av dem kontrollerar modellen. Felmodellen, den första ordningens dekorrelation, modellerna för inmätning, åldrande och kvantisering och varje tröskel är projektets egna eller ILLUSTRATIVE.

seg-d6f194e28401 = Terrängens horisontmasker

seg-9ad9b163a3a0 = MODELLED. Ett valfritt avsnitt <c1/> (<c2/>) ger stationen och varje användarpunkt sin egen azimutberoende horisont, i tabellformatet för siluett från { "0.36" } (rader <c3/>, linjärt i azimut med omslag vid { "360" }°). En satellit räknas på en plats när den ligger över både <c4/> och horisonten vid sin azimut; en epok som horisonten lämnar med färre än fyra satelliter vid en punkt, där den platta masken ger fyra, redovisas som <c5/> (<c6/> behåller sin platta betydelse). Två källor, som kombineras som sitt punktvisa maximum när båda anges:

seg-4d55808bc002 = en angiven profil, <c1/> eller <c2/> (tillämpas vid varje användarpunkt), var och en med en obligatorisk etikett <c3/>;

seg-d6fda9939caa = en horisont som strålas fram över en polär DEM (<c1/>): storcirklar på månens sfär med exakt krökning, från en angiven masthöjd (standard { "2" } m), för varje <c2/> (standard { "1" }°), ut till <c3/> (standard { "150" } km) eller rutnätets kant. Förrådet innehåller ett utsnitt av den offentliga LRO LOLA-polarprodukten <c4/> (public domain), omsamplad med blockmedelvärde { "5" } × { "5" } till { "1200" } m och ungefär ±{ "420" } km från polen (<c5/>: käll-URL, SHA-256, licens, utsnitt och omsamplingssteg);

seg-292c49f3739a = eller, i stället för <c1/>, en DEM-ruta i latitud/longitud (<c2/>) i textformatet <c3/> (ett huvud <c4/>, sedan höjderna i meter över medelsfären, radvis), framstrålad på samma sätt, där latitudavståndet sätter standardsteget. Rapporten återger rutans sökväg, SHA-256 och utbredning (<c5/>). En ruta som omsamplats från det medföljande utsnittet ger stationen utsnittets egen horisont inom { "0.22" }° (<c6/>). Ingen ruta medföljer.

seg-34ed85bb9ac0 = Samma masker gäller för rutnätet <c1/> (<c2/>, <c3/> och <c4/>; en rutnätspunkt utanför DEM behåller den platta masken och räknas). Utan avsnittet är varje dokument identiskt byte för byte med en körning utan det.

seg-8d07f0227ab8 = Kontroller: strålföljningen återger slutna horisonter (den nakna sfärens horisontsänkning, en krater i en platå från dess mitt och utanför den, en rastrerad kon mot den analytiska konen); det medföljande utsnittet är orienterat som källan (golven i Shackleton och Haworth lågt, massivet Malapert högt); en oberoende strålföljning i numpy på utsnittet, förhandsregistrerad (<c1/>), stämmer till { "5.5e-10" } grader på fem platser, vilket kontrollerar aritmetiken, inte terrängen. Ingen publicerad siffra för polär horisont eller belysning har återskapats, så raden förblir MODELLED (registerrad "Lunar terrain horizon masks from a stated profile or a polar DEM").

seg-10a1d62ab5cc = <c1/> kör de medföljande indata på ett rutnät på { "2" }° med { "100" } försök och DEM-horisonten vid varje plats. Stationsplatsen ({ "89" }° S, { "0" }° E) har en högsta horisont på ungefär { "4.0" }°, under masken på { "5" }°, så vid stationen binder terrängen inte; vid användarpunkterna är det areaviktade medelvärdet av varje punkts högsta horisont { "9.7" }° och den största { "26.3" }°. Mot samma indata med den platta masken stiger regionens korrigerade p95 för 3D-fel från { "16.3" } m till { "18.6" } m och den största HPL från { "480" } m till { "62" } km. Regionens tillgänglighet stiger från { "91.9" } % till { "93.0" } %: en epok är otillgänglig när en punkt använder en satellit som stationen inte ser, och en horisont som döljer den satelliten för punkten kan göra epoken tillgänglig.

seg-6d18d8a8dc78 = <b>Terräng och horisontmaskning: hanterat i { "0.36" }, med begränsningar.</b> Horisontmasker per plats från en angiven profil eller det medföljande LOLA DEM-utsnittet är modellerade (ovan). Det som återstår: det medföljande utsnittet har { "1200" } m per pixel, så relief under ungefär en kilometer utjämnas bort och blockmedelvärden sänker skarpa toppar; en stråle som lämnar utsnittet (ungefär { "420" } km från polen) slutar där; det finns ingen diffraktion, terrängflervägsutbredning eller delvis skymning; platspositioner för avståndsmätning ligger kvar på medelsfären vid angivna höjder (DEM sätter bara horisonten); horisonten är inte validerad mot någon extern siffra. Exportplatsen per satellit i <c1/> maskas som en rutnätspunkt: med ett avsnitt <c2/> bär varje exportrad <c3/> och rapporten platsens horisont (<c4/>); antennens räkning av länkar i lobbredd räknar fortfarande varje länk som passerar den platta masken.

seg-b58b3ff1ef20 = <b>Flervägsutbredning och mottagarhårdvara: hanterat i { "0.36" } som ett tillval, med begränsningar.</b> Ett avsnitt <c1/> (<c2/>) lägger till elevationsberoende flervägsutbredning <c3/> hos användaren och stationen (den funktionella formen från DO-229; på månen är varje värde ILLUSTRATIVE), med stationens flervägsutbredning valfritt som första ordningens Gauss-Markov över epoker, early-minus-late DLL-kodbrus från C/N0 och biaser mellan kanaler per kanal. Det som återstår: antennens fascentrum- och grupplöptidsvariation är inte modellerade; ingen mätning på månen fastställer flervägsvärdena; korrektionslänkens budgetblock innehåller inte mottagartermerna.

seg-677252c2d3e5 = Tillväxt av efemeridfel över fördröjningen: hanterad i { "0.36" } som ett tillval, med begränsningar.

seg-3af08edab1cc = <c1/> lägger till en linjär tillväxt av det utsända banfelet med åldern (avstånd 1-sigma <c2/>), ovanpå omprojiceringen av det fastfrusna felet; linjär tillväxt är första ordningens term av ett propagerat tillståndsfel (kontrollerad till { "1" } % vid { "600" } s mot den interna tvåkroppspropageringen). Det som återstår: ingen offentlig källa anger en tillväxttakt på månen (ILLUSTRATIVE); ingen struktur längs banan eller radiellt; korrektionslänkens budgetblock använder den fastfrusna modellen. Tilläggsstudien K5 (<c3/>, förhandsregistrerad för sig) kör K5 vid { "0.001" }, { "0.01" } och { "0.1" } m/s: den misslyckas i varje fall ({ "369.8" } m, { "2315" } m, { "22797" } m mot en tröskel på { "1.5" } m), som angavs före körningen.

seg-5bba9be34cad = <b>Lösningsstil (filter, höjdbegränsning, tre satelliter): ett tillval i { "0.36" }, med begränsningar.</b> Ett avsnitt <c1/> (<c2/>) lägger till en höjdpseudomätning, ett minimum på tre satelliter med den och ett viktat minsta kvadrat-fönster för statisk användare över epoker (en gemensam position, en klocka per epok), som ersätter ett filter. Det som återstår: det behandlar epokernas fel som oberoende, så det medelvärdesbildas ned snabbare än fel som är korrelerade i tiden skulle göra; det gäller bara statisk användare; det finns inget dynamiskt filter, ingen bärvågsfas och ingen lösning av heltalsosäkerhet; fallspåret (<c3/>) visar ögonblicksbildens aritmetik. Tilläggsstudien om publicerade påståenden med det här läget är <c4/> (förhandsregistrerad för sig). Med en höjdbegränsning på { "1" } m, tre satelliter och ett fönster på 6 epoker (ILLUSTRATIVE inställningar) sjunker R300:s korrigerade p95 för 3D-fel från { "280.6" } m till { "2.11" } m (horisontellt { "0.90" } m, inte poängsatt); K1 till K5 misslyckas fortfarande och K6 klarar, { "1" } av { "6" } som i den registrerade körningen. Fönstrets antagande om oberoende gynnar det.

seg-4f8274f839a7 = Jämförelse mot publicerade påståenden

seg-82391b00e1bc = MODELLED. En jämförelse av den här modellen, körd under de offentliga antagandena, med de påståenden som källorna gör. Den är inte ett påstående om hur något verkligt system presterar.

seg-fc27b4012f02 = Källorna S1 till S5 (titel, URL, hämtdatum, SHA-256, licens): <c1/>.

seg-d866653008e1 = Varje numeriskt påstående, citerat med sin sida och sina angivna antaganden och klassat som jämförbart, delvis jämförbart eller inte jämförbart: <c1/>. Inget påstående är helt jämförbart, eftersom ingen källa anger en percentil eller satelliternas banelement.

seg-50535c58d3cf = Trösklar, fall och indata, incheckade för sig före körningen (revision { "2" }, 05bf9a19), och den registrerade körningen: <c1/>. Resultatet är fastlåst i <c2/>.

seg-069a652c402e = tröskel

seg-d6120708c062 = påstående (källor)

seg-5b480535b54b = den här modellen

seg-6231a005ccc9 = utfall

seg-45dc6ff5d546 = en station ger noggrannhet under en meter över hela cirkeln med radien { "300" } km kring sydpolen (S1, S2, S3)

seg-4da98cf6180b = täckning { "0.00" }

seg-70a79ec95bf4 = ej klarat

seg-cd0e9021aaa3 = samma, cirkel med radien { "600" } km (S2 s. 10, S3 s. 23)

seg-ef9f2ee31c52 = under en meter med kodkorrektioner (S1, S2)

seg-9f4e2b6991e8 = korrigerad p95 för 3D { "280.6" } m

seg-ac3c99ec0d15 = <= { "1.5" } m

seg-1b720f1677cc = "decimeternivå" från pseudoavståndskorrektioner (S3 s. 22, S5 s. 5)

seg-ffa1c831a14f = { "280.6" } m

seg-70368d910820 = <= { "0.15" } m

seg-786f940b345e = ej klarat (kunde inte klaras vid källornas kodbrus på { "0.30" } m)

seg-da761dde1cae = under en meter bibehållet vid { "600" } s fördröjning (S2 s. 16)

seg-2a9db96bd87f = { "293.0" } m

seg-021336eb5623 = samma noggrannhet från { "10" } km till { "500" } km baslinje (S2 s. 17)

seg-62190343777c = kvot { "1.39" }

seg-7a33a168b020 = klarat

seg-e666f1eb7a59 = { "1" } av { "6" } trösklar klaras. Orsaken är geometrin. Ingen källa publicerar konstellationens banelement. Med de ILLUSTRATIVE interna elementen delar en användare och stationen fyra satelliter över { "5" } grader i endast { "8" } % ({ "300" } km) och { "6" } % ({ "600" } km) av epokerna, vid nästan singulär geometri: det okorrigerade p95 är { "3.8" } km, där källorna anger < { "10" } m. Källornas egna simuleringar använde ett filter, en höjdbegränsning och tre satelliter i gemensam sikt, vilket den här ögonblicksbildsmodellen inte har. Körningen återger därför inte påståendena på de elementen, och den är inte belägg för att påståendena är fel. Utfallet för K6 är en kvot mellan två geometridominerade siffror och säger ingenting om dekorrelation. En publicerad uppsättning av konstellationens element skulle poängsättas under samma trösklar som en andra, daterad körning.

seg-1da5fcf7bbf5 = Förhandsregistrerad prediktion

seg-4ea806a57380 = En förhandsregistrerad prediktion, fastfrusen vid commit <c1/> på indata från offentliga källor, med sitt poängprotokoll: <a1><c2/></a1>. Den är en prediktion, inte en validering, och varje siffra i den domineras av den opublicerade elementuppsättningen för konstellationen med fyra satelliter (de använda elementen är ILLUSTRATIVE): över regionen söder om { "80" } grader S, tillgänglighet { "8.2" } %, korrigerad p95 för 3D { "280" } m, okorrigerad { "3.8" } km. MODELLED; <c3/> misslyckas om någon fastfrusen byte rubbas.

seg-e6aef34d5023 = Stationens tidslaboratorium

seg-4ef12bffa7c4 = Om stationens miniRAFS, styrd till LTC och sedan fritt löpande eller omstyrd, håller sig inom { "1" }, { "10" } och { "100" } ns: det valfria blocket <c1/> i <c2/> (<c3/>). miniRAFS når { "1" } ns efter { "2.8" } s, { "10" } ns efter { "377" } s och { "100" } ns efter { "10.5" } h; källans mål på nanosekundnivå anförs, inte antas. MODELLED. Modell, utdata, tabellen över tid till tröskel för fyra klockklasser och jämförelsen med källorna: <a1><c4/></a1>.

seg-69ddf7ea8fcb = Stationens geodesi

seg-717a5c91387b = Hur mycket en retroreflektor och en VLBI-bärsändare på stationsplatsen skärper datumet för månens referenssystem utöver de fem arkiverade retroreflektorgrupperna: de valfria indata <c1/> och <c2/> för <c3/> (<c4/> och <c5/>). Cramér-Rao-gränser för en reducerad parameteruppsättning på en ILLUSTRATIVE tidtabell och plats: translationsnormens 1-sigma sjunker från { "0.0185" } m till { "0.0102" } m (kvot { "0.551" }), skalan från { "0.00178" } till { "0.00063" } ppm. MODELLED. Metod, förbehåll (en plats nära sydpolen ser jorden lågt eller inte alls) och hela Helmert-tabellen: <a1><c6/></a1>.

seg-8a873848459b = Varje källa med titel, identifierare och utgivare, med hämtdatum och licens. URL:er, SHA-256-hashvärden och anteckningar om var källorna avviker finns i registret, <a1><c1/></a1>. Ingen källfil sprids vidare. Personnamn har avsiktligt utelämnats.

seg-b1f1e1efa042 = id

seg-02071a726f21 = titel

seg-0634af374469 = identifierare

seg-fd875b5fb817 = utgivare

seg-a6f8ef268fcc = hämtad

seg-d04709ddc97d = licens

seg-1d4174e911c1 = vitbok om en månreferensstation för positionering, tidhållning och vetenskap, version { "3" }

seg-e09e1cc11921 = arXiv (författarnas vitbok)

seg-c91720d34bd3 = arXiv icke-exklusiv licens för distribution { "1.0" } (ger endast arXiv rättigheter)

seg-df12c861db1e = "Lunar local Differential PNT and Selenodetic Reference Station" ({ "27" } bilder)

seg-03f689a0ba49 = ioag.org/meetings/cislunar, avsnitt { "6" }, punkt { "07" }

seg-406990fe43a8 = ICG-IOAG Workshop on Cislunar PNT, februari { "2025" }; bilder från Europeiska rymdorganisationen

seg-58579c3faf2f = ingen angiven; markerad som offentligt frisläppt från bild { "3" }

seg-57df0ef791e6 = "Moonlight: LCNS, and Lunar Pathfinder" ({ "28" } bilder)

seg-7e18a15e0d16 = unoosa.org, <c1/>

seg-23aee49b1347 = UNOOSA, ICG Joint Working Group Session on Lunar PNT, juni { "2024" }; bilder från Europeiska rymdorganisationen

seg-f4e53e44f0b5 = ingen angiven; markerad som offentligt frisläppt

seg-b22a694c481d = "Moonlight Programme Development Status" ({ "16" } bilder)

seg-3fd0ab93507d = 2nd ICG-IOAG Cislunar PNT Workshop, februari { "2026" }; bilder från Europeiska rymdorganisationen och Telespazio

seg-472771298df7 = "Lunar Reference Time: ESA's Views" ({ "9" } bilder)

seg-6229db9cb23d = Workshop on Cislunar PNT, februari { "2026" }; bilder från Europeiska rymdorganisationen

seg-6b626a2abd0f = LunaNet Signal-In-Space Recommended Standard, Augmented Forward Signal (LSIS) V1.0, och den interna <c1/>

seg-4e07c500e353 = som registrerats med <c1/>

seg-28f8d886c4e5 = finns redan i trädet

seg-2006c194fef6 = som registrerats där

seg-68db6a17b4e7 = <s1>Föregående</s1>Solsystemet och andra himlakroppar

seg-79d53edd2374 = <s1>Nästa</s1>Navigering för rymdanvändare (gnss-ssv)

seg-9c59637f0666 = Täckning och noggrannhetskarta (lunar-station-coverage)
