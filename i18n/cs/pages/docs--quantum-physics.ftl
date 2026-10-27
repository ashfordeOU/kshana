# docs--quantum-physics: translations (cs)

seg-5ad814c7ef9e = Poznámky

seg-ad856ad710eb = Stav

# c1: docs/QUANTUM.md
seg-f2f359447cd9 = Zdroj: <c1/>

seg-5df810623ef1 = Fyzika kvantových inerciálních senzorů (atomový interferometr z chladných atomů)

# c1: QUANTUM-MODELS.md
# c2: PROVENANCE.md
# c3: src/inertial/quantum_imu.rs
seg-b2915c3652a1 = Většina Kshany řídí své kvantové senzory z <b>publikovaných koeficientů Allanovy odchylky a šumu</b> — vyhledáváním v datových listech (viz <a1><c1/></a1> a <a2><c2/></a2>). Tento dokument se týká jediného místa, kde engine výkon senzoru místo toho počítá <b>z prvních principů</b>: modelu akcelerometru s atomovým interferometrem z chladných atomů (CAI) v <a3><c3/></a3>.

seg-9ae4b2dc84ba = Je to záměrně <em>minimální, poctivá</em> fyzikální vrstva — hranice kvantového projekčního šumu a škálový faktor interferometru — nikoli úplný simulátor přístroje. Níže uvedené části přesně říkají, co se modeluje a co ne.

seg-64509c048541 = Co je modelováno

seg-9fa6211c962e = Třípulzní (π/2–π–π/2) atomový interferometr Machův–Zehnderův (Kasevich & Chu { "1991" }; Peters, Chung & Chu { "2001" }), standardní geometrie akcelerometru z chladných atomů:

seg-3c513ef2fd3b = Veličina

seg-c0a13eeb346d = Vzorec

seg-f838cd800e16 = Efektivní vlnový vektor

# c1: k_eff ≈ 1.611×10⁷ rad/m
seg-79e00267b79f = Dvoufotonový Raman; Rb-87 D2 ({ "780.241" } nm) → <c1/>.

seg-5c0a84157352 = Fáze interferometru

# c1: a
# c2: k_eff
# c3: T
# c4: T²
# c5: T
seg-31f4f718d896 = Rovnoměrná specifická síla <c1/> podél <c2/>, rozestup pulzů <c3/>. Škálování <c4/> je dominantní páka citlivosti (mikrogravitace umožňuje dlouhé <c5/>).

seg-f5b8b6c35dce = Kvantový projekční šum

# c1: C
# c2: N
seg-8902ae6f313c = Na výstřel, kontrast proužků <c1/>, počet atomů <c2/> — mez shot noise dvouportového odečtu populací.

seg-b95d4d1e45f0 = Citlivost zrychlení na výstřel

seg-c97f2fd35d48 = Fázový šum převedený na zrychlení.

seg-cda09ac79409 = ASD (amplitudová spektrální hustota) omezená shot noise

# c1: T_c
seg-4d84800a3adb = Vzorkování každou dobu cyklu <c1/>; jednotky (m/s²)/√Hz.

seg-707ee648d1d5 = PSD (výkonová spektrální hustota) náhodné procházky rychlosti

# c1: AccelModel
seg-be0ac61054db = <b>Koeficient, který spotřebovává klasický <c1/></b> — nyní <em>odvozený</em>, nikoli dodaný.

seg-939e12a62637 = Pokles kontrastu

seg-05b0e7130b78 = Dekoherence během interrogace.

seg-e64f748b35ab = Přenosová funkce vibrací

# c1: T²
seg-1754ac375452 = Odezva fáze na zrychlení ideální třípulzní geometrie (Cheinet et al. { "2008" }); limita pro DC (nulovou frekvenci) <c1/>.

seg-a710cfe4f533 = Fáze omezená vibracemi

# c1: S_a
# c2: ∫₀^∞|H|²dω = (2π/3)T³
seg-f5d2223218c8 = Plochá PSD zrychlení <c1/> podél osy Ramanových svazků; <c2/>.

seg-13109dcfc52b = Zrychlení omezené vibracemi

# c1: k_eff
seg-812990a8f058 = Na výstřel; všimněte si, že <c1/> se vyruší — určuje je jen PSD platformy a doba interrogace.

seg-1c2764469718 = Nejednoznačnost proužků

# c1: a_max = π/(k_eff·T²)
# c2: a_max/σ_a = π/σ_Φ
seg-e9cf2dcc0274 = <c1/>, rozsah v buňkách <c2/>

# c1: a_max
# c2: 2·a_max
# c3: k_eff
# c4: T
seg-817e06834263 = Fáze proužku se čte modulo 2π, takže jediné čtení je jednoznačné jen uvnitř ±<c1/> a mimo něj se aliasuje po každých <c2/>; počet buněk nezávisí na <c3/> ani <c4/>.

seg-14bbedf1cd0d = Projekce na osu

seg-1ac2d4904b8a = Vazba prvního řádu má hodnost 1: do fáze vstupuje jen složka podél svazku.

seg-7200f91fa19a = Fáze Coriolisova jevu / rotace

# c1: 2·v_⊥·Ω
seg-f8b407b3b2fb = Systematický jev rotace pro pohybující se vozidlo (Lan et al. { "2012" }); ekvivalentní bias <c1/> = klasický Coriolisův člen.

seg-9eaff8d90a83 = Fáze AC-Starkova (light-shift) jevu (AC: střídavý proud)

seg-62630dc178e6 = Jednofotonový light shift; <em>konstantní</em> posun se ruší symetrií π/2–π–π/2 (Peters { "2001" }; Gauguet { "2008" }).

# c1: CaiAccelerometer::q_va()
seg-bcb9cb9c6219 = Podstatné je uzavření smyčky: <c1/> vytváří přesně tu PSD bílého zrychlení, kterou zbytek inerciální sady již integruje do chyby rychlosti/polohy — takže šum kvantového senzoru lze vystopovat k počtu atomů, době interrogace a kontrastu, a ne k řádku v datovém listu.

# c1: T = 10 ms
# c2: N = 10⁶
# c3: C = 0.5
# c4: T_c = 0.5 s
# c5: Φ(1 g) ≈ 1.58×10⁴ rad
# c6: σ_Φ = 2×10⁻³ rad
# c7: σ_a ≈ 1.24×10⁻⁶ m/s²
# c8: n_a ≈ 0.09 µg/√Hz
# c9: S_a = 10⁻¹⁰ (m/s²)²/Hz
# c10: σ_a ≈ 5.8×10⁻⁵ m/s²
# c11: a_max ≈ 1.95×10⁻³ m/s²
# c12: Φ(1 g)
seg-e2363d639ccc = Řešený příklad (Rb-87, <c1/>, <c2/>, <c3/>, <c4/>): <c5/>, <c6/>, <c7/> (≈ { "0.13" } µg) na výstřel a hranice shot noise <c8/>. Při skromné PSD vibrací platformy <c9/> je hranice na výstřel <b>omezená vibracemi</b> <c10/> (≈ { "5.9" } µg) — asi { "46" }násobek hranice shot noise, což ukazuje, proč jsou skutečné přístroje omezeny vibracemi, nikoli projekcí. Týž interferometr čte specifickou sílu jednoznačně jen v rozsahu <c11/> (≈ { "199" } µg), asi { "1 571" } rozlišovacích buněk: <c12/> jsou tisíce proužků, takže jediné čtení { "1" } g je aliasováno.

seg-c209b86f41d8 = Co NENÍ modelováno (a proč je hranice optimistická)

# c1: scenarios/imu-deadreckoning.toml
# c2: max_unambiguous_accel
# c3: wrap_phase
# c4: accel_from_wrapped_phase
# c5: dynamic_range_cells
seg-964c5f546c2a = Výše uvedená hranice shot noise je <b>základní dolní mez</b>. Skutečné přístroje CAI leží nad ní: statický laboratorní gravimetr (Freier et al. { "2016" }, { "96" } nm/s²/√Hz) asi { "60" }krát nad hranicí vypočtenou pro jeho parametry a nasazená trojice akcelerometrů mnohem výše (přístroj Exail citovaný v <c1/> uvádí { "22" } µg/√Hz). Dominantní člen — <b>vazba vibrací</b> — a dva hlavní deterministické systematické jevy — <b>Coriolisův jev/rotace</b> a <b>AC-Starkův light shift</b> — jsou modelovány (řádky s přenosovou funkcí, Coriolisem a light shiftem výše), stejně jako <b>dynamický rozsah nejednoznačnosti proužků</b> (<c2/>, <c3/>, <c4/>, <c5/>). Zbývající mezera je to, co tato vrstva stále nezahrnuje:

seg-c56d85817bc6 = <b>Aberace vlnoplochy</b> a systematické jevy zaměření svazku vyššího řádu — <b>nemodelováno</b>.

# c1: a_max
seg-525c382e813b = <b>Řešení nejednoznačnosti proužků</b> — model uvádí jednoznačný rozsah a vrací zalomenou fázi; nerozbaluje čtení mimo ±<c1/> (například s klasickým akcelerometrem nebo několika dobami interrogace) a rozsah vymezuje pro ideální třípulzní proužek, bez členů vlnoplochy a ztráty kontrastu.

seg-7555132ef2c6 = Vazba na literaturu: Groves, <em>Principles of GNSS, Inertial, and Multisensor Integrated Navigation Systems</em> §{ "12.5" } (kvantová technologie; GNSS: globální družicový navigační systém); Cheinet et al., <em>IEEE Trans. Instrum. Meas.</em> { "57" } ({ "2008" }) pro citlivost/přenosovou funkci interferometru (IEEE: Institute of Electrical and Electronics Engineers); Freier et al., <em>J. Phys.: Conf. Ser.</em> { "723" } ({ "2016" }) pro rozpočet chyb mobilního gravimetru; CARIOQA-PMP (Cold Atom Rubidium Interferometer in Orbit for Quantum Accelerometry – Pathfinder Mission Preparation) pro režim parametrů vesmírného akcelerometru.

# c1: ROADMAP.md
# c2: q_va
# c3: T³
seg-c50f3befe165 = Toto je položka <b>P2 vrstva kvantové fyziky</b> z <c1/>: fáze Machova–Zehnderova interferometru, projekční šum, škálový faktor, odvozené <c2/>, pokles kontrastu <b>a přenosová funkce vazby vibrací / rozptyl při bílé PSD</b> jsou implementovány a testovány jednotkovými testy proti ručnímu výpočtu (včetně numerické křížové kontroly pásmového integrálu přenosové funkce proti jejímu analytickému výsledku <c3/>).

# c1: ImuKind::QuantumCai
# c2: cai
# c3: [accel_quantum.cai]
# c4: [accel_classical.cai]
# c5: inertial
# c6: [accel.cai]
# c7: hybrid-ukf
# c8: scenarios/hybrid-ukf.toml
# c9: scenarios/quantum-cai-coast.toml
# c10: wavelength_m
# c11: pulse_sep_t
# c12: T
# c13: atom_number
# c14: N
# c15: contrast
# c16: C
# c17: cycle_time_s
# c18: T_c
# c19: vibration_psd
# c20: q_va
# c21: [cai]
seg-42e8dc204be9 = Model je také <b>zapojen do spustitelných scénářů</b>: akcelerometr se vyhodnotí jako <c1/>, když nese tabulku <c2/> — <c3/> nebo <c4/> ve scénáři <c5/>, <c6/> ve scénáři <c7/> (<c8/> jeden obsahuje a přibalená předvolba <c9/> staví CAI zadané fyzikou proti křemennému akcelerometru navigační třídy při výpadku GNSS) — s poli <c10/>, <c11/> (<c12/>), <c13/> (<c14/>), <c15/> (<c16/>), <c17/> (<c18/>) a volitelnou <c19/> platformy. Jeho PSD náhodné procházky rychlosti <c20/> se pak <b>odvozuje</b> z fyziky interferometru — hranice shot noise plus, je-li zadána PSD vibrací, příspěvek omezený vibracemi v kvadratuře — místo aby se dodával jako koeficient z datového listu. Scénáře bez bloku <c21/> jsou klasické a bajtově nezměněné.

# c1: coriolis_phase
# c2: coriolis_accel_bias
# c3: ac_stark_phase
# c4: 2·Ω×v
# c5: cai_drift_sweep
# c6: quantum-gnss-free-nav
# c7: QuantumNavBudget
# c8: src/inertial/cai_params.rs
seg-51da20726ade = Systematické jevy Coriolisův (<c1/> / <c2/>) a AC-Starkův light shift (<c3/>) jsou implementovány a testovány jednotkovými testy (ekvivalentní bias Coriolisova jevu je kontrolován proti klasickému <c4/>; fáze AC-Starka proti své symetrické kompenzaci). Průchod driftu podle doby cyklu (<c5/>) vykazuje drift polohy při dead reckoningu s kvantovým CAI v závislosti na době cyklu — výpočetní jádro srovnání kvantových a klasických technologií. Druh <c6/> používá týž akcelerometr přes <c7/> a <c8/> nese tříhodnotovou (nejlepší, nominální, konzervativní) tabulku parametrů s citací pro každou hodnotu.

seg-e2acbef44395 = Co ukazují vnější kontroly.

# c1: tests/quantum_inertial_sensor_reference.rs
# c2: k_eff
# c3: |2Ω×v|
seg-353a2b2e1434 = <c1/> kontroluje přenosovou funkci proti numerickému integrálu Cheinetovy citlivostní funkce v časové oblasti, <c2/> proti publikovaným vlnovým délkám čar a bias Coriolisova jevu proti <c3/> — přesné shody s publikovanými tvary. Hranice shot noise je jednostranné ohraničení: pro publikované parametry cesiového gravimetru Peters et al. { "2001" } a rubidiového gravimetru GAIN Freier et al. { "2016" } (arXiv:{ "1512.05660" }) leží modelovaná hranice na úrovni dosaženého šumu každého přístroje nebo pod ní a v rozmezí tří řádů od něj (pro GAIN je hranice { "1.53" }×{ "10" }⁻⁹ m/s²/√Hz proti dosaženým { "9.6" }×{ "10" }⁻⁸, tedy zhruba { "63" }násobek). To je v souladu s tím, že skutečné přístroje jsou omezeny vibracemi nebo technickými příčinami, ale je to ohraničení, nikoli validace modelu šumu přístroje, takže řádek matice zůstává MODELLED.

# c1: cai_drift_sweep
seg-82dffa95c0e8 = Zbývající navazující práce jsou systematické jevy vlnoplochy/zaměření svazku, řešení nejednoznačnosti proužků, numericky přesná reprodukce rozpočtů CARIOQA-PMP Monte Carlo a letových zkoušek Boeing/AOSense bez GPS (GPS: Global Positioning System) (které potřebují publikované PSD platforem a SNR na výstřel, poměr signálu k šumu) a předvolba pro srovnání kvantových a klasických technologií v prohlížečovém hřišti nad <c1/>.

seg-2452f58aedf0 = <s1>Předchozí</s1>Modely kvantových senzorů

seg-206d5a9704f0 = <s1>Další</s1>API pro Python
