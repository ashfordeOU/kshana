# docs--kind-body-pnt: translations (sv)

seg-5b561b4fd201 = Mars

seg-debc2f07db78 = true

seg-37d29d8303fe = km

seg-51362910dcb7 = { "2" } medföljande scenarier använder den här typen; de övriga finns i <a1><c1/></a1>.

seg-67fb8ac75f36 = MODELLED { "1" } · VALIDATED { "1" }: raderna i <a1>verifieringsmatrisen</a1> som nämner den här typen.

seg-02b8d1f1b7df = Källa: <c1/>

seg-e28ba749a2a1 = <c1/> (scenariotyp)

seg-11e8c29ecb45 = Scenariotyp i motor v{ $version }, familj <a1>Konstellationer, täckning och geometri</a1>. Rådgivande: analysutdata från ett forsknings- och ingenjörsverktyg, inte typgodkänd navigationsutrustning och inte en livräddande säkerhetstjänst. Varje etikett här är motorns eller verifieringsmatrisens; en typ är MODELLED om inte matrisen säger något annat (hur en etikett förtjänas: avsnittet Evidens i README).

seg-e7dad1a1ecba = Positionering kring valfri himlakropp i solsystemet: en omloppsfarkost eller en ytlandare kring en centralkropp som väljs med namn (Mars, Månen, Europa, Ganymedes, Titan och resten av solsystemskatalogen), som navigerar med enkelriktade pseudoavstånd från en liten Walker-navigationskonstellation kring kroppen (tvåkroppsbanor med kroppens egen sekulära J2-drift, en okänd användarklocka) och eventuellt ett klockfritt tvåvägsavstånd i djuprymden från jorden, vars riktning och avstånd kommer från den analytiska solsystemsefemeriden vid varje epok. Siktlinjer blockeras av kroppens medelsfär, och en ytanvändare behöver dessutom elevationsmasken. Per epok: reläer i sikte, om jorden är ovanför limben, GDOP och PDOP enbart för konstellationen (geometrisk dilution och positionsdilution av precision), den formella osäkerheten i position på en sigma med och utan jordraden, samt felet i en seedad positionsbestämning med Gauss-Newton minsta kvadrat åt båda hållen; över körningen: tillgänglighet, jordsynlighet, median-PDOP, RMS-fel och formell mediansigma, plus ljustiden jorden–kroppen, tur och retur, Shapiro-fördröjningen och solseparationen vid epoken. MODELLED: reläbanorna, brusnivåerna och den ögonblickliga mätmodellen är modellval, inte validerade mot ett uppdrags navigationsdata; kroppskonstanterna är de publicerade värdena som anges i body.rs, och jordgeometrin ärver etiketterna från solsystemsefemeriden.

seg-c90c1a79f88b = En körning av <c1/> sammanfattas som: Positionering kring Mars — användare i omloppsbana, { "12" } reläer på { "10000" } km, { "296" } epoker jordens ljustid { "338.3" } s enkel väg, { "676.6" } s tur och retur; vinkel Sol-jord-kropp { "175.4" } deg tillgänglighet: { "1.000" } enbart konstellation, { "1.000" } med jordavståndet (jorden i sikte { "0.811" }) median-PDOP { "1.375" } ; RMS-fel { "1.883" } m enbart konstellation, { "1.629" } m med jordavståndet formell mediansigma { "1.375" } m enbart konstellation, { "1.304" } m med jordavståndet

seg-31bacf177d9c = Valfria fält: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>

seg-3f1989254167 = Exemplet <c1/> anger bland annat:

seg-2edab0747386 = 2027-02-19T00:{ "00" }:{ "00" }

seg-753b1683fb7b = m^3/s^{ "2" }

seg-81d4cd54bd62 = Resultatetikett (motorns): MODELLED: tvåkroppsreläbanor med sekulär J2-drift, geometrisk synlighet, gaussiskt avståndsbrus och en ögonblicklig mätmodell kring en kropp från de publicerade konstanterna; inte validerad mot ett uppdrags navigationsdata. Geometrin jorden–kroppen ärver etiketten från solsystemsefemeriden

seg-6f341acbe994 = Diagrammet som motorn skriver för scenarios/mars-orbit-pnt.toml, typ body-pnt

seg-dae4184bb004 = <b>VALIDATED</b> Den newtonska enkelriktade ljustiden från valfri kropp till valfri annan, mottagen vid en epok, löst med den radiometriska fixpunktslösaren för ljustid (radiometric::light_time_solution, sändaren vid sin retarderade position) genom solar_system::link_o Tester: <a1>solar_system_light_time_preregistered.rs</a1>.

seg-45259ad33a01 = <b>MODELLED</b> Typen <c1/>: en omloppsfarkost eller en ytlandare kring en kropp som väljs med namn navigerar med enkelriktade pseudoavstånd från en Walker-navigationskonstellation kring kroppen (tvåkroppsbanor med kroppens sekulära J2-drift, en okänd användarklocka

seg-5c3f8ac041d3 = <b>MODELLED</b> Typen <c1/>: en omloppsfarkost eller en ytlandare kring en kropp som väljs med namn navigerar med enkelriktade pseudoavstånd från en Walker-navigationskonstellation kring. Oberoende referens (InternalConsistency): Slutna former och självkonsistens: Keplers tredje lag för reläperioden, banradien och ytradien som hålls över körningen, att en tillagd mätning aldrig ökar den formella osäkerheten, och att de seedade felen stämmer med kovariansen. Reläbanorna bortser från tredje kroppar (Jupiters drag på reläer kring Europa är inte modellerat), bruset är gaussiskt vid angivna nivåer och mätmodellen är ögonblicklig

seg-64920deda9cd = MODELLED: tvåkroppsreläbanor med sekulär J2-drift, geometrisk synlighet, gaussiskt avståndsbrus och en ögonblicklig mätmodell kring en kropp från de publicerade konstanterna; inte validerad mot ett uppdrags navigationsdata. Geometrin jorden–kroppen ärver etiketterna från solsystemsefemeriden. (resultat <c1/>)

seg-bcb5cbf9cbe3 = MODELLED: reläbanorna, brusnivåerna och den ögonblickliga mätmodellen är modellval, inte validerade mot ett uppdrags navigationsdata; kroppskonstanterna är de publicerade värdena som anges i body.rs, och jordgeometrin ärver etiketterna från solsystemsefemeriden. (typkatalog (<c1/>))

seg-04cd882741e2 = MODELLED. Reläbanorna, avståndsbruset på { "1" } m och den ögonblickliga mätmodellen är modellval; inget här är validerat mot ett uppdrags navigationsdata. Marskonstanterna är de publicerade värdena som anges i src/body.rs. (kommentar i scenariofilen, rad { "20" } till { "22" })

seg-df6bae4c422e = Positionering kring valfri himlakropp i solsystemet med en lokal konstellation och en djuprymdslänk från jorden är MODELLED, inte validerad: kontrollerad mot sin egen slutna / analytiska identitet — fångar transkriptions- och koefficientfel, men är ingen extern oberoende referens. (verifieringsmatris (docs/MODELLED-RATIONALE.md))

seg-a4f1e7d2041e = Familjesida: <a1>Konstellationer, täckning och geometri</a1>

seg-670191cf797f = Ämnessida: <a1>SOLAR-SYSTEM.md</a1>

seg-cef32ee7d521 = Ämnessida: <a1>CONSTELLATION-DESIGN.md</a1>

seg-a4c650a0eb7a = <s1>Föregående</s1>attitude-budget

seg-96170e5c8e3f = <s1>Nästa</s1>campaign
