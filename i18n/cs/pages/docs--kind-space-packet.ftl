# docs--kind-space-packet: translations (cs)

seg-99ef7c1d552c = Druh scénáře enginu v{ $version }, rodina <a1>Analýza misí, spoje a kosmické operace</a1>. Pouze poradní charakter: výstup analýzy z výzkumného a inženýrského nástroje; nejde o typově schválené navigační zařízení ani o službu z oblasti bezpečnosti života. Každý zdejší štítek je štítkem enginu nebo verifikační matice; druh je MODELLED, pokud matice neříká jinak (jak se štítek získává: oddíl Evidence v README).

seg-8f1e7d3f5a07 = Stránka rodiny: <a1>Analýza misí, spoje a kosmické operace</a1>

seg-2ac27c1e55c0 = oktet

seg-3068552e4ab4 = VALIDATED: řádky <a1>verifikační matice</a1>, které tento druh uvádějí.

seg-98151954f217 = false

seg-785f906eb194 = Zdroj: <c1/>

seg-525499bc01cd = <c1/> (druh scénáře)

seg-de2448d74c2b = Rámcování podle CCSDS 133.0-B Space Packet Protocol: kódování syntetického proudu paketů TM/TC (6oktetová primární hlavička + datové pole) a výpis dekódování hlavičky každého paketu, celkového počtu oktetů a přesného round-tripu kódování↔dekódování. Deterministické přesné rámcování podle bitového uspořádání — vrstva interoperability formátu paketů agentur; NENÍ to certifikace shody (bez logiky sekundární hlavičky/CRC/segmentace nad rámec příznaků).

seg-757dec59102b = Jeden běh <c1/> se shrnuje takto: space-packet: zarámovány { "4" } pakety TM CCSDS-133.0 APID { "100" }, celkem { "152" } oktetů, round-trip přesný (true)

seg-fd46ce63e6fc = Volitelná pole: <c1/>, <c2/>, <c3/>, <c4/>

seg-e3235e4d3760 = Příklad <c1/> mimo jiné nastavuje:

seg-f5bc99396b7d = { "00" } { "64" } { "40" } { "00" } { "00" } 1F

seg-5b3bc9761db4 = První

seg-52036320db9b = TM

seg-f336ba92871f = Popisek výsledku (z enginu): rámcování primární hlavičky CCSDS 133.0-B Space Packet — přesné, deterministické bitové uspořádání, round-trip kódování↔dekódování ověřen; NENÍ to certifikace shody (bez logiky sekundární hlavičky / CRC / segmentace nad rámec příznaků)

seg-af1cf9aa9938 = Graf, který engine zapisuje pro scenarios/space-packet.toml, druh space-packet

seg-ff1f36904d38 = <b>VALIDATED</b> Kódování/dekódování primární hlavičky CCSDS 133.0-B Space Packet (verze/typ/sek.-hlavička/APID/příznaky-posloupnosti/čítač/délka-dat) + scénář rámcování. Testy: <a1>ccsds_space_packet_reference.rs</a1>.

seg-82c617034322 = <b>VALIDATED</b> Rozšíření CCSDS 133.0-B-2 Space Packet vedle primární hlavičky: sekundární hlavička nesoucí časový kód CCSDS 301.0-B (CUC nebo CDS, explicitní nebo implicitní pole P) a pomocná data, pole kontroly chyb paketu CRC-16, segmentace Testy: <a1>space_packet_ext_oracle.rs</a1>.

seg-94f3381476ee = <b>VALIDATED</b> Kódování/dekódování primární hlavičky CCSDS 133.0-B Space Packet (verze/typ/sek.-hlavička/APID/příznaky-posloupnosti/čítač/délka-dat) + scénář rámcování. Spustitelné z CLI/bind. Orákulum (ExternalDataset): spacepackets { "0.32.0" } (us-irs/spacepackets-py, R. Mueller, Apache-2.0) — nezávislá implementace CCSDS 133.0-B-2 třetí strany; encode_packet/decode_packet systému kshana se shodovaly bajt po bajtu (6oktetová primární hlavička pro { "33" } případů + celý zakódovaný paket pro { "12" })

seg-bca17769398b = <s1>Předchozí</s1>solar-system

seg-6ef772483f30 = <s1>Další</s1>space-weather
