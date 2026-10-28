# docs--mission-thread: translations (pl)

seg-e27476e37522 = Ziemia

seg-34bdcfd66ded = W gałęzi repozytorium, z której pochodzi ta dokumentacja; jeszcze nie na GitHub

seg-092dd691ca17 = Raport

seg-f942b36a11c4 = Jeszcze nie na GitHub

seg-b03d56f501c3 = Rodzaj

seg-2afa300864a9 = Parametry

seg-b7cf72949a21 = Źródło: <c1/>

seg-32755afa0f78 = Wątek misji

seg-d4af67363efc = Oprogramowanie wyłącznie doradcze, nie jest to certyfikowany sprzęt nawigacyjny. Tylko źródła publiczne; bez powiązań z żadną agencją i bez jej poparcia, a nic tu nie twierdzi, że spełnia wymagania jakiegokolwiek programu.

seg-816770c97995 = <c1/> łączy fazy misji, z których każda jest jednym z ośmiu zarejestrowanych rodzajów z własnymi czujnikami i filtrem, i podaje <b>budżet błędu nawigacji i czasu</b> całego łańcucha: dla każdej fazy 1-sigma pozycji, prędkości i biasu zegara na wejściu, w szczycie i na wyjściu; każdy wkład do niego, z jednostką; margines względem wymagania, które podajesz; najsłabsze ogniwo; datowane zdarzenia; i wykres osi czasu. Każda liczba jest <b>MODELLED</b>: podanym wejściem albo modelem takiego wejścia. Jedyne wiersze z zewnętrzną wyrocznią są w <s1><c2/></s1> i mówią, co testują.

seg-c29a19879c84 = Uruchom przykład z kopii repozytorium (odczytuje zatwierdzony wycinek jądra Księżyca):

seg-00f84b734853 = Dokument

seg-9979b2c873df = <b>Dokument jest odrzucany, a nie zgadywany,</b> gdy powtarza się identyfikator fazy, lista <c1/> jest pusta, nazwa jest nieznana, klucz modelu nie jest kluczem znanym rodzajowi, klucz długości nie zgadza się z <c2/> albo faza wymienia źródło, dla którego jej model nie podaje liczb.

seg-9b1e6ac618b5 = Co robi przekazanie

seg-0e965f3e30fa = Przekazywany stan to pełna kowariancja 6x6 dla <c1/> w jednostkach SI, zegar (bias, dryf i ich kowariancja, oznaczone skalą czasu), układ odniesienia, czas misji i etykieta dowodowa. Przekazanie nigdy nie zeruje kowariancji.

seg-47599d03571d = Zasada

seg-023113cc5afb = przekazuje stan bez zmian

seg-43967d0b6dd8 = szum białego przyspieszenia o PSD <c1/> na <c2/> w modelu prostoliniowym; wiersz podaje oba

seg-2c791ab0fd0f = nawigacja zliczeniowa przez <c1/>, a potem oś jest ustawiana na dolną granicę źródła tylko tam, gdzie ta granica jest mniejsza; nigdy poniżej granicy, nigdy zerowanie

seg-36b9117f5379 = Układy odniesienia i skale czasu

seg-5853aaba827f = Wątek konwertuje przy przekazaniu, nigdy wewnątrz fazy, a każda konwersja jest osobnym wierszem budżetu. Układy: GCRF, MCI, MCMF (ITRF i LVLH są odrzucane z podaniem powodu). <c1/> przesuwa początek o geocentryczny stan Księżyca: stan klasy DE440 z jądra tam, gdzie obejmuje epokę (zastępnik { "5" } m i { "1" } mm/s; zmierzone najgorsze { "2.6" } m względem przypiętych wartości JPL Horizons), w przeciwnym razie serię analityczną ze zmierzonym { "195.7" } km RMS, co podaje wiersz; przykład księżycowy musi więc zawierać jądro obejmujące jego epokę. <c2/> to średnia rotacja gwiazdowa z osiami wyrównanymi w epoce i bez libracji. Skale czasu przechodzą przez TT: <c3/> dokładnie, <c4/> dodaje { "14" } us, <c5/> używa wiekowego tempa z <c6/> z jego pasmem od { "56" } do { "59" } us/dobę jako niepewnością tempa.

seg-5ee610d8ab89 = Osiem rodzajów faz

seg-70b73f1acebf = Segment

seg-0e39a468de1d = wznoszenie z napędem na orbitę parkingową: kowariancja o stałej prędkości z szumem białego przyspieszenia, akwizycja GNSS i zanik, holdover zegara

seg-d359ae5982a6 = klucze <c1/> w <c2/>

seg-57c44fd6e061 = nawigacja względna na odcinkach czujników: przejście Clohessy'ego-Wiltshire'a w LVLH, kowariancja Kalmana 6x6, okno połączenia

seg-7dce961e2c67 = poniżej

seg-4b233c6cdf8b = impuls TLI i lot cislunarny: propagacja Cowella, macierz przejścia stanu liczona różnicą skończoną, aktualizacje gnss-ssv i śledzenia naziemnego

seg-352e27d02c86 = lot powrotny do granicy wejścia; sigma kąta toru lotu, prawdopodobieństwo korytarza, szczytowe opóźnienie, obszar lądowania

seg-95eb34012fe8 = księżycowy

seg-cc72d2fc8a43 = nawigacja względna do połączenia na orbicie księżycowej

seg-2cfa6846c937 = budżet rozrzutu lądowania w miejscu przy biegunie

seg-e9f5fc58fe12 = ten sam

seg-ba3c65a210dd = dostępność PNT i czasu na powierzchni według miejsca i pory roku

seg-8b9c5124dd3c = wznoszenie z napędem na orbitę wprowadzenia

seg-4ce0fa85457c = Rodzaje księżycowe są też samodzielnymi rodzajami scenariuszy; projekt i dowody są w <a1><c1/></a1>.

seg-d16877f38793 = Budżet niesie sigmy <b>względne</b>; bezwzględna kowariancja statku goniącego jest przekazywana bez zmian i mówi o tym wiersz, ponieważ ta faza mierzy pojazdy względem siebie, a nie względem Ziemi. Początkowa kowariancja względna to bezwzględna kowariancja statku goniącego plus podane sigmy celu, dodane jak niezależne (zachowawczo). Klucze: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, opcjonalnie <c6/> i <c7/> oraz jeden lub więcej <c8/> z <c9/>, <c10/>, <c11/>, <c12/> (<c13/>, <c14/> lub <c15/>, parametry ILLUSTRATIVE w <c16/>) i <c17/>; czasy trwania odcinków sumują się do czasu fazy. Okno połączenia to czas od chwili, od której sigma względna pozostaje wewnątrz obwiedni zdolności chwytu, do końca fazy. Powtórzenia są osobnymi fazami z własnymi identyfikatorami.

seg-088b78574ab4 = Stan średni pochodzi z propagatora Cowella silnika z grawitacją Ziemi i J2 oraz Słońcem i Księżycem jako ciałami trzecimi. Kowariancja przechodzi przez każdy segment <c1/> z macierzą przejścia stanu liczoną różnicą w przód (przebieg nominalny i sześć przebiegów zaburzonych) i szumem białego przyspieszenia. Impuls jest wzdłuż prędkości wejścia, z podaną częścią wielkości i błędem kierunku. <b>Nazwane ograniczenie:</b> zatwierdzone wycinki jądra Księżyca zawierają Księżyc, ale nie Słońce, więc propagator bierze Księżyc z jądra, a Słońce z serii analitycznej (człon trzeciego ciała Słońca jest niewrażliwy na błąd tej serii); faza podaje w zdarzeniu, której użyła, a tam, gdzie żadne jądro nie obejmuje segmentu, używa serii analitycznej dla obu. Impuls <b>nie jest celowany</b>: stan nominalny jest tam, dokąd prowadzi podany impuls, a fazy księżycowe biorą tylko kowariancję.

seg-e5a67295a5ae = Aktualizacje, używane tylko wtedy, gdy dokument wymienia źródło: <c1/> (pozycje z dostępnością i PDOP z przeglądu objętości usługi kosmicznej silnika wzdłuż oskulacyjnej orbity okołoziemskiej zastępującej łuk, jeden przegląd na <c2/>; sigma pozycji = mediana PDOP razy <c3/>; postać informacji oczekiwanej utrzymuje przebieg deterministyczny) oraz <c4/> (odległość i prędkość radialna wzdłuż kierunku geocentrycznego, więc płaszczyzna nieba nie jest obserwowana; wariancja aktualizacji jest dzielona przez cykl śledzenia). Klucze: <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, opcjonalnie <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>, <c19/>.

seg-3a69ca6723ba = Lot bezwładny to lot <c1/> bez impulsu, kończący się na granicy wejścia; jego klucze to klucze lotu bezwładnego powyżej. Na granicy faza odczytuje kąt toru lotu i jego sigmę z pełnej kowariancji, prawdopodobieństwo, że kąt mieści się w podanym korytarzu, szczytowe opóźnienie przy kącie nominalnym i na obu brzegach korytarza (płaskie wejście balistyczne silnika obok zamkniętej postaci Allena-Eggersa) względem opcjonalnego limitu oraz obszar lądowania: wzdłuż toru z podanej czułości, w poprzek toru z kowariancji na granicy w poprzek płaszczyzny orbity. Klucze: <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, opcjonalnie <c8/>, <c9/> i <c10/> (nominalny stan powrotu, sześć liczb, gdy łańcuch nie ma impulsu transziemskiego, który by go dał). Nic tu nie modeluje siły nośnej, prowadzenia ani nagrzewania kapsuły.

seg-352783ef7181 = Nakładka sieci naziemnej

seg-69d6ab8e93bc = Opcjonalna tabela <c1/> podaje stacje i najniższą elewację śledzenia; dla każdej nazwanej fazy wątek oblicza część fazy, którą stacja może śledzić, i przekazuje ją fazie jako cykl pracy skalujący częstość jej aktualizacji śledzenia naziemnego. Geometrie: <c2/> (stan wejścia lecący jako dwuciałowy z J2, dla faz niskiej orbity), <c3/> (pojazd w położeniu Księżyca, dla lotu cislunarnego) i <c4/> (podany przez Ciebie cykl pracy). Zmiana stacji traci <c5/>; budżet fazy otrzymuje najdłuższy odstęp bez stacji w zasięgu, a zdarzenie podaje cykl pracy. Nic nie modeluje anten ani harmonogramów sieci.

seg-467b14d7ef59 = <c1/>: <c2/> (indeks, identyfikator, rodzaj, czasy, etykieta, źródła nawigacji i czasu, źródło ograniczające, sigmy na wejściu, w szczycie i na wyjściu, wymaganie, margines, <c3/> z jednostką na wiersz, <c4/>), <c5/> (najmniejszy margines względem podanego wymagania, w przeciwnym razie największa pozycja w szczycie), <c6/>, <c7/> wątku (etykieta najsłabszej fazy) oraz blok <c8/>. Wykres to 1-sigma pozycji i biasu zegara względem czasu misji, jedno pasmo na fazę.

seg-a3c40c51c2ff = Czym są dowody

seg-1168810d4407 = Etykieta wątku to etykieta najsłabszej fazy, a każda faza jest MODELLED. Propagator księżycowy jest porównany z LRO i CAPSTONE (<s1><c1/></s1>); łuk cislunarny jest porównany z publiczną trajektorią Horizons (<s2><c2/></s2>). Wiersz zalicza próg albo go nie osiąga, a próg jest ustalony w zatwierdzonym pliku przed przebiegiem, a niespełnienie jest zapisywane jako niespełnienie. Nic nie jest VALIDATED, o ile rejestr tak nie stanowi.

seg-ee3c5b58e6fa = <s1>Poprzednia</s1>Orbita i powierzchnia Księżyca jako infrastruktura

seg-b963f8a02aed = <s1>Następna</s1>Wątek misji: segment księżycowy

seg-af81a8087ca7 = entry
