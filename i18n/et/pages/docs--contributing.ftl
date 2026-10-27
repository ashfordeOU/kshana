# docs--contributing: translations (et)

# text
seg-c3c260b7063e = Testid

# text
# c1: CONTRIBUTING.md
seg-5dce5694e6ec = Allikas: <c1/>

# text
seg-3fa173b79e8f = Kshana arendusse panustamine

# text
seg-c3a47c614836 = Täname huvi eest. Kshana eesmärk on olla <b>neutraalne, reprodutseeritav, ausalt valideeritud</b> etalon hübriidse kvant/klassikalise PNT jaoks. Panuste suhtes kehtib see lävi: korrektsus, viited ja reprodutseeritavus on olulisemad kui laius.

# text
# c1: GOVERNANCE.md
seg-5a82a55f7fb2 = Kuidas projekti juhitakse — kes otsustab, tehniline lävi ning avatud/suletud piir — on dokumenteeritud failis <a1><c1/></a1>.

# text
seg-cc8491af7a6f = Arendus

# text
seg-0163ccdfaa2b = Valikulised keelesidestused on funktsiooniga blokeeritud ja vaikimisi väljas (nii et ülaltoodud ehitus ja sõltuvusauditi lüüs neid kunagi ei puuduta). Nendega töötamiseks:

# text
seg-edc8bbab6e92 = Enne iga commit’i — kiire tsükkel

# text
# c1: ci.yml
# c2: check
seg-6a7eda7d82b7 = Need võtavad sekundeid. Need on faili <c1/> töö <c2/> alamhulk samas järjekorras, nii et siinne tõrge on seal tõrge:

# text
# c1: (scenario, seed, version)
seg-d62c1fe22fc4 = <b>Reprodutseeritavus on range invariant.</b> Muudatus, mis muudab <c1/> mittedeterministlikuks, on viga. Juhuslikkus peab voolama algväärtustatud RNG kaudu; kvant- ja klassikalised käitused kasutavad sõltumatuid, deterministlikult tuletatud algväärtusi.

# text
seg-66ea0748c10f = <b>Hoidla hügieen.</b> Commit’id ja sisu ei tohi kanda automaatse tööriista omistamise lõppe ega jalusi ning ei tohi nimetada tehisintellekti assistenti autorina kusagil sisus, failinimedes ega ajaloos. Kaitse jõustab seda.

# text
seg-fbf423f6fb31 = Enne push’i — täielik lüüs

# text
# c1: scripts/gate.sh
# c2: cargo test --all
# c3: scripts/check-repeatability.sh
# c4: .gate-receipt.json
seg-a9176352d3b4 = <c1/> on kanooniline lüüs: see käitab <c2/> lühendamata, seejärel <c3/>, et käitada teegi komplekt veel mõned korrad, sest lõimede läbipõimumise võidujooks on ühe käituse puhul nähtamatu. Ainult õnnestumise korral kirjutab see <c4/> (jälgimata — masina olek ühe käituse kohta, mitte sisu).

# text
# c1: scripts/gate.sh
seg-29815bd89ce2 = See on tahtlikult aeglane — 62-79 minutit tervel püsiseisundil, faili <c1/> päise järgi, mis kannab praegust väärtust — ja ajalõppu ei ole, sest piisavalt lühike ajalõpp, et olla kasulik, tapaks tervisliku käituse. Alamhulga käitus, mis tuli roheline, ei ole lüüs: mõlemad defektid, mille jaoks see mehhanism on olemas, jõudsid selle kaudu läbi.

# text
# c1: gate.sh
seg-408da9a8b8bb = Panustajad, kes töötavad hargist, ei vaja kviitungi konksu — see on kohalik hooldaja lüüs ja <b>CI on see, mis tegelikult tõmbepäringut lüüsib</b>. <c1/> käitamine enne selle avamist tähendab lihtsalt, et CI ei ütle midagi, mida juba ei teataks.

# text
seg-9394727b21c3 = Sensorimudeli lisamine või muutmine

# text
# c1: provenance
seg-d9c891ca6827 = <b>Iga arvparameeter vajab päritolu.</b> Viide tuleb panna mudeli stringi <c1/> ja stsenaariumifaili. Anonüümseid konstante pole.

# text
seg-d30cb836d4c4 = <b>Valideeri standardse seose vastu,</b> mitte ainult sisemise kooskõla vastu — nt Alani hälve kellade jaoks, Grovesi dead-reckoning’u vea kasv inertsiaalse jaoks, ajastuse→kaugusmõõtmise teisendus aja edastamiseks. Lisa test, mis kinnitab, et simuleeritud väljund taastoodab avaldatud/seose väärtuse määratud tolerantsi piires.

# text
# c1: src/verification.rs::verification_matrix()
# c2: Modelled
# c3: cargo run --bin gen_validation_artifacts
# c4: docs/VERIFICATION-MATRIX.md
# c5: docs/MODELLED-RATIONALE.md
# c6: web/data/verification-matrix.json
# c7: docs/VALIDATION.md
seg-b52dd0dd550e = <b>Ole küpsuse osas aus.</b> Olekuregister on <c1/> — lisa või muuda seal rida, nimeta selle väline oraakel (sõltumatu etalon) (või ütle selgelt, et seda pole, mis teeb selle tasemeks <c2/>), seejärel genereeri avaldatud artefaktid uuesti käsuga <c3/>. <c4/>, <c5/> ja <c6/> on kõik genereeritud sellest funktsioonist ja ütlevad põhjusega „ära redigeeri käsitsi“. Uuenda ka narratiivi <c7/>, kui proosa seda vajab, ning märgi sihtmärgid või maapealsete demonstraatorite tulemused sellisena.

# text
seg-34b9c8b6f70c = Testipõhine: kirjuta kõigepealt ebaõnnestuv test, oodatava väärtusega, mis on füüsikast/seosest <b>käsitsi tuletatud</b> enne realiseerimist.

# text
seg-5322d5b2188c = Deterministlikud testid kinnitavad täpseid (käsitsi tuletatud) väärtusi; statistilised testid kinnitavad määratud tolerantsi ja ideaalis keskmistavad algväärtuste üle hajuvuse kontrollimiseks.

# text
seg-7f76a26c4d5f = Commit’id ja versioonimine

# text
# c1: feat:
# c2: fix:
# c3: docs:
# c4: test:
# c5: chore:
seg-a1cfb9064694 = <b>Conventional Commits</b> (<c1/>, <c2/>, <c3/>, <c4/>, <c5/> …).

# text
seg-1a13616ca0ac = <b>Semantic Versioning.</b> Enne 1.0 võib stsenaariumi/tulemuse skeem muutuda; too lagunevad muudatused selgelt esile.

# text
# c1: vX.Y.Z
# c2: main
# c3: cargo publish
# c4: docs/RELEASING.md
seg-0e3036c27aa8 = <b>Väljalasked lõigatakse sildiga <c1/> ja avaldamine on automaatne, kuid järjestatud.</b> Auto-tag töövoog lükkab sildi, kui CI on rohelise versioonitõusu korral harus <c2/>. Release töövoog käitab sildistatud commit’il täieliku kontrolli ja ainult siis, kui see läbib, avaldab see crates.io-sse, Python Package Index’isse (PyPI), npm-i, ghcr.io-sse, Model Context Protocol (MCP) registrisse ja JetBrains Marketplace’i; seejärel kontrollib see, et iga kanal serveerib versiooni, ja ehitab sildist uuesti kshana.dev. Keegi ei käivita <c3/> käsitsi. Sammud ja ebaõnnestunud avaldamise uuesti proovimine on failis <a1><c4/></a1>.

# text
seg-18ca89a2c573 = Muudatuste logi hooldus (nõutav)

# text
# c1: CHANGELOG.md
seg-1f7e1d73c2ef = Iga kasutajale nähtav muudatus uuendab faili <a1><c1/></a1>:

# text
# c1: [Unreleased]
# c2: Added
# c3: Changed
# c4: Fixed
# c5: Removed
# c6: Documented
# c7: Planned
seg-1448e96afbbc = Lisa kirje jaotise <b><c1/></b> alla õigesse gruppi (<c2/> / <c3/> / <c4/> / <c5/> / <c6/> / <c7/>).

# text
# c1: [Unreleased]
# c2: [x.y.z] - YYYY-MM-DD
# c3: [Unreleased]
# c4: version
# c5: Cargo.toml
# c6: engine_version
# c7: vx.y.z
seg-76ddc53c752e = Väljalaskel nimeta <c1/> ümber uueks <c2/>, alusta värsket <c3/>, tõsta <c4/> failis <c5/> (et <c6/> tulemuse JSON-is ühtiks), uuenda alumisi võrdluslinke ja sildista <c7/>.

# text
seg-ed680e59377c = Hoia kirjed lühikesed ja kasutajale suunatud; lingi probleeme/PR-e, kus see on kasulik.

# text
seg-fe83216ebeed = Tõmbepäring, mis muudab käitumist ilma muudatuste logi kirjeta, on poolik.

# text
seg-776cd2ef0b0c = Ekspordikontroll

# text
seg-d0f1db9798a6 = PNT vastupidavus ja kvantandurdus võivad puutuda kahese kasutusega ekspordikontrolli. Hoia avalik hoidla üldiste, avaldatud mudelite ja meetodite juures. Kõik, mis meenutab ekspordi suhtes tundlikku vastupidavuse/spuufimisvastast sügavust, kuulub privaatsele kihile, mitte siia. Kahtluse korral tuleb enne panustamist küsida.

# text
seg-506a29aafc12 = Litsents

# text
# c1: LICENSING.md
seg-c0409a1226ca = Kshana on kahe litsentsiga (AGPL-3.0 <b>või</b> Ashforde OÜ kommertslitsents — vt <a1><c1/></a1>). Et see jätkuvalt töötaks, peavad panused olema kasutatavad <b>mõlema</b> litsentsi all. Seega panustades nõustutakse, et:

# text
seg-da7b02ac890c = panus on litsentsitud sissetulevalt <b>AGPL-3.0-only</b> alusel; ja

# text
seg-8d6ed0d3a17f = <b>antakse ka Ashforde OÜ-le</b> tähtajatu, ülemaailmne, tasuta, tühistamatu litsents kasutada, muuta ja <b>panust uuesti litsentsida osana Kshana kommertslitsentsiga väljaandest</b> (st levitada seda ka mitte-AGPL kommertstingimustel). Autoriõigus panusele jääb panustajale.

# text
seg-3b1a0dd6b5aa = See kerge kahe litsentsi andmine — mitte autoriõiguse loovutamine — võimaldab projektil jääda avatuks <em>ja</em> pakkuda kommertsväljaannet. Kui andmine ({ "2" }) ei ole võimalik (näiteks tööandjale kuuluv kood), tuleb sellest tõmbepäringus enne panustamist teada anda.

# text
# c1: integrations/opencpn/plugin/
# c2: LICENSE
seg-6630d0ac4ad5 = <b>Erand: <c1/>.</b> See kataloog on litsentsitud <b>GPL-3.0-or-later</b> alusel (vt selle <c2/>) ja jääb kommertslitsentsist välja. Panused sellesse on litsentsitud sissetulevalt <b>ainult</b> GPL-3.0-or-later alusel; andmine ({ "2" }) neile ei kehti.

# text
# c1: git commit -s
# c2: Signed-off-by
seg-0a78a12b1188 = Allkirjasta iga commit, et kinnitada <a1>Developer Certificate of Origin</a1>: <c1/> (lisab rea <c2/>).

# text
seg-9f86d8f58b17 = <s1>Eelmine</s1>Turvalisus

# text
seg-fc760238e9a5 = <s1>Järgmine</s1>Juhtimine
