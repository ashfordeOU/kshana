# docs--kind-slot-timing: translations (pl)

seg-f42465f7d066 = ns

seg-37d29d8303fe = km

seg-cb91473bfdda = Strona tematu: <a1>LEO-PNT.md</a1>

seg-c61e88721556 = Rodzaj scenariusza silnika v{ $version }, rodzina <a1>Zegary, synchronizacja czasu i holdover</a1>. Wyłącznie doradczo: wynik analizy z narzędzia badawczo-inżynieryjnego; nie jest to sprzęt nawigacyjny z zatwierdzeniem typu ani usługa bezpieczeństwa życia. Każda etykieta tutaj pochodzi od silnika lub z macierzy weryfikacji; rodzaj jest MODELLED, o ile macierz nie mówi inaczej (jak zdobywa się etykietę: sekcja Evidence w README).

seg-849c08d3ce70 = Strona rodziny: <a1>Zegary, synchronizacja czasu i holdover</a1>

seg-09644e40e2d8 = Źródło: <c1/>

seg-ec92d03eaa6c = <c1/> (rodzaj scenariusza)

seg-1b61962464c5 = Synchronizacja szczelin: liczba sekund, po których swobodnie biegnący zegar opuszcza przedział ochronny szczeliny routingu lub zadań indeksowanej czasem (największy bezwzględny błąd czasu, jaki szczelina toleruje), udział każdego składnika w tej chwili ze wskazaniem dominującego (niepewność rozwiązania pozycji, szum fazy biały, szum częstotliwości biały, migotania, błądzenia przypadkowego i przebiegu losowego, resztkowe przesunięcie częstotliwości, temperatura, starzenie), czas pozostały od ostatniego rozwiązania pozycji oraz największy odstęp między rozwiązaniami, który utrzymuje zegar w szczelinie, po odjęciu opóźnienia rozwiązania. Oscylator to wartość domyślna KLASY (csac, uso, dsac, tcxo, ocxo lub rafs: jedno przytoczone jednosekundowe odchylenie Allana i założona podłoga szumu czerwonego), PREDEFINIOWANA KARTA KATALOGOWA synchronizacji telekomunikacyjnej lub wbudowana KARTA KATALOGOWA (maksima odchylenia Allana dopasowane jako obwiednia, plus starzenie i współczynnik temperaturowy), albo wbudowany zapis fazy MEASURED (jego nakładające się odchylenie Allana dopasowane ważoną metodą najmniejszych kwadratów w bazie szumu fazy białego i modulacji częstotliwości wg IEEE Std { "1139" }, więc podłoga szumu czerwonego jest zmierzona, a nie założona). Przekroczenie poza najdłuższy czas uśredniania, jaki obsługuje karta katalogowa lub zapis, jest oznaczane jako ekstrapolowane. Opcjonalna sekcja spoofingu dodaje poziom ochrony czasu dla odbiornika na orbicie: prędkość i okres orbitalny, jak długo pojedynczy spoofer naziemny może dosięgnąć satelity w czasie jednego przelotu, podłogę monitora wspomaganego zegarem i opóźnienie detekcji CUSUM, ograniczenie warunkowe, odchylenie, jakie spoofer o podanej maksymalnej szybkości narastania gromadzi, zanim satelita opuści jego zasięg lub zostanie wykonana niezależna kontrola, oraz to, czy każda kontrola kontaktu z ziemią lub łącza krzyżowego jest niezależna od tego spoofera. VALIDATED: inwersja holdover z dopasowanego zapisu, wstrzymana na rzeczywistym zegarze cezowym zmierzonym względem masera wodorowego (tests/slot_timing_cs5071a_holdout.rs, uzależnione od danych); dla zmierzonego oscylatora kwarcowego wstrzymana prognoza jest zachowawcza, ale nie mieści się w progu, więc przypadek kwarcu jest MODELLED. MODELLED: źródła klasy i karty katalogowej, składniki deterministyczne i ocena spoofingu.

seg-1284cfee51f0 = Jeden przebieg <c1/> podsumowuje się tak: slot-timing (źródło: karta katalogowa): przedział ochronny { "100.0" } ns przy k={ "3" } przekraczany { "650.8" } s po rozwiązaniu pozycji (pozostało { "50.8" } s); rozwiązanie pozycji co najmniej co { "645.8" } s ({ "133.80" } na dobę); składnik dominujący: szum częstotliwości błądzenia przypadkowego

seg-97e12e763be3 = Pola wymagane: <c1/>, <c2/>

seg-6b75ef50497a = Pola opcjonalne: <c1/>

seg-8c4662736bc0 = Przykład <c1/> ustawia między innymi:

seg-8aee75a55007 = ocxo

seg-df4ca2d859ff = 1/s^{ "3" }

seg-1a282dc35742 = karta katalogowa

seg-c13396b4e57b = Etykieta wyniku (silnika): MODELLED — czas, po którym swobodnie biegnący zegar opuszcza przedział ochronny szczeliny routingu, oraz częstość rozwiązań pozycji, która utrzymuje go w środku, z modelu zegara o stacjonarnym prawie potęgowym. Źródło w postaci karty katalogowej to obwiednia jej maksimów, a nie pomiar żadnego egzemplarza; źródło klasy opiera się na założonej podłodze szumu czerwonego.

seg-97a91c8a60cd = Wykres zapisany przez silnik dla scenarios/slot-timing-ocxo-leo.toml, rodzaj slot-timing

seg-8461cb5b7863 = MODELLED { "2" } · VALIDATED { "1" }: wiersze <a1>macierzy weryfikacji</a1>, które wymieniają ten rodzaj.

seg-e84e4b49fee0 = <b>VALIDATED</b> Ścieżka zapisu zmierzonego rodzaju <c1/>: nakładające się odchylenie Allana zapisu fazy dopasowane nieujemną metodą najmniejszych kwadratów z wagami edf w bazie szumu fazy białego i modulacji częstotliwości wg IEEE Std { "1139" } (slot_timing::fit_weighted), Testy: <a1>slot_timing_cs5071a_holdout.rs</a1>.

seg-26ccdbd07a46 = <b>MODELLED</b> Rodzaj <c1/>: przewidywany błąd E(t) = k·√(σ₀² + σ_x²(t)) + (|y₀| + |c_T·ΔT|)·t + ½|D|t² odwrócony dla przekroczenia, pozostałego czasu, odstępu resynchronizacji po odjęciu opóźnienia rozwiązania i liczby rozwiązań na dobę, każdy składnik wyszczególniony z Testy: <a1>slot_timing_igs_holdout.rs</a1>.

seg-35ac4dddc39f = <b>MODELLED</b> orbital_timing::orbital_timing, dostępne jako sekcja spoofingu rodzaju <c1/>: prędkość i okres orbity kołowej, najdłuższy czas, przez jaki spoofer naziemny może dosięgnąć satelity w czasie jednego przelotu, podłoga monitora wspomaganego zegarem i opóźnienie detekcji CUSUM

seg-8dbc28c3398f = <b>MODELLED</b> Rodzaj <c1/>: przewidywany błąd E(t) = k·√(σ₀² + σ_x²(t)) + (|y₀| + |c_T·ΔT|)·t + ½|D|t² odwrócony dla przekroczenia, pozostałego czasu, resynchronizac. Wyrocznia (InternalConsistency): postacie zamknięte każdego składnika osobno i niezależne szukanie pierwiastka holdover::holdover_seconds; wartości z kart katalogowych pochodzą z wymienionych dokumentów (docs/SLOT-TIMING.md). Wartość domyślna klasy opiera się na założonej podłodze szumu czerwonego, a źródło w postaci karty katalogowej jest obwiednią maksimów, więc żadne nie jest pomiarem żadnego egzemplarza

seg-fabde8dddf68 = <b>MODELLED</b> orbital_timing::orbital_timing, dostępne jako sekcja spoofingu rodzaju <c1/>: prędkość i okres orbity kołowej, najdłuższy czas, przez jaki spoofer naziemny może d. Wyrocznia (InternalConsistency): redukcja do istniejącego poziomu ochrony czasu oraz postaci zamkniętych widoczności dla orbity kołowej i kulistej Ziemi. Warunkowo względem detekcji, jeden spoofer naziemny przy podanej szybkości narastania, przelot nad głową przy nieobracającej się Ziemi; nie sprawdzone na odbiorniku z fałszowanym sygnałem na orbicie

seg-29af1ec87672 = skoki częstotliwości, efekty promieniowania i relatywistyczne przesunięcia częstotliwości (wynik <c1/>)

seg-89f90cdab1db = model termiczny: wychylenie temperatury jest stosowane jako skok w chwili rozwiązania pozycji (wynik <c1/>)

seg-cb3887ccae22 = sam protokół synchronizacji: rozwiązanie pozycji zeruje błąd do fix_sigma_ns (wynik <c1/>)

seg-b96fceda31df = względem której miary dryfu należy przyjmować szczelinę routingu; zob. docs/SLOT-TIMING.md (wynik <c1/>)

seg-b101457241f2 = MODELLED — czas, po którym swobodnie biegnący zegar opuszcza przedział ochronny szczeliny routingu, oraz częstość rozwiązań pozycji, która utrzymuje go w środku, z modelu zegara o stacjonarnym prawie potęgowym. Źródło w postaci karty katalogowej to obwiednia jej maksimów, a nie pomiar żadnego egzemplarza; źródło klasy opiera się na założonej podłodze szumu czerwonego. (wynik <c1/>)

seg-8e3d910f22ed = Oscylator to wartość domyślna KLASY (csac, uso, dsac, tcxo, ocxo lub rafs: jedno przytoczone jednosekundowe odchylenie Allana i założona podłoga szumu czerwonego), PREDEFINIOWANA KARTA KATALOGOWA synchronizacji telekomunikacyjnej lub wbudowana KARTA KATALOGOWA (maksima odchylenia Allana dopasowane jako obwiednia, plus starzenie i współczynnik temperaturowy), albo wbudowany zapis fazy MEASURED (jego nakładające się odchylenie Allana dopasowane ważoną metodą najmniejszych kwadratów w bazie szumu fazy białego i IEEE S (katalog rodzajów (<c1/>))

seg-f6a831727890 = VALIDATED: inwersja holdover z dopasowanego zapisu, wstrzymana na rzeczywistym zegarze cezowym zmierzonym względem masera wodorowego (tests/slot_timing_cs5071a_holdout.rs, uzależnione od danych); dla zmierzonego oscylatora kwarcowego wstrzymana prognoza jest zachowawcza, ale nie mieści się w progu, więc przypadek kwarcu jest MODELLED. (katalog rodzajów (<c1/>))

seg-1cf85cbedffa = MODELLED: źródła klasy i karty katalogowej, składniki deterministyczne i ocena spoofingu. (katalog rodzajów (<c1/>))

seg-1a72034c1343 = Strona tematyczna: <a1>DECEIVED-TIME.md</a1>

seg-10e6cd8ce00c = <s1>Poprzednia</s1>reentry

seg-b8ec9e10ee84 = <s1>Następna</s1>solar-system
