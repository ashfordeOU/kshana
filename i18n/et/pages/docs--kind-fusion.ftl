# docs--kind-fusion: translations (et)

# text
seg-03442e4be82d = Microchip SA65 / SA.45s CSAC andmeleht sigma_y(1s)={ "3e-10" }

# text
# c1: scenarios/
seg-51362910dcb7 = { "2" } kaasasolevat stsenaariumi kasutab seda liiki; ülejäänud on kaustas <a1><c1/></a1>.

# text
seg-f4cf8b629797 = Teemaleht: <a1>INTEGRITY.md</a1>

# text
seg-98151954f217 = false

# text
seg-be831b52a339 = ja veel { "4" } maatriksis.

# text
seg-f70076ea4a77 = <b>VALIDATED</b> Alani / modifitseeritud / Hadamardi hälve + astmeseaduse müra tuvastus χ² usaldusvahemikega. Oraakel (sõltumatu etalon) (ExternalDataset): NIST SP { "1065" } (Riley) / Stable32 etalonhälbed NBS14

# text
seg-5278ccdaf16f = <b>MODELLED</b> Suletud kujul libisemisvea kasv + holdover läveni; kvantkellade klassid. Oraakel (sõltumatu etalon) (ReferenceImpl): Mitmeastmeline clock_state kovariatsioonirekursioon (sama koodibaasi ristkontroll); aluseks olev libisemisdispersiooni ja holdover-i inversiooni tuum on väliselt valideeritud scipy vastu (vt „Clock-holdover coast-variance & threshold inversion“). Klassipõhised punase müra põranda holdover-i arvud jäävad MODELLED

# text
seg-3ea0aa9b3907 = <b>MODELLED</b> 3-olekuline (faas/sagedus/triiv) van-Loani Kalmani kell, Joseph-stabiliseeritud. Oraakel (sõltumatu etalon) (ReferenceImpl): filterpy { "1.4.5" } KalmanFilter (R. Labbe, MIT), F funktsiooniga scipy.linalg.expm ja Q Van-Loani { "1978" } plokkmaatriksiga — sõltumatu etalonteostus, mis reprodutseerib kshana täieliku filtri trajektoori. Teostustevaheline kooskõla: kella füüsikat / Alani kalibreerimist ei ole väliselt valideeritud, seega jääb see MODELLED. { "0.30" } väline võrdlus, tulemus (jääb MODELLED): IGS-i lõplikel { "30" } s kelladel { "11" } GPS Blo

# text
seg-e12f672ae71d = GNSS-ita kella holdover on MODELLED, mitte valideeritud: kontrollitud eraldi teostuse vastu samas koodibaasis — testitavast üksusest sõltumatu, kuid mitte väliselt autoriteetne. (kontrollimaatriks (docs/MODELLED-RATIONALE.md))

# text
seg-8de95b3a9229 = Pardakella oleku hindamine on MODELLED, mitte valideeritud: kontrollitud eraldi teostuse vastu samas koodibaasis — testitavast üksusest sõltumatu, kuid mitte väliselt autoriteetne. (kontrollimaatriks (docs/MODELLED-RATIONALE.md))

# text
seg-e4b64d7277da = Spuufimise tuvastamine on MODELLED, mitte valideeritud: alamväide on väliselt kontrollitud, kuid kogu võimekus koosneb modelleeritud osadest, seega jääb võimekus modelleerituks. (kontrollimaatriks (docs/MODELLED-RATIONALE.md))

# text
# c1: docs/kinds/by-kind/fusion.md
seg-4de09fe367df = Allikas: <c1/>

# text
# c1: fusion
seg-53e498cffeba = <c1/> (stsenaariumi liik)

# text
seg-7b2721b7588d = Mootori v{ $version } stsenaariumi liik, perekond <a1>Inertsiaal-, liitmis- ja kvantsensorid</a1>. Nõuandev: uurimis- ja inseneeriatööriista analüüsitulemus; mitte tüübikinnitust omav navigatsiooniseade ega inimelu ohutusega seotud teenus. Iga siinne silt on mootori või kontrollimaatriksi oma; liik on MODELLED, kui maatriks ei ütle teisiti (kuidas silt teenitakse: README jaotis Evidence).

# text
seg-ec26df467b88 = Ühine Kalmani sensorite liitmise PNT samade hübriidsisendite üle.

# text
# c1: scenarios/fusion-pnt.toml
seg-25708bf88728 = Ühe <c1/> jooksu kokkuvõte: scenario c8eac911bbe0 | fused | kvant-PNT-holdover 6600s (t 6600s/p 6600s) terviklikkus { "1.000" } turvalisus n/a (rünnakut ei ole) | klassikaline PNT-holdover 1330s (t 1330s/p 6600s) terviklikkus { "0.973" } turvalisus n/a (rünnakut ei ole)

# text
# c1: seed
# c2: timing_spec_ns
# c3: position_spec_m
# c4: time
# c5: gnss
# c6: resync
# c7: clock_quantum
# c8: clock_classical
# c9: accel_quantum
# c10: accel_classical
seg-dba20bb12cda = Kohustuslikud väljad: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>

# text
# c1: coupled
seg-3d5cae65f093 = Valikulised väljad: <c1/>

# text
# c1: scenarios/fusion-pnt.toml
seg-56bca36cabba = Näide <c1/> määrab muu hulgas:

# text
seg-195347c63a8a = m/s^{ "2" }

# text
seg-5d3f15c0688a = Navigatsiooniklassi kvartsakseleromeeter; illustratiivne müra-dr

# text
seg-3a1d8c59a4c9 = (m/s^{ "2" })^2/Hz

# text
seg-6ddd8a067e26 = Külmaatomi-akseleromeeter, madal pika-tau kiiruse juhuslik ekslemine;

# text
seg-cc7a61264c3f = (m/s^{ "2" })^2/s

# text
seg-e79eecc14bea = Navigatsiooniklassi kvartsakseleromeeter; i

# attr:alt
seg-c8a1c797f4b1 = Diagramm, mille mootor kirjutab failile scenarios/fusion-pnt.toml, liik fusion

# text
seg-5c031aaa3a33 = MODELLED { "4" } · VALIDATED { "4" }: selle liigi nimetavad <a1>kontrollimaatriksi</a1> read.

# text
seg-46c0903ff7b5 = <b>VALIDATED</b> Epohhi oleku [r,v] taastamine maajaama vahemaadest Gauss–Newtoni pakettdiferentsiaalkorrektori ja järjestikuse filtriga kahe keha+J2 jõumudelil Testid: <a1>batch_sequential_orbit_determination_reference.rs</a1>.

# text
seg-44f77aaf9d7e = <b>MODELLED</b> Veaoleku EKF üle { "15" } INS-i oleku, kahe oleku vastuvõtja kella ja ühe ujuva kandelaine mitmetähenduslikkuse jälgitava satelliidi kohta; pseudovahemaa, kandelaine faas ja valikuline vahemaakiirus SGP4 Walkeri konstellatsioonist (valguse levimisaeg ja Sagnac), Klobuchar an Testid: <a1>fusion_carrier_tc.rs</a1>.

# text
seg-509f93c7e9ce = <b>MODELLED</b> Kolm gnss-ins stsenaariumi trajektoorikogul (laev, mis siksakitab kiirusega { "8" } m/s viieminutilise katkestusega; rong läbi kahe satelliidi lõike ja tunneli; õhusõiduk, mille katkestus katab 25-kraadise kaldega pöörde) ja paketi valikuline Testid: <a1>gnss_ins_packs.rs</a1>.

# text
seg-e0633b308e4e = <b>MODELLED</b> Üks virnastatud Kalmani filter positsiooni, kiiruse, kella faasi ja sageduse üle, mida toidavad pseudovahemaad, mis seovad positsiooni ja kella (Joseph-kujulised uuendused, mis kannavad ristkovariatsiooni); 1-DOF variant, mida on täiendatud konstantse akseleromeetri nihke s Testid: <a1>fusion_coupled_filters.rs</a1>.

# text
seg-451a304052c4 = <b>MODELLED</b> Külmaatomi interferomeetri akseleromeeter esimestest printsiipidest (k_eff·T², QPN). Oraakel (sõltumatu etalon) (ExternalDataset): Avaldatud CAI esmaartiklite arvvektorid (Cheineti { "2008" } ülekandefunktsioon; Petersi/Freieri tundlikkus): k_eff·T² ühtib täpselt, footonimüra ASD ühepoolne põrand ~{ "2" }× piires iga avaldatud instrumendi omast (päris seadmed kannavad kvantpõrandast kõrgemat tehnilist müra). Vahemik, mitte võrdsus. { "0.30" } ring { "2" } (eelregistreeritud fcb9ac64), tulemus (jääb MODELLED): ainult QPN pöörlemismüra mõõdetud Gauguet et al. vastu.

# text
seg-7e95210bcc48 = <b>MODELLED</b> Koostatud nihke + skaalateguri + VRW + stabiilsuse hääbumise positsioonieelarve holdover-i jooksul. Oraakel (sõltumatu etalon) (ReferenceImpl): Sõltumatu numpy Monte Carlo SDE integreerimine topeltintegreeritud valge kiirenduse müra jaoks (valideerib analüütilise VRW dispersiooni tõeliselt sõltumatu algoritmiga) + Grovesi { "2013" } avaldatud väärtuse ankur nihke/skaalateguri liikmete jaoks; CAI seadme arvud kvantifitseerivad partneri riistvara ja jäävad MODELLED

# text
seg-9955b1b1c018 = Kvantinertsiaalsensori toimivus on MODELLED, mitte valideeritud: alamväide on väliselt kontrollitud, kuid kogu võimekus koosneb modelleeritud osadest, seega jääb võimekus modelleerituks. (kontrollimaatriks (docs/MODELLED-RATIONALE.md))

# text
seg-5fef5e8cc64e = Kvantinertsiaalse kursiarvestuse vastupidavus on MODELLED, mitte valideeritud: kontrollitud eraldi teostuse vastu samas koodibaasis — testitavast üksusest sõltumatu, kuid mitte väliselt autoriteetne. (kontrollimaatriks (docs/MODELLED-RATIONALE.md))

# text
seg-f7f12029e0ec = Perekonna leht: <a1>Inertsiaal-, liitmis- ja kvantsensorid</a1>

# text
seg-a849735fcc6e = Teemaleht: <a1>LEO-PNT-FUSION.md</a1>

# text
seg-c894aa7d9585 = <s1>Eelmine</s1>ephemeris

# text
seg-d14a7850df1c = <s1>Järgmine</s1>gnss-ins
