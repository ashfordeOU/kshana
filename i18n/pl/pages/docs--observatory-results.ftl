# docs--observatory-results: translations (pl)

seg-69304b8b186b = Źródło: <c1/>

seg-df5b53307f50 = Wyniki obserwatorium: 30-dniowy katalog wsteczny dla Bałtyku i badanie czułości

seg-072bdea11014 = Wersja <c1/> na <c2/> (parametry wstępnie zarejestrowane w metodzie bazowej, bez zmian). MODELLED: nie ma zewnętrznej wyroczni, prawdy terenowej ani przypisania przyczyny. Komórka z pogorszoną jakością oznacza, że duży odsetek statków powietrznych próbkowanych tam zgłosił tego dnia niską dokładność nawigacji; nie mówi dlaczego. Komórka nieobserwowana lub nieobecna nie była oceniana, co nie oznacza, że jest czysta.

seg-0d1eeedcab3a = Co uruchomiono

seg-df6ddf801a25 = <b>Źródło:</b> historia readsb z adsb.lol (ODbL { "1.0" }), wydanie GitHub <c1/> z <c2/>, pobierane przez <c3/> po jednej części naraz (około { "3.4" } GB na dobę, { "2" } części). Wydawca nie podaje sum kontrolnych, więc SHA-256 każdej części jest zapisany w <c4/>.

seg-9fa2d2319ed3 = <b>Region i doby:</b> prostokąt { "53.5" }, { "9.0" }, { "66.0" }, { "31.0" } (południe, zachód, północ, wschód: Morze Bałtyckie i jego wybrzeża), { "30" } dób UTC od 2026-09-15 do 2026-10-14, komórki { "0.5" } stopnia, przez <c1/> (jedna doba naraz, surowe pliki usuwane po każdej dobie).

seg-8b65d148bbd8 = <b>Reguły wydania:</b> najnowsza doba (2026-10-14) miała w chwili tworzenia ponad { "24" } h po swoim końcu; w przeciwnym razie polecenie odmawia. Przebiegi regionalne liczą punkt odniesienia sprzętu i tło doby wyłącznie z raportów z prostokąta (<c1/>).

seg-64581554e84a = <b>Pliki:</b> { "120" } plików produktu (GeoJSON, PNG, JSON incydentów, manifest na dobę) <b>nie ma w git</b>. Skrót każdego pliku znajduje się w <c1/>, a dobę można odbudować z jej archiwum i porównać.

seg-c89b88dc3d3b = Przykład tego, co odczytuje doba: 2026-09-15 archiwum zawierało { "110,619,797" } wierszy pozycji w { "79,826" } plikach śladów; { "103.0" } miliona było poza prostokątem, { "5.6" } miliona nie pochodziło z ADS-B, { "1.2" } miliona było na ziemi lub poniżej { "5,000" } ft, { "0.6" } miliona nie miało pola dokładności, a { "212,426" } zostało zagregowanych (liczniki wejścia w <c1/>).

seg-cc590aa74075 = Trzy doby (2026-09-18, 2026-09-26, 2026-10-03) pobrano ponownie z archiwum i uruchomiono drugi raz: GeoJSON, PNG i plik incydentów są <b>identyczne bajt w bajt</b> z pierwszym przebiegiem (SHA-256 równe), więc produkt jest deterministyczny, mimo że sól skrótu identyfikatora jest losowa dla każdego przebiegu.

seg-3532be519183 = Podsumowanie katalogu wstecznego

seg-56aae646318e = doba UTC

seg-42784010b115 = opublikowane komórki

seg-2672b7f55371 = z pogorszoną jakością

seg-378ee89e4bd3 = bez pogorszenia

seg-14783d89f2fe = nieobserwowane (opublikowane)

seg-711d143678ae = incydenty

seg-0f1ffe21d381 = { "30" } dób: łącznie { "96" } komórek z pogorszoną jakością, { "28" } z { "30" } dób z co najmniej jedną, { "70" } incydentów (skupisk stykających się komórek z pogorszoną jakością), żadnej doby z efektem obejmującym całą dobę. Mediana odsetka dotkniętych statków powietrznych w komórce (tło doby) wynosi { "0" } w { "29" } dobach i { "0.006" } w jednej, więc zabezpieczenie tła (komórka musi przekraczać tło o { "0.15" }) nigdy nie zmieniło rozstrzygnięcia w tym regionie. Liczba komórek z pogorszoną jakością na dobę waha się od { "0" } do { "8" } (średnio { "3.2" }). Około jednej trzeciej opublikowanych komórek każdej doby to <c1/> (próbkowano za mało statków powietrznych): granicą tego produktu jest pokrycie, a nie niebo.

seg-606aed861c95 = Czego to nie mówi: doby z większą liczbą komórek z pogorszoną jakością nie są „gorsze” w żadnym sensie fizycznym, trwały dotknięty obszar byłby zaniżony (statki powietrzne, które przez całą dobę latają tylko w jego wnętrzu, nie mają punktu odniesienia poza nim i nie są liczone), a nic tu nie mówi, kto lub co spowodowało niską dokładność.

seg-ef37626a4c47 = Badanie czułości (trzy doby)

seg-aacbb761ee19 = <c1/> odtwarza zarejestrowane raporty z jednej doby przy zmianach po jednym zarejestrowanych parametrów (po dwie wartości, plus siatka { "1.0" } stopnia). Doby: 2026-09-18 (najwięcej komórek z pogorszoną jakością, { "8" }), 2026-09-26 ({ "1" } komórka z pogorszoną jakością) i 2026-10-03 ({ "0" }). Pełne raporty: <c2/> (po { "23" } warianty; odtworzono { "2.2" }, { "1.7" } i { "1.7" } miliona wierszy). Komórki z pogorszoną jakością przy każdym wariancie (wartość zarejestrowana w nawiasie; wynik zarejestrowany to { "8" }, { "1" } i { "0" } komórek z pogorszoną jakością):

seg-dfced7e594d2 = parametr (zarejestrowany)

seg-2ac3e771679d = wartość

seg-0953dbfd76db = siatka { "0.5" } stopnia

seg-bf5746d1a110 = { "2" } (grubsze komórki)

seg-e4016df2fcd3 = Odczyt, bez wskazywania zwycięzcy:

seg-81cfcbf0de89 = Rozstrzygnięcia są wrażliwe na progi kodów dokładności i reguły próbkowania, a małe liczby bardzo się zmieniają.

seg-097ed1aa1504 = <c1/>, <c2/> i <c3/> zmieniają liczbę komórek z pogorszoną jakością co najmniej dwukrotnie w każdej dobie; złagodzenie <c4/> do { "6" } zamienia { "1" } komórkę z pogorszoną jakością w { "12" } w dobie 09-26 (Jaccard ze zbiorem zarejestrowanym { "0.08" }). W dobie 09-18 podniesienie <c5/> do { "0.4" } zachowuje { "1" } z { "8" } (Jaccard { "0.125" }). Rozstrzygnięcie dla komórki w pobliżu progów jest tyle samo stwierdzeniem o progach, co o danych.

seg-0d0c96099d30 = <b><c1/> przesuwa głównie komórki między bez pogorszenia a nieobserwowanymi</b>: w dobie 09-18 zostawia liczbę komórek z pogorszoną jakością na poziomie { "8" }, podczas gdy od { "21" } do { "56" } komórek zmienia stan.

seg-04cc05318a5d = <b>Trzy zabezpieczenia są tu nieaktywne</b>: <c1/>, <c2/> i <c3/> nie zmieniają niczego w żadnej z trzech dób (udział tła wynosi { "0" }), więc ten region i okres nic nie mówią o tym, jak dobrze działają. Miałyby znaczenie tam, gdzie efekt regionalny podnosi tło.

seg-7ba403b84fbd = <b>Grubsza siatka ({ "1.0" } stopnia) zmienia obraz</b> ({ "2" }, { "3" } i { "1" } komórek z pogorszoną jakością; opublikowane komórki spadają do około jednej trzeciej, { "226" } wobec { "694" } w dobie 09-18, ponieważ każda komórka jest czterokrotnie większa): rozmiar komórki jest wyborem metody, a obserwatorium ustala go na { "0.5" } stopnia.

seg-4db2f5313410 = Doba bez zarejestrowanej komórki z pogorszoną jakością (10-03) ma komórki z pogorszoną jakością przy { "9" } z { "22" } wariantów innych niż siatka (do { "8" } przy <c1/> { "6" }): „brak komórki z pogorszoną jakością” jest również stwierdzeniem zależnym od progu.

seg-a818be844f3a = Żaden wariant nie jest sprawdzoną alternatywą, a zarejestrowana reguła nie zmienia się wskutek tego badania. Badanie nie mówi, które wartości parametrów są właściwe.

seg-98c799bfbc25 = <s1>Poprzednia</s1>Obserwatorium zakłóceń: metoda

seg-5d0c003e73dc = <s1>Następna</s1>kshana-bench
