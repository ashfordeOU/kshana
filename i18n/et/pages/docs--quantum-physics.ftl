# docs--quantum-physics: translations (et)

# text
seg-5ad814c7ef9e = Märkused

# text
seg-ad856ad710eb = Staatus

# text
# c1: docs/QUANTUM.md
seg-f2f359447cd9 = Allikas: <c1/>

# text
seg-5df810623ef1 = Kvantinertsiaalanduri füüsika (külmaatomi interferomeeter)

# text
# c1: QUANTUM-MODELS.md
# c2: PROVENANCE.md
# c3: src/inertial/quantum_imu.rs
seg-b2915c3652a1 = Enamik Kshana kvantandureid on juhitud <b>avaldatud Alani/müra koefitsientidest</b> — andmelehe otsingutest (vt <a1><c1/></a1> ja <a2><c2/></a2>). See dokument käsitleb ainsat kohta, kus mootor arvutab anduri toimivuse selle asemel <b>esimestest printsiipidest</b>: külmaatomi interferomeetri (CAI) kiirendusmõõturi mudel failis <a3><c3/></a3>.

# text
seg-9ae4b2dc84ba = See on teadlikult <em>minimaalne, aus</em> füüsikakiht — kvantprojektsioonimüra põhi ja interferomeetri skaalategur — mitte täielik instrumendisimulaator. Allolevad jaotised ütlevad täpselt, mida modelleeritakse ja mida mitte.

# text
seg-64509c048541 = Mida modelleeritakse

# text
seg-9fa6211c962e = Kolmepulsiline (π/2–π–π/2) Mach–Zehnderi aatominterferomeeter (Kasevich & Chu { "1991" }; Peters, Chung & Chu { "2001" }), standardne külmaatomi kiirendusmõõturi geomeetria:

# text
seg-3c513ef2fd3b = Suurus

# text
seg-c0a13eeb346d = Valem

# text
seg-f838cd800e16 = Efektiivne lainevektor

# text
# c1: k_eff ≈ 1.611×10⁷ rad/m
seg-79e00267b79f = Kahefootoniline Raman; Rb-87 D2 ({ "780.241" } nm) → <c1/>.

# text
seg-5c0a84157352 = Interferomeetri faas

# text
# c1: a
# c2: k_eff
# c3: T
# c4: T²
# c5: T
seg-31f4f718d896 = Ühtlane erijõud <c1/> piki suunda <c2/>, pulsside vahe <c3/>. Skaleerimine <c4/> on domineeriv tundlikkuse hoob (mikrogravitatsioon annab pika <c5/>).

# text
seg-f5b8b6c35dce = Kvantprojektsioonimüra

# text
# c1: C
# c2: N
seg-8902ae6f313c = Ühe laksu kohta, vöötme kontrast <c1/>, aatomite arv <c2/> — kahe pordi populatsiooniloendi kildmüra piir.

# text
seg-b95d4d1e45f0 = Ühe laksu kiirendustundlikkus

# text
seg-c97f2fd35d48 = Kiirendusele viidatud faasimüra.

# text
seg-cda09ac79409 = Kildmüraga piiratud ASD (amplituudspektritihedus)

# text
# c1: T_c
seg-4d84800a3adb = Diskreetimine iga tsükliaja <c1/> järel; ühikud (m/s²)/√Hz.

# text
seg-707ee648d1d5 = Kiiruse juhusliku hulkumise PSD (võimsusspektritihedus)

# text
# c1: AccelModel
seg-be0ac61054db = <b>Koefitsient, mida klassikaline <c1/> tarbib</b> — nüüd <em>tuletatud</em>, mitte etteantud.

# text
seg-939e12a62637 = Kontrasti vähenemine

# text
seg-05b0e7130b78 = Dekoherents küsitluse jooksul.

# text
seg-e64f748b35ab = Vibratsiooni ülekandefunktsioon

# text
# c1: T²
seg-1754ac375452 = Ideaalse kolmepulsilise geomeetria kiirendus→faas vastus (Cheinet jt { "2008" }); DC (nullsageduse) piir <c1/>.

# text
seg-a710cfe4f533 = Vibratsiooniga piiratud faas

# text
# c1: S_a
# c2: ∫₀^∞|H|²dω = (2π/3)T³
seg-f5d2223218c8 = Tasane kiirenduse PSD <c1/> piki Ramani telge; <c2/>.

# text
seg-13109dcfc52b = Vibratsiooniga piiratud kiirendus

# text
# c1: k_eff
seg-812990a8f058 = Ühe laksu kohta; pange tähele, et <c1/> kaob — määrab ainult platvormi PSD ja küsitlusaeg.

# text
seg-1c2764469718 = Vöötmetähenduslikkus

# text
# c1: a_max = π/(k_eff·T²)
# c2: a_max/σ_a = π/σ_Φ
seg-e9cf2dcc0274 = <c1/>, ulatus lahtrites <c2/>

# text
# c1: a_max
# c2: 2·a_max
# c3: k_eff
# c4: T
seg-817e06834263 = Vöötme faasi loetakse mooduli 2π järgi, seega on üksik lugem üheselt mõistetav ainult piirkonnas ±<c1/> ja alias'tub väljaspool seda iga <c2/> järel; lahtrite arv ei sõltu <c3/>-st ega <c4/>-st.

# text
seg-14bbedf1cd0d = Telje projektsioon

# text
seg-1ac2d4904b8a = Esimese järgu sidestus on astmega 1: faasi mõjutab ainult kiire-sihiline komponent.

# text
seg-7200f91fa19a = Coriolisi / pöörlemise faas

# text
# c1: 2·v_⊥·Ω
seg-f8b407b3b2fb = Pöörlemise süstemaatiline mõju liikuva sõiduki jaoks (Lan jt { "2012" }); samaväärne nihe <c1/> = klassikaline Coriolisi liige.

# text
seg-9eaff8d90a83 = AC-Starki (valgusnihke) faas (AC: vahelduvvool)

# text
seg-62630dc178e6 = Ühefootoniline valgusnihe; <em>konstantne</em> nihe tühistub π/2–π–π/2 sümmeetria tõttu (Peters { "2001" }; Gauguet { "2008" }).

# text
# c1: CaiAccelerometer::q_va()
seg-bcb9cb9c6219 = Ringi sulgemine on mõte: <c1/> annab täpselt selle valge kiirenduse PSD, mille ülejäänud inertsiaalkompleks juba integreerib kiiruse/asukoha veaks — nii et kvantanduri müra on jälgitav selle aatomite arvuni, küsitlusajani ja kontrastini, mitte andmelehe reani.

# text
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
seg-e2363d639ccc = Läbitöötatud arv (Rb-87, <c1/>, <c2/>, <c3/>, <c4/>): <c5/>, <c6/>, <c7/> (≈ { "0.13" } µg) ühe laksu kohta ja kildmüra põhi <c8/>. Mõõduka platvormi vibratsiooni PSD <c9/> korral on <b>vibratsiooniga piiratud</b> ühe laksu põhi <c10/> (≈ { "5.9" } µg) — umbes { "46" }× kildmüra põhi, mis näitab, miks reaalsed seadmed on piiratud vibratsiooni, mitte projektsiooniga. Sama interferomeeter loeb erijõudu üheselt ainult piirkonnas <c11/> (≈ { "199" } µg), umbes { "1 571" } lahutuslahtrit: <c12/> on tuhandeid vöötmeid, seega on üksik { "1" } g lugem alias'tunud.

# text
seg-c209b86f41d8 = Mida EI modelleerita (ja miks põhi on optimistlik)

# text
# c1: scenarios/imu-deadreckoning.toml
# c2: max_unambiguous_accel
# c3: wrap_phase
# c4: accel_from_wrapped_phase
# c5: dynamic_range_cells
seg-964c5f546c2a = Ülaltoodud kildmüra põhi on <b>põhimõtteline alampiir</b>. Reaalsed CAI instrumendid asuvad sellest kõrgemal: staatiline laboratoorne gravimeeter (Freier jt { "2016" }, { "96" } nm/s²/√Hz) asub umbes { "60" }× kõrgemal tema parameetritele arvutatud põhjast ja välitingimustes kasutatav kiirendusmõõturite kolmik palju kõrgemal (dokumendis <c1/> viidatud Exaili seade esitab { "22" } µg/√Hz). Domineeriv liige — <b>vibratsioonisidestus</b> — ja kaks juhtivat deterministlikku süstemaatilist mõju — <b>Coriolisi/pöörlemise</b> ja <b>AC-Starki valgusnihke</b> mõju — on modelleeritud (ülaltoodud ülekandefunktsiooni, Coriolisi ja valgusnihke read), samuti <b>vöötmetähenduslikkuse dünaamiline ulatus</b> (<c2/>, <c3/>, <c4/>, <c5/>). Allesjäänud lünk on see, mida see kiht endiselt ei sisalda:

# text
seg-c56d85817bc6 = <b>Lainefrondi aberratsioon</b> ja kõrgema järgu kiire sihtimise süstemaatilised mõjud — <b>ei modelleerita</b>.

# text
# c1: a_max
seg-525c382e813b = <b>Vöötmetähenduslikkuse lahendamine</b> — mudel ütleb üheselt mõistetava ulatuse ja tagastab mähitud faasi; see ei lahenda piirkonnast ±<c1/> väljapoole jäävat lugemit (näiteks klassikalise kiirendusmõõturi või mitme küsitlusaja abil) ja piirab ulatuse ideaalse kolmepulsilise vöötme jaoks, ilma lainefrondi või kontrastikao liikmeteta.

# text
seg-7555132ef2c6 = Vastavus kirjandusele: Groves, <em>Principles of GNSS, Inertial, and Multisensor Integrated Navigation Systems</em> §{ "12.5" } (kvanttehnoloogia; GNSS: ülemaailmne satelliitnavigatsioonisüsteem); Cheinet jt, <em>IEEE Trans. Instrum. Meas.</em> { "57" } ({ "2008" }) interferomeetri tundlikkuse/ülekandefunktsiooni kohta (IEEE: Institute of Electrical and Electronics Engineers); Freier jt, <em>J. Phys.: Conf. Ser.</em> { "723" } ({ "2016" }) mobiilse gravimeetri veaeelarve kohta; CARIOQA-PMP (Cold Atom Rubidium Interferometer in Orbit for Quantum Accelerometry – Pathfinder Mission Preparation) kosmosekiirendusmõõturi parameetrirežiimi kohta.

# text
# c1: ROADMAP.md
# c2: q_va
# c3: T³
seg-c50f3befe165 = See on <b>P2 kvantfüüsika kihi</b> punkt failist <c1/>: Mach–Zehnderi faas, projektsioonimüra, skaalategur, tuletatud <c2/>, kontrasti vähenemine <b>ja vibratsioonisidestuse ülekandefunktsioon / valge PSD dispersioon</b> on realiseeritud ja ühikutestitud käsitsi arvutuse vastu (sealhulgas ülekandefunktsiooni arvuline ribaintegraali ristkontroll selle analüütilise tulemuse <c3/> vastu).

# text
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
seg-42e8dc204be9 = Mudel on ka <b>ühendatud käivitatavate stsenaariumidega</b>: kiirendusmõõtur lahendub tüübiks <c1/>, kui see kannab tabelit <c2/> — <c3/> või <c4/> stsenaariumis <c5/>, <c6/> stsenaariumis <c7/> (<c8/> sisaldab ühte ja kaasasolev eelseade <c9/> seab füüsikaliselt määratud CAI navigatsioonitasemel kvartskiirendusmõõturi vastu GNSS-i katkestuse ajal) — väljadega <c10/>, <c11/> (<c12/>), <c13/> (<c14/>), <c15/> (<c16/>), <c17/> (<c18/>) ja valikulise platvormi <c19/>. Selle kiiruse juhusliku hulkumise PSD <c20/> on siis <b>tuletatud</b> interferomeetri füüsikast — kildmüra põhi pluss, kui vibratsiooni PSD on antud, vibratsiooniga piiratud panus ruutsummana — mitte antud andmelehe koefitsiendina. Stsenaariumid ilma plokita <c21/> on klassikalised ja bait-baidilt muutumatud.

# text
# c1: coriolis_phase
# c2: coriolis_accel_bias
# c3: ac_stark_phase
# c4: 2·Ω×v
# c5: cai_drift_sweep
# c6: quantum-gnss-free-nav
# c7: QuantumNavBudget
# c8: src/inertial/cai_params.rs
seg-51da20726ade = Coriolisi (<c1/> / <c2/>) ja AC-Starki valgusnihke (<c3/>) süstemaatilised mõjud on realiseeritud ja ühikutestitud (Coriolisi samaväärset nihet kontrollitakse klassikalise <c4/> vastu; AC-Starki faasi selle sümmeetrilise tühistumise vastu). Tsükliaja triivi pühkimine (<c5/>) annab kvant-CAI surnud lugemi (dead-reckoning) asukohatriivi sõltuvuse tsükliajast — kvant- ja klassikalise võrdluse arvutuslik tuum. Liik <c6/> kasutab sama kiirendusmõõturit läbi <c7/> ja <c8/> kannab piiritletud (parim, nominaalne, konservatiivne) parameetrilehte, igale arvule oma viide.

# text
seg-e2acbef44395 = Mida välised kontrollid näitavad.

# text
# c1: tests/quantum_inertial_sensor_reference.rs
# c2: k_eff
# c3: |2Ω×v|
seg-353a2b2e1434 = <c1/> kontrollib ülekandefunktsiooni Cheineti tundlikkusfunktsiooni arvulise ajaruumi integraali vastu, <c2/> avaldatud joonte lainepikkuste vastu ja Coriolisi nihet <c3/> vastu — avaldatud kujude täpsed kokkulangevused. Kildmüra põhi on ühepoolne piire: Peters jt { "2001" } tseesiumgravimeetri ja Freier jt { "2016" } GAIN-i rubiidiumgravimeetri (arXiv:{ "1512.05660" }) avaldatud parameetrite korral asub modelleeritud põhi saavutatud müraga võrdsel või sellest madalamal tasemel ja kolme suurusjärgu piires (GAIN-i puhul on põhi { "1.53" }×{ "10" }⁻⁹ m/s²/√Hz saavutatud { "9.6" }×{ "10" }⁻⁸ vastu, tegur umbes { "63" }). See on kooskõlas sellega, et reaalseid seadmeid piirab vibratsioon või tehnilised põhjused, kuid see on piire, mitte instrumendi mürarmudeli valideerimine, seega jääb maatriksirida MODELLED.

# text
# c1: cai_drift_sweep
seg-82dffa95c0e8 = Allesjäänud järeltööd on lainefrondi/kiire sihtimise süstemaatilised mõjud, vöötmetähenduslikkuse lahendamine, CARIOQA-PMP Monte Carlo ja Boeingu/AOSense'i GPS-ita (GPS: globaalne positsioneerimissüsteem) lennukatse eelarvete arvuliselt täpne reprodutseerimine (mis vajavad avaldatud platvormi PSD-sid ja ühe laksu SNR-i, signaali ja müra suhet) ning kvant- ja klassikalise võrdluse eelseade brauseri mänguväljakul faili <c1/> peal.

# text
seg-2452f58aedf0 = <s1>Eelmine</s1>Kvantandurite mudelid

# text
seg-206d5a9704f0 = <s1>Järgmine</s1>Python API
