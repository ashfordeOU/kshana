# docs--kind-lunar-interop-export: translations (pl)

seg-debc2f07db78 = true

seg-1f17ef6a853e = Rodzaj scenariusza silnika v{ $version }, rodzina <a1>Przestrzeń księżycowa i cislunarna</a1>. Wyłącznie doradczo: wynik analizy z narzędzia badawczo-inżynieryjnego; nie jest to sprzęt nawigacyjny z zatwierdzeniem typu ani usługa bezpieczeństwa życia. Każda etykieta tutaj pochodzi od silnika lub z macierzy weryfikacji; rodzaj jest MODELLED, o ile macierz nie mówi inaczej (jak zdobywa się etykietę: sekcja Evidence w README).

seg-1c1eeb2dcaa0 = Strona rodziny: <a1>Przestrzeń księżycowa i cislunarna</a1>

seg-619127334cf3 = Żaden wiersz macierzy nie wymienia tego rodzaju po nazwie; etykieta na jego wyniku jest własną etykietą silnika, powyżej.

seg-834408a40783 = min

seg-d36e6d7d8a10 = Źródło: <c1/>

seg-fdf560e675f4 = <c1/> (rodzaj scenariusza)

seg-5a4dcb93a643 = Modelowany eksport interoperacyjności księżycowej: emituje księżycowy układ odniesienia, księżycową skalę czasu i księżycowe efemerydy w formach wymiany wyrównanych do LunaNet/IOAG, opartych na CCSDS, z obiegiem w obie strony / dopasowaniem pól do specyfikacji. WYKORZYSTUJE emiter i parser CCSDS OEM { "2.0" } z crate (crate::oem) oznaczone na nowo dla kontekstu księżycowego — REF_FRAME w OEM niesie księżycowy układ ciała IAU { "2015" } WGCCRE (MOON_ME / MOON_PA), TIME_SYSTEM księżycową skalę czasu (LTC / TCL / UTC), CENTER_NAME = MOON — dla przykładowych ilustracyjnych efemeryd klasy LCNS (pozycje z crate::lunar_service, prędkość przez różnicę skończoną). Emituje także deskryptor czasu księżycowego wyrównany do LunaNet/IOAG (identyfikator skali, tempo wtórne µs/dobę z crate::lunar_time, opublikowane pasmo, powierzchnia odniesienia), który wykonuje obieg w obie strony przez serde_json, i opakowuje artefakty w istniejącą kopertę KIF (crate::interchange) z etykietą rzetelności MODELLED. Podaje liczbę wyemitowanych artefaktów, liczbę wierszy OEM, dopasowanie pól do specyfikacji — zaliczenie + listę pól obecnych/brakujących, obieg OEM ok, obieg metadanych czasu ok oraz rozmiar KIF w bajtach. MODELLED — wyrocznią jest deterministyczny obieg w obie strony + dopasowanie nazw pól do opublikowanego CCSDS OEM + semantyki pól LunaNet/IOAG; NIE jest to certyfikowany test zgodności (conformance) interoperacyjności; ilustracyjne efemerydy ze źródeł publicznych, bez powiązań z ESA; bez TRL, dorobku ani poparcia agencji.

seg-1726861e444f = Jeden przebieg <c1/> podsumowuje się tak: lunar-interop-export | REF_FRAME MOON_ME / TIME_SYSTEM LTC | { "9" } stanów, OEM { "23" } wierszy | dopasowanie do specyfikacji PASS ({ "9" } obecnych / { "0" } brakujących) | obieg OEM w obie strony ok | obieg metadanych czasu w obie strony ok | KIF { "1640" } bajtów | MODELLED

seg-f8353e15aabd = Pola opcjonalne: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>

seg-169f9446e90d = Przykład <c1/> ustawia między innymi:

seg-b8135da5a99a = 2030-01-01T00:{ "00" }:{ "00" }

seg-3f36bd2ec5ea = LTC

seg-2ac27c1e55c0 = oktet

seg-0e86ff364c17 = Wykres, który silnik zapisuje dla scenarios/lunar-interop-export.toml, rodzaj lunar-interop-export

seg-98acb538942f = <b>MODELLED</b> Eksport księżycowego układu odniesienia + czasu + efemeryd wyrównany do LunaNet/IOAG (CCSDS OEM + KIF) z obiegiem w obie strony. Wyrocznia (InternalConsistency): księżycowy eksport OEM z kshana przeanalizowany ponownie przez niezależną zewnętrzną bibliotekę <c1/> (R. J. Anderson): znaczniki układu/czasu i stan w każdej epoce zgadzają się z dokładnością zapisu ({ "1" } mm / { "1e-9" } km/s), a eksport bez TIME_SYSTEM jest odrzucany — strukturalny obieg wymiany w obie strony; fizyczna semantyka księżycowego układu/czasu jest sprawdzona w jej własnych wierszach, więc ten pozostaje MODELLED. { "0.30" } porównanie zewnętrzne, ustalenie (pozostaje MODELLED): a se

seg-c9a1d76625d6 = MODELLED (wynik <c1/>)

seg-633bcd62ce93 = Emituje także deskryptor czasu księżycowego wyrównany do LunaNet/IOAG (identyfikator skali, tempo wtórne µs/dobę z crate::lunar_time, opublikowane pasmo, powierzchnia odniesienia), który wykonuje obieg w obie strony przez serde_json, i opakowuje artefakty w istniejącą kopertę KIF (crate::interchange) z etykietą rzetelności MODELLED. (katalog rodzajów (<c1/>))

seg-0e91697e3036 = MODELLED — wyrocznią jest deterministyczny obieg w obie strony + dopasowanie nazw pól do opublikowanego CCSDS OEM + semantyki pól LunaNet/IOAG; NIE jest to certyfikowany test zgodności (conformance) interoperacyjności; ilustracyjne efemerydy ze źródeł publicznych, bez powiązań z ESA; bez TRL, dorobku ani poparcia agencji. (katalog rodzajów (<c1/>))

seg-11d0ccba5ee7 = CO ROBI src/lunar_interop.rs: * export_lunar_oem — WYKORZYSTUJE emiter CCSDS OEM { "2.0" } z crate (crate::oem), oznaczony na nowo dla kontekstu księżycowego: REF_FRAME = księżycowy układ ciała IAU { "2015" } WGCCRE (MOON_ME / MOON_PA), TIME_SYSTEM = księżycowa skala czasu (LTC / TCL / UTC), CENTER_NAME = MOON, dla przykładowych ILLUSTRATIVE efemeryd klasy LCNS (pozycje z crate::lunar_service, prędkość przez centralną różnicę skończoną). * export_ (komentarz w pliku scenariusza, wiersze { "6" } do { "19" })

seg-f730e8f789cf = RZETELNOŚĆ: MODELLED. NAZWY pól i jednostki są wyrównane do standardów PUBLIC (CCSDS 502.0-B OEM, księżycowe układy IAU WGCCRE { "2015" }, specyfikacja interoperacyjności LunaNet / architektura księżycowa IOAG). Wyrocznią są deterministyczny obieg w obie strony i dopasowanie nazw pól. To NIE jest certyfikowany test zgodności (conformance) interoperacyjności. Efemerydy są ilustracyjne, ze źródeł publicznych, BEZ powiązań z ESA, i nie sugerują żadnego TRL (komentarz w pliku scenariusza, wiersze { "21" } do { "26" })

seg-254d48fe58a5 = Księżycowy eksport interoperacyjności ma poziom MODELLED, nie jest niezależnie sprawdzony względem wzorca zewnętrznego: sprawdzono go względem jego własnej tożsamości w postaci zamkniętej / analitycznej; wychwytuje błędy przepisania i współczynników, ale nie jest zewnętrzną wyrocznią. (macierz weryfikacji (docs/MODELLED-RATIONALE.md))

seg-07d6cc44724f = <s1>Poprzedni</s1>lunar-integrity

seg-9669cd9b1d04 = <s1>Następny</s1>lunar-jamming
