# docs--leo-navmsg: translations (pl)

seg-cc651d9cef3b = Kod

seg-cbf0f9bcd2d8 = Wyrocznia

seg-6e0cb6acc073 = VALIDATED

seg-35f8f623ea28 = { "30" } s

seg-f63dd3d7aad4 = Źródło

seg-e305279d5b11 = Zawartość

seg-4d208b6c0eb8 = doba

seg-0f2d3faa9934 = Źródło: <c1/>

seg-d8aaee95aa44 = Rodzaj scenariusza <c1/> buduje transmitowany komunikat efemeryd i zegara satelity pozycjonowania, nawigacji i czasu (PNT) na niskiej orbicie okołoziemskiej (LEO) i odpowiada na pytania, które zadaje projektant komunikatu: jak długo może obowiązywać jeden komunikat, co daje każdy dodatkowy parametr, co widzi użytkownik, gdy komunikat zmienia się w środku przelotu, i ile bitów potrzeba, by przenieść go z dokładnością do centymetra.

seg-e61283b1e1a5 = Jest niezależny od systemu. Dowolna orbita, dowolna nośna i dowolny z czterech modeli efemeryd działają bez żadnego presetu; nazwane presety są danymi opcjonalnymi (zob. <a1>Presety</a1>).

seg-1271cd4ad822 = Wydrukuj dołączony przykład poleceniem <c1/> (jedna nazwa na wywołanie) i uruchom go poleceniem <c2/>: <c3/>, <c4/>, <c5/> i <c6/>. Ten rodzaj jest też etapem komunikatu w rodzaju <c7/> (<a1>LEO-PNT.md</a1>) oraz członkiem kampanii <c8/>, która składa cztery konfiguracje komunikatu i raportuje długość ramki każdej z nich ({ "146" }, { "154" }, { "159" } i { "171" } bajtów).

seg-51da9ffaa0ec = Kod: <c1/> — <c2/> (rekordy i algorytm użytkownika), <c3/> (orbita i zegar wzorcowy), <c4/> (dopasowanie), <c5/> (błąd odległości sygnału w przestrzeni), <c6/> (jonosfera i uniwersalny czas koordynowany (UTC)), <c7/> (format binarny), <c8/> (eksporty w stylu Receiver Independent Exchange Format (RINEX) i w wartościach rozdzielanych przecinkami (CSV)), <c9/> (jeden plik na preset), <c10/> (rodzaj).

seg-0505113a62e3 = Co niesie komunikat

seg-6752521002b2 = Część

seg-cf6ae60eea4f = Pomocnicze

seg-00eae74cb1e6 = identyfikator pojazdu kosmicznego (SVID), wydanie danych (IOD), identyfikator pasma, status zdrowia sygnału (konwencja Galileo: { "0" } sprawny, { "1" } niesprawny, { "2" } praca rozszerzona, { "3" } w teście)

seg-0bdbdd2c923b = Synchronizacja

seg-8120237b02ea = numer tygodnia, czas tygodnia (TOW) nadawania oraz wielomian zegara drugiego rzędu <c1/>

seg-b09dc4b322d3 = Efemerydy

seg-bbb3225e1d19 = jeden z czterech modeli poniżej

seg-3a835a49b43f = Inne usługi

seg-2a13461cb60c = zestaw transmitowanych parametrów jonosferycznych Klobuchara, współczynniki Galileo NeQuick-G <c1/> z pięcioma flagami burzy oraz parametry czasu systemowego do UTC <c2/>

seg-6b899ef63047 = Modele efemeryd

seg-60cd077d82a7 = Model

seg-2afa300864a9 = Parametry

seg-3e8a1cf183cc = zestaw keplerowski z dokumentu kontroli interfejsu sygnału w przestrzeni Galileo Open Service (OS SIS ICD): <c1/>

seg-b1416ba3472f = to samo, plus wielomiany korekcji wzdłuż toru, poprzecznej i radialnej (RAC) <c1/>, <c2/>, <c3/> w <c4/>, współczynniki w metrach, <c5/> to potęga dwójki równa co najmniej połowie przedziału dopasowania lub większa od niej (transmitowana), stopnie ustalane przez <c6/> (domyślnie { "7" }, { "5" }, { "6" })

seg-9c0643152bbf = domyślnie { "16" } + { "21" }, plus skala czasu

seg-e0afd541d64c = model 22-parametrowy Liu, Su, Xie, Zhou i Qu ({ "2025" }, <em>Remote Sensing</em> { "17" }({ "16" }):{ "2894" }, doi <a1>10.3390/rs17162894</a1>): { "16" } plus <c1/>

seg-a6042071a03f = model „zerowego zegara” ATOMIC (Autonomous Time and Orbit Determination for Microsatellite Constellations): wielomian w układzie związanym z Ziemią o początku w jej środku (ECEF) dla każdej osi w <c1/> (domyślnie stopień { "6" }), bez składników zegara, ponieważ zegar satelity jest sterowany do czasu systemowego (<a1>InsideGNSS</a1>)

seg-5869d6f65796 = domyślnie { "22" }

seg-6663aa3eeebc = Algorytm użytkownika (<c1/>) to sekwencja z ICD Galileo (równanie Keplera, poprawki drugiej harmonicznej, węzeł w układzie związanym z Ziemią), po której dla <c2/> następują trzy wielomiany w układzie własnym orbity keplerowskiej: radialny wzdłuż obliczonego położenia, poprzeczny wzdłuż normalnej orbity z poprawionej inklinacji i węzła, wzdłuż toru dopełniający trójkę. Zegar dodaje relatywistyczny człon z ICD <c3/>; dla <c4/> jest to postać ogólna <c5/> z wielomianu i jego pochodnej.

seg-b3935a85a7b2 = Człony Liu i in. wynikają z algorytmu użytkownika z artykułu (sekcja { "2.2" }, równ. 1-7): <c1/>, <c2/> (wydania przed { "0.30" } stosowały konwencję cywilnej nawigacji Global Positioning System (GPS) <c3/>, więc zapisane przez nie <c4/> jest dwukrotnością wartości z artykułu), oraz <c5/> dodane do promienia, <c6/> to nieskorygowany argument szerokości. Konwencja skali <c7/> jest przepisana z równ. { "1" } artykułu; porównanie z artykułem na rzeczywistych orbitach od niej nie zależy (czynnik ½ przy <c8/> nie zmienia żadnej dopasowanej wartości), więc znaczenie transmitowanej wartości <c9/> nie jest tam sprawdzone względem niezależnego wzorca zewnętrznego.

seg-9a83292bffcf = Dwa odczytania są własne dla Kshana i tak je podano:

seg-0e42fd0d5cf9 = Układ RAC i normalizacja <c1/>. Żaden publiczny dokument nie definiuje układu korekcji LEO dla komunikatu transmitowanego.

seg-1b8aaed09de8 = Zegar komunikatu zerowego zegara jest w sumie równy zeru: przyjmuje się, że pętla sterowania utrzymuje pozorny zegar, łącznie z członem relatywistycznym, na czasie systemowym.

seg-3472ce139588 = Dopasowanie

seg-4404a677d185 = <c1/> całkuje orbitę czterostopniową metodą Rungego–Kutty o stałym kroku w układzie, który przechodzi w osie związane z Ziemią jednym obrotem, <c2/>, tym samym pojedynczym obrotem, który stosuje transmitowany algorytm użytkownika. Grawitacja to dwa ciała (<c3/>), harmoniczne zonalne od J2 do J6 (od { "2" } do { "6" }) albo pole Earth Gravitational Model { "2008" } (EGM2008) do stopnia i rzędu od { "7" } do { "70" }, którego człony tesseralne niosą sygnaturę krótkookresową utrudniającą dopasowanie LEO. Opór jest opcjonalny (statyczna gęstość wykładnicza). Zegar jest swobodnie biegnący (bias, dryf, tempo dryfu i biały szum częstotliwości przy podanym odchyleniu Allana dla jednej sekundy, plus okresowy człon relatywistyczny) lub sterowany (resztka Gaussa–Markowa pierwszego rzędu).

seg-ae3052e66b2a = <c1/> dopasowuje zestaw keplerowski metodą Levenberga–Marquardta na elementach niesingularnych (<c2/>, <c3/>, <c4/>): orbita LEO jest prawie kołowa, więc same <c5/> i <c6/> są niemal nierozróżnialne. Zaczyna od stanu oskulacyjnego w <c7/> z tempem węzła od J2. Słabe priory wyśrodkowane na zerze ograniczają tempa i harmoniczne, których krótki łuk nie może rozdzielić; przy wadze obserwacji { "1" } cm działają one tylko w tych kierunkach zerowych. Dopasowanie <c8/> przyjmuje natomiast start i estymator z sekcji { "2.3" } artykułu: zaczyna od zerowych wszystkich członów korekcji, nie ma priorów (zwykłe najmniejsze kwadraty) i zachowuje limit 100 iteracji z artykułu. Kończy się według własnej reguły zbieżności parametrów Kshana, gdy każdy krok parametru jest mniejszy niż { "1e-3" } jego formalnego odchylenia standardowego; artykuł kończy natomiast, gdy RMS zmienia się o mniej niż { "0.1" } mm. Wielomiany RAC są następnie dopasowywane do reszt wzdłuż toru/poprzecznych/radialnych metodą liniowych najmniejszych kwadratów, a wielomian zegara do zegara wzorcowego pomniejszonego o człon relatywistyczny, który użytkownik doda z powrotem.

seg-020f45edcae1 = Wniosek zapisany w wartościach domyślnych: po dopasowaniu keplerowskim metodą najmniejszych kwadratów reszta jest z konstrukcji tym, czego { "16" } parametrów nie może objąć, więc oscyluje w oknie (kilka przejść przez zero w każdej składowej), zamiast dryfować. Wielomian korekcji usuwa ją tylko wtedy, gdy jego stopień przekracza to, co zestaw keplerowski już obejmuje: wzdłuż toru { "7" }, poprzecznie { "5" } i radialnie { "6" } sprowadzają 15-minutową resztę z centymetrów do około milimetra, podczas gdy niższe stopnie poprzeczne nie usuwają prawie nic (reszta poprzeczna jest nieparzysta względem środka okna). System, który część keplerowską wyznacza inaczej, zostawia resztę o innym kształcie, a potrzebne stopnie z niej wynikają. Własne stopnie korekcji presetu Celeste (niższe niż te; istnieją tylko w pliku presetu, <c1/>) działają tutaj na bazie najmniejszych kwadratów Kshana, dlatego jego człony poprzeczne wnoszą w tym silniku niewiele: to stwierdzenie o dopasowaniu Kshana, a nie o jakimkolwiek rzeczywistym systemie. <c2/> i <c3/> są całkowitymi sekundami, tak jak niesie je format binarny.

seg-f3538e6651fa = Każdy komunikat jest używany przez okres wyśrodkowany w jego oknie dopasowania (pierwsza tabela kompromisu używa całego okna). Wartości błędu odległości sygnału w przestrzeni (SISRE) mierzą <b>błąd reprezentacji</b> komunikatu względem wzorca, do którego został dopasowany, jako pierwiastek ze średniej kwadratowej (RMS) i maksimum na przedziale. Błąd wyznaczania i predykcji orbity, który rzeczywisty segment naziemny lub pokładowy dodaje na wierzch, nie jest modelowany.

seg-c2b181269367 = Błąd odległości sygnału w przestrzeni

seg-63462a1abc95 = <c1/> używa globalnie uśrednionego SISRE z pracy Montenbrucka, Steigenbergera i Hauschilda ({ "2018" }, <em>Advances in Space Research</em> { "61" }({ "12" }):{ "3020" }–{ "3038" }, doi <a1>10.1016/j.asr.2018.03.041</a1>):

seg-c4f654264c42 = Wagi są średnimi dla użytkowników rozłożonych równomiernie na widocznej czaszy Ziemi z <c1/> i <c2/>, gdzie <c3/> jest kątem nadirowym linii widzenia przy satelicie, obliczonym dla promienia orbity i maski elewacji. Przy masce { "0" }° obliczenie odtwarza tabelę z artykułu dla średniej orbity okołoziemskiej (GPS { "0.98" } i 1/49, GLONASS 1/45, Galileo 1/61, BeiDou 1/54) i orbity geostacjonarnej ({ "0.99" } i 1/126): to jest kontrola <b>VALIDATED</b>. Na LEO to samo uśrednienie daje

seg-66b488889b10 = Wysokość

seg-c07128592d7b = kąt nadirowy horyzontu

seg-a4e04d9a23a5 = { "320" } km

seg-002adc24471f = { "510" } km

seg-fe2f70c29806 = { "550" } km

seg-4dee38ff0811 = { "786" } km

seg-cfc3c6939861 = { "1080" } km

seg-102de0413553 = { "1336" } km

seg-1b11819c8b2f = więc użytkownik LEO, który widzi satelitę daleko od nadiru, odczuwa błędy wzdłuż toru i poprzeczne znacznie silniej niż użytkownik orbity średniej.

seg-b7a844ab6135 = Analizy

seg-17111fe25e04 = <c1/> wybiera dowolne z czterech (domyślnie wszystkie).

seg-d0c1b335af73 = Kompromis przedziału dopasowania

seg-f65e99c0d8b2 = <c1/> ustawia przedział, przedziały dopasowania, okresy aktualizacji i modele. <c2/> ({ "550" } km, { "97.6" }°, EGM2008 do stopnia { "20" } i opór, { "30" } minut komunikatów) daje, przy okresie użycia równym przedziałowi dopasowania:

seg-f1a94c795c18 = Przedział dopasowania

seg-c6b034712788 = RMS SISRE orbity

seg-55c287c93940 = Maks. SISRE orbity

seg-ad604a608329 = RMS SISRE z zegarem

seg-28723ab60ae0 = RMS radialny / wzdłuż toru / poprzeczny

seg-911a62245e80 = { "60" } s

seg-1a35a89c1a34 = { "0.041" } cm

seg-7cf9e6e3178f = { "0.179" } cm

seg-d8a7f4c080dd = { "0.069" } cm

seg-93773d45092a = { "0.09" } / { "0.01" } / { "0.00" } cm

seg-64015edf42d8 = { "120" } s

seg-a1070c338686 = { "0.032" } cm

seg-cdacf90f8ce8 = { "0.160" } cm

seg-29aeee696ad2 = { "0.079" } cm

seg-1d2d7b57af6b = { "0.06" } / { "0.01" } / { "0.01" } cm

seg-8fa4e4ccc5cc = { "180" } s

seg-13182ae6d536 = { "0.093" } cm

seg-fc692062aaa8 = { "0.540" } cm

seg-9ef760f0777c = { "0.134" } cm

seg-9a7db44eb20e = { "0.18" } / { "0.06" } / { "0.00" } cm

seg-bbd4f2685bee = { "300" } s

seg-93410318239b = { "0.310" } cm

seg-4af8f1c977eb = { "1.033" } cm

seg-0921a535896a = { "0.329" } cm

seg-d50195d4cbea = { "0.09" } / { "0.49" } / { "0.02" } cm

seg-8de43db30454 = { "450" } s

seg-ec7f9ca7654b = { "1.690" } cm

seg-1ad55674fab9 = { "7.542" } cm

seg-a022913c956d = { "1.696" } cm

seg-31564c73398d = { "0.72" } / { "2.65" } / { "0.04" } cm

seg-21b0c99fbda4 = { "600" } s

seg-6840aea9ff12 = { "2.875" } cm

seg-798c8c1d0190 = { "10.219" } cm

seg-6b3b442069d8 = { "2.866" } cm

seg-8a53398e1999 = { "1.72" } / { "4.42" } / { "0.26" } cm

seg-4dabf1faddfc = { "900" } s

seg-d733d3fdac02 = { "9.345" } cm

seg-3334d120521b = { "34.032" } cm

seg-4d4a2cc180d0 = { "9.349" } cm

seg-7651a43f1f33 = { "6.46" } / { "14.14" } / { "0.91" } cm

seg-f1d733b03f45 = { "0.000" } cm

seg-81a60d921ce9 = { "0.057" } cm

seg-724c7750b1ca = { "0.00" } / { "0.00" } / { "0.00" } cm

seg-c8a720a6f160 = { "0.074" } cm

seg-b13f5539e4b1 = { "0.001" } cm

seg-1c9d3ee30ac7 = { "0.090" } cm

seg-7dd08c671dc7 = { "0.004" } cm

seg-740e69fcd85e = { "0.014" } cm

seg-c0db4312d8a0 = { "0.106" } cm

seg-e971c2fe0bb2 = { "0.00" } / { "0.00" } / { "0.01" } cm

seg-f3bda174cbef = { "0.037" } cm

seg-5a5bb868e8ff = { "0.176" } cm

seg-02b99fcb9fee = { "0.127" } cm

seg-e6c45fda719f = { "0.05" } / { "0.01" } / { "0.04" } cm

seg-ec1e77bc5be9 = { "0.214" } cm

seg-d3c1ed834802 = { "0.643" } cm

seg-23482e7c028f = { "0.229" } cm

seg-8f71690a7139 = { "0.28" } / { "0.09" } / { "0.26" } cm

seg-bfec9407ffae = { "1.015" } cm

seg-f295ad6efcf4 = { "3.695" } cm

seg-2cd92d16edfc = { "1.062" } cm

seg-4626119411c4 = { "1.52" } / { "0.70" } / { "0.91" } cm

seg-4e19f776d1b7 = A przy dopasowaniu { "300" } s, przy zmiennej częstości przejmowania przez nowy komunikat:

seg-89810ffbeff3 = Okres aktualizacji

seg-d4d1fa05e1a8 = { "0.314" } cm

seg-828b7488993b = { "0.850" } cm

seg-edb934c1419f = { "0.288" } cm

seg-52c8f821a7d2 = { "0.859" } cm

seg-e135107af135 = { "150" } s

seg-e7ce46d74f3e = { "0.219" } cm

seg-3391df1cf909 = { "0.830" } cm

seg-d6eb4f554461 = { "0.009" } cm

seg-22c68874002b = { "0.010" } cm

seg-2172d9ea618e = 16-parametrowy zestaw keplerowski pogarsza się z { "0.04" } cm przy { "60" } s do { "9.35" } cm przy { "900" } s: jeden zestaw keplerowski z harmonicznymi dwa razy na obieg nie może przez dłużej niż kilka minut nadążać za grawitacyjnymi członami o wyższej częstotliwości i oporem łuku LEO, a jego reszta z najmniejszych kwadratów oscyluje w oknie. Wielomiany wzdłuż toru/poprzeczne/radialne (stopnie { "7" }, { "5" }, { "6" }) pochłaniają to, co zostaje: { "1.01" } cm przy { "900" } s, { "0.21" } cm przy { "600" } s. Przy najkrótszych przedziałach wartości keplerowskie są poniżej milimetra i nie są już ściśle uporządkowane (dopasowanie jest wtedy ograniczone uwarunkowaniem, a nie modelem).

seg-aca262796570 = Porównanie modeli

seg-fdf2368d0210 = <c1/> uruchamia cztery modele przy { "1" }, { "5" } i { "10" } minutach na tej samej orbicie, z liczbą parametrów i bitami efemerydy i zegara w kodowaniu Kshana:

seg-7d3c6c43390d = Bity efemerydy + zegara

seg-f7f60c66d89e = { "0.022" } cm

seg-f7bcb8a44fde = { "0.049" } cm

seg-2972b631701e = { "0.230" } cm

seg-cc42e8dc7238 = { "0.260" } cm

seg-67e50069c6f7 = { "3.061" } cm

seg-780954ab9d7f = { "3.071" } cm

seg-de81d6550264 = { "0.044" } cm

seg-fb171bf75f27 = { "0.005" } cm

seg-c8c067631f7a = { "0.120" } cm

seg-2dc41855c245 = { "0.208" } cm

seg-6ef79938dd22 = { "0.046" } cm

seg-7e96d7e34e63 = { "0.142" } cm

seg-c43199891163 = { "0.258" } cm

seg-f9a9fdebc114 = { "0.290" } cm

seg-f157ff5b40b1 = <c1/> (zerowy zegar)

seg-9474a775dc5e = { "28.784" } cm

seg-5098c8b6f813 = { "0.561" } cm

seg-5e7fdc441b03 = { "28.774" } cm

seg-82d3fa2e27ef = Wiersz zerowego zegara jest oceniany względem zegara sterowanego z resztą { "0.24" } m (wartość ATOMIC), pozostałe względem swobodnie biegnącego zegara, który dopasowują.

seg-769db176020f = <b>Liu i in. { "2025" }, SISRE w funkcji wysokości (MODELLED).</b> Ten sam scenariusz dopasowuje 22-parametrowy model Kshana na 20-minutowych łukach dla pięciu wysokości z artykułu, przy inklinacji każdego satelity:

seg-01e587427a7e = Satelita

seg-f6bbd3d5d75c = Inklinacja

seg-c54d0bd7d498 = Liu i in. { "2025" }

seg-16c489b75f44 = Kshana (RMS tylko orbity)

seg-ee4816ca13c1 = stosunek

seg-510349500d23 = { "8.88" } cm

seg-a97bde451ec2 = { "4.25" } cm

seg-b6c1d48847d9 = { "475" } km

seg-f79249e9bd75 = { "6.21" } cm

seg-9b6757a674a5 = { "2.87" } cm

seg-62008169ca69 = { "2.20" } cm

seg-06a4bcde0ea3 = { "966" } km

seg-9e5e06ec23c3 = { "2.11" } cm

seg-41ce80bc0b62 = { "1.25" } cm

seg-c9f63cd8bd07 = { "0.75" } cm

seg-f11a960a1d52 = { "0.51" } cm

seg-0376cf5f98f0 = To <b>nie jest</b> sprawdzenie względem niezależnego wzorca zewnętrznego. Artykuł dopasowywał rzeczywiste precyzyjne orbity naukowe wymienionych satelitów (z pełną historią grawitacji, oporu i sił niegrawitacyjnych); Kshana dopasowuje własną scałkowaną orbitę, oblicza sześć dodanych parametrów w opisany wyżej sposób i używa własnych wag SISRE. Porównanie pokazuje trend i rząd wielkości. Porównanie na tych samych rzeczywistych orbitach, które dopasowywał artykuł, to <c1/> (od { "0.30" } dopasowanie 22-parametrowe zgadza się tam w ramach ustalonego z góry czynnika { "1.5" }, na dniach z artykułu i na ośmiu dniach wstrzymanych).

seg-d82887c766e3 = Aktualizacja w środku przelotu

seg-d1104b6ea7fa = <c1/> umieszcza użytkownika (domyślnie { "45" }° N, { "10" }° E), znajduje najwyższy przelot nad maską w granicach <c2/> i planuje komunikaty co <c3/>. Przy każdym przełączeniu w trakcie przelotu raportuje skok położenia, skok zegara, skok pseudoodległości użytkownika (nowy komunikat minus stary), największy skok, jaki mógłby zobaczyć dowolny widoczny użytkownik (postać zamknięta po stożku nadirowym), błąd odległości przed i po oraz PASS lub FAIL względem <c4/>. <c5/> (dopasowania { "300" } s aktualizowane co { "150" } s):

seg-7d91304c87e3 = Najwyższy przelot w ciągu doby sięga { "43.7" }° i trwa { "455" } s. Jego przełączenia:

seg-02dc0d42fb21 = sfu

seg-a7d59ba6e225 = rad

seg-289e8da49cc8 = Przełączenie

seg-e80d12ee2259 = Elewacja

seg-b16789d14338 = Skok pozycji

seg-b3c252609532 = Skok zegara

seg-8239a390ec71 = Skok odległości użytkownika

seg-4153faf7969d = Skok w najgorszej geometrii

seg-14402c7fb332 = IOD { "270" } → { "271" }

seg-7862a97ac55f = { "0.07" } mm

seg-4cfe934c881f = { "0.19" } mm

seg-9e9752920165 = -0.17 mm

seg-4267557786be = { "0.27" } mm

seg-46872e8925b2 = IOD { "271" } → { "272" }

seg-4c803fd2ccc9 = { "0.14" } mm

seg-cc9a8388f6bc = -0.24 mm

seg-0549f7fd0633 = IOD { "272" } → { "273" }

seg-ad1afcf9a466 = -0.22 mm

seg-c1b30171b4f0 = { "0.35" } mm

seg-f93647402fa9 = { "0.48" } mm

seg-69b35182807c = Największy skok odległości użytkownika { "0.35" } mm wobec progu { "5" } cm: <b>PASS</b>.

seg-96dcb456600d = Kodowanie i dekodowanie

seg-1b3674a0e041 = <c1/> koduje pierwszy z trzech komunikatów, dekoduje go, sprawdza CRC i odrzuca uszkodzoną kopię, wypisuje budżet kwantyzacji oraz zapisuje i odczytuje z powrotem blok w stylu RINEX i tabelę CSV:

seg-480eb9ffc333 = ramka: { "171" } bajtów ({ "1310" } bitów ładunku, z czego { "1045" } to efemerydy i zegar), 24-bitowa cykliczna kontrola nadmiarowa (CRC-24Q) <c1/>;

seg-0e2a64a063fd = największy efekt półkroku dla pojedynczego pola: <c1/>, { "0.545" } mm;

seg-a1875f7088b0 = cały komunikat po kwantyzacji: pozycja w granicach { "1.126" } mm i zegar w granicach { "0.185" } mm od komunikatu dokładnego; SISRE { "0.113" } cm dla komunikatu dokładnego, { "0.129" } cm dla zdekodowanego;

seg-6e818708b695 = ramka z jednym odwróconym bitem zostaje odrzucona: true;

seg-31fe0f6b133d = pełny obieg w stylu RINEX w granicach { "5.0e-06" } m, pełny obieg CSV w granicach { "0.0e+00" } m.

seg-405cf34090cc = Niezależność od platformy

seg-7f2193f6ff06 = Ramka to przesyłane liczby całkowite, więc muszą to być te same liczby niezależnie od tego, gdzie i jak scenariusz jest uruchamiany: natywny plik binarny w dowolnym systemie operacyjnym, kompilacja debug lub release oraz kompilacja WebAssembly (WASM) w przeglądarce. Przeszkadziły trzy rzeczy. Sinus, cosinus, arcus tangens i funkcja wykładnicza z biblioteki matematycznej hosta nie muszą być poprawnie zaokrąglane i różnią się między hostami na ostatnim miejscu. Zoptymalizowana kompilacja w systemie macOS pobiera sinus i cosinus tego samego argumentu z łącznej procedury systemowej, która nie zawsze zwraca wartość samego sinusa, więc różniły się także kompilacje debug i release. A zwykły generator rozkładu normalnego wywołuje wykładniczą i logarytm hosta w swoich rzadkich gałęziach. Dopasowanie zamienia tak małą różnicę w inne skwantowane pola. Cały rodzaj (orbita i zegar prawdziwy, dopasowanie, algorytm użytkownika, błąd odległości w sygnale w przestrzeni (SISRE), kodek) oblicza więc każdą taką funkcję za pomocą czysto rustowego crate'a <c1/> przez <c2/>, potęgi całkowite jako jawne iloczyny, a odchylenia normalne metodą biegunową na surowym wyjściu generatora. <c3/> przypina 171-bajtową ramkę scenariusza kodowania i dekodowania poniżej oraz jedną wartość kontrolną na model efemeryd; kompilacja debug, kompilacja release i kompilacja WASM dają bajt w bajt identyczne dokumenty wyników dla wszystkich pięciu dołączonych scenariuszy <c4/>.

seg-1ef00467df17 = Format binarny

seg-af2dae9e9e7c = <b>To jest własne, udokumentowane kodowanie Kshana.</b> Przenosi składniki, które wymieniają opublikowane opisy komunikatów nawigacyjnych LEO, zbudowane na wzór zestawu pól Galileo ICD. To <b>nie jest</b> układ bitów Celeste ani żadnego innego systemu: żaden nie jest publiczny.

seg-6a730c01ad1c = Ramka: preambuła <c1/> ({ "8" } bitów), wersja { "1" } ({ "4" }), model ({ "4" }: { "1" } <c2/>, { "2" } <c3/>, { "3" } <c4/>, { "4" } <c5/>), długość ładunku w bajtach ({ "12" }), ładunek dopełniony zerami do pełnego bajtu, CRC-24Q (24-bitowa cykliczna kontrola nadmiarowa, { "24" } bity) z każdego poprzedzającego bajtu. CRC-24Q to kontrola ze standardu RTCM { "10403" } Radio Technical Commission for Maritime Services oraz z Galileo ICD (wielomian <c6/>, wartość początkowa { "0" }); kod odtwarza katalogową wartość kontrolną <c7/> dla <c8/> oraz bajty kontrolne przykładowej ramki RTCM { "10403" } typu komunikatu { "1005" } (<b>VALIDATED</b>).

seg-a31d899eb435 = Kroki z Galileo ICD dobrano dla średniej orbity okołoziemskiej i są zbyt zgrubne dla komunikatu LEO o centymetrowej dokładności: <c1/> w krokach co { "2" }⁻⁵ m ({ "3.1" } cm), <c2/> { "2" }⁻²⁹ rad ({ "1.3" } cm przy promieniu orbity LEO), kąty { "2" }⁻³¹ półkola ({ "1.0" } cm) i <c3/> { "2" }⁻³⁴ s ({ "1.7" } cm). Kshana zachowuje jednostki ICD i konwencję półkola, zmniejsza kroki tak, by błąd półkroku każdego pola pozostawał poniżej { "1" } mm pozycji lub odległości w oknie 15 minut, i poszerza pola, aby zachować zakresy potrzebne dopasowaniu LEO:

seg-caddc6f5b9a7 = Blok

seg-b548b723c201 = Bity

seg-d00b65801e9b = Krok

seg-2085d172bec3 = pomocnicze i synchronizacyjne

seg-7e9018f82811 = tydzień

seg-45cbfedb6f0e = zegar (bit flagi { "0" })

seg-05d274f5ce99 = s/s^{ "2" }

seg-9d6d5136e12a = keplerowskie (modele 1-3)

seg-3fb59c8238cb = półkole

seg-d173e8d7026c = m^{ "0.5" }

seg-48c8bfb6e914 = poprawki wzdłuż toru/poprzeczne/promieniowe (model { "2" })

seg-131652f53721 = dodatki Liu et al. { "2025" } (model { "3" })

seg-fccf37a24fc4 = półkole/s^{ "2" }

seg-ebde561c17ab = wielomian ECEF (model { "4" })

seg-822c7482547c = Klobuchar (bit flagi { "1" })

seg-7dd6e8bcaf43 = s/półkole^{ "2" }

seg-09408b08c481 = s/półkole^{ "3" }

seg-734162101b2d = NeQuick-G (bit flagi { "2" })

seg-ddbb363f4593 = sfu/deg^{ "2" }

seg-e2744b31e5d3 = UTC (bit flagi { "3" })

seg-545755e7b26f = Wartość spoza zakresu pola jest odrzucana, a nie zawijana. Zakresy sprawdzono, kodując dopasowania dla { "300" } do { "2000" } km, nachyleń od { "0" }° do { "140" }° i przedziałów dopasowania do { "20" } minut: <c1/> i <c2/> są szerokie, ponieważ na orbicie prawie równikowej węzeł jest słabo określony, a dopasowanie dzieli między nie dryf J2 argumentu szerokości, natomiast <c3/> i <c4/> dlatego, że 22-parametrowe dopasowanie w ciągu { "20" } minut pochłania część krótkookresowych oscylacji wielkiej półosi. Od wersji { "0.30" } 22-parametrowe dopasowanie to zwykła metoda najmniejszych kwadratów z pracy, bez rozkładów a priori, a równikowe dopasowanie dla { "800" } km wymaga wtedy <c5/> około { "6.3e-10" } półkola/s^{ "2" }, więc jego skala zmieniła się z { "2" }^-60 na { "2" }^-58. Poprawki wzdłuż toru stopnia 7 dla <c6/> mieszczą się w 22-bitowym zakresie współczynników do { "15" } minut; dłuższe dopasowanie może go przekroczyć i wtedy jest odrzucane. <c7/> podaje dla każdego pola efemeryd i zegara największą zmianę pozycji i odległości, jaką powoduje zmiana o półkrok w okresie użytkowania, oraz zmianę całego komunikatu po kwantyzacji.

seg-1ad17f3d3643 = Eksporty tekstowe

seg-81fb376aa1e1 = <b>RINEX { "4.02" } nie definiuje rekordów nawigacyjnych LEO</b> (jego litery systemów to G, R, E, J, C, I i S; <a1>International Global Navigation Satellite System (GNSS) Service (IGS) RINEX { "4.02" }</a1>). Blok zapisywany przez <c1/> zapożycza kształt RINEX { "4" } — nagłówek rekordu <c2/>, wiersz satelity i epoki z trzema składnikami zegara, wiersze orbity rozgłaszanej z czterema polami <c3/> — i jest <b>udokumentowanym rozszerzeniem Kshana</b>: litera systemu <c4/>, typy rekordów <c5/>, <c6/>, <c7/>, <c8/> oraz trzy komentarze nagłówka, które o tym mówią. Wcześniejsze prace o orbitach LEO w rekordach nawigacyjnych w stylu RINEX 4: <a2>arXiv { "2401.17767" }</a2>.

seg-9a3016441bce = Tabela CSV zawiera komunikaty <c1/> i <c2/>, po jednym w wierszu. Domyślne kolumny używają nazw z Galileo ICD (<c3/>); <c4/> wybiera zamiast tego zapis z gotowego ustawienia. Oba formaty można odczytać z powrotem.

seg-4a26902d2771 = Jonosfera i UTC

seg-c4d4dd2bac45 = <b>Klobuchar</b>: model L1 silnika (<c1/>, sprawdzony względem RTKLIB) skalowany do nośnej prawem pierwszego rzędu <c2/>.

seg-0d3973f04ee5 = <b>NeQuick-G</b>: współczynniki są przesyłane w komunikacie, a <c1/> zwraca <c2/> dla zmodyfikowanej szerokości inklinacji magnetycznej <c3/>, z regułami algorytmu (współczynniki równe zeru dają { "63.7" } jednostek strumienia słonecznego, sfu; wynik jest obcinany do [{ "0" }, { "400" }] sfu). Model gęstości elektronowej NeQuick i jego całkowanie wzdłuż drogi sygnału, które zamieniają <c4/> na opóźnienie, <b>nie</b> są zaimplementowane.

seg-66dbd447dfeb = Satelita na wysokości kilkuset kilometrów leci wewnątrz jonosfery. Żaden z modeli rozgłaszanych nie uwzględnia zawartości elektronów nad satelitą i nie stosuje się dla niej żadnej poprawki.

seg-7befd59b2ac6 = <b>UTC</b>: <c1/> stosuje trzy przypadki z Galileo ICD §{ "5.1.7" } (przed zdarzeniem sekundy przestępnej, w ciągu sześciu godzin od niego i po nim); wstawiona sekunda ma wartość { "86400" }.

seg-2b0d77219437 = Gotowe ustawienia

seg-d2908020db08 = Gotowe ustawienia to dane, po jednym pliku w <c1/>, wraz ze źródłami. Silnik i każdy dołączony scenariusz poza scenariuszem Celeste działają bez nich.

seg-c353e7bec219 = Klucz

seg-5566e1d71a4f = Orbita

seg-33f4c7af9c53 = Nośna

seg-f4510e898031 = Model komunikatu

seg-125aac68d94f = PUBLIC, <a1>arXiv { "2509.19551" }</a1>

seg-890aa92157e4 = { "1080" } km, { "53" }°

seg-1eca13ba2309 = X1 { "1593.3225" } MHz

seg-ee9947222a30 = nieopublikowany

seg-77af616c1f6e = PUBLIC, arXiv { "2509.19551" }

seg-f016786d7755 = { "520" } km, { "97" }°

seg-780e931bf88d = PUBLIC, <a1>raport RNTF</a1>, opis konstelacji

seg-d5df094a5f89 = { "781" } km, { "86.4" }°

seg-94bc78cee128 = { "1621" } MHz (pasmo { "1616" }–{ "1626" } MHz)

seg-3f5de7f74502 = brak rozgłaszania

seg-4944294c230f = PUBLIC, <a1>NAVIGATION { "72" }({ "1" })</a1>, opis konstelacji

seg-c2a2761f73b1 = { "550" } km, { "53" }°

seg-2ef501f97eff = pasmo Ku, wartość ze środka pasma (reprezentatywne)

seg-567fab40bd24 = brak (sygnały okazji)

seg-a76527ba66b6 = PUBLIC, <a1>Sensors { "2023" }</a1>, <a2>Satellite Navigation { "2026" }</a2>

seg-f5dd5086eedd = { "700" } km, { "55" }°

seg-5fa6b60f66b4 = w pobliżu B1 (zamaskowane w źródle; L1 jako zastępnik)

seg-5ebbf0042d7c = REPRESENTATIVE

seg-4f3e5a683682 = { "600" } km, { "97.8" }°

seg-c06f62ca5173 = { "5020" } MHz (środek pasma C RNSS)

seg-884c81e55e79 = PUBLIC, <a1>InsideGNSS</a1>

seg-3b1fd041f9ba = { "500" } km (reprezentatywne)

seg-522c85402d84 = L1 (reprezentatywne)

seg-064b03765e4d = <c1/>, stopień { "6" }, { "60" } s, odświeżany co { "30" } s, zerowy zegar, { "0.24" } m reszty sterowania

seg-5619bc61b958 = WORKSHOP i PUBLIC

seg-20572d7e348d = { "510" } km, { "97.4" }°

seg-a17f4b4f7fb5 = { "1191.795" } MHz

seg-fad0950a2d67 = <c1/>, stopnie i odstęp rekordów w pliku gotowego ustawienia

seg-e881ffc4e14b = RNSS to służba nawigacji radiowej przez satelity (radionavigation-satellite service); RNTF to Resilient Navigation and Timing Foundation.

seg-e9524c71636d = <b>Celeste IOD.</b> Gotowe ustawienie demonstracji na orbicie (IOD) Celeste Europejskiej Agencji Kosmicznej (ESA) jest jedynym, które wykorzystuje materiały przedstawione na warsztatach LEO-PNT programu ESA Navigation Innovation and Support Programme (NAVISP), { "2026" }: strukturę komunikatu (zestaw keplerowski Galileo plus wielomiany poprawek wzdłuż toru/poprzecznych/promieniowych, wielomian zegara, SVID, stan zdrowia, IOD, parametry jonosferyczne i UTC), odstęp rekordów oraz nazwy kolumn CSV. Orbita ({ "510" } km, prawie biegunowa, heliosynchroniczna) i nośna pochodzą z publicznych źródeł podanych w pliku. Układ bitów Celeste nie jest publiczny i nie jest odtwarzany; późniejsze fazy Celeste i system LEO-PNT Unii Europejskiej (UE) mogą się różnić. Każda wartość pochodząca z warsztatów znajduje się w module <c1/> w <c2/>, używanym przez <c3/>. Jak to ustawienie jest wyłączane: każda liczba silnika pochodząca z warsztatów mieści się w jednym pliku, <c4/>, który <c5/> kompiluje tylko wtedy, gdy istnieje, oraz w scenariuszach dostępnych tylko w repozytorium <c6/>. Usunięcie tego pliku i tych scenariuszy wyłącza gotowe ustawienie bez zmian w kodzie źródłowym; każdy inny test, każda wyrocznia i każdy scenariusz działają bez niego, a liczba plików scenariuszy w README nadal liczy pliki wyłączone.

seg-906da2752f76 = Weryfikacja

seg-7338b6210228 = Wiersz

seg-c5ce76c91ff7 = Etykieta

seg-cfe0d596296e = Wagi SISRE

seg-3e0059048a0d = tabela Montenbruck et al. { "2018" } (GPS, GLONASS, Galileo, BeiDou, geostacjonarne)

seg-0f5e73171fe0 = algorytm użytkownika Galileo ICD

seg-29ad977ef423 = RTKLIB <c1/> dla czterech rzeczywistych efemeryd rozgłaszanych Galileo, { "1" } mm na oś (<c2/>)

seg-ecec254e8219 = katalogowa wartość kontrolna <c1/>; przykładowa ramka RTCM { "10403" } { "1005" }

seg-388633e4e785 = Dopasowanie i kompromis SISRE

seg-8b85c3277e66 = prawdziwy ruch dwóch ciał odtworzony z dokładnością { "1" } mm; poprawione dopasowanie J2–J6 do { "1" } mm; monotoniczny wzrost wraz z przedziałem

seg-4de7f2b173c5 = Ciągłość w środku przejścia

seg-bdbd2771c7f5 = tożsamość skoku; granica stożka w postaci zamkniętej wobec próbkowania

seg-468a92a2caf7 = Format binarny i budżet

seg-ba26f5f63172 = pełne obiegi; półkrok każdego pola poniżej { "1" } mm

seg-9be43cbef131 = W stylu RINEX i CSV

seg-a7748156fd6e = pełne obiegi

seg-88b5cda10923 = 22-parametrowy model i dopasowanie Liu et al. { "2025" }

seg-7272ebdc1fec = precyzyjne orbity TU Graz ITSG czterech satelitów wobec tabel { "4" }, { "5" }, { "6" } i { "8" } z pracy: stosunki wzdłuż toru, poprzeczne, promieniowe i SISRE od { "0.755" } do { "1.138" } w dniach z pracy oraz od { "0.683" } do { "1.186" } w ośmiu dniach wstrzymanych, w granicach 1.5x (<c1/>)

seg-94066142a642 = wielomian zerowego zegara ATOMIC i tabela pięciu wysokości

seg-205cdc6a3696 = fakty ATOMIC z InsideGNSS; opublikowana tabela Liu wydrukowana obok dopasowania orbity scałkowanej przez Kshana, nieprzypięta

seg-8c00ed11609c = postacie zamknięte z ICD; model Klobuchar sprawdzony względem RTKLIB

seg-d5653e0958b5 = SISRE to wyłącznie błąd reprezentacji: bez błędu wyznaczania orbity ani predykcji.

seg-4968d9fcbc19 = Wzorcem prawdy jest całkowanie Kshana (bez trzeciego ciała, ciśnienia promieniowania słonecznego i pływów), a nie precyzyjna orbita rzeczywistego satelity.

seg-6a4a1bf21b50 = Format binarny i blok w stylu RINEX są własnością Kshana.

seg-26c0a2693081 = NeQuick-G jest przenoszony, a nie całkowany do opóźnienia; brak poprawki dla satelity wewnątrz jonosfery.

seg-2a0c8190c38e = Porównanie z Liu et al. różni się orbitami, odczytem parametrów i wagami.

seg-4abe216f987a = <s1>Poprzednia</s1>Przejście LEO i budżet łącza

seg-59d9bf4735d8 = <s1>Następna</s1>Fuzja pozycjonowania MEO i LEO
