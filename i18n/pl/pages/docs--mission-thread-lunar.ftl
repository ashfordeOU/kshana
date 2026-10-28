# docs--mission-thread-lunar: translations (pl)

seg-f942b36a11c4 = Jeszcze nie na GitHub

seg-3b01a756c305 = Co oblicza

seg-b478421b21bb = Źródło: <c1/>

seg-dbd59cc01982 = Segment księżycowy wątku misji klasy Artemis

seg-7b56ed698c30 = Cztery rodzaje scenariuszy, każdy także rodzajem fazy interfejsu <c1/> (<c2/>): niosą budżet błędu nawigacji i czasu przez misję księżycową do bieguna południowego, od spotkania na orbicie księżycowej po lądowanie, pobyt na powierzchni i wznoszenie z powrotem na orbitę. <b>Każda liczba tutaj jest MODELLED</b>: podany model z wejściami ILLUSTRATIVE, a nic z tego nie jest stwierdzeniem o jakiejkolwiek misji, systemie czy miejscu. „Klasa Artemis” nazywa klasę koncepcji misji i nic więcej; nie używa się ani nie twierdzi żadnych danych, produktów ani poparcia jakiejkolwiek agencji i nic tu nie jest z żadną powiązane. Oprogramowanie wyłącznie doradcze, nie jest to certyfikowany sprzęt nawigacyjny. Kshana niczego nie nadaje i nie steruje żadnym sprzętem.

seg-5282ad2c498a = Faza i rodzaj

seg-9b927127e042 = Przykładowy scenariusz

seg-40f3e1b2d58b = Rdzeń

seg-2cfaaa8be402 = nawigacja względna do połączenia, kołowa polarna { "100" } km lub eliptyczna polarna { "100" } km na { "3000" } km

seg-9ee09d63fed3 = budżet rozrzutu lądowania w miejscu przy biegunie południowym

seg-c4568984e75c = <c1/>, <c2/> (wymaga DEM, kopii repozytorium)

seg-a098e14e6a63 = dostępność pozycjonowania i czasu według miejsca i pory roku

seg-8278ae655fcc = <c1/>, <c2/> (wymaga DEM, kopii repozytorium)

seg-249eff5159d0 = wznoszenie na orbitę spotkania i kowariancja przenoszona z powrotem na orbitę

seg-36184e593ade = Każdy rdzeń jest funkcją <c1/>; przebieg samodzielny buduje domyślne wejście (kowariancję inercjalną w układzie środka Księżyca { "100" } m i { "0.1" } m/s, zegar LTC o { "1" } mikrosekundzie) i domyślną epokę 2028-01-01, a przebieg wątku bierze wejście z poprzedniej fazy. To wątek, a nie rdzeń, konwertuje układy odniesienia i skale czasu oraz stosuje zasadę przekazania: opakowanie fazy konwertuje stan wejścia na <c2/> (lub <c3/> dla mapy powierzchni) i zegar LTC przez konwersje wątku, a wiersze konwersji są dodawane do budżetu fazy. Układ lub skala czasu, których wątek nie umie przekonwertować (na przykład ITRF), są odrzucane z komunikatem wątku; rdzeń wywołany bezpośrednio z układem, którego nie może użyć, odrzuca go z podaniem powodu. Faza nigdy nie zeruje kowariancji, a jedynie przekazuje tę, którą kończy.

seg-59f4a1a2684e = Co robi każda faza

seg-e112a34ef118 = Dwa pojazdy, goniący i cel, lecą po tej samej orbicie w modelu sił księżycowych biblioteki (pole grawitacyjne oraz Ziemia i Słońce jako ciała trzecie). Wsadowe oszacowanie Gaussa-Newtona na łuku odzyskuje oba stany początkowe z:

seg-33bb01b1e72a = pozycji bezwzględnej każdego pojazdu z zestawu przekaźników klasy LCNS ILLUSTRATIVE (przekaźniki za Księżycem odrzucone, potrzebne cztery), której część biała to granica śledzenia kodu na pilocie AFS (BPSK({ "5" }), { "5.115" } Mchip/s) przy podanym C/N0 razy kofaktor DOP;

seg-b061f6742a86 = <b>trwałego</b> błędu sygnału w przestrzeni przy każdej pozycji: błędy przekaźników nie uśredniają się na łuku trwającym godziny, więc jest on przenoszony jako stałe odchylenia pozycji, jedno wspólne dla obu pojazdów (<c1/> wariancji, domyślnie { "0.9" }, ILLUSTRATIVE) i jedno niezależne dla każdego pojazdu. Stałe odchylenie nie daje korzyści z uśredniania, co jest odczytem zachowawczym;

seg-437ac74b1400 = odległości międzypojazdowej z tego samego sygnału przy jego własnym C/N0.

seg-3513a55e44e5 = Podaje formalny i Monte Carlo błąd położenia i prędkości względnej w lokalnych osiach celu, odsetek epok z pozycjami na obu pojazdach, średni znormalizowany kwadrat błędu oszacowania (NEES) stanu względnego wobec jego wartości oczekiwanej { "6" }, dryf względny wynikający z pominięcia harmonicznych grawitacji, kontrolę w postaci zamkniętej Hilla (Clohessy'ego-Wiltshire'a) dla przypadku kołowego, modele końcowych czujników względnych z <c1/> wątku (parametry ILLUSTRATIVE) obok wartości wyłącznie z sygnałów oraz kowariancję 6x6 statku goniącego na końcu.

seg-5d3fa3e8486c = <b>Co mówi wynik.</b> Przy samych sygnałach odległość międzypojazdowa ustala położenie względne wzdłuż linii wzroku, ale położenie względne w poprzek niej jest ograniczone niezależnym błędem sygnału w przestrzeni i tym, co dają dynamika; połączenie wymaga czujnika względnego, a wiersze <c1/> pokazują, od jakiej odległości każdy z modeli czujników wątku przewyższa sygnały. Wynik zależy też od tego, że prawda i estymator współdzielą model sił; opcja estymatora <c2/> pokazuje koszt pominięcia harmonicznych, a taki przebieg nie ma być spójny.

seg-66c4eb27641b = Faza leci własną orbitą nominalną (pola <c1/>), więc wektor położenia i prędkości wejścia nie jest używany, a tylko jego kowariancja, układ odniesienia i zegar; mówi o tym zdarzenie w wątku.

seg-751f29ab7a35 = Na każdą oś poziomą pięciostanowy model błędu inercjalnego (pozycja, prędkość, bias akcelerometru, przechył położenia, bias żyroskopu, sterowany siłą właściwą lądowania) z kowariancji wejścia i IMU, a następnie filtr sekwencyjny nad włączonymi wspomaganiami:

seg-c2eae4508a2f = <b>Pozycja AFS</b>: z przekaźników widocznych nad płaską maską, z kofaktorem ENU DOP razy błąd odległości użytkownika. <c1/> używa błędu sygnału w przestrzeni; <c2/> używa reszty łącza korekcji z <c3/>. Przy dokładnie trzech przekaźnikach w zasięgu zegar jest wspomagany, a nie estymowany, i pozycja niesie wtedy <c4/>: tu czas księżycowy wchodzi do pozycji.

seg-39c938fb24e9 = <b>Pozycja względem terenu</b>: <c1/> uruchamia dopasowanie TERCOM/SITAN biblioteki na jego syntetycznej rzeźbie i ziemskiej skali metra (zastępnik, a nie rzeźba okolic bieguna południowego); <c2/> przyjmuje ograniczenie Craméra-Rao dopasowania okna wysokości rzeczywistego DEM LOLA w miejscu, <c3/>, i nie twierdzi żadnej pozycji tam, gdzie rzeźba ogranicza tylko jeden kierunek (problem apertury).

seg-795ef82edc61 = <b>Czas księżycowy</b>: błąd zegara przy pozycji łączy zegar wejścia, jego wzrost od synchronizacji i człon LTC-TT z <c1/>. Przy <c2/> pojazd odmierza TT, a nagromadzone przesunięcie jest nieskorygowanym biasem; przy <c3/> pozostaje tylko niepewność opublikowanego pasma od { "56" } do { "59" } mikrosekund na dobę w horyzoncie. Błąd znacznika czasu przesuwa pozycję wzdłuż toru o <c4/>.

seg-82b71e26bc89 = <b>Czytaj ostrożnie.</b> Domyślny rozrzut jest zdominowany przez założony człon prowadzenia, a w każdym miejscu przy biegunie południowym geometria przekaźników jest prawie taka sama, więc miejsca różnią się niewiele. Czas księżycowy ma małe znaczenie przez znakowanie czasem ({ "150" } m/s razy kilka mikrosekund to mniej niż milimetr); ma znaczenie, gdy geometria pogarsza się do trzech przekaźników.

seg-f5af0aef6649 = Dla każdego miejsca i pory roku (epoka i okno po niej): pozycjonowanie przekaźnikami (cztery lub więcej przekaźników w zasięgu nad maską i horyzontem terenu miejsca z PDOP poniżej progu, z tych samych funkcji i konstelacji co <c1/>; wynik dla jednego miejsca równa się jego wartości co do bitu), czy Ziemia i Słońce są nad horyzontem (analityczne Słońce, Księżyc i orientacja księżycowa, z libracją) oraz dostępność czasu (przekaźnik lub Ziemia w zasięgu) z najdłuższym odcinkiem, na którym nie ma żadnego z nich. Wartość dla przekaźników nie zmienia się z porą roku w tym modelu (zestaw keplerowski, średnia rotacja); wartości dla Ziemi i Słońca się zmieniają. Faza przekazuje kowariancję bez zmian i dyscyplinuje zegar do dolnej granicy czasu (ILLUSTRATIVE, { "50" } ns), pozostawiając do przetrwania w holdover tylko najdłuższą przerwę czasu.

seg-0890ec65a04e = Pięciostanowy model lądowania na wszystkich trzech osiach miejsca ze stanu powierzchniowego, pozycja AFS w podanym odstępie z tym samym traktowaniem czasu księżycowego oraz pełna kowariancja pozycji i prędkości 6x6 przy wprowadzeniu przekazywana dalej, z zachowaną korelacją pozycji i prędkości każdej osi. Rozrzut przy wyłączeniu silnika przesuwa położenie pojazdu i jest podawany obok kowariancji nawigacji, a nie przenoszony. Błędy są utrzymywane w osiach miejsca startu (bez krzywizny wzdłuż trasy), a nominalny stan wyjściowy jest zastępczy; wynikiem jest tylko kowariancja.

seg-f60b576fabcd = Jak dokument określa fazę

seg-be8e0001ed0c = W wątku tabela <c1/> fazy jest własną tabelą scenariusza samodzielnego. Długość fazy to <c2/> wątku: model, który podaje też własny klucz długości (<c3/>, <c4/>, <c5/>, <c6/>), musi się z nią zgadzać, inaczej faza jest odrzucana, a model pomijający klucz przyjmuje długość wątku. Ziarno to ziarno fazy wątku kluczowane identyfikatorem, więc faza uruchomiona samodzielnie pod tym samym identyfikatorem i ziarnem wątku zwraca liczby, które zwraca w wątku. Błędnie napisany klucz modelu jest odrzucany, a nie ignorowany. Przekazanie między fazami oraz konwersje układów odniesienia i skal czasu, których wymaga (inercjalny w układzie środka Księżyca i związany z Księżycem, Ziemia do Księżyca, pary LTC), należą do wątku.

seg-52a6e2ec0a99 = Projekty, wejścia i progi ustalono w <c1/> przed jakimkolwiek przebiegiem, z sześcioma datowanymi poprawkami, każda ujawniona w pliku; werdykt każdego progu, w tym niespełnione i historia estymatora, jest w <c2/>.

seg-a1cf56c505d0 = <b>A1</b> (propagator względem odtworzonej trajektorii LRO, { "24" } h): MET, maksymalna różnica 3-D { "33" } m wobec { "500" } m, { "2.4" } m RMS promieniowo wobec { "60" } m.

seg-25464238f6bd = <b>A2</b> (ten sam propagator względem prawie prostoliniowej orbity halo CAPSTONE na jednym obiegu trwającym 6,5 doby): <b>NOT MET</b>, różnica pozycji końcowej { "136.8" } km wobec { "25" } km oraz różnica promienia oskulacyjnego perycentrum { "28.4" } km wobec { "10" } km. Przyczyn nie wyizolowano (kandydaci to pominięte ciśnienie promieniowania i albedo, czułość orbity na stan początkowy oraz analityczne serie Ziemi i Słońca); wiersz pozostaje MODELLED.

seg-e1099ad81a5d = Te dwa wiersze testują propagator wspólny dla rodzajów księżycowych. <b>Nie testują żadnego filtra nawigacyjnego, sygnału ani budżetu, a nic innego tutaj nie ma zewnętrznej wyroczni.</b>

seg-9a4b2392aa92 = Wszystko inne jest MODELLED, a kontrole spójności rodzajów (B1 do B8 rejestracji wstępnej) testują implementację względem jej własnego podanego modelu, a nie względem Księżyca.

seg-3365490b59b7 = <s1>Poprzednia</s1>Wątek misji: od startu do wejścia w atmosferę

seg-90932eed0074 = <s1>Następna</s1>Pozycjonowanie, nawigacja i czas na LEO

seg-d655c932abbf = Rozrzut lądowania to błąd nawigacji przy lądowaniu plus niezależny człon prowadzenia (<c1/>, ILLUSTRATIVE, domyślnie { "20" } m na oś). Tabela <c2/> uruchamia każdą kombinację wspomagań. Elipsa jest kalibrowana metodą Monte Carlo (odsetek symulowanych lądowań wewnątrz konturu 3-sigma wobec { "98.9" } %, które daje rozkład Gaussa 2-D).
