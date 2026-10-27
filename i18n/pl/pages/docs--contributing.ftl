# docs--contributing: translations (pl)

seg-c3c260b7063e = Testy

seg-5dce5694e6ec = Źródło: <c1/>

seg-3fa173b79e8f = Współtworzenie { -brand }

seg-c3a47c614836 = Dziękujemy za zainteresowanie. { -brand } ma być <b>neutralnym, odtwarzalnym, rzetelnie sprawdzonym względem niezależnych wzorców</b> punktem odniesienia dla hybrydowego kwantowo-klasycznego PNT. Wkład jest oceniany według tego progu: poprawność, cytowania i odtwarzalność przed zakresem.

seg-5a82a55f7fb2 = Sposób zarządzania projektem — kto decyduje, jaki jest próg techniczny i gdzie przebiega granica między otwartym a zamkniętym — opisano w <a1><c1/></a1>.

seg-cc8491af7a6f = Rozwój

seg-0163ccdfaa2b = Opcjonalne wiązania językowe są włączane cechami i domyślnie wyłączone (więc powyższa kompilacja i bramka audytu zależności nigdy ich nie dotykają). Aby nad nimi pracować:

seg-edc8bbab6e92 = Przed każdym zatwierdzeniem — szybka pętla

seg-6a7eda7d82b7 = Trwa to kilka sekund. To podzbiór zadania <c2/> z <c1/>, w tej samej kolejności, więc porażka tutaj jest porażką tam:

seg-d62c1fe22fc4 = <b>Odtwarzalność jest twardą niezmienniczą regułą.</b> Zmiana, która sprawia, że <c1/> jest niedeterministyczne, jest błędem. Losowość musi przepływać przez generator z ziarnem (seed); przebiegi kwantowe i klasyczne używają niezależnych, deterministycznie wyprowadzonych ziaren.

seg-66ea0748c10f = <b>Higiena repozytorium.</b> Zatwierdzenia i treść nie mogą zawierać stopek ani dopisków z automatyczną atrybucją narzędzia i nie mogą wskazywać asystenta AI jako autora nigdzie w treści, nazwach plików ani historii. Wymusza to strażnik.

seg-fbf423f6fb31 = Przed wypchnięciem — pełna bramka

seg-a9176352d3b4 = <c1/> to kanoniczna bramka: uruchamia <c2/> w całości, a następnie <c3/>, aby kilka razy ponownie uruchomić zestaw biblioteki, ponieważ wyścig przeplotu wątków jest niewidoczny w pojedynczym przebiegu. Tylko po sukcesie zapisuje <c4/> (nieśledzony — stan maszyny dotyczący jednego przebiegu, a nie treść).

seg-29815bd89ce2 = Jest celowo wolna — 62-79 minut w zdrowym stanie ustalonym, według nagłówka <c1/>, który zawiera bieżącą wartość — i nie ma limitu czasu, ponieważ limit na tyle krótki, by był użyteczny, zabiłby zdrowy przebieg. Przebieg podzbioru, który wyszedł na zielono, nie jest bramką: oba defekty, dla których ten mechanizm istnieje, przeszły właśnie tą drogą.

seg-408da9a8b8bb = Osoby pracujące z forka nie potrzebują haka potwierdzenia — to lokalna bramka opiekuna, a <b>to CI faktycznie bramkuje pull request</b>. Uruchomienie <c1/> przed otwarciem pull requesta oznacza po prostu, że CI nie powie ci niczego, czego jeszcze nie wiesz.

seg-9394727b21c3 = Dodawanie lub zmiana modelu czujnika

seg-d9c891ca6827 = <b>Każdy parametr liczbowy wymaga pochodzenia.</b> Umieść cytowanie w ciągu <c1/> modelu i w pliku scenariusza. Żadnych anonimowych stałych.

seg-d30cb836d4c4 = <b>Sprawdzaj względem standardowej zależności,</b> a nie tylko spójności wewnętrznej — np. odchylenie Allana dla zegarów, narastanie błędu nawigacji zliczeniowej według Grovesa dla czujników inercyjnych, przeliczenie czas→odległość dla transferu czasu. Dodaj test, że symulowany wynik odtwarza opublikowaną wartość lub wartość z zależności w podanej tolerancji.

seg-b52dd0dd550e = <b>Bądź rzetelny co do dojrzałości.</b> Rejestr statusów to <c1/> — dodaj lub popraw tam wiersz, wskaż jego zewnętrzną wyrocznię (lub powiedz wprost, że jej nie ma, co czyni go <c2/>), a następnie wygeneruj ponownie opublikowane artefakty za pomocą <c3/>. <c4/>, <c5/> i <c6/> są generowane z tej funkcji i z powodu mówią „nie edytować ręcznie”. Zaktualizuj też narrację <c7/>, gdy tekst tego wymaga, i oznaczaj wartości będące celami lub wynikami demonstratora naziemnego jako takie.

seg-34b9c8b6f70c = Programowanie sterowane testami: najpierw napisz test, który zawodzi, z oczekiwaną wartością <b>wyprowadzoną ręcznie</b> z fizyki lub zależności, zanim zaimplementujesz.

seg-5322d5b2188c = Testy deterministyczne sprawdzają dokładne (wyprowadzone ręcznie) wartości; testy statystyczne sprawdzają podaną tolerancję i najlepiej uśredniają po ziarnach, aby kontrolować rozrzut.

seg-7f76a26c4d5f = Zatwierdzenia i wersjonowanie

seg-a1cfb9064694 = <b>Conventional Commits</b> (<c1/>, <c2/>, <c3/>, <c4/>, <c5/> …).

seg-1a13616ca0ac = <b>Semantic Versioning.</b> Przed 1.0 schemat scenariusza i wyniku może się zmieniać; zaznaczaj zmiany niezgodne wstecz.

seg-0e3036c27aa8 = <b>Wydania powstają przez tag <c1/>, a publikacja jest automatyczna, ale uporządkowana.</b> Przepływ Auto-tag wypycha tag, gdy CI jest zielone na <c2/> po podniesieniu wersji. Przepływ Release uruchamia pełną weryfikację na otagowanym zatwierdzeniu i dopiero gdy ta przejdzie, publikuje w crates.io, Python Package Index (PyPI), npm, ghcr.io, rejestrze Model Context Protocol (MCP) i JetBrains Marketplace; następnie sprawdza, czy każdy kanał serwuje tę wersję, i przebudowuje kshana.dev z tagu. Nikt nie uruchamia <c3/> ręcznie. Kroki i sposób ponowienia nieudanej publikacji są w <a1><c4/></a1>.

seg-18ca89a2c573 = Prowadzenie dziennika zmian (wymagane)

seg-1f7e1d73c2ef = Każda zmiana widoczna dla użytkownika aktualizuje <a1><c1/></a1>:

seg-1448e96afbbc = Dodaj wpis w sekcji <b><c1/></b>, w odpowiedniej grupie (<c2/> / <c3/> / <c4/> / <c5/> / <c6/> / <c7/>).

seg-76ddc53c752e = Przy wydaniu zmień nazwę <c1/> na nowe <c2/>, zacznij nowe <c3/>, podnieś <c4/> w <c5/> (aby <c6/> w JSON wyniku się zgadzało), zaktualizuj linki porównawcze na dole i otaguj <c7/>.

seg-ed680e59377c = Wpisy pisz zwięźle i z perspektywy użytkownika; linkuj zgłoszenia i pull requesty tam, gdzie to przydatne.

seg-fe83216ebeed = Pull request, który zmienia zachowanie bez wpisu w dzienniku zmian, jest niekompletny.

seg-776cd2ef0b0c = Kontrola eksportu

seg-d0f1db9798a6 = Odporność PNT i sensoryka kwantowa mogą podlegać kontroli eksportu towarów podwójnego zastosowania. Publiczne repozytorium ogranicz do ogólnych, opublikowanych modeli i metod. Wszystko, co przypomina wrażliwą eksportowo głębię odporności lub ochrony przed spoofingiem, należy do prywatnej nakładki, a nie tutaj. W razie wątpliwości zapytaj przed wniesieniem wkładu.

seg-506a29aafc12 = Licencja

seg-c0409a1226ca = { -brand } ma podwójną licencję (AGPL-3.0 <b>lub</b> licencja komercyjna od Ashforde OÜ — zob. <a1><c1/></a1>). Aby to nadal działało, wkład musi nadawać się do użycia na <b>obu</b> licencjach. Dlatego, wnosząc wkład, zgadzasz się, że:

seg-da7b02ac890c = twój wkład jest licencjonowany przychodząco na podstawie <b>AGPL-3.0-only</b>; oraz

seg-8d6ed0d3a17f = <b>udzielasz również Ashforde OÜ</b> bezterminowej, ogólnoświatowej, bezpłatnej, nieodwołalnej licencji na używanie, modyfikowanie i <b>ponowne licencjonowanie twojego wkładu jako części komercyjnie licencjonowanego wydania { -brand }</b> (tj. także na dystrybucję na niebędących AGPL warunkach komercyjnych). Zachowujesz prawa autorskie do swojego wkładu.

seg-3b1a0dd6b5aa = To lekkie podwójne udzielenie licencji — a nie przeniesienie praw autorskich — pozwala projektowi pozostać otwartym <em>i</em> oferować wydanie komercyjne. Jeśli nie możesz udzielić ({ "2" }) (na przykład w przypadku kodu należącego do pracodawcy), napisz o tym w pull requeście przed wniesieniem wkładu.

seg-6630d0ac4ad5 = <b>Wyjątek: <c1/>.</b> Ten katalog jest licencjonowany na <b>GPL-3.0-or-later</b> (zob. jego <c2/>) i jest poza licencją komercyjną. Wkłady do niego są licencjonowane przychodząco na GPL-3.0-or-later <b>wyłącznie</b>; udzielenie ({ "2" }) ich nie dotyczy.

seg-0a78a12b1188 = Podpisz każde zatwierdzenie, aby poświadczyć <a1>Developer Certificate of Origin</a1>: <c1/> (dodaje wiersz <c2/>).

seg-9f86d8f58b17 = <s1>Poprzednia</s1>Bezpieczeństwo

seg-fc760238e9a5 = <s1>Następna</s1>Zarządzanie
