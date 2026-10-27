# docs--licensing: translations (pl)

seg-234be920d38f = AGPL jest <a1>otwartoźródłową licencją zatwierdzoną przez OSI</a1> o silnym copyleft. Jest to właściwy wybór dla prac akademickich, projektów open source, wewnętrznej oceny i badań oraz dla każdego, kto chętnie pozostawi własną pochodną wersję otwartą.

seg-16c9cc91e4eb = Opcja B — licencja komercyjna (od Ashforde OÜ)

seg-197bfc5a5166 = Jeśli AGPL Ci nie odpowiada, Ashforde OÜ udzieli licencji na ten sam silnik na warunkach komercyjnych. Jest to właściwy wybór, gdy chcesz:

seg-6de2b04016e5 = <b>osadzić Kshana w zastrzeżonym produkcie o zamkniętym kodzie źródłowym</b> bez ujawniania własnego kodu;

seg-e31db28c1e09 = <b>oferować usługę sieciową</b> opartą na zmodyfikowanej Kshana <b>bez</b> obowiązku ujawnienia kodu źródłowego z §{ "13" };

seg-9d3578395a59 = zintegrować Kshana z większym systemem, którego pozostałe komponenty nie mogą być objęte AGPL (np. zastrzeżony zestaw narzędzi generalnego wykonawcy); albo

seg-99d049c650a3 = uzyskać gwarancję, odszkodowanie lub warunki wsparcia, których AGPL wyraźnie się zrzeka.

seg-f68b536b93c0 = Licencja komercyjna znosi obowiązki wynikające z copyleft w odniesieniu do Twojego zastosowania, na uzgodnionych warunkach. <b>Kontakt: <a1>contact@ashforde.org</a1>.</b>

seg-55f1a2f687d9 = Dlaczego podwójne licencjonowanie w ten sposób

seg-42c1ce05ca5c = Celem jest <b>publiczna weryfikowalność</b> (aby każdy recenzent mógł uruchomić i zbadać silnik) <b>bez</b> umożliwienia dobrze wyposażonemu konkurentowi rozwidlenia silnika sprawdzonego niezależnym wzorcem, zamknięcia go i wypuszczenia zastrzeżonego produktu konkurencyjnego, który nic nie wnosi w zamian. Sieciowy copyleft AGPL to osiąga: zamknięta lub hostowana wersja pochodna musi wrócić do open source albo uzyskać od nas licencję komercyjną. Wiarygodność publiczna i obroniony rdzeń jednocześnie.

seg-32b1d38914fe = Co <b>nie</b> jest objęte tym podwójnym licencjonowaniem

seg-27636d757dba = <b>Natywna wtyczka OpenCPN</b> (<c1/>) jest licencjonowana na <b>GPL-3.0-or-later</b> (zob. plik <c2/> w tym katalogu), a nie AGPL-3.0, i <b>nie</b> jest oferowana na licencji komercyjnej. Jest ładowana do OpenCPN i zbudowana względem nagłówka API wtyczek na licencji GPL-2.0-or-later, co jest zwykłą podstawą wtyczek OpenCPN. Reszta <c3/> (wtyczka Signal K i przekaźnik TCP dla OpenCPN) pozostaje wyłącznie na AGPL-3.0.

seg-f90c983e0ee3 = <b>Kshana Pro</b> i inne zastrzeżone nakładki są <b>odrębnymi produktami o zamkniętym kodzie</b> na własnych warunkach komercyjnych. Nie należą do tego repozytorium i nie są oferowane na licencji AGPL.

seg-e340445b7f17 = <b>Zależności</b> zachowują własne (permisywne) licencje. Celowo utrzymujemy drzewo zależności permisywnym (Apache-2.0 / MIT / BSD / ISC / …) właśnie po to, aby wydanie komercyjne można było oferować bez przeszkód; zależność copyleft by je skażała. Zob. <a1><c1/></a1>.

seg-810191f19d4d = <b>Kody pamięci podstawowej Galileo E1</b> (<c1/>, <c2/>; <b>niedołączane od { "0.36" }</b>: każdy użytkownik dostarcza własną kopię, <c3/> lub <c4/> / <c5/>, odczytywaną przez <c6/>). Są to kody podstawowe E1-B i E1-C z załączników C.7 i C.8 do dokumentu kontroli interfejsu sygnału w przestrzeni kosmicznej Usługi Otwartej Galileo (OS SIS ICD), wydanie { "2.0" }, styczeń { "2021" }, © Unia Europejska { "2021" }, wyodrębnione bez zmian z załączników do pliku PDF (adres źródłowy, SHA-256 i porównanie z wydaniem { "1.3" } znajdują się w <a1><c7/></a1>). <b>Nie</b> są objęte licencją AGPL-3.0 ani licencją komercyjną i żadna z tych licencji nie przyznaje do nich żadnych praw. Co mówi sam ICD, cytat z wydania { "2.0" }:

seg-daef032cbe43 = Warunki użytkowania §{ "3" }: „Informacje zawarte w OS SIS ICD, wraz z jego załącznikami, podlegają prawom własności intelektualnej”. „OS SIS ICD może być powielany w części lub w całości i/lub przekazywany osobie trzeciej wyłącznie zgodnie z opisanym tu dozwolonym użyciem i na następujących warunkach: niniejsze »Warunki użytkowania i zastrzeżenia« oraz warunki załącznika G zostają przyjęte, powielone i przekazane w całości i bez zmian wraz z powielanymi i/lub przekazywanymi informacjami; nota o prawach autorskich »© European Union { "2021" }« nie jest usuwana z żadnej strony.” I: „Korzystanie z informacji zawartych w OS SIS ICD, w tym z kodów rozpraszających, które podlegają IPR, jest dozwolone na warunkach określonych w załączniku G.”

seg-0fb25fafd9a2 = Załącznik G (wydanie { "2.0" }; załącznik H w wydaniu { "2.1" }, to samo brzmienie) definiuje „Dane techniczne OS SIS ICD” jako obejmujące „kody pamięci E1 i E5” oraz udziela zobowiązania do niedochodzenia roszczeń, które jest „niewyłączne i wolne od opłat” oraz „niezbywalne i niepodlegające sublicencjonowaniu”. Jego lista z §G.3, którą nazywa wyczerpującą, obejmuje: „a) wykorzystanie Danych technicznych OS SIS ICD, w tym ich integrację i włączenie do jakichkolwiek Produktów”; „b) przechowywanie Danych technicznych OS SIS ICD, pod warunkiem wskazania źródła”; „c) powielanie OS SIS ICD, w całości lub w części, jego rozpowszechnianie i publikację w celach niekomercyjnych, nienastawionych na zysk i na takiej skali, bez zmieniania dokumentu ani dodawania jakiegokolwiek elementu”; oraz „d) zamieszczanie odnośników do witryny UE, na której dokument jest opublikowany”. „Produkty” oznaczają oprogramowanie, urządzenia i usługi o wartości dodanej „wykorzystujące Sygnał OS”. Mówi on także: „Osoba Upoważniona nie może twierdzić ani sugerować w żadnych materiałach promocyjnych ani w żaden inny sposób, że Produkty zostały opracowane przez UE, są przez nią lub dla niej używane albo zostały przez UE zatwierdzone lub poparte”.

seg-8531368368ba = <b>Decyzja ({ "0.36" }): bez redystrybucji.</b> Nie podano wyraźnej licencji otwartej. Użycie wewnątrz produktu programowego (G.3 a) oraz przechowywanie ze wskazaniem źródła (G.3 b) są objęte na warunkach samego ICD, natomiast redystrybucja (G.3 c) wyłącznie w celach niekomercyjnych, nienastawionych na zysk i z powielonymi obok, niezmienionymi Warunkami i załącznikiem G. Ponieważ Kshana jest oferowana także na licencji komercyjnej, pliki usunięto z repozytorium i pakietów; silnik odczytuje w czasie działania kopię użytkownika, a bez niej sygnały Galileo E1 zwracają błąd, który wyjaśnia, jak je dostarczyć. Każdy użytkownik opiera się bezpośrednio na upoważnieniu UE; Kshana nie może go przekazać dalej. Kshana nie jest opracowana przez Unię Europejską, nie jest przez nią używana, zatwierdzona ani poparta.

seg-e18986aeab7f = <b>Znaki towarowe.</b> „Kshana” i jej znaki są znakami towarowymi Ashforde OÜ. Żadna z licencji nie przyznaje praw do nazwy ani znaków; rozwidlenia i wersje pochodne muszą używać innej nazwy. Zob. <a1><c1/></a1>.

seg-f6b7345c2c60 = Wkład

seg-1709eb19c2c5 = Wkład jest przyjmowany na podstawie wewnętrznych zasad projektu dla współtwórców, które licencjonują Twój wkład na AGPL <b>i</b> przyznają Ashforde OÜ prawo do włączenia go do wydania na licencji komercyjnej (aby podwójne licencjonowanie nadal działało). Zob. <a1><c1/></a1>.

seg-940c8cce5137 = Pytania

seg-e678f2ecc571 = Pytania o licencje, oferty komercyjne i „która opcja nas dotyczy?” → <b><a1>contact@ashforde.org</a1></b>.

seg-05d34a27a0ba = <s1>Poprzednia</s1>Dziennik zmian

seg-4f7f660eea0a = <s1>Następna</s1>Bezpieczeństwo

seg-2d2b32369c30 = Co nie jest objęte tym podwójnym licencjonowaniem

seg-a1bee28d1dfd = Źródło: <c1/>

seg-b8dd205e82c4 = Kshana jest <b>objęta podwójną licencją</b>. Otwartego silnika można używać na podstawie <b>albo</b> licencji otwartej (AGPL-3.0), <b>albo</b> <b>licencji komercyjnej</b> od Ashforde OÜ. Wybierz tę, która odpowiada zamierzonemu sposobowi użycia.

seg-5faea0aba960 = Ten dokument wyjaśnia model prostym językiem. Jest przewodnikiem, a nie poradą prawną, i nie zmienia samych licencji. Wiążące warunki znajdują się w <a1><c1/></a1> (GNU AGPL-3.0) oraz w każdej umowie komercyjnej podpisanej z Ashforde OÜ. Jeśli kiedykolwiek się różnią, rozstrzygają tamte dokumenty.

seg-89bd60937f0b = Opcja A: otwarte oprogramowanie, GNU AGPL-3.0-only

seg-785200a5419a = Domyślna. Pełny tekst znajduje się w <a1><c1/></a1>. W skrócie AGPL pozwala używać, badać, modyfikować i redystrybuować Kshana za darmo, <b>pod warunkiem że</b>:

seg-5bc05999ee9d = jeśli <b>rozpowszechniasz</b> Kshana lub pochodną, udostępnisz <b>pełny odpowiadający kod źródłowy</b> na licencji AGPL; oraz

seg-5c9136766fdf = jeśli umożliwiasz użytkownikom korzystanie ze <b>zmodyfikowanej</b> Kshana <b>przez sieć</b> (wyróżniająca klauzula AGPL, §{ "13" }), musisz zaoferować <b>tym użytkownikom</b> odpowiadający kod źródłowy swojej zmodyfikowanej wersji na licencji AGPL.
