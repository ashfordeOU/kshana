# docs--kind-space-packet: translations (et)

# text
seg-99ef7c1d552c = Mootori v{ $version } stsenaariumi liik, perekond <a1>Missioonianalüüs, lingid ja kosmoseoperatsioonid</a1>. Nõuandev: uurimis- ja inseneeriatööriista analüüsitulemus; mitte tüübikinnitust omav navigatsiooniseade ega inimelu ohutusega seotud teenus. Iga siinne märgis on mootori või kontrollimaatriksi oma; liik on MODELLED, kui maatriks ei ütle teisiti (kuidas märgis teenitakse: README jaotis Evidence).

# text
seg-8f1e7d3f5a07 = Perekonna leht: <a1>Missioonianalüüs, lingid ja kosmoseoperatsioonid</a1>

# text
seg-3068552e4ab4 = VALIDATED: selle liigi nimetavad <a1>kontrollimaatriksi</a1> read.

# text
seg-98151954f217 = false

# text
seg-2ac27c1e55c0 = oktett

# text
# c1: docs/kinds/by-kind/space-packet.md
seg-785f906eb194 = Allikas: <c1/>

# text
# c1: space-packet
seg-525499bc01cd = <c1/> (stsenaariumi liik)

# text
seg-de2448d74c2b = CCSDS 133.0-B kosmosepaketi protokolli raamistamine: sünteetilise TM/TC paketivoo kodeerimine (6-oktetine primaarpäis + andmeväli) ning paketipõhise päise dekodeerimise, oktettide koguarvu ja täpse kodeerimine↔dekodeerimine edasi-tagasi läbimise aruandlus. Deterministlik täpne bitipaigutusega raamistamine — agentuuride paketivormingu koostalitluskiht; MITTE standardi järgimise sertifitseerimine (lippudest kaugemale ulatuvat sekundaarpäise/CRC/segmenteerimise loogikat ei ole).

# text
# c1: scenarios/space-packet.toml
seg-757dec59102b = Ühe <c1/> käivituse kokkuvõte: space-packet: raamistatud { "4" } CCSDS-133.0 TM paketti APID { "100" }, kokku { "152" } oktetti, edasi-tagasi läbimine täpne (true)

# text
# c1: apid
# c2: telecommand
# c3: packet_count
# c4: data_len
seg-fd46ce63e6fc = Valikulised väljad: <c1/>, <c2/>, <c3/>, <c4/>

# text
# c1: scenarios/space-packet.toml
seg-e3235e4d3760 = Näide <c1/> määrab muu hulgas:

# text
seg-f5bc99396b7d = { "00" } { "64" } { "40" } { "00" } { "00" } 1F

# text
seg-f336ba92871f = Tulemuse silt (mootori oma): CCSDS 133.0-B kosmosepaketi primaarpäise raamistamine — täpne, deterministlik bitipaigutus, kodeerimine↔dekodeerimine edasi-tagasi läbimine kontrollitud; MITTE standardi järgimise sertifitseerimine (lippudest kaugemale ulatuvat sekundaarpäise / CRC / segmenteerimise loogikat ei ole)

# attr:alt
seg-af1cf9aa9938 = Diagramm, mille mootor kirjutab failile scenarios/space-packet.toml, liik space-packet

# text
seg-ff1f36904d38 = <b>VALIDATED</b> CCSDS 133.0-B kosmosepaketi primaarpäise kodeerimine/dekodeerimine (versioon/tüüp/sek-päis/APID/jada-lipud/loendur/andmepikkus) + raamistamise stsenaarium. Testid: <a1>ccsds_space_packet_reference.rs</a1>.

# text
seg-82c617034322 = <b>VALIDATED</b> CCSDS 133.0-B-2 kosmosepaketi laiendused primaarpäise kõrval: sekundaarpäis, mis kannab CCSDS 301.0-B ajakoodi (CUC või CDS, selgesõnaline või kaudne P-väli) ja lisaandmeid, CRC-16 paketivea kontrolli väli, segmenteerimine Testid: <a1>space_packet_ext_oracle.rs</a1>.

# text
seg-94f3381476ee = <b>VALIDATED</b> CCSDS 133.0-B kosmosepaketi primaarpäise kodeerimine/dekodeerimine (versioon/tüüp/sek-päis/APID/jada-lipud/loendur/andmepikkus) + raamistamise stsenaarium. Käivitatav CLI-st/sidumisest. Sõltumatu etalon (sõltumatu etalon; ExternalDataset): spacepackets { "0.32.0" } (us-irs/spacepackets-py, R. Mueller, Apache-2.0) — CCSDS 133.0-B-2 sõltumatu kolmanda osapoole teostus; kshana encode_packet/decode_packet ühtisid baidilt baidile (6-oktetine primaarpäis { "33" } juhul + täielik kodeeritud pakett { "12" } juhul)

# text
seg-bca17769398b = <s1>Eelmine</s1>solar-system

# text
seg-6ef772483f30 = <s1>Järgmine</s1>space-weather
