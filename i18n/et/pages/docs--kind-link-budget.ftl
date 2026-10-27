# docs--kind-link-budget: translations (et)

# text
seg-99ef7c1d552c = Mootori v{ $version } stsenaariumi liik, perekond <a1>Missioonianalüüs, lingid ja kosmoseoperatsioonid</a1>. Nõuandev: uurimis- ja inseneeriatööriista analüüsitulemus; mitte tüübikinnitust omav navigatsiooniseade ega inimelu ohutusega seotud teenus. Iga siinne märgis on mootori või kontrollimaatriksi oma; liik on MODELLED, kui maatriks ei ütle teisiti (kuidas märgis teenitakse: README jaotis Evidence).

# text
seg-debc2f07db78 = true

# text
seg-8784979d6569 = dBW

# text
seg-37d16b499bc5 = dB

# text
seg-37d29d8303fe = km

# text
seg-8f1e7d3f5a07 = Perekonna leht: <a1>Missioonianalüüs, lingid ja kosmoseoperatsioonid</a1>

# text
seg-67fb8ac75f36 = MODELLED { "1" } · VALIDATED { "1" }: selle liigi nimetavad <a1>kontrollimaatriksi</a1> read.

# text
seg-a3697ad561db = Hz

# text
seg-cec5c06d38af = <b>MODELLED</b> Kuupõhine segaja ja signaali suhe, efektiivne C/N₀ ja haakumise kadu selenograafilise pinnakasutaja jaoks Kuu pinna (või kõrgendatud) segaja all, illustratiivse avaliku allikaga Moonlight/LCNS-klassi satelliidikonstellatsiooni üle.

# text
# c1: docs/kinds/by-kind/link-budget.md
seg-120fcc840b87 = Allikas: <c1/>

# text
# c1: link-budget
seg-738aa7d45efb = <c1/> (stsenaariumi liik)

# text
seg-953188c11165 = Ühesuunaline lingieelarve CCSDS { "401" } / DSN 810-005 lingivõrrandi alusel: vabaruumi levikadu, C/N₀, Eb/N₀, varu ja sulgumine edastuse EIRP, vastuvõtu G/T, vahemaa, andmekiiruse ja sagedusala (s|x|ka) jaoks nõutava Eb/N₀ suhtes. Deterministlik inseneriarvutus antud sisenditest (mitte kalibreeritud terminali andmeleht).

# text
# c1: scenarios/link-budget.toml
seg-6697c741d09c = Ühe <c1/> käivituse kokkuvõte: link-budget: x-sagedusala, { "2000" } km, { "1000000" } bit/s -> FSPL { "177.0" } dB, Eb/N0 { "96.6" } dB, varu { "92.1" } dB (sulgub)

# text
# c1: band
# c2: eirp_dbw
# c3: g_over_t_db
# c4: range_km
# c5: data_rate_bps
# c6: other_losses_db
# c7: required_eb_n0_db
# c8: tsys_k
seg-2305502051b6 = Valikulised väljad: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>

# text
# c1: scenarios/link-budget.toml
seg-588476f4ae75 = Näide <c1/> määrab muu hulgas:

# text
seg-ebb923e1a3b5 = Tulemuse silt (mootori oma): Ühesuunaline lingieelarve CCSDS { "401" } / DSN 810-005 lingivõrrandi alusel (EIRP − FSPL − L_other + G/T − k); deterministlik inseneriarvutus antud sisenditest, MITTE kalibreeritud terminali andmeleht

# attr:alt
seg-bd375631bc7e = Mootori joonistatud diagramm failile scenarios/link-budget.toml, liik link-budget

# text
seg-4f92669c3946 = <b>VALIDATED</b> Vabaruumi levikadu, C/N₀, Eb/N₀, varu ja sulgumine CCSDS { "401" } / DSN 810-005 lingivõrrandi alusel EIRP/G·T/vahemaa/kiirus/sagedusala jaoks nõutava Eb/N₀ suhtes. Testid: <a1>one_way_link_budget_reference.rs</a1>.

# text
seg-bfaeb6f1cc5a = <b>VALIDATED</b> Vabaruumi levikadu, C/N₀, Eb/N₀, varu ja sulgumine CCSDS { "401" } / DSN 810-005 lingivõrrandi alusel EIRP/G·T/vahemaa/kiirus/sagedusala jaoks nõutava Eb/N₀ suhtes. Runn. Sõltumatu etalon (ExternalDataset): Avaldatud kaugkosmose telekommunikatsiooni kavandi-kontrolli tabel kinnitatud arvuvektoritena: DESCANSO / J. H. Yuen (toim.), Deep Space Telecommunications Systems Engineering, JPL Pub 82-76, Table 1-1 (Galileo X-sagedusala) — kshana kompileerib tabeli reaelemendid uuesti kokku ja reprodutseerib selle avaldatud otsast lõpuni L_fs { "290.54" } dB ja Pr/N0 { "54.6" } dB-Hz; vabaruumi kadu on kontrollitud ka vs ITU-R P.525

# text
seg-2598c2360113 = <b>MODELLED</b> Aruanne link-budget esitab iga absoluutse konstandi, millest selle enda varu arvutati -- kandjasageduse, mida vabaruumi kadu kasutas, EIRP, arvu o. Sõltumatu etalon (InternalConsistency): Väline sõltumatu etalon puudub: see on enesekirjeldus võrrandi kohta, mis on juba valideeritud avaldatud kavandi-kontrolli tabeli vastu (vt ühesuunalise lingieelarve rida). See on registreeritud, sest selle puudumine oli mõõdetud viga -- väljastatud d1_rate_gain_beamwidth.csv reprodutseerimine nõudis ühe efektiivse konstandi tagasilahendamist täpsusega { "0.0034" } dB kõigist kolmekümnest reast ja mootor nii nimetab nüüd selle kombinatsiooni kui ka tõestab testiga

# text
seg-c779823e860c = Valikuline: vastuvõtusüsteemi müratemperatuur (K). See EI OLE lingivõrrandi sisend -- see vajab ainult suhet G/T -- kuid selle esitamine lubab aruandel anda ka vastuvõtuantenni võimenduse, mida kvaliteedinäitaja eeldab (G = G/T + { "10" }*log10(T_sys)). Väljajätmisel puudub võimenduse jaotus aruandest, mitte ei eeldata seda. tsys_k = { "300.0" } (stsenaariumifaili kommentaar, read { "21" } kuni { "25" })

# text
seg-d717412c4f06 = Aruande link-budget enesekirjeldus on MODELLED, mitte valideeritud: kontrollitud omaenda suletud kujul / analüütilise samasuse vastu — tabab ülekande- ja koefitsiendivigu, kuid ei ole väline sõltumatu etalon. (kontrollimaatriks (docs/MODELLED-RATIONALE.md))

# text
seg-ffbc9de75306 = <s1>Eelmine</s1>leo-signal

# text
seg-59d4cb995cb9 = <s1>Järgmine</s1>lunar-attack-surface
