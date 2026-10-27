# docs--capability-reference: translations (pl)

seg-aab745a65e76 = Moduł

seg-f4f59f19e091 = Karty możliwości

seg-501d3a72ea43 = Integralność

seg-20db2c79b998 = Sprawdzone względem niezależnego wzorca

seg-29e58493fdd4 = Obliczone z modelu

seg-298cc35fe9d1 = Inercyjne

seg-b03984610dc0 = Księżycowe

seg-f1f903f1b9ff = Odporność

seg-bd64cfb4dc52 = Propagacja orbit i projektowanie konstelacji

seg-a7cfe6f135f1 = Orbita i geometria

seg-3060564c3e21 = 666/666 wektorów AIAA · { "4.12" } mm

seg-5b265eaf8f29 = Propagacja SGP4/SDP4 z rzeczywistych elementów dwuwierszowych (zatwierdzona migawka GPS z Celestrak) lub syntetycznych konstelacji Walkera, których średnie elementy realizują wzór i:T/P/F z dokładnością poniżej { "1" } km w ciągu { "24" } h. Widoczność wielu konstelacji, rozmycie dokładności i dostępność GNSS, optymalizator projektu konstelacji, wymiarowanie pasów pokrycia oraz przegląd projektów Walkera, który podaje projekty optymalne w sensie Pareto na siatce płaszczyzn × satelitów.

seg-66e33b899daf = Propagator Cowella i model sił z sześcioma zaburzeniami

seg-a5a572db3bed = Propagator numeryczny

seg-52a4410a54da = zachowawcze poziomy < { "0.08" } m / { "24" } h względem Orekit { "12.2" }

seg-463ed85c6e40 = Numeryczny propagator (Cowella) uzupełniający analityczną ścieżkę SGP4/SDP4, z hierarchicznym modelem sił: dwa ciała + pełne pole zonalne J2–J6, opcjonalny tesseralny geopotencjał EGM2008 do stopnia/rzędu { "70" }, grawitacja Słońca i Księżyca jako trzeciego ciała zależna od epoki (wbudowane efemerydy, bez jądra DE/SPK), ciśnienie promieniowania słonecznego ze stożkowym cieniem i półcieniem, opór atmosferyczny, postnewtonowska poprawka relatywistyczna Schwarzschilda oraz człon wleczenia układów Lensego–Thirringa — napędzany do wyboru całkowaniami adaptacyjnymi RK4 z podwajaniem kroku lub Dormanda–Prince'a RK5({ "4" }).

seg-797370a2faef = Manewry, Lambert i porkchop

seg-57b120fb0aac = Manewry i projektowanie trajektorii

seg-5081c84dfdd7 = Ciołkowski < { "0.01" } % · Lambert zgodny z rozwiązaniem dla dwóch ciał

seg-da6b16ebd59b = Impulsowe węzły ΔV z propagacją kowariancji { "6" }×{ "6" }, całkowanie skończonego manewru sprawdzone względem równania rakietowego Ciołkowskiego z dokładnością poniżej { "0.01" } %, rozwiązywacz Lamberta Izzo-2015 dla jednego obiegu i dokładny propagator Keplera w zmiennych uniwersalnych oraz przegląd porkchop (start × przylot) C3 / V∞ przylotu zapisany jako siatka konturów JSON — warstwa symulacji wydajności nad GMAT/Orekit.

seg-831552a45712 = Skale czasu i układy orientacji Ziemi

seg-76b323512350 = Systemy czasu

seg-60208bd726eb = bit w bit względem SOFA/ERFA · Vallado od końca do końca { "4" } mm

seg-42373dd9ca64 = Skale IERS z sekundami przestępnymi UTC / TAI / TT / UT1, API dat juliańskich, kąt obrotu Ziemi IAU-2000, układy TEME ↔ ECEF oparte na GMST i geodezyjne WGS-84, pełna nutacja IAU 2000A/2000B i precesja IAU { "2006" } oraz wolna od równonocy redukcja GCRS↔ITRS IAU 2006/2000A oparta na CIO z ruchem bieguna IERS — sprawdzone bit w bit względem niezależnego wzorca, czyli wektorów SOFA/ERFA, oraz niezależnie skrzyżowane z ANISE (czysty Rust SPICE): GCRS→ITRS względem ANISE ITRF93, te same IERS EOP, zgodne do ≤ { "0.86" } m na ziemi / ≤ { "3.6" } m na orbicie GNSS.

seg-dd766880e73a = Predykcja orientacji Ziemi w czasie rzeczywistym

seg-54169bca19e9 = { "12" } horyzontów predykcji względem zarchiwizowanego Bulletin A: UT1 { "2.93" } ms, ruch bieguna { "1.76" } mas

seg-81be07e41d1c = Predyktor orientacji Ziemi w stylu operacyjnym — metoda najmniejszych kwadratów po obciążeniu, tempie i głównych składowych okresowych w oknie wstecznym — mierzony względem rzeczywiście zarchiwizowanych predykcji Bulletin A, a nie względem persystencji. Domyślnym wejściem offline jest rzeczywisty produkt IERS finals2000A z wierszami predykcji Bulletin A, więc goły przebieg zapisuje wypełnioną tabelę dla każdego horyzontu, a nie pustą. UT1 i ruch bieguna są podawane na wspólnym zbiorze wierszy razem z ich kombinacją, więc wspólna wartość jest jedną statystyką, a nie sumą kwadraturową dwóch różnych próbek.

seg-0e18bc4add10 = Bezkardanowy INS i nawigacja wspomagana mapą

seg-26561c9a96a7 = akcelerometr CAI z pierwszych zasad · wyprowadzone VRW skrzyżowane z niezależnym integratorem

seg-d18714ee32fb = Trójosiowy bezkardanowy INS — orientacja kwaternionowa, mechanizacja WGS-84 NED, kompensacja coning/sculling i pełny deterministyczny model błędów IMU — plus akcelerometr z interferometrem zimnych atomów z pierwszych zasad (faza Macha–Zehndera, szum projekcji, zanik kontrastu, sprzężenie drgań) oraz filtr cząsteczkowy do nawigacji bez GPS z odniesieniem do terenu i grawitacji.

seg-0e44bdf12d16 = Lot inercyjny i z odniesieniem do terenu przez przerwę

seg-07cb40aa5cd1 = { "10" } m po { "249" } s, { "50" } m po { "595" } s, w obu przypadkach dominuje błąd systematyczny akcelerometru

seg-d5df17e4425b = Błąd pozycji względem czasu trwania lotu z budżetu błędów IMU — błąd systematyczny, błądzenie losowe i współczynnik skali, każdy z własnym prawem narastania i własnym udziałem w przekroczeniu — więc koszt przerwy w nawigacji jest obliczoną krzywą, a nie przeglądaną szybkością dryfu. Przekroczenia progów są wynikiem silnika z nazwanym dominującym udziałem przy każdym z nich, dla czterech klas IMU, a interwał poprawek terenowych jest oceniany w osobnym bloku, więc główne przekroczenia pozostają niewspomagane.

seg-6631a5d69c84 = Dopasowanie do map grawitacyjnych, terenowych i magnetycznych

seg-6af8e99df46d = Alt-PNT (bez GPS)

seg-72527f4459c7 = 60 min bez GPS · ~{ "145" } m (< { "500" } m)

seg-89bd5fb3e90b = Model pomiaru grawimetru z zimnych atomów, którego próg szumu białego jest wyprowadzony z fizyki akcelerometru CAI, pole anomalii grawitacyjnych w pełni znormalizowanych harmonik sferycznych niskiego stopnia plus syntetyczne maskony oraz filtr cząsteczkowy dopasowania do mapy grawitacyjnej — rozszerzony na nawigację z odniesieniem do terenu względem numerycznego modelu wysokości SRTM (TERCOM/SITAN), główne pole geomagnetyczne IGRF-14 do stopnia/rzędu { "13" } oraz połączony nawigator grawitacyjny + magnetyczny + terenowy, który łączy wszystkie trzy kanały skalarne. 60-minutowy benchmark bez GPS — przerwa trwająca godzinę na dystansie ~{ "700" } km, w której rozwiązanie inercyjne dryfuje do ~{ "70" } km — jest odzyskiwany do ~{ "145" } m przez hierarchiczny dopasowywacz od zgrubnego do dokładnego: cel ESA NAVISP Quantum Wayfarer.

seg-dbd63be796ff = Fuzja czujników GNSS / INS

seg-f9582184adea = Fuzja

seg-f2166e96405f = ściśle sprzężony UKF · { "0.77" } m RMS

seg-d6ad19d1d47b = 15-stanowy EKF stanu błędu, który przechodzi przez przerwy w GNSS na skalibrowanym rozwiązaniu inercyjnym; ściśle sprzężony tryb pseudoodległości, który nadal koryguje przy mniej niż czterech satelitach; sprzężony filtr zegara i pozycji; ogólny estymator Kalmana bezśladowy (z punktami sigma); ściśle sprzężony nawigator UKF GNSS/INS sprawdzony względem niezależnego wzorca do { "0.77" } m RMS podczas przerwy { "120" } s na zakrzywionym przelocie LEO; oraz pełny 17-stanowy ściśle sprzężony UKF GNSS/INS, którego kwantowe liczenie zliczeniowe CAI przechodzi przez przerwę na wyprowadzonym błądzeniu losowym prędkości akcelerometru z zimnych atomów.

seg-4af862bd1307 = Wsadowe i sekwencyjne OD

seg-ca67c864635c = Wyznaczanie orbity

seg-948441304a32 = wsadowe + sekwencyjne OD względem Orekit { "12.2" } BatchLSEstimator/KalmanEstimator

seg-22e738b2ab57 = Odtworzenie stanu orbitalnego ze śledzenia odległości ze stacji naziemnej, z modelem sił dwóch ciał + J2 i integratorem RK4 w połączeniu z wsadowym korektorem różniczkowym Gaussa–Newtona (poniżej metra / mm·s⁻¹ z bezszumowych odległości, ~{ "2" } m przy progu szumu { "5" } m) oraz wariant z filtrem bezśladowym sekwencyjnym.

seg-06406b3d0b88 = Informacja Fishera i obserwowalność

seg-4e28248ef77b = Obserwowalność i teoria estymacji

seg-a5b38d0a8d64 = wartości własne względem numpy.linalg.eigh · CRLB względem σ²(XᵀX)⁻¹ przez numpy.linalg.inv · DOP GNSS z macierzy informacyjnej, wszystko do { "1e-9" } · postaci zamknięte Kaya ({ "1993" }) + osiąganie CRLB metodą Monte Carlo

seg-3ee5597d6f8a = Ogólna, wielokrotnego użytku warstwa informacji Fishera / Cramera–Rao (src/fim.rs): macierz informacyjna M = HᵀWH, dolne ograniczenie Cramera–Rao, rząd obserwowalności i przestrzeń zerowa defektu datum (pseudoodwrotność Moore'a–Penrose'a) oraz skalary optymalnego projektu eksperymentu D/A/E/T z symetrycznego solwera wartości własnych Jacobiego. Stanowi podstawę silnika DOP, ograniczenia geolokalizacji biernej oraz wyniku obserwowalności bezwzględnej stacji księżycowej — pomiary wewnętrzne zostawiają sześciostopniowy defekt datum bryły sztywnej, który wiąże VLBI z bazą ziemską dla rzadkiej konstelacji i wyostrza dla bogatej, przy czym bezwzględne datum zamyka się przy trzech niewspółliniowych stacjach ziemskich.

seg-ed467622dbd0 = Propagacja CR3BP i integralność LunaNet

seg-e386dced1d16 = Księżycowe i cislunarne

seg-f444bc39efbe = Odtwarza opublikowaną NRHO L2 { "9" }:{ "2" } (okres ~{ "6.57" } d · perylun ~{ "3,250" } km); STM sprawdzone względem różnic skończonych

seg-272afbca5e48 = Propagator kołowego ograniczonego problemu trzech ciał Ziemia–Księżyc (CR3BP) w układzie obracającym się — zachowana stała Jacobiego i wszystkie pięć punktów Lagrange'a — z macierzą przejścia stanu { "6" }×{ "6" } i jednostrzałowym korektorem różniczkowym, który wytwarza naprawdę okresowe orbity halo / prawie prostoliniowe orbity halo (NRHO): odtwarza opublikowaną południową NRHO L2 { "9" }:{ "2" } (orbitę Gateway) z okresem ~{ "6.57" } dnia i perylunem ~{ "3,250" } km. Do tego geometria cislunarnego PNT LunaNet / LNIS (redukcja MCI↔MCMF, współrzędne selenograficzne) z przelotem ARAIM przy księżycowym biegunie południowym, który wprost ujawnia lukę integralności: σ_URE rzędu ~{ "30" } m podnosi poziom ochrony znacznie powyżej limitu alarmowego { "50" } m.

seg-619f89bf160c = Realizacja księżycowego układu odniesienia

seg-c6b12768a219 = względem numpy/scipy Umeyama–Horn SVD

seg-29327b86ea27 = Realizuje księżycowy układ związany z ciałem z kampanii obserwacyjnej: ważone dopasowanie podobieństwa Gaussa–Newtona po geometrii stacja–reflektor, podające datum, jego kowariancję i oś wyznaczoną najgorzej. Sprzężona miara układu i skali czasu jest niesiona jawnie, a nie wchłaniana, więc niedobór rzędu jest widoczny w raporcie, a nie pogrzebany w pseudoodwrotności.

seg-b3ba1e7b197d = Objętość usługi nawigacji księżycowej i ARAIM

seg-353878596468 = orbity ANISE { "0.10.2" } · RTKLIB 2.4.2-p13

seg-70b9c02c1f6a = Przegląda ilustracyjną konstelację klasy Moonlight/LCNS po siatce selenograficznej: widoczność, rozmycie dokładności, pokrycie i poziomy ochrony ARAIM w każdej epoce względem konfigurowalnego limitu alarmowego. Dokładność pomiaru odległości sygnału w przestrzeni jest parametrem, więc przegląd odpowiada na wymaganie dla pomiaru odległości w całej objętości, a nie na zaliczenie lub niezaliczenie przy jednej ustalonej wartości.

seg-a94db5b03c9c = Budżet interoperacyjności księżycowej między dostawcami

seg-a2e8a8dfd666 = DE440 · INPOP21a · EPM2021 przez calceph

seg-646a00230694 = Mierzy, jak bardzo trzy niezależne miarodajne efemerydy księżycowe faktycznie się różnią, i zamienia to w prawo projektowe: budżet błędu układu względem efemeryd, który dziedziczy użytkownik z mieszanymi dostawcami, oraz tolerancję spójności, jaką musi utrzymać dostawca, aby ten budżet zmieścił się w podanej granicy.

seg-0f359c118090 = Obserwowalność usterek w autonomicznej sieci swobodnej

seg-ae99396c03bd = względem niezależnej algebry parytetu numpy/scipy

seg-51828c93731b = Algebra liniowa, której potrzebuje samoodniesieniowa konstelacja księżycowa, aby wykrywać własne usterki bez wzorca prawdy: ważony rzutnik parytetu w postaci pseudoodwrotności o niepełnym rzędzie, która przetrwa miarę datum i skali czasu, wykrywalność dla każdego węzła, minimalne wykrywalne obciążenie Baardy oraz liczby detekcji/identyfikacji bizantyjskich iskier blokowych na rzeczywistej geometrii DE440 między węzłami.

seg-65d239fc4894 = Księżycowy punkt odniesienia układu na podstawie rzeczywistych pomiarów laserowych

seg-c92dd319fa36 = { "337" } punktów normalnych ILRS · mediana { "5.13" } mm

seg-2f7f950518be = Zastępuje symulowaną kampanię rzeczywistymi danymi: { "337" } zarchiwizowanych punktów normalnych ILRS z laserowych pomiarów odległości do Księżyca, z pięciu układów retroreflektorów; każda obserwacja jest ważona własną precyzją zapisaną w pliku. Współrzędne reflektorów pochodzą z katalogu DE440 w układzie osi głównych, przechowywanego pod własną nazwą pliku, odrębnie od tablicy DE430 w układzie średniej Ziemi — podanie jednego do rotacji drugiego przesuwa reflektor o setki metrów i nic tego nie wykrywa, ponieważ obie tablice zawierają poprawnie sformułowane współrzędne.

seg-2db69c58f694 = Księżycowy różnicowy PNT

seg-32adcb9b1b02 = Dokładna tożsamość składowej wspólnej · modelowana dekorelacja

seg-d4ac8cbac83e = Poprawki różnicowe między księżycową stacją referencyjną a użytkownikiem. Zniesienie składowej wspólnej jest dokładną tożsamością; residuum dekorelacji przestrzennej jest geometrycznym modelem pierwszego rzędu, który rośnie wraz z długością bazy, a budżet residuum łącza korekcji jest podawany obok niego, aby człon ograniczający pozostawał widoczny, zamiast być wchłonięty w jedną liczbę.

seg-9b83e78dcd7b = Skale czasu na Księżycu i geodezyjny VLBI

seg-bcd769beab07 = Tabela czasów przecięcia dla klas zegarów

seg-80107b7841bf = Czasy przecięcia dla klas zegarów w księżycowej skali czasu — kiedy dana klasa oscylatorów przestaje spełniać podany limit bez aktualizacji — wraz z księżycową geodezyjną obserwablą VLBI i informacją Fishera, jaką wnosi ona do układu odniesienia.

seg-99084680c321 = Rzeczywista, pobrana geometria konstelacji księżycowych

seg-a7be7d68e767 = { "5" } zatwierdzonych zestawów danych, każdy możliwy do ponownego wygenerowania z zapisanego źródła

seg-d3591b4b4633 = Wolumen usługi działa na opublikowanych projektach konstelacji zamiast na ilustracyjnym: pięciosatelitarny referencyjny zestaw demonstracji interoperacyjności LANS, studia przypadków LNCSS dla { "8" }, { "12" } i { "16" } satelitów oraz cztery statki kosmiczne faktycznie znajdujące się na orbicie księżycowej 2023-01-01, według JPL Horizons. Każdy plik podaje własny układ odniesienia i własną klasę pochodzenia; horyzont wykraczający poza koniec tabelarycznych efemeryd jest odrzucany, a nie ekstrapolowany, a ilustracyjny wynik keplerowski jest podawany obok pobranego, wraz z różnicą między nimi, i nigdy nie jest nim zastępowany.

seg-807b9fc7b517 = Księżycowy kontur odmowy dostępu na podstawie zmierzonego rozrzutu C/N₀

seg-a908030a9fcc = Odległość zabezpieczenia { "49.2" } km według stosunku mocy wobec { "19.4" } km według utraty synchronizacji

seg-3ee440e8b619 = Stosunek zakłócacza do sygnału dla każdego satelity na rzeczywistych księżycowych odległościach ukośnych, przy czym strona sygnału użytecznego jest zachowana jako rozkład, a nie sprowadzona do mediany, tak aby kontur odmowy dostępu niósł pasmo niepewności, jakie faktycznie wytwarza geometria przekaźnika. Podawane są obok siebie dwa kryteria: próg stosunku mocy oraz utrata synchronizacji obliczona z dynamiki pętli śledzenia. Zasięg przechwycenia orbitalnego jest przeglądany względem wysokości nadajnika i szerokości wiązki, a tam, gdzie siatka nigdy nie sięga przechwycenia na brzegu tarczy, raport mówi o tym i podaje niedobór.

seg-229134190045 = Harmonogram VLBI do kowariancji współrzędnych stacji

seg-547181855481 = Rząd { "6" }, defekt { "0" }; defekt sieci swobodnej { "1" } wskazany jako wspólne przesunięcie

seg-6d147beefb43 = Akumuluje księżycowe pochodne cząstkowe opóźnienia VLBI do macierzy informacji Fishera dla harmonogramu baz i epok oraz zwraca kowariancję współrzędnych stacji, tak aby przejście od precyzji opóźnienia do sigma współrzędnej było szacowane, a nie zakładane. Sieć swobodna jest podawana obok sieci z ustalonym układem odniesienia, z jej defektem rzędu i wskazanym kierunkiem nieobserwowalnym. Kowariancja punktu na powierzchni jest oddzielona od kowariancji stacji ziemskiej, ponieważ pochodna cząstkowa radiolatarni w polu bliskim jest różnicą dwóch wektorów jednostkowych stacji i nie zachowuje się jak w przypadku pola dalekiego.

seg-028833cc45bc = Nawigacja radiometryczna i PNT z przekaźnikami

seg-6c94ae122721 = PNT w przestrzeni kosmicznej i na Marsie

seg-ef21cd4b1962 = Zwalidowane symulacją (kowariancja i wskaźniki jakości w pętli zamkniętej, nie certyfikowane poziomy ochrony); dynamika Marsa z centrum w Słońcu jest porównana krzyżowo z JPL DE440 do { "137" } m @ dla łuku 1-dobowego; OD Mars-LMO ≈ { "0.2" } m.

seg-469988966702 = Otwarty silnik nawigacji radiometrycznej dla przestrzeni kosmicznej i Marsa: iteracyjny czas przebiegu światła z opóźnieniem Shapiro, Doppler i zasięg dwu-, jedno- i trójkierunkowy (Moyer, dwa odcinki), koherentny obrót transpondera, pomiar odległości regeneracyjny/PN oraz Δ-DOR; wejście i wyjście CCSDS-TDM; zredukowany dynamicznie filtr informacyjny pierwiastka kwadratowego (przyspieszenia empiryczne + zegar pokładowy + opór Marsa), który wykonuje wyznaczanie orbity Mars-LMO w syntetycznej pętli zamkniętej; fuzja pomiarów jednokierunkowych i dwukierunkowych; oraz konstelacja przekaźników areostacjonarnych MARCONI z kompleksowym symulatorem wydajności GSE.

seg-b4284bd2629e = Przekazanie optyczne i radiowe z integralnością między modalnościami

seg-ae131bc1ba67 = PNT optyczny / radiowy

seg-1b25468c9780 = Minimalne wykrywalne obciążenie { "8.20" } m w poziomie, { "12.30" } m w pionie, { "24.6" } ns w czasie

seg-a5387333ab2d = Wstrzykiwanie błędów nadaje monitorowi międzymodalnościowemu moc detekcji, zamiast samego zaliczenia bez błędów: minimalne wykrywalne obciążenie dla każdej osi przy podanym budżecie fałszywego alarmu i niewykrytego zdarzenia. Po przekazaniu ponowny wzrost kowariancji jest propagowany względem limitów alarmowych, dzięki czemu raport podaje, jak długo rozwiązanie jednomodalnościowe pozostaje w ich granicach, a nie tylko to, że przekazanie było ciągłe. Optyczne i radiowe odcinki pomiaru odległości są porównywane wyłącznie przy dopasowanym czasie akumulacji i dopasowanej ścieżce, a raport odmawia utworzenia stosunku względem wartości, która została wybrana, a nie zmierzona.

seg-00cb9df27979 = Autonomiczna integralność odbiornika (ARAIM)

seg-f86ecc2fda8e = MHSS na rzeczywistej migawce GPS + Galileo · DO-316 dwukonstelacyjny

seg-841a6f3f0277 = RAIM migawkowy i oparty na separacji rozwiązań, z poziomami ochrony w poziomie i w pionie (HPL/VPL), detekcją i wykluczaniem błędów oraz diagramami integralności Stanforda — a także jawny poziom ochrony z budżetem ryzyka integralności (MHSS) z trybem błędu obejmującym całą konstelację dla konfiguracji dwu- i wielokonstelacyjnych (EU ARAIM / DO-316).

seg-695aa5c57d83 = ARAIM względem opublikowanych wektorów referencyjnych

seg-08f9dd480ba7 = Największy błąd { "0.044" } m wobec własnej tolerancji źródeł { "0.05" } m

seg-68185dd65478 = Poziomy ochrony MHSS silnika są uruchamiane względem opublikowanych przykładów rozwiązanych referencyjnego algorytmu pokładowego Grupy Roboczej C UE–USA, każdy przepisany z adresem URL pobrania, datą, stroną i sumą SHA-256 pliku oraz przechowywany w dwóch miejscach, których zgodność potwierdza test. Wektorem akceptacyjnym jest wewnętrznie spójny Reference Airborne Algorithm Description Document v3.1, Dodatek D. Raport Milestone { "3" } zawiera dwa wewnętrzne defekty — literówkę w znaku w geometrii oraz mnożnik fałszywego alarmu obliczony dla { "57" } trybów błędu, podczas gdy tekst podaje jeden — dlatego jego poziomy ochrony są podawane jako zmierzone rozbieżności, a nie oceniane, a defekty są wykazane przez uruchomienie liczb z samego dokumentu.

seg-17b28b3cf1fa = Poziomy ochrony SBAS / WAAS i dwuczęstotliwościowość

seg-99766b79a00a = Wspomaganie (SBAS)

seg-4cfec990b19b = Współczynniki K z DO-229E · kombinacja bezjonosferyczna L1/L5

seg-ef3a5513bbd8 = Poziomy ochrony SBAS / WAAS w postaci ważonej metody najmniejszych kwadratów z DO-229E (współczynniki K dla podejścia precyzyjnego i lotu po trasie) oraz dwuczęstotliwościowa kombinacja bezjonosferyczna L1/L5 (IS-GPS-705), na której opiera się DO-316, z geometrią poziomów ochrony porównaną krzyżowo z referencyjną implementacją algebry liniowej.

seg-0a5bd5230c32 = Holdover, stabilność oraz transfer czasu i częstotliwości

seg-69a0269c4732 = Zegar i synchronizacja czasu

seg-641ae762b453 = skalibrowane względem kart katalogowych zegarów · holdover porównany krzyżowo z rekursją kowariancji van Loana

seg-6f1c2e1f0bf4 = Dwustanowy holdover filtru Kalmana, stabilność z rodziny Allana (ADEV / MDEV / TDEV / HDEV) z przedziałami ufności i pełnym dopasowaniem potęgowym pięciu współczynników według IEEE-1139, oraz operacyjne metody transferu — TWSTFT z zamkniętą formą Sagnaca BIPM, wspólny widok GNSS, bezjonosferyczny transfer PPP, łącze optyczne w wolnej przestrzeni ze scyntylacją turbulencyjną oraz skala czasu zespołu zegarów ważona odwrotnością wariancji. Kalkulator holdover zegara bez GNSS odwraca wzrost błędu wybiegu van Loana do holdover do progu — jak długo zegar swobodnie biegnie, zanim jego błąd czasu przekroczy budżet — dla klas zegarów klasycznych i kwantowych; modelowany i otwarcie zaznaczający, że dla bardzo stabilnego zegara holdover do ciasnego progu jest wyznaczany przez założony poziom szumu dla długiego tau, a nie przez przytoczone ADEV.

seg-85b181275293 = Pseudoodległość, jonosfera i troposfera

seg-835df2d05f2a = Dziedzina pomiarowa GNSS

seg-ef01abb1cfe8 = Saastamoinen ZHD ≈ { "2.3" } m · Niell równy jedności w zenicie · Klobuchar według IS-GPS-200

seg-43c0372fe6e7 = Synteza pseudoodległości i Dopplera w przód z jonosferą Klobuchara (nadawaną) oraz IONEX / siatką TEC (zmierzoną) — w tym parser plików IONEX, interpolacja w czasie i odwzorowanie ukośności cienkiej powłoki — troposferą Saastamoinena + Niella oraz migawkowym RAIM.

seg-3458cb02f156 = Pozycjonowanie jednopunktowe (PVT)

seg-640e4cd9f008 = Pozycjonowanie GNSS

seg-4fa43feda96a = Sprawdzone na rzeczywistych danych IGS (stacja ABMF, 2018-05-13) do { "5.7" } m RMS w 3D / { "1.1" } m w poziomie względem współrzędnej pomierzonej geodezyjnie.

seg-b107ba0607b0 = Rzeczywista pozycja odbiornika wyznaczona z rzeczywistych pseudoodległości kodowych RINEX + efemeryd nadawanych iterowaną ważoną metodą najmniejszych kwadratów — poprawka Sagnaca / rotacji Ziemi, zegar nadawany z TGD, dwuczęstotliwościowa kombinacja bezjonosferyczna L1/L2 (lub jednoczęstotliwościowy Klobuchar), troposfera Saastamoinena/Niella, ważenie elewacją, DOP oraz migawkowy RAIM.

seg-5819c351d123 = Zagłuszanie (jamming) i wielowarstwowa detekcja spoofingu

seg-9a03f3db9ef0 = detektor NP χ²₁ · postać zamknięta i Monte Carlo P_fa/P_md zgadzają się

seg-788fdc9a22a1 = Model zagłuszania (jamming) oparty na budżecie łącza (J/S → efektywne C/N₀ → utrata synchronizacji), stochastyczny detektor spoofingu czasu (test energii Neymana–Pearsona / χ²₁ z Monte Carlo P_fa/P_md oraz Security FoM równym { "1" } − P_md) i wielowarstwowy detektor spoofingu łączący test parzystości spójności RAIM, monitor mocy AGC w torze RF oraz monitor jakości sygnału (SQM). Do tego budżet błędu nawigacji zliczeniowej kwantowo-inercyjnej, składający dryf białoszumowy zimnoatomowego interferometru z obciążeniem resztkowym (sprawdzony krzyżowo z niezależnym integratorem) i błędem współczynnika skali w wielkość dryfu pozycji w czasie holdover — inercyjny odpowiednik holdover zegara.

seg-87bca15c6939 = Modulacja, odporność na zagłuszanie i śledzenie kodu

seg-c7d3ff7ea829 = Parametry sygnałów nawigacyjnych

seg-1aec700caefe = BPSK self-SSC = 2/(3R_c) · jitter DLL C/A poniżej metra przy { "45" } dB-Hz · korelacja wzajemna kodów Golda GPS C/A -23.9 dB

seg-304803ee178d = Warstwa parametrów sygnału między budżetem łącza a dziedziną pomiarową: widmowe gęstości mocy o jednostkowym polu dla BPSK-R(n) i sinusoidalnego BOC(m,n), współczynnik separacji widmowej, który wyprowadza odporność na zagłuszanie Q wykorzystywaną przez model zagłuszania bezpośrednio z rzeczywistych widm sygnału i zagłuszacza, szerokość pasma RMS (Gabora) wyznaczająca zawartość informacji o odległości (BOC > BPSK), jitter szumu termicznego koherentnego śledzenia kodu pętlą DLL typu early–late oraz koherentna obwiednia błędu wielodrogowości early-minus-late z tłumieniem korelatora wąskiego, a także kompromisy projektowe kodów dalmierczych (listki boczne autokorelacji ciągów m/Golda i trójwartościowe ograniczenie korelacji wzajemnej Golda, plus odwrócenie zależności długości kodu do jednoznacznej odległości). Jest to analiza parametrów sygnału, a nie projekt sprzętu ładunku RF ani anten.

seg-684494a7877c = Pasywna geolokalizacja RF (TDOA/FDOA)

seg-414872cdf952 = Pasywna geolokalizacja RF

seg-bed5944d15dd = bezszumowe TDOA w przód→w tył do { "1e-6" } m · J·CRLB = I · GDOP monotoniczny względem liczby odbiorników · estymator osiąga swoje CRLB w { "4000" } próbach Monte Carlo

seg-be8f2a419275 = Lokalizacja zagłuszacza lub spooferu (lub oportunistycznego źródła dla odwróconego PNT) z hiperboloid różnicy czasu przybycia w sieci odbiorników, rozwiązywana metodą najmniejszych kwadratów Gaussa–Newtona; dodanie różnicy częstotliwości przybycia przy ruchomych odbiornikach łącznie odtwarza położenie i prędkość emitera, z ograniczeniem Craméra–Rao na kowariancję położenia wynikającą z geometrii sieci. Model źródła punktowego z widocznością bezpośrednią — bez członów wielodrogowości / NLOS, błędu zegara odbiornika ani refrakcji.

seg-48e98ff7065e = Formaty RINEX, SP3 i CCSDS

seg-7c6f4dc6bcba = Interoperacyjność

seg-ae8dc649ab26 = efemerydy nadawane + interpolacja SP3 względem RTKLIB; OEM względem niezależnego parsera CCSDS

seg-75aae4d201fd = Wczytywanie wielosystemowych efemeryd nadawanych RINEX-3 (GPS, Galileo, QZSS, BeiDou, GLONASS), parser obserwacji RINEX-3 (układ obserwacji RINEX { "4.00" } powinien się parsować, ale żaden plik { "4.00" } nie został przez niego odczytany; pliki nawigacyjne RINEX { "4" } są odrzucane z nazwy), czytnik/zapisywarka precyzyjnych efemeryd SP3-c/d z interpolacją Lagrange'a oraz eksport CCSDS OEM { "2.0" } + OMM (elementy średnie) dla narzędzi dynamiki lotu (GMAT, Orekit, STK), a także parsowanie i emisja komunikatów danych śledzenia CCSDS-TDM ({ "503" }) dla radiometrycznego śledzenia w przestrzeni kosmicznej.

seg-1f379e235f5f = Maszynowo sprawdzana macierz weryfikacji

seg-a4d10bb41065 = Weryfikacja i zapewnienie jakości

seg-72ec664ea7ae = wiersze sprawdzone względem wzorca wymagają zewnętrznej wyroczni (niezmiennik egzekwowany w CI)

seg-cab165105f32 = Odsyłacz wymaganie–moduł–test–wyrocznia–status, generowany z samego silnika (Markdown/CSV), z testowanymi jednostkowo niezmiennikami rzetelności: wiersz może być oznaczony jako sprawdzony względem wzorca tylko wtedy, gdy ma niezależną zewnętrzną wyrocznię (NIST / AIAA / SOFA / IGS / opublikowana wartość), tak aby wewnętrzna kontrola samospójności nie mogła uchodzić za walidację — a możliwości sprzętowe i PA, których Kshana nie zapewnia, są zapisane jako luki należące do partnera. Wykonywalny kręgosłup odsyłacza weryfikacyjnego ECSS-E-ST-10-02.

seg-190cdf3ca8dc = Jednostka i pochodzenie przy każdej raportowanej wielkości

seg-1c7bb8c3e887 = { "87" } z { "87" } rodzajów, { "3127" } z { "3127" } pól liczbowych

seg-3e7fb040a7c4 = Każde pole liczbowe emitowane przez scenariusz niesie jednostkę i klasę pochodzenia z zamkniętego słownika, z definicją tam, gdzie istnieje, publikowane jako schemat czytelny maszynowo obok silnika. Bramka z zapadką uruchamia każdy wbudowany rodzaj i kończy się niepowodzeniem na polu, które nie niesie żadnego z tych elementów; rodzaje jeszcze niekompletne są wymienione jeden po drugim z powodem, dla którego każdy pozostaje otwarty, a lista może się tylko kurczyć. Raporty, które podają własne stałe — jednokierunkowy budżet łącza, budżet optyczny i radiowy — pozwalają czytelnikowi przeliczyć wartość nagłówkową wyłącznie na podstawie raportu.

seg-0e1a01c9158a = Budżety startu, wejścia w atmosferę, pokrycia i pointingu

seg-f5cf9e86d3c9 = Analiza misji

seg-767b2cd5f4ba = sprawdzone względem postaci zamkniętych (azymut startu · Allen–Eggers · SMAD)

seg-23bac81d700b = Budżety projektowe misji pierwszego rzędu, każdy jako scenariusz możliwy do uruchomienia: geometria startu i wznoszenia dla dwóch ciał (azymut startu, minimalne nachylenie, bonus z obrotu Ziemi, Δv zmiany płaszczyzny typu dogleg, dzienne okazje), korytarz balistycznego wejścia w atmosferę według Allena–Eggersa (szczytowe opóźnienie, prędkości szczytowego przeciążenia i szczytowego nagrzewania), geometria pokrycia obserwacji Ziemi (pas, GSD w nadirze / dostęp poza nadirem / czas ponownego przeglądu przez trójkąt kosmiczny SMAD), budżet błędu orientacji i pointingu 3-DOF (moment gradientu grawitacyjnego + budżet pointingu RSS), predykcja przelotów nad stacją naziemną (AOS/TCA/LOS, maksymalna elewacja, dostęp) oraz jednokierunkowy budżet łącza według równania łącza CCSDS { "401" } / DSN 810-005 (FSPL, C/N₀, Eb/N₀, margines, zamknięcie). Analityczna warstwa przedsprzętowa poniżej STK/GMAT/Basilisk — modelowane budżety pierwszego rzędu, a nie zamiennik 6-DoF ani radiometrii.

seg-43f53b910042 = Dzielenie apertury między nawigację a łączność

seg-989637b0c6fc = Przerwy i rywalizacja o dostęp w każdej sesji, a nie jedna wartość wypełnienia

seg-5c63a4559aff = Na wejściu plan kontaktów i liczba apertur; na wyjściu wypełnienie nawigacyjne, wypełnienie łączności, przerwy w każdej sesji i rywalizacja o dostęp. Polityka arbitrażu jest nazwana w raporcie, a nie domyślna, a sesja, której nie można w pełni obsłużyć, podaje ułamek utraconej części zamiast znikać w średniej.

seg-c8eb43aeb31a = Pogoda kosmiczna i gęstość termosfery

seg-37b8c9397544 = Środowisko kosmiczne

seg-25e24a6c0ba3 = Jacchia-71 sprawdzona względem wzorca dla opublikowanego minimum / średniej / maksimum aktywności Słońca

seg-1eff250f41c3 = Model środowiska pogody kosmicznej: wskaźniki aktywności słonecznej (F10.7 / F10.7a uśredniony w centrowanym oknie 81 dni) i geomagnetycznej (Kp, z definicyjną tabelą Kp↔ap), egzosferyczna temperatura Jacchii-1971, którą one wyznaczają, oraz gęstość neutralna termosfery skorygowana o aktywność w porównaniu ze statyczną na danej wysokości — zależność gęstości od cyklu słonecznego, której statyczna atmosfera nie uwzględnia. Skalibrowane sprzężenie pierwszego rzędu przez wysokość skali, a nie atmosfera NRLMSISE zwalidowana na danych.

seg-49bac998eb07 = Ocena detekcji zaburzeń RF i kompromis PNT

seg-dca720256d85 = Ocena i kompromis uczenia maszynowego

seg-5f0a39efe160 = Harness AUC sprawdzony względem postaci zamkniętej dwunormalnej Φ(d′/√{ "2" }) (Gneiting & Vogel { "2018" }); metryki oceny sprawdzone co do bitu względem scikit-learn { "1.9.0" } — korpus syntetyczny, nie surowe IQ/TEXBAT

seg-0dc3a7135442 = Stanowisko oceny detekcji zaburzeń RF: oznaczony, osadzony w parametrach syntetyczny korpus (nominalny / zagłuszanie / spoofing czasu / spoofing pozycji / wielodrogowość), niezależny od detektora harness ROC/AUC oceniający dowolny detektor z Pd dla każdej klasy przy docelowym Pfa oraz luka optymizmu między danymi z rozkładu i spoza rozkładu. Głębsze badanie luki optymizmu rozszerza to na panel 13 detektorów (energia / AGC / SQM / parzystość oraz detektory z zasianą regresją logistyczną i jednowarstwowym MLP), prawa skalowania dla danych z rozkładu i spoza rozkładu z hipotezą zerową permutacyjną oraz predyktor leave-one-out degradacji poza rozkładem; front-end odbiornika definiowanego programowo (surowe IQ/IF → odczyty korelatora early/prompt/late → SQM) i adaptery wczytywania rzeczywistych danych (RINEX, u-blox UBX, GnssLogger, JammerTest, Yunnan, SatGrid) pozwalają tym samym detektorom działać na nagraniach dostarczonych lokalnie. Do tego kompromis PNT kwantowy i klasyczny, który określa ilościowo korzyść w czasie i w holdover inercyjnym kandydackiego zegara na podstawie zmierzonej krzywej ADEV względem klasycznego punktu odniesienia, z obwiednią odporności bez GNSS w funkcji czasu. Modelowane charakterystyki operacyjne — nigdy dane terenowe/IQ, bez werdyktu dobry/zły.

seg-8766e058334d = Mapa przecięcia odporności: kwantowe a klasyczne

seg-8f851e9cf8c2 = ponownie generuje badania przecięcia inercyjnego i zegarowego stojące za rysunkami wyników; jądra kompromisów sprawdzone względem scipy { "1.17.1" }

seg-a057ad4c89ce = Odtwarzalna mapa tego, gdzie czujnik kwantowy wyprzedza swój klasyczny odpowiednik przy niepewności parametrów: zimnoatomowa nawigacja zliczeniowa kontra klasa nawigacyjna oraz holdover zegara optycznego kontra zegara w skali chipa, w funkcji czasu przerwy i drgań platformy, przy czym każda krzywa niesie etykietę gotowości technologicznej. Odtwarzalne przez cargo run --bin crossover_study. Modelowane budżety wydajności — dane wejściowe to opublikowane lub ujęte w widełki współczynniki, a nie dane lotne.

seg-6347618838dd = Warunkowy poziom ochrony czasu

seg-a846e806e577 = Integralność czasu

seg-762bc9f28716 = złożenie porównane krzyżowo z wieloetapową rekursją kowariancji clock_state; skalibrowane na JammerTest { "2024" } (Zenodo { "15911589" })

seg-3622798325cd = Ograniczenie niewykrytego błędu czasu przy spoofingu GNSS, wyznaczone przez holdover: przy niezależnej kontroli krzyżowej błąd podawanego czasu jest ograniczony przez próg monitora k-sigma, wariancję wybiegu van Loana w czasie opóźnienia detekcji oraz czas do alarmu CUSUM. Skalibrowane na rzeczywistym zarejestrowanym spoofingu (JammerTest { "2024" }) i odtwarzalne przez cargo run --example tpl_jammertest. Modelowane złożenie, warunkowe względem detekcji — nie istnieje skończone ograniczenie bezwarunkowe, ponieważ dostatecznie wolna rampa omija pojedynczy monitor wspomagany zegarem.

seg-734a93b6a809 = Ocena odporności PNT i niestabilność decyzji

seg-c25b4e240fb5 = Ocena odporności

seg-f42ae8719e02 = { "35" } testów z ręcznie wyprowadzoną wyrocznią; artefakt badania deterministyczny co do bajtu (stałe ziarno); dostosowane do DHS RPCF v2.0

seg-8e69193ca540 = Silnik punktacji oparty na ramach (kategorie DHS RPCF), który przekłada symulowane zachowanie architektury na podoceny dla poszczególnych wymiarów, a następnie sprawdza, czy jakikolwiek pojedynczy wynik złożony lub poziom dojrzałości stanowi stabilną podstawę decyzji — za pomocą sympleksu wag Dirichleta, niestabilności rankingu według tau Kendalla, odsetka zmian zwycięzcy top-1 oraz załamania różnorodności składowej wspólnej (Hill-N2) — z raportem zapewnienia opatrzonym skrótem integralności. Odtwarzalne przez cargo run --example resilience_report. Modelowane syntetyczne architektury dostosowane do RPCF v2.0; samoocena, a nie certyfikacja.

seg-62ef40799af4 = Niewykryte zdarzenie → obszary integralności

seg-52e55797d77c = Wpływ na integralność

seg-99025f66f277 = Obszary integralności Stanford-ESA (Tossaint i in., NAVIGATION { "2007" })

seg-13f23ffe5840 = Most od niewykrytego zdarzenia do integralności: niewykryte obciążenie pozostawione przez pominiętą detekcję spoofingu / zagłuszania (jammingu) / RAIM zawyża efektywny błąd pozycji, który — zestawiony z limitami alarmowymi właściwymi dla kontekstu — jest klasyfikowany do obszarów integralności Stanford-ESA (dostępny / niedostępny / wprowadzający w błąd / niebezpieczny). Składa zewnętrznie zakotwiczoną klasyfikację Stanford dla RAIM; nie dodaje żadnej nowej matematyki integralności.

seg-3a7572774192 = Zwrot z inwestycji w przeliczeniu na pokrycie

seg-797d137dc022 = Wsparcie decyzji

seg-d77993b6ef59 = Ujęcie zwrotu z inwestycji w przeliczeniu na pokrycie — koszt na jednostkę dostarczonego pokrycia dla kompromisu konstelacji / architektury. Składnik pokrycia składa sprawdzoną względem wzorca geometrię pokrycia, a arytmetyka jest testowana jednostkowo, ale koszt jest daną wejściową użytkownika — dlatego stosunek jest pomocą planistyczną, a nie wielkością sprawdzoną zewnętrznie (stąd, zgodnie z prawdą, brak odznaki dowodu).

seg-690b4cb0df55 = Kshana Interchange Format (KIF)

seg-558523b5e0ac = Wymiana artefaktów

seg-b882cccf5cee = wersjonowana koperta · sprawdzono odczyt w obie strony i z zachowaniem zgodności w przód

seg-ff5a4ead87fe = Wersjonowana, samoopisująca się koperta, która opakowuje wynik scenariusza wraz z jego rodzajem, wersją schematu oraz etykietami modelowane/sprawdzone względem wzorca, tak aby zapisany artefakt pozostawał samodokumentujący się, a starsze koperty dawały się czytać z zachowaniem zgodności w przód.

seg-5052e1720602 = Wskaźnik zaufania do odbiornika dla statku

seg-70144aeea2d1 = arytmetyka monitorów sprawdzona względem pynmea2 i GeographicLib

seg-9d9329128f06 = Ocenia, czy pozycji nawigacyjnej statku można ufać, na podstawie NMEA { "0183" }, które jego odbiornik i przyrządy już emitują: wskaźnik 0-100, trzy pasma i stojące za nimi przyczyny, dla każdej epoki, wsadowo, na żywo lub jako bramka. Monitory porównują pozycję z własnym ruchem statku, czujnikiem kursu, logiem prędkości i poziomami sygnału satelitów. Oprogramowanie wyłącznie doradcze, nie jest to sprzęt nawigacyjny z zatwierdzeniem typu: odpowiedzialność ponosi nadal operator. Arytmetyka monitorów jest sprawdzona względem niezależnych bibliotek; reguła i progi wskaźnika są własne dla projektu i pozostają modelowane.

seg-a47934361f43 = Strumienie NMEA do szkolenia załóg

seg-c6492d4a7dae = { "225,227" } zdań sparsowanych i zdekodowanych przez pynmea2

seg-9ca765cc09fc = Zapisuje syntetyczne mostkowe NMEA { "0183" } dla scenariuszowego rejsu ze skryptowanymi przez instruktora zdarzeniami zagłuszania (jammingu), odciągania pozycji, spoofingu czasu i powtórzenia, wraz z dziennikiem instruktora, aby załoga mogła zobaczyć, jak wygląda pogorszona pozycja na własnych przyrządach. Wyłącznie tekst, nigdy do działających systemów nawigacyjnych statku; nic nie jest nadawane i nie powstaje żaden sygnał radiowy. Zdania i ich zdekodowane wartości są sprawdzane; modele odbiornika, nieba i zdarzeń są modelowane.

seg-39f61b88209e = znaczenia kodów i geometria sprawdzone względem pyModeS, pyais, shapely i GeographicLib

seg-4c1667d3d453 = Buduje dzienną mapę GeoJSON miejsc, w których statki powietrzne (ADS-B) i statki (AIS) zgłaszały pogorszone dane nawigacyjne, z danych wejściowych na otwartych licencjach, oraz udział trasy przechodzący przez pogorszone komórki. Pogorszona komórka jest stwierdzeniem o zgłoszonych polach dokładności lub nieprawdopodobnych pozycjach, a nie ustaleniem zakłóceń, a komórka, której nikt nie obserwował, nie jest dowodem, że trasa jest czysta. Zgłoszenia z przeszłości, a nie prognoza.

seg-e0962980e96f = Telemetria zaufania dla operacji bezpieczeństwa

seg-9b538e790bd7 = Prometheus, OTLP i CEF odczytane z powrotem przez niezależne parsery

seg-f33e062790d9 = Eksportuje strumień zaufania jako metryki Prometheus, OpenTelemetry (OTLP/HTTP) oraz zdarzenia syslog CEF lub LEEF przez stdout, HTTP, UDP lub TCP, aby centrum operacji bezpieczeństwa widziało błąd nawigacji obok swoich innych alertów. Martwy kolektor ani nie wstrzymuje oceny, ani nie pozostaje niezauważony. Prometheus, OTLP i CEF są odczytywane z powrotem przez niezależne parsery; LEEF jest sprawdzany wyłącznie względem własnej specyfikacji.

seg-c74f3b9569b1 = Podpisane pakiety dowodowe

seg-28016686504c = wektory RFC { "8032" } bajt w bajt; weryfikator clean-room zgadza się dla { "71" } pakietów

seg-123fa1de2e23 = Łączy okno wokół zdarzenia zaufania w pakiet z łańcuchem skrótów, podpisany Ed25519, który każdy może zweryfikować offline: zmieniony, usunięty, podmieniony lub dodany plik, ponownie podpisany pakiet albo błędny przypięty klucz są wskazywane. Do pakietu jest dowiązany opcjonalny token znacznika czasu RFC { "3161" }. Zapis techniczny, a nie opinia prawna, ustalenie faktów ani poświadczenie.

seg-ee2e250497f9 = Eksport dla test bench

seg-ea618add831e = konwersje i kodowania sprawdzone względem PROJ, GeographicLib, pynmea2 i SciPy

seg-be8af88f4f99 = Zapisuje ruch pojazdu i zdarzenia ze scenariusza jako trajektorię CSV oraz NMEA { "0183" } dla laboratoryjnego symulatora GNSS: kolumny w układzie związanym z Ziemią, geodezyjne i prędkości lokalnej, orientacja i UTC. Wyłącznie ruch i zdarzenia: nie jest zapisywany żaden sygnał i nie jest deklarowana żadna wydajność symulatora ani odbiornika.

seg-1ff1d8ebf1e7 = Odwzorowanie compliance na publiczne ramy

seg-83af3fa21509 = Odwzorowuje wyniki { -brand } na klauzule publicznych ram (wytyczne IMO dla statków, EU NIS2 art. { "21" }, EN { "16803" }, amerykańskie ramy odpornego PNT DHS oraz wytyczne EASA dla lotnictwa) wyłącznie według numeru klauzuli, wypełnione z przebiegów, które mu się poda, i wskazuje, dla których wierszy dany zestaw przebiegów dostarcza dowodów na (supports evidence for), wraz z luką każdego wiersza. Nie jest to ustalenie, że jakiekolwiek ramy są spełnione, ani ocena czy zatwierdzenie przez kogokolwiek.

seg-1b784a8701ac = Uwierzytelnianie GNSS

seg-2b5a6095013a = wszystkie { "18" } oficjalnych zestawów wektorów testowych: { "186,382" } znaczników uwierzytelnionych, { "0" } nieudanych

seg-0419e9af208d = Otwarty weryfikator po stronie odbiornika, napisany w czystym Rust, dla uwierzytelniania wiadomości nawigacyjnych usługi otwartej Galileo: sprawdza, dla których satelitów dane nawigacyjne odbiornik może uwierzytelnić ze stron I/NAV lub ze strumienia u-blox UBX, przez kontrole klucza publicznego, łańcucha kluczy i znaczników z specyfikacji sygnału w przestrzeni, i raportuje uwierzytelnienie dla każdego satelity i każdej chwili. Uwierzytelnia dane; nie deklaruje żadnej skuteczności przeciw spoofingowi.

seg-d8bb6226f2e3 = Widoczność z maską horyzontu, DOP i elipsa błędu

seg-6c6e7248496f = Geometria nieba

seg-94ff262653a6 = { "1173" } kątów widzenia i { "142" } zbiorów widocznych zgadza się z Orekit { "12.2" } i gnss_lib_py { "1.0.4" } do { "1e-12" }; elipsa zgadza się z numpy w { "270" } przypadkach

seg-309521d4c9e1 = Które satelity widzi dane miejsce, gdy budynki, nabrzeża, dźwigi lub teren zasłaniają część nieba, i jak to wpływa na rozmycie dokładności (DOP) oraz poziomą elipsę błędu. Linia horyzontu zależna od azymutu zastępuje pojedynczy próg elewacji; zbiór widoczny, jego DOP i elipsa wychodzą dla każdej epoki i każdej konstelacji. Linia horyzontu usuwa satelity w linii widzenia i nic więcej: nie modeluje odbić, dyfrakcji ani siły sygnału.

seg-448e81d36ca4 = Ustawienia wstępne linii horyzontu i funkcje geometrii nieba

seg-6483f9d89f15 = wartości obliczone ręcznie i geometria, z której próbkuje chmura; bez zewnętrznej wyroczni

seg-ebc2904904d3 = Redukcje kanionu ulicznego, sektora i terenu do tabeli linii horyzontu, cztery reprezentatywne ustawienia wstępne (ulica miejska, wejście do portu, fiord, terminal kontenerowy) oraz funkcje, które składają je w skyplot i chmurę Monte Carlo, z CLI, MCP, Pythona i przeglądarki. Ustawienia wstępne są reprezentatywnymi geometriami o wybranych, podanych wymiarach, a nie pomiarami, a redukcje są sprawdzane wyłącznie względem wartości obliczonych ręcznie.

seg-c2a5a6a7bcb0 = Klasyfikacja zaufania uwzględniająca geometrię

seg-2f51e4da63b4 = reguła klasyfikacji i progi są własne dla projektu, sprawdzone same względem siebie

seg-b664ce284745 = Zestawia geometrię satelitów ze wskaźnikiem zaufania do odbiornika i nazywa klasę przy każdym odjęciu: utrata sygnału, słaba geometria albo niespójność między DOP podanym przez odbiornik a DOP wyprowadzonym z widocznych satelitów. Geometria jest oceniana tylko wtedy, gdy jest znana, a etykieta jest nagłówkiem: tylko słaba geometria kosztuje punkty. Oprogramowanie wyłącznie doradcze, nie jest to sprzęt nawigacyjny z zatwierdzeniem typu.

seg-5026aab26cb8 = Badanie księżycowej stacji referencyjnej

seg-d6935d32272b = składa przetestowane funkcje księżycowe różnicowe, zegarowe i układu odniesienia; sprawdzone same względem siebie i względem odniesienia numpy, bez zewnętrznych danych z lotu

seg-4f9696706384 = Jedno odtwarzalne badanie tego, co mogłaby zrobić księżycowa stacja referencyjna przy biegunie południowym przy założeniach publicznych: mapa pokrycia i dokładności nad obszarem polarnym (percentyle błędu pozycji z korekcją i bez niej, dostępność z przyczyną dla każdej niedostępnej epoki, poziomy ochrony i budżet łącza korekcji), laboratorium czasu, które utrzymuje księżycowy wzorzec czasu na zegarze atomowym, oraz geodezja dodanego laserowego retroreflektora i radiolatarni VLBI względem układu odniesienia z pięciu układów. Każda dana wejściowa jest oznaczona publicznym źródłem lub jako ilustracyjna. Nie jest to stwierdzenie o wydajności jakiegokolwiek rzeczywistego systemu, a { -brand } nie jest powiązana z żadną agencją.

seg-cad8be3b66a3 = Optyczne łącza czasu przez chmury i turbulencje

seg-e86745da72f0 = { "7" } z { "7" } wstępnie zarejestrowanych progów liczbowych spełnionych względem niezależnego programu mpmath; nie porównano żadnego zmierzonego zapisu dostępności

seg-dd98aa94f8c8 = Jak często optyczne łącze transferu czasu działa, gdy na drodze jest atmosfera. Dla każdego stanowiska naziemnego silnik podaje tłumienie w czystym powietrzu, stan turbulencji Hufnagela-Valleya ze zanikami scyntylacji gamma-gamma i uśrednianiem apertury, dostępność względem marginesu łącza przy podanym klimacie zachmurzenia, pułap, którego żaden margines nie podniesie, rozkład czasu trwania przerw oraz błąd czasu, jaki przerwa kosztuje zegar w holdover. Następnie pokazuje, co dają dodatkowe stanowiska, większa apertura, inna długość fali lub optyka adaptacyjna. Dołączone klimaty zachmurzenia są ilustracyjne, a nie zmierzone; wynik ma charakter doradczy.

seg-861d57389dd7 = GNSS poza konstelacją: wolumen usługi kosmicznej i dalej

seg-8705c276af61 = tabele broszury ICG SSV, wstępnie zarejestrowane; większość progów NOT MET (xval/gnss-ssv/RESULTS.md)

seg-2dc82174942a = Dla statku kosmicznego na sferze (globalna powłoka z broszury ICG Space Service Volume) lub na trajektorii keplerowskiej od LEO do transferu księżycowego liczy dla każdej konstelacji (GPS, GLONASS, Galileo, BDS, QZSS, NavIC) i dla wszystkich razem sygnały powyżej progu C/N0: dostępność jednego i czterech sygnałów, najdłuższą przerwę, odbierane C/N0, rozmycie dokładności oraz łącza listka głównego w porównaniu z listkami bocznymi. Charakterystyki nadawcze są z broszury, parametrycznym zamiennikiem lub podaną przez użytkownika; opcjonalne są model jonosfery, plazmosfery i atmosfery dla promienia na brzegu tarczy oraz projekt odbiornika słabych sygnałów; uwzględniono pokładowy filtr GNSS dla orbit wysokich i transferu księżycowego oraz nawigację względną formacji. MODELLED: w porównaniu z tabelami broszury według wstępnej rejestracji zatwierdzonej przed przebiegiem stałe minimalnej mocy wypromieniowanej i księżycowy próg zgadzają się, pozostałe progi są NOT MET przy odczytaniu zgodnym z wstępną rejestracją (prawie wszystkie przez niespójny kąt wiązki GLONASS w broszurze), a parametryczny zamiennik listków bocznych nie odtwarza zmierzonych charakterystyk paneli GPS.

seg-61817375c8ea = Orbita i powierzchnia Księżyca jako infrastruktura nawigacyjna i geodezyjna

seg-d2439abaeabb = wyrocznie numpy/scipy dla numeryki; trzy progi ustalone wstępnie NOT MET (xval/lunar-infra/RESULTS.md)

seg-db45ac2940af = Pięć badań w ograniczonym modelu trzech ciał: pokładowe wyznaczanie orbity z GNSS Ziemi na prawie prostoliniowej orbicie halo względem niezależnego naziemnego wyznaczania odległości i prędkości zmiany odległości; łączne ustalanie całkowitoliczbowej niejednoznaczności fazy nośnej dla stacji powierzchniowej i orbitera (LAMBDA); informacja Fishera siedmioparametrowego księżycowego układu odniesienia z odległościami orbiter–powierzchnia i bez nich; przesunięcia GNSS, VLBI i pomiarów laserowych względem lokalnego powiązania; oraz wrażliwość na księżycowe parametry pływowe i libracji. MODELLED z danymi wejściowymi ilustracyjnymi: numeryka jest sprawdzana względem niezależnych programów numpy i scipy, a nie fizyka. Przy progach ustalonych wstępnie trzy są NOT MET: wstrzyknięty błąd siły nie jest wykrywany z podaną częstością (C3), odsetek sukcesu z bootstrapu różni się od wyroczni numpy o { "1.7e-6" } przy progu { "1e-9" } (Q3), a dodanie rodziny pomiarów odległości nie zawsze obniża ślad pseudoodwrotności (G3, połowa dotycząca śladu).

seg-d6476863f862 = Możliwość

seg-ad856ad710eb = Status

seg-6962adaa6a1f = Wygenerowano podczas budowania ze scenariuszy repozytorium i macierzy weryfikacji.

seg-6f44f45f6bf9 = { "61" } kart możliwości z <c1/>, a następnie wszystkie { "388" } wierszy macierzy weryfikacji.

seg-30200bb5be58 = Uruchom orbit-sgp4-gps.toml w Kshana Studio

seg-ecacc78711a1 = Uruchom realtime-frame-eop.toml w Kshana Studio

seg-fe9baedab7f0 = Uruchom imu-deadreckoning.toml w Kshana Studio

seg-58a3232bc4cf = Uruchom ins-trn-coast.toml w Kshana Studio

seg-27ffc4dfa394 = Uruchom gps-denied-gravity-nav.toml w Kshana Studio

seg-eb0c08082d24 = Uruchom gnss-ins.toml w Kshana Studio

seg-8d0f45d119a9 = Uruchom lunanet-araim.toml w Kshana Studio

seg-09641b89ad3a = Uruchom lunar-frame-realisation.toml w Kshana Studio

seg-4eea1b7d77cd = Uruchom moonlight-service-volume.toml w Kshana Studio

seg-3cd4cd7d7c16 = Uruchom lunar-interop-export.toml w Kshana Studio

seg-d767de2fa87a = Uruchom lunar-llr-datum.toml w Kshana Studio

seg-29266e8878ac = Uruchom lunar-differential-pnt.toml w Kshana Studio

seg-0955d6ded82d = Uruchom lunar-time-budget.toml w Kshana Studio

seg-ab41004755ea = Uruchom lunar-jamming.toml w Kshana Studio

seg-edbe5cf449a0 = Uruchom lunar-vlbi-fim.toml w Kshana Studio

seg-d706c2d59dd1 = Uruchom mars-pnt-lmo.toml w Kshana Studio

seg-71586c459df8 = Uruchom hybrid-optical-rf.toml w Kshana Studio

seg-87634a6d41b5 = Uruchom integrity-raim.toml w Kshana Studio

seg-a281aa02ddc7 = Uruchom araim-reference-check.toml w Kshana Studio

seg-9184b54b1173 = Uruchom clock-holdover.toml w Kshana Studio

seg-2f270136b41d = Uruchom gnss-sim-raim.toml w Kshana Studio

seg-f2f3ede70967 = Uruchom pvt-abmf.toml w Kshana Studio

seg-eac325fbeed1 = Uruchom spoof-attack.toml w Kshana Studio

seg-07d55d3e7bdc = Uruchom oem-interop.toml w Kshana Studio

seg-5b70a59accce = Uruchom aperture-duty-cycle.toml w Kshana Studio

seg-d3df277fd118 = Uruchom space-weather.toml w Kshana Studio

seg-7dc863bf8f7b = Uruchom impairment-eval.toml w Kshana Studio

seg-1c3083a77264 = Uruchom conflict-resilience.toml w Kshana Studio

seg-b3f2b2d88d8c = Uruchom gnss-ssv-shell.toml w Kshana Studio

seg-e42b759ccbaf = Uruchom lunar-infrastructure-od-consistency.toml w Kshana Studio

seg-60a43431ebe0 = Wymaganie

seg-cbf0f9bcd2d8 = Wyrocznia

seg-1603e76bcf66 = Identyfikacja szumu potęgowego na podstawie autokorelacji dla opóźnienia 1

seg-d95fe5878ee3 = allan::lag1_noise_id: identyfikator szumu Rileya i Greenhalla ({ "2004" }) oparty na autokorelacji dla opóźnienia 1 (zdecymowana faza z usuniętym składnikiem kwadratowym albo uśredniona grupowo częstotliwość z usuniętym składnikiem liniowym; powtarzane pierwsze różnice, aż delta = r1/({ "1" }+r1) < { "0.25" } lub d = dmax), zwracający całkowity i niezaokrąglony wykładnik potęgowy alfa (od +{ "2" } biały PM do -2 FM błądzenia losowego) przy dowolnym współczynniku uśredniania; ustala liczbę stopni swobody typu szumu w kartach urządzeń biblioteki zmierzonych zegarów

seg-6e0cb6acc073 = VALIDATED

seg-4d820e75cd4f = allantools { "2024.6" } autocorr_noise_id (A. Wallin i współautorzy, LGPL-3.0-or-later, uruchamiany jako osobny program przez generator danych testowych): niezależna implementacja opublikowanego algorytmu Rileya-Greenhalla, wielkość jednoznacznie zdefiniowana przy podanych konwencjach. Sprawdza identyfikator, a nie zawartość szumu żadnego rzeczywistego zegara

seg-aedf395f3597 = Uwierzytelnianie danych nawigacyjnych Galileo OSNMA po stronie odbiornika

seg-1e6e62438dad = osnma + <c1/>: otwarty weryfikator po stronie odbiornika dla Galileo OSNMA, napisany w czystym Ruście (SIS ICD Issue { "1.1" }, Receiver Guidelines Issue { "1.3" }), z stron I/NAV lub strumienia u-blox UBX-RXM-SFRBX: klucze publiczne drzewa Merkle'a (DSM-PKR), podpis ECDSA P-256/P-521 komunikatu DSM-KROOT, weryfikacja łańcucha kluczy TESLA (SHA-256 lub SHA3-256), weryfikacja MACSEQ i znaczników (HMAC-SHA-256 lub CMAC-AES) dla ADKD { "0" }, { "4" } i { "12" } z uwierzytelnianiem krzyżowym, koniec/unieważnienie/odnowienie łańcucha, odnowienie i unieważnienie klucza publicznego oraz komunikat alarmowy; stan każdego satelity: Authenticated/Failed/Unavailable, z podaniem przyczyny każdej awarii lub opóźnienia. Wyłącznie doradczo: nie jest to sprzęt nawigacyjny z zatwierdzeniem typu ani usługa integralności nawigacji; nie twierdzi się żadnej skuteczności przeciw spoofingowi

seg-a6bd60ed728f = Oficjalne wektory testowe Galileo OSNMA opublikowane przez European GNSS Service Centre jako załącznik do Receiver Guidelines (Test_vectors.zip, sha256 ef9b9afc6ef9e1c57393415cf2a1dc80c4035e7c06123907ea0bb97dd3ccf370): { "18" } z { "18" } zestawów, { "186,382" } uwierzytelnionych znaczników, { "0" } nieudanych, uruchomione offline 2026-10-10 (zapis dowodowy w kshana-pro docs/evidence). Zakres: wektory sprawdzają weryfikację kryptograficzną (Merkle, KROOT/ECDSA, łańcuch TESLA, znaczniki MACK, ADKD 0/4/12) i jej wyniki na opublikowanych scenariuszach; używają wyłącznie HMAC-SHA-256, łańcucha SHA-256, kluczy 128-bitowych, znaczników 40-bitowych oraz pozycji tabeli { "33" } i { "34" }, więc CMAC-AES, łańcuchy SHA3-256 i inne parametry są pokryte tylko opublikowanymi testami znanych odpowiedzi dla prymitywów oraz testami syntetycznymi. Utwardzenie dotyczące zaufanego czasu, powiązania danych, wygaśnięcia i potwierdzenia nagłówka jest testowane syntetycznymi testami ataków, a nie zewnętrzną wyrocznią. Nie sprawdzono: list unieważnionych certyfikatów, sygnałów na żywo ani odbiornika na żywo (układ słów UBX sprawdzono tylko na ramkach syntetycznych), drzew Merkle'a SHA3-256, aktualności bez niezależnego czasu. Nie jest to usługa UE

seg-27a61718eb95 = Charakteryzacja stabilności częstotliwości

seg-56174d771190 = Odchylenie Allana/zmodyfikowane/Hadamarda + identyfikacja szumu potęgowego z przedziałami ufności χ²

seg-ed01b2ab3481 = Odchylenia referencyjne NIST SP { "1065" } (Riley) / Stable32 dla NBS14

seg-25b78672c194 = Stabilność częstotliwości rzeczywistego zmierzonego zegara

seg-fd378f5fe04a = Nakładające się odchylenie Allana + nakładające się odchylenie Hadamarda dla rzeczywistego wzorca cezowego

seg-64fd49d58394 = Stable32 nakładające się ADEV/HDEV dla zmierzonego szeregu fazy cezu 5071A (allantools)

seg-f305dbc83f2b = Zgodność estymatora Allana na kanonicznym szeregu referencyjnym Stable32

seg-5bfca5dcfb7c = Nakładające się odchylenie Allana + zmodyfikowane odchylenie Allana + odchylenie czasu w całej drabince AF

seg-327ab6dcf16a = Odchylenia referencyjne Stable32 dla PHASE.DAT (Riley; standardowy szereg regresyjny)

seg-96c4275f5a89 = Stabilność częstotliwości o rozszerzonym zakresie (Theo1 / TOTDEV)

seg-7f59c3631ca4 = Theo1 i odchylenie całkowite (TOTVAR) — estymatory stabilności długich τ o rozszerzonym zakresie, sięgające ~{ "75" }% rekordu, gdy odchylenie Allana wyczerpuje się w okolicy ~{ "50" }%; hybryda ThêoH z usuniętym obciążeniem (allan::theoh_curve) zbudowana na nich pozostaje MODELLED

seg-a38edc2526f5 = allantools { "2024.06" } — niezależna biblioteka stabilności częstotliwości innej firmy — theo1 (NIST SP { "1065" } eq { "30" }) i totdev (NIST SP { "1065" } eq { "25" }) na hermetycznym zbiorze danych LCG z NIST SP { "1065" } §{ "12.4" }; do ponownego wygenerowania offline przez tests/fixtures/theo1_totvar/generate_theo1_totvar_reference.py

seg-cc40472fbcbf = Maksymalny błąd interwału czasu (MTIE) — miara wander w telekomunikacji

seg-5c54ba2748f7 = MTIE(τ): maksymalna amplituda międzyszczytowa błędu czasu w dowolnym przesuwnym oknie τ = m·tau0, statystyka wander ITU-T G.810/G.823/G.8261, względem której zapisane są limity sieci synchronizacji (maski MTIE) — wielkość ekstremalna (maks./min.), odrębna od rodziny RMS Allana

seg-300fd3f945a0 = allantools { "2024.06" } — niezależna biblioteka stabilności częstotliwości innej firmy — mtie() na hermetycznym szeregu fazy LCG z NIST SP { "1065" } §{ "12.4" }; MTIE jest czystą statystyką maks./min., więc wynik estymatora jest zgodny bit w bit z allantools na identycznie zbudowanej tablicy fazy (zatwierdzone stałe referencyjne o 15 cyfrach znaczących mieszczą się w { "1" } ULP). Do ponownego wygenerowania offline przez tests/fixtures/mtie/generate_mtie_reference.py

seg-67d73f3ca14d = Zmodyfikowane odchylenie Allana / odchylenie czasu (MDEV / TDEV)

seg-9ac9d2b0bdf8 = MDEV(τ): nakładające się zmodyfikowane odchylenie Allana (estymator drugich różnic w przesuwnym oknie, który rozdziela szum fazy biały od migotania), oraz TDEV(τ) = τ/√{ "3" }·MDEV(τ), statystyka wander w dziedzinie czasu ITU-T G.811/G.812/G.823, względem której zapisane są maski synchronizacji

seg-24a441f32375 = allantools { "2024.06" } — niezależna biblioteka stabilności częstotliwości innej firmy — mdev() i tdev() na hermetycznym szeregu fazy LCG z NIST SP { "1065" } §{ "12.4" } (ten sam szereg co w wierszach Theo1/TOTDEV/MTIE), obliczające te same jednoznacznie zdefiniowane estymatory; zgodność do <{ "1e-9" } względnie. Do ponownego wygenerowania offline przez tests/fixtures/mdev_tdev/generate_mdev_tdev_reference.py. (Zależny od danych phasedat_reference.rs sprawdza je też względem Stable32 do { "1e-3" }; to jest ścisła, zawsze włączona hermetyczna kontrola krzyżowa)

seg-e4b6d707cbf5 = Stabilność częstotliwości zegara optycznego na rzeczywistej zmierzonej krzywej

seg-e9077554a08f = Odtworzenie metodą NNLS potęgowego (szum biały FM + czerwony próg szumu) przebiegu z opublikowanego zmierzonego odchylenia Allana optycznego przejścia zegarowego ⁸⁸Sr — odtwarzające σ_y(τ) i nagłówkowe skalowanie 4.7e-16/√τ dla krótkich τ z rzeczywistym zmierzonym progiem długich τ, zamiast syntetyzowanego progu klasy optycznej, który holdover.rs zakłada w pozostałych przypadkach

seg-4eaf0c102678 = Norcia, Young, Eckner, Oelker, Ye, Kaufman, Science { "366" }:{ "93" } ({ "2019" }), rys. { "4" } zmierzone ADEV; krzywa dołączona dosłownie z Zenodo 10.5281/zenodo.3382347 (CC-BY-4.0). Zakres ograniczony do odtworzenia opublikowanej zmierzonej krzywej stabilności — wartości urządzeń dla holdover do progu w klasie zegara pozostają MODELLED

seg-cc95c8615d39 = Integralność (RAIM/ARAIM/SBAS)

seg-d4ad9cfa4f9b = Rozdzielenie rozwiązań wielu hipotez ARAIM wg ARAIM Airborne Design Document (ADD) v4.2 (araim_reference::add_v42_protection_levels i add_v42_protection_levels_ecef: wyznaczanie podzbiorów regułami P_THRES i FC_THRES, VPL, HPL, efektywny próg monitora EMT i sigma_acc); detekcja uszkodzeń RAIM migawkowego z chi-kwadrat z wykluczeniem pojedynczego satelity (raim::snapshot_raim, raim::snapshot_raim_fde) i HPL/VPL oparte na nachyleniu na geodezyjnym poziomie lokalnym; oraz łączenie poziomów ochrony SBAS DO-229E (sbas::sbas_protection_level) w usłudze L1. NIE objęte, powiedziane wprost: wygodne funkcje o jednolitym sigma raim::araim_raim i raim::araim_dual_raim NIE spełniają ADD (na dopasowanych danych wejściowych różnią się od Stanford MAAST o { "0.75" } m VPL / { "4.04" } m HPL oraz { "0.39" } m VPL / { "1.93" } m HPL, co jest ustaleniem); porównanie dwuczęstotliwościowego, wielokonstelacyjnego (DFMC) SBAS L5 jest ustaleniem ({ "308" } par użytkownik-epoka bez GEO w widoczności jest chronionych przez Kshana, a nie przez MAAST, którego bramki odbioru GEO Kshana nie modeluje); raim::solution_separation_raim nie ma porównania zewnętrznego

seg-a83c68500982 = Trzy niezależne narzędzia, wstępnie zarejestrowane (0123cee1), zanim powstał jakikolwiek wynik danych testowych lub wyroczni, tolerancje ustalone wtedy. ({ "1" }) ARAIM: Stanford MAAST dla ARAIM { "2" } (commit ab70e2a3, BSD-3) mhss_raim_baseline_v5.m, uruchomiony jako osobny program w GNU Octave { "8.4" } z nakładką zgodności unique() po stronie sterownika (ujawnioną, bez zmiany algorytmu), przy TOL_PL z ADD równym { "0.05" } m: kod w Ruście odtwarza implementację referencyjną ADD w { "270" } rzeczywistych przypadkach. Ujawnienie: ścieżka ADD w Kshana została napisana po wstępnej rejestracji, według ADD tak, jak implementuje je MAAST; niezależny holdout recenzenta ({ "270" } nowych geometrii użytkownika i drugi komunikat wsparcia integralności, MAAST uruchomiony ponownie względem zamrożonego kodu) przeszedł przy tym samym progu. ({ "2" }) RAIM migawkowy: RTKLIB v2.4.2-p13 (BSD-2) estpos/valsol/raim_fde w osobnym module C dla detekcji i wykluczenia; PL nachylenia z RTKLIB matinv/xyz2enu oraz SciPy { "1.18.1" } chi2/ncx2, gdzie obie strony obliczają ten sam wzór zamknięty (Brown; Parkinson i Axelrad), więc kontrola PL obejmuje implementację, a nie wzór. ({ "3" }) SBAS: Stanford MAAST (commit 7d32b049) usr_vhpl, bez zmian, na własnych zarejestrowanych transmisjach WAAS MAAST: poziomy L1 w granicach { "1e-4" } m po przeskalowaniu K i równy zbiór chronionych. Te same porównania dały ustalenia podane w opisie możliwości: funkcje ARAIM o jednolitym sigma nie spełniają ADD, a równość zbiorów L5 zawodzi dla { "308" } par bez GEO w widoczności (poziomy dla { "3267" } par chronionych przez oba narzędzia zgadzają się do { "1e-13" } m). Współczynniki K z DO-229E/DO-316 są przepisanymi stałymi, a rzeczywista geometria jest daną wejściową; żadne z nich nie jest liczone jako wyrocznia. Rewizja { "0.30" }: poziomy ochrony snapshot_raim przeniesiono z poziomu radialnego na geodezyjny poziom lokalny (do { "0.31" } m HPL i { "0.14" } m VPL przy { "16" } deg N)

seg-1c37702cc5f2 = Propagacja i wyznaczanie orbity

seg-4d8ef6c0aa45 = SGP4/SDP4, Cowell 6-DOF + zaburzenia, wsadowe/sekwencyjne OD

seg-c84585f43297 = Wektory weryfikacyjne SGP4 wg AIAA 2006-6753

seg-50c545872e4f = Numeryczny propagator Cowella i model sił

seg-74f8c585bcfd = Numeryczny propagator Cowella z hierarchicznym modelem sił (dwuciałowy, zonalne J2–J6, trzecie ciało Słońce/Księżyc, SRP kuli armatniej, opór wykładniczy); RK4 z podwajaniem kroku / DP5({ "4" }) / DOP853

seg-c9b486609293 = Orekit { "12.2" } (CS GROUP, Apache-2.0) NumericalPropagator/DormandPrince853 — niezależna biblioteka, inny integrator i inna rekursja harmonik sferycznych. Zachowawcze poziomy (dwuciałowy → zonalne J2–J6 → trzecie ciało Słońce/Księżyc → SRP kuli armatniej) zgadzają się poniżej metra na łuku { "24" } h, co sprawdza integrator i algebrę sił; poziom oporu oraz bezwzględna wierność efemeryd Słońca/Księżyca i danych gęstości pozostają MODELLED (tylko charakteryzacja)

seg-d38c4be472ac = Cień SRP dla spłaszczonej Ziemi (opcjonalny)

seg-ab8247c6b4d2 = Oświetlona część SRP z elipsoidą WGS-84 jako ciałem zasłaniającym (pozorny promień Ziemi od limbu elipsoidy w stronę Słońca, wzór soczewki z dwóch dysków; srp_shadow::oblate_conical_shadow), opcjonalna w modelu sił Cowella przez propagator::ForceModel::srp_shadow (domyślnie: sferyczny cień stożkowy, bez zmian)

seg-26c2db527cec = Orekit { "12.2" } (Apache-2.0) SolarRadiationPressure.getLightingRatio z ciałem zasłaniającym WGS-84 i sferycznym OneAxisEllipsoid, uruchomiony jako osobny program ze Słońcem w tym samym położeniu inercjalnym. Progi zarejestrowane z góry w xval/srp-oblate-shadow-orekit/PREREGISTRATION.md (6d6d269c): { "1e-6" } dla obu oraz rozrzut spłaszczona a kula > { "1e-2" }; wszystkie spełnione. Oś elipsoidy jest po obu stronach osią inercjalną z (bez precesji i nutacji)

seg-01066d639b39 = Ciśnienie promieniowania słonecznego box-wing i ECOM2, z pochodnymi cząstkowymi (opcjonalne)

seg-2a5fc9708bd0 = SRP inne niż kula armatnia: model płaskich płyt box-wing (Vallado eq. 8-44; jednostronne panele korpusu, skrzydła skierowane na Słońce) z tabelami Galileo FOC, IOV i IOV w końcu życia z metadanych satelitów GSC, w nominalnym sterowaniu odchyleniem GNSS, z analitycznymi pochodnymi cząstkowymi dla współczynnika promieniowania oraz współczynników zwierciadlanych i rozproszonych każdego panelu; oraz empiryczny model ECOM2 (D2/B1) z jego pochodnymi cząstkowymi. Box-wing jest opcjonalny w propagatorze Cowella (propagator::ForceModel::box_wing_srp, ustawiając jego pole srp_boxwing) i w modelu precyzyjnego wyznaczania orbity (precise_od::PreciseForceModel::box_wing_srp), zastępując człon kuli armatniej z cr jako współczynnikiem promieniowania; oba domyślnie mają None, pozostawiając każdą istniejącą ścieżkę identyczną bajt w bajt. ECOM2 nie jest podłączony do modelu sił

seg-8f1d7126375c = Orekit { "12.2" } (Apache-2.0) BoxAndSolarArraySpacecraft z FixedPanel i PointingPanel, SolarRadiationPressure(dRef = { "1" } au, pRef = 1361/c), nominalne odchylenie GenericGNSS i ECOM2(nD = { "2" }, nB = { "1" }), uruchomione jako osobny program ze Słońcem w stałych położeniach inercjalnych; pochodna współczynnika promieniowania z Hipparchus Gradient, pochodne dla paneli jako różnice centralne z Orekit (Orekit ich nie ma). Progi zarejestrowane z góry w xval/srp-boxwing-orekit/PREREGISTRATION.md (e59df6bf), zanim powstał jakikolwiek wynik Orekit: { "1e-12" } względnie ({ "1e-11" } od końca do końca, { "1e-9" } dla różnic); wszystkie spełnione (RESULTS.md). VALIDATED obejmuje tylko ocenę modelu: tabele GSC są przepisanymi danymi wejściowymi, a adekwatność box-wing dla rzeczywistych orbit Galileo, ponowna emisja termiczna, zmodyfikowane prawo odchylenia przy niskim beta i zakręty zaćmieniowe nie są objęte; predykcja SRP dla Galileo pozostaje MODELLED

seg-bde1b3a94a47 = Cień SRP z pociemnieniem brzegowym Słońca (opcjonalny)

seg-eaaec545dd68 = Oświetlona część SRP jako niezasłonięta część strumienia słonecznego z pociemnieniem brzegowym (prawo przybliżenia Eddingtona I(mu)/I({ "1" }) = 2/5 + 3/5 mu, kwadratura Gaussa-Legendre'a) nad sferyczną Ziemią lub Ziemią WGS-84 (srp_shadow::limb_darkened_shadow, wariant ShadowModel OblateEarthLimbDarkened)

seg-76cb4b668ad5 = Brak zewnętrznego: Orekit { "12.2" } nie ma współczynnika oświetlenia z pociemnieniem brzegowym. Sprawdzono tylko względem wzorów zamkniętych tego samego prawa

seg-673b17e9dcf7 = Gęstość termosfery NRLMSISE-00

seg-09e997231de8 = Port empirycznej termosfery NRLMSISE-00 (gtd7 i gtd7d: gęstości gatunków, całkowita gęstość masy z anomalnym tlenem, temperatury; { "24" } przełączniki; tryby dziennego Ap i 3-godzinnej tablicy ap) z wersji C o statusie domeny publicznej, pochodzącej z Fortranu NRL

seg-80963ee0de61 = pymsis { "0.13.0" } (MIT) version={ "0" }, który uruchamia NRL Fortran GTD7D w pojedynczej precyzji, oraz port C NRLMSISE-00 (wydanie { "20190709" }, domena publiczna) skompilowany jako osobny program, a także { "17" } opublikowanych wyników testowych dystrybucji C. Progi zarejestrowane z góry w xval/nrlmsise00-pymsis/PREREGISTRATION.md (e90ae26a), zanim powstał port; wszystkie spełnione (RESULTS.md). Sprawdza port, a nie dokładność modelu względem zmierzonej gęstości

seg-12977f65b2ea = Poziom gęstości oporu NRLMSISE-00 (opcjonalny)

seg-17aec847b675 = forces::DensityModel (Exponential domyślnie, Nrlmsise00 { "{" } f107a, f107, ap { "}" }) i propagator::ForceModel::drag_density: opór kwadratowy względem współobracającej się atmosfery z gęstością NRLMSISE-00 w geodezyjnym punkcie WGS-84 (kąt obrotu Ziemi z UT1 = TT, lokalny czas słoneczny UT + lon/15), stała pogoda kosmiczna dla modelu; domyślnie wyłączony i identyczny bit w bit

seg-3878bf3b62d7 = Orekit { "12.2" } (Apache-2.0) NumericalPropagator/DormandPrince853 z DragForce na własnej implementacji NRLMSISE00 w Orekit, uruchomiony jako osobny program z tym samym układem kąta obrotu Ziemi, kształtem WGS-84, konwencją lokalnego czasu słonecznego (średnie Słońce) i TT jako UT; ustawienie konwencji sprawdzono wyrocznia względem wyroczni (Orekit względem pymsis, { "5.2e-5" } w gęstości). Progi zarejestrowane z góry w xval/drag-tier-orekit/PREREGISTRATION.md ({ "21647478" }): { "0.5" } m + { "1e-3" } przemieszczenia od oporu oraz dwie kontrole czułości > { "100" } m; wszystkie spełnione. Nie objęte: dokładność modelu względem zmierzonej gęstości, zmienna w czasie pogoda kosmiczna, odcinek GMAT

seg-1ac7430e88fc = Domyślny opór wykładniczy względem niezależnej implementacji (równikowy)

seg-a9c41b03f2ca = Domyślny opór propagatora Cowella: opór kwadratowy względem współobracającej się atmosfery z forces::atmospheric_density, odcinkowo wykładnicza tabela z Vallado Table 8-4 na wysokości sferycznej (propagator::ForceModel::drag z domyślnym wariantem Exponential forces::DensityModel)

seg-e2e177761b30 = GMAT R2022a (NASA GSFC, Apache-2.0) GmatConsole z atmosferą Exponential (ta sama 28-pasmowa tabela), Ziemia jako masa punktowa i PrinceDormand78, uruchamiany, nigdy nie dołączany. Progi zarejestrowane z góry w xval/drag-exponential-gmat/PREREGISTRATION.md (640c85c1) dla przemieszczenia od oporu po każdej stronie (przebieg z oporem minus bez oporu), co znosi dwie wartości mu Ziemi i integratory; wszystkie spełnione (RESULTS.md). GMAT przyjmuje wysokość geodezyjną, a kshana wysokość sferyczną: pokrywają się tylko na równiku, więc VALIDATED obejmuje orbity równikowe; poza równikiem modele różnią się z założenia ({ "10.4" } % przemieszczenia w { "24" } h przy { "51.6" } deg, { "400" } km). Publiczna wersja GMAT nie ma NRLMSISE-00 (brak wtyczki), więc poziom NRLMSISE-00 ma tylko wyrocznię Orekit. Dokładność tabeli względem zmierzonej gęstości nie jest objęta

seg-9e15970435c3 = Słońce i Księżyc z DE440 w modelu sił Cowella (opcjonalne)

seg-de6831cf7785 = Opcjonalny poziom efemeryd dla członów trzeciego ciała i SRP numerycznego ForceModel Cowella: geocentryczne Słońce i Księżyc z dowolnego EphemerisProvider (jądro DE440 SPK przez KernelEphemeris) przy TDB = TT + (TDB - TT), z odmową, gdy dostawca nie może obsłużyć epoki, i zliczaniem każdego powrotu do szeregu analitycznego; domyślnie wyłączony

seg-50027b9f4251 = Orekit { "12.2" } (Apache-2.0) NumericalPropagator/DormandPrince853 z ThirdBodyAttraction i SolarRadiationPressure na własnym czytniku DE440 w Orekit (orekit-data lnxp1990.440), uruchomiony jako osobny program; kshana czyta bit w bit wycinek NAIF de440s.bsp sprawdzony przez SPICE. Progi zarejestrowane z góry w xval/propagator-de440-orekit/PREREGISTRATION.md (22a5a01d). Próg orbity ({ "0.5" } m) i kontrola czułości są spełnione, ale próg położenia Słońca/Księżyca ({ "3" } m / { "0.2" } m) nie został osiągnięty: { "6.39" } m / { "0.244" } m. SPICE czytający to samo jądro w jego dokładnym TDB mija się z Orekit o tę samą wartość ({ "6.25" } m / { "0.240" } m), więc różnica leży między ścieżką de440s NAIF a czytnikiem DE440 lub skalą czasu Orekit; przyczyny nie wyodrębniono. Zapisane i przypięte, więc wiersz pozostaje MODELLED

seg-057c21daf4f2 = Pływ atmosferyczny S1 (opcjonalny)

seg-f600a39f297e = Dobowy pływ ciśnienia powietrza S1 jako zaburzenie geopotencjału: model N1 Biancale i Bode ({ "2006" }), stopnie od { "2" } do { "6" }, przez wzór obciążenia IERS { "2010" } Eq. { "6.21" } (tides::atmospheric_tide_s1, s1_air_tide_acceleration), opcjonalny w modelach sił Cowella i precyzyjnym (air_tide_s1, domyślnie wyłączony)

seg-7dd9fccac779 = Brak zewnętrznego dla efektu geopotencjału. { "24" } współczynniki przepisano z GFZ STR06/01 Table { "1" } model N1 i sprawdzono ponownie wiersz po wierszu względem raportu (SHA-256 890865ae); stopnie { "0" }, { "1" }, { "7" } i { "8" } nie są używane. Ray i Ponte ({ "2003" }) nie drukują tabeli harmonik sferycznych, więc nie porównano drugiego źródła

seg-b150b1bdb599 = Współczynniki pływu atmosferycznego S2 w konwencji IERS

seg-87e9238b8c53 = Harmoniki ciśnienia powietrza S2 Raya ({ "2001" }) (n <= { "4" }, postępowe i wsteczne) przekształcone do w pełni znormalizowanej postaci z wyprzedzeniem sinusa wg IERS { "2010" } Eqs. 6.20-6.21 (amplituda podzielona przez N_nm, epsilon = { "90" } deg - psi) i zastosowane jako człon S2 tides::atmospheric_tide

seg-4745148b6c60 = Biancale i Bode, GFZ Scientific Technical Report STR06/01 ({ "2006" }), Table { "5" }, model A2: Ray ({ "2001" }) opublikowany w w pełni znormalizowanych harmonikach z fazami z wyprzedzeniem sinusa, niezależne przedstawienie tego samego modelu. Zarejestrowane z góry w xval/s2-air-tide-fix/PREREGISTRATION.md (5e31c37a) razem z poprawką, którą sprawdza. Obejmuje tylko przekształcenie współczynników; efekt geopotencjału pływu powietrza nie ma zewnętrznej wyroczni

seg-444f0a65b6fd = Geopotencjał tesseralny w propagatorze Cowella

seg-ad475816bc78 = Opcjonalne pole tesseralne EGM2008 (do stopnia/rzędu { "70" }) jako centralna grawitacja numerycznego ForceModel Cowella, obliczane w układzie związanym z Ziemią obróconym o kąt obrotu Ziemi IAU { "2000" } (albo łańcuchem CIO GCRS-do-ITRS); domyślnie wyłączone, więc żaden istniejący wynik się nie zmienia

seg-e6db530c96c7 = Orekit { "12.2" } (CS GROUP, Apache-2.0) NumericalPropagator/DormandPrince853 z HolmesFeatherstoneAttractionModel na tych samych współczynnikach (tools/egm2008_to70.gfc) w układzie ciała obróconym tym samym wzorem kąta obrotu Ziemi, uruchomiony jako osobny program. Progi zarejestrowane z góry (f0e0e65, zmienione przed jakimkolwiek porównaniem w 2da899a): |dr| <= { "0.5" } m i |dv| <= { "5e-4" } m/s oraz oba negatywne testy kontrolne mijające się o > { "100" } m; wszystkie spełnione, po czym progi zaostrzono do { "0.1" } m i { "1e-4" } m/s. Nie sprawdzono: wierności orientacji Ziemi (obie strony używają UT1 = TT bez precesji i nutacji w układzie Era), opcji układu Cio (tylko kontrola wewnętrzna), stopni powyżej { "70" }

seg-e8f5ff8c9149 = Grawitacja w harmonikach sferycznych wysokiego stopnia (EGM2008 do { "2190" })

seg-d3b2f32dcecb = Odporna na niedomiar i na bieguny ocena w pełni znormalizowanego pola do stopnia { "2190" } (SphericalHarmonicField::acceleration_hf / potential_hf, zmodyfikowana kolumna w przód Holmesa-Featherstone'a z { "2002" } z gradientem wolnym od 1/cos phi), strumieniowy ładowacz ICGEM .gfc (from_gfc_file / from_gfc_reader; pełny EGM2008 jest pobierany w czasie działania, a nie dołączany) oraz ewaluator Holmesa-Featherstone'a wybieralny w opcjonalnym Cowell Geopotential

seg-8651532685f3 = Orekit { "12.2" } (Apache-2.0) HolmesFeatherstoneAttractionModel i pyshtools { "4.14.1" } (BSD-3-Clause) MakeGravGridPoint, uruchomione jako osobne programy; progi zarejestrowane z góry w xval/high-degree-gravity/PREREGISTRATION.md (276c869f) i xval/cowell-tesseral-200-orekit/PREREGISTRATION.md (0aa312a6). Orekit zgadza się wszędzie tam, gdzie jest określony, ale pyshtools nie osiąga swojego progu ustalonego z góry w dwóch punktach blisko bieguna (do { "7.3e-10" } m/s^{ "2" }; 50-cyfrowa kontrola mpmath umieszcza błąd w pyshtools), nie ma wartości wyroczni dokładnie na osi biegunowej, a ustalony z góry test kontrolny czułości na stopień 70 dla orbity { "24" } h nie został osiągnięty ({ "0.726" } m wobec > { "1" } m). Każde niespełnienie jest zapisane, a nie wystrojone, więc wiersz pozostaje MODELLED

seg-e81b7418c382 = Integrator DOP853

seg-e6e3638aa68e = Jawna metoda Rungego-Kutty Hairera DOP853 { "8" }({ "5,3" }) ze złożonym estymatorem błędu 5. i 3. rzędu, regulatorem kroku SciPy/Hairera, automatycznym krokiem początkowym, zabezpieczeniem kroku z domyślną odmową i gęstym wyjściem 7. rzędu; wybieralna jako wariant integratora propagatora Dop853 / propagator::propagate_dop853

seg-6ea79a5b89e9 = SciPy { "1.18.1" } (BSD-3-Clause) solve_ivp(method=DOP853) i jego procedury pojedynczego kroku, normy błędu, gęstego wyjścia i kroku początkowego, niezależna implementacja; dokładne stany dwuciałowe z mpmath { "1.3.0" } przy { "40" } cyfrach. Progi zarejestrowane z góry w xval/dop853-scipy/PREREGISTRATION.md (ae1b25e) przed pierwszym porównaniem; wszystkie spełnione (xval/dop853-scipy/RESULTS.md). Pierwszy krok SciPy jest podawany obu solverom w pełnych przebiegach; procedura kroku początkowego jest porównywana osobno. Nie objęte: RKF7({ "8" }), wykrywanie sztywności, lokalizacja zdarzeń

seg-9ad7c1f4da77 = Odporny solver równania Keplera

seg-4b9d812fd13e = Eliptyczny solver Keplera dla wszystkich { "0" } <= e < { "1" } i wszystkich anomalii średnich: sześcienny punkt startowy Markleya ({ "1995" }) i korekta piątego rzędu, reszta bez redukcji cyfr (1-e)E + e(E - sin E) - M oraz strzeżone dopracowanie Newtona (kepler::solve_kepler_markley, propagator::solve_kepler_robust)

seg-6fedaf34608d = mpmath { "1.3.0" } (BSD-3-Clause) 50-cyfrowe pierwiastki z dokładnych wejść binarnych. Progi zarejestrowane z góry w xval/kepler-mpmath/PREREGISTRATION.md (df22174), podane względem |E| z argumentem uwarunkowania e -> { "1" }, M -> { "0" }; wszystkie spełnione (xval/kepler-mpmath/RESULTS.md). Starsze solvery (solve_kepler_checked, orbit::solve_kepler, ephem::solve_kepler) są numerycznie niezmienione, ponieważ zatwierdzone wyniki od nich zależą, i nie są objęte tym wierszem

seg-1960804ef2f4 = Wsadowe wyznaczanie orbity z prędkości radialnej zasięgu i az/el z maskowaniem stacji

seg-4c185244bc66 = Odtworzenie stanu epoki z mieszanych pomiarów zasięgu, prędkości zasięgu i azymutu/elewacji powyżej maski elewacji metodą Gaussa-Newtona na H = (dh/dx(t)) Phi(t, t0): analityczne pochodne cząstkowe pomiarów i wariacyjna macierz przejścia stanu z analitycznymi pochodnymi cząstkowymi dwuciałowymi + J2 (całkowana RK4, a nie STM w postaci zamkniętej)

seg-6c6a42c25433 = Orekit { "12.2" } (Apache-2.0) BatchLSEstimator z własnymi chwilowymi geometrycznymi pomiarami RangeRate i AzEl (porównanymi krzyżowo z TopocentricFrame Orekit), uruchomiony jako osobny program na identycznych zamaskowanych obserwacjach z ziarnem. Progi zarejestrowane z góry w xval/od-measurements-orekit/PREREGISTRATION.md (0cf9076). Każdy próg spełniony oprócz B4, zgodności stanu bez szumu w granicach { "1" } cm, niespełnionego w { "2" } z { "4" } scenariuszy ({ "1.46" }, { "1.74" } cm): własna estymata Orekit bez szumu leży tak daleko od jego symulowanej prawdy (przyczyna po stronie Orekit nie została wyodrębniona). Zapisane i przypięte, więc wiersz pozostaje MODELLED. Nie modelowane: czas światła, aberracja, refrakcja, obrót Ziemi, filtr sekwencyjny dla tych typów pomiarów

seg-bc3d1ee7c639 = Ważenie obserwacji kodami dokładności SP3

seg-63b1fab84f85 = Odwzorowanie kodów dokładności SP3 (nagłówek ++ wykładniki w { "2" }^n mm, podstawa %f, odchylenia standardowe base^n mm dla każdego rekordu) na sigmy położenia dla każdej obserwacji w silniku precyzyjnego wyznaczania orbity (sp3::parse_sp3_accuracy, Sp3Accuracy::position_sigma_m)

seg-ebecb8906506 = Brak zewnętrznego: wagi są wyborem modelowania (format SP3 określa kod tylko jako wskaźnik dokładności producenta; tutaj jest odczytywany jako jedna sigma dla osi). Istniejące zapisane przebiegi agencji są niezmienione

seg-e35df6881c80 = Planetarne pola grawitacyjne z tabel PDS SHADR

seg-f78b73ae8742 = Odczyt tabel harmonik sferycznych PDS SHADR (from_shadr, na SphericalHarmonicField w src/gravity_pds.rs: przeliczenie jednostek, C00 = { "1" } dostarczone, kontrole kompletności i normalizacji) i obliczanie grawitacji w układzie związanym z ciałem dla Marsa GMM-3 (d/o { "120" }) oraz księżycowego pola GRAIL GL0660B (d/o { "660" })

seg-08590d67a7d3 = pyshtools { "4.14.1" } (BSD-3-Clause) czytający te same pliki PDS i obliczający grawitację punktową, uruchomiony jako osobny program, oraz opublikowane nagłówki i etykiety produktów PDS. Progi zarejestrowane z góry w xval/planetary-gravity-pyshtools/PREREGISTRATION.md (32c5b50); wszystkie spełnione (RESULTS.md). Dane: NASA PDS Geosciences Node, domena publiczna; wycinki stopnia 20 dołączone z NOTICE, pełne pliki pobierane w czasie testu

seg-ae3e8833a5ef = Dołączenie opublikowanego pola grawitacyjnego do ciała

seg-ffb2b20e5f32 = with_gravity_field (na Body, w src/gravity_pds.rs): dołącza dowolne wczytane pole harmonik sferycznych (na przykład GMM-3 lub GL0660B) do Body, aby propagator obliczał je w układzie związanym z ciałem; opcjonalne, domyślne ciała niezmienione

seg-bcb731f7a9b5 = Tylko spójność wewnętrzna. Każde opublikowane pole jest zdefiniowane w układzie związanym z ciałem jego producenta (GMM-3 w układzie Marsa Konopliva i in. { "2006" }, GL0660B w układzie osi głównych Księżyca DE421), podczas gdy pole jest obliczane w układzie IAU; przesunięcie nie jest modelowane

seg-659bfeba459c = Wsadowe i sekwencyjne wyznaczanie orbity

seg-dbc98f498941 = Odtworzenie stanu epoki [r,v] z zasięgów ze stacji naziemnych za pomocą wsadowego korektora różnicowego Gaussa–Newtona i filtru sekwencyjnego, w modelu sił dwuciałowym + J2

seg-ecfce82a4e3d = Orekit { "12.2" } (CS GROUP, Apache-2.0) BatchLSEstimator (Levenberg–Marquardt) + KalmanEstimator (EKF) — niezależna biblioteka estymacji innej firmy na dopasowanym modelu sił; odtworzony stan epoki i RMS reszt po dopasowaniu zgadzają się do <{ "1e-3" } m bez szumu i <{ "3" } m przy progu szumu { "5" } m

seg-acdac055acb9 = Solver czasu światła radiometrycznego w głębokim kosmosie

seg-62a478e40850 = Opóźnione (odcinek w dół) jednodrożne rozwiązanie czasu światła τ = |r_rx − r_target(t−τ)|/c dla radiometrycznej nawigacji w głębokim kosmosie (Ziemia→Mars/Słońce/Księżyc)

seg-a38690bb69fa = ANISE { "0.10" } (Nyx Space, MPL-2.0) czas światła z aberracją zbieżnie newtonowską (Aberration::CN; odpowiednik SPICE spkapo) na JPL DE440 — niezależna implementacja SPICE w Ruście; opóźniony solver punktu stałego kshana zgodny poniżej nanosekundy. Szersze wartości Doppler / Shapiro / OD o zredukowanej dynamice pozostają MODELLED

seg-c69ef9342160 = Położenie satelity z efemeryd nadawanych (wielosystemowy RINEX)

seg-62702fc6f242 = Efemerydy nadawane IS-GPS-200 / Galileo-OS / BeiDou-OS: położenie satelity z elementów keplerowskich do ECEF na podstawie sparsowanego rekordu nawigacyjnego RINEX-3

seg-cb66d33b7ba7 = RTKLIB v2.4.2-p13 eph2pos() skompilowany ze źródła C (T. Takasu, BSD-2-Clause) — niezależna implementacja IS-GPS-200/SIS-ICD, zasilona identycznymi rekordami nawigacyjnymi RINEX-3; położenie satelity ECEF zgodne do ~{ "62" } nm. (Interpolacja precyzyjnych efemeryd SP3 jest sprawdzana osobno — zob. „Interpolacja precyzyjnych efemeryd SP3”)

seg-c807a782b20e = Interpolacja precyzyjnych efemeryd SP3

seg-238de70daab9 = Interpolacja Lagrange'a w standardzie IGS dla położeń satelitów z precyzyjnych efemeryd SP3 z poprawką obrotu Ziemi dla każdego węzła (obrót każdego węzła o ω⊕·(t_node−t) do układu związanego z Ziemią w chwili zapytania przed dopasowaniem wielomianu)

seg-e9249ae44a11 = RTKLIB peph2pos() skompilowany ze źródła C (preceph.c; T. Takasu, BSD-2-Clause) — de facto wzorzec IGS, niezależna implementacja; interpolator kshana (niosący teraz tę samą poprawkę obrotu Ziemi dla węzłów) zgodny do ~{ "15" } nm na rzeczywistym produkcie SP3, wobec ~{ "5.5" } cm przed poprawką

seg-9762cf428435 = Kodery komunikatów nawigacyjnych poza GPS LNAV (GPS CNAV, Galileo I/NAV i F/NAV)

seg-9b703b9607d8 = Typy komunikatów GPS CNAV 10/11/30, typy słów Galileo I/NAV 1-5 w nominalnych stronach parzystych/nieparzystych oraz typy stron Galileo F/NAV 1-4: pakowanie pól ICD i kwantyzacja, CRC-24Q, kodowanie splotowe o sprawności 1/2 K={ "7" } (G2 odwrócone dla Galileo), przeplot blokowy i wzorce synchronizacji, z odpowiadającymi dekoderami testowymi

seg-7939b210e83c = Tylko wewnętrzny przebieg w obie strony i znane odpowiedzi ICD; nie uruchomiono żadnego dekodera innej firmy (moduł RTKLIB/GNSS-SDR czytający KSHANA_NAVMSG_ORACLE_JSON jest zależny od danych). MODELLED

seg-5ce7cd3d6011 = Czytnik globalnej mapy jonosfery IONEX i interpolacja na rzeczywistym GIM CODE

seg-502656556ddf = Czytnik IONEX { "1.0" } (nagłówek, wartości I5 o stałych kolumnach, mapy TEC i RMS, epoki bezwzględne, brakujące wartości) z dwuliniową interpolacją przestrzenną, interpolacją czasową formatu metodą najbliższej / kolejnej / obróconej mapy (wzory 1-3) i TEC ukośnym cienkiej powłoki

seg-1575dc4cfb4a = Wydrukowane wartości GIM CODE (dokładne w każdym węźle; mapa jest pobierana w czasie testu, a nie dołączana, ponieważ jej licencja nie jest potwierdzona) oraz niezależna reimplementacja wzorów interpolacji IONEX { "1.0" } w bibliotece standardowej Pythona zatwierdzona razem z danymi testowymi (progi zarejestrowane z góry e4d8b1f, { "1e-9" } TECU). Sprawdzenie innej firmy (B6, zarejestrowane z góry, pierwszy przebieg): RTKLIB v2.4.2-p13 iontec (BSD-2-Clause, uruchomiony jako osobne narzędzie) w { "6885" } punktach zapytania zgadza się z IonexFile::vtec_at do { "3.6e-13" } TECU w obu trybach interpolacji wobec progu { "1e-5" } TECU. Zależne od danych: GIM CODE pobierany w czasie testu, przypięty przez SHA; RTKLIB czyta pełny plik, ponieważ jego getindex odrzuca przycięcie szerokości. tests/fixtures/ionex_code_gim/fetch.sh pobiera go i sprawdza SHA-256, test kończy się niepowodzeniem przy jakichkolwiek innych bajtach, a run_rtklib.sh jest udokumentowaną ścieżką odtworzenia (wymaga dostępu do sieci). Podniesione do VALIDATED decyzją właściciela na podstawie dowodów zależnych od danych (2026-10-13)

seg-974d8c1f7876 = Wygładzanie kodu nośną metodą Hatcha na rzeczywistych obserwacjach RINEX

seg-f26b5da0f52e = Filtr Hatcha bez rozbieżności (kod wolny od jonosfery niesiony przez nośną wolną od jonosfery, okno N epok, restart przy utracie śledzenia, skoku geometry-free lub przerwie) w zestawie precyzyjnego pozycjonowania punktowego

seg-fac84cb9b256 = USTALENIE względem opublikowanej współrzędnej ITRF2020 WTZR: progi zarejestrowane z góry (mediana i p95 po wygładzeniu najwyżej { "0.6" } x surowe; tests/fixtures/gnss_wettzell_2025055/PREREGISTRATION_HATCH.md) nie zostały osiągnięte, stosunki { "0.718" } i { "0.923" }; pozostały błąd rzędu metra ma charakter obciążenia (obciążenie kodu C1C, antena, pływy, wielodrogowość o długim okresie), a nie szumu białego, który wygładzanie usuwa. MODELLED: statystyki filtru są sprawdzane wewnętrznie

seg-2eec513ae8c8 = Podwójne różnice RTK z rozwiązywaniem całkowitoliczbowym LAMBDA na rzeczywistych obserwacjach RINEX

seg-6571676bf918 = Pozycjonowanie względne na krótkiej linii bazowej z rzeczywistego dwuczęstotliwościowego kodu i fazy nośnej GPS: podwójne różnice względem najwyższego satelity z pełną kowariancją, filtr Kalmana float po linii bazowej i niejednoznacznościach pojedynczych różnic z ponowną inicjalizacją po poślizgu, całkowitoliczbowa metoda najmniejszych kwadratów LAMBDA z testem ilorazu oraz linia bazowa uwarunkowana na ustalonych liczbach całkowitych

seg-e50c5d4b65c7 = Opublikowane współrzędne ITRF2020 WTZR i WTZZ (IGN ITRF2020_GNSS.SSC, rozwiązanie { "3" }, z wysokościami anten z RINEX) dające referencyjną linię bazową; progi zarejestrowane z góry w tests/fixtures/gnss_wettzell_2025055/PREREGISTRATION_RTK.md przed napisaniem kodu. Tylko krótka linia bazowa: nie modeluje się podwójnych różnic jonosferycznych ani troposferycznych

seg-f9aa0c529393 = Rozwiązanie czasu zegara odbiornika PPP względem końcowego zegara stacji IGS

seg-83ad9e893db9 = Zegar odbiornika estymowany statycznym filtrem PPP float na rzeczywistym dwuczęstotliwościowym kodzie i fazie GPS z końcowymi orbitami i zegarami IGS: transfer czasu z odbiornika do czasu IGS, rozwiązanie czasu PPP wolne od jonosfery.

seg-91a882dd71e8 = Końcowy połączony zegar IGS dla stacji WTZR (rekordy AR z IGS0OPSFIN_20250550000_01D_05M_CLK, SHA-256 d19f3d45...993d, połączenie rozwiązań sieciowych kilku ośrodków analiz; produkty IGS, swobodne użycie z podaniem źródła); progi zarejestrowane z góry w xval/ppp-time/PREREGISTRATION.md przed jakimkolwiek porównaniem; wszystkie spełnione przy pierwszym przebiegu. CZEGO NIE: jedna stacja i jedno dwugodzinne okno po zbieżności; czas IGS, a nie UTC(k); stałe przesunięcie obejmuje obciążenia kodu odbiornika i jest ograniczone, a nie skalibrowane; brak spójności pomiarowej z Circular T.

seg-a9b2a93401a3 = Precyzyjne pozycjonowanie punktowe float na rzeczywistych obserwacjach RINEX

seg-cc991ccec112 = Statyczny rozszerzony filtr Kalmana PPP float na rzeczywistym dwuczęstotliwościowym kodzie i fazie nośnej GPS z końcowymi orbitami i zegarami IGS: kombinacja wolna od jonosfery, przesunięcia anten satelity i odbiornika (zmiany odbiornika), pływ skorupy ziemskiej, wind-up fazy, opóźnienie Shapiro, estymowane zenitalne opóźnienie wilgotne, niejednoznaczności float dla każdego łuku z detekcją poślizgów geometry-free / Melbourne-Wübbena

seg-36e7c9286af7 = Opublikowana współrzędna ITRF2020 WTZR (IGN ITRF2020_GNSS.SSC, rozwiązanie { "3" }, propagowana z jej prędkością) — progi zarejestrowane z góry w tests/fixtures/gnss_wettzell_2025055/PREREGISTRATION_PPP.md przed napisaniem filtru; rozwój tylko na stacji WTZZ w tym samym miejscu. Nie modelowane: obciążenie oceaniczne, PCV satelity, rozwiązywanie niejednoznaczności całkowitoliczbowych

seg-c8d87abed330 = Odczyt plików nawigacyjnych RINEX { "4" }

seg-28913a01af00 = Pliki nawigacyjne RINEX 4.00-4.02: rekordy <c1/> GPS LNAV, Galileo I/NAV i F/NAV, BeiDou D1/D2 i QZSS LNAV dekodowane do typu efemerydy nadawanej; rekordy CNAV, CNV1-3, FDMA, SBAS, STO, EOP i ION pomijane do następnego nagłówka rekordu; rekord, którego nagłówek wskazuje inny satelita, lub rekord obcięty, jest odrzucany

seg-687b3b159691 = Scalony plik nadawany RINEX { "3" } IGS z tego samego dnia (dane opublikowane, zapisane innym generatorem plików z tych samych komunikatów nadawanych); progi zarejestrowane z góry w tests/fixtures/brdc_rinex4_2026200/PREREGISTRATION.md (7aa264b) przed pierwszym przebiegiem

seg-278ca396127a = Odczyt plików obserwacji RINEX { "4" }

seg-e0883aa933eb = Nagłówki obserwacji RINEX 4.0x (DOI, LICENSE OF USE, STATION INFORMATION, MERGED FILE; etykiety dopasowane w kolumnach 61-80 dla wersji { "4" } i nowszych) oraz rekordy epok

seg-971fb1203a6d = Zgodność formatu na rzeczywistym opublikowanym pliku RINEX { "4.00" } (odczytane wartości są równe wydrukowanym w pliku literałom) i nagłówku wyprowadzonym ze specyfikacji; nie uruchomiono niezależnego czytnika, więc MODELLED

seg-33e5c74720ff = Położenie satelity BeiDou GEO z efemeryd nadawanych

seg-44b61449b65a = BDS-SIS-ICD-B1I v3.0 §{ "5.2.4.12" } położenie satelity geostacjonarnego z efemeryd nadawanych (układ quasi-inercjalny, potem Rz(Ω̇e·tk)·Rx(−{ "5" }°)), opcjonalne przez pole include_beidou_geo w NavParseOptions, więc domyślny czytnik nadal pomija satelity GEO

seg-06d500099814 = Zarejestrowane z góry (7aa264b, 110fef9) względem precyzyjnej orbity IGS MGEX z satelitami GEO; żaden taki produkt nie był osiągalny z sesji, która to zbudowała, więc porównanie oczekuje, a wiersz jest MODELLED (sprawdzone tylko względem opublikowanych nominalnych slotów GEO)

seg-559814996a4c = Interpolacja precyzyjnych zegarów SP3

seg-8e7a0dbd1755 = Przesunięcie zegara satelity między tabelarycznymi węzłami zegara SP3 przez interpolację liniową po dwóch otaczających poprawnych węzłach (schemat RTKLIB pephclk; wartość wskaźnikowa złego zegara pomijana) oraz te same węzły podawane do łańcucha produktów precyzyjnych jako rekordy równoważne zegarowi RINEX

seg-1f4f0f841802 = Końcowa kombinacja zegara satelitów IGS { "30" } s (IGS0OPSFIN 30S CLK, 2025-02-24): opublikowane estymaty zegara w chwilach zapytania, nieinterpolowane z SP3; progi zarejestrowane z góry w tests/fixtures/sp3_clock_igs_oracle/PREREGISTRATION.md przed pierwszym przebiegiem (RMS { "0.15" } ns, p95 { "0.30" } ns, mediana węzłów { "1e-12" } s, rozróżnialność 2x)

seg-71f48628ebb2 = GNSS/INS ściśle sprzężony z fazą nośnej i niejednoznacznościami float

seg-5a156aa81275 = Filtr EKF stanu błędu na { "15" } stanach INS, dwustanowy zegar odbiornika i jedna niejednoznaczność nośnej float na każdego śledzonego satelitę; pseudoodległość, faza nośnej i opcjonalna prędkość zasięgu z konstelacji Walkera SGP4 (czas światła i Sagnac), poprawki Klobuchara i Saastamoinena/Niella stosowane w pętli w położeniu własnym filtru; detekcja poślizgów różnicowaniem czasowym nośnej z progiem dla każdego satelity poszerzanym o niepewność prędkości; ponowna inicjalizacja niejednoznaczności po poślizgach i ponownym nawiązaniu

seg-00576e8c1032 = Spójność wewnętrzna: pomiary są syntetyzowane z modeli używanych przez filtr (χ² NEES po ziarnach, zbieżność bez szumu, wstrzyknięcie poślizgu). MODELLED; nie porównano z rzeczywistymi danymi odbiornika ani filtrem innej firmy

seg-7d644516b1ec = Pakiety GNSS/INS morski, kolejowy i lotniczy z opcją ścisłego sprzężenia

seg-cbb03a8baf73 = Trzy scenariusze gnss-ins na bibliotece trajektorii (statek wężykiem z prędkością { "8" } m/s z pięciominutową przerwą; pociąg przez wykop z dwoma satelitami i tunel; samolot, którego przerwa obejmuje 25-stopniowy zakręt z przechyłem) oraz opcjonalna tabela [tight] pakietu: pseudoodległości z konstelacji Walkera SGP4 łączone przez nawigator w pętli zamkniętej, każdy satelita powyżej maski w stanie nominalnym i najwyższych kilka w stanie pogorszonym

seg-273c14256d4c = Wewnętrznie: wartości wskaźników jakości każdego pakietu względem jego własnej prawdy oraz porównanie luźnego i ścisłego sprzężenia na identycznych danych wejściowych. MODELLED; porównanie NaveGo z audytu nie zostało uruchomione

seg-f4dab73c4eda = Sprzężony filtr PNT z pseudoodległości ze stanem obciążenia i rozszerzeniem 3-D w pakiecie fuzji

seg-742b60089361 = Jeden skumulowany filtr Kalmana po położeniu, prędkości, fazie i częstotliwości zegara zasilany pseudoodległościami, które sprzęgają położenie i zegar (aktualizacje w postaci Josepha niosące kowariancję wzajemną); wariant 1-DOF rozszerzony o stały stan obciążenia akcelerometru, który pakiet fuzji uruchamia pod [coupled]; oraz wersja 3-D z 8 stanami i wierszami wzdłuż linii widzenia

seg-9558d7aad3af = Spójność wewnętrzna: prawda symulowana z własnych modeli filtrów (χ² NEES po ziarnach Monte Carlo, pakiet rozprzężony na identycznych czujnikach). MODELLED

seg-4a64aa1fe3ca = Luźno sprzężony EKF GNSS/INS z ramieniem dźwigni na zbiorze KF-GINS

seg-30f503856ac5 = Pętla zamknięta 15-stanowego EKF stanu błędu sterowana przyrostami IMU z pozycjami anteny GNSS łączonymi przez model ramienia dźwigni H = [I { "0" } −[(C_b^n l_b)×] { "0" } { "0" }], skonfigurowana z pliku YAML KF-GINS (stan początkowy i sigmy, ARW/VRW, obciążenia Gaussa-Markowa)

seg-b01d28a09abe = Opublikowana referencyjna trajektoria zbioru i program KF-GINS w C++ (GPL-3.0, commit 8291a93e, uruchomiony jako osobne narzędzie); progi zarejestrowane z góry w xval/kfgins/PREREGISTRATION.md, a KF-GINS nie był uruchamiany na tych danych przed tą rejestracją (sprawdzone w jego Results). Wszystkie sześć progów spełnionych przy pierwszym przebiegu. ZALEŻNE OD DANYCH: demonstracyjny zbiór KF-GINS (rzeczywiste IMU Leador-A15 i RTK GNSS z trajektorią referencyjną) nie ma licencji, więc nie jest dołączony; xval/kfgins/fetch.sh pobiera go w czasie testu z przypiętym SHA-256 każdego pliku, a test kończy się niepowodzeniem przy niezgodności; ścieżka odtworzenia, wymagająca dostępu do sieci, jest w xval/kfgins/PREREGISTRATION.md. Podniesione do VALIDATED decyzją właściciela na podstawie dowodów zależnych od danych (2026-10-13)

seg-e6b6c605564c = Eksport stanowiska testowego (test bench) czytany przez czytniki plików ruchu symulatora (gps-sdr-sim)

seg-a07429aa1998 = Pliki ruchu z eksportu bench podane własnym czytnikom otwartoźródłowego symulatora GNSS wracają jako wyeksportowana trajektoria: plik NMEA GGA (-g), wycinek czas/szerokość/długość/wysokość z CSV ruchu (-x) i jego wycinek czas/x/y/z (-u), dla { "6" } scenariuszy gnss-ins (w tym pakietów morskiego, kolejowego i lotniczego, czytanych do limitu 3000 próbek symulatora) i { "2" } stacjonarnych. Tylko ruch; żaden sygnał nie jest zapisywany ani generowany.

seg-07b5f46a900f = CO JEST SPRAWDZONE ZEWNĘTRZNIE, w wąskim ujęciu: gps-sdr-sim (MIT, commit 28ca29a6) readNmeaGGA, readUserMotion i readUserMotionLLH z własnym llh2xyz WGS { "84" }, wywoływane przez xval/testbench-gpssdrsim/driver.c (żadna funkcja sygnałowa nie jest wywoływana), względem kolumn związanych z Ziemią w CSV ruchu wiersz po wierszu, z progami zarejestrowanymi z góry w xval/testbench-gpssdrsim/PREREGISTRATION.md przed jakimkolwiek przebiegiem: każda próbka odczytana we wszystkich { "8" } scenariuszach; NMEA w najgorszym przypadku { "1.21" } mm (próg { "1" } cm); wycinek LLH w najgorszym przypadku { "0.145" } mm (próg { "1" } mm); czterokolumnowy wycinek w układzie związanym z Ziemią dokładny (próg { "1" } um, poprawka { "1" }); wiersze gnss-ins na siatce { "10" } Hz symulatora do { "2.3e-13" } s. USTALENIE (przebieg { "1" }, przypięte): pełnoszerokościowy CSV z usuniętym nagłówkiem nie jest czytelny dla -u, ponieważ 100-znakowy bufor linii czytnika dzieli każdy 161-znakowy wiersz na dwie próbki; docs/TEST-BENCH.md podaje wycinek czterokolumnowy. CZEGO NIE: fizyki prawdziwej trajektorii scenariusza; wyjścia sygnałowego gps-sdr-sim; czytnika jakiegokolwiek innego symulatora; jakiegokolwiek odbiornika.

seg-2db2b9dc3b45 = Biblioteka trajektorii GNSS/INS i import prawdy z CSV

seg-e1fe83c75a6c = Wybieralne profile ruchu dla pakietu gnss-ins (prosty, figure-8 (ósemka), miejski z zatrzymaniami, wznoszenie samolotu i skoordynowany zakręt, dron geodezyjny), zdefiniowane przez polecenia prędkości kątów Eulera i przyspieszenia wzdłuż toru zamknięte na stanie prawdy z kinematycznym IMU (człony dośrodkowy, grawitacyjny i Coriolisa) oraz zaimportowana prawda z CSV przekształcona w IMU, które ją odtwarza; historyczny przejazd niezmieniony, gdy nie podano profilu

seg-30ea002a06a0 = Wewnętrznie: tożsamości kinematyki ciała sztywnego, przebieg CSV w obie strony i własna kowariancja filtru. MODELLED (nie porównano z rzeczywistym zapisem jazdy)

seg-8685fd899e3c = Mechanizacja bezwładnościowa INS typu strapdown

seg-ba942e322f8a = Kwaternionowa mechanizacja bezwładnościowa strapdown WGS-84 NED (z kompensacją coning/sculling) propagująca stan nawigacyjny z przyrostów (Δθ, Δv)

seg-5cfcb186d59e = NaveGo v1.4 (R. Gonzalez i in., LGPL-3) uruchomiony w Octave — niezależny opublikowany zestaw narzędzi INS zasilany identycznym strumieniem przyrostów (Δθ,Δv). Orientacja zgodna bit w bit (te same konwencje NED / kwaternion ze skalarem na początku / prędkość obrotu Ziemi / prędkość transportu); prędkość i położenie zgadzają się z dokładnością do dwóch udokumentowanych różnic — członu północnej grawitacji od odchylenia pionu, który NaveGo zawiera, a kshana z założenia pomija (grawitacja według pionu; zgodna ze wzorem zamkniętym Grovesa co do każdej cyfry, z asercją progu rozsądku) — oraz różnic integratora rzędu O(dt²), a nie błędów mechanizacji

seg-d1a5c8e7ca74 = Synteza funkcjonałów pola grawitacyjnego (mapa nawigacji wspomaganej grawitacją / bez GNSS)

seg-8336eb12eb7b = Wielkość grawitacji i zaburzenie (mGal) w harmonikach sferycznych z dowolnego modelu ICGEM .gfc; grawitacja normalna GRS80

seg-b5a7fc986751 = Grawitacja normalna Somigliany GRS80 (Moritz { "1980" }, IAG) + opublikowane γ_e/γ_p; rzeczywiste pole ICGEM EGM2008

seg-86f9186bb884 = NRHO { "9" }:{ "2" } w CR3BP Ziemia–Księżyc względem orbity, którą przeleciał CAPSTONE

seg-d4127cf241f3 = Kołowa ograniczona południowa prawie prostoliniowa orbita halo { "9" }:{ "2" } wokół L2, którą koryguje cr3bp::differential_correct_halo (rodzina orbit Gateway i CAPSTONE), porównana pod względem geometrii średniej (okres, promień perilune, promień apolune) z orbitą, którą CAPSTONE faktycznie przeleciał. Pomiar tego, jak dobrze człon CR3BP opisuje rzeczywistą orbitę; orbita CR3BP nie jest orbitą modelu efemeryd i nie jest porównywana epoka po epoce

seg-e0cc33dfb10b = Zmierzone względem zrekonstruowanych efemeryd CAPSTONE z JPL Horizons (NAIF -1176, CAPSTONE_merged, ICRF związany z Księżycem, 2023-03-01..31 co { "10" } min), zatwierdzone bajt w bajt (tests/fixtures/capstone_horizons/, NOTICE.md), zarejestrowane z góry { "4e868170" } przed pobraniem, jako pomiar z progami dla geometrii średniej. Nie jest to sprawdzenie względem niezależnego wzorca: CR3BP pomija Słońce, mimośród Księżyca i utrzymanie pozycji wykonywane przez CAPSTONE, więc progi opisują, jak reprezentatywna jest orbita modelu, a nie dokładność. Wyniki: docs/design/evidence/cap29d-capstone-nrho/RESULTS.md

seg-c866a5bd4318 = Obrotowe stany CR3BP odwzorowane na ICRF związany z Księżycem na linii Ziemia–Księżyc z DE440

seg-ab90c8689c0f = cr3bp::to_moon_centred_icrf odwzorowuje bezwymiarowy obrotowy stan CR3BP Ziemia–Księżyc na położenie i prędkość w ICRF związanym z Księżycem na chwilowej linii Ziemia–Księżyc (jednostka długości to odległość Ziemia–Księżyc, jednostka czasu to odwrotność prędkości orbitalnej, pełna prędkość kątowa układu łącznie ze składową poza płaszczyzną wynikającą z przyspieszenia Księżyca), z odwrotnością from_moon_centred_icrf, a cr3bp::to_moon_centred_icrf_de440 czyta geocentryczny stan Księżyca z DE440 SPK. Odwzorowuje stany; nie czyni orbity CR3BP orbitą modelu efemeryd

seg-d91ce10ea439 = NAIF SPICE Toolkit (CSPICE N0067 przez spiceypy { "8.3.0" }) sxform dwuwektorowego układu dynamicznego (podstawowy +X wzdłuż położenia Księżyca względem Ziemi, drugorzędny +Y wzdłuż jego prędkości, de440s), zastosowany do wymiarowego stanu obrotowego zbudowanego z własnego stanu Księżyca SPICE, przez osobny program, który nie wywołuje żadnego kodu Kshana (tests/fixtures/cr3bp_to_mci_spice/, NOTICE.md). Zarejestrowane z góry 2313eb1b, zmienione przed jakimkolwiek przebiegiem w d5ef79b3 tak, by uwzględnić prędkość kątową układu poza płaszczyzną (bez niej prędkość byłaby przesunięta nawet o { "8e-2" } m/s). Sprawdzenie samej transformacji w bibliotece. Wyniki: docs/design/evidence/rm34-cr3bp-to-mci/RESULTS.md

seg-d543e3e84f36 = Rodzaj układu Słonecznego na jądrze JPL (planetary_kernel_path)

seg-e8a96f29afc7 = Rodzaj <c1/> z planetary_kernel_path: każde zgłaszane ciało, którego własny kod NAIF zawiera SPK, bierze swoje heliocentryczne położenie i prędkość J2000 z jądra przez własny czytnik silnika (etykieta KERNEL), łącze, którego oba końce są w jądrze, jest obliczane na nim, barycentra nigdy nie zastępują planety, a każde inne ciało pozostaje analityczne z własną etykietą; raport zyskuje blok jądra (ścieżka, SHA-256, ciała i łącza z niego wzięte) tylko wtedy, gdy opcja jest ustawiona. Z de440s.bsp są to Merkury, Wenus, Ziemia i Księżyc

seg-05cc6642285b = NAIF SPICE Toolkit (CSPICE N0067 przez spiceypy { "8.3.0" }) spkezr, heliocentryczne stany na pełnym de440s.bsp, osobny program, który nie wywołuje żadnego kodu Kshana (tests/fixtures/solar_system_kernel/, NOTICE.md); silnik czyta wycinki de440s bit w bit. Zarejestrowane z góry f8e946ea. Sprawdzenie okablowania w bibliotece: sam DE440 i ciała analityczne nie są tu sprawdzane. Wyniki: docs/design/evidence/cap31-solar-system-kernel/RESULTS.md

seg-7f3d53b4e8d1 = Porkchop na efemerydach DE440

seg-bd813d7e0b58 = maneuver::porkchop_kernel: przegląd data startu x data przybycia dla odlotowego C3 (km²/s²) i przybyciowego V-infinity (km/s) jednoobiegowym prograde'owym solverem Lamberta ze strażnikiem współliniowości { "0.5" } deg, na heliocentrycznych stanach J2000 dowolnych dwóch ciał NAIF odczytanych z JPL DE440 SPK własnym czytnikiem crate. Jeden obieg, ruch prograde, bez ograniczeń dotyczących rakiety nośnej ani przybycia: przegląd, a nie projekt misji

seg-bd19ca214f29 = NAIF SPICE Toolkit (CSPICE N0067 przez spiceypy { "8.3.0" }) heliocentryczne stany na de440s.bsp i pykep { "3.0.1" } lambert_problem (ESA, rdzeń C++ kep3, MPL-2.0), niezależny solver Lamberta, uruchomiony jako osobny program, który nie wywołuje żadnego kodu Kshana (tests/fixtures/porkchop_de440/, NOTICE.md); silnik czyta wycinek de440s bit w bit. Zarejestrowane z góry 2d857fb1. Sprawdzenie przeglądu w bibliotece. Wyniki: docs/design/evidence/cap20b-porkchop-de440/RESULTS.md

seg-b1401bed5da8 = Optymalizator transferu impulsowego na efemerydach DE440

seg-eb98d6b8805e = maneuver::optimise_transfer_kernel: daty odlotu i przybycia jednoobiegowego balistycznego transferu dwuimpulsowego, które minimalizują odlotowe C3 lub przybyciowe V-infinity w Type I lub Type II, jako ciągłe optimum (2-dniowa siatka po obu oknach, potem 2-D Nelder-Mead), na heliocentrycznych stanach z DE440 SPK. Optymalizator dat dla jednego odcinka, a nie projekt misji: bez opcji rakiety nośnej, orbity parkingowej, manewru w głębokim kosmosie ani wielu obiegów

seg-6c695aef043b = Niezależny optymalizator: NAIF SPICE Toolkit (CSPICE N0067 przez spiceypy { "8.3.0" }) heliocentryczne stany na tym samym wycinku de440s, pykep { "3.0.1" } lambert_problem (ESA, MPL-2.0) i SciPy { "1.18.1" } Nelder-Mead, bez wywoływania kodu Kshana. Podręcznik NASA Ziemia–Mars (MIDAS, efemerydy nie podano, 2-dniowa siatka dat) jest wtórnym opublikowanym odniesieniem i nie ustala statusu

seg-93f3cdbb7297 = Solver transferu Lamberta z wieloma obiegami

seg-995a6a995b78 = Każde rozwiązanie problemu Lamberta z maksymalnie trzema pełnymi obiegami (maneuver::lambert_multirev: rozwiązanie jednoobiegowe, potem lewa i prawa gałąź każdej liczby obiegów, Izzo { "2015" }), z prędkościami brzegowymi v1 i v2, dla transferów prograde i retrograde, w jednostkach kanonicznych i heliocentrycznych SI, w tym transferów w granicach { "1" } % minimalnego czasu lotu danej liczby obiegów oraz geometrii bliskich 180 deg. Tylko solver dwuciałowy (bez zaburzeń)

seg-77c43836cafe = pykep { "3.0.1" } lambert_problem (ESA, rdzeń C++ kep3, MPL-2.0), niezależna biblioteka, uruchomiona jako osobny program przez scripts/gen_lambert_multirev_ref.py; zatwierdzono tylko jej wynik numeryczny. Zarejestrowane z góry a75de851 (zestaw przypadków, progi, reguła wyniku) przed jakimkolwiek porównaniem; wzorzec został wygenerowany ponownie niezależnie i jest identyczny bajt w bajt. Wyniki: docs/design/evidence/lambert-multirev/RESULTS.md

seg-ff9c6140fe1c = Dwuciałowy solver transferu Lamberta

seg-d8c39ced64b2 = Jednoobiegowy solver Lamberta Izzo-2015 (r1, r2, czas lotu → prędkości brzegowe) dla transferów LEO→GEO→heliocentrycznych, prograde i retrograde

seg-d0470acf4f29 = lamberthub { "1.0.0" } izzo2015 (J. Martínez Garrido, MIT) — niezależny solver Lamberta innej firmy. Jednoobiegowy (M={ "0" }) problem Lamberta ma jedno rozwiązanie, więc zgodność biblioteka–biblioteka jest rzeczywistym sprawdzeniem zewnętrznym; zgodne do <{ "1e-4" } m/s (zaobserwowano ~{ "1e-11" }), tego samego rodzaju sprawdzenie, jakie przechodzi DOP względem gnss_lib_py

seg-347cece5df63 = Układy odniesienia i skale czasu

seg-5a4bc2c15eaa = Precesja-nutacja IAU 2006/2000A, CIO GCRS↔ITRS, skale czasu z sekundami przestępnymi

seg-51d28ab9d256 = Wektory referencyjne IAU SOFA / ERFA; Vallado AIAA 2006-6753 ({ "0.1" }–{ "4" } mm)

seg-c3d4b9bef817 = Dwuczęściowe daty juliańskie i sekundy przestępne na ścieżce czasu orbity okołoziemskiej

seg-5e859e3aa613 = Data kalendarzowa i czas UTC na dwuczęściową juliańską datę UTC z konwencją SOFA dtf2d dla dni kończących się sekundą przestępną (długość { "86 401" } s, { "23" }:{ "59" }:{ "60" }.x poprawne), UTC na TAI i z powrotem oraz UT1 z UTC przez TAI, na dwuczęściowych datach od 1972-01-01: ścieżka czasu, którą przyjmują SGP4 (Sgp4::propagate_at, liczony od dwuczęściowej epoki) oraz obrót związany z Ziemią IAU 2006/2000A (sgp4::teme_to_itrs_matrix_eop z dwuczęściowym kątem obrotu Ziemi)

seg-ec12724c3c04 = pyerfa { "2.0.1.5" } (liberfa { "2.0.1" }, BSD-3-Clause; algorytmy SOFA w wydaniu projektu ERFA), niezależna biblioteka: erfa.dtf2d("UTC"), erfa.utctai i erfa.taiutc na zatwierdzonych chwilach, różnica tworzona część po części na dwuczęściowych datach, próg { "1e-6" } s ustalony przed przebiegiem (zarejestrowane z góry e947e69d). Najgorsza różnica { "9.6e-12" } s (dtf2d) i { "1.9e-11" } s (utctai, taiutc). Każdy dzień UTC potraktowany jako { "86 400" } s lub nieprzeskalowany ułamek dnia przestępnego sprawia, że test czerwienieje. UT1 przez TAI (iauUtcut1) jest sprawdzany przez odcinek ERFA wiersza ścieżki orbity okołoziemskiej. Zakres: UTC od 1972-01-01; wcześniejsze UTC o dryfującej częstotliwości nie jest modelowane

seg-f1c7bc235a6b = Dwuczęściowe daty juliańskie aż do obrotu Ziemi na ścieżce orbity

seg-cee11d4bad08 = Obrót Ziemi z dwuczęściowej daty juliańskiej UT1 na ścieżce orbity, tak aby położenie związane z Ziemią zachowało mikrosekundę, którą traci pojedyncza data f64 (około { "3e-9" } rad w pobliżu { "2020" }): jd2::gmst82 (GMST IAU { "1982" }, konwencja TEME, na dwóch częściach), cio::gcrs_to_itrs_matrix_jd2 (macierz CIO GCRS do ITRS z kątem obrotu Ziemi z dwóch części) oraz, zbudowane na nich i sprawdzone wewnętrznie, frames::teme_to_itrf_jd2 / itrf_to_teme_jd2, orbit::Propagator::position_in_frame_jd2 i own_jd2_utc, opcjonalne two_part_jd scenariusza efemeryd (położenie ECEF, ślad na powierzchni i widok ze stacji; domyślnie wyłączone, bez zmian) oraz bezstratne konwersje From między jd2::Jd2 a timescales::TwoPartJd. Precesja-nutacja i epoka modelu sił Cowella pozostają w pojedynczym f64, gdzie zaokrąglenie { "40" } us jest poniżej { "1e-15" } rad lub znacznie poniżej błędu analitycznych efemeryd Słońca/Księżyca

seg-a658c7b16d6d = pyerfa { "2.0.1.5" } (liberfa { "2.0.1" }, BSD-3-Clause; algorytmy SOFA w wydaniu projektu ERFA), niezależna biblioteka: gmst82 i c2t06a na zatwierdzonych dwuczęściowych datach, ruch bieguna { "0.1" } i { "0.3" } arcsec. Zarejestrowane z góry b10475ee (daty, progi) przed napisaniem funkcji i przed uruchomieniem wyroczni. Testy wewnętrzne (opcja scenariusza, przebieg TEME/ITRF w obie strony, konwersje typów) są pomocniczą samospójnością

seg-096df3971f5f = Macierze układów względem wektorów ERFA: precesja z biasem IAU { "2006" }, TEME do GCRS i łańcuch CIO z przesunięciami bieguna niebieskiego

seg-731a5ed967b3 = Trzy macierze układów porównane element po elemencie lub kątem obrotu z ERFA w dowolnych epokach: precession::precession_matrix (precesja z biasem IAU { "2006" } kątami Fukushimy-Williamsa), nutation::teme_to_gcrs_matrix (obrót TEME do GCRS P^T N^T Rz(-EE) z precesją IAU { "2006" }, nutacją IAU 2000B i równaniem równonocy z jego dwoma wiodącymi członami komplementarnymi) oraz cio::gcrs_to_cirs_matrix_with_offsets (obrót GCRS do CIRS z przesunięciami bieguna niebieskiego IERS dX, dY dodanymi do modelowych X, Y CIP przed obrotem, konwencja SOFA cookbook; nowe). Same wybory modelu (nutacja 2000B na ścieżce TEME, szereg komplementarny z dwoma członami) nie są sprawdzane względem niezależnego wzorca, tylko ich implementacja

seg-411cd8622b4d = pyerfa { "2.0.1.5" } (liberfa { "2.0.1" }, BSD-3-Clause; algorytmy SOFA w wydaniu projektu ERFA), niezależna biblioteka: pmat06; numat(obl06, nut00b) z równaniem równonocy z eect00 (pełny szereg komplementarny), złożone jako P^T N^T Rz(-EE); xys06a, potem c2ixys(X + dX, Y + dY, s). Zarejestrowane z góry 979c1e39 (epoki, przesunięcia i progi) przed uruchomieniem wyroczni. Reszta TEME { "1.1e-10" } rad jest przewidzianym skutkiem zachowania dwóch członów komplementarnych (około { "3" } mm na orbicie GNSS)

seg-4e2fe2e3dabb = UTC sprzed 1972 (era dryfującej częstotliwości) na ścieżce czasu z dwuczęściową datą juliańską

seg-1d086e669f09 = UTC od 1960-01-01 do 1971-12-31, gdy UTC chodziło z przesunięciem częstotliwości względem TAI i było korygowane skokami o ułamki sekundy, na ścieżce dwuczęściowej daty juliańskiej: TAI - UTC z tabeli dryfu każdego okresu (timescales::tai_minus_utc_on_date), data kalendarzowa UTC na dwuczęściową juliańską datę UTC z długością dnia { "86 400" } s + dleap (Jd2::from_utc_calendar), UTC na TAI z ułamkiem dnia przeskalowanym z UTC na sekundy SI (jd2::utc_to_tai) i TAI z powrotem na UTC (jd2::tai_to_utc), zgodnie z SOFA dtf2d, utctai i taiutc. Przed { "1960" } TAI - UTC przyjmuje się jako { "0" } (wartość SOFA; UTC nieokreślone) i leży poza twierdzeniem. Oparte na pojedynczym f64 timescales::tai_minus_utc nadal obcina do { "10" } s przed { "1972" } i nie jest objęte

seg-036d5b0b4f51 = pyerfa { "2.0.1.5" } (liberfa { "2.0.1" }, BSD-3-Clause; algorytmy SOFA w wydaniu projektu ERFA), niezależna biblioteka: erfa.dtf2d("UTC"), erfa.utctai i erfa.taiutc na zatwierdzonych chwilach, różnica tworzona część po części. Zarejestrowane z góry 23c40661 (chwile, tolerancja i suma kontrolna { "1972" }+) przed zmianą silnika i przed uruchomieniem wyroczni. Tabela dryfu jest przepisana z tej samej tabeli SOFA iauDat, której używa wyrocznia, więc porównanie obejmuje arytmetykę konwersji (długość dnia, skalowanie UTC na sekundy SI, iterację), a nie samą historyczną tabelę

seg-efacec095051 = Zegar satelity GLONASS z efemeryd nadawanych i propagacja orbity nadawanej

seg-821b9c01b56e = Nadawane przesunięcie zegara satelity GLONASS -tau_n + gamma_n (t - t_b) w chwili odczytanej na zegarze satelity (glonass::GlonassEphemeris::sv_clock_bias_s, przesunięcie poprawione o obciążenie zegara dwiema iteracjami punktu stałego) oraz położenie PZ-90 związane z Ziemią nadawanego wektora stanu propagowanego RK4 przez równania ruchu z ICD GLONASS w granicach +/-15 min od epoki odniesienia (GlonassEphemeris::position_ecef), z rzeczywistych rekordów nawigacyjnych GLONASS RINEX { "3" }. Nie stosuje się transformacji PZ-90.11 do ITRF (zgadzają się na poziomie centymetra od { "2014" }; RTKLIB też jej nie stosuje). Nie podłączone do wyniku żadnego scenariusza: funkcja biblioteczna

seg-4478a2518341 = RTKLIB v2.4.2-p13 (T. Takasu, BSD-2-Clause, commit 71db0ffa) geph2clk i geph2pos, skompilowane ze źródła C w osobnym module (xval/rtklib-glonass), który czyta ten sam plik RINEX własnym czytnikiem RTKLIB, więc porównywane są też parsowanie, znak -tau_n, jednostki i iteracja, a nie tylko zegar i orbita. Zarejestrowane z góry e099c42a przed istnieniem funkcji i przed zbudowaniem modułu. Obie strony obliczają ten sam wzór zamknięty zegara, więc porównanie zegara obejmuje implementację, a nie wzór. Integratory orbity różnią się (RTKLIB wykonuje kroki { "60" } s, potem resztę, Kshana równe kroki co najwyżej { "60" } s) i różnią się też stałe (RTKLIB mu { "3.9860044e14" }, Kshana PZ-90.11 { "3.986004418e14" }); najgorszy przypadek { "1.1" } mm to ta różnica, jak przewidziano przed przebiegiem. Zakres: efemerydy nadawane w ich przedziale ważności, a nie prawdziwa orbita ani zegar (bez porównania z produktami precyzyjnymi)

seg-d3b72a6fbb18 = Jedna ścieżka orbity okołoziemskiej: zestawy elementów SGP4 do GCRS i ITRS w łańcuchu IAU 2006/2000A z parametrami orientacji Ziemi

seg-e4eca7205b5e = Ścieżka propagacji i układów, którą współdzieli każdy kierowany rodzaj orbity okołoziemskiej: zestaw średnich elementów SGP4 z dwuczęściową epoką UTC (sgp4::MeanElementSet, odczytany z elementów projektu konstelacji przez MeanElementSet::from_earth_fixed) propagowany przez SGP4/SDP4 do TEME (sgp4::SgpOrbit) oraz obroty TEME -> ITRS i GCRS -> ITRS łańcucha IAU 2006/2000A z UT1 - UTC i ruchem bieguna (sgp4::teme_to_itrs_matrix_eop, gcrs_to_itrs_matrix_eop, formy z zerowymi parametrami teme_to_itrs_matrix i gcrs_to_itrs_matrix). TEME to prawdziwy równik daty ze średnią równonocą, osiągany z GCRS przez precesję z biasem IAU { "2006" }, nutację IAU 2000B i równanie równonocy

seg-44f28276f859 = Odcinek { "1" }: python-sgp4 { "2.24" } (licencja MIT; referencyjny SGP4 w C++ D. Vallado, kod, który wytworzył wektory weryfikacyjne AIAA 2006-6753), WGS-72, tryb improved. Odcinek { "2" }: pyerfa { "2.0.1.5" } (ERFA, BSD-3-Clause, procedury SOFA): c2t06a z TT z utctai/taitt i UT1 z utcut1, a dla TEME c2t06a . pnm06a^T . rz(-ee06a). Progi ustalone przed przebiegiem (zarejestrowane z góry 72ea9eb0). Ujawnienie: pierwszy przebieg nie zdał odcinka { "2" } w 2016-12-31T23:{ "59" }:{ "59.5" } o jedną sekundę obrotu (UT1 wzięte z quasi-juliańskiej daty UTC w dniu z sekundą przestępną); silnik poprawiono (jd2::utc_to_ut1), a drugi przebieg zgadza się przy niezmienionych progach. Pominięty ruch bieguna ({ "46" } niepowodzeń) lub stałe WGS-84 zamiast WGS-72 ({ "4432" } niepowodzeń) sprawiają, że test czerwienieje. Ten projekt trzech odcinków zastąpił kompleksowe porównanie z Orekit, które zawiodło na SDP4 Orekit przy e = { "0" } i na jego TEME z IERS { "1996" } (ustalenie pozostaje przypięte w tests/leo_polar_coverage_full_claim_orekit_oracle.rs)

seg-f650a11458b8 = Kompromis projektowy kodów dalmierczych

seg-071e552a7179 = Granice listków bocznych i korelacji wzajemnej m-sekwencji/kodów Golda, długość↔niejednoznaczność

seg-65b7902a2d8f = Opublikowana korelacja wzajemna Golda GPS C/A (−{ "23.9" } dB); granica Golda { "1967" }

seg-5ec4c0730280 = Geometria GNSS / rozmycie dokładności (DOP)

seg-edcd694d2b3c = GDOP/PDOP/HDOP/VDOP/TDOP z geometrii linii widzenia przez Q=(HᵀH)⁻¹ z lokalnym podziałem ENU

seg-cecd882ec4e4 = gnss_lib_py { "1.0.4" } (Stanford NAV Lab) DOP — niezależna biblioteka, zgodność do { "1e-6" } względnie

seg-1a5623c81b48 = Błąd położenia z geometrii: błąd RMS = sigma_UERE x DOP dla rozwiązania metodą najmniejszych kwadratów silnika

seg-7a94b44a8738 = dop_error_mc::run_geometry i check: Monte Carlo z ziarnem (N = { "20,000" } epok na geometrię, sigma = { "1.5" } m, ziarno ChaCha8 { "36" } + i) własnego iterowanego rozwiązania metodą najmniejszych kwadratów silnika (pvt::solve_spp, wagi jednostkowe, rozwiązywane od prawdziwego położenia) na { "8" } geometriach z tests/fixtures/dop/dop_reference.csv, porównujące wariancje błędu wschód, północ, góra i zegara, RMS H/V/P, korelację wschód–północ, błędy średnie oraz odsetek wewnątrz { "95" } % elipsy poziomej z sigma^{ "2" } Q, gdzie Q jest czynnikiem kowariancji jądra orbit::dop (orbit::dop_cofactor, ta sama arytmetyka) dla tej samej geometrii

seg-90f18c774d57 = Spójność wewnętrzna względem wzoru zamkniętego: w liniowym modelu gaussowskim kowariancja metody najmniejszych kwadratów wynosi sigma^{ "2" } (H^T H)^-1 (Kaplan i Hegarty (red.), Understanding GPS: Principles and Applications, 2nd ed., Artech House, { "2006" }, rozdz. { "7" }). Metoda i tolerancje z noty projektowej geometrii { "0.36" }, sekcja { "5.2" }, ustalone w commicie wstępnej rejestracji przed pierwszym przebiegiem: każda wariancja w granicach { "5" } % ({ "5" } błędów standardowych wariancji próbkowej przy N = { "20,000" }), każdy RMS w granicach { "2.5" } %, korelacja wschód–północ w granicach { "0.035" } (5/sqrt(N)), każda średnia w granicach { "5" } błędów standardowych, odsetek w elipsie { "95" } % w granicach { "0.95" } +/- { "0.0077" } ({ "5" } dwumianowych błędów standardowych); negatywne testy kontrolne (PDOP podwojone; błędy rosnące jak 1/sin(elewacja) względem nieważonego Q) muszą zawieść. JAK SIĘ SKŁADA: Q jest czynnikiem kowariancji jądra orbit::dop, VALIDATED względem gnss_lib_py { "1.0.4" } na tych samych { "8" } geometriach w tests/dop_reference.rs (wiersz „Geometria GNSS / rozmycie dokładności”); ten wiersz dodaje krok od tych czynników do metrów przez solver silnika i nie pożycza statusu tamtego wiersza. DLACZEGO MODELLED: nie użyto zewnętrznego zbioru danych; zgodność pokazuje, że estymator i szum realizują sigma x DOP w podręcznikowym modelu, a nie że błąd jakiegokolwiek odbiornika równa się UERE x DOP, a sigma_UERE jest daną wejściową

seg-9acfde1b57f7 = Klasyfikacja zaufania uwzględniająca geometrię: geometria satelitów obok wskaźnika zaufania do odbiornika i klasa przy każdym odjęciu

seg-6138c41e13ff = receiver_trust::geometry: geometria satelitów w każdej epoce (dobra, pogorszona z przyczynami few-satellites/high-pdop/high-hdop/sky-blocked albo nieznana, gdy log nie zawiera GSV, NAV-SAT ani GSA) wyprowadzona z zgłaszanych elewacji i azymutów przez orbit::dop lub wzięta z GSA, z etykietą zawsze podawaną i nigdy nie punktowaną (dobra, średnia, słaba, nieznana) oraz HDOP, PDOP, VDOP, liczbą satelitów i utratą sygnału podanymi słowami; monitor geometrii we wskaźniku statku, który nie odejmuje niczego, dopóki geometria nie jest słaba (stosunek max(hdop/4, pdop/6, 5/n_used) powyżej { "1" }), a potem narasta do limitu { "15" } punktów przy { "1.5" }, którego sama geometria nie może obniżyć poniżej pasma pogorszonego (limit, koniec narastania i dolna granica w [geometry]; bez alarmu); klasa przy każdym odjęciu (geometria, środowisko, niespójność), przy czym utrata śledzenia dla satelitów poniżej { "15" } deg jest klasyfikowana jako geometria, satelity w zasięgu, ale niezśledzone, jako środowisko, a odjęcie za słabą geometrię, którego podany HDOP wykracza poza max({ "1.0" }, { "25" } % wyprowadzonego HDOP) od podanego nieba, jako niespójność

seg-6987737c5fe4 = Spójność wewnętrzna: klasyfikacja jest sprawdzana względem reguł, które podaje, oraz ręcznie wyprowadzonych stosunków na syntetycznych edycjach zatwierdzonego logu demonstracyjnego, a przypięcia braku zmian utrzymują wyniki { "0.35.0" }: żaden wskaźnik się nie zmienia, chyba że geometria jest słaba; etykieta jest zawsze podawana. DLACZEGO MODELLED: progi są wybrane, a nie dopasowane (pochodzenie w geometry_model każdego przebiegu; wartości IEC 61108-1 i GPS SPS jak cytowane, do sprawdzenia względem tekstu norm), a nie ma zewnętrznego oznaczonego zbioru danych naturalnego pogorszenia geometrii na tle ataków, względem którego można by sprawdzić klasyfikację. Wyprowadzony DOP wykorzystuje jądro orbit::dop, VALIDATED względem gnss_lib_py, którego statusu ten wiersz nie pożycza. Klasa geometrii jest stwierdzeniem o niebie, a nie ustaleniem, że nie wystąpił atak

seg-540420863a5a = Nadawany model jonosfery (Klobuchar, IS-GPS-200)

seg-fd157c537502 = Ukośne opóźnienie grupowe jonosfery Klobuchara dla jednej częstotliwości L1 z ośmiu nadawanych współczynników α/β

seg-0b0b02e8b0b8 = RTKLIB ionmodel (tomojitakasu/RTKLIB, src/rtkcmn.c) — niezależna implementacja referencyjna skompilowana ze źródła; zgodna do < { "1e-4" } m

seg-0af6b1a073ce = Statystyczne jądro integralności RAIM/ARAIM (prawa χ² / niecentralnego χ² / normalne)

seg-224a6c4200cd = Rdzeń rozkładowy, na którym opiera się każdy poziom ochrony: próg detekcji uszkodzeń migawkowych χ²₁₋ₚfₐ(dof), niecentralność niewykrytego zdarzenia pbias=√λ oraz mnożniki rozdzielenia rozwiązań K_fa/K_md/K_V

seg-49f7d0c26e0a = SciPy { "1.17.0" } (scipy.stats.chi2/.norm/.ncx2 + optimize.brentq) — niezależna biblioteka (Cephes/Boost), inny algorytm niż szereg niepełnej gamma w Kshana; zgodna do ≤{ "1e-6" } względnie. Tylko jądro. *Alokacja* budżetu P_HMI ARAIM MHSS nie jest już pozbawiona opublikowanej wyroczni numerycznej — własny przykład obliczeniowy podgrupy technicznej ARAIM WG-C wspiera teraz osobny wiersz „Poziomy ochrony ARAIM MHSS względem opublikowanych wektorów referencyjnych”, zgodny przy własnym TOL_PL = { "5e-2" } m wzorca — więc zakresem tego wiersza jest jądro statystyczne, a alokację niesie tamten wiersz (zob. docs/ARAIM_REFERENCE.md)

seg-03578217425f = Poziom ochrony SBAS (HPL/VPL DO-229E metodą ważonych najmniejszych kwadratów)

seg-df640d6c7a5d = Poziomy ochrony DO-229E Appendix J metodą ważonych najmniejszych kwadratów: D=(GᵀWG)⁻¹ z elewacji/azymutu każdego satelity i budżetu błędów, wielka półoś elipsy błędu poziomego i pionowe σ, skalowane opublikowanymi współczynnikami K

seg-39aed7b4bffd = Fork RTKLIB SBAS-PL — zsiki/rtklib_ws waasprotlevels() (Siki i Takács { "2017" }, „DO-229D Appendix J”), uruchomiony przez rnx2rtkp -ws na rzeczywistych komunikatach EGNOS GEO-PRN120 + rzeczywistym RINEX BUTE/Budapeszt; niezależna implementacja innej firmy, HPL zgodny do < { "2e-3" } m. gLAB { "v6.0.0" } (core/filter.c) potwierdził identyczną konwencję. Obie wyrocznie zaokrąglają K_V→{ "5.33" } wobec dokładnego Φ⁻¹({ "1" }−{ "5e-8" })={ "5.3267" } w Kshana (~{ "0.06" }%), więc wartość pionowa jest sprawdzana jako wolne od współczynnika K d_U

seg-8f32eb9c8167 = Miary oceny detektora ML (ROC/AUC/macierz pomyłek/Pfa-Pmd)

seg-b0d8e1b45bf9 = AUC (Mann-Whitney, remisy ½), macierz pomyłek przy progu, P_d/P_md/P_fa/precyzja/trafność/F1

seg-d87c8bae7c5e = scikit-learn { "1.9.0" } (Pedregosa i in., JMLR { "2011" }) — niezależna biblioteka, dokładna zgodność

seg-e7af87ce5e72 = Ocena detekcji anomalii na rzeczywistej telemetrii statku kosmicznego

seg-9659b33fca5b = ROC AUC + przedział ufności bootstrap rozdzielający rzeczywiste oznaczone anomalie; przejrzysty detektor (odtwarza etykiety)

seg-b4ed67ce7e7e = scikit-learn roc_auc_score na podziale testowym OPSSAT-AD (Ruszczak i in. { "2025" }, CC BY { "4.0" }) — rzeczywista telemetria OPS-SAT

seg-5c3f1057c6cc = Numeryczne jądra kompromisu kwantowego (NNLS / pasma χ² / Q van Loana)

seg-f82113ccb30b = Dopasowanie NNLS zmierzonego ADEV, pasma spójności NEES/NIS χ² oraz dyskretna kowariancja szumu procesu zegara wg van Loana (przebieg bez wspomagania w holdover) — kręgosłup obliczeniowy silnika porównań

seg-823da1deb3af = scipy { "1.17.1" } — optimize.nnls / stats.chi2.ppf / linalg.expm; NNLS+Q dokładnie, χ² <{ "5e-4" } przy roboczych stopniach swobody. Tylko jądra — wartości wydajności urządzeń pozostają obliczone z modelu (następny wiersz)

seg-6f3099e7562c = Geomagnetyczne pole odniesienia (synteza IGRF-14)

seg-e9534723cb34 = Synteza w harmonikach sferycznych głównego pola IGRF-14 — składowe X/Y/Z/F, deklinacja i inklinacja — zasilająca warstwę alt-PNT anomalii magnetycznych

seg-b1431734301a = ppigrf { "2.1.0" } (K. M. Laundal, MIT) — czysto pythonowa implementacja referencyjna IGRF z IAGA-VMOD, dostarczana z oficjalnymi współczynnikami IGRF14.shc (14. generacja IAGA, Zenodo 10.5281/zenodo.14012302); niezależna baza kodu innej firmy obliczająca jednoznacznie zdefiniowane pole IGRF-14, zgodna na globalnej siatce

seg-cb3fea409de7 = Statystyki detekcji — gaussowskie AUC i minimalne wykrywalne uszkodzenie

seg-ca677becb465 = Analityczne dwunormalne ROC AUC = Φ(μ/(σ√{ "2" })) i minimalne wykrywalne uszkodzenie σ·(Φ⁻¹({ "1" }−P_fa)+Φ⁻¹(P_d)) leżące u podstaw kwantowych detektorów uszkodzeń i anomalii

seg-7d296e4199af = scipy { "1.17" } (Cephes ndtr/ndtri) + scikit-learn roc_auc_score (Pedregosa i in., JMLR { "2011" }), obie BSD-3-Clause — niezależne biblioteki obliczające te same jednoznacznie zdefiniowane wielkości ogona gaussowskiego / AUC, zgodne do progu A&S-erf (~{ "7e-8" }). Zbudowana na tym przewaga kwantowa nad klasyczną pozostaje MODELLED

seg-1ed12110fb74 = Jądro statystyk rangowych (Kendall-τ / Dirichlet / percentyl)

seg-0fb003404a5b = Jądra korelacji rangowej i ponownego próbkowania w badaniu niestabilności decyzji dotyczących odporności: Kendall τ-b, średnia Dirichleta, ranking konkurencyjny i przedziały ufności percentylowe

seg-396602ddeef4 = scipy { "1.18" } (stats.kendalltau variant='b', rankdata) + numpy.percentile (BSD-3-Clause) — niezależne implementacje (τ przez sortowanie przez scalanie) jednoznacznie zdefiniowanych statystyk rangowych, zgodne do { "1e-12" }. Zbudowane na tych jądrach badanie niestabilności decyzji pozostaje MODELLED

seg-fdd2ba203d5b = Jądro wyprowadzania priorytetów MCDA (wektor własny AHP / współczynnik spójności)

seg-d01c155fbddf = Wagi priorytetów Analytic Hierarchy Process = znormalizowany główny (Perrona) wektor własny odwrotnie symetrycznej macierzy porównań parami metodą iteracji potęgowej, ze wskaźnikiem spójności i współczynnikiem spójności Saaty'ego oraz bramką akceptacji CR<{ "0.10" }

seg-d1947f2f2b3b = Kanoniczna tabela Random Index Saaty'ego ({ "1980" }) (RI({ "5" })={ "1.12" }) odtworzona dokładnie + SciPy/LAPACK scipy.linalg.eig (BSD-3-Clause) jako niezależny solver wartości własnych obliczający ten sam jednoznacznie zdefiniowany wektor/wartość własną Perrona, zgodne do <{ "1e-9" }. Zbudowana na tym jądrze warstwa decyzyjna Pareto / czułości / MAUT pozostaje MODELLED (agregatory WSM/WPM/TOPSIS/VIKOR/PROMETHEE/ELECTRE są osobno sprawdzone zewnętrznie — zob. wiersze poniżej)

seg-73e933220afb = Jądra ważonej agregacji MCDA (WSM / WPM)

seg-c436cdc991a2 = Weighted Sum Model (addytywny agregat znormalizowany min–max + ranking) i Weighted Product Model (multiplikatywny agregat znormalizowany sumą, odwrotność dla kosztów) — dwa oceniacze wartości w studium kompromisów

seg-1b5b9abcca69 = pymcdm (methods.WSM + normalizations.minmax_normalization; methods.WPM + normalizations.sum_normalization) — niezależna, szeroko używana biblioteka MCDA w Pythonie innej firmy obliczająca te same jednoznacznie zdefiniowane agregaty ważone; zgodne do <{ "1e-9" }. Do ponownego wygenerowania offline przez tests/fixtures/mcda_wsm/ i tests/fixtures/mcda_wpm/. Śmieci na wejściu, śmieci na wyjściu; warstwa czułości/odporności pozostaje MODELLED

seg-f00bdb66a052 = Ranking MCDA wg odległości od ideału (TOPSIS)

seg-631578cb1259 = Technique for Order of Preference by Similarity to Ideal Solution — normalizacja min–max, ważone dodatnie/ujemne rozwiązania idealne, bliskość względna Cᵢ = d⁻/(d⁺+d⁻) i ranking

seg-68265fb0034c = pymcdm methods.TOPSIS + normalizations.minmax_normalization — niezależna biblioteka MCDA innej firmy obliczająca te same jednoznacznie zdefiniowane współczynniki bliskości; zgodne do <{ "1e-9" }. Do ponownego wygenerowania offline przez tests/fixtures/mcda_topsis/generate_topsis_reference.py

seg-ef33d848c985 = Ranking kompromisowy MCDA (VIKOR)

seg-cf879fb770f2 = VlseKriterijumska Optimizacija — użyteczność grupowa Sᵢ, indywidualny żal Rᵢ i indeks kompromisu Qᵢ przy wadze strategii v={ "0.5" }, z rankingiem „mniej znaczy lepiej”
