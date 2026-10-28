# docs--kind-lunar-ascent: translations (cs)

seg-f942b36a11c4 = Zatím ne na GitHubu

seg-98151954f217 = nepravda

seg-1f17ef6a853e = Druh scénáře enginu v{ $version }, rodina <a1>Lunární a cislunární</a1>. Pouze poradní charakter: výstup analýzy z výzkumného a inženýrského nástroje; nejde o typově schválené navigační zařízení ani o službu z oblasti bezpečnosti života. Každý štítek zde je štítkem enginu nebo verifikační matice; druh je MODELLED, pokud matice neříká jinak (jak se štítek získává: oddíl Evidence v README).

seg-1c1eeb2dcaa0 = Stránka rodiny: <a1>Lunární a cislunární</a1>

seg-6a26b9ab59fe = Stránka tématu: <a1>MISSION-THREAD.md</a1>

seg-f4b0bdb93d10 = Zdroj: <c1/>

seg-b8ef47331221 = <c1/> (druh scénáře)

seg-ae3053a1f6c8 = MODELLED motorický výstup z jihopolárního povrchového místa na oběžnou dráhu setkání a kovariance polohy a rychlosti, kterou přenáší zpět na dráhu (ve stylu Artemis). Pětistavový inerciální model chyb po osách z lunar-descent (poloha, rychlost, bias akcelerometru, náklon polohy, bias gyroskopu, buzený specifickou silou) běží na všech třech osách místa od povrchového stavu, s nímž fáze vstupuje; určení polohy AFS z viditelných relé ILLUSTRATIVE konstelace třídy LCNS (samostatné, nebo diferenční s využitím rezidua korekčního spoje z lunar-differential-pnt, s podporou hodin, když jsou viditelná jen tři relé) se pořizuje v stanoveném intervalu, přičemž lunární čas vstupuje přes hodiny vozidla a chyba časové značky podél dráhy. Uvádí uzavřené inerciální zdroje, příspěvek podpory, ablaci, navigační 1 sigma po dobu výstupu, rozptyl vypnutí motoru vedle navigační znalosti a úplnou kovarianci 6x6 MCI při vložení se zachovanou korelací polohy a rychlosti. MODELLED: ilustrační třída IMU, specifická síla, sada relé a rozptyl vypnutí; chyby držené v osách místa startu; nominální výstupní stav je zástupný. Bez podpory agentury; software pouze poradního charakteru, nikoli certifikované navigační zařízení.

seg-fc4d2ba3f99e = Jeden běh <c1/> se shrne takto: lunar-ascent | -89.50 deg | jen inerciálně { "785" } m / { "3.49" } m/s | s AFS { "11.4" } m / { "0.071" } m/s | rozptyl vložení { "1.73" } m/s (MODELLED)

seg-9fcdb15c21eb = Volitelná pole: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>, <c19/>, <c20/>, <c21/>

seg-a1c3e374f512 = Příklad <c1/> mimo jiné nastavuje:

seg-ebc18c9bcbac = diferenční

seg-3843825d0733 = us

seg-2d84b341a41f = Štítek výsledku (enginu): MODELLED

seg-463a919e84d5 = Graf, který engine zapisuje pro scenarios/lunar-ascent.toml, druh lunar-ascent

seg-52ee53bc1cd6 = <b>MODELLED</b> Druh a fáze <c1/>: pětistavový inerciální model chyb po osách běžící přes motorický výstup se specifickou silou podél trajektorie, podporovaný určeními polohy AFS a lunárním časem, uvádějící kovarianci polohy a rychlosti při vložení přenášenou

seg-4e0c4b02eac0 = <b>MODELLED</b> Druh a fáze <c1/>: pětistavový inerciální model chyb po osách běžící přes motorický výstup se specifickou silou podél trajektorie, podporovaný určeními polohy AFS. Orákulum (InternalConsistency): Inerciální drift v uzavřeném tvaru a kontroly monotónnosti v testech. Neporovnává se žádný uskutečněný výstup

seg-8732ad9f7e07 = <b>MODELLED</b> Propagátor, který sdílejí lunární druhy (GRAIL GL0660B stupně a řádu { "150" }, Země a Slunce jako třetí tělesa, relativita, lunární orientace DE440), porovnaný s veřejnými. Orákulum (ExternalDataset): Efemeridy kosmických lodí z JPL Horizons pro LRO a CAPSTONE, proti prahům předregistrovaným v xval/mission-thread-lunar/PREREGISTRATION.md (dodatky { "1" } až { "6" }). LRO: MET, největší rozdíl ve 3D { "33" } m a radiální RMS { "2.4" } m proti { "500" } m a { "60" } m. CAPSTONE: NOT MET, rozdíl koncové polohy { "136.8" } km proti { "25" } km a rozdíl periapsidy { "28.4" } km proti { "10" } km, příčiny nebyly izolovány. Řádek je modelovaný, protože práh CAPSTON

seg-626ab55f0424 = MODELLED (výsledek <c1/>)

seg-745dfc03a929 = MODELLED motorický výstup z jihopolárního povrchového místa na oběžnou dráhu setkání a kovariance polohy a rychlosti, kterou přenáší zpět na dráhu (ve stylu Artemis). (katalog druhů (<c1/>))

seg-3fd0cca78937 = MODELLED: ilustrační třída IMU, specifická síla, sada relé a rozptyl vypnutí; chyby držené v osách místa startu; nominální výstupní stav je zástupný. (katalog druhů (<c1/>))

seg-2cfb37d39847 = ČESTNOST: MODELLED. Třída IMU, zarovnání, specifická síla a rozptyl vypnutí jsou ILLUSTRATIVE vstupy, nikoli měření. Chyby jsou drženy v osách východ-sever-nahoru místa startu, bez zakřivení dráhy po směru letu, a nominální výstupní stav je zástupný v místní svislici místa: výsledkem je jen kovariance. Netvrdí se žádná shoda s žádným skutečným vozidlem. Software pouze poradního charakteru, nikoli c (komentář v souboru scénáře, řádky { "11" } až { "15" })

seg-6faf49cac41a = Motorický výstup z lunárního polárního místa na dráhu vložení (<c1/>) je MODELLED, nikoli ověřen: zkontrolován proti vlastní identitě v uzavřeném tvaru / analytické — zachytí chyby přepisu a koeficientů, ale není externím orákulem. (verifikační matice (docs/MODELLED-RATIONALE.md))

seg-e482c9896140 = Propagace lunárním silovým modelem proti veřejným rekonstruovaným trajektoriím lunárních orbiterů a cislunárních těles je MODELLED, nikoli ověřena: dílčí tvrzení je externě zkontrolováno, ale celá schopnost skládá modelované části, takže schopnost zůstává modelovaná. (verifikační matice (docs/MODELLED-RATIONALE.md))

seg-e66e2ca31e54 = Stránka tématu: <a1>MISSION-THREAD-LUNAR.md</a1>

seg-1a1799e01ac4 = <s1>Předchozí</s1>link-budget

seg-59d4cb995cb9 = <s1>Další</s1>lunar-attack-surface
