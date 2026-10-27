# docs--kinds-gps-denied-alternative-pnt: translations (pl)

seg-b03d56f501c3 = Rodzaj

seg-f496b7f4c63a = Połączony nawigator grawitacyjny + magnetyczny + terenowy bez GPS: trzy skalarne kanały pól łączone w każdym punkcie trasy dla ostrzejszego (o niższym CRLB) wskazania dryfu niż w przypadku pojedynczego pola.

seg-498b1aea3770 = Wykres zapisywany przez silnik dla scenarios/combined-altpnt.toml, rodzaj combined-altpnt

seg-c8f93431680a = Odporność warstwowego PNT w konflikcie MODELLED (P7): użytkownik w środowisku spornym dysponuje kilkoma warstwami PNT (GNSS usługi otwartej, szerokopasmowy GNSS, uwierzytelniona konstelacja, przekaźnik augmentacji), każda z bazową dostępnością, dokładnością 1σ i podatnością na odmowę dla każdego wektora wspólnego zagrożenia zagłuszaniem/spoofingiem. Przeglądany po intensywności Monte Carlo Z ZIARNEM odmawia każdej warstwie z prawdopodobieństwem clamp(podatność·intensywność·waga_wektora,{ "0,1" }), łączy ocalałe zamkniętą regułą odwrotnej wariancji σ_fused=(Σ 1/σ_i²)^(−1/2) i podaje prawdopodobieństwo całkowitej utraty (wszystkie warstwy odmówione), medianę błędu po połączeniu oraz statystyki użyteczności/odmowy dla każdej warstwy względem intensywności. Główny współczynnik odporności (prawdopodobieństwo całkowitej utraty dla pojedynczej warstwy wobec warstwowego) wynosi ~7x przy założeniu NIEZALEŻNOŚCI; jednoczynnikowy przegląd skorelowanej odmowy z kopułą Gaussa pokazuje następnie, że to ~7x zapada się ku { "1" } w miarę wzrostu korelacji odmowy (korelacja pokonuje warstwowanie). Blok wrażliwości na założenia a priori rozpina wynik główny po ŹRÓDŁOWO UDOKUMENTOWANYCH założeniach podatności przez tornado mcda + realokację wysiłku zagrożenia Dirichleta + przedziały ufności z percentyli. Rdzeń VALIDATED: całkowita utrata Monte Carlo zbiega do zamkniętego iloczynu niezależnego Π_i p_deny_i (w granicach błędu standardowego MC przy stałym ziarnie i dużym N); połączenie odwrotnej wariancji jest tożsamością w postaci zamkniętej; przy ρ={ "0" } kopuła redukuje się do modelu niezależnego, a każde ρ zachowuje brzegowy wskaźnik odmowy każdej warstwy. MODELLED: wielkości podatności/dostępności/dokładności dla każdej warstwy są danymi wejściowymi ze źródeł, ale obliczonymi na podstawie modelu (JammerTest { "2024" }, TEXBAT, EASA SIB, RTCA DO-229, LunaNet/IOAG — zob. conflict_threat_params), a konkretna wielkość ~7x i kształt krzywej współczynnik-względem-korelacji wynikają z tej parametryzacji. Podział przeżywalności dla każdego wektora w § { "4.2" } rozdziela następnie wspólne zagrożenie RF na cztery nazwane wektory (zagłuszanie/spoofing/kinetyczny/cybernetyczny) i podaje dla każdego wektora krzywą łagodnej degradacji użytecznego PNT S_v(x)=1-Prod_i(1-a_i(1-clamp(susceptibility_i,v·x,{ "0,1" }))) — VALIDATED: Monte Carlo z ziarnem dla każdej warstwy zbiega do tej postaci zamkniętej; zagłuszanie jest najostrzejszym wektorem dla skorelowanego punktu odniesienia RF, a warstwa inercjalna odporna na RF jest decydującym ocalałym. To nie jest certyfikowany produkt do oceny dostępności nawigacji.

seg-4dd2bcc206db = Wykres zapisywany przez silnik dla scenarios/conflict-resilience.toml, rodzaj conflict-resilience

seg-9a58a7b09423 = Nawigacja z dopasowaniem do mapy grawitacyjnej bez GPS: grawimetr na zimnych atomach odtwarza stały dryf INS z ciągu anomalii grawitacyjnych, przez który przelatuje.

seg-c42d90057e9f = Wykres zapisany przez silnik dla scenarios/gravity-map-nav.toml, rodzaj gravity-map

seg-4aca87f022dc = Wykres zapisywany przez silnik dla scenarios/terrain-slam.toml, rodzaj terrain-slam

seg-4e31c8daf798 = Rejestr (ledger)

seg-efd15cff3d32 = MODELLED (etykieta wyniku)

seg-9d9aeff4f2ee = Źródło: <c1/>

seg-d9fdaf3208ca = Alternatywne PNT w warunkach braku GPS (rodzina rodzajów scenariuszy)

seg-9fde6af9e09f = { "5" } rodzajów scenariuszy silnika v{ $version }. Wyłącznie doradczo: wynik analizy z narzędzia badawczo-inżynieryjnego; nie jest to sprzęt nawigacyjny z zatwierdzeniem typu ani usługa bezpieczeństwa życia. Każda etykieta tutaj pochodzi z silnika lub z macierzy weryfikacji; rodzaj ma status MODELLED, chyba że macierz stanowi inaczej (jak zdobywa się etykietę: sekcja Evidence w README).

seg-0d3b170b9fbc = Strony tematyczne: <a1>CAPABILITY</a1>, <a2>RESILIENCE-CROSSWALK</a2>. Uruchom jeden: <c1/>. Wszystkie rodziny: <a3>KINDS.md</a3>.

seg-6dfd2dc2721a = Arkusz miniatur wykresów zapisywanych przez silnik dla rodzajów z rodziny Alternatywne PNT w warunkach braku GPS

seg-cff60d8c17d2 = Sekwencyjna (rekurencyjna) nawigacja z odniesieniem do terenu w warunkach braku GPS: filtr cząsteczkowy uruchamia model pomiaru dopasowania do terenu epoka po epoce (SITAN jako filtr bieżący), tak aby zmienny w czasie dryf INS był śl

seg-9d8f69b51742 = Odporność warstwowego PNT na konflikt MODELLED (P7): użytkownik w środowisku spornym korzysta z kilku warstw PNT (GNSS usługi otwartej, szerokopasmowy GNSS, uwierzytelniona konstelacja, przekaźnik wspomagający), każda z

seg-28486745bb43 = Pola wymagane: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>. Opcjonalne: <c14/>, <c15/>, <c16/>, <c17/>, <c18/>, <c19/>, <c20/>.

seg-c2187e8291f9 = <b>Rejestr (ledger):</b> żaden wiersz macierzy nie wymienia tego rodzaju; silnik sam oznacza swój wynik. Pełna strona z danymi wejściowymi, wynikami, dowodami i ograniczeniami: <a1>gravity-map</a1>.

seg-b1ff6f0e1769 = Pola wymagane: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>. Opcjonalne: <c13/>, <c14/>, <c15/>.

seg-9bd19903f577 = <b>Rejestr (ledger):</b> żaden wiersz macierzy nie wymienia tego rodzaju; silnik sam oznacza swój wynik. Pełna strona z danymi wejściowymi, wynikami, dowodami i ograniczeniami: <a1>terrain-nav</a1>.

seg-3ec7b38184b7 = Pola wymagane: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>. Opcjonalne: <c11/>, <c12/>, <c13/>, <c14/>, <c15/>.

seg-7c777178ee8f = <b>Rejestr (ledger):</b> żaden wiersz macierzy nie wymienia tego rodzaju; silnik sam oznacza swój wynik. Pełna strona z danymi wejściowymi, wynikami, dowodami i ograniczeniami: <a1>terrain-slam</a1>.

seg-c5124441822e = Pola wymagane: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>. Opcjonalne: <c16/>, <c17/>, <c18/>, <c19/>, <c20/>, <c21/>, <c22/>, <c23/>.

seg-d78bd011956c = <b>Rejestr (ledger):</b> żaden wiersz macierzy nie wymienia tego rodzaju; silnik sam oznacza swój wynik. Pełna strona z danymi wejściowymi, wynikami, dowodami i ograniczeniami: <a1>combined-altpnt</a1>.

seg-2d95ddbf01c4 = Pola wymagane: brak. Opcjonalne: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>.

seg-ab895b157152 = <b>Rejestr (ledger):</b> żaden wiersz macierzy nie wymienia tego rodzaju; silnik sam oznacza swój wynik. Pełna strona z danymi wejściowymi, wynikami, dowodami i ograniczeniami: <a1>conflict-resilience</a1>.

seg-c0ef7d676ec1 = <s1>Poprzedni</s1>Pomiary GNSS, pozycjonowanie i integralność

seg-54b45b00a2f0 = <s1>Następny</s1>Fuzja inercyjna i czujniki kwantowe

seg-0d7bf5a4f07e = Nawigacja odniesiona do terenu bez GPS (TERCOM/SITAN): wysokościomierz radarowy/barometryczny dopasowuje profil wysokości terenu do NMT w stylu SRTM, aby odzyskać dryf INS.

seg-c5e33c7122e2 = Wykres zapisany przez silnik dla scenarios/terrain-nav.toml, rodzaj terrain-nav

seg-6bdc150ab25b = Sekwencyjna (rekurencyjna) nawigacja odniesiona do terenu bez GPS: filtr cząsteczkowy uruchamia model pomiaru dopasowania do terenu epoka po epoce (SITAN jako filtr ciągły), dzięki czemu zmienny w czasie dryf INS jest śledzony wzdłuż trasy, podczas gdy wsadowe terrain-nav odzyskuje tylko jedno stałe przesunięcie.
