# docs--jammertest: translations (et)

# text
seg-f8cf777c0caa = Pinnad

# text
seg-45425f378b61 = tähendus

# text
# c1: docs/JAMMERTEST.md
seg-9367b8736d36 = Allikas: <c1/>

# text
seg-c2a40cd73d0e = Jammertesti hindamine: avaldatud plaan kui ajastatud tõde

# text
# c1: kshana jammertest import
# c2: [[events]]
# c3: kshana jammertest score
seg-a560942cbd27 = <c1/> loeb Jammertesti katsekataloogi ja edastusplaani ning muudab ühe katsepiirkonna ajapesad vastuvõtja usalduse väljadeks <c2/>. <c3/> käivitab vastuvõtja logi usaldusmonitoridega ja hindab seda selle ajakava vastu, katse kaupa. Iga tulemus on <b>MODELLED</b>: ajakava ütleb, millal katse oli <em>planeeritud</em>, mitte millal saatja oli sees.

# text
seg-bc4e7285c38a = Nõuandev tarkvara, mitte tüübikinnitust omav navigatsiooniseade (IEC { "61108" }, IEC { "61162" }): laeva navigeerimise eest vastutab jätkuvalt operaator. Midagi siin ei ole heaks kiitnud Norra teedeamet (Norwegian Public Roads Administration), Nkom ega ürituse korraldajad; nendega kokkulepet ei väideta.

# attr:alt
seg-af0edceb1503 = Ühe sünteetilise vastuvõtja logi hindamine kolmetestilise ajakava vastu, mootori v{ $version } tegelikust käivitusest (`kshana jammertest score`). Logi on väljamõeldud: { "1800" } s NMEA-d, kus C/N0 langeb { "20" } dB kahe intervalli jooksul. Ajakava loetleb kolm ajapesa; keskmisel ajapesal ei ole segajat logis. Hinnang märgib { "2" } testi { "3" }-st tuvastatuks (mediaanviivitus { "0" } s) ja { "1" } tuvastamata, valehäire käivitusi { "0" } üle { "0.25" } h puhta aja. Siin ei öelda midagi päris vastuvõtja kohta. Nõuandev tarkvara, mitte tüübikinnitust omav navigatsiooniseade (IEC { "61108" }, IEC { "61162" }): laeva navigeerimise eest vastutab jätkuvalt operaator.

# text
seg-ceaa46bdcb7e = Plaan ja kataloog

# text
# c1: NPRA/jammertest-plan
# c2: xval/jammertest-plan/MANIFEST.tsv
seg-73a5899de383 = Allikas: Norra teedeameti (Norwegian Public Roads Administration) hoidla <c1/> (<a1>https://github.com/NPRA/jammertest-plan</a1>), <b>MIT litsents</b> (autoriõigus { "2024" } Norwegian Public Roads Administration; litsentsi tekst on kontrollitud failis <c2/>). Failid tuuakse alla, mitte ei hoita hoidlas (vendored):

# text
# c1: 75c0b2ceea10e470c3799d14a8ef18842d8375a7
# c2: xval/jammertest-plan/MANIFEST.tsv
seg-2a4967d30c3a = See laeb alla kataloogid ja { "2025" } plaanifailid kinnitatud kommitil <c1/> ning keeldub igast failist, mille SHA-256 erineb väärtusest <c2/>.

# text
# c1: type.group.test
# c2: 1.2.5
# c3: --local-offset-h
seg-7826929c89f6 = Kataloogi testil on punktidega id <c1/> (näiteks <c2/>: tüüp { "1" } segamine, rühm { "2" }, test { "5" }). Plaan loetleb katsepiirkonna ja ajapesa kohta, milline id on ajastatud. Tüübid { "1" } (segamine), { "2" } (spuufimine) ja { "3" } (meaconing) edastavad; tüüp { "0" } (briifingud, ajapuhver, broneeringud ja ad hoc ajapesad) ei edasta ja jäetakse vahele. Plaani ajad on kohalik seinakell; <c3/> (vaikimisi { "2" }, CEST) ütleb, kui kaugel need UTC-st on. Plaanifailid kannavad testikontakti välja isiku nimega: seda ei loeta kunagi ning sellest tuletatud midagi ei kirjutata.

# text
seg-3eab33a0c38f = Import

# text
# c1: --log-start <UTC time>
# c2: --log
# c3: --format
# c4: [[events]]
# c5: scheduled truth:
# c6: --attack-log <scenario.json>
# c7: attack_log
# c8: --time-shift-h
# c9: Z
seg-91fddde78691 = <c1/> asendab <c2/>/<c3/>, kui logi ei ütle oma algust. Väljund on TOML <c4/>, mis lisatakse vastuvõtja usalduse stsenaariumile; iga silt algab <c5/> ja kannab väljaande aastat, kataloogi id-d ja piirkonda ning päis salvestab iga lähtefaili SHA-256. <c6/> loeb selle asemel JammerTest { "2024" } andmekogumi ühe kausta sündmuse tõe (selle <c7/>, ajatemplid nihutatud <c8/>, vaikimisi -2: need ütlevad <c9/>, kuid on kohalik aeg).

# text
seg-6ed6415a6f52 = Hinnang

# text
# c1: session.toml
# c2: [log] format/path
# c3: [monitors]
# c4: [compare]
# c5: [[events]]
seg-1e72a977f7ad = <c1/> on vastuvõtja usalduse stsenaarium (<c2/>, valikuline <c3/>, <c4/>). Selle enda <c5/> asendatakse imporditud ajakavaga. Ajastatud testi kohta:

# text
seg-99427ab75a03 = väli

# text
# c1: detected
# c2: compare.detect_tol_s
# c3: late
# c4: missed
# c5: not-evaluable
seg-d2681be37798 = <c1/> (häire <c2/> piires, vaikimisi { "10" } s, planeeritud algusest), <c3/> (hiljem, ajapesa sees), <c4/> (puudub), <c5/>

# text
seg-01a977f18700 = esimene häire miinus planeeritud algus

# text
# c1: --recover-hold-s
seg-b83d1f0a1fb7 = ajapesa lõpust esimese vähemalt <c1/> ({ "10" } s) pikkuse häireta lõigu alguseni, enne järgmist testi

# text
# c1: calibration_s + guard_s
# c2: baseline_contaminated
# c3: --guard-s
# c4: --key
# c5: --out
# c6: docs/EVIDENCE-PACKS.md
# c7: config.json
seg-84a34f13e93b = Test on hinnatav ainult siis, kui see algab vähemalt <c1/> pärast logi algust; logi, mille test on varasem, märgitakse <c2/> (lähtetase võis tekkida häire all). <b>Valehäired</b> on häirivad kalibreerimisjärgsed epohhid väljaspool iga ajapesa, mida on pikendatud väärtusega <c3/> ({ "60" } s) enne ja pärast (või pärast taastumispunkti), loetud epohhidena ja käivitustena, koos käivitustega puhta aja tunni kohta. Võtmetega <c4/> ja <c5/> kirjutatakse käivitus allkirjastatud tõendipaketina (<c6/>): tulemuskaart ja imporditud ajakava asuvad failis <c7/>, seega räsiahela ja allkirja sees. Pakett on tehniline kirje, mitte õiguslik arvamus.

# text
seg-382613112d5d = Mida tulemus ei ütle

# text
seg-f1cb12a89001 = Planeeritud ajapesa ei ole eetrikirje. Saatja võis alata hilja, lõppeda vara või mitte kunagi töötada; „tuvastamata“ test võib olla test, mis ei edastanud, ja viivitus on planeeritud algusest.

# text
seg-32baa4a4b9f0 = „Puhas“ epohh on „väljaspool planeeritud ajapesi“, mitte „tõestatult häirevaba“.

# text
seg-95cc22bbacc5 = Mõõtmisvaldkonna monitoride tuvastamine ei ütle midagi väikese võimsusega koherentse spuufija tuvastamise kohta.

# text
seg-2e91813cf9d7 = Ükski väline sõltumatu etalon ei esita tegelikke eetriaegu, seega ei ole siin miski VALIDATED.

# text
seg-cfdf09e38e6e = { "2024" } andmekogumi käivitus (eelregistreeritud)

# text
# c1: xval/jammertest-score/PREREGISTRATION.md
# c2: xval/jammertest-score/RESULTS.md
# c3: .ubx
# c4: PREREGISTRATION-v2.md
# c5: RESULTS-v2.md
# c6: 7
# c7: xval/oracles/setup.sh
# c8: tests/jammertest_score_2024.rs
# c9: KSHANA_JAMMERTEST_DIR
seg-473ed6ca71e5 = <c1/> fikseeris populatsiooni, määratlused ja lävendid enne esimest hinnatud käivitust; <c2/> kirjeldab seda käivitust. Tulemus: <b>registreeritud minimaalse andmehulga reegel ebaõnnestus</b> ({ "4" } hinnatavat segamisakent { "4" }-st { "12" } <c3/> kaustast: { "5" } kausta jäeti lähtetaseme reegli tõttu välja ja { "3" } UBX-logi ütlevad oma alguse ainult GPS-i nädala ajana), seega <b>ühtegi läve ei saa hinnata</b>. Midagi ei lõdvendatud ega käivitatud uuesti. <b>v2</b> (<c4/>, kommitud eraldi enne oma käivitust; ainult andmetöötlus, samad lävendid ja minimaalse andmehulga reegel) paigutas ainult GPS-aega kandvad logid kausta kuupäeva järgi, hindas { "12" } ainult CSV-kausta ja kasutas liikuvate rooverite jaoks liikuva platvormi seanssi. Tulemus (<c5/>): { "24" } kaustast säilitati { "14" }, kuid hinnatavaid segamisaknaid oli ainult <c6/>, seega minimaalse andmehulga reegel ebaõnnestus uuesti ja <b>ühtegi läve ei saa hinnata</b>. v1 tulemus on muutumatu. Ainult kirjeldav: { "7" } segamisaknast { "3" } andis häire { "10" } s jooksul, { "4" } hiljem, ükski ei jäänud tuvastamata; mediaanviivitus { "18" } s; puhta aja häiremäär { "0.089" }. Siduv piirang on nüüd lähtetaseme reegel, mis eemaldab { "10" } kausta; edasine registreerimine vajaks varajaste akende jaoks teistsugust reeglit. Andmekogum (JammerTest { "2024" }, Zenodo { "15911589" }, GPL-3.0-or-later) tuuakse alla skriptiga <c7/> ja seda ei hoita hoidlas (vendored); test <c8/> fikseerib salvestatud käivituse, kui <c9/> osutab lahtipakitud andmekogumile.

# text
seg-cd75b60bd0db = { "2025" } SimulaMeti NMEA andmekogum

# text
seg-87bc2544154b = SimulaMeti Jammertest { "2025" } NMEA-põhist andmekogumit (IEEE DataPort, DOI 10.21227/a7v4-xw11) <b>ei</b> adapteerita versioonis { "0.38" }. Selle leht ei nimeta litsentsi ja ütleb „This dataset requires an IEEE DataPort Subscription to access“: tingimused ei luba selgelt levitamist ega automaatset allalaadimist, mistõttu adapterit ega allalaadimisskripti ei kirjutatud. Selle kasutamine vajab omaniku otsust ja ideaalis autorite kirjalikku nõusolekut.

# text
# c1: kshana::jammertest
# c2: jammertest_import
# c3: jammertest_score
# c4: /kshana-jammertest
# c5: jammertest
# c6: docs/SURFACES.md
seg-aa8d3fe2adf3 = CLI, Rust (<c1/>), Python (<c2/>, <c3/>), WebAssembly (samad nimed), MCP tööriistad samade nimedega ning käsk <c4/> ja oskus <c5/>. Allkirjastatud pakett on ainult käsureal (see vajab allkirjastamisvõtit). Vt <c6/>.

# text
seg-82aab597103a = <s1>Eelmine</s1>LunaNeti täiendatud edastatav signaal

# text
seg-fb9e48a04566 = <s1>Järgmine</s1>Masina- ja sensorisisendid
