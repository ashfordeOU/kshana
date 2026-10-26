# docs--tutorial-quantum-vs-classical: translations (cs)

seg-501d3a72ea43 = Integrita

seg-8980b5ae869b = Hodnota

seg-e5f926d1055b = Úskalí a jednotky

seg-cb457294fc53 = Kam dál

seg-a3686dd6817d = Zdroj: <c1/>

seg-0c2365600795 = Tutoriál { "3" } — Kvantová a klasická odolnost GNSS (vrcholový)

seg-cc4017642043 = <c1/> + <c2/> · <b>Scénáře:</b> <c3/>, <c4/> (výukové kopie: <a1><c5/></a1>, <a2><c6/></a2>) · <b>Obtížnost:</b> pokročilejší · <b>~{ "35" } min</b>

seg-5de2e6656527 = Vrcholový tutoriál. Spustíte scénář detektoru spoofingu a úplnou fúzní sadu pro určování polohy, navigaci a čas (PNT) a naučíte se číst <b>bezpečnost</b>, <b>integritu</b> a <b>dead-reckoning</b> společně — celá teze: kvantová inerciální technika a optické časování zajišťují odolnost, kterou by odepření GNSS (globálního družicového navigačního systému) jinak zničilo.

seg-ffa5242638c2 = Část A — Bezpečnost: zachycení časového spoofingu

seg-23c18da1415f = Útočník vkládá pomalu narůstající falešný čas GNSS ({ "0.1" } ns/s, od t = { "60" } s). Přijímač porovnává uváděný čas s předpovědí vlastních hodin v režimu setrvání a spoofing označí, když rozdíl překročí mez detekce. Detektorem je oboustranný <b>energetický test χ²₁ / Neymana–Pearsona</b> při pravděpodobnosti falešného poplachu P_fa = { "0.01" }; ukazatelem kvality bezpečnosti je <b><c1/></b> (jedna minus pravděpodobnost nezachycené události) při velikosti spoofingu odpovídající specifikaci ({ "20" } ns).

seg-46aa0e01b330 = <b>Kvantové: <c1/>, detekováno v { "70" } s.</b> Detekční práh optických hodin je zlomek nanosekundy, takže spoofing označí téměř okamžitě — hluboko pod specifikací { "20" } ns.

seg-022573b3dcc4 = <b>Klasické: <c1/>, detekováno v { "430" } s.</b> Vlastní šum čipových atomových hodin (CSAC) při setrvání v daném okně je srovnatelný s { "20" } ns, takže často nedokážou spoofing odlišit od vlastního driftu — v { "44" } % případů jej nezachytí.

seg-27b2b715efcb = Nekruhové orákulum: analytické vs. Monte Carlo P_md

seg-c85651eebd32 = Pravděpodobnost nezachycené události detektoru se počítá <b>dvěma nezávislými způsoby</b>, které se musejí shodovat: <b>uzavřeným vztahem pro chvost χ²₁</b> (výsledek Neymana–Pearsona) a odhadem <b>Monte Carlo</b> (MC). Pro CSAC je analytické P_md <c1/> a MC P_md <c2/> — shodují se na { "0.002" }, hluboko uvnitř výběrové chyby <c3/>. Pro optické hodiny jsou obě { "0.000" }. Shoda dvou oddělených výpočtů <em>téže</em> pravděpodobnosti je nekruhová křížová kontrola (Kay, <em>Fundamentals of Statistical Signal Processing: Detection Theory</em>; standardní detekce NP / χ²). <c4/> ověřuje <c5/> pro obě hodiny a <c6/>.

seg-5cf0d909bac7 = Část B — Hybridní PNT: úplná fúzní sada

seg-498a57aae11d = Nyní vrcholový scénář fúzuje optické hodiny + inerciální měřicí jednotku (IMU) na bázi studených atomů (kvantová sada) proti CSAC + IMU navigační třídy (klasická sada) při stejném výpadku GNSS { "6600" } s ({ "1.83" } h), proti specifikaci časování { "20" } ns a specifikaci polohy { "100" } m. Obě sady znovu ukotvují své hodiny každých { "60" } s přes stejný optický mezidružicový spoj pro přenos času, modelovaný s jitterem { "1" } ps na jednu resynchronizaci (<c1/> ve scénáři; <c2/> vytvoří jeden spoj <c3/> pro kteroukoli sadu).

seg-61934559c7a0 = Přečtěte si rozdělení <c1/> — holdover času a holdover polohy:

seg-dee5b1a35bdd = <b>Kvantové: PNT-holdover { "6600" } s</b> — udrží časování (t { "6600" } s) i polohu (p { "6600" } s) po celý výpadek.

seg-6441dfa026dc = <b>Klasické: PNT-holdover { "350" } s</b> — <em>časování</em> vydrží celých { "6600" } s (t { "6600" } s), protože optická resynchronizace přenosu času drží zachycené i <em>klasické hodiny</em>. Sada je <b>omezena polohou na p { "350" } s</b>: slabým článkem je IMU navigační třídy. To je teze o fúzi — porucha klasické sady se vyčlení na její inerciální senzor.

seg-12e9b7192733 = <b><c1/> u kvantové sady je skutečné a není to chyba.</b> Je to vnitřní konzistence filtru při zašuměné resynchronizaci — <b>nikoli</b> letecký údaj o integritě (horizontální nebo vertikální ochranná úroveň, HPL/VPL). Nepřeceňujte zde slovo „integrita“; viz <a1><c2/></a1>.

seg-587efcdcbc13 = Nekruhové orákulum: holdover polohy { "350" } s

seg-a70ad8fc122f = Údaj { "350" } s je fyzika dead-reckoningu, nikoli vyladěné číslo. Konstantní zkreslení akcelerometru <c1/> způsobuje růst chyby polohy jako <b>½·b·T²</b>. Překročení specifikace { "100" } m:

seg-778e817e3e9b = Engine uvádí { "350" } s, poslední bod mřížky po { "10" } s před překročením a o { "2" } % méně než { "357" } s vycházející jen ze zkreslení: akcelerometry scénáře nesou i šum náhodné procházky rychlosti (<c1/>), který se přičítá k driftu ze zkreslení, takže modelovaná chyba dosáhne { "100" } m o něco dříve.

seg-e105a8ab605b = Směrodatný zákon: Groves, <em>Principles of GNSS, Inertial, and Multisensor Integrated Navigation</em> (2. vyd.), růst chyby dead-reckoningu. Tyto dvě hodnoty ½bT² vysvětlují rozdělení enginu { "350" } s / { "6600" } s: kontrola fyziky v uzavřeném tvaru, vnější vůči filtru.

seg-c2515e55dffa = Inerciální slabý článek můžete vidět přímo ve scénáři dead-reckoningu (<a1><c1/></a1>, druh <c2/>): <c3/>: senzor navigační třídy se rozbíhá na desítky kilometrů.

seg-6c688f2e7136 = Jak číst tyto tři údaje společně

seg-4f1a49d61cee = Co to zde znamená

seg-2e91989b1a89 = Co to <b>neznamená</b>

seg-b403ce86b14d = analytická mez <em>detekovatelnosti</em> spoofingu (<c1/>) pro nastavený útok; shrnutí <c2/> vypisuje <c3/>, protože tento scénář žádný nenastavuje

seg-e04c25dd278d = není to vícedružicový detektor RAIM (autonomní monitorování integrity přijímačem)

seg-7e678dd4409e = vnitřní konzistence filtru (vzorky uvnitř meze k-σ)

seg-1643e7e71209 = není to letecká integrita HPL/VPL/RAIM

seg-4095f7ab4b14 = čas ve specifikaci po ztrátě GNSS, rozdělený na časování a polohu

seg-5b90536cdfd5 = není to 2D přesnost CEP (kruhová pravděpodobná chyba) ani 2DRMS (dvojnásobek odmocniny ze střední kvadratické vzdálenosti)

seg-4b11ef3b6dba = Skutečná autonomní integrita přijímače — opravdové HPL/VPL s mezemi poplachu a Stanfordským diagramem — je v balíčku <c1/> (<a1><c2/></a1>); to je čtecí cvičení úrovně 3.

seg-28cddec341ed = Co testy zafixují

seg-a27c3195acf3 = <c1/> — analytické a MC P_md se shodují na méně než { "0.05" } u obou hodin; <c2/>.

seg-78a5a0066e09 = Hybridní shrnutí ({ "6600" } s / { "350" } s) a inerciální rozdělení jsou zafixovány prostřednictvím jejich výukových scénářů (<a1><c1/></a1>, <a2><c2/></a2>) testem <c3/>, který porovnává každé shrnutí enginu s řádkem <c4/>, který soubor zaznamenává. Orákulum ½bT² výše je kontrola fyziky těchto čísel.

seg-a4371822e379 = <b>Ukazatel kvality (FoM) časování je v nanosekundách; FoM polohy je v metrech a 1-DOF</b> (jeden stupeň volnosti: jedna osa, nikoli CEP/2DRMS).

seg-1331ea80a427 = <c1/> je vnitřní konzistence, nikoli letecká integrita.

seg-87c49084032c = <em>Časování</em> klasické sady přežívá jen díky optické resynchronizaci přenosu času; čtěte rozdělení <c1/>, nejen úvodní PNT-holdover.

seg-1c93115bf118 = Spusťte případ poctivého selhání: <c1/> (druh <c2/>) hlásí průlet ARAIM (pokročilý RAIM) na jižním pólu, kde ochranné úrovně <em>překračují</em> mez poplachu (HPL { "263" }–{ "452" } m > { "50" } m, { "0" } z { "24" } epoch dostupných), takže systém je hlášen jako <b>nedostupný</b>: vlastnost, nikoli chyba.

seg-ac70d3131064 = Přeneste příběh na nízkou oběžnou dráhu Země (LEO): <c1/> (druh <c2/>) řetězí fázi rušení GNSS, vrstvu určování polohy LEO, která uživatele jí provede, a kontrolu integrity na jedné časové ose. Další odolnostní a vertikální scénáře viz <a1>novější schopnosti</a1>.

seg-063422d3c70b = Obhajte výsledek: udělejte <a1>cvičení úrovně 3</a1> — pásma Monte Carlo, reprodukovatelnost a čtení ochranné úrovně.

seg-4f7275a21f44 = <s1>Předchozí</s1>{ "2" } · Holdover hodin

seg-8b0c90f82aab = <s1>Další</s1>Pracovní příklad: pipeline z více nástrojů
