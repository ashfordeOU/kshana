# docs--kind-tracking-loop: translations (pl)

seg-37d16b499bc5 = dB

seg-37d29d8303fe = km

seg-b054c73f22e5 = brak wartości

seg-59afd80736c5 = <b>PARTNER</b> Nie zapewnia się — Kshana modeluje osiągi sygnału, a nie sprzęt ładunku użytecznego / anten. Wyrocznia (NoneKind): brak: dyscyplina należąca do partnera, z założenia bez modułu i bez testu

seg-a3697ad561db = Hz

seg-304496607bd7 = Rodzaj scenariusza silnika v{ $version }, rodzina <a1>Zagłuszanie (jamming), spoofing i widmo</a1>. Wyłącznie doradczo: wynik analizy z narzędzia badawczo-inżynieryjnego; nie jest to sprzęt nawigacyjny z zatwierdzeniem typu ani usługa bezpieczeństwa życia. Każda etykieta tutaj pochodzi z silnika lub z macierzy weryfikacji; rodzaj jest MODELLED, chyba że macierz stanowi inaczej (jak zdobywa się etykietę: sekcja Evidence w README).

seg-5d23d7f8f872 = Strona rodziny: <a1>Zagłuszanie (jamming), spoofing i widmo</a1>

seg-edcd55ccc993 = <b>MODELLED</b> Raport <c1/> nie opiera już swojego konturu odmowy na jednej wielkości skalarnej.

seg-4f57723d340e = Źródło: <c1/>

seg-e84aabe07c43 = <c1/> (rodzaj scenariusza)

seg-f6ff1c8c78db = Utrata synchronizacji pętli śledzenia: C/N0 -> zaczep/utrata zaczepu Z HISTEREZĄ, czas do utraty zaczepu oraz wciągnięcie przez spoofing w zależności od TEMPA przesunięcia kodu i nośnej. Dotychczasowe kryteria odmowy i przechwycenia w silniku są stosunkami mocy odbieranej (zagłuszacz odmawia przy J/S = { "30" } dB, spoofer przechwytuje przy { "3" } dB); rzeczywista utrata zaczepu nie jest stosunkiem mocy, lecz miejscem, w którym jitter pętli wraz z naprężeniem dynamicznym przekracza budżet progu śledzenia. Raportuje ({ "1" }) jitter termiczny 1-sigma nośnej (Costas) i kodu (nieskoherentny early/late) względem C/N0, z uwzględnieniem straty kwadratowania, na tle podanych reguł { "3" }<em>sigma_PLL + theta_e <= { "45" } deg (reguła 15 stopni w postaci trzech sigma) oraz { "3" }</em>sigma_DLL + ramp lag <= d/2 chips; ({ "2" }) progi C/N0 zaniku i ponownego uchwycenia z nazwaną pętlą wiążącą, przy czym próg ponownego uchwycenia jest WYWIEDZIONY z szerszego pasma, w którym odbiornik ponownie się wciąga, a nie zakładany, więc szerokość histerezy musi mieścić się między { "5" }<em>log10(ratio) a { "10" }</em>log10(ratio) dB; ({ "3" }) deklarowany czas do utraty zaczepu z detektora zaczepu o dwóch progach z oknami potwierdzenia, sterowanego rampą C/N0, raportowany osobno od fizycznego czasu ucieczki fazy (średni czas Viterbiego między poślizgami cyklu, w log10 s, ponieważ obejmuje setki rzędów wielkości); ({ "4" }) granice wciągnięcia przez spoofing — największe przesunięcie kodu i tempo zmiany dopplerowskiej nośnej, za którymi mogą nadążyć pętle ofiary, z mapą po obu osiach, ponieważ spoofer, który przesuwa szybciej niż te granice, nie przechwytuje pętli, tylko ją wyprzedza; oraz ({ "5" }) PROMIEŃ ODMOWY wynikający z dynamiki pętli, raportowany OBOK istniejącego promienia stosunku mocy, nigdy w jego miejsce, z ich różnicą ze znakiem jako osobnym nazwanym polem (denial_radius_delta_km) i definicją obok. Każde emitowane pole liczbowe niesie jednostkę i klasę pochodzenia. VALIDATED, postacie zamknięte: wyrażenia na jitter nośnej i kodu, redukcja filtra pętli sqrt({ "2" }<em>B_n</em>T) oraz opóźnienie rampy pierwszego rzędu są sprawdzane krzyżowo względem własnego korelatora sdr silnika, krokowo uruchamianego na zasianym syntetycznym IF — inną drogą do tych samych liczb — odpowiednio do { "0.6" } %, { "3.7" } % i { "0.17" } %, a zmodyfikowana funkcja Bessela I0 leżąca u podstaw czasu poślizgu cyklu względem standardowych wartości tabelarycznych do { "1e-7" }. Dolna granica ważności jest wymuszona, a nie tylko podana: poniżej ok. { "32" } dB-Hz przy { "1" } ms rzeczywisty dyskryminator atan nasyca się względem swojego zakresu +-pi/2 i mierzy mniejszy jitter niż jakakolwiek teoria liniowa. MODELLED: szerokości pasm pętli, czas całkowania, rozstaw korelatora, stosunek pasm wciągania, okna potwierdzenia, moc zagłuszacza i zyski anten są reprezentatywnymi wartościami pasmowymi, a nie danymi z karty katalogowej. NIE modelowano: jitteru oscylatora (odchylenie Allana) i drgań, ograniczenia pasma toru wejściowego, wielodrogowości, dynamiki AGC, straty na przejściach bitów danych, wspomagania zewnętrznego ani żadnej korekty półcyklu we wzorze poślizgu cyklu Costasa. Przy dynamice pętli przechwycenie przez spoofing nie ma żadnego promienia — ograniczeniem wiążącym jest tempo przesunięcia, a nie moc — więc to pole ma wartość null wraz z powodem, a nie zmyśloną liczbę. To nie jest certyfikowany produkt do oceny parametrów odbiornika.

seg-62d230dfccce = Jeden przebieg <c1/> daje następujące podsumowanie: tracking-loop: B_pll { "10.0" } Hz / B_dll { "1.0" } Hz, T { "1" } ms, d { "0.50" } chip -> drop { "25.4744" } dB-Hz (carrier binds), relock { "27.4413" } dB-Hz, hysteresis { "1.9669" } dB | loss of lock declared { "39.101" } s into the ramp | denial radius threshold(J/S { "30" } dB) { "127.413" } km vs loop dynamics { "53.1694" } km, delta -74.2438 km | spoof pull-in <= { "0.966" } chip/s code and { "41.45" } Hz/s carrier (MODELLED loop, VALIDATED closed forms)

seg-7614718317f4 = Pola opcjonalne: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>, <c19/>, <c20/>, <c21/>, <c22/>, <c23/>, <c24/>, <c25/>, <c26/>, <c27/>, <c28/>, <c29/>

seg-41162ed2743b = Przykład <c1/> ustawia między innymi:

seg-773fff0feaf7 = ujęty w nawiasy

seg-23f3aa5c2064 = Etykieta wyniku (silnika): MIXED — VALIDATED postacie zamknięte pętli, MODELLED konfiguracja pętli. Wyrażenia na jitter termiczny nośnej i kodu, redukcja filtra pętli sqrt({ "2" }<em>B_n</em>T) i opóźnienie rampy pierwszego rzędu są sprawdzane krzyżowo względem własnego korelatora sdr silnika, krokowo uruchamianego na zasianym syntetycznym IF (inną drogą

seg-346594a654f2 = <b>MODELLED</b> Utrata zaczepu obliczana z dynamiki pętli zamiast ze stosunku mocy: jitter termiczny 1σ nośnej (Costas) i kodu (nieskoherentny early/late) względem C/N₀ ze stratą kwadratowania, na tle podanych reguł 3σ_PLL + θ_e ≤ { "45" }° oraz 3σ_DLL + ramp lag

seg-3aa7f9748dc2 = <b>MODELLED</b> Utrata zaczepu obliczana z dynamiki pętli zamiast ze stosunku mocy: jitter termiczny 1σ nośnej (Costas) i kodu (nieskoherentny early/late) względem C/N₀ ze stratą kwadratowania, na tle. Wyrocznia (ReferenceImpl): Własny korelator sdr silnika (sdr::correlate / synth_if / CaCode) krokowo uruchamiany na zasianym syntetycznym IF przy skalibrowanym C/N₀ — odrębna ścieżka kodu dochodząca do tych samych liczb przez numeryczną korelację próbkowanego IQ, a nie przez wyrażenie algebraiczne na jitter, więc jest to inna droga, a nie powtórzenie — oraz standardowe tabelaryczne wartości zmodyfikowanej funkcji Bessela I₀ dla składnika poślizgu cyklu. Teoria pętli wg Kaplan & Hegar

seg-de048f9cf1f6 = MIXED — VALIDATED postacie zamknięte pętli, MODELLED konfiguracja pętli. Wyrażenia na jitter termiczny nośnej i kodu, redukcja filtra pętli sqrt({ "2" }<em>B_n</em>T) i opóźnienie rampy pierwszego rzędu są sprawdzane krzyżowo względem własnego korelatora sdr silnika, krokowo uruchamianego na zasianym syntetycznym IF (inną drogą do tych samych liczb), a zmodyfikowana funkcja Bessela I0 względem standardowych wartości tabelarycznych. MODELLED: szerokości pasm pętli, całk (wynik <c1/>)

seg-0dc70b7607f0 = MODELLED: szerokości pasm pętli, czas całkowania, rozstaw korelatora, stosunek pasm wciągania, okna potwierdzenia, moc zagłuszacza i zyski anten są reprezentatywnymi wartościami pasmowymi, a nie danymi z karty katalogowej. (katalog rodzajów (<c1/>))

seg-a679a9732b2a = NIE modelowano: jitteru oscylatora (odchylenie Allana) i drgań, ograniczenia pasma toru wejściowego, wielodrogowości, dynamiki AGC, straty na przejściach bitów danych, wspomagania zewnętrznego ani żadnej korekty półcyklu we wzorze poślizgu cyklu Costasa. (katalog rodzajów (<c1/>))

seg-f8d50cbc6f2c = Każdy parametr pętli poniżej jest reprezentatywną wartością pasmową MODELLED, a nie danymi z karty katalogowej. (komentarz w pliku scenariusza, wiersz { "22" })

seg-9241a57823cd = --- geometria pętli ----------------------------------------------------------------- Pętla nośnej Costasa { "10" } Hz i pętla kodu wspomagana nośną { "1" } Hz, całkowanie koherentne { "1" } ms (jeden okres kodu C/A, więc nie zakłada się synchronizacji bitów danych), wąski korelator { "0.5" } chip. (komentarz w pliku scenariusza, wiersze { "25" } do { "28" })

seg-3a677e343081 = Utrata zaczepu pętli śledzenia i wciągnięcie przez spoofing w warunkach zakłóceń mają status MODELLED, nie są sprawdzone względem niezależnego wzorca zewnętrznego: sprawdzono je względem odrębnej implementacji w tej samej bazie kodu — niezależnej od testowanej jednostki, ale nie będącej zewnętrznym autorytetem. (macierz weryfikacji (docs/MODELLED-RATIONALE.md))

seg-e3a8f20108f3 = <s1>Poprzedni</s1>timetransfer

seg-05e8854de548 = chip
