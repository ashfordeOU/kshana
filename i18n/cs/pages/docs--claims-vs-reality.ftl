# docs--claims-vs-reality: translations (cs)

seg-a47934361f43 = Proudy NMEA pro výcvik posádek

seg-ee2e250497f9 = Export pro testovací bench

seg-2bd2101ce454 = Povrch

seg-ad856ad710eb = Stav

seg-80f3f0aae42c = Mapa interference

seg-98d0bc6b40ce = Mapování na veřejné rámce (compliance)

seg-28b1885c4ca7 = Zdroj: <c1/>

seg-bf5c2811ce29 = Tvrzení a skutečnost: registr přehnaných tvrzení

seg-592e007bc3cf = Nezávislý audit dřívější verze { -brand } zaznamenal čtrnáct <b>přehnaných tvrzení</b> (<c1/>…<c2/>): míst, kde veřejně přístupná plocha (README, hřiště, štítky FoM (ukazatel kvality), balíčky scénářů) popisovala schopnost silněji, než kód poskytoval. Tato stránka je registr uzavření: každý řádek uvádí původní přehnané tvrzení, jak bylo vyřešeno, a důkaz. Vyskytují se dva druhy řešení:

seg-39250970dbbf = <b>Odtvrzeno</b>: formulace byla opravena tak, aby odpovídala kódu (poctivé přerámování, bez změny schopnosti). „Žádný kód = žádné tvrzení.“

seg-fb7da0f79ead = <b>Překonáno</b>: skutečná schopnost byla následně vytvořena a otestována, takže silné tvrzení se stalo <em>přesným</em>.

seg-5292f7162e2b = Regresní ochrana (<c1/>) při každém běhu CI (kontinuální integrace) prohledává živé veřejné plochy (<c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/> a úvodní stránky crates.io, PyPI (Python Package Index) a npm <c8/>, <c9/>, <c10/>) a selže, pokud se některá z vyřazených holých přehnaných formulací objeví znovu bez výhrady, takže řádek nemůže tiše sklouznout zpět ze stavu GREEN.

seg-dafc6f322f34 = Všech čtrnáct řádků je <b>GREEN</b>.

seg-5cf7bf2d1889 = OC (přehnané tvrzení)

seg-0e01d4053d7f = Původní přehnané tvrzení

seg-36bf87638923 = Řešení

seg-70a952c4150b = „společný Kalmanův fúzní estimátor“ naznačoval jediný filtr s křížovou kovariancí; kód spouštěl dva nezávislé estimátory

seg-d5682a7fdb11 = <b>Překonáno</b>: byl vytvořen skutečný Kalmanův filtr hodin a polohy svázaný křížovou kovariancí

seg-1008020cd9e4 = <c1/> ({ "7" } testů, včetně souboru 100 pokusů porovnávajícího svázaný a nesvázaný filtr, který vyžaduje, aby RMS (střední kvadratická hodnota) polohy svázaného filtru byla pod { "0.6" }× nesvázaného a aby svázaný filtr vyhrál alespoň v { "90" } ze { "100" } pokusů); CAPABILITY „Sensor fusion“ → full

seg-334fc345d501 = „RAIM (autonomní monitorace integrity přijímače) detekce spoofingu podporovaná hodinami“ naznačovala vícedružicový detektor RAIM

seg-cf0795c2ee02 = <b>Odtvrzeno → Překonáno</b>: přerámováno na mez detekovatelnosti spoofingu ze stability hodin; následně přibyl skutečný RAIM/ARAIM (HPL/VPL (HPL: horizontální ochranná úroveň; VPL: vertikální ochranná úroveň))

seg-f46432acbfa0 = <c1/> ({ "30" } testů: snapshotový RAIM + ARAIM se separací řešení, HPL/VPL, FDE (detekce a vyloučení poruch), Stanfordovy diagramy); <c2/>

seg-8b47f69dbb76 = „demonstrátor rušení (jamming)“ bez jakéhokoli kódu rušení

seg-bfff34d5a250 = <b>Překonáno</b>: byl vytvořen model rušení (jamming) podle rozpočtu spoje J/S → efektivní C/N₀ → ztráta vazby

seg-5f75628b8201 = <c1/> ({ "10" } testů); řádek „Resilience“ v README

seg-bae512770cd6 = „Plný model šumu IMU (inerciální měřicí jednotka) podle Allanova rozptylu na trojosé IMU“: model byl jednoosý

seg-50c0b5855cb9 = <b>Odtvrzeno → Překonáno</b>: přerámováno na jednoosý (1-DOF (DOF: stupeň volnosti)) rozpočet chyb; následně byl dodán tříosý strapdown INS (inerciální navigační systém)

seg-501bf7d8fff0 = <c1/> tříosý strapdown (orientace kvaterniony, mechanizace NED (sever-východ-dolů), coning/sculling); ROADMAP „Inertial“

seg-ad250a99b05f = „Integrace hybridního PNT (určování polohy, navigace a času)“ naznačovala svázaný filtr GNSS/INS (GNSS: globální družicový navigační systém); byl to rozpočet chyb dead-reckoningu

seg-85fb58d37a5d = <b>Odtvrzeno → Překonáno</b>: přerámováno na dead-reckoning s nastavitelným opětovným zachycením; následně byla dodána skutečná těsně vázaná fúze GNSS/INS

seg-9e6b092d5656 = <c1/> (UKF (Kalmanův filtr typu unscented) s 17 stavy s dead-reckoningem quantum-CAI (CAI: atomový interferometr se studenými atomy)); CAPABILITY „Sensor fusion“ → full

seg-46a637f8e967 = „ověřeno ~{ "2" } %“ naznačovalo těsnou vynucenou bránu

seg-5e98d7664558 = <b>Odtvrzeno</b>: <c1/> uvádí <em>vynucenou</em> bránu ({ "20" }–{ "25" } % průměrováno přes seedy); „~{ "2" } %“ bylo označeno jako typické pozorování, nikoli jako brána

seg-84f4fcdc7e50 = <c1/> záhlaví „On tolerances“

seg-85ec2fe9c7f7 = „deterministické napříč platformami“ bez doloženého důkazu

seg-6e516f04db89 = <b>Odtvrzeno</b>: toolchain připnut na přesné vydání; hashe zlatých hodnot pro jednotlivé scénáře jsou zapsány s bránou reprodukovatelnosti. (Bitová shoda <em>napříč</em> OS/architekturami (OS: operační systém) zůstává otevřenou položkou, uvedenou poctivě.)

seg-9db327be56c3 = <c1/> (kanál <c2/>); <c3/> (číselné hodnoty na { "1e-6" }); <c4/> (hash vstupního otisku a tvaru každého výsledku, spouštěný v matici CI pro Linux, macOS a Windows); <c5/>

seg-2708139388ed = „hybridní kvantově-klasický simulátor PNT“ naznačoval kvantovou fyziku z prvních principů

seg-717167714e83 = <b>Odtvrzeno → Překonáno</b>: přerámováno na simulátor odolnosti PNT používající modely výkonu kvantových senzorů; následně přibyla fyzika CAI typu Mach–Zehnder z prvních principů

seg-c67fb22add4b = <c1/> ({ "26" } testů: fáze Mach–Zehnder, projekční šum <c2/>, přenosová funkce vibrací, Coriolis + systematické chyby AC-Stark (AC: střídavý proud)); <c3/>

seg-5c6b7d4f2029 = ukazatel kvality „Integrity Performance“ naznačoval letecký typ integrity HPL/VPL/RAIM

seg-ee5487da890c = <b>Odtvrzeno + Překonáno (vrstveně)</b>: ukazatel kvality scénáře pro jednotlivý běh je poctivě označen jako <em>vnitřní konzistence filtru</em> (<b>nikoli</b> letecká integrita); skutečné ARAIM HPL/VPL je zpřístupněno <em>zvlášť</em>, aby se obojí nikdy nezaměňovalo

seg-31aacdf17b02 = <c1/> (<c2/>: vnitřní konzistence, s výhradou); <c3/> + <c4/> (skutečné ARAIM)

seg-0686fa147c96 = ukazatel kvality Security prezentovaný jako vždy smysluplný, i bez útoku

seg-d6d9296422fc = <b>Odtvrzeno</b>: ukazatel kvality Security (<c1/>) je zasazen do kontextu detektoru spoofingu a je smysluplný jen tehdy, když je nastaven scénář s útokem

seg-8f7b211b5a0c = řádek „Resilience“ v README; ukazatel kvality Security je definován v provozně škodlivém specifikačním bodě

seg-d66421174e94 = ukazatel kvality „Positioning Performance“ naznačoval plnou přesnost v oblasti polohy

seg-9eeb13a16350 = <b>Odtvrzeno</b>: u inerciálního a hybridního balíčku označeno jako jednoosé (1-DOF) <c1/>, výslovně <b>nikoli</b> jako 2D CEP/2DRMS (CEP: kruhová pravděpodobná chyba) ani přesnost vážená DOP (DOP: zhoršení přesnosti)

seg-e8115df73c10 = tabulka ukazatelů kvality v README (řádek „Positioning Performance“)

seg-5c73759a2454 = čísla inerciálních ukazatelů kvality čtená jako statistika souboru z jednotlivých seedů

seg-3db3a41ce848 = <b>Odtvrzeno</b>: jediný běh je označen <c1/>; <c2/> uvádí průměr, rozptyl a bootstrapový { "95" }% interval spolehlivosti

seg-bf737455e6f2 = tabulka ukazatelů kvality v README; testy obálky pokrytí scénářů

seg-aa362992b5da = scénář „konstelace SGP4 (Simplified General Perturbations { "4" }) GPS (Global Positioning System)“ používal syntetické zástupné TLE (dvouřádkové sady elementů)

seg-ebae20813a52 = <b>Překonáno</b>: scénář nyní vkládá skutečný datovaný snímek Celestraku <c1/> se striktními kontrolními součty

seg-2d49f6101571 = <c1/> (skutečné <c2/>, <c3/>); <c4/>

seg-cdefa4ee436a = řetězec verze v README se rozcházel s <c1/>

seg-8e66b9485565 = <b>Odtvrzeno</b>: brána CI ověřuje, že stavový odznak v README odpovídá <c1/>

seg-347fd8c1f334 = { "0.35" }: tvrzení udržena úzká a jedna oprava

seg-946ff389cec5 = Funkce verze { "0.35" } byly napsány s výslovně uvedenými limity vedle tvrzení a tytéž ochrany (<c1/> a ochrana formulací v <c2/>) prohledávají stránky, které je popisují. Tato tabulka není součástí čtrnáctiřádkového registru výše; zaznamenává pro nové plochy, co se tvrdí a co ne.

seg-6ac3f9b26aad = Co se tvrdí

seg-6f558815da86 = Co se netvrdí

seg-d0964d2f9bbc = Skóre důvěryhodnosti plavidla (<c1/>, <c2/>, brána, Signal K, OpenCPN)

seg-ee4d75006bfc = skóre 0–100 a důvody z vlastního NMEA přijímače, MODELLED

seg-59ff27c84fe4 = poradní charakter, nikoli typově schválené navigační zařízení; skóre jednoho záznamu nevypovídá o jiných přijímačích; nezpřesňuje fixaci

seg-8869e6a5c10b = syntetické mostové NMEA se skriptovanými událostmi a záznamem instruktora

seg-bc4ba77bc569 = pouze text, žádný výstup v rádiovém kmitočtu; nikdy pro živé navigační systémy plavidla; poradní charakter, nikoli typově schválené navigační zařízení

seg-9482ecbb2748 = podepsaný technický záznam, který lze ověřit offline

seg-20ae6dd2b780 = není právním stanoviskem; neříká, co událost způsobilo, kdo za ni odpovídal ani že záznam ukazuje, co přijímač skutečně přijal

seg-4132fc36f1d3 = souhrnné buňky zhoršené navigace z otevřeně licencovaných hlášení

seg-c64960abf9fb = není předpověď; expozice trasy je podíl buněk, nikoli riziko

seg-ed6d268e0291 = pohyb vozidla a události scénáře v souborech, které umí číst laboratorní simulátor

seg-85c8ad22ef03 = nezapisuje se žádný signál; netvrdí se žádný výkon simulátoru ani přijímače

seg-1bba9a883650 = které řádky sada běhů podporuje důkazy pro (supports evidence for), s mezerou u každého řádku

seg-f2a836780831 = nikdy že je rámec splněn nebo produkt schválen; samotný štítek druhu není důkazem

seg-31c7009c9914 = <b>Oprava zaznamenaná ve verzi { "0.35" }.</b> Dřívější verze <c1/> a komentářů modulu odolnosti popisovaly sedm „kategorií technik“ rámce DHS Resilient PNT Conformance Framework. Verze { "2.0" } tohoto rámce definuje základní funkce (Prevent, Respond, Recover), úrovně { "0" } až { "4" } a osm číslovaných požadavků, nikoli seznam sedmi kategorií. Sedm názvů dílčích skóre, které bodovací engine vydává, jsou vlastní názvy { -brand } a křížová tabulka to nyní uvádí.

seg-f70787ecb194 = Jak řádek zůstává GREEN

seg-f2c599e8882a = Silná tvrzení (OC-0/2/7/8 a překonané poloviny OC-1/3/4/12) jsou GREEN, protože schopnost je <b>dodána a otestována</b>, nikoli proto, že by se formulace změkčila. Odtvrzené řádky jsou GREEN, protože živá formulace odpovídá kódu. Ochranný test činí druhou kategorii vynutitelnou: pokud se vyřazená přehnaná formulace vrátí na veřejnou plochu, CI zčervená. Viz <c1/>.

seg-39e475441b60 = <s1>Předchozí</s1>Proč řádky zůstávají modelované

seg-07ef8e1e862e = <s1>Další</s1>Původ
