# docs--kind-space-packet: translations (fi)

seg-99ef7c1d552c = Moottorin v{ $version } skenaariolaji, perhe <a1>Tehtäväanalyysi, linkit ja avaruusoperaatiot</a1>. Ohjeellinen: tutkimus- ja suunnittelutyökalun analyysitulos; ei tyyppihyväksytty navigointilaite eikä ihmishengen turvaamiseen tarkoitettu palvelu. Jokainen tässä oleva nimike on moottorin tai varmennusmatriisin; laji on MODELLED, ellei matriisi toisin sano (miten nimike ansaitaan: README:n Evidence-osio).

seg-8f1e7d3f5a07 = Perhesivu: <a1>Tehtäväanalyysi, linkit ja avaruusoperaatiot</a1>

seg-3068552e4ab4 = VALIDATED: <a1>varmennusmatriisin</a1> rivit, jotka nimeävät tämän lajin.

seg-98151954f217 = false

seg-2ac27c1e55c0 = oktetti

# text
# c1: docs/kinds/by-kind/space-packet.md
seg-785f906eb194 = Lähde: <c1/>

# text
# c1: space-packet
seg-525499bc01cd = <c1/> (skenaariolaji)

# text
seg-de2448d74c2b = CCSDS 133.0-B Space Packet Protocol -kehystys: synteettisen TM/TC-pakettivirran koodaus (6 oktetin ensisijainen otsikko + datakenttä) sekä pakettikohtaisen otsikon dekoodauksen, oktettien kokonaismäärän ja tarkan koodaus↔dekoodaus-kierron raportointi. Deterministinen tarkka bittirakenteen kehystys — viraston pakettimuodon yhteentoimivuuskerros; EI vaatimustenmukaisuuden sertifiointi (ei toissijaisen otsikon/CRC:n/segmentoinnin logiikkaa lippuja pidemmälle).

# text
# c1: scenarios/space-packet.toml
seg-757dec59102b = Yksi ajo, jossa on <c1/>, tiivistyy seuraavasti: space-packet: framed { "4" } CCSDS-133.0 TM packet(s) APID { "100" }, { "152" } octets total, round-trip exact (true)

# text
# c1: apid
# c2: telecommand
# c3: packet_count
# c4: data_len
seg-fd46ce63e6fc = Valinnaiset kentät: <c1/>, <c2/>, <c3/>, <c4/>

# text
# c1: scenarios/space-packet.toml
seg-e3235e4d3760 = Esimerkki <c1/> asettaa muun muassa seuraavat:

# text
seg-f5bc99396b7d = { "00" } { "64" } { "40" } { "00" } { "00" } 1F

# text
seg-5b3bc9761db4 = Ensimmäinen

# text
seg-52036320db9b = TM

# text
seg-f336ba92871f = Tuloksen tunniste (moottorin oma): CCSDS 133.0-B Space Packet -ensisijaisen otsikon kehystys — tarkka, deterministinen bittirakenne, koodaus↔dekoodaus-kierto varmennettu; EI vaatimustenmukaisuuden sertifiointi (ei toissijaisen otsikon / CRC:n / segmentoinnin logiikkaa lippuja pidemmälle)

# attr:alt
seg-af1cf9aa9938 = Moottorin kirjoittama kaavio skenaariolle scenarios/space-packet.toml, laji space-packet

# text
seg-ff1f36904d38 = <b>VALIDATED</b> CCSDS 133.0-B Space Packet -ensisijaisen otsikon koodaus/dekoodaus (versio/tyyppi/toissijainen otsikko/APID/järjestyslippu/laskuri/datan pituus) + kehitysskenaario. Testit: <a1>ccsds_space_packet_reference.rs</a1>.

# text
seg-82c617034322 = <b>VALIDATED</b> CCSDS 133.0-B-2 Space Packet -laajennukset ensisijaisen otsikon rinnalla: toissijainen otsikko, joka kuljettaa CCSDS 301.0-B -aikakoodin (CUC tai CDS, eksplisiittinen tai implisiittinen P-kenttä) ja apudataa, CRC-16-pakettivirheen ohjauskenttä, a:n segmentointi Testit: <a1>space_packet_ext_oracle.rs</a1>.

# text
seg-94f3381476ee = <b>VALIDATED</b> CCSDS 133.0-B Space Packet -ensisijaisen otsikon koodaus/dekoodaus (versio/tyyppi/toissijainen otsikko/APID/järjestyslippu/laskuri/datan pituus) + kehitysskenaario. Ajettavissa CLI:stä/bind-rajapinnasta. Oraakkeli (ExternalDataset): spacepackets { "0.32.0" } (us-irs/spacepackets-py, R. Mueller, Apache-2.0) — riippumaton kolmannen osapuolen CCSDS 133.0-B-2 -toteutus; kshanan encode_packet/decode_packet vastasivat tavu tavulta (6 oktetin ensisijainen otsikko { "33" } tapaukselle + täysi koodattu paketti { "12" } tapaukselle)

# text
seg-bca17769398b = <s1>Edellinen</s1>solar-system

# text
seg-6ef772483f30 = <s1>Seuraava</s1>space-weather
