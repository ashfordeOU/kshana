# docs--kind-space-packet: translations (da)

seg-99ef7c1d552c = Scenarietype i motoren v{ $version }, familien <a1>Missionsanalyse, forbindelser og rumoperationer</a1>. Vejledende: analyseoutput fra et forsknings- og udviklingsværktøj, ikke typegodkendt navigationsudstyr og ikke en tjeneste til beskyttelse af menneskeliv. Hver etiket her er motorens eller verifikationsmatrixens; en type er MODELLED, medmindre matrixen siger andet (hvordan en etiket optjenes: afsnittet Evidence i README'en).

seg-8f1e7d3f5a07 = Familieside: <a1>Missionsanalyse, links og rumoperationer</a1>

seg-3068552e4ab4 = VALIDATED: rækkerne i <a1>verifikationsmatrixen</a1>, som nævner denne type.

seg-98151954f217 = false

seg-2ac27c1e55c0 = oktet

seg-785f906eb194 = Kilde: <c1/>

seg-525499bc01cd = <c1/> (scenarietype)

seg-de2448d74c2b = Indramning efter CCSDS 133.0-B Space Packet Protocol: kodér en syntetisk TM/TC-pakkestrøm (primær header på 6 oktetter + datafelt) og rapportér afkodningen af headeren for hver pakke, samlet antal oktetter og en nøjagtig rundtur mellem kodning og afkodning. Deterministisk indramning med nøjagtigt bitlayout — organisationernes lag for interoperabilitet mellem pakkeformater; IKKE en certificering af overensstemmelse (ingen logik for sekundær header, CRC eller segmentering ud over flagene).

seg-757dec59102b = Én kørsel af <c1/> opsummeres som: space-packet: indrammede { "4" } CCSDS-133.0 TM-pakke(r) APID { "100" }, { "152" } oktetter i alt, rundtur nøjagtig (true)

seg-fd46ce63e6fc = Valgfrie felter: <c1/>, <c2/>, <c3/>, <c4/>

seg-e3235e4d3760 = Eksemplet <c1/> angiver blandt andet:

seg-f5bc99396b7d = { "00" } { "64" } { "40" } { "00" } { "00" } 1F

seg-5b3bc9761db4 = Første

seg-52036320db9b = TM

seg-f336ba92871f = Resultatetiket (motorens egen): indramning af primær header for CCSDS 133.0-B Space Packet — nøjagtigt, deterministisk bitlayout, rundtur mellem kodning og afkodning verificeret; IKKE en certificering af overensstemmelse (ingen logik for sekundær header, CRC eller segmentering ud over flagene)

seg-af1cf9aa9938 = Diagrammet, som motoren skriver for scenarios/space-packet.toml, type space-packet

seg-ff1f36904d38 = <b>VALIDATED</b> Kodning/afkodning af primær header i CCSDS 133.0-B Space Packet (version/type/sec-hdr/APID/seq-flags/count/data-length) + et scenarie for indramning. Tests: <a1>ccsds_space_packet_reference.rs</a1>.

seg-82c617034322 = <b>VALIDATED</b> Udvidelser af CCSDS 133.0-B-2 Space Packet ved siden af den primære header: en sekundær header med en tidskode efter CCSDS 301.0-B (CUC eller CDS, eksplicit eller implicit P-felt) og hjælpedata, CRC-16-feltet for pakkens fejlkontrol, segmentering af en Tests: <a1>space_packet_ext_oracle.rs</a1>.

seg-94f3381476ee = <b>VALIDATED</b> Kodning/afkodning af primær header i CCSDS 133.0-B Space Packet (version/type/sec-hdr/APID/seq-flags/count/data-length) + et scenarie for indramning. Kan køres fra CLI/bind. Uafhængig reference (ExternalDataset): spacepackets { "0.32.0" } (us-irs/spacepackets-py, R. Mueller, Apache-2.0) — en uafhængig tredjepartsimplementering af CCSDS 133.0-B-2; kshanas encode_packet/decode_packet stemte byte for byte (den primære header på 6 oktetter for { "33" } tilfælde + den fulde kodede pakke for { "12" })

seg-bca17769398b = <s1>Forrige</s1>solar-system

seg-6ef772483f30 = <s1>Næste</s1>space-weather
