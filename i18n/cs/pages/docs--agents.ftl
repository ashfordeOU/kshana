# docs--agents: translations (cs)

seg-0619151df586 = Zdroj: <c1/>

seg-d0e198572cfe = Použití Kshana z agenta AI

seg-eccd1d5fbdb2 = Pro agenta (nebo osobu, která ho řídí): který nástroj volat pro kterou otázku, co nástroje udělají a co neudělají a co ponechat u každé odpovědi. Povrchy a buňky, které na daném povrchu nejsou dostupné: <a1><c1/></a1>.

seg-a0354cacda4c = Připojení

seg-337d23a873f5 = Pasáž uvádějící klienty AI třetích stran je zde vynechána; je v <a1>docs/AGENTS.md</a1> na GitHubu.

seg-01a862ed86e6 = Pravidlo pro každou odpověď

seg-0adf5e5ad79a = Spusťte engine; čísla neodhadujte. Uveďte, co nástroj vrátil, s jednotkou a úrovní důkazů (VALIDATED proti vnějšímu orákulu, nebo MODELLED), scénářem, seedem a verzí enginu, aby bylo možné běh zopakovat. U každého výsledku ponechte jeho vlastní výhrady.

seg-f67845b891c5 = Který nástroj pro kterou otázku

seg-6f4bb4962340 = Otázka

seg-8efda304925b = Nástroj (MCP)

seg-83d609ff5cc7 = Příkaz s lomítkem

seg-9b937d3cbf88 = Spustit nebo vysvětlit scénář PNT (oběžné dráhy, GNSS, časování, fúze, Měsíc, optické spoje, ...)

seg-ba8b3824bba2 = Byl tento záznam přijímače nebo NMEA tohoto plavidla důvěryhodný a kdy přestal být?

seg-f3ea74f278ac = <c1/> (libovolný formát záznamu), <c2/> (NMEA plavidla, dávka), <c3/> (omezený výňatek)

seg-aa194fda4300 = Potřebuji syntetické NMEA s událostí rušení, odtržení odporu, podvržení času nebo přehrání pro trénink

seg-0211b49536df = Zobrazit skóre důvěryhodnosti plavidla v monitorovacích formátech nebo formátech SIEM (Prometheus, CEF, LEEF, OTLP)

seg-701250dfa798 = Ohodnotit záznam přijímače proti zveřejněnému plánu Jammertest (latence detekce, nezachycené poplachy, falešné poplachy, čas zotavení), nebo tento plán proměnit v události

seg-d1c81008d5f8 = Vytvořit záznam odolný proti manipulaci o tom, co engine řekl o okně záznamu plavidla, nebo takový záznam zkontrolovat

seg-b7892674ac60 = Navigační data kterých družic Galileo tento proud přijímače ověřuje (OSNMA)?

seg-084a787c65cf = <b>žádný: není na MCP.</b> Použijte <c1/> (CLI), <c2/> (Python) nebo <c3/> (WASM, karta OSNMA ve Studiu)

seg-4fc021a0a145 = není příkaz s lomítkem

seg-0f5db62071e9 = Potřebuji pohyb vozidla a časy událostí scénáře k přehrání přes laboratorní simulátor GNSS

seg-919946a95002 = Pro které řádky požadavků veřejných rámců tyto běhy podporují důkazy (supports evidence for) a jaká je mezera?

seg-5e08ec7f4852 = <c1/> (z textu výsledku), <c2/> (tabulky, bez běhů)

seg-ff6556a46025 = Spustit bodovaný standardní balíček (testovací profily DHS RPCF, IMO MSC.1/Circ.1575, ICAO Doc { "9849" } Appendix F) proti prahům stanoveným před během?

seg-709c6501a661 = <c1/>, <c2/> (zprávu předejte nástroji <c3/> kvůli řádkům)

seg-1745cce01677 = Zkontrolovat LunaNet Augmented Forward Signal (kódy, SB1, formát rámce) proti LNIS V5 / LSIS-AFS V1.0, nebo zkontrolovat proud symbolů?

seg-d4d2e950054c = <c1/> (<c2/> spec, symbols nebo generate); LDPC a CRC-24Q podrámců { "2" } až { "4" } nejsou ověřeny

seg-86c207c3996e = Spojit laboratorní běh (scénář, uvedené podmínky testu, záznam přijímače, skóre) v jednom podepsaném balíčku?

seg-25bb29e6aa3d = <c1/> po <c2/> (<c3/>)

seg-3856b38bb9d2 = Ohodnotit odevzdání detekce nebo holdoveru proti souboru pravdy kshana-bench, nebo vykreslit soubory výsledků jako stránku žebříčku?

seg-87e686c064ce = Potřebuji scénář, který proletí trasu GeoJSON (terrain-nav, terrain-slam, gravity-map, combined-altpnt)

seg-bf72fff11d84 = Které družice vidí uživatel v ulici, v přístavu, ve fjordu nebo na kontejnerovém terminálu a jaké jsou DOP a elipsa chyby?

seg-86eb2756fd7f = <c1/> (požadavek, nebo <c2/>); sekce <c3/> scénáře přes <c4/> (<c5/> a <c6/> potřebují <c7/>)

seg-bd7f9d7e8e27 = Kde GNSS vypadalo zhoršeně a kolik z této trasy v tom leží?

seg-908b6e65372f = <c1/>, potom <c2/>

seg-1f715d5e0c4f = Záznamy IQ GNSS (scéna, akvizice, sledování, přijímací část, kampaně)

seg-5569efd18c6b = nejprve <c1/>, potom nástroje <c2/>

seg-d44650438742 = Dovednosti (skills) <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/> a <c7/> nesou níže uvedená pravidla pro agenty, kteří dovednosti načítají.

seg-a4de5a40b743 = Co který nástroj neudělá

seg-3f27662a983e = <b>Číst ani zapisovat soubory.</b> Obsah je vložený: vstupy jsou text v požadavku, omezený na { "4" } MiB, a pole scénáře, které pojmenovává soubor, je odmítnuto. Pouze nástroje <c1/> sahají do složky, a to jen do té pojmenované v <c2/>, přičemž každá cesta je do ní uzavřena.

seg-3efe81d26cad = <b>Ověřovat OSNMA.</b> Neexistuje nástroj MCP: vstupem je dlouhý surový proud přijímače (stránky I/NAV nebo záznam UBX), který se hodí pro CLI a Python, a nástroj, který by ho přijímal, by přidal povrch pro velké vstupy bez užitku. Odkažte uživatele na <c1/> (nebo Python <c2/>). Ať výstup říká cokoli, ponechte slovo od slova poradní upozornění: pouze stav autentizace, nikoli služba integrity navigace, nikoli typově schválené navigační zařízení a žádné tvrzení o výkonu proti spoofingu; výsledek má smysl jen s kořenem Merkle nebo veřejným klíčem, který uživatel získal jinou cestou.

seg-b13a75d08152 = Spouštět proces.

seg-9dfcbee6fdb8 = <c1/> jako běžící proud (s bránou a <c2/>), exportéry telemetrie (<c3/>: Prometheus, syslog, OTLP) a streamování tréninkového NMEA na adresu jsou pouze na příkazovém řádku. <c4/> ohodnotí výňatek týmž enginem a nezapisuje na žádný port. Nástroje pro výňatky vrací živé schéma JSON-lines { "1.3" } (výrok <c5/> a družicovou <c6/> u každé epochy, <c7/> u každé dedukce); CSV běhu plavidla začíná komentářovým řádkem <c8/> nesoucím tentýž výrok, proto ho čtěte s volbou pro komentáře. <c9/> a <c10/> se vážou na adresu loopback, pokud není řečeno jinak.

seg-ac51aad84893 = Zapisovat signál.

seg-ad032dee3fd3 = <c1/> vrací pohyb vozidla a označené intervaly událostí jako text; nic z toho, co vrací, není radiofrekvenční ani základopásmový signál, nemodeluje ho ani neřídí, a událost není návod, jak vytvořit interferenci. Předejte jeho <c2/> spolu se soubory; simulátor a jeho provozovatel odpovídají za to, že je spouštějí jen tam, kde je to povoleno.

seg-39f3aae1143a = Říkat víc, než říká mapování.

seg-ed04b567fc87 = <c1/> uvádí, pro které řádky rámců sada běhů podporuje důkazy, s mezerou každého řádku. Nikdy neříká, že rámec je splněn nebo že produkt je hodnocen či schválen; <c2/> ponechte slovo od slova a říkejte „podporuje důkazy pro (supports evidence for)“, nic silnějšího. Čte text výsledků a scénářů, který předáte, nikdy cestu.

seg-eda73a8fcbfe = <b>Stahovat data.</b> Stahování polygonů pevniny je pouze na příkazovém řádku a vyžaduje <c1/>. Soubor pevniny, je-li třeba, předejte jako text. Používejte jen data, k jejichž použití je uživatel oprávněn.

seg-d513f734248e = <b>Cokoli vysílat nebo syntetizovat RF.</b> Tréninkový generátor zapisuje text NMEA; vrstva IQ zapisuje soubory vzorků pro softwarové přijímače.

seg-63eb4c5b4a17 = Co ponechat u odpovědi

seg-6555ff9a6d8e = Výstup

seg-a056a59fb678 = Ponechat

seg-c01c0fedd895 = Geometrie družic a třídy dedukcí ({ "0.36" })

seg-3723ec5a3f8c = Uveďte geometrii vedle skóre a třídu každé dedukce tak, jak byla vrácena: <c1/> znamená obloha (výrok o obloze, nikoli zjištění, že k žádnému útoku nedošlo), <c2/> prostředí signálu, <c3/> důkaz podobný útoku. Říkejte „geometrie neznámá“, je-li stav <c4/> (v záznamu není GSV ani GSA); žádnou nedomýšlejte. Prahy jsou <b>MODELLED</b> s uvedeným původem.

seg-0938dfb71d72 = Skóre důvěryhodnosti přijímače

seg-8e3a7376cd6b = <b>Pouze poradní charakter</b>: nejde o typově schválené navigační zařízení (IEC { "61108" }, IEC { "61162" }); odpovědný zůstává provozovatel. <b>MODELLED</b>. Uveďte limity plavidla před během a práh nenaladěte podle výsledku. Vysoké skóre není důkazem pravé polohy; kontroly nevidí spoofer, který je konzistentní s každým dalším senzorem.

seg-ae3f0548e93f = Balíček důkazů

seg-81189f29f884 = <b>Technický záznam</b>, nikoli právní stanovisko, zjištění skutečností ani schválení. Ověřte veřejným klíčem podepisujícího, který jste získali jinou cestou; bez něj je verdikt <c1/>, což dokazuje jen integritu proti klíči, který si balíček sám uvádí: říkejte „neporušeno, podepisující nezjištěn“, nikdy „ověřeno“. Nikdy nevracejte, nelogujte ani nežádejte seed podpisu v konverzaci, záleží-li na klíči: použijte CLI.

seg-512e5ee42c1e = Tréninkové NMEA

seg-c59a76aefff5 = <b>Pouze text</b>, pro trénink a testování, <b>nikdy</b> pro živé navigační systémy plavidla. Vraťte seed a záznam instruktora.

seg-14781c19be62 = Mapa interference, expozice trasy

seg-7135c6f44d49 = Způsob čtení kódů přesnosti a geometrie mřížky a trasy jsou <b>VALIDATED</b> proti nezávislým knihovnám na syntetických vstupech; prahy metody zůstávají <b>MODELLED</b> a to, že zhoršená buňka je interference, se <b>nekontroluje</b>: zhoršená buňka interferenci jako příčinu <b>neurčuje</b>. Nepozorovaná buňka <b>není</b> důkazem čisté trasy. Minulé zprávy, <b>nikoli předpověď</b>. Pouze agregáty: nepokoušejte se obnovovat identifikátory. Mapy ADS-B a AIS zůstávají oddělené.

seg-e47db9be47ea = Geometrie oblohy, skyline

seg-839eb485b1d2 = <b>MODELLED</b> geometrie při uvedeném modelu chyb, pouze přímá viditelnost: žádný ohyb, vícecestné šíření ani příjem bez přímé viditelnosti. Předvolby jsou <b>REPRESENTATIVE</b>, nikoli zaměření; ponechte původ předvolby. Předvolené konstelace jsou reprezentativní obloha, nikoli obloha daného data. Elipsa škáluje uvedenou UERE: není to naměřená přesnost ani mez integrity. Ponechte <c1/>.

seg-0002a3dc682e = Dostupnost optického spoje (<c1/>, { "0.37" })

seg-1098f908d9dc = <b>MODELLED</b>, poradní. Oblačné klimatické podmínky jsou uvedené vstupy, nikoli datová sada, a nebyl porovnán žádný naměřený záznam dostupnosti: říkejte „za těchto předpokladů“, nikdy „dostupnost na tom místě“. Ponechte <b>strop</b> lokality (<c1/>: co žádná rezerva nezvedne) vedle její dostupnosti a řekněte, které zisky technik jsou vstupy (Kshana adaptivní optickou smyčku nemodeluje). Numerika je zkontrolována proti nezávislému programu, což kontroluje implementaci vzorců, nikoli atmosféru.

seg-3324b2e2021e = Test holdoveru (<c1/>, { "0.38" })

seg-9177789844f7 = <b>MODELLED</b>, poradní. Říkejte „změřeno proti masce“, nikdy že hodiny nebo systém splňují doporučení či jsou podle něj schváleny. Dva časy (GNSS odebráno, GNSS obnoveno) jsou <b>výrokem provozovatele</b>: Kshana nic neodebrala ani neobnovila a nemůže je ověřit, proto je citujte tak, jak byly uvedeny. Maska, pro kterou je záznam příliš krátký, je <b>INCOMPLETE</b>, nikdy splnění. Záznam servo (linuxptp, chrony) je chyba pod servořízením, nikoli nezávislé měření proti UTC; řekněte, z kterého záznamu hodnoty pocházejí. Viz <c1/>.

seg-18d3f2b50d0a = Jakýkoli výsledek scénáře

seg-aab46d50d125 = <c1/> nebo <c2/>, které uvádí, a řádek původu.

seg-166f773b2804 = Hranice

seg-203a91deb52c = Používejte syntetická nebo vlastní data uživatele. Ve výstupech nejmenujte osoby, plavidla ani organizace, které nebyly ve vstupu uživatele. Kshana je analytický a tréninkový nástroj, nikoli letový ani navigační produkt.

seg-ec064f62f7dc = <s1>Předchozí</s1>Server MCP: samostatně provozovaný režim HTTP

seg-1f44dbd65ce3 = <s1>Další</s1>Kde je která schopnost dostupná

seg-e3949a1e6082 = Oblast zdroje rušení (<c1/>)

seg-46b2efcb9bec = <b>MODELLED</b>: přípustná oblast při rádiové přímé viditelnosti, nikoli určení polohy. Uvádějte oblast na stanovené úrovni spolehlivosti s těžištěm a jeho elipsou, nikdy samotné těžiště; napište <c1/>, když data oblast nezúží; napište, že je podmíněna modelem (zkontrolováno jen na syntetických datech; předregistrované srovnání Jammertest proběhlo jednou a pro oba zdroje bylo NOT ASSESSABLE, takže se externě nic neověřovalo). Neutrální formulace: „odhadovaná oblast zdroje rušení“; nikdy nejmenujte ani nenaznačujte, kdo nebo co za zdrojem stojí, ať jde o stát, sílu či záměr. Pouze agregovaně; nepokoušejte se obnovovat identifikátory. Zveřejňování oblastí zdrojů rušení ve veřejné observatoři je vypnuto.
