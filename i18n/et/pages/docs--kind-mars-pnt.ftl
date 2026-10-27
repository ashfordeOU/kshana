# docs--kind-mars-pnt: translations (et)

# text
seg-debc2f07db78 = true

# text
seg-11e8c29ecb45 = Mootori v{ $version } stsenaariumi liik, perekond <a1>Satelliidikonstellatsioonid, katvus ja geomeetria</a1>. Nõuandev: uurimis- ja inseneeriatööriista analüüsitulemus; mitte tüübikinnitust omav navigatsiooniseade ega inimelu ohutusega seotud teenus. Iga siinne silt on mootori või kontrollimaatriksi oma; liik on MODELLED, kui maatriks ei ütle teisiti (kuidas silt teenitakse: README jaotis Evidence).

# text
# c1: body-pnt
seg-45259ad33a01 = <b>MODELLED</b> Liik <c1/>: orbiter või pinnaleandur nimega valitud keha ümber navigeerib ühesuunaliste pseudovahemaadega keha ümber oleva Walkeri navigatsioonikonstellatsiooni abil (kahe keha orbiidid keha J2 sekulaarse triiviga, tundmatu kasutaja c

# text
seg-a4f1e7d2041e = Perekonna leht: <a1>Satelliidikonstellatsioonid, katvus ja geomeetria</a1>

# text
seg-670191cf797f = Teemaleht: <a1>SOLAR-SYSTEM.md</a1>

# text
seg-3ea0aa9b3907 = <b>MODELLED</b> 3-olekuline (faas/sagedus/triiv) van-Loani Kalmani kell, Joseph-stabiliseeritud. Oraakel (sõltumatu etalon) (ReferenceImpl): filterpy { "1.4.5" } KalmanFilter (R. Labbe, MIT), F funktsiooniga scipy.linalg.expm ja Q Van-Loani { "1978" } plokkmaatriksiga — sõltumatu etalonteostus, mis reprodutseerib kshana täieliku filtri trajektoori. Teostustevaheline kooskõla: kella füüsikat / Alani kalibreerimist ei ole väliselt valideeritud, seega jääb see MODELLED. { "0.30" } väline võrdlus, tulemus (jääb MODELLED): IGS-i lõplikel { "30" } s kelladel { "11" } GPS Blo

# text
seg-8de95b3a9229 = Pardakella oleku hindamine on MODELLED, mitte valideeritud: kontrollitud eraldi teostuse vastu samas koodibaasis — testitavast üksusest sõltumatu, kuid mitte väliselt autoriteetne. (kontrollimaatriks (docs/MODELLED-RATIONALE.md))

# text
# c1: scenarios/
seg-3bc1761c76ab = { "3" } kaasasolevat stsenaariumi kasutab seda liiki; ülejäänud on kaustas <a1><c1/></a1>.

# text
# c1: docs/kinds/by-kind/mars-pnt.md
seg-c68502b9d675 = Allikas: <c1/>

# text
# c1: mars-pnt
seg-46072326d616 = <c1/> (stsenaariumi liik)

# text
seg-3f749aef8d89 = Kaugkosmose Marsi PNT: simuleeritud MARCONI releekonstellatsioon (areostatsionaarsed + kaldega releed, mis edastavad ühesuunaliselt + releestavad kahesuunaliselt kaugkosmose jaamale) navigeerib etalonkasutajat (transfer | lmo | surface) ühise ühe-/kahesuunalise radiomeetrilise liitmise hindaja kaudu. Esitab epohhipõhise geomeetria/nähtavuse, saavutatud RMS-i tõe suhtes ja formaalse kovariatsiooni (1σ / 3σ asukoht) — aus simuleeritud kvaliteedinäitaja, MITTE sertifitseeritud kaitsetase.

# text
# c1: scenarios/mars-pnt-lmo.toml
seg-0254f9bd0ee6 = Ühe <c1/> käivituse kokkuvõte: mars-pnt 5aad87fcc94a | lmo kasutaja, uso kell | { "5" } releed (keskmiselt { "3.1" } nähtaval) | koondunud asukoha RMS { "0.25" } m, formaalne 1σ { "0.31" } m (3σ { "0.93" } m — kovariatsiooni kvaliteedinäitaja, mitte sertifitseeritud PL) | kella sageduse σ { "3.71e-13" } | cov-PD true

# text
# c1: user
# c2: clock_class
# c3: step_s
# c4: duration_s
# c5: nmax
# c6: range_sigma_m
# c7: doppler_sigma_mps
# c8: dynamic_tightness
# c9: two_way_period_s
# c10: seed
seg-8eb513e7aeea = Valikulised väljad: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>

# text
# c1: scenarios/mars-pnt-lmo.toml
seg-5a9640a3f9b4 = Näide <c1/> määrab muu hulgas:

# text
seg-8e0fecea19fc = uso

# text
seg-a16f2332397c = lmo

# attr:alt
seg-c564dca90854 = Mootori joonistatud diagramm failile scenarios/mars-pnt-lmo.toml, liik mars-pnt

# text
seg-83c3a84f6b98 = <b>VALIDATED</b> Epohhi oleku [r,v] taastamine maajaama ulatustest Gaussi–Newtoni kobardiferentsiaalparandaja ja järjestikfiltri kaudu kahe keha+J2 jõumudelil. Oraakel (sõltumatu etalon) (ExternalDataset): Orekit { "12.2" } (CS GROUP, Apache-2.0) BatchLSEstimator (Levenberg–Marquardt) + KalmanEstimator (EKF) — sõltumatu kolmanda osapoole hindamisteek sobitatud jõumudelil; taastatud epohhi olek + sobitusjärgne jäägi RMS ühtivad täpsusega <{ "1e-3" } m müravabalt ja <{ "3" } m müratasemel { "5" } m

# text
seg-4be479b81f39 = <s1>Eelmine</s1>lunar-vlbi

# text
seg-2854e6a75833 = <s1>Järgmine</s1>moonlight-service-volume
