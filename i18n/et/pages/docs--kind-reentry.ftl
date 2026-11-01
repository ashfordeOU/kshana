# docs--kind-reentry: translations (et)

# text
seg-99ef7c1d552c = Mootori v{ $version } stsenaariumi liik, perekond <a1>Missioonianalüüs, lingid ja kosmoseoperatsioonid</a1>. Nõuandev: uurimis- ja inseneeriatööriista analüüsitulemus; mitte tüübikinnitust omav navigatsiooniseade ega inimelu ohutusega seotud teenus. Iga siinne märgis on mootori või kontrollimaatriksi oma; liik on MODELLED, kui maatriks ei ütle teisiti (kuidas märgis teenitakse: README jaotis Evidence).

# text
seg-8f1e7d3f5a07 = Perekonna leht: <a1>Missioonianalüüs, lingid ja kosmoseoperatsioonid</a1>

# text
seg-3a3ee499961e = <b>MODELLED</b> Mitmeastmelise kanderaketi tasapinnaline gravitatsioonipööre mitte pöörleva sfäärilise Maa kohal läbi USA standardatmosfääri { "1976" } (tihedus ja rõhk), tõusunurga lööbega, otsiku vasturõhu võrra vähendatud tõukejõuga, astmete põlemise lõpuga täpsetel s

# text
seg-8e62cc4af6ea = Teemaleht: <a1>ENTRY-EO-ASCENT.md</a1>

# text
seg-05ce408c2dbb = kg/m^{ "2" }

# text
seg-195347c63a8a = m/s^{ "2" }

# text
# c1: docs/kinds/by-kind/reentry.md
seg-c95aec0d2943 = Allikas: <c1/>

# text
# c1: reentry
seg-91424dc65b3e = <c1/> (stsenaariumi liik)

# text
seg-039f77066d97 = Allen-Eggersi ballistilise atmosfääri sisenemise koridor: maksimaalne aeglustus (ballistilisest koefitsiendist sõltumatu, V_e^{ "2" } sin|γ|/(2eH)), kiirus ja kõrgus maksimaalse g juures ning maksimaalse kuumenemise kiirus sisenemiskiiruse/lennutrajektoori nurga/ballistilise koefitsiendi korral eksponentsiaalse atmosfääri kaudu, pluss sama ballistilise sisenemise tasapinnaline punktmassi integreerimine raskusjõu, Maa kõveruse ja USA standardatmosfääriga { "1976" } (maksimaalne aeglustus, kiirus, kõrgus ja aeg maksimumil). MODELLED ballistiline (tõstejõuta) sisenemine; kuumenemise väljund on maksimaalse kuumenemise KIIRUS, mitte soojusvoog (aerotermilist/TPS-i mudelit ei ole).

# text
# c1: scenarios/reentry.toml
seg-9908d06c50eb = Ühe <c1/> käivituse kokkuvõte: reentry (Allen–Eggers): V_e { "7800" } m/s, γ { "6.0" }° -> tipp { "16.6" } g kõrgusel { "49" } km, { "4731" } m/s; kuumenemine tipneb kiirusel { "6603" } m/s; punktmass (raskusjõud, kõverus, US76) tipp { "16.4" } g (MODELLED ballistiline, aerotermiat ei ole)

# text
# c1: entry_velocity_m_s
# c2: flight_path_angle_deg
# c3: ballistic_coeff_kg_m2
# c4: scale_height_m
# c5: rho0_kg_m3
# c6: entry_interface_altitude_m
seg-f057c2a160e7 = Valikulised väljad: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>

# text
# c1: scenarios/reentry.toml
seg-576245fd5b70 = Näide <c1/> määrab muu hulgas:

# text
seg-0b7769c97ff3 = Tulemuse silt (mootori oma): MODELLED — Allen–Eggersi ballistiline (tõstejõuta) sisenemine, eksponentsiaalne isotermiline atmosfäär, konstantne lennutrajektoori nurk; maksimaalne g on ballistilisest koefitsiendist sõltumatu; kuumenemine on maksimaalse kuumenemise KIIRUS, MITTE soojusvoog (aerotermilist/TPS-i mudelit ei ole)

# attr:alt
seg-b0109481e8ff = Diagramm, mille mootor kirjutab failile scenarios/reentry.toml, liik reentry

# text
seg-c860b8679b47 = <b>MODELLED</b> Maksimaalne aeglustus (ballistilisest koefitsiendist sõltumatu), kiirus + kõrgus maksimaalse g juures ning maksimaalse kuumenemise kiirus eksponentsiaalse atmosfääriga ballistilise sisenemise korral. Testid: <a1>reentry_point_mass_accelerometer_oracle.rs</a1>.

# text
seg-84abc0b9f859 = <b>MODELLED</b> Maksimaalne aeglustus (ballistilisest koefitsiendist sõltumatu), kiirus + kõrgus maksimaalse g juures ning maksimaalse kuumenemise kiirus eksponentsiaalse atmosfääriga ballistilise sisenemise korral. R. Sõltumatu etalon (sisemine kooskõla; InternalConsistency): kinnise kuju Allen–Eggersi analüütiline sisenemine, lisaks ristkontrollitud scipy { "1.18" } solve_ivp (DOP853) arvulise integreerimisega SAMA ainult takistusega sisenemise ODE-st (tests/ballistic_re_entry_corridor_reference.rs, { "36" } juhtu, halvim a_max suhteline { "2.9e-9" }) — arvintegraali-vs-oma-analüütilise-kuju kontroll, seega ikkagi InternalConsistency, MITTE väline valideerimine. MODELLED ballistiline (tõstejõuta), aerotermiat/TPS-i ei ole — kuumenemise väljund on ve

# text
# c1: label
seg-8b9d3db5d563 = MODELLED — Allen–Eggersi ballistiline (tõstejõuta) sisenemine, eksponentsiaalne isotermiline atmosfäär, konstantne lennutrajektoori nurk; maksimaalne g on ballistilisest koefitsiendist sõltumatu; kuumenemine on maksimaalse kuumenemise KIIRUS, MITTE soojusvoog (aerotermilist/TPS-i mudelit ei ole) (tulemus <c1/>)

# text
# c1: kshana kinds --json
seg-82de2275c919 = MODELLED ballistiline (tõstejõuta) sisenemine; kuumenemise väljund on maksimaalse kuumenemise KIIRUS, mitte soojusvoog (aerotermilist/TPS-i mudelit ei ole). (liikide kataloog (<c1/>))

# text
seg-080b28422342 = AUS ULATUS: MODELLED ballistiline (tõstejõuta), eksponentsiaalne isotermiline atmosfäär, konstantne lennutrajektoori nurk. Aerotermilist/TPS-i mudelit ei ole -- kuumenemise väljund on maksimaalse kuumenemise KIIRUS, mitte soojusvoog. Mitte 3-/6-DoF trajektoor. Käivitamine: kshana scenarios/reentry.toml (stsenaariumifaili kommentaar, read { "8" }–{ "11" })

# text
seg-cfc345f0dc0d = Ballistilise atmosfääri sisenemise koridor (Allen–Eggers) on MODELLED, mitte valideeritud: kontrollitud oma kinnise kuju / analüütilise samasuse vastu — tabab ärakirjutus- ja koefitsiendivigu, kuid ei ole väline etalon. (kontrollimaatriks (docs/MODELLED-RATIONALE.md))

# text
seg-a4b7c16e3fea = <s1>Eelmine</s1>realtime-frame-eop

# text
seg-6166a1c21525 = <s1>Järgmine</s1>slot-timing

seg-33b3bf4992c9 = <b>MODELLED</b> Faas <c1/>: liigi <c2/> tagasirand ilma impulsita, lõppedes sisenemispiiril; trajektoori kaldenurk ja selle sigma täielikust kovariatsioonist lõplike vahede gradiendiga; tõenäosus, et nurk jääb nimetatud
