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
