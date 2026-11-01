# docs--campaigns: translations (et)

# text
seg-f917e7fcac09 = Mis see on

# text
seg-cae10fb9bff8 = Stsenaarium

# text
# c1: docs/CAMPAIGNS.md
seg-7603033b1c87 = Allikas: <c1/>

# text
# c1: campaign
# c2: kind
# c3: api::run_toml
# c4: kshana <file>.toml
seg-699c946d7d09 = Üks stsenaarium vastab ühele küsimusele ühe olukorra kohta. Missioon on olukordade jada ja kavandiuuring on nende pere. Stsenaariumi liik <c1/> koostab olemasolevad liigid üheks käivituseks, ühtegi neist uuesti realiseerimata: iga liige on tavaline stsenaariumitabel, mis kannab oma välja <c2/>, suunatakse läbi <c3/> täpselt nii, nagu käivitaks seda <c4/>, ning kampaania loeb tulemusdokumentidest välja ainult arve.

# text
seg-cb4f48673970 = Kampaania on <b>MODELLED</b>. Selle koostamisidentsused on testitud (allpool), kuid faaside aheldamine on modelleerimisvalik ja iga faas on vaid nii hea kui liik, mis seda käivitas.

# text
seg-80e367fbc391 = Käivita üks nagu iga teine stsenaarium:

# text
seg-9f9995ebc904 = Kampaania võib sisaldada nelja jaotise mis tahes kombinatsiooni; ilma ühegi jaotiseta kampaania käivitub ja selle kokkuvõte ütleb, et see ei koostanud midagi.

# text
# c1: [[phases]]
seg-002ddd72b3a2 = <c1/>: aheldatud missioon ühel ajajoonel

# text
# c1: [timeline] step_s
seg-e99c4453b79d = Iga faas käivitab ühe või mitu stsenaariumi jagatud missiooni ajajoone aknas, näiteks holdover-is olev kell ja samal ajal inertsist liikuv inertsiaalnavigatsioonisüsteem (INS). Iga käivituse väljundid loetakse nimega <b>kanalitesse</b>, paigutatakse faasi algusaega ja taasvalimitakse ühisele võrgule (<c1/>) nullkärgu hoiuga: võrguaeg võtab omava faasi käivituse viimase valimi, mis on selle hetkega võrdne või sellest varasem, ning on null, kui ükski selle faasi käivitus kanalit ei paku.

# text
seg-842b77a21c5f = Kanal

# text
seg-b2eb598fab2a = Eelseadistuse allikas

# text
seg-f42465f7d066 = ns

# text
seg-fdb4600bf100 = kella ajaviga

# text
seg-aef6b877191d = ajavea kaitsepiir

# text
# c1: threshold_ns
seg-cc989ca58f1d = käivituse enda <c1/>

# text
seg-5e9f7cd33017 = keskmine efektiivne kandja ja müra tiheduse suhe (C/N0) nähtavate satelliitide peale

# text
# c1: jamming
# c2: epochs[].sats[].cn0_effective_dbhz
seg-af6f07319f2d = <c1/>: <c2/> keskmine

# text
seg-f6b4ea158327 = jälgimise kadumise põrand

# text
# c1: jamming
# c2: tracking_threshold_dbhz
seg-126535297c32 = <c1/>: stsenaariumi <c2/>, kui see on antud

# text
seg-f8f430695a88 = endiselt jälgitavad satelliidid

# text
seg-3f9a9f33010b = vertikaalne kaitsetase

# text
seg-2cfc68fa1c15 = vertikaalne häirepiir

# text
seg-d165177a255c = asukohaviga

# text
seg-29651ae6be6f = asukohavea lävi

# text
seg-c893c5e3ace5 = { "1" } niikaua, kui faasi mis tahes monitor annab häire

# text
seg-ade1d7072512 = vt allpool

# text
# c1: <side>
# c2: classical
# c3: side = "quantum"
# c4: [[phases.runs.series]]
# c5: []
# c6: epochs[].t
# c7: input:
# c8: mean
# c9: min
# c10: max
# c11: count
seg-e8c7ac7d117f = <c1/> on <c2/>, kui käivitus ei sea <c3/>. Mis tahes muud suurust loetakse selgesõnalise kirjega <c4/>: ajatee ühe <c5/> kaudu, mis nimetab read (<c6/>), nende ridadega jagatud väärtustee või skalaar, mis edastatakse igale reale (prefiks <c7/> loeb käivituse stsenaariumi, mitte tulemust), valikuline reduktsioon (<c8/>, <c9/>, <c10/>, <c11/>) mitme väärtuse jaoks ühe rea all, skaala ja ühik kanalile, mida kampaania ei tunne.

# text
seg-7d7bc5d19a61 = <b>Häired</b> tulevad kolmest kohast, mida faasi sees kombineeritakse loogilise OR-iga:

# text
# c1: jamming
# c2: integrity
seg-74a10f5283ec = käivitusest loetud eelseadistatud lipud: <c1/> annab häire, kui jälgitakse alla nelja satelliiti (selle enda kättesaadavuse definitsioon); <c2/> annab häire epohhidel, mille see märgib kättesaamatuks;

# text
# c1: carry
# c2: clock
# c3: guard_ns
# c4: gnss-ins
# c5: position_threshold_m
# c6: [[phases.runs.alarms]]
seg-f22be2880015 = eelseadistatud reeglid faasi kanalitel, hinnatakse <b>pärast</b> <c1/>: <c2/> annab häire, kui absoluutne ajaviga ületab <c3/>; <c4/> kui asukohaviga ületab <c5/>; selgesõnalised reeglid lähevad jaotisesse <c6/>;

# text
# c1: spoof
# c2: detect_time_s
# c3: spoof-detect
seg-ccd94a7cb652 = häiret tekitavad sündmused: <c1/> tekitab ühe oma kellaga abistatud monitori hetkel <c2/>; <c3/> tekitab ühe faasi alguses, kui selle liitotsus annab häire.

# text
seg-f88b8ad5672f = <b>Olek antakse edasi</b> faaside vahel kolmel selgesõnalisel viisil:

# text
# c1: carry = ["time_error_ns"]
seg-0e3a0ee8e172 = <c1/> liidab kanali väärtuse eelmise faasi lõpus selle faasi väärtustele. Kella faas, mida spuufer kõrvale tõmbas, on koht, kust holdover algab. Nihke liitmine on täpne kella faasi puhul, mis integreerib sagedust; asukohavea puhul eeldab see, et kaks viga on kollineaarsed, mis on pessimistlik juhtum.

# text
# c1: [[phases.handoff]]
# c2: channel:<name>
seg-4db8b11391a5 = <c1/> kirjutab arvu eelmisest faasist (<c2/> kanali lõppväärtuse jaoks või mis tahes eelmise käivituse tulemustee) selle faasi stsenaariumi punktiga eraldatud võtmesse enne selle käivitamist, valikulise skaala ja nihkega.

# text
# c1: end_at = "<result path>"
# c2: duration_s
# c3: classical.detect_time_s
seg-fdd5aa8b9627 = <c1/> lõpetab faasi käivituse arvutatud ajal, piiratuna väärtusega <c2/>. Komplekteeritud missioon lõpetab oma spuufimisfaasi hetkel <c3/>.

# text
# c1: skip_s
seg-cdd64676f509 = <c1/> jätab käivituse enda ajajoone esimesed sekundid (soojenduse) enne faasi nullaega kõrvale.

# text
seg-d48bcd9890d3 = Komplekteeritud missioon

# text
# c1: scenarios/campaign-jam-spoof-holdover-integrity.toml
seg-52fc5abca41f = <c1/> käivitab { "18" } liikmestsenaariumi kuues faasis { "10" } s võrgul:

# text
seg-baea4e05ad26 = Faas

# attr:aria-label, text
seg-9d3ee6a5613e = Käivitused

# text
seg-87fbeeb9abb9 = Mida ajajoon näitab

# text
seg-82bebc2bb038 = nominaalne, { "600" } s

# text
# c1: clock
# c2: jamming
# c3: integrity
seg-cf54dae64cb7 = <c1/>, <c2/> (segajat pole), <c3/>

# text
seg-5cb80e4a7d4d = ajaviga { "0" } ns; C/N0 { "43.0" } dB-Hz { "25" } dB-Hz põranda vastu; vertikaalne kaitsetase { "9.1" } kuni { "21.6" } m { "50" } m häirepiiri vastu

# text
seg-13c92a72544a = segamine, { "600" } s

# text
seg-f9c01304734d = sama, segaja -30 dBW juures, { "1" } km

# text
seg-27d3b65152b0 = C/N0 langeb väärtuseni { "27.7" } dB-Hz, kõik { "8" } satelliiti jälgitakse endiselt

# text
# c1: end_at
seg-6a052db03815 = spuufimine, lõppes hetkel { "370" } s tänu <c1/>

# text
# c1: spoof
# c2: spoof-detect
# c3: jamming
seg-89856c1f83f8 = <c1/> ({ "0.1" } ns/s ajarambi), <c2/>, <c3/>

# text
seg-cfcdd96b1132 = ajaviga kasvab väärtuseni { "36" } ns; raadiosageduslik detektor annab häire faasi alguses, kellaga abistatud monitor hetkel { "370" } s

# text
seg-92c8a76b84c2 = holdover, { "1800" } s

# text
# c1: clock
# c2: gnss-ins
# c3: jamming
seg-8a6e0b2898d1 = <c1/> (keelatud, kannab { "37.0" } ns), <c2/> (taktikaline seade liigub inertsist), <c3/> väärtusel { "10" } dBW

# text
seg-1948491e25ec = iga satelliit kadunud (C/N0 ligikaudu -12 dB-Hz); ajaviga { "36.4" } kuni { "62.7" } ns { "50" } ns piirdetaseme vastu; asukohaviga kuni { "24" } km

# text
seg-93e59087dd44 = integrity-alarm, { "600" } s

# text
# c1: clock
# c2: jamming
# c3: integrity
seg-f28f37baf8fe = <c1/> (kannab { "59.6" } ns), <c2/> ja <c3/> { "25" } kraadise maskiga

# text
seg-83d890c819f8 = { "5" } satelliiti jälgitakse; kaitsetase { "19" } kuni { "135" } m, puudub { "18" } võrguajal { "60" }-st; üle kantud ajaviga, { "52.1" } kuni { "61.7" } ns, püsib { "50" } ns piirdetasemest kõrgemal, seega on häire üleval kogu faasi vältel

# text
seg-1ab40b7893db = taastumine, { "600" } s

# text
seg-181d2a2f800b = ajaviga tagasi { "0" } ns; häire vaikib

# text
# c1: integrity
seg-26ef3dc422ff = Terviklikkuse käivitused kasutavad näite <c1/> enda kasutajarada ({ "0.4" } km kõrgusel olev ringrada), mitte segamise vastuvõtja fikseeritud asukohta, ja { "25" } kraadine mask asendab uuesti haarava vastuvõtja osalist taevast. Need on stsenaariumi valikud, mis on faili kirja pandud.

# text
seg-03ae98f17988 = L-riba spektri juhitud missioon

# text
# c1: scenarios/campaign-spectrum-holdover-integrity.toml
# c2: spectrum
# c3: jamming
# c4: scenarios/l-band-waterfall-jamming.toml
seg-5daf8c8fdd83 = <c1/> käivitab { "8" } liikmestsenaariumi kolmes faasis { "1" } s võrgul, kusjuures GPS L1 C/A ja Galileo E1 C/N0 loetakse stsenaariumi liigist <c2/> (vt <a1>SPECTRUM.md</a1>), mitte stsenaariumi liigi <c3/> satelliidikaupa tabelist. Segajad on needsamad, mis failis <c4/>.

# text
# c1: end_at
seg-7f34a00af961 = algus, lõppes hetkel { "10" } s tänu <c1/>

# text
# c1: clock
# c2: spectrum
# c3: integrity
seg-471ec0d86f76 = <c1/>, <c2/> (chirp alates { "10" } s), <c3/>

# text
# c1: timeline.bands[0].first_loss_t_s
seg-00b032242ebc = L1 C/A { "43.48" } ja E1 { "44.73" } dB-Hz; faas lõpeb spektri käivituse enda L1 C/A esimese kadumisega (<c1/>); kaitsetase { "21.6" } m { "50" } m vastu

# text
seg-50220d719d5d = holdover, { "600" } s

# text
# c1: clock
# c2: spectrum
seg-50de7cd69ac0 = <c1/> (keelatud, kannab alguse viga, siin { "0" } ns), <c2/> (chirp sees)

# text
seg-1d59e94d94e5 = L1 C/A { "3.38" } ja E1 { "4.44" } dB-Hz, mõlemad { "25" } dB-Hz põrandast allpool; ajaviga -0.07 kuni { "5.06" } ns { "50" } ns piirdetaseme vastu; häire üleval

# text
seg-6c56497d74fb = galileo-fallback, { "300" } s

# text
# c1: clock
# c2: spectrum
# c3: integrity
seg-62bcfd3e8732 = <c1/> (uuesti sünkroniseeritud), <c2/> (CW-toon L1 kandelainel), <c3/> Galileo-laadsel Walkeri konstellatsioonil 24/3/1

# text
seg-d455f0c06ee6 = L1 C/A püsib tasemel { "17.98" } dB-Hz, E1 tagasi tasemel { "44.73" } dB-Hz; kaitsetase { "6.1" } kuni { "17.7" } m; häire vaikib

# text
seg-2db37e292efe = E1 taastumine CW-tooni all tugineb spektri liigi pideva spektri käsitlusele: toon asub MBOC spektri nullkohas ega seo midagi. Päris toon seostuks koodi spektrijoonte kaudu; see on kirjas failis ja failis SPECTRUM.md.

# text
# c1: [sweep]
seg-fb8d8636c554 = <c1/>: parameetrivõrk mis tahes liigi üle

# text
# c1: sweep-nd
# c2: runs > 1
# c3: k
# c4: k
# c5: scenarios/campaign-sweep-jammer-power.toml
seg-b14a11d60e9f = Üks kuni kolm punktiga stsenaariumivõtit, igaüks lineaarse või logaritmilise vahemiku üle, samadel telje väärtustel, mida kasutab liik <c1/>. Igal teljel on nimi ja ühik; igal mõõdikul on nimi ja tulemustee ning selle ühik loetakse pühitud liigi enda ühikuplokist, kui kampaania ei deklareeri muud. Kui <c2/>, on iga sõlm algväärtustatud (seeded) Monte Carlo ansambel (realisatsioon <c3/> sõlme algväärtusel pluss <c4/>), mis esitatakse allpool toodud statistikaga. <c5/> pühib vastuvõtjast { "1" } km kaugusel olevat segajat vahemikus -50 kuni +{ "10" } dBW: keskmine segaja ja signaali suhe liigub täpselt { "1" } dB dB kohta ({ "12.2" } kuni { "72.2" } dB) ning kättesaadavus langeb väärtuselt { "1" } väärtusele { "0" } vahemikus -30 kuni -25 dBW.

# text
# c1: system.2.sisre_m
# c2: sisre_m
# c3: [[system]]
# c4: case.0.system.0.shell.0.altitude_km
seg-c1931e311cca = Punktiga võti võib indekseerida tabelimassiivi asukoha järgi: <c1/> on kolmanda <c3/> tabeli <c2/> ja <c4/> ulatub kolm taset sügavale.

# text
# c1: [monte_carlo]
seg-e774c578906d = <c1/>: algväärtustatud ansambel

# text
# c1: k
# c2: base_seed + k
# c3: classical.series[-1].error_ns
seg-bbacb9c66f92 = Realisatsioon <c1/> käivitab stsenaariumi oma algväärtuse võtmega <c2/>, mida kella ansambel juba kasutab, nii et ansambel reprodutseerub täpselt. Iga mõõdik esitab keskmise, üldkogumi standardhälbe, lähima järgu 5., 50. ja 95. protsentiili, kindla algväärtusega protsentiili-bootstrapi { "95" }% usaldusvahemiku keskmisele ({ "2000" } taasvalimit) ja vaikimisi iga valimi algväärtuse järjekorras. Tulemusteed võivad massiive indekseerida: <c3/> on viimane valim.

# text
# c1: [compose]
seg-ed182d15151d = <c1/>: mitu stsenaariumi jagatud tingimustel

# text
# c1: scenarios/campaign-shared-jammer-sea-road.toml
seg-26fab14de534 = Nimega jagatud väärtused (arv või arvude massiiv, koos ühikuga) kirjutatakse igasse liikmesse võtmetesse, millega need on seotud, nii et liikmed ei saa jagatud tingimuse osas eriarvamusel olla. Iga liige käivitub ja iga mõõdiku kohta annab kombineeritud kokkuvõte liikmete väikseima, suurima ja keskmise väärtuse, nimetades parima ja halvima. <c1/> paneb ühe { "8" } dBW segaja Soome lahe laeva (umbes { "30" } km kaugusel) ja Helsingi rannatee auto (umbes { "50" } km) vahele: laev kaotab iga satelliidi (keskmine segaja ja signaali suhe { "39.0" } dB), samal ajal kui auto säilitab vähemalt neli ({ "34.6" } dB).

# text
# c1: [optimize]
seg-c888630c92d7 = <c1/>: ühe mõõdiku parim väärtus

# text
# c1: [lo, hi]
# c2: lin
# c3: log
# c4: goal = "minimize"
# c5: "maximize"
# c6: "target"
# c7: target
seg-b54f0deedd0f = Üks kuni kolm punktiga stsenaariumivõtit, igaüks piiratud vahemikuga <c1/> skaalal <c2/> või <c3/>, otsitakse ühe mõõdiku parima väärtuse leidmiseks (<c4/>, <c5/> või <c6/>, mis minimeerib kaugust väärtusest <c7/>).

# text
seg-b57ec5e5168a = Meetodeid on kaks:

# text
# c1: method = "grid"
# c2: steps
seg-8fba07ce0cde = <c1/> käivitab iga võrgusõlme <c2/>-võtme-kohasel võrgul, pühkimise telje väärtustel.

# text
# c1: method = "nelder-mead"
# c2: max_evals
# c3: step
# c4: ftol
# c5: xtol
seg-844a7c1e3578 = <c1/> (vaikimisi) käivitab deterministliku Nelder–Meadi simpleksi koordinaatides, mis on võtme kohta normaliseeritud vahemikku [{ "0" }, { "1" }]. Proovipunktid projitseeritakse kasti. Jaotis võtab <c2/>, algse <c3/> ja peatumistolerantsid <c4/> ning <c5/>.

# text
# c1: runs > 1
# c2: best_coords
# c3: best_metric
# c4: best_score
# c5: evals
# c6: stop_reason
# c7: trace
seg-2b1159b467f8 = Käivitus, mille mõõdik puudub või ei ole lõplik, saab halvima skoori ja see säilitatakse jälgimises. Kui <c1/>, on mõõdik keskmine samade algväärtuste üle igal hindamisel. Tulemus annab <c2/>, <c3/>, <c4/>, <c5/>, <c6/> ja iga hindamise failis <c7/>.

# text
# c1: scenarios/campaign-optimize-link-budget.toml
seg-778a40736e7b = <c1/> otsib kaugust ja andmekiirust { "3" } dB lingivaru jaoks. Optimum on lokaalne kasti ja alguspunkti suhtes. See on MODELLED, mitte kunagi globaalne väide.

# text
# c1: docs/design/evidence/cap32-optimize/
# c2: tests/campaign_optimize_reference.rs
seg-b94ab5e6dad4 = Protokoll ja selle eelregistreeritud läved on failis <c1/>. Test on <c2/>. Tulemused:

# text
seg-232c68472fa4 = 1-D sihtlahendus langeb kokku kinnise kujuga { "6e-15" } täpsusega;

# text
seg-22f7abf70fc4 = võrgumeetod langeb bitthaaval kokku sõltumatu toore jõu tsükliga;

# text
seg-faea43f01e37 = simpleks toimib vähemalt sama hästi kui { "41" } × { "41" } võrk, umbes kümnendiku sellest käivitustest.

# text
seg-df1533fe6b95 = Vooru { "1" } 1-D lävi on registreeritud kui NOT MET: eelregistreeritud kast jättis lahenduse välja.

# text
# c1: scenario_hash
# c2: reproducibility
# c3: run_digest
# c4: scenario_hash
seg-0862a4e9aa61 = Iga kampaania tulemus kannab <c1/>, mis on kampaaniadokumendi kanoonilise JavaScript Object Notation (JSON) kuju SHA-256 (Secure Hash Algorithm { "2" }, 256-bitine räsi) (võtmete järjekord ja vormindus seda ei muuda), ning bloki <c2/> liikmekäivituste arvuga ja <c3/>, mis on SHA-256 kõigi liikmetulemuste räsidest suunamise järjekorras. Kaks sama räsiga käivitust andsid baidi baidi haaval identsed liikmetulemused. Iga faasikäivitus salvestab ka oma liigi, oma <c4/>, kui liigil see on, ja oma tulemusdokumendi SHA-256. Igal dokumendi arvul on ühikukirje.

# text
seg-2eeddb87e889 = Tuum on järjestikune ega loe ühtegi faili, nii et kampaania käivitub muutmata kujul WebAssembly versioonis. Kampaaniad ei või sisaldada kampaaniaid.

# text
seg-f9b8b78dd64a = Eksport

# text
# c1: --export
# c2: <phase>
# c3: <phase>-<k>
# c4: sweep
# c5: monte-carlo
seg-c4443bf160f7 = <c1/> kampaaniale kirjutab iga geomeetriaga liikmestsenaariumi oma failikomplektina, liikme silt lisatud vormingu laiendi ette: iga faasikäivitus (<c2/> või <c3/>, kui faasil on mitu käivitust), pühkimise baasstsenaarium (<c4/>), Monte Carlo stsenaarium (<c5/>) ja iga koostatud liige (oma sildiga, koos selle seotud jagatud väärtustega). Varasemaga identne liige kirjutatakse ühe korra; üleandmised ning käitusajal rakendatud pühkimise või algväärtuse väärtused ei ole eksporditud stsenaariumides.

# text
seg-0ba270495309 = Vormingu, mida ükski liige kirjeldada ei saa, lükatakse tagasi koos selle põhjendusega. Stsenaariumi kaupa tabel on failis <a1>INTEROP.md</a1>.

# text
seg-c20904c9d3b5 = LEO-PNT kampaaniad

# text
seg-a598e2c06f51 = Viisteist komplekteeritud kampaaniat raamivad madala Maa orbiidi (LEO) positsioneerimise, navigatsiooni ja aja (PNT) küsimusi; <a1>LEO-PNT.md</a1> kirjeldab, mida kumbki näitab. Mida kumbki käivitab, nagu käsurida seda kokku võtab:

# text
seg-f65b1f2b4182 = Režiim

# text
seg-e7d7defa7e71 = Küsimus

# text
seg-08ab59acfe62 = koosta, { "4" } liiget

# text
seg-a21e4db0fda9 = navigatsioonisõnumi teenuseandmed võrreldes kaadri pikkusega

# text
# c1: leo-pvt
seg-6c29f4690d2c = pühkimine <c1/>, { "7" } sõlme

# text
seg-97fba77aa2ec = ühendatud MEO ja LEO positsioneerimine võrreldes LEO signaali kosmoses vahemaa veaga (SISRE)

# text
seg-7b9fbe34d38c = koosta, { "2" } liiget

# text
seg-28352bd0c9e3 = siseruumide LEO-PNT riba ja hoonete klassi kaupa

# text
# c1: leo-pass
seg-a447c56022ec = pühkimine <c1/>, { "9" } sõlme

# text
seg-5b3cbfced221 = asjade interneti (IoT) energia fiksi kohta võrreldes LEO UHF saatevõimsusega

# text
# c1: ntn-positioning
seg-3ebd95e5933a = pühkimine <c1/>, { "9" } sõlme

# text
seg-cfbac004ff64 = mittemaapealse võrgu (NTN) positsioneerimine võrreldes tugisignaali ribalaiusega

# text
# c1: leo-ppp
seg-07e8765975d1 = pühkimine <c1/>, { "3" } sõlme

# text
seg-db872d35033e = täppispunktpositsioneerimise (PPP) koondumine võrreldes 192-satelliidilise LEO kihi kõrgusega

# text
seg-a4ec677dc4e6 = ahel, { "3" } faasi { "2100" } s jooksul

# text
seg-2d91ecf8455d = ülemaailmne satelliitnavigatsioonisüsteem (GNSS) segatud, LEO kiht kannab kasutajat, terviklikkus säilib

# text
# c1: spectrum
seg-c44991a2a24e = pühkimine <c1/>, { "13" } sõlme

# text
seg-4b6e292d88f5 = LEO riba mitmekesisus L-riba ülekoormava segaja vastu

# text
seg-30d86b528bee = spuufimise monitorid nelja spuuferi vastu

# text
seg-1690baf3a1b8 = ahel, { "1" } faas { "86 400" } s jooksul

# text
seg-4d5b507c04de = 5G tugijaama ajastus: holdover ja LEO aeg

# text
seg-d32a80c40470 = ahel, { "3" } faasi { "1440" } s jooksul

# text
seg-c38f9d3bd54e = konteinerite jälgimine LEO UHF-iga: energia fiksi kohta reisi vältel

# text
seg-9bf38e403696 = ahel, { "2" } faasi { "1500" } s jooksul

# text
seg-dea7117552f4 = autonoomne sõiduk linnakanjonis LEO kihiga

# text
seg-dbbd9ffcbfb4 = ahel, { "2" } faasi { "1800" } s jooksul

# text
# c1: city-street
seg-37c0c3570023 = sama linnakanjon lameda { "35" } kraadise lõikenurgana ja <c1/> silueti kujul

# text
seg-ccaa34122145 = ahel, { "2" } faasi { "87 000" } s jooksul

# text
seg-d16d8b2e9089 = kriitilise taristu ajastus: holdover LEO ajaga

# text
seg-4ee0b3036f4a = ahel, { "3" } faasi { "10 800" } s jooksul

# text
seg-157c5bec7f5f = polaar- ja Arktika kasutajad polaarse LEO kihiga

# text
seg-64404160d0e7 = ahel, { "3" } faasi { "2520" } s jooksul

# text
seg-a35e1603ba32 = raudtee- ja merekasutajad LEO kihiga

# text
seg-3d819fa3fd1c = MEO on keskmine Maa orbiit, UHF ülikõrgsagedus ja 5G mobiilsidevõrkude viies põlvkond.

# text
seg-490920844143 = Mida kontrollitakse

# text
# c1: tests/campaign_composition_reference.rs
seg-483b1d4efb20 = <c1/> kinnistab koostamisidentsused:

# text
# c1: clock
# c2: integrity
# c3: jamming
# c4: run_toml
seg-881d97a3fa2b = <b>Ühefaasiline kampaania reprodutseerib iseseisva käivituse bitthaaval.</b> Liikmete <c1/>, <c2/> ja <c3/> puhul on liikme tulemusdokument baidi baidi haaval identne dokumendiga <c4/> stsenaariumifailil, selle räsi on kampaania esitatud räsi ning kui võrk on käivituse enda sammuga, võrdub iga joondatud väärtus iseseisva rea väärtusega (segamise C/N0 võrdub iseseisvast dokumendist sõltumatult arvutatud keskmisega).

# text
seg-1a9e1ed5b18c = <b>Ühesõlmeline pühkimine ja ühe liikmega koostis</b> loevad täpselt iseseisva arvu.

# text
# c1: k
# c2: seed + k
seg-883bb72e1239 = <b>Kindla algväärtusega ansambel on baidi tasemel stabiilne</b> ja realisatsioon <c1/> on täpselt iseseisev käivitus algväärtusel <c2/>; kampaania räsi ignoreerib võtmete järjekorda.

# text
seg-170bc86059fa = Analüütiline juhtum.

# text
# c1: scenarios/campaign-monte-carlo-clock-holdover.toml
seg-0fd27291d6f4 = <c1/> käivitab { "200" } algväärtust kiibiskaalas aatomkellast, millel on ainult valge sagedusmüra (q_wf = { "9e-20" } s^2/s, Microchip SA.45s sigma_y({ "1" } s) = { "3e-10" }), sünkroniseeritud hetkeni { "590" } s ja inertsist liikuvast kuni hetkeni { "3600" } s. Lõplik ajaviga on Gaussi jaotusega keskmisega { "0" } ja standardhälbega sqrt(q_wf * { "3010" } s) = { "16.459" } ns (faasi juhuslik käimine valge sagedusmüra korral, National Institute of Standards and Technology (NIST) Technical Note { "1337" }). Esitatud vahemik [-2.52, { "1.59" }] ns sisaldab tõelist keskmist { "0" }; valimi standardhälve { "14.93" } ns annab hii-ruut statistiku { "164.5" } { "199" } vabadusastmel, kahepoolse { "99" }% vahemiku [{ "151.37" }, { "254.14" }] sees. { "3000" } algväärtuse juures annab sama stsenaarium { "16.31" } ns.

# text
seg-61b54a16243f = <b>Spektrijuhitud ahel</b> loeb iseseisvaid arve: algusfaas kestab täpselt spektri käivituse esimese kadumise aja ja iga L1 C/A ning E1 väärtus ajajoonel võrdub { "1e-9" } dB täpsusega iseseisva juga-näite rea väärtusega sama segaja oleku jaoks (nominaalne, ainult chirp, ainult CW-toon).

# text
seg-5ebc02a24ce1 = <b>Ahel</b> annab olekut edasi nii, nagu on dokumenteeritud: spuufimisfaas kestab täpselt spuufimise käivituse tuvastamise aja, holdover kannab täpselt spuufimise käivituse nihet tuvastamise hetkel, taastumine ei kanna midagi ning häire on üleval kõikjal, kus kaitsetase puudub või ületab häirepiiri.

# text
seg-153e28bcb38a = Need kontrollivad, et koostamine ei muuda midagi, mida ei tohiks. Need ei kontrolli aheldatud missiooni mõõdetud missiooni vastu, mistõttu on kolm kampaaniarida failis <a1>VERIFICATION-MATRIX.md</a1> MODELLED.

# text
seg-e82860f2d902 = <s1>Eelmine</s1>Päris TLE-de kasutamine

# text
seg-e40757a0b4cb = <s1>Järgmine</s1>Käivitusaruanded

# text
seg-e65edbaca6bf = [[phases]]: aheldatud missioon ühel ajajoonel

# text
seg-a433ddf74e55 = [sweep]: parameetrivõrk mis tahes liigi üle

# text
seg-7ca90ac531bf = [monte_carlo]: algväärtustatud ansambel

# text
seg-03d764a4cb56 = [compose]: mitu stsenaariumi jagatud tingimustel

# text
seg-61a0db2550ba = [optimize]: ühe mõõdiku parim väärtus
