# docs--quantum-models: translations (cs)

seg-638b8d451550 = Senzor

seg-c35a20fa2529 = Vyspělost

# c1: docs/QUANTUM-MODELS.md
seg-2f51722ab9d4 = Zdroj: <c1/>

seg-39ab7752d86d = Modely kvantových senzorů: co Kshana modeluje a co ne

seg-daf0e0c0b16f = Kshana je <b>simulátor odolnosti PNT (PNT: určování polohy, navigace a času) s modely výkonu kvantových senzorů</b>. <em>Není</em> simulátorem kvantové fyziky z prvních principů. Tato stránka přesně říká, co to znamená, aby se označení „kvantový“ nedalo chápat jako víc, než je.

seg-6e504d97c41e = Co JE modelováno

seg-7884c9a7d883 = Každý kvantový (i klasický) senzor je <b>chybový model</b> řízený publikovanými parametry rozpočtu šumu:

# c1: ClockClass
# c2: VALIDATION.md
# c3: VERIFICATION-MATRIX.md
seg-cad22f39d579 = <b>Hodiny</b> — PSD (výkonové spektrální hustoty) bílého šumu frekvence a náhodné procházky frekvence, flicker (1/f) hranice Allanovy odchylky a lineární drift, z datových listů a prací: CSAC (čipové atomové hodiny) Microchip SA.45s; stronciové hodiny v optické mřížce od Origlia et al. (arXiv:{ "1503.08457" }), cíl pro použití ve vesmíru; a šest výchozích hodnot <c1/> (CSAC; USO, ultrastabilní oscilátor; DSAC, Deep Space Atomic Clock; TCXO, teplotně kompenzovaný krystalový oscilátor; OCXO, krystalový oscilátor v termostatu; RAFS, rubidiový atomový frekvenční normál), každá s citací jednoho zdroje. Allanova odchylka, kterou tyto hodnoty vytvářejí, je ověřena proti standardním sklonům typů šumu (viz <a1><c2/></a1>). Jedna křivka optických hodin je skutečná: naměřená Allanova odchylka ⁸⁸Sr tweezer-clock od Norcia et al. (<em>Science</em> { "2019" }) je reprodukována fitem šumu, řádek VALIDATED v <a2><c3/></a2>; hodnoty holdoveru postavené na optické třídě zůstávají MODELLED.

# c1: inertial
# c2: gnss-ins
# c3: hybrid-ukf
# c4: src/inertial/
seg-13c3340e773b = <b>Inerciální senzory</b> — v balíčcích <c1/> a hybridních jednoosý (1-DOF, jeden stupeň volnosti) rozpočet chyb akcelerometru/gyroskopu: náhodná procházka rychlosti, náhodná procházka úhlu, náhodná procházka zrychlení a hranice nestability biasu podle Allana. Druhy <c2/> a <c3/> naproti tomu provozují třísosou strapdown mechanizaci v <c4/> (kvaternionová orientace, navigační rovnice sever–východ–dolů, deterministický chybový model IMU).

# c1: quantum-trade
# c2: quantum-time-transfer
# c3: quantum-anomaly-detect
# c4: quantum-gnss-free-nav
# c5: hybrid-ukf
# c6: quantum-time-transfer
# c7: quantum-anomaly-detect
# c8: quantum-gnss-free-nav
seg-f361d586b348 = Kvantové druhy scénářů — <c1/>, <c2/>, <c3/>, <c4/> a <c5/> — jsou postaveny z těchto chybových modelů a jsou MODELLED; <c6/>, <c7/> a <c8/> navíc vykazují záznam reprezentativnosti s mezerami do letu.

seg-05bbaddd4df6 = Engine je <b>neutrální</b>: „kvantový“ a „klasický“ jsou tatáž cesta kódu s různými koeficienty. Kontrast v ukazatelích kvality plyne výhradně ze vstupních parametrů šumu, z nichž každý je dohledatelný k citovanému zdroji.

seg-a1a067588520 = Co NENÍ modelováno

seg-49a656243210 = U senzorů hodin a přenosu času se žádná z podkladové kvantové fyziky nesimuluje — jen čistý příspěvek k Allanově odchylce, dodaný jako koeficient. Pro <b>akcelerometr z chladných atomů</b> nyní existuje vrstva z prvních principů (viz níže); zbylé systematické jevy jsou stále na úrovni koeficientů nebo nemodelovány:

# c1: Φ = k_eff·a·T²
# c2: σ_Φ = 1/(C·√N)
# c3: |H(ω)| = (4/ω²)sin²(ωT/2)
# c4: σ_Φ² = k_eff²·S_a·T³/3
# c5: src/inertial/quantum_imu.rs
# c6: q_va
# c7: a_max = π/(k_eff·T²)
# c8: QUANTUM.md
seg-844e65d52572 = <b>fáze Machova–Zehnderova</b> atomového interferometru (<c1/>), <b>kvantový projekční šum / shot noise</b> (<c2/>), pokles <b>kontrastu</b> interferometru, <b>doba cyklu</b> a <b>přenosová funkce vazby vibrací</b> (<c3/>, rozptyl při bílé PSD <c4/>) <em>jsou nyní modelovány z prvních principů</em> pro akcelerometr CAI (atomový interferometr z chladných atomů) (<c5/>), z nichž se odvozuje PSD bílého zrychlení <c6/>, které klasický model spotřebovává, spolu s <b>dynamickým rozsahem nejednoznačnosti proužků</b> (<c7/>) — viz <a1><c8/></a1>;

# c1: coriolis_phase
# c2: coriolis_accel_bias
# c3: 2·v⊥·Ω
# c4: ac_stark_phase
# c5: src/inertial/quantum_imu.rs
seg-71a782041b89 = <b>Coriolisův</b> systematický jev (<c1/> / <c2/>, křížová vazba <c3/>) a <b>AC-Starkův (AC: střídavý proud) / light-shift</b> systematický jev (<c4/>, který se při symetrickém dvoufotonovém rozladění ruší) <em>jsou nyní modelovány a testovány jednotkovými testy</em> v <c5/>;

# c1: src/inertial/cai_error_terms.rs
seg-00c510117abc = tři další chybové členy CAI <em>jsou nyní modelovány</em> jako funkce knihovny v <c1/> ({ "0.36" }; MODELLED; zatím nejsou dosažitelné z druhu scénáře):

# c1: σ_Φ² = (π/2)²·S_φ⁰/τ_R
# c2: t_d = 2L/c
seg-fcaf6ff00974 = <b>fázový šum Ramanova laseru</b>: vážení citlivostní funkcí podle Cheinet et al. ({ "2008" }), rov. { "8" }, s uzavřeným tvarem pro bílý fázový šum <c1/> (rov. { "18" } pro jeden cyklus) a numerickou cestou pro libovolné spektrum fázového šumu, plus frekvenční šum laseru, který zpoždění zpětného odrazu <c2/> neruší (Le Gouët et al. { "2007" }, rov. { "9" } až { "11" });

# c1: δg = σ_v²/R
# c2: R
seg-6e2236c81db8 = <b>zakřivení vlnoplochy</b> (pouze čisté rozostření): bias <c1/> tepelného oblaku na svazku s poloměrem zakřivení <c2/> a jeho zmenšení, když se započítají jen atomy uvnitř detekčního poloměru (podle Louchet-Chauvet et al. { "2011" } a Schkolnik et al. { "2015" }); aberace vyššího řádu se nemodelují;

# c1: erfc(π/(√2·s))
seg-92295ad17228 = <b>řešení nejednoznačnosti proužků</b>: pravděpodobnost chybného indexu proužku, <c1/>, při podpoře klasickým akcelerometrem (Lautier et al. { "2014" }) a pro dvě doby interrogace (podle Bonnin et al. { "2018" }), s inverzí, která dává největší klasický šum pro stanovenou pravděpodobnost selhání.

# c1: τ_R
seg-f383678fb806 = Každý uzavřený tvar je kontrolován proti nezávislé numerické cestě (kvadratura ve frekvenční oblasti nebo Monte Carlo přes atomy či výstřely) a proti svým mezním případům. Jediné reprodukované publikované číslo je úroveň bílého fázového šumu podle Cheinet et al.: −{ "111" } dB·rad²/Hz při <c1/> = { "20" } µs dává asi { "1" } mrad na výstřel ({ "0.99" } mrad; práce tuto úroveň odvozuje svou rov. { "17" }, flicker plus bílý šum). Nic z toho není měřením žádného přístroje;

seg-150f8b9dfea4 = stále <b>nemodelováno</b>: aberace vlnoplochy vyššího řádu, fázový šum konkrétního laserového systému a fyzika z prvních principů na straně hodin;

# c1: inertial
# c2: gnss-ins
# c3: hybrid-ukf
# c4: VALIDATION.md
seg-643109601eba = balíček <c1/> pro srovnání kvantových a klasických technologií je jednoosý; třísosá strapdown cesta běží jen v <c2/> a <c3/> (viz poznámku o IMU, inerciální měřicí jednotce, v README a <a1><c4/></a1>).

# c1: ROADMAP.md
seg-1ff01ab9f92d = Dokončení vrstvy kvantové fyziky (zpřístupnění chybových členů CAI z druhu scénáře, aberace vlnoplochy vyššího řádu a fyzika z prvních principů na straně hodin) je zbývající práce P2 v <c1/>.

seg-f09a31b33faa = Hodnoty z pozemní laboratoře vs. letově kvalifikované

seg-dcef4579d2a9 = Tabulky parametrů míchají úrovně vyspělosti; berte je podle toho:

seg-4f25895df32f = Zdrojová hodnota

seg-cef61e912cd0 = CSAC (např. SA.45s)

seg-4a016be9bca9 = datový list σ_y({ "1" } s) ≈ { "3e-10" }

seg-38cc72b2405c = <b>nasazená</b> komerční součástka (existují varianty tolerantní vůči záření pro vesmír)

seg-d38d20629ed6 = Stronciové hodiny v optické mřížce

seg-1f0d3ec00922 = cíl σ_y({ "1" } s) ≈ { "1e-15" } (arXiv:{ "1503.08457" })

seg-1496e0c42086 = <b>pozemní laboratoř</b> — Kshana nezná žádný publikovaný výkon takových hodin na oběžné dráze

seg-ce1d7994188b = Akcelerometr z chladných atomů

seg-b07fa6b8cebc = publikované laboratorní hodnoty Allanovy odchylky

seg-60864f168701 = pozemní laboratoř / sondážní raketa

seg-84a68aeb467d = Hodnoty optických hodin v Kshaně jsou <em>cíle pro vesmír na pozemním hardwaru</em>. Žádné optické hodiny dosud nelétaly; README i původ výsledku to výslovně uvádějí.

seg-a204c1b854fa = Srovnávací měřítko: ACES/PHARAO na ISS (provozní od dubna { "2025" })

seg-fb88de1257bd = Užitečné zatížení <b>ACES/PHARAO</b> agentury ESA (Evropská kosmická agentura) (ACES: Atomic Clock Ensemble in Space; PHARAO: Projet d'Horloge Atomique par Refroidissement d'Atomes en Orbite) — cesiové hodiny chlazené laserem plus aktivní vodíkový maser, provozované na ISS (Mezinárodní kosmické stanici) od dubna { "2025" } — je současným provozním srovnávacím měřítkem stability hodin na oběžné dráze (cílová relativní stabilita řádu { "1e-16" } po několika dnech integrace). Model optických hodin v Kshaně představuje <em>ambicióznější</em> cíl pozemní laboratoře než letový výkon cesiových hodin/maseru ACES; při srovnávání optických čísel Kshany s tím, „co skutečně létalo“, je poctivým referenčním bodem ACES/PHARAO, a to je mikrovlnný systém/maser, nikoli hodiny v optické mřížce.

seg-9d2e850cb986 = Přesné hodnoty výkonu ACES na oběžné dráze je třeba citovat z publikovaných výsledků ESA, jakmile budou zveřejněny; jde zde o <em>propast ve vyspělosti</em>, nikoli o konkrétní číslo — optické hodnoty Kshany jsou cíle, nikoli letový výkon.

# c1: VALIDATION.md
# c2: validated
# c3: not modeled
seg-4b373686adf8 = <a1><c1/></a1> — označení <c2/> / <c3/> pro jednotlivé parametry.

# c1: GLOSSARY.md
seg-3f0c1048aea9 = <a1><c1/></a1> — definice ukazatelů kvality (FoM) a všechny zkratky.

# c1: INTEGRITY.md
seg-a360cd4997e2 = <a1><c1/></a1> — čím ukazatele kvality integrity a bezpečnosti jsou a nejsou.

# c1: QUANTUM.md
seg-0ac025397b23 = <a1><c1/></a1> — akcelerometr z chladných atomů z prvních principů.

seg-41ba2c8f70fe = <s1>Předchozí</s1>Návrh konstelací

seg-136fa589fed5 = <s1>Další</s1>Atomový interferometr z chladných atomů
