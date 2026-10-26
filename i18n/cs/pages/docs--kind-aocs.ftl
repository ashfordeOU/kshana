# docs--kind-aocs: translations (cs)

seg-99ef7c1d552c = Druh scénáře enginu v{ $version }, rodina <a1>Analýza misí, spoje a kosmické operace</a1>. Pouze poradní charakter: výstup analýzy z výzkumného a inženýrského nástroje; nejde o typově schválené navigační zařízení ani o službu z oblasti bezpečnosti života. Každý zdejší štítek je štítkem enginu nebo verifikační matice; druh je MODELLED, pokud matice neříká jinak (jak se štítek získává: oddíl Evidence v README).

seg-8f1e7d3f5a07 = Stránka rodiny: <a1>Analýza misí, spoje a kosmické operace</a1>

seg-5cd8b3d8c098 = Zdroj: <c1/>

seg-7f2ade997df5 = <c1/> (druh scénáře)

seg-7eff466eb018 = Řízení orientace kosmické lodi: inerciální zaměřovací otočení tuhého tělesa se třemi či více vyváženými reakčními koly při zpětné vazbě MRP (L = -K sigma - P omega), minimálně normové momenty kol omezené limitem každého motoru, RK4 s držením nultého řádu; volitelně uzavřené na multiplikativní EKF ze simulovaného gyroskopu (náhodná procházka úhlu a rychlosti) a hvězdného sledovače. Hlásí dobu ustálení, konečnou a špičkovou chybu zaměření, špičkovou rychlost a moment kol, nasycený podíl, drift momentu hybnosti a s estimátorem jeho chybu orientace a NEES. Smyčka skutečného stavu je VALIDATED proti Basilisk { "2.9.1" }; estimátor je MODELLED.

seg-a499721d08b1 = Jeden běh <c1/> se shrne takto: aocs: { "4" } wheels, { "600" } s slew from { "82.06" } deg -> settles below { "0.1" } deg at { "481.0" } s | final { "2.37e-2" } deg | peak wheel { "1797" } rpm | true-state loop

seg-2ad4d3f07a6a = Povinná pole: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>

seg-ed0c5c6266d9 = Volitelná pole: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>

seg-a09eb69b36d7 = Příklad <c1/> mimo jiné nastavuje:

seg-8b51cfcf5bd5 = N m

seg-6876b0214e4c = N m s

seg-8e4dea0df19e = kg m^{ "2" }

seg-51362910dcb7 = Tento druh používají { "2" } přibalené scénáře; ostatní jsou v <a1><c1/></a1>.

seg-b054c73f22e5 = žádná hodnota

seg-6e22c97374b0 = Štítek výsledku (enginu): VALIDATED řídicí zákon a dynamika kol (proti Basilisk { "2.9.1" } na smyčce skutečného stavu); vstupy tohoto běhu jsou vlastní vstupy scénáře — řízení orientace reakčními koly při zpětné vazbě MRP, inerciální zaměření, bez šumu senzorů, bez tření

seg-08c624d5324d = Graf, který engine zapisuje pro scenarios/aocs-slew.toml, druh aocs

seg-67fb8ac75f36 = MODELLED { "1" } · VALIDATED { "1" }: řádky <a1>verifikační matice</a1>, které tento druh jmenují.

seg-d69a588facf1 = <b>VALIDATED</b> Řízení orientace tuhého tělesa se třemi či více vyváženými reakčními koly při inerciálním zaměření: zákon zpětné vazby MRP L_r = -K sigma_BR - P omega_BR (Schaub a Junkins), minimálně normové momenty motorů kol G_s u = -L_r omezené na každého kola l Testy: <a1>aocs_basilisk_oracle.rs</a1>.

seg-7bc495b05d9a = <b>MODELLED</b> Multiplikativní EKF podle Leffertse, Markleyho a Shustera: stavy chyby orientace v souřadnicích tělesa a vychýlení gyroskopu, propagace s rychlostí gyroskopu zmenšenou o odhad vychýlení a Farrenkopfův diskrétní procesní šum (náhodná procházka úhlu a rychlosti), aktualizace hvězdným sledovačem

seg-7e3e0dcc936f = <b>VALIDATED</b> Řízení orientace tuhého tělesa se třemi či více vyváženými reakčními koly při inerciálním zaměření: zákon zpětné vazby MRP L_r = -K sigma_BR - P omega_BR (Schaub a J. Orákulum (ExternalDataset): Basilisk { "2.9.1" } (AVSLab, ISC; balíček bsk (wheel) běží jako samostatný nástroj, nikdy nelinkovaný ani přibalený): spacecraft hub, reactionWheelStateEffector (BalancedWheels, torque limit on), simpleNav, inertial3D, attTrackingError, mrpFeedback (bez integračního členu) a rwMotorTorque při dt = { "0.1" } s s jeho RK4, proti vlastní implementaci Kshany na třech případech (tři ortogonální kola; čtyřkolová pyramida; nasycující čtyřkolový případ),

seg-d7889856073b = <b>MODELLED</b> Multiplikativní EKF podle Leffertse, Markleyho a Shustera: stavy chyby orientace v souřadnicích tělesa a vychýlení gyroskopu, propagace s rychlostí gyroskopu zmenšenou o odhad vychýlení a Farre. Orákulum (InternalConsistency): vnitřní konzistence: normalizovaná kvadratická chyba odhadu filtru proti pravdě simulované z týchž modelů senzorů přes seedy Monte Carlo a konvergence odhadů orientace a vychýlení. CO NENÍ: nebyl porovnán žádný externí estimátor ani letová data (Basilisk { "2.9.1" } nemá modul MEKF); modely senzorů jsou učebnicové, bez nesouososti, chyby měřítka či efektů zorného pole hvězdného sledovače.

seg-3b71575e0c23 = Smyčka skutečného stavu je VALIDATED proti Basilisk { "2.9.1" }; estimátor je MODELLED. (katalog druhů (<c1/>))

seg-c7ff0ddbd040 = Multiplikativní odhad orientace EKF z gyroskopu a hvězdného sledovače je MODELLED, nikoli ověřen nezávislou referencí: zkontrolováno proti vlastní uzavřené / analytické identitě — zachytí chyby přepisu a koeficientů, ale není to externí orákulum. (verifikační matice (docs/MODELLED-RATIONALE.md))
