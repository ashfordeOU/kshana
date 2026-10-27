# docs--mcp-http: translations (et)

# text
# c1: docs/deploy/mcp-http.md
seg-c8bab9114d57 = Allikas: <c1/>

# text
seg-4bd138b7d28a = kshana-mcp käitamine HTTP kaudu (ise majutatud)

# text
seg-7ca89d6e0201 = Lõik, mis nimetab kolmandate osapoolte tehisintellekti kliente, on siit välja jäetud; see on GitHubis failis <a1>docs/deploy/mcp-http.md</a1>.

# text
# c1: kshana
seg-2f5b3bdb7d0b = <b>Kshana ei majuta lõpp-punkti.</b> Ühtegi ühist <c1/> serverit, kuhu klienti suunata, ei ole. Te käitate seda oma masinas, konteineris või pilveprojektis ning vastutate selle juurdepääsu kontrolli ja kulu eest. Server { $version } on see, mis on selles hoidlas: selle arvud kannavad oma VALIDATED või MODELLED märgiseid täpselt nagu stdio kaudu.

# text
seg-113a79ece785 = Ohutud vaikeväärtused

# text
seg-2bdbe06123c8 = Kontroll

# text
seg-640f28207e8a = Käitumine

# text
seg-9bc8fe53a948 = Sidumisaadress

# text
# c1: 127.0.0.1
# c2: ::1
# c3: --http 8080
# c4: 127.0.0.1:8080
seg-82001913f285 = Ainult loopback (<c1/>, <c2/>). Paljas port (<c3/>) tähendab <c4/>.

# text
# c1: --allow-remote
# c2: KSHANA_MCP_HTTP_TOKEN
seg-f2adda2d3e22 = Vajab <c1/> <b>ja</b> bearer-tokenit keskkonnamuutujas <c2/> ({ "16" } märki või rohkem). Mõlemata keeldub server käivitumast. Mõlemaga prindib see hoiatuse, et kuulab väljaspool seda masinat.

# text
seg-6fbe07565c36 = Autentimine

# text
# c1: Authorization: Bearer <token>
# c2: 401
seg-d5cbeb0cd3d6 = <c1/> igal päringul, kui token on seatud (selle saab seada ka loopbackil). Võrreldakse konstantse ajaga. Puudub või vale: <c2/>.

# text
seg-1962f434458b = Failisüsteem

# text
# c1: iq_*
# c2: KSHANA_MCP_IQ_DIR
seg-1a9e048d348d = Puudub. IQ-failitööriistad (<c1/>) on HTTP-režiimis välja lülitatud, olenemata sellest, mida <c2/> ütleb; iga teine tööriist võtab oma stsenaariumi sisse ja keeldub sellest, mis nimetab faili. Ükski tööriista argument ei loe ega kirjuta teed.

# text
seg-19261cdd2ef0 = Päringukeha suurus

# text
# c1: --max-body-bytes
# c2: 413
seg-c4db8c1454f4 = <c1/>, vaikimisi { "5" } MiB (stsenaariumi ülempiir on { "4" } MiB). Sellest üle: <c2/>, olgu pikkus deklareeritud või päringukeha tükeldatud.

# text
seg-da9103d627dd = Vastuse aeg

# text
# c1: --request-timeout-secs
# c2: 408
# c3: 408
seg-3f013a632773 = <c1/>, vaikimisi { "120" }. Sellest üle: <c2/>. <b>See piirab, kui kaua helistaja ootab, mitte tööd</b>: juba käimasolevat jooksu ei saa peatada, seega jätkab see pärast <c3/> ja lõpeb taustal.

# text
seg-a588b12596b7 = Samaaegsus

# text
# c1: --max-concurrent
# c2: 503
# c3: Retry-After
seg-aa2214db3bdc = <c1/>, vaikimisi { "8" }. Sellest üle saab päring kohe <c2/> koos <c3/>; ükski ei jää järjekorda.

# text
seg-87576ded5272 = Töökogum

# text
# c1: --max-concurrent
seg-7f9c63e3e5e6 = Iga tööriistakutse jookseb blokeerival lõimel <c1/> pesaga kogumis, mitte kunagi asünkroonsetel töötajatel, nii et pikk jooks ei saa serveri vastamist peatada. Pesa vabastatakse alles siis, kui jooks ise lõpeb, mitte siis, kui helistaja loobub: hüljatud jooksud ei saa seetõttu kuhjuda üle kogumi suuruse ja kutse, mis leiab kogumi täis, lükatakse tagasi kui hõivatud.

# text
seg-4a97b035483c = Töö eelarve

# text
# c1: runs
# c2: kshana
seg-91c788b33b25 = Stsenaarium, mis küsib palju rohkem kui kaasasolevad näited, lükatakse tagasi enne käivitamist: rohkem kui { "1000" } Monte Carlo realisatsiooni (<c1/>), parameetriruudustik rohkem kui { "1000" } sõlmega, rohkem kui { "5000" } liikmejooksu (ruudustiku sõlmed korda realisatsioonid) või ajaruudustik rohkem kui { "2" } miljoni epohhiga. Viga nimetab välja, mida vähendada. Sama eelarve kehtib stdio kaudu; käsurea käsul <c2/> seda ei ole.

# text
seg-79c6b146637c = CORS

# text
# c1: Access-Control-*
# c2: Origin
# c3: 403
# c4: --allow-origin <scheme://host[:port]>
# c5: *
seg-68fa7d9f1321 = Päist <c1/> ei saadeta kunagi. Päringu, mis kannab päist <c2/>, lükatakse tagasi (<c3/>), kui seda ei ole nimetatud lipuga <c4/>; <c5/> ei ole aktsepteeritud.

# text
seg-d7f157fdf003 = Host-päis

# text
# c1: --allowed-host
# c2: --allowed-host your.domain
# c3: 403
seg-d7966e93ef1a = Kontrollitakse loopback-nimede või sidumisaadressi pluss iga <c1/> vastu. Proksi taga või platvormi URL-il andke <c2/>. Kõik muu: <c3/>.

# text
seg-12d5cf72f363 = Seansid

# text
seg-58dfe5665877 = Puudub. Iga POST saab JSON-vastuse; seansitabelit ega serveri saadetavate sündmuste voogu ei hoita avatuna.

# text
# c1: kshana-mcp
seg-adbc92ebc196 = TLS-i ei lõpeta <c1/>. Kui see on kättesaadav väljaspool ühte masinat, pange selle ette HTTPS (teie platvormi TLS või pöördproksi) ja hoidke token salajas; bearer-tokenit lihtsa HTTP kaudu saab ülekandel lugeda.

# text
seg-1b21740b9c63 = Kohalik

# text
seg-a6194f5a52f8 = Kliendi seadistus (URL-klient; lisage päis ainult siis, kui token on seatud):

# text
seg-a683980168f7 = Docker

# text
# c1: 0.0.0.0
# c2: --allow-remote
# c3: 127.0.0.1:8080:8080
# c4: 127.0.0.1:
# c5: docker compose
# c6: mcp-http/
seg-81df4f5cd02e = Konteineri sees peab server kuulama aadressil <c1/>, seega vajab see <c2/> ja tokenit. Pordi avaldamine kujul <c3/> hoiab selle teie masinas; jätke <c4/> ära ainult siis, kui mõtlete selle avada, ja lõpetage siis TLS selle ees. <c5/> ning Fly.io ja Cloud Run mallid on failis <a1><c6/></a1>.

# text
seg-8b8bef7174e8 = Mallid (te rakendate need; Kshana ei käita ühtki)

# text
# c1: mcp-http/fly.toml
# c2: fly secrets set KSHANA_MCP_HTTP_TOKEN=...
seg-198bea1e0595 = <a1><c1/></a1>: seadke token käsuga <c2/>

# text
# c1: mcp-http/cloudrun.service.yaml
seg-c33701cb9ca2 = <a1><c1/></a1>: võtke token Secret Managerist

# text
# c1: --allowed-host
seg-b86ddb72b916 = Igaüks käitab avaldatud kujutist, seab <c1/> platvormi hostinimeks, mille te failis asendate, ning toetub HTTPS-i jaoks platvormile.

# text
seg-ce3a5326cb95 = Seadke platvormil CPU ja mälu piirang

# text
# c1: cpus
# c2: mem_limit
# c3: [[vm]]
# c4: resources.limits
# c5: --max-concurrent
seg-e1fc13672597 = Ajalõpp, kogum ja eelarve piiravad, kui palju tööd vastu võetakse, kuid üks vastuvõetud kutse võib siiski kasutada tuuma pikka aega ja suur tulemus võib kasutada sadu megabaite. Pange konteinerile ka kõva piirang: mallid küsivad { "2" } CPU-d ja { "1" } GiB (<c1/> ja <c2/> Compose'is, <c3/> Flys, <c4/> Cloud Runis). Hoidke <c5/> CPU-de arvuga võrdne või sellest väiksem.

# text
seg-058781b052c4 = Mis see ei ole

# text
seg-90edc7ff2a55 = Ei ole mitme rentnikuga teenus. Igaüks, kellel on token, käitab simulatsioone teie riistvaral; ülaltoodud piiridest kaugemaid kasutajapõhiseid kvoote ei ole.

# text
seg-5b3b9c610f31 = Nõuandev, mitte tüübikinnitust omav navigatsiooniseade: navigeerimise eest vastutab jätkuvalt operaator. Simulaatori väljundid on analüüsi jaoks modelleeritud või valideeritud arvud, nagu kõikjal mujal Kshanas.

# text
seg-c33947d44b06 = <s1>Eelmine</s1>MCP server: kõik paigalduskanalid

# text
seg-a9d67efe493a = <s1>Järgmine</s1>Kshana kasutamine agendist
