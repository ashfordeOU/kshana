# docs--kind-attitude-budget: translations (et)

# text
seg-99ef7c1d552c = Mootori v{ $version } stsenaariumi liik, perekond <a1>Missioonianalüüs, lingid ja kosmoseoperatsioonid</a1>. Nõuandev: uurimis- ja inseneeriatööriista analüüsitulemus; mitte tüübikinnitust omav navigatsiooniseade ega inimelu ohutusega seotud teenus. Iga siinne märgis on mootori või kontrollimaatriksi oma; liik on MODELLED, kui maatriks ei ütle teisiti (kuidas märgis teenitakse: README jaotis Evidence).

# text
seg-37d29d8303fe = km

# text
seg-8f1e7d3f5a07 = Perekonna leht: <a1>Missioonianalüüs, lingid ja kosmoseoperatsioonid</a1>

# text
seg-3068552e4ab4 = VALIDATED: selle liigi nimetavad <a1>kontrollimaatriksi</a1> read.

# text
# c1: docs/kinds/by-kind/attitude-budget.md
seg-40ca4197150b = Allikas: <c1/>

# text
# c1: attitude-budget
seg-a271f371a3cf = <c1/> (stsenaariumi liik)

# text
seg-62c0dda9fc56 = 3-DOF asendi ja suunamisvea eelarve: halvima juhu gravitatsioonigradiendi häiringumoment ((3/2)(μ/R³)ΔI) ja nimetatud 1σ panustajate (sensorimüra, reaktsiooniratta värin, termiline, joondus) ruutsumma-ruutjuur suunamisvea eelarve koos domineeriva liikmega orbiidi kõrguse + keha inertsihälbe jaoks. MODELLED skalaarne AOCS-i eelarve — riistvaraeelne täiendus Basilisk/42-le, mitte juhtimisahela / 6-DoF / paindemoodi simulatsioon.

# text
# c1: scenarios/attitude-budget.toml
seg-9fdc45a8aaa3 = Ühe <c1/> jooksu kokkuvõte: attitude-budget: { "600" } km, ΔI { "40" } kg·m² -> GG-moment { "7.04e-5" } N·m; suunamine { "10.7" }" RSS (domineeriv: reaction_wheel_jitter) (MODELLED skalaareelarve)

# text
# c1: altitude_km
# c2: i_max_kg_m2
# c3: i_min_kg_m2
# c4: contributors
seg-7cf112b1bcc3 = Valikulised väljad: <c1/>, <c2/>, <c3/>, <c4/>

# text
# c1: scenarios/attitude-budget.toml
seg-91ebbc89f9bb = Näide <c1/> määrab muu hulgas:

# text
seg-c33e3cbba749 = kaaresekundit

# text
seg-36df1bc710ab = joondus

# text
seg-d45f0ee66587 = kg*m^{ "2" }

# text
seg-3e3ce4fa89aa = N*m

# text
seg-0a78a7d6f93f = Tulemuse silt (mootori oma): MODELLED — skalaarne 3-DOF AOCS-i veaeelarve: gravitatsioonigradiendi halvima juhu häiringumoment + RSS-suunamiseelarve; MITTE juhtimisahela / 6-DoF / paindemoodi simulatsioon (riistvaraeelne täiendus Basilisk/42-le, mitte asendus)

# attr:alt
seg-ad0e72e3b688 = Diagramm, mille mootor kirjutab failile scenarios/attitude-budget.toml, liik attitude-budget

# text
seg-95b159fb5e68 = <b>VALIDATED</b> Gravitatsioonigradiendi halvima juhu häiringumoment ((3/2)(μ/R³)ΔI) asendi üle tipuna (valideeritud väide), pluss RSS-suunamisvea eelarve nimetatud 1σ panustajate üle koos domineeriva liikmega (kutsuja antud arvude ruutsumma Testid: <a1>attitude_gg_torque_reference.rs</a1>.

# text
seg-f7c8d8994896 = <b>VALIDATED</b> Gravitatsioonigradiendi halvima juhu häiringumoment ((3/2)(μ/R³)ΔI) asendi üle tipuna (valideeritud väide), pluss RSS-suunamisvea eelarve nimetatud 1σ . Oraakel (sõltumatu etalon) (ExternalDataset): Basilisk { "2.9.1" } GravityGradientEffector (AVSLab, ISC), täistensori gravitatsioonigradiendi momendi sõltumatu C++ teostus: Kshana tipp (3/2)(μ/R³)ΔI võrdub Basiliski momendiga { "45" } kraadi asendi juures suhtelise täpsusega { "1e-12" } (halvim { "2.1e-15" }) { "5" } kõrguse ja { "8" } inertsitensori üle ning piirab Basiliski momenti { "2000" } juhusliku asendi üle juhu kohta; tolerants fikseeritud enne võrdlust. Valideeritud väide: gravity-

# text
seg-d2a6cf813e95 = <b>PARTNER</b> Ei paku — Kshana on navigatsioonitulemuslikkuse simulaator, mitte platvormitootja. Oraakel (sõltumatu etalon) (NoneKind): puudub: partneri vastutusala, kujundatud nii, et mooduli ega testi ei ole

# text
# c1: label
seg-3895121a5466 = MODELLED — skalaarne 3-DOF AOCS-i veaeelarve: gravitatsioonigradiendi halvima juhu häiringumoment + RSS-suunamiseelarve; MITTE juhtimisahela / 6-DoF / paindemoodi simulatsioon (riistvaraeelne täiendus Basilisk/42-le, mitte asendus) (tulemus <c1/>)

# text
# c1: kshana kinds --json
seg-f62458cae23b = MODELLED skalaarne AOCS-i eelarve — riistvaraeelne täiendus Basilisk/42-le, mitte juhtimisahela/6-DoF/paindemoodi simulatsioon. (liikide kataloog (<c1/>))

# text
seg-333fca11ac0c = ÕIGLANE ULATUS: MODELLED skalaarne veaeelarve -- riistvaraeelne täiendus Basilisk/42-le, MITTE juhtimisahela / 6-DoF / paindemoodi simulatsioon. Gravitatsioonigradiendi liige on esitatud momendina (selle teisendamine suunamiseks vajab juhtimisjäikust, mis kuulub kutsujale); eelarve on antud 1-sigma panustajate ruutsumma. Käivitus: kshana scenarios/attitude-budget.toml (stsenaariumifaili kommentaar, read { "8" } kuni { "13" })

# text
seg-0e27fcef1499 = <s1>Eelmine</s1>ascent-losses

# text
seg-946c453cbf0f = <s1>Järgmine</s1>body-pnt
