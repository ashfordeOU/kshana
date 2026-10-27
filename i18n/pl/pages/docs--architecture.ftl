# docs--architecture: translations (pl)

seg-e366c6dd500e = Źródło: <c1/>

seg-1f25b7fa1187 = Kshana — Architektura

seg-b0136a82669c = Kshana jest <b>jednym silnikiem</b> zorganizowanym w warstwy nad wspólnym rdzeniem: <b>pakiety czujników</b> (zegar, inercja, transfer czasu, hybryda); warstwa <b>astrodynamiki / numeryczna</b> (analityczny SGP4/SDP4 (SGP4: Simplified General Perturbations { "4" }; SDP4: Simplified Deep-space Perturbations { "4" }), numeryczny propagator Cowella z modelem sił o siedmiu zaburzeniach, projekt manewrów, wyznaczanie orbity z pomiarów odległości ze stacji naziemnych oraz dopasowanie modelu sił do precyzyjnych efemeryd agencji); warstwa <b>czasu i układów odniesienia</b> (skale czasu IERS (International Earth Rotation and Reference Systems Service), precesja–nutacja IAU (International Astronomical Union) 2006/2000A oraz redukcja CIO (Celestial Intermediate Origin) GCRS↔ITRS (GCRS: Geocentric Celestial Reference System; ITRS: International Terrestrial Reference System)); warstwa <b>fuzji</b> (estymatory GNSS/INS (GNSS: globalny system nawigacji satelitarnej; INS: inercyjny system nawigacji)); oraz warstwy <b>integralności, odporności, alt-PNT (PNT: pozycjonowanie, nawigacja i czas) i Księżyca</b> (RAIM/ARAIM/SBAS (RAIM: autonomiczne monitorowanie integralności przez odbiornik; ARAIM: zaawansowane autonomiczne monitorowanie integralności przez odbiornik; SBAS: system wspomagania oparty na satelitach), zagłuszanie i wielowarstwowa detekcja spoofingu, dopasowanie do map grawitacji/terenu/pola magnetycznego oraz PNT cislunarny); a także nowsze warstwy <b>LEO-PNT</b> (PNT na niskiej orbicie okołoziemskiej), <b>widma</b>, <b>Układu Słonecznego i projektu konstelacji</b>, <b>synchronizacji sieciowej</b> i <b>kampanii</b>, wraz z modułami zapisu raportów, animacji i interoperacyjności, z których może korzystać każdy przebieg (§1d). We wszystkich z nich silnik nie wie nic o „kwantowym” i „klasycznym”: steruje <em>modelami błędów</em> czujników przez scenariusz utraty GNSS, uruchamia estymator i ocenia wynik. Urządzenie kwantowe i klasyczne porównuje się więc na tym samym scenariuszu, a różnią się one tylko (opublikowanymi, cytowanymi) parametrami błędów i niezależnymi ziarnami szumu.

seg-02110864419e = Ten dokument zbiera diagramy strukturalne i behawioralne. §{ "1" } to rdzeń pakietów czujników; §1a mapuje warstwy astrodynamiki, fuzji i alt-PNT dodane od tego czasu; §1b–§1d to warstwy badań, dziedzin i wyników. Zasady użycia znajdziesz w <a1>README</a1>; to, co jest, a co nie jest sprawdzone, w <a2>VALIDATION</a2>; tabelę dojrzałości każdej możliwości w <a3>CAPABILITY</a3>.

seg-7bcc7b5cd049 = Skróty użyte na diagramach i nierozwinięte w miejscach ich występowania: ADEV, odchylenie Allana; BW, szerokość pasma; CAI, interferometr z zimnych atomów; CZML, Cesium Language; Δ-DOR, delta differential one-way ranging; DO-229E, norma RTCA (Radio Technical Commission for Aeronautics) dla odbiorników SBAS; EKF, rozszerzony filtr Kalmana; FM, modulacja częstotliwości; GSE, sprzęt wsparcia naziemnego; HPL/VPL, poziomy/pionowy poziom ochrony; IMU, inercyjna jednostka pomiarowa; IOAG, Interagency Operations Advisory Group; IQ, próbki synfazowe/kwadraturowe; ISL, łącze międzysatelitarne; ITU-T, Sektor Normalizacji Telekomunikacji Międzynarodowego Związku Telekomunikacyjnego; J2–J6, strefowe harmoniczne pola grawitacyjnego Ziemi stopnia { "2" } do { "6" }; KIF, Kshana Interchange Format; KML, Keyhole Markup Language; KPI, kluczowy wskaźnik efektywności; L1/L5, pasma nośne GNSS (L2 orbit halo CR3BP to natomiast punkt libracyjny Ziemia–Księżyc { "2" }); LEO, niska orbita okołoziemska; LOO, leave-one-out (wyłączenie jednego elementu); LTC, Coordinated Lunar Time; MEO, średnia orbita okołoziemska; MTIE, maksymalny błąd przedziału czasu; N2, liczba różnorodności Hilla rzędu 2; NED, północ-wschód-dół; NTN, sieć nieziemska; OD, wyznaczanie orbity; OPS-SAT, satelita Europejskiej Agencji Kosmicznej będący laboratorium oprogramowania na orbicie; PPP, precyzyjne pozycjonowanie punktowe; PSD, gęstość widmowa mocy; PVT, pozycja, prędkość i czas; RINEX, Receiver Independent Exchange Format; RK4 / RK5({ "4" }), całkowniki Rungego–Kutty czwartego rzędu oraz wbudowany piątego (czwartego) rzędu; SH, harmoniki sferyczne; SigMF, Signal Metadata Format; SIR, ponowne próbkowanie z ważnością; SRIF, pierwiastkowy filtr informacyjny; SRP, ciśnienie promieniowania słonecznego; SSC, współczynnik separacji widmowej; STK, Systems Tool Kit; SVG, Scalable Vector Graphics; TDEV, odchylenie czasu; TDM, Tracking Data Message CCSDS (Consultative Committee for Space Data Systems); TLE, dwuwierszowy zestaw elementów orbity; TPL, poziom ochrony czasu; UBX, protokół binarny u-blox; UHF, ultrawysoka częstotliwość; VLBI, interferometria z bardzo długą bazą; VRW / ARW, błądzenie losowe prędkości / kąta; WASM, WebAssembly.

seg-a87f668a8f97 = { "1" }. Struktura modułów

seg-0388999448a6 = CLI (interfejs wiersza poleceń) i oba wiązania przechodzą przez jeden punkt wejścia <c1/>, więc nigdy się nie rozjeżdżają. Pakiety korzystają ze wspólnego rdzenia (<c2/>, <c3/>, <c4/>); Pack { "4" } (<c5/>) składa modele i estymatory Packs { "1" }–{ "3" }, zamiast je implementować od nowa; <c6/> wyprowadza oś czasu GNSS z geometrii, która następnie zasila przebieg Pack { "1" }. Moduł <c7/> leży na poziomie sygnału, między bilansem łącza a dziedziną pomiarów: wyprowadza współczynnik separacji widmowej <c8/> z rzeczywistych widm mocy sygnału i zagłuszacza, z którego <c9/> oblicza teraz swoje <c10/> odporności na zagłuszanie, zamiast przyjmować reprezentatywną stałą (sprawdzone krzyżowo w CI (ciągłej integracji)); niesie także kompromis projektowy kodu dalmierczego (m-sekwencja/Gold).

seg-cee4eb61a8e9 = Trzy dalsze moduły tworzą trzon <b>odporności bez GNSS</b>. <c1/> odpowiada wprost na pytanie operacyjne — <em>jak długo ten zegar może pracować swobodnie, zanim jego błąd czasu przekroczy budżet?</em> — udostępniając zamkniętą postać van Loana dla błędu dryfu jako odwrócenie holdover do progu, sprawdzone krzyżowo względem wielokrokowej rekursji kowariancji <c2/>. Jego inercyjny bliźniak mieszka w <c3/> (<c4/>), który składa dryf szumu białego interferometru z zimnych atomów z błędem odchylenia zera i współczynnika skali w budżet dryfu pozycji w czasie holdover (człon odchylenia zera sprawdzony krzyżowo względem niezależnego integratora <c5/>). <c6/> renderuje macierz wymagania, modułu, testu, wyroczni i statusu całego silnika, z testowanymi jednostkowo niezmiennikami, które zabraniają etykiety <em>„sprawdzone względem niezależnego wzorca zewnętrznego”</em> bez niezależnej wyroczni zewnętrznej — więc twierdzenie o poziomie pewności nie może rozminąć się z kodem.

seg-c7bee352c04d = 1a. Warstwy astrodynamiki, fuzji i alt-PNT

seg-99c44e3a86d5 = Poza rdzeniem pakietów czujników trzy podsystemy dzielą ten sam wspólny rdzeń i zasilają <c1/> (lub są przez nie zasilane). Warstwa <b>astrodynamiki / numeryczna</b> dodaje nieanalityczny propagator Cowella obok analitycznej ścieżki SGP4/SDP4; warstwa <b>fuzji</b> niesie estymatory GNSS/INS; a warstwa <b>alt-PNT</b> to dopasowanie do map grawitacji bez GPS (GPS: Global Positioning System). Są to możliwości biblioteki/scenariusza (zob. <a1>CAPABILITY</a1>, które z nich są podłączone do scenariusza <c2/>, a które osiągalne jako API (application programming interface) Rusta).

seg-69f93294d2c8 = Człony sił propagatora numerycznego są domyślnie wyłączone, więc ich włączenie nigdy nie zaburza wydanych wzorców (goldens). 17-stanowy ściśle sprzężony UKF (unscented Kalman filter) przeprowadza utratę GNSS na wyprowadzonym błądzeniu losowym prędkości akcelerometru kwantowego CAI; wyznaczanie orbity używa tych samych <c1/>/<c2/> do propagacji stanu kandydującego przez łuk śledzenia.

seg-bd87e20c284b = Ten sam wspólny rdzeń niesie też cztery dalsze podsystemy, nienarysowane powyżej (ich pakiety pojawiają się w rozdzielniku w §{ "4" }): warstwę <b>czasu i układów odniesienia</b> (<c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>) redukującą TEME↔GCRS↔ITRS (TEME: true equator, mean equinox) i zasilającą pakiet <c8/>/śladu na powierzchni; warstwę <b>integralności</b> (<c9/>, <c10/>) dla RAIM/ARAIM/SBAS; warstwę <b>odporności</b> (<c11/>, <c12/>, <c13/>, <c14/>, <c15/>) dla zagłuszania i wielowarstwowej detekcji spoofingu, z warstwą <b>sygnału nawigacyjnego</b> (<c16/>) na poziomie sygnału — gęstości widmowe mocy BPSK-R (BPSK: binary phase-shift keying) / sine-BOC (BOC: binary offset carrier), współczynnik separacji widmowej <c17/>, który teraz wyprowadza odporność na zagłuszanie <c19/> modułu <c18/>, szerokość pasma dalmierczego RMS (Gabora), jitter śledzenia kodu przez koherentną pętlę DLL (delay-locked loop) wczesny–późny oraz obwiednię błędu wielodrogowości (analiza parametrów sygnału, <b>nie</b> projekt ładunku RF (RF: częstotliwość radiowa) / sprzętu antenowego — to rola partnera od ładunku); oraz warstwę <b>księżycową / cislunarną</b> (<c20/>, <c21/>, <c22/>, <c23/>) dla dynamiki CR3BP (ograniczony kołowy problem trzech ciał) — łącznie z macierzą przejścia stanu { "6" }×{ "6" } i jednostrzałowym korektorem różnicowym (<c24/>, <c25/>, <c26/>), który wytwarza naprawdę okresowe orbity halo/NRHO (NRHO: near-rectilinear halo orbit), odtwarzając opublikowaną południową orbitę NRHO L2 { "9" }:{ "2" } (orbitę Gateway) przy okresie ≈ { "6.57" } d / perylunium ≈ { "3,250" } km (opublikowane ≈ { "6.56" } d / ≈ { "3,370" } km); selenocentryczna transformacja MCI/MCMF (MCI: inercyjny względem środka Księżyca; MCMF: związany z Księżycem i jego środkiem) skorygowanej orbity oraz kontynuacja rodziny pozostają dalszymi pracami, a NRHO jest rozwiązaniem CR3BP (kołowym, bez Słońca), niesprawdzonym względem rzeczywistych efemeryd LANS/Gateway (LANS: Lunar Augmented Navigation Service) — oraz integralność LunaNet. Dopasowanie modelu sił do efemeryd agencji (<c27/>, <c28/>, <c29/>, <c30/>) i pełny zestaw pól alt-PNT (<c31/>, <c32/>, <c33/>) uzupełniają listę modułów; dojrzałość poszczególnych modułów zob. <a1>CAPABILITY</a1>.

seg-05f8c8c84d15 = 1b. Badania odporności, ocena uczenia maszynowego i odtwarzalne artefakty

seg-7350971daf4e = Pięć dalszych grup modułów tworzy <b>otwartą, odtwarzalną warstwę badań</b> stojącą za artykułami badawczymi projektu. W odróżnieniu od <c1/> scenariuszy dostęp do nich odbywa się przez generatory <c2/> / <c3/>, które zapisują artefakty <b>deterministyczne co do bajta</b> (stałe ziarna, zapisana wersja silnika i skrót konfiguracji). Wszystkie są <b>MODELLED</b> (kalibracja syntetyczna lub na publicznych zbiorach danych) i niosą uczciwe etykiety walidacji — żadna nie jest certyfikacją.

seg-86b177166f0e = <b><c1/></b> — warunkowy poziom ochrony czasu (TPL): ograniczony przez holdover bezwarunkowy względem wykrycia próg dla <em>niewykrytego</em> błędu czasu przy spoofingu, składający próg monitora k-σ, wariancję dryfu van Loana w opóźnieniu detekcji i czas do alarmu CUSUM (cumulative sum); skalibrowany na rzeczywistym zarejestrowanym spoofingu (JammerTest { "2024" }). Nie istnieje skończona granica <em>bezwarunkowa</em> — TPL jest warunkowy względem tego, że niezależna kontrola krzyżowa wykryje atak.

seg-8c9d1d90dc8e = <b><c1/></b> — silnik oceny odporności PNT zgodny z ramami (kategorie DHS (Department of Homeland Security) RPCF (Resilient PNT Conformance Framework)) oraz badanie niestabilności decyzji: sympleks wag Dirichleta, niestabilność rang Kendalla-τ, częstość zmiany zwycięzcy top-1 i <b>zapaść różnorodności</b> wspólnego trybu (Hill-N2), ze skrótem integralności raportu zapewnienia i { "35" } ręcznie wyprowadzonymi testami wyroczni. Zob. <a1>RESILIENCE-CROSSWALK</a1>. Syntetyczne architektury dostosowane do RPCF v2.0 — samoocena, a nie certyfikacja.

seg-b347924b874e = <b><c1/> / <c2/> / <c3/> / <c4/></b> — badanie luki optymizmu przy zaburzeniach RF: oznaczony syntetyczny korpus i niezależny od detektora zestaw ROC/AUC (ROC: charakterystyka operacyjna odbiornika; AUC: pole pod krzywą), 13-detektorowy panel (energia/AGC/SQM/parzystość (AGC: automatyczna regulacja wzmocnienia; SQM: monitorowanie jakości sygnału) oraz detektory regresji logistycznej z ziarnem i MLP (MLP: perceptron wielowarstwowy) z jedną warstwą ukrytą), prawa skalowania w rozkładzie i poza nim z hipotezą zerową permutacyjną oraz predyktor leave-one-out degradacji poza rozkładem. Metryki oceny są sprawdzone co do bitu względem scikit-learn.

seg-36206681024f = <b><c1/> / <c2/></b> — tor wejściowy odbiornika programowego (surowe IQ/IF (IQ: synfazowe/kwadraturowe; IF: częstotliwość pośrednia) → odczepy korelatora wczesny/bieżący/późny → SQM) oraz adaptery wczytywania (RINEX, u-blox UBX, GnssLogger, JammerTest, Yunnan, SatGrid), które pozwalają tym samym detektorom działać na nagraniach dostarczonych lokalnie; do repozytorium nie są zatwierdzane żadne zbiory danych.

seg-fefd78868fc2 = <b><c1/> / <c2/></b> — mapa przecięcia odporności kwantowej i klasycznej przy niepewności parametrów oraz kompromis korzyści z holdover według zmierzonego ADEV; numeryczne jądra kompromisu są sprawdzone względem scipy.

seg-5749f1300772 = 1c. Warstwy integralności, GNSS, głębokiego kosmosu, Księżyca i misji

seg-f44755d6d921 = Pozostałe dziedziny podłączają się do tego samego rozdzielnika <c1/> i ponownie używają wspólnego rdzenia, układów odniesienia i geometrii. Wszystko tutaj jest <b>MODELLED</b>, chyba że wiersz macierzy <c2/> powołuje się na zewnętrzną wyrocznię (jądro RAIM względem SciPy, SBAS względem forka RTKLIB (otwartoźródłowej biblioteki pozycjonowania kinematycznego w czasie rzeczywistym), jądro DOP (rozmycie dokładności) z gnss_lib_py, ocena OPS-SAT, jądro poziomu ochrony księżycowego ARAIM, spójność efemeryd księżycowych między dostawcami) — reszta zestawu księżycowego i demonstrator kwantowy są modelowane, ilustracyjne, oparte na źródłach publicznych i nie niosą żadnego twierdzenia o TRL (poziomie gotowości technologicznej) / dziedzictwie / poparciu agencji.

seg-044940c8d052 = 1d. LEO PNT, widmo, Układ Słoneczny, synchronizacja sieciowa, kampanie i wyniki

seg-253a26d9cc5d = Najnowsze warstwy mają ten sam wzorzec: każda to jeden lub więcej scenariuszy <c1/> rozsyłanych z <c2/>, zbudowanych na wspólnym rdzeniu i MODELLED, chyba że wiersz macierzy wskazuje zewnętrzną wyrocznię.

seg-e47cccd54da3 = Szczegóły każdego rodzaju są w <a1>LEO-PNT</a1>, <a2>LEO-SIGNAL</a2>, <a3>LEO-PASS</a3>, <a4>LEO-NAVMSG</a4>, <a5>LEO-PNT-FUSION</a5>, <a6>SPECTRUM</a6>, <a7>CONSTELLATION-DESIGN</a7>, <a8>TELECOM-TIMING</a8>, <a9>SLOT-TIMING</a9>, <a10>CAMPAIGNS</a10>, <a11>REPORTS</a11>, <a12>ANIMATION</a12> i <a13>INTEROP</a13>.

seg-d04b21c7cb6c = 1e. Warstwy zaufania do odbiornika, dowodów, telemetrii, szkolenia i compliance ({ "0.35" })

seg-84ee122959b4 = Te warstwy czytają własny dziennik odbiornika lub zapisują pliki dla innych narzędzi; żadna z nich nie syntezuje ani nie nadaje sygnału radiowego. Leżą obok <c1/>, a nie pod rodzajami scenariuszy, z wyjątkiem samego <c2/>, który jest rodzajem scenariusza. Wszystkie są MODELLED, chyba że wiersz macierzy wskazuje zewnętrzną wyrocznię, a wyniki morskie są wyłącznie doradcze, nie jest to sprzęt nawigacyjny z zatwierdzeniem typu.

seg-aab745a65e76 = Moduł

seg-9d17ad3e87c8 = Opisany w

seg-920b6b14c0e2 = ocenia dziennik odbiornika epoka po epoce monitorami zaufania; platforma statku dodaje monitory morskie i wskaźnik 0-100 z uzasadnieniami

seg-a77d1a8a62b5 = <a1>RECEIVER-TRUST</a1>, <a2>MARITIME-TRUST</a2>

seg-c311dfc2a161 = ta sama ocena na strumieniu w miarę jego nadchodzenia (stdin, dopisywany plik, TCP lub UDP), zdanie <c1/> i opcjonalna bramka; <c2/> to całość tego bez wejścia i wyjścia

seg-07b2d6edf7b9 = podpisany, powiązany łańcuchem skrótów pakiet okna dziennika, jego konfiguracji i wyniku silnika, weryfikowalny offline; opcjonalny token znacznika czasu RFC { "3161" }

seg-32d08730b9c0 = strumień zaufania jako metryki Prometheus, zdarzenia syslog (CEF lub LEEF) i opcjonalnie OpenTelemetry (funkcja <c1/>, domyślnie wyłączona)

seg-53311b8c3b93 = syntetyczny most NMEA { "0183" } ze skryptowanymi zdarzeniami zagłuszania (jamming), odciągania (drag-off), spoofingu czasu i odtwarzania oraz dziennikiem instruktora, do szkolenia załóg (wyłącznie tekst)

seg-f7cc3cfbdfc6 = zbiorcze mapy pogorszonej nawigacji na podstawie otwarcie licencjonowanych raportów statków powietrznych i okrętów oraz narażenie trasy na nie; wyłącznie pliki lokalne

seg-83fe3c87e2d5 = weryfikator po stronie odbiornika dla Galileo OSNMA: odczytuje strony I/NAV (zwykłe strony, wektorowy CSV, strumień UBX), sprawdza podpisany klucz, łańcuch TESLA i kody MAC oraz zgłasza dla każdego satelity, czy dane nawigacyjne są uwierzytelnione; <c1/> to jedna ścieżka wspólna dla wiersza poleceń, Pythona i WebAssembly; wyłącznie status uwierzytelnienia, nie usługa integralności

seg-bf8cd5a45deb = OSNMA

seg-843a83b82283 = odwzorowuje wyniki Kshana na publiczne ramy odporności i wypełnia to odwzorowanie na podstawie dokumentów wyników; <c1/> i <c2/> przyjmują teksty, nie ścieżki

seg-e16c483479ce = ruch pojazdu i zdarzenia scenariusza jako CSV ruchu, NMEA, tekst punktów trasy i pliki zdarzeń dla laboratoryjnego symulatora GNSS; żaden sygnał nie jest zapisywany

seg-044c58c98397 = Integracje dla łodzi (wtyczka Signal K, tryb bramki OpenCPN i kompilacja referencyjna) wywołują narzędzie wiersza poleceń; zob. <a1>MARINE-INTEGRATIONS</a1>.

seg-cb8d8ff847eb = { "2" }. Potok silnika (dla każdego przebiegu)

seg-53e9e596ca44 = Każdy przebieg przeprowadza pojedynczy model czujnika przez siatkę czasu, dyscyplinując go, gdy GNSS jest nominalny, i pozwalając mu swobodnie dryfować (holdover / nawigacja zliczeniowa) podczas przerwy.

seg-257407f3c375 = Scenariusz uruchamia ten potok dwukrotnie — raz dla czujnika kwantowego, raz dla klasycznego — z <b>niezależnymi ziarnami (seed)</b> (<c1/>), tak aby obie realizacje szumu były nieskorelowane.

seg-4659e89ba5f5 = { "3" }. Interfejs modelu błędu (punkt rozszerzenia)

seg-7b70e8b1b98a = Każdy czujnik implementuje ten sam pomysł: obiekt ze stanem, którego <c1/> przesuwa jego wewnętrzny błąd stochastyczny, a skumulowany stan jest odczytywany w każdym takcie. Zegary udostępniają skumulowaną fazę; akcelerometry — dwukrotnie scałkowaną pozycję; łącza — fluktuację dla każdego pomiaru.

seg-79ab76c6dbc0 = <c1/> trafia do wyniku, dzięki czemu każda wartość w wynikach jest możliwa do prześledzenia do opublikowanego źródła wskazanego w <c2/>.

seg-514c49659947 = Obok analitycznego <c1/> pakiet zegara uruchamia dwustanowy (faza, częstotliwość) filtr Kalmana (<c2/>), którego szum procesu odpowiada modelowi prawdziwemu. Podczas dryfu w czasie przerwy wariancja jego błędu fazy rośnie dokładnie do <c3/> — analitycznej zależności holdover — a jego bieżąca granica 1-σ służy do wyznaczenia wskaźnika jakości <b>Integralność</b> (odsetek próbek z przerwy, dla których błąd mieści się w granicy k-σ).

seg-7404589deb40 = { "4" }. Dyspozytor (CLI i wiązania)

seg-6138513a43f7 = <c1/> jest jedynym punktem wejścia: odczytuje najwyższego poziomu <c2/>, deserializuje pasujący scenariusz, uruchamia pakiet i zwraca <c3/> (<c4/> występuje tylko dla rodzajów, które publikują tabelę odtwarzalności). CLI zapisuje je do plików, wraz z raportem (<c5/>, <c6/>) i wszelkimi wynikami <c7/> / <c8/>; wiązania Pythona i WebAssembly zwracają je hostowi. Jeden dyspozytor, bez rozjazdów.

seg-524f749be364 = Dyspozytor działa na typowanym enum <c1/>, dopasowywanym wyczerpująco (zob. następny podrozdział), więc dodanie pakietu jest zmianą sprawdzaną w czasie kompilacji. Brak <c2/> powoduje przejście do pakietu <c3/>, dzięki czemu istniejące scenariusze jednego rodzaju deserializują się bez zmian (<c4/> ignoruje pole <c5/> w każdej strukturze scenariusza). Nierozpoznany <c6/> zostaje odrzucony z <c7/>, który wskazuje najbliższy wbudowany rodzaj, gdy nazwa wygląda na literówkę.

seg-eedaeae2a7e7 = Typowane wywoływanie i uporządkowane API

seg-ca47f566eaee = Dyspozytor działa na typowanym enum <c1/>, a nie na dopasowywaniu surowego łańcucha: <c2/> rozstrzyga pole <c3/> do wariantu, a dyspozytor dopasowuje go wyczerpująco — dodanie pakietu jest zmianą sprawdzaną w czasie kompilacji, a nie literówką w łańcuchu. Obok zwracającego łańcuch <c4/> (zachowanego dla CLI i istniejących wiązań) działają dwie typowane powierzchnie:

seg-167c47049329 = <b><c1/></b> — typowane wejście z uporządkowaną taksonomią błędów (<c2/>, <c3/>, <c4/>, <c5/>). Każdy błąd niesie stabilny <c6/>, dzięki czemu wywołujący może rozgałęziać się według kategorii niepowodzenia zamiast analizować komunikat. Wiązania udostępniają to jako <c7/>.

seg-1943051b3b20 = <b><c1/></b> (oraz <c2/>, udostępniane we wiązaniach jako <c3/>) — introspekcja programowa: nazwa, opis oraz pola wymagane i opcjonalne każdego rodzaju, dla UI (interfejsu użytkownika) i autouzupełniania w notebookach.

seg-630243592256 = Rozszerzanie Kshana o zewnętrzny pakiet

seg-d1adedd2c08b = Pakiet zewnętrzny implementuje dwa niewielkie, stabilne semantycznie (semver) traity z <c1/>:

seg-d01471b13324 = <c1/> ma też domyślną metodę <c2/>, która nic nie robi, chyba że pakiet włączy się w punkt dyspozycji rejestru w <c3/>. Wbudowany pakiet <c4/> jest podłączony przez <c5/> jako przykład roboczy; pakiety spoza drzewa stosują ten sam kontrakt bez rozwidlania rdzenia (odzwierciedlając punkt rozszerzenia <c6/> z §{ "3" }, z którego korzysta prywatna nakładka odporności).

seg-5b0449d96bc3 = Kshana ma zatem <b>dwa stabilne punkty rozszerzenia</b> — dodanie <em>czujnika</em> przez implementację <c1/> (§{ "3" }) albo dodanie całego <em>rodzaju scenariusza</em> przez implementację <c2/> + <c3/> — oba stabilne semantycznie (semver), żaden nie wymaga rozwidlenia rdzenia:

seg-3928a007756b = { "5" }. Hybrydowy kamień węgielny

seg-7f38e825519a = Pakiet hybrydowy uruchamia <em>zestaw</em> (jeden zegar i jeden czujnik inercyjny) i wymaga, aby <b>zarówno</b> czas, jak i pozycja pozostawały w specyfikacji; <c1/> to czas do przekroczenia przez którekolwiek z nich. Opcjonalnie optyczne łącze międzysatelitarne resynchronizuje <b>zegar</b> w czasie przerwy — wyłącznie wspomaganie czasu; pozycja nie jest resynchronizowana, ponieważ transfer czasu daje czas, a nie pozycję. To właśnie wyodrębnia czujnik inercyjny jako czynnik ograniczający.

seg-17a8683f0982 = { "6" }. Dostępność GNSS wyprowadzona z geometrii

seg-afdb141ac367 = <c1/> to deterministyczna warstwa geometrii bez zależności. <c2/> to albo analityczna keplerowska <c3/> (dwa ciała, opcjonalnie wiekowe J2), albo pełny propagator <c4/> zbudowany z kompletnego zestawu elementów dwuwierszowych; generator Walker-delta tworzy syntetyczne konstelacje, a widoczność w linii prostej = przesłonięcie przez Ziemię + maska elewacji. Liczba widocznych satelitów odpowiada stanowi GNSS (≥{ "4" } = nominalny, { "1" }–{ "3" } = pogorszony, { "0" } = odmówiony), a <c5/> zamienia to na oś czasu dostępności, która napędza standardowy przebieg holdover zegara. Dostępność jest więc <em>wyprowadzona z geometrii</em>, a nie tworzona ręcznie, podczas gdy przebieg, estymator i ocena pozostają bez zmian.

seg-da82c97ac5c8 = Konstelacja podana jako pełne TLE jest propagowana modelem SGP4/SDP4 w <c1/> (sprawdzonym względem wektorów AIAA (American Institute of Aeronautics and Astronautics) 2006-6753); elementy tylko z linii 2 zachowują analityczną ścieżkę dwóch ciał. Oba rodzaje można mieszać w jednym bloku konstelacji.

seg-a47031620b54 = { "7" }. Wiązania

seg-57fb29fdd9d9 = Rdzeń kompiluje się bez zmian do kodu natywnego, rozszerzenia Pythona i WebAssembly. Moduły Python (<c1/>, PyO3 abi3) i WebAssembly (<c2/>, wasm-bindgen) są opcjonalnymi zależnościami włączanymi funkcjami (<c3/> / <c4/>): domyślna kompilacja i zestaw testów nigdy ich nie kompilują, natomiast bramka audytu zależności (<c5/>) sprawdza ich drzewa zależności, ponieważ te biblioteki trafiają do pakietu wheel i pakietu npm. Oba wywołują <c6/>, więc każda powierzchnia zwraca identyczne wyniki. Moduł WebAssembly obsługuje przeglądarkowy plac zabaw w <c7/> i eksportuje trzynaście funkcji: <c8/>, <c9/> (jeden przebieg silnika zwracający razem wynik, wykres, podsumowanie i tabelę), <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, kodek udostępnialnych adresów URL (URL: adres internetowy) <c16/> / <c17/> oraz trzy eksportery <c18/> / <c19/> / <c20/>, które obsługują menu eksportu placu zabaw. Dwa dalsze punkty wejścia docierają do tego samego <c21/>: <b>serwer MCP (Model Context Protocol)</b> (<c22/>, wyłączona z przestrzeni roboczej biblioteka <c23/> udostępniająca piętnaście narzędzi — <c24/>, <c25/>, <c26/>, <c27/>, <c28/>, <c29/>, <c30/>, <c31/>, <c32/>, <c33/>, <c34/>, <c35/>, <c36/>, <c37/>, <c38/>; oba narzędzia przykładowe odczytują dołączone scenariusze przez domyślnie wyłączoną funkcję biblioteki <c39/>, którą włącza tylko ten serwer) oraz <b>wtyczka do JetBrains IDE (zintegrowane środowisko programistyczne)</b> (<c40/>, projekt w Kotlinie, który wywołuje CLI <c41/> zamiast linkować bibliotekę).

seg-a6620e0d6eef = Włączanie funkcjami: Python i WASM to <c1/> / <c2/>; dołączona tabela scenariuszy to <c3/> (jedyne jej użycie przez serwer MCP); serwer MCP i kontrole krzyżowe <c4/> to biblioteki WYŁĄCZONE z przestrzeni roboczej; wtyczka IDE niczego nie linkuje — uruchamia CLI.

seg-7bc5df56e4e5 = { "8" }. Determinizm i odtwarzalność

seg-fb95c37c7bb9 = Cała losowość przepływa przez jeden zasiany <c1/> na przebieg; kolejność kroków jest stała, więc <c2/>.

seg-e026c87beb26 = Wynik zawiera <c1/> SHA-256 (SHA: Secure Hash Algorithm); <c2/> uruchamia scenariusz referencyjny dwukrotnie i stwierdza, że wynik jest identyczny co do bajta.

seg-42a3bdcbd99f = Ten sam silnik kompiluje się do kodu natywnego, rozszerzenia Pythona i <c1/> na potrzeby przebiegów w przeglądarce, dających te same liczby.

seg-12e00717c2d4 = { "9" }. Struktura odroczona / przyszła

seg-8a8e1b93b704 = Warstwy astrodynamiki, fuzji i alt-PNT z §1a — pełny propagator SGP4/SDP4, numeryczny propagator Cowella z siedmioma zaburzeniami w modelu sił i dwoma adaptacyjnymi integratorami, projektowanie manewrów i trajektorii, wyznaczanie orbity, estymatory GNSS/INS o 15, 8 i 17 stanach, sprzężony filtr zegara i pozycji oraz dopasowanie do map grawitacyjnych — zostały dostarczone, wraz ze wskaźnikiem jakości bezpieczeństwa z aktywnym demonstratorem spoofingu, rzeczywistą geometrią TLE/wielu konstelacji, pasmami Monte Carlo, przeglądami badań kompromisowych, drukowalnym raportem HTML (HyperText Markup Language) z jego maszynowo czytelnym bliźniakiem oraz przepływami pracy wydań, publikacji, wheels i pages.

seg-318ad50d3826 = Kilka możliwości wymienianych tu kiedyś jako przyszłe prace zostało od tego czasu <b>dostarczonych</b> i jest opisanych powyżej lub w <a1>VALIDATION</a1>: pełna nutacja IAU 2000A i wolna od równonocy redukcja CIO GCRS↔ITRS / ITRF (International Terrestrial Reference Frame) (sprawdzona co do bitu względem SOFA/ERFA (SOFA: Standards of Fundamental Astronomy; ERFA: Essential Routines for Fundamental Astronomy)), geopotencjał EGM2008 (Earth Gravitational Model { "2008" }) do stopnia i rzędu { "70" }, składnik <b>Lense’a–Thirringa</b> (unoszenie układu inercjalnego), pływy stałe, oceaniczne i atmosferyczne, walidacja krzyżowa efemeryd klasy DE (DE440/ANISE (DE440: Development Ephemeris { "440" }; ANISE: Attitude, Navigation, Instrument, Spacecraft, Ephemeris — czysto rustowy zestaw narzędzi geometrii planetarnej)), zewnętrzna walidacja krzyżowa Orekit { "12.2" } numerycznego propagatora Cowella ({ "0.08" } m w ciągu { "24" } h) oraz wsadowego i sekwencyjnego wyznaczania orbity, a także 17-stanowy ściśle sprzężony nawigator udostępniony jako rodzaj scenariusza <c1/>.

seg-068119b15b27 = Pozostałe prace następcze są śledzone w <a1>CHANGELOG</a1> <c1/>, a plan dla poszczególnych możliwości w <a2>CAPABILITY</a2>: zewnętrzna wartość wyroczni dla ewaluatora wysokiego stopnia EGM (Earth Gravitational Model) dokładnie na osi biegunowej oraz czyste względem pyshtools porównanie w pobliżu bieguna (ewaluator do stopnia { "2190" } i jego ładowarka <c2/> w czasie działania są dostarczone, MODELLED; zob. <c3/>), zmienny w czasie czynnik pogody kosmicznej dla opcjonalnego poziomu gęstości oporu NRLMSISE-00 (NRLMSISE: Naval Research Laboratory Mass Spectrometer and Incoherent Scatter Radar Extended atmosphere model) (domyślną gęstością oporu jest statyczny model wykładniczy, a gęstość Jacchia-71 rodzaju <c4/> jest scharakteryzowana względem NRLMSISE-00, ale przez niego nie zastąpiona), zewnętrzna kontrola opcjonalnego cienia z pociemnieniem brzegowym tarczy Słońca, ścisłe sprzężenie GNSS/INS z fazą nośnej oraz rzeczywista mapa grawitacyjna EGM2008/EIGEN (EIGEN: European Improved Gravity model of the Earth by New techniques) dla dopasowania alt-PNT.

seg-b48f69ea54b3 = Prywatne repozytorium nakładki zawiera głębię odporności objętą ograniczeniami eksportowymi; podłącza się przez ten sam interfejs <c1/> (i kontrakt <c2/> z §{ "4" }) bez zmiany publicznego silnika.

seg-2f88ab8f67e8 = <s1>Poprzednia</s1>Gdzie działa Kshana

seg-02b0e0fdcdbe = <s1>Następna</s1>Gdzie Kshana się mieści
