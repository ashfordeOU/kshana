# docs--reproducibility: translations (pl)

seg-03cb5fb3dd8f = Tak

seg-a7d5633dbcc0 = Odtwarzalność i pochodzenie

seg-ab939e90efad = Źródło: <c1/>

seg-1c48a3edda84 = { -brand } jest zbudowany tak, by był odtwarzalny: te same dane wejściowe dają te same wyniki, a artefakty kompilacji można prześledzić do źródła, które je wytworzyło. Ten dokument mówi dokładnie, co jest gwarantowane, a co nie, i jak te gwarancje są egzekwowane.

seg-95b0eba44abe = Gwarancje determinizmu

seg-1f637144697d = Silnik nie ma zegara ściennego, zależności od wątku wykonania ani niezasianej losowości. Każdy proces stochastyczny jest napędzany strumieniem <c1/> z kluczem w postaci <c2/> scenariusza, losowanym w ustalonej kolejności. Konsekwencje:

seg-14df30025491 = Właściwość

seg-f0badf8cb640 = Gwarantowane

seg-9f6678ac42f5 = Egzekwowane przez

seg-cfc934af2c75 = Ten sam scenariusz, ta sama maszyna → identyczny co do bajta <c1/>

seg-917da569fdd7 = <c1/> (uruchamia scenariusz referencyjny dwukrotnie i porównuje SHA-256 (SHA: Secure Hash Algorithm))

seg-27351cbdc2b5 = Ten sam scenariusz → identyczne wskaźniki jakości pole po polu

seg-bdeaf344acf8 = Tak, dla każdej platformy

seg-debbc6540baf = <c1/> przypina każdy wskaźnik jakości (FoM) dla czterech scenariuszy referencyjnych

seg-f7c5427c88f9 = Skrót wejściowy scenariusza (<c1/>) nie zależy od platformy

seg-2bdf4b2d80be = SHA-256 kanonicznego scenariusza adresowany treścią, przypięty w <c1/>

seg-45861afe0994 = Odcisk wejścia i <b>kształt</b> wyjścia identyczne na różnych systemach operacyjnych (OS)

seg-49345663b97c = <c1/> przypina dokładny SHA-256 dla każdego scenariusza (dziesięć scenariuszy, po jednym pliku <c2/> w <c3/>), sprawdzany w macierzy CI (continuous integration) dla 3-OS

seg-e54b5ff80782 = <b>Wartości</b> wyjściowe zgadzają się na różnych systemach (ubuntu/macOS/Windows)

seg-271bcbff6287 = Tak, do { "1e-6" }

seg-3c25e00debff = zadanie CI <c1/> uruchamia <c2/> ({ "1e-6" }), <c3/> ({ "2e-5" } km) i <c4/> na wszystkich trzech systemach

seg-3876618cc821 = Ramka komunikatu nawigacyjnego niskiej orbity okołoziemskiej (LEO) ma te same bajty na każdej platformie i w każdym profilu kompilacji, wraz z kompilacją WebAssembly (WASM)

seg-8aff3ee31c7e = <c1/> (każda funkcja przestępna i każda zmienna o rozkładzie normalnym rodzaju <c2/> przechodzi przez czysto rustowy pakiet <c3/>); <c4/> przypina całą ramkę bez bramki platformowej

seg-69750a5db756 = Losowania indeksów z ziarna (próbkowanie bootstrap, tasowanie) są takie same na celach 32-bitowych i 64-bitowych

seg-01e0601aa7fc = <c1/> zawsze próbkuje jako <c2/>; przypięte w <c3/>

seg-e42899fd8a4e = Wszędzie ten sam zestaw narzędzi

seg-0bdd9769d5fb = <c1/> przypina kanał; <c2/> przerywa kompilację przy rozbieżności; CI i wydanie przypinają tę samą wersję

seg-b0a3fd993614 = Ten sam zestaw zależności

seg-5a3daf9f0468 = <c1/> jest zatwierdzony, a <c2/> służy do SBOM (software bill of materials)

seg-3ec3fae0dc5e = Każdy przebieg z wiersza poleceń zapisuje też w raporcie zapis odtwarzalności (<c1/> i <c2/>): wersję silnika, SHA-256 pliku scenariusza i dokumentu wynikowego, ziarno, platformę i dokładne polecenie, które <c3/> uruchamia ponownie do wyniku identycznego co do bajta. Sam raport jest czystą funkcją przebiegu: dwa przebiegi <c4/> zapisują ten sam <c5/> bajt w bajt. Zob. <a1>REPORTS.md</a1>.

seg-273a66a3584d = Zastrzeżenie dotyczące różnych platform (i jak radzą sobie z nim wartości wzorcowe)

seg-9f4ec3dc638d = Wyniki numeryczne są <b>identyczne co do bitu na danej platformie</b>, ale mogą się różnić o kilka ostatnich jednostek na ostatnim miejscu (ULP) <b>między</b> platformami. Przyczyną jest platformowa biblioteka matematyczna: <c1/>, <c2/>, <c3/> i podobne nie muszą według IEEE-754 (IEEE: Institute of Electrical and Electronics Engineers) być poprawnie zaokrąglane, więc Linux (glibc, biblioteka GNU C), macOS i Windows mogą zwracać różny ostatni bit. W długim przebiegu te różnice rzędu ~{ "1e-16" } kumulują się do może ~{ "1e-12" } względnie.

seg-9297c2585419 = Dwie rzeczy sprawiają, że różnica na ostatnim miejscu rośnie ponad swój początek i obie są zmierzone, a nie założone. <b>Integrator adaptacyjny</b> wybiera następny krok z oszacowania błędu przez pierwiastek piątego stopnia, więc jedna jednostka na ostatnim miejscu zmienia ciąg kroków i obie platformy zgadzają się wtedy tylko do tolerancji całkowania. <b>Estymator iteracyjny</b> (dopasowanie najmniejszych kwadratów, filtr wyznaczania orbity) może pójść inną drogą do zbieżności. Rodzaje zbudowane na jednym z nich mogą różnić się między platformami o więcej niż { "1e-6" } w poszczególnych polach; <c1/> zapisuje ten sam reżim dla testów jednostkowych.

seg-c6bd20427abc = <b>Profil kompilacji</b> ma takie samo znaczenie na jednej maszynie. Zoptymalizowana kompilacja na macOS łączy sinus i cosinus jednego argumentu w jedno wywołanie połączonej procedury systemowej, której sinus różni się od samotnego <c1/> na ostatnim bicie dla { "379" } z { "200 000" } argumentów; kompilacja niezoptymalizowana wykonuje dwa wywołania. Zmierzono na aarch64 macOS dla { "138" } plików scenariuszy: kompilacja debug i release jednego źródła dają dokumenty wynikowe identyczne co do bajta dla { "102" }. Pozostałe { "36" } różnią się na ostatnich miejscach: { "28" } w granicach { "1e-6" }, jeden (<c2/>) o { "2.8e-6" }, a siedem kampanii tylko w skrótach swoich przebiegów składowych; żaden nie różni się etykietą, liczbą ani werdyktem. Gwarancja identyczności co do bajta powyżej dotyczy więc jednej kompilacji: tego samego pliku binarnego dwukrotnie.

seg-ff368c627bd2 = Losowania <b>rozkładu normalnego</b> z ziarna są trzecim, znacznie rzadszym źródłem: próbnik wywołuje funkcje wykładniczą i logarytm hosta w swoich rzadkich gałęziach, a około jedno losowanie na milion różni się ostatnim bitem między kompilacją natywną a WASM.
