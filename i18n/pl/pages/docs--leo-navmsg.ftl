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
