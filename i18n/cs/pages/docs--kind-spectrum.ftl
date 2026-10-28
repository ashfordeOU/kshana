# docs--kind-spectrum: translations (cs)

seg-37d16b499bc5 = dB

seg-9ca82c79430e = <b>MODELLED</b> Druh <c1/> rozšířený za pásmo L: pásma zadaná jako předvolený návrh signálu (vykreslený se všemi složkami, pásmově omezený na vysílací šířku pásma, C/N0 a J/S vztažené ke sledované složce) nebo jako vlastní nosná a modulace Testy: <a1>leo_signal_reference.rs</a1>.

seg-59afd80736c5 = <b>PARTNER</b> Neposkytuje se: Kshana modeluje výkon signálu, nikoli nákladový hardware ani antény. Oracle (NoneKind): žádné: disciplína ve vlastnictví partnera, záměrně bez modulu a bez testu

seg-cb91473bfdda = Tematická stránka: <a1>LEO-PNT.md</a1>

seg-3bc1761c76ab = Tento druh používají { "3" } přibalené scénáře; ostatní jsou v <a1><c1/></a1>.

seg-a3697ad561db = Hz

seg-304496607bd7 = Druh scénáře enginu v{ $version }, rodina <a1>Rušení, spoofing a spektrum</a1>. Pouze poradní charakter: výstup analýzy z výzkumného a inženýrského nástroje; nejde o typově schválené navigační zařízení ani o službu z oblasti bezpečnosti života. Každý štítek zde pochází z enginu nebo z verifikační matice; druh je MODELLED, pokud matice neuvádí jinak (jak se štítek získává: oddíl Evidence v README).

seg-5d23d7f8f872 = Stránka rodiny: <a1>Rušení, spoofing a spektrum</a1>

seg-f85a85f0c7e4 = MHz

seg-57cd9c415e31 = MODELLED { "3" } · VALIDATED { "2" }: řádky <a1>verifikační matice</a1>, které tento druh uvádějí.

seg-3319b18ac61f = a { "1" } dalších v matici.

seg-ab8fe1c3cb79 = Zdroj: <c1/>

seg-10a4479141b5 = <c1/> (druh scénáře)

seg-fef00c827c6a = Model spektra v pásmu L a vodopád: celé pásmo L systémů GNSS jako jedna výkonová spektrální hustota (PSD), frekvence napříč, čas dolů, při skriptované časové ose rušičky. SIGNÁLY: GPS L1 C/A a L2C (BPSK({ "1" })), Galileo E1 otevřená služba (MBOC(6,1,1/11) nebo BOC({ "1,1" })), GPS L5 a Galileo E5a (BPSK({ "10" })), každý na své nosné s minimálním přijímaným výkonem podle specifikace rozhraní (IS-GPS-200, IS-GPS-705, Galileo OS SIS ICD), pokud není přepsán; GLONASS, BeiDou a Galileo E6 se nemodelují. RUŠIČKY: tón nepřerušované vlny, plochý úzkopásmový šum, lineární pilovitý čirp a širokopásmový šum přizpůsobený vlastní modulaci pásma, každá se středem, šířkou pásma, přijímaným výkonem (přímo, nebo EIRP a vzdálenost přes ztrátu šířením ve volném prostoru druhu jamming) a časy zapnutí/vypnutí. Každá rušička je pro každé pásmo hodnocena svým koeficientem spektrální separace kappa přes šířku pásma přijímače a (C/N0)_eff = [1/(C/N0) + sum (J/S) kappa]^-1; pro jednu rušičku se to rovná rovnici odolnosti proti rušení druhu jamming s Q = 1/(R_c kappa) a zpráva nese tuto křížovou kontrolu (a vedle ní reprezentativní hodnotu Q druhu jamming). Šumový práh je k T_sys s T_sys = T_ant + { "290" } K (F - { "1" }). Vodopád průměruje každou buňku přes její přihrádku a řádek (čirpy přesně, celé průběhy plus částečný; rušičky přepínající uprostřed řádku podle své střídy), takže časová osa C/N0 a obraz vycházejí ze stejných čísel; result.json nese mřížku blokově průměrovanou ve výkonu, C/N0 a J/S pro každé pásmo a řádek a pro každou rušičku a pásmo SSC, Q, J/S, J/S v pásmu a ustálené C/N0. Volitelné [iq]: model vykreslený jako komplexní IQ v jednom okamžiku, zapsaný do záznamu SigMF a načtený z něj zpět (cf32_le nebo ci16_le) a porovnaný s odhadem Welchovou metodou. Volitelné [recording] (nativní sestavení): Welchova PSD skutečného záznamu SigMF vedle modelu. VALIDATED: PSD signálů proti učebnicovým šířkám hlavního laloku (BPSK(n) 2n x { "1.023" } MHz od nuly k nule; laloky BOC({ "1,1" }) vystředěné na +/-1.023 MHz) a koeficienty spektrální separace proti jejich uzavřeným tvarům podle Parsevala a Q = { "1" } (CW) a { "1.5" } (přizpůsobená) podle Kaplana a Hegartyho. MODELLED: výkony rušiček, časová osa, šířky pásma vstupních obvodů, zacházení se spojitým spektrem (bez kódových čar) a absence AGC, blankingu a anténního diagramu.

seg-92f1d6d2c0f2 = Jeden běh <c1/> se shrnuje takto: scénář spectrum | { "5" } pásem | { "3" } rušičky | šumový práh -202.0 dBW/Hz | nejhorší pásmo gps-l1ca min. C/N0 { "3.2" } dB-Hz (J/S { "60.2" } dB)

seg-ed3a383d6f1e = Volitelná pole: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>

seg-fb332c77fd0e = Příklad <c1/> mimo jiné nastavuje:

seg-df78607f9cdb = Popisek výsledku (z enginu): MODELLED: výkonová spektrální hustota v pásmu L sestavená z uzavřených spekter signálů (VALIDATED proti učebnicovým šířkám hlavního laloku a koeficientům spektrální separace), spekter rušiček a šumového prahu kT, převedená na J/S a efektivní C/N0 koeficientem spektrální separace. Výkony rušiček, t

seg-ea1678eb9e84 = Graf, který engine zapisuje pro scenarios/l-band-waterfall-jamming.toml, druh spectrum

seg-ce0afea7b030 = <b>VALIDATED</b> Výkonové spektrální hustoty s jednotkovou plochou GPS L1 C/A a L2C (BPSK({ "1" })), GPS L5 a Galileo E5a (BPSK({ "10" })), sinusového BOC({ "1,1" }) a Galileo E1 MBOC(6,1,1/11) (navsignal::Modulation::psd, s přidanou variantou MBOC), jejich numericky nalezené nuly a

seg-7e315c5675d0 = <b>MODELLED</b> Druh <c1/>: mřížka frekvence po čase výkonové spektrální hustoty v pásmu L (tepelná podlaha k T_sys s T_sys = T_ant + { "290" } K (F - { "1" }), signály při minimálních přijímaných výkonech podle specifikace rozhraní a nepřerušovaná vlna, úzkopás

seg-7871f9f54ef4 = <b>VALIDATED</b> sigmf: čtení a zápis záznamů ve formátu Signal Metadata Format (JSON .sigmf-meta s jádrovými poli global, captures a annotations; surová data .sigmf-data jako cf32_le, ci16_le nebo ci8, celočíselné dekodéry sdílené s realdata::iqif::load_iq), vše na s

seg-4e35cc861b15 = <b>VALIDATED</b> Výkonové spektrální hustoty s jednotkovou plochou GPS L1 C/A a L2C (BPSK({ "1" })), GPS L5 a Galileo E5a (BPSK({ "10" })), sinusového BOC({ "1,1" }) a Galileo E1 MBOC(6,1,1/11) (navsignal::M. Orákulum (ExternalDataset): Publikované učebnicové hodnoty: hlavní lalok BPSK(n) o šířce 2n x { "1.023" } MHz od nuly k nule a koeficienty odolnosti proti rušení Q = { "1" } pro úzkopásmovou (CW) rušičku a Q = { "1.5" } pro rušičku s rozprostřeným spektrem přizpůsobenou C/A (Kaplan & Hegarty, Understanding GPS/GNSS, 3. vyd., oddíl { "9.4" }); hlavní laloky BOC(m,n) vystředěné na plus minus m x { "1.023" } MHz (Betz, Binary Offset Carrier Modulations for Radionavigation, NAVIGATION { "48" }({ "4" }), { "2001" }); the

seg-287de49e90a8 = <b>MODELLED</b> Druh <c1/>: mřížka frekvence po čase výkonové spektrální hustoty v pásmu L (tepelná podlaha k T_sys s T_sys = T_ant + { "290" } K (F - { "1" }), signály při. Orákulum (InternalConsistency): Redukce na rovnici odolnosti proti rušení a rozpočet linky stávajícího druhu <c2/> (týž kód volaný se stejnými vstupy) a uzavřený tvar šumové podlahy k T0 F. Spektra signálů pod tím jsou ověřený řádek výše; výkony rušiček, časová osa a šířky pásma vstupních obvodů jsou vstupy scénáře, spektra jsou spojitá (bez čar rozprostíracího kódu) a na rušičku nepůsobí žádné automatické řízení zesílení, blanking ani anténní diagram

seg-4eca77cc59c4 = <b>VALIDATED</b> sigmf: čtení a zápis záznamů ve formátu Signal Metadata Format (JSON .sigmf-meta s jádrovými poli global, captures a annotations; surová data .sigmf-data jako cf32_le, ci1. Orákulum (ExternalDataset): scipy { "1.18.1" } scipy.signal.welch (BSD-3-Clause) se stejným periodickým oknem Hann, překryvem, hustotním škálováním, bez odstranění trendu a dvoustranným průměrem: každý koš v rozmezí { "1e-12" } relativně (pozorováno { "6.0e-14" }) přes { "27" } případů, s počty segmentů převzatými z vlastního spektrogramu scipy. sigmf-python { "1.13.0" } (LGPL-3.0, spuštěný jako nástroj) zapisuje pět záznamů třetích stran (cf32_le, ci16_le, ci8, dva záznamy s anotacemi, nenulový fir

seg-0cbbe567f1c8 = struktura čar rozprostíracího kódu (například čáry { "1" } kHz u C/A): tóny se hodnotí proti hladké obálce (výsledek <c1/>)

seg-2efdae3f5764 = automatické řízení zesílení, kvantizace, pulzní blanking a notch filtrování (výsledek <c1/>)

seg-f3e58705c9a2 = diagram přijímací antény ve směru k rušičce nad rámec jedné hodnoty zisku (výsledek <c1/>)

seg-c0d379cb1ab3 = vnitrosystémová interference mnohonásobného přístupu mezi družicemi jednoho pásma (výsledek <c1/>)

seg-83f414112e45 = GLONASS G1/G2, BeiDou B1/B2 a Galileo E6 (výsledek <c1/>)

seg-249d8a46f95a = emise navrženého signálu mimo jeho vysílací šířku pásma: jeho spektrum je tam zkráceno, takže žádná emise mimo pásmo nezasahuje sousední pásmo (výsledek <c1/>)

seg-cc83c047f02a = vliv čirpu na smyčku při rychlostech rozmítání srovnatelných se šířkou pásma smyčky: jeho C/N0 používá spektrum průměrované po řádcích (výsledek <c1/>)

seg-7155706bc289 = MODELLED: výkonová spektrální hustota v pásmu L sestavená z uzavřených spekter signálů (VALIDATED proti učebnicovým šířkám hlavního laloku a koeficientům spektrální separace), spekter rušiček a šumového prahu kT, převedená na J/S a efektivní C/N0 koeficientem spektrální separace. Výkony rušiček, časová osa a šířky pásma vstupních obvodů jsou vstupy scénáře, nikoli měření. (výsledek <c1/>)

seg-95879767c438 = Tematická stránka: <a1>LEO-SIGNAL.md</a1>

seg-ce69d8d2d9d1 = <s1>Předchozí</s1>space-weather

seg-ac2c9c25fbb6 = <s1>Další</s1>spoof-detect

seg-a349aa76b0ed = PARTNER
