# docs--tutorial-quantum-vs-classical: translations (et)

# text
seg-501d3a72ea43 = Terviklikkus

# text
seg-8980b5ae869b = Arv

# text
seg-e5f926d1055b = Lõksud ja ühikud

# text
seg-cb457294fc53 = Mis edasi

# text
# c1: docs/tutorials/03-quantum-vs-classical.md
seg-a3686dd6817d = Source: <c1/>

# text
seg-0c2365600795 = Õpetus { "3" } — Kvant- ja klassikaline GNSS vastupidavus (kokkuvõttev)

# text
# c1: spoof
# c2: hybrid
# c3: scenarios/spoof-attack.toml
# c4: scenarios/hybrid-pnt.toml
# c5: scenarios/security.toml
# c6: scenarios/hybrid.toml
seg-cc4017642043 = <c1/> + <c2/> · <b>Stsenaariumid:</b> <c3/>, <c4/> (õppekoopiad: <a1><c5/></a1>, <a2><c6/></a2>) · <b>Raskusaste:</b> kesktase · <b>~{ "35" } min</b>

# text
seg-5de2e6656527 = Kokkuvõttev õpetus. Käivitatakse spuufimisdetektori stsenaarium ja täielik liidetud positsioneerimise, navigatsiooni ja aja (PNT) komplekt ning õpitakse lugema koos <b>turvalisust</b>, <b>terviklikkust</b> ja <b>dead-reckoning-it</b> — kogu väide: kvantinertsiaal ja optiline ajastus ostavad vastupidavuse, mille GNSS (ülemaailmne satelliitnavigatsioonisüsteem) keelamine muidu ära võtaks.

# text
seg-ffa5242638c2 = A osa — Turvalisus: aja spuufimise tabamine

# text
# c1: 1 − P_md
seg-23c18da1415f = Ründaja süstib aeglaselt kasvava vale GNSS aja ({ "0.1" } ns/s, algusega t = { "60" } s). Vastuvõtja võrdleb väidetud aega oma kella veeretatud prognoosiga ja märgib spuufimise, kui lahknevus ületab tuvastuspiiri. Detektor on kahepoolne <b>χ²₁ / Neyman–Pearsoni energiatest</b> valehäire tõenäosusel P_fa = { "0.01" }; turvalisuse kvaliteedinäitaja on <b><c1/></b> (üks miinus tuvastamata jäämise tõenäosus) spetsifikatsiooni suuruse ({ "20" } ns) spuufimise ulatuse juures.

# text
# c1: security 1.000
seg-46aa0e01b330 = <b>Kvant: <c1/>, tuvastatud { "70" } s juures.</b> Optilise kella tuvastuspõhi on murdosa nanosekundist, nii et see märgib spuufimise peaaegu kohe — kaugelt alla { "20" } ns spetsifikatsiooni.

# text
# c1: security 0.558
seg-022573b3dcc4 = <b>Klassikaline: <c1/>, tuvastatud { "430" } s juures.</b> Kiibimõõtmelise aatomkella (CSAC) enda veerumismüra aknas on { "20" } ns-ga võrreldav, nii et see ei suuda sageli spuufimist oma triivist eristada — see jätab märkamata { "44" } % ajast.

# text
seg-27b2b715efcb = Mitte-ringsõltuv oraakel (sõltumatu etalon): analüütiline ja Monte Carlo P_md

# text
# c1: 0.442
# c2: 0.444
# c3: ~few × 1/√N
# c4: tests/tutorials.rs::tutorial3_spoof_analytic_matches_montecarlo
# c5: |analytic_pmd − mc_pmd| < 0.05
# c6: quantum security_fom > 0.9
seg-c85651eebd32 = Detektori tuvastamata jäämise tõenäosus arvutatakse <b>kahel sõltumatul viisil</b>, mis peavad ühtima: <b>suletud kujul χ²₁ saba</b> (Neyman–Pearsoni tulemus) ja <b>Monte Carlo</b> (MC) hinnang. CSAC puhul on analüütiline P_md <c1/> ja MC P_md <c2/> — need ühtivad { "0.002" } täpsusega, selgelt valimivea <c3/> piires. Optilise kella puhul on mõlemad { "0.000" }. Kaks eraldi arvutust <em>sama</em> tõenäosuse kohta, mis ühtivad, on mitte-ringsõltuv ristkontroll (Kay, <em>Fundamentals of Statistical Signal Processing: Detection Theory</em>; standardne NP / χ² tuvastamine). <c4/> kinnitab <c5/> mõlema kella puhul ja <c6/>.

# text
seg-5cf0d909bac7 = B osa — Hübriid-PNT: täielik liidetud komplekt

# text
# c1: [resync]
# c2: src/hybrid.rs
# c3: optical-isl
seg-498a57aae11d = Nüüd liidab kokkuvõttev stsenaarium optilise kella + külmatoomse inertsmõõteseadme (IMU) (kvantkomplekt) CSAC + navigatsiooniklassi IMU vastu (klassikaline komplekt), läbi sama { "6600" } s ({ "1.83" } h) GNSS katkestuse, { "20" } ns ajastusspetsifikatsiooni ja { "100" } m asukohaspetsifikatsiooni vastu. Mõlemad komplektid ankurdavad oma kellad uuesti iga { "60" } s järel sama optilise satelliitidevahelise aja edastamise lingi kaudu, mida modelleeritakse { "1" } ps uuestisünkroniseerimise värinaga (<c1/> stsenaariumis; <c2/> ehitab kummagi komplekti jaoks ühe <c3/> lingi).

# text
# c1: (t …/p …)
seg-61934559c7a0 = Lugeda <c1/> jaotust — ajastuse holdover ja asukoha holdover:

# text
seg-dee5b1a35bdd = <b>Kvant: PNT-holdover { "6600" } s</b> — peab vastu nii ajastuse (t { "6600" } s) kui ka asukoha (p { "6600" } s) osas kogu katkestuse.

# text
seg-6441dfa026dc = <b>Klassikaline: PNT-holdover { "350" } s</b> — <em>ajastus</em> peab vastu täis { "6600" } s (t { "6600" } s), sest optilise aja edastamise uuestisünkroniseerimine hoiab lukus isegi <em>klassikalise kella</em>. Komplekt on <b>asukohast piiratud väärtusel p { "350" } s</b>: navigatsiooniklassi IMU on nõrk lüli. See on liitmise väide — klassikalise komplekti rike eristatakse tema inertsiaalandurini.

# text
# c1: integrity 0.998
# c2: docs/INTEGRITY.md
seg-12e9b7192733 = <b><c1/> kvantkomplekti puhul on tegelik ja ei ole viga.</b> See on filtri enda kooskõla mürarikka uuestisünkroniseerimise korral — <b>mitte</b> lennunduse terviklikkuse arv (horisontaalne või vertikaalne kaitsetase, HPL/VPL). Sõna „terviklikkus“ siin mitte üle lugeda; vt <a1><c2/></a1>.

# text
seg-587efcdcbc13 = Mitte-ringsõltuv oraakel (sõltumatu etalon): { "350" } s asukoha holdover

# text
# c1: b
seg-a70ad8fc122f = { "350" } s arv on dead-reckoning-i füüsika, mitte sobitatud arv. Konstantne kiirendusmõõturi nihe <c1/> ajab asukohavea kujul <b>½·b·T²</b>. { "100" } m spetsifikatsiooni ületamine:

# text
# c1: q_va
seg-778e817e3e9b = Mootor annab { "350" } s, viimane { "10" } s ruudustiku punkt enne ületamist ja { "2" } % lühem kui ainult nihkest tulenev { "357" } s: stsenaariumi kiirendusmõõturid kannavad ka kiiruse juhuskäidu müra (<c1/>), mis lisandub nihketriivile, nii et modelleeritud viga jõuab { "100" } m-ni veidi varem.

# text
seg-e105a8ab605b = Autoriteetne seadus: Groves, <em>Principles of GNSS, Inertial, and Multisensor Integrated Navigation</em> (2. trükk), dead-reckoning-i veakasv. Need kaks ½bT² väärtust seletavad mootori { "350" } s / { "6600" } s jaotust: suletud kujul füüsikakontroll, filtrist väline.

# text
# c1: scenarios/inertial.toml
# c2: inertial
# c3: quantum holdover 6600s p95 41.39m | classical holdover 350s p95 30629.9m
seg-c2515e55dffa = Inertsiaalset nõrka lüli saab otse näha dead-reckoning-i stsenaariumis (<a1><c1/></a1>, liik <c2/>): <c3/>: navigatsiooniklassi andur hälbib kümnete kilomeetriteni.

# text
seg-6c688f2e7136 = Kuidas kolme arvu koos lugeda

# text
seg-4f1a49d61cee = Mida see siin tähendab

# text
seg-2e91989b1a89 = Mida see <b>ei</b> tähenda

# text
# c1: 1 − P_md
# c2: hybrid
# c3: n/a (no attack)
seg-b403ce86b14d = analüütiline spuufimise <em>tuvastatavuse</em> piir (<c1/>) seadistatud rünnaku jaoks; kokkuvõte <c2/> trükib <c3/>, sest see stsenaarium ei seadista ühtegi

# text
seg-e04c25dd278d = ei ole mitme satelliidiga RAIM (vastuvõtja autonoomne terviklikkuse seire) detektor

# text
seg-7e678dd4409e = filtri enda kooskõla (näidised k-σ piirides)

# text
seg-1643e7e71209 = ei ole lennunduse HPL/VPL/RAIM terviklikkus

# text
seg-4095f7ab4b14 = aeg spetsifikatsiooni piires pärast GNSS-i kaotust, jaotatud ajastuseks ja asukohaks

# text
seg-5b90536cdfd5 = ei ole 2-D CEP (ringvea tõenäoline) ega 2DRMS (kahekordne ruutkeskmine kaugus) täpsus

# text
# c1: integrity
# c2: scenarios/integrity.toml
seg-4b11ef3b6dba = Tõeline vastuvõtja autonoomne terviklikkus — tegelik HPL/VPL koos häirepiiride ja Stanfordi diagrammiga — asub paketis <c1/> (<a1><c2/></a1>); see on 3. astme lugemisharjutus.

# text
seg-28cddec341ed = Mida testid fikseerivad

# text
# c1: tutorial3_spoof_analytic_matches_montecarlo
# c2: quantum security_fom > 0.9
seg-a27c3195acf3 = <c1/> — analüütiline ja MC P_md ühtivad täpsusega < { "0.05" } mõlema kella puhul; <c2/>.

# text
# c1: scenarios/hybrid.toml
# c2: scenarios/inertial.toml
# c3: teaching_scenarios_match_their_recorded_expected_summary
# c4: # expected:
seg-78a5a0066e09 = Hübriidkokkuvõte ({ "6600" } s / { "350" } s) ja inertsiaaljaotus fikseeritakse nende õppestsenaariumide kaudu (<a1><c1/></a1>, <a2><c2/></a2>) testiga <c3/>, mis võrdleb iga mootori kokkuvõtet failis salvestatud real <c4/>. Ülaltoodud ½bT² sõltumatu etalon on nende arvude füüsikakontroll.

# text
seg-a4371822e379 = <b>Ajastuse kvaliteedinäitaja (FoM) on nanosekundites; asukoha FoM on meetrites ja 1-DOF</b> (üks vabadusaste: üks telg, mitte CEP/2DRMS).

# text
# c1: integrity 0.998
seg-1331ea80a427 = <c1/> on kooskõla, mitte lennunduse terviklikkus.

# text
# c1: (t …/p …)
seg-87c49084032c = Klassikalise komplekti <em>ajastus</em> jääb ellu ainult tänu optilise aja edastamise uuestisünkroniseerimisele; lugeda jaotust <c1/>, mitte ainult peamist PNT-holdover-it.

# text
# c1: scenarios/lunanet-araim.toml
# c2: lunar-integrity
seg-1c93115bf118 = Käivitada aus ebaõnnestumise juhtum: <c1/> (liik <c2/>) teatab lõunapooluse ARAIM (täiustatud RAIM) läbimisest, kus kaitsetasemed <em>ületavad</em> häirepiiri (HPL { "263" }–{ "452" } m > { "50" } m, { "0" } { "24" } epohhist saadaval), seega teatatakse süsteemi <b>kättesaamatuks</b>: omadus, mitte viga.

# text
# c1: scenarios/leo-resilience-gnss-jammed-leo-carries.toml
# c2: campaign
seg-ac70d3131064 = Viia lugu madalale Maa orbiidile (LEO): <c1/> (liik <c2/>) seob ühel ajajoonel GNSS segamise faasi, LEO positsioneerimiskihi, mis kannab kasutaja sellest läbi, ja terviklikkuse kontrolli. Teiste vastupidavuse ja vertikaalsete stsenaariumide jaoks vt <a1>uuemaid võimekusi</a1>.

# text
seg-063422d3c70b = Tulemust kaitsta: teha <a1>3. astme harjutus</a1> — Monte Carlo vahemikud, reprodutseeritavus ja kaitsetaseme lugemine.

# text
seg-4f7275a21f44 = <s1>Eelmine</s1>{ "2" } · Kella holdover

# text
seg-8b0c90f82aab = <s1>Järgmine</s1>Läbitöötatud näide: mitme tööriistaga torujuhe
