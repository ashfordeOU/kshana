# docs--osnma: translations (pl)

seg-fcd0ebea49bc = Wiersz poleceń

seg-6816f4e1a0a0 = Wersja

seg-94058315dfe4 = Dane wejściowe

seg-23746ba370c2 = Źródło: <c1/>

seg-1e9c104231db = Weryfikator OSNMA dla Galileo po stronie odbiornika

seg-17fd702f5997 = Weryfikator po stronie odbiornika dla uwierzytelniania komunikatu nawigacyjnego Galileo Open Service (OSNMA), w czystym Rust. Czyta strony I/NAV i podaje dla każdego satelity i każdej epoki, czy dane nawigacyjne są uwierzytelnione kryptograficznie, oraz dlaczego sprawdzenie się nie powiodło.

seg-ae081f55c4f1 = <b>Wyłącznie doradczo.</b> To wynik analizy i monitorowania, a nie sprzęt nawigacyjny z zatwierdzeniem typu. Podany tu stan uwierzytelnienia nie jest usługą integralności nawigacji i nie może być jedyną podstawą żadnej decyzji nawigacyjnej ani dotyczącej bezpieczeństwa.

seg-84d7260098b1 = UWAGA: własność intelektualna w interfejsie Galileo OSNMA

seg-6d78ccef53d5 = Kshana nie udziela żadnych praw do własności intelektualnej Unii Europejskiej w dokumencie kontroli interfejsu sygnału w przestrzeni Galileo OSNMA („ICD IPRs”). ICD zawiera własne upoważnienie (jego Aneks E), które jest niewyłączne i bezpłatne oraz ma własne warunki, zakres i ograniczenia. Każdy, kto używa, buduje lub rozpowszechnia oprogramowanie oparte na tym module, opiera się bezpośrednio na tym upoważnieniu i musi samodzielnie przeczytać i zaakceptować jego warunki. Licencja Kshana (AGPL-3.0-only lub licencja komercyjna) obejmuje wyłącznie własny kod Kshana.

seg-c13ad334bf9a = Ten moduł implementuje algorytmy opisane w poniższych dokumentach. Tekst ICD nie jest powielany; wartości liczbowe (układy pól, wyliczenia, tablica przeglądowa MAC) są wyrażone na nowo w notacji Kshana, ze źródłem przytoczonym w kodzie. ICD i Receiver Guidelines są © Unia Europejska; źródło jest tu wskazane. Kshana nie jest rozwijana, używana, zatwierdzana ani popierana przez Unię Europejską, Komisję Europejską, EUSPA ani żaden inny organ.

seg-860096b04999 = Dokumenty odniesienia

seg-04c1e1a6278d = Opublikowane przez European GNSS Service Centre.

seg-278dd0f9df58 = Dokument

seg-3427e40d7bee = Data

seg-54d15cb428d3 = Galileo OSNMA Signal-in-Space ICD („SIS ICD”)

seg-f63fbc1175cf = Wydanie { "1.1" }

seg-fa85e4db2c93 = październik { "2023" }

seg-b89aa2b88558 = Galileo OSNMA Receiver Guidelines

seg-907e4e46056c = Wydanie { "1.3" }

seg-a9b75bc7f063 = styczeń { "2024" }

seg-530ae6421157 = Numery sekcji i tabel przytaczane w kodzie i tutaj odnoszą się do tych wersji.

seg-143726cc3d5f = Co jest weryfikowane

seg-029a9bb7608f = Łańcuch zaufania, od korzenia do danych:

seg-886f1b6556ce = <b>Klucz publiczny (ICD { "3.2.2" }, { "6.2" }).</b> DSM-PKR jest składany z bloków, a jego ścieżka Merkle'a jest przechodzona do zaufanego korzenia Merkle'a (SHA-256).

seg-27b4935fe47b = <b>KROOT (ICD { "3.2.3" }, { "6.3" }).</b> DSM-KROOT jest składany; jego podpis ECDSA (P-256/SHA-256 lub P-521/SHA-512) jest sprawdzany względem klucza publicznego, który wskazuje, na nagłówku NMA i parametrach łańcucha.

seg-acc1f06cf63a = <b>Klucze TESLA (ICD { "5.5" }, { "6.4" }).</b> Każdy klucz w komunikacie MACK jest cofany do KROOT lub do wcześniejszego zweryfikowanego klucza, funkcją skrótu łańcucha.

seg-274285216a96 = <b>MACSEQ (ICD { "4.1.2" }, { "6.6" }).</b> Elastyczne pola Tag-Info są sprawdzane względem MACSEQ kluczem, który otwiera ten MACK.

seg-41ba810d7c8d = <b>Znaczniki (ICD { "4.2" }, { "6.7" }).</b> Każdy znacznik jest liczony na nowo (HMAC-SHA-256 lub CMAC-AES, obcięty do długości znacznika łańcucha) z tożsamości satelitów, czasu podramki, pozycji znacznika, stanu NMA i danych nawigacyjnych, które obejmuje, a następnie porównywany. Obsługiwane są ADKD { "0" } (efemerydy, zegar i stan), ADKD { "4" } (parametry czasu) i ADKD { "12" } (wolny MAC, klucz publikowany dziesięć podramek później), z uwierzytelnianiem krzyżowym satelitów, które same nie niosą OSNMA, oraz znaczniki zastępcze (COP { "0" }).

seg-1be16a4ca722 = Znacznik, który wskazuje wartość zarezerwowaną lub którego ADKD nie pasuje do pozycji w tablicy przeglądowej MAC, jest odkładany na bok (Receiver Guidelines każą go odrzucić) i zgłaszany jako <c1/>, a nie jako niepowodzenie.

seg-eb993b3a0d17 = Strony są sprawdzane względem ich CRC (CRC-24Q Galileo) przed czymkolwiek innym; strona, która tego nie przejdzie, jest odrzucana i zgłaszana (<c1/>).

seg-c414a30d0840 = Wartości stanu

seg-268f61b565b9 = Dla każdego znacznika: <c1/>, <c2/> z powodem (<c3/>, <c4/>, <c5/>, <c6/>), <c7/> z powodem (<c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>) albo <c15/>. Znacznik zastępczy (COP { "0" }) jest na poziomie znacznika pokazywany jako <c16/>, ponieważ dowodzi klucza, ale nie obejmuje żadnych danych nawigacyjnych i nigdy nie liczy się dla satelity.

seg-331a6ab821f3 = Dla każdego satelity, w postaci, którą zużywa monitor zaufania do odbiornika:

seg-9912068c5b34 = <c1/> tylko dopóki najnowsze zweryfikowane dane efemeryd i zegara (ADKD { "0" } lub

seg-38e7f56293e7 = tego satelity są świeże (domyślnie w granicach { "600" } s od czasu weryfikatora) i są nadal używanymi danymi. Sprawdzane są dane, a nie IODnav: weryfikator przechowuje SHA-256 uwierzytelnionego ciągu bitów (typy słów { "1" } do { "5" }, które obejmuje ADKD { "0" }) oraz najnowszego takiego ciągu wysłanego przez satelitę i muszą być równe. Skopiowany IODnav nad innymi słowami albo zmienione bity typu słowa { "5" } (które nie niosą IODnav) dają <c1/>, dopóki nowe dane się nie uwierzytelnią. Podramka, która niesie słowa efemeryd, ale nie pełny zestaw typów słów { "1" } do { "5" } pod jednym IODnav, odbiera status w ten sam sposób (każda prawdziwa podramka E1-B niesie wszystkie pięć); podramka bez żadnych słów efemeryd nie mówi nic. Znaczniki innego satelity (uwierzytelnianie krzyżowe) liczą się dla satelity, którego dane obejmują.

seg-233109ef4428 = <c1/>, gdy sprawdzenie danych satelity nie powiodło się w okresie pamięci niepowodzeń (domyślnie { "600" } s czasu weryfikatora), nawet jeśli późniejsze dane przejdą weryfikację. Niezgodność jest przypisywana satelicie, którego dane obejmuje znacznik, i satelicie, który nadał znacznik, ponieważ wina może leżeć po którejkolwiek stronie; niezgodność MACSEQ jest przypisywana satelicie nadającemu.

seg-8ba1d89bcf91 = <c1/> w pozostałych przypadkach oraz dla każdego satelity po zweryfikowanym komunikacie alarmowym, przy stanie NMA „don't use” lub stanie zarezerwowanym, i do czasu zweryfikowania pierwszego klucza.

seg-7fceea6e23f8 = Wartość ogólna to <c1/>, jeśli którykolwiek satelita zawiódł, <c2/>, jeśli co najmniej jeden jest uwierzytelniony i żaden nie zawiódł, w przeciwnym razie <c3/>. <c4/> to odpowiadające zdanie; <c5/> je buduje.

seg-446a3218ccbb = Czas

seg-18e91e6aa160 = Łańcuch kluczy pokazuje, że klucz należy do danej podramki, a nie że podramka jest bieżąca. Weryfikator nigdy więc nie bierze „teraz” z niezweryfikowanej strony. Jego czasem jest późniejszy z czasu odniesienia podanego przez <c1/> (<c2/>) i podramki ostatniego zweryfikowanego klucza TESLA (klucz nie może być znany przed swoim slotem, więc dowodzi, że czas nie jest wcześniejszy). Pamięć niepowodzeń, okno ważności uwierzytelnienia i usuwanie starych danych działają według tego czasu. Podramka opatrzona znacznikiem czasu o więcej niż trzy podramki późniejszym niż ostatni zweryfikowany klucz jest odkładana, chyba że jej własny klucz dowodzi jej czasu; zawarte w niej komunikaty kluczy i alarmowe są nadal przetwarzane, ponieważ niosą własny dowód (podpis lub korzeń Merkle'a).

seg-318323322a3a = Zegar stoi w miejscu, gdy OSNMA przestaje działać, ponieważ poruszają go tylko klucze. Wywołujący na żywo musi wywoływać <c1/> z czasem hosta w każdej podramce; uwierzytelnienie wygasa wtedy samo, a <c2/> (uruchamiane również z każdą podramką) zwraca zdarzenie <c3/>, gdy żaden klucz nie został zweryfikowany dłużej niż okno uwierzytelnienia.

seg-5338d8f5de77 = Czego to nie zapewnia, to świeżość. Bez czasu odniesienia ze źródła, którego atakujący nie może przesunąć, powtórzenie starych autentycznych danych pod starymi znacznikami czasu się uwierzytelnia, a znaczniki czasu stron są tyle warte, co ich źródło: CLI mówi o tym (<c1/>) zawsze, gdy nie podano czasu odniesienia. Przy czasie odniesienia tolerancja jest mniejsza niż jedna podramka (domyślnie { "29" } s; większe wartości są odrzucane). Czas odniesienia to pojedynczy moment: podramki dalsze od niego niż tolerancja są odkładane i liczone, więc nadaje się do danych na żywo lub dopiero co nagranych, a nie do długiego nagrania. Dla nagrania pomiń czas odniesienia i odczytuj wynik jako „autentyczne, niekoniecznie świeże”. Formalne wymaganie podają Receiver Guidelines.

seg-aa37ce329914 = Znaczniki czasu stron strumienia u-blox pochodzą z samych nieuwierzytelnionych danych (zob. Wejście), więc również nie zapewniają ochrony świeżości.

seg-a33d72076025 = Łańcuchy, klucze i alarmy

seg-be2d9588df65 = Zweryfikowane łańcuchy są przechowywane według identyfikatora łańcucha (CID); znaczniki są sprawdzane łańcuchem, który wskazuje nagłówek NMA, a nagłówek wskazujący łańcuch, który nie został zweryfikowany, zostawia znaczniki podramki niesprawdzone (<c1/>). Drugi KROOT łańcucha obowiązującego dodaje kotwicę; KROOT innego łańcucha jest zachowywany obok, więc ponowne ogłoszenie starego łańcucha po odnowieniu nie cofa nowego.

seg-bbb6574fa258 = Nagłówek NMA nie jest uwierzytelniony, więc to, co ogłasza, liczy się tylko po potwierdzeniu: gdy więcej niż jeden satelita wysyła ten sam nagłówek w podramce albo gdy niesie go podpisany komunikat zweryfikowanego KROOT (nagłówek jest częścią tego komunikatu). Te dwa przypadki nie są równe. Zgodność więcej niż jednego satelity chroni przed anomalią pojedynczego satelity, a nie przed spooferem: jeden spoofer może sfałszować dwa identyfikatory satelitów. Zyskuje na tym odmowę usługi i nic więcej, ponieważ potwierdzone „don't use” czyści uwierzytelnione dane każdego satelity: jego zdjęcie, sfałszowane lub prawdziwe, niczego nie przywraca, dopóki nowe znaczniki nie zostaną zweryfikowane w prawdziwych podramkach operacyjnych. (Przed tym czyszczeniem sfałszowane zdjęcie mogło przywrócić na czas do okna uwierzytelnienia dane, które już się uwierzytelniły.) Prawdziwym potwierdzeniem jest nagłówek podpisany przez KROOT, który też ponownie zdejmuje „don't use”, gdy niesie stan operacyjny. Nagłówek pojedynczego satelity zmienia jedynie sprawdzanie znaczników jego własnej podramki. KROOT, którego czas obowiązywania nie jest późniejszy niż czas łańcucha przechowywanego dla tego samego identyfikatora (powtórzenie starszego), jest odrzucany (<c1/>); KROOT tego samego łańcucha dodaje kotwicę.

seg-5c08dbaa8d43 = Stan potwierdzonego nagłówka i wartość CPKS sterują unieważnianiem. Przy stanie NMA „don't use” CPKS „chain revoked” usuwa łańcuch wskazany przez nagłówek i od tej chwili odrzuca jego KROOT; CPKS „public key revoked” usuwa klucz publiczny, który podpisał ten łańcuch, oraz każdy łańcuch przez niego podpisany. Jeśli łańcuch zastępczy dla tego identyfikatora został przyjęty przed potwierdzeniem nagłówka, jakkolwiek dawno, unieważniany jest klucz poprzedniego łańcucha, a nie nowego; ta pamięć jest zachowywana do wykonania unieważnienia lub potwierdzenia nagłówka innej procedury, a nagłówek unieważnienia powtarzany w każdej podramce jest wykonywany raz. Te same wartości CPKS przy stanie operacyjnym oznaczają przejście do zastępstwa i niczego nie unieważniają. Sam nagłówek nie jest uwierzytelniony, więc sfałszowane unieważnienie może tylko odebrać uwierzytelnienie i jest ostateczne do ponownego uruchomienia weryfikatora. Ta ostateczność obejmuje też klucz bieżący: sfałszowane unieważnienie klucza publicznego zeruje pamięć klucza zastąpionego i unieważnia klucz używany, a cofa to tylko ponowne uruchomienie.

seg-e7d43eb18c24 = DSM-PKR z NPKT { "4" } jest komunikatem alarmowym; jest weryfikowany przez drzewo Merkle'a jak klucz, a jego losowe pole NPK jest częścią liścia. Zweryfikowany alarm czyści wszystkie łańcuchy i klucze publiczne, odrzuca każdy późniejszy KROOT i klucz publiczny oraz ustawia każdego satelitę na <c1/>, jak nakazują Receiver Guidelines, do ponownego uruchomienia weryfikatora.

seg-4068e9bda7c1 = Pole wypełnienia DSM-KROOT jest skrótem podpisanego komunikatu i podpisu. Jest sprawdzane przed podpisem i mówi też, z jakim nagłówkiem NMA zbudowano podpisany komunikat, gdy nagłówek zmienił się w trakcie składania komunikatu.

seg-8ea31bf25ef0 = Co nie jest weryfikowane lub nie jest ćwiczone

seg-3d0808cab632 = <b>Świeżość.</b> Zob. Czas powyżej: wymaga czasu odniesienia z zewnątrz.

seg-b3d63950baa4 = <b>Odnowienie i unieważnienie.</b> Łańcuchy i klucze są śledzone tak, jak ćwiczą to strumienie opublikowanych wektorów (odnowienie, koniec łańcucha, unieważnienie łańcucha i klucza, nowy klucz publiczny, nowe drzewo Merkle'a, alarm), a nie każdy przypadek, który dopuszcza ICD. Unieważnienie ogłoszone przez nieuwierzytelniony nagłówek jest przyjmowane na słowo i jest ostateczne dla sesji. Nowe drzewo Merkle'a jest podejmowane tylko przez korzeń Merkle'a przekazany weryfikatorowi.

seg-f01d90a44585 = <b>Skrót drzewa Merkle'a.</b> Komunikaty DSM-PKR są sprawdzane drzewem SHA-256. Drzewo SHA3-256, które ICD dopuszcza w przyszłości, nie jest obsługiwane. Funkcją skrótu łańcucha może być SHA-256 lub SHA3-256.

seg-d9ca4e69ffc9 = <b>Listy stanu kluczy.</b> Unieważnienia są śledzone przez nagłówek NMA i komunikaty w strumieniu; listy unieważnionych certyfikatów nie są czytane.

seg-73e0b16d03c7 = <b>Pokrycie uwierzytelnionych danych.</b> ADKD { "4" } z COP { "1" } wysłane w nieparzystej podramce nie może się uwierzytelnić (typ słowa { "10" } może być wysłany jedną lub dwie podramki wcześniej); kosztuje to tylko dostępność, nigdy poprawność.

seg-acc28dcced83 = <b>Działanie w stałym czasie.</b> Niezapewnione i niepotrzebne: weryfikator nie przechowuje żadnych sekretów (tylko klucze publiczne, opublikowane klucze łańcucha i odebrane dane).

seg-b2f8ec90ae39 = <b>Jakość sygnału i danych.</b> Strony są sprawdzane CRC, a strony alarmowe odrzucane, ale nic nie wiadomo o sygnale, na którym dotarły. Odzyskiwanie Reeda-Solomona słów I/NAV { "1" } do { "4" } nie jest używane: dane muszą być odebrane bezpośrednio.

seg-97313ba2bf88 = <b>To nie jest usługa integralności pozycji.</b> Uwierzytelnienie mówi, że dane pochodzą z systemu. Nie mówi nic o sygnale, na którym dotarły, ani o jakości pozycji.

seg-d696f298c4a2 = <b>Format stron zwykłych.</b> Jedna para stron na wiersz: <c1/>, komentarze <c2/> dozwolone. <c3/> to GST w sekundach (<c4/>) na początku strony; szesnastkowe to { "240" } bitów połówek parzystej i nieparzystej (łącznie z ogonami), najstarszy bit pierwszy.

seg-e436d96b12cf = <b>CSV wektorów testowych.</b> Układ opublikowanych wektorów (<c1/>). Czas początku pochodzi z <c2/> lub z nazwy pliku z datą.

seg-72132e3796bc = <b>u-blox UBX-RXM-SFRBX.</b> Surowy strumień bajtów UBX (<c1/>, wykrywany automatycznie). Komunikaty Galileo E1-B I/NAV są odbudowywane w pary stron (<c2/>); inne systemy, E5b, strony alarmowe i ramki ze złą sumą kontrolną są ignorowane. SFRBX nie niesie czasu, więc każda strona dostaje znacznik czasu z czasu zawartego w jej własnych danych (typy słów { "5" } i { "0" }) i jest przyjmowana tylko wtedy, gdy kolejne strony niosące czas zgadzają się z liczbą stron odebranych między nimi; strony, których nie da się umiejscowić, są odrzucane, nigdy zgadywane. Ten czas pochodzi z samych danych i nie zapewnia ochrony świeżości (zob. Czas powyżej). Identyfikator sygnału { "0" } (E1-C) nie niesie danych, więc przyjmowanie go obok E1-B jest nieszkodliwe. Zbłąkana para synchronizacji z absurdalną długością nie zatrzymuje czytnika. Kod ramkowania jest trzecią kopią ramkowania UBX w drzewie (<c3/>, wczytywanie zaufania do odbiornika); jest trzymany osobno, aby zachowanie zaufania do odbiornika nie uległo zmianie, a cała trójka mogłaby później współdzielić jeden czytnik. Układ słów komunikatu SFRBX pochodzi z publicznych opisów i został sprawdzony tylko na ramkach syntetycznych, a nie na żywym odbiorniku.

seg-47118a577876 = Wynik tekstowy podaje stan dla każdego satelity oraz, z <c1/>, dla każdego znacznika i epoki; <c2/> podaje to samo z listą znaczników. Status wyjścia { "3" } oznacza, że sprawdzenie danych któregoś satelity nie powiodło się, a { "2" } oznacza błąd użycia lub wejścia. Wzmianka doradcza powyżej jest drukowana jako pierwsza na każdej ścieżce, także przy błędach i w użyciu.

seg-e2af23b756f5 = Z Pythona i WebAssembly

seg-4edf83a818d1 = <c1/> (Python) i <c2/> (WebAssembly) uruchamiają ten sam weryfikator na bajtach w pamięci i zwracają JSON, który drukuje <c3/>, łącznie z wzmianką doradczą. Serwer MCP go nie zawiera: wejściem jest długi surowy strumień odbiornika, lepiej obsłużony przez wiersz poleceń i Pythona, a narzędzie agenta dodałoby dużą powierzchnię wejścia bez żadnej korzyści. Obowiązuje ta sama wzmianka doradcza i te same ograniczenia; stan nie jest usługą integralności nawigacji.

seg-0987c3b00a14 = Testy i dane testowe

seg-2acc9fa7212b = Dane testowe są syntetyczne i generowane przez własny kod i testy Kshana. W tym repozytorium nie przechowuje się żadnych wektorów ICD ani Guidelines, przykładów obliczeń ani materiału kluczowego. Domyślne testy (<c1/> i testy jednostkowe) budują łańcuch, strony i znaczniki z równań oraz sprawdzają spójność i to, że celowe uszkodzenie jest wychwytywane: przestawiony bit nawigacyjny, przestawiony bit klucza, powtórzone znaczniki, złe znaczniki czasu, czas poza odniesieniem, brakujące dane oraz ataki, które wykazał przegląd (sfałszowana podramka z dalekiej przyszłości, która nie może wymazać niepowodzenia, uwierzytelnienie, które musi wygasać i podążać za IODnav, alarm, stan NMA „don't use”, znaczniki zastępcze, niezgodność MACSEQ, konfliktujące klucze, unieważnienie i odnowienie łańcucha, zły padding lub podpis), z CMAC-AES, łańcuchem SHA3-256 i podpisem P-521 przeprowadzonymi przez weryfikator. Ponieważ dane te pochodzą z naszej własnej lektury ICD, pokazują wewnętrzną spójność, a nie spełnianie wymagań ICD.

seg-4906b14a33a3 = Prymitywy są sprawdzane względem opublikowanych testów z odpowiedziami wzorcowymi, z których żaden nie pochodzi z ICD: RFC { "4231" } (HMAC-SHA-256), RFC { "4493" } (CMAC-AES-128), FIPS { "197" } (AES), FIPS { "202" } (SHA3-256) i RFC { "6979" } (ECDSA P-256). Podpisy P-521 są sprawdzane pod kątem kodowania i wyboru skrótu przy użyciu jednorazowego klucza wytworzonego w teście; arytmetyka krzywej pochodzi z biblioteki.

seg-82ee90adf7ed = Spełnianie wymagań sprawdza <c1/>, który jest opcjonalny: czyta kopię oficjalnego archiwum wektorów testowych, które pobierasz samodzielnie, z katalogu wskazanego przez <c2/>, i nic nie robi, gdy zmienna nie jest ustawiona. Niczego nie przechowuje ani nie rozpowszechnia, a domyślne przebiegi testów nie używają sieci. Daje weryfikatorowi tylko korzeń Merkle'a i klucze publiczne jednego drzewa, tak jak miałby odbiornik, więc łańcuchy są ustanawiane z podpisanego DSM-KROOT w strumieniu i działa cała ścieżka: Merkle, podpis, łańcuch kluczy, MACSEQ i znaczniki. Dla każdego zestawu wektorów orzeka: dolną granicę uwierzytelnionych znaczników, brak niepowodzeń, jakie łańcuchy i klucze ogłasza strumień, uwierzytelnione znaczniki ADKD { "0" }, { "4" } i { "12" }, że uwierzytelnianie wznawia się po końcu łańcucha, unieważnieniu łańcucha, unieważnieniu klucza i nowym kluczu publicznym, że komunikat alarmowy się weryfikuje i nie zostawia niczego uwierzytelnionego, oraz że każdy wektor używa tylko HMAC-SHA-256, łańcucha SHA-256, kluczy 128-bitowych, znaczników 40-bitowych i pozycji tablicy przeglądowej { "33" } i { "34" }. Inne wybory algorytmów i parametrów z ICD są więc pokryte tylko przez testy z odpowiedziami wzorcowymi i testy syntetyczne powyżej.

seg-70bb026ce655 = Zależności

seg-00a3dd901039 = Crate'y RustCrypto, czysty Rust, MIT OR Apache-2.0, budowane bez domyślnych funkcji: <c1/>, <c2/>, <c3/>, <c4/>, <c5/> i <c6/> (funkcja <c7/>, używana tylko do weryfikacji), obok <c8/> już obecnego w drzewie. Budują się dla <c9/> i przechodzą <c10/>.

seg-7ab62b91d469 = <s1>Poprzednia</s1>Zaufanie jako telemetria bezpieczeństwa

seg-5dc48294fbb2 = <s1>Następna</s1>Rozszerzony sygnał przekazu LunaNet
