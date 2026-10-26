# docs--leo-pass: translations (cs)

seg-cae10fb9bff8 = Scénář

seg-cbf0f9bcd2d8 = Orákulum

seg-6e0cb6acc073 = VALIDATED

seg-f63dd3d7aad4 = Zdroj

seg-587beeccaa11 = Předvolba

seg-1ff32b87e030 = Družice

seg-a6c63abeb7e6 = Přibalené scénáře

seg-60cd077d82a7 = Model

seg-2b0d77219437 = Předvolby

seg-5566e1d71a4f = Oběžná dráha

seg-c2a2761f73b1 = { "550" } km, { "53" }°

seg-c5ce76c91ff7 = Popisek

seg-813d372bda81 = Zdroj: <c1/>

seg-0bd4af67ffdb = Přelet LEO a rozpočet spoje (<c1/>)

seg-30417c63c48e = LEO-PNT je určování polohy, navigace a času (PNT) z družic na nízké oběžné dráze Země (LEO). Druh <c1/> simuluje jeden či více přeletů družic LEO nad uživatelem a pásmo po pásmu počítá rozpočet spoje vedle družic GNSS (globálního družicového navigačního systému) na střední oběžné dráze Země (MEO) v dohledu. Engine je <b>nezávislý na systému</b>: libovolná konstelace, libovolný návrh signálu a libovolné pásmo se zapíše přímo do scénáře. Pojmenované systémy jsou volitelné předvolby, každá ve vlastním souboru se svým zdrojem.

seg-242c84daecb0 = Kód: <a1><c1/></a1> (druh) a <a2><c2/></a2> (veřejné stavební bloky, které mohou volat jiné moduly).

seg-0e6b09e372f5 = Scénáře: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/> a volitelný <c8/> (výsledky v <a1>Přibalené scénáře</a1>). Tento druh je také členem kampaní <c9/>, <c10/>, <c11/> a každého scénáře <c12/> a stupněm přeletu v druhu <c13/>.

seg-59cebed2f589 = Přehled všech druhů a scénářů LEO-PNT: <a1>LEO-PNT.md</a1>.

seg-9646ce17cddf = Orákula: <a1><c1/></a1>, vzorová data v <c2/> s adresami URL jejich zdrojů.

seg-c1020ac47091 = Co jeden běh vypočítá

seg-10dedc607eac = Pro každou družici LEO, pásmo a epochu:

seg-35bf9a48e566 = Veličina

seg-b0f12ee05fe9 = Elevace, azimut, vzdálenost

seg-24ad909c4fb8 = uživatel ve WGS-84 (World Geodetic System { "1984" }), družice v inerciální soustavě zarovnané se soustavou pevnou vůči Zemi v dané epoše

seg-c9f61c3348ef = vypočteno

seg-ebd800ec3d47 = Rychlost změny vzdálenosti <c1/>, zrychlení vzdálenosti <c2/>

seg-232b42b71f03 = uzavřený tvar; každý běh obě veličiny kontroluje proti centrálním diferencím propagované vzdálenosti a hlásí největší rozdíl

seg-b3a55e868346 = uzavřený tvar

seg-3f1f90a57c2f = Doppler <c1/>, rychlost změny Dopplera <c2/>

seg-852b6c351ce4 = první řád, pro každé pásmo

seg-4eb4b779679b = Ztráta šířením ve volném prostoru

seg-31f67bcd2d50 = Friis, <c1/>

seg-fb5f06a91de1 = EIRP družice (ekvivalentní izotropicky vyzářený výkon) a diagram

seg-883702244778 = izoflux do okrajové elevace, gaussovský hlavní lalok <c1/> dB, nebo plochý

seg-b6e91c5252d3 = Anténa uživatele

seg-ed92a0abf62f = plošná <c1/> dBic, polokulová nebo izotropní

seg-0ac54d232e0a = Plynové útlum

seg-30fb5b0a0bc7 = zjednodušené vztahy ITU-R (International Telecommunication Union, Radiocommunication Sector) P.676-10, příloha { "2" } (nahrazeno P.676-13, jehož tabelované koeficienty engine nenese)

seg-58d58478e9eb = Útlum deštěm

seg-4c1e413d5fc3 = koeficienty ITU-R P.838-3 a postup P.618-14 § { "2.2.1.1" } z intenzity deště R0.01 a výšky deště

seg-dab78c0552b6 = Troposférická scintilace

seg-8e5ca14cbf08 = ITU-R P.618-14 § { "2.4.1" }; pod { "4" } GHz extrapolace, v hlášení označená

seg-788516420351 = VALIDATED ({ "4" }–{ "55" } GHz)

seg-32dddfdba584 = Ztráta průnikem do budovy (uživatel uvnitř)

seg-ef9025622e81 = ITU-R P.2109-2, tradiční nebo tepelně účinná budova, při elevaci dráhy na fasádě

seg-c7d1bccd4d51 = Nesouhlas polarizace

seg-f4aaea269382 = činitel ztráty polarizací z axiálních poměrů a smyslů, zprůměrovaný přes orientaci elipsy

seg-96601850a9d5 = Šumová teplota systému

seg-82735c7f3ea5 = základ antény + vyzařování oblohy absorbující dráhy ({ "275" } K) + kosmických { "2.7" } K + přijímač <c1/>

seg-53ce973b0ee7 = C/N0 (hustota poměru nosné k šumu)

seg-fa01d060cf1a = Ionosférické skupinové zpoždění

seg-33f2113dea70 = <c1/>, STEC (šikmý celkový elektronový obsah) z modelu Klobuchar nebo ze svislého celkového elektronového obsahu (TEC), škálovaný podílem Chapmanovy vrstvy pod družicí

seg-431dfeb5edba = škálování VALIDATED, TEC MODELLED

seg-56df31449434 = Pro každou dvojici pásem: koeficienty bez vlivu ionosféry, zesílení šumu <c1/> a tepelný kódový šum každého pásma i kombinace ve vrcholu přeletu. Srovnání s GNSS na MEO používá stejnou anténu uživatele a přijímač, s minimálním přijímaným výkonem každého signálu podle dokumentu rozhraní (Galileo Open Service Signal-in-Space Interface Control Document, OS SIS ICD, vydání { "2.1" }, tabulka { "12" }; GPS z IS-GPS-200 a IS-GPS-705) plus uvedeným přebytkem, škálovaným podle vzdálenosti. Volitelná sekce <c2/> (Internet věcí) uvádí čas do první určené polohy, energii na určení polohy a výdrž baterie v závislosti na pracovním cyklu pro uvedený výkonový rozpočet přijímače (MODELLED, každý předpoklad je vstup a je uveden ve zprávě).

seg-7132ede02109 = <c1/> (výchozí): kruhová dráha umístěná tak, aby uživatel viděl jeden přelet s zvolenou maximální elevací ve zvolený čas, vzestupný nebo sestupný, východně nebo západně od uživatele; sklon může být heliosynchronní.

seg-688307acbf0d = <c1/>: explicitní keplerovské prvky.

seg-e9085739bcb8 = <c1/>: dvouřádková sada prvků (TLE) prostřednictvím propagátoru Simplified General Perturbations { "4" } (SGP4) v enginu.

seg-7dcc5fdbc249 = <c1/>: konstelace Walker sestavená kódem <c2/> (jeho <c3/> nebo shelly předvolby); hlášeny jsou nejvyšší přelety v okně.

seg-ec7e163dd073 = Pásma a návrhy signálů

seg-4d49743b3544 = Pásma: <c1/> s volitelnou podmnožinou <c2/> a položky <c3/>, které přidávají pásmo nebo přepisují libovolné pole pásma z předvolby. <c4/> pouze s položkami <c5/> nepoužívá žádnou předvolbu.

seg-bd1e114aaea6 = Pásmo může také pojmenovat návrh <c1/> (<c2/>, libovolný návrh v <c3/> nebo návrh, který předá druh <c4/>; viz <a1>LEO-SIGNAL.md</a1>). Pásmo pak převezme střední kmitočet návrhu (pokud není zadáno <c5/>), vysílací šířku pásma a čipovou rychlost sledované složky, rozdělí své EIRP mezi složky návrhu podle jejich podílů výkonu a v každé epoše hlásí C/N0 sledované složky a její pásmově omezený rozptyl kódového sledování early-late (Betz a Kolodziejski { "2009" }, vzorec druhu <c6/>) jako chybu měření vzdálenosti.

seg-1d96501bb12d = Každá předvolba označuje svá čísla jako VEŘEJNÁ (s adresou URL), REPREZENTATIVNÍ (zdokumentovaná návrhová volba, nikdy tvrzení o skutečném systému) nebo SEMINÁRNÍ.

seg-f708914fed48 = Pásma

seg-6459abcaeebe = <c1/> (výchozí)

seg-a0dab2ebeb1b = REPREZENTATIVNÍ; nosné L, S a C z veřejných dokumentů

seg-cd0075385395 = UHF { "450" } MHz (reprezentativní), L { "1191.795" } MHz (střed Galileo E5), S { "2492.028" } MHz (NavIC S, nosná Navigation with Indian Constellation v pásmu S), C { "5020" } MHz (střed alokace RNSS (družicové služby radionavigace) { "5010" }–{ "5030" } MHz), každé { "0" } dBW

seg-3f0de4312fcb = { "550" } km heliosynchronní, Walker 240/12/1

seg-486f17197d4d = REPREZENTATIVNÍ, pro systémy v pásmu C, jejichž parametry nejsou veřejné (například TrustPoint)

seg-f6696b70591c = C { "5020" } MHz, BPSK({ "10" }) (binární fázová modulace s klíčováním při { "10" } × { "1.023" } Mchip/s), izoflux

seg-4ae6741795f9 = VEŘEJNÉ, <a1>arXiv { "2509.19551" }</a1>, tabulky { "1" }–{ "2" }

seg-a1be637cda63 = X1 { "1593.3225" } MHz, X5 { "1190.51625" } MHz; EIRP ze zveřejněného minimálního přijímaného výkonu při { "10" }°

seg-cb74283148d7 = { "1080" } km, { "53" }° ({ "192" }) a { "97" }° ({ "66" })

seg-5ae1331b91f8 = VEŘEJNÉ, <a1>Resilient Navigation and Timing Foundation (RNTF)</a1> a zveřejněná dráha

seg-c995dade5aa6 = Satellite Time and Location (STL) na { "1621" } MHz (střed { "1616" }–{ "1626" } MHz); EIRP z „{ "300" }násobku GPS“

seg-dd6322466888 = { "781" } km, { "86.4" }°, { "66" } v { "6" } rovinách

seg-ad0ba129439b = VEŘEJNÉ údaje o signálu (<a1>NAVIGATION { "72" }({ "1" })</a1>), REPREZENTATIVNÍ dráha a EIRP

seg-1931203a036c = maják Ku { "240" } MHz, pouze Doppler

seg-0533710bbbe1 = VEŘEJNÁ struktura signálu (<a1>PMC10301026</a1>), REPREZENTATIVNÍ dráha a EIRP

seg-cee286338f01 = BPSK { "2.046" } Mchip/s poblíž L1 a L5

seg-fe3cdce92b31 = { "1000" } km, { "55" }°

seg-03d5ae448705 = <c1/> (volitelné)

seg-800f173f2b20 = SEMINÁRNÍ parametry signálu, VEŘEJNÁ dráha

seg-e8626249e708 = sedm pásem konfigurace č. 1

seg-cb29553176c7 = { "510" } km heliosynchronní

seg-10f79909a5bc = <b>Předvolba Celeste IOD (demonstrace na oběžné dráze) je volitelná.</b> Její parametry signálu byly prezentovány na workshopu LEO-PNT programu Navigation Innovation and Support Programme (NAVISP) Evropské kosmické agentury (ESA) v roce { "2026" } a zatím pro ně neexistuje veřejný zdroj; jsou v modulu <c1/> v <c2/>, používaném souborem <c3/>. Jak se předvolba zadržuje: každé číslo enginu odvozené z workshopu je v jediném souboru <c4/>, který <c5/> zkompiluje, jen pokud existuje, a ve scénářích dostupných pouze v repozitáři <c6/>. Smazáním tohoto souboru a těchto scénářů se předvolba zadrží bez jakékoli úpravy zdrojového kódu; každý další test, orákulum i scénář běží i bez ní a počet souborů scénářů v README zadržené soubory stále započítává. Její EIRP a svazek jsou kalibrovány na stopu C/N0 ukázanou na workshopu, takže tento scénář stopu reprodukuje konstrukčně.

seg-9f9ff4fe18f8 = Model vysílaných efemerid ATOMIC s polynomem „nulových hodin“ je předvolba navigační zprávy a není součástí tohoto druhu.

seg-dc496b16046b = Pozorování LEO oproti GNSS

seg-6be559b1ac29 = <c1/> kvalitativně reprodukuje, co ukazují demonstrace LEO-PNT: C/N0 družice LEO stoupá a klesá v podobě zvonu, který zůstává nad maskou { "590" } s a vrcholí na { "56.8" } dB-Hz, tedy { "8.9" } dB nad mediánem plochých nosných GNSS na MEO (Galileo E1, { "40.5" } až { "52.0" } dB-Hz, medián { "47.8" } dB-Hz). Náskok pochází ze vzdálenosti, nikoli ze silnějšího vysílače: ve vrcholu přeletu je družice vzdálena { "569" } km, asi { "40" }krát blíže než družice Galileo v zenitu ({ "23 222" } km), což znamená o { "32" } dB menší ztrátu ve volném prostoru; obecná předvolba vyzařuje { "0" } dBW ({ "1" } W).

seg-08debab7c94a = Každý řádek je jeden běh <c1/> (engine { $version }):

seg-9a60f0bf803e = Nastavení

seg-fde146239f5d = Výsledek jednoho běhu

seg-41455a3f15b6 = <c1/> pásmo L, { "550" } km, přelet { "80" }° nad Mnichovem

seg-9d5c154eceb1 = vrchol L { "56.8" } dB-Hz, medián { "42.2" } dB-Hz; medián Galileo E1 { "47.8" } dB-Hz

seg-9423b1184fb0 = <c1/>, navržený přelet { "70" }° a čtyři družice na nakloněném shellu, námořní uživatel

seg-63bf0b8f7f3a = vrchol X1 { "65.6" } dB-Hz a X5 { "68.9" } dB-Hz na navrženém přeletu; největší Doppler X1 { "31.4" } kHz

seg-8a3383072765 = <c1/>, přelet { "65" }°, letecký uživatel

seg-d2fea8542638 = vrchol STL { "80.5" } dB-Hz, o { "34.3" } dB nad mediánem GPS L1; největší Doppler { "35.4" } kHz

seg-d837a8a7648b = <c1/>, uživatel uvnitř v Římě (tradiční budova)

seg-4fbead0588d2 = vrchol UHF { "34.1" }, L { "24.2" }, S { "16.5" }, C { "8.5" } dB-Hz; medián Galileo E1 { "22.4" } dB-Hz

seg-954e16842d59 = <c1/> UHF a L se sekcí <c2/>

seg-9aa81f6f4929 = horké určení polohy { "0.90" } s a { "18.0" } mJ na každý signál; studené určení polohy UHF { "19.0" } s ({ "381" } mJ), L { "47.0" } s ({ "939" } mJ), GPS L1 { "38.1" } s ({ "762" } mJ)

seg-97476f9d4212 = <c1/>, čtyři pásma, přelet { "70" }° nad Tromsø

seg-fd1463da9965 = viz <a1>Sondování ionosféry</a1>

seg-1ad5bde12b4f = { "16" } družic obecné vrstvy { "1080" } km, L a C, skok { "30" } m

seg-25cf36cf0de3 = viz <a1>Monitory spoofingu</a1>

seg-6cdf9830433e = <c1/> také zapíše interaktivní přehrávač (<c2/>, epochy přeletu) a soubory efemerid CZML (Cesium Language), KML (Keyhole Markup Language), GeoJSON a STK (Systems Tool Kit) s geometrií přeletu (<a1>ANIMATION.md</a1>, <a2>INTEROP.md</a2>).

seg-d3a0fc36329a = Sondování ionosféry

seg-1e64715af2ff = Každá dvojice pásem také udává šikmý TEC, který její kódová kombinace bez vlivu geometrie obnoví ve vrcholu přeletu, <c1/>, a 1-sigma tohoto odhadu z kódového šumu obou pásem ve vrcholu (<c2/>, <c3/>). Odhad se konstrukčně rovná šikmému TEC modelu: kombinace je v prvním řádu přesná. Sigma je to, co činí plán pásem lepším či horším sondou: <c4/> (čtyři pásma nad Tromsø) obnoví { "18.85" } jednotek TEC z každé dvojice, s 1-sigma { "0.017" } jednotek TEC pro UHF s L a { "2.9" } pro S s C. Pouze tepelný kódový šum; žádné vícecestné šíření ani mezifrekvenční zkreslení. MODELLED.

seg-8f59acefb2b3 = Monitory spoofingu (<c1/>)

seg-91941393400a = Volitelná sekce <c1/> padělá signály, které by přijímač viděl na deklarované poloze. Od <c2/> deklarovaná poloha skočí o <c3/> a poté se pohybuje vodorovně rychlostí <c4/> směrem <c5/>; padělaná vzdálenost a její rychlost změny jsou přesně ty deklarované polohy, na pásmech LEO uvedených v <c6/> (výchozí všechna) a na signálu GNSS na MEO, pokud není <c7/>. <c8/> určuje, zda padělané pseudovzdálenosti nesou ionosférické zpoždění (u pozemního vysílače ho nenesou).

seg-845f6840d92d = Přijímač provozuje dva monitory (<a1><c1/></a1>), každý při uvedené pravděpodobnosti falešného poplachu na epochu (<c2/>, výchozí { "1e-5" }), a detekci vyhlásí v první epoše, v níž pravděpodobnost detekce dosáhne <c3/> (výchozí { "0.999" }). Pravděpodobnosti detekce jsou přesné pro uvedený gaussovský šum a vyhodnocují se na střední reziduu bez šumu; žádný šum se nenáhodí.

seg-cc38b40eb7a5 = Monitor

seg-8b34ac584c3d = Statistika

seg-7b158594c4d9 = Co vidí

seg-89756d80bc29 = Konzistence Dopplera a geometrie přeletu

seg-2174c7725e48 = naměřené rychlosti změny vzdálenosti proti těm, které předpovídají dráhy a nezávislá apriorní poloha a rychlost (<c1/>, <c2/>); chí-kvadrát zobecněných nejmenších čtverců přes okno <c3/> (výchozí jeden krok), s driftem hodin jako rušivým parametrem (nebo se zadaným <c4/>); šum smyčky frekvenčního závěsu z C/N0 (Kaplan & Hegarty { "2006" }, § { "5.6.2" }), na kanálech GNSS, kanálech LEO a na všech kanálech

seg-14eab06a47d5 = chyba polohy <c1/> posune rychlost změny vzdálenosti o <c2/>, <c3/>: příčná rychlost družice LEO vůči její vzdálenosti je asi { "25" }krát větší než u družice MEO, takže stejná chyba je v Dopplerovi LEO asi { "25" }krát větší

seg-390ac49b3c09 = Konzistence mezi pásmy

seg-986d501c2b01 = skok od epochy k epoše kombinace pseudovzdáleností bez vlivu geometrie u každé dvojice pásem LEO, s odečteným ionosférickým modelem přijímače, proti kódovému šumu <c1/> a tolerované nemodelované rychlosti změny ionosféry (<c2/>)

seg-389187df55d7 = spoofer, který padělá některá pásma a jiná ne, nebo každé pásmo bez ionosféry, v okamžiku svého nástupu; nikoli spoofer, který padělá každé pásmo a simuluje ionosféru

seg-4dd44d7fa566 = <c1/>: skok { "30" } m na zaměřeném stanovišti ve Frankfurtu změní rychlosti změny vzdálenosti GNSS asi o { "4" } mm/s a rychlosti LEO asi o { "10" } cm/s (mediány gradientů { "1.4e-4" } a { "3.5e-3" } za sekundu). Test pouze s GNSS jej nikdy nedetekuje (největší necentralita { "0.06" }); test na všech kanálech jej detekuje { "105" } s po nástupu. <c2/> provozuje čtyři spoofery proti oběma monitorům.

seg-1b64098e01f3 = Omezení, uvedená v každém výsledku: spoofer je idealizovaný, sám se sebou konzistentní posun polohy, který kompenzuje vlastní dráhu (bez signatury výkonu, úhlu příchodu či korelačního vrcholu); apriorní údaj je nezávislý na spoofovaných určeních polohy; ionosférický model přijímače je model enginu, takže autentické reziduum mezi pásmy je ve střední hodnotě nulové. MODELLED (dva řádky v <a1>VERIFICATION-MATRIX.md</a1>).

seg-edb7b16b6c0e = Validace

seg-051b8cd1849d = Test

seg-609c537a9dfd = ITU-R P.838-3, tabulka { "5" }, { "115" } kmitočtů

seg-5bf24bec38f2 = každý koeficient do { "0.6" } své poslední vytištěné číslice (nejhorší pozorované { "0.51" })

seg-86204b023d44 = validační příklady ITU-R Study Group { "3" } (CG-3M3J-13-ValEx-Rev8.3.0), déšť podle P.618-14

seg-13180d4097d1 = { "56" } případů do { "1e-4" } dB (pozorováno { "5e-6" } dB)

seg-84161e5f97f8 = Stejné příklady, scintilace podle P.618-14

seg-0a4305c867ff = { "42" } případů do { "1e-5" } dB

seg-054f8dbe2792 = sešit ITU-R Study Group { "3" } Clutter and BEL, P.2109

seg-8ae2eeed4be4 = { "568" } hodnot do { "0.001" } dB

seg-6df2eded9f19 = poměr skupinového zpoždění podle IS-GPS-200 <c1/>

seg-d0b293230f91 = na { "1e-12" }; zesílení L1/L2 a L1/L5 { "2.978" } a { "2.588" }

seg-f9a0e24c00a7 = Friisův tvar kilometr–megahertz

seg-4e94a67f40f6 = na { "1e-4" } dB

seg-ee59b4c520eb = arXiv { "2509.19551" }, tabulka { "1" } (Pulsar in-orbit validation (IOV), full operational capability (FOC) polární, FOC nakloněná, GPS)

seg-345998ca457c = { "20" } rychlostí a maxim Dopplera do { "0.05" } %

seg-30e34076f4a7 = Orákula pro déšť a scintilaci přebírají výšku deště a vlhkou refraktivitu tak, jak je uvádějí validační příklady: engine nenese mapu ITU-R P.839 ani P.453.

seg-d2d1075a0b67 = EIRP a diagramy jsou zveřejněné přijímané výkony převedené na EIRP, nebo reprezentativní volby; nepoužívá se žádný naměřený diagram družice a žádné C/N0 družic LEO se neporovnává s měřením.

seg-915a9564608d = Plynový člen je nahrazená zjednodušená metoda P.676-10; pod { "1" } GHz je to hodnota pro { "1" } GHz škálovaná f² a déšť se tam bere jako nulový.

seg-cdd9faf5b61d = Podíl TEC pod družicí LEO pochází z jediné Chapmanovy vrstvy (bez plazmasféry) a lze jej přepsat uvedeným podílem.

seg-4b72218497e7 = Dráhy navrženého přeletu a Walker jsou dvoutělesové s volitelným sekulárním J2 (druhá zonální harmonická Země); cesta TLE používá SGP4. Vlastní zrychlení uživatele je z rychlosti změny Dopplera v uzavřeném tvaru vynecháno (numerická kontrola uvádí, co to u pohybujícího se uživatele stojí).

seg-9fc2cd6d38e9 = RINEX (Receiver Independent Exchange Format) { "4.02" } nemá žádné navigační záznamy LEO; jakýkoli export LEO ve stylu RINEX patří ke kódu navigační zprávy a je zdokumentovaným rozšířením Kshana (předchozí práce: arXiv { "2401.17767" }).

seg-593081243d8c = <s1>Předchozí</s1>Návrhy signálů LEO

seg-468e70f9a669 = <s1>Další</s1>Navigační zpráva LEO

seg-072d0d8f618c = Monitory spoofingu ([spoofer])
