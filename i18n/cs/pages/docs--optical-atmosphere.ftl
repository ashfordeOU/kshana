# docs--optical-atmosphere: translations (cs)

seg-6cb7a787ac67 = Reference

seg-1c6199627b90 = Data

seg-ad856ad710eb = Stav

seg-53a7343c076e = Tvrzení

# c1: docs/OPTICAL-ATMOSPHERE.md
seg-508588352e96 = Zdroj: <c1/>

seg-333a1114746a = Optické PNT atmosférou

# c1: optical-atmosphere
seg-47118f54f060 = Druh scénáře <c1/> odpovídá na to, jak často optický spoj k zemi funguje, proč selhává, jaká rezerva nebo technika by pomohla a co dělají hodiny, zatímco spoj nefunguje.

seg-06db0ea8f428 = Kshana je pouze analytická strana. Nespouští experiment s optickou pozemní stanicí a nejmenuje žádného partnera pro měření. Tento druh je <b>MODELLED</b>: jeho numerika je ověřena proti nezávislému programu, ale nebyl porovnán žádný naměřený záznam dostupnosti a každý vstup o počasí, technice a hodinách je předpoklad. Jde o poradní analýzu, nikoli o certifikovaný produkt dostupnosti, integrity ani navigace.

seg-83c16fd89005 = Oba přibalené scénáře nesou ILLUSTRATIVE klimata oblačnosti. Jsou to vstupy, nikoli měření a nikoli hodnoty jakékoli datové sady.

seg-e9dbbd9cfa32 = Jedna realizace rezervy spoje na stanovišti „northern" se seedem po dobu { "336" } h, ze skutečného běhu enginu v{ $version } na scénáři scenarios/optical-atmosphere-network.toml (seed { "37" }, krok { "600" } s). Rezerva klesá pod nulu během epizod oblačnosti; v tomto tahu je spoj dostupný { "40.5" } % času, s { "27" } výpadky a nejdelším výpadkem { "30.7" } h. Vstupy jsou ilustrativní, řada je jeden tah z modelu a nikoli klima a od statistické dostupnosti ({ "37.8" } %) se liší o výběrovou chybu tohoto tahu. Pouze poradní analýza: nejde o certifikovaný produkt dostupnosti, integrity ani navigace a nejde o předpověď pro žádné skutečné stanoviště, pokud vstupy o jeho klimatu nepocházejí z uvedené datové sady.

seg-13a52dfbd8d1 = Co se počítá

# c1: atmospheric_loss_db
# c2: optical_linkbudget
seg-46fbaf0c6a12 = <b>Útlum za jasného vzduchu</b> při dané vlnové délce a elevaci: aerosolová extinkce podle zákona viditelnosti Kima, McArthura a Korevaara, exponenciální ve výšce, plus Rayleighův rozptyl a uvedený vstup pro absorpci plyny. Toto nahrazuje jediný souhrnný <c1/> z <c2/>, když je atmosféra zadána. Bez ní je rozpočet spoje bitově shodný s { "0.36" } (předregistrovaný práh A5).

# c1: Cn²
seg-929c80326b41 = <b>Turbulence.</b> Profil <c1/> podle Hufnagela–Valleyho (výchozí HV 5/7) integrovaný podél šikmé dráhy dává rovinnou nebo kulovou Rytovovu varianci, pro uplink nebo downlink. Z ní plynou Andrewsův–Phillipsův index scintilace, parametry gamma-gamma, činitel průměrování apertury při slabé turbulenci (Churnside) a pravděpodobnost úniku a rezerva úniku podle gamma-gamma. Průměrování apertury se uplatňuje párováním momentů: index scintilace se škáluje činitelem průměrování a obě logaritmické variance se přeškálují tak, aby jej dávaly přesně.

# c1: τ = 3L/(2 ρ_w r_e)
seg-3fb7be7ef95d = <b>Oblačnost.</b> Klima oblačnosti stanoviště má tvar podle ITU-R P.840: pravděpodobnost oblačnosti a při oblačnosti lognormální sloupec kapalné vody. P.840 poskytuje množství oblačnosti. Útlum je optická hloubka z geometrické optiky <c1/>, protože vlastní zákon útlumu P.840 je mikrovlnný zákon a při { "0.85" } až { "1.55" } µm, kde jsou kapky mnohem větší než vlnová délka, neplatí.

# c1: null
seg-18311430b2a3 = <b>Dostupnost</b> stanoviště: spoj funguje, dokud úniky způsobené oblačností a turbulencí dohromady zůstávají v rezervě, která zbyde po útlumu za jasného vzduchu. Oblačnost a turbulence se berou jako nezávislé. Zpráva uvádí dostupnost, dostupnost za jasné oblohy, <b>strop</b>, který žádná rezerva nezvedne (optický spoj neprojde hustou oblačností), a dodatečnou rezervu potřebnou pro každou cílovou dostupnost, nebo <c1/>, je-li cíl nad stropem.

seg-885e06050a9a = <b>Výpadky.</b> Doby trvání jsou lognormální s uvedenou střední hodnotou a rozptylem. Zpráva uvádí výpadky za rok, dobu trvání u mediánu, 90. a 99. percentilu a pravděpodobnost a podíl doby výpadků přesahujících { "1" }, { "6" }, { "24" } a { "72" } hodin.

# c1: N
# c2: 1 − Π(1−a_i)
# c3: exp(−d/d₀)
# c4: d₀ → 0
seg-4b9b6fefad6b = <b>Diverzita stanovišť.</b> Nejlepších <c1/> stanovišť zkombinovaných při nezávislém počasí (<c2/>) a při počasí korelovaném podle vzdálenosti: korelace dvojic <c3/>, kombinovaná v jednofaktorové gaussovské kopule. Při <c4/> jde o nezávislé sjednocení a při plné korelaci o nejlepší jediné stanoviště.

# c1: [[technique]]
seg-b85681b9fd93 = <b>Techniky.</b> Každá <c1/> je varianta „co kdyby": nová vlnová délka (znovu se vyhodnotí rozpočet za jasné oblohy, útlum za jasného vzduchu a průměrování apertury), nová přijímací apertura, uvedené zlomkové snížení scintilace (adaptivní optika) a dodatečná rezerva. Výsledkem je zisk dostupnosti oproti základu na stejném stanovišti. Kshana smyčku adaptivní optiky nemodeluje, takže zisky jsou vstupy.

# c1: [clock]
# c2: A + U·E[min(D, T_h)]/E[D]
# c3: holdover.rs
seg-a59d07280524 = <b>Časování a měření vzdálenosti přes výpadek.</b> Doba trvání každého výpadku se převede přes uzavřený tvar variance setrvání modelu holdoveru hodin pro hodiny uvedené v <c1/>. Zpráva uvádí chybu časování a měření vzdálenosti při uvedených dobách výpadku, holdover do prahu časování, podíl výpadků v něm a dostupnost časování <c2/>. Dolní meze mocninných zákonů tříd jsou ty, které syntetizuje modul holdoveru, takže přísný práh určuje tato předpokládaná mez, jak uvádí <c3/>.

seg-59774a9e8685 = Rezerva spoje v čase ({ "0.38" })

# c1: [timeseries]
# c2: duration_h
# c3: step_s
# c4: seed
# c5: p_cloud
seg-fcfdd2e9e0ad = Tabulka <c1/> (<c2/> až { "8760" }, <c3/>, <c4/>) přidá ke každému stanovišti jednu <b>realizaci se seedem</b> výše uvedeného modelu: přímá viditelnost se střídá mezi jasnými úseky (exponenciální, střední hodnota nastavená tak, aby podíl času v oblačnosti byl uvedený <c5/>) a výpadky z oblačnosti (lognormální, uvedená střední hodnota a rozptyl); každý výpadek vylosuje jeden sloupec kapalné vody z uvedeného klimatu a drží jej; každý krok vylosuje jeden vzorek scintilace gamma-gamma (nezávislý krok od kroku, uvedené zjednodušení) a terminál je zamířen na cíl s uvedenou dostupností zaměřování. Rezerva kroku je rozpočet úniku minus úniky z oblačnosti a scintilace a spoj funguje, když rezerva není záporná a terminál je zamířen na cíl, což je podmínka, kterou používá integrál dostupnosti.

# c1: margin_db
# c2: cloud_db
# c3: scint_db
# c4: up
# c5: realised
# c6: tests/optical_atmosphere_timeseries.rs
# c7: xval/optical-atmosphere/PREREGISTRATION-timeseries.md
seg-ad2c4ff087a8 = Je to tah, nikoli klima: jeho dostupnost se od statistické liší o výběrovou chybu tahu a první epizoda se losuje celá. Výsledek nese na krok <c1/>, <c2/>, <c3/> a <c4/> a blok <c5/> (dostupnost, podíl oblačnosti, počet výpadků, nejdelší výpadek). <b>MODELLED</b>; kontroly (<c6/>, prahy stanovené v <c7/> před prvním během) jsou determinismus a konzistence s uvedenými údaji, nikoli externí orákulum. Bez tabulky se nic nezapisuje a výsledkem je dokument { "0.37" }.

seg-4a9b065bdb28 = Pole scénáře

# c1: kind = "optical-atmosphere"
# c2: wavelength_nm
# c3: elevation_deg
# c4: availability_targets_pct
# c5: [link]
# c6: [atmosphere]
# c7: [network]
# c8: [clock]
# c9: [[site]]
# c10: [[technique]]
seg-4ba70196355d = Všechna pole nejvyšší úrovně jsou volitelná. Samotné <c1/> spustí tři ilustrativní stanoviště. Všechny klíče viz ve dvou přibalených souborech: <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>.

seg-b7619573e112 = Stav ověření

seg-6598ced4218b = Rytovova variance, index scintilace, pravděpodobnost úniku gamma-gamma, činitel průměrování apertury, optická hloubka oblačnosti a jasného vzduchu se počítají tak, jak říkají uvedené vzorce

seg-2442f7529fbb = řádek MODELLED; numerika zkontrolována nezávislým programem v mpmath

# c1: xval/optical-atmosphere/RESULTS.md
seg-19854ea8437a = prahy A1 až A3, všechny splněny (<c1/>)

seg-b91d83aea0e8 = Rozpočet spoje a stávající dostupnost beze změny bez atmosféry

seg-2192262e26c1 = splněno

seg-a71527a271df = práh A5, bitově shodné přes { "1,000" } sad parametrů

seg-0db8cf4c2ee0 = Meze diverzity a monotónnost; vazba na holdover bitově přesná

seg-2a5c5967540c = splněno (identity)

seg-4b0e5e3ac558 = prahy A4, A6

seg-f842c688e29a = Dostupnost skutečného stanoviště, skutečná scintilace, skutečné statistiky oblačnosti

seg-9a0ead7b1670 = netvrdí se

seg-9cc220190772 = nebylo porovnáno žádné externí orákulum

seg-7c5050135e2b = Orákulum kontroluje implementaci uvedených vzorců, nikoli atmosféru, takže žádný řádek není VALIDATED. Ověřovací hodnoty ITU-R se nepoužívají a jsou drženy mimo repozitář.

# c1: optical_availability
seg-73dcf0f31fe9 = Není přibalena žádná datová sada o počasí. Vstupy o klimatu oblačnosti pro skutečné stanoviště by pocházely z veřejné datové sady (Copernicus ERA5, NASA MODIS nebo ISCCP); licenci každé datové sady je třeba před použitím přečíst a zaznamenat a surová data stahovat v době testu s připnutým SHA-256. Jedinou klimatologií, která už v repozitáři je, je tabulka jasných nocí podle Cavazzaniho a kol., kterou používá <c1/>.

seg-44d197f3209c = Andrews a Phillips, <em>Laser Beam Propagation through Random Media</em>, 2. vyd. (Rytovova variance, index scintilace, parametry gamma-gamma).

seg-9e9a33d44013 = Kim, McArthur a Korevaar, <em>Comparison of laser beam propagation at { "785" } nm and { "1550" } nm in fog and haze for optical wireless communications</em>, Proc. SPIE { "4214" } ({ "2001" }) (zákon viditelnosti).

seg-f485b4e9ece4 = Churnside, <em>Aperture averaging of optical scintillations in the turbulent atmosphere</em>, Appl. Opt. { "30" } ({ "1991" }) (činitel průměrování apertury).

seg-309c70f2f4f8 = ITU-R P.840 (statistiky kapalné vody v oblacích), P.1814 a P.1817 (metody pro optiku ve volném prostoru).

seg-83b30e1ca261 = <s1>Předchozí</s1>Balíčky důkazů

seg-1474b58fb35a = <s1>Další</s1>Časování slotů
