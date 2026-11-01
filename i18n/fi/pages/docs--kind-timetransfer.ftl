# docs--kind-timetransfer: translations (fi)

seg-c61e88721556 = Moottorin v{ $version } skenaariotyyppi, perhe <a1>Kellot, ajoitus ja holdover</a1>. Ohjeellinen: tutkimus- ja suunnittelutyökalun analyysitulos; ei tyyppihyväksytty navigointilaite eikä ihmishengen turvaamiseen tarkoitettu palvelu. Jokainen tässä oleva merkintä on moottorin tai varmennusmatriisin oma; tyyppi on MODELLED, ellei matriisi toisin sano (miten merkintä ansaitaan: README-tiedoston osio Evidence).

seg-849c08d3ce70 = Perhesivu: <a1>Kellot, ajoitus ja holdover</a1>

seg-5a70fcb097dc = Valinnaiset kentät: ei yhtään

seg-a1810bbca337 = <b>MODELLED</b> Kaksisuuntainen/TWSTFT (Sagnac), GNSS yhteisnäkymä, PPP; linkin värinä→etäisyys. Oraakkeli (ExternalDataset): Sagnac-suuruus tarkistettu arvovaltaista JULKAISTUA ARVOA vasten — N. Ashby, 'Relativity in the GPS', Living Reviews in Relativity { "6" }:{ "1" } ({ "2003" }), yhtälö { "1.29" }: itään suuntautuva päiväntasaajan kiertomatka kerryttää { "207.4" } ns (2ωA_E/c²); kshana toistaa { "207.386" } ns. Riippumattomasti vahvistettu RTKLIB { "2.4.3" } geodist() (Takasu, BSD-2-Clause), joka kantaa saman 2Aω/c²-geometrian. Yhdistetty BIPM TWSTFT -transponderi/yhteisnäkymä/

seg-a8beb8dfc757 = Ajansiirron virhebudjetointi on MODELLED, ei validoitu: osaväite tarkistetaan ulkoisesti, mutta koko kyvykkyys koostuu mallinnetuista osista, joten kyvykkyys jää mallinnetuksi. (varmennusmatriisi (docs/MODELLED-RATIONALE.md))

seg-37a77f49f048 = ps

# text
# c1: docs/kinds/by-kind/timetransfer.md
seg-2ccebbc74d9f = Lähde: <c1/>

# text
# c1: timetransfer
seg-289a9f8dc990 = <c1/> (skenaariolaji)

# text
seg-ccb244e60d60 = Optinen vastaan RF-kaksisuuntainen aika- ja taajuudensiirto.

# text
# c1: scenarios/timetransfer.toml
seg-59347fda6c66 = Yksi ajo, jossa on <c1/>, tiivistyy seuraavasti: scenario 8f9c2e0e31a5 | optical sync_rms 0.98ps range_rms 0.293mm adev(1s) { "1.73e-12" } | RF sync_rms 1137.3ps range_rms 341.0mm adev(1s) { "8.65e-10" }

# text
# c1: seed
# c2: samples
# c3: step_s
# c4: range_spec_mm
# c5: link_quantum
# c6: link_classical
seg-890040dd3d96 = Pakolliset kentät: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>

# text
# c1: scenarios/timetransfer.toml
seg-7b887ea27a86 = Esimerkki <c1/> asettaa muun muassa seuraavat:

# text
seg-2485eaa6dbf4 = Kaksisuuntainen satelliittiaika- ja taajuudensiirto (TWSTFT, Ku-kai

# text
seg-fa54f1a81b57 = Optinen satelliittien välinen linkki, pikosekuntitason synkronoin

# text
seg-a30fe2b87ee2 = mm

# attr:alt
seg-bd76bd68eab3 = Moottorin kirjoittama kaavio skenaariolle scenarios/timetransfer.toml, laji timetransfer

# text
seg-3c9d28692f9f = <b>MODELLED</b> Kaksisuuntainen/TWSTFT (Sagnac), GNSS:n yhteisnäkymä, PPP; linkin värinä→etäisyys Testit: <a1>time_transfer_error_budgeting_reference.rs</a1>.

# text
seg-84fcf20588fb = <s1>Edellinen</s1>time-transfer-budget

# text
seg-149ad280a1f9 = <s1>Seuraava</s1>tracking-loop
