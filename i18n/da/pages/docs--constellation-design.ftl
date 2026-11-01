# docs--constellation-design: translations (da)

seg-f63dd3d7aad4 = Kilde

seg-8f0e4021404d = Kilde: <c1/>

seg-44196ab9678c = Typen <c1/> bygger en eller flere satellitkonstellationer omkring Jorden, Månen, Mars eller et hvilket som helst andet legeme i solsystemkataloget (<c2/>: de otte planeter, Pluto, Månen, Phobos, Deimos, de fire galileiske måner og Titan, med de samme konstanter som typerne <c3/> og <c4/>; se <a1>SOLAR-SYSTEM.md</a1>) og kortlægger deres dækning og præcisionsfortynding (DOP) over et bredde-/længdegradsgitter. Kilde: <c5/>.

seg-61385c509a3d = Legemet vælges med <c1/> (standard <c2/>). Kørslen spænder over <c3/> (standard ét siderisk døgn, { "86 164" } s) i trin på <c4/> (standard { "600" } s), over <c5/> (standard { "5" } deg), på et gitter på <c6/> (standard { "10" } deg), som <c7/>, <c8/>, <c9/> og <c10/> kan begrænse; <c11/> tilføjer den sekulære drift fra J2, den anden zonale harmoniske i legemets tyngdefelt.

seg-d02f6d747522 = Hvad der går ind

seg-743e68478333 = <b>Walker-skaller</b> i konventionen <c1/>: <c2/> satellitter i <c3/> ensartet fordelte baneplaner med faseforskydning <c4/>. Et <em>delta</em>-mønster spreder de opstigende knuder over { "360" } deg, et <em>stjerne</em>-mønster over { "180" } deg. Plan <c5/> ligger ved knude <c6/> og satellit <c7/> i det ved middelanomali <c8/>.

seg-d86b01d633a0 = <b>Eksplicitte elementsæt</b>: halv storakse eller højde, excentricitet, inklination, rektascension af den opstigende knude (RAAN), periapsisargument og middelanomali.

seg-0737ef1ddb72 = <b>Forudindstillinger</b> fra offentliggjorte nominelle elementer (kun Jorden; en forudindstilling omkring et andet legeme er en fejl):

seg-587beeccaa11 = Forudindstilling

seg-1ff32b87e030 = Satellitter

seg-9e0514e371e5 = Global Positioning System (GPS) Standard Positioning Service Performance Standard (SPS PS), 5. udgave, april { "2020" }, tabel 3.2-1 og 3.2-3

seg-fb6956d09acc = { "24" } til { "30" }

seg-f679ee0f3a3f = SPS PS tabel 3.2-2: hver af de seks udvidelige pladser (B1, D2, F2, A2, C4, E3), der er nævnt i <c1/>, erstattes af sit for- og bagpar; som standard alle seks

seg-45f3abdcb8d4 = Galileo Open Service Service Definition Document (OS SDD), udgave { "1.1" }: Walker 24/3/1, halv storakse { "29 599.801" } km, { "56" } deg (tabel { "1" }), pladser fra tabel { "23" }

seg-87e23a896f58 = BeiDou Open Service Performance Standard { "3.0" } ({ "2021" }), afsnit { "4.1" }: Walker 24/3/1 i middelhøj jordbane (MEO) ved { "21 528" } km og { "55" } deg, plus tre geostationære (GEO) satellitter ved { "80" }, { "110.5" } og { "140" } deg Ø og tre skrå geosynkrone (IGSO) satellitter ved { "55" } deg

seg-70a32cd2402d = GLONASS Interface Control Document (ICD), udgave { "5.1" } ({ "2008" }), afsnit { "5.2" }: pladsformel, { "19 100" } km, { "64.8" } deg

seg-654d7aceff94 = GPS-tabellens RAAN er inertial ved dens epoke; forudindstillingen omregner den til en jordfast knudelængdegrad med den Greenwich-timevinkel, tabellen angiver ({ "100.765" } deg). GLONASS angiver absolutte (Greenwich-)knudelængdegrader direkte. Galileo-dokumentet angiver ingen timevinkel, så dets RAAN bruges som knudelængdegrad. BeiDou-standarden angiver ikke MEO-fasen eller IGSO-knuderne; forudindstillingen starter MEO-mønsteret ved knude { "0" } og middelanomali { "0" } og lægger de tre IGSO'er på ét jordspor, der krydser ækvator ved { "118" } deg Ø. Disse to valg er modelleret.

seg-b2bbdd23c13b = Flere konstellationer kan dele én kørsel. Med <c1/> (standard) estimerer modtageren ét ur pr. system i sigte, som en multi-GNSS-modtager (Global Navigation Satellite System) gør; <c2/> deler ét ur.

seg-27db52482bdd = Hvad der kommer ud

seg-2405196cfccb = Pr. gittercelle: gennemsnitligt, mindste og største antal satellitter over masken; andelen af epoker med positionsbestemmelse og med positions-DOP (PDOP) på eller under <c1/>; gennemsnitlig geometrisk, positions-, horisontal og vertikal DOP (GDOP, PDOP, HDOP, VDOP); største PDOP. Globalt, vægtet med cosinus til breddegraden, så hver celle tæller efter sit areal: tilgængelighed, tilgængelighed på det værste sted samt gennemsnit, median, 90., 95. og 99. percentil og maksimum for hver DOP. Pr. satellit: et nedsamplet jordspor (<c2/> punkter, standard { "24" }, for højst <c3/> satellitter, standard { "120" }). Diagrammet er to kort, tilgængelighed og gennemsnitlig PDOP.

seg-6cb532d0bca9 = Hvordan det skalerer

seg-988ae3272c1f = En satellit i radius <c1/> er over en elevationsmaske <c2/> netop når dens centralvinkel fra brugeren højst er <c3/>, så synlighedstesten er ét skalarprodukt mod <c4/>. For hver epoke sorteres satellitterne også efter undersatellitbredde, og en gitterrække ved bredde <c5/> tester kun de satellitter, der ligger inden for <c6/> af <c7/>. Begge dele er eksakte på et sfærisk legeme, og en enhedstest holder hvert kort op mod en brute-force-gennemgang med den direkte elevationstest. Blokken <c8/> rapporterer de par-tests, en brute-force-gennemgang ville foretage, og dem, der blev foretaget. Enhedstestens design med { "5" } 000 satellitter på et gitter på { "10" } deg ({ "648" } punkter, { "6" } epoker) beholder { "9.9" } % af de { "19 440 000" } par-tests i brute-force; det medfølgende scenarie <c9/> ({ "5 000" } satellitter, { "648" } punkter, { "12" } epoker) kører på cirka { "0.14" } s med kommandolinjeprogrammet i release-udgave på en bærbar med Apple-silicon. Vægurstider varierer med maskinen og dens belastning. Motoren bruger ingen tråde, intet ur og intet filsystem, så den kører uændret som WebAssembly.

seg-abba032ee1c7 = Hvad der kontrolleres, og mod hvad

seg-2342ed239300 = VALIDATED, mod offentliggjorte dokumenter:

seg-dc7fe92fcf05 = Walker-generatoren gengiver alle { "24" } rækker i Galileo OS SDD tabel { "23" }, og GLONASS ICD's pladsformel er det samme sæt af { "24" } pladser som en Walker 24/3/1;

seg-686f9543c7c9 = GPS-forudindstillingen gengiver kolonnen for jordsporets ækvatorkrydsning i SPS PS tabel 3.2-1 og 3.2-2: { "35" } af { "36" } steder inden for { "0.0108" } deg mod en afrundingstærskel på { "0.015" } deg. E3F holdes til en løsere tærskel på { "0.06" } deg, fordi tabellens egen E3F-række er inkonsistent med dens RAAN og breddeargument: dens breddeargument ligger { "14.60" } deg foran E3's, hvilket flytter krydsningen med { "7.30" } deg, mens tabellen flytter den med { "7.36" } deg;

seg-dc2756c75401 = GPS-baselinen under betingelserne i SPS PS Appendix B (ét siderisk døgn, { "287" } trin på fem minutter, et gitter på { "4" } deg, alle i sigte, maske på { "5" } deg) giver en global HDOP-median på { "0.940" }, { "90" } % { "1.165" }, { "95" } % { "1.255" }, { "98" } % { "1.370" } og gennemsnit { "0.965" } mod de offentliggjorte { "0.94" }, { "1.16" }, { "1.25" }, { "1.37" } og { "0.96" } (tærskel { "0.03" }, fastsat før første kørsel). PDOP-median { "1.795" } ligger under { "1.815" } i tabel B.3-1, som beskriver en forringet blanding af 20-24 satellitter. PDOP på { "6" } eller derunder holder { "100" } % af tiden mod { "98" } % globalt og { "88" } % på det værste sted i tabel 3.8-1.

seg-9aac9d8aa228 = Kontrolleret mod en håndudledning, ikke et eksternt dokument: en DOP for én epoke svarer til den lukkede form for en zenitsatellit og tre ved { "30" } deg elevation (PDOP 8/3, GDOP { "3.0732" }).

seg-d946dad08e23 = MODELLED: tolegemebaner med valgfri sekulær J2-drift; et sfærisk legeme; kun geometrisk synlighed (ingen signaleffekt, satellitsundhed eller terræn); ingen tredjelegemeforstyrrelse, som en rigtig frossen månebane afhænger af. Det værste enkelte tid-rum-punkt afhænger af gitteret: HDOP { "2.40" } og VDOP { "5.22" } her mod { "2.49" } og { "5.43" } offentliggjort; disse rapporteres, ikke låses fast. De fire systemers forudindstillinger stammer fra forskellige referenceepoker, så deres indbyrdes fase i én kørsel er ikke et øjebliksbillede af nogen dato.

seg-a6c63abeb7e6 = Medfølgende scenarier

seg-3e6a942c84d4 = Hver linje angiver, hvad kørslen udskriver med kshana { $version }.

seg-c8b40c9c2c00 = <c1/>: GPS, Galileo, BeiDou og GLONASS ({ "102" } satellitter) over ét døgn over en maske på { "10" } deg, ét ur pr. system. Tilgængelighed (PDOP { "6" } eller derunder) { "100" } % globalt og på det værste sted, median-PDOP { "0.95" }, i gennemsnit { "31.0" } satellitter i sigte.

seg-b65ade1eab04 = <c1/>: { "5 000" } satellitter i fire skaller i lav jordbane (LEO) til positionering, navigation og tidssynkronisering (PNT), med J2, over en maske på { "20" } deg. Tilgængelighed (PDOP { "3" } eller derunder) { "99.22" } % globalt og { "0" } % på det værste sted, median-PDOP { "1.11" }, i gennemsnit { "39.4" } satellitter i sigte.

seg-7d860ca30360 = <c1/>: { "8" } satellitter i elliptiske frosne månebaner og en cirkulær skal med 6 satellitter omkring Månen. Tilgængelighed (PDOP { "6" } eller derunder) { "21.33" } % globalt og { "0" } % på det værste sted, median-PDOP { "5.22" }, i gennemsnit { "3.2" } satellitter i sigte.

seg-0c331bea1f52 = LEO-PNT-dækning for brugere ved polerne og i Arktis, sammenlignet med GNSS i middelhøj jordbane, er polartilstanden i typen <c1/> (<c2/>; se <a1>LEO-PNT.md</a1>).

seg-9aab3bf49146 = <s1>Forrige</s1>Fusioneret MEO- og LEO-positionering

seg-9f717b9015e1 = <s1>Næste</s1>Modeller af kvantesensorer
