# docs--observatory-method: translations (pl)

seg-0857a94a948e = Ograniczenia

seg-2247a2344710 = Znaczenie

seg-b652b86e6b8e = Stan

seg-7ca62fa39e10 = Źródło: <c1/>

seg-48e063b567d0 = Obserwatorium zakłóceń: opis metody

seg-d0e1d6cadc10 = Wersja <c1/>, zbudowana na <c2/>. Wyłącznie doradczo: to opis tego, jak wyglądały opublikowane raporty pozycji w minionych dniach, a nie pomiar żadnego odbiornika, prognoza, potwierdzenie zakłóceń ani przypisanie ich przyczyny.

seg-c5eab49b8d6f = Co obserwatorium publikuje

seg-165ae7646608 = Jeden produkt na dobę UTC i region, z jednego otwartego archiwum pozycji statków powietrznych. Każda komórka stałej siatki szerokości i długości geograficznej o boku 0.5 stopnia jest w jednym z <b>trzech stanów</b>:

seg-cc07647eb12e = Duży odsetek statków powietrznych próbkowanych w komórce zgłosił tego dnia niską dokładność nawigacji, wyraźnie powyżej tła tego dnia.

seg-3e1dd7caaee6 = Próbkowano dostateczną liczbę statków powietrznych, a odsetek nie spełnił reguły.

seg-8f0d9ad60d62 = Dane nie pozwoliły na rozstrzygnięcie. To <b>nie</b> znaczy „czysto”. Każda taka opublikowana komórka niesie powód dotyczący danych: <c1/>, <c2/> lub <c3/>. Komórka bez żadnego wpisu była widziana przez mniej niż { "5" } różnych statków powietrznych i jest wstrzymana.

seg-e49e05b47061 = Nic więcej nie jest publikowane: żadnej przyczyny, żadnego sprawcy, żadnego rekordu pojedynczego statku powietrznego. Powody opisują, czy dane z danego dnia wystarczały, a nigdy dlaczego dokładność była niska.

seg-7b251c7860e0 = Trzy pliki na dobę (<c1/>):

seg-2008b0ba6ac7 = <c1/>: komórki z <c2/> <c3/>, metoda i jej wstępnie zarejestrowane parametry, licencja i atrybucja, reguła wydania oraz uwaga.

seg-7d5b16eac4a3 = <c1/>: te same komórki jako obraz (z pogorszoną jakością, bez pogorszenia, nieobserwowane zakreskowane; puste komórki nie były obserwowane). Fragmenty tekstu w pliku powtarzają uwagę i licencję.

seg-b76d2e071b16 = <c1/>: <c2/> <c3/>. Stykające się komórki z pogorszoną jakością (łącznie z przekątnymi) tworzą jeden incydent z obwiednią i swoimi komórkami. <c4/> to stały tekst <c5/>. Plik jest wejściem do cyklu raportowania, potwierdzania i powiadamiania (lotniczego cyklu raportowania, który kończy się NOTAM-em); nie jest potwierdzeniem ani NOTAM-em.

seg-49b7bdae0d6e = oraz <c1/> z liczbą bajtów i SHA-256 trzech plików, identyfikatorem metody, licznikami wejścia (wiersze odczytane i wykluczone) i blokiem zbioru danych, tak aby produkt dało się sprawdzić i odtworzyć.

seg-d7bb390fb986 = Reguły wydania (egzekwowane przez polecenie)

seg-87147317f8da = <b>Opóźnienie co najmniej { "24" } h.</b> Produkt z danej doby jest wydawany nie wcześniej niż po końcu tej doby UTC plus <c1/> ({ "24" } lub więcej; mniejsza wartość jest odrzucana). Polecenie odrzuca dobę, której jeszcze nie można opublikować, i podaje najwcześniejszy czas. Nie ma przełącznika, który by to skracał.

seg-43960c3f9b6c = Grube komórki.

seg-1a5ff10e5240 = <c1/> poniżej { "0.5" } jest odrzucane.

seg-e70d8d7f9980 = <b>Tłumienie.</b> Komórka widziana przez mniej niż { "5" } różnych statków powietrznych nie jest publikowana; liczba poniżej { "5" } to <c1/> (łącznie z zerem), tak jak w metodzie bazowej.

seg-ab75582c5032 = <b>Brak przypisania przyczyny.</b> Słownik stanów i powodów nie zawiera przyczyny; sprawdza to test.

seg-0e7d76d7efd0 = <b>Źródła.</b> Tylko adsb.lol (ODbL { "1.0" }) albo zbiór użytkownika z jego własną licencją. <b>Dane OpenSky Network są odrzucane</b> (jej licencja nie zezwala na użycie komercyjne ani redystrybucję map pochodnych). ADS-B i AIS nigdy nie są łączone.

seg-dc28848046ac = <b>Licencja produktu.</b> Plik ADS-B z danymi na komórkę, wykonany z adsb.lol, jest bazą pochodną (Derived Database) i niesie w pliku ODbL { "1.0" } oraz atrybucję adsb.lol. Kod Kshana pozostaje na AGPL-3.0.

seg-9eeba6648fec = Wielkość obserwowana i metoda bazowa

seg-7334dc45eb2f = Statek powietrzny ADS-B zgłasza, jak dokładna jego zdaniem jest jego własna pozycja GNSS: <b>NACp</b> (Navigation Accuracy Category for Position, poziomy zakres { "95" } % od { "10" } NM do poniżej { "3" } m) i <b>NIC</b> (Navigation Integrity Category, promień zawierania). Metoda bazowa (<c1/>, <c2/>) liczy dla każdej komórki i doby odsetek <b>różnych statków powietrznych</b>, których raporty w komórce miały w większości niską dokładność, z zabezpieczeniami: tylko wysokość powyżej { "5,000" } ft; statek powietrzny liczy się tylko wtedy, gdy tego samego dnia zgłosił dobrą dokładność gdzie indziej (punkt odniesienia sprzętu); odsetek w komórce musi przekraczać medianę odsetków w komórkach z tej doby o margines; doba, której mediana sama jest wysoka, jest oznaczana jako zakłócona czynnikiem zewnętrznym i żadna komórka nie jest uznawana za pogorszoną. Parametry ustalono na podstawie definicji pól i reguły prywatności, zanim zbadano jakiekolwiek dane, i są zapisane w każdym pliku wyjściowym. Obserwatorium dodaje trójstanowy słownik, reguły wydania i powyższe pliki i nie zmienia żadnego parametru.

seg-96cf298985c6 = <b>Przebiegi regionalne.</b> Przy <c1/> odczytywane są tylko raporty wewnątrz prostokąta. Punkt odniesienia sprzętu i tło doby są wtedy liczone wyłącznie z raportów z prostokąta, co plik zaznacza (<c2/>). Produkt regionalny jest więc produktem danych tego regionu, a nie wycinkiem produktu globalnego.

seg-2e7007b56a44 = Związek z metodą NACp wobec HDOP z almanachu

seg-4892485e534b = Pleninger, Topkova i Steiner, „GNSS interference detection: Methodology utilising ADS-B NACp indicator and GPS almanac data”, The Aeronautical Journal { "129" } ({ "1331" }), { "206" } do { "223" } ({ "2025" }), doi 10.1017/aer.2024.67, porównują błąd pozycji wynikający z NACp statku powietrznego z HDOP (poziomym rozmyciem dokładności) konstelacji GPS wyznaczonym z danych almanachu i oznaczają statek powietrzny jako dotknięty, gdy oba się rozchodzą; artykuł ocenia metodę na eksperymentach z umyślnym zagłuszaniem GPS.

seg-74ec1aca8a22 = <b>Z czego korzystaliśmy.</b> Tylko z opublikowanego streszczenia i rekordu bibliograficznego. Pełny tekst był dla nas niedostępny (za paywallem), więc nie znamy ani jego odwzorowania NACp na oszacowanie błędu, ani jego obliczenia HDOP, ani jego progów i nie twierdzimy, że je odtwarzamy.

seg-4f8471649a07 = <b>Co zamiast tego robi obserwatorium.</b> Pytanie, na które odpowiada porównanie z almanachem, brzmi: „czy sama geometria konstelacji mogłaby wyjaśnić tę niską dokładność?”. Metoda bazowa odpowiada na pytanie pokrewne bez almanachu: niski odsetek musi wyróżniać się na tle tej samej doby w całym regionie oraz na tle własnych dobrych raportów statku powietrznego gdzie indziej. To inny i słabszy substytut: nie potrafi powiedzieć, że godzina o spokojnej geometrii miała pogorszoną jakość tam, gdzie tło doby też jest niskie. Układ oceniający HDOP z almanachu <b>nie jest zaimplementowany</b>. To otwarta pozycja, do zbudowania z pełnego tekstu artykułu i publicznego almanachu GPS oraz do wstępnej rejestracji przed uruchomieniem; do tego czasu jest cytowany, a nie twierdzony.

seg-e9b9902633af = Odtwarzanie produktu

seg-95e48f0286d9 = Potok jest deterministyczny we wszystkim, co publikuje (sól identyfikatorów dla każdego przebiegu zmienia tylko wewnętrzne skróty, które nigdy nie są zapisywane). Wartości SHA-256 w manifeście pozwalają porównać drugi przebieg bajt po bajcie.

seg-65236a42e316 = Badanie czułości

seg-0c843e799b8f = <c1/> odtwarza raporty z jednej doby przy zmianach po jednym każdego wstępnie zarejestrowanego parametru (po dwie wartości, plus siatka { "1.0" } stopnia) i podaje dla każdego wariantu liczbę komórek z pogorszoną jakością, bez pogorszenia i nieobserwowanych, indeks Jaccarda zbioru pogorszonego ze zbiorem zarejestrowanym, komórki, których stan się zmienił, oraz powierzchnię pogorszoną. Nie zmienia niczego w zarejestrowanej regule: wariant nie jest sprawdzoną alternatywą, a duża zmiana pod wpływem parametru mówi, jak bardzo rozstrzygnięcie zależy od tego parametru, a nie która wartość jest właściwa. Wyniki dla katalogu wstecznego są w <c2/>.

seg-cc57d45c4b0a = <b>Pokrycie.</b> adsb.lol opiera się na odbiornikach wolontariuszy; otwarte morze i słabo pokryta przestrzeń powietrzna są rzadko próbkowane, a <c1/> jest tam częste. Mapa pokazuje pokrycie swojego źródła.

seg-e3921e1eb177 = <b>Co oznacza niska dokładność.</b> NACp i NIC spadają z powodów innych niż zakłócenia: awarii satelitów lub systemów wspomagania, pogody kosmicznej, usterek odbiornika lub transpondera oraz geometrii. Żaden stan nie sugeruje przyczyny.

seg-e5ad0dc456c0 = <b>Statki powietrzne, które przez całą dobę pozostają w dotkniętym regionie,</b> nie mają punktu odniesienia poza nim i nie są liczone, więc metoda zaniża trwały efekt regionalny. Badanie czułości pokazuje wpływ zabezpieczenia punktu odniesienia.

seg-a2d41becc19b = <b>Granice doby</b> są w UTC; zdarzenie, które przekracza północ, jest dzielone między dwie doby.

seg-436af9f16feb = <b>Brak prawdy terenowej.</b> Obserwatorium nie ma zewnętrznej wyroczni: każda wartość jest MODELLED i żaden wiersz macierzy weryfikacji na nim nie spoczywa.

seg-5c4966f0166d = <b>Wrażliwość tematu.</b> Mapy tego rodzaju są sprawą polityczną. Obserwatorium podaje metodę, opóźnienie i słownik, i nic więcej; nie wskazuje państw ani podmiotów i nie publikuje w czasie rzeczywistym.

seg-874f46a80c8b = <s1>Poprzednia</s1>Odczyt protokołów odbiorników

seg-3137b7595e59 = <s1>Następna</s1>Obserwatorium zakłóceń: wyniki
