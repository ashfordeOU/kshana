# docs--kinds-jamming-spoofing-and-the-spectrum: translations (pl)

seg-b03d56f501c3 = Rodzaj

seg-98e740d32860 = Stanowisko oceny detekcji zakłóceń RF metodami uczenia maszynowego ({ "13494" }): generuje oznaczony, oparty na parametrach korpus SYNTETYCZNY (nominalny/zagłuszanie/spoof-time/spoof-position/wielodrogowość), ocenia detektor (energy|agc|sqm|parity|fused) przy użyciu niezależnego od detektora zestawu testowego i podaje AUC/ROC/macierz pomyłek + Pd dla każdej klasy przy docelowym Pfa, a także lukę optymizmu między danymi z rozkładu a spoza rozkładu. Wyłącznie charakterystyki działania MODELLED — nigdy dane terenowe/IQ, żadnego werdyktu dobry/zły.

seg-7e7b07bc5545 = Wykres zapisany przez silnik dla scenarios/impairment-eval.toml, rodzaj impairment-eval

seg-60bf3f0ff000 = Zagłuszanie w bilansie łącza: J/S → efektywne C/N₀ → utrata uchwycenia.

seg-42d46b928d09 = Wykres zapisany przez silnik dla scenarios/jamming-demo.toml, rodzaj jamming

seg-f6ff1c8c78db = Utrata synchronizacji pętli śledzenia: C/N0 -> zaczep/utrata zaczepu Z HISTEREZĄ, czas do utraty zaczepu oraz wciągnięcie przez spoofing w zależności od TEMPA przesunięcia kodu i nośnej. Dotychczasowe kryteria odmowy i przechwycenia w silniku są stosunkami mocy odbieranej (zagłuszacz odmawia przy J/S = { "30" } dB, spoofer przechwytuje przy { "3" } dB); rzeczywista utrata zaczepu nie jest stosunkiem mocy, lecz miejscem, w którym jitter pętli wraz z naprężeniem dynamicznym przekracza budżet progu śledzenia. Raportuje ({ "1" }) jitter termiczny 1-sigma nośnej (Costas) i kodu (nieskoherentny early/late) względem C/N0, z uwzględnieniem straty kwadratowania, na tle podanych reguł { "3" }<em>sigma_PLL + theta_e <= { "45" } deg (reguła 15 stopni w postaci trzech sigma) oraz { "3" }</em>sigma_DLL + ramp lag <= d/2 chips; ({ "2" }) progi C/N0 zaniku i ponownego uchwycenia z nazwaną pętlą wiążącą, przy czym próg ponownego uchwycenia jest WYWIEDZIONY z szerszego pasma, w którym odbiornik ponownie się wciąga, a nie zakładany, więc szerokość histerezy musi mieścić się między { "5" }<em>log10(ratio) a { "10" }</em>log10(ratio) dB; ({ "3" }) deklarowany czas do utraty zaczepu z detektora zaczepu o dwóch progach z oknami potwierdzenia, sterowanego rampą C/N0, raportowany osobno od fizycznego czasu ucieczki fazy (średni czas Viterbiego między poślizgami cyklu, w log10 s, ponieważ obejmuje setki rzędów wielkości); ({ "4" }) granice wciągnięcia przez spoofing — największe przesunięcie kodu i tempo zmiany dopplerowskiej nośnej, za którymi mogą nadążyć pętle ofiary, z mapą po obu osiach, ponieważ spoofer, który przesuwa szybciej niż te granice, nie przechwytuje pętli, tylko ją wyprzedza; oraz ({ "5" }) PROMIEŃ ODMOWY wynikający z dynamiki pętli, raportowany OBOK istniejącego promienia stosunku mocy, nigdy w jego miejsce, z ich różnicą ze znakiem jako osobnym nazwanym polem (denial_radius_delta_km) i definicją obok. Każde emitowane pole liczbowe niesie jednostkę i klasę pochodzenia. VALIDATED, postacie zamknięte: wyrażenia na jitter nośnej i kodu, redukcja filtra pętli sqrt({ "2" }<em>B_n</em>T) oraz opóźnienie rampy pierwszego rzędu są sprawdzane krzyżowo względem własnego korelatora sdr silnika, krokowo uruchamianego na zasianym syntetycznym IF — inną drogą do tych samych liczb — odpowiednio do { "0.6" } %, { "3.7" } % i { "0.17" } %, a zmodyfikowana funkcja Bessela I0 leżąca u podstaw czasu poślizgu cyklu względem standardowych wartości tabelarycznych do { "1e-7" }. Dolna granica ważności jest wymuszona, a nie tylko podana: poniżej ok. { "32" } dB-Hz przy { "1" } ms rzeczywisty dyskryminator atan nasyca się względem swojego zakresu +-pi/2 i mierzy mniejszy jitter niż jakakolwiek teoria liniowa. MODELLED: szerokości pasm pętli, czas całkowania, rozstaw korelatora, stosunek pasm wciągania, okna potwierdzenia, moc zagłuszacza i zyski anten są reprezentatywnymi wartościami pasmowymi, a nie danymi z karty katalogowej. NIE modelowano: jitteru oscylatora (odchylenie Allana) i drgań, ograniczenia pasma toru wejściowego, wielodrogowości, dynamiki AGC, straty na przejściach bitów danych, wspomagania zewnętrznego ani żadnej korekty półcyklu we wzorze poślizgu cyklu Costasa. Przy dynamice pętli przechwycenie przez spoofing nie ma żadnego promienia — ograniczeniem wiążącym jest tempo przesunięcia, a nie moc — więc to pole ma wartość null wraz z powodem, a nie zmyśloną liczbę. To nie jest certyfikowany produkt do oceny parametrów odbiornika.

seg-4e31c8daf798 = Rejestr (ledger)

seg-d1c67e3dd12e = MODELLED { "1" } · VALIDATED { "2" }

seg-63c3a7483268 = { "6" } rodzajów scenariuszy silnika v{ $version }. Wyłącznie doradczo: wynik analizy z narzędzia badawczo-inżynieryjnego; nie jest to sprzęt nawigacyjny z zatwierdzeniem typu ani usługa bezpieczeństwa życia. Każda etykieta tutaj pochodzi z silnika lub z macierzy weryfikacji; rodzaj ma status MODELLED, chyba że macierz stanowi inaczej (jak zdobywa się etykietę: sekcja Evidence w README).

seg-f6a18b7cb172 = Źródło: <c1/>

seg-d4ae70a5d619 = Zagłuszanie (jamming), spoofing i widmo (rodzina rodzajów scenariuszy)

seg-b4b8b72e060b = Strony tematyczne: <a1>SPECTRUM</a1>, <a2>DECEIVED-TIME</a2>, <a3>IQ-FOLLOW</a3>. Uruchom jeden: <c1/>. Wszystkie rodziny: <a4>KINDS.md</a4>.

seg-cc031b964086 = Arkusz miniatur wykresów zapisywanych przez silnik dla rodzajów z rodziny Zagłuszanie (jamming), spoofing i widmo

seg-bbbd87f888b9 = Utrata synchronizacji pętli śledzenia: C/N0 -> zaczep/utrata zaczepu Z HISTEREZĄ, czas do utraty zaczepu oraz wciągnięcie przez spoofing w zależności od TEMPA przesunięcia kodu i nośnej.

seg-e37f1e071b2c = Model widma pasma L i wodospad: całe pasmo L GNSS jako jedna widmowa gęstość mocy (PSD), częstotliwość w poziomie, czas w dół, dla skryptowanej osi czasu zagłuszacza.

seg-02706b96f8fa = MODELLED { "3" } · VALIDATED { "2" }

seg-8887d666b4fc = Stanowisko testowe do oceny detekcji zaburzeń RF metodami uczenia maszynowego ({ "13494" }): wygenerowanie oznaczonego, opartego na parametrach korpusu SYNTETYCZNEGO (nominalny/zagłuszanie/spoofing czasu/spoofing położenia/wielodrogowość), ocena detektora (energy/agc/s

seg-f6dcb5b36454 = Pola wymagane: <c1/>, <c2/>, <c3/>, <c4/>. Opcjonalne: <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>.

seg-7bb2f42902f0 = <b>Rejestr (ledger):</b> MODELLED. Pełna strona z danymi wejściowymi, wynikami, dowodami i ograniczeniami: <a1>jamming</a1>.

seg-d5f06ff66e1b = Pola wymagane: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>.

seg-1bd760afbaca = <b>Rejestr (ledger):</b> MODELLED. Pełna strona z danymi wejściowymi, wynikami, dowodami i ograniczeniami: <a1>spoof</a1>.

seg-fb15ecc29f7c = Pola wymagane: <c1/>. Opcjonalne: <c2/>, <c3/>.

seg-15c08ee5ae76 = <b>Rejestr (ledger):</b> MODELLED. Pełna strona z danymi wejściowymi, wynikami, dowodami i ograniczeniami: <a1>spoof-detect</a1>.

seg-c65b9d45bdcc = Pola wymagane: brak. Opcjonalne: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>, <c19/>, <c20/>, <c21/>, <c22/>, <c23/>, <c24/>, <c25/>, <c26/>, <c27/>, <c28/>, <c29/>.

seg-bd1b04ccfe22 = <b>Rejestr (ledger):</b> MODELLED. Pełna strona z danymi wejściowymi, wynikami, dowodami i ograniczeniami: <a1>tracking-loop</a1>.

seg-5024b537d000 = Pola wymagane: brak. Opcjonalne: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>.

seg-a73f44c04565 = <b>Rejestr (ledger):</b> MODELLED { "3" } · VALIDATED { "2" }. Pełna strona z danymi wejściowymi, wynikami, dowodami i ograniczeniami: <a1>spectrum</a1>.

seg-cbcc6f5302b8 = Pola wymagane: brak. Opcjonalne: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>.

seg-d14fa8348a2a = <b>Rejestr (ledger):</b> MODELLED { "1" } · VALIDATED { "2" }. Pełna strona z danymi wejściowymi, wynikami, dowodami i ograniczeniami: <a1>impairment-eval</a1>.

seg-5242026d2998 = <s1>Poprzedni</s1>Fuzja inercyjna i czujniki kwantowe

seg-6b9b04e59491 = <s1>Następny</s1>Nawigacja z niskiej orbity okołoziemskiej

seg-fef00c827c6a = Model widma pasma L i wodospad: całe pasmo L GNSS jako jedna gęstość widmowa mocy (PSD), częstotliwość w poziomie, czas w dół, dla skryptowanej osi czasu zagłuszacza. SYGNAŁY: GPS L1 C/A i L2C (BPSK({ "1" })), usługa otwarta Galileo E1 (MBOC(6,1,1/11) lub BOC({ "1,1" })), GPS L5 i Galileo E5a (BPSK({ "10" })), każdy na swojej nośnej z minimalną mocą odbieraną z specyfikacji interfejsu (IS-GPS-200, IS-GPS-705, Galileo OS SIS ICD), chyba że ją nadpisano; GLONASS, BeiDou i Galileo E6 nie są modelowane. ZAGŁUSZACZE: ton fali ciągłej, płaski szum wąskopasmowy, liniowy chirp piłokształtny i szum szerokopasmowy dopasowany do modulacji własnego pasma, każdy z częstotliwością środkową, szerokością pasma, mocą odbieraną (bezpośrednio albo EIRP i odległość przez tłumienie w wolnej przestrzeni rodzaju jamming) oraz czasami włączenia i wyłączenia. Każdy zagłuszacz jest oceniany względem każdego pasma przez jego współczynnik rozdziału widmowego kappa w paśmie odbiornika oraz (C/N0)_eff = [1/(C/N0) + sum (J/S) kappa]^-1; dla jednego zagłuszacza jest to równe równaniu przeciwzagłuszeniowemu rodzaju jamming z Q = 1/(R_c kappa), a raport zawiera tę kontrolę krzyżową (oraz obok niej reprezentatywną wartość Q rodzaju jamming). Podłoga szumu to k T_sys z T_sys = T_ant + { "290" } K (F - { "1" }). Wodospad uśrednia każdą komórkę po jej przedziale i wierszu (chirpy dokładnie, całe przemiatania plus częściowe; zagłuszacze przełączające się w środku wiersza według swojego współczynnika wypełnienia), więc oś czasu C/N0 i obraz pochodzą z tych samych liczb; result.json zawiera siatkę uśrednioną blokowo w mocy, C/N0 i J/S dla każdego pasma w każdym wierszu oraz dla każdego zagłuszacza i pasma SSC, Q, J/S, J/S w paśmie i ustalone C/N0. Opcjonalnie [iq]: model narysowany jako zespolone IQ w jednej chwili, zapisany do nagrania SigMF i odczytany z niego (cf32_le lub ci16_le) oraz porównany z estymatą Welcha. Opcjonalnie [recording] (kompilacje natywne): PSD Welcha rzeczywistego nagrania SigMF obok modelu. VALIDATED: PSD sygnałów względem podręcznikowych szerokości głównego listka (BPSK(n) 2n x { "1.023" } MHz od zera do zera; listki BOC({ "1,1" }) wyśrodkowane na +/-1.023 MHz) oraz współczynniki rozdziału widmowego względem ich postaci zamkniętych z Parsevala i Q Kaplana i Hegarty'ego = { "1" } (CW) i { "1.5" } (dopasowany). MODELLED: moce zagłuszaczy, oś czasu, szerokości pasma toru wejściowego, traktowanie widma ciągłego (bez linii kodu) oraz brak AGC, wygaszania i charakterystyki anteny.

seg-ea1678eb9e84 = Wykres zapisany przez silnik dla scenarios/l-band-waterfall-jamming.toml, rodzaj spectrum

seg-f43fe94d84e0 = Połączony detektor spoofingu RF/pomiarowy (spójność RAIM wielu SV + AGC + SQM, zespolone) wobec sparametryzowanego ataku (przewaga mocy, wyrównanie fazy nośnej, przesunięcie czasu/pozycji; w stylu TEXBAT).

seg-268ebf4cba99 = Wykres zapisany przez silnik dla scenarios/spoof-detect.toml, rodzaj spoof-detect

seg-cbd77f6ffd63 = Stochastyczny detektor spoofingu czasu (Neyman–Pearson / χ²₁) z P_fa/P_md metodą Monte Carlo.

seg-6f6a8c975111 = Wykres zapisany przez silnik dla scenarios/spoof-attack.toml, rodzaj spoof

seg-72182c1aecd9 = Wykres, który silnik zapisuje dla scenariusza scenarios/tracking-loop.toml, rodzaj tracking-loop
