# docs--modelled-rationale: translations (pl)

seg-aab745a65e76 = Moduł

seg-2db69c58f694 = Księżycowy różnicowy PNT

seg-1ff1d8ebf1e7 = Odwzorowanie compliance na publiczne ramy

seg-d6476863f862 = Możliwość

seg-60a43431ebe0 = Wymaganie

seg-bde1b3a94a47 = Cień SRP z pociemnieniem brzegowym Słońca (opcjonalny)

seg-eaaec545dd68 = Oświetlona część SRP jako niezasłonięta część strumienia słonecznego z pociemnieniem brzegowym (prawo przybliżenia Eddingtona I(mu)/I({ "1" }) = 2/5 + 3/5 mu, kwadratura Gaussa-Legendre'a) nad sferyczną Ziemią lub Ziemią WGS-84 (srp_shadow::limb_darkened_shadow, wariant ShadowModel OblateEarthLimbDarkened)

seg-9e15970435c3 = Słońce i Księżyc z DE440 w modelu sił Cowella (opcjonalne)

seg-de6831cf7785 = Opcjonalny poziom efemeryd dla członów trzeciego ciała i SRP numerycznego ForceModel Cowella: geocentryczne Słońce i Księżyc z dowolnego EphemerisProvider (jądro DE440 SPK przez KernelEphemeris) przy TDB = TT + (TDB - TT), z odmową, gdy dostawca nie może obsłużyć epoki, i zliczaniem każdego powrotu do szeregu analitycznego; domyślnie wyłączony

seg-057c21daf4f2 = Pływ atmosferyczny S1 (opcjonalny)

seg-f600a39f297e = Dobowy pływ ciśnienia powietrza S1 jako zaburzenie geopotencjału: model N1 Biancale i Bode ({ "2006" }), stopnie od { "2" } do { "6" }, przez wzór obciążenia IERS { "2010" } Eq. { "6.21" } (tides::atmospheric_tide_s1, s1_air_tide_acceleration), opcjonalny w modelach sił Cowella i precyzyjnym (air_tide_s1, domyślnie wyłączony)

seg-e8f5ff8c9149 = Grawitacja w harmonikach sferycznych wysokiego stopnia (EGM2008 do { "2190" })

seg-d3b2f32dcecb = Odporna na niedomiar i na bieguny ocena w pełni znormalizowanego pola do stopnia { "2190" } (SphericalHarmonicField::acceleration_hf / potential_hf, zmodyfikowana kolumna w przód Holmesa-Featherstone'a z { "2002" } z gradientem wolnym od 1/cos phi), strumieniowy ładowacz ICGEM .gfc (from_gfc_file / from_gfc_reader; pełny EGM2008 jest pobierany w czasie działania, a nie dołączany) oraz ewaluator Holmesa-Featherstone'a wybieralny w opcjonalnym Cowell Geopotential

seg-1960804ef2f4 = Wsadowe wyznaczanie orbity z prędkości radialnej zasięgu i az/el z maskowaniem stacji

seg-4c185244bc66 = Odtworzenie stanu epoki z mieszanych pomiarów zasięgu, prędkości zasięgu i azymutu/elewacji powyżej maski elewacji metodą Gaussa-Newtona na H = (dh/dx(t)) Phi(t, t0): analityczne pochodne cząstkowe pomiarów i wariacyjna macierz przejścia stanu z analitycznymi pochodnymi cząstkowymi dwuciałowymi + J2 (całkowana RK4, a nie STM w postaci zamkniętej)

seg-bc3d1ee7c639 = Ważenie obserwacji kodami dokładności SP3

seg-63b1fab84f85 = Odwzorowanie kodów dokładności SP3 (nagłówek ++ wykładniki w { "2" }^n mm, podstawa %f, odchylenia standardowe base^n mm dla każdego rekordu) na sigmy położenia dla każdej obserwacji w silniku precyzyjnego wyznaczania orbity (sp3::parse_sp3_accuracy, Sp3Accuracy::position_sigma_m)

seg-ae3e8833a5ef = Dołączenie opublikowanego pola grawitacyjnego do ciała

seg-ffb2b20e5f32 = with_gravity_field (na Body, w src/gravity_pds.rs): dołącza dowolne wczytane pole harmonik sferycznych (na przykład GMM-3 lub GL0660B) do Body, aby propagator obliczał je w układzie związanym z ciałem; opcjonalne, domyślne ciała niezmienione

seg-9762cf428435 = Kodery komunikatów nawigacyjnych poza GPS LNAV (GPS CNAV, Galileo I/NAV i F/NAV)

seg-9b703b9607d8 = Typy komunikatów GPS CNAV 10/11/30, typy słów Galileo I/NAV 1-5 w nominalnych stronach parzystych/nieparzystych oraz typy stron Galileo F/NAV 1-4: pakowanie pól ICD i kwantyzacja, CRC-24Q, kodowanie splotowe o sprawności 1/2 K={ "7" } (G2 odwrócone dla Galileo), przeplot blokowy i wzorce synchronizacji, z odpowiadającymi dekoderami testowymi

seg-974d8c1f7876 = Wygładzanie kodu nośną metodą Hatcha na rzeczywistych obserwacjach RINEX

seg-f26b5da0f52e = Filtr Hatcha bez rozbieżności (kod wolny od jonosfery niesiony przez nośną wolną od jonosfery, okno N epok, restart przy utracie śledzenia, skoku geometry-free lub przerwie) w zestawie precyzyjnego pozycjonowania punktowego

seg-278ca396127a = Odczyt plików obserwacji RINEX { "4" }

seg-e0883aa933eb = Nagłówki obserwacji RINEX 4.0x (DOI, LICENSE OF USE, STATION INFORMATION, MERGED FILE; etykiety dopasowane w kolumnach 61-80 dla wersji { "4" } i nowszych) oraz rekordy epok

seg-33e5c74720ff = Położenie satelity BeiDou GEO z efemeryd nadawanych

seg-44b61449b65a = BDS-SIS-ICD-B1I v3.0 §{ "5.2.4.12" } położenie satelity geostacjonarnego z efemeryd nadawanych (układ quasi-inercjalny, potem Rz(Ω̇e·tk)·Rx(−{ "5" }°)), opcjonalne przez pole include_beidou_geo w NavParseOptions, więc domyślny czytnik nadal pomija satelity GEO

seg-71f48628ebb2 = GNSS/INS ściśle sprzężony z fazą nośnej i niejednoznacznościami float

seg-5a156aa81275 = Filtr EKF stanu błędu na { "15" } stanach INS, dwustanowy zegar odbiornika i jedna niejednoznaczność nośnej float na każdego śledzonego satelitę; pseudoodległość, faza nośnej i opcjonalna prędkość zasięgu z konstelacji Walkera SGP4 (czas światła i Sagnac), poprawki Klobuchara i Saastamoinena/Niella stosowane w pętli w położeniu własnym filtru; detekcja poślizgów różnicowaniem czasowym nośnej z progiem dla każdego satelity poszerzanym o niepewność prędkości; ponowna inicjalizacja niejednoznaczności po poślizgach i ponownym nawiązaniu

seg-7d644516b1ec = Pakiety GNSS/INS morski, kolejowy i lotniczy z opcją ścisłego sprzężenia

seg-cbb03a8baf73 = Trzy scenariusze gnss-ins na bibliotece trajektorii (statek wężykiem z prędkością { "8" } m/s z pięciominutową przerwą; pociąg przez wykop z dwoma satelitami i tunel; samolot, którego przerwa obejmuje 25-stopniowy zakręt z przechyłem) oraz opcjonalna tabela [tight] pakietu: pseudoodległości z konstelacji Walkera SGP4 łączone przez nawigator w pętli zamkniętej, każdy satelita powyżej maski w stanie nominalnym i najwyższych kilka w stanie pogorszonym

seg-f4dab73c4eda = Sprzężony filtr PNT z pseudoodległości ze stanem obciążenia i rozszerzeniem 3-D w pakiecie fuzji

seg-742b60089361 = Jeden skumulowany filtr Kalmana po położeniu, prędkości, fazie i częstotliwości zegara zasilany pseudoodległościami, które sprzęgają położenie i zegar (aktualizacje w postaci Josepha niosące kowariancję wzajemną); wariant 1-DOF rozszerzony o stały stan obciążenia akcelerometru, który pakiet fuzji uruchamia pod [coupled]; oraz wersja 3-D z 8 stanami i wierszami wzdłuż linii widzenia

seg-2db2b9dc3b45 = Biblioteka trajektorii GNSS/INS i import prawdy z CSV

seg-e1fe83c75a6c = Wybieralne profile ruchu dla pakietu gnss-ins (prosty, figure-8 (ósemka), miejski z zatrzymaniami, wznoszenie samolotu i skoordynowany zakręt, dron geodezyjny), zdefiniowane przez polecenia prędkości kątów Eulera i przyspieszenia wzdłuż toru zamknięte na stanie prawdy z kinematycznym IMU (człony dośrodkowy, grawitacyjny i Coriolisa) oraz zaimportowana prawda z CSV przekształcona w IMU, które ją odtwarza; historyczny przejazd niezmieniony, gdy nie podano profilu

seg-86f9186bb884 = NRHO { "9" }:{ "2" } w CR3BP Ziemia–Księżyc względem orbity, którą przeleciał CAPSTONE

seg-d4127cf241f3 = Kołowa ograniczona południowa prawie prostoliniowa orbita halo { "9" }:{ "2" } wokół L2, którą koryguje cr3bp::differential_correct_halo (rodzina orbit Gateway i CAPSTONE), porównana pod względem geometrii średniej (okres, promień perilune, promień apolune) z orbitą, którą CAPSTONE faktycznie przeleciał. Pomiar tego, jak dobrze człon CR3BP opisuje rzeczywistą orbitę; orbita CR3BP nie jest orbitą modelu efemeryd i nie jest porównywana epoka po epoce

seg-1a5623c81b48 = Błąd położenia z geometrii: błąd RMS = sigma_UERE x DOP dla rozwiązania metodą najmniejszych kwadratów silnika

seg-7a94b44a8738 = dop_error_mc::run_geometry i check: Monte Carlo z ziarnem (N = { "20,000" } epok na geometrię, sigma = { "1.5" } m, ziarno ChaCha8 { "36" } + i) własnego iterowanego rozwiązania metodą najmniejszych kwadratów silnika (pvt::solve_spp, wagi jednostkowe, rozwiązywane od prawdziwego położenia) na { "8" } geometriach z tests/fixtures/dop/dop_reference.csv, porównujące wariancje błędu wschód, północ, góra i zegara, RMS H/V/P, korelację wschód–północ, błędy średnie oraz odsetek wewnątrz { "95" } % elipsy poziomej z sigma^{ "2" } Q, gdzie Q jest czynnikiem kowariancji jądra orbit::dop (orbit::dop_cofactor, ta sama arytmetyka) dla tej samej geometrii

seg-9acfde1b57f7 = Klasyfikacja zaufania uwzględniająca geometrię: geometria satelitów obok wskaźnika zaufania do odbiornika i klasa przy każdym odjęciu

seg-6138c41e13ff = receiver_trust::geometry: geometria satelitów w każdej epoce (dobra, pogorszona z przyczynami few-satellites/high-pdop/high-hdop/sky-blocked albo nieznana, gdy log nie zawiera GSV, NAV-SAT ani GSA) wyprowadzona z zgłaszanych elewacji i azymutów przez orbit::dop lub wzięta z GSA, z etykietą zawsze podawaną i nigdy nie punktowaną (dobra, średnia, słaba, nieznana) oraz HDOP, PDOP, VDOP, liczbą satelitów i utratą sygnału podanymi słowami; monitor geometrii we wskaźniku statku, który nie odejmuje niczego, dopóki geometria nie jest słaba (stosunek max(hdop/4, pdop/6, 5/n_used) powyżej { "1" }), a potem narasta do limitu { "15" } punktów przy { "1.5" }, którego sama geometria nie może obniżyć poniżej pasma pogorszonego (limit, koniec narastania i dolna granica w [geometry]; bez alarmu); klasa przy każdym odjęciu (geometria, środowisko, niespójność), przy czym utrata śledzenia dla satelitów poniżej { "15" } deg jest klasyfikowana jako geometria, satelity w zasięgu, ale niezśledzone, jako środowisko, a odjęcie za słabą geometrię, którego podany HDOP wykracza poza max({ "1.0" }, { "25" } % wyprowadzonego HDOP) od podanego nieba, jako niespójność

seg-bbb1828b3db1 = Redukcje kanionu ulicznego, sektorów i terenu do tabeli

seg-2864aec7be88 = skyline: kanion uliczny w postaci zamkniętej (cięcie atan((h - a) / d) przy d = (w/2) / abs(sin(az - s)), otwarte końce dla skończonej długości), sektory o ostrych krawędziach zgodnie z ruchem wskazówek zegara z zawinięciem oraz punkty terenu zredukowane do tabeli ze spadkiem krzywizny d^2/({ "2" } * 4/3 R); horyzont jest ich punktowym maksimum z dowolną tabelą

seg-3f3d657854ce = Ustawienia wstępne horyzontu (ulica miejska, podejście do portu, fiord, terminal kontenerowy)

seg-b915c06fa3f1 = skyline::PRESETS: cztery geometrie REPRESENTATIVE ze wskazanymi w nocie projektowej wymiarami i wierszem pochodzenia dla każdej: city-street (kanion, ulica { "0" } deg, { "20" } m między ścianami { "30" } m, antena { "1.5" } m), harbour-approach (sektory: otwarte w stronę morza na { "180" } deg, zabudowa nabrzeża { "8" } deg na { "90" } deg, falochron { "3" } deg), fjord (teren: ściany { "600" } m ponad anteną w odległości { "1.5" } km po obu stronach kanału północ-południe, uwzględniony spadek krzywizny), container-terminal (sektory: stosy { "12" } deg nad częścią lądową, wysięgniki żurawi { "35" } deg i { "25" } deg nad dwoma wąskimi sektorami); z możliwością nadpisania pole po polu

seg-6012113b4836 = Funkcje geometrii nieba: widoczność, DOP, kowariancja, elipsa błędu, chmura Monte Carlo

seg-17352a3aa356 = geometry (sky_geometry, sky_monte_carlo, skyline_presets, skyline_profile, skyplot_svg; CLI <c1/> i <c2/>, funkcje Pythona i WASM o tych samych nazwach, MCP <c3/>): na podstawie punktu, czasu i ustawień wstępnych konstelacji (lub satelitów podanych jako azymut/elewacja albo ECEF) wyznacza satelity widoczne i zasłonięte horyzontem, GDOP/PDOP/HDOP/VDOP/TDOP, kofaktor jednostkowej wariancji (H^T H)^-1 i kowariancję we współrzędnych wschód-północ-góra z jednym zegarem odbiornika na system lub jednym wspólnym, elipsę błędu poziomego (półosie k sigma sqrt(lambda), k = sqrt(-2 ln({ "1" } - p)), orientacja { "0.5" } atan2({ "2" } Q_EN, Q_NN - Q_EE) od północy) oraz n błędów najmniejszych kwadratów z ziarnem przy niezależnych gaussowskich błędach odległości wraz z ich empiryczną kowariancją, RMS i { "95" } % zawierania. Kofaktorem jest orbit::cofactor_from_los, jedno jądro stojące za orbit::dop i orbit::dop_cov (dop jest redukcją dop_cov): brak drugiej implementacji DOP

seg-7f66be0f15c8 = Holdover zegara przy braku GNSS

seg-4d8f87668a0f = Wzrost błędu dryfu w postaci zamkniętej + holdover do progu; klasy zegarów kwantowych

seg-29b482d88916 = Karty zmierzonych zegarów (predykcja na zbiorze wstrzymanym)

seg-8c68c5b25004 = clock_library: karta urządzenia (szum fazy białej, FM biały, FM migotania i FM błądzenia losowego plus liniowy dryf częstotliwości) dopasowana do jednej trzeciej nazwanego zmierzonego zapisu zegara po zarejestrowanym przebiegu kondycjonowania (usunięte luki, odstające fazy, skoki fazy, serie; skoki częstotliwości zarejestrowane), ważona stopniami swobody typów szumu wyznaczonymi z lag-1, oraz jej przewidywane odchylenie Allana oceniane na wstrzymanych dwóch trzecich; czytniki plików zegarów RINEX i IGS, plików BIPM dla poszczególnych laboratoriów i sekcji { "1" } Circular T; konwersja karty do modelu szumu taktowania szczelin, rozszerzonego modelu zegara Kalmana i poziomów szumu monitora spoofingu

seg-5097a0e6460d = Karty zmierzonych zegarów GPS Block IIF z wyrazami na obrót (predykcja na zbiorze wstrzymanym)

seg-3da8122f5608 = clock_library::card::DeviceCard::fit_phase_periodic: karta urządzenia zawierająca wyrazy fazy od jednego do czterech na obrót (okres T/k, T = { "43 082.05" } s), dopasowane łącznie z kwadratową przez najmniejsze kwadraty na jednej trzeciej zmierzonego zapisu zegara satelity, z wkładem każdego wyrazu do przewidywanego odchylenia Allana w postaci zamkniętej { "4" } A^{ "2" } sin^{ "4" }(pi tau / P) / tau^{ "2" }

seg-0d72fcc0fbea = Estymacja stanu zegara na pokładzie

seg-6db5391f8ebe = Zegar Kalmana van-Loana o 3 stanach (faza/częstotliwość/dryf), stabilizowany metodą Josepha

seg-3f0a9d7c2971 = Budżet błędów transferu czasu

seg-216f46b43860 = Dwukierunkowy/TWSTFT (Sagnac), GNSS common-view, PPP; drgania łącza→odległość

seg-157fadeb5d67 = Analiza modulacji sygnału nawigacyjnego i śledzenia kodu

seg-ab633d191396 = PSD BPSK-R/BOC, separacja spektralna κ, szerokość pasma Gabora, drgania DLL, wielodrogowość

seg-e6c08e1e6ae3 = Wydajność kwantowego czujnika inercyjnego

seg-d28e1f6a430f = Akcelerometr z interferometrem zimnych atomów od podstaw (k_eff·T², QPN)

seg-4b79d03cecf5 = Niejednoznaczność prążków / zakres dynamiczny kwantowego czujnika inercyjnego

seg-deb2850546d5 = Zakres dynamiczny niejednoznaczności prążków Macha–Zehndera: odczyt prążków o okresie 2π wyznacza maksymalną jednoznaczną siłę właściwą a_max=π/(k_eff·T²), a jednoznaczny zakres w komórkach rozdzielczości a_max/σ_a=π/σ_Φ nie zależy od optycznego współczynnika skali — wzrost czułości T² kosztuje jednoznaczny zakres w dokładnym stosunku (czas interrogacji wymienia rozdzielczość na zakres, a liczba komórek pozostaje ustalona przez szum fazy odczytu)

seg-d04bf321d4a1 = Odporność kwantowej nawigacji zliczeniowej

seg-c4989abb5d40 = Złożony budżet pozycji z biasu, współczynnika skali, VRW i zaniku stabilności w holdover

seg-5692c7b936b6 = Odporność na zagłuszanie (jamming) przy braku GNSS

seg-f4ff77caa47b = Geometryczny bilans łącza J/S, C/N₀ przy anty-jamming, utrata śledzenia dla poszczególnych satelitów

seg-ff90679d1de9 = Detekcja spoofingu

seg-b843f63e77e6 = Wskaźnik jakości bezpieczeństwa na epokę, łączący χ² wspomagane zegarem, RAIM, AGC i SQM

seg-b10d07921f5e = Poziom ochrony czasu przy spoofingu

seg-2a829711b997 = Ograniczenie w postaci zamkniętej dla najgorszego niewykrytego błędu czasu = próg monitora + σ dryfu oscylatora w czasie opóźnienia detekcji CUSUM, podawane jako pasmo progu szumu czerwonego

seg-f1d49eac89f8 = Alternatywne / uzupełniające PNT

seg-023dda973f66 = Dopasowanie do mapy grawitacyjnej, nawigacja z odniesieniem do terenu (TERCOM/SITAN), anomalia magnetyczna

seg-791e7285c291 = Odtwarzalność i zapewnienie jakości oprogramowania

seg-7177355a482c = Deterministyczne, z haszem scenariusza, SBOM + wielosystemowe bramki wzorcowe

seg-241f2eeaef12 = Etykietowany syntetyczny korpus zakłóceń + niezależna od detektora uprząż ROC/AUC/macierz pomyłek/Pfa-Pmd; zabezpieczenie przed wyciekiem, podział stratyfikowany, raport optymizmu przy przesunięciu rozkładu (w obrębie a poza reżimem). Można uruchomić z CLI/wiązań jako rodzaj scenariusza <c1/> (scenarios/impairment-eval.toml)

seg-642087659fda = Kontrolowane badanie syntetyczne luki optymizmu AUC między rozkładem uczącym a rozkładem spoza niego, dla detektorów z opublikowanych metod i uczonych (regresja logistyczna / MLP z jedną warstwą ukrytą): trendy praw skalowania dla poszczególnych klas (ρ Spearmana + nachylenie względem { "1" }−dotkliwość) oraz predyktor grzbietowy oparty wyłącznie na rozkładzie uczącym, który szacuje lukę wyłącznie z diagnostyki rozkładu uczącego, oceniany metodą pomijania jednego detektora i jednej klasy. Odtwarzalne przez <c1/>

seg-fd6424213d1f = Kompromis PNT kwantowe a klasyczne i odporność przy braku GNSS ({ "13503" })

seg-21b2b54200a8 = Pobieranie zmierzonego ADEV (NNLS), tabela kompromisów (holdover czasu/inercyjny + korzyść), obwiednia odporności w czasie; zastrzeżenie o progu dołączone do artefaktu. Można uruchomić z CLI/wiązań jako rodzaj scenariusza <c1/> (scenarios/quantum-trade.toml)

seg-1fa865bfddd1 = Środowisko pogody kosmicznej i gęstość termosfery zależna od aktywności

seg-47308f611c7e = Wskaźniki słoneczne/geomagnetyczne (definicyjna tabela Kp↔ap), temperatura egzosferyczna Jacchia-1971 oraz gęstość termosfery Jacchia { "1971" } (SAO Special Report { "332" }: statyczne profile dyfuzyjne odtwarzające jego Tabelę { "7" }, z wariacjami dobową, geomagnetyczną, półroczną, sezonowo-szerokościową i helową) względem statycznej atmosfery USSA76. Można uruchomić z CLI/wiązań jako rodzaj scenariusza <c1/> (scenarios/space-weather.toml)

seg-c76b8c395ef0 = Okno startowe i geometria wznoszenia (analiza misji)

seg-6066c634faba = Azymut(y) startu w dwóch ciałach (sin Az = cos i / cos lat), minimalna osiągalna inklinacja, prędkość kołowa, wschodni bonus obrotu Ziemi, Δv zmiany płaszczyzny typu dogleg i dobowe okazje, a przy podanej epoce i wierszach IERS finals2000A prędkość punktu względem prawdziwego bieguna (launch::site_rotation_speed_at). Można uruchomić z CLI/wiązań jako rodzaj scenariusza <c1/> (scenarios/launch-window.toml)

seg-ff2cd766bb52 = Korytarz balistycznego wejścia w atmosferę (Allen–Eggers)

seg-c3f3422f96e4 = Maksymalne opóźnienie (niezależne od współczynnika balistycznego), prędkość i wysokość przy maksymalnym przeciążeniu oraz prędkość maksymalnego nagrzewania dla balistycznego wejścia w atmosferę wykładniczą. Można uruchomić z CLI/wiązań jako rodzaj scenariusza <c1/> (scenarios/reentry.toml)

seg-7b4a8e25c3c9 = Adaptacyjne kodowanie i modulacja DVB-S2 wzdłuż przelotu łącza w dół LEO

seg-3912fb8ccb15 = Es/N0 łącza w dół wzdłuż każdego przelotu jednego satelity nad jedną stacją (EIRP, strata w wolnej przestrzeni, strata atmosferyczna według prawa cosecans, pozostałe straty, G/T, stała Boltzmanna, szybkość symbolowa), najefektywniejszy MODCOD DVB-S2, który przekracza swój próg quasi-bezbłędny z ETSI EN { "302" } 307-1 V1.4.1 Tabela { "13" } plus margines implementacyjny w każdym kroku, wolumen danych ACM przelotu oraz punkt odniesienia ze stałym kodowaniem, który zamyka się na masce i przy najdłuższej odległości. Można uruchomić jako rodzaj scenariusza <c1/>. Dane wejściowe ilustracyjne; MODELLED.

seg-19603a7e0fe8 = Harmonogramowanie kontaktów naziemnych wielu satelitów i wielu stacji z rozstrzyganiem konfliktów

seg-40edeae6e48b = Kandydackie kontakty z każdego przelotu satelita-stacja wraz z jego wolumenem danych ACM; konflikty, w których jedna antena obsługiwałaby dwa satelity w czasie swojego przezbrojenia albo jeden satelita nadawałby w dół do dwóch stacji naraz; ważony priorytetami cel dostarczania ograniczony zaległościami każdego satelity; plan zachłanny z leniwą wartością krańcową, punkt odniesienia typu kto pierwszy i dokładne przeszukiwanie z ograniczeniami (branch and bound) na do { "26" } kandydatach, ze zgłoszoną luką optymalności planu zachłannego. Można uruchomić jako rodzaj scenariusza <c1/>. Dane wejściowe ilustracyjne; MODELLED.

seg-3742d2aea62a = Oszczędne ujęcie kosztu na pokrycie / ROI

seg-4228311689f8 = Koszt na procent pokrycia + ROI pokrycie-na-euro nad silnikiem doboru wielkości konstelacji; koszt na satelitę jest przedziałem niski/nominalny/wysoki podanym przez wywołującego (bez zmyślonych cen)

seg-8ba6ee9acc8a = Wpływ niewykrytego zdarzenia na integralność (HPL/VPL zależne od kontekstu względem limitu alarmu)

seg-f5985399d0d5 = Odwzorowuje niewykryty bias spoofingu/zagłuszania na efektywny błąd → region Stanforda (dostępny/niedostępny/MI/HMI) względem HAL/VAL właściwych dla kontekstu (otwarte niebo a miasto)

seg-37d43b5b918a = Arkusz parametrów modelu błędu CAI z cytowaniami ({ "13503" })

seg-0b6a901f5ad2 = Przedziałowa (najlepszy/nominalny/zachowawczy) wydajność interferometru zimnych atomów — niestabilność biasu, błądzenie losowe prędkości/kąta, stabilność współczynnika skali, szybkość próbkowania ograniczona interrogacją, zakres dynamiczny niejednoznaczności prążków — każda z możliwością prześledzenia cytowania; zasila QuantumNavBudget bez modelowania sprzętu

seg-c93f2d3a3167 = Benchmark integralności czasu (conformance) — klasyfikator epok diagramu integralności Stanforda

seg-712d5c35a6a6 = Klasyfikacja epok diagramu integralności Stanforda TIB (nominalna / niedostępna / MI / HMI)

seg-573aa0193cb3 = Benchmark integralności czasu (conformance) — ocena pokrycia integralności

seg-4d86f3c2d8f5 = Ocena pokrycia integralności TIB (wskaźniki HMI/MI/dostępności + werdykt pokrycia nadgraniczeniem)

seg-372dd0fdb025 = Benchmark integralności czasu (conformance) — katalog uszkodzeń (generatory parametryczne)

seg-2604e7cf27d2 = Menu uszkodzeń TIB (rozbieżność dziedzin, uderzenie zegara, dryf holdover, opóźnienie statyczne/narastające/symetryczne/asymetryczne, powtórzenie w obrębie świeżości, selektywne ścieżkowo, kworum k-z-N)

seg-90c0eb1e7c14 = Benchmark integralności czasu (conformance) — werdykt pochłaniania niewykrywalnych

seg-f713acf042ff = Werdykt pochłaniania niewykrywalnych TIB (symetryczne/powtórzenie musi pochłonąć PL, nigdy nie zgłaszać jako wykryte)

seg-8adbbd2cdb74 = Samoopis raportu hybrydowego optycznego/RF

seg-2a5e48b558e1 = Raport hybrid-optical-rf podaje konfigurację łącza, z którą faktycznie został uruchomiony (długość fali nośnej, apertura nadawcza i odbiorcza, odległość, szerokość impulsu, czas całkowania, sprawności i straty, rozstrzygnięte wartości domyślne) i zawiera blok jednostek podający jednostkę i klasę pochodzenia każdej wielkości, którą artykuł prawdopodobnie przytoczy, w tym ślady kowariancji przekazania w metrach kwadratowych

seg-0691f3dee8cb = Dostępność łącza hybrydowego optycznego/RF po stronie RF

seg-72ccb655caf0 = Raport hybrid-optical-rf podaje dostępność łącza RF, złożoną z wielkości, które silnik już oblicza, a nie z zaimportowanej klimatologii, i podaje to złożenie jako nazwaną regułę: A_rf = I_closure * I_track, gdzie I_closure jest werdyktem zamknięcia jednokierunkowego bilansu łącza CCSDS-401 / DSN-810-005 (linkbudget::link_budget, margines Eb/N0 >= { "0" }) przy własnej odległości scenariusza, a I_track jest werdyktem pętli śledzenia (jamming::lock_status) dla C/N0, które TEN SAM bilans zwrócił. Każdy czynnik przenosi klasę pochodzenia swojego wejścia do wyniku, a czynniki celowo NIE ujęte w iloczynie -- widoczność geometryczna, odmowa przez zakłócenia i klimatologia przerw RF -- są nazwane wraz z powodem, zamiast po cichu ustawiane na { "1" }. Rozstrzygnięta noga RF jest powtórzona jako osobny blok rf_link_configuration, a wartości ciągłe obok wskaźnika (margines łącza, margines C/N0, zamknięte zasięgi zamknięcia i śledzenia w postaci zamkniętej oraz wykorzystanie zasięgu) są inwersjami zasięgu tego samego bilansu. Raport stwierdza w całości, w bloku i we wpisie jednostek, na który trafia czytelnik, że ta wartość jest OGRANICZONA MARGINESEM/GEOMETRIĄ i DETERMINISTYCZNA, podczas gdy dostępność optyczna jest OGRANICZONA POGODĄ/KLIMATOLOGIĄ i probabilistyczna, więc nigdy nie można ich przytaczać jako porównywalnej pary procentów

seg-22c5df9b6c7c = Porównanie dalmierzy optycznego i RF na równych warunkach

seg-70eb396f40af = Raport hybrid-optical-rf podaje stosunek dokładności dalmierzy optycznego do RF, z JEDNĄ konfiguracją, przy której oceniono obie nogi, zawartą w tym samym obiekcie: ta sama jednokierunkowa ścieżka, ta sama odległość i ten sam czas akumulacji. Noga optyczna to ograniczenie CRLB ToA silnika, limitowane fotonami, dla jednokierunkowej liczby fotonów; noga RF to termiczne drganie śledzenia kodu DLL early-late silnika przy C/N0, które własny bilans łącza silnika zwraca dla tej samej jednokierunkowej odległości. Szerokość pasma szumowego pętli jest wyprowadzona, a nie wybrana: B_L = 1/({ "2" }*integration_s) umieszcza nogę RF dokładnie przy optycznym czasie akumulacji, a jeśli wywołujący ją nadpisze tak, że oba czasy uśredniania się rozchodzą, stosunek jest REFUSED — null, z nazwanym niedopasowaniem i oboma czasami — zamiast być podawany przy dwóch punktach pracy. Nie tworzy się żadnego stosunku względem WYBRANEGO parametrycznego rf_position_sigma_m scenariusza, a odmowa podaje powód: to wejście nie niesie w ogóle żadnej konfiguracji. Opublikowany dwukierunkowy optyczny wynik główny oraz dokładny czynnik łączący go z jednokierunkową nogą porównania są emitowane obok stosunku, więc raportu nie da się odczytać jako niosącego dwie niezgodne optyczne sigmy

seg-3f26f598e013 = Samoopis raportu bilansu łącza

seg-b88bf41d6d4c = Raport bilansu łącza podaje każdą stałą bezwzględną, z której obliczono jego własny margines -- częstotliwość nośnej użytą w stracie w wolnej przestrzeni, EIRP, współczynnik jakości, zbiorczą stratę i człon Boltzmanna -- plus wymagane G/T, przy którym margines wynosi zero, stałą łącza (EIRP - straty - wymagane Eb/N0), która jest jedyną kombinacją, jaką kiedykolwiek może ustalić opublikowana tabela szybkość/zysk, oraz, gdy wywołujący poda temperaturę szumową systemu, zysk anteny odbiorczej wynikający z tego współczynnika jakości

seg-a7b192e27cb5 = Tabela skrzyżowania czasu księżycowego dla poszczególnych klas zegarów

seg-cab605dc6ea2 = Jeden przebieg budżetu czasu księżycowego emituje wiersz skrzyżowania zegar-kontra-układ dla każdej klasy zegara względem jednego wspólnego członu układu, tak że zegar jest jedyną zmienną w porównaniu; każdy wiersz niesie skrzyżowanie osiągnięte na dwa sposoby -- wyznaczone bisekcją z ogólnej potęgowej krzywej błędu czasu i odwrócone algebraicznie z dominującego typu szumu wiersza -- wraz z różnicą względną między nimi

seg-18c72a7565d6 = Ślad przechwycenia względem wysokości i szerokości wiązki

seg-9c30a0ab5233 = Dwuosiowy przegląd ważonego wzorcem, ograniczonego wysokością śladu przechwycenia na powierzchni po wysokości nadajnika i średnicy czaszy, emitowany jako jeden wiersz na punkt pracy wraz z szerokością wiązki połowicznej mocy wynikającą z każdej średnicy, a przechwycenie limbu podawane jako PRÓG -- dla wiersza J/S limbu, jego margines i moc nadawcza, która by go zamknęła; dla siatki zlokalizowane przecięcia albo jawne stwierdzenie, że limb nie jest osiągany nigdzie na siatce, wraz z niedoborem

seg-fc0a64b9a280 = Odtwarzalność księżycowego budżetu błędu czasu

seg-5d5970506b9c = Scenariusz lunar-time-budget publikuje swoje wyniki tablicowe jako tabelę w formie długiej (indeks siatki, czas uśredniania, człon) obok raportu, więc siedem krzywych x(tau) dla poszczególnych członów i suma kwadratowa są wynikiem silnika, a nie czymś, co czytelnik odbudowuje z opisu metody

seg-675887733454 = Księżycowe laboratorium czasu stacji: holdover miniRAFS względem LTC

seg-7dfedc40da6a = Opcjonalny blok [time_lab] scenariusza lunar-time-budget modeluje zegar księżycowej stacji odniesienia (domyślnie klasa miniRAFS, dowolna nazwana klasa albo karta urządzenia dopasowana do podanych punktów stabilności), sterowany do Koordynowanego Czasu Księżycowego, a następnie swobodnie biegnący lub ponownie sterowany co N sekund: krzywa błędu czasu x(t) jako suma kwadratowa potęgowego członu zegara, stałej reszty sterowania (ILLUSTRATIVE), stałej reszty realizacji LTC i opcjonalnego członu szybkości zależnego od wysokości stacji; czas po sterowaniu do { "1" }, { "10" } i { "100" } ns (lub podanych progów) wyznaczony bisekcją obok odwrotności w postaci zamkniętej dla dominującego typu szumu oraz człon dominujący przy każdym podanym horyzoncie, wszystko z jednostkami

seg-af3ff120b707 = Księżycowa geodezyjna VLBI

seg-cfd7d0126028 = Opóźnienie VLBI w polu bliskim dla bazy ziemskiej obserwującej księżycową latarnię + pochodne cząstkowe

seg-e08e98908f3a = Ziemskie GNSS w odległości księżycowej

seg-dd8ce373d1f6 = Odbiór ziemskiego GNSS w odległości księżycowej: warstwa słabego sygnału, którą nazywa Tabela { "1" } z P7 i dla której silnik nie miał modelu. Dla każdego satelity i każdej epoki oblicza kąt poza osią względem nadiru nadajnika, czy Ziemia zasłania prostą ścieżkę, odległość ukośną i jej stratę w wolnej przestrzeni, zysk nadawczy pod tym kątem, moc odbieraną i gęstość nośnej do szumu; następnie agreguje tylko łącza przekraczające próg śledzenia i przeszukuje pełny obrót konstelacji, tak aby odpowiedzią był ROZKŁAD, a nie jedna migawka. Wynik wyznaczają trzy fakty, a raport podaje każdy z nich: Ziemia widziana z promienia konstelacji zajmuje { "13.90" } deg, więc SZCZYT wiązki jest geometrycznie niedostępny dla jakiegokolwiek promienia skierowanego ku Księżycowi; pozostaje krawędź głównego listka i listki boczne, reżim, w którym LuGRE działał na Księżycu w { "2025" }; a strata ścieżki L1 wynosi około { "208" } dB, o jakieś { "25" } dB więcej niż płaci użytkownik naziemny. MEASURED na dołączonej geometrii klasy GPS z 24 satelitami w { "64" } epokach jednego okresu orbitalnego: dostępność SYGNAŁU { "0.375" } z najlepszym łączem { "30.93" } dB-Hz oraz dostępność ROZWIĄZANIA POZYCJI { "0.000" } - co najwyżej dwa jednoczesne łącza możliwe do śledzenia, nigdy cztery potrzebne do pozycji. Rozdzielenie tych dwóch dostępności jest sednem, a raport nie pozwala ich pomylić: ziemskie GNSS w odległości księżycowej jest warstwą klasy CZASU, a nie klasy pozycji, a priorytet warstwowej odporności musi przyjmować dostępność rozwiązania pozycji. Uwarunkowanie jest emitowane z tego samego powodu - każdy widoczny satelita leży wewnątrz stożka o szerokości kilku stopni widzianego z Księżyca, więc linie widzenia są z konstrukcji niemal równoległe. Można uruchomić jako rodzaj <c1/> Przeformułowane według D7: twierdzenie w odległości księżycowej dotyczy WZGLĘDNEJ gęstości nośnej do szumu między satelitami w jednej epoce, ze zmierzonych dwuwymiarowych wzorców nadawczych (NAVCEN Block IIR/IIR-M), plus widoczności geometrycznej; bezwzględne C/N0 nie jest twierdzone (Parker i in. podają wspólną stratę { "7" } do { "12" } dB).

seg-29df5b40a3f9 = Wyznaczanie orbity księżycowej: ziemskie GNSS a naziemne pomiary radiometryczne

seg-647902ebcee3 = Wyznaczanie orbity w prawie prostoliniowej orbicie halo (lub eliptycznej orbicie zamrożonej) z dwóch niezależnych rodzajów danych: pseudoodległości ziemskiego GNSS odbieranych na pokładzie (reguła łącza z wiersza ziemskie GNSS w odległości księżycowej, plus okultacja przez Księżyc) oraz naziemnej dwukierunkowej odległości i prędkości zmiany odległości z trzech stacji Deep Space Network. Każde jest jednokrokową metodą najmniejszych kwadratów wsadowych wokół orbity odniesienia z jej formalną kowariancją; ziarnowe Monte Carlo różnicy między dwiema estymatami sprawdza, czy obie kowariancje ją wyjaśniają (q = d' (P_G + P_R)^-1 d, chi-kwadrat z sześcioma stopniami swobody, gdy modele się zgadzają) oraz co niemodelowane przyspieszenie robi ze statystyką.

seg-652bdc29deea = Rozwiązywanie niejednoznaczności fazy nośnej na Księżycu: powierzchnia i orbiter

seg-02496f9e9af2 = Faza nośnej i kod ziemskiego GNSS z pojedynczą różnicą między odbiornikami na księżycowej stacji powierzchniowej i orbiterze, z profilowanym (wyeliminowanym) różnicowym zegarem na epokę, jedną niejednoznacznością na ciągły przelot i najdłuższym przelotem jako gauge. Zmiennoprzecinkowa kowariancja niejednoznaczności jest dopełnieniem Schura; LAMBDA rozwiązuje liczby całkowite, wskaźnik bootstrapowy jest podawany obok ziarnowego wskaźnika sukcesu całkowitoliczbowych najmniejszych kwadratów Monte Carlo oraz zmiennoprzecinkowych i ustalonych sigm pozycji. Podano tak, jak stwierdzono: przy zarejestrowanych { "12" } dBi problem podwójnych różnic nie daje się sformułować (poprawka { "1" } przeniosła wartość domyślną na { "25" } dBi po obejrzeniu wyłącznie liczników dostępności), a przy { "25" } dBi ustalenie całkowitoliczbowe NIE zostaje osiągnięte - poza zasięgiem (co najwyżej kilka procent), choć rozwiązanie zmiennoprzecinkowe poprawia się wraz z łukiem.

seg-11dd1bb8e4e1 = Współestymacja układu księżycowego: stacje powierzchniowe i orbitery

seg-a38c8d95e6c9 = Informacja Fishera siedmioparametrowego datum układu księżycowego z ziemskiego dalmierzenia laserowego do pięciu reflektorów samych oraz z dodanymi odległościami orbiter-stacja powierzchniowa: macierz informacji, rząd, sigmy Craméra-Rao, miara degeneracji modułu identyfikowalności księżycowej i ziarnowe losowe zbiory stacji. Orbita jest traktowana jako znana w osiach księżycowych (jej błąd niesie sigma odległości orbitera).

seg-862977c4bb01 = Precyzja powiązania układów przez przestrzeń: współlokowane GNSS, VLBI i dalmierzenie laserowe

seg-a9ae8e99f00d = Precyzja Craméra-Rao międzytechnikowych przesunięć translacji, skali i obrotu między układami GNSS, VLBI i dalmierzenia laserowego, gdy jeden statek kosmiczny niesie wszystkie trzy, z pozycją statku wyeliminowaną w każdej epoce i dziewięcioma uciążliwymi parametrami powiązań lokalnych niosącymi a priori, przeglądane po dokładności powiązania lokalnego. Kowariancje drogą pierwiastka kwadratowego (równania normalne gubią cyfry, gdy techniki są niemal doskonałe).

seg-ae627996875e = Wrażliwość księżycowych liczb Love'a i libracji

seg-28780d07c4a7 = Informacja Fishera h2, k2, l2 i fizycznych amplitud libracji z dalmierzenia laserowego (promieniowe i poziome przemieszczenie pływowe, obrót reflektora), śledzenia orbitera (przyspieszenie k2 stopnia 2 scałkowane wzdłuż linii widzenia, z usuniętym trendem), grawimetru powierzchniowego (współczynnik grawimetryczny { "1" } + h2 - { "1.5" } k2) i zegara powierzchniowego (względna szybkość ({ "1" } + k2 - h2) W2/c2, powiązana ze stałymi czasu księżycowego). Wartości nominalne h2 i l2 są punktami linearyzacji; badanie mówi, co jest wrażliwe na co, a nie jakie są te liczby.

seg-da712b740519 = Wzmocnienie DOP latarniami powierzchni Księżyca

seg-83e6341e01b1 = Rozmycie dokładności ze wzmocnieniem latarniami dla użytkownika na powierzchni Księżyca: wiersze linii widzenia widocznych satelitów i wiersze dalmierzenia widocznych latarni powierzchniowych są łączone w jedną macierz projektu i oceniane przez wspólne jądro DOP, a uzyskane DOP jest odwzorowywane na zrealizowaną dokładność 1-sigma W METRACH przez błąd ekwiwalentu użytkownika dla odległości każdej latarni, złożony jako suma kwadratowa członów synchronizacji zegara, wielodrogowości i pomiaru. Widoczność latarni to dwuwysokościowy horyzont geometryczny Księżyca bez atmosfery, który nie ma rozszerzenia refrakcyjnego i dlatego jest dokładny, a nie przybliżony. Można uruchomić jako rodzaj scenariusza <c1/>, który podaje same satelity, satelity plus latarnie oraz większą konstelację jako konkurencyjną drogę do tej samej geometrii. MEASURED na dołączonej geometrii wzorcowej (użytkownik na -80 deg, trzy pomierzone latarnie, ilustracyjny LCNS z sześcioma satelitami przy t={ "0" }, maska { "5" } deg): { "5" } widocznych satelitów daje PDOP { "9.6941" } i 3-D 1-sigma { "11.222" } m; dodanie latarni, które faktycznie przekraczają horyzont, daje PDOP { "4.1160" } i { "4.765" } m, czynnik { "2.355" }; usługa z 24 satelitami daje natomiast PDOP { "2.4226" } i { "2.804" } m, czynnik { "4.002" }. Raport drukuje liczbę WIDOCZNYCH latarni, a nie skonfigurowaną, a na tej geometrii tylko JEDNA z trzech latarni przekracza horyzont: dwa boczne punkty leżą około { "333" } km od użytkownika wobec horyzontu { "86" } km dla anteny { "2" } m, więc czytelnik nigdy nie musi zakładać, że wszystkie trzy się przyczyniły

seg-845e9f5eec81 = Poziom ochrony trybu wspólnego i całkowita obwiednia integralności

seg-e4ec41d0f5e1 = Obserwowalność bezwzględnej pozycji stacji księżycowych (defekt układu odniesienia)

seg-b3e4160042d2 = Obserwowalność wspólnego rozwiązania księżycowego na podstawie informacji Fishera: bez ziemskich linii bazowych bezwzględny układ odniesienia leży w przestrzeni zerowej HᵀWH (pozycja stacji jest nieobserwowalna); ≥{ "3" } linii bazowych przywraca pełny rząd i ogranicza błąd Cramér–Rao stacji, który estymator osiąga

seg-2ed7181c97dd = Generowanie kodów rozpraszających LunaNet AFS (LSIS V1.0)

seg-13ff6c381275 = Kody Augmented Forward Signal z LSIS V1.0 ({ "29" } stycznia { "2025" }): 10230-chipowy kod podstawowy AFS-Q wygenerowany z konstrukcji pilota L1C według IS-GPS-800 z indeksami IS-GPS-800J (te same { "210" } przypisań, które drukuje Dodatek D do LSIS), 2046-chipowe kody Golda AFS-I wygenerowane z g1 = x^{ "11" } + x^{ "2" } + { "1" } i g2 = x^{ "11" } + x^{ "8" } + x^{ "5" } + x^{ "2" } + { "1" } z opóźnieniem G2 każdego PRN odzyskanym z pliku Załącznika { "3" } do normy, cztery kody wtórne, 1500-chipowe kody trzeciorzędne, tymczasowe przypisanie węzłów z Tabeli { "11" } oraz warstwowy kod pilota. Zawartość LSIS jest odczytywana w czasie działania z lokalnej pamięci podręcznej zweryfikowanej SHA-256, wypełnianej z pliku PDF hostowanego przez NASA, i nigdy nie jest redystrybuowana

seg-56c7aeac59c1 = Domknięta pętlą dekodowalność LunaNet AFS przez niezależny odbiornik (LSIS V1.0)

seg-da2d29d437b0 = Nagranie Kshana AFS pozyskane, śledzone i zdekodowane przez niezależny programowy odbiornik i porównane z etykietami prawdy samego nagrania. Dowodzi to wyłącznie zgodności z normą (conformance) i spójności etykiet; nie jest to twierdzenie o fizyce kanału, propagacji, mocy odbieranej ani budżetach łączy, których wartości w nagraniu są wybranymi danymi wejściowymi

seg-780369fb9a54 = Zgodność z normą (conformance) generatorów GPS L1 C/A względem siebie

seg-ee47b60515f1 = Kody rozpraszające GPS L1 C/A (sdr::CaCode) i podramki LNAV 1-3 (gps_lnav: kwantyzacja pól według IS-GPS-200 z wartością pi z specyfikacji, upakowanie w kodzie uzupełnieniowym do dwóch, słowa TLM i HOW, parzystość z Tabeli 20-XIV z inwersją D29*/D30*, bity rozwiązujące parzystość w słowach { "2" } i { "10" }) porównane bit po bicie z gps-sdr-sim na jego dołączonym brdc0010.22n ({ "32" } satelity)

seg-bf429c8f00fb = Pozyskiwanie GNSS IQ na niezależnie wygenerowanych próbkach I/Q

seg-9a0c52bfb06e = iq::acq::acquire (równoległe przeszukiwanie fazy kodu metodą FFT z progiem Marcum-Q dla detektora kwadratowego) z repliką GpsL1Ca, na { "20" } ms własnego 8-bitowego wyjścia I/Q gps-sdr-sim zdekodowanego dekoderem próbek iq::io (ci8, { "2.6" } MHz, { "11" } satelitów, bez szumu): przeszukano każdy PRN od { "1" } do { "32" } w dwóch oknach { "10" } ms, a wynik porównano z fazą kodu i Dopplerem zmodulowanymi przez gps-sdr-sim

seg-f40dc3dac990 = Monitory IQ oceniane w kampaniach odtwarzania laboratoryjnego: detekcja, niewykryte zdarzenia, fałszywe alarmy i zamknięte wzory na fałszywe alarmy

seg-93fb3109728c = iq::campaign::detect i runner kampanii: opcjonalna tabela [monitors] uruchamia monitory IQ na każdej komórce w jednym przebiegu runnera. Monitory mocy i widma widzą próbki po każdym łańcuchu toru wejściowego; monitory C/N0, SQM i zaczepienia widzą aktualizacje pętli każdego śledzonego kanału. Każdy alarm jest oceniany względem podanych zdarzeń: wykryty lub niewykryty dla (zdarzenie, rodzaj alarmu, kanał), czas do detekcji oraz fałszywe alarmy poza zdarzeniami w stosunku do ich ekspozycji. Dla każdego testu podano zamknięty wzór na fałszywy alarm: moc na blok (dokładny ogon rozkładu Gamma), nadmiar widmowy na blok (przybliżenie), kurtoza (jednostronny rozkład Gaussa), impulsy (górne ograniczenie dwumianowe), SQM na uśrednioną aktualizację (2Q(k) = Q(1/2, k^2/2), nowe) oraz ARL0 CUSUM dla C/N0 (Siegmund). Bez tabeli komórki, klucze i skróty pozostają bez zmian. Nie jest syntezowany żaden przebieg zakłócenia

seg-5b7eb7ddb474 = Krzywa ROC detekcji monitorów IQ z ocenionej kampanii odtwarzania laboratoryjnego

seg-57fe85965c9c = iq::campaign::detect (windows, roc) i iq::campaign::report::rocs: każda komórka kampanii z monitorami przechowuje, dla każdego rodzaju alarmu i kanału, maksimum własnej statystyki testowej monitora w każdym podanym oknie zdarzenia (pozytywne) oraz w kafelkowanych oknach roc_window_s poza zdarzeniami (negatywne). Statystykami są odchylenie mocy bloku, nadmiar PSD, kurtoza z, |z| uśrednionej metryki SQM oraz CUSUM dla C/N0. Raport łączy je według rodzaju w empiryczną krzywą ROC na poziomie okien z jej AUC i punktem pracy przy skonfigurowanym progu, zapisywaną jako roc.json (kshana.campaign-roc/1) oraz sekcję Detection ROC w report.html. Kampania bez monitorów nie zapisuje żadnego z nich

seg-3a3cfa322f01 = Kalibracja modeli C/N0 i zaczepienia otwartego odbiornika do wyników kampanii IQ, z podanym błędem predykcji

seg-9affed6218d6 = iq::labfit (campaign, cn0, iqfit, iqreport) i <c1/> na <c2/>, Python <c3/> oraz narzędzie MCP labfit (foldery kampanii wyłącznie w jego katalogu roboczym): odczytuje folder wyjściowy <c4/> według jego DIGEST i grupuje ocenione komórki w jednostki dopasowania (sygnał x projekt pętli x łańcuch toru wejściowego x typ zagłuszacza, nigdy niełączone). Dla każdej jednostki dopasowuje zmierzone C/N0 do podanego J/S w postaci separacji widmowej. Q_eff nie jest identyfikowalne z danych C/N0 bez niezależnego pomiaru mocy zagłuszacza i sygnału, dlatego Q jest podawane, nigdy dopasowywane (tabela typów, q zdarzenia, a dla nieznanego typu najbardziej szkodliwa podana wartość, cw Q = { "1" }). Dopasowywanym parametrem jest identyfikowalne przesunięcie delta_eff = delta - { "10" } log10 Q, a strażnik korelacji zgłasza degenerację. Przedziały C/N0 zaczepione poniżej { "90" } % są cenzurowane i wymienione. Próg J/S jest podany bezpośrednio i wzorem zamkniętym; model pętli śledzącej i model empiryczny zaczepienia są sprzężone przez model C/N0, z czasami zaniku i ponownego zaczepienia. Bootstrap klastrowy z ziarnem po nagraniach ({ "1000" } replikacji) daje przedziały percentylowe; { "90" } % przedziały predykcji pochodzą z losowań reszt; zbiory z pominięciem jednego nagrania są podzielone na interpolację i ekstrapolację; wstępnie zarejestrowana tabela [validation] jest haszowana, a każdy próg oceniany jako PASS/FAIL. Raport kshana.labfit-iq/1 jako JSON, CSV i generowany Markdown, z blokiem jednostek. Wyłącznie syntetyczne (bez nagrania podmiotu trzeciego, bez przebiegu zagłuszacza). Ścieżka labfit z logów odbiornika pozostaje bez zmian

seg-9537d301c95e = Kodowanie GPS LNAV zdekodowane przez niezależną bibliotekę odbiornika

seg-909415621881 = Podramki LNAV 1-3 Kshana (gps_lnav::encode_subframes) dla { "32" } efemeryd brdc0010.22n podane do decode_word i decode_frame z RTKLIB: parzystość każdego słowa, dekodowanie podramek ze spójnym wydaniem danych oraz każdy zdekodowany parametr względem liczby całkowitej Kshana i względem wartości wejściowej

seg-f66855e35c53 = Kodowanie komunikatu nawigacyjnego GPS LNAV

seg-8caf8366e2f8 = Podramki LNAV 1-3 według IS-GPS-200 (gps_lnav::encode_subframes: kwantyzacja do najbliższej wartości każdego parametru zegara i orbity przy współczynnikach skali ze specyfikacji i jej wartości pi, upakowanie w kodzie uzupełnieniowym do dwóch, słowa TLM i HOW, parzystość z Tabeli 20-XIV z inwersją D29*/D30*, bity rozwiązujące parzystość w słowach { "2" } i { "10" }), czyli komunikat nadawany przez generator sygnału GPS L1 C/A

seg-c5c944357643 = Pozyskiwanie i estymacja C/N0 na rzeczywistych księżycowych danych IQ

seg-f5dcb5e06bf4 = Równoległe przeszukiwanie fazy kodu (acquisition::pcps_acquire: przenośne FFT, spójne składanie, akumulacja niespójna, próg chi-kwadrat dla prawdopodobieństwa fałszywego alarmu w całym przeszukiwaniu), udoskonalanie, korelacja otwartej pętli z Dopplerem kodu oraz estymator C/N0 M2M4, uruchomione na 4-bitowych partiach IQ LuGRE L1 odczytanych przez realdata::ion_sdr

seg-709626569a5c = Pozyskiwanie na rzeczywistych księżycowych danych IQ względem Dopplera przewidzianego z orbity (decyzja według mocy próbek)

seg-784ebd80c425 = acquisition::pcps_acquire z decyzją według mocy próbek na dziewięciu partiach L1 LuGRE spoza powierzchni z poziomami mid-rise; różnice Dopplera między pozyskanymi satelitami porównane z różnicami przewidzianymi na podstawie końcowych orbit ESA i zrekonstruowanej przez Firefly trajektorii Blue Ghost

seg-89875d67b253 = Pozyskiwanie na rzeczywistych księżycowych danych IQ oceniane według Dopplera przewidzianego z orbity

seg-956bcfeaf319 = acquisition::pcps_acquire z decyzją uśredniającą po komórkach (pik względem średniej komórki siatki, odporny na szum ograniczony pasmowo) na dziewięciu partiach L1 LuGRE spoza powierzchni z poziomami mid-rise; różnice Dopplera między pozyskanymi satelitami porównane z różnicami przewidzianymi na podstawie końcowych orbit ESA i zrekonstruowanej przez Firefly trajektorii Blue Ghost

seg-8fa779dd1788 = Pozyskiwanie na wstrzymanych rzeczywistych księżycowych danych IQ względem Dopplera przewidzianego z orbity

seg-484868771231 = acquisition::pcps_acquire (decyzja uśredniająca po komórkach, prawdopodobieństwo fałszywego alarmu { "1e-7" }) z refine_doppler_coherent na partiach L1 LuGRE zarejestrowanych na powierzchni Księżyca (I w górnym półbajcie, poziomy mid-rise); różnice Dopplera między pozyskanymi satelitami względem różnic przewidzianych na podstawie końcowych orbit ESA i jądra miejsca lądowania Firefly

seg-10af60b488b9 = Różnicowa stacja referencyjna klasy NovaMoon: znoszenie składowej wspólnej + resztka rosnąca z linią bazową + poziomy ochrony DGNSS

seg-c04a3591074c = Eksport interoperacyjności księżycowej

seg-91f4a066b3c0 = Eksport księżycowego układu odniesienia, czasu i efemeryd zgodny z LunaNet/IOAG (CCSDS OEM + KIF) z kontrolą zgodności z normą (conformance) w obiegu zamkniętym

seg-8ab65cbefb75 = Ocenianie zgodne z ramami odporności PNT

seg-c48198f31d63 = Podwyniki w każdym wymiarze dla własnych siedmiu kategorii odporności Kshana (nie terminów DHS), funkcji RDRR z RethinkPNT i kryteriów Yanga, każdy z etykietą Modelled i swoim czynnikiem; wstępny poziom RPCF z bramką ograniczonej degradacji. Samoocena wynikająca z symulacji, nigdy certyfikacja.

seg-d7bdb6fe186e = Badanie niestabilności decyzji dla wyniku odporności

seg-5fcf18a68bb1 = Określa ilościowo, jak pojedynczy wynik złożony / poziom RPCF zmienia kolejność architektur przy uzasadnionym simpleksie wag i zespole zagrożeń (odsetek zmian top-1, rozrzut tau Kendalla, odsetek zmian poziomu, zakresy rang); analizy deklarowane-vs-zmierzone i załamania różnorodności.

seg-1bf03544a010 = Reprezentatywność demonstracji i luki do lotu

seg-db24d16d38c9 = Rejestr rzetelności dla każdego wyniku, kwalifikujący wynik demonstracji: jego zewnętrzne kotwice, założenia modelowe, luki do lotu i reprezentatywny przedział TRL, z egzekwowanymi niezmiennikami (Validated wymaga zewnętrznej kotwicy; Modelled wymaga luki i nie może twierdzić powyżej TRL { "4" }).

seg-52ab936eb5f5 = Dowody kompromisu kwantowy kontra klasyczny (wspólna postać)

seg-a6679ed5bed7 = Jeden odtwarzalny obiekt TradeEvidence (stała ramka: scenariusz+ziarno+silnik; wspólne wartości kwantowe vs klasyczne dla każdego wskaźnika jakości z korzyścią o poprawnej polaryzacji, opcjonalny { "95" }% przedział ufności, etykieta zwalidowane/modelowane) niosący zapis reprezentatywności, tak aby każda pionowa kwantowego PNT raportowała kompromis w ten sam rzetelny sposób.

seg-20fee61b3107 = Biblioteka modeli błędów urządzeń kwantowych

seg-e42eabe9bc2a = Karty urządzeń (zegary optyczne/z uwięzionymi jonami/z jonami rtęci + zegary klasyczne ponownie użyte z holdover/clock_state; interferometr zimnych atomów; łącza transferu czasu klasyczne + splątane/jednofotonowe), każda niosąca zapis reprezentatywności; łącze splątane dodaje model precyzji czasu ograniczonej szumem śrutowym (~jitter/sqrt(R*tau), kara za zliczenia ciemne, podłoga systematyczna).

seg-86d71fd89f26 = Zaufany czas kwantowy (transfer czasu + bezpieczne rozpowszechnianie + anomalie)

seg-d2a3d37825ef = Kompletny łańcuch transferu czasu kwantowy vs klasyczny (dryf zegara + precyzja łącza w kwadraturze), ponownie użyty poziom ochrony czasu, wskaźnik jakości bezpieczeństwa wobec ataku opóźnienia/odtwarzania (1-P_md) oraz prawdopodobieństwo detekcji anomalii zegara + opóźnienie CUSUM, podane jako rzetelne TradeEvidence z zapisem reprezentatywności.

seg-eaf341ff4522 = Nawigacja kwantowa bez GNSS

seg-908a44a9f7c7 = Kwantowa (interferometr zimnych atomów) vs klasyczna nawigacja zliczeniowa INS klasy nawigacyjnej podczas przerwy w GNSS: narastanie błędu pozycji, holdover do progu pozycji oraz kompromis kwantowy kontra klasyczny jako rzetelne TradeEvidence; rzetelna uwaga o obserwowalności (bias jest nieobserwowalny bez poprawki, więc błąd rośnie).

seg-914132833f5a = Detekcja usterek/anomalii dla systemów kwantowego PNT

seg-f20392820b9d = Oznaczony katalog usterek kwantowych (skok/dryf częstotliwości zegara/utrata zaczepienia; skok biasu/wypadnięcie czujnika), AUC ROC statystyki detekcji z przedziałem ufności z bootstrapu oraz minimalna wykrywalna usterka przy ustalonym wskaźniku fałszywych alarmów; monitor wspomagany zegarem kwantowym wykrywa mniejsze usterki niż klasyczny, podane jako rzetelne TradeEvidence.

seg-d31be81dfd8f = Pasywna geolokalizacja emitera metodą TDOA/FDOA

seg-aa870cee16f6 = Lokalizacja emitera (zagłuszacza/spoofera lub źródła okazjonalnego dla odwróconego PNT) na podstawie różnicy czasów dotarcia w sieci odbiorników — przecięcie hiperboloid τᵢ=(Rᵢ−R₀)/c rozwiązane metodą najmniejszych kwadratów Gaussa–Newtona — oraz, po dodaniu różnicy częstotliwości dotarcia (różnic prędkości zmiany odległości) przy ruchomych odbiornikach, wspólne odtworzenie pozycji i prędkości; z dolnym ograniczeniem Cramér–Rao dla kowariancji pozycji wynikającym z geometrii pomiarów

seg-5bd3882531b6 = Konwekcyjne nagrzewanie w punkcie stagnacji (Sutton-Graves) przy wejściu 3-DoF

seg-4f97036ed72f = Konwekcyjny strumień ciepła w punkcie stagnacji q = k sqrt(rho/R_n) V^{ "3" } ze stałymi Suttona-Gravesa dla powietrza ziemskiego i atmosfery Marsa (NASA TR R-376, { "1971" }), jego szczyt i całkowite obciążenie cieplne wzdłuż wejścia 3-DoF, balistycznego lub nośnego przy stałym przechyleniu, na Ziemi lub Marsie.

seg-1b96577665fc = Radiometria obrazowania elektrooptycznego, MTF, względna odpowiedź krawędzi i GIQE { "4" } NIIRS

seg-38902593e841 = Budżet stosunku sygnału do szumu obrazowania w nadirze (luminancja sceny lambertowskiej, równanie kamery, szum śrutowy, ciemny, odczytu i kwantyzacji), systemowe MTF przy Nyquiście jako iloczyn dyfrakcji nieprzesłoniętej apertury, apertury detektora, liniowego rozmazania i gaussowskiego drgania, odpowiedź krawędzi i względna odpowiedź krawędzi całkowane z tego MTF, Q = lambda F / p oraz NIIRS według GIQE w wersji { "4" } bez kompensacji MTF. Uruchamialne jako rodzaj scenariusza <c1/>.

seg-07ca77a67207 = Straty grawitacyjne, aerodynamiczne, sterowania i przeciwciśnienia przy wznoszeniu rakiety

seg-7a1802cf2c80 = Płaskie wznoszenie z zakrętem grawitacyjnym wielostopniowego pojazdu nad nieobracającą się sferyczną Ziemią przez Standardową Atmosferę USA { "1976" } (gęstość i ciśnienie), z impulsem pochylenia, ciągiem zmniejszonym przez przeciwciśnienie dyszy, wypaleniami stopni na dokładnych granicach kroków oraz stratami grawitacyjnymi, aerodynamicznymi, sterowania i przeciwciśnienia całkowanymi obok stanu. Uruchamialne jako rodzaj scenariusza <c1/>.

seg-55e8345def8b = Dwukierunkowe równanie TWSTFT, budżet niepewności i stabilność łącza z szumem migotania i dobową nieodwracalnością

seg-5ca5226c24ec = Dwukierunkowe równanie TWSTFT rozwiązane dla T_A - T_B z opóźnieniami nadawania i odbioru stacji, asymetrią jonosferyczną góra/dół w paśmie Ku, różnicą opóźnień transpondera i członami Sagnaca, względem jego dokładnego modelu prostego; kwadraturowy budżet niepewności z TDEV łącza jako składnikiem typu A; dwukierunkowy szereg z białym szumem fazy i szumem fazy migotania (Kasdin-Walter), dobową nieodwracalnością i stałą resztą odwracalności; oraz tempo, RMS reszt, TDEV i ADEV dostarczonych szeregów zegara stacji Circular T, MJD-CSV lub IGS RINEX. Uruchamialne jako rodzaj scenariusza <c1/>.

seg-2f9be02c92bc = Numeryka atmosfery na skośnej ścieżce optycznej: wariancja Rytova, scyntylacja, prawdopodobieństwo zaniku gamma-gamma, uśrednianie po aperturze, głębokość optyczna chmur i czystego powietrza

seg-032cf76c2ec0 = Cn2 Hufnagela-Valleya całkowane wzdłuż ścieżki skośnej dla wariancji Rytova fali płaskiej i sferycznej (łącze w górę i w dół), wskaźnik scyntylacji Andrewsa-Phillipsa i parametry gamma-gamma, prawdopodobieństwo zaniku gamma-gamma i margines zaniku, współczynnik uśredniania po aperturze przy słabej turbulencji, głębokość optyczna chmur kolumny wody ciekłej oraz głębokość optyczna czystego powietrza z widzialności Kima plus Rayleigha, zastępujące zbiorczą stratę atmosferyczną budżetu łącza optycznego, gdy dostarczono atmosferę. Uruchamialne wewnątrz rodzaju scenariusza <c1/>.

seg-a2faab92e760 = Dostępność optycznej stacji naziemnej zależna od pogody i różnorodność stacji skorelowana odległością

seg-7f4e4e763d62 = Dostępność łącza optycznego względem podanego marginesu łącza na podstawie logarytmiczno-normalnego klimatu wody ciekłej w chmurach (ilość według ITU-R P.840, ekstynkcja optyki geometrycznej) i niezależnego zaniku turbulencji gamma-gamma, margines łącza potrzebny dla docelowych dostępności oraz pułap, którego żaden margines nie podnosi, logarytmiczno-normalne czasy trwania przerw, scenariusze „co jeśli” dla technik poprawy oraz jednoczynnikowa dostępność sieci z kopułą gaussowską, której korelacja par wynosi exp(-odległość/długość dekorelacji). Uruchamialne jako rodzaj scenariusza <c1/>.

seg-043ece801e72 = Ciągłość czasu i wyznaczania odległości podczas przerw optycznych

seg-bb9cb3fe4180 = Rozkład czasów trwania przerw stacji optycznej sprzężony z wariancją dryfu w postaci zamkniętej modelu holdover zegara: błąd czasu i wyznaczania odległości przy podanych kwantylach przerw, holdover do progu czasu, odsetek przerw i czasu przerw mieszczących się w nim oraz dostępność czasu A + U E[min(D, T_h)]/E[D], dla klasycznych i kwantowych klas zegarów. Uruchamialne wewnątrz rodzaju scenariusza <c1/>.

seg-b119df65d2a7 = Margines łącza optycznego w czasie: jedna realizacja pogody stacji z ziarnem

seg-06125f3cae90 = Opcjonalna tabela <c1/> (duration, step, seed) sprawia, że rodzaj <c2/> zapisuje także, dla każdej stacji, jedną realizację z ziarnem podanego modelu stacji w czasie: epizody chmur (okresy czyste wykładnicze, przerwy chmur logarytmiczno-normalne z podaną średnią i rozrzutem, udział czasu w chmurze ustawiony na podane prawdopodobieństwo chmur), jedna logarytmiczno-normalna kolumna wody ciekłej na epizod chmur, jedna próbka scyntylacji gamma-gamma na krok, a z nich margines łącza, zaniki od chmur i scyntylacji oraz flagę łącza aktywnego, z zrealizowaną dostępnością, udziałem chmur, liczbą przerw i najdłuższą przerwą. Bez tabeli wynikiem jest dokument { "0.37" }. Losowania przechodzą przez przenośne trasy rozkładów i matematyki, więc natywny i wasm32 dają te same bajty.

seg-58cbf576c959 = Czytnik pliku danych orbity TRK-2-18 i model rampowanego Dopplera 2-way dla Marsa

seg-d1055650a77f = Czytnik plików danych orbity DSN (TRK-2-18): 36-bajtowe grupy rekordów (etykieta pliku, identyfikator, dane orbity, rampy każdej stacji, przesunięcia zegarów, podsumowanie, koniec pliku), a w każdym rekordzie danych orbity znacznik czasu od { "1950" }, opóźnienia w dół i w górę, obserwabla, stacje, typ danych, pasma, ważność, kanał, statek kosmiczny, 46-bitowa częstotliwość odniesienia i czas kompresji; czasy początku i końca ramp, tempa i częstotliwości początkowe. Na jego podstawie rampowany model Dopplera 2-way w paśmie X (całkowane rampy łącza w górę, czas przelotu światła tam i z powrotem z Shapiro i troposferą, stacje DSN przez łańcuch IAU 2006/2000A CIO i IERS EOP, czas stacji) oraz wsadowe wyznaczanie orbity orbitera Marsa (pole GMM-3, ciała trzecie, SRP, opór).

seg-455dc946c965 = Multiplikatywna estymacja orientacji EKF z żyroskopu i czujnika gwiazd

seg-553d043438b4 = Multiplikatywny EKF Leffertsa-Markleya-Shustera: stany błędu orientacji w układzie ciała i biasu żyroskopu, propagacja z prędkością kątową z żyroskopu pomniejszoną o oszacowanie biasu i dyskretnym szumem procesu Farrenkopfa (błądzenie losowe kąta i prędkości), aktualizacje z czujnika gwiazd z residuum { "2" } vec(q^-1 q_st) w postaci Josepha oraz reset multiplikatywny; dyskretny symulator żyroskopu i czujnika gwiazd Farrenkopfa. Rodzaj <c1/> może domknąć pętlę sterowania na swoim oszacowaniu.

seg-a971ff07592a = Cykl pracy apertury: nawigacja kontra łączność

seg-5b0ba97379bf = Jeden przebieg przyjmuje plan kontaktów (listę okien aos_s/los_s, z których każde prosi aperturę o nawigację lub łączność — to samo słownictwo okien, które emituje <c1/>, konwertowane przez <c2/>), liczbę apertur i jawną politykę arbitrażu, a zwraca cykl pracy nawigacji, cykl pracy łączności, cykl bezczynności i przerwę dla każdej sesji. Polityka jest daną wejściową z udokumentowaną wartością domyślną (<c3/>; także <c4/> i niewywłaszczająca <c5/>), a raport niesie rozstrzygniętą politykę, jej pełną definicję oraz definicje cykli pracy i przerw, ponieważ wartość cyklu pracy podana bez reguły arbitrażu nie jest odtwarzalna. Harmonogram jest dokładnym przeglądem przedziałów po granicach okien, więc okno, które kończy się dokładnie tam, gdzie zaczyna się następne, nigdy nie konkuruje, a sekundy apertury nawigacji, łączności i bezczynności są akumulowane niezależnie w tym jednym przeglądzie. Uruchamialne jako rodzaj scenariusza <c6/>

seg-43cd7aa7ab53 = Zagłuszanie RF nawigacji powierzchniowej na Księżycu (J/S dla każdego satelity)

seg-e0566f37ad8f = Natywny księżycowy stosunek zagłuszacza do sygnału, efektywne C/N₀ i utrata zaczepienia dla użytkownika selenograficznego na powierzchni pod zagłuszaczem powierzchniowym (lub podniesionym), w ilustracyjnej konstelacji klasy Moonlight/LCNS ze źródeł publicznych. Składa otwarty łańcuch zagłuszania (j_over_s_db, effective_cn0_dbhz, rx_antenna_gain_db, lock_status, q_factor, nominal_cn0_dbhz, free_space_path_loss_db) z otwartą księżycową geometrią nieba (lunar_service::LunarConstellation + topocentryczna, lunar::selenographic_to_mcmf); żadna geometria ani radiometria nie jest wyprowadzana ponownie. W odróżnieniu od ziemskiego rodzaju <c1/> tor sygnału nie jest ustaloną mocą odbieraną: izotropowa moc odbierana każdego satelity to jego własne EIRP budżetu łącza − FSPL(odległość skośna), więc J/S zmienia się od satelity do satelity wraz z księżycową odległością i elewacją. Emituje JEDEN WIERSZ NA KAŻDE WIDOCZNE ŁĄCZE (epoka, satelita) jako JSON i jako artefakt *.table.csv, z obiema mocami odbieranymi, których różnicą jest J/S, wydrukowanymi obok; zagregowane wskaźniki jakości leżą obok tej tabeli, nigdy zamiast niej. Uruchamialne jako rodzaj scenariusza <c2/>

seg-4c116e25c5c5 = Księżycowy kontur odmowy z pasmem niepewności z zmierzonego rozrzutu C/N₀

seg-77828c25f3ab = Raport <c1/> nie opiera już swojego konturu odmowy na jednym skalarze. Emituje pełny zmierzony rozkład C/N₀ sygnału pożądanego po tabeli dla każdego satelity — n, min, p05, p25, mediana, p75, p95, max, średnia, odchylenie standardowe z próby oraz własna asymetria próby (p95 − mediana) − (mediana − p05) — obok wierszy dla każdego łącza, które pozostają niezmienione. Kontur jest następnie raportowany przy każdej z tych statystyk pozycyjnych według OBU kryteriów odmowy, które rozpoznaje silnik, nigdy jednego zamiast drugiego: dotychczasowego kryterium stosunku mocy (J/S = { "30" } dB, ten sam próg, którego używają attack_surface i tracking_loop, oraz kryterium stojące za kolumną <c2/> opublikowanej księżycowej tabeli zagłuszania łączy) i kryterium utraty zaczepienia (efektywne C/N₀ spadające do tracking_threshold_dbhz), które jest kryterium, według którego oceniana jest kolumna links[].status tego raportu. Każdy punkt konturu jest podany na obu osiach płaszczyzny odmowy — EIRP zagłuszacza wymagane przy odległości scenariusza oraz odległość odmowy przy EIRP scenariusza — więc pasmo jest przedziałem na tych samych osiach, na których rysowany jest wykres konturu. Krawędzie pasma TO contour(p05) i contour(p95): to samo odwzorowanie w postaci zamkniętej zastosowane do własnych kwantyli próby, a nie sigma dopasowana do próby i nie mediana ± k·stdev, a raport mówi o tym w łańcuchu band_definition obok liczb. stdev jest emitowane dla ciągłości i nie jest przez nic używane. Kwantyl, którego C/N₀ jest już na poziomie progu śledzenia lub poniżej, nie ma skończonego J/S odmawiającego; te kolumny są emitowane jako null z policzonym powodem, a nie jako nieskończoność ani obcięty promień

seg-2d3944107ba0 = Moc detekcji międzymodalnego monitora integralności

seg-38bc7c0bfe57 = Raport hybrid-optical-rf podaje, co monitor chi-kwadrat międzymodalny może rzeczywiście WYKRYĆ, a nie tylko że przechodzi przypadek bez uszkodzeń: minimalny wykrywalny bias dla każdej monitorowanej osi (wschód, północ, góra, zegar) przy podanych w scenariuszu prawdopodobieństwach fałszywego alarmu i niewykrytego zdarzenia, krzywą mocy detekcji po obu stronach, bezszumową krotność biasu, przy której zrealizowana statystyka po raz pierwszy przekracza próg, oraz czas do detekcji dla rampy biasu o podanym tempie. Uszkodzenia są też wstrzykiwane przez rzeczywisty monitor, a zwracana przez niego statystyka jest raportowana obok predykcji analitycznej

seg-38cabd4921c1 = Ponowne narastanie kowariancji po przekazaniu względem limitu alarmu

seg-9287268bbada = Raport hybrid-optical-rf udostępnia model szumu procesu filtra i podaje, jak długo rozwiązanie po przekazaniu pozostaje w limicie alarmu: dla obu kierunków przekazania niesie kowariancję dla każdej osi, jaką pozostawiło przekazanie, propaguje ją naprzód przy podanym szumie procesu typu błądzenie losowe i raportuje czas, w którym 1σ przeskalowane współczynnikiem pokrycia osiąga poziome, pionowe i czasowe limity alarmu, który limit zostaje osiągnięty pierwszy, stałą czasową podwojenia wariancji oraz próbkowany profil dryfu, który obejmuje przekroczenie. PSD szumu procesu, współczynnik pokrycia i limity alarmu są wszystkie danymi wejściowymi z udokumentowanymi wartościami domyślnymi

seg-a3b8272862aa = Wzorzec anteny poza osią główną w eksporcie geometrii księżycowej

seg-27d246503a48 = Eksport geometrii dla każdego satelity niesie, dla każdej (epoka, satelita), kąt poza osią główną W SATELICIE oraz wzmocnienie nadawcze w stronę miejsca z rzeczywistego wzorca (Airy) równomiernie oświetlonej kołowej apertury i raportuje liczbę w wiązce według tego wzorca OBOK liczby w wiązce według symetrycznego przybliżenia wzmocnienie-do-szerokości wiązki (θ_3dB[deg] = √(31000/G_lin)), z różnicą emitowaną jako jawna korekta w łączach, w satelitach na epokę oraz jako najgorsza pojedyncza epoka. Obie domniemane sprawności apertury przybliżenia są emitowane ({ "0.641" } wobec reguły { "70" }·λ/D stopni, z którą jest podawane, { "0.920" } wobec jednostajnej kołowej apertury), więc sprawność, którą po cichu zakłada, jest podana, a nie wnioskowana. Domyślnie wyłączone: blok pojawia się tylko wtedy, gdy podano zarówno miejsce eksportu, jak i aperturę

seg-6fbfa234ef3e = Utrata zaczepienia pętli śledzącej i wciąganie spoofingu przy zakłóceniach

seg-f78c1f28a3f7 = Utrata zaczepienia obliczona z dynamiki pętli zamiast ze stosunku mocy: jitter termiczny 1σ fazy nośnej (Costas) i kodu (niespójny wczesny/późny) względem C/N₀ ze stratą kwadratową, względem podanych reguł 3σ_PLL + θ_e ≤ { "45" }° i 3σ_DLL + opóźnienie rampy ≤ d/2 chipa; progi C/N₀ zaniku i ponownego zaczepienia z nazwaną pętlą ograniczającą i histerezą WYPROWADZONĄ z szerszego pasma wciągania, a nie zadeklarowaną; deklarowany czas do utraty zaczepienia z dwuprogowego detektora zaczepienia z czasami potwierdzenia, raportowany osobno od fizycznego czasu ucieczki fazy (średni czas Viterbiego między poślizgami cyklu, w log₁₀ s, ponieważ obejmuje setki dekad); największe przesunięcie kodu i tempo Dopplera nośnej, za którymi pętle ofiary mogą nadążyć; oraz PROMIEŃ ODMOWY, jaki implikuje dynamika pętli, raportowany obok istniejącego promienia stosunku mocy, z ich różnicą ze znakiem jako własnym nazwanym polem. Uruchamialne jako rodzaj scenariusza <c1/>

seg-0f4d023fe2d4 = Kowariancja współrzędnych punktu na powierzchni Księżyca z harmonogramu opóźnień VLBI, odróżniona od kowariancji stacji ziemskich

seg-47352405133b = Trzeci wybór układu odniesienia, <c1/>, który utrzymuje każdą stację ziemską i estymuje wyłącznie związane z ciałem Księżyca współrzędne NADAJNIKA — konfiguracja, dla której faktycznie podaje się niepewność punktu na powierzchni Księżyca, ponieważ współrzędne stacji ziemskich są daną wejściową modelu opóźnienia, a nie jego niewiadomą. Istnieje, ponieważ kowariancja na poziomie stacji i kowariancja punktu na powierzchni to RÓŻNE WIELKOŚCI oddzielone ramieniem dźwigni ρ/B i nic wcześniej nie powstrzymywało podawania jednej względem drugiej. Emitowany blok <c2/> niesie ρ, najdłuższą linię bazową, ramię dźwigni, postać punktu na powierzchni łącza równopodziału c·σ_τ·(ρ/B)·√(g/N), obliczoną sigma nadajnika dla każdej współrzędnej i ich stosunek — stosunek jest null, a nie mylący, gdy nadajnik nie jest estymowany lub macierz ma deficyt rzędu. B jest brane jako NAJDŁUŻSZA obecna linia bazowa, najkorzystniejsza, więc stosunek może tylko zaniżać. Uruchamialne jako <c3/> z <c4/>, co jest odrzucane z komunikatem wskazującym brakującą daną wejściową, gdy nadajnik nie jest estymowany

seg-0315968c8214 = Księżycowe różnicowe PNT — budżet reszty łącza korekcji

seg-c6785166a44c = Trzy człony, które korekcja różnicowa zbiera między epoką, w której jest obliczona, a epoką, w której jest używana, każdy wcześniej pozostawiony jako niemodelowany zapas: błąd pomiaru geodezyjnego stacji referencyjnej (skorelowany między satelitami, niezależny od linii bazowej, transfer pozycji ~{ "1" }:{ "1" } i dowodnie niewzmacniany przez DOP), starzenie korekcji (zamrożony wektor błędu orbity przeprojektowany na linię widzenia, na którą własny propagator silnika stawia satelitę o jedno opóźnienie później, plus dryf zegara c·σ_y(τ)·τ z skalibrowanego prawa potęgowego) oraz jednostajna kwantyzacja łącza w dokładnej pełnej skali ±(orbit_err + clock_err) z wariancją step²/12. Raportowane zarówno w dziedzinie odległości, jak i pozycji, obok — nigdy zamiast — istniejącej reszty i poziomu ochrony, z krzywą opóźnienia obok pojedynczej wartości

seg-c42646ae4707 = Mapa pokrycia i dokładności księżycowej stacji referencyjnej

seg-1f9834b32629 = Przegląd Monte Carlo księżycowego modelu różnicowego PNT po siatce użytkowników przy biegunie południowym i dobie epok (rodzaj <c1/>): dla różnicowej stacji referencyjnej w znanym miejscu przy biegunie południowym, dla każdego punktu i dla regionu, percentylowy skorygowany i nieskorygowany błąd pozycji (3-D, poziomy, pionowy), dostępność z powodem dla każdej niedostępnej epoki (user_lt4, station_missing_sat), pokrycie względem progu podanego przed przebiegiem, poziomy ochrony DO-229E, promień pokrycia dla każdego sektora azymutu oraz budżet łącza korekcji na stacji i w najgorszym punkcie. Nie jest to twierdzenie o działaniu żadnego rzeczywistego systemu; bez powiązania z żadną agencją ani jej poparcia

seg-7ecf4b0038b0 = Księżycowe maski horyzontu terenu z podanego profilu lub polarnego DEM

seg-7102948907bc = Maski horyzontu zależne od azymutu dla każdego miejsca dla rodzaju lunar-station-coverage (stacja referencyjna i każdy punkt użytkownika) oraz siatki moonlight-service-volume i jej miejsca eksportu dla każdego satelity (każdy wiersz eksportu zyskuje clears_terrain), w formacie tabeli linii horyzontu { "0.36" } (skyline::Skyline, liniowa po azymucie z zawinięciem przy { "360" } stopniach; podany profil i horyzont DEM w jednym miejscu łączą się jako ich maksimum punktowe): podany [terrain] station_horizon lub user_horizon oznaczony swoim źródłem i/lub horyzont wyznaczony ray-marchingiem po południowo-polarnym stereograficznym DEM (układ polarny siatkowy LRO LOLA, odczytany z deskryptora ustalającego jego rozmiar i SHA-256, lub kafel realdata::lola_dem szerokość/długość z [terrain] dem_tile_path, podany z jego SHA-256) wzdłuż wielkich okręgów sfery księżycowej z dokładną krzywizną, od podanej wysokości masztu, przy podanym kroku azymutu i zasięgu. Satelita liczy się w miejscu, gdy przekracza płaską maskę mask_deg i horyzont w swoim azymucie (lunar_service::topocentric); epoka, w której horyzont zostawia mniej niż cztery satelity w punkcie, gdzie płaska maska daje cztery, jest liczona jako powód niedostępności terrain_masked. Dołączony DEM jest wycinkiem produktu LOLA LDEM_75S_240M w domenie publicznej, przepróbkowanym średnią z bloków { "5" } x { "5" } do { "1200" } m (data/lunar-dem/NOTICE.md). Gdy nieobecne, każde miejsce zachowuje płaską maskę, a każdy dokument jest identyczny co do bajtu

seg-d37bb01e270b = Księżycowe człony wielodrogowości i sprzętu odbiornika stacji referencyjnej

seg-1103199f019b = Opcjonalna sekcja [receiver] lunar-station-coverage (LRS-02): zależna od elewacji sigma wielodrogowości(el) = a + b exp(-el / el0) u użytkownika i na stacji (ziemska funkcjonalna postać RTCA DO-229 dla lotnictwa, jej a = { "0.13" } m, b = { "0.53" } m, el0 = { "10" } stopni jako wartości domyślne; na Księżycu każda wartość jest ILLUSTRATIVE), biała u użytkownika i pierwszego rzędu Gaussa-Markowa po epokach na stacji (rho = exp(-dt / tau)); szum termiczny kodu DLL typu wczesny-minus-późny sigma = L_c sqrt(B_L d / ({ "2" } C/N0) ({ "1" } + { "2" } / (({ "2" } - d) T C/N0))); biasy międzykanałowe dla każdego kanału stałe w próbie, u użytkownika i na stacji. Człony stacji wchodzą w jej korekcje, człony użytkownika w pomiary surowe i skorygowane, każdy na własnym strumieniu z ziarnem. Gdy nieobecne, każdy dokument pozostaje bez zmian

seg-03796cb741b6 = Narastanie błędu efemeryd księżycowej stacji referencyjnej w czasie opóźnienia korekcji

seg-13b0ae9a874a = Opcjonalna dana wejściowa orbit_err_growth_m_per_s lunar-station-coverage (LRS-03): korekcja zastosowana latency_s po jej obliczeniu pomija wzrost g latency_s błędu orbity nadawanej, g izotropowe o tempie 3-D RMS, losowane dla każdego satelity i próby na własnym strumieniu z ziarnem (tempo 1-sigma zakresu tau / sqrt({ "3" })), ponad przeprojektowaniem zamrożonego błędu na linię widzenia. Gdy nieobecne, każdy dokument pozostaje bez zmian. Dodatek K5 do porównania z opublikowanymi twierdzeniami, wstępnie zarejestrowany osobno, uruchamia K5 przy { "0.001" }, { "0.01" } i { "0.1" } m/s (ILLUSTRATIVE)

seg-90307f07e0ef = Tryby rozwiązania dla księżycowej stacji referencyjnej: więzy wysokości, trzy satelity, okno użytkownika statycznego

seg-366c7ad03fb2 = Opcjonalna sekcja [solution] w lunar-station-coverage (LRS-06): wiersz pseudopomiaru wysokości up . dx = e_h o podanym odchyleniu 1-sigma, ważony względem wierszy odległości; minimum trzech satelitów dozwolone tylko wraz z nim; oraz rozwiązanie metodą ważonych najmniejszych kwadratów na ostatnich window_epochs epokach, ze wspólną pozycją statyczną i jednym zegarem na epokę (odpowiedź filtra dla pozycji statycznej bez szumu procesu na tych samych danych; błędy epok traktuje się jako niezależne). Gdy sekcji brak, rozwiązanie migawkowe i każdy dokument pozostają bez zmian. Uzupełnienie porównania z opublikowanymi twierdzeniami, w stylu rozwiązania użytym w źródłach, wstępnie zarejestrowane osobno

seg-611ba369ed00 = Dokładność i pokrycie księżycowej stacji referencyjnej na tle opublikowanych twierdzeń

seg-4fe4f1cffa2b = Rodzaj lunar-station-coverage uruchomiony przy publicznych założeniach opublikowanych materiałów o księżycowej różnicowej stacji referencyjnej (cztery satelity nawigacyjne na zamrożonych orbitach eliptycznych o okresie { "24" } h, SISE { "10" } m { "95" } %, szum kodu { "0.30" } m, opóźnienie poprawek { "1" } s i { "600" } s, pomiar położenia stacji z dokładnością poniżej decymetra, opublikowane przykładowe miejsce stacji, okręgi południowo-polarne { "300" } km i { "600" } km) i oceniony względem liczbowych twierdzeń źródeł według sześciu jednostronnych progów wstępnie zarejestrowanych przed przebiegiem: pokrycie całego bieguna południowego przy p95 poniżej metra (K1, K2), skorygowane p95 poniżej metra i na poziomie decymetrów (K3, K4), wynik poniżej metra utrzymany przy opóźnieniu { "600" } s (K5) oraz dokładność utrzymana od { "10" } km do { "500" } km długości bazy (K6)

seg-7bfcb5c6a985 = ARAIM z jednoczesnymi hipotezami usterek wielu satelitów

seg-15043111e437 = araim_reference::add_v42_subset_plan: reguła wyznaczania podzbiorów z ADD v4.2 (P_THRES, FC_THRES, monitorowane podzbiory z najmniejszą liczbą usuniętych najpierw) uogólniona z par na jednoczesne kombinacje do max_order zdarzeń satelitów i konstelacji, z dokładnym prawdopodobieństwem apriorycznym P_no fault prod q_e; add_v42_protection_levels_to_order uruchamia na niej ścieżkę poziomów ochrony z ADD v4.2 (rząd { "2" } to dokładnie dotychczasowa ścieżka). raim::araim_subset_raim (opcjonalnie): zaawansowany RAIM na tym zbiorze hipotez, każdy monitorowany podzbiór jako jeden tryb (p_fault, T, b, sigma) w sumie ryzyka integralności, podzbiory nieobserwowalne przeniesione do ryzyka niemonitorowanego, budżet przeskalowany przydziałem ryzyka niemonitorowanego z ADD, a podzbiór o największej znormalizowanej separacji raportowany po wykryciu usterki. Prawdopodobieństwa a priori wymagające głębszych podzbiorów niż max_order są odrzucane, nigdy obcinane

seg-48ca01332f8f = RAIM obok wskaźników jakości holdover zegara

seg-890f1006a75d = Opcjonalna sekcja [integrity] rodzaju clock (clock_integrity::run): dla podanego miejsca i ustawień konstelacji (geometry::sky_geometry), w każdej epoce integralności, gdy oś czasu GNSS nie jest zaprzeczona, migawkowy RAIM (raim::snapshot_raim: test chi-kwadrat parzystości, poziomy ochrony według nachylenia) na satelitach powyżej maski, z losowanymi z ziarnem gaussowskimi residuami o podanej sigmie i opcjonalnym podanym obciążeniem; osobny blok integrity_fom z werdyktami dla każdej epoki, poziomami ochrony i dostępnością. Epoki z odmową są raportowane jako niedostępne, nigdy ekstrapolowane; wskaźniki jakości holdover pozostają bez zmian, a bez tej sekcji wynik jest identyczny co do bajta

seg-9cbb4ee7588a = Przestrzenna, zaszumiona obserwowalność długości łuku cislunarnego dla wielu rodzin orbit

seg-5ebd771deef8 = Próg obserwowalności długości łuku cislunarnego w PRZESTRZENNYM sześciostanowym CR3BP zamiast płaskiego czterostanowego, dla rodzin DRO, halo L2 i prawie prostoliniowego halo L2, z szumem pomiarowym wchodzącym do gramianu i DWOMA raportowanymi kryteriami, bo nie ma jednego uczciwego: opublikowane kryterium rzędu, które jest dowodnie niezmiennicze względem homoskedastycznej sigmy pomiaru (wybielanie mnoży macierz obserwowalności przez skalar, nie zmieniając względnego widma wartości osobliwych, a więc rzędu, defektu i uwarunkowania), oraz kryterium estymowalności — pierwszy łuk, przy którym formalna niepewność 1σ położenia początkowego stanu chief spada poniżej podanej granicy — które jako jedyne zmienia się z szumem. Każdy próg niesie przedział siatki epok, w którym leży; kryterium nieosiągnięte ma wartość null z podaniem powodu. Tryb płaski pozostaje domyślny, a rodziny pozapłaszczyznowe są w nim odrzucane, a nie spłaszczane do stanu, który nie potrafi ich przedstawić

seg-e250321394bc = Błąd predykcji orientacji Ziemi w stylu operacyjnym, mierzony jako przewidywanie względem wartości ostatecznych

seg-0e443d241460 = Dopasowanie metodą najmniejszych kwadratów obciążenia i tempa w oknie wstecznym plus główne składniki okresowe — roczny, półroczny i dwa główne zonalne pływy dla UT1; Chandlera, roczny i półroczny dla bieguna — ekstrapolowane z przeniesieniem ostatniego residuum z okna: klasa używana przez IERS Bulletin A, w miejsce predyktora persystencji, na którym opierał się opublikowany horyzont. Oceniane jedynym uczciwym sposobem: prognoza na T+h zbudowana z szybkich wierszy Bulletin A z chwili T lub wcześniejszych, mierzona względem OPUBLIKOWANEJ PÓŹNIEJ wartości ostatecznej Bulletin B w T+h, a persystencja oceniana obok na identycznym zbiorze epok względem identycznych wartości ostatecznych. Epoka docelowa bez opublikowanej wartości ostatecznej jest pomijana, a nie oceniana ponownie względem kolumny szybkiej; składnik okresowy, którego okno nie może ograniczyć, jest raportowany jako odrzucony wraz z liczbą cykli, które faktycznie obejmuje; niepełne okno jest odrzucane, a nie po cichu skracane

seg-f4efd94dd746 = Układ datum Księżyca z kampanii obserwacyjnej

seg-a6972eb89d7d = Siedmioparametrowe datum Helmerta wyprowadzone z SYMULOWANEJ KAMPANII OBSERWACYJNEJ zamiast odzyskiwane ze wstrzykniętej transformacji. Stacje ziemskie obserwują katalog radiolatarni na powierzchni Księżyca o znanym źródle według jawnego harmonogramu; pochodne opóźnienia lunar-VLBI są gromadzone w macierzy informacyjnej Fishera współrzędnych radiolatarni i przepychane przez macierz projektową Helmerta A = [I₃ | [p]ₓ | p] do H = AᵀM_bA, więc raportowana dokładność datum jest funkcją programu obserwacji — dokładnie liniową względem sigmy opóźnienia i monotoniczną względem łuku przez libracja, którą raport MIERZY. Defekt datum jest tematem, a nie przypisem: rząd, defekt, liczba uwarunkowania, widmo, nieobserwowalne kierunki w bazie siedmioparametrowej, najsłabszy kierunek nawet przy pełnym rzędzie i udział każdego parametru w nim są emitowane w każdym przebiegu, a każdy parametr, którego kampania nie ogranicza, jest publikowany jako NULL ze statusem. Korelacja błędów radiolatarni jest MEASURED, a nie zakładana — dokładnie zero przy stacjach ustalonych i podawana wraz z kosztem, gdy stacje są estymowane. Można ją uruchomić jako rodzaj scenariusza <c1/>

seg-ca481f2d8f9e = Potwierdzenie progu długości łuku cislunarnego niezależnym estymatorem

seg-3d5fbf896209 = Estymator wsadowy najmniejszych kwadratów, który ODZYSKUJE początkowy stan chief z symulowanych pomiarów międzysatelitarnych na rosnących prefiksach tej samej siatki epok, której używa tabela rzędu względem łuku, z pochodnymi pomiaru wziętymi jako centralne różnice skończone złożonego modelu prostego. Nie korzysta z żadnego z mechanizmów, którymi mierzono próg — żadnego wiersza jakobianu analitycznego, żadnej wariacyjnej macierzy przejścia stanu, żadnego rozkładu na wartości osobliwe ani własne, żadnej tolerancji rzędu, żadnego filtra pierwiastka informacji — i dzieli tylko dynamikę, warunki początkowe, obserwabl skalarny i siatkę epok, każde wskazane w wyemitowanym dokumencie. Dwa kryteria, oba przeglądane: odzyskanie bez szumu (odpowiednik rzędu) i estymowalność Monte Carlo (odpowiednik estymowalności, mierzony względem znanej prawdy, a nie przewidywany z kowariancji). Można je uruchomić jako rodzaj scenariusza <c1/>

seg-f839285852d9 = Księżycowa objętość usługi na podstawie rzeczywistej, pobranej geometrii konstelacji

seg-c3059fcced49 = Przyjmuje tabelaryczną efemerydę stanu względem środka Księżyca (wynik ewaluacji jądra SPK/BSP) lub opublikowaną definicję konstelacji za <c1/>, uruchamia na niej identyczny przegląd pokrycia / DOP / poziomów ochrony i emituje wynikające z niej wymaganie dotyczące σ_URE OBOK niezmienionych ilustracyjnych wyników keplerowskich i zaburzonych, z różnicą jako osobną nazwaną wielkością. Każda wartość niesie klasę pochodzenia, która odróżnia wartości wyprowadzone z jądra od wyprowadzonych z opublikowanych elementów i od modelowanych, więc nigdy nie da się ich pomylić w dalszym cytowaniu

seg-36a6cfaf5afa = Jednostka i pochodzenie zadeklarowane dla każdej raportowanej wielkości

seg-12460501e82b = Czytelny maszynowo schemat podający jednostkę, klasę pochodzenia i definicję dla każdego pola liczbowego każdego raportu scenariusza oraz jedna globalna bramka, która uruchamia każdy zarejestrowany rodzaj scenariusza i kończy się niepowodzeniem, jeśli wyemitowanemu polu liczbowemu brakuje któregokolwiek z nich. Słownik pochodzenia jest zamknięty, a każda klasa niesie poziom dowodowy, przy czym dwie klasy są celowo odwzorowane na <c1/> i <c2/>, zamiast otrzymywać poziom, którego klasa nie determinuje

seg-c815cb90dcde = Geodezja księżycowej stacji referencyjnej: dodany retroreflektor i radiolatarnia VLBI względem datum pięciu układów

seg-103cf21173ac = Opcjonalne dane wejściowe extra_reflectors i extra_beacons w scenariuszu lunar-llr-datum dodają blok station_geodesy: informację Helmerta pięciu układów z zarchiwizowanego wycinka księżycowego laserowego pomiaru odległości oraz informację, jaką na siedmioparametrowe datum nakładają dodany retroreflektor (mierzony w zarchiwizowanych epokach punktów normalnych, w których stacja mierząca znajduje się nad horyzontem, każdy z zarchiwizowaną wagą tego punktu normalnego) i dodana radiolatarnia VLBI (obserwowana przez sieć i harmonogram lunar-frame-campaign przy stałych stacjach ziemskich, przez pochodne opóźnienia lunar-vlbi-fim) w podanych miejscach, rozwiązane ponownie, z 1-sigma każdego parametru Helmerta przed i po, ich stosunkiem, normami przed i po oraz skrajnymi wartościami własnymi różnicy Fishera. Gdy brak lub puste, raport pozostaje bez zmian

seg-44f582b17fa9 = Integralność bramki — zielony, który znaczy to, co mówi

seg-43fbcfbe990c = Trzy strukturalne strażniki nad samym procesem weryfikacji, z których każdy zamyka klasę defektu, która dotarła do kanonicznej bramki jako sporadyczna lub fałszywa czerwień. ({ "1" }) Każda skonstruowana ścieżka tymczasowa w źródłach Rusta musi zawierać składnik unikalny dla każdego wywołania; identyfikator procesu jest odrzucany, bo cargo uruchamia testy biblioteki jako równoległe wątki JEDNEGO procesu, a pid jest wspólny dla wszystkich. ({ "2" }) Każdy pin bajt po bajcie lub skrótu musi zadeklarować, obok siebie lub w nagłówku swojego modułu, co obejmuje, a co celowo wyłącza — dzięki czemu zmiana przekrojowa od razu pokazuje, które piny są w zakresie, a które po cichu stały się wykrywaczami zmian w całym repozytorium. ({ "3" }) Zieleń można deklarować tylko z PEŁNEGO zestawu: scripts/gate.sh uruchamia <c1/>, przechwytuje prawdziwy kod wyjścia bez potoku na drodze i zapisuje kwit nazywający commit, liczbę binariów integracyjnych, liczbę testów i czas trwania; kontrola przed wypchnięciem odrzuca wypchnięcie, którego commit nie jest nazwany przez żaden ważny kwit, na czystym drzewie. Powtarzalność jest próbkowana osobno przez scripts/check-repeatability.sh, który uruchamia zestaw biblioteki N razy i kończy się niepowodzeniem, jeśli zbiór zaliczonych testów się różni.

seg-b7cd952ff133 = Złożony PL czasu — przejście holdover zasiane P0

seg-135df1e0e68a = PL(τ)=max(TPL_handover,HPL(τ)); dolnie półciągły PL({ "0" }+)≥PL({ "0" }−); K(IR/2) maksimum bieżące; wykładniki fazy τ/τ³/τ⁵

seg-096b6cdfe2dc = Złożony PL czasu — obwiednia LIL prawie na pewno (niemożliwość + spójność)

seg-1671add2210d = Brak skończonego holdover w najgorszym przypadku (supremum ruchu Browna jest rozbieżne); HPL z przydziałem IR spójny z obwiednią Hartmana-Wintnera, gdy IR→{ "0" }

seg-5a27c9f0a67d = Górne ograniczenie integralności obciążenia identyfikowalności niejednorodnego UTC(k)

seg-fd09ab2adbf6 = Górne ograniczenie obciążenia dla każdego źródła b = (U/k_cov)·Phi^-1(1-tail/2) + starzenie, rozdymające opublikowaną rozszerzoną niepewność typu B do przydzielonego ogona integralności; łączy się z tpl_scalar jako bias_s

seg-d75b900ad25f = Skorelowana kowariancja krzyżowa obciążenia identyfikowalności (przydział niebezpieczny przy wspólnym trybie)

seg-0641f6d38c23 = Kowariancja krzyżowa obciążeń N×N z wyrazami pozadiagonalnymi rho·b_i·b_j dla źródeł dzielących realizatora UTC(k); UDOWODNIONE correlated_fused_bias >= independent_fused_bias (naiwny niezależny przydział zaniża obciążenie połączone -> optymistyczny -> niebezpieczny)

seg-1a3bb032960f = Statystyka spójności trybu wspólnego (usterka wspólnego wzorca niewidoczna dla separacji)

seg-1b03f522b8fc = Statystyka wyniku ({ "1" }^T Omega^-1 r)^2/({ "1" }^T Omega^-1 { "1" }) ~ chi^2_1 dla przesunięcia trybu wspólnego, którego separacja rozwiązań (kontrasty ortogonalne do { "1" }) nie widzi; przesunięcie trybu wspólnego ją zawyża, podczas gdy separacje parami pozostają płaskie

seg-3359eee713a5 = Klasyfikacja przestrzeni zerowej datum Księżyca (addytywność rzędu LLR + podniesienie defektu przez libracje)

seg-6d722c176052 = Klasyfikacja wewnętrznego problemu datum z pomiarów odległości: pojedyncza obserwacja odległości wnosi rząd { "1" } (6-wymiarowa przestrzeń zerowa); para początek-X i skala jest bliska zerowej, a fizyczna libracja DE440 podnosi defekt do zera, podczas gdy para pozostaje bliska zdegenerowanej

seg-3fd19007ea67 = Informacja o datum Księżyca z wielu technik (LLR + księżycowe VLBI + odległość orbitera)

seg-23d0dd7d0666 = Wiersze jakobianu datum dla odległości LLR do reflektora na Ziemi, różnicowego opóźnienia księżycowego VLBI z dwóch stacji i odległości orbiter-radiolatarnia dla 7-parametrowego datum, połączone w jedną spójnie uwarunkowaną wstępnie informację Fishera; pokazują, że śledzenie poza kierunkiem radialnym (orbiter / zróżnicowane głębokością) łamie degenerację początek-X do skali, gdzie poprzeczne VLBI pomaga tylko pośrednio

seg-ab96cfc8d48c = Podłoże geometryczne datum LLR Księżyca (reflektory osi głównych, stacje naziemne, analityczne pochodne odległości)

seg-40e91288f81a = Pięć układów retroreflektorów po bliższej stronie w metrach układu ciała PA i stacje naziemne LLR we współrzędnych geodezyjnych; umiejscowienie reflektorów z układu ciała do inercjalnego przez orientację PA DE440; analityczne pochodne odległości Ziemia-reflektor względem 4-parametrowego datum; oraz macierz Fishera tylko z LLR, wykazująca degenerację lunocentrum-X do skali, która motywuje analizę 7-parametrową

seg-63a8571f8eb0 = Degeneracja odległość-przesunięcie zegara w jednokierunkowym pomiarze odległości na Księżycu oraz prawo projektowe różnorodności geometrycznej

seg-cdd70f56051a = Degeneracja promieniowej odległości do przesunięcia zegara odbiornika dla każdego węzła jest dokładna: { "1" } m do { "3.336" } ns (jeden przez c). Brzegowa dopełnienia Schura { "{" }skala, przesunięcie{ "}" } (coupled_marginal_fisher) pokazuje, że w geometrycznie zróżnicowanej sieci pomiar dwukierunkowy podnosi brzegową mniej więcej o ten sam czynnik co równa liczba dodatkowych danych jednokierunkowych, podczas gdy w wyidealizowanym reżimie pojedynczego węzła podniesienie dla pomiaru dwukierunkowego jest o rzędy wielkości większe. Z tego wynika prawo projektowe: to różnorodność geometryczna, a nie pomiar dwukierunkowy jako taki, oddziela skalę układu Księżyca od przesunięcia skali czasu w pomiarze jednokierunkowym; dwukierunkowe lub zewnętrzne powiązanie czasu jest wymagane tylko w reżimie niskiej różnorodności lub pojedynczego użytkownika.

seg-2c074d6260ba = Reprezentatywne menu pomiarów z wielu technik i addytywna reguła łączenia Fishera

seg-beefac5c1b13 = MeasurementBlock przechowuje jedną kandydującą kampanię pomiarową jako wkład informacji Fishera 7x7 plus skalarny koszt względny; block_from_rows buduje go z surowych wierszy jakobianu datum, więc każdy blok jest wstępnie uwarunkowany identycznie przez lunar_identifiability::assemble_multi_info; combine sumuje informację wybranego podzbioru, co jest regułą poprawną, ponieważ informacja Fishera jest addytywna dla niezależnych pomiarów; representative_lunar_menu dostarcza deterministyczne menu czterech bloków (LLR, poprzeczna radiolatarnia VLBI na brzegu tarczy, orbiter po bliższej stronie i orbiter po dalszej stronie). Optymalizator projektu z ograniczonym budżetem, który korzysta z tego menu, nie jest częścią tego crate.

seg-2d3347bcb15e = Tolerancja spójności między dostawcami dla użytkownika z mieszanymi dostawcami

seg-9decf2cb6b0c = consistency_tolerance: odwraca budżet położenia użytkownika do wymagania zgodności Helmerta między dostawcami dla każdego parametru (początek/skala/rotacja) przy referencyjnym ramieniu dźwigni, opcjonalnie powiększonego o CRLB realizacji pojedynczego dostawcy P1

seg-5450d921dfc9 = Budżet błędów interoperacyjności księżycowej dla wielu dostawców i prawo projektowe układ-kontra-efemeryda

seg-e1e30f5c17a6 = interop_budget: podział na redukowalny (wspólne powiązanie układu) i nieredukowalny (dynamika) przy konwencjach PerProvider / CommonFrameTie / CommonEphemeris, z miarą prawa projektowego ułamka nieredukowalnego (~{ "0.69" } dla rzeczywistych DE440/INPOP/EPM: samo wspólne oznaczenie układu zostawia dominującą podłogę)

seg-ebb827739614 = Granica wykrywania/identyfikacji blokowej iskry bizantyjskiej dla autonomicznej sieci księżycowej z węzłami (T3)

seg-4fb935e6193d = byzantine_bound konkretyzuje granicę kodowania / rzadkiej obserwowalności bezpiecznego estymowania stanu na geometrii sieci dla każdego węzła: bizantyjski rówieśnik wstrzykuje dowolną kombinację liniową pomiarów, w których uczestniczy, a sieć WYKRYWA każdą koalicję ≤ f = block_spark − { "1" } rówieśników i jednoznacznie IDENTYFIKUJE każdą koalicję ≤ ⌊(block_spark − { "1" })/2⌋, gdzie block_spark jest najmniejszą koalicją rówieśników, której ułożone w stos efektywne sygnatury P⊥·B_T mają niepełny rząd kolumnowy. Wykrywalność rówieśnika to PEŁNY RZĄD KOLUMNOWY P⊥·B_j (niezerowy, ale o niepełnym rzędzie blok to niezerowy atak, który ląduje w range(G) i nie zostawia residuum), a nie tylko P⊥·B_j ≠ { "0" }

seg-4f57f586cf82 = Podłoga czasowej miary autonomicznego holdover dla samoodniesionej konstelacji księżycowej (T4)

seg-eb690e8f5c9b = holdover_floor ustala, że w zespole autonomicznych węzłów połączonych tylko pomiarami międzywęzłowymi wspólne tempo zegara (δα_j += { "1" } ∀j) jest swobodnym parametrem czasu zespołu leżącym w N(GᵀWG): żadna ilość dodatkowych pomiarów odległości między węzłami nie może go zaobserwować (rate_in_gauge = true, temporal_gauge_dim = { "2" } ze wspólnym przesunięciem). To jest prawdziwa podłoga holdover — czasowy odpowiednik położeniowej miary sztywnego układu. Dodanie jednego zewnętrznego bezwzględnego powiązania tempa (bezpośredniego łącza do wzorca poza siecią) usuwa wspólne tempo z przestrzeni zerowej (rate_in_gauge = false, temporal_gauge_dim = { "1" }), co dowodzi, że podłoga jest rzeczywistą miarą, a nie artefaktem modelu oscylatora

seg-25ffd6e1979c = Wspólny/różnicowy podział dostawców, unifikacja jednego defektu rzędu i nachylenie luki ochrony (T5 / §{ "0" } / g7)

seg-72c7ec3724bf = Trzy aspekty jednej dekompozycji ℝ^{ "{" }state_dim{ "}" } = N(GᵀWG) ⊕ range(GᵀWG) z 8-wymiarową miarą datum⊕skala czasu jako N(G) oraz state_dim − { "8" } = { "32" } obserwowalnymi kierunkami jako range(G): (T5) provider_mismatch_split klasyfikuje wspólne obciążenie wielu dostawców (∈ range(G)) jako NIEWYKRYWALNE — wymagające zewnętrznego powiązania — a obciążenie różnicowe (∉ range(G)) jako samomonitorowane / WYKRYWALNE; (§{ "0" }) unifikacja polega na tym, że TA SAMA ślepa podprzestrzeń range(G) rządzi klasą usterek niewykrywalnych, więc miara datum N(G) i podprzestrzeń ślepa na usterki range(G) to jedna geometria, a nie dwie; (g7) slope zwraca nachylenie luki ochrony Browna ‖Π_obs Δx̂‖ / ‖P⊥b‖_W → ∞ dla usterki b ∈ range(G) (estymator zepsuty przy zerowej parzystości) i skończone dla usterki wykrywalnej

seg-632add2dbd3c = Maski synchronizacji telekomunikacyjnej ITU-T z PASS/FAIL i marginesem

seg-47687529aee7 = Przepisane limity ITU-T G.8272 (07/2025) PRTC-A/B, G.8272.1 ({ "2024" }) Amd. { "1" } (07/2025) ePRTC w stanie zsynchronizowanym i ePRTC-A w holdover (w tym obwiednia błędu czasu z tabeli { "3" }), G.8273.2 ({ "2023" }) Amd. { "2" } (11/2025) klasy T-BC/T-TSC A-D oraz G.8271.1 ({ "2022" }) Amd. { "3" } (05/2025) punkt odniesienia C, każdy przedział otwarty lub zamknięty tak, jak podaje tabela, z pominięciem każdego wpisu „do dalszych badań”; werdykt i margines w punkcie wiążącym dla każdej kontroli oraz czas przekroczenia każdego budżetu. Można je uruchomić jako rodzaj scenariusza <c1/>

seg-165ed2bc771a = Maski generacji dryfu dla synchronizacji częstotliwości ITU-T (G.811, G.812, G.8262, G.8262.1)

seg-953793d4446a = Siedem masek generacji dryfu MTIE i TDEV w stałej temperaturze dla rodzaju <c1/>: G.811 (09/1997) PRC (autonomiczny), G.812 (06/2004) typy I, II i III, G.8262 (10/2024) EEC opcje { "1" } i { "2" } oraz G.8262.1 (11/2025) eEEC (tryb zsynchronizowany), w tym odcinki potęgowe, które zapisują tabele (<c2/> i podobne), każdy przedział otwarty lub zamknięty tak, jak wydrukowano, mierzone przez filtr { "10" } Hz, który podają punkty norm (przyjęty jako zastosowany przed próbkowaniem); scenariusz referencyjny scenarios/telecom-synce-eec.toml zestawia swobodnie pracujący OCXO z trzema maskami EEC. Niezaimplementowane: tolerancje przy zmiennej temperaturze, holdover, stany przejściowe, jitter i dokładność częstotliwości G.811

seg-5fc2ad88faf0 = Formaty dzienników zegara (zegar RINEX, ASCII TimeLab, TAPR TICC) odczytywane do znormalizowanego szeregu fazy

seg-5b5bcbdea166 = clock_log::read_input: jedna warstwa parsera, która zamienia plik zegara RINEX (rekordy AS/AR jednego nazwanego zegara, wersje { "2" } i { "3.00" } do { "3.04" }), dziennik ASCII fazy lub częstotliwości w stylu TimeLab albo dziennik znaczników czasu lub przedziałów TAPR TICC w jednolitą siatkę fazy, z tau0 podanym, z nagłówka lub jako medianą odstępów, z policzoną każdą luką, odczytem poza siatką i duplikatem, oraz polityką luk: odrzuć, najdłuższy odcinek lub liniowa; podpięty opcjonalnie do szeregu telecom-timing (<c1/>, dodając blok <c2/>) i do rodzaju clock (<c3/>, dodając blok <c4/> z ADEV, TDEV i MTIE, SHA-256 tabeli i SHA-256 fazy; runs = { "1" }). Bez tabeli oba rodzaje są identyczne co do bajta

seg-acdb0337bce7 = Formaty dzienników zegara linuxptp (ptp4l, phc2sys, ts2phc) i chrony (tracking, statistics) odczytywane do znormalizowanego szeregu fazy

seg-e87b3dba2072 = clock_log::read_input z formatami ptp4l, phc2sys, ts2phc, chrony-tracking i chrony-statistics: zapisane przesunięcie wiersza serwa linuxptp (ns, własny znacznik czasu wiersza w nawiasach, odczyty przed pierwszym zgłoszeniem s2 przez serwo pominięte i policzone) lub dziennika chrony tracking albo statistics (s, według pozycji kolumny, data i czas UTC) staje się jednolitą siatką fazy przez te same polityki luk co w innych formatach; selektor źródła (<c1/>) nazywa jeden z kilku interfejsów, zegarów lub adresów; dzienniki zasilają szereg telecom-timing, rodzaj clock i rodzaj holdover-test

seg-97aebb84576e = Test holdover oceniany z zapisu błędu czasu dostarczonego przez operatora

seg-ab533cf99c56 = Rodzaj <c1/>: zapis błędu czasu (dziennik zegara linuxptp, chrony, TICC, TimeLab lub RINEX albo pary time_s,time_error_ns) jest dzielony w dwóch momentach, które operator podaje dla usunięcia i przywrócenia GNSS, na krok bazowy, holdover i odzyskiwania; baza jest mierzona względem masek ITU-T napisanych dla zegara zsynchronizowanego, a holdover względem napisanych dla holdover lub zegara autonomicznego, obwiedni holdover ePRTC-A i budżetów błędu czasu; holdover raportuje przesunięcie częstotliwości z najmniejszych kwadratów, które system utrzymał, a odzyskiwanie — czy i kiedy |TE| weszło w podane pasmo i pozostało w nim przez podany czas przebywania, z wartością szczytową i największym krokiem. Każdy limit jest tym, który przepisuje rodzaj telecom-timing; oba momenty to oświadczenie operatora i nie są weryfikowane

seg-94cbac97a1aa = Dostępność sygnałów GNSS w Space Service Volume i poza nią, porównana z broszurą ICG SSV

seg-c59e349fdc9e = Przeglądy dostępności rodzaju <c1/>: dla każdej konstelacji (GPS, GLONASS, Galileo, BDS, QZSS, NavIC) i łącznie udział par (użytkownik, epoka) z co najmniej jednym i co najmniej czterema sygnałami oraz najdłuższa przerwa, dla użytkownika na sferze (globalna powłoka broszury z 2,562 punktami, { "14" } dni co { "1" } minutę) lub na trajektorii (GEO, HEO, transfer księżycowy), z orbit keplerowskich z załącznika C broszury, stałą minimalną mocą promieniowaną w obrębie referencyjnego kąta poza osią, zasłonięciem przez Ziemię jako sferę plus { "50" } km oraz progiem C/N0; anteny użytkownika z tabeli B10 broszury

seg-d2f04991c8a4 = Efekty jonosfery, plazmosfery i atmosfery dla promieni brzegowych na przechodzących stycznie sygnałach GNSS oraz projekt odbiornika słabych sygnałów w rodzaju <c1/>

seg-1a1786ba90b6 = Jonosfera Chapmana, plazmosfera typu Gallagera i atmosfera obojętna (załamanie refrakcyjne, absorpcja tlenu, defokusacja) całkowane wzdłuż prostego promienia między nadajnikiem a użytkownikiem: ukośna całkowita zawartość elektronów, jej część plazmosferyczna, opóźnienie nadmiarowe, wysokość styczna i strata na łączach stycznych; oraz projekt odbiornika słabych sygnałów (całkowanie koherentne i niekoherentne, limit bitu danych, wspomaganie, przeszukiwanie Dopplera), który ustala próg C/N0 z modeli akwizycji i pętli śledzenia

seg-6b8f9f3ca2a3 = Pokładowy filtr nawigacyjny GNSS dla statków kosmicznych na wysokich orbitach i w transferze księżycowym

seg-39ddc494f103 = Tryb <c2/> rodzaju <c1/>: dziewięciostanowy rozszerzony filtr Kalmana (położenie, prędkość, odchylenie i dryf zegara odbiornika, skala ciśnienia promieniowania słonecznego) na pseudoodległościach, których dostępność, szum i C/N0 pochodzą z tej samej geometrii łączy co w przeglądach; prawda jest całkowana z J2, trzecim ciałem Słońca i Księżyca oraz ciśnieniem promieniowania z cieniem, filtr modeluje J2 i trzecie ciała i estymuje ciśnienie promieniowania; raportuje błędy położenia i prędkości wewnątrz orbit GNSS i powyżej nich, najdłuższą lukę pomiarową i średnie NEES

seg-5fc242476828 = Nawigacja względna formacji wielu statków kosmicznych na silnie eliptycznej orbicie z GNSS

seg-f67eb29d4483 = Tryb <c2/> rodzaju <c1/>: statek główny i statki zastępcze uruchamiają każdy filtr bezwzględny; położenie statku zastępczego względem głównego jest estymowane przez odjęcie estymat bezwzględnych oraz przez filtr względny na pseudoodległościach pojedynczo różnicowanych dla sygnałów śledzonych przez oba statki, z dynamiką względną jako różnicą dwóch nieliniowych trajektorii

seg-7038f6902820 = Człony błędu interferometru z zimnych atomów: szum fazy lasera Ramana, obciążenie krzywizną czoła fali i rozwiązywanie niejednoznaczności prążków

seg-4d9690207607 = inertial::cai_error_terms (funkcje biblioteczne, jeszcze nieosiągalne z rodzaju scenariusza): funkcja ważąca fazy Ramana dla interferometru trójimpulsowego z impulsami prostokątnymi (Cheinet i in. { "2008" }, równ. { "8" }) z postacią zamkniętą dla szumu białej fazy (pi/2)^{ "2" } S_phi0/tau_R i drogą numeryczną dla dowolnego widma; szum częstotliwości lasera, którego opóźnienie przy retroodbiciu nie znosi (Le Gouet i in. { "2007" }, równ. { "9" } do { "11" }); obciążenie czoła fali czystą defokusacją sigma_v^2/R chmury termicznej i jego redukcja promieniem detekcji; prawdopodobieństwo błędnego indeksu prążka erfc(pi/(sqrt({ "2" }) s)) dla wspomagania klasycznym akcelerometrem i dla dwóch czasów interrogacji oraz jego odwrotność

seg-363705e03bac = Wzorce holdover oscylatorów z publicznych kart katalogowych

seg-9750d9e0ec7a = Cztery wzorce — OCXO (Microchip OX-208), rubidowy (Microchip 8040C), cezowy (Microchip 5071A, lampa o wysokiej wydajności) i CSAC (Microchip SA.45s) — każdy niosący maksima odchylenia Allana z karty katalogowej, starzenie i granicę temperaturową; nieujemne dopasowanie najmniejszych kwadratów szumu częstotliwości białego + migotania + błądzenia losowego, przeskalowane tak, by obejmować obwiednią każdy punkt karty katalogowej, podłoga migotania nigdy poniżej wartości dla najdłuższego τ, liniowe starzenie i sinusoidalny człon temperaturowy, zsyntetyzowane jako holdover z ziarnem po utracie GNSS

seg-d7e03158b972 = Sekundy, zanim swobodnie pracujący zegar opuści margines czasowy slotu indeksowanego czasem, oraz kadencja poprawek, która utrzymuje go wewnątrz

seg-0b4d8815f756 = Rodzaj <c1/>: przewidywany błąd E(t) = k·√(σ₀² + σ_x²(t)) + (|y₀| + |c_T·ΔT|)·t + ½|D|t² odwrócony do przekroczenia, pozostałego czasu, interwału resynchronizacji pomniejszonego o opóźnienie poprawki i poprawek na dobę, z każdym członem wyszczególnionym i nazwanym dominującym; zegary z sześciu domyślnych ClockClass (TCXO, OCXO i RAFS dodane, każdy z odwołaniem do jednej karty katalogowej), wzorców telecom-timing, śródliniowej karty katalogowej lub zmierzonego zapisu; przekroczenie poza najdłuższym czasem uśredniania źródła oznaczane jako ekstrapolowane

seg-2797643153dc = Poziom ochrony czasu dla odbiornika na orbicie w warunkach spoofingu GNSS

seg-cb412a2ffadf = orbital_timing::orbital_timing, dostępne jako sekcja spoofingu rodzaju <c1/>: prędkość i okres na orbicie kołowej, najdłuższy czas, w którym naziemny spoofer może dosięgnąć satelity podczas jednego przejścia, dolna granica monitora wspomaganego zegarem i opóźnienie detekcji CUSUM, warunkowy poziom ochrony (dolna granica plus dryf bez korekty w czasie opóźnienia), odchylenie, jakie narasta u spoofera o podanej maksymalnej szybkości narastania, zanim satelita opuści swój ślad lub zostanie wykonana niezależna kontrola, oraz informacja, czy każda kontrola w kontakcie z ziemią lub przez łącze międzysatelitarne jest niezależna od jednego naziemnego spoofera

seg-f134975d4ffa = Wodospad widma w paśmie L z J/S dla każdego pasma i efektywnym C/N0 przy zaprogramowanym przebiegu czasowym zagłuszacza

seg-86ad8f89a822 = Rodzaj <c1/>: siatka częstotliwość-czas widmowej gęstości mocy w paśmie L (poziom szumu termicznego k T_sys, gdzie T_sys = T_ant + { "290" } K (F - { "1" }), sygnały przy minimalnych mocach odbioru z specyfikacji interfejsu oraz zagłuszacze: fala ciągła, wąskopasmowy, chirp i szum dopasowany, z czasami włączenia i wyłączenia), każda komórka uśredniona po swoim przedziale i wierszu (chirpy dokładnie po pełnych i częściowych przemiataniach, zagłuszacze według współczynnika wypełnienia), efektywny C/N0 dla każdego pasma = [1/(C/N0) + suma (J/S) kappa]^-1 w każdym wierszu, J/S dla każdego pasma, J/S w paśmie oraz wodospad SVG ze słupkami C/N0. Raport zawiera kontrolę krzyżową z łańcuchem rodzaju <c2/> dla tych samych danych łącza

seg-6e0b9687e8ee = Uran i Neptun z Tabeli { "1" } Standisha, Pluton oraz prędkości planet

seg-df3bf502dfe9 = Położenia Urana i Neptuna z Tabeli { "1" } Standisha (domyślnej w przedziale { "1800" } AD do { "2050" } AD), Plutona z wiersza Tabeli { "1" } z { "1992" }, którego obecna strona JPL już nie podaje, oraz heliocentryczna prędkość każdej planety: pochodna dwóch ciał ze średnim ruchem wynikającym z elementów plus obrót elipsy wynikający z szybkości zmian peryhelium, nachylenia i węzła

seg-a50be56f605a = Położenia Księżyca i siedmiu dużych księżyców (Fobos, Deimos, księżyce galileuszowe, Tytan)

seg-2cfbe5a1eece = Geocentryczny Księżyc z szeregu Montenbrucka i Gilla (którego człon -1.3972 deg na stulecie już odnosi go do równonocy J2000) oraz planetocentryczne położenia i prędkości Fobosa, Deimosa, Io, Europy, Ganimedesa i Kallisto ze średnich elementów JPL Solar System Dynamics w płaszczyźnie Laplace'a każdego księżyca, przy czym szybkość długości średniej przyjęto z szybkości rotacji synchronicznej IAU (tabela podaje okres ze zbyt małą liczbą cyfr, by utrzymać fazę), a Tytana z modelu rotacji IAU (księżyc na ujemnej osi x związanej z ciałem przy średniej odległości), ponieważ drukowany wiersz płaszczyzny Laplace'a dla Tytana nie odtwarza Horizons nawet w jego własnej epoce

seg-8b8c8e28ece9 = Stałe fizyczne każdego ciała Układu Słonecznego i raport całego układu

seg-d225a30de35c = Body zyskuje Merkurego, Wenus, Jowisza, Saturna, Urana, Neptuna, Plutona, Fobosa, Deimosa, Io, Europę, Ganimedesa, Kallisto i Tytana (parametr grawitacyjny, promień odniesienia, J2 tam, gdzie opublikowano go wraz z promieniem, do którego się odnosi, biegun IAU i południk zerowy), wyszukiwanie po nazwie oraz rekord BodyFacts (kod NAIF, klasa, ciało macierzyste, promień równikowy i średni); rodzaj <c1/> podaje je dla wszystkich osiemnastu ciał wraz z położeniami, czasami świetlnymi i śladem orbity w ciągu jednego obiegu, a każde ciało jest oznaczone jako VALIDATED lub MODELLED

seg-87ab655f8270 = Wyznaczanie położenia wokół dowolnego ciała Układu Słonecznego za pomocą lokalnej konstelacji i łącza dalekiego kosmosu z Ziemi

seg-d9b1b0ac97d3 = Rodzaj <c1/>: orbiter lub lądownik na powierzchni wokół ciała wybranego po nazwie nawiguje za pomocą jednokierunkowych pseudoodległości z konstelacji nawigacyjnej Walkera wokół tego ciała (orbity dwóch ciał z wiekowym dryfem J2 ciała, nieznany zegar użytkownika) oraz opcjonalnego bezzegarowego zakresu dwukierunkowego z Ziemi, przy czym kierunek i odległość Ziemi pochodzą z efemerydy analitycznej w każdej epoce; linie widzenia zasłonięte przez kulę ciała i maska elewacji na powierzchni; w każdej epoce GDOP i PDOP samej konstelacji (orbit::dop), formalna niepewność położenia z wierszem Ziemi i bez niego oraz fiksy Gaussa-Newtona z ziarnem (batch_ls::gauss_newton) w obu wariantach, z czasem świetlnym i czasem obiegu tam i z powrotem od ciała do Ziemi

seg-7d4d7200cbca = Mapy pokrycia i rozmycia dokładności dla dowolnych konstelacji wielosystemowych w dużej skali, wokół dowolnego ciała centralnego

seg-b78b79e9fae4 = Rodzaj <c1/> poza dwoma przypiętymi przypadkami: konstelacje jawne i wielopowłokowe, kilka konstelacji na przebieg z jednym zegarem odbiornika na konstelację, Ziemia, Księżyc i Mars ze stałych ciał, preset BeiDou (modelowana faza orbity średniej i przecięcie { "118" } deg E orbity geosynchronicznej nachylonej), w każdej komórce liczba satelitów w widoku, GDOP, PDOP, HDOP, VDOP i dostępność, zredukowane ślady na powierzchni oraz wstępny filtr widoczności według szerokości podsatelitarnej, który przelicza konstelację { "5" } 000 satelitów na siatce { "10" } deg w ułamku sekundy

seg-278c77438493 = Połączona misja obejmująca kilka rodzajów scenariuszy na jednej wspólnej osi czasu

seg-3dcfb26f6234 = Fazy rodzaju <c1/>: każda faza uruchamia jeden lub więcej scenariuszy istniejących rodzajów przez run_toml, odczytuje ich wyniki do nazwanych kanałów (błąd czasu zegara i jego granica, średni efektywny stosunek nośnej do gęstości szumu i próg śledzenia, pionowy poziom ochrony i granica alarmu, błąd położenia, liczba śledzonych satelitów, flagi alarmów) za pomocą presetów dla każdego rodzaju lub jawnych ścieżek wyników, umieszcza je na początku fazy i przytrzymuje na wspólnej siatce, z granicami faz i zdarzeniami; stan jest przekazywany dalej przez carry (kanał kontynuuje od wartości końcowej poprzedniej fazy), handoff (numer poprzedniej fazy wpisany do następnego scenariusza) i end_at (faza kończy się w czasie obliczonym przez przebieg, takim jak czas detekcji monitora spoofingu); skrót kampanii i skrót ze wszystkich wyników członkowskich

seg-ad6105af464c = Przeglądy parametrów i zespoły Monte Carlo z ziarnem dla dowolnego rodzaju scenariusza

seg-95921611839e = Sekcje sweep (od jednego do trzech kluczy z kropkami dowolnego rodzaju, na wartościach osi ogólnego przeglądu, opcjonalnie z zespołem w każdym węźle) i monte_carlo rodzaju <c1/>: realizacja k działa przy base_seed + k; każda metryka podaje średnią, odchylenie standardowe, percentyle 5/50/95 metodą najbliższej rangi oraz przedział ufności { "95" }% dla średniej metodą percentylowego bootstrapu ze stałym ziarnem (inertial::metric_stat); jednostki metryk są odczytywane z własnego bloku jednostek przeglądanego rodzaju

seg-24327a0ed82e = Kilka scenariuszy przy wspólnych warunkach, ze zbiorczym podsumowaniem

seg-5833fb3b06e3 = Sekcja compose rodzaju <c1/>: nazwane wspólne wartości (na przykład moc i położenie jednego zagłuszacza) wpisywane do każdego członka pod kluczami, do których są przypisane, uruchomienie każdego członka oraz dla każdej metryki najmniejsza, największa i średnia wartość wśród członków ze wskazaniem członka; jednostki metryk muszą być zgodne we wszystkich członkach

seg-0bc866720bde = Ograniczona optymalizacja jednej metryki względem parametrów kampanii

seg-f9bdb89c2b4f = Sekcja optimize rodzaju <c1/> (CAP-32): od jednego do trzech kluczy scenariusza z kropkami, ograniczonych do [lo, hi] w skali lin lub log, jedna metryka odczytywana ścieżką wyniku, cel minimize, maximize lub target; metoda grid (wartości osi przeglądu) albo deterministyczny sympleks Neldera-Meada we współrzędnych znormalizowanych z rzutowaniem na pudełko i standardowymi współczynnikami; brakująca lub nieskończona metryka dostaje najgorszą ocenę i pozostaje w śladzie; przy runs > { "1" } metryką jest średnia po wspólnych ziarnach; każde obliczenie jest prawdziwym przebiegiem wskazanego rodzaju, wypisanym w trace i wliczonym do skrótu odtwarzalności

seg-652e28dfa10f = Projekty sygnałów pozycjonowania, nawigacji i czasu na niskiej orbicie okołoziemskiej: śledzenie kodu, akwizycja, zgodność z GNSS i bilans pasm dla dowolnego systemu

seg-c0ba5c7e708e = Rodzaj <c1/>: parametryzowane projekty sygnałów (pasmo, szerokość pasma nadawania, przydział ITU; składowe akwizycyjne, danych i pilotowe z widmami BPSK(n), BOC(m,n), MBOC lub płaskimi, udziały mocy, podnośne FDMA, długości kodów i szybkości danych) z wkompilowanych publicznych plików presetów (Xona Pulsar, Iridium STL, sygnał okazjonalny Starlink, CentiSpace, ogólny projekt pasma C oraz ogólne projekty UHF/L/S/C/szerokie C, każdy z adresem URL źródła, a wartości nieopublikowane oznaczone jako REPRESENTATIVE) albo zapisanych w treści; dla każdego sygnału widmowa gęstość mocy z ograniczonym pasmem, ułamki mocy w paśmie, szerokość pasma Gabora, jitter kodu względem C/N0 i rozstawu oraz dokładność pomiaru odległości, przestrzeń przeszukiwania akwizycji, prawdopodobieństwo detekcji kwadratowej oraz średni czas akwizycji szeregowej i równoległej względem kodu, współczynnik separacji widmowej do i z GPS L1 C/A, Galileo E1, GPS L5, Galileo E5a, E5b i AltBOC wraz z degradacją C/N0, a także tolerancja J/S dla CW, szerokopasmowego i dopasowanego z łańcucha SSC rodzaju spectrum; bilans pasm opóźnienia jonosferycznego, strat w wolnej przestrzeni, dokładności pomiaru odległości przy równym C/N0 i równym EIRP oraz tolerancji na zagłuszacz; a także jakościowe kontrole kształtu projektu względem opisanego pomiaru

seg-c2b9c8e4a364 = Wielopasmowy wodospad widma (UHF, L, S, C) z zaprojektowanymi sygnałami i zagłuszaczami w każdym paśmie

seg-609df4e0a085 = Rodzaj <c1/> rozszerzony poza pasmo L: pasma podane jako preset projektu sygnału (rysowany ze wszystkimi składowymi, z pasmem ograniczonym do szerokości pasma nadawania, C/N0 i J/S odniesione do śledzonej składowej) albo jako własna nośna i modulacja; dodatkowe panele wodospadu w dowolnym zakresie częstotliwości na tej samej osi czasu i skali kolorów; zagłuszacz szerokopasmowy (zaporowy) obok CW, wąskopasmowego, chirp i szumu dopasowanego; J/S i efektywny C/N0 dla każdego pasma z niezmienionego łańcucha współczynnika separacji widmowej

seg-d9eb3e7e69c2 = Przejście satelity LEO-PNT i jego bilans łącza w każdym paśmie na tle widocznych satelitów GNSS na orbicie MEO

seg-d986e44443dd = Rodzaj <c1/>: satelity z zaprojektowanego przejścia, z elementów, z TLE przez SGP4 lub z konstelacji Walkera z constellation-design; dla każdego pasma i epoki kąty widzenia, odległość, zamknięta szybkość zmiany odległości i przyspieszenie odległości (sprawdzane w każdym przebiegu względem różnic centralnych i raportowane), straty w wolnej przestrzeni, EIRP z charakterystyką izostrumieniową, gaussowską lub płaską, antena użytkownika płytkowa, półkulista lub izotropowa, tłumienie gazowe ITU-R P.676-10 Załącznik { "2" }, deszcz i scyntylacja P.618, tłumienie wnikania do budynku P.2109, niedopasowanie polaryzacji, temperatura szumowa układu, C/N0, Doppler i szybkość zmiany Dopplera oraz opóźnienie pierwszego rzędu z ukośnego TEC Klobuchara lub pionowego TEC, przeskalowanego ułamkiem Chapmana poniżej satelity; pary wolne od jonosfery z szumem kodu w szczycie przejścia; nośne Galileo lub GPS z mocy odbieranych podanych w dokumentach interfejsu, przez ten sam odbiornik

seg-95a077a980b6 = Nazwane presety systemów LEO-PNT z podanymi źródłami oraz silnik niezależny od systemu

seg-4b47033cda24 = leo_link::presets: ogólny wielopasmowy (UHF, L, S, C), ogólny pasmo C, Xona Pulsar X1/X5, Iridium STL, Starlink jako sygnał okazjonalny wyłącznie Dopplera, CentiSpace i opcjonalny preset Celeste IOD, każdy z źródłem oznaczonym PUBLIC (z adresem URL), REPRESENTATIVE lub WORKSHOP, przy czym preset warsztatowy znajduje się w opcjonalnym pliku presetu Celeste IOD, wkompilowanym tylko wtedy, gdy ten plik istnieje; każde pasmo i każdą orbitę można nadpisać w scenariuszu, a scenariusz może w ogóle nie wskazywać presetu

seg-a39f34973373 = Pozycjonowanie niskoenergetyczne: czas do pierwszego fiksu i energia na fiks względem współczynnika wypełnienia

seg-f3b9b669a76f = leo_link::energy i sekcja [iot] rodzaju <c1/>: całkowanie koherentne ograniczone szybkością zmiany Dopplera, sumy niekoherentne kwadratowe do progu detekcji, przeszukiwanie przedziałów Dopplera po obwiedni użytkownika nieruchomego na orbicie (zimne) lub w oknie wspomaganym (gorące), przeszukiwanie kodu równoległe lub szeregowe, czas komunikatu nawigacyjnego przy zimnym starcie, energia na fiks i czas życia baterii dla różnych odstępów między fiksami, dla każdego pasma LEO i sygnału GNSS

seg-8121e7db3db3 = Aktualizacja komunikatu nawigacyjnego LEO w trakcie przejścia z kontrolą ciągłości w chwili przełączenia

seg-34c310d85c42 = Analiza midpass-update rodzaju <c1/>: najwyższe przejście nad użytkownikiem w przedziale poszukiwań, komunikaty według globalnego harmonogramu z okresami użytkowania wyśrodkowanymi w oknach dopasowania, a przy każdym przełączeniu skok położenia 3D, skok zegara, skok pseudoodległości użytkownika, największy skok na dowolnej widocznej linii widzenia (wzór zamknięty po stożku nadiru), błąd odległości przed i po oraz PASS/FAIL względem progu

seg-7635a8339e78 = Udokumentowane kodowanie binarne komunikatu nawigacyjnego LEO z bilansem błędu kwantyzacji

seg-e4d9b16a2dc4 = leo_navmsg::codec: własna ramka Kshana (preambuła, wersja, model, długość, ładunek, CRC-24Q) dla czterech modeli efemerydy, wielomianu zegara, SVID, numeru wydania danych, pasma, stanu, zestawu Klobuchara, współczynników NeQuick-G i parametrów UTC, każde pole z podaną szerokością i krokiem (field_table), kwantyzacja z odmową poza zakresem oraz bilans największej zmiany położenia i zegara wywołanej zmianą każdego pola o pół kroku w oknie ważności

seg-17ca41d7fd71 = Eksporty komunikatów nawigacyjnych LEO w stylu RINEX-4 i CSV

seg-185e12ccef0d = leo_navmsg::text: blok w stylu RINEX-4 (nagłówek rekordu > EPH, wiersz satelity i epoki z trzema członami zegara, wiersze orbity rozgłaszanej D19.12) z literą systemu L i typami rekordów KP16, KRAC, LU22 i APOL, oznaczony w każdym nagłówku jako rozszerzenie Kshana niebędące częścią RINEX { "4.02" }, oraz tabela CSV z domyślnym schematem kolumn i schematami presetów, każda z importerem

seg-e79047fc95af = Wielomian ECEF ATOMIC z zerowym zegarem i syntetyczne porównanie modeli LEO dla pięciu wysokości

seg-e261843e35b1 = wariant EcefPoly leo_navmsg::elements::EphemerisModel: wielomian ECEF dla każdej osi bez członów zegara, człon relatywistyczny z -2 r.v/c^{ "2" }, oceniany względem zegara sterowanego. Także analiza porównania modeli (liu_comparison po LIU2025_TABLE), która dopasowuje model 22-parametrowy na pięciu wysokościach z artykułu na 20-minutowych łukach orbity zintegrowanej przez Kshana i wypisuje wynik obok opublikowanego SISRE

seg-d2e18c8bdc14 = Wyznaczanie położenia z Dopplera LEO, z jednym i wieloma satelitami, ze stanami dryfu zegara i prędkości

seg-de6cb3c06490 = Wsadowe wyznaczanie położenia metodą Gaussa-Newtona z szybkości zmiany odległości z pochodnymi analitycznymi (d rho_dot / d r = -(I - u u^T)(v_s - v_u)/rho, d/dv = -u, d/d drift = { "1" }), stała prędkość użytkownika jako opcja, pseudopomiar wysokości dla użytkownika na powierzchni, kroki tłumione; formalna kowariancja przy wartości prawdziwej; rzuty wzdłuż toru, w poprzek toru i pionowy; dokładność pojedynczego przejścia względem przesunięcia użytkownika w poprzek toru; czas największego zbliżenia. Tryb doppler rodzaju <c1/> dodaje błąd względem długości okna oraz tryb sygnałów okazjonalnych wyłącznie z Dopplerem (preset starlink-sop)

seg-7f462969d2d4 = Łączne wyznaczanie położenia z pseudoodległości GNSS i LEO z odchyleniami międzysystemowymi i modelami błędów dla każdego sygnału

seg-b9b5298e3408 = Fiksy ważoną metodą najmniejszych kwadratów Gaussa-Newtona dla dowolnej mieszanki systemów, z jednym zegarem odbiornika na system (odchylenie międzysystemowe estymowane razem z położeniem) lub ze znanym przesunięciem rozgłaszanym w skali czasu odniesienia; sigmy dla każdego pomiaru podawane przez wywołującego, domyślnie szum termiczny pętli DLL silnika (navsignal::dll_code_jitter_chips) przy C/N0 dla danej elewacji połączony z błędem zakresu sygnału w przestrzeni; nieważone DOP (GDOP, PDOP, HDOP, VDOP, TDOP) w lokalnym układzie geodezyjnym, formalne sigmy wschód-północ-góra i sigmy odchyleń; tryb joint rodzaju <c1/> porównuje fiksy wyłącznie GNSS, wyłącznie LEO i fuzyjne oraz przegląda DOP względem liczby dodanych satelitów LEO

seg-ee9a4a0cb530 = Zbieżność precyzyjnego wyznaczania położenia (PPP) wyłącznie z GNSS i z uzupełnieniem przez LEO

seg-a54f36c27d90 = Rozszerzony filtr Kalmana PPP z niejednoznacznościami rzeczywistoliczbowymi (float) na kodzie i fazie wolnych od jonosfery: współrzędne statyczne, biały zegar odbiornika, jedno odchylenie międzysystemowe dla każdego dodatkowego systemu, opóźnienie zenitalne wilgotne jako błądzenie losowe odwzorowane przez 1/sin(elewacja), niejednoznaczność float dla każdego łuku satelity dodawana przy wschodzie i usuwana przy zachodzie oraz błąd precyzyjnej orbity i zegara wspólny dla kodu i fazy satelity, przetwarzany jako jedna skorelowana aktualizacja dwuwierszowa w postaci stabilizowanej Josepha; pomiary symulowane z tego samego modelu; czas zbieżności (błędy poniżej progów do końca przebiegu), krzywe błędów i uśrednione po przebiegu NEES położenia dla samego GNSS i każdego przypadku LEO, uruchamiane jako rodzaj <c1/>

seg-9306f1c06081 = Transfer czasu do UTC wspomagany przez LEO względem C/N0 i oscylatora odbiornika

seg-c618feb01476 = Pomiary zegara z każdego satelity LEO w widoku w znanym położeniu, łączone odwrotnością wariancji z modelu szumu pseudoodległości, filtrowane dwustanowym (faza, częstotliwość) filtrem Kalmana, którego szum procesu to biały szum częstotliwości i szum częstotliwości typu błądzenie losowe klasy oscylatora (slot_timing::ClockNoise, clock_state::ClockClass; wariancja dryfu holdover::coast_phase_variance), zegar prawdziwy z ziarna z tych samych poziomów oraz wyrażenie IS-GPS-200 sekcja { "20.3.3.5.2.4" } na przejście z czasu systemowego do UTC z niepewnością rozgłaszanego przesunięcia dodaną jako odchylenie dla każdego przebiegu; tryb timing rodzaju <c1/> przegląda oscylatory i przesunięcia C/N0

seg-d92777401093 = Nazwane systemy LEO PNT jako opcjonalne presety danych, każdy z podanym źródłem

seg-5130bfe2410c = Dane wejściowe niezależne od systemu: każdy system to powłoki Walkera, jawne elementy lub preset GNSS, sygnał (nośna, szybkość chipów, szerokość pasma, moc odbierana lub zakres C/N0), SISRE, sigma Dopplera i model zegara; presety wypełniają tylko to, czego scenariusz nie podaje, po jednym pliku z źródłami oznaczonymi PUBLIC (z adresem URL), WORKSHOP lub DERIVED, a wartości nieopublikowane wymienione jako reprezentatywne: Xona Pulsar X1/X5, Iridium STL, sygnały okazjonalne Starlink, CentiSpace, reprezentatywny system pasma C, model efemerydy ATOMIC z zerowym zegarem oraz jeden preset pochodzący z warsztatów w opcjonalnym pliku presetu Celeste IOD, wycofywany przez usunięcie tego pliku i jego scenariuszy

seg-dec52b5b9cd6 = Jeden system LEO-PNT od początku do końca: projekt sygnału, bilans łącza przejścia, komunikat nawigacyjny i fuzyjne wyznaczanie położenia, przy czym wynik każdego etapu jest przekazywany do następnego

seg-39443b31d418 = Rodzaj <c1/>: projekt leo-signal (preset publiczny lub zapisany w treści) ustala środek, szerokość pasma, szybkość chipów i podział EIRP pasma leo-pass; przejście daje C/N0 śledzonej składowej i jitter kodu z ograniczonym pasmem w każdej epoce; prosta C/N0 metodą najmniejszych kwadratów względem sin(elewacja), SISRE komunikatu leo-navmsg (dopasowane na orbicie satelity przejścia, plus podany człon wyznaczania orbity w pierwiastku sumy kwadratów) oraz nośna i szybkość chipów projektu trafiają do każdego systemu LEO łącznego fiksu leo-pvt i, opcjonalnie, do przypadków LEO leo-ppp; każde przekazanie jest raportowane z wartością i jednostką

seg-b12fc1728220 = Sekcja <c2/> rodzaju <c1/>: spoofer podrabia, spójnie w odległości i szybkości zmiany odległości, sygnały widziane w deklarowanym położeniu, które skacze i/lub jest odsuwane od prawdziwego po chwili rozpoczęcia (dla każdego pasma LEO i dla sygnału GNSS na orbicie MEO); odbiornik przewiduje każdą szybkość zmiany odległości z rozgłaszanej orbity oraz niezależnego położenia i prędkości a priori i testuje zmierzone szybkości zmiany odległości uogólnioną statystyką chi-kwadrat metodą najmniejszych kwadratów w oknie epok (dryf zegara jako zakłócenie lub z priorem), dla kanałów GNSS, kanałów LEO i wszystkich kanałów, z szumem termicznym pętli FLL z C/N0 (Kaplan & Hegarty { "2006" }, sekcja { "5.6.2" }); prawdopodobieństwo detekcji z niecentralnego rozkładu chi-kwadrat przy podanym prawdopodobieństwie fałszywego alarmu, detekcja ogłaszana przy podanym prawdopodobieństwie niewykrytego zdarzenia

seg-5f341f85ac07 = Detekcja spoofingu przez spójność międzypasmową wielopasmowego sygnału LEO

seg-2f9c4d351b0f = Dla każdego satelity LEO i pary pasm pomiaru odległości sekcja <c1/> tworzy kombinację pseudoodległości wolną od geometrii, usuwa model jonosferyczny odbiornika i testuje jej krok z epoki na epokę względem szumu kodu obu pasm i podanej tolerowanej niemodelowanej szybkości zmian jonosfery (dwustronnie gaussowsko, dokładne prawdopodobieństwo detekcji); spoofer, który podrabia niektóre pasma, a inne nie, lub każde pasmo bez jonosfery, jest widoczny w chwili rozpoczęcia; taki, który podrabia każde pasmo i symuluje jonosferę, nie jest, co wynik stwierdza

seg-97dbcd5f2728 = Sondowanie jonosfery: skośny TEC z dwupasmowego opóźnienia przejścia LEO

seg-844de34fd2f3 = Dla każdej pary pasm satelity rodzaju <c1/> raport podaje skośną całkowitą zawartość elektronów, którą kombinacja kodowa wolna od geometrii odtwarza w szczycie przejścia, (P2 - P1) f1^{ "2" } f2^{ "2" } / ({ "40.3" } (f1^{ "2" } - f2^{ "2" })), oraz jej 1-sigma z szumu termicznego kodu obu pasm, dzięki czemu każdy wielopasmowy projekt LEO-PNT można rozważać jako sondę jonosfery

seg-1fdbb476c8ab = Wskaźnik zaufania na statkach: agregacja dowodów z monitorów w wynik 0-100 i jego trzy pasma

seg-0d76b33144f1 = Każdy monitor sprowadza swoje dowody do stosunku statystyki do progu; wynik to { "100" } minus suma po monitorach z wagi razy ograniczona liniowa rampa stosunku ({ "0" } do { "0.5" }, { "1" } przy { "1.5" }), ograniczona do { "0" } do { "100" } i zaokrąglona do { "0.1" }, z pasmami przy { "90" } i { "55" }; każda epoka wylicza monitory, które odjęły punkty, wraz z ich punktami.

seg-51640405c9b7 = Zdarzenia SIEM telemetrii zaufania: Log Event Extended Format (LEEF) przez syslog

seg-1b3245506847 = Zdarzenia zmiany pasma (lub dla każdej epoki) jako ładunki Log Event Extended Format { "2.0" } w kopercie RFC { "5424" } przez UDP lub TCP, z udokumentowanym odwzorowaniem pól.

seg-c04042b0270a = Progi zakłóceń odbiornika kalibrowane na zbiorze danych JammerTest { "2024" }

seg-32ad0b0da818 = receiver_trust::calibration::run_dataset: zarejestrowana wstępnie kalibracja monitorów spadku C/N0, AGC i wskaźnika zagłuszania na publicznym zbiorze danych JammerTest { "2024" } (Zenodo { "15911589" }, GPL-3.0-or-later, pobierany w czasie działania, nigdy nie kopiowany do repozytorium): dla każdego folderu oś czasu { "1" } s z mon_rf.csv i rinex.csv, monitory uruchamiane raz, każda epoka po kalibracji oznaczona jako czysta lub zagłuszana na podstawie attack_log folderu (przesuniętego z CEST na UTC, margines { "60" } s), każdy próg przeglądany po stałej siatce, wybierany najmniejszy próg ze zbiorczym prawdopodobieństwem fałszywego alarmu na czystych danych co najwyżej { "0.01" } oraz liczby wstrzymane z pominięciem jednego folderu; kontrola krzyżowa czytnika UBX. Wybór dostarczany jest tylko jako opcjonalny profil [monitors] profile = "jammertest-2024-calibrated" (cn0_drop_db { "1.5" }, agc_k_sigma { "3.5" }, jam_ind_threshold { "29" }); reguła domyślna i każde wyjście bez niego pozostają bez zmian

seg-65a8361b4a22 = Ocena Jammertest: log odbiornika oceniany dla każdego zaplanowanego testu (opóźnienie detekcji, niewykryte alarmy, fałszywe alarmy, czas do powrotu do normy) względem opublikowanego planu testów

seg-98d8c39f47ae = jammertest::{ "{" }plan, score, dataset{ "}" } (kshana jammertest import|score): katalog testów i plan transmisji NPRA (MIT, pobierany z przypiętym SHA-256, nigdy nie dołączany do repozytorium) odczytane jako zaplanowana prawda odniesienia z zachowanymi identyfikatorami katalogowymi; przebieg receiver-trust oceniony dla każdego testu (pierwszy alarm minus planowany początek, wykryto/spóźniono/niewykryto względem tolerancji, czas do pierwszego odcinka bez alarmów, alarmy poza każdym slotem i jego marginesem ochronnym), z podpisanym pakietem dowodowym zawierającym kartę wyników. Harmonogram to planowane sloty, a nie zarejestrowane czasy emisji

seg-ee99388f7b15 = compliance (kshana compliance-report): odwzorowanie wyników Kshana na punkty publicznych ram odniesienia wyłącznie według numeru, wypełniane z podanych przebiegów; wynik liczy się na rzecz możliwości tylko wtedy, gdy niesie dowód, który odwzorowanie wskazuje, pusty zbiór niczego nie dowodzi, a sformułowanie brzmi „dostarcza dowodów na (supports evidence for)”; raport nie jest ustaleniem, że jakiekolwiek ramy odniesienia są spełnione, ani oceną czy zatwierdzeniem przez kogokolwiek.

seg-98c360d82d56 = Integracje morskie: wtyczka Signal K, strumień bramki i panel oceny OpenCPN, build referencyjny

seg-7af9ce566646 = Wskaźnik zaufania, pasmo, przyczyny, stan bramki i położenie zgłaszane przez odbiornik, publikowane pod navigation.gnss.kshana na serwerze Signal K z powiadomieniem warn, alarm i normal (integrations/signalk); bramkowany strumień NMEA, z fixem oznaczonym jako nieważny, gdy zaufanie załamane, i jednym zdaniem PKSHT na cykl, udostępniany OpenCPN przez TCP przez samą bramkę lub przez mały przekaźnik, oraz natywny panel oceny OpenCPN odczytujący zdanie PKSHT (integrations/opencpn); a także jednostki systemd i kontener uruchamiające bramkę (deploy/reference-build). Tam, gdzie pokazują one wyniki, towarzyszy im oświadczenie doradcze: Oprogramowanie wyłącznie doradcze, nie jest to sprzęt nawigacyjny z zatwierdzeniem typu (IEC { "61108" }, IEC { "61162" }): za nawigację statku odpowiada nadal operator.

seg-89ab9ef155eb = Śledzenie BOC({ "1,1" }): skalowanie DLL i rozwiązywanie niejednoznaczności bump-jump (opcjonalne)

seg-ef24be9b5917 = Pole boc w iq::track::LoopConfig (opcjonalne, domyślnie None): trzy dyskryminatory DLL przeskalowane tak, by odczytywały błąd kodu w chipach ze zboczem jednostkowym na głównym szczycie sinusoidalnego BOC({ "1,1" }), oraz monitor bump-jump na korelatorach bardzo wczesnym i bardzo późnym przy połowie okresu poddziałania nośnej ({ "0.5" } chipa), który przeskakuje NCO kodu w stronę głównego szczytu, gdy licznik w górę/w dół osiągnie N ({ "8" } domyślnie). Bez tej opcji każde wyjście pozostaje bez zmian.

seg-2c32955cbfb3 = Kanał scyntylacji jonosferycznej IQ (model Cornell) względem zmierzonej scyntylacji GPS L1 { "50" } Hz

seg-2fdcb373ab25 = iq::channel::scint, model scyntylacji Cornell (intensywność Rice'a, widmo Butterwortha drugiego rzędu, faza arg z) sterowany S4 i czasem dekorelacji intensywności zmierzonego okna, porównywany pod kątem tego, co generuje ponad te dwa wejścia; realdata::scint50 odczytuje zmierzony log, usuwa trend i wykonuje porównanie.

seg-160507ac3702 = Opcja CFAR z uśrednianiem komórek w akwizycji IQ

seg-7c0a1adc9ae6 = iq::acq::ca_cfar i ca_cfar_cells (opcjonalne): komórka siatki akwizycji jest porównywana ze średnią komórek odniesienia swojego wiersza Dopplera (opóźnienia ochronne i krokowe, zawijane wokół okresu), ze współczynnikiem alpha ustalonym ze wzoru zamkniętego na prawdopodobieństwo fałszywego alarmu CA-CFAR dla M blokowań niekoherentnych (ca_cfar_pfa, ca_cfar_alpha). Detektor mocy próbki pozostaje domyślny, a każde istniejące wyjście jest bez zmian.

seg-5bd3bf0c22a7 = Model widma: pasma GLONASS, BeiDou i Galileo E6 (opcjonalne)

seg-9c16189c63ac = spectrum::default_band rozpoznaje, wyłącznie po nazwie (MORE_BAND_NAMES), GLONASS L1OF i L2OF na każdym kanale FDMA K = -7 do { "6" } (BPSK, { "0.511" } Mchip/s), BeiDou B1I (BPSK({ "2" })), B1C (MBOC(6,1,1/11)), B2a i B3I (BPSK({ "10" })) oraz Galileo E6 (BPSK({ "5" })), z nośnymi i minimalnymi mocami odbieranymi z ich dokumentów kontroli interfejsu; domyślny zestaw pasm i każde istniejące wyjście pozostają bez zmian.

seg-7b1ae0c7ca28 = Kody trzeciorzędowe LunaNet AFS i warstwa komunikatów (SB1 BCH, CRC-24Q, przeplatacz) względem LSIS-AFS V1.0

seg-45215637ad2d = iq::signals::lunanet::afs_q_tertiary_bits, afs_q_tiered; iq::lunanet_afs: wzorzec synchronizacji, koder SB1 BCH({ "51,8" }) i dekoder 256 hipotez, CRC-24Q, przeplatacz blokowy { "60" } x { "98" }, sprawdzacz strumienia symboli (kshana lunanet-afs-check) oraz generator strumienia testowego z podramkami zastępczymi. Kodowanie LDPC o szybkości 1/2 podramek od { "2" } do { "4" } nie jest zaimplementowane (jego macierze są w osobnym załączniku).

seg-0d7b17524c04 = Pakiety norm: scenariusze oceniane względem progów ustalonych przed przebiegiem

seg-6e5c04fd4531 = standards_pack (kshana standards-pack): profile testów ram DHS Resilient PNT dla poziomów od { "1" } do { "4" }, poziomy dokładności i ocena integralności IMO MSC.1/Circ.1575 oraz pakiety ICAO Doc { "9849" } Appendix F monitorowania, oceny i łagodzenia: każdy test uruchamia dołączony rodzaj scenariusza i porównuje pola wyniku z progami podanymi w pakiecie, a testy wymagające logu odbiornika są wymienione jako WYMAGA DANYCH WEJŚCIOWYCH i nie są oceniane.

seg-8a8f2c85e0c3 = Laboratoryjny pakiet dowodowy round-trip (scenariusz, warunki testu, log odbiornika, ocena)

seg-a090b06a920d = evidence::roundtrip (kshana evidence round-trip) oraz eksport logu odbiornika kshana.test-conditions/1 z kshana bench-export: podpisany pakiet zapisujący skrót scenariusza, skrót podanych warunków, skrót logu i ocenę względem podanych zdarzeń, który odmawia przyjęcia warunków niezgodnych ze zdarzeniami oceny lub logu, którego skrót nie jest podanym. Żaden sygnał nie jest zapisywany, odtwarzany ani planowany.

seg-a9189e4fe413 = Silnik śledzenia IQ względem GNSS-SDR { "0.0.19" } na niezależnych nagraniach

seg-364de05e5b1b = Pełny silnik śledzenia warstwy IQ (iq::track przez kshana iq track: przekazanie z akwizycji, korelatory, NCO, PLL Costasa drugiego rzędu { "15" } Hz, DLL EML-envelope pierwszego rzędu { "2" } Hz wspomagany nośną, wskaźnik blokady i estymatory C/N0) na GPS L1 C/A przy { "30" } do { "45" } dB-Hz.

seg-259d201c2ff8 = Wzmocnienia anten CRPA w rodzaju jamming względem niezależnego przeliczenia w numpy

seg-192144c57783 = Opcjonalna sekcja [crpa] rodzaju jamming: wiązka dla każdego kanału w stronę każdego satelity (sterowanie zerem z zagłuszaczem jako zerem lub MVDR na sigma^{ "2" } I + P_j a_j a_j^H), skalująca szum każdego łącza przez ||w||^{ "2" } i zagłuszacz przez |w^H a_j|^{ "2" } przed istniejącym równaniem C/N0 odpornego na zagłuszanie.

seg-a2f34cff9338 = Zacienianie terenu zagłuszacza w rodzaju jamming względem niezależnego przeliczenia w numpy na prawdziwym kafelku SRTM

seg-334c569d9cae = Opcjonalna sekcja [terrain] rodzaju jamming: profil terenu po ortodromie między zagłuszaczem a odbiornikiem na kafelku SRTM .hgt z wybrzuszeniem Ziemi o współczynniku k, dominująca krawędź nożowa (największe nu Fresnela-Kirchhoffa) i strata pojedynczej krawędzi nożowej według ITU-R P.526-15, sekcja { "4.1" }, odjęta od mocy odbieranej zagłuszacza.

seg-825c121c7512 = Histereza akwizycji i kwantyzator front-endu w rodzaju jamming względem niezależnych przeliczeń

seg-f7207263d881 = Opcjonalna sekcja [acquisition] rodzaju jamming (satelita jest akwizycjonowany przy progu akwizycji lub powyżej po opóźnieniu ponownej akwizycji i utrzymywany, dopóki jest na progu śledzenia lub powyżej) oraz sekcja [front_end] (odczyt AGC { "10" } log10({ "1" } + J/N) i strata kwantyzatora ADC dla wejścia gaussowskiego, odejmowane od każdego łącza i oznaczone jako nieważne dla zagłuszaczy niegaussowskich).

seg-9c46f1c76486 = Ograniczone wciąganie FLL poniżej progu przejścia z FLL na PLL w projekcie domyślnym (opcjonalne)

seg-efa1d1a9e904 = Opcjonalne carrier.fll_pull_in_max_s w iq::track (pole fll_pull_in_max_s w iq::track::LoopConfig): przy fll_assist = pull-in FLL przekazuje sterowanie do PLL po stałym czasie wciągania niezależnie od PLI, z odpowiadającym mu czasem powrotu, aż PLI po raz pierwszy osiągnie fll_off_pli.

seg-ac0f97e945a7 = Czytnik rozwiązań RTKLIB .pos dla receiver-trust

seg-0b8bc2c89de4 = Odczytuje plik rozwiązania RTKLIB (czas kalendarzowy lub tydzień GPS/TOW, szerokość/długość geograficzna lub położenie ECEF, użyte satelity) do osi czasu receiver-trust (receiver_trust::machines::rtklib).

seg-849393517c04 = Logi ASCII i binarne NovAtel OEM7 (BESTPOS, RANGE, RXSTATUS) dla receiver-trust

seg-7e0021922025 = Odczytuje BESTPOS (położenie), RANGE (C/No dla każdego sygnału) i RXSTATUS (flaga zagłuszacza odbiornika, jako samozgłoszenie epoki) z logów OEM7 ASCII i binarnych, ze sprawdzaniem CRC, wyłącznie do odczytu (receiver_trust::machines::novatel).

seg-a45c53a9deb3 = Czytnik stosunku nośnej do szumu RTCM { "3" } MSM4 i MSM7 dla receiver-trust

seg-0a0c9976236f = Odczytuje C/N0 każdej komórki sygnału komunikatów RTCM { "3" } MSM4 i MSM7 (GPS, GLONASS, Galileo, SBAS, QZSS, BeiDou, NavIC) ze strumienia ramek, ze sprawdzaniem CRC-24Q (receiver_trust::machines::rtcm3). Układy pochodzą z tabel pyrtcm na licencji BSD, a nie z tekstu normy RTCM.

seg-cd554a7c1649 = Adapter monitora GNSS-SDR dla receiver-trust

seg-22b587ac642d = Odczytuje komunikaty GNSS-SDR Monitor (Gnss_Synchro) i monitora PVT, przekazane do linii JSON z nazwami pól proto, do C/N0 dla każdego kanału, fixa, użytych satelitów, HDOP i nieba (receiver_trust::machines::gnss_sdr; integrations/gnss-sdr/relay.py).

seg-217e5953c128 = Wczytywanie logów IMU, wejście kursu z żyroskopu i dopasowanie Allana parametrów czujników hybrydowych

seg-9dadc819daef = Odczytuje CSV z IMU (udokumentowane kolumny lub układ EuRoC); całkuje prędkość kątową odchylenia do kursu, który odczytuje monitor heading-course ([log.imu]); i dopasowuje parametry szumu akcelerometru i żyroskopu scenariuszy hybrydowych i fuzji na podstawie logu w spoczynku metodą nakładającego się odchylenia Allana (imu-fit).

seg-15a852a2dcb0 = Wykrywanie MQTT Home Assistant i eksporter stanu telemetrii zaufania

seg-6d6b07b26966 = Dokument stanu JSON i komunikaty wykrywania MQTT Home Assistant dla strumienia zaufania, drukowane jako tekst na każdej powierzchni i publikowane przez MQTT { "3.1.1" } QoS { "0" } z wiersza poleceń (telemetry::mqtt; trust-telemetry --mqtt-tcp, --print-mqtt, format mqtt).

seg-68caf86157c2 = Pakiet ROS { "2" } receiver-trust i most gnss_lib_py

seg-e7d7d99fe538 = Most niezależny od ROS, który zapisuje komunikaty fixa i satelitów jako NMEA i ocenia je przez wiązanie Pythona (integrations/ros2/kshana_trust), oraz most gnss_lib_py NavData do receiver-trust przez format rtklib-pos (integrations/gnss_lib_py).

seg-c3c260b7063e = Testy
