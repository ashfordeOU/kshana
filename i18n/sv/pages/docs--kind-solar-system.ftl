# docs--kind-solar-system: translations (sv)

seg-e27476e37522 = Jorden

seg-5b561b4fd201 = Mars

seg-59f1f277012b = Jupiter

seg-e6e209ad07e0 = Europa

seg-6f12259c6ec4 = Saturnus

seg-11e8c29ecb45 = Scenariotyp i motor v{ $version }, familj <a1>Konstellationer, täckning och geometri</a1>. Rådgivande: analysutdata från ett forsknings- och ingenjörsverktyg, inte typgodkänd navigationsutrustning och inte en livräddande säkerhetstjänst. Varje etikett här är motorns eller verifieringsmatrisens; en typ är MODELLED om inte matrisen säger något annat (hur en etikett förtjänas: avsnittet Evidens i README).

seg-dae4184bb004 = <b>VALIDATED</b> Den newtonska enkelriktade ljustiden från valfri kropp till valfri annan, mottagen vid en epok, löst med den radiometriska fixpunktslösaren för ljustid (radiometric::light_time_solution, sändaren vid sin retarderade position) genom solar_system::link_o Tester: <a1>solar_system_light_time_preregistered.rs</a1>.

seg-a4f1e7d2041e = Familjesida: <a1>Konstellationer, täckning och geometri</a1>

seg-670191cf797f = Ämnessida: <a1>SOLAR-SYSTEM.md</a1>

seg-cef32ee7d521 = Ämnessida: <a1>CONSTELLATION-DESIGN.md</a1>

seg-4d208b6c0eb8 = dygn

seg-3319b18ac61f = och { "1" } till i matrisen.

seg-fbac1cbb2422 = MODELLED { "2" } · VALIDATED { "3" }: raderna i <a1>verifieringsmatrisen</a1> som nämner den här typen.

seg-028ac545e52e = Källa: <c1/>

seg-934e7998420c = <c1/> (scenariotyp)

seg-0549bc926a9b = Hela solsystemet vid en epok, för PNT (positionering, navigering och tidssynkronisering) kring vilken kropp som helst. För solen, de åtta planeterna, Pluto, månen, Phobos, Deimos, Io, Europa, Ganymedes, Callisto och Titan redovisas den heliocentriska positionen och hastigheten i ICRF (International Celestial Reference Frame, ekvatoriellt J2000), det heliocentriska avståndet och den ekliptiska longituden och latituden i J2000, gravitationsparametern, ekvatorial- och medelradien, J2 där den är publicerad och dess referensradie, den sideriska rotationsperioden, IAU-polen och nollmeridianen vid epoken, ett banspår samplat över ett varv (heliocentriskt för planeter, moderkroppscentrerat för månar), samt ljustiden, enkelriktat och tvåvägs avstånd, solens Shapiro-fördröjning och solavstånd från en observatörskropp (standard jorden); extra från/till-länkar får samma behandling. Positioner: JPL:s Kepler-element av Standish och Williams (tabell { "1" } för { "1800" } e.Kr. till { "2050" } e.Kr., tabellerna 2a/2b för { "3000" } f.Kr. till { "3000" } e.Kr.) med varje planets nominella fel, Montenbruck & Gills lunara serie för uppdelningen jord-måne, JPL:s medelelement med IAU:s synkrona rotationstakt för Mars- och Galileimånarna, och IAU:s rotationsmodell för Titan. Ljustid: den radiometriska fixpunktslösningen, sändaren vid sin fördröjda position; newtonsk, med Shapiro-fördröjningen redovisad separat. VALIDATED mot JPL Horizons (DE441) inom två gånger det nominella felet: Merkurius till Saturnus och jorden från tabell { "1" } (sämst { "1.87" } gånger nominellt) och alla åtta planeterna från tabellerna 2a/2b (sämst { "1.71" } gånger), samt ljustiden från jorden till Mars och Jupiter. MODELLED, varje rad märkt: Uranus och Neptunus från tabell { "1" } ({ "2.0" } och { "5.2" } gånger det nominella felet mot DE441), Pluto (raden från { "1992" }; inget angivet fel), månen och de sju månarna (uppmätta mot Horizons, ingen publicerad gräns).

seg-bd2d27e1f91d = En körning av <c1/> sammanfattas som: Solar system at 2026-09-28T00:{ "00" }:{ "00" } (JD { "2461311.50080" } TDB), { "18" } bodies, observer Earth Standish Table { "1" } ({ "1800" } AD to { "2050" } AD) Sun { "0.0000" } au lon { "0.00" } deg light time { "500.1" } s [origin] Mercury { "0.4666" } au lon { "259.05" } deg light time { "605.3" } s [VALIDATED] Venus { "0.7272" } au lon { "348.72" } deg light time { "182.1" } s [VALIDATED] Earth { "1.0022" } au lon { "4.52" } deg observer [VALIDATED] Moon { "1.0046" } au lon { "4.56" } deg light time { "1.3" } s [MODELLED] Mars { "1.5544" } au lon { "83.81" } deg light time { "841.1" } s [VALIDATED] Phobos { "1.5545" } au lon { "83.81" } deg light time { "841.2" } s [MODELLED] Deimos { "1.5545" } au lon { "83.80" } deg light time { "841.1" } s [MODELLED] Jupiter { "5.3036" } au lon { "130.91" } deg light time { "2970.6" } s [VALIDATED] Io { "5.3049" } au lon { "130.94" } deg light time { "2971.5" } s [MODELLED] Europa { "5.2995" } au lon { "130.93" } deg light time { "2968.7" } s [MODELLED] Ganymede { "5.3005" } au lon { "130.98" } deg light time { "2969.6" } s [MODELLED] Callisto { "5.3153" } au lon { "130.96" } deg light time { "2976.7" } s [MODELLED] Saturn { "9.4356" } au lon { "10.77" } deg light time { "4212.2" } s [VALIDATED] Titan { "9.4401" } au lon { "10.74" } deg light time { "4214.3" } s [MODELLED] Uranus { "19.4363" } au lon { "62.62" } deg light time { "9444.1" } s [MODELLED] Neptune { "29.8775" } au lon { "2.62" } deg light time { "14409.3" } s [MODELLED] Pluto { "35.6122" } au lon { "304.19" } deg light time { "17529.1" } s [MODELLED] link Mars -> Jupiter: one-way { "2193.539" } s, two-way { "4386.919" } s, Shapiro { "15.0" } us, Sun { "15.0" } deg link Saturn -> Earth: one-way { "4212.176" } s, two-way { "8424.347" } s, Shapiro { "22.1" } us, Sun { "172.5" } deg link Europa -> Jupiter: one-way { "2.218" } s, two-way { "4.437" } s, Shapiro { "0.0" } us, Sun { "22.0" } deg

seg-26ecec1af8af = Valfria fält: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>

seg-13de19567146 = Exemplet <c1/> anger bland annat:

seg-6081077a5c63 = 2026-09-28T00:{ "00" }:{ "00" }

seg-c4b64eb26210 = ICRF (equatorial J2000), heliocentric; m

seg-6096a0ab243b = Standish Table { "1" } ({ "1800" } AD to { "2050" } AD)

seg-5c9a8d4716f5 = Resultatetikett (motorns egen): MIXED: varje kropp bär sin egen etikett. Planeternas positioner är VALIDATED mot JPL Horizons inom två gånger Standishs nominella fel (Merkurius till Saturnus och jorden från tabell { "1" }; alla åtta planeterna från tabellerna 2a/2b); Uranus och Neptunus från tabell { "1" }, Pluto, månen och de sju månarna är MODELLED.

seg-537aa8010e50 = Diagrammet som motorn skriver för scenarios/solar-system-tour.toml, typ solar-system

seg-7432155d5fec = <b>VALIDATED</b> Typen <c1/> med planetary_kernel_path: varje redovisad kropp vars egen NAIF-kod SPK:n innehåller hämtar sin heliocentriska J2000-position och hastighet från kärnan genom motorns egen läsare (etikett KERNEL), en länk vars två slut

seg-84ce0dd8daef = <b>VALIDATED</b> Heliocentriska positioner för Merkurius, Venus, jord-måne-barycentret, jorden, Mars, Jupiter och Saturnus från Standish tabell { "1" } ({ "1800" } e.Kr. till { "2050" } e.Kr.), och för alla åtta planeterna från tabellerna 2a/2b ({ "3000" } f.Kr. till { "3000" } e.Kr., med medelanomalitermerna b, c, s, f Tester: <a1>solar_system_standish_earth_icrf_preregistered.rs</a1>.

seg-cc5bd76ec542 = <b>MODELLED</b> Positioner för Uranus och Neptunus från Standish tabell { "1" } (standard inom { "1800" } e.Kr. till { "2050" } e.Kr.), Pluto från raden i tabell { "1" } från { "1992" } som den nuvarande JPL-sidan inte längre listar, och den heliocentriska hastigheten för varje planet: tvåkroppsderivatan med Tester: <a1>solar_system_horizons_reference.rs</a1>.

seg-ad3da7fe8e46 = <b>VALIDATED</b> Typen <c1/> med planetary_kernel_path: varje redovisad kropp vars egen NAIF-kod SPK:n innehåller hämtar sin heliocentriska J2000-position och hastighet från. Oberoende referens (ExternalDataset): NAIF SPICE Toolkit (CSPICE N0067 genom spiceypy { "8.3.0" }) spkezr heliocentriska tillstånd på hela de440s.bsp, ett separat program som inte anropar någon Kshana-kod (tests/fixtures/solar_system_kernel/, NOTICE.md); motorn läser de440s-utsnitt bit för bit. Förhandsregistrerad f8e946ea. En Library-kontroll av kopplingen: DE440 i sig och de analytiska kropparna är inte validerade här. Resultat: docs/design/evidence/cap31-solar-system-kernel/RE

seg-735fb0bc1705 = <b>VALIDATED</b> Heliocentriska positioner för Merkurius, Venus, jord-måne-barycentret, jorden, Mars, Jupiter och Saturnus från Standish tabell { "1" } ({ "1800" } e.Kr. till { "2050" } e.Kr.), och för alla . Oberoende referens (ExternalDataset): JPL Horizons DE441 geometriska heliocentriska vektorer (ekliptika och ICRF), hämtade efter att förhandsregistreringarna { "80451866" }, 8d38a28b och 558cc807 incheckats. Tröskel: per planet och komponent, RMS högst 1.0x de ungefärliga felen i Explanatory Supplement 3:e uppl. tabell { "8.10.1" } (EMB-raden för jorden); uppdelningen jord-EMB kontrolleras direkt mot DE441 { "399" } minus { "3" }, högst { "0.3" } deg och { "8.1" } km vid varje epok 1950-2050 (th

seg-ab1192de28f5 = <b>VALIDATED</b> Den newtonska enkelriktade ljustiden från vilken kropp som helst till vilken annan som helst, mottagen vid en epok, lösta med den radiometriska fixpunktslösaren för ljustid (radiometric::light_t. Oberoende referens (ExternalDataset): JPL Horizons DE441 enkelriktad newtonsk ljustid LT på nedlänkssträckan (VEC_CORR=LT, observatör jordens centrum), förhandsregistrerad (480037d3, tillägg 54d5c86f som endast ändrar nodavståndet för interpolationen efter att den första hämtningen föll på sitt förkrav på { "10" } m interpolationsprecision, innan någon ljustid jämfördes) med en tröskel på { "1e-6" } s per ljustid, där lösaren matades med barycentriska positioner från DE441 så att iterationen för den fördröjda sändaren syns

seg-5a2e745828ea = <b>MODELLED</b> Positioner för Uranus och Neptunus från Standish tabell { "1" } (standard inom { "1800" } e.Kr. till { "2050" } e.Kr.), Pluto från raden i tabell { "1" } från { "1992" } som den nuvarande JPL-sidan inte längre li. Oberoende referens (ExternalDataset): Uppmätt mot JPL Horizons DE441 (samma incheckade fixturer), men inte validerad: tabell { "1" }:s angivna värden för Uranus och Neptunus överskrids med upp till { "2.0" } och { "5.2" } gånger mot heliocentriska positioner i DE441 (Neptunus når dem mot barycentriska positioner, vilket tyder på att anpassningen inte var heliocentrisk), sidan anger inget fel för Pluto, och ingen publicerad gräns finns för hastigheterna. Tabellerna 2a/2b når sina egna

seg-0131b082906b = MIXED: varje kropp bär sin egen etikett. Planeternas positioner är VALIDATED mot JPL Horizons inom två gånger Standishs nominella fel (Merkurius till Saturnus och jorden från tabell { "1" }; alla åtta planeterna från tabellerna 2a/2b); Uranus och Neptunus från tabell { "1" }, Pluto, månen och de sju månarna är MODELLED. Ljustiderna är newtonska, från samma positioner. (resultat <c1/>)

seg-3e24f0bf9ccd = MODELLED, varje rad märkt: Uranus och Neptunus från tabell { "1" } ({ "2.0" } och { "5.2" } gånger det nominella felet mot DE441), Pluto (raden från { "1992" }; inget angivet fel), månen och de sju månarna (uppmätta mot Horizons, ingen publicerad gräns). (typkatalog (<c1/>))

seg-62b2e925233a = VAD SOM ÄR VALIDATED OCH VAD SOM INTE ÄR DET Varje kropp bär sin egen etikett. Merkurius till Saturnus och jorden är VALIDATED mot JPL Horizons (Development Ephemeris DE441) inom två gånger Standish-sidans nominella fel. Uranus och Neptunus från tabell { "1" } överskrider sidans värden mot DE441 (med { "2.0" } och { "5.2" } gånger) och är MODELLED; det är även Pluto, månen och de sju månarna, som uppmättes mot Horizons men saknar p (kommentar i scenariofilen, rad { "20" } till { "25" })

seg-2b36ac40e457 = Uranus och Neptunus från Standish tabell { "1" }, Pluto och planeternas hastigheter är MODELLED, inte validerade: ett delpåstående är externt kontrollerat, men hela förmågan sammansätts av modellerade delar, så förmågan förblir Modelled. (verifieringsmatris (docs/MODELLED-RATIONALE.md))

seg-c19e6d035b7e = Positioner för månen och sju stora månar (Phobos, Deimos, Galileimånarna, Titan) är MODELLED, inte validerade: ett delpåstående är externt kontrollerat, men hela förmågan sammansätts av modellerade delar, så förmågan förblir Modelled. (verifieringsmatris (docs/MODELLED-RATIONALE.md))

seg-ce15aaa5453c = Fysikaliska konstanter för varje kropp i solsystemet och rapporten för hela systemet är MODELLED, inte validerade: kontrollerade mot sin egen slutna analytiska identitet. Det fångar överförings- och koefficientfel, men är ingen extern oberoende referens. (verifieringsmatris (docs/MODELLED-RATIONALE.md))

seg-ceadf891b1e2 = <s1>Föregående</s1>slot-timing

seg-0493962a6937 = <s1>Nästa</s1>space-packet
