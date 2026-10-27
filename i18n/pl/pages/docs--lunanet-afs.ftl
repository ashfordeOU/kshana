# docs--lunanet-afs: translations (pl)

seg-33f4c7af9c53 = Nośna

seg-da9970bcbab7 = Źródło: <c1/>

seg-4013a17a3517 = LunaNet Augmented Forward Signal: kody, format komunikatu i <c1/>

seg-c1a27b995345 = Kshana implementuje kody rozpraszające i warstwę komunikatów <b>Augmented Forward Signal (AFS)</b> LunaNet tak, jak definiuje je jedno wydanie specyfikacji, i sprawdza się względem drukowanych tabel tego wydania.

seg-e9bd99bbddb5 = <b>Przypięcie.</b> LunaNet Interoperability Specification (LNIS) <b>Wersja { "5" }</b>, Dokument obowiązujący { "1" } Tom A: <em>LunaNet Signal-In-Space Recommended Standard, Augmented Forward Signal</em> (LSIS-AFS) <b>Wersja { "1.0" }, { "29" } stycznia { "2025" }</b> (NASA). Pobrano 2026-10-18; PDF SHA-256 <c1/> (<a1>pochodzenie</a1>). Późniejsze wydanie to inne przypięcie i może zmienić kody: dokument oznacza swoje tabele kodów { "{" }LSIS-TBC{ "}" } i mówi, że są one „dołączone wyłącznie dla ułatwienia testów i integracji”. Każdy raport podaje to wydanie.

seg-6845e671bf24 = Wyłącznie doradczo: wynik analizy z narzędzia badawczo-inżynieryjnego; nie jest to sprzęt nawigacyjny z zatwierdzeniem typu ani usługa bezpieczeństwa życia.

seg-69a98d01f489 = Generator kodów LunaNet AFS sprawdzony względem drukowanych kolumn specyfikacji, z prawdziwego przebiegu silnika v{ $version } (`kshana lunanet-afs-check spec`, przypięty do LNIS V5, AD1 Tom A (LSIS-AFS) V1.0, { "29" } stycznia { "2025" }; dokument oznacza swoje tabele kodów { "{" }LSIS-TBC{ "}" }). Spełnionych jest { "9" } z { "10" } sprawdzeń; B4 jest NOT MET ({ "420" } z { "421" } zgodnych). Sprawdza strumień symboli względem jednego wydania opublikowanej specyfikacji i nic nie mówi o żadnym węźle ani usłudze LunaNet. Wyłącznie doradczo: wynik analizy z narzędzia badawczo-inżynieryjnego; nie jest to sprzęt nawigacyjny z zatwierdzeniem typu ani usługa bezpieczeństwa życia. Sprawdza strumień symboli względem jednego wydania opublikowanej specyfikacji i nic nie mówi o żadnym węźle ani usłudze LunaNet.

seg-4c3f77d97294 = Co jest zaimplementowane

seg-a0b684e44fb0 = Warstwa

seg-5d987fca539c = Co

seg-df52127d74b6 = Gdzie

seg-637035a0b1c1 = AFS-I (dane)

seg-dbee58df4c92 = Kod Golda { "2047" } skrócony cyklicznie do { "2046" } chipów, G2 opóźniony o liczbę chipów zależną od PRN, { "1.023" } Mchip/s, BPSK({ "1" }), { "500" } symboli/s, PRN { "1" } do { "210" }

seg-d4480ead20d1 = <c1/>, nazwa sygnału <c2/>

seg-6d84dce7f6d0 = AFS-Q (pilot)

seg-2ebf619c9cb6 = Kod Weila { "10230" } (konstrukcja GPS L1C) warstwowany z 4-chipowym kodem wtórnym (S0 do S3) i 1500-chipowym trzeciorzędowym kodem Weila ({ "12" } s), { "5.115" } Mchip/s, BPSK({ "5" }), bez danych. <c1/> i nazwa sygnału <c2/> to replika odbiornika, podstawowy x wtórny ({ "8" } ms): trzeciorzędowa nakładka synchronizacji ramki o długości { "12" } s jest z niej pominięta, ponieważ akwizycja i śledzenie nie korelują z repliką { "12" } s. <c3/> to pełny kod { "12" } s

seg-03805fa6d5b1 = { "2492.028" } MHz (LSIS-020)

seg-906440b861cd = Ramka

seg-20bc4439d3d7 = SP { "68" } + SB1 { "52" } + { "5880" } przeplecionych symboli = { "6000" } symboli = { "12" } s przy { "500" } symboli/s

seg-a242d95d701f = { "9" } bitów (FID { "2" }, TOI { "7" }), BCH({ "51,8" }), generator { "763" } ósemkowo, z 256-hipotezowym korelacyjnym dekoderem z dokumentu

seg-df8894e1304f = CRC

seg-a04ccd611398 = CRC-24Q, generator ({ "1" }+X)P(X) (dodatek H)

seg-e225f10d7848 = Przeplatacz

seg-cb075da6f8cf = { "60" } wierszy x { "98" } kolumn, zapis wierszami i odczyt kolumnami

seg-d544025254af = Oba składniki są przyjmowane przez <c1/>, <c2/>, <c3/> i <c4/> jak każdy inny sygnał, więc nagranie można przeszukać pod kątem AFS-I lub AFS-Q (<c5/>), a scenę syntetyczną można wytworzyć do testów programowych odbiorników. Scena syntetyczna, jak w przypadku każdego innego sygnału, jest plikiem dla programowego odbiornika; nic tu nie steruje sprzętem radiowym.

seg-6d7a9d17946d = Co <b>nie</b> jest zaimplementowane

seg-95731dbf3333 = <b>Kodowanie LDPC o sprawności 1/2 podramek { "2" } do { "4" }.</b> Jego macierze kontrolne znajdują się w załączniku { "1" }, osobnym pliku, którego nie ma w PDF i który nie jest dołączony. Podramki { "2" } do { "4" } są przenoszone i sprawdzane jako nieprzezroczyste bloki symboli o określonej długości, a słowa CRC-24Q w nich zawarte nie są weryfikowane. Strumień, który przechodzi <c1/>, nie jest wykazany jako zawierający poprawne słowa kodowe.

seg-67bb5d1038c7 = <b>Treść komunikatów</b> (MSG-G1, MSG-G2, MSG-G4, ...): dokument pozostawia kilka definicji do napisania (TBW).

seg-bff5304c6187 = <b>Przydział kodów na węzeł LunaNet</b> (tabela F-1 jest TBD). PRN { "1" } do { "12" } mają tymczasowe przydziały testowe (tabela { "11" }). <c1/> używa kodu podstawowego PRN <em>n</em> z kodem wtórnym S((n-1) mod { "4" }); powyżej PRN { "12" } jest to wzorzec tej implementacji, a nie dokumentu. <c2/> i <c3/> przyjmują dowolną kombinację, z kodem trzeciorzędowym dowolnego PRN.

seg-6588307842fe = Bilans łącza, błąd sygnału w przestrzeni kosmicznej, wymagania dotyczące mocy i koherencji (LSIS-100 i następne).

seg-e0f2ddce6dff = <c1/> uruchamia implementację względem drukowanych tabel i przykładów rozwiązanych z dokumentu (progi B1 do B10 z <a1>wstępnej rejestracji</a1>) i wypisuje każdy z liczbą i statusem. <c2/> kończy z kodem { "1" }, o ile nie wszystkie progi są spełnione.

seg-dafa47406a38 = <c1/> odczytuje strumień symboli z twardymi decyzjami (tekst z <c2/> i <c3/>; białe znaki ignorowane) i sprawdza wzorzec synchronizacji, dekodowanie SB1, FID (zdefiniowane jest tylko { "0" }), ciągłość TOI (zwiększanie o jeden modulo { "100" }) i odstęp ramek ({ "6000" } symboli). Kończy z kodem { "1" } przy każdym problemie.

seg-f12425044025 = <c1/> zapisuje strumień testowy: wzorzec synchronizacji z dokumentu, długości SB1 i ramek, z <b>zastępczymi</b> podramkami { "2" } do { "4" } (naprzemienne wypełnienie z LSIS-300, bez kodowania LDPC, bez komunikatu). Są to symbole do testowania sprawdzarki lub dekodera, a nie przebieg; Kshana nie zapisuje żadnego sygnału.

seg-3b3548bd0b61 = Python: <c1/>, <c2/>, <c3/>. WebAssembly: te same nazwy. MCP: <c4/> (<c5/> spec, symbols lub generate). Wtyczka: <c6/>. Studio i JetBrains: N/A (<a1>SURFACES.md</a1>).

seg-2133870991ca = Progi podane w <c1/> zanim powstał generator; testy w <c2/>.

seg-b74d5800a039 = Próg

seg-e75915599d5e = AFS-I pierwsze i ostatnie { "24" } chipy, { "210" } PRN

seg-f654db18922f = <b>MET</b>, { "420" } z { "420" }

seg-55d0d7168ceb = drukowany stan początkowy G2 jest stanem po drukowanym opóźnieniu

seg-41590da4d1ac = <b>NOT MET</b>, { "0" } z { "210" }: twierdzenie miało kierunek odwrócony. Post hoc (B1c, niezarejestrowane z góry): drukowany stan jest stanem po { "2047" } minus opóźnienie, { "210" } z { "210" }

seg-b94947c99f9a = Legendre({ "10223" }) równa się tabeli D-1

seg-75c8da01c0f1 = MET

seg-e3402e2420bd = AFS-Q kod podstawowy, pierwsze i ostatnie { "24" } chipy, { "210" } PRN

seg-678604d6e463 = Legendre({ "1499" }) równa się tabeli E-1, a kod trzeciorzędowy, pierwsze i ostatnie { "24" } chipy, { "210" } PRN

seg-17b1420f8c0c = <b>NOT MET</b>, { "420" } z { "421" }: ciąg Legendre'a się zgadza i { "419" } z { "420" } kolumn kodu się zgadza. Ostatnie { "24" } chipy wydrukowane dla PRN { "147" } (<c1/>) są tą samą wartością, którą wydrukowano dla PRN { "151" }, którego kod generator odtwarza; dwa różne indeksy Weila ({ "607" } i { "612" }) nie dają tych samych ostatnich { "24" } chipów, więc wpis dla PRN { "147" } jest najprawdopodobniej błędem druku w dokumencie. Nie można tego rozstrzygnąć bez osobnego pliku kodów z załącznika { "3" }. Przypięte testem

seg-aea9620e7bf1 = kody wtórne S0 do S3 równe tabeli { "10" }

seg-2996e986d247 = <b>MET</b> (własne stałe dokumentu)

seg-23c9277f62e6 = przykład rozwiązany SB1 z rysunku { "8" }

seg-fb70493dcdcf = <b>MET</b>: 0x045 koduje się do 0x229F61DBB84A0 i dekoduje do FID { "0" }, TOI { "69" } (jeden przykład)

seg-acce07c33dec = wartość kontrolna CRC-24Q dla <c1/>

seg-71c490aca8d7 = <b>MET</b>: 0xCDE703 (wartość katalogowa, spoza specyfikacji)

seg-789b31d53873 = arytmetyka ramek

seg-5b5da00ad1c8 = przeplatanie, a następnie odwrotne przeplatanie

seg-80f9cd313ec4 = <b>MET</b> (własność, MODELLED)

seg-92a7addfdb8c = wzorzec synchronizacji

seg-215913f74706 = <b>MET</b> ({ "68" } symboli; sprawdzenie transkrypcji)

seg-3b51bd143c19 = B1 do B4 są VALIDATED względem drukowanych tabel wskazanego wydania, które dokument oznacza { "{" }LSIS-TBC{ "}" }. Pełna pętla scena–akwizycja–śledzenie obu składników spełnia te same progi co inne sygnały (<c1/>).

seg-9edb6e5771ca = <s1>Poprzednia</s1>Weryfikacja Galileo OSNMA

seg-d0043d0f578a = <s1>Następna</s1>Jammertest jako arbiter

seg-52946c9ff62a = Co nie jest zaimplementowane

seg-339c9eeb510b = kshana lunanet-afs-check
