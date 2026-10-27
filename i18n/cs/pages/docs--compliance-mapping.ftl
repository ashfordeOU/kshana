# docs--compliance-mapping: translations (cs)

seg-6555ff9a6d8e = Výstup

seg-2247a2344710 = Význam

seg-d6476863f862 = Schopnost

seg-ad856ad710eb = Stav

seg-8d216d42c776 = Posouzení důvěryhodnosti záznamu přijímače

seg-ff808ce8ec48 = Alternativní a rozmanité zdroje PNT

seg-3621a68a508c = Reprodukovatelný původ běhu

seg-50fe2a3ff712 = Monitorování integrity a ochranné úrovně

seg-554a16dc7965 = Zdroj: <c1/>

seg-76db63e8d2de = Kupující a výrobci přijímačů odpovídají veřejným rámcům odolnosti. Tato složka mapuje, co { -brand } počítá a zaznamenává, na tyto rámce, řádek po řádku, a <c1/> naplňuje mapování z běhů, které skutečně máte.

seg-e22a3aca9550 = <b>Formulace.</b> Výstupy { -brand } <em>podporují důkazy pro (support evidence for)</em> požadavek. Nejsou hodnocením ani schválením žádného produktu a žádný z těchto souborů není prohlášením posuzovacího orgánu; { -brand } takovým orgánem není. Text požadavků je parafrázován, nikdy reprodukován.

seg-2602c3f5aff6 = Rámec

seg-245fe1f87b08 = Soubor

seg-d104ce416298 = US DHS Resilient PNT Conformance Framework, v2.0

seg-0f7279ffb619 = Pokyny IMO k interferenci GNSS pro lodě

seg-f318176b86de = Pokyny EASA k interferenci GNSS pro letectví

seg-7939ac1eea3b = Směrnice EU NIS2, článek { "21" }

seg-f2eccc9b815f = EN { "16803" } (placená norma; pouze podle částí a čísel článků viditelných v katalogu)

seg-4970f6c15605 = NIST IR 8323r1, Foundational PNT Profile (leden { "2023" })

seg-499fc17fb83a = <b>Balíčky norem</b> ({ "0.38" }) mění rámec na hodnocené scénáře: každý balíček má scénáře, prahy stanovené před během a řádky, pro něž podporuje důkazy. <c1/> je zobrazí.

seg-9c0eb89a2fbe = Balíček

seg-191baf9f2738 = DHS Resilient PNT Conformance Framework, testovací profily pro úrovně { "1" } až { "4" }

seg-13e63b993f26 = IMO MSC.1/Circ.1575, zpracování dat PNT na lodi: úrovně přesnosti a integrita

seg-aa77ffe0acbf = ICAO Doc { "9849" } příloha F, monitorování, posuzování a zmírňování interference GNSS

seg-b9387be0e4f1 = Každý soubor uvádí své zdrojové dokumenty s verzí, URL, datem přečtení a tím, co bylo a nebylo zkontrolováno. Zdroje byly přečteny 2026-10-09 (profil NIST 2026-10-18; bulletin EASA a katalogové stránky EN { "16803" } byly znovu zkontrolovány 2026-10-10). Kde se zdroj dal přečíst jen přes zrcadlo nebo katalogovou stránku, soubor to uvádí.

seg-e98e25897176 = Každý test tří hodnocených balíčků norem ze skutečných běhů enginu v{ $version } (`kshana standards-pack run`): dhs-rpcf: { "6" } splněno, { "1" } nesplněno, { "2" } vyžadují vstup; imo-circ-1575: { "1" } splněno, { "4" } nesplněno, { "2" } vyžadují vstup; icao-doc9849-appf: { "6" } splněno, { "0" } nesplněno, { "2" } vyžadují vstup. Celkem { "13" } splněno, { "5" } nesplněno a { "6" } vyžaduje vstup, který engine nemá (záznam přijímače nebo dokumentaci zařízení). Každý práh byl stanoven před během; nesplnění zůstává nesplněním. Splněný práh říká, že modelovaný scénář splnil uvedený práh, nic o produktu. Balíčky podporují důkazy pro řádky, které citují; nejsou hodnocením. Pouze poradní charakter: výstup analýzy z výzkumného a inženýrského nástroje; nejde o typově schválené navigační zařízení ani o službu z oblasti bezpečnosti života; nesmí být jediným podkladem pro žádné rozhodnutí o navigaci ani bezpečnosti.

seg-092dd691ca17 = Zpráva

seg-10fac3e641e0 = zapisuje <c1/> a <c2/> (<c3/> mění název). Vstupem jsou soubory výsledků z dřívějších běhů: běh scénáře zapíše <c4/> vedle <c5/> a <c6/> zapisuje vlastní. Druh každého běhu se čte ze souboru scénáře vedle výsledku, z obsahu výsledku receiver-trust nebo z <c7/> nejvyšší úrovně a musí to být druh, který engine zná. Výsledek se uvede jako nepoužitý, s důvodem, a nepočítá se pro nic, když se jeho druh nedá zjistit, není známým druhem nebo když se sousední scénář a vlastní <c8/> výsledku neshodují. (<c9/> výsledku a hash souboru scénáře se neporovnávají: engine první počítá z jeho zpracovaného scénáře a hash souboru je z textu, takže jde o různé veličiny.)

seg-464351dcdcc3 = <b>Samotný štítek druhu není důkaz.</b> Běh se počítá pro schopnost jen tehdy, když jeho výsledek nese také pole, která tento druh zapisuje (například výsledek <c1/> potřebuje své ukazatele kvality a řádky po epochách; výsledek <c2/> potřebuje své počty vzorků). Pole jsou uvedena v <c3/> (<c4/>) a výsledek, kterému jedno chybí, se nepočítá. Hash, který není hexadecimální, se nehlásí jako hash. Výsledek receiver-trust, jehož počty nejsou celá čísla nebo jehož počet detekovaných či shodných převyšuje počet vyhodnotitelných, se vyloučí a uvede jako nepoužitý.

seg-5a316d97f37b = U každého řádku uvádí zpráva jednu z těchto možností:

seg-2243532bd26b = každá schopnost, kterou řádek uvádí, má v dané sadě alespoň jeden běh

seg-e905ae20cec1 = některé ano

seg-e23d6dfc4a00 = žádná

seg-cf223ce076ce = žádný výstup Kshana se k řádku nevztahuje

seg-ec76997fb4d4 = Sloupec mezery se vypisuje u každého řádku, včetně řádků s doloženými důkazy: běh, který podporuje důkazy pro určitou schopnost (supports evidence for), přesto většinu požadavku ponechává dalším důkazům. Zpráva na svém začátku opakuje pravidlo o formulacích. <c1/> vypíše statické tabulky a <c2/> seznam zdrojů.

seg-f1c508a908ad = Běhy důvěry v přijímač přispívají také počty, které samy uvádějí (zjištěné události z těch, které bylo možné vyhodnotit, a shodné předpovědi z těch, které bylo možné vyhodnotit). Ty popisují daný záznam, vyhodnocený proti událostem a tolerancím stanoveným před během, a uvádějí se tak, jak je běh uvádí.

seg-662b717575e0 = Druhy běhů

seg-4377e24c36f5 = stav důvěry po jednotlivých epochách ve vlastním záznamu skutečného přijímače, časy poplachů a shoda s událostmi stanovenými před během

seg-766182e85848 = Účinky rušení na rozpočet spoje

seg-6bee09017be6 = poměr nosné k hustotě šumu a stav uzamčení pro každou družici při uvedené geometrii rušiče

seg-213117f2877a = jamming, lunar-jamming, conflict-resilience

seg-48fb757a45fc = Detekce spoofingu a meaconingu

seg-2e4a3355a936 = rozhodnutí detektoru a rozlišovací schopnost detektoru při uvedeném útoku spoofingem

seg-6fdf939cef5c = spoof, spoof-detect, impairment-eval

seg-e9a55e5a015b = ochranné úrovně, dostupnost vůči mezím výstrahy a výsledky detekce poruch

seg-8799ac418ef0 = integrity, araim-reference-check, lunar-integrity

seg-6344bf03463c = Holdover a setrvačný dojezd

seg-a643345646c3 = růst chyby polohy nebo času při odepřeném GNSS vůči uvedenému prahu

seg-7483fbb49a12 = clock, inertial, gnss-ins, ins-trn-coast, hybrid, hybrid-ukf, fusion, timetransfer, quantum-gnss-free-nav, quantum-time-transfer

seg-97e06c8a9b7f = navigační nebo časovací výkon ze zdrojů nezávislých na primárním pásmu GNSS

seg-0cb972a92a4c = combined-altpnt, terrain-nav, terrain-slam, gravity-map, leo-pass, leo-pvt, leo-pnt-chain, hybrid-optical-rf, ntn-positioning, hybrid, fusion

seg-25291db2798d = Hodnocení odolnosti na souborech hrozeb

seg-9eef8dd0d9b9 = poměry přežití a odolnosti podle vektoru hrozby na uvedeném souboru, s uvedenými předpoklady

seg-bdaa039247bd = conflict-resilience, campaign

seg-e4be26a0cc63 = hash scénáře, verze enginu a seed obsažené v každém výsledku, aby bylo možné běh zopakovat

seg-89edc36c3560 = jakýkoli běh, jehož výsledek obsahuje <c1/>

seg-488aeabdc552 = <s1>Předchozí</s1>Spuštění přijímače proti scénáři

seg-53a872636d5a = <s1>Další</s1>Rámec odolného PNT amerického DHS
