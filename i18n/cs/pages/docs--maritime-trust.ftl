# docs--maritime-trust: translations (cs)

seg-2247a2344710 = Význam

seg-6940543aa3c0 = řetězec

seg-abec93a4a488 = řetězec nebo null

seg-f5e7215e6835 = objekt

seg-b993ef559bd0 = Z kódu

seg-c353e7bec219 = Klíč

seg-0da78c80fb76 = <c1/>, <c2/>, <c3/> nebo <c4/>

seg-2896f449bffb = Zdroj: <c1/>

seg-342f34403ac5 = Námořní důvěra: může můstek tomuto fixu věřit?

seg-49b609a9655c = <c1/> dokáže pro <b>pohybující se plavidlo</b> počítat živou hodnotu důvěry 0-100 pro každý polohový fix z toho, co jakýkoli přijímač již vysílá na sběrnici (nejprve NMEA { "0183" }), a říci, které kontroly ji snížily. Je to softwarová vrstva vedle přijímače. Není to přijímač, nenahrazuje jej a nezpřesňuje fix.

seg-3c66739c9250 = <b>Software pouze poradního charakteru.</b> { -brand } není typově schválené navigační zařízení (IEC { "61108" }, IEC { "61162" }) a nebyl posuzován podle žádné výkonové normy. Jeho skóre a brána jsou pomůckou pro úsudek navigátora. Za bezpečnou navigaci plavidla a za jakékoli rozhodnutí spolehnout se na fix, nebo se na něj přestat spoléhat, zůstává odpovědný provozovatel.

seg-a9899ca66661 = Tato stránka říká, na co se kontroly dívají, co která z nich dokáže a nedokáže zachytit, jak je spustit živě a co brána dělá. Mapování skóre a každá výchozí hodnota jsou v <a1><c1/></a1>.

seg-05e79b6c5a58 = Co čte

seg-e784fdbe26e6 = Plavidlo se deklaruje v souboru relace, s mezemi uvedenými před během:

seg-e8e9ee2965cf = Věta

seg-e127f2f26824 = Čteno

seg-5e17bb4156f1 = GGA

seg-b38b8385ddcb = poloha, kvalita fixu ({ "0" } = žádný fix), výška nad střední hladinou moře, separace geoidu, HDOP

seg-870056f55c30 = RMC

seg-445c02505551 = stav (<c1/> platný, <c2/> neplatný), rychlost a kurz nad zemí, datum, režim

seg-8a259fc7b06d = VTG

seg-eb3e34f58751 = rychlost a kurz nad zemí, pokud je RMC neobsahuje

seg-add66711c27b = HDT, THS

seg-24e36e50b0ad = směr přídě (THS pouze tehdy, když jeho režim není <c1/>)

seg-bcfb4cd59951 = VHW, VBW

seg-fa0a0dae1510 = rychlost vůči vodě (VBW pouze tehdy, když je jeho stav <c1/>)

seg-774d1991fb0b = ZDA

seg-68d981999c72 = čas

seg-a0cc45088f5f = GSV

seg-0fad368a11cb = síla signálu každé družice (dB-Hz), elevace a azimut (pro geometrii)

seg-032eafc03b42 = GSA

seg-71334afb8a7d = faktor DOP (zhoršení přesnosti) a použité družice (pro geometrii, kde GSV nedává žádnou oblohu; a uvedené HDOP, s nímž hlídač porovnává)

seg-305f423d3ead = stav OSNMA, který přijímač nahlásil, převedený na tuto větu adaptérem, jenž přijímač čte: <c1/> ověřeno, <c2/> selhalo, <c3/> žádný výsledek

seg-7ce1d69e710e = Epochy, o nichž přijímač sám říká, že nejsou družicovým fixem (kvalita GGA { "0" } nebo { "6" } až { "8" }: odhadnutá, ruční, simulátor; stav RMC <c1/> nebo režim <c2/>, <c3/>, <c4/>, <c5/>), se pro kontroly polohy nepoužívají a nenesou žádný důkaz pro ani proti: přijímač to již řekl.

seg-a0ae80781c6e = Prvních <c1/> sekund tvoří základ a nikdy se nehodnotí. Každý monitor se dívá pouze na aktuální a dřívější epochy, takže rozhodnutí v dané epoše se nemění, když přijdou pozdější data, a živý proud dává stejné skóre jako týž text čtený ze souboru.

seg-068593ad0a52 = Co každá kontrola zachytí a co nedokáže

seg-094b90f0c701 = Směry mezi fixy (směr trati použitý kontrolou rychlosti otáčení, kurz plynoucí ze dvou poloh) jsou směrem tětivy mezi nimi, což je <b>střední azimut</b> geodetiky mezi fixy, nikoli přímý azimut v prvním fixu; ty se liší asi o polovinu sbíhavosti poledníků mezi fixy ({ "0.001" } stupně pro základnu { "260" } m na zeměpisné šířce { "59.5" } stupně).

seg-ed3cdfcfbff5 = Padělaná poloha musí souhlasit s fyzikou lodi a s dalšími senzory lodi. Každá kontrola porovnává fix s jedním z nich. Kontrola je tak nezávislá, jak je nezávislý její druhý zdroj: směr přídě z kompasu GNSS nebo „rychlost vůči vodě“ odvozená z GNSS není nezávislá na testovaném přijímači a nic nepřidává.

seg-9480aabf136e = Kontrola

seg-20e4f746c7e1 = Zachytí

seg-e7b2ebe5eabc = Nedokáže

seg-21ad9895f606 = skok polohy; trať, jejíž pohyb hlášená rychlost a kurz nevysvětlují; odvozenou rychlost, zrychlení nebo rychlost otáčení nad uvedenými mezemi plavidla

seg-dcbc6d4cd17f = odtažení, jehož hlášená rychlost a kurz sledují padělanou trať a zůstávají v mezích (přijímač je odvozuje z vlastního řešení, takže spolu souhlasí); příliš vysoko stanovenou mez rychlosti

seg-3542f83a7988 = trať, která se odchyluje od směru, kam loď míří, o více než uvedený úhel snosu

seg-75f4d659f716 = odtažení podél kurzu (kurz se nemění); směr přídě ze stejného přijímače nebo z kompasu GNSS; příčný snos nad tolerancí (falešný poplach); rychlosti pod <c1/>

seg-09dde82be447 = odtažení, které mění rychlost nad zemí vůči rychlosti vůči vodě

seg-6ac740e5f51c = log odvozený z GNSS; proud nad povolenou hodnotou (falešný poplach); odtažení pomalejší než povolená hodnota

seg-e85d5f0933b7 = výšku, která není tam, kde ji určují mořská hladina a uvedená výška antény

seg-3806e1d46332 = spoofer, který udržuje výšku věrohodnou; tolerance je široká, protože samostatná svislá chyba je velká; separace geoidu se zaznamenává, ale nekontroluje, protože v enginu není model geoidu

seg-5b70bd80640e = podpis jediného vysílače: C/N0 přes družice klesá společně nebo roste společně oproti kalibračnímu základu

seg-e6874a8047b1 = spoofer, který tvaruje výkon pro každou družici; cokoli, zatímco je podvržen sám základ; příliš pomalou kadenci GSV, než aby ji bylo možné sledovat

seg-371b17ce936a = čas přijímače, který skáče nepravidelně nebo běží zpět; vůči hodinám tohoto počítače čas přijímače, který se od nich odchyluje (pouze proudy v reálném čase)

seg-026479cb7966 = padělaný čas, který je konzistentní a stálý; hodiny, které jsou od začátku chybné

seg-906ab911b73d = nahlášené selhání autentizace OSNMA

seg-a04757b7ae57 = stav se čte, neověřuje; spoofer, který hlášení potlačí, není vidět

seg-c36c24a337b8 = odepření výkonu a ztrátu družic, jako ve statickém případě

seg-940b39a3988a = říkají, že prostředí je nepřátelské, nikoli že fix je chybný

seg-9d751e1f5938 = <b>Co monitory pouze s NMEA nedokážou.</b> Spoofer, který reprodukuje celou konstelaci se sebekonzistentní polohou, rychlostí, kurzem slučitelným se směrem přídě, věrohodným výkonem každé družice a souhlasnými hodinami, je neviditelný pro každou z výše uvedených kontrol: nic ve větách jeho fix nerozliší od skutečného. Stejně tak přehrání zaznamenaných skutečných signálů. Tuto mezeru uzavírají autentizace (OSNMA, nebo přijímač s vlastní ochranou proti spoofingu) a nezávislé navigační senzory; tato vrstva může využít pouze jejich nahlášený stav. Proud, který je podvržen již během tvorby základu, nemá čistý základ. Nepřítomnost alarmu není důkazem dobrého fixu.

seg-e3e09e2412fb = Skóre důvěryhodnosti

seg-a1c05079de2f = Každá epocha po kalibraci dostane skóre od { "0" } do { "100" } a důvody, proč není { "100" }: které kontroly odečetly body, jejich statistiku vůči prahu a jejich body. Pásma (hranice uvedené v relaci): <c1/> při { "90" } nebo více, <c2/> při { "55" } nebo více, <c3/> pod tím. Mapování, každá váha a její zdůvodnění jsou v <a1><c4/></a1>; je deterministické a stanovené před ohodnocením záznamu, bez učení a bez čehokoli přizpůsobeného událostem.

seg-d56822e82e3d = Každý výstup plavidla nese poradní prohlášení: klíč <c1/> výsledného JSON a každého živého řádku, první komentářový řádek <c2/> v CSV (čtečky jej přeskočí pomocí svého přepínače pro komentáře), <c3/> a patičku SVG. Výstupy dávkového běhu: <c4/> (s modelem skóre a odečty každé epochy), <c5/> (se sloupci <c6/> a <c7/>) a <c8/>, což je pro plavidlo trať hlášená přijímačem zbarvená podle pásma důvěry nad skóre v čase.

seg-918516588036 = Syntetická ukázka

seg-e6717d346ca6 = <c1/> obsahuje vymyšlený záznam NMEA z trajektu na trase Tallinn–Helsinki (50minutový výřez, asi { "17" } kn, { "1" } Hz: GGA, RMC, VTG, směr přídě z gyroskopu, log rychlosti, GSV s věrohodnou oblohou), v němž odtažení polohy odtahuje <em>hlášenou</em> polohu od skutečné polohy plavidla od { "1500" } s. Přijímač po celou dobu dál hlásí <b>platný</b> fix; klesá skóre důvěry, skrz pásmo degraded do pásma untrusted. <c2/> uvádí před během každý práh, meze plavidla a každou váhu skóre.

seg-b2f24e5091d0 = Záznam je <b>text zapsaný do souboru</b> příkazem <c1/>: nemodeluje žádný rádiový signál a nic nevysílá. Není to měření a trasa je ilustrativní, nikoli mapa. <c2/> připíná záznam a očekávaný výstup jako regresní pojistky na syntetických datech; nic nevypovídají o tom, jak si jakýkoli monitor vede na skutečné interferenci.

seg-26ab8544afba = Skóre důvěry během jednoho syntetického přechodu, ze skutečného běhu enginu v{ $version } na examples/maritime-trust (vymyšlený záznam NMEA z trajektu na trase Tallinn–Helsinki, { "3001" } epoch při { "1" } Hz). Tři dráhy sdílejí jednu časovou osu. Nahoře: vzdálenost mezi polohou hlášenou přijímačem a skutečnou polohou plavidla, která zůstává v rozmezí několika metrů do asi { "1576" } s, kdy ji skriptované odtažení polohy v záznamu odtáhne, zatímco přijímač dál hlásí platný fix. Uprostřed: skóre důvěry od { "0" } do { "100" }, nepočítané během prvních { "300" } s kalibrace, v pásmu nominal (alespoň { "90" }) do odtažení, poté klesající skrz pásmo degraded (alespoň { "55" }) do pásma untrusted. Dole: pásmo každé epochy jako barevná stuha s jeho názvem. Skóre je poradní. Software pouze poradního charakteru, nikoli typově schválené navigační zařízení (IEC { "61108" }, IEC { "61162" }): za navigaci plavidla zůstává odpovědný provozovatel. Záznam je vymyšlen, aby ukázal formát a monitory; není to měření a nic nevypovídá o tom, jak by si jakýkoli přijímač vedl.

seg-ed183c325c7e = Obrázek kreslí <c1/> ze skutečného běhu této ukázky (<c2/>); skóre je poradní a záznam je vymyšlený.

seg-8badaf0d8586 = Specifikace pohledu ve Studiu

seg-588092535a89 = Pro toho, kdo staví pohled Studia pro běh plavidla. Nic v této části ve Studiu zatím není implementováno; strana enginu (data níže) ano.

seg-5c34f31acf1d = <b>Vstupy.</b> Buď:

seg-57ca6d9000b1 = výsledný JSON dávkového běhu (<c1/>, nebo totéž přes <c2/> v balíčku WebAssembly s inline záznamem): <c3/> (hranice pásem, rampa, držení důkazů, každá váha), <c4/>, <c5/> a <c6/>, každá s <c7/>, <c8/>, <c9/>, <c10/>, <c11/> a od { "0.36" } <c12/> a <c13/> každého odečtu, s <c14/> a <c15/> na nejvyšší úrovni; nebo

seg-bfab64386b6c = živé řádky JSON (schéma výše), jeden objekt na epochu, připisované za běhu proudu. Každý řádek nese polohu <c1/> hlášenou přijímačem (schéma { "1.1" }).

seg-f7c7462d315e = Ukázková sada je <c1/>: <c2/>, <c3/> (záznam) a <c4/> (<c5/>: kde plavidlo skutečně bylo, což žádný skutečný záznam nemá). Pohled by měl spustit relaci a vedle ní číst soubor pravdy.

seg-c015c26cf30a = Co vykreslit.

seg-92f452bdbed6 = <em>Trať</em>, sever nahoře, jedno měřítko na obou osách: polohy hlášené přijímačem jako čára zbarvená podle pásma epochy (šedá calibrating, zelená nominal, jantarová degraded, červená untrusted), začátek a konec označené, měřítková úsečka. Pro ukázku skutečná trať jako tenká neutrální čára pod ní, aby se odtažení projevilo jako jejich rozcházení; přepínač skutečné trati a údaj o odchylce v metrech v čase kurzoru.

seg-3ba328e2188c = <em>Časová osa skóre</em>: skóre od { "0" } do { "100" } v čase, hranice pásem (<c1/>, <c2/> z <c3/>) jako čárkované čáry, pásmo jako proužek pod tím a počátek jakékoli uvedené události jako značka. Časová osa je sdílena s tratí.

seg-33447da1d56d = <em>Důvody</em>: pro epochu pod kurzorem odečty (monitor, poměr vůči prahu, body) jako vodorovné sloupce, od největšího, s váhou, kterou každý monitor nese z <c1/>; monitory, které běžely a nic nestály, vykreslené bledě, monitory, které neběžely (nejsou v <c2/>), uvedené jako „nespuštěno“, nikdy jako úspěšné. Monitor <c3/> nemá položku <c4/>: jeho strop je <c5/>.

seg-d0379b68ea67 = <em>Proužky monitorů</em>: jeden tenký proužek na každý monitor v <c1/> ukazující jeho poměr v čase (alarm při { "1" }), aby čtenář viděl, která kontrola se pohnula první.

seg-83d881ce6ab0 = <em>Stav brány</em>: v živém pohledu <c1/> každé epochy (<c2/>, <c3/>, <c4/>) jako proužek pod proužkem pásma a poslední <c5/>. V dávkovém pohledu jsou epochy, které by brána zadržela, ty, jejichž pásmo je untrusted, s uplatněným držením před uvolněním.

seg-b96652af3a03 = <em>Dráha geometrie</em> ({ "0.36" }): proužek pod proužkem pásma zbarvený podle <c1/> (zelená dobrá, jantarová degraded, šedá šrafovaná neznámá), v barevné rodině odlišné od drah nekonzistence a prostředí, s legendou „geometry: the sky, not the signal“. Odečty zbarvené podle <c2/> (geometrie, prostředí, nekonzistence) v panelu důvodů a v proužcích monitorů a počty epoch podle tříd z <c3/> vedle počtů pásem. Pro epochu pod kurzorem: <c4/>, <c5/>, HDOP, PDOP, VDOP, <c6/>, <c7/> a příznak, když je nastaveno <c8/> (odečet geometrie je pak nekonzistence). <c9/> se zobrazuje jako „geometry unknown: no GSV or GSA in the log“, nikdy jako dobrá. Prahy <c10/> a jejich původ z <c11/> jsou vedle nastavení skóre. Poradní poznámka zůstává.

seg-c48906d03f90 = <em>Fix hlášený přijímačem</em>: přijímač v ukázce hlásí platný fix po celou dobu (kvalita GGA { "1" }, stav RMC A); uveďte to v legendě, protože právě to je smyslem pohledu.

seg-869c8a92e2cf = <b>Interakce.</b> Jeden časový kurzor sdílený všemi panely (tažení, šipky a tlačítko přehrávání, které přehrává rychlostí 1x až 60x); najetí na trať nebo na kterýkoli proužek jej posouvá. Kliknutí na odečet zvýrazní epochy, v nichž byl tento monitor nad svým počátkem. Filtr pásem (zobrazit pouze epochy degraded a untrusted) a skok na první odečet a na první epochu untrusted. Text při najetí u každého názvu monitoru s jednořádkovým popisem z této stránky. Prahy a váhy relace se zobrazují, pouze pro čtení, vedle grafu, takže je na obrazovce vidět, co skóre použilo.

seg-1f97fe8ea2f1 = <b>Znění, které zachovat.</b> Stránka musí říkat, že jde o software pouze poradního charakteru a nikoli typově schválené navigační zařízení, že ukázka je syntetický text s vymyšleným odtažením a že fix bez alarmu tím ještě není dobrým fixem (viz omezení výše). Žádná hodnota na stránce by neměla vypadat jako měřítko toho, jak si kontroly vedou na skutečné interferenci.

seg-079ce44fd53e = Pro volající, kteří drží relaci i bajty v paměti (žádné soubory, žádné hodiny, žádné sockety; bezpečné pro WebAssembly), má <c1/>:

seg-e8c3172d72b8 = <c1/>: celý záznam ohodnocený jako dávkový běh; tentýž výsledek jako <c2/>, který se serializuje do výsledného JSON (<c3/>, <c4/>, <c5/> se skóre a odečty).

seg-0302b7c35fd3 = <c1/>: omezený kus proudu (nejvýše { "2" } MiB a { "20,000" } epoch a dostatečně dlouhý, aby obsáhl kalibrační okno), ohodnocený tak, jak hodnotí živý režim, a vrácený ve schématu živých řádků JSON (<c2/>, poslední <c3/>, souhrn počtů pásem, nejnižší a konečné skóre, čas první epochy untrusted). Čas přijímače se neporovnává s hodinami hostitele. Dlouho běžící živý režim (sockety, připisovaný soubor, brána) patří binárnímu souboru.

seg-d971dae93784 = Obojí vyžaduje relaci s <c1/>; její tabulka <c2/> je volitelná.

seg-870fece8026e = Spuštění naživo

seg-c132d449414f = Relace je tentýž <c1/> jako u dávkového běhu, s tabulkou <c2/>, která deklaruje <c3/>; její tabulka <c4/> není potřeba. Sériové porty se zatím neotevírají přímo: port čtěte nástrojem, který už používáte (<c5/> a <c6/>, terminálový server, multiplexor) a data předávejte rourou nebo přeposíláním. Přímý sériový vstup může přijít později.

seg-13a043c1ce60 = Každá dokončená epocha zapíše na stdout jeden řádek JSON:

seg-b1f0c563c94d = <c1/> je <c2/>, <c3/>, <c4/> nebo <c5/> (pásmo skóre, s hranicemi v tabulce <c6/> relace); <c7/> chybí během kalibrace; <c8/> uvádějí, které kontroly odebraly body a kolik, od největšího.

seg-9b21238a7dc1 = Schéma řádků JSON (verze { "1.1" })

seg-79306ff2d878 = Jeden objekt JSON na dokončenou epochu, klíče v tomto pořadí:

seg-a129b9e613d0 = Typ

seg-bbcdd898d24d = celé číslo

seg-96958263575f = počet nahlášených epoch, od { "1" }

seg-16022703e1c0 = číslo

seg-95dde7698840 = sekundy od první epochy proudu

seg-dee4f7b91079 = čas epochy tak, jak jej proud uvádí (UTC podle ISO-8601 s datem, jakmile byla spatřena věta RMC, jinak <c1/>)

seg-0361f40a8e59 = číslo nebo null

seg-c2418289d966 = { "0" } až { "100" }, jedno desetinné místo; null během kalibrace nebo když <c1/> říká, proč nebylo možné žádné vytvořit

seg-00575e5df2e1 = pole

seg-54c1f879643b = <c1/>, od největších bodů; <c2/> je statistika vůči prahu (alarm při { "1" } nebo více); uvedeny jsou pouze monitory, které stály body; <c3/> <em>(přidáno ve verzi { "1.3" })</em> je <c4/>, <c5/> nebo <c6/>

seg-24d178dfb34f = pole řetězců

seg-30948e769405 = monitory na svém prahu nebo nad ním

seg-fb08af60656f = <c1/>, <c2/> nebo <c3/>

seg-495aa49df7e2 = proč nebylo skóre vytvořeno (například deklarovaný senzor směru přídě chybí)

seg-3dabfd59cf4b = objekt nebo null

seg-9395d2543ac0 = <em>(přidáno ve verzi { "1.1" })</em> poloha, kterou přijímač v této epoše hlásil, <c1/> (výška elipsoidická tam, kde věta uvádí separaci geoidu, jinak nad střední hladinou moře); null, když přijímač žádnou nedal, včetně kalibračních epoch bez fixu

seg-3af4806d7d74 = <em>(přidáno ve verzi { "1.2" })</em> čím tento software je a čím není: poradní, nikoli typově schválené navigační zařízení, odpovědný zůstává provozovatel

seg-79adcc5ee873 = <em>(přidáno ve verzi { "1.3" })</em> geometrie družic: <c1/> (<c2/>, <c3/>, <c4/>, když proud nemá elevace a azimuty GSV a nemá GSA), <c5/> (<c6/>, <c7/>, <c8/>, <c9/>), <c10/> (<c11/>, <c12/>, <c13/>), <c14/>, <c15/>, <c16/>, <c17/>, <c18/>, <c19/>, <c20/>, <c21/>, <c22/>, <c23/>, <c24/>, <c25/> (družice v dohledu, ale nesledované, zatímco DOP v dohledu je dobrý: odečet geometrie je pak <c26/>), <c27/> (<c28/>, <c29/>, <c30/>, <c31/>: vždy hlášeno, nikdy nehodnoceno; skóre odečítá pouze za <c32/>) (viz <a1><c33/></a1>)

seg-fc212411bf3c = Názvy monitorů (kebab-case; { "17" }): <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/> a od { "1.3" } <c17/>. V pozdějších verzích mohou přibýt nové názvy; příjemci by měli neznámý název monitoru považovat za monitor. Rozvržení <c18/> níže nese verzi formátu ve svém prvním poli; toto schéma JSON je verze { "1.3" }: { "1.1" } přidala <c19/>, { "1.2" } <c20/>, { "1.3" } <c21/> na konec a <c22/> v každém odečtu a mění se pouze přidáním klíčů na konec.

seg-0019bf7fbfcd = Vstup autentizace

seg-39b3dfbd97cc = Monitor <c1/> přebírá stav autentizace jednotlivých družic od zdroje autentizace přes <c2/> (seznam <c3/>, stav <c4/>, <c5/> nebo <c6/>), vedle celkového <c7/>. Na straně NMEA totéž nese <c8/>, například <c9/>. Jakékoli selhání, celkové nebo u jedné družice, spustí alarm monitoru a stojí celou jeho váhu (dostane poměr { "1.5" }); úspěch není důkazem. { -brand } zde nic neověřuje: za hlášený stav odpovídá zdroj, který ověřuje.

seg-8ffc94901796 = Epocha je dokončena, když přijde další časovaná věta; věty pomalejších nebo nesynchronizovaných přístrojů (gyroskop několik desetin sekundy za přijímačem), které dorazí před tím, k ní patří. Pokud proud po dobu <c1/> (výchozí { "1.5" } s, nastavte nad nejdelší mezeru mezi časovanými větami vašeho přijímače) stojí, epocha se dokončí tak, jak je. Prvních <c2/> sekund proudu tvoří základ a nikdy se nehodnotí, takže <b>proud, který je již podvržen v okamžiku prvního připojení, nemá čistý základ</b>: spusťte vrstvu před plavbou, nebo když je o fixu známo, že je dobrý. Kalibrační okno se uzavře jednou, podle příchodu: epocha, jejíž čas je dřívější než již spatřený čas (přetočení, přehrání začátku proudu), není nikdy kalibrací, ať její čas říká cokoli; hodnotí se s plným odečtem <c3/>, což je untrusted. Živý engine hodnotí každou epochu přes kalibrační epochy a poslední zhruba minutu proudu, takže jeho náklady na epochu rostou s <c4/> krát frekvence epoch; na rychlém přijímači držte okno krátké. Jeho vyrovnávací paměti jsou omezené (záplava řádků bez časované věty se dokončí každých { "5,000" } řádků, kalibrace a historie jsou omezeny na { "20,000" } epoch).

seg-2ef5aad7c750 = Čas přijímače se také porovnává s monotónními hodinami tohoto počítače, což má smysl pouze pro proud přicházející v reálném čase. Uložený záznam přiváděný plnou rychlostí přes stdin, TCP nebo UDP tuto kontrolu už konstrukcí spustí: použijte <c1/>. (<c2/> bez <c3/> to již předpokládá.) <c4/> se čte jako přehrání, dokud není přečten do konce, a hodiny hostitele se zapojí až od té chvíle, takže nahromaděná data se nečtou jako chyba hodin; kontrola pak vyžaduje, aby kalibrační okno bylo stále otevřené (jinak nemá základ a neběží).

seg-a06e58b2cfc8 = Konce proudu a poruchy: stdin a soubor čtený do konce skončí normálně (kód { "0" }). Spojení TCP uzavřené protistranou není normálním koncem pro proud, který má pokračovat: vrstva po ohodnocení a zapsání všeho přijatého skončí s nenulovým kódem a znovu se nepřipojuje, takže ji spouštějte pod dohledem, který ji restartuje. Datagramy UDP, které větu rozdělí, se spojují; čtečky stdin, souboru a TCP mají za sebou omezenou frontu, která tlačí zpět na odesílatele (nic se neztratí), zatímco UDP, které zpět tlačit nemůže, zahazuje datagramy, které engine nepřijme, a hlásí to na stderr. <c1/> se naváže na adresu loopback; pro naslouchání jinde zadejte <c2/> (vypíše se varování).

seg-0a0ed5e74ea4 = <c1/>: proprietární věta

seg-71ccf4a80c99 = Každá epocha také vytvoří jednu větu NMEA { "0183" } s platným kontrolním součtem, kterou <c1/> zapisuje do souboru nebo na stdout a kterou brána vkládá do předávaného proudu:

seg-df9382f4b055 = <c1/>: verze formátu

seg-6986879f86fb = čas UTC epochy, <c1/>; prázdné, pokud proud žádný nedal

seg-34418696f9d2 = skóre důvěryhodnosti { "0" } až { "100" }, jedno desetinné místo; prázdné během kalibrace nebo když žádné nebylo možné vytvořit

seg-0b249ba73868 = pásmo: <c1/> calibrating, <c2/> nominal, <c3/> degraded, <c4/> untrusted

seg-281aba68405a = brána: <c1/> vypnuto, <c2/> propuštěno, <c3/> zadrženo (fix byl v předávaném cyklu označen za neplatný)

seg-f306c3f54a48 = až dva důvody, <c1/> spojené znakem <c2/>; prázdné, pokud nebylo nic odečteno

seg-4bee29dfe578 = Adresa je <c1/> + výrobní mnemonik <c2/> + <c3/>. Zařízení, které proprietární větu nezná, ji ignoruje. { -brand } vlastní <c4/> na vstupu ignoruje.

seg-d75c9da94f37 = Režim brány

seg-30c1f4a5706c = <c1/> staví { -brand } mezi přijímač a zařízení, které jeho fix používá (kartografický systém, systém řízení trati). Proud NMEA vstupuje, vychází na stdout a je:

seg-aa0692146620 = <b>předán beze změny</b>, dokud epocha není untrusted (a během kalibrace), s větou <c1/> po každém cyklu vět; a

seg-bbdd68edbb17 = <b>označen za neplatný</b>, dokud je untrusted: kvalita GGA <c1/>; stav RMC <c2/> (a jeho indikátor režimu <c3/> a navigační stav <c4/>, kde jsou přítomny); režim GNS <c5/> v každé poloze; stav GLL <c6/> a režim <c7/>; režim VTG <c8/>, kde jej má. Pole polohy zůstávají tak, jak byla: smyslem je, že zařízení vidí, jak přijímač sám prohlašuje fix za neplatný, a spustí vlastní alarm. U každé přepsané věty se kontrolní součet přepočítá.

seg-23ee46747297 = Jakmile je fix zadržen, uvolní se až poté, co epochy byly mimo pásmo untrusted po dobu <c1/> (výchozí { "30" } s), takže skóre na hranici pásma nemůže způsobit blikání fixu. Řádky JSON jdou pouze tam, kam říká <c2/> (ve výchozím nastavení nikam, protože stdout má proud).

seg-6b7b557a4909 = Aby se mohl kartografický plotter připojit přímo, nabídněte filtrovaný proud přes TCP místo stdout:

seg-96ff51df9abe = <c1/> naslouchá na adrese loopback; <c2/> naslouchá jinde (vypíše se varování, protože kdo se k adrese dostane, může proud číst). Může se připojit libovolný počet klientů; každý dostává týž proud od okamžiku připojení a klienti pouze čtou. Každý klient má vlastní omezenou frontu a zapisovač, takže klient, který nestíhá, je odpojen (spojení uzavřeno, řádek na stderr) a nikdy nezdržuje ostatní ani vstup. <c3/> vyžaduje <c4/>; stdout pak z proudu nenese nic, takže <c5/> je volné.

seg-960e0abb0466 = Co brána nedělá a co vědět, než ji použijete:

seg-ee3f18efa84c = Je <b>volitelná</b>. Nic neoznačí fix za neplatný, pokud není zadáno <c1/>.

seg-9cd8243cb437 = <b>Přidává latenci</b>: cyklus se drží, dokud není ohodnocena jeho epocha, což je doba do další časované věty (asi jeden cyklus: sekunda u přijímače { "1" } Hz), nebo <c1/> po poslední větě, když proud stojí. Zařízení, které potřebuje větu do několika desítek milisekund od výstupu přijímače, za ní nesmí stát.

seg-ec63f8f3230b = Je <b>jediným bodem v řetězci</b>: když se zastaví, zastaví se proud. Provozujte ji pod dohledem a předem rozhodněte, co následující zařízení dělá bez proudu.

seg-536e41a6a5e7 = <b>Při vlastních poruchách selhává do bezpečného stavu</b>: pokud monitory po kalibraci nedokážou vytvořit skóre (deklarovaný senzor směru přídě, který nic neposílá, příliš málo kalibračních epoch), epocha je untrusted, nese <c1/> a je zadržena; držení před uvolněním se měří na hodinách tohoto počítače, nikoli na čase přijímače, což je to, co spoofer ovládá (u přehrání existuje pouze čas přijímače).

seg-5dd62cd853c6 = Může <b>zadržet dobrý fix</b> (falešný poplach), stejně jako propustit podvržený (nezachycená událost). Monitory kontrolují fix proti fyzice lodi a jejím dalším senzorům; padělek, který se všemi souhlasí, není vidět (viz omezení níže).

seg-a284a3ec9dfe = Očekává <b>čistý textový proud NMEA { "0183" }</b>. Binární rámce smíšené do proudu se předávají beze změny, ale věta <c1/> pak může přistát mezi bajty rámce.

seg-0c919698fa92 = <b>Není typově schválená</b> a nic v ní nebylo posuzováno podle IEC { "61108" } ani IEC { "61162" }. Za navigaci plavidla zůstává odpovědný provozovatel.

seg-9e3ea39c38cf = <s1>Předchozí</s1>Důvěra v přijímač

seg-136da5c10b2d = <s1>Další</s1>Tréninkové proudy NMEA

seg-990a49527516 = $PKSHT: proprietární věta
