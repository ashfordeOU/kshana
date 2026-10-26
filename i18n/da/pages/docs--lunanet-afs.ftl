# docs--lunanet-afs: translations (da)

seg-33f4c7af9c53 = Bærebølge

seg-da9970bcbab7 = Kilde: <c1/>

seg-4013a17a3517 = LunaNet Augmented Forward Signal: koder, meddelelsesformat og <c1/>

seg-c1a27b995345 = Kshana implementerer spredningskoderne og meddelelseslaget i LunaNet <b>Augmented Forward Signal (AFS)</b> som én udgave af specifikationen definerer dem, og kontrollerer sig selv mod den udgaves trykte tabeller.

seg-e9bd99bbddb5 = <b>Fastlåst udgave.</b> LunaNet Interoperability Specification (LNIS) <b>Version { "5" }</b>, Applicable Document { "1" } Volume A: <em>LunaNet Signal-In-Space Recommended Standard, Augmented Forward Signal</em> (LSIS-AFS) <b>Version { "1.0" }, { "29" } January { "2025" }</b> (NASA). Hentet 2026-10-18; PDF SHA-256 <c1/> (<a1>proveniens</a1>). En senere udgave er en anden fastlåst udgave og kan ændre koderne: dokumentet markerer sine kodetabeller { "{" }LSIS-TBC{ "}" } og siger, at de er "included to facilitate test and integration efforts only". Hver rapport angiver denne udgave.

seg-6845e671bf24 = Vejledende: analyseoutput fra et forsknings- og ingeniørværktøj, ikke typegodkendt navigationsudstyr og ikke en livsvigtig sikkerhedstjeneste (safety-of-life).

seg-69a98d01f489 = LunaNet AFS-kodegeneratoren kontrolleret mod specifikationens trykte kolonner, fra en rigtig kørsel af motor v{ $version } (`kshana lunanet-afs-check spec`, fastlåst til LNIS V5, AD1 Volume A (LSIS-AFS) V1.0, { "29" } January { "2025" }; dokumentet markerer sine kodetabeller { "{" }LSIS-TBC{ "}" }). { "9" } af { "10" } kontroller er nået; B4 er NOT MET ({ "420" } af { "421" } stemte). Den kontrollerer en symbolstrøm mod én udgave af en offentliggjort specifikation og siger intet om nogen LunaNet-node eller -tjeneste. Vejledende: analyseoutput fra et forsknings- og ingeniørværktøj, ikke typegodkendt navigationsudstyr og ikke en livsvigtig sikkerhedstjeneste (safety-of-life). Den kontrollerer en symbolstrøm mod én udgave af en offentliggjort specifikation og siger intet om nogen LunaNet-node eller -tjeneste.

seg-4c3f77d97294 = Hvad der er implementeret

seg-a0b684e44fb0 = Lag

seg-5d987fca539c = Hvad

seg-df52127d74b6 = Hvor

seg-637035a0b1c1 = AFS-I (data)

seg-dbee58df4c92 = Gold-kode { "2047" } kortcyklet til { "2046" } chips, G2 forsinket med et antal chips pr. PRN, { "1.023" } Mchip/s, BPSK({ "1" }), { "500" } symbol/s, PRN { "1" } til { "210" }

seg-d4480ead20d1 = <c1/>, signalnavn <c2/>

seg-6d84dce7f6d0 = AFS-Q (pilot)

seg-2ebf619c9cb6 = Weil-kode { "10230" } (GPS L1C-konstruktionen) i lag med en sekundærkode på 4 chips (S0 til S3) og en tertiær Weil-kode på 1500 chips ({ "12" } s), { "5.115" } Mchip/s, BPSK({ "5" }), ingen data. <c1/> og signalnavnet <c2/> er modtagerens replika, primær x sekundær ({ "8" } ms): den tertiære rammesynkroniseringsoverlejring på { "12" } s er udeladt, fordi erhvervelse og sporing ikke korrelerer mod en replika på { "12" } s. <c3/> er den fulde kode på { "12" } s

seg-03805fa6d5b1 = { "2492.028" } MHz (LSIS-020)

seg-906440b861cd = Ramme

seg-20bc4439d3d7 = SP { "68" } + SB1 { "52" } + { "5880" } interleavede symboler = { "6000" } symboler = { "12" } s ved { "500" } symbol/s

seg-a242d95d701f = { "9" } bit (FID { "2" }, TOI { "7" }), BCH({ "51,8" }), generator { "763" } oktal, med dokumentets korrelationsdekoder med 256 hypoteser

seg-df8894e1304f = CRC

seg-a04ccd611398 = CRC-24Q, generator ({ "1" }+X)P(X) (bilag H)

seg-e225f10d7848 = Interleaver

seg-cb075da6f8cf = { "60" } rækker x { "98" } kolonner, skrevet række for række og læst kolonne for kolonne

seg-d544025254af = De to komponenter accepteres af <c1/>, <c2/>, <c3/> og <c4/> som ethvert andet signal, så en optagelse kan gennemsøges efter AFS-I eller AFS-Q (<c5/>), og en syntetisk scene kan laves til test af softwaremodtagere. En syntetisk scene er, som for ethvert andet signal, en fil til en softwaremodtager; intet her styrer radiohardware.

seg-6d7a9d17946d = Hvad der <b>ikke</b> er implementeret

seg-95731dbf3333 = <b>Rate-1/2 LDPC-kodningen af underrammerne { "2" } til { "4" }.</b> Dens kontrolmatricer står i bilag { "1" }, en separat fil, som ikke er i PDF-filen og ikke er medleveret. Underrammerne { "2" } til { "4" } bæres og kontrolleres som uigennemsigtige symbolblokke af den angivne længde, og CRC-24Q-ordene i dem verificeres ikke. En strøm, der består <c1/>, er ikke vist at indeholde gyldige kodeord.

seg-67bb5d1038c7 = <b>Meddelelsesindhold</b> (MSG-G1, MSG-G2, MSG-G4, ...): dokumentet overlader flere definitioner til senere udfyldning (TBW).

seg-bff5304c6187 = <b>Kodetildeling pr. LunaNet-node</b> (tabel F-1 er TBD). PRN { "1" } til { "12" } har foreløbige testtildelinger (tabel { "11" }). <c1/> bruger PRN <em>n</em>s primærkode med sekundær S((n-1) mod { "4" }); ud over PRN { "12" } er det denne implementerings mønster, ikke dokumentets. <c2/> og <c3/> tager enhver kombination, med tertiærkoden fra en vilkårlig PRN.

seg-6588307842fe = Linkbudget, fejl i signalet i rummet, krav til effekt og kohærens (LSIS-100 og følgende).

seg-e0f2ddce6dff = <c1/> kører implementeringen mod dokumentets trykte tabeller og gennemregnede eksempler (tærsklerne B1 til B10 i <a1>præregistreringen</a1>) og udskriver hver med sit antal og sin status. <c2/> afslutter med { "1" }, medmindre alle tærskler er nået.

seg-dafa47406a38 = <c1/> læser en symbolstrøm med hårde beslutninger (tekst med <c2/> og <c3/>; blanktegn ignoreres) og kontrollerer synkroniseringsmønsteret, dekodning af SB1, FID (kun { "0" } er defineret), TOI-kontinuitet (stiger med én modulo { "100" }) og rammeafstand ({ "6000" } symboler). Den afslutter med { "1" } ved ethvert problem.

seg-f12425044025 = <c1/> skriver en teststrøm: dokumentets synkroniseringsmønster, SB1- og rammelængder, med <b>pladsholder</b>-underrammer { "2" } til { "4" } (den alternerende fyld fra LSIS-300, ikke LDPC-kodet, ingen meddelelse). Det er symboler til test af en kontrol eller en dekoder, ikke en bølgeform; Kshana skriver intet signal.

seg-3b3548bd0b61 = Python: <c1/>, <c2/>, <c3/>. WebAssembly: de samme navne. MCP: <c4/> (<c5/> spec, symbols eller generate). Plugin: <c6/>. Studio og JetBrains: N/A (<a1>SURFACES.md</a1>).

seg-2133870991ca = Tærskler angivet i <c1/>, før generatoren fandtes; tests i <c2/>.

seg-b74d5800a039 = Tærskel

seg-e75915599d5e = AFS-I første og sidste { "24" } chips, { "210" } PRN

seg-f654db18922f = <b>MET</b>, { "420" } af { "420" }

seg-55d0d7168ceb = den trykte begyndelsestilstand for G2 er tilstanden efter den trykte forsinkelse

seg-41590da4d1ac = <b>NOT MET</b>, { "0" } af { "210" }: påstanden havde retningen forkert. Post hoc (B1c, ikke præregistreret): den trykte tilstand er tilstanden efter { "2047" } minus forsinkelsen, { "210" } af { "210" }

seg-b94947c99f9a = Legendre({ "10223" }) er lig med tabel D-1

seg-75c8da01c0f1 = MET

seg-e3402e2420bd = AFS-Q primær første og sidste { "24" } chips, { "210" } PRN

seg-678604d6e463 = Legendre({ "1499" }) er lig med tabel E-1 og tertiær første og sidste { "24" } chips, { "210" } PRN

seg-17b1420f8c0c = <b>NOT MET</b>, { "420" } af { "421" }: Legendre-sekvensen stemmer, og { "419" } af { "420" } kodekolonner stemmer. De sidste { "24" } chips, der er trykt for PRN { "147" } (<c1/>), er den samme værdi som den, der er trykt for PRN { "151" }, hvis kode generatoren gengiver; to forskellige Weil-indeks ({ "607" } og { "612" }) giver ikke de samme sidste { "24" } chips, så posten for PRN { "147" } er højst sandsynligt en trykfejl i dokumentet. Det kan ikke afgøres uden den separate kodefil i bilag { "3" }. Fastholdt af en test

seg-aea9620e7bf1 = sekundærkoderne S0 til S3 er lig med tabel { "10" }

seg-2996e986d247 = <b>MET</b> (dokumentets egne konstanter)

seg-23c9277f62e6 = SB1-eksemplet i figur { "8" }

seg-fb70493dcdcf = <b>MET</b>: 0x045 koder til 0x229F61DBB84A0 og dekoder til FID { "0" }, TOI { "69" } (ét eksempel)

seg-acce07c33dec = CRC-24Q-kontrolværdi for <c1/>

seg-71c490aca8d7 = <b>MET</b>: 0xCDE703 (katalogværdien, uden for specifikationen)

seg-789b31d53873 = rammeregning

seg-5b5da00ad1c8 = interleave og derefter de-interleave

seg-80f9cd313ec4 = <b>MET</b> (en egenskab, MODELLED)

seg-92a7addfdb8c = synkroniseringsmønster

seg-215913f74706 = <b>MET</b> ({ "68" } symboler; en transskriptionskontrol)

seg-3b51bd143c19 = B1 til B4 er VALIDATED mod de trykte tabeller i den citerede udgave, som dokumentet markerer { "{" }LSIS-TBC{ "}" }. Et gennemløb fra scene til erhvervelse til sporing af begge komponenter klarer de samme tærskler som de andre signaler (<c1/>).

seg-9edb6e5771ca = <s1>Forrige</s1>Galileo OSNMA-verifikation

seg-d0043d0f578a = <s1>Næste</s1>Jammertest som dommer

seg-52946c9ff62a = Hvad der ikke er implementeret

seg-339c9eeb510b = kshana lunanet-afs-check
