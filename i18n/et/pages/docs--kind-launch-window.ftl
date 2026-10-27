# docs--kind-launch-window: translations (et)

# text
seg-99ef7c1d552c = Mootori v{ $version } stsenaariumi liik, perekond <a1>Missioonianalüüs, lingid ja kosmoseoperatsioonid</a1>. Nõuandev: uurimis- ja inseneeriatööriista analüüsitulemus; mitte tüübikinnitust omav navigatsiooniseade ega inimelu ohutusega seotud teenus. Iga siinne märgis on mootori või kontrollimaatriksi oma; liik on MODELLED, kui maatriks ei ütle teisiti (kuidas märgis teenitakse: README jaotis Evidence).

# text
seg-37d29d8303fe = km

# text
seg-8f1e7d3f5a07 = Perekonna leht: <a1>Missioonianalüüs, lingid ja kosmoseoperatsioonid</a1>

# text
seg-b054c73f22e5 = väärtus puudub

# text
seg-8e62cc4af6ea = Teemaleht: <a1>ENTRY-EO-ASCENT.md</a1>

# text
# c1: docs/kinds/by-kind/launch-window.md
seg-1c385961d594 = Allikas: <c1/>

# text
# c1: launch-window
seg-e0990c5f14da = <c1/> (stsenaariumi liik)

# text
seg-7a4e6215a488 = Kahe keha starti ja tõusu geomeetria: stardiasimuut(id) (sin Az = cos i / cos lat), minimaalne saavutatav kaldenurk, ringkiirus, Maa pöörlemise idasuunaline boonus, dogleg-tasandimuutuse Δv, kui sihtkaldenurk on stardikoha laiuskraadist väiksem, ja päevaste stardivõimaluste arv. MODELLED sfäärilise Maa geomeetria (ilma pöörleva Maa kiiruskolmnurga parandita, ilma tõusu- ja takistuskao mudelita).

# text
# c1: scenarios/launch-window.toml
seg-e24b0ae723c7 = Ühe <c1/> käivituse kokkuvõte: launch-window: lat { "28.5" }° -> i { "51.6" }°: Az { "45.0" }° asc, v_circ { "7669" } m/s, +{ "409" } m/s Maa pöörlemise boonus, { "2" } võimalust päevas (MODELLED)

# text
# c1: site_lat_deg
# c2: target_inclination_deg
# c3: altitude_km
# c4: site_lon_deg
# c5: epoch
# c6: eop_finals2000a
seg-6f955816b5c6 = Valikulised väljad: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>

# text
# c1: scenarios/launch-window.toml
seg-aaadee0743ee = Näide <c1/> määrab muu hulgas:

# text
seg-58d26f083b8f = Tulemuse silt (mootori oma): MODELLED — kahe keha sfäärilise Maa stardigeomeetria; asimuut on geomeetriline seos sin(Az)=cos(i)/cos(lat) (ilma pöörleva Maa kiiruskolmnurga parandita, ilma tõusu- ja takistuskao mudelita)

# attr:alt
seg-9696283a95ae = Mootori joonistatud diagramm failile scenarios/launch-window.toml, liik launch-window

# text
seg-38175030f689 = <b>MODELLED</b> Kahe keha stardiasimuut(id) (sin Az = cos i / cos lat), minimaalne saavutatav kaldenurk, ringkiirus, Maa pöörlemise idasuunaline boonus, dogleg-tasandimuutuse Δv ja päevased võimalused ning, kui on antud epohh ja IERS finals2000A read, stardikoht

# text
seg-53bc589c7ed6 = <b>MODELLED</b> Kahe keha stardiasimuut(id) (sin Az = cos i / cos lat), minimaalne saavutatav kaldenurk, ringkiirus, Maa pöörlemise idasuunaline boonus, dogleg-tasandimuutuse Δv a. Oraakel (sõltumatu etalon) (InternalConsistency): Suletud kujul sfäärilise trigonomeetria stardigeomeetria võrrelduna avaldatud läbitöötatud näidete ankrutega (Vallado, Fundamentals of Astrodynamics 4th ed., Algorithm { "37" } launch-azimuth + Ch.6 plane-change; tests/launch_window_ascent_geometry_reference.rs). Need kasutavad uuesti sama suletud kuju, mida kshana rakendab (avaldatud väärtuse samasuse / ülekandekontroll, InternalConsistency); MODELLED kahe keha, ilma pöörleva Maa kiiruskolmnurga / tõusu / takistuskao

# text
# c1: label
seg-12396619d3e5 = MODELLED — kahe keha sfäärilise Maa stardigeomeetria; asimuut on geomeetriline seos sin(Az)=cos(i)/cos(lat) (ilma pöörleva Maa kiiruskolmnurga parandita, ilma tõusu- ja takistuskao mudelita) (tulemus <c1/>)

# text
# c1: kshana kinds --json
seg-715f1856bd37 = MODELLED sfäärilise Maa geomeetria (ilma pöörleva Maa kiiruskolmnurga parandita, ilma tõusu- ja takistuskao mudelita). (liikide kataloog (<c1/>))

# text
seg-4e9a215e3918 = AUSTA ULATUS: MODELLED. Ainult geomeetriline asimuut -- ilma pöörleva Maa kiiruskolmnurga parandita (boonust esitatakse eraldi, et see sisse arvata), ilma tõusutrajektoori / takistuskao / juhtimismudelita. Faasi A-eelne geomeetria. Käivitus: kshana scenarios/launch-window.toml (stsenaariumifaili kommentaar, read { "8" } kuni { "11" })

# text
seg-12332d181de4 = Starditiheda ja tõusu geomeetria (missioonianalüüs) on MODELLED, mitte valideeritud: kontrollitud omaenda suletud kujul / analüütilise samasuse vastu — tabab ülekande- ja koefitsiendivigu, kuid ei ole väline sõltumatu etalon. (kontrollimaatriks (docs/MODELLED-RATIONALE.md))

# text
seg-1a3841380d88 = <s1>Eelmine</s1>jamming

# text
seg-78411b85f301 = <s1>Järgmine</s1>leo-navmsg
