# docs--real-tle-guide: translations (pl)

seg-a6da23b43f90 = <s1>Następna</s1>Kampanie

seg-bc9ae2eda129 = Źródło: <c1/>

seg-68b27f011ced = Używanie rzeczywistych TLE konstelacji

seg-109e8a920fc2 = Dołączony <c1/> zawiera już <b>rzeczywiste TLE</b> (dwuwierszowe zestawy elementów): zrzut <c2/> z Celestrak operacyjnej konstelacji GPS (Global Positioning System) skatalogowanej 2021-07-28, { "30" } satelitów, z <c3/>. Każdy satelita jest propagowany za pomocą SGP4/SDP4 (Simplified General Perturbations { "4" } / Simplified Deep-space Perturbations { "4" }), co zostało sprawdzone względem oficjalnych wektorów AIAA (American Institute of Aeronautics and Astronautics) 2006-6753. Ten sam zrzut jest dołączony jako <c4/>, a <c5/> pobiera nowy. Przed przywołaniem z niego liczby opisującej geometrię należy przeczytać sekcję { "3" }: ten scenariusz propaguje każdego satelitę od jego własnej epoki.

seg-faed28835cb2 = Jako syntetyczny, samodzielny przykład <c1/> podaje sześć satelitów podobnych do GPS jako gołe rekordy z wierszem 2, propagowane jako analityczne elementy keplerowskie, a każdy scenariusz <c2/> bez bloku <c3/> buduje konstelację Walkera.

seg-1c9b96a07f5b = Aby badać <b>aktualną</b> konstelację GPS (lub dowolną inną), należy wstawić świeży zrzut.

seg-95bb71044de0 = { "1" }. Pobranie aktualnego zrzutu

seg-ab93ab55ddd9 = <a1>Celestrak</a1> redystrybuuje zestawy elementów z katalogu NORAD (North American Aerospace Defense Command), odświeżane co najmniej raz dziennie. Dla GPS:

seg-da7b4b89848b = Inne przydatne grupy: <c1/>, <c2/> (GLONASS, rosyjski Global Navigation Satellite System), <c3/>, <c4/> (ISS, International Space Station, i inne stacje załogowe).

seg-d7fe0dccbc36 = Plik jest ciągiem rekordów trzywierszowych (nazwa, wiersz { "1" }, wiersz { "2" }). Parser { -brand } ignoruje wiersze z nazwami, więc plik można wkleić bez zmian.

seg-c2d6ca2089a1 = { "2" }. Wstawienie go do scenariusza

seg-6e221c5b640a = W dowolnym scenariuszu orbitalnym należy ustawić blok konstelacji <c1/> na zawartość zrzutu:

seg-f2b0e78ef568 = (PRN to numer kodu pseudolosowego, który nadaje satelita GPS.)

seg-976bcb48df94 = Para wiersz { "1" } + wiersz { "2" } jest propagowana za pomocą <b>SGP4/SDP4</b> (człony oporu i przestrzeni głębokiej); sam wiersz { "2" } jest traktowany jako analityczne średnie elementy keplerowskie. Oba rodzaje można mieszać.

seg-fa1d59fc7817 = <c1/> odrzuca każdy wiersz, w którym suma kontrolna modulo 10 z kolumny 69 jest błędna — to dobra kontrola integralności świeżo pobranego pliku. Domyślnie ma wartość <c2/>, ponieważ syntetyczne scenariusze dydaktyczne używają zastępczych sum kontrolnych.

seg-90d3872ebf87 = { "3" }. Uwagi o epokach — przeczytaj to przed przywołaniem liczby opisującej geometrię

seg-5e9056a30d53 = SGP4 propaguje każdego satelitę od <b>jego własnej epoki TLE</b>, a <c1/> (w <c2/>) zwraca wyłącznie propagatory, więc czas scenariusza <c3/> jest stosowany jako <c4/> dla każdego satelity niezależnie. Jest to właściwa konwencja tylko wtedy, gdy wszystkie zestawy elementów w pliku mają wspólną epokę.

seg-3d04797ae50e = <b>Plik grupy z Celestrak tego nie zapewnia.</b> Plik jest <em>pobierany</em> w jednej chwili, ale zestaw elementów każdego satelity jest odświeżany we własnym rytmie, więc epoki w nim są rozłożone na kilka dni. Zmierzone na zestawach dołączonych do tego repozytorium (wiersz { "1" }, kolumny { "19" }–{ "32" }):

seg-5f67557dd207 = plik testowy

seg-ce4855643f31 = zestawy

seg-49a5b4798be4 = rozrzut epok

seg-b758a9b7ee02 = { "70.6" } h

seg-79e6ea88957c = { "76.4" } h

seg-e1e30f69fa4f = { "335.7" } h

seg-9d38cc073c94 = { "70.6" } h to { "5.9" } obiegu GPS. Po propagacji bez zmian fazowanie w płaszczyźnie jest pomieszane: satelity znajdują się na właściwych wysokościach i nachyleniach, ale nie tam, gdzie były w którymkolwiek jednym dniu, więc widoczny zbiór, DOP (dilution of precision) i każda obliczona z nich dostępność opisują konstelację, która nigdy nie istniała. Nic w parserze nie mierzy tego rozrzutu za użytkownika, a rodzaje <c1/> i <c2/> nie wyrównują epok: blok TLE w scenariuszu jest zawsze propagowany od epoki każdego satelity z osobna.

seg-fa82a18e4418 = <b>Zamiast tego należy zrobić tak.</b> Epokę należy trzymać przy propagatorze, wybrać jeden chwilowy punkt odniesienia i przesunąć <c1/> każdego satelity względem niego. <c2/> jest publiczne, więc pętla parsowania jest krótka; <c3/> (<c4/>) jest przykładem roboczym w tym drzewie:

seg-78092818695e = TEME to układ prawdziwego równika i średniego równonocy, w którym działa SGP4; <c1/> obraca go do współrzędnych związanych z Ziemią za pomocą <c2/>.

seg-78f483dfc3fa = Jeśli epoki nie zostały wyrównane, trzeba o tym powiedzieć przy podawaniu liczby: jest to stwierdzenie o <em>powłokach</em> orbitalnych, a nie o rzeczywistym niebie.

seg-34fddbd3d57f = O tym, jak duże ma to znaczenie, mówi pomiar w <c1/>, który stosuje te same przesunięcia (chwila odniesienia: najpóźniejsza epoka w połączonych plikach GPS + Galileo, 2026-06-07T07:{ "21" }:{ "04" } UTC (Coordinated Universal Time)) w { "24" }-godzinnym przebiegu dostępności ARAIM (advanced receiver autonomous integrity monitoring) dla dwóch konstelacji. Przy VAL (vertical alert limit) { "12" } m wyrównane niebo daje dla samego GPS { "0.993" }, dla połączonych GPS+Galileo { "1.000" } i dla dwóch konstelacji odpornych na uszkodzenia konstelacji { "0.990" }; niewyrównana konwencja epoki każdego satelity z osobna daje dla tych samych danych { "0.208" }, { "0.671" } i { "0.031" } — to inny wniosek, a nie mały błąd.

seg-49f6c8f71d99 = <a1><c1/></a1> — scenariusze orbitalne.

seg-c842884cb3e7 = <a1><c1/></a1> — pola rodzaju <c2/>; rodzaje <c3/>, <c4/>, <c5/> i <c6/> przyjmują tę samą tabelę <c7/>, a <a2><c8/></a2> przyjmuje pojedynczy <c9/>.

seg-a2c5db6dcf42 = <a1><c1/></a1> — silnik ARAIM, którym steruje test rzeczywistego nieba.

seg-106047488885 = <c1/> — parser (<c2/>, <c3/>).

seg-c9068c1bc579 = <s1>Poprzednia</s1>Schemat wyniku
