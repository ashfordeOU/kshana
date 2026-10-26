# docs--interop: translations (cs)

seg-f917e7fcac09 = Co to je

seg-cae10fb9bff8 = Scénář

seg-f2ce7fc60cdf = Formát

seg-8c718f7f9f5d = SigMF

seg-b03d56f501c3 = Druh

seg-357c2320b43a = ano

seg-c8c964a11462 = Zdroj: <c1/>

seg-881ec6f8fbe0 = Běh zapisuje dokument s výsledkem, graf a zprávu. <c1/> zapisuje navíc geometrii scénáře nebo jeho syntetizovaný signál ve formátech, které už jiné nástroje čtou: prohlížeč zeměkoule, desktopová mapa, geografický informační systém (GIS), balík pro analýzu misí nebo nástroj softwarově definovaného rádia (SDR). Nic z toho nečte hodiny ani síť a žádný export nenese časové razítko vytvoření, takže stejný scénář dává při každém běhu bajt po bajtu shodné soubory.

seg-736f2dc67a3c = Soubory se zapisují vedle scénáře a jmenují se jako dokument s výsledkem: <c1/>, <c2/>, <c3/>, jeden <c4/> na každý pohybující se objekt (nebo <c5/>, když je jen jeden) a dvojice <c6/> / <c7/>. S <c8/> nesou místo toho název studie, jako ostatní výstupy.

seg-21d3fba059d5 = Výslovně uvedený formát, který se na scénář nevztahuje, je chyba, která vypíše důvod; pod <c1/> se důvod vypíše a formát se přeskočí. Vstupními body knihovny jsou <c2/>, <c3/> a <c4/>; přijímají text scénáře a vracejí bajty, bez doteku souborů, takže běží i v sestavení pro WebAssembly. Server Model Context Protocol (MCP) poskytuje tytéž tři jako nástroje <c5/>, <c6/> a <c7/> (viz <c8/>).

seg-77200201db88 = Kód: <c1/> (<c2/> sestaví jeden geometrický popis scénáře, <c3/>, <c4/>, <c5/> a <c6/> jej zapisují), <c7/> a <c8/> pro signál. Testy: <c9/>.

seg-f13ab6bb2e47 = Formáty

seg-fc52229b569c = Dodržená specifikace

seg-3f237c8956eb = Cesium Language: pole JSON (JavaScript Object Notation) paketů s časovými značkami, čtené CesiumJS

seg-234fa6710fb9 = Keyhole Markup Language { "2.2" }, standard Open Geospatial Consortium (OGC), čtený Google Earth a většinou nástrojů GIS; stopy s časovými značkami používají rozšíření Google <c1/>

seg-ef08da440ce5 = <a1>https://www.ogc.org/standards/kml/</a1> (jmenný prostor schématu <c1/>; jmenný prostor rozšíření <c2/>)

seg-4cfac7667dbc = geografický JSON, Internet Engineering Task Force (IETF) Request for Comments (RFC) { "7946" }

seg-de0feb450ae1 = STK <c1/>

seg-96173e7b4238 = soubor efemerid Ansys Systems Tool Kit (STK), forma čas–poloha–rychlost <c1/>

seg-a2284e8c0034 = Signal Metadata Format: soubor metadat JSON a surový soubor komplexních vzorků v fázi a kvadratuře (IQ)

seg-b38ee3ebd012 = Co který soubor obsahuje

seg-7d873bc11593 = Každý geoprostorový formát se zapisuje ze stejné scény, takže se nemohou lišit v tom, kde co je. Scéna má až čtyři druhy objektů:

seg-1fc686f6a7ea = <b>Pohybující se objekty</b> — družice a uživatelská platforma, když se pohybuje — vzorkované na vlastní časové mřížce scénáře propagátory, které používá běh daného druhu.

seg-3db28cb6adc5 = <b>Pevná stanoviště</b> — přijímač, pozemní stanice, rušička nebo počátek místní navigační soustavy.

seg-0def04909935 = <b>Netimované stopy</b> — body trasy, kterou letí druh pro alternativní určování polohy, navigace a času (PNT) založený na terénu, gravitaci nebo jejich kombinaci. Tyto druhy nemají časovou osu, takže stopy žádnou nenesou.

seg-e14d49ae7330 = <b>Stopy rušičky</b> — pro druh <c1/> dvě kružnice kolem rušičky: pozemní dosah, uvnitř něhož družice v zenitu (nejsilnější) klesne pod práh sledování, takže jsou ztraceny všechny družice, a dosah, uvnitř něhož to platí pro družici na elevační masce (nejslabší), takže sledování začíná selhávat. Obě vycházejí z vlastních rovnic spoje daného druhu (Kaplan a Hegarty, <em>Understanding GPS/GNSS</em> (Global Positioning System / Global Navigation Satellite Systems), 3. vyd., §{ "9.4" }) s rušičkou na horizontu přijímače a ztrátou ve volném prostoru a testovací sada kontroluje, že efektivní poměr nosné a hustoty šumu na každém poloměru se rovná prahu s přesností { "1e-6" } dB. Kružnice je kreslena na kouli o středním poloměru Země.

seg-e1dd97c47993 = První paket je dokumentový paket (<c1/>, <c2/>) s hodinami zahrnujícími časovou mřížku. Každý pohybující se objekt je paket, jehož <c3/> má <c4/> ve formátu ISO { "8601" } (formát data a času Mezinárodní organizace pro normalizaci) UTC (koordinovaný světový čas), <c5/> <c6/> a vzorky <c7/> <c8/>: sekundy po epoše, metry v Geocentric Celestial Reference System (GCRS). CesiumJS bere <c9/> jako International Celestial Reference Frame (ICRF), jehož osy GCRS sdílí. Pevná stanoviště a středy stop jsou konstantní polohy <c10/> vztažené k Zemi s <c11/> <c12/>. Stopa rušičky je <c13/> s oběma poloosami rovnými jejímu poloměru; netimovaná stopa je <c14/> přichycená k zemi. <c15/> každého paketu uvádí soustavu ještě jednou slovy.

seg-be6362f4c7e7 = Jeden <c1/> s jednou <c2/> na třídu objektů. Pohybující se objekt je <c3/> obsahující <c4/>: jedno <c5/> na vzorek (ISO { "8601" } UTC), pak jedno <c6/> na vzorek (délka, šířka, výška). Stanoviště jsou <c7/>y, stopy rušičky <c8/>y s uzavřeným prstencem proti směru hodinových ručiček, netimované stopy <c9/>y. Souřadnice jsou zeměpisná délka a šířka World Geodetic System { "1984" } (WGS { "84" }) v desetinných stupních a výška v metrech nad elipsoidem WGS { "84" }, zapsané s <c10/> <c11/>. KML čte <c12/> jako výšku nad střední hladinou moře; rozdíl, undulace geoidu, je v rozmezí asi ±{ "110" } m a neaplikuje se. Popis dokumentu to uvádí.

seg-37dc14626a6c = Jeden <c1/>. Polohy jsou <c2/> nebo <c3/> — nejdřív délka, jak vyžaduje RFC { "7946" } — ve stupních WGS { "84" }, s výškou v metrech nad elipsoidem. Pohybující se objekt je <c4/> s vlastností <c5/> obsahující jeden čas ISO { "8601" } na každou polohu; stopa, která kříží poledník { "180" }°, se zapíše jako <c6/> přerušená tam, jak žádá RFC { "7946" } §{ "3.1.9" } (bod křížení se interpoluje a <c7/> pak uvádí jen původní vzorky). Stanoviště jsou <c8/>y, stopy rušičky <c9/>y s uzavřeným vnějším prstencem proti směru hodinových ručiček (§{ "3.1.6" }), netimované stopy <c10/>y. Každý prvek má vlastnost <c11/> pojmenovávající jednotku každého číselného člena.

seg-ea28a2bd431c = Jeden soubor na pohybující se objekt, protože efemerida STK popisuje jedno vozidlo. Záhlaví uvádí <c1/> (rovno počtu datových řádků), <c2/> (UTC, <c3/>), <c4/> s <c5/>, <c6/>, <c7/> a <c8/>; řádky pod <c9/> jsou sekundy po epoše, poloha v metrech a rychlost v metrech za sekundu v GCRS. Scéna jen s pevnými stanovišti nebo netimovanými stopami nezapíše žádný soubor <c10/>: pevný bod je STK Facility, nikoli efemerida. Id, které není prostou částí názvu souboru (skořepina konstelace a družice, <c11/>), se zapíše s každým jiným znakem jako <c12/>, číslované, pokud by se dvě id pak shodovala.

seg-52a78be5db9f = Druh <c1/> a druh <c2/> (přes svou fázi <c3/>) exportují každou družici na nízké oběžné dráze Země (LEO) i uživatele z vlastních propagátorů a časové mřížky daného druhu. Druh pracuje v ECI0, geocentrické inerciální soustavě zarovnané se soustavou vztaženou k Zemi v epoše; každý vzorek se otočí do soustavy vztažené k Zemi v jeho vlastním čase rotací Země daného druhu a odtud do GCRS přes soustavu true equator, mean equinox (TEME), v níž vydává výstup propagátor Simplified General Perturbations { "4" } (SGP4), v daném okamžiku, přičemž UT1 (Universal Time, úhel rotace Země) se klade rovno UTC a polární pohyb se zanedbává, jako u ostatních exportů. Ostatní druhy LEO uvádějí, proč se formát neuplatňuje (tabulka níže).

seg-b134baf33fba = <c1/> exportuje každý členský scénář, který má geometrii, jako vlastní sadu souborů, s označením člena vloženým před příponu formátu: každý běh fáze (<c2/>, nebo <c3/>, když má fáze několik běhů), základní scénář sweepu (<c4/>), scénář Monte Carlo (<c5/>) a každý složený člen (jeho označení, s vázanými sdílenými hodnotami zapsanými dovnitř). <c6/> zapíše <c7/> a <c8/>. Člen shodný s dřívějším se zapíše jednou a hodnoty, které kampaň aplikuje za běhu (předání, hodnoty sweepu, seedy), nejsou v exportovaném členu. Formát se na kampaň vztahuje, když se vztahuje na kterýkoli člen; jinak je důvod v poznámce { "4" } tabulky níže. Viz <a1>CAMPAIGNS.md</a1>.

seg-6579b6941d10 = Snímek <c2/> druhu <c1/> — modelované pásmo L vykreslené jako komplexní vzorky v jednom okamžiku — jako dvojice <c3/> / <c4/> v datovém typu, který pojmenovává <c5/> (<c6/> nebo <c7/>). Je to tatáž nahrávka, kterou běh zapisuje a zpětně čte pro vlastní kontrolu konzistence: exportovaná metadata se rovnají bloku <c8/> dokumentu s výsledkem a datový soubor má délku <c9/>. Zapisovač je <c10/>, modul, který už druh <c11/> používal; nic se neduplikuje.

seg-6e7c5f0e34f3 = Soustavy a čas

seg-01d1bedb0595 = Engine propaguje v TEME (true equator, mean equinox of date), své nativní soustavě. Pohybující se objekty se do GCRS otáčejí redukcí <c1/> (precese IAU { "2006" } a nutace IAU 2000B, kde IAU je Mezinárodní astronomická unie), která reprodukuje Valladův publikovaný příklad TEME–GCRF (Geocentric Celestial Reference Frame) s přesností { "0.11" } m, pro CZML a STK, a do soustavy vztažené k Zemi pomocí <c2/> pro KML a GeoJSON. Rotace do soustavy vztažené k Zemi je greenwichský střední hvězdný úhel s UT1 rovným UTC a bez aplikovaného polárního pohybu — tatáž redukce, kterou používá export SP3 (Standard Product { "3" }). Při poloměru dráhy GPS zanedbané UT1−UTC až { "0.9" } s posune zeměpisnou délku družice až o asi { "1.7" } km; pozemní stanoviště to neovlivní, protože jsou dána zeměpisnou šířkou a délkou.

seg-4eaa7b3e6946 = Výjimkou je druh <c1/>: jeho výstup enginu už nese polohy v GCRS i v soustavě vztažené k Zemi (s UT1−UTC a polárním pohybem scénáře nebo se skutečnou řadou International Earth Rotation and Reference Systems Service (IERS)) a ty se zapisují beze změny.

seg-2299da743a4c = Každý čas je UTC. Přestupné sekundy se nemodelují: posun přes přestupnou sekundu se počítá, jako by každý den měl { "86 400" } s, jak počítají časové mřížky enginu.

seg-4f7a0b8b4358 = Epocha <c1/> je ta, kterou používá běh daného druhu, a každý soubor ji uvádí: <c3/> druhu <c2/>; pokud chybí, nejstarší epocha, kterou nesou vlastní data družic (epocha dvouřádkové sady prvků (TLE), referenční čas vysílané efemeridy, začátek souboru SP3), a 2000-01-01T00:{ "00" }:00Z jen tehdy, když ji nenese žádná družice (keplerovské prvky). Exporty SP3 a OEM (Orbit Ephemeris Message) ponechávají 2000-01-01T00:{ "00" }:00Z pro scénář bez <c4/>, takže se pro takový scénář jejich data od těchto souborů liší. Bez <c5/> scénáře se každá družice, která nese vlastní epochu, otáčí do GCRS a soustav vztažených k Zemi v jejím vlastním okamžiku (její epocha plus <c6/>), protože k tomuto datu patří její poloha v TEME; kde se epochy družic liší, sdílené časové značky sledují předpoklad enginu, že každá družice začíná v <c7/>, a soubor uvádí, o kolik hodin se liší. Epocha prvků SGP4 Walkerových konstelací druhů <c8/> a <c9/> (2018-06-12T00:{ "00" }:00Z), kterou jejich běhy používají také pro rotaci Země; <c11/> druhu <c10/>; <c13/> nebo epocha TLE druhu <c12/>. Druh <c14/> nemá kalendářní epochu; jeho export datuje <c15/> jako u scénáře orbit bez ní.

seg-ee8eeb47f41b = Družice si ponechávají poziční identifikátory <c1/>, <c2/>, ..., které jim dávají exporty SP3 a OEM, protože propagátory nenesou řádky s názvy z TLE.

seg-0491624c5f12 = Importy

seg-798f3ae1b77d = Trasa GeoJSON.

seg-2a04d7d4bafc = <c1/> (knihovna: <c2/>) čte první <c3/> dokumentu GeoJSON — samostatnou geometrii, <c4/> nebo <c5/> — a zapisuje jej do vstupů stopy druhů <c6/>, <c7/>, <c8/> a <c9/> (<c10/>, <c11/>, <c12/>, <c13/>, <c14/>) před během. Tyto druhy létají <c15/>, takže trasa se přijme, jen když je přesně taková: její dva konce (počet <c16/> scénáře se zachová) nebo tři či více poloh rovnoměrně rozmístěných na přímce v zeměpisné šířce a délce, s přesností { "1e-7" } stupně (asi { "1" } cm). Každá jiná trasa se odmítne a chyba jmenuje polohu nejvíce vzdálenou od přímky. Trasa pro druh bez vstupu trajektorie se odmítne s tímto důvodem. Zeměpisná délka a šířka se kontrolují na rozsah, což zachytí soubor s šířkou na prvním místě.

seg-be9fddebd47a = <b>Nahrávka SigMF.</b> Blok <c2/> druhu <c1/> čte dvojici <c3/> / <c4/> přes <c5/> a vykresluje svůj odhad Welch vedle modelu (viz <a1>SPECTRUM.md</a1>). Čtení souborů je funkce nativního sestavení; sestavení pro WebAssembly přebírá bajty přes <c6/>.

seg-f1ca9cee1065 = Jak se exporty kontrolují

seg-afe73c19e369 = <c1/> zpracuje každý export validátorem napsaným podle specifikace formátu, nikoli kódem samotného zapisovače:

seg-bdc892a450c0 = CZML: pole JSON, jehož první paket je dokumentový paket s <c1/>; jedinečné identifikátory paketů; každá poloha uvádí <c2/> <c3/> nebo <c4/>; vzorkované polohy jsou <c5/> s epochou ISO { "8601" } a rostoucími časy.

seg-a28abb42c103 = KML: dobře utvořený dokument XML (Extensible Markup Language) v jmenném prostoru OGC KML { "2.2" } s jedním kořenovým prvkem; pořadí prvků schématu uvnitř Placemark; nejvýše jedna geometrie na Placemark; uzavřené lineární prstence o čtyřech či více polohách; n-tice <c1/> v rozsahu; platné hodnoty <c2/>; <c3/>, které se dají přeložit na existující styl; <c4/> s tolika <c5/> jako <c6/> a deklarovaný jmenný prostor rozšíření.

seg-8e0f4e4c2309 = GeoJSON: délka na prvním místě a v rozsahu, šířka v rozsahu, dvě nebo tři čísla na polohu, lomené čáry o dvou či více polohách, uzavřené vnější prstence proti směru hodinových ručiček, žádný úsek přes poledník { "180" }°, žádný člen <c1/>, vlastnost <c2/> u každého prvku.

seg-57bf7f9291e1 = STK: řádek verze <c1/>, blok <c2/> / <c3/> s požadovanými klíčovými slovy, <c4/>, <c5/> rovno počtu datových řádků, sedm čísel na řádek, rostoucí časy.

seg-e474c11480d8 = SigMF: <c1/> a <c2/> v <c3/>, pole <c4/> a <c5/>, <c6/> u každého záznamu a datový soubor z celých vzorků.

seg-82b7b39e7cad = Kromě struktury se družice exportovaná do CZML a do STK porovnává s vlastním stavem enginu po téže redukci soustavy a shoduje se na { "1" } mm v poloze (soubory nesou { "0.1" } mm): proti vlastnímu výstupu GCRS druhu <c1/> a proti nezávislé propagaci TEME–GCRS konstelace <c2/>, přičemž každá družice je datována vlastní epochou TLE přečtenou z textu scénáře. Dvě kontroly jdou mimo engine: polohy CZML první družice <c3/> se shodují na { "0.1" } m (naměřeno { "2.3" } cm) s toutéž TLE propagovanou balíčkem Pythonu <c4/> a redukovanou do GCRS pomocí ERFA (Essential Routines for Fundamental Astronomy, otevřená implementace knihovny SOFA od IAU) a polohy družic <c5/> vztažené k Zemi se rovnají polohám z vysílané efemeridy podle specifikace rozhraní Global Positioning System na { "1" } mm. Polohy vztažené k Zemi z exportu <c6/> se porovnávají s polohami, které hodnotí běh rušení, na { "5" } mm. Trasa GeoJSON projde zpáteční cestou přes scénář stopy, dvojice SigMF se přečte zpět na tytéž bajty a každý export je bajtově deterministický.

seg-20fbf9a3fba7 = Jde o kontroly proti publikovaným specifikacím a proti samotnému enginu. Soubory nebyly v rámci testovací sady načteny do CesiumJS, Google Earth, Ansys STK ani nástroje SDR, takže přijetí konkrétní verzí těchto nástrojů se zde netestuje.

seg-7349c09206ac = Výměna drah, orientace a jader (knihovna, { "0.36" })

seg-d5e34188aa96 = Vedle formátů <c1/> přidala verze { "0.36" } knihovní čtečky a zapisovače standardních souborů, které si vyměňují nástroje pro analýzu misí. Přijímají a vracejí text či bajty a nedotýkají se souborů. Každý je řádek VALIDATED v <a1>ověřovací matici</a1>, proti nezávislé implementaci tam uvedené:

seg-cd8b6f2d43be = <b>CCSDS Orbit Data Messages</b> (<c1/>, s <c2/> pro formu XML): OPM, OMM a OCM v zápisu klíč–hodnota (KVN) a NDM/XML podle CCSDS 502.0-B-3 (OPM a OMM verze { "3.0" } a { "2.0" }, OCM { "3.0" }). Zkontrolováno oběma směry proti Orekit: Orekit čte soubory Kshany a Kshana čte soubory Orekit. Zbylá zjištění jsou zafixována testy.

seg-00b9fc226c06 = <b>CCSDS Attitude Data Messages</b> (<c1/>, s <c2/>): AEM a APM podle CCSDS 504.0-B-2, v KVN a NDM/XML. Zkontrolováno proti Orekit stejným způsobem a rotace záznamů proti rotacím Orekit.

seg-b8aa23f78f9e = <b>SPICE SPK</b> (<c1/>): zapisovače a čtečky segmentů NAIF SPK typů { "9" } a { "13" } (s exportem CCSDS OEM do jádra SPK) a typů { "3" } a { "21" } (Čebyševovy polynomy a rozšířené diferenční řádky), zkontrolované proti vlastním čtečkám knihovny NAIF SPICE, až na shodu bajt po bajtu. Kshana zapisuje segmenty ze záznamů, které dostane: Čebyševovy koeficienty neprokládá ani diferenční řádky nevytváří.

seg-bb97cbb1ab9f = Importér a zapisovač CCSDS OEM a blok kovariance OEM jsou starší a jsou popsány v importech výše a v matici.

seg-8932eba75c68 = Geometrii exportují jen druhy v tabulce níže. Druhy, jejichž geometrie je vztažena k Měsíci, Marsu nebo jinému tělesu, se neexportují: CZML, KML a GeoJSON popisují polohy kolem Země a toto vydání zapisuje soubory STK jen s <c1/>, ačkoli samotný formát STK jiná centrální tělesa připouští.

seg-a0593ad77202 = <c1/>, <c2/> a <c3/> mají geometrii vztaženou k Zemi, kterou toto vydání neexportuje; tabulka uvádí důvod pro každý.

seg-2bb9237839f3 = Druh <c1/> letí svou trajektorii v rovinné místní tečné rovině, takže se exportuje jen počátek roviny, nikoli trajektorie.

seg-6049ab4ca3c9 = Polohy družic vztažené k Zemi zanedbávají UT1−UTC a polární pohyb (viz Soustavy a čas); výšky KML jsou elipsoidické, ne nad střední hladinou moře.

seg-4dda05aefd2b = Stopy rušičky předpokládají šíření ve volném prostoru, rušičku na horizontu přijímače a kulovou Zemi pro kružnici.

seg-2dd0656c518f = Každý soubor scénáře

seg-e024f5c1cab1 = Co dělá <c1/> pro každý soubor v <c2/> (manifest sady není scénář a je vynechán). „ano“ znamená, že formát se zapíše a projde svým validátorem; jinak číslo odkazuje na důvod. Generuje <c3/>; <c4/> selže, když je zastaralá.

seg-c27f67dfbb37 = ne [{ "1" }]

seg-3468244e2385 = ne [{ "2" }]

seg-d0cf3f74cd10 = ne [{ "3" }]

seg-62c880979169 = ne [{ "4" }]

seg-9229b499c702 = ne [{ "5" }]

seg-d9d6561c9e5b = ne [{ "6" }]

seg-7d4a6538c638 = ne [{ "7" }]

seg-f170ed4d8dca = ne [{ "8" }]

seg-1c5eb5dca942 = ne [{ "9" }]

seg-a930bb0d2e42 = ne [{ "10" }]

seg-236853169f42 = ne [{ "11" }]

seg-411e4f3aeae7 = ne [{ "12" }]

seg-34fabcbb82f2 = ne [{ "13" }]

seg-772bd344bbce = ne [{ "14" }]

seg-460fd74c7c7e = ne [{ "15" }]

seg-e1d91ce54b8b = ne [{ "16" }]

seg-f3e0486f02e3 = ne [{ "17" }]

seg-884160b0ed12 = ne [{ "18" }]

seg-8202f4a426b0 = ne [{ "19" }]

seg-a4e9a36289e5 = ne [{ "20" }]

seg-034364e38105 = ne [{ "21" }]

seg-3e3b6ecc7b43 = Proč se formát neuplatňuje:

seg-d7bd20cb8710 = druhy <c1/> a <c2/> plánují kontakty downlinku a kódování; pro geometrii exportujte scénář <c3/> pro stejnou družici a stanici

seg-f587b4df1635 = SigMF obsahuje komplexní vzorky v základním pásmu, které syntetizuje jen druh <c1/>

seg-d102fb18ce8d = druh <c1/> simuluje orientaci kolem těžiště bez dráhy či pozemní polohy, takže není co umístit na Zemi

seg-ecc0e31b0369 = vstup scénáře nenese žádnou horizontální polohu (žádnou zeměpisnou šířku a délku, žádné geocentrické souřadnice, žádné dráhové prvky kromě nejvýše výšky), takže není co umístit na Zemi

seg-2e0825b27359 = druhy <c1/> a <c2/> počítají bilance bez polohy na Zemi

seg-1f17b963c7a6 = efemerida STK popisuje polohu a rychlost vozidla v čase; tato scéna má jen pevné body nebo netimované stopy (pevný bod je STK Facility, nikoli efemerida)

seg-f79d0ce7b945 = žádný členský scénář kampaně nemá nic, co tento formát popisuje; exportujte člena samostatně, abyste viděli jeho důvod

seg-08b7e027318a = druh <c1/> analyzuje návrhy signálů (spektra, sledování, akvizici, kompatibilitu) bez polohy družice či uživatele; exportujte scénář <c2/> nebo <c3/>, který návrh letí

seg-31c8acef1aed = v tomto vydání se neexportuje: fúzní polohové druhy umísťují své družice do soustavy vztažené k Zemi vzhledem k epoše, kterou nikdy nejmenují, takže by časově označený export musel kalendářní datum vymyslet (exportujte místo toho scénář <c1/> nebo <c2/>)

seg-3c57b084f0d7 = geometrie druhu je vztažena k Měsíci, Marsu nebo jinému tělesu Sluneční soustavy; CZML, KML a GeoJSON popisují polohy na Zemi nebo kolem ní a toto vydání zapisuje efemeridy STK jen s CentralBody Earth

seg-2edebe91839c = v tomto vydání se neexportuje: <c1/> umísťuje své družice do soustavy vztažené k tělesu vzhledem k epoše, kterou nikdy nejmenuje, takže by časově označený export musel kalendářní datum vymyslet

seg-951ac7c5f138 = v tomto vydání se neexportuje: konstelaci globálního družicového navigačního systému (GNSS) Země z <c1/> vidí přijímač ve vzdálenosti Měsíce, jehož trajektorii druh nezpřístupňuje jako časovou řadu

seg-3cf7f7460c55 = v tomto vydání se neexportuje: druh <c1/> hlásí špičková zatížení a ohřev a neuchovává žádnou pozemní stopu s časovými značkami

seg-cfc3df59e5c8 = druh <c1/> prochází dostupnost a sílu spoje pro uživatele na skořepině nebo keplerovské trajektorii; nemá jedinou polohu, kterou lze umístit na mapu

seg-6271953188bd = scénář <c1/> uvádí zeměpisnou šířku místa startu, ale ne délku, takže místo nelze umístit

seg-c9a63dfb34db = v tomto vydání se neexportuje: pravá dráha <c1/> je referenční dráha pro fitování, jejíž úhel rotace Země v epoše je vstup (<c2/>, výchozí { "0" }), nikoli odvozený z kalendářního data, takže její polohy vztažené k Zemi nejsou vázány na datum

seg-a03c2f0426db = tento scénář spectrum nemá blok [iq], takže se nesyntetizují žádné vzorky k nahrání

seg-d75f8ad6903a = v tomto vydání se neexportuje: <c1/> čte a zapisuje Orbit Ephemeris Message CCSDS (Consultative Committee for Space Data Systems), což je samo o sobě výměnný soubor efemerid

seg-fdbaf96ecf3e = druh <c1/> počítá statistiky spoje pro pozemní stanoviště bez geometrie s časovými značkami, kterou by bylo možno umístit

seg-146a2e8ee590 = scénář prochází jiný scénář přes mřížku; exportujte procházený scénář samostatně

seg-b74484e3586b = druh <c1/> počítá bilanci spoje a stability bez geometrie s časovými značkami, kterou by bylo možno umístit

seg-bcd613e62c69 = <s1>Předchozí</s1>Export animace

seg-0525f7fbbfd2 = <s1>Další</s1>Stav validace

seg-53a778722c16 = STK .e
