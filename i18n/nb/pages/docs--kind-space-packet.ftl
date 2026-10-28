# docs--kind-space-packet: translations (nb)

seg-99ef7c1d552c = Scenariotype i motoren v{ $version }, familien <a1>Oppdragsanalyse, linker og romoperasjoner</a1>. Veiledende: analyseutdata fra et forsknings- og ingeniørverktøy, ikke typegodkjent navigasjonsutstyr og ikke en tjeneste der liv og sikkerhet står på spill. Hver etikett her er motorens eller verifikasjonsmatrisens; en type er MODELLED med mindre matrisen sier noe annet (hvordan en etikett oppnås: avsnittet Evidence i README).

seg-8f1e7d3f5a07 = Familieside: <a1>Oppdragsanalyse, linker og romoperasjoner</a1>

seg-3068552e4ab4 = VALIDATED: radene i <a1>verifikasjonsmatrisen</a1> som nevner denne typen.

seg-98151954f217 = false

seg-2ac27c1e55c0 = oktett

seg-785f906eb194 = Kilde: <c1/>

seg-525499bc01cd = <c1/> (scenariotype)

seg-de2448d74c2b = CCSDS 133.0-B Space Packet Protocol-rammer: kode en syntetisk TM/TC-pakkestrøm (6-oktetters primærhode + datafelt) og rapporter dekodingen av hodet per pakke, totalt antall oktetter og en eksakt rundtur mellom koding og dekoding. Deterministisk, eksakt bitoppsett i rammene, interoperabilitetslaget for byråenes pakkeformat; IKKE en sertifisering av overensstemmelse (ingen logikk for sekundærhode, CRC eller segmentering utover flaggene).

seg-757dec59102b = En kjøring av <c1/> oppsummeres slik: space-packet: framed { "4" } CCSDS-133.0 TM packet(s) APID { "100" }, { "152" } octets total, round-trip exact (true)

seg-fd46ce63e6fc = Valgfrie felt: <c1/>, <c2/>, <c3/>, <c4/>

seg-e3235e4d3760 = Eksempelet <c1/> angir blant annet:

seg-f5bc99396b7d = { "00" } { "64" } { "40" } { "00" } { "00" } 1F

seg-f336ba92871f = Resultatetikett (motorens): CCSDS 133.0-B Space Packet, rammer for primærhode: eksakt, deterministisk bitoppsett, rundtur mellom koding og dekoding verifisert; IKKE en sertifisering av overensstemmelse (ingen logikk for sekundærhode, CRC eller segmentering utover flaggene)

seg-af1cf9aa9938 = Diagrammet motoren skriver for scenarios/space-packet.toml, type space-packet

seg-ff1f36904d38 = <b>VALIDATED</b> Koding og dekoding av primærhode i CCSDS 133.0-B Space Packet (versjon/type/sek.hode/APID/sekvensflagg/teller/datalengde) + et scenario for rammer. Tester: <a1>ccsds_space_packet_reference.rs</a1>.

seg-82c617034322 = <b>VALIDATED</b> Utvidelsene i CCSDS 133.0-B-2 Space Packet ved siden av primærhodet: et sekundærhode med en CCSDS 301.0-B-tidskode (CUC eller CDS, eksplisitt eller implisitt P-felt) og tilleggsdata, CRC-16-feltet for pakkefeilkontroll, segmentering av en Tester: <a1>space_packet_ext_oracle.rs</a1>.

seg-94f3381476ee = <b>VALIDATED</b> Koding og dekoding av primærhode i CCSDS 133.0-B Space Packet (versjon/type/sek.hode/APID/sekvensflagg/teller/datalengde) + et scenario for rammer. Kan kjøres fra CLI/binding. Uavhengig referanse (ExternalDataset): spacepackets { "0.32.0" } (us-irs/spacepackets-py, R. Mueller, Apache-2.0), en uavhengig tredjepartsimplementasjon av CCSDS 133.0-B-2; kshanas encode_packet/decode_packet stemte byte for byte (primærhodet på 6 oktetter for { "33" } tilfeller + hele den kodede pakken for { "12" })

seg-bca17769398b = <s1>Forrige</s1>solar-system

seg-6ef772483f30 = <s1>Neste</s1>space-weather
