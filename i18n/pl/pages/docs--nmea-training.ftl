# docs--nmea-training: translations (pl)

seg-2247a2344710 = Znaczenie

seg-45425f378b61 = znaczenie

seg-6940543aa3c0 = ciąg znaków

seg-f5e7215e6835 = obiekt

seg-c5fb6b91dc68 = stopnie

seg-99427ab75a03 = pole

seg-f2be7442bdf2 = Zdarzenia

seg-db86ed4b40a9 = Każde <c1/> ma <c2/>, moment początku <c3/>, <c4/> (od początku do rozpoczęcia zwolnienia), czas narastania <c5/> i czas zwalniania <c6/>. Siła rośnie liniowo przez <c7/>, utrzymuje się, a następnie maleje przez <c8/>; <c9/> oznacza skok. Wszystkie efekty skalują się z tą siłą. Parametry, które nie należą do danego rodzaju, są odrzucane.

seg-3255e99c7265 = rodzaj

seg-9285a9d699c0 = parametry

seg-e83c9db4f9c7 = efekt

seg-e96ef358529d = <c1/>, <c2/> (domyślnie { "6" })

seg-cd6030834371 = C/N0 każdego satelity spada nawet o <c1/> (z rozrzutem na satelitę), satelity wypadają w kolejności od najsłabszego, pozycja zostaje utracona, gdy użytecznych jest mniej niż cztery, i wraca po zwolnieniu oraz po <c2/>

seg-e5a66c9c3627 = <c1/>, jedno z: <c2/> (rzeczywisty) lub <c3/> (względem kursu <b>w chwili początku</b>, a potem utrzymywany), opcjonalnie <c4/>, <c5/>

seg-d7d967a60275 = odbiornik utrzymuje <b>poprawną pozycję</b>, której położenie oddala się od prawdziwego; SOG i COG uwzględniają to znoszenie. Znoszenie przebiega według funkcji smoothstep na czasach narastania i zwalniania, więc fałszywy tor zaczyna się i kończy bez skoku prędkości; jego szczyty to <c1/> m/s i <c2/> m/s kwadrat dla czasu narastania <c3/> s na dystansie <c4/> m (oba są rejestrowane), a scenariusz, który przekroczyłby <c5/>, jest odrzucany. Skok (<c6/>) przesuwa pozycję, nie ruszając prędkości

seg-7da039c3262e = czas RMC, GGA, GNS i ZDA jest przesunięty względem prawdziwego UTC; pozycja pozostaje prawdziwa

seg-ead3ce0162fb = <c1/>, <c2/> (domyślnie true), <c3/>

seg-a1bdb89334df = pozycja, prędkość (i czas) są takie, jakie jednostka miała <c1/> temu, przy czym opóźnienie zmienia się według funkcji smoothstep na czasach narastania, a raportowana prędkość jest skalowana przez <c2/>, gdy opóźnienie się zmienia: uproszczona abstrakcja w stylu meaconingu, a nie model propagacji

seg-6f435224f7fb = <c1/>: gdy aktywne jest znoszenie, fałszowanie czasu lub opóźnione odtwarzanie, każdy śledzony satelita pokazuje ten sam, podniesiony poziom, co jest klasycznym znakiem. Pomiń go przy subtelnym zdarzeniu, w którym zachowany jest prawdziwy wzorzec C/N0. Gdy aktywne jest jakiekolwiek zdarzenie z fałszywym sygnałem, odbiornik podąża za fałszywym sygnałem, więc zagłuszanie go nie wyłącza; pozycja utracona wskutek wcześniejszego zagłuszania wraca po <c2/> na fałszywym sygnale (zob. <c3/>). Zmiana czasu, która sprawiłaby, że raportowany czas stanęłby lub biegłby wstecz (tempo { "1" } s na sekundę lub więcej), jest odrzucana, chyba że jest skokiem (<c4/>).

seg-894aceb32c5c = Zdarzenia mogą się nakładać; ich efekty sumują się (przesunięcia, zmiany czasu, opóźnienia) albo obowiązuje najsilniejszy (zagłuszanie). <c1/> na osi czasu to pierwsza epoka, w której zdarzenie ma efekt, czyli jedna epoka po zaplanowanym <c2/>, gdy zdarzenie narasta stopniowo.

seg-09e311ade9e6 = Dziennik instruktora

seg-80933b9bdf0d = Obok strumienia <c1/> i <c2/> podają:

seg-51930977a6fe = zdarzenia w postaci wprowadzonej, zwykłym językiem, z każdym parametrem i momentem początku w UTC;

seg-4eab197c487b = oś czasu: początek, pełny efekt, początek powrotu, powrót oraz własne <c1/> i <c2/> odbiornika;

seg-af2eb88f14d0 = prawdziwy tor obok raportowanego w odstępach <c1/>: prawdziwa i raportowana pozycja, prędkość i kurs, błąd pozycji w metrach, przesunięcie czasu, liczba satelitów użytych i śledzonych, średnie C/N0 oraz informacja, które zdarzenia były aktywne;

seg-303f5fbe0351 = szczytowa prędkość i przyspieszenie prawdziwego oraz raportowanego toru;

seg-593a4a1ef296 = <c1/> scenariusza.

seg-8c4aebcd0eff = Pokazuj dziennik dopiero podczas omówienia.

seg-dd1780910af7 = pola JSON (schemat <c1/>)

seg-60b5b11cdc0b = typ, jednostka

seg-f4963d090155 = oświadczenie dotyczące wyłącznie szkolenia

seg-7ad14e03d9e4 = ze scenariusza

seg-fac0fb50b31b = użyte ziarno (seed)

seg-f05d18516bd8 = ISO { "8601" } UTC

seg-8752c09baa6a = początek przebiegu

seg-f0d8bb5aafef = długość przebiegu

seg-0989e14f1e51 = węzły

seg-b657b979a455 = najwyższa prawdziwa i raportowana prędkość względem dna

seg-24e947df31ae = m/s kwadrat

seg-a1ca3847c8d8 = największa zmiana prędkości na sekundę, prawdziwa oraz między kolejnymi raportowanymi pozycjami

seg-e1daadeb7d48 = po jednym na każde zaplanowane zdarzenie

seg-3aaa0108ac1e = numeracja od 1; używane przez <c1/> i <c2/>

seg-6bbb9db14f7b = opis zwykłym językiem wraz z parametrami

seg-2f3eac27a997 = zaplanowany początek

seg-4255c67f3db5 = zdarzenie dokładnie tak, jak zapisano (<c1/>, <c2/>, <c3/>, <c4/>, <c5/> oraz parametry właściwe dla danego rodzaju; nieobecne są pomijane)

seg-88db26711d77 = stopnie względem północy rzeczywistej lub null

seg-2f30c3d8b17b = znoszenie: zastosowany kierunek (kierunek względny jest rozstrzygany w chwili początku)

seg-55d6dd667365 = m/s, m/s kwadrat lub null

seg-021df000164f = znoszenie: szczyty, jakie znoszenie dodaje do fałszywego toru

seg-d3a2c65ebcd4 = momenty do omówienia, w kolejności czasowej

seg-b2b72301c1c9 = s od początku, ISO { "8601" } UTC

seg-34e24e21ac7e = kiedy (czas prawdziwy)

seg-cf29ba5ed968 = liczba całkowita lub null

seg-8dbc5e7239be = identyfikator zdarzenia; null dla zmian stanu odbiornika

seg-ae0d2fd5e1d1 = <c1/>, <c2/>, <c3/>, <c4/> (zdarzenia); <c5/>, <c6/> (odbiornik)

seg-cd7c4057601b = objaśnienie

seg-90e65cbe1a59 = jeden wiersz na <c1/>

seg-a57e27a3c470 = s, ISO { "8601" } UTC

seg-24376fe24496 = prawdziwa pozycja

seg-f23b251a0e33 = węzły, stopnie względem północy rzeczywistej

seg-242c1f2ccbd3 = prawdziwa prędkość i kurs względem dna oraz kurs żyrokompasu

seg-696dd61f8bbb = wartość logiczna

seg-ea264ef0395c = odbiornik zgłosił pozycję

seg-b073b87a813e = stopnie, węzły, stopnie względem północy rzeczywistej lub null

seg-b56345697092 = to, co zgłosił odbiornik; null, gdy pozycja jest utracona

seg-c4a33c03d9da = m lub null

seg-463f6fc42ae5 = odległość pozioma między pozycją prawdziwą a raportowaną

seg-b68dfce8d81d = raportowane UTC minus prawdziwe UTC

seg-ec28faa1efcc = liczby całkowite

seg-2bf397f77392 = satelity użyte w pozycji oraz śledzone

seg-96b87348e90e = dB-Hz lub null

seg-40f30b4a88cf = średnie C/N0 śledzonych satelitów

seg-3671c8aa3c1a = identyfikatory zdarzeń mających efekt w tej chwili

seg-8401fa92aae1 = Dodanie pola nie zmienia znacznika schematu. Zmiana nazwy lub usunięcie pola albo zmiana jego znaczenia lub jednostki podnosi numer (<c1/>).

seg-656ee92a3130 = Biblioteka scenariuszy

seg-82a888587138 = <c1/>, każdy to kilkuminutowy rejs z notatką trenera w pliku TOML:

seg-665b9b46b49b = plik

seg-11ed1f85d4be = co pokazuje

seg-50ffa85a1128 = C/N0 spada jednocześnie, satelity wypadają, pozycja zostaje utracona i wraca

seg-10bc30b9c57b = poprawna, zdrowo wyglądająca pozycja znosi się o { "1.4" } km w stronę brzegu; jednolicie podniesione C/N0

seg-f141692988e4 = pozycja poprawna, UTC dryfuje o { "45" } s do przodu podczas powolnego podejścia do portu

seg-ce06a5ebdd42 = zagłuszanie, następnie przejęcie przez fałszywy sygnał ze znoszeniem i przesunięciem czasu, a potem opóźnione odtwarzanie

seg-3fbcfd1dd26a = zasłonięte niebo, a nie zakłócenia: ściany fiordu (zestaw horyzontu REPRESENTATIVE <c1/>) zasłaniają satelity na wschodzie i zachodzie, po czym kanał znów się otwiera (zdarzenie <c2/>, z tabelą <c3/>)

seg-5462f6b21fae = Pozycje, daty i tory są zmyślone; biblioteka nie zawiera żadnego prawdziwego statku, operatora ani nagrania. Nie zawiera żadnego stwierdzenia o tym, jak jakikolwiek odbiornik lub system zachowałby się wobec zakłóceń.

seg-9831ab537b36 = Wybory modelowe

seg-76a0e0eb57b3 = Generator jest narzędziem szkoleniowym bez zewnętrznej wyroczni, a jego liczby są wyborami modelowymi, a nie pomiarami żadnego odbiornika. Dobrano je tak, aby wyglądały jak zwykły dziennik odbiornika: nachylenie C/N0 o { "14" } dB od zenitu do horyzontu poniżej poziomu w zenicie (domyślnie { "47" } dB-Hz) oraz przesunięcie na satelitę +/-1.5 dB, powolne zaniki o { "0.8" } dB w ciągu { "97" } s i o { "0.5" } dB w ciągu { "31" } s, drżenie { "0.3" } dB; progi śledzenia ({ "20" } dB-Hz) i użycia ({ "28" } dB-Hz); szum pozycji ({ "1.5" } m przy HDOP { "1" }, skorelowany w ciągu { "30" } s, w pionie dwukrotnie większy); szum żyroskopu { "0.05" } stopnia i szum znoszenia { "0.03" } kn; stała czasowa sterowania { "20" } s i promienie dojścia do punktów trasy w modelu statku; oraz wybór satelitów według sektorów azymutu. Wartości domyślne znajdują się w <c1/> i <c2/> i wszystkie można zmienić w scenariuszu.

seg-84913be532a0 = Odczyt zwrotny

seg-fbf4002d25cd = <c1/> potrafi wczytać te pliki (<c2/>). Testy sprawdzają każde zdanie każdego scenariusza z biblioteki względem jego własnych reguł liczby pól i sumy kontrolnej oraz przepuszczają pliki przez ten czytnik, który interpretuje GGA, RMC i GSV, a pozostałe typy pomija, niczego nie przeskakując. Testy przypinają fragment wzorcowy dla każdego scenariusza (<c3/>); po zamierzonej zmianie wygeneruj go ponownie przez <c4/>.

seg-b94fbc3b1dd3 = <s1>Poprzednia</s1>Zaufanie morskie

seg-ecdf748cb63d = <s1>Następna</s1>Mapa zakłóceń i narażenie trasy

seg-24ad8471ff2a = pola JSON (schemat kshana-nmea-training/1)
