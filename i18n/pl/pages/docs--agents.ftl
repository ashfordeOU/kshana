# docs--agents: translations (pl)

seg-0619151df586 = Źródło: <c1/>

seg-d0e198572cfe = Użycie Kshana z poziomu agenta AI

seg-eccd1d5fbdb2 = Dla agenta (lub osoby, która nim kieruje): które narzędzie wywołać dla jakiego pytania, co narzędzia zrobią, a czego nie, oraz co zachować przy każdej odpowiedzi. Powierzchnie i komórki, które nie są dostępne na danej powierzchni: <a1><c1/></a1>.

seg-a0354cacda4c = Połącz

seg-337d23a873f5 = Fragment wymieniający zewnętrznych klientów AI został tu pominięty; znajduje się w <a1>docs/AGENTS.md</a1> na GitHubie.

seg-01a862ed86e6 = Zasada dla każdej odpowiedzi

seg-0adf5e5ad79a = Uruchom silnik; nie zgaduj liczb. Podaj to, co zwróciło narzędzie, wraz z jednostką i poziomem dowodowym (VALIDATED względem zewnętrznej wyroczni lub MODELLED), scenariuszem, ziarnem (seed) i wersją silnika, aby przebieg można było powtórzyć. Zachowaj przy każdym wyniku jego własne zastrzeżenia.

seg-f67845b891c5 = Które narzędzie dla jakiego pytania

seg-6f4bb4962340 = Pytanie

seg-8efda304925b = Narzędzie (MCP)

seg-83d609ff5cc7 = Polecenie ukośnikowe

seg-9b937d3cbf88 = Uruchom lub wyjaśnij scenariusz PNT (orbity, GNSS, synchronizacja czasu, fuzja, Księżyc, łącza optyczne, ...)

seg-ba8b3824bba2 = Czy ten dziennik odbiornika lub NMEA tego statku były wiarygodne i kiedy przestały takie być?

seg-f3ea74f278ac = <c1/> (dowolny format dziennika), <c2/> (NMEA statku, wsadowo), <c3/> (ograniczony wycinek)

seg-aa194fda4300 = Potrzebuję syntetycznego NMEA ze zdarzeniem zagłuszania, odejścia od kursu przez opór (drag-off), spoofingu czasu lub powtórki (replay) do szkolenia

seg-0211b49536df = Pokaż wskaźnik zaufania statku w formatach monitoringu lub SIEM (Prometheus, CEF, LEEF, OTLP)

seg-701250dfa798 = Oceń dziennik odbiornika względem opublikowanego harmonogramu Jammertest (opóźnienie detekcji, niewykryte alarmy, fałszywe alarmy, czas do odzyskania) lub zamień ten plan w zdarzenia

seg-d1c81008d5f8 = Sporządź rejestr odporny na manipulacje (tamper-evident) tego, co silnik powiedział o oknie dziennika statku, albo sprawdź taki rejestr

seg-b7892674ac60 = Dane nawigacyjne których satelitów Galileo uwierzytelnia ten strumień odbiornika (OSNMA)?

seg-084a787c65cf = <b>brak: nie w MCP.</b> Użyj <c1/> (CLI), <c2/> (Python) lub <c3/> (WASM, karta OSNMA w Studio)

seg-4fc021a0a145 = nie jest poleceniem ukośnikowym

seg-0f5db62071e9 = Potrzebuję ruchu pojazdu i czasów zdarzeń scenariusza do odtworzenia w laboratoryjnym symulatorze GNSS

seg-919946a95002 = Na które wiersze wymagań ram publicznych te przebiegi dostarczają dowodów (supports evidence for) i jaka jest luka?

seg-5e08ec7f4852 = <c1/> (z tekstu wyniku), <c2/> (tabele, bez przebiegów)

seg-ff6556a46025 = Uruchomić oceniany pakiet norm (profile testowe DHS RPCF, IMO MSC.1/Circ.1575, ICAO Doc { "9849" } Appendix F) względem progów podanych przed przebiegiem?

seg-709c6501a661 = <c1/>, <c2/> (przekaż raport do <c3/>, aby otrzymać wiersze)

seg-1745cce01677 = Sprawdzić LunaNet Augmented Forward Signal (kody, SB1, format ramki) względem LNIS V5 / LSIS-AFS V1.0 albo sprawdzić strumień symboli?

seg-d4d2e950054c = <c1/> (<c2/> spec, symbols lub generate); LDPC i CRC-24Q podramek { "2" } do { "4" } nie są zweryfikowane

seg-86c207c3996e = Powiązać przebieg laboratoryjny (scenariusz, podane warunki testu, dziennik odbiornika, wynik) w jednym podpisanym pakiecie?

seg-25bb29e6aa3d = <c1/> po <c2/> (<c3/>)

seg-3856b38bb9d2 = Ocenić zgłoszenie detekcji lub holdover względem pliku prawdy odniesienia kshana-bench albo wyrenderować pliki wyników jako stronę rankingu?

seg-87e686c064ce = Potrzebuję scenariusza, który przeleci trasą GeoJSON (terrain-nav, terrain-slam, gravity-map, combined-altpnt)

seg-bf72fff11d84 = Które satelity widzi użytkownik na ulicy, w porcie, we fiordzie lub na terminalu kontenerowym i jakie są DOP oraz elipsa błędu?

seg-86eb2756fd7f = <c1/> (żądanie lub <c2/>); sekcja <c3/> scenariusza przez <c4/> (<c5/> i <c6/> wymagają <c7/>)

seg-bd7f9d7e8e27 = Gdzie GNSS wyglądał na pogorszony i jak duża część tej trasy w tym leży?

seg-908b6e65372f = <c1/>, następnie <c2/>

seg-1f715d5e0c4f = Nagrania IQ GNSS (scena, akwizycja, śledzenie, tor wejściowy, kampanie)

seg-5569efd18c6b = Najpierw <c1/>, potem narzędzia <c2/>

seg-d44650438742 = Umiejętności (skills) <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/> i <c7/> zawierają poniższe zasady dla agentów, które wczytują umiejętności.

seg-a4de5a40b743 = Czego nie zrobi żadne z narzędzi

seg-3f27662a983e = <b>Odczyt lub zapis plików.</b> Treść jest wbudowana: dane wejściowe to tekst w żądaniu, ograniczony do { "4" } MiB, a pole scenariusza wskazujące plik jest odrzucane. Tylko narzędzia <c1/> sięgają do folderu, i tylko tego wskazanego przez <c2/>, a każda ścieżka jest w nim zamknięta.

seg-3efe81d26cad = <b>Weryfikacja OSNMA.</b> Nie ma narzędzia MCP: dane wejściowe to długi surowy strumień odbiornika (strony I/NAV lub zapis UBX), który nadaje się do CLI i Pythona, a narzędzie przyjmujące taki strumień dodałoby dużą powierzchnię na duże dane bez żadnej korzyści. Skieruj użytkownika do <c1/> (lub do Pythona <c2/>). Cokolwiek mówi jego wynik, przekaż doradczą uwagę dosłownie: wyłącznie status uwierzytelnienia, nie jest to usługa integralności nawigacji, nie jest to sprzęt nawigacyjny z zatwierdzeniem typu i nie ma żadnego twierdzenia o skuteczności przeciw spoofingowi; wynik ma znaczenie tylko z korzeniem Merkle'a lub kluczem publicznym, który użytkownik uzyskał inną drogą.

seg-b13a75d08152 = Uruchomienie procesu.

seg-9dfcbee6fdb8 = <c1/> jako działający strumień (z bramką i <c2/>), eksportery telemetrii (<c3/>: Prometheus, syslog, OTLP) oraz strumieniowanie szkoleniowego NMEA pod adres są dostępne tylko z wiersza poleceń. <c4/> ocenia wycinek tym samym silnikiem i nie zapisuje na żaden port. Narzędzia wycinków zwracają JSON-lines na żywo w schemacie { "1.3" } (uwaga <c5/> i <c6/> satelitów przy każdej epoce, <c7/> przy każdej dedukcji); CSV przebiegu statku zaczyna się wierszem komentarza <c8/> niosącym to samo zdanie, więc odczytaj go z opcją komentarza. <c9/> i <c10/> wiążą adres pętli zwrotnej (loopback), o ile nie powiedziano inaczej.

seg-ac51aad84893 = Zapis sygnału.

seg-ad032dee3fd3 = <c1/> zwraca ruch pojazdu i oznaczone przedziały zdarzeń jako tekst; nic z tego, co zwraca, nie jest sygnałem radiowym ani pasma podstawowego, nie jest jego modelem ani go nie steruje, a zdarzenie nie jest przepisem na wytworzenie zakłóceń. Podaj jego <c2/> wraz z plikami; symulator i jego operator odpowiadają za uruchamianie ich wyłącznie tam, gdzie jest to dozwolone.

seg-39f3aae1143a = Powiedzenie więcej, niż mówi mapowanie.

seg-ed04b567fc87 = <c1/> podaje, na które wiersze ram dostarcza dowodów (supports evidence for) zestaw przebiegów, wraz z luką każdego wiersza. Nigdy nie mówi, że ramy zostały spełnione ani że produkt został oceniony lub zatwierdzony; przekaż jego <c2/> dosłownie i mów „dostarcza dowodów na (supports evidence for)”, nic mocniejszego. Czyta tekst wyniku i scenariusza, który przekażesz, nigdy ścieżkę.

seg-eda73a8fcbfe = <b>Pobieranie danych.</b> Pobranie wielokątów lądu jest dostępne tylko z wiersza poleceń i wymaga <c1/>. Plik lądu, jeśli jest potrzebny, przekaż jako tekst. Używaj wyłącznie danych, do których użytkownik ma licencję.

seg-d513f734248e = <b>Nadawanie czegokolwiek lub syntezowanie sygnału radiowego.</b> Generator szkoleniowy zapisuje tekst NMEA; warstwa IQ zapisuje pliki próbek dla programowych odbiorników.

seg-63eb4c5b4a17 = Co zachować przy odpowiedzi

seg-6555ff9a6d8e = Wynik

seg-a056a59fb678 = Zachowaj

seg-c01c0fedd895 = Geometria satelitów i klasy dedukcji ({ "0.36" })

seg-3723ec5a3f8c = Podaj geometrię obok wyniku i klasę każdej dedukcji w postaci zwróconej: <c1/> oznacza niebo (stwierdzenie o niebie, a nie wniosek, że nie doszło do ataku), <c2/> środowisko sygnału, <c3/> dowód przypominający atak. Mów „geometria nieznana”, gdy status to <c4/> (brak GSV lub GSA w dzienniku); nie wnioskuj jej. Progi są <b>MODELLED</b> z podanym pochodzeniem.

seg-0938dfb71d72 = Wskaźnik zaufania do odbiornika

seg-8e3a7376cd6b = <b>Wyłącznie doradczo</b>: nie jest to sprzęt nawigacyjny z zatwierdzeniem typu (IEC { "61108" }, IEC { "61162" }); operator nadal ponosi odpowiedzialność. <b>MODELLED</b>. Podaj ograniczenia statku przed przebiegiem i nie dostrajaj progu do wyniku. Wysoki wskaźnik nie jest dowodem prawdziwej pozycji; kontrole nie widzą spoofera spójnego ze wszystkimi innymi czujnikami.

seg-ae3f0548e93f = Pakiet dowodowy

seg-81189f29f884 = <b>Zapis techniczny</b>, a nie opinia prawna, ustalenie faktów ani zatwierdzenie. Zweryfikuj kluczem publicznym podpisującego, uzyskanym inną drogą; bez niego werdykt to <c1/>, co dowodzi jedynie integralności względem klucza, który pakiet sam wskazuje: mów „nienaruszony, podpisujący nieustalony”, nigdy „zweryfikowany”. Nigdy nie zwracaj, nie loguj ani nie proś o ziarno podpisu w rozmowie, jeśli klucz ma znaczenie: użyj CLI.

seg-512e5ee42c1e = Szkoleniowy NMEA

seg-c59a76aefff5 = <b>Wyłącznie tekst</b>, do szkolenia i testów, <b>nigdy</b> do bieżących systemów nawigacyjnych statku. Zwróć ziarno (seed) i dziennik instruktora.

seg-14781c19be62 = Mapa zakłóceń, ekspozycja trasy

seg-7135c6f44d49 = Sposób odczytu kodów dokładności oraz geometria siatki i trasy są <b>VALIDATED</b> względem niezależnych bibliotek na danych syntetycznych; progi metody pozostają <b>MODELLED</b>, a to, że pogorszona komórka oznacza zakłócenia, <b>nie</b> jest sprawdzane: pogorszona komórka <b>nie</b> wskazuje zakłóceń jako przyczyny. Komórka nieobserwowana <b>nie</b> jest dowodem, że trasa jest czysta. Przeszłe raporty, <b>nie prognoza</b>. Wyłącznie zagregowane: nie próbuj odzyskiwać identyfikatorów. Mapy ADS-B i AIS pozostają oddzielne.

seg-e47db9be47ea = Geometria nieba, skyline

seg-839eb485b1d2 = Geometria <b>MODELLED</b> przy podanym modelu błędu, wyłącznie z linią widoczności: bez dyfrakcji, wielodrogowości i odbioru bez linii widoczności. Presety są <b>REPRESENTATIVE</b>, a nie pomiarami terenowymi; przekaż pochodzenie presetu. Konstelacje presetów to reprezentatywne niebo, a nie niebo danej daty. Elipsa skaluje podane UERE: nie jest to zmierzona dokładność ani granica integralności. Zachowaj <c1/>.

seg-0002a3dc682e = Dostępność łącza optycznego (<c1/>, { "0.37" })

seg-1098f908d9dc = <b>MODELLED</b>, doradczo. Klimaty chmur są podanymi danymi wejściowymi, a nie zbiorem danych, i nie porównano ich z żadnym zmierzonym zapisem dostępności: mów „przy tych założeniach”, nigdy „dostępność w tym miejscu”. Zachowaj <b>pułap</b> miejsca (<c1/>: to, czego nie podnosi żaden zapas) obok jego dostępności i powiedz, które zyski technik są danymi wejściowymi (Kshana nie modeluje pętli optyki adaptacyjnej). Obliczenia są sprawdzone względem niezależnego programu, co sprawdza implementację wzorów, a nie atmosferę.

seg-3324b2e2021e = Test holdover (<c1/>, { "0.38" })

seg-9177789844f7 = <b>MODELLED</b>, doradczo. Mów „zmierzone względem maski”, nigdy że zegar lub system spełnia Zalecenie albo został względem niego zatwierdzony. Dwa momenty (GNSS odłączony, GNSS przywrócony) to <b>oświadczenie operatora</b>: Kshana niczego nie odłączała ani nie przywracała i nie może ich zweryfikować, więc cytuj je tak, jak podano. Maska, dla której zapis jest zbyt krótki, jest <b>INCOMPLETE</b>, nigdy zaliczona. Dziennik serwa (linuxptp, chrony) to błąd pod kontrolą serwa, a nie niezależny pomiar względem UTC; powiedz, z którego zapisu pochodzą wartości. Zobacz <c1/>.

seg-18d3f2b50d0a = Dowolny wynik scenariusza

seg-aab46d50d125 = Podane przez niego <c1/> lub <c2/> oraz wiersz pochodzenia.

seg-166f773b2804 = Granice

seg-203a91deb52c = Używaj danych syntetycznych lub własnych danych użytkownika. Nie wymieniaj w wynikach osób, statków ani organizacji, których nie było w danych wejściowych użytkownika. Kshana jest narzędziem analitycznym i szkoleniowym, a nie produktem lotniczym ani nawigacyjnym.

seg-ec064f62f7dc = <s1>Poprzednia</s1>Serwer MCP: tryb HTTP hostowany samodzielnie

seg-1f44dbd65ce3 = <s1>Następna</s1>Gdzie każda możliwość jest dostępna

seg-e3949a1e6082 = Obszar emitera (<c1/>)

seg-46b2efcb9bec = <b>MODELLED</b>: obszar dopuszczalny przy łączności radiowej w linii wzroku, a nie pozycja. Podawaj obszar z jego deklarowanym poziomem ufności wraz z centroidem i jego elipsą, nigdy sam centroid; pisz <c1/>, gdy dane go nie zawężają; pisz, że jest zależny od modelu (sprawdzono tylko na danych syntetycznych; porównanie z Jammertest zarejestrowane wstępnie uruchomiono raz i dla obu źródeł było ono NOT ASSESSABLE, więc nic nie zostało przetestowane zewnętrznie). Neutralne sformułowanie: „szacowany obszar emitera”; nigdy nie nazywaj ani nie sugeruj, kto lub co stoi za źródłem, państwa, sił ani zamiaru. Tylko zbiorczo; nie próbuj odzyskiwać identyfikatorów. Publikowanie obszarów emiterów w publicznym obserwatorium jest wyłączone.
