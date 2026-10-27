# docs--npm: translations (fi)

seg-3d770dd786e4 = Käyttö

seg-d4a762001549 = Lisenssi

seg-81a87d14efda = Kshana: tunnus, kompassin ristikko, joka merkitsee täsmällisen hetken, sanamerkin kshana vieressä

# text
# c1: README.npm.md
seg-0ddcab84868f = Lähde: <c1/>

# text
seg-32c82b87acd6 = <b>Kshana · <s1>क्षण</s1> · <em>tarkka hetki</em></b><br/> Avoimen lähdekoodin PNT-kestävyyssimulaattori (paikannus, navigointi ja ajanmääritys).

# text
seg-3b861b2f08b8 = Julkaisu v{ $version }

# text
seg-ebe636986f46 = { "176" } / { "388" } ominaisuutta validoitu riippumattomia ulkoisia oraakkeleita vastaan

# text
seg-6a1906d8d4ad = Noin { "95" } %:n rivikattavuus, jatkuvassa integroinnissa kynnyksenä { "85" } %

# text
seg-a9f4f2795fb5 = Lisenssi: AGPL-3.0-only tai kaupallinen lisenssi

# text
seg-3f6b9ca5e225 = DOI 10.5281/zenodo.20528627

# attr:alt
seg-7fcbe854ebc4 = Harjoittele hetkeä, kun GNSS sammuu: Kshanan tehtäväkonsoli, piirretty moottorin todellisesta ajosta, ketjutettu häirinnän, harhautuksen, holdoverin ja eheyden kampanja GPS:n, Galileon, BeiDoun ja GLONASSin { "102" } satelliitin yli

# text
seg-d1153c5e9112 = Harjoittele hetkeä, kun GNSS sammuu

# text
seg-d284448743af = Kshana toistaa häirintää (jamming), harhautusta (spoofing) ja kellon holdoveria (ajanpito ilman ulkoista viitettä), kun GNSS-signaalit (maailmanlaajuinen satelliittinavigointijärjestelmä) pettävät, ja kertoo, kuinka kauan järjestelmä pitää ajan ja paikan budjettinsa sisällä sekä mikä kello tai anturi tuo eniten marginaalia. Tämä on WebAssembly-paketti: koko moottori JavaScriptinä, selaimessa tai Node.js:ssä. Jokainen ajo on toistettavissa bitti bitiltä skenaarion, siemenluvun ja moottoriversion perusteella.

# text
seg-d1a3f78ad8e0 = Kokeile ensin ilman asennusta: <a1>Kshana Studio</a1> ajaa koko moottorin selaimessasi WebAssemblyksi käännettynä eikä lähetä mitään.

# text
seg-2d2c47db0c1f = <b>{ "176" } / { "388" }</b> ominaisuutta validoitu riippumattomia ulkoisia oraakkeleita vastaan; { "208" } rehellisesti merkitty mallinnetuiksi, { "4" } kumppanin omistamaa. Jokaisella ominaisuudella on yksi tunniste koneellisesti tarkistetussa kirjanpidossa (ledger): VALIDATED (riippumaton ulkoinen oraakkeli on samaa mieltä: oikea data, riippumaton toteutus tai julkaistut vertailuvektorit), MODELLED (sisäisesti johdonmukainen, ja se sanotaan ääneen) tai PARTNER (laitteistokumppani vastaa). Tarkistuksiin kuuluvat: kaikki { "666" } SGP4-vektoria (Simplified General Perturbations { "4" }) AIAA:n (American Institute of Aeronautics and Astronautics) asiakirjasta 2006-6753 tarkkuudella { "4.12" } mm sekä Cowell-voimamalli tarkkuudella { "0.08" } m Orekit { "12.2" }:aa vastaan.

# attr:alt
seg-44f7862c45a2 = Kuinka ominaisuus ansaitsee tunnisteensa: ominaisuus, oraakkeli, testi, kirjanpidon tunniste. Varmennuksen tila kaikissa { "388" } ominaisuudessa: { "176" } validoitua, { "208" } mallinnettua, { "4" } kumppanin omistamaa

# text
seg-d662055d817f = Paketti on ES-moduuli (ECMAScript, standardi JavaScript), jonka mukana on WebAssembly-hyötykuorma, rakennettu selainta varten. Alusta se kerran ja kutsu sitten moottoria synkronisesti. Ainoa ero selaimen ja Node.js:n välillä on se, miten WebAssembly-binääri ladataan.

# text
# c1: node_modules/kshana/
# c2: init()
# c3: kshana_bg.wasm
seg-0b750617ea08 = <b>Selaimessa</b> (paketointityökalun kautta tai sivulla, joka tarjoaa hakemiston <c1/>) <c2/> hakee tiedoston <c3/> moduulin vierestä:

# text
# c1: init()
# c2: TypeError: fetch failed
# c3: fetch
# c4: initSync
seg-70fc98eb8d2e = <b>Node.js:ssä</b> <c1/> epäonnistuu virheeseen <c2/> (Noden <c3/> ei voi lukea paikallista tiedostoa), joten lue binääri levyltä ja anna se funktiolle <c4/>:

# text
# c1: .mjs
# c2: "type": "module"
# c3: package.json
# c4: import
seg-2c181d5e0942 = Tallenna Node.js-versio tiedostoksi, jonka pääte on <c1/> (tai aseta <c2/> tiedostossa <c3/>), jotta <c4/> toimii. Siitä eteenpäin molemmat ovat samanlaisia:

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
seg-06eb982ef260 = TypeScript näkee tyypitetyt tulokset: <c1/> palauttaa tyypin <c2/> (<c3/>, <c4/>, <c5/>, <c6/>, <c7/>), <c8/> palauttaa tyypin <c9/>, jonka <c10/> on kaikkien lajien unioni <c11/>, ja <c12/> palauttaa tyypin <c13/> (onnistuessa <c14/>). Kunkin tulosasiakirjan omat kentät vaihtelevat lajin mukaan; <c15/> tyypittää yhteisen kehyksen (<c16/>, <c17/> sekä <c18/>-lohko, joka koostuu arvoista <c19/>).

# text
# c1: kind_modules()
# c2: field_importance()
# c3: iq_signals()
# c4: iq_run_short
# c5: iq_run_short(fs_hz, duration_s, signal, ids, dopplers_hz, cn0_dbhz, seed)
seg-31d983ae7036 = Neljä muuta funktiota kuvaa moottoria käyttöliittymälle. <c1/> palauttaa JSON-olion lajista moduuleihin, jotka sen varmennusmatriisin rivit nimeävät, <c2/> lajista niihin tuloskenttiin, jotka vastaavat sen kysymykseen (esitysmetadataa; moottori ei koskaan lue sitä), <c3/> signaalien nimet, jotka <c4/> hyväksyy, ja <c5/> lyhyen synteettisen IQ-kohtauksen, joka hankitaan ja jota seurataan muistissa (enintään { "0.25" } s, { "1,000,000" } näytettä ja { "8" } satelliittia), samalla vastauksella kuin natiiviversio.

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
seg-ceee5ddc0c36 = WebAssembly-pinnalla jokainen sisääntulopiste on erillinen kutsu: <c1/> (tulosasiakirja JSON-merkkijonona), <c2/>, <c3/>, <c4/> (skenaarion CSV-taulukko (pilkuin erotetut arvot) merkkijonona tai <c5/> lajeille, jotka eivät julkaise taulukkoa; heittää virheen virheellisestä skenaariosta), <c6/> (yksi moottoriajo, joka palauttaa <c7/> JSON-merkkijonona — käytä sitä, kun haluat useamman kuin yhden tulosteen, sillä jokainen muu kutsu ajaa skenaarion alusta), <c8/> (samat tulosteet yhtenä tyypitettynä oliona, jossa asiakirja on jo jäsennetty kentäksi <c9/>), <c10/>, <c11/> / <c12/> / <c13/> (introspektio; <c14/> palauttaa jäsennetyn listan), <c15/> / <c16/> — jaettavan linkin (URL, yhtenäinen resurssitunniste) koodekki, jolla <a1>Kshana Studio</a1> kierrättää koko skenaarion osoiterivin fragmentin kautta — sekä <c17/> / <c18/> / <c19/>, SP3-c (Standard Product { "3" } -muodon versio c) ja CCSDS:n (Consultative Committee for Space Data Systems) efemeridiartefaktit — OMM eli Orbit Mean-elements Message ja OEM eli Orbit Ephemeris Message — jotka komentorivi kirjoittaa — sekä <c20/>, joka arvioi oikean vastaanottimen lokin, jonka skenaario (<c21/>) kuvaa, ja palauttaa <c22/> JSON-merkkijonona (selaimessa ei ole tiedostojärjestelmää, joten lokin ja mahdollisen navigointitiedoston on oltava skenaarion sisällä muodossa <c23/> tai <c24/>; taulukko <c25/> lisää merenkulun monitorit ja luottamuspistemäärän 0–100, vain ohjeellisena), <c26/> / <c27/> (mitä yhteentoimivuusmuotoja skenaario tukee ajamatta sitä, ja yksi vienti muistissa: <c28/>, <c29/>, <c30/>, <c31/> tai <c32/> JSON-muodossa <c33/>, tavutasolla identtinen samalle skenaariolle, mitään ei lähetetä), <c34/> (GeoJSON-reitti kirjoitettuna reittipistereittiskenaarioon, komentorivin <c35/>), <c36/> (ajon aikasarja animoituna SVG:nä, yhtenä HTML-soittimena tai SVG-kehyksinä), <c37/> / <c38/> (mukana toimitetut vertailuskenaariot ja niiden TOML), <c39/> (sidotaan RFC { "3161" } -token todistepakettiin muistissa; paketin on silti läpäistävä varmennus, eikä aikaleimapalvelun allekirjoitusta tarkisteta), <c40/> (minkä satelliittien Galileo-navigointidatan todentaa I/NAV-sivutiedosto tai UBX-virta, luotetulla Merkle-juurella tai julkisilla avaimilla ja valinnaisella riippumattomalla vertailuajalla; se todentaa dataa eikä esitä väitettä harhautuksenestosta; mitään ei lähetetä), <c41/> (rajattu NMEA-ote pisteytettynä samoin kuin live-tila pisteyttää; ei porttia), <c42/> (aluksen NMEA-loki eräajona), <c43/> (luottamusvirta tai tulos Prometheus-tekstinä, CEF- tai LEEF-syslog-riveinä tai OTLP-hyötykuormana; mitään ei lähetetä), <c44/> (allekirjoitetun todistepaketin tarkistus; mitään ei lähetetä; paketit tehdään komentorivillä, Pythonilla tai MCP:llä), <c45/> (skenaarion liike ja tapahtumat tekstinä laboratoriosimulaattorille; signaalia ei kirjoiteta), <c46/> ja <c47/> (mille julkisen kehyksen vaatimusriveille tulosasiakirjat tukevat todisteita (supports evidence for), kunkin rivin aukon kanssa; ei toteamus siitä, että kehys täyttyisi) sekä <c48/> (ADS-B- tai AIS-CSV-teksti GeoJSON-tiedostoksi (<c49/>) per UTC-päivä; vain aggregaatti), <c50/> (reitin osuus näiden karttojen heikentyneiden solujen läpi; ei ennuste), <c51/> (synteettinen siltojen NMEA ja ohjaajan loki miehistön harjoitukseen; vain teksti, ei koskaan aluksen todellisiin navigointijärjestelmiin) ja taivasgeometriafunktiot <c52/>, <c53/>, <c54/>, <c55/> ja <c56/> (mitkä satelliitit paikka näkee, kun rakennukset, laiturit tai maasto peittävät osan taivasta, DOP:n (tarkkuuden heikkenemiskerroin), vaakavirheellipsin, siemenluvulla ajetun Monte Carlo -pilven ja taivaskartan SVG-tekstinä; näkyvyyspäätös ja ellipsi on tarkistettu riippumattomia kirjastoja vastaan, esiasetukset ovat edustavia geometrioita eivätkä mittauksia, ja taivaanrantaprofiili poistaa vain näköyhteydettömät satelliitit eikä mitään muuta). Ei selainversiossa: <c57/> portteineen ja TCP-kuuntelijoineen, suoratoistettu harjoitus-NMEA ja telemetriavientimoduulit (Prometheus, OpenTelemetry, syslog) ovat pitkäkestoisia verkkoprosesseja ja pysyvät komentorivityökalussa; todistepaketin luominen vaatii allekirjoitusavaimen, joka kuuluu komentoriville tai Pythonille. Yhden kutsun kutsua <c58/> ei ole täällä; se sidonta on vain Python-wheelissä.

# text
seg-12a295fba8a5 = Jokainen varmennusmatriisin ominaisuus on merkitty tilaan <b>validoitu</b> (tarkistettu riippumatonta ulkoista oraakkelia vastaan), <b>mallinnettu</b> tai <b>kumppanin omistama</b>; optisten kellojen luvut ovat avaruustavoitteita maanpäällisellä laitteistolla (strontium-optista kelloa ei ole lennetty). Kypsyys <em>ei</em> ole tasaista eri aloilla: Maan PNT on validoitu oikeaa dataa vastaan; syväavaruuden ja Marsin navigointi on mallinnettua, ja vain sen rakennuspalikat (valon kulkuaika, planeettojen paikat) on validoitu ulkoisia oraakkeleita vastaan; oikean tehtävän syväavaruuden radanmääritys (OD, orbit determination) on tiekartalla.

# text
# c1: kshana kinds
# c2: gnss-ssv
# c3: lunar-infrastructure
# c4: holdover-test
seg-3de57431d3e6 = Moottorissa on { "87" } skenaariolajia; <c1/> listaa ne kenttineen. Uutta versiossa { "0.38.0" }: <c2/> (GNSS-signaalit avaruusaluksille GNSS-ratojen yläpuolella, ympärillä ja ohi) ja <c3/> (kuun kiertorata ja pinta navigointi- ja geodeettisenä infrastruktuurina), molemmat MODELLED, sekä <c4/> (aikavirhetallenne ITU-T-maskeja vastaan).

# text
seg-68ed88ec0b32 = <b>Spektri</b>: miten häirintälähde valtaa GNSS:n L-kaistan, kaista kerrallaan.

# text
seg-f04a0aeeee33 = <b>Kellot ja ajoitus</b>: holdover kynnystä vastaan, ajansiirto ja telealan holdover Kansainvälisen televiestintäliiton standardointisektorin (ITU-T) maskeja vastaan.

# text
seg-7e38ac603ef2 = <b>Satelliittitähdistöt minkä tahansa kappaleen ympärillä</b>: kattavuus, DOP (tarkkuuden heikkenemiskerroin) ja saatavuus Maan, Kuun tai Marsin ympärillä sekä aurinkokunta yhdellä epookilla.

# text
seg-82708b06dcc6 = <b>Matalan Maan kiertoradan navigointi</b>: signaali, ylitys ja yhteys, navigointiviesti sekä yhdistetty paikkaratkaisu vaihe vaiheelta.

# text
seg-e21e9bb02d00 = <b>Kampanjat</b>: ketjutettu tehtävä, pyyhkäisy tai Monte Carlo -joukko yhdessä skenaariossa.

# text
seg-ba5057da54e4 = <b>Raportit, animaatio ja viennit</b>: jokainen luku yksikköineen ja tunnisteineen; ajon animoitu piirros; SP3- (Standard Product { "3" }), CCSDS:n (Consultative Committee for Space Data Systems) rataviestit sekä CZML- (Cesium Language), KML- (Keyhole Markup Language), GeoJSON-, STK- (Systems Tool Kit) ja SigMF-tiedostot (Signal Metadata Format).

# attr:alt
seg-6b43a8c3031e = Yksi avoin moottori keskellä, kshana { $version }, tyypitetyllä lähetyksellä { "75" } lajiin; sen ympärillä komentorivi, Rust-kirjasto, Python, WebAssembly ja Kshana Studio, MCP-palvelin, Docker-image ja JetBrains-liitännäinen; sen alla Kshana Pro, suljettu kerros, joka riippuu avoimesta moottorista eikä koskaan haarauta sitä

# text
# c1: kshana-mcp
seg-ea6f46d62e7b = Sama skenaariotiedosto antaa samat tavut jokaisella pinnalla. MCP on Model Context Protocol: <a1><c1/></a1> antaa tekoälyavustajan (AI) ajaa moottoria.

# text
seg-f51b0a8cd30e = Kuusi arXiv-artikkelia perustuu avoimeen moottoriin, kukin komentoineen: <a1>arXiv:{ "2606.22054" }</a1> (häiriöilmaisimien optimismikuilu), <a2>arXiv:{ "2606.24210" }</a2> (ehdollinen ajoituksen suojaustaso), <a3>arXiv:{ "2607.05415" }</a3> (kuinka vakaa PNT-kestävyyspistemäärä on), <a4>arXiv:{ "2607.02566" }</a4> (Kuun pinta-aseman havaittavuus pitkän kantaman interferometrialla), <a5>arXiv:{ "2607.06212" }</a5> (Kuun etelänapaisen alueen geometria ja pintamajakat) ja <a6>arXiv:{ "2610.23871" }</a6> (kuunläheinen navigointi havaittavuusongelmana: kaaren pituus, Gramin matriisin ehtoluku ja Dopplerin vipuvarsi). Ks. <a7>Tutkimus</a7>.

# text
seg-dad7832bf2d2 = Koko moottori on vapaa AGPL-3.0-lisenssillä. Kshana Pro, suljettu kerros, joka riippuu avoimesta moottorista eikä koskaan haarauta sitä, sekä räätälöidyt tutkimukset ovat saatavilla sopimuksella Ashforde® OÜ:ltä: <a1>contact@ashforde.org</a1>. Hintoja ei ole; ks. <a2>docs/PRO.md</a2>.

# text
seg-d217f23af0c2 = Lue lisää

# text
seg-0e8320f8ea91 = <b>Koko README</b> → <a1>https://github.com/AshfordeOU/kshana</a1>

# text
seg-acba56f9ed36 = <b>Kshana Studio</b> (moottori selaimessasi WebAssemblynä) → <a1>https://kshana.dev</a1>

# text
seg-13426521456e = <b>Ominaisuudet</b> → <a1>docs/CAPABILITY.md</a1>

# text
seg-a42cfefa5e6d = <b>Validointi ja alkuperä</b> → <a1>docs/VALIDATION.md</a1> · <a2>docs/PROVENANCE.md</a2>

# text
seg-07b9e03942cb = <b>Varmennusmatriisi</b> → <a1>docs/VERIFICATION-MATRIX.md</a1>

# text
seg-9390336ecc01 = <b>Viittaa</b> → <a1>CITATION.cff</a1> · DOI <a2>10.5281/zenodo.20528627</a2>

# text
seg-d059e9fc67e1 = Vapaa ja avoimen lähdekoodin ohjelmisto lisenssillä <b>GNU AGPL-3.0-only</b> (GNU Affero General Public License, vain versio { "3" }). <b>Kaupallinen lisenssi</b> on saatavilla yritykseltä <a1>Ashforde® OÜ</a1> (virolainen osakeyhtiö; OÜ = osaühing) suljettua integrointia varten; ks. <a2>LICENSING.md</a2>. Ashforde® OÜ kehittää ja ylläpitää ohjelmistoa ammattimaisesti.

# text
seg-4ae905aec2ab = <s1>Edellinen</s1>Python-rajapinta

# text
seg-8af548581ae9 = <s1>Seuraava</s1>Rust-paketti
