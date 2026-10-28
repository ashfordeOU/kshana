# docs--kind-quantum-trade: translations (pl)

seg-debc2f07db78 = true

seg-98151954f217 = false

seg-7400f24ec992 = MODELLED { "1" } · VALIDATED { "2" }: wiersze <a1>macierzy weryfikacji</a1>, które wymieniają ten rodzaj.

seg-7b2721b7588d = Rodzaj scenariusza silnika v{ $version }, rodzina <a1>Czujniki inercyjne, fuzyjne i kwantowe</a1>. Wyłącznie doradczo: wynik analizy z narzędzia badawczo-inżynieryjnego; nie jest to sprzęt nawigacyjny z zatwierdzeniem typu ani usługa bezpieczeństwa życia. Każda etykieta tutaj pochodzi z silnika lub z macierzy weryfikacji; rodzaj jest MODELLED, chyba że macierz stanowi inaczej (jak zdobywa się etykietę: sekcja Evidence w README).

seg-f7f12029e0ec = Strona rodziny: <a1>Czujniki inercyjne, fuzyjne i kwantowe</a1>

seg-496b17a8d3b9 = Strona tematu: <a1>QUANTUM-MODELS.md</a1>

seg-bb07c8ee153f = <b>PARTNER</b> Nie jest zapewniane — tylko modele wydajności; sprzęt na zimnych atomach/zegary należy do partnera. Wyrocznia (NoneKind): brak: dyscyplina należąca do partnera, z założenia bez modułu i bez testu

seg-51cac2f918e0 = Strona tematyczna: <a1>POSITIONING.md</a1>

seg-3a8c76a2396f = Źródło: <c1/>

seg-f9af2813532e = <c1/> (rodzaj scenariusza)

seg-eb55d253dd11 = Bilans PNT kwantowy a klasyczny ({ "13503" }): korzyść w holdover czasu i holdover inercyjnym kandydującego zegara (krzywa zmierzonego ADEV — oś obronności wyniku — lub kwantowa klasa zegara) wobec klasycznej klasy punktu odniesienia, z zastrzeżeniem o założeniu podłogi długiego tau dołączonym do artefaktu, plus obwiednia odporności w funkcji czasu bez GNSS. MODELLED; ilościowo ocenia (nigdy nie sprawdza) urządzenie partnera. Zegar kandydujący jest zmierzoną krzywą (<c1/> + <c2/>, równej długości, co najmniej { "2" } punkty; wygrywa, gdy podano obie postaci) lub <c3/>.

seg-4f470bc1d82c = Jeden przebieg <c1/> podsumowuje się tak: quantum-trade | kandydat measured-ADEV | holdover czasu 2621947s wobec 203s (12943.62x) | inercyjny 14108s wobec 378s (37.34x) | wybieg odporności 14108s | MODELLED [zastrzeżenie o założonej podłodze]

seg-2639560aeff2 = Pola wymagane: <c1/>, <c2/>, <c3/>, <c4/>

seg-d66f1ef84201 = Pola opcjonalne: <c1/>, <c2/>, <c3/>, <c4/>

seg-f2cc0830b53f = Przykład <c1/> ustawia między innymi:

seg-ee5bcbbe0167 = csac

seg-f5fa445702c6 = Etykieta wyniku (silnika): MODELLED — ilościowo ocenia (nigdy nie sprawdza) zegar lub czujnik partnera; nie wykazano w locie

seg-c74c63ffd859 = Wykres zapisany przez silnik dla scenarios/quantum-trade.toml, rodzaj quantum-trade

seg-93310aaa6ead = <b>VALIDATED</b> Odtworzenie potęgowe (white-FM + podłoga szumu czerwonego) metodą NNLS z opublikowanego zmierzonego odchylenia Allana przejścia zegara optycznego ⁸⁸Sr — odtwarzające σ_y(τ) i nagłówkowe skalowanie 4.7e-16/√τ dla krótkiego τ z prawdziwą zmierzoną podłogą długiego τ, a nie Testy: <a1>optical_clock_adev_reference.rs</a1>.

seg-fc46e95688ba = <b>VALIDATED</b> Dopasowanie NNLS zmierzonego ADEV, pasma spójności χ² NEES/NIS i dyskretna kowariancja szumu procesu van Loana zegara (wybieg holdover) — obliczeniowy trzon silnika bilansu Testy: <a1>scipy_reference.rs</a1>.

seg-6e2b62136cef = <b>MODELLED</b> Wczytanie zmierzonego ADEV (NNLS), tabela bilansu (holdover czasu i inercyjny + korzyść), obwiednia odporności w funkcji czasu; zastrzeżenie o podłodze dołączone do artefaktu.

seg-b577b8464cf7 = <b>VALIDATED</b> Dopasowanie NNLS zmierzonego ADEV, pasma spójności χ² NEES/NIS i dyskretna kowariancja szumu procesu van Loana zegara (wybieg holdover) — obliczeniowy trzon silnika bilansu. Wyrocznia (ExternalDataset): scipy { "1.17.1" } — optimize.nnls / stats.chi2.ppf / linalg.expm; NNLS+Q dokładnie, χ² <{ "5e-4" } przy roboczych stopniach swobody. Tylko jądra — wartości osiągów urządzeń pozostają obliczone na podstawie modelu (następny wiersz)

seg-6b8aa8cd6d3e = <b>MODELLED</b> Wczytanie zmierzonego ADEV (NNLS), tabela bilansu (holdover czasu i inercyjny + korzyść), obwiednia odporności w funkcji czasu; zastrzeżenie o podłodze dołączone do artefaktu. Uruchamialne z. Wyrocznia (ExternalDataset): jądro dopasowania zmierzonego ADEV→PSD (NNLS) zgadza się z scipy.optimize.nnls (tests/scipy_reference.rs / tests/quantum_vs_classical_pnt_trade_reference.rs) — niezależnym jądrem zewnętrznym; ale LICZBY bilansu ilościowo oceniają (nigdy nie sprawdzają) zegar lub CAI partnera, więc sam bilans pozostaje MODELLED, bez aureoli walidacji

seg-3d678f64e41c = MODELLED — ilościowo ocenia (nigdy nie sprawdza) zegar lub czujnik partnera; nie wykazano w locie (wynik <c1/>)

seg-20ba66ae9518 = Bilans PNT kwantowy a klasyczny ({ "13503" }): korzyść w holdover czasu i holdover inercyjnym kandydującego zegara (krzywa zmierzonego ADEV — oś obronności wyniku — lub kwantowa klasa zegara) wobec klasycznej klasy punktu odniesienia, z zastrzeżeniem o założeniu podłogi długiego tau dołączonym do artefaktu, plus obwiednia odporności w funkcji czasu bez GNSS. (katalog rodzajów (<c1/>))

seg-45a1d84eef18 = MODELLED; ilościowo ocenia (nigdy nie sprawdza) urządzenie partnera. (katalog rodzajów (<c1/>))

seg-15275d27252a = Oblicza korzyść w holdover czasu i holdover inercyjnym zegara KANDYDUJĄCEGO względem punktu odniesienia KLASYCZNEGO, plus obwiednię odporności w funkcji czasu bez GNSS. Podłogę kandydata wyznacza krzywa MEASURED nakładającego się ADEV zegara partnera (oś obronności wyniku), dopasowana nieujemną metodą najmniejszych kwadratów — więc bilans holdover opiera się na rzeczywistych danych, a nie na założonej podłodze długiego tau. (komentarz w pliku scenariusza, wiersze { "3" } do { "7" })

seg-ecbdbc9b163e = RZETELNY ZAKRES: MODELLED — OCENIA ILOŚCIOWO korzyść z zegara kwantowego partnera; NIE sprawdza urządzenia i nigdy nie pożycza wysp walidacji SGP4/Allan/IGS. Gdy podłoga któregokolwiek wiersza jest założoną wartością domyślną klasy, na artefakcie pojawia się zastrzeżenie o podłodze. Uruchomienie: kshana scenarios/quantum-trade.toml (komentarz w pliku scenariusza, wiersze { "9" } do { "12" })

seg-4b59ac409819 = Bilans PNT kwantowy a klasyczny i odporność bez GNSS ({ "13503" }) jest MODELLED, nie sprawdzony względem niezależnego wzorca zewnętrznego: podtwierdzenie jest sprawdzone zewnętrznie, ale cała możliwość składa się z elementów obliczonych na podstawie modelu, więc pozostaje obliczona na podstawie modelu. (macierz weryfikacji (docs/MODELLED-RATIONALE.md))

seg-e6498fae3ba7 = <s1>Poprzednia</s1>quantum-time-transfer

seg-50d4bbb7486b = <s1>Następna</s1>realtime-frame-eop
