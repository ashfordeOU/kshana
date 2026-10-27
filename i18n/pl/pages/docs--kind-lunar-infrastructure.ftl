# docs--kind-lunar-infrastructure: translations (pl)

seg-1f17ef6a853e = Rodzaj scenariusza silnika v{ $version }, rodzina <a1>Przestrzeń księżycowa i cislunarna</a1>. Wyłącznie doradczo: wynik analizy z narzędzia badawczo-inżynieryjnego; nie jest to sprzęt nawigacyjny z zatwierdzeniem typu ani usługa bezpieczeństwa życia. Każda etykieta tutaj pochodzi od silnika lub z macierzy weryfikacji; rodzaj jest MODELLED, o ile macierz nie mówi inaczej (jak zdobywa się etykietę: sekcja Evidence w README).

seg-1c1eeb2dcaa0 = Strona rodziny: <a1>Przestrzeń księżycowa i cislunarna</a1>

seg-619127334cf3 = Żaden wiersz macierzy nie wymienia tego rodzaju po nazwie; etykieta na jego wyniku jest własną etykietą silnika, powyżej.

seg-d1beb62cf742 = Ten rodzaj stosuje { "6" } dołączonych scenariuszy; pozostałe są w <a1><c1/></a1>.

seg-e821670a8b55 = Źródło: <c1/>

seg-56953faa67ae = <c1/> (rodzaj scenariusza)

seg-d0fb90f506c9 = MODELLED badania orbity i powierzchni Księżyca jako infrastruktury nawigacyjnej i geodezyjnej, pięć badań w jednym rodzaju wybieranym przez <c1/>: od-consistency (pokładowe wyznaczanie orbity z Ziemi-GNSS na orbicie NRHO lub ELFO względem niezależnego naziemnego radiometrycznego wyznaczania orbity, oceniane według własnych kowariancji w Monte Carlo z zadanym ziarnem), carrier-phase (wspólna podwójnie różnicowana faza nośnej powierzchnia–orbiter i rozwiązywanie całkowitoliczbowej niejednoznaczności metodą LAMBDA), frame-coestimation (stacja powierzchniowa i orbitery dodane do pomiarów odległości ze stacji ziemskich dla siedmioparametrowego księżycowego układu odniesienia), space-tie (GNSS, VLBI i laserowe wyznaczanie odległości na jednym statku, precyzja powiązania układów względem błędu powiązania lokalnego) i geodesy-sensitivity (informacja Fishera o liczbach Love'a h2, k2, l2 Księżyca i fizycznej libracji z laserowego wyznaczania odległości, śledzenia orbiterów, grawimetru powierzchniowego i zegara powierzchniowego). Ograniczony model trzech ciał ze wskazanymi uproszczeniami; metody numeryczne sprawdzono względem niezależnych programów i nic nie porównano z pomiarem wielkości księżycowej.

seg-5753b7552559 = Jeden przebieg <c1/> podsumowuje się tak: lunar-infrastructure space-tie: { "4" } punkty przeglądu na { "1" } łukach; laser-vs-GNSS x sigma translacji { "1.0363" } m przy zarejestrowanym powiązaniu lokalnym

seg-f2594b18e718 = Pola wymagane: <c1/>

seg-4875c29c517c = Pola opcjonalne: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>

seg-7b33bdb70a30 = Przykład <c1/> ustawia między innymi:

seg-5fad84cbb2be = nrho

seg-def582a1f2ca = Etykieta wyniku (silnika): MODELLED — ograniczony model trzech ciał (punktowe masy Ziemi i Księżyca, bez Słońca, bez harmonik pola grawitacyjnego Księżyca) ze wskazanymi uproszczeniami i danymi wejściowymi ILLUSTRATIVE oznaczonymi publicznymi źródłami. Metody numeryczne sprawdzono względem niezależnych programów; nic nie porównano z pomiarem wielkości księżyc

seg-f3b4a80a739b = brak wykresu: przykład nie zapisuje wykresu

seg-35a4a7a25561 = <b>MODELLED</b> Wyznaczanie orbity na orbicie halo prawie prostoliniowej (lub eliptycznej orbicie zamrożonej) z dwóch niezależnych typów danych: pseudoodległości Ziemi-GNSS odbieranych na pokładzie. Wyrocznia (ReferenceImpl): niezależny program scipy/numpy całkuje te same równania wariacyjne (próg O1). Nic nie porównano z pomiarem orbity księżycowej. Wyrocznia sprawdza metody numeryczne wskazanych wzorów, a nie fizykę, więc wiersz pozostaje MODELLED. Ograniczony model trzech ciał: bez Słońca, bez harmonik księżycowych, oś obrotu Ziemi wzdłuż normalnej orbity, dane wejściowe odbiornika i stacji ILLUSTRATIVE.

seg-32455bf5f804 = <b>MODELLED</b> Różnicowana między odbiornikami faza nośnej i kod Ziemi-GNSS na księżycowej stacji powierzchniowej i orbiterze, z różnicą zegarów na epokę wyłączoną profilowaniem. Wyrocznia (ReferenceImpl): niezależne rozwiązanie numpy tych samych równań normalnych z wyeksportowanych wierszy (Q3) i wyczerpujące wyliczenie liczb całkowitych (Q4). Żadnego pomiaru fazy nośnej GNSS ani księżycowej nie porównano z. MODELLED.

seg-b20c412516b6 = <b>MODELLED</b> Informacja Fishera siedmioparametrowego księżycowego układu odniesienia z laserowego wyznaczania odległości ze stacji ziemskich do pięciu reflektorów samych i z zakresem orbiter–stacja powierzchniowa. Wyrocznia (ReferenceImpl): niezależna różnica skończona numpy modelu prostego (F2). Nic nie porównano z rzeczywistymi rozwiązaniami księżycowego układu odniesienia. Współczynnik zależy od założonej znanej orbity i sigma odległości { "1" } m. MODELLED.

seg-151c96b1f882 = <b>MODELLED</b> Precyzja Craméra-Rao przesunięć międzytechnikowych translacji, skali i obrotu między układami GNSS, VLBI i laserowego wyznaczania odległości, gdy jeden statek kosmiczny niesie wszystkie. Wyrocznia (ReferenceImpl): niezależny układ ułożony w stos w numpy z niewiadomymi pozycji wyeliminowanymi jawnymi dopełnieniami Schura (T3). Nie porównano z danymi GRASP, Genesis ani innej misji. MODELLED.

seg-743d78806f6a = MODELLED — ograniczony model trzech ciał (punktowe masy Ziemi i Księżyca, bez Słońca, bez harmonik pola grawitacyjnego Księżyca) ze wskazanymi uproszczeniami i danymi wejściowymi ILLUSTRATIVE oznaczonymi publicznymi źródłami. Metody numeryczne sprawdzono względem niezależnych programów; nic nie porównano z pomiarem wielkości księżycowej i nic tu nie jest stwierdzeniem o żadnej misji ani systemie. Brak powiązań z żadną agencją ani jej poparcia. Wyłącznie doradczo (wynik <c1/>)

seg-da35c5298311 = MODELLED badania orbity i powierzchni Księżyca jako infrastruktury nawigacyjnej i geodezyjnej, pięć badań w jednym rodzaju wybieranym przez <c1/>: od-consistency (pokładowe wyznaczanie orbity z Ziemi-GNSS na orbicie NRHO lub ELFO względem niezależnego naziemnego radiometrycznego wyznaczania orbity, oceniane według własnych kowariancji w Monte Carlo z zadanym ziarnem), carrier-phase (wspólna podwójnie różnicowana faza nośnej powierzchnia–orbiter i całkowitoliczbowa niejednoznaczność (katalog rodzajów (<c2/>))

seg-4658f67623b5 = Scenariusz lunar-infrastructure Kshana: space-tie. MODELLED; projekt, dane wejściowe i progi są ustalone w xval/lunar-infra/PREREGISTRATION.md (zatwierdzone przed jakimkolwiek przebiegiem). Dane wejściowe ILLUSTRATIVE są tam oznaczone publicznymi źródłami. (komentarz w pliku scenariusza, wiersze { "1" } do { "3" })

seg-f7257c25f137 = Księżycowe wyznaczanie orbity: Ziemia-GNSS wobec naziemnego radiometrycznego ma poziom MODELLED, nie jest niezależnie sprawdzone względem wzorca zewnętrznego: sprawdzono je względem odrębnej implementacji w tej samej bazie kodu — niezależnej od testowanego elementu, ale nie będącej autorytetem zewnętrznym. (macierz weryfikacji (docs/MODELLED-RATIONALE.md))

seg-a3988ca0b8ea = Księżycowe rozwiązywanie niejednoznaczności fazy nośnej: powierzchnia i orbiter ma poziom MODELLED, nie jest niezależnie sprawdzone względem wzorca zewnętrznego: sprawdzono je względem odrębnej implementacji w tej samej bazie kodu — niezależnej od testowanego elementu, ale nie będącej autorytetem zewnętrznym. (macierz weryfikacji (docs/MODELLED-RATIONALE.md))

seg-b2e4ab7b6e60 = Księżycowa współestymacja układu odniesienia: stacje powierzchniowe i orbitery ma poziom MODELLED, nie jest niezależnie sprawdzona względem wzorca zewnętrznego: sprawdzono ją względem odrębnej implementacji w tej samej bazie kodu — niezależnej od testowanego elementu, ale nie będącej autorytetem zewnętrznym. (macierz weryfikacji (docs/MODELLED-RATIONALE.md))

seg-6eedb30a58c5 = Precyzja powiązania układów space-tie: współlokowane GNSS, VLBI i laserowe wyznaczanie odległości ma poziom MODELLED, nie jest niezależnie sprawdzona względem wzorca zewnętrznego: sprawdzono ją względem odrębnej implementacji w tej samej bazie kodu — niezależnej od testowanego elementu, ale nie będącej autorytetem zewnętrznym. (macierz weryfikacji (docs/MODELLED-RATIONALE.md))

seg-cd5f729c9622 = Strona tematu: <a1>LUNAR-INFRASTRUCTURE.md</a1>

seg-4df4c0059362 = <s1>Poprzedni</s1>lunar-frame-realisation

seg-c88eef4a7214 = <s1>Następny</s1>lunar-integrity
