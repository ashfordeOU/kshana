# docs--receiver-protocols: translations (pl)

seg-99427ab75a03 = pole

seg-75e6589cf544 = Źródło: <c1/>

seg-4540630d4859 = Protokoły odbiorników odczytywane przez receiver-trust ({ "0.38" })

seg-906a5f9e6cd9 = Wyłącznie odczyt, w całości: nic tutaj nie zapisuje ani jednego bajtu do odbiornika i nie istnieje żadna ścieżka nadawcza. Oprogramowanie wyłącznie doradcze, nie jest to sprzęt nawigacyjny z zatwierdzeniem typu (IEC { "61108" }, IEC { "61162" }): za nawigację statku odpowiada nadal operator.

seg-a44353d98d6c = Własne flagi odbiornika dotyczące spoofingu i zagłuszania (UBX)

seg-b58d3a8f292c = komunikat

seg-24c57b65b8f7 = odczytywane jako

seg-bb61c4d9a33e = UBX-NAV-STATUS (0x01 0x03), { "16" } bajtów

seg-3fb608c6c3ea = bajt <c1/> przy przesunięciu { "7" }, bity { "4" }..3: <c2/>

seg-54d4cf306b49 = { "0" } nieznany lub wyłączony, { "1" } brak wskazania spoofingu, { "2" } wskazano spoofing, { "3" } wiele wskazań spoofingu (protokół { "18" } i nowszy; opis interfejsu u-blox F9 HPG { "1.32" }, sekcja { "3.15.20" })

seg-36d4d1d82f3d = UBX-SEC-SIG (0x27 0x09) wersja { "1" }, { "12" } bajtów

seg-e7e262087849 = <c1/> przy { "4" } (bit { "0" } jamDetEnabled, bity { "2" }..1 jammingState); <c2/> przy { "8" } (bit { "0" } spfDetEnabled, bity { "3" }..1 spoofingState)

seg-3e117e319518 = stany są odczytywane tylko tam, gdzie detektor jest włączony; { "0" } nieznany, { "1" } brak, { "2" } ostrzeżenie lub wskazanie, { "3" } krytyczny lub potwierdzony

seg-8a5a59761cd0 = UBX-SEC-SIG wersja { "2" }

seg-9626adf4a5e7 = <c1/> przy { "1" } (bit { "0" } jamDetEnabled, bity { "2" }..1 jammingState, bit { "3" } spfDetEnabled, bity { "6" }..4 spoofingState); <c2/> przy { "3" } i tyle 4-bajtowych grup (nieużywane)

seg-e0eb14018b2c = jak wyżej

seg-b0c1eaeb4185 = <b>Źródło układu SEC-SIG.</b> Opisy interfejsów u-blox F9 HPG { "1.32" } i M10 SPG { "5.10" }, które dało się pobrać w chwili pisania, wymieniają UBX-SEC-SIG, ale go nie definiują. Powyższe układy pochodzą z późniejszych opisów interfejsów u-blox w transkrypcji z biblioteki pyubx2 (BSD-3-Clause, <c1/> i <c2/>); testy z danymi testowymi w <c3/> są zbudowane na tym układzie, a nie na rzeczywistym wyniku odbiornika. Układ pochodzi z otwartej transkrypcji i nie został sprawdzony względem aktualnego przewodnika producenta: przed poleganiem na SEC-SIG należy go sprawdzić względem aktualnego opisu interfejsu u-blox.

seg-6af7d45be34d = SEC-SIG nie ma czasu tygodnia; należy do bieżącej epoki nawigacyjnej. Stan już odczytany w danej epoce jest zachowywany, chyba że późniejszy jest gorszy.

seg-f1cf7ee27cb1 = Porównanie <c1/>

seg-f30ddb83bf99 = Tam, gdzie dziennik zawiera te flagi, każda epoka wyniku ma <c1/> (dwa stany, czy odbiornik zgłasza flagę, czy zaalarmował jakikolwiek monitor { -brand } oraz <c2/>: <c3/>, <c4/>, <c5/>, <c6/> lub <c7/>), a wynik ma <c8/> z liczbami i pierwszą epoką każdego z nich. Odbiornik „zgłasza flagę” przy stanie { "2" } lub wyższym. Porównanie <b>nie wywołuje alarmu i nie zmienia żadnego wskaźnika</b>, a żadna ze stron nie jest prawdą odniesienia: zgodność nie jest walidacją, a niezgodność oznacza, że jeden detektor zobaczył coś, czego drugi nie zobaczył, i nic nie mówi o tym, który miał rację. Pasek w Studio odczytuje <c9/>.

seg-49ae6094c06a = Septentrio SBF (<c1/>)

seg-4d6365d9ffd1 = <c1/> dekoduje się za pomocą biblioteki <c2/> ({ "0.4" }, <b>MIT</b>; jej jedyną zależnością jest <c3/>; licencja liberalna, którą <c4/> dopuszcza). Odczytywane bloki: PVTGeodetic ({ "4007" }) dla rozwiązania pozycji, MeasEpoch ({ "4027" }) dla C/N0 na satelitę i sygnał (<c5/> to nazwa sygnału, na przykład <c6/>) oraz RFStatus ({ "4092" }) dla liczby pasm RF, których bajt <c7/> jest niezerowy (<c8/>, przenoszone i <b>nieinterpretowane</b>: nigdy nie liczy się jako flaga). Epoki są indeksowane czasem tygodnia i numerem tygodnia oraz oznaczane w czasie GPS (<c9/>). Blok, który nie przechodzi CRC lub parsowania, liczy się jako pominięty rekord. Ten czytnik nie odczytuje AGC ani wskaźnika zagłuszania, więc monitory spadku C/N0 i utraty zaczepienia działają, a monitory AGC i wskaźnika zagłuszania nie.

seg-f86f2c25f41a = <b>Źródło układów.</b> Przewodnika referencyjnego Septentrio nie dało się pobrać w chwili pisania (serwer odrzucił żądanie), więc układy wzięto ze źródeł <c1/>, które cytują ten przewodnik, a dane testowe w <c2/> to syntetyczne bloki zbudowane według tego układu i jego CRC-16-CCITT. Nie użyto żadnego rzeczywistego dziennika SBF. Układ pochodzi z otwartej biblioteki i nie został sprawdzony względem aktualnego przewodnika producenta: przed poleganiem na nim należy go sprawdzić względem przewodnika referencyjnego Septentrio.

seg-680fa4eea3f4 = Bezpośrednie wejście szeregowe i USB (<c1/>)

seg-38fcf7d91b6e = Tylko Unix. Otwiera urządzenie do odczytu, ustawia <b>lokalną</b> linię w tryb surowy przy <c1/> (domyślnie { "4800" }, szybkość NMEA { "0183" }) i odczytuje wiersze NMEA jak z każdego innego źródła. Nigdy nie zapisuje niczego do odbiornika. <c2/> jest odrzucane z wyjaśnieniem: { -brand } nie konfiguruje odbiorników; należy ustawić odbiornik na wyjście NMEA własnym narzędziem producenta, a potem go odczytać. Strumień to NMEA, jak dla każdego źródła <c3/> (UBX i SBF są odczytywane z plików). Urządzenie, które zniknie, kończy polecenie jako błąd (kod wyjścia { "1" }), aby nadzorca uruchomił je ponownie; warstwa nie łączy się ponownie. Przetestowano na pętli zwrotnej pseudoterminala (<c4/>), w tym na tym, że strona nadrzędna nie otrzymuje od polecenia żadnego bajtu.

seg-97e1ea47c2be = <s1>Poprzednia</s1>Wejścia maszynowe i z czujników

seg-55ad3fc908be = <s1>Następna</s1>Obserwatorium zakłóceń: metoda

seg-17c3203ee615 = Porównanie receiver-self-report

seg-68bc6d2e1575 = Septentrio SBF (format = "sbf")

seg-8444127e7ee6 = Bezpośrednie wejście szeregowe i USB (receiver-trust live --serial)
