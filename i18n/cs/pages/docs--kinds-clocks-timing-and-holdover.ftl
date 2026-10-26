# docs--kinds-clocks-timing-and-holdover: translations (cs)

seg-b03d56f501c3 = Druh

seg-78cba87823f7 = Holdover hodin oproti specifikaci; volitelný soubor Monte Carlo (runs > { "1" }).

seg-cb0b7da83f5c = Graf, který engine zapisuje pro scenarios/clock-ensemble.toml, druh clock

seg-c0924aa36e64 = MODELLED test holdoveru časovacího systému, vyhodnocený ze záznamu časové chyby, který dodává PROVOZOVATEL (log linuxptp ptp4l, phc2sys nebo ts2phc, sledovací nebo statistický log chrony, log hodin TICC, TimeLab nebo RINEX, nebo dvojice time_s,time_error_ns). Test má čtyři kroky a Kshana neprovádí žádný z nich: uzamčený ZÁKLAD, ODPOJENÍ GNSS provozovatelem (anténním kabelem nebo výstupem simulátoru; Kshana nic nevysílá a nic neovládá) ve stanovený čas, HOLDOVER na vlastním oscilátoru systému a OBNOVA poté, co provozovatel ve druhém stanoveném čase GNSS obnoví. Záznam se v těchto dvou časech rozdělí. Základ: statistiky časové chyby a masky ITU-T napsané pro uzamčené hodiny. Holdover: statistiky, zlomkový frekvenční offset, který systém držel (přímka metodou nejmenších čtverců), masky napsané pro holdover nebo autonomní hodiny, obálka holdoveru ePRTC-A ze stanovené doby uzamčení a doba do překročení každého rozpočtu časové chyby. Obnova: zda a kdy |TE| vstoupila do stanoveného pásma a zůstala v něm, špička a největší skok. Každý limit je přepsán z veřejné tabulky ITU-T (telekomunikační časové masky); používá se formulace „změřeno vůči masce“ a oba časy jsou prohlášením provozovatele, nejsou ověřeny. Záznam příliš krátký pro masku je INCOMPLETE a nikdy se neextrapoluje. Viz docs/TIMING-HIL.md.

seg-8ce93392747b = Graf, který engine zapisuje pro scenarios/holdover-test-ptp4l.toml, druh holdover-test

seg-4e31c8daf798 = Registr

seg-45a59bc9ac90 = Zdroj: <c1/>

seg-3b549536beed = Hodiny, časování a holdover (rodina druhů scénářů)

seg-9095869ec445 = { "9" } druhů scénářů enginu v{ $version }. Pouze poradní charakter: výstup analýzy z výzkumného a inženýrského nástroje; nejde o typově schválené navigační zařízení ani o službu z oblasti bezpečnosti života. Každé označení zde pochází od enginu nebo z verifikační matice; druh je MODELLED, pokud matice neříká jinak (jak se označení získává: část Evidence v README).

seg-59c2beac56b5 = Tematické stránky: <a1>TELECOM-TIMING</a1>, <a2>SLOT-TIMING</a2>, <a3>TIMING-HIL</a3>, <a4>CLOCK-LOG-FORMATS</a4>. Spusťte jednu: <c1/>. Všechny rodiny: <a5>KINDS.md</a5>.

seg-b333618375db = Přehledový list grafů, které engine zapisuje pro druhy z rodiny Hodiny, časování a holdover

seg-efd15cff3d32 = MODELLED (označení výsledku)

seg-ff7dca09f0f2 = Telekomunikační časování: časová chyba, maximální chyba časového intervalu (MTIE) a časová odchylka (TDEV) holdoveru GNSS, ověřené proti maskám ITU-T s výsledkem PASS nebo FAIL a rezervou pro každou masku.

seg-651ef9489065 = MODELLED { "5" } · VALIDATED { "1" }

seg-413edbab9fa9 = Slot timing: sekundy, než volně běžící hodiny opustí ochranný interval slotu pro směrování nebo zadávání úloh indexovaného časem (největší absolutní časová chyba, kterou slot toleruje), příspěvek každého členu při tom

seg-23dbca6bce68 = MODELLED { "2" } · VALIDATED { "1" }

seg-d425ce2b9f9c = Obousměrný družicový přenos času a frekvence mezi dvěma stanicemi přes geostacionární relé: obousměrná rovnice vyřešená pro T_A - T_B se všemi nereciprokými členy (zpoždění zařízení stanic, Ku

seg-a2a710b3204f = MODELLED test holdoveru časovacího systému, hodnocený podle záznamu časové chyby, který dodává OPERÁTOR (log linuxptp ptp4l, phc2sys nebo ts2phc, sledovací nebo statistický log chrony, TICC, TimeLab nebo RINEX

seg-1da440dd525c = MODELLED řetězec důvěryhodného kvantového časování: kompletní rozpočet přenosu času kvantového (optické mřížkové hodiny + spojení na bázi provázání/jednotlivých fotonů) oproti klasickému (CSAC + obousměrný RF), znovu použitá ochrana časování

seg-50d75d48ed43 = Povinná pole: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>. Volitelná: <c7/>, <c8/>.

seg-3273244f755c = <b>Registr:</b> MODELLED. Celá stránka se vstupy, výsledky, důkazy a omezeními: <a1>clock</a1>.

seg-ee8d6e20c844 = Povinná pole: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>. Volitelná: <c7/>.

seg-e359cc42506e = <b>Registr:</b> MODELLED. Celá stránka se vstupy, výsledky, důkazy a omezeními: <a1>sweep</a1>.

seg-616716b33732 = Povinná pole: <c1/>, <c2/>, <c3/>.

seg-6f282be980ca = <b>Registr:</b> žádný řádek matice tento druh neuvádí; engine označuje svůj výsledek sám. Celá stránka se vstupy, výsledky, důkazy a omezeními: <a1>sweep-nd</a1>.

seg-79c3d3cd6c7d = Povinná pole: žádná. Volitelná: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>.

seg-c23e498daa3d = <b>Registr:</b> MODELLED { "5" } · VALIDATED { "1" }. Celá stránka se vstupy, výsledky, důkazy a omezeními: <a1>telecom-timing</a1>.

seg-248e1686fddc = Povinná pole: <c1/>, <c2/>. Volitelné: <c3/>.

seg-cc04bc2d43c5 = <b>Registr:</b> MODELLED { "2" } · VALIDATED { "1" }. Celá stránka se vstupy, výsledky, důkazy a omezeními: <a1>slot-timing</a1>.

seg-50273a29deec = Povinná pole: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>.

seg-adf570e18299 = <b>Registr:</b> MODELLED. Celá stránka se vstupy, výsledky, důkazy a omezeními: <a1>timetransfer</a1>.

seg-5134a01b60a0 = Povinná pole: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>. Volitelná: <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>.

seg-09b554a74d49 = <b>Registr:</b> MODELLED. Celá stránka se vstupy, výsledky, důkazy a omezeními: <a1>time-transfer-budget</a1>.

seg-58952681ea9d = Povinná pole: <c1/>, <c2/>. Volitelná: <c3/>, <c4/>.

seg-635ec95c2e86 = <b>Registr:</b> MODELLED. Celá stránka se vstupy, výsledky, důkazy a omezeními: <a1>holdover-test</a1>.

seg-76bb4110ea36 = Povinná pole: žádná. Volitelná: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>.

seg-bb6d7df61e2f = <b>Registr:</b> žádný řádek matice tento druh neuvádí; engine označuje svůj výsledek sám. Celá stránka se vstupy, výsledky, důkazy a omezeními: <a1>quantum-time-transfer</a1>.

seg-245adc6e6766 = <s1>Předchozí</s1>Kampaně

seg-960d5c757310 = <s1>Další</s1>Konstelace pokrytí a geometrie

seg-540545e6f846 = Řetězec důvěryhodného kvantového časování, stav MODELLED: kompletní rozpočet přenosu času kvantový (hodiny s optickou mřížkou + spoj se spřažením/jednofotonový) oproti klasickému (CSAC + obousměrný RF), znovu použitá ochranná úroveň časování + bezpečnostní ukazatel kvality pro útok zpožděním/přehráním (1-P_md), pravděpodobnost detekce anomálie hodin + latence CUSUM a obchodní srovnání kvantového a klasického přístupu jako otevřené TradeEvidence se záznamem reprezentativnosti + mezer k letu. Ilustrativní parametry zařízení/spoje z veřejných zdrojů; modeluje třídu, netvrdí se žádné TRL/let/certifikace.

seg-09760f892c7b = Graf, který engine zapisuje pro scenarios/quantum-time-transfer.toml, druh quantum-time-transfer

seg-1b61962464c5 = Slot timing: počet sekund, než volně běžící hodiny opustí ochranný interval časově indexovaného směrovacího nebo úkolovacího slotu (největší absolutní časová chyba, kterou slot toleruje), příspěvek každého členu v tom okamžiku s uvedením dominantního (nejistota opravy, bílý fázový šum, bílý, flickerový, náhodné procházky a náhodného běhu frekvenční šum, zbytkový frekvenční posun, teplota, stárnutí), čas zbývající od poslední opravy a největší interval mezi opravami, který hodiny udrží uvnitř, po odečtení latence opravy. Oscilátor je výchozí hodnota TŘÍDY (csac, uso, dsac, tcxo, ocxo nebo rafs: jedna citovaná Allanova odchylka pro jednu sekundu a předpokládaná podlaha červeného šumu), TELEKOMUNIKAČNÍ PŘEDNASTAVENÍ Z KATALOGOVÉHO LISTU nebo vložený KATALOGOVÝ LIST (maxima Allanovy odchylky proložená jako obálka, plus stárnutí a teplotní koeficient) nebo vložený NAMĚŘENÝ ZÁZNAM FÁZE (jeho překrývající se Allanova odchylka proložená váženou metodou nejmenších čtverců v bázi bílé fáze a frekvenční modulace podle IEEE Std { "1139" }, takže podlaha červeného šumu je naměřená, nikoli předpokládaná). Překročení za nejdelší dobou průměrování, kterou katalogový list nebo záznam podporuje, je označeno jako extrapolované. Volitelná sekce spoofingu přidává ochrannou úroveň časování pro přijímač na oběžné dráze: orbitální rychlost a periodu, jak dlouho může jediný pozemní spoofer družici zasáhnout za přelet, práh monitoru podporovaného hodinami a latenci detekce CUSUM, podmíněnou mez, posun, který spoofer při uvedené maximální rychlosti změny nashromáždí, než družice opustí jeho dosah nebo proběhne nezávislá kontrola, a zda je každá kontrola při kontaktu se zemí nebo přes crosslink na tomto spooferu nezávislá. VALIDATED: inverze holdoveru z proloženého záznamu, držená stranou (held out) na skutečných cesiových hodinách měřených proti vodíkovému maseru (tests/slot_timing_cs5071a_holdout.rs, podmíněno daty); u naměřeného krystalového oscilátoru je predikce držená stranou konzervativní, ale nesplňuje práh, takže případ krystalu je MODELLED. MODELLED: zdroje třídy a katalogového listu, deterministické členy a posouzení spoofingu.

seg-97a91c8a60cd = Graf, který engine zapisuje pro scenarios/slot-timing-ocxo-leo.toml, druh slot-timing

seg-4f19d4fb1341 = Obecný N-rozměrný průchod libovolným balíčkem přes klíče TOML s tečkami / cesty metrik JSON.

seg-621a18c07044 = Graf, který engine zapisuje pro scenarios/sweep-nd-inertial.toml, druh sweep-nd

seg-e7ab7b55c969 = 1-D průchod obchodní studie parametrem balíčku hodin.

seg-c784b8f22f12 = Graf, který engine zapisuje pro scenarios/sweep-clock-stability.toml, druh sweep

seg-a448b24ded2b = Telekomunikační časování: časová chyba, maximální chyba časového intervalu (MTIE) a časová odchylka (TDEV) holdoveru GNSS, zkontrolované proti maskám ITU-T s výsledkem PASS nebo FAIL a rezervou pro každou masku. Vstupem je buď SYNTETICKÝ HOLDOVER (předvolba oscilátoru -- ocxo, rubidium, cesium nebo csac, každá nese údaje o stabilitě, stárnutí a teplotě z pojmenovaného veřejného katalogového listu Microchip -- plus čas ztráty GNSS, délka záznamu a vzorkovací interval; volně běžící hodiny nesou bílý, flickerový a, kde to proložení katalogového listu vyžaduje, frekvenční šum náhodné procházky, lineární stárnutí a sinusový teplotní člen) nebo NAČTENÁ ŘADA dvojic [time_s, time_error_ns] zadaných přímo (a pouze v nativních sestaveních soubor CSV). Masky: ITU-T G.8272 (07/2025) PRTC-A a PRTC-B (max|TE| { "100" } / { "40" } ns, MTIE tabulky 1-2, TDEV tabulky 3-4); G.8272.1 ({ "2024" }) Amd. { "1" } (07/2025) ePRTC v synchronizovaném stavu ({ "30" } ns, tabulky 1-2) a holdover ePRTC-A (obálka časové chyby z tabulky { "3" } rostoucí z { "30" } ns na { "100" } ns po dobu holdoveru H určenou dobou synchronizace, MTIE tabulka { "4" }, TDEV tabulka { "5" }); G.8273.2 ({ "2023" }) Amd. { "2" } (11/2025) třídy T-BC/T-TSC A-C (max|TE|, konstantní časová chyba, MTIE a TDEV filtrované dolní propustí) a třída D (max|TE_L| { "5" } ns, jediný údaj třídy D, který nebyl ponechán k dalšímu studiu); G.8271.1 ({ "2022" }) Amd. { "3" } (05/2025) referenční bod C (max|TE_L| { "1100" } / { "600" } / { "100" } ns s MTIE tabulky 7-1 až 7-3). Každá položka, kterou Doporučení označuje k dalšímu studiu, je vynechána, nikoli doplněna, a každá zpráva uvádí, co není implementováno. Uvádí také čas do překročení každého rozpočtu maximální časové chyby (výchozí: { "100" } ns max|TE_HO| ePRTC, { "400" } ns přidělení holdoveru sítě, { "1100" } ns bod C, { "1.5" } us třída { "4" }), křivky MTIE/TDEV jako tabulku CSV s limitem každé masky a pro každé číselné pole záznam o jednotkách a původu. VALIDATED: odhadovače MTIE a TDEV proti balíčku allantools na potvrzené řadě holdoveru. MODELLED: tabulky masek jsou přepisy a syntetický holdover je model sestavený z maxim katalogových listů, nikoli měření žádného kusu. Nejde o test shody.

seg-ec7745a09d08 = Graf, který engine zapisuje pro scenarios/telecom-synce-eec.toml, druh telecom-timing

seg-9a2bb9809aed = Obousměrný družicový přenos času a frekvence mezi dvěma stanicemi přes geostacionární relé: obousměrná rovnice řešená pro T_A - T_B se všemi nereciprokými členy (zpoždění zařízení stanic, ionosféra v pásmu Ku, transpondér, Sagnac), rozpočet nejistoty ve kvadratuře, jehož člen typu A je TDEV simulovaného spoje při době průměrování, simulovaný spoj s bílým a flickerovým fázovým šumem a denní nereciprocitou a stabilita (rychlost, zbytkové RMS, TDEV, ADEV) libovolné dodané řady BIPM Circular T oddíl { "1" }, CSV MJD,ns nebo záznamů hodin stanic IGS RINEX. MODELLED.

seg-92d3c84024d7 = Graf, který engine zapisuje pro scenarios/time-transfer-budget.toml, druh time-transfer-budget

seg-ccb244e60d60 = Optický oproti RF obousměrný přenos času/frekvence.

seg-bd76bd68eab3 = Graf, který engine zapisuje pro scenarios/timetransfer.toml, druh timetransfer
