# docs--lunar-reference-station: translations (cs)

seg-f37311ad7ef0 = Výstupy

seg-f63dd3d7aad4 = Zdroj

seg-9872e31ebd72 = Zdroje

seg-38afa54b0306 = Zdroj: <c1/>

seg-e8ee3794bac6 = <b>MODELLED.</b> Při uvedených předpokladech (konstelace, chyba jejího signálu v prostoru, přesnost zaměření stanice, latence korekcí a kvantizace spoje, každý je vstup označený veřejným zdrojem nebo jako ILUSTRATIVNÍ) model dává níže uvedené hodnoty. <b>Nejsou</b> tvrzením o výkonu žádného skutečného systému. { -brand } <b>nemá</b> vazbu na žádnou agenturu ani její schválení a netvrdí nic o TRL ani o letové historii. Pouze poradní charakter.

seg-22eb5bd00092 = Účel

seg-25678ae41147 = Veřejné materiály popisují lunární referenční stanici na jižním pólu, která sleduje lunární navigační službu, počítá místní diferenciální korekce, udržuje lunární časovou referenci na atomových hodinách a nese laserový retroreflektor a vysílač VLBI pro lunární referenční soustavu (třída veřejně popsaná u konceptu ESA NovaMoon; zdroje níže). { -brand } již každou část modeluje samostatně. Tato studie je skládá do jedné reprodukovatelné, otevřené analýzy toho, co by taková stanice mohla dělat při veřejných předpokladech, a předregistruje ji, aby ji bylo možné vyhodnotit proti zveřejněným výsledkům a nakonec i výsledkům z letů.

seg-6ac04119fc30 = nebo <c1/> z Pythonu, WebAssembly nebo <c2/> serveru MCP s <c3/>.

seg-671e68d341fd = Mapa pokrytí a přesnosti (<c1/>)

seg-f034e2642dab = Pro diferenciální referenční stanici na známém jihopolárním místě: v každém uživatelském bodě na kruhové mřížce od { "80" }° j. š. k pólu a v celé oblasti, napříč dnem epoch a pokusy Monte Carlo, percentily opravené a neopravené chyby polohy (3D, horizontální, vertikální), dostupnost s důvodem pro každou nedostupnou epochu, pokrytí vůči prahu stanovenému před během, ochranné úrovně podle DO-229E, poloměr pokrytí podle azimutového sektoru a rozpočet korekčního spoje na stanici a v nejhorším bodě. Žádná nová fyzika: prochází otestované funkce <c1/> a v jednom bodě, jedné epoše a jednom pokusu se na tento druh přesně redukuje.

seg-94058315dfe4 = Vstup

seg-7670cf4ceda3 = Výchozí hodnota

seg-98b42925ad5c = Konstelace (<c1/>, <c2/>, <c3/>, <c4/>, <c5/>) nebo <c6/>

seg-bfdd053b2611 = vestavěná sada třídy LCNS

seg-389db26524b4 = ILUSTRATIVNÍ ve přibaleném výchozím nastavení; příklad z veřejných zdrojů nastavuje čtyři družice a periodu { "24" } h z S2 a S4, přičemž sada elementů zůstává ILUSTRATIVNÍ (žádný zdroj ji neuvádí)

seg-91231bdcc599 = ILUSTRATIVNÍ

seg-6b9d48431e4b = Stanice (<c1/>, <c2/>, <c3/>)

seg-fcdb2f3ac330 = { "89" }° j. š., { "0" }°, { "0" } m

seg-f32dcb376b51 = { "0.30" } m

seg-93d78578585f = ILUSTRATIVNÍ (vestavěné přidělení realizace referenční soustavy, samo MODELLED)

seg-59286c0377ce = <c1/>, <c2/> nebo <c3/> s <c4/>

seg-fe90a6f490f9 = { "100" } m, { "30" } m (SISE na přímce pohledu { "65" } m)

seg-9a432ef35cac = ILUSTRATIVNÍ ve přibaleném výchozím nastavení; příklad z veřejných zdrojů nastavuje <c1/> = { "10" } / { "1.96" } m ze S4 s. 8

seg-970357ba3630 = { "0" } m, { "10" } s, { "8" } bitů

seg-311a924e2133 = Mřížka (<c1/>, <c2/>) nebo <c3/>

seg-49a2022b83c0 = { "80" }° j. š., { "1" }° ({ "346" } bodů)

seg-e945f5407b12 = studovaná oblast

seg-fed48a6c31be = Čas (<c1/>, <c2/>, <c3/>), <c4/>

seg-0fec404c8c7c = { "0" } s, jeden den, { "600" } s, { "200" }

seg-d35d88b0753b = { "20" } m u p95 ve přibaleném výchozím nastavení ({ "1" } m v příkladu z veřejných zdrojů)

seg-fa7858b14f89 = stanoveno před během; { "20" } m je ILUSTRATIVNÍ, dimenzováno podle ilustrativních chyb výchozího nastavení

seg-a6ee5e2a8b61 = { "10" } m

seg-329ad585cd9b = ILUSTRATIVNÍ: žádná veřejná hodnota neexistuje

seg-422a316b806b = { "5" } m, { "1e-4" }, { "42" }

seg-c530b459b0ef = Každé číselné pole nese jednotku a třídu původu v bloku <c1/> výsledku (kontroluje <c2/>). Blok oblasti: <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>; <c14/> na každý azimutový sektor o { "30" }°; <c15/> na každý bod; a <c16/>.

seg-4aa380258574 = Co kontroly mohou a nemohou říci

seg-112cb6bffc03 = <c1/>: redukce na <c2/>, nulová základna a meze zaměření, monotonie, důvody nedostupnosti, determinismus, ochrana rozsahu práce. Ty ukazují, že sweep je modelem, který tvrdí, že prochází.

seg-695ed4f23f3c = <c1/>: nezávislý přepočet aritmetiky v numpy na exportovaných případech, předregistrovaný před spuštěním. Polohy a percentily splnily své prahy; korekce stanice své prahy nesplnila kvůli zaokrouhlení v dvojité přesnosti (zaznamenáno s čísly v <c2/>).

seg-be6ecf79d22c = Ani jedno z toho model nekontroluje. Model chyb, dekorelace prvního řádu, modely zaměření, stárnutí a kvantizace i každý práh jsou vlastní tohoto projektu nebo ILUSTRATIVNÍ.

seg-d6f194e28401 = Terénní masky horizontu

seg-9ad9b163a3a0 = MODELLED. Volitelná sekce <c1/> (<c2/>) přiřadí stanici i každému uživatelskému bodu vlastní horizont závislý na azimutu, ve formátu tabulky obzorové čáry z { "0.36" } (řádky <c3/>, lineárně v azimutu s přechodem přes { "360" }°). Družice se na místě počítá, pokud překoná jak <c4/>, tak horizont v jejím azimutu; epocha, v níž horizont v bodě ponechá méně než čtyři družice, ačkoli ploché maskování dává čtyři, se hlásí jako <c5/> (<c6/> si zachovává svůj plochý význam). Dva zdroje, při zadání obou kombinované jako bodové maximum:

seg-4d55808bc002 = uvedený profil, <c1/> nebo <c2/> (uplatněný v každém uživatelském bodě), každý s povinným označením <c3/>;

seg-d6fda9939caa = horizont získaný postupným sledováním paprsku nad polárním DEM (<c1/>): hlavní kružnice lunární koule s přesným zakřivením, z uvedené výšky stožáru (výchozí { "2" } m), každých <c2/> (výchozí { "1" }°), až do <c3/> (výchozí { "150" } km) nebo okraje mřížky. Repozitář obsahuje výřez veřejně dostupného polárního produktu LRO LOLA <c4/>, převzorkovaný blokovými průměry { "5" } × { "5" } na { "1200" } m a sahající asi ±{ "420" } km od pólu (<c5/>: URL zdroje, SHA-256, licence, kroky výřezu a převzorkování);

seg-292c49f3739a = nebo místo <c1/> dlaždice DEM po šířce a délce (<c2/>) v textovém formátu <c3/> (záhlaví <c4/>, poté výšky v metrech nad střední koulí, po řádcích), sledovaná paprskem stejným způsobem, přičemž výchozí krok určuje rozteč šířek. Zpráva uvádí cestu dlaždice, její SHA-256 a rozsah (<c5/>). Dlaždice převzorkovaná z přiloženého výřezu dává stanici horizont samotného výřezu s odchylkou do { "0.22" }° (<c6/>). Žádná dlaždice není součástí repozitáře.

seg-34ed85bb9ac0 = Tytéž masky se uplatňují na mřížku <c1/> (<c2/>, <c3/> a <c4/>; bod mřížky mimo DEM si ponechává plochou masku a je započítán). Bez této sekce je každý dokument bajt po bajtu shodný s během bez ní.

seg-8d07f0227ab8 = Kontroly: sledování paprsku reprodukuje horizonty v uzavřeném tvaru (pokles pro holou kouli, kráter na planině ze středu i mimo střed, rastrovaný kužel proti analytickému kuželu); přiložený výřez je orientován jako zdroj (dna kráterů Shackleton a Haworth nízko, masiv Malapert vysoko); nezávislé sledování paprsku v numpy na výřezu, předregistrované (<c1/>), souhlasí na { "5.5e-10" } stupně na pěti místech, což kontroluje aritmetiku, nikoli terén. Žádný zveřejněný údaj o polárním horizontu ani osvětlení nebyl reprodukován, takže řádek zůstává MODELLED (řádek registru „Lunar terrain horizon masks from a stated profile or a polar DEM“).

seg-10a1d62ab5cc = <c1/> spouští přibalené vstupy na mřížce { "2" }° se { "100" } pokusy a horizontem z DEM v každém místě. Místo stanice ({ "89" }° j. š., { "0" }° v. d.) má nejvyšší horizont asi { "4.0" }°, pod maskou { "5" }°, takže na stanici terén neomezuje; v uživatelských bodech je plošně vážený průměr nejvyššího horizontu každého bodu { "9.7" }° a největší { "26.3" }°. Oproti stejným vstupům s plochou maskou stoupá opravená chyba 3D na p95 v oblasti z { "16.3" } m na { "18.6" } m a největší HPL z { "480" } m na { "62" } km. Dostupnost v oblasti stoupá z { "91.9" } % na { "93.0" } %: epocha je nedostupná, když bod používá družici, kterou stanice nevidí, a horizont, který tuto družici před bodem skrývá, může epochu učinit dostupnou.

seg-6d18d8a8dc78 = <b>Terén a maskování horizontu: řešeno ve verzi { "0.36" }, s omezeními.</b> Masky horizontu pro jednotlivá místa z uvedeného profilu nebo z přiloženého výřezu LOLA DEM jsou modelovány (výše). Zbývá toto: přiložený výřez má { "1200" } m na pixel, takže reliéf pod asi jeden kilometr je vyhlazen a blokové průměry snižují ostré vrcholy; paprsek, který výřez opustí (asi { "420" } km od pólu), tam končí; není zahrnuta difrakce, vícecestné šíření od terénu ani částečné zakrytí; polohy míst pro měření vzdálenosti zůstávají na střední kouli v uvedených výškách (DEM určuje pouze horizont); horizont není ověřen proti vnější hodnotě. Export míst pro jednotlivé družice v <c1/> je maskován jako bod mřížky: se sekcí <c2/> nese každý exportovaný řádek <c3/> a zpráva horizont místa (<c4/>); součty antény v paprsku stále počítají každý spoj, který překoná plochou masku.

seg-b58b3ff1ef20 = <b>Vícecestné šíření a hardware přijímače: řešeno ve verzi { "0.36" } jako volitelná funkce, s omezeními.</b> Sekce <c1/> (<c2/>) přidává vícecestné šíření <c3/> závislé na elevaci u uživatele i na stanici (funkční tvar z DO-229; na Měsíci je každá hodnota ILUSTRATIVNÍ), vícecestné šíření stanice volitelně jako Gaussův–Markovův proces prvního řádu přes epochy, šum kódu DLL typu early-minus-late z C/N0 a zkreslení mezi kanály pro každý kanál. Zbývá toto: variace fázového středu a skupinového zpoždění antény nejsou modelovány; žádné lunární měření hodnoty vícecestného šíření neupřesňuje; blok rozpočtu korekčního spoje nezahrnuje složky přijímače.

seg-677252c2d3e5 = Růst chyby efemerid během latence: řešeno ve verzi { "0.36" } jako volitelná funkce, s omezeními.

seg-3af08edab1cc = <c1/> přidává lineární růst chyby vysílané oběžné dráhy se stářím (rozsah 1-sigma <c2/>), nad rámec reprojekce zmrazené chyby; lineární růst je člen prvního řádu šířené chyby stavu (ověřeno na { "1" } % při { "600" } s proti vestavěnému šíření dvou těles). Zbývá toto: žádný veřejný zdroj neuvádí lunární míru růstu (ILUSTRATIVNÍ); žádná struktura ve směru dráhy a radiální; blok rozpočtu korekčního spoje používá zmrazený model. Dodatek K5 (<c3/>, předregistrovaný samostatně) spouští K5 při { "0.001" }, { "0.01" } a { "0.1" } m/s: ve všech případech selhává ({ "369.8" } m, { "2315" } m, { "22797" } m proti prahu { "1.5" } m), jak bylo uvedeno před během.

seg-5bba9be34cad = <b>Styl řešení (filtr, výšková vazba, tři družice): volitelná funkce ve verzi { "0.36" }, s omezeními.</b> Sekce <c1/> (<c2/>) přidává výškové pseudoměření, s ním minimum tří družic a okno vážených nejmenších čtverců pro statického uživatele přes epochy (sdílená poloha, hodiny pro každou epochu), které zastupuje filtr. Zbývá toto: chyby epoch považuje za nezávislé, takže se průměruje rychleji než chyby korelované v čase; je pouze pro statického uživatele; není zde dynamický filtr, fáze nosné ani řešení nejednoznačností; stopa případu (<c3/>) ukazuje aritmetiku jednoho snímku. Dodatek se zveřejněnými tvrzeními pro tento režim je <c4/> (předregistrovaný samostatně). S výškovou vazbou { "1" } m, třemi družicemi a oknem o 6 epochách (ILUSTRATIVNÍ nastavení) klesá opravená chyba 3D na p95 u R300 z { "280.6" } m na { "2.11" } m (horizontální { "0.90" } m, nehodnoceno); K1 až K5 stále selhávají a K6 uspěje, { "1" } z { "6" } jako v zaznamenaném běhu. Předpoklad nezávislosti v okně mu nahrává.

seg-4f8274f839a7 = Srovnání se zveřejněnými tvrzeními

seg-82391b00e1bc = MODELLED. Srovnání tohoto modelu, spuštěného při veřejných předpokladech, s tvrzeními uvedenými ve zdrojích. Není to tvrzení o výkonu žádného skutečného systému.

seg-fc27b4012f02 = Zdroje S1 až S5 (název, URL, datum stažení, SHA-256, licence): <c1/>.

seg-d866653008e1 = Každé číselné tvrzení, citované s uvedením stránky a stanovených předpokladů a zařazené jako srovnatelné, částečně srovnatelné nebo nesrovnatelné: <c1/>. Žádné tvrzení není plně srovnatelné, protože žádný zdroj neuvádí percentil ani orbitální elementy družic.

seg-50535c58d3cf = Prahy, případy a vstupy, zapsané samostatně před během (revize { "2" }, 05bf9a19), a zaznamenaný běh: <c1/>. Zjištění je připnuto v <c2/>.

seg-069a652c402e = práh

seg-d6120708c062 = tvrzení (zdroje)

seg-5b480535b54b = tento model

seg-6231a005ccc9 = verdikt

seg-45dc6ff5d546 = jedna stanice dává přesnost pod metr v celém jihopolárním kruhu o poloměru { "300" } km (S1, S2, S3)

seg-4da98cf6180b = pokrytí { "0.00" }

seg-70a79ec95bf4 = nesplněno

seg-cd0e9021aaa3 = totéž, kruh o poloměru { "600" } km (S2 s. 10, S3 s. 23)

seg-ef9f2ee31c52 = pod metr s kódovými korekcemi (S1, S2)

seg-9f4e2b6991e8 = opravená 3D na p95 { "280.6" } m

seg-ac3c99ec0d15 = <= { "1.5" } m

seg-1b720f1677cc = „decimetrová úroveň“ z korekcí pseudovzdálenosti (S3 s. 22, S5 s. 5)

seg-ffa1c831a14f = { "280.6" } m

seg-70368d910820 = <= { "0.15" } m

seg-786f940b345e = nesplněno (při kódovém šumu zdrojů { "0.30" } m nemohlo být splněno)

seg-da761dde1cae = pod metr zachován při latenci { "600" } s (S2 s. 16)

seg-2a9db96bd87f = { "293.0" } m

seg-021336eb5623 = stejná přesnost od základny { "10" } km do { "500" } km (S2 s. 17)

seg-62190343777c = poměr { "1.39" }

seg-7a33a168b020 = splněno

seg-e666f1eb7a59 = Splněn je { "1" } z { "6" } prahů. Příčinou je geometrie. Žádný zdroj nezveřejňuje orbitální elementy konstelace. Na ILUSTRATIVNÍCH vestavěných elementech sdílejí uživatel a stanice čtyři družice nad { "5" } stupni jen v { "8" } % ({ "300" } km) a { "6" } % ({ "600" } km) epoch, při téměř singulární geometrii: neopravené p95 je { "3.8" } km, kde zdroje uvádějí < { "10" } m. Vlastní simulace zdrojů používaly filtr, výškovou vazbu a tři družice v částečném společném výhledu, což tento model snímku nemá. Běh proto tvrzení na těchto elementech nereprodukuje a není důkazem, že tvrzení jsou chybná. Splnění K6 je poměr dvou hodnot ovládaných geometrií a o dekorelaci nic nevypovídá. Zveřejněná sada elementů konstelace by byla hodnocena podle týchž prahů jako druhý, datovaný běh.

seg-1da5fcf7bbf5 = Předregistrovaná předpověď

seg-4ea806a57380 = Předregistrovaná předpověď, zmrazená u commitu <c1/> na vstupech z veřejných zdrojů, s protokolem hodnocení: <a1><c2/></a1>. Je to předpověď, nikoli validace, a každá hodnota v ní je ovládána nezveřejněnou sadou elementů čtyřdružicové konstelace (použité elementy jsou ILUSTRATIVNÍ): v oblasti od { "80" } stupňů j. š. dostupnost { "8.2" } %, opravená 3D na p95 { "280" } m, neopravená { "3.8" } km. MODELLED; <c3/> selže, pokud se pohne kterýkoli zmrazený bajt.

seg-e6aef34d5023 = Časová laboratoř stanice

seg-4ef12bffa7c4 = Zda miniRAFS stanice, řízené k LTC a poté volně běžící nebo znovu řízené, zůstane v mezích { "1" }, { "10" } a { "100" } ns: volitelný blok <c1/> z <c2/> (<c3/>). MiniRAFS dosáhne { "1" } ns po { "2.8" } s, { "10" } ns po { "377" } s a { "100" } ns po { "10.5" } h; cíl na úrovni nanosekund uváděný zdrojem je citován, nikoli převzat. MODELLED. Model, výstupy, tabulka času do dosažení prahu pro čtyři třídy hodin a srovnání se zdroji: <a1><c4/></a1>.

seg-69ddf7ea8fcb = Geodézie stanice

seg-717a5c91387b = O kolik jeden retroreflektor a jeden maják VLBI na místě stanice zpřesní lunární referenční datum nad rámec pěti archivovaných polí retroreflektorů: volitelné vstupy <c1/> a <c2/> z <c3/> (<c4/> a <c5/>). Cramér–Raovy meze pro zmenšenou sadu parametrů na ILUSTRATIVNÍM harmonogramu a místě: 1-sigma normy posunu klesá z { "0.0185" } m na { "0.0102" } m (poměr { "0.551" }), měřítko z { "0.00178" } na { "0.00063" } ppm. MODELLED. Metoda, výhrady (jihopolární místo vidí Zemi nízko nebo vůbec) a úplná Helmertova tabulka: <a1><c6/></a1>.

seg-8a873848459b = Každý zdroj s názvem, identifikátorem a vydavatelem, s datem stažení a licencí. URL, hashe SHA-256 a poznámky o tom, kde se zdroje rozcházejí, jsou v rejstříku <a1><c1/></a1>. Žádný zdrojový soubor se nešíří dál. Osobní jména jsou záměrně vynechána.

seg-b1f1e1efa042 = id

seg-02071a726f21 = název

seg-0634af374469 = identifikátor

seg-fd875b5fb817 = vydavatel

seg-a6f8ef268fcc = staženo

seg-d04709ddc97d = licence

seg-1d4174e911c1 = bílá kniha o lunární referenční stanici pro určování polohy, časování a vědu, verze { "3" }

seg-e09e1cc11921 = arXiv (bílá kniha autorů)

seg-c91720d34bd3 = nevýhradní licence arXiv k distribuci { "1.0" } (uděluje práva pouze arXiv)

seg-df12c861db1e = „Lunar local Differential PNT and Selenodetic Reference Station“ ({ "27" } snímků)

seg-03f689a0ba49 = ioag.org/meetings/cislunar, oddíl { "6" }, položka { "07" }

seg-406990fe43a8 = ICG-IOAG Workshop on Cislunar PNT, únor { "2025" }; snímky Evropské kosmické agentury

seg-58579c3faf2f = neuvedeno; od snímku { "3" } označeno jako uvolnitelné veřejnosti

seg-57df0ef791e6 = „Moonlight: LCNS, and Lunar Pathfinder“ ({ "28" } snímků)

seg-7e18a15e0d16 = unoosa.org, <c1/>

seg-23aee49b1347 = UNOOSA, ICG Joint Working Group Session on Lunar PNT, červen { "2024" }; snímky Evropské kosmické agentury

seg-f4e53e44f0b5 = neuvedeno; označeno jako uvolnitelné veřejnosti

seg-b22a694c481d = „Moonlight Programme Development Status“ ({ "16" } snímků)

seg-3fd0ab93507d = 2nd ICG-IOAG Cislunar PNT Workshop, únor { "2026" }; snímky Evropské kosmické agentury a Telespazio

seg-472771298df7 = „Lunar Reference Time: ESA's Views“ ({ "9" } snímků)

seg-6229db9cb23d = Workshop on Cislunar PNT, únor { "2026" }; snímky Evropské kosmické agentury

seg-6b626a2abd0f = LunaNet Signal-In-Space Recommended Standard, Augmented Forward Signal (LSIS) V1.0, a vestavěné <c1/>

seg-4e07c500e353 = jak je zaznamenáno u <c1/>

seg-28f8d886c4e5 = již ve stromu zdrojů

seg-2006c194fef6 = jak je tam zaznamenáno

seg-68db6a17b4e7 = <s1>Předchozí</s1>Sluneční soustava a další tělesa

seg-79d53edd2374 = <s1>Další</s1>Navigace uživatelů ve vesmíru (gnss-ssv)

seg-9c59637f0666 = Mapa pokrytí a přesnosti (lunar-station-coverage)
