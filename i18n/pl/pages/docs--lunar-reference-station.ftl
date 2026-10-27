# docs--lunar-reference-station: translations (pl)

seg-f37311ad7ef0 = Wyniki

seg-f63dd3d7aad4 = Źródło

seg-9872e31ebd72 = Źródła

seg-38afa54b0306 = Źródło: <c1/>

seg-e8ee3794bac6 = <b>MODELLED.</b> Przy podanych założeniach (konstelacja, jej błąd sygnału w przestrzeni kosmicznej, dokładność pomiaru stacji, opóźnienie korekt i kwantyzacja łącza, każde jako dane wejściowe oznaczone publicznym źródłem lub jako ILLUSTRATIVE) model daje poniższe wartości. <b>Nie</b> są one stwierdzeniem o działaniu żadnego rzeczywistego systemu. Kshana <b>nie</b> ma powiązań z żadną agencją ani jej poparcia i nie składa żadnych deklaracji dotyczących TRL ani dziedzictwa lotniczego. Wyłącznie doradczo.

seg-22eb5bd00092 = Cel

seg-25678ae41147 = Materiały publiczne opisują księżycową stację referencyjną przy biegunie południowym, która monitoruje księżycową usługę nawigacyjną, oblicza lokalne korekty różnicowe, utrzymuje księżycowy wzorzec czasu na zegarze atomowym oraz niesie retroreflektor laserowy i nadajnik VLBI dla księżycowego układu odniesienia (klasa publicznie opisana dla koncepcji NovaMoon ESA; źródła poniżej). Kshana modeluje już każdy z tych elementów osobno. To badanie składa je w jedną odtwarzalną, otwartą analizę tego, co taka stacja mogłaby osiągnąć przy publicznych założeniach, i rejestruje ją wstępnie, aby można ją było ocenić względem opublikowanych wyników, a ostatecznie względem wyników lotnych.

seg-6ac04119fc30 = lub <c1/> z Pythona, WebAssembly albo <c2/> serwera MCP z <c3/>.

seg-671e68d341fd = Mapa pokrycia i dokładności (<c1/>)

seg-f034e2642dab = Dla różnicowej stacji referencyjnej w znanym miejscu w pobliżu bieguna południowego: w każdym punkcie użytkownika na siatce pierścieniowej od { "80" }° S do bieguna i w całym regionie, w ciągu doby epok i prób Monte Carlo: percentylowy błąd położenia skorygowany i nieskorygowany (3-D, poziomy, pionowy), dostępność z przyczyną dla każdej niedostępnej epoki, pokrycie względem progu podanego przed przebiegiem, poziomy ochrony DO-229E, promień pokrycia na sektor azymutu oraz bilans łącza korekt na stacji i w najgorszym punkcie. Bez nowej fizyki: przegląda przetestowane funkcje <c1/> i redukuje się dokładnie do tego rodzaju w jednym punkcie, jednej epoce i jednej próbie.

seg-94058315dfe4 = Dane wejściowe

seg-7670cf4ceda3 = Wartość domyślna

seg-98b42925ad5c = Konstelacja (<c1/>, <c2/>, <c3/>, <c4/>, <c5/>) lub <c6/>

seg-bfdd053b2611 = zestaw klasy LCNS z drzewa źródeł

seg-389db26524b4 = ILLUSTRATIVE w dołączonej wartości domyślnej; przykład ze źródeł publicznych ustawia cztery satelity i okres { "24" } h z S2 i S4, a zestaw elementów pozostaje ILLUSTRATIVE (żadne źródło go nie podaje)

seg-91231bdcc599 = ILLUSTRATIVE

seg-6b9d48431e4b = Stacja (<c1/>, <c2/>, <c3/>)

seg-fcdb2f3ac330 = { "89" }° S, { "0" }°, { "0" } m

seg-f32dcb376b51 = { "0.30" } m

seg-93d78578585f = ILLUSTRATIVE (przydział realizacji układu odniesienia z drzewa źródeł, sam w sobie MODELLED)

seg-59286c0377ce = <c1/>, <c2/> lub <c3/> z <c4/>

seg-fe90a6f490f9 = { "100" } m, { "30" } m (SISE wzdłuż linii widzenia { "65" } m)

seg-9a432ef35cac = ILLUSTRATIVE w dołączonej wartości domyślnej; przykład ze źródeł publicznych ustawia <c1/> = { "10" } / { "1.96" } m z S4 s. 8

seg-970357ba3630 = { "0" } m, { "10" } s, { "8" } bitów

seg-311a924e2133 = Siatka (<c1/>, <c2/>) lub <c3/>

seg-49a2022b83c0 = { "80" }° S, { "1" }° ({ "346" } punktów)

seg-e945f5407b12 = region badania

seg-fed48a6c31be = Czas (<c1/>, <c2/>, <c3/>), <c4/>

seg-0fec404c8c7c = { "0" } s, jedna doba, { "600" } s, { "200" }

seg-d35d88b0753b = { "20" } m dla p95 w dołączonej wartości domyślnej ({ "1" } m w przykładzie ze źródeł publicznych)

seg-fa7858b14f89 = podany przed przebiegiem; { "20" } m jest ILLUSTRATIVE, dobrane do poglądowych błędów wartości domyślnej

seg-a6ee5e2a8b61 = { "10" } m

seg-329ad585cd9b = ILLUSTRATIVE: brak wartości publicznej

seg-422a316b806b = { "5" } m, { "1e-4" }, { "42" }

seg-c530b459b0ef = Każde pole liczbowe ma jednostkę i klasę pochodzenia w bloku <c1/> wyniku (sprawdzane przez <c2/>). Blok regionu: <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>; <c14/> na sektor azymutu { "30" }°; <c15/> na punkt; oraz <c16/>.

seg-4aa380258574 = Co sprawdzenia mogą, a czego nie mogą powiedzieć

seg-112cb6bffc03 = <c1/>: redukcja do <c2/>, dolne granice zerowej bazy i pomiaru, monotoniczność, przyczyny niedostępności, determinizm, ogranicznik pracy. Pokazują one, że przegląd jest modelem, który twierdzi, że przegląda.

seg-695ed4f23f3c = <c1/>: niezależne ponowne obliczenie arytmetyki w numpy na wyeksportowanych przypadkach, zarejestrowane wstępnie przed uruchomieniem. Położenia i percentyle spełniły swoje progi; korekty stacji chybiły swoich z powodu zaokrągleń podwójnej precyzji (zapisane, wraz z liczbami, w <c2/>).

seg-be6ecf79d22c = Żadne z nich nie sprawdza modelu. Model błędu, dekorelacja pierwszego rzędu, modele pomiaru, starzenia i kwantyzacji oraz każdy próg są własnością tego projektu albo ILLUSTRATIVE.

seg-d6f194e28401 = Maski horyzontu terenu

seg-9ad9b163a3a0 = MODELLED. Opcjonalna sekcja <c1/> (<c2/>) nadaje stacji i każdemu punktowi użytkownika własny horyzont zależny od azymutu, w formacie tabeli linii horyzontu z { "0.36" } (wiersze <c3/>, liniowo względem azymutu z zawinięciem przy { "360" }°). Satelita liczy się w danym miejscu, gdy przekracza zarówno <c4/>, jak i horyzont w swoim azymucie; epoka, w której horyzont pozostawia mniej niż cztery satelity w punkcie, gdzie płaska maska daje cztery, jest zgłaszana jako <c5/> (<c6/> zachowuje swoje płaskie znaczenie). Dwa źródła, łączone jako ich maksimum punktowe, gdy podano oba:

seg-4d55808bc002 = podany profil, <c1/> lub <c2/> (stosowany w każdym punkcie użytkownika), każdy z wymaganą etykietą <c3/>;

seg-d6fda9939caa = horyzont wyznaczony metodą marszu promienia po biegunowym DEM (<c1/>): koła wielkie sfery księżycowej z dokładną krzywizną, od podanej wysokości masztu (domyślnie { "2" } m), co <c2/> (domyślnie { "1" }°), do <c3/> (domyślnie { "150" } km) lub krawędzi siatki. Repozytorium zawiera wycinek publicznego produktu biegunowego LRO LOLA <c4/> (domena publiczna), przepróbkowany metodą średnich blokowych { "5" } × { "5" } do { "1200" } m i obejmujący około ±{ "420" } km od bieguna (<c5/>: adres źródłowy, SHA-256, licencja, kroki wycinania i przepróbkowania);

seg-292c49f3739a = lub, zamiast <c1/>, kafel DEM szerokości/długości geograficznej (<c2/>) w formacie tekstowym <c3/> (nagłówek <c4/>, następnie wysokości w metrach nad średnią sferą, wierszami), przeszukiwany promieniem w ten sam sposób, przy czym odstęp szerokości geograficznej ustala krok domyślny. Raport powtarza ścieżkę, SHA-256 i zasięg kafla (<c5/>). Kafel przepróbkowany z dołączonego wycinka daje stacji własny horyzont wycinka z dokładnością { "0.22" }° (<c6/>). Żaden kafel nie jest dołączony.

seg-34ed85bb9ac0 = Te same maski dotyczą siatki <c1/> (<c2/>, <c3/> i <c4/>; punkt siatki poza DEM zachowuje płaską maskę i jest liczony). Bez tej sekcji każdy dokument jest identyczny bajt po bajcie z przebiegiem bez niej.

seg-8d07f0227ab8 = Sprawdzenia: marsz promienia odtwarza horyzonty w postaci zamkniętej (zaniżenie horyzontu nagiej sfery, krater na płaskowyżu od jego środka i poza nim, rasteryzowany stożek względem stożka analitycznego); dołączony wycinek ma orientację jak źródło (dna Shackleton i Haworth nisko, masyw Malapert wysoko); niezależne przeszukiwanie promieniem w numpy na wycinku, zarejestrowane wstępnie (<c1/>), zgadza się do { "5.5e-10" } deg w pięciu miejscach, co sprawdza arytmetykę, a nie teren. Nie odtworzono żadnej opublikowanej wartości horyzontu biegunowego ani oświetlenia, więc wiersz pozostaje MODELLED (wiersz rejestru „Maski horyzontu terenu Księżyca z podanego profilu lub biegunowego DEM”).

seg-10a1d62ab5cc = <c1/> uruchamia dołączone dane wejściowe na siatce { "2" }° ze { "100" } próbami i horyzontem DEM w każdym miejscu. Miejsce stacji ({ "89" }° S, { "0" }° E) ma najwyższy horyzont około { "4.0" }°, poniżej maski { "5" }°, więc na stacji teren nie ogranicza; w punktach użytkownika średnia ważona powierzchnią najwyższego horyzontu każdego punktu wynosi { "9.7" }°, a największa { "26.3" }°. W porównaniu z tymi samymi danymi wejściowymi i płaską maską skorygowany błąd 3-D p95 regionu rośnie z { "16.3" } m do { "18.6" } m, a największy HPL z { "480" } m do { "62" } km. Dostępność regionu rośnie z { "91.9" } % do { "93.0" } %: epoka jest niedostępna, gdy punkt używa satelity, którego stacja nie widzi, a horyzont zasłaniający ten satelita przed punktem może uczynić epokę dostępną.

seg-6d18d8a8dc78 = <b>Teren i maskowanie horyzontu: uwzględnione w { "0.36" }, z ograniczeniami.</b> Maski horyzontu dla poszczególnych miejsc z podanego profilu lub dołączonego wycinka DEM LOLA są modelowane (powyżej). Pozostaje: dołączony wycinek ma { "1200" } m na piksel, więc rzeźba poniżej około kilometra jest wygładzona, a średnie blokowe obniżają ostre szczyty; promień opuszczający wycinek (około { "420" } km od bieguna) kończy się tam; nie ma dyfrakcji, wielodrogowości od terenu ani częściowego przesłonięcia; położenia miejsc do pomiarów odległości pozostają na średniej sferze na podanych wysokościach (DEM ustala wyłącznie horyzont); horyzont nie jest zwalidowany względem zewnętrznej wartości. Miejsce eksportu dla poszczególnych satelitów z <c1/> jest maskowane jak punkt siatki: z sekcją <c2/> każdy wiersz eksportu zawiera <c3/>, a raport horyzont miejsca (<c4/>); zliczenia anteny w wiązce nadal uwzględniają każde łącze, które przekracza płaską maskę.

seg-b58b3ff1ef20 = <b>Wielodrogowość i sprzęt odbiornika: uwzględnione w { "0.36" } jako opcja, z ograniczeniami.</b> Sekcja <c1/> (<c2/>) dodaje zależną od elewacji wielodrogowość <c3/> u użytkownika i na stacji (postać funkcjonalna DO-229; na Księżycu każda wartość jest ILLUSTRATIVE), wielodrogowość stacji opcjonalnie jako proces Gaussa–Markowa pierwszego rzędu w czasie epok, szum kodu DLL typu early-minus-late z C/N0 oraz przesunięcia między kanałami dla każdego kanału. Pozostaje: zmienność środka fazowego anteny i opóźnienia grupowego nie jest modelowana; żaden pomiar księżycowy nie ustala wartości wielodrogowości; blok bilansu łącza korekt nie zawiera składników odbiornika.

seg-677252c2d3e5 = Wzrost błędu efemeryd w czasie opóźnienia: uwzględniony w { "0.36" } jako opcja, z ograniczeniami.

seg-3af08edab1cc = <c1/> dodaje liniowy wzrost błędu orbity w transmisji wraz z wiekiem (zakres 1-sigma <c2/>), oprócz reprojekcji zamrożonego błędu; wzrost liniowy jest składnikiem pierwszego rzędu błędu propagowanego stanu (sprawdzony do { "1" } % przy { "600" } s względem propagacji dwóch ciał z drzewa źródeł). Pozostaje: żadne źródło publiczne nie podaje księżycowej szybkości wzrostu (ILLUSTRATIVE); brak struktury wzdłuż toru i promieniowej; blok bilansu łącza korekt używa modelu zamrożonego. Dodatek K5 (<c3/>, zarejestrowany wstępnie samodzielnie) uruchamia K5 przy { "0.001" }, { "0.01" } i { "0.1" } m/s: kończy się niepowodzeniem w każdym przypadku ({ "369.8" } m, { "2315" } m, { "22797" } m wobec progu { "1.5" } m), jak podano przed przebiegiem.

seg-5bba9be34cad = <b>Styl rozwiązania (filtr, ograniczenie wysokości, trzy satelity): opcja w { "0.36" }, z ograniczeniami.</b> Sekcja <c1/> (<c2/>) dodaje pseudopomiar wysokości, minimum trzech satelitów z nim oraz okno ważonych najmniejszych kwadratów dla statycznego użytkownika po epokach (wspólne położenie, zegar na epokę), które zastępuje filtr. Pozostaje: traktuje błędy epok jako niezależne, więc uśrednia się szybciej niż błędy skorelowane w czasie; dotyczy wyłącznie użytkownika statycznego; nie ma filtra dynamicznego, fazy nośnej ani rozwiązywania niejednoznaczności; ślad przypadku (<c3/>) pokazuje arytmetykę migawki. Dodatek do opublikowanych twierdzeń z tym trybem to <c4/> (zarejestrowany wstępnie samodzielnie). Przy ograniczeniu wysokości { "1" } m, trzech satelitach i oknie 6 epok (ustawienia ILLUSTRATIVE) skorygowany błąd 3-D p95 dla R300 spada z { "280.6" } m do { "2.11" } m (poziomy { "0.90" } m, nieoceniany); K1 do K5 nadal kończą się niepowodzeniem, a K6 przechodzi, { "1" } z { "6" } jak w zapisanym przebiegu. Założenie niezależności okna mu sprzyja.

seg-4f8274f839a7 = Porównanie z opublikowanymi twierdzeniami

seg-82391b00e1bc = MODELLED. Porównanie tego modelu, uruchomionego przy publicznych założeniach, z twierdzeniami zawartymi w źródłach. Nie jest to stwierdzenie o działaniu żadnego rzeczywistego systemu.

seg-fc27b4012f02 = Źródła S1 do S5 (tytuł, URL, data pobrania, SHA-256, licencja): <c1/>.

seg-d866653008e1 = Każde twierdzenie liczbowe, zacytowane ze stroną i podanymi założeniami oraz sklasyfikowane jako porównywalne, częściowo porównywalne lub nieporównywalne: <c1/>. Żadne twierdzenie nie jest w pełni porównywalne, ponieważ żadne źródło nie podaje percentyla ani elementów orbitalnych satelitów.

seg-50535c58d3cf = Progi, przypadki i dane wejściowe, zatwierdzone samodzielnie przed przebiegiem (rewizja { "2" }, 05bf9a19), oraz zapisany przebieg: <c1/>. Wynik jest przypięty w <c2/>.

seg-069a652c402e = próg

seg-d6120708c062 = twierdzenie (źródła)

seg-5b480535b54b = ten model

seg-6231a005ccc9 = werdykt

seg-45dc6ff5d546 = jedna stacja daje dokładność poniżej metra w całym kole o promieniu { "300" } km wokół bieguna południowego (S1, S2, S3)

seg-4da98cf6180b = pokrycie { "0.00" }

seg-70a79ec95bf4 = niezaliczony

seg-cd0e9021aaa3 = to samo, koło { "600" } km (S2 s. 10, S3 s. 23)

seg-ef9f2ee31c52 = poniżej metra z korektami kodowymi (S1, S2)

seg-9f4e2b6991e8 = skorygowany 3-D p95 { "280.6" } m

seg-ac3c99ec0d15 = <= { "1.5" } m

seg-1b720f1677cc = „poziom decymetra” z korekt pseudoodległości (S3 s. 22, S5 s. 5)

seg-ffa1c831a14f = { "280.6" } m

seg-70368d910820 = <= { "0.15" } m

seg-786f940b345e = niezaliczony (nie mógł zostać zaliczony przy szumie kodu { "0.30" } m ze źródeł)

seg-da761dde1cae = poniżej metra utrzymane przy opóźnieniu { "600" } s (S2 s. 16)

seg-2a9db96bd87f = { "293.0" } m

seg-021336eb5623 = ta sama dokładność od { "10" } km do { "500" } km bazy (S2 s. 17)

seg-62190343777c = stosunek { "1.39" }

seg-7a33a168b020 = zaliczony

seg-e666f1eb7a59 = { "1" } z { "6" } progów zostaje zaliczone. Przyczyną jest geometria. Żadne źródło nie publikuje elementów orbitalnych konstelacji. Przy elementach ILLUSTRATIVE z drzewa źródeł użytkownik i stacja mają wspólne cztery satelity powyżej { "5" } deg tylko w { "8" } % ({ "300" } km) i { "6" } % ({ "600" } km) epok, przy geometrii bliskiej osobliwej: nieskorygowany p95 wynosi { "3.8" } km, tam gdzie źródła podają < { "10" } m. Własne symulacje źródeł używały filtra, ograniczenia wysokości i trzech satelitów we wspólnej widoczności, czego ten model migawkowy nie ma. Przebieg nie odtwarza więc twierdzeń na tych elementach i nie jest dowodem, że twierdzenia są błędne. Zaliczenie K6 jest stosunkiem dwóch wielkości zdominowanych geometrią i nic nie mówi o dekorelacji. Opublikowany zestaw elementów konstelacji zostałby oceniony przy tych samych progach jako drugi, datowany przebieg.

seg-1da5fcf7bbf5 = Wstępnie zarejestrowana prognoza

seg-4ea806a57380 = Wstępnie zarejestrowana prognoza, zamrożona w commicie <c1/> na danych wejściowych ze źródeł publicznych, z protokołem oceny: <a1><c2/></a1>. Jest to prognoza, a nie walidacja, i każda zawarta w niej wartość jest zdominowana przez nieopublikowany zestaw elementów czterosatelitarnej konstelacji (użyte elementy są ILLUSTRATIVE): w regionie { "80" } deg S dostępność { "8.2" } %, skorygowany 3-D p95 { "280" } m, nieskorygowany { "3.8" } km. MODELLED; <c3/> kończy się niepowodzeniem, jeśli jakikolwiek zamrożony bajt się zmieni.

seg-e6aef34d5023 = Laboratorium czasu stacji

seg-4ef12bffa7c4 = Czy miniRAFS stacji, sterowany do LTC, a następnie swobodnie biegnący lub ponownie sterowany, mieści się w { "1" }, { "10" } i { "100" } ns: opcjonalny blok <c1/> w <c2/> (<c3/>). miniRAFS osiąga { "1" } ns po { "2.8" } s, { "10" } ns po { "377" } s i { "100" } ns po { "10.5" } h; nanosekundowy cel źródła jest zacytowany, a nie przyjęty. MODELLED. Model, wyniki, tabela czasu do progu dla czterech klas zegarów i porównanie ze źródłami: <a1><c4/></a1>.

seg-69ddf7ea8fcb = Geodezja stacji

seg-717a5c91387b = O ile jeden retroreflektor i jeden radiolatarnia VLBI w miejscu stacji zacieśniają księżycowy układ odniesienia ponad pięć zarchiwizowanych układów retroreflektorów: opcjonalne dane wejściowe <c1/> i <c2/> w <c3/> (<c4/> i <c5/>). Granice Cramera–Rao dla zredukowanego zbioru parametrów na harmonogramie i w miejscu ILLUSTRATIVE: norma przesunięcia 1-sigma spada z { "0.0185" } m do { "0.0102" } m (stosunek { "0.551" }), skala z { "0.00178" } do { "0.00063" } ppm. MODELLED. Metoda, zastrzeżenia (miejsce w pobliżu bieguna południowego widzi Ziemię nisko lub wcale) i pełna tabela Helmerta: <a1><c6/></a1>.

seg-8a873848459b = Każde źródło według tytułu, identyfikatora i wydawcy, z datą pobrania i licencją. Adresy URL, skróty SHA-256 i uwagi o miejscach, w których źródła się różnią, znajdują się w rejestrze, <a1><c1/></a1>. Żaden plik źródłowy nie jest redystrybuowany. Nazwiska osób pominięto celowo.

seg-b1f1e1efa042 = id

seg-02071a726f21 = tytuł

seg-0634af374469 = identyfikator

seg-fd875b5fb817 = wydawca

seg-a6f8ef268fcc = pobrano

seg-d04709ddc97d = licencja

seg-1d4174e911c1 = biała księga o księżycowej stacji referencyjnej dla pozycjonowania, czasu i nauki, wersja { "3" }

seg-e09e1cc11921 = arXiv (biała księga autorów)

seg-c91720d34bd3 = niewyłączna licencja arXiv na dystrybucję { "1.0" } (przyznaje prawa tylko arXiv)

seg-df12c861db1e = „Lunar local Differential PNT and Selenodetic Reference Station” ({ "27" } slajdów)

seg-03f689a0ba49 = ioag.org/meetings/cislunar, sekcja { "6" }, pozycja { "07" }

seg-406990fe43a8 = ICG-IOAG Workshop on Cislunar PNT, luty { "2025" }; slajdy Europejskiej Agencji Kosmicznej

seg-58579c3faf2f = nie podano; oznaczone jako dopuszczone do publicznego udostępniania od slajdu { "3" }

seg-57df0ef791e6 = „Moonlight: LCNS, and Lunar Pathfinder” ({ "28" } slajdów)

seg-7e18a15e0d16 = unoosa.org, <c1/>

seg-23aee49b1347 = UNOOSA, ICG Joint Working Group Session on Lunar PNT, czerwiec { "2024" }; slajdy Europejskiej Agencji Kosmicznej

seg-f4e53e44f0b5 = nie podano; oznaczone jako dopuszczone do publicznego udostępniania

seg-b22a694c481d = „Moonlight Programme Development Status” ({ "16" } slajdów)

seg-3fd0ab93507d = 2nd ICG-IOAG Cislunar PNT Workshop, luty { "2026" }; slajdy Europejskiej Agencji Kosmicznej i Telespazio

seg-472771298df7 = „Lunar Reference Time: ESA's Views” ({ "9" } slajdów)

seg-6229db9cb23d = Workshop on Cislunar PNT, luty { "2026" }; slajdy Europejskiej Agencji Kosmicznej

seg-6b626a2abd0f = LunaNet Signal-In-Space Recommended Standard, Augmented Forward Signal (LSIS) V1.0 oraz <c1/> z drzewa źródeł

seg-4e07c500e353 = jak zapisano w <c1/>

seg-28f8d886c4e5 = już w drzewie źródeł

seg-2006c194fef6 = jak zapisano tam

seg-68db6a17b4e7 = <s1>Poprzednia</s1>Układ Słoneczny i inne ciała

seg-79d53edd2374 = <s1>Następna</s1>Nawigacja użytkowników kosmicznych (gnss-ssv)

seg-9c59637f0666 = Mapa pokrycia i dokładności (lunar-station-coverage)
