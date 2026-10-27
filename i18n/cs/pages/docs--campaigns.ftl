# docs--campaigns: translations (cs)

seg-f917e7fcac09 = Co to je

seg-cae10fb9bff8 = Scénář

seg-7603033b1c87 = Zdroj: <c1/>

seg-699c946d7d09 = Jeden scénář odpovídá na jednu otázku o jedné situaci. Mise je posloupnost situací a návrhová studie je jejich rodina. Druh scénáře <c1/> skládá existující druhy do jednoho běhu, aniž by kterýkoli z nich znovu implementoval: každý člen je běžná tabulka scénáře nesoucí vlastní <c2/>, rozdělovaná přes <c3/> přesně tak, jak by ji spustilo <c4/>, a kampaň z dokumentů s výsledky pouze čte čísla.

seg-cb4f48673970 = Kampaň je <b>MODELLED</b>. Její kompoziční identity jsou testovány (viz níže), ale řetězení fází je modelářská volba a každá fáze je tak dobrá, jako druh, který ji spustil.

seg-80e367fbc391 = Spusťte ji jako kterýkoli jiný scénář:

seg-9f9995ebc904 = Kampaň může obsahovat libovolnou kombinaci čtyř sekcí; kampaň bez jediné se spustí a její shrnutí uvede, že nesložila nic.

seg-002ddd72b3a2 = <c1/>: řetězená mise na jedné časové ose

seg-e99c4453b79d = Každá fáze spouští jeden nebo více scénářů v okně sdílené časové osy mise, například hodiny v holdoveru a inerciální navigační systém (INS) setrvávající ve stejné době. Výstupy každého běhu se čtou do pojmenovaných <b>kanálů</b>, umístí se na počáteční čas fáze a převzorkují na společnou mřížku (<c1/>) podržením nultého řádu: čas mřížky přebírá poslední vzorek běhu vlastnící fáze, který v daný okamžik nebo před ním existuje, a je null tam, kde kanál neposkytuje žádný běh dané fáze.

seg-842b77a21c5f = Kanál

seg-b2eb598fab2a = Zdroj předvolby

seg-f42465f7d066 = ns

seg-fdb4600bf100 = časová chyba hodin

seg-aef6b877191d = ochrana časové chyby

seg-cc989ca58f1d = vlastní <c1/> běhu

seg-5e9f7cd33017 = průměrný efektivní poměr nosné k hustotě šumu (C/N0) přes viditelné družice

seg-af6f07319f2d = <c1/>: průměr <c2/>

seg-f6b4ea158327 = práh ztráty sledování

seg-126535297c32 = <c1/>: <c2/> scénáře, pokud je uvádí

seg-f8f430695a88 = družice, které stále sledují

seg-3f9a9f33010b = vertikální ochranná úroveň

seg-2cfc68fa1c15 = vertikální mez výstrahy

seg-d165177a255c = chyba polohy

seg-29651ae6be6f = práh chyby polohy

seg-c893c5e3ace5 = { "1" }, dokud kterýkoli monitor fáze hlásí poplach

seg-ade1d7072512 = viz níže

seg-e8c7ac7d117f = <c1/> je <c2/>, pokud běh nenastaví <c3/>. Jakákoli jiná veličina se čte pomocí explicitního záznamu <c4/>: časová cesta s jedním <c5/> pojmenovávajícím řádky (<c6/>), cesta hodnot sdílející tyto řádky nebo skalár rozšířený na každý řádek (předpona <c7/> čte scénář běhu místo jeho výsledku), volitelná redukce (<c8/>, <c9/>, <c10/>, <c11/>) pro několik hodnot pod jedním řádkem, měřítko a jednotka pro kanál, který kampaň nezná.

seg-7d7bc5d19a61 = <b>Poplachy</b> pocházejí ze tří míst, uvnitř fáze spojených logickým OR:

seg-74a10f5283ec = příznaky předvoleb načtené z běhu: <c1/> hlásí poplach, dokud sleduje méně než čtyři družice (vlastní definice dostupnosti); <c2/> hlásí poplach v epochách, které označí jako nedostupné;

seg-f22be2880015 = pravidla předvoleb na kanálech fáze, vyhodnocovaná <b>po</b> <c1/>: <c2/> hlásí poplach, dokud absolutní časová chyba přesahuje <c3/>; <c4/> dokud chyba polohy přesahuje <c5/>; explicitní pravidla patří do <c6/>;

seg-ccd94a7cb652 = události s poplachem: <c1/> jednu vyvolá při <c2/> svého monitoru podporovaného hodinami; <c3/> jednu vyvolá na začátku fáze, když jeho fúzní rozhodnutí hlásí výstrahu.

seg-f88b8ad5672f = <b>Stav se předává</b> mezi fázemi třemi explicitními způsoby:

seg-0e3a0ee8e172 = <c1/> přičte hodnotu kanálu na konci předchozí fáze k hodnotám tohoto kanálu v této fázi. Fáze hodin, kterou spoofer odtáhl, je místem, odkud holdover začíná. Přičtení posunu je přesné pro fázi hodin, která integruje frekvenci; u chyby polohy předpokládá, že obě chyby jsou kolineární, což je pesimistický případ.

seg-4db8b11391a5 = <c1/> zapíše číslo z předchozí fáze (<c2/> pro koncovou hodnotu kanálu nebo libovolnou cestu výsledku předchozího běhu) do klíče s tečkami scénáře této fáze před jeho během, s volitelným měřítkem a posunem.

seg-fdd5aa8b9627 = <c1/> ukončí fázi v čase, který vypočítal některý běh, omezeném na <c2/>. Přibalená mise ukončuje fázi spoofingu v <c3/>.

seg-cdd64676f509 = <c1/> zahodí prvních několik sekund vlastní časové osy běhu (zahřátí) před nulovým časem fáze.

seg-d48bcd9890d3 = Přibalená mise

seg-52fc5abca41f = <c1/> spouští { "18" } členských scénářů v šesti fázích na mřížce { "10" } s:

seg-baea4e05ad26 = Fáze

seg-9d3ee6a5613e = Běhy

seg-87fbeeb9abb9 = Co časová osa ukazuje

seg-82bebc2bb038 = nominální, { "600" } s

seg-cf54dae64cb7 = <c1/>, <c2/> (bez rušičky), <c3/>

seg-5cb80e4a7d4d = časová chyba { "0" } ns; C/N0 { "43.0" } dB-Hz proti prahu { "25" } dB-Hz; vertikální ochranná úroveň { "9.1" } až { "21.6" } m proti mezi výstrahy { "50" } m

seg-13c92a72544a = rušení (jamming), { "600" } s

seg-f9c01304734d = totéž, rušička -30 dBW, { "1" } km

seg-27d3b65152b0 = C/N0 klesne na { "27.7" } dB-Hz, všech { "8" } družic stále sleduje

seg-6a052db03815 = spoofing, ukončen v { "370" } s pomocí <c1/>

seg-89856c1f83f8 = <c1/> (časová rampa { "0.1" } ns/s), <c2/>, <c3/>

seg-cfcdd96b1132 = časová chyba narůstá na { "36" } ns; radiofrekvenční detektor hlásí poplach na začátku fáze, monitor podporovaný hodinami v { "370" } s

seg-92c8a76b84c2 = holdover, { "1800" } s

seg-8a6e0b2898d1 = <c1/> (odepřeno, přenáší { "37.0" } ns), <c2/> (taktická jednotka setrvávající), <c3/> při { "10" } dBW

seg-1948491e25ec = ztraceny všechny družice (C/N0 asi -12 dB-Hz); časová chyba { "36.4" } až { "62.7" } ns proti ochraně { "50" } ns; chyba polohy až { "24" } km

seg-93e59087dd44 = integrity-alarm, { "600" } s

seg-f28f37baf8fe = <c1/> (přenáší { "59.6" } ns), <c2/> a <c3/> s maskou { "25" } deg

seg-83d890c819f8 = sleduje { "5" } družic; ochranná úroveň { "19" } až { "135" } m, chybí v { "18" } z { "60" } časů mřížky; přenesená časová chyba, { "52.1" } až { "61.7" } ns, zůstává nad ochranou { "50" } ns, takže poplach trvá po celou fázi

seg-1ab40b7893db = zotavení, { "600" } s

seg-181d2a2f800b = časová chyba zpět na { "0" } ns; poplach utichl

seg-26ef3dc422ff = Běhy integrity používají vlastní uživatelskou trajektorii příkladu <c1/> (kruhovou trajektorii ve výšce { "0.4" } km), nikoli pevné stanoviště přijímače pro rušení, a maska { "25" } deg zastupuje částečnou oblohu přijímače, který znovu zachytává signál. To jsou volby scénáře, uvedené v souboru.

seg-03ae98f17988 = Mise řízená spektrem v pásmu L

seg-5daf8c8fdd83 = <c1/> spouští { "8" } členských scénářů ve třech fázích na mřížce { "1" } s, přičemž C/N0 pro GPS L1 C/A a Galileo E1 se čte z druhu <c2/> (viz <a1>SPECTRUM.md</a1>), nikoli z tabulky druhu <c3/> po jednotlivých družicích. Rušičky jsou ty z <c4/>.

seg-7f34a00af961 = nástup, ukončen v { "10" } s pomocí <c1/>

seg-471ec0d86f76 = <c1/>, <c2/> (chirp od { "10" } s), <c3/>

seg-00b032242ebc = L1 C/A { "43.48" } a E1 { "44.73" } dB-Hz; fáze končí při první ztrátě L1 C/A v běhu spektra (<c1/>); ochranná úroveň { "21.6" } m proti { "50" } m

seg-50220d719d5d = holdover, { "600" } s

seg-50de7cd69ac0 = <c1/> (odepřeno, přenáší chybu nástupu, zde { "0" } ns), <c2/> (chirp zapnut)

seg-1d59e94d94e5 = L1 C/A { "3.38" } a E1 { "4.44" } dB-Hz, obojí pod prahem { "25" } dB-Hz; časová chyba -0.07 až { "5.06" } ns proti ochraně { "50" } ns; poplach trvá

seg-6c56497d74fb = galileo-fallback, { "300" } s

seg-62bcfd3e8732 = <c1/> (znovu synchronizováno), <c2/> (tón CW na nosné L1), <c3/> na konstelaci podobné Galileo Walker 24/3/1

seg-d455f0c06ee6 = L1 C/A drží na { "17.98" } dB-Hz, E1 zpět na { "44.73" } dB-Hz; ochranná úroveň { "6.1" } až { "17.7" } m; poplach utichl

seg-2db37e292efe = Zotavení E1 pod tónem CW spočívá na zacházení druhu spektrum se spojitým spektrem: tón leží v nule spektra MBOC a nic nespřahuje. Skutečný tón by se spřahoval přes spektrální čáry kódu; to je uvedeno v souboru a v SPECTRUM.md.

seg-fb8d8636c554 = <c1/>: mřížka parametrů přes libovolný druh

seg-b14a11d60e9f = Jeden až tři tečkami oddělené klíče scénáře, každý v lineárním nebo logaritmickém rozsahu, na týchž hodnotách os, jaké používá druh <c1/>. Každá osa má název a jednotku; každá metrika má název a cestu k výsledku a její jednotka se čte z bloku jednotek procházeného druhu, pokud kampaň neuvede vlastní. S <c2/> je každý uzel souborem Monte Carlo se seedem (realizace <c3/> na seedu uzlu plus <c4/>) a uvádí se se statistikami níže. <c5/> prochází výkon rušičky { "1" } km od přijímače od -50 do +{ "10" } dBW: průměrný poměr rušení k signálu se mění přesně o { "1" } dB na dB ({ "12.2" } až { "72.2" } dB) a dostupnost klesá z { "1" } na { "0" } mezi -30 a -25 dBW.

seg-c1931e311cca = Klíč s tečkami může indexovat pole tabulek podle pozice: <c1/> je <c2/> třetí tabulky <c3/> a <c4/> sahá o tři úrovně hlouběji.

seg-e774c578906d = <c1/>: soubor se seedem

seg-bbacb9c66f92 = Realizace <c1/> spouští scénář s klíčem seedu nastaveným na <c2/>, což je konvence, kterou už používá soubor hodin, takže soubor je přesně reprodukovatelný. Každá metrika uvádí průměr, populační směrodatnou odchylku, percentily 5., 50. a 95. podle nejbližšího pořadí, percentilový bootstrap s pevným seedem, { "95" }% interval spolehlivosti průměru ({ "2000" } převzorkování) a ve výchozím stavu každý vzorek v pořadí seedů. Cesty k výsledkům mohou indexovat pole: <c3/> je poslední vzorek.

seg-ed182d15151d = <c1/>: několik scénářů za sdílených podmínek

seg-26fab14de534 = Pojmenované sdílené hodnoty (číslo nebo pole čísel s jednotkou) se zapisují do každého člena pod klíče, ke kterým je váže, takže se členové nemohou o sdílené podmínce rozcházet. Každý člen běží a pro každou metriku uvádí souhrn nejmenší, největší a průměrnou hodnotu napříč členy a pojmenuje nejlepšího a nejhoršího. <c1/> staví jednu rušičku { "8" } dBW mezi loď v Finském zálivu (asi { "30" } km daleko) a auto na pobřežní silnici v Helsinkách (asi { "50" } km): loď ztratí všechny družice (průměrný poměr rušení k signálu { "39.0" } dB), zatímco auto si ponechá alespoň čtyři ({ "34.6" } dB).

seg-c888630c92d7 = <c1/>: nejlepší hodnota jedné metriky

seg-b54f0deedd0f = Jeden až tři tečkami oddělené klíče scénáře, každý omezený na <c1/> v měřítku <c2/> nebo <c3/>, se prohledávají kvůli nejlepší hodnotě jedné metriky (<c4/>, <c5/> nebo <c6/>, které minimalizuje vzdálenost od <c7/>).

seg-b57ec5e5168a = Existují dvě metody:

seg-8fba07ce0cde = <c1/> spustí každý uzel mřížky s <c2/> na klíč, na hodnotách os průchodu.

seg-844a7c1e3578 = <c1/> (výchozí) spouští deterministický simplex Nelder–Mead v souřadnicích normalizovaných na [{ "0" }, { "1" }] pro každý klíč. Zkušební body se promítají do kvádru. Sekce přijímá <c2/>, počáteční <c3/> a zastavovací tolerance <c4/> a <c5/>.

seg-2b1159b467f8 = Běh, jehož metrika chybí nebo není konečná, se hodnotí jako nejhorší a ponechává se ve stopě. S <c1/> je metrika průměrem přes tytéž seedy při každém vyhodnocení. Výsledek uvádí <c2/>, <c3/>, <c4/>, <c5/>, <c6/> a každé vyhodnocení v <c7/>.

seg-778a40736e7b = <c1/> hledá dosah a datovou rychlost pro rezervu spoje { "3" } dB. Optimum je lokální v rámci kvádru a startu. Je MODELLED, nikdy nejde o globální tvrzení.

seg-b94ab5e6dad4 = Protokol a jeho předregistrované prahy jsou v <c1/>. Test je <c2/>. Výsledky:

seg-232c68472fa4 = 1D řešení cíle souhlasí s uzavřeným tvarem na { "6e-15" };

seg-22f7abf70fc4 = metoda mřížky souhlasí bit po bitu s nezávislou smyčkou hrubou silou;

seg-faea43f01e37 = simplex si vede alespoň stejně dobře jako mřížka { "41" } × { "41" }, přibližně za desetinu jejích běhů.

seg-df1533fe6b95 = 1D práh kola { "1" } je zaznamenán jako NOT MET: předregistrovaný kvádr řešení vylučoval.

seg-0862a4e9aa61 = Každý výsledek kampaně nese <c1/>, SHA-256 (Secure Hash Algorithm { "2" }, 256bitový otisk) kanonického tvaru dokumentu kampaně v JavaScript Object Notation (JSON) (pořadí klíčů a formátování ho nemění), a blok <c2/> s počtem členských běhů a <c3/>, SHA-256 přes otisky všech výsledků členů v pořadí rozdělování. Dva běhy se stejným otiskem vytvořily bajt po bajtu shodné výsledky členů. Každý běh fáze také zaznamenává svůj druh, vlastní <c4/>, pokud ho druh má, a SHA-256 svého dokumentu s výsledkem. Každé číslo v dokumentu má záznam jednotek.

seg-2eeddb87e889 = Jádro je sekvenční a nečte žádné soubory, takže kampaň běží beze změny v sestavení WebAssembly. Kampaně nesmějí obsahovat kampaně.

seg-f9b8b78dd64a = Exporty

seg-c4443bf160f7 = <c1/> u kampaně zapíše každý členský scénář, který má geometrii, jako vlastní sadu souborů, přičemž štítek člena se vloží před příponu formátu: každý běh fáze (<c2/>, nebo <c3/>, má-li fáze několik běhů), základní scénář průchodu (<c4/>), scénář Monte Carlo (<c5/>) a každého složeného člena (jeho vlastní štítek, se sdílenými hodnotami, které váže, zapsanými dovnitř). Člen shodný s dřívějším se zapíše jednou; předání a hodnoty průchodu nebo seedu použité za běhu nejsou v exportovaných scénářích.

seg-0ba270495309 = Formát, který žádný z členů nedokáže popsat, je odmítnut s uvedením tohoto důvodu. Tabulka po jednotlivých scénářích je v <a1>INTEROP.md</a1>.

seg-c20904c9d3b5 = Kampaně LEO-PNT

seg-a598e2c06f51 = Patnáct přibalených kampaní rámuje otázky určování polohy, navigace a času (PNT) z nízké oběžné dráhy Země (LEO); <a1>LEO-PNT.md</a1> popisuje, co každá z nich ukazuje. Co každá spouští, jak to shrnuje příkazový řádek:

seg-f65b1f2b4182 = Režim

seg-e7d7defa7e71 = Otázka

seg-08ab59acfe62 = skládání, { "4" } členové

seg-a21e4db0fda9 = servisní data navigační zprávy podle délky rámce

seg-6c29f4690d2c = průchod <c1/>, { "7" } uzlů

seg-97fba77aa2ec = fúzní určování polohy z MEO a LEO podle chyby dosahu signálu ve vesmíru (SISRE) LEO

seg-7b9fbe34d38c = skládání, { "2" } členové

seg-28352bd0c9e3 = vnitřní LEO-PNT podle pásma a třídy budovy

seg-a447c56022ec = průchod <c1/>, { "9" } uzlů

seg-5b3cbfced221 = energie na určení polohy pro internet věcí (IoT) podle vysílacího výkonu LEO UHF

seg-3ebd95e5933a = průchod <c1/>, { "9" } uzlů

seg-cfbac004ff64 = určování polohy v neterestrických sítích (NTN) podle šířky pásma referenčního signálu

seg-07e8765975d1 = průchod <c1/>, { "3" } uzly

seg-db872d35033e = konvergence přesného určování polohy z jednoho bodu (PPP) podle výšky vrstvy LEO o 192 družicích

seg-a4ec677dc4e6 = řetěz, { "3" } fáze po { "2100" } s

seg-2d91ecf8455d = globální družicový navigační systém (GNSS) rušen, uživatele nese vrstva LEO, integrita zachována

seg-c44991a2a24e = průchod <c1/>, { "13" } uzlů

seg-4b6e292d88f5 = pásmová diverzita LEO proti širokopásmové rušičce v pásmu L

seg-30d86b528bee = monitory spoofingu proti čtyřem spooferům

seg-1690baf3a1b8 = řetěz, { "1" } fáze po { "86 400" } s

seg-4d5b507c04de = časování základnových stanic 5G: holdover a čas z LEO

seg-d32a80c40470 = řetěz, { "3" } fáze po { "1440" } s

seg-c38f9d3bd54e = sledování kontejnerů přes LEO UHF: energie na určení polohy po cestě

seg-9bf38e403696 = řetěz, { "2" } fáze po { "1500" } s

seg-dea7117552f4 = autonomní vozidlo v městském kaňonu s vrstvou LEO

seg-dbbd9ffcbfb4 = řetěz, { "2" } fáze po { "1800" } s

seg-37c0c3570023 = tentýž městský kaňon jako plochá mez { "35" } deg a jako obrys oblohy <c1/>

seg-ccaa34122145 = řetěz, { "2" } fáze po { "87 000" } s

seg-d16d8b2e9089 = časování kritické infrastruktury: holdover s časem z LEO

seg-4ee0b3036f4a = řetěz, { "3" } fáze po { "10 800" } s

seg-157c5bec7f5f = polární a arktičtí uživatelé s polární vrstvou LEO

seg-64404160d0e7 = řetěz, { "3" } fáze po { "2520" } s

seg-a35e1603ba32 = železniční a námořní uživatelé s vrstvou LEO

seg-3d819fa3fd1c = MEO je střední oběžná dráha Země, UHF ultra vysoká frekvence a 5G pátá generace mobilních sítí.

seg-490920844143 = Co se kontroluje

seg-483b1d4efb20 = <c1/> pevně stanoví kompoziční identity:

seg-881d97a3fa2b = <b>Jednofázová kampaň reprodukuje samostatný běh bit po bitu.</b> Pro <c1/>, <c2/> a <c3/> je dokument s výsledkem člena bajt po bajtu shodný s <c4/> na souboru scénáře, jeho otisk je ten, který kampaň uvádí, a při mřížce na vlastním kroku běhu se každá zarovnaná hodnota rovná hodnotě samostatné řady (C/N0 rušení se rovná průměru vypočtenému nezávisle ze samostatného dokumentu).

seg-1a9e1ed5b18c = <b>Průchod o jednom uzlu a složení z jednoho člena</b> čtou přesně samostatné číslo.

seg-883bb72e1239 = <b>Soubor s pevným seedem je bajtově stabilní</b> a realizace <c1/> je přesně samostatný běh na <c2/>; otisk kampaně ignoruje pořadí klíčů.

seg-170bc86059fa = Analytický případ.

seg-0fd27291d6f4 = <c1/> spouští { "200" } seedů čipových atomových hodin pouze s bílým frekvenčním šumem (q_wf = { "9e-20" } s^2/s, Microchip SA.45s sigma_y({ "1" } s) = { "3e-10" }), synchronizovaných do { "590" } s a setrvávajících do { "3600" } s. Konečná časová chyba je gaussovská se střední hodnotou { "0" } a směrodatnou odchylkou sqrt(q_wf * { "3010" } s) = { "16.459" } ns (náhodná procházka fáze při bílém frekvenčním šumu, Technical Note { "1337" } National Institute of Standards and Technology (NIST)). Uvedený interval, [-2.52, { "1.59" }] ns, obsahuje pravou střední hodnotu { "0" }; výběrová směrodatná odchylka, { "14.93" } ns, dává statistiku chí-kvadrát { "164.5" } při { "199" } stupních volnosti, uvnitř oboustranného { "99" }% intervalu [{ "151.37" }, { "254.14" }]. Při { "3000" } seedech dává stejný scénář { "16.31" } ns.

seg-61b54a16243f = <b>Řetěz řízený spektrem</b> čte samostatná čísla: fáze nástupu trvá přesně dobu první ztráty v běhu spektra a každá hodnota L1 C/A a E1 na časové ose se na { "1e-9" } dB rovná řádku samostatného příkladu vodopádu pro stejný stav rušičky (nominální, samotný chirp, samotný tón CW).

seg-5ebc02a24ce1 = <b>Řetěz</b> předává stav tak, jak je zdokumentováno: fáze spoofingu trvá přesně dobu detekce v běhu spoofingu, holdover přenáší přesně posun běhu spoofingu při detekci, zotavení nepřenáší nic a poplach trvá všude tam, kde ochranná úroveň chybí nebo překračuje mez výstrahy.

seg-153e28bcb38a = Tyto kontroly ověřují, že skládání nemění nic, co by změnit nemělo. Neověřují řetězenou misi proti naměřené, a proto jsou tři řádky kampaní v <a1>VERIFICATION-MATRIX.md</a1> MODELLED.

seg-e82860f2d902 = <s1>Předchozí</s1>Použití skutečných TLE

seg-e40757a0b4cb = <s1>Další</s1>Zprávy o běhu

seg-e65edbaca6bf = [[phases]]: řetězená mise na jedné časové ose

seg-a433ddf74e55 = [sweep]: mřížka parametrů přes libovolný druh

seg-7ca90ac531bf = [monte_carlo]: soubor se seedem

seg-03d764a4cb56 = [compose]: několik scénářů za sdílených podmínek

seg-61a0db2550ba = [optimize]: nejlepší hodnota jedné metriky
