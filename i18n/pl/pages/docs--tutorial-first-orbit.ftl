# docs--tutorial-first-orbit: translations (pl)

seg-51ae9468b92a = Czym jest ten scenariusz

seg-08f3fdc9252a = Przeczytaj jednowierszowe podsumowanie

seg-def5271a207d = Co przypina test

seg-e5f926d1055b = Pułapki i jednostki

seg-cb457294fc53 = Co dalej

seg-dcb2d0b170c1 = Źródło: <c1/>

seg-f57d8b38bf08 = Samouczek { "1" } — Moja pierwsza orbita: gdzie są satelity GPS

seg-1b9e1178555d = <c1/> · <b>Scenariusz:</b> <c2/> (kopia dydaktyczna: <a1><c3/></a1>) · <b>Poziom trudności:</b> początkujący · <b>~{ "15" } min</b>

seg-d065731294a1 = Na końcu będziesz mieć propagowaną <em>prawdziwą</em> operacyjną konstelację GPS, odczytaną dostępność i geometrię oraz wyeksportowaną tabelę tego, gdzie każdy satelita faktycznie jest w przestrzeni — i będziesz wiedzieć, że ta tabela jest sprawdzona względem zewnętrznego wzorca, a nie względem samej siebie.

seg-b07bb365235d = Satelity GPS mówią użytkownikowi, <em>gdzie jest</em> i <em>która jest godzina</em>. Zanim to nastąpi, trzeba wiedzieć, <b>gdzie są satelity</b> i <b>ile z nich użytkownik widzi</b>. To geometria, a geometria wyznacza dolną granicę dokładności wyznaczenia pozycji (współczynnik DOP, rozmycie dokładności). Ten samouczek:

seg-dec5079e7715 = bierze prawdziwą migawkę <c1/> z Celestrak konstelacji GPS (2021-07-28, { "30" } satelitów, prawdziwe elementy dwuliniowe, TLE),

seg-693859c435d8 = propaguje każdego satelitę sprawdzonym względem zewnętrznego wzorca modelem SGP4/SDP4 (Simplified General Perturbations { "4" } / Simplified Deep-space Perturbations { "4" }),

seg-74b73260c7bc = w każdym kroku czasu ustala, które satelity widzi użytkownik na niskiej orbicie okołoziemskiej (linia widzenia, zasłonięcie przez Ziemię i maska elewacji { "5" }°),

seg-605c40b73e96 = zamienia tę geometrię na <b>PDOP</b> (rozmycie dokładności pozycji) i <b>dokładność pozycji</b> oraz

seg-356e96d219b5 = eksportuje faktyczne położenia satelitów w układzie związanym z Ziemią o środku w Ziemi (ECEF) do pliku SP3 (Standard Product { "3" }, format precyzyjnych orbit Międzynarodowej Służby GNSS, IGS; GNSS to globalny system nawigacji satelitarnej).

seg-ff1666fe175e = Kręgosłup jest taki: <b>TLE → propagacja SGP4 → ECEF dla każdej epoki → widoczność → liczba widocznych satelitów → PDOP → sigma pozycji = PDOP · σ_UERE</b>, gdzie σ_UERE to równoważny błąd zasięgu użytkownika (błąd pomiaru odległości 1-σ dla jednego satelity).

seg-379da723ae57 = Albo otwórz <a1>Studio w przeglądarce</a1> i wybierz scenariusz orbity.

seg-441743833f1e = Przebieg deterministyczny (seed = { "17" }) drukuje:

seg-918a30fea48a = Pole po polu:

seg-375fad797dcf = <b><c1/></b> — 12-znakowy skrót scenariusza. Jest odciskiem dokładnych danych wejściowych (ziarno, progi, parametry modelu, blok TLE). Zmień dowolne wejście, a skrót się zmieni; zachowaj je bez zmian, a odtworzysz przebieg bit w bit. Ten sam skrót jest umieszczony w stopce wykresu i w pliku JSON (JavaScript Object Notation) wyniku.

seg-133711d1ad9f = <b><c1/></b> — na { "361" } kroków czasu użytkownik ma użyteczne rozwiązanie w { "345" } z nich ({ "95.6" } %). Przebieg to przelot { "12" } h ({ "43,200" } s) z krokiem { "120" } s.

seg-a500c0473784 = <b><c1/></b> — najlepsze (najniższe) rozmycie dokładności pozycji w czasie przelotu. PDOP bliski { "1" } to doskonała geometria; im niższy, tym lepiej.

seg-98a24f0170d2 = <b><c1/></b> — najlepsza dokładność pozycji: <b>sigma pozycji = PDOP · σ_UERE</b>. W tym scenariuszu <c2/>, więc te dwie liczby są tu <em>liczbowo równe</em> — ale reguła brzmi PDOP × UERE, <b>a nie</b> „pozycja = PDOP”. Przy UERE { "3" } m sigma pozycji wynosiłaby ~{ "3.2" } m. (Zob. pułapkę na końcu.)

seg-410081c6dcab = Wartości zegara (<c1/>, <c2/>, <c3/>, <c4/>) pojawiają się, ponieważ pakiet orbity niesie też zegar w czasie przelotu; są tematem <a1>Samouczka { "2" }</a1>, a nie tego. (<c5/> pokazuje <c6/>, ponieważ nie skonfigurowano żadnego ataku.)

seg-95ccef0d94ae = Blok geometrii w JSON zawiera liczby źródłowe:

seg-89cb7db9b9eb = Gdzie są satelity? (nagroda)

seg-81678afa0cee = Geometria jest dobra, <em>ponieważ</em> satelity naprawdę są w powłoce GPS. Udowodnij to — wyeksportuj ich położenia w układzie związanym z Ziemią:

seg-1452dfac9e06 = Pierwsze trzy satelity w pierwszym kroku próbkowania, ECEF w km (plik SP3 niesie czwartą kolumnę, zegara, zapisaną jako znacznik „brak wartości” { "999999.999999" }):

seg-4fd0f95da0cf = Weź geocentryczny promień PG01:

seg-cb02d7c01561 = Niecykliczna wyrocznia: czy to naprawdę orbita GPS?

seg-a7c478360464 = Samouczek, który sprawdza silnik względem niego samego, niczego nie dowodzi. Oto zewnętrzna, <em>niecykliczna</em> kotwica dla każdego powyższego twierdzenia.

seg-eec62069a957 = <b>{ "1" }. Satelity leżą na prawdziwej powłoce średniej orbity okołoziemskiej (MEO) GPS.</b> Nominalna półoś wielka GPS wynosi <b>a = { "26,560" } km</b>, wysokość ≈ { "20,180" } km nad średnim promieniem Ziemi { "6,378" } km (IS-GPS-200, specyfikacja interfejsu GPS; GPS Standard Positioning Service (SPS) Performance Standard, Departament Obrony USA (DoD); Misra & Enge, <em>Global Positioning System</em>, wyd. 2). Chwilowy promień PG01 równy <b>{ "26,480.9" } km</b> mieści się w kilkuset km od <c1/> — dokładnie to, co daje rzeczywisty mimośród GPS (~{ "0.005" }–{ "0.02" }). Test <c2/> sprawdza <c3/> względem tej opublikowanej wartości <c4/>, która jest <b>zewnętrzna wobec Kshana</b>.

seg-a052774de08f = <b>{ "2" }. Długość przelotu to jeden obrót GPS.</b> Trzecie prawo Keplera daje okres <c1/> przy <c2/> i <c3/> (World Geodetic System { "1984" }, WGS-84; raport techniczny National Imagery and Mapping Agency NIMA TR8350.2): <c4/>, pół doby gwiazdowej. Czas trwania scenariusza { "43,200" } s („~jeden obrót GPS”) zgadza się z tym z dokładnością lepszą niż { "0.3" } %, a ślad naziemny GPS powtarza się co dobę gwiazdową (dwa obroty), zgodnie z IS-GPS-200.

seg-067fb466e396 = <b>{ "3" }. Propagowane położenia są sprawdzone względem zewnętrznego wzorca, a nie tylko wewnętrznie spójne.</b> Propagator SGP4/SDP4, który wytworzył tę tabelę ECEF, zgadza się ze <b>wszystkimi { "666" } wektorami weryfikacyjnymi AIAA (American Institute of Aeronautics and Astronautics) 2006-6753 z najgorszym przypadkiem { "4.12" } mm</b> (<c1/>, <a1><c2/></a1>) i zgadza się z niezależną biblioteką <c3/> poniżej mikrometra. Wyeksportowana tabela jest więc sprawdzona względem zewnętrznej implementacji wzorcowej, a nie względem własnej arytmetyki Kshana.

seg-652ec3b3d3b8 = <b>Uwaga o datach SP3.</b> Nagłówek epoki SP3 pokazuje zastępczą datę kalendarzową (2000-01-01); propagacja faktycznie rusza od własnej epoki każdego TLE ({ "2021" }). Czytaj tabelę jako „położenia ECEF w pierwszym kroku próbkowania”, a nie „w dniu { "1" } stycznia { "2000" }”.

seg-74dcb96a27a9 = <c1/> zamienia każdą powyższą liczbę w kontrakt CI:

seg-cbad1e83279d = <c1/> — <c2/>, <c3/> (ponieważ <c4/>), <c5/> i podsumowanie zawiera <c6/>.

seg-241d75b1502b = <c1/> — promień PG01 mieści się w paśmie powłoki GPS, sprawdzony względem opublikowanego <c2/>.

seg-34328f4f148b = Jeśli silnik kiedykolwiek przestanie wytwarzać prawdziwą powłokę GPS, kompilacja zrobi się czerwona.

seg-3c23c11911cb = <b>Sigma pozycji to PDOP × UERE, a nie PDOP.</b> Obie są równe <em>tylko dlatego, że</em> tu <c1/>. Zmień UERE, a się rozdzielą.

seg-6bb2f31c15dc = <b>Wartości synchronizacji czasu są w nanosekundach</b>, wartość pozycji w metrach. Nie mieszaj ich.

seg-5bc68d0c144d = <b><c1/> jest skwantowane siatką</b> (dolna granica przy kroku siatki czasu). W tym przelocie użytkownik praktycznie zawsze ma rozwiązanie, więc holdover wynosi { "0" } s (nie ma przerwy do przetrwania) — to <em>dobry</em> przypadek.

seg-9c36a5c64af5 = Zacieśnij lub rozluźnij maskę elewacji (<c1/>) i zobacz, jak zmienia się dostępność — to ćwiczenie poziomu 2.

seg-b0222934237e = Podmień na świeżą migawkę TLE za pomocą <c1/> (poziom 2, „użyj świeżych danych”).

seg-e487166204f8 = Przejdź do <a1>Samouczka { "2" } — Holdover zegara</a1>, gdzie sygnał GNSS jest <em>odebrany</em>, a zegar pokładowy musi dryfować sam.

seg-795315608752 = <s1>Poprzednia</s1>Samouczki

seg-97ca5a3cc77e = <s1>Następna</s1>{ "2" } · Holdover zegara
