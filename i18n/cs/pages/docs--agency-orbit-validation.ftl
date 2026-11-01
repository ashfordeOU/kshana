# docs--agency-orbit-validation: translations (cs)

seg-31d58f23c0a2 = Spustit

seg-fbe4b3eb7310 = Zdroj: <c1/>

seg-87910a33b87b = Validace silového modelu proložením efemerid — metodika a ověřená rezidua

seg-09a1b1b673fb = Plnosilový engine Kshana (<c1/>) proložený <b>skutečnými produkty přesných drah od agentur</b>, s otevřenými, citovatelnými rezidui označenými hashem commitu. Toto je záznam validace pro milník plánu P4 („Přesná astrodynamika: gravitace vysokého řádu, SRP (tlak slunečního záření), validace proti datovým sadám agentur“).

seg-90f366667f78 = Co zde znamená ověřené reziduum

seg-3861b68a03e2 = Rezidua se uvádějí, jen když platí všechno z následujícího (návrh <c1/>):

seg-954f4f934461 = <b>Silový model</b> zahrnuje každou poruchu, která na cílové přesnosti záleží: geopotenciál EGM2008 (Earth Gravitational Model { "2008" }) vysokého stupně (zkrácený na uvedený stupeň a řád, d/o), pevninské, oceánské a atmosférické <b>slapy</b> (<c1/>, IERS (International Earth Rotation and Reference Systems Service) Conventions { "2010" } kap. { "6" }), třetí tělesa Slunce a Měsíce, SRP modelu dělové koule s kuželovým stínem a odhadovaným <c2/>, odpor (pouze LEO (nízká oběžná dráha Země)), členy obecné relativity (GR) Schwarzschildův a Lense–Thirringův (<c3/>).

seg-710f89c088cc = <b>Estimátor</b> je skutečné dávkové Gauss–Newtonovo nejmenší čtverce s variační <b>maticí přechodu stavu</b> (zkontrolovanou proti konečné diferenci přes celý oblouk na < { "1e-6" }), váhováním pozorování <c1/> a editací odlehlých hodnot na n sigma.

seg-dd5dcc66ed22 = <b>Soustavy a čas</b> používají <b>skutečné parametry orientace Země (EOP) IERS finals2000A</b> (UT1 (Universal Time { "1" }, čas rotace Země)−UTC (koordinovaný světový čas), pohyb pólu; <c1/>) prostřednictvím validovaného řetězce IAU (International Astronomical Union) 2006/2000A CIO (Celestial Intermediate Origin) (<c2/>). Čas GPS (Global Positioning System) v SP3 (Standard Product { "3" }, formát přesných drah) → TT (pozemský čas) pevným posunem { "51.184" } s (<c3/>).

seg-665bb53b81fb = <b>Rezidua</b> se uvádějí v <b>RTN</b> (radiální/podél dráhy/napříč dráhou) a ve 3D, <b>s empirickými zrychleními i bez nich</b>, vedle surového překryvu (bez proložení).

seg-fea4515ba842 = Každé číslo je <b>reprodukovatelné</b> (brána CI (průběžná integrace) s otevřenými daty) a <b>citovatelné</b> (hash commitu + odkaz na datovou sadu + SHA-256 fixtury (SHA: Secure Hash Algorithm)).

seg-fa98a174e799 = Metoda podle datové sady

seg-a98b098e815a = Zpracujte přesnou dráhu SP3; pro zvolenou družici vezměte každé určení polohy v ITRF (International Terrestrial Reference Frame).

seg-a25f69a48b5a = Převeďte epochu GPS v SP3 → TT; z finals2000A pro tuto epochu určete <c1/>.

seg-e5338b713d88 = Otočte každé určení polohy z ITRF do GCRS (Geocentric Celestial Reference System) přes řetězec CIO s těmito EOP — to jsou inerciální pozorování polohy. Dynamika používá pro zemskou rotaci geopotenciálu <em>tytéž</em> EOP, takže pozorování a síly sdílejí jednu soustavu.

seg-ce987e4dda40 = Zaseďte stav v epoše (poloha = první určení; rychlost = konečná diference 2. řádu) a dávkově proložte <c1/> (úroveň { "1" }), poté navíc { "9" } empirických zrychlení RTN s jedním cyklem na oběh (CPR) (úroveň { "2" }, s omezením a priori).

seg-22f839d05292 = Uveďte RMS (střední kvadratická hodnota) RTN a 3D po proložení pro obě úrovně a surový překryv.

seg-64e2c3662a27 = Střední oběžná dráha Země Galileo — <b>GREEN</b> (práh < { "5" } m)

seg-e77e8e35ba80 = <b>Datová sada:</b> finální multi-GNSS (GNSS: globální družicový navigační systém) dráha ESA/ESOC (ESA: Evropská kosmická agentura; ESOC: Evropské středisko kosmických operací) <c1/>, ITRF, vzorkování po 5 min, družice <b>E11</b> (GSAT0101, Galileo In-Orbit Validation (IOV), nominální MEO (střední oběžná dráha Země)), 2022-01-01.

seg-f90d848e7a46 = <b>Otevřený zdroj (bez přihlášení):</b> zrcadlo ESA Navigation Office, <c1/>. EOP: IERS <c2/>.

seg-ec7195b80bad = Commit validace:

seg-c2ad9f9cc050 = <b>Fixtury (SHA-256):</b> SP3 <c1/>; EOP <c2/> (<c3/>).

seg-de3df1639939 = Oblouk

seg-7db37f753fc1 = RMS 3D

seg-d39e59df38c0 = RTN (R, T, N)

seg-5ad814c7ef9e = Poznámky

seg-bced8a114852 = Fixtura CI, úroveň { "1" } (síla + <c1/>)

seg-f040df9ee966 = { "8" } h

seg-459900054e0e = { "0.133" } m

seg-994f50a24ab7 = { "0.105" }, { "0.067" }, { "0.047" } m

seg-d15ea658058b = surový překryv { "78.7" } km

seg-1ce1bc363541 = Fixtura CI, úroveň { "2" } (+ empirické CPR)

seg-461105b5c2f3 = { "0.070" } m

seg-073166a26523 = { "0.048" }, { "0.044" }, { "0.027" } m

seg-224a7fc75354 = zmenší rezidua na polovinu

seg-1b422bc76914 = Dispečink celého oblouku, úroveň { "1" } (před opravou†)

seg-f57ee3b36d92 = { "24" } h

seg-5fee750a5e30 = { "0.611" } m

seg-b3a99e7a6724 = { "0.276" }, { "0.381" }, { "0.390" } m

seg-95879df86618 = Čísla z fixtur CI výše byla znovu zaznamenána ve verzi { "0.36" } po opravě slapů atmosféry S2 (<c1/>): úroveň { "1" } Galileo se posunula { "0.132" } → { "0.133" } m (C_R { "1.1744" } → { "1.1743" }), složky N Swarm-A o { "1" }–{ "2" } mm; hodnoty dispečinku celého oblouku znovu spuštěny nebyly. † <b>Před opravou:</b> hodnota dispečinku celého oblouku byla zaznamenána před opravou slapů atmosféry S2 ve verzi { "0.36" } a na opraveném kódu znovu spuštěna nebyla (celodenní produkty stahuje dispečerský workflow, nebyly dostupné v relaci, která opravu provedla). Na fixturách CI oprava posunula RMS 3D Galileo o méně než { "1" } mm a složky Swarm-A o { "1" }–{ "2" } mm, takže se očekává změna stejného řádu; další spuštění <c2/> ji znovu zaznamená.

seg-5141c1811e35 = Pole MEO je gravitačně konvergované do stupně { "8" } (výsledek úrovně 1 pro { "8" } h je na milimetr shodný při d/o { "8" }, { "10" } a { "12" }), takže zkrácení fixtury CI na d/o 12 je zanedbatelné; dispečerská úloha spouští plné d/o 70. Proložení { "8" } h dosáhne <b>{ "13" } cm</b> pouze silami a <b>{ "7" } cm</b> s empirickou úrovní; celý oblouk { "24" } h (více zátěže SRP a zákrytů, delší dynamický rozsah) má <b>{ "61" } cm</b> — vše hluboko pod prahem { "5" } m.

seg-45a95547dbcc = Swarm-A LEO — <b>GREEN</b> (práh < { "5" } m)

seg-cba2e4a9b9b1 = <b>Datová sada:</b> přesná vědecká dráha ESA Swarm úrovně 2 s redukovanou dynamikou <c1/> (<c2/>, odvozená z GPS, ITRF / IGb14, ~{ "2" } cm, zpracování Technické univerzity v Delftu), družice <b>Swarm-A</b> (id SP3 <c3/>, LEO ~{ "430" } km), 2022-01-01.

seg-f66ad1515550 = <b>Otevřený zdroj (bez přihlášení):</b> distribuční server ESA Swarm <c1/> → <c2/> (otevřený podle datové politiky ESA). EOP: tatáž řada IERS <c3/> 2022-001.

seg-4de8b64c0bf0 = <b>Fixtura (SHA-256):</b> SP3 <c1/> (<c2/>).

seg-b46c7e1d476d = Oblouk LEO přidává do silového modelu <b>atmosférický odpor</b>. Protože model hustoty je <em>statický</em> po částech exponenciální, dráha se prokládá ve dvou úrovních: <b>dynamické</b> úrovni (odhaduje se pouze stav v epoše; <c1/> držené na { "1" }, protože na LEO odpor dominuje a SRP je na krátkém oblouku špatně oddělitelné) a <b>úrovni s redukovanou dynamikou</b>, která přidává empirická zrychlení s jedním cyklem na oběh nesoucí nemodelovaný odpor — provozně smysluplná dráha LEO.

seg-dac35ad223dd = Fixtura CI, dynamická (<c1/>={ "1" })

seg-0652aa62d459 = { "3" } h

seg-cc0a14ba2b40 = { "2.687" } m

seg-3288b1f0615f = { "0.925" }, { "2.522" }, { "0.045" } m

seg-555712268929 = rezidua ≈ čistě podél dráhy (odpor)

seg-4f8e7956aa78 = Fixtura CI, s redukovanou dynamikou (+empirické)

seg-aa5f651bcfab = { "0.098" } m

seg-147b4eca7fcf = { "0.026" }, { "0.092" }, { "0.025" } m

seg-82a3e25da2bf = empirické členy pohlcují odpor

seg-ff834d33ae70 = Dynamické proložení splňuje práh { "5" } m s rezidui téměř zcela podél dráhy — učebnicový podpis odporu na ~{ "430" } km. Empirická úroveň tuto chybu podél dráhy pohlcuje ({ "2.52" } → { "0.09" } m) a dává proložení s redukovanou dynamikou na <b>~{ "10" } cm</b> proti vlastní dráze ESA s ~{ "2" } cm. Celodenní běh s plným stupněm je ignorovaný <c1/> (distribuční server poskytuje produkt přes relaci prohlížeče souborů, takže zakladatel stáhne SP3 daného dne a nasměruje na něj <c2/>). NRLMSISE-00 (NRLMSISE: model atmosféry Naval Research Laboratory Mass Spectrometer and Incoherent Scatter Radar Extended) s řídicími veličinami kosmického počasí je zmíněné vylepšení, které by <em>dynamickou</em> úroveň dále zpřesnilo.

seg-e8f5c385de62 = Lunární LRO — ověřeno, <b>nad</b> prahem { "5" } m (otevřeně) (P4 W4b)

seg-8a22ef5d3765 = <b>Datová sada:</b> skutečná rekonstruovaná trajektorie sondy <b>Lunar Reconnaissance Orbiter</b> (LRO; NAIF (Navigation and Ancillary Information Facility) −{ "85" }) od NASA/JPL (NASA: Národní úřad pro letectví a kosmonautiku; JPL: Jet Propulsion Laboratory) z JPL Horizons, geometrické stavové vektory se středem v Měsíci v ICRF (International Celestial Reference Frame), 2022-01-01, výška ~{ "98" } km, vzorkování po 1 minutě ({ "241" } epoch, { "4" } h, ~{ "2" } oběhy). Použití textových vektorů Horizons nevyžaduje <b>žádný čtecí modul SPK/SPICE (SPK: jádro planetárních efemerid; SPICE: Spacecraft, Planet, Instrument, C-matrix, Events)</b>.

seg-2bcf078de340 = <b>Gravitace:</b> pole <b>GRGM660PRIM</b> z GRAIL (Gravity Recovery and Interior Laboratory) (NASA Goddard Space Flight Center, stupeň { "660" }), zkrácené na d/o { "150" } a prokládané při d/o { "100" }, vyhodnocované v lunární <b>soustavě hlavních os</b> pevné k tělesu.

seg-1454f78e9ca4 = <b>Otevřený zdroj (bez přihlášení):</b> Horizons API (rozhraní pro programování aplikací) <c1/>; gravitace přes ICGEM (International Centre for Global Earth Models) <c2/>.

seg-306ffeb843a9 = <b>Fixtury (SHA-256):</b> LRO <c1/>; GRGM <c2/> (<c3/>).

seg-65ff0c37dd74 = Toto je dynamika <b>se středem v Měsíci</b> — odlišný silový model (<c1/>): pole GRGM v soustavě pevné k Měsíci (střední orientace Země podle IAU { "2015" } <c2/> složená s pevným posunem DE421 (Development Ephemeris { "421" }) střední Země → hlavní osy (ME→PA)), plus třetí tělesa Země (dominantní porucha lunární dráhy) a Slunce, prokládané přes <em>tentýž</em> obecný přesný Gauss–Newtonův estimátor, který používají zemské datové sady (rys <c3/>).

seg-68f1894a1fa5 = Fixtura CI, dynamická (pouze stav)

seg-0f055118d77a = { "4" } h

seg-c94fc5bf792b = { "12.05" } m

seg-addd9519ffe6 = { "2.91" }, { "10.11" }, { "5.88" } m

seg-af395226ca52 = surový překryv { "39.9" } m

seg-2923b4d58878 = Fixtura CI, s redukovanou dynamikou (+empirické { "1" }+2/oběh)

seg-19167d54b4ad = { "6.67" } m

seg-f23cb77888a5 = { "3.41" }, { "4.58" }, { "3.44" } m

seg-706a4d52f6c5 = empirické členy 1 a 2 na oběh pohlcují složku podél dráhy

seg-3f33d99fd643 = Oprava ve verzi { "0.36" }: až do verze { "0.36" } byl posun DE421 ME→PA aplikován v opačném směru (a se špatným pořadím Eulerových úhlů), což posouvalo analytickou soustavu PA asi o { "208" }″ mimo PA místo na ni. Nyní je přepsán tak, jak jej definuje SPICE (zkontrolováno proti <c1/> na { "2.6e-16" } rad, <c2/>; <c3/>). Hodnoty výše jsou po opravě; před ní to bylo { "53.8" } m surově, <b>{ "12.6" } m</b> dynamicky ({ "3.07" }, { "10.19" }, { "6.81" } m) a <b>{ "6.65" } m</b> s redukovanou dynamikou ({ "3.49" }, { "4.56" }, { "3.35" } m).

seg-925d1445fccb = Tato rezidua jsou <b>nad</b> prahem { "5" } m, který Galileo ({ "0.13" } m) a Swarm-A ({ "0.10" } m) splňují, a uvádějí se otevřeně.

seg-c414e14eaaea = Co skutečně určuje spodní mez — křížová validace na úrovni DE (a oprava)

seg-72b06bac7f6b = Předpokládali jsme, že limitujícím faktorem je věrnost <b>analytické lunární orientace a efemerid</b> (řada librací IAU, přesná na desítky obloukových sekund oproti numericky integrovanému <c1/> JPL DE (Development Ephemeris), a efemeridy Země/Slunce podle Montenbrucka a Gilla, ~{ "0.3" }° oproti jádru DE/SPICE). Aby se to otestovalo přímo, křížově validační crate <c2/> mimo pracovní prostor zamění <b>pouze</b> tyto dva vstupy za vstupy <b>na úrovni DE</b> — lunární orientaci hlavních os DE440 (Development Ephemeris { "440" }) (<c3/>) a efemeridy DE440 (<c4/>), čtené přes ANISE (Attitude, Navigation, Instrument, Spacecraft, Ephemeris — čtecí modul jader SPICE v čistém Rustu) — a znovu spustí <em>tentýž</em> estimátor (commit <c5/>, SHA-256 jader <c6/> / <c7/>):

seg-3a0e724a8a2b = Úroveň

seg-c1ce24cd6008 = analytické

seg-7d04fb530a3a = surový překryv

seg-d9ce88edb49e = { "53.8" } m

seg-55dc7c7d84f0 = { "41.5" } m

seg-7def7880e134 = dynamické

seg-83e37e5e9b3e = { "12.6" } m

seg-c421a0a20278 = { "12.0" } m

seg-f70309824f25 = s redukovanou dynamikou ({ "1" }+2/oběh)

seg-b8ada0c5fab3 = { "6.65" } m

seg-b6d3daff2f23 = <b>Poznámka ke { "0.36" }: většina zlepšení dynamické úrovně níže byla chyba posunu, nikoli vstupy na úrovni DE.</b> Po opravě posunu ME→PA dává analytický zásobník { "39.9" } m surově, { "12.05" } m dynamicky a { "6.67" } m s redukovanou dynamikou, proti { "41.5" }, { "12.0" } a { "6.67" } m na úrovni DE: analytická a DE proložení se nyní na každé úrovni shodují. Z toho vyplývající čtení { "0.30" } v tabulce níže je ponecháno tak, jak bylo napsáno.

seg-691df96321d8 = <b>Hypotéza je pravdivá jen zpola a hlavní tvrzení bylo třeba opravit.</b> Orientace a efemeridy na úrovni DE surový překryv <em>zlepšují</em> ({ "53.8" } → { "41.5" } m) i <b>dynamické</b> proložení ({ "12.6" } → { "12.0" } m) — chyba analytické orientace a efemerid je tedy skutečná a tyto úrovně omezuje. Rezidua <b>s redukovanou dynamikou</b> ale nechávají v podstatě <b>beze změny</b> ({ "6.65" } → { "6.67" } m): empirická úroveň { "1" }+2 na oběh chybu orientace a efemerid <em>už</em> pohlcovala, takže provozní spodní mez ~{ "6.6" } m určuje něco jiného — reziduum, které báze s cyklem na oběh nepohltí a soustavy na úrovni DE neodstraní. Nejkonzistentnější vysvětlení jsou <b>nemodelované negravitační síly působící na LRO</b> (tepelné vyzařování, odplyňování) na krátkém oblouku { "4" } h; stupeň pole je vyloučen (shodné při d/o { "100" } a { "150" }) a tolerance integrátoru je vyloučena (shodné při <c1/> { "1e-6" } vs { "1e-9" }). Konstruktivní důsledek: <b>štíhlý analytický lunární zásobník Kshana bez jader už odpovídá věrnosti na úrovni DE pro lunární dráhu s redukovanou dynamikou (provozní)</b> — výchozí čistě koeficientové nastavení tam nenechává nic ladem. Překročení { "5" } m by vyžadovalo modelovat negravitační síly LRO (modely kvádru s křídly a tepla specifické pro sondu a delší vícenásobné proložení oblouků), nikoli lepší soustavy.

seg-4211fbd25380 = Závazek otevřenosti

seg-f3b0a26ff5b3 = Práh „green“ < { "5" } m je splněn pro <b>Galileo MEO</b> ({ "0.13" } m dynamicky) a <b>Swarm-A LEO</b> ({ "2.69" } m dynamicky / { "0.10" } m s redukovanou dynamikou). <b>Lunární LRO se publikuje tak, jak je, na { "12.05" } m dynamicky / { "6.67" } m s redukovanou dynamikou (empirické { "1" }+2 na oběh) — nad prahem</b> ({ "0.36" }, po opravě posunu ME→PA; před ní { "12.6" } / { "6.65" } m). Křížová validace na úrovni DE (výše) tvrzení o limitujícím faktoru <b>otestovala a opravila</b>: spodní mez s redukovanou dynamikou <b>není</b> analytická orientace ani efemeridy (jádra DE440 ji nechávají na { "6.67" } m beze změny), takže se neuzavře lepšími soustavami, ale modelováním negravitační dynamiky LRO — otevřená, aktualizovaná cesta k úrovni metrů.

seg-559a269152ae = Pro LEO se úrovně <b>dynamická</b> (pouze stav, statická hustota) a <b>s redukovanou dynamikou</b> (s empirickými zrychleními) uvádějí vždy <b>zvlášť</b>, aby čtenář viděl, co empirické členy pohlcují; úroveň s redukovanou dynamikou je provozní dráha. Totéž oddělení platí pro empirické úrovně a úrovně pouze silové u MEO.

seg-d20c7ef90250 = Každé reziduum nese výše svůj hash commitu, odkaz na datovou sadu a kontrolní součet fixtury.

seg-733d96129fca = <b>Datové sady ověřené proti skutečné pravdě agentur: { "3" } ze { "3" }</b> (Galileo MEO, Swarm-A LEO, lunární LRO). <b>Splňující práh < { "5" } m: { "2" } ze { "3" }</b> (Galileo ✓, Swarm-A ✓; LRO na { "6.67" } m, otevřeně nad ním).

seg-d7c77076c9c6 = <s1>Předchozí</s1>Validace SGP4

seg-d661003da754 = <s1>Další</s1>Sluneční soustava a další tělesa

seg-36a3b8105d4b = Střední oběžná dráha Země Galileo — GREEN (práh < { "5" } m)

seg-b6f96cf0d55a = Swarm-A LEO — GREEN (práh < { "5" } m)

seg-9e739bda7f20 = Lunární LRO — ověřeno, nad prahem { "5" } m (otevřeně) (P4 W4b)
