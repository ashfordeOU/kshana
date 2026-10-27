# docs--tutorial-clock-holdover: translations (et)

# text
# c1: docs/tutorials/02-clock-holdover.md
seg-b59f529012a6 = Source: <c1/>

# text
seg-e66a5042182e = Õpetus { "2" } — Kella holdover: kui kaua saab veerida

# text
# c1: clock
# c2: scenarios/clock-holdover.toml
# c3: scenarios/clock.toml
seg-889112bc4c09 = <c1/> · <b>Stsenaarium:</b> <c2/> (õppekoopia: <a1><c3/></a1>) · <b>Raskusaste:</b> algaja · <b>~{ "20" } min</b>

# text
seg-a4bdf55d96be = Lõpuks on käivitatud kella holdover GNSS (ülemaailmne satelliitnavigatsioonisüsteem) signaalide keelamise korral, loetud ajastuse kvaliteedinäitajat ja mõistetud √(q_wf·T) triivi seadust, mis seletab, <em>miks</em> optiline kell peab kauem vastu kui kiibimõõtmeline, kusjuures seadus on pärit NIST-ist (USA riiklik standardite ja tehnoloogia instituut), mitte välja mõeldud.

# text
seg-51ae9468b92a = Mis see stsenaarium on

# text
seg-87334505b228 = Kui GNSS signaalid kaovad, hoiab süsteem aega oma pardakella abil. Selle kella faas triivib aeglaselt ja kui triiv ületab töönõutava ajastuse spetsifikatsiooni, on teenus katkenud. <b>Holdover</b> on see, kui kaua püsitakse spetsifikatsiooni piires pärast GNSS-i kaotust — peamine autonoomsuse kvaliteedinäitaja.

# text
seg-798ac031b5c6 = Stsenaarium käivitab { "2" } h ajajoone: { "10" } min GNSS sünkroonimist, seejärel { "6600" } s ({ "1.83" } h) keelatud, { "20" } ns ajastusspetsifikatsiooni vastu, diskreetitud iga { "10" } s järel. See võrdleb kahte kella identse koodiga nende <em>enda</em> avaldatud müraga:

# text
seg-3d53622dbe12 = <b>Kvant</b>: strontsiumi optiline võrekell, kosmoseeesmärk σ_y({ "1" } s) = { "1" }×{ "10" }⁻¹⁵ (arXiv:{ "1503.08457" }), maapealse demonstraatori siht, mitte lennanud. σ_y(τ) on Alani hälve, kella sageduse stabiilsuse standardmõõt keskmistamisajal τ.

# text
seg-e25af6d0752f = <b>Klassikaline</b>: Microchip SA.45s kiibimõõtmeline aatomkell (CSAC), σ_y({ "1" } s) = { "3" }×{ "10" }⁻¹⁰ (andmeleht) — kasutusel olev kaubanduslik osa.

# text
seg-08f3fdc9252a = Üherealise kokkuvõtte lugemine

# text
seg-baa0cc808987 = Algväärtusega (seed) = { "42" }, { "20" } ns spetsifikatsiooniga ja { "6600" } s katkestusega:

# text
# c1: quantum holdover 6600s
seg-76f7739f8b17 = <b><c1/></b> — optiline kell peab vastu kogu { "6600" } s katkestuse, ületamata { "20" } ns. Selle 95. protsentiili faasiviga on { "1.20e-4" } ns, umbes üks kümnetuhandik nanosekundit: see liigub vaevu.

# text
# c1: classical holdover 2610s
seg-0ba48fccffae = <b><c1/></b> — CSAC ületab { "20" } ns spetsifikatsiooni ~{ "2610" } s juures, vähem kui poole katkestusest. Selle p95 faasiviga ({ "19.7" } ns) on täpselt spetsifikatsiooni joonel.

# text
# c1: security n/a (no attack)
# c2: fom.security
# c3: applicable: false
# c4: figure_tiers
seg-b745d05e2bf1 = <b><c1/></b> — see stsenaarium ei seadista rünnakut, seega ei ole midagi tuvastada ja kokkuvõte ei trüki arvu. JSON kannab siiski iga kella analüütilist spuufimise tuvastatavuse piiri väljal <c2/> ({ "0.997" } optilise kella jaoks; { "0.000" } CSAC jaoks, mille enda veerumismüra aknas ületab juba { "20" } ns), märgitud <c3/> plokis <c4/>. Tuvastamise hindamine tegeliku rünnaku vastu on lugu failist <a1>Õpetus { "3" }</a1>.

# text
# c1: integrity 1.000
# c2: docs/INTEGRITY.md
seg-510e1cd8ed40 = <b><c1/></b> — siin on see <em>filtri enda kooskõla</em> (Kalmani filtri enda k-sigma piirides olevate katkestuse näidiste osa), <b>mitte</b> lennunduse horisontaalne ega vertikaalne kaitsetase (HPL/VPL). Vt <a1><c2/></a1>.

# text
seg-7cc0ba5e5d13 = Mitte-ringsõltuv oraakel (sõltumatu etalon): miks { "2610" } s CSAC jaoks?

# text
# c1: q_wf = σ_y(1 s)²
# c2: tests/calibration.rs
seg-2958401e00ca = Valge sagedusmodulatsiooniga (white-FM) kella 1-σ faasiviga kasvab kui <b>σ_x(T) ≈ √(q_wf · T)</b>, kus <c1/> ühik on s². See seos pärineb väljaandest <b>NIST Special Publication { "1065" }</b> (Riley, <em>Handbook of Frequency Stability Analysis</em>) — σ_y(τ)↔faasi seosed — <em>sama</em> SP-1065 seos, mille vastu <c2/> valideerib mootori Alani hälvet umbes { "2" } % täpsusega.

# text
# c1: q_wf = (3×10⁻¹⁰)² = 9×10⁻²⁰ s²
seg-d6c8f68b42b9 = CSAC puhul <c1/>. Lahendada aja jaoks, mil 1-σ faas jõuab { "20" } ns = { "2" }×{ "10" }⁻⁸ s-ni:

# text
# c1: holdover_s
# c2: step_s = 10
# c3: src/fom.rs
seg-0f28d1a1163f = Mootori { "2610" } s ei ole see 1-σ aeg ja ei peagi olema. <c1/> on esimene { "10" } s ruudustiku punkt (<c2/>), kus <em>selle algväärtusega realisatsiooni</em> absoluutne faasiviga ületab { "20" } ns (<c3/>). Juhusliku käidu esimene taseme ületamine tuleb sageli tunduvalt varem kui aeg, mil selle 1-σ ümbris jõuab sellele tasemele, ja realisatsioon kannab ka jääksagedusviga, mis filtrile jääb pärast { "600" } s sünkroonimist. Seega fikseerib seadus mõõtkava, paar tuhat sekundit { "3" }×{ "10" }⁻¹⁰ kella jaoks { "20" } ns vastu, mitte täpset väärtust. Test kinnitab selle ümber <b>{ "2000" }–{ "3200" } s vahemiku</b>, mitte arvu.

# text
# c1: provenance
# c2: adev_curve
# c3: tests/calibration.rs
seg-2e7cbdefa9b7 = Andmelehe ankrud ise on välised, viidatud stsenaariumi <c1/> sõnedes: optilise Sr võrekella siht { "1" }×{ "10" }⁻¹⁵ (arXiv:{ "1503.08457" }); Microchip SA.45s CSAC { "3" }×{ "10" }⁻¹⁰ (andmeleht). Ja eksporditud <c2/> ühtib andmelehe σ_y(τ)-ga umbes { "2" } % täpsusega (<c3/>, NIST SP { "1065" }). Joonistada see mänguväljakul log-log diagrammina „Clock stability (ADEV, Allan deviation)“.

# text
seg-def5271a207d = Mida test fikseerib

# text
# c1: quantum holdover >= classical holdover
seg-ebddc1f5ffe2 = <c1/> (optiline kell peab vastu pidama vähemalt sama kaua),

# text
# c1: quantum holdover ≈ 6600 s
seg-8e570268f107 = <c1/> (peab vastu kogu katkestuse),

# text
# c1: classical holdover ∈ [2000, 3200] s
seg-d60483c1af2e = <c1/> — taluvusvahemik SP-1065 valge-FM mõõtkava ümber, <em>mitte</em> maagiline arv. Sõltumatu etalon (oraakel) on seadus, mitte väärtus.

# text
seg-e5f926d1055b = Lõksud ja ühikud

# text
seg-0f57e35ed833 = <b>Ajastuse arvud on nanosekundites</b>, mitte kunagi meetrites. (Asukoha holdover on <em>teine</em> pakett — vt õpetuse { "3" } inertsiaaljaotist.)

# text
# c1: q_wf
seg-2e476b213141 = <b><c1/> ühik on s² ja see on võrdne σ_y({ "1" } s)².</b> See on sild andmelehe Alani arvust mudelini.

# text
# c1: step_s
seg-75951a150b44 = <b>Holdover on ruudustikule kvantiseeritud alampiir</b> (<c1/>). Täpset väärtust mitte üle lugeda; lugeda <em>vahemikku</em>.

# text
# c1: integrity
seg-959eb86066f1 = <c1/> on siin filtri enda kooskõla, mitte lennunduse terviklikkus.

# text
seg-cb457294fc53 = Mis edasi

# text
# c1: threshold_ns
# c2: exercises/tier2_sweep.py
# c3: kind = "sweep"
# c4: classical_q_wf
# c5: scenarios/sweep-clock-stability.toml
seg-aa3e50f2c699 = <b>Aste { "2" }:</b> pingutada <c1/> väärtusest { "20" } väärtuseni { "10" } ja jälgida CSAC holdover-i <em>langust</em> ({ "2610" } s → { "1300" } s, mõõdetud käsuga <c2/>) või kasutada käsku <c3/>, et tabelisse panna holdover CSAC mürataseme <c4/> vastu (<c5/>: { "25" } punkti vahemikus { "10" }⁻²⁴ kuni { "10" }⁻¹⁸ s², klassikaline holdover { "2610" } s → { "250" } s).

# text
# c1: runs = 200
# c2: scenarios/clock-ensemble.toml
# c3: classical holdover 844s [220-2130]
seg-cb31f104d104 = <b>Aste { "3" }:</b> lisada <c1/>, et muuta see Monte Carlo ansambliks ja lugeda holdover-i vahemikku [p05–p95] (<c2/> trükib <c3/>).

# text
seg-9cb56e10f0fd = Seejärel kokkuvõttev õpetus: <a1>Õpetus { "3" } — kvant- ja klassikaline vastupidavus</a1>.

# text
seg-7dc19a98c7ee = <s1>Eelmine</s1>{ "1" } · Esimene orbiit

# text
seg-c274e92fdcb5 = <s1>Järgmine</s1>{ "3" } · Kvant klassikalise vastu
