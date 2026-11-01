# docs--telecom-timing: translations (pl)

seg-04ece0eb7bd2 = Identyfikator maski

seg-a13eab564243 = MTIE

seg-f155b7ceef1f = TDEV

seg-42cdb8e987e6 = Budżet

seg-88372b30ed79 = Limit

seg-50fffd444946 = { "100" } ns

seg-79e6a31245f2 = { "400" } ns

seg-f63dd3d7aad4 = Źródło

seg-587beeccaa11 = Ustawienie predefiniowane

seg-edb7b16b6c0e = Walidacja

seg-3c513ef2fd3b = Wielkość

seg-62b6e83a9145 = Źródło: <c1/>

seg-95222c3659cd = Synchronizacja telekomunikacyjna: maski, źródła i presety

seg-5a604e063370 = Ta strona wymienia każdy limit, który sprawdza rodzaj scenariusza <c1/>, skąd pochodzi i co pominięto. Kod to <c2/>. Scenariusz referencyjny to <c3/>, scenariusz synchronizacji częstotliwości to <c4/>, a przykład wczytywania danych to <c5/>.

seg-f078828b2325 = <b>Skróty.</b> ITU-T to Sektor Normalizacji Telekomunikacji Międzynarodowego Związku Telekomunikacyjnego. GNSS to globalny system nawigacji satelitarnej. TE to błąd czasu, różnica między czasem zegara a czasem odniesienia. max|TE| to największy bezwzględny błąd czasu. MTIE to maksymalny błąd interwału czasu: największy błąd czasu międzyszczytowy w dowolnym oknie obserwacji o długości τ (tau). TDEV to odchylenie czasu, średniokwadratowa miara dryfu czasu przy czasie uśredniania τ. cTE to stały błąd czasu (średnie przesunięcie). dTE to dynamiczny błąd czasu (część, która się zmienia). TE_L i dTE_L to błąd czasu po filtrze dolnoprzepustowym pierwszego rzędu o paśmie { "0.1" } herca (Hz); dTE_H to część powyżej tego filtra. TE_HO to błąd czasu w holdover. PRTC to podstawowy zegar odniesienia czasu. ePRTC to ulepszony PRTC. T-BC to telekomunikacyjny zegar graniczny, a T-TSC to telekomunikacyjny zegar podrzędny czasu. PTP to Precision Time Protocol. PPS to impuls na sekundę. OCXO to oscylator kwarcowy z termostatem. CSAC to atomowy zegar w skali układu scalonego. CSV to wartości rozdzielone przecinkami. ADEV to odchylenie Allana (σ_y), standardowa miara stabilności częstotliwości. ns to nanosekundy, a µs to mikrosekundy. ppb to części na miliard (ułamkowa częstotliwość { "1e-9" }), a MHz to megaherce. Amd. to poprawka do Zalecenia, a Y.1367 i podobne to numer tego samego Zalecenia w serii Y ITU-T.

seg-a7746845eb05 = <b>Czym to jest.</b> Estymatory (MTIE i TDEV) są sprawdzone względem pakietu zewnętrznego <c1/> i pod tym względem mają poziom VALIDATED. Tablice masek są transkrypcjami poniższych Zaleceń. Syntetyczny holdover to model zbudowany z publicznych danych katalogowych. Rodzaj jako całość ma poziom MODELLED. Nie jest to test zgodności z normą, a PASS tutaj nie jest certyfikatem.

seg-e4adedc8e36d = Odczytane źródła

seg-44f6d9a7906c = Wszystkie teksty ITU-T pobrano z itu.int w dniu 2026-09-25. Użyto najnowszego wydania, które dało się odczytać w całości.

seg-28d4cebb747f = Zalecenie

seg-ef3644f3af9c = Odczytane wydanie

seg-82dcf7b71cdb = Status na itu.int

seg-149a5b44ddfd = ITU-T G.8272/Y.1367, <em>Timing characteristics of primary reference time clocks</em>

seg-f65ca7286466 = obowiązuje

seg-5dd73fad1c6b = ITU-T G.8272.1/Y.1367.1, <em>Timing characteristics of enhanced primary reference time clocks</em>

seg-efdb7451b140 = { "2024" } Amd. { "1" } (07/2025), publikacja w pełnym tekście

seg-fff491f6efc6 = ITU-T G.8273.2/Y.1368.2, <em>Timing characteristics of telecom boundary clocks and telecom time synchronous clocks for use with full timing support from the network</em>

seg-6dacd7a4b068 = { "2023" } Amd. { "2" } (11/2025), pełny tekst

seg-266cb2ce6e7f = ITU-T G.8271.1/Y.1366.1, <em>Network limits for time synchronization in packet networks with full timing support from the network</em>

seg-55fed85e64bc = { "2022" } Amd. { "3" } (05/2025), pełny tekst

seg-a2e1e37c4219 = ITU-T G.8271/Y.1366, <em>Time and phase synchronization aspects of telecommunication networks</em>

seg-63c64d128cc6 = 03/2020 i jego Amd. { "1" } (08/2024)

seg-66209db00349 = Istnieją dwie nowsze poprawki, których nie dało się odczytać: G.8272 ({ "2025" }) Amd. { "1" } (08/2026) oraz G.8272.1 ({ "2024" }) Amd. { "2" } (08/2026). Obie są opublikowane wstępnie i ograniczone do członków ITU (konta Telecommunication Information Exchange Service, TIES). Jeśli zmieniają jakąkolwiek podaną niżej wartość, ta strona i kod jeszcze tego nie odzwierciedlają.

seg-25d639be3a1b = <b>Jak sprawdzono liczby.</b> Wyodrębnianie tekstu z tych plików Portable Document Format (PDF) gubi grecką literę τ i znak mikro µ, więc „{ "0.275" } × { "10" }⁻³τ” wychodzi jako „{ "0.275" } × { "10" }⁻³”. Dlatego każdy wiersz tabel od { "1" } do { "4" } w G.8272, tabel od { "1" } do { "5" } w G.8272.1, tabeli { "1" } w G.8271 i tabeli 7-1 w G.8271.1 odczytano ponownie z obrazu wyrenderowanej strony. Tabele od 7-1 do 7-5 w G.8273.2 oraz tabele 7-2 i 7-3 w G.8271.1 odczytano z wyodrębnionego tekstu, w którym τ się zachowało. Tam, gdzie tabela implikuje ciągłość w punkcie załamania, sprawdza to test jednostkowy.

seg-33b5f44c513b = Zaimplementowane limity

seg-3ce6da7e3e99 = τ jest w sekundach. Przedział zapisany „{ "0.1" } < τ ≤ { "273" }” jest otwarty przy { "0.1" } s i domknięty przy { "273" } s, dokładnie jak w tabeli, a kod zachowuje każdy koniec w ten sam sposób.

seg-1efb6779348a = ITU-T G.8272 (07/2025): PRTC-A i PRTC-B, tryb zablokowany

seg-c54e45baa463 = max|TE|

seg-25887373a479 = { "40" } ns

seg-0e18047889c1 = punkt { "6.1" }

seg-4ce06948bf3f = MTIE (punkt { "6.2" }):

seg-f1e336517976 = Maska

seg-7c40080fe799 = Przedział

seg-039493f144b8 = { "0.275" } × { "10" }⁻³ τ + { "0.025" } µs

seg-ca1cf5e6c558 = { "0.1" } < τ ≤ { "273" }

seg-a2ae8d8ad68a = Tabela { "1" }

seg-d1b301281575 = { "0.10" } µs

seg-22afd1138a6a = τ > { "273" }

seg-9691c1cfa143 = { "0.1" } < τ ≤ { "54.5" }

seg-95049bb8aaa1 = Tabela { "2" }

seg-f2562bdf8fd5 = { "0.04" } µs

seg-72ef2a66af58 = τ > { "54.5" }

seg-d18148049b1e = TDEV (punkt { "6.2" }):

seg-f492a7e39046 = { "3" } ns

seg-4f658870d55d = { "0.1" } < τ ≤ { "100" }

seg-7334c58cd44b = Tabela { "3" }

seg-3bf4d8b009d5 = { "0.03" } τ ns

seg-2969d84226e6 = { "100" } < τ ≤ { "1 000" }

seg-02bacda97914 = { "30" } ns

seg-e28777641ebe = { "1 000" } < τ < { "10 000" }

seg-1c0341aaa919 = { "1" } ns

seg-70c7899bf805 = Tabela { "4" }

seg-8ec1f8c65e4f = { "0.01" } τ ns

seg-e3bdc7a40432 = { "100" } < τ ≤ { "500" }

seg-2851f795541f = { "5" } ns

seg-f1d7d80685aa = { "500" } < τ < { "100 000" }

seg-9b8478f86b44 = Punkt { "6.2" } stwierdza także, że minimalny okres pomiaru dla TDEV jest dwunastokrotnością okresu całkowania (T = 12τ). Rodzaj stosuje tę regułę do każdego raportowanego TDEV, więc TDEV podaje się tylko dla τ do jednej dwunastej rejestracji. G.8272 nie podaje wymagania holdover dla PRTC.

seg-392ca772c712 = ITU-T G.8272.1 ({ "2024" }) Amd. { "1" } (07/2025): ePRTC

seg-42c76f7b90ac = Tryb zablokowany:

seg-160dced77932 = { "4" } ns

seg-88e8948869fc = { "0.1" } < τ ≤ { "1" }

seg-c89d5cf52ad3 = { "0.11114" } τ + { "3.89" } ns

seg-fad294d3be39 = { "1" } < τ ≤ { "100" }

seg-e18d635df164 = { "0.0375" } × { "10" }⁻³ τ + { "15" } ns

seg-273d60d5cd4a = { "100" } < τ ≤ { "400 000" }

seg-4d971fea7954 = τ > { "400 000" }

seg-4e9052bb688f = { "0.1" } < τ ≤ { "30 000" }

seg-2401257610c6 = { "3.33333" } × { "10" }⁻⁵ τ ns

seg-560ef6f53bf7 = { "30 000" } < τ ≤ { "300 000" }

seg-727399dbf061 = { "10" } ns

seg-3f5b5d8a1ea9 = { "300 000" } < τ < { "1 000 000" }

seg-ca9cb946c8f4 = Holdover ePRTC-A, błąd czasu (punkt { "8.2.1" }, Tabela { "3" }). L to czas, przez jaki ePRTC był zablokowany przed utratą, w dniach, a t to czas od początku holdover, w sekundach. Limit rośnie liniowo od { "30" } ns do { "100" } ns w okresie holdover H.

seg-fa700160348e = Czas zablokowania L

seg-61f9dec111cb = Okres holdover H

seg-f6a6df18839c = Limit dla |Δx(t)|

seg-9229068d7534 = L < { "6" } dni

seg-5bd5193f213c = { "0" } < t ≤ { "70 000" } s ({ "0.81" } dnia)

seg-df5ffdf7245b = { "30" } + { "1.000" } × { "10" }⁻³ t ns

seg-1af75c2d666f = { "6" } dni ≤ L ≤ { "40" } dni

seg-51754e29cb46 = { "0" } < t ≤ L · { "86 400" } s

seg-dacdb2a00c6a = { "30" } + { "70" } t / (L · { "86 400" }) ns

seg-71a6238f1e29 = L > { "40" } dni

seg-5a0e39fa8dc3 = { "0" } < t ≤ { "3 456 000" } s ({ "40" } dni)

seg-b0a167d378cb = { "30" } + { "2.025463" } × { "10" }⁻⁵ t ns

seg-3262966b5eab = Holdover ePRTC-A, dryf (punkt { "8.2.2" }):

seg-2c09e57675a7 = { "100" } < τ ≤ { "10 000" }

seg-9afccb4dbf30 = { "0.1" } < τ ≤ { "10 000" }

seg-a4a813c38ef6 = Tabela { "5" }

seg-5d56fb7889b2 = Punkt { "8.3.1" } ustala domyślny maksymalny błąd czasu w holdover, max|TE_HO|, na { "100" } ns. Rodzaj używa go jako domyślnego budżetu czasu do przekroczenia.

seg-3702a44d3ff1 = ITU-T G.8273.2 ({ "2023" }) Amd. { "2" } (11/2025): T-BC i T-TSC

seg-96b5072f792f = Klasa A

seg-7737bc0444b1 = Klasa B

seg-cd92242017a8 = Klasa C

seg-0689443dfc12 = Klasa D

seg-54163aca5d46 = max|TE| (niefiltrowany)

seg-b36412e1acfb = { "70" } ns

seg-ed79e6cdac25 = do dalszych badań

seg-5c2985d408e3 = Tabela 7-1

seg-067c7c90c1e1 = max|TE_L| (filtr dolnoprzepustowy { "0.1" } Hz)

seg-1c5ac746d16b = Tabela 7-2

seg-9802166ed2e2 = zakres cTE

seg-b94484db77ab = ±{ "50" } ns

seg-17d4f5817950 = ±{ "20" } ns

seg-1399281b7ce6 = ±{ "10" } ns

seg-a694039549c8 = Tabela 7-3

seg-d8799ba27fc3 = dTE_L MTIE, stała temperatura

seg-c332ee79beaf = Tabela 7-4, m ≤ τ ≤ { "1 000" }

seg-2bd284168318 = dTE_L TDEV, stała temperatura

seg-8358cf8c4e50 = { "2" } ns

seg-6a1cc65603b3 = Tabela 7-5

seg-de739a499521 = W Tabeli 7-5 klasy A i B są zapisane jako m < τ ≤ { "1 000" }, a klasa C jako m ≤ τ ≤ { "1 000" }. m wynosi 1/16 s dla strumienia PTP o { "16" } pakietach na sekundę i { "1" } s dla wyjścia { "1" } PPS. Rodzaj traktuje wejście jako błąd interwału czasu { "1" } PPS, więc m = { "1" } s. Uwaga { "1" } do Tabeli 7-3 mówi, że cTE szacuje się przez uśrednienie błędu czasu w ciągu { "1 000" } s. Rodzaj raportuje największą bezwzględną średnią z kolejnych bloków po { "1 000" } s.

seg-0a4b66fe5535 = ITU-T G.8271.1 ({ "2022" }) Amd. { "3" } (05/2025): limity sieciowe w punkcie odniesienia C

seg-8c2b01661011 = Wszystkie trzy dotyczą przypadku wdrożenia { "1" } i obowiązują po filtrze dolnoprzepustowym pierwszego rzędu { "0.1" } Hz.

seg-b3f93a59a8eb = Punkt

seg-23e44eab6e8b = max|TE_L|

seg-cb1a66f62f8e = Limit MTIE

seg-4aa99615d914 = { "7.3.1" } (zastosowania klasy { "4" })

seg-eacfcd0a9ea5 = { "1 100" } ns

seg-dc2351580120 = { "100" } + { "75" } τ ns

seg-b2c519d30bc8 = { "1.3" } < τ ≤ { "2.4" }

seg-3c9bd014a192 = { "277" } + { "1.1" } τ ns

seg-abad3634a83e = { "2.4" } < τ ≤ { "275" }

seg-884708f2736f = { "580" } ns

seg-22bf4721fe97 = { "275" } < τ ≤ { "10 000" }

seg-17c12885b0d1 = { "7.3.2" } (sieć rozszerzona)

seg-fcd7cb03855f = { "600" } ns

seg-9df58e5be8fc = { "37.39" } + { "9.7" } τ ns

seg-8e4e29bb36ac = { "55.27" } + { "2.25" } τ ns

seg-1d92062202d8 = { "2.4" } < τ ≤ { "20.2" }

seg-6ab02b4db41e = { "90.22" } + { "0.52" } τ ns

seg-81785e02523f = { "20.2" } < τ ≤ { "211.11" }

seg-f7fda527feed = { "200" } ns

seg-cab0e877b11b = { "211.11" } < τ ≤ { "10 000" }

seg-1f0b651381ea = { "7.3.3" } (PRTC w sieci dostępowej)

seg-5a5405483174 = { "0.0475" } τ + { "25" } ns

seg-3aacef0066a0 = { "1" } < τ < { "400" }

seg-f34cbd5ce7e4 = { "44" } ns

seg-76f436fd7664 = { "400" } < τ ≤ { "10 000" }

seg-b0987b4e2e07 = Tabela 7-3 pozostawia samo τ = { "400" } s bez limitu (jeden wiersz kończy się na „< { "400" }”, następny zaczyna od „{ "400" } <”). Rodzaj nie raportuje tam żadnego limitu, zamiast jakiś wybierać. Punkt odniesienia A (punkt { "7.1" }) przejmuje limity z G.8272, więc obejmują go powyższe maski PRTC.

seg-915182a7500e = Synchronizacja częstotliwości: generowanie dryfu według G.811, G.812, G.8262 i G.8262.1 ({ "0.36" })

seg-fb1342b76953 = Siedem masek, z których każda jest limitem generowania dryfu MTIE i TDEV w stałej temperaturze (w granicach ±{ "1" } K), zdefiniowanym przez równoważny filtr pomiarowy dolnoprzepustowy pierwszego rzędu { "10" } Hz, który podają te punkty. Ten filtr działa przed próbkowaniem, więc rodzaj przyjmuje, że rejestracja jest już zmierzona przez niego, i niczego nie stosuje. Maska PRC dotyczy zegara autonomicznego (konfiguracja zegara niezależnego z G.810, rysunek 2a); pozostałe to limity w trybie zablokowanym dla zegara zsynchronizowanego z wzorcem bez dryfu. Scenariusz referencyjny to <c1/>: wolnobieżny OCXO względem trzech masek EEC, co zawyża udział oscylatora przy interwałach obserwacji długich w porównaniu ze stałą czasową jakiejkolwiek pętli.

seg-3faf039b0ed9 = MTIE (ns)

seg-ca33cbe4fd07 = TDEV (ns)

seg-769e7fed4cd2 = { "0.275" } τ + { "25" } ({ "0.1" } < τ ≤ { "1 000" }); { "0.01" } τ + { "290" } (τ > { "1 000" })

seg-73dcf463ea29 = { "3" } ({ "0.1" } < τ ≤ { "100" }); { "0.03" } τ ({ "100" } < τ ≤ { "1 000" }); { "30" } ({ "1 000" } < τ < { "10 000" })

seg-cb38d6327e5c = G.811 (09/1997) punkt { "6.1" }

seg-1d9621af8091 = { "24" } ({ "0.1" } < τ ≤ { "9" }); { "8" } τ^{ "0.5" } ({ "9" } < τ ≤ { "400" }); { "160" } ({ "400" } < τ ≤ { "10 000" })

seg-bc8e3aa24bfe = { "3" } ({ "0.1" } < τ ≤ { "25" }); { "0.12" } τ ({ "25" } < τ ≤ { "100" }); { "12" } ({ "100" } < τ ≤ { "10 000" })

seg-5e048893f25e = G.812 (06/2004) Tabele { "3" } i { "6" }

seg-45d290d9640a = { "3.2" } τ^−{ "0.5" } ({ "0.1" } < τ ≤ { "2.5" }); { "2" } ({ "2.5" } < τ ≤ { "40" }); { "0.32" } τ^{ "0.5" } ({ "40" } < τ ≤ { "1 000" }); { "10" } (τ > { "1 000" })

seg-ae92888ca436 = G.812 (06/2004) Tabele { "4" } i { "7" }

seg-860b31153778 = { "40" } ({ "0.1" } < τ ≤ { "1" }); { "40" } τ^{ "0.1" } ({ "1" } < τ ≤ { "100" }); { "25.25" } τ^{ "0.2" } ({ "100" } < τ ≤ { "1 000" })

seg-854159374e79 = { "3.2" } ({ "0.1" } < τ ≤ { "25" }); { "0.64" } τ^{ "0.5" } ({ "25" } < τ ≤ { "100" }); { "6.4" } ({ "100" } < τ ≤ { "1 000" })

seg-8e825000b58e = G.8262 (10/2024) Tabele { "1" } i { "3" }

seg-50fd3bf139a4 = { "20" } ({ "0.1" } < τ ≤ { "1" }); { "20" } τ^{ "0.48" } ({ "1" } < τ ≤ { "10" }); { "60" } ({ "10" } < τ ≤ { "1 000" })

seg-9ef5ff04e1d4 = jak G.812 Tabela { "7" }, domknięte przy { "10 000" } s

seg-3ecb8d9128d0 = G.8262 (10/2024) Tabele { "4" } i { "5" }

seg-ef3156b68064 = { "10" } τ^{ "0.155" } ({ "0.1" } ≤ τ ≤ { "1" }); { "10" } τ^{ "0.1" } ({ "1" } < τ ≤ { "100" }); { "6.3" } τ^{ "0.2" } ({ "100" } < τ ≤ { "1 000" })

seg-28f7a98f132e = { "0.64" } ({ "0.1" } ≤ τ ≤ { "25" }); { "0.128" } τ^{ "0.5" } ({ "25" } < τ ≤ { "100" }); { "1.28" } ({ "100" } < τ ≤ { "1 000" })

seg-47d0f50aa906 = G.8262.1 (11/2025) Tabele { "1" } i { "3" }

seg-45e4ed8fa6ea = Każdy wiersz sprawdzono względem tekstu pobranego z itu.int w dniu 2026-10-13: G.8262 (10/2024), G.8262.1 (11/2025), G.812 (06/2004) i G.811 (09/1997). G.812 (06/2004) jest oznaczona jako zastąpiona wstępnie opublikowanym wydaniem 08/2026, a G.811 ma Amd. { "1" } (04/2016); żadnego z nich nie dało się pobrać, więc jeśli zmieniają jakąkolwiek wartość podaną wyżej, ta strona i kod tego nie odzwierciedlają. Tam, gdzie wydrukowane współczynniki powodują nieciągłość w punkcie załamania (na przykład { "40" } · { "10" }^{ "0.4" } = { "100.48" } ns wobec plateau { "100" } ns w G.812 Tabela { "4" }), tabele pozostawiono tak, jak wydrukowano, a testy jednostkowe ograniczają skok. Niezaimplementowane: tolerancje przy zmiennej temperaturze (G.812 Tabela { "5" }, G.8262 Tabela { "2" }, G.8262.1 Tabela { "2" }), wymagania dotyczące holdover i stanów przejściowych, jitter oraz dokładność częstotliwości G.811 z punktu { "5" }.

seg-4f6666854cf7 = Budżety (czas do przekroczenia)

seg-1f3322a94bbb = Domyślny max|TE_HO| dla ePRTC

seg-26fd4be0d5ca = G.8272.1 ({ "2024" }) Amd. { "1" } (07/2025) punkt { "8.3.1" }

seg-0d5433d85c88 = Przydział holdover w sieci, krótkie przerwanie GNSS

seg-b74c5284d584 = G.8271.1 ({ "2022" }) Amd. { "3" } (05/2025) Tabela V.1, scenariusz awarii (b), „przekształcenia i holdover w sieci”. Przykładowy przydział, nie wymaganie.

seg-afe6c9903ada = Limit sieciowy w punkcie odniesienia C

seg-0c261b05c3cf = G.8271.1 punkt { "7.3.1" }. To wielkość filtrowana; jako budżet jest porównywana bez filtra.

seg-4b5a9718d008 = Zastosowanie końcowe, klasa dokładności { "4" }

seg-2a38e45e7008 = { "1.5" } µs

seg-41c6dd43e313 = G.8271 (03/2020) Amd. { "1" } (08/2024) Tabela { "1" }, klasa { "4" }

seg-ded846b5a4bc = <b>Klasyczna wartość „{ "1.5" } µs od końca do końca”.</b> To wymaganie G.8271 Tabela { "1" } dla błędu czasu klasy { "4" }, podane względem wspólnego wzorca w zastosowaniu końcowym. G.8271.1 Tabela V.1 pokazuje, jak sieć może je rozdzielić w normalnej pracy: { "100" } ns na PRTC/telekomunikacyjny grandmaster, { "200" } ns na dynamiczny błąd czasu łańcucha, stały błąd czasu dla zegarów i łączy, łącznie { "1 100" } ns w punkcie odniesienia C, potem { "250" } ns na przekształcenia i krótki holdover w zastosowaniu końcowym oraz { "150" } ns na własny szum zastosowania końcowego, czyli { "1 500" } ns w punkcie odniesienia E. Scenariusz awarii (c) z tej samej tabeli, „długie okresy holdover, np. { "1" } dzień”, daje { "3 350" } ns w C i { "3 500" } ns w E (jej Uwaga { "5" } mówi, że przekroczenie { "1 500" } ns może pogorszyć usługę). Zatem żadne z Zaleceń nie podaje wymagania „{ "1.5" } µs przez { "24" } godziny holdover”, a rodzaj go nie implementuje.

seg-76cab595673a = Niepotwierdzone lub niezaimplementowane

seg-175c282ddce2 = Nic z poniższego nie jest zaimplementowane jako maska. Nic z tego nie zostało uzupełnione szacunkiem.

seg-3c74e4ba9579 = <b>Oznaczone w Zaleceniach jako „do dalszych badań”:</b> G.8273.2 klasa D max|TE|, cTE, dTE_L MTIE i TDEV, dTE_H oraz holdover; holdover ePRTC-B (G.8272.1 punkt { "8.2.1" }); MTIE i TDEV holdover ePRTC-A powyżej { "10 000" } s (Tabela { "4" } Uwaga { "1" }, Tabela { "5" } Uwaga { "2" }); nieciągłość fazy ePRTC (punkt { "7" }); holdover fazy/czasu T-BC/T-TSC przy utracie zarówno wejść PTP, jak i warstwy fizycznej (G.8273.2 punkt { "7.4.2.1" }); limit sieciowy TDEV w punkcie odniesienia C (G.8271.1 punkty od { "7.3.1" } do { "7.3.3" }); limity sieciowe dla przypadku wdrożenia { "2" } w punkcie C.

seg-93c60d44788e = <b>Przepisane, ale niezaimplementowane w tej wersji:</b> G.8273.2 Tabela 7-6 (MTIE przy zmiennej temperaturze: { "40" } / { "40" } / { "10" } ns do { "10 000" } s), Tabela 7-7 (dTE_H międzyszczytowo: { "70" } / { "70" } / { "30" } ns, co wymaga filtra górnoprzepustowego { "0.1" } Hz), Tabela 7-10 (holdover MTIE z pomocą częstotliwości z warstwy fizycznej), względny błąd czasu (Tabele 7-8 i 7-9) oraz limity dTE_H z G.8271.1 punkty { "7.3.2" } ({ "50" } ns) i { "7.3.3" } ({ "70" } ns).

seg-f5fcd3b0f8a5 = <b>Niezastosowane:</b> filtr średniej ruchomej z co najmniej { "100" } próbek, który G.8272 i G.8272.1 podają dla interfejsów PTP. Wejście jest traktowane jako błąd interwału czasu { "1" } PPS, który te Zalecenia mierzą bez filtra.

seg-74fe057a4392 = <b>Nieczytelne:</b> dwie ograniczone poprawki z { "2026" } wymienione w „Odczytane źródła”.

seg-bd4ec59cc872 = <b>Osobliwość redakcyjna:</b> w G.8272.1 Amd. { "1" } nagłówek Tabeli { "3" } zawiera wstawiony wiersz „TDEV limit [ns] { "1" } / { "0.1" } < τ ≤ { "10 000" }” w znaczniku poprawki, nad kolumnami błędu czasu. Nie jest traktowany jako część obwiedni błędu czasu. To samo { "1" } ns TDEV jest w Tabeli { "5" } i tam jest zaimplementowane.

seg-511db1219de1 = Filtr pomiarowy

seg-5fc683308b31 = G.8273.2 i G.8271.1 definiują swoje limity filtrowane przez filtr dolnoprzepustowy pierwszego rzędu o paśmie { "0.1" } Hz. Rodzaj stosuje dyskretny wygładzacz y_k = y_{ "{" }k−{ "1" }{ "}" } + α (x_k − y_{ "{" }k−{ "1" }{ "}" }), α = { "1" } − exp(−2π · { "0.1" } · Δt), rozpoczęty od pierwszej próbki. Jest to przybliżenie sprzętu pomiarowego, a nie kopia żadnego przyrządu. Stosuje się go tylko wtedy, gdy odstęp próbkowania Δt wynosi { "1" } s lub mniej. Grubsza rejestracja jest raportowana jako NOT-EVALUATED względem maski filtrowanej, zamiast być źle filtrowana.

seg-218e5ad620af = Presety oscylatorów (MODELLED)

seg-28bb7b8ad89f = Każda wartość pochodzi z samej karty katalogowej, odczytanej w dniu 2026-09-25.

seg-b4207b682560 = Urządzenie i dokument

seg-13f9ba96c063 = Użyte maksima ADEV (τ: σ_y)

seg-d719167df981 = Starzenie

seg-f30740907f6a = Temperatura

seg-c789847129bd = Microchip (Vectron) OX-208, { "10" } MHz; karta katalogowa Rev 12-1-2021

seg-cefcf7025826 = { "1" } s: { "5e-12" }; { "10" } s: { "8e-12" }; { "100" } s: { "1e-11" }; { "1 000" } s: { "5e-11" }

seg-85f8b8fbbae6 = ±{ "0.15" } ppb/dzień po { "72" } h (f ≤ { "10" } MHz)

seg-0c6d3ae4e409 = ±{ "0.4" } ppb, { "0" } °C do +{ "70" } °C, względem +{ "25" } °C

seg-53ac4dcaf8b1 = Microchip 8040C Rubidium Frequency Standard, wydajność standardowa; DS00003047A (2/20)

seg-ccb8b3a41af4 = { "1" } s: { "3.0e-11" }; { "100" } s: { "3.0e-12" }

seg-ae0f630aba4b = <5e-11/miesiąc po { "30" } dniach

seg-dbb2a780ceb9 = współczynnik temperaturowy <{ "3E-10" }, { "0" } °C do { "50" } °C

seg-79d5b7a3a453 = Microchip 5071A, lampa wysokowydajna; DS00002980D (5/25)

seg-62572a695878 = { "1" } s: { "5.0e-12" }; { "10" } s: { "3.5e-12" }; { "100" } s: { "8.5e-13" }; { "1 000" } s: { "2.7e-13" }; 10⁴ s: { "8.5e-14" }; 10⁵ s: { "2.7e-14" }; { "5" } dni: { "1.0e-14" }; { "30" } dni: { "1.0e-14" }

seg-1fbdd6edc376 = brak opublikowanej szybkości; zmiana w całym okresie życia ≤{ "5.0e-14" }

seg-bb485faf403a = ±{ "8.0e-14" } względem środowiska ({ "0" } °C do { "50" } °C, wilgotność, pole magnetyczne, wstrząsy)

seg-889f4dc6cafc = Microchip SA.45s CSAC, opcje { "001" } i { "003" }; DS00002985D (5/23)

seg-ecee1cb2a670 = { "1" } s: { "3e-10" }; { "10" } s: { "1e-10" }; { "100" } s: { "3e-11" }; { "1 000" } s: { "1e-11" }

seg-c90e2f590297 = <9e-10/miesiąc po { "30" } dniach

seg-5b1bd12aea0f = ±{ "5e-10" }, −{ "10" } °C do { "70" } °C

seg-63ba00e95bbc = Linki do dokumentów: <a1>OX-208</a1>, <a2>8040C</a2>, <a3>5071A</a3>, <a4>SA.45s</a4>.

seg-31ad29d092ee = Celowo pominięto: wiersz { "10" } s dla 8040C, który karta katalogowa drukuje jako „<{ "1.0" } x { "10" }^{ "11" }” (błędnie wydrukowany wykładnik), oraz wiersze 5071A poniżej { "1" } s. OX-049 rozważano dla OCXO i nie użyto, ponieważ jego wiersza starzenia nie da się jednoznacznie odczytać z rozjechanej tabeli.

seg-8d4a915bc7fc = <b>Jak liczby stają się modelem.</b> To wybory tego silnika, a każdy z nich jest raportowany w wynikach przebiegu:

seg-f1e6ea28601c = <b>Dopasowanie szumu.</b> Poziomy szumu częstotliwości białego, migotania i błądzenia losowego są nieujemnym dopasowaniem najmniejszych kwadratów do maksimów ADEV, a następnie skalowane w górę, aż model znajdzie się na poziomie każdego punktu lub powyżej. Wartości z karty katalogowej są maksimami, więc model je obejmuje od góry.

seg-0e5ab055094a = <b>Dno migotania.</b> Dno nigdy nie leży poniżej ADEV przy najdłuższym wymienionym τ. Karta katalogowa przestaje wymieniać wartości tam, gdzie producent przestaje obiecywać poprawę, więc model nie pozwala zegarowi poprawiać się poza ten punkt. Może to jedynie pogorszyć holdover.

seg-ebefbd6f119b = <b>Starzenie.</b> Wartość miesięczna jest przeliczana przy { "30" } dniach na miesiąc i stosowana jako liniowy dryf częstotliwości od chwili utraty. Preset cezowy nie ma starzenia.

seg-bb08c7b5baf5 = <b>Temperatura.</b> Podaną granicę odczytuje się liniowo w połowie zakresu pracy (na przykład ±{ "5e-10" } w zakresie od −{ "10" } °C do { "70" } °C daje { "1.25e-11" } na kelwin), a następnie wymusza sinusoidalnym profilem temperatury, którego amplituda i okres są danymi wejściowymi scenariusza. Nic na karcie katalogowej nie mówi, że zależność jest liniowa; to odczyt w najgorszym przypadku.

seg-47a256757cfc = <b>Przed utratą</b> zegar jest dyscyplinowany, a jego błąd czasu to szum fazy białej o podanej wartości 1-sigma.

seg-3ef60b128bb7 = <b>Co pokazuje scenariusz referencyjny.</b> Przy zatwierdzonych danych wejściowych (rubid, ±{ "2" } K dobowego wahania temperatury, { "24" } h holdover po { "1" } h zablokowania) rejestracja osiąga największy bezwzględny błąd czasu { "603.2" } ns. Przekracza budżet ePRTC { "100" } ns po { "8 206" } s od utraty, a przydział { "400" } ns po { "25 713" } s, i przez całą dobę mieści się w { "1 100" } ns i { "1.5" } µs. Nie spełnia obwiedni holdover ePRTC-A po { "3 627" } s od utraty, co jest oczekiwane: to wymaganie zakłada wzorzec klasy cezowej. Sam człon temperaturowy może sięgnąć { "660" } ns, więc przy tych danych wejściowych znaczy więcej niż starzenie ({ "72" } ns na koniec doby).

seg-ba87d450423c = <c1/> sprawdza MTIE i TDEV rodzaju względem <c2/> { "2024.06" } na <c3/>, serii holdover CSAC w CSV o { "2" } 048 próbkach ze starzeniem, migotaniem i temperaturą. Dla { "17" } współczynników uśredniania MTIE i { "12" } współczynników TDEV MTIE zgadza się dokładnie, a TDEV zgadza się z dokładnością { "1.1e-15" } względnie. Te same krzywe są odczytywane z pełnego przebiegu, który wczytuje CSV. To sprawdza estymatory na tej rejestracji. Nie sprawdza syntetycznego holdover, masek ani presetów, które są wierszami MODELLED w <c4/>.

seg-6fdc3cc32a2f = <s1>Poprzednia</s1>Taktowanie slotów

seg-1108b114de88 = <s1>Następna</s1>Oszukany czas
