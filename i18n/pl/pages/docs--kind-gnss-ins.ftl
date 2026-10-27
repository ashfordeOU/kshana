# docs--kind-gnss-ins: translations (pl)

seg-b054c73f22e5 = brak wartości

seg-ee7dd15019d0 = Strona tematu: <a1>CAMPAIGNS.md</a1>

seg-619127334cf3 = Żaden wiersz macierzy nie wymienia tego rodzaju po nazwie; etykieta na jego wyniku jest własną etykietą silnika, powyżej.

seg-7b2721b7588d = Rodzaj scenariusza silnika v{ $version }, rodzina <a1>Czujniki inercyjne, fuzyjne i kwantowe</a1>. Wyłącznie doradczo: wynik analizy z narzędzia badawczo-inżynieryjnego; nie jest to sprzęt nawigacyjny z zatwierdzeniem typu ani usługa bezpieczeństwa życia. Każda etykieta tutaj pochodzi z silnika lub z macierzy weryfikacji; rodzaj jest MODELLED, chyba że macierz stanowi inaczej (jak zdobywa się etykietę: sekcja Evidence w README).

seg-195347c63a8a = m/s^{ "2" }

seg-451a304052c4 = <b>MODELLED</b> Akcelerometr z interferometrem zimnych atomów z pierwszych zasad (k_eff·T², QPN). Wyrocznia (ExternalDataset): opublikowane wektory liczbowe z podstawowych prac o CAI (funkcja przenoszenia Cheinet { "2008" }; czułość Peters/Freier): k_eff·T² dopasowane dokładnie, ASD szumu śrutowego jako jednostronny próg w granicach ~{ "2" }× od każdego opublikowanego przyrządu (rzeczywiste urządzenia mają szum techniczny powyżej progu kwantowego). Przedział, nie równość. { "0.30" } runda { "2" } (zarejestrowane z góry fcb9ac64), ustalenie (pozostaje MODELLED): szum rotacji tylko od QPN względem zmierzonego Gauguet et al.

seg-9955b1b1c018 = Wydajność kwantowego czujnika inercyjnego jest MODELLED, nie jest sprawdzona względem niezależnego wzorca: podtwierdzenie jest sprawdzone zewnętrznie, ale cała możliwość składa się z elementów obliczonych na podstawie modelu, więc możliwość pozostaje oznaczona jako obliczona na podstawie modelu. (macierz weryfikacji (docs/MODELLED-RATIONALE.md))

seg-f7f12029e0ec = Strona rodziny: <a1>Czujniki inercyjne, fuzyjne i kwantowe</a1>

seg-fd8fad481c81 = Źródło: <c1/>

seg-e726a6d74d81 = <c1/> (rodzaj scenariusza)

seg-38df285a3f25 = Luźno i ściśle sprzężony EKF stanu błędu GNSS/INS.

seg-e1e235215947 = Jeden przebieg <c1/> podsumowuje się tak: scenario c55a6246bd6f | gnss-ins | quantum outage-RMS fused 1.9m vs free 130.7m (hold 60s, avail { "1.00" }) | classical fused 3.1m vs free 314.3m (hold 60s, avail { "1.00" })

seg-e3112eac77af = Wymagane pola: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>

seg-6c128eb60a91 = Pola opcjonalne: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>

seg-79c75d3e461d = Przykład <c1/> ustawia między innymi:

seg-ca448daf5ec7 = nominal

seg-49f2fa051719 = denied

seg-327a2c4885bd = Inercyjna jednostka MEMS/kwarcowa klasy taktycznej: większy resztkowy bi

seg-d1beb62cf742 = Ten rodzaj stosuje { "6" } dołączonych scenariuszy; pozostałe są w <a1><c1/></a1>.

seg-7d993b676006 = Wykres zapisany przez silnik dla scenarios/gnss-ins.toml, rodzaj gnss-ins

seg-ea4498cc0324 = <b>VALIDATED</b> 15-stanowy EKF stanu błędu, luźno sprzężony (sprawdzony na rzeczywistym przejeździe z IMU/GNSS względem NaveGo); ściśle sprzężony UKF pseudoodległości/Dopplera i sprzężony zegar+poz. Wyrocznia (ExternalDataset): NaveGo v1.4 (R. Gonzalez, LGPL-3.0, uruchamiany jako narzędzie w GNU Octave, nigdy nie linkowany): jego luźno sprzężony ins_gnss na własnym rzeczywistym przejeździe pojazdu lądowego z IMU/GNSS Ekinox, oba rozwiązania ocenione względem trajektorii odniesienia Ekinox. Oba filtry czytają te same dane wejściowe float32 o częstotliwości { "20" } Hz, a konfiguracja Kshana jest odwzorowana mechanicznie z opublikowanych parametrów zbioru danych. Poziomy i pionowy RMS położenia Kshana oraz jego

seg-742a29ca1fb7 = Strona tematu: <a1>TEST-BENCH.md</a1>

seg-f3cc3d82aba8 = <s1>Poprzedni</s1>fusion

seg-af503aa1d900 = <s1>Następny</s1>gnss-sim
