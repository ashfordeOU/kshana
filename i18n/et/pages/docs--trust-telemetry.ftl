# docs--trust-telemetry: translations (et)

# text
seg-2247a2344710 = Tähendus

# text
seg-d4e48c972084 = Sildid

# text
seg-ca448daf5ec7 = nominaalne

# text
seg-a129b9e613d0 = Tüüp

# text
seg-2672b7f55371 = halvenenud

# attr:alt
seg-c711c7fecbfc = Üks usaldustulemus kolmes eksportvormingus, mootori v{ $version } tegelikest käitustest (`kshana trust-telemetry`) kataloogil examples/maritime-trust: Prometheuse tekstiesitus (viimane usaldusskoor on { "5.9" } ja usaldamatu riba on see, mis on seatud) ning viimased CEF- ja LEEF-sõnumid. Käsk ei avalda midagi, kui sihtkohta ei anta, ei hoia volitusandmeid ega edasta raadiosignaali. Nõuandev tarkvara, mitte tüübikinnitust omav navigatsiooniseade (IEC { "61108" }, IEC { "61162" }): laeva navigeerimise eest vastutab jätkuvalt operaator.

# text
# c1: docs/TRUST-TELEMETRY.md
seg-15fcf05d16c5 = Source: <c1/>

# text
seg-05919ac6cf31 = GNSS usaldus turvatelemeetriana

# text
# c1: kshana trust-telemetry
seg-8978c6508ebd = <c1/> muudab epohhipõhise GNSS usaldusvoo (skoor 0-100, tase, põhjused) signaalideks, mida operatsiooni- või turvakeskus juba sisse loeb: Prometheuse mõõdikud, CEF- või LEEF-vormingus syslog-sündmused SIEM-i jaoks ning valikuliselt OpenTelemetry. See loeb voogu; see ei muuda kunagi usaldushinnangut ega edasta midagi peale telemeetria.

# text
# c1: docs/MARITIME-TRUST.md
# c2: t_s
# c3: state
# c4: calibrating|nominal|degraded|untrusted
# c5: score
# c6: time
# c7: gate
# c8: off|passed|withheld
# c9: position
# c10: lat_deg
# c11: lon_deg
# c12: height_m
# c13: deductions
# c14: alarms
# c15: geometry
# c16: status
# c17: hdop
# c18: pdop
# c19: n_used
# c20: class
# c21: kshana_trust_input_errors_total
# c22: src/telemetry/sample.rs
seg-14ad6b7911d6 = Sisend on reaalajas JSON-lines skeemi v1.1, mis on dokumenteeritud failis <c1/>. Loetakse: <c2/>; <c3/> (<c4/>, tase); <c5/> (0-100 või null); <c6/> (epohhi aeg nagu öeldud); <c7/> (<c8/>); <c9/> (<c10/>, <c11/>, <c12/> või null); põhjused on monitoorid väljas <c13/>, seejärel kõik edasised väljas <c14/>; skeemist { "1.3" } alates <c15/> (<c16/>, <c17/>, <c18/>, <c19/>) ja iga mahaarvamise <c20/>. Teisi võtmeid ignoreeritakse, sest skeem kasvab ainult lisatud võtmetega. Rida, mis ei parsi, loetakse välja <c21/> ja jäetakse vahele; skoorid väljaspool 0-100 lükatakse tagasi, mitte ei piirata, et vormingu muutus märgataks. Ainus kood, mis seda vormingut tunneb, on <c22/>.

# text
# c1: /metrics
# c2: 127.0.0.1:9464
seg-2c94f3717f82 = <c1/> serveeritakse ilma autentimiseta ja vaikimisi on selleks <c2/>. Mujale sidumine trükib hoiatuse; panna see oma juurdepääsukontrolli taha. Lõpp-punkt teenindab korraga ühte ühendust { "2" } s lugemispiiriga, nii et jõude klient võib kogumist viivitada kuni selle aja võrra; see on mõeldud ühele koguja jaoks, mitte avaliku võrgu jaoks.

# text
seg-7e66e43f15a8 = Home Assistant ja NTP seadmed (MQTT)

# text
# c1: --print-mqtt
# c2: --mqtt-tcp <host:port>
# c3: homeassistant/...
# c4: untrusted
# c5: <prefix>/state
# c6: kshana/trust/state
# c7: state
# c8: score
# c9: untrusted
# c10: t_s
# c11: time
# c12: reasons
# c13: gate
# c14: --mqtt-prefix
# c15: --mqtt-node
# c16: --mqtt-discovery
seg-fbe56ff7f1ed = <c1/> trükib ja <c2/> avaldab JSON olekudokumendi ja Home Assistant MQTT avastamissõnumid. Avastamine (säilitatud, all <c3/>) loob kolm olemit: usaldusskoor, usaldustase (põhjused atribuutidena) ja <c4/> probleemianduri. Olekudokument läheb teemasse <c5/> (vaikimisi <c6/>, säilitatud): <c7/>, <c8/> (null, kuni ühtegi pole), <c9/>, <c10/>, <c11/>, <c12/>, <c13/> ja nõuandev avaldus; asukohta ei lisata kunagi. Valikud: <c14/>, <c15/>, <c16/>.

# text
# c1: format = "mqtt"
# c2: topic<TAB>payload
seg-252025356c0e = Avaldaja räägib MQTT { "3.1.1" } protokolli QoS { "0" } juures ja loeb ainult vahendaja CONNACK-i. Sellel pole mandaate ega TLS-i, seega kasutada kohaliku võrgu vahendajat (või kohalikku releed, mis need lisab). Edastus toimub oma lõimes { "1024" } järjekorra taga: surnud vahendaja viskab sõnumeid minema, need loetakse ja neist teatatakse lõpus, ning see ei peata kunagi voogu. NTP seade või mis tahes muu tarbija, kes soovib lihtsat JSON-i, saab lugeda sama olekurida. Vastuvõtjale ega kellale midagi ei kirjutata. Python, WebAssembly ja MCP võtavad <c1/> ja tagastavad samad <c2/> read (seal midagi ei avaldata).

# text
seg-ed95ebb0ba1b = Pythonist, WebAssembly-st ja MCP-st

# text
# c1: kshana.trust_telemetry(input, format, host="", input_kind="jsonl", expose_position=False, syslog_all=False, unix_nano=0)
# c2: trust_telemetry(input, format, host, input_kind, options_json)
# c3: trust_telemetry
# c4: /kshana-trust-telemetry
# c5: format
# c6: prometheus
# c7: cef
# c8: leef
# c9: otlp
# c10: input_kind
# c11: jsonl
# c12: result
# c13: --print-metrics
# c14: --print-syslog
# c15: host
# c16: syslog_all
seg-93be007cdfda = Kodeerijad on saadaval ka tekst sisse, tekst välja kutsetena ilma protsessi, sokli ega kellata: Python <c1/>, WebAssembly eksport <c2/> ja MCP tööriist <c3/> (pistikprogrammi käsk <c4/>). <c5/> on <c6/>, <c7/>, <c8/> või <c9/>; <c10/> on <c11/> (voog) või <c12/> (paketitulemus). Need tagastavad sama teksti, mida käsurida trükib (<c13/>, <c14/>), samade piirangutega: syslog-read ei kanna ajatemplit, <c15/> on kuni { "255" } trükitavat ASCII märki ilma tühikuteta (muidu lükatakse tagasi, siin ja käsureal) ning vastus, mis on suurem kui pinna piirang ({ "4" } MiB MCP-s), lükatakse tagasi, sest CEF ja LEEF valikuga <c16/> kirjutavad ühe sündmuse epohhi kohta. Midagi ei saadeta, serveerita ega kirjutata; töötavad eksportijad jäävad käsureal protsessiks.

# text
seg-f8c367611a9e = Edastus ei peata kunagi hindamist

# text
# c1: /metrics
seg-3853bb63c7ad = Syslog ja OpenTelemetry edastus töötavad oma lõimedes. Sisselugemistsükkel annab neile ainult sõnumi või hetktõmmise ega oota kunagi, nii et surnud, aeglane või mitte-lugev koguja ei saa reaalajavoogu tagasi survestada ega käsku <c1/> külmutada:

# text
seg-589d02c31dfe = igal ühendamisel ja kirjutamisel on { "2" } s piirang; ebaõnnestunud ühendus jäetakse maha ja ühendatakse laisalt uuesti, eksponentsiaalse ooteajaga alates { "1" } s kuni { "60" } s;

# text
# c1: kshana_trust_syslog_send_failures_total
seg-3c272ded25a3 = sõnum, mida ei saa edastada (koguja maas, kirjutamine aegus, { "1024" } järjekord täis), visatakse ära ja loetakse väljas <c1/>; häire anda selle sageduse põhjal;

# text
seg-4a7cd2065731 = OpenTelemetry eksportijale antakse registri koopia, nii et võrgu I/O ajal ei hoita lukku; kui eksport on veel pooleli, jäetakse uus hetktõmmis vahele (järgmine kannab samu kumulatiivseid summasid).

# text
seg-57c3bbe405c8 = Sisendi lõpus antakse saatelõimedele lõpetamiseks nende allesjäänud ajapiirangud.

# text
seg-14c13ed8c509 = Prometheuse mõõdikud

# text
seg-d060b2163513 = Mõõdik

# text
seg-45c41bf74eb8 = gauge

# text
seg-e43a6814d13c = konstant { "1" }

# text
seg-3662d2b8a789 = viimane skoor 0-100; puudub, kui allikas seda ei anna

# text
seg-1c50874472fc = { "1" } praeguse taseme jaoks, { "0" } teiste jaoks

# text
# c1: off
# c2: passed
# c3: withheld
# c4: unknown
seg-843ba9d00f65 = <c1/>, <c2/>, <c3/>, <c4/>: { "1" } praeguse oleku jaoks, { "0" } teiste jaoks; puudub ilma väravata

# text
# c1: --expose-position
seg-3e01cab63c59 = vastuvõtja teatatud asukoht; <b>ainult valikuga <c1/></b> (lõpp-punkt on autentimata ja asukoht võib tuvastada saidi või laeva)

# text
seg-280a5ca2e5d9 = { "1" }, kui viimasel epohhil olemas

# text
seg-22ded4fe7f29 = loendur

# text
seg-800b23c30e2f = vastuvõetud epohhid

# text
seg-be11849d8a9b = epohhid, milles põhjus oli olemas

# text
seg-0475fe7b26ba = parsimatud sisendread

# text
# c1: reason="other"
seg-65f1db183cbc = põhjuse esinemised, mis on liidetud kategooriasse <c1/> (vt allpool)

# text
seg-e756633e7d5c = edastamata syslog-sündmused

# text
seg-2de3258f83ee = viimase epohhi nihe voo algusest

# text
seg-c02fe207663e = seinakella vastuvõtuaeg; häire anda selle vanuse põhjal

# text
# c1: good
# c2: degraded
# c3: unknown
seg-67d5bbbde75a = satelliitide geomeetria viimasel epohhil, <c1/>, <c2/>, <c3/>: { "1" } praeguse jaoks <em>(skeemi { "1.3" } sisendid)</em>

# text
seg-4878afc243e3 = { "1" } halvenenud, { "0" } hea; puudub, kui geomeetria on teadmata

# text
# c1: geometry_degraded
seg-c21f54522128 = { "1" }, kui nähtavaid satelliite ei jälgita, kuigi nende geomeetria on hea (signaal kadus, mitte taevas; <c1/> näitab endiselt { "1" }), muidu { "0" }; puudub, kui geomeetria on teadmata või sisend seda ei ütle

# text
seg-db29584bb51c = HDOP, PDOP ja kasutatud satelliidid viimasel epohhil; igaüks puudub, kui ühtegi pole

# text
seg-c60ca4530e92 = epohhid geomeetria oleku järgi

# text
# c1: good
# c2: fair
# c3: poor
# c4: unknown
# c5: poor
seg-fd6bf7764eca = geomeetria silt viimasel epohhil, <c1/>, <c2/>, <c3/>, <c4/>: { "1" } praeguse jaoks; ei hinnata kunagi (skoor arvab maha ainult <c5/> eest); sisenditest, mis kannavad silti ({ "0.36" })

# text
seg-d6f04ef7adfb = VDOP viimasel epohhil; puudub, kui ühtegi pole

# text
# c1: kshana_trust_geometry_label
# c2: kshana.geometry.label
# c3: cs6
# c4: geoLabel
# c5: poor
# c6: degraded
# c7: sky-blocked
# c8: kshana_trust_geometry_degraded
seg-cb8feee01192 = <b>Geomeetria silt on peamine.</b> Joonistada graafik ja anda häire väljal <c1/> (OTLP <c2/>, CEF kolmas <c3/> väli, LEEF <c4/>): <c5/> on ainus silt, mille eest skoor maha arvab. Geomeetria olek on kirjeldav: <c6/> sisaldab informatiivset juhtu <c7/>, mis võib tulla hea või keskmise DOP-iga, seega ainult <c8/> põhjal mitte häiret anda.

# text
# c1: kshana_trust_reason_active
# c2: class
# c3: geometry
# c4: environment
# c5: inconsistency
# c6: geometry
# c7: unknown
# c8: kshana_trust_reason_active{class="inconsistency"}
# c9: geometry
# c10: docs/RECEIVER-TRUST.md
seg-70343708da03 = Skeemi { "1.3" } sisenditest alates kannab <c1/> ka silti <c2/> (<c3/>, <c4/>, <c5/>) igal põhjusel, millega see kaasas oli: mahaarvamise klass viimasel epohhil. Geomeetria seeriad tulevad pärast kõiki teisi ja alles siis, kui sisendi epohh kannab <c6/> (reaalajas skeem { "1.3" }, tulemus mootorist { "0.36" } või hilisemast), nii et { "0.35" } voog või tulemus renderdatakse bait-baidilt nagu varem. Sildi väärtused on fikseeritud hulgad (tundmatu olek loetakse <c7/>; tundmatu klass jäetakse välja). Häire anda väljal <c8/> mitte ainult tasemel, et kehv taevas ei anna häiret rünnakuna; klass <c9/> on väide taeva kohta, mitte järeldus, et rünnakut ei toimunud (vt <c10/>).

# text
# c1: class
# c2: loss-of-lock
# c3: environment
# c4: geometry
# c5: geometry
# c6: inconsistency
# c7: reason
# c8: max by (reason)
# c9: class
seg-3f45b21003d5 = Silt <c1/> on seeria identiteedi osa: kui põhjuse klass muutub epohhide vahel (<c2/> väärtusest <c3/> väärtuseks <c4/>, kui kaotatud satelliidid olid madalad, või <c5/> väärtusest <c6/> väärtuseks, kui esitatud HDOP on vastuolus esitatud taevaga), siis vana seeriat enam ei ekspordita ja uus algab. Päring väljal <c7/> koos <c8/>, kui klass ei loe, ja oodata, et selline ümberlülitus näeb välja nagu ühe seeria lõppemine ja teise algamine. Skeemi { "1.3" } seeriaid, silti <c9/> ja CEF/LEEF geomeetria välju kontrollivad mootori enda testid ja CEF oraaklid (pycef, Logstash); välistel Prometheuse ja OTLP oraakleil ei ole veel { "1.3" } voogu.

# text
# c1: reason="other"
# c2: kshana_trust_reason_overflow_total
seg-17ca55cea260 = Põhjuste nimed lõigatakse { "128" } märgini ja kuni { "64" } erineval põhjusel on oma seeria; hilisemad loetakse kategooria <c1/> alla ja väljale <c2/>, nii et vaenulik või vigane sisend ei saa luua piiramatut sildikardinaalsust.

# text
# c1: band
# c2: calibrating
# c3: nominal
# c4: degraded
# c5: untrusted
# c6: unknown
# c7: kinematic
# c8: heading-course
# c9: cn0-drop
# c10: agc
# c11: raim
seg-35f3faf39d1c = <c1/> on üks väärtustest <c2/>, <c3/>, <c4/>, <c5/>, <c6/>. Põhjuste nimed on voo monitooride nimed (<c7/>, <c8/>, ...; paketitulemuse puhul <c9/>, <c10/>, <c11/>).

# text
# c1: deploy/grafana/kshana-gnss-trust.json
seg-a726fc8d28c2 = Näidisarmatuurlaud on failis <c1/> (importida see ja valida oma Prometheuse andmeallikas).

# text
seg-208f33eda580 = Syslog: CEF ja LEEF

# text
# c1: kshana
# c2: GNSSTRUST
# c3: --syslog-octet-counting
# c4: <length> <message>
# c5: --syslog-all
# c6: Ashforde OU
seg-0d53db66a990 = Sündmused saadetakse RFC { "5424" } ümbrises (facility local0, rakendus <c1/>, sõnumi id <c2/>) UDP kaudu (üks datagramm igaühele; IPv4 või IPv6) või TCP kaudu, vaikimisi reavahetusega lõpetatult või valikuga <c3/> kaadristatult <c4/> nagu RFC { "6587" }. Vaikimisi saadetakse üks sündmus taseme muutuse kohta; <c5/> saadab ühe epohhi kohta. Tootja kirjutatakse <c6/> (ASCII), et ükski SIEM seda valesti ei dekodeeriks.

# text
seg-9cb6e1b9fec0 = Mõiste

# text
seg-9e4ce52ac5d9 = Syslogi tõsidus

# text
seg-084d2e726d3f = CEF tõsidus

# text
# c1: sev
seg-60fa1c602748 = LEEF <c1/>

# text
seg-7948fbcf87cb = kalibreerimisel

# text
seg-453691777f9d = { "6" } info

# text
seg-2ac57280bf6a = { "4" } hoiatus

# text
seg-f757a767bd4a = ebausaldatav

# text
seg-8e4e2d9142f9 = { "2" } kriitiline

# text
seg-4c5b832482cb = teadmata

# text
seg-5e4f3b0222cd = { "5" } teade

# text
# c1: gnss-trust.<band>
seg-b07ec4ccabf7 = Väljade vastendus (sündmuse id on <c1/>):

# text
seg-bfad2619553e = CEF

# text
# c1: ^
seg-62108c4b1d75 = LEEF { "2.0" } (eraldaja <c1/>)

# text
seg-18a4ca402cd9 = kategooria

# text
seg-d3bc36a445cb = saatev host

# text
seg-521cea5013c8 = tase

# text
# c1: cs1
# c2: band
seg-2b9153eb068d = <c1/> (silt <c2/>)

# text
seg-f1be6ef87011 = põhjused, komadega eraldatud

# text
seg-e77a9847bc7b = eelmine tase

# text
seg-87b7f1652b0c = skoor

# text
# c1: cfp1
# c2: trustScore
seg-470a89a86d79 = <c1/> (<c2/>), välja jäetud, kui ühtegi pole

# text
seg-fc2aebb988bf = epohhi nihe, s

# text
seg-9f9d0d551742 = logi aja silt

# text
seg-57ed10b00272 = värava olek

# text
# c1: ;
# c2: degraded;environment,geometry
# c3: ;
# c4: degraded;;poor
# c5: good;;fair
seg-7159f151c079 = geomeetria olek, seejärel <c1/> ja epohhi mahaarvamiste klassid, komadega eraldatud (näiteks <c2/>) <em>(sisendid { "1.3" })</em>; sisenditest, mis kannavad silti ({ "0.36" }), kolmas väli <c3/> ja silt, klasside väli on siis alati olemas (näiteks <c4/>, <c5/>)

# text
# c1: geoStatus
# c2: geoClass
# c3: geoLabel
seg-973339622a60 = <c1/> (ainult olek), <c2/> (klassid) ja <c3/> (silt)

# text
seg-ae3a1d06bddf = HDOP

# text
seg-c431625778a6 = PDOP

# text
seg-e10eccec5f94 = ({ "0.36" }, koos sildiga)

# text
seg-e0a712018ced = VDOP <em>({ "0.36" }, koos sildiga)</em>

# text
seg-42273c09a591 = ei kanta: võetakse neli ujukomaga kohandatud välja

# text
seg-292efe9557d6 = kasutatud satelliidid <em>({ "0.36" }, koos sildiga)</em>

# text
# c1: cn1
# c2: geometryUsedSatellites
seg-179b75fd8f06 = <c1/> (<c2/>), täisarv

# text
seg-f69551c20173 = signaali kadu: nähtavaid satelliite ei jälgita, kuigi nende geomeetria on hea

# text
# c1: degraded
# c2: environment
# c3: cs6
seg-bb927aab7541 = ei kanta väljana (ühtki CEF sõnastiku võtit ei ole selle jaoks vaba): olek on <c1/> ja geomeetria mahaarvamise klass <c2/> väljas <c3/>

# text
# c1: geoSignalLoss=1
seg-6a80d53b2163 = <c1/>, ainult kui see kehtib

# text
# c1: cs6
# c2: flexString1
# c3: flexString
# c4: tests/cef_reference.rs
seg-1f099d4ef4b6 = CEF-is kasutab geomeetria ainult sõnastiku kohandatud välju (leiutatud võtmeid ei ole); silt liigub väljas <c1/>, mitte väljas <c2/>, sest Logstashi CEF-kodek ei vasta välju <c3/>. Geomeetria sündmused { "1.3" }, sealhulgas sildijuhud, on VALIDATED CEF rea osa: mõlemad oraakli parserid loevad need tagasi nii, nagu need on kirjutatud (<c4/>, muudatused { "4" } ja { "5" }, kumbki registreeritud enne, kui kumbagi parserit nende juhtudel käivitati). Sildi, VDOP ja satelliitide arvu väljad lisatakse pärast kõiki varasemaid välju ja seeriaid ning ainult sisenditele, mis kannavad silti, nii et sildita sisend renderdatakse täpselt nagu varem.

# text
# c1: cs2=
# c2: \
# c3: |
# c4: \
# c5: =
# c6: ^
seg-b295bf5bac3e = Tühjad väljad jäetakse välja (ilma põhjusteta ei ole <c1/>). Hostinimi lõigatakse { "255" } märgini. CEF päise väärtused paoseerivad <c2/> ja <c3/>; laiendiväärtused paoseerivad <c4/>, <c5/> ja reavahetused. LEEF väärtustes asendatakse <c6/> ja reavahetused tühikutega.

# text
seg-a3b77e9593eb = OpenTelemetry (vaikimisi väljas)

# text
# c1: --features otlp
# c2: --otlp http://host:4318/v1/metrics
# c3: kshana.trust.score
# c4: kshana.trust.band
# c5: kshana.trust.epochs
# c6: kshana.trust.reason.epochs
# c7: kshana.geometry.status
# c8: kshana.geometry.degraded
# c9: kshana.geometry.signal_loss
# c10: kshana.geometry.hdop
# c11: kshana.geometry.pdop
# c12: kshana.geometry.used_satellites
# c13: kshana.geometry.label
# c14: label
# c15: kshana.geometry.vdop
# c16: startTimeUnixNano
# c17: --otlp-every
# c18: https://
seg-396c34d29783 = Ehitada valikuga <c1/> ja anda <c2/>. Eksportija postitab OTLP/HTTP JSON-i (<c3/>, <c4/>, <c5/>, <c6/> ja skeemi { "1.3" } sisendite puhul <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/> ning sisenditest, mis kannavad silti ({ "0.36" }), <c13/> (atribuut <c14/>) ja <c15/>; kumulatiivsed summad kannavad <c16/>) iga <c17/> epohhi järel (vaikimisi { "10" }) ja sisendi lõpus. See ei lisa sõltuvust ega toeta TLS-i: saata koguja poole samas hostis või usaldatud segmendis, mis edastab edasi TLS-i kaudu. Lõpp-punktid <c18/> lükatakse tagasi.

# text
seg-c3111d73a8b0 = <s1>Eelmine</s1>Taevageomeetria ja horisondijoon

# text
seg-4c539b667a05 = <s1>Järgmine</s1>Galileo OSNMA kontrollimine
