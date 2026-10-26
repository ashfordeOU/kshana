# docs--architecture: translations (cs)

seg-e366c6dd500e = Zdroj: <c1/>

seg-1f25b7fa1187 = Kshana — Architektura

seg-b0136a82669c = Kshana je <b>jeden engine</b> organizovaný ve vrstvách nad společným jádrem: <b>balíčky senzorů</b> (hodiny, inerciální, přenos času, hybridní); vrstva <b>astrodynamiky / numeriky</b> (analytické SGP4/SDP4 (SGP4: Simplified General Perturbations { "4" }; SDP4: Simplified Deep-space Perturbations { "4" }), numerický Cowellův propagátor se sedmiporuchovým silovým modelem, návrh manévrů, určování oběžné dráhy z vzdáleností pozemních stanic a proložení silového modelu přesnými efemeridami agentur); vrstva <b>času a referenčních soustav</b> (časové stupnice IERS (International Earth Rotation and Reference Systems Service), precese–nutace IAU (International Astronomical Union) 2006/2000A a redukce GCRS↔ITRS přes CIO (Celestial Intermediate Origin) (GCRS: Geocentric Celestial Reference System; ITRS: International Terrestrial Reference System)); vrstva <b>fúze</b> (estimátory GNSS/INS (GNSS: globální družicový navigační systém; INS: inerciální navigační systém)); vrstvy <b>integrity, odolnosti, alt-PNT (PNT: určování polohy, navigace a času) a lunární</b> (RAIM/ARAIM/SBAS (RAIM: autonomní monitorování integrity v přijímači; ARAIM: pokročilé autonomní monitorování integrity v přijímači; SBAS: družicový rozšiřující systém), rušení a vícevrstvá detekce spoofingu, přiřazování podle gravitačních/terénních/magnetických map a cislunární PNT); a novější vrstvy <b>LEO-PNT</b> (PNT na nízké oběžné dráze Země), <b>spektra</b>, <b>sluneční soustavy a návrhu konstelací</b>, <b>síťového časování</b> a <b>kampaní</b>, se zapisovači zpráv, animací a interoperability, které může použít každý běh (§1d). Napříč všemi nic engine neví o „kvantovém“ proti „klasickému“: pohání <em>chybové modely</em> senzorů scénářem výpadku GNSS, spouští estimátor a hodnotí výsledek. Kvantové a klasické zařízení se proto porovnávají na tomtéž scénáři a liší se jen svými (zveřejněnými, citovanými) chybovými parametry a nezávislými seedy šumu.

seg-02110864419e = Tento dokument shromažďuje strukturní a behaviorální diagramy. §{ "1" } je jádro balíčků senzorů; §1a mapuje vrstvy astrodynamiky, fúze a alt-PNT přidané od té doby; §1b–§1d vrstvy studií, domén a výstupů. K použití viz <a1>README</a1>; co je a co není validováno, viz <a2>VALIDATION</a2>; tabulku zralosti jednotlivých schopností viz <a3>CAPABILITY</a3>.

seg-7bcc7b5cd049 = Zkratky použité v diagramech a nerozepsané tam, kde se objevují: ADEV, Allanova odchylka; BW, šířka pásma; CAI, interferometr se studenými atomy; CZML, Cesium Language; Δ-DOR, delta differential one-way ranging; DO-229E, norma přijímače SBAS RTCA (Radio Technical Commission for Aeronautics); EKF, rozšířený Kalmanův filtr; FM, frekvenční modulace; GSE, pozemní podpůrné zařízení; HPL/VPL, vodorovná/svislá ochranná úroveň; IMU, inerciální měřicí jednotka; IOAG, Interagency Operations Advisory Group; IQ, vzorky ve fázi a kvadratuře; ISL, mezidružicový spoj; ITU-T, Telekomunikační standardizační sektor Mezinárodní telekomunikační unie; J2–J6, zonální harmonické gravitace Země stupně { "2" } až { "6" }; KIF, Kshana Interchange Format; KML, Keyhole Markup Language; KPI, klíčový ukazatel výkonnosti; L1/L5, nosná pásma GNSS (L2 halo drah CR3BP je naproti tomu Lagrangeův bod Země–Měsíc { "2" }); LEO, nízká oběžná dráha Země; LOO, vynechání jednoho (leave-one-out); LTC, koordinovaný lunární čas; MEO, střední oběžná dráha Země; MTIE, maximální chyba časového intervalu; N2, Hillovo číslo diverzity řádu 2; NED, sever-východ-dolů; NTN, nepozemská síť; OD, určování oběžné dráhy; OPS-SAT, družice Evropské kosmické agentury jako softwarová laboratoř na oběžné dráze; PPP, přesné určování polohy bodu; PSD, spektrální hustota výkonu; PVT, poloha, rychlost a čas; RINEX, Receiver Independent Exchange Format; RK4 / RK5({ "4" }), integrátory Rungeho–Kutty čtvrtého řádu a vnořeného pátého (čtvrtého) řádu; SH, kulová harmonická; SigMF, Signal Metadata Format; SIR, vzorkování s významovým převzorkováním; SRIF, informační filtr s odmocninou; SRP, tlak slunečního záření; SSC, koeficient spektrálního oddělení; STK, Systems Tool Kit; SVG, Scalable Vector Graphics; TDEV, časová odchylka; TDM, Tracking Data Message CCSDS (Consultative Committee for Space Data Systems); TLE, dvouřádková sada prvků; TPL, časová ochranná úroveň (Timing Protection Level); UBX, binární protokol u-blox; UHF, velmi vysoká frekvence (ultra high frequency); VLBI, interferometrie s velmi dlouhou základnou; VRW / ARW, náhodná procházka rychlosti / úhlu; WASM, WebAssembly.

seg-a87f668a8f97 = { "1" }. Struktura modulů

seg-0388999448a6 = CLI (rozhraní příkazového řádku) a obě vazby ústí do jednoho vstupního bodu <c1/>, takže se nikdy nerozejdou. Balíčky znovu používají společné jádro (<c2/>, <c3/>, <c4/>); Balíček { "4" } (<c5/>) skládá modely a estimátory Balíčků { "1" }–{ "3" }, místo aby je implementoval znovu; <c6/> odvozuje z geometrie časovou osu GNSS, která pak živí běh Balíčku { "1" }. Modul <c7/> sedí na úrovni signálu mezi rozpočtem spoje a doménou měření: z vlastních výkonových spekter signálu a rušiče odvozuje koeficient spektrálního oddělení <c8/>, z něhož <c9/> nyní počítá svůj protirušicí <c10/>, místo aby bral reprezentativní konstantu (zkontrolováno v CI (průběžná integrace)); nese také kompromis návrhu rozptylových kódů (m-posloupnost/Gold).

seg-cee4eb61a8e9 = Tři další moduly tvoří páteř <b>odolnosti bez GNSS</b>. <c1/> odpovídá přímo na provozní otázku — <em>jak dlouho mohou tyto hodiny běžet volně, než jejich časová chyba překročí rozpočet?</em> — tím, že uzavřený tvar chyby doběhu podle van Loana zpřístupňuje jako inverzi od holdoveru k prahu, zkontrolovanou proti vícekrokové rekurzi kovariance <c2/>. Jeho inerciální dvojče žije v <c3/> (<c4/>), které skládá bílý šum driftu interferometru se studenými atomy se zkreslením a chybou měřítkového faktoru do rozpočtu driftu polohy během holdoveru (člen zkreslení zkontrolován proti nezávislému integrátoru <c5/>). <c6/> vykresluje matici požadavek → modul → test → orákulum → stav celého enginu, s jednotkově testovanými invarianty, které zakazují štítek <em>ověřeno</em> bez nezávislého vnějšího orákula — takže tvrzení o jistotě se nemůže od kódu odchýlit.

seg-c7bee352c04d = 1a. Vrstvy astrodynamiky, fúze a alt-PNT

seg-99c44e3a86d5 = Kromě jádra balíčků senzorů sdílejí tři podsystémy totéž společné jádro a živí <c1/> (nebo jsou jím živeny). Vrstva <b>astrodynamiky / numeriky</b> přidává neanalytický Cowellův propagátor vedle analytické cesty SGP4/SDP4; vrstva <b>fúze</b> nese estimátory GNSS/INS; a vrstva <b>alt-PNT</b> je přiřazování podle gravitační mapy bez GPS (GPS: Global Positioning System). Jsou to schopnosti knihovny/scénáře (viz <a1>CAPABILITY</a1>, které jsou zapojeny do scénáře <c2/> a které dostupné jako API (rozhraní pro programování aplikací) Rustu).

seg-69f93294d2c8 = Členy sil numerického propagátoru jsou ve výchozím stavu vypnuty, takže jejich zapnutí nikdy neruší vydané zlaté reference. 17stavový těsně vázaný UKF (unscented Kalman filter) přečká výpadek GNSS na odvozené náhodné procházce rychlosti kvantového akcelerometru CAI; určování oběžné dráhy znovu používá tytéž <c1/>/<c2/> k propagaci kandidátního stavu přes sledovací oblouk.

seg-bd87e20c284b = Totéž společné jádro nese také čtyři další podsystémy, které nejsou nakresleny výše (jejich balíčky se objevují v rozdělení v §{ "4" }): vrstvu <b>času a referenčních soustav</b> (<c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>) redukující TEME↔GCRS↔ITRS (TEME: true equator, mean equinox) a živící balíček <c8/>/pozemní stopy; vrstvu <b>integrity</b> (<c9/>, <c10/>) pro RAIM/ARAIM/SBAS; vrstvu <b>odolnosti</b> (<c11/>, <c12/>, <c13/>, <c14/>, <c15/>) pro rušení a vícevrstvou detekci spoofingu, s vrstvou <b>navigačního signálu</b> (<c16/>) na úrovni signálu — spektrální hustoty výkonu BPSK-R (BPSK: binární fázová modulace) / sine-BOC (BOC: binární offsetová nosná), koeficient spektrálního oddělení <c17/>, který nyní odvozuje protirušicí <c19/> modulu <c18/>, RMS (Gaborovu) šířku pásma měření vzdálenosti, jitter koherentního sledování kódu časně–pozdě smyčkou DLL (smyčka s uzamčeným zpožděním) a obálku chyby vícecestného šíření (analýza výkonu signálu, <b>nikoli</b> návrh RF (radiofrekvenčního) nákladu / antény, což je role partnera pro náklad); a vrstvu <b>lunární / cislunární</b> (<c20/>, <c21/>, <c22/>, <c23/>) pro dynamiku CR3BP (omezený kruhový problém tří těles) — včetně matice přechodu stavu { "6" }×{ "6" } a jednostřelového diferenciálního korektoru (<c24/>, <c25/>, <c26/>), který vytváří skutečně periodické dráhy halo/NRHO (NRHO: téměř přímočará halo dráha), reprodukující zveřejněnou jižní NRHO L2 { "9" }:{ "2" } (dráha Gateway) s periodou ≈ { "6.57" } d / perilunem ≈ { "3,250" } km (zveřejněno ≈ { "6.56" } d / ≈ { "3,370" } km); selenocentrická transformace MCI/MCMF (MCI: inerciální soustava se středem v Měsíci; MCMF: soustava se středem v Měsíci pevná k Měsíci) korigované dráhy a pokračování rodiny zůstávají následnými úkoly a NRHO je řešení CR3BP (kruhové, bez Slunce), neověřené proti skutečné efemeridě LANS/Gateway (LANS: Lunar Augmented Navigation Service) — a integritu LunaNet. Proložení silového modelu agenturními efemeridami (<c27/>, <c28/>, <c29/>, <c30/>) a úplná sada polí alt-PNT (<c31/>, <c32/>, <c33/>) doplňují seznam modulů; zralost jednotlivých modulů viz <a1>CAPABILITY</a1>.

seg-05f8c8c84d15 = 1b. Studie odolnosti, hodnocení strojového učení a reprodukovatelné artefakty

seg-7350971daf4e = Pět dalších skupin modulů tvoří <b>otevřenou, reprodukovatelnou studijní</b> vrstvu za výzkumnými články projektu. Na rozdíl od scénářů <c1/> se k nim přistupuje jako ke generátorům <c2/> / <c3/>, které zapisují <b>byte-deterministické</b> artefakty (pevné seedy, zaznamenaná verze enginu + hash konfigurace). Všechny jsou <b>MODELLED</b> (syntetická kalibrace nebo kalibrace na veřejné datové sadě) a nesou otevřené štítky validace — žádná není certifikace.

seg-86b177166f0e = <b><c1/></b> — podmíněná časová ochranná úroveň (Timing Protection Level): holdoverem omezená mez <em>nezjištěné</em> časové chyby při spoofingu, skládající práh monitoru k-σ, van Loanův rozptyl doběhu přes latenci detekce a čas do poplachu CUSUM (kumulativní součet); kalibrovaná na skutečném zaznamenaném spoofingu (JammerTest { "2024" }). Neexistuje konečná <em>nepodmíněná</em> mez — TPL je podmíněná tím, že útok zjistí nezávislá křížová kontrola.

seg-b347924b874e = <b><c1/> / <c2/> / <c3/> / <c4/></b> — studie mezery optimismu při RF zhoršení: označený syntetický korpus a nástroj ROC/AUC (ROC: provozní charakteristika přijímače; AUC: plocha pod křivkou) nezávislý na detektoru, panel 13 detektorů (energie/AGC/SQM/parita (AGC: automatické řízení zesílení; SQM: monitorování kvality signálu) plus detektory logistické regrese s pevným seedem a MLP (MLP: vícevrstvý perceptron) s jednou skrytou vrstvou), zákony škálování uvnitř a mimo rozdělení trénovacích dat s permutační nulou a prediktor vynechání jednoho (leave-one-out) degradace mimo rozdělení. Metriky vyhodnocení jsou validovány bit po bitu proti scikit-learn.

seg-36206681024f = <b><c1/> / <c2/></b> — přijímací část softwarově definovaného přijímače (surové IQ/IF (IQ: ve fázi/kvadratura; IF: mezifrekvence) → odbočky korelátoru časně/okamžitě/pozdě → SQM) a adaptéry pro načítání (RINEX, u-blox UBX, GnssLogger, JammerTest, Yunnan, SatGrid), které umožňují týmž detektorům běžet nad záznamy dodanými lokálně; do repozitáře nejsou zapsány žádné datové sady.

seg-fefd78868fc2 = <b><c1/> / <c2/></b> — mapa křížení odolnosti kvantového a klasického řešení při nejistotě parametrů a kompromis přínosu holdoveru podle naměřené ADEV; numerická jádra kompromisu jsou validována proti scipy.

seg-5749f1300772 = 1c. Vrstvy integrity, GNSS, hlubokého vesmíru, Měsíce a misí

seg-f44755d6d921 = Zbývající domény se zapojují do téhož rozdělení <c1/> a znovu používají společné jádro, soustavy a geometrii. Vše zde je <b>MODELLED</b>, pokud řádek matice <c2/> necituje vnější orákulum (jádro RAIM proti SciPy, SBAS proti forku RTKLIB (open-source knihovna pro kinematické určování polohy v reálném čase), jádro DOP (faktor zhoršení přesnosti) gnss_lib_py, hodnocení OPS-SAT, jádro ochranné úrovně lunárního ARAIM, konzistence lunárních efemerid mezi poskytovateli) — zbytek lunární sady a kvantový demonstrátor jsou modelované, ilustrativní, z veřejných zdrojů a nenesou žádné tvrzení o TRL (úroveň technologické připravenosti) / odkazu na dřívější nasazení / podpoře agentury.

seg-044940c8d052 = 1d. LEO PNT, spektrum, sluneční soustava, síťové časování, kampaně a výstupy

seg-253a26d9cc5d = Nejnovější vrstvy sledují stejný vzor: každá je jeden či více scénářů <c1/> rozdělovaných z <c2/>, postavených na společném jádru a MODELLED, pokud řádek matice nepojmenovává vnější orákulum.

seg-e47cccd54da3 = Podrobnosti podle druhů jsou v <a1>LEO-PNT</a1>, <a2>LEO-SIGNAL</a2>, <a3>LEO-PASS</a3>, <a4>LEO-NAVMSG</a4>, <a5>LEO-PNT-FUSION</a5>, <a6>SPECTRUM</a6>, <a7>CONSTELLATION-DESIGN</a7>, <a8>TELECOM-TIMING</a8>, <a9>SLOT-TIMING</a9>, <a10>CAMPAIGNS</a10>, <a11>REPORTS</a11>, <a12>ANIMATION</a12> a <a13>INTEROP</a13>.

seg-d04b21c7cb6c = 1e. Vrstvy důvěry v přijímač, důkazů, telemetrie, tréninku a compliance ({ "0.35" })

seg-84ee122959b4 = Tyto vrstvy čtou vlastní záznam přijímače nebo zapisují soubory pro jiné nástroje; žádná z nich nesyntetizuje ani nevysílá radiofrekvenční signál. Stojí vedle <c1/>, nikoli pod druhy scénářů, kromě samotného <c2/>, které je druhem scénáře. Všechny jsou MODELLED, pokud řádek matice nepojmenovává vnější orákulum, a námořní výstupy mají pouze poradní charakter, nejde o typově schválené navigační zařízení.

seg-aab745a65e76 = Modul

seg-9d17ad3e87c8 = Zdokumentováno v

seg-920b6b14c0e2 = hodnotí záznam přijímače epochu po epoše monitory důvěry; platforma plavidla přidává námořní monitory a skóre 0–100 s důvody

seg-a77d1a8a62b5 = <a1>RECEIVER-TRUST</a1>, <a2>MARITIME-TRUST</a2>

seg-c311dfc2a161 = totéž hodnocení na proudu, jak přichází (stdin, soubor, do něhož se připisuje, TCP nebo UDP), věta <c1/> a volitelná brána; <c2/> je celek bez vstupu a výstupu

seg-07b2d6edf7b9 = podepsaný balíček záznamového okna s hash-řetězem, jeho konfigurace a výsledku enginu, ověřitelný offline; volitelný token časového razítka RFC { "3161" }

seg-32d08730b9c0 = datový proud důvěry jako metriky Prometheus, události syslog (CEF nebo LEEF) a volitelně OpenTelemetry (funkce <c1/>, ve výchozím stavu vypnutá)

seg-53311b8c3b93 = syntetická lodní sběrnice NMEA { "0183" } se skriptovanými událostmi rušení (jamming), odtažení, podvržení času a přehrání a s protokolem instruktora pro výcvik posádky (pouze text)

seg-f7cc3cfbdfc6 = agregované mapy zhoršené navigace z otevřeně licencovaných hlášení letadel a lodí a expozice trasy vůči nim; pouze lokální soubory

seg-83fe3c87e2d5 = verifikátor na straně přijímače pro Galileo OSNMA: čte stránky I/NAV (prosté stránky, vektorové CSV, proud UBX), kontroluje podepsaný klíč, řetězec TESLA a kódy MAC a pro každou družici hlásí, zda jsou navigační data autentizována; <c1/> je jediná cesta, kterou sdílejí příkazový řádek, Python a WebAssembly; pouze stav autentizace, nikoli služba integrity

seg-bf8cd5a45deb = OSNMA

seg-843a83b82283 = mapuje výstupy Kshana na veřejné rámce odolnosti a vyplňuje mapování z dokumentů s výsledky; <c1/> a <c2/> přijímají texty, nikoli cesty

seg-e16c483479ce = pohyb vozidla a události scénáře jako pohybový CSV, NMEA, text se trasovými body a soubory událostí pro laboratorní simulátor GNSS; žádný signál se nezapisuje

seg-044c58c98397 = Integrace pro lodě (zásuvný modul Signal K, režim brány OpenCPN a referenční sestavení) volají nástroj příkazového řádku; viz <a1>MARINE-INTEGRATIONS</a1>.

seg-cb8d8ff847eb = { "2" }. Řetězec zpracování enginu (na jeden běh)

seg-53e9e596ca44 = Každý běh provádí krok za krokem jeden model senzoru po časové mřížce; kdykoli je GNSS nominální, senzor se disciplinuje, a během výpadku ho nechá běžet volně (holdover / dead-reckoning).

seg-257407f3c375 = Scénář tento řetězec spustí dvakrát, jednou pro kvantový senzor a jednou pro klasický senzor, a to s <b>nezávislými hodnotami seed</b> (<c1/>), takže obě realizace šumu jsou nekorelované.

seg-4659e89ba5f5 = { "3" }. Rozhraní chybového modelu (bod rozšíření)

seg-7b70e8b1b98a = Každý senzor implementuje stejnou myšlenku: stavový objekt, jehož <c1/> posouvá jeho vnitřní stochastickou chybu a jehož nashromážděný stav se čte v každém taktu. Hodiny zpřístupňují nashromážděnou fázi; akcelerometry dvojitě integrovanou polohu; spoje jitter jednotlivých měření.

seg-79ab76c6dbc0 = <c1/> se přenáší do výsledku, takže každou hodnotu ve výstupu lze dohledat k publikovanému zdroji uvedenému v <c2/>.

seg-514c49659947 = Vedle analytického <c1/> spouští balíček hodin dvoustavový (fáze, frekvence) Kalmanův filtr (<c2/>), jehož procesní šum odpovídá skutečnému modelu. Při setrvání ve výpadku roste rozptyl jeho fázové chyby přesně na <c3/>, tedy analytický vztah pro holdover, a jeho online mez 1-σ slouží k naplnění ukazatele kvality <b>Integrita</b> (podíl vzorků výpadku, jejichž chyba zůstane uvnitř meze k-σ).

seg-7404589deb40 = { "4" }. Rozdělování (CLI a vazby)

seg-6138513a43f7 = <c1/> je jediný vstupní bod: nahlédne do <c2/> na nejvyšší úrovni, deserializuje odpovídající scénář, spustí balíček a vrátí <c3/> (<c4/> je přítomno pouze u druhů, které publikují tabulku reprodukovatelnosti). CLI je zapíše do souborů spolu se zprávou (<c5/>, <c6/>) a s výstupem <c7/> / <c8/>, pokud je požadován; vazby pro Python a WebAssembly je vracejí hostiteli. Jedno rozdělování, žádný rozpor.

seg-524f749be364 = Rozdělování probíhá podle typovaného výčtu <c1/>, který se vyhodnocuje vyčerpávajícím porovnáním (viz další podkapitola), takže přidání balíčku je změna kontrolovaná při kompilaci. Chybějící <c2/> se vrací k balíčku <c3/>, takže existující scénáře jednoho druhu se deserializují beze změny (<c4/> ignoruje pole <c5/> v každé struktuře scénáře). Nerozpoznaný <c6/> je odmítnut chybou <c7/>, která pojmenuje nejbližší vestavěný druh, pokud název vypadá jako překlep.

seg-eedaeae2a7e7 = Typované rozdělování a strukturované API

seg-ca47f566eaee = Rozdělování probíhá podle typovaného výčtu <c1/>, nikoli podle porovnání surového řetězce: <c2/> převede pole <c3/> na variantu a rozdělovač ji vyhodnotí vyčerpávajícím porovnáním; přidání balíčku je změna kontrolovaná při kompilaci, nikoli překlep v řetězci. Vedle <c4/>, které vrací řetězec (ponecháno pro CLI a stávající vazby), existují dvě typované rozhraní:

seg-167c47049329 = <b><c1/></b>: typovaný vstup se strukturovanou taxonomií chyb (<c2/>, <c3/>, <c4/>, <c5/>). Každá chyba nese stabilní <c6/>, aby volající mohl větvit podle kategorie selhání, místo aby analyzoval zprávu. Vazby to zpřístupňují jako <c7/>.

seg-1943051b3b20 = <b><c1/></b> (a <c2/>, ve vazbách zpřístupněné jako <c3/>): programová introspekce, tedy název, popis a povinná/volitelná pole každého druhu, pro automatické doplňování v uživatelském rozhraní (UI) a v noteboocích.

seg-630243592256 = Rozšíření Kshana o externí balíček

seg-d1adedd2c08b = Balíček třetí strany implementuje dva malé rysy (traits) stabilní z hlediska semver z <c1/>:

seg-d01471b13324 = <c1/> má také výchozí metodu <c2/>, která nic nedělá, pokud se balíček nepřihlásí k rozdělování přes registr v <c3/>. Vestavěný balíček <c4/> je zapojen přes <c5/> jako vzorový příklad; balíčky mimo strom (out-of-tree) se řídí stejnou smlouvou bez forku jádra (obdobně jako bod rozšíření <c6/> v §{ "3" }, který používá soukromá nadstavba odolnosti).

seg-5b0449d96bc3 = Kshana má proto <b>dvě stabilní rozšiřující rozhraní</b>: <em>senzor</em> se přidá implementací <c1/> (§{ "3" }), celý <em>druh scénáře</em> implementací <c2/> + <c3/>; obě jsou stabilní z hlediska semver a žádné nevyžaduje fork jádra:

seg-3928a007756b = { "5" }. Hybridní vrcholný balíček

seg-7f38e825519a = Hybridní balíček spouští <em>sadu</em> (jedny hodiny a jeden inerciální senzor) a vyžaduje, aby <b>čas i poloha</b> zůstaly ve specifikaci; <c1/> je doba do prvního porušení kteréhokoli z nich. Volitelně optický meziodružicový spoj během výpadku znovu synchronizuje <b>hodiny</b>, a to pouze podporou času; poloha se znovu nesynchronizuje, protože přenos času dává čas, nikoli polohu. Právě to izoluje inerciální senzor jako limitující faktor.

seg-17a8683f0982 = { "6" }. Dostupnost GNSS odvozená z geometrie

seg-afdb141ac367 = <c1/> je deterministická geometrická vrstva bez závislostí. <c2/> je buď analytická keplerovská <c3/> (dvoutělesová, volitelně se sekulárním J2), nebo plný propagátor <c4/> sestavený z úplné dvouřádkové sady prvků; generátor Walker-delta vytváří syntetické konstelace a přímá viditelnost = zákryt Zemí + elevační maska. Počet viditelných družic se mapuje na stav GNSS (≥{ "4" } = nominální, { "1" }–{ "3" } = zhoršený, { "0" } = odepřený) a <c5/> z toho vytvoří časovou osu dostupnosti, která řídí standardní běh holdoveru hodin. Dostupnost je tedy <em>odvozena z geometrie</em>, a nikoli psána ručně, zatímco běh, estimátor a hodnocení zůstávají beze změny.

seg-da82c97ac5c8 = Konstelace zadaná jako úplné TLE se propaguje modelem SGP4/SDP4 v <c1/> (ověřeno proti vektorům AIAA (American Institute of Aeronautics and Astronautics) 2006-6753); prvky pouze z řádku 2 zůstávají na analytické dvoutělesové cestě. Obojí lze v jednom bloku konstelace míchat.

seg-a47031620b54 = { "7" }. Vazby

seg-57fb29fdd9d9 = Jádro se beze změny kompiluje do nativního kódu, do rozšíření pro Python a do WebAssembly. Moduly pro Python (<c1/>, PyO3 abi3) a WebAssembly (<c2/>, wasm-bindgen) jsou volitelné závislosti řízené příznaky funkcí (<c3/> / <c4/>): výchozí sestavení a testovací sada je nikdy nekompilují, zatímco brána auditu závislostí (<c5/>) jejich stromy závislostí kontroluje, protože tyto crates jsou součástí balíčku wheel a balíčku npm. Oba volají <c6/>, takže každé rozhraní vrací shodné výsledky. Modul WebAssembly pohání prohlížečové hřiště v <c7/> a exportuje třináct funkcí: <c8/>, <c9/> (jeden běh enginu vracející výsledek, graf, shrnutí a tabulku dohromady), <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, kodek sdílitelných URL (URL: webová adresa) <c16/> / <c17/> a tři exportéry <c18/> / <c19/> / <c20/>, které pohánějí exportní nabídku hřiště. Dvě další vstupní brány vedou ke stejnému <c21/>: <b>server MCP (Model Context Protocol)</b> (<c22/>, crate <c23/> vyňatý z pracovního prostoru, který zpřístupňuje patnáct nástrojů: <c24/>, <c25/>, <c26/>, <c27/>, <c28/>, <c29/>, <c30/>, <c31/>, <c32/>, <c33/>, <c34/>, <c35/>, <c36/>, <c37/>, <c38/>; dva nástroje s příklady čtou přibalené scénáře přes funkci knihovny <c39/>, ve výchozím stavu vypnutou, kterou zapíná jen tento server) a <b>zásuvný modul pro JetBrains IDE (integrované vývojové prostředí)</b> (<c40/>, projekt v Kotlinu, který volá CLI <c41/> přes shell, místo aby knihovnu linkoval).

seg-a6620e0d6eef = Řízení funkcí: Python a WASM jsou <c1/> / <c2/>; tabulka přibalených scénářů je <c3/> (server MCP ji používá jako jediný); server MCP a křížové kontroly <c4/> jsou crates z pracovního prostoru VYŇATÉ; zásuvný modul IDE nic nelinkuje, spouští CLI.

seg-7bc5df56e4e5 = { "8" }. Determinismus a reprodukovatelnost

seg-fb95c37c7bb9 = Veškerá náhodnost prochází jediným <c1/> se seedem pro každý běh; pořadí kroků je pevné, takže platí <c2/>.

seg-e026c87beb26 = Výsledek nese SHA-256 (SHA: Secure Hash Algorithm) <c1/>; <c2/> spustí referenční scénář dvakrát a ověří, že výstup je bajt po bajtu shodný.

seg-42a3bdcbd99f = Stejný engine se kompiluje do nativního kódu, do rozšíření pro Python a do <c1/> pro běhy v prohlížeči, které dávají stejná čísla.

seg-12e00717c2d4 = { "9" }. Odložená / budoucí struktura

seg-8a8e1b93b704 = Astrodynamické, fúzní a alt-PNT vrstvy v §1a, tedy plný propagátor SGP4/SDP4, numerický Cowellův propagátor se sedmi poruchami v silovém modelu a dvěma adaptivními integrátory, návrh manévrů a trajektorií, určování oběžné dráhy, 15-/8-/17stavové estimátory GNSS/INS, spřažený filtr hodin a polohy a párování s gravitačními mapami, jsou všechny dodány, spolu s ukazatelem kvality Bezpečnost s aktivním demonstrátorem spoofingu, skutečnou geometrií TLE / více konstelací, pásmy Monte Carlo, studiemi kompromisů formou průchodů parametrů, tisknutelnou zprávou HTML (HyperText Markup Language) s jejím strojově čitelným dvojčetem a pracovními postupy pro vydání, publikaci, wheels a pages.

seg-318ad50d3826 = Několik schopností, které zde byly dříve uvedeny jako budoucí práce, bylo od té doby <b>dodáno</b> a je popsáno výše nebo ve <a1>VALIDATION</a1>: plná nutace IAU 2000A a redukce GCRS↔ITRS / ITRF (International Terrestrial Reference Frame) bez rovnodennosti přes CIO (ověřeno bit po bitu proti SOFA/ERFA (SOFA: Standards of Fundamental Astronomy; ERFA: Essential Routines for Fundamental Astronomy)), geopotenciál EGM2008 (Earth Gravitational Model { "2008" }) do stupně/řádu { "70" }, člen <b>Lense–Thirring</b> (strhávání rámce), slapy pevné země, oceánské a atmosférické, křížová validace efemerid třídy DE (DE440/ANISE (DE440: Development Ephemeris { "440" }; ANISE: Attitude, Navigation, Instrument, Spacecraft, Ephemeris, čistě Rustový nástroj pro planetární geometrii)), externí křížová validace numerického Cowellova propagátoru pomocí Orekit { "12.2" } ({ "0.08" } m za { "24" } h) i dávkového a sekvenčního určování oběžné dráhy a 17stavový těsně vázaný navigátor zpřístupněný jako druh scénáře <c1/>.

seg-068119b15b27 = Zbývající navazující práce jsou sledovány v <a1>CHANGELOG</a1> <c1/> a v plánu jednotlivých schopností v <a2>CAPABILITY</a2>: externí hodnota orákula pro vysokostupňový vyhodnocovač EGM (Earth Gravitational Model) přesně na polární ose a porovnání v těsné blízkosti pólu čisté vůči pyshtools (vyhodnocovač do stupně { "2190" } a jeho zavaděč <c2/> za běhu jsou dodány, MODELLED; viz <c3/>), časově proměnný ovladač kosmického počasí pro volitelnou úroveň hustoty odporu NRLMSISE-00 (NRLMSISE: Naval Research Laboratory Mass Spectrometer and Incoherent Scatter Radar Extended atmosphere model) (výchozí hustota odporu je statický exponenciální model a hustota Jacchia-71 druhu <c4/> je charakterizována vůči NRLMSISE-00, ale není jím nahrazena), externí kontrola volitelného stínu s okrajovým ztmavením slunečního disku, těsné spřažení GNSS/INS s fází nosné a skutečná gravitační mapa EGM2008/EIGEN (EIGEN: European Improved Gravity model of the Earth by New techniques) pro alt-PNT párovač.

seg-b48f69ea54b3 = Soukromý překryvný repozitář obsahuje hloubku odolnosti citlivou z hlediska exportu; zapojuje se přes totéž rozhraní <c1/> (a smlouvu <c2/> v §{ "4" }) bez změny veřejného enginu.

seg-2f88ab8f67e8 = <s1>Předchozí</s1>Kde Kshana běží

seg-02b0e0fdcdbe = <s1>Další</s1>Kde Kshana stojí

seg-8c9d1d90dc8e = <b><c1/></b> — engine pro hodnocení odolnosti PNT v souladu s rámcem (kategorie RPCF (Resilient PNT Conformance Framework) amerického ministerstva vnitřní bezpečnosti DHS) plus studie nestability rozhodnutí: Dirichletův vážicí simplex, nestabilita pořadí podle Kendallova τ, četnost změny vítěze top-1 a <b>kolaps diverzity</b> společného režimu (Hill-N2), se zprávou o zajištění chráněnou integritním hashem a { "35" } ručně odvozenými testy orákula. Viz <a1>RESILIENCE-CROSSWALK</a1>. Syntetické architektury sladěné s RPCF v2.0 — vlastní posouzení, nikoli certifikace.
