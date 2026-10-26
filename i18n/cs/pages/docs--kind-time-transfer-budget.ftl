# docs--kind-time-transfer-budget: translations (cs)

seg-f42465f7d066 = ns

seg-dfe78b9d0811 = GHz

seg-cd04f5662884 = MODELLED. (katalog druhů (<c1/>))

seg-c61e88721556 = Druh scénáře enginu v{ $version }, rodina <a1>Hodiny, časování a holdover</a1>. Pouze poradní charakter: výstup analýzy z výzkumného a inženýrského nástroje; nejde o typově schválené navigační zařízení ani o službu z oblasti bezpečnosti života. Každé označení zde pochází z enginu nebo z verifikační matice; druh je MODELLED, pokud matice neuvádí jinak (jak se označení získává: oddíl Evidence v README).

seg-849c08d3ce70 = Stránka rodiny: <a1>Hodiny, časování a holdover</a1>

seg-937ebbbd612c = Zdroj: <c1/>

seg-6af6f07f5f5a = <c1/> (druh scénáře)

seg-9a2bb9809aed = Obousměrný družicový přenos času a frekvence mezi dvěma stanicemi přes geostacionární relé: obousměrná rovnice řešená pro T_A - T_B se všemi nereciprokými členy (zpoždění zařízení stanic, ionosféra v pásmu Ku, transpondér, Sagnac), rozpočet nejistoty ve kvadratuře, jehož člen typu A je TDEV simulovaného spoje při době průměrování, simulovaný spoj s bílým a flickerovým fázovým šumem a denní nereciprocitou a stabilita (rychlost, zbytkové RMS, TDEV, ADEV) libovolné dodané řady BIPM Circular T oddíl { "1" }, CSV MJD,ns nebo záznamů hodin stanic IGS RINEX. MODELLED.

seg-a4f8e9a09026 = Jeden běh <c1/> se shrnuje takto: time-transfer-budget: europe - north-america posun { "12.500" } ns (Sagnac { "204.365" } ns, ionosféra { "0.0213" } ns); kombinovaná u { "1.087" } ns (typ A { "0.031" } ns při { "86400" } s); { "0" } reálných řad (MODELLED)

seg-0353d795ebdf = Povinná pole: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>

seg-fe3afa366df2 = Volitelná pole: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>

seg-00026a1d3760 = Příklad <c1/> mimo jiné nastavuje:

seg-2409cc9397c7 = Popisek výsledku (z enginu): MODELLED — obousměrná rovnice TWSTFT (zpoždění stanic, ionosféra v pásmu Ku, transpondér, Sagnac) řešená z uvedených zpoždění, rozpočet nejistoty ve kvadratuře s TDEV simulovaného spoje jako členem typu A, simulovaný spoj s flickerovým fázovým šumem a denní nereciprocitou a stabilita libovolné r

seg-92d3c84024d7 = Graf, který engine zapisuje pro scenarios/time-transfer-budget.toml, druh time-transfer-budget

seg-83b9c66b9e92 = <b>MODELLED</b> Obousměrná rovnice TWSTFT řešená pro T_A - T_B se zpožděními vysílání a příjmu stanic, asymetrií ionosféry v pásmu Ku mezi uplinkem a downlinkem, rozdílem zpoždění transpondéru a členy Sagnac, proti jejímu přesnému přímému modelu; kvadraturní nejist

seg-58cf4086c7a5 = <b>MODELLED</b> Obousměrná rovnice TWSTFT řešená pro T_A - T_B se zpožděními vysílání a příjmu stanic, asymetrií ionosféry v pásmu Ku mezi uplinkem a downlinkem, rozdílem zpoždění transpon. Orákulum (InternalConsistency): Vnitřní konzistence: přímý model a řešená rovnice se shodují na { "1e-15" } s, člen Sagnac se rovná nezávislému tvaru smyčky BIPM 2A omega/c^{ "2" } modulu, ionosférický člen je { "40.3" } TEC (1/f_up^{ "2" } - 1/f_down^{ "2" })/c a šumové procesy vykazují očekávané tvary TDEV. CO NENÍ: nebylo porovnáno žádné skutečné měření TWSTFT ani kalibrační zpráva; uvedená zpoždění a nejistoty jsou vstupy, nikoli naměřené; t

seg-15de1cdaa684 = MODELLED — obousměrná rovnice TWSTFT (zpoždění stanic, ionosféra v pásmu Ku, transpondér, Sagnac) řešená z uvedených zpoždění, rozpočet nejistoty ve kvadratuře s TDEV simulovaného spoje jako členem typu A, simulovaný spoj s flickerovým fázovým šumem a denní nereciprocitou a stabilita libovolné dodané reálné řady UTC-UTC(k) nebo hodin stanice; neporovnáno se skutečným spojem TWSTFT (výsledek <c1/>)

seg-70448ca49780 = Obousměrný družicový přenos času a frekvence (TWSTFT) mezi dvěma ILLUSTRATIVE stanicemi, jednou ve střední Evropě a jednou ve východní Severní Americe, přes geostacionární relé na { "10" } deg W. Běh řeší obousměrnou rovnici pro T_A - T_B z uvedených členů zařízení, transpondéru, ionosféry (pásmo Ku, 14/11 GHz) a Sagnac. Sestavuje rozpočet nejistoty, jehož statistický člen je TDEV, při jednom dni, simulova (komentář v souboru scénáře, řádky { "1" } až { "8" })

seg-4b0d23aed0ab = Obousměrná rovnice TWSTFT, rozpočet nejistoty a stabilita spoje s flickerovým šumem a denní nereciprocitou jsou MODELLED, nikoli ověřené: zkontrolováno proti vlastní uzavřené / analytické identitě — zachytí chyby přepisu a koeficientů, ale není to vnější orákulum. (verifikační matice (docs/MODELLED-RATIONALE.md))

seg-52e06909ccc5 = <s1>Předchozí</s1>terrain-slam

seg-a22fa1c51042 = <s1>Další</s1>timetransfer
