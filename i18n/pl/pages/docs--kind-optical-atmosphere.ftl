# docs--kind-optical-atmosphere: translations (pl)

seg-f42465f7d066 = ns

seg-37d16b499bc5 = dB

seg-37d29d8303fe = km

seg-51362910dcb7 = Tego rodzaju używa { "2" } dołączonych scenariuszy; pozostałe są w <a1><c1/></a1>.

seg-72ad48275ebe = Rodzaj scenariusza silnika v{ $version }, rodzina <a1>Optyczne PNT</a1>. Wyłącznie doradczo: wynik analizy z narzędzia badawczo-inżynieryjnego; nie jest to sprzęt nawigacyjny z zatwierdzeniem typu ani usługa bezpieczeństwa życia. Każda etykieta tutaj pochodzi z silnika lub z macierzy weryfikacji; rodzaj jest MODELLED, chyba że macierz stanowi inaczej (jak zdobywa się etykietę: sekcja Evidence w README).

seg-a97755cb13eb = Strona rodziny: <a1>Optyczne PNT</a1>

seg-d4e4da22fadb = Źródło: <c1/>

seg-deb0a932a76f = <c1/> (rodzaj scenariusza)

seg-a878d9be65b7 = MODELLED optyczne PNT przez atmosferę: dla łącza optycznego i zbioru stacji naziemnych o podanych klimatach chmurowych podaje zależną od długości fali i elewacji stratę w czystym powietrzu (prawo widzialności Kima plus Rayleigh), stan turbulencji Hufnagela-Valleya (wariancja Rytova, wskaźnik scyntylacji, parametry gamma-gamma, uśrednianie apertury), zależną od pogody dostępność względem zapasu łącza (głębokość optyczna chmur z logarytmiczno-normalnego klimatu wody ciekłej, ekstynkcja w optyce geometrycznej, niezależny zanik turbulencyjny), zapas łącza potrzebny dla docelowych dostępności, rozkład czasu trwania przerw, narastanie błędu czasu i odległości przy każdej przerwie według modelu holdover zegara, dostępność dywersyfikacji stacji skorelowaną odległością oraz zyski w scenariuszach „co by było, gdyby” dla technik ulepszania (długość fali, apertura odbiorcza, redukcja scyntylacji optyką adaptacyjną, dodatkowy zapas). VALIDATED jako implementacja podanych wzorów względem niezależnej wyroczni mpmath: wariancja Rytova, wskaźnik scyntylacji, prawdopodobieństwo zaniku gamma-gamma, współczynnik uśredniania apertury, głębokość optyczna chmur i czystego powietrza. MODELLED: każde wejście dotyczące pogody, techniki i zegara oraz założenia niezależności i kopuły; nie porównano żadnego zmierzonego zapisu dostępności. Analiza wyłącznie doradcza, a nie produkt dostępności ani nawigacji objęty certyfikacją.

seg-c443d8d3e4ce = Jeden przebieg <c1/> podsumowuje się tak: optical-atmosphere: { "1550" } nm przy elewacji { "30" } stopni, zapas { "19.2" } dB przed atmosferą; najlepsza stacja southern { "74.66" } %; sieć 3 stacji { "92.72" } % przy niezależnej / { "91.62" } % przy skorelowanej pogodzie (MODELLED, doradczo)

seg-e466ecbd4e6d = Pola opcjonalne: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>

seg-8adae3ea6e60 = Przykład <c1/> ustawia między innymi:

seg-687f2930a40d = łącze w dół

seg-e794d481aed4 = płaska

seg-a0fb22dd0a44 = [ocxo, rafs, dsac]

seg-9799bd5f9fdb = nm

seg-7707c45d1d30 = dBm

seg-0fd6a569077f = Etykieta wyniku (silnika): MODELLED — optyczne PNT przez atmosferę: ekstynkcja w czystym powietrzu (prawo widzialności Kima + Rayleigh), głębokość optyczna chmur z podanego klimatu wody ciekłej (ilość wg P.840, ekstynkcja w optyce geometrycznej), turbulencja Hufnagela-Valleya z zanikami gamma-gamma i uśrednianiem apertury, dostępność względem

seg-4e2b759aff17 = Wykres zapisany przez silnik dla scenarios/optical-atmosphere-network.toml, rodzaj optical-atmosphere

seg-a18d144f149e = <b>MODELLED</b> Cn2 Hufnagela-Valleya scałkowane wzdłuż drogi ukośnej dla wariancji Rytova fali płaskiej i sferycznej (łącze w górę i w dół), wskaźnik scyntylacji Andrewsa-Phillipsa i parametry gamma-gamma, prawdopodobieństwo zaniku gamma-gamma i zapas na zanik, Testy: <a1>optical_atmosphere_reference.rs</a1>.

seg-d97535fd4875 = <b>MODELLED</b> Dostępność łącza optycznego względem podanego zapasu łącza z logarytmiczno-normalnego klimatu wody ciekłej w chmurach (ilość wg ITU-R P.840, ekstynkcja w optyce geometrycznej) i niezależnego zaniku turbulencyjnego gamma-gamma, zapas łącza potrzebny dla docelowej Testy: <a1>optical_atmosphere_identities.rs</a1>.

seg-6e2c643df3a6 = <b>MODELLED</b> Rozkład czasu trwania przerw stacji optycznej sprzężony z zamkniętą wariancją wybiegu modelu holdover zegara: błąd czasu i odległości przy podanych kwantylach przerw, holdover do progu czasu, udział przerw i Testy: <a1>optical_atmosphere_identities.rs</a1>.

seg-00c76aeadb90 = <b>MODELLED</b> Opcjonalna tabela <c1/> (czas trwania, krok, ziarno) sprawia, że rodzaj <c2/> zapisuje także, dla każdej stacji, jedną realizację z ziarnem podanego modelu stacji w czasie: epizody chmur (czas czystego nieba wykładniczy, przerwy chmurowe logarytmiczno-normalne Testy: <a1>optical_atmosphere_timeseries.rs</a1>.

seg-f1ee20e52b46 = <b>MODELLED</b> Cn2 Hufnagela-Valleya scałkowane wzdłuż drogi ukośnej dla wariancji Rytova fali płaskiej i sferycznej (łącze w górę i w dół), wskaźnik scyntylacji Andrewsa-Phillipsa i ind. Wyrocznia (ExternalDataset): obliczenia numeryczne porównano z niezależnym programem (xval/optical-atmosphere/oracle.py, mpmath { "1.4.1" } przy { "30" } cyfrach, kwadratura tanh-sinh po oryginalnej zmiennej wysokości i gęstości gamma-gamma z funkcją Bessela K), który nie dzieli z Kshana żadnego kodu, według progów ustalonych przed powstaniem jakiejkolwiek implementacji (xval/optical-atmosphere/PREREGISTRATION.md). DLACZEGO MODELLED: ta wyrocznia oblicza te same opublikowane wzory, więc sprawdza im

seg-4af9bc99ef29 = <b>MODELLED</b> Dostępność łącza optycznego względem podanego zapasu łącza z logarytmiczno-normalnego klimatu wody ciekłej w chmurach (ilość wg ITU-R P.840, ekstynkcja w optyce geometrycznej) i . Wyrocznia (InternalConsistency): spójność wewnętrzna: granice w postaci zamkniętej i monotoniczność modelu dywersyfikacji, formuła zamknięta pułapu chmur oraz tożsamości logarytmiczno-normalne przerw. ŻADNA wyrocznia zewnętrzna nie jest deklarowana i żadnej nie porównano: nie użyto żadnego zmierzonego zapisu dostępności optycznej stacji naziemnej ani czystej linii widzenia bez chmur. DLACZEGO MODELLED: klimat chmurowy (prawdopodobieństwo chmur, mediana i rozrzut kolumny wody ciekłej, czasy trwania przerw),

seg-b3abf6cbeba4 = <b>MODELLED</b> Rozkład czasu trwania przerw stacji optycznej sprzężony z zamkniętą wariancją wybiegu modelu holdover zegara: błąd czasu i odległości przy podanych kw. Wyrocznia (InternalConsistency): spójność wewnętrzna z modułem holdover, bit w bit; ŻADNA wyrocznia zewnętrzna nie jest deklarowana. PSD klas są zsyntetyzowanymi podłogami długiego tau, które moduł holdover już zawiera, więc wartości dziedziczą jego podane zastrzeżenie, że holdover do ciasnego progu zależy od przyjętej podłogi szumu czerwonego, a nie od przytoczonego odchylenia Allana. Czasy trwania przerw to model logarytmiczno-normalny o podanych parametrach, a nie zmierzony c

seg-c4772a9e1a26 = MODELLED — optyczne PNT przez atmosferę: ekstynkcja w czystym powietrzu (prawo widzialności Kima + Rayleigh), głębokość optyczna chmur z podanego klimatu wody ciekłej (ilość wg P.840, ekstynkcja w optyce geometrycznej), turbulencja Hufnagela-Valleya z zanikami gamma-gamma i uśrednianiem apertury, dostępność względem zapasu łącza, czasy trwania przerw sprzężone z holdover zegara oraz dywersyfikacja stacji skorelowana odległością. Obliczenia numeryczne są sprawdzone (wynik <c1/>)

seg-32c6524b0baf = MODELLED optyczne PNT przez atmosferę: dla łącza optycznego i zbioru stacji naziemnych o podanych klimatach chmurowych podaje zależną od długości fali i elewacji stratę w czystym powietrzu (prawo widzialności Kima plus Rayleigh), stan turbulencji Hufnagela-Valleya (wariancja Rytova, wskaźnik scyntylacji, parametry gamma-gamma, uśrednianie apertury), zależną od pogody dostępność względem zapasu łącza (głębokość optyczna chmur z (katalog rodzajów (<c1/>))

seg-2c7493ee5042 = MODELLED: każde wejście dotyczące pogody, techniki i zegara oraz założenia niezależności i kopuły; nie porównano żadnego zmierzonego zapisu dostępności. (katalog rodzajów (<c1/>))

seg-b4402211e3fe = Optyczne PNT przez atmosferę: trzy ILLUSTRATIVE stacje naziemne (bardziej pochmurna stacja północna, pośrednia stacja środkowa i bardziej bezchmurna stacja południowa) obserwujące optyczny terminal LEO przy elewacji { "30" } stopni na { "1550" } nm. Klimaty chmurowe są podanymi wejściami, a nie pomiarami ani wartościami żadnego zbioru danych, więc każda poniższa dostępność jest MODELLED. Przebieg podaje dla każdej stacji stratę w czystym powietrzu, stan turbulencji Hufnagela-Valleya, t (komentarz w pliku scenariusza, wiersze { "1" } do { "8" })

seg-384f5c73cdf9 = Jedna realizacja z ziarnem łącza każdej stacji w czasie (MODELLED; losowanie z powyższego modelu, a nie klimat). Gdy jej brak, nie jest zapisywany żaden szereg, a wynikiem jest dokument { "0.37" }. (komentarz w pliku scenariusza, wiersze { "78" } do { "79" })

seg-c75fa5787bd4 = Optyczne obliczenia numeryczne atmosfery na drodze ukośnej: wariancja Rytova, scyntylacja, prawdopodobieństwo zaniku gamma-gamma, uśrednianie apertury, głębokość optyczna chmur i czystego powietrza jest MODELLED, nie sprawdzona względem niezależnego wzorca zewnętrznego: podtwierdzenie jest sprawdzone zewnętrznie, ale cała możliwość składa się z elementów obliczonych na podstawie modelu, więc pozostaje obliczona na podstawie modelu. (macierz weryfikacji (docs/MODELLED-RATIONALE.md))

seg-e5013bdf86bb = Zależna od pogody dostępność optycznych stacji naziemnych i dywersyfikacja stacji skorelowana odległością jest MODELLED, nie sprawdzona względem niezależnego wzorca zewnętrznego: sprawdzona względem własnej tożsamości w postaci zamkniętej lub analitycznej — wychwytuje błędy przepisania i współczynników, ale nie jest wyrocznią zewnętrzną. (macierz weryfikacji (docs/MODELLED-RATIONALE.md))

seg-dc1132147318 = Strona tematyczna: <a1>OPTICAL-ATMOSPHERE.md</a1>

seg-bd5b1654b3ed = <s1>Poprzednia</s1>oem-interop

seg-ef0a779c300c = <s1>Następna</s1>orbit
