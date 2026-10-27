# docs--kind-araim-reference-check: translations (et)

# text
seg-debc2f07db78 = true

# text
# c1: docs/kinds/by-kind/araim-reference-check.md
seg-c53da0bf140d = Allikas: <c1/>

# text
# c1: araim-reference-check
seg-82884391dd77 = <c1/> (stsenaariumi liik)

# text
seg-8e845ce908ee = Mootori v{ $version } stsenaariumi liik, perekond <a1>GNSS-i mõõtmised, positsioneerimine ja terviklikkus</a1>. Nõuandev: uurimis- ja inseneeriatööriista analüüsitulemus; mitte tüübikinnitust omav navigatsiooniseade ega inimelu ohutusega seotud teenus. Iga siinne silt on mootori või kontrollimaatriksi oma; liik on MODELLED, kui maatriks ei ütle teisiti (kuidas silt teenitakse: README jaotis Evidence).

# text
# c1: published
seg-06197409c717 = Avaldatud ARAIM-i sertifitseerimise etalonvektorid: mootori ARAIM-i horisontaalne ja vertikaalne kaitsetase käivitatud WG-C ARAIM-i tehnilise alamrühma ENDA läbitöötatud arvnäidete vastu, tolerantsiga (TOL_PL = { "5e-2" } m), mille need dokumendid ise väidavad. Kaks vektorit on kaasatud fikseeritud andmetena, millest kumbki kannab oma hankimise URL-i, hankimise kuupäeva, lähtefaili SHA-256 ja lehekülge: Reference Airborne Algorithm Description Document v3.1 ({ "2019" }) lisa D — sisemiselt kooskõlaline ja vastuvõtuvektor — ning Milestone { "3" } Report ({ "2016" }) lisa A jaotis A.IX, väide, mida uurimisbibliograafiad tsiteerivad. Iga avaldatud sisend (10 satelliidi ja 2 satelliidikonstellatsiooni geomeetriamaatriks, C_int ja C_acc dispersioonidiagonaalid, b_nom, P_sat, P_const ja LPV-200 konstantide komplekt) ja iga avaldatud väljund (VPL, HPL, EMT, sigma_v_acc, K_fa_3 ning kahe konstellatsiooniriketerežiimi sigma_3, sigma_ss_3 ja b_3) on esitatud mootori enda arvu ja nende absoluutse erinevuse kõrval. Kaitsetaseme võrrandit EI lahendata siin uuesti: etaloni režiimide loend antakse mootori olemasolevale funktsioonile raim::araim_protection_level / araim_integrity_risk, nii et katsetatav poolitamine ja Gaussi sabaalgebra on mootori enda; selle jaoks on ehitatud ainult geomeetria, alamlahendid, tuvastuslävendid ja avaldatud eelarvejaotus. VÄLISELT KONTROLLITUD { "2019" } vektori vastu: VPL { "18.2926" } m vs avaldatud { "18.3" } m, HPL { "13.4063" } m vs { "13.45" } m, EMT { "7.2997" } m vs { "7.2998" } m, sigma_v_acc { "1.3694" } m vs { "1.3694" } m ning kõik kuus avaldatud vahetulemust poole ühiku täpsusega viimases trükitud kümnendkohas. { "2016" } vektor sisaldab kaht sisemist viga, mida aruanne ütleb välja, mitte ei peida — märgitrükiviga G reas { "3" } ja K_fa_3, mis on hinnatud { "57" } rikkerežiimi juures, kuigi dokument ütleb N_fault_max = { "1" } ({ "12" } režiimi) — seega selle geomeetria vahetulemused taastuvad täpselt, kuid selle kaitsetasemed on esitatud mõõdetud lahknevustena ja jäetud vastuvõtunäitajast välja; tolerantsi ei laiendata kunagi neid neelamaks. Iga väljastatud arvväli kannab ühikut ja päritoluklassi ning ümberkirjutatud arv on märgitud <c1/>, et seda ei saaks kunagi arvutatuga segi ajada. ULATUS: realiseeritud on ainult N_fault_max = { "1" } (üksiksatelliidi ja üksikkonstellatsiooni rikkerežiimid) ning juhtum, mille eelhinnangud nõuavad üheaegseid mitmesündmuselisi rikkealamhulki, on REFUSED, mitte vaikselt kärbitud; rikke tuvastamine, välistamine, hii-ruut kooskõlakontroll ja etalonalgoritmi topeltarvestuse ümberjaotamise samm on ulatusest väljas. See reprodutseerib avaldatud etalonalgoritmi läbitöötatud näidet — see ei ole sertifikaat, lennukõlblikkuse artefakt ega kinnitus.

# text
# c1: scenarios/araim-reference-check.toml
seg-c16de81ec8da = Ühe <c1/> jooksu kokkuvõte: araim-reference-check: { "2" } avaldatud WG-C etalonvektorit; halvim VPL/HPL kokkulangevus { "0.0437" } m etaloni enda TOL_PL = { "0.05" } m vastu { "1" } vastuvõtuvektori üle

# text
# c1: vector
seg-b1be6b5632c1 = Valikulised väljad: <c1/>

# text
# c1: scenarios/araim-reference-check.toml
seg-3f181d41edb5 = Näide <c1/> määrab muu hulgas:

# text
seg-9de6e1b3352d = Tulemuse silt (mootori oma): EXTERNALLY CHECKED — mootori ARAIM-i kaitsetasemed käivitatud EL-USA Working Group C ARAIM-i tehnilise alamrühma etalonlennualgoritmi avaldatud läbitöötatud arvnäidete vastu, tolerantsiga (TOL_PL), mille need dokumendid ise väidavad. Iga avaldatud arv kannab oma allika UR

# attr:alt
seg-693c823c85d1 = Diagramm, mille mootor kirjutab failile scenarios/araim-reference-check.toml, liik araim-reference-check

# text
seg-3068552e4ab4 = VALIDATED: selle liigi nimetavad <a1>kontrollimaatriksi</a1> read.

# text
seg-c5c966ec3c6a = <b>VALIDATED</b> Mitme hüpoteesi lahendite eraldatuse kaitsetaseme võrrand ise: kõiki vaadeldavaid ja rikkerežiimi kaupa kaalutud vähimruutude lahendid East/North/Up geomeetrial ühe kella olekuga konstellatsiooni kohta, alamlahendite sigmad, lahendite eraldatus Testid: <a1>araim_reference_vectors.rs</a1>.

# text
seg-a99b9cf4c6e8 = <b>VALIDATED</b> Mitme hüpoteesi lahendite eraldatuse kaitsetaseme võrrand ise: kõiki vaadeldavaid ja rikkerežiimi kaupa kaalutud vähimruutude lahendid East/North/Up geomeetrial. Sõltumatu etalon (ExternalDataset): EL-USA Working Group C ARAIM-i tehniline alamrühm, Reference Airborne Algorithm Description Document v3.1 ({ "20" }. juuni { "2019" }), lisa D läbitöötatud arvnäide — avaldatud SISENDID (10 satelliidi ja 2 satelliidikonstellatsiooni geomeetriamaatriks, C_int/C_acc diagonaalid, b_nom, P_sat, P_const, LPV-200 konstandid) ja avaldatud VÄLJUNDID (VPL { "18.3" } m, HPL { "13.45" } m, EMT { "7.2998" } m, σ_v_acc { "1.3694" } m, K_fa_3 { "5.1083" } ja kuus konstellatsiooniriketi vahetulemust

# text
seg-f6b7ca020692 = Perekonna leht: <a1>GNSS-i mõõtmised, positsioneerimine ja terviklikkus</a1>

# text
seg-f4cf8b629797 = Teemaleht: <a1>INTEGRITY.md</a1>

# text
seg-e6b1f9a47b5d = Teemaleht: <a1>ARAIM_REFERENCE.md</a1>

# text
seg-7cf434223fa5 = <s1>Eelmine</s1>aperture-duty-cycle

# text
seg-ed2003ecf41b = <s1>Järgmine</s1>ascent-losses
