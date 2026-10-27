# docs--lunanet-afs: translations (sv)

seg-33f4c7af9c53 = Bärvåg

seg-53a7343c076e = Påstående

seg-da9970bcbab7 = Källa: <c1/>

seg-4013a17a3517 = LunaNet Augmented Forward Signal: koder, meddelandeformat och <c1/>

seg-c1a27b995345 = Kshana implementerar spridningskoderna och meddelandelagret i LunaNet <b>Augmented Forward Signal (AFS)</b> så som en utgåva av specifikationen definierar dem, och kontrollerar sig själv mot den utgåvans tryckta tabeller.

seg-e9bd99bbddb5 = <b>Låst version.</b> LunaNet Interoperability Specification (LNIS) <b>version { "5" }</b>, Applicable Document { "1" } Volume A: <em>LunaNet Signal-In-Space Recommended Standard, Augmented Forward Signal</em> (LSIS-AFS) <b>version { "1.0" }, { "29" } januari { "2025" }</b> (NASA). Hämtad 2026-10-18; PDF SHA-256 <c1/> (<a1>proveniens</a1>). En senare utgåva är en annan låst version och kan ändra koderna: dokumentet märker sina kodtabeller { "{" }LSIS-TBC{ "}" } och säger att de är "inkluderade enbart för att underlätta test- och integrationsarbete". Varje rapport namnger denna utgåva.

seg-6845e671bf24 = Rådgivande: analysresultat från ett forsknings- och ingenjörsverktyg, inte typgodkänd navigationsutrustning och inte en livsäkerhetstjänst.

seg-69a98d01f489 = LunaNet AFS-kodgeneratorn kontrollerad mot specifikationens tryckta kolumner, från en verklig körning av motor v{ $version } (`kshana lunanet-afs-check spec`, låst till LNIS V5, AD1 Volume A (LSIS-AFS) V1.0, { "29" } januari { "2025" }; dokumentet märker sina kodtabeller { "{" }LSIS-TBC{ "}" }). { "9" } av { "10" } kontroller är uppfyllda; B4 är NOT MET ({ "420" } av { "421" } stämde). Den kontrollerar en symbolström mot en utgåva av en publicerad specifikation och säger ingenting om någon LunaNet-nod eller -tjänst. Rådgivande: analysresultat från ett forsknings- och ingenjörsverktyg, inte typgodkänd navigationsutrustning och inte en livsäkerhetstjänst. Den kontrollerar en symbolström mot en utgåva av en publicerad specifikation och säger ingenting om någon LunaNet-nod eller -tjänst.

seg-4c3f77d97294 = Vad som är implementerat

seg-a0b684e44fb0 = Lager

seg-5d987fca539c = Vad

seg-df52127d74b6 = Var

seg-637035a0b1c1 = AFS-I (data)

seg-dbee58df4c92 = Gold-kod { "2047" } kortcyklad till { "2046" } chip, G2 fördröjd med ett antal chip per PRN, { "1.023" } Mchip/s, BPSK({ "1" }), { "500" } symbol/s, PRN { "1" } till { "210" }

seg-d4480ead20d1 = <c1/>, signalnamn <c2/>

seg-6d84dce7f6d0 = AFS-Q (pilot)

seg-2ebf619c9cb6 = Weil-kod { "10230" } (konstruktionen från GPS L1C) i nivåer med en sekundärkod på 4 chip (S0 till S3) och en tertiär Weil-kod på 1500 chip ({ "12" } s), { "5.115" } Mchip/s, BPSK({ "5" }), ingen data. <c1/> och signalnamnet <c2/> är mottagarens replika, primär x sekundär ({ "8" } ms): den tertiära överlagringen för ramsynkronisering på { "12" } s är utelämnad ur den, eftersom infångning och spårning inte korrelerar mot en replika på { "12" } s. <c3/> är hela koden på { "12" } s

seg-03805fa6d5b1 = { "2492.028" } MHz (LSIS-020)

seg-906440b861cd = Ram

seg-20bc4439d3d7 = SP { "68" } + SB1 { "52" } + { "5880" } interfolierade symboler = { "6000" } symboler = { "12" } s vid { "500" } symbol/s

seg-a242d95d701f = { "9" } bitar (FID { "2" }, TOI { "7" }), BCH({ "51,8" }), generator { "763" } oktalt, med dokumentets korrelationsavkodare med 256 hypoteser

seg-df8894e1304f = CRC

seg-a04ccd611398 = CRC-24Q, generator ({ "1" }+X)P(X) (bilaga H)

seg-e225f10d7848 = Interfolierare

seg-cb075da6f8cf = { "60" } rader x { "98" } kolumner, skrivs radvis och läses kolumnvis

seg-d544025254af = De två komponenterna accepteras av <c1/>, <c2/>, <c3/> och <c4/> som vilken annan signal som helst, så en inspelning kan genomsökas efter AFS-I eller AFS-Q (<c5/>) och en syntetisk scen kan skapas för test av mjukvarumottagare. En syntetisk scen är, som för alla andra signaler, en fil för en mjukvarumottagare; ingenting här styr radiohårdvara.

seg-6d7a9d17946d = Vad som <b>inte</b> är implementerat

seg-95731dbf3333 = <b>LDPC-kodningen med hastighet 1/2 av delramarna { "2" } till { "4" }.</b> Dess kontrollmatriser finns i bilaga { "1" }, en separat fil som inte finns i PDF-filen och inte är inkluderad. Delramarna { "2" } till { "4" } bärs och kontrolleras som ogenomskinliga symbolblock av den angivna längden, och CRC-24Q-orden i dem verifieras inte. En ström som klarar <c1/> är inte visad innehålla giltiga kodord.

seg-67bb5d1038c7 = <b>Meddelandeinnehåll</b> (MSG-G1, MSG-G2, MSG-G4, ...): dokumentet lämnar flera definitioner att skriva (TBW).

seg-bff5304c6187 = <b>Kodtilldelning per LunaNet-nod</b> (tabell F-1 är TBD). PRN { "1" } till { "12" } har tillfälliga testtilldelningar (tabell { "11" }). <c1/> använder PRN <em>n</em>:s primärkod med sekundärkod S((n-1) mod { "4" }); bortom PRN { "12" } är det den här implementationens mönster, inte dokumentets. <c2/> och <c3/> tar vilken kombination som helst, med den tertiära koden för vilken PRN som helst.

seg-6588307842fe = Länkbudget, fel i signal i rymden, effekt- och koherenskrav (LSIS-100 och följande).

seg-e0f2ddce6dff = <c1/> kör implementationen mot dokumentets tryckta tabeller och räknade exempel (trösklarna B1 till B10 i <a1>förhandsregistreringen</a1>) och skriver ut var och en med sitt antal och sin status. <c2/> avslutas med { "1" } om inte varje tröskel är nådd.

seg-dafa47406a38 = <c1/> läser en symbolström med hårda beslut (text med <c2/> och <c3/>; blanksteg ignoreras) och kontrollerar synkroniseringsmönstret, SB1-avkodning, FID (bara { "0" } är definierat), TOI-kontinuitet (ökar med ett modulo { "100" }) och ramavstånd ({ "6000" } symboler). Den avslutas med { "1" } vid varje problem.

seg-f12425044025 = <c1/> skriver en testsymbolström: dokumentets synkroniseringsmönster, SB1- och ramlängder, med delramar { "2" } till { "4" } som är <b>platshållare</b> (den alternerande fyllnaden i LSIS-300, inte LDPC-kodad, inget meddelande). Det är symboler för att testa en kontrollerare eller en avkodare, inte en vågform; Kshana skriver ingen signal.

seg-3b3548bd0b61 = Python: <c1/>, <c2/>, <c3/>. WebAssembly: samma namn. MCP: <c4/> (<c5/> spec, symbols eller generate). Plugin: <c6/>. Studio och JetBrains: N/A (<a1>SURFACES.md</a1>).

seg-2133870991ca = Trösklar angivna i <c1/> innan generatorn fanns; test i <c2/>.

seg-b74d5800a039 = Tröskel

seg-e75915599d5e = AFS-I första och sista { "24" } chipen, { "210" } PRN

seg-f654db18922f = <b>MET</b>, { "420" } av { "420" }

seg-55d0d7168ceb = det tryckta initialtillståndet för G2 är tillståndet efter den tryckta fördröjningen

seg-41590da4d1ac = <b>NOT MET</b>, { "0" } av { "210" }: påståendet hade fel riktning. Post hoc (B1c, inte förhandsregistrerad): det tryckta tillståndet är tillståndet efter { "2047" } minus fördröjningen, { "210" } av { "210" }

seg-b94947c99f9a = Legendre({ "10223" }) är lika med tabell D-1

seg-75c8da01c0f1 = MET

seg-e3402e2420bd = AFS-Q primär första och sista { "24" } chipen, { "210" } PRN

seg-678604d6e463 = Legendre({ "1499" }) är lika med tabell E-1 samt tertiär första och sista { "24" } chipen, { "210" } PRN

seg-17b1420f8c0c = <b>NOT MET</b>, { "420" } av { "421" }: Legendre-sekvensen stämmer och { "419" } av { "420" } kodkolumner stämmer. De sista { "24" } chipen som är tryckta för PRN { "147" } (<c1/>) är samma värde som är tryckt för PRN { "151" }, vars kod generatorn återger; två olika Weil-index ({ "607" } och { "612" }) ger inte samma sista { "24" } chip, så posten för PRN { "147" } är med största sannolikhet ett tryckfel i dokumentet. Det kan inte avgöras utan den separata kodfilen i bilaga { "3" }. Fastlåst av ett test

seg-aea9620e7bf1 = sekundärkoderna S0 till S3 är lika med tabell { "10" }

seg-2996e986d247 = <b>MET</b> (dokumentets egna konstanter)

seg-23c9277f62e6 = SB1-räknat exempel i figur { "8" }

seg-fb70493dcdcf = <b>MET</b>: 0x045 kodas till 0x229F61DBB84A0 och avkodas till FID { "0" }, TOI { "69" } (ett exempel)

seg-acce07c33dec = Kontrollvärde för CRC-24Q för <c1/>

seg-71c490aca8d7 = <b>MET</b>: 0xCDE703 (katalogvärdet, utanför specifikationen)

seg-789b31d53873 = ramaritmetik

seg-5b5da00ad1c8 = interfoliera och sedan avinterfoliera

seg-80f9cd313ec4 = <b>MET</b> (en egenskap, MODELLED)

seg-92a7addfdb8c = synkroniseringsmönster

seg-215913f74706 = <b>MET</b> ({ "68" } symboler; en transkriptionskontroll)

seg-3b51bd143c19 = B1 till B4 är VALIDATED mot de tryckta tabellerna i den citerade utgåvan, som dokumentet märker { "{" }LSIS-TBC{ "}" }. En tur-och-retur-körning från scen till infångning till spårning av båda komponenterna klarar samma trösklar som de andra signalerna (<c1/>).

seg-9edb6e5771ca = <s1>Föregående</s1>Verifiering av Galileo OSNMA

seg-d0043d0f578a = <s1>Nästa</s1>Jammertest som domare

seg-52946c9ff62a = Vad som inte är implementerat

seg-339c9eeb510b = kshana lunanet-afs-check
