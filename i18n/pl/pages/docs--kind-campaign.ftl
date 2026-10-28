# docs--kind-campaign: translations (pl)

seg-8784979d6569 = dBW

seg-68a2bcb6eedd = Źródło: <c1/>

seg-24ce6aee5e53 = <c1/> (rodzaj scenariusza)

seg-931a3d27c0f0 = Rodzaj scenariusza silnika v{ $version }, rodzina <a1>Kampanie</a1>. Wyłącznie doradczo: wynik analizy z narzędzia badawczo-inżynieryjnego; nie jest to sprzęt nawigacyjny z zatwierdzeniem typu ani usługa bezpieczeństwa życia. Każda etykieta tutaj pochodzi od silnika lub z macierzy weryfikacji; rodzaj jest MODELLED, o ile macierz nie mówi inaczej (jak zdobywa się etykietę: sekcja Evidence w README).

seg-a07990e776cb = Kampania: istniejące rodzaje scenariuszy złożone w jeden przebieg, z każdą liczbą odczytaną z rzeczywistego przebiegu wskazanego rodzaju. Cztery sekcje, w dowolnej kombinacji. FAZY: łańcuchowa misja na jednej wspólnej osi czasu -- każda faza uruchamia jeden lub więcej scenariuszy (na przykład zagłuszanie, potem spoofing, potem zegar w holdover z bezwładnościowym systemem nawigacji dryfującym obok niego, potem alarm integralności, potem odzyskanie), ich wyniki są odczytywane do nazwanych kanałów (błąd czasu zegara względem jego granicy, stosunek nośnej do gęstości szumu względem progu śledzenia, poziom ochrony względem limitu alarmu, błąd pozycji, liczba śledzonych satelitów, flagi alarmów) przez ustawienie wstępne dla rodzaju lub jawne ścieżki wyników i przepróbkowywane na wspólną siatkę ekstrapolatorem zerowego rzędu, z granicami faz i zdarzeniami; stan jest przekazywany dalej przez carry (kanał jest kontynuowany od wartości końcowej poprzedniej fazy), handoff (liczba z poprzedniej fazy zapisana w scenariuszu tej fazy) i end_at (faza kończy się w czasie obliczonym przez przebieg, na przykład w czasie detekcji monitora spoofingu). PRZEGLĄD: siatka po jednym do trzech kluczy scenariusza z kropkami, dowolnego rodzaju (segment będący liczbą całkowitą indeksuje tablicę tabel, jak w system.2.sisre_m), z metrykami odczytywanymi po ścieżce wyniku i, przy liczbie przebiegów powyżej jednego, zespołem Monte Carlo z ziarnem w każdym węźle. MONTE_CARLO: realizacja k działa przy base_seed + k; każda metryka podaje średnią, odchylenie standardowe, percentyle 5/50/95 metodą najbliższej rangi oraz { "95" }% przedział ufności dla średniej metodą bootstrap ze stałym ziarnem. KOMPOZYCJA: kilka scenariuszy ze wspólnymi wartościami (moc i położenie jednego zagłuszacza zapisane w odbiorniku morskim i drogowym), ze zbiorczym podsumowaniem najlepszego i najgorszego przypadku. Wynik zawiera skrót kampanii, skrót po każdym wyniku składowym oraz wpis jednostek dla każdej emitowanej liczby; eksporty interoperacyjne zapisują każdy scenariusz składowy mający geometrię jako osobny zestaw plików. Tożsamości kompozycji są testowane: kampania jednofazowa odtwarza samodzielny przebieg bit w bit, zespół ze stałym ziarnem jest stabilny bajt po bajcie, a na zegarze z szumem częstotliwości białym średnia zespołu mieści się w podanym przedziale, a rozrzut zgadza się z sqrt(q_wf * tau). MODELLED: addytywne przenoszenie i ekstrapolator zerowego rzędu są wyborami modelowymi, a każda faza nosi etykietę rodzaju, który ją uruchomił.

seg-05e842f80dbb = Jeden przebieg <c1/> podsumowuje się tak: kampania 46aa07cb58fb | Przegląd mocy zagłuszacza: dostępność i J/S względem mocy nadawania | przegląd <c2/>: { "13" } węzłów po [jammer_power] | { "13" } przebiegów składowych (MODELLED)

seg-bf339fa14645 = Pola opcjonalne: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>

seg-abd3eac6da41 = Przykład <c1/> ustawia m.in.:

seg-c4f955d5f506 = dostępność

seg-7bcf77278958 = Tego rodzaju używa { "22" } dołączonych scenariuszy; pozostałe są w <a1><c1/></a1>.

seg-38faa927b2bd = lin

seg-1a33a746eeee = Etykieta wyniku (silnika): kompozycja istniejących rodzajów scenariuszy MODELLED. Każda liczba jest odczytana z rzeczywistego przebiegu wskazanego rodzaju; łańcuchowanie (addytywne przenoszenie kanału przez granicę fazy, ekstrapolator zerowego rzędu na siatkę osi czasu, faza zakończona w obliczonym czasie) jest wyborem modelowym, a każda faza nosi etykietę

seg-b2c7cd1f9712 = Wykres zapisywany przez silnik dla scenarios/campaign-sweep-jammer-power.toml, rodzaj campaign

seg-8d3c1f9f3e9a = <b>MODELLED</b> iq::campaign::detect i uruchamiacz kampanii: opcjonalna tabela [monitors] uruchamia monitory IQ na każdej komórce w jednym przebiegu uruchamiacza. Testy: <a1>iq_campaign.rs</a1>.

seg-7e491ab49c2f = <b>MODELLED</b> iq::campaign::detect (windows, roc) i iq::campaign::report::rocs: każda komórka kampanii z monitorami zachowuje, dla każdego rodzaju alarmu i kanału, maksimum własnej statystyki testowej monitora w każdym podanym oknie zdarzenia (dodatnie) i w t

seg-f21e0ab2ad06 = <b>MODELLED</b> iq::labfit (campaign, cn0, iqfit, iqreport) oraz <c1/> w <c2/>, Python <c3/> i narzędzie MCP labfit (foldery kampanii tylko wewnątrz jego katalogu roboczego): odczytuje folder wyników <c4/> według jego Testy: <a1>iq_labfit_followup.rs</a1>.

seg-f16a176dc1f8 = <b>MODELLED</b> Fazy rodzaju <c1/>: każda faza uruchamia przez run_toml jeden lub więcej scenariuszy istniejących rodzajów, odczytuje ich wyniki do nazwanych kanałów (błąd czasu zegara i jego granica, średni efektywny stosunek nośnej do gęstości szumu i próg śledzenia, v Testy: <a1>campaign_composition_reference.rs</a1>.

seg-be831b52a339 = oraz { "4" } kolejne w macierzy.

seg-cc2ad9e12064 = <b>MODELLED</b> Bilans łącza J/S wynikający z geometrii, C/N₀ przy zagłuszaniu, utrata śledzenia dla każdego satelity. Wyrocznia (InternalConsistency): Równanie bilansu łącza C/N₀ przy zagłuszaniu sprawdzone krzyżowo z niezależnym ponownym wyprowadzeniem w numpy (ta sama postać zamknięta → InternalConsistency) oraz charakteryzacja spadku C/N₀ w rzeczywistym JammerTest-2024. { "0.30" } runda { "2" }, zablokowane (pozostaje MODELLED): zmierzony spadek C/N0 w JammerTest { "2024" } względem prognozy z bilansu łącza (zarejestrowanej z góry 6a66994b, w granicach { "3" } dB) nie został wykonany, ponieważ położenie i skierowanie anteny F8.1 przy

seg-59afd80736c5 = <b>PARTNER</b> Nie zapewnia się — Kshana modeluje osiągi sygnału, a nie sprzęt ładunku użytecznego / anten. Wyrocznia (NoneKind): brak: dyscyplina należąca do partnera, z założenia bez modułu i bez testu

seg-fa3ad6babe54 = <b>MODELLED</b> Przegląd rodzaju <c1/> (jeden do trzech kluczy z kropkami dowolnego rodzaju, na wartościach osi przeglądu ogólnego, opcjonalnie zespół w każdym węźle) i sekcja monte_carlo. Wyrocznia (InternalConsistency): Postać zamknięta błądzenia fazy przy szumie częstotliwości białym, wariancja q_wf tau (NIST Technical Note { "1337" }), dla mechanizmu statystyk, oraz równość bajtowa z przebiegami samodzielnymi dla ziarnowania. Sprawdza arytmetykę zespołu na własnym modelu zegara silnika, a nie na zewnętrznym zbiorze danych

seg-c15b5ac32282 = Kompozycja istniejących rodzajów scenariuszy MODELLED. Każda liczba jest odczytana z rzeczywistego przebiegu wskazanego rodzaju; łańcuchowanie (addytywne przenoszenie kanału przez granicę fazy, ekstrapolator zerowego rzędu na siatkę osi czasu, faza zakończona w obliczonym czasie) jest wyborem modelowym, a każda faza nosi etykietę rodzaju, który ją wytworzył. (wynik <c1/>)

seg-9e33dcc39c27 = MODELLED: addytywne przenoszenie i ekstrapolator zerowego rzędu są wyborami modelowymi, a każda faza nosi etykietę rodzaju, który ją uruchomił. (katalog rodzajów (<c1/>))

seg-adcc6ea59840 = MODELLED: tak jak rodzaj <c1/>. (komentarz w pliku scenariusza, wiersz { "14" })

seg-143f3f1cc521 = Odporność na zagłuszanie przy braku GNSS jest MODELLED, nie jest sprawdzona względem niezależnego wzorca: sprawdzona względem własnej tożsamości w postaci zamkniętej / analitycznej; wychwytuje błędy przepisania i współczynników, ale nie jest zewnętrzną wyrocznią. (macierz weryfikacji (docs/MODELLED-RATIONALE.md))

seg-d1c11e493795 = Przeglądy parametrów i zespoły Monte Carlo z ziarnem dla dowolnego rodzaju scenariusza są MODELLED, nie są sprawdzone względem niezależnego wzorca: sprawdzone względem własnej tożsamości w postaci zamkniętej / analitycznej; wychwytuje błędy przepisania i współczynników, ale nie jest zewnętrzną wyrocznią. (macierz weryfikacji (docs/MODELLED-RATIONALE.md))

seg-edbda7aca5b9 = Strona rodziny: <a1>Kampanie</a1>

seg-cb91473bfdda = Strona tematu: <a1>LEO-PNT.md</a1>

seg-c4ed27a559df = Strona tematu: <a1>RESILIENCE-CROSSWALK.md</a1>

seg-774e035da605 = <s1>Poprzedni</s1>body-pnt

seg-fadd92303a4d = <s1>Następny</s1>cislunar-arc-recovery

seg-a349aa76b0ed = PARTNER
