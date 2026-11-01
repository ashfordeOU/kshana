# docs--npm: translations (nb)

seg-3d770dd786e4 = Bruk

seg-d4a762001549 = Lisens

seg-81a87d14efda = Kshana: merket, et kompasshårkors som markerer det nøyaktige øyeblikket, ved siden av ordmerket kshana

seg-0ddcab84868f = Kilde: <c1/>

seg-32c82b87acd6 = <b>Kshana · <s1>क्षण</s1> · <em>det presise øyeblikket</em></b><br/> En åpen kildekode-simulator for PNT-robusthet (posisjonering, navigasjon og tidssynkronisering).

seg-3b861b2f08b8 = Utgivelse v{ $version }

seg-6a1906d8d4ad = Omtrent { "95" } % linjedekning, med krav på { "85" } % i kontinuerlig integrasjon

seg-a9f4f2795fb5 = Lisens: AGPL-3.0-only, eller en kommersiell lisens

seg-3f6b9ca5e225 = DOI 10.5281/zenodo.20528627

seg-7fcbe854ebc4 = Øv på minuttet GNSS går i svart: Kshanas oppdragskonsoll, tegnet fra en reell kjøring av motoren, en sammenkjedet kampanje med jamming, spoofing, holdover og integritet over de { "102" } satellittene i GPS, Galileo, BeiDou og GLONASS

seg-d1153c5e9112 = Øv på minuttet GNSS går i svart

seg-d284448743af = Kshana spiller av jamming, spoofing og klokke-holdover når GNSS-signaler (Global Navigation Satellite System) svikter, og forteller deg hvor lenge et system holder tid og posisjon innenfor budsjettet, og hvilken klokke eller sensor som gir mest margin. Dette er WebAssembly-pakken: hele motoren i JavaScript, i nettleseren eller i Node.js. Hver kjøring kan gjengis bit for bit fra scenarioet, seedet og motorversjonen.

seg-d1a3f78ad8e0 = Prøv det først uten noe å installere: <a1>Kshana Studio</a1> kjører hele motoren i nettleseren din, kompilert til WebAssembly, og laster ikke opp noe.

seg-d662055d817f = Pakken er en ES-modul (ECMAScript, standard JavaScript) med en WebAssembly-last, bygd for nettleseren. Initialiser den én gang, og kall deretter motoren synkront. Den eneste forskjellen mellom nettleseren og Node.js er hvordan WebAssembly-binæren lastes.

seg-0b750617ea08 = <b>I nettleseren</b> (gjennom en bundler, eller en side som serverer <c1/>) henter <c2/> <c3/> fra siden av modulen:

seg-70fc98eb8d2e = <b>I Node.js</b> feiler <c1/> med <c2/> (Nodes <c3/> kan ikke lese en lokal fil), så les binæren fra disk og gi den til <c4/>:

seg-2c181d5e0942 = Lagre Node.js-versjonen som en <c1/>-fil (eller sett <c2/> i <c3/>) slik at <c4/> fungerer. Derfra er begge like:

seg-06eb982ef260 = TypeScript ser typede resultater: <c1/> returnerer en <c2/> (<c3/>, <c4/>, <c5/>, <c6/>, <c7/>), <c8/> en <c9/> der <c10/> er unionen <c11/> av hver type, og <c12/> en <c13/> (eller <c14/> ved suksess). Hvert resultatdokuments egne felt varierer med typen; <c15/> typer den felles konvolutten (<c16/>, <c17/> og blokken <c18/> med <c19/>-er).

seg-31d983ae7036 = Fire funksjoner til beskriver motoren for en frontend. <c1/> returnerer et JSON-objekt fra type til modulene radene i verifikasjonsmatrisen nevner, <c2/> ett fra type til resultatfeltene som svarer på spørsmålet (visningsmetadata; motoren leser det aldri), <c3/> signalnavnene <c4/> godtar, og <c5/> en kort syntetisk IQ-scene, oppfanget og sporet i minnet (høyst { "0.25" } s, { "1,000,000" } sampler og { "8" } satellitter), med det samme svaret som det native bygget.

seg-ceee5ddc0c36 = På WebAssembly-siden er hvert inngangspunkt et eget kall: <c1/> (resultatdokumentet som en JSON-streng), <c2/>, <c3/>, <c4/> (scenarioets CSV-tabell (kommaseparerte verdier) som en streng, eller <c5/> for typer som ikke publiserer noen tabell; den kaster en feil for et ugyldig scenario), <c6/> (én motorkjøring som returnerer <c7/> som en JSON-streng — bruk den når du vil ha mer enn én utdata, siden hvert annet kall kjører scenarioet på nytt), <c8/> (de samme utdataene som ett typet objekt, med dokumentet allerede tolket som <c9/>), <c10/>, <c11/> / <c12/> / <c13/> (introspeksjon; <c14/> returnerer den tolkede listen), <c15/> / <c16/> — kodeken for delbare lenker (URL, uniform resource locator) som <a1>Kshana Studio</a1> bruker til å sende et helt scenario fram og tilbake gjennom fragmentet i adressefeltet — og <c17/> / <c18/> / <c19/>, SP3-c (revisjon c av formatet Standard Product { "3" }) og CCSDS-efemeridene (Consultative Committee for Space Data Systems) — OMM, Orbit Mean-elements Message, og OEM, Orbit Ephemeris Message — som kommandolinjen skriver — og <c20/>, som vurderer en ekte mottakerlogg beskrevet av et <c21/>-scenario og returnerer <c22/> som en JSON-streng (nettleseren har ikke noe filsystem, så loggen, og enhver navigasjonsfil, må ligge innebygd i scenarioet som <c23/> eller <c24/>; en <c25/>-tabell legger til de maritime monitorene og tillitsscoren på 0–100, kun veiledende), <c26/> / <c27/> (hvilke interoperabilitetsformater et scenario støtter, uten å kjøre det, og én eksport i minnet: <c28/>, <c29/>, <c30/>, <c31/> eller <c32/> som JSON <c33/>, byte-identisk for samme scenario, ingenting lastes opp), <c34/> (en GeoJSON-rute skrevet inn i et scenario med veipunktspor, kommandolinjens <c35/>), <c36/> (kjøringens tidsserie som en animert SVG, en enkelt HTML-spiller eller SVG-rammer), <c37/> / <c38/> (de medfølgende referansescenarioene og deres TOML), <c39/> (bind et RFC { "3161" }-token til en bevispakke i minnet; pakken må fortsatt verifiseres, og signaturen til tidsstempelmyndigheten kontrolleres ikke), <c40/> (hvilke satellitters Galileo-navigasjonsdata en I/NAV-sidefil eller en UBX-strøm autentiserer, med den klarerte Merkle-roten eller offentlige nøkler og en valgfri uavhengig referansetid; den autentiserer data og gir ingen påstand om ytelse mot spoofing; ingenting lastes opp), <c41/> (et avgrenset NMEA-utdrag scoret slik live-modus scorer det; ingen gate), <c42/> (en NMEA-logg fra et fartøy som en batchkjøring), <c43/> (en tillitsstrøm eller et resultat som Prometheus-tekst, CEF- eller LEEF-syslog-linjer eller en OTLP-nyttelast; ingenting sendes), <c44/> (kontroller en signert bevispakke; ingenting lastes opp; pakker lages med CLI, Python eller MCP), <c45/> (et scenarios bevegelse og hendelser som tekst for en laboratoriesimulator; intet signal skrives), <c46/> og <c47/> (hvilke kravrader i offentlige rammeverk resultatdokumentene gir belegg for, med hver rads gap; ikke en konstatering av at et rammeverk er oppfylt), og <c48/> (ADS-B- eller AIS-CSV-tekst til en <c49/>-GeoJSON per UTC-dag; bare aggregert), <c50/> (en rutes andel gjennom degraderte celler i disse kartene; ikke en prognose), <c51/> (syntetisk bro-NMEA og en instruktørlogg for mannskapstrening; bare tekst, aldri for et fartøys levende navigasjonssystemer) og himmelgeometrifunksjonene <c52/>, <c53/>, <c54/>, <c55/> og <c56/> (hvilke satellitter et sted ser når bygninger, kaier eller terreng blokkerer en del av himmelen, med presisjonsfortynning, horisontal feilellipse, en seedet Monte Carlo-sky og et skyplot som SVG-tekst; synlighetsavgjørelsen og ellipsen er kontrollert mot uavhengige biblioteker, forhåndsinnstillingene er representative geometrier og ikke oppmålinger, og en skyline fjerner satellitter med siktlinje og ingenting mer). Ikke i nettleserbygget: <c57/> med sin gate og TCP-lytter, strømmet trenings-NMEA og telemetrieksportørene (Prometheus, OpenTelemetry, syslog) er langvarige nettverksprosesser og blir i kommandolinjeverktøyet; å lage en bevispakke krever en signeringsnøkkel, som hører hjemme i CLI eller Python. Det finnes ikke noe kall med én runde <c58/> her; den bindingen finnes bare i Python-wheel-pakken.

seg-12a295fba8a5 = Hver funksjon i verifikasjonsmatrisen er merket <b>validert</b> (kontrollert mot en uavhengig ekstern referanse), <b>modellert</b> eller <b>eid av partner</b>; tallene for optiske klokker er romformål på bakkemaskinvare (ingen optisk strontiumklokke har fløyet). Modenheten er <em>ikke</em> lik på tvers av områder — Earth PNT er validert mot reelle data; dypromsnavigasjon og Mars-navigasjon er modellert, og bare byggeklossene (lystid, planetposisjoner) er validert mot eksterne referanser; banebestemmelse (OD) for reelle dypromsoppdrag står på veikartet.

seg-68ed88ec0b32 = <b>Spektrum</b>: hvordan en jammer tar GNSS L-båndet, bånd for bånd.

seg-f04a0aeeee33 = <b>Klokker og tidssynkronisering</b>: holdover mot en terskel, tidsoverføring og telekom-holdover mot maskene til standardiseringssektoren i Den internasjonale teleunion (ITU-T).

seg-7e38ac603ef2 = <b>Konstellasjoner rundt et hvilket som helst legeme</b>: dekning, presisjonsfortynning og tilgjengelighet rundt Jorda, Månen eller Mars, og solsystemet ved én epoke.

seg-82708b06dcc6 = <b>Navigasjon i lav jordbane</b>: signal, passering og link, navigasjonsmelding og en fusjonert posisjonsbestemmelse, trinn for trinn.

seg-e21e9bb02d00 = <b>Kampanjer</b>: et sammenkjedet oppdrag, en sveip eller et Monte Carlo-ensemble i ett scenario.

seg-ba5057da54e4 = <b>Rapporter, animasjon og eksport</b>: hvert tall med sin enhet og merkelapp; en animert tegning av en kjøring; SP3 (Standard Product { "3" }), CCSDS-banemeldinger (Consultative Committee for Space Data Systems), CZML (Cesium Language), KML (Keyhole Markup Language), GeoJSON, STK (Systems Tool Kit) og SigMF-filer (Signal Metadata Format).

seg-6b43a8c3031e = Én åpen motor i midten, kshana { $version }, med en typet utsendelse over { "75" } typer; rundt den kommandolinjen, Rust-biblioteket, Python, WebAssembly og Kshana Studio, MCP-serveren, Docker-avbildet og JetBrains-tillegget; under den Kshana Pro, et proprietært overlegg som avhenger av den åpne motoren og aldri forker den

seg-ea6f46d62e7b = Den samme scenariofilen gir de samme bytene på hver flate. MCP er Model Context Protocol: <a1><c1/></a1> lar en KI-assistent (kunstig intelligens) kjøre motoren.

seg-f51b0a8cd30e = Seks artikler på arXiv er bygd på den åpne motoren, hver med kommandoen bak: <a1>arXiv:{ "2606.22054" }</a1> (optimismegapet hos interferensdetektorer), <a2>arXiv:{ "2606.24210" }</a2> (et betinget beskyttelsesnivå for tidssynkronisering), <a3>arXiv:{ "2607.05415" }</a3> (hvor stabil en PNT-robusthetsscore er), <a4>arXiv:{ "2607.02566" }</a4> (observerbarhet for månestasjoner på overflaten med interferometri med svært lang grunnlinje), <a5>arXiv:{ "2607.06212" }</a5> (geometri ved månens sørpol og overflatebeacons) og <a6>arXiv:{ "2610.23871" }</a6> (cislunar navigasjon som et observerbarhetsproblem: buelengde, Gram-konditionering og Doppler-vektstangen). Se <a7>Forskning</a7>.

seg-dad7832bf2d2 = Hele motoren er gratis under AGPL-3.0. Kshana Pro, et proprietært overlegg som avhenger av den åpne motoren og aldri forker den, og skreddersydde studier tilbys på kontrakt fra Ashforde® OÜ: <a1>contact@ashforde.org</a1>. Det er ingen priser; se <a2>docs/PRO.md</a2>.

seg-d217f23af0c2 = Les mer

seg-0e8320f8ea91 = <b>Hele README-en</b> → <a1>https://github.com/AshfordeOU/kshana</a1>

seg-acba56f9ed36 = <b>Kshana Studio</b> (motoren i nettleseren din, som WebAssembly) → <a1>https://kshana.dev</a1>

seg-13426521456e = <b>Funksjoner</b> → <a1>docs/CAPABILITY.md</a1>

seg-a42cfefa5e6d = <b>Validering og opprinnelse</b> → <a1>docs/VALIDATION.md</a1> · <a2>docs/PROVENANCE.md</a2>

seg-07b9e03942cb = <b>Verifikasjonsmatrise</b> → <a1>docs/VERIFICATION-MATRIX.md</a1>

seg-9390336ecc01 = <b>Siter</b> → <a1>CITATION.cff</a1> · DOI <a2>10.5281/zenodo.20528627</a2>

seg-d059e9fc67e1 = Gratis og åpen kildekode under <b>GNU AGPL-3.0-only</b> (GNU Affero General Public License, kun versjon { "3" }). En <b>kommersiell lisens</b> er tilgjengelig fra <a1>Ashforde® OÜ</a1> (et estisk privat aksjeselskap; OÜ = osaühing) for lukket integrasjon; se <a2>LICENSING.md</a2>. Profesjonelt utviklet og vedlikeholdt av Ashforde® OÜ.

seg-4ae905aec2ab = <s1>Forrige</s1>Python API

seg-8af548581ae9 = <s1>Neste</s1>Rust crate

seg-c9a297cc51e9 = { "176" } av { "401" } funksjoner validert mot uavhengige eksterne referanser

seg-7b53ee712a36 = <b>{ "176" } av { "401" }</b> funksjoner validert mot uavhengige eksterne referanser; { "221" } ærlig merket som modellert, { "4" } eid av partnere. Hver funksjon har én merkelapp i et maskinkontrollert register: VALIDATED (en uavhengig ekstern referanse stemmer: reelle data, en uavhengig implementering eller publiserte referansevektorer), MODELLED (internt konsistent, og sagt høyt) eller PARTNER (en maskinvarepartner eier den). Blant kontrollene: alle { "666" } SGP4-vektorer (Simplified General Perturbations { "4" }) fra AIAA (American Institute of Aeronautics and Astronautics) 2006-6753 til { "4.12" } mm, og Cowell-kraftmodellen til { "0.08" } m mot Orekit { "12.2" }.

seg-b59781ecf257 = Hvordan en funksjon får sin merkelapp: funksjon, uavhengig referanse, test, registermerkelapp. Verifikasjonsstatusen for alle { "401" } funksjoner: { "176" } validert, { "221" } modellert, { "4" } eid av partnere

seg-d0b2811a3d3c = Motoren har { "92" } scenariotyper; <c1/> lister dem med feltene deres. Nytt i { "0.38.0" }: <c2/> (GNSS-signaler for romfartøy over, rundt og forbi GNSS-banene) og <c3/> (månebane og -overflate som navigasjons- og geodetisk infrastruktur), begge MODELLED, og <c4/> (en tidsfeilregistrering mot ITU-T-maskene).
