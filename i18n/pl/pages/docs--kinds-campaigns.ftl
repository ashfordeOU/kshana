# docs--kinds-campaigns: translations (pl)

seg-b03d56f501c3 = Rodzaj

seg-a07990e776cb = Kampania: istniejące rodzaje scenariuszy złożone w jeden przebieg, z każdą liczbą odczytaną z rzeczywistego przebiegu wskazanego rodzaju. Cztery sekcje, w dowolnej kombinacji. FAZY: łańcuchowa misja na jednej wspólnej osi czasu -- każda faza uruchamia jeden lub więcej scenariuszy (na przykład zagłuszanie, potem spoofing, potem zegar w holdover z bezwładnościowym systemem nawigacji dryfującym obok niego, potem alarm integralności, potem odzyskanie), ich wyniki są odczytywane do nazwanych kanałów (błąd czasu zegara względem jego granicy, stosunek nośnej do gęstości szumu względem progu śledzenia, poziom ochrony względem limitu alarmu, błąd pozycji, liczba śledzonych satelitów, flagi alarmów) przez ustawienie wstępne dla rodzaju lub jawne ścieżki wyników i przepróbkowywane na wspólną siatkę ekstrapolatorem zerowego rzędu, z granicami faz i zdarzeniami; stan jest przekazywany dalej przez carry (kanał jest kontynuowany od wartości końcowej poprzedniej fazy), handoff (liczba z poprzedniej fazy zapisana w scenariuszu tej fazy) i end_at (faza kończy się w czasie obliczonym przez przebieg, na przykład w czasie detekcji monitora spoofingu). PRZEGLĄD: siatka po jednym do trzech kluczy scenariusza z kropkami, dowolnego rodzaju (segment będący liczbą całkowitą indeksuje tablicę tabel, jak w system.2.sisre_m), z metrykami odczytywanymi po ścieżce wyniku i, przy liczbie przebiegów powyżej jednego, zespołem Monte Carlo z ziarnem w każdym węźle. MONTE_CARLO: realizacja k działa przy base_seed + k; każda metryka podaje średnią, odchylenie standardowe, percentyle 5/50/95 metodą najbliższej rangi oraz { "95" }% przedział ufności dla średniej metodą bootstrap ze stałym ziarnem. KOMPOZYCJA: kilka scenariuszy ze wspólnymi wartościami (moc i położenie jednego zagłuszacza zapisane w odbiorniku morskim i drogowym), ze zbiorczym podsumowaniem najlepszego i najgorszego przypadku. Wynik zawiera skrót kampanii, skrót po każdym wyniku składowym oraz wpis jednostek dla każdej emitowanej liczby; eksporty interoperacyjne zapisują każdy scenariusz składowy mający geometrię jako osobny zestaw plików. Tożsamości kompozycji są testowane: kampania jednofazowa odtwarza samodzielny przebieg bit w bit, zespół ze stałym ziarnem jest stabilny bajt po bajcie, a na zegarze z szumem częstotliwości białym średnia zespołu mieści się w podanym przedziale, a rozrzut zgadza się z sqrt(q_wf * tau). MODELLED: addytywne przenoszenie i ekstrapolator zerowego rzędu są wyborami modelowymi, a każda faza nosi etykietę rodzaju, który ją uruchomił.

seg-b2c7cd1f9712 = Wykres zapisywany przez silnik dla scenarios/campaign-sweep-jammer-power.toml, rodzaj campaign

seg-ea93f81fa08b = Źródło: <c1/>

seg-7f8e8af56bc0 = Kampanie (rodzina rodzajów scenariuszy)

seg-c8012ee549ea = { "1" } rodzaj scenariusza silnika v{ $version }. Wyłącznie doradczo: wynik analizy z narzędzia badawczo-inżynieryjnego; nie jest to sprzęt nawigacyjny z zatwierdzeniem typu ani usługa bezpieczeństwa życia. Każda etykieta tutaj pochodzi z silnika lub z macierzy weryfikacji; rodzaj ma status MODELLED, chyba że macierz stanowi inaczej (jak zdobywa się etykietę: sekcja Evidence w README).

seg-09ed7c4e175c = Strony tematyczne: <a1>CAMPAIGNS</a1>. Uruchom jeden: <c1/>. Wszystkie rodziny: <a2>KINDS.md</a2>.

seg-b49ec180e810 = Arkusz miniatur wykresów zapisywanych przez silnik dla rodzajów z rodziny Kampanie

seg-4e31c8daf798 = Rejestr (ledger)

seg-b2016159c9d0 = Kampania: istniejące rodzaje scenariuszy złożone w jeden przebieg, z każdą liczbą odczytaną z rzeczywistego przebiegu wskazanego rodzaju.

seg-25148644a262 = Pola wymagane: brak. Opcjonalne: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>.

seg-e0334a6899b6 = <b>Rejestr (ledger):</b> MODELLED. Pełna strona z danymi wejściowymi, wynikami, dowodami i ograniczeniami: <a1>campaign</a1>.

seg-906f63ffbc30 = <s1>Poprzedni</s1>Kodeks postępowania

seg-cdf23ced49bd = <s1>Następny</s1>Zegary, synchronizacja czasu i holdover
