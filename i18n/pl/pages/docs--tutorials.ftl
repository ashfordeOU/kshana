# docs--tutorials: translations (pl)

seg-3a0e724a8a2b = Poziom

seg-501402fc366f = Holdover zegara

seg-cae10fb9bff8 = Scenariusz

seg-a0b63210b807 = Czytaj dalej

seg-a7cfe6f135f1 = Orbita i geometria

seg-835df2d05f2a = Dziedzina pomiarowa GNSS

seg-28e87f407a10 = Dziedzina

seg-d6476863f862 = Możliwość

seg-029de6b99be0 = Nawigacja zliczeniowa inercyjna

seg-9ef8f99ca6e4 = Transfer czasu

seg-b03d56f501c3 = Rodzaj

seg-ec26df467b88 = Łączna fuzja czujników PNT filtrem Kalmana na tych samych hybrydowych danych wejściowych.

seg-4f19d4fb1341 = Ogólny przegląd N-wymiarowy dowolnego pakietu przez kluczowe TOML z kropkami / ścieżki metryk JSON.

seg-e7ab7b55c969 = Przegląd 1-wymiarowy badania kompromisów po parametrze pakietu zegara.

seg-e43910de5fd8 = Notatniki

seg-d78822583c64 = Notebook

seg-3959aefa12be = Źródło: <c1/>

seg-a5ebe4befda8 = Praktyczne, rozwiązane przykłady, które prowadzą od „uruchom dostarczony scenariusz” do „zmierz i obroń wynik”. Każda liczba przytoczona w trzech samouczkach jest rzeczywistym wynikiem silnika, opartym na zewnętrznej (niekołowej) wiarygodnej wyroczni i <b>przypiętym przez test integracyjny</b> (<c1/>), więc samouczek nigdy po cichu nie rozjedzie się z tym, co silnik faktycznie robi. Jeśli samouczek mówi, że zegar optyczny utrzymuje { "6600" } s, test zatrzyma kompilację w dniu, w którym przestanie to być prawdą.

seg-1c045624a6be = Kshana to symulator pozycjonowania, nawigacji i czasu (PNT). Samouczki używają jeszcze kilku skrótów, każdy rozwinięty przy pierwszym wystąpieniu: GNSS (globalny system nawigacji satelitarnej), GPS (Global Positioning System), CLI (interfejs wiersza poleceń) i TOML (Tom's Obvious Minimal Language, format plików scenariuszy).

seg-7a84a80b57d5 = Jesteś nowy w projekcie? Najpierw przeczytaj <a1>wprowadzenie do pojęć</a1> i <a2>słownik</a2>, a potem wróć tutaj.

seg-b4cd44590347 = Trzy rozwiązane przykłady

seg-eebeab9693b2 = Samouczek

seg-a0bc6e585d71 = Czego się uczysz

seg-b6cc01b76947 = Rodzaj scenariusza

seg-429bab0a0e05 = Trudność

seg-0e188f9c0f65 = ~Czas

seg-bcf40448e55d = Moja pierwsza orbita: gdzie są satelity GPS

seg-de1032024a69 = propagacja rzeczywistej konstelacji GPS, odczyt dostępności, współczynnika rozmycia dokładności pozycji (PDOP) i dokładności pozycji oraz eksport rzeczywistego położenia satelitów (format precyzyjnych orbit SP3)

seg-e7b6c262333e = początkujący

seg-d6042fb74a5f = { "15" } min

seg-07a8d6cfc1ae = Holdover zegara: jak długo można dryfować

seg-0e9c77468fb2 = uruchomienie holdover zegara bez GNSS, odczyt wskaźnika jakości czasu i zrozumienie stojącego za nim prawa wzrostu √(q_wf·T)

seg-0f6fba31626a = { "20" } min

seg-7973e9c54366 = Odporność GNSS: kwantowa a klasyczna

seg-4d8036091b37 = zwieńczenie: detektor spoofingu (<c1/>) i pełny zestaw PNT z fuzją (<c2/>) oraz sposób łącznego czytania bezpieczeństwa, integralności i nawigacji zliczeniowej

seg-1b39d4927602 = średniozaawansowany

seg-ea37ac575235 = { "35" } min

seg-1d56222dfd25 = Uruchamialne notatniki Jupyter, na danych syntetycznych i publicznych zestawach elementów przechowywanych wyłącznie w repozytorium, znajdują się w <a1><c1/></a1>:

seg-9aae3a4e10dc = Zaufanie na statku i szkolenie

seg-1d680d635c6d = wygeneruj syntetyczny strumień NMEA z mostka ze scenariuszowym zdarzeniem, a następnie oceń go monitorami zaufania statku (wyłącznie doradczo, nie jest to sprzęt nawigacyjny z zatwierdzeniem typu)

seg-739f8f5a9082 = gdzie dane nawigacyjne wyglądały na zdegradowane i jaką część trasy to obejmuje

seg-443c908ff49b = Mapowanie compliance i eksport test-bench

seg-0d639065192a = które wiersze publicznych ram dostarczają dowodów na zestaw przebiegów (nigdy że ramy są spełnione) oraz ruch i zdarzenia scenariusza wyeksportowane jako tekst dla laboratoryjnego symulatora GNSS (nie jest zapisywany żaden sygnał)

seg-981a3238794d = GDOP: kwantowy a klasyczny

seg-228ce150ee80 = ta sama geometria konstelacji z czujnikiem kwantowym i klasycznym, porównana współczynnikiem rozmycia dokładności

seg-4b82b5edd4ff = Geometria nieba pod linią zabudowy

seg-1186b6cd6149 = satelity widoczne z miejsca pod linią zabudowy ulicy lub nabrzeża, ich DOP i elipsa błędu, datowane niebo z zestawów elementów oraz Monte Carlo z ziarnem względem kowariancji (MODELLED)

seg-d9d06cb8e237 = Jak uruchomić samouczek

seg-ffc4ddfc9426 = Każdy samouczek uruchamia ten sam scenariusz na trzy sposoby; wybierz ten, który ci odpowiada. Wszystkie wywołują <em>jeden</em> silnik, więc liczby są identyczne (odpowiada to sekcji <a1>Użycie</a1> w README).

seg-e7ba76a06aa6 = <b>Wiersz poleceń.</b> CLI wybiera działanie według pola <c1/> scenariusza i zapisuje <c2/>, <c3/>, <c4/> i <c5/> obok pliku wejściowego (JSON to JavaScript Object Notation, SVG to Scalable Vector Graphics, HTML to HyperText Markup Language). Kilka rodzajów publikuje też tabelę odtwarzalności jako <c6/> (wartości rozdzielane przecinkami): <c7/>, <c8/>, <c9/>, <c10/>, <c11/> oraz <c12/>, gdy ustawiono miejsce eksportu. Żaden z trzech samouczków nie jest takim rodzajem, więc tego pliku tutaj nie zobaczysz.

seg-5ee6f15d3b08 = <c1/> buduje CLI z tego checkoutu. Z zainstalowanym plikiem binarnym (<c2/>) to samo polecenie to <c3/>. Bez checkoutu większość dostarczanych scenariuszy jest wbudowana w plik binarny: <c4/> je wymienia (i wskazuje te nieliczne, które nie są wbudowane, wraz z powodem), a <c5/> zapisuje jeden z nich: kopię <c6/>, z którą zbudowano plik binarny.

seg-1b7e851749d5 = <b>Python.</b> Zbuduj raz rozszerzenie z tego checkoutu za pomocą maturin, w aktywnym środowisku wirtualnym, a następnie wywołaj <c1/>:

seg-3aa10d551694 = <c1/> instaluje zamiast tego opublikowany wheel. Może on pozostawać w tyle za tym checkoutem: <c2/> pokazuje, które rodzaje scenariuszy ma twoja kompilacja.

seg-333b7956b06b = <b>Piaskownica w przeglądarce.</b> Bez instalacji: otwórz <a1>Studio</a1>, wybierz scenariusz, zmień parametry i odczytaj wynik. Nic nie jest wysyłane; silnik działa po stronie klienta jako WebAssembly.

seg-2cd8bbd1e7f0 = Samouczki podają polecenia <b>CLI</b>, ale każde polecenie ma powyższy odpowiednik w Pythonie i w piaskownicy. Każdy wynik jest odtwarzalny z <c1/>: uruchom go dwa razy, a otrzymasz identyczne co do bitu wyniki.

seg-d497caeb889a = Opatrzone komentarzami scenariusze dydaktyczne

seg-c966709a600d = Dla każdej dziedziny możliwości istnieje jeden obficie skomentowany plik <c1/> w <a1><c2/></a1>: <em>kopia dydaktyczna</em> scenariusza kanonicznego, z każdym polem objaśnionym w treści, wskazaną przywołaną wyrocznią i oczekiwanym jednowierszowym podsumowaniem zapisanym jako komentarz <c3/>. Wartości pól są identyczne z wartościami scenariusza nadrzędnego w katalogu najwyższego poziomu repozytorium <c4/> (<c5/> porównuje sparsowany TOML), więc udokumentowany wynik pozostaje prawdziwy. Złote skróty również pozostają nietknięte: komentarz nigdy nie zmienia skrótu scenariusza.

seg-871fcecc5ee1 = Plik dydaktyczny

seg-4e852a6a1581 = Pochodzi z

seg-e74e1c9b387e = Integralność (RAIM, autonomiczne monitorowanie integralności przez odbiornik)

seg-95b6cceb76e6 = Bezpieczeństwo (spoofing)

seg-dab48471c270 = Hybrydowe PNT

seg-c889e5e77121 = Plik dydaktyczny dla <b>bezpieczeństwa</b> używa wewnątrz <c1/>: wskaźnik jakości bezpieczeństwa (<c2/>, jeden minus prawdopodobieństwo niewykrycia) jest wytwarzany przez pakiet spoof. Nazwa pliku odpowiada <em>możliwości</em> (bezpieczeństwo), a <c3/> odpowiada <em>pakietowi</em> (spoof). Nagłówek tego pliku zwraca na to uwagę.

seg-89fef83a9d54 = Pełny katalog rodzajów scenariuszy

seg-0f744a3a7193 = Holdover zegara względem specyfikacji; opcjonalny zespół Monte Carlo (<c1/>).

seg-9a2564fdc86a = Nawigacja zliczeniowa inercjalna 1-DOF (jeden stopień swobody) podczas przerwy w GNSS.

seg-62f0400581b3 = Dostępność GNSS i rozmycie dokładności (DOP) z konstelacji (Walker / elementy dwuwierszowe / RINEX, Receiver Independent Exchange format).

seg-59fc8330ba12 = Snapshot / rozdzielenie rozwiązań / ARAIM (advanced RAIM) z poziomymi i pionowymi poziomami ochrony (HPL/VPL) oraz diagramem Stanforda.

seg-22c598d57e77 = Przejście ARAIM z poziomami ochrony na biegunie południowym Księżyca względem zestawu przekaźników LunaNet.

seg-f97d8fb3b6fa = Dwukierunkowy transfer czasu i częstotliwości: optyczny a radiowy (RF).

seg-8af1c652d854 = Zwieńczenie hybrydowego PNT: zegar + jednostka inercjalna (IMU) + wspomaganie transferem czasu.

seg-d24a9596f53e = Rozszerzony filtr Kalmana stanu błędu GNSS/INS (inertial navigation system) w wersji luźno i ściśle sprzężonej.

seg-3c915870476a = Symulacja pseudoodległości w dziedzinie pomiarów (jonosfera Klobuchara, troposfera Saastamoinen/Niell) + RAIM.

seg-72284bad54e4 = Jamming w bilansie łącza: stosunek mocy zakłócenia do sygnału (J/S) → efektywna gęstość stosunku nośnej do szumu (C/N₀) → utrata synchronizacji.

seg-2ead4d42b427 = Stochastyczny detektor spoofingu czasu (Neyman–Pearson / χ²₁) z prawdopodobieństwami fałszywego alarmu i niewykrycia metodą Monte Carlo (P_fa/P_md).

seg-5f2f9e63093a = Poza samouczkami: nowsze możliwości

seg-3d6a8fd31402 = Trzy samouczki pozostają przy klasycznych pakietach zegara, orbity i bezpieczeństwa. Silnik rozwinął się daleko poza nie. Każdy wiersz poniżej to dostarczony scenariusz, który można uruchomić w obecnej postaci (<c1/> lub <c2/>); podsumowanie to pierwszy wiersz, który kshana { "0.35.0" } wypisała dla niego dnia 2026-10-10. W odróżnieniu od wartości z samouczków te wiersze są zapisem jednego przebiegu i nie są przypięte przez <c3/>: aby poznać bieżącą wartość, uruchom scenariusz ponownie. Wyniki podają własny zakres (większość ma <c4/>), a <a1>macierz weryfikacji</a1> wskazuje, które możliwości są VALIDATED względem zewnętrznej wyroczni, a które MODELLED.

seg-2dc1d8680abb = Pierwszy wiersz podsumowania

seg-abd799395f27 = Widmo pasma L i wodospad zagłuszania

seg-33453b2cfdf3 = Układ Słoneczny w jednej epoce

seg-23bc4ff7f741 = Pozycjonowanie wokół innego ciała

seg-c135b151e469 = Projektowanie konstelacji na dużą skalę

seg-065995e9bd5e = Kampanie: rodzaje połączone w jednej osi czasu

seg-dbae357e7e34 = Jeden system LEO-PNT od początku do końca

seg-9d3d72ea03df = Połączone pozycjonowanie MEO + LEO

seg-acc2793d1721 = Sygnały LEO, przeloty i komunikaty nawigacyjne

seg-db2626e54a24 = <c1/> (przelot)

seg-319ddeeb8205 = <a1>LEO-SIGNAL.md</a1>, <a2>LEO-PASS.md</a2>, <a3>LEO-NAVMSG.md</a3>

seg-aa93235e8c6d = Zbieżność PPP z warstwą LEO; pozycjonowanie 5G

seg-01160980ce50 = Odporność: GNSS zagłuszony, LEO prowadzi użytkownika

seg-adf8453bc035 = Zastosowania branżowe: kolej, żegluga, telekomunikacja, pojazdy, Arktyka

seg-15a5098b5045 = <c1/> (i pozostałe pliki <c2/>)

seg-e6494ed83ee3 = Holdover w telekomunikacji względem limitów zegara ITU-T (International Telecommunication Union, Telecommunication Standardization Sector) G.8272

seg-dfc04f1abe82 = LEO to niska orbita okołoziemska, a MEO to średnia orbita okołoziemska; PVT to pozycja, prędkość i czas; PPP to precyzyjne pozycjonowanie punktowe; 5G to piąta generacja standardu sieci komórkowych; TDB to czas dynamiczny barycentryczny; JD to data juliańska; TE to błąd czasu.

seg-1d45d94f2e5b = CLI dodaje trzy wyniki do każdego przebiegu:

seg-893276648fec = <b>Raporty.</b> Każdy przebieg zapisuje <c1/> i <c2/> (zob. <a1>REPORTS.md</a1>). <c3/> uruchamia zestaw scenariuszy do jednego <c4/> i <c5/>, na przykład <c6/>.

seg-e9f06d47c82c = <c1/> renderuje szeregi czasowe przebiegu, na przykład <c2/> dla <c3/> zapisuje <c4/>. Rodzaj bez próbkowanej osi czasu (taki jak <c5/>) jest odrzucany z błędem; zob. <a1>ANIMATION.md</a1>.

seg-f037fe5d7ffa = Eksporty do współpracy z innymi narzędziami.

seg-3977722b8517 = <c1/> zapisuje wynik dla innych narzędzi: CZML (Cesium Language), KML (Keyhole Markup Language, dla Google Earth), GeoJSON (geographic JSON), efemerydy STK (Systems Tool Kit) lub nagranie SigMF (Signal Metadata Format). <c2/> mówi, które formaty dotyczą danego scenariusza; SigMF dotyczy tylko <c3/>. Pakiet orbity eksportuje też <c4/>, <c5/> i <c6/> (komunikaty orbitalne CCSDS, Consultative Committee for Space Data Systems). Zob. <a1>INTEROP.md</a1>.

seg-3abd51182cc0 = Ćwiczenia stopniowane

seg-9513af4fb862 = Przejdź drabinkę po kolei. Każdy poziom jest trudniejszy i lepiej obroniony niż poprzedni; rozwiązania wzorcowe znajdują się w <a1><c1/></a1>.

seg-89ad8eb64a54 = Cel

seg-0a824838ef57 = Co robisz

seg-2463a86470b8 = Rozwiązanie wzorcowe

seg-7ce3ac2347b9 = Poziom { "1" } — uruchom i odczytaj

seg-e1dee35aedff = uruchom dostarczony scenariusz bez zmian i odczytaj jeden wskaźnik jakości

seg-296694716b3b = Uruchom <c1/>; wypisz <c2/> kwantowy a klasyczny. CLI, piaskownica lub jednowierszowe wywołanie w Pythonie.

seg-bad6d3afb6a0 = Poziom { "2" } — zmień i przeskanuj

seg-c18da238e470 = zmień jeden parametr i zaobserwuj efekt monotoniczny

seg-598ca8efea83 = Zaostrz specyfikację zegara (<c1/>) lub wydłuż przerwę i obserwuj spadek holdover; albo użyj <c2/>/<c3/>, aby zestawić to w tabeli.

seg-1d9dfecce6fa = Poziom { "3" } — zmierz i obroń

seg-5b57f2c8ffb9 = Monte Carlo, pasma ufności, odtwarzalność i poziom ochrony

seg-0fac2036b289 = Uruchom zespół zegarów (<c1/>), odczytaj pasmo [p05–p95], potwierdź, że dwa przebiegi dają identyczny <c2/>, i odczytaj wynik integralności / diagramu Stanforda.

seg-45dc753da682 = Rozwiązania wzorcowe używają rozszerzenia Pythona (najpierw <c1/>). Uruchomiony z katalogu głównego repozytorium <c2/> wypisuje spadek holdover zegara atomowego w skali układu scalonego z { "2610" } s przy specyfikacji { "20" } ns do { "1140" } s przy { "5" } ns.

seg-e59b1beadb98 = Chcesz świeżych danych?

seg-530db2e609d0 = Nagłówkowe liczby w tych samouczkach powstają w całości ze scenariuszy już obecnych w repozytorium. Nic nie jest pobierane, dzięki czemu pozostają odtwarzalne i bezpieczne do uruchamiania w ciągłej integracji (CI). W ćwiczeniach „rozbuduj to” można pobrać dane na żywo:

seg-6a20ec96cb92 = <b>Dwuwierszowe elementy orbitalne GPS (TLE)</b> (odświeżenie konstelacji orbit): <a1>https://celestrak.org/NORAD/elements/gp.php?GROUP=gps-ops&FORMAT=tle</a1>, tekstowe zestawy elementów w 3 wierszach (nazwa + wiersz { "1" } + wiersz { "2" }). Pomocnik: <c1/>. Dane otwarte (katalog 18. Eskadry Obrony Kosmicznej Sił Kosmicznych USA, redystrybuowany przez Celestrak, dr T. S. Kelso).

seg-9bcea1d9eb12 = <b>Wyrocznia weryfikacyjna SGP4 (Simplified General Perturbations { "4" })</b> (już wbudowana, nie pobieraj ponownie): wektory testowe AIAA (American Institute of Aeronautics and Astronautics) 2006-6753 „Revisiting Spacetrack Report #3”, <a1>https://celestrak.org/publications/AIAA/2006-6753/</a1>, używane przez <c1/>; zob. <a2><c2/></a2>.

seg-d33aa34b2762 = <b>Wyrocznia relacji stabilności zegara</b>: NIST (National Institute of Standards and Technology) Special Publication { "1065" } (Riley, <em>Handbook of Frequency Stability Analysis</em>), <a1>https://tf.nist.gov/general/pdf/2220.pdf</a1>, relacje σ_y(τ)↔faza stojące za samouczkiem { "2" }.

seg-36be39f17e35 = <s1>Poprzednia</s1>Przewodnik po Studio

seg-6f6204737a87 = <s1>Następna</s1>{ "1" } · Twoja pierwsza orbita

seg-2fa9e002b3a2 = Silnik wybiera działanie według pola <c1/> scenariusza. Poniższa tabela wymienia najczęściej używane rodzaje (osiem dziedzin samouczków powyżej wraz z ich najbliższymi sąsiadami). To <b>nie</b> jest pełny zbiór: <c2/> zwraca wszystkie <c3/> wbudowanych rodzajów. Ta funkcja (udostępniona jako <c4/> w wiązaniach Pythona i WebAssembly (WASM) oraz jako <c5/> w wierszu poleceń) jest miarodajnym, zawsze aktualnym katalogiem, a <a1><c6/></a1> to jej wygenerowane zestawienie, jedna sekcja na rodzaj, z wymaganymi i opcjonalnymi polami TOML. <c7/> wymusza, aby każdy rodzaj opisany w samouczku był rzeczywistym rodzajem obsługiwanym przez silnik, więc nic w tej tabeli nie może wskazywać rodzaju, który nie istnieje.
