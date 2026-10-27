# docs--kind-entry-heating: translations (et)

# text
seg-b3a829cb7d84 = US Standard Atmosphere { "1976" }

# text
seg-99ef7c1d552c = Mootori v{ $version } stsenaariumi liik, perekond <a1>Missioonianalüüs, lingid ja kosmoseoperatsioonid</a1>. Nõuandev: uurimis- ja inseneeriatööriista analüüsitulemus; mitte tüübikinnitust omav navigatsiooniseade ega inimelu ohutusega seotud teenus. Iga siinne märgis on mootori või kontrollimaatriksi oma; liik on MODELLED, kui maatriks ei ütle teisiti (kuidas märgis teenitakse: README jaotis Evidence).

# text
seg-8f1e7d3f5a07 = Perekonna leht: <a1>Missioonianalüüs, lingid ja kosmoseoperatsioonid</a1>

# text
seg-67fb8ac75f36 = MODELLED { "1" } · VALIDATED { "1" }: selle liigi nimetavad <a1>kontrollimaatriksi</a1> read.

# text
seg-a44edb1eb84d = kg

# text
seg-8e62cc4af6ea = Teemaleht: <a1>ENTRY-EO-ASCENT.md</a1>

# text
seg-d72b4c5393e0 = earth

# text
# c1: docs/kinds/by-kind/entry-heating.md
seg-13b9e9187ab9 = Allikas: <c1/>

# text
# c1: entry-heating
seg-3a3f732cc2dd = <c1/> (stsenaariumi liik)

# text
seg-b843e2e0a4ee = 3-DoF punktmassi atmosfääri sisenemine üle pöörleva sfäärilise Maa või Marsi (ballistiline või tõstejõuga konstantse kreeniga), RK4, läbi US76, eksponentsiaalse või Marsi atmosfääri, Sutton-Gravesi stagnatsioonipunkti konvektiivse kuumenemisega (NASA TR R-376): tippviivitus, soojusvoog ja dünaamiline rõhk, soojuskoormus, horisontaalkaugus, pöörleva süsteemi energiakontroll ja Allen-Eggersi suletud kuju selle kõrval. Tippviivitust kontrollitakse avaldatud Stardusti nominaali vastu; kuumenemine on MODELLED.

# text
# c1: scenarios/entry-heating-stardust.toml
seg-05c8dac8d411 = Ühe <c1/> jooksu kokkuvõte: entry-heating (earth): V_rel { "12551" } m/s, γ { "8.43" }° -> tipp { "35.4" } g kõrgusel { "54.2" } km, tipp q { "746" } W/cm² kõrgusel { "62.0" } km, soojuskoormus { "20970" } J/cm², tipp q_dyn { "20.8" } kPa; lõppkõrgus ajal { "317" } s (suletud kuju { "60.2" } g; MODELLED 3-DoF, kiirguslik/TPS puudub)

# text
# c1: body
# c2: atmosphere
# c3: rho0_kg_m3
# c4: scale_height_m
# c5: entry_interface_altitude_m
# c6: velocity_frame
# c7: entry_speed_m_s
# c8: flight_path_angle_deg
# c9: heading_deg
# c10: latitude_deg
# c11: longitude_deg
# c12: mass_kg
# c13: drag_coefficient
# c14: reference_area_m2
# c15: nose_radius_m
# c16: lift_to_drag
# c17: bank_angle_deg
# c18: rotating_planet
# c19: step_s
# c20: terminal_altitude_m
# c21: max_time_s
seg-96504cafb034 = Valikulised väljad: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>, <c19/>, <c20/>, <c21/>

# text
# c1: scenarios/entry-heating-stardust.toml
seg-1b68d973fd30 = Näide <c1/> määrab muu hulgas:

# text
seg-05ce408c2dbb = kg/m^{ "2" }

# text
seg-1a89d87a48a5 = NACA Report { "1381" } ({ "1958" }) ballistilised konstan

# text
seg-3159fc595ac9 = kg/m^{ "3" }

# text
seg-2721e146b7be = Tulemuse silt (mootori oma): MODELLED — 3-DoF punktmassi sisenemine üle pöörleva sfäärilise planeedi (tsentraalne gravitatsioon, J2 puudub), kaaspöörlev tuuleta atmosfäär, konstantsed C_D, L/D ja kreen, RK4; konvektiivne stagnatsioonipunkti kuumenemine NASA TR R-376 ({ "1971" }) järgi, külm sein, EI KIIRGUSLIKKU kuumenemist, EI TPS/ablatsioonireaktsiooni, MITTE 6-DoF

# attr:alt
seg-dbb618cd6357 = Diagramm, mille mootor kirjutab failile scenarios/entry-heating-stardust.toml, liik entry-heating

# text
seg-e73b339df97b = <b>VALIDATED</b> 3-DoF punktmassi sisenemine üle pöörleva sfäärilise Maa läbi USA standardatmosfääri { "1976" }, integreeritud RK4-ga inertsiaalsest sisenemisolekust, annab tippviivituse ja selle kõrguse; planeedi suhtes sisenemisolek alates i Testid: <a1>entry_stardust_published.rs</a1>.

# text
seg-10124432b79b = <b>MODELLED</b> Stagnatsioonipunkti konvektiivne soojusvoog q = k sqrt(rho/R_n) V^{ "3" } Sutton-Gravesi konstantidega Maa õhu ja Marsi atmosfääri jaoks (NASA TR R-376, { "1971" }), selle tipp ja integreeritud soojuskoormus piki 3-DoF sisenemist, ballistilist või tõstejõuga c Testid: <a1>entry_stardust_published.rs</a1>.

# text
seg-54d133781215 = <b>VALIDATED</b> 3-DoF punktmassi sisenemine üle pöörleva sfäärilise Maa läbi USA standardatmosfääri { "1976" }, integreeritud RK4-ga inertsiaalsest sisenemisolekust, andes. Sõltumatu etalon (ExternalDataset): Stardusti nominaal, autorid Desai, Mitcheltree ja Cheatwood ({ "1999" }, NASA NTRS { "20050042027" }): maksimaalne viivitus { "33.4" } g kiirusel { "12.6" } km/s planeedi suhtes { "45.8" } kg stardimassiga, 6-DoF POST trajektoor täieliku aerodünaamilise andmebaasiga; sisenemisliides Desai, Lyonsi, Tooley ja Kangase järgi (NTRS { "20090004445" }): raadius { "6503.14" } km, inertsiaalne { "12.9" } km/s nurga -8.2 kraadi all. Läved eelregistreeritud failis xval/entry-stardust/PREREGISTRATION.

# text
seg-03878684f9a1 = <b>MODELLED</b> Stagnatsioonipunkti konvektiivne soojusvoog q = k sqrt(rho/R_n) V^{ "3" } Sutton-Gravesi konstantidega Maa õhu ja Marsi atmosfääri jaoks (NASA TR R-376, { "1971" }), selle . Sõltumatu etalon (InternalConsistency): Sisemine kooskõla: seos ja konstandid, nagu need on trükitud NASA TR R-376-s, poolsammu koondumiskontroll ning kuumenemise ja viivituse tippude oodatav järjestus. MIS EI OLE: ühtegi avaldatud kuumenemisväärtust ei ole võrreldud (Stardusti artiklid annavad projekteerimispiiri ja konvektiiv-pluss-kiirgusliku hinnangu umbes { "1200" } W/cm2, mida ainult konvektiivne seos ei suuda saavutada); kiirguslikku kuumenemist, seina temperatuuri ega

# text
# c1: label
seg-a0f300b2ce78 = MODELLED — 3-DoF punktmassi sisenemine üle pöörleva sfäärilise planeedi (tsentraalne gravitatsioon, J2 puudub), kaaspöörlev tuuleta atmosfäär, konstantsed C_D, L/D ja kreen, RK4; konvektiivne stagnatsioonipunkti kuumenemine NASA TR R-376 ({ "1971" }) järgi, külm sein, EI KIIRGUSLIKKU kuumenemist, EI TPS/ablatsioonireaktsiooni, MITTE 6-DoF (tulemus <c1/>)

# text
# c1: kshana kinds --json
seg-47f81ab160cc = Tippviivitust kontrollitakse avaldatud Stardusti nominaali vastu; kuumenemine on MODELLED. (liikide kataloog (<c1/>))

# text
seg-47cda83af127 = Sisenemisliides raadiusel { "6503.14" } km, inertsiaalne { "12.9" } km/s nurga -8.2 kraadi all, { "45.8" } kg, { "0.811" } m läbimõõt, { "0.2202" } m ninaraadius (Desai et al., NASA NTRS { "20050042027" } ja { "20090004445" }). Laiuskraad ja suund on eeldatav ligikaudne sisenemine Vaikse ookeani kohal; C_D on mooduli { "60" } kraadi sfäär-koonuse vaikeväärtus. Avaldatud 6-DoF nominaalne tippviivitus: { "33.4" } g. Kuumenemine on ainult Sutton-Gravesi konvektiivne, MODELLED. (stsenaariumifaili kommentaar, read { "4" } kuni { "8" })

# text
seg-98af076be1ac = Stagnatsioonipunkti konvektiivne sisenemiskuumenemine (Sutton-Graves) 3-DoF sisenemisel on MODELLED, mitte valideeritud: kontrollitud oma suletud kujul / analüütilise samasuse vastu — tabab ülekirjutus- ja koefitsiendivigu, kuid ei ole väline sõltumatu etalon. (kontrollimaatriks (docs/MODELLED-RATIONALE.md))

# text
seg-77c073cd5d67 = <s1>Eelmine</s1>earth-gnss-lunar

# text
seg-20ce5d56783c = <s1>Järgmine</s1>eo-coverage
