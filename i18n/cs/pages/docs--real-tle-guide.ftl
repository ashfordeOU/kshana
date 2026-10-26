# docs--real-tle-guide: translations (cs)

seg-a6da23b43f90 = <s1>Další</s1>Kampaně

# c1: docs/REAL_TLE_GUIDE.md
seg-bc9ae2eda129 = Zdroj: <c1/>

seg-68b27f011ced = Použití skutečných TLE konstelací

# c1: scenarios/orbit-sgp4-gps.toml
# c2: gps-ops
# c3: strict_checksum = true
# c4: tests/fixtures/celestrak/gps-ops_2021-07-28.txt
# c5: scripts/fetch_tles.sh
seg-109e8a920fc2 = Přibalený <c1/> již nese <b>skutečné TLE</b> (dvouřádkové sady elementů): snímek Celestraku <c2/> provozní konstelace GPS (Global Positioning System) katalogizované 2021-07-28, { "30" } družic, s <c3/>. Každá družice je propagována pomocí SGP4/SDP4 (Simplified General Perturbations { "4" } / Simplified Deep-space Perturbations { "4" }), která je ověřena proti oficiálním vektorům AIAA (American Institute of Aeronautics and Astronautics) 2006-6753. Týž snímek je vendorován jako <c4/> a <c5/> stahuje čerstvý. Než z něj budete citovat číslo geometrie, přečtěte si oddíl { "3" }: tento scénář propaguje každou družici od její vlastní epochy.

# c1: scenarios/orbit-real-tle.toml
# c2: orbit
# c3: tle
seg-faed28835cb2 = Pro syntetický, samostatný příklad dává <c1/> šest družic podobných GPS jako holé záznamy řádku 2, propagované jako analytické keplerovské elementy, a každý scénář <c2/> bez bloku <c3/> sestaví konstelaci Walker.

seg-1c9b96a07f5b = Chcete-li studovat <b>aktuální</b> konstelaci GPS (nebo jakoukoli jinou), vložte čerstvý snímek.

seg-95bb71044de0 = { "1" }. Stáhněte aktuální snímek

seg-ab93ab55ddd9 = <a1>Celestrak</a1> redistribuuje sady elementů z katalogu NORAD (North American Aerospace Defense Command), obnovované nejméně denně. Pro GPS:

# c1: galileo
# c2: glo-ops
# c3: beidou
# c4: stations
seg-da7b4b89848b = Další užitečné skupiny: <c1/>, <c2/> (GLONASS, ruský Global Navigation Satellite System), <c3/>, <c4/> (ISS, Mezinárodní kosmická stanice, a další stanice s posádkou).

seg-d7fe0dccbc36 = Soubor je posloupnost třířádkových záznamů (jméno, řádek { "1" }, řádek { "2" }). Parser Kshany řádky se jmény ignoruje, takže soubor můžete vložit tak, jak je.

seg-c2d6ca2089a1 = { "2" }. Vložte jej do scénáře

# c1: tle
seg-6e221c5b640a = V libovolném scénáři oběžné dráhy nastavte blok <c1/> konstelace na obsah snímku:

seg-f2b0e78ef568 = (PRN je číslo kódu pseudonáhodného šumu, který družice GPS vysílá.)

seg-976bcb48df94 = Dvojice řádek { "1" } + řádek { "2" } je propagována pomocí <b>SGP4/SDP4</b> (členy odporu a hlubokého vesmíru); holý řádek { "2" } se bere jako analytické střední keplerovské elementy. Lze je míchat.

# c1: strict_checksum = true
# c2: false
seg-fa1d59fc7817 = <c1/> odmítne každý řádek, jehož kontrolní součet modulo 10 ve sloupci 69 je chybný — dobrá kontrola integrity čerstvě staženého souboru. Výchozí hodnota je <c2/>, protože syntetické výukové scénáře používají zástupné kontrolní součty.

seg-90d3872ebf87 = { "3" }. Poznámky k epochám — přečtěte si před citováním čísla geometrie

# c1: parse_propagators
# c2: src/tle.rs
# c3: t
# c4: tsince = t
seg-5e9056a30d53 = SGP4 propaguje každou družici od <b>její vlastní epochy TLE</b> a <c1/> (v <c2/>) vrací pouze propagátory, takže čas scénáře <c3/> se na každou družici uplatňuje nezávisle jako <c4/>. To je správná konvence jen tehdy, když všechny sady elementů v souboru sdílejí epochu.

seg-3d04797ae50e = <b>Skupinový soubor Celestraku vám to nedává.</b> Soubor je <em>stažen</em> v jednom okamžiku, ale sada elementů každé družice se obnovuje vlastním tempem, takže epochy v něm jsou rozloženy na dny. Změřeno na sadách vendorovaných v tomto repozitáři (řádek { "1" }, sloupce { "19" }–{ "32" }):

seg-5f67557dd207 = fixture

seg-ce4855643f31 = sady

seg-49a5b4798be4 = rozptyl epoch

seg-b758a9b7ee02 = { "70.6" } h

seg-79e6ea88957c = { "76.4" } h

seg-e1e30f69fa4f = { "335.7" } h

# c1: orbit
# c2: integrity
seg-9d38cc073c94 = { "70.6" } h je { "5.9" } oběhu GPS. Při propagaci tak, jak je, je fázování v rovině zpřeházené: družice jsou ve správných výškách a sklonech, ale nejsou tam, kde byly v kterýkoli jeden den, takže viditelná množina, faktor DOP (zhoršení přesnosti) a z nich vypočtená dostupnost popisují konstelaci, která nikdy neexistovala. Nic v parseru tento rozptyl neměří a druhy <c1/> a <c2/> epochy nesjednocují: blok TLE ve scénáři se vždy propaguje s epochou každé družice zvlášť.

# c1: tsince
# c2: Tle::epoch_days_1950
# c3: tests/igs_real_data.rs
# c4: real_gps_tle_snapshot
seg-fa82a18e4418 = <b>Udělejte raději toto.</b> Uchovejte epochu vedle propagátoru, vyberte jeden referenční okamžik a posuňte k němu <c1/> každé družice. <c2/> je veřejné, takže smyčka zpracování je krátká; <c3/> (<c4/>) je řešený příklad v tomto stromu:

# c1: tests/igs_real_data.rs
# c2: teme_to_ecef
seg-78092818695e = TEME je soustava pravého rovníku a středního jarního bodu, ve které SGP4 pracuje; <c1/> ji pomocí <c2/> otáčí do souřadnic pevných vůči Zemi.

seg-78f483dfc3fa = Pokud epochy nesjednotíte, uveďte to při vykazování čísla: je to výrok o orbitálních <em>slupkách</em>, nikoli o skutečné obloze.

# c1: tests/araim_dual_real_data.rs
seg-34fddbd3d57f = Jak moc na tom záleží, je změřeno v <c1/>, které uplatňuje tytéž posuny (referenční okamžik: nejnovější epocha v kombinovaných fixture GPS + Galileo, 2026-06-07T07:{ "21" }:{ "04" } UTC (koordinovaný světový čas)) během { "24" } h běhu dostupnosti dvoukonstelačního ARAIM (pokročilé autonomní monitorování integrity v přijímači). Při VAL (vertikální mez výstrahy) { "12" } m dává zarovnaná obloha pro samotné GPS { "0.993" }, pro sloučené GPS+Galileo { "1.000" } a pro dvojí konstelaci odolnou proti poruše konstelace { "0.990" }; nezarovnaná konvence s epochou každé družice zvlášť dává pro tytéž vstupy { "0.208" }, { "0.671" } a { "0.031" } — jiný závěr, nikoli malou chybu.

# c1: README.md
seg-49f6c8f71d99 = <a1><c1/></a1> — scénáře oběžných drah.

# c1: SCENARIOS.md
# c2: orbit
# c3: integrity
# c4: gnss-sim
# c5: jamming
# c6: constellation-design
# c7: constellation
# c8: ephemeris
# c9: tle
seg-c842884cb3e7 = <a1><c1/></a1> — pole druhu <c2/>; druhy <c3/>, <c4/>, <c5/> a <c6/> berou stejnou tabulku <c7/> a <a2><c8/></a2> bere jediné <c9/>.

# c1: INTEGRITY.md
seg-a2c5db6dcf42 = <a1><c1/></a1> — engine ARAIM, který test se skutečnou oblohou řídí.

# c1: src/tle.rs
# c2: parse_propagators
# c3: ParseOpts { strict_checksum }
seg-106047488885 = <c1/> — parser (<c2/>, <c3/>).

seg-c9068c1bc579 = <s1>Předchozí</s1>Schéma výsledku
