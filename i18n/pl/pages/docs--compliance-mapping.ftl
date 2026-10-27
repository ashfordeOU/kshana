# docs--compliance-mapping: translations (pl)

seg-6555ff9a6d8e = Wynik

seg-2247a2344710 = Znaczenie

seg-d6476863f862 = Możliwość

seg-ad856ad710eb = Status

seg-8d216d42c776 = Ocena zaufania do dziennika odbiornika

seg-ff808ce8ec48 = Alternatywne i zróżnicowane źródła PNT

seg-3621a68a508c = Odtwarzalne pochodzenie przebiegu

seg-50fe2a3ff712 = Monitorowanie integralności i poziomy ochrony

seg-554a16dc7965 = Źródło: <c1/>

seg-76db63e8d2de = Nabywcy i producenci odbiorników odpowiadają przed publicznymi ramami odporności. Ten folder wiersz po wierszu odwzorowuje to, co { -brand } oblicza i rejestruje, na te ramy, a <c1/> wypełnia odwzorowanie na podstawie przebiegów, którymi faktycznie dysponujesz.

seg-e22a3aca9550 = <b>Sformułowania.</b> Wyniki { -brand } <em>dostarczają dowodów na</em> spełnienie wymagania. Nie są oceną ani zatwierdzeniem żadnego produktu, a żaden z tych plików nie jest oświadczeniem organu oceniającego; { -brand } takim organem nie jest. Treść wymagań jest sparafrazowana, nigdy nie jest powielana.

seg-2602c3f5aff6 = Ramy

seg-245fe1f87b08 = Plik

seg-d104ce416298 = US DHS Resilient PNT Conformance Framework, v2.0

seg-0f7279ffb619 = Wytyczne IMO dotyczące zakłóceń GNSS dla statków

seg-f318176b86de = Wytyczne EASA dotyczące zakłóceń GNSS dla lotnictwa

seg-7939ac1eea3b = Dyrektywa UE NIS2, art. { "21" }

seg-f2eccc9b815f = EN { "16803" } (norma płatna; wyłącznie według części i numerów klauzul widocznych w katalogu)

seg-4970f6c15605 = NIST IR 8323r1, Foundational PNT Profile (styczeń { "2023" })

seg-499fc17fb83a = <b>Pakiety norm</b> ({ "0.38" }) zamieniają ramy w scenariusze z oceną: każdy pakiet ma scenariusze, progi ustalone przed przebiegiem i wiersze, dla których dostarcza dowodów. <c1/> je pokazuje.

seg-9c0eb89a2fbe = Pakiet

seg-191baf9f2738 = DHS Resilient PNT Conformance Framework, profile testowe dla poziomów { "1" } do { "4" }

seg-13e63b993f26 = IMO MSC.1/Circ.1575, okrętowe przetwarzanie danych PNT: poziomy dokładności i integralność

seg-aa77ffe0acbf = ICAO Doc { "9849" } Appendix F, monitorowanie, ocena i ograniczanie zakłóceń GNSS

seg-b9387be0e4f1 = Każdy plik wymienia swoje dokumenty źródłowe z wersją, adresem URL, datą odczytu oraz informacją, co sprawdzono, a czego nie. Źródła odczytano 2026-10-09 (profil NIST 2026-10-18; biuletyn EASA i strony katalogowe EN { "16803" } sprawdzono ponownie 2026-10-10). Gdy źródło dało się odczytać tylko przez lustro lub stronę katalogową, plik to zaznacza.

seg-e98e25897176 = Każdy test trzech ocenianych pakietów norm, z rzeczywistych przebiegów silnika v{ $version } (`kshana standards-pack run`): dhs-rpcf: { "6" } spełnionych, { "1" } niespełniony, { "2" } wymagają danych wejściowych; imo-circ-1575: { "1" } spełniony, { "4" } niespełnione, { "2" } wymagają danych wejściowych; icao-doc9849-appf: { "6" } spełnionych, { "0" } niespełnionych, { "2" } wymagają danych wejściowych. Łącznie { "13" } spełnionych, { "5" } niespełnionych i { "6" } wymaga danych wejściowych, których silnik nie ma (dziennika odbiornika lub dokumentacji sprzętu). Każdy próg ustalono przed przebiegiem; niespełniony próg pozostaje niespełniony. Spełniony próg oznacza, że modelowany scenariusz spełnił podany próg, i nic nie mówi o produkcie. Pakiety dostarczają dowodów dla cytowanych wierszy; nie są oceną. Wyłącznie doradczo: wynik analizy z narzędzia badawczo-inżynieryjnego; nie jest to sprzęt nawigacyjny z zatwierdzeniem typu ani usługa bezpieczeństwa życia; nie może być jedyną podstawą żadnej decyzji nawigacyjnej ani dotyczącej bezpieczeństwa.

seg-092dd691ca17 = Raport

seg-10fac3e641e0 = zapisuje <c1/> i <c2/> (<c3/> zmienia nazwę). Danymi wejściowymi są pliki wyników z wcześniejszych przebiegów: przebieg scenariusza zapisuje <c4/> obok <c5/>, a <c6/> zapisuje własny. Rodzaj każdego przebiegu odczytuje się z pliku scenariusza leżącego obok wyniku, z treści wyniku receiver-trust albo z pola <c7/> na najwyższym poziomie, i musi to być rodzaj znany silnikowi. Wynik jest wymieniany jako nieużyty, wraz z powodem, i nie liczy się do niczego, gdy nie da się znaleźć jego rodzaju, nie jest to znany rodzaj albo sąsiedni scenariusz i własne pole <c8/> wyniku się nie zgadzają. (<c9/> wyniku i skrót pliku scenariusza nie są porównywane: silnik oblicza pierwszy z przetworzonego scenariusza, a skrót pliku dotyczy tekstu, więc to różne wielkości.)

seg-464351dcdcc3 = <b>Sama etykieta rodzaju nie jest dowodem.</b> Przebieg liczy się dla danej możliwości tylko wtedy, gdy jego wynik zawiera także pola zapisywane przez ten rodzaj (na przykład wynik <c1/> wymaga wskaźników jakości i wierszy dla poszczególnych epok; wynik <c2/> wymaga liczebności próbek). Pola wymieniono w <c3/> (<c4/>), a wynik, w którym brakuje któregoś z nich, nie jest liczony. Skrót, który nie jest szesnastkowy, nie jest zgłaszany jako skrót. Wynik receiver-trust, którego liczebności nie są liczbami całkowitymi albo w którym liczba wykryć lub zgodnych przekracza liczbę możliwych do oceny, jest wyłączany i wymieniany jako nieużyty.

seg-5a316d97f37b = Dla każdego wiersza raport podaje jedną z wartości:

seg-2243532bd26b = każda możliwość wymieniona w wierszu ma co najmniej jeden przebieg w zestawie

seg-e905ae20cec1 = niektóre mają

seg-e23d6dfc4a00 = żadna nie ma

seg-cf223ce076ce = żaden wynik { -brand } nie odnosi się do tego wiersza

seg-ec76997fb4d4 = Kolumna luki jest drukowana dla każdego wiersza, także dla tych z dowodami: przebieg, który dostarcza dowodów na jakąś możliwość, nadal pozostawia większość wymagania innym dowodom. Raport powtarza na początku regułę sformułowań. <c1/> drukuje tabele statyczne, a <c2/> listę źródeł.

seg-f1c508a908ad = Przebiegi receiver-trust wnoszą także liczebności, które podają (zdarzenia wykryte spośród możliwych do oceny, predykcje zgodne spośród możliwych do oceny). Opisują one dany dziennik, oceniony względem zdarzeń i tolerancji ustalonych przed przebiegiem, i są podawane tak, jak podaje je przebieg.

seg-662b717575e0 = Rodzaje przebiegów

seg-4377e24c36f5 = stan zaufania w każdej epoce z własnego dziennika rzeczywistego odbiornika, czasy alarmów oraz zgodność ze zdarzeniami ustalonymi przed przebiegiem

seg-766182e85848 = Skutki zagłuszania w bilansie łącza

seg-6bee09017be6 = stosunek nośnej do gęstości szumu i stan śledzenia dla każdego satelity przy podanej geometrii zagłuszacza

seg-213117f2877a = jamming, lunar-jamming, conflict-resilience

seg-48fb757a45fc = Detekcja spoofingu i meaconingu

seg-2e4a3355a936 = decyzje detektora i zdolność detektora do rozróżniania przy podanym ataku spoofingowym

seg-6fdf939cef5c = spoof, spoof-detect, impairment-eval

seg-e9a55e5a015b = poziomy ochrony, dostępność względem limitów alarmowych i wyniki detekcji usterek

seg-8799ac418ef0 = integrity, araim-reference-check, lunar-integrity

seg-6344bf03463c = Holdover i dryf bezwładnościowy

seg-a643345646c3 = narastanie błędu pozycji lub czasu przy odmowie dostępu do GNSS, względem podanego progu

seg-7483fbb49a12 = clock, inertial, gnss-ins, ins-trn-coast, hybrid, hybrid-ukf, fusion, timetransfer, quantum-gnss-free-nav, quantum-time-transfer

seg-97e06c8a9b7f = parametry nawigacji lub synchronizacji czasu ze źródeł niezależnych od podstawowego pasma GNSS

seg-0cb972a92a4c = combined-altpnt, terrain-nav, terrain-slam, gravity-map, leo-pass, leo-pvt, leo-pnt-chain, hybrid-optical-rf, ntn-positioning, hybrid, fusion

seg-25291db2798d = Ocena odporności na zbiorach zagrożeń

seg-9eef8dd0d9b9 = wskaźniki przetrwania i odporności dla każdego wektora zagrożenia w podanym zbiorze, z podanymi założeniami

seg-bdaa039247bd = conflict-resilience, campaign

seg-e4be26a0cc63 = skrót scenariusza, wersja silnika i ziarno (seed) zapisane w każdym wyniku, aby przebieg można było powtórzyć

seg-89edc36c3560 = każdy przebieg, którego wynik zawiera <c1/>

seg-488aeabdc552 = <s1>Poprzednia</s1>Uruchamianie odbiornika względem scenariusza

seg-53a872636d5a = <s1>Następna</s1>Ramy odpornego PNT Departamentu Bezpieczeństwa Wewnętrznego USA
