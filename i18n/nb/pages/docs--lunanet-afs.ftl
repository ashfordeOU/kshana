# docs--lunanet-afs: translations (nb)

seg-33f4c7af9c53 = Bærebølge

seg-53a7343c076e = Påstand

seg-da9970bcbab7 = Kilde: <c1/>

seg-4013a17a3517 = LunaNet Augmented Forward Signal: koder, meldingsformat og <c1/>

seg-c1a27b995345 = Kshana implementerer spredningskodene og meldingslaget i LunaNet <b>Augmented Forward Signal (AFS)</b> slik én utgave av spesifikasjonen definerer dem, og kontrollerer seg selv mot den utgavens trykte tabeller.

seg-e9bd99bbddb5 = <b>Låst utgave.</b> LunaNet Interoperability Specification (LNIS) <b>versjon { "5" }</b>, Applicable Document { "1" } Volume A: <em>LunaNet Signal-In-Space Recommended Standard, Augmented Forward Signal</em> (LSIS-AFS) <b>versjon { "1.0" }, { "29" } January { "2025" }</b> (NASA). Hentet 2026-10-18; PDF SHA-256 <c1/> (<a1>opphav</a1>). En senere utgave er en annen låsing og kan endre kodene: dokumentet merker kodetabellene sine { "{" }LSIS-TBC{ "}" } og sier at de er «inkludert bare for å lette test- og integrasjonsarbeid». Hver rapport oppgir denne utgaven.

seg-6845e671bf24 = Veiledende: analyseresultat fra et forsknings- og ingeniørverktøy, ikke typegodkjent navigasjonsutstyr og ikke en tjeneste for liv og sikkerhet.

seg-69a98d01f489 = LunaNet AFS-kodegeneratoren kontrollert mot de trykte kolonnene i spesifikasjonen, fra en reell kjøring av motoren v{ $version } (`kshana lunanet-afs-check spec`, låst til LNIS V5, AD1 Volume A (LSIS-AFS) V1.0, { "29" } January { "2025" }; dokumentet merker kodetabellene sine { "{" }LSIS-TBC{ "}" }). { "9" } av { "10" } kontroller er nådd; B4 er NOT MET ({ "420" } av { "421" } stemte). Den kontrollerer en symbolstrøm mot én utgave av en publisert spesifikasjon og sier ingenting om noen LunaNet-node eller -tjeneste. Veiledende: analyseresultat fra et forsknings- og ingeniørverktøy, ikke typegodkjent navigasjonsutstyr og ikke en tjeneste for liv og sikkerhet. Den kontrollerer en symbolstrøm mot én utgave av en publisert spesifikasjon og sier ingenting om noen LunaNet-node eller -tjeneste.

seg-4c3f77d97294 = Hva som er implementert

seg-a0b684e44fb0 = Lag

seg-5d987fca539c = Hva

seg-df52127d74b6 = Hvor

seg-637035a0b1c1 = AFS-I (data)

seg-dbee58df4c92 = Gold-kode { "2047" } kortsyklet til { "2046" } chips, G2 forsinket med et antall chips per PRN, { "1.023" } Mchip/s, BPSK({ "1" }), { "500" } symbol/s, PRN { "1" } til { "210" }

seg-d4480ead20d1 = <c1/>, signalnavn <c2/>

seg-6d84dce7f6d0 = AFS-Q (pilot)

seg-2ebf619c9cb6 = Weil-kode { "10230" } (GPS L1C-konstruksjonen) lagdelt med en sekundærkode på 4 chips (S0 til S3) og en tertiær Weil-kode på 1500 chips ({ "12" } s), { "5.115" } Mchip/s, BPSK({ "5" }), ingen data. <c1/> og signalnavnet <c2/> er mottakerreplikaen, primær x sekundær ({ "8" } ms): den tertiære overlagringen for rammesynkronisering på { "12" } s er utelatt fra den, fordi anskaffelse og sporing ikke korrelerer mot en replika på { "12" } s. <c3/> er hele koden på { "12" } s

seg-03805fa6d5b1 = { "2492.028" } MHz (LSIS-020)

seg-906440b861cd = Ramme

seg-20bc4439d3d7 = SP { "68" } + SB1 { "52" } + { "5880" } sammenflettede symboler = { "6000" } symboler = { "12" } s ved { "500" } symbol/s

seg-a242d95d701f = { "9" } biter (FID { "2" }, TOI { "7" }), BCH({ "51,8" }), generator { "763" } oktalt, med dokumentets korrelasjonsdekoder med 256 hypoteser

seg-df8894e1304f = CRC

seg-a04ccd611398 = CRC-24Q, generator ({ "1" }+X)P(X) (vedlegg H)

seg-e225f10d7848 = Interleaver

seg-cb075da6f8cf = { "60" } rader x { "98" } kolonner, skrevet radvis og lest kolonnevis

seg-d544025254af = De to komponentene aksepteres av <c1/>, <c2/>, <c3/> og <c4/> som alle andre signaler, slik at en opptaksfil kan søkes etter AFS-I eller AFS-Q (<c5/>) og en syntetisk scene kan lages for tester av programvaremottakere. En syntetisk scene er, som for alle andre signaler, en fil for en programvaremottaker; ingenting her styrer radiomaskinvare.

seg-6d7a9d17946d = Hva som <b>ikke</b> er implementert

seg-95731dbf3333 = <b>LDPC-kodingen med rate 1/2 av delrammene { "2" } til { "4" }.</b> Kontrollmatrisene finnes i vedlegg { "1" }, en separat fil som ikke står i PDF-en og ikke er medlevert. Delrammene { "2" } til { "4" } bæres og kontrolleres som ugjennomsiktige symbolblokker av den spesifiserte lengden, og CRC-24Q-ordene inni dem verifiseres ikke. En strøm som består <c1/> er ikke vist å inneholde gyldige kodeord.

seg-67bb5d1038c7 = <b>Meldingsinnhold</b> (MSG-G1, MSG-G2, MSG-G4, ...): dokumentet overlater flere definisjoner til å bli skrevet (TBW).

seg-bff5304c6187 = <b>Kodetildeling per LunaNet-node</b> (tabell F-1 er TBD). PRN { "1" } til { "12" } har midlertidige testtildelinger (tabell { "11" }). <c1/> bruker primærkoden til PRN <em>n</em> med sekundær S((n-1) mod { "4" }); utover PRN { "12" } er det denne implementasjonens mønster, ikke dokumentets. <c2/> og <c3/> tar enhver kombinasjon, med tertiærkoden til en vilkårlig PRN.

seg-6588307842fe = Linkbudsjett, signal-i-rommet-feil, effekt- og koherenskrav (LSIS-100 og utover).

seg-e0f2ddce6dff = <c1/> kjører implementasjonen mot dokumentets trykte tabeller og regnede eksempler (terskler B1 til B10 i <a1>forhåndsregistreringen</a1>) og skriver ut hver av dem med antall og status. <c2/> avslutter med { "1" } med mindre hver terskel er nådd.

seg-dafa47406a38 = <c1/> leser en symbolstrøm med harde beslutninger (tekst med <c2/> og <c3/>; blanke tegn ignoreres) og kontrollerer synkroniseringsmønsteret, SB1-dekoding, FID (bare { "0" } er definert), TOI-kontinuitet (øker med én modulo { "100" }) og rammeavstand ({ "6000" } symboler). Den avslutter med { "1" } ved ethvert problem.

seg-f12425044025 = <c1/> skriver en teststrøm: dokumentets synkroniseringsmønster, SB1- og rammelengder, med <b>plassholder</b>-delrammer { "2" } til { "4" } (den vekslende fyllingen fra LSIS-300, ikke LDPC-kodet, ingen melding). Det er symboler for å teste en kontroller eller en dekoder, ikke en bølgeform; Kshana skriver ikke noe signal.

seg-3b3548bd0b61 = Python: <c1/>, <c2/>, <c3/>. WebAssembly: de samme navnene. MCP: <c4/> (<c5/> spec, symbols eller generate). Plugin: <c6/>. Studio og JetBrains: N/A (<a1>SURFACES.md</a1>).

seg-2133870991ca = Terskler oppgitt i <c1/> før generatoren fantes; tester i <c2/>.

seg-b74d5800a039 = Terskel

seg-e75915599d5e = AFS-I første og siste { "24" } chips, { "210" } PRN

seg-f654db18922f = <b>MET</b>, { "420" } av { "420" }

seg-55d0d7168ceb = den trykte G2-starttilstanden er tilstanden etter den trykte forsinkelsen

seg-41590da4d1ac = <b>NOT MET</b>, { "0" } av { "210" }: påstanden hadde retningen feil. Post hoc (B1c, ikke forhåndsregistrert): den trykte tilstanden er tilstanden etter { "2047" } minus forsinkelsen, { "210" } av { "210" }

seg-b94947c99f9a = Legendre({ "10223" }) er lik tabell D-1

seg-75c8da01c0f1 = MET

seg-e3402e2420bd = AFS-Q primær første og siste { "24" } chips, { "210" } PRN

seg-678604d6e463 = Legendre({ "1499" }) er lik tabell E-1 og tertiær første og siste { "24" } chips, { "210" } PRN

seg-17b1420f8c0c = <b>NOT MET</b>, { "420" } av { "421" }: Legendre-sekvensen stemmer og { "419" } av { "420" } kodekolonner stemmer. De siste { "24" } chipsene som er trykt for PRN { "147" } (<c1/>) er den samme verdien som er trykt for PRN { "151" }, hvis kode generatoren gjengir; to ulike Weil-indekser ({ "607" } og { "612" }) gir ikke de samme siste { "24" } chipsene, så oppføringen for PRN { "147" } er mest sannsynlig en trykkfeil i dokumentet. Det kan ikke avgjøres uten den separate kodefilen i vedlegg { "3" }. Låst av en test

seg-aea9620e7bf1 = sekundærkodene S0 til S3 er lik tabell { "10" }

seg-2996e986d247 = <b>MET</b> (dokumentets egne konstanter)

seg-23c9277f62e6 = SB1-regneeksempelet i figur { "8" }

seg-fb70493dcdcf = <b>MET</b>: 0x045 koder til 0x229F61DBB84A0 og dekoder til FID { "0" }, TOI { "69" } (ett eksempel)

seg-acce07c33dec = CRC-24Q-kontrollverdi for <c1/>

seg-71c490aca8d7 = <b>MET</b>: 0xCDE703 (katalogverdien, utenfor spesifikasjonen)

seg-789b31d53873 = rammeregning

seg-5b5da00ad1c8 = interleave og deretter de-interleave

seg-80f9cd313ec4 = <b>MET</b> (en egenskap, MODELLED)

seg-92a7addfdb8c = synkroniseringsmønster

seg-215913f74706 = <b>MET</b> ({ "68" } symboler; en transkripsjonskontroll)

seg-3b51bd143c19 = B1 til B4 er VALIDATED mot de trykte tabellene i den siterte utgaven, som dokumentet merker { "{" }LSIS-TBC{ "}" }. En rundtur fra scene til anskaffelse til sporing for begge komponentene består de samme tersklene som de andre signalene (<c1/>).

seg-9edb6e5771ca = <s1>Forrige</s1>Galileo OSNMA-verifisering

seg-d0043d0f578a = <s1>Neste</s1>Jammertest som dommer

seg-52946c9ff62a = Hva som ikke er implementert

seg-339c9eeb510b = kshana lunanet-afs-check
