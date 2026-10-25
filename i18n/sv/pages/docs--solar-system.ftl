# docs--solar-system: translations (sv)

seg-31a05429b836 = Kroppar

seg-1c78d5337e16 = Pluto

seg-6cb7a787ac67 = Referenser

seg-6e0cb6acc073 = VALIDATED

seg-60cd077d82a7 = Modell

seg-c5ce76c91ff7 = Etikett

seg-430edd66bda0 = Inte modellerat

seg-7670cf4ceda3 = Standardvärde

seg-e0eb14018b2c = som ovan

seg-3dbc7ff9f5ab = Tabell

seg-9fe60d39f2db = Källa: <c1/>

seg-c44439432020 = Solsystemet och positionering kring andra himlakroppar

seg-4d4ee55b5fb4 = Två scenariotyper fungerar bortom systemet jorden–månen:

seg-fa202376da31 = <c1/> redovisar varje kropp i katalogen vid en epok: position och hastighet, fysikaliska konstanter, ljustid och avstånd från en observatörskropp, samt ett banspår.

seg-9859aabbb4f4 = <c1/> placerar en navigationsanvändare (en omloppare eller en ytlandare) kring vilken katalogkropp som helst utom Solen och Jorden, med en lokal navigationskonstellation och ett valfritt djuprymdsavstånd från Jorden.

seg-ec582fa8f67f = Typen <c1/> använder samma katalog för att bygga konstellationer kring någon av dessa kroppar (<a1>CONSTELLATION-DESIGN.md</a1>).

seg-31f150c83173 = Kod: <c1/> (katalogen och dess konstanter), <c2/> (de analytiska efemeriderna), <c3/> (<c4/>, leverantören som båda typerna läser), <c5/> och <c6/> (typerna) och <c7/> (ljustid, tvåvägsavstånd och Shapiro-fördröjningen). Tester: <c8/> och enhetstesterna för varje modul.

seg-3ce9aab4916e = Katalogen

seg-35cd9ebaf04e = Arton kroppar: Solen, de åtta planeterna, Pluto, Månen, Phobos, Deimos, de fyra galileiska månarna (Io, Europa, Ganymedes, Callisto) och Titan. Namn matchas utan hänsyn till skiftläge. För var och en bär <c1/> gravitationsparametern GM, ekvatorial och volymetrisk medelradie, den andra zonala harmoniska <c2/> och dess referensradie där en är publicerad, samt International Astronomical Union (IAU) modell för pol och nollmeridian (siderisk rotationsperiod, negativ för en retrograd rotator). Varje värde anger sin källa i koden.

seg-525b8b29345d = Varifrån positionerna kommer

seg-0fd4c3af55ba = Merkurius till Saturnus och Jorden, från tabell { "1" } ({ "1800" } e.Kr. till { "2050" } e.Kr.)

seg-9d820791a27b = Keplerelement från Jet Propulsion Laboratory (JPL) av Standish och Williams, <a1>https://ssd.jpl.nasa.gov/planets/approx_pos.html</a1>

seg-d8549658ae99 = Alla åtta planeter från tabellerna 2a/2b ({ "3000" } f.Kr. till { "3000" } e.Kr.)

seg-1f0b417c3809 = samma sidas långtidselement

seg-bfe1c209044a = Uranus och Neptunus från tabell { "1" }

seg-ba5dfdd2de52 = raden i tabell { "1" } från { "1992" } (bara { "1800" } e.Kr. till { "2050" } e.Kr.; den nuvarande sidan har tagit bort den och anger inget fel)

seg-001ca2ad22e1 = Månen

seg-6ff6068aeacf = Montenbruck och Gills månserie, med delning av jord–måne-barycentret

seg-f906cffa45a2 = Phobos, Deimos, de galileiska månarna, Titan

seg-6ba84144ad88 = JPL:s medelelement med IAU:s rotationsmodell

seg-d5640ad2cd08 = <c1/> (standard) tar tabell { "1" } inom { "1800" } e.Kr. till { "2050" } e.Kr. och tabellerna 2a/2b utanför; <c2/> och <c3/> tvingar fram en. Pluto utanför sin tabell är ett fel, inte en extrapolering. Epoken är ett datum och en tid enligt ISO { "8601" } i Coordinated Universal Time (UTC), omvandlad via Terrestrial Time (TT) med skottsekunderna till Barycentric Dynamical Time (TDB), eller ett Julianskt datum i TDB angivet direkt med <c4/>.

seg-912a2223e495 = Den oberoende referensen är JPL Horizons (<a1>https://ssd.jpl.nasa.gov/horizons/</a1>, Development Ephemeris DE441), med de efterfrågade vektorerna incheckade under <c1/>. En planetrad är VALIDATED där den håller sig inom två gånger Standish-sidans eget nominella fel. Uppmätt av <c2/>:

seg-d8bbd5e4f483 = Tabell { "1" }, Merkurius till Saturnus och jord–måne-barycentret, { "12" } epoker från { "1800" } till { "2049" }: sämst { "1.87" } gånger det nominella felet (Saturnus avstånd).

seg-18568cec6c91 = Tabellerna 2a/2b, alla åtta planeter, { "15" } epoker från cirka { "1000" } f.Kr. till { "2500" } e.Kr.: sämst { "1.71" } gånger (Mars avstånd).

seg-7f3aa4a24e8f = Uranus och Neptunus i tabell { "1" } överskrider sidans värden mot DE441: { "2.04" } och { "5.16" } gånger det nominella longitudfelet. De är fastlåsta under sex gånger och förblir MODELLED.

seg-41d2f404224b = Pluto: inom { "39.2" } bågsekunder i longitud och { "1.14e9" } m i avstånd.

seg-11c31908ba69 = Månar, sämsta vinkel sedd från planeten över { "2000" } till { "2040" }: Phobos { "5.65" } grader, Deimos { "0.38" }, Io { "0.40" }, Europa { "1.63" }, Ganymedes { "0.22" }, Callisto { "0.27" }, Titan { "3.31" }. Den geocentriska Månen: { "0.046" } grader.

seg-24d36a3ce8d4 = Planethastigheter: sämsta relativa fel { "3.72e-3" } av farten (MODELLED).

seg-0bae9b8d09ea = Månen och de sju månarna är mätta med fastlåsta trösklar, men det finns ingen publicerad gräns att validera dem mot, så de är MODELLED.

seg-2cf791a940ea = De analytiska efemeriderna behöver ingen kernelfil. En JPL Development Ephemeris-kernel (positioner av DE-klass) läses bara av de separata korsvalideringscraten under <c1/>, genom samma trait <c2/>; huvudcraten är inte beroende av dem.

seg-5bff2c54125b = Indata: <c1/> (standard 2026-01-01T00:{ "00" }:{ "00" }) eller <c2/>; <c3/> (standard alla arton); <c4/> (standard Jorden); <c5/> per bana ({ "8" } till { "2000" }, standard { "120" }); <c6/>; och valfritt antal <c7/>, var och en mottagen vid epoken.

seg-5787ece2c791 = Per kropp ger resultatet dess klass och moder, identifieraren från NASA Navigation and Ancillary Information Facility (NAIF), den heliocentriska positionen och hastigheten i International Celestial Reference Frame (ICRF, ekvatoriell J2000) i meter och meter per sekund, ekliptikal longitud, latitud och avstånd, positionen relativt sin moder, omloppsperioden, konstanterna ovan, polen och nollmeridianen vid epoken, Standishs nominella fel där ett finns, dess etikett och metodsträng, samt ett banspår över ett varv (heliocentriskt för en planet, centrerat på modern för en måne; en enda punkt för Solen). Länken från observatören, och varje extra länk, ger:

seg-36bad4b7b4ba = den newtonska enkelriktade ljustiden, löst av den radiometriska fixpunktslösaren för ljustid med sändaren i sin retarderade position, och motsvarande enkelriktade avstånd;

seg-c5602eb76a05 = tvåvägsljustiden och avståndet;

seg-dab8e2db61d3 = Solens Shapiro-fördröjning, redovisad separat och inte tillagd;

seg-90d00587a59f = solseparationsvinkeln.

seg-4c172f9f7cf6 = Ljustiden är VALIDATED mot den enkelriktade ljustid som Horizons redovisar: Mars och Jupiter till Jordens centrum vid fyra epoker från { "2000" } till { "2040" }, sämsta fel { "0.070" } s för Mars mot en tröskel på { "0.207" } s och { "1.31" } s för Jupiter mot { "4.04" } s. Tröskeln är två gånger summan av Standish-avståndsfelen för målet och jord–måne-barycentret, delat med ljusets hastighet: ljustiden kan inte vara bättre än positionerna. Det är den newtonska geometriska ljustiden, inte en relativistisk eller plasmakorrigerad observabel.

seg-4f8cd6aef754 = Den medföljande <c1/> redovisar alla arton kroppar vid 2026-09-28T00:{ "00" }:{ "00" } med spår om 180 punkter, och lägger till länkarna Mars–Jupiter (enkelriktad { "2193.539" } s), Saturnus–Jorden ({ "4212.176" } s) och Europa–Jupiter ({ "2.218" } s).

seg-d22cc535f04b = En användare navigerar kring en kropp vald med namn (vilken katalogkropp som helst utom Solen och Jorden, som typen avvisar) med två slags mätningar:

seg-9eeb7f77aec7 = enkelriktade pseudoavstånd från en Walker-delta-navigationskonstellation kring kroppen (<c1/> gånger <c2/>, interplansfasning <c3/>), flugna som tvåkroppsbanor med kroppens egen sekulära drift <c4/>; användarklockan är okänd, så dessa rader bär en kolumn för klockbias;

seg-56ac318f6f27 = eventuellt ett tvåvägsavstånd från Jordens centrum (<c1/>), som inte behöver någon användarklocka och redovisas som ett enkelriktat avstånd med eget brus. Jordens riktning och avstånd kommer från den analytiska efemeriden vid varje epok.

seg-551d44492aae = En siktlinje blockeras när den passerar innanför kroppens medelradie (kordatestet i typen <c1/>), och en ytanvändare behöver också elevationsmasken. Vid varje epok bildar körningen de geometriska och positionsmässiga utspädningstalen (GDOP, PDOP) för enbart konstellationen, den formella ettsigma-positionsosäkerheten med och utan jordraden, och en seedad Gauss-Newton-minstakvadratpositionsbestämning åt vardera håll, så att rapporten visar vad djuprymdslänken tillför.

seg-6f1161567330 = toppnivå

seg-432421ccb9d7 = 2027-02-19T00:{ "00" }:{ "00" }, en Mars-opposition

seg-0b688042ed44 = { "86 400" } s, { "600" } s

seg-c7b3aaecd6e2 = <c1/> (eller <c2/>)

seg-c452a6f7a9d4 = omloppare: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>

seg-67f7b23bf604 = { "400" } km, { "75" } deg, { "0" }, { "0" }, { "0" }

seg-b412b65733d8 = yta: <c1/>, <c2/>, <c3/>

seg-7639d2583131 = tre medelradier

seg-fe4a8d9da406 = { "60" } deg

seg-7ac449fb9569 = { "1" } m

seg-128c4a5edd9b = <c1/> (ytanvändare)

seg-3d4b760f6ed6 = { "10" } deg

seg-498493929023 = true, { "1" } m

seg-18e477dc7f02 = <c1/> är rektascensionen för den uppstigande noden i kroppens ekvatorialsystem och <c2/> latitudargumentet vid epoken.

seg-a743b0b5e668 = De två medföljande scenarierna, som de körs med kshana { "0.36" } (portabel matematik, densamma på varje plattform):

seg-b24010bdb302 = Användare

seg-cb9cd741ba85 = omloppare, { "300" } km, { "93" } deg

seg-fa11e61f0d1d = yta, { "20" } deg N, { "60" } deg Ö

seg-e17a9ae6905c = Reläer

seg-359db3c9ad19 = { "12" } på { "10 000" } km, { "60" } deg

seg-1bb041045be4 = { "12" } på { "4500" } km, { "55" } deg, { "10" } deg mask

seg-604aefd62668 = Spann

seg-825603e2fbed = ett marsdygn (sol), { "296" } epoker

seg-372159825c11 = { "306 822" } s, { "171" } epoker

seg-132e3bbcc94c = Ljustid till Jorden, enkelriktad / tur och retur

seg-76351e2f75f8 = { "338.3" } s / { "676.6" } s

seg-2d0234ec6301 = { "2182.9" } s / { "4365.8" } s

seg-d0f05f440103 = Jorden i sikte

seg-d7ad84776ec6 = { "0.811" } av epokerna

seg-44bf83b16660 = Tillgänglighet, endast reläer / med jordavståndet

seg-07e0a8499670 = Median-PDOP

seg-e802f5920237 = RMS-fel i positionsbestämningen, endast reläer / med jordavståndet

seg-ed769d9370a0 = { "1.883" } m / { "1.629" } m

seg-873187e2b016 = { "112.742" } m / { "86.499" } m

seg-bcba58871d0b = Formellt mediansigma, endast reläer / med jordavståndet

seg-536757d9f141 = { "1.375" } m / { "1.304" } m

seg-14d7b5dc82e8 = { "5.360" } m / { "4.239" } m

seg-67d3d30060ad = (RMS: kvadratiskt medelvärde.) En Europa-epok (t = { "16 200" } s) ligger på tillgänglighetens gräns, där den sista biten i en beräknad radie avgör om dess positionsbestämning med jordavstånd görs. Före { "0.36" } avgjorde värdens matematikbibliotek det, så samma scenario skrev ut { "0.719" } och { "86.147" } m på Linux x86-64 och { "0.725" } och { "85.800" } m på macOS arm64 för de två siffrorna "med jordavstånd". Sedan { "0.36" } beräknas varje transcendent funktion av det portabla matematikbiblioteket, epoken avgörs på ett sätt på varje plattform (nativt och WebAssembly ger samma byte), och siffrorna är { "0.713" } och { "86.499" } m (<a1><c1/></a1>). Kring Europa höjer jordavståndet tillgängligheten från { "0.480" } till { "0.713" } av epokerna. Där Jorden aldrig kommer fri från kanten (limben) tillför länken ingenting: en landare vid { "89.5" } deg S på Månen under ett reläskal med 12 satelliter och { "5000" } km har Jorden i sikte vid { "0" } av { "145" } epoker, och dess fel är desamma med och utan länken.

seg-41507568efb8 = <b>MODELLED.</b> Reläbanorna ignorerar tredjekroppar (Jupiters drag på reläer kring Europa är inte modellerat), bruset är gaussiskt vid de angivna nivåerna och mätmodellen är ögonblicklig, inte ljustidsretarderad. Det som kontrolleras: reläets period mot Keplers tredje lag för kroppen, en omloppare som behåller sin radie och en landare på ytan, att jordavståndet aldrig försämrar den formella osäkerheten, att de seedade positionsfelen stämmer med det formella sigmat (kvadratiskt medelvärde av felet delat med sigma i [{ "0.6" }, { "1.5" }]), och en deterministisk körning. Inget av detta är ett uppdrags navigeringsdata.

seg-b78c9e331a43 = Typen <c1/>

seg-b9f40c641a49 = Trots namnet är <c1/> en typ för jordsatelliter: en satellit, från en tvåradig elementuppsättning (TLE) via propagatorn Simplified General Perturbations { "4" } (SGP4) eller från en analytisk bana, över ett tidsraster. Vid varje steg ger den det inertiella tillståndet (position och hastighet) i systemet true equator, mean equinox (TEME) och i Geocentric Celestial Reference System (GCRS), den jordfasta positionen, subsatellitpunkten i World Geodetic System { "1984" } (WGS { "84" }) och, för en valfri markstation, azimut, elevation, avstånd och avståndstakt. <c2/> tar texten från en fil <c3/> från International Earth Rotation and Reference Systems Service (IERS) för UT1−UTC och polrörelse per epok. Kod: <c4/>.

seg-1babcba7b4ba = Relativistiska ljustidstermer utöver den separat redovisade Shapiro-fördröjningen, och solplasmafördröjningen.

seg-0c49dfc777ca = Positioner bättre än Standish- och medelelementnoggrannheten som anges ovan; huvudcraten har ingen kernelläsare.

seg-18d925e53ce0 = Tredjekroppsstörningar på reläer i <c1/> och på banor i <c2/>.

seg-3968ed54e3fe = Terräng på vilken kropp som helst: en kropp är sin medelsfär.

seg-4650526c532e = Interoperabilitetsexporter: CZML, KML och GeoJSON beskriver positioner kring Jorden, så scenarierna <c1/> och <c2/> exporterar ingen (<a1>INTEROP.md</a1>).

seg-cb7e3d4bf5aa = E. M. Standish and J. G. Williams, "Keplerian Elements for Approximate Positions of the Major Planets," JPL Solar System Dynamics, <a1>https://ssd.jpl.nasa.gov/planets/approx_pos.html</a1>.

seg-aaf6a1f91c1a = O. Montenbruck and E. Gill, <em>Satellite Orbits: Models, Methods and Applications</em>, Springer, { "2000" }, §{ "3.3.2" }.

seg-8b7aa3bb95f0 = B. A. Archinal et al., "Report of the IAU Working Group on Cartographic Coordinates and Rotational Elements: { "2015" }," <em>Celestial Mechanics and Dynamical Astronomy</em> { "130" }, { "2018" }.

seg-10c8408cab27 = JPL Horizons, <a1>https://ssd.jpl.nasa.gov/horizons/</a1>.

seg-e95a41f0ded7 = <s1>Föregående</s1>Validering av kraftmodellen

seg-a801b99f7040 = <s1>Nästa</s1>Månens referensstation

seg-e0aba02258f4 = Typen ephemeris
