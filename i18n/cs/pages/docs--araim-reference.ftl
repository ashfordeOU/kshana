# docs--araim-reference: translations (cs)

seg-c316596d7ec8 = Zdroj: <c1/>

seg-4768b19aaed7 = Reference ARAIM — ochranné úrovně pokročilého RAIM v Kshana

seg-93c83a737a43 = Tato poznámka dokumentuje otevřenou implementaci <b>Advanced Receiver Autonomous Integrity Monitoring (ARAIM)</b> v Kshana: algoritmus, každý předpoklad, zprávu podpory integrity, kterou spotřebovává, a stav validace. Implementace žije v <a1><c1/></a1>; tento dokument je prózní doplněk, který může auditor (nebo recenzent nákupu) číst vedle kódu.

seg-f5a7abecc2df = ARAIM je dvoukonstelační, vícefrekvenční nástupce klasického RAIM, který pracovní skupina C (WG-C) GPS (Global Positioning System)–Galileo definovala pro podporu horizontálního a vertikálního vedení až do LPV-200 (LPV: výkon lokalizátoru s vertikálním vedením). Odpovídá na jedinou otázku pro každou epochu:

seg-252dac107a2a = Jak velká musí být mez chyby polohy (<em>ochranná úroveň</em>), aby zbytková pravděpodobnost <em>nebezpečně zavádějící informace</em> — chyby větší než mez, zatímco mez je stále uvnitř limitu varování — zůstala pod rozpočtem rizika integrity <c1/>?

seg-04299e9742b7 = { "1" }. Zpráva podpory integrity (ISM)

seg-717bea7d6bc8 = ISM je sada parametrů na konstelaci, kterou uživatel aplikuje. Modeluje ji výslovně <a1><c1/></a1>:

seg-fffbeccd4266 = Symbol

seg-2247a2344710 = Význam

seg-d7e49778bed2 = σ_URE / SISE (chyba signálu ve vesmíru)

seg-b1b5bca63e21 = RMS (střední kvadratická hodnota) chyby vzdálenosti používaná pro <b>přesnost a kontinuitu</b>

seg-8ff2973d7f5b = σ_URA / SISA (přesnost signálu ve vesmíru)

seg-f993962a5c9b = mez chyby vzdálenosti používaná pro <b>integritu</b> (≥ σ_URE)

seg-727c7fbe1b01 = maximální nominální zkreslení vzdálenosti jednostranně zahrnuté do meze integrity (<c1/>); viz §{ "3" }

seg-a79e42c29c46 = apriorní pravděpodobnost nezjištěné poruchy jedné družice

seg-78c45312d2ff = apriorní pravděpodobnost poruchy celé konstelace

seg-19cc5ff2e541 = <c1/> vrací zveřejněné referenční hodnoty WG-C: <b>σ_URA = { "0.75" } m</b>, <b>σ_URE = { "0.67" } m</b>, <b>b_nom = { "0.75" } m</b>, <b>P_sat = { "1" }×{ "10" }⁻⁵</b>, <b>P_const = { "1" }×{ "10" }⁻⁴</b> za dobu expozice. Toto jsou hodnoty používané k dimenzování dostupnosti ARAIM v referenční literatuře; provozní ISM je vysílána/sestavována na zemi a je konfigurovatelná po konstelaci. Rozlišení mezi σ_URA (integrita) a σ_URE (přesnost) je záměrné a je určující vlastností konceptu ISM.

seg-0c1687628e67 = <c1/> a <c2/> je předávají přímo oběma enginům.

seg-8c516e53f595 = { "2" }. Hypotézy poruch

seg-b6353366ebf0 = ARAIM je metoda <em>oddělení řešení s více hypotézami</em> (MHSS). Pro každou hypotézu poruchy <c1/> vytvoří řešení ze všech viditelných družic a podřešení, které vylučuje postiženou množinu, a omezí chybu polohy za této hypotézy:

seg-3b340e082b84 = <c1/> (apriorní <c2/>): úplné řešení nejmenších čtverců ze všech viditelných družic.

seg-03332e433edc = Poruchy jedné družice

seg-add4792e4e40 = <c1/> (apriorní <c2/> každá): každé podřešení s vyloučením jedné družice. Toto je klasický základ ARAIM s jednou poruchou, <a1><c3/></a1>.

seg-7e20f419e670 = Poruchy celé konstelace

seg-920bd35833ff = <c1/> (apriorní <c2/> každá): podřešení, které odstraní <em>všechny</em> družice jedné konstelace najednou, rozšíření EU (Evropská unie) ARAIM TN (technická nota) / DO-316 implementované v <a1><c3/></a1>. S <c4/> se to redukuje <b>bit po bitu</b> na <c5/>.

seg-323dd205d238 = { "3" }. Ochranné úrovně

seg-9ab2676d2554 = Pro každou osu (svislou, vodorovnou) a každou hypotézu engine sestaví režim <c1/>, kde práh je mez detekce oddělení řešení při násobiteli falešného varování <c2/> (Bonferroniho rozdělení rozpočtu kontinuity na <c3/> hypotéz). Ochranná úroveň je nejmenší mez <c4/>, jejíž součtové riziko integrity

seg-05c0d8fc855c = Poznámka k implementaci.

seg-248092fe9b94 = <c1/> je jednostranná projekce nominálního zkreslení na osu — nejhorší součet velikostí zisků jednotlivých družic (<a1><c2/>/<c3/></a1>) — převzatá z <c4/> v ISM. Referenční ISM WG-C používá <c5/>; s <c6/> se mez redukuje na tvar MHSS s nulovým nominálním zkreslením. Spustitelný scénář <c7/> zpřístupňuje <c8/> (mez integrity použitá pro ochrannou úroveň, omezená na ≥ <c9/> a výchozí na ni) a <c10/> (výchozí { "0" }), takže ochranná úroveň je vždy dimenzována mezí integrity σ_URA, nikdy menší přesností σ_URE. Zůstává to <b>modelovaná, necertifikovaná</b> implementace ARAIM — viz <a2><c11/></a2>.

seg-f6bccff61ff5 = splňuje přidělený rozpočet ([<c1/>] / <a1><c2/></a1>). VPL (svislá ochranná úroveň) a HPL (vodorovná ochranná úroveň) jsou svislá a vodorovná odpověď. Výsledek také uvádí skutečně dosažené riziko integrity (<c3/> přidělení) a to, zda se podřešení oddělilo za svůj práh.

seg-b1a868221848 = Toto je výslovná smlouva ARAIM — „jak velká musí být mez?“ — namísto implicitního rizika klasického RAIM s pevným násobitelem, které závisí na geometrii.

seg-c90cf313dea8 = { "4" }. Stanfordský diagram

seg-b51e44c3deda = <a1><c1/></a1> v každé epoše hromadí <c2/> proti pevnému limitu varování (AL) a <a2><c3/></a2> každou zařadí jako <em>dostupnou</em>, <em>nedostupnou systémem</em> (PL > AL, konzervativně), <em>zavádějící informaci</em> (PL < chyba ≤ AL) nebo <em>nebezpečně zavádějící informaci</em> (chyba > AL a > PL). <a3><c4/></a3> vykreslí klasický bodový graf — hranici integrity <c5/>, vodítka limitu varování a jednu barevně odlišenou značku na epochu — jako samostatné SVG (Scalable Vector Graphics).

seg-c902173f6acf = { "5" }. Přínos dvou konstelací

seg-96e114a6981c = Dva efekty jsou předvedeny v <c1/>:

seg-06c7d8d62b44 = <b>Geometrie / redundance</b> — sloučení družic druhé konstelace zpřesňuje HPL při jedné poruše: více měření a větší množina podřešení jednotlivých SV (SV: kosmický prostředek, tedy družice) dávají striktně menší mez.

seg-f788c9e07547 = <b>Odolnost vůči poruše konstelace</b> — při aktivním <c1/> zůstává uživatel se dvěma konstelacemi dostupný, když může selhat celá konstelace (družice <em>druhé</em> konstelace přežijí), zatímco uživatele s jednou konstelací prokazatelně nelze chránit před poruchou jeho vlastní konstelace (<c2/> vrací <c3/>).

seg-f52a937bad94 = Jemnost, kterou je třeba říci otevřeně: protože hypotéza poruchy konstelace vyžaduje přežít ztrátu <em>celé</em> konstelace, je <em>okamžitá</em> ochranná úroveň se dvěma konstelacemi zdola omezena zbytkovou geometrií jedné konstelace — není automaticky menší než PL pouze z GPS v každém okamžiku. Hlavní výsledek EU ARAIM TN, že GPS+Galileo dává o <b>{ "15" }–{ "25" } % menší HPL</b>, je výsledek <b>dostupnosti</b> nasbíraný přes realistické konstelace a polohy uživatelů, nikoli záruka pro jednotlivý okamžik.

seg-b4289b877902 = { "6" }. Stav validace

seg-e553de2eee63 = <b>V repozitáři, automatizovaně:</b> algebra MHSS (<c1/> ⇒ bit po bitu jedna porucha; porucha konstelace rozšiřuje PL; rozpočet se nikdy nepřekročí), výše uvedené přínosy geometrie a poruchy konstelace a vyzkoušení na <b>skutečné geometrii přesných drah IGS (International GNSS Service; GNSS = globální družicový navigační systém) (SP3, Standard Product { "3" })</b> (<c2/>), nikoli jen na syntetických konstelacích.

seg-633bf11af170 = <b>Vnější orákulum — zveřejněný vypracovaný příklad WG-C:</b> ochranné úrovně jsou zkontrolovány proti vlastnímu číselnému příkladu technické podskupiny ARAIM v <a1><c1/></a1>, <c2/> a zapsané fixtuře <c3/> (každý vektor nese svou URL (webovou adresu) získání, datum získání, SHA-256 zdrojového souboru (SHA: Secure Hash Algorithm) a stránku). Přijímací tolerancí je vlastní <c4/> reference. Proti Reference Airborne Algorithm Description Document v3.1 ({ "2019" }), příloha D: <b>VPL { "18.2926" } m proti zveřejněným { "18.3" } m (Δ { "0.0074" } m)</b>, <b>HPL { "13.4063" } m proti { "13.45" } m (Δ { "0.0437" } m)</b>, EMT (efektivní práh monitoru) { "7.2997" } m proti { "7.2998" } m, σ_v,acc { "1.3694" } m proti { "1.3694" } m a všechny šest zveřejněných mezivýsledků poruchy konstelace (σ₃⁽ᵏ⁾, σ_ss,{ "3" }⁽ᵏ⁾, b₃⁽ᵏ⁾) s přesností do poloviny jednotky posledního vytištěného desetinného místa. Zpráva Milestone { "3" } Report z { "2016" } uvádí tentýž příklad, ale nese dvě vnitřní vady — překlep znaménka v řádku { "3" } matice <c5/> a <c6/> vyhodnocené pro { "57" } režimů poruchy, zatímco dokument uvádí <c7/> ({ "12" } režimů) — takže její mezivýsledky geometrie se reprodukují přesně, ale její ochranné úrovně jsou zaznamenány jako naměřené odchylky (VPL Δ { "0.0171" } m, HPL Δ { "0.0842" } m, EMT Δ { "0.4806" } m) a z přijímací hodnoty vyloučeny. Kontrola je dostupná jako druh scénáře <c8/>.

seg-6d79f9836abd = <b>Otevřené reziduum (vnější / čeká na posouzení):</b> údaj o dostupnosti { "15" }–{ "25" } % proti <b>verzí zamčenému skutečnému snímku Celestrak TLE (dvouřádková sada prvků)</b> a uložení testovacích fixtur ARAIM jako citovatelného záznamu <b>Zenodo</b>. Výše uvedená referenční kontrola pokrývá pouze <c1/> (režimy poruchy jedné družice a jedné konstelace); současné podmnožiny poruch z více událostí, vyloučení poruchy, kontrola konzistence χ² a krok přerozdělení při dvojím započtení referenčního algoritmu nejsou implementovány a případ, jehož apriorní hodnoty by je potřebovaly, je odmítnut, nikoli zkrácen.

seg-b57b889dc536 = <b>Dosah ze souboru scénáře:</b> druh scénáře <c1/> spouští <c2/> v každé epoše, když jeho soubor TOML (Tom's Obvious Minimal Language) nastaví <c3/> (volitelně <c4/>); přibalený <a1><c5/></a1> to dělá nad sloučenou geometrií GPS + Galileo a <c6/> spouští týž engine na skutečných TLE GPS a Galileo ze služby Celestrak, propagovaných do jedné společné epochy. Bez příznaku používá běh klasické RAIM s oddělením řešení.

seg-6cb7a787ac67 = Reference

seg-46ca3d3cf9df = EU–U.S. Cooperation on Satellite Navigation, Working Group C, ARAIM Technical Subgroup, <em>Milestone { "3" } Report</em>, Final Version, { "25" }. února { "2016" } — příloha A (referenční uživatelský algoritmus) a §A.IX (číselný příklad). <a1>https://www.gps.gov/sites/default/files/2025-09/ARAIM-milestone-3-report.pdf</a1>

seg-e5e789005864 = EU–U.S. Cooperation on Satellite Navigation, Working Group C, ARAIM Technical Subgroup, <em>Reference Airborne Algorithm Description Document</em>, Version { "3.1" }, { "20" }. června { "2019" } — příloha D (číselný příklad pro LPV-200). <a1>https://web.stanford.edu/group/scpnt/gpslab/website_files/maast/ARAIM_TSG_Reference_ADD_v3.1.pdf</a1>

seg-8758a6e4f6eb = EU–US (Spojené státy) Cooperation on Satellite Navigation, <em>ARAIM Technical Note</em>.

seg-c4d2879b2ec4 = RTCA (dříve Radio Technical Commission for Aeronautics) DO-316 / DO-229 MOPS (minimální provozní výkonnostní normy); materiál DO-316 ARAIM MASPS (minimální výkonnostní normy leteckého systému).

seg-d5ed1c3cfb1f = Blanch et al., <em>Baseline Advanced RAIM User Algorithm and Possible Improvements</em>, IEEE (Institute of Electrical and Electronics Engineers) TAES (Transactions on Aerospace and Electronic Systems) / ION (Institute of Navigation) ITM (International Technical Meeting).

seg-a33e29861372 = Walter, Enge, Blanch, Pervan, <em>Worldwide Vertical Guidance of Aircraft Based on Modernized GPS and New Integrity Augmentations</em> (metodika Stanfordova diagramu).

seg-d4f50d307775 = <s1>Předchozí</s1>Spektrum a waterfall

seg-f05ca316fe8e = <s1>Další</s1>Mapa DO-316 / DO-229E
