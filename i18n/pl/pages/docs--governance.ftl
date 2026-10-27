# docs--governance: translations (pl)

seg-26440a254ba8 = Źródło: <c1/>

seg-5f8e9a4a15be = Zarządzanie projektem { -brand }

seg-b20b74b77755 = Ten dokument opisuje, jak zarządzany jest { -brand }: kto podejmuje decyzje, w jaki sposób i co projekt będzie, a czego nie będzie przyjmował. Jest celowo <b>lekki</b> — proporcjonalny do obecnej wielkości projektu — i rzetelnie opisuje obecną rzeczywistość jednego opiekuna oraz drogę do szerszego zarządzania w miarę rozwoju społeczności.

seg-1e0c276811e2 = Misja i zakres

seg-5dcc38148cf4 = { -brand } to <b>neutralny, odtwarzalny i rzetelnie zwalidowany punkt odniesienia dla wydajności i odporności hybrydowego kwantowo-klasycznego PNT</b>. Misja wyznacza próg dla każdej decyzji: poprawność, cytowania i odtwarzalność ważniejsze niż szerokość oferty. Rzetelny zakres jest opisany w <a1><c1/></a1>, a status walidacji w <a2><c2/></a2>; propozycje są oceniane względem tego zakresu, a nie względem liczby funkcji.

seg-d331a1cfc60b = Role

seg-88bb2a831125 = <b>Opiekun.</b> { -brand } jest obecnie utrzymywany przez swojego założyciela, Ashforde OÜ (kontakt: <c1/>). Opiekun jest ostatecznym decydentem w sprawie zakresu, projektu, wydań i tego, co zostaje włączone. To model życzliwego opiekuna, opisany wprost, a nie przebrany za komitet, który nie istnieje.

seg-8e1da46f9b0b = <b>Współtwórcy.</b> Każdy, kto otwiera zgłoszenie (issue) lub pull request. Wkład jest oceniany według progu z <a1><c1/></a1> — pochodzenie każdego parametru liczbowego, walidacja względem opublikowanej zależności i rzetelność co do dojrzałości.

seg-d212e17ac218 = <b>Przyszli committerzy.</b> Gdy trwały, wysokiej jakości wkład na to zasługuje, prawa do zatwierdzania zmian zostaną rozszerzone na zaufanych współtwórców, a ten dokument zostanie zaktualizowany do modelu wielu opiekunów (decyzje przez konsensus domniemany, z grupą opiekunów rozstrzygającą spory). Do tego czasu droga jest taka: wnosić wkład, zbudować dorobek i zostać zaproszonym.

seg-91e3f1919016 = Jak podejmowane są decyzje

seg-0d45899c92f4 = <b>Dyskusja jawna.</b> Istotne zmiany zaczynają się jako zgłoszenie na GitHubie, tak aby uzasadnienie, alternatywy i kompromisy były zapisane.

seg-88916dd2357b = <b>Konsensus domniemany.</b> Propozycja bez trwałego sprzeciwu po rozsądnym czasie, która spełnia poniższy próg techniczny, jest realizowana.

seg-788566515dad = <b>Opiekun rozstrzyga w razie sporu.</b> Gdy nie osiągnięto konsensusu, decyduje opiekun i zapisuje powód. Spór rozstrzyga misja i próg techniczny, a nie staż ani głośność.

seg-e45e1b565e62 = Próg techniczny (niepodlegający negocjacjom)

seg-2c397872e2f5 = To twarde niezmienniki, egzekwowane przez CI i przegląd, których żadna decyzja nie uchyla:

seg-70cb5a174c2f = <c1/> musi odtworzyć przebieg bit po bicie. Zmiana, która to uniedeterministycznia, jest błędem, a nie funkcją.

seg-b8733ea97546 = <b>Pochodzenie.</b> Żadnych anonimowych stałych liczbowych — każdy parametr wskazuje źródło.

seg-55a09b775418 = <b>Rzetelność walidacji.</b> Każda możliwość jest oznaczona jako <c1/> (względem zewnętrznej wyroczni) albo <c2/> / <c3/>. Niczego nie twierdzi się ponad to, co wynika z dowodów. Zob. sprawdzaną maszynowo macierz w <c4/>.

seg-dd339a396698 = <b>Higiena.</b> Żadnego przypisywania autorstwa narzędziom automatycznym nigdzie w commitach, treści ani historii (egzekwowane przez <c1/>).

seg-45733fea1709 = Zmiana, która nie spełnia progu, jest odrzucana, choćby była bardzo użyteczna.

seg-3eb0831d99a2 = Granica między otwartym a zamkniętym

seg-ca7730a3d518 = { -brand } działa w modelu <b>open-core</b>. To repozytorium jest i pozostanie kompletnym otwartym silnikiem AGPL-3.0 — neutralnym punktem odniesienia, z podwójnym licencjonowaniem komercyjnym przez Ashforde OÜ (zob. <a1><c1/></a1>). Projekt <b>nie</b> przyjmie do otwartego repozytorium:

seg-8c2a89a3a4e2 = <b>Głębi objętej kontrolą eksportu lub podwójnego zastosowania</b> — prawdziwych bibliotek zagrożeń, przebiegów przeciwnika ani parametrów skuteczności anti-jam/anti-spoof. Publiczne repozytorium ogranicza się do ogólnych, opublikowanych modeli i metod (zob. <c1/> → Export control). W razie wątpliwości zapytaj <em>przed</em> wniesieniem wkładu.

seg-6df31d37cfe4 = Poufnych danych lub kalibracji klientów albo partnerów.

seg-b3b4a5384199 = <b>Zależności <em>copyleft</em> (GPL/AGPL/LGPL/MPL)</b> — nie dlatego, że kolidują z własną licencją AGPL silnika (nie kolidują), lecz dlatego, że nie można ich przelicencjonować do edycji <b>komercyjnej</b>: licencję komercyjną możemy sprzedawać tylko na kod, którego jesteśmy właścicielami lub który jest permisywny. Zależność copyleft skaziłaby edycję komercyjną i złamała podwójne licencjonowanie. Dlatego zależności pozostają permisywne (Apache/MIT/BSD/ISC), co egzekwuje <a1><c1/></a1>.

seg-ce264f3e43fe = I odwrotnie: projekt <b>nie</b> wydrąży otwartego rdzenia, by przesunąć wartość do części zastrzeżonej: zwalidowany silnik, publiczne punkty zakotwiczenia walidacji, rejestr rzetelności, format wymiany i normy oraz kanały dystrybucji pozostają otwarte. Głodzenie otwartego rdzenia to jedyny fatalny błąd w modelu open-core i jest wykluczone.

seg-947b3e9b1b2d = Wydania

seg-73e2bca0310d = <b>Semantic Versioning.</b> Przed wersją 1.0 schemat scenariusza i wyniku może się zmieniać; zmiany niezgodne wstecznie są wyraźnie wskazywane, a wersja schematu wymiany (<c1/>) jest jedynym źródłem prawdy o zgodności artefaktów.

seg-71cace8b6144 = <b>Uprawnienie do wydań.</b> Publikowanie (np. <c1/>) jest ręcznym krokiem opiekuna, wymagającym tokenu rejestru. CI i wyzwalany tagiem przepływ Release <b>nigdy</b> nie publikują automatycznie w zewnętrznych rejestrach — jedynie ponownie uruchamiają wszystkie kontrole i dołączają artefakt kompilacji. Zob. <c2/> → Commits and versioning.

seg-59c37ffa54f0 = Kodeks postępowania i bezpieczeństwo

seg-2dc8c12568bc = Zasady postępowania określa <a1><c1/></a1>.

seg-8574b73edbbc = Kwestie bezpieczeństwa podlegają prywatnemu procesowi zgłaszania opisanemu w <a1><c1/></a1> — nie otwieraj publicznego zgłoszenia dotyczącego podatności.

seg-d86d4e609713 = Znak towarowy

seg-cb1314b67b2f = Nazwa i logo { -brand } są znakami towarowymi Ashforde OÜ. Licencja (AGPL-3.0 lub licencja komercyjna) obejmuje <b>kod</b>, a nie znaki: fork może używać kodu na warunkach licencji, ale nie nazwy { -brand } ani kanonicznej tożsamości dystrybucji. Dzięki temu Ashforde pozostaje cytowanym źródłem prawdy, co jest częścią tego, jak otwarty rdzeń pozostaje neutralnym punktem odniesienia.

seg-a678f6ed1af8 = Zmiana tego dokumentu

seg-db90122245fa = Zmiany w zarządzaniu są same proponowane jako pull request i rozstrzygane opisanym wyżej procesem. W miarę zmiany skali projektu należy oczekiwać, że ten dokument zyska model decyzyjny wielu opiekunów; nie obniży to progu technicznego.

seg-0a0712cca2e7 = Lekki z założenia. Rzetelny co do dzisiaj, z jasno opisaną drogą na jutro.

seg-4bfa7cf23a41 = <s1>Poprzednia</s1>Wkład w projekt

seg-f67113e34738 = <s1>Następna</s1>Kodeks postępowania
