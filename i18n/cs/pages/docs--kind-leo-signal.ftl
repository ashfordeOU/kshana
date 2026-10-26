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
