# docs--lunanet-afs: translations (nl)

seg-33f4c7af9c53 = Draaggolf

seg-53a7343c076e = Bewering

seg-da9970bcbab7 = Bron: <c1/>

seg-4013a17a3517 = LunaNet Augmented Forward Signal: codes, berichtindeling en <c1/>

seg-c1a27b995345 = { -brand } implementeert de spreidingscodes en de berichtlaag van het LunaNet <b>Augmented Forward Signal (AFS)</b> zoals één uitgave van de specificatie ze definieert, en controleert zichzelf aan de afgedrukte tabellen van die uitgave.

seg-e9bd99bbddb5 = <b>Vastgepind.</b> LunaNet Interoperability Specification (LNIS) <b>Version { "5" }</b>, Applicable Document { "1" } Volume A: <em>LunaNet Signal-In-Space Recommended Standard, Augmented Forward Signal</em> (LSIS-AFS) <b>Version { "1.0" }, { "29" } januari { "2025" }</b> (NASA). Opgehaald op 2026-10-18; pdf-SHA-256 <c1/> (<a1>herkomst</a1>). Een latere uitgave is een andere pin en kan de codes wijzigen: het document markeert zijn codetabellen met { "{" }LSIS-TBC{ "}" } en zegt dat ze "included to facilitate test and integration efforts only". Elk rapport noemt deze uitgave.

seg-6845e671bf24 = Adviserend: analyse-uitvoer van een onderzoeks- en engineeringhulpmiddel, geen typegoedgekeurde navigatieapparatuur en geen safety-of-life-dienst.

seg-69a98d01f489 = De LunaNet AFS-codegenerator getoetst aan de afgedrukte kolommen van de specificatie, uit een echte run van engine v{ $version } (`kshana lunanet-afs-check spec`, vastgepind op LNIS V5, AD1 Volume A (LSIS-AFS) V1.0, { "29" } januari { "2025" }; het document markeert zijn codetabellen met { "{" }LSIS-TBC{ "}" }). { "9" } van { "10" } controles zijn gehaald; B4 is NOT MET ({ "420" } van { "421" } kwamen overeen). Zij toetst een symboolstroom aan één uitgave van een gepubliceerde specificatie en zegt niets over een LunaNet-knooppunt of -dienst. Adviserend: analyse-uitvoer van een onderzoeks- en engineeringhulpmiddel, geen typegoedgekeurde navigatieapparatuur en geen safety-of-life-dienst. Zij toetst een symboolstroom aan één uitgave van een gepubliceerde specificatie en zegt niets over een LunaNet-knooppunt of -dienst.

seg-4c3f77d97294 = Wat is geïmplementeerd

seg-a0b684e44fb0 = Laag

seg-5d987fca539c = Wat

seg-df52127d74b6 = Waar

seg-637035a0b1c1 = AFS-I (data)

seg-dbee58df4c92 = Gold-code { "2047" }, ingekort tot { "2046" } chips, G2 vertraagd met een aantal chips per PRN, { "1.023" } Mchip/s, BPSK({ "1" }), { "500" } symbool/s, PRN { "1" } tot { "210" }

seg-d4480ead20d1 = <c1/>, signaalnaam <c2/>

seg-6d84dce7f6d0 = AFS-Q (pilot)

seg-2ebf619c9cb6 = Weil-code { "10230" } (de GPS L1C-constructie) gelaagd met een secundaire code van 4 chips (S0 tot S3) en een tertiaire Weil-code van 1500 chips ({ "12" } s), { "5.115" } Mchip/s, BPSK({ "5" }), geen data. <c1/> en de signaalnaam <c2/> zijn de ontvangerreplica, primair x secundair ({ "8" } ms): de tertiaire framesynchronisatie-overlay van { "12" } s is daarin weggelaten, omdat acquisitie en tracking niet tegen een replica van { "12" } s correleren. <c3/> is de volledige code van { "12" } s

seg-03805fa6d5b1 = { "2492.028" } MHz (LSIS-020)

seg-906440b861cd = Frame

seg-20bc4439d3d7 = SP { "68" } + SB1 { "52" } + { "5880" } geïnterleavede symbolen = { "6000" } symbolen = { "12" } s bij { "500" } symbool/s

seg-a242d95d701f = { "9" } bits (FID { "2" }, TOI { "7" }), BCH({ "51,8" }), generator { "763" } octaal, met de correlatiedecoder met 256 hypothesen uit het document

seg-df8894e1304f = CRC

seg-a04ccd611398 = CRC-24Q, generator ({ "1" }+X)P(X) (Appendix H)

seg-e225f10d7848 = Interleaver

seg-cb075da6f8cf = { "60" } rijen x { "98" } kolommen, rijgewijs geschreven en kolomgewijs gelezen

seg-d544025254af = De twee componenten worden door <c1/>, <c2/>, <c3/> en <c4/> net als elk ander signaal geaccepteerd, zodat een opname op AFS-I of AFS-Q kan worden doorzocht (<c5/>) en een synthetische scène kan worden gemaakt voor tests van software-ontvangers. Een synthetische scène is, zoals bij elk ander signaal, een bestand voor een software-ontvanger; niets hier stuurt radiohardware aan.

seg-6d7a9d17946d = Wat <b>niet</b> is geïmplementeerd

seg-95731dbf3333 = <b>De rate-1/2-LDPC-codering van subframes { "2" } tot { "4" }.</b> De controlematrices staan in Annex { "1" }, een apart bestand dat niet in de pdf zit en niet is meegeleverd. Subframes { "2" } tot { "4" } worden als ondoorzichtige symboolblokken van de opgegeven lengte meegevoerd en gecontroleerd, en de CRC-24Q-woorden daarin worden niet geverifieerd. Van een stroom die <c1/> doorstaat, is niet aangetoond dat hij geldige codewoorden bevat.

seg-67bb5d1038c7 = <b>Berichtinhoud</b> (MSG-G1, MSG-G2, MSG-G4, ...): het document laat verscheidene definities nog te schrijven (TBW).

seg-bff5304c6187 = <b>Codetoewijzing per LunaNet-knooppunt</b> (Table F-1 is TBD). PRN's { "1" } tot { "12" } hebben voorlopige testtoewijzingen (Table { "11" }). <c1/> gebruikt de primaire code van PRN <em>n</em> met secundaire code S((n-1) mod { "4" }); voorbij PRN { "12" } is dat het patroon van deze implementatie, niet van het document. <c2/> en <c3/> accepteren elke combinatie, met de tertiaire code van elke PRN.

seg-6588307842fe = Linkbudget, signal-in-space-fout, vermogens- en coherentie-eisen (LSIS-100 en volgende).

seg-e0f2ddce6dff = <c1/> voert de implementatie uit tegen de afgedrukte tabellen en uitgewerkte voorbeelden van het document (drempels B1 tot B10 van <a1>de preregistratie</a1>) en drukt elk af met zijn aantal en status. <c2/> eindigt met exitcode { "1" } tenzij elke drempel is gehaald.

seg-dafa47406a38 = <c1/> leest een symboolstroom met harde beslissingen (tekst van <c2/> en <c3/>; witruimte genegeerd) en controleert het synchronisatiepatroon, de SB1-decodering, FID (alleen { "0" } is gedefinieerd), TOI-continuïteit (oplopend met één modulo { "100" }) en frameafstand ({ "6000" } symbolen). Het eindigt met exitcode { "1" } bij elk probleem.

seg-f12425044025 = <c1/> schrijft een teststroom: het synchronisatiepatroon, de SB1- en framelengtes van het document, met <b>plaatshouder</b>-subframes { "2" } tot { "4" } (de afwisselende vulling van LSIS-300, niet LDPC-gecodeerd, geen bericht). Het zijn symbolen om een checker of decoder te testen, geen golfvorm; { -brand } schrijft geen signaal.

seg-3b3548bd0b61 = Python: <c1/>, <c2/>, <c3/>. WebAssembly: dezelfde namen. MCP: <c4/> (<c5/> spec, symbols of generate). Plug-in: <c6/>. Studio en JetBrains: N/A (<a1>SURFACES.md</a1>).

seg-2133870991ca = Drempels vastgelegd in <c1/> voordat de generator bestond; tests in <c2/>.

seg-b74d5800a039 = Drempel

seg-e75915599d5e = AFS-I eerste en laatste { "24" } chips, { "210" } PRN's

seg-f654db18922f = <b>MET</b>, { "420" } van { "420" }

seg-55d0d7168ceb = de afgedrukte G2-beginstand is de stand na de afgedrukte vertraging

seg-41590da4d1ac = <b>NOT MET</b>, { "0" } van { "210" }: de bewering had de richting verkeerd. Post hoc (B1c, niet vooraf geregistreerd): de afgedrukte stand is de stand na { "2047" } min de vertraging, { "210" } van { "210" }

seg-b94947c99f9a = Legendre({ "10223" }) is gelijk aan Table D-1

seg-75c8da01c0f1 = MET

seg-e3402e2420bd = AFS-Q primair eerste en laatste { "24" } chips, { "210" } PRN's

seg-678604d6e463 = Legendre({ "1499" }) is gelijk aan Table E-1 en tertiair eerste en laatste { "24" } chips, { "210" } PRN's

seg-17b1420f8c0c = <b>NOT MET</b>, { "420" } van { "421" }: de Legendre-reeks komt overeen en { "419" } van { "420" } codekolommen komen overeen. De laatste { "24" } chips die voor PRN { "147" } zijn afgedrukt (<c1/>) zijn dezelfde waarde die voor PRN { "151" } is afgedrukt, waarvan de code door de generator wordt gereproduceerd; twee verschillende Weil-indices ({ "607" } en { "612" }) geven niet dezelfde laatste { "24" } chips, dus de invoer voor PRN { "147" } is hoogstwaarschijnlijk een drukfout in het document. Dit kan niet worden beslecht zonder het afzonderlijke codebestand Annex { "3" }. Vastgepind door een test

seg-aea9620e7bf1 = secundaire codes S0 tot S3 zijn gelijk aan Table { "10" }

seg-2996e986d247 = <b>MET</b> (de eigen constanten van het document)

seg-23c9277f62e6 = SB1-uitgewerkt voorbeeld van Figure { "8" }

seg-fb70493dcdcf = <b>MET</b>: 0x045 codeert naar 0x229F61DBB84A0 en decodeert naar FID { "0" }, TOI { "69" } (één voorbeeld)

seg-acce07c33dec = CRC-24Q-controlewaarde voor <c1/>

seg-71c490aca8d7 = <b>MET</b>: 0xCDE703 (de cataloguswaarde, buiten de specificatie)

seg-789b31d53873 = framerekenwerk

seg-5b5da00ad1c8 = interleaven en daarna de-interleaven

seg-80f9cd313ec4 = <b>MET</b> (een eigenschap, MODELLED)

seg-92a7addfdb8c = synchronisatiepatroon

seg-215913f74706 = <b>MET</b> ({ "68" } symbolen; een transcriptiecontrole)

seg-3b51bd143c19 = B1 tot B4 zijn VALIDATED tegen de afgedrukte tabellen van de aangehaalde uitgave, die het document markeert met { "{" }LSIS-TBC{ "}" }. Een rondgang scène-naar-acquisitie-naar-tracking van beide componenten haalt dezelfde drempels als de andere signalen (<c1/>).

seg-9edb6e5771ca = <s1>Vorige</s1>Galileo OSNMA-verificatie

seg-d0043d0f578a = <s1>Volgende</s1>Jammertest als scheidsrechter

seg-52946c9ff62a = Wat niet is geïmplementeerd

seg-339c9eeb510b = kshana lunanet-afs-check
