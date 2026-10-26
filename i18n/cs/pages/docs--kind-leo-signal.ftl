# docs--kind-leo-signal: translations (cs)

seg-37d16b499bc5 = dB

seg-37d29d8303fe = km

seg-b538d3ff9fdb = Volitelná pole: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>

seg-6aaf62f55e65 = Příklad <c1/> mimo jiné nastavuje:

seg-9fd02351d844 = ms

seg-05e8854de548 = čip

seg-d12bc1d2b815 = koherentní

seg-0f29946fe4fb = Popisek výsledku (od enginu): MODELLED: parametrizované návrhy signálů pro určování polohy, navigaci a čas (PNT) na nízké oběžné dráze Země (LEO), pásmově omezené na jejich vysílací šířku pásma. Uzavřené tvary pod nimi jsou VALIDATED (výkon BPSK v pásmu a Gaborova šířka pásma, pásmově omezený jitter sledování kódu časný-pozdní, který se redukuje na učebnic

seg-8bf45b6989d1 = Graf, který engine zapisuje pro scenarios/leo-band-trade.toml, druh leo-signal

seg-58413589a025 = MODELLED { "2" } · VALIDATED { "2" }: řádky <a1>verifikační matice</a1>, které tento druh uvádějí.

seg-0c30354c18f6 = <b>VALIDATED</b> navsignal: integrálsinus (sine_integral), podíl výkonu BPSK-R uvnitř oboustranného pásma v uzavřeném tvaru (bpsk_power_in_band_closed_form), pásmově omezená Gaborova šířka pásma BPSK v uzavřeném tvaru (bpsk_gabor_bandwidth_closed_form_hz

seg-09cb975b430d = <b>VALIDATED</b> leo_signal::max_doppler_hz: největší Doppler družice při přeletu nad hlavou při elevační masce pro kruhovou dráhu, v R_E cos(el) / (R_E + h) krát f / c, z vlastní nosné a výšky dráhy každé předvolby; druh <c1/> přidává o

seg-e0a4f53c5a96 = <b>MODELLED</b> Druh <c1/>: parametrizované návrhy signálů (pásmo, vysílací šířka pásma, přidělení ITU; akviziční, datové a pilotní složky se spektry BPSK(n), BOC(m,n), MBOC nebo plochými, podíly výkonu, subnosné FDMA, délky kódů a datové rychlosti Testy: <a1>leo_signal_reference.rs</a1>.

seg-9ca82c79430e = <b>MODELLED</b> Druh <c1/> rozšířený za pásmo L: pásma zadaná jako předvolený návrh signálu (vykreslený se všemi složkami, pásmově omezený na vysílací šířku pásma, C/N0 a J/S vztažené ke sledované složce) nebo jako vlastní nosná a modulace Testy: <a1>leo_signal_reference.rs</a1>.

seg-eb0a671fe1da = <b>VALIDATED</b> leo_signal::max_doppler_hz: největší Doppler družice při přeletu nad hlavou při elevační masce pro kruhovou dráhu, v R_E cos(el) / (R_E + h) krát f / c,. Orákulum (ExternalDataset): Publikované hodnoty: maximální Doppler Xona Pulsar X1 { "32" } až { "34" } kHz (Leclère, Marathe & Reid, ION GNSS+ { "2025" }, <a1>https://arxiv.org/abs/2509.19551</a1>); Doppler Iridium až +/-36 kHz (Resilient Navigation and Timing Foundation, Recent PNT Improvements and Test Results Based on Low Earth Orbit Satellites). Rotace Země je vynechána, což posouvá hodnotu až o zhruba { "2.3" } kHz; obě publikované hodnoty jsou splněny i bez ní.

seg-1ab79cdbd269 = přesná spektra vylepšeného Feherova QPSK, klíčování kódovým posuvem a OFDM: zastupuje je obdélníková obálka čipu BPSK nebo plochá pásmová charakteristika, jak uvádí každá předvolba (výsledek <c1/>)

seg-0561c3ed88fb = čárová struktura rozprostíracích kódů a vzájemná korelace mezi kódy při vícenásobném přístupu (výsledek <c1/>)

seg-8b4df054a7b3 = vysílací a přijímací filtry nad rámec ideální obdélníkové charakteristiky na vysílací šířce pásma: žádné vyzařování mimo pásmo, žádné skupinové zpoždění filtru (výsledek <c1/>)

seg-ad5f7cc4a439 = vícecestné šíření, kvantování v přijímači a automatické řízení zesílení (výsledek <c1/>)

seg-e38fc1a121ab = rotace Země v mezi Dopplera (až zhruba { "0.46" } km/s rychlosti změny vzdálenosti na rovníku) (výsledek <c1/>)

seg-32a132809a9b = ionosférické zpoždění nad rámec prvního řádu a rozdělení elektronového obsahu nad družicí na LEO a pod ní: šikmý TEC je vstupem (výsledek <c1/>)

seg-8189e06f4a56 = atmosférické ztráty, ztráty deštěm a polarizační ztráty: porovnává se samotná ztráta volným prostorem (déšť je důležitý v pásmu C) (výsledek <c1/>)

seg-445cecb7370c = akvizice nad rámec jediného dwellu s penalizací za falešný poplach: žádná logika ověřování ve více dwellech, rovnoměrné apriorní rozdělení fáze kódu, nejhorší případ přesahu (výsledek <c1/>)

seg-8eefe4197d7f = <s1>Předchozí</s1>leo-pvt

seg-60423e1ed0ca = <s1>Další</s1>link-budget

seg-cb91473bfdda = Tematická stránka: <a1>LEO-PNT.md</a1>

seg-3bc1761c76ab = Tento druh používají { "3" } přibalené scénáře; ostatní jsou v <a1><c1/></a1>.

seg-a3697ad561db = Hz

seg-1918189ac2bf = ppm

seg-49964654d5f4 = Druh scénáře enginu v{ $version }, rodina <a1>Navigace z nízké oběžné dráhy Země</a1>. Pouze poradní charakter: výstup analýzy z výzkumného a inženýrského nástroje; nejde o typově schválené navigační zařízení ani o službu z oblasti bezpečnosti života. Každý štítek zde pochází z enginu nebo z verifikační matice; druh je MODELLED, pokud matice neuvádí jinak (jak se štítek získává: oddíl Evidence v README).

seg-c5478f572d21 = Stránka rodiny: <a1>Navigace z nízké oběžné dráhy Země</a1>

seg-ae15d15bf151 = Tematická stránka: <a1>LEO-PASS.md</a1>

seg-59b976838ef1 = <b>VALIDATED</b> navsignal: sinový integrál (sine_integral), podíl výkonu BPSK-R uvnitř oboustranného pásma v uzavřeném tvaru (bpsk_power_in_band_closed_form), pásmově. Orákulum (ExternalDataset): Externě zafixováno: { "90.3" } procenta výkonu hlavního laloku, koherentní jitter early-late ve stanoveném pracovním bodě, tabulkové hodnoty sinového integrálu a koeficient spektrální separace BPSK se sebou samým 2/({ "3" } R_c) při nulovém posunu. Pouze vnitřní křížové kontroly, nikoli externí validace: uzavřený tvar Gaborovy šířky pásma pásmově omezeného BPSK a jeho asymptota a koeficient spektrální separace BPSK s posunem při nenulových posunech, oba

seg-faf2775f3003 = <b>MODELLED</b> Druh <c1/>: parametrizované návrhy signálu (pásmo, vysílací šířka pásma, přidělení ITU; složky pro akvizici, data a pilot s BPSK(n), BOC(m,n), MB. Orákulum (InternalConsistency): Uzavřené tvary ověřené proti nezávislé vnější referenci z obou řádků výše, identita falešného poplachu pro kvadratický detektor P_d(snr = { "0" }) = P_fa a Holmesův střední čas akvizice a redukce na vlastní řetězec SSC druhu spectrum (tentýž kód Jammer::ssc). Samotné návrhy jsou vstupy: předvolby označené REPREZENTATIVNÍ nebo WORKSHOP nejsou publikované specifikace, spektra vylepšeného Feherova QPSK, klíčování posunem kódu a OFDM jsou aproximována a tvar

seg-051999733048 = Zdroj: <c1/>

seg-16ae2a08d3c8 = <c1/> (druh scénáře)

seg-97b8d07150d4 = Návrhy signálů LEO-PNT: parametrizované signály určování polohy, navigace a času (PNT) z nízké oběžné dráhy Země (LEO) pro libovolný systém, pásmo a strukturu. SIGNÁL je pásmo (střední frekvence, vysílací šířka pásma, přidělení ITU RNSS/RDSS/MSS/EESS/non-RNSS/other) a složky (akvizice, data, pilot; libovolná podmnožina), každá s modulací (BPSK(n) se zlomkovým n, BOC(m,n), MBOC({ "6,1" },p) nebo ploché pásmo podobné OFDM), podílem výkonu, volitelnými posuny podnosných FDMA, délkou kódu a datovou rychlostí. Signály pocházejí z přeložených veřejných souborů předvoleb (xona-pulsar, iridium-stl, starlink-soo, centispace, generic-c-band, generic-bands; každý s URL zdroje a každá nepublikovaná hodnota označena REPREZENTATIVNÍ) nebo se zapisují vložené. PRO KAŽDÝ SIGNÁL: pásmově omezená spektrální hustota výkonu a podíl výkonu každé složky, který vysílací pásmo propustí (uzavřený tvar BPSK vedle číselné hodnoty), efektivní (Gaborova) šířka pásma, tepelný jitter sledování kódu smyčkou zpožděného závěsu v závislosti na C/N0 a rozestupu early-late z pásmově omezeného koherentního (nebo nekoherentního) vzorce early-late podle Betze a Kolodziejského { "2009" } s jeho učebnicovým tvarem pro neomezené pásmo a jeho Gaborovou mezí pro mizející rozestup, přesnost měření vzdálenosti v metrech, prostor vyhledávání při akvizici (Dopplerovy koše z maximálního Dopplera dráhy plus členy oscilátoru a uživatele, krát kódové koše), pravděpodobnost detekce kvadratickým detektorem a střední sériový a kódově paralelní čas akvizice, koeficient spektrální separace signálu do GPS L1 C/A, Galileo E1, GPS L5, Galileo E5a, E5b a E5 AltBOC a každého z nich do signálu se zhoršením C/N0 a CW, širokopásmové a přizpůsobené J/S, které sledovaná složka snese, z vlastního aparátu SSC druhu spectrum. SROVNÁNÍ PÁSEM: ionosférické zpoždění prvního řádu ({ "40.3" } TEC/f^{ "2" }), ztráta ve volném prostoru, přesnost měření vzdálenosti při stejném C/N0 a při stejném EIRP a odolnost vůči rušičce. Volitelné KONTROLY TVARU poměřují spektrum návrhu s popsaným měřením (konzistence MODELLED). VALIDATED: uzavřené tvary výkonu BPSK v pásmu ({ "90.3" } % v hlavním laloku) a Gaborovy šířky pásma, pásmově omezený jitter přecházející na učebnicový koherentní tvar early-late a na svou Gaborovu mez, koeficient spektrální separace BPSK s posunem proti jeho Parsevalovu uzavřenému tvaru, jednotková plocha spektra AltBOC a maximální Doppler LEO proti publikovaným údajům Xona Pulsar (32-34 kHz) a Iridium ({ "36" } kHz). MODELLED: každý návrh, rozdělení výkonu, C/N0 a úroveň rušičky; spektra EFQPSK, CSK a OFDM jsou aproximována.

seg-37e5fdff9d4d = Jeden běh <c1/> se shrnuje takto: scenario leo-signal | { "5" } signals | noise floor -202.0 dBW/Hz | finest ranging generic-c-wide { "0.022" } m at { "45.0" } dB-Hz
