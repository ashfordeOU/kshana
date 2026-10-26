# docs--kind-realtime-frame-eop: translations (nb)

seg-8e845ce908ee = Scenariotype i motoren v{ $version }, familie <a1>GNSS-målinger, posisjonsbestemmelse og integritet</a1>. Veiledende: analyseutdata fra et forsknings- og ingeniørverktøy, ikke typegodkjent navigasjonsutstyr og ikke en sikkerhetskritisk tjeneste for menneskeliv. Hver etikett her er motorens eller verifikasjonsmatrisens; en type er MODELLED med mindre matrisen sier noe annet (hvordan en etikett fortjenes: Evidens-avsnittet i README).

seg-f6b7ca020692 = Familieside: <a1>GNSS-målinger, posisjonsbestemmelse og integritet</a1>

seg-7400f24ec992 = MODELLED { "1" } · VALIDATED { "2" }: radene i <a1>verifikasjonsmatrisen</a1> som nevner denne typen.

seg-1ad013ffb9d1 = Kilde: <c1/>

seg-54620502f0dd = <c1/> (scenariotype)

seg-edfcb546d9de = Budsjett for sanntidsprediksjon av månens referansesystem og jordorientering: P4 tabell { "1" } (konsistenskontrollen av rammefeil: etterbehandlet ~{ "0.27" } m ↔ ~{ "0.010" } ms og sanntid ~{ "15" } m ↔ ~{ "0.5" } ms, der hver rammeposisjon uttrykkes som sin tilsvarende UT1-feil via L19-vektarmen Δr = D_EM·ω⊕·ΔUT1) og tabell { "2" } (målt UT1-prediksjonsfeil mot horisont: L18-kurven lest rett av den virkelige IERS finals2000A-serien, det endelige gulvet Bulletin A − Bulletin B og persistensprediktorens feil over flere dager, hver avbildet til en posisjon i månens ramme med L19), pluss L21-budsjettet for rammefeil i sanntid som kvadratroten av kvadratsummen (EOP + efemeride + realiseringsgulv). VALIDATED lukket form (L19-vektarmen, ω⊕ kontrollert mot CIO-rotasjonsvinkelen for jorden) og VALIDATED virkelige data (L18-kurven rett av de virkelige radene i finals2000A); MODELLED er størrelsene på OD-kovariansen for månereléet og gulvet for realisering av rammen (representative tildelinger) og persistensprediktoren (ikke IERS' operative Bulletin A-algoritme). Ikke et sertifisert sanntidsprodukt for referansesystem.

seg-488039e4240f = En kjøring av <c1/> oppsummeres slik: realtime-frame-eop | Table { "1" }: post-proc { "0.27" } m ({ "0.0096" } ms UT1) ↔ real-time { "14.4" } m ({ "0.514" } ms UT1) | Table { "2" }: final floor { "0.0171" } ms → 3-day { "1.6644" } ms | budget total { "20.1" } m ({ "67.0" } ns) | L19 lever arm + L18 real-data (Validated), OD cov (Modelled)

seg-66264ec78a4c = Valgfrie felt: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>

seg-45a4ed476311 = Eksempelet <c1/> angir blant annet:

seg-c39a26aa1f1e = medfølgende testdata finals2000A_20260930

seg-9ef8a2b4c144 = Resultatetikett (motorens): budsjett for sanntidsprediksjon av månens referansesystem og jordorientering. VALIDATED lukket form: L19-vektarmen ({ "1" } ms ↔ { "28.03" } m ↔ { "93.5" } ns), ω⊕ kontrollert mot CIO-rotasjonsvinkelen for jorden. VALIDATED virkelige data: L18-kurvene for UT1- og polbevegelsesprediksjonsfeil lest rett av den virkelige IERS finals200

seg-2721ed7727bb = Diagrammet motoren skriver for scenarios/realtime-frame-eop.toml, type realtime-frame-eop

seg-72a1fc2f5c90 = <b>VALIDATED</b> Én tabell rapporterer UT1-prediksjonsfeilen, polfeilen fra polbevegelsen og deres kvadratiske kombinasjon ved Månen over et IDENTISK epokesett per horisont, og sender ut epokene hver komponent ble målt ved. Tester: <a1>embedded_eop_vintage_astropy_preregistered.rs</a1>.

seg-b1d90bf98ac3 = <b>VALIDATED</b> Standardverdien i kjøretid for <c1/> er bibliotekets egen innebygde kopi av et ordrett IERS finals2000A-utdrag (tools/finals2000A_20260930.txt: { "174" } sammenhengende daglige rader, MJD 61224-61397, klippet fra finals2000A.all fra 2026-09-30) som bærer Tester: <a1>operational_eop_predictor_reference.rs</a1>.

seg-0298bd40d72f = <b>MODELLED</b> En tilpasning med minste kvadrater av skjevhet pluss rate over et etterfølgende vindu pluss de viktigste periodiske leddene (årlig, halvårlig og de to viktigste sonale tidevannene for UT1; Chandler, årlig og halvårlig for polen), ekstrapolert med det siste i vinduet Tester: <a1>operational_eop_predictor_reference.rs</a1>.

seg-12efcd20ca62 = <b>VALIDATED</b> Én tabell rapporterer UT1-prediksjonsfeilen, polfeilen fra polbevegelsen og deres kvadratiske kombinasjon ved Månen over et IDENTISK epokesett per horisont, sender. Uavhengig referanse (ExternalDataset): astropy { "8.0.1" } utils.iers (BSD-3) som leser IERS-produktet finals2000A med sin egen regel Bulletin-B-ellers-A, og pyerfa { "2.0.1.5" } (SOFA) fulle rotasjoner fra himmelsk til terrestrisk (c2i06a, sp00, pom00, c2tcio; jordrotasjonsvinkelen etter IERS { "2010" } lign. { "5.15" } i eksakt aritmetikk), kjørt som separate programmer på ordrette rader av den frosne finals2000A.all fra 2026-09-30; forhåndsregistrert (455b8fb5) med endringene A1 og A2 som kun fastsatte

seg-020e5919c8fd = <b>VALIDATED</b> Standardverdien i kjøretid for <c1/> er bibliotekets egen innebygde kopi av et ordrett IERS finals2000A-utdrag (tools/finals2000A_20260930.txt: { "174" } sammenhengende. Uavhengig referanse (ExternalDataset): astropy { "8.0.1" } astropy.utils.iers.IERS_A (BSD-3-Clause), som leser de samme bytene med sin egen leser, og tabellen i IERS Bulletin A bd. XXXIX nr. { "039" }, kopiert tall for tall; forhåndsregistrert (6fdae01b) med seks eksakte kriterier før astropy ble kjørt. Alle seks holder: { "30" } endelige, { "54" } raske og { "90" } predikerte rader med like MJD-lister, hver predikert rad med flagg P, folketellingen for standardkjøringen lik, og prediksjonene lik Bullet

seg-530c87bbff78 = <b>MODELLED</b> En tilpasning med minste kvadrater av skjevhet pluss rate over et etterfølgende vindu pluss de viktigste periodiske leddene (årlig, halvårlig og de to viktigste sonale tidevannene for UT1; Cha. Uavhengig referanse (ReferenceImpl): tre uavhengige veier, ingen av dem et publisert tall for prediksjonsnøyaktighet. ({ "1" }) Et analytisk signal med kjente koeffisienter, den eneste måten å prøve ut maskineriet for periodiske ledd, siden ingen innsjekket serie er lang nok til å romme et årlig ledd. ({ "2" }) Lærebokens lukkede løsning med minste kvadrater, annen algebra enn matriseløsningen som testes, på virkelige rader. ({ "3" }) De ekte arkiverte radene for Bulletin A-prediksjon som

seg-a233df86be95 = Budsjett for sanntidsprediksjon av månens referansesystem og jordorientering. VALIDATED lukket form: L19-vektarmen ({ "1" } ms ↔ { "28.03" } m ↔ { "93.5" } ns), ω⊕ kontrollert mot CIO-rotasjonsvinkelen for jorden. VALIDATED virkelige data: L18-kurvene for UT1- og polbevegelsesprediksjonsfeil lest rett av den virkelige IERS finals2000A-serien (Bulletin A raske mot Bulletin B endelige, og persistens over flere dager på de virkelige daglige radene). AVLEDET: rammen (resultat <c1/>)

seg-60e7ee7e6e3e = VALIDATED lukket form (L19-vektarmen, ω⊕ kontrollert mot CIO-rotasjonsvinkelen for jorden) og VALIDATED virkelige data (L18-kurven rett av de virkelige radene i finals2000A); MODELLED er størrelsene på OD-kovariansen for månereléet og gulvet for realisering av rammen (representative tildelinger) og persistensprediktoren (ikke IERS' operative Bulletin A-algoritme). (typekatalog (<c1/>))
