# docs--kind-contact-schedule: translations (et)

# text
seg-99ef7c1d552c = Mootori v{ $version } stsenaariumi liik, perekond <a1>Missioonianalüüs, lingid ja kosmoseoperatsioonid</a1>. Nõuandev: uurimis- ja inseneeriatööriista analüüsitulemus; mitte tüübikinnitust omav navigatsiooniseade ega inimelu ohutusega seotud teenus. Iga siinne märgis on mootori või kontrollimaatriksi oma; liik on MODELLED, kui maatriks ei ütle teisiti (kuidas märgis teenitakse: README jaotis Evidence).

# text
seg-debc2f07db78 = true

# text
seg-8784979d6569 = dBW

# text
seg-dfe78b9d0811 = GHz

# text
seg-37d16b499bc5 = dB

# text
seg-0f4c2ab525ac = <b>MODELLED</b> Allalingi Es/N0 piki iga ühe satelliidi läbilendu ühe jaama kohal (EIRP, vabaruumi sumbuvus, kosekansi-seadusel põhinev atmosfäärisumbuvus, muud kaod, G/T, Boltzmanni konstant, sümbolkiirus), kõige tõhusam DVB-S2 MODCOD, mis ületab oma ETSI EN { "302" } 307-

# text
seg-c246881f6fd4 = <b>VALIDATED</b> SGP4 elemendikomplekti nähtavuspääsud (AOS, TCA, LOS, maksimaalne näiv kõrgus, kestus) WGS-84 jaama kohal valideeritud Maa orbiidi rajal (IAU { "2006" }. Sõltumatu etalon (ExternalDataset): Orekit { "13.1.8" } (CS GROUP, Apache-2.0) koos Hipparchus { "4.0.3" }-ga: TLEPropagator samadel elemendikomplektidel TEME-s, mille Orekit ehitab väidetud määratluse järgi (selle IERS { "2010" } TOD, pööratud GAST - GMST võrra), ElevationDetector ja ElevationExtremumDetector koos ITURP834AtmosphericRefraction-iga ja ilma, ning AngularAzEl koos AngularRadioRefractionModifier-iga valguse levimisaja juhuks, ületused ja maksimum lahendatud Hipparchus-iga; { "60" } juhtu (f

# text
seg-35588ca8e9bb = <b>MODELLED</b> Allalingi Es/N0 ühe satelliidi iga pääsu jooksul ühe jaama kohal (EIRP, vabaruumi sumbuvus, kosekansi seaduse järgi atmosfäärisumbuvus, muud kaod, G/T, Boltzmanni konstant,. Sõltumatu etalon (InternalConsistency): Sisemine kooskõla: tabeli 5a K_bch-st ja kaadripikkustest suletud kujul arvutatud spektraalne efektiivsus ühtib efektiivsustega, mida tabel { "13" } trükib (lävetabeli ülekirjutuskontroll); lingibilansi osad ühtivad oma suletud kujuga; valik on Es/N0 suhtes monotoonne ja austab varu; ACM liigutab vähemalt konstantse kodeeringu mahu võrra. Pääsu geomeetria tuleb eraldi VALIDATED a

# text
# c1: kshana kinds --json
seg-cd04f5662884 = MODELLED. (liikide kataloog (<c1/>))

# text
seg-7f8667e8d8fe = DVB-S2 adaptiivne kodeerimine ja modulatsioon LEO allalingi pääsu jooksul on MODELLED, mitte valideeritud: kontrollitud oma suletud kujul / analüütilise samasuse vastu — tabab ülekirjutus- ja koefitsiendivigu, kuid ei ole väline sõltumatu etalon. (kontrollimaatriks (docs/MODELLED-RATIONALE.md))

# text
seg-8f1e7d3f5a07 = Perekonna leht: <a1>Missioonianalüüs, lingid ja kosmoseoperatsioonid</a1>

# text
seg-72fd0321e4af = Teemaleht: <a1>CONTACT-SCHEDULING.md</a1>

# text
# c1: docs/kinds/by-kind/contact-schedule.md
seg-b79fcddea1d6 = Allikas: <c1/>

# text
# c1: contact-schedule
seg-040d160b3fdd = <c1/> (stsenaariumi liik)

# text
seg-be4e928a5865 = Maajaamakontaktide planeerimine mitme satelliidi jaoks üle mitme jaama: näivad ligipääsuaknad (SGP4, IAU 2006/2000A Maaga seotud süsteem, ITU-R P.834 murdumine, valguse levimisaeg), iga pääsu DVB-S2 ACM andmemaht (ETSI EN { "302" } 307-1 tabeli { "13" } lävendid) ja konfliktivaba ajakava (üks satelliit antenni kohta ümberpööramisajaga, üks jaam satelliidi kohta, prioriteediga kaalutud edastus, piiratud iga mahajäämusega) piirväärtuse ahne meetodiga, esimesena-tulnu baasjoone ja täpse hargne-ja-piira meetodiga väikestel hulkadel, koos ahne meetodi optimaalsuse lõhega. MODELLED.

# text
# c1: scenarios/contact-schedule.toml
seg-7a3fad06a9fc = Ühe <c1/> jooksu kokkuvõte: contact-schedule: { "3" } satelliiti x { "3" } jaama { "12" } h jooksul -> { "31" } kandidaatkontakti, { "22" } ajastatud; { "797266" } / { "860000" } Mbit edastatud (MODELLED)

# text
# c1: epoch
# c2: duration_hours
# c3: step_s
# c4: refraction
# c5: light_time
# c6: link
# c7: satellites
# c8: stations
seg-a03d83f5866a = Valikulised väljad: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>

# text
# c1: scenarios/contact-schedule.toml
seg-5ba0968796ac = Näide <c1/> määrab muu hulgas:

# text
seg-cade59b5a371 = Tulemuse silt (mootori oma): MODELLED — mitme satelliidi ja mitme jaamaga kontaktiplaan: näivad ligipääsuaknad (SGP4, IAU 2006/2000A, ITU-R P.834 murdumine, valguse levimisaeg), DVB-S2 ACM andmemaht pääsu kohta selge taeva lingibilansist (ETSI EN { "302" } 307-1 tabeli { "13" } lävendid) ja konfliktide lahendamine (üks satelliit antenni kohta ümberpööramisega

# attr:alt
seg-e26b549579e2 = Diagramm, mille mootor kirjutab failile scenarios/contact-schedule.toml, liik contact-schedule

# text
seg-036b708ed2b9 = <b>MODELLED</b> Kandidaatkontaktid igast satelliidi-jaama pääsust selle ACM andmemahuga; konfliktid, kus üks antenn teeniks kahte satelliiti oma ümberpööramisaja sees või üks satelliit saadaks allalingi kahele jaamale korraga; prioriteediga kaalutud edastus

# text
seg-60431931082a = <b>MODELLED</b> Kandidaatkontaktid igast satelliidi-jaama pääsust selle ACM andmemahuga; konfliktid, kus üks antenn teeniks kahte satelliiti oma ümberpööramisaja sees või ü. Sõltumatu etalon (InternalConsistency): Sisemine kooskõla: täpne hargne-ja-piira meetod ühtib jõumeetodil ülelugemisega väikestel juhuslikel hulkadel, iga plaan kontrollitakse konfliktireeglite suhtes teostatavaks ja ahne meetod ei ületa kunagi täpset optimumi. MIS EI OLE: välist ajastajat ega operatiivplaani ei ole võrreldud; kontaktid võetakse tervikuna (ilma jagamiseta), mahajäämus on fikseeritud akna alguses, pöördeaeg peale fikseeritud ümberpööramise ja pardal s

# text
# c1: label
seg-9941b9f6d4a8 = MODELLED — mitme satelliidi ja mitme jaamaga kontaktiplaan: näivad ligipääsuaknad (SGP4, IAU 2006/2000A, ITU-R P.834 murdumine, valguse levimisaeg), DVB-S2 ACM andmemaht pääsu kohta selge taeva lingibilansist (ETSI EN { "302" } 307-1 tabeli { "13" } lävendid) ja konfliktide lahendamine (üks satelliit antenni kohta ümberpööramisega, üks jaam satelliidi kohta) piirväärtuse ahne meetodiga, mida kontrollitakse täpse hargne-ja-piira meetodi vastu; sademetest tingitud tuhmumist ei ole, (tulemus <c1/>)

# text
seg-f8ef88bc82b5 = Iga allolev arv on ILLUSTRATIVE: mitte ühegi operaatori orbiidid, jaamad ega lingibilanss. MODELLED: ajastajat kontrollitakse oma täpse lahendaja vastu, mitte välise tööriista vastu. (stsenaariumifaili kommentaar, read { "11" } kuni { "12" })

# text
seg-fe2b4799b397 = Mitme satelliidi ja mitme jaamaga maajaamakontaktide ajastamine konfliktide lahendamisega on MODELLED, mitte valideeritud: kontrollitud oma suletud kujul / analüütilise samasuse vastu — tabab ülekirjutus- ja koefitsiendivigu, kuid ei ole väline sõltumatu etalon. (kontrollimaatriks (docs/MODELLED-RATIONALE.md))

# text
seg-be14d99cb86d = <s1>Eelmine</s1>constellation-design

# text
seg-3784be57d6df = <s1>Järgmine</s1>earth-gnss-lunar
