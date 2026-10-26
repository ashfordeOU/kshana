# docs--kinds-constellations-coverage-and-geometry: translations (cs)

seg-6e0cb6acc073 = VALIDATED

seg-b03d56f501c3 = Druh

seg-3f749aef8d89 = Marsovské PNT v hlubokém vesmíru: simulovaná konstelace relé MARCONI (areostacionární + nakloněná relé vysílající jednosměrně + předávající dvousměrně do stanice v hlubokém vesmíru) navigují referenčního uživatele (transfer | lmo | surface) přes společný fúzní odhadovač jednosměrného/dvousměrného radiometrického měření. Uvádí geometrii/viditelnost v každé epoše, dosažené RMS vůči pravdě a formální kovarianci (1σ / 3σ polohy) — čestné simulované měřítko kvality, NEJDE o ochrannou úroveň s certifikací.

seg-c564dca90854 = Graf, který engine zapisuje pro scenarios/mars-pnt-lmo.toml, druh mars-pnt

seg-e7dad1a1ecba = Určování polohy kolem libovolného tělesa sluneční soustavy: orbiter nebo povrchový lander kolem centrálního tělesa zvoleného podle názvu (Mars, Měsíc, Europa, Ganymed, Titan a zbytek katalogu sluneční soustavy), navigující jednosměrnými pseudovzdálenostmi z malé navigační konstelace typu Walker kolem tělesa (dvoutělesové dráhy se sekulárním driftem J2 daného tělesa, neznámé hodiny uživatele) a volitelně bezhodinovou dvoucestnou vzdáleností hlubokého vesmíru od Země, jejíž směr a vzdálenost pocházejí z analytických efemerid sluneční soustavy v každé epoše. Přímé viditelnosti blokuje střední koule tělesa a povrchový uživatel potřebuje také elevační masku. Za epochu: relé v dohledu, zda je Země nad okrajem tělesa, GDOP a PDOP samotné konstelace (geometrické a polohové zhoršení přesnosti), formální jednosigmová nejistota polohy s řádkem Země a bez něj a chyba určení polohy metodou nejmenších čtverců Gauss-Newton se seedem pro každou variantu; za celý běh: dostupnost, viditelnost Země, medián PDOP, chyba RMS a medián formální sigmy, plus světelný čas Země-těleso, oběh tam a zpět, Shapirovo zpoždění a úhel k Slunci v dané epoše. MODELLED: dráhy relé, úrovně šumu a okamžitý model měření jsou modelové volby, nikoli ověřené proti navigačním datům mise; konstanty těles jsou zveřejněné hodnoty uvedené v body.rs a geometrie Země přebírá označení efemerid sluneční soustavy.

seg-6f341acbe994 = Graf, který engine zapisuje pro scenarios/mars-orbit-pnt.toml, druh body-pnt

seg-de173c9f4034 = Návrh konstelací ve velkém měřítku: vzory Walker DELTA a Walker STAR v konvenci i: T/P/F (uzly rozložené přes { "360" } nebo { "180" } deg, rozestup v rovině { "360" }<em>P/T, fázový posun mezi rovinami { "360" }</em>F/T), explicitní seznamy prvků a vícevrstvé návrhy, několik konstelací v jednom běhu, kolem Země, Měsíce, Marsu nebo jakékoli jiné planety, Pluta či velkého měsíce s použitím konstant z modulu body (týchž, které používají druhy solar-system a body-pnt). PŘEDVOLBY ze zveřejněných nominálních prvků: gps-baseline a gps-expandable ({ "24" } slotů a šest předních/zadních rozšiřitelných dvojic z GPS Standard Positioning Service Performance Standard, 5. vydání { "2020" }, Tables 3.2-1 až 3.2-3), galileo (Walker 24/3/1 ve výšce { "29 599.801" } km a { "56" } deg, Galileo Open Service Service Definition Document, vydání { "1.1" }, Tables { "1" } a { "23" }), beidou a beidou-meo (Walker 24/3/1 ve výšce { "21 528" } km a { "55" } deg plus tři geostacionární družice na { "80" }, { "110.5" } a { "140" } deg E a tři skloněné geosynchronní družice na { "55" } deg, BeiDou Open Service Performance Standard { "3.0" }, oddíl { "4.1" }; fáze MEO a překřížení skloněné geosynchronní dráhy na { "118" } deg E jsou modelovány, protože je norma neuvádí) a glonass (24/3/1 ve výšce { "19 100" } km a { "64.8" } deg ze vzorce pro sloty z GLONASS Interface Control Document, vydání { "5.1" }, oddíl { "5.2" }). POKRYTÍ A ZHORŠENÍ PŘESNOSTI: nad mřížkou zeměpisné šířky a délky a vzorkovaným oknem s elevační maskou počet družic v dohledu, GDOP, PDOP, HDOP a VDOP v každé buňce, dostupnost (určení polohy s PDOP nejvýše na prahu, ve výchozím nastavení { "6" }) v každé buňce, globálně (vážené plochou) a na nejhorším stanovišti, s jedněmi hodinami přijímače na konstelaci, pokud není clock = "common". Škáluje se na tisíce družic: viditelnost je skalární součin vůči polovičnímu úhlu pokrytí každé družice a družice se každou epochu řadí do pásů podle zeměpisné šířky podpoložky, takže řádek mřížky testuje jen ty, které mohou být v dohledu; zpráva uvádí počet ušetřených testů dvojic. JSON nese mapy mřížky a podvzorkované pozemní stopy jednotlivých družic. VALIDATED: generátor Walker proti Galileo OS SDD Table { "23" } a vzorci slotů z GLONASS ICD, předvolba GPS proti zveřejněnému sloupci rovníkového přechodu v SPS PS Table 3.2-1 a globální rozdělení HDOP základní konstelace GPS proti SPS PS Appendix B (medián { "0.94" }, { "95" }% { "1.25" }, průměr { "0.96" }, tolerance { "0.03" }). MODELLED: dvoutělesové dráhy s volitelným sekulárním J2, kulové těleso, pouze geometrická viditelnost (žádný výkon signálu, zdraví družic ani terén) a relativní fáze mezi různými systémy, která není snímkem žádného skutečného data.

seg-899e728ad9bd = Graf, který engine zapisuje pro scenarios/leo-pnt-mega-shell.toml, druh constellation-design

seg-24266bc264df = Efemeridy a pozemní stopa: propagace jedné družice (TLE→SGP4 nebo analytická dráha) a výstup jejího stavu TEME/GCRS (poloha + rychlost), polohy ITRF/ECEF, podsatelitní zeměpisné šířky/délky/výšky WGS-84 a pro každý krok azimutu/elevace/vzdálenosti stanice + rychlosti změny vzdálenosti (Doppler). Družice pochází z <c1/> nebo z analytické <c2/> s jejím <c3/> (<c4/> má přednost, jsou-li zadány obě); s <c5/> přepíše <c6/> vlastní epochu TLE jako t = { "0" }.

seg-0fd3c58fde09 = Graf, který engine zapisuje pro scenarios/ephemeris.toml, druh ephemeris

seg-4e31c8daf798 = Registr

seg-44bbec836934 = Zdroj: <c1/>

seg-34a6079984a7 = Konstelace, pokrytí a geometrie (rodina druhů scénářů)

seg-6800289a282d = { "7" } druhů scénářů enginu v{ $version }. Pouze poradní charakter: výstup analýzy z výzkumného a inženýrského nástroje; nejde o typově schválené navigační zařízení ani o službu z oblasti bezpečnosti života. Každé označení zde pochází od enginu nebo z verifikační matice; druh je MODELLED, pokud matice neříká jinak (jak se označení získává: část Evidence v README).

seg-d95cc2c1e798 = Tematické stránky: <a1>CONSTELLATION-DESIGN</a1>, <a2>COVERAGE</a2>, <a3>SOLAR-SYSTEM</a3>, <a4>SKYLINE</a4>. Spusťte jednu: <c1/>. Všechny rodiny: <a5>KINDS.md</a5>.

seg-f044822c2fab = Přehledový list grafů, které engine zapisuje pro druhy z rodiny Konstelace, pokrytí a geometrie

seg-be0cfeeb1680 = MODELLED { "4" } · VALIDATED { "4" }

seg-e2450f89bcc6 = Efemeridy a pozemní stopa: propagace jedné družice (TLE→SGP4 nebo analytická dráha) a výstup jejího stavu TEME/GCRS (poloha + rychlost), polohy ITRF/ECEF, poddružicové šířky/délky/výšky WGS-84 a na každý krok

seg-d021c1b23dbc = Návrh konstelací ve velkém měřítku: vzory Walker DELTA a Walker STAR v konvenci i: T/P/F (uzly rozložené na { "360" } nebo { "180" } deg, rozestup v rovině { "360" }<em>P/T, fázový posun mezi rovinami { "360" }</em>F/T), explicitní

seg-d1c67e3dd12e = MODELLED { "1" } · VALIDATED { "2" }

seg-f6914ea43dba = Celá sluneční soustava v jedné epoše, pro PNT (určování polohy, navigaci a čas) kolem libovolného tělesa.

seg-06f082922143 = MODELLED { "2" } · VALIDATED { "3" }

seg-d71a07d8a59e = Určování polohy kolem libovolného tělesa sluneční soustavy: orbiter nebo povrchový lander kolem centrálního tělesa vybraného jménem (Mars, Měsíc, Europa, Ganymed, Titan a zbytek katalogu sluneční soustavy), navi

seg-436e412d99fd = MODELLED { "1" } · VALIDATED { "1" }

seg-f6b22521b4a4 = PNT v hlubokém vesmíru na Marsu: simulovaná relé konstelace MARCONI (areostacionární + nakloněná relé vysílající jednosměrně + předávající obousměrně do stanice v hlubokém vesmíru) navigují referenčního uživatele (transfer / l

seg-cc85d9962c25 = Predikce přeletů nad pozemní stanicí: časová přelety viditelnosti (AOS/TCA/LOS, maximální zdánlivá elevace, trvání) kruhové dráhy, jako střední prvky SGP4 na začátku okna, nad stanicí v

seg-23f3c33445d1 = MODELLED { "2" } · VALIDATED { "2" }

seg-a7bd3325080c = Povinná pole: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>. Volitelná: <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>.

seg-5e8a5e611ba9 = <b>Registr:</b> MODELLED { "4" } · VALIDATED { "4" }. Celá stránka se vstupy, výsledky, důkazy a omezeními: <a1>orbit</a1>.

seg-968c1512151e = Povinná pole: <c1/>. Volitelná: <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>.

seg-8c5e41cef6fd = <b>Registr:</b> VALIDATED. Celá stránka se vstupy, výsledky, důkazy a omezeními: <a1>ephemeris</a1>.

seg-47aaf1afd6ec = Povinná pole: žádná. Volitelná: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>.

seg-bacf2a133146 = <b>Registr:</b> MODELLED { "1" } · VALIDATED { "2" }. Celá stránka se vstupy, výsledky, důkazy a omezeními: <a1>constellation-design</a1>.

seg-e99c2a83034e = Povinná pole: žádná. Volitelná: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>.

seg-d91ded1df3a2 = <b>Registr:</b> MODELLED { "2" } · VALIDATED { "3" }. Celá stránka se vstupy, výsledky, důkazy a omezeními: <a1>solar-system</a1>.

seg-fe02605b130e = Povinná pole: žádná. Volitelná: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>.

seg-12bc4b4b4631 = <b>Registr:</b> MODELLED { "1" } · VALIDATED { "1" }. Celá stránka se vstupy, výsledky, důkazy a omezeními: <a1>body-pnt</a1>.

seg-bee590b4c9e7 = Povinná pole: žádná. Volitelná: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>.

seg-c0394ad71cfe = <b>Registr:</b> MODELLED. Celá stránka se vstupy, výsledky, důkazy a omezeními: <a1>mars-pnt</a1>.

seg-352823f8c5ac = Povinná pole: žádná. Volitelná: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>.

seg-bb4fa18e50a6 = <b>Registr:</b> MODELLED { "2" } · VALIDATED { "2" }. Celá stránka se vstupy, výsledky, důkazy a omezeními: <a1>passes</a1>.

seg-490ec99e2a38 = <s1>Předchozí</s1>Hodiny časování a holdover

seg-90ff7426b999 = <s1>Další</s1>Měření GNSS určování polohy a integrita

seg-cb4262b66b8f = Dostupnost GNSS + DOP z orbitální konstelace (Walker / TLE / RINEX).

seg-3b652c0da6de = Graf, který engine zapisuje pro scenarios/orbit-rinex.toml, druh orbit

seg-a4bdfc291fce = Predikce přeletů nad pozemní stanicí: časová oblast viditelnostních přeletů (AOS/TCA/LOS, maximální zdánlivá elevace, trvání) kruhové oběžné dráhy, jako střední prvky SGP4 na začátku okna, nad stanicí nad maskou elevace v rámci okna, s celkovým časem přístupu. Propagace SGP4/SDP4 v zemské soustavě IAU 2006/2000A (volitelně UT1 − UTC a pohyb pólu), troposférická refrakce ITU-R P.834-9 a světelný čas při sestupném spoji (obojí ve výchozím stavu zapnuto), průsečíky řešené na { "1e-7" } s a kulminace metodou zlatého řezu. Geometrie přeletů je VALIDATED vůči Orekitu { "13.1.8" } na stanicích v úrovni moře; oběžná dráha a stanice ve scénáři jsou ilustrativní vstupy.

seg-a09be8c586e3 = Graf, který engine zapisuje pro scenarios/passes.toml, druh passes

seg-0549bc926a9b = Celá sluneční soustava v jedné epoše, pro PNT (určování polohy, navigaci a čas) kolem libovolného tělesa. Pro Slunce, osm planet, Pluto, Měsíc, Phobos, Deimos, Io, Europu, Ganymed, Callisto a Titan vypisuje heliocentrickou polohu a rychlost v ICRF (International Celestial Reference Frame, rovníková J2000), heliocentrickou vzdálenost a ekliptikální délku a šířku J2000, gravitační parametr, rovníkový a střední poloměr, J2 tam, kde je publikováno, a jeho referenční poloměr, siderickou rotační periodu, pól IAU a nultý poledník v dané epoše, dráhu vzorkovanou po dobu jednoho oběhu (heliocentrickou pro planety, vztaženou k mateřskému tělesu pro měsíce) a světelný čas, jednosměrnou a dvousměrnou vzdálenost, sluneční Shapirovo zpoždění a úhlovou vzdálenost od Slunce z tělesa pozorovatele (výchozí Země); další spoje from/to se zpracují stejně. Polohy: keplerovské prvky JPL podle Standishe a Williamse (tabulka { "1" } pro roky { "1800" } n. l. až { "2050" } n. l., tabulky 2a/2b pro roky { "3000" } př. n. l. až { "3000" } n. l.) s nominální chybou každé planety, lunární řada Montenbrucka a Gilla pro rozdělení Země–Měsíc, střední prvky JPL s rychlostí synchronní rotace podle IAU pro marťanské a galileovské měsíce a rotační model IAU pro Titan. Světelný čas: radiometrické řešení pevného bodu, vysílač v opožděné poloze; newtonovský, se Shapirovým zpožděním uváděným zvlášť. VALIDATED proti JPL Horizons (DE441) v rozmezí dvojnásobku nominální chyby: Merkur až Saturn a Země z tabulky { "1" } (nejhorší { "1.87" }násobek nominální) a všech osm planet z tabulek 2a/2b (nejhorší { "1.71" }násobek) a světelný čas Země–Mars a Země–Jupiter. MODELLED, každý řádek označen: Uran a Neptun z tabulky { "1" } ({ "2.0" }násobek a { "5.2" }násobek nominální chyby proti DE441), Pluto (řádek z roku { "1992" }; bez uvedené chyby), Měsíc a sedm měsíců (měřeno proti Horizons, bez publikované meze).

seg-537aa8010e50 = Graf, který engine zapisuje pro scenarios/solar-system-tour.toml, druh solar-system
