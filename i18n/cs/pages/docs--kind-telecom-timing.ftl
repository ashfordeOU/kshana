# docs--kind-telecom-timing: translations (cs)

seg-f42465f7d066 = ns

seg-5547f1f662d3 = a { "2" } další v matici.

seg-98151954f217 = false

seg-cb91473bfdda = Tematická stránka: <a1>LEO-PNT.md</a1>

seg-c61e88721556 = Druh scénáře enginu v{ $version }, rodina <a1>Hodiny, časování a holdover</a1>. Pouze poradní charakter: výstup analýzy z výzkumného a inženýrského nástroje; nejde o typově schválené navigační zařízení ani o službu z oblasti bezpečnosti života. Každé označení zde pochází z enginu nebo z verifikační matice; druh je MODELLED, pokud matice neuvádí jinak (jak se označení získává: oddíl Evidence v README).

seg-e1b9b2d674eb = <b>MODELLED</b> clock_log::read_input: jedna vrstva parseru, která převádí soubor hodin RINEX (záznamy AS/AR jedněch pojmenovaných hodin, verze { "2" } a { "3.00" } až { "3.04" }), ASCII záznam fáze nebo frekvence ve stylu TimeLab nebo záznam časových značek či intervalů TAPR TICC na jednotnou pha Testy: <a1>clock_log_allantools.rs</a1>.

seg-849c08d3ce70 = Stránka rodiny: <a1>Hodiny, časování a holdover</a1>

seg-3bc1761c76ab = Tento druh používají { "3" } přibalené scénáře; ostatní jsou v <a1><c1/></a1>.

seg-e7273fd2a640 = <b>VALIDATED</b> Maximální chyba časového intervalu a časová odchylka, které hlásí druh scénáře <c1/>, na záznamu holdoveru telekomunikačního rozsahu: posuvná fronta monotónní s O(n). Orákulum (ExternalDataset): allantools { "2024.06" } — nezávislá knihovna třetí strany pro stabilitu frekvence — mtie() a tdev() na tests/fixtures/telecom_timing/holdover_te_series.csv, řada načtená z téhož textu o 17 platných číslicích na obou stranách; reference zaznamenává SHA-256 řady a lze ji offline znovu vygenerovat pomocí tests/fixtures/telecom_timing/generate_telecom_timing_reference.py. Ověřuje ESTIMÁTORY na tomto záznamu, ne syn

seg-4cf0f94f96c9 = <b>MODELLED</b> Přepsané limity ITU-T G.8272 (07/2025) PRTC-A/B, G.8272.1 ({ "2024" }) Amd. { "1" } (07/2025) ePRTC uzamčený a holdover ePRTC-A (včetně obálky časové chyby z tabulky { "3" }. Orákulum (InternalConsistency): Přepis uvedených doporučení (volně ke stažení na itu.int), každý limit s označením tabulky nebo článku, vypsaný se všemi nepotvrzenými nebo neimplementovanými položkami v docs/TELECOM-TIMING.md; identity spojitosti v zlomových bodech, které tabulky implikují, jsou kontrolovány v testech. Přepis norem s kontrolami vnitřní konzistence, nikoli test shody a nikoli externí validace. { "0.30" } round { "2" } (pre-register

seg-8aee75a55007 = ocxo

seg-9b72d3b3a0ab = Zdroj: <c1/>

seg-f4dc88ffe6b5 = <c1/> (druh scénáře)

seg-a448b24ded2b = Telekomunikační časování: časová chyba, maximální chyba časového intervalu (MTIE) a časová odchylka (TDEV) holdoveru GNSS, zkontrolované proti maskám ITU-T s výsledkem PASS nebo FAIL a rezervou pro každou masku. Vstupem je buď SYNTETICKÝ HOLDOVER (předvolba oscilátoru -- ocxo, rubidium, cesium nebo csac, každá nese údaje o stabilitě, stárnutí a teplotě z pojmenovaného veřejného katalogového listu Microchip -- plus čas ztráty GNSS, délka záznamu a vzorkovací interval; volně běžící hodiny nesou bílý, flickerový a, kde to proložení katalogového listu vyžaduje, frekvenční šum náhodné procházky, lineární stárnutí a sinusový teplotní člen) nebo NAČTENÁ ŘADA dvojic [time_s, time_error_ns] zadaných přímo (a pouze v nativních sestaveních soubor CSV). Masky: ITU-T G.8272 (07/2025) PRTC-A a PRTC-B (max|TE| { "100" } / { "40" } ns, MTIE tabulky 1-2, TDEV tabulky 3-4); G.8272.1 ({ "2024" }) Amd. { "1" } (07/2025) ePRTC v synchronizovaném stavu ({ "30" } ns, tabulky 1-2) a holdover ePRTC-A (obálka časové chyby z tabulky { "3" } rostoucí z { "30" } ns na { "100" } ns po dobu holdoveru H určenou dobou synchronizace, MTIE tabulka { "4" }, TDEV tabulka { "5" }); G.8273.2 ({ "2023" }) Amd. { "2" } (11/2025) třídy T-BC/T-TSC A-C (max|TE|, konstantní časová chyba, MTIE a TDEV filtrované dolní propustí) a třída D (max|TE_L| { "5" } ns, jediný údaj třídy D, který nebyl ponechán k dalšímu studiu); G.8271.1 ({ "2022" }) Amd. { "3" } (05/2025) referenční bod C (max|TE_L| { "1100" } / { "600" } / { "100" } ns s MTIE tabulky 7-1 až 7-3). Každá položka, kterou Doporučení označuje k dalšímu studiu, je vynechána, nikoli doplněna, a každá zpráva uvádí, co není implementováno. Uvádí také čas do překročení každého rozpočtu maximální časové chyby (výchozí: { "100" } ns max|TE_HO| ePRTC, { "400" } ns přidělení holdoveru sítě, { "1100" } ns bod C, { "1.5" } us třída { "4" }), křivky MTIE/TDEV jako tabulku CSV s limitem každé masky a pro každé číselné pole záznam o jednotkách a původu. VALIDATED: odhadovače MTIE a TDEV proti balíčku allantools na potvrzené řadě holdoveru. MODELLED: tabulky masek jsou přepisy a syntetický holdover je model sestavený z maxim katalogových listů, nikoli měření žádného kusu. Nejde o test shody.

seg-07f81cfd606a = Jeden běh <c1/> se shrnuje takto: telecom-timing: max|TE| { "488.2" } ns za { "12000" } s; g8262-eec-option-1 FAIL, g8262-eec-option-2 FAIL, g8262-1-eeec FAIL (MODELLED)

seg-17f291bfc65d = Volitelná pole: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>

seg-d192feecd4b3 = Příklad <c1/> mimo jiné nastavuje:

seg-e7cab30ef039 = [] (žádné prvky)

seg-864d84810a5c = [g8262-eec-option-1, g8262-eec-option-2, g8262-1-eeec]

seg-01b1287f233b = Popisek výsledku (z enginu): MODELLED — časová chyba, MTIE a TDEV zkontrolované proti přepsaným maskám ITU-T. Odhadovače jsou ověřeny proti allantools; tabulky masek jsou přepisy pojmenovaných Doporučení; syntetický holdover je model sestavený z veřejných údajů z katalogových listů, nikoli měření žádného kusu. Nejde o test sh

seg-ec7745a09d08 = Graf, který engine zapisuje pro scenarios/telecom-synce-eec.toml, druh telecom-timing

seg-219651a7958b = MODELLED { "5" } · VALIDATED { "1" }: řádky <a1>verifikační matice</a1>, které tento druh uvádějí.

seg-c21ebd79f497 = <b>VALIDATED</b> Maximální chyba časového intervalu a časová odchylka, které druh scénáře <c1/> uvádí, na záznamu holdoveru v telekomunikačním měřítku: MTIE s posuvným oknem a monotónní frontou O(n) (telecom_timing::mtie_sliding, potřebná, aby den jednosekundových vzorků Testy: <a1>telecom_timing_reference.rs</a1>.

seg-75aa6f7234ae = <b>MODELLED</b> Přepsané limity ITU-T G.8272 (07/2025) PRTC-A/B, G.8272.1 ({ "2024" }) Amd. Testy: <a1>telecom_timing_reference.rs</a1>.

seg-d0ab0ca72b80 = <b>MODELLED</b> Sedm masek generace kolísání MTIE a TDEV při konstantní teplotě pro druh <c1/>: G.811 (09/1997) PRC (autonomní), G.812 (06/2004) typy I, II a III, G.8262 (10/2024) EEC varianty { "1" } a { "2" } a G.8262.1 (11/2025) eEEC (synchronizov

seg-d4bd840708db = <b>MODELLED</b> Čtyři předvolby — OCXO (Microchip OX-208), rubidium (Microchip 8040C), cesium (vysoce výkonná trubice Microchip 5071A) a CSAC (Microchip SA.45s) — každá nese . Orákulum (InternalConsistency): Čtyři pojmenované katalogové listy Microchip (čísla dokumentů a adresy URL v každé předvolbě a v docs/TELECOM-TIMING.md) pro vstupní údaje; uzavřená rampa stárnutí a obálková vlastnost proložení jako vnitřní kontroly. Jak se údaje stanou modelem šumu — proložení, pravidlo podlahy, 30denní měsíc, lineární čtení teploty — je modelovací volba; žádná předvolba není měřením kusu. { "0.30" } kolo { "2" }, jednostranné prahy proti

seg-cbb39b4105ac = každý požadavek, který Doporučení označují „k dalšímu studiu“ (třída D nad rámec max|TE_L|, holdover ePRTC-B, holdover T-BC/T-TSC při ztrátě obou vstupů, síťové limity TDEV, MTIE a TDEV holdoveru ePRTC-A nad { "10 000" } s) (výsledek <c1/>)

seg-a70f575aeb21 = dynamická časová chyba filtrovaná horní propustí (dTE_H, G.8273.2 tabulka 7-7 a G.8271.1 články 7.3.2-7.3.3) (výsledek <c1/>)

seg-66446247fc49 = MTIE při proměnné teplotě podle G.8273.2 tabulka 7-6 a MTIE holdoveru podporovaného fyzickou vrstvou podle G.8273.2 tabulka 7-10 (výsledek <c1/>)

seg-c1d601b45182 = relativní časová chyba (cTE_R, dTE_R,L) mezi dvěma výstupy (výsledek <c1/>)

seg-6146f857c2df = paketový filtr klouzavého průměru podle G.8272 a G.8272.1 pro rozhraní PTP: řada se považuje za chybu časového intervalu s jedním pulzem za sekundu (výsledek <c1/>)

seg-d5e956023b48 = MODELLED — časová chyba, MTIE a TDEV zkontrolované proti přepsaným maskám ITU-T. Odhadovače jsou ověřeny proti allantools; tabulky masek jsou přepisy pojmenovaných Doporučení; syntetický holdover je model sestavený z veřejných údajů z katalogových listů, nikoli měření žádného kusu. Nejde o test shody. (výsledek <c1/>)

seg-f163ae37b8c7 = MODELLED: tabulky masek jsou přepisy a syntetický holdover je model sestavený z maxim katalogových listů, nikoli měření žádného kusu. (katalog druhů (<c1/>))

seg-a0ddb65b00af = Hodiny: předvolba OCXO (katalogový list Microchip OX-208, Rev 12-1-2021), volně běžící od prvního vzorku s bílým, flickerovým a (kde to proložení vyžaduje) frekvenčním šumem náhodné procházky proloženým k maximům Allanovy odchylky z katalogového listu a s lineárním stárnutím. Teplota se drží konstantní (amplituda { "0" } K), jak masky předpokládají. (komentář v souboru scénáře, řádky { "12" } až { "15" })

seg-101dbde1c65b = Tematická stránka: <a1>CLOCK-LOG-FORMATS.md</a1>

seg-c32dc02f981d = <s1>Předchozí</s1>sweep

seg-8aef86c9aa68 = <s1>Další</s1>terrain-nav
