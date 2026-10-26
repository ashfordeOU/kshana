# docs--modelled-rationale: translations (cs)

seg-2db69c58f694 = Měsíční diferenční PNT

seg-1ff1d8ebf1e7 = Mapování compliance na veřejné rámce

seg-aab745a65e76 = Modul

seg-d6476863f862 = Schopnost

seg-60a43431ebe0 = Požadavek

seg-bde1b3a94a47 = Stín SRP se slunečním ztmavením k okraji (volitelné)

seg-eaaec545dd68 = Osvětlený podíl SRP jako nezakrytá část slunečního toku se ztmavením k okraji (zákon aproximace Eddingtona I(mu)/I({ "1" }) = 2/5 + 3/5 mu, Gaussova–Legendreova kvadratura) nad sférickou nebo WGS-84 Zemí (srp_shadow::limb_darkened_shadow, varianta ShadowModel OblateEarthLimbDarkened)

seg-9e15970435c3 = Slunce a Měsíc z DE440 v silovém modelu Cowell (volitelné)

seg-de6831cf7785 = Volitelná efemeridová úroveň pro členy třetího tělesa a SRP numerického ForceModel Cowell: geocentrické Slunce a Měsíc z libovolného EphemerisProvider (jádro DE440 SPK přes KernelEphemeris) při TDB = TT + (TDB - TT), odmítající poskytovatele, který nemůže obsloužit epochu, a započítávající každý návrat k analytické řadě; ve výchozím stavu vypnuto

seg-057c21daf4f2 = Atmosférický příliv S1 (volitelné)

seg-f600a39f297e = Denní příliv tlaku vzduchu S1 jako porucha geopotenciálu: model N1 Biancale a Bode ({ "2006" }), stupně { "2" } až { "6" }, přes vzorec zatížení IERS { "2010" } rov. { "6.21" } (tides::atmospheric_tide_s1, s1_air_tide_acceleration), volitelné v silových modelech Cowell a přesných (air_tide_s1, ve výchozím stavu vypnuto)

seg-e8f5ff8c9149 = Gravitace pomocí sférických harmonických vysokého stupně (EGM2008 do { "2190" })

seg-d3b2f32dcecb = Vyhodnocení plně normalizovaného pole do stupně { "2190" } bezpečné vůči podtečení a pólům (SphericalHarmonicField::acceleration_hf / potential_hf, modifikovaný dopředný sloupec Holmes-Featherstone { "2002" } s gradientem bez 1/cos phi), proudový načítač ICGEM .gfc (from_gfc_file / from_gfc_reader; úplné EGM2008 se stahuje za běhu, není přibaleno) a vyhodnocovač Holmes-Featherstone volitelný na volitelném Cowell Geopotential

seg-1960804ef2f4 = Dávkové určování oběžné dráhy z rychlosti změny vzdálenosti a az/el s maskováním stanice

seg-4c185244bc66 = Obnovení stavu v epoše ze smíšeného měření vzdálenosti, rychlosti změny vzdálenosti a azimutu/elevace nad elevační maskou metodou Gauss-Newton na H = (dh/dx(t)) Phi(t, t0): analytické parciální derivace měření a variační matice přechodu stavu s analytickými parciálními derivacemi dvou těles + J2 (integrovaná RK4, nikoli matice přechodu stavu v uzavřeném tvaru)

seg-bc3d1ee7c639 = Vážení pozorování podle kódu přesnosti SP3

seg-63b1fab84f85 = Mapování kódů přesnosti SP3 (hlavička ++ exponenty v { "2" }^n mm, základ %f, směrodatné odchylky base^n mm v jednotlivých záznamech) na sigma polohy pro jednotlivá pozorování v enginu přesného určování oběžné dráhy (sp3::parse_sp3_accuracy, Sp3Accuracy::position_sigma_m)

seg-ae3e8833a5ef = Připojení publikovaného gravitačního pole k tělesu

seg-ffb2b20e5f32 = with_gravity_field (na Body, v src/gravity_pds.rs): připojí libovolné načtené sférickoharmonické pole (například GMM-3 nebo GL0660B) k Body, takže je propagátor vyhodnocuje v pevné soustavě tělesa; volitelné, výchozí tělesa beze změny

seg-9762cf428435 = Kodéry navigačních zpráv nad rámec GPS LNAV (GPS CNAV, Galileo I/NAV a F/NAV)

seg-9b703b9607d8 = Typy zpráv GPS CNAV 10/11/30, typy slov Galileo I/NAV 1-5 v nominálních sudých/lichých stránkách a typy stránek Galileo F/NAV 1-4: balení polí ICD a kvantizace, CRC-24Q, konvoluční kódování s rychlostí 1/2 K={ "7" } (G2 invertováno pro Galileo), blokové prokládání a synchronizační vzory, s odpovídajícími testovacími dekodéry

seg-974d8c1f7876 = Hatchovo vyhlazení kódu nosnou na skutečných pozorováních RINEX

seg-f26b5da0f52e = Hatchův filtr bez divergence (kód bez vlivu ionosféry nesený nosnou bez vlivu ionosféry, okno N epoch, restart při ztrátě zachycení, skoku bez geometrie nebo mezeře) v sestavě přesného určení polohy z jednoho bodu

seg-278ca396127a = Čtení pozorovacích souborů RINEX { "4" }

seg-e0883aa933eb = Hlavičky pozorování RINEX 4.0x (DOI, LICENSE OF USE, STATION INFORMATION, MERGED FILE; popisky se párují ve sloupcích 61-80 pro verzi { "4" } a novější) a záznamy epoch

seg-33e5c74720ff = Poloha geostacionární družice BeiDou z vysílaných efemerid

seg-44b61449b65a = BDS-SIS-ICD-B1I v3.0 §{ "5.2.4.12" } poloha geostacionární družice z vysílaných efemerid (soustava podobná inerciální, poté Rz(Ω̇e·tk)·Rx(−{ "5" }°)), volitelná přes pole include_beidou_geo v NavParseOptions, takže výchozí čtečka GEO stále přeskakuje

seg-71f48628ebb2 = Těsně vázané GNSS/INS s fází nosné a plovoucími nejednoznačnostmi

seg-5a156aa81275 = Chybový stavový EKF nad { "15" } stavy INS, dvoustavovými hodinami přijímače a jednou plovoucí nejednoznačností nosné na sledovanou družici; pseudovzdálenost, fáze nosné a volitelně rychlost změny vzdálenosti z konstelace Walker SGP4 (světelný čas a Sagnac), korekce Klobuchar a Saastamoinen/Niell aplikované ve smyčce na vlastní poloze filtru; detekce skoků časově diferencovanou nosnou s prahem pro každou družici rozšířeným o nejistotu rychlosti; opětovná inicializace nejednoznačností při skocích a při opětovném zachycení

seg-7d644516b1ec = Balíčky GNSS/INS pro námořní, železniční a letecký provoz s volbou těsné vazby

seg-cbb03a8baf73 = Tři scénáře gnss-ins nad knihovnou trajektorií (plavidlo kličkující rychlostí { "8" } m/s s pětiminutovým výpadkem; vlak průsekem se dvěma družicemi a tunelem; letadlo, jehož výpadek zahrnuje 25stupňovou zatáčku v náklonu) a volitelná tabulka [tight] balíčku: pseudovzdálenosti z konstelace Walker SGP4 sloučené navigátorem s uzavřenou smyčkou, při nominálním stavu každá družice nad maskou a při zhoršení nejvyšší z nich několik

seg-f4dab73c4eda = Svázaný filtr PNT z pseudovzdáleností se stavem posunu a rozšířením do 3-D v balíčku fúze

seg-742b60089361 = Jeden složený Kalmanův filtr nad polohou, rychlostí, fází hodin a frekvencí, krmený pseudovzdálenostmi, které svazují polohu a hodiny (aktualizace ve Josephově tvaru nesoucí křížovou kovarianci); varianta s 1 stupněm volnosti rozšířená o stav konstantního posunu akcelerometru, kterou balíček fúze spouští pod [coupled]; a 3-D verze s 8 stavy s řádky směru k družici

seg-2db2b9dc3b45 = Knihovna trajektorií GNSS/INS a import pravdy z CSV

seg-86f9186bb884 = NRHO { "9" }:{ "2" } v CR3BP Země–Měsíc proti dráze, kterou letěl CAPSTONE

seg-d4127cf241f3 = Kruhová omezená jižní téměř přímková halo dráha { "9" }:{ "2" } kolem L2, kterou opravuje cr3bp::differential_correct_halo (rodina drah Gateway a CAPSTONE), porovnaná podle střední geometrie (perioda, poloměr periluna, poloměr apoluna) s dráhou, kterou CAPSTONE skutečně letěl. Měření toho, jak dobře člen CR3BP popisuje skutečnou dráhu; dráha CR3BP není dráhou modelu efemerid a neporovnává se epochu po epoše

seg-bbb1828b3db1 = Redukce městského kaňonu, sektorů a terénu na tabulku

seg-2864aec7be88 = skyline: městský kaňon v uzavřeném tvaru (řez atan((h - a) / d) pro d = (w/2) / abs(sin(az - s)), otevřené konce pro konečnou délku), ostře ohraničené sektory po směru hodinových ručiček s přechodem a body terénu redukované na tabulku se zakřivením zemského povrchu d^2/({ "2" } * 4/3 R); obzor je jejich bodové maximum s libovolnou tabulkou

seg-3f3d657854ce = Předvolby obzoru (městská ulice, přístav, fjord, kontejnerový terminál)

seg-b915c06fa3f1 = skyline::PRESETS: čtyři REPREZENTATIVNÍ geometrie s rozměry uvedenými v návrhové poznámce a s jedním řádkem původu každá: city-street (kaňon, ulice { "0" } deg, { "20" } m mezi zdmi vysokými { "30" } m, anténa { "1.5" } m), harbour-approach (sektory: otevřeno k moři v rozsahu { "180" } deg, nábřežní budovy { "8" } deg v rozsahu { "90" } deg, vlnolam { "3" } deg), fjord (terén: stěny { "600" } m nad anténou ve vzdálenosti { "1.5" } km po obou stranách severojižního kanálu, uplatněn pokles způsobený zakřivením), container-terminal (sektory: stohy { "12" } deg nad pevninskou polovinou, výložníky jeřábů { "35" } deg a { "25" } deg nad dvěma úzkými sektory); lze přepsat pole po poli

seg-6012113b4836 = Funkce geometrie oblohy: viditelnost, DOP, kovariance, chybová elipsa, mrak Monte Carlo

# c1: kshana sky
# c2: kshana skyline
# c3: sky_geometry
seg-17352a3aa356 = geometry (sky_geometry, sky_monte_carlo, skyline_presets, skyline_profile, skyplot_svg; CLI <c1/> a <c2/>, funkce Pythonu a WASM stejných názvů, MCP <c3/>): z místa, času a předvoleb konstelací (nebo družic zadaných jako azimut/elevace či ECEF) družice viditelné a maskované obzorem, GDOP/PDOP/HDOP/VDOP/TDOP, jednotkový kofaktor (H^T H)^-1 a kovariance ve východ–sever–nahoru s jedněmi hodinami přijímače na systém nebo jedněmi společnými, horizontální chybová elipsa (poloosy k sigma sqrt(lambda), k = sqrt(-2 ln({ "1" } - p)), orientace { "0.5" } atan2({ "2" } Q_EN, Q_NN - Q_EE) od severu) a n chyb metodou nejmenších čtverců se seedem při nezávislých gaussovských chybách vzdálenosti s jejich empirickou kovariancí, RMS a { "95" } % oblastí zahrnutí. Kofaktorem je orbit::cofactor_from_los, jediné jádro za orbit::dop a orbit::dop_cov (dop je redukce dop_cov): žádná druhá implementace DOP

seg-7f66be0f15c8 = Holdover hodin bez GNSS

seg-4d8f87668a0f = Růst chyby při setrvání v uzavřeném tvaru + holdover do prahu; třídy kvantových hodin

seg-29b482d88916 = Karty změřených hodinových zařízení (predikce na zadržených datech)

seg-8c68c5b25004 = clock_library: karta zařízení (bílý šum fáze, bílý, flicker a náhodná procházka FM plus lineární drift frekvence) fitovaná na jednu třetinu pojmenovaného změřeného záznamu hodin po zaznamenaném čisticím průchodu (odstraněny mezery, fázové odlehlé hodnoty, fázové skoky, shluky; zaznamenány skoky frekvence), vážená stupni volnosti typů šumu určenými z lag-1, a její predikovaná Allanova odchylka vyhodnocená na zadržených dvou třetinách; čtečky souborů hodin RINEX a IGS, souborů BIPM pro jednotlivé laboratoře a Circular T oddíl { "1" }; převod karty na model šumu časování slotů, rozšířený Kalmanův model hodin a úrovně šumu monitoru spoofingu

seg-5097a0e6460d = Karty změřených hodin GPS Block IIF s členy na jednu oběžnou periodu (predikce na zadržených datech)

seg-3da8122f5608 = clock_library::card::DeviceCard::fit_phase_periodic: karta zařízení, která nese fázové členy jednou až čtyřikrát za oběh (perioda T/k, T = { "43 082.05" } s), fitované společně s kvadratickým členem metodou nejmenších čtverců na jedné třetině změřeného záznamu hodin družice, přičemž příspěvek každého členu k Allanově odchylce má uzavřený tvar { "4" } A^{ "2" } sin^{ "4" }(pi tau / P) / tau^{ "2" } v predikované Allanově odchylce

seg-0d72fcc0fbea = Odhad stavu palubních hodin

seg-6db5391f8ebe = 3stavový (fáze/frekvence/drift) Kalmanův model hodin podle Van Loana, stabilizovaný podle Josepha

seg-3f0a9d7c2971 = Rozpočet chyb přenosu času

seg-216f46b43860 = Dvoucestný přenos/TWSTFT (Sagnac), společný pohled GNSS, PPP; rozkmit spoje→vzdálenost

seg-157fadeb5d67 = Modulace navigačního signálu a analýza sledování kódu

seg-ab633d191396 = PSD BPSK-R/BOC, spektrální separace κ, Gaborova šířka pásma, jitter DLL, vícecestné šíření

seg-e6c08e1e6ae3 = Výkon kvantového inerciálního senzoru

seg-d28e1f6a430f = Akcelerometr na bázi interferometru se studenými atomy z prvních principů (k_eff·T², QPN)

seg-4b79d03cecf5 = Nejednoznačnost proužků / dynamický rozsah kvantového inerciálního senzoru

seg-deb2850546d5 = Dynamický rozsah nejednoznačnosti proužků Mach–Zehnder: odečet proužků s periodou 2π určuje maximální jednoznačnou měrnou sílu a_max=π/(k_eff·T²) a jednoznačný rozsah v rozlišovacích buňkách a_max/σ_a=π/σ_Φ nezávisí na optickém škálovacím faktoru – zisk citlivosti úměrný T² stojí jednoznačný rozsah v přesné shodě (doba interrogace vyměňuje rozlišení za rozsah, přičemž počet buněk zůstává dán fázovým šumem odečtu)

seg-d04bf321d4a1 = Odolnost kvantové inerciální dead-reckoning navigace

seg-c4989abb5d40 = Složený rozpočet polohy z biasu, škálovacího faktoru, VRW a poklesu stability během holdover

seg-5692c7b936b6 = Odolnost vůči rušení (jamming) bez GNSS

seg-f4ff77caa47b = Geometrický rozpočet spoje J/S, protirušicí C/N₀, ztráta zachycení pro jednotlivé družice

seg-ff90679d1de9 = Detekce spoofingu

seg-b843f63e77e6 = Bezpečnostní ukazatel kvality sloučený pro každou epochu: χ² podporované hodinami, RAIM, AGC, SQM

seg-b10d07921f5e = Ochranná úroveň časování při spoofingu

seg-2a829711b997 = Mez v uzavřeném tvaru pro nejhorší nedetekovanou časovou chybu = práh monitoru + σ setrvání oscilátoru během latence detekce CUSUM, uváděná jako pásmo prahu červeného šumu

seg-f1d49eac89f8 = Alternativní / doplňkové PNT

seg-023dda973f66 = Porovnávání gravitačních map, navigace podle terénu (TERCOM/SITAN), magnetické anomálie

seg-791e7285c291 = Reprodukovatelnost a zajištění kvality softwaru

seg-7177355a482c = Deterministické, hashované podle scénáře, SBOM + meziplatformní zlaté brány

# c1: impairment-eval
seg-241f2eeaef12 = Označkovaný syntetický korpus rušivých vlivů + testovací sada ROC/AUC/matice záměn/Pfa-Pmd nezávislá na detektoru; ochrana proti úniku dat, stratifikované dělení, zpráva o optimismu při posunu rozdělení (v režimu a mimo režim). Spustitelné z CLI/vazeb jako druh scénáře <c1/> (scenarios/impairment-eval.toml)

# c1: cargo run --release --example optimism_study
seg-642087659fda = Řízená syntetická studie mezery optimismu AUC mezi rozdělením v tréninku a mimo ně u publikovaných metod a naučených detektorů (logistická regrese / MLP s jednou skrytou vrstvou): trendy podle zákona škálování pro každou třídu (Spearmanovo ρ + sklon na { "1" }−závažnost) a ridge prediktor jen z dat uvnitř rozdělení, který odhaduje mezeru pouze z diagnostik uvnitř rozdělení, hodnocený metodami vynechání jednoho detektoru a vynechání jedné třídy. Reprodukovatelné pomocí <c1/>

seg-fd6424213d1f = Obchodní srovnání kvantového a klasického PNT a odolnost bez GNSS ({ "13503" })

# c1: quantum-trade
seg-21b2b54200a8 = Načtení změřené ADEV (NNLS), srovnávací tabulka (holdover časování/inerciální + přínos), obálka odolnosti v čase; upozornění na práh je neseno artefaktem. Spustitelné z CLI/vazeb jako druh scénáře <c1/> (scenarios/quantum-trade.toml)

seg-1fa865bfddd1 = Prostředí kosmického počasí a hustota termosféry řízená aktivitou

# c1: space-weather
seg-47308f611c7e = Sluneční/geomagnetické indexy (definiční tabulka Kp↔ap), exosférická teplota podle Jacchii-1971 a hustota termosféry podle Jacchii { "1971" } (SAO Special Report { "332" }: statické difuzní profily reprodukující její tabulku { "7" }, s denními, geomagnetickými, půlročními, sezónně-zeměpisnými a héliovými variacemi) proti statické atmosféře USSA76. Spustitelné z CLI/vazeb jako druh scénáře <c1/> (scenarios/space-weather.toml)

seg-c76b8c395ef0 = Okno startu a geometrie výstupu (analýza misí)

# c1: launch-window
seg-6066c634faba = Dvoutělesový azimut(y) startu (sin Az = cos i / cos lat), minimální dosažitelná inklinace, kruhová rychlost, východní bonus rotace Země, Δv změny roviny typu dogleg a denní příležitosti a, pro danou epochu a řádky IERS finals2000A, rychlost místa kolem skutečného pólu (launch::site_rotation_speed_at). Spustitelné z CLI/vazeb jako druh scénáře <c1/> (scenarios/launch-window.toml)

seg-ff2cd766bb52 = Koridor balistického návratu do atmosféry (Allen–Eggers)

# c1: reentry
seg-c3f3422f96e4 = Špičkové zpomalení (nezávislé na balistickém koeficientu), rychlost a výška při špičkovém g a rychlost špičkového ohřevu pro balistický vstup do exponenciální atmosféry. Spustitelné z CLI/vazeb jako druh scénáře <c1/> (scenarios/reentry.toml)

seg-7b4a8e25c3c9 = Adaptivní kódování a modulace DVB-S2 podél sestupného spoje přeletu na LEO

# c1: acm-link
seg-3912fb8ccb15 = Es/N0 sestupného spoje podél každého přeletu jedné družice nad jednou stanicí (EIRP, ztráta volným prostorem, ztráta atmosférou podle zákona kosekantu, ostatní ztráty, G/T, Boltzmannova konstanta, symbolová rychlost), nejúčinnější MODCOD DVB-S2, který překoná svůj práh kvazibezchybného přenosu podle ETSI EN { "302" } 307-1 V1.4.1 tabulka { "13" } plus implementační rezervu v každém kroku, objem dat ACM přeletu a základ s konstantním kódováním, který se uzavře na masce a při nejdelší vzdálenosti. Spustitelné jako druh scénáře <c1/>. Ilustrativní vstupy; MODELLED.

seg-19603a7e0fe8 = Plánování kontaktů více družic a více stanic s řešením konfliktů

# c1: contact-schedule
seg-40edeae6e48b = Kandidátní kontakty z každého přeletu družice nad stanicí s jeho objemem dat ACM; konflikty, kde by jedna anténa obsluhovala dvě družice v rámci své doby přípravy nebo by jedna družice vysílala současně do dvou stanic; cíl doručení vážený prioritou omezený backlogem každé družice; plán líného marginálního hladového algoritmu, základ typu kdo dřív přijde a přesné větvení a ohraničování až pro { "26" } kandidátů, s uvedenou mezerou optimality hladového plánu. Spustitelné jako druh scénáře <c1/>. Ilustrativní vstupy; MODELLED.

seg-3742d2aea62a = Úsporné vymezení nákladů na pokrytí / ROI

seg-4228311689f8 = Náklady na procento pokrytí + ROI pokrytí na euro nad enginem pro dimenzování konstelace; náklady na družici jsou rozpětí nízká/nominální/vysoká dodané volajícím (žádné vymyšlené ceny)

seg-8ba6ee9acc8a = Dopad nezachycené detekce na integritu (HPL/VPL podle kontextu oproti mezi výstrahy)

seg-f5985399d0d5 = Zobrazí nezachycené spoofingové/rušivé vychýlení na efektivní chybu → oblast Stanford (dostupné/nedostupné/MI/HMI) vůči HAL/VAL specifickým pro kontext (otevřená obloha oproti městu)

seg-37d43b5b918a = Parametrický list modelu chyb CAI s citacemi ({ "13503" })

seg-0b6a901f5ad2 = Rozpětí (nejlepší/nominální/konzervativní) výkonu interferometru se studenými atomy – nestabilita biasu, náhodná procházka rychlosti/úhlu, stabilita škálovacího faktoru, vzorkovací frekvence omezená dobou interrogace, dynamický rozsah nejednoznačnosti proužků – každé dohledatelné k citaci; napájí QuantumNavBudget bez modelování hardwaru

seg-c93f2d3a3167 = Srovnávací test shody integrity časování – klasifikátor epoch podle diagramu integrity Stanford

seg-712d5c35a6a6 = Klasifikace epoch TIB podle diagramu integrity Stanford (nominální / nedostupné / MI / HMI)

seg-573aa0193cb3 = Srovnávací test shody integrity časování – hodnotitel pokrytí integrity

seg-4d86f3c2d8f5 = Hodnocení pokrytí integrity TIB (míry HMI/MI/dostupnosti + výrok o pokrytí převázáním)

seg-372dd0fdb025 = Srovnávací test shody integrity časování – katalog poruch (parametrické generátory)

seg-2604e7cf27d2 = Nabídka poruch TIB (divergence domén, clock-slam, holdover-coast, statické/inkrementální/symetrické/asymetrické zpoždění, přehrání v rámci čerstvosti, selektivní podle cesty, kvorum k-z-N)

seg-90c0eb1e7c14 = Srovnávací test shody integrity časování – výrok o pohlcení nedetekovatelného

seg-f713acf042ff = Výrok TIB o pohlcení nedetekovatelného (symetrické/přehrání musí pohltit PL, nikdy nesmí být hlášeno jako detekované)

seg-8adbbd2cdb74 = Sebepopis zprávy hybridního optického/RF spoje

seg-2a5e48b558e1 = Zpráva hybrid-optical-rf uvádí konfiguraci spoje, při které skutečně běžela (vlnová délka nosné, vysílací a přijímací apertura, vzdálenost, šířka pulzu, doba integrace, účinnosti a ztráty, rozřešené výchozí hodnoty), a nese blok jednotek, který udává jednotku a třídu původu každé veličiny, kterou je pravděpodobné, že článek citoval, včetně stop kovariance předání v metrech čtverečních

seg-0691f3dee8cb = Dostupnost hybridního optického/RF spoje na straně RF

seg-72ccb655caf0 = Zpráva hybrid-optical-rf uvádí dostupnost RF spoje, složenou z veličin, které engine již počítá, nikoli z importované klimatologie, a skládání uvádí jako pojmenované pravidlo: A_rf = I_closure * I_track, kde I_closure je výrok o uzavření jednosměrného rozpočtu spoje CCSDS-401 / DSN-810-005 (linkbudget::link_budget, rezerva Eb/N0 >= { "0" }) při vlastní vzdálenosti scénáře a I_track je výrok smyčky sledování (jamming::lock_status) o C/N0, které vrátil STEJNÝ rozpočet. Každý činitel nese třídu původu svého vstupu až do výstupu a činitele záměrně NEZAHRNUTÉ do součinu – geometrická viditelnost, odepření rušením a klimatologie výpadků RF – jsou pojmenovány s důvodem, nikoli tiše nastaveny na { "1" }. Rozřešená RF větev je zopakována jako vlastní blok rf_link_configuration a spojité veličiny vedle indikátoru (rezerva spoje, rezerva C/N0, uzavřené tvary vzdáleností uzavření a sledování a využití vzdálenosti) jsou inverze vzdálenosti téhož rozpočtu. Zpráva v plném znění, na bloku i v položce jednotek, kam čtenář dojde, uvádí, že tento údaj je OMEZENÝ REZERVOU A GEOMETRIÍ a DETERMINISTICKÝ, zatímco optická dostupnost je OMEZENÁ POČASÍM A KLIMATOLOGIÍ a pravděpodobnostní, takže tyto dva údaje nelze nikdy citovat jako srovnatelnou dvojici procent

seg-22c5df9b6c7c = Srovnání měření vzdálenosti optickým a RF spojem za stejných podmínek

seg-70eb396f40af = Zpráva hybrid-optical-rf vydává poměr optického a RF měření vzdálenosti s JEDNOU konfigurací, při níž byly obě větve vyhodnoceny, neseno ve stejném objektu: stejná jednosměrná dráha, stejná vzdálenost a stejná doba akumulace. Optická větev je fotonově omezené CRLB ToA enginu při jednosměrném počtu fotonů; RF větev je tepelný jitter sledování kódu DLL typu early-late enginu při C/N0, které vrací vlastní rozpočet spoje enginu pro tutéž jednosměrnou vzdálenost. Šířka pásma šumu smyčky je odvozena, nikoli zvolena: B_L = 1/({ "2" }*integration_s) staví RF větev přesně na optickou dobu akumulace a pokud ji volající přepíše tak, že se obě doby průměrování liší, poměr je REFUSED – null, s uvedeným nesouladem a oběma dobami – místo aby se uvedl při dvou provozních bodech. Žádný poměr se netvoří proti VOLENÉMU parametrickému rf_position_sigma_m scénáře a odmítnutí uvádí proč: tento vstup nenese žádnou konfiguraci. Zveřejněný dvoucestný optický hlavní údaj a přesný činitel, který jej převádí na jednosměrnou srovnávací větev, jsou vydány vedle poměru, takže zprávu nelze číst tak, že nese dvě nesouhlasné optické sigmy

seg-3f26f598e013 = Sebepopis zprávy o rozpočtu spoje

seg-b88bf41d6d4c = Zpráva o rozpočtu spoje uvádí každou absolutní konstantu, z níž byla její rezerva vypočtena – frekvenci nosné použitou pro ztrátu volným prostorem, EIRP, ukazatel kvality, souhrnnou ztrátu a Boltzmannův člen – plus požadované G/T, při kterém je rezerva nulová, konstantu spoje (EIRP - ztráty - požadované Eb/N0), která je jedinou kombinací, jakou může publikovaná tabulka rychlosti/zisku kdy určit, a, když volající uvede šumovou teplotu systému, zisk přijímací antény, který tento ukazatel kvality implikuje

seg-a7b192e27cb5 = Tabulka křížení měsíčního času pro každou třídu hodin

seg-cab605dc6ea2 = Jeden běh rozpočtu měsíčního času vydává řádek křížení hodiny a soustavy pro každou třídu hodin proti jedinému sdílenému členu soustavy, takže jedinou proměnnou srovnání jsou hodiny; každý řádek nese křížení získané dvěma způsoby – bisekcí z obecné mocninné křivky časové chyby a algebraickou inverzí z dominantního typu šumu řádku – s relativním rozdílem mezi nimi

seg-18c72a7565d6 = Stopa záchytu v závislosti na výšce a šířce svazku

seg-9c30a0ab5233 = Dvouosý průchod stopou povrchového záchytu váženou vyzařovacím diagramem a omezenou výškou přes výšku vysílače a průměr paraboly, vydaný po jednom řádku pro provozní bod s šířkou svazku v polovičním výkonu, kterou každý průměr implikuje, a záchyt limbu uvedený jako PRÁH – pro každý řádek J/S limbu, jeho rezerva a vysílací výkon, který by jej uzavřel; pro každou mřížku nalezená křížení, nebo výslovné prohlášení, že limbu se nikde na mřížce nedosahuje, s nedostatkem

seg-fc0a64b9a280 = Reprodukovatelnost rozpočtu chyby měsíčního času

seg-5d5970506b9c = Scénář lunar-time-budget zveřejňuje své výstupy ve formě polí jako tabulku v dlouhém tvaru (index mřížky, doba průměrování, člen) vedle zprávy, takže sedm křivek x(tau) pro jednotlivé členy a celkový součet odmocnin ze součtu čtverců jsou výstupem enginu, nikoli něčím, co čtenář znovu sestavuje z popisu metody

seg-e4ec41d0f5e1 = Pozorovatelnost absolutní polohy lunární stanice (defekt datumu)

seg-b3e4160042d2 = Pozorovatelnost společného lunárního řešení z hlediska Fisherovy informace: bez zemských základen leží datum absolutní soustavy v nulovém prostoru HᵀWH (poloha stanice je nepozorovatelná); ≥{ "3" } základny obnoví plnou hodnost a omezí Cramérovu–Raovu chybu stanice, kterou estimátor dosahuje

seg-2ed7181c97dd = Generování rozprostíracích kódů LunaNet AFS (LSIS V1.0)

seg-13ff6c381275 = Kódy Augmented Forward Signal podle LSIS V1.0 ({ "29" }. ledna { "2025" }): primární kód AFS-Q o 10230 čipech generovaný konstrukcí pilotu L1C podle IS-GPS-800 s indexy z IS-GPS-800J (stejných { "210" } přiřazení, jaké tiskne příloha D normy LSIS), Goldovy kódy AFS-I o 2046 čipech generované z g1 = x^{ "11" } + x^{ "2" } + { "1" } a g2 = x^{ "11" } + x^{ "8" } + x^{ "5" } + x^{ "2" } + { "1" } se zpožděním G2 každého PRN převzatým ze souboru přílohy { "3" } normy, čtyři sekundární kódy, terciární kódy o 1500 čipech, přiřazení uzlů z prozatímní tabulky { "11" } a odstupňovaný pilotní kód. Obsah LSIS se za běhu čte z lokální cache ověřené pomocí SHA-256, naplněné z PDF hostovaného NASA, a nikdy se nedistribuuje dál

seg-56c7aeac59c1 = Dekódovatelnost LunaNet AFS v uzavřené smyčce nezávislým přijímačem (LSIS V1.0)

seg-da2d29d437b0 = Záznam AFS z { -brand } zachycený, sledovaný a dekódovaný nezávislým softwarovým přijímačem a porovnaný s vlastními pravdivými značkami záznamu. Dokládá to pouze shodu s normou a konzistenci značek; není to tvrzení o fyzice kanálu, šíření, přijímaném výkonu ani linkových rozpočtech, jejichž hodnoty v záznamu jsou zvolené vstupy

seg-780369fb9a54 = Shoda GPS L1 C/A mezi generátory

seg-ee47b60515f1 = Rozprostírací kódy GPS L1 C/A (sdr::CaCode) a podrámce LNAV 1–3 (gps_lnav: kvantizace polí podle IS-GPS-200 s hodnotou pí podle specifikace, balení ve dvojkovém doplňku, slova TLM a HOW, parita podle tabulky 20-XIV s inverzí D29*/D30*, bity řešící paritu ve slovech { "2" } a { "10" }) porovnané bit po bitu s gps-sdr-sim na jeho přibaleném brdc0010.22n ({ "32" } družic)

seg-bf429c8f00fb = Akvizice IQ GNSS na nezávisle generovaných vzorcích I/Q

seg-9a0c52bfb06e = iq::acq::acquire (FFT paralelní vyhledávání fáze kódu s prahem Marcumovy funkce Q pro kvadratický detektor) s replikou GpsL1Ca, na { "20" } ms vlastního 8bitového výstupu I/Q z gps-sdr-sim dekódovaného dekodérem vzorků iq::io (ci8, { "2.6" } MHz, { "11" } družic, bez šumu): každý PRN { "1" } až { "32" } prohledán ve dvou oknech po { "10" } ms, výsledek porovnán s fází kódu a Dopplerem, které gps-sdr-sim namodulovalo

seg-f40dc3dac990 = Monitory IQ hodnocené v kampaních laboratorního přehrávání: detekce, nezachycení, falešné poplachy a uzavřené tvary míry falešných poplachů

seg-93fb3109728c = iq::campaign::detect a spouštěč kampaní: volitelná tabulka [monitors] spouští monitory IQ na každé buňce v jediném průchodu spouštěče. Monitory výkonu a spektra vidí vzorky po každém řetězci vstupního stupně; monitory C/N0, SQM a zámku vidí aktualizace smyček každého sledovaného kanálu. Každý poplach se hodnotí proti uvedeným událostem: zachycen či nezachycen podle (události, druhu poplachu, kanálu), doba do detekce a falešné poplachy mimo události vztažené k jejich expozici. U každého testu je uvedena jeho míra falešných poplachů v uzavřeném tvaru: výkon na blok (přesný gama chvost), spektrální přebytek na blok (aproximace), špičatost (jednostranná gaussovská), pulzy (binomický strop), SQM na zprůměrovanou aktualizaci (2Q(k) = Q(1/2, k^2/2), nové) a ARL0 CUSUM pro C/N0 (Siegmund). Bez této tabulky zůstávají buňky, klíče a otisky beze změny. Nesyntetizuje se žádný průběh interference

seg-5b7eb7ddb474 = Detekční ROC monitorů IQ z hodnocené kampaně laboratorního přehrávání

seg-57fe85965c9c = iq::campaign::detect (windows, roc) a iq::campaign::report::rocs: každá buňka kampaně s monitory uchovává pro každý druh poplachu a kanál maximum vlastní testové statistiky monitoru přes každé uvedené okno události (pozitivní) a přes dlaždicově rozložená okna roc_window_s mimo události (negativní). Statistikami jsou odchylka výkonu bloku, přebytek PSD, špičatost z, |z| SQM zprůměrované metriky a CUSUM pro C/N0. Zpráva je sdružuje podle druhu do empirické ROC na úrovni oken s jejím AUC a pracovním bodem při nastaveném prahu, zapsané jako roc.json (kshana.campaign-roc/1) a sekce Detection ROC v report.html. Kampaň bez monitorů nezapisuje ani jedno

seg-3a3cfa322f01 = Kalibrace modelů C/N0 a zámku otevřeného přijímače na výsledky kampaní IQ s uvedenou chybou predikce

seg-9affed6218d6 = iq::labfit (campaign, cn0, iqfit, iqreport) a <c1/> na <c2/>, Python <c3/> a nástroj labfit v MCP (pouze složky kampaní uvnitř jeho pracovního adresáře): načte výstupní složku <c4/> podle jejího DIGEST a seskupí hodnocené buňky do jednotek přizpůsobení (signál x návrh smyčky x řetězec vstupního stupně x typ rušiče, nikdy sdružené dohromady). Pro každou jednotku přizpůsobí naměřené C/N0 uvedenému J/S pomocí tvaru spektrální separace. Q_eff není z dat C/N0 identifikovatelné bez nezávislého měření výkonů rušiče a signálu, takže Q je uvedeno, nikdy nepřizpůsobeno (tabulka typů, q události, nebo u neznámého typu nejškodlivější uvedená hodnota, cw Q = { "1" }). Přizpůsobovaným parametrem je identifikovatelný posun delta_eff = delta - { "10" } log10 Q, přičemž korelační pojistka hlásí degeneraci. Biny C/N0 se zámkem pod { "90" } % jsou cenzurovány a vypsány. Prahové J/S je dáno přímo i uzavřeným tvarem; model smyčky sledování a empirický model zámku jsou spřaženy přes model C/N0, s doběhy ztráty a opětovného zachycení zámku. Seedovaný klastrový bootstrap přes záznamy ({ "1000" } replikací) dává percentilové intervaly; { "90" } % predikční intervaly pocházejí z tahů reziduí; hold-outy typu vynechání jednoho záznamu jsou rozděleny na interpolační a extrapolační; předregistrovaná tabulka [validation] je zahašována a každý práh posouzen jako PASS/FAIL. Zpráva kshana.labfit-iq/1 jako JSON, CSV a generovaný Markdown, s blokem jednotek. Pouze syntetické (žádný záznam třetí strany, žádný průběh rušiče). Cesta labfit z logu přijímače je beze změny

seg-9537d301c95e = Kódování GPS LNAV dekódované nezávislou knihovnou přijímače

seg-909415621881 = Podrámce LNAV 1–3 z { -brand } (gps_lnav::encode_subframes) pro { "32" } efemerid brdc0010.22n předaných funkcím decode_word a decode_frame z RTKLIB: parita každého slova, dekódování podrámců s konzistentním vydáním dat a každý dekódovaný parametr proti celému číslu z { -brand } a proti vstupní hodnotě

seg-f66855e35c53 = Kódování navigační zprávy GPS LNAV

seg-8caf8366e2f8 = Podrámce LNAV 1–3 podle IS-GPS-200 (gps_lnav::encode_subframes: kvantizace každého parametru hodin a dráhy zaokrouhlením na nejbližší při měřítkách a hodnotě pí podle specifikace, balení ve dvojkovém doplňku, slova TLM a HOW, parita podle tabulky 20-XIV s inverzí D29*/D30*, bity řešící paritu ve slovech { "2" } a { "10" }), tedy zpráva, kterou vysílá generátor signálu GPS L1 C/A

seg-c5c944357643 = Akvizice a odhad C/N0 na skutečných lunárních IQ datech

seg-f5dcb5e06bf4 = Paralelní vyhledávání fáze kódu (acquisition::pcps_acquire: přenosné FFT, koherentní skládání, nekoherentní akumulace, práh chí-kvadrát pro pravděpodobnost falešného poplachu v celém vyhledávání), zjemnění, otevřenosmyčková promptní korelace s Dopplerem kódu a estimátor C/N0 M2M4, spuštěné na dávkách 4bitových IQ LuGRE L1 načtených přes realdata::ion_sdr

seg-709626569a5c = Akvizice na skutečných lunárních IQ datech proti Dopplerovi predikovanému z dráhy (rozhodnutí podle výkonu vzorků)

seg-784ebd80c425 = acquisition::pcps_acquire s rozhodnutím podle výkonu vzorků na devíti dávkách LuGRE L1 mimo povrch s úrovněmi mid-rise; rozdíly Dopplera mezi zachycenými družicemi porovnané s rozdíly predikovanými z finálních drah ESA a z trajektorie Blue Ghost rekonstruované firmou Firefly

seg-89875d67b253 = Akvizice na skutečných lunárních IQ datech hodnocená podle Dopplera predikovaného z dráhy

seg-956bcfeaf319 = acquisition::pcps_acquire s rozhodnutím podle průměrování buněk (vrchol nad průměrnou buňkou mřížky, odolné vůči pásmově omezenému šumu) na devíti dávkách LuGRE L1 mimo povrch s úrovněmi mid-rise; rozdíly Dopplera mezi zachycenými družicemi porovnané s rozdíly predikovanými z finálních drah ESA a z trajektorie Blue Ghost rekonstruované firmou Firefly

seg-8fa779dd1788 = Akvizice na lunárních IQ datech ze skutečného provozu, držených stranou, proti Dopplerovi predikovanému z dráhy

seg-484868771231 = acquisition::pcps_acquire (rozhodnutí podle průměrování buněk, pravděpodobnost falešného poplachu { "1e-7" }) s refine_doppler_coherent na dávkách LuGRE L1 zaznamenaných na lunárním povrchu (I v horní tetrádě, úrovně mid-rise); rozdíly Dopplera mezi zachycenými družicemi proti rozdílům predikovaným z finálních drah ESA a z kernelu místa přistání Firefly

seg-10af60b488b9 = Diferenciální referenční stanice třídy NovaMoon: zrušení společného módu + reziduum rostoucí se základnou + ochranné úrovně DGNSS

seg-c04a3591074c = Export pro lunární interoperabilitu

seg-91f4a066b3c0 = Export lunární soustavy + času + efemerid ve shodě s LunaNet/IOAG (CCSDS OEM + KIF) s konformitou při zpětném převodu

seg-8ab65cbefb75 = Bodování ve shodě s rámci odolnosti PNT

seg-c48198f31d63 = Dílčí skóre po jednotlivých dimenzích nad vlastními sedmi kategoriemi odolnosti { -brand } (nikoli pojmy DHS), funkcemi RDRR z RethinkPNT a kritérii Yang, každé označené jako modelované se svým hnacím faktorem; předběžná úroveň RPCF s bránou omezené degradace. Sebehodnocení odvozené ze simulace, nikdy certifikace.

seg-d7bdb6fe186e = Studie nestability rozhodnutí podle skóre odolnosti

seg-5fcf18a68bb1 = Kvantifikuje, jak jediné složené skóre / úroveň RPCF přeuspořádává architektury při obhajitelném simplexu vah a souboru hrozeb (míra přeskoku top-1, rozptyl Kendallova tau, míra přeskoku úrovně, rozsahy pořadí); analýzy deklarovaného vs. změřeného a kolapsu diverzity.

seg-1bf03544a010 = Reprezentativnost demonstrace a mezery k letu

seg-db24d16d38c9 = Registr poctivosti pro každý výsledek, který kvalifikuje výstup demonstrace: jeho vnější kotvy, modelované předpoklady, mezery k letu a reprezentativní pásmo TRL, s vynucenými invarianty (ověřeno vyžaduje vnější kotvu; modelované vyžaduje mezeru a nemůže tvrdit víc než TRL { "4" }).

seg-52ab936eb5f5 = Důkazy pro srovnání kvantového a klasického řešení (společný tvar)

seg-a6679ed5bed7 = Jediný reprodukovatelný objekt TradeEvidence (pevný rámec: scénář+seed+engine; společné hodnoty kvantového a klasického řešení pro každý ukazatel kvality s přínosem se správnou polaritou, volitelný { "95" }% IS, označení ověřeno/modelováno) nesoucí záznam o reprezentativnosti, takže každá kvantová PNT vertikála hlásí srovnání stejným poctivým způsobem.

seg-20fee61b3107 = Knihovna chybových modelů kvantových zařízení

seg-e42eabe9bc2a = Karty zařízení (optické/z uvězněných iontů/rtuťové iontové + klasické hodiny převzaté z holdover/clock_state; interferometr se studenými atomy; klasické + provázané/jednofotonové linky přenosu času), každá nese záznam o reprezentativnosti; provázaná linka přidává model přesnosti časování omezené šumem počtu fotonů (~jitter/sqrt(R*tau), penalizace temných impulzů, systematická podlaha).

seg-86d71fd89f26 = Důvěryhodné kvantové časování (přenos času + zabezpečené šíření + anomálie)

seg-d2a3d37825ef = Kompletní řetězec přenosu času, kvantový vs. klasický (výběh hodin + přesnost linky v kvadratuře), převzatá ochranná úroveň času, ukazatel bezpečnosti proti útoku zpožděním/přehráním (1-P_md) a pravděpodobnost detekce anomálie hodin + latence CUSUM, vydané jako poctivé TradeEvidence se záznamem o reprezentativnosti.

seg-eaf341ff4522 = Kvantová navigace bez GNSS

seg-908a44a9f7c7 = Kvantová (interferometr se studenými atomy) vs. klasická inerciální navigace navigační třídy při výpadku GNSS: růst chyby polohy, holdover do prahu polohy a srovnání kvantového a klasického řešení jako poctivé TradeEvidence; poctivá poznámka o pozorovatelnosti (bias je bez fixu nepozorovatelný, takže chyba roste).

seg-914132833f5a = Detekce poruch/anomálií pro kvantové systémy PNT

seg-f20392820b9d = Označený katalog kvantových poruch (skok frekvence/drift/ztráta zámku hodin; skok biasu/výpadek senzoru), ROC AUC detekční statistiky s bootstrapovým IS a minimální detekovatelná porucha při pevné míře falešných poplachů; monitor podporovaný kvantovými hodinami detekuje menší poruchy než klasický, vydáno jako poctivé TradeEvidence.

seg-d31be81dfd8f = Pasivní geolokace zdroje signálu metodou TDOA/FDOA

seg-aa870cee16f6 = Lokalizace zdroje signálu (rušičky/spoofera nebo příležitostného zdroje pro reverzní PNT) z rozdílů dob příchodu napříč sítí přijímačů – průsečík hyperboloidů τᵢ=(Rᵢ−R₀)/c řešený Gaussovou–Newtonovou metodou nejmenších čtverců – a po přidání rozdílů frekvencí příchodu (rozdílů rychlostí změny vzdálenosti) s pohybujícími se přijímači společné určení polohy a rychlosti; s dolní Cramérovou–Raovou mezí kovariance polohy z geometrie měření

seg-5bd3882531b6 = Konvektivní zahřívání v bodě stagnace při vstupu (Sutton–Graves) na vstupu se 3 stupni volnosti

seg-4f97036ed72f = Konvektivní tepelný tok v bodě stagnace q = k sqrt(rho/R_n) V^{ "3" } s konstantami Sutton–Graves pro zemský vzduch a atmosféru Marsu (NASA TR R-376, { "1971" }), jeho špička a integrované tepelné zatížení podél vstupu se 3 stupni volnosti, balistického nebo nosného při konstantním náklonu, na Zemi nebo na Marsu.

seg-1b96577665fc = Radiometrie elektrooptického zobrazovače, MTF, relativní odezva hrany a NIIRS podle GIQE { "4" }

seg-38902593e841 = Rozpočet poměru signálu k šumu nadirového zobrazovače (lambertovská zář scény, kamerová rovnice, šum počtu fotonů, temný, čtecí a kvantizační), systémová MTF na Nyquistově frekvenci jako součin difrakce neclonicí apertury, apertury detektoru, lineárního rozmazání a gaussovského jitteru, odezva hrany a relativní odezva hrany integrované z této MTF, Q = lambda F / p a NIIRS podle GIQE verze { "4" } bez kompenzace MTF. Spustitelné jako druh scénáře <c1/>.

seg-07ca77a67207 = Ztráty gravitační, odporové, řídicí a protitlakové při výstupu nosné rakety

seg-7a1802cf2c80 = Rovinný gravitační výstup vícestupňového nosiče nad neotáčející se kulovou Zemí přes standardní atmosféru USA { "1976" } (hustota a tlak), s kopem sklonu, tahem sníženým protitlakem v trysce, vyhořením stupňů přesně na hranicích kroků a ztrátami gravitační, odporovou, řídicí a protitlakovou integrovanými vedle stavu. Spustitelné jako druh scénáře <c1/>.

seg-55e8345def8b = Dvoucestná rovnice TWSTFT, rozpočet nejistoty a stabilita linky s flicker šumem a denní nereciprocitou

seg-5ca5226c24ec = Dvoucestná rovnice TWSTFT řešená pro T_A - T_B se zpožděními vysílání a příjmu stanic, asymetrií ionosféry nahoru/dolů v pásmu Ku, rozdílem zpoždění transpondéru a členy Sagnac, proti jejímu přesnému přímému modelu; kvadraturní rozpočet nejistoty s TDEV linky jako členem typu A; dvoucestná řada s bílým a flicker fázovým šumem (Kasdin–Walter), denní nereciprocitou a konstantním residuem reciprocity; a rychlost, reziduální RMS, TDEV a ADEV dodaných řad hodin stanic ve formátu Circular T, MJD-CSV nebo IGS RINEX. Spustitelné jako druh scénáře <c1/>.

seg-2f9be02c92bc = Numerika optické atmosféry na šikmé dráze: Rytovův rozptyl, scintilace, pravděpodobnost úniku gamma-gamma, průměrování přes aperturu, optická tloušťka oblaků a čistého vzduchu

seg-032cf76c2ec0 = Hufnagelovo–Valleyovo Cn2 integrované podél šikmé dráhy pro Rytovův rozptyl pro rovinnou a kulovou vlnu (uplink a downlink), index scintilace podle Andrewse–Phillipse a parametry gamma-gamma, pravděpodobnost úniku gamma-gamma a rezerva proti úniku, faktor průměrování přes aperturu při slabé turbulenci, optická tloušťka oblaku sloupce kapalné vody a optická tloušťka čistého vzduchu z Kimovy dohlednosti plus Rayleighova rozptylu, které nahrazují paušální atmosférickou ztrátu rozpočtu optické linky, je-li atmosféra zadána. Spustitelné uvnitř druhu scénáře <c1/>.

seg-a2faab92e760 = Dostupnost optických pozemních stanovišť řízená počasím a diverzita stanovišť korelovaná se vzdáleností

seg-7f4e4e763d62 = Dostupnost optické linky proti uvedené rezervě linky z lognormálního klimatu kapalné vody v oblacích (množství podle ITU-R P.840, extinkce v geometrické optice) a nezávislého úniku turbulencí gamma-gamma, rezerva linky potřebná pro cílové dostupnosti a strop, který žádná rezerva nepřekoná, lognormální doby výpadků, scénáře „co kdyby“ pro zlepšující techniky a jednofaktorová gaussovská copula dostupnosti sítě, jejíž párová korelace je exp(-vzdálenost/korelační délka). Spustitelné jako druh scénáře <c1/>.

seg-043ece801e72 = Kontinuita časování a měření vzdálenosti při optických výpadcích

seg-bb9cb3fe4180 = Rozdělení dob výpadků optického stanoviště spřažené s rozptylem výběhu v uzavřeném tvaru z modelu holdoveru hodin: chyba časování a měření vzdálenosti při uvedených kvantilech výpadků, holdover do prahu časování, podíl výpadků a doby výpadků uvnitř něj a dostupnost časování A + U E[min(D, T_h)]/E[D], pro třídy klasických a kvantových hodin. Spustitelné uvnitř druhu scénáře <c1/>.

seg-b119df65d2a7 = Rezerva optické linky v čase: jedna seedovaná realizace počasí stanoviště

seg-06125f3cae90 = Dobrovolná tabulka <c1/> (trvání, krok, seed) způsobí, že druh <c2/> zapisuje navíc pro každé stanoviště jednu seedovanou realizaci uvedeného modelu stanoviště v čase: epizody oblačnosti (jasné úseky exponenciální, oblačné výpadky lognormální s uvedeným průměrem a rozptylem, podíl času v oblačnosti nastavený na uvedenou pravděpodobnost oblačnosti), jeden lognormální sloupec kapalné vody na epizodu oblačnosti, jeden vzorek scintilace gamma-gamma na krok a z nich rezervu linky, úniky způsobené oblačností a scintilací a příznak spojení nahoře, s realizovanou dostupností, podílem oblačnosti, počtem výpadků a nejdelším výpadkem. Bez této tabulky je výsledkem dokument { "0.37" }. Tahy procházejí přenosnými cestami rozdělení a matematiky, takže nativní běh a wasm32 dávají stejné bajty.

seg-58cbf576c959 = Čtečka souborů Orbit Data File TRK-2-18 a model rampovaného 2cestného Dopplera na Marsu

seg-d1055650a77f = Čtečka souborů DSN Orbit Data File (TRK-2-18): skupiny záznamů po 36 bajtech (štítek souboru, identifikátor, orbitální data, rampy jednotlivých stanic, posuny hodin, souhrn, konec souboru) a v každém záznamu orbitálních dat časová značka od { "1950" }, zpoždění downlinku a uplinku, pozorovaná veličina, stanice, typ dat, pásma, platnost, kanál, kosmická loď, 46bitová referenční frekvence a čas komprese; časy začátku a konce ramp, rychlosti a počáteční frekvence. Nad ní model rampovaného 2cestného Dopplera v pásmu X (integrované rampy uplinku, doba oběhu světla tam a zpět se Shapirovým členem a troposférou, stanice DSN přes řetězec CIO podle IAU 2006/2000A a EOP IERS, čas stanice) a dávkové určování oběžné dráhy družice na orbitě Marsu (pole GMM-3, třetí tělesa, SRP, odpor).

seg-455dc946c965 = Odhad orientace multiplikativním EKF z gyroskopu a hvězdného sledovače

seg-553d043438b4 = Multiplikativní EKF podle Leffertse, Markleyho a Shustera: stavy chyby orientace v soustavě tělesa a biasu gyroskopu, propagace s úhlovou rychlostí z gyroskopu zmenšenou o odhad biasu a s Farrenkopfovým diskrétním procesním šumem (náhodná procházka úhlu a rychlosti), aktualizace hvězdným sledovačem s reziduem { "2" } vec(q^-1 q_st) v Josephově tvaru a multiplikativní reset; diskrétní Farrenkopfův simulátor gyroskopu a hvězdného sledovače. Druh <c1/> může uzavřít regulační smyčku na svém odhadu.

seg-a971ff07592a = Pracovní cyklus apertury mezi navigací a komunikací

seg-5b0ba97379bf = Jeden běh přijme plán kontaktů (seznam oken aos_s/los_s, z nichž každé žádá o aperturu pro navigaci nebo komunikaci – stejná slovní zásoba oken, jakou vydává <c1/>, převedená pomocí <c2/>), počet apertur a výslovnou politiku arbitráže a vrátí navigační pracovní cyklus, komunikační pracovní cyklus, cyklus nečinnosti a výpadek v jednotlivých relacích. Politika je vstup s dokumentovanou výchozí hodnotou (<c3/>; také <c4/> a nepreemptivní <c5/>) a zpráva nese vyřešenou politiku, její úplnou definici a definice pracovního cyklu a výpadku, protože údaj o pracovním cyklu uvedený bez pravidla arbitráže není reprodukovatelný. Rozvrh je přesné rozmítání intervalů přes hranice oken, takže okno, které končí přesně tam, kde začíná další, nikdy nesoupeří, a aperturní sekundy navigace, komunikace i nečinnosti se v tomto jediném rozmítání akumulují nezávisle. Spustitelné jako druh scénáře <c6/>

seg-43cd7aa7ab53 = Rušení RF při lunární povrchové navigaci (J/S pro jednotlivé družice)

seg-e0566f37ad8f = Lunární poměr rušení k signálu, efektivní C/N₀ a ztráta zámku pro selenografického uživatele na povrchu při rušičce na lunárním povrchu (nebo zvýšené), nad ilustrativní veřejně zdrojovou konstelací třídy Moonlight/LCNS. Skládá otevřený řetězec rušení (j_over_s_db, effective_cn0_dbhz, rx_antenna_gain_db, lock_status, q_factor, nominal_cn0_dbhz, free_space_path_loss_db) s otevřenou geometrií lunární oblohy (lunar_service::LunarConstellation + topocentric, lunar::selenographic_to_mcmf); nic z geometrie ani radiometrie se neodvozuje znovu. Na rozdíl od zemského druhu <c1/> není signálová větev pevný přijímaný výkon: izotropní přijímaný výkon každé družice je její vlastní EIRP v rozpočtu linky − FSPL(šikmá vzdálenost), takže J/S se mění družici od družice s lunární vzdáleností a elevací. Vydává JEDEN ŘÁDEK NA KAŽDÝ VIDITELNÝ SPOJ (epocha, družice) jako JSON i jako artefakt *.table.csv, s oběma přijímanými výkony, jejichž rozdílem je J/S, vytištěnými vedle; souhrnné ukazatele kvality leží vedle této tabulky, nikdy místo ní. Spustitelné jako druh scénáře <c2/>

seg-4c116e25c5c5 = Lunární kontura odepření s pásmem nejistoty z naměřeného rozptylu C/N₀

seg-77828c25f3ab = Zpráva <c1/> už nestaví svou konturu odepření na jediném skaláru. Vydává úplné naměřené rozdělení C/N₀ požadovaného signálu přes tabulku pro jednotlivé družice – n, min, p05, p25, medián, p75, p95, max, průměr, výběrová směrodatná odchylka a vlastní asymetrie výběru (p95 − medián) − (medián − p05) – vedle řádků pro jednotlivé spoje, které zůstávají beze změny. Kontura je pak uvedena při každé z těchto pořádkových statistik podle OBOU kritérií odepření, která engine zná, nikdy jednoho místo druhého: stávající kritérium poměru výkonů (J/S = { "30" } dB, stejný práh, jaký používají attack_surface a tracking_loop, a kritérium za sloupcem <c2/> vydané tabulky lunárního rušení linek), a kritérium ztráty zámku (efektivní C/N₀ klesající na tracking_threshold_dbhz), což je kritérium, jímž je hodnocen vlastní sloupec links[].status této zprávy. Každý bod kontury je dán na obou osách roviny odepření – EIRP rušičky potřebné při vzdálenosti scénáře a vzdálenost odepření při EIRP scénáře – takže pásmo je interval na týchž osách, na nichž se kreslí graf kontury. Okraje pásma JSOU contour(p05) a contour(p95): stejné zobrazení v uzavřeném tvaru aplikované na vlastní kvantily výběru, nikoli sigma přizpůsobená výběru a nikoli medián ± k·stdev, a zpráva to uvádí v řetězci band_definition vedle čísel. stdev se vydává kvůli kontinuitě a nic ho nepoužívá. Kvantil, jehož C/N₀ je už na prahu sledování nebo pod ním, nemá žádné konečné odepírající J/S; tyto sloupce se vydávají jako null s započteným důvodem, nikoli jako nekonečno nebo omezený poloměr

seg-2d3944107ba0 = Detekční síla monitoru integrity napříč modalitami

seg-38bc7c0bfe57 = Zpráva hybrid-optical-rf uvádí, co monitor chí-kvadrát napříč modalitami skutečně dokáže ZACHYTIT, a nejen že projde případem bez poruchy: minimální detekovatelný bias na každou monitorovanou osu (východ, sever, nahoru, hodiny) při uvedených pravděpodobnostech falešného poplachu a nezachycené události ve scénáři, křivka detekční síly na obou stranách, násobek biasu bez šumu, při němž realizovaná statistika poprvé překročí práh, a doba do detekce pro rampu biasu při uvedené rychlosti. Poruchy se také vkládají přes skutečný monitor a statistika, kterou vrátí, se uvádí vedle analytické predikce

seg-90307f07e0ef = Režimy řešení referenční stanice na Měsíci: výšové omezení, tři družice, okno statického uživatele

seg-366c7ad03fb2 = Volitelná sekce [solution] druhu lunar-station-coverage (LRS-06): řádek výškového pseudoměření up . dx = e_h se stanovenou 1-sigma, vážený proti řádkům vzdáleností; minimum tří družic je povoleno jen s ním; a vážené řešení metodou nejmenších čtverců přes posledních window_epochs epoch se sdílenou statickou polohou a jedněmi hodinami na epochu (odpověď filtru pro statickou polohu bez procesního šumu nad týmiž daty; chyby jednotlivých epoch se považují za nezávislé). Pokud sekce chybí, zůstává řešení snímku i každý dokument beze změny. Dodatek k porovnání s publikovanými tvrzeními, jehož styl řešení odpovídá zdrojům, předregistrovaný samostatně

seg-611ba369ed00 = Přesnost a pokrytí referenční stanice na Měsíci proti publikovaným tvrzením

seg-4fe4f1cffa2b = Druh lunar-station-coverage spuštěný za veřejných předpokladů publikovaného materiálu o lunární diferenční referenční stanici (čtyři navigační družice na zmrazených eliptických drahách s periodou { "24" } h, SISE { "10" } m ({ "95" } %), kódový šum { "0.30" } m, latence korekcí { "1" } s a { "600" } s, zaměření stanice s přesností pod decimetr, publikované příkladové místo stanice, jihopolární kružnice o poloměru { "300" } km a { "600" } km) a vyhodnocený proti číselným tvrzením zdrojů podle šesti jednostranných prahů předregistrovaných před během: pokrytí celého jižního pólu při p95 pod metr (K1, K2), opravené p95 pod metr a na úrovni decimetrů (K3, K4), pod metr zachované při latenci { "600" } s (K5) a přesnost zachovaná od základny { "10" } km do { "500" } km (K6)

seg-7bfcb5c6a985 = ARAIM s hypotézami současných poruch více družic

seg-15043111e437 = araim_reference::add_v42_subset_plan: pravidlo ADD v4.2 pro určení podmnožin (P_THRES, FC_THRES, monitorované podmnožiny od nejméně odebraných) zobecněné z dvojic na současné kombinace až max_order událostí družic a konstelací, s přesnou apriorní pravděpodobností P_no fault prod q_e; add_v42_protection_levels_to_order nad ním spouští cestu ochranných úrovní ADD v4.2 (řád { "2" } je přesně stávající cesta). raim::araim_subset_raim (nepovinné zapnutí): pokročilý RAIM nad touto množinou hypotéz, kde každá monitorovaná podmnožina je jeden režim (p_fault, T, b, sigma) v součtu rizika integrity, nepozorovatelné podmnožiny jsou přesunuty do nemonitorovaného rizika, rozpočet je škálován přidělením nemonitorovaného rizika podle ADD a při detekci poruchy je hlášena podmnožina s největším normalizovaným oddělením. Apriorní pravděpodobnosti vyžadující hlubší podmnožiny než max_order se odmítají, nikdy neořezávají

seg-48ca01332f8f = RAIM vedle ukazatelů kvality holdoveru hodin

seg-890f1006a75d = Volitelná sekce [integrity] druhu clock (clock_integrity::run): ze stanoveného místa a předvoleb konstelace (geometry::sky_geometry), v každé epoše integrity, dokud časová osa GNSS není odepřena, snímkový RAIM (raim::snapshot_raim: paritní test chí-kvadrát, ochranné úrovně podle sklonu) na družicích nad maskou se seedovanými Gaussovými rezidui stanovené sigmy a volitelným stanoveným biasem; samostatný blok integrity_fom s verdikty po epochách, ochrannými úrovněmi a dostupností. Odepřené epochy se hlásí jako nedostupné, nikdy se neextrapolují; ukazatele kvality holdoveru zůstávají beze změny a bez sekce je výstup bajt po bajtu shodný

seg-9cbb4ee7588a = Prostorová, zašuměná, vícerodinná pozorovatelnost cislunárního oblouku podle délky

seg-5ebd771deef8 = Práh pozorovatelnosti cislunárního oblouku podle délky v PROSTOROVÉM šestistavovém CR3BP namísto rovinného čtyřstavového, napříč rodinami DRO, halo kolem L2 a téměř přímočarého halo kolem L2, kde měřicí šum vstupuje do Gramiánu a hlásí se DVĚ kritéria, protože neexistuje žádné jediné poctivé: publikované kritérium hodnosti, které je prokazatelně invariantní vůči homoskedastické měřicí sigmě (vybělení násobí matici pozorovatelnosti skalárem, takže relativní spektrum singulárních hodnot, a tedy hodnost, defekt i podmíněnost zůstávají beze změny), a kritérium odhadnutelnosti — první oblouk, při němž formální 1σ nejistota polohy počátečního stavu hlavní družice klesne pod stanovenou mez — které je tím, jež se se šumem mění. Každý práh nese závorku mřížky epoch, v níž leží; nedosažené kritérium je null s důvodem. Rovinný režim zůstává výchozí a rodiny mimo rovinu se v něm odmítají, nikoli zplošťují do stavu, který je nedokáže reprezentovat

seg-e250321394bc = Chyba predikce orientace Země v operativním stylu, změřená predikovaná proti finální

seg-0e443d241460 = Fit biasu a rychlosti metodou nejmenších čtverců přes klouzavé okno plus hlavní periodické členy — roční, půlroční a dva hlavní zonální slapy pro UT1; Chandlerův, roční a půlroční pro pól — extrapolovaný s posledním reziduem v okně přenášeným dopředu: třída, kterou používá IERS Bulletin A, namísto prediktoru persistence, na němž stál publikovaný horizont. Hodnoceno jediným poctivým způsobem: předpověď pro T+h sestavená z rychlých řádků Bulletinu A v čase T nebo dříve, změřená proti POZDĚJI VYDANÉMU finálnímu Bulletinu B v čase T+h, přičemž persistence je vedle toho hodnocena na identické množině epoch proti identickým finálním hodnotám. Cílová epocha bez publikované finální hodnoty se vyřadí, nikoli znovu hodnotí proti rychlému sloupci; periodický člen, který okno nedokáže omezit, se hlásí jako zamítnutý spolu s počtem cyklů, které skutečně pokrývá; neúplné okno se odmítá, nikoli tiše zkracuje

seg-f4efd94dd746 = Datum lunární soustavy z pozorovací kampaně

# c1: lunar-frame-campaign
seg-a6972eb89d7d = Sedmiparametrové Helmertovo datum odvozené ze SIMULOVANÉ POZOROVACÍ KAMPANĚ namísto obnovy ze vložené transformace. Pozemní stanice pozorují zdrojovaný katalog majáků na povrchu Měsíce podle explicitního rozvrhu; parciální derivace zpoždění lunárního VLBI se akumulují do Fisherovy informační matice souřadnic majáků a prostřednictvím Helmertova návrhu A = [I₃ | [p]ₓ | p] se převádějí na H = AᵀM_bA, takže hlášená přesnost datumu je funkcí pozorovacího programu — přesně lineární v sigmě zpoždění a monotónní v oblouku přes librace, kterou zpráva MĚŘÍ. Defekt datumu je předmětem, nikoli poznámkou pod čarou: hodnost, defekt, číslo podmíněnosti, spektrum, nepozorovatelné směry v sedmiparametrové bázi, nejslabší směr i při plné hodnosti a podíl každého parametru na něm se vydávají při každém běhu a každý parametr, který kampaň neomezuje, je publikován jako NULL se stavem. Korelace chyb majáků je MĚŘENA, nikoli předpokládána — přesně nulová při pevných stanicích a vytištěná i s cenou, když se stanice odhadují. Spustitelné jako druh scénáře <c1/>

seg-ca481f2d8f9e = Potvrzení prahu délky cislunárního oblouku nezávislým odhadovačem

# c1: cislunar-arc-recovery
seg-3d5fbf896209 = Dávkový odhadovač metodou nejmenších čtverců, který OBNOVUJE počáteční stav hlavní družice ze simulovaných mezidružicových měření přes rostoucí prefixy téže mřížky epoch, jakou používá tabulka hodnosti proti oblouku, přičemž parciální derivace měření jsou brány jako centrální konečné diference složeného dopředného modelu. Nespotřebovává nic z aparátu, jímž byl práh změřen — žádný analytický řádek jakobiánu, žádnou variační matici přechodu stavu, žádný rozklad na singulární hodnoty ani vlastní čísla, žádnou toleranci hodnosti, žádný filtr druhé odmocniny informační matice — a sdílí jen dynamiku, počáteční podmínky, skalární pozorovatelnou veličinu a mřížku epoch, každé z nich pojmenované ve vydaném dokumentu. Dvě kritéria, obě proměřená: obnova bez šumu (analogie hodnosti) a odhadnutelnost metodou Monte Carlo (analogie odhadnutelnosti, měřená proti známé pravdě, nikoli predikovaná z kovariance). Spustitelné jako druh scénáře <c1/>

seg-f839285852d9 = Lunární servisní objem ze skutečné, získané geometrie konstelace

# c1: ephemeris_path
seg-c3059fcced49 = Přijímá tabelovanou efemeridu se středem v Měsíci (vyhodnocení jádra SPK/BSP) nebo publikovanou definici konstelace za <c1/>, spouští proti ní totožné prohledání pokrytí / DOP / ochranné úrovně a vydává z ní plynoucí požadavek na σ_URE VEDLE nezměněných ilustrativních keplerovských a perturbovaných výsledků, přičemž rozdíl je samostatnou pojmenovanou veličinou. Každý údaj nese třídu původu, která odlišuje odvozené z jádra od odvozeného z publikovaných elementů a od vypočteného z modelu, takže je nelze v následné citaci nikdy zaměnit

seg-36a6cfaf5afa = Jednotka a původ deklarované pro každou hlášenou veličinu

# c1: inherits-scenario-label
# c2: depends-on-input
seg-12460501e82b = Strojově čitelné schéma udávající jednotku, třídu původu a definici každého číselného pole každé zprávy scénáře, plus jediná globální brána, která spouští každý registrovaný druh scénáře a selže, pokud vydanému číselnému poli chybí kterýkoli z nich. Slovník původu je uzavřený a každá třída nese úroveň důkazů, přičemž dvě třídy jsou záměrně mapovány na <c1/> a <c2/>, nikoli že by jim byla přiřazena úroveň, kterou třída neurčuje

seg-c815cb90dcde = Geodézie referenční stanice na Měsíci: přidaný retroreflektor a maják VLBI proti pětipolovému datumu

seg-103cf21173ac = Volitelné vstupy extra_reflectors a extra_beacons ve scénáři lunar-llr-datum přidávají blok station_geodesy: Helmertovu informaci pěti polí z archivovaného výřezu lunárního laserového měření vzdáleností plus informaci, kterou na sedmiparametrové datum vnáší přidaný retroreflektor (měřený v archivovaných epochách normálních bodů, v nichž je měřicí stanice nad svým horizontem, každý s archivovanou váhou onoho normálního bodu) a přidaný maják VLBI (pozorovaný sítí a rozvrhem lunar-frame-campaign při pevných pozemních stanicích, přes parciální derivace zpoždění lunar-vlbi-fim) na stanovených místech; datum je znovu vyřešeno, s 1-sigma každého Helmertova parametru před a po, jejich poměrem, normami před a po a extrémními vlastními čísly Fisherova rozdílu. Pokud chybí nebo je prázdné, zpráva zůstává beze změny

seg-44f582b17fa9 = Integrita brány — zelená, která znamená, co říká

# c1: cargo test --all
seg-43fbcfbe990c = Tři strukturální ochrany nad samotným ověřovacím procesem, z nichž každá uzavírá třídu vad, které se dostaly do kanonické brány jako občasná nebo falešná červená. ({ "1" }) Každá sestavená cesta k dočasnému souboru ve zdrojích Rustu musí nést složku jedinečnou pro každé volání; id procesu se odmítá, protože cargo spouští knihovní testy jako paralelní vlákna JEDNOHO procesu a pid mají všechna společné. ({ "2" }) Každý pin bajt po bajtu nebo hashe musí vedle sebe nebo v hlavičce svého modulu deklarovat, co pokrývá a co záměrně vylučuje — aby při průřezové změně bylo na první pohled vidět, které piny jsou v rozsahu a které se tiše staly detektory změn v celém repozitáři. ({ "3" }) Zelenou lze tvrdit jen z ÚPLNÉ sady: scripts/gate.sh spouští <c1/>, zachytí skutečný návratový kód bez roury v cestě a zapíše potvrzenku s uvedením commitu, počtu integračních binárek, počtu testů a doby trvání; kontrola před pushem odmítne push, jehož commit nejmenuje žádná platná potvrzenka, na čistém stromě. Opakovatelnost se vzorkuje samostatně skriptem scripts/check-repeatability.sh, který spustí knihovní sadu N-krát a selže, pokud se množina prošlých testů liší.

seg-b7cd952ff133 = Složená PL časování — přečkání holdoveru se semínkem P0

seg-135df1e0e68a = PL(τ)=max(TPL_handover,HPL(τ)); zdola polospojitá PL({ "0" }+)≥PL({ "0" }−); K(IR/2) klouzavé maximum; exponenty fáze τ/τ³/τ⁵

seg-096b6cdfe2dc = Složená PL časování — obálka LIL téměř jistě (nemožnost + konzistence)

seg-1671add2210d = Žádný konečný holdover v nejhorším případě (Brownovo supremum diverguje); HPL s přidělením IR konzistentní s obálkou Hartmanovou-Wintnerovou pro IR→{ "0" }

seg-5a27c9f0a67d = Nadhraniční mez integrity pro heterogenní bias dohledatelnosti UTC(k)

seg-fd09ab2adbf6 = Nadhraniční mez biasu pro každý zdroj b = (U/k_cov)·Phi^-1(1-tail/2) + stárnutí, která nafukuje publikovanou rozšířenou nejistotu typu B na přidělený chvost integrity; navazuje na tpl_scalar jako bias_s

seg-d75b900ad25f = Korelovaná kovariance mezi biasy dohledatelnosti (přidělení nebezpečné při společném módu)

seg-0641f6d38c23 = Křížová kovariance biasů N×N s mimodiagonálními prvky rho·b_i·b_j pro zdroje sdílející realizátora UTC(k); DOKÁZÁNO correlated_fused_bias >= independent_fused_bias (naivní nezávislé přidělení podhodnocuje sloučený bias -> optimistické -> nebezpečné)

seg-1a3bb032960f = Statistika konzistence společného módu (porucha sdílené reference slepá vůči separaci)

seg-1b03f522b8fc = Skórová statistika ({ "1" }^T Omega^-1 r)^2/({ "1" }^T Omega^-1 { "1" }) ~ chi^2_1 pro posun společného módu, který separace řešení (kontrasty ortogonální k { "1" }) nevidí; posun společného módu ji zvětšuje, zatímco párové separace zůstávají ploché

seg-3359eee713a5 = Klasifikace nulového prostoru lunárního datumu (aditivita hodnosti LLR + zvednutí defektu librací)

seg-3fd19007ea67 = Informace o lunárním datumu z více technik (LLR + lunární VLBI + vzdálenost orbiteru)

seg-ab96cfc8d48c = Geometrický substrát lunárního datumu LLR (reflektory v hlavních osách, pozemní stanice, analytické parciální derivace vzdálenosti)

seg-63a8571f8eb0 = Degenerace vzdálenosti vůči offsetu hodin při jednosměrném lunárním měření vzdálenosti a návrhový zákon geometrické diverzity

seg-cdd70f56051a = Degenerace radiální vzdálenosti vůči offsetu hodin přijímače na uzel je přesná při { "1" } m na { "3.336" } ns (jedna ku c). Schurova doplňková marginála { "{" }scale, offset{ "}" } (coupled_marginal_fisher) ukazuje, že v geometricky diverzní síti dvoucestné měření vzdálenosti zvedá marginálu zhruba o stejný činitel jako stejný počet dodatečných jednosměrných dat, zatímco v idealizovaném režimu jediného uzlu je dvoucestný zdvih o řády větší. Z toho plynoucí návrhový zákon: geometrická diverzita, nikoli dvoucestné měření vzdálenosti jako takové, je to, co při jednosměrném měření vzdálenosti odděluje měřítko lunární soustavy od offsetu časové škály; dvoucestná nebo externí časová vazba je nutná jen v režimu nízké diverzity nebo jediného uživatele.

seg-2c074d6260ba = Reprezentativní nabídka vícetechnikových měření a aditivní Fisherovo kombinační pravidlo

seg-beefac5c1b13 = MeasurementBlock drží jednu kandidátní měřicí kampaň jako příspěvek Fisherovy informace 7x7 plus skalární relativní náklady; block_from_rows jej sestaví ze surových řádků Jakobiánu datumu, takže každý blok je předpodmíněn stejně přes lunar_identifiability::assemble_multi_info; combine sčítá informaci vybrané podmnožiny, což je správné pravidlo, protože Fisherova informace je aditivní napříč nezávislými měřeními; representative_lunar_menu dodává deterministickou nabídku čtyř bloků (LLR, příčný limbový maják VLBI, orbiter na přivrácené straně a orbiter na odvrácené straně). Optimalizátor návrhu s rozpočtovým omezením, který tuto nabídku spotřebovává, není součástí tohoto crate.

seg-2d3347bcb15e = Tolerance konzistence napříč poskytovateli pro uživatele s více poskytovateli

seg-9decf2cb6b0c = consistency_tolerance: obrací rozpočet polohy uživatele na požadavek shody Helmerta mezi poskytovateli pro každý parametr (počátek/měřítko/rotace) při referenčním rameni páky, volitelně nafouknutý CRLB realizace jediného poskytovatele P1

seg-5450d921dfc9 = Rozpočet chyb lunární interoperability více poskytovatelů a návrhový zákon soustava vs. efemerida

seg-e1e30f5c17a6 = interop_budget: rozdělení na redukovatelné (společné navázání soustavy) a neredukovatelné (dynamika) podle konvencí PerProvider / CommonFrameTie / CommonEphemeris, s metrikou návrhového zákona neredukovatelného podílu (~{ "0.69" } na skutečných DE440/INPOP/EPM: samotný společný štítek soustavy ponechává dominantní dno)

seg-2797643153dc = Ochranná úroveň času pro přijímač na oběžné dráze při spoofingu (podvržení signálu) GNSS

seg-cb412a2ffadf = orbital_timing::orbital_timing, dostupné jako sekce o spoofingu (podvržení signálu) druhu <c1/>: rychlost a perioda pohybu po kruhové dráze, nejdelší doba, po kterou může pozemní spoofer družici během jednoho přeletu zasáhnout, práh monitoru podporovaného hodinami a latence detekce CUSUM, podmíněná ochranná úroveň (práh plus doběh po dobu latence), posun, který spoofer s uvedenou maximální rychlostí náběhu nashromáždí, než družice opustí svou stopu nebo než proběhne nezávislá kontrola, a zda je každá kontrola při kontaktu se zemí či přes crosslink nezávislá na jednom pozemním spooferu

seg-f134975d4ffa = Spektrální vodopád pásma L s J/S a efektivním C/N0 pro každé pásmo při skriptované časové ose rušičů

seg-86ad8f89a822 = Druh <c1/>: mřížka frekvence a času výkonové spektrální hustoty v pásmu L (tepelný šum k T_sys s T_sys = T_ant + { "290" } K (F - { "1" }), signály při minimálních přijímaných výkonech podle specifikace rozhraní a rušiče s nepřetržitou vlnou, úzkopásmové, chirp a rušiče s přizpůsobeným šumem s časy zapnutí a vypnutí), každá buňka zprůměrovaná přes svůj pás a řádek (chirpy přesně přes celé i částečné rozmitání, rušiče podle střídy), efektivní C/N0 pro každé pásmo = [1/(C/N0) + sum (J/S) kappa]^-1 pro každý řádek, J/S pro každé pásmo, J/S v pásmu a vodopád ve formátu SVG se sloupci C/N0. Zpráva obsahuje křížovou kontrolu proti řetězci druhu <c2/> na týchž vstupech spoje

seg-6e0b9687e8ee = Uran a Neptun z tabulky Standish { "1" }, Pluto a rychlosti planet

seg-df3bf502dfe9 = Polohy Uranu a Neptunu z tabulky Standish { "1" } (výchozí v rozmezí { "1800" } n. l. až { "2050" } n. l.), Pluta z řádku tabulky { "1" } z roku { "1992" }, který aktuální stránka JPL už neuvádí, a heliocentrická rychlost každé planety: dvoutělesová derivace se středním pohybem, který elementy implikují, plus stáčení elipsy podle rychlostí změny perihelu, sklonu a uzlu

seg-a50be56f605a = Polohy Měsíce a sedmi velkých měsíců (Phobos, Deimos, galileovské měsíce, Titan)

seg-2cfbe5a1eece = Geocentrický Měsíc z řady Montenbrucka a Gilla (jejíž člen -1.3972 deg za století jej už vztahuje k ekvinokciu J2000) a planetocentrické polohy a rychlosti měsíců Phobos, Deimos, Io, Europa, Ganymed a Callisto ze středních elementů JPL Solar System Dynamics v Laplaceově rovině každého měsíce, s rychlostí střední délky převzatou z rychlosti synchronní rotace podle IAU (tabulka uvádí periodu na příliš málo míst, než aby udržela fázi), a měsíce Titan z rotačního modelu IAU (měsíc na záporné tělesově pevné ose x ve střední vzdálenosti), protože uvedený řádek Laplaceovy roviny pro Titan nereprodukuje Horizons ani v jeho vlastní epoše

seg-8b8c8e28ece9 = Fyzikální konstanty každého tělesa sluneční soustavy a zpráva o celé soustavě

seg-d225a30de35c = Body získává Merkur, Venuši, Jupiter, Saturn, Uran, Neptun, Pluto, Phobos, Deimos, Io, Europu, Ganymed, Callisto a Titan (gravitační parametr, referenční poloměr, J2 tam, kde je publikováno, s poloměrem, ke kterému se vztahuje, pól a nultý poledník podle IAU), vyhledání podle názvu a záznam BodyFacts (kód NAIF, třída, rodič, rovníkový a střední poloměr); druh <c1/> je hlásí pro všech osmnáct těles spolu s polohami, světelnými časy a drahou po dobu jednoho oběhu, každé těleso označené VALIDATED nebo MODELLED

seg-87ab655f8270 = Určování polohy kolem libovolného tělesa sluneční soustavy s lokální konstelací a spojem do hlubokého vesmíru ze Země

seg-d9b1b0ac97d3 = Druh <c1/>: orbiter nebo přistávací modul na povrchu tělesa zvoleného jménem navigují pomocí jednosměrných pseudovzdáleností z navigační konstelace Walker kolem tělesa (dvoutělesové dráhy se sekulárním driftem J2 tělesa, neznámé hodiny uživatele) a volitelné dvoucestné vzdálenosti ze Země bez hodin, přičemž směr a vzdálenost Země se berou z analytické efemeridy v každé epoše; zorné přímky blokované koulí tělesa a výšková maska na povrchu; v každé epoše GDOP a PDOP jen z konstelace (orbit::dop), formální polohová nejistota s řádkem Země a bez něj a seedované fixy Gauss-Newton (batch_ls::gauss_newton) pro oba případy, se světelným časem a oběhem tam a zpět mezi tělesem a Zemí

seg-7d4d7200cbca = Mapy pokrytí a faktoru DOP (zhoršení přesnosti) pro libovolné vícekonstelační návrhy ve velkém měřítku kolem libovolného centrálního tělesa

seg-b78b79e9fae4 = Druh <c1/> nad rámec dvou ukotvených případů: explicitní a vícevrstvé návrhy, několik konstelací v jednom běhu s jedněmi hodinami přijímače na konstelaci, Země, Měsíc a Mars z konstant těles, předvolba BeiDou (modelována fáze střední oběžné dráhy a průsečík nakloněné geosynchronní dráhy na { "118" } deg E), družice v dohledu, GDOP, PDOP, HDOP, VDOP a dostupnost pro každou buňku, podvzorkované pozemní stopy a předfiltr viditelnosti podle šířky subsatelitního bodu, který spočítá návrh s { "5" } 000 družicemi na mřížce { "10" } deg za zlomek sekundy

seg-278c77438493 = Řetězená mise napříč druhy scénářů na jedné sdílené časové ose

seg-3dcfb26f6234 = Fáze druhu <c1/>: každá fáze spouští jeden či více scénářů stávajících druhů přes run_toml, čte jejich výstupy do pojmenovaných kanálů (časová chyba hodin a ochranný pás, střední efektivní poměr nosné k hustotě šumu a práh sledování, svislá ochranná úroveň a mez poplachu, chyba polohy, sledované družice, příznaky poplachu) podle předvoleb pro jednotlivé druhy nebo explicitních cest k výsledkům, umísťuje je na začátek fáze a drží je na společné mřížce, s hranicemi fází a událostmi; stav se předává přes carry (kanál pokračuje od koncové hodnoty předchozí fáze), handoff (číslo z předchozí fáze zapsané do dalšího scénáře) a end_at (fáze končí v čase, který vypočítal nějaký běh, například v čase detekce monitoru spoofingu); hash kampaně a digest přes výsledek každého člena

seg-ad6105af464c = Parametrické průchody a seedované soubory Monte Carlo nad libovolným druhem scénáře

seg-95921611839e = Sekce sweep druhu <c1/> (jeden až tři klíče s tečkou libovolného druhu, na hodnotách os obecného průchodu, volitelně se souborem v každém uzlu) a monte_carlo: realizace k běží se seedem base_seed + k; každá metrika uvádí průměr, směrodatnou odchylku, percentily 5./50./95. podle nejbližší pozice a percentilový bootstrapový interval spolehlivosti { "95" } % pro průměr s pevným seedem (inertial::metric_stat); jednotky metrik se čtou z vlastního bloku jednotek prošetřovaného druhu

seg-24327a0ed82e = Několik scénářů za společných podmínek se souhrnným přehledem

seg-5833fb3b06e3 = Sekce compose druhu <c1/>: pojmenované sdílené hodnoty (například výkon a poloha jednoho rušiče) zapsané do každého člena pod klíče, ke kterým je vážou, každý člen spuštěný a pro každou metriku nejmenší, největší a střední hodnota napříč členy s uvedením jmenovaného člena; jednotky metrik se musí u všech členů shodovat

seg-0bc866720bde = Omezená optimalizace jedné metriky přes parametry kampaně

seg-f9bdb89c2b4f = Sekce optimize druhu <c1/> (CAP-32): jeden až tři klíče scénáře s tečkou omezené na [lo, hi] v lineárním nebo logaritmickém měřítku, jedna metrika čtená podle cesty k výsledku, cíl minimize, maximize nebo target; metoda grid (hodnoty os průchodu) nebo deterministický simplex Nelder-Mead v normalizovaných souřadnicích s projekcí na box a standardními koeficienty; chybějící nebo nekonečná metrika se hodnotí jako nejhorší a zůstává ve stopě; při runs > { "1" } je metrikou průměr přes společné seedy; každé vyhodnocení je skutečným během pojmenovaného druhu, uvedeným ve stopě (trace) a započteným do digestu reprodukovatelnosti

seg-652e28dfa10f = Návrhy signálů pro určování polohy, navigaci a čas na nízké oběžné dráze Země: sledování kódu, akvizice, kompatibilita s GNSS a pásmový kompromis pro libovolný systém

seg-c0ba5c7e708e = Druh <c1/>: parametrizované návrhy signálů (pásmo, vysílací šířka pásma, přidělení ITU; akviziční, datové a pilotní složky s BPSK(n), BOC(m,n), MBOC nebo plochými spektry, podíly výkonu, subnosné FDMA, délky kódů a datové rychlosti) z veřejných předvolbových souborů zkompilovaných do programu (Xona Pulsar, Iridium STL, signál příležitosti Starlink, CentiSpace, obecný návrh v pásmu C a obecné návrhy UHF/L/S/C/široké C, každý s adresou URL zdroje a nepublikovanými hodnotami označenými REPREZENTATIVNÍ) nebo zapsaných přímo; pro každý signál výkonová spektrální hustota s omezeným pásmem, podíly výkonu v pásmu, Gaborova šířka pásma, kódový jitter proti C/N0 a rozestupu a přesnost určování vzdálenosti, akviziční prostor prohledávání, pravděpodobnost detekce se čtvercovým detektorem a střední doba sériové a kódově paralelní akvizice, koeficient spektrální separace do a z GPS L1 C/A, Galileo E1, GPS L5, Galileo E5a, E5b a AltBOC se zhoršením C/N0 a tolerance J/S vůči CW, širokopásmovému a přizpůsobenému rušení z řetězce SSC druhu spectrum; pásmový kompromis ionosférického zpoždění, ztráty ve volném prostoru, přesnosti určování vzdálenosti při stejném C/N0 a stejném EIRP a odolnosti vůči rušení; a kvalitativní kontroly tvaru návrhu proti popsanému měření

seg-c2b9c8e4a364 = Vícepásmový spektrální vodopád (UHF, L, S, C) s navrženými signály a rušiči pro každé pásmo

seg-609df4e0a085 = Druh <c1/> rozšířený za pásmo L: pásma zadaná jako předvolba návrhu signálu (vykreslená se všemi složkami, omezená na vysílací šířku pásma, C/N0 a J/S vztažené ke sledované složce) nebo jako vlastní nosná a modulace; další panely vodopádu přes libovolný rozsah frekvencí na téže časové ose a barevné škále; širokopásmový (barrage) rušič vedle CW, úzkopásmového, chirpu a přizpůsobeného šumu; J/S a efektivní C/N0 pro každé pásmo z nezměněného řetězce koeficientu spektrální separace

seg-d9eb3e7e69c2 = Přelet LEO-PNT a jeho bilance spoje pro každé pásmo proti družicím GNSS na MEO v dohledu

seg-d986e44443dd = Druh <c1/>: družice z navrženého přeletu, elementů, TLE přes SGP4 nebo konstelace Walker z constellation-design; pro každé pásmo a epochu úhly pohledu, vzdálenost, rychlost změny vzdálenosti a zrychlení vzdálenosti v uzavřeném tvaru (při každém běhu kontrolované proti centrálním diferencím a hlášené), ztráta ve volném prostoru, EIRP s isoflux, gaussovskou nebo plochou charakteristikou, patch, hemisférickou nebo izotropní uživatelskou anténou, plynný útlum podle ITU-R P.676-10 Annex { "2" }, déšť a scintilace podle P.618, ztráta průnikem do budovy podle P.2109, polarizační nepřizpůsobení, šumová teplota systému, C/N0, Doppler a Dopplerova rychlost změny a prvořádové zpoždění z šikmého TEC podle Klobuchara nebo svislého TEC, škálované Chapmanovým podílem pod družicí; dvojice bez vlivu ionosféry se kódovým šumem ve vrcholu přeletu; nosné Galileo nebo GPS z přijímaných výkonů podle jejich interface dokumentů přes tentýž přijímač

seg-95a077a980b6 = Pojmenované předvolby systémů LEO-PNT s uvedenými zdroji a systémově agnostický engine

seg-4b47033cda24 = leo_link::presets: obecná vícepásmová (UHF, L, S, C), obecné pásmo C, Xona Pulsar X1/X5, Iridium STL, Starlink jako signál příležitosti pouze s Dopplerem, CentiSpace a volitelná předvolba Celeste IOD, každá s uvedeným zdrojem označeným VEŘEJNÝ (s URL), REPREZENTATIVNÍ nebo SEMINÁRNÍ, přičemž seminární je v souboru volitelné předvolby Celeste IOD, zkompilovaný jen tehdy, když soubor existuje; každé pásmo a dráhu lze ve scénáři přepsat a scénář nemusí uvádět žádnou předvolbu

seg-a39f34973373 = Nízkoenergetické určování polohy: doba do prvního fixu a energie na fix v závislosti na střídě

seg-f3b9b669a76f = leo_link::energy a sekce [iot] druhu <c1/>: koherentní integrace omezená Dopplerovou rychlostí změny, nekoherentní součty se čtvercovým detektorem až k detekčnímu prahu, prohledávání Dopplerových binů přes obálku statického uživatele dráhy (studený start) nebo podporované okno (teplý start), paralelní nebo sériové prohledávání kódu, čas navigační zprávy při studeném startu, energie na fix a výdrž baterie napříč intervaly fixů, pro každé pásmo LEO a signál GNSS

seg-8121e7db3db3 = Aktualizace navigační zprávy LEO uprostřed přeletu s kontrolou kontinuity při přepnutí

seg-34c310d85c42 = Analýza midpass-update druhu <c1/>: nejvyšší přelet nad uživatelem v prohledávaném rozpětí, zprávy v globálním rozvrhu s dobami použití vystředěnými ve svých fitovacích oknech a při každém přepnutí 3D skok polohy, skok hodin, skok pseudovzdálenosti uživatele, největší skok přes libovolnou viditelnou zornou přímku (uzavřený tvar přes nadirový kužel), chyba vzdálenosti před a po a PASS/FAIL proti prahu

seg-7635a8339e78 = Zdokumentované binární kódování navigační zprávy LEO s rozpočtem kvantizační chyby

seg-e4d9b16a2dc4 = leo_navmsg::codec: vlastní rámec Kshana (preambule, verze, model, délka, náklad, CRC-24Q) pro čtyři modely efemerid, polynom hodin, SVID, issue of data, pásmo, zdraví, sadu Klobuchar, koeficienty NeQuick-G a parametry UTC, každé pole s uvedenou šířkou a krokem (field_table), kvantizace s odmítnutím mimo rozsah a rozpočet největší změny polohy a hodin, kterou způsobí změna každého pole o půl kroku v okně platnosti

seg-17ca41d7fd71 = Exporty navigačních zpráv LEO ve stylu RINEX-4 a CSV

seg-185e12ccef0d = leo_navmsg::text: blok ve stylu RINEX-4 (hlavička záznamu > EPH, řádek družice a epochy se třemi členy hodin, řádky broadcast dráhy D19.12) s písmenem systému L a typy záznamů KP16, KRAC, LU22 a APOL, v každé hlavičce označený jako rozšíření Kshana, které není součástí RINEX { "4.02" }, a tabulka CSV s výchozím schématem sloupců a schématy předvoleb, každé s importérem

seg-e79047fc95af = Polynom ECEF ATOMIC bez hodin a syntetické srovnání modelů LEO pro pět výšek

seg-e261843e35b1 = varianta EcefPoly z leo_navmsg::elements::EphemerisModel: polynom ECEF pro každou osu bez členů hodin, relativistický člen z -2 r.v/c^{ "2" }, hodnocený proti řízeným hodinám. Také analýza srovnání modelů (liu_comparison nad LIU2025_TABLE), která fituje 22parametrový model v pěti výškách z článku na 20minutových obloucích dráhy integrované Kshana a vytiskne výsledek vedle publikovaného SISRE

seg-d2e18c8bdc14 = Určování polohy z Dopplera LEO, jednodružicové i vícedružicové, se stavy driftu hodin a rychlosti

seg-de6cb3c06490 = Dávkové určování polohy metodou Gauss-Newton z rychlosti změny vzdálenosti s analytickými parciálními derivacemi (d rho_dot / d r = -(I - u u^T)(v_s - v_u)/rho, d/dv = -u, d/d drift = { "1" }), volitelně s konstantní rychlostí uživatele, výškovým pseudoměřením pro pozemního uživatele a tlumenými kroky; formální kovariance v pravdě; průměty podél dráhy, napříč dráhou a svisle; přesnost jednoho přeletu v závislosti na příčném posunu uživatele; čas nejbližšího přiblížení. Režim doppler druhu <c1/> přidává chybu v závislosti na délce okna a režim signálů příležitosti pouze s Dopplerem (předvolba starlink-sop)

seg-7f462969d2d4 = Společné určování polohy z pseudovzdáleností GNSS a LEO s mezisystémovými biasy a modely chyb pro každý signál

seg-b9b5298e3408 = Fixy váženými nejmenšími čtverci metodou Gauss-Newton přes libovolnou směs systémů, jedny hodiny přijímače na systém (mezisystémový bias odhadovaný s polohou) nebo známý broadcast offset na referenční časové stupnici; sigmy jednotlivých měření dodává volající, ve výchozím stavu je to tepelný šum smyčky DLL (delay-lock loop) enginu (navsignal::dll_code_jitter_chips) při C/N0 dané elevací, spojený s chybou vzdálenosti signálu ve vesmíru; nevážené DOP (GDOP, PDOP, HDOP, VDOP, TDOP) v lokální geodetické soustavě, formální sigmy východ-sever-nahoru a sigmy biasů; společný režim <c1/> porovnává fixy jen z GNSS, jen z LEO a fúzované a vynáší DOP proti počtu přidaných družic LEO

seg-ee9a4a0cb530 = Konvergence přesného určování polohy bodu (PPP) pouze s GNSS a s doplněním o LEO

seg-a54f36c27d90 = Rozšířený Kalmanův filtr float PPP na kódu a fázi bez vlivu ionosféry: statické souřadnice, bílé hodiny přijímače, jeden mezisystémový bias na každý další systém, zenitové mokré zpoždění jako náhodná procházka mapované 1/sin(elevace), float nejednoznačnost pro každý oblouk družice přidaná při východu a odstraněná při západu a chyba přesné dráhy a hodin společná kódu a fázi družice, zpracovaná jako jedna korelovaná dvouřádková aktualizace v Josephově stabilizovaném tvaru; měření simulovaná ze stejného modelu; doba konvergence (chyby pod prahy až do konce běhu), křivky chyb a poloha NEES zprůměrovaná přes běh pro samotné GNSS a každý případ LEO, spouštěno jako druh <c1/>

seg-9306f1c06081 = Přenos času na UTC podporovaný LEO v závislosti na C/N0 a oscilátoru přijímače

seg-c618feb01476 = Měření hodin z každé družice LEO v dohledu ve známé poloze, kombinovaná inverzním rozptylem z modelu šumu pseudovzdálenosti, filtrovaná dvoustavovým (fáze, frekvence) Kalmanovým filtrem, jehož procesním šumem je bílý a náhodně se potulující frekvenční šum třídy oscilátoru (slot_timing::ClockNoise, clock_state::ClockClass; rozptyl doběhu z holdover::coast_phase_variance), seedované pravé hodiny ze stejných úrovní a výraz IS-GPS-200 oddíl { "20.3.3.5.2.4" } pro systémový čas na UTC s nejistotou broadcast offsetu přidanou jako bias pro každý běh; režim timing druhu <c1/> vynáší oscilátory a odchylky C/N0

seg-d92777401093 = Pojmenované systémy LEO PNT jako volitelné datové předvolby, každá s uvedeným zdrojem

seg-5130bfe2410c = Systémově agnostické vstupy: každý systém tvoří slupky Walker, explicitní elementy nebo předvolba GNSS, signál (nosná, čipová rychlost, šířka pásma, přijímaný výkon nebo rozsah C/N0), SISRE, sigma Dopplera a model hodin; předvolby doplňují jen to, co scénář vynechá, po jednom souboru se zdroji označenými VEŘEJNÝ (s URL), SEMINÁRNÍ nebo ODVOZENÝ a nepublikovanými hodnotami uvedenými jako reprezentativní: Xona Pulsar X1/X5, Iridium STL, signály příležitosti Starlink, CentiSpace, reprezentativní systém v pásmu C, model efemerid ATOMIC bez hodin a jedna předvolba odvozená ze semináře ve volitelném souboru předvolby Celeste IOD, která se vynechá odstraněním tohoto souboru a jeho scénářů

seg-dec52b5b9cd6 = Jeden systém LEO-PNT od začátku do konce: návrh signálu, bilance spoje přeletu, navigační zpráva a fúzované určování polohy, výstup každé fáze předán další

seg-39443b31d418 = Druh <c1/>: návrh leo-signal (veřejná předvolba nebo zapsaný přímo) určuje střed, šířku pásma, čipovou rychlost a rozdělení EIRP pásma leo-pass; přelet dává C/N0 sledované složky a kódový jitter s omezeným pásmem pro každou epochu; přímka C/N0 podle nejmenších čtverců v sin(elevace), SISRE zprávy leo-navmsg (fitované na dráze družice přeletu, plus uvedený člen určování oběžné dráhy v odmocnině součtu čtverců) a nosná a čipová rychlost návrhu jdou do každého systému LEO společného fixu leo-pvt a volitelně do případů LEO v leo-ppp; každé předání je hlášeno se svou hodnotou a jednotkou

seg-55ca63edff02 = Detekce spoofingu (podvržení signálu) podle konzistence Dopplera LEO a geometrie přeletu

seg-b12fc1728220 = Sekce <c2/> druhu <c1/>: spoofer padělá, samokonzistentně ve vzdálenosti a rychlosti změny vzdálenosti, signály viděné z tvrzené polohy, která po nástupu skočí nebo je odtlačena od skutečné (pro každé pásmo LEO a pro signál GNSS na MEO); přijímač předpovídá každou rychlost změny vzdálenosti z broadcast dráhy a nezávislé apriorní polohy a rychlosti a testuje naměřené rychlosti změny vzdálenosti zobecněnou statistikou chí-kvadrát nejmenších čtverců přes okno epoch (drift hodin je rušivý parametr nebo má apriorní hodnotu), na kanálech GNSS, kanálech LEO a na všech kanálech, s tepelným šumem smyčky FLL (frequency-lock loop) z C/N0 (Kaplan & Hegarty { "2006" }, oddíl { "5.6.2" }); pravděpodobnost detekce z necentrálního rozdělení chí-kvadrát při uvedené pravděpodobnosti falešného poplachu, detekce se vyhlásí při uvedené pravděpodobnosti nezachycené události

seg-5f341f85ac07 = Detekce spoofingu (podvržení signálu) podle mezipásmové konzistence vícepásmového signálu LEO

seg-2f9c4d351b0f = Pro každou družici LEO a dvojici určovacích pásem sekce <c1/> tvoří kombinaci pseudovzdáleností bez geometrie, odstraní ionosférický model přijímače a testuje její krok z epochy na epochu proti kódovému šumu obou pásem a uvedené tolerované nemodelované ionosférické rychlosti (oboustranně gaussovsky, přesná pravděpodobnost detekce); spoofer, který padělá některá pásma a jiná ne, nebo každé pásmo bez ionosféry, je viděn při svém nástupu; ten, který padělá každé pásmo a simuluje ionosféru, vidět není, což výsledek uvádí

seg-97dbcd5f2728 = Sondování ionosféry: šikmé TEC z dvoupásmového zpoždění přeletu LEO

seg-844de34fd2f3 = Pro každou dvojici pásem družice <c1/> zpráva uvádí šikmý celkový obsah elektronů, který kombinace kódů bez geometrie obnoví ve vrcholu přeletu, (P2 - P1) f1^{ "2" } f2^{ "2" } / ({ "40.3" } (f1^{ "2" } - f2^{ "2" })), a jeho 1 sigma z tepelného kódového šumu obou pásem, takže libovolný vícepásmový návrh LEO-PNT lze porovnávat jako ionosférický sondér

seg-5bd3bf0c22a7 = Model spektra: pásma GLONASS, BeiDou a Galileo E6 (volitelně)

seg-9c16189c63ac = spectrum::default_band určuje, výhradně podle jména (MORE_BAND_NAMES), GLONASS L1OF a L2OF na každém kanálu FDMA K = -7 až { "6" } (BPSK, { "0.511" } Mchip/s), BeiDou B1I (BPSK({ "2" })), B1C (MBOC(6,1,1/11)), B2a a B3I (BPSK({ "10" })) a Galileo E6 (BPSK({ "5" })), s nosnými a minimálními přijímanými výkony podle jejich dokumentů popisu rozhraní; výchozí sada pásem a všechny stávající výstupy se nemění.

seg-7b1ae0c7ca28 = Terciární kódy LunaNet AFS a vrstva zpráv (SB1 BCH, CRC-24Q, prokládač) oproti LSIS-AFS V1.0

seg-45215637ad2d = iq::signals::lunanet::afs_q_tertiary_bits, afs_q_tiered; iq::lunanet_afs: synchronizační vzor, kodér SB1 BCH({ "51,8" }) a dekodér s 256 hypotézami, CRC-24Q, blokový prokládač { "60" } x { "98" }, kontrola proudu symbolů (kshana lunanet-afs-check) a generátor testovacího proudu se zástupnými podrámci. Kódování LDPC s rychlostí 1/2 u podrámců { "2" } až { "4" } není implementováno (jeho matice jsou v samostatné příloze).

seg-0d7b17524c04 = Balíčky norem: scénáře hodnocené podle prahů stanovených před během

seg-6e5c04fd4531 = standards_pack (kshana standards-pack): testovací profily rámce DHS Resilient PNT pro úrovně { "1" } až { "4" }, úrovně přesnosti a vyhodnocení integrity podle IMO MSC.1/Circ.1575 a balíčky ICAO Doc { "9849" } Appendix F pro monitorování, posouzení a zmírnění: každý test spouští přibalený druh scénáře a porovnává pole výsledku s prahy uvedenými v balíčku, a testy, které potřebují záznam přijímače, jsou uvedeny jako NEEDS INPUT a nehodnotí se.

seg-8a8f2c85e0c3 = Laboratorní balíček důkazů z okruhu tam a zpět (scénář, zkušební podmínky, záznam přijímače, skóre)

seg-a090b06a920d = evidence::roundtrip (kshana evidence round-trip) a export záznamu přijímače kshana.test-conditions/1 z kshana bench-export: podepsaný balíček, který zaznamenává hash scénáře, hash uvedených podmínek, hash záznamu a skóre vůči uvedeným událostem, a odmítá podmínky, které se neshodují s hodnoticími událostmi, nebo záznam, jehož hash není uvedený hash. Žádný signál se nezapisuje, nepřehrává ani neplánuje.

seg-a9189e4fe413 = Sledovací engine IQ oproti GNSS-SDR { "0.0.19" } na nezávislých záznamech

seg-364de05e5b1b = Úplný sledovací engine vrstvy IQ (iq::track prostřednictvím kshana iq track: předání z akvizice, korelátory, NCO, smyčka PLL Costas druhého řádu { "15" } Hz, smyčka DLL s obálkou EML prvního řádu { "2" } Hz podporovaná nosnou, indikátor zachycení a odhadovače C/N0) na GPS L1 C/A při { "30" } až { "45" } dB-Hz.

seg-259d201c2ff8 = Zisky antény CRPA v druhu jamming oproti nezávislému přepočtu v numpy

seg-192144c57783 = Volitelná sekce [crpa] druhu jamming: paprsek pro každý kanál směrem ke každé družici (potlačení s rušičem jako nulou, nebo MVDR na sigma^{ "2" } I + P_j a_j a_j^H), který škáluje šum každého spoje hodnotou ||w||^{ "2" } a rušič hodnotou |w^H a_j|^{ "2" } před stávající rovnicí C/N0 pro ochranu proti rušení.

seg-a2f34cff9338 = Terénní zastínění rušiče v druhu jamming oproti nezávislému přepočtu v numpy na skutečné dlaždici SRTM

seg-334c569d9cae = Volitelná sekce [terrain] druhu jamming: profil terénu po ortodromě mezi rušičem a přijímačem na dlaždici SRTM .hgt s vyboulením Země podle k-faktoru, dominantní ostrá hrana (největší Fresnelovo-Kirchhoffovo nu) a ztráta jednou ostrou hranou podle ITU-R P.526-15 oddíl { "4.1" }, odečtená od výkonu rušiče na vstupu přijímače.

seg-825c121c7512 = Hystereze akvizice a kvantizér předního stupně v druhu jamming oproti nezávislým přepočtům

seg-f7207263d881 = Volitelná sekce [acquisition] druhu jamming (družice je získána při hodnotě na akvizičním prahu nebo nad ním po prodlevě opětovné akvizice a držena, dokud je na sledovacím prahu nebo nad ním) a sekce [front_end] (údaj AGC { "10" } log10({ "1" } + J/N) a ztráta Gaussova vstupního kvantizéru ADC odečtené z každého spoje, označené jako neplatné pro negaussovské rušiče).

seg-9c46f1c76486 = Omezené navázání FLL pod výchozí podlahou předání z FLL do PLL výchozího návrhu (volitelně)

seg-efa1d1a9e904 = volitelné carrier.fll_pull_in_max_s v iq::track (pole fll_pull_in_max_s v iq::track::LoopConfig): při fll_assist = pull-in předá FLL řízení PLL po pevné době navázání bez ohledu na PLI, s odpovídající dobou návratu, dokud PLI poprvé nedosáhne fll_off_pli.

seg-ac0f97e945a7 = Čtečka řešení RTKLIB .pos pro receiver-trust

seg-0b8bc2c89de4 = Čte soubor řešení RTKLIB (kalendářní čas nebo čas GPS týden/TOW, zeměpisná šířka/délka nebo poloha ECEF, použité družice) do časové osy receiver-trust (receiver_trust::machines::rtklib).

seg-849393517c04 = Logy NovAtel OEM7 ASCII a binární (BESTPOS, RANGE, RXSTATUS) pro receiver-trust

seg-7e0021922025 = Čte BESTPOS (poloha), RANGE (C/No podle signálu) a RXSTATUS (příznak rušení přijímače jako vlastní hlášení epochy) z logů OEM7 ASCII i binárních, s kontrolou CRC, jen pro čtení (receiver_trust::machines::novatel).

seg-a45c53a9deb3 = Čtečka poměru nosné k šumu RTCM { "3" } MSM4 a MSM7 pro receiver-trust

seg-0a0c9976236f = Čte C/N0 každé signálové buňky zpráv RTCM { "3" } MSM4 a MSM7 (GPS, GLONASS, Galileo, SBAS, QZSS, BeiDou, NavIC) z proudu rámců, s kontrolou CRC-24Q (receiver_trust::machines::rtcm3). Rozložení z tabulek pyrtcm s licencí BSD, nikoli z textu normy RTCM.

seg-cd554a7c1649 = Adaptér monitoru GNSS-SDR pro receiver-trust

seg-22b587ac642d = Čte zprávy GNSS-SDR Monitor (Gnss_Synchro) a PVT-monitoru, předávané jako řádky JSON s názvy polí z proto, do C/N0 po kanálech, určení polohy, použitých družic, HDOP a oblohy (receiver_trust::machines::gnss_sdr; integrations/gnss-sdr/relay.py).

seg-217e5953c128 = Načítání logů IMU, vstup směru z gyra a Allanův fit parametrů hybridních senzorů

seg-9dadc819daef = Čte CSV IMU (zdokumentované sloupce, nebo rozložení EuRoC); integruje rychlost stáčení do směru, který čte monitor směru a kurzu ([log.imu]); a z klidového logu přes překrývající se Allanovu odchylku (imu-fit) fituje parametry šumu akcelerometru a gyra pro hybridní a fúzní scénáře.

seg-15a852a2dcb0 = Exportér objevování MQTT a stavu Home Assistant pro telemetrii důvěry

seg-6d6b07b26966 = Stavový dokument JSON a zprávy objevování MQTT Home Assistant pro proud důvěry, vypisované jako text na každém rozhraní a publikované přes MQTT { "3.1.1" } QoS { "0" } příkazovým řádkem (telemetry::mqtt; trust-telemetry --mqtt-tcp, --print-mqtt, format mqtt).

seg-68caf86157c2 = Balíček receiver-trust pro ROS { "2" } a most gnss_lib_py

seg-e7d7d99fe538 = Most bez ROS, který zapisuje zprávy o určení polohy a družicích jako NMEA a hodnotí je přes vazbu pro Python (integrations/ros2/kshana_trust), a most z gnss_lib_py NavData do receiver-trust přes formát rtklib-pos (integrations/gnss_lib_py).

seg-c3c260b7063e = Testy
