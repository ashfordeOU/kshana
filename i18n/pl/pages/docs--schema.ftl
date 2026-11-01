# docs--schema: translations (pl)

seg-2247a2344710 = Znaczenie

seg-f42465f7d066 = ns

seg-f63dd3d7aad4 = Źródło

seg-6940543aa3c0 = ciąg znaków

seg-f5e7215e6835 = obiekt

seg-9da5d92757bd = obiekt, opcjonalny

seg-c353e7bec219 = Klucz

seg-a129b9e613d0 = Typ

seg-e28387d70be0 = Źródło: <c1/>

seg-49d2afecf5f1 = Schemat wyniku: jak czytać <c1/> Kshana

seg-c128455c353c = Każdy przebieg zapisuje obok scenariusza wersjonowany, samoopisujący się artefakt JSON (JavaScript Object Notation). Ta strona to ręcznie napisany przewodnik czytelnika po kopercie wymiany i po kształtach wyników <b>zegara i orbity</b>: <b>jednostka</b> każdego pola, miejsce jego obliczenia w kodzie źródłowym i sposób jego odczytu. Kanoniczny typ to <c1/> w <a1><c2/></a1>; wskaźniki jakości to <c3/> w <a2><c4/></a2>.

seg-092ea1e33a05 = To <b>nie</b> jest pełna dokumentacja pól. Silnik obsługuje znacznie więcej rodzajów niż te dwa, a każdy zwraca własny pakiet. Pełna dokumentacja, czyli jednostka, klasa pochodzenia i definicja każdego pola liczbowego każdego wbudowanego rodzaju, jest generowana, a nie pisana ręcznie: zobacz <a1>Jednostki i pochodzenie, dla każdego pola każdego rodzaju</a1> poniżej.

seg-e4c4b66a2f46 = Koperta wymiany (KIF, Kshana Interchange Format): rozpoznawanie artefaktu i sprawdzanie jego wersji

seg-9b83bb817814 = Artefakty Kshana można opakować w neutralną, samoopisującą się <b>kopertę wymiany</b>, aby narzędzie firm trzecich mogło rozpoznać plik i zdecydować, czy potrafi go odczytać, <em>zanim</em> zobowiąże się do schematu ładunku. Kanoniczny typ to <c1/> w <a1><c2/></a1>.

seg-e4fd08930644 = Zawsze <c1/> (<c2/>): tak obce narzędzie rozpoznaje artefakt Kshana.

seg-abd853f2ce49 = Wersja schematu <c1/> (<c2/>, jedyne źródło prawdy dla całego crate).

seg-ee9f238072f1 = Rodzaj artefaktu, np. <c1/>, <c2/>, <c3/>: pozwala odbiorcy skierować go dalej bez przetwarzania treści.

seg-29ad4bedd64f = Wersja crate (<c1/>), która wytworzyła ładunek.

seg-52f3e962c049 = Opakowany artefakt jako kanoniczny JSON (<c1/>, <c2/>, …).

seg-6fe0d7cd4165 = <b>Umowa kompatybilności.</b> Wersje mają postać <c1/>. Nowe pola są dodawane z <c2/> (<em>dyscyplina addytywna</em>), więc czytnik potrafi przetworzyć każdy artefakt <b>tej samej wersji głównej i równej lub starszej podwersji</b> (<c3/>). Ściśle <b>nowsza podwersja</b> (<c4/>) może zawierać pola, których ten czytnik nie potrafi obsłużyć, a <b>inna wersja główna</b> (<c5/>) to przerwanie strukturalne; oba są odrzucane przez <c6/>, które sprawdza znacznik formatu i wersję na granicy, zamiast po cichu błędnie przetwarzać obce dane wejściowe.

seg-f7ae91002e56 = <b>Determinizm.</b> Koperta <b>nie zawiera znacznika czasu</b>, bo wymaga tego obietnica odtwarzalności Kshana (<c1/> odtwarza przebieg). Pochodzenie znajduje się w <c2/> i we własnym <c3/> ładunku.

seg-bb0b742d2df8 = Typowane odczytanie zwrotne (<c1/>) działa dla każdego ładunku, który implementuje <c2/> (np. <c3/>). Artefakty wyników są z założenia tylko do serializacji i są odczytywane jako surowa wartość JSON <c4/>.

seg-87be7aa00b17 = Najwyższy poziom (pakiety zegara i orbity)

seg-cc22d9206eb4 = Typ / jednostka

seg-3a821855c582 = Wersja schematu wyniku (niezależna od wersji silnika).

seg-cc6dded799f9 = Wersja crate (<c1/>), która wytworzyła plik.

seg-5a69a99b9a87 = ciąg szesnastkowy

seg-441eb1f43399 = SHA-256 (SHA: Secure Hash Algorithm) z kanonicznego JSON scenariusza; przebieg jest odtwarzalny z <c1/>.

seg-ba73ba76873e = Ziarno (seed) RNG (generatora liczb losowych) dla przebiegu kwantowego (klasyczny używa <c1/>).

seg-a688dd98c588 = nanosekundy

seg-24e0f04033fa = Specyfikacja czasu: błąd w granicach ±<c1/> jest „w specyfikacji”.

seg-f52388753a1a = scenariusz

seg-15b4082a6455 = obiekt (<c1/>)

seg-7d3b92769bf5 = Przebieg czujnika kwantowego (patrz niżej).

seg-aa665b955931 = Przebieg czujnika klasycznego, dla porównania.

seg-152ae43896b3 = Mapa jednostek i pochodzenia dla każdego pola tego dokumentu, indeksowana ścieżką pola. Zobacz §Jednostki i pochodzenie poniżej.

seg-119bac9b3e6f = Poziom weryfikacji każdego podanego wskaźnika jakości, i zawsze ostatni klucz dokumentu. <c1/> wymienia po jednym wpisie dla każdego obecnego wskaźnika: <c2/> (np. <c3/>), <c4/> (<c5/> = sprawdzone względem niezależnej zewnętrznej wyroczni, <c6/> = z pierwszych zasad, testowane wewnętrznie), <c7/> (wiersz macierzy weryfikacji, z którego odczytano poziom) i <c8/>. <c9/> ma wartość <c10/>, z <c11/>, dla <c12/> w każdym scenariuszu bez skonfigurowanego ataku: ograniczenie pozostaje w <c13/>, ale nie odpowiada na pytanie, które stawia scenariusz. <c14/> wymienia każdy wskaźnik, którego nie posiada żaden wiersz macierzy (wskaźniki pozycji <c15/> i <c16/>), zamiast nadawać mu poziom. Emitowany przez rodzaje <c17/> (pojedynczy przebieg i zespół Monte Carlo), <c18/>, <c19/> i <c20/>, które budują go w swoim przebiegu, oraz ({ "0.36" }, RM-04) przez każdy inny rodzaj dla jego wskaźników nagłówkowych, dopisywany po przebiegu z tabeli dla poszczególnych rodzajów <c21/>; <c22/> usuwa go z powrotem do dokumentu bez poziomów bajt po bajcie. Nie jest emitowany przez <c23/>, którego wynik jest zamrożoną, zarejestrowaną z góry prognozą (<c24/>): ten rodzaj nie ma <c25/>, dopóki nowa datowana prognoza go nie zastąpi. Nie jest też emitowany przez <c26/>, <c27/>, <c28/> ({ "0.37" }; tablice dla poszczególnych stanowisk), <c29/> i <c30/>, które nie mają skalarnego wskaźnika nagłówkowego, ani przez <c31/>, którego dokument to zwarty JSON (<c32/> podaje każdy powód), ani przez osadzone dokumenty członków kampanii. Nie zawiera liczb.

seg-1448f90f0086 = Podsumowanie geometrii pakietu orbity: <c1/>, <c2/>, <c3/> (m, modelowany budżet błędu zasięgu dla każdego satelity), <c4/> / <c5/> (bezwymiarowe) i <c6/> / <c7/> (m, PDOP (rozmycie dokładności pozycji) × <c8/>). <b>Tylko pakiet orbity.</b>

seg-ae4f8eed06ac = tablica <c1/> km, opcjonalna

seg-d13d827f54b0 = Propagowany tor użytkownika (statku kosmicznego) w układzie ziemskim inercjalnym, jeden wpis na każdą próbkowaną chwilę. <b>Tylko pakiet orbity</b>; w innych pomijany. Tylko wyjście, nie jest haszowany.

seg-8f511d5de657 = obiekt (<c1/>), opcjonalny

seg-ea152e097d6f = Addytywne metadane raportu (tytuł badania, znacznik wygenerowania, autor, zastrzeżenie). Pomijane, gdy nieobecne, więc przebieg bez metadanych jest identyczny bajt po bajcie z dawnym wyjściem. Tylko wyjście, nie jest haszowane.

seg-1041873fba1b = <c1/> (każdy z <c2/> / <c3/>)

seg-3fa81140c10d = Identyfikator czujnika (np. <c1/>).

seg-80765d202558 = Rodzaj modelu (np. <c1/>).

seg-6bf458d964fe = Cytowanie lub źródło parametrów czujnika.

seg-9145f04a557f = Użyte surowe parametry modelu.

seg-697940342a28 = tablica <c1/>

seg-b5f4216b55a2 = Szereg czasowy dla każdego kroku: <c1/> sekundy, <c2/> błąd czasu w <b>nanosekundach</b>, <c3/> jedna z wartości <c4/>/<c5/>/<c6/>.

seg-7fba0b91b75e = obiekt (<c1/>)

seg-5c4b60012f0e = Wyznaczone wskaźniki jakości (poniżej).

seg-1308a29c6a5b = tablica <c1/>

seg-bbd42065492c = Nakładające się odchylenie Allana: <c1/> czas uśredniania (s), <c2/> bezwymiarowa stabilność ułamkowej częstotliwości σ_y(τ), <c3/> liczba nakładań za tym punktem, <c4/> typ potęgowy rozpoznany z nachylenia MDEV (zmodyfikowanego odchylenia Allana) (np. <c5/>), <c6/> efektywna liczba stopni swobody właściwa dla typu szumu oraz <c7/>/<c8/> pas ufności { "95" }% oparty na χ² dla <c9/> przy tym τ. Obliczane w <c10/>.

seg-1e61fd18257f = Ocena spójności filtra Kalmana (NIS/NEES (NIS: znormalizowany kwadrat innowacji; NEES: znormalizowany kwadrat błędu estymacji) względem ich pasm χ²), obliczana w <c1/>; pomijana dla przebiegów, które jej nie oceniają.

seg-9333864652b0 = <c1/> (obiekt <c2/>)

seg-ce9caeaefd87 = Zastrzeżenie

seg-b24de276d788 = RMS (pierwiastek ze średniej kwadratowej) błędu fazy zegara (czasu) podczas przerwy.

seg-53e5018ae276 = metryka <b>czasu</b>, a nie pozycji

seg-8cdec6da2072 = 95. percentyl błędu czasu podczas przerwy.

seg-95f058adb809 = Najgorszy (najkrótszy) lot w specyfikacji po segmentach przerwy.

seg-48babfd3bd95 = <b>ograniczone siatką</b>: dolna granica przy rozdzielczości kroku czasu

seg-41c08973baa1 = Tempo wzrostu |błędu| podczas przerwy metodą najmniejszych kwadratów.

seg-707ee74c5c06 = ułamek [{ "0,1" }]

seg-32e5fe6415f8 = Ułamek całego przebiegu z rozwiązaniem w specyfikacji.

seg-361b3b923a45 = ułamek [{ "0,1" }] lub null

seg-5d55682f9349 = <b>Samospójność filtra</b>: ułamek próbek z przerwy, w których prawdziwy błąd mieści się w granicy k-σ filtra Kalmana.

seg-636106cb4a40 = <b>NIE</b> jest to integralność HPL/VPL/RAIM (HPL: poziom ochrony w płaszczyźnie poziomej; VPL: pionowy poziom ochrony; RAIM: autonomiczny monitoring integralności przez odbiornik), zob. <a1><c1/></a1>

seg-f686ade3da21 = <b>Analityczna granica wykrywalności spoofingu</b> wynikająca ze stabilności zegara.

seg-f8783db25141 = ma sens tylko ze skonfigurowanym atakiem, więc pakiety zegara i orbity (które żadnego nie konfigurują) oznaczają to jako <c1/> w <c2/> i wypisują jako <c3/> w podsumowaniu; <b>nie</b> jest to wielosatelitarny detektor RAIM

seg-90e2980430b9 = Jak wygląda „dobry” wynik

seg-c1afc6f3c545 = <b>Cichszy zegar</b> (niższe <c1/>) daje dłuższe <c2/> i wyższą granicę wykrywalności <c3/>: na tym polega kontrast kwantowy kontra klasyczny.

seg-0fa38207813a = <c1/> bliskie { "1.0" } oznacza, że system pozostawał w specyfikacji prawie przez cały przebieg; podczas długiej przerwy spada dla bardziej zaszumionego zegara.

seg-4dcba241d5a6 = <c1/> bliskie { "1.0" } oznacza, że własna granica niepewności filtra uczciwie opisywała jego błąd: to stwierdzenie <em>samospójności</em>, a nie gwarancja bezpieczeństwa życia.

seg-3099d75a04a5 = Inne rodzaje scenariuszy

seg-43cd9f67f384 = Każdy inny rodzaj emituje własny kształt wyniku. Kilka typowych:

seg-6b59ef9dfe85 = <b>inertial</b>: wskaźniki jakości w dziedzinie pozycji w <b>metrach</b> (<c1/>, <c2/>), jednoosiowe (1-DOF (DOF: stopień swobody)), z jednym ziarnem (seed) (zob. <a1><c3/></a1>).

seg-3e3ec8985dde = <b>hybrid / fusion</b>: <c1/> i <c2/> na najwyższym poziomie, a dla każdej strony wskaźniki czasu i pozycji jednego zestawu czujników (<c3/>, <c4/> i <c5/>, czas do naruszenia którejkolwiek specyfikacji), z blokiem <c6/> jak w pakiecie zegara, w którym wskaźniki pozycji są wymienione jako <c7/>.

seg-e38e8a8adec8 = <b>spoof</b>: przesunięcie spoofingu w każdym kroku względem granicy detekcji zegara oraz informacja, czy spoofing osiągnął specyfikację przed wykryciem (<c1/>).

seg-dfd972d160e1 = <b>skyline</b> (<c1/> i <c2/> z <c3/>, <c4/>, <c5/>, <c6/>, <c7/>; obecny tylko wtedy, gdy scenariusz ma sekcję <c8/>, więc scenariusz bez niej pozostaje bez zmian): obiekt najwyższego poziomu <c9/> z <c10/> (ciąg: <c11/>, <c12/> lub <c13/>), <c14/> (ułamek [{ "0,1" }] kąta bryłowego górnej półkuli powyżej <c15/>) i <c16/> (ciąg); dla każdej próbki <c17/> (liczba satelitów powyżej maski, lecz za horyzontem: <c18/> z <c19/> i <c20/>, <c21/> z <c22/>, <c23/> z <c24/>); oraz dla <c25/> <c26/> (liczba epok). Ich jednostki i klasy pochodzenia znajdują się w bloku <c27/> (<c28/> <c29/>; <a1><c30/></a1>).

seg-d113122b7454 = Aby poznać dokładny zestaw pól dowolnego rodzaju, przeczytaj jego wpis w <a1><c1/></a1> (poniżej), sekcję tego rodzaju w <a2><c2/></a2> lub odpowiadającą jej strukturę <c3/> w <c4/>.

seg-e0c63207c019 = Inne pliki zapisywane przez przebieg

seg-cc97989ca06b = Obok <c1/> CLI (interfejs wiersza poleceń) zapisuje <c2/>, drukowalny <c3/> i ten sam raport jako <c4/>, w którego bloku <c5/> zapisano wersję silnika, SHA-256 pliku scenariusza, ziarno (seed), platformę i dokładne polecenie (zob. <a1><c6/></a1> i <a2><c7/></a2>). Rodzaje, które publikują tabelę odtwarzalności, zapisują także <c8/> (CSV: wartości rozdzielone przecinkami). <c9/> zapisuje pliki wymiany (zob. <a3><c10/></a3>), a <c11/> animację (zob. <a4><c12/></a4>).

seg-489953601f3b = Jednostki i pochodzenie, dla każdego pola każdego rodzaju

seg-61b33dbb44dd = Ta strona jest pisana ręcznie i obejmuje pakiety zegara i orbity. Odpowiednik czytelny maszynowo obejmuje <b>każdy</b> wbudowany rodzaj:

seg-1e20fcda7f0b = <b>W samym wyniku.</b> Dokument wyniku każdego scenariusza zawiera obiekt <c1/> najwyższego poziomu, odwzorowujący ścieżkę emitowanego pola na <c2/>. Gramatyka ścieżek (tablica wnosi jeden segment z przyrostkiem <c3/>, wspólny dla jej wierszy; <c4/> to wieloznacznik jednego segmentu dla obiektów kluczowanych danymi) i zamknięte słownictwo pochodzenia są zdefiniowane w <a1><c5/></a1>.

seg-b8256437c0b7 = Jako jeden plik.

seg-ae7136e34306 = <a1><c1/></a1> to zebrana suma: dla każdego rodzaju każde pole liczbowe, które emituje w podanym źródle, z jego jednostką, klasą pochodzenia, poziomem dowodowym i definicją oraz, nazwane, a nie pominięte, każde pole, które jeszcze ich nie ma. Jego blok <c2/> zawiera liczby.

seg-66af6dc065f7 = Oba są wymuszane przez <c1/>, który uruchamia każdy zarejestrowany rodzaj i kończy się niepowodzeniem, jeśli emitowane pole liczbowe nie ma jednostki i klasy pochodzenia. Rodzaje jeszcze nieobjęte są nazwane osobno w <c2/> tego pliku wraz z powodem, dla którego każdy pozostaje otwarty, a ich liczba jest przypięta, więc lista może się tylko kurczyć.

seg-ca49a577a07b = Wygeneruj JSON ponownie po każdej zmianie kształtu raportu lub bloku <c1/>:

seg-ce4351cf7673 = <s1>Poprzednia</s1>Opis scenariuszy

seg-b988dcc329a4 = <s1>Następna</s1>Użycie rzeczywistych TLE

seg-6585c8a3643d = ClockRun (każdy z quantum / classical)

seg-299f8a9643f1 = FoMScores (obiekt fom)

seg-d17376a1ea92 = ({ "0.40" }) Etykieta dowodowa przebiegu: <c1/> (<c2/>, <c3/> lub <c4/>: <em>najsłabszy</em> status wśród wierszy, więc nigdy nie twierdzi więcej niż jego najsłabszy wiersz), <c5/> (<c6/>), <c7/> i <c8/>, po jednym na wiersz macierzy weryfikacji, który przebieg wykorzystał (wiersze wymienione w jego raporcie zaawansowanym, z <c9/>): <c10/> (<c11/> i pierwsze { "8" } cyfr szesnastkowych SHA-256 tekstu wymagania wiersza), <c12/> i <c13/>, wszystko odczytane z macierzy, nic nie wpisane. Dodawana przez <c14/> do wyniku każdego rodzaju, przed końcowym blokiem <c15/>, gdy taki jest (ten blok pozostaje ostatnim kluczem); <c16/> usuwa ją bajt w bajt. Wykres SVG i tabela CSV tego samego przebiegu niosą tę samą etykietę (<c17/> i widoczny wiersz pod wykresem; <c18/> wierszy komentarza przed CSV). Członkowie kampanii osadzeni w wyniku innego rodzaju nie niosą żadnej: niesie ją dokument zewnętrzny. Nie zawiera liczb.
