# docs--reproducibility: translations (et)

# text
seg-03cb5fb3dd8f = Jah

# text
seg-a7d5633dbcc0 = Reprodutseeritavus ja päritolu

# text
# c1: docs/REPRODUCIBILITY.md
seg-ab939e90efad = Allikas: <c1/>

# text
seg-1c48a3edda84 = Kshana on ehitatud reprodutseeritavaks: samad sisendid annavad samad tulemused ja ehituse artefakte saab jälgida tagasi neid tootnud lähtekoodini. See dokument ütleb täpselt, mis on tagatud, mis mitte ja kuidas tagatisi jõustatakse.

# text
seg-95b0eba44abe = Determinismi tagatised

# text
# c1: ChaCha8Rng
# c2: seed
seg-1f637144697d = Mootoril ei ole seinakella, täitmislõimest sõltuvust ega algväärtustamata juhuslikkust. Iga juhuslik protsess on juhitud voo <c1/> poolt, mis on võtmestatud stsenaariumi <c2/> järgi ja tõmmatud fikseeritud järjekorras. Tagajärjed:

# text
seg-14df30025491 = Omadus

# text
seg-f0badf8cb640 = Tagatud

# text
seg-9f6678ac42f5 = Jõustab

# text
# c1: result.json
seg-cfc934af2c75 = Sama stsenaarium, sama masin → bait-baidilt identne <c1/>

# text
# c1: scripts/check-reproducible.sh
seg-917da569fdd7 = <c1/> (käitab etalonstsenaariumi kaks korda, võrdleb SHA-256 (SHA: Secure Hash Algorithm))

# text
seg-27351cbdc2b5 = Sama stsenaarium → identsed headusarvud väli väljalt

# text
seg-bdeaf344acf8 = Jah, platvormi kaupa

# text
# c1: tests/golden.rs
seg-debbc6540baf = <c1/> fikseerib iga headusarvu (FoM) nelja etalonstsenaariumi jaoks

# text
# c1: scenario_hash
seg-f7c5427c88f9 = Stsenaariumi sisendräsi (<c1/>) on platvormist sõltumatu

# text
# c1: tests/golden.rs
seg-2bdf4b2d80be = kanoonilise stsenaariumi sisupõhine SHA-256, fikseeritud failis <c1/>

# text
seg-45861afe0994 = Sisendi sõrmejälg + väljundi <b>kuju</b> identsed üle OS-i (operatsioonisüsteemi)

# text
# c1: tests/cross_platform_golden.rs
# c2: .sha256
# c3: tests/golden/
seg-49345663b97c = <c1/> fikseerib täpse SHA-256 stsenaariumi kohta (kümme stsenaariumi, üks <c2/> fail igaühe kohta kaustas <c3/>), kontrollituna 3-OS CI (pidev integratsioon) maatriksil

# text
seg-e54b5ff80782 = Väljundi <b>väärtused</b> langevad kokku üle OS-i (ubuntu/macOS/Windows)

# text
seg-271bcbff6287 = Jah, täpsusega { "1e-6" }

# text
# c1: reproducibility-matrix
# c2: golden.rs
# c3: sgp4_verification.rs
# c4: determinism.rs
seg-3c25e00debff = CI töö <c1/> käitab <c2/> ({ "1e-6" }), <c3/> ({ "2e-5" } km) ja <c4/> kõigil kolmel OS-il

# text
seg-3876618cc821 = Madala Maa orbiidi (LEO) navigatsioonisõnumi kaader on samad baidid igal platvormil ja igas ehitusprofiilis, WebAssembly (WASM) ehitus kaasa arvatud

# text
# c1: src/portable_math.rs
# c2: leo-navmsg
# c3: libm
# c4: leo_navmsg::tests::the_encoded_frame_is_the_same_bytes_on_every_platform
seg-8aff3ee31c7e = <c1/> (iga transtsendentne funktsioon ja iga normaaljaotuse tõmme liigis <c2/> läheb läbi puhta Rusti kasti <c3/>); <c4/> fikseerib terve kaadri ilma platvormi väravata

# text
seg-69750a5db756 = Algväärtustatud indeksitõmbed (bootstrap-valim, segamised) on samad 32-bitistel ja 64-bitistel sihtidel

# text
# c1: portable_math::uniform_index
# c2: u64
# c3: portable_math::tests
seg-01e0601aa7fc = <c1/> valib alati kujul <c2/>; fikseeritud failis <c3/>

# text
seg-e42899fd8a4e = Igal pool sama tööriistaahel

# text
# c1: rust-toolchain.toml
# c2: scripts/check-toolchain.sh
seg-0bdd9769d5fb = <c1/> fikseerib kanali; <c2/> laseb ehituse triivi korral ebaõnnestuda; CI ja väljalase fikseerivad sama versiooni

# text
seg-b0a3fd993614 = Sama sõltuvuste komplekt

# text
# c1: Cargo.lock
# c2: cargo metadata --locked
seg-5a3daf9f0468 = <c1/> on sissekantud ja <c2/> kasutatakse SBOM-i jaoks (tarkvara komponentide loetelu)

# text
# c1: <scenario>.report.json
# c2: .report.html
# c3: tests/advanced_report_cli.rs
# c4: scenarios/clock-holdover.toml
# c5: report.json
seg-3ec3fae0dc5e = Iga käsurea käivitus kirjutab oma aruandesse ka reprodutseeritavuse kirje (<c1/> ja <c2/>): mootori versioon, stsenaariumifaili ja tulemusdokumendi SHA-256, algväärtus, platvorm ja täpne käsk, mida <c3/> uuesti käitab bait-baidilt identse tulemuseni. Aruanne on ise jooksu puhas funktsioon: kaks käivitust <c4/> kirjutavad sama <c5/> bait-baidilt. Vt <a1>REPORTS.md</a1>.

# text
seg-273a66a3584d = Platvormideülene hoiatus (ja kuidas etalonväärtused sellega toimivad)

# text
# c1: sqrt
# c2: ln
# c3: exp
seg-9f4ec3dc638d = Arvulised tulemused on <b>antud platvormil bitisammuti identsed</b>, kuid võivad <b>platvormide vahel</b> erineda viimaste ühikute viimases kohas (ULP). Põhjus on platvormi matemaatikateek: <c1/>, <c2/>, <c3/> ja sarnased ei pea IEEE-754 (IEEE: Institute of Electrical and Electronics Engineers) järgi olema korrektselt ümardatud, seega võivad Linux (glibc, GNU C teek), macOS ja Windows igaüks tagastada erineva viimase biti. Pikal jooksul kogunevad need ~{ "1e-16" } erinevused ehk ~{ "1e-12" } suhtelisele.

# text
# c1: src/test_support.rs
seg-9297c2585419 = Kaks asja teevad selle viimase koha erinevuse suuremaks kui see algab ja mõlemad on mõõdetud, mitte eeldatud. <b>Adaptiivne integraator</b> valib oma järgmise sammu veahinnangust viienda juure kaudu, nii et üks ühik viimases kohas muudab sammujada ja kaks platvormi nõustuvad siis ainult integreerimistolerantsi täpsuseni. <b>Iteratiivne hindaja</b> (vähimruutude sobitus, orbiidi määramise filter) võib minna kokkuläbimiseni teist rada. Mõlemale ehitatud liigid võivad platvormide vahel üksikutel väljadel erineda rohkem kui { "1e-6" }; <c1/> salvestab sama režiimi ühikutestide jaoks.

# text
# c1: sin
# c2: leo-ppp-convergence
seg-c6bd20427abc = <b>Ehitusprofiil</b> loeb samamoodi, ühel masinal. Optimeeritud ehitus macOS-il liidab ühe argumendi siinuse ja koosinuse üheks väljakutseks süsteemi ühisrutiinile, mille siinus erineb üksiku <c1/> viimases bitis { "379" } argumendi puhul { "200 000" }-st; optimeerimata ehitus teeb need kaks väljakutset. Mõõdetud aarch64 macOS-il { "138" } stsenaariumifaili peal annavad ühe lähtekoodi silumis- ja väljalaskeehitus bait-baidilt identsed tulemusdokumendid { "102" } jaoks. Ülejäänud { "36" } erinevad viimastes kohtades: { "28" } täpsusega { "1e-6" }, üks (<c2/>) { "2.8e-6" } võrra ja seitse kampaaniat ainult oma liikmete jooksude räsides; ükski ei erine sildis, arvus ega verdiktis. Ülaltoodud bait-baidilt identsuse tagatis kehtib seega ühe ehituse kohta: sama kahendfail kaks korda.

# text
seg-ff368c627bd2 = Algväärtustatud <b>normaaljaotuse tõmmetel</b> on kolmas, palju harvem allikas: valimi võtja kutsub oma harvades harudes hosti eksponent- ja logaritmfunktsiooni ning umbes üks tõmme miljonist erineb natiivse ja WASM-ehituse vahel viimase biti poolest.

# text
# c1: src/portable_math.rs
# c2: leo-navmsg
seg-0b7ebca1a5e3 = Kui väljund on <b>diskreetne</b>, ei ole viimase koha erinevus üldse vastuvõetav ja liik arvutatakse hosti teegi asemel funktsiooniga <c1/>. Liik <c2/> on esimene: selle kahendkaader on edastatud täisarvud ja sama stsenaarium kodeeriti kord kolmeks erinevaks kaadriks: väljalaskeehituses, sama lähtekoodi silumisehituses ja brauseris. Nüüd on see kõigis kolmes samad baidid.

# text
seg-1746a0ea22fe = Seetõttu etalontestid <b>ei</b> fikseeri ujukomaväljundi ühte platvormideülest räsi — see oleks habras ja laseks teisel OS-il ebaõnnestuda ka õigesti ehitatud ehitustel. Selle asemel:

# text
# c1: tests/golden.rs
# c2: 1e-6
seg-9733b0545768 = <b><c1/></b> fikseerib iga headusarvu suhtelise tolerantsiga <c2/> — neli suurusjärku täpsem kui mis tahes reaalne regressioon (mis liigutab väärtust terve protsendi võrra), kuid palju lõdvem kui platvormideülene matemaatikateegi (libm) värin. Ruudustikuga piiratud väljad (holdover-sekundid) ja täpselt nulliga väljad fikseeritakse täpselt.

# text
# c1: scenario_hash
seg-a3dfe1c26401 = <b><c1/></b> — <em>sisendite</em> sisuräsi — on platvormist sõltumatu ja fikseeritud täpselt.

# text
# c1: tests/cross_platform_golden.rs
# c2: tests/golden/
seg-571aea9b8115 = <b><c1/></b> fikseerib täpse SHA-256, sissekantud stsenaariumi kohta failis <c2/>, projektsiooni kohta, mis <em>on</em> platvormide vahel identne: sisendi sõrmejälg pluss väljundi <b>kuju</b> (väljade nimed, pesastus, lehetüübid, massiivide pikkused — fikseeritud deterministliku ruudustikuaritmeetikaga, mitte kunagi ujukomaväärtustega). See tabab struktuurilisi regressioone täpselt, samal ajal kui ülaltoodud tolerantsifikseeringud tabavad väärtuste regressioone.

# text
# c1: scripts/check-reproducible.sh
seg-8543165b0d7d = <b><c1/></b> jõustab bait-baidilt identse väljundi kahe jooksu vahel <em>samal masinal</em> (determinismi tagatis).

# text
# c1: reproducibility-matrix
# c2: cross_platform_golden
# c3: golden
# c4: determinism
# c5: sgp4_verification
seg-8b8b4ba5de30 = <b>CI töö <c1/></b> käitab neli ülaltoodud testi (<c2/>, <c3/>, <c4/>, <c5/>) platvormidel <b>ubuntu-latest, macos-latest ja windows-latest</b>, nii et platvormideülest reprodutseeritavust väidetakse igal push'il — kuju/sisendi etalonid täpselt, arvväärtused täpsusega { "1e-6" } ja SGP4 (Simplified General Perturbations { "4" }) olekud täpsusega { "2e-5" } km — mitte ei toetuta ühele OS-ile.

# text
# c1: tests/golden.rs
# c2: CHANGELOG.md
seg-2b9915611f03 = Kui peate fikseeritud arvud uuesti genereerima (nt pärast ettenähtud mudelimuutust), käitage iga etalonstsenaarium ja kopeerige prinditud FoM-väärtused faili <c1/>, seejärel märkige muutus faili <c2/>.

# text
seg-9310a7af7ff8 = Tarkvara komponentide loetelu (SBOM)

# text
# c1: scripts/gen-sbom.sh
# c2: cargo metadata --locked
# c3: sgp4
seg-717baa65bbb2 = <c1/> väljastab CycloneDX { "1.5" } SBOM-i, mis loetleb iga kasti, mis kuulub kshana artefakti, koos selle täpse versiooni, allika ja litsentsiga. See on sõltuvusteta generaator, mis on ehitatud peale <c2/> (nii et see töötab ainult tööriistaahelaga) ja see käib läbi lahenduse graafi kshana paketist läbi tavaliste ja ehitussõltuvuste. Arendussõltuvused (ainult testiks mõeldud kastid, nagu <c3/>) on välja jäetud, sest ükski artefakt neid ei sisalda.

# text
# c1: --features python
# c2: pyo3
# c3: --features wasm
# c4: tests/fixtures/reproducibility_software_assurance/
# c5: kshana-mcp
seg-a7886c557267 = Graaf on nende funktsioonikomplektide ühend, millega tarnitavad artefaktid on ehitatud: vaikeehitus (teek ja käsurealiides (CLI)), <c1/> (PyPI (Python Package Index) wheel, mille <c2/> ahel on selle võõrfunktsiooniliides) ja <c3/> (npm pakett, mis kannab seda sama SBOM-i oma tarballis). Platvormitingimuslikud sõltuvused igale sihile on kaasatud, sest wheel'id tarnitakse mitmele operatsioonisüsteemile ja npm pakett sihib WebAssembly't. Üks dokument katab kõik kolm artefakti, seega on see iga üksiku jaoks ülemhulk. Praegu loetleb see { "107" } komponenti; arv on fikseeritud failis <c4/>. Eraldiseisval serveril <c5/> on oma manifest ja seda see SBOM ei kirjelda.

# text
seg-4c8948e9ee7d = Väljund on deterministlik — sama sõltuvuste komplekt annab bait-baidilt identse dokumendi, sealhulgas järjenumbri, mis on tuletatud sorteeritud pakettide loendist, mitte ajatemplist.

# text
# c1: kshana-sbom.cdx.json
seg-60742bbdc583 = Väljalaske töövoog genereerib SBOM-i (<c1/>) ja lisab selle igale märgendatud väljalaskele; avaldamise töövoog tarnib selle ka PyPI wheel'ide kõrval ja npm paketi sees.

# text
seg-928c3c0108a1 = Ehituse päritolu

# text
# c1: actions/attest-build-provenance
# c2: kshana-mcp
# c3: SHA256SUMS
# c4: gh attestation verify
seg-42752467bfaa = Väljalaske töövoog toodab SLSA (Supply-chain Levels for Software Artifacts) ehituse päritolu tõendi (<c1/>), mis katab iga faili, mille see GitHubi väljalaskele lisab: iga platvormi käsurea kahendfailid, serveri <c2/> kahendfail, SBOM, valideerimiskokkuvõte ja <c3/>. Tarbija saab käsuga <c4/> kontrollida, et artefaktid ehitas selle hoidla väljalaske töövoog sellest lähtekoodist — sulgedes lõhe „siin on kahendfail“ ja „siin on kahendfail, mille ma saan lähtekoodini jälgida“ vahel. Näiteks versiooni { "v0.28.0" } SBOM-i jaoks:

# text
seg-06515d230d33 = <s1>Eelmine</s1>Päritolu

# text
seg-c6dba4e40c76 = <s1>Järgmine</s1>Võimekuste kaart
