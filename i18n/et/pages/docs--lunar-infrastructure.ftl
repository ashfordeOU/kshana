# docs--lunar-infrastructure: translations (et)

# text
seg-cae10fb9bff8 = Stsenaarium

# text
seg-61817375c8ea = Kuu orbiit ja pind navigatsiooni- ja geodeetilise infrastruktuurina

# text
seg-9872e31ebd72 = Allikad

# text
# c1: docs/LUNAR-INFRASTRUCTURE.md
seg-922905241a6b = Allikas: <c1/>

# text
# c1: lunar-infrastructure
# c2: study
seg-bfb9c5efbe57 = Stsenaariumi liik <c1/>, viis uuringut, mis valitakse käsuga <c2/>. <b>MODELLED</b>: piiratud kolme keha mudel, millel on sätestatud lihtsustused ja ILLUSTRATIVE sisendid. Numbrilisi arvutusi kontrollitakse sõltumatute numpy/scipy programmidega; midagi ei võrrelda Kuu suuruse mõõtmisega ja siin ei ole midagi väidet ühegi missiooni või süsteemi kohta. Ei ole seotud ühegi ametiga ega nende heaks kiidetud. Nõuandev tarkvara, mitte tüübikinnitust omav seade. Kshana ei edasta midagi ega juhi ühtegi riistvara.

# text
# c1: xval/lunar-infra/PREREGISTRATION.md
# c2: PREREGISTRATION-amendment-1.md
# c3: xval/lunar-infra/RESULTS.md
seg-7908583855a2 = Kavandid, sisendid ja lävendid fikseeriti failis <c1/> (kinnitatud enne, kui ühtki uuringut hinnati) ja kahes avalikustatud muudatuses (<c2/>). Iga läve otsus on failis <c3/>.

# text
seg-d9d9d0864ae0 = Uuring

# text
seg-3b01a756c305 = Mida see arvutab

# text
# c1: family = "elfo"
seg-a4ef7c81b35f = Pardal Maa-GNSS-i orbiidi määramine NRHO-s (või <c1/>) sõltumatu maapealse ulatuse ja ulatuskiiruse OD vastu kolmest DSN-i jaamast; iga hinnangu formaalne kovariatsioon; algväärtusega (seed) Monte Carlo selle kohta, kas kaks kovariatsiooni seletavad nende erinevust (q, hii-ruut { "6" } vabadusastmega); süstitud modelleerimata kiirendus

# text
# c1: lunar-infrastructure-carrier-phase.toml
# c2: xval/lunar-infra/scenarios/carrier-phase-scored.toml
seg-849c67471e69 = <c1/> (kiire), <c2/> (hinnatud, umbes kaheksa minutit)

# text
seg-b9c6eb8d778c = Ühine pinnajaama ja orbiidil oleva aparaadi kahekordselt diferentseeritud kandelaine faas; ujuva mitmetähenduslikkuse kovariatsioon; LAMBDA; bootstrap-meetodil ja Monte Carlo meetodil saadud edukus; ujuva ja fikseeritud lahendi asukoha sigma

# text
seg-74c347e0bc69 = 7-parameetrilise Kuu datumi Fisheri informatsioon Maa jaamade kaugusmõõtmisest, orbiidi ja pinnajaamade vaheliste kauguste olemasolul ja puudumisel; algväärtusega (seed) juhuslikud jaamakomplektid

# text
seg-4ed875c39781 = GNSS, VLBI ja laserkaugusmõõtmine ühel kosmoseaparaadil: tehnikatevaheliste nihete Cramér–Rao korduvtäpsus kohaliku sidumise vea suhtes

# text
seg-de25104c09a2 = Informatsioon suuruste h2, k2, l2 ja füüsilise libratsiooni kohta laserkaugusmõõtmisest, orbiidi jälgimisest, gravimeetrist ja pinnakellast (konstandid jagatud Kuu aja moodulitega)

# attr:alt
seg-18fc4ba766df = Pardal tehtud Maa-GNSS orbiidi määramise kooskõla peaaegu sirgjoonelises halo-orbiidis sõltumatu maapealse orbiidi määramisega, mootori v{ $version } tegelikest käivitustest stsenaariumil scenarios/lunar-infrastructure-od-consistency.toml ja mudelivea variandil ({ "400" } katset kummagi kohta). Keskmine normaliseeritud erinevus q on { "5.81" } ilma mudeliveata ja { "5.95" } süstitud kiirendusveaga { "3e-10" } m/s2, oodatava { "6" } vastu: need kaks orbiidilahendit on kooskõlas (lävi C1 MET). Katsete osakaal üle { "95" } % punkti on { "0.040" } ja { "0.052" }; süstitud vea tuvastamise lävi oli vähemalt { "0.5" }, seega on see NOT MET (C3): pardalahend on teada umbes { "352" } m täpsusega, maapealse oma { "23" } m vastu, nii et kümnemeetrine nihe jääb selle kovariatsiooni sisse peitu. MODELLED: piiratud kolme keha mudel, millel on sätestatud lihtsustused ja illustratiivsed sisendid, mitte ühegi Kuu suuruse mõõtmine. Nõuandev: uurimis- ja inseneeriatööriista analüüsitulemus; mitte tüübikinnitust omav navigatsiooniseade ega inimelu ohutusega seotud teenus.

# attr:alt
seg-4c08262e2556 = Kandelaine täisarvulise mitmetähenduslikkuse fikseerimine Kuu pinnajaamade ja orbiidil oleva aparaadi vahel, mootori v{ $version } hinnatud käivituse kinnitatud tulemusest (tests/fixtures/lunar_infra/phase_full_run.json: { "3" } kaare pikkust, igaühe kohta { "400" } tõmbega Monte Carlo, kirjutatud failiga scenarios/carrier-phase-scored.toml). { "1" } päev: edukus { "1.0" } % (standardviga { "0.5" } %), { "134" } mitmetähenduslikkust, orbiidil oleva aparaadi asukoha sigma { "45.6" } m ujuval ja { "18.5" } m fikseeritud lahendil; { "2" } päeva: edukus { "0.5" } % (standardviga { "0.4" } %), { "259" } mitmetähenduslikkust, orbiidil oleva aparaadi asukoha sigma { "21.5" } m ujuval ja { "8.7" } m fikseeritud lahendil; { "3" } päeva: edukus { "2.8" } % (standardviga { "0.8" } %), { "375" } mitmetähenduslikkust, orbiidil oleva aparaadi asukoha sigma { "6.3" } m ujuval ja { "2.1" } m fikseeritud lahendil. Täisarvulist fikseerimist ei saavutata: edukus jääb vahemikku { "1" } % kuni { "3" } % võimendusel { "25" } dBi ja registreeritud { "12" } dBi juures ei saa ülesannet moodustada. MODELLED: piiratud kolme keha mudel, millel on sätestatud lihtsustused ja illustratiivsed sisendid, mitte ühegi Kuu suuruse mõõtmine. Nõuandev: uurimis- ja inseneeriatööriista analüüsitulemus; mitte tüübikinnitust omav navigatsiooniseade ega inimelu ohutusega seotud teenus.

# attr:alt
seg-7e5b10641b20 = Seitsmeparameetrilise Kuu datumi (kolm nihet, üks mastaap ja kolm pööret) korduvtäpsus Maa jaamade kaugusmõõtmisest, orbiidi ja pinnajaamade vaheliste kauguste olemasolul ja puudumisel, mootori v{ $version } tegelikust käivitusest stsenaariumil scenarios/lunar-infrastructure-frame-coestimation.toml. Nihete ja pöörete Cramér–Rao sigma väheneb orbiidi lingide lisamisel (näiteks t_z väärtuselt { "0.98" } m väärtusele { "0.046" } m); väikseim informatsiooni omaväärtus tõuseb 111-kordseks ja CRLB jälg langeb väärtuseni { "1.0" } % (lävi F3 MET). See eeldab, et orbiit on Kuu telgedes teada ning selle viga kantakse orbiidi kauguse sigma { "1" } m kaudu. MODELLED: piiratud kolme keha mudel, millel on sätestatud lihtsustused ja illustratiivsed sisendid, mitte ühegi Kuu suuruse mõõtmine. Nõuandev: uurimis- ja inseneeriatööriista analüüsitulemus; mitte tüübikinnitust omav navigatsiooniseade ega inimelu ohutusega seotud teenus.

# attr:alt
seg-377d29dcc6e8 = Ühe kosmoseaparaadi laserkaugusmõõtmise, VLBI ja GNSS asukohtade vaheliste nihete korduvtäpsus maapealse kohaliku sidumise vea suhtes, mootori v{ $version } tegelikust käivitusest stsenaariumil scenarios/lunar-infrastructure-space-tie.toml (üks 6,56-päevane kaar, tehnikate sigmad GNSS { "10" } m, VLBI { "1" } m, laser { "0.1" } m). Kohaliku sidumise korral väärtusest { "1" } mm kuni { "1" } m püsib laser-miinus-GNSS nihke sigma lähedal väärtusele { "1.04" } m, kuni sidumine jõuab väärtuseni { "1" } m: seda piiravad tehnikate mõõtemüra, mitte kohalik sidumine. Ainult sidumisega seatud põhi on kahe ruutjuur korrutatud selle sigmaga. MODELLED: piiratud kolme keha mudel, millel on sätestatud lihtsustused ja illustratiivsed sisendid, mitte ühegi Kuu suuruse mõõtmine. Nõuandev: uurimis- ja inseneeriatööriista analüüsitulemus; mitte tüübikinnitust omav navigatsiooniseade ega inimelu ohutusega seotud teenus.

# attr:alt
seg-9d507a371319 = Milline vaadeldavate suuruste perekond on tundlik Kuu Love'i arvude h2, k2 ja l2 suhtes, mootori v{ $version } tegelikust käivitusest stsenaariumil scenarios/lunar-infrastructure-geodesy-sensitivity.toml. Iga lahter on perekonna vaatluste RMS-osatuletis parameetri järgi selle perekonna enda ühikutes (seega võrreldakse lahtreid rea ulatuses, mitte veeru ulatuses); kriips tähendab, et perekonnal puudub tundlikkus. laserkaugusmõõtmine: h2 { "7.6" }, k2 puudub, l2 { "9.8" }. orbiidi jälgimine: h2 puudub, k2 { "0.00086" }, l2 puudub. pinnagravimeeter: h2 { "2.9e+03" }, k2 { "4.3e+03" }, l2 puudub. pinnakell: h2 { "2.8e-17" }, k2 { "2.8e-17" }, l2 puudub. Kõigi nelja perekonnaga on Cramér–Rao sigma { "0.36" } % nominaalsest h2-st, { "0.52" } % k2-st ja { "1.16" } % l2-st. Perekonna lisamine ei vähendanud kunagi väikseimat omaväärtust ({ "28" } lisamisest { "28" }-st), kuid pseudoinverteeritava jälg ei olnud suurem vaid { "16" } juhul { "28" }-st: see pool lävest G3 on NOT MET. Orbiidi perekond näeb k2 kiirenduse vaatejoone integraali, mis on ülempiiri tüüpi arv. MODELLED: piiratud kolme keha mudel, millel on sätestatud lihtsustused ja illustratiivsed sisendid, mitte ühegi Kuu suuruse mõõtmine. Nõuandev: uurimis- ja inseneeriatööriista analüüsitulemus; mitte tüübikinnitust omav navigatsiooniseade ega inimelu ohutusega seotud teenus.

# text
seg-570b9276834b = Sätestatud lihtsustused

# text
# c1: geodesy-sensitivity
# c2: frame-coestimation
# c3: geodesy-sensitivity
seg-ab053aadb65d = Maa ja Kuu punktmassidena ringorbiidil, ilma Päikeseta, ilma Kuu gravitatsiooniharmoonilisteta; Maa pöörlemistelg on orbiidi normaal; inertsiaalsüsteem võrdub pöörleva süsteemiga hetkel t = { "0" }; sfääriline Kuu; sünkroonne Kuu süsteem (ilma libratsioonita), välja arvatud failis <c1/>; orbiit loetakse failis <c2/> Kuu telgedes teadaolevaks (selle viga kantakse orbiidil oleva aparaadi kauguse sigma kaudu); failis <c3/> olev orbiidi perekond näeb k2 kiirenduse vaatejoone integraali pärast konstandi ja lineaarse trendi eemaldamist, mis on ülempiiri tüüpi arv.

# text
seg-fd644b1f33ec = Aruande kuju

# text
# c1: kind
# c2: study
# c3: label
# c4: scenario_hash
# c5: units
# c6: units
# c7: docs/field-units-schema.json
seg-03efc65cbb0e = Iga aruanne sisaldab väljasid <c1/>, <c2/>, <c3/>, <c4/>, uuringu välju ja <c5/> plokki (ühik ja päritoluklass iga arvväärtusega välja kohta). Ajaridasid ei väljastata. Väljade loetelud: iga aruande <c6/> plokk ja <c7/>.

# text
# c1: earthstns_fx
seg-bc9bb4f545e2 = k2 = { "0.024116" } +/- { "0.000108" } (Lemoine et al., Geophys. Res. Lett. { "41" }({ "10" }), 3382-3389, { "2014" }, doi 10.1002/2014GL060027), kasutatud nominaalväärtusena. h2 ja l2 on lineariseerimispunktid, mitte kontrollitud väärtused. DSN-i jaamade koordinaadid on NAIF-i <c1/> kerneli kommentaaride ITRF93 väärtused; DSN-i täpsusvahemikke loeti ainult otsingukokkuvõtetest. Kosmoseaparaadi sidumise kontseptsioon järgib avalikke GRASP-i ja ESA Genesise kirjeldusi. Täielik tabel koos sellega, kuidas igaüht loeti, on eelregistreerimises.

# text
seg-6cd670ae6eea = Tulemused ühe pilguga (vt RESULTS.md)

# text
seg-6334f82991d3 = Täitmata ja testidega fikseeritud, mis kinnitavad möödalaskmist: C3 (süstitud vea mõõdik ei rakendu väärtusel { "3e-10" } m/s2), Q3 bootstrap-määra pool väärtusel { "1e-9" } ja G3 CRLB jälje pool. Täisarvulist mitmetähenduslikkuse fikseerimist ei saavutata registreeritud sisendite korral. Midagi ei ole VALIDATED.

# text
seg-1d3bffc2fd02 = <s1>Eelmine</s1>Kosmosekasutaja navigatsioon (gnss-ssv)

# text
seg-90932eed0074 = <s1>Järgmine</s1>LEO positsioneerimine, navigatsioon ja aeg
