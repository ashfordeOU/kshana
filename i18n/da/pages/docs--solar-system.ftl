# docs--solar-system: translations (da)

seg-31a05429b836 = Legemer

seg-1c78d5337e16 = Pluto

seg-6cb7a787ac67 = Referencer

seg-6e0cb6acc073 = VALIDATED

seg-60cd077d82a7 = Model

seg-c5ce76c91ff7 = Mærkat

seg-430edd66bda0 = Ikke modelleret

seg-7670cf4ceda3 = Standard

seg-e0eb14018b2c = som ovenfor

seg-3dbc7ff9f5ab = Tabel

seg-9fe60d39f2db = Kilde: <c1/>

seg-c44439432020 = Solsystemet og positionering omkring andre legemer

seg-4d4ee55b5fb4 = To scenarietyper virker ud over Jord-Måne-systemet:

seg-fa202376da31 = <c1/> rapporterer hvert legeme i kataloget ved én epoke: position og hastighed, fysiske konstanter, lystid og afstand fra et observatørlegeme samt et banespor.

seg-9859aabbb4f4 = <c1/> placerer en navigationsbruger (en orbiter eller en landingsfarkost på overfladen) omkring ethvert katalogiseret legeme bortset fra Solen og Jorden, med en lokal navigationskonstellation og en valgfri dybderumsafstand fra Jorden.

seg-ec582fa8f67f = Typen <c1/> bruger det samme katalog til at bygge konstellationer omkring ethvert af disse legemer (<a1>CONSTELLATION-DESIGN.md</a1>).

seg-31f150c83173 = Kode: <c1/> (kataloget og dets konstanter), <c2/> (de analytiske efemerider), <c3/> (<c4/>, den udbyder, begge typer læser), <c5/> og <c6/> (typerne) og <c7/> (lystid, tovejsafstand og Shapiro-forsinkelsen). Tests: <c8/> og enhedstestene for hvert modul.

seg-3ce9aab4916e = Kataloget

seg-35cd9ebaf04e = Atten legemer: Solen, de otte planeter, Pluto, Månen, Phobos, Deimos, de fire galilæiske måner (Io, Europa, Ganymedes, Callisto) og Titan. Navne matches uden hensyn til store og små bogstaver. For hvert legeme indeholder <c1/> gravitationsparameteren GM, ækvatorial- og volumetrisk middelradius, den anden zonale harmoniske <c2/> og dens referenceradius, hvor en er publiceret, og den internationale astronomiske unions (IAU) model for pol og nulmeridian (siderisk rotationsperiode, negativ for en retrograd rotator). Hver værdi angiver sin kilde i koden.

seg-525b8b29345d = Hvor positionerne kommer fra

seg-0fd4c3af55ba = Merkur til Saturn og Jorden, fra tabel { "1" } ({ "1800" } e.Kr. til { "2050" } e.Kr.)

seg-9d820791a27b = Jet Propulsion Laboratorys (JPL) kepler-elementer af Standish og Williams, <a1>https://ssd.jpl.nasa.gov/planets/approx_pos.html</a1>

seg-d8549658ae99 = Alle otte planeter fra tabel 2a/2b ({ "3000" } f.Kr. til { "3000" } e.Kr.)

seg-1f0b417c3809 = den samme sides elementer for lange tidsrum

seg-bfe1c209044a = Uranus og Neptun fra tabel { "1" }

seg-ba5dfdd2de52 = rækken i tabel { "1" } fra { "1992" } (kun { "1800" } e.Kr. til { "2050" } e.Kr.; den nuværende side har fjernet den og angiver ingen fejl)

seg-001ca2ad22e1 = Månen

seg-6ff6068aeacf = Montenbruck og Gills månerække, der opdeler Jord-Måne-barycentret

seg-f906cffa45a2 = Phobos, Deimos, de galilæiske måner, Titan

seg-6ba84144ad88 = JPL's middelelementer med IAU's rotationsmodel

seg-d5640ad2cd08 = <c1/> (standarden) tager tabel { "1" } inden for { "1800" } e.Kr. til { "2050" } e.Kr. og tabel 2a/2b uden for; <c2/> og <c3/> gennemtvinger én. Pluto uden for sin tabel er en fejl, ikke en ekstrapolation. Epoken er en ISO { "8601" }-dato og -tid i Coordinated Universal Time (UTC), omregnet via Terrestrial Time (TT) med skudsekunderne til Barycentric Dynamical Time (TDB), eller en juliansk TDB-dato angivet direkte med <c4/>.

seg-912a2223e495 = Den uafhængige reference er JPL Horizons (<a1>https://ssd.jpl.nasa.gov/horizons/</a1>, Development Ephemeris DE441), med de forespurgte vektorer indskrevet under <c1/>. En planetrække er VALIDATED, hvor den holder sig inden for det dobbelte af Standish-sidens egen nominelle fejl. Målt af <c2/>:

seg-d8bbd5e4f483 = Tabel { "1" }, Merkur til Saturn og Jord-Måne-barycentret, { "12" } epoker fra { "1800" } til { "2049" }: værst { "1.87" } gange den nominelle fejl (Saturns afstand).

seg-18568cec6c91 = Tabel 2a/2b, alle otte planeter, { "15" } epoker fra omkring { "1000" } f.Kr. til { "2500" } e.Kr.: værst { "1.71" } gange (Mars' afstand).

seg-7f3aa4a24e8f = Uranus og Neptun fra tabel { "1" } overskrider sidens tal mod DE441: { "2.04" } og { "5.16" } gange den nominelle længdegradsfejl. De er fastholdt under seks gange og forbliver MODELLED.

seg-41d2f404224b = Pluto: inden for { "39.2" } buesekunder i længdegrad og { "1.14e9" } m i afstand.

seg-11c31908ba69 = Måner, værste vinkel set fra planeten over { "2000" } til { "2040" }: Phobos { "5.65" } grader, Deimos { "0.38" }, Io { "0.40" }, Europa { "1.63" }, Ganymedes { "0.22" }, Callisto { "0.27" }, Titan { "3.31" }. Den geocentriske Måne: { "0.046" } grader.

seg-24d36a3ce8d4 = Planeternes hastigheder: værste relative fejl { "3.72e-3" } af farten (MODELLED).

seg-0bae9b8d09ea = Månen og de syv måner er målt med fastholdte tærskler, men der findes ingen publiceret grænse at validere dem mod, så de er MODELLED.

seg-2cf791a940ea = De analytiske efemerider behøver ingen kernefil. En JPL Development Ephemeris-kerne (positioner af DE-klasse) læses kun af de separate krydsvalideringscrates under <c1/>, gennem den samme trait <c2/>; hovedcraten afhænger ikke af dem.

seg-5bff2c54125b = Input: <c1/> (standard 2026-01-01T00:{ "00" }:{ "00" }) eller <c2/>; <c3/> (standard alle atten); <c4/> (standard Jorden); <c5/> pr. bane ({ "8" } til { "2000" }, standard { "120" }); <c6/>; og et vilkårligt antal <c7/>, hver modtaget ved epoken.

seg-5787ece2c791 = Pr. legeme giver resultatet dets klasse og forælder, NASA Navigation and Ancillary Information Facility (NAIF)-identifikatoren, den heliocentriske position og hastighed i International Celestial Reference Frame (ICRF, ækvatorial J2000) i meter og meter pr. sekund, den ekliptiske længdegrad, breddegrad og afstand, positionen i forhold til forælderen, omløbstiden, konstanterne ovenfor, polen og nulmeridianen ved epoken, Standish' nominelle fejl, hvor en findes, dens etiket og metodestreng samt et banespor over én omdrejning (heliocentrisk for en planet, centreret på forælderen for en måne; ét enkelt punkt for Solen). Forbindelsen fra observatøren og hver ekstra forbindelse giver:

seg-36bad4b7b4ba = den newtonske envejs-lystid, løst af den radiometriske fikspunkts-lystidsløser med senderen ved sin retarderede position, og den tilsvarende envejsafstand;

seg-c5602eb76a05 = tovejs-lystiden og -afstanden;

seg-dab8e2db61d3 = Solens Shapiro-forsinkelse, rapporteret separat og ikke lagt til;

seg-90d00587a59f = vinklen til Solen.

seg-4c172f9f7cf6 = Lystiden er VALIDATED mod den envejs-lystid, Horizons rapporterer: Mars og Jupiter til Jordens centrum ved fire epoker fra { "2000" } til { "2040" }, værste fejl { "0.070" } s for Mars mod en tærskel på { "0.207" } s og { "1.31" } s for Jupiter mod { "4.04" } s. Tærsklen er det dobbelte af summen af Standish-afstandsfejlene for målet og Jord-Måne-barycentret, divideret med lysets hastighed: lystiden kan ikke blive bedre end positionerne. Det er den newtonske geometriske lystid, ikke en relativistisk eller plasmakorrigeret observabel.

seg-4f8cd6aef754 = Den medfølgende <c1/> rapporterer alle atten legemer ved 2026-09-28T00:{ "00" }:{ "00" } med spor på 180 punkter og tilføjer forbindelserne Mars til Jupiter (envejs { "2193.539" } s), Saturn til Jorden ({ "4212.176" } s) og Europa til Jupiter ({ "2.218" } s).

seg-d22cc535f04b = En bruger navigerer omkring et legeme valgt ved navn (ethvert katalogiseret legeme undtagen Solen og Jorden, som typen afviser) med to slags målinger:

seg-9eeb7f77aec7 = envejs-pseudoafstande fra en Walker-delta-navigationskonstellation omkring legemet (<c1/> gange <c2/>, inter-plan-faseforskydning <c3/>), fløjet som tolegemebaner med legemets egen sekulære drift fra <c4/>; brugerens ur er ukendt, så disse rækker har en kolonne for urbias;

seg-56ac318f6f27 = eventuelt en tovejsafstand fra Jordens centrum (<c1/>), som ikke behøver noget brugerur og rapporteres som en envejsafstand med sin egen støj. Jordens retning og afstand kommer fra den analytiske efemeride ved hver epoke.

seg-551d44492aae = En sigtelinje er blokeret, når den passerer inden for legemets middelradius (korde-testen for typen <c1/>), og en overfladebruger har også brug for elevationsmasken. Ved hver epoke danner kørslen den geometriske og positionelle præcisionsfortynding (GDOP, PDOP) for konstellationen alene, den formelle én-sigma-positionsusikkerhed med og uden Jord-rækken og en seedet Gauss-Newton-mindste-kvadraters positionsbestemmelse begge veje, så rapporten viser, hvad dybderumsforbindelsen tilfører.

seg-6f1161567330 = øverste niveau

seg-432421ccb9d7 = 2027-02-19T00:{ "00" }:{ "00" }, en Mars-opposition

seg-0b688042ed44 = { "86 400" } s, { "600" } s

seg-c7b3aaecd6e2 = <c1/> (eller <c2/>)

seg-c452a6f7a9d4 = orbiter: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>

seg-67f7b23bf604 = { "400" } km, { "75" } grader, { "0" }, { "0" }, { "0" }

seg-b412b65733d8 = overflade: <c1/>, <c2/>, <c3/>

seg-7639d2583131 = tre middelradier

seg-fe4a8d9da406 = { "60" } grader

seg-7ac449fb9569 = { "1" } m

seg-128c4a5edd9b = <c1/> (overfladebruger)

seg-3d4b760f6ed6 = { "10" } grader

seg-498493929023 = sand, { "1" } m

seg-18e477dc7f02 = <c1/> er den rette opstigning af den opstigende knude i legemets ækvatorialsystem og <c2/> breddeargumentet ved epoken.

seg-a743b0b5e668 = De to medfølgende scenarier, som de kører med kshana { "0.36" } (portabel matematik, den samme på alle platforme):

seg-b24010bdb302 = Bruger

seg-cb9cd741ba85 = orbiter, { "300" } km, { "93" } grader

seg-fa11e61f0d1d = overflade, { "20" } grader N, { "60" } grader Ø

seg-e17a9ae6905c = Relæer

seg-359db3c9ad19 = { "12" } ved { "10 000" } km, { "60" } grader

seg-1bb041045be4 = { "12" } ved { "4500" } km, { "55" } grader, maske på { "10" } grader

seg-604aefd62668 = Tidsrum

seg-825603e2fbed = ét sol, { "296" } epoker

seg-372159825c11 = { "306 822" } s, { "171" } epoker

seg-132e3bbcc94c = Jordens lystid, envejs / rundtur

seg-76351e2f75f8 = { "338.3" } s / { "676.6" } s

seg-2d0234ec6301 = { "2182.9" } s / { "4365.8" } s

seg-d0f05f440103 = Jorden i sigte

seg-d7ad84776ec6 = { "0.811" } af epokerne

seg-44bf83b16660 = Tilgængelighed, kun relæer / med Jord-afstanden

seg-07e0a8499670 = Median-PDOP

seg-e802f5920237 = RMS af positionsfejl, kun relæer / med Jord-afstanden

seg-ed769d9370a0 = { "1.883" } m / { "1.629" } m

seg-873187e2b016 = { "112.742" } m / { "86.499" } m

seg-bcba58871d0b = Median af formel sigma, kun relæer / med Jord-afstanden

seg-536757d9f141 = { "1.375" } m / { "1.304" } m

seg-14d7b5dc82e8 = { "5.360" } m / { "4.239" } m

seg-67d3d30060ad = (RMS: rodmiddelkvadrat.) Én Europa-epoke (t = { "16 200" } s) ligger på tilgængelighedens kant, hvor den sidste bit af en beregnet radius afgør, om dens positionsbestemmelse med Jord-afstand lykkes. Før { "0.36" } afgjorde værtens matematikbibliotek det, så det samme scenarie udskrev { "0.719" } og { "86.147" } m på Linux x86-64 og { "0.725" } og { "85.800" } m på macOS arm64 for de to tal "med Jord-afstanden". Siden { "0.36" } beregnes hver transcendent funktion af det portable matematikbibliotek, epoken afgøres på én måde på alle platforme (native og WebAssembly giver de samme bytes), og tallene er { "0.713" } og { "86.499" } m (<a1><c1/></a1>). Omkring Europa løfter Jord-afstanden tilgængeligheden fra { "0.480" } til { "0.713" } af epokerne. Hvor Jorden aldrig klarer randen, tilfører forbindelsen intet: en landingsfarkost ved { "89.5" } grader S på Månen under en relæskal med 12 satellitter på { "5000" } km har Jorden i sigte ved { "0" } af { "145" } epoker, og dens fejl er de samme med og uden forbindelsen.

seg-41507568efb8 = <b>MODELLED.</b> Relæbanerne ser bort fra tredjelegemer (Jupiters træk i relæer omkring Europa er ikke modelleret), støjen er gaussisk på de angivne niveauer, og målemodellen er øjeblikkelig, ikke lystidsforsinket. Hvad der kontrolleres: relæets omløbstid mod Keplers tredje lov for legemet, en orbiter, der holder sin radius, og en landingsfarkost på overfladen, at Jord-afstanden aldrig forværrer den formelle usikkerhed, at de seedede positionsfejl stemmer med den formelle sigma (rodmiddelkvadrat af fejl over sigma i [{ "0.6" }, { "1.5" }]) og en deterministisk kørsel. Intet af dette er en missions navigationsdata.

seg-b78c9e331a43 = Typen <c1/>

seg-b9f40c641a49 = På trods af navnet er <c1/> en jordsatellittype: én satellit, fra et to-linjers elementsæt (TLE) gennem propagatoren Simplified General Perturbations { "4" } (SGP4) eller fra en analytisk bane, over et tidsgitter. Ved hvert trin udsender den den inertiale tilstand (position og hastighed) i rammen true equator, mean equinox (TEME) og i Geocentric Celestial Reference System (GCRS), den jordfaste position, World Geodetic System { "1984" } (WGS { "84" })-undersatellitpunktet og, for en valgfri jordstation, azimut, elevation, afstand og afstandsrate. <c2/> tager teksten fra en International Earth Rotation and Reference Systems Service (IERS)-fil <c3/> for UT1−UTC og polbevægelse pr. epoke. Kode: <c4/>.

seg-1babcba7b4ba = Relativistiske lystidsled ud over den separat rapporterede Shapiro-forsinkelse og den solare plasmaforsinkelse.

seg-0c49dfc777ca = Positioner bedre end den Standish- og middelelementnøjagtighed, der er angivet ovenfor; der er ingen kerneindlæser i hovedcraten.

seg-18d925e53ce0 = Tredjelegemeforstyrrelser på relæer i <c1/> og på baner i <c2/>.

seg-3968ed54e3fe = Terræn på ethvert legeme: et legeme er sin middelkugle.

seg-4650526c532e = Interoperabilitetseksport: CZML, KML og GeoJSON beskriver positioner omkring Jorden, så scenarierne <c1/> og <c2/> eksporterer ingen (<a1>INTEROP.md</a1>).

seg-cb7e3d4bf5aa = E. M. Standish og J. G. Williams, "Keplerian Elements for Approximate Positions of the Major Planets," JPL Solar System Dynamics, <a1>https://ssd.jpl.nasa.gov/planets/approx_pos.html</a1>.

seg-aaf6a1f91c1a = O. Montenbruck og E. Gill, <em>Satellite Orbits: Models, Methods and Applications</em>, Springer, { "2000" }, §{ "3.3.2" }.

seg-8b7aa3bb95f0 = B. A. Archinal et al., "Report of the IAU Working Group on Cartographic Coordinates and Rotational Elements: { "2015" }," <em>Celestial Mechanics and Dynamical Astronomy</em> { "130" }, { "2018" }.

seg-10c8408cab27 = JPL Horizons, <a1>https://ssd.jpl.nasa.gov/horizons/</a1>.

seg-e95a41f0ded7 = <s1>Forrige</s1>Validering af kraftmodeller

seg-a801b99f7040 = <s1>Næste</s1>Månereferencestation

seg-e0aba02258f4 = Typen ephemeris
