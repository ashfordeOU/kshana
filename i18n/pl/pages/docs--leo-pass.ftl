# docs--leo-pass: translations (pl)

seg-cae10fb9bff8 = Scenariusz

seg-cbf0f9bcd2d8 = Wyrocznia

seg-6e0cb6acc073 = VALIDATED

seg-f63dd3d7aad4 = Źródło

seg-587beeccaa11 = Ustawienie predefiniowane

seg-1ff32b87e030 = Satelity

seg-a6c63abeb7e6 = Dołączone scenariusze

seg-60cd077d82a7 = Model

seg-2b0d77219437 = Gotowe ustawienia

seg-5566e1d71a4f = Orbita

seg-c2a2761f73b1 = { "550" } km, { "53" }°

seg-c5ce76c91ff7 = Etykieta

seg-813d372bda81 = Źródło: <c1/>

seg-0bd4af67ffdb = Przejście LEO i budżet łącza (<c1/>)

seg-30417c63c48e = LEO-PNT to pozycjonowanie, nawigacja i czas (PNT) z satelitów na niskiej orbicie okołoziemskiej (LEO). Rodzaj <c1/> symuluje jedno lub więcej przejść satelitów LEO nad użytkownikiem i wylicza budżet łącza pasmo po paśmie, obok satelitów GNSS (globalny system nawigacji satelitarnej) na średniej orbicie okołoziemskiej (MEO) widocznych w tym czasie. Silnik jest <b>niezależny od systemu</b>: dowolna konstelacja, dowolny projekt sygnału i dowolne pasmo, wpisane wprost w scenariuszu. Nazwane systemy to opcjonalne gotowe ustawienia, każde w osobnym pliku ze swoim źródłem.

seg-242c84daecb0 = Kod: <a1><c1/></a1> (rodzaj) i <a2><c2/></a2> (publiczne klocki, które mogą wywoływać inne moduły).

seg-0e6b09e372f5 = Scenariusze: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/> oraz opcjonalny <c8/> (wyniki w <a1>Dołączone scenariusze</a1>). Ten rodzaj jest też członkiem kampanii <c9/>, <c10/>, <c11/> i każdego scenariusza <c12/> oraz etapem przejścia rodzaju <c13/>.

seg-59cebed2f589 = Przegląd każdego rodzaju i scenariusza LEO-PNT: <a1>LEO-PNT.md</a1>.

seg-9646ce17cddf = Wyrocznie: <a1><c1/></a1>, dane wzorcowe w <c2/> wraz z adresami URL ich źródeł.

seg-c1020ac47091 = Co oblicza jeden przebieg

seg-10dedc607eac = Dla każdego satelity LEO, pasma i epoki:

seg-35bf9a48e566 = Wielkość

seg-b0f12ee05fe9 = Elewacja, azymut, odległość

seg-24ad909c4fb8 = użytkownik w WGS-84 (World Geodetic System { "1984" }), satelita w układzie inercjalnym zgodnym z układem związanym z Ziemią w danej epoce

seg-c9f61c3348ef = obliczone

seg-ebd800ec3d47 = Prędkość zmiany odległości <c1/>, przyspieszenie odległości <c2/>

seg-232b42b71f03 = postać zamknięta; każdy przebieg sprawdza oba względem różnic centralnych propagowanej odległości i podaje największą różnicę

seg-b3a55e868346 = postać zamknięta

seg-3f1f90a57c2f = Doppler <c1/>, tempo zmiany Dopplera <c2/>

seg-852b6c351ce4 = pierwszego rzędu, dla każdego pasma

seg-4eb4b779679b = Tłumienie w wolnej przestrzeni

seg-31f67bcd2d50 = Friis, <c1/>

seg-fb5f06a91de1 = EIRP satelity (równoważna moc promieniowana izotropowo) i charakterystyka

seg-883702244778 = izoflux do elewacji granicznej, gaussowski listek główny <c1/> dB, lub płaska

seg-b6e91c5252d3 = Antena użytkownika

seg-ed92a0abf62f = patch <c1/> dBic, półsferyczna lub izotropowa

seg-0ac54d232e0a = Tłumienie gazowe

seg-30fb5b0a0bc7 = uproszczone wyrażenia z załącznika { "2" } do ITU-R (International Telecommunication Union, Radiocommunication Sector) P.676-10 (zastąpionego przez P.676-13, którego tabelaryzowanych współczynników silnik nie zawiera)

seg-58d58478e9eb = Tłumienie deszczu

seg-4c1e413d5fc3 = współczynniki ITU-R P.838-3 i procedura P.618-14 § { "2.2.1.1" }, na podstawie natężenia deszczu R0.01 i wysokości deszczu

seg-dab78c0552b6 = Scyntylacja troposferyczna

seg-8e5ca14cbf08 = ITU-R P.618-14 § { "2.4.1" }; poniżej { "4" } GHz ekstrapolacja, oznaczona w raporcie

seg-788516420351 = VALIDATED ({ "4" }–{ "55" } GHz)

seg-32dddfdba584 = Tłumienie przy wejściu do budynku (użytkownik wewnątrz)

seg-ef9025622e81 = ITU-R P.2109-2, tradycyjne lub termicznie efektywne, przy elewacji ścieżki na elewacji budynku

seg-c7d1bccd4d51 = Niedopasowanie polaryzacji

seg-f4aaea269382 = współczynnik strat polaryzacyjnych z osiowych współczynników elipsy i kierunków skrętu, uśredniony po orientacji elipsy

seg-96601850a9d5 = Temperatura szumowa systemu

seg-82735c7f3ea5 = poziom bazowy anteny + emisja nieba na drodze pochłaniającej ({ "275" } K) + kosmiczne { "2.7" } K + odbiornik <c1/>

seg-53ce973b0ee7 = C/N0 (stosunek nośnej do gęstości szumu)

seg-fa01d060cf1a = Jonosferyczne opóźnienie grupowe

seg-33f2113dea70 = <c1/>, STEC (całkowita zawartość elektronów wzdłuż drogi sygnału) z modelu Klobuchar lub pionowa całkowita zawartość elektronów (TEC), skalowana ułamkiem warstwy Chapmana poniżej satelity

seg-431dfeb5edba = skalowanie VALIDATED, TEC MODELLED

seg-56df31449434 = Dla każdej pary pasm: współczynniki wolne od jonosfery, wzmocnienie szumu <c1/> oraz termiczny szum kodu każdego pasma i kombinacji w szczycie przejścia. Porównanie z GNSS na MEO używa tej samej anteny użytkownika i tego samego odbiornika, z minimalną mocą odbieraną każdego sygnału z dokumentu interfejsu (Galileo Open Service Signal-in-Space Interface Control Document, OS SIS ICD, wydanie { "2.1" } tabela { "12" }; GPS z IS-GPS-200 i IS-GPS-705), plus podany nadmiar, skalowaną odległością. Opcjonalna sekcja <c2/> (Internet rzeczy) podaje czas do pierwszego rozwiązania, energię na rozwiązanie i czas pracy baterii względem cyklu pracy dla podanego budżetu mocy odbiornika (MODELLED, każde założenie jest wejściem i jest wymienione w raporcie).

seg-7132ede02109 = <c1/> (domyślnie): orbita kołowa ustawiona tak, aby użytkownik widział jedno przejście o wybranej maksymalnej elewacji w wybranym czasie, wstępujące lub zstępujące, na wschód lub na zachód od użytkownika; nachylenie może być heliosynchroniczne.

seg-688307acbf0d = <c1/>: jawne elementy keplerowskie.

seg-e9085739bcb8 = <c1/>: dwuwierszowy zestaw elementów (TLE) przez propagator Simplified General Perturbations { "4" } (SGP4) silnika.

seg-7dcc5fdbc249 = <c1/>: konstelacja Walkera zbudowana przez kod <c2/> (jego <c3/> lub powłoki gotowego ustawienia); raportowane są najwyższe przejścia w oknie.

seg-ec7e163dd073 = Pasma i projekty sygnałów

seg-4d49743b3544 = Pasma: <c1/> z opcjonalnym podzbiorem <c2/> oraz wpisy <c3/>, które dodają pasmo lub zastępują dowolne pole pasma z gotowego ustawienia. <c4/> z samymi wpisami <c5/> w ogóle nie używa gotowego ustawienia.

seg-bd1e114aaea6 = Pasmo może też wskazywać projekt <c1/> (<c2/>, dowolny projekt w <c3/> lub taki, który przekazuje rodzaj <c4/>; zob. <a1>LEO-SIGNAL.md</a1>). Pasmo przyjmuje wtedy częstotliwość środkową projektu (chyba że podano <c5/>), szerokość pasma nadawania i tempo chipów śledzonego składnika, dzieli swoje EIRP między składniki projektu według ich udziałów mocy oraz podaje w każdej epoce C/N0 śledzonego składnika i jego ograniczone pasmem drgania śledzenia kodu wczesny-późny (Betz i Kolodziejski { "2009" }, wzór rodzaju <c6/>) jako błąd pomiaru odległości.

seg-1d96501bb12d = Każde gotowe ustawienie oznacza swoje liczby jako PUBLIC (z adresem URL), REPRESENTATIVE (udokumentowany wybór projektowy, nigdy twierdzenie o rzeczywistym systemie) lub WORKSHOP.

seg-f708914fed48 = Pasma

seg-6459abcaeebe = <c1/> (domyślnie)

seg-a0dab2ebeb1b = REPRESENTATIVE; nośne L, S i C z dokumentów publicznych

seg-cd0075385395 = UHF { "450" } MHz (reprezentatywne), L { "1191.795" } MHz (środek Galileo E5), S { "2492.028" } MHz (NavIC S, nośna pasma S indyjskiej konstelacji nawigacyjnej Navigation with Indian Constellation), C { "5020" } MHz (środek przydziału RNSS (służba nawigacji radiowej przez satelity) { "5010" }–{ "5030" } MHz), każde { "0" } dBW

seg-3f0de4312fcb = { "550" } km heliosynchroniczna, Walker 240/12/1

seg-486f17197d4d = REPRESENTATIVE, dla systemów pasma C, których parametry nie są publiczne (na przykład TrustPoint)

seg-f6696b70591c = C { "5020" } MHz, BPSK({ "10" }) (kluczowanie fazy dwustanowe z { "10" } × { "1.023" } Mchip/s), izoflux

seg-4ae6741795f9 = PUBLIC, <a1>arXiv { "2509.19551" }</a1>, tabele { "1" }–{ "2" }

seg-a1be637cda63 = X1 { "1593.3225" } MHz, X5 { "1190.51625" } MHz; EIRP z opublikowanej minimalnej mocy odbieranej przy { "10" }°

seg-cb74283148d7 = { "1080" } km, { "53" }° ({ "192" }) i { "97" }° ({ "66" })

seg-5ae1331b91f8 = PUBLIC, <a1>Resilient Navigation and Timing Foundation (RNTF)</a1> i opublikowana orbita

seg-c995dade5aa6 = Satellite Time and Location (STL) przy { "1621" } MHz (środek { "1616" }–{ "1626" } MHz); EIRP z „{ "300" } razy GPS”

seg-dd6322466888 = { "781" } km, { "86.4" }°, { "66" } w { "6" } płaszczyznach

seg-ad0ba129439b = sygnał: wartości PUBLIC (<a1>NAVIGATION { "72" }({ "1" })</a1>), orbita i EIRP REPRESENTATIVE

seg-1931203a036c = radiolatarnia Ku { "240" } MHz, tylko Doppler

seg-0533710bbbe1 = struktura sygnału PUBLIC (<a1>PMC10301026</a1>), orbita i EIRP REPRESENTATIVE

seg-cee286338f01 = BPSK { "2.046" } Mchip/s w pobliżu L1 i L5

seg-fe3cdce92b31 = { "1000" } km, { "55" }°

seg-03d5ae448705 = <c1/> (opcjonalnie)

seg-800f173f2b20 = parametry sygnału WORKSHOP, orbita PUBLIC

seg-e8626249e708 = siedem pasm konfiguracji #1

seg-cb29553176c7 = { "510" } km heliosynchroniczna

seg-10f79909a5bc = <b>Gotowe ustawienie Celeste IOD (demonstracja na orbicie) jest opcjonalne.</b> Jego parametry sygnału przedstawiono na warsztatach LEO-PNT programu European Space Agency (ESA) Navigation Innovation and Support Programme (NAVISP), { "2026" }, i nie mają jeszcze publicznego źródła; znajdują się w module <c1/> w <c2/>, używanym przez <c3/>. Jak to ustawienie jest wyłączane: każda liczba silnika pochodząca z warsztatów mieści się w jednym pliku, <c4/>, który <c5/> kompiluje tylko wtedy, gdy istnieje, oraz w scenariuszach dostępnych tylko w repozytorium <c6/>. Usunięcie tego pliku i tych scenariuszy wyłącza gotowe ustawienie bez zmian w kodzie źródłowym; każdy inny test, każda wyrocznia i każdy scenariusz działają bez niego, a liczba plików scenariuszy w README nadal liczy pliki wyłączone. Jego EIRP i wiązka są skalibrowane do przebiegu C/N0 pokazanego na warsztatach, więc ten scenariusz odtwarza ten przebieg z konstrukcji.

seg-9f9ff4fe18f8 = Model rozgłaszanych efemeryd z wielomianem „zerowego zegara” ATOMIC jest gotowym ustawieniem komunikatu nawigacyjnego i nie należy do tego rodzaju.

seg-dc496b16046b = Obserwacja LEO w porównaniu z GNSS

seg-6be559b1ac29 = <c1/> odtwarza jakościowo to, co pokazują demonstracje LEO-PNT: C/N0 dla LEO rośnie i opada w kształcie dzwonu, który pozostaje nad maską przez { "590" } s i osiąga szczyt { "56.8" } dB-Hz, { "8.9" } dB powyżej mediany płaskich nośnych GNSS na MEO (Galileo E1, od { "40.5" } do { "52.0" } dB-Hz, mediana { "47.8" } dB-Hz). Zysk wynika z odległości, a nie z mocniejszego nadajnika: w szczycie przejścia satelita jest oddalony o { "569" } km, około { "40" } razy bliżej niż satelita Galileo w zenicie ({ "23 222" } km), co daje o { "32" } dB mniejsze tłumienie w wolnej przestrzeni; ogólne gotowe ustawienie promieniuje { "0" } dBW ({ "1" } W).

seg-08debab7c94a = Każdy wiersz to jeden przebieg <c1/> (silnik { $version }):

seg-9a60f0bf803e = Ustawienie

seg-fde146239f5d = Wynik jednego przebiegu

seg-41455a3f15b6 = <c1/> pasmo L, { "550" } km, przejście pod kątem { "80" }° nad Monachium

seg-9d5c154eceb1 = szczyt L { "56.8" } dB-Hz, mediana { "42.2" } dB-Hz; mediana Galileo E1 { "47.8" } dB-Hz

seg-9423b1184fb0 = <c1/>, zaprojektowane przejście { "70" }° i cztery satelity w pochylonej powłoce, użytkownik morski

seg-63bf0b8f7f3a = szczyt X1 { "65.6" } dB-Hz i X5 { "68.9" } dB-Hz na zaprojektowanym przejściu; największy Doppler X1 { "31.4" } kHz

seg-8a3383072765 = <c1/>, przejście { "65" }°, użytkownik w powietrzu

seg-d2fea8542638 = szczyt STL { "80.5" } dB-Hz, { "34.3" } dB powyżej mediany GPS L1; największy Doppler { "35.4" } kHz

seg-d837a8a7648b = <c1/>, użytkownik wewnątrz budynku w Rzymie (budynek tradycyjny)

seg-4fbead0588d2 = szczyt UHF { "34.1" }, L { "24.2" }, S { "16.5" }, C { "8.5" } dB-Hz; mediana Galileo E1 { "22.4" } dB-Hz

seg-954e16842d59 = <c1/> UHF i L z sekcją <c2/>

seg-9aa81f6f4929 = szybki start { "0.90" } s i { "18.0" } mJ dla każdego sygnału; zimny start UHF { "19.0" } s ({ "381" } mJ), L { "47.0" } s ({ "939" } mJ), GPS L1 { "38.1" } s ({ "762" } mJ)

seg-97476f9d4212 = <c1/>, cztery pasma, przejście { "70" }° nad Tromsø

seg-fd1463da9965 = zob. <a1>Sondowanie jonosfery</a1>

seg-1ad5bde12b4f = { "16" } satelitów ogólnej warstwy { "1080" } km, L i C, skok { "30" } m

seg-25cf36cf0de3 = zob. <a1>Monitory spoofingu</a1>

seg-6cdf9830433e = <c1/> zapisuje też interaktywny odtwarzacz (<c2/>, epoki przejścia) oraz pliki efemeryd CZML (Cesium Language), KML (Keyhole Markup Language), GeoJSON i STK (Systems Tool Kit) z geometrią przejścia (<a1>ANIMATION.md</a1>, <a2>INTEROP.md</a2>).

seg-d3a0fc36329a = Sondowanie jonosfery

seg-1e64715af2ff = Każda para pasm daje też ukośne TEC odzyskane z kombinacji kodowej wolnej od geometrii w szczycie przejścia, <c1/>, oraz 1-sigma tego oszacowania z szumu kodu obu pasm w szczycie (<c2/>, <c3/>). Oszacowanie jest równe ukośnemu TEC modelu z konstrukcji: kombinacja jest dokładna w pierwszym rzędzie. Sigma decyduje o tym, czy plan pasm jest lepszym, czy gorszym sondą: <c4/> (cztery pasma nad Tromsø) odzyskuje { "18.85" } jednostek TEC z każdej pary, z 1-sigma równą { "0.017" } jednostki TEC dla UHF z L i { "2.9" } dla S z C. Tylko termiczny szum kodu; bez wielodrogowości i bez błędu międzyczęstotliwościowego. MODELLED.

seg-8f59acefb2b3 = Monitory spoofingu (<c1/>)

seg-91941393400a = Opcjonalna sekcja <c1/> podrabia sygnały, które odbiornik widziałby w deklarowanym położeniu. Od <c2/> deklarowane położenie skacze o <c3/>, a następnie przesuwa się poziomo z prędkością <c4/> w kierunku <c5/>; podrobiona odległość i prędkość zmiany odległości są dokładnie takie jak dla deklarowanego położenia, w pasmach LEO wymienionych w <c6/> (domyślnie wszystkie) oraz w sygnale GNSS na MEO, chyba że <c7/>. <c8/> określa, czy podrobione pseudoodległości niosą opóźnienie jonosferyczne (nadajnik naziemny go nie wnosi).

seg-845f6840d92d = Odbiornik uruchamia dwa monitory (<a1><c1/></a1>), każdy przy podanym prawdopodobieństwie fałszywego alarmu na epokę (<c2/>, domyślnie { "1e-5" }) i ogłasza detekcję w pierwszej epoce, w której jego prawdopodobieństwo detekcji osiąga <c3/> (domyślnie { "0.999" }). Prawdopodobieństwa detekcji są dokładne dla podanego szumu gaussowskiego, wyznaczone na wolnej od szumu średniej reszcie; żaden szum nie jest losowany.

seg-cc38b40eb7a5 = Monitor

seg-8b34ac584c3d = Statystyka

seg-7b158594c4d9 = Co widzi

seg-89756d80bc29 = Spójność Dopplera i geometrii przejścia

seg-2174c7725e48 = zmierzone prędkości zmiany odległości wobec przewidzianych z orbit oraz niezależnej wcześniejszej pozycji i prędkości (<c1/>, <c2/>); uogólniony chi-kwadrat metody najmniejszych kwadratów w oknie <c3/> (domyślnie jeden krok), z dryfem zegara jako parametrem zakłócającym (lub podanym przez <c4/>); szum pętli synchronizacji częstotliwości z C/N0 (Kaplan & Hegarty { "2006" }, § { "5.6.2" }), dla kanałów GNSS, kanałów LEO i wszystkich kanałów

seg-14eab06a47d5 = błąd pozycji <c1/> zmienia prędkość zmiany odległości o <c2/>, <c3/>: prędkość poprzeczna satelity LEO podzielona przez jego odległość jest około { "25" } razy większa niż satelity MEO, więc ten sam błąd jest około { "25" } razy większy w Dopplerze LEO

seg-390ac49b3c09 = Spójność między pasmami

seg-986d501c2b01 = krok od epoki do epoki kombinacji pseudoodległości wolnej od geometrii dla każdej pary pasm LEO, po usunięciu modelu jonosfery odbiornika, wobec szumu kodu <c1/> i tolerowanego niemodelowanego tempa zmian jonosfery (<c2/>)

seg-389187df55d7 = spoofer, który podrabia niektóre pasma, a inne nie, albo każde pasmo bez jonosfery, w chwili rozpoczęcia; nie taki, który podrabia każde pasmo i symuluje jonosferę

seg-4dd44d7fa566 = <c1/>: skok o { "30" } m w zinwentaryzowanym miejscu we Frankfurcie zmienia prędkości zmiany odległości GNSS o około { "4" } mm/s, a LEO o około { "10" } cm/s (mediany gradientów { "1.4e-4" } i { "3.5e-3" } na sekundę). Test tylko GNSS nigdy go nie wykrywa (największa niecentralność { "0.06" }); test na wszystkich kanałach wykrywa go { "105" } s po rozpoczęciu. <c2/> uruchamia czterech spooferów wobec obu monitorów.

seg-1b64098e01f3 = Ograniczenia, podawane w każdym wyniku: spoofer to wyidealizowane, wewnętrznie spójne przesunięcie pozycji, które kompensuje własną drogę (bez sygnatury mocy, kąta przybycia ani piku korelacji); wcześniejsza pozycja jest niezależna od sfałszowanych rozwiązań; model jonosfery odbiornika jest modelem silnika, więc autentyczna reszta między pasmami ma średnią zero. MODELLED (dwa wiersze w <a1>VERIFICATION-MATRIX.md</a1>).

seg-edb7b16b6c0e = Walidacja

seg-051b8cd1849d = Test

seg-609c537a9dfd = ITU-R P.838-3 tabela { "5" }, { "115" } częstotliwości

seg-5bf24bec38f2 = każdy współczynnik w granicach { "0.6" } ostatniej wydrukowanej cyfry (najgorszy zaobserwowany { "0.51" })

seg-86204b023d44 = przykłady walidacyjne ITU-R Study Group { "3" } (CG-3M3J-13-ValEx-Rev8.3.0), deszcz wg P.618-14

seg-13180d4097d1 = { "56" } przypadków w granicach { "1e-4" } dB (zaobserwowano { "5e-6" } dB)

seg-84161e5f97f8 = Te same przykłady, scyntylacja wg P.618-14

seg-0a4305c867ff = { "42" } przypadków w granicach { "1e-5" } dB

seg-054f8dbe2792 = skoroszyt ITU-R Study Group { "3" } Clutter and BEL, P.2109

seg-8ae2eeed4be4 = { "568" } wartości w granicach { "0.001" } dB

seg-6df2eded9f19 = stosunek opóźnień grupowych z IS-GPS-200 <c1/>

seg-d0b293230f91 = z dokładnością { "1e-12" }; wzmocnienie L1/L2 i L1/L5 { "2.978" } i { "2.588" }

seg-f9a0e24c00a7 = postać Friisa kilometr–megaherc

seg-4e94a67f40f6 = z dokładnością { "1e-4" } dB

seg-ee59b4c520eb = arXiv { "2509.19551" } tabela { "1" } (Pulsar weryfikacja w locie (IOV), pełna zdolność operacyjna (FOC) polarna, FOC pochylona, GPS)

seg-345998ca457c = { "20" } prędkości i maksimów Dopplera w granicach { "0.05" } %

seg-30e34076f4a7 = Wyrocznie dla deszczu i scyntylacji przyjmują wysokość deszczu i wilgotną refrakcyjność takie, jakie podają przykłady walidacyjne: silnik nie zawiera ani mapy ITU-R P.839, ani P.453.

seg-d2d1075a0b67 = EIRP i charakterystyki to opublikowane moce odbierane przeliczone na EIRP albo wybory reprezentatywne; nie używa się zmierzonej charakterystyki żadnego satelity i żadne C/N0 dla LEO nie jest porównywane z pomiarem.

seg-915a9564608d = Człon gazowy to zastąpiona uproszczona metoda P.676-10; poniżej { "1" } GHz jest to wartość dla { "1" } GHz przeskalowana przez f², a deszcz przyjmuje się tam jako zero.

seg-cdd9faf5b61d = Ułamek TEC poniżej satelity LEO pochodzi z pojedynczej warstwy Chapmana (bez plazmosfery) i można go zastąpić podanym ułamkiem.

seg-4b72218497e7 = Orbity zaprojektowanego przejścia i Walkera to orbity dwóch ciał z opcjonalnym wiekowym J2 (drugą harmoniczną zonalną Ziemi); ścieżka TLE używa SGP4. Własne przyspieszenie użytkownika jest pominięte w postaci zamkniętej tempa zmiany Dopplera (kontrola numeryczna podaje, ile to kosztuje dla poruszającego się użytkownika).

seg-9fc2cd6d38e9 = RINEX (Receiver Independent Exchange Format) { "4.02" } nie ma rekordów nawigacyjnych LEO; każdy eksport LEO w stylu RINEX należy do kodu komunikatu nawigacyjnego i jest udokumentowanym rozszerzeniem Kshana (wcześniejsze prace: arXiv { "2401.17767" }).

seg-593081243d8c = <s1>Poprzednia</s1>Projekty sygnałów LEO

seg-468e70f9a669 = <s1>Następna</s1>Komunikat nawigacyjny LEO

seg-072d0d8f618c = Monitory spoofingu ([spoofer])
