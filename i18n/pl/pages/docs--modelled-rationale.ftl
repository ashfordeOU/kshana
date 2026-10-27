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
