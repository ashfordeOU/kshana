# docs--kind-space-packet: translations (nl)

seg-99ef7c1d552c = Scenariotype van de engine v{ $version }, familie <a1>Missieanalyse, verbindingen en ruimteoperaties</a1>. Adviserend: analyse-uitvoer van een onderzoeks- en engineeringhulpmiddel, geen typegoedgekeurde navigatieapparatuur en geen dienst voor het redden van mensenlevens. Elk label hier is dat van de engine of van de verificatiematrix; een type is MODELLED tenzij de matrix anders zegt (hoe een label wordt verdiend: de sectie Evidence van de README).

seg-8f1e7d3f5a07 = Familiepagina: <a1>Missieanalyse, verbindingen en ruimteoperaties</a1>

seg-3068552e4ab4 = VALIDATED: de rijen van de <a1>verificatiematrix</a1> die dit kind noemen.

seg-98151954f217 = false

seg-785f906eb194 = Bron: <c1/>

seg-525499bc01cd = <c1/> (scenariosoort)

seg-de2448d74c2b = CCSDS 133.0-B Space Packet Protocol-framing: codeer een synthetische TM/TC-pakketstroom (primaire header van 6 octetten + gegevensveld) en rapporteer per pakket de decodering van de header, het totaal aantal octetten en een exacte rondreis van codering↔decodering. Deterministische framing met exacte bitindeling — de interoperabiliteitslaag voor pakketformaten van ruimtevaartorganisaties; GEEN certificering van conformiteit (geen logica voor secundaire header/CRC/segmentatie buiten de vlaggen).

seg-757dec59102b = Eén run van <c1/> vat samen als: space-packet: { "4" } CCSDS-133.0 TM-pakket(ten) geframed APID { "100" }, in totaal { "152" } octetten, rondreis exact (true)

seg-fd46ce63e6fc = Optionele velden: <c1/>, <c2/>, <c3/>, <c4/>

seg-e3235e4d3760 = Het voorbeeld <c1/> stelt onder meer in:

seg-f5bc99396b7d = { "00" } { "64" } { "40" } { "00" } { "00" } 1F

seg-f336ba92871f = Resultaatlabel (van de engine): CCSDS 133.0-B Space Packet-framing van de primaire header — exacte, deterministische bitindeling, rondreis van codering↔decodering geverifieerd; GEEN certificering van conformiteit (geen logica voor secundaire header / CRC / segmentatie buiten de vlaggen)

seg-af1cf9aa9938 = De grafiek die de engine schrijft voor scenarios/space-packet.toml, soort space-packet

seg-ff1f36904d38 = <b>VALIDATED</b> Codering/decodering van de primaire header van CCSDS 133.0-B Space Packet (versie/type/sec-hdr/APID/seq-flags/count/data-length) + een framingscenario. Tests: <a1>ccsds_space_packet_reference.rs</a1>.

seg-82c617034322 = <b>VALIDATED</b> CCSDS 133.0-B-2 Space Packet-uitbreidingen naast de primaire header: een secundaire header met een CCSDS 301.0-B-tijdcode (CUC of CDS, expliciet of impliciet P-veld) en aanvullende gegevens, het CRC-16-veld voor pakketfoutcontrole, segmentatie van een Tests: <a1>space_packet_ext_oracle.rs</a1>.

seg-94f3381476ee = <b>VALIDATED</b> Codering/decodering van de primaire header van CCSDS 133.0-B Space Packet (versie/type/sec-hdr/APID/seq-flags/count/data-length) + een framingscenario. Uitvoerbaar vanuit de CLI/bind. Onafhankelijke referentie (ExternalDataset): spacepackets { "0.32.0" } (us-irs/spacepackets-py, R. Mueller, Apache-2.0) — een onafhankelijke implementatie van CCSDS 133.0-B-2 door een derde partij; encode_packet/decode_packet van kshana kwamen byte voor byte overeen (de primaire header van 6 octetten voor { "33" } gevallen + het volledige gecodeerde pakket voor { "12" })

seg-bca17769398b = <s1>Vorige</s1>solar-system

seg-6ef772483f30 = <s1>Volgende</s1>space-weather

seg-2ac27c1e55c0 = octet
