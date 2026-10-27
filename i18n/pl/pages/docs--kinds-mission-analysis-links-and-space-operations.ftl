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
