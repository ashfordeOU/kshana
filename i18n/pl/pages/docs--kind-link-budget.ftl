# docs--kind-link-budget: translations (pl)

seg-99ef7c1d552c = Rodzaj scenariusza silnika v{ $version }, rodzina <a1>Analiza misji, łącza i operacje kosmiczne</a1>. Wyłącznie doradczo: wynik analizy z narzędzia badawczo-inżynieryjnego; nie jest to sprzęt nawigacyjny z zatwierdzeniem typu ani usługa bezpieczeństwa życia. Każda etykieta tutaj pochodzi z silnika lub z macierzy weryfikacji; rodzaj ma status MODELLED, chyba że macierz mówi inaczej (jak zdobywa się etykietę: sekcja Evidence w README).

seg-debc2f07db78 = true

seg-8784979d6569 = dBW

seg-37d16b499bc5 = dB

seg-37d29d8303fe = km

seg-8f1e7d3f5a07 = Strona rodziny: <a1>Analiza misji, łącza i operacje kosmiczne</a1>

seg-67fb8ac75f36 = MODELLED { "1" } · VALIDATED { "1" }: wiersze <a1>macierzy weryfikacji</a1>, które wymieniają ten rodzaj.

seg-a3697ad561db = Hz

seg-cec5c06d38af = <b>MODELLED</b> Księżycowy stosunek zagłuszania do sygnału, efektywne C/N₀ i utrata uchwycenia dla użytkownika na powierzchni selenograficznej pod księżycowym (lub podniesionym) zagłuszaczem, na ilustracyjnej konstelacji klasy Moonlight/LCNS opartej na źródłach publicznych.

seg-120fcc840b87 = Źródło: <c1/>

seg-738aa7d45efb = <c1/> (rodzaj scenariusza)

seg-953188c11165 = Jednokierunkowy bilans łącza według równania łącza CCSDS { "401" } / DSN 810-005: tłumienie w wolnej przestrzeni, C/N₀, Eb/N₀, zapas i domknięcie dla EIRP nadawania, G/T odbioru, odległości, szybkości danych i pasma (s|x|ka) względem wymaganego Eb/N₀. Deterministyczne obliczenie inżynierskie z podanych danych wejściowych (nie jest to skalibrowana karta katalogowa terminala).

seg-6697c741d09c = Jeden przebieg <c1/> podsumowuje się tak: link-budget: x-band, { "2000" } km, { "1000000" } bit/s -> FSPL { "177.0" } dB, Eb/N0 { "96.6" } dB, zapas { "92.1" } dB (domyka się)

seg-2305502051b6 = Pola opcjonalne: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>

seg-588476f4ae75 = Przykład <c1/> ustawia między innymi:

seg-ebb923e1a3b5 = Etykieta wyniku (silnika): Jednokierunkowy bilans łącza według równania łącza CCSDS { "401" } / DSN 810-005 (EIRP − FSPL − L_other + G/T − k); deterministyczne obliczenie inżynierskie z podanych danych wejściowych, NIE skalibrowana karta katalogowa terminala

seg-bd375631bc7e = Wykres, który silnik zapisuje dla scenarios/link-budget.toml, rodzaj link-budget

seg-4f92669c3946 = <b>VALIDATED</b> Tłumienie w wolnej przestrzeni, C/N₀, Eb/N₀, zapas i domknięcie według równania łącza CCSDS { "401" } / DSN 810-005 dla EIRP/G·T/odległości/szybkości/pasma względem wymaganego Eb/N₀. Testy: <a1>one_way_link_budget_reference.rs</a1>.

seg-bfaeb6f1cc5a = <b>VALIDATED</b> Tłumienie w wolnej przestrzeni, C/N₀, Eb/N₀, zapas i domknięcie według równania łącza CCSDS { "401" } / DSN 810-005 dla EIRP/G·T/odległości/szybkości/pasma względem wymaganego Eb/N₀. Runn. Wyrocznia (ExternalDataset): opublikowana deep-space telecom design-control table w postaci przypiętych wektorów liczbowych: DESCANSO / J. H. Yuen (ed.), Deep Space Telecommunications Systems Engineering, JPL Pub 82-76, Table 1-1 (Galileo X-band) — kshana odtwarza pozycje tabeli i odtwarza jej opublikowane wartości końcowe L_fs { "290.54" } dB i Pr/N0 { "54.6" } dB-Hz; tłumienie w wolnej przestrzeni sprawdzono także względem ITU-R P.525

seg-2598c2360113 = <b>MODELLED</b> Raport link-budget podaje każdą stałą bezwzględną, z której obliczono jego własny zapas -- częstotliwość nośnej użytą w tłumieniu w wolnej przestrzeni, EIRP, wartość o. Wyrocznia (InternalConsistency): Brak zewnętrznej wyroczni: to samoopis równania już sprawdzonego względem opublikowanej design-control table (zob. wiersz jednokierunkowego bilansu łącza). Zapisano go, ponieważ jego brak był zmierzonym defektem -- odtworzenie opublikowanego d1_rate_gain_beamwidth.csv wymagało wstecznego wyznaczenia jednej stałej efektywnej do { "0.0034" } dB ze wszystkich trzydziestu wierszy, a silnik teraz zarówno nazywa tę kombinację, jak i dowodzi, testem

seg-c779823e860c = Opcjonalnie: temperatura szumowa systemu odbiorczego (K). NIE jest to dana wejściowa równania łącza -- ono potrzebuje tylko stosunku G/T -- ale jej podanie pozwala raportowi podać także zysk anteny odbiorczej, który wynika z tej miary jakości (G = G/T + { "10" }*log10(T_sys)). Gdy ją pominięto, w raporcie nie ma podziału zysku, zamiast go zakładać. tsys_k = { "300.0" } (komentarz w pliku scenariusza, wiersze { "21" } do { "25" })

seg-d717412c4f06 = Samoopis raportu link-budget ma poziom MODELLED, nie jest niezależnie sprawdzony względem wzorca zewnętrznego: sprawdzono go względem jego własnej tożsamości w postaci zamkniętej / analitycznej; wychwytuje błędy przepisania i współczynników, ale nie jest zewnętrzną wyrocznią. (macierz weryfikacji (docs/MODELLED-RATIONALE.md))

seg-ffbc9de75306 = <s1>Poprzedni</s1>leo-signal

seg-59d4cb995cb9 = <s1>Następny</s1>lunar-attack-surface
