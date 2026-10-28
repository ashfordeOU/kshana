# docs--animation: translations (et)

# text
# c1: docs/ANIMATION.md
seg-8428c41646b0 = Allikas: <c1/>

# text
# c1: --animate
seg-a61d094894fd = <c1/> muudab käivituse aegrea millekski liikuvaks: animeeritud Scalable Vector Graphics (SVG) fail, üks iseseisev HyperText Markup Language (HTML) esitaja või nummerdatud SVG kaadrite jada videokodeerijale. Kampaania esitatakse oma faasidena (segamine, spuufimine, holdover, terviklikkuse alarm) koos märgitud alarmidega; spektrikäivitus esitab oma juga-diagrammi rida realt; madala Maa orbiidi (LEO) ülelend esitab oma ribapõhise lingi ja, spuuferiga, monitori statistikud epohhi kaupa.

# text
# c1: src/animation.rs
# c2: tests/animation.rs
seg-39d69331035d = Kood: <c1/>. Testid: <c2/>.

# text
seg-0b708f65d8d3 = Mis see on ja mis see ei ole

# text
seg-ad8c12a3b510 = Eksportija loeb tulemusdokumenti, mille käivitus juba kirjutas. See ei käivita füüsikat uuesti, ei diskreetimist muuda, ei silu ega interpoleeri näidiste vahel (välja arvatud üks sirgjooneline lõik, mis lõpetab joone kursori juures) ning ei lisa ühtegi oma arvu. Animatsioon on seega täpselt sama hea kui selle taga olev käivitus. Selle tase on <b>MODELLED, sisemine kooskõla</b>: see on renderdus, mitte kunagi tõend, ja sellel pole oma kontrollimaatriksi rida.

# text
seg-f37311ad7ef0 = Väljundid

# text
# c1: result.json
# c2: chart.svg
# c3: report.html
seg-0c21f772932e = Iga vorming kirjutatakse stsenaariumi kõrvale, tavaliste <c1/>, <c2/> ja <c3/> kõrvale:

# text
seg-f2ce7fc60cdf = Vorming

# text
seg-51a8df15f356 = Kirjutatakse kui

# text
seg-3ea93ae372ca = Mida see sisaldab

# text
seg-3603593b9799 = Üks SVG, mida animeeritakse Cascading Style Sheets (CSS) võtmekaadritega ja ilma skriptita: jooned joonistuvad liikuva ajakursori taha, sündmused ilmuvad oma hetkel, juga-diagrammi read paljastuvad ajajärjekorras. See kordub, valmis pildi { "1.5" } s hoidmisega.

# text
seg-6c91078b434e = Üks fail sisseehitatud skripti ja stiiliga ning ilma välise varata: esitus ja paus, liugur, kiirus (0.25x kuni 4x), iga paneel ühel sünkroniseeritud kursoril, iga joone reaalajas väärtus, faasiriba ja sündmuste loend, mis klõpsamisel otsib. Tühik esitab või peatab, nooleklahvid sammuvad, Home ja End hüppavad.

# text
# c1: frame_0000.svg
# c2: frame_0001.svg
# c3: manifest.json
seg-df02d37cd729 = <c1/>, <c2/>, … ja <c3/>.

# text
# c1: --animate
# c2: --animate svg,html
# c3: all
# c4: --animate-fps
# c5: --animate-duration
seg-2e5ebd60cad0 = <c1/> on korratav ja võtab komaga eraldatud loendi (<c2/>) või <c3/>. <c4/> ({ "1" } kuni { "60" }, vaikimisi { "12" }) ja <c5/> ({ "0.5" } s kuni { "600" } s, vaikimisi { "8" } s) määravad esituse; kaadrijada on piiratud { "7,200" } kaadriga.

# text
# c1: --export
# c2: report.html
# c3: --animate
seg-7e012ab53f45 = Kui <c1/> töötab samas käsus, loetleb HTML-esitaja selle kõrvale kirjutatud ekspordifailid (CZML, KML, GeoJSON, STK, SigMF) suhteliste linkidena nendele naaberfailidele; link kirjutatakse ainult paljale failinimele, nii et ükski ei saa kaustast lahkuda ega võrku jõuda. Täpsem aruanne (<c2/>) manustab animeeritud joonise alati, kui tulemusel on aegrida, olenemata sellest, kas <c3/> töötas.

# text
# c1: --animate
# c2: result.json
# c3: animation
# c4: sources
# c5: omitted
# c6: --animate
seg-9c1d2204edab = Kui <c1/> töötab, saab <c2/> ploki <c3/>: vormingud, kaadrid sekundis (fps), kestus, kaadrite arv, ajavahemik, paneelide pealkirjad, JSON-rajad, millest iga joon loeti (<c4/>), ja mis tahes leitud, kuid joonistamata seeria (<c5/>). Ilma <c6/> on tulemus bait-baidilt identne tavalise käivitusega.

# text
seg-fa8388ae976e = Kaadrijada

# text
# c1: round(duration × fps)
# c2: t_start + (t_end − t_start) × i / (n − 1)
# c3: manifest.json
# c4: fps
# c5: duration_s
# c6: frame_count
# c7: frame_pattern
# c8: frame_%04d.svg
# c9: t_start
# c10: t_end
# c11: frame_times
# c12: frame_NNNN.svg
seg-db4b53abe7d6 = Jadas on täpselt <c1/> kaadrit. Kaader <em>i</em> näitab ajajoont kuni <c2/>, nii et esimene kaader on algus ja viimane on valmis pilt. <c3/> registreerib <c4/>, <c5/>, <c6/>, <c7/> (<c8/>), pikslisuuruse, <c9/>, <c10/>, iga kaadri missiooniaja (<c11/>), faasid, sündmused ja allikad. Uuesti eksport samasse kataloogi eemaldab esmalt iga seal juba oleva <c12/> (ja midagi muud), nii et lühem jada ei jäta pikema jada kaadreid kodeerijale loetavaks.

# text
# c1: ffmpeg
# c2: librsvg
# c3: fps
seg-13b57b6d3c14 = Kaadrid on SVG, mitte Portable Network Graphics (PNG). <c2/> teegiga ehitatud <c1/> loeb neid otse, kiirusel, millega jada kirjutati ({ "24" } ülaltoodud näites; manifesti <c3/>):

# text
# c1: ffmpeg
# c2: librsvg
# c3: rsvg-convert
seg-b20beeb45fac = <c1/> ilma <c2/> peatub teatega „no decoder found for: svg“. Rasteriseeri kaadrid esmalt, näiteks käsuga <c3/>, ja kodeeri PNG-d:

# text
seg-fc61f546f605 = Ligipääsetavus ja teema

# text
# c1: prefers-color-scheme
seg-7015f7ed77dc = <b>Värviskeem.</b> Esitaja järgib <c1/> ja joonistab uuesti, kui see muutub; animeeritud SVG kannab oma paleti heledat varianti sama meediapäringu all. Kaadrid kasutavad staatiliste graafikute tumedat paletti, sest videol pole skeemi.

# text
# c1: prefers-reduced-motion: reduce
seg-c3b1f19f191b = <b>Vähendatud liikumine.</b> Tingimusel <c1/> lülitab animeeritud SVG iga animatsiooni välja ja näitab valmis pilti (selle baasstiilid on lõppolek, nii et midagi ei ole peidetud), ja esitaja avaneb peatatuna valmis pildil, mitte ei esita; kasutaja saab ikka lugeda või vajutada Play.

# text
# c1: <title>
# c2: <desc>
seg-f8dd26194eec = SVG-l on <c1/> ja <c2/>; esitaja juhtelemendid on sildistatud nupud, vahemikusisend kõneldava ajaväärtusega ja valik.

# text
seg-f5356cbf3675 = Mis loetakse aegreaks

# text
seg-ba43cf36ac20 = Tulemusdokumendid erinevad liigiti, seega tunneb eksportija ära kujud, mida mootor väljastab, mitte liikide loendi:

# text
# c1: t
# c2: t_s
# c3: t_hours
# c4: t_min
# c5: t_days
# c6: k
# c7: epochs
# c8: quantum.series[].error_ns
# c9: classical.series[].error_ns
seg-952d09156712 = <b>Kirjete massiiv ajaväljaga</b> (<c1/>, <c2/>, <c3/>, <c4/>, <c5/> või <c6/> massiivil <c7/>), mis kasvab massiivi mööda rangelt. Iga muu arvuline väli muutub jooneks; sama väli kahe juure all (<c8/> ja <c9/>) jagab paneeli.

# text
# c1: t_s
# c2: t
# c3: times_s
# c4: channels
# c5: {unit, values}
# c6: campaign
# c7: spectrum
# c8: *_hz
# c9: spectrum
seg-2c3abce3f70a = <b>Objekt rangelt kasvava ajamassiiviga</b> (<c1/>, <c2/>, <c3/>, …) sama pikkusega massiivide kõrval: naabruses olevad arvmassiivid, <c4/> kaart <c5/> kirjetest (<c6/> ajajoon), kirjete massiiv, mis hoiab selliseid massiive (<c7/> ribad, konstellatsiooni satelliidirajad), ning kahemõõtmeline massiiv, mille read vastavad ajatelje naabruses oleva <c8/> sageduse teljega (<c9/> juga-diagramm).

# text
# c1: phases
# c2: name
# c3: t0_s
# c4: t1_s
# c5: events
# c6: t_s
# c7: label
# c8: alarm
# c9: *_t_s
seg-0edf8c38f9eb = Selle ajamassiivi kõrval muutuvad <c1/> (<c2/>, <c3/>, <c4/>) faasiribaks ja <c5/> (<c6/>, <c7/>, <c8/>) markeriteks. Riba <c9/> skalaarid (selle esimene lukust väljumine, selle madalaim kandja ja müra tiheduse suhe) märgitakse samuti.

# text
# c1: omitted
seg-608c4fed9e98 = Ühikuga jooned jagavad paneeli, kui nende suurusjärgud on teguri { "100" } piires, nii et { "50" } ns kaitse ei lamedda { "2" } ns viga. Joonistatakse kuni { "6" } paneeli { "6" } joonega; ülejäänud on loetletud väljas <c1/>. Jooned üle { "2,400" } näidise hõrendatakse ühtlase sammuga, mis säilitab viimase näidise, ja juga-diagramm üle { "96" } × { "120" } lahtri keskmistatakse (võimsuses, detsibellilahtrite puhul, et kitsas segaja ei lahjeneks).

# text
# c1: leo-pass
# c2: leo-pnt-chain
# c3: leo-ppp
# c4: leo-pvt
# c5: trace = true
# c6: leo-navmsg
# c7: leo-signal
# c8: ntn-positioning
seg-c386389e4f1d = LEO liikide seas animeerub iga kaasasolev <c1/>, <c2/> ja <c3/> stsenaarium. <c4/> animeerub oma Doppleri, ühispositsioneerimise ja ajastuse režiimides (ajastuskäivitus vajab <c5/>, mis paneb iga rea teatama oma ajaviga ja ennustatud sigma igal epohhil) ning lükatakse tagasi oma polaarkatvuse režiimis. <c6/> animeerub oma keskülelennu uuenduse ning lükatakse tagasi kodeerimise, sobitusvahemiku ja mudelivõrdluse analüüside puhul. <c7/> ja <c8/> tulemused ei kanna ajatelge ja lükatakse tagasi.

# text
seg-eb31ec7a07b7 = Determinism

# text
seg-82bcf8a5b042 = Väljund on tulemusdokumendi ja valikute puhas funktsioon: ei kella, ei juhuarvu, ei räsitabeli itereerimist, ei faili- ega võrgupöördust teegis ja ühtegi ajatemplit kusagil, nii et sama stsenaarium, algväärtus (seed) ja valikud annavad bait-baidilt identsed failid. Moodul ehitub WebAssemblyks muutmata; faile kirjutab ainult käsurealiides.

# text
seg-77e1f459f3d3 = Teegi kasutamine

# text
# c1: kshana::animation::animate_result
# c2: extract_timeline
seg-b3fa41e48ea5 = <c1/> animeerib tulemusdokumendi, mis teil juba on, ja <c2/> tagastab selle, mis joonistataks, seda renderdamata.

# text
seg-0857a94a948e = Piirangud

# text
# c1: animate_scenario
seg-02f0f03af2fb = Pythoni wheel ja WebAssembly moodul ei eksponeeri eksportijat veel; see on kättesaadav käsurealt, Rusti teegist ja Model Context Protocol (MCP) serveri tööriistast <c1/> (mis tagastab ühes vastuses kuni { "120" } kaadrit).

# text
seg-cd3ec7b403ba = Teljed on lineaarsed. Seeria, mis hõlmab palju dekaade (kella vea kasv { "0.1" } ns-st mikrosekundini), paistab lamedana kuni käivituse lõpuni.

# text
seg-ed21d370a73c = Animeeritud SVG tugineb lõikeristküliku CSS-animatsioonile; praegused Chromiumi, Firefoxi ja Safari mootorid esitavad seda, samas kui CSS-animatsioonita vaatur näitab valmis pilti.

# text
seg-9dfb9596ecf3 = Pühkimise, Monte Carlo ja koostamise kampaaniad ei kanna ajatelge ja lükatakse tagasi; pühkimise või ansambli kokkuvõtlikud statistikud ei ole aegrida. Aheldatud kampaania animeerub.

# text
seg-be1f1afe7424 = <s1>Eelmine</s1>Käivituse aruanded

# text
seg-6817433f69f6 = <s1>Järgmine</s1>Koostalitluse ekspordid ja impordid

seg-51cd8d5f527b = Liik, mille tulemus ei kanna ühtegi neist kujudest (link budget, ühe epohhi geomeetria, ainult statistikat andev Monte Carlo kokkuvõte või telekomi holdover, mille tulemus avaldab kirje räsi, aga mitte kirjet), lükatakse tagasi teatega <c1/> ja midagi ei kirjutata. Kshana { $version } puhul animeeritakse { "94" } { "193" }-st käivitatavast stsenaariumifailist (kõik failid peale uuringukomplekti) ja { "99" } lükatakse tagasi. <c2/> trükib loenduse.
