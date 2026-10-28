# docs--i18n: translations (pl)

seg-c3c260b7063e = Testy

seg-257c477dc510 = WebAssembly

seg-f942b36a11c4 = Jeszcze nie na GitHub

seg-26b562e7f535 = Źródło: <c1/>

seg-60b2e78c882e = Lokalizacja silnika

seg-7f3a6f2932c2 = Tekst silnika przeznaczony dla człowieka jest w { "17" } językach obok angielskiego: nl, pl, pt-BR, pt-PT, fi, sv, da, nb, cs, uk, ru, de, fr, es, et, ja, zh-Hans. Źródłem jest angielski; <c1/> to pseudolokalizacja, która akcentuje, ujmuje w nawiasy i dopełnia każdy komunikat, aby test mógł zobaczyć, czy tekst został przeniesiony do katalogu. Framework to <a1>Project Fluent</a1> (<c2/>, <c3/>); kod to <c4/>.

seg-1ed9fde69630 = Co jest lokalizowane, a co nigdy

seg-1cb6eb25338d = Lokalizowane (czyta człowiek)

seg-ab884f59f5f3 = Nigdy nielokalizowane (czyta program)

seg-dbe9b8a0ed98 = komunikaty i błędy wiersza poleceń

seg-711a8e63c1de = klucze i wartości JSON w <c1/> i <c2/>

seg-a4066ef82152 = wiersz podsumowania każdego przebiegu

seg-6fbdf82a22dc = nagłówki i wiersze CSV

seg-8d08a6f5f16f = tekst wykresów SVG (tytuły, osie, legendy, podpisy)

seg-8ad1234dfb18 = nazwy plików

seg-777c2587e0da = <c1/>: nagłówki, tabele, uwagi, podpisy

seg-d5cf8d8abe89 = kody błędów (<c1/>)

seg-7ba47f2644f5 = słowa werdyktów (VALIDATED, MODELLED, PARTIAL)

seg-1739c009f155 = macierz weryfikacji, definicje jednostek, pochodzenie

seg-122495009a9c = opisy rodzajów scenariuszy (<c1/>)

seg-c7bc43c1e848 = oświadczenia doradcze, zastrzeżenia i informacje (<c1/>)

seg-dd0fc888e0dc = te same teksty wewnątrz JSON, które pozostają po angielsku

seg-a236606f1ca1 = <c1/> kampanii iq, strony porównania badań, tabeli wyników bench, raportu odporności

seg-4ec45651bd09 = <c1/> pakietu dowodowego i PNG obserwatorium: oba są skrótowane do manifestu (pakiet jest dodatkowo podpisany), więc powstają po angielsku niezależnie od języka

seg-048b6c3a9f0c = Liczby w tekście przeznaczonym dla człowieka używają znaku dziesiętnego danego języka (przecinek w { "15" } z { "18" } języków; kropka w en, ja, zh-Hans i en-XA). Liczby w plikach maszynowych zawsze używają kropki. Licznik (zmienna o nazwie <c1/>, <c2/>, <c3/>, <c4/> lub <c5/>) trafia do Fluent jako liczba, więc tłumaczenie może zapisać <c6/>.

seg-487d6d38fa39 = Wybór języka

seg-79499bebb806 = Wiersz poleceń: <c1/>, potem <c2/>, <c3/>, <c4/>, <c5/>, a następnie angielski. <c6/> to pt-BR; tylko <c7/> oznacza Portugalię. <c8/> to uproszczony; tradycyjny jest odrzucany z listą obsługiwanych znaczników.

seg-079f85726238 = Biblioteka: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>.

seg-1df6e0d69fd9 = Python: <c1/> w <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>; <c9/>; <c10/>.

seg-017ca3380cee = WebAssembly: opcjonalny końcowy <c1/> w <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>; <c11/>; <c12/>; <c13/>.

seg-3e49c408ad12 = MCP: <c1/> w <c2/> i <c3/>.

seg-e133ee809c98 = Błędy i ich kody

seg-fac73c5cbbc2 = Każdy komunikat o błędzie ma stabilny kod, czyli identyfikator komunikatu wielkimi literami (<c1/> to <c2/>), taki sam w każdym języku. Angielski tekst wiersza poleceń pozostaje bez zmian. W innym języku wiersz ma postać <c3/>; z <c4/> w każdym języku następuje drugi wiersz <c5/>. API udostępnia <c6/> i <c7/> (<c8/>); błędy MCP niosą <c9/> jako dane błędu. Dopasowuj po kodzie, nigdy po tekście.

seg-7d731dc5f888 = Jak działa przebieg w innym języku (zasada podwójnego przebiegu)

seg-204df30d9ca2 = Plik maszynowy nie może zależeć od języka. Przebieg w innym języku wykonuje więc scenariusz dwa razy: raz po angielsku, a jego <c1/>, <c2/> i CSV są plikami maszynowymi, i raz w języku użytkownika, dla podsumowania, wykresu i <c3/>. Angielski to jeden przebieg, bajt w bajt taki, jaki był wcześniej.

seg-b7447d4cd5a8 = Zmierzone, natywnie, kompilacja wydaniowa, angielski, a potem <c1/> (sekundy): leo-navmsg-fit-interval-trade { "9.2" } -> { "17.9" }, cislunar-arc-recovery { "7.8" } -> { "14.1" }, lunar-station-coverage { "7.8" } -> { "15.0" }, clock-ensemble { "5.8" } -> { "11.6" }, leo-navmsg-model-comparison { "5.1" } -> { "10.5" }, leo-ppp-convergence { "2.8" } -> { "6.2" }; każdy inny dołączony scenariusz trwa poniżej { "4" } s; { "173" } scenariuszy dołączonych w chwili pomiaru zajęło razem { "64" } s po angielsku. Koszt dla innego języka jest dokładnie dwukrotny. WebAssembly nie zostało zmierzone (brak tu wasm-bindgen); przy współczynniku przeglądarki około { "4" } to minuta dla najwolniejszego rodzaju.

seg-cc148fdec7a2 = Strona unika oczekiwania, pokazując od razu wynik angielski i wywołując potem <c1/>: to jest sam drugi przebieg, zwraca <c2/>, a Studio może wyświetlać „tłumaczenie...” do chwili jego nadejścia.

seg-cd0360ad624d = <b>Pozycja { "0.41" }: jeden przebieg.</b> Wygenerować oba z zapisu <c1/>. Rozważono to i nie zbudowano: wyniki <c2/> są sprawdzane, mierzone i skrótowane po ich utworzeniu (szerokości tekstu wykresów, skróty pochodzenia nad tekstem wyników), a <c3/> formatuje w miejscu wywołania, więc zapis wprowadziłby do plików maszynowych znaczniki zastępcze i uzależniłby ich bajty od odtworzenia. Wymaga to <c4/>/<c5/> zwracających znaczniki, finalizatora w każdym zapisującym oraz dowodu identyczności bajtów dla każdego zapisującego.

seg-67e04a43cea8 = Kompilacja wasm zawiera tylko katalog angielski. Pozostałe szesnaście dodałoby około { "150" } kB gzip każdy. Strona pobiera <c1/> po wyborze języka i wywołuje <c2/>; jeśli pobranie lub rejestracja się nie powiedzie, strona pozostaje po angielsku. Natywnie wiersz poleceń i pakiet Pythona zawierają wszystkie { "18" }.

seg-9a2f85e7e43c = Rozmiar, nieoptymalizowany <c1/> z <c2/> (przed wasm-bindgen i wasm-opt), podstawa bc04e98f wobec tej gałęzi: { "18.71" } MB -> { "19.88" } MB surowo, { "5.43" } MB -> { "5.79" } MB gzip, +{ "357" } kB gzip. Katalog angielski ma { "521" } kB surowo, z czego { "153" } kB gzip; reszta to <c3/> i jego zależności. Przyjęto to tak, jak zmierzono.

seg-3ce9aab4916e = Katalog

seg-fdea76581cd8 = <c1/> zawiera komunikaty, z identyfikatorami z przedrostkiem <c2/>. <c3/> jest źródłem; pozostałe pliki należą do tłumaczy i mogą nie zawierać komunikatów (każdy komunikat w razie braku wraca do angielskiego). Listy towarzyszące w <c4/>: <c5/> (komunikaty ze zmiennymi licznikowymi, dla form liczby), <c6/> (liczby przekazywane jako placeables), <c7/> (komunikaty będące fragmentami zdania składanego w czasie działania: do scalenia w komunikaty pełnych zdań, nigdy nie do powiększania).

seg-9432bca8a935 = <c1/> dowodzi poprawności angielskiego: każdy komunikat ma zapisany szablon oryginału i renderuje się dokładnie do tego tekstu; każdy identyfikator jest używany; zmienne się zgadzają; pseudolokalizacja renderuje każdy komunikat. <c2/>, <c3/>, <c4/> obejmują punkty wejścia, opisy rodzajów i teksty prawne. <c5/> kończy się niepowodzeniem, jeśli nowy literał łańcuchowy, który czytałby człowiek, omija katalog: dopuszczenie dla pliku w <c6/>, które może maleć i nigdy rosnąć. <c7/> uruchamia całe scenariusze plikiem binarnym bazowym i bieżącym i porównuje każdy plik wyjściowy.

seg-969a4b12b12c = Jak przenieść łańcuch do katalogu: <c1/>.

seg-48c3c0ca063d = Zależności i licencje

seg-b6c2f08c9a46 = Framework dodaje <c1/> { "0.16" } (Apache-2.0 OR MIT) i <c2/> { "0.9" } (MIT OR Apache-2.0), z ich tranzytywnymi crate'ami: <c3/> i <c4/> (Apache-2.0 OR MIT), <c5/> (Apache-2.0 OR MIT), <c6/> (Apache-2.0/MIT), <c7/> (MIT/Apache-2.0), <c8/> (Apache-2.0 OR GPL-2.0-only: używana jest alternatywa Apache-2.0, którą <c9/> dopuszcza), <c10/> i <c11/> (Unicode-3.0), <c12/>, <c13/>, <c14/>, <c15/> (MIT OR Apache-2.0). Każda z nich jest permisywna według listy <c16/> z <c17/>; <c18/> występuje w dwóch wersjach ({ "1" } i { "2" }), o czym <c19/> tylko informuje. Listę licencji odczytano z <c20/>; <c21/> nie jest zainstalowane w środowisku autorskim i działa w CI integracyjnym.

seg-6aa2e78078ae = <s1>Poprzednia</s1>Słownik

seg-670504be0531 = <s1>Następny</s1>Przewodnik po Studio
