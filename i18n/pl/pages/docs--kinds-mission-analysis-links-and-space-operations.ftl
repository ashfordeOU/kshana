# docs--kinds-mission-analysis-links-and-space-operations: translations (pl)

seg-6e0cb6acc073 = VALIDATED

seg-b03d56f501c3 = Rodzaj

seg-cb9447893c7f = Jeden satelita nad jedną stacją: dla każdego przejścia odległość ukośna, elewacja i Es/N0 wzdłuż przejścia, MODCOD DVB-S2 wybrany w każdym kroku (progi ETSI EN { "302" } 307-1 Table { "13" } plus margines implementacyjny) oraz wolumen danych, który ACM przenosi względem punktu odniesienia ze stałym kodowaniem, który zamyka się na masce. MODELLED.

seg-046f69293874 = Wykres, który silnik zapisuje dla scenarios/acm-link.toml, rodzaj acm-link

seg-7eff466eb018 = Kontrola orientacji statku kosmicznego: obrót w inercjalnym kierunku wskazywania sztywnego korpusu z trzema lub więcej zrównoważonymi kołami reakcyjnymi ze sprzężeniem zwrotnym MRP (L = -K sigma - P omega), momenty kół o minimalnej normie obcięte do limitu każdego silnika, RK4 z ekstrapolatorem zerowego rzędu; opcjonalnie domknięte na multiplikatywnym EKF z symulowanego żyroskopu (błądzenie losowe kąta i prędkości) i czujnika gwiazd. Podaje czas ustalania, końcowy i szczytowy błąd wskazywania, szczytową prędkość i moment koła, nasyconą frakcję, dryf momentu pędu oraz, z estymatorem, jego błąd orientacji i NEES. Pętla stanu rzeczywistego jest VALIDATED względem Basilisk { "2.9.1" }; estymator jest MODELLED.

seg-08c624d5324d = Wykres zapisywany przez silnik dla scenarios/aocs-slew.toml, rodzaj aocs

seg-0cef33b41040 = Cykl pracy apertur: podział czasu między nawigację a łączność, jaki wynika z planu kontaktów dla puli sterowalnych apertur. Przyjmuje plan kontaktów (listę okien <c1/> aos_s/los_s, każde żądające nawigacji lub łączności — to samo słownictwo aos_s/los_s, które emituje predyktor <c2/>), liczbę apertur oraz POLITYKĘ ARBITRAŻU (domyślnie z priorytetem nawigacji, albo z priorytetem łączności, albo bez wywłaszczania: kto pierwszy, ten pierwszy) i podaje cykl pracy nawigacji, cykl pracy łączności, cykl bezczynności oraz przerwę w obsłudze sesji — czas kontaktu, o który sesja prosiła, a który nie został obsłużony przez żadną aperturę. Dokładne przemiatanie przedziałów po granicach okien, więc stykające się okna nigdy nie konkurują i żadna sekunda apertury nie jest liczona dwa razy; sekundy apertur nawigacyjne, łącznościowe i bezczynne są sumowane niezależnie i domykają się względem apertures*horizon_s. Raport podaje rozstrzygniętą politykę, jej pełną definicję oraz definicje cyklu pracy i przerwy, ponieważ wartość cyklu pracy podana bez polityki arbitrażu nie jest odtwarzalna. Arytmetyka planowania MODELLED: nie nalicza się czasu przeskoku / przestrojenia / zmiany przy zmianie usługi lub sesji przez aperturę, w decyzji nie występuje ilość danych, stan bufora, budżet energii ani domknięcie łącza, a okna kontaktów są danymi wejściowymi — ich geometria jest taka, jaką wytworzyło to, co je wygenerowało. To nie jest produkt do planowania segmentu naziemnego.

seg-a8b38ed8e029 = Wykres zapisywany przez silnik dla scenarios/aperture-duty-cycle.toml, rodzaj aperture-duty-cycle

seg-34d041d6bd9f = Planarne wznoszenie po zakręcie grawitacyjnym wielostopniowego pojazdu nad nieobracającą się kulistą Ziemią przez atmosferę US Standard Atmosphere { "1976" } (pionowy wznios, kopnięcie pochylenia, ciąg wzdłuż prędkości), z całkowaniem strat grawitacyjnych, oporowych, sterowania i przeciwciśnienia oraz sprawdzeniem, czy idealne dv minus straty zgadza się z prędkością po wypaleniu; max-Q, szczytowe przyspieszenie i stan po wypaleniu. MODELLED.

seg-ccf2185b0b5e = Wykres zapisywany przez silnik dla scenarios/ascent-losses.toml, rodzaj ascent-losses

seg-62c0dda9fc56 = Budżet błędu orientacji i wskazywania 3-DOF: najgorszy przypadek momentu zakłócającego od gradientu grawitacji ((3/2)(μ/R³)ΔI) oraz budżet błędu wskazywania metodą pierwiastka z sumy kwadratów dla nazwanych składników 1σ (szum czujników, drgania kół reakcyjnych, termiczne, osiowanie) z wiodącym składnikiem, dla wysokości orbity i rozrzutu bezwładności korpusu. Skalarny budżet AOCS MODELLED — uzupełnienie przed powstaniem sprzętu dla Basilisk/42, a nie symulacja pętli sterowania / 6-DoF / drgań giętnych.

seg-ad0e72e3b688 = Wykres zapisywany przez silnik dla scenarios/attitude-budget.toml, rodzaj attitude-budget

seg-be4e928a5865 = Planowanie kontaktów z naziemnymi stacjami dla kilku satelitów i kilku stacji: widoczne okna dostępu (SGP4, układ związany z Ziemią IAU 2006/2000A, refrakcja ITU-R P.834, czas świetlny), objętość danych ACM DVB-S2 każdego przejścia (progi z tabeli { "13" } ETSI EN { "302" } 307-1) oraz harmonogram bez konfliktów (jeden satelita na antenę z czasem przezbrojenia, jedna stacja na satelitę, dostawa ważona priorytetem z limitem na każdy zaległy zasób) metodą zachłanną o wartości krańcowej, punktem odniesienia „kto pierwszy” i dokładną metodą podziału i ograniczeń na małych zbiorach, z luką optymalności metody zachłannej. MODELLED.

seg-e26b549579e2 = Wykres zapisywany przez silnik dla scenarios/contact-schedule.toml, rodzaj contact-schedule

seg-b843e2e0a4ee = Wejście w atmosferę 3-DoF jako punkt materialny nad obracającą się sferyczną Ziemią lub Marsem (balistyczne lub z siłą nośną przy stałym przechyle), RK4, przez US76, atmosferę wykładniczą lub marsjańską, z konwekcyjnym nagrzewaniem w punkcie stagnacji Suttona-Gravesa (NASA TR R-376): szczytowe opóźnienie, strumień ciepła i ciśnienie dynamiczne, obciążenie cieplne, zasięg poziomy, kontrola energii w układzie wirującym i obok niej postać zamknięta Allena-Eggersa. Szczytowe opóźnienie jest sprawdzone względem opublikowanego nominalnego przebiegu Stardust; nagrzewanie jest MODELLED.

seg-dbb618cd6357 = Wykres zapisywany przez silnik dla scenarios/entry-heating-stardust.toml, rodzaj entry-heating

seg-47b4aea6ed01 = Geometria śladu ładunku obserwacji Ziemi i pokrycia (trójkąt kosmiczny SMAD): kątowy promień Ziemi, szerokość pasa, odległość próbkowania na gruncie w nadirze, maksymalny dostęp poza nadirem, okres kołowy, okres węzłowy J2 i odstęp śladów na równiku z flagą ciągłego pokrycia, dla wysokości orbity, nachylenia (domyślnie heliosynchroniczne) i FOV/IFOV czujnika. Geometria sferycznej Ziemi MODELLED (bez radiometrii/MTF/atmosfery/drgań/odblasku); odstęp węzłów R_e·(ω − Ω̇)·T_nodal z sekularnymi tempami J2 pierwszego rzędu.

seg-c2a8332f2ee2 = Wykres zapisywany przez silnik dla scenarios/eo-coverage.toml, rodzaj eo-coverage

seg-816bd5a5808a = Radiometria i jakość obrazu kamery nadirowej: promieniowanie na aperturze sceny lambertowskiej, równanie kamery, sygnał oraz szum śrutowy/ciemny/odczytu/kwantyzacji i SNR; MTF systemu przy Nyquiście (dyfrakcja x detektor x rozmazanie x drgania), względna odpowiedź krawędziowa z niego wynikająca, Q = lambda F/p oraz NIIRS według GIQE w wersji { "4" } bez kompensacji MTF. MODELLED.

seg-bf7b52f7a01e = Wykres zapisywany przez silnik dla scenarios/eo-radiometry.toml, rodzaj eo-radiometry

seg-7a4e6215a488 = Dwuciałowa geometria startu i wznoszenia: azymut(y) startu (sin Az = cos i / cos lat), minimalna osiągalna inklinacja, prędkość kołowa, wschodni bonus od obrotu Ziemi, Δv zmiany płaszczyzny typu dogleg, gdy inklinacja docelowa jest mniejsza niż szerokość geograficzna miejsca, oraz liczba dobowych okazji startu. MODELLED geometria kulistej Ziemi (bez korekty trójkąta prędkości dla obracającej się Ziemi, bez modelu strat na wznoszenie/opór).

seg-9696283a95ae = Wykres zapisany przez silnik dla scenarios/launch-window.toml, rodzaj launch-window

seg-4e31c8daf798 = Rejestr (ledger)

seg-436e412d99fd = MODELLED { "1" } · VALIDATED { "1" }

seg-69ee217ed8e0 = Źródło: <c1/>

seg-f5091cbeecbf = Analiza misji, łącza i operacje kosmiczne (rodzina rodzajów scenariuszy)

seg-d0eea6d9d1ad = { "14" } rodzajów scenariuszy silnika v{ $version }. Wyłącznie doradczo: wynik analizy z narzędzia badawczo-inżynieryjnego; nie jest to sprzęt nawigacyjny z zatwierdzeniem typu ani usługa bezpieczeństwa życia. Każda etykieta tutaj pochodzi z silnika lub z macierzy weryfikacji; rodzaj ma status MODELLED, chyba że macierz stanowi inaczej (jak zdobywa się etykietę: sekcja Evidence w README).

seg-6481dabc9458 = Strony tematyczne: <a1>ENTRY-EO-ASCENT</a1>, <a2>CONTACT-SCHEDULING</a2>, <a3>AOCS</a3>. Uruchom jeden: <c1/>. Wszystkie rodziny: <a4>KINDS.md</a4>.

seg-d6c5a581ffaf = Arkusz miniatur wykresów zapisywanych przez silnik dla rodzajów z rodziny Analiza misji, łącza i operacje kosmiczne

seg-8d65a4a1948d = Geometria startu i wznoszenia w modelu dwóch ciał: azymut(y) startu (sin Az = cos i / cos lat), minimalna osiągalna inklinacja, prędkość kołowa, wschodni bonus z obrotu Ziemi, Δv zmiany płaszczyzny typu dogleg, gdy cel

seg-dd47e755d262 = Planarne wznoszenie pojazdu wielostopniowego z zakrętem grawitacyjnym nad nieobracającą się sferyczną Ziemią przez Atmosferę Standardową USA { "1976" } (wznoszenie pionowe, kopnięcie pochylenia, ciąg wzdłuż prędkości), z całkowaniem grawitacji

seg-cc88f37328a3 = Korytarz balistycznego wejścia w atmosferę Allena-Eggersa: szczytowe opóźnienie (niezależne od współczynnika balistycznego, V_e^{ "2" } sin/γ//(2eH)), prędkość i wysokość przy szczytowym przeciążeniu oraz prędkość szczytowego nagrzewania, dla prędkości wejścia

seg-8ad7c34d8c25 = Wejście w atmosferę jako punkt materialny o 3 stopniach swobody nad obracającą się sferyczną Ziemią lub Marsem (balistyczne lub z siłą nośną przy stałym przechyleniu), RK4, przez US76, atmosferę wykładniczą lub marsjańską, z Suttonem-Gravesem w punkcie stagnacji

seg-efe896d3f43b = Geometria śladu i pokrycia ładunku obserwacji Ziemi (trójkąt kosmiczny SMAD): kątowy promień Ziemi, szerokość pasa, nadirowy rozmiar próbki terenowej, maksymalny dostęp poza nadirem, okres kołowy, okres węzłowy J2

seg-d3d9652fd8a0 = Radiometria i jakość obrazu obrazującej kamery nadirowej: radiancja lambertowskiej sceny w aperturze, równanie kamery, sygnał oraz szum śrutowy/ciemny/odczytu/kwantyzacji i SNR; MTF systemu przy Nyquiście (dyfrakcja

seg-1940d5c75a98 = Budżet błędu orientacji i wskazywania w 3 stopniach swobody: najgorszy przypadek momentu zaburzenia od gradientu grawitacji ((3/2)(μ/R³)ΔI) oraz budżet błędu wskazywania metodą pierwiastka z sumy kwadratów dla nazwanych składników 1σ (szum czujnika, koło reakcyjne

seg-e00d18fbb52b = Sterowanie orientacją statku kosmicznego: obrót wskazujący inercyjnie sztywnego korpusu z trzema lub więcej wyważonymi kołami reakcyjnymi ze sprzężeniem zwrotnym MRP (L = -K sigma - P omega), momenty kół o minimalnej normie obcięte do każdego

seg-496fa280de7b = Jednokierunkowy budżet łącza według równania łącza CCSDS { "401" } / DSN 810-005: tłumienie w wolnej przestrzeni, C/N₀, Eb/N₀, margines i domknięcie dla EIRP nadawania, G/T odbioru, odległości, szybkości danych i pasma (s/x/ka) względem

seg-f0aca7ea1ffa = Jeden satelita nad jedną stacją: odległość skośna, elewacja i Es/N0 każdego przelotu wzdłuż przelotu, MODCOD DVB-S2 wybrany w każdym kroku (progi ETSI EN { "302" } 307-1 Table { "13" } plus margines implementacyjny)

seg-44c4890ba07e = Planowanie kontaktów naziemnych dla kilku satelitów nad kilkoma stacjami: widoczne okna dostępu (SGP4, układ związany z Ziemią IAU 2006/2000A, refrakcja ITU-R P.834, czas światła), objętość danych DVB-S2 ACM

seg-19ab136e9f9b = Cykl pracy apertury: podział czasu między nawigację a łączność wynikający z planu kontaktów dla puli sterowalnych apertur.

seg-ee0c649ca8b2 = Ramkowanie CCSDS 133.0-B Space Packet Protocol: kodowanie syntetycznego strumienia pakietów TM/TC (6-oktetowy nagłówek główny + pole danych) i raport z dekodowania nagłówka każdego pakietu, łącznej liczby oktetów i dokładnego kodowania↔dekodowania

seg-e561f3a749db = Mostek interoperacyjności CCSDS OEM: import komunikatu Orbit Ephemeris Message wytworzonego przez zewnętrzne narzędzie dynamiki lotu (GMAT/Orekit/STK emitują OEM) i raport jego segmentów/obiektów/układów/zakresu epok oraz

seg-1f074d7beccc = Pola wymagane: brak. Opcjonalne: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>.

seg-8f65824c39c5 = <b>Rejestr (ledger):</b> MODELLED. Pełna strona z danymi wejściowymi, wynikami, dowodami i ograniczeniami: <a1>launch-window</a1>.

seg-2926bde689d3 = Pola wymagane: brak. Opcjonalne: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>.

seg-66f6489411d0 = <b>Rejestr (ledger):</b> MODELLED. Pełna strona z danymi wejściowymi, wynikami, dowodami i ograniczeniami: <a1>ascent-losses</a1>.

seg-481ce1d98bc7 = Pola wymagane: brak. Opcjonalne: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>.

seg-fff98550eb48 = <b>Rejestr (ledger):</b> MODELLED. Pełna strona z danymi wejściowymi, wynikami, dowodami i ograniczeniami: <a1>reentry</a1>.

seg-9cf8d4b6064f = Pola wymagane: brak. Opcjonalne: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>, <c19/>, <c20/>, <c21/>.

seg-84e1bddcbc95 = <b>Rejestr (ledger):</b> MODELLED { "1" } · VALIDATED { "1" }. Pełna strona z danymi wejściowymi, wynikami, dowodami i ograniczeniami: <a1>entry-heating</a1>.

seg-eab43348803e = Pola wymagane: brak. Opcjonalne: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>.

seg-9c6ce756a89a = <b>Rejestr (ledger):</b> VALIDATED. Pełna strona z danymi wejściowymi, wynikami, dowodami i ograniczeniami: <a1>eo-coverage</a1>.

seg-cd84a7bdbe57 = Pola wymagane: brak. Opcjonalne: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>, <c19/>, <c20/>, <c21/>.

seg-320d724ac797 = <b>Rejestr (ledger):</b> MODELLED. Pełna strona z danymi wejściowymi, wynikami, dowodami i ograniczeniami: <a1>eo-radiometry</a1>.

seg-905487bf50f1 = Pola wymagane: brak. Opcjonalne: <c1/>, <c2/>, <c3/>, <c4/>.

seg-14511e367361 = <b>Rejestr (ledger):</b> VALIDATED. Pełna strona z danymi wejściowymi, wynikami, dowodami i ograniczeniami: <a1>attitude-budget</a1>.

seg-540fa1932dad = Pola wymagane: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>. Opcjonalne: <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>.

seg-6d2e9b9ce87f = <b>Rejestr (ledger):</b> MODELLED { "1" } · VALIDATED { "1" }. Pełna strona z danymi wejściowymi, wynikami, dowodami i ograniczeniami: <a1>aocs</a1>.

seg-3345731b5729 = Pola wymagane: brak. Opcjonalne: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>.

seg-f8b896b81014 = <b>Rejestr (ledger):</b> MODELLED { "1" } · VALIDATED { "1" }. Pełna strona z danymi wejściowymi, wynikami, dowodami i ograniczeniami: <a1>link-budget</a1>.

seg-e38e356f4b71 = Pola wymagane: brak. Opcjonalne: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>.

seg-eed876ed5aab = <b>Rejestr (ledger):</b> MODELLED. Pełna strona z danymi wejściowymi, wynikami, dowodami i ograniczeniami: <a1>acm-link</a1>.

seg-5fddd2460fb0 = Pola wymagane: brak. Opcjonalne: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>.

seg-58d00faa1eda = <b>Rejestr (ledger):</b> MODELLED. Pełna strona z danymi wejściowymi, wynikami, dowodami i ograniczeniami: <a1>contact-schedule</a1>.

seg-5d4f6861f301 = Pola wymagane: brak. Opcjonalne: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>.

seg-1e06e06d4325 = <b>Rejestr (ledger):</b> MODELLED. Pełna strona z danymi wejściowymi, wynikami, dowodami i ograniczeniami: <a1>aperture-duty-cycle</a1>.

seg-9bb424e01c84 = Pola wymagane: brak. Opcjonalne: <c1/>, <c2/>, <c3/>, <c4/>.

seg-688071019c9e = <b>Rejestr (ledger):</b> VALIDATED. Pełna strona z danymi wejściowymi, wynikami, dowodami i ograniczeniami: <a1>space-packet</a1>.

seg-03c06f9fdc85 = Pola wymagane: brak. Opcjonalne: <c1/>.

seg-568c484ce9a0 = <b>Rejestr (ledger):</b> VALIDATED. Pełna strona z danymi wejściowymi, wynikami, dowodami i ograniczeniami: <a1>oem-interop</a1>.

seg-41996765fcf1 = <s1>Poprzedni</s1>Księżyc i przestrzeń cislunarna

seg-1951c46fe429 = <s1>Następny</s1>Optyczne PNT
