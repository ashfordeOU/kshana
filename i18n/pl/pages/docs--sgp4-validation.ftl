# docs--sgp4-validation: translations (pl)

seg-3c513ef2fd3b = Wielkość

seg-09da3685124b = Źródło: <c1/>

seg-dd68e234a5cd = Sprawdzenie SGP4/SDP4 względem wzorca społeczności

seg-d7567fa218fe = Propagator orbit Kshana jest sprawdzony względem <b>kanonicznego wzorca społeczności</b> dla SGP4/SDP4 (SGP4: Simplified General Perturbations { "4" }; SDP4: Simplified Deep-space Perturbations { "4" }): wektorów weryfikacyjnych opublikowanych z Vallado et al., <em>„Revisiting Spacetrack Report #3”</em> (AIAA (American Institute of Aeronautics and Astronautics) 2006-6753), rozpowszechnianych jako <c1/> (testowe TLE (zestawy elementów dwuwierszowych)) i <c2/> (oczekiwany stan TEME (true equator, mean equinox) w każdej chwili). Jest to ten sam wzorzec, względem którego sprawdzają się publiczne implementacje w C++/Pythonie/MATLAB-ie, więc zbieżność wyników tutaj oznacza zbieżność z de facto standardem.

seg-b99fb640886c = Porównane stany wzorcowe

seg-b16a220a41b7 = (wszystkie wiersze w <c1/>, przypięte w teście)

seg-e7d45e243571 = Najgorszy błąd pozycji

seg-af3129dd345c = <b>{ "4.12" } mm</b> ({ "4.120e-6" } km, satelita { "23333" }; < <c1/> km tolerancji)

seg-01da72026e56 = Najgorszy błąd prędkości

seg-483a7f8f4104 = <b>{ "1.85e-9" } km/s</b> (satelita { "23333" }; < <c1/> km/s tolerancji)

seg-041cbc679ed7 = Objęte przypadki

seg-283f3c571a7c = SGP4 dla bliskiej Ziemi, SDP4 dla głębokiego kosmosu (księżycowo-słoneczne + rezonans { "12" } h/24 h) oraz celowe przypadki kodów błędów

seg-75c2bd004348 = Przypadki głębokiego kosmosu i rezonansowe mają szczególne znaczenie dla tego projektu: satelity GNSS (globalnego systemu nawigacji satelitarnej) krążą po orbitach ~{ "12" } h, które są orbitami głębokiego kosmosu i rezonansowymi, czego nie odtworzy model dwóch ciał + wiekowy J2, a SGP4/SDP4 potrafi.

seg-613697670501 = Metoda

seg-d753e2f76b4a = Implementacja (<c1/>) to pozbawiony zależności port Rust algorytmu Vallado z domeny publicznej; epoki liczone są w dniach od 1950, używany jest tryb <c2/> (nie <c3/>), a stałe grawitacyjne WGS-72 (WGS: World Geodetic System) są stosowane tak, jak określa wzorzec.

seg-ebc18c4cb8ad = Test (<c1/>) przetwarza dołączone pliki wzorcowe <c2/> i <c3/> (<c4/>), propaguje każdego satelitę testowego do każdej chwili odniesienia i stwierdza, że pozycja i prędkość TEME zgadzają się w granicach powyższych tolerancji. Liczba porównanych wierszy jest przypięta dokładnie na <c5/>, aby regresja pliku wzorcowego lub pomijania nie mogła po cichu zmniejszyć pokrycia.

seg-d0566d4db829 = Odtwórz to

seg-ba3ed7f0aba7 = Test wypisuje liczbę porównanych wierszy oraz najgorsze błędy pozycji i prędkości. Pliki wzorcowe są zatwierdzone w repozytorium, więc sprawdzenie jest w pełni offline i deterministyczne.

seg-4f539e17926e = Niezależne sprawdzenie krzyżowe względem crate <c1/>

seg-0c2d2752179f = Zbieżność z opublikowanym wzorcem dowodzi poprawności względem <em>tabeli</em>. Aby dowieść też poprawności względem <em>niezależnej implementacji</em>, <c1/> uruchamia powszechnie używaną niezależną bibliotekę SGP4 w Rust, crate <a1><c2/></a1> (neuromorphicsystems/sgp4, wersja { "2.4" }), na tych samych { "666" } wektorach AIAA i porównuje obie bazy kodu bezpośrednio. Obie są sterowane modelem grawitacji <b>WGS72</b> (World Geodetic System { "1972" }), w którym zdefiniowano wektory (domyślne <c3/> tego crate używa WGS84 (World Geodetic System { "1984" }), co różni się od wzorca WGS72 o ~km: to wybór modelowania, ujawniony uczciwie, a nie błąd).

seg-da0e4e6c9e96 = Reżim

seg-a6eefd68c27c = kshana ↔ wzorzec

seg-e725899898a3 = crate ↔ wzorzec

seg-427820fec0e7 = kshana ↔ crate

seg-6305527acfa4 = bliska Ziemi (LEO/MEO (LEO: niska orbita okołoziemska; MEO: średnia orbita okołoziemska))

seg-081e28a39101 = { "7.3e-9" } km

seg-e68c97a6528a = { "4.4e-10" } km

seg-4c34e8e2f4c4 = głęboki kosmos (nierezonansowe)

seg-12e758e04df0 = { "4.1e-6" } km

seg-db82b835dec9 = { "2.1e-7" } km

seg-d7d4f47417bc = rezonans głębokiego kosmosu (półdobowy)

seg-17007f8aada3 = { "8.1e-9" } km

seg-895ba7518ab3 = { "7.7e-9" } km

seg-be5a634658e5 = { "2.2e-9" } km

seg-6cf60f32cbcd = rezonans głębokiego kosmosu (1-dniowy)

seg-7698aecab6b4 = { "8.2e-9" } km

seg-60520079d492 = { "7.8e-9" } km

seg-c22876d62c29 = Dwie niezależne implementacje zgadzają się z dokładnością <b>submikronową</b> na orbitach bliskich Ziemi i rezonansowych oraz do <b>{ "4.12" } mm w najgorszym przypadku</b> we wszystkich reżimach: to ten sam { "4.12" } mm, który jest własnym odchyleniem Kshana od wzorca, czyli rozbieżność <em>jest</em> tym jednym przypadkiem głębokiego kosmosu, przy czym crate leży między Kshana a tabelą. Pełna tabela (z liczbą wierszy dla każdego reżimu i czterema patologicznymi przypadkami, które crate odrzuca przy konstrukcji) jest zatwierdzona w <a1><c1/></a1> i odtwarzana przez <c2/>.

seg-3aae516df868 = Stan „publikacji” tego wyniku

seg-2dd4b77c49d1 = Sama walidacja krzyżowa jest ukończona i znajduje się w repozytorium. Przesłanie wyniku do zewnętrznych miejsc (katalogu społeczności, krótkiej noty, zarchiwizowanego pod DOI (DOI: cyfrowy identyfikator obiektu) zapisu) jest działaniem opiekuna, śledzonym osobno w planie rozwoju; ten dokument to zapis w repozytorium, do którego te zgłoszenia by odsyłały.

seg-b36bbcc0a0c8 = <s1>Poprzednia</s1>EN { "16803" }

seg-4d5234d85d9f = <s1>Następna</s1>Sprawdzenie modelu sił

seg-6539dbb48bca = Niezależne sprawdzenie krzyżowe względem crate sgp4
