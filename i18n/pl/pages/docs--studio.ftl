# docs--studio: translations (pl)

seg-c3c260b7063e = Testy

seg-ca497f6e51d4 = Źródło: <c1/>

seg-256705861db0 = Witryna kshana.dev

seg-82b7ed4e70af = <c1/> to drzewo, które GitHub Pages serwuje jako <a1>https://kshana.dev</a1>: strony (<c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>), dokumentacja w <c8/> oraz Kshana Studio w <c9/> (serwowane pod <a2>https://kshana.dev/studio/</a2>), aplikacja uruchamiająca silnik w przeglądarce jako WebAssembly (WASM), bez obliczeń po stronie serwera i bez niczego przesyłanego. Studio ma dwa widoki jednego silnika: widok Prosty (<c10/>, odpowiedź najpierw, zwykłymi słowami) i widok Zaawansowany (<c11/>, pełny panel), który dzieli z widokiem Prostym silnik, worker, moduły i dane przez <c12/>.

seg-2b76ce9ee32c = Od { "0.35.0" } Studio ma cztery dodatkowe widoki, każdy jako osobna strona z <c1/>, bez indeksowania przez wyszukiwarki i z folderem syntetycznych próbek, które czyta jego test:

seg-e3d0762bb726 = <c1/>: morski widok zaufania, wskaźnik zaufania do odbiornika dla strumienia pozycji statku, z torem demonstracyjnym w <c2/>.

seg-e608cdeac977 = <c1/>: omówienie szkolenia załogi, odtwarzające syntetyczne NMEA ze zdarzeniem zagłuszania, odciągnięcia, spoofingu czasu lub powtórzenia (<c2/>).

seg-f2ce6a93a58d = <c1/>: mapa zakłóceń i narażenie trasy (<c2/>).

seg-3f6cf51eb439 = <c1/>: jedna strona kart narzędzi z przykładami (<c2/>, <c3/>), w tym podpisane pakiety dowodowe (<c4/>), eksport bench (<c5/>), mapowanie compliance (<c6/>), weryfikacja Galileo OSNMA (<c7/>) i kanały asystenta AI (<c8/>).

seg-fb02aba9149f = Skąd pochodzą pliki

seg-a58fb92bab82 = Znajdują się tu trzy rodzaje plików i zmienia się je na trzy różne sposoby.

seg-d404d216114c = <b>Pliki przeniesione.</b> Strony, <c1/>, <c2/>, <c3/>, <c4/>, dane witryny w <c5/> (<c6/>, <c7/>, <c8/>) i wszystko w <c9/> są zapisywane przez <c10/> z kompilacji witryny i ze źródła Studio. <c11/> wymienia każdy z nich wraz z sumą kontrolną SHA-256 (Secure Hash Algorithm, 256-bitowy). <b>Nie edytuj ich tutaj</b>: <c12/> kończy się niepowodzeniem przy ręcznej edycji. Zmień źródło i uruchom przeniesienie ponownie:

seg-b681e66130e5 = Przeniesienie jest deterministyczne: drugie uruchomienie niczego nie zapisuje, a <c1/> kończy się kodem { "1" }, jeśli <c2/> nie jest tym, co zapisałoby przeniesienie. Przenosi bez zmian pliki dla robotów z kompilacji witryny (znaczniki canonical, karty społecznościowej i schema.org każdej strony, <c3/>, <c4/>, <c5/>, <c6/>), sprawdza je, zapisuje <c7/>, <c8/> i stronę przekierowującą pod dawnym adresem Studio (<c9/>, do <c10/>) oraz kieruje każdą stronę do lokalnych czcionek i bibliotek skryptów (poniżej).

seg-9be72ec8d40e = <b>Pliki będące własnością <c1/>.</b> To samodzielne źródła, których przeniesienie nigdy nie dotyka:

seg-23b6ea71fede = <c1/> jest ustrukturyzowanym źródłem kart możliwości i siatki standardów. <b>Edytuj je, a nie HTML.</b>

seg-e1ee8cd0af21 = <c1/> jest generowany (<c2/>) i przypięty przez <c3/>; nie edytuj go ręcznie. <c4/>, <c5/> i <c6/> to ręcznie utrzymywane odwzorowania, które ten sam test sprawdza względem wygenerowanej macierzy. Kopie Studio w <c7/> są tymi plikami, bajt w bajt.

seg-8901229c76ba = <c1/>, <c2/> i <c3/> to karta społecznościowa (<c4/>).

seg-89d78af0258c = <c1/> i <c2/>: pliki czcionek i biblioteka skryptów używane przez strony, pobrane jednorazowo przez <c3/> i zatwierdzone (zob. „Brak żądań do osób trzecich”).

seg-317c42219bd7 = <c1/>, <c2/>, <c3/>, <c4/> i <c5/>.

seg-5071806d230f = <b>Wyniki kompilacji</b>, ignorowane przez git i tworzone przez <c1/>: <c2/> (pakiet <c3/>, z którego budowany jest także pakiet npm), <c4/> (ten sam pakiet tam, gdzie Studio go importuje) oraz <c5/> (każdy scenariusz referencyjny, pod adresem, z którego serwowała je wcześniejsza witryna jednostronicowa).

seg-5042f55f78b5 = Kompilacja i lokalne serwowanie

seg-f393a52f7794 = Bez narzędzi WASM <c1/> przygotowuje istniejący pakiet zamiast kompilować nowy. Przepływ Pages nigdy tego nie używa.

seg-35094cb7ed04 = Każdy moduł w <c1/> to czysta logika z odpowiadającym <c2/>; sterowniki DOM (Document Object Model, drzewo elementów strony) Studio to <c3/> (widok Prosty) i <c4/> (widok Zaawansowany). Ciągła integracja uruchamia każdy z nich jako osobny krok i kończy się niepowodzeniem, jeśli plik testowy w <c5/> nie ma kroku.

seg-ba24be498f87 = Brak żądań do osób trzecich

seg-7215806f98d4 = kshana.dev serwuje własne czcionki, style i skrypty. Strona nie wysyła żądań do hosta czcionek ani hosta skryptów, więc adres odwiedzającego nie jest nikomu przekazywany.

seg-30fc8da50592 = Witryna i Studio są pisane z myślą o Google Fonts i hoście skryptów. Przeniesienie zastępuje link Google Fonts każdej strony odpowiednim arkuszem stylów w <c1/> (te same reguły <c2/> i te same pliki czcionek, każdy podzbiór, więc tekst wyświetla się jak dawniej), a każdy adres hosta skryptów plikiem w <c3/>. <c4/> i <c5/> rejestrują, skąd pochodzi każdy plik, i jego sumę kontrolną; czcionki są na licencji SIL Open Font License (<c6/>), a three.js na licencji MIT (<c7/>).

seg-68a02a54db3b = <c1/> to jedyny krok korzystający z sieci. Uruchom go ponownie tylko wtedy, gdy strona prosi o zestaw czcionek lub wersję biblioteki, których tu nie ma: przeniesienie odmawia i mówi o tym. <c2/> kończy się niepowodzeniem, jeśli jakakolwiek przeniesiona strona, arkusz stylów lub skrypt wskazuje host czcionek albo ładuje cokolwiek z innego hosta.

seg-4ff8a4accad4 = Strona { "404" }

seg-763503746a48 = GitHub Pages odpowiada na brakujący adres stroną <c1/> i statusem { "404" }. Przeniesienie tworzy tę stronę z własnej powłoki strony głównej (nawigacja, stopka, wyszukiwanie) wokół krótkiego komunikatu z linkami do Strony głównej, Dokumentacji i Studio. Każdy adres w niej jest zapisany od korzenia witryny, ponieważ strona jest serwowana na dowolnej głębokości.

seg-9126631f595b = Dawne adresy

seg-a64ed190233a = Do { "v0.28.0" } witryna była jedną stroną, a wszystko mieściło się za fragmentem w <c1/> (<c2/>, <c3/>, linki udostępniania jako <c4/>, osadzenia jako <c5/>; dawna nazwa karty w linku osadzenia, na przykład <c6/>, otwiera kartę Studio, która ją zastąpiła). <c7/> wymienia każdy taki adres używany przez opublikowane materiały i miejsce, w które teraz prowadzi; strona główna ładuje <c8/>, wygenerowany z tej listy, aby tam kierować. Dodaj przypadek do listy przed wycofaniem jakiegokolwiek adresu.

seg-a9db9b0675e2 = Wdrożenie

seg-0316a3f12053 = Przepływ GitHub Actions <c1/> wdraża znacznik wydania, a nie <c2/>: <c3/> uruchamia go po opublikowaniu wydania, a ręczne uruchomienie ponownie wdraża wskazany znacznik. Uruchamia <c4/>, przygotowuje <c5/> bez testów, skryptu kompilacji, <c6/>, manifestu i tego pliku oraz publikuje wynik w GitHub Pages.

seg-6aa2e78078ae = <s1>Poprzednia</s1>Słownik

seg-419353a4fb30 = <s1>Następna</s1>Samouczki
