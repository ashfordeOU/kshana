# docs--studio: translations (et)

# text
seg-c3c260b7063e = Testid

# text
# c1: web/README.md
seg-ca497f6e51d4 = Allikas: <c1/>

# text
seg-256705861db0 = Sait kshana.dev

# text
# c1: web/
# c2: index.html
# c3: missions.html
# c4: capabilities.html
# c5: evidence.html
# c6: developers.html
# c7: editions.html
# c8: docs/
# c9: studio/
# c10: studio/index.html
# c11: studio/advanced/index.html
# c12: <base href="../">
seg-82b7ed4e70af = <c1/> on puu, mida GitHub Pages serveerib aadressil <a1>https://kshana.dev</a1>: lehed (<c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>), dokumentatsioon kataloogi <c8/> all ja Kshana Studio kataloogi <c9/> all (serveeritud aadressil <a2>https://kshana.dev/studio/</a2>), rakendus, mis käitab mootorit brauseris WebAssemblyna (WASM) ilma serveripoolse arvutuseta ja midagi üles laadimata. Studios on ühe mootori kaks vaadet: lihtne vaade (<c10/>, vastus esmalt tavasõnadega) ja täpsem vaade (<c11/>, täielik armatuurlaud), mis jagab lihtsa vaate mootorit, töölist, mooduleid ja andmeid väljade <c12/> kaudu.

# text
# c1: <base href="../">
seg-2b76ce9ee32c = Alates { "0.35.0" } on Studios neli lisavaadet, igaüks oma lehena väljaga <c1/>, ilma otsinguindekseerimiseta, ja sünteetiliste näidiste kaustaga, mida selle test loeb:

# text
# c1: studio/trust/
# c2: trust/demo/
seg-e3d0762bb726 = <c1/>: mereline usaldusvaade, laeva asukohavoo vastuvõtja usaldusskoor, demotrajektooriga failis <c2/>.

# text
# c1: studio/training/
# c2: training/demo/
seg-e608cdeac977 = <c1/>: meeskonna koolituse debrief, mis taasesitab sünteetilist NMEA-d segamise, drag-off, ajaspuufimise või taasesituse sündmusega (<c2/>).

# text
# c1: studio/interference/
# c2: interference/demo/
seg-f2ce6a93a58d = <c1/>: häirekaart ja marsruudi eksponeeritus (<c2/>).

# text
# c1: studio/tools/
# c2: tools/examples/
# c3: tools/samples/
# c4: #evidence
# c5: #bench
# c6: #compliance
# c7: #osnma
# c8: #ai
seg-3f6cf51eb439 = <c1/>: üks leht tööriistakaartidest koos näidetega (<c2/>, <c3/>), sealhulgas allkirjastatud tõendipaketid (<c4/>), test-bench eksport (<c5/>), compliance kaardistus (<c6/>), Galileo OSNMA kontroll (<c7/>) ja tehisintellekti assistendi kanalid (<c8/>).

# text
seg-fb02aba9149f = Kust failid pärinevad

# text
seg-a58fb92bab82 = Siin elab kolme liiki faile ja neid muudetakse kolmel erineval viisil.

# text
# c1: docs/
# c2: css/
# c3: js/
# c4: assets/
# c5: data/
# c6: land.json
# c7: search.json
# c8: series.json
# c9: studio/
# c10: web/tools/port_site.py
# c11: PORT-MANIFEST.json
# c12: site.test.mjs
seg-d404d216114c = <b>Porditud failid.</b> Lehed, <c1/>, <c2/>, <c3/>, <c4/>, saidi andmed kataloogis <c5/> (<c6/>, <c7/>, <c8/>) ja kõik kataloogi <c9/> all kirjutab <c10/> saidi ehitusest ja Studio lähtekoodist. <c11/> loetleb igaühe koos selle SHA-256 (Secure Hash Algorithm, 256-bitine) kontrollsummaga. <b>Neid ei tohi siin muuta</b>: <c12/> kukub käsitsi muudatuse peale läbi. Muuta tuleb lähtekoodi ja port käivitada uuesti:

# text
# c1: --check
# c2: web/
# c3: robots.txt
# c4: sitemap.xml
# c5: llms.txt
# c6: llms-full.txt
# c7: legacy-redirects.js
# c8: 404.html
# c9: playground/index.html
# c10: /studio/
seg-b681e66130e5 = Port on deterministlik: teine käivitus ei kirjuta midagi ja <c1/> väljub väärtusega { "1" }, kui <c2/> ei ole see, mida port kirjutaks. See kannab saidi ehituse indekseerimisfailid muutmata üle (iga lehe kanooniline, sotsiaalkaardi ja schema.org sildid, <c3/>, <c4/>, <c5/>, <c6/>), kontrollib neid, kirjutab <c7/>, <c8/> ja suunamislehe Studio vanal aadressil (<c9/>, aadressile <c10/>) ning suunab iga lehe kohalikele fontidele ja skriptiteekidele (allpool).

# text
# c1: web/
seg-9be72ec8d40e = <b>Failid, mida <c1/> omab.</b> Need on omaette allikad ja port ei puuduta neid kunagi:

# text
# c1: capabilities.json
seg-23b6ea71fede = <c1/> on võimekuskaartide ja standardiruudustiku struktureeritud allikas. <b>Muuta tuleb seda, mitte HTML-i.</b>

# text
# c1: data/verification-matrix.json
# c2: cargo run --bin gen_validation_artifacts
# c3: tests/verification_artifacts_doc_sync.rs
# c4: data/card-matrix-map.json
# c5: data/oracle-references.json
# c6: data/standards-matrix-map.json
# c7: studio/data/
seg-e1ee8cd0af21 = <c1/> on genereeritud (<c2/>) ja kinnitatud failiga <c3/>; seda ei tohi käsitsi muuta. <c4/>, <c5/> ja <c6/> on käsitsi hooldatud vasted, mida sama test kontrollib genereeritud maatriksi vastu. Studio koopiad kataloogi <c7/> all on need failid bait baidi haaval.

# text
# c1: og-card.svg
# c2: og-card.png
# c3: og-card.rendered-from.json
# c4: python3 tools/gen_og_card.py
seg-8901229c76ba = <c1/>, <c2/> ja <c3/> on sotsiaalkaart (<c4/>).

# text
# c1: fonts/
# c2: vendor/
# c3: tools/fetch_third_party.py
seg-89d78af0258c = <c1/> ja <c2/>: fondifailid ja skriptiteek, mida lehed kasutavad, korra alla toodud käsuga <c3/> ja sisse kirjutatud (vt „Kolmandate osapoolte päringuid pole“).

# text
# c1: build.sh
# c2: smoke.mjs
# c3: site.test.mjs
# c4: legacy-urls.test.mjs
# c5: tools/
seg-317c42219bd7 = <c1/>, <c2/>, <c3/>, <c4/> ja <c5/>.

# text
# c1: build.sh
# c2: pkg/
# c3: wasm-pack
# c4: studio/pkg/
# c5: scenarios/
seg-5071806d230f = <b>Ehitusväljundid</b>, git-ignoreeritud ja toodetud käsuga <c1/>: <c2/> (pakett <c3/>, millest ehitatakse ka npm pakett), <c4/> (sama pakett seal, kus Studio selle impordib) ja <c5/> (iga etalonstsenaarium aadressil, kust varasem ühelehene sait neid serveeris).

# text
seg-5042f55f78b5 = Ehitamine ja kohalik serveerimine

# text
# c1: KSHANA_WASM_PKG=<a built pkg folder> ./web/build.sh
seg-f393a52f7794 = Ilma WASM tööriistaketita valmistab <c1/> kompileerimise asemel ette olemasoleva paketi. Pages töövoog ei kasuta seda kunagi.

# text
# c1: studio/lib/
# c2: *.test.mjs
# c3: studio/app.js
# c4: studio/advanced.js
# c5: web/
seg-35094cb7ed04 = Iga moodul kataloogis <c1/> on puhas loogika vastava <c2/>-ga; Studio DOM (Document Object Model, lehe elemendipuu) juhid on <c3/> (lihtne vaade) ja <c4/> (täpsem vaade). Pidev integreerimine käivitab neist igaühe eraldi sammuna ja kukub läbi, kui kataloogi <c5/> testifailil pole sammu.

# text
seg-ba24be498f87 = Kolmandate osapoolte päringuid pole

# text
seg-7215806f98d4 = kshana.dev serveerib oma fonte, stiile ja skripte ise. Leht ei tee päringut fondihosti ega skriptihosti poole, nii et külastaja aadressi ei anta kellelegi edasi.

# text
# c1: fonts/
# c2: @font-face
# c3: vendor/
# c4: fonts/FONTS.json
# c5: vendor/VENDOR.json
# c6: fonts/OFL-*.txt
# c7: vendor/three@…/LICENSE
seg-30fc8da50592 = Sait ja Studio on kirjutatud Google Fontsi ja skriptihosti vastu. Port asendab iga lehe Google Fontsi lingi vastava stiililehega kataloogis <c1/> (samad <c2/> reeglid ja samad fondifailid, kõik alamhulgad, nii et tekst renderdub nagu enne) ja iga skriptihosti aadressi failiga kataloogi <c3/> all. <c4/> ja <c5/> salvestavad, kust iga fail pärines, ja selle kontrollsumma; fondid on SIL Open Font License (<c6/>) all ja three.js MIT litsentsi (<c7/>) all.

# text
# c1: tools/fetch_third_party.py --from <site folder> --from <Studio folder>
# c2: site.test.mjs
seg-68a02a54db3b = <c1/> on ainus samm, mis kasutab võrku. Seda tuleb uuesti käivitada ainult siis, kui leht küsib fondikomplekti või teegi versiooni, mida siin pole: port keeldub ja ütleb seda. <c2/> kukub läbi, kui mõni porditud leht, stiilileht või skript nimetab fondihosti või laadib midagi teiselt hostilt.

# text
seg-4ff8a4accad4 = Leht { "404" }

# text
# c1: /404.html
seg-763503746a48 = GitHub Pages vastab puuduvale aadressile failiga <c1/> ja olekuga { "404" }. Port teeb selle lehe avalehe enda kestast (navigatsioon, jalus, otsing) lühikese sõnumi ümber, mille lingid viivad avalehele, dokumentatsiooni ja Studiosse. Kõik selle aadressid on kirjutatud saidi juurest, sest seda serveeritakse mis tahes sügavusel.

# text
seg-9126631f595b = Vanad aadressid

# text
# c1: /
# c2: /#playground
# c3: /#ledger
# c4: /#s=…
# c5: /?embed=1&…
# c6: tab=fom
# c7: tools/legacy-urls.json
# c8: legacy-redirects.js
seg-a64ed190233a = Kuni { "v0.28.0" } oli sait üks leht ja kõik asus aadressi <c1/> fragmendi taga (<c2/>, <c3/>, jagamislingid kujul <c4/>, manused kujul <c5/>; manuselingi vana vahekaardi nimi, näiteks <c6/>, avab selle asendanud Studio vahekaardi). <c7/> loetleb iga sellise aadressi, mida avaldatud materjal kasutab, ja kuhu see praegu jõuab; avaleht laadib selle loendi põhjal genereeritud <c8/>, et need sinna saata. Enne mis tahes aadressi kasutuselt kõrvaldamist tuleb loendisse lisada juhtum.

# text
seg-a9db9b0675e2 = Juurutus

# text
# c1: pages
# c2: main
# c3: release.yml
# c4: build.sh
# c5: web/
# c6: tools/
seg-0316a3f12053 = GitHub Actions töövoog <c1/> juurutab väljalaskesildi, mitte <c2/>: <c3/> käivitab selle, kui väljalase on avaldatud, ning käsitsi käivitus juurutab nimetatud sildi uuesti. See käivitab <c4/>, ettevalmistab <c5/> ilma testideta, ehitusskripti, <c6/>, manifesti ja selle failita ning avaldab tulemuse GitHub Pagesis.

# text
seg-6aa2e78078ae = <s1>Eelmine</s1>Sõnastik

# text
seg-419353a4fb30 = <s1>Järgmine</s1>Õpetused

seg-74dc3fad6ee7 = <s1>Eelmine</s1>Keeled
