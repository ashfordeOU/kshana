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

seg-b24486eee0fb = Źródło: <c1/>

seg-34d1304c9555 = Możliwości obliczone z modelu: uzasadnienie

seg-144f441bf52b = Te możliwości są zaimplementowane na podstawie opublikowanej lub pierwszozasadowej fizyki i przetestowane, ale są <b>uczciwie oznaczone MODELLED</b>: nie zostały sprawdzone względem niezależnej wyroczni z podaną tolerancją. Testy niezmienników macierzy wymuszają, że VALIDATED mogą być tylko wiersze oparte na <c1/>, więc nic tu nie może zostać po cichu awansowane. Każdy wiersz podaje, dlaczego pozostaje obliczony z modelu.

seg-0630e39b4de3 = Rodzaj wyroczni

seg-bb023086bbe3 = Dlaczego pozostaje obliczone z modelu

seg-dd6ba97ce971 = InternalConsistency

seg-bac242dada9c = sprawdzone względem własnej tożsamości w postaci zamkniętej / analitycznej: wychwytuje błędy przepisania i współczynników, ale nie jest zewnętrzną wyrocznią — brak zewnętrznej: Orekit { "12.2" } nie ma współczynnika oświetlenia z uwzględnieniem ściemnienia brzegowego tarczy. Sprawdzone tylko względem postaci zamkniętych tego samego prawa

seg-33d506570c1b = srp_shadow::tests (postać zamknięta pierścieniowa, jednorodne prawo odtwarzające cień stożkowy, granice pełnego Słońca i umbry)

seg-91fe516eabd4 = ExternalDataset

seg-cb2cbb31b091 = podrzędne twierdzenie jest sprawdzone zewnętrznie, ale cała możliwość składa się ze składników obliczonych z modelu, więc możliwość pozostaje obliczona z modelu — Orekit { "12.2" } (Apache-2.0) NumericalPropagator/DormandPrince853 z ThirdBodyAttraction i SolarRadiationPressure na własnym czytniku DE440 Orekit (orekit-data lnxp1990.440), uruchomiony jako osobny program; kshana czyta bitowo zgodny, sprawdzony SPICE wycinek NAIF de440s.bsp. Progi ustalone z góry w xval/propagator-de440-orekit/PREREGISTRATION.md (22a5a01d). Próg dla orbity ({ "0.5" } m) i kontrola czułości zostały spełnione, ale próg położenia Słońca/Księżyca ({ "3" } m / { "0.2" } m) został chybiony przy { "6.39" } m / { "0.244" } m. SPICE czytający to samo jądro w dokładnym TDB mija się z Orekit o tyle samo ({ "6.25" } m / { "0.240" } m), więc rozbieżność leży między ścieżką de440s NAIF a czytnikiem DE440 lub skalą czasu Orekit; przyczyna nie została wyizolowana. Zapisane i przypięte, więc wiersz pozostaje MODELLED

seg-13f8f557c721 = propagator (ForceModel::with_ephemeris, ForceEphemeris), ephem_provider

seg-20f163c0cb8f = tests/propagator_de440_orekit_oracle.rs ({ "5" } przypadków x { "25" } godzinnych stanów w { "24" } h, LEO, GEO i HEO, trzecie ciało oraz trzecie ciało + SRP: najgorsze |dr| { "0.0170" } m, |dv| { "1.84e-5" } m/s; kontrola szeregiem analitycznym mija się o { "9.96" } m; Słońce { "6.39" } m i Księżyc { "0.244" } m względem pozycji DE440 z Orekit, zapisane chybienie); testy jednostkowe propagatora (odmowa dostawcy, zliczanie rezerwy współdzielone między klonami)

seg-b55bcab6f986 = sprawdzone względem własnej tożsamości w postaci zamkniętej / analitycznej: wychwytuje błędy przepisania i współczynników, ale nie jest zewnętrzną wyrocznią — brak zewnętrznej dla efektu geopotencjału. { "24" } współczynniki są przepisane z GFZ STR06/01 Tabela { "1" } model N1 i zostały ponownie sprawdzone wiersz po wierszu względem raportu (SHA-256 890865ae); stopnie { "0" }, { "1" }, { "7" } i { "8" } nie są używane. Ray i Ponte ({ "2003" }) nie drukują tabeli harmonik sferycznych, więc nie porównano drugiego źródła

seg-448f4acf5c7b = tides, propagator, precise_od

seg-4014447d4bcc = tides::tests (człon S1 jest dobowy, obraca się o { "90" } stopni w ćwierć doby i ma amplitudę współczynnika obciążenia każdego wiersza; wielkość fizyczna na LEO); propagator::tests::the_s1_air_tide_flag_adds_exactly_the_s1_acceleration

seg-a192b0f512cb = podrzędne twierdzenie jest sprawdzone zewnętrznie, ale cała możliwość składa się ze składników obliczonych z modelu, więc możliwość pozostaje obliczona z modelu — Orekit { "12.2" } (Apache-2.0) HolmesFeatherstoneAttractionModel i pyshtools { "4.14.1" } (BSD-3-Clause) MakeGravGridPoint, uruchamiane jako osobne programy; progi ustalone z góry w xval/high-degree-gravity/PREREGISTRATION.md (276c869f) i xval/cowell-tesseral-200-orekit/PREREGISTRATION.md (0aa312a6). Orekit zgadza się wszędzie, gdzie jest zdefiniowany, ale pyshtools chybia swój próg ustalony z góry w dwóch punktach blisko bieguna (do { "7.3e-10" } m/s^{ "2" }; 50-cyfrowa kontrola mpmath przypisuje błąd pyshtools), nie ma wartości wyroczni dokładnie na osi biegunowej, a kontrola czułości stopnia 70 dla orbity { "24" } h, ustalona z góry, została chybiona ({ "0.726" } m wobec > { "1" } m). Każde chybienie jest zapisane, a nie wystrojone, więc wiersz pozostaje MODELLED

seg-8fda2ee90583 = gravity_sh, propagator (FieldEvaluator)

seg-3f7d3003656e = tests/gravity_sh_high_degree.rs (Orekit w { "8" } punktach poza osią: maks. |da| { "2.2e-17" } m/s^{ "2" } przy N = { "70" }, zawsze uruchamiany; { "3.5e-17" }, { "3.9e-17" } i { "7.3e-17" } m/s^{ "2" } przy N = { "200" }, { "360" }, { "2190" }, bramkowane danymi na KSHANA_EGM2008_GFC); tests/cowell_tesseral_200_orekit_oracle.rs (orbita { "24" } h 200x200, bramkowana danymi: najgorsze |dr| { "0.1317" } m, |dv| { "1.45e-4" } m/s; kontrola stopnia 70 { "0.726" } m); testy jednostkowe gravity_sh (zgodność z klasycznym ewaluatorem do { "1e-13" } przy stopniu { "70" }, różnica skończona i ciągłość na biegunie dla pola stopnia 2190, niedomiar członu stopnia 2190 względem obliczenia z rozszerzonym wykładnikiem)

seg-84a9851b838c = podrzędne twierdzenie jest sprawdzone zewnętrznie, ale cała możliwość składa się ze składników obliczonych z modelu, więc możliwość pozostaje obliczona z modelu — Orekit { "12.2" } (Apache-2.0) BatchLSEstimator z własnymi chwilowymi geometrycznymi pomiarami RangeRate i AzEl (sprawdzonymi krzyżowo względem TopocentricFrame Orekit), uruchomiony jako osobny program na identycznych, zamaskowanych obserwacjach z ziarnem. Progi ustalone z góry w xval/od-measurements-orekit/PREREGISTRATION.md (0cf9076). Każdy próg spełniony oprócz B4, zgodności stanu bez szumu do { "1" } cm, chybionego w { "2" } z { "4" } scenariuszy ({ "1.46" }, { "1.74" } cm): własna estymata Orekit bez szumu leży tak daleko od jego symulowanej prawdy odniesienia (przyczyna po stronie Orekit nie została wyizolowana). Zapisane i przypięte, więc wiersz pozostaje MODELLED. Nie modelowano: czasu przelotu światła, aberracji, refrakcji, obrotu Ziemi, filtru sekwencyjnego dla tych rodzajów pomiarów

seg-296a6fe8585b = orbit_determination (determine_orbit_batch_tracking, propagate_with_stm, is_visible), batch_ls (gauss_newton_analytic)

seg-9493e02e3cd1 = tests/od_tracking_measurements_reference.rs ({ "8" } scenariuszy: prędkość zmiany odległości, az/el i mieszane, LEO i MEO, bez szumu i z ziarnem sigma { "5" } m / { "5" } mm/s / { "1e-4" } rad, maski { "5" } i { "10" } deg, względem Orekit { "12.2" }: zbiory widoczne identyczne; wartości pomiarów w granicach { "5.84e-8" } m, { "6.30e-10" } m/s, { "1.44e-13" } rad; STM w granicach { "1.2e-14" } względnie; stany z szumem w granicach { "1.74" } cm i { "1.14e-5" } m/s; RMS po dopasowaniu dla każdego typu w granicach { "2.7e-4" } względnie; kshana bez szumu względem prawdy odniesienia { "1.06e-8" } m; kshana bez szumu względem Orekit { "1.464" } i { "1.740" } cm w dwóch scenariuszach, zapisane chybienie progu { "1" } cm); testy jednostkowe orbit_determination i batch_ls

seg-a5554f29b2d7 = sprawdzone względem własnej tożsamości w postaci zamkniętej / analitycznej: wychwytuje błędy przepisania i współczynników, ale nie jest zewnętrzną wyrocznią — brak zewnętrznej: wagi są wyborem modelowania (format SP3 definiuje ten kod tylko jako wskaźnik dokładności producenta; jest tu odczytywany jako jedno odchylenie standardowe dla każdej osi). Istniejące zapisane przebiegi agencji pozostają bez zmian

seg-f5a76ae1fcaa = sp3, precise_od

seg-39a552abfcab = src/sp3.rs unit tests; tests/agency_galileo.rs::galileo_e11_sp3_accuracy_weighted_fit (zatwierdzone { "8" } h wzorcowe dane ESOC, sigma { "0.032" } m z wykładnika nagłówka { "5" }: Tier-1 3D RMS { "0.132" } m bez zmian, Tier-2 { "0.035" } m wobec { "0.070" } m przy sigma { "1" } m, zmiana wynika z ponownie zrównoważonego empirycznego ograniczenia a priori); tests/agency_swarm.rs (produkt Swarm nie niesie kodów dokładności i wraca do rezerwy, przypięte)

seg-a5ad470a4816 = sprawdzone względem własnej tożsamości w postaci zamkniętej / analitycznej: wychwytuje błędy przepisania i współczynników, ale nie jest zewnętrzną wyrocznią — tylko spójność wewnętrzna. Każde opublikowane pole jest zdefiniowane w układzie związanym z ciałem u jego producenta (GMM-3 w układzie Marsa Konopliv i in. { "2006" }, GL0660B w układzie osi głównych Księżyca DE421), a pole jest obliczane w układzie IAU; przesunięcie nie jest modelowane

seg-409f709cceb3 = gravity_pds, body, propagator, mars_frame

seg-0fe6532ca74d = tests/planetary_gravity_pds.rs::a_shadr_field_attached_to_a_body_drives_the_propagator; gravity_pds::tests::with_gravity_field_is_opt_in

seg-eff90f999826 = sprawdzone względem własnej tożsamości w postaci zamkniętej / analitycznej: wychwytuje błędy przepisania i współczynników, ale nie jest zewnętrzną wyrocznią — tylko wewnętrzny obieg w obie strony i znane odpowiedzi z ICD; nie uruchomiono żadnego dekodera zewnętrznego (harness RTKLIB/GNSS-SDR czytający KSHANA_NAVMSG_ORACLE_JSON jest bramkowany danymi). MODELLED

seg-e3d75762b979 = gnss_navmsg (gps_cnav, gal_inav, gal_fnav, fec)

seg-dbe0dd5dcf47 = gnss_navmsg::tests (wartość kontrolna CRC-24Q 0xCDE703; odpowiedź impulsowa splotowa; Viterbi poprawia wprowadzone błędy; szerokości układu); tests/gnss_navmsg_roundtrip.rs (bity początkowe pól równe numerom bitów w ICD; kodowanie -> FEC -> przeplot -> Viterbi -> dekodowanie obiega w obie strony w granicach pół LSB); tests/gnss_navmsg_galileo_brdc_grid.rs (rekordy Galileo z IGS BRDC 2018-133 na siatce LSB, najgorsze { "3.6e-3" } LSB; próg liczby satelitów ustalony z góry chybiony, { "15" } z { "20" }, USTALENIE)

seg-81b76a6d1bcd = sprawdzone względem własnej tożsamości w postaci zamkniętej / analitycznej: wychwytuje błędy przepisania i współczynników, ale nie jest zewnętrzną wyrocznią — USTALENIE względem opublikowanych współrzędnych ITRF2020 WTZR: progi ustalone z góry (wygładzona mediana i p95 co najwyżej { "0.6" } x surowe; tests/fixtures/gnss_wettzell_2025055/PREREGISTRATION_HATCH.md) zostały chybione, stosunki { "0.718" } i { "0.923" }; pozostały błąd na poziomie metrów ma charakter podobny do obciążenia (obciążenie kodu C1C, antena, pływy, wielodrogowość długookresowa), a nie szumu białego, który wygładzanie usuwa. MODELLED: statystyki filtru są sprawdzane wewnętrznie

seg-b81cd9204f64 = hatch (HatchFilter), pvt (assemble_epoch_precise_smoothed, CarrierSmoother)

seg-e892fffaaf07 = hatch::tests (przejście bez szumu; wariancja szumu białego 1/(2N-1); restarty); tests/hatch_wettzell_oracle.rs::hatch_finding_is_pinned (WTZR 2025-02-24 01-06 h, { "600" } epok, N = { "100" }: mediana błędu 3-D { "1.553" } -> { "1.116" } m, p95 { "3.473" } -> { "3.207" } m)

seg-1bbd39c17347 = sprawdzone względem własnej tożsamości w postaci zamkniętej / analitycznej: wychwytuje błędy przepisania i współczynników, ale nie jest zewnętrzną wyrocznią — zgodność formatu na rzeczywistym opublikowanym pliku RINEX { "4.00" } (odczytane wartości równają się literałom wydrukowanym w pliku) i nagłówek wyprowadzony ze specyfikacji; nie uruchomiono niezależnego czytnika, więc MODELLED

seg-bdda05057c91 = rinex_obs (parse_obs)

seg-b19cbd364dea = src/benchmark/scorecard.rs::tests (referencyjny PL pochłania; uszkodzony PL niepochłonięty-nigdy-niewykryty; werdykt pokrycia wykrywalnego; właściwość rzetelności, że dla scenariusza niewykrywalnego nie da się uzyskać żadnego werdyktu pokrycia ani detekcji)

seg-350aaf43f349 = sprawdzone względem własnej tożsamości w postaci zamkniętej / analitycznej — wychwytuje błędy przepisania i współczynników, ale nie jest zewnętrzną wyrocznią — Brak zewnętrznej wyroczni i żadna nie jest możliwa: to jest samoopis, a nie pomiar. Zapisano go, ponieważ jego brak był defektem -- P5 musiało przytaczać długość fali nośnej i aperturę nadawczą z domyślnych wartości w kodzie źródłowym oraz wnioskować na podstawie wewnętrznej kontroli spójności, że goła <c1/> jest w metrach kwadratowych. Wniosek był poprawny, i właśnie dlatego miało to znaczenie: nic nie wychwyciłoby pomyłki

seg-6d963d838eed = hybrid_integrity::tests (rozwiązana konfiguracja jest zwracana echem zarówno dla wartości domyślnych, jak i dla nadpisań, bez przepuszczania długości fali tam i z powrotem przez metry; każdy wpis jednostek zawiera zarówno jednostkę, jak i klasę pochodzenia; każde pole, które wymienia blok jednostek, jest faktycznie emitowane, więc nie może dokumentować pola-widma)

seg-cbd0ee1c1e97 = sprawdzone względem własnej tożsamości w postaci zamkniętej / analitycznej — wychwytuje błędy przepisania i współczynników, ale nie jest zewnętrzną wyrocznią — Brak zewnętrznej wyroczni, a ExternalDataset jest odrzucony. Dwa wejścia to margines Eb/N0 oraz przekroczenie progu C/N0, oba będące funkcjami MODELLED EIRP, współczynnika jakości i zbiorczego przydziału strat; nie istnieje zmierzony zapis dostępności usługi hybrydowej optyczno-radiowej Ziemia–Księżyc, względem którego można by sprawdzić złożoną wartość. Istniejące kontrole są wewnętrzne i tak są opisane: złożenie jest przeliczane ponownie na podstawie opublikowanych w samym raporcie marginesów, a nie na podstawie wnętrza emitera, a zasięg domknięcia jest weryfikowany przez ponowne uruchomienie równania łącza W tym punkcie i wymaganie, by margines zanikł -- to jest rundka z odwróceniem, a nie niezależna implementacja. Rzetelna granica tej wartości jest zapisana w samym raporcie: jest to deterministyczny wskaźnik 0/1, a nie prawdopodobieństwo, ponieważ nic w tym silniku nie mierzy rozkładu przerw w łączu radiowym w tym paśmie i tej geometrii. Ten brakujący wejściowy element jest nazwany w rf_availability.factors_not_included, a nie wymyślony, i jego dostarczenie jest tym, czego wymagałaby probabilistyczna dostępność łącza radiowego

seg-55f2385bbe8a = hybrid_integrity, linkbudget, jamming

seg-188ab5b1b2e9 = hybrid_integrity::tests (dostępność jest równa iloczynowi dwóch wskaźników przeliczonych ponownie z marginesów z samego raportu, a te marginesy są same złożone ponownie z EIRP, straty w wolnej przestrzeni, strat zbiorczych, współczynnika jakości, składnika Boltzmanna, szybkości transmisji danych i wymagania z dokładnością do { "1e-9" } dB; wartość jest mierzona jako { "0" } lub { "1" }, podczas gdy dostępność optyczna w tym samym przebiegu jest mierzona jako ściśle między nimi; każdy wiersz czynnika niesie klasę pochodzenia ze zamkniętego słownika field_schema; zgłoszony zasięg domknięcia ponownie przepuszczony przez bilans łącza zwraca margines od { "0" } do { "1e-9" } dB i jest mierzony jako niezależny od zasięgu, na którym stał przebieg, w czterech dekadach, podczas gdy wykorzystanie zasięgu zmienia się dokładnie o stosunek zasięgów; łącze -40 dBW zgłasza dostępność { "0" }, LOST oraz wykorzystanie powyżej { "1" }, a nie ułamek; wycofana uwaga „silnik nie oblicza odpowiednika dostępności łącza radiowego” jest potwierdzona jako usunięta, a zastępująca ją jest potwierdzona jako wymieniająca nowe pole; nieprawidłowe wejście radiowe jest odrzucane, a nie przycinane)

seg-6471f38fc505 = sprawdzone względem własnej tożsamości w postaci zamkniętej / analitycznej — wychwytuje błędy przepisania i współczynników, ale nie jest zewnętrzną wyrocznią — Brak zewnętrznej wyroczni dla STOSUNKU, a ExternalDataset jest odrzucony celowo. Leżący u podstaw tor radiowy ją ma -- tests/validate_p5_rf_ranging_precision.rs sprawdza linkbudget::link_budget i navsignal::dll_code_jitter_chips względem niezależnego wzorca w Pythonie/NumPy oraz względem zakodowanej na stałe wartości przykładowej Kaplana i Hegarty'ego ({ "2.814e-3" } chip / { "0.825" } m przy { "45" } dB-Hz) -- a optyczne CRLB ma własny wiersz w postaci zamkniętej. Powołanie się na któryś z tych punktów oparcia dla tego wiersza byłoby pożyczoną walidacją, której zapobiegają niezmienniki macierzy: wielkość tutaj jest STOSUNKIEM w konfiguracji z MODELLED EIRP, współczynnikiem jakości, mocą nadawczą i aperturą, a nie istnieje zmierzone porównanie dalmierzenia optycznego i radiowego w wspólnym punkcie pracy, względem którego można by ją sprawdzić. Wewnętrznie sprawdza się to, w czym stosunek może faktycznie się mylić: czy oba ramiona leżą w jednym punkcie pracy. Mierzy się to przez skalowanie wspólnego czasu akumulacji i wymaganie, by oba ramiona zmieniły się zgodnie z tym samym prawem pierwiastka kwadratowego, a stosunek pozostał na miejscu, i jest to wymuszone przez wprost odrzucenie stosunku, gdy czasy uśredniania się różnią. Oba ramiona są ograniczeniami szumu termicznego/śrutowego i oba wykluczają opóźnienie ośrodka, błąd zegara i niejednoznaczność, więc wykluczenie jest identyczne po obu stronach; raport tak mówi, zamiast pozostawiać to do domysłu

seg-616d297a3190 = hybrid_integrity, optical_linkbudget, linkbudget, navsignal

seg-d3a72a60b237 = hybrid_integrity::tests (stosunek jest równy dwóm wyemitowanym ramionom podzielonym przez siebie, z dokładnością do { "1e-15" } względnie, a jego odwrotność i postać w decybelach są zgodne; zasięg i sigma czasu każdego ramienia są związane dokładnie przez c; wyemitowana wspólna konfiguracja jest potwierdzona jako równa własnemu zasięgowi i czasowi całkowania scenariusza, a zasięg ramienia radiowego jest potwierdzony jako równy zasięgowi ramienia optycznego; C/N0 ramienia radiowego jest co do bitu takie samo jak w bloku dostępności, z jednego bilansu łącza, a nie ponowne wyprowadzenie; własność LIKE-FOR-LIKE (porównanie jednorodne) jest MEASURED, a nie zakładana -- czterokrotne zwiększenie wspólnego czasu akumulacji zmniejsza o połowę ramię optyczne do { "1e-12" } i ramię radiowe do { "1e-7" } i pozostawia stosunek niezmieniony do { "3.19e-9" } względnie, czego nie zrobiłoby ramię potajemnie uśredniające po czymś innym; nadpisanie rf_dll_bandwidth_hz, które łamie wspólny czas uśredniania, powoduje, że stosunek jest null z powodem wymieniającym oba czasy, podczas gdy oba ramiona są nadal emitowane; przebieg jednokierunkowy sprawia, że ramię porównawcze jest co do bitu takie samo jak opublikowana wartość nagłówkowa ze współczynnikiem kary dokładnie { "1" }, a przebieg dwukierunkowy odtwarza karę 0.5/sqrt(geometryczna strata na drodze powrotnej), przeliczoną ponownie z geometric_loss_db z samego raportu do { "1e-12" })

seg-7c14f0734623 = sprawdzone względem własnej tożsamości w postaci zamkniętej / analitycznej — wychwytuje błędy przepisania i współczynników, ale nie jest zewnętrzną wyrocznią — Brak zewnętrznej wyroczni: to jest samoopis równania już zwalidowanego względem opublikowanej tabeli kontroli projektu (zob. wiersz bilansu łącza jednokierunkowego). Zapisano go, ponieważ jego brak był zmierzonym defektem -- odtworzenie opublikowanego d1_rate_gain_beamwidth.csv wymagało wstecznego wyznaczenia jednej stałej efektywnej do { "0.0034" } dB ze wszystkich trzydziestu wierszy, a silnik teraz zarówno nazywa tę kombinację, jak i dowodzi testem, że żadna opublikowana tabela nie mogłaby nigdy rozdzielić jej trzech składników

seg-7f3efc1e9fa0 = linkbudget

seg-da19fa334661 = linkbudget::tests (w trzech pasmach, czterech dekadach zasięgu i obu werdyktach domknięcia margines oraz leżąca pod nim strata w wolnej przestrzeni są przeliczane ponownie wyłącznie z raportu z dokładnością lepszą niż { "1e-9" } dB; wymagane G/T złożone z wyrazów równania zgadza się z tą samą wielkością uzyskaną jako G/T minus margines, a ponowne uruchomienie przy nim zeruje margines; trzy bilanse o skrajnie różnych EIRP, stratach i progu, lecz równej stałej łącza, dają identyczne wymaganie, podczas gdy { "1" } dB na stałej przesuwa je dokładnie o { "1" } dB; podział zysku jest nieobecny, o ile nie podano temperatury szumowej, a niedodatnia jest odrzucana; każde pole, które wymienia blok jednostek, jest faktycznie emitowane)

seg-5a05659a1cbb = sprawdzone względem własnej tożsamości w postaci zamkniętej / analitycznej — wychwytuje błędy przepisania i współczynników, ale nie jest zewnętrzną wyrocznią — Dwa różne obliczenia tej samej wielkości w tej samej bazie kodu, a nie jedno powtórzone: bisekcja na krzywej potęgowej IEEE-1139 nic nie wie o typie szumu, podczas gdy postać zamknięta odwraca dominujący typ algebraicznie, więc błędnie sklasyfikowany typ szumu lub zły przedział ujawnia się jako nietrywialnie mała różnica względna. Cztery wartości odtwarzają też opublikowaną tabelę z artykułu z dokładnością do połowy ostatniej drukowanej cyfry -- ale ta tabela sama została zrekonstruowana z tej samej postaci zamkniętej, więc jest to kontrola odtwarzalności, a nie zewnętrzna wyrocznia, a składnik układu odniesienia, względem którego jest mierzona, jest przydziałem modelowanym

seg-d9742b5a3a48 = lunar_time_budget::tests i lunar_time_budget_scenario::tests (wszystkie cztery klasy obecne w jednym przebiegu i w kolejności żądanego podzbioru; każdy wiersz zgadza się z własną postacią zamkniętą z dokładnością lepszą niż { "1e-12" } względnie; przeskalowanie błędu układu odniesienia o k skaluje punkt przecięcia o k dla zegara flicker-FM i o k^{ "2" } dla zegara white-FM, sprawdzone przy k={ "2" } i k={ "3" }, co rozdziela te dwie klasy szumu; każdy wiersz odtwarza przecięcie dla pojedynczego zegara, które bilans już zgłosił; każdy wiersz odzyskuje jeden wspólny składnik układu odniesienia; nieznana nazwa zegara jest odrzucana)

seg-75715af43b8b = sprawdzone względem własnej tożsamości w postaci zamkniętej / analitycznej — wychwytuje błędy przepisania i współczynników, ale nie jest zewnętrzną wyrocznią — Zawieranie zbiorów: stosunek zakłócenia do sygnału wchodzi jako jednolite przesunięcie w decybelach, więc zbiór przechwycony przy wyższej mocy nadawczej zawiera zbiór przy niższej, a ułamek może tylko rosnąć -- własność, której wzór Airy'ego NIE daje w szerokości wiązki ani wysokości, gdzie obszar przechwycony rozpada się na pierścienie, a ułamek jest rzeczywiście niemonotoniczny. Żadna opublikowana tabela nie podaje ułamka przechwyconego dysku dla księżycowego nadajnika orbitalnego w funkcji wysokości i szerokości wiązki, więc nie ma niczego zewnętrznego, względem czego można by sprawdzić te komórki; wzór leżący pod spodem jest osobno sprawdzony względem opublikowanych wartości Bessela i ma własny wiersz

seg-024dfb3684f1 = antenna

seg-7e64cec1882e = antenna::tests i attack_surface::tests (siatka jest kompletna, a każdy przechwycony ułamek leży w [{ "0,1" }]; przechwycony ułamek jest niemalejący względem mocy nadawczej w każdym węźle; NIE jest monotoniczny względem szerokości wiązki ani wysokości, co jest przypięte własnym testem, aby przegląd nie mógł być później wygładzony; węzeł bazowy odtwarza istniejący przechwycony ułamek co do bitu; ocena wyłącznie na limbie jest co do bitu identyczna z ostatnim punktem pełnego przeglądu; zlokalizowane przecięcie leży na progu z dokładnością do { "1e-9" } dB i jest obustronnie otoczone)

seg-eebb00692020 = sprawdzone względem własnej tożsamości w postaci zamkniętej / analitycznej — wychwytuje błędy przepisania i współczynników, ale nie jest zewnętrzną wyrocznią — Wyłącznie samospójność: opublikowana suma jest sprawdzana względem pierwiastka z sumy kwadratów wyrazów w tym samym pliku, a wyemitowana krzywa odtwarza opublikowany p3_time_budget_curve.csv we wszystkich { "57" } punktach. Obie kontrole dzielą definicje wyrazów tego silnika, więc żadna nie jest niezależna. Składnik zegarowy opiera się na opublikowanych specyfikacjach zegarów, ale WIELKOŚCI poziomów łącza, układu odniesienia, relatywistycznego i efemerydalnego są udokumentowanymi przydziałami budżetu bez zewnętrznej wyroczni

seg-d804d9874191 = lunar_time_budget_scenario::tests (wszystkie { "57" } czasów uśredniania x { "8" } wyrazów obecne, indeks siatki biegnie od { "0" } do { "56" } włącznie i niesie po { "8" } wierszy; wiersz <c1/> jest równy pierwiastkowi z sumy kwadratów siedmiu wyrazów obok niego przy każdym tau; tabela podąża za żądaną siatką, a nie za zakodowaną na stałe; jej emisja pozostawia JSON raportu identyczny co do bajtu)

seg-af88df24ce81 = sprawdzone względem własnej tożsamości w postaci zamkniętej / analitycznej — wychwytuje błędy przepisania i współczynników, ale nie jest zewnętrzną wyrocznią — Wyłącznie spójność wewnętrzna: czas do progu wyznaczony bisekcją jest sprawdzany względem postaci zamkniętej odwrotności dominującego typu szumu zegara, a składnik swobodnie biegnącego zegara względem własnego składnika zegarowego budżetu. Klasy zegarów opierają się na opublikowanych specyfikacjach jednodobowych (ich własne wiersze); tempo LTC nie jest tu wyprowadzane ponownie i zachowuje własny wiersz VALIDATED (Księżycowy czas współrzędnych); residuum sterowania jest ILLUSTRATIVE, residuum realizacji jest przydziałem budżetu i nie uwzględniono modelu termicznego. Cel na poziomie nanosekund opisany w materiałach ICG WG-B Lunar PNT z czerwca { "2024" } jest przytoczony jako stwierdzenie źródła, a nie przyjęty jako twierdzenie; nic tutaj nie jest stwierdzeniem o jakimkolwiek rzeczywistym zegarze stacji

seg-61e51873ef4b = lunar_time_lab (nad clock_specs, lunar_time_budget, lunar_time)

seg-73a747390b44 = lunar_time_lab::tests (free_run_clock_term_is_the_budget_clock_term: przy wyłączonym sterowaniu składnik zegarowy jest co do bitu równy składnikowi zegarowemu budżetu dla wszystkich czterech klas; bisection_matches_the_closed_form w granicach { "1e-9" } względnie dla obu klas szumu; threshold_below_the_floor_is_flagged; steering_holds_and_resets; height_term_is_opt_in_and_linear; device_card_reproduces_a_named_class; bad_inputs_are_refused); tests/lunar_station_time_lab.rs (the_block_is_additive: domyślny dokument, tabela i podsumowanie są niezmienione, a blok dodaje tylko własny obiekt i jednostki; time_to_threshold_matches_the_closed_form_through_the_scenario; clocks_are_ordered_over_the_span_where_the_model_orders_them: optical < PHM < RAFS < miniRAFS od { "1" } s do { "7e5" } s, przy czym krzywe PHM i RAFS przecinają się między { "7e5" } a { "8e5" } s, co jest przypięte jako ujawniona własność modeli zegarów o pojedynczym typie szumu; every_time_lab_field_has_a_unit; unknown_time_lab_fields_and_clocks_are_refused)

seg-5b1e2e05b9c8 = sprawdzone względem odrębnej implementacji w tej samej bazie kodu — niezależnej od testowanej jednostki, ale nie jest autorytatywna zewnętrznie — Plane-wave delta_dor (ta sama baza kodu) w granicy dalekiego pola; pochodne cząstkowe różnicami skończonymi. { "0.30" } porównanie zewnętrzne, ustalenie (pozostaje MODELLED): względem ANISE { "0.10" } zbieżnych czasów światła przez DE440 ({ "75" } opóźnień w dniu 2024-01-01 na trzech liniach bazowych DSN, wygenerowanych przez xval/anise-lunar-od bez kodu Kshana), żadne opóźnienie nie mieści się w tolerancji { "1" } ps. Największa rozbieżność to { "24" } µs, pochodząca z analitycznego środka Księżyca (około { "200" } km od DE440), pojedynczej chwilowej geometrii bez iteracji czasu światła ({ "3.6" } µs) i pominiętego ruchu bieguna; pochodne cząstkowe radiolatarni różnią się do { "2.9e-3" } względnie wobec { "1e-6" }. Twierdzenie z dokumentacji modułu, że przybliżenia układu odniesienia są poniżej wierności modelu, nie zachodzi na tym poziomie. { "0.30" } runda { "2" }: ścieżka jądrowa (lunar_vlbi::KernelGeometry) jest sprawdzona względem czasów światła NAIF SPICE we własnym wierszu, Księżycowe geodezyjne VLBI, ścieżka jądrowa; porównanie tej ścieżki z ANISE (75/75 w granicach { "1" } ps, najgorszy przypadek { "0.12" } ps, tests/lunar_vlbi_anise_oracle.rs::kernel_delay_matches_the_anise_light_time_difference) jest wyłącznie krzyżową kontrolą ewaluacji jądra, ponieważ rozwiązanie czasu światła w tym zestawie jest własnością tego projektu. Ten wiersz (domyślna ścieżka analityczna) pozostaje MODELLED z powyższym ustaleniem

seg-71c4fb3e4d08 = lunar_vlbi::tests (granica dalekiego pola zgadza się z delta_dor; poprawka bliskiego pola; pochodne cząstkowe różnicami skończonymi); tests/lunar_vlbi_anise_oracle.rs::near_field_delay_disagrees_with_the_anise_light_time_difference

seg-ed40da9bdfae = sprawdzone względem własnej tożsamości w postaci zamkniętej / analitycznej — wychwytuje błędy przepisania i współczynników, ale nie jest zewnętrzną wyrocznią — Tożsamości w postaci zamkniętej i spójność wewnętrzna; NIE twierdzi się, że istnieje zewnętrzna wyrocznia. Półkąt limbu jest sprawdzany względem asin(R_earth/r_orbit), a geometria względem niego; strata w wolnej przestrzeni, jądro DOP i propagacja SGP4, które to składa, są każde zewnętrznie sprawdzone we własnych wierszach, a ten wiersz nie pożycza ich statusu. DLACZEGO MODELLED, a to dotyczy wzorca nadawczego: zysk w funkcji kąta jest jednolicie oświetloną apertą kołową, wzorem Airy'ego, podczas gdy prawdziwa antena GPS L1 jest dwunastoelementową anteną helikalną z ukształtowanym płatem głównym o maksimum poza osią, wyrównującym moc na tarczy Ziemi, oraz listkami bocznymi, które nie są wzorem Airy'ego. Opublikowane zmierzone wzorce istnieją i nie są tu dołączone, więc niosą kolejności i rzędy wielkości, a dB pojedynczego satelity nie. PIERWSZA IMPLEMENTACJA TEGO WIERSZA BYŁA BŁĘDNA W SPOSÓB WART ZAPISANIA: wyrażenie Airy'ego jest ważne tylko w półsferze przedniej, jego argument zmienia się jak sin(theta), a przy theta bliskim { "180" } deg zawija się i zwraca PEŁNY ZYSK W OSI za aperturą - więc dwa najsilniejsze łącza w pierwszym raporcie były satelitami skierowanymi antenami od Księżyca i tylko one przekroczyły próg. Za apertą model stosuje teraz płaski próg listka tylnego, podany jako ograniczenie, a nie zmyślony kształt wzorca. Celowo nieobecne, każde sprawiające, że budżet jest OPTYMISTYCZNY: brak straty jonosferycznej i troposferycznej na promieniach ocierających się o limb, brak polaryzacji, strat na ustawienie i implementację oraz kulista Ziemia bez rozszerzenia refrakcyjnego. Położenie Księżyca jest WEJŚCIEM, a nie wyszukaniem w efemerydach, ponieważ badaną wielkością jest łącze i geometria wiązki. Podniesienie tego wiersza do poziomu sprawdzonego wymaga zmierzonego wzorca nadawczego i punktów normalnych LuGRE, względem których można sprawdzać; żadne z nich nie ma w repozytorium i żadne nie jest tu wymyślone. { "0.30" } runda { "2" }, ustalenie (pozostaje MODELLED): ścieżka łącza ze zmierzonymi wejściami (rzeczywiste położenia SP3, moc nadawcza na blok, stabelaryzowane wzorce nadawcze i odbiorcze, histereza akwizycji i śledzenia) została sprawdzona względem Montenbruck et al. { "2023" } Tabela { "3" } dla GENESIS przy { "6000" } km (wstępnie zarejestrowane 5b414f0a): średnie dla anteny zenitalnej zgadzają się w { "5" } z { "6" } przypadków w granicach jednego dB od czułości z artykułu; średnie dla anteny nadirowej są o { "1.0" } do { "2.4" } satelity wyższe niż wydrukowane, prawdopodobnie dlatego, że artykuł użył zależnych od azymutu wzorców listków bocznych GPS, które nie są opublikowane. Wartości dla odległości księżycowej w tym wierszu nadal używają zastępnika Airy'ego. { "0.30" }+ D7, ustalenie (pozostaje MODELLED): przeformułowana wielkość, RÓŻNICA C/N0 między satelitami Block IIR/IIR-M śledzonymi w jednej epoce, przewidywana za pomocą zmierzonych wzorców L1 NAVCEN dla poszczególnych SVN (dwuwymiarowych, w układzie sterowania odchyleniem) względem C/N0 z lotu LuGRE (wstępnie zarejestrowane 768cb62b: { "99" } % widocznych, RMS par <= { "3.0" } dB, mediana <= { "2.0" } dB, co najmniej { "50" } rekordów i { "30" } par) ma zbyt mało danych: { "26" } kwalifikujących się epok przelotu i orbity księżycowej zawiera { "15" } śledzonych rekordów IIR/IIR-M (w większości śledzone są IIF i III) oraz jedną parę. Wszystkie { "15" } są przewidywane jako widoczne, a residuum jedynej pary wynosi -0.06 dB; niczego nie twierdzi się

seg-1755ed282a7d = earth_gnss_lunar::tests ({ "11" } testów biblioteki: półkąt limbu Ziemi względem postaci zamkniętej asin(R/r) z dodatkowym potwierdzeniem, że KAŻDE nieprzesłonięte łącze leży poza tym stożkiem, aby test przesłonięcia i kąt limbu nie mogły się rozchodzić; predykat przesłonięcia sprawdzony po stronie bliskiej, po stronie dalekiej oraz w przypadku, gdy ciało leży ZA nadajnikiem; strata na drodze ograniczona do wiarygodnego pasma zasięgu księżycowego na każdym łączu; zbiór śledzalny wykazany jako podzbiór zbioru widocznego geometrycznie i rozłączny ze zbiorem przesłoniętym; monotoniczność w obu kierunkach - większy zysk odbiorczy nigdy nie zmniejsza liczby, bardziej rygorystyczny próg nigdy jej nie zwiększa; żadnemu łączu nie przypisano więcej niż zysku w osi; odbiornik wewnątrz Ziemi odrzucony; przegląd potwierdzony jako faktycznie ZMIENNY w funkcji epoki; oraz dostępność sygnału i dostępność rozwiązania potwierdzone jako różne, poprawnie uporządkowane i spójne z wierszami dla poszczególnych epok); tests/earth_gnss_measured_montenbruck_oracle.rs::finding_genesis_nadir_counts_exceed_the_paper (przypięte); tests/lugre_relative_cn0_visibility.rs::too_few_iir_records_at_lunar_distance_for_the_relative_cn0_bar (przypięte ustalenie)

seg-5242a1ecb1f9 = sprawdzone względem odrębnej implementacji w tej samej bazie kodu — niezależnej od testowanej jednostki, ale nie jest autorytatywna zewnętrznie — Niezależny program scipy/numpy całkuje te same równania wariacyjne (próg O1). Nic nie jest porównywane z pomiarem orbity księżycowej. Wyrocznia sprawdza numerykę podanych wzorów, a nie fizykę, więc wiersz pozostaje MODELLED. Ograniczony model trzech ciał: bez Słońca, bez harmonik księżycowych, oś obrotu Ziemi wzdłuż normalnej do orbity, wejścia odbiornika i stacji ILLUSTRATIVE.

seg-e9a23134de45 = lunar_infra::{ "{" }orbit, gnss, od{ "}" }

seg-13dceb4f0d7b = tests/lunar_infra_od_consistency.rs (próg O1: macierz przejścia stanu łańcuchowo przez trzy dni i przez jeden okres jest równa scipy DOP853 z dokładnością względną { "1e-6" }; próg C1: średnie q i ułamek w 95 %; próg C2: próbka względem śladu formalnego każdego estymatora; próg C3, NOT MET i przypięty: przy { "3e-10" } m/s2 niemodelowanego przyspieszenia przekroczenie w 95 % wynosi { "0.0525" }, a nie co najmniej { "0.5" } - oszacowanie pokładowe jest znane tylko z dokładnością do setek metrów, więc około dziesięciu metrów przemieszczenia ukrywa się w jego kowariancji); lunar_infra::orbit::tests, lunar_infra::gnss::tests, lunar_infra::od::tests, lunar_infra::la::tests

seg-a5f9d7981f42 = sprawdzone względem odrębnej implementacji w tej samej bazie kodu — niezależnej od testowanej jednostki, ale nie jest autorytatywna zewnętrznie — Niezależne rozwiązanie numpy tych samych równań normalnych z wyeksportowanych wierszy (Q3) oraz wyczerpujące wyliczenie liczb całkowitych (Q4). Nie porównuje się z żadnym pomiarem fazy nośnej GNSS ani księżycowej. MODELLED.

seg-2d4d23841d56 = lunar_infra::phase; lambda

seg-0b34672f668b = tests/lunar_infra_carrier_phase.rs (próg Q1: sukces Monte Carlo co najmniej granica bootstrapowa minus trzy błędy standardowe; Q2: brak spadku z długością łuku poza trzy błędy standardowe; Q4: LAMBDA równa się wyczerpującemu wyliczeniu dla { "200" } losowań o wymiarze do pięciu; Q3: projekt zmiennoprzecinkowy jest równy niezależnemu rozwiązaniu numpy z dokładnością do { "1e-9" } dla kowariancji niejednoznaczności i położenia, a wskaźnik bootstrapowy jest NOT MET przy { "1e-9" }, przypięty: różni się o względne { "1.7e-6" }, ponieważ normalna dystrybuanta LAMBDA jest przybliżeniem Abramowitza i Steguna)

seg-ee535014d898 = sprawdzone względem odrębnej implementacji w tej samej bazie kodu — niezależnej od testowanej jednostki, ale nie jest autorytatywna zewnętrznie — Niezależna różnica skończona numpy modelu prostego (F2). Nic nie jest porównywane z rzeczywistymi rozwiązaniami układu księżycowego. Czynnik jest warunkowy względem założonej znanej orbity i sigmy zasięgu { "1" } m. MODELLED.

seg-0abe3b27addf = lunar_infra::frame; lunar_datum; lunar_identifiability; lunar_llr_geometry

seg-30c57d85abc1 = tests/lunar_infra_studies_3_5.rs (próg F1: ślad CRLB nie rośnie, a najmniejsza wartość własna nie maleje wraz z łączami orbitera, w przykładzie i w { "20" } losowych zbiorach z ziarnem; próg F2: pochodne zasięgu są równe niezależnej różnicy skończonej numpy longdouble modelu prostego Rodriguesa na { "50" } geometriach; próg F3: najmniejsza wartość własna rośnie co najmniej 2.0x, znaleziono około 111x)

seg-8d70ea5318fa = sprawdzone względem odrębnej implementacji w tej samej bazie kodu — niezależnej od testowanej jednostki, ale nie jest autorytatywna zewnętrznie — Niezależny układ numpy z eliminacją niewiadomych położenia za pomocą jawnych dopełnień Schura (T3). Nie porównuje się z danymi z GRASP, Genesis ani z innych misji. MODELLED.

seg-0e7813b34509 = lunar_infra::tie; fim::crlb_srif

seg-58f77b27cde3 = tests/lunar_infra_studies_3_5.rs (próg T1: sigmy translacji nie maleją, gdy lokalne wiązanie się rozluźnia; T2: przy sigmach technik przeskalowanych o { "1e-6" } sigma translacji każdej pary mieści się w { "1" } % od sqrt({ "2" }) razy sigma lokalnego wiązania, znalezione w granicach { "3e-7" }; T3: macierz informacyjna jest równa niezależnemu złożeniu numpy z dokładnością do { "1e-9" }). Pierwszy przebieg T2 z odwracaniem równań normalnych nie spełnił progu ({ "1.3" } % przy wiązaniu { "0.1" } m, wartości poniżej progu dolnego przy { "1" } m); przyczyna była numeryczna, a kowariancję przeniesiono na drogę pierwiastka kwadratowego, zanim próg został ponownie oceniony.

seg-6c1a6dc96a6a = sprawdzone względem odrębnej implementacji w tej samej bazie kodu — niezależnej od testowanej jednostki, ale nie jest autorytatywna zewnętrznie — Niezależne złożenie numpy różnicami skończonymi (G2) i ewaluacja w postaci zamkniętej (G4). Czułość k2 rodziny orbitera jest wartością z górnego krańca (stan orbity pochłania tu tylko stałą i trend). Nie porównuje się z żadnym pomiarem pływu ani libracji Księżyca; k2 jest przytoczone za Lemoine et al. { "2014" } jako nominalne. MODELLED.

seg-8e55bf5a6a8f = lunar_infra::geodesy; lunar_od::degree2_tide_accel; lunar_time

seg-4b42d4f76a35 = tests/lunar_infra_studies_3_5.rs (próg G1: pochodne analityczne są równe różnicy skończonej centralnej każdego modelu prostego z dokładnością do { "1e-8" }; G2: informacja 5x5 jest równa niezależnemu złożeniu numpy z dokładnością do { "1e-6" }; G4: amplituda pływu zegara oraz jej czułości na k2 i h2 są równe niezależnej ewaluacji z dokładnością do { "1e-9" }; próg G3 NOT MET w połowie dotyczącej śladu, przypięty: dodanie rodziny nigdy nie obniża najmniejszej wartości własnej ({ "28" } z { "28" }), ale ślad pseudoodwrotności wzrósł w { "12" } z { "28" } dodań, ponieważ dodana rodzina podniosła rząd)

seg-3ead905e6a5c = sprawdzone względem odrębnej implementacji w tej samej bazie kodu — niezależnej od testowanej jednostki, ale nie jest autorytatywna zewnętrznie — Arytmetyka DOP to jądro crate::orbit::dop, osobno zewnętrznie sprawdzone względem gnss_lib_py w tests/dop_reference.rs; ten wiersz nie pożycza ponownie statusu tamtego wiersza. Horyzont widoczności radiolatarni to postać zamknięta L01, a sigma = DOP x sigma_URE jest standardową zależnością GNSS (Kaplan i Hegarty, Understanding GPS/GNSS, sekcja { "7" }). W obrębie tego wiersza sama augmentacja jest sprawdzana względem niezależnej ścieżki DOP w repozytorium i przypięta do zatwierdzonego wzorca złotego. DLACZEGO MODELLED: projekt konstelacji, rozmieszczenie radiolatarni, wysokości anten i wszystkie trzy wielkości budżetu błędów są wejściami ilustracyjnymi, a nie wdrożonym pomiarem terenowym ani zmierzonym łączem, więc podawane metry są własnością wybranego scenariusza, a nie jakiejkolwiek wdrożonej usługi. UWAGA O POCHODZENIU: ta możliwość była reklamowana w README i sprawdzana dwoma testami walidacyjnymi, a jednak nie miała ŻADNEGO wiersza macierzy ani rodzaju scenariusza, więc nie dało się do niej dotrzeć z przebiegu w ogóle. Była deklarowana w prozie, nieobecna w rejestrze i nieosiągalna w silniku jednocześnie. Wiersz i rodzaj dodano razem. { "0.30" } runda { "2" } (wstępnie zarejestrowane db0eb9ec), zablokowane (pozostaje MODELLED): widoczność ANISE { "0.10.6" } i numpy DOP na geometrii wiersza zgadzają się (zbiory widoczne dokładnie, w tym { "72" } przypadków blisko horyzontu i { "48" } blisko maski; DOP w granicach { "7.2e-13" }), ale podawane metry to DOP razy ilustracyjny błąd dalmierzenia { "1.158" } m (pierwiastek z sumy kwadratów) bez wyroczni; zawężenie zakresu, które by je wykluczyło, czeka na decyzję właściciela

seg-2e097e952eb5 = lunar_beacon::tests (widoczność horyzontu względem postaci zamkniętej L01; DOP z augmentacją radiolatarnią względem samego DOP; pierwiastek z sumy kwadratów budżetu błędów; zależność DOP-metry); tests/validate_p2_beacon_before_after_table.rs (cała tabela przed/po przypięta do zatwierdzonego wzorca złotego z dokładnością względną { "1e-9" }); tests/validate_p2_beacon_before_after_independent_dop.rs (ta sama geometria przez NIEZALEŻNĄ ścieżkę DOP, więc augmentacja nie jest sprawdzana względem jądra, które ją wytworzyło); tests/validate_lunar_beacon_anise_visibility_dop.rs::beacon_visibility_and_augmented_dop_match_anise_and_numpy

seg-f8ac8be96a63 = cmpl_horizontal ogranicza poziomy błąd położenia k-sigma wnoszony przez ślepą klasę trybu wspólnego, tworząc blind_position_covariance = S<em>Cov</em>S^T i rzutując ją na ENU; integrity_envelope zgłasza hpl_total = hpl_araim + cmpl. Rozróżnienie, któremu ta para służy: test RESZTKOWY RAIM/ARAIM jest dowodliwie ślepy na błędy w range(G), ale POZIOM OCHRONY ARAIM nie jest - jego składnik bezawaryjny ogranicza je już do poziomu URA dostawcy plus nominalnego obciążenia. CMPL jest zatem tylko NADWYŻKĄ między dostawcami, której URA/ISM pojedynczego dostawcy nie ogranicza z góry, a suma jest zachowawczym ograniczeniem z nierówności trójkąta, a nie RSS, ważnym tylko tam, gdzie ta nadwyżka nie mieści się już w URA.

seg-753412b4c8f3 = sprawdzone względem własnej tożsamości w postaci zamkniętej / analitycznej — wychwytuje błędy przepisania i współczynników, ale nie jest zewnętrzną wyrocznią — Analityczna algebra rzutników sprawdzona względem samej siebie: kowariancja ograniczona do range(G) musi dawać dodatni CMPL, kowariancja ograniczona do przestrzeni parzystości musi dawać w przybliżeniu zero, a obwiednia musi sumować dwa wkłady ortogonalne w przestrzeni pomiarowej. Kowariancja trybu wspólnego, geometria konstelacji i k są reprezentatywnymi wejściami modelowanymi, NIE certyfikowanym budżetem, i nie twierdzi się, że ograniczenie z nierówności trójkąta jest ścisłe. UWAGA O POCHODZENIU: cmpl_horizontal, blind_position_covariance i integrity_envelope są publiczne i dostarczane, a ich testy jednostkowe były już przytaczane przez wiersz o ślepocie trybu wspólnego, ale samo TWIERDZENIE O OBWIEDNI nie miało wiersza - więc jedno zastrzeżenie, które utrzymuje je w rzetelności, że suma jest ograniczeniem z nierówności trójkąta, a nie RSS, nie było podane nigdzie w rejestrze. Wiersz rejestruje twierdzenie i zastrzeżenie razem.

seg-9e4affc02b0b = lunar_common_mode::tests (common_mode_covariance_gives_positive_cmpl, parity_only_covariance_gives_near_zero_cmpl, envelope_sums_the_two_classes, state_map_matches_split)

seg-a4d8fdc530e4 = sprawdzone względem własnej tożsamości w postaci zamkniętej / analitycznej — wychwytuje błędy przepisania i współczynników, ale nie jest zewnętrzną wyrocznią — Analityczna struktura defektu datum — nieobserwowalny tryb bezwzględnego układu odniesienia leży w przestrzeni zerowej informacji Fishera (postać zamknięta), próg rzędu zgadza się z opublikowanym uzasadnieniem projektu z 3 stacjami, a estymator osiąga wynikające z tego CRLB w Monte Carlo. Sama geometria księżycowa jest reprezentatywną siecią (nie lotną efemerydą), więc wiersz pozostaje MODELLED; leżący pod spodem silnik FIM/CRLB jest osobno sprawdzany względem postaci zamkniętych Kaya ({ "1993" }). { "0.30" } runda { "2" } (wstępnie zarejestrowane fab02df9), zablokowane (pozostaje MODELLED): NumPy/SciPy przeliczają rząd i defekt przy podanym progu { "1e-9" }, udział osi stacji w przestrzeni zerowej (w granicach { "8.4e-10" }) oraz CRLB stacji (w granicach { "1.2e-10" }) na { "17" } zatwierdzonych konfiguracjach wygenerowanych przez Kshana (P2). Nie awansowano: twierdzenie, że estymator osiąga granicę (wydajność Monte Carlo około { "0.98" }), nie ma wyroczni, a zawężenie zakresu, które pozostawiłoby je jako MODELLED, czeka na decyzję właściciela

seg-4f3b4fe41736 = lunar_combination (lunar_observability) + fim

seg-e927515cc210 = lunar_combination::tests (niedobór rzędu bez linii bazowych z Ziemią; trzy linie bazowe przywracają pełny rząd — próg 3 stacji pochodzi z rzędu informacji, a nie z błędu rozwiązania; CRLB stacji osiągane przez estymator z wydajnością { "0.98" }; CRLB zacieśnia się monotonicznie wraz z liniami bazowymi); tests/lunar_observability_numpy_oracle.rs::lunar_observability_matches_numpy_on_the_committed_jacobians

seg-5fda3995c3fb = podzastrzeżenie jest sprawdzone zewnętrznie, ale cała możliwość składa się z elementów modelowanych, więc możliwość pozostaje modelowana — Wzorzec: wartości, które LSIS V1.0 drukuje do walidacji (Tabele C-1 do C-5, D-1 do D-6, E-1 do E-6) oraz jego elektroniczne pliki Aneksu { "3" }, przy kryterium zerowej liczby niezgodności ustalonym przed porównaniem. Kryterium zostaje chybione o jedną drukowaną komórkę, która jest wewnętrznie niespójna z własnym plikiem Aneksu { "3" } normy, więc wiersz pozostaje MODELLED; przygotowano szkic noty o errata. Te same chipy są też równe chipom LANS-AFS-SIM (wiersz „Renderowanie pasma podstawowego LunaNet AFS względem niezależnego generatora, przy danym stanie jego kanału”)

seg-84ece56ff3e9 = lunar_afs::codes, lunar_afs::lsis, lunar_afs::params (indeksy IS-GPS-800J)

seg-d111b6550515 = lunar_afs::codes::tests (rejestry o maksymalnej długości, równowaga Legendre'a, rundka opóźnienia G2, złożenie poziomów); tests/lunar_afs_codes_lsis_reference.rs::afs_codes_finding_one_misprinted_table_cell (bez pamięci podręcznej LSIS: cztery przytoczone liczby przypinają ustalenie; z nią: { "2 937 232" } chipów i bitów względem plików Aneksu { "3" } LSIS, drukowane pierwsze/ostatnie { "24" } chipy, Tabele Legendre'a D-1 i E-1 oraz inicjalizacje G2 dają dokładnie jedną różniącą się pozycję, komórkę „ostatnie { "24" } chipy” Tabeli E-5 dla PRN { "147" }, która powiela komórkę PRN { "151" }, podczas gdy plik Aneksu { "3" } zgadza się z generatorem); ścisły wstępnie zarejestrowany test afs_codes_match_lsis_v1_tables_and_annex3_bit_exact jest ignorowany z tą luką

seg-f30130dca525 = podzastrzeżenie jest sprawdzone zewnętrznie, ale cała możliwość składa się z elementów modelowanych, więc możliwość pozostaje modelowana — Biblioteka: PocketSDR-AFS (T. Ebinuma na podstawie PocketSDR T. Takasu { "0.13" }, BSD-2-Clause, commit 5b23809f30d68518b7fad7a564fd0fac57cc497d, wersja S-band, kopia z poziomem logowania tylko do druku), przy kryteriach ustalonych przed każdym przebiegiem. Trzecie wstępnie zarejestrowane porównanie spełnia w pełni swoje progi dekodowania i śledzenia C1 i C2, ale nie swój warunek strażniczy G0 w brzmieniu zapisanym (dwa przebiegi niezmodyfikowanego odbiornika różnią się w tych samych czterech rekordach akwizycji), a drugie chybiło o { "5" } naruszeń, więc wiersz pozostaje MODELLED. LANS-AFS-SIM i PocketSDR-AFS mają wspólnego autora i liczą się jako jedna niezależna implementacja; kontrole drukowanych wektorów w wierszu kodowania ramek chronią przed wspólnym błędnym odczytaniem

seg-8cd700abad59 = lunar_afs::waveform (nagranie i etykiety prawdy), xval/lunar-afs/run_pocketsdr.sh

seg-22dbd05adf9c = tests/lunar_afs_decodability_pocketsdr_v3_oracle.rs::third_run_finding_c1_c2_hold_g0_is_receiver_nondeterminism (trzecia wstępna rejestracja: { "2" } węzły, { "4" } kanały śledzone, najgorszy błąd Dopplera { "0.57" } Hz, najgorszy błąd przesunięcia kodu { "0.008" } chip, wszystkie { "6" } ramek zdekodowanych z właściwym TOI przez przejście { "99" } -> { "0" } i zgodną podramką { "2" }; G0 niespełnione w brzmieniu zapisanym, wynika to z własnej zmienności odbiornika między przebiegami w jego rekordach akwizycji); tests/lunar_afs_decodability_pocketsdr_4bit_oracle.rs::decodability_finding_five_violations (druga: { "5" } naruszeń); tests/lunar_afs_decodability_pocketsdr_oracle.rs::first_run_finding_no_acquisition_outside_the_receivers_4_bit_range (pierwsza: nieważna); ścisłe testy z tych trzech plików są ignorowane z ich lukami

seg-2f05d26e8be6 = sprawdzone względem własnej tożsamości w postaci zamkniętej / analitycznej — wychwytuje błędy przepisania i współczynników, ale nie jest zewnętrzną wyrocznią — gps-sdr-sim (MIT, commit 28ca29a6, uruchamiany jako osobny program przez zatwierdzony zestaw testowy), wstępnie zarejestrowane f88f2969 z progiem zgodności co do bitu dla (A) chipów C/A, (B) każdego obliczonego pola LNAV, (C) każdego bitu parzystości. USTALENIE: (A) { "0" } z { "32 736" } chipów się różni, (C) parzystość { "0" } z { "1 920" } słów się różni, (B) { "230" } z { "1 152" } obliczonych pól różni się o jedną jednostkę: eph2sbf w gps-sdr-sim obcina w kierunku zera rzutowaniami C tam, gdzie nadawana liczba całkowita wymaga zaokrąglenia (każda różniąca się wartość leży w granicach { "0.01" } jednostki od zaokrąglonej liczby całkowitej Kshana). Pozostaje MODELLED: zarejestrowany próg był koniunkcją

seg-9b511cb035c0 = gps_lnav, sdr

seg-83c50906fe74 = tests/gps_l1ca_gpssdrsim_cross_generator.rs::gps_sdr_sim_truncates_where_the_broadcast_integer_needs_rounding (przypięte ustalenie); tests/gps_l1ca_gpssdrsim_cross_generator.rs::ca_codes_lnav_fields_and_parity_match_gps_sdr_sim_bit_exactly (ścisły, ignorowany z tą luką); gps_lnav::tests

seg-d61a6fd7896c = podzastrzeżenie jest sprawdzone zewnętrznie, ale cała możliwość składa się z elementów modelowanych, więc możliwość pozostaje modelowana — próbki I/Q gps-sdr-sim (MIT, commit 28ca29a6) i jego własny stan kanału, wstępnie zarejestrowane 7777da53: (B1) każdy symulowany PRN pozyskany, (B2) żaden inny PRN nie pozyskany, (B3) faza kodu w granicach { "0.5" } chip, (B4) Doppler w granicach { "125" } Hz. USTALENIE: B1, B3 i B4 zachodzą w obu oknach (najgorzej { "0.195" } chip, { "72" } Hz), ale B2 zawodzi: wszystkie { "21" } PRN, których gps-sdr-sim nie symulował, również przekraczają próg (statystyka { "151" } do { "206" } wobec { "79.5" }; symulowane PRN { "1 300" } i wyżej). Próg jest ustawiony dla szumu gaussowskiego o zmierzonej mocy próbek; gps-sdr-sim nie dodaje szumu, więc komórki nieobecnego PRN zawierają korelację wzajemną pozostałych satelitów. Pozostaje MODELLED: zarejestrowany próg był koniunkcją

seg-7b32ce65d953 = iq::acq (acquire, AcqConfig); iq::io (decode_samples); iq::scene (GpsL1Ca)

seg-538f0f38481a = tests/iq_gpssdrsim_cross_generator.rs::acquisition_threshold_is_crossed_on_gps_sdr_sim_noise_free_samples (przypięte ustalenie); tests/iq_gpssdrsim_cross_generator.rs::acquisition_finds_gps_sdr_sim_satellites_in_its_samples (ścisły, ignorowany z tą luką)

seg-ee030053dc63 = iq::campaign (detect, runner, spec); iq::monitor (stats::gaussian_two_sided_pfa, sqm)

seg-1663be50baf6 = tests/iq_campaign_monitors.rs: m1_power_test_false_alarm_rate_matches_the_closed_form ({ "73" } z { "5900" } bloków wobec { "99" } % przedziału dwumianowego [{ "40" }, { "80" }] dla P_fa { "0.01" }), m2_sqm_false_alarm_fraction_is_within_a_factor_of_2_of_2q_k (delta { "0.0160" }, stosunek { "0.0131" } wobec { "0.01" }), m4_cn0_false_alarms_stay_within_the_poisson_bound_of_arl0 ({ "0" } wobec { "0" }), the_monitors_table_parses_and_validates; m3_every_attenuation_is_detected_within_twice_the_arl1 (ścisły, ignorowany z tą luką); testy iq::campaign::detect; testy iq::monitor::stats (gaussian_two_sided_tail_matches_known_values); tests/iq_campaign.rs (przypięte skróty są niezmienione bez tabeli)

seg-e214fbcbf22e = iq::campaign (detect, report, runner); iq::monitor::spectral (kurtosis_reference)

seg-c7d9da2a1afd = tests/iq_campaign_roc.rs: r2_with_nothing_to_detect_the_roc_sits_at_chance (AUC cn0_drop { "0.500" }, sqm_delta { "0.566" }, power_drop { "0.639" } dla podanych zdarzeń, które niczego nie tłumią); r1_the_cn0_drop_roc_separates_6_db_attenuations (ścisły, ignorowany z tą luką); testy iq::campaign::detect (the_roc_of_separated_and_of_identical_samples, windows_tile_the_time_outside_the_events)

seg-e40884e4fef7 = sprawdzone względem własnej tożsamości w postaci zamkniętej / analitycznej — wychwytuje błędy przepisania i współczynników, ale nie jest zewnętrzną wyrocznią — Syntetyczne odzyskiwanie parametrów na własnych scenach GPS L1 C/A Kshana ze znanym profilem C/N0 narzuconym według wzoru z sekcji { "3.1" }, śledzone i oceniane przez kshana iq campaign, względem progów wstępnie zarejestrowanych w docs/design/LABFIT-FROM-IQ.md (sekcja { "5.1" }, zmieniona 2026-10-12 w b7117bf, sekcja { "13" }). Estymator C/N0 kampanii (M2M4) został ustalony w 5b13e3c2, wypchnięty przed pierwszą oceną progu (zatwierdzony razem z kodem dopasowania, a nie osobno), po jednym ujawnionym diagnostycznym przebiegu śledzenia. USTALENIE dla kampanii progowej z 18 zdarzeniami: (c) PASS; (a') NOT MET, błąd delta_eff -1.097 dB wobec { "0.5" } dB (nadal -0.89 dB w przedziałach przy { "38" } dB-Hz i wyżej); (b') NOT MET, { "0" } z { "50" } kampanii pokrywa prawdę (błąd -1.189 +/- { "0.093" } dB, przedział około { "0.3" } dB); (d) NOT MET, postać zamknięta { "2.20" } dB poniżej bezpośredniego J/S przy utracie, około dopasowanego czasu zatrzymania spadku razy tempo rampy ({ "2.09" } dB); pierwotne klauzule Q w (a) i (b) są NOT MET, ponieważ Q nie jest identyfikowalne. DALSZE KROKI (progi wstępnie zarejestrowane w 1e532f84, docs/design/evidence/labfit-followup/RESULTS.md): w kampanii z J/S stopniowym delta_eff jest odzyskiwane w granicach +{ "0.185" } dB (S1 MET: błąd rampy to opóźnienie estymatora); (d) w brzmieniu zapisanym jest na niej spełnione przez model pętli śledzenia ({ "0.45" } dB), ale nie przez empiryczny ({ "6.42" } dB), więc S2 jest NOT MET; w nowej kampanii z rampą (d) z dopasowanymi czasami zatrzymania spadku z dodanym tempem rampy każdego zdarzenia mieści się w { "1" } dB dla obu modeli (R1 MET), a (a') i (d) w brzmieniu zapisanym znów są chybione (-1.25 dB; { "2.32" } i { "9.47" } dB). Sprawdzana jest metoda, a nie jakikolwiek odbiornik: nie może być VALIDATED na danych syntetycznych

seg-f1371f2a4da4 = iq::labfit (campaign, cn0, iqfit, iqreport, schema, mod); iq::cli::labfit

seg-27c989c6bdde = tests/iq_labfit_campaign.rs: bar_c_holdout_prediction_intervals_cover_between_80_and_98_percent (pokrycie PI90 { "0.891" } na { "558" } przedziałach, { "0.900" } na { "10" } zdarzeniach czasu do utraty przy każdym modelu blokady), the_report_carries_its_inputs_censoring_validation_and_labels (wejścia, cenzurowanie, skrót [validation] i werdykty, audyt bloku jednostek), the_cluster_bootstrap_reproduces_from_the_campaign_and_seed, a_validation_mode_fit_refuses_to_start_without_its_table; bar_a_prime_delta_eff_is_recovered_and_q_is_stated_not_fitted, bar_d_closed_form_threshold_matches_the_direct_estimate_within_1_db i bar_b_prime_ci_subset (ścisłe, ignorowane z tą luką); bar_b_prime_full_set_of_50_campaigns (ignorowany, uruchamiany przed wydaniem); testy iq::labfit::cn0 (dokładna degeneracja Q-delta, odzyskanie delta przy podanym Q, odwrotność progu w postaci zamkniętej); testy iq::labfit::iqfit (warunki modelu blokady odtwarzają model C/N0 dokładnie); tests/iq_labfit_followup.rs (dalsze kroki zarejestrowane w 1e532f84: s1_delta_eff_on_the_stepped_campaign MET, s2_d_as_written_on_the_stepped_campaign potwierdzający zapisane NOT MET, r1_dwell_corrected_d_on_the_fresh_ramp_campaign MET, w wydaniu)

seg-52d2a721c38a = sprawdzone względem własnej tożsamości w postaci zamkniętej / analitycznej — wychwytuje błędy przepisania i współczynników, ale nie jest zewnętrzną wyrocznią — RTKLIB v2.4.2-p13 (BSD-2-Clause, commit 71db0ffa) decode_word/decode_frame jako osobny program, wstępnie zarejestrowane ca5f0142: R1 parzystość i dekodowanie, R2 zdekodowana wartość równa liczbie całkowitej Kshana razy skala IS-GPS-200 w granicach { "2" }^-52 względnie, R3 w granicach pół kwantu wejścia. USTALENIE: R1 { "960" } z { "960" } słów i { "96" } z { "96" } podramek; R3 każdy parametr, tydzień i czasy odniesienia dokładne; R2 zawodzi dla { "41" } wartości (af1, delta-n, IDOT) o { "1" } do { "4" } jednostek na ostatniej pozycji, ponieważ P2_43 w RTKLIB jest dziesiętne { "1.136868377216160E-13" }, { "2.6e-16" } względnie od { "2" }^-43; podzielenie przez stałą RTKLIB zwraca liczbę całkowitą Kshana w każdym przypadku. Pozostaje MODELLED: zarejestrowany próg R2 był zbyt ciasny dla własnej stałej wyroczni

seg-50acb4bcdd8a = tests/gps_lnav_rtklib_decode_oracle.rs::rtklib_recovers_every_integer_and_differs_only_by_its_decimal_two_to_the_minus_43 (przypięte ustalenie); tests/gps_lnav_rtklib_decode_oracle.rs::kshana_lnav_subframes_decode_in_rtklib_to_the_broadcast_parameters (ścisły, ignorowany z tą luką)

seg-d0d7bf57aa68 = podzastrzeżenie jest sprawdzone zewnętrznie, ale cała możliwość składa się z elementów modelowanych, więc możliwość pozostaje modelowana — RTKLIB v2.4.2-p13 (BSD-2-Clause, commit 71db0ffa) readrnx parsujący dzienny plik nadawczy IGS BRDC00IGS_R_20250610000_01D_MN.rnx oraz decode_word/decode_frame dekodujące słowa Kshana, uruchamiane jako osobny program; wstępnie zarejestrowane d4d9eb9d przed pobraniem pliku, próg dokładnych liczb całkowitych. Mutacja: obcinanie zamiast zaokrąglania daje { "235" } niepowodzeń. Wcześniejsze porównania tego samego kodera są zapisane jako ustalenia: względem gps-sdr-sim, który obcina ({ "230" } pól), oraz względem skalowanych wartości RTKLIB, których dziesiętna stała { "2" }^-43 chybiła próg jednego ulp ({ "41" } wartości). Weryfikacja po stronie integratora (pozostaje MODELLED): porównanie się zgadza, a mutacja zbioru parzystości także zmienia je na czerwone, ale wstępna rejestracja d4d9eb9d dotarła do gałęzi publicznej o { "20" }:{ "02" }:{ "29" } UTC, dwie sekundy po commicie wyniku 1783f904 ({ "20" }:{ "02" }:{ "27" } UTC), który już zawiera wynik RTKLIB dla tego pliku, więc kolejności „zarejestrowano przed pobraniem pliku” nie da się wykazać; nowa rejestracja wypchnięta przed pobraniem niewidzianego pliku nadawczego by to rozstrzygnęła

seg-90748b60b720 = tests/gps_lnav_rtklib_integer_oracle.rs::kshana_lnav_integers_decode_in_rtklib_from_an_unseen_broadcast_file ({ "32" } satelitów z pliku nadawczego IGS z { "2" } marca { "2025" }: { "960" } z { "960" } słów przechodzi parzystość RTKLIB, { "96" } z { "96" } podramek dekoduje się, { "608" } z { "608" } zdekodowanych nadawanych liczb całkowitych równa się liczbom Kshana, każde wejście w granicach pół kwantu, tydzień i czasy dokładne); gps_lnav::tests

seg-407f33fff57c = sprawdzone względem własnej tożsamości w postaci zamkniętej / analitycznej — wychwytuje błędy przepisania i współczynników, ale nie jest zewnętrzną wyrocznią — GNSS-SDR { "0.0.19" } (GPL-3.0, osobny program, przypięta konfiguracja) na dziewięciu partiach L1 spoza powierzchni i SUROWYM C/N0 odbiornika lotnego (LuGRE Mission Data, Zenodo { "16411687" }, CC BY { "4.0" }), wstępnie zarejestrowane 768cb62b. USTALENIE: czytnik Kshana dekoduje wszystkie { "288" } porównywanych odcinków identycznie jak niezależny konwerter; GNSS-SDR uznaje { "266" } z { "288" } poszukiwań za pozytywne, a Kshana zgadza się we wszystkich { "266" } decyzjach, ale tylko { "250" } jest zlokalizowanych na komórce GNSS-SDR (A2 zawodzi); ramię C/N0 jest puste, żadna surowa epoka lotna nie leży w granicach { "30" } s od jakiejkolwiek partii (najbliższa { "141" } s). Większość pozytywów to artefakty: gołe poziomy w kodzie uzupełnień do dwóch niosą średnią -0.5 na I i Q, linię o zerowej częstotliwości { "32" } dB ponad szumem w przedziale { "1" } kHz, którą oba odbiorniki pozyskują. Dwie partie (OP5, OP12) wykluczono przez pomyłkę: odczyt ich metadanych z pozbawionymi cyframi uznano za sprzeczność z ich nagłówkami; prawdziwą przyczyną było to, że czytnik nie mógł odczytać próbki szerszej niż słowo (od tego czasu naprawiono). Pozostaje MODELLED

seg-c20f6fc678c5 = acquisition, portable_math, realdata::ion_sdr, realdata::lugre

seg-6bf9cba81288 = tests/lugre_acquisition_gnss_sdr_oracle.rs::finding_dc_artefacts_and_no_contemporaneous_flight_cn0 (przypięte ustalenie, bramkowane danymi); tests/lugre_acquisition_gnss_sdr_oracle.rs::acquisition_and_relative_cn0_on_lugre_iq_match_gnss_sdr_and_the_flight_receiver (ścisły, ignorowany z tą luką); acquisition::tests; realdata::ion_sdr::tests; realdata::lugre::tests

seg-90535435d10d = sprawdzone względem własnej tożsamości w postaci zamkniętej / analitycznej — wychwytuje błędy przepisania i współczynników, ale nie jest zewnętrzną wyrocznią — Przewidywany Doppler z końcowych orbit ESA/ESOC i zrekonstruowanej trajektorii NAIF CLPS (xval/lugre-predicted-doppler/predict.py, niezależny od Kshana), wstępnie zarejestrowane 0d1839d2. USTALENIE: wszystkie { "288" } poszukiwań przekracza próg na szumie (statystyki mocy próbek około { "430" } do { "520" } wobec { "346.3" }), więc P1 zachodzi trywialnie i P3 zachodzi ({ "274" } z { "288" } przewidzianych jako widoczne), podczas gdy P2 zawodzi dla { "4033" } z { "4036" } par. Ograniczony pasmowo tor wejściowy podnosi szum każdej komórki około { "1.46" } razy (przypięte: poziom szumu { "292" } wobec białego szumu { "200" } na OP2 PRN { "1" }), czego statystyka mocy próbek nie widzi. Pozostaje MODELLED

seg-709106f38b9d = acquisition, realdata::ion_sdr

seg-cfefde0dbf55 = tests/lugre_acquisition_predicted_doppler_oracle.rs::noise_alone_crosses_the_sample_power_threshold_on_lugre_iq (przypięte ustalenie, bramkowane danymi); tests/lugre_acquisition_predicted_doppler_oracle.rs::acquired_doppler_differences_on_lugre_iq_match_the_orbit_prediction (ścisły, ignorowany z tą luką)

seg-46dbb16e2ba8 = sprawdzone względem własnej tożsamości w postaci zamkniętej / analitycznej — wychwytuje błędy przepisania i współczynników, ale nie jest zewnętrzną wyrocznią — Przewidywany Doppler z końcowych orbit ESA/ESOC i zrekonstruowanej trajektorii NAIF CLPS (xval/lugre-predicted-doppler/predict.py, niezależny od Kshana), wstępnie zarejestrowane a81a9a4e. USTALENIE: P1 i P3 zachodzą ({ "4" } partie, { "12" } z { "12" } akwizycji przewidzianych jako widoczne), ale P2 zawodzi dla { "8" } z { "8" } par. Dwie najsilniejsze pary zgadzają się z przewidywaniem co do wielkości z odwróconym znakiem (OP2 PRN 18/24: +{ "7670.0" } Hz zmierzone, -7693.9 przewidziane; OP17 PRN 11/30: +{ "11155.0" }, -11114.4), więc zarejestrowana kolejność I w dolnym półbajcie jest sprzężeniem partii; sześć detekcji tuż nad progiem nie zgadza się z żadnym znakiem. Rozrzut Dopplera po udoskonaleniu ({ "30" } do { "50" } Hz między dwoma przebiegami) został również niedoszacowany przez rejestrację. Pozostaje MODELLED

seg-b93425830963 = tests/lugre_acquisition_cell_average_doppler_oracle.rs::strong_pairs_match_the_prediction_only_with_the_doppler_sign_reversed (przypięte ustalenie, bramkowane danymi); tests/lugre_acquisition_cell_average_doppler_oracle.rs::cell_average_acquisitions_on_lugre_iq_match_the_orbit_predicted_doppler (ścisły, ignorowany z tą luką)

seg-e10ffc7f4280 = sprawdzone względem własnej tożsamości w postaci zamkniętej / analitycznej — wychwytuje błędy przepisania i współczynników, ale nie jest zewnętrzną wyrocznią — Przewidywany Doppler z końcowych orbit ESA/ESOC i jądra miejsca lądowania NAIF CLPS Firefly (xval/lugre-predicted-doppler/predict_surface.py, niezależny od Kshana), wstępnie zarejestrowane 2108e6ff na partiach nigdy wcześniej nieotwieranych. USTALENIE: niepustość zawodzi; żadna partia nie zawiera dwóch akwizycji. OP40 wykluczony (metadane wskazują brakujący plik); OP38, OP73, OP77_0, OP77_1 niczego nie pozyskują i nie wykazują fałszywego alarmu przy { "1e-7" } (najwyższe statystyki { "325" } do { "356" } wobec { "385.9" }); OP74 i OP76 pozyskują PRN { "31" }, a OP78_0 i OP78_1 PRN { "12" }, każdy osobno, wszystkie przewidziane jako widoczne. Pozostaje MODELLED. Ujawnione odstępstwa: zarejestrowany próg Dopplera { "10" } Hz opiera się na syntetycznym Monte Carlo koherentnego udoskonalenia, a nie na rozrzucie już widzianych partii, o który prosił integrator; OP40 wykluczono przed przebiegiem, ponieważ jego metadane wskazują plik próbek, którego zbiór danych nie zawiera

seg-a6cce9d1c2fc = acquisition, realdata::ion_sdr, realdata::lugre

seg-e953a0bb294b = tests/lugre_surface_acquisition_doppler_oracle.rs::each_surface_acquisition_is_a_single_predicted_visible_satellite (przypięte ustalenie, bramkowane danymi); tests/lugre_surface_acquisition_doppler_oracle.rs::surface_acquisitions_match_the_orbit_predicted_doppler (ścisły, ignorowany z tą luką)

seg-9b89d7ff555a = sprawdzone względem własnej tożsamości w postaci zamkniętej / analitycznej — wychwytuje błędy przepisania i współczynników, ale nie jest zewnętrzną wyrocznią — Różnicowa tożsamość znoszenia błędów + ponowne użycie mechanizmu SBAS PL z DO-229E; rozwiązanie z pojedynczą różnicą + WLS jest dodatkowo sprawdzane krzyżowo względem lsq()/matinv() z RTKLIB (Takasu, BSD-2-Clause, skompilowany C) — niezależny kod solwera, ale ta sama algebra różnic LOS pierwszego rzędu, więc nadal InternalConsistency

seg-b4e5e57515cc = lunar_dpnt::tests (tryb wspólny zegara znosi się dokładnie; residuum rośnie z linią bazową; ponownie używa SBAS PL; liczba satelitów jest respektowana do limitu konstruktora wynoszącego { "24" }, więc większa konstelacja nie może po cichu zwrócić mniejszej); tests/lunar_differential_pnt_reference.rs (residuum pojedynczej różnicy + rozwiązanie położenia WLS względem lsq() z RTKLIB skompilowanego ze źródła C)

seg-4d32db579be8 = sprawdzone względem własnej tożsamości w postaci zamkniętej / analitycznej — wychwytuje błędy przepisania i współczynników, ale nie jest zewnętrzną wyrocznią — eksport księżycowy OEM Kshana ponownie sparsowany przez niezależną bibliotekę zewnętrzną <c1/> (R. J. Anderson): tokeny układu/czasu i stan w poszczególnych epokach zgadzają się z dokładnością zapisu ({ "1" } mm / { "1e-9" } km/s), a eksport z pominiętym TIME_SYSTEM jest odrzucany — strukturalna rundka wymiany; fizyczna semantyka księżycowego układu/czasu jest sprawdzana we własnych wierszach, więc ten pozostaje MODELLED. { "0.30" } porównanie zewnętrzne, ustalenie (pozostaje MODELLED): drugi niezależny czytnik, parser CCSDS OEM Orekit { "12.2" } (Apache-2.0, ścisłe ustawienia domyślne), odrzuca oba pliki księżycowe, ponieważ nie implementuje systemów czasu LTC i TCL (dekoduje OEM EME2000/UTC tego crate'a i dekoduje pliki księżycowe, gdy TIME_SYSTEM zastąpi się przez TDB); oem { "0.4.5" } dekoduje je z dokładnością zapisu tylko przez wycofanie się z nieobsługiwanego systemu czasu. Wymiana tych plików księżycowych z głównymi czytnikami CCSDS nie jest ustalona

seg-6a567344f386 = lunar_interop::tests (OEM niesie księżycowe REF_FRAME/TIME_SYSTEM; metadane czasu przechodzą rundkę; koperta KIF); tests/lunar_interoperability_export_reference.rs (wyemitowany przez kshana księżycowy OEM ponownie sparsowany przez niezależną bibliotekę Pythona <c1/>: tokeny REF_FRAME/TIME_SYSTEM/CENTER + stan w poszczególnych epokach z dokładnością formatu; uszkodzony eksport jest odrzucany); tests/lunar_interop_oem_oracle.rs::recorded_two_reader_outcome_is_for_todays_export

seg-2ceda14c0a73 = sprawdzone względem własnej tożsamości w postaci zamkniętej / analitycznej — wychwytuje błędy przepisania i współczynników, ale nie jest zewnętrzną wyrocznią — Ręcznie wyprowadzone wzory dla poszczególnych metryk: różnorodność odwrotna Simpsona, ważona średnia kompozytowa, ograniczone/nieograniczone czasy trwania osi czasu, drabina poziomów najsłabszego ogniwa

seg-952626fc6feb = resilience::arch, resilience::score, resilience::diversity, resilience::timeline

seg-921e4d47fd96 = resilience::score::tests (monotoniczność, ograniczenia kompozytu, limit poziomu, pochodzenie-modelowane); resilience::diversity::tests (odwrotna Simpsona, tryb wspólny, SPOF)
