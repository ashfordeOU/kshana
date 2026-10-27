# docs--kind-aperture-duty-cycle: translations (et)

# text
seg-99ef7c1d552c = Mootori v{ $version } stsenaariumi liik, perekond <a1>Missioonianalüüs, lingid ja kosmoseoperatsioonid</a1>. Nõuandev: uurimis- ja inseneeriatööriista analüüsitulemus; mitte tüübikinnitust omav navigatsiooniseade ega inimelu ohutusega seotud teenus. Iga siinne märgis on mootori või kontrollimaatriksi oma; liik on MODELLED, kui maatriks ei ütle teisiti (kuidas märgis teenitakse: README jaotis Evidence).

# text
seg-8f1e7d3f5a07 = Perekonna leht: <a1>Missioonianalüüs, lingid ja kosmoseoperatsioonid</a1>

# text
# c1: docs/kinds/by-kind/aperture-duty-cycle.md
seg-4b695c0dfc9f = Allikas: <c1/>

# text
# c1: aperture-duty-cycle
seg-632c0a545845 = <c1/> (stsenaariumi liik)

# text
# c1: [[contacts]]
# c2: passes
seg-0cef33b41040 = Apertuuri töötsükkel: navigatsiooni ja side ajajaotus, mida kontaktiplaan eeldab juhitavate apertuuride kogumi jaoks. Võtab kontaktiplaani (<c1/> aos_s/los_s akende loend, millest igaüks küsib navigatsiooni või sidet — sama aos_s/los_s sõnavara, mida annab <c2/>-ennustaja), apertuuride arvu ja ARBITREERIMISPOLIITIKA (vaikimisi navigatsiooniprioriteet, või sideprioriteet, või mitte-eelistav first-come-first-served) ning annab navigatsiooni töötsükli, side töötsükli, jõudeoleku töötsükli ja seansi kohta katkestuse — kontaktiaja, mida seanss küsis ja ükski apertuur ei teenindanud. Täpne intervallipühkimine üle akende piiride, nii et kokkupuutuvad aknad ei konkureeri kunagi ja ühtegi apertuurisekundit ei loeta kaks korda; navigatsiooni, side ja jõudeoleku apertuurisekundid akumuleeritakse sõltumatult ja sulguvad suhtes apertures*horizon_s. Aruanne esitab lahendatud poliitika, selle täieliku määratluse ning töötsükli ja katkestuse määratlused, sest ilma arbitreerimispoliitikata esitatud töötsükli arv ei ole reprodutseeritav. MODELLED ajastusaritmeetika: apertuuri teenust või seanssi vahetades ei arvestata ümberpööramise / ümberhäälestuse / üleminekuaega, otsusesse ei lähe andmemahtu, puhvri olekut, energiaeelarvet ega lingi sulgumist ning kontaktiaknad on sisendid — nende geomeetria on see, mis neid tootis. Mitte maajaama ajastustoode.

# text
# c1: scenarios/aperture-duty-cycle.toml
seg-a8d79b8a96bc = Ühe <c1/> jooksu kokkuvõte: aperture-duty-cycle: { "6" } seanssi { "2" } apertuuril navigatsiooniprioriteedi all -> navigatsiooni töötsükkel { "0.1167" }, side töötsükkel { "0.2667" }, jõudeolek { "0.6167" }; { "0" } s { "6900" } s küsitust läks konkurentsi tõttu kaotsi (MODELLED)

# text
# c1: apertures
# c2: arbitration
# c3: horizon_start_s
# c4: horizon_end_s
# c5: contacts
seg-67c665d5c8c0 = Valikulised väljad: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>

# text
# c1: scenarios/aperture-duty-cycle.toml
seg-60f25ccdab6e = Näide <c1/> määrab muu hulgas:

# text
seg-bf51947657c0 = navigatsioon

# text
seg-b4ff1d640bdf = side

# text
seg-2e78730d0737 = aperture*s

# text
seg-330cbcd04718 = murd (dimensioonitu)

# text
seg-0ef5875db338 = Tulemuse silt (mootori oma): MODELLED — apertuuride ajastusaritmeetika etteantud kontaktiplaani üle: täpne intervallipühkimine navigatsiooni ja side ajajaotusest ning seansi kohta konkurentsikaost nimetatud arbitreerimispoliitika all. Apertuuri teenust või seanssi vahetades ei arvestata ümberpööramise / ümberhäälestuse / üleminekuaega,

# attr:alt
seg-a8b38ed8e029 = Diagramm, mille mootor kirjutab failile scenarios/aperture-duty-cycle.toml, liik aperture-duty-cycle

# text
# c1: passes::predict_passes
# c2: aperture_duty::windows_from_passes
seg-4636d450ef60 = <b>MODELLED</b> Üks jooks võtab kontaktiplaani (aos_s/los_s akende loend, millest igaüks küsib apertuurilt navigatsiooni või sidet — sama akende sõnavara, mida annab <c1/>, teisendatud funktsiooniga <c2/>), apertuuri

# text
seg-7a5aa78533d3 = <b>MODELLED</b> Üks jooks võtab kontaktiplaani (aos_s/los_s akende loend, millest igaüks küsib apertuurilt navigatsiooni või sidet — sama akende sõnavara, mida annab `passes::pre. Sõltumatu etalon (InternalConsistency): Sisemine kooskõla kolmest suurusest, mis on arvutatud samas pühkimises erinevate avaldistega ja millelt seejärel nõutakse sulgumist. Navigatsiooni apertuurisekundid, side apertuurisekundid ja jõudeoleku apertuurisekundid akumuleeritakse eraldi — jõudeolek (apertures − |served|) järgi elementaarintervalli kohta, mitte kunagi jäägina — ja nende summat kontrollitakse suhte apertures × horizon_s vastu, mida valesti sulgenud piir, topelt-c

# text
# c1: label
seg-a388c24fec99 = MODELLED — apertuuride ajastusaritmeetika etteantud kontaktiplaani üle: täpne intervallipühkimine navigatsiooni ja side ajajaotusest ning seansi kohta konkurentsikaost nimetatud arbitreerimispoliitika all. Apertuuri teenust või seanssi vahetades ei arvestata ümberpööramise / ümberhäälestuse / üleminekuaega, otsusesse ei lähe andmemahtu, puhvri olekut, energiaeelarvet ega lingi sulgumist ning kontaktiaknad on sisendid — th (tulemus <c1/>)

# text
# c1: kshana kinds --json
seg-e689f30b268a = MODELLED ajastusaritmeetika: apertuuri teenust või seanssi vahetades ei arvestata ümberpööramise / ümberhäälestuse / üleminekuaega, otsusesse ei lähe andmemahtu, puhvri olekut, energiaeelarvet ega lingi sulgumist ning kontaktiaknad on sisendid — nende geomeetria on see, mis neid tootis. (liikide kataloog (<c1/>))

# text
# c1: passes
seg-4aa40af30bd2 = ÕIGLANE ULATUS: MODELLED ajastusaritmeetika etteantud akende üle. Apertuuri teenust või seanssi vahetades ei arvestata ümberpööramise / ümberhäälestuse / üleminekuaega; otsusesse ei lähe andmemahtu, puhvri olekut, energiaeelarvet ega lingi sulgumist; ning kontaktiaknad on sisendid -- nende geomeetria on see, mis neid tootis (stsenaarium <c1/> annab sama aos_s / los_s sõnavara). Mitte maajaama ajastus (stsenaariumifaili kommentaar, read { "18" } kuni { "24" })

# text
seg-0b7f8d86e5d5 = Apertuuri navigatsiooni ja side töötsükkel on MODELLED, mitte valideeritud: kontrollitud oma suletud kujul / analüütilise samasuse vastu — tabab ülekirjutus- ja koefitsiendivigu, kuid ei ole väline sõltumatu etalon. (kontrollimaatriks (docs/MODELLED-RATIONALE.md))

# text
seg-dbbefaba93dc = <s1>Eelmine</s1>aocs

# text
seg-5b4fd889fdff = <s1>Järgmine</s1>araim-reference-check
