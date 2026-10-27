# docs--kind-lunar-infrastructure: translations (et)

# text
seg-1f17ef6a853e = Mootori v{ $version } stsenaariumi liik, perekond <a1>Kuu ja tsislunaarne ruum</a1>. Nõuandev: uurimis- ja inseneeriatööriista analüüsitulemus; mitte tüübikinnitust omav navigatsiooniseade ega inimelu ohutusega seotud teenus. Iga siinne silt on mootori või kontrollimaatriksi oma; liik on MODELLED, kui maatriks ei ütle teisiti (kuidas silt teenitakse: README jaotis Evidence).

# text
seg-1c1eeb2dcaa0 = Perekonna leht: <a1>Kuu ja tsislunaarne ruum</a1>

# text
seg-619127334cf3 = Ükski maatriksirida ei nimeta seda liiki nimepidi; selle tulemuse silt on mootori enda, ülal.

# text
# c1: scenarios/
seg-d1beb62cf742 = { "6" } kaasasolevat stsenaariumi kasutab seda liiki; ülejäänud on kaustas <a1><c1/></a1>.

# text
# c1: docs/kinds/by-kind/lunar-infrastructure.md
seg-e821670a8b55 = Allikas: <c1/>

# text
# c1: lunar-infrastructure
seg-56953faa67ae = <c1/> (stsenaariumi liik)

# text
# c1: study
seg-d0fb90f506c9 = MODELLED uuringud Kuu orbiidist ja pinnast kui navigatsiooni- ja geodeetilisest infrastruktuurist, viis uuringut ühe liigi taga, mida valib <c1/>: od-consistency (pardal Maa-GNSS orbiidi määramine NRHO-s või ELFO-s sõltumatu maapealse radiomeetrilise orbiidi määramise vastu, hinnatud nende endi kovariatsioonide alusel algväärtusega (seed) Monte Carlo üle), carrier-phase (ühine pinna-orbiitri kahekordselt diferentseeritud kandelaine faas ja täisarvuliste mitmetähenduslikkuste lahendamine LAMBDA-ga), frame-coestimation (pinnajaam ja orbiitrid lisatud Maa jaamade ulatuse mõõtmisele seitsmeparameetrilise Kuu tugisüsteemi datumi jaoks), space-tie (GNSS, VLBI ja laserulatus ühel kosmoseaparaadil, tugisüsteemi seose täpsus kohaliku seose vea suhtes) ja geodesy-sensitivity (Kuu Love'i arvude h2, k2, l2 ja füüsikalise libratsiooni Fisheri informatsioon laserulatuse, orbiitri jälgimise, pinnagravimeetri ja pinnakella põhjal). Piiratud kolme keha mudel kindlaksmääratud lihtsustustega; numbrilisi lahendusi kontrollitakse sõltumatute programmide vastu ja midagi ei võrrelda Kuu suuruse mõõtmisega.

# text
# c1: scenarios/lunar-infrastructure-space-tie.toml
seg-5753b7552559 = Ühe <c1/> käivituse kokkuvõte: lunar-infrastructure space-tie: { "4" } pühkimispunkti { "1" } kaarel; laser-vs-GNSS x translatsiooni sigma { "1.0363" } m registreeritud kohaliku seose korral

# text
# c1: study
seg-f2594b18e718 = Kohustuslikud väljad: <c1/>

# text
# c1: seed
# c2: orbit
# c3: gnss
# c4: ground
# c5: monte_carlo
# c6: surface
# c7: llr
# c8: orbiter
# c9: gravimeter
# c10: clock
# c11: techniques
# c12: nominal
seg-4875c29c517c = Valikulised väljad: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>

# text
# c1: scenarios/lunar-infrastructure-space-tie.toml
seg-7b33bdb70a30 = Näide <c1/> määrab muu hulgas:

# text
seg-5fad84cbb2be = nrho

# text
seg-def582a1f2ca = Tulemuse silt (mootori oma): MODELLED — piiratud kolme keha mudel (Maa ja Kuu punktmassid, ilma Päikeseta, ilma Kuu gravitatsiooniharmoonikuteta) kindlaksmääratud lihtsustustega ja ILLUSTRATIVE sisenditega, mis on märgitud oma avalike allikatega. Numbrilisi lahendusi kontrollitakse sõltumatute programmide vastu; midagi ei võrrelda Kuu suuruse

# text
seg-f3b4a80a739b = graafikut ei ole: näide ei kirjuta diagrammi

# text
seg-35a4a7a25561 = <b>MODELLED</b> Orbiidi määramine peaaegu sirgjoonelisel halo orbiidil (või elliptilisel külmutatud orbiidil) kahest sõltumatust andmetüübist: pardal vastuvõetud Maa-GNSS pseudovahemaad. Oraakel (sõltumatu etalon) (ReferenceImpl): Sõltumatu scipy/numpy programm integreerib samu variatsioonivõrrandeid (lävi O1). Midagi ei võrrelda Kuu orbiidi mõõtmisega. Sõltumatu etalon kontrollib kindlaksmääratud valemite numbrilisi lahendusi, mitte füüsikat, seega jääb rida MODELLED. Piiratud kolme keha mudel: ilma Päikeseta, ilma Kuu harmoonikuteta, Maa pöörlemistelg piki orbiidi normaali, ILLUSTRATIVE vastuvõtja ja jaama sisendid.

# text
seg-32455bf5f804 = <b>MODELLED</b> Vastuvõtjatevaheline üksikdiferentseeritud Maa-GNSS kandelaine faas ja kood Kuu pinnajaamas ja orbiitril, epohhipõhise kellaerinevuse profileeritud välja. Oraakel (sõltumatu etalon) (ReferenceImpl): Sõltumatu numpy lahendus samade normaalvõrrandite jaoks eksporditud ridadest (Q3) ja jõumeetodil täisarvude loendamine (Q4). Ühtegi GNSS-i ega Kuu kandelaine faasi mõõtmist ei võrrelda. MODELLED.

# text
seg-b20c412516b6 = <b>MODELLED</b> Seitsmeparameetrilise Kuu tugisüsteemi datumi Fisheri informatsioon Maa jaama laserulatusest viiele reflektorile üksi ja orbiitri-pinnajaama ra. Oraakel (sõltumatu etalon) (ReferenceImpl): Sõltumatu numpy lõplik erinevus edasimudelist (F2). Midagi ei võrrelda päris Kuu tugisüsteemi lahendustega. Tegur on tingimuslik eeldatava teadaoleva orbiidi ja { "1" } m ulatuse sigma suhtes. MODELLED.

# text
seg-151c96b1f882 = <b>MODELLED</b> Cramer-Rao täpsus GNSS-i, VLBI ja laserulatuse tugisüsteemide tehnikatevahelise translatsiooni, skaala ja pöörde nihete jaoks, kui üks kosmoseaparaat kannab kõiki. Oraakel (sõltumatu etalon) (ReferenceImpl): Sõltumatu numpy virnastatud süsteem, kus asukoha tundmatud on elimineeritud selgesõnaliste Schuri komplementidega (T3). Ühtegi GRASP, Genesis ega muu missiooni andmeid ei võrrelda. MODELLED.

# text
# c1: label
seg-743d78806f6a = MODELLED — piiratud kolme keha mudel (Maa ja Kuu punktmassid, ilma Päikeseta, ilma Kuu gravitatsiooniharmoonikuteta) kindlaksmääratud lihtsustustega ja ILLUSTRATIVE sisenditega, mis on märgitud oma avalike allikatega. Numbrilisi lahendusi kontrollitakse sõltumatute programmide vastu; midagi ei võrrelda Kuu suuruse mõõtmisega ja midagi siin ei ole väide ühegi missiooni ega süsteemi kohta. Ei ole seotud ühegi agentuuriga ega ühegi agentuuri heaks kiidetud. Nõuand (tulemus <c1/>)

# text
# c1: study
# c2: kshana kinds --json
seg-da35c5298311 = MODELLED uuringud Kuu orbiidist ja pinnast kui navigatsiooni- ja geodeetilisest infrastruktuurist, viis uuringut ühe liigi taga, mida valib <c1/>: od-consistency (pardal Maa-GNSS orbiidi määramine NRHO-s või ELFO-s sõltumatu maapealse radiomeetrilise orbiidi määramise vastu, hinnatud nende endi kovariatsioonide alusel algväärtusega (seed) Monte Carlo üle), carrier-phase (ühine pinna-orbiitri kahekordselt diferentseeritud kandelaine faas ja täisarvuliste mitmetähenduslikkuste (liikide kataloog (<c2/>))

# text
seg-4658f67623b5 = Kshana lunar-infrastructure stsenaarium: space-tie. MODELLED; kavand, sisendid ja lävi on fikseeritud failis xval/lunar-infra/PREREGISTRATION.md (kinnitatud enne ühtegi käivitust). ILLUSTRATIVE sisendid on seal märgitud oma avalike allikatega. (stsenaariumifaili kommentaar, read { "1" } kuni { "3" })

# text
seg-f7257c25f137 = Kuu orbiidi määramine: Maa-GNSS vs maapealne radiomeetriline on MODELLED, mitte valideeritud: kontrollitud eraldi teostuse vastu samas koodibaasis — sõltumatu testitavast üksusest, kuid mitte väliselt autoriteetne. (kontrollimaatriks (docs/MODELLED-RATIONALE.md))

# text
seg-a3988ca0b8ea = Kuu kandelaine faasi täisarvuliste mitmetähenduslikkuste lahendamine: pind ja orbiiter on MODELLED, mitte valideeritud: kontrollitud eraldi teostuse vastu samas koodibaasis — sõltumatu testitavast üksusest, kuid mitte väliselt autoriteetne. (kontrollimaatriks (docs/MODELLED-RATIONALE.md))

# text
seg-b2e4ab7b6e60 = Kuu tugisüsteemi koos-hindamine: pinnajaamad ja orbiitrid on MODELLED, mitte valideeritud: kontrollitud eraldi teostuse vastu samas koodibaasis — sõltumatu testitavast üksusest, kuid mitte väliselt autoriteetne. (kontrollimaatriks (docs/MODELLED-RATIONALE.md))

# text
seg-6eedb30a58c5 = Space-tie tugisüsteemi seose täpsus: samas kohas asuv GNSS, VLBI ja laserulatus on MODELLED, mitte valideeritud: kontrollitud eraldi teostuse vastu samas koodibaasis — sõltumatu testitavast üksusest, kuid mitte väliselt autoriteetne. (kontrollimaatriks (docs/MODELLED-RATIONALE.md))

# text
seg-cd5f729c9622 = Teemaleht: <a1>LUNAR-INFRASTRUCTURE.md</a1>

# text
seg-4df4c0059362 = <s1>Eelmine</s1>lunar-frame-realisation

# text
seg-c88eef4a7214 = <s1>Järgmine</s1>lunar-integrity
