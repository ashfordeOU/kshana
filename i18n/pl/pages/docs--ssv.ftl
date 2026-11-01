# docs--ssv: translations (pl)

seg-0857a94a948e = Ograniczenia

seg-75c8da01c0f1 = MET

seg-069a652c402e = próg

seg-1f79a5aae6c5 = Dostępność sygnału dla użytkownika na sferze na wysokości { "36000" } km z anteną półsferyczną, z prawdziwego przebiegu silnika v{ $version } na scenarios/gnss-ssv-shell.toml (przebieg zredukowany: { "162" } użytkowników, { "3" } doby, kroki co { "10" } min), przy progu { "20" } dB-Hz. Dla każdej konstelacji i pasma dwa słupki: udział par (użytkownik, epoka) z co najmniej jednym sygnałem i z co najmniej czterema. Łącznie, L1: { "99.4" } % co najmniej jeden, { "73.2" } % co najmniej cztery, najdłuższa przerwa poniżej czterech sygnałów { "160" } min. Łącznie, L5: { "100.0" } % co najmniej jeden, { "99.9" } % co najmniej cztery, najdłuższa przerwa poniżej czterech sygnałów { "20" } min. MODELLED: badanie obliczone na podstawie modelu z podanych danych wejściowych, a nie pomiar i nie twierdzenie o objętości usługi dla żadnego systemu. Zredukowany rozmiar to nie porównanie z broszurą. Wyłącznie doradczo: wynik analizy z narzędzia badawczo-inżynieryjnego; nie jest to sprzęt nawigacyjny z zatwierdzeniem typu ani usługa bezpieczeństwa życia.

seg-92ef8e0b78de = Sygnały wzdłuż jednej wysokiej orbity okołoziemskiej (perygeum { "497" } km, apogeum { "58622" } km, okres { "18.8" } h), z prawdziwego przebiegu silnika v{ $version } na scenarios/gnss-ssv-heo.toml, pasmo L1. Na górze: najlepszy stosunek nośnej do szumu wśród sygnałów w zasięgu, względem progu { "20" } dB-Hz. W środku: liczba sygnałów w zasięgu ze wszystkich konstelacji, od { "4" } do { "55" } wzdłuż próbkowanych punktów. Spośród odebranych łączy { "2252" } przeszło przez listek główny, a { "696" } przez listki boczne, przy użyciu opisanego parametrycznego wzorca zastępczego, a nie zmierzonego wzorca żadnego systemu. Mediana PDOP { "67" }, 95. percentyl { "358" }. MODELLED: badanie obliczone na podstawie modelu z podanych danych wejściowych, a nie pomiar i nie twierdzenie o objętości usługi dla żadnego systemu. Wyłącznie doradczo: wynik analizy z narzędzia badawczo-inżynieryjnego; nie jest to sprzęt nawigacyjny z zatwierdzeniem typu ani usługa bezpieczeństwa życia.

seg-902c5c7da9aa = Pokładowy dziewięciostanowy filtr na transferze z niskiej orbity w stronę Księżyca, z prawdziwego przebiegu silnika v{ $version } na scenarios/gnss-ssv-nav-lunar.toml ({ "289" } epok, narysowano { "13" } punktów). Na osi logarytmicznej prawdziwy błąd pozycji i własna granica jednego sigma filtra względem czasu od początku. Wewnątrz orbit GNSS RMS pozycji wynosi { "1.4" } m; powyżej nich { "90" } m, a błąd końcowy { "184" } m na wysokości { "193,330" } km przy { "1" } pomiarze. Średni znormalizowany kwadrat błędu estymacji w całym przebiegu wynosi { "4.4" } (około { "3" } dla spójnego bloku pozycji). Prawda i filtr dzielą swoje zastępniki Słońca i Księżyca. MODELLED: badanie obliczone na podstawie modelu z podanych danych wejściowych, a nie pomiar i nie twierdzenie o objętości usługi dla żadnego systemu. Wyłącznie doradczo: wynik analizy z narzędzia badawczo-inżynieryjnego; nie jest to sprzęt nawigacyjny z zatwierdzeniem typu ani usługa bezpieczeństwa życia.

seg-9a947b61a4cb = Nawigacja względna { "2" } statków zastępczych wokół głównego na wysokiej orbicie, z prawdziwego przebiegu silnika v{ $version } na scenarios/gnss-ssv-formation-heo.toml ({ "401" } epok). Dla każdego statku zastępczego dwa słupki: RMS pozycji względnej z odjęcia dwóch niezależnych estymat bezwzględnych oraz z filtra względnego na pseudoodległościach pojedynczo różnicowanych. Baza { "0.8" } km: { "5.1" } m i { "1.2" } m. Baza { "2.0" } km: { "4.1" } m i { "2.1" } m. Filtr bezwzględny nie jest tu spójny: średni znormalizowany kwadrat błędu estymacji { "187" } wobec około { "3" } dla filtra spójnego, więc podawana przez niego niepewność jest znacznie za mała. MODELLED: badanie obliczone na podstawie modelu z podanych danych wejściowych, a nie pomiar i nie twierdzenie o objętości usługi dla żadnego systemu. Wyłącznie doradczo: wynik analizy z narzędzia badawczo-inżynieryjnego; nie jest to sprzęt nawigacyjny z zatwierdzeniem typu ani usługa bezpieczeństwa życia.

seg-d76123040989 = Zapisane porównanie modelu dostępności dla użytkowników przestrzeni kosmicznej z publiczną broszurą Space Service Volume, z zatwierdzonych wyników wstępnie zarejestrowanego przebiegu (xval/gnss-ssv/results-run1.json, zapisanych przez przykład ssv_booklet_check silnika v{ $version }). Próg po progu, komórki w granicach tolerancji: S0 { "13" } z { "13" } (MET); S1 { "43" } z { "52" } (NOT MET); S2 { "48" } z { "52" } (NOT MET); S3 { "122" } z { "155" } (NOT MET); S4 { "132" } z { "156" } (NOT MET); S5 { "18" } z { "26" } (NOT MET); S6 { "26" } z { "26" } (MET); S7 { "0" } z { "20" } wzorców paneli (NOT MET). Tylko S0 i S6 są spełnione przy wstępnie zarejestrowanym odczycie. Wariant diagnostyczny, który używa drugich kątów GLONASS z broszury, doprowadza S1, S2 i S4 do każdej komórki, ale nie zastępuje przebiegu zapisanego. Żaden wiersz rejestru nie jest VALIDATED. Wyłącznie doradczo: wynik analizy z narzędzia badawczo-inżynieryjnego; nie jest to sprzęt nawigacyjny z zatwierdzeniem typu ani usługa bezpieczeństwa życia.

seg-74675df154dc = Źródło: <c1/>

seg-ce7ea32e67f1 = GNSS poza konstelacją: rodzaj <c1/>

seg-389cb131fd77 = Wyłącznie doradczo. Wyniki modelowe z podanych danych wejściowych i symulowanej prawdy; nie jest to certyfikacja, wartość zakwalifikowana do lotu ani deklaracja objętości usługi dla jakiegokolwiek systemu. Kshana niczego nie nadaje.

seg-a0011b278269 = Rodzaj <c1/> odpowiada na pytanie: ile sygnałów GNSS może wykorzystać statek kosmiczny znajdujący się ponad orbitami GNSS, wokół nich lub daleko poza nimi, jak silne są te sygnały, jaka jest geometria i co może z nimi zrobić filtr pokładowy? Ma trzy tryby, wybierane tym, którą tabelę zawiera scenariusz: <c2/>, <c3/> lub <c4/> (z opcjonalnym <c5/>).

seg-2e4ac6b7a883 = Status: <b>MODELLED</b>. Przeglądy dostępności są porównywane z broszurą ICG Space Service Volume w ramach wstępnej rejestracji; przed poleganiem na jakiejkolwiek liczbie zob. <a1>co pokazuje porównanie</a1>.

seg-a0ff58bccaa8 = Źródła publiczne

seg-4658268e82e1 = <em>The Interoperable Global Navigation Satellite Systems Space Service Volume</em>, United Nations Office for Outer Space Affairs, ST/SPACE/75 ({ "1" } listopada { "2018" }), opracowana przez International Committee on GNSS (ICG), Working Group B: metoda (załącznik B), elementy orbitalne każdej konstelacji (załącznik C), szerokości wiązek nadawczych i moce (tabele B2, B6, B8, { "4.2" }), anteny użytkownika (tabela B10) oraz opublikowane tabele dostępności. Sama jest symulacją. Pobierana przez <c1/> (przypięty SHA-256), nigdy nie dołączana do repozytorium.

seg-e46d9353e6f3 = U.S. Coast Guard Navigation Center, charakterystyki paneli antenowych GPS Block IIR i IIR-M (Marquis, { "2014" }): zmierzone charakterystyki paneli L1, używane wyłącznie do oceny parametrycznego zastępnika (próg S7). Pobierane, nigdy nie dołączane do repozytorium, bez zatwierdzonych danych charakterystyk.

seg-0a002dc0df64 = Stałe modelu (grawitacja, obrót Ziemi, tłumienie w wolnej przestrzeni, gęstość szumu) są standardowe; prawo gęstości plazmosfery Gallaghera, warstwa Chapmana i profil refrakcyjności radiowej to formy opublikowane, użyte z podanymi prostymi parametrami (zob. <c1/>).

seg-c3c3f63df966 = Tryb shell: globalna miara z broszury

seg-f1e153c95b13 = <c1/> umieszcza użytkownika na sferze (domyślnie wysokość { "36,000" } km z anteną półkulistą skierowaną w nadir, górny SSV; lub { "8,000" } km z anteną dookólną, dolny SSV) na siatce ikosfery o 2,562 punktach i zlicza, w ciągu { "14" } dób w krokach 1-minutowych, udział par (użytkownik, epoka) z co najmniej jednym i co najmniej czterema sygnałami, dla każdej konstelacji i łącznie, oraz najdłuższą przerwę u najgorszego użytkownika. Przegląd używa postaci zamkniętej przedziału widoczności w kącie centralnym (stożek wiązki, zasłonięcie przez Ziemię sferą { "6378" } km plus { "50" } km, półkula użytkownika i limit zasięgu RF) i działa w sekundy w kompilacji release; test własności sprawdza go względem ogólnego predykatu geometrycznego.

seg-3fb4c06c8b3f = Tryb trajectory: wzdłuż orbity

seg-632fedc95af5 = <c1/> prowadzi użytkownika po orbicie keplerowskiej (ustawienie wstępne: <c2/>, <c3/>, <c4/>, <c5/> (tabela { "5.10" } z broszury) lub <c6/>, albo elementy) i podaje, dla każdego pasma i konstelacji, dostępność jednego i czterech sygnałów, czasy przerw, sygnały w widoku, najlepsze C/N0, współczynnik rozmycia dokładności (mediana, 95. percentyl, najgorszy), łącza odbierane przez listek główny i przez listki boczne oraz opcjonalny szereg czasowy i CSV.

seg-7bfd301cd789 = <b>Charakterystyka nadawcza</b> (<c1/>): <c2/> (stała moc wewnątrz referencyjnego kąta od osi), <c3/> (oznaczony zastępnik: { "3" } dB na stopień poza kątem referencyjnym do poziomu { "25" } dB poniżej listka głównego; <b>nie</b> jest to zmierzona charakterystyka żadnego systemu) lub <c4/> (zmierzona charakterystyka dostarczona przez użytkownika: <c5/> lub wbudowane <c6/>; charakterystyki paneli Block IIR/IIR-M można wyodrębnić za pomocą <c7/>).

seg-c1390929d9f2 = <b>Anteny odbiorcze</b>: dookólna, półkulista lub antena o wysokim zysku i antena płaska z tabeli B10 broszury, skierowane w nadir lub zenit; każde łącze używa anteny o wyższym zysku.

seg-fe56ab7a2cac = <b>Ośrodek promienia przy limbie</b> (<c1/>): jonosfera Chapmana, plazmosfera (postać Gallaghera z { "1988" }, plazmopauza przy L = { "4.5" }, zwężana poniżej { "1,500" } km) oraz atmosfera neutralna (załamanie około { "1.33" } stopnia przy powierzchni, absorpcja tlenu, defokusowanie) całkowane wzdłuż prostego promienia. Podaje ukośne TEC, część plazmosferyczną, nadmiarowe opóźnienie, wysokość styczną i łącza utracone przez ślizganie. Całkowanie po prostym promieniu: załamanie jest podawane, a nie iterowane.

seg-1bad91204f6a = <b>Odbiornik słabych sygnałów</b> (<c1/>): całkowanie koherentne i niekoherentne, limit bitu danych, kanały wspomagane i pilotowe, przeszukiwanie Dopplera; próg akwizycji przy podanych prawdopodobieństwach detekcji i fałszywego alarmu oraz progi śledzenia nośnej i kodu zastępują stały próg C/N0 (zakres od { "10" } do { "25" } dB-Hz). Używa ponownie modeli akwizycji i pętli śledzących silnika.

seg-497126fe23e9 = Tryb navigation: filtr pokładowy

seg-af7919ae046e = <c1/> prowadzi statek na wysokiej orbicie lub w transferze księżycowym i uruchamia rozszerzony filtr Kalmana o dziewięciu stanach (położenie, prędkość, błąd i dryf zegara odbiornika, skala ciśnienia promieniowania słonecznego) na pseudoodległościach. Prawdę całkuje się z grawitacją punktu materialnego, J2, perturbacjami od Słońca i Księżyca oraz ciśnieniem promieniowania z walcowym cieniem Ziemi; filtr modeluje grawitację, J2 i ciała trzecie, a ciśnienie promieniowania estymuje. Pseudoodległości pochodzą z tej samej geometrii łączy i progu C/N0 co przeglądy; ich szum rośnie wraz ze spadkiem C/N0; nadmiarowe opóźnienie ośrodka (z <c2/>) jest dodawane i nie jest modelowane przez filtr. Raport oddziela część przebiegu wewnątrz orbit GNSS (poniżej wysokości { "20,000" } km) od części powyżej, podaje najdłuższą przerwę bez pomiaru i średni znormalizowany kwadrat błędu estymacji (około { "3" } dla spójnego bloku położenia). Słońce i Księżyc to kołowe zastępniki o niskiej precyzji.

seg-a515950c13d6 = Tryb formation: nawigacja względna

seg-8d2b72ca56d9 = <c1/> (wymaga <c2/> dla jednostki głównej) dodaje jednostki podległe przesunięte w anomalii prawdziwej. Każdy statek uruchamia filtr bezwzględny; położenie jednostki podległej względem głównej jest estymowane przez odjęcie niezależnych estymat bezwzględnych oraz filtrem względnym na pseudoodległościach różnicowanych pojedynczo dla sygnałów śledzonych przez oba statki. Raport podaje oba wyniki, linię bazową i liczbę sygnałów śledzonych wspólnie.

seg-dc78efcb8bcb = Co pokazuje porównanie z broszurą

seg-643bcfcea515 = Progi wstępnie zarejestrowano (<c1/>, uzupełnienia od { "1" } do { "5" }) przed przebiegiem w pełnym rozmiarze; wyniki w <c2/>, komórki w <c3/>, przypięte przez <c4/>, łącznie z chybieniami.

seg-5498636f8d07 = co

seg-32c0ea7929e2 = przebieg { "1" } (odczyt wstępnie zarejestrowany)

seg-abe521171d2f = wariant z kątem GLONASS (diagnostyczny)

seg-9489ef691574 = minimalna moc promieniowana, { "13" } sygnałów, w granicach { "0.1" } dB

seg-4b7e0252355c = geometria górnego SSV (tabela B4)

seg-e3c870085a6c = NOT MET ({ "43" } z { "52" } komórek)

seg-b57b1f9b0b43 = wszystkie { "52" } komórek w tolerancji

seg-6bf57763d120 = dolny SSV (tabela { "5.2" })

seg-c9349a3a0185 = NOT MET ({ "48" } z { "52" })

seg-056eae8e55d1 = wszystkie { "52" }

seg-805e4402f556 = górny SSV z 15/20/25 dB-Hz (tabela B9)

seg-a8d9a1f66989 = NOT MET ({ "122" } z { "155" })

seg-7a6fd0eb8f77 = { "153" } z { "155" }

seg-cb1a6f558a09 = sześć misji GEO

seg-e4759e8d2baa = NOT MET ({ "132" } z { "156" })

seg-3e59e79791e2 = wszystkie { "156" }

seg-76d88834ab69 = misja HEO

seg-1c06414304a0 = NOT MET ({ "18" } z { "26" })

seg-b1656692859b = { "21" } z { "26" }

seg-d4cedd711485 = misja księżycowa

seg-b52333886109 = NOT MET ({ "23" } z { "26" })

seg-479a041e2b62 = charakterystyka parametryczna względem zmierzonych charakterystyk paneli GPS L1

seg-b514bc035c86 = NOT MET (RMS od { "6.3" } do { "8.8" } dB wobec { "3" } dB)

seg-dd703fdea949 = Broszura jest wewnętrznie niespójna co do referencyjnego kąta od osi dla GLONASS: tabele B2 i B6 podają { "20" } i { "28" } stopni, tabela { "4.2" } podaje { "26" } i { "34" }. Przebieg { "1" } użył pierwszych (tych, które nazwała wstępna rejestracja); prawie każde chybienie w S1 do S5 dotyczy GLONASS. Wariant, zadeklarowany jako diagnostyczny przed jego uruchomieniem, używa drugich, i wtedy górny SSV, dolny SSV i misje GEO zgadzają się komórka po komórce, łącznie z przerwami. Wariant nie zastępuje przebiegu { "1" }. <b>Żaden wiersz nie jest VALIDATED</b>: broszura jest symulacją, reguła werdyktu wymaga S0 do S3 przy odczycie wstępnie zarejestrowanym, a pozostałe chybienia (GPS L1 przy { "20" } dB-Hz, Galileo w HEO, QZSS i NavIC, wiersze GLONASS dla misji księżycowej) nie są wyjaśnione.

seg-6eecf686159b = Uruchamianie

seg-adbb9c22de1c = Każdy dołączony scenariusz jest ograniczony tak, aby działał w sekundy; porównaniem w pełnym rozmiarze jest przykład powyżej. Ten sam rodzaj działa z Pythona (<c1/>), z przeglądarki (WebAssembly), z serwera MCP (<c2/>, tylko tekst wbudowany: <c3/> jest źródłem plikowym i jest odrzucane, należy użyć <c4/>) oraz we wtyczkach.

seg-8fa10c8e7ab7 = MODELLED: nic tutaj nie zostało porównane ze zmierzonym odbiorem GNSS na orbicie. Broszura jest symulacją.

seg-b34e9acebec0 = Keplerowskie orbity dwóch ciał dla konstelacji GNSS i dla użytkownika w przeglądach; transfer księżycowy jest elipsą dwóch ciał, a nie propagowaną trajektorią.

seg-76aa617ba828 = Ośrodek jest podanym prostym modelem z całkowaniem po prostym promieniu; nie jest prognozą pogody kosmicznej.

seg-3114c4249988 = Filtr nawigacyjny jest studium projektowym: bez manewrów, bez orientacji, bez wielodrogowości, a prawda dzieli z filtrem swoje efemerydy Słońca i Księżyca.

seg-2deafc0f9534 = <s1>Poprzednia</s1>Księżycowa stacja referencyjna

seg-23386861eebf = <s1>Następna</s1>Orbita i powierzchnia Księżyca jako infrastruktura
