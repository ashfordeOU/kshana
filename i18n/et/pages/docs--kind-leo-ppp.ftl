# docs--kind-leo-ppp: translations (et)

# text
seg-37d29d8303fe = km

# text
seg-cb91473bfdda = Teemaleht: <a1>LEO-PNT.md</a1>

# text
seg-a849735fcc6e = Teemaleht: <a1>LEO-PNT-FUSION.md</a1>

# text
seg-49964654d5f4 = Mootori v{ $version } stsenaariumi liik, perekond <a1>Madala Maa orbiidi navigatsioon</a1>. Nõuandev: uurimis- ja inseneeriatööriista analüüsitulemus; mitte tüübikinnitust omav navigatsiooniseade ega inimelu ohutusega seotud teenus. Iga siinne silt on mootori või kontrollimaatriksi oma; liik on MODELLED, kui maatriks ei ütle teisiti (kuidas silt teenitakse: README peatükk Evidence).

# text
seg-c5478f572d21 = Perekonna leht: <a1>Madala Maa orbiidi navigatsioon</a1>

# text
# c1: docs/kinds/by-kind/leo-ppp.md
seg-8f0aab32310b = Allikas: <c1/>

# text
# c1: leo-ppp
seg-c9852d3b79c8 = <c1/> (stsenaariumi liik)

# text
seg-32a570f1a4fa = Täpse punktpositsioneerimise (PPP) koondumine ainult GNSS-iga ja LEO täiendusega: ujuv laiendatud Kalmani filter ionosfäärivabal koodil ja kandelaine faasil koos paiksete jaamakoordinaatidega, valge vastuvõtjakell, üks süsteemidevaheline nihe iga lisasüsteemi kohta, juhusliku kõnnaku seniidi märgviivitus, mis on kujutatud teguriga 1/sin(elevatsioon), ja ujuv mitmetähenduslikkus satelliidikaare kohta; täpne orbiidi ja kella viga on valge ning satelliidi koodile ja faasile ühine, nii et iga satelliit on üks korreleeritud kaherealine uuendus Josephi stabiliseeritud kujul. Mõõtmised simuleeritakse samast mudelist algväärtusega (seed) müraga mitme jaama ja algväärtuse (seed) korral ning iga juhtum (esimesena ainult GNSS, seejärel iga LEO süsteemide [[case]], mis tahes konstellatsioon või eelseade) esitab koondumisaja mediaani (esimene epohh, mille järel horisontaalne ja vertikaalne viga jäävad allapoole lävesid, vaikimisi { "10" } cm), koondunute osa, vea mediaankõverad ja filtri kooskõla (käivituste keskmine asukoha NEES kahepoolse { "95" }% hii-ruut riba suhtes). Valikuliselt avaldatud Li et al. ({ "2019" }, J. Geod. { "93" }:{ "749" }, doi 10.1007/s00190-018-1195-2) keskmiste laiuskraadide arvude kõrval: { "9.6" } min multi-GNSS-i puhul lüheneb väärtuseni { "7.0" }, { "3.2" }, { "2.1" } ja { "1.3" } min vastavalt { "60" }, { "96" }, { "192" } ja { "288" } LEO satelliidiga. MODELLED: trendi kooskõlavõrdlus, mitte selle uuringu konstellatsioonide, müra või jaamade reprodutseerimine; ei ole täisarvuliste mitmetähenduslikkuste lahendamist, tsüklihüppeid, faasi mähkumist, looteid ega ajas korreleeritud tooteveasid.

# text
# c1: scenarios/leo-ppp-convergence.toml
seg-8126f4edf6b6 = Ühe <c1/> käivituse kokkuvõte: PPP koondumine väärtuseni { "0.10" } m horisontaalselt / { "0.10" } m vertikaalselt, { "12" } käivitust juhtumi kohta, { "96" } GNSS satelliiti ainult GNSS { "0" } LEO mediaan { "7.4" } min koondunud { "100" }% NEES keskmine { "3.13" } { "60" } LEO { "60" } LEO mediaan { "4.8" } min koondunud { "100" }% NEES keskmine { "3.08" } { "96" } LEO { "96" } LEO mediaan { "3.2" } min koondunud { "100" }% NEES keskmine { "2.74" } { "192" } LEO { "192" } LEO mediaan { "2.7" } min koondunud { "100" }% NEES keskmine { "2.65" } { "288" } LEO { "288" } LEO mediaan { "2.3" } min koondunud { "100" }% NEES keskmine { "3.06" } Li et al. { "2019" } (avaldatud, min) vs modelleeritud: { "0" }:9.6/7.4 { "60" }:7.0/4.8 { "96" }:3.2/3.2 { "192" }:2.1/2.7 { "288" }:1.3/2.3

# text
# c1: seed
# c2: duration_s
# c3: step_s
# c4: runs
# c5: criterion_horizontal_m
# c6: criterion_vertical_m
# c7: compare_li_2019
# c8: noise
# c9: site
# c10: gnss
# c11: case
seg-aee2e93b2c20 = Valikulised väljad: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>

# text
# c1: scenarios/leo-ppp-convergence.toml
seg-3589a089c89d = Näide <c1/> määrab muu hulgas:

# text
seg-4dbe1423bb57 = { "60" } LEO

# text
seg-85b65d194f0d = { "96" } LEO

# text
seg-2750ec8c218f = Tulemuse silt (mootori oma): MODELLED ujuv PPP (ionosfäärivaba kood ja faas, valge kell, juhusliku kõnnaku märgviivitus, ujuvad mitmetähenduslikkused kaare kohta) samast mudelist simuleeritud mõõtmistel; Li et al. ({ "2019" }) arvud on trendi võrdlus, mitte reprodutseerimine

# attr:alt
seg-225ef04c64af = Mootori joonistatud diagramm failile scenarios/leo-ppp-convergence.toml, liik leo-ppp

# text
seg-c75ca72ca711 = <b>MODELLED</b> Ujuv PPP laiendatud Kalmani filter ionosfäärivabal koodil ja faasil: paiksed koordinaadid, valge vastuvõtjakell, üks süsteemidevaheline nihe iga lisasüsteemi kohta, juhusliku kõnnaku seniidi märgviivitus, mis on kujutatud teguriga 1/sin(elevatsioon), ujuv mitmetähenduslikkus satelliidi kohta Testid: <a1>leo_fusion_scenarios.rs</a1>.

# text
seg-b55fd1cda5fa = <b>MODELLED</b> Ujuv PPP laiendatud Kalmani filter ionosfäärivabal koodil ja faasil: paiksed koordinaadid, valge vastuvõtjakell, üks süsteemidevaheline nihe iga lisasüsteemi kohta, juhusliku. Sõltumatu etalon (ExternalDataset): NEES hii-ruut test on sisemine kooskõlakontroll (tõde ja filter jagavad mudelit). Trenti võrreldakse Li et al., LEO constellation-augmented multi-GNSS for rapid PPP convergence, J. Geod. { "93" }:749-764 ({ "2019" }), doi 10.1007/s00190-018-1195-2: multi-GNSS { "9.6" } min lüheneb väärtuseni { "7.0" }, { "3.2" }, { "2.1" } ja { "1.3" } min vastavalt { "60" }, { "96" }, { "192" } ja { "288" } LEO satelliidiga. Kaasasolev stsenaarium annab { "7.4" }, { "4.8" }, { "3.2" }, { "2.7" } ja { "2.3" } min koos i

# text
# c1: label
seg-302365809dbf = MODELLED ujuv PPP (ionosfäärivaba kood ja faas, valge kell, juhusliku kõnnaku märgviivitus, ujuvad mitmetähenduslikkused kaare kohta) samast mudelist simuleeritud mõõtmistel; Li et al. ({ "2019" }) arvud on trendi võrdlus, mitte reprodutseerimine (tulemus <c1/>)

# text
# c1: kshana kinds --json
seg-6ce77bce8946 = MODELLED: trendi kooskõlavõrdlus, mitte selle uuringu konstellatsioonide, müra või jaamade reprodutseerimine; ei ole täisarvuliste mitmetähenduslikkuste lahendamist, tsüklihüppeid, faasi mähkumist, looteid ega ajas korreleeritud tooteveasid. (liikide kataloog (<c1/>))

# text
seg-ba2fd25fdcff = Siinsed neli LEO konstellatsiooni on esindavad Walkeri delta kihid kõrgusel { "1000" } km ja kaldega { "60" } kraadi { "60" }, { "96" }, { "192" } ja { "288" } satelliidiga; need EI OLE artikli kavandid ning müra, jaamad ja koondumise määratlus (horisontaalne ja vertikaalne viga alla { "10" } cm käivituse lõpuni) on selle mudeli omad. Võrdlus on seetõttu MODELLED kooskõlakontroll trendi suhtes: koondumine peab lühenema monotoonselt t (stsenaariumifaili kommentaar, read { "10" } kuni { "14" })

# text
seg-b641b835570c = Täpse punktpositsioneerimise koondumine ainult GNSS-iga ja LEO täiendusega on MODELLED, mitte valideeritud: alamväidet kontrollitakse väliselt, kuid kogu võimekus koosneb modelleeritud osadest, nii et võimekus jääb modelleerituks. (kontrollimaatriks (docs/MODELLED-RATIONALE.md))

# text
seg-368eb6979183 = <s1>Eelmine</s1>leo-pnt-chain

# text
seg-2458954d9c22 = <s1>Järgmine</s1>leo-pvt
