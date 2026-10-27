# docs--mcp-http: translations (pl)

seg-c8bab9114d57 = Źródło: <c1/>

seg-4bd138b7d28a = Uruchamianie kshana-mcp przez HTTP (własny hosting)

seg-7ca89d6e0201 = Fragment wymieniający zewnętrznych klientów AI został tu pominięty; jest w <a1>docs/deploy/mcp-http.md</a1> na GitHubie.

seg-2f5b3bdb7d0b = <b>Kshana nie udostępnia punktu końcowego.</b> Nie ma wspólnego serwera <c1/>, na który można by wskazać klienta. Uruchamia się go na własnej maszynie, w kontenerze lub w projekcie chmurowym, a kontrola dostępu i koszty leżą po stronie uruchamiającego. Serwer { $version } to ten z tego repozytorium: jego wartości mają etykiety VALIDATED lub MODELLED dokładnie tak samo jak przez stdio.

seg-113a79ece785 = Bezpieczne ustawienia domyślne

seg-2bdbe06123c8 = Mechanizm

seg-640f28207e8a = Zachowanie

seg-9bc8fe53a948 = Adres nasłuchu

seg-82001913f285 = Tylko pętla zwrotna (<c1/>, <c2/>). Sam port (<c3/>) oznacza <c4/>.

seg-f2adda2d3e22 = Wymaga <c1/> <b>oraz</b> tokenu bearer w zmiennej środowiskowej <c2/> (co najmniej { "16" } znaków). Bez obu serwer odmawia uruchomienia. Z obiema wypisuje ostrzeżenie, że nasłuchuje poza tą maszyną.

seg-6fbe07565c36 = Uwierzytelnianie

seg-d5cbeb0cd3d6 = <c1/> w każdym żądaniu, gdy ustawiono token (można go ustawić także na pętli zwrotnej). Porównywany w stałym czasie. Brak lub błąd: <c2/>.

seg-1962f434458b = System plików

seg-1a9e048d348d = Brak. Narzędzia do plików IQ (<c1/>) są w trybie HTTP wyłączone niezależnie od wartości <c2/>; każde inne narzędzie przyjmuje scenariusz w treści żądania i odrzuca ten, który wskazuje plik. Żaden argument narzędzia nie odczytuje ani nie zapisuje ścieżki.

seg-19261cdd2ef0 = Rozmiar treści

seg-c4db8c1454f4 = <c1/>, domyślnie { "5" } MiB (limit scenariusza to { "4" } MiB). Po przekroczeniu: <c2/>, niezależnie od tego, czy długość jest zadeklarowana, czy treść jest przesyłana we fragmentach.

seg-da9103d627dd = Czas odpowiedzi

seg-3f013a632773 = <c1/>, domyślnie { "120" }. Po przekroczeniu: <c2/>. <b>Ogranicza to czas oczekiwania wywołującego, a nie samą pracę</b>: trwającego już przebiegu nie można zatrzymać, więc po <c3/> toczy się dalej i kończy w tle.

seg-a588b12596b7 = Współbieżność

seg-aa2214db3bdc = <c1/>, domyślnie { "8" }. Ponad ten limit żądanie od razu dostaje <c2/> z <c3/>; żadne nie czeka w kolejce.

seg-87576ded5272 = Pula robocza

seg-7f9c63e3e5e6 = Każde wywołanie narzędzia działa w wątku blokującym w puli <c1/> miejsc, nigdy w wątkach asynchronicznych, więc długi przebieg nie może zatrzymać odpowiadania serwera. Miejsce zwalnia się dopiero wtedy, gdy kończy się sam przebieg, a nie wtedy, gdy wywołujący zrezygnuje: porzucone przebiegi nie mogą więc narosnąć ponad rozmiar puli, a wywołanie, które zastaje pulę pełną, jest odrzucane jako zajęte.

seg-4a97b035483c = Budżet pracy

seg-91c788b33b25 = Scenariusz żądający znacznie więcej niż dołączone przykłady jest odrzucany przed uruchomieniem: ponad { "1000" } realizacji Monte Carlo (<c1/>), siatka parametrów licząca ponad { "1000" } węzłów, ponad { "5000" } przebiegów składowych (węzły siatki razy realizacje) albo siatka czasu licząca ponad { "2" } miliony epok. Błąd wskazuje pole do zmniejszenia. Ten sam budżet obowiązuje przez stdio; wiersz poleceń <c2/> go nie ma.

seg-79c6b146637c = CORS

seg-68fa7d9f1321 = Nagłówek <c1/> nigdy nie jest wysyłany. Żądanie z nagłówkiem <c2/> jest odrzucane (<c3/>), chyba że wskazano go przez <c4/>; <c5/> nie jest akceptowane.

seg-d7f157fdf003 = Nagłówek Host

seg-d7966e93ef1a = Sprawdzany względem nazw pętli zwrotnej albo adresu nasłuchu plus każdego <c1/>. Za proxy lub pod adresem URL platformy podaj <c2/>. Cokolwiek innego: <c3/>.

seg-12d5cf72f363 = Sesje

seg-58dfe5665877 = Brak. Każdy POST dostaje odpowiedź JSON; nie jest utrzymywana tabela sesji ani otwarty strumień zdarzeń wysyłanych przez serwer.

seg-adbc92ebc196 = TLS nie jest kończony przez <c1/>. Gdy serwer jest osiągalny poza jedną maszyną, postaw przed nim HTTPS (TLS platformy lub reverse proxy) i trzymaj token w tajemnicy; token bearer przesyłany zwykłym HTTP można odczytać w sieci.

seg-1b21740b9c63 = Lokalnie

seg-a6194f5a52f8 = Konfiguracja klienta (klient z adresem URL; nagłówek dodaj tylko wtedy, gdy ustawiono token):

seg-a683980168f7 = Docker

seg-81df4f5cd02e = Wewnątrz kontenera serwer musi nasłuchiwać na <c1/>, więc potrzebuje <c2/> i tokenu. Opublikowanie portu jako <c3/> zachowuje go na Twojej maszynie; usuń <c4/> tylko wtedy, gdy zamierzasz go udostępnić, a wtedy zakończ TLS przed nim. Szablony <c5/> oraz Fly.io i Cloud Run są w <a1><c6/></a1>.

seg-8b8bef7174e8 = Szablony (wdrażasz je samodzielnie; Kshana żadnego nie uruchamia)

seg-198bea1e0595 = <a1><c1/></a1>: token ustaw poleceniem <c2/>

seg-c33701cb9ca2 = <a1><c1/></a1>: token pobierz z Secret Managera

seg-b86ddb72b916 = Każdy uruchamia opublikowany obraz, ustawia <c1/> na nazwę hosta platformy, którą podmieniasz w pliku, i polega na platformie w kwestii HTTPS.

seg-ce3a5326cb95 = Ustaw limit CPU i pamięci na platformie

seg-e1fc13672597 = Limit czasu, pula i budżet ograniczają, ile pracy zostaje przyjęte, ale jedno przyjęte wywołanie nadal może długo zajmować rdzeń, a duży wynik może zająć setki megabajtów. Nałóż też twardy limit na kontener: szablony żądają { "2" } CPU i { "1" } GiB (<c1/> i <c2/> w Compose, <c3/> we Fly, <c4/> w Cloud Run). Wartość <c5/> utrzymuj na poziomie liczby CPU lub niższym.

seg-058781b052c4 = Czym nie jest

seg-90edc7ff2a55 = Nie jest usługą wielodostępną. Każdy, kto ma token, uruchamia symulacje na Twoim sprzęcie; poza powyższymi limitami nie ma żadnych limitów na użytkownika.

seg-5b3b9c610f31 = Wyłącznie doradczo, nie jest to sprzęt nawigacyjny z zatwierdzeniem typu: za nawigację nadal odpowiada operator. Wyniki symulatora to obliczone z modelu lub sprawdzone względem niezależnego wzorca wartości do analizy, jak wszędzie indziej w Kshana.

seg-c33947d44b06 = <s1>Poprzednia</s1>Serwer MCP: wszystkie kanały instalacji

seg-a9d67efe493a = <s1>Następna</s1>Używanie Kshana z poziomu agenta
