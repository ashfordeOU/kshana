# docs--kind-space-packet: translations (de)

# text
# c1: docs/kinds/by-kind/space-packet.md
seg-785f906eb194 = Quelle: <c1/>

# text
# c1: space-packet
seg-525499bc01cd = <c1/> (Szenariotyp)

# text
seg-de2448d74c2b = Framing nach CCSDS 133.0-B Space Packet Protocol: einen synthetischen TM/TC-Paketstrom kodieren (Primärheader mit 6 Oktetten + Datenfeld) und die Dekodierung des Headers je Paket, die Gesamtzahl der Oktette und einen exakten Rundlauf aus Kodierung und Dekodierung ausgeben. Deterministisches Framing mit exaktem Bitlayout — die Interoperabilitätsschicht für Paketformate der Agenturen; KEINE Konformitätszertifizierung (keine Logik für Sekundärheader, CRC oder Segmentierung über die Flags hinaus).

# text
# c1: scenarios/space-packet.toml
seg-757dec59102b = Ein Lauf von <c1/> fasst sich so zusammen: space-packet: { "4" } CCSDS-133.0-TM-Paket(e) mit APID { "100" } gerahmt, { "152" } Oktette insgesamt, Rundlauf exakt (true)

# text
# c1: apid
# c2: telecommand
# c3: packet_count
# c4: data_len
seg-fd46ce63e6fc = Optionale Felder: <c1/>, <c2/>, <c3/>, <c4/>

# text
# c1: scenarios/space-packet.toml
seg-e3235e4d3760 = Das Beispiel <c1/> setzt unter anderem:

# text
seg-f5bc99396b7d = { "00" } { "64" } { "40" } { "00" } { "00" } 1F

# text
seg-5b3bc9761db4 = Erstes

# text
seg-52036320db9b = TM

# text
seg-f336ba92871f = Ergebnisbezeichnung (die der Engine): Framing des Primärheaders nach CCSDS 133.0-B Space Packet — exaktes, deterministisches Bitlayout, Rundlauf aus Kodierung und Dekodierung verifiziert; KEINE Konformitätszertifizierung (keine Logik für Sekundärheader, CRC oder Segmentierung über die Flags hinaus)

# attr:alt
seg-af1cf9aa9938 = Das Diagramm, das die Engine für scenarios/space-packet.toml schreibt, Typ space-packet

# text
seg-ff1f36904d38 = <b>VALIDATED</b> Kodierung und Dekodierung des Primärheaders nach CCSDS 133.0-B Space Packet (Version/Typ/Sekundärheader/APID/Sequenzflags/Zähler/Datenlänge) + ein Framing-Szenario. Tests: <a1>ccsds_space_packet_reference.rs</a1>.

# text
seg-82c617034322 = <b>VALIDATED</b> Erweiterungen nach CCSDS 133.0-B-2 Space Packet neben dem Primärheader: ein Sekundärheader mit einem Zeitcode nach CCSDS 301.0-B (CUC oder CDS, explizites oder implizites P-Field) und Zusatzdaten, das Feld zur Paketfehlerkontrolle CRC-16, die Segmentierung eines Tests: <a1>space_packet_ext_oracle.rs</a1>.

# text
seg-94f3381476ee = <b>VALIDATED</b> Kodierung und Dekodierung des Primärheaders nach CCSDS 133.0-B Space Packet (Version/Typ/Sekundärheader/APID/Sequenzflags/Zähler/Datenlänge) + ein Framing-Szenario. Ausführbar über CLI/Bindings. Referenz (ExternalDataset): spacepackets { "0.32.0" } (us-irs/spacepackets-py, R. Mueller, Apache-2.0) — eine unabhängige Drittimplementierung von CCSDS 133.0-B-2; encode_packet/decode_packet von Kshana stimmten byte-exakt überein (der 6-Oktett-Primärheader für { "33" } Fälle + das vollständige kodierte Paket für { "12" })

# text
seg-bca17769398b = <s1>Zurück</s1>solar-system

# text
seg-6ef772483f30 = <s1>Weiter</s1>space-weather
