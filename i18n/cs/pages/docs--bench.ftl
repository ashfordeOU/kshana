# docs--bench: translations (cs)

seg-5aa5efd6b7da = AUC

seg-5fcf52aba837 = Zdroj: <c1/>

seg-d3c3517e3bb2 = Otevřená sada úloh, rozdělení a metrik pro detekci interference GNSS a holdover času. Specifikace je <a1><c1/></a1> (verze { "2.0.0" }; licence textu a manifestů: CC-BY-4.0 / CC0 navrhováno, rozhodnutí vlastníka čeká). Přezkum licencí datové sady je <a2><c2/></a2>. Prahy základů byly stanoveny před prvním hodnoceným během v <a3><c3/></a3> a pro { "2.0.0" } v <a4><c4/></a4> a jejich výsledky jsou v <a5><c5/></a5>.

seg-6c455061baac = Verdikty, jak jsou tam zaznamenány: prahy hodnotitele, C1 až C3 a D2 jsou splněny; <b>A2 je NOT MET</b> (<c1/> AUC { "0.766" } proti požadovaným alespoň { "0.80" } na testovací části), <b>D1 je NOT MET</b> (největší rozdíl { "0.0301" }) a <b>úloha (b) R1 je NOT MET</b> (převzato, znovu nespuštěno). Žádný práh nebyl uvolněn.

seg-ebe1c987bc7c = Co to je: způsob, jak porovnávat metody na stejných datech stejným kódem metrik. Co to není: žebříček produktů, schválení ani důkaz, že metoda funguje v terénu. Každé skóre je MODELLED a skóre popisuje záznam nebo korpus, nikdy produkt. Výsledky Kshana mají poradní charakter.

seg-874effe5ee80 = Vestavěné základy úlohy D (optimistická mezera) kshana-bench na testovací části, ze skutečného běhu enginu v{ $version } (`kshana bench baseline`). Každá dvojice sloupců je plocha pod křivkou ROC na případech z rozdělení trénování a na posunutých případech; rozdíl mezi nimi je optimistická mezera, s tolerancí { "0.05" }. fused-max-z: { "0.998" } a { "0.983" } (mezera { "0.015" }); sqm-imbalance: { "0.882" } a { "0.882" } (mezera { "0.001" }); agc-excess: { "0.848" } a { "0.819" } (mezera { "0.030" }); raim-parity: { "0.682" } a { "0.672" } (mezera { "0.010" }); energy-cn0-drop: { "0.595" } a { "0.565" } (mezera { "0.030" }). Štítky jsou štítky generativního modelu syntetického korpusu, nikdy terénní data: MODELLED. Pouze poradní charakter: hodnoty vypočtené z modelu nebo změřené proti uvedeným referencím, nikoli schválení, certifikace ani prohlášení o shodě. Skóre popisuje záznam nebo korpus, nikdy produkt.

seg-6ce7bd4525d6 = Úlohy

seg-09907c94f04d = Úloha

seg-1c6199627b90 = Data

seg-9cdfe78e3b22 = Primární metrika

seg-5093217f24a1 = (a) detekce na záznamech přijímače

seg-809068c95ddf = jedna epocha záznamu JammerTest { "2024" }

seg-f87dda92fbd2 = stahuje <c1/> (GPL-3.0+, nikdy se nepřibaluje)

seg-9493bfc5bd64 = (b) detekce na IQ

seg-8d012e25aa62 = jedno hodnocené okno scény

seg-69f020ed20da = syntetický recept scény Kshana; TEXBAT pouze jako reference

seg-499ae444224e = AUC podle druhu poplachu

seg-73028caefeb0 = (c) predikce holdoveru času

seg-0d0b071690cf = (družice, počátek)

seg-6cf42152f523 = hodiny IGS po { "300" } s (přiložený výřez, pevný hash)

seg-74bd23dfebf5 = RMSE při { "3600" } s

seg-3cc3545250e5 = (d) optimistická mezera mimo rozdělení trénování

seg-ab343a29b019 = jeden syntetický případ

seg-b25d781ff536 = korpus <c1/>, v rozdělení i mimo něj

seg-e32f49d34f7b = výsledné AUC a mezera

seg-1ad563733f12 = Příkazy

seg-c9d00ff2e1d0 = Odevzdání je soubor (<c1/>): <c2/> (jedno číslo na identifikátor případu; vyšší hodnota znamená pravděpodobnější narušení) pro úlohy a, b a d, nebo <c3/> (změna fáze v ns na každém horizontu) pro úlohu c. Soubor s výsledky (<c4/>) uvádí verzi specifikace, rozdělení, SHA-256 pravdy a predikcí a metriky. Výsledky různých hlavních verzí specifikace se nikdy nedávají do jedné tabulky.

seg-bdc715c52ab5 = Upřímné meze

seg-f26f0e79f2ed = Holdouty z reálných dat (a a c) jsou veřejné, protože data si může stáhnout kdokoli. Chrání před výběrem rozdělení po zhlédnutí skóre, nikoli před laděním na těchto složkách. Utajený holdout úlohy (d) je závazek a odhalení: vlastník do <c1/> zapíše pouze hash a seed si ponechá (zatím žádný není utajen).

seg-81c3f961230b = Pravdou úlohy (a) jsou plánované útočné sloty v záznamech událostí s minutovým rozlišením, takže pravděpodobnost detekce je dolní mez; metriky na úrovni událostí (latence, nezachycené poplachy, falešné poplachy) přibudou s hodnotitelem Jammertest z <c1/>.

seg-47df52b5c5e6 = Základ IQ úlohy (b) je převzat z <c1/> a pro v1 nebyl znovu spuštěn.

seg-d54342791763 = Korpus úlohy (d) je kontrola separability a řetězce zpracování; AUC na něm je AUC nad štítky odvozenými z modelu.

seg-3d8bfdeead6c = <s1>Předchozí</s1>Observatoř interference: výsledky

seg-07f5b51844d1 = <s1>Další</s1>Spuštění přijímače proti scénáři
