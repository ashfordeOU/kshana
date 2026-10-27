# docs--quantum-models: translations (et)

# text
seg-638b8d451550 = Sensor

# text
seg-c35a20fa2529 = Küpsus

# text
# c1: docs/QUANTUM-MODELS.md
seg-2f51722ab9d4 = Allikas: <c1/>

# text
seg-39ab7752d86d = Kvantandurite mudelid: mida Kshana modelleerib ja mida mitte

# text
seg-daf0e0c0b16f = Kshana on <b>PNT-vastupidavuse (PNT: positsioneerimine, navigatsioon ja aeg) simulaator kvantandurite toimivusmudelitega</b>. See <em>ei ole</em> esimestest printsiipidest lähtuv kvantfüüsika simulaator. See leht ütleb täpselt, mida see tähendab, et sõna „kvant“ ei saaks käsitleda enamana kui see on.

# text
seg-6e504d97c41e = Mida modelleeritakse

# text
seg-7884c9a7d883 = Iga kvant- (ja klassikaline) andur on <b>veamudel</b>, mida juhivad avaldatud müra-eelarve parameetrid:

# text
# c1: ClockClass
# c2: VALIDATION.md
# c3: VERIFICATION-MATRIX.md
seg-cad22f39d579 = <b>Kellad</b> — valgesageduse ja juhusliku sagedushulkumise PSD-d (võimsusspektritihedused), flicker (1/f) Alani põhi ja lineaarne triiv, mille allikaks on andmelehed ja artiklid: CSAC (kiibimõõtmeline aatomkell) Microchip SA.45s; Origlia jt strontsiumi optilise võre kell (arXiv:{ "1503.08457" }), kosmosele suunatud eesmärk; ja kuus <c1/> vaikeväärtust (CSAC; USO, ülistabiilne ostsillaator; DSAC, sügavkosmose aatomkell; TCXO, temperatuurikompenseeritud kvartsostsillaator; OCXO, ahjuga kontrollitud kvartsostsillaator; RAFS, rubiidiumi aatomsageduse etalon), igaüks viitab ühele allikale. Nende antud Alani hälvet on valideeritud standardsete müratüüpide kallete vastu (vt <a1><c2/></a1>). Üks optilise kella kõver on tegelik: Norcia jt mõõdetud ⁸⁸Sr pintsettkella Alani hälve (<em>Science</em> { "2019" }) on müra sobitusega reprodutseeritud, VALIDATED rida dokumendis <a2><c3/></a2>; optilisele klassile ehitatud holdover-i arvud jäävad MODELLED.

# text
# c1: inertial
# c2: gnss-ins
# c3: hybrid-ukf
# c4: src/inertial/
seg-13c3340e773b = <b>Inertsiaalandurid</b> — pakettides <c1/> ja hübriid üheteljeline (1-DOF, üks vabadusaste) kiirendusmõõturi/güroskoobi veaeelarve: kiiruse juhuslik hulkumine, nurga juhuslik hulkumine, kiirenduse juhuslik hulkumine ja Alani nihkestabiilsuse põhi. Liigid <c2/> ja <c3/> käitavad selle asemel kolmeteljelist strapdown-mehhaniseeringut kohas <c4/> (kvaternioonasend, põhi-ida-alla navigatsioonivõrrandid, deterministlik IMU veamudel).

# text
# c1: quantum-trade
# c2: quantum-time-transfer
# c3: quantum-anomaly-detect
# c4: quantum-gnss-free-nav
# c5: hybrid-ukf
# c6: quantum-time-transfer
# c7: quantum-anomaly-detect
# c8: quantum-gnss-free-nav
seg-f361d586b348 = Kvantstsenaariumi liigid — <c1/>, <c2/>, <c3/>, <c4/> ja <c5/> — on ehitatud nendest veamudelitest ja on MODELLED; <c6/>, <c7/> ja <c8/> annavad lisaks representatiivsuse kirje lendamiseni jäävate lünkadega.

# text
seg-05bbaddd4df6 = Mootor on <b>neutraalne</b>: „kvant“ ja „klassikaline“ on sama koodirada erinevate koefitsientidega. Kontrast headusarvudes tuleb täielikult sisendmüra parameetritest, millest igaüks on jälgitav tsiteeritud allikani.

# text
seg-a1a067588520 = Mida EI modelleerita

# text
seg-49a656243210 = Kellade ja aja edastamise andurite puhul ei simuleerita mingit aluseks olevat kvantfüüsikat — ainult Alani netopanus, mis antakse koefitsiendina. <b>Külmaatomi kiirendusmõõturi</b> jaoks on nüüd olemas esimestest printsiipidest lähtuv kiht (vt allpool); ülejäänud süstemaatilised mõjud on endiselt koefitsiendi tasemel või modelleerimata:

# text
# c1: Φ = k_eff·a·T²
# c2: σ_Φ = 1/(C·√N)
# c3: |H(ω)| = (4/ω²)sin²(ωT/2)
# c4: σ_Φ² = k_eff²·S_a·T³/3
# c5: src/inertial/quantum_imu.rs
# c6: q_va
# c7: a_max = π/(k_eff·T²)
# c8: QUANTUM.md
seg-844e65d52572 = aatominterferomeetri <b>Mach–Zehnderi faas</b> (<c1/>), <b>kvantprojektsiooni- / kildmüra</b> (<c2/>), interferomeetri <b>kontrasti</b> vähenemine, <b>tsükliaeg</b> ja <b>vibratsioonisidestuse ülekandefunktsioon</b> (<c3/>, valge PSD dispersioon <c4/>) <em>on nüüd modelleeritud esimestest printsiipidest</em> CAI (külmaatomi interferomeeter) kiirendusmõõturi jaoks (<c5/>), tuletades klassikalise mudeli tarbitava valge kiirenduse PSD <c6/> koos <b>vöötmetähenduslikkuse dünaamilise ulatusega</b> (<c7/>) — vt <a1><c8/></a1>;

# text
# c1: coriolis_phase
# c2: coriolis_accel_bias
# c3: 2·v⊥·Ω
# c4: ac_stark_phase
# c5: src/inertial/quantum_imu.rs
seg-71a782041b89 = <b>Coriolisi</b> süstemaatiline mõju (<c1/> / <c2/>, ristsidestus <c3/>) ja <b>AC-Starki (AC: vahelduvvool) / valgusnihke</b> süstemaatiline mõju (<c4/>, mis kaob sümmeetrilise kahefootoni häälestuse korral) <em>on nüüd modelleeritud ja ühikutestitud</em> failis <c5/>;

# text
# c1: src/inertial/cai_error_terms.rs
seg-00c510117abc = veel kolm CAI veaterminit <em>on nüüd modelleeritud</em> teegifunktsioonidena failis <c1/> ({ "0.36" }; MODELLED; pole veel stsenaariumi liigist kättesaadavad):

# text
# c1: σ_Φ² = (π/2)²·S_φ⁰/τ_R
# c2: t_d = 2L/c
seg-fcaf6ff00974 = <b>Ramani laserfaasimüra</b>: Cheineti jt ({ "2008" }) tundlikkusfunktsiooni kaalumine, valem { "8" }, valge faasimüra kinnise kujuga <c1/> (valem { "18" } ühe tsükli korral) ja arvulise teega mis tahes faasimüra spektri jaoks, pluss laseri sagedusmüra, mida tagasipeegelduse viivitus <c2/> ei tühista (Le Gouët jt { "2007" }, valemid { "9" } kuni { "11" });

# text
# c1: δg = σ_v²/R
# c2: R
seg-6e2236c81db8 = <b>lainefrondi kõverus</b> (ainult puhas defookus): termilise pilve nihe <c1/> kõverusraadiusega <c2/> kiirel ning selle vähenemine, kui loetakse ainult detekteerimisraadiuse sees olevaid aatomeid (Louchet-Chauveti jt { "2011" } ja Schkolniki jt { "2015" } järgi); kõrgema järgu aberratsioone ei modelleerita;

# text
# c1: erfc(π/(√2·s))
seg-92295ad17228 = <b>vöötmetähenduslikkuse lahendamine</b>: vale vööndiindeksi tõenäosus <c1/> klassikalise kiirendusmõõturi abi puhul (Lautier jt { "2014" }) ja kahe küsitlusaja puhul (Bonnini jt { "2018" } järgi), pöördfunktsiooniga, mis annab suurima klassikalise müra antud rikketõenäosuse korral.

# text
# c1: τ_R
seg-f383678fb806 = Iga kinnist kuju kontrollitakse sõltumatu arvulise tee (sagedusruumi kvadratuur või Monte Carlo aatomite või laskude üle) ja selle piirjuhtude vastu. Ainus avaldatud reprodutseeritud arv on Cheineti jt valge faasimüra tase: −{ "111" } dB·rad²/Hz juures <c1/> = { "20" } µs annab umbes { "1" } mrad laksu kohta ({ "0.99" } mrad; artikkel tuletab selle taseme oma valemiga { "17" }, flicker pluss valge). Miski sellest ei ole ühegi instrumendi mõõtmine;

# text
seg-150f8b9dfea4 = endiselt <b>ei</b> modelleerita: kõrgema järgu lainefrondi aberratsioone, konkreetse lasersüsteemi faasimüra ja kellapoolset esimestest printsiipidest füüsikat;

# text
# c1: inertial
# c2: gnss-ins
# c3: hybrid-ukf
# c4: VALIDATION.md
seg-643109601eba = kvant- ja klassikalise <c1/> pakett on üheteljeline; kolmeteljeline strapdown-rada töötab ainult liikides <c2/> ja <c3/> (vt IMU, inertsiaalmõõteseadme, märkust failis README ja <a1><c4/></a1>).

# text
# c1: ROADMAP.md
seg-1ff01ab9f92d = Kvantfüüsika kihi lõpuleviimine (CAI veaterminite kättesaadavaks tegemine stsenaariumi liigist, kõrgema järgu lainefrondi aberratsioonid ja kellapoolne esimestest printsiipidest füüsika) on faili <c1/> järele jäänud P2 töö.

# text
seg-f09a31b33faa = Maalaboratooriumi ja lennukõlbulikud arvud

# text
seg-dcef4579d2a9 = Parameetritabelid segavad küpsustasemeid; käsitlege neid vastavalt:

# text
seg-4f25895df32f = Allika arv

# text
seg-cef61e912cd0 = CSAC (nt SA.45s)

# text
seg-4a016be9bca9 = andmelehe σ_y({ "1" } s) ≈ { "3e-10" }

# text
seg-38cc72b2405c = <b>kasutusel</b> olev kaubanduslik osa (olemas on kiirguskindlad kosmosevariandid)

# text
seg-d38d20629ed6 = Strontsiumi optilise võre kell

# text
seg-1f0d3ec00922 = σ_y({ "1" } s) eesmärk ≈ { "1e-15" } (arXiv:{ "1503.08457" })

# text
seg-1496e0c42086 = <b>maalaboratoorne</b> — Kshana ei tea ühestki avaldatud orbiidil saavutatud toimivusest

# text
seg-ce1d7994188b = Külmaatomi kiirendusmõõtur

# text
seg-b07fa6b8cebc = avaldatud laboratoorsed Alani arvud

# text
seg-60864f168701 = maalaboratoorne / sondeerimisrakett

# text
seg-84a68aeb467d = Optilise kella arvud Kshanas on <em>kosmosele seatud eesmärgid maapealsel riistvaral</em>. Lennanud optilist kella ei ole; README ja tulemuse päritolu ütlevad seda sõnaselgelt.

# text
seg-a204c1b854fa = Võrdlusalus: ACES/PHARAO ISS-il (töös alates aprillist { "2025" })

# text
seg-fb88de1257bd = ESA (Euroopa Kosmoseagentuur) <b>ACES/PHARAO</b> kasulik koorem (ACES: Atomic Clock Ensemble in Space; PHARAO: Projet d'Horloge Atomique par Refroidissement d'Atomes en Orbite) — lasertjahutatud tseesiumkell pluss aktiivne vesinikmaser, mis töötab ISS-il (rahvusvaheline kosmosejaam) alates aprillist { "2025" } — on praegune töötav orbiidil kella stabiilsuse võrdlusalus (sihtmurdstabiilsus suurusjärgus { "1e-16" } mõne päeva integreerimise järel). Kshana optilise kella mudel esindab <em>agressiivsemat</em> maalaboratoorset eesmärki kui ACES-i lennanud tseesiumi/masseri toimivus; kui võrrelda Kshana optilisi arve sellega, „mis on tegelikult lennanud“, on ACES/PHARAO aus võrdluspunkt ja see on mikrolaine-/maserisüsteem, mitte optilise võre kell.

# text
seg-9d2e850cb986 = ACES-i täpsed orbiidil saavutatud toimivusarvud tuleks tsiteerida ESA avaldatud tulemustest, kui need välja tulevad; siinse punkti mõte on <em>küpsuslõhe</em>, mitte konkreetne arv — Kshana optilised arvud on eesmärgid, mitte lennanud toimivus.

# text
# c1: VALIDATION.md
# c2: validated
# c3: not modeled
seg-4b373686adf8 = <a1><c1/></a1> — parameetripõhised sildid <c2/> / <c3/>.

# text
# c1: GLOSSARY.md
seg-3f0c1048aea9 = <a1><c1/></a1> — headusarvu (FoM) definitsioonid ja kõik lühendid.

# text
# c1: INTEGRITY.md
seg-a360cd4997e2 = <a1><c1/></a1> — mis on ja mis ei ole terviklikkuse ja turvalisuse FoM-id.

# text
# c1: QUANTUM.md
seg-0ac025397b23 = <a1><c1/></a1> — esimestest printsiipidest lähtuv külmaatomi kiirendusmõõtur.

# text
seg-41ba2c8f70fe = <s1>Eelmine</s1>Konstellatsiooni kavandamine

# text
seg-136fa589fed5 = <s1>Järgmine</s1>Külmaatomi interferomeeter
