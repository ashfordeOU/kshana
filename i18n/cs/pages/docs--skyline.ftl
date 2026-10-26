# docs--skyline: translations (cs)

seg-f917e7fcac09 = Co to je

seg-6c6e7248496f = Geometrie oblohy

seg-379f49bff6fb = Python

seg-2bd2101ce454 = Povrch

seg-ad856ad710eb = Stav

seg-cbf0f9bcd2d8 = Orákulum

seg-6e0cb6acc073 = VALIDATED

seg-c14b8fe46517 = Maska obzoru závislá na azimutu: viditelná množina, azimut a elevace a DOP pod maskou

seg-bbb1828b3db1 = Redukce městského kaňonu, sektorů a terénu na tabulku

seg-2c53381d48ae = Horizontální chybová elipsa a kofaktor pro jednotlivé systémy z kovariance geometrie

seg-de6c33774c9c = CLI

seg-b03d56f501c3 = Druh

seg-4dbf41c0ec3b = Funkce

seg-d1e9715513b4 = Příklad

seg-587beeccaa11 = Předvolba

seg-98f4f946a7ac = WASM

seg-2b0d77219437 = Předvolby

seg-7338b6210228 = Řádek

seg-be2f66de7d07 = Zdroj: <c1/>

seg-3cb660ef6b03 = Masky skyline a geometrie oblohy

seg-724f72bdfa36 = Do verze { "0.36" } byl každý test viditelnosti vůči Zemi v enginu jediným elevačním prahem, <c1/>: družice se počítala, když byla na jednom čísle nebo nad ním, bez ohledu na směr. Ulice, nábřeží, fjord nebo jeřáb část oblohy zakrývá a zbytek ponechává otevřený. <b>Skyline</b> je elevační řez závislý na azimutu; <b>funkce geometrie oblohy</b> mění stanoviště, čas, konstelace a skyline na viditelnou množinu, faktor zhoršení přesnosti (DOP), kovarianci geometrie, horizontální chybovou elipsu, mrak Monte Carlo a skyplot. Návrh je <c2/> (položky { "1" } a { "2" }).

seg-4c1bc0b37f54 = Důkazy: rozhodnutí o viditelnosti s maskou (geodetické úhly pohledu, tabulková maska, viditelná množina a její DOP) je <b>VALIDATED</b> vůči Orekitu { "12.2" } a gnss_lib_py { "1.0.4" } v předregistrovaném porovnání, stejně tak chybová elipsa a kofaktor podle systému (numpy, předregistrováno); redukce kaňonu, sektorů a terénu, předvolby a ostatní funkce geometrie oblohy jsou <b>MODELLED</b> (<a1>Důkazy</a1>). Skyline odstraňuje družice v přímé viditelnosti, a nic víc. Předvolby jsou REPREZENTATIVNÍ geometrie, nikoli zaměření.

seg-6fa3291b70e3 = Skyline

seg-08585dd55bb5 = Skyline je bodové maximum čtyř popisů. Azimut je v stupních po směru hodinových ručiček od pravého severu v místní soustavě východ–sever–nahoru stanoviště; elevace jsou v <c1/>.

seg-9d0e2b0a469f = TOML

seg-3dbc7ff9f5ab = Tabulka

seg-a67486e7d10e = Elevace lineárně interpolované v azimutu, zacyklené na { "360" }°. Azimuty striktně rostoucí v <c1/>; nejvýše { "3600" } řádků.

seg-bc12ba94381f = Ulice (kaňon)

seg-23066e2eb509 = Dvě přímé rovnoběžné stěny (níže).

seg-821762272e2f = Sektory

seg-7387a718a7c3 = Ostře ohraničené intervaly po směru hodinových ručiček od <c1/> (včetně) do <c2/> (mimo), které mohou procházet severem; nejvýše { "360" }.

seg-2768e3772b56 = Terén

seg-5a5c08a77b86 = Body převedené na tabulku: elevace <c1/>, s poklesem zakřivením pro <c2/> (zvolená, uvedená konstanta). <c3/> je nad anténou.

seg-fb86c0db0c90 = <c1/> vychází z pojmenované geometrie; pole kaňonu pak přepisují kaňon předvolby pole po poli a <c2/>, <c3/> a <c4/> se k ní přidávají.

seg-0d76504a1d74 = Parametr přijímače <c1/> si zachovává svůj význam: je to plochý skyline. Efektivní práh při azimutu <c2/> je <c3/> a družice je viditelná, když je její elevace <b>na něm nebo nad ním</b>: stejné <c4/>, jaké vždy používala plochá maska. Družice nad <c5/>, ale pod skyline, je <b>zakryta skyline</b>.

seg-f7fd13e569e3 = Ulice (kaňon)

seg-290f563c1ff7 = Ulice vede podél azimutu <c1/>, <c2/> metrů mezi stěnami, anténa <c3/> metrů nad zemí na ose. Podél azimutu <c4/>, s <c5/>, paprsek dosáhne stěny po <c6/>, takže stěna o výšce <c7/> zakrývá od

seg-8662708f4f32 = Otevřený pruh leží podél ulice. S <c1/> (anténa uprostřed) paprsek odchází otevřeným koncem a stěna nezakrývá nic, když platí <c2/>. Stěna ne vyšší než anténa nezakrývá nic. <c3/> je ve výchozím stavu { "1.5" } m (střecha auta nebo ruční přijímač, zvolená hodnota); nový kaňon potřebuje <c4/>.

seg-1eeff52ea5a5 = Zvolené a uvedené rozměry (z návrhové poznámky), nikoli zaměření skutečného místa. <c1/> vypíše jednu z nich s jejím původem a jejím řezem po každém stupni.

seg-13e8e5460280 = Geometrie

seg-6d71c5cbe104 = Kaňon: ulice { "0" }°, šířka { "20" } m, stěny { "30" } m a { "30" } m, anténa { "1.5" } m. { "70.7" }° napříč ulicí, otevřeno podél ní.

seg-ab3415ff8811 = Poměr výšky k šířce { "1.5" }, uvnitř pásma { "0.5" }–{ "2" } poměrů stran městských kaňonů v práci Oke ({ "1988" }), <em>Street design and urban canopy layer climate</em>, Energy and Buildings { "11" }, { "103" }–{ "113" }.

seg-e331f02251f8 = Sektory: otevřeno k moři v rozmezí { "090" }–{ "270" } ({ "180" }°); budovy na nábřeží { "8" }° v rozmezí { "315" }–{ "045" } ({ "90" }°); vlnolam a jeho maják { "3" }° v rozmezí { "045" }–{ "090" } a { "270" }–{ "315" }.

seg-6926e1bfc55d = Zvolené hodnoty (například sklady o výšce { "40" } m asi { "285" } m daleko).

seg-f13d4df9a42c = Terén: stěny { "600" } m nad anténou ve vzdálenosti { "1500" } m na obě strany od kanálu sever–jih, jeden bod na stupeň (při <c1/> m), použit pokles zakřivením. { "21.8" }° napříč, pod { "1" }° podél osy.

seg-4d3dedbe4491 = Řádově odpovídá šířce a reliéfu hlubokých západonorských fjordů (Holtedahl ({ "1967" }), <em>Notes on the formation of fjords and fjord-valleys</em>, Geografiska Annaler 49A, { "193" }–{ "203" }).

seg-51f5219cb050 = Sektory: kontejnerové stohy { "12" }° v pevninské polovině { "000" }–{ "180" }; ramena jeřábů { "35" }° v rozmezí { "245" }–{ "255" } a { "25" }° v rozmezí { "285" }–{ "295" }; jinde otevřeno k vodě.

seg-a568ae949c3b = Pět kontejnerů ISO { "668" } high-cube ({ "14.5" } m) asi { "60" } m od antény ve výšce { "2" } m; rameno asi { "50" } m nad nábřežím ve vzdálenostech { "70" } m a { "100" } m, řádově jako u jeřábu typu post-Panamax. Sektor jeřábu je neprůhledný.

seg-65b1b45c787f = Ve scénáři

seg-e489759bbd65 = Nepovinná sekce <c1/> nad vlastním prahem daného druhu:

seg-f98345079e70 = Co skyline mění

seg-cbe2f5ae721f = Pro každý vzorek

seg-7368ea5c4b79 = <c1/> (s <c2/>)

seg-fde216d940fb = Časová osa viditelnosti (dostupnost GNSS) a souhrn DOP.

seg-7f6b2fcda681 = <c1/> (s <c2/>)

seg-8fafdb892253 = Družice, které používají RAIM a ARAIM (<c1/>).

seg-c0156fd1c895 = Družice, jejichž pseudovzdálenosti se simulují a používá je RAIM.

seg-d7fa5e5cf33d = Družice, které přijímač dokáže sledovat, před rušením.

seg-86caf3ae19ad = Množina viditelných družic každého režimu nad maskou každého systému, včetně polárního průchodu (stejný skyline na každém stanovišti). Obálka režimu Doppler a navržený jednotlivý přelet jsou meze toho, co musí přijímač zvládnout, a zachovávají masku každého systému.

seg-20d2e86d17bc = Které epochy se počítají jako nad maskou, doba nad ní, družice v porovnání GNSS.

seg-ed5bbd6b2c46 = <c1/> (výcvikové NMEA)

seg-d0eb9fd84d24 = Družice ve zprávě GSV a v řešení polohy. Azimuty jsou skutečné směry vztažené k zemi, nikoli kurz plavidla.

seg-56cc8ae30218 = <b>Pozemní stanoviště pro <c1/> a <c2/>.</b> Oba druhy modelují obíhajícího uživatele s geocentrickou elevací a bez azimutu vázaného k Zemi, takže skyline přijímají jen v režimu pozemního stanoviště z návrhové poznámky: <c3/> místo <c4/> (právě jedno z obou). Každý vzorek je jeden absolutní okamžik, <c5/>: každá družice se k němu propaguje (sada elementů, broadcast efemeridy nebo soubor SP3 se posouvá od vlastní epochy, družice Walker se počítá <c6/> od <c7/>) a převede se do zemského pevného systému v tomto okamžiku, takže stanoviště vidí jednu konzistentní oblohu. <c8/> je vlastní epocha scénáře oběžné dráhy; bez ní (a vždy pro <c9/>, který ji nemá) je to nejnovější epocha mezi družicemi, které nějakou nesou, nebo J2000 pouze pro vzory Walker. Elevace a azimut jsou geodetické (WGS-84). Horizontální a vertikální rozdělení ochranných úrovní ARAIM druhu integrity a Stanfordovy vertikální chyby používá stejný geodetický směr nahoru (normálu elipsoidu WGS-84, asi { "0.19" }° od geocentrického radiálního směru při šířce { "45" }°); snímkový RAIM jej už používal. <c10/> bez skyline je obyčejný pozemní uživatel; cesta obíhajícího <c11/> zůstává beze změny.

seg-fae979b3b96f = <b>Zpětná kompatibilita.</b> Bez sekce <c1/> je scénář bajtově shodný s tím, co tentýž engine dával předtím, než kód skyline existoval: <c2/> kontroluje JSON, graf a souhrn každého dodávaného scénáře, který některý z těchto druhů spouští, a text NMEA každého výcvikového scénáře proti digestům SHA-256 základu „{ "0.36" } portable“ (digesty z commitu vydání { "0.35.0" }, znovu stanovené, když engine přešel na přenositelnou matematiku, a uchované v testu jako záznam: <c3/>). Prázdná sekce <c4/> nezakrývá nic; výsledek se pak rovná běhu bez ní, až na přidaný blok <c5/> a nulové počty <c6/>.

seg-fe88e0ad01e9 = <b>Co se odmítá</b>, s důvodem ve zprávě: skyline na obíhajícím <c1/>; <c2/> a <c3/> současně; neznámá předvolba; kaňon bez <c4/>; tabulka, která není striktně rostoucí v <c5/>; elevace mimo <c6/>; prázdný sektor; nekladná vzdálenost terénu; vstup nad limity; jakýkoli neznámý klíč.

seg-d1b10a0c833f = <b>Výsledek</b> získá <c1/>, je-li sekce přítomna: <c2/> je <c3/>, <c4/> nebo <c5/>; <c6/> je zlomek prostorového úhlu horní polosféry nad <c7/> (průměr <c8/> přes azimut: { "1" } pro nulovou masku, { "0.5" } pro plochý řez { "30" }°); <c9/> je řádek předvolby nebo vlastní řádek scénáře. Jednotky a třídy původu jsou v bloku <c10/>.

seg-0842c1133eb5 = Přibalené příklady (<c1/>):

seg-5f77a52314c7 = Co ukazuje (pro porovnání odeberte sekci <c1/>)

seg-523f8c1a7912 = GPS + Galileo na dně <c1/>: { "17" } z { "289" } vzorků si zachovává řešení polohy, střední PDOP { "70.5" } ({ "1.14" } pod otevřenou oblohou).

seg-6c5618dce8ab = Dvoukonstelační ARAIM při vjezdu do přístavu: { "70" } epoch družic skryto, dostupnost beze změny ({ "145" } ze { "145" }).

seg-36254db521fd = Pseudovzdálenosti a RAIM na nábřeží: { "44" } epoch družic skryto; dostupnost RAIM { "0.59" } ({ "0.85" } pod otevřenou oblohou).

seg-6b0f8b4c700f = Rušička { "2" } W v přístavu: { "83" } epoch družic skryto, sledování beze změny (rušička je převzala).

seg-22ceab915271 = GPS + Galileo + vrstva LEO ve fjordu: střední fúzní PDOP { "1.14" } ({ "0.93" } pod otevřenou oblohou).

seg-f940e764e244 = Kaňon <c1/> jako plochý řez { "35" }° a jako <c2/> otočený podle kurzu vozidla: { "8" } oproti { "4" } až { "5" } družicím GPS a Galileo; střední fúzní chyba { "2.1" } m v obou případech; poplach { "1.5" } m při { "51" } % a { "59" } % epoch.

seg-6aa4ec7e4058 = Pět funkcí enginu (<c1/>), na každém rozhraní stejných:

seg-4d6a793b2794 = Vstup → výstup

seg-c99f58f1ccd2 = pro každou družici <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>; <c8/>, <c9/>, <c10/>; <c11/> (GDOP, PDOP, HDOP, VDOP, TDOP, <c12/>); <c13/>, <c14/> (jednotkový rozptyl), <c15/>; <c16/> a <c17/> při požadované spolehlivosti; <c18/>, <c19/>, <c20/>

seg-a5b914aac404 = <c1/> (nejvýše { "5000" }, vstupní limit) chyb metodou nejmenších čtverců při nezávislých gaussovských chybách vzdálenosti <c2/> z proudu ChaCha8 inicializovaného <c3/>: <c4/>, empirická kovariance, horizontální a 3D RMS vedle <c5/> a <c6/>, podíl uvnitř elipsy { "95" } %

seg-f435ee3b8709 = předvolby s označením, popisem, původem, řezem po každém stupni a <c1/>

seg-1937af5fa347 = sekce skyline převedená na 360záznamovou tabulku, kterou engine používá, s <c1/>, <c2/>, <c3/>

seg-f16a1f2de329 = skyplot jako statické SVG (bez skriptu, bez externí reference, každý vstupní řetězec ošetřen escapováním)

seg-c802cf2a2e30 = Požadavek:

seg-c3c44c1967ba = <c1/> jsou předvolby konstelací enginu (<c2/>: <c3/>, <c4/>, <c5/>, <c6/>, ...; předvolby LEO <c7/>, <c8/>, ...) nebo úplná tabulka <c9/> <c10/>, propagovaná do <c11/> (keplerovská se sekulárním J2, dráhy společného režimu <c12/>). Jejich relativní fáze pocházejí z různých referenčních epoch, takže obloha je <b>reprezentativní geometrie, nikoli obloha toho data na tom místě</b>. Družice lze místo toho (nebo také) zadat přímo: <c13/>, nebo s <c14/> a <c15/> či <c16/>. Výchozí hodnoty: maska každého systému ({ "5" }° GNSS, { "10" }° LEO; { "5" }° pro přímo zadané družice), jedny hodiny přijímače na systém (<c17/> pro jedny sdílené hodiny), <c18/> { "1" } m (reprezentativní řádek rozpočtu dvoufrekvenčního příjmu), spolehlivost { "0.95" }. Vstupní limity: nejvýše { "2000" } družic nad horizontem (systémová tabulka žádající více je odmítnuta dříve, než je sestavena) a { "16" } hodin přijímače.

seg-6408f9b02ccb = Datovaná obloha ze sad elementů.

seg-7724e4ecafee = <c1/> přijímá text dvouřádkových sad elementů (řádek s názvem před každou sadou je nepovinný; nejvýše { "4" } MiB, vstupní limit), propagovaný SGP4 enginu (WGS-72, propagátor, který používá <c2/>) do <c3/> plus <c4/>, převedený do zemského pevného systému s UT1 převzatým jako UTC a bez pohybu pólu a viděný z <c5/>. <c6/> je UTC ISO { "8601" } (<c7/>) a datuje pouze sady elementů (předvolby datum nenesou, takže <c8/> bez <c9/> je odmítnuto); <c10/> je označuje pro hodiny podle systému (výchozí <c11/>). Každý výsledek říká, jaká obloha to je, v <c12/> a <c13/>:

seg-13a8b4ac40f9 = Obloha

seg-c0bde35f9442 = předvolby konstelací enginu: reprezentativní geometrie

seg-d368b50280cc = sady elementů propagované k uvedené epoše: obloha, kterou tyto sady elementů k té epoše dávají, nikoli její měření (jejich vlastní přesnost je přesnost SGP4 a stáří sad)

seg-0bc07825a9b5 = bez <c1/>: sady elementů propagované k vlastní epoše nejnovější sady plus <c2/>, reprezentativní obloha

seg-1230388da233 = družice zadané přímo, tak, jak jsou uvedeny

seg-1a30004a7f9e = Směs je spojí pomocí <c1/>. <c2/> je okamžik, ke kterému byly sady elementů propagovány, a <c3/> jmenuje, co z textu nebylo použito, s důvodem: poškozené nebo osiřelé řádky sad elementů (s čísly řádků), sady, které parser odmítl, a sady, které SGP4 nemohl k tomu okamžiku propagovat (zanikly nebo jsou za svými mezemi); celkem nejvýše { "100" } záznamů, poté jeden poslední záznam počítající zbytek. Prázdný seznam <c4/> nepřidává žádné předvolby. Skyplot uvádí svůj základ v patičce.

seg-8560c13c7ea3 = <b>Jedno jádro.</b> Kofaktorová matice je <c1/>, sestavení návrhové matice a Gaussova–Jordanova inverze za <c2/>. <c3/> zpřístupňuje kovarianci a <c4/> je její redukce, takže skaláry VALIDATED zůstávají nezměněny a stále je zafixuje <c5/>. Neexistuje druhá implementace DOP.

seg-cb1be3e04419 = <b>Elipsa.</b> Poloosy <c1/> pro vlastní čísla <c2/> východo-severního bloku, s <c3/> (<c4/> při { "95" } %, { "1" } při { "39.35" } %) a azimut hlavní osy <c5/> v <c6/> od severu.

seg-96062e2cfed1 = Vstupní body

seg-f8dc86bd9da2 = <c1/> nebo <c2/>, s <c3/> nebo <c4/>; <c5/>

seg-d5b5bdf6081c = Rust

seg-8d0f99ed4837 = <c1/>, <c2/> týchž názvů

seg-40a7552d2ba9 = MCP

seg-42f0fe3b42ab = <c1/> (<c2/> nebo <c3/>); přes MCP žádné Monte Carlo (hromadné vzorky, které má agent shrnout, nikoli přenášet)

seg-9d04c658b37a = Každý výsledek nese <c1/> (MODELLED), <c2/> (geometrie za uvedeného modelu chyb: nezávislé, stejné gaussovské chyby vzdálenosti s nulovou střední hodnotou; nikoli předpověď skutečné chyby přijímače, která má také systematické chyby, vícecestné šíření a chyby bez přímé viditelnosti; nikoli mez integrity) a poradní sdělení: <em>Software pouze poradního charakteru, nikoli typově schválené navigační zařízení (IEC { "61108" }, IEC { "61162" }): za navigaci plavidla zůstává odpovědný provozovatel.</em>

seg-0e1285fdfe52 = Pět řádků registru (<c1/>), tak jak je vymezuje návrhová poznámka:

seg-1aa76286f152 = Orekit { "12.2" } (úhly pohledu <c1/>, <c2/>) s gnss_lib_py { "1.0.4" } (<c3/> a matice DOP), předregistrováno v <c4/> (commit e4b9d912) dříve, než byl kterýkoli z nich spuštěn: { "1173" } úhlů pohledu na šesti stanovištích a ve čtyřech epochách, šest tabulek, { "142" } viditelných množin; nejhorší elevace { "1.3e-13" }°, azimut { "2.3e-13" }°, maska { "1.1e-12" }° oproti { "1e-9" }°; shodné viditelné množiny, žádná v pásmu hranice; DOP { "3.3e-13" } relativně a kofaktor { "6.6e-13" } měřítka matice oproti { "1e-9" }. Rozsah: tabulkové masky, geodetické úhly pohledu, maskovaná množina a její DOP a kofaktor při společných hodinách.

seg-b33828edbe2f = ručně vypočtené hodnoty; výše uvedené porovnání čte jejich tabulky jako vstupy a nekontroluje je

seg-ca950752be62 = Předvolby skyline

seg-83946f66ca78 = žádné: zvolené, uvedené rozměry (kontrolované jen proti sobě samým)

seg-ca5db55640a9 = numpy { "2.5.4" } <c1/> a <c2/> (standardní P2) na { "142" } uložených viditelných množinách, při společných hodinách i s jedněmi hodinami na systém, předregistrováno v <c3/> (commit 0bbeeaee): { "270" } případů, osy { "5.1e-13" } relativně, orientace { "5.3e-12" }°, kofaktor { "1.0e-12" } měřítka matice, oproti { "1e-9" } a { "1e-6" }°

seg-44e5f9ca28f7 = Funkce geometrie oblohy

seg-8e3953481bbf = složení: propagace předvolby na reprezentativní oblohu, mrak Monte Carlo (zkontrolovaný proti geometrii, z níž vzorkuje), rozhraní

seg-e8eec007c6b9 = Nepřítomnost sekce <c1/> se kontroluje bajt po bajtu proti výstupům { "0.35.0" }, což ukazuje zpětnou kompatibilitu a nic neověřuje. gnss_lib_py aplikuje pouze jedinou elevační masku, takže je zde orákulem pro DOP, nikoli orákulem pro masku.

seg-d5894e54715b = Co skyline nemodeluje: difrakci přes hranu stěny, odrazy a signály bez přímé viditelnosti, které může skutečný přijímač stále sledovat (zahazují se, nezhoršují), částečnou průhlednost (příhradový jeřáb je v celém svém sektoru neprůhledný), terén za zadanými body a zakřivení Země uvnitř tvarů kaňonu a sektoru.

seg-745d19d6b35d = <s1>Předchozí</s1>Námořní integrace

seg-bbe8dd07d33b = <s1>Další</s1>Důvěra jako bezpečnostní telemetrie

seg-6317db731879 = Popis
