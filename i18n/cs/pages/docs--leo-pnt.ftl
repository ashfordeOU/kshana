# docs--leo-pnt: translations (cs)

seg-46c7e6f003dd = Systém

seg-cae10fb9bff8 = Scénář

seg-1759a8cce7d6 = Druhy

seg-71aee5eb55c5 = UHF

seg-f1f903f1b9ff = Odolnost

seg-b03d56f501c3 = Druh

seg-f63dd3d7aad4 = Zdroj

seg-587beeccaa11 = Předvolba

seg-e305279d5b11 = Obsah

seg-6752521002b2 = Část

seg-cf6ae60eea4f = Pomocné údaje

seg-0bdbdd2c923b = Synchronizace

seg-b09dc4b322d3 = Efemeridy

seg-3a835a49b43f = Další služby

seg-a17f4b4f7fb5 = { "1191.795" } MHz

seg-c5ce76c91ff7 = Popisek

seg-c1020ac47091 = Co jeden běh vypočítá

seg-f708914fed48 = Pásma

seg-486f17197d4d = REPRESENTATIVE, pro systémy v pásmu C, jejichž parametry nejsou veřejné (například TrustPoint)

seg-03d5ae448705 = <c1/> (volitelné)

seg-fde146239f5d = Výsledek jednoho běhu

seg-a3f63252bd1b = Co nese

seg-7d2c6fbf95b7 = Zdroj: <c1/>

seg-6f1f29597f4b = LEO-PNT v Kshana

seg-2a3a1f19005a = LEO-PNT je určování polohy, navigace a času (PNT) z družic na nízké oběžné dráze Země (LEO), vedle globálních družicových navigačních systémů (GNSS) na střední oběžné dráze Země (MEO), jako jsou Global Positioning System (GPS) a Galileo, nebo místo nich. Tato stránka spojuje všechny druhy a scénáře LEO-PNT enginu: co každý počítá, pásma a předvolby signálů a odkud jejich čísla pocházejí, co nese navigační zpráva, co je VALIDATED a co MODELLED a jak každý scénář spustit. Stránky jednotlivých druhů jdou do větší hloubky:

seg-8e3556046e63 = Stránka

seg-cdb06a47be0a = <c1/> (návrhy signálů) a vícepásmové panely <c2/>

seg-09894e033033 = <c1/> (geometrie přeletu a rozpočet spoje pro každé pásmo, určení polohy s nízkou spotřebou energie, sondování ionosféry, monitory spoofingu)

seg-f19c0bfe2996 = <c1/> (vysílaná zpráva: fitter, uživatelský algoritmus, binární a textové formáty)

seg-0fe4979f8309 = <c1/>, <c2/>, <c3/> (fúzované určování polohy, přesné určování polohy bodu, určování polohy v nepozemní síti (NTN) 5G, časování, polární pokrytí)

seg-29013ad5656c = <c1/> (vodopády rušení (jamming) a poměr rušení k signálu (J/S) pro každé pásmo)

seg-d291250b5d01 = <c1/> (řetězce, průchody, Monte Carlo a kompozice libovolných druhů)

seg-8d2de8f77619 = Nejprve nezávislost na systému

seg-f3750a8f2863 = Engine je obecný simulátor LEO-PNT. Libovolná konstelace (vzor Walker, explicitní oběžné prvky, dvouřádková sada prvků (TLE) prostřednictvím propagátoru Simplified General Perturbations { "4" } (SGP4) nebo navržený jediný přelet), libovolný návrh signálu (libovolné pásmo, libovolná směs složek s binárním fázovým klíčováním (BPSK), binární offsetovou nosnou (BOC) a frekvenčním vícenásobným přístupem (FDMA)), libovolný model navigační zprávy. Pojmenované systémy jsou volitelné předvolby: datové soubory, každý se svým zdrojem, které doplňují jen to, co scénář vynechá. Každá schopnost, test, orákulum i přibalený scénář běží bez jakýchkoli dat Celeste.

seg-4d3bd0301e59 = Předvolba Celeste IOD (demonstrace na oběžné dráze) je jednou z těchto volitelných předvoleb. Její parametry signálu byly prezentovány na workshopu LEO-PNT programu ESA NAVISP (Navigation Innovation and Support Programme Evropské kosmické agentury) v roce { "2026" } a zatím pro ně neexistuje veřejný zdroj. Každé číslo enginu odvozené z workshopu je v jediném souboru <a1><c1/></a1>, který <c2/> zkompiluje, jen pokud existuje, a ve scénářích dostupných pouze v repozitáři <c3/>. Smazáním tohoto souboru a těchto scénářů se předvolba zadrží bez jakékoli úpravy zdrojového kódu; každý další test, orákulum i scénář běží i bez ní (<c4/> hlídá, které soubory ji smějí jmenovat). Tato stránka neuvádí žádné z jejích čísel.

seg-5b348102cb63 = Druhy a jak na sebe navazují

seg-120b9be05fc3 = pásmově omezená spektrální hustota výkonu (PSD) návrhu signálu, výkon v pásmu, střední kvadratická (Gaborova) šířka pásma, rozptyl kódového sledování v závislosti na poměru nosné k šumu (C/N0), vyhledávání při akvizici a koeficienty spektrální separace (SSC) vůči signálům GNSS; porovnání pásem (velmi vysoký kmitočet (UHF), L, S, C)

seg-d9febf3c74c8 = uzavřené tvary VALIDATED, návrhy a porovnání MODELLED

seg-d0d8d1edd9ee = <c1/> (vícepásmové panely)

seg-dc3ceb315e9a = vodopády pro každé pásmo s rušiči pro každé pásmo (nemodulovaná nosná (CW), čirp, úzkopásmový, širokopásmový, přizpůsobený), J/S a efektivní C/N0 každého signálu na časové ose

seg-126a14392994 = spektra VALIDATED, rušiče MODELLED

seg-e63f73ab5bca = geometrie přeletu, Doppler a rychlost změny Dopplera, ztráta ve volném prostoru, antény družice a uživatele, plynový útlum, útlum deštěm, scintilace a ztráta průnikem do budovy podle ITU-R (International Telecommunication Union, Radiocommunication Sector), C/N0 pro každé pásmo a epochu vedle nosných GNSS na MEO; ionosféra pro každé pásmo a dvojice bez vlivu ionosféry; určení polohy s nízkou spotřebou energie; sondování ionosféry; monitory spoofingu

seg-a9fd4162604f = součásti VALIDATED, přelet MODELLED

seg-91304e663174 = vysílaná zpráva efemerid a hodin: fitter, chyba vzdálenosti signálu ve vesmíru (SISRE) v závislosti na intervalu fitu a periodě aktualizace, kontinuita aktualizace uprostřed přeletu, uživatelský algoritmus, binární rámec s 24bitovou cyklickou redundantní kontrolou (CRC-24Q), exporty ve stylu RINEX { "4" } (Receiver Independent Exchange Format) a jako hodnoty oddělené čárkami (CSV)

seg-cf93a9ba065c = uživatelský algoritmus, váhy a CRC VALIDATED, fity MODELLED

seg-3084696ad387 = určování polohy z Dopplera, společná určení polohy z pseudovzdáleností GNSS + LEO s mezisystémovými zkresleními, polární a arktická geometrie, přenos času do koordinovaného světového času (UTC), s volitelnou stopou časové chyby pro každou epochu

seg-79117194e50b = maximální Doppler VALIDATED, zbytek MODELLED

seg-1de31fd3cf86 = konvergence přesného určování polohy bodu (PPP) pouze s GNSS a s vrstvami LEO

seg-525733c10d9b = přesnost určování polohy 5G NTN z šířky pásma downlinku (Cramérova-Raova mez)

seg-cb8eee06e664 = jeden systém od začátku do konce: návrh signálu, přelet, zpráva, fúzované určení polohy a PPP, s uvedením každého předání

seg-d28e18170f82 = libovolný z výše uvedených zřetězený na jedné časové ose, procházený, spouštěný jako soubor Monte Carlo nebo skládaný za sdílených podmínek

seg-5479654fabfd = Řetězec předává hodnoty v kódu (viz <a1>Řetězec LEO-PNT od začátku do konce</a1> níže): návrh signálu určuje rozdělení EIRP (ekvivalentní izotropicky vyzářený výkon) pásma přeletu a sledovanou čipovou rychlost; přelet dává sledované C/N0 a rozptyl kódu; SISRE navigační zprávy a C/N0 přeletu váží měření LEO ve fúzovaném určení polohy.

seg-a0331a21413c = Obecné návrhy používají veřejné středy pásem; každý je REPRESENTATIVE, nikoli signálem některého systému (<c1/>, <c2/>).

seg-a86ce24d81de = Pásmo

seg-daf61ebdca17 = Alokace

seg-ba6fbebc2a98 = Obecný návrh

seg-3332ae549a90 = Střed

seg-c7be6f6797a8 = Vysílací šířka pásma

seg-74f4e80c65cb = Složky

seg-e95de3591152 = Ionosférické zpoždění prvního řádu vzhledem k L

seg-e769f0411e64 = Vydavatelem staženo; žádná archivovaná kopie

seg-8b04e51a023e = není alokací radionavigace (reprezentativní); nosná z veřejného <s1>průzkumu openRECEIVER</s1> (stránka byla od té doby stažena; viz <a1>LEO-SIGNAL.md</a1>)

seg-ea152d84aabc = { "465" } MHz

seg-8a3026904912 = { "10" } MHz

seg-e1500e8695b9 = BPSK({ "5" }) pilot a data

seg-ac33d89291ca = družicová služba radionavigace (RNSS), střed Galileo E5

seg-278d0b375f6f = { "20.46" } MHz

seg-54e10c07ace3 = BPSK({ "10" }) pilot a data

seg-5e28b8377751 = družicová služba určování polohy (RDSS), nosná S systému NavIC (Navigation with Indian Constellation)

seg-39e207bee75b = { "2492.028" } MHz

seg-a573432714b8 = { "16.5" } MHz

seg-6fe14d537f33 = RNSS, střed alokace { "5010" }–{ "5030" } MHz

seg-48fabff33863 = { "5020" } MHz

seg-0b50907d3165 = { "20" } MHz

seg-c43105d1c770 = C rozšířené

seg-c05714081a0e = mimo alokaci RNSS (reprezentativní)

seg-638ab0837b29 = { "5100" } MHz

seg-4d3857271629 = { "120" } MHz

seg-18bc5451fc46 = BPSK({ "50" }) pilot a data

seg-3714e1c00ab8 = S (družicová mobilní služba, MSS)

seg-cc26934bac14 = downlink MSS, pásmo n256 projektu 3GPP (Third Generation Partnership Project)

seg-12ca7304ece7 = používá <c1/>

seg-896b6ee57728 = { "2172.5" } MHz

seg-e6e1d955489a = { "0.18" } až { "20" } MHz

seg-50e44c7042c9 = polohovací signály 5G New Radio

seg-e75e48eeeca1 = BPSK(n) je binární fázové klíčování při n × { "1.023" } Mchip/s. Poměr zpoždění je <c1/> s <c2/> = { "1191.795" } MHz. Ztráta ve volném prostoru roste o <c3/> při stejné vzdálenosti (−{ "8.2" } dB na UHF, +{ "6.4" } dB na S, +{ "12.5" } dB na C).

seg-02f71b44edf5 = Předvolby signálů a systémů

seg-c60ce9c32b57 = REPRESENTATIVE, středy pásem z Radiokomunikačního řádu ITU

seg-58fae66f7c12 = <c1/> (návrhy signálů): tabulka pásem výše; <c2/> (výchozí v <c3/>): UHF na { "450" } MHz, L, S a C na výše uvedených středech, EIRP { "0" } dBW na pásmo, heliosynchronní vrstva Walker 240/12/1 ve výšce { "550" } km

seg-5d918965c00c = BPSK({ "10" }) na { "5020" } MHz, izoflux svazek

seg-dddb031a7e2e = PUBLIC: Leclère, Marathe a Reid, Institute of Navigation (ION) GNSS+ { "2025" }, <a1>arXiv { "2509.19551" }</a1>

seg-67fc4039084d = X1 na { "1593.3225" } MHz ({ "1.023" } Mchip/s) a X5 na { "1190.51625" } MHz ({ "10.23" } Mchip/s), zveřejněné minimální a maximální přijímané výkony, { "258" } družic ve výšce asi { "1080" } km (shelly { "53" } a { "97" } stupňů)

seg-f17f98d1ae0b = PUBLIC: <a1>briefing Resilient Navigation and Timing Foundation (RNTF)</a1>

seg-c6694cdbb02b = shluky na { "1616" }–{ "1626" } MHz, Doppler až ±{ "36" } kHz, { "66" } družic ve výšce { "780" } km ({ "781" } km v předvolbě <c1/>), přijímaný výkon „{ "300" } až { "2400" }násobek GPS“

seg-704ec002a889 = <c1/> / <c2/> / <c3/> (druhy signálu, přeletu a určování polohy)

seg-a4a3a7c7bc22 = PUBLIC údaje o signálu: Kozhaya, Saroufim a Kassas, <a1>NAVIGATION { "72" }({ "1" })</a1>; REPRESENTATIVE dráha

seg-49985bf11216 = maják v pásmu Ku { "240" } MHz používaný pouze pro Doppler, C/N0 asi { "57" } dB-Hz

seg-84cb50b019e0 = PUBLIC struktura signálu: <a1>PMC10301026</a1>; REPRESENTATIVE dráha a výkon

seg-1c50faed9f1e = BPSK při { "2.046" } Mchip/s poblíž L1 a L5

seg-c72e9b87f116 = <c1/> (<c2/> v druhu zpráva)

seg-3dd4136094c0 = PUBLIC: <a1>InsideGNSS, užitečné zatížení ATOMIC (Autonomous Time and Orbit Determination for Microsatellite Constellations)</a1>

seg-4f0cff24b4fd = polynomiální efemeridy 6. řádu bez členů hodin (hodiny jsou řízeny k času GNSS)

seg-9d1e7aebcd84 = WORKSHOP: prezentováno na workshopu LEO-PNT programu ESA NAVISP v roce { "2026" }

seg-28c2e7ae6065 = konfigurace signálu č. 1 a rozvržení zprávy demonstrace na oběžné dráze, v jediném zadržitelném souboru

seg-9f0d16f43993 = Každá předvolba označuje svá čísla jako PUBLIC (s adresou URL), REPRESENTATIVE (zdokumentovaná návrhová volba, nikdy tvrzení o skutečném systému) nebo WORKSHOP a výsledek každého běhu, který některou používá, uvádí, která to je.

seg-556fe9c6c3b1 = Navigační zpráva

seg-a220662ed8de = Navigační zpráva LEO (<a1>LEO-NAVMSG.md</a1>) nese čtyři části, strukturu, kterou sdílejí Galileo Open Service Signal-in-Space Interface Control Document (OS SIS ICD) a zveřejněné návrhy pro LEO:

seg-5bda276f6e82 = keplerovský soubor 16 parametrů z Galileo ICD (druhá odmocnina velké poloosy, excentricita, sklon a jeho rychlost změny, rektascenze uzlu a její rychlost změny, argument perigea, střední anomálie, korekce středního pohybu, šest harmonických korekcí, referenční čas) plus korekční polynomy podél dráhy, napříč dráhou a radiálně; nebo 22parametrový model Liu et al. { "2025" } (<a1>doi 10.3390/rs17162894</a1>); nebo polynom ATOMIC s nulovými hodinami

seg-8a7dabfece01 = číslo týdne a čas v týdnu (TOW) a polynom hodin druhého řádu (af0, af1, af2 vůči toc)

seg-24eaf4ae7eb3 = identifikátor kosmického vozidla (SVID), vydání dat (IOD), stav zdraví signálu

seg-e7d819b7a724 = ionosférické korekce pro jednofrekvenční uživatele (sada ve stylu Klobuchar a NeQuick-G ai0–ai2) a posun systémového času vůči UTC (A0, A1, přestupné sekundy a jejich rozpis)

seg-200e59d9279c = Binární rámec je vlastní zdokumentované kódování Kshana podle těchto složek, nikoli bitové rozvržení některého systému. RINEX { "4.02" } nedefinuje žádné navigační záznamy LEO, takže export ve stylu RINEX je zdokumentovaným rozšířením Kshana (předchozí práce: <a1>arXiv { "2401.17767" }</a1>).

seg-aa18ab84599b = průchod <c1/> druhu <c2/>

seg-70dc120ea19e = zahlcení { "50" } MHz na { "1185" } MHz procházené od −{ "140" } do −{ "80" } dBW: GPS L5 je ztracen při −{ "105" } dBW, Galileo E5a a signál LEO v pásmu L při −{ "100" } dBW; signály LEO v pásmech UHF, S a C udrží při každém výkonu { "49.4" }, { "49.2" } a { "47.4" } dB-Hz

seg-61f05d7e3a18 = zahlcení { "40" } MHz na { "1185" } MHz se stupňovitým zvyšováním o { "5" } dB každých { "10" } s od −{ "125" } dBW: GPS L5 ztracen při −{ "105" } dBW, Galileo E5a při −{ "100" } dBW, Xona X5 (na zveřejněném minimu, −{ "144.9" } dBW) při −{ "95" } dBW; obecný signál LEO při −{ "135" } dBW stále sleduje při −{ "90" } dBW ({ "28.9" } dB-Hz). Přijímaný výkon kupuje rezervu J/S dB za dB

seg-6a3a46be60a5 = skok polohy o { "30" } m na zaměřeném stanovišti: test Dopplera pouze s GNSS jej nikdy nedetekuje; test na všech kanálech ano, { "105" } s po nástupu (viz <a1>LEO-PASS.md</a1>)

seg-d0c4683d7c93 = kompozice <c1/> druhu <c2/>

seg-bf0ec52f63ea = čtyři spoofery, oba monitory: spoofer pouze v pásmu L a spoofer všech pásem bez ionosféry jsou zachyceny monitorem mezi pásmy při nástupu ({ "300" } s) a monitorem Dopplera v { "420" } s a { "395" } s; spoofer všech pásem s ionosférou pouze monitorem Dopplera ({ "395" } s); posun o { "30" } m pouze v GNSS ani jedním

seg-17bcc4ead2ee = řetězec <c1/> (<c2/>, <c3/>)

seg-d9b6e6fe6807 = GNSS rušeno po dobu { "15" } minut (kód hrubého určení polohy (C/A) GPS L1 na asi { "10" } dB-Hz, E5a na { "17.4" } dB-Hz proti prahu { "25" } dB-Hz), zatímco signály LEO v pásmech S a C drží { "49.2" } a { "47.4" } dB-Hz; autonomní monitorování integrity přijímačem (RAIM) pouze na vrstvě LEO tvoří ochrannou úroveň v každé epoše, pod vertikálním mezním poplachem { "50" } m v { "28" } z { "30" } časů mřížky, s poplachem vyhlášeným u zbývajících dvou; nominální a obnovovací fáze { "5.4" } až { "15.6" } m

seg-42efdd12fc54 = Monitory spoofingu, jejich statistiky a jejich omezení jsou na <a1>LEO-PASS.md</a1>. Vícepásmový vodopád s odlišným rušičem pro každé pásmo je <c1/> (<a2>LEO-SIGNAL.md</a2>).

seg-d9e58c4aa8d5 = Jeden scénář na každou oblast zaměření experimentů

seg-1ab626f27e9d = Osm oblastí zaměření experimentů výzvy Celeste IOD pro experimentování třetích stran (ESA Open Space Innovation Platform, OSIP) jsou obecné otázky LEO-PNT; každá má scénář nezávislý na systému:

seg-afc60ca3c9da = Oblast zaměření

seg-8a8f40ce3e40 = Vysoce přesné určování polohy (PPP)

seg-b5eb3448dbb1 = průchod <c1/> druhu <c2/>

seg-5692301bc7cf = vrstva 192 družic ve výšce { "500" }, { "1000" } a { "1500" } km zkrátí konvergenci plovoucího PPP s více GNSS v Mnichově z { "13.0" } min na { "3.25" }, { "3.25" } a { "3.5" } min (šest realizací, epochy { "30" } s)

seg-3992215bc8c9 = Odolnost PNT (L, S, C)

seg-a2cc270b415c = viz Odolnost

seg-8a6381ff15ac = Kompatibilita s 5G/6G NTN

seg-ae21ac79775f = průchod <c1/> druhu <c2/>

seg-cb52e7eb3c36 = šířka pásma polohovací reference { "180" } kHz až { "20" } MHz: sigma vzdálenosti v zenitu { "6.5" } m až { "5.8" } cm, 3D chyba z času příchodu { "30.1" } m až { "2.1" } m, omezená zdola síťovou synchronizační chybou { "1" } m

seg-45985b521980 = Určování polohy s nízkou spotřebou energie pro Internet věcí (IoT) a mobilní zařízení

seg-9afaaed509ef = průchod <c1/> druhu <c2/> <c3/>

seg-3bb8cc776a28 = EIRP UHF −{ "35" } až +{ "5" } dBW: pod mediánem C/N0 asi { "35" } dB-Hz roste energie na jedno určení polohy při horkém startu z { "18" } mJ na { "55" } J; nad ním je výdrž baterie při jednom určení polohy za hodinu { "8334" } dní, dána klidovým proudem

seg-4b0890bd9215 = Věda s LEO-PNT

seg-a1ddeda103fa = šikmý celkový elektronový obsah (TEC) z každé dvojice pásem čtyřpásmového přeletu nad Tromsø: { "18.85" } jednotek TEC obnoveno každou dvojicí, 1-sigma { "0.017" } (UHF s L) až { "2.9" } jednotek TEC (S s C)

seg-fc31db33e6fe = Další datové služby PNT

seg-91db4e7b4d9c = kompozice <c1/> druhu <c2/>

seg-aee8bb27a2fb = rámec zprávy Kshana roste ze { "146" } bajtů (efemeridy a hodiny, { "1045" } bitů) na { "154" } se sadou Klobuchar, { "159" } s NeQuick-G a { "171" } s parametry UTC

seg-bd6c76037986 = Navigace uvnitř budov (UHF)

seg-0a274a3aeb86 = vrcholové C/N0 uvnitř tradiční budovy: UHF { "34.1" }, L { "24.2" }, S { "16.5" }, C { "9.0" } dB-Hz; v tepelně účinné budově UHF { "15.3" } dB-Hz a každé další pásmo nižší

seg-101de8218f35 = Fúzované PNT z MEO a LEO

seg-b4daa58a2fe7 = průchod <c1/> druhu <c2/>

seg-903d8dcb96cc = Xona X5 fúzovaná s GPS a Galileo nad Madridem: 3D chyba pouze s GNSS { "1.06" } m střední kvadratická (RMS); fúzovaně { "0.08" } m při SISRE LEO { "5" } cm, { "0.57" } m při { "0.5" } m a { "1.01" } m při { "5" } m

seg-ebe7a27275cb = Jeden scénář na každé odvětví koncových uživatelů

seg-7c21d067769a = Každé odvětví je řetězec <c1/> na jedné časové ose, takže se animuje, a každé má člena <c2/>, takže exportuje geometrii (viz <a1>Spuštění</a1>).

seg-1d1135625500 = Odvětví

seg-f1a7e54ea7d0 = Autonomní vozidla

seg-3610a5f7c352 = auto v Mnichově: otevřená silnice, fúzovaná chyba { "0.30" } m v průměru; v městském kaňonu { "35" } stupňů GPS a Galileo udrží { "8" } družic a střední chybu { "5.8" } m, obecná vrstva LEO přidá { "4" } až { "5" } a sníží ji na { "2.1" } m, stále nad prahem { "1.5" } m na úrovni jízdního pruhu přibližně v polovině epoch v kaňonu

seg-6622d9c7366d = Železnice a námořní doprava

seg-73ba745cb492 = přibalená loď <c1/> ztratí každou družici GNSS ({ "12.1" } dB-Hz), zatímco její přelet LEO v pásmech S a C dosáhne { "44.2" } a { "38.1" } dB-Hz; přibalený vlak <c2/> dosáhne { "2" } m inerciální chyby { "35.8" } s po vjezdu do tunelu; na volném prostranství dává jeho přelet LEO { "35" } až { "50" } dB-Hz v pásmu L

seg-c87973b9139a = Kritická infrastruktura

seg-c16a4c99e132 = oscilátor třídy TCXO (teplotně kompenzovaný krystal) časového serveru rozvodny volně běžící celý den bez GNSS dosáhne { "29" } µs, překročí ochranný práh { "1" } µs mezi { "75" } a { "80" } minutami po ztrátě (na 5minutové mřížce); stejná třída disciplinovaná k Iridiu zůstane mezi −{ "40" } a +{ "11" } ns

seg-1be8e11b2530 = Polární a arktičtí uživatelé

seg-660e450cb4ab = střední polohový faktor zhoršení přesnosti (PDOP) GPS + Galileo { "1.38" }, { "1.57" } a { "1.62" } v Tromsø, na Svalbardu a na severním pólu; s Iridiem { "1.29" }, { "1.34" } a { "1.26" }, z { "3.0" }, { "5.5" } a { "6.8" } družic Iridium v dohledu

seg-22d99734acf1 = Bezdrátové sítě 5G/6G

seg-abcc6337206f = termostatovaný krystalový oscilátor (OCXO) základnové stanice v holdoveru překročí síťový limit { "1.1" } µs po { "8863" } s a limit koncové aplikace { "1.5" } µs po { "10006" } s (analýza druhu <c1/>); disciplinovaný k Xona X5 zůstává jeho časová chyba po celý den mezi −{ "0.7" } a +{ "0.3" } ns, s předpovězeným 1-sigma { "5" } ns, uvedenou nejistotou vysílaného posunu UTC

seg-532d6814ab2d = Sledování majetku a IoT

seg-b4d6d822e1d0 = horké určení polohy UHF u kontejnerové značky stojí { "18" } mJ na nábřeží i na moři ({ "8334" } dní baterie při jednom určení polohy za hodinu) a { "34" } mJ ve skladu ({ "5770" } dní), kde pásmo L klesne na { "20" } až { "24" } dB-Hz

seg-e54b0342fa79 = VALIDATED a MODELLED

seg-dd808d1741f3 = Řádek je VALIDATED, jen když test reprodukuje zveřejněné nastavení a připíná zveřejněnou hodnotu v uvedené toleranci; vše ostatní je MODELLED s odůvodněním (<a1>VERIFICATION-MATRIX.md</a1>, <a2>MODELLED-RATIONALE.md</a2>).

seg-592a6cf625c5 = Řádky LEO-PNT VALIDATED:

seg-344712930047 = výkon pásmově omezeného signálu a rozptyl kódového sledování early-late v uzavřeném tvaru ve zveřejněných pracovních bodech (Betz a Kolodziejski { "2009" }), s křížovou kontrolou Gaborovy šířky pásma a SSC;

seg-e93d5b5d3dda = maximální Doppler navigační družice LEO (Xona Pulsar X1 { "32" }–{ "34" } kHz, Iridium ±{ "36" } kHz) a obálka Dopplera statického uživatele proti arXiv { "2509.19551" }, tabulka { "1" };

seg-b02c1b42e509 = koeficienty deště ITU-R P.838-3, útlum deštěm a troposférická scintilace podle P.618-14 a ztráta průnikem do budovy podle P.2109-2 proti validačním datům ITU-R Study Group { "3" };

seg-fc668542b66d = škálování ionosférického zpoždění prvního řádu a ztráta ve volném prostoru (poměr skupinového zpoždění podle IS-GPS-200, Friisův tvar);

seg-59847c667c8b = globálně průměrné váhy SISRE (Montenbruck et al. { "2018" }), uživatelský algoritmus Galileo ICD proti RTKLIB na skutečných vysílaných efemeridách a CRC-24Q proti své katalogové kontrolní hodnotě.

seg-922761c46f8a = Řádky LEO-PNT MODELLED: každý návrh signálu a porovnání pásem, vícepásmový vodopád, každý přelet a rozpočet spoje jako celek, předvolby, určování polohy s nízkou spotřebou energie, fitter zprávy a formáty, určování polohy z Dopplera a společné, konvergence PPP, určování polohy NTN, přenos času, polární pokrytí, řetězec od začátku do konce, monitory spoofingu a sondování ionosféry a každá kampaň (kampaň skládá druhy a nepřidává žádnou fyziku; její kompoziční identity jsou testovány, <a1>CAMPAIGNS.md</a1>). Žádné C/N0, chyba měření vzdálenosti ani hodnota určení polohy LEO se neporovnává s měřením žádné družice.

seg-3cc1d3f1c0f8 = Spuštění scénáře

seg-00d5b60c0ebb = Každý výše uvedený scénář je přibalen: <c1/> jej vypíše a

seg-e01ebe977e65 = zapíše vedle souboru výsledek (<c1/>), graf (<c2/>), pokročilou zprávu (<c3/> a <c4/>, se sekcí, která vkládá animovaný běh a uvádí exporty), interaktivní přehrávač (<c5/>) a exporty. Co platí, závisí na druhu:

seg-8a96eda978b4 = běh s časovou osou se animuje: epochy <c1/>, <c2/> spoofingového běhu, časové osy <c3/>, společné epochy a stopy časování <c4/>, chybové křivky <c5/> a každý řetězec kampaně. Průchod nebo kompozice nemá časovou osu: <c6/> je odmítne se stavem ukončení { "1" } a poté příkaz nezapíše vůbec nic, takže osm výše uvedených průchodů a kompozic (<c7/>, <c8/> a každý scénář <c9/> kromě <c10/>) spusťte bez <c11/>;

seg-8d26148aeeff = <c1/> a <c2/> exportují efemeridy geometrie přeletu ve formátech CZML (Cesium Language), KML (Keyhole Markup Language), GeoJSON a STK (Systems Tool Kit); kampaň exportuje každého člena, který má geometrii, jako vlastní sadu souborů, s označením člena v názvu souboru (<c3/>), takže každé odvětví exportuje své přelety LEO; ostatní druhy LEO uvádějí, proč se formát neuplatňuje (<a1>INTEROP.md</a1>).

seg-6f3ad057f914 = Zbývající scénáře LEO podle druhu (podrobnosti na stránce každého druhu):

seg-73365a12bf64 = <c1/>, <c2/>, volitelný <c3/>

seg-f34e2d4b3374 = <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, volitelný <c6/>

seg-559eaf4bafa1 = <c1/>, <c2/>, <c3/>, <c4/>, volitelný <c5/>

seg-731d447261fc = <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, volitelný <c6/>

seg-e3017b224dfc = <c1/>, <c2/>, volitelný <c3/>

seg-1ada84b384ee = Volitelné scénáře jsou pouze v repozitáři a jsou zadrženy spolu se souborem předvolby Celeste.

seg-6305e46ec778 = Dva z nich patří do jiných druhů. <c1/> (<c2/>) dimenzuje konstelaci LEO-PNT o 5000 družicích ve čtyřech ilustrativních shellech Walker: dostupnost { "99.22" } % při PDOP { "3" } nebo menším nad maskou { "20" }°, medián PDOP { "1.11" } a v průměru { "39.4" } družic v dohledu přes { "648" } bodů mřížky a { "12" } epoch. <c3/> (<c4/>) se ptá, jak dlouho zůstane OCXO podle datového listu družice LEO typu smallsat uvnitř ochranného intervalu slotu { "100" } ns při k = { "3" } po posledním určení polohy GNSS: ochranný interval se poruší { "650.8" } s po určení polohy, takže je třeba určení polohy alespoň každých { "645.8" } s ({ "133.8" } za den), přičemž dominantním členem je šum náhodné procházky frekvence.

seg-ee9f20a4485b = Řetězec LEO-PNT od začátku do konce

seg-a6167db680ba = Druh <c1/> (<a1><c2/></a1>) sleduje jeden systém LEO-PNT od návrhu signálu po polohu uživatele. Každý stupeň je vlastní druh enginu, spuštěný na vlastní tabulce scénáře řetězce, a řetězec předává hodnoty z jednoho stupně do dalšího v kódu:

seg-38ce4c90dd78 = Odkud

seg-2cbf005ed5cc = Kam

seg-5d84d64174b6 = Co se předává

seg-15372352ab42 = podíl výkonu sledované složky, podíl v pásmu a sledovaná čipová rychlost (rozdělení EIRP pásma a jeho posun C/N0)

seg-0be525c6b695 = výška a sklon družice řetězce (pravdivá dráha zprávy), pokud je neuvádí <c1/>

seg-d2306e118be7 = sledované C/N0 na polohovací masce a v zenitu, z přímky nejmenších čtverců v sin(elevace) proložené přeletem

seg-ee40b8cd109b = chyba vzdálenosti signálu ve vesmíru (SISRE): chyba reprezentace zprávy (střední kvadratická, dráha a hodiny) s členem určování oběžné dráhy <c1/> ze scénáře v odmocnině součtu čtverců

seg-b4b3dff58f3b = nosný kmitočet a sledovaná čipová rychlost

seg-4def115dba1b = Hodnota se předá jen tam, kde ji navazující tabulka nechává nenastavenou, a každé předání je uvedeno v poli <c1/> výsledku s hodnotou, jednotkou a cílem. Pásmo <c2/> musí pojmenovat návrh (<c3/>); tak nese libovolný návrh <c5/> i pásmo <c4/> samostatně: převezme střední kmitočet návrhu, vysílací šířku pásma a sledovanou čipovou rychlost, rozdělí své EIRP mezi složky a v každé epoše hlásí C/N0 sledované složky a pásmově omezený koherentní rozptyl kódového sledování early-late (Betz a Kolodziejski { "2009" }; rozestup půl čipu, smyčka { "1" } Hz, { "20" } ms).

seg-2a2b15256cf4 = obecný: reprezentativní návrh <c1/>, přelet { "1080" } km, { "53" }° nad Madridem, vrstva Walker o 240 družicích

seg-bb05e8e505e3 = vrchol sledovaného C/N0 { "58.2" } dB-Hz, medián rozptylu kódu { "0.050" } m; předáno SISRE { "0.250" } m; střední kvadratická (RMS) 3D chyba pouze s GNSS { "1.60" } m, GNSS + LEO { "0.43" } m; konvergence přesného určování polohy bodu (PPP) { "11.5" } min pouze s GNSS, { "7.5" } min s vrstvou LEO

seg-4d1299ee4725 = Xona Pulsar X5 (arXiv { "2509.19551" }), nakloněný shell pro určování polohy a oba shelly pro PPP

seg-a8fe501bf419 = vrchol sledovaného C/N0 { "66.3" } dB-Hz, medián rozptylu kódu { "0.018" } m; RMS 3D chyba pouze s GNSS { "1.49" } m, GNSS + LEO { "0.68" } m; konvergence PPP { "20.6" } min pouze s GNSS, { "5.9" } min s Pulsar

seg-002e4c918dda = <c1/> (volitelné)

seg-a608af78a360 = konfigurace Celeste IOD E5 č. 1 s předvolbou zprávy Celeste (zadrženo s předvolbou)

seg-be428c21bd27 = přelet reprodukuje vrcholové celkové C/N0, na které je předvolba kalibrována (hodnota je v souboru předvolby); dvě družice sotva pohnou 95minutovým fúzovaným určením polohy ({ "1.50" } m na { "1.48" } m RMS 3D)

seg-bf44ba47e48b = zapíše výsledek, graf, pokročilou zprávu (která vkládá animovaný přelet a odkazuje na exporty), interaktivní přehrávač a soubory efemerid CZML (Cesium Language), KML (Keyhole Markup Language), GeoJSON a STK (Systems Tool Kit) s geometrií přeletu.

seg-a08e67a32d60 = Řetězec je MODELLED: nepřidává žádnou fyziku a každý stupeň si ponechává vlastní označení. Model C/N0 polohovacího stupně je přímka v sin(elevace), takže tvar specifický pro přelet je zredukován na dvě čísla; stupeň zprávy nemodeluje žádné určování oběžné dráhy, a proto je <c1/> uvedeným vstupem ({ "0.25" } m v přibalených scénářích, reprezentativní pro decimetrové palubní určování oběžné dráhy a čipově přesně řízené hodiny, které uvádí užitečné zatížení ATOMIC: <a1>https://insidegnss.com/first-steps-toward-a-fully-operational-leo-pnt-payload/</a1>).

seg-ee3c5b58e6fa = <s1>Předchozí</s1>Oběžná dráha a povrch Měsíce jako infrastruktura

seg-6b951d6413c8 = <s1>Další</s1>Návrhy signálů LEO

seg-9bfe27f7ebc5 = <s1>Předchozí</s1>Vlákno mise: lunární segment
