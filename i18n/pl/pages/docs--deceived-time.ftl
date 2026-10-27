# docs--deceived-time: translations (pl)

seg-d46702617926 = Źródło: <c1/>

seg-f44d01df7b1c = Podpisane polecenie zastosowane w zwiedzionym czasie nadal błędnie kieruje

seg-6497012e401e = Nota techniczna dla operatorów sieci indeksowanych czasem: konstelacji, które kierują ruch, przydzielają zadania lub przekazują obsługę według harmonogramu, gdzie każdy węzeł działa, gdy jego własny zegar osiąga zaplanowany moment.

seg-714bce435435 = Skróty: GNSS, Global Navigation Satellite System; TPL, timing protection level (poziom ochrony czasu); PNT, pozycjonowanie, nawigacja i czas.

seg-a7208323de1c = Teza

seg-246715a1c559 = Uwierzytelnianie komunikatów sterujących, także podpisami postkwantowymi, dowodzi, kto wysłał komunikat i że nie został zmieniony. Nie dowodzi, <b>kiedy odbiorca go wykonuje</b>. Węzeł wykonuje polecenie indeksowane czasem względem własnego zegara. Jeśli ten zegar został przesunięty o <c1/>, polecenie ważne dla chwili <c2/> wykona się w czasie rzeczywistym <c3/>, przy nienaruszonych wszystkich podpisach. Gdy <c4/> przekracza margines slotu, ruch trafia do niewłaściwego slotu, łącze przełącza się, gdy drugi koniec jest jeszcze skierowany gdzie indziej, albo przekazanie następuje za wcześnie. Sieć błędnie kieruje ruch, a każda kontrola integralności na ścieżce poleceń zgłasza sukces.

seg-8683f0749042 = Dlaczego zegar jest miękkim celem

seg-1af5aea2ef5b = <b>Czas GNSS jest zwykłym wzorcem i można go spoofować.</b> Węzeł, który dyscyplinuje zegar względem GNSS, dziedziczy każdy czas, który serwuje odbiornik. Spoofer, który utrzymuje własne flagi jakości odbiornika na zielono, może ten czas przesuwać powoli.

seg-354a4c706264 = <b>Kontrole świeżości używają tego samego zegara.</b> Okno ważności („przyjmuj to polecenie do <c1/>”) lub licznik powtórzeń związany z czasem jest oceniany względem lokalnego zegara, więc przesunięty zegar może też poszerzyć okno, w którym przechwycone podpisane polecenie jest przyjmowane.

seg-a4b8a5db0975 = <b>Atak nie wymaga klucza.</b> Nic w podpisanym kanale nie jest naruszane. Silniejsza kryptografia podnosi koszt fałszowania polecenia, a ten koszt pozostawia bez zmian.

seg-e514b03fbae3 = To leży obok prac nad kryptografią postkwantową, a nie przeciwko nim: obie zamykają różne luki. Podpisy powstrzymują sfałszowane polecenie. Integralność czasu powstrzymuje wykonanie prawdziwego polecenia w niewłaściwym momencie.

seg-09f493386dbc = Co to ogranicza

seg-750bd90b0ee1 = Cztery środki, każdy kwantyfikowany przez rodzaj scenariusza <c1/> (<a1><c2/></a1>):

seg-77cf39b434b5 = <b>Monitor wspomagany zegarem.</b> Porównuje czas GNSS z własnym zegarem węzła w dryfie w oknie i alarmuje, gdy różnica jest zbyt duża, by była szumem zegara. Warunkowy TPL ogranicza błąd, który może pozostać niezauważony przed alarmem.

seg-e58f7fb94ac5 = <b>Niezależne kontrole, zaplanowane.</b> Dwukierunkowy transfer czasu ze stacji naziemnej lub porównanie łączem krzyżowym z sąsiadem poza zasięgiem spoofera ogranicza, jak długo może trwać powolne przesuwanie. Ich odstęp między kolejnymi kontrolami jest parametrem bezpieczeństwa, a nie tylko operacyjnym.

seg-69590f56817c = <b>Geometria.</b> Naziemny spoofer dosięga satelity niskiej orbity okołoziemskiej tylko wtedy, gdy jest on nad horyzontem spoofera, więc przesunięcie jest ograniczone przez tempo narastania spoofera razy to okno. W arytmetyce: narastanie { "10" } ns/s utrzymywane przez { "600" } s to { "6" } µs. Dołączony przykład (<c1/>: orbita { "550" } km, maksymalne narastanie { "10" } ns/s) podaje ekspozycję na spoofer { "732" } s i ograniczone tempem narastania przesunięcie { "7 321" } ns.

seg-e8e52ce05943 = <b>Margines dobrany z granicy i bezpieczne działanie przy alarmie.</b> Margines slotu powinien pokrywać największy niewykryty błąd, jaki dopuszczają monitor i kontrole, a nie tylko szum swobodnie biegnącego zegara. Przy alarmie węzeł powinien trzymać ostatni dobry harmonogram na swoim zegarze w dryfie, zamiast podążać za GNSS.

seg-c11b66f214ac = Czego ta nota nie twierdzi

seg-8b0ed39ead25 = Nie twierdzi, że zaobserwowano błędne kierowanie przez spoofowany satelita; nie szacuje ekspozycji żadnego operatora; a granice, na które wskazuje, są MODELLED, warunkowe względem detekcji i podanych założeń o zagrożeniu. Argumentuje za kompozycją: ważny podpis i poprawny czas wykonania to osobne własności, a sieć indeksowana czasem potrzebuje obu.

seg-c1bf6467e3c9 = <s1>Poprzednia</s1>Synchronizacja czasu w telekomunikacji

seg-d4e9bfd42982 = <s1>Następna</s1>Test holdover i sprzęt synchronizacji czasu w pętli
