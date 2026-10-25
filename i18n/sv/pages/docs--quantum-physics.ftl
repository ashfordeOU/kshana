# docs--quantum-physics: translations (sv)

seg-5ad814c7ef9e = Anteckningar

seg-ad856ad710eb = Status

seg-f2f359447cd9 = Källa: <c1/>

seg-5df810623ef1 = Fysik för kvantbaserade tröghetssensorer (kallatomsinterferometer)

seg-b2915c3652a1 = Det mesta i Kshana driver sina kvantsensorer med <b>publicerade Allan-/brusskoefficienter</b> — uppslag i datablad (se <a1><c1/></a1> och <a2><c2/></a2>). Det här dokumentet behandlar det enda ställe där motorn i stället beräknar sensorns prestanda <b>från grundprinciper</b>: modellen av kallatomsinterferometerns (CAI) accelerometer i <a3><c3/></a3>.

seg-9ae4b2dc84ba = Det är avsiktligt ett <em>minimalt, ärligt</em> fysiklager — golvet för kvantprojektionsbrus och interferometerns skalfaktor — inte en fullständig instrumentsimulator. Avsnitten nedan anger exakt vad som modelleras och inte modelleras.

seg-64509c048541 = Vad som modelleras

seg-9fa6211c962e = En atominterferometer av Mach–Zehnder-typ med tre pulser (π/2–π–π/2) (Kasevich & Chu { "1991" }; Peters, Chung & Chu { "2001" }), standardgeometrin för kallatomsaccelerometrar:

seg-3c513ef2fd3b = Storhet

seg-c0a13eeb346d = Formel

seg-f838cd800e16 = Effektiv vågvektor

seg-79e00267b79f = Tvåfotons-Raman; Rb-87 D2 ({ "780.241" } nm) → <c1/>.

seg-5c0a84157352 = Interferometerfas

seg-31f4f718d896 = Likformig specifik kraft <c1/> längs <c2/>, pulsavstånd <c3/>. Skalningen med <c4/> är den dominerande känslighetshävstången (mikrogravitation ger långt <c5/>).

seg-f5b8b6c35dce = Kvantprojektionsbrus

seg-8902ae6f313c = Per skott, franskontrast <c1/>, atomantal <c2/> — skottbrusgränsen för en populationsavläsning med två portar.

seg-b95d4d1e45f0 = Accelerationskänslighet per skott

seg-c97f2fd35d48 = Fasbrus omräknat till acceleration.

seg-cda09ac79409 = Skottbrusbegränsad ASD (amplitudspektraltäthet)

seg-4d84800a3adb = Samplad varje cykeltid <c1/>; enhet (m/s²)/√Hz.

seg-707ee648d1d5 = PSD (effektspektraltäthet) för slumpvandring i hastighet

seg-be0ac61054db = <b>Koefficienten som den klassiska <c1/> använder</b> — nu <em>härledd</em>, inte angiven.

seg-939e12a62637 = Kontrastavtagande

seg-05b0e7130b78 = Dekoherens under avfrågningen.

seg-e64f748b35ab = Överföringsfunktion för vibration

seg-1754ac375452 = Respons från acceleration till fas för den ideala geometrin med tre pulser (Cheinet m.fl. { "2008" }); gränsvärdet för DC (nollfrekvens) <c1/>.

seg-a710cfe4f533 = Vibrationsbegränsad fas

seg-f5d2223218c8 = Platt acceleration-PSD <c1/> längs Raman-axeln; <c2/>.

seg-13109dcfc52b = Vibrationsbegränsad acceleration

seg-812990a8f058 = Per skott; observera att <c1/> faller bort — bestäms bara av plattformens PSD och avfrågningstiden.

seg-1c2764469718 = Fransosäkerhet

seg-e9cf2dcc0274 = <c1/>, omfång i celler <c2/>

seg-817e06834263 = Fransfasen läses modulo 2π, så en enskild avläsning är entydig bara inom ±<c1/> och viker sig var <c2/> utanför det; antalet celler beror inte på <c3/> eller <c4/>.

seg-14bbedf1cd0d = Axelprojektion

seg-1ac2d4904b8a = Första ordningens koppling har rang 1: bara komponenten längs strålen går in i fasen.

seg-7200f91fa19a = Coriolis- / rotationsfas

seg-f8b407b3b2fb = Systematisk rotationseffekt för ett fordon i rörelse (Lan m.fl. { "2012" }); ekvivalent bias <c1/> = den klassiska Coriolis-termen.

seg-9eaff8d90a83 = AC-Stark-fas (ljusskift) (AC: växelström)

seg-62630dc178e6 = Ljusskift för en foton; ett <em>konstant</em> skift upphävs av symmetrin π/2–π–π/2 (Peters { "2001" }; Gauguet { "2008" }).

seg-bcb9cb9c6219 = Poängen är att slingan sluts: <c1/> ger exakt den vita acceleration-PSD som resten av tröghetskedjan redan integrerar till ett fel i hastighet/position — så en kvantsensors brus kan spåras till dess atomantal, avfrågningstid och kontrast i stället för till en rad i ett datablad.

seg-e2363d639ccc = Ett genomräknat värde (Rb-87, <c1/>, <c2/>, <c3/>, <c4/>): <c5/>, <c6/>, <c7/> (≈ { "0.13" } µg) per skott och ett skottbrusgolv <c8/>. Med en måttlig PSD för plattformens vibration <c9/> är det <b>vibrationsbegränsade</b> golvet per skott <c10/> (≈ { "5.9" } µg) — ungefär { "46" } gånger skottbrusgolvet, vilket visar varför verkliga instrument begränsas av vibration och inte av projektion. Samma interferometer läser specifik kraft entydigt bara inom <c11/> (≈ { "199" } µg), omkring { "1 571" } upplösningsceller: <c12/> är tusentals franser, så en enskild avläsning av { "1" } g viker sig.

seg-c209b86f41d8 = Vad som INTE modelleras (och varför golvet är optimistiskt)

seg-964c5f546c2a = Skottbrusgolvet ovan är en <b>grundläggande nedre gräns</b>. Verkliga CAI-instrument ligger över det: en stationär gravimeter i laboratorium (Freier m.fl. { "2016" }, { "96" } nm/s²/√Hz) omkring { "60" } gånger över golvet som beräknas för dess parametrar, och en accelerometertriad i fält mycket längre (Exail-enheten som anges i <c1/> uppger { "22" } µg/√Hz). Den dominerande termen — <b>vibrationskoppling</b> — och de två ledande deterministiska systematiska effekterna — <b>Coriolis/rotation</b> och <b>AC-Stark-ljusskiftet</b> — modelleras (raderna om överföringsfunktion, Coriolis och ljusskift ovan), och det gör även <b>det dynamiska omfånget för fransosäkerhet</b> (<c2/>, <c3/>, <c4/>, <c5/>). Det återstående gapet är det som det här lagret fortfarande inte omfattar:

seg-c56d85817bc6 = <b>Vågfrontsaberration</b> och systematiska effekter av högre ordning från strålriktning — <b>modelleras inte</b>.

seg-525c382e813b = <b>Upplösning av fransosäkerhet</b> — modellen anger det entydiga omfånget och returnerar den vikta fasen; den vecklar inte ut en avläsning utanför ±<c1/> (till exempel med en klassisk accelerometer eller flera avfrågningstider), och den begränsar omfånget för en ideal fransmönster med tre pulser, utan termer för vågfront eller kontrastförlust.

seg-7555132ef2c6 = Koppling till litteraturen: Groves, <em>Principles of GNSS, Inertial, and Multisensor Integrated Navigation Systems</em> §{ "12.5" } (kvantteknik; GNSS: globalt satellitnavigeringssystem); Cheinet m.fl., <em>IEEE Trans. Instrum. Meas.</em> { "57" } ({ "2008" }) för interferometerns känslighet/överföringsfunktion (IEEE: Institute of Electrical and Electronics Engineers); Freier m.fl., <em>J. Phys.: Conf. Ser.</em> { "723" } ({ "2016" }) för felbudgeten för den mobila gravimetern; CARIOQA-PMP (Cold Atom Rubidium Interferometer in Orbit for Quantum Accelerometry – Pathfinder Mission Preparation) för parameterregimen hos rymdaccelerometrar.

seg-c50f3befe165 = Detta är posten om <b>kvantfysiklagret på P2</b> från <c1/>: Mach–Zehnder-fasen, projektionsbruset, skalfaktorn, det härledda <c2/>, kontrastavtagandet <b>och överföringsfunktionen för vibrationskoppling / variansen för vit PSD</b> är implementerade och enhetstestade mot handräkning (inklusive en numerisk korskontroll av bandintegralen för överföringsfunktionen mot dess analytiska <c3/>-resultat).

seg-42e8dc204be9 = Modellen är också <b>kopplad in i körbara scenarier</b>: en accelerometer löses till <c1/> när den har en <c2/>-tabell — <c3/> eller <c4/> i ett <c5/>-scenario, <c6/> i ett <c7/>-scenario (<c8/> levereras med ett, och den medföljande förinställningen <c9/> ställer en CAI specificerad med fysik mot en kvartsaccelerometer i navigeringsklass genom ett GNSS-avbrott) — med fälten <c10/>, <c11/> (<c12/>), <c13/> (<c14/>), <c15/> (<c16/>), <c17/> (<c18/>) och en valfri <c19/> för plattformen. Dess PSD för slumpvandring i hastighet <c20/> <b>härleds</b> då ur interferometerns fysik — skottbrusgolvet plus, när en vibrations-PSD anges, det vibrationsbegränsade bidraget i kvadratur — i stället för att anges som en koefficient ur ett datablad. Scenarier utan ett <c21/>-block är klassiska och oförändrade byte för byte.

seg-51da20726ade = De systematiska effekterna Coriolis (<c1/> / <c2/>) och AC-Stark-ljusskift (<c3/>) är implementerade och enhetstestade (den ekvivalenta Coriolis-biasen kontrolleras mot den klassiska <c4/>; AC-Stark-fasen mot sitt symmetriska upphävande). Ett svep över driften med cykeltid (<c5/>) redovisar positionsdriften vid dödräkning för kvant-CAI som funktion av cykeltid — den beräkningsmässiga kärnan i en jämförelse mellan kvant och klassisk. Typen <c6/> återanvänder samma accelerometer genom <c7/>, och <c8/> bär ett parameterblad med intervall (bäst, nominellt, konservativt) med en källhänvisning per värde.

seg-e2acbef44395 = Vad de externa kontrollerna visar.

seg-353a2b2e1434 = <c1/> kontrollerar överföringsfunktionen mot en numerisk integral i tidsdomänen av Cheinets känslighetsfunktion, <c2/> mot publicerade linjevåglängder och Coriolis-biasen mot <c3/> — exakta träffar mot de publicerade formerna. Skottbrusgolvet är ett ensidigt intervall: för de publicerade parametrarna för cesiumgravimetern av Peters m.fl. { "2001" } och rubidiumgravimetern GAIN av Freier m.fl. { "2016" } (arXiv:{ "1512.05660" }) ligger det modellerade golvet vid eller under varje instruments uppnådda brus och inom tre storleksordningar från det (för GAIN är golvet { "1.53" }×{ "10" }⁻⁹ m/s²/√Hz mot det uppnådda { "9.6" }×{ "10" }⁻⁸, en faktor omkring { "63" }). Det är förenligt med att verkliga instrument begränsas av vibration eller tekniskt, men det är ett intervall, inte en validering av en brusmodell för ett instrument, så matrisraden förblir MODELLED.

seg-82dffa95c0e8 = De återstående uppföljningarna är systematiska effekter från vågfront/strålriktning, upplösning av fransosäkerhet, en numeriskt exakt återgivning av Monte Carlo-budgeten för CARIOQA-PMP och Boeing/AOSense-budgetarna för flygtester utan GPS (GPS: Global Positioning System) (som kräver de publicerade PSD:erna för plattformen och SNR per skott, signal-brusförhållandet), och en förinställning för jämförelse mellan kvant och klassisk i lekplatsen i webbläsaren ovanpå <c1/>.

seg-2452f58aedf0 = <s1>Föregående</s1>Modeller av kvantsensorer

seg-206d5a9704f0 = <s1>Nästa</s1>Python-API
