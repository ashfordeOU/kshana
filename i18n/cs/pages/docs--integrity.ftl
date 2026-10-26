# docs--integrity: translations (cs)

seg-2f99acf45203 = <b>Diagram integrity Stanford–ESA</b> (ESA: Evropská kosmická agentura) — akumulátor pro každou epochu zařazuje <c1/> do oblastí Available / System-Unavailable / Misleading / Hazardously- Misleading pro souhrn dostupnosti.

seg-33d01969fb0f = <b>Dosažitelné od začátku do konce</b> — druh scénáře <c1/> provede výše uvedené nad konstelací SGP4 (Simplified General Perturbations { "4" }) nebo keplerovskou, případně nad konstelací načtenou ze skutečných TLE (dvouřádkové sady prvků) nebo z navigačního souboru RINEX (Receiver Independent Exchange Format) a vydá mapu dostupnosti HPL/VPL pro každou epochu vůči nastaveným mezím výstrahy (<c2/>). Tentýž běh <b>exportuje vertikální Stanfordův diagram</b>: v každé chráněné epoše se přes geometrii převede seedem řízený, reprodukovatelný náhodný výběr chyby dosahu bez poruchy na skutečnou vertikální chybu a zařadí se vůči VPL a vertikální mezi výstrahy, takže výsledek v JSON (JavaScript Object Notation) i souhrn v CLI (rozhraní příkazového řádku) nesou počty v jednotlivých oblastech (události integrity a HMI: hazardously misleading information, tedy nebezpečně zavádějící informace) — nejen zlomek dostupnosti. Na přibaleném <c3/> běh uvádí { "344" } z { "361" } epoch dostupných ({ "95.3" } %) při horizontální mezi výstrahy { "40" } m a vertikální { "50" } m, s { "0" } událostmi integrity a { "0" } HMI.

seg-54e778eceef4 = <b>ARAIM s duální konstelací a zprávou o podpoře integrity</b> — <c1/> přidává <b>režim poruchy celé konstelace</b>: kromě hypotéz bez poruchy a poruchy jedné družice přispívá každá konstelace jednou hypotézou, která vyřazuje všechny její družice, s apriorní pravděpodobností <c2/>, do téhož součtu rizika integrity MHSS. Zpráva <c3/> (ISM) nese přesnost dosahu uživatele pro integritu (<c4/>), střední kvadratickou hodnotu přesnosti (<c5/>), maximální nominální vychýlení <c6/> jednostranně zahrnuté do každého režimu a apriorní pravděpodobnosti <c7/> a <c8/>; její referenční sada WG-C (Working Group C evropsko-americké spolupráce v oblasti družicové navigace, jejíž technická podskupina ARAIM referenci publikuje) je σ_URA = { "0.75" } m, σ_URE = { "0.67" } m, b_nom = { "0.75" } m, P_sat = { "1e-5" } a P_const = { "1e-4" }. <c9/> reprodukuje výsledek jednoporuchového <c10/> bit po bitu. Druh <c11/> jde touto cestou s <c12/> (<c13/>: GPS + Galileo, { "48" } družic, { "145" } ze { "145" } epoch dostupných při týchž mezích výstrahy).

seg-1f06bc1976bd = <b>Ochranné úrovně proti publikovaným referenčním vektorům</b> — druh <c1/> spouští funkce enginu <c2/> a <c3/> na vlastních propracovaných příkladech podskupiny ARAIM WG-C (Reference Airborne Algorithm Description Document v3.1, { "2019" }, příloha D, a Milestone { "3" } Report, { "2016" }, příloha A). Nejhorší rozdíl vertikální/horizontální ochranné úrovně na akceptačním vektoru je { "0.0437" } m proti vlastní toleranci dokumentů { "0.05" } m. Tento řádek je VALIDATED v <a1><c4/></a1>: ověřuje rovnici ochranné úrovně, nikoli provozní ISM ani přijímač.

seg-1dda7b318c5f = Zbývající mezera (plán)

seg-e27215296e1a = Co <c1/> zatím <b>nedělá</b>:

seg-964c0634eae0 = <b>není zahrnut do FoM scénářů hodin/holdover</b> — tyto balíčky stále uvádějí výše zmíněný údaj Integrity vlastní konzistence filtru, nikoli HPL/VPL;

seg-eecf2f9f181e = hypotézami poruch jsou případ bez poruchy, <b>jednotlivé družice</b> a <b>celé konstelace</b> — současné poruchy na <b>podmnožinách dvou či více družic (SV: space vehicle, tedy družice)</b> nejsou modelovány;

seg-fd0f9fb2de83 = ISM je konfigurovatelná sada parametrů (s referenčními hodnotami WG-C), nikoli vysílaná provozní zpráva ani ověřený model hrozeb;

seg-88f5242b0809 = <b>detekce a vyloučení poruchy (FDE)</b> je jen pro jednu družici a jen snímkové: separace řešení pojmenuje porouchanou družici a <c1/> znovu řeší každé vyloučení jedné družice a vrací vyloučenou družici s testem chí-kvadrát a ochrannými úrovněmi zbývající podmnožiny, ale nehlásí se žádná poloha chráněná po vyloučení a druh scénáře <c2/> krok vyloučení nespouští.

seg-c85aa5dedc86 = Jádra snímkové metody, separace řešení a ARAIM jsou procvičována na <b>skutečné geometrii přesných drah IGS (International GNSS Service) (SP3: Standard Product { "3" })</b>, nejen na syntetických konstelacích: <c1/> sestavuje geometrii zorných směrů z první epochy skutečného produktu IGS SP3 na skutečné pozemní stanici a kontroluje, že ochranné úrovně jsou konečné a uvnitř mezí výstrahy APV-I (přiblížení s vertikálním navedením) { "40" } m horizontálně a { "50" } m vertikálně, že vychýlení pseudovzdálenosti { "60" } m spustí monitor χ², že separace řešení porouchanou družici <b>identifikuje</b> a že úrovně ARAIM splňují přidělenou hodnotu <c2/>. <c3/> spouští cestu duální konstelace na skutečných katalozích Celestrak GPS a Galileo ze dne 2026-06-07, propagovaných do jedné společné epochy (viz <a1><c4/></a1> §{ "3" }). Hlubší křížová kontrola — porovnání ochranných úrovní epocha po epoše s gLAB (GNSS-Lab Tool, sada pro zpracování dat GNSS distribuovaná ESA) přes celý oblouk pozorování RINEX — by přidala shodu v oblasti přijímače. Není provedena: druh <c5/> počítá kódovou jednobodovou polohu ze skutečných pozorování RINEX, ale žádná ochranná úroveň z tohoto řešení nebyla s gLAB porovnána.

seg-f5fac2e836a6 = Takže <c1/> je skutečné jádro ochranných úrovní a rizika integrity, dosažitelné z druhů scénářů <c2/> a <c3/>, procvičené na geometrii skutečných referenčních drah a ověřené proti referenčním vektorům WG-C. Poruchy podmnožin více družic, shoda gLAB v oblasti přijímače a začlenění do FoM hodin zůstávají položkami plánu a nic z toho není důkazem pro certifikaci.

seg-487f24ed92d8 = <a1><c1/></a1> — jednořádkové definice každé FoM a zkratky.

seg-7d3c12cf802e = <a1><c1/></a1> — parametry ISM a referenční vektory WG-C.

seg-04532ba5288f = <a1><c1/></a1> — časová ochranná úroveň (TPL) hodin v doběhu, která je podmíněna detekcí.

seg-43cea496da93 = <a1><c1/></a1> — které veličiny jsou ověřeny proti referenci a které jsou kontroly vlastní konzistence.

seg-3037dde8135f = <c1/> — odvození meze detekovatelnosti spoofingu.

seg-04d63778ca7f = RAIM vedle ukazatelů kvality holdoveru hodin ({ "0.36" }, na výslovné zapnutí)

seg-744e95749978 = Scénář hodin může obsahovat sekci <c1/> (<c2/>): stanoviště (<c3/>, <c4/>, <c5/>), přednastavení konstelací (<c6/>, výchozí <c7/>), masku, sigma reziduí dosahu, pravděpodobnosti falešného poplachu a nezachycené události, horizontální a vertikální meze výstrahy, rozestup epoch a volitelné uvedené vychýlení jedné družice. Běh pak hlásí samostatný blok <c8/>: pro každou epochu družice ve výhledu, snímkové ochranné úrovně RAIM a verdikt (<c9/>, <c10/>, <c11/>, <c12/>, <c13/>) a počty a dostupnost za celý běh. Dokud časová osa říká, že GNSS je odepřeno, RAIM je nedostupný a nic se neextrapoluje; zhoršené okno se vyhodnocuje jako nominální. Ukazatele kvality holdoveru se nemění a bez této sekce je výstup bajt po bajtu shodný. MODELLED: reprezentativní přednastavená obloha, syntetická rezidua a uvedené meze. Vyžaduje <c14/>.

seg-139639263c90 = Reprodukce maximální URA z Milestone { "3" } skupiny EU-US WG-C pro ARAIM (CAP-05c)

seg-97906754d4c8 = Dřívější plán sliboval srovnání s „Table A-3“ technické poznámky EU-ARAIM. Pro tuto tabulku se nepodařilo najít žádný veřejný zdroj (veřejné zprávy Milestone { "1" } až { "3" } technické podskupiny ARAIM pracovní skupiny C EU-US žádnou Table A-3 nemají), proto je toto srovnání <b>staženo</b> a pod tímto názvem se nic neslibuje.

seg-b61607c477f2 = Místo toho se pokouší o veřejnou zprávu: <b>Milestone { "3" } Report</b> ({ "25" }. února { "2016" }, kopie GPS.gov, SHA-256 <c1/>), tabulky { "5" }, { "6" } a { "7" }, které pro každou konfiguraci konstelace a pro každou z RNP { "0.1" } a RNP { "0.3" } uvádějí největší <c2/>, pro které má { "90" } % uživatelů { "99.5" } % dostupnost. Kontroluje se dvanáct vytištěných položek (řádky Depleted a Baseline tabulek pro dvě frekvence) podle prahů předregistrovaných v <a1><c3/></a1> před jakýmkoli hodnoceným během, s odchylkami, které nelze odstranit, uvedenými tamtéž: žádné soubory almanachu, Walkerovy skupiny místo skutečných slotů, hrubší mřížka a krok a horizontální cesta ADD v4.2 enginu místo vlastního textu zprávy. Tabulky { "8" } až { "13" } (jedna frekvence) a řádky Optimistic se nezkoušejí, z důvodů uvedených tamtéž. <b>Výsledek: { "8" } z { "12" } položek reprodukováno, { "4" } NOT MET (zafixováno):</b> položky duální konstelace a všechny položky jen Galileo se shodují (včetně řádků N/A), položka duální Depleted RNP { "0.1" } dosahuje pokrytí { "0.847" } při { "9" } m proti vytištěným { "9" } m (vyžaduje se { "0.90" }) a tři položky jen GPS se míjejí výrazně (pokrytí { "0.70" } při { "4" } m, { "0.58" } při { "6" } m, { "0.65" } při { "10" } m proti vytištěným { "4" } m, { "6" } m a „>{ "10" } m“). Neshody jen GPS mohou pocházet z jednotné Walkerovy skupiny nahrazující skutečné sloty GPS (D1); je to hypotéza, nikoli zjištění. Výsledek zůstává MODELLED, ať je jakýkoli. Studii tvoří <c4/>; její naměřená pokrytí jsou v <c5/> a hodnotí je <c6/>. Samotná zpráva je citována, nikoli přibalena.

seg-0e98826cedcc = <s1>Předchozí</s1>Bezpečnost hardwaru

seg-e6f1e38977b7 = <s1>Další</s1>Spektrum a vodopád

seg-38ab3bb65327 = Skutečný snímkový RAIM, separace řešení a ARAIM RAIM (src/raim.rs)

seg-668241606715 = Zdroj: <c1/>

seg-9a8c218ce054 = Integrita a bezpečnost: co { -brand } modeluje a co ne

seg-52038c93765d = { -brand } uvádí dva ukazatele kvality (FoM) — <b>Integritu</b> a <b>Bezpečnost</b> — které lze snadno zaměnit za letecky certifikované veličiny téhož jména. Tato stránka otevřeně uvádí, čím dnes jsou, čím <em>nejsou</em> a co přidá plán vývoje. Pokud { -brand } posuzujete pro kontext bezpečnosti života nebo certifikace, přečtěte si ji jako první.

seg-fb6e93a107e7 = Dnes ({ "v0.37.0" })

seg-ecd20ae1a05d = Ukazatel Integrity — vlastní konzistence filtru

seg-153391e55508 = Ukazatel Integrity je podíl vzorků výpadku, jejichž skutečná časová chyba zůstává uvnitř vlastní ochranné meze k-sigma Kalmanova filtru:

seg-ac2413a97a7b = Měří, zda je <em>vlastní hlášená</em> nejistota filtru poctivá vůči jeho <em>vlastní</em> chybě během výpadku GNSS (globálního družicového navigačního systému). Je to užitečná interní kontrola konzistence.

seg-c9f80760ea53 = <b>Není</b> to:

seg-8899525ad177 = <b>horizontální/vertikální ochranná úroveň (HPL/VPL)</b> — žádná ochranná úroveň v prostoru polohy neexistuje (balíčky hodin jsou v časové oblasti);

seg-dd9a3e58e10b = <b>riziko integrity / pravděpodobnost nebezpečně zavádějících informací (P_HMI)</b>;

seg-31fa92b3271d = porovnání s <b>mezní hodnotou výstrahy</b>;

seg-ee998b974e6f = soulad s <b>RTCA DO-229E / DO-316</b> nebo <b>EUROCAE ED-259A</b> (RTCA: Radio Technical Commission for Aeronautics; EUROCAE: Evropská organizace pro vybavení civilního letectví) ani s jakoukoli jinou certifikační normou.

seg-f84a56b6fe10 = Ukazatel Bezpečnosti — analytická mez detekovatelnosti spoofingu

seg-e532288ed262 = Ukazatel Bezpečnosti je <b>mez detekovatelnosti spoofingu založená na stabilitě hodin</b>: při daném šumu hodin (spektrální hustoty výkonu (PSD) bílé frekvence a náhodné procházky) a monitorovacím okně je to analytická detekční rezerva monitoru konzistence jedněch hodin proti pomalu narůstajícímu podvrženému času. Tišší hodiny (např. optické hodiny) detekují menší, pomalejší spoofing než hlučnější (např. CSAC (čipové atomové hodiny)) — tento kontrast je smyslem demonstrátoru.

seg-fc718a805b28 = <b>Není</b> to vícedružicový detektor RAIM (autonomní monitorování integrity přijímačem). Neexistují reziduály pseudovzdálenosti napříč družicemi, žádná ochranná úroveň a žádné P_HMI. Test inovace proti sigma má stejný matematický tvar jako klasická detekce poruch RAIM (Brown), ale číslo je analytická mez pro dané hodiny, nikoli implementace RAIM, a má smysl jen v kontextu nakonfigurovaného scénáře spoofingu (viz druh scénáře <c1/>, který vkládá skutečný narůstající útok).

seg-ae770e25031e = Výstup to uvádí. Druhy <c1/>, <c2/>, <c3/> a <c4/> nekonfigurují žádný útok, takže jejich jednořádkové shrnutí místo čísla vypíše <c5/> a jejich dokument výsledku označí <c6/> jako <c7/> s důvodem ve svém bloku <c8/>. Samotná hodnota zůstává v dokumentu pro každého, kdo mez potřebuje.

seg-960bd91a2b3a = Skutečný snapshotový RAIM, RAIM se separací řešení a ARAIM (<c1/>)

seg-3d31ec251ac0 = Skutečný RAIM v prostoru polohy je implementován v <c1/>, odděleně od výše uvedeného ukazatele vlastní konzistence:

seg-0e8240812c16 = <b>Vícedružicové monitorování reziduí</b> — sestaví matici geometrie přímé viditelnosti k viditelným družicím, vytvoří řešení polohy a hodin metodou nejmenších čtverců a testuje součet čtverců reziduí.

seg-69f1535596e0 = <b>Detekce poruch χ²</b> — <c1/> (SSE: součet čtverců reziduí) má za hypotézy bez poruchy rozdělení χ²(n−{ "4" }); porucha se vyhlásí nad <c2/>. Prahy χ² pocházejí z regularizovaného vyhodnocení neúplné funkce gama bez závislostí (přesně, bez tabulek).

seg-6721779048f5 = <b>HPL / VPL založené na sklonu</b> — <c1/>, kde <c2/> je citlivost chyby polohy na jednotlivé družice z projekční matice a <c3/> je necentrální bias χ², který splňuje nakonfigurovanou pravděpodobnost nezachycené události <c4/>.

seg-8dd60e98088d = <b>RAIM se separací řešení (MHSS: separace řešení při více hypotézách)</b> — pro řešení ze všech viditelných družic a každé dílčí řešení s vyloučením jedné družice separace vnořených odhadů <c1/> <b>detekuje i identifikuje</b> družici s poruchou a vstupuje do meze ochranné úrovně.

seg-719e27fdd2c1 = <b>Rozpočet rizika integrity (P_HMI) ARAIM (pokročilé autonomní monitorování integrity přijímačem)</b> — <c1/> řeší nejmenší HPL/VPL, jejichž součet pravděpodobností nebezpečně zavádějících informací <c2/> (Blanch et al., <em>Baseline ARAIM</em>) splňuje výslovné přidělení rizika integrity, a uvádí riziko, kterého úrovně dosahují — takže integritu lze přímo vyvažovat proti mezní hodnotě výstrahy, místo aby zůstávala skrytá v pevném násobiteli <c3/>.
