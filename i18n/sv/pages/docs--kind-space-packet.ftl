# docs--kind-space-packet: translations (sv)

seg-99ef7c1d552c = Scenariotyp i motor v{ $version }, familj <a1>Uppdragsanalys, länkar och rymdoperationer</a1>. Rådgivande: analysutdata från ett forsknings- och ingenjörsverktyg, inte typgodkänd navigationsutrustning och inte en livräddande säkerhetstjänst. Varje etikett här är motorns eller verifieringsmatrisens; en typ är MODELLED om inte matrisen säger något annat (hur en etikett förtjänas: avsnittet Evidens i README).

seg-8f1e7d3f5a07 = Familjesida: <a1>Uppdragsanalys, länkar och rymdoperationer</a1>

seg-3068552e4ab4 = VALIDATED: raderna i <a1>verifieringsmatrisen</a1> som nämner den här typen.

seg-98151954f217 = false

seg-2ac27c1e55c0 = octet

seg-785f906eb194 = Källa: <c1/>

seg-525499bc01cd = <c1/> (scenariotyp)

seg-de2448d74c2b = Ramning enligt CCSDS 133.0-B Space Packet Protocol: koda en syntetisk TM/TC-paketström (6-oktetts primärhuvud + datafält) och redovisa avkodning av huvudet per paket, totalt antal oktetter och en exakt rundtur kodning↔avkodning. Deterministisk ramning med exakt bitlayout — interoperabilitetslagret för myndigheters paketformat; INTE en certifiering av överensstämmelse (ingen logik för sekundärhuvud/CRC/segmentering utöver flaggorna).

seg-757dec59102b = En körning av <c1/> sammanfattas som: space-packet: framed { "4" } CCSDS-133.0 TM packet(s) APID { "100" }, { "152" } octets total, round-trip exact (true)

seg-fd46ce63e6fc = Valfria fält: <c1/>, <c2/>, <c3/>, <c4/>

seg-e3235e4d3760 = Exemplet <c1/> anger bland annat:

seg-f5bc99396b7d = { "00" } { "64" } { "40" } { "00" } { "00" } 1F

seg-5b3bc9761db4 = Först

seg-52036320db9b = TM

seg-f336ba92871f = Resultatetikett (motorns egen): CCSDS 133.0-B Space Packet, ramning av primärhuvudet — exakt, deterministisk bitlayout, rundtur kodning↔avkodning verifierad; INTE en certifiering av överensstämmelse (ingen logik för sekundärhuvud / CRC / segmentering utöver flaggorna)

seg-ff1f36904d38 = <b>VALIDATED</b> Kodning/avkodning av primärhuvudet i CCSDS 133.0-B Space Packet (version/typ/sek-huvud/APID/sekvensflaggor/räknare/datalängd) + ett ramningsscenario. Tester: <a1>ccsds_space_packet_reference.rs</a1>.

seg-82c617034322 = <b>VALIDATED</b> Tillägg i CCSDS 133.0-B-2 Space Packet vid sidan av primärhuvudet: ett sekundärhuvud med en tidskod enligt CCSDS 301.0-B (CUC eller CDS, explicit eller implicit P-fält) och ancillär data, felkontrollfältet CRC-16 för paketet, segmentering av en Tester: <a1>space_packet_ext_oracle.rs</a1>.

seg-94f3381476ee = <b>VALIDATED</b> Kodning/avkodning av primärhuvudet i CCSDS 133.0-B Space Packet (version/typ/sek-huvud/APID/sekvensflaggor/räknare/datalängd) + ett ramningsscenario. Kan köras från CLI/bind. Oberoende referens (ExternalDataset): spacepackets { "0.32.0" } (us-irs/spacepackets-py, R. Mueller, Apache-2.0) — en oberoende implementation från tredje part av CCSDS 133.0-B-2; kshanas encode_packet/decode_packet matchade byte för byte (det 6-oktetts primärhuvudet för { "33" } fall + hela det kodade paketet för { "12" })

seg-bca17769398b = <s1>Föregående</s1>solar-system

seg-6ef772483f30 = <s1>Nästa</s1>space-weather

seg-af1cf9aa9938 = Diagrammet som motorn skriver för scenarios/space-packet.toml, typ space-packet
