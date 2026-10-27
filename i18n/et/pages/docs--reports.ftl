# docs--reports: translations (et)

# text
seg-3ea93ae372ca = Mida see sisaldab

# text
seg-245adc6e6766 = <s1>Eelmine</s1>Kampaaniad

# text
seg-aa5482ac34ff = Piirangud, öeldud otse

# text
# c1: docs/REPORTS.md
seg-b0dcf3142564 = Allikas: <c1/>

# text
# c1: <scenario>.report.html
# c2: <scenario>.report.json
seg-4c412bb0ce63 = Iga käsurealiidese (CLI) käivitus kirjutab oma tulemuse kõrvale aruande: prinditava HyperText Markup Language (HTML) lehe <c1/> ja masinloetava JavaScript Object Notation (JSON) dokumendi <c2/>, mille sisu on sama. Aruanne töötab iga stsenaariumi liigi ja kampaaniate puhul.

# text
seg-e26b1a83a86d = Tulemusdokument vastab küsimusele <em>mida mootor arvutas</em>. Aruanne lisab selle, mida lugeja vajab enne tegutsemist: mis sisse läks, millel arvud põhinevad, mis jäeti välja ja kuidas samu baite uuesti saada. See ei leiuta midagi sellest. Iga jaotis loetakse allikast, mida mootor juba hoiab, ja nimetab allika tsiteeritu kõrval.

# text
# c1: kshana::advanced_report
# c2: src/advanced_report.rs
seg-bf0456f18e4f = Ehitaja on <c1/> (<c2/>). See on puhas funktsioon jooksu väljundist, stsenaariumifaili baitidest ja käsurealt: see ei loe kella, faili ega võrku ning see ehitab WebAssembly jaoks.

# text
seg-bed0af192da5 = Jaotised

# text
seg-fca842769048 = Jaotis

# text
seg-2654051d8292 = Loetakse

# text
seg-5790851a4a5f = Juhtkonnale mõeldud kokkuvõte

# text
seg-3d34b2ef5988 = mida liik teeb, jooksu üherealine kokkuvõte, põhiarvud, jooksu tasandi ausameelsuse silt, kasutatud VALIDATED / MODELLED / PARTNER võimekuste arv

# text
# c1: kshana kinds --json
# c2: label
# c3: figure_tiers
seg-923111083001 = liikide kataloog (<c1/>), tulemuse <c2/>, selle <c3/> plokk või headusarvu plokk, Monte Carlo kampaania protsentiilid

# text
seg-e1ce0e8d5c61 = iga väli, mille stsenaariumifail seab, lamendatud oma teeni, koos selle ühiku ja ühiku päritoluga

# text
# c1: units
# c2: docs/field-units-schema.json
# c3: _s
# c4: _ns
# c5: _m
# c6: _deg
# c7: _dbw
seg-fbd2e96c92c7 = stsenaariumifail; ühikud tulemuse <c1/> plokist (väljaühikute skeem, <c2/>), muidu välja nime järelliide (<c3/>, <c4/>, <c5/>, <c6/>, <c7/>, …); ühik, mida kumbki ei esita, prinditakse kui <b>esitamata</b>

# text
seg-88ccaef6fc49 = jooksu diagramm, tulemusdokumendi iga skalaar koos ühikuga ja iga numbrilise veeru arvu / miinimumi / maksimumi / esimese / viimase kokkuvõte

# text
# c1: units
seg-42a82485f8c8 = tulemusdokument ja selle <c1/> plokk

# text
seg-f554fbcdd85c = Koondamine (kampaaniad ja pühkimised)

# text
seg-7c0466805f54 = pühkimise sõlmetabel; Monte Carlo jooksu keskmine, standardhälve, 5., 50. ja 95. protsentiil ning keskmise { "95" }% usaldusvahemik, iga mõõdiku kohta histogrammiga; ahela faasitabel; kompositsiooni ühised tingimused, liikmed ja koondkokkuvõte

# text
# c1: sweep
# c2: monte_carlo
# c3: timeline
# c4: compose
# c5: sweep
# c6: sweep-nd
seg-7b5f5b635905 = kampaania tulemuse jaotis <c1/>, <c2/>, <c3/> või <c4/>; tulemuse <c5/> või <c6/> ruudustik

# text
seg-3bf44008fc65 = Animatsioon ja eksportimised

# text
# c1: --animate svg
seg-64d1073dfadc = jooksu animeeritud joonis (väljund <c1/>) manustatud inertse pildina või põhjus, miks seda ei ole; lingid animatsiooni- ja koostalitlusfailidele, mille sama käsk kirjutas aruande kõrvale; iga eksportimisvorming koos teabega, kas see kehtib stsenaariumi kohta, miks mitte, ja selle spetsifikatsiooniga

# text
# c1: src/animation.rs
# c2: interop::plan
# c3: --animate
# c4: --export
seg-ad7792e04197 = animatsiooni eksportija (<c1/>), <c2/> ja käsurea kirjutatud failid (<c3/>, <c4/>)

# text
seg-3d3781a3691b = Sündmuste ajajoon

# text
seg-f29f1b90edbd = ajastatud aknad ja punktsündmused, joonistatud ja tabelisse kantud jooksu ajateljel

# text
# c1: t0
# c2: t1
# c3: on_s
# c4: off_s
# c5: start_s
# c6: end_s
# c7: time.duration_s
# c8: events
seg-4271c092fa45 = stsenaariumitabelid väljadega <c1/>/<c2/>, <c3/>/<c4/>, <c5/>/<c6/> või algusaeg; jooksu ulatus <c7/>; mis tahes massiiv <c8/> tulemuses; kampaania faasid ja üleandmised

# text
seg-00bee96167aa = Kontrollimarkeerid

# text
seg-6dea392111a6 = iga kontrollimaatriksi rida, mida jooksu liigid rakendavad, koos selle sildi, sõltumatu etaloni ja testitõendiga ning tulemuse esitatud arvukohaste tasemetega

# text
# c1: src/verification.rs
# c2: docs/VERIFICATION-MATRIX.md
# c3: advanced_report::KIND_CAPABILITIES
seg-ca56309b9693 = kontrollimaatriks (<c1/>, <c2/>), liigi-ridade ristviite <c3/> kaudu

# text
seg-c19ae28a2355 = Modelleerimata ja eeldused

# text
seg-aff7a016c7e2 = iga piirang, tsiteeritult

# text
# c1: not_modelled
# c2: not_implemented
# c3: honesty
# c4: docs/MODELLED-RATIONALE.md
seg-9be853632d3a = tulemuse plokid <c1/>, <c2/> ja <c3/>; liikide kataloogi MODELLED klauslid; stsenaariumi kommentaarid ja sisendtekst, mis ütlevad „not modelled“; maatriksi põhjus, miks iga MODELLED rida jääb modelleerituks (<c4/>)

# text
seg-a3ee5ba71183 = Reprodutseeritavuse kirje

# text
seg-a9746c2f1881 = mootori versioon, lähtekoodi commit, stsenaariumifaili ja tulemusdokumendi Secure Hash Algorithm 256-bit (SHA-256) räsid, algväärtus, platvorm, täpne käsk, töökausta reegel, iga täiendava sisendfaili räsi

# text
seg-ec1f62f6bbd1 = ehitus, failid, käsurida

# text
seg-ea460048debd = Jaotis, millel pole midagi loetleda, ütleb miks ühe lausega (näiteks „No timed event: the scenario scripts no window or onset time and the result reports no event“). Ükski jaotis ei ole kunagi tühi ja vaikiv.

# text
seg-b99234469953 = Mida aruande silt tähendab

# text
seg-f9060b1e8077 = Kontrollimärge hindab maatriksireas nimetatud <b>võimekust</b>, nagu maatriks seda salvestab. See ei hinda stsenaariumi seadistust ja VALIDATED rida ei tee jooksu sisendeid mõõdetuks. PARTNER rida on distsipliin, millele jooks toetub ja mida Kshana ei paku (antennirealiis raadiosagedusliikide jaoks, kvantkasulik koorem kvantliikide jaoks, kosmoseaparaadi siin asendibüdžeti jaoks); aruanne näitab seda kui <em>toetutud, mitte pakutud</em>.

# text
# c1: requirement
# c2: sweep-nd
seg-da422ae044d2 = Liikide ja ridade ristviide on maatriksi <c1/> stringide tabel. Silt, sõltumatu etalon ja tõend loetakse aruande ehitamisel maatriksist tagasi, nii et rea liigutamine VALIDATED ja MODELLED vahel liigutab kaasa iga aruande. Kampaania kannab oma režiimi rida (ahel, pühkimine või Monte Carlo, koostamine) pluss iga liikme liigi iga rida, mida see käitas; <c2/> kannab pühitud liigi ridu. Iga jooks kannab ka rida „Reproducibility & software assurance“, millel reprodutseeritavuse kirje põhineb.

# text
# c1: advanced_report::PATH_GATED_CAPABILITIES
# c2: orbit
# c3: ephemeris
# c4: tle
# c5: slot-timing
# c6: oscillator.record
# c7: spectrum
# c8: [[panels]]
# c9: leo-pass
# c10: leo-pnt-chain
# c11: leo-navmsg
# c12: leo-pvt
# c13: terrain-nav
# c14: terrain-slam
seg-f38434695c28 = Rida, mis hindab ainult ühe liigi ühte sisenditeed, loetletakse ainult siis, kui jooks valis selle tee (<c1/>): <c2/> ja <c3/> kannavad rida „Orbit propagation & determination“ ainult väljaga <c4/> (Simplified General Perturbations { "4" } (SGP4) tee; analüütiline orbiit on kahe keha propageerimine) ja <c5/> kannab mõõdetud kirje rida ainult väljaga <c6/>. Sama tabel väravdab mitmeribalist rida <c7/> sellel, et jooks joonistab <c8/>, ning madala Maa orbiidi (LEO) liikide ridu sellel, millise tee iga jooks valis: <c9/> või <c10/> vihma-, hoonesisenemise-, madala energia või spuufija rida ainult siis, kui stsenaarium seab selle liikme, tsintillatsiooni rida kui stsenaarium seda välja ei lülita, <c11/>, <c12/> või ahela täpse punktpositsioneerimise rida ainult tulemuse kantud analüüsi või režiimi jaoks ja LEO süsteemi eelseadistuse rida ainult siis, kui kasutatakse nimetatud eelseadet. Shuttle Radar Topography Mission (SRTM) lugeja rida ei kanna ükski liik: <c13/> ja <c14/> töötavad sünteetilisel digitaalsel kõrgusmudelil (DEM) ja ükski stsenaariumi väli ei loe SRTM-i lehte. VALIDATED rida, mida jooks kunagi ei puudutanud, väidaks muidu tõendeid, mida jooksul ei ole.

# text
seg-29efeadac5c7 = Jooksu reprodutseerimine selle aruandest

# text
# c1: report.json
# c2: reproducibility
seg-e859939f0f42 = <c1/> → <c2/> sisaldab kõike vajalikku:

# text
# c1: scenario_sha256
# c2: input_files
# c3: --eop
seg-d65ad1b942e3 = Kontrollige stsenaariumifaili vastu <c1/> ja mis tahes faili kohas <c2/> (<c3/> Maa orientatsiooni fail) selle räsi vastu.

# text
# c1: command
seg-5b3c59266451 = Käivitage <c1/> kataloogist, kus algne jooks käivitati. Stsenaariumi tee ja mis tahes suhteline andmetee stsenaariumi sees lahendatakse selle suhtes.

# text
# c1: result.json
# c2: result_sha256
# c3: report.json
# c4: report.html
seg-9f38218af0f0 = Uuel <c1/> on SHA-256 väljal <c2/> ning uus <c3/> ja <c4/> on vanadega bait-baidilt identsed.

# text
# c1: tests/advanced_report_cli.rs
# c2: --eop
seg-a04db3e1c7f5 = <c1/> teeb täpselt seda kellastsenaariumi, aheldatud kampaania, pühkimiskampaania ja orbiidijooksu puhul failiga <c2/>: see loeb käsu aruandest välja, käitab selle värskes kataloogis, mis sisaldab ainult salvestatud sisendeid, ja võrdleb baite.

# text
# c1: scenario_sha256
# c2: scenario_hash
seg-1e2e9158544d = <c1/> on faili täpsete baitide räsi. Tulemuse enda <c2/> on midagi muud, liigi stsenaariumi sõrmejälg (sageli kanoonilisest vormist), ja aruanne prindib mõlemad, sildistatult.

# text
# c1: seed
seg-3d72d2059a6c = <b>Algväärtus.</b> Algväärtus on stsenaariumi <c1/>, muidu see, mille tulemus esitab. Liigi puhul, mis algväärtust ei võta, ütleb aruanne seda ja et tulemuse fikseerivad ainult stsenaariumifail ja mootori ehitus.

# text
# c1: KSHANA_GIT_COMMIT
seg-50457327734e = <b>Lähtekoodi commit.</b> Mootor salvestab commiti ainult siis, kui see ehitati keskkonnamuutujaga <c1/> seatud, loetuna kompileerimisajal:

# text
seg-3c7ed74729d3 = Ehitus ilma selleta teatab commiti kui salvestamata ja mootori versioon identifitseerib väljalaske. Midagi ei oletata.

# text
seg-86ff67531a0e = <b>Platvorm.</b> Ehituse operatsioonisüsteem, arhitektuur ja perekond. Tulemused on ühel platvormil bait-baidilt identsed; platvormide vahel võivad ujukomatulemused viimastes numbrites erineda (vt <a1>REPRODUCIBILITY.md</a1>).

# text
seg-eeb07da80914 = Determinism ja ainus ajatempel

# text
# c1: report.json
# c2: report.html
# c3: --study-name
# c4: meta.generated_utc
# c5: --study-name
# c6: tests/advanced_report.rs
# c7: scenarios/
seg-995ad516f5ae = Samad stsenaariumi baidid, algväärtus ja mootori ehitus annavad bait-baidilt identse <c1/> ja <c2/>. Aruanne ei kanna ajatemplit. Ainus kellanäit kogu kastis on see, mille teeb <c3/> ja mis kannab <c4/> tulemusdokumenti; aruanne näitab siis seda templit ja ütleb, et see on ainus väli, mida reproduktsioon ei kopeeri. Selle vältimiseks käitage ilma <c5/>. <c6/> ehitab iga stsenaariumifaili aruande kaustas <c7/> (komplekti manifest välja arvatud) kaks korda ja käitab kuus stsenaariumi uuesti (nende hulgas üks kampaania igast ahela, pühkimise ja koostamise režiimist), et seda otsast lõpuni kontrollida.

# text
seg-8a3fc60a5b54 = Printimine PDF-i

# text
# c1: --report pdf
# c2: report.html
seg-201bcec2caa3 = Mootor ei kirjuta Portable Document Format (PDF) faile. PDF-i kirjutaja, mis diagramme renderdaks, tähendaks uut rasket sõltuvust, seega valikut <c1/> ei ole. Selle asemel kannab <c2/> printimise stiililehte: avage see brauseris, printige ja valige „Save as PDF“.

# text
seg-13f1f294ede1 = Stiillehe on kirjutatud nii A4 kui US Letter jaoks. See ei sea paberi suurust (kehtib printimisdialoogi valik), hoiab { "15" } mm / { "14" } mm veeriseid, mis sobivad kummalegi lehele, lülitub mustale valgel, kordab tabeli päiseid igal lehel, hoiab tabeli ridu, jooniseid ja kaarte lehtede vahel lõhenemast, hoiab pealkirjad neile järgneva tekstiga ning alustab sisendite, tulemuste, kontrollimarkerite ja reprodutseeritavuse jaotisi uuelt lehelt. Navigatsiooniriba on printimisel peidetud.

# text
seg-a25bb320665d = JSON-dokument

# text
# c1: report.json
# c2: report_schema = "kshana-report"
# c3: report_schema_version = "1.0"
# c4: kind
# c5: title
# c6: executive_summary
# c7: inputs
# c8: results
# c9: aggregation
# c10: events
# c11: capabilities
# c12: not_modelled
# c13: companions
# c14: animation
# c15: exports
# c16: export_command
# c17: reproducibility
# c18: items
# c19: omitted
# c20: items
# c21: statement
# c22: value
# c23: display
# c24: null
# c25: value
# c26: display
seg-9d9af39942a7 = <c1/> sisaldab <c2/> ja <c3/>, seejärel <c4/> ja <c5/> ning ühe võtme jaotise kohta: <c6/>, <c7/>, <c8/>, <c9/> (ainult kampaaniad ja pühkimised), <c10/>, <c11/>, <c12/>, <c13/> (jaotis 3b: <c14/>, <c15/> ja <c16/>) ja <c17/>. Loendijaotisel on <c18/>, <c19/> (read, mille lehe ülempiir välja jättis; tulemusdokument kannab iga väärtust) ja, kui <c20/> on tühi, <c21/>, mis ütleb miks. Väärtus säilitab oma toor-JSON-kuju väljal <c22/> ja lehel näidatud teksti väljal <c23/>; puuduv väärtus on <c24/> väljal <c25/> ja „no value“ väljal <c26/>.

# text
seg-06cc70ca3601 = <b>Ühikud.</b> Kui ei väljaühikute skeem ega välja nimi anna ühikut, ütleb aruanne „not stated“, mitte ei oleta. Kampaania liikmestsenaariumite sees olevad sisendid lahendatakse ainult kampaania enda ühikuplokki ja välja nime järelliite vastu, seega loetakse neist rohkem „not stated“ kui eraldiseisval jooksul.

# text
seg-023d5a1fbffc = <b>Ristviite otsus.</b> Millised maatriksi read liik rakendab, on kureeritud tabel, mida test kontrollib nimetama igal kirjel täpselt ühte olemasolevat rida ja katma iga sisseehitatud liiki. See, kas iga vastavus on õige, on inimese otsus, nagu maatriksi enda sõltumatu etaloni valik.

# text
# c1: omitted
seg-0a7465f4c29a = <b>Ülempiirid.</b> Leht loetleb kuni { "400" } sisendit, { "150" } skalaartulemust, { "60" } numbrilist veergu ja { "200" } sündmust; <c1/> loendab ülejäänud. Üle { "24" } rea tabel stsenaariumi sees (sissetoodud jada) kokku võetakse veeru kaupa.

# text
# c1: kshana --study <suite.toml>
# c2: <suite>.study.json
# c3: <suite>.study.html
seg-1fa26ed86bb8 = <c1/> hoiab oma <c2/> ja <c3/>; see ei kirjuta seda aruannet.

# text
# c1: RunOutput::html_report()
# c2: web/studio/lib/report.mjs
# c3: kshana::advanced_report::build
# c4: report_scenario
# c5: scenario.toml
seg-1ccdffd389fb = <b>Sidumised.</b> Pythoni ja WebAssembly sidumised hoiavad <c1/>, üheleheküljelist tulemuskaarti; mänguväljaku allalaaditav aruanne on selle enda leht (<c2/>). Selle aruande kirjutab CLI ja Rusti kutsujad saavad selle ehitada funktsiooniga <c3/>. Model Context Protocol (MCP) server tagastab selle oma tööriistast <c4/>, JSON-ina või HTML-lehena; stsenaariumifaili nimi selle reprodutseerimiskäsus on see, mille kutsuja annab (vaikeväärtus <c5/>), ja see ei loetle kaasfaile, sest server ei kirjuta ühtegi.

# text
seg-c8ab7b4605cf = <s1>Järgmine</s1>Animatsiooni eksport
