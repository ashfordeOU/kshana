# docs--marine-integrations: translations (pl)

seg-2e34ace70d11 = Wtyczka Signal K

seg-0857a94a948e = Ograniczenia

seg-2247a2344710 = Znaczenie

seg-c3c260b7063e = Testy

seg-06ff6eed7e99 = OpenCPN

seg-ab1af8b3d968 = zob. wyżej

seg-c353e7bec219 = Klucz

seg-df52127d74b6 = Gdzie

seg-7670cf4ceda3 = Wartość domyślna

seg-7e304f816037 = Źródło: <c1/>

seg-fb2b0841a172 = Integracje morskie: wskaźnik zaufania na mostku

seg-a88b3968c706 = Morski wskaźnik zaufania Kshana (<a1><c1/></a1>) jest dostępny z oprogramowania, z którego żeglarze już korzystają: wtyczki serwera <b>Signal K</b> oraz <b>OpenCPN</b> przez NMEA w trybie bramki po TCP. Wersja referencyjna umieszcza go na małym komputerze obok odbiornika.

seg-eb8043b9e269 = <b>Oprogramowanie wyłącznie doradcze.</b> Kshana nie jest sprzętem nawigacyjnym z zatwierdzeniem typu (IEC { "61108" }, IEC { "61162" }) i nie została oceniona względem żadnej normy działania. Wszystko na tej stronie jest pomocą dla osądu nawigatora. Za bezpieczną nawigację statku oraz za każdą decyzję o poleganiu na pozycji lub o zaprzestaniu polegania na niej odpowiada nadal operator. Nic tu niczego nie nadaje i nic tu nie czyni pozycji dokładniejszą.

seg-dab66f260e56 = Element

seg-40fd2019e974 = Stan w { "0.35" }

seg-7bcecf49199c = dostarczone, testowane jednostkowo na zapisanym syntetycznym wyniku; nieopublikowane w npm

seg-d5278e683d37 = OpenCPN przez NMEA w trybie bramki po TCP

seg-a876f5d43e39 = dostarczone i przetestowane (odtworzenie po stronie odbiorcy); sam interfejs użytkownika OpenCPN nie jest sterowany przez żaden test

seg-4a6d2f45b403 = Natywna wtyczka panelu wskaźnika dla OpenCPN

seg-b0d4d32612e9 = zbudowana, logika testowana jednostkowo i uruchomiona wewnątrz OpenCPN { "5.8.4" } pod wirtualnym ekranem (dowody w <c1/>); nie spakowana dla menedżera wtyczek; zostanie wydana dopiero po przeglądzie

seg-2e0058b5e057 = Wersja referencyjna

seg-959d93e3a56d = części, kroki dla systemu operacyjnego, jednostki systemd (sprawdzone na sucho), opcja kontenera; nie testowane na statku

seg-8524cb32f0a3 = Wszystko to czyta jedną rzecz: wyjście <c1/> (wiersze JSON, zdanie <c2/>, bramka). Formaty przesyłania opisuje <a1><c3/></a1>. Wtyczka Signal K trzyma swoją wiedzę o nich w jednym pliku, <c4/>; zmiana formatu to edycja jednego pliku.

seg-e5b08ab63d78 = Brak zależności npm. Sama wtyczka działa na Node { "18" } lub nowszym; bieżące wydania <c1/> wymagają Node { "22" } lub nowszego, więc w praktyce używaj { "22" }. Skopiuj lub podlinkuj <c2/> do <c3/> serwera (na przykład <c4/>), zrestartuj serwer i włącz <b>Kshana GNSS trust</b> w Server, Plugin Config.

seg-fd80525d7dd1 = Skąd pochodzą epoki (<c1/>)

seg-013478c9a701 = Co robi wtyczka

seg-abbd00e9cacf = <c1/> (domyślnie)

seg-8ca5f95ed09d = Uruchamia <c1/> i zapisuje na jego standardowe wejście każde surowe zdanie NMEA { "0183" }, które otrzymuje serwer (zdarzenie <c2/> serwera). Restartuje go z odczekaniem, jeśli się zakończy | <b>Używaj tylko na serwerze z jednym źródłem NMEA</b>: podaje każde zdanie od każdego dostawcy, przemieszane, więc drugi odbiornik GNSS lub AIS wygląda jak jeden odbiornik, którego położenie skacze, i może zostać oceniony jako spoofing. Przy więcej niż jednym źródle użyj <c3/> ze strumieniem <c4/> tego odbiornika albo <c5/> z bramki.

seg-3b3eadcffb90 = Uruchamia <c1/>, na przykład <c2/> lub <c3/>

seg-d69b5ebe1042 = Łączy się ze strumieniem wierszy JSON, które zapisuje <c1/> (na przykład z przekaźnika w <c2/>)

seg-cd5a419844cc = Łączy się ze strumieniem NMEA (takim jak wyjście bramki usługi lub kontenera w wersji referencyjnej, port { "10110" }) i odczytuje tylko jego zdania <c1/>

seg-f17c9b7d7abc = Strumień, który jest już poddawany spoofingowi w chwili pierwszego połączenia monitora, nie ma czystego punktu odniesienia (pierwsze <c1/> sekund nigdy nie jest oceniane). Uruchom go przed rejsem.

seg-33fc47100aa6 = Publikowane ścieżki

seg-f032afe8b331 = Każda epoka aktualizuje (źródło <c1/>):

seg-b809eaf502ad = Ścieżka

seg-0da78c80fb76 = <c1/>, <c2/>, <c3/> lub <c4/>

seg-d4d4d5d5ec1f = { "0" } do { "100" } albo <c1/> podczas kalibracji

seg-5280497b5d9f = <c1/>, od największych: które kontrole obniżyły wskaźnik

seg-6089a3166c91 = monitory, które aktualnie przekraczają swój próg

seg-55280b62eb19 = <c1/>, <c2/> lub <c3/> (gdy bramka działa gdzie indziej; <c4/> z <c5/>, gdy jej brak)

seg-963da9c0d2a3 = <c1/>: położenie zgłoszone w danej epoce przez badany odbiornik (schemat JSON { "1.1" } lub nowszy; nie jest publikowane, gdy strumień go nie zawiera, na przykład z <c2/> lub starszego <c3/>). <b>Wyłącznie kontekst zaufania</b>: wtyczka nigdy nie zapisuje <c4/>, więc ścieżka własnego położenia statku pozostaje nietknięta

seg-50599cef740d = zgłaszane przy zmianie stanu: <c1/>

seg-ad58b4599f78 = Wtyczka wysyła także metadane Signal K dla tych ścieżek jednorazowo przy starcie. <c1/> to wskaźnik zaufania Kshana od { "0" } do { "100" }, wskaźnik, a nie stosunek ani prawdopodobieństwo, więc nie ma jednostki SI; jego metadane podają zakres, opis i strefy zgodne z progami poniżej. <c2/> to punkty wskaźnika odjęte od tego wskaźnika od { "0" } do { "100" }.

seg-bf0c90f5c02a = Powiadomienie ma wartość <c1/>, <c2/>, <c3/> lub <c4/>. Jest kasowane przez publikację stanu <c5/>, a nie <c6/>: odbiorca, który uznaje za skasowane tylko <c7/>, powinien uznać za skasowane także <c8/>. Domyślnie pasmo <b>degraded</b> daje <c9/>, a pasmo <b>untrusted</b> daje <c10/>, z <c11/>. Jest obniżane po <c12/> epokach w lepszym stanie. Jeśli przez <c13/> sekund nie nadejdzie żadna epoka, ostrzega, że wskaźnik nie jest aktualizowany. Kalibracja nigdy nie wywołuje powiadomienia. Źródło <c14/> nie zawiera listy <c15/> (zdanie ma tylko pasmo, wskaźnik i dwa główne powody).

seg-89cdf02b58e3 = Konfiguracja (każdy próg)

seg-d7bdd78470ec = plik wykonywalny (tryby spawn). <b>Uruchamia dowolny plik wykonywalny jako użytkownik serwera</b>: konfigurację wtyczki powinien móc zmieniać tylko administrator serwera Signal K

seg-73091c431bcf = limity statku, progi i wagi wskaźnika (tryby spawn)

seg-f5f08c50abc7 = argumenty dodawane do <c1/> w obu trybach spawn: wejście dla <c2/>, dodatkowe flagi, takie jak <c3/> (zapisany dziennik podawany szybciej niż w czasie rzeczywistym) dla <c4/>. Wtyczka odrzuca <c5/>, <c6/>, <c7/> i <c8/> (czyta JSON z <c9/> ze standardowego wyjścia), a dla <c10/> także flagi wejścia (<c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>)

seg-01caf7ed213f = Tryby TCP (bramka obsługuje na { "10110" }: ustaw port dla <c1/>)

seg-72b911dea6bd = <c1/>: pasmo zgłaszane przez Kshana, z krawędziami w pliku sesji. <c2/>: dwa poniższe wskaźniki

seg-76ca56821979 = tryb <c1/>: poniżej tej wartości stan to <c2/> (domyślna krawędź Kshana dla nominal)

seg-429d8fc4570f = tryb <c1/>: poniżej tej wartości stan to <c2/> (domyślna krawędź Kshana dla degraded)

seg-6d5c9e402211 = stan dla pasma degraded: <c1/>, <c2/> lub <c3/>

seg-e88a2979ef07 = kolejne epoki w gorszym stanie przed wywołaniem powiadomienia

seg-0eec67224385 = kolejne epoki w lepszym stanie przed jego obniżeniem

seg-76b52e312539 = ostrzegaj, gdy przez tak długo nie nadejdzie żadna epoka; <c1/> to wyłącza

seg-87d3fcf7fec9 = metody powiadamiania

seg-9a455cf4a2f9 = Wtyczka nie działa jako bramka: nigdy nie zmienia pozycji. Oznaczanie pozycji jako nieważnej dla systemu mapowego to bramka, poniżej.

seg-30f48b177c1c = <c1/>, bez zależności, bez sieci poza <c2/>. Testy przetwarzają i odtwarzają 66-epokowy fragment wierszy JSON i zdań <c3/>, które <c4/> zapisał dla syntetycznego demo bałtyckiego (dane wymyślone, tylko tekst), sprawdzają zgodność obu formatów, zachowanie podtrzymania i kasowania, tryb wskaźnika, nieaktualność oraz trzy ścieżki wejścia względem lokalnego strumienia i zastępczego procesu potomnego. Te testy nie uruchamiają prawdziwego serwera Signal K; osobny skryptowy przebieg to robi, zob. niżej.

seg-024928983177 = Uruchomienie w prawdziwym serwerze Signal K

seg-80b5a217d13c = <c1/> zawiera skrypt, który ładuje wtyczkę do przypiętego pakietu <c2/> { "2.33.0" } (w prywatnej przestrzeni nazw sieci tylko z pętlą zwrotną) i rejestruje to, co pokazują własne API REST i WebSocket serwera. Ścieżki zaufania się pojawiają, powiadomienie przechodzi przez warn, alarm, normal (po podtrzymaniu) i ponownie warn, gdy dane ustają, a z prawdziwym <c3/> zasilanym własnym wejściem NMEA serwera opublikowało także <c4/>, nigdy <c5/>. Jedna wersja serwera, jeden przebieg, żaden prawdziwy statek; ograniczenia i sposób odtworzenia w README dowodów.

seg-fea2e7d140c3 = OpenCPN czyta NMEA z sieci, a <c1/> może sam udostępnić strumień po bramce na porcie TCP.

seg-92981e13bc6f = Zalecane: połączenie bezpośrednie.

seg-e6caa4d53b9a = (<c1/> to port szeregowy odbiornika odczytywany przez <c2/> i <c3/>, multiplekser albo wejścia <c4/>/<c5/> samego <c6/>; <c7/> z wersji referencyjnej robi to pod systemd.) <c8/> wiąże się z adresem pętli zwrotnej; można podłączyć dowolną liczbę klientów tylko do odczytu, a klient, który nie nadąża, jest odłączany bez opóźniania pozostałych.

seg-311e4379acf1 = Alternatywa: przekaźnik.

seg-11b4c4791f55 = <c1/> to niezależny od zależności rozdzielacz w Node, który robi to samo dla <c2/> bez <c3/> lub udostępnia dowolny inny strumień wierszy (opcja kontenera używa go dla epok JSON):

seg-93cb82966313 = Przekazuje bajty bez zmian, tylko całe wiersze, i odłącza klienta, który nie czyta. Preferuj połączenie bezpośrednie: o jeden proces mniej w łańcuchu.

seg-4226afc6175c = W OpenCPN: Options, Connections, Add Connection, <b>Network</b>, protokół <b>TCP</b>, adres <c1/>, port <c2/>, kierunek <b>Input</b>. Dopóki zaufanie nie załamało się, strumień jest własnym strumieniem odbiornika plus jedno zdanie <c3/> na cykl. Gdy się załamało, przekazywane GGA ma jakość <c4/>, RMC status <c5/>, a wskaźniki trybu mówią o braku pozycji, z przeliczonymi sumami kontrolnymi: sprzęt widzi, jak sam odbiornik uznaje pozycję za nieważną, i podnosi własny alarm. Zdania <c6/> są widoczne w oknie debugowania NMEA w OpenCPN (Options, Connections, „NMEA debug window”). Pola położenia pozostają takie, jak odebrano.

seg-8549d49f1b2c = Przeczytaj „Gate mode” w <a1><c1/></a1>, zanim na tym polegniesz: jest opcjonalny, dodaje opóźnienie (cykl jest wstrzymywany do chwili oceny jego epoki), jest pojedynczym punktem w łańcuchu i może wstrzymać dobrą pozycję, a także przepuścić sfałszowaną.

seg-533a911141d6 = <c1/> odtwarza zapisany fragment syntetycznego strumienia po bramce ({ "186" } zdań wokół chwili załamania zaufania, zapisanych przez <c2/>) przez przekaźnik po prawdziwym gnieździe TCP i sprawdza, co otrzymuje odbiorca: strumień bajt po bajcie przy dowolnym dzieleniu na porcje; prawidłowe sumy kontrolne w każdym zdaniu, także przepisanych; zgodne GGA i RMC, ważne, a potem nieważne, bez migotania; jedno <c3/> na cykl z polem bramki <c4/> dokładnie tam, gdzie pozycja jest nieważna; dwóch identycznych odbiorców; częściowy wiersz nigdy nieprzekazany. Sprawdza to strumień podawany OpenCPN, a nie własny ekran OpenCPN.

seg-12fc91a3f69b = Test od początku do końca z prawdziwym plikiem binarnym, niebędący częścią testów domyślnych (wymaga zbudowanego <c1/>):

seg-fea419a50c52 = Oba uruchamiają jednogodzinne demo syntetyczne i sprawdzają, że pozycja staje się ważna, a potem nieważna, z jednym <c1/> na epokę.

seg-e76c11d8f003 = Wtyczka natywna

seg-7a5ac2d2f229 = <c1/> to panel wskaźnika dla OpenCPN (wskaźnik, pasmo, bramka, główne powody, alert, gdy zaufanie staje się untrusted), który czyta <c2/> z własnego strumienia NMEA OpenCPN, więc nie wymaga połączenia poza opisanym wyżej. Jest budowana za pomocą CMake względem nagłówka API wtyczek OpenCPN (dołączonego, z commitem źródłowym) i wxWidgets; <c3/> uruchamia testy logiki bez wx i sprawdza, że biblioteka eksportuje punkty wejścia, których szuka OpenCPN. Uruchomiono ją wewnątrz OpenCPN { "5.8.4" } pod wirtualnym ekranem na syntetycznym strumieniu po bramce (OpenCPN przekazał <c4/> wtyczce, panel zaczerwienił się, a własne położenie OpenCPN zamarzło po uruchomieniu bramki; zrzuty ekranu, dziennik i skrypt w <c5/>), ale nie na prawdziwym pulpicie, innych wersjach ani platformach, i nie jest spakowana dla menedżera wtyczek OpenCPN. Zob. <a1><c6/></a1> wtyczki. Jest licencjonowana na GPL-3.0-or-later, inaczej niż reszta repozytorium (<a2><c7/></a2>).

seg-a2adfa7ff5fb = Zrzuty ekranu z tego przebiegu, w <c1/> (jeden przebieg, OpenCPN { "5.8.4" } pod wirtualnym ekranem, dane syntetyczne; <a1><c2/></a1> podaje ograniczenia):

seg-ee5e8bb5a734 = Okno mapy OpenCPN z uruchomioną wtyczką panelu wskaźnika Kshana na syntetycznym strumieniu po bramce, przed załamaniem zaufania: żaden panel nie jest otwarty (otwiera się sam przy alarmie), położenie statku na pasku stanu wynosi { "54" } { "32.4659" } N { "018" } { "46.1670" } E, prędkość { "16.48" } kn i kurs { "088" }, a wskaźnik pozycji w prawym górnym rogu pokazuje trzy kreski.

seg-1189d82affbb = To samo okno OpenCPN po załamaniu: panel Kshana jest otwarty na czerwono z wskaźnikiem { "47" } i słowem UNTRUSTED, wierszami gate: fix marked invalid, cn0-spread -30.0, speed-log -21.0 i wiekiem { "2" } s oraz informacją, że jest to oprogramowanie wyłącznie doradcze, nie sprzęt nawigacyjny z zatwierdzeniem typu, i że operator nadal ponosi odpowiedzialność. Pasek stanu nadal pokazuje { "54" } { "32.4672" } N { "018" } { "46.2227" } E, a wskaźnik pozycji spadł do dwóch kresek.

seg-90c7cdee8892 = OpenCPN zasilany bezpośrednio przez kshana receiver-trust live --gate --listen: panel Kshana jest otwarty na czerwono z wskaźnikiem { "44" } i UNTRUSTED, wierszami gate: fix marked invalid, cn0-spread -30.0, speed-log -18.8 i wiekiem { "1" } s oraz informacją doradczą. Ten przebieg nie potwierdza obserwacji zamrożenia położenia: OpenCPN nadal przetwarzał początkową serię epok.

seg-dce06383cde1 = Pokazują one okablowanie i dotarcie pozycji po bramce do OpenCPN, a nie to, że jakikolwiek alarm jest na czas lub poprawny dla prawdziwego statku. Oprogramowanie wyłącznie doradcze, nie jest to sprzęt z zatwierdzeniem typu.

seg-f9f39d089438 = <a1><c1/></a1>: ogólna lista części, konfiguracja systemu operacyjnego, dwie jednostki systemd (monitor doradczy i opcjonalna bramka), opcja kontenera i okablowanie Signal K. <c2/> uruchamia <c3/> na jednostkach bez uruchamiania czegokolwiek.

seg-5e2a2e8af941 = Wskaźnik jest tak dobry, jak kontrole, które za nim stoją, a te patrzą na fizykę statku i jego inne czujniki; samospójna fałszywka z pasującym zegarem nie jest widoczna dla monitorów opartych wyłącznie na NMEA (<a1><c1/></a1>). Brak alarmu nie jest dowodem dobrej pozycji.

seg-be1ed291f7c3 = Żadna wartość na tej stronie nie jest zmierzoną częstością detekcji ani fałszywych alarmów. Powyższe testy sprawdzają okablowanie na tekście syntetycznym; nic nie mówią o tym, jak jakikolwiek monitor radzi sobie z prawdziwymi zakłóceniami.

seg-97d775b504c6 = Bez zatwierdzenia typu; operator nadal ponosi odpowiedzialność.

seg-69222f7d5068 = <s1>Poprzednia</s1>Mapa zakłóceń: źródła danych i licencje

seg-8eba9835d7df = <s1>Następna</s1>Geometria nieba i linie horyzontu

seg-2093a1d8a24e = Skąd pochodzą epoki (source)
