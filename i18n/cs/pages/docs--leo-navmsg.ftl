# docs--leo-navmsg: translations (cs)

seg-cc651d9cef3b = Kód

seg-cbf0f9bcd2d8 = Orákulum

seg-6e0cb6acc073 = VALIDATED

seg-35f8f623ea28 = { "30" } s

seg-f63dd3d7aad4 = Zdroj

seg-e305279d5b11 = Obsah

seg-a7d59ba6e225 = rad

seg-4d208b6c0eb8 = den

seg-0f2d3faa9934 = Zdroj: <c1/>

seg-d8aaee95aa44 = Druh scénáře <c1/> sestavuje zprávu s broadcast efemeridami a hodinami družice pro určování polohy, navigaci a čas (PNT) na nízké oběžné dráze Země (LEO) a odpovídá na otázky, které si klade návrhář zprávy: jak dlouho může jedna zpráva pokrývat, co přináší každý další parametr, co uživatel vidí, když se zpráva změní uprostřed přeletu, a kolik bitů je třeba k jejímu přenosu s přesností na centimetr.

seg-e61283b1e1a5 = Je nezávislý na systému. Libovolná dráha, libovolná nosná a kterýkoli ze čtyř modelů efemerid běží bez jakékoli předvolby; pojmenované předvolby jsou volitelná data (viz <a1>Předvolby</a1>).

seg-1271cd4ad822 = Vytiskněte přibalený příklad pomocí <c1/> (jedno jméno na volání) a spusťte jej pomocí <c2/>: <c3/>, <c4/>, <c5/> a <c6/>. Druh je také stupněm zprávy v druhu <c7/> (<a1>LEO-PNT.md</a1>) a členem kampaně <c8/>, která skládá čtyři konfigurace zprávy a uvádí délku rámce každé z nich ({ "146" }, { "154" }, { "159" } a { "171" } bajtů).

seg-51da9ffaa0ec = Kód: <c1/> — <c2/> (záznamy a uživatelský algoritmus), <c3/> (pravá dráha a hodiny), <c4/> (fitter), <c5/> (chyba vzdálenosti signálu ve vesmíru), <c6/> (ionosféra a koordinovaný světový čas (UTC)), <c7/> (binární formát), <c8/> (exporty ve stylu Receiver Independent Exchange Format (RINEX) a hodnot oddělených čárkami (CSV)), <c9/> (jeden soubor na předvolbu), <c10/> (druh).

seg-0505113a62e3 = Co zpráva přenáší

seg-6752521002b2 = Část

seg-cf6ae60eea4f = Pomocné údaje

seg-00eae74cb1e6 = identifikátor kosmického vozidla (SVID), číslo vydání dat (IOD), identifikátor pásma, stav zdraví signálu (konvence Galileo: { "0" } v pořádku, { "1" } mimo provoz, { "2" } rozšířený provoz, { "3" } ve zkoušce)

seg-0bdbdd2c923b = Synchronizace

seg-8120237b02ea = číslo týdne, čas týdne (TOW) vysílání a hodinový polynom druhého řádu <c1/>

seg-b09dc4b322d3 = Efemeridy

seg-bbb3225e1d19 = jeden ze čtyř modelů níže

seg-3a835a49b43f = Další služby

seg-2a13461cb60c = vysílaná ionosférická sada Klobuchar, koeficienty Galileo NeQuick-G <c1/> s pěti příznaky bouře a parametry převodu systémového času na UTC <c2/>

seg-6b899ef63047 = Modely efemerid

seg-60cd077d82a7 = Model

seg-2afa300864a9 = Parametry

seg-3e8a1cf183cc = keplerovská sada z dokumentu Galileo Open Service Signal-in-Space Interface Control Document (OS SIS ICD): <c1/>

seg-b1416ba3472f = totéž plus korekční polynomy ve směru dráhy, napříč dráze a radiálním (RAC) <c1/>, <c2/>, <c3/> v <c4/>, koeficienty v metrech, <c5/> mocnina dvou rovná se alespoň polovině intervalu fitu nebo ji převyšuje (vysílá se), stupně dané <c6/> (výchozí { "7" }, { "5" }, { "6" })

seg-9c0643152bbf = výchozí { "16" } + { "21" } plus časová škála

seg-e0afd541d64c = 22parametrový model Liu, Su, Xie, Zhou a Qu ({ "2025" }, <em>Remote Sensing</em> { "17" }({ "16" }):{ "2894" }, doi <a1>10.3390/rs17162894</a1>): { "16" } plus <c1/>

seg-a6042071a03f = model „nulových hodin“ ATOMIC (Autonomous Time and Orbit Determination for Microsatellite Constellations): polynom v zemské pevné soustavě se středem v Zemi (ECEF) pro každou osu v <c1/> (výchozí stupeň { "6" }), bez hodinových členů, protože hodiny družice jsou řízeny k systémovému času (<a1>InsideGNSS</a1>)

seg-5869d6f65796 = výchozí { "22" }

seg-6663aa3eeebc = Uživatelský algoritmus (<c1/>) je posloupnost z Galileo ICD (Keplerova rovnice, korekce druhé harmonické, uzel v zemské pevné soustavě), za níž pro <c2/> následují tři polynomy v soustavě vlastní keplerovské dráhy: radiální podél vyhodnocené polohy, napříč dráze podél normály dráhy z korigované inklinace a uzlu, ve směru dráhy doplňující trojici. Hodiny přidávají relativistický člen z ICD <c3/>; pro <c4/> je to obecný tvar <c5/> z polynomu a jeho derivace.

seg-b3935a85a7b2 = Členy podle Liu et al. sledují uživatelský algoritmus z článku (oddíl { "2.2" }, rov. 1-7): <c1/>, <c2/> (vydání před { "0.30" } používala konvenci civilní navigace Global Positioning System (GPS) <c3/>, takže jimi zapsané <c4/> bylo dvojnásobkem hodnoty z článku) a <c5/> přičtené k poloměru, <c6/> je nekorigovaný argument šířky. Konvence měřítka <c7/> je přepsána z rov. { "1" } článku; srovnání s článkem na skutečných drahách na ní nezávisí (činitel ½ u <c8/> nemění žádnou fitovanou hodnotu), takže význam vysílané hodnoty <c9/> tam není ověřen proti vnější referenci.

seg-9a83292bffcf = Dvě interpretace jsou vlastní interpretací Kshana a jako takové jsou uvedeny:

seg-0e42fd0d5cf9 = Soustava RAC a normalizace <c1/>. Žádný veřejný dokument nedefinuje korekční soustavu LEO pro vysílanou zprávu.

seg-1b8aaed09de8 = Hodiny zprávy s nulovými hodinami jsou celkově nulové: předpokládá se, že řídicí smyčka drží zdánlivé hodiny, včetně relativistického členu, na systémovém čase.

seg-3472ce139588 = Fitter

seg-4404a677d185 = <c1/> integruje dráhu čtyřstupňovou Rungeovou–Kuttovou metodou s pevným krokem v soustavě, která se jednou rotací převádí na osy pevné vůči Zemi, <c2/>, tedy toutéž jedinou rotací, kterou používá vysílaný uživatelský algoritmus. Gravitace je dvoutělesová (<c3/>), zonální harmonické J2 až J6 ({ "2" } až { "6" }) nebo pole Earth Gravitational Model { "2008" } (EGM2008) do stupně a řádu { "7" } až { "70" }, jehož tesserální členy nesou krátkoperiodický podpis, kvůli němuž je fit dráhy LEO obtížný. Odpor je volitelný (statická exponenciální hustota). Hodiny jsou buď volně běžící (bias, drift, rychlost driftu a bílý frekvenční šum při uvedené Allanově odchylce za jednu sekundu plus periodický relativistický člen), nebo řízené (zbytek Gaussova–Markovova procesu prvního řádu).

seg-ae3052e66b2a = <c1/> fituje keplerovskou sadu metodou Levenberg–Marquardt na nesingulárních prvcích (<c2/>, <c3/>, <c4/>): dráha LEO je téměř kruhová, takže <c5/> a <c6/> samy o sobě jsou téměř nerozlišitelné. Začíná z oskulačního stavu v <c7/> s rychlostí uzlu od J2. Slabé apriorní hodnoty soustředěné kolem nuly omezují rychlosti a harmonické, které krátký oblouk nedokáže rozlišit; při váze pozorování { "1" } cm působí jen v těchto nulových směrech. Fit <c8/> místo toho přebírá start a odhadovač z oddílu { "2.3" } článku: začíná se všemi korekčními členy nulovými, nemá žádné apriorní hodnoty (prostá metoda nejmenších čtverců) a ponechává limit článku 100 iterací. Zastavuje se podle vlastního pravidla konvergence parametrů Kshana, když je každý krok parametru menší než { "1e-3" } jeho formální směrodatné odchylky; článek se zastavuje naopak tehdy, když se RMS změní o méně než { "0.1" } mm. Polynomy RAC se pak fitují na zbytky ve směru dráhy / napříč dráze / radiálně lineární metodou nejmenších čtverců a hodinový polynom na pravé hodiny minus relativistický člen, který uživatel přičte zpět.

seg-020f45edcae1 = Zjištění, které výchozí hodnoty zakódovávají: po fitu keplerovské sady metodou nejmenších čtverců je zbytek z konstrukce tím, co { "16" } parametrů nemůže pokrýt, takže v okně kmitá (několik průchodů nulou v každé složce) a nedriftuje. Korekční polynom jej odstraní jen tehdy, když jeho stupeň převyšuje to, co keplerovská sada už pokrývá: ve směru dráhy { "7" }, napříč dráze { "5" } a radiálně { "6" } sníží 15minutový zbytek z centimetrů na přibližně milimetr, zatímco nižší stupně napříč dráze neodstraní téměř nic (zbytek napříč dráze je lichý kolem středu okna). Systém, který svou keplerovskou část odvozuje jinak, zanechává zbytek jiného tvaru a stupně, které potřebuje, z toho plynou. Vlastní korekční stupně předvolby Celeste (nižší než tyto; existují jen v souboru předvolby, <c1/>) zde běží na základu Kshana s nejmenšími čtverci, proto jsou její členy napříč dráze v tomto enginu málo významné: jde o tvrzení o fitteru Kshana, nikoli o nějakém skutečném systému. <c2/> a <c3/> jsou celé sekundy, jak je nese binární formát.

seg-f3538e6651fa = Každá zpráva se používá po dobu vystředěnou v jejím okně fitu (první tabulka kompromisů používá celé okno). Hodnoty chyby vzdálenosti signálu ve vesmíru (SISRE) měří <b>chybu reprezentace</b> zprávy vůči pravdě, na kterou byla fitována, jako odmocninu ze střední kvadratické hodnoty (RMS) a maximum přes rozsah. Chyba určení a predikce dráhy, kterou ke skutečnému pozemnímu nebo palubnímu segmentu přibývá navíc, není modelována.

seg-c2b181269367 = Chyba vzdálenosti signálu ve vesmíru

seg-63462a1abc95 = <c1/> používá globálně průměrnou SISRE podle Montenbrucka, Steigenbergera a Hauschilda ({ "2018" }, <em>Advances in Space Research</em> { "61" }({ "12" }):{ "3020" }–{ "3038" }, doi <a1>10.1016/j.asr.2018.03.041</a1>):

seg-c4f654264c42 = Váhy jsou průměry přes uživatele rovnoměrně rozložené na viditelné čepičce Země z <c1/> a <c2/>, kde <c3/> je úhel nadiru zorného paprsku u družice, vypočtený pro vlastní poloměr dráhy a elevační masku. Při masce { "0" }° výpočet reprodukuje tabulku z článku pro střední oběžnou dráhu Země (GPS { "0.98" } a 1/49, GLONASS 1/45, Galileo 1/61, BeiDou 1/54) a geostacionární dráhu ({ "0.99" } a 1/126): to je kontrola <b>VALIDATED</b>. U LEO dává stejný průměr

seg-66b488889b10 = Výška

seg-c07128592d7b = úhel nadiru k obzoru

seg-a4e04d9a23a5 = { "320" } km

seg-002adc24471f = { "510" } km

seg-fe2f70c29806 = { "550" } km

seg-4dee38ff0811 = { "786" } km

seg-cfc3c6939861 = { "1080" } km

seg-102de0413553 = { "1336" } km

seg-1b11819c8b2f = takže uživatel LEO, který vidí družici daleko od nadiru, pociťuje chyby ve směru dráhy a napříč dráze mnohem více než uživatel na střední dráze.

seg-b7a844ab6135 = Analýzy

seg-17111fe25e04 = <c1/> vybírá kteroukoli ze čtyř (výchozí všechny).

seg-d0c1b335af73 = Kompromis intervalu fitu

seg-f65e99c0d8b2 = <c1/> nastavuje rozsah, intervaly fitu, periody aktualizace a modely. <c2/> ({ "550" } km, { "97.6" }°, EGM2008 do stupně { "20" } a odpor, { "30" } minut zpráv) dává při době použití rovné intervalu fitu:

seg-f1a94c795c18 = Interval fitu

seg-c6b034712788 = SISRE dráhy RMS

seg-55c287c93940 = SISRE dráhy max

seg-ad604a608329 = SISRE s hodinami RMS

seg-28723ab60ae0 = radiálně / ve směru dráhy / napříč dráze RMS

seg-911a62245e80 = { "60" } s

seg-1a35a89c1a34 = { "0.041" } cm

seg-7cf9e6e3178f = { "0.179" } cm

seg-d8a7f4c080dd = { "0.069" } cm

seg-93773d45092a = { "0.09" } / { "0.01" } / { "0.00" } cm

seg-64015edf42d8 = { "120" } s

seg-a1070c338686 = { "0.032" } cm

seg-cdacf90f8ce8 = { "0.160" } cm

seg-29aeee696ad2 = { "0.079" } cm

seg-1d2d7b57af6b = { "0.06" } / { "0.01" } / { "0.01" } cm

seg-8fa4e4ccc5cc = { "180" } s

seg-13182ae6d536 = { "0.093" } cm

seg-fc692062aaa8 = { "0.540" } cm

seg-9ef760f0777c = { "0.134" } cm

seg-9a7db44eb20e = { "0.18" } / { "0.06" } / { "0.00" } cm

seg-bbd4f2685bee = { "300" } s

seg-93410318239b = { "0.310" } cm

seg-4af8f1c977eb = { "1.033" } cm

seg-0921a535896a = { "0.329" } cm

seg-d50195d4cbea = { "0.09" } / { "0.49" } / { "0.02" } cm

seg-8de43db30454 = { "450" } s

seg-ec7f9ca7654b = { "1.690" } cm

seg-1ad55674fab9 = { "7.542" } cm

seg-a022913c956d = { "1.696" } cm

seg-31564c73398d = { "0.72" } / { "2.65" } / { "0.04" } cm

seg-21b0c99fbda4 = { "600" } s

seg-6840aea9ff12 = { "2.875" } cm

seg-798c8c1d0190 = { "10.219" } cm

seg-6b3b442069d8 = { "2.866" } cm

seg-8a53398e1999 = { "1.72" } / { "4.42" } / { "0.26" } cm

seg-4dabf1faddfc = { "900" } s

seg-d733d3fdac02 = { "9.345" } cm

seg-3334d120521b = { "34.032" } cm

seg-4d4a2cc180d0 = { "9.349" } cm

seg-7651a43f1f33 = { "6.46" } / { "14.14" } / { "0.91" } cm

seg-f1d733b03f45 = { "0.000" } cm

seg-81a60d921ce9 = { "0.057" } cm

seg-724c7750b1ca = { "0.00" } / { "0.00" } / { "0.00" } cm

seg-c8a720a6f160 = { "0.074" } cm

seg-b13f5539e4b1 = { "0.001" } cm

seg-1c9d3ee30ac7 = { "0.090" } cm

seg-7dd08c671dc7 = { "0.004" } cm

seg-740e69fcd85e = { "0.014" } cm

seg-c0db4312d8a0 = { "0.106" } cm

seg-e971c2fe0bb2 = { "0.00" } / { "0.00" } / { "0.01" } cm

seg-f3bda174cbef = { "0.037" } cm

seg-5a5bb868e8ff = { "0.176" } cm

seg-02b99fcb9fee = { "0.127" } cm

seg-e6c45fda719f = { "0.05" } / { "0.01" } / { "0.04" } cm

seg-ec1e77bc5be9 = { "0.214" } cm

seg-d3c1ed834802 = { "0.643" } cm

seg-23482e7c028f = { "0.229" } cm

seg-8f71690a7139 = { "0.28" } / { "0.09" } / { "0.26" } cm

seg-bfec9407ffae = { "1.015" } cm

seg-f295ad6efcf4 = { "3.695" } cm

seg-2cd92d16edfc = { "1.062" } cm

seg-4626119411c4 = { "1.52" } / { "0.70" } / { "0.91" } cm

seg-4e19f776d1b7 = A při fitu { "300" } s, kdy se mění, jak často se ujímá nová zpráva:

seg-89810ffbeff3 = Perioda aktualizace

seg-d4d1fa05e1a8 = { "0.314" } cm

seg-828b7488993b = { "0.850" } cm

seg-edb934c1419f = { "0.288" } cm

seg-52c8f821a7d2 = { "0.859" } cm

seg-e135107af135 = { "150" } s

seg-e7ce46d74f3e = { "0.219" } cm

seg-3391df1cf909 = { "0.830" } cm

seg-d6eb4f554461 = { "0.009" } cm

seg-22c68874002b = { "0.010" } cm

seg-2172d9ea618e = 16parametrová keplerovská sada se zhoršuje z { "0.04" } cm při { "60" } s na { "9.35" } cm při { "900" } s: jedna keplerovská sada s harmonickými dvakrát za oběh nedokáže déle než několik minut sledovat vysokofrekvenční gravitační členy a odpor oblouku LEO a její zbytek metodou nejmenších čtverců v okně kmitá. Polynomy ve směru dráhy / napříč dráze / radiálně (stupně { "7" }, { "5" }, { "6" }) pohltí zbytek: { "1.01" } cm při { "900" } s, { "0.21" } cm při { "600" } s. Při nejkratších intervalech jsou keplerovské hodnoty pod milimetrem a už nejsou přísně seřazeny (fit je pak omezen podmíněností, nikoli modelem).

seg-aca262796570 = Srovnání modelů

seg-fdf2368d0210 = <c1/> spouští čtyři modely při { "1" }, { "5" } a { "10" } minutách na téže dráze, s počtem parametrů a počtem bitů efemerid a hodin v kódování Kshana:

seg-7d3c6c43390d = Bity efemerid + hodin

seg-f7f60c66d89e = { "0.022" } cm

seg-f7bcb8a44fde = { "0.049" } cm

seg-2972b631701e = { "0.230" } cm

seg-cc42e8dc7238 = { "0.260" } cm

seg-67e50069c6f7 = { "3.061" } cm

seg-780954ab9d7f = { "3.071" } cm

seg-de81d6550264 = { "0.044" } cm

seg-fb171bf75f27 = { "0.005" } cm

seg-c8c067631f7a = { "0.120" } cm

seg-2dc41855c245 = { "0.208" } cm

seg-6ef79938dd22 = { "0.046" } cm

seg-7e96d7e34e63 = { "0.142" } cm

seg-c43199891163 = { "0.258" } cm

seg-f9a9fdebc114 = { "0.290" } cm

seg-f157ff5b40b1 = <c1/> (nulové hodiny)

seg-9474a775dc5e = { "28.784" } cm

seg-5098c8b6f813 = { "0.561" } cm

seg-5e7fdc441b03 = { "28.774" } cm

seg-82d3fa2e27ef = Řádek s nulovými hodinami se hodnotí proti hodinám řízeným se zbytkem { "0.24" } m (hodnota ATOMIC), ostatní proti volně běžícím hodinám, které fitují.

seg-769db176020f = <b>Liu et al. { "2025" }, SISRE v závislosti na výšce (MODELLED).</b> Tentýž scénář fituje 22parametrový model Kshana na 20minutových obloucích v pěti výškách z článku, při inklinaci každé družice:

seg-01e587427a7e = Družice

seg-f6bbd3d5d75c = Inklinace

seg-c54d0bd7d498 = Liu et al. { "2025" }

seg-16c489b75f44 = Kshana (RMS jen dráhy)

seg-ee4816ca13c1 = poměr

seg-510349500d23 = { "8.88" } cm

seg-a97bde451ec2 = { "4.25" } cm

seg-b6c1d48847d9 = { "475" } km

seg-f79249e9bd75 = { "6.21" } cm

seg-9b6757a674a5 = { "2.87" } cm

seg-62008169ca69 = { "2.20" } cm

seg-06a4bcde0ea3 = { "966" } km

seg-9e5e06ec23c3 = { "2.11" } cm

seg-41ce80bc0b62 = { "1.25" } cm

seg-c9f63cd8bd07 = { "0.75" } cm

seg-f11a960a1d52 = { "0.51" } cm

seg-0376cf5f98f0 = <b>Nejde</b> o ověření proti nezávislé vnější referenci. Článek fitoval skutečné přesné vědecké dráhy uvedených družic (s jejich úplnou historií gravitace, odporu a negravitačních sil); Kshana fituje vlastní integrovanou dráhu, vyhodnocuje šest přidaných parametrů tak, jak je popsáno výše, a používá vlastní váhy SISRE. Srovnání ukazuje trend a řád velikosti. Srovnání na týchž skutečných drahách, které článek fitoval, je <c1/> (od { "0.30" } se 22parametrový fit tam shoduje v rámci předregistrovaného činitele { "1.5" }, ve dnech z článku i v osmi utajených dnech).

seg-d82887c766e3 = Aktualizace uprostřed přeletu

seg-d1104b6ea7fa = <c1/> umístí uživatele (výchozí { "45" }° s. š., { "10" }° v. d.), najde nejvyšší přelet nad maskou v rámci <c2/> a naplánuje zprávy každých <c3/>. Při každém přepnutí uvnitř přeletu uvádí skok polohy, skok hodin, skok pseudovzdálenosti uživatele (nová zpráva minus stará), největší skok, který by mohl vidět kterýkoli viditelný uživatel (uzavřený tvar přes kužel nadiru), chybu vzdálenosti před a po a PASS nebo FAIL vůči <c4/>. <c5/> (fity { "300" } s aktualizované každých { "150" } s):

seg-7d91304c87e3 = Nejvyšší přelet za den dosahuje { "43.7" }° a trvá { "455" } s. Jeho přepnutí:

seg-289e8da49cc8 = Přepnutí

seg-e80d12ee2259 = Elevace

seg-b16789d14338 = Skok polohy

seg-b3c252609532 = Skok hodin

seg-8239a390ec71 = Skok vzdálenosti uživatele

seg-4153faf7969d = Skok při nejhorší geometrii

seg-14402c7fb332 = IOD { "270" } → { "271" }

seg-7862a97ac55f = { "0.07" } mm

seg-4cfe934c881f = { "0.19" } mm

seg-9e9752920165 = -0.17 mm

seg-4267557786be = { "0.27" } mm

seg-46872e8925b2 = IOD { "271" } → { "272" }

seg-4c803fd2ccc9 = { "0.14" } mm

seg-cc9a8388f6bc = -0.24 mm

seg-0549f7fd0633 = IOD { "272" } → { "273" }

seg-ad1afcf9a466 = -0.22 mm

seg-c1b30171b4f0 = { "0.35" } mm

seg-f93647402fa9 = { "0.48" } mm

seg-69b35182807c = Největší skok vzdálenosti uživatele { "0.35" } mm oproti prahu { "5" } cm: <b>PASS</b>.

seg-96dcb456600d = Kódování a dekódování

seg-1b3674a0e041 = <c1/> zakóduje první ze tří zpráv, dekóduje ji, zkontroluje CRC a odmítne poškozenou kopii, vytiskne rozpočet kvantizace a zapíše a zpětně načte blok ve stylu RINEX a tabulku CSV:

seg-480eb9ffc333 = rámec: { "171" } bajtů ({ "1310" } bitů užitečného zatížení, z toho { "1045" } tvoří efemeridy a hodiny), 24bitová cyklická redundantní kontrola (CRC-24Q) <c1/>;

seg-0e2a64a063fd = největší účinek půlkroku kteréhokoli jednotlivého pole: <c1/>, { "0.545" } mm;

seg-a1875f7088b0 = celá zpráva po kvantizaci: poloha v rozmezí { "1.126" } mm a hodiny v rozmezí { "0.185" } mm od přesné zprávy; SISRE { "0.113" } cm přesně, { "0.129" } cm po dekódování;

seg-6e818708b695 = rámec s jedním převráceným bitem je odmítnut: true;

seg-31fe0f6b133d = zpětný převod RINEX v rozmezí { "5.0e-06" } m, zpětný převod CSV v rozmezí { "0.0e+00" } m.

seg-405cf34090cc = Nezávislost na platformě

seg-7f2193f6ff06 = Rámec jsou vysílaná celá čísla, takže musí být tatáž celá čísla, ať a jakkoli scénář běží: nativní binární program v libovolném operačním systému, ladicí nebo vydané sestavení a sestavení WebAssembly (WASM) v prohlížeči. Překážely tři věci. Sinus, kosinus, arkustangens a exponenciála matematické knihovny hostitele se nemusejí zaokrouhlovat správně a mezi hostiteli se liší na posledním místě. Optimalizované sestavení na macOS bere sinus a kosinus jednoho argumentu ze společné rutiny systému, která nevrací vždy hodnotu samostatného sinu, takže se lišilo i ladicí a vydané sestavení. A obvyklý generátor normálního rozdělení volá ve svých vzácných větvích exponenciálu a logaritmus hostitele. Fit z tak malého rozdílu udělá různá kvantizovaná pole. Celý druh (pravá dráha a hodiny, fit, uživatelský algoritmus, chyba vzdálenosti signálu ve vesmíru (SISRE), kodek) proto počítá každou takovou funkci pomocí knihovny <c1/> v čistém Rustu přes <c2/>, celočíselné mocniny jako explicitní součiny a normální odchylky polární metodou ze surového výstupu generátoru. <c3/> připíná 171bajtový rámec scénáře kódování a dekódování níže a jednu kontrolní hodnotu pro každý model efemerid; ladicí sestavení, vydané sestavení a sestavení WASM dávají bajtově shodné dokumenty výsledků pro všech pět přibalených scénářů <c4/>.

seg-1ef00467df17 = Binární formát

seg-af2dae9e9e7c = <b>Toto je vlastní zdokumentované kódování Kshana.</b> Nese složky, které uvádějí zveřejněné popisy navigačních zpráv LEO, podle sady polí Galileo ICD. <b>Není</b> to bitové rozložení Celeste ani žádného jiného systému: žádné není veřejné.

seg-6a730c01ad1c = Rámec: preambule <c1/> ({ "8" } bitů), verze { "1" } ({ "4" }), model ({ "4" }: { "1" } <c2/>, { "2" } <c3/>, { "3" } <c4/>, { "4" } <c5/>), délka užitečného zatížení v bajtech ({ "12" }), užitečné zatížení doplněné nulami na celý bajt, CRC-24Q (24bitová cyklická redundantní kontrola, { "24" } bitů) přes každý předchozí bajt. CRC-24Q je kontrola standardu Radio Technical Commission for Maritime Services RTCM { "10403" } a Galileo ICD (polynom <c6/>, počáteční hodnota { "0" }); kód reprodukuje katalogovou kontrolní hodnotu <c7/> pro <c8/> a kontrolní bajty příkladového rámce zprávy typu { "1005" } podle RTCM { "10403" } (<b>VALIDATED</b>).

seg-a31d899eb435 = Kroky Galileo ICD byly zvoleny pro střední oběžnou dráhu Země a pro centimetrovou zprávu LEO jsou příliš hrubé: <c1/> v krocích { "2" }⁻⁵ m ({ "3.1" } cm), <c2/> { "2" }⁻²⁹ rad ({ "1.3" } cm při poloměru LEO), úhly { "2" }⁻³¹ půlkruhu ({ "1.0" } cm) a <c3/> { "2" }⁻³⁴ s ({ "1.7" } cm). Kshana ponechává jednotky ICD a konvenci půlkruhu, zjemňuje kroky tak, aby chyba půlkroku každého pole zůstala pod { "1" } mm polohy nebo vzdálenosti v 15minutovém okně, a rozšiřuje pole, aby zachovala rozsahy, které fit LEO potřebuje:

seg-caddc6f5b9a7 = Blok

seg-b548b723c201 = Bity

seg-d00b65801e9b = Krok

seg-2085d172bec3 = pomocné údaje a synchronizace

seg-7e9018f82811 = týden

seg-45cbfedb6f0e = hodiny (příznakový bit { "0" })

seg-05d274f5ce99 = s/s^{ "2" }

seg-9d6d5136e12a = keplerovské (modely 1-3)

seg-3fb59c8238cb = půlkruh

seg-d173e8d7026c = m^{ "0.5" }

seg-48c8bfb6e914 = korekce ve směru dráhy / napříč dráze / radiální (model { "2" })

seg-131652f53721 = doplňky Liu et al. { "2025" } (model { "3" })

seg-fccf37a24fc4 = půlkruh/s^{ "2" }

seg-ebde561c17ab = polynom ECEF (model { "4" })

seg-822c7482547c = Klobuchar (příznakový bit { "1" })

seg-7dd6e8bcaf43 = s/půlkruh^{ "2" }

seg-09408b08c481 = s/půlkruh^{ "3" }

seg-734162101b2d = NeQuick-G (příznakový bit { "2" })

seg-ddbb363f4593 = sfu/deg^{ "2" }

seg-e2744b31e5d3 = UTC (příznakový bit { "3" })

seg-545755e7b26f = Hodnota mimo rozsah svého pole je odmítnuta, nikoli zalomena. Rozsahy byly ověřeny kódováním fitů při { "300" } až { "2000" } km, inklinacích od { "0" }° do { "140" }° a intervalech fitu do { "20" } minut: <c1/> a <c2/> jsou široké, protože na téměř rovníkové dráze je uzel špatně definován a fit mezi ně rozděluje drift J2 argumentu šířky, a <c3/> a <c4/>, protože 22parametrový fit přes { "20" } minut pohlcuje část krátkoperiodického kmitání hlavní poloosy. Od { "0.30" } je 22parametrový fit prostou metodou nejmenších čtverců z článku bez apriorních hodnot a rovníkový fit { "800" } km pak potřebuje <c5/> přibližně { "6.3e-10" } půlkruhu/s^{ "2" }, takže jeho měřítko přešlo z { "2" }^-60 na { "2" }^-58. Korekce ve směru dráhy stupně 7 z <c6/> se vejdou do rozsahu 22bitového koeficientu až do { "15" } minut; delší fit jej může překročit a je pak odmítnut. <c7/> pro každé pole efemerid a hodin uvádí největší změnu polohy a vzdálenosti, kterou způsobí změna o půl kroku v době použití, a změnu celé zprávy po kvantizaci.

seg-1ad17f3d3643 = Textové exporty

seg-81fb376aa1e1 = <b>RINEX { "4.02" } nedefinuje žádné navigační záznamy LEO</b> (jeho písmena systémů jsou G, R, E, J, C, I a S; <a1>RINEX { "4.02" } z International Global Navigation Satellite System (GNSS) Service (IGS)</a1>). Blok, který zapisuje <c1/>, přebírá tvar RINEX { "4" } — hlavičku záznamu <c2/>, řádek družice a epochy se třemi hodinovými členy, řádky vysílané dráhy se čtyřmi poli <c3/> — a je <b>zdokumentovaným rozšířením Kshana</b>: písmeno systému <c4/>, typy záznamů <c5/>, <c6/>, <c7/>, <c8/> a tři komentáře v hlavičce, které to uvádějí. Dřívější práce o drahách LEO v navigačních záznamech ve stylu RINEX 4: <a2>arXiv { "2401.17767" }</a2>.

seg-9a3016441bce = Tabulka CSV nese zprávy <c1/> a <c2/>, jednu na řádek. Výchozí sloupce používají názvy z Galileo ICD (<c3/>); <c4/> místo nich vybírá pravopis předvolby. Oba formáty se načítají zpět.

seg-4a26902d2771 = Ionosféra a UTC

seg-c4d4dd2bac45 = <b>Klobuchar</b>: model L1 enginu (<c1/>, ověřený proti RTKLIB) přepočtený na nosnou zákonem prvního řádu <c2/>.

seg-0d3973f04ee5 = <b>NeQuick-G</b>: koeficienty putují ve zprávě a <c1/> vrací <c2/> pro upravenou magnetickou šířku <c3/> podle pravidel algoritmu (nulové koeficienty dávají { "63.7" } jednotek slunečního toku, sfu; výsledek je omezen na [{ "0" }, { "400" }] sfu). Model elektronové hustoty NeQuick a jeho integrace po šikmé dráze, které z <c4/> dělají zpoždění, <b>nejsou</b> implementovány.

seg-66dbd447dfeb = Družice ve výšce několika set kilometrů létá uvnitř ionosféry. Žádný z vysílaných modelů nezohledňuje elektronový obsah nad družicí a žádná korekce na něj se neuplatňuje.
