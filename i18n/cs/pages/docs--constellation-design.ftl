# docs--constellation-design: translations (cs)

seg-f63dd3d7aad4 = Zdroj

seg-8f0e4021404d = Zdroj: <c1/>

seg-44196ab9678c = Druh <c1/> vytváří jednu nebo více družicových konstelací kolem Země, Měsíce, Marsu nebo jakéhokoli jiného tělesa z katalogu sluneční soustavy (<c2/>: osm planet, Pluto, Měsíc, Phobos, Deimos, čtyři Galileovy měsíce a Titan, se stejnými konstantami, jaké používají druhy <c3/> a <c4/>; viz <a1>SOLAR-SYSTEM.md</a1>) a mapuje jejich pokrytí a faktor DOP (zhoršení přesnosti) na mřížce zeměpisné šířky a délky. Zdroj: <c5/>.

seg-61385c509a3d = Těleso se volí pomocí <c1/> (výchozí <c2/>). Běh trvá <c3/> (výchozí jeden hvězdný den, { "86 164" } s) v krocích <c4/> (výchozí { "600" } s), nad <c5/> (výchozí { "5" } deg), na mřížce <c6/> (výchozí { "10" } deg), kterou mohou omezit <c7/>, <c8/>, <c9/> a <c10/>; <c11/> přidává sekulární drift od J2, druhé zonální harmoniky gravitačního pole tělesa.

seg-d02f6d747522 = Co se zadává

seg-743e68478333 = <b>Walkerovy skořepiny</b> v konvenci <c1/>: <c2/> družic v <c3/> rovnoměrně rozmístěných rovinách s fázováním <c4/>. Vzor <em>delta</em> rozprostře vzestupné uzly na { "360" } deg, vzor <em>star</em> na { "180" } deg. Rovina <c5/> leží v uzlu <c6/> a družice <c7/> v ní má střední anomálii <c8/>.

seg-d86b01d633a0 = <b>Explicitní sady elementů</b>: velká poloosa nebo výška, excentricita, inklinace, rektascenze vzestupného uzlu (RAAN), argument perigea a střední anomálie.

seg-0737ef1ddb72 = <b>Předvolby</b> ze zveřejněných nominálních elementů (pouze Země; předvolba kolem jiného tělesa je chyba):

seg-587beeccaa11 = Předvolba

seg-1ff32b87e030 = Družice

seg-9e0514e371e5 = Global Positioning System (GPS) Standard Positioning Service Performance Standard (SPS PS), 5. vydání, duben { "2020" }, tabulky 3.2-1 a 3.2-3

seg-fb6956d09acc = { "24" } až { "30" }

seg-f679ee0f3a3f = SPS PS, tabulka 3.2-2: každý ze šesti rozšiřitelných slotů (B1, D2, F2, A2, C4, E3) uvedených v <c1/> se nahradí svou předsunutou a zadní dvojicí; ve výchozím stavu všech šest

seg-45f3abdcb8d4 = Galileo Open Service Service Definition Document (OS SDD), vydání { "1.1" }: Walker 24/3/1, velká poloosa { "29 599.801" } km, { "56" } deg (tabulka { "1" }), sloty z tabulky { "23" }

seg-87e23a896f58 = BeiDou Open Service Performance Standard { "3.0" } ({ "2021" }), oddíl { "4.1" }: střední oběžná dráha Země (MEO) Walker 24/3/1 ve výšce { "21 528" } km a { "55" } deg, plus tři geostacionární (GEO) družice na { "80" }, { "110.5" } a { "140" } deg východní délky a tři družice na nakloněné geosynchronní dráze (IGSO) na { "55" } deg

seg-70a32cd2402d = GLONASS Interface Control Document (ICD), vydání { "5.1" } ({ "2008" }), oddíl { "5.2" }: vzorec pro sloty, { "19 100" } km, { "64.8" } deg

seg-654d7aceff94 = RAAN v tabulce GPS je inerciální k jeho epoše; předvolba jej převádí na zemsky pevnou délku uzlu pomocí greenwichského hodinového úhlu, který tabulka uvádí ({ "100.765" } deg). GLONASS uvádí absolutní (greenwichské) délky uzlů přímo. Dokument Galileo hodinový úhel neuvádí, proto se jeho RAAN používá jako délka uzlu. Norma BeiDou neuvádí fázi MEO ani uzly IGSO; předvolba zahajuje vzor MEO v uzlu { "0" } a střední anomálii { "0" } a umísťuje tři družice IGSO na jednu pozemní stopu křížící rovník na { "118" } deg východní délky. Obě tyto volby jsou modelované.

seg-b2bbdd23c13b = Jeden běh může sdílet několik konstelací. S <c1/> (výchozí) odhaduje přijímač jedny hodiny pro každý systém ve výhledu, jako to dělá víceGNSS (Global Navigation Satellite System) přijímač; <c2/> sdílí jedny hodiny.

seg-27db52482bdd = Co vychází

seg-2405196cfccb = Pro každou buňku mřížky: střední, nejmenší a největší počet družic nad maskou; podíl epoch s určením polohy a s polohovým DOP (PDOP) rovným <c1/> nebo nižším; střední geometrický, polohový, horizontální a vertikální DOP (GDOP, PDOP, HDOP, VDOP); největší PDOP. Globálně, vážené kosinem zeměpisné šířky, aby každá buňka počítala podle své plochy: dostupnost, dostupnost na nejhorším místě a střední hodnota, medián, 90., 95. a 99. percentil a maximum každého DOP. Pro každou družici: podvzorkovaná pozemní stopa (<c2/> vzorků, výchozí { "24" }, nejvýše pro <c3/> družic, výchozí { "120" }). Graf tvoří dvě mapy, dostupnost a střední PDOP.

seg-6cb532d0bca9 = Jak se to škáluje

seg-988ae3272c1f = Družice v poloměru <c1/> je nad elevační maskou <c2/> přesně tehdy, když její středový úhel od uživatele je nejvýše <c3/>, takže test viditelnosti je jediný skalární součin proti <c4/>. V každé epoše se družice navíc řadí podle zeměpisné šířky podsatelitního bodu a řádek mřížky na šířce <c5/> testuje jen družice do vzdálenosti <c6/> od <c7/>. Obojí je na kulovém tělese přesné a jednotkový test porovnává každou mapu s úplným prohledáním přímým testem elevace. Blok <c8/> uvádí počet testů dvojic, které by provedlo úplné prohledání, a těch, které se provedly. Návrh z jednotkového testu s { "5" } 000 družicemi na mřížce { "10" } deg ({ "648" } bodů, { "6" } epoch) ponechává { "9.9" } % z { "19 440 000" } testů dvojic při úplném prohledání; přibalený scénář <c9/> ({ "5 000" } družic, { "648" } bodů, { "12" } epoch) běží přibližně { "0.14" } s s vydanou binárkou příkazového řádku na notebooku s Apple silicon. Časy podle hodin na stěně se liší podle stroje a jeho zatížení. Engine nepoužívá vlákna, hodiny ani souborový systém, takže běží beze změny jako WebAssembly.

seg-abba032ee1c7 = Co se kontroluje a proti čemu

seg-2342ed239300 = VALIDATED, proti zveřejněným dokumentům:

seg-dc7fe92fcf05 = generátor Walker reprodukuje všech { "24" } řádků tabulky { "23" } z Galileo OS SDD a vzorec slotů GLONASS ICD je tatáž množina { "24" } slotů jako Walker 24/3/1;

seg-686f9543c7c9 = předvolba GPS reprodukuje sloupec rovníkových průchodů pozemní stopy z tabulek 3.2-1 a 3.2-2 SPS PS: { "35" } z { "36" } poloh v rozmezí { "0.0108" } deg proti zaokrouhlovacímu prahu { "0.015" } deg. E3F se posuzuje podle volnějšího prahu { "0.06" } deg, protože vlastní řádek E3F v tabulce je v rozporu s jeho RAAN a argumentem šířky: jeho argument šířky je o { "14.60" } deg před argumentem E3, což posouvá průchod o { "7.30" } deg, zatímco tabulka jej posouvá o { "7.36" } deg;

seg-dc2756c75401 = základ GPS za podmínek přílohy B SPS PS (jeden hvězdný den, { "287" } kroků po pěti minutách, mřížka { "4" } deg, vše ve výhledu, maska { "5" } deg) dává globální medián HDOP { "0.940" }, { "90" } % { "1.165" }, { "95" } % { "1.255" }, { "98" } % { "1.370" } a střední hodnotu { "0.965" }, proti zveřejněným hodnotám { "0.94" }, { "1.16" }, { "1.25" }, { "1.37" } a { "0.96" } (práh { "0.03" }, stanovený před prvním během). Medián PDOP { "1.795" } je pod hodnotou { "1.815" } z tabulky B.3-1, která popisuje zhoršenou směs 20–24 družic. PDOP { "6" } nebo nižší platí { "100" } % času, proti { "98" } % globálně a { "88" } % na nejhorším místě v tabulce 3.8-1.

seg-9aac9d8aa228 = Zkontrolováno proti ručnímu odvození, nikoli proti externímu dokumentu: DOP v jedné epoše odpovídá uzavřenému tvaru pro družici v zenitu a tři družice v elevaci { "30" } deg (PDOP 8/3, GDOP { "3.0732" }).

seg-d946dad08e23 = MODELLED: dvoutělesové dráhy s volitelným sekulárním driftem J2; kulové těleso; pouze geometrická viditelnost (žádný výkon signálu, stav družice ani terén); žádná porucha od třetího tělesa, na níž závisí skutečná lunární zmrazená dráha. Nejhorší jednotlivý bod v čase a prostoru závisí na mřížce: zde HDOP { "2.40" } a VDOP { "5.22" } proti zveřejněným { "2.49" } a { "5.43" }; tyto hodnoty se uvádějí, nepřipínají se. Předvolby čtyř systémů pocházejí z různých referenčních epoch, takže jejich relativní fáze v jednom běhu není snímkem žádného data.

seg-a6c63abeb7e6 = Přibalené scénáře

seg-3e6a942c84d4 = Každý řádek uvádí, co běh vypíše s kshana { $version }.

seg-c8b40c9c2c00 = <c1/>: GPS, Galileo, BeiDou a GLONASS ({ "102" } družic) po dobu jednoho dne nad maskou { "10" } deg, jedny hodiny na systém. Dostupnost (PDOP { "6" } nebo nižší) { "100" } % globálně i na nejhorším místě, medián PDOP { "0.95" }, v průměru { "31.0" } družic ve výhledu.

seg-b65ade1eab04 = <c1/>: { "5 000" } družic ve čtyřech skořepinách na nízké oběžné dráze Země (LEO) pro určování polohy, navigaci a čas (PNT), s J2, nad maskou { "20" } deg. Dostupnost (PDOP { "3" } nebo nižší) { "99.22" } % globálně a { "0" } % na nejhorším místě, medián PDOP { "1.11" }, v průměru { "39.4" } družic ve výhledu.

seg-7d860ca30360 = <c1/>: { "8" } družic na eliptických lunárních zmrazených drahách a kruhová skořepina o 6 družicích kolem Měsíce. Dostupnost (PDOP { "6" } nebo nižší) { "21.33" } % globálně a { "0" } % na nejhorším místě, medián PDOP { "5.22" }, v průměru { "3.2" } družic ve výhledu.

seg-0c331bea1f52 = Pokrytí LEO-PNT pro polární a arktické uživatele, ve srovnání s GNSS na střední oběžné dráze Země, je polárním režimem druhu <c1/> (<c2/>; viz <a1>LEO-PNT.md</a1>).

seg-9aab3bf49146 = <s1>Předchozí</s1>Fúzované určování polohy z MEO a LEO

seg-9f717b9015e1 = <s1>Další</s1>Modely kvantových senzorů
