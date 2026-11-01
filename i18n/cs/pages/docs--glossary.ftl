# docs--glossary: translations (cs)

seg-daf25c6479c1 = Standardy

seg-c851aa23ea42 = hodnoty oddělené čárkami

seg-366c59b03b4f = CSV

seg-cb273d6705c6 = SVG

seg-49a994d77d2f = teplotně kompenzovaný krystalový oscilátor

seg-1bac97ee312a = rubidiový atomový frekvenční normál

seg-b09ffb8a9095 = Monte Carlo

seg-9939da5da283 = JSON

seg-e464509f3abb = poměr výkonu nosné k hustotě šumu

seg-68ff97cfdc03 = DOI

seg-fa299d3dcaad = digitální identifikátor objektu

seg-d41af8f18aed = GLONASS

seg-1df73b95ae4d = IAU

seg-e78cf68c3f5e = ICRF

seg-f094d5944111 = International Celestial Reference Frame

seg-70fd83c6e862 = ISS

seg-cc73228e1f0e = Mezinárodní vesmírná stanice

seg-865e7d1794b6 = Secure Hash Algorithm, 256 bitů

seg-8104773e1484 = STK

seg-ad20a7bebf23 = STL

seg-e2dbcb4bc5f5 = Satellite Time and Location

seg-71aee5eb55c5 = UHF

seg-65e797f8bb42 = ultra vysoké frekvence

seg-5907283b71da = Zkratka

seg-900c7c7e99cd = GMAT

seg-c730f9c69d6e = ISB

seg-ef9ba270513c = mezisystémové zkreslení

seg-7dabf60fd17e = QPN

seg-dae80c23262e = šum kvantové projekce

seg-430b3c681347 = RTKLIB

seg-051a168f774c = TCXO

seg-ba5d469b1c66 = VLBI

seg-6ce4c2164aee = Zdroj: <c1/>

seg-bee5d056ef03 = Srozumitelné definice pojmů používaných v Kshana. Každé heslo začíná jednořádkovým „jednoduše řečeno“ a pak tam, kde to pomáhá, doplňuje přesný význam. Zkratky, které nejsou definovány v některém oddíle, jsou v tabulce A–Z poblíž konce, <a1>Všechny ostatní zkratky, A–Z</a1>.

seg-f8c5433d1026 = Navigace a časování

seg-2a42d84608ea = <b>PNT — určování polohy, navigace a času (Positioning, Navigation, and Timing).</b> Vědět přesně, <em>kde</em> jste, <em>kudy</em> se pohybujete a <em>kolik je hodin</em>. Moderní PNT pochází většinou ze signálů družic (GNSS, globální družicové navigační systémy definované dále); Kshana zkoumá, co se stane s <em>časem</em> a <em>polohou</em>, když se tyto signály ztratí.

seg-6227db2c94e1 = <b>GNSS — globální družicový navigační systém (Global Navigation Satellite System).</b> Družicové konstelace, které poskytují PNT: GPS (Global Positioning System, USA (Spojené státy americké)), Galileo (EU), GLONASS (ruský Global Navigation Satellite System), BeiDou (Čína). Přijímač, který vidí ≥ { "4" } družice, může vypočítat úplné určení polohy ve 3D a času.

seg-f8eda357e640 = <b>Výpadek / odepření / zhoršení / rušení GNSS.</b> Když jsou signály družic nedostupné (blokované, rušené nebo mimo výhled). Během výpadku musí systém „dojíždět“ na vlastní palubní senzory. Celým účelem Kshana je měřit, jak dobře dojíždí.

seg-a3ade199f465 = <b>Holdover (udržení času).</b> Jednoduše řečeno: <em>jak dlouho si hodiny udrží dobrý čas samy poté, co ztratí GNSS.</em> Lepší hodiny drží déle, než jejich chyba překročí povolenou mez.

seg-83b33c15312f = <b>Výpočet polohy z pohybu (dead-reckoning).</b> Jednoduše řečeno: <em>odhad, kde jste, sečtením naměřeného pohybu, bez vnější reference.</em> Chyby se kumulují, takže lepší inerciální senzor driftuje pomaleji.

seg-da9bcc994b9c = <b>Specifikace / práh.</b> Největší chyba, která je přípustná, než se řešení počítá jako „mimo specifikaci“ — např. „čas musí zůstat v mezích { "20" } ns“ nebo „poloha v mezích { "100" } m“.

seg-6f37a60a30c7 = Senzory, které Kshana porovnává

seg-308b59d89586 = <b>Hodiny (atomové hodiny).</b> Zařízení, které udržuje čas počítáním přirozených kmitů atomu. Zde dva příklady:

seg-3389d08be6bc = <b>CSAC — atomové hodiny v měřítku čipu (Chip-Scale Atomic Clock).</b> Malé, nasazené, komerční hodiny („klasická“ reference). Dobré, ale při dlouhém výpadku znatelně driftují.

seg-3e121d8e6400 = <b>Optické mřížkové hodiny (např. se stronciem).</b> Mnohem stabilnější „kvantové“ hodiny; nejmodernější stav v laboratořích, ve vesmíru zatím nelétaly.

seg-4daa6cdf8ae2 = <b>Akcelerometr.</b> Měří zrychlení (změnu pohybu). Dvojí integrací dává polohu, takže jakákoli chyba rychle roste. <b>Akcelerometr se studenými atomy</b> je kvantová verze s mnohem lepší dlouhodobou stabilitou; <b>navigační třída</b> je klasická.

seg-91793676c57c = <b>Gyroskop.</b> Měří rotaci. Malá chyba rotace naklání platformu, což přenáší gravitaci do horizontálního směru a kazí odhad polohy.

seg-2d36110effc3 = <b>IMU — inerciální měřicí jednotka (Inertial Measurement Unit).</b> Samotný balíček akcelerometrů a gyroskopů: tři osy od každého, hlásící specifickou sílu a úhlovou rychlost. Měří pohyb; sama o sobě neví, kde je.

seg-e3b6b40e0cd0 = <b>INS — inerciální navigační systém (Inertial Navigation System).</b> IMU plus „mechanizace“, která integruje její výstup na polohu v prostoru, rychlost a polohu. INS je to, co dojíždí výpočtem polohy z pohybu přes výpadek GNSS, a jeho přesnost určují procesy chyb IMU uvedené níže.

seg-a618ff7ee429 = <b>Přenos času.</b> Posílání přesného časového signálu mezi dvěma místy (např. z družice na družici). <b>Optické</b> spoje jsou mnohem přesnější než spoje <b>RF</b> (radio-frequency, rádiové).

seg-847fbbeecfae = Jak se modelují chyby (šum hodin)

seg-5cf197bdbbad = Chyba hodin se skládá ze standardních „druhů šumu“, z nichž každý má známý podpis:

seg-3806d1b1cb50 = <b>Bílá FM (bílá frekvenční modulace).</b> Jednoduše řečeno: <em>rychlé, náhodné kolísání frekvence hodin.</em> Průměrováním se s časem zlepšuje. Parametr <c1/>.

seg-0793fdd3abab = <b>FM s náhodnou procházkou.</b> Jednoduše řečeno: <em>frekvence hodin pomalu bloudí.</em> Tento šum převládá při dlouhých výpadcích. Parametr <c1/>.

seg-42b74c8b88ff = <b>Flicker FM (šum 1/f).</b> Jednoduše řečeno: <em>tvrdohlavá šumová podlaha, pod kterou hodiny nikdy nedokážou zprůměrovat.</em> Je plochá napříč dobami průměrování. Parametr <c1/>.

seg-b3bd841a5a2d = <b>Stárnutí / drift.</b> Pomalá, <em>předvídatelná</em> změna frekvence v čase; protože je předvídatelná, odhadovač Kshana ji odstraňuje. Parametr <c1/>.

seg-d929960492e4 = <b>VRW — náhodná procházka rychlosti (Velocity Random Walk).</b> Ekvivalent bílého šumu u akcelerometru: náhodné impulsy do rychlosti, které se kumulují do chyby polohy. Parametr <c1/>.

seg-4a97f8d14174 = <b>ARW — náhodná procházka úhlu (Angular Random Walk).</b> Ekvivalent u gyroskopu: náhodné impulsy do orientace. Parametr <c1/>.

seg-dcd03b326110 = Jak se měří stabilita

seg-2181832c6253 = <b>Allanova odchylka (<c1/>).</b> Jednoduše řečeno: <em>standardní způsob, jak vyjádřit, jak stabilní jsou hodiny při dané době průměrování <c2/>.</em> Datový list hodin uvádí například <c3/>. Kshana ověřuje svůj model hodin tak, že vypočítá Allanovu odchylku vlastního výstupu a zkontroluje, že odpovídá zveřejněnému číslu. (Reference: Riley, NIST SP { "1065" } — Special Publication { "1065" } amerického National Institute of Standards and Technology.)

seg-11cbe561e633 = <b>PSD — spektrální hustota výkonu (Power Spectral Density).</b> Jak je výkon šumu rozložen přes frekvence; formální způsob zadání šumu bílého, s náhodnou procházkou nebo flicker.

seg-0737d620eb5f = Ukazatele kvality (jak se běh hodnotí)

seg-20b66e0d4809 = Šest provozních ukazatelů kvality PNT, které Kshana uvádí (viz tabulka „Output“ v README):

seg-b17d08246e49 = <b>FoM — ukazatel kvality (Figure of Merit).</b> Jedno číslo, které hodnotí jeden aspekt běhu, uvedené se svou jednotkou a s tím, zda je ověřeno proti nezávislé vnější referenci, nebo vypočteno z modelu. Šest níže uvedených jsou provozní FoM Kshana.

seg-b229a69fb4ac = <b>Výkon určení polohy / času</b> — velikost chyby jako RMS (root mean square, kvadratický průměr) a jako 95. percentil.

seg-ba3ed5a28518 = <b>Autonomie</b> — doba holdoveru (jak dlouho zůstane ve specifikaci bez GNSS).

seg-13ecdd037098 = <b>Odolnost</b> — jak rychle chyba roste poté, co se GNSS ztratí.

seg-be0168f24d6e = <b>Dostupnost</b> — podíl běhu, který má řešení ve specifikaci.

seg-44ef500b371d = <b>Integrita</b> — <em>můžete věřit vlastnímu odhadu chyby systému?</em> Kshana uvádí podíl vzorků výpadku, jejichž skutečná chyba zůstává uvnitř ochranné meze filtru.

seg-d1cc3819cde9 = <b>Bezpečnost</b> — odolnost vůči spoofingu: skóre detekovatelnosti spoofingu založené na stabilitě hodin (od { "v0.3.0" }), smysluplné pouze tehdy, když je nastaven scénář útoku spoofingem. <em>Není</em> to integrita letecké třídy: nepočítá žádnou horizontální ani vertikální ochrannou úroveň (HPL/VPL) a nespouští žádné autonomní monitorování integrity přijímačem (RAIM), ani pokročilé. Ty pocházejí z oddělených druhů scénářů integrity a ARAIM (pokročilé RAIM) a jsou definovány níže v části „Integrita a rozšíření“. Citlivé z hlediska exportu.

seg-5cae59204d9e = Pojmy používané spolu s ukazateli kvality:

seg-7adc0e49a981 = <b>Spoofing (podvržení signálu).</b> Jednoduše řečeno: <em>falešný signál družice, který lže o poloze nebo času.</em> Spoofer podává přijímači věrohodnou, ale špatnou odpověď, což je horší než rušení, protože si toho přijímač nemusí všimnout.

seg-2d2e6cbeade6 = <b>1-DOF — jeden stupeň volnosti.</b> Jediná osa. Chyba polohy v balíčcích scénářů Kshana je jednoosá; úplná odpověď ve 3D vyžaduje třísosý model.

seg-14a32d281c4b = <b>Soubor Monte Carlo.</b> Spuštění téhož scénáře mnohokrát s různými náhodnými seedy a uvedení rozptylu výsledků místo jediného běhu.

seg-fcbea49a3592 = <b>CI — interval spolehlivosti (confidence interval).</b> Rozsah, do něhož se statistika s uvedenou pravděpodobností očekává (například { "95" } %). V tabulkách a odznacích README „CI“ častěji znamená <b>kontinuální integraci</b> — automatizovaný běh sestavení a testů při každé změně; který význam platí, říká kontext.

seg-310abfd6a64c = <b>Mez k-sigma.</b> Mez nastavená na <em>k</em> směrodatných odchylek vlastní nejistoty filtru; ukazatel kvality Integrita počítá, jak často skutečná chyba zůstává uvnitř ní.

seg-ad26afbaa7b4 = <b>CEP / 2DRMS — kruhová pravděpodobná chyba (circular error probable) / dvojnásobek kvadratického průměru vzdálenosti.</b> Dva standardní způsoby vyjádření horizontální přesnosti ve 2D: CEP je poloměr obsahující { "50" } % určení polohy; 2DRMS je dvojnásobek kvadratického průměru horizontální chyby. Knihovna umí obojí vypočítat z kovariance polohy (<c1/>), ale žádný druh scénáře je zatím neuvádí.

seg-fd93c1effba8 = Čtení výsledku: pojmy ve výstupu

seg-3432498093cf = Jsou to názvy, s nimiž se setkáte v souboru výsledku nebo ve shrnutí hřiště, nejprve jednoduše vysvětlené.

seg-099bf2eb4602 = <b>Holdover (<c1/>).</b> Jednoduše řečeno: <em>kolik sekund systém zůstal uvnitř své meze chyby po ztrátě GNSS.</em> Kshana uvádí nejkratší takový dojezd napříč všemi výpadky v běhu, měřený na časové mřížce běhu, takže je to dolní mez v rozlišení časového kroku. Holdover rovný délce výpadku znamená, že mez nebyla nikdy překročena.

seg-e68708a219f1 = <b>p95 (<c1/>).</b> Jednoduše řečeno: <em>v { "95" } % času byla časová chyba tak malá nebo menší.</em> Je to 95. percentil chyby během výpadku. Velmi malá hodnota se v krátkém shrnutí může zobrazit jako <c2/>; soubor JSON (JavaScript Object Notation) s výsledkem obsahuje číslo v plné přesnosti.

seg-4dfaee63262d = <b>Integrita (<c1/>).</b> Jednoduše řečeno: <em>jak často byl vlastní odhad chyby systému poctivý.</em> Je to podíl vzorků výpadku, jejichž skutečná chyba zůstala uvnitř meze k-sigma filtru (definována níže). Hodnota blízká { "1" } znamená, že odhadovač svou chybu nepodcenil. Není to ochranná úroveň letecké třídy; viz „Integrita a rozšíření“ níže a <a1><c2/></a1>.

seg-5af09f5129e0 = <b>Skóre bezpečnosti (<c1/>).</b> Jednoduše řečeno: <em>jak pravděpodobné je, že útok spoofingem bude zachycen.</em> Je to pravděpodobnost, že nastavený útok bude zjištěn — jedna minus pravděpodobnost nezachycené události <c2/> — odvozená ze stability hodin. Něco znamená jen tehdy, když scénář nastavuje útok spoofingem. Bez nastaveného útoku jednořádkové shrnutí vypíše <c3/> a výsledek označí ukazatel jako <c4/> ve svém bloku <c5/>; hodnota zůstává v dokumentu a znamená „nepoužitelné“, nikoli „nulová bezpečnost“.

seg-70113d509997 = <b>PDOP — polohový faktor zhoršení přesnosti (position dilution of precision; klíče jako <c1/>).</b> Jednoduše řečeno: <em>o kolik geometrie družic zvětšuje chybu měření vzdálenosti na chybu polohy.</em> Chyba polohy je zhruba PDOP krát chyba měření vzdálenosti, takže nižší je lepší. Viz <b>DOP</b> v části „Odhadování a geometrie“.

seg-a445bf9a3c5f = <b>sigma_y (<c1/>, Allanova odchylka).</b> Jednoduše řečeno: <em>jak moc se frekvence hodin chvěje při průměrování přes dobu <c2/>.</em> Řádek datového listu jako <c3/> znamená, že frekvence zprůměrovaná přes jednu sekundu kolísá zhruba o { "3" } díly z 10¹⁰. Menší znamená stabilnější hodiny. Viz „Jak se měří stabilita“ výše.

seg-03b4bb05148d = <b>q_wf — intenzita šumu bílé frekvence.</b> Jednoduše řečeno: <em>síla rychlého, náhodného kolísání frekvence hodin.</em> Je to koeficient v <c1/> pro šum bílé frekvence, takže scénář nastavuje <c2/> z jednosekundové Allanovy odchylky z datového listu. Jeho doprovodné parametry jsou <c3/> (šum frekvence s náhodnou procházkou) a <c4/> (stárnutí); viz „Jak se modelují chyby“ výše.

seg-074a1337ed99 = Pojmy telekomunikačního časování

seg-9f61398628e4 = Telekomunikační sítě distribuují čas po paketových sítích (Precision Time Protocol) z referenčních hodin napájených z GNSS a Mezinárodní telekomunikační unie, sektor telekomunikační standardizace (ITU-T), stanovuje meze časové chyby, kterou smí každé hodiny přidat. Tyto pojmy se objevují v druhu <c1/>; viz <a1><c2/></a1>.

seg-f48712300b30 = <b>TE — časová chyba (time error).</b> Jednoduše řečeno: <em>jak daleko je čas hodin od referenčního času v jednom okamžiku.</em> Kladná nebo záporná, obvykle v nanosekundách.

seg-ceda70656c6a = <b>max|TE| — maximální absolutní časová chyba.</b> Jednoduše řečeno: <em>nejhorší časová chyba zjištěná v průběhu měření, bez ohledu na znaménko.</em> Je to hlavní mez, kterou stanoví většina masek.

seg-38d2922cd91d = <b>cTE — konstantní časová chyba (constant time error).</b> Jednoduše řečeno: <em>stálá offsetová část časové chyby</em> — průměrná chyba, která se během měření nemění.

seg-a4a61df332cd = <b>dTE — dynamická časová chyba (dynamic time error).</b> Jednoduše řečeno: <em>kolísavá část časové chyby</em> — to, co zbude po odstranění konstantního offsetu. Posuzuje se pomocí MTIE a TDEV.

seg-31c0a85788b1 = <b>MTIE — maximální chyba časového intervalu (maximum time interval error).</b> Jednoduše řečeno: <em>největší výkyv časové chyby zjištěný v libovolném okně dané délky.</em> Pro každou délku okna posouvá okno po záznamu a bere největší změnu mezi špičkami; maska uvádí největší přípustnou hodnotu pro každou délku okna.

seg-53fa12cab0c6 = <b>TDEV — časová odchylka (time deviation).</b> Jednoduše řečeno: <em>typické (kvadraticky průměrované) bloudění časové chyby při dané době průměrování,</em> po zprůměrování krátkodobého jitteru. Je to příbuzný Allanovy odchylky v časové oblasti a stejně jako MTIE se kontroluje proti masce.

seg-62b5eea14f6c = <b>PRTC — primární referenční časové hodiny (primary reference time clock).</b> Hodiny na vrcholu telekomunikačního časovacího řetězce, obvykle řízené z GNSS. Meze jejich výkonu jsou v doporučení ITU-T G.8272.

seg-8d6d4538981b = <b>ePRTC — vylepšené primární referenční časové hodiny (enhanced primary reference time clock).</b> PRTC s přísnější mezí časové chyby, podporované vysoce stabilními místními atomovými hodinami, takže dokáže držet čas i při dlouhé ztrátě GNSS. Doporučení ITU-T G.8272.1.

seg-93fa4ac7c6fa = <b>T-BC — telekomunikační hraniční hodiny (telecom boundary clock).</b> Síťové hodiny, které přijímají čas od předchozího uzlu a předávají jej dál, přičemž přidávají trochu vlastní časové chyby. Doporučení ITU-T G.8273.2.

seg-52d32a5db6b8 = <b>T-TSC — telekomunikační časové podřízené hodiny (telecom time slave clock).</b> Hodiny na konci řetězce, které přijímají čas a poskytují jej zařízení, které jej potřebuje (například rádiové základnové stanici). Také pokryto doporučením ITU-T G.8273.2.

seg-04d8ed12ca88 = <b>OCXO — krystalový oscilátor řízený termostatem (oven-controlled crystal oscillator).</b> Křemenný oscilátor udržovaný na konstantní teplotě v malé troubě, což jej činí mnohem stabilnějším než běžný křemenný oscilátor. Obvyklé holdoverové hodiny v síťovém zařízení; během dnů znatelně stárne (driftuje).

seg-6742f7ba35ac = <b>CSAC — atomové hodiny v měřítku čipu (chip-scale atomic clock).</b> Velmi malé atomové hodiny (viz „Senzory, které Kshana porovnává“ výše). Při dlouhém holdoveru stabilnější než OCXO, za cenu vyšší ceny a příkonu.

seg-c0e0c18bd867 = Úrovně důkazů: VALIDATED, MODELLED, PARTNER

seg-61c0aa107fd9 = Každá schopnost ve strojově kontrolované verifikační matici (<a1><c1/></a1>) nese jednu ze tří úrovní.

seg-13fb20435df3 = <b>VALIDATED.</b> Jednoduše řečeno: <em>porovnáno s cizí odpovědí.</em> Výstup schopnosti byl porovnán s nezávislým vnějším orákulem — skutečnými naměřenými daty, nezávislou knihovnou napsanou někým jiným nebo zveřejněnými referenčními hodnotami — a shodoval se v rámci uvedené tolerance. Kontrola kontinuální integrace odmítne řádek VALIDATED, který neuvádí žádné vnější orákulum.

seg-a5dfb48e4dcb = <b>MODELLED.</b> Jednoduše řečeno: <em>postaveno na spolehlivé fyzice a zkontrolováno z hlediska vnitřní konzistence, ale zatím neporovnáno s vnější odpovědí.</em> Hodnoty jsou smysluplné pro srovnání a návrhové kompromisy; nejsou důkazem, že se skutečné zařízení bude chovat takto. <a1><c1/></a1> vysvětluje, proč je každý takový řádek vypočten z modelu.

seg-0512b2d2145a = <b>PARTNER.</b> Jednoduše řečeno: <em>tato část patří hardwarovému partnerovi nebo partnerovi pro zajištění produktu a Kshana o ní nic netvrdí.</em> Řádek existuje proto, aby mezera byla viditelná, a ne tichá.

seg-278dee6d3d4c = Pojmy spektra a interference

seg-285a240c9958 = Tyto pojmy se objevují v druhu <c1/>; viz <a1><c2/></a1>.

seg-db4fdef1c562 = <b>BPSK(n) — binární klíčování fázovým posuvem při n × { "1.023" } Mchip/s.</b> Modulace obdélníkovými čipy u GPS L1 coarse/acquisition (C/A) a L2 civil (L2C) (n = { "1" }) a GPS L5 a Galileo E5a (n = { "10" }). Jeho spektrum je sinc² s nulami každých n × { "1.023" } MHz.

seg-cdd0f4194f42 = <b>BOC(m, n) — binární offsetová nosná (binary offset carrier).</b> Rozprostírací kód při n × { "1.023" } Mchip/s vynásobený obdélníkovou podnosnou při m × { "1.023" } MHz, která štěpí spektrum na dva laloky po obou stranách nosné.

seg-35ae5134f2c5 = <b>MBOC(6,1,1/11) — multiplexovaná binární offsetová nosná (multiplexed binary offset carrier).</b> Spektrální hustota výkonu 10/11 × BOC({ "1,1" }) + 1/11 × BOC({ "6,1" }), dohodnutá pro otevřenou službu Galileo E1 a GPS L1C; Galileo ji vysílá jako složenou BOC (CBOC).

seg-7423f94e3018 = <b>CW — nemodulovaná vlna (continuous wave).</b> Nemodulovaná nosná: jediný tón.

seg-55d03dd4af03 = <b>J/S — poměr rušiče k signálu (jammer-to-signal ratio).</b> Přijatý výkon rušiče ku přijatému výkonu signálu, v decibelech.

seg-b0f2974647d4 = <b>SSC — koeficient spektrálního oddělení (spectral separation coefficient).</b> κ = ∫ G_s(f) G_j(f) df přes pásmo přijímače: kolik ze spektra interferenčního zdroje o jednotkovém výkonu dopadá tam, kde spektrum signálu. Efektivní poměr nosné k hustotě šumu je [1/(C/N₀) + (J/S)·κ]⁻¹.

seg-c5affeee5269 = <b>Šumové číslo (noise figure).</b> Kolik přijímač přidává k tepelnému šumu, jako poměr F v decibelech; šumová teplota systému je T_ant + { "290" } K × (F − { "1" }).

seg-5307c38d3036 = <b>Vodopád (waterfall).</b> Časově-frekvenční zobrazení spektra: frekvence vodorovně, čas dolů, barva pro výkon.

seg-3b1ac094fdc5 = <b>Welchův odhad.</b> Spektrální hustota výkonu odhadnutá průměrováním okénkových, překrývajících se periodogramů (Welch { "1967" }).

seg-9901d64fb895 = <b>SigMF — Signal Metadata Format.</b> Otevřený formát záznamu: soubor JSON <c1/> popisující surový soubor <c2/> se vzorky (zde komplexní <c3/>, <c4/> nebo <c5/>).

seg-83041671f422 = <b>IQ — soufázová a kvadraturní složka (in-phase and quadrature).</b> Dvě složky komplexního vzorku v základním pásmu.

seg-39e6ea8506b3 = Pojmy signálu LEO-PNT

seg-36452ee3f5cc = Tyto pojmy se objevují v druhu <c1/> a ve vícepásmových scénářích <c2/>; viz <a1><c3/></a1>.

seg-8363a15f3c5a = <b>LEO-PNT — určování polohy, navigace a času z nízké oběžné dráhy Země.</b> Navigační signály vysílané z družic ve výšce několika set až zhruba { "1200" } km: silnější a rychleji se pohybující než GNSS ze střední oběžné dráhy Země.

seg-523469643156 = <b>RNSS, RDSS, MSS, EESS — Radio Navigation Satellite Service, Radio Determination Satellite Service, Mobile Satellite Service, Earth Exploration-Satellite Service.</b> Přidělení služeb ITU (Mezinárodní telekomunikační unie), do nichž může pásmo patřit.

seg-d1e494623341 = <b>Pilotní, datová a akviziční složka.</b> Části jednoho signálu: pilotní složka bez dat pro určování vzdálenosti, datová složka nesoucí navigační zprávu a krátká akviziční složka s nízkou rychlostí, kterou lze snadno najít.

seg-cce232b7cd6a = <b>FDMA — vícenásobný přístup s frekvenčním dělením (frequency-division multiple access).</b> Složky nebo družice oddělené nosnou frekvencí, nikoli kódem.

seg-9d9476ee62b1 = <b>Gaborova (RMS) šířka pásma.</b> β = √(∫ f² G df / ∫ G df) přes pásmo přijímače: rozptyl výkonu signálu ve frekvenci, který určuje, jak jemně lze měřit vzdálenost.

seg-6febe9c2e506 = <b>DLL — smyčka s uzamčením zpoždění (delay lock loop).</b> Smyčka sledování kódu; rozestup korelátorů early-late a šířka pásma šumu určují jitter měření vzdálenosti od tepelného šumu.

seg-5a55da97daf9 = <b>EFQPSK — vylepšené Feherovo kvadraturní klíčování fázovým posuvem (enhanced Feher quadrature phase-shift keying).</b> Modulace s konstantní obálkou (Xona Pulsar); zde aproximovaná spektrem obdélníkových čipů.

seg-6dcbf1de9904 = <b>OFDM — ortogonální frekvenční multiplex (orthogonal frequency-division multiplexing).</b> Vícenosný průběh (downlink Starlink); zde nakreslený jako ploché pásmo.

seg-548b285c7c8e = <b>TEC — celkový obsah elektronů (total electron content).</b> Elektrony na čtvereční metr podél dráhy; { "1" } TECU = 10¹⁶ el/m². Ionosférické zpoždění prvního řádu je { "40.3" }·TEC/f² metrů.

seg-dd7e0743f364 = <b>EIRP — ekvivalentní izotropně vyzářený výkon (effective isotropic radiated power).</b> Vysílací výkon krát zisk antény ve směru k přijímači.

seg-aba3b3eaba85 = Integrita a rozšíření

seg-eab1b2c6728e = Integrita je otázka <em>důvěry</em>: nikoli „jak velká je moje chyba?“, ale „mohu ji ohraničit a bude mi řečeno, když se mez poruší?“ Toto jsou letecké pojmy pro to.

seg-696a73449c49 = <b>RAIM — autonomní monitorování integrity přijímačem (Receiver Autonomous Integrity Monitoring).</b> Jednoduše řečeno: <em>přijímač kontroluje družice proti sobě navzájem.</em> S více družicemi, než kolik potřebuje určení polohy (čtyři), by zbytky (rezidua) měly být malé; velké reziduum znamená, že jedna družice lže, a přijímač to může říci bez pomoci ze země. Implementováno v <a1><c1/></a1>.

seg-89237433f01a = <b>ARAIM — pokročilé autonomní monitorování integrity přijímačem (Advanced Receiver Autonomous Integrity Monitoring).</b> Moderní, dvoufrekvenční vícekonstelační podoba RAIM. Dostává zprávu o podpoře integrity, která uvádí předpokládanou chybu a pravděpodobnost poruchy každé družice, a vrací ochranné úrovně, nikoli příznak úspěchu či selhání. Úplné zpracování se všemi předpoklady v <a1><c1/></a1>.

seg-4cc13de05193 = <b>SISRE — chyba vzdálenosti signálu ve vesmíru (Signal-in-Space Range Error).</b> Jednoduše řečeno: <em>jak moc vysílaná dráha a hodiny družice zkreslují vzdálenost, kterou měří typický uživatel.</em> Chyba dráhy se rozkládá na radiální, podél dráhy a napříč dráhou a váží se tím, kolik z každé se projeví podél průměrné přímky výhledu, a poté se spojí s chybou hodin (Montenbruck et al. { "2018" }). U družice na nízké oběžné dráze Země mají složky podél a napříč dráhou mnohem větší váhu než u GPS, protože uživatelé ji vidí daleko od nadiru. Používá druh <c1/>.

seg-847e40a033e1 = <b>RAC — radiální, podél dráhy, napříč dráhou (Radial, Along-track, Cross-track).</b> Tři směry, do nichž se chyba dráhy rozkládá: od středu Země ven, ve směru letu a kolmo na rovinu dráhy. Model <c2/> druhu <c1/> přidává v každém korekční polynom.

seg-b725d23c839e = <b>SVID — identifikátor kosmické družice (Space-Vehicle Identifier).</b> Číslo, kterým navigační zpráva pojmenovává družici, která ji vyslala.

seg-b0f850eb04b1 = <b>IOD — vydání dat (Issue of Data).</b> Čítač, který se mění vždy, když se změní obsah navigační zprávy družice, takže přijímač pozná novou zprávu od opakování. (Nezaměňovat s demonstrací na oběžné dráze, také zkracovanou IOD, jako u Celeste IOD agentury ESA.)

seg-985a5e9c9ce9 = <b>TOW — čas týdne (Time of Week).</b> Sekundy od začátku aktuálního týdne GNSS (neděle { "00" }:{ "00" }).

seg-1fc62dca46d6 = <b>CRC-24Q — 24bitová cyklická redundantní kontrola (polynom Qualcomm).</b> Kontrola odhalující chyby, kterou nesou zprávy RTCM { "10403" } a Galileo: 24bitový zbytek bitů zprávy dělených polynomem <c1/>. Přijímač ji přepočítá a zprávu, která se neshoduje, zahodí.

seg-abb4679dab23 = <b>URE — chyba vzdálenosti uživatele (User Range Error).</b> Jednoduše řečeno: <em>jak moc vlastní vysílaná dráha a hodiny družice zkreslují každou vzdálenost k ní.</em> Nazývá se také chyba signálu ve vesmíru (SISE); je to rozpočet chyby pro každou družici, který dostávají ARAIM a RAIM (<c1/> v <a1><c2/></a1>).

seg-158c210fd3fe = <b>MHSS — separace řešení při více hypotézách (Multiple Hypothesis Solution Separation).</b> Metoda, kterou používá ARAIM. Pro každý způsob, jak by konstelace mohla být postižena poruchou, vytvoří řešení, které vylučuje podezřelé družice, a ohraničí, jak daleko se toto dílčí řešení může nacházet od řešení ze všech družic ve výhledu.

seg-671711003a6f = <b>HPL / VPL — horizontální / vertikální ochranná úroveň (Horizontal / Vertical Protection Level).</b> Jednoduše řečeno: <em>poloměr, o němž systém slibuje, že skutečná chyba je uvnitř, při uvedeném riziku integrity.</em> Je to mez, kterou algoritmus vypočítá, nikoli naměřená chyba. Běh je dostupný, když ochranná úroveň zůstává pod mezí výstrahy, kterou operace připouští (VAL, vertikální mez výstrahy; HAL, horizontální).

seg-5bbd2d664862 = <b>SBAS — satelitní rozšiřující systém (Satellite-Based Augmentation System).</b> Pozemní síť, která sleduje GNSS, počítá korekce a meze integrity a vysílá je z geostacionárních družic. <b>WAAS — Wide Area Augmentation System</b> je americký; EGNOS (European Geostationary Navigation Overlay Service) je evropský ekvivalent. Kshana počítá ochranné úrovně ve tvaru váženého nejmenšího čtverce podle DO-229E (DO-229E je minimální provozní výkonnostní norma RTCA pro přijímače SBAS; RTCA byla dříve Radio Technical Commission for Aeronautics) (<a1><c1/></a1>).

seg-ba8b448582af = Odhadování a geometrie

seg-2eb6e72496b8 = <b>Odhadovač.</b> Algoritmus, který předpovídá skutečnou polohu/čas během výpadku z modelu senzoru. Kshana má analytický prediktor holdoveru a <b>Kalmanův filtr</b>.

seg-9b4aa612c5a9 = <b>Kalmanův filtr.</b> Jednoduše řečeno: <em>algoritmus, který sleduje určitou veličinu a také to, jak je nejistá.</em> Kshana používá jeho mez nejistoty k výpočtu Integrity.

seg-8fda81dfccc9 = <b>EKF — rozšířený Kalmanův filtr (Extended Kalman Filter).</b> Kalmanův filtr pro nelineární problém: v každém kroku linearizuje model kolem aktuálního odhadu. Standardní volba pro spojení GNSS s INS.

seg-9bc2c6f74b29 = <b>UKF — Unscented Kalman Filter.</b> Táž úloha bez linearizace: skrz skutečný nelineární model protlačí malou sadu deterministicky zvolených vzorkových bodů a ze zasažených míst znovu sestaví střední hodnotu a kovarianci. Chová se lépe při silné nelinearitě, a proto jej používá určování oběžné dráhy.

seg-a1e52820e3a0 = <b>DOP — Dilution Of Precision (zhoršení přesnosti).</b> Jednoduše řečeno: <em>jak moc geometrie družic zesiluje chybu měření vzdálenosti na chybu polohy nebo času.</em> Chyba polohy ≈ PDOP × chyba měření vzdálenosti, takže nízké číslo znamená dobrou geometrii. Rodina faktorů: <b>GDOP</b> (geometrický — poloha a čas společně), <b>PDOP</b> (poloha), <b>HDOP</b> (horizontální), <b>VDOP</b> (vertikální), <b>TDOP</b> (čas).

seg-e769a91a3e4b = <b>Walkerova konstelace.</b> Standardní způsob popisu družicové konstelace počtem oběžných rovin a družic v každé rovině (GPS je zhruba Walkerova soustava 24/6).

seg-b557933a4e4d = <b>Elevační maska.</b> Nejmenší úhel nad místním horizontem, při kterém se družice považuje za použitelnou; signály příliš nízko se vyloučí.

seg-3ac8e11c3e33 = <b>Zákryt.</b> Situace, kdy Země fyzicky zastíní přímou viditelnost družice.

seg-249bf472cb00 = <b>Skyline (maska obzoru).</b> Jednoduše řečeno: <em>obrys budov, jeřábů nebo kopců na pozadí oblohy, vyjádřený jako elevace pro každý azimut.</em> Družice se počítá jako viditelná jen nad <c1/> ve svém azimutu a družice nad maskou, ale za obrysem obzoru, je „zakrytá skylinem“. { -brand } jej sestaví z tabulky, městského kaňonu, sektorů a terénu (jejich bodové maximum) nebo z REPRESENTATIVE předvolby; pouze přímá viditelnost, bez odrazu a difrakce (<a1><c2/></a1>).

seg-620a88820a2d = <b>Geometrie oblohy.</b> Které družice místo vidí při daném obrysu obzoru a co to dělá s řešením: faktory DOP, kovariance řešení metodou nejmenších čtverců v systému východ-sever-nahoru a její <b>chybová elipsa</b>, tedy vodorovná oblast, která obsahuje uvedený podíl určení polohy ({ "95" } % ve výchozím nastavení) pro nezávislé a stejné gaussovské chyby měření vzdálenosti. MODELLED geometrie za uvedeného modelu chyb, nikoli skutečná chyba přijímače (<a1><c1/></a1>).

seg-f0e610122425 = <b>CTI — Composed Timing Integrity.</b> Ochranné úrovně pro <em>čas</em> namísto polohy, počítané napříč předáním mezi různými zdroji času — například od hodin kontrolovaných družicemi (s dostupným RAIM) k volně běžícím hodinám v režimu holdover — takže mez zůstává platná i při přechodu (<a1><c1/></a1>).

seg-56642f614c3f = <b>TIB — Timing Integrity Benchmark.</b> Měřítko pro časové monitory <em>jiných subjektů</em>: vloží nabídku poruch a ověří, zda uvedená ochranná úroveň monitoru skutečně ohraničila jeho chybu. Sama si nečiní nárok na žádnou přesnost, a proto ji nemůže nadsadit (<a1><c1/></a1>).

seg-8b89f8b913b9 = Oběžné dráhy a cislunární prostor

seg-ba6b669eb8ba = <b>CR3BP — Circular Restricted Three-Body Problem (kruhový omezený problém tří těles).</b> Systém Země–Měsíc chápaný jako dvě tělesa na kruhových drahách kolem společného těžiště, plus kosmická loď příliš lehká na to, aby je zpětně ovlivnila. V blízkosti Měsíce má dvoutělesová keplerovská elipsa prostě špatný tvar; CR3BP je nejlevnější dynamika, která je správná (<a1><c1/></a1>).

seg-2726a22bf14c = <b>NRHO — Near-Rectilinear Halo Orbit (téměř přímková halo dráha).</b> Periodická dráha v CR3BP, která se těsně přehoupne přes jeden lunární pól a daleko přes druhý, takže při pohledu od konce je téměř přímkou — odtud „téměř přímková“. Je to dráha zvolená pro lunární stanici Gateway a udržuje téměř nepřetržitou přímou viditelnost k Zemi.

seg-2b2e6d04376c = <b>DRO — Distant Retrograde Orbit (vzdálená retrográdní dráha).</b> Další rodina v CR3BP: velká, stabilní dráha, která obíhá Měsíc nazpět, jak se jeví v rotující soustavě.

seg-6bb9229aee5c = <b>EOP — Earth Orientation Parameters (parametry orientace Země).</b> Naměřené, mírně nepravidelné kolísání a rotace Země (pohyb pólu, UT1 (Universal Time { "1" }, čas rotace Země)−UTC — čas rotace Země minus koordinovaný světový čas — a délka dne), které jsou potřeba k převodu polohy vázané na Zemi na inerciální s přesností lepší než metry. Publikuje je IERS (International Earth Rotation and Reference Systems Service); { -brand } čte jeho soubor <c1/> přes <c2/>.

seg-7f1e7e523e5b = Normy, formáty a organizace

seg-5d8d6144c13a = Zkratky, které README a stránky balíčků používají pro normy, formáty souborů, časové stupnice, soustavy a tělesa, která za nimi stojí. Každá je také rozepsána při prvním použití na těchto stránkách.

seg-800d42de0777 = Oběžné dráhy, soustavy a čas

seg-320a1594dcf1 = <b>SGP4 / SDP4 — Simplified General Perturbations { "4" } / Simplified Deep-space Perturbations { "4" }.</b> Standardní analytické propagátory pro zveřejněné družicové dráhy.

seg-87a098568846 = <b>TLE — two-line element set (dvouřádková sada elementů).</b> Veřejný formát drah, který čte SGP4.

seg-ad15cf5aa9a5 = <b>LEO / MEO / GTO / IGSO — nízká oběžná dráha Země / střední oběžná dráha Země / geostacionární transferová dráha / nakloněná geosynchronní dráha.</b> Režimy oběžných drah; většina družic GNSS létá na MEO.

seg-1ec323dbd7a6 = LMO — nízká oběžná dráha Marsu.

seg-d0be640282af = <b>ECI / ECEF — Earth-centred inertial / Earth-centred, Earth-fixed (inerciální soustava se středem v Zemi / soustava se středem v Zemi pevná vůči Zemi).</b> Soustava, která se s Zemí neotáčí, a soustava, která se otáčí.

seg-09a937adc1db = <b>TEME — true equator, mean equinox (pravý rovník, střední rovnodennost).</b> Soustava, ve které SGP4 vydává výstup.

seg-eb2a80922118 = <b>GCRS / ITRS / ITRF — Geocentric Celestial Reference System / International Terrestrial Reference System / jeho realizace, International Terrestrial Reference Frame.</b> Moderní inerciální soustavy a soustavy pevné vůči Zemi.

seg-56b24c3734be = <b>CIO — Celestial Intermediate Origin (nebeský přechodný počátek).</b> Vztažný bod moderního řetězce rotace Země bez rovnodennosti.

seg-a23b05c85a63 = <b>LVLH — local vertical, local horizontal (místní svislice, místní vodorovná).</b> Soustava, která se pohybuje s kosmickou lodí.

seg-ac37217cda0d = <b>WGS-84 — World Geodetic System { "1984" }.</b> Elipsoid Země, který používá GPS.

seg-81bc73d1fde8 = UTC / TAI / TT / UT1 / TDB — koordinovaný světový čas / mezinárodní atomový čas / pozemský čas / světový čas { "1" } (čas rotace Země) / barycentrický dynamický čas.

seg-ea7eb1f34cae = <b>LTC / TCL — Lunar Coordinate Time (Temps-Coordonnée Lunaire; lunární souřadnicový čas).</b> Navrhovaná časová stupnice pro Měsíc.

seg-c6e5976d9dff = <b>OD — určování oběžné dráhy.</b> Získání dráhy z měření sledování.

seg-dcb9e011c868 = <b>CR3BP</b>, <b>NRHO</b> a <b>DRO</b> jsou definovány výše v části „Oběžné dráhy a cislunární prostor“.

seg-2e6ba9069396 = Formáty souborů a zprávy

seg-ed5ea0a21e3f = <b>SP3 — Standard Product { "3" }.</b> Formát souboru přesných drah Mezinárodní služby GNSS (IGS), ve verzích c a d.

seg-1bfa0d083935 = <b>RINEX — Receiver Independent Exchange Format.</b> Standardní formát souborů pro pozorování GNSS a vysílané efemeridy.

seg-39ce08a9ae66 = IONEX — IONosphere map EXchange format (výměnný formát map ionosféry).

seg-c23ea3515008 = <b>OEM / OMM / TDM — Orbit Ephemeris Message / Orbit Mean-elements Message / Tracking Data Message.</b> Standardní zprávy pro dráhy a sledovací data od Poradního výboru pro kosmické datové systémy (CCSDS).

seg-b267b32f3087 = <b>TOML — Tom's Obvious, Minimal Language.</b> Formát scénářů { -brand } v prostém textu.

seg-2795dff8d607 = <b>KIF — Kshana Interchange Format.</b> Verzovaná, samopopisná obálka výsledků { -brand }.

seg-cd048e90fa3f = <b>DO-229E / DO-316.</b> Minimální provozní výkonnostní normy RTCA pro přijímače SBAS a pro palubní zařízení GPS s augmentací založenou na letadle.

seg-68604f314fa1 = <b>IS-GPS-200 / IS-GPS-705.</b> Rozhraní specifikace GPS (druhá se týká signálu L5).

seg-2230000aa30b = <b>NIST SP { "1065" }.</b> Příručka <em>Handbook of Frequency Stability Analysis</em> amerického Národního institutu standardů a technologie.

seg-8b89719c1859 = <b>TRL — úroveň technologické připravenosti.</b> Stupnice zralosti hardwaru od 1 do 9.

seg-16c972f4ea0a = Organizace

seg-9b4692fbc8a1 = <b>ESA / ESOC / ESTRACK</b> — Evropská kosmická agentura, její Evropské středisko vesmírných operací a její Evropská síť pro sledování družic.

seg-7a1746489724 = <b>NASA / JPL / NAIF / DSN</b> — americký Národní úřad pro letectví a kosmonautiku, jeho Laboratoř tryskového pohonu, jeho Středisko navigačních a pomocných informací (které publikuje sadu nástrojů SPICE — Spacecraft, Planet, Instrument, C-matrix, Events) a jeho Síť hlubokého vesmíru.

seg-eaa5a2a51169 = <b>IGS</b> — Mezinárodní služba GNSS. <b>IERS</b> — International Earth Rotation and Reference Systems Service. <b>IAU</b> — Mezinárodní astronomická unie (jejíž knihovna SOFA, Standards of Fundamental Astronomy, a její otevřený port ERFA, Essential Routines for Fundamental Astronomy, jsou referencemi { -brand } pro soustavy).

seg-81af4c0f4c48 = <b>CCSDS</b> — Poradní výbor pro kosmické datové systémy. <b>AIAA</b> — Americký institut pro letectví a kosmonautiku. <b>RTCA</b> — dříve Radio Technical Commission for Aeronautics.

seg-aa0b395df17f = Software a dodavatelský řetězec

seg-b42188d3a6f4 = CLI — rozhraní příkazového řádku.

seg-198c591514ab = <b>MCP — Model Context Protocol</b>, protokol, kterým mluví agentní server { -brand }. <b>IDE — integrované vývojové prostředí.</b>

seg-287bf61a1a16 = SBOM — soupis softwarových komponent (software bill of materials).

seg-80d9d4404221 = <b>SLSA — Supply-chain Levels for Software Artifacts</b>, rámec původu sestavení, podle kterého jsou vydání { -brand } atestována.

seg-7487c6f9ed18 = Všechny ostatní zkratky od A do Z

seg-56f6039bb38a = Každá zkratka použitá v dokumentaci repozitáře (<c1/> a čtyři soubory README), kterou nedefinuje žádná z předchozích částí, plus několik těch, které některá část definuje, zopakovaných pro snadné vyhledání. Každá stránka také rozepisuje své zkratky při prvním použití; tato tabulka je jediné místo, kde je lze najít všechny. Několik položek jsou identifikátory nebo názvy, nikoli zkratky, a je to u nich uvedeno.

seg-c0dfa446e523 = Znamená

seg-f272d28225ae = Kde se objevuje

seg-ffb0596f134b = Third Generation Partnership Project

seg-77c1b4478387 = orgán, který píše normy 5G, včetně neterestrických sítí

seg-eaf19768b977 = mobilní síť páté generace

seg-692ddc163c55 = včetně jejího určování polohy v neterestrických sítích (NTN)

seg-9524be916f07 = ABI

seg-0e8332db764b = binární rozhraní aplikací

seg-762ea76708dc = značky Python wheel

seg-d419d06ed622 = ABMF

seg-b294c714487d = stanice IGS v Le Moule na Guadeloupe

seg-586a8ea87638 = čtyřznakový identifikátor stanice

seg-4cc9a09495e6 = AC

seg-620e2dc5e4ca = střídavý proud

seg-9cfb5dc4b4bc = jako v efektu AC-Stark (světelný posun)

seg-90308009c536 = ADD

seg-49d97c65662d = Algorithm Description Document (dokument popisu algoritmu)

seg-493b5ceaa0fb = referenční palubní algoritmus ARAIM skupiny WG-C

seg-3fe5d7f41dcd = ADEV / OADEV

seg-089ac7d5ac94 = Allanova odchylka / překrývající se Allanova odchylka

seg-23c38ecbc543 = viz Allanova odchylka výše

seg-25b9fee76c9e = ADIS16460 / ADIS16465 / ADIS16488, STIM300, 3DM-GX3 (GX3)

seg-4b642742f2d4 = typová čísla inerciálních senzorů (Analog Devices; Safran Sensonor; MicroStrain)

seg-c4c0a93477a8 = identifikátory, nikoli zkratky

seg-36743c7fe98e = AEM

seg-142ca108a070 = Attitude Ephemeris Message (zpráva o efemeridách polohy)

seg-c34185a83d8e = zpráva CCSDS

seg-dd89e1deb663 = AESS

seg-898b29aaef84 = Aerospace and Electronic Systems Society

seg-78692bf5addf = v rámci IEEE

seg-f429be16014e = AF

seg-afa04bc28b42 = faktor průměrování

seg-b3db60632b92 = celočíselný násobek vzorkovacího intervalu v odhadu typu Allan

seg-6097c4709542 = AFS

seg-7043ab3fe32b = Augmented Forward Signal

seg-20380d29d286 = lunární navigační signál LunaNet

seg-b33d60fa5832 = AGC

seg-98c9c2809bd6 = automatické řízení zesílení

seg-750b8717220b = indikátor rušení (jamming) ve vstupní části přijímače

seg-31b864b910d5 = AHP

seg-f956cbe86552 = Analytic Hierarchy Process (analytický hierarchický proces)

seg-c2b63847e2dc = víceúčelová metoda vážení (Saaty)

seg-0e00edd7e222 = AI / ML

seg-6d804a116a08 = umělá inteligence / strojové učení

seg-079020f86d22 = AL / HAL / VAL

seg-1981b764715b = mezní hodnota výstrahy / horizontální mezní hodnota výstrahy / vertikální mezní hodnota výstrahy

seg-1e52f04eb047 = chyba, kterou musí monitor integrity ohraničit

seg-c7ce4d3299b8 = AltBOC

seg-f630bcd1d523 = alternativní binární offsetová nosná (alternative binary offset carrier)

seg-e3acb231cf4d = modulace Galileo E5

seg-79b130764f97 = nerovnost aritmetického a harmonického průměru

seg-190b782b70ce = AOCS

seg-6459d9bce282 = systém řízení polohy a dráhy

seg-14ec3e19c990 = AOS / TCA / LOS

seg-7cdb4a7e6df4 = zachycení signálu / čas nejbližšího přiblížení / ztráta signálu

seg-8b73e2c51498 = události přeletu nad pozemní stanicí (LOS také znamená přímou viditelnost; který význam platí, plyne z kontextu)

seg-27ceb7163571 = API

seg-7903f5ff4027 = programovací rozhraní aplikací

seg-d6bea5dea0dc = APID

seg-d468b4555dbf = identifikátor aplikačního procesu

seg-55730824c8cf = pole hlavičky CCSDS Space Packet

seg-611cd7a0d378 = APS

seg-55842a648c47 = Americká fyzikální společnost

seg-07dcfba8a3c9 = APV

seg-1a7fbb0deef2 = přiblížení s vertikálním vedením

seg-69a6cc8a532a = APV-I: horizontální mezní hodnoty výstrahy { "40" } m, vertikální { "50" } m

seg-f357a0a03c60 = ARL

seg-b4ce3803afa6 = průměrná délka běhu

seg-08a5d53f813c = střední doba, za kterou detektor změny spustí poplach

seg-519e65f68c85 = ARM / ARM64

seg-1db3bdee5f76 = procesorová architektura Arm / její 64bitová podoba

seg-33f6dff869b2 = ASD

seg-dd98c69872e0 = amplitudová spektrální hustota

seg-9fb629e35a25 = druhá odmocnina spektrální hustoty výkonu

seg-a020de5e94e5 = AU

seg-2342680bc7a6 = astronomická jednotka

seg-894bf4353ce3 = { "149 597 870.7" } km

seg-611aec9d1dce = AUC / ROC

seg-a11aa1d8f433 = plocha pod křivkou / provozní charakteristika přijímače (receiver operating characteristic)

seg-4d65dbf47a5c = hodnocení detektorů

seg-25dc893d746a = AWS

seg-20979dc817ba = Amazon Web Services

seg-569160c6e52d = hostuje otevřené zrcadlo dlaždic výšek SRTM

seg-298c6a00085d = BEL

seg-c7ce8fa2c544 = ztráta průnikem do budovy

seg-b714453f9b2c = ITU-R P.2109

seg-b9aec1857aa9 = BI

seg-40ea7b7e321e = nestabilita biasu

seg-ff2ba8692cbc = ploché minimum Allanovy odchylky inerciálního senzoru

seg-e7c1cfecd45e = BIPM

seg-dc138478d882 = Bureau International des Poids et Mesures (Mezinárodní úřad pro míry a váhy)

seg-6ec98084ac58 = publikuje Circular T

seg-4ff08facda60 = BKG

seg-d29da95f483c = Bundesamt für Kartographie und Geodäsie (Spolkový úřad pro kartografii a geodézii, Německo)

seg-ac4765a77015 = provozuje datové zrcadlo IGS

seg-a85954d9176e = BSD

seg-eb42c5807e5a = Berkeley Software Distribution

seg-a332a259125a = jako v licencích BSD

seg-97764c651815 = BSP

seg-8f85848ee08a = binární SPK

seg-6e01dca47581 = binární soubor jádra efemerid SPICE

seg-0157bbd7a064 = BSTAR

seg-23772d56a24c = člen odporu vzduchu v dvouřádkové sadě elementů

seg-628e6c686508 = CAI

seg-a2418a88886c = interferometr se studenými atomy

seg-273a3b8d5385 = viz QUANTUM.md

seg-c34db5304197 = Cold Atom Rubidium Interferometer in Orbit for Quantum Accelerometry – Pathfinder Mission Preparation

seg-fa257dda6d45 = CC / CC BY

seg-97b3d1136762 = Creative Commons / Creative Commons Attribution

seg-a1f55ee72524 = licence pro data nebo text

seg-1b8df20680a0 = CDDIS

seg-0a158229f571 = Crustal Dynamics Data Information System

seg-5b3f50bed1f6 = archiv kosmické geodézie agentury NASA

seg-ee2ac06a3023 = CDF

seg-0a54599e470d = kumulativní distribuční funkce

seg-6100157bdc02 = CFAR

seg-43ef1f6cd71d = konstantní míra falešných poplachů

seg-b38b56b63da6 = pravidlo prahu detektoru vyhledávání

seg-46835ce9641a = China Geodetic Coordinate System { "2000" }

seg-4dab086e5c3d = datum BeiDou

seg-8f7751d39781 = CIP

seg-e34a194da574 = Celestial Intermediate Pole (nebeský přechodný pól)

seg-c9b37d94f70b = CIRS

seg-29e69d7f32aa = Celestial Intermediate Reference System (nebeská přechodná referenční soustava)

seg-a543c4d02ace = CISA

seg-c34a7f26944d = Cybersecurity and Infrastructure Security Agency

seg-59c481cb5741 = amerického ministerstva vnitřní bezpečnosti (DHS)

seg-4f7ba1fd1f4c = CM / CL

seg-4fb8507eb747 = civilní střední / civilní dlouhý

seg-cc0c8f1524f8 = dva časově multiplexované kódy GPS L2C

seg-2ea49f6a1ae9 = CMPL

seg-68b147628ea1 = ochranná úroveň společného režimu

seg-d469cd44d9d4 = mez chyb, které reziduální test nevidí

seg-4e25d07b13c9 = CN

seg-e775ec496f2b = converged Newtonian

seg-5d679a981a34 = korekce aberace světelného času v SPICE

seg-3da9a2841b6c = C/N0 (C/N₀)

seg-cf60da0631b4 = v dB-Hz

seg-f4488db8194d = COPRAS

seg-6379891c1750 = COmplex PRoportional ASsessment

seg-b99fe66bd09c = víceúčelová metoda řazení

seg-a562dbafa35f = COSPAR

seg-c09ea7bc49b0 = Výbor pro kosmický výzkum

seg-235850ad0d1f = uděluje mezinárodní označení družic

seg-dbc3e7c90fe0 = CPR

seg-1fd5b461cc3d = cyklus na oběh

seg-a1d4080ce019 = empirické zrychlení dráhy na orbitální frekvenci

seg-96cd47b07b44 = CPU / GPU / NPU

seg-10ad2f10bec0 = centrální / grafická / neuronová procesorová jednotka

seg-93621c1a1e37 = CRB / CRLB

seg-70b6a0b19705 = Cramérova–Raova mez / Cramérova–Raova dolní mez

seg-6eb684e34f56 = nejmenší rozptyl, jakého může dosáhnout nevychýlený odhad

seg-93c4fe0f2990 = CRD

seg-6efd9a1fdbcc = Consolidated laser Ranging Data format

seg-eb95135f849c = soubory normálních bodů ILRS

seg-f23ff835b9b0 = CRPA

seg-b5c26297e11b = anténa s řízeným příjmovým diagramem

seg-7111b9c4d382 = protirušicí anténní pole

seg-404133a74afc = CR / RI

seg-d35896b2bb24 = poměr konzistence / náhodný index

seg-cfa91dc02138 = kontrola konzistence AHP (přijmout CR < { "0.10" })

seg-8572a3faf46a = CS GROUP

seg-5e00428ed929 = francouzská společnost, která spravuje Orekit

seg-58d5f143ff3b = název společnosti, nikoli zkratka k rozepsání

seg-be388831a3e1 = CSK

seg-9cf6cad11f64 = klíčování posunem kódu

seg-a3bd162146d6 = CSS

seg-75ddcc97f9e2 = Cascading Style Sheets

seg-0d5c127b2ee5 = CUSUM

seg-d40da5f47035 = kumulativní součet

seg-66f752e15abc = sekvenční detektor změny

seg-92ac0357d01e = CV

seg-28f75c073917 = (společný pohled při přenosu času; který význam platí, plyne z kontextu)

seg-507b8c235614 = CZML

seg-0b76641dee1a = Cesium Language

seg-fd0a7af2ebeb = formát scény JSON v CesiumJS

seg-1aefbc0b799d = dB / dBW / dB-Hz

seg-8a0d954bd13b = decibel / decibel-watt / decibel-hertz

seg-c485de5bcd85 = poměr výkonů, absolutní výkon a jednotka C/N0

seg-6c0cbce59df5 = DC

seg-ddd7d412fce7 = stejnosměrný proud

seg-0ea7fccee332 = mez nulové frekvence

seg-521e2abbe12d = DCM

seg-3db4487dc2a4 = matice směrových kosinů

seg-9d3d9ca79a9d = rotační matice

seg-364a2fcec10b = DCO

seg-110b1eb4f532 = Developer Certificate of Origin

seg-1545bd59f5ef = DCT

seg-8b6866288bea = tabulka řízení návrhu (design control table)

seg-80d95f099e9a = tabulka rozpočtu spoje (příklad Galileo v pásmu X z JPL DESCANSO)

seg-7f9734bd79bc = DE / DE421 / DE430 / DE440 / DE441

seg-ed8d5c361e79 = JPL Development Ephemeris (verze { "421" }, { "430" }, { "440" }, { "441" })

seg-748af19e3f0b = planetární a lunární efemeridy; „DE-grade“ znamená přesnost této třídy

seg-6f880928ce0c = DEM

seg-eed6ad669d4c = digitální model terénu

seg-920f5ff86fa2 = DESCANSO

seg-6d1f2ffa8184 = Deep Space Communications and Navigation Systems Center of Excellence

seg-2e11a1976171 = monografická řada JPL

seg-10dc0c578b92 = Deutsches Geodätisches Forschungsinstitut der Technischen Universität München (Německý geodetický výzkumný ústav při Technické univerzitě v Mnichově)

seg-e7cedd55549e = hostuje datové centrum EUROLAS

seg-4389ecd5c81a = DGNSS

seg-fb8c5992354b = diferenční GNSS

seg-3fed847ae9ec = DHS

seg-2845322fad33 = ministerstvo vnitřní bezpečnosti

seg-6b487421c547 = USA

seg-9e06c8655623 = DoD

seg-7a7ea4a3f0d5 = ministerstvo obrany

seg-1f6c4757bee5 = DOF / DoF

seg-e1daefad0696 = stupeň volnosti

seg-bf5bc69cb873 = viz 1-DOF výše

seg-3b5c7c9b324d = DOR / Δ-DOR

seg-3e0b6392f4d9 = diferenční jednosměrné měření vzdálenosti / delta diferenční jednosměrné měření vzdálenosti

seg-6ba2d3b5b724 = úhlové sledování v hlubokém vesmíru

seg-58c55b8ab7fe = DP5 / RK4 / RK5 / DOP853

seg-ea9b38a5d810 = Dormand–Prince { "5" }({ "4" }) / Runge–Kutta { "4" } / Runge–Kutta { "5" } / Dormand–Prince { "8" }({ "5,3" })

seg-00ecc6de9912 = numerické integrátory

seg-16c4bf2faef3 = DRMS

seg-8128cc0c1482 = odmocnina ze středního kvadrátu vzdálenosti

seg-a8ed04890ded = viz 2DRMS

seg-c9ab798458cb = DS00002980D / DS00002985D / DS00003047A

seg-371644e70b75 = čísla datových listů společnosti Microchip

seg-f25e5c4de1e5 = DSAC

seg-aa0d8d4b3a3b = Deep Space Atomic Clock

seg-e80350ed521f = hodiny NASA s uvězněnými ionty rtuti

seg-52e838301c0b = UT1 minus UTC

seg-fbce3b3b7b80 = korekce rotace Země

seg-8aa996f34920 = energie na bit vůči hustotě šumu

seg-463b21c0b791 = inerciální soustava zarovnaná se soustavou pevnou vůči Zemi na začátku běhu

seg-4dc987bd9dbf = používá se v interoperabilních exportech leo-pass

seg-61f975df5e21 = ECMAScript / ES

seg-c66e728cd2fa = norma, na které stojí JavaScript / modul ES

seg-e1a4fd0a6a76 = Empirical CODE Orbit Model { "2" }

seg-2967e958f353 = model tlaku slunečního záření pro GNSS (CODE: Center for Orbit Determination in Europe)

seg-244af4062ccc = ECSS

seg-b74029376aba = European Cooperation for Space Standardization

seg-d452e23d503a = ECSS-E-ST-10-02 je její norma pro verifikaci

seg-becb6685ff13 = ED

seg-b6448e14a567 = dokument EUROCAE

seg-ee4ada9c4c6e = jako v ED-259A

seg-8a57ce8403b1 = EDL

seg-0f065f2290f3 = vstup do atmosféry, sestup a přistání

seg-69f37001de44 = EEE

seg-18a1b66286ee = elektrické, elektronické a elektromechanické (součástky)

seg-f814c1301059 = zabezpečení kosmických produktů

seg-08e455b17435 = EGM / EGM2008

seg-1ed72a253035 = Earth Gravitational Model (vydání { "2008" })

seg-074e3ceb394e = NGA

seg-69ba7307ea4c = EIGEN

seg-4272020c0ebd = European Improved Gravity model of the Earth by New techniques

seg-a49ce7809382 = ELECTRE

seg-647519f3df17 = ELimination Et Choix Traduisant la REalité (vyloučení a volba vyjadřující realitu)

seg-efb2f919955a = víceúčelová metoda založená na převyšování

seg-88a2f1813af8 = Éphéméride Lunaire Parisienne, verze MPP02 (Chapront)

seg-b1d699d70339 = analytická teorie Měsíce

seg-aee5eeb23064 = střední rovník a rovnodennost Země epochy J2000

seg-16d9b8eac95d = inerciální soustava

seg-e676d5eec6e3 = EML

seg-f4bba0abbda7 = diskriminátor kódu

seg-0e4110d33849 = EMT

seg-103c6de62575 = efektivní práh monitoru

seg-4b2101113387 = výstup ARAIM

seg-0e2817aec74a = ENU / NED

seg-56d5cf1544d9 = východ-sever-nahoru / sever-východ-dolů

seg-aae7610833a7 = místní horizontální soustavy

seg-c7d5c5d5c5b2 = EO

seg-24907930c730 = pozorování Země

seg-38f9c209c4ac = EPM / EPM2021

seg-d15e1559b7f7 = Ephemerides of Planets and the Moon (vydání { "2021" })

seg-bd2a27a17f6d = efemeridy IAA RAS

seg-01a8e43fb6c7 = ERA

seg-eb78ffaf7e1d = úhel rotace Země

seg-966ed500f705 = ESKF

seg-e79112a3132a = Kalmanův filtr stavu chyby

seg-25c6b6b19d75 = ESS

seg-fe2b7be913f0 = efektivní velikost vzorku

seg-57ce1c1b617b = částicového filtru

seg-f529300f944b = ESSR

seg-869be8388d26 = European Space Software Repository

seg-536d66d208e4 = ESA

seg-27be9c1d7090 = ET

seg-7cc2ef5b0748 = efemeridový čas

seg-e0c49639649e = název TDB v SPICE

seg-80de6914a5ec = EUROCAE

seg-76897dd8c3be = Evropská organizace pro vybavení civilního letectví

seg-b4f12b7813dd = EUROLAS

seg-857527c69d6e = Evropská laserová síť

seg-fa7025d88c88 = laserové měření vzdáleností k družicím a Měsíci

seg-13fc009b947c = FAQ

seg-f5581b33ae89 = často kladené otázky

seg-67d10fd4a4e0 = FCC

seg-0a558c281968 = Federal Communications Commission

seg-f6ade8c24d27 = FCNN

seg-6098513947b8 = plně propojená neuronová síť

seg-1de7b4410369 = FD

seg-4e73ff36d37f = konečná diference

seg-e43312a5fbbe = FDE

seg-d6c9fb239b59 = detekce a vyloučení poruch

seg-8f9d11564223 = FES / FES2004

seg-1a1cf1501056 = Finite Element Solution (vydání { "2004" })

seg-878b4a645ae9 = model oceánských slapů

seg-55c14f474a10 = FIM

seg-b68c86e68570 = Fisherova informační matice

seg-d39671724dfc = Fowler–Noll–Vo hash, varianta 1a

seg-3354ad42f7dd = používá se k zajištění referenčních výstupů

seg-efca4decfec0 = FOC / IOV

seg-793d96ab9856 = plná provozní způsobilost / ověření na oběžné dráze

seg-ce13cca7f222 = generace družic (Galileo, Xona Pulsar)

seg-58df7305e218 = FOV / IFOV

seg-cafe1f8733ec = zorné pole / okamžité zorné pole

seg-4f7168e895d2 = FPGA / MCU / RTOS

seg-abde801ec70b = programovatelné hradlové pole / mikrokontrolér / operační systém reálného času

seg-a082e4570309 = FSL / FSPL

seg-3a8ee2932a46 = ztráta ve volném prostoru / útlum šíření ve volném prostoru

seg-4535dadf79df = ITU-R P.525

seg-c0209066dc76 = GB / KB / MB

seg-184bb3d8b345 = gigabajt / kilobajt / megabajt

seg-8094e61fdd76 = GCRF

seg-6c6337c7a855 = Geocentric Celestial Reference Frame (geocentrická nebeská referenční soustava)

seg-f050f2b8dee1 = GDAL

seg-98b12fcceb01 = Geospatial Data Abstraction Library

seg-1cef8718c772 = GEO

seg-6131e4ea7858 = geostacionární dráha

seg-bf09433a7342 = GeoJSON

seg-f8654e88af67 = Geographic JavaScript Object Notation

seg-70dc52cd5059 = IETF RFC { "7946" }

seg-bb8fbd2ebc28 = GG

seg-b93ed4ab2b79 = gravitační gradient

seg-d8ef4d361e86 = jako v momentu gravitačního gradientu

seg-12fd4eb15c4d = GHz / kHz

seg-0769cc8be024 = gigahertz / kilohertz

seg-3946b69535e4 = GIM

seg-ef5fc608b0e5 = globální mapa ionosféry

seg-8cbbff1bc1d1 = GINS / KF-GINS

seg-fbe37a571772 = integrace GNSS/INS / datová sada a kód Kalmanova filtru GNSS/INS z Wuchanské univerzity

seg-deca3cbe41ac = GIS

seg-36275ece527d = geografický informační systém

seg-ebe8194d12b3 = GIVE

seg-6a99c12984b5 = vertikální chyba ionosféry v mřížce

seg-20a40777d78a = pojem ze zpráv SBAS

seg-6fbfc5108833 = gLAB

seg-1be22ebbedc3 = GNSS-Lab Tool

seg-93b2c5b68af0 = balík pro zpracování dat GNSS distribuovaný agenturou ESA

seg-2aa0f3147ad5 = GLIBC

seg-096e00cb9d9b = knihovna GNU C

seg-2630ae5f0bc5 = ruský globální navigační družicový systém (Globalnaya Navigatsionnaya Sputnikovaya Sistema)

seg-361f1f18d454 = GLS

seg-397d58b727ee = zobecněná metoda nejmenších čtverců

seg-9bb2492e5d5d = GM

seg-6bd8e46e9131 = gravitační parametr

seg-e3a296392ac0 = gravitační konstanta krát hmotnost tělesa

seg-45a8f50bce06 = General Mission Analysis Tool

seg-60d33e61b446 = NASA

seg-1edd65c52f46 = Goddard Mars Model { "3" }

seg-45abee95253b = gravitační pole Marsu

seg-558ea1e07042 = GMST

seg-d3c4914f0d13 = greenwichský střední hvězdný čas

seg-d853b1084a52 = GNC

seg-34a9ddce3d5f = naváděcí, navigační a řídicí systém

seg-d33e343f6635 = GPOD

seg-2ef6bb5a52fc = Grid Processing On Demand

seg-14782f821cde = GR

seg-762f364a05f3 = obecná teorie relativity

seg-3e3f45ad1178 = GRGM / GRGM660PRIM

seg-948167f5f1c3 = lunární gravitační modely GRAIL z NASA Goddard (GRAIL: Gravity Recovery and Interior Laboratory)

seg-220fae5cfc61 = Geodetic Reference System { "1980" }

seg-bb3c2a337ae8 = GSD

seg-691791646eb3 = pozemní vzorkovací vzdálenost

seg-448d7036fefe = GSE

seg-d05b88e7d5c5 = pozemní podpůrné zařízení

seg-95d29f8138f9 = GSFC

seg-2e1460089fed = Goddardovo středisko kosmických letů

seg-7680e0663a5b = HDEV / OHDEV

seg-1fd1e3322c86 = Hadamardova odchylka / překrývající se Hadamardova odchylka

seg-bb846135ceb4 = míra stability necitlivá na drift

seg-0edc4eed2775 = HIL

seg-956a26e1ff6d = hardware ve smyčce

seg-48523cdbbbf5 = HMI / MI

seg-d77e079194df = nebezpečně zavádějící informace / zavádějící informace

seg-1cbf9d6f135d = oblasti Stanfordova diagramu

seg-b320746fafa5 = HP

seg-465a952272f3 = HTML

seg-45a46390d3ba = HyperText Markup Language

seg-25206f1161f0 = IAA RAS

seg-1a4f063e3583 = Institut aplikované astronomie Ruské akademie věd

seg-9f434fdc21f2 = IAG

seg-08fb84d2e01a = Mezinárodní asociace geodézie

seg-e4d6251ec64d = IAGA / V-MOD (VMOD)

seg-01880debd7e0 = Mezinárodní asociace geomagnetismu a aeronomie / její pracovní skupina V-MOD (modelování geomagnetického pole)

seg-28805f15bae8 = spravuje IGRF

seg-d4ce72152bf2 = IC

seg-fa95c4e7fdc2 = počáteční podmínka

seg-e4c4373d0c76 = ICAO

seg-2fccffbaf4dc = Mezinárodní organizace pro civilní letectví

seg-c2d2d459177d = ICD

seg-a018300615e2 = dokument řízení rozhraní

seg-433b45040abd = jako v Galileo OS SIS ICD

seg-5e1e49c5000e = ICGEM

seg-c17be0db9e83 = International Centre for Global Earth Models

seg-e9650a618b38 = ID

seg-e40875ab1090 = identifikátor (nebo identifikace, jako v identifikaci typu šumu)

seg-c643488ba1ea = IEEE

seg-e4b50d4d890f = Institute of Electrical and Electronics Engineers

seg-91966e2931d4 = IETF / RFC

seg-0804111ad44d = Internet Engineering Task Force / Request for Comments

seg-ce9375732735 = IF

seg-746eae5ce367 = mezifrekvence

seg-ed568f55aa8f = vzorky přijímače

seg-cb4aaa2581bb = realizace ITRF2014 službou IGS

seg-bfa8e6d5d0d1 = IGRF / IGRF14

seg-55fed0afea05 = International Geomagnetic Reference Field

seg-669611e731d0 = IGRF-14 (soubor IGRF14.shc) je 14. generace

seg-f7cf8ff44256 = IGSO

seg-4833bd1e9c03 = nakloněná geosynchronní dráha

seg-2080ff6f98fd = IIF

seg-cf7a31e569cd = GPS Block II Follow-on

seg-8a19be8033a9 = generace družic GPS

seg-68cc1c937ce9 = ILRS

seg-53cc8d1f6824 = International Laser Ranging Service

seg-fb5255ba4bc1 = ILS

seg-b8af4d02e031 = celočíselná metoda nejmenších čtverců

seg-a214c483b8a8 = řešení nejednoznačností

seg-4740fb9ef0b9 = IMCCE

seg-e77c8324583a = Institut de mécanique céleste et de calcul des éphémérides

seg-22048a770612 = Pařížská observatoř; publikuje INPOP

seg-9717f14527d3 = Intégration Numérique Planétaire de l'Observatoire de Paris, verze 21a

seg-577acd29f11b = planetární efemeridy

seg-cdb9ea77f5a6 = IOAG

seg-87f308314cd4 = Interagency Operations Advisory Group

seg-690414990ad8 = ION / ITM

seg-b2fbe0c3507a = Institute of Navigation / jeho International Technical Meeting

seg-53abad80634c = IoT

seg-9b766d557bd1 = internet věcí

seg-1b41d114662e = IR

seg-ff2d89b32d07 = riziko integrity

seg-2dc9fcadccd6 = pravděpodobnost nebezpečně zavádějící informace

seg-02aeac5e2435 = IRE

seg-9c9c0011de8c = Institute of Radio Engineers

seg-3fbae7e11fca = předchůdce IEEE

seg-9e3d84279d56 = posun hodin mezi dvěma systémy GNSS

seg-2ffee4396fbd = ISL

seg-505dee046f7a = mezidružicová spojnice

seg-010ea5a76e2e = ISM

seg-330b25f923db = zpráva podpory integrity

seg-1f5a14efd417 = ARAIM

seg-0ee7fcdaf5a9 = ISO

seg-8c1341375f17 = Mezinárodní organizace pro normalizaci

seg-8291ac1ccba6 = ISO { "8601" } je její formát data a času

seg-5b4dee02dccc = ITRF93 / ITRF2020

seg-93458bf3ba01 = International Terrestrial Reference Frame { "1993" } / { "2020" }

seg-14dc2a58e2c3 = Radiokomunikační sektor Mezinárodní telekomunikační unie

seg-0e8094e4d45c = její doporučení řady P modelují šíření

seg-3e325d97365e = IVS

seg-6f8a6ec848a6 = International VLBI Service for Geodesy and Astrometry

seg-2dd00d470e14 = JD / MJD

seg-107e6683f70d = juliánské datum / modifikované juliánské datum

seg-996d4952554f = JMLR

seg-a1ef35b98931 = Journal of Machine Learning Research

seg-d370f89393c7 = JOSA

seg-12c154fcd073 = Journal of the Optical Society of America

seg-58fb16c8a046 = JRC / JRC122785

seg-82f85268028f = Společné výzkumné středisko Evropské komise / jedno z čísel jeho zpráv

seg-23f5be8ff49e = JS

seg-516ee91e60c5 = JavaScript

seg-02d421e784cd = JavaScript Object Notation

seg-4da0210abab0 = JSTSP

seg-9d88dcfe6818 = IEEE Journal of Selected Topics in Signal Processing

seg-919a951f3d02 = KF

seg-436a208697f1 = Kalmanův filtr

seg-9c92e0bc42aa = KML

seg-caf09d501881 = Keyhole Markup Language

seg-ffe25881cef6 = norma OGC, kterou čte Google Earth

seg-6e9501f1d4ff = KP16 / KRAC / LU22 / APOL

seg-e1552da90a21 = označení typů záznamů ve vlastním textovém formátu navigační zprávy LEO v { -brand }

seg-3269a4e6b3e3 = rozšíření { -brand }, nikoli norma

seg-b7f0168b6037 = KPI

seg-a5ff89f0923d = klíčový ukazatel výkonnosti

seg-1c4a7ccef434 = KSC

seg-73a4bf4da46f = Kennedyho vesmírné středisko

seg-e401e5d923f0 = KVN

seg-09f93b4d4d0b = Keyword = Value Notation

seg-7379ade4ee0e = textová podoba zpráv CCSDS

seg-a24cf86216d0 = LANS

seg-2ee81a2bc69b = Lunar Augmented Navigation Service

seg-849e3161b64b = LAPACK

seg-3b4f3c08a5ba = Linear Algebra PACKage

seg-69cd99d2f937 = LCG

seg-bcddea3df96d = lineární kongruentní generátor

seg-8927ca404e64 = generátor testovací řady NIST SP { "1065" }

seg-0b9b908055cf = LCNS

seg-f9200a1b7246 = Lunar Communications and Navigation Services

seg-5253cae4b05b = služba ESA Moonlight

seg-2361aef1e2e3 = LCRNS

seg-470ea343b5ac = Lunar Communications Relay and Navigation Systems

seg-8fc87d3026e5 = LFSR

seg-bfecf2f88f17 = posuvný registr s lineární zpětnou vazbou

seg-5b09c8e3f127 = generování rozprostíracích kódů

seg-944b45f65820 = LGPL

seg-1e1bf7d7dc79 = GNU Lesser General Public License

seg-0d4d5316b1d8 = LIL

seg-6d040101c6fa = zákon iterovaného logaritmu

seg-e48d4b1feeaf = LLI / SSI

seg-81ace10136b6 = indikátor ztráty zachycení / indikátor síly signálu

seg-7d95179a5a1f = příznaky pozorování RINEX

seg-2ac0ebb389e7 = LLR

seg-29bcbb78931b = laserové měření vzdálenosti k Měsíci

seg-20deda97c876 = LLVM

seg-5a84a3219546 = překladačová infrastruktura LLVM (původně Low Level Virtual Machine)

seg-277ed5c4cbcc = LNAV

seg-d2fa9c420999 = starší navigační zpráva

seg-7f5ad6ab8c23 = GPS

seg-6379745571a9 = LNCSS

seg-b8c48f2bfaf0 = lunární navigační a komunikační družicový systém

seg-4ce3c0ea7a31 = případové studie konstelací v NAVIGATION { "70" }({ "4" }), navi.613

seg-b13c5776e35b = LNIS

seg-7c67c5753d20 = LunaNet Interoperability Specification

seg-881578d31056 = LNSS

seg-25d4f3a4d3f6 = Lunar Navigation Satellite System

seg-97ff1706b4bd = navrhovaná lunární konstelace

seg-ec733de1adc5 = LPV / LPV-200

seg-40d72ae4bc9a = výkon lokalizátoru s vertikálním vedením / její kategorie s rozhodovací výškou { "200" } ft

seg-090ba62634a8 = letecké přiblížení

seg-b4921e83ddc9 = LRO

seg-2d1b9f5efdb1 = Lunar Reconnaissance Orbiter

seg-8f782bde5659 = LS

seg-c5bc49526464 = přestupné sekundy

seg-54ea05b82cb4 = jako v Δt_LS

seg-15111a93c6d7 = LT

seg-35231d8b9b39 = světelný čas

seg-4729314afd46 = LTE

seg-1a7e158f020f = Long-Term Evolution

seg-3c1b3acc46d9 = celulární norma 4G

seg-3530cdaca137 = LU

seg-58ad64b9d450 = rozklad na dolní a horní trojúhelníkovou matici (lower–upper)

seg-ef1a45eba6aa = LuGRE

seg-72ec36312101 = Lunar GNSS Receiver Experiment

seg-84874825a5d1 = letěl k Měsíci v roce { "2025" }

seg-e6719690faa2 = LuPNT

seg-be19fb902b36 = lunární knihovna PNT ze Stanfordu

seg-893ba320da76 = název

seg-fc68b2fb9529 = MAAST

seg-e98d356a165f = MATLAB Algorithm Availability Simulation Tool

seg-a24b3840d248 = Stanford

seg-71063143c8be = MAIT

seg-2d7aa60c26ba = výroba, montáž, integrace a zkoušky

seg-0397322eae11 = MAR099 / JUP365 / SAT441

seg-bd57191f860b = řešení efemerid měsíců Marsu, Jupiteru a Saturnu z JPL

seg-9b0688bfc31e = identifikátory

seg-a8748c38de15 = MASPS

seg-e25a3738b952 = minimální výkonnostní normy leteckého systému

seg-16a3c8f74c1c = MATLAB

seg-bebc110fded7 = MATrix LABoratory

seg-e722ea781fdf = produkt pro numerické výpočty

seg-7c03fb6e56f6 = MAUT

seg-e409f72ac9ab = vícekriteriální teorie užitku

seg-4a29ddd9b24e = MC

seg-19a7ad528cf3 = MCD

seg-202b82bfefcf = Mars Climate Database

seg-371da1e857e8 = MCDA

seg-17d89019fd4a = vícekriteriální rozhodovací analýza

seg-b522fc3d6c82 = MCI / MCMF

seg-f5544acf642a = inerciální soustava se středem v Měsíci / soustava se středem v Měsíci pevná vůči Měsíci

seg-f7b59f61da60 = MDB

seg-0c674a59d087 = minimální zjistitelný bias

seg-c769430226c3 = MDEV

seg-33a4628c6e67 = modifikovaná Allanova odchylka

seg-bde3f0e5dfa7 = MEMS

seg-8b08f307de8a = mikroelektromechanické systémy

seg-c960c0e048b7 = MeO / MLRO

seg-48623f76be86 = MéO (Métrologie Optique), laserová stanice v Grasse / Matera Laser Ranging Observatory

seg-a8fcbefbbf4c = stanice pro laserové měření vzdálenosti k Měsíci

seg-8b597c678c3f = ME / PA

seg-cb56efe2fb70 = střední Země / hlavní osy

seg-f30f1a2778cf = dvě lunární soustavy pevné vůči tělesu (MOON_ME, MOON_PA)

seg-308d4c93a8a3 = MGEX

seg-b2b632cd52d2 = Multi-GNSS Experiment

seg-86fd2d84ed21 = IGS

seg-79f8412f30f2 = MIT

seg-70012b81c998 = Massachusetts Institute of Technology

seg-e9d7062835a9 = jako v licenci MIT

seg-a0b70e8c4c38 = MLP

seg-77abd5634603 = vícevrstvý perceptron

seg-6975432180f6 = malá neuronová síť

seg-a4be7b1d83e3 = MOD / TOD

seg-421b9611e897 = střední k datu / pravý k datu

seg-1af66f9b771d = soustavy rovníku a rovnodennosti

seg-b5db821f8008 = MOORA

seg-7f763036e34d = Multi-Objective Optimisation on the basis of Ratio Analysis

seg-d26a24b5d9f0 = MOPS

seg-e8707522cf5f = minimální provozní výkonnostní normy

seg-cd0720a78dbb = MPL

seg-bcdaf8567381 = Mozilla Public License

seg-0f45b55420be = MRO110 / MRO110B2

seg-61415a003e40 = gravitační modely sondy Mars Reconnaissance Orbiter { "110" } a 110B2

seg-8404f70361e7 = MSRV

seg-26a6a79755f9 = minimální podporovaná verze Rustu

seg-959fe8ad53df = MTF

seg-70d61ab4eb42 = modulační přenosová funkce

seg-7f60d1ac40ad = optické zobrazování

seg-8598e499c145 = MVDR

seg-c767dc9ae21a = odezva s minimálním rozptylem bez zkreslení

seg-83f57219e5b7 = adaptivní formování svazku

seg-e1ee50b3ea0a = MWL

seg-12d9510328d2 = mikrovlnná spojnice

seg-639266912f59 = spojnice pro přenos času ACES

seg-5ac07401e4f8 = NaN

seg-722d679807ee = není číslo (not a number)

seg-0e4abc653325 = NavIC

seg-355821380384 = Navigation with Indian Constellation

seg-fc13b86a8365 = NAVISP

seg-2eb6cc573946 = Navigation Innovation and Support Programme

seg-b518d44847fa = NAV / OBS

seg-c6965d4d7202 = navigační (zpráva) / pozorování

seg-1729ddf0eafa = dva typy souborů RINEX; Stanford NAV Lab je Navigation and Autonomous Vehicles Laboratory

seg-f239334e4928 = NBS / NBS14

seg-c8e5edff04d7 = bývalý americký Národní úřad pro standardy / referenční datová sada stability frekvence NBS14

seg-3d1ac5146fea = používá se ke kontrole odhadů Allan

seg-37879f5ad9e0 = NEES / NIS

seg-9610f0449fb2 = normalizovaná kvadratická chyba odhadu / normalizovaná kvadratická inovace

seg-af167a77a1dc = testy konzistence filtru

seg-beb7a86721ec = National Geospatial-Intelligence Agency

seg-7aa223cbfe13 = NGS / NOAA

seg-3845b0011dcb = National Geodetic Survey / National Oceanic and Atmospheric Administration

seg-4a1040c5f2fa = NIMA / TR8350

seg-4cf62b739fc6 = National Imagery and Mapping Agency / její technická zpráva TR8350.2 (definice WGS { "84" })

seg-ffa6025b5a70 = NIMA je dřívější název NGA

seg-af4be907e56c = NLOS

seg-22ab7d58324b = signál přicházející pouze odrazem

seg-9887902c13a1 = NNLS

seg-b4cb6d6bfce4 = nezáporná metoda nejmenších čtverců

seg-af8ca8550600 = NORAD

seg-07428e7224cf = North American Aerospace Defense Command

seg-4edb033e3432 = vede veřejný katalog družic

seg-dd984e16dbcd = NP

seg-f92816d7c936 = Neymanův–Pearsonův

seg-fc214695fa83 = teorie detekce

seg-3ef8006482bb = NPA

seg-81a072ee0520 = neprecizní přiblížení

seg-b9fd2cf6a2b9 = letectví

seg-e6cb557ee6d1 = NPB

seg-18510a95b308 = nutace–precese–bias

seg-b4562efbafdf = matice IAU 2006/2000A

seg-c5d8932f6956 = NRL / NRLMSISE-00

seg-9c9f5eac83b2 = Naval Research Laboratory / její model atmosféry Mass Spectrometer and Incoherent Scatter Radar Extended, { "2000" }

seg-bf373b9cd0c6 = NTN

seg-0ae939342934 = neterestrická síť

seg-1ae0305d8455 = 5G z družic

seg-20b98c32226f = NTRS

seg-1470d2af037a = NASA Technical Reports Server

seg-243d375db224 = OC-0 … OC-13

seg-d36b43dd505c = identifikátory nadsazených tvrzení

seg-47ba87f3730b = řádky CLAIMS-VS-REALITY.md

seg-e0689f1fc932 = OCI

seg-1a3377171d89 = Open Container Initiative

seg-b5bf07ed6c8c = formát obrazu kontejneru

seg-7b56c21cca93 = ODE / SDE

seg-722bdf2ca73a = obyčejná / stochastická diferenciální rovnice

seg-a4da10cb1150 = ODM

seg-b1c25bfe0612 = zprávy s daty drah

seg-35fe6a2f3de3 = rodina CCSDS, která zahrnuje OEM a OMM

seg-c06d6aa8ba3a = OGC

seg-eb1feb23de1c = Open Geospatial Consortium

seg-9737495b035c = OLS / WLS

seg-63bf35c31a6a = obyčejná / vážená metoda nejmenších čtverců

seg-487fb3dcfd01 = OPS-SAT / OPSSAT-AD

seg-4be3f4155fc8 = družice ESA jako laboratoř pro software na oběžné dráze / její datová sada pro detekci anomálií

seg-14b642ea59e1 = OSIP

seg-4871060090a0 = Open Space Innovation Platform

seg-251b3ff3eb9b = OSNMA / TESLA

seg-aa0d98a5c95a = Open Service Navigation Message Authentication / Timed Efficient Stream Loss-tolerant Authentication

seg-95b6b14facf1 = autentizace signálu Galileo

seg-501a89e8b32b = OS / OSes

seg-5a526cda4166 = Open Service (Galileo, BeiDou), nebo operační systém(y)

seg-6db10af375e3 = který význam platí, plyne z kontextu

seg-584a7e7d4f5e = OU

seg-937187abcdf6 = Ornstein–Uhlenbeck

seg-9be9042ec983 = šumový proces s návratem ke střední hodnotě

seg-08c583f40405 = PA

seg-9a24d9f45aa4 = zabezpečení produktu (také precizní přiblížení, jako v K_H,PA)

seg-65ad442b3faa = PCK

seg-c788fe80678e = jádro planetárních konstant

seg-46a00fdc9d5b = SPICE

seg-417a52c9c154 = PDF

seg-c462c83b47df = Portable Document Format

seg-98aa544ec4de = Pd / Pfa

seg-0c89f304435e = pravděpodobnost detekce / pravděpodobnost falešného poplachu

seg-5bde4fd55ead = PEF

seg-eb11dcb816ff = soustava mezi TEME a ITRF

seg-4682fd9daa70 = PG01 / PRN120 / GSAT0101

seg-47cc346307a6 = identifikátory družic: označení družice GPS v SP3, číslo pseudonáhodného šumu SBAS, název družice Galileo

seg-6ad2383f8545 = PHARAO

seg-0d9ce504e8c7 = Projet d'Horloge Atomique par Refroidissement d'Atomes en Orbite

seg-302c8cb738ac = cesiové hodiny ACES

seg-2e823cd9d9a6 = PL

seg-099bd07ef3cf = ochranná úroveň

seg-7d7eaa5eb223 = PLL

seg-9272ad22c094 = fázový závěs

seg-80e051b734dd = PMC / PMC10301026

seg-1f2a21c5e09f = PubMed Central / jeden z identifikátorů jeho článků

seg-3e4617444a63 = PM / FM

seg-c79b1246fb61 = fázová modulace / frekvenční modulace

seg-279251adb2eb = šum ve fázi nebo ve frekvenci hodin

seg-685fc49957e2 = PN

seg-209dacf76ff3 = jako v měření vzdálenosti PN

seg-f9cfe4e70f9a = PNG

seg-bde68df8ee7e = Portable Network Graphics

seg-06998de7b6be = POD

seg-178f55858efb = přesné určování oběžné dráhy

seg-b7919977bf20 = PPN

seg-ed81960f1282 = parametrizovaný post-newtonovský

seg-9683f98bec2d = PPP / RTK / SPP

seg-73d777100ecd = přesné určování polohy bodu / kinematika v reálném čase / určování polohy jedním bodem

seg-edb97cd7ef8b = PPS

seg-197b06571b4d = puls za sekundu

seg-2619e854281a = PR

seg-66c53cdfc3d9 = pull request

seg-e4dd8a3101cb = PRN

seg-6fb1378e889a = pseudonáhodný šum (číslo kódu)

seg-6f384580af80 = jak jsou družice GNSS označovány v signálech

seg-e8ca48eb958b = PROMETHEE

seg-e4e92d708223 = Preference Ranking Organization METHod for Enrichment of Evaluations

seg-d92234e26d53 = PRX

seg-c5774fede0a9 = Physical Review X

seg-8687e6badb6b = časopis

seg-78a947083d45 = PSD

seg-6eb799bd1582 = spektrální hustota výkonu

seg-ab1af8b3d968 = viz výše

seg-f7c4f1cff2a4 = PS / SPS

seg-e90e463df4b8 = Performance Standard / Standard Positioning Service

seg-2800b3a8cd2e = PS služby GPS SPS

seg-c8aa5ca0a4ea = PTB

seg-cf2a7714694f = Physikalisch-Technische Bundesanstalt

seg-611e7e4a34f4 = německý národní metrologický institut

seg-2d4bc9f59158 = PTP

seg-6291d09d3a93 = Precision Time Protocol

seg-44a14eeae3dd = IEEE { "1588" }

seg-bc4ad791804e = PVT

seg-1939c4e19702 = poloha, rychlost a čas

seg-a9aedd1f9806 = PyO3 / PyPA / PyPI

seg-95cead42b0d0 = knihovna pro propojení Rustu a Pythonu / Python Packaging Authority / Python Package Index

seg-96b2c707a6b8 = Parametry Zemli { "1990" }

seg-3d5012a62544 = geodetické datum GLONASS

seg-9d14fb150c09 = QA

seg-582cb8ea13ac = zajištění kvality

seg-7025be647972 = QEMU

seg-d2209c7eea42 = Quick Emulator

seg-d23b9bd48594 = QPSK

seg-45db179e8e49 = kvadraturní klíčování fázovým posunem

seg-b6d487bd53ed = QZSS

seg-c0484340bc52 = Quasi-Zenith Satellite System

seg-531943b17837 = Japonsko

seg-697c55525b36 = RAAN

seg-85cd6997e07e = rektascenze výstupného uzlu

seg-79e641db1aae = RAFS

seg-9fa6a6b0e193 = RDRR

seg-19b00c5b9270 = Resist–Detect–Respond–Recover (odolat–detekovat–reagovat–obnovit)

seg-76da7c5bf39a = model odolnosti RethinkPNT/Firesmith

seg-7bb5ed20c788 = RF

seg-35b036272c8e = rádiová frekvence

seg-404104795160 = RHEL

seg-dd1bb2300eb5 = Red Hat Enterprise Linux

seg-34b1e77b1ff0 = RHS

seg-0b4bdbcd1476 = pravá strana

seg-f801cff658be = RMS / RSS

seg-6b758beecbfc = odmocnina ze středního kvadrátu / odmocnina ze součtu kvadrátů

seg-8b2bd83256f1 = RNG

seg-b90957003307 = generátor náhodných čísel

seg-354b42e3a5d0 = RNTF

seg-0ce1e8f8bd4a = Resilient Navigation and Timing Foundation

seg-43d17f884c69 = ROI

seg-597432415e53 = návratnost investice

seg-7abb945359d0 = RPCF

seg-8c71df162ddd = Resilient PNT Conformance Framework

seg-2f030c1d70c1 = DHS USA

seg-82b81c1e28d6 = RTCM

seg-7b855a1075d4 = Radio Technical Commission for Maritime Services

seg-4a7703f1b605 = její norma zpráv nese CRC-24Q

seg-520c91fa0ef0 = open-source knihovna pro určování polohy GNSS (knihovna kinematiky v reálném čase)

seg-a8b2e577e381 = RTN

seg-6ddf35119d08 = radiální, příčný, normálový

seg-b1b635ff08e4 = soustava pevná vůči dráze

seg-04f4b26e9283 = RW

seg-b8b1a31739aa = náhodná procházka

seg-8b593d7d5dbd = jako v náhodné procházce biasu

seg-6f954dc5a005 = RWFM / WFM / FFM / WPM / FPM

seg-928fe3abcd5b = frekvenční modulace náhodnou procházkou, bílá a flicker frekvenční modulace / bílá a flicker fázová modulace

seg-7fced178bcc5 = typy šumu hodin s mocninným zákonem

seg-e39ddb9e8ec1 = SA.45s / SA65, OX-208

seg-0c397d845610 = názvy produktů Microchip (dvoje čipové atomové hodiny, termostatovaný krystalový oscilátor)

seg-8a1ae00c4a52 = názvy, nikoli zkratky

seg-a58426a850fd = SD

seg-d46cb77d53f6 = směrodatná odchylka

seg-e29dd726165f = SDD

seg-0ebb68e4b6fd = Service Definition Document

seg-9415da7a79ab = jako v Galileo OS SDD

seg-1022626b788c = SDK

seg-2076da4dd4dd = sada nástrojů pro vývoj softwaru

seg-9fb492bced01 = SDR

seg-1a1082059103 = softwarově definované rádio

seg-0a647acd4355 = SDS

seg-d0f6ae60b687 = Space Defense Squadron

seg-c3f6fc1456ed = 18. SDS vede americký katalog družic

seg-cf28e3e14401 = SEP

seg-a67fb04e0911 = úhel Slunce–Země–sonda (také sférická pravděpodobná chyba)

seg-0c7631f367e8 = SGD

seg-d58ce1e25c08 = stochastický gradientní sestup

seg-2f25205204e4 = SHM

seg-f2e2253a31b3 = jednoduchý harmonický pohyb

seg-b0973ab206ed = SI

seg-35624e5e4630 = Mezinárodní soustava jednotek

seg-02aa435dc884 = SIB

seg-262a811c8b69 = Safety Information Bulletin

seg-b9ee445609f5 = EASA; EASA je Agentura Evropské unie pro bezpečnost letectví

seg-8d6d4fe3d155 = SINEX

seg-e5c071685532 = Solution INdependent EXchange format

seg-3466519e4c62 = geodetická řešení

seg-b21a3d7fb59d = SIR

seg-303809c700e2 = vzorkování s převážením podle významnosti (sampling importance resampling)

seg-7a2e0e9cac08 = částicový filtr

seg-6da637028ef8 = SIS / SISA

seg-9779a20e50d2 = signál v prostoru / přesnost signálu v prostoru

seg-c0e9f44b333d = SITAN

seg-3eec2c14b564 = Sandia Inertial Terrain-Aided Navigation

seg-ceee87dd4b5e = SLR

seg-c8e722f1609c = laserové měření vzdálenosti k družicím

seg-76d80b0d2deb = SMAD

seg-7fbda47e3858 = Space Mission Analysis and Design

seg-dfc105c0178b = učebnice

seg-5278559437c5 = SNR

seg-b97c29ce3b37 = poměr signálu k šumu

seg-ff2faf259a15 = SOS / SSE

seg-5a2e327af384 = součet čtverců / součet čtverců reziduí

seg-453c4506fd59 = SOTA

seg-7eaa0caa6916 = současný stav poznání

seg-127e73a3610b = NIST Special Publication { "1065" }

seg-bedc9a3d8d9f = tentýž dokument jako NIST SP { "1065" }

seg-cf2491c1a488 = SPD / PD

seg-eade81634bf5 = symetrická pozitivně definitní / pozitivně definitní

seg-5fedf0f7b5c0 = SPDX

seg-3aba3c5a5c19 = Software Package Data Exchange

seg-c10b1f20f37e = identifikátory licencí v hlavičkách souborů

seg-b377a91a047f = SPK

seg-5603642c612d = jádro SPICE pro efemeridy kosmických lodí a planet

seg-cf18ba9c86d8 = SPOF

seg-cfab8d8a2cdf = jediný bod selhání

seg-c06f64211c40 = SQM

seg-7e58d6a4a92c = monitorování kvality signálu

seg-a4e75468e6f9 = kontroly spoofingu podle tvaru korelátoru

seg-0bb7a4875914 = SRIF

seg-82da1a1f1be4 = informační filtr s odmocninou

seg-970edb8ec42f = SRP

seg-ae097fbdabf9 = tlak slunečního záření

seg-edc814ba451b = SRTM / SRTMHGT

seg-b756bc93d2ea = Shuttle Radar Topography Mission / její formát souborů výšek

seg-4692354a98de = dlaždice se jmenují podle jihozápadního rohu, například N36W117

seg-00f36f1678d6 = SSD

seg-532285d8e6ce = Solar System Dynamics

seg-1d8167212f57 = skupina JPL

seg-d21315ea8c52 = STEC

seg-84689b829867 = šikmý celkový obsah elektronů

seg-eabee4bfb30e = Systems Tool Kit

seg-a7ff60ab0bd9 = produkt pro analýzu misí

seg-17d792c12885 = služba určování polohy a času společnosti Iridium

seg-3efaadad9c96 = STM

seg-da395fa674ec = matice přechodu stavů

seg-d116578b987b = SV

seg-caa37a1e7d12 = kosmické těleso (družice)

seg-845e6f3a37ec = SVD

seg-e775c436db4b = singulární rozklad

seg-3e5561868a7f = Scalable Vector Graphics

seg-4c48f567e37c = TAES

seg-db881ca72cd5 = IEEE Transactions on Aerospace and Electronic Systems

seg-39b93d9b401a = TC / TM

seg-b0df03cff98a = telekomanda / telemetrie

seg-fafb84a9796a = TDD

seg-ec3b92ad43c3 = vývoj řízený testy

seg-40defa915d0d = TDOA / FDOA

seg-e7db8768b023 = rozdíl časů / frekvencí příchodu

seg-aecac9c9d2d0 = pasivní určování polohy zdroje vysílání

seg-01861b3d63bf = TERCOM

seg-9ef3f9cbbe77 = porovnávání obrysů terénu

seg-5da9ae904ae0 = TEXBAT

seg-e90183a6fc69 = Texas Spoofing Test Battery

seg-941eccec7400 = zaznamenaná data spoofingu GNSS (OAKBAT je datová sada téže třídy)

seg-e71c15afe44e = TIE

seg-19bfea0d5c88 = chyba časového intervalu

seg-eb12660210bd = TIES

seg-9335f08b6381 = Telecommunication Information Exchange Service

seg-12f4af2b48c1 = účty členů ITU

seg-c05ba396ac1e = ToA

seg-78a41e672189 = čas příchodu

seg-7d821e75fdf7 = TOL

seg-4c7600f40479 = tolerance

seg-1f8b3be77dcc = TOPSIS

seg-00812e7bff63 = Technique for Order of Preference by Similarity to Ideal Solution

seg-c9a6058c9715 = TOTDEV / TOTVAR

seg-53a19d838c2d = celková odchylka / celkový rozptyl

seg-7350da5c5c30 = odhady stability s rozšířeným rozsahem

seg-91d2f49dc7c0 = TPAMI

seg-e9b41a993d86 = IEEE Transactions on Pattern Analysis and Machine Intelligence

seg-85692b01a12d = TPL

seg-123ed92776a3 = časová ochranná úroveň

seg-10c9563602b7 = viz SLOT-TIMING.md

seg-d1e3f93bc0aa = TPS

seg-579b1467ca5f = systém tepelné ochrany

seg-3b7fe44cc552 = TRN

seg-5239a432b919 = navigace podle terénu

seg-1df3bcf7eb97 = TR / TN

seg-ef0ff09dc412 = technická zpráva / technická poznámka

seg-643fa447bcee = TU Delft

seg-5c5492ecd86f = Technická univerzita v Delftu

seg-f3f22590bc57 = TWSTFT / TWTFT

seg-28c80c27a136 = dvoucestný družicový přenos času a frekvence / dvoucestný přenos času a frekvence

seg-e1a149ff6c43 = UBX

seg-fa0e9838530e = binární protokol přijímačů u-blox

seg-9555546fed38 = UDRE

seg-5fd7aec5beda = diferenční chyba vzdálenosti uživatele

seg-a3f5dda611b0 = SBAS

seg-b6f0baa6e478 = UERE

seg-4d1cb1c3ade9 = ekvivalentní chyba vzdálenosti uživatele

seg-7d87e82154ed = UFFC

seg-02457dbb660b = Ultrasonics, Ferroelectrics, and Frequency Control

seg-f4da31f92a79 = časopis IEEE Transactions

seg-573db7b5995b = { "300" } MHz až { "3" } GHz

seg-3688c8d84cdc = UI / UX

seg-42162760360f = uživatelské rozhraní / uživatelský zážitek

seg-7a56f7e38c5a = ULA

seg-4f4d9da7855c = rovnoměrné lineární pole

seg-db65f4a7586d = ULP

seg-ae7458813685 = jednotka na posledním místě

seg-d7f4df5a9d13 = přesnost čísel s plovoucí řádovou čárkou

seg-81dc0f4f1b2c = URA / URE

seg-c92cbc3e3954 = přesnost vzdálenosti uživatele / chyba vzdálenosti uživatele

seg-17e8fb142c6c = URA ohraničuje integritu, URE je RMS přesnosti

seg-1e02dfc0a52b = URL

seg-f726bcd9d4ad = jednotný lokátor zdrojů

seg-088e05d67af1 = USGS

seg-ffed8eca324d = United States Geological Survey

seg-1ded2eb40061 = USNO

seg-2b5f7bbe22e9 = United States Naval Observatory

seg-39ed84639c60 = USO

seg-f9f684640e53 = ultrastabilní oscilátor

seg-b3a829cb7d84 = US Standard Atmosphere { "1976" }

seg-ba97a4005ee8 = VIKOR

seg-dfb9c6638023 = VIseKriterijumska Optimizacija I Kompromisno Resenje (vícekriteriální optimalizace a kompromisní řešení)

seg-7fe170288e4e = interferometrie s velmi dlouhou základnou

seg-2e95d53160df = WAAS / EGNOS

seg-8a3ae96dd95a = Wide Area Augmentation System / European Geostationary Navigation Overlay Service

seg-1746693259e0 = SBAS; viz výše

seg-98f4f946a7ac = WASM

seg-257c477dc510 = WebAssembly

seg-eaf260aa0e21 = WASPAS

seg-4da2350f07f2 = Weighted Aggregated Sum Product ASSessment

seg-c9710476b8b5 = Pracovní skupina C spolupráce Evropské unie a Spojených států v oblasti družicové navigace

seg-79f0e87410bf = publikuje referenční dokumenty ARAIM

seg-199e55106e0f = WGCCRE

seg-9e2d0f828a0a = Working Group on Cartographic Coordinates and Rotational Elements

seg-d1939d914701 = WGN

seg-6bbc3adc6a53 = bílý gaussovský šum

seg-1e422c9001d4 = WGS72 / WGS84

seg-dab1ec7739ae = World Geodetic System { "1972" } / { "1984" }

seg-5964aa61f847 = SGP4 používá konstanty WGS72

seg-f4ea25131d04 = WHU

seg-7d30c759d92f = Wuchanská univerzita

seg-5d028f5e2120 = WSM / WPM

seg-ce407535733f = model váženého součtu / model váženého součinu

seg-cc68c85bb2b9 = vícekriteriální agregace (WPM také znamená bílou fázovou modulaci; který význam platí, plyne z kontextu)

seg-9041c866d202 = XML

seg-0e55c3adc568 = Extensible Markup Language

seg-93e0e8702167 = XOR

seg-cfa3197f8c1d = výlučné nebo

seg-7fba187cb552 = X / Y / Z / F (XYZF), D / I

seg-195082605699 = složky geomagnetického pole: sever, východ, dolů, celková intenzita; deklinace, inklinace

seg-94835748fcbb = YAGNI

seg-76430d755d74 = you aren't gonna need it (nebudeš to potřebovat)

seg-e4e177088376 = návrhový princip

seg-565c1908393c = ZHD

seg-77a0948bc15d = zenitové hydrostatické zpoždění

seg-749be52554c5 = Reprodukovatelnost a licencování

seg-d78d9bbb905c = <b>Reprodukovatelný (deterministický).</b> Stejný vstup vždy dává bit po bitu stejný výstup — <c1/>. Žádná skrytá náhodnost.

seg-1412347e2298 = <b>Seed (počáteční hodnota generátoru).</b> Číslo, které inicializuje (deterministický) generátor náhodných čísel, takže běhy jsou opakovatelné.

seg-3a35740e04a8 = <b>Open core.</b> Obchodní model: engine je zdarma a open source (AGPL-3.0, GNU Affero General Public License, definovaná níže; komerčně s duální licencí); udržitelný byznys tvoří podpora, integrace, komerční licence a proprietární doplňky — nikoli poplatky za uživatelská místa u otevřeného enginu.

seg-8ea21ebded3c = <b>AGPL-3.0.</b> GNU Affero General Public License v3 — open-source licence se silným copyleftem schválená OSI (Open Source Initiative). Podobná jako GPL (GNU General Public License), ale s další klauzulí (§{ "13" }) pro software nabízený uživatelům <b>přes síť</b>: upravená verze dostupná přes síť musí těmto uživatelům nabídnout odpovídající zdrojový kód. Otevřená licence { -brand }.

seg-f87860d8197d = <b>Duální licencování.</b> Nabídka téhož kódu pod dvěma licencemi, z nichž si uživatelé vybírají: zde AGPL-3.0 (otevřená, s copyleftem) <b>nebo</b> komerční licence od společnosti Ashforde OÜ (estonská společnost s ručením omezeným; OÜ = osaühing) pro proprietární či uzavřené použití, pro které AGPL nevyhovuje. Viz <c1/>.

seg-dd5f4a1bbbf5 = Používá se také na kshana.dev

seg-9d0c42560a90 = Zkratky, které web používá a které nejsou ve slovníku repozitáře výše.

seg-67a54ce8c89e = Global Positioning System

seg-814b0d29bbb2 = poměr nosné k hustotě šumu, v dB-Hz

seg-f22a269bc575 = rádiové pásmo od { "1" } do { "2" } GHz, které GNSS používá

seg-1f4360a0405c = kód hrubého určení/vyhledávání (coarse/acquisition) signálu GPS L1

seg-6f7910207534 = augmented forward signal (lunární)

seg-74f02864ce32 = mikroelektromechanické systémy

seg-0f931242ecc0 = UAS

seg-dddfd223a3b1 = bezpilotní letecký systém

seg-7091aabf8b6d = PL · AL

seg-12d88ab45197 = ochranná úroveň · mezní hodnota výstrahy

seg-78134bcc48da = přiblížení s vertikálním vedením, úroveň I

seg-27328b36b476 = LEO · GEO

seg-b1ae7014a663 = nízká oběžná dráha Země · geostacionární dráha

seg-c1d933dd3965 = OEM · OMM · TDM

seg-5d0ebe2bc51c = zprávy CCSDS s efemeridami drah, středními elementy drah a sledovacími daty

seg-fa9240660ec4 = IGRF

seg-c19fd59fdca0 = DSN

seg-7979317c75d2 = Síť hlubokého vesmíru

seg-c194401c2039 = TCXO · OCXO

seg-5c9d0b4c561d = teplotně kompenzovaný · termostatovaný krystalový oscilátor

seg-f3a7cc221b63 = PHM

seg-08d5cfc5b460 = pasivní vodíkový maser

seg-5ed928b1c6d0 = USO · DSAC

seg-b77f2ea4a521 = ultrastabilní oscilátor · atomové hodiny pro hluboký vesmír

seg-553814463110 = MTIE · TDEV

seg-2d9b8af50414 = maximální chyba časového intervalu · časová odchylka

seg-5b155b60152f = PRTC · ePRTC

seg-93d590e6408d = primární referenční časové hodiny · vylepšené PRTC

seg-8541a73eef89 = ADEV · σy(τ)

seg-a2ae4a40f486 = Allanova odchylka při průměrovací době τ

seg-96fae3b4fb8e = Mezinárodní telekomunikační unie, sektor telekomunikační standardizace

seg-24cab92c0fd3 = NIS · NEES

seg-7e82e2927d59 = normalizovaná kvadratická inovace · normalizovaná kvadratická chyba odhadu

seg-7175ab55e707 = JSON · CSV · SVG

seg-a9a2906d15de = JavaScript Object Notation · hodnoty oddělené čárkami · Scalable Vector Graphics

seg-d3a9009a35c0 = CLI · API · IDE

seg-c6418e1f785d = rozhraní příkazového řádku · programovací rozhraní aplikací · integrované vývojové prostředí

seg-8df86177107a = SBOM · SLSA

seg-e54326c78ab0 = soupis softwarových komponent · Supply-chain Levels for Software Artifacts

seg-347b23148b8f = NDA

seg-969d2489de28 = dohoda o mlčenlivosti

seg-564cfa0d3084 = Digital Object Identifier

seg-5cbd99859d90 = vodopád C/N₀

seg-ed4a9e041a83 = graf poměru nosné k hustotě šumu pro každou družici v čase

seg-1cb49c7e6c7f = HPL · VPL

seg-ccdc7d672c8f = horizontální · vertikální ochranná úroveň

seg-c7a40ebac7e1 = LROC

seg-529f02f85a76 = Lunar Reconnaissance Orbiter Camera

seg-c5da9d350518 = <s1>Předchozí</s1>Úvod do pojmů

seg-670504be0531 = <s1>Další</s1>Průvodce Studiem

seg-6c10aaedf2fc = <s1>Další</s1>Jazyky
