# docs--kind-sweep-nd: translations (et)

# text
# c1: campaign
seg-fa3ad6babe54 = <b>MODELLED</b> Liigi <c1/> pühkimine (üks kuni kolm punktidega võtit mis tahes liigist, üldise pühkimise telje väärtustel, soovi korral ansambel igas sõlmes) ja monte_carlo sec. Sõltumatu etalon (InternalConsistency): Faasi juhusliku ekslemise suletud kuju valge sageduse müra korral, dispersioon q_wf tau (NIST Technical Note { "1337" }), statistikamasinavärgi jaoks ning baitide tasemel võrdsus eraldiseisvate jooksudega seemendamise (seeding) jaoks. See kontrollib ansambli aritmeetikat mootori enda kellamudelil, mitte välist andmestikku

# text
seg-d1c11e493795 = Parameetripühkimised ja algväärtusega (seed) Monte Carlo ansamblid üle mis tahes stsenaariumi liigi on MODELLED, mitte valideeritud: kontrollitud oma suletud kujul / analüütilise samasuse vastu — tabab ülekirjutus- ja koefitsiendivigu, kuid ei ole väline sõltumatu etalon. (kontrollimaatriks (docs/MODELLED-RATIONALE.md))

# text
seg-c61e88721556 = Mootori v{ $version } stsenaariumi liik, perekond <a1>Kellad, ajastus ja holdover</a1>. Nõuandev: uurimis- ja inseneeriatööriista analüüsitulemus; mitte tüübikinnitust omav navigatsiooniseade ega inimelu ohutusega seotud teenus. Iga siinne silt on mootori või kontrollimaatriksi oma; liik on MODELLED, kui maatriks ei ütle teisiti (kuidas silt teenitakse: README jaotis Evidence).

# text
seg-849c08d3ce70 = Perekonna leht: <a1>Kellad, ajastus ja holdover</a1>

# text
seg-ee7dd15019d0 = Teemaleht: <a1>CAMPAIGNS.md</a1>

# text
seg-619127334cf3 = Ükski maatriksirida ei nimeta seda liiki nimepidi; selle tulemuse silt on mootori enda, ülal.

# text
seg-195347c63a8a = m/s^{ "2" }

# text
seg-451a304052c4 = <b>MODELLED</b> Külmaatomi interferomeetri akseleromeeter esimestest printsiipidest (k_eff·T², QPN). Sõltumatu etalon (ExternalDataset): Avaldatud CAI esmaartiklite arvvektorid (Cheineti { "2008" } ülekandefunktsioon; Petersi/Freieri tundlikkus): k_eff·T² ühtib täpselt, footonimüra ASD ühepoolne põrand ~{ "2" }× piires iga avaldatud instrumendi omast (päris seadmed kannavad kvantpõrandast kõrgemat tehnilist müra). Vahemik, mitte võrdsus. { "0.30" } ring { "2" } (eelregistreeritud fcb9ac64), tulemus (jääb MODELLED): ainult QPN pöörlemismüra mõõdetud Gauguet et al. vastu.

# text
seg-7e95210bcc48 = <b>MODELLED</b> Koostatud nihke + skaalateguri + VRW + stabiilsuse hääbumise positsioonieelarve holdover-i jooksul. Sõltumatu etalon (ReferenceImpl): Sõltumatu numpy Monte Carlo SDE integreerimine topeltintegreeritud valge kiirenduse müra jaoks (valideerib analüütilise VRW dispersiooni tõeliselt sõltumatu algoritmiga) + Grovesi { "2013" } avaldatud väärtuse ankur nihke/skaalateguri liikmete jaoks; CAI seadme arvud kvantifitseerivad partneri riistvara ja jäävad MODELLED

# text
seg-9955b1b1c018 = Kvantinertsiaalsensori toimivus on MODELLED, mitte valideeritud: alamväide on väliselt kontrollitud, kuid kogu võimekus koosneb modelleeritud osadest, seega jääb võimekus modelleerituks. (kontrollimaatriks (docs/MODELLED-RATIONALE.md))

# text
seg-5fef5e8cc64e = Kvantinertsiaalse kursiarvestuse vastupidavus on MODELLED, mitte valideeritud: kontrollitud eraldi teostuse vastu samas koodibaasis — testitavast üksusest sõltumatu, kuid mitte väliselt autoriteetne. (kontrollimaatriks (docs/MODELLED-RATIONALE.md))

# text
seg-5a70fcb097dc = Valikulised väljad: puuduvad

# text
seg-bb07c8ee153f = <b>PARTNER</b> Ei paku — ainult toimivusmudelid; külmaatomi/kella riistvara on partneri oma. Sõltumatu etalon (NoneKind): puudub: partneri vastutusala, kujundatud nii, et mooduli ega testi ei ole

# text
seg-8b701f465117 = log

# text
# c1: docs/kinds/by-kind/sweep-nd.md
seg-792218eac075 = Allikas: <c1/>

# text
# c1: sweep-nd
seg-c7e5582d0b24 = <c1/> (stsenaariumi liik)

# text
seg-4f19d4fb1341 = Üldine N-D pühkimine mis tahes paketi kohal punktiga eraldatud TOML-võtmete / JSON-i mõõdikuteede kaudu.

# text
# c1: scenarios/sweep-nd-inertial.toml
# c2: inertial
seg-cd907c72698b = Ühe <c1/> käivituse kokkuvõte: üldine pühkimine <c2/> kohal üle [threshold_m, accel_classical.bias] | { "15" } sõlme (kuju [{ "5" }, { "3" }]) | mõõdikud [classical.fom.holdover_s, classical.fom.pos_rms_m]

# text
# c1: base
# c2: axes
# c3: metrics
seg-502ba2c57a5f = Kohustuslikud väljad: <c1/>, <c2/>, <c3/>

# text
# c1: scenarios/sweep-nd-inertial.toml
seg-c372e390bb4f = Näide <c1/> määrab muu hulgas:

# attr:alt
seg-621a18c07044 = Diagramm, mille mootor kirjutab failile scenarios/sweep-nd-inertial.toml, liik sweep-nd

# text
seg-ce006a6715e9 = <s1>Eelmine</s1>spoof

# text
seg-b9f8771ffd3d = <s1>Järgmine</s1>sweep

seg-a349aa76b0ed = PARTNER
