# docs--interference-map: translations (cs)

seg-6555ff9a6d8e = Výstup

seg-2247a2344710 = Význam

seg-c3c260b7063e = Testy

seg-d4a762001549 = Licence

seg-e7b6d071246e = Zdroj: <c1/>

seg-143c73287d6c = <c1/> sestaví denní obraz toho, kde letadla a lodě hlásily zhoršená navigační data, z volně licencovaných souborů sledování, které dodáte. <c2/> pak říká, jak velká část plánované trasy ležela v jednotlivých dnech uvnitř dotčených buněk.

seg-158f33f95ec3 = Co to je: popis toho, jak vypadala zveřejněná hlášení poloh v minulých dnech. Co to není: měření jakéhokoli přijímače, předpověď ani důkaz interference. Zhoršená či anomální buňka má několik možných příčin (uvedeny níže) a buňka bez záznamu prostě nebyla pozorována.

seg-64d3ee269407 = Vše běží na místních souborech. Výchozí příkazy nikdy neotevírají síťové spojení; jediný volitelný pomocný nástroj pro stahování potřebuje výslovný příznak.

seg-e251b385ff46 = Dva syntetické dny mapy interference nakreslené z přiložených ukázek v examples/interference-map/output, každý s vlastní syntetickou trasou a podíly expozice trasy, které engine hlásí. Vlevo den ADS-B: { "1" } zhoršená buňka, { "6" } nezhoršených, { "4" } nevyhodnocených (šrafovaně) a buňky bez záznamu, nakreslené prázdné, které nebyly pozorovány. Trasa měří { "525" } km: { "11.5" } % její délky v zhoršených buňkách, { "38.3" } % nezhoršených, { "9.1" } % nevyhodnocených a { "41.1" } % nepozorovaných. Vpravo den AIS: buňky označené detektory kruhu a souše, neanomální buňky a prázdné buňky; trasa měří { "454" } km, z toho { "10.5" } % v anomálních buňkách, { "21.2" } % neanomálních, { "0.0" } % nevyhodnocených a { "68.3" } % nepozorovaných. ADS-B a AIS jsou oddělené vrstvy, nikdy se nekombinují. Označená buňka není zjištěním interference a buňka bez barvy nebyla pozorována, což není totéž jako čistá. Všechna data jsou vymyšlená, v otevřeném středním Atlantiku, a nejde o měření.

seg-765f43228dc6 = Oba dny jsou syntetické ukázky v <c1/>, každý se syntetickou trasou v <c2/>; podíly expozice trasy jsou to, co pro ně vypíše <c3/>. Nic v nich není skutečné místo, letadlo ani plavidlo.

seg-228f39c0305b = Data a licence

seg-d3336cc18ff7 = Vestavěné jsou jen zdroje přezkoumané v <a1><c1/></a1>, vybírané pomocí <c2/>:

seg-b03d56f501c3 = Druh

seg-2328672e782f = Pole licence výstupu

seg-2319c7a6f6e2 = ODbL { "1.0" }

seg-7464d3c830f3 = AIS

seg-c13f76567536 = Veřejná doména USA (CC0 { "1.0" } podle vydavatele)

seg-636c2bb6f29d = veřejná doména

seg-f6f4e431d36d = NLOD { "2.0" }

seg-5621e3a3908f = obojí

seg-6b3a1f8ca649 = cokoli uvedete

seg-be349e2c455f = <c1/>, <c2/>, <c3/> povinné

seg-590344d1eae5 = Každý výstupní soubor vkládá licenci, URL licence, požadované uvedení původu a omezení pokrytí zdroje. Pro zdroje, jejichž podmínky zakazují komerční použití či šíření odvozených map, neexistuje žádná vestavěná položka.

seg-2d8eaefab0f8 = <b>ODbL a edice Kshany.</b> Soubor ADS-B po buňkách vytvořený z dat adsb.lol je Derived Database a vydává se pod ODbL { "1.0" }; jeho pole <c1/> to uvádí. Vlastní kód Kshany zůstává AGPL-3.0. Komerční edice Kshany, které takové soubory zapisují, nesou totéž upozornění a kdokoli soubor znovu zveřejní, jej musí zachovat. Výsledky ADS-B a AIS se nikdy nekombinují v jednom souboru, takže se ODbL nepřenese na vrstvu AIS.

seg-bb4932d5d15c = <b>Vychýlení pokrytí.</b> Mapy dědí pokrytí svého zdroje. adsb.lol sleduje dobrovolnické přijímače, takže otevřené moře a řídce pokryté oblasti jsou řídké. Otevřená data Kystverket vynechávají rybářská plavidla pod { "15" } m a rekreační plavidla pod { "45" } m, takže jeho mapa odráží větší lodě. MarineCadastre pokrývá jen vody USA.

seg-713babc3963b = <b>Identifikátory.</b> Vstupní řádky nesou identifikátor letadla nebo plavidla. Ten se v paměti hashuje s náhodnou solí pro jednotlivý běh, používá se jen k počítání odlišných letadel či plavidel a nikdy se nezapisuje, nezaznamenává ani netiskne. Výstupy jsou agregované: nikde v nich se neobjevuje žádný identifikátor.

seg-fa3c70a8997a = <b>Potlačení.</b> Buňka s méně než <c1/> odlišnými letadly či plavidly pozorovanými v daný den se nezveřejňuje vůbec a pro AIS se označený počet jedna či dvě ve zveřejněné buňce hlásí jako <c2/>. Žádná zveřejněná hodnota nemůže vyčlenit konkrétní letadlo nebo plavidlo.

seg-02dbfcb9c808 = Vstupní formáty

seg-2f291f986a87 = Prostý CSV s řádkem záhlaví, oddělený čárkami, bez uvozování, časy v UTC. Pořadí sloupců je volné; neznámé sloupce se ignorují. Časová značka je v Unixových sekundách nebo <c1/>. Řádky, které nelze zpracovat, se započítávají do metadat výstupu a nejsou tiše zahazovány.

seg-571365be20a5 = ADS-B (<c1/>):

seg-aaeff8f42699 = Sloupec

seg-b10a51ed96c0 = Povinný

seg-357c2320b43a = ano

seg-14ac5d0f109b = čas hlášení

seg-6dbe5595d0be = neprůhledný identifikátor (hashovaný, nikdy neukládaný)

seg-c5fb6b91dc68 = stupně

seg-e283838c85aa = výška ve stopách; <c1/> nebo prázdná hodnota řádek vylučuje

seg-9ab90c35bd7d = alespoň jeden

seg-868e5b9c00ab = celá čísla { "0" } až { "11" }; prázdná hodnota znamená nehlášeno

seg-db907db790b1 = ne

seg-5c2ce9f61700 = pokud je přítomen, používají se jen hodnoty začínající <c1/> (MLAT, TIS-B a podobné se vylučují)

seg-412f40b8eeb1 = <b>Historie readsb z adsb.lol, čtená přímo.</b> Denní archivy jsou rozdělený tar souborů trasování readsb. Jeden rozbalte tak, jak popisuje vydavatel (spojte části, <c1/>), a pak předejte Kshaně rozbalený adresář, jeden soubor <c2/> nebo CSV:

seg-6e7d378bd89b = Adresář se prohledává rekurzivně na soubory <c1/> (jiné soubory, například <c2/>, se ignorují a symbolické odkazy se nenásledují). Každý soubor je komprimovaný gzipem nebo prostý JSON, což se pozná podle prvních bajtů, protože readsb zapisuje gzip pod názvem <c3/>; dekomprese je omezena na { "512" } MiB na soubor. Z každého záznamu trasování Kshana čte časový posun, zeměpisnou šířku, zeměpisnou délku, výšku (značka <c4/> záznam vylučuje), pole <c5/> a <c6/> objektu podrobností o letadle a řetězec zdroje polohy (záznamy z čehokoli jiného než ADS-B se vylučují). Záznam bez objektu podrobností nemá pole přesnosti a počítá se jako vyloučený. Soubor, který nelze přečíst, se započítá do <c7/> v metadatech výstupu a přeskočí se.

seg-b1502f7f4c98 = AIS (<c1/>):

seg-91395984ddac = stupně; hodnoty AIS „není k dispozici“ a ({ "0" }, { "0" }) se zahazují

seg-34ae94eb1797 = rychlost přes zem v uzlech; { "102.3" } (není k dispozici) se považuje za chybějící

seg-a1e60af5adaa = Detektor souše potřebuje soubor polygonů souše (<c1/>): GeoJSON Polygon nebo MultiPolygon. Zamýšleným souborem je vrstva souše Natural Earth v měřítku { "1" }:{ "10" } milionů (veřejná doména). Bez <c2/> je detektor vypnutý a výstup to uvádí. Stažení (jediný síťový přístup v této funkci):

seg-cd55a09894c5 = Tím se jednou přes HTTPS spustí systémový <c1/> (jako seznam argumentů, ne přes shell) pro jeden soubor na pevné adrese, která určuje jediný commit nadřazeného repozitáře. Stažený soubor se ponechá, jen když se jeho SHA-256 rovná hodnotě zafixované v kódu; při neshodě se smaže a příkaz selže. Pokud <c2/> není nainstalován, příkaz to sdělí a uvede adresu a kontrolní součet, aby šlo soubor stáhnout ručně. V repozitáři není nic přibaleno.

seg-95eeaa0033b3 = Jeden soubor GeoJSON na zdroj a UTC den, v adresáři <c1/>, pojmenovaný <c2/>, kde <c3/> je <c4/> nebo <c5/>, <c6/> je klíč <c7/> (<c8/>, <c9/>, <c10/> nebo <c11/>) a datum je UTC den hlášení: <c12/>, <c13/>. Dataset je v názvu, aby dva datasety jednoho druhu nemohly sdílet soubor, a <b>Kshana nikdy nepřepíše soubor</b>: pokud některý cíl existuje, příkaz selže dříve, než cokoli zapíše. CLI vypíše jeden řádek za každý zapsaný soubor. Čtenář může tři části získat zpět pomocí <c14/>; tatáž informace je uvnitř souboru (<c15/>, <c16/>, <c17/>). Syntetické ukázkové soubory, po jednom na zdroj, jsou v <c18/> spolu s příkazem, který je znovu vytvoří, pro vývoj a testování prohlížeče. Člen nejvyšší úrovně <c19/> obsahuje název schématu, datum, mřížku, id metody a každý parametr, údaje za celý den, licenci dat a uvedení původu a upozornění. Každý prvek je polygon buňky s <c20/>, <c21/>, <c22/>, <c23/> a agregovanými počty.

seg-1ee702004726 = Mřížka je pevná: čtvercové buňky o <c1/> stupních (výchozí { "0.5" }) v zeměpisné šířce i délce, indexované od (-90, -180). Šířka východ–západ se se zeměpisnou šířkou zmenšuje: u výchozí hodnoty asi { "55" } km na rovníku a asi { "28" } km při { "60" } stupních. Šířka { "90" } patří do poslední řady a délka { "180" } je tentýž poledník jako -180. <b>Předregistrované metody jsou definovány na mřížce { "0.5" } stupně.</b> Jiné <c2/> běží, ale není to předregistrovaná metoda: CLI to říká a soubor zaznamenává <c3/> a <c4/> (false), aby to mohl říci i prohlížeč.

seg-6e1e8f2a9082 = <b>Zadržené počty.</b> Každý počet po buňkách pod minimem pro zveřejnění ({ "5" }) je <c1/>, včetně nuly, takže <c2/> nikdy neznamená „žádný“ a žádné zveřejněné číslo nemůže vyčlenit konkrétní letadlo nebo plavidlo. Pole <c3/> a <c4/> se přesto uvádějí. V souborech ADS-B je <c5/> u zveřejněné buňky vždy alespoň { "5" }; <c6/> a <c7/> jsou pod { "5" } <c8/> a <c9/> je <c10/>, pokud obě nejsou alespoň { "5" } (podíl by prozradil zadržený počet). V souborech AIS je každý záznam <c11/> pod { "5" } <c12/>.

seg-fd929d6ee90b = Verze formátu a pole

seg-ff443e9cbd20 = Formát je ustálen jako <c1/>, <c2/>. Změna, která pole odstraní nebo přejmenuje či změní jeho význam, zvyšuje verzi; přidání pole ji nezvyšuje, takže čtenář musí ignorovat pole, která nezná. Počet, který je <c3/>, je zadržen, nikoli nulový.

seg-60818bfc3f90 = Hodnoty <c1/>: ADS-B <c2/>, <c3/>, <c4/>, <c5/>, <c6/>; AIS <c7/>, <c8/>. <c9/> je true jen pro <c10/> a <c11/>. Zpráva o expozici trasy má vlastní schéma <c12/>.

seg-ea526ebdd260 = Observatoř: denní produkt

seg-e33f63fe5c0a = <c1/> promění jeden UTC den hlášení ADS-B na tři soubory observatoře (GeoJSON, PNG a JSON se zprávou o incidentech) a manifest hashů a <c2/> přehraje tento den při změnách předregistrovaných parametrů po jednom. Příkaz vynucuje pravidla vydání: alespoň { "24" } h po skončení dne (<c3/> lze jen zvýšit), buňky o { "0.5" } stupně nebo hrubší, jen tři stavy (<c4/>, <c5/>, <c6/>), žádná přisouzená příčina a žádná data OpenSky. Poznámka k metodě, formáty souborů a omezení jsou v <a1><c7/></a1>. Regionální běh (<c8/>) čte jen hlášení z daného obdélníku a soubor to uvádí.

seg-31ce42fc05dc = Specifikace stránky mapy ve Studiu

seg-a9aca2e2d390 = Pro stránku mapy ve Studiu, která načítá soubor GeoJSON dodaný uživatelem (stránka je sestavena ve zdrojích Studia, ne v tomto repozitáři). Nic se nenahrává: soubor se čte v prohlížeči a stránka nevysílá žádný požadavek na žádný zdroj dat.

seg-064ec5d4c91a = <b>Čtení souboru.</b> Soubor přijměte, jen když <c1/> začíná <c2/> a <c3/> je číslo, které stránka podporuje; jinak sdělte, že soubor není podporovanou mapou interference Kshana. Čtěte pole uvedená výše; neznámá ignorujte. Soubor obsahuje jeden zdroj a jeden den. Může být načteno několik souborů.

seg-5be32f8cff46 = <b>Buňky.</b> Vykreslete polygon každého prvku. Barvu určete podle <c1/> a v legendě vždy uveďte, co která barva znamená. Čtyři stavy, z nichž žádný nesmí být skryt ani sloučen:

seg-b652b86e6b8e = Stav

seg-4a511b6a03e3 = Odkud pochází

seg-f92da2236260 = Zhoršená (u AIS anomální)

seg-591ebe8007cb = vysoký podíl letadel v daný den hlásil nízkou přesnost nebo plavidla vykazovala anomálie

seg-bd993c64b6e8 = <c1/> je true

seg-88d43eb1c14a = Čistá

seg-af5f7989fd09 = pozorováno s dostatkem letadel či plavidel a neoznačeno

seg-2bc810e02210 = <c1/> je <c2/> nebo <c3/>

seg-d894eaa21369 = Nevyhodnoceno

seg-38c88ed94111 = pozorováno, ale není dost vzorkovaných letadel, den byl zkreslen, nebo nešlo odhadnout pozadí dne

seg-e358a8c7903f = <c1/> je <c2/>, <c3/> nebo <c4/>

seg-013b7c903426 = Nepozorováno

seg-81bcffa57ec2 = příliš málo letadel či plavidel, takže buňka nebyla zveřejněna

seg-6828d71822bd = pro tuto buňku není žádný prvek

seg-753192a770ac = „Nepozorováno“ je nepřítomnost prvku: vykreslete je neutrálně (bez výplně nebo šrafováním), nikdy ne barvou „čisté“. Použijte barevné schéma, které nespoléhá jen na červenou proti zelené. Podrobnosti o buňce při najetí nebo výběru ukazují počty z <c1/> tak, jak jsou uvedeny, a každý počet <c2/> jako „zadrženo (méně než { "5" })“, nikdy jako nulu. Prohlížeč má také říci, když je <c3/> false, že soubor používá velikost buňky mimo předregistrovanou metodu.

seg-e90fedf7ad89 = <b>Vrstvy.</b> ADS-B a AIS jsou oddělené vrstvy s vlastními přepínači, legendami a řádky licence. Nikdy je neslučujte do jednoho barevného pole ani jednoho počtu, nikdy je nekreslete jako jednu kombinovanou buňku a nikdy nesčítejte jejich buňky. Různé dny jsou různé soubory: zobrazujte vždy jeden den, s výběrem dne, a nepřekrývejte dny.

seg-6d500d3c0baa = <b>Licence a uvedení původu.</b> Pro každou viditelnou vrstvu zobrazte na mapě i v každém exportu či snímku obrazovky text <c1/> doslovně, <c2/> s odkazem na <c3/> a <c4/>. Pokud je zobrazena vrstva ADS-B, platí její licence ODbL jen pro tuto vrstvu. Nenabízejte export kombinovaného souboru.

seg-6f786153ef8e = <b>Metoda.</b> V panelu podrobností nabídněte id metody a parametry (<c1/>, <c2/>) a údaje <c3/>, včetně <c4/> (řekněte jasně, že žádná buňka nebyla označena za zhoršenou kvůli pozadí dne) a <c5/>.

seg-905348837439 = <b>Výhrady, které je třeba zachovat</b> (zobrazte vlastní <c1/> a <c2/> souboru a toto znění nebo jeho ekvivalent nechte u mapy viditelné):

seg-1f70e308010a = Zhoršená nebo anomální buňka není zjištěním interference. Existují i jiné příčiny.

seg-7cde0ddadb73 = Buňka bez barvy nebyla pozorována. Není to důkaz, že oblast byla čistá.

seg-1135dfeadb8f = Jde o popis minulých hlášení poloh, nikoli předpověď ani měření jakéhokoli přijímače.

seg-3ad1216bf3ed = Pokrytí se řídí zdrojem dat; přečtěte si poznámky k pokrytí.

seg-046f6af48349 = Stránka nesmí jmenovat ani zobrazovat žádné jednotlivé letadlo či plavidlo a soubory žádné neobsahují.

seg-ae79b67c3b98 = <b>Expozice trasy.</b> Pokud stránka načítá také zprávu <c1/>, zobrazte její řádky po dnech a zdrojích se všemi čtyřmi podíly (zhoršené, čisté, nevyhodnocené, nepozorované) pohromadě, nikdy ne samotný podíl zhoršených, plus <c2/> zprávy a <c3/> a <c4/> každého řádku.

seg-98131acf49d8 = Metoda ADS-B (<c1/>)

seg-83b660b0bfa6 = Každé hlášení ADS-B ze vzduchu nese dvě sebehodnotící pole kvality navigace: NIC (poloměr zahrnutí polohy) a NACp (mez přesnosti { "95" } %, EPU). Když přijímač na palubě ztratí družicovou polohu nebo jí přestane důvěřovat, obě klesnou, proto nesou stopu interference. Klesají však i z jiných důvodů.

seg-4b9020a68db6 = <b>Předregistrované parametry</b> (konstanty v kódu, zapsané do každého souboru; změna znamená novou verzi metody):

seg-e73ea9921fcf = Parametr

seg-8650fa804f14 = Dolní mez výšky

seg-25056ee5a36c = barometrická výška alespoň { "5000" } ft

seg-17322eff480a = Hlášení s nízkou přesností

seg-48ab6ed5eedd = NACp nejvýše { "6" } (hlášená mez EPU je { "556" } m, { "0.3" } NM, nebo větší, nebo neznámá) nebo NIC nejvýše { "5" } (hlášená mez poloměru zahrnutí je { "1852" } m, { "1" } NM, nebo větší, nebo neznámá)

seg-84beb488319d = Dobré hlášení

seg-2595055d9593 = NACp alespoň { "8" } a NIC alespoň { "7" }; posuzuje se podle polí, která vstup má (obě, když jsou přítomna obě, jinak to přítomné)

seg-b4bbce695b2d = Základ vybavení

seg-4986ed51f600 = letadlo se v buňce počítá, jen když má ve stejný den alespoň { "5" } dobrých hlášení mimo tuto buňku

seg-42859d1d785b = Vzorkovaná letadla v buňce

seg-1ae26d6d99a9 = alespoň { "3" } hlášení v buňce

seg-48bba15e2e0e = Postižená letadla v buňce

seg-1fe9c3ab930c = alespoň { "50" } % jeho hlášení v buňce má nízkou přesnost

seg-b147473d133c = Minimální vzorek

seg-33060cda8536 = alespoň { "10" } vzorkovaných letadel

seg-009ca23b9cd6 = Zhoršená

seg-afef85ae2a25 = alespoň { "5" } postižených letadel, podíl postižených ze vzorkovaných letadel alespoň { "0.30" } a alespoň { "0.15" } nad mediánem podílů buněk v daný den

seg-890dcc56fa5c = Zkreslený den

seg-b27768e64d62 = medián podílů buněk (přes alespoň { "5" } buněk s úplným vzorkem) alespoň { "0.15" }: žádná buňka se neprohlásí za zhoršenou

seg-18fbf3c348c9 = Žádné pozadí

seg-534111e0c6ad = méně než { "5" } buněk s úplným vzorkem, takže medián nelze odhadnout: buňka, která splňuje prahy, je <c1/>, nikoli zhoršená

seg-b571f127c595 = Minimum pro zveřejnění

seg-60621ffc5bcf = alespoň { "5" } pozorovaných odlišných letadel

seg-f36389caf81b = Tyto hodnoty byly stanoveny z definic kódů NIC a NACp a z pravidla ochrany soukromí dříve, než se na jakákoli data pohlédlo. Nebyly laděny na skutečných datech a testy používají jen syntetická data. Stavy buněk: <c1/>, <c2/>, <c3/> (zveřejněno, ale méně než { "10" } vzorkovaných letadel), <c4/> a <c5/>.

seg-c89afc07989b = <b>Verze { "2" }.</b> Verze { "1" } prohlásila buňku za zhoršenou už od { "3" } postižených letadel, tedy méně než je minimum pro zveřejnění 5 letadel, a když bylo úplně vzorkováno méně než { "5" } buněk, přeskočila kontrolu pozadí dne, aniž to uvedla. Verze { "2" } vyžaduje alespoň { "5" } postižených letadel a zadrží posouzení (<c1/>), když nelze pozadí odhadnout. Obě změny metodu zpřísňují (nic, co nebylo ve verzi { "1" } zhoršené, není zhoršené ve verzi { "2" }); důvodem je, že zveřejněné posouzení nikdy nesmí spočívat na menším počtu letadel, než je číslo, pod nímž se počty zadržují. Soubory verze { "1" } nebyly vydány.

seg-ffd0e5175548 = Proč pole přesnosti klesají z jiných důvodů než interference a jaká je proti každému ochrana:

seg-12b613a77f64 = Příčina

seg-e30479c3e5d8 = Ochrana

seg-ecac3d226210 = Starší transpondéry, které NIC ani NACp nikdy nehlásí, nebo je hlásí pevnou nízkou hodnotou

seg-8b504b60fcc0 = základ vybavení: letadlo bez dobrých hlášení jinde v daný den se nepočítá

seg-1df45f128708 = Nízká výška a provoz na zemi (stínění terénem, jiné formáty polohy)

seg-cc5f23f0da05 = dolní mez výšky; řádky označené <c1/> se vylučují

seg-ddf6aeb47dbe = MLAT nebo jiné polohy mimo GNSS

seg-51162a1835d1 = filtr <c1/>, když je sloupec přítomen

seg-08196503a657 = Jedno letadlo posílá mnoho hlášení

seg-bf13dfa85dbe = počítají se odlišná letadla, nikoli hlášení

seg-bbcb809624bc = Výpadek konstelace nebo augmentace či událost kosmického počasí snižující přesnost na širokém území

seg-5f428bb7ad4a = buňka musí medián podílů buněk v daný den překročit o rozpětí a den, jehož medián je sám vysoký, se označí za zkreslený a žádnou buňku neprohlásí

seg-30290253a95d = Porucha vybavení jednoho letadla

seg-b673195405ff = vyžaduje podíl mnoha odlišných letadel s minimálním vzorkem

seg-aeebeded71be = Málo letadel v buňce

seg-c33c60b49b17 = minimální vzorek; pod { "5" } pozorovaných se buňka nezveřejňuje

seg-dc8abb9b411f = Co zůstává: metoda nedokáže rozlišit interferenci od regionální příčiny, která je spíše místní než plošná (místní efekt geometrie družic nebo výpadek pozemní augmentace by vypadaly stejně), a je konzervativní jedním směrem: letadlo, které celý den létá jen uvnitř postižené oblasti, nemá žádný základ a nepočítá se, takže trvalé rozsáhlé oblasti jsou podhodnoceny.

seg-41d725eeaba9 = Metoda AIS (<c1/>)

seg-7fd53079dccf = Na plavidlo a den pět detektorů. Detektor se v buňce <b>kvalifikuje</b>, když označí alespoň { "5" } odlišných plavidel tvořících alespoň { "20" } % tam pozorovaných plavidel; buňka je <c1/>, pokud se kvalifikuje některý detektor.

seg-6d599353e8e1 = Detektor

seg-551f38a9061c = Pravidlo (předregistrované)

seg-295e8a28a5b9 = alespoň { "3" } hlášení v buňce více než { "2000" } m ve vnitrozemí od dodané pobřežní čáry

seg-fd21160e6685 = okno { "20" } po sobě jdoucích hlášení (krok { "10" }, mezery nejvýše { "30" } min), jejichž střední poloměr od těžiště je { "500" } m až { "20" } km, variační koeficient poloměru nejvýše { "0.15" }, jeden směr pohybu s celkovým stočením alespoň { "270" } stupňů (kroky nejvýše { "90" } stupňů, čisté stočení alespoň { "80" } % celkového) a střední rychlost alespoň { "2" } kn

seg-1aa30db06794 = alespoň { "2" } skoky přicházející do buňky: po sobě jdoucí hlášení vzdálená alespoň { "1000" } m, s odstupem nejvýše { "1" } h, implikující více než { "70" } kn (implikovaná rychlost používá alespoň { "1" } s mezi hlášeními, takže dvě hlášení se stejným časovým razítkem a polohami vzdálenými { "1" } km nebo více se počítají jako skok)

seg-7f9b22254009 = alespoň { "3" } hlášené rychlosti nad { "70" } kn v buňce

seg-e0d0968e8751 = alespoň { "5" } odlišných plavidel hlásících stejnou polohu (zaokrouhlenou na { "1e-4" } stupně, asi { "11" } m) ve stejném 10minutovém okně

seg-1bf4c460672c = Buňky s méně než { "5" } odlišnými plavidly se nezveřejňují; každý počet označených pod { "5" }, včetně nuly, se hlásí jako <c1/>.

seg-b2ea2ec6bad1 = <b>Verze { "2" }.</b> Verze { "1" } kvalifikovala detektor už od { "3" } označených plavidel a zveřejňovala počty { "3" } a { "4" }. Verze { "2" } zvyšuje minimum označených plavidel na { "5" }, tedy na minimum pro zveřejnění, takže posouzení <c1/> nikdy nespočívá na menším počtu plavidel, než je číslo, pod nímž se počty zadržují. Tím se metoda zpřísňuje a žádný soubor verze { "1" } nebyl vydán.

seg-25593339aeb0 = <b>Známé příčiny falešně pozitivních výsledků</b>, které pravidlo podílu a prahy omezují, ale neodstraňují: plavidla v řekách, kanálech a přístavech blízko hrubé pobřežní čáry (proto existuje vnitrozemské pásmo { "2" } km); dvě plavidla sdílející jeden identifikátor, což vypadá jako skoky; transpondéry se špatnou polohou nebo zkušební vybavení; a pobyt pilotních a pátracích plavidel na místě, který může připomínat kruhy. Soubor pobřežní čáry v měřítku { "1" }:{ "10" } milionů je přesný asi na kilometr.

seg-ac661440a29a = Detektory skoků a rychlosti porovnávají hlášení v rámci jednoho vstupního souboru; stopa rozdělená mezi soubory či dny se nespojuje.

seg-05f789b26904 = <b>Paměť.</b> Vstup se čte po řádcích a nikdy se nedrží celý. ADS-B uchovává jen čítače na letadlo a buňku. AIS uchovává každé přijaté hlášení v kompaktním záznamu (asi { "40" } bajtů), dokud se jeho den nevyhodnotí, takže paměť roste s počtem hlášení AIS ve vstupu; velmi velký vstup AIS rozdělte po dnech.

seg-206c78a69ded = Expozice trasy

seg-0d8832796ab7 = <c1/> je GeoJSON LineString (samostatný, v Feature nebo ve FeatureCollection) nebo CSV řádků <c2/>. <c3/> přijímá soubory map nebo jejich adresáře a lze je opakovat. Body trasy se spojují přímkami v zeměpisné šířce a délce, takže dlouhé úseky zhustěte; úsek jde kratší cestou v zeměpisné délce, takže ten, který kříží antimeridián ({ "179.5" } E až { "179.5" } W), jej kříží. Trasa se dělí na části zhruba po { "250" } m. Každá část se měří mezi vlastními dvěma koncovými body na kouli o poloměru { "6371.0088" } km (toutéž cestou, která rozhoduje, v které buňce leží) a přiřazuje se buňce obsahující její střed.

seg-cc5e2553700b = Zpráva uvádí pro každý den a zdroj délku trasy a čtyři podíly, jejichž součet je { "1" }: <c1/>, <c2/>, <c3/> (buňka přítomna, ale bez posouzení) a <c4/> (buňka na mapě chybí). Poslední dva čtěte spolu s prvním: trasa s nízkým podílem zhoršených a vysokým podílem nepozorovaných nebyla prokázána jako čistá. Řádky ADS-B a AIS se hlásí odděleně a nikdy se nekombinují. Každý řádek nese licenci a uvedení původu mapy.

seg-3a087d90e317 = Knihovní funkce

seg-67ea1ff00bb8 = Pro volající, kteří drží data v paměti (vazby, server MCP, sestavení pro prohlížeč), modul <c1/> zpřístupňuje tytéž metody s textem či bajty na vstupu a JSON na výstupu, bez doteku souborů a bez sítě:

seg-4dbf41c0ec3b = Funkce

seg-95f87a38a522 = Vstup

seg-0fe8ff25f4a1 = Výstup

seg-9e99af2c1f84 = text CSV ADS-B

seg-e144f449c5b4 = jeden bajtový řez na soubor trasování readsb (gzip nebo prostý)

seg-7effd7110c4c = text CSV AIS, volitelně text GeoJSON souše

seg-10c5e0c0a9c8 = text trasy, texty GeoJSON map, volitelně meze <c1/>

seg-be00d23d96e9 = JSON <c1/>

seg-20a842d675c2 = <c1/> má <c2/> (<c3/>), <c4/> a <c5/> (dokument v1). <c6/> je <c7/> nebo <c8/>; <c9/> je { "0.5" }. Chyby jsou <c10/>. Pravidla datasetů (schválená přednastavení, vyžadovaný text licence, druh musí odpovídat) platí přesně jako na příkazovém řádku.

seg-1195686de09b = Externí validace

seg-0de37085f544 = <c1/> porovnává Kshanu s nezávislými implementacemi na syntetických vstupech, s tolerancemi předregistrovanými v <c2/>: významy kódů NIC a NACp proti dekódování syntetických rámců ADS-B pomocí pyModeS, hodnoty AIS „není k dispozici“ proti dekódování syntetických vět AIVDM pomocí pyais, přiřazení buňky mřížky proti shapely, délku trasy podle stavu buňky proti shapely a GeographicLib a vnitrozemské maskování proti shapely a pyproj. Pomocné soubory vytváří <c3/>; CI Python nepotřebuje. To ověřuje, jak se čtou kódy a hodnoty polí, a geometrii. Neověřuje to, že označená buňka je interference.

seg-56a3e955cbcc = Všechny testy používají syntetická generovaná data a žádnou síť: jednotkové testy v <c1/> a <c2/> pro příkazy od začátku do konce, včetně toho, že se žádný identifikátor nedostane do výstupu a že odmítnutí nezanechají žádné soubory.

seg-212c43d1a41c = <s1>Předchozí</s1>Tréninkové proudy NMEA

seg-7f13ee5d254e = <s1>Další</s1>Mapa interference: zdroje dat a licence

seg-1fc1794d9388 = Metoda ADS-B (kshana-interference-map/adsb/v2)

seg-a3a97ab49ed1 = Metoda AIS (kshana-interference-map/ais/v2)
