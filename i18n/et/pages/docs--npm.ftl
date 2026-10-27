# docs--npm: translations (et)

# text
seg-3d770dd786e4 = Kasutus

# text
seg-d4a762001549 = Litsents

# attr:alt
seg-81a87d14efda = Kshana: märk, täpset hetke tähistav kompassi-ristik, sõnamärgi kshana kõrval

# text
# c1: README.npm.md
seg-0ddcab84868f = Allikas: <c1/>

# text
seg-32c82b87acd6 = <b>Kshana · <s1>क्षण</s1> · <em>täpne hetk</em></b><br/> Avatud lähtekoodiga simulaator PNT (positsioneerimine, navigatsioon ja aeg) vastupidavuse jaoks.

# text
seg-3b861b2f08b8 = Väljalase v{ $version }

# text
seg-ebe636986f46 = { "176" } võimekust { "388" }-st valideeritud sõltumatute väliste sõltumatute etalonide (sõltumatute etalonide) vastu

# text
seg-6a1906d8d4ad = Ligikaudu { "95" } % reakatvus, pidevas integratsioonis nõutav { "85" } %

# text
seg-a9f4f2795fb5 = Litsents: AGPL-3.0-only või kommertslitsents

# text
seg-3f6b9ca5e225 = DOI 10.5281/zenodo.20528627

# attr:alt
seg-7fcbe854ebc4 = Harjuta minutit, mil GNSS vaikib: Kshana missioonikonsool, joonistatud mootori tegelikust käitusest, aheldatud segamise, spuufimise, holdover-i ja terviklikkuse kampaania GPS-i, Galileo, BeiDou ja GLONASS-i { "102" } satelliidi üle

# text
seg-d1153c5e9112 = Harjuta minutit, mil GNSS vaikib

# text
seg-d284448743af = Kshana taasesitab segamist, spuufimist ja kella holdover-it (aja hoidmine ilma välise etalonita), kui GNSS-i (ülemaailmse satelliitnavigatsioonisüsteemi) signaalid ebaõnnestuvad, ning ütleb, kui kaua süsteem hoiab aega ja asukohta oma eelarve piires ning milline kell või andur toob kõige rohkem varu. See on WebAssembly pakett: kogu mootor JavaScriptis, brauseris või Node.js-is. Iga käitus on stsenaariumist, algväärtusest (seed) ja mootori versioonist lähtudes reprodutseeritav bitthaaval.

# text
seg-d1a3f78ad8e0 = Esmalt saab proovida, ilma midagi paigaldamata: <a1>Kshana Studio</a1> käitab kogu mootorit brauseris, WebAssemblyks kompileeritult, ja ei lae midagi üles.

# text
seg-2d2c47db0c1f = <b>{ "176" } { "388" }-st</b> võimekust on valideeritud sõltumatute väliste sõltumatute etalonide (sõltumatute etalonide) vastu; { "208" } on ausalt märgistatud modelleeritud, { "4" } on partneri omad. Iga võimekus kannab masinkontrollitud registris (ledger) ühte silti: VALIDATED (sõltumatu väline sõltumatu etalon nõustub: tegelikud andmed, sõltumatu teostus või avaldatud etalonvektorid), MODELLED (sisemiselt kooskõlas ja see on öeldud välja) või PARTNER (selle eest vastutab riistvarapartner). Kontrollide hulgas: kõik { "666" } SGP4 (Simplified General Perturbations { "4" }) vektorit AIAA (American Institute of Aeronautics and Astronautics) 2006-6753 täpsusega { "4.12" } mm ja Cowelli jõumudel täpsusega { "0.08" } m Orekit { "12.2" } suhtes.

# attr:alt
seg-44f7862c45a2 = Kuidas võimekus oma sildi teenib: võimekus, sõltumatu etalon, test, registri (ledger) silt. Kontrollistaatus kõigi { "388" } võimekuse lõikes: { "176" } valideeritud, { "208" } modelleeritud, { "4" } partneri omad

# text
seg-d662055d817f = Pakett on ES (ECMAScript, standardne JavaScript) moodul WebAssembly kasulikule koormusele, ehitatud brauseri jaoks. Lähtesta see üks kord, seejärel kutsu mootorit sünkroonselt. Ainus erinevus brauseri ja Node.js-i vahel on see, kuidas WebAssembly binaarfail laaditakse.

# text
# c1: node_modules/kshana/
# c2: init()
# c3: kshana_bg.wasm
seg-0b750617ea08 = <b>Brauseris</b> (komplekteerija kaudu või lehel, mis serveerib <c1/>) toob <c2/> faili <c3/> mooduli kõrvalt:

# text
# c1: init()
# c2: TypeError: fetch failed
# c3: fetch
# c4: initSync
seg-70fc98eb8d2e = <b>Node.js-is</b> ebaõnnestub <c1/> veaga <c2/> (Node'i <c3/> ei suuda lugeda kohalikku faili), seega loe binaarfail kettalt ja anna see üle funktsioonile <c4/>:

# text
# c1: .mjs
# c2: "type": "module"
# c3: package.json
# c4: import
seg-2c181d5e0942 = Salvesta Node.js-i versioon <c1/> failina (või sea <c2/> oma <c3/> failis), et <c4/> töötaks. Sealt edasi on mõlemad samasugused:

# text
# c1: run_typed(toml)
# c2: RunOutput
# c3: json
# c4: svg
# c5: summary
# c6: csv: string | null
# c7: data: ResultDocument
# c8: scenario_kinds()
# c9: KindMeta[]
# c10: name
# c11: ScenarioKind
# c12: error_kind()
# c13: ErrorKind
# c14: ""
# c15: ResultDocument
# c16: schema_version
# c17: engine_version
# c18: units
# c19: FieldUnit
seg-06eb982ef260 = TypeScript näeb tüübitud tulemusi: <c1/> tagastab väärtuse <c2/> (<c3/>, <c4/>, <c5/>, <c6/>, <c7/>), <c8/> tagastab väärtuse <c9/>, mille <c10/> on kõigi liikide <c11/> ühendtüüp, ja <c12/> tagastab väärtuse <c13/> (või <c14/> edu korral). Iga tulemusdokumendi enda väljad erinevad liigiti; <c15/> tüüpib ühist ümbrist (<c16/>, <c17/> ja <c18/> plokk, mis koosneb <c19/>-idest).

# text
# c1: kind_modules()
# c2: field_importance()
# c3: iq_signals()
# c4: iq_run_short
# c5: iq_run_short(fs_hz, duration_s, signal, ids, dopplers_hz, cn0_dbhz, seed)
seg-31d983ae7036 = Veel neli funktsiooni kirjeldavad mootorit kasutajaliidesele. <c1/> tagastab JSON-objekti liigist moodulitesse, mida selle kontrollimaatriksi read nimetavad, <c2/> sellise, mis seob liigi tulemuse väljadega, mis vastavad selle küsimusele (kuvamise metaandmed; mootor ei loe seda kunagi), <c3/> signaalide nimed, mida <c4/> aktsepteerib, ja <c5/> lühikese sünteetilise IQ-stseeni, mälus hangitud ja jälgitud (kuni { "0.25" } s, { "1,000,000" } valimit ja { "8" } satelliiti), sama vastusega nagu natiivne ehitus.

# text
# c1: run
# c2: summary
# c3: chart_svg
# c4: table_csv
# c5: undefined
# c6: run_all
# c7: {json, svg, summary, csv}
# c8: run_typed
# c9: data
# c10: version
# c11: list_kinds
# c12: scenario_kinds
# c13: error_kind
# c14: scenario_kinds
# c15: encode_permalink
# c16: decode_permalink
# c17: export_sp3
# c18: export_omm
# c19: export_oem
# c20: receiver_trust
# c21: receiver-trust
# c22: {json, csv, svg, summary}
# c23: text
# c24: base64
# c25: [platform] kind = "vessel"
# c26: export_formats
# c27: export_scenario
# c28: czml
# c29: kml
# c30: geojson
# c31: stk
# c32: sigmf
# c33: {format, spec_url, files}
# c34: import_route
# c35: --import-route
# c36: animate_scenario
# c37: list_examples
# c38: get_example
# c39: evidence_attach_timestamp
# c40: osnma_verify
# c41: receiver_trust_replay
# c42: assess_vessel_log
# c43: trust_telemetry
# c44: evidence_verify
# c45: bench_export
# c46: compliance_report
# c47: compliance_mapping
# c48: interference_map
# c49: kshana-interference-map/v1
# c50: route_exposure
# c51: nmea_training
# c52: sky_geometry
# c53: sky_monte_carlo
# c54: skyline_presets
# c55: skyline_profile
# c56: skyplot_svg
# c57: receiver-trust live
# c58: run_full
seg-ceee5ddc0c36 = WebAssembly-liideses on iga sisenemispunkt eraldi kutse: <c1/> (tulemusdokument JSON-sõnena), <c2/>, <c3/>, <c4/> (stsenaariumi CSV (komadega eraldatud väärtuste) tabel sõnena või <c5/> liikidele, mis tabelit ei avalda; see viskab erandi vigase stsenaariumi korral), <c6/> (üks mootori käitus, mis tagastab <c7/> JSON-sõnena — seda tasub kasutada, kui on vaja rohkem kui ühte väljundit, sest iga teine kutse käitab stsenaariumi uuesti), <c8/> (samad väljundid ühe tüübitud objektina, dokument juba parsitud kujul <c9/>), <c10/>, <c11/> / <c12/> / <c13/> (introspektsioon; <c14/> tagastab parsitud loendi), <c15/> / <c16/> — jagatava lingi (URL, uniform resource locator) kodek, mida <a1>Kshana Studio</a1> kasutab kogu stsenaariumi edasi-tagasi teisendamiseks aadressiriba fragmendi kaudu — ning <c17/> / <c18/> / <c19/>, SP3-c (Standard Product { "3" } vormingu redaktsioon c) ja CCSDS (Consultative Committee for Space Data Systems) efemeriidi artefaktid — OMM, Orbit Mean-elements Message, ja OEM, Orbit Ephemeris Message — mida käsurida kirjutab — ning <c20/>, mis hindab tegelikku vastuvõtja logi, mida kirjeldab <c21/> stsenaarium, ja tagastab <c22/> JSON-sõnena (brauseril puudub failisüsteem, seega peavad logi ja iga navigatsioonifail olema stsenaariumis sisse kirjutatud kujul <c23/> või <c24/>; tabel <c25/> lisab mereliikluse monitorid ja 0-100 usaldusskoori, ainult nõuandev), <c26/> / <c27/> (milliseid koostalitlusvorminguid stsenaarium toetab, seda käitamata, ja üks eksport mälus: <c28/>, <c29/>, <c30/>, <c31/> või <c32/> JSON-ina <c33/>, baitidelt identne samale stsenaariumile, midagi ei laeta üles), <c34/> (teekonnapunktide rajaga stsenaariumi kirjutatud GeoJSON-marsruut, käsurea <c35/>), <c36/> (käitamise ajarida animeeritud SVG-na, ühe HTML-mängijana või SVG kaadritena), <c37/> / <c38/> (kaasatud etalonstsenaariumid ja nende TOML), <c39/> (seo RFC { "3161" } tõend tõendipaketiga mälus; pakett peab ikka kontrolli läbima ja ajatempliasutuse allkirja ei kontrollita), <c40/> (millise satelliitide Galileo navigatsiooniandmeid I/NAV lehefail või UBX-voog autentib, usaldatud Merkle'i juure või avalike võtmetega ja valikulise sõltumatu etalonajaga; see autentib andmeid ega esita ühtki spuufimisvastase toimivuse väidet; midagi ei laeta üles), <c41/> (piiratud NMEA väljavõte, mida hinnatakse samal viisil nagu reaalajarežiim; ilma lävendita), <c42/> (laeva NMEA logi partiikäitusena), <c43/> (usaldusvoog või tulemus Prometheuse tekstina, CEF- või LEEF-süsteemilogi ridadena või OTLP kasulikku koormusena; midagi ei saadeta), <c44/> (kontrolli allkirjastatud tõendipaketti; midagi ei laeta üles; pakette tehakse käsurea, Pythoni või MCP-ga), <c45/> (stsenaariumi liikumine ja sündmused tekstina laborisimulaatori jaoks; signaali ei kirjutata), <c46/> ja <c47/> (milliseid avaliku raamistiku nõuderidu tulemusdokumendid toetavad tõendeid (supports evidence for), koos iga rea lüngaga; mitte järeldus, et raamistik on täidetud), ja <c48/> (ADS-B või AIS CSV tekst <c49/> GeoJSON-iks UTC päeva kohta; ainult koondandmed), <c50/> (marsruudi osa läbi nende kaartide halvenenud lahtrite; mitte prognoos), <c51/> (sünteetiline sillal tekkiv NMEA ja instruktori logi meeskonna koolituseks; ainult tekst, mitte kunagi laeva reaalajas navigatsioonisüsteemidele) ning taevageomeetria funktsioonid <c52/>, <c53/>, <c54/>, <c55/> ja <c56/> (milliseid satelliite asukoht näeb, kui hooned, kaid või maastik blokeerivad osa taevast, koos täpsuse halvenemise teguri (DOP), horisontaalse veaellipsi, algväärtustatud (seeded) Monte Carlo pilve ja SVG-tekstina taevagraafikuga; nähtavuse otsust ja ellipsit kontrollitakse sõltumatute teekide vastu, eelseadistused on esindusgeomeetriad, mitte mõõdistused, ja horisondijoon eemaldab otsenähtavuses olevad satelliidid ega midagi enamat). Brauseriehituses puuduvad: <c57/> koos oma lävendi ja TCP kuulajaga, voogedastatud koolitus-NMEA ning telemeetria eksportijad (Prometheus, OpenTelemetry, syslog) on pikalt töötavad võrguprotsessid ja jäävad käsurea tööriista külge; tõendipaketi loomiseks on vaja allkirjastamisvõtit, mis kuulub CLI-le või Pythonile. Siin puudub ühe kutsega <c58/>; see seos on olemas ainult Pythoni wheel-paketis.

# text
seg-12a295fba8a5 = Iga võimekus kontrollimaatriksis on märgistatud kui <b>valideeritud</b> (kontrollitud sõltumatu välise etaloni vastu), <b>modelleeritud</b> või <b>partneri omad</b>; optiliste kellade arvud on kosmoseesmärgid maapealsel riistvaral (ükski strontsiumi optiline kell ei ole lennanud). Küpsus ei ole valdkonniti <em>ühtlane</em> — Maa PNT on valideeritud tegelike andmete vastu; kaugkosmose ja Marsi navigatsioon on modelleeritud, ainult selle ehituskivid (valguse levi aeg, planeetide asukohad) on valideeritud väliste sõltumatute etalonide vastu; tegeliku missiooni kaugkosmose OD (orbiidi määramine) on teekaardil.

# text
# c1: kshana kinds
# c2: gnss-ssv
# c3: lunar-infrastructure
# c4: holdover-test
seg-3de57431d3e6 = Mootoril on { "87" } stsenaariumi liiki; <c1/> loetleb need koos nende väljadega. Uus versioonis { "0.38.0" }: <c2/> (GNSS-signaalid kosmoselaevadele GNSS-orbiitidest kõrgemal, nende ümber ja kaugemal) ja <c3/> (Kuu orbiit ja pind navigatsiooni- ja geodeetilise infrastruktuurina), mõlemad MODELLED, ning <c4/> (ajavea kirje ITU-T maskide vastu).

# text
seg-68ed88ec0b32 = <b>Spekter</b>: kuidas segaja võtab GNSS-i L-riba, riba kaupa.

# text
seg-f04a0aeeee33 = <b>Kellad ja ajastus</b>: holdover läve vastu, aja edastamine ning telekommunikatsiooni holdover Rahvusvahelise Telekommunikatsiooniliidu standardimissektori (ITU-T) maskide vastu.

# text
seg-7e38ac603ef2 = <b>Konstellatsioonid mis tahes keha ümber</b>: katvus, täpsuse halvenemise tegur ja kättesaadavus Maa, Kuu või Marsi ümber ning päikesesüsteem ühel epohhil.

# text
seg-82708b06dcc6 = <b>Madala Maa orbiidi navigatsioon</b>: signaal, läbilend ja side, navigatsioonisõnum ning liidetud fiks, etapp etapi haaval.

# text
seg-e21e9bb02d00 = <b>Kampaaniad</b>: aheldatud missioon, parameetriskaneerimine või Monte Carlo ansambel ühes stsenaariumis.

# text
seg-ba5057da54e4 = <b>Aruanded, animatsioon ja eksport</b>: iga arv koos oma ühiku ja sildiga; käitamise animeeritud joonis; SP3 (Standard Product { "3" }), CCSDS (Consultative Committee for Space Data Systems) orbiidisõnumid, CZML (Cesium Language), KML (Keyhole Markup Language), GeoJSON, STK (Systems Tool Kit) ja SigMF (Signal Metadata Format) failid.

# attr:alt
seg-6b43a8c3031e = Üks avatud mootor keskel, kshana { $version }, tüübitud suunamisega { "75" } liiki hõlmavale; selle ümber käsurida, Rusti teek, Python, WebAssembly ja Kshana Studio, MCP server, Dockeri tõmmis ja JetBrainsi plugin; selle all Kshana Pro, patenteeritud kiht, mis sõltub avatud mootorist ja ei hargne sellest kunagi

# text
# c1: kshana-mcp
seg-ea6f46d62e7b = Sama stsenaariumifail annab igal liidesel samad baidid. MCP on Model Context Protocol: <a1><c1/></a1> laseb tehisintellekti (AI) assistendil mootorit käitada.

# text
seg-f51b0a8cd30e = Kuus arXivi artiklit tuginevad avatud mootorile, igaühel koos selle taga oleva käsuga: <a1>arXiv:{ "2606.22054" }</a1> (häiretuvastajate optimismilõhe), <a2>arXiv:{ "2606.24210" }</a2> (tingimuslik ajastuse kaitsetase), <a3>arXiv:{ "2607.05415" }</a3> (kui stabiilne on PNT vastupidavuse skoor), <a4>arXiv:{ "2607.02566" }</a4> (Kuu pinnajaamade jälgitavus väga pika baasjoonega interferomeetria abil), <a5>arXiv:{ "2607.06212" }</a5> (Kuu lõunapoolse polaarala geomeetria ja pinnamajakad) ja <a6>arXiv:{ "2610.23871" }</a6> (tsislunaarne navigatsioon jälgitavusprobleemina: kaare pikkus, Grami maatriksi tingimuslikkus ja Doppleri kangi efekt). Vt <a7>Uuringud</a7>.

# text
seg-dad7832bf2d2 = Kogu mootor on vaba AGPL-3.0 all. Kshana Pro, patenteeritud kiht, mis sõltub avatud mootorist ja ei hargne sellest kunagi, ning kohandatud uuringud on lepingu alusel saadaval Ashforde® OÜ-lt: <a1>contact@ashforde.org</a1>. Hindu ei ole; vt <a2>docs/PRO.md</a2>.

# text
seg-d217f23af0c2 = Loe lähemalt

# text
seg-0e8320f8ea91 = <b>Täielik README</b> → <a1>https://github.com/AshfordeOU/kshana</a1>

# text
seg-acba56f9ed36 = <b>Kshana Studio</b> (mootor brauseris, WebAssemblyna) → <a1>https://kshana.dev</a1>

# text
seg-13426521456e = <b>Võimekused</b> → <a1>docs/CAPABILITY.md</a1>

# text
seg-a42cfefa5e6d = <b>Valideerimine ja päritolu</b> → <a1>docs/VALIDATION.md</a1> · <a2>docs/PROVENANCE.md</a2>

# text
seg-07b9e03942cb = <b>Kontrollimaatriks</b> → <a1>docs/VERIFICATION-MATRIX.md</a1>

# text
seg-9390336ecc01 = <b>Viita</b> → <a1>CITATION.cff</a1> · DOI <a2>10.5281/zenodo.20528627</a2>

# text
seg-d059e9fc67e1 = Vaba ja avatud lähtekoodiga <b>GNU AGPL-3.0-only</b> all (GNU Affero üldine avalik litsents, ainult versioon { "3" }). <b>Kommertslitsents</b> on suletud integratsiooniks saadaval <a1>Ashforde® OÜ</a1>-lt (Eesti osaühing; OÜ = osaühing); vt <a2>LICENSING.md</a2>. Professionaalselt arendanud ja hooldanud Ashforde® OÜ.

# text
seg-4ae905aec2ab = <s1>Eelmine</s1>Python API

# text
seg-8af548581ae9 = <s1>Järgmine</s1>Rust crate
