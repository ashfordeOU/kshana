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
