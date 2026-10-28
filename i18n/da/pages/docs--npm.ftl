# docs--npm: translations (da)

seg-3d770dd786e4 = Brug

seg-d4a762001549 = Licens

seg-81a87d14efda = Kshana: mærket, et kompastrådkors, der markerer det præcise øjeblik, ved siden af ordmærket kshana

seg-0ddcab84868f = Kilde: <c1/>

seg-32c82b87acd6 = <b>Kshana · <s1>क्षण</s1> · <em>det præcise øjeblik</em></b><br/> En open source-simulator til PNT-robusthed (positionering, navigation og tidssynkronisering).

seg-3b861b2f08b8 = Udgave v{ $version }

seg-6a1906d8d4ad = Cirka { "95" }% linjedækning, med en grænse på { "85" }% i kontinuerlig integration

seg-a9f4f2795fb5 = Licens: AGPL-3.0-only eller en kommerciel licens

seg-3f6b9ca5e225 = DOI 10.5281/zenodo.20528627

seg-7fcbe854ebc4 = Øv det minut, hvor GNSS går i sort: Kshanas missionskonsol, tegnet ud fra en rigtig kørsel af motoren, en sammenkædet kampagne med jamming, spoofing, holdover og integritet over de { "102" } satellitter i GPS, Galileo, BeiDou og GLONASS

seg-d1153c5e9112 = Øv det minut, hvor GNSS går i sort

seg-d284448743af = Kshana afspiller jamming, spoofing og urets holdover, når GNSS-signaler (Global Navigation Satellite System) svigter, og fortæller dig, hvor længe et system holder tid og position inden for sit budget, og hvilket ur eller hvilken sensor der giver mest margin. Dette er WebAssembly-pakken: hele motoren i JavaScript, i browseren eller i Node.js. Hver kørsel kan gengives bit for bit ud fra scenariet, seedet og motorversionen.

seg-d1a3f78ad8e0 = Prøv det først uden at installere noget: <a1>Kshana Studio</a1> kører hele motoren i din browser, kompileret til WebAssembly, og uploader ingenting.

seg-d662055d817f = Pakken er et ES-modul (ECMAScript, standard-JavaScript) med en WebAssembly-nyttelast, bygget til browseren. Initialisér den én gang, og kald derefter motoren synkront. Den eneste forskel mellem browseren og Node.js er, hvordan WebAssembly-binæren indlæses.

seg-0b750617ea08 = <b>I browseren</b> (gennem en bundler eller en side, der serverer <c1/>) henter <c2/> filen <c3/> fra siden af modulet:

seg-70fc98eb8d2e = <b>I Node.js</b> fejler <c1/> med <c2/> (Nodes <c3/> kan ikke læse en lokal fil), så læs binæren fra disk og giv den til <c4/>:

seg-2c181d5e0942 = Gem Node.js-versionen som en <c1/>-fil (eller sæt <c2/> i din <c3/>), så <c4/> virker. Derfra er de to ens:

seg-06eb982ef260 = TypeScript ser typede resultater: <c1/> returnerer en <c2/> (<c3/>, <c4/>, <c5/>, <c6/>, <c7/>), <c8/> en <c9/>, hvis <c10/> er <c11/>-unionen af alle typer, og <c12/> en <c13/> (eller <c14/> ved succes). Hvert resultatdokuments egne felter varierer efter type; <c15/> typer den fælles kuvert (<c16/>, <c17/> og <c18/>-blokken med <c19/>s).

seg-31d983ae7036 = Fire funktioner mere beskriver motoren over for en brugerflade. <c1/> returnerer et JSON-objekt fra type til de moduler, som rækkerne i dens verifikationsmatrix nævner, <c2/> et fra type til de resultatfelter, der besvarer dens spørgsmål (visningsmetadata; motoren læser det aldrig), <c3/> de signalnavne, som <c4/> accepterer, og <c5/> en kort syntetisk IQ-scene, indfanget og sporet i hukommelsen (højst { "0.25" } s, { "1,000,000" } sampel og { "8" } satellitter), med det samme svar som den native build.

seg-ceee5ddc0c36 = På WebAssembly-fladen er hvert indgangspunkt et separat kald: <c1/> (resultatdokumentet som en JSON-streng), <c2/>, <c3/>, <c4/> (scenariets CSV-tabel (kommasepareret) som en streng eller <c5/> for typer, der ikke udgiver nogen tabel; den kaster en fejl ved et ugyldigt scenarie), <c6/> (én motorkørsel, der returnerer <c7/> som en JSON-streng — brug det, når du vil have mere end ét output, da hvert andet kald kører scenariet forfra), <c8/> (de samme outputs som ét typet objekt, med dokumentet allerede fortolket som <c9/>), <c10/>, <c11/> / <c12/> / <c13/> (introspektion; <c14/> returnerer den fortolkede liste), <c15/> / <c16/> — kodeken til delbare links (URL, uniform resource locator), som <a1>Kshana Studio</a1> bruger til at føre et helt scenarie frem og tilbage gennem adresselinjens fragment — og <c17/> / <c18/> / <c19/>, SP3-c (revision c af formatet Standard Product { "3" }) og CCSDS-efemerideartefakterne (Consultative Committee for Space Data Systems) — OMM, Orbit Mean-elements Message, og OEM, Orbit Ephemeris Message — som CLI'en skriver — og <c20/>, der vurderer en rigtig modtagerlog beskrevet af et <c21/>-scenarie og returnerer <c22/> som en JSON-streng (browseren har intet filsystem, så loggen og en eventuel navigationsfil skal stå inline i scenariet som <c23/> eller <c24/>; en <c25/>-tabel tilføjer de maritime monitorer og tillidsscoren 0-100, kun vejledende), <c26/> / <c27/> (hvilke interoperabilitetsformater et scenarie understøtter, uden at køre det, og én eksport i hukommelsen: <c28/>, <c29/>, <c30/>, <c31/> eller <c32/> som JSON <c33/>, byte-identisk for det samme scenarie, intet uploades), <c34/> (en GeoJSON-rute skrevet ind i et waypoint-spor-scenarie, kommandolinjens <c35/>), <c36/> (kørslens tidsserie som en animeret SVG, en enkelt HTML-afspiller eller SVG-billeder), <c37/> / <c38/> (de medfølgende referencescenarier og deres TOML), <c39/> (bind et RFC { "3161" }-token til en bevispakke i hukommelsen; pakken skal stadig kunne verificeres, og tidsstempelmyndighedens signatur kontrolleres ikke), <c40/> (hvilke satellitters Galileo-navigationsdata en I/NAV-sidefil eller en UBX-strøm autentificerer, med den betroede Merkle-rod eller offentlige nøgler og en valgfri uafhængig referencetid; den autentificerer data og gør ikke krav på nogen anti-spoofing-ydeevne; intet uploades), <c41/> (et afgrænset NMEA-uddrag bedømt på samme måde som live-tilstanden bedømmer; ingen gate), <c42/> (et fartøjs NMEA-log som en batchkørsel), <c43/> (en tillidsstrøm eller et resultat som Prometheus-tekst, CEF- eller LEEF-syslog-linjer eller en OTLP-nyttelast; intet sendes), <c44/> (kontrollér en signeret bevispakke; intet uploades; pakker laves med CLI'en, Python eller MCP), <c45/> (et scenaries bevægelse og hændelser som tekst til en laboratoriesimulator; intet signal skrives), <c46/> og <c47/> (hvilke rækker i offentlige rammeværkskrav resultatdokumenter leverer belæg for, med hver rækkes hul; ikke en konstatering af, at et rammeværk er opfyldt), og <c48/> (ADS-B- eller AIS-CSV-tekst til en <c49/>-GeoJSON pr. UTC-dag; kun aggregeret), <c50/> (en rutes andel gennem forringede celler i disse kort; ikke en prognose), <c51/> (syntetisk bro-NMEA og en instruktørlog til besætningstræning; kun tekst, aldrig til et fartøjs levende navigationssystemer) og himmelgeometrifunktionerne <c52/>, <c53/>, <c54/>, <c55/> og <c56/> (hvilke satellitter et sted ser, når bygninger, kajer eller terræn blokerer en del af himlen, med præcisionsfortyndingen, den vandrette fejlellipse, en seedet Monte Carlo-sky og et skyplot som SVG-tekst; synlighedsafgørelsen og ellipsen er kontrolleret mod uafhængige biblioteker, forudindstillingerne er repræsentative geometrier og ikke opmålinger, og en horisontprofil fjerner satellitter med fri sigtelinje og intet andet). Ikke i browser-buildet: <c57/> med sin gate og TCP-lytter, streamet trænings-NMEA og telemetrieksportørerne (Prometheus, OpenTelemetry, syslog) er langvarige netværksprocesser og bliver i kommandolinjeværktøjet; oprettelse af en bevispakke kræver en signeringsnøgle, som hører til CLI'en eller Python. Der er intet <c58/> med ét kald her; den binding findes kun i Python-wheelen.

seg-12a295fba8a5 = Hver funktion i verifikationsmatrixen er mærket <b>valideret</b> (kontrolleret mod en uafhængig ekstern reference), <b>modelleret</b> eller <b>ejet af partnere</b>; tal for optiske ure er rummål på jordhardware (intet optisk strontiumur er fløjet). Modenheden er <em>ikke</em> ensartet på tværs af områder — PNT på Jorden er valideret mod rigtige data; navigation i det dybe rum og på Mars er modelleret, og kun byggeklodserne (lystid, planetpositioner) er valideret mod eksterne uafhængige referencer; banebestemmelse (OD, orbit determination) i det dybe rum for rigtige missioner står på køreplanen.

seg-68ed88ec0b32 = <b>Spektrum</b>: hvordan en jammer tager GNSS L-båndet, bånd for bånd.

seg-f04a0aeeee33 = <b>Ure og tidssynkronisering</b>: holdover mod en tærskel, tidsoverførsel og telekommunikationsholdover mod maskerne fra Den Internationale Telekommunikationsunions standardiseringssektor (ITU-T).

seg-7e38ac603ef2 = <b>Konstellationer omkring ethvert legeme</b>: dækning, præcisionsfortynding og tilgængelighed omkring Jorden, Månen eller Mars og solsystemet ved én epoke.

seg-82708b06dcc6 = <b>Navigation i lav jordbane</b>: signal, overflyvning og link, navigationsmeddelelse og en fusioneret positionsbestemmelse, trin for trin.

seg-e21e9bb02d00 = <b>Kampagner</b>: en sammenkædet mission, et sweep eller et Monte Carlo-ensemble i ét scenarie.

seg-ba5057da54e4 = <b>Rapporter, animation og eksport</b>: hvert tal med sin enhed og sit mærke; en animeret tegning af en kørsel; SP3 (Standard Product { "3" }), CCSDS-banemeddelelser (Consultative Committee for Space Data Systems), CZML (Cesium Language), KML (Keyhole Markup Language), GeoJSON, STK-filer (Systems Tool Kit) og SigMF-filer (Signal Metadata Format).

seg-6b43a8c3031e = Én åben motor i midten, kshana { $version }, med en typet fordeling over { "75" } typer; omkring den kommandolinjen, Rust-biblioteket, Python, WebAssembly og Kshana Studio, MCP-serveren, Docker-aftrykket og JetBrains-pluginnet; under den Kshana Pro, et proprietært lag, der afhænger af den åbne motor og aldrig forgrener den

seg-ea6f46d62e7b = Den samme scenariefil giver de samme bytes på alle flader. MCP er Model Context Protocol: <a1><c1/></a1> lader en AI-assistent (kunstig intelligens) køre motoren.

seg-f51b0a8cd30e = Seks artikler på arXiv bygger på den åbne motor, hver med kommandoen bag sig: <a1>arXiv:{ "2606.22054" }</a1> (optimismegabet for interferensdetektorer), <a2>arXiv:{ "2606.24210" }</a2> (et betinget beskyttelsesniveau for tidssynkronisering), <a3>arXiv:{ "2607.05415" }</a3> (hvor stabil en PNT-robusthedsscore er), <a4>arXiv:{ "2607.02566" }</a4> (observerbarhed af månestationer på overfladen med interferometri over meget lange baselines), <a5>arXiv:{ "2607.06212" }</a5> (geometri ved månens sydpol og overfladefyr) og <a6>arXiv:{ "2610.23871" }</a6> (navigation i cislunart rum som et observerbarhedsproblem: buelængde, Gramian-konditionering og Doppler-løftestangen). Se <a7>Forskning</a7>.

seg-dad7832bf2d2 = Hele motoren er gratis under AGPL-3.0. Kshana Pro, et proprietært lag, der afhænger af den åbne motor og aldrig forgrener den, og skræddersyede studier fås på kontrakt fra Ashforde® OÜ: <a1>contact@ashforde.org</a1>. Der er ingen priser; se <a2>docs/PRO.md</a2>.

seg-d217f23af0c2 = Læs mere

seg-0e8320f8ea91 = <b>Den fulde README</b> → <a1>https://github.com/AshfordeOU/kshana</a1>

seg-acba56f9ed36 = <b>Kshana Studio</b> (motoren i din browser, som WebAssembly) → <a1>https://kshana.dev</a1>

seg-13426521456e = <b>Funktioner</b> → <a1>docs/CAPABILITY.md</a1>

seg-a42cfefa5e6d = <b>Validering og proveniens</b> → <a1>docs/VALIDATION.md</a1> · <a2>docs/PROVENANCE.md</a2>

seg-07b9e03942cb = <b>Verifikationsmatrix</b> → <a1>docs/VERIFICATION-MATRIX.md</a1>

seg-9390336ecc01 = <b>Citér</b> → <a1>CITATION.cff</a1> · DOI <a2>10.5281/zenodo.20528627</a2>

seg-d059e9fc67e1 = Gratis og open source under <b>GNU AGPL-3.0-only</b> (GNU Affero General Public License, kun version { "3" }). En <b>kommerciel licens</b> fås fra <a1>Ashforde® OÜ</a1> (et estisk anpartsselskab; OÜ = osaühing) til lukket integration; se <a2>LICENSING.md</a2>. Professionelt udviklet og vedligeholdt af Ashforde® OÜ.

seg-4ae905aec2ab = <s1>Forrige</s1>Python API

seg-8af548581ae9 = <s1>Næste</s1>Rust-crate

seg-c9a297cc51e9 = { "176" } af { "401" } funktioner valideret mod uafhængige eksterne referencer

seg-7b53ee712a36 = <b>{ "176" } af { "401" }</b> funktioner valideret mod uafhængige eksterne referencer; { "221" } ærligt betegnet modelleret, { "4" } ejet af partnere. Hver funktion bærer én etiket i et maskinkontrolleret register: VALIDATED (en uafhængig ekstern reference stemmer overens: virkelige data, en uafhængig implementering eller offentliggjorte referencevektorer), MODELLED (internt konsistent og sagt højt) eller PARTNER (en hardwarepartner ejer den). Blandt kontrollerne: alle { "666" } SGP4-vektorer (Simplified General Perturbations { "4" }) fra AIAA (American Institute of Aeronautics and Astronautics) 2006-6753 til { "4.12" } mm og Cowell-kraftmodellen til { "0.08" } m mod Orekit { "12.2" }.

seg-b59781ecf257 = Hvordan en funktion opnår sin etiket: funktion, uafhængig reference, test, registeretiket. Verifikationsstatus på tværs af alle { "401" } funktioner: { "176" } valideret, { "221" } modelleret, { "4" } ejet af partnere

seg-d0b2811a3d3c = Motoren har { "92" } scenarietyper; <c1/> viser dem med deres felter. Nye i { "0.38.0" }: <c2/> (GNSS-signaler til rumfartøjer over, omkring og forbi GNSS-banerne) og <c3/> (månebane og -overflade som navigations- og geodætisk infrastruktur), begge MODELLED, og <c4/> (en tidsfejlsoptagelse mod ITU-T-masker).
