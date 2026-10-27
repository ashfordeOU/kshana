# docs--jammertest: translations (pl)

seg-f8cf777c0caa = Powierzchnie

seg-45425f378b61 = znaczenie

seg-9367b8736d36 = Źródło: <c1/>

seg-c2a40cd73d0e = Ocena Jammertest: opublikowany plan jako zaplanowany wzorzec

seg-a560942cbd27 = <c1/> czyta katalog testów Jammertest i plan transmisji i zamienia sloty jednego obszaru testowego na <c2/> zaufania do odbiornika. <c3/> przepuszcza log odbiornika przez monitory zaufania i ocenia go względem tego harmonogramu, test po teście. Każdy wynik ma status <b>MODELLED</b>: harmonogram mówi, kiedy test był <em>zaplanowany</em>, a nie kiedy nadajnik był włączony.

seg-bc4e7285c38a = Oprogramowanie wyłącznie doradcze, nie jest to sprzęt nawigacyjny z zatwierdzeniem typu (IEC { "61108" }, IEC { "61162" }): za nawigację statku odpowiada nadal operator. Nic tutaj nie jest zatwierdzone przez Norweski Zarząd Dróg Publicznych, Nkom ani organizatorów wydarzenia; nie twierdzi się, że zawarto z nimi jakiekolwiek porozumienie.

seg-af0edceb1503 = Ocena jednego syntetycznego logu odbiornika względem harmonogramu z trzema testami, z rzeczywistego przebiegu silnika v{ $version } (`kshana jammertest score`). Log jest zmyślony: { "1800" } s NMEA ze spadkiem C/N0 o { "20" } dB w dwóch przedziałach. Harmonogram zawiera trzy sloty; w środkowym slocie w logu nie ma zagłuszarki. Ocena wskazuje { "2" } z { "3" } testów wykrytych (mediana opóźnienia { "0" } s) i { "1" } niewykryty, przy { "0" } przebiegach fałszywych alarmów w { "0.25" } h czystego czasu. Nic tutaj nie mówi o rzeczywistym odbiorniku. Oprogramowanie wyłącznie doradcze, nie jest to sprzęt nawigacyjny z zatwierdzeniem typu (IEC { "61108" }, IEC { "61162" }): za nawigację statku odpowiada nadal operator.

seg-ceaa46bdcb7e = Plan i katalog

seg-73a5899de383 = Źródło: repozytorium <c1/> Norweskiego Zarządu Dróg Publicznych (<a1>https://github.com/NPRA/jammertest-plan</a1>), <b>licencja MIT</b> (prawa autorskie { "2024" } Norwegian Public Roads Administration; tekst licencji jest sprawdzany w <c2/>). Pliki są pobierane, nigdy nie dołączane do repozytorium:

seg-2a4967d30c3a = Pobiera katalogi i pliki planu { "2025" } z przypiętego commita <c1/> i odrzuca każdy plik, którego SHA-256 różni się od <c2/>.

seg-7826929c89f6 = Test w katalogu ma identyfikator z kropkami, <c1/> (na przykład <c2/>: typ { "1" } zagłuszanie, grupa { "2" }, test { "5" }). Plan wymienia dla każdego obszaru testowego i slotu czasowego, który identyfikator jest zaplanowany. Typy { "1" } (zagłuszanie), { "2" } (spoofing) i { "3" } (meaconing) nadają; typ { "0" } (odprawy, okres karencji, sloty rezerwacji i doraźne) nie nadaje i jest pomijany. Czasy w planie są lokalnym czasem ściennym; <c3/> (domyślnie { "2" }, CEST) mówi, jak daleko są od UTC. Pliki planu zawierają pole kontaktu testowego z imieniem i nazwiskiem osoby: nigdy nie jest odczytywane i nic z niego pochodnego nie jest zapisywane.

seg-3eab33a0c38f = Import

seg-91fddde78691 = <c1/> zastępuje <c2/>/<c3/>, gdy log nie podaje swojego początku. Wynikiem jest TOML <c4/> do dołączenia do scenariusza zaufania do odbiornika; każda etykieta zaczyna się od <c5/> i zawiera rok edycji, identyfikator katalogowy i obszar, a nagłówek zapisuje SHA-256 każdego pliku źródłowego. <c6/> czyta natomiast wzorzec zdarzeń jednego folderu zbioru danych JammerTest { "2024" } (jego <c7/>, znaczniki przesunięte o <c8/>, domyślnie -2: podają <c9/>, ale są czasem lokalnym).

seg-6ed6415a6f52 = Ocena

seg-1e72a977f7ad = <c1/> to scenariusz zaufania do odbiornika (<c2/>, opcjonalnie <c3/>, <c4/>). Jego własne <c5/> są zastępowane zaimportowanym harmonogramem. Dla każdego zaplanowanego testu:

seg-99427ab75a03 = pole

seg-d2681be37798 = <c1/> (alarm w ciągu <c2/>, domyślnie { "10" } s, od planowanego początku), <c3/> (później, wewnątrz slotu), <c4/> (brak), <c5/>

seg-01a977f18700 = pierwszy alarm minus planowany początek

seg-b83d1f0a1fb7 = od końca slotu do początku pierwszego odcinka co najmniej <c1/> ({ "10" } s) bez alarmu, przed następnym testem

seg-84a34f13e93b = Test podlega ocenie tylko wtedy, gdy zaczyna się co najmniej <c1/> po rozpoczęciu logu; log z wcześniejszym testem jest oznaczany <c2/> (punkt odniesienia mógł powstać w warunkach zakłóceń). <b>Fałszywe alarmy</b> to alarmujące epoki po kalibracji poza każdym slotem rozszerzonym o <c3/> ({ "60" } s) przed i po (lub po punkcie powrotu do normy), liczone jako epoki i jako przebiegi, z przebiegami na godzinę czystego czasu. Z <c4/> i <c5/> przebieg jest zapisywany jako podpisany pakiet dowodowy (<c6/>): karta wyników i zaimportowany harmonogram znajdują się wewnątrz <c7/>, a więc wewnątrz łańcucha skrótów i podpisu. Pakiet jest rekordem technicznym, a nie opinią prawną.

seg-382613112d5d = Czego wynik nie mówi

seg-f1cb12a89001 = Zaplanowany slot nie jest zapisem emisji w eterze. Nadajnik mógł wystartować późno, zatrzymać się wcześniej albo nigdy nie działać; test „missed” może być testem, który nie nadawał, a opóźnienie liczy się od planowanego początku.

seg-32baa4a4b9f0 = „Czysta” epoka to „poza zaplanowanymi slotami”, a nie „udowodniona wolna od zakłóceń”.

seg-95cc22bbacc5 = Detekcja przez monitory w dziedzinie pomiarów nic nie mówi o wykrywaniu spoofera o małej mocy i koherentnego.

seg-2e91813cf9d7 = Żadna zewnętrzna wyrocznia nie podaje prawdziwych czasów emisji w eterze, więc nic tutaj nie ma statusu VALIDATED.

seg-cfdf09e38e6e = Przebieg na zbiorze danych { "2024" } (zarejestrowany z góry)

seg-473ed6ca71e5 = <c1/> ustaliło populację, definicje i progi przed pierwszym przebiegiem ocenianym; <c2/> zapisuje ten przebieg. Wynik: <b>zarejestrowana reguła minimalnej ilości danych nie została spełniona</b> ({ "4" } okna zagłuszania podlegające ocenie z { "4" } z { "12" } folderów <c3/>: { "5" } folderów odrzucono regułą punktu odniesienia, a { "3" } logi UBX podają swój początek tylko jako tydzień i sekundę tygodnia czasu GPS), więc <b>żaden próg nie podlega ocenie</b>. Niczego nie poluzowano ani nie powtórzono. <b>v2</b> (<c4/>, zatwierdzone samodzielnie przed swoim przebiegiem; tylko obsługa danych, te same progi i reguła minimalnej ilości danych) umieściło logi tylko z czasem GPS na podstawie daty folderu, oceniło { "12" } folderów tylko z CSV i użyło sesji platformy ruchomej dla ruchomych łazików. Wynik (<c5/>): zachowano { "14" } z { "24" } folderów, ale tylko <c6/> okien zagłuszania podlegających ocenie, więc reguła minimalnej ilości danych znów nie została spełniona i <b>żaden próg nie podlega ocenie</b>. Wynik v1 jest niezmieniony. Tylko opisowo: { "3" } z { "7" } okien zagłuszania wywołało alarm w ciągu { "10" } s, { "4" } później, żadne niewykryte; mediana opóźnienia { "18" } s; odsetek fałszywych alarmów w czystym czasie { "0.089" }. Ograniczeniem wiążącym jest teraz reguła punktu odniesienia, która usuwa { "10" } folderów; kolejna rejestracja wymagałaby innej reguły dla wczesnych okien. Zbiór danych (JammerTest { "2024" }, Zenodo { "15911589" }, GPL-3.0-or-later) jest pobierany przez <c7/> i nigdy nie jest dołączany do repozytorium; test <c8/> przypina zarejestrowany przebieg, gdy <c9/> wskazuje rozpakowany zbiór danych.

seg-cd75b60bd0db = Zbiór danych NMEA SimulaMet { "2025" }

seg-87bc2544154b = Zbiór danych SimulaMet Jammertest { "2025" } wyprowadzony z NMEA (IEEE DataPort, DOI 10.21227/a7v4-xw11) <b>nie</b> jest adaptowany w { "0.38" }. Jego strona nie podaje licencji i mówi: „Dostęp do tego zbioru danych wymaga subskrypcji IEEE DataPort”: warunki nie zezwalają jasno na redystrybucję ani automatyczne pobieranie, więc nie napisano adaptera ani skryptu pobierającego. Użycie go wymaga decyzji właściciela i, najlepiej, pisemnej zgody autorów.

seg-aa8d3fe2adf3 = CLI, Rust (<c1/>), Python (<c2/>, <c3/>), WebAssembly (te same nazwy), narzędzia MCP o tych samych nazwach oraz polecenie <c4/> i umiejętność <c5/>. Podpisany pakiet jest dostępny tylko z wiersza poleceń (wymaga klucza podpisu). Zob. <c6/>.

seg-82aab597103a = <s1>Poprzednia</s1>Rozszerzony sygnał LunaNet w kierunku do przodu

seg-fb9e48a04566 = <s1>Następna</s1>Wejścia maszynowe i czujnikowe
