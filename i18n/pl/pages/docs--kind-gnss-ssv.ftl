# docs--kind-gnss-ssv: translations (pl)

seg-37d29d8303fe = km

seg-834408a40783 = min

seg-1b94e5a24a2d = Źródło: <c1/>

seg-ee3ecc6e0330 = <c1/> (rodzaj scenariusza)

seg-d07af7221334 = Rodzaj scenariusza silnika v{ $version }, rodzina <a1>Nawigacja użytkowników kosmicznych</a1>. Wyłącznie doradczo: wynik analizy z narzędzia badawczo-inżynieryjnego; nie jest to sprzęt nawigacyjny z zatwierdzeniem typu ani usługa bezpieczeństwa życia. Każda etykieta tutaj pochodzi z silnika lub z macierzy weryfikacji; rodzaj jest MODELLED, chyba że macierz stanowi inaczej (jak zdobywa się etykietę: sekcja Evidence w README).

seg-d6d7bca305dc = MODELLED dostępność GNSS i siła łącza w Space Service Volume i poza nim: dla użytkownika na sferze (globalna powłoka z broszury ICG) lub na keplerowskiej trajektorii (od LEO do transferu księżycowego) liczy, dla każdej konstelacji (GPS, GLONASS, Galileo, BDS, QZSS, NavIC) i dla wszystkich razem, sygnały użyteczne powyżej progu C/N0 - dostępność co najmniej jednego i czterech sygnałów, maksymalny czas przerwy, odbierany C/N0, współczynnik DOP, łącza głównego płata wobec łączy płatów bocznych - z wykresem promieniowania nadajnika z broszury, parametrycznym lub dostarczonym przez użytkownika, opcjonalną jonosferą promienia stycznego, efektami plazmosfery i atmosfery oraz opcjonalnym projektem odbiornika słabych sygnałów; także pokładowy rozszerzony filtr Kalmana GNSS dla statków na orbitach HEO i transferu księżycowego (dynamika orbitalna, ciśnienie promieniowania słonecznego, ciała trzecie, zegar) oraz nawigacja względna formacji wielu statków kosmicznych z pseudoodległości o pojedynczych różnicach. Sprawdzone względem tabel broszury ICG SSV w ramach wstępnej rejestracji (xval/gnss-ssv)

seg-d739ae994bf0 = Jeden przebieg <c1/> podsumowuje się tak: gnss-ssv trajectory { "497" } to { "58622" } km altitude: l1 combined { "1" }+ { "100.0" }% { "4" }+ { "97.4" }% (max outage { "0" } min); l5 combined { "1" }+ { "100.0" }% { "4" }+ { "100.0" }% (max outage { "0" } min)

seg-79d2e350ed73 = Wymagane pola: <c1/>

seg-7fc75803140d = Pola opcjonalne: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>

seg-cebc76420d69 = Przykład <c1/> ustawia między innymi:

seg-ce3b64e8c1f4 = [l1, l5]

seg-8b8f5598c9d7 = [gps, glonass, galileo, bds]

seg-b02a3ef32d54 = HEO, anteny nadirowe o dużym zysku i patchowe zenitalne, parametryczny s

seg-666a68730eaa = [booklet-high-gain-nadir, booklet-patch-zenith]

seg-3421a66993bd = heo

seg-8974ff39f695 = parametric

seg-1d65b71c5de0 = Ten rodzaj stosuje { "5" } dołączonych scenariuszy; pozostałe są w <a1><c1/></a1>.

seg-8ac8f00f6c77 = 1/m^{ "3" }

seg-15ca016a7a4f = Etykieta wyniku (silnika): MODELLED: przegląd geometrii i bilansu łącza. Wzorzec z broszury to płat główny o stałej mocy, wzorzec parametryczny jest reprezentatywnym zastępnikiem, a ośrodek promienia stycznego to prosty, jawnie podany model; nic tutaj nie jest pomiarem sygnału w przestrzeni. Wartości dostępności i przerw podążają za metodą

seg-7dae5e291c8b = Wykres zapisany przez silnik dla scenarios/gnss-ssv-heo.toml, rodzaj gnss-ssv

seg-0aae0574c5e6 = <b>MODELLED</b> Przeglądy dostępności rodzaju <c1/>: dla każdej konstelacji (GPS, GLONASS, Galileo, BDS, QZSS, NavIC) i łącznie, odsetek par (użytkownik, epoka) z co najmniej jednym i z co najmniej czterema sygnałami oraz najdłuższa przerwa, dla użytkownika na sferze

seg-07c94d5ad15c = <b>MODELLED</b> Tryb <c2/> rodzaju <c1/>: dziewięciostanowy rozszerzony filtr Kalmana (położenie, prędkość, bias i dryf zegara odbiornika, skala ciśnienia promieniowania słonecznego) na pseudoodległościach, których dostępność, szum i C/N0 pochodzą z tego samego łącza

seg-41bfe74c6f6f = <b>MODELLED</b> Tryb <c2/> rodzaju <c1/>: dowódca i zastępcy uruchamiają każdy filtr bezwzględny; położenie zastępcy względem dowódcy jest szacowane przez odjęcie estymat bezwzględnych oraz przez filtr względny na pseudoodległościach o pojedynczych różnicach

seg-de9a2a5b5f04 = <b>MODELLED</b> Przeglądy dostępności rodzaju <c1/>: dla każdej konstelacji (GPS, GLONASS, Galileo, BDS, QZSS, NavIC) i łącznie, odsetek par (użytkownik, epoka) z co najmniej. Wyrocznia (ExternalDataset): broszura ICG Space Service Volume (UN OOSA ST/SPACE/75, { "2018" }), sama będąca symulacją, porównana w ramach wstępnej rejestracji złożonej przed przebiegiem (xval/gnss-ssv/PREREGISTRATION.md; wyniki w xval/gnss-ssv/RESULTS.md, przypięte przez tests/ssv_booklet_results.rs, łącznie z chybieniami). Przebieg { "1" } w odczytaniu wstępnie zarejestrowanym: stałe minimalnej mocy promieniowanej i próg księżycowy są spójne (S0, S6: próg spełniony); górny i dolny SSV, próg RF

seg-f0b778c4922a = <b>MODELLED</b> Jonosfera Chapmana, plazmosfera typu Gallaghera i atmosfera neutralna (załamanie refrakcyjne, absorpcja tlenu, defokusacja) całkowane wzdłuż prostej. Wyrocznia (InternalConsistency): zamknięte wzory i opublikowane wielkości w testach (szczyt warstwy Chapmana i ugięcie przy limbie powierzchni, kilka TECU plazmosfery na promieniu GPS–GEO); projekt odbiornika wykorzystuje ponownie modele akwizycji i pętli śledzenia oraz ich testy. Nie porównano z nim żadnych zmierzonych danych sondowania limbu ani odbioru słabych sygnałów

seg-77cef183420e = <b>MODELLED</b> Tryb <c2/> rodzaju <c1/>: dziewięciostanowy rozszerzony filtr Kalmana (położenie, prędkość, bias i dryf zegara odbiornika, skala ciśnienia promieniowania słonecznego. Wyrocznia (InternalConsistency): symulowana prawda względem własnej estymaty filtra (średni znormalizowany kwadrat błędu estymacji spójnego filtra wynosi około { "3" } dla położenia) oraz determinizm przy ustalonym ziarnie (seed). Nie porównano żadnych danych lotniczych ani zarejestrowanych danych GNSS z wysokiej orbity; Słońce i Księżyc to niskoprecyzyjne zastępniki na orbitach kołowych

seg-429e154cd691 = <b>MODELLED</b> Tryb <c2/> rodzaju <c1/>: dowódca i zastępcy uruchamiają każdy filtr bezwzględny; położenie zastępcy względem dowódcy jest szacowane przez odjęcie estymat. Wyrocznia (InternalConsistency): ta sama symulowana prawda co dla filtra bezwzględnego: błąd filtra względnego względem prawdziwego stanu względnego oraz sprawdzenie, że działa co najmniej tak dobrze jak odjęcie dwóch niezależnych rozwiązań bezwzględnych. Nie porównano żadnych danych z lotu formacji

seg-1dd1beb01075 = MODELLED: przegląd geometrii i bilansu łącza. Wzorzec z broszury to płat główny o stałej mocy, wzorzec parametryczny jest reprezentatywnym zastępnikiem, a ośrodek promienia stycznego to prosty, jawnie podany model; nic tutaj nie jest pomiarem sygnału w przestrzeni. Wartości dostępności i przerw podążają za metodą broszury ICG Space Service Volume (UN ST/SPACE/75) i są sprawdzane względem jej tabel w xval/gnss-ssv/. (wynik <c1/>)

seg-e9c2dedbc971 = MODELLED dostępność GNSS i siła łącza w Space Service Volume i poza nim: dla użytkownika na sferze (globalna powłoka z broszury ICG) lub na keplerowskiej trajektorii (od LEO do transferu księżycowego) liczy, dla każdej konstelacji (GPS, GLONASS, Galileo, BDS, QZSS, NavIC) i dla wszystkich razem, sygnały użyteczne powyżej progu C/N0 - dostępność co najmniej jednego i czterech sygnałów, maksymalny czas przerwy, odbierany C/N0, (katalog rodzajów (<c1/>))

seg-3add0e744c54 = MODELLED: wzorzec jest reprezentatywny, nie zmierzony; ośrodek to jawnie podany prosty model (docs/SSV.md). (komentarz w pliku scenariusza, wiersz { "14" })

seg-6b4655dd5270 = Dostępność sygnałów GNSS w Space Service Volume i poza nim, porównana z broszurą ICG SSV, jest MODELLED, nie jest sprawdzona względem niezależnego wzorca: podtwierdzenie jest sprawdzone zewnętrznie, ale cała możliwość składa się z elementów obliczonych na podstawie modelu, więc możliwość pozostaje oznaczona jako obliczona na podstawie modelu. (macierz weryfikacji (docs/MODELLED-RATIONALE.md))

seg-a9e1798308df = Efekty jonosfery promienia stycznego, plazmosfery i atmosfery na sygnały GNSS w ślizgu oraz projekt odbiornika słabych sygnałów w rodzaju <c1/> są MODELLED, nie są sprawdzone względem niezależnego wzorca: sprawdzone względem własnej tożsamości w postaci zamkniętej / analitycznej, wychwytuje błędy transkrypcji i współczynników, ale nie jest zewnętrzną wyrocznią. (macierz weryfikacji (docs/MODELLED-RATIONALE.md))

seg-132be2813c10 = Pokładowy filtr nawigacyjny GNSS dla statków kosmicznych na wysokich orbitach i w transferze księżycowym jest MODELLED, nie jest sprawdzony względem niezależnego wzorca: sprawdzony względem własnej tożsamości w postaci zamkniętej / analitycznej, wychwytuje błędy transkrypcji i współczynników, ale nie jest zewnętrzną wyrocznią. (macierz weryfikacji (docs/MODELLED-RATIONALE.md))

seg-f9405de9adb8 = Nawigacja względna formacji wielu statków kosmicznych na silnie eliptycznej orbicie z GNSS jest MODELLED, nie jest sprawdzona względem niezależnego wzorca: sprawdzona względem własnej tożsamości w postaci zamkniętej / analitycznej, wychwytuje błędy transkrypcji i współczynników, ale nie jest zewnętrzną wyrocznią. (macierz weryfikacji (docs/MODELLED-RATIONALE.md))

seg-4881f925ea7f = Strona rodziny: <a1>Nawigacja użytkowników kosmicznych</a1>

seg-4b72df59b3f9 = Strona tematu: <a1>SSV.md</a1>

seg-c9ac9a99bcbb = <s1>Poprzedni</s1>gnss-sim

seg-9df48482a140 = <s1>Następny</s1>gravity-map
