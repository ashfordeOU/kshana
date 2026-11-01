# docs--kinds-constellations-coverage-and-geometry: translations (pl)

seg-6e0cb6acc073 = VALIDATED

seg-b03d56f501c3 = Rodzaj

seg-e7dad1a1ecba = Pozycjonowanie wokół dowolnego ciała Układu Słonecznego: orbiter lub lądownik powierzchniowy wokół ciała centralnego wybranego po nazwie (Mars, Księżyc, Europa, Ganimedes, Tytan i reszta katalogu Układu Słonecznego), nawigujący na podstawie jednokierunkowych pseudoodległości z małej konstelacji nawigacyjnej Walkera wokół ciała (orbity dwóch ciał z sekularnym dryfem J2 własnym dla ciała, nieznany zegar użytkownika) i opcjonalnie bezzegarowego dwukierunkowego pomiaru odległości w głębokim kosmosie z Ziemi, której kierunek i odległość pochodzą z analitycznych efemeryd Układu Słonecznego w każdej epoce. Linie widzenia są blokowane przez średnią sferę ciała, a użytkownik na powierzchni potrzebuje też maski elewacji. W każdej epoce: widoczne przekaźniki, czy Ziemia jest ponad limbem, GDOP i PDOP samej konstelacji (współczynniki rozmycia dokładności: geometryczny i pozycji), formalna niepewność pozycji jednosigmowa z wierszem Ziemi i bez niego oraz błąd rozwiązania metodą najmniejszych kwadratów Gaussa-Newtona z ziarnem w każdym z tych wariantów; w całym przebiegu: dostępność, widoczność Ziemi, mediana PDOP, błąd RMS i mediana formalnej sigmy, a także czas świetlny Ziemia–ciało, czas pełnej drogi, opóźnienie Shapiro i odległość kątowa od Słońca w danej epoce. MODELLED: orbity przekaźników, poziomy szumu i chwilowy model pomiaru są wyborami modelowymi, niesprawdzonymi względem danych nawigacyjnych żadnej misji; stałe ciała to opublikowane wartości przywołane w body.rs, a geometria Ziemi dziedziczy etykiety efemeryd Układu Słonecznego.

seg-6f341acbe994 = Wykres zapisywany przez silnik dla scenarios/mars-orbit-pnt.toml, rodzaj body-pnt

seg-de173c9f4034 = Projektowanie konstelacji na dużą skalę: wzorce Walker DELTA i Walker STAR w konwencji i: T/P/F (węzły rozłożone na { "360" } lub { "180" } deg, odstęp w płaszczyźnie { "360" }<em>P/T, przesunięcie fazowe między płaszczyznami { "360" }</em>F/T), jawne listy elementów i projekty wielopowłokowe, kilka konstelacji w jednym przebiegu, wokół Ziemi, Księżyca, Marsa lub dowolnej innej planety, Plutona lub dużego księżyca, z użyciem stałych w module body (tych samych, których używają rodzaje solar-system i body-pnt). USTAWIENIA WSTĘPNE z opublikowanych nominalnych elementów: gps-baseline i gps-expandable ({ "24" } slotów i sześć rozszerzalnych par przód/tył z GPS Standard Positioning Service Performance Standard, wydanie 5, { "2020" }, tabele 3.2-1 do 3.2-3), galileo (Walker 24/3/1 na { "29 599.801" } km i { "56" } deg, Galileo Open Service Service Definition Document wydanie { "1.1" } tabele { "1" } i { "23" }), beidou i beidou-meo (Walker 24/3/1 na { "21 528" } km i { "55" } deg plus trzy satelity geostacjonarne na { "80" }, { "110.5" } i { "140" } deg E oraz trzy nachylone satelity geosynchroniczne na { "55" } deg, BeiDou Open Service Performance Standard { "3.0" } sekcja { "4.1" }; faza MEO i przecięcie nachylonej orbity geosynchronicznej na { "118" } deg E są modelowane, ponieważ norma ich nie podaje) oraz glonass (24/3/1 na { "19 100" } km i { "64.8" } deg ze wzoru na sloty z GLONASS Interface Control Document wydanie { "5.1" } sekcja { "5.2" }). POKRYCIE I WSPÓŁCZYNNIK ROZMYCIA DOKŁADNOŚCI: na siatce szerokość/długość geograficzna i próbkowanym oknie z maską elewacji liczba widocznych satelitów, GDOP, PDOP, HDOP i VDOP w każdej komórce, dostępność (rozwiązanie z PDOP nie większym niż próg, domyślnie { "6" }) w każdej komórce, globalnie (ważona powierzchnią) i w najgorszym miejscu, z jednym zegarem odbiornika na konstelację, chyba że clock = "common". Skaluje się do tysięcy satelitów: widoczność jest iloczynem skalarnym względem połowy kąta pokrycia każdego satelity, a satelity są grupowane w pasy według szerokości podsatelitarnej w każdej epoce, więc wiersz siatki testuje tylko te, które mogą być widoczne; raport zlicza zaoszczędzone testy par. JSON zawiera mapy siatki i zredukowane śladowe trasy naziemne każdego satelity. VALIDATED: generator Walker względem tabeli { "23" } Galileo OS SDD i wzoru na sloty z GLONASS ICD, ustawienie GPS względem opublikowanej kolumny przecięć równika z tabeli 3.2-1 SPS PS, a globalny rozkład HDOP bazowego GPS względem dodatku B SPS PS (mediana { "0.94" }, { "95" }% { "1.25" }, średnia { "0.96" }, tolerancja { "0.03" }). MODELLED: orbity dwóch ciał z opcjonalnym sekularnym J2, sferyczne ciało, wyłącznie widoczność geometryczna (bez mocy sygnału, stanu technicznego ani terenu) oraz względna faza między różnymi systemami, która nie jest migawką żadnej rzeczywistej daty.

seg-899e728ad9bd = Wykres zapisywany przez silnik dla scenarios/leo-pnt-mega-shell.toml, rodzaj constellation-design

seg-24266bc264df = Efemerydy i ślad naziemny: propagacja jednego satelity (TLE→SGP4 lub orbita analityczna) i emisja jego stanu TEME/GCRS (położenie + prędkość), położenia ITRF/ECEF, szerokości/długości/wysokości podsatelitarnej w WGS-84 oraz, dla każdego kroku, azymutu/elewacji/odległości stacji i prędkości zmiany odległości (Doppler). Satelita pochodzi z <c1/> albo z analitycznej <c2/> z jej <c3/> (<c4/> ma pierwszeństwo, gdy podano oba); przy <c5/> <c6/> nadpisuje własną epokę TLE jako t = { "0" }.

seg-0fd3c58fde09 = Wykres zapisany przez silnik dla scenarios/ephemeris.toml, rodzaj ephemeris

seg-4e31c8daf798 = Rejestr (ledger)

seg-44bbec836934 = Źródło: <c1/>

seg-34a6079984a7 = Konstelacje, pokrycie i geometria (rodzina rodzajów scenariuszy)

seg-6800289a282d = { "7" } rodzajów scenariuszy silnika v{ $version }. Wyłącznie doradczo: wynik analizy z narzędzia badawczo-inżynieryjnego; nie jest to sprzęt nawigacyjny z zatwierdzeniem typu ani usługa bezpieczeństwa życia. Każda etykieta tutaj pochodzi z silnika lub z macierzy weryfikacji; rodzaj ma status MODELLED, chyba że macierz stanowi inaczej (jak zdobywa się etykietę: sekcja Evidence w README).

seg-d95cc2c1e798 = Strony tematyczne: <a1>CONSTELLATION-DESIGN</a1>, <a2>COVERAGE</a2>, <a3>SOLAR-SYSTEM</a3>, <a4>SKYLINE</a4>. Uruchom jeden: <c1/>. Wszystkie rodziny: <a5>KINDS.md</a5>.

seg-f044822c2fab = Arkusz miniatur wykresów zapisywanych przez silnik dla rodzajów z rodziny Konstelacje, pokrycie i geometria

seg-be0cfeeb1680 = MODELLED { "4" } · VALIDATED { "4" }

seg-e2450f89bcc6 = Efemerydy i ślad na powierzchni: propagacja jednego satelity (TLE→SGP4 lub orbita analityczna) i zapis jego stanu TEME/GCRS (położenie + prędkość), położenia ITRF/ECEF, szerokości/długości/wysokości podsatelitarnej WGS-84 oraz dla każdego kroku

seg-d021c1b23dbc = Projekt konstelacji w dużej skali: wzorce Walker DELTA i Walker STAR w konwencji i: T/P/F (węzły rozłożone na { "360" } lub { "180" } deg, odstęp w płaszczyźnie { "360" }<em>P/T, przesunięcie fazowe między płaszczyznami { "360" }</em>F/T), jawne

seg-d1c67e3dd12e = MODELLED { "1" } · VALIDATED { "2" }

seg-f6914ea43dba = Cały Układ Słoneczny w jednej epoce, dla PNT (pozycjonowanie, nawigacja i czas) wokół dowolnego ciała.

seg-06f082922143 = MODELLED { "2" } · VALIDATED { "3" }

seg-d71a07d8a59e = Pozycjonowanie wokół dowolnego ciała Układu Słonecznego: orbiter lub lądownik powierzchniowy wokół ciała centralnego wybranego po nazwie (Mars, Księżyc, Europa, Ganimedes, Tytan i reszta katalogu Układu Słonecznego), nawigu

seg-436e412d99fd = MODELLED { "1" } · VALIDATED { "1" }

seg-f6b22521b4a4 = PNT w głębokim kosmosie wokół Marsa: symulowana konstelacja przekaźników MARCONI (przekaźniki areostacjonarne i nachylone, nadające jednokierunkowo i przekazujące dwukierunkowo do stacji w głębokim kosmosie) nawiguje użytkownika odniesienia (transfer / l

seg-cc85d9962c25 = Predykcja przelotów nad stacją naziemną: przeloty widoczności w dziedzinie czasu (AOS/TCA/LOS, maksymalna widoczna elewacja, czas trwania) orbity kołowej, jako średnie elementy SGP4 na początku okna, nad stacją nad

seg-23f3c33445d1 = MODELLED { "2" } · VALIDATED { "2" }

seg-a7bd3325080c = Pola wymagane: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>. Opcjonalne: <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>.

seg-5e8a5e611ba9 = <b>Rejestr (ledger):</b> MODELLED { "4" } · VALIDATED { "4" }. Pełna strona z danymi wejściowymi, wynikami, dowodami i ograniczeniami: <a1>orbit</a1>.

seg-968c1512151e = Pola wymagane: <c1/>. Opcjonalne: <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>.

seg-8c5e41cef6fd = <b>Rejestr (ledger):</b> VALIDATED. Pełna strona z danymi wejściowymi, wynikami, dowodami i ograniczeniami: <a1>ephemeris</a1>.

seg-47aaf1afd6ec = Pola wymagane: brak. Opcjonalne: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>.

seg-bacf2a133146 = <b>Rejestr (ledger):</b> MODELLED { "1" } · VALIDATED { "2" }. Pełna strona z danymi wejściowymi, wynikami, dowodami i ograniczeniami: <a1>constellation-design</a1>.

seg-e99c2a83034e = Pola wymagane: brak. Opcjonalne: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>.

seg-d91ded1df3a2 = <b>Rejestr (ledger):</b> MODELLED { "2" } · VALIDATED { "3" }. Pełna strona z danymi wejściowymi, wynikami, dowodami i ograniczeniami: <a1>solar-system</a1>.

seg-fe02605b130e = Pola wymagane: brak. Opcjonalne: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>.

seg-12bc4b4b4631 = <b>Rejestr (ledger):</b> MODELLED { "1" } · VALIDATED { "1" }. Pełna strona z danymi wejściowymi, wynikami, dowodami i ograniczeniami: <a1>body-pnt</a1>.

seg-bee590b4c9e7 = Pola wymagane: brak. Opcjonalne: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>.

seg-c0394ad71cfe = <b>Rejestr (ledger):</b> MODELLED. Pełna strona z danymi wejściowymi, wynikami, dowodami i ograniczeniami: <a1>mars-pnt</a1>.

seg-352823f8c5ac = Pola wymagane: brak. Opcjonalne: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>.

seg-bb4fa18e50a6 = <b>Rejestr (ledger):</b> MODELLED { "2" } · VALIDATED { "2" }. Pełna strona z danymi wejściowymi, wynikami, dowodami i ograniczeniami: <a1>passes</a1>.

seg-490ec99e2a38 = <s1>Poprzedni</s1>Zegary, synchronizacja czasu i holdover

seg-90ff7426b999 = <s1>Następny</s1>Pomiary GNSS, pozycjonowanie i integralność

seg-cb4262b66b8f = Dostępność GNSS i DOP z konstelacji orbitalnej (Walker / TLE / RINEX).

seg-3b652c0da6de = Wykres zapisany przez silnik dla scenarios/orbit-rinex.toml, rodzaj orbit

seg-a4bdfc291fce = Prognozowanie przelotów nad stacją naziemną: przeloty widoczności w dziedzinie czasu (AOS/TCA/LOS, maksymalna elewacja pozorna, czas trwania) orbity kołowej, jako średnie elementy SGP4 na początku okna, nad stacją powyżej maski elewacji w oknie czasowym, z łącznym czasem dostępu. Propagacja SGP4/SDP4 w ziemskim układzie związanym z Ziemią IAU 2006/2000A (opcjonalnie UT1 - UTC i ruch bieguna), refrakcja troposferyczna wg ITU-R P.834-9 i czas propagacji światła na łączu w dół (obie domyślnie włączone), przecięcia rozwiązywane z dokładnością { "1e-7" } s, a kulminacja wyszukiwaniem metodą złotego podziału. Geometria przelotu jest VALIDATED względem Orekit { "13.1.8" } dla stacji na poziomie morza; orbita i stacja w scenariuszu są wejściami ilustracyjnymi.

seg-a09be8c586e3 = Wykres zapisany przez silnik dla scenarios/passes.toml, rodzaj passes

seg-0549bc926a9b = Cały Układ Słoneczny w jednej epoce, dla PNT (pozycjonowanie, nawigacja i czas) wokół dowolnego ciała. Dla Słońca, ośmiu planet, Plutona, Księżyca, Fobosa, Deimosa, Io, Europy, Ganimedesa, Kallisto i Tytana podaje położenie i prędkość heliocentryczną w ICRF (Międzynarodowy Niebieski Układ Odniesienia, równikowy J2000), odległość heliocentryczną oraz długość i szerokość ekliptyczną J2000, parametr grawitacyjny, promień równikowy i średni, J2 tam, gdzie opublikowano, i jego promień odniesienia, okres obrotu gwiazdowego, biegun IAU i południk zerowy w epoce, ścieżkę orbity próbkowaną w ciągu jednego obiegu (heliocentryczną dla planet, wokółplanetarną dla księżyców) oraz czas światła, odległość w jedną i w obie strony, solarne opóźnienie Shapiro i odległość kątową od Słońca względem ciała obserwatora (domyślnie Ziemia); dodatkowe łącza from/to są traktowane tak samo. Położenia: elementy keplerowskie JPL wg Standisha i Williamsa (Tabela { "1" } dla lat { "1800" } n.e. do { "2050" } n.e., Tabele 2a/2b dla lat { "3000" } p.n.e. do { "3000" } n.e.) z nominalnym błędem każdej planety, szereg lunarny Montenbrucka i Gilla dla podziału Ziemia–Księżyc, średnie elementy JPL z synchroniczną szybkością obrotu IAU dla księżyców Marsa i galileuszowych oraz model obrotu IAU dla Tytana. Czas światła: radiometryczne rozwiązanie punktu stałego, nadajnik w położeniu opóźnionym; newtonowski, z opóźnieniem Shapiro podawanym osobno. VALIDATED względem JPL Horizons (DE441) w granicach dwukrotności błędu nominalnego: od Merkurego do Saturna i Ziemia z Tabeli { "1" } (najgorszy { "1.87" } raza nominalnego) oraz wszystkie osiem planet z Tabel 2a/2b (najgorszy { "1.71" } raza), a także czas światła Ziemia–Mars i Ziemia–Jowisz. MODELLED, każdy wiersz oznaczony: Uran i Neptun z Tabeli { "1" } ({ "2.0" } i { "5.2" } raza błędu nominalnego względem DE441), Pluton (wiersz z { "1992" }; bez podanego błędu), Księżyc i siedem księżyców (zmierzone względem Horizons, bez opublikowanej granicy).

seg-537aa8010e50 = Wykres zapisany przez silnik dla scenarios/solar-system-tour.toml, rodzaj solar-system

seg-3f749aef8d89 = Głębokokosmiczny Mars PNT: symulowana konstelacja przekaźników MARCONI (przekaźniki areostacjonarne + nachylone nadające jednokierunkowo + przekazujące dwukierunkowo do stacji w głębokim kosmosie) nawiguje użytkownika referencyjnego (transfer | lmo | surface) przez wspólny estymator fuzji radiometrycznej jedno- i dwukierunkowej. Podaje geometrię/widoczność na epokę, osiągnięty RMS względem prawdy i formalną kowariancję (pozycja 1σ / 3σ) — uczciwy symulowany wskaźnik jakości, NIE certyfikowany poziom ochrony.

seg-c564dca90854 = Wykres, który silnik zapisuje dla scenarios/mars-pnt-lmo.toml, rodzaj mars-pnt
