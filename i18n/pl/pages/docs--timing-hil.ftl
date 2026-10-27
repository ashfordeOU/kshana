# docs--timing-hil: translations (pl)

seg-f8cf777c0caa = Powierzchnie

seg-f2ce7fc60cdf = Format

seg-d00b65801e9b = Krok

seg-0d580ea8043d = Test holdover oceniony na podstawie zapisu błędu czasu, z prawdziwego przebiegu silnika v{ $version } na scenarios/holdover-test-example.toml ({ "601" } próbek co { "5" } s). GNSS jest odłączany przez operatora w { "600" } s i przywracany w { "2400" } s; błąd czasu dryfuje do { "299" } ns na końcu holdover, przekracza budżet { "100" } ns po { "675" } s i wraca do pasma { "100" } ns { "70" } s po przywróceniu. Werdykty: maski bazowe PASS, maski holdover FAIL, obwiednia holdover FAIL, powrót RECOVERED. Zmierzono względem maski, to nie jest zatwierdzenie. Czasy są oświadczeniem operatora, niezweryfikowanym przez Kshana. Wyłącznie doradczo: wynik analizy z narzędzia badawczo-inżynieryjnego; nie jest to sprzęt nawigacyjny z zatwierdzeniem typu ani usługa bezpieczeństwa życia.

seg-7a1246297c82 = Źródło: <c1/>

seg-6ea3dec83080 = Synchronizacja czasu hardware-in-the-loop: odłącz antenę, oceń holdover

seg-5901f0b26939 = Operatorzy telekomunikacyjni i energetyczni testują system synchronizacji, odbierając mu GNSS i obserwując, co robi zegar. Kshana tego za nich nie robi i nie dotyka ich sprzętu. Czyta zapis błędu czasu, który wytworzyły własne przyrządy operatora, dzieli go w dwóch podanych przez operatora chwilach i <b>mierzy każdy krok względem publicznych masek ITU-T</b>. Rodzaj scenariusza to <a1><c1/></a1>; scenariusze przykładowe to <c2/> i <c3/>.

seg-daf4b071bad0 = To <b>etap { "1" }</b> bezpieczeństwa sprzętu: pasywny, tylko odbiór, bez RF z Kshana (<a1><c1/></a1>). Oprogramowanie wyłącznie doradcze, nie jest to sprzęt z zatwierdzeniem typu. Nikt nie ocenił, nie zatwierdził ani nie zweryfikował tej procedury i nic ona nie mówi o tym, czy system spełnia Zalecenie.

seg-da0c48bbe011 = Procedura

seg-e753ca7a1c99 = Operator wykonuje cztery kroki. Kshana nie wykonuje żadnego z nich.

seg-0c338b956741 = Co robi operator

seg-ebd95b343349 = Co pokazuje zapis

seg-03999de98059 = { "1" }. Stan wyjściowy

seg-730f2037d22a = Pozwala systemowi pracować zablokowanemu na GNSS tak długo, jak potrzebuje test (i odnotowuje, przez ile dni był wcześniej zablokowany).

seg-f45aae4139bd = Błąd czasu przy dyscyplinowaniu.

seg-0f050dcede80 = { "2" }. Usunięcie GNSS

seg-50c0df832eda = Odłącza GNSS od badanego systemu, na przykład kabel anteny przy odbiorniku albo wyjście własnego symulatora laboratorium, i <b>zapisuje czas</b>. Najpierw sprawdź instrukcję producenta odbiornika: niektóre odbiorniki zasilają antenę, a niektóre potrzebują terminatora na otwartym porcie.

seg-e371e7e357e3 = Chwila, w której błąd czasu zaczyna dryfować.

seg-f05dc0acb396 = { "3" }. Holdover

seg-a98186503e0f = Pozostawia system na własnym oscylatorze przez zaplanowany czas.

seg-1da66cdca856 = Holdover systemu.

seg-61197c9bad91 = { "4" }. Powrót

seg-75af1f4fec83 = Przywraca GNSS i <b>zapisuje czas</b>.

seg-1259d36fc78c = Błąd czasu wraca (lub nie).

seg-c09b1ea8f1a4 = Dwie rzeczy, które operator musi zrobić, bo Kshana nie może:

seg-31f6c357864b = Podać dwa czasy.

seg-59f9eb10035a = <c1/> i <c2/> to oświadczenie operatora. Kshana nie wykrywa usunięcia sygnału w zapisie i nie weryfikuje tych czasów. Błędny czas przesuwa granice kroków, a więc i wynik.

seg-6d0d3186fbe3 = <b>Użyj tego samego zegara dla zapisu i dla czasów.</b> W logu zegara oś czasu zaczyna się od pierwszego odczytu, więc oba czasy są sekundami od pierwszej linii logu.

seg-bd181a831803 = Co zapisać

seg-52758c10be0a = Dowolne z poniższych, przez istniejące czytniki <c1/> (<a1><c2/></a1>):

seg-fef0034cb88b = Przyrząd

seg-ad6f33d70f3f = Jak powstaje zapis

seg-ef7f547609ad = linuxptp <c1/> (serwomechanizm zegara podrzędnego lub granicznego)

seg-f548a2ae96e5 = uruchom z <c1/> i zachowaj linie <c2/>

seg-9a3b58be1b0b = linuxptp <c1/>

seg-77255f8f5fef = linie <c1/>

seg-2cf9256bd790 = linuxptp <c1/>

seg-c667a97b92a8 = linie <c1/>

seg-ed305bcea4f8 = chrony <c1/>

seg-021b760aae59 = <c1/> w <c2/>

seg-a7f2d72a5cb7 = chrony <c1/>

seg-a70952a099d5 = <c1/> w <c2/>

seg-6ad29120ffe7 = licznik TAPR TICC

seg-32f703bfcab7 = tryb znaczników czasu względem wzorca

seg-6862a9ac9a68 = eksport ASCII z TimeLab

seg-b5e7e3a272d6 = faza w podanej jednostce

seg-8af4aac4426f = plik zegara RINEX

seg-21d5c43719f2 = jeden zegar

seg-3a82b5295ab1 = cokolwiek innego

seg-6bebda4a3c6c = <c1/> lub <c2/>

seg-9a443cc0c444 = pary <c1/>, próbkowane równomiernie

seg-b8d1d45df70b = <b>Ma znaczenie, co zapis mierzy.</b> Log serwomechanizmu (linuxptp, chrony) rejestruje przesunięcie, które demon zmierzył i koryguje: to błąd czasu pozostały pod kontrolą serwomechanizmu, a nie niezależny pomiar zegara względem UTC. W kroku holdover testu, który naprawdę odbiera wzorzec, log serwomechanizmu nadal pokazuje to, co demon uważał, a to może różnić się od prawdziwego błędu. Mocniejszym zapisem jest TICC lub inny licznik względem niezależnego wzorca; przy podawaniu wyniku napisz, którego użyto.

seg-6d4e25914d1c = Scenariusz

seg-ca1244db2387 = Klucze opcjonalne: <c1/> (nazwa, <c2/>, źródło; gdy ich brak, obowiązują domyślne ustawienia telecom-timing) oraz <c3/> wewnątrz <c4/>, aby wybrać jedno źródło z logu zawierającego kilka.

seg-38eb634b7f8f = Co zawiera raport

seg-6a64755e11d6 = <b><c1/></b>: dla stanu wyjściowego, holdover i powrotu: początek i koniec, liczba próbek oraz wartość średnia, rms, największa i końcowa błędu czasu.

seg-cd11d0838c44 = <b><c1/></b>: każda wymieniona maska, mierzona w kroku wskazanym przez jej warunek. Maska napisana dla zegara zablokowanego jest mierzona w stanie wyjściowym; napisana dla holdover lub zegara autonomicznego, w holdover. Każda kontrola ma swój limit, zmierzoną wartość, margines i tabelę, z której została przepisana. Maska, która wymaga dłuższego zapisu, niż dał krok, ma status <b>INCOMPLETE</b> i nigdy nie jest ekstrapolowana; maska, której silnik nie może ocenić dla odstępu próbkowania zapisu, ma status <b>NOT-EVALUATED</b> wraz z powodem.

seg-cb54e67ca4eb = <b><c1/></b>: ułamkowe przesunięcie częstotliwości, które system utrzymał (nachylenie prostej najmniejszych kwadratów przez błąd czasu w holdover, w ns/s, czyli w częściach na miliard), reszta względem tej prostej, największy bezwzględny błąd czasu i moment jego wystąpienia oraz skok w chwili usunięcia.

seg-daa40ac07396 = <b><c1/></b>: obwiednia holdover ePRTC-A z ITU-T G.8272.1 Tabela { "3" }, wyznaczona z <c2/>, wraz z chwilą jej pierwszego przekroczenia.

seg-cd480a1bf901 = <b><c1/></b>: czas po usunięciu, w którym każdy budżet błędu czasu zostaje pierwszy raz przekroczony.

seg-007a0393cb39 = <b><c1/></b>: czy <c2/> weszło do pasma i pozostało w nim przez czas przetrzymania, ile po powrocie GNSS to nastąpiło, szczyt po przywróceniu i największy skok między kolejnymi próbkami podczas powrotu.

seg-199497dfcc09 = <b><c1/></b>: MTIE i TDEV kroków stanu wyjściowego i holdover.

seg-ce00a41a322f = <b><c1/></b>: jednowyrazowe podsumowanie każdego kroku.

seg-c09fc305ead1 = Każda liczba niesie swoją jednostkę i źródło w bloku <c1/> raportu.

seg-5d87a772c132 = Słowa i limity

seg-0810b24c6f3e = Wynik jest <b>mierzony względem maski</b>. Maski są przepisane z swobodnie dostępnych Zaleceń ITU-T (te same tabele co w rodzaju <c1/>, wymienione w <a1><c2/></a1>), a każdy wpis, który Zalecenia pozostawiają „do dalszych badań”, jest nieobecny, a nie uzupełniony. Kshana nie twierdzi, że zegar lub system spełnia Zalecenie albo jest względem niego zatwierdzony, i raport też tego nie robi.

seg-527189cf37c6 = <b>MODELLED.</b> Logika kroków, dopasowanie prostej i reguła powrotu są sprawdzone na zapisach zbudowanych ze wzorów, których wyniki znane są przed przebiegiem; żaden laboratoryjny holdover nie został oceniony względem zewnętrznej wyroczni i żaden partner ani laboratorium na nic się nie zgodził. Potrzebne byłoby laboratorium czasu, zanim jakąkolwiek wartość dla klasy zegara można by awansować.

seg-ad8160fbed46 = <b>Czego nie obejmuje</b>, podane w każdym raporcie: czy GNSS rzeczywiście został usunięty i przywrócony w podanych chwilach; każdy krok, którego operator nie zapisał; maski zdefiniowane przez filtr { "0.1" } Hz dla zapisu próbkowanego rzadziej niż raz na sekundę; własna niepewność pomiarowa przyrządu; oraz każda procedura z Zalecenia wykraczająca poza zapis błędu czasu (profile temperatury, obciążenie sieci pakietowej).

seg-cf681db42f05 = <b>Pasmo powrotu to własny wybór testu.</b> Wartość domyślna { "100" } ns to maksymalny bezwzględny błąd czasu PRTC-A (ITU-T G.8272); to wygodna granica, a nie wymaganie żadnego Zalecenia dotyczące powrotu.

seg-4ce2f2052df4 = <b>Brak ścieżki nadawczej.</b> Kshana czyta pliki. Nie generuje sygnału, a usuwanie GNSS w laboratorium odbywa się własnym sprzętem laboratorium i na jego własne upoważnienie.

seg-0cff831a8444 = <c1/> jest rodzajem scenariusza, więc działa wszędzie, gdzie działają rodzaje: <c2/>, API Rust (<c3/>), powiązanie Pythona (<c4/>), kompilacja WebAssembly i npm (<c5/> lub <c6/> w treści wywołania; kluczy plikowych tam nie ma), serwer MCP (<c7/>, tylko treść w wywołaniu) oraz moduł uruchamiania scenariuszy w Kshana Studio. Oba pliki scenariuszy są dołączone (<c8/>).

seg-432c07a8e6f5 = <s1>Poprzednia</s1>Oszukany czas

seg-8499ae539222 = <s1>Następna</s1>Formaty logów zegara
