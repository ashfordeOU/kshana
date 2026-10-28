# docs--kind-space-packet: translations (pl)

seg-99ef7c1d552c = Rodzaj scenariusza silnika v{ $version }, rodzina <a1>Analiza misji, łącza i operacje kosmiczne</a1>. Wyłącznie doradczo: wynik analizy z narzędzia badawczo-inżynieryjnego; nie jest to sprzęt nawigacyjny z zatwierdzeniem typu ani usługa bezpieczeństwa życia. Każda etykieta tutaj pochodzi z silnika lub z macierzy weryfikacji; rodzaj ma status MODELLED, chyba że macierz mówi inaczej (jak zdobywa się etykietę: sekcja Evidence w README).

seg-8f1e7d3f5a07 = Strona rodziny: <a1>Analiza misji, łącza i operacje kosmiczne</a1>

seg-3068552e4ab4 = VALIDATED: wiersze <a1>macierzy weryfikacji</a1>, które wymieniają ten rodzaj.

seg-98151954f217 = false

seg-785f906eb194 = Źródło: <c1/>

seg-525499bc01cd = <c1/> (rodzaj scenariusza)

seg-de2448d74c2b = Ramkowanie CCSDS 133.0-B Space Packet Protocol: kodowanie syntetycznego strumienia pakietów TM/TC (6-oktetowy nagłówek główny + pole danych) oraz raport dekodowania nagłówka każdego pakietu, łącznej liczby oktetów i dokładnego obiegu kodowanie↔dekodowanie. Deterministyczne ramkowanie o dokładnym układzie bitów — warstwa interoperacyjności formatów pakietów agencji; NIE jest to certyfikacja zgodności (bez logiki nagłówka wtórnego, CRC ani segmentacji poza flagami).

seg-757dec59102b = Jeden przebieg <c1/> podsumowuje się tak: space-packet: zaramkowano { "4" } pakietów TM CCSDS-133.0 APID { "100" }, łącznie { "152" } oktetów, obieg dokładny (true)

seg-fd46ce63e6fc = Pola opcjonalne: <c1/>, <c2/>, <c3/>, <c4/>

seg-e3235e4d3760 = Przykład <c1/> ustawia między innymi:

seg-f5bc99396b7d = { "00" } { "64" } { "40" } { "00" } { "00" } 1F

seg-f336ba92871f = Etykieta wyniku (silnika): ramkowanie nagłówka głównego CCSDS 133.0-B Space Packet — dokładny, deterministyczny układ bitów, obieg kodowanie↔dekodowanie zweryfikowany; NIE jest to certyfikacja zgodności (bez logiki nagłówka wtórnego, CRC ani segmentacji poza flagami)

seg-af1cf9aa9938 = Wykres zapisany przez silnik dla scenarios/space-packet.toml, rodzaj space-packet

seg-ff1f36904d38 = <b>VALIDATED</b> Kodowanie i dekodowanie nagłówka głównego CCSDS 133.0-B Space Packet (wersja/typ/nagł. wtórny/APID/flagi sekwencji/licznik/długość danych) + scenariusz ramkowania. Testy: <a1>ccsds_space_packet_reference.rs</a1>.

seg-82c617034322 = <b>VALIDATED</b> Rozszerzenia CCSDS 133.0-B-2 Space Packet obok nagłówka głównego: nagłówek wtórny niosący kod czasu CCSDS 301.0-B (CUC lub CDS, jawne lub niejawne pole P) i dane pomocnicze, pole kontroli błędów pakietu CRC-16, segmentacja a Testy: <a1>space_packet_ext_oracle.rs</a1>.

seg-94f3381476ee = <b>VALIDATED</b> Kodowanie i dekodowanie nagłówka głównego CCSDS 133.0-B Space Packet (wersja/typ/nagł. wtórny/APID/flagi sekwencji/licznik/długość danych) + scenariusz ramkowania. Uruchamialne z CLI/bind. Wyrocznia (ExternalDataset): spacepackets { "0.32.0" } (us-irs/spacepackets-py, R. Mueller, Apache-2.0) — niezależna implementacja CCSDS 133.0-B-2 od zewnętrznego autora; encode_packet/decode_packet z kshana zgodne bajt w bajt (6-oktetowy nagłówek główny dla { "33" } przypadków + pełny zakodowany pakiet dla { "12" })

seg-bca17769398b = <s1>Poprzednia</s1>solar-system

seg-6ef772483f30 = <s1>Następna</s1>space-weather

seg-2ac27c1e55c0 = oktet
