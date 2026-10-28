# docs--kind-lunar-orbit-rendezvous: translations (cs)

seg-34bdcfd66ded = Ve větvi repozitáře, z níž tyto dokumenty pocházejí; zatím ne na GitHubu

seg-f942b36a11c4 = Zatím ne na GitHubu

seg-51362910dcb7 = { "2" } přibalené scénáře používají tento druh; ostatní jsou v <a1><c1/></a1>.

seg-1f17ef6a853e = Druh scénáře enginu v{ $version }, rodina <a1>Lunární a cislunární</a1>. Pouze poradní charakter: výstup analýzy z výzkumného a inženýrského nástroje; nejde o typově schválené navigační zařízení ani o službu z oblasti bezpečnosti života. Každý štítek zde je štítkem enginu nebo verifikační matice; druh je MODELLED, pokud matice neříká jinak (jak se štítek získává: oddíl Evidence v README).

seg-1c1eeb2dcaa0 = Stránka rodiny: <a1>Lunární a cislunární</a1>

seg-6a26b9ab59fe = Stránka tématu: <a1>MISSION-THREAD.md</a1>

seg-2d84b341a41f = Štítek výsledku (enginu): MODELLED

seg-8732ad9f7e07 = <b>MODELLED</b> Propagátor, který sdílejí lunární druhy (GRAIL GL0660B stupně a řádu { "150" }, Země a Slunce jako třetí tělesa, relativita, lunární orientace DE440), porovnaný s veřejnými. Orákulum (ExternalDataset): Efemeridy kosmických lodí z JPL Horizons pro LRO a CAPSTONE, proti prahům předregistrovaným v xval/mission-thread-lunar/PREREGISTRATION.md (dodatky { "1" } až { "6" }). LRO: MET, největší rozdíl ve 3D { "33" } m a radiální RMS { "2.4" } m proti { "500" } m a { "60" } m. CAPSTONE: NOT MET, rozdíl koncové polohy { "136.8" } km proti { "25" } km a rozdíl periapsidy { "28.4" } km proti { "10" } km, příčiny nebyly izolovány. Řádek je modelovaný, protože práh CAPSTON

seg-626ab55f0424 = MODELLED (výsledek <c1/>)

seg-e482c9896140 = Propagace lunárním silovým modelem proti veřejným rekonstruovaným trajektoriím lunárních orbiterů a cislunárních těles je MODELLED, nikoli ověřena: dílčí tvrzení je externě zkontrolováno, ale celá schopnost skládá modelované části, takže schopnost zůstává modelovaná. (verifikační matice (docs/MODELLED-RATIONALE.md))

seg-e66e2ca31e54 = Stránka tématu: <a1>MISSION-THREAD-LUNAR.md</a1>

seg-9e494e8809e5 = Zdroj: <c1/>

seg-8beb22a0eb0b = <c1/> (druh scénáře)

seg-2deefd8c547b = MODELLED relativní navigace pro dokování ve stylu Orion–lander na nízké lunární oběžné dráze nebo eliptické polární dráze (třída Artemis). Chaser a cíl létají po téže dráze podle lunárního modelu sil v crate; společný dávkový odhad Gauss–Newton s 21 parametry přes oblouk (dva stavy vozidel a trvalé biasy signálu v prostoru) slučuje absolutní polohové určení pro každé vozidlo ze sady relé ILLUSTRATIVE třídy LCNS (relé za Měsícem se vyřadí, potřeba jsou čtyři, společná složka chyby signálu v prostoru se mezi vozidly vyruší) a křížový odhad vzdálenosti, s přesností měření vzdálenosti danou mezí sledování kódu na pilotu LunaNet AFS. Uvádí formální chybu relativní polohy a rychlosti i chybu metodou Monte Carlo v osách LVLH cíle, dostupnost určení, střední normalizovanou kvadratickou chybu odhadu oproti její očekávané hodnotě a každý pokus, jehož iterace nezkonvergovala, drift vzniklý zanedbáním gravitačních harmonických a úplnou kovarianci 6x6 předávanou dál. Pro kruhový případ platí kontrola v uzavřeném tvaru podle Hilla/Clohessyho–Wiltshirea. MODELLED: ilustrativní sada relé, rozpočet chyb a apriorní hodnoty; skutečnost a odhadovač sdílejí jeden model sil, takže NEES kontroluje vnitřní konzistenci a nikoli chybu modelu. Bez podpory agentury; software pouze poradního charakteru, nikoli certifikované navigační zařízení.

seg-a6d29fc5f19b = Jeden běh <c1/> se shrne takto: lunar-orbit-rendezvous | llo 100x100 km | sep { "2000" } m | určení { "74" }% | rel. poloha 1sigma R/A/C 0.03/0.06/0.04 m | střední NEES { "6.51" } ({ "6" } očekáváno) | zkonvergovalo při { "2000" } s (MODELLED)

seg-b7c86affeac1 = Volitelná pole: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>, <c19/>, <c20/>, <c21/>, <c22/>, <c23/>, <c24/>, <c25/>

seg-42fe2ad9cfba = Příklad <c1/> mimo jiné nastavuje:

seg-60bd49f09fbc = llo

seg-bf92597fdba4 = Software pouze poradního charakteru, nikoli certifikované navigační zařízení

seg-4466fb6f4043 = dávkový Gauss–Newton přes oblouk

seg-d97b2505ac72 = Graf, který engine zapisuje pro scenarios/lunar-orbit-rendezvous.toml, druh lunar-orbit-rendezvous

seg-7ea832b979c9 = <b>MODELLED</b> Druh a fáze <c1/>: společný dávkový odhad Gauss–Newton dvou vozidel přes oblouk (dvacet jeden parametrů: oba stavy a trvalé polohové biasy signálu v prostoru, společné i nezávislé), narůstající přes čtvrtinu, polovinu. Testy: <s1>mission_thread_lunar_oracles.rs</s1>.

seg-826fd7fd44b9 = <b>MODELLED</b> Druh a fáze <c1/>: společný dávkový odhad Gauss–Newton dvou vozidel přes oblouk (dvacet jeden parametrů: oba stavy a trvalé polohové biasy signálu v prostoru, společné i nezávislé), narůstající přes čtvrtinu, polovinu. Orákulum (InternalConsistency): Vnitřní konzistence podle předregistrace (xval/mission-thread-lunar/PREREGISTRATION.md, výsledky a historie odhadovače v RESULTS.md): střední NEES relativního stavu je { "5.85" } až { "5.93" } oproti pásmu { "5.2" } až { "6.8" } ve čtyřech konfiguracích, MET u čtvrtého návrhu odhadovače poté, co tři návrhy se sekvenčním filtrem práh nesplnily; skutečnost a odhadovač sdílejí jeden model sil, takže to nic neříká o chybě modelu. Pro

seg-b2f273ea732d = MODELLED relativní navigace pro dokování ve stylu Orion–lander na nízké lunární oběžné dráze nebo eliptické polární dráze (třída Artemis). (katalog druhů (<c1/>))

seg-9d4f99557cc5 = MODELLED: ilustrativní sada relé, rozpočet chyb a apriorní hodnoty; skutečnost a odhadovač sdílejí jeden model sil, takže NEES kontroluje vnitřní konzistenci a nikoli chybu modelu. (katalog druhů (<c1/>))

seg-158e44d47c0b = ČESTNOST: MODELLED. Sada relé, chyba signálu v prostoru, podíl společné složky a apriorní hodnoty jsou ILLUSTRATIVE vstupy, nikoli měření; skutečnost a odhadovač sdílejí model sil (vestavěný centrální člen, J2 a C22). Předregistrovaná kontrola konzistence B1 (střední NEES v [{ "5.2" }, { "6.8" }]) je splněna ve všech čtyřech konfiguracích u dávkového návrhu: viz xval/mission-thread-lunar/RESULTS.md. Žádná shoda s žádným skutečným (komentář v souboru scénáře, řádky { "10" } až { "14" })

seg-2a88a9650804 = Relativní navigace k dokování na lunární oběžné dráze (<c1/>) je MODELLED, nikoli ověřena: kontroluje se proti vlastní uzavřené / analytické identitě, což zachytí chyby přepisu a koeficientů, ale není to vnější orákulum. (verifikační matice (docs/MODELLED-RATIONALE.md))

seg-6ac5bd1500a8 = <s1>Předchozí</s1>lunar-llr-datum

seg-54b1c9200aae = <s1>Další</s1>lunar-station-coverage
