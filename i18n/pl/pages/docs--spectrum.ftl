# docs--spectrum: translations (pl)

seg-6cb7a787ac67 = Bibliografia

seg-cbf0f9bcd2d8 = Wyrocznia

seg-6e0cb6acc073 = VALIDATED

seg-33f4c7af9c53 = Nośna

seg-c5ce76c91ff7 = Etykieta

seg-a86ce24d81de = Pasmo

seg-ea152d84aabc = { "465" } MHz

seg-278d0b375f6f = { "20.46" } MHz

seg-39e207bee75b = { "2492.028" } MHz

seg-48fabff33863 = { "5020" } MHz

seg-72f051e2d7e1 = Sygnał

seg-47408d30d095 = Nominalne C/N₀

seg-995748f9c74c = { "49.41" } dB-Hz

seg-5393b075ff7f = { "43.48" } dB-Hz

seg-4321ccaeeca5 = { "46.73" } dB-Hz

seg-59fd1427d61b = { "54.51" } dB-Hz

seg-0f47178201ca = { "49.23" } dB-Hz

seg-f8e6beeceedd = { "47.41" } dB-Hz

seg-53a7343c076e = Twierdzenie

seg-430edd66bda0 = Niemodelowane

seg-64509c048541 = Co jest modelowane

seg-f07519ff8071 = Źródło: <c1/>

seg-901c3e032de7 = Model widma i waterfall

seg-eac92092dd34 = Rodzaj scenariusza <c1/> buduje pasmo L globalnych systemów nawigacji satelitarnej (GNSS) oraz każde inne pasmo zajmowane przez zaprojektowany sygnał (ultrawysokie częstotliwości (UHF), pasmo S, pasmo C) jako jedną widmową gęstość mocy (PSD), pozwala jej zmieniać się według skryptowej osi czasu zagłuszacza i sprowadza ją do tego, na czym zależy pętli śledzącej: stosunku zagłuszacza do sygnału (J/S) i efektywnego stosunku nośnej do gęstości szumu (C/N₀) w każdym paśmie. Rysuje wynik jako waterfall (częstotliwość w poprzek, czas w dół, kolor jako moc) obok słupków C/N₀ dla poszczególnych pasm oraz czyta i zapisuje nagrania Signal Metadata Format (SigMF), tak aby rzeczywiste przechwycenie można było oszacować i wykreślić obok modelu.

seg-0007b6ba97ca = Zapisz dołączony przykład do pliku i uruchom go:

seg-5e205b189b26 = W repozytorium roboczym <c1/> uruchamia ten sam plik.

seg-261deb22b4fa = Kod: <c1/> (model, rodzaj, estymator Welcha), <c2/> (kodek nagrań), <c3/> (widma sygnałów o jednostkowym polu i współczynnik separacji widmowej) oraz <c4/> (ustawienia wstępne projektu sygnału, które pasmo może nazwać).

seg-bb1153873209 = Modulacja

seg-9758b36b554c = Domyślna moc odbierana

seg-a1a68286b809 = Domyślna szerokość pasma odbiornika

seg-27a2cdc8183f = { "1575.42" } MHz

seg-66a103496266 = binarne kluczowanie fazy, BPSK({ "1" })

seg-f386c2e2e352 = −{ "158.5" } dBW (IS-GPS-200)

seg-50112ba8867d = { "2.046" } MHz

seg-b7755cb9a384 = multipleksowana binarna nośna przesunięta, MBOC(6,1,1/11), lub binarna nośna przesunięta BOC({ "1,1" })

seg-6043a4ef45ca = −{ "157.25" } dBW (Galileo OS SIS ICD Issue { "2.1" }, Table { "12" })

seg-6dc5e3668a78 = { "14.322" } MHz

seg-f03380403a2a = { "1227.60" } MHz

seg-06c245582533 = BPSK({ "1" }) (kody CM i CL multipleksowane w czasie)

seg-fa56c0085dbc = −{ "160.0" } dBW (IS-GPS-200)

seg-1982a811e1ef = { "1176.45" } MHz

seg-dd074e33242e = BPSK({ "10" })

seg-f30f2e48a3bf = −{ "157.9" } dBW (IS-GPS-705)

seg-898ae19a946b = −{ "155.25" } dBW (Galileo OS SIS ICD Issue { "2.1" }, Table { "12" })

seg-3216d5cd918d = GPS (Global Positioning System) L1 C/A to kod zgrubny/akwizycyjny; L2C to cywilny sygnał L2; IS-GPS-200 i IS-GPS-705 to specyfikacje interfejsu GPS; Galileo OS SIS ICD to Galileo Open Service Signal-in-Space Interface Control Document. Moce odbierane to minima ze specyfikacji; szerokości pasma są wyborami modelowymi. Oba parametry można nadpisać dla każdego pasma. Bez tabeli <c1/> przebieg używa tych pięciu. GLONASS G1/G2, BeiDou B1/B2 i Galileo E6 <b>nie</b> należą do pasm nazwanych.

seg-79cc2ed8195b = Wpis <c1/> przyjmuje jedną z trzech postaci:

seg-67d0591c69d8 = nazwa z powyższej tabeli, z opcjonalnymi <c1/>, <c2/> oraz, dla <c3/>, <c4/>;

seg-8596194c81f2 = <c1/>: sygnał niskiej orbity okołoziemskiej (LEO) lub reprezentatywny projekt sygnału z biblioteki ustawień wstępnych rodzaju <c2/> (<a1>LEO-SIGNAL.md</a1>), w dowolnym paśmie, rysowany ze wszystkimi składowymi (akwizycyjną, danych, pilotową, podnośnymi z podziałem częstotliwości) i ograniczony do pasma nadawania; C/N₀ i J/S odnosi się do składowej śledzonej, a <c3/> tylko ją oznacza. Ustawienia wstępne to <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/> i <c15/>;

seg-2ca46a7f2949 = pasmo własne: dowolne <c1/> z <c2/>, <c3/> (<c4/>, <c5/> lub <c6/>) i <c7/>.

seg-fcb0f9fcffbf = Zagłuszacze (<c1/>) przyjmują <c2/>:

seg-457e5e95c677 = <c1/> — ton fali ciągłej (CW) przy <c2/>;

seg-3120ac4f6710 = <c1/> — płaski szum w <c2/>;

seg-7d975838a2e6 = <c1/> — płaski szum w szerokim <c2/> (zagłuszacz zaporowy): ta sama gęstość co <c3/>, nazwany osobno, ponieważ rodzaj <c4/> ocenia go jako szerokopasmowy;

seg-d13b177946d2 = <c1/> — liniowe przemiatanie piłokształtne o szerokości <c2/> co <c3/>;

seg-675fb74a89e4 = <c1/> — szum szerokopasmowy, którego widmo jest własną modulacją pasma <c2/>.

seg-64d7a14a198e = Każdy podaje albo <c1/>, albo równoważną moc promieniowaną izotropowo <c2/> z <c3/> (i opcjonalnie <c4/>), co przechodzi przez tłumienie w wolnej przestrzeni rodzaju <c5/>. <c6/> i <c7/> skryptują oś czasu.

seg-8e718c09f7d8 = Odbiornik (<c1/>) ustala poziom szumu, <c2/> przy <c3/> dla temperatury anteny <c4/> i współczynnika szumów <c5/>, oraz próg śledzenia.

seg-9b8078bd0df3 = Główny waterfall obejmuje <c1/> (domyślnie od { "1160" } do { "1590" } MHz w { "430" } przedziałach). Każdy wpis <c2/> (<c3/>, <c4/>, <c5/>, <c6/>, domyślnie { "200" } przedziałów) dodaje kolejny waterfall dla własnego zakresu częstotliwości na tej samej osi czasu, dla widma obejmującego kilka pasm.

seg-a550e89c2907 = Łańcuch zakłóceń

seg-12a2c08191c0 = Dla sygnału o widmie jednostkowego pola <c1/> i zagłuszacza o widmie jednostkowej mocy <c2/> współczynnik separacji widmowej (SSC) w paśmie odbiornika <c3/> wynosi <c4/>, a efektywna gęstość nośnej do szumu przy kilku zagłuszaczach jest równa

seg-5c556163af62 = (Betz { "2001" }; Kaplan i Hegarty, <em>Understanding GPS/GNSS</em>, wyd. 3, §{ "9.4" }). Dla jednego zagłuszacza jest to dokładnie równanie przeciwzagłuszeniowe rodzaju <c1/> z <c2/>; blok <c3/> w raporcie uruchamia własne funkcje rodzaju <c4/> na tych samych danych łącza i drukuje różnicę, która z dokładnością do zaokrąglenia wynosi zero.

seg-c11d0cb8e670 = Raport drukuje też C/N₀, które rodzaj <c1/> podaje ze swoją tabelą Q. Tabela zawiera wartości podręcznikowe, w testach przypięte do postaci zamkniętych:

seg-5c21df11e35b = <b>CW i wąskopasmowy: <c1/>.</b> Ton CW na nośnej C/A ma <c2/>, więc <c3/>, a tabela i widma są zgodne. W dołączonym przykładzie ton daje w obu przypadkach { "17.98" } dB-Hz (tabela dawała { "19.74" }, gdy zawierała { "1.5" }).

seg-647e209b1efc = <b>Szerokopasmowy i przemiatany: <c1/>, od { "0.36" }.</b> Jest to szum biały nad listkiem głównym z mocą sygnału w paśmie znormalizowaną do jedności, <c2/>. Tabela zawierała { "1" } aż do wersji { "0.36" }, około { "3" } dB zbyt pesymistycznie (<c3/>).

seg-cd03b9c900e1 = Model widma wyprowadza własne wartości z widm:

seg-b1327e66260b = <c1/> dla szumu dopasowanego do C/A (<c2/>);

seg-45b2cf032a11 = <c1/> dla płaskiego szumu od zera do zera bez normalizacji (<c2/>).

seg-6c2187f0e32b = Zatem dla tych zagłuszaczy dwie drukowane wartości C/N₀ nadal się różnią, zgodnie z założeniem.

seg-73dfbeabcac2 = Każda komórka waterfall to PSD uśredniona po swoim przedziale częstotliwości i swoim wierszu. Chirp jest uśredniany dokładnie po wierszu, pełne przemiatania plus częściowe; zagłuszacz włączający się lub wyłączający w środku wiersza jest ważony swoim współczynnikiem wypełnienia. Oś czasu C/N₀ używa tych samych średnich, więc obraz i liczby są zgodne. Dla każdego pasma oś czasu podaje J/S w paśmie (moc zagłuszacza w szerokości pasma odbiornika do mocy sygnału). Dla każdego zagłuszacza i pasma raport podaje SSC, <c1/>, całkowite J/S, J/S w paśmie i ustalone C/N₀.

seg-2c214a0a30be = Dołączony przykład

seg-4adc00a3ca10 = <c1/>: oś czasu { "60" } s, jeden wiersz na sekundę, antena { "290" } K i współczynnik szumów { "2" } dB (poziom −{ "201.98" } dBW/Hz).

seg-94d1cebc134d = od { "10" } s do { "40" } s: chirp { "16" } MHz wokół L1, przemiatania { "9" } µs, { "50" } mW przy { "100" } m.

seg-b85319af4f85 = Od { "30" } s: ton CW na nośnej L1, { "10" } mW przy { "1" } km.

seg-21e2b4e76832 = Od { "45" } s: płaski szum { "2" } MHz na L2 odbierany z mocą −{ "135" } dBW.

seg-45dd378c692c = Co oblicza przebieg:

seg-eecd7d7530bf = Minimalne C/N₀

seg-1ead35e1aad5 = Pierwsza utrata

seg-bfb55a322ece = Wiersze ze śledzeniem

seg-863ea3f1fbe9 = { "3.23" } dB-Hz

seg-9aa0239a3a0c = { "10" } s

seg-9979940d2359 = { "44.73" } dB-Hz

seg-25364ef39455 = { "4.44" } dB-Hz

seg-c8d0bc71cccd = { "41.98" } dB-Hz

seg-c945914c444c = { "36.86" } dB-Hz

seg-9ff066fb53a6 = nigdy

seg-63d4f00f622d = { "44.08" } dB-Hz

seg-58b097691919 = Ton CW jest powodem, dla którego dwa sygnały L1 rozchodzą się przy { "40" } s. Trafia w szczyt widma C/A i utrzymuje C/A na { "17.98" } dB-Hz, poniżej progu { "25" } dB-Hz. Trafia w zero widma MBOC, więc Galileo E1 wraca do nominalnego C/N₀, gdy chirp ustaje.

seg-064579d5fbac = Same sygnały leżą około { "20" } dB poniżej poziomu szumu, więc waterfall pokazuje poziom szumu i zagłuszacze; słupki C/N₀ pokazują, co odzyskuje rozproszenie widma.

seg-023a7f163106 = Te same zagłuszacze napędzają łańcuchową misję w <c1/> (zob. <a1>CAMPAIGNS.md</a1>): zegar pracuje w holdover, gdy chirp jest włączony, a odbiornik przechodzi na Galileo E1 pod tonem CW.

seg-6b0edbfca134 = Poza pasmem L

seg-63d1fd8043ed = <c1/> umieszcza sygnały pozycjonowania, nawigacji i czasu (PNT) LEO w czterech pasmach obok GPS L1 C/A i Galileo E5a, każde pasmo z własnym zagłuszaczem, na osi czasu { "60" } s. Waterfall <c2/> to pasmo L; trzy <c3/> dodają UHF (od { "455" } do { "475" } MHz), S (od { "2482" } do { "2502" } MHz) i C (od { "5005" } do { "5035" } MHz).

seg-6818247b5863 = { "10" } s: ton CW na nośnej UHF, odbierany z mocą −{ "120" } dBW.

seg-02de8390de31 = { "20" } s: chirp z przykładu pasma L ({ "16" } MHz wokół L1, przemiatania { "9" } µs, { "50" } mW przy { "100" } m).

seg-47e55dfd4e0d = { "30" } s: szum szerokopasmowy, { "40" } MHz wokół { "1185" } MHz, −{ "118" } dBW.

seg-dfa416032770 = { "40" } s: szum wąskopasmowy, { "2" } MHz na nośnej S, −{ "128" } dBW.

seg-1d119727a749 = { "50" } s: szum dopasowany do własnego widma sygnału pasma C, −{ "124" } dBW.

seg-abacb60b16a3 = Co oblicza przebieg (C/N₀ zaprojektowanych sygnałów dotyczy składowej śledzonej, więc wartość nominalna leży poniżej całkowitej mocy odbieranej o udział składowej śledzonej):

seg-1c921b6299e4 = reprezentatywny, BPSK({ "5" }), −{ "150" } dBW

seg-5331cde832fb = { "34.38" } dB-Hz

seg-35588b19fd72 = minimum ze specyfikacji

seg-7d3639369444 = { "3.38" } dB-Hz

seg-9eef1ec7858f = { "38.51" } dB-Hz

seg-c6743d980e6b = opublikowany projekt, −{ "144.9" } dBW

seg-245bf7d080b3 = { "1190.51625" } MHz

seg-f2aed7e062bf = { "46.29" } dB-Hz

seg-c6a19eb8e0b9 = { "41.69" } dB-Hz

seg-a6f2bb955ca2 = reprezentatywny, BPSK({ "10" }), −{ "152" } dBW

seg-b9312cc881d2 = { "40.35" } dB-Hz

seg-03bb124d45d2 = Tylko chirp zabiera sygnał (GPS L1 C/A, od { "20" } s). Każdy inny zagłuszacz pogarsza tylko pasmo, do którego sięga jego widmo: na przykład szum dopasowany w paśmie C ma SSC równy −{ "71.87" } dB/Hz z sygnałem pasma C i poniżej −{ "133" } dB/Hz z każdym innym pasmem.

seg-a8bea652a85d = Ten sam mechanizm napędza scenariusze odporności LEO-PNT (<a1>LEO-PNT.md</a1>):

seg-cf7bc2f52cad = <c1/> zwiększa jeden zagłuszacz zaporowy { "40" } MHz przy { "1185" } MHz o { "5" } dB co { "10" } s, zaczynając od −{ "125" } dBW. GPS L5 zostaje utracony na stopniu −{ "105" } dBW, Galileo E5a przy −{ "100" } dBW i Xona X5 przy −{ "95" } dBW, podczas gdy reprezentatywny sygnał LEO w paśmie L odbierany z mocą −{ "135" } dBW nadal jest śledzony przy −{ "90" } dBW: moc odbierana kupuje zapas J/S dB za dB.

seg-94b65c0e6087 = <c1/> to przemiatanie kampanii przebiegu <c2/> po mocy zaporowego zagłuszacza pasma L5 (<a1>CAMPAIGNS.md</a1>).

seg-67279a0780e4 = <c1/> to kampania łańcuchowa, której fazy czytają C/N₀ GNSS i LEO z przebiegów <c2/>, z panelami pasm S i C.

seg-42b00ae14ffe = IQ, SigMF i Welch

seg-3418c31c4318 = <c1/> rysuje model w jednej chwili jako zespolone próbki fazy i kwadratury (IQ), zapisuje je jako nagranie SigMF (<c2/> lub <c3/>), odczytuje nagranie i szacuje jego PSD metodą Welcha (okno Hanna, nakładanie { "50" } %, uśrednione periodogramy, skalowanie na gęstość). Szum termiczny, sygnały i zagłuszacze podobne do szumu są rysowane przedział po przedziale z własnej gęstości modelu; ton i chirp są rysowane jako rzeczywiste przebiegi. Przy samych zagłuszaczach podobnych do szumu oszacowanie Welcha mieści się w { "0.1" } dB od modelu (mediana). Okresowy chirp jest widmem prążkowym przy swojej szybkości przemiatania, z falowaniem i ogonami poza krawędziami pasma, które gładki model pomija: w dołączonym przykładzie moc całkowita zgadza się w granicach { "0.02" } %, a mediana przedziału różni się o { "0.5" } dB. Migawka to plik zapisany do analizy; nic nie jest nadawane i żaden sprzęt radiowy nie jest sterowany.

seg-a3b0a61b5efe = <c1/> (tylko kompilacje natywne) czyta rzeczywiste nagranie SigMF z <c2/> (plik danych domyślnie ma ten sam rdzeń nazwy z <c3/>), szacuje jego PSD i drukuje je obok modelu przy częstotliwościach nagrania. Plik SigMF nie ma bezwzględnej kalibracji mocy, więc raport podaje medianę przesunięcia i kształt, a nie poziom.

seg-04b08e06811d = W kompilacji WebAssembly odczyt plików jest niedostępny; <c1/> i <c2/> działają na bajtach dostarczonych przez stronę.

seg-69b384afe05d = PSD sygnałów i SSC

seg-a65b87c51f05 = listek główny BPSK(n) 2n × { "1.023" } MHz od zera do zera; listki BOC({ "1,1" }) wyśrodkowane przy ±{ "1.023" } MHz (Betz { "2001" }); SSC równe −{ "61.86" } / −{ "64.87" } / −{ "67.88" } dB/Hz dla C/A×C/A, BOC({ "1,1" })×BOC({ "1,1" }), C/A×BOC({ "1,1" }) z ich postaci zamkniętych Parsevala, wartości stojące za opublikowanymi −{ "61.8" } / −{ "64.8" } / −{ "67.8" } dB/Hz; Q = { "1" } (CW) i { "1.5" } (dopasowany) (Kaplan i Hegarty §{ "9.4" }); wpisy tabeli rodzaju <c1/> są równe postaciom zamkniętym: CW i wąskopasmowy Q = { "1" }, szerokopasmowy i przemiatany Q = { "2" } (szum biały nad listkiem głównym, moc w paśmie znormalizowana; { "1" } aż do wersji { "0.36" })

seg-d2afc6e05969 = Waterfall, oś czasu J/S i C/N₀

seg-c44413d5a060 = Sprowadza się dokładnie do łańcucha rodzaju <c1/>; moce zagłuszaczy, oś czasu i szerokości pasma są danymi wejściowymi

seg-304f4aeaf4cb = Kodek SigMF i oszacowanie Welcha

seg-7a642dd02e5c = Przejścia w obie strony, bezpośrednia dyskretna transformata Fouriera, tożsamości szumu białego i Parsevala; w repozytorium nie ma nagrania osoby trzeciej

seg-1138c9e62a21 = Waterfall wielopasmowy z zaprojektowanymi sygnałami i zagłuszaczami dla każdego pasma

seg-ac38681004e9 = Sprowadza się do łańcucha pasma L (pasmo z jedną składową daje te same liczby co przed rozszerzeniem) oraz do widm sygnałów sprawdzonych względem niezależnego wzorca; zaprojektowane sygnały, zagłuszacze i szerokości pasma są danymi wejściowymi

seg-0c0c625a8ff5 = Jedna korekta powszechnego skrótu myślowego: listki widma BOC({ "1,1" }) są <em>wyśrodkowane</em> przy ±{ "1.023" } MHz (między zerem nośnej a zerem przy { "2.046" } MHz), ale maksimum PSD leży przy ±{ "0.759" } MHz, gdzie <c1/> z <c2/>. Testy przypinają oba.

seg-6ab6e241f7e5 = Struktura prążków kodu rozpraszającego (prążki { "1" } kHz kodu C/A): ton jest oceniany względem gładkiej obwiedni, a nie najbliższego prążka kodu.

seg-4be08100a707 = Automatyczna regulacja wzmocnienia, kwantyzacja, wygaszanie impulsów i filtracja wycinająca.

seg-0f195ea4126e = Charakterystyka anteny odbiorczej w kierunku zagłuszacza poza pojedynczą wartością wzmocnienia.

seg-d3d03da9c962 = Zakłócenia wielodostępu między satelitami jednego pasma.

seg-db5c7566f49e = Emisje zaprojektowanego sygnału poza jego pasmem nadawania: jego widmo jest tam obcięte, więc żadna emisja poza pasmem nie sięga sąsiedniego pasma.

seg-9cbea7151036 = Wpływ chirpa na pętlę przy szybkościach przemiatania porównywalnych z szerokością pasma pętli: jego C/N₀ używa widma uśrednionego po wierszu.

seg-d19ed16f451c = J. W. Betz, „Binary Offset Carrier Modulations for Radionavigation”, <em>NAVIGATION</em> { "48" }({ "4" }), { "2001" }.

seg-e2225151c10b = E. D. Kaplan i C. J. Hegarty (red.), <em>Understanding GPS/GNSS: Principles and Applications</em>, wyd. 3, Artech House, { "2017" }, §{ "9.4" }.

seg-85b2d251a221 = G. W. Hein i in., „MBOC: The New Optimized Spreading Modulation Recommended for Galileo L1 OS and GPS L1C”, <em>Inside GNSS</em>, May/June { "2006" }.

seg-b091f7c36ab9 = P. D. Welch, „The Use of Fast Fourier Transform for the Estimation of Power Spectra”, <em>IEEE Transactions on Audio and Electroacoustics</em> { "15" }({ "2" }), { "1967" }.

seg-b65142371229 = IS-GPS-200, IS-GPS-705; Galileo OS SIS ICD.

seg-d28b74d8c755 = Specyfikacja SigMF, <a1>https://sigmf.org/</a1> (źródło: <a2>https://github.com/sigmf/SigMF</a2>).

seg-a9b968473b2a = <s1>Poprzednia</s1>Integralność i bezpieczeństwo

seg-d5264da8bf65 = <s1>Następna</s1>Odniesienie ARAIM
