# docs--solar-system: translations (nb)

seg-31a05429b836 = Legemer

seg-1c78d5337e16 = Pluto

seg-6cb7a787ac67 = Referanser

seg-6e0cb6acc073 = VALIDATED

seg-60cd077d82a7 = Modell

seg-c5ce76c91ff7 = Merkelapp

seg-430edd66bda0 = Ikke modellert

seg-7670cf4ceda3 = Standard

seg-e0eb14018b2c = som ovenfor

seg-3dbc7ff9f5ab = Tabell

seg-9fe60d39f2db = Kilde: <c1/>

seg-c44439432020 = Solsystemet og posisjonering rundt andre legemer

seg-4d4ee55b5fb4 = To scenario-kind-er fungerer utenfor jord-måne-systemet:

seg-fa202376da31 = <c1/> rapporterer hvert legeme i katalogen ved én epoke: posisjon og hastighet, fysiske konstanter, lystid og avstand fra et observatørlegeme, og et banespor.

seg-9859aabbb4f4 = <c1/> plasserer en navigasjonsbruker (et fartøy i bane eller en lander på overflaten) rundt et hvilket som helst kataloglegeme unntatt Solen og Jorden, med en lokal navigasjonskonstellasjon og en valgfri dypromsavstand fra Jorden.

seg-ec582fa8f67f = Kind-en <c1/> bruker den samme katalogen til å bygge konstellasjoner rundt hvert av disse legemene (<a1>CONSTELLATION-DESIGN.md</a1>).

seg-31f150c83173 = Kode: <c1/> (katalogen og konstantene), <c2/> (de analytiske efemeridene), <c3/> (<c4/>, leverandøren begge kind-ene leser), <c5/> og <c6/> (kind-ene) og <c7/> (lystid, toveis avstand og Shapiro-forsinkelsen). Tester: <c8/> og enhetstestene til hver modul.

seg-3ce9aab4916e = Katalogen

seg-35cd9ebaf04e = Atten legemer: Solen, de åtte planetene, Pluto, Månen, Phobos, Deimos, de fire galileiske månene (Io, Europa, Ganymedes, Callisto) og Titan. Navn sammenlignes uten hensyn til store og små bokstaver. For hvert legeme har <c1/> gravitasjonsparameteren GM, ekvatorial og volumetrisk middelradius, den andre sonale harmoniske <c2/> og dens referanseradius der en er publisert, og modellen til International Astronomical Union (IAU) for pol og nullmeridian (siderisk rotasjonsperiode, negativ for en retrograd rotator). Hver verdi viser til sin kilde i koden.

seg-525b8b29345d = Hvor posisjonene kommer fra

seg-0fd4c3af55ba = Merkur til Saturn og Jorden, fra tabell { "1" } ({ "1800" } e.Kr. til { "2050" } e.Kr.)

seg-9d820791a27b = Keplerelementer fra Jet Propulsion Laboratory (JPL) av Standish og Williams, <a1>https://ssd.jpl.nasa.gov/planets/approx_pos.html</a1>

seg-d8549658ae99 = Alle åtte planetene fra tabell 2a/2b ({ "3000" } f.Kr. til { "3000" } e.Kr.)

seg-1f0b417c3809 = elementene for lang tidsperiode fra den samme siden

seg-bfe1c209044a = Uranus og Neptun fra tabell { "1" }

seg-ba5dfdd2de52 = raden i tabell { "1" } fra { "1992" } (bare { "1800" } e.Kr. til { "2050" } e.Kr.; den nåværende siden har fjernet den og oppgir ingen feil)

seg-001ca2ad22e1 = Månen

seg-6ff6068aeacf = månerekken til Montenbruck og Gill, med deling av jord-måne-barysenteret

seg-f906cffa45a2 = Phobos, Deimos, de galileiske månene, Titan

seg-6ba84144ad88 = JPL-middelelementer med IAUs rotasjonsmodell

seg-d5640ad2cd08 = <c1/> (standard) bruker tabell { "1" } innenfor { "1800" } e.Kr. til { "2050" } e.Kr. og tabell 2a/2b utenfor; <c2/> og <c3/> tvinger frem én. Pluto utenfor sin tabell er en feil, ikke en ekstrapolering. Epoken er en dato og et klokkeslett i ISO { "8601" } i koordinert universaltid (UTC), omregnet via terrestrisk tid (TT) med skuddsekundene til barysentrisk dynamisk tid (TDB), eller en juliansk dato i TDB gitt direkte med <c4/>.

seg-912a2223e495 = Referansen er JPL Horizons (<a1>https://ssd.jpl.nasa.gov/horizons/</a1>, Development Ephemeris DE441), med de spurte vektorene sjekket inn under <c1/>. En planetrad er VALIDATED der den holder seg innenfor det dobbelte av Standish-sidens egen nominelle feil. Målt av <c2/>:

seg-d8bbd5e4f483 = Tabell { "1" }, Merkur til Saturn og jord-måne-barysenteret, { "12" } epoker fra { "1800" } til { "2049" }: verst { "1.87" } ganger den nominelle feilen (Saturns avstand).

seg-18568cec6c91 = Tabell 2a/2b, alle åtte planetene, { "15" } epoker fra omtrent { "1000" } f.Kr. til { "2500" } e.Kr.: verst { "1.71" } ganger (Mars' avstand).

seg-7f3aa4a24e8f = Tabell { "1" } for Uranus og Neptun overskrider sidens tall mot DE441: { "2.04" } og { "5.16" } ganger den nominelle lengdefeilen. De er festet under seks ganger og forblir MODELLED.

seg-41d2f404224b = Pluto: innenfor { "39.2" } buesekunder i lengde og { "1.14e9" } m i avstand.

seg-11c31908ba69 = Måner, verste vinkel sett fra planeten over { "2000" } til { "2040" }: Phobos { "5.65" } grader, Deimos { "0.38" }, Io { "0.40" }, Europa { "1.63" }, Ganymedes { "0.22" }, Callisto { "0.27" }, Titan { "3.31" }. Den geosentriske Månen: { "0.046" } grader.

seg-24d36a3ce8d4 = Planethastigheter: verste relative feil { "3.72e-3" } av farten (MODELLED).

seg-0bae9b8d09ea = Månen og de sju månene er målt med festede terskler, men det finnes ingen publisert grense å validere dem mot, så de er MODELLED.

seg-2cf791a940ea = De analytiske efemeridene trenger ingen kjernefil. En JPL Development Ephemeris-kjerne (posisjoner av DE-klasse) leses bare av de separate krysskontroll-cratene under <c1/>, gjennom det samme traitet <c2/>; hovedcraten avhenger ikke av dem.

seg-5bff2c54125b = Inndata: <c1/> (standard 2026-01-01T00:{ "00" }:{ "00" }) eller <c2/>; <c3/> (standard alle atten); <c4/> (standard Jorden); <c5/> per bane ({ "8" } til { "2000" }, standard { "120" }); <c6/>; og et hvilket som helst antall <c7/>, hver mottatt ved epoken.

seg-5787ece2c791 = Per legeme gir resultatet klasse og forelder, identifikatoren fra NASA Navigation and Ancillary Information Facility (NAIF), den heliosentriske posisjonen og hastigheten i International Celestial Reference Frame (ICRF, ekvatorial J2000) i meter og meter per sekund, ekliptisk lengde, bredde og avstand, posisjonen relativt til forelderen, omløpsperioden, konstantene ovenfor, polen og nullmeridianen ved epoken, den nominelle Standish-feilen der en finnes, merkelappen og metodestrengen, og et banespor over én omdreining (heliosentrisk for en planet, sentrert på forelderen for en måne; ett enkelt punkt for Solen). Lenken fra observatøren, og hver ekstra lenke, gir:

seg-36bad4b7b4ba = den newtonske enveis lystiden, løst av den radiometriske fikspunktløseren for lystid med senderen i sin retarderte posisjon, og den tilsvarende enveis avstanden;

seg-c5602eb76a05 = den toveis lystiden og avstanden;

seg-dab8e2db61d3 = Solens Shapiro-forsinkelse, rapportert separat og ikke lagt til;

seg-90d00587a59f = vinkelen til Solen.

seg-4c172f9f7cf6 = Lystiden er VALIDATED mot enveis lystiden Horizons oppgir: Mars og Jupiter til Jordens sentrum ved fire epoker fra { "2000" } til { "2040" }, verste feil { "0.070" } s for Mars mot en terskel på { "0.207" } s og { "1.31" } s for Jupiter mot { "4.04" } s. Terskelen er det dobbelte av summen av Standish-avstandsfeilene til målet og jord-måne-barysenteret, delt på lysets hastighet: lystiden kan ikke bli bedre enn posisjonene. Det er den newtonske geometriske lystiden, ikke en relativistisk eller plasmakorrigert observabel.

seg-4f8cd6aef754 = Den medfølgende <c1/> rapporterer alle atten legemer ved 2026-09-28T00:{ "00" }:{ "00" } med spor på 180 punkter, og legger til lenkene Mars-til-Jupiter (enveis { "2193.539" } s), Saturn-til-Jorden ({ "4212.176" } s) og Europa-til-Jupiter ({ "2.218" } s).

seg-d22cc535f04b = En bruker navigerer rundt et legeme valgt med navn (et hvilket som helst kataloglegeme unntatt Solen og Jorden, som kind-en avviser) med to typer målinger:

seg-9eeb7f77aec7 = enveis pseudoavstander fra en Walker-delta-navigasjonskonstellasjon rundt legemet (<c1/> ganger <c2/>, faseforskyvning mellom plan <c3/>), fløyet som banebevegelse med to legemer med legemets egen sekulære drift <c4/>; brukerklokken er ukjent, så disse radene har en kolonne for klokkebias;

seg-56ac318f6f27 = eventuelt en toveis avstand fra Jordens sentrum (<c1/>), som ikke trenger noen brukerklokke og rapporteres som en enveis avstand med sin egen støy. Jordens retning og avstand kommer fra den analytiske efemeriden ved hver epoke.

seg-551d44492aae = En siktelinje er blokkert når den går innenfor legemets middelradius (korde-testen i kind-en <c1/>), og en overflatebruker trenger også elevasjonsmasken. Ved hver epoke danner kjøringen den geometriske og posisjonsmessige presisjonsfortynningen (GDOP, PDOP) for konstellasjonen alene, den formelle enkeltsigma posisjonsusikkerheten med og uten Jord-raden, og en seedet Gauss-Newton-posisjonsbestemmelse med minste kvadraters metode for hver, slik at rapporten viser hva dypromslenken tilfører.

seg-6f1161567330 = toppnivå

seg-432421ccb9d7 = 2027-02-19T00:{ "00" }:{ "00" }, en Mars-opposisjon

seg-0b688042ed44 = { "86 400" } s, { "600" } s

seg-c7b3aaecd6e2 = <c1/> (eller <c2/>)

seg-c452a6f7a9d4 = orbiter: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>

seg-67f7b23bf604 = { "400" } km, { "75" } grader, { "0" }, { "0" }, { "0" }

seg-b412b65733d8 = surface: <c1/>, <c2/>, <c3/>

seg-7639d2583131 = tre middelradier

seg-fe4a8d9da406 = { "60" } grader

seg-7ac449fb9569 = { "1" } m

seg-128c4a5edd9b = <c1/> (overflatebruker)

seg-3d4b760f6ed6 = { "10" } grader

seg-498493929023 = true, { "1" } m

seg-18e477dc7f02 = <c1/> er rektascensjonen til den stigende noden i legemets ekvatorialsystem og <c2/> breddeargumentet ved epoken.

seg-a743b0b5e668 = De to medfølgende scenarioene, slik de kjører med kshana { "0.36" } (portabel matematikk, den samme på alle plattformer):

seg-b24010bdb302 = Bruker

seg-cb9cd741ba85 = orbiter, { "300" } km, { "93" } grader

seg-fa11e61f0d1d = overflate, { "20" } grader N, { "60" } grader Ø

seg-e17a9ae6905c = Reléer

seg-359db3c9ad19 = { "12" } ved { "10 000" } km, { "60" } grader

seg-1bb041045be4 = { "12" } ved { "4500" } km, { "55" } grader, maske på { "10" } grader

seg-604aefd62668 = Varighet

seg-825603e2fbed = ett Mars-døgn (sol), { "296" } epoker

seg-372159825c11 = { "306 822" } s, { "171" } epoker

seg-132e3bbcc94c = Lystid til Jorden, enveis / tur-retur

seg-76351e2f75f8 = { "338.3" } s / { "676.6" } s

seg-2d0234ec6301 = { "2182.9" } s / { "4365.8" } s

seg-d0f05f440103 = Jorden i sikte

seg-d7ad84776ec6 = { "0.811" } av epokene

seg-44bf83b16660 = Tilgjengelighet, bare reléer / med Jord-avstanden

seg-07e0a8499670 = Median PDOP

seg-e802f5920237 = RMS for posisjonsfeil, bare reléer / med Jord-avstanden

seg-ed769d9370a0 = { "1.883" } m / { "1.629" } m

seg-873187e2b016 = { "112.742" } m / { "86.499" } m

seg-bcba58871d0b = Median formell sigma, bare reléer / med Jord-avstanden

seg-536757d9f141 = { "1.375" } m / { "1.304" } m

seg-14d7b5dc82e8 = { "5.360" } m / { "4.239" } m

seg-67d3d30060ad = (RMS: kvadratisk middelverdi.) Én Europa-epoke (t = { "16 200" } s) ligger på kanten av tilgjengelighet, der den siste biten i en beregnet radius avgjør om posisjonsbestemmelsen med Jord-avstand blir gjort. Før { "0.36" } avgjorde vertens matematikkbibliotek det, så det samme scenarioet skrev ut { "0.719" } og { "86.147" } m på Linux x86-64 og { "0.725" } og { "85.800" } m på macOS arm64 for de to tallene «med Jord-avstanden». Siden { "0.36" } beregnes hver transcendentale funksjon av det portable matematikkbiblioteket, epoken løses på én måte på alle plattformer (native og WebAssembly gir de samme bytene), og tallene er { "0.713" } og { "86.499" } m (<a1><c1/></a1>). Rundt Europa løfter Jord-avstanden tilgjengeligheten fra { "0.480" } til { "0.713" } av epokene. Der Jorden aldri kommer fri av limben, tilfører lenken ingenting: en lander ved { "89.5" } grader S på Månen under et skall med 12 satellitter og { "5000" } km reléer har Jorden i sikte ved { "0" } av { "145" } epoker, og feilene er de samme med og uten lenken.

seg-41507568efb8 = <b>MODELLED.</b> Relébanene ser bort fra tredje legemer (Jupiters trekk på reléer rundt Europa er ikke modellert), støyen er gaussisk på de oppgitte nivåene og målemodellen er øyeblikkelig, ikke lystidsretardert. Det som kontrolleres: reléperioden mot Keplers tredje lov for legemet, en orbiter som beholder sin radius og en lander på overflaten, at Jord-avstanden aldri forverrer den formelle usikkerheten, at de seedede posisjonsfeilene stemmer med den formelle sigmaen (kvadratisk middelverdi av feil over sigma i [{ "0.6" }, { "1.5" }]), og en deterministisk kjøring. Ingenting av dette er et oppdrags navigasjonsdata.

seg-b78c9e331a43 = Kind-en <c1/>

seg-b9f40c641a49 = Til tross for navnet er <c1/> en kind for jordsatellitter: én satellitt, fra et to-linjers elementsett (TLE) gjennom propagatoren Simplified General Perturbations { "4" } (SGP4) eller fra en analytisk bane, over et tidsrutenett. Ved hvert steg gir den ut den inertielle tilstanden (posisjon og hastighet) i rammen true equator, mean equinox (TEME) og i Geocentric Celestial Reference System (GCRS), den jordfaste posisjonen, sub-satellittpunktet i World Geodetic System { "1984" } (WGS { "84" }) og, for en valgfri bakkestasjon, asimut, elevasjon, avstand og avstandsrate. <c2/> tar teksten i en <c3/>-fil fra International Earth Rotation and Reference Systems Service (IERS) for UT1−UTC og polbevegelse per epoke. Kode: <c4/>.

seg-1babcba7b4ba = Relativistiske lystidsledd utover den separat rapporterte Shapiro-forsinkelsen, og solplasmaforsinkelsen.

seg-0c49dfc777ca = Posisjoner bedre enn Standish- og middelelementnøyaktigheten oppgitt ovenfor; hovedcraten har ingen kjernelesere.

seg-18d925e53ce0 = Forstyrrelser fra tredje legemer på <c1/>-reléer og på <c2/>-baner.

seg-3968ed54e3fe = Terreng på et hvilket som helst legeme: et legeme er sin middelkule.

seg-4650526c532e = Eksport for interoperabilitet: CZML, KML og GeoJSON beskriver posisjoner rundt Jorden, så scenarioene <c1/> og <c2/> eksporterer ingen (<a1>INTEROP.md</a1>).

seg-cb7e3d4bf5aa = E. M. Standish og J. G. Williams, «Keplerian Elements for Approximate Positions of the Major Planets», JPL Solar System Dynamics, <a1>https://ssd.jpl.nasa.gov/planets/approx_pos.html</a1>.

seg-aaf6a1f91c1a = O. Montenbruck og E. Gill, <em>Satellite Orbits: Models, Methods and Applications</em>, Springer, { "2000" }, §{ "3.3.2" }.

seg-8b7aa3bb95f0 = B. A. Archinal et al., «Report of the IAU Working Group on Cartographic Coordinates and Rotational Elements: { "2015" }», <em>Celestial Mechanics and Dynamical Astronomy</em> { "130" }, { "2018" }.

seg-10c8408cab27 = JPL Horizons, <a1>https://ssd.jpl.nasa.gov/horizons/</a1>.

seg-e95a41f0ded7 = <s1>Forrige</s1>Validering av kraftmodellen

seg-a801b99f7040 = <s1>Neste</s1>Månens referansestasjon

seg-e0aba02258f4 = Efemeridetypen
