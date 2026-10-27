# docs--kind-constellation-design: translations (cs)

seg-e27476e37522 = Země

seg-37d29d8303fe = km

seg-11e8c29ecb45 = Druh scénáře enginu v{ $version }, rodina <a1>Konstelace, pokrytí a geometrie</a1>. Pouze poradní charakter: výstup analýzy z výzkumného a inženýrského nástroje; nejde o typově schválené navigační zařízení ani o službu z oblasti bezpečnosti života. Každé označení zde pochází z enginu nebo z verifikační matice; druh je MODELLED, pokud matice neuvádí jinak (jak se označení získává: oddíl Evidence v README).

seg-a4f1e7d2041e = Stránka rodiny: <a1>Konstelace, pokrytí a geometrie</a1>

seg-670191cf797f = Tematická stránka: <a1>SOLAR-SYSTEM.md</a1>

seg-cb91473bfdda = Tematická stránka: <a1>LEO-PNT.md</a1>

seg-f305ed6dc164 = Zdroj: <c1/>

seg-f708c26a5139 = <c1/> (druh scénáře)

seg-de173c9f4034 = Návrh konstelací ve velkém měřítku: vzory Walker DELTA a Walker STAR v konvenci i: T/P/F (uzly rozložené přes { "360" } nebo { "180" } deg, rozestup v rovině { "360" }<em>P/T, fázový posun mezi rovinami { "360" }</em>F/T), explicitní seznamy prvků a vícevrstvé návrhy, několik konstelací v jednom běhu, kolem Země, Měsíce, Marsu nebo jakékoli jiné planety, Pluta či velkého měsíce s použitím konstant z modulu body (týchž, které používají druhy solar-system a body-pnt). PŘEDVOLBY ze zveřejněných nominálních prvků: gps-baseline a gps-expandable ({ "24" } slotů a šest předních/zadních rozšiřitelných dvojic z GPS Standard Positioning Service Performance Standard, 5. vydání { "2020" }, Tables 3.2-1 až 3.2-3), galileo (Walker 24/3/1 ve výšce { "29 599.801" } km a { "56" } deg, Galileo Open Service Service Definition Document, vydání { "1.1" }, Tables { "1" } a { "23" }), beidou a beidou-meo (Walker 24/3/1 ve výšce { "21 528" } km a { "55" } deg plus tři geostacionární družice na { "80" }, { "110.5" } a { "140" } deg E a tři skloněné geosynchronní družice na { "55" } deg, BeiDou Open Service Performance Standard { "3.0" }, oddíl { "4.1" }; fáze MEO a překřížení skloněné geosynchronní dráhy na { "118" } deg E jsou modelovány, protože je norma neuvádí) a glonass (24/3/1 ve výšce { "19 100" } km a { "64.8" } deg ze vzorce pro sloty z GLONASS Interface Control Document, vydání { "5.1" }, oddíl { "5.2" }). POKRYTÍ A ZHORŠENÍ PŘESNOSTI: nad mřížkou zeměpisné šířky a délky a vzorkovaným oknem s elevační maskou počet družic v dohledu, GDOP, PDOP, HDOP a VDOP v každé buňce, dostupnost (určení polohy s PDOP nejvýše na prahu, ve výchozím nastavení { "6" }) v každé buňce, globálně (vážené plochou) a na nejhorším stanovišti, s jedněmi hodinami přijímače na konstelaci, pokud není clock = "common". Škáluje se na tisíce družic: viditelnost je skalární součin vůči polovičnímu úhlu pokrytí každé družice a družice se každou epochu řadí do pásů podle zeměpisné šířky podpoložky, takže řádek mřížky testuje jen ty, které mohou být v dohledu; zpráva uvádí počet ušetřených testů dvojic. JSON nese mapy mřížky a podvzorkované pozemní stopy jednotlivých družic. VALIDATED: generátor Walker proti Galileo OS SDD Table { "23" } a vzorci slotů z GLONASS ICD, předvolba GPS proti zveřejněnému sloupci rovníkového přechodu v SPS PS Table 3.2-1 a globální rozdělení HDOP základní konstelace GPS proti SPS PS Appendix B (medián { "0.94" }, { "95" }% { "1.25" }, průměr { "0.96" }, tolerance { "0.03" }). MODELLED: dvoutělesové dráhy s volitelným sekulárním J2, kulové těleso, pouze geometrická viditelnost (žádný výkon signálu, zdraví družic ani terén) a relativní fáze mezi různými systémy, která není snímkem žádného skutečného data.

seg-21fbd84bfba1 = Jeden běh <c1/> se shrnuje takto: constellation-design: { "5000" } družic (LEO-PNT) kolem Země; dostupnost { "99.22" }% (PDOP <= { "3" } při masce { "20" } deg), nejhorší stanoviště { "0.00" }%, medián PDOP { "1.11" }, průměrně { "39.4" } v dohledu; { "648" } bodů mřížky x { "12" } epoch (MODELLED)

seg-af572ce1fd89 = Volitelná pole: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>

seg-fd393ddc7d5d = Příklad <c1/> mimo jiné nastavuje:

seg-d72b4c5393e0 = earth

seg-d9b3c54bd272 = common

seg-6411970ba342 = delta

seg-3bc1761c76ab = Tento druh používají { "3" } přibalené scénáře; ostatní jsou v <a1><c1/></a1>.

seg-0a6f7f6c66c4 = km^3/s^{ "2" }

seg-ab9b72b9ffce = Označení výsledku (z enginu): MODELLED - dvoutělesové keplerovské dráhy (volitelně se sekulárním J2) kolem kulového tělesa, geometrická viditelnost nad elevační maskou, zhoršení přesnosti ze všech družic v dohledu s jedněmi hodinami přijímače na konstelaci, pokud není clock = "common"; žádný výkon signálu, zdraví ani terén. Geometrie Walker a zveřejněné

seg-899e728ad9bd = Graf, který engine zapisuje pro scenarios/leo-pnt-mega-shell.toml, druh constellation-design

seg-7400f24ec992 = MODELLED { "1" } · VALIDATED { "2" }: řádky <a1>verifikační matice</a1>, které tento druh uvádějí.

seg-602493ac6987 = <b>VALIDATED</b> Generátory druhu <c1/>: vzory Walker delta a star v konvenci T/P/F (rozestup uzlů 360/P nebo 180/P, rozestup v rovině { "360" }·P/T, fázový posun mezi rovinami { "360" }·F/T) a základní a rozšiřitelné 24slotové předvolby GPS, Gal

seg-bdc81f37ad16 = <b>VALIDATED</b> Pokrytí enginem <c1/> na základní 24slotové předvolbě GPS za podmínek přílohy B normy GPS Standard Positioning Service Performance Standard (SPS PS) (jeden hvězdný den, { "287" } pětiminutových kroků, globální mřížka { "4" } x { "4" } deg s

seg-1272200ad4f2 = <b>MODELLED</b> Druh <c1/> nad rámec dvou pevně daných případů: explicitní a vícevrstvé návrhy, několik konstelací na běh s jedněmi hodinami přijímače na konstelaci, Země, Měsíc a Mars z konstant těles, předvolba BeiDou Testy: <a1>coverage_dop_gnss_lib_py_oracle.rs</a1>.

seg-0c64f22330d2 = <b>VALIDATED</b> Generátory druhu <c1/>: vzory Walker delta a star v konvenci T/P/F (rozestup uzlů 360/P nebo 180/P, rozestup v rovině { "360" }·P/T, fáz. Oracle (ExternalDataset): Zveřejněné dokumenty agentur: Galileo Open Service Service Definition Document, vydání { "1.1" } (European GNSS Service Centre), Tables { "1" } a { "23" }, referenční konstelace k 2016-11-21 { "00" }:{ "00" } UTC; GLONASS Interface Control Document, vydání { "5.1" } ({ "2008" }), oddíl { "5.2" }, vzorec pro sloty udávající délku uzlu a argument šířky; GPS Standard Positioning Service Performance Standard, 5. vydání (duben { "2020" }), Tables 3.2-1, 3.2-2 a

seg-87c4e19dc780 = <b>VALIDATED</b> Pokrytí enginem <c1/> na základní 24slotové předvolbě GPS za podmínek přílohy B normy GPS Standard Positioning Service Performance Standard (SPS PS) Appendix . Oracle (ExternalDataset): GPS SPS PS, 5. vydání (duben { "2020" }), Appendix B, oddíly B.3.2.2 a B.3.2.3, zveřejněné globálně průměrné rozdělení HDOP plně obsazené základní 24slotové konstelace (medián { "0.94" }, { "90" } % { "1.16" }, { "95" } % { "1.25" }, { "98" } % { "1.37" }, průměr { "0.96" }), Table 3.8-1 (dostupnost PDOP) a Table B.3-1 (souborový PDOP degradované konstelace, použit jen jako horní mez), plus ručně odvozený uzavřený tvar pro jednu epochu. VDOP a PD

seg-04289f7252cd = <b>MODELLED</b> Druh <c1/> nad rámec dvou pevně daných případů: explicitní a vícevrstvé návrhy, několik konstelací na běh s jedněmi hodinami přijímače na konste. Oracle (InternalConsistency): Vnitřní konzistence: hrubým výpočtem prohledaný elevační sken, ručně vypočtené redukce a redukce z orbit::dop a uzavřená geometrie Walker a geosynchronní. Dvoutělesové dráhy s volitelným sekulárním J2, kulové těleso s místní svislicí podél poloměru, pouze geometrická viditelnost (žádný výkon signálu, zdraví družic, terén ani rušení třetím tělesem) a relativní fáze mezi systémy převzatá z různých re

seg-00fa65d44cbd = MODELLED - dvoutělesové keplerovské dráhy (volitelně se sekulárním J2) kolem kulového tělesa, geometrická viditelnost nad elevační maskou, zhoršení přesnosti ze všech družic v dohledu s jedněmi hodinami přijímače na konstelaci, pokud není clock = "common"; žádný výkon signálu, zdraví ani terén. Geometrie Walker a zveřejněné předvolby jsou zkontrolovány proti tabulkám slotů Galileo OS SDD, GLONASS ICD a GPS SPS Performance Standard, a (výsledek <c1/>)

seg-62f0fc16a247 = MODELLED: dvoutělesové dráhy s volitelným sekulárním J2, kulové těleso, pouze geometrická viditelnost (žádný výkon signálu, zdraví ani terén) a relativní fáze mezi různými systémy, která není snímkem žádného skutečného data. (katalog druhů (<c1/>))

seg-3ef4276dd40b = Na co běh odpovídá: družice v dohledu, PDOP/HDOP/VDOP/GDOP na buňku { "10" } deg a podíl času s PDOP nejvýše { "3" } nad maskou { "20" } deg za dvě hodiny. Slabým místem, které mapa ukazuje, jsou polární čepičky: žádná vrstva nesahá nad zeměpisnou šířku asi { "82" } deg, takže uživatel poblíž pólu vidí všechny družice na jedné straně oblohy a svislá geometrie se zhoršuje. MODELLED: ilustrativní návrh, dvoutělesové dráhy s J2, kul (komentář v souboru scénáře, řádky { "17" } až { "21" })

seg-c333d3fe22cd = Mapy pokrytí a zhoršení přesnosti pro libovolné návrhy s více konstelacemi ve velkém měřítku kolem libovolného centrálního tělesa jsou MODELLED, nikoli ověřeny proti nezávislé vnější referenci: kontrolují se proti vlastní uzavřené / analytické identitě, což zachytí chyby přepisu a koeficientů, ale není to vnější orákulum. (verifikační matice (docs/MODELLED-RATIONALE.md))

seg-436504a8b26f = <s1>Předchozí</s1>conflict-resilience

seg-cba188459c80 = <s1>Další</s1>contact-schedule
