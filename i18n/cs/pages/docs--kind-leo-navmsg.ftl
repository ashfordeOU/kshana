# docs--kind-leo-navmsg: translations (cs)

seg-debc2f07db78 = true

seg-cb91473bfdda = Tematická stránka: <a1>LEO-PNT.md</a1>

seg-1d65b71c5de0 = { "5" } přibalených scénářů používá tento druh; ostatní jsou v <a1><c1/></a1>.

seg-648c27220789 = Zdroj: <c1/>

seg-087287602b47 = <c1/> (druh scénáře)

seg-49964654d5f4 = Druh scénáře enginu v{ $version }, rodina <a1>Navigace z nízké oběžné dráhy Země</a1>. Pouze poradní charakter: výstup analýzy z výzkumného a inženýrského nástroje; nejde o typově schválené navigační zařízení ani o službu z oblasti bezpečnosti života. Každý štítek zde pochází z enginu nebo z verifikační matice; druh je MODELLED, pokud matice neuvádí jinak (jak se štítek získává: oddíl Evidence v README).

seg-867f3e41b5ab = Navigační zpráva LEO: vysílané efemeridy a hodiny družice pro určování polohy, navigaci a čas na nízké oběžné dráze Země (LEO), pro libovolnou dráhu, nosnou a model, s volitelnými pojmenovanými předvolbami (Xona Pulsar, Iridium, Starlink, CentiSpace, reprezentativní systém v pásmu C, model nulových hodin ATOMIC, Celeste IOD). OBSAH: pomocná data (SVID, číslo vydání dat, pásmo, zdraví signálu), synchronizace (týden, čas v týdnu, polynom hodin druhého řádu af0-af2 kolem toc), efemeridy v jednom ze čtyř modelů -- 16parametrová keplerovská sada podle Galileo OS SIS ICD; tatáž sada plus polynomy korekcí v podélném, příčném a radiálním směru; 22parametrový model Liu et al. { "2025" }; polynom ECEF bez členů hodin (ATOMIC, nulové hodiny) -- a další služby (vysílaná sada Klobuchar, NeQuick-G ai0-ai2 s efektivní úrovní ionizace a parametry převodu systémového času na UTC s logikou přestupných sekund podle ICD). PROKLÁDÁNÍ: pravdivá dráha integrovaná se zonální gravitací J2-J6 nebo EGM2008 do zvoleného stupně a s odporem a seedovaný volný nebo řízený hodinový signál; proložení keplerovské sady metodou Levenberg-Marquardt na nesingulárních prvcích, poté lineární korekční polynomy metodou nejmenších čtverců; hodiny proložené po odečtení relativistického členu, který přidává uživatel. ANALÝZY: fit-interval-trade (chyba vzdálenosti signálu v kosmu, SISRE, s globálně průměrovanými vahami pro výšku dráhy, v závislosti na intervalu proložení a periodě aktualizace, pouze dráha a s hodinami), model-comparison (čtyři modely, počet parametrů, kódované bity a proložení Kshany ve výškách podle Liu et al. vedle publikovaných hodnot), midpass-update (nejvyšší přelet nad uživatelem, skok polohy, hodin a vzdálenosti uživatele při každém přepnutí zprávy, skok při nejhorší geometrii, PASS/FAIL proti prahu kontinuity), encode-decode (vlastní zdokumentovaný binární rámec Kshany s CRC-24Q, rozpočet kvantizace po půlkrocích pro každé pole, kontrola poškozeného rámce, export a import záznamu ve stylu RINEX-4 označeného jako rozšíření Kshany a tabulka CSV). VALIDATED: váhy SISRE proti publikované tabulce MEO/GEO (Montenbruck et al. { "2018" }); uživatelský algoritmus Galileo proti RTKLIB na skutečných vysílaných efemeridách Galileo; CRC-24Q proti své katalogové kontrolní hodnotě a ukázkovému rámci RTCM { "1005" }. MODELLED: každý údaj o proložení a SISRE je chyba reprezentace oproti pravdě integrované Kshanou (žádná chyba určení ani předpovědi dráhy); srovnání s Liu et al. používá jiné dráhy; formáty kódování a textu jsou vlastní formáty Kshany.

seg-e5a4f0290e9e = Jeden běh <c1/> se shrnuje takto: LEO navigation message — { "510" } km, { "97.4" } deg, gravity degree { "20" }, model kepler-rac SISRE weights: w_R { "0.459" }, w_AC^{ "2" } 1/2.53 (mask { "0" } deg) encode-decode: kepler-rac model, frame { "152" } bytes ({ "1156" } payload bits, { "891" } ephemeris+clock bits), CRC-24Q 0x58ADF2 quantisation: largest position change { "0.52" } mm, clock { "0.09" } mm; SISRE exact { "0.0013" } m, quantised { "0.0013" } m corrupted frame rejected: true; RINEX round trip { "4.43e-6" } m; CSV round trip { "0.00e0" } m fit-interval trade over { "1800" } s (usage period = fit interval): kepler16 { "60" } s SISRE orbit RMS { "0.0003" } m max { "0.0015" } m with clock RMS { "0.0006" } m kepler16 { "120" } s SISRE orbit RMS { "0.0003" } m max { "0.0015" } m with clock RMS { "0.0007" } m kepler16 { "300" } s SISRE orbit RMS { "0.0036" } m max { "0.0141" } m with clock RMS { "0.0037" } m kepler16 { "600" } s SISRE orbit RMS { "0.0293" } m max { "0.1023" } m with clock RMS { "0.0293" } m kepler16 { "900" } s SISRE orbit RMS { "0.1073" } m max { "0.3812" } m with clock RMS { "0.1075" } m kepler-rac { "60" } s SISRE orbit RMS { "0.0000" } m max { "0.0000" } m with clock RMS { "0.0005" } m kepler-rac { "120" } s SISRE orbit RMS { "0.0001" } m max { "0.0002" } m with clock RMS { "0.0007" } m kepler-rac { "300" } s SISRE orbit RMS { "0.0005" } m max { "0.0021" } m with clock RMS { "0.0012" } m kepler-rac { "600" } s SISRE orbit RMS { "0.0097" } m max { "0.0395" } m with clock RMS { "0.0096" } m kepler-rac { "900" } s SISRE orbit RMS { "0.0388" } m max { "0.1143" } m with clock RMS { "0.0390" } m 16parametrová keplerovská sada se zhoršuje z { "0.0003" } m při { "60" } s na { "0.1073" } m při { "900" } s: jedna keplerovská sada s harmonickými dvakrát za oběh nedokáže déle než několik minut sledovat gravitační členy vyšších frekvencí a odpor na oblouku dráhy LEO a její zbytek metodou nejmenších čtverců po okně osciluje. Polynomy podél/napříč/radiálně, vyššího stupně, než jaký keplerovská sada pokrývá, pohltí zbytek, takže vychází { "0.0388" } m při { "900" } s.

seg-3f299f6b20c8 = Volitelná pole: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>

seg-3adfcd7e275c = Příklad <c1/> mimo jiné nastavuje:

seg-8243db187e2f = [encode-decode, fit-interval-trade]

seg-e866d042aab8 = Zpráva Celeste IOD (předvolba z workshopu)

seg-c42f5a1ed964 = [kepler16, kepler-rac]

seg-549a6103e711 = bit

seg-fb689f03361c = byte

seg-c60901596100 = Štítek výsledku (enginu): MIXED — stavební bloky VALIDATED, výsledky MODELLED. Váhy SISRE reprodukují publikovanou tabulku MEO/GEO (Montenbruck et al. { "2018" }), uživatelský algoritmus Galileo ICD reprodukuje RTKLIB na skutečných vysílaných efemeridách Galileo a CRC-24Q reprodukuje svou katalogovou kontrolní hodnotu a ukázkový rámec RTCM { "1005" }

seg-35e92abc6a23 = Graf, který engine zapisuje pro scenarios/leo-navmsg-celeste-iod.toml, druh leo-navmsg

seg-43c1d9c81ccf = MODELLED { "5" } · VALIDATED { "6" }: řádky <a1>verifikační matice</a1>, které tento druh uvádějí.

seg-efbe11be7ca1 = <b>VALIDATED</b> leo_navmsg::sisre::sisre_weights: radiální váha w_R a čtvercová příčná váha w_AC^{ "2" } jako průměry cos^{ "2" } a poloviny sin^{ "2" } úhlu nadiru přímé viditelnosti přes uživatele rovnoměrně rozložené na viditelné čepičce Země nad elevací

seg-b27c5fe8e179 = <b>VALIDATED</b> leo_navmsg::elements::kepler_point: keplerovské vyhodnocení podle Galileo OS SIS ICD (Keplerova rovnice, korekce druhé harmonické, uzel vázaný na Zemi) napsané odděleně od vyhodnocovače RINEX v enginu, vracející polohu s argumen Testy: <a1>leo_navmsg_reference.rs</a1>.

seg-3a53131dc9a4 = <b>VALIDATED</b> leo_navmsg::codec::crc24q: generující polynom 0x1864CFB, počáteční hodnota { "0" }, bez zrcadlení, bez závěrečného XOR, kontrola, kterou rámec LEO Kshany nese přes každý předchozí bajt

seg-2b24c2669c23 = <b>VALIDATED</b> Prokládání a obchodní rozbor druhu <c1/>: pravdivá dráha integrovaná se zonální gravitací J2-J6 nebo EGM2008 do zvoleného stupně a s odporem a seedovaný volný nebo řízený hodinový signál; proložení keplerovské sady Galileo metodou Levenberg-Marquardt na nesingulárních

seg-ddb27b07b9af = a { "7" } dalších v matici.

seg-053dae66c1be = <b>VALIDATED</b> leo_navmsg::sisre::sisre_weights: radiální váha w_R a čtvercová příčná váha w_AC^{ "2" } jako průměry cos^{ "2" } a poloviny sin^{ "2" } úhlu nadiru přímé viditelnosti. Orákulum (ExternalDataset): Publikovaná tabulka vážicích faktorů SISRE od Montenbrucka, Steigenbergera a Hauschilda ({ "2018" }), Multi-GNSS signal-in-space range error assessment - Methodology and results, Advances in Space Research { "61" }({ "12" }):3020-3038, doi 10.1016/j.asr.2018.03.041: GPS { "0.98" } a 1/49, GLONASS { "0.98" } a 1/45, Galileo { "0.98" } a 1/61, BeiDou MEO { "0.98" } a 1/54, BeiDou IGSO/GEO { "0.99" } a 1/126. Stejný průměr vyhodnocený na poloměrech LEO dává

seg-5b43ffde4634 = <b>VALIDATED</b> leo_navmsg::elements::kepler_point: keplerovské vyhodnocení podle Galileo OS SIS ICD (Keplerova rovnice, korekce druhé harmonické, uzel vázaný na Zemi) napsané odděl. Orákulum (ExternalDataset): Polohy ECEF z RTKLIB 2.4.2-p13 eph2pos (nezávislá implementace téhož algoritmu ICD) pro skutečné záznamy vysílání BKG/IGS z 2024-09-10, obojí zapsáno s původem v tests/fixtures/rinex_sp3_interop (NOTICE, rinex_ecef_reference.txt, brdc_multignss_slice.rnx). Tím se ověřuje keplerovský uživatelský algoritmus; korekce podél/napříč/radiálně přidané navrch pokrývají jejich vlastní řádky a členy Liu b

seg-5b4f1e63795f = <b>VALIDATED</b> leo_navmsg::codec::crc24q: generující polynom 0x1864CFB, počáteční hodnota { "0" }, bez zrcadlení, bez závěrečného XOR, kontrola, kterou rámec LEO Kshany nese přes každý přede. Orákulum (ExternalDataset): Katalogová kontrolní hodnota CRC pro tyto parametry (katalog CRC reveng.sourceforge.io, CRC-24/LTE-A: šířka { "24" }, poly 0x864CFB, init { "0" }, check 0xCDE703), což jsou parametry CRC-24Q podle RTCM { "10403" } a Galileo OS SIS ICD, a ukázkový rámec zprávy typu { "1005" } vytištěný v RTCM { "10403" }

seg-6e2719a28884 = <b>VALIDATED</b> Prokládání a obchodní rozbor druhu <c1/>: pravdivá dráha integrovaná se zonální gravitací J2-J6 nebo EGM2008 do zvoleného stupně a s odporem a seedovaný volný nebo říz. Orákulum (ExternalDataset): Skutečné přesné vědecké dráhy jako pravda (operační redukované dynamické dráhy TU Graz IfG/ITSG, volně k jakémukoli použití s uvedením zdroje; hodnoty SHA-256 v NOTICE fixture) proložené 16parametrovou sadou na obloucích { "20" } a { "30" } min, proti statistikám, které Liu et al. { "2025" } (Remote Sensing { "17" }({ "16" }):{ "2894" }, CC BY { "4.0" }) publikují pro tytéž družice a dny: RMS podél, napříč a radiálně každé do 1,5x (změřeno { "0.804" } až { "1.087" }), SISR

seg-0c26ec09bf16 = SISRE je chyba reprezentace zprávy oproti pravdě, na kterou byla proložena; chyba určení a předpovědi dráhy se nemodeluje. (výsledek <c1/>)

seg-3762de39de07 = Pravdivá dráha je numerická integrace Kshany (zonální gravitace nebo EGM2008, statický exponenciální odpor), nikoli přesná dráha skutečné družice; bez třetích těles, tlaku slunečního záření a slapů. (výsledek <c1/>)

seg-4486dd350b57 = Binární formát je vlastní zdokumentované kódování Kshany podle publikovaných složek zprávy; není to bitové uspořádání Celeste ani jiného systému (žádné není veřejné). (výsledek <c1/>)

seg-2a5c1bce8320 = Blok ve stylu RINEX je zdokumentované rozšíření Kshany; RINEX { "4.02" } nedefinuje žádné navigační záznamy LEO. (výsledek <c1/>)

seg-642d8f4d60e7 = Koeficienty NeQuick-G jsou neseny a efektivní úroveň ionizace je vypočtena, ale integrace hustoty elektronů podle NeQuick, která z ní dělá zpoždění, není implementována; zpoždění podle Klobucharu implementováno je, přepočtené na nosnou pomocí 1/f^{ "2" } bez korekce pro družici létající uvnitř ionosféry. (výsledek <c1/>)

seg-8ba04a3147bd = Členy 22parametrového modelu Liu et al. { "2025" } sledují uživatelský algoritmus z článku (rov. 1-7) a strategii proložení (oddíl { "2.3" }); jeho údaje SISRE v závislosti na výšce používaly skutečné přesné dráhy, takže toto srovnání na dráze integrované Kshanou je MODELLED, nikoli VALIDATED (srovnání na skutečné dráze je tests/leo_navmsg_fit_real_orbit_oracle.rs). (výsledek <c1/>)

seg-b3585c7feb4e = MIXED — stavební bloky VALIDATED, výsledky MODELLED. Váhy SISRE reprodukují publikovanou tabulku MEO/GEO (Montenbruck et al. { "2018" }), uživatelský algoritmus Galileo ICD reprodukuje RTKLIB na skutečných vysílaných efemeridách Galileo a CRC-24Q reprodukuje svou katalogovou kontrolní hodnotu a ukázkový rámec RTCM { "1005" }. Každý údaj o proložení, SISRE, kontinuitě a kvantizaci je MODELLED: chyba reprezentace zprávy oproti (výsledek <c1/>)

seg-d6e412aab1b4 = MODELLED: každý údaj o proložení a SISRE je chyba reprezentace oproti pravdě integrované Kshanou (žádná chyba určení ani předpovědi dráhy); srovnání s Liu et al. (katalog druhů (<c1/>))

seg-c5478f572d21 = Stránka rodiny: <a1>Navigace z nízké oběžné dráhy Země</a1>

seg-d9257241d523 = Tematická stránka: <a1>LEO-NAVMSG.md</a1>

seg-b0dcad22aed6 = <s1>Předchozí</s1>launch-window

seg-2984c4c69850 = <s1>Další</s1>leo-pass
