# docs--kind-oem-interop: translations (pl)

seg-99ef7c1d552c = Rodzaj scenariusza silnika v{ $version }, rodzina <a1>Analiza misji, łącza i operacje kosmiczne</a1>. Wyłącznie doradczo: wynik analizy z narzędzia badawczo-inżynieryjnego; nie jest to sprzęt nawigacyjny z zatwierdzeniem typu ani usługa bezpieczeństwa życia. Każda etykieta tutaj pochodzi z silnika lub z macierzy weryfikacji; rodzaj ma status MODELLED, chyba że macierz mówi inaczej (jak zdobywa się etykietę: sekcja Evidence w README).

seg-37d29d8303fe = km

seg-8f1e7d3f5a07 = Strona rodziny: <a1>Analiza misji, łącza i operacje kosmiczne</a1>

seg-3068552e4ab4 = VALIDATED: wiersze <a1>macierzy weryfikacji</a1>, które wymieniają ten rodzaj.

seg-4abcbdaddcf8 = Źródło: <c1/>

seg-a92dcafd670e = <c1/> (rodzaj scenariusza)

seg-dbffff25b57f = Most interoperacyjności CCSDS OEM: import komunikatu efemeryd orbitalnych (Orbit Ephemeris Message) wytworzonego przez zewnętrzne narzędzie dynamiki lotu (GMAT, Orekit i STK emitują OEM) i raport o jego segmentach, obiektach, układach odniesienia i przedziale epok oraz kontrola spójności prędkości; bez danych wejściowych wykonuje obieg tam i z powrotem wygenerowanej orbity odniesienia i podaje wierność importu względem eksportu. Strukturalna i fizyczna kontrola wczytania MODELLED, NIE walidacja dokładności orbity źródła.

seg-21eb1c9d7571 = Jeden przebieg <c1/> podsumowuje się tak: oem-interop: obieg tam i z powrotem { "2" } segmentów, { "12" } stanów; maksymalny błąd obiegu { "4.88e-7" } km / { "4.61e-10" } km/s (interoperacyjność MODELLED)

seg-54c35d9fbfd9 = Pola opcjonalne: <c1/>

seg-d4117f615cd8 = Przykład <c1/> ustawia między innymi:

seg-d7db74d14617 = KSHANA

seg-b16f858574ca = Etykieta wyniku (silnika): MODELLED — most interoperacyjności importu i obiegu CCSDS OEM (GMAT, Orekit i STK emitują OEM); strukturalna i fizyczna kontrola wczytania, NIE walidacja dokładności orbity źródła

seg-5db5a7c812ca = Wykres zapisany przez silnik dla scenarios/oem-interop.toml, rodzaj oem-interop

seg-cd29f08ef235 = <b>VALIDATED</b> Importer CCSDS { "502.0" } OEM (parse_oem), tolerancyjny wobec wierszy COMMENT, dodatkowych słów kluczowych metadanych i bloków kowariancji oraz dokładna odwrotność zapisu; obieg tam i z powrotem oraz wczytanie pliku zewnętrznego z kontrolą spójności prędkości. Testy: <a1>ccsds_oem_interop_reference.rs</a1>.

seg-20071a16b316 = <b>VALIDATED</b> Importer CCSDS { "502.0" } OEM (parse_oem), tolerancyjny wobec wierszy COMMENT, dodatkowych słów kluczowych metadanych i bloków kowariancji oraz dokładna odwrotność zapisu; obieg tam i z powrotem + . Wyrocznia (ExternalDataset): niezależny parser CCSDS-502 od zewnętrznego autora, <c1/> { "0.4.5" } (MIT, <a1>https://pypi.org/project/oem/</a1>) — oddzielna baza kodu, która dekoduje bajt w bajt OEM EME2000/UTC emitowany przez kshana ({ "24" } stanów w { "2" } plikach testowych, Δ położenia i prędkości = { "0" }) i której ścisły czytnik potwierdza tokeny metadanych; parser kshana również zgadza się z nim na dołączonym zewnętrznym pliku OEM. Dwa rzetelne ustalenia dotyczące interoperacyjności (biblioteka oem odrzuca per-satellite mu

seg-7ab6bb7a1b8a = MODELLED — most interoperacyjności importu i obiegu CCSDS OEM (GMAT, Orekit i STK emitują OEM); strukturalna i fizyczna kontrola wczytania, NIE walidacja dokładności orbity źródła (wynik <c1/>)

seg-343a56c07d02 = Strukturalna i fizyczna kontrola wczytania MODELLED, NIE walidacja dokładności orbity źródła. (katalog rodzajów (<c1/>))

seg-44aba1ad1d37 = RZETELNY ZAKRES: strukturalna i fizyczna kontrola wczytania MODELLED, NIE walidacja dokładności orbity efemeryd źródłowych. Uruchomienie: kshana scenarios/oem-interop.toml (komentarz w pliku scenariusza, wiersze { "11" } do { "13" })

seg-833df8eedc34 = <s1>Poprzednia</s1>ntn-positioning

seg-28254e1b38d4 = <s1>Następna</s1>optical-atmosphere
