# docs--kind-aocs: translations (et)

# text
seg-99ef7c1d552c = Mootori v{ $version } stsenaariumi liik, perekond <a1>Missioonianalüüs, lingid ja kosmoseoperatsioonid</a1>. Nõuandev: uurimis- ja inseneeriatööriista analüüsitulemus; mitte tüübikinnitust omav navigatsiooniseade ega inimelu ohutusega seotud teenus. Iga siinne märgis on mootori või kontrollimaatriksi oma; liik on MODELLED, kui maatriks ei ütle teisiti (kuidas märgis teenitakse: README jaotis Evidence).

# text
seg-8f1e7d3f5a07 = Perekonna leht: <a1>Missioonianalüüs, lingid ja kosmoseoperatsioonid</a1>

# text
# c1: docs/kinds/by-kind/aocs.md
seg-5cd8b3d8c098 = Allikas: <c1/>

# text
# c1: aocs
seg-7f2ade997df5 = <c1/> (stsenaariumi liik)

# text
seg-7eff466eb018 = Kosmoseaparaadi asendijuhtimine: jäiga korpuse inertsiaalsuunatud pööre kolme või enama tasakaalustatud reaktsiooniratta abil MRP-tagasisides (L = -K sigma - P omega), minimaalse normiga ratta pöördemomendid, piiratud iga mootori piirini, RK4 nulljärgu hoidega; soovi korral suletud multiplikatiivsel EKF-il simuleeritud güroskoobist (nurga ja kiiruse juhuslik ekslemine) ja tähejälgijast. Annab settimisaja, lõpliku ja tippsuunamisvea, ratta tippkiiruse ja -pöördemomendi, küllastunud osakaalu, nurkmomendi triivi ning hindajaga selle asendivea ja NEES-i. Tegeliku oleku ahel on VALIDATED Basilisk { "2.9.1" } vastu; hindaja on MODELLED.

# text
# c1: scenarios/aocs-slew.toml
seg-a499721d08b1 = Ühe <c1/> jooksu kokkuvõte: aocs: { "4" } ratast, { "600" } s pööre { "82.06" } kraadi -> settib alla { "0.1" } kraadi ajal { "481.0" } s | lõpp { "2.37e-2" } kraadi | ratta tipp { "1797" } p/min | true-state loop

# text
# c1: hub_inertia_kg_m2
# c2: k_nm
# c3: p_nms
# c4: wheels
# c5: sigma0
seg-2ad4d3f07a6a = Kohustuslikud väljad: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>

# text
# c1: duration_s
# c2: dt_s
# c3: sample_s
# c4: omega0_rad_s
# c5: pointing_threshold_deg
# c6: estimator
seg-ed0c5c6266d9 = Valikulised väljad: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>

# text
# c1: scenarios/aocs-slew.toml
seg-a09eb69b36d7 = Näide <c1/> määrab muu hulgas:

# text
seg-8b51cfcf5bd5 = N m

# text
seg-6876b0214e4c = N m s

# text
seg-8e4dea0df19e = kg m^{ "2" }

# text
# c1: scenarios/
seg-51362910dcb7 = { "2" } kaasasolevat stsenaariumi kasutab seda liiki; ülejäänud on kaustas <a1><c1/></a1>.

# text
seg-b054c73f22e5 = väärtus puudub

# text
seg-6e22c97374b0 = Tulemuse silt (mootori oma): VALIDATED juhtimisseadus ja ratta dünaamika (Basilisk { "2.9.1" } vastu tegeliku oleku ahelal); selle jooksu sisendid on stsenaariumi enda — reaktsiooniratastega asendijuhtimine MRP-tagasisides, inertsiaalsuunamine, ilma sensorimürata, ilma hõõrdumiseta

# attr:alt
seg-08c624d5324d = Diagramm, mille mootor kirjutab failile scenarios/aocs-slew.toml, liik aocs

# text
seg-67fb8ac75f36 = MODELLED { "1" } · VALIDATED { "1" }: selle liigi nimetavad <a1>kontrollimaatriksi</a1> read.

# text
seg-d69a588facf1 = <b>VALIDATED</b> Jäiga korpuse inertsiaalsuunatud asendijuhtimine kolme või enama tasakaalustatud reaktsiooniratta abil: MRP-tagasiside seadus L_r = -K sigma_BR - P omega_BR (Schaub ja Junkins), minimaalse normiga ratta mootori pöördemomendid G_s u = -L_r, piiratud iga ratta l Testid: <a1>aocs_basilisk_oracle.rs</a1>.

# text
seg-7bc495b05d9a = <b>MODELLED</b> Lefferts-Markley-Shusteri multiplikatiivne EKF: kerekoordinaatide asendiviga ja güroskoobi nihke olekud, ekstrapoleerimine güroskoobi kiirusega miinus nihke hinnang ja Farrenkopfi diskreetne protsessimüra (nurga ja kiiruse juhuslik ekslemine), tähejälgija uuendus

# text
seg-7e3e0dcc936f = <b>VALIDATED</b> Jäiga korpuse inertsiaalsuunatud asendijuhtimine kolme või enama tasakaalustatud reaktsiooniratta abil: MRP-tagasiside seadus L_r = -K sigma_BR - P omega_BR (Schaub ja J. Sõltumatu etalon (ExternalDataset): Basilisk { "2.9.1" } (AVSLab, ISC; bsk-ratta jooksutus eraldi tööriistana, mitte kunagi lingitud ega kaasatud): kosmoseaparaadi korpus, reactionWheelStateEffector (BalancedWheels, pöördemomendi piir sees), simpleNav, inertial3D, attTrackingError, mrpFeedback (ilma integraalliikmeta) ja rwMotorTorque dt = { "0.1" } s juures oma RK4-ga, Kshana enda teostuse vastu kolmel juhul (kolm ortogonaalset ratast; nelja ratta püramiid; küllastuv nelja ratta juht),

# text
seg-d7889856073b = <b>MODELLED</b> Lefferts-Markley-Shusteri multiplikatiivne EKF: kerekoordinaatide asendiviga ja güroskoobi nihke olekud, ekstrapoleerimine güroskoobi kiirusega miinus nihke hinnang ja Farre. Sõltumatu etalon (InternalConsistency): Sisemine kooskõla: filtri normaliseeritud hindamisvea ruut tõe suhtes, mis on simuleeritud samadest sensorimudelitest Monte Carlo algväärtuste (seed) üle, ning asendi- ja nihkehinnangute koondumine. MIS EI OLE: välist hindajat ega lennuandmeid ei ole võrreldud (Basiliskil { "2.9.1" } ei ole MEKF-i moodulit); sensorimudelid on õpikulised, ilma nihkenurga, skaalateguri ega tähejälgija vaatevälja mõjudeta.

# text
# c1: kshana kinds --json
seg-3b71575e0c23 = Tegeliku oleku ahel on VALIDATED Basilisk { "2.9.1" } vastu; hindaja on MODELLED. (liikide kataloog (<c1/>))

# text
seg-c7ff0ddbd040 = Multiplikatiivne EKF-asendihinnang güroskoobist ja tähejälgijast on MODELLED, mitte valideeritud: kontrollitud oma suletud kujul / analüütilise samasuse vastu — tabab ülekirjutus- ja koefitsiendivigu, kuid ei ole väline sõltumatu etalon. (kontrollimaatriks (docs/MODELLED-RATIONALE.md))

# text
seg-cc4e7274d409 = Teemaleht: <a1>AOCS.md</a1>

# text
seg-b022bad77259 = <s1>Eelmine</s1>acm-link

# text
seg-1fb6e680fd4a = <s1>Järgmine</s1>aperture-duty-cycle
