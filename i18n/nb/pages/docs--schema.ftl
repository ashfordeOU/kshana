# docs--schema: translations (nb)

seg-2247a2344710 = Betydning

seg-f42465f7d066 = ns

seg-f63dd3d7aad4 = Kilde

seg-6940543aa3c0 = streng

seg-f5e7215e6835 = objekt

seg-9da5d92757bd = objekt, valgfritt

seg-c353e7bec219 = Nøkkel

seg-a129b9e613d0 = Type

seg-e28387d70be0 = Kilde: <c1/>

seg-49d2afecf5f1 = Resultatskjema — slik leser du en Kshana <c1/>

seg-c128455c353c = Hver kjøring skriver en versjonert, selvbeskrivende JSON-artefakt (JavaScript Object Notation) ved siden av scenarioet. Denne siden er den håndskrevne leserveiledningen til utvekslingskonvolutten og til resultatformene for <b>klokke og bane</b>: hvert felts <b>enhet</b>, hvor det beregnes i kildekoden og hvordan det leses. Den kanoniske typen er <c1/> i <a1><c2/></a1>; kvalitetsmålene er <c3/> i <a2><c4/></a2>.

seg-092ea1e33a05 = Den er <b>ikke</b> den fullstendige feltreferansen. Motoren fordeler over langt flere kind-er enn disse to, og hver gir ut sin egen pakke. Den fullstendige referansen — enhet, proveniensklasse og definisjon for hvert numeriske felt i hver innebygde kind — er generert, ikke håndskrevet: se <a1>Enheter og proveniens, per felt, for hver kind</a1> nedenfor.

seg-e4c4b66a2f46 = Utvekslingskonvolutt (KIF, Kshana Interchange Format) — gjenkjenne og versjonskontrollere en artefakt

seg-9b83bb817814 = Kshana-artefakter kan pakkes inn i en nøytral, selvbeskrivende <b>utvekslingskonvolutt</b> slik at et tredjepartsverktøy kan gjenkjenne filen og avgjøre om det kan lese den <em>før</em> det forplikter seg til et nyttelastskjema. Den kanoniske typen er <c1/> i <a1><c2/></a1>.

seg-e4fd08930644 = Alltid <c1/> (<c2/>) — slik gjenkjenner et fremmed verktøy en Kshana-artefakt.

seg-abd853f2ce49 = Skjemaversjonen <c1/> (<c2/>, den eneste kilden til sannhet for hele craten).

seg-ee9f238072f1 = Artefakttype, for eksempel <c1/>, <c2/>, <c3/> — lar en forbruker rute uten å tolke innholdet.

seg-29ad4bedd64f = Crate-versjonen (<c1/>) som laget nyttelasten.

seg-52f3e962c049 = Den innpakkede artefakten som kanonisk JSON (en <c1/>, en <c2/>, …).

seg-6fe0d7cd4165 = <b>Kompatibilitetskontrakt.</b> Versjoner er <c1/>. Nye felt legges til med <c2/> (den <em>additive disiplinen</em>), slik at en leser kan tolke enhver artefakt med <b>samme hovedversjon og lik eller eldre underversjon</b> (<c3/>). En strengt <b>nyere underversjon</b> (<c4/>) kan ha felt denne leseren ikke kan ta hensyn til, og en <b>annen hovedversjon</b> (<c5/>) er et strukturelt brudd — begge avvises av <c6/>, som kontrollerer formattaggen og versjonen ved grensen i stedet for å feiltolke fremmed inndata i det stille.

seg-f7ae91002e56 = <b>Determinisme.</b> Konvolutten har <b>ingen tidsstempel</b> — det kreves av Kshanas reproduserbarhetsløfte (<c1/> reproduserer en kjøring). Proveniens ligger i <c2/> og i nyttelastens egen <c3/>.

seg-bb0b742d2df8 = En typet tilbakelesing (<c1/>) fungerer for enhver nyttelast som implementerer <c2/> (for eksempel <c3/>). Resultatartefakter kan bare serialiseres, etter utforming, og leses som den rå JSON-verdien <c4/>.

seg-87be7aa00b17 = Toppnivå (pakkene for klokke og bane)

seg-cc22d9206eb4 = Type / enhet

seg-3a821855c582 = Resultatskjemaets versjon (uavhengig av motorversjonen).

seg-cc6dded799f9 = Crate-versjonen (<c1/>) som laget filen.

seg-5a69a99b9a87 = heksadesimal streng

seg-441eb1f43399 = SHA-256 (SHA: Secure Hash Algorithm) over den kanoniske scenario-JSON-en — kjøringen kan reproduseres fra <c1/>.

seg-ba73ba76873e = Seed for RNG (tilfeldighetsgenerator) for kvantekjøringen (den klassiske bruker <c1/>).

seg-a688dd98c588 = nanosekunder

seg-24e0f04033fa = Tidsspesifikasjonen: en feil innenfor ±<c1/> er «innenfor spesifikasjonen».

seg-f52388753a1a = scenario

seg-15b4082a6455 = objekt (<c1/>)

seg-7d3b92769bf5 = Kvantesensorens kjøring (se nedenfor).

seg-aa665b955931 = Den klassiske sensorens kjøring, til sammenligning.

seg-152ae43896b3 = Kart over enhet og proveniens per felt for dette dokumentet, med feltsti som nøkkel. Se §Enheter og proveniens nedenfor.

seg-119bac9b3e6f = Verifikasjonsnivået til hvert oppgitte kvalitetsmål, og alltid dokumentets siste nøkkel. <c1/> lister én oppføring per mål som er til stede: <c2/> (for eksempel <c3/>), <c4/> (<c5/> = kontrollert mot en uavhengig ekstern referanse, <c6/> = fra første prinsipper, internt testet), <c7/> (raden i verifikasjonsmatrisen nivået leses fra) og <c8/>. <c9/> er <c10/>, med en <c11/>, for <c12/> i hvert scenario uten angrep konfigurert: grensen blir stående i <c13/>, men den svarer ikke på et spørsmål scenarioet stiller. <c14/> lister ethvert mål som ingen matriserad eier (posisjonsmålene for <c15/> og <c16/>), i stedet for å gi det et nivå. Gis ut av kind-ene <c17/> (enkeltkjøring og Monte Carlo-ensemble), <c18/>, <c19/> og <c20/>, som bygger det inne i kjøringen, og ({ "0.36" }, RM-04) av alle andre kind-er for hovedmålene sine, lagt til etter kjøringen fra tabellen per kind <c21/>; <c22/> fjerner det igjen til det ikke-nivåinndelte dokumentet byte for byte. Gis ikke ut av <c23/>, hvis resultat er en frosset forhåndsregistrert prediksjon (<c24/>): den kind-en har ingen <c25/> før en ny datert prediksjon erstatter den. Gis heller ikke ut av <c26/>, <c27/>, <c28/> ({ "0.37" }; matriser per sted), <c29/> og <c30/>, som ikke har noe skalart hovedmål, eller av <c31/>, hvis dokument er kompakt JSON (<c32/> gir hver begrunnelse), eller av de innebygde medlemsdokumentene i en kampanje. Inneholder ingen tall.

seg-1448f90f0086 = Geometrisammendrag for banepakken: <c1/>, <c2/>, <c3/> (m, det modellerte avstandsfeilbudsjettet per satellitt), <c4/> / <c5/> (dimensjonsløse) og <c6/> / <c7/> (m, PDOP (presisjonsfortynning i posisjon) × <c8/>). <b>Bare banepakken.</b>

seg-ae4f8eed06ac = matrise med <c1/> km, valgfri

seg-d13d827f54b0 = Propagert jordsentrert-inertielt spor for brukerens romfartøy, én oppføring per samplet tidspunkt. <b>Bare banepakken</b>; utelatt ellers. Bare utdata — ikke hashet.

seg-8f511d5de657 = objekt (<c1/>), valgfritt

seg-ea152e097d6f = Additive rapportmetadata (studietittel, genereringsstempel, forfatter, ansvarsfraskrivelse). Utelatt når de mangler, slik at en kjøring uten metadata er byte-identisk med eldre utdata. Bare utdata — ikke hashet.

seg-1041873fba1b = <c1/> (hver av <c2/> / <c3/>)

seg-3fa81140c10d = Sensoridentifikator (for eksempel <c1/>).

seg-80765d202558 = Modelltype (for eksempel <c1/>).

seg-6bf458d964fe = Sitat/kilde for sensorens parametere.

seg-9145f04a557f = De rå modellparametrene som ble brukt.

seg-697940342a28 = matrise med <c1/>

seg-b5f4216b55a2 = Tidsserie per steg: <c1/> sekunder, <c2/> tidsfeilen i <b>nanosekunder</b>, <c3/> én av <c4/>/<c5/>/<c6/>.

seg-7fba0b91b75e = objekt (<c1/>)

seg-5c4b60012f0e = De vurderte kvalitetsmålene (nedenfor).

seg-1308a29c6a5b = matrise med <c1/>

seg-bbd42065492c = Overlappende Allan-avvik: <c1/> midlingstiden (s), <c2/> den dimensjonsløse stabiliteten i brøkfrekvens σ_y(τ), <c3/> antall overlapp bak det punktet, <c4/> potenslovtypen identifisert fra MDEV-stigningen (modifisert Allan-avvik) (for eksempel <c5/>), <c6/> de støytypespesifikke effektive frihetsgradene og <c7/>/<c8/> det χ²-baserte { "95" }%-konfidensbåndet på <c9/> ved den τ. Beregnet i <c10/>.

seg-1e61fd18257f = Vurdering av Kalman-filterets konsistens (NIS/NEES (NIS: normalisert innovasjonskvadrat; NEES: normalisert estimeringsfeilkvadrat) mot χ²-båndene sine), beregnet i <c1/>; utelatt for kjøringer som ikke vurderer det.

seg-9333864652b0 = <c1/> (objektet <c2/>)

seg-ce9caeaefd87 = Forbehold

seg-b24de276d788 = RMS (kvadratisk middelverdi) for klokkefasefeil (tidssynkronisering) over bortfallet.

seg-53e5018ae276 = et <b>tidssynkroniseringsmål</b>, ikke posisjon

seg-8cdec6da2072 = 95-persentilen av tidsfeilen over bortfallet.

seg-95f058adb809 = Verste (korteste) coasting innenfor spesifikasjonen over bortfallssegmentene.

seg-48babfd3bd95 = <b>rutenettbegrenset</b> — en nedre grense ved tidstrinnets oppløsning

seg-41c08973baa1 = Vekstrate for |feil| under bortfallet etter minste kvadraters metode.

seg-707ee74c5c06 = brøk [{ "0,1" }]

seg-32e5fe6415f8 = Andelen av hele kjøringen med en løsning innenfor spesifikasjonen.

seg-361b3b923a45 = brøk [{ "0,1" }] eller null

seg-5d55682f9349 = <b>Filterets selvkonsistens</b>: andelen av bortfallssamplene der den sanne feilen holder seg innenfor Kalman-grensen k-σ.

seg-636106cb4a40 = <b>IKKE</b> integritet etter HPL/VPL/RAIM (HPL: horisontalt beskyttelsesnivå; VPL: vertikalt beskyttelsesnivå; RAIM: mottakerens autonome integritetsovervåking) — se <a1><c1/></a1>

seg-f686ade3da21 = <b>Analytisk grense for påviselighet av spoofing</b> fra klokkestabilitet.

seg-f8783db25141 = bare meningsfullt med et konfigurert angrep, så pakkene for klokke og bane (som ikke konfigurerer noe) merker det <c1/> i <c2/> og skriver det som <c3/> i sammendraget; <b>ikke</b> en RAIM-detektor for flere satellitter

seg-90e2980430b9 = Hvordan «bra» ser ut

seg-c1afc6f3c545 = En <b>roligere klokke</b> (lavere <c1/>) gir en lengre <c2/> og en høyere grense for påviselighet for <c3/> — det er kontrasten mellom kvante og klassisk.

seg-0fa38207813a = <c1/> nær { "1.0" } betyr at systemet holdt seg innenfor spesifikasjonen nesten hele kjøringen; under et langt bortfall synker den for den mer støyende klokken.

seg-4dcba241d5a6 = <c1/> nær { "1.0" } betyr at filterets egen usikkerhetsgrense var ærlig om feilen sin — en utsagn om <em>selvkonsistens</em>, ikke en garanti for liv og sikkerhet.

seg-3099d75a04a5 = Andre scenario-kind-er

seg-43cd9f67f384 = Hver av de andre kind-ene gir ut sin egen resultatform. Noen av de vanligste:

seg-6b59ef9dfe85 = <b>inertial</b>: kvalitetsmål i posisjonsdomenet i <b>meter</b> (<c1/>, <c2/>) — enkeltakset, enkelt seed (1-DOF (DOF: frihetsgrad)) (se <a1><c3/></a1>).

seg-3e3ec8985dde = <b>hybrid / fusion</b>: <c1/> og <c2/> på toppnivå, og per side tids- og posisjonsmålene for én sensorsuite (<c3/>, <c4/> og <c5/>, tiden til en av spesifikasjonene brytes), med en blokk <c6/> som i klokkepakken, der posisjonsmålene er oppført som <c7/>.

seg-e38e8a8adec8 = <b>spoof</b>: spoofingavvik per steg mot klokkens deteksjonsgrense, pluss om spoofingen nådde spesifikasjonen før deteksjon (<c1/>).

seg-dfd972d160e1 = <b>skyline</b> (<c1/> og <c2/> med <c3/>, <c4/>, <c5/>, <c6/>, <c7/>; bare til stede når scenarioet har en seksjon <c8/>, så et scenario uten den er uendret): et toppnivåobjekt <c9/> med <c10/> (streng: <c11/>, <c12/> eller <c13/>), <c14/> (brøk [{ "0,1" }] av den øvre halvkulens romvinkel over <c15/>) og <c16/> (streng); per sample <c17/> (antall satellitter over masken men bak horisontlinjen: <c18/> for <c19/> og <c20/>, <c21/> for <c22/>, <c23/> for <c24/>); og for <c25/> <c26/> (antall epoker). Enhetene og proveniensklassene deres står i blokken <c27/> (<c28/> <c29/>; <a1><c30/></a1>).

seg-d113122b7454 = For det nøyaktige feltsettet til en hvilken som helst kind, les oppføringen i <a1><c1/></a1> (nedenfor), kind-ens avsnitt i <a2><c2/></a2>, eller den tilsvarende structen <c3/> i <c4/>.

seg-e0c63207c019 = Andre filer en kjøring skriver

seg-cc97989ca06b = Ved siden av <c1/> skriver CLI (kommandolinjegrensesnittet) <c2/>, en utskriftsvennlig <c3/> og den samme rapporten som <c4/>, hvis blokk <c5/> registrerer motorversjonen, SHA-256 for scenariofilen, seed, plattformen og den nøyaktige kommandoen (se <a1><c6/></a1> og <a2><c7/></a2>). Kind-er som publiserer en reproduserbarhetstabell skriver også <c8/> (CSV: kommaseparerte verdier). <c9/> skriver utvekslingsfiler (se <a3><c10/></a3>) og <c11/> en animasjon (se <a4><c12/></a4>).

seg-489953601f3b = Enheter og proveniens, per felt, for hver kind

seg-61b33dbb44dd = Denne siden er håndskrevet og dekker pakkene for klokke og bane. Den maskinlesbare motparten dekker <b>hver</b> innebygde kind:

seg-1e20fcda7f0b = <b>I selve resultatet.</b> Hvert scenarios resultatdokument har et toppnivåobjekt <c1/> som kobler et utgitt felts sti til <c2/>. Stigrammatikken (en matrise bidrar med ett segment med suffikset <c3/> som deles av radene; <c4/> er et jokertegn for ett segment for datanøklede objekter) og det lukkede proveniensvokabularet er definert i <a1><c5/></a1>.

seg-b8256437c0b7 = Som én fil.

seg-ae7136e34306 = <a1><c1/></a1> er den innhøstede unionen: for hver kind, hvert numeriske felt den gir ut ved en oppgitt kilde, med enhet, proveniensklasse, evidensnivå og definisjon — og, navngitt i stedet for utelatt, hvert felt som ennå ikke har det. Blokken <c2/> bærer antallene.

seg-66af6dc065f7 = Begge håndheves av <c1/>, som kjører hver registrerte kind og feiler hvis et utgitt numerisk felt mangler enhet og proveniensklasse. Kind-er som ennå ikke er dekket nevnes enkeltvis i <c2/> i den filen med begrunnelsen for hver åpne, og antallet er festet slik at listen bare kan bli kortere.

seg-ca49a577a07b = Generer JSON-en på nytt etter enhver endring av en rapports form eller av en blokk <c1/>:

seg-ce4351cf7673 = <s1>Forrige</s1>Scenarioreferanse

seg-b988dcc329a4 = <s1>Neste</s1>Bruke reelle TLE-er

seg-6585c8a3643d = ClockRun (hver av quantum / classical)

seg-299f8a9643f1 = FoMScores (objektet fom)

seg-d17376a1ea92 = ({ "0.40" }) Bevismerkelappen for kjøringen: <c1/> (<c2/>, <c3/> eller <c4/>: den <em>svakeste</em> statusen blant radene, så den aldri hevder mer enn sin svakeste rad), <c5/> (<c6/>), <c7/> og <c8/>, én per verifikasjonsmatriserad kjøringen brukte (radene den avanserte rapporten lister, fra <c9/>): <c10/> (<c11/> og de første { "8" } heksadesimale sifrene av SHA-256 for radens kravtekst), <c12/> og <c13/>, alt lest fra matrisen, ingenting skrevet for hånd. Legges til av <c14/> i resultatet for hver type, før den avsluttende <c15/>-blokken når det finnes en (den blokken forblir siste nøkkel); <c16/> fjerner den byte for byte. Diagram-SVG-en og CSV-tabellen fra samme kjøring bærer den samme merkelappen (<c17/> og en synlig linje under diagrammet; <c18/>-kommentarlinjer foran CSV-en). Kampanjemedlemmer innebygd i resultatet til en annen type bærer ingen: det ytre dokumentet gjør det. Inneholder ingen tall.
