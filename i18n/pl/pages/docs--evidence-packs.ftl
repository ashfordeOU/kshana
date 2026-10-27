# docs--evidence-packs: translations (pl)

seg-2247a2344710 = Znaczenie

seg-ade1d7072512 = zob. poniżej

seg-245fe1f87b08 = Plik

seg-802d8b6f3afd = Źródło: <c1/>

seg-710e7e630acb = Pakiety dowodowe: podpisany zapis zdarzenia dotyczącego zaufania do GNSS

seg-dbc796deac2a = <b>Pakiet jest zapisem technicznym, a nie opinią prawną.</b> Podaje, co silnik { -brand } obliczył z podanego dziennika odbiornika przy podanej konfiguracji, i pozwala każdemu sprawdzić, że nic w nim nie zmieniono później. Nie mówi, co spowodowało zdarzenie, kto za nie odpowiadał, czy spełniono jakikolwiek obowiązek ani że dziennik pokazuje to, co odbiornik faktycznie odebrał. Mówią o tym zarówno manifest, jak i podsumowanie.

seg-d99cb540310c = Pakiet dowodowy służy do raportu z incydentu, dla ubezpieczyciela lub na pytanie regulatora: „co wasz system powiedział o sygnale GNSS między tymi dwoma chwilami i czy możemy ufać temu zapisowi?”

seg-2fa31fe443b4 = Utwórz pakiet

seg-983924cb2eea = Dla pakietu utworzonego z sesji laboratoryjnej <c1/> zapisuje w podpisanym manifeście oświadczenie operatora o układzie (przewodowy lub ekranowany, tłumienie lub obudowa, co emitowało jakikolwiek sygnał RF); zob. <a1><c2/></a1>. Jest zapisywane tak, jak podano, i nigdy nie jest weryfikowane.

seg-f01e59c876a3 = <c1/> i <c2/> to sekundy od pierwszej epoki dziennika albo czas UTC w formacie ISO-8601, gdy dziennik podaje własny czas początku. <c3/> nie może już zawierać plików. <c4/> przyjmuje rzeczywisty czas UTC, taki jak <c5/> (cokolwiek innego jest odrzucane), lub <c6/>, co pomija czas utworzenia i czyni pakiet odtwarzalnym bajt w bajt. Czas utworzenia jest tym, co poda podpisujący; nic nie sprawdza go względem zegara, do czego służy opcjonalny token znacznika czasu.

seg-c72ddd97ad0b = Plik klucza zawiera 32-bajtowe ziarno (seed) Ed25519 jako { "64" } cyfr szesnastkowych; podaj własny (na przykład przechowywany w twoim systemie zarządzania kluczami) albo pozwól, by <c1/> go utworzył. <c2/> ostrzega, jeśli plik jest czytelny dla innych użytkowników. <c3/> wyklucza <c4/>; nazwij tak swój klucz, jeśli leży w kopii roboczej repozytorium.

seg-077cbd944c5d = Co jest w pakiecie

seg-7cf2608b2b2f = Struktura pakietu dowodowego. Dziennik odbiornika (NMEA, u-blox UBX, RINEX { "3" } lub dziennik Androida) i okno czasowe trafiają do kshana receiver-trust evidence, które zapisuje siedem plików: log-slice.bin, config.json, epochs.json, summary.html, manifest.json, manifest.sig i opcjonalny timestamp.tsr. Manifest zapisuje SHA-256 całego dziennika i każdego pliku oraz łańcuch skrótów po plikach; podpis obejmuje manifest. kshana evidence verify sprawdza podpis, skrót każdego pliku, łańcuch oraz to, że nie ma pliku spoza listy, i kończy się kodem { "0" }, gdy zweryfikowano, { "1" }, gdy coś zawiodło, i { "3" }, gdy podpisujący nie był przypięty. Pakiet jest zapisem technicznym, a nie opinią prawną.

seg-e305279d5b11 = Zawartość

seg-05107c0bd3c8 = surowe bajty dziennika odbiornika dla okna

seg-b19ce12544a5 = scenariusz tak, jak go uruchomiono (każdy próg monitora, zdarzenie i reguła porównania), uruchomione monitory, punkt odniesienia kalibracji i skrót scenariusza; dla statku także oświadczenie doradcze, które niesie każdy wynik dla statku (oprogramowanie doradcze, nie jest to sprzęt nawigacyjny z zatwierdzeniem typu); od { "0.36" } także <c1/> (faktycznie użyta tabela <c2/>, waga monitora geometrii, każde pochodzenie i reguły klas). Nazwy katalogów i dane wbudowane są usuwane.

seg-e3c2457161bc = każda epoka w oknie ze statystykami silnika, alarmami (przyczynami) i stanem zaufania; od { "0.36" } także jej satelitarne <c1/> (dobre, pogorszone z przyczynami lub nieznane, gdy dziennik nie podaje geometrii satelitów) oraz <c2/> przy każdym wniosku (<c3/>, <c4/>, <c5/>)

seg-2e309765271f = samodzielne podsumowanie bez skryptów: identyfikacja, skróty, wyniki, przyczyny, pas geometrii (epoki według stanu geometrii) oddzielony od klas wniosków ({ "0.36" }), każdy próg, tabela dla poszczególnych epok oraz ograniczenia zapisu

seg-467277f816d2 = wersja silnika, okno, czas utworzenia, format i nazwa dziennika, <b>SHA-256 pełnego dziennika</b>, zakres i SHA-256 wycinka, klucz publiczny i odcisk podpisującego, rozmiar i SHA-256 każdego pliku oraz łańcuch skrótów po plikach

seg-7a92ff70ed7f = podpis Ed25519 po dokładnych bajtach <c1/>

seg-b517814b077d = opcjonalny token znacznika czasu RFC { "3161" }

seg-6ad4c5f3afbe = <b>Wycinek dziennika.</b> Czytnik podaje zakres bajtów źródłowych każdej epoki, więc wycinek jest najmniejszym zakresem bajtów, który zawiera każdą epokę z okna (<c1/>): NMEA, u-blox UBX, obserwacje RINEX { "3" } i dzienniki Androida. Jest haszowany jako surowe bajty, nigdy jako zdekodowany tekst. Dla kanału na żywo lub RINEX { "2" } zakresu nie ma; wtedy dołącza się cały dziennik, a manifest podaje <c2/> (okno ogranicza, które epoki są raportowane, a nie które bajty są dołączone). Podsumowanie podaje, który przypadek zachodzi. Wycinek jest zapisem bajtów okna, a nie samodzielnym dziennikiem: na przykład wycinek RINEX nie ma nagłówka pliku.

seg-c4c81cbd4981 = <b>Łańcuch skrótów.</b> Manifest wymienia pliki w ustalonej kolejności. <c1/>; dla każdego pliku <c2/> (długość jako { "4" } bajty, big-endian). Ostatnie ogniwo to <c3/>. Zmiana kolejności, usunięcie lub podmiana pliku zmienia łańcuch; podpis obejmuje łańcuch.

seg-1147c5b0d348 = Zweryfikuj pakiet

seg-e716ddf7bcc9 = Kod wyjścia { "0" } oznacza zweryfikowano; { "1" } oznacza, że coś zawiodło; { "2" } oznacza błąd użycia; { "3" } oznacza, że pakiet jest nienaruszony, ale jego podpisujący nie był przypięty (zob. niżej). Każda kontrola zgłasza wynik pozytywny, negatywny lub pominięcie, a każda porażka jest nazwana:

seg-f6f2cebd9cb0 = Kod porażki

seg-312a5d784f42 = nie można odczytać manifestu

seg-6f1b5d9d6711 = brak podpisu, to nie jest 64-bajtowy podpis szesnastkowy małymi literami albo nie weryfikuje się po <c1/>

seg-129b78f142f1 = klucz jest nieprawidłowy lub różni się od podanego przez ciebie

seg-c86b25543d55 = wymieniony plik jest nieobecny lub różni się od manifestu; plik jest wskazany z nazwy

seg-f98d26abf045 = plik jest w pakiecie, ale nie ma go w manifeście

seg-842bac6a9e69 = ogniwo nie jest tym, co dają jego dane wejściowe; plik jest wskazany z nazwy

seg-413034467a64 = manifest zaprzecza sam sobie lub <c1/>

seg-ef4bfbedca33 = z <c1/>: dziennik, który masz, nie jest tym zapisanym albo wycinek nie jest tym zakresem dziennika

seg-dcd686ac77f7 = Zmiana jednego bajtu w dowolnym pliku powoduje porażkę weryfikacji z odpowiednim powodem: zmieniony artefakt jest zgłaszany jako niezgodność skrótu tego pliku i nic więcej; zmieniony manifest powoduje porażkę podpisu. Ponowne obliczenie skrótów i łańcucha po edycji pliku nie pomaga bez klucza podpisującego; wtedy zawodzi tylko podpis.

seg-066fe7c07bf6 = <b>Przypnij klucz.</b> Bez <c1/> pakiet dowodzi jedynie, że jest nienaruszony względem klucza, który sam wskazuje i który każdy może wygenerować. Dlatego weryfikacja kończy się wtedy kodem { "3" } i mówi „INTACT, BUT THE SIGNER IS NOT PINNED”, a nie „VERIFIED”; <c2/> przyjmuje własny klucz pakietu świadomie i wypisuje „VERIFIED against the key the pack names itself (signer NOT pinned; pass --pubkey)”. Klucz publiczny podpisującego uzyskaj od podpisującego drogą, której ufasz (nie z pakietu) i przekaż go przez <c3/>: { "64" } cyfr szesnastkowych lub plik <c4/>. Przekazanie klucza prywatnego przez pomyłkę jest rozpoznawane i odrzucane. Odcisk (pierwsze { "128" } bitów SHA-256 klucza, { "32" } cyfry szesnastkowe) jest drukowany do porównania na oko; niezawodną drogą jest przypięcie pełnego klucza.

seg-a01c7ba606c9 = Format pakietu i procedura weryfikacji (normatywne)

seg-fa43e16b6aba = Ta sekcja jest specyfikacją, z której pisze się niezależny weryfikator. Słowa pisane wielkimi literami są wymaganiami. Pakiet jest katalogiem (lub dowolnym odwzorowaniem nazwy pliku na bajty) plików nazwanych dokładnie tak, jak niżej; weryfikator pracuje na bajtach każdego pliku w postaci zapisanej i niczego nie serializuje ponownie.

seg-1fbabb3f1092 = <b>Pliki.</b> Pliki artefaktów, w tej ustalonej kolejności, to <c1/>, <c2/>, <c3/>, <c4/>. Pakiet ma także <c5/> i <c6/> i MAY mieć <c7/>. Każda inna nazwa to <em>plik spoza listy</em>.

seg-3ed6e38ad2ee = <b>Szesnastkowe.</b> Każdy ciąg szesnastkowy to wyłącznie małe litery <c1/>, bez białych znaków; wielkie litery nie są akceptowane. Wartości SHA-256 mają { "64" } cyfry, klucz publiczny ma { "64" } cyfry, podpis ma { "128" } cyfr.

seg-6609210d003a = <b><c1/>.</b> 128-cyfrowy zapis szesnastkowy małymi literami 64-bajtowego podpisu Ed25519 (RFC { "8032" }, czysty schemat Ed25519) po dokładnych bajtach <c2/>, po którym następuje dokładnie jeden <c3/> i nic więcej. Podpis MUST być sprawdzany ściśle: podpis, którego wartość S nie jest mniejsza od rzędu grupy L, jest nieprawidłowy.

seg-b163e9f5db66 = <b><c1/>.</b> Obiekt JSON w UTF-8. Jego składowe (weryfikator MUST znaleźć każdą z podanym typem JSON; dodatkowe składowe są ignorowane):

seg-ace92bcbfd8a = składowa

seg-04f69a0edb2f = typ

seg-45425f378b61 = znaczenie

seg-6940543aa3c0 = ciąg znaków

seg-48d303baac62 = MUST równać się <c1/>

seg-6e57561e7f01 = opisowe

seg-abec93a4a488 = ciąg znaków lub null

seg-7d059c0b6372 = czas utworzenia, opisowy

seg-507d53a53380 = obiekt <c1/>

seg-bb2bcbbf404a = liczby, sekundy

seg-64572c65426f = nieujemna liczba całkowita

seg-14d421e391dd = liczba elementów tablicy JSON w <c1/>

seg-f5e7215e6835 = obiekt

seg-a4117217030c = <c1/> ciąg znaków, <c2/> ciąg znaków, <c3/> szesnastkowe, <c4/> nieujemna liczba całkowita, <c5/> ciąg znaków lub null oraz <c6/>

seg-02389e71a339 = <c1/> (dokładnie <c2/> lub <c3/>; każda inna wartość czyni manifest wadliwym), <c4/> i <c5/> nieujemne liczby całkowite (przesunięcia w bajtach, koniec wyłączony), <c6/> szesnastkowe

seg-6c9176965aae = <c1/> ciąg znaków (<c2/>), <c3/> szesnastkowe ({ "32" } bajty), <c4/> ciąg znaków

seg-dcba59304030 = tablica obiektów

seg-e42ed5e07430 = po jednym na plik artefaktu, w ustalonej kolejności: <c1/> ciąg znaków, <c2/> ciąg znaków, <c3/> nieujemna liczba całkowita, <c4/> szesnastkowe, <c5/> szesnastkowe

seg-b79c9500b744 = szesnastkowe

seg-697592bd3757 = ostatnie ogniwo

seg-9da5d92757bd = obiekt, opcjonalny

seg-2032c208038d = obecny tylko w pakiecie utworzonym z sesji laboratoryjnej (<c1/>): oświadczenie operatora <c2/>, <c3/>, <c4/>, <c5/> (<c6/> lub <c7/>), <c8/> lub <c9/>, <c10/>, <c11/> i opcjonalnie <c12/>, zapisane tak, jak podano. Obejmuje je podpis manifestu i nigdy nie jest weryfikowany; weryfikator zgłasza go jako „attested by the named operator; not verified by Kshana”. W pozostałych przypadkach nieobecny, a pakiet bez niego pozostaje bez zmian

seg-9411be425a80 = <c1/> to pierwsze { "32" } cyfry szesnastkowe SHA-256 po { "32" } bajtach klucza publicznego.

seg-80e55f2d3496 = Łańcuch skrótów.

seg-9346fe50efac = <c1/> to SHA-256 z { "23" } bajtów ASCII <c2/>. Dla każdego artefaktu w kolejności: <c3/>, gdzie <c4/> bierze się z zapisanego w manifeście <c5/> dla tego artefaktu (więc łańcuch jest własnością manifestu i sprawdza się go względem manifestu, a nie względem plików).

seg-9dd985d8cb03 = <b>Procedura.</b> Weryfikator wykonuje te kroki po kolei i zbiera każdą porażkę; wynikiem jest <em>zbiór</em> porażek, z których każda to <c1/> i, gdzie podano, plik <c2/>. MUST NOT zatrzymywać się na pierwszej porażce, poza miejscami, gdzie podano. <c3/> to klucz publiczny, któremu weryfikator kazano zaufać, jeśli jakiś jest.

seg-abb1d2635143 = Brak <c1/>: porażka <c2/>; stop.

seg-73a4aeb463e8 = Jeśli <c1/> nie jest obiektem JSON ze wszystkimi powyższymi składowymi w podanych typach (w tym wpisami <c2/> z każdą składową oraz <c3/>): porażka <c4/>. W przeciwnym razie, jeśli <c5/> nie jest powyższą wartością: <c6/>.

seg-36c9df2abf34 = Faza podpisu. Ta faza jest wykonywana niezależnie od tego, czy manifest dało się odczytać. Jeśli manifest dało się odczytać, <em>klucz wskazany</em> to <c1/>; jeśli nie jest to { "64" } cyfr szesnastkowych małymi literami, porażka <c2/> (brak klucza wskazanego); w przeciwnym razie, jeśli <c3/> nie jest jego odciskiem, porażka <c4/> (klucz pozostaje użyteczny). Jeśli istnieją zarówno <c5/>, jak i klucz wskazany i się różnią: porażka <c6/>. <em>Klucz kontrolny</em> to <c7/>, jeśli go podano, w przeciwnym razie klucz wskazany, jeśli istnieje; jeśli nie ma żadnego, nie ma klucza kontrolnego (dotyczy to każdego przypadku, gdy manifestu nie dało się odczytać i nie podano <c8/>). Jeśli nie ma <c9/>: <c10/>. W przeciwnym razie, jeśli plik nie składa się dokładnie z { "128" } cyfr szesnastkowych małymi literami plus jednego <c11/>: <c12/>. W przeciwnym razie, jeśli jest klucz kontrolny, który nie jest prawidłowym kodowaniem klucza publicznego Ed25519: <c13/>. W przeciwnym razie, jeśli jest klucz kontrolny, a podpis nie weryfikuje się ściśle po bajtach <c14/> (jakiekolwiek by były): <c15/>. (Bez klucza kontrolnego podpis nie jest sprawdzany i nie zgłasza się z tego powodu żadnej porażki.)

seg-3dbe07af8fa8 = Jeśli manifestu nie dało się odczytać (krok { "2" } dał <c1/>): zatrzymaj się tutaj.

seg-b7e03ef2dea5 = Artefakty. Jeśli nazwy <c1/> nie są dokładnie czterema powyższymi w kolejności: <c2/>. Następnie dla każdego wpisu manifestu, w kolejności: jeśli pakiet nie ma pliku o tej nazwie, <c3/> (nazwa); w przeciwnym razie, jeśli jego długość różni się od <c4/>, <c5/> (nazwa); i niezależnie, jeśli SHA-256 pliku różni się od <c6/>, <c7/> (nazwa).

seg-24cda5a1d9d8 = Pliki spoza listy: dla każdego pliku w pakiecie innego niż <c1/>, <c2/>, <c3/> i nazwy z <c4/> manifestu: <c5/> (nazwa).

seg-d103ade9a7c7 = Łańcuch. Przejdź po <c1/> manifestu w kolejności od <c2/>. Jeśli <c3/> wpisu nie jest { "64" } cyframi szesnastkowymi małymi literami: <c4/> i łańcuch jest porzucany (bez sprawdzania głowy). W przeciwnym razie oblicz ogniwo; jeśli różni się od <c5/> wpisu: <c6/> (nazwa). Po przejściu, jeśli łańcuch nie został porzucony, a ostatnie ogniwo różni się od <c7/>: <c8/>.

seg-be9fade3f879 = Wycinek i epoki. Zgłoś <c1/> (co najwyżej raz na powód, a weryfikator zgłasza kod raz niezależnie od liczby zachodzących powodów), jeśli zachodzi którekolwiek z: <c2/>; <c3/>; <c5/> wpisu <c4/> różni się od <c6/>; <c7/> tego wpisu różni się od <c8/>; albo <c9/> to <c10/> i zachodzi którekolwiek z <c11/>, <c12/>, <c13/>. Jeśli <c14/> istnieje i parsuje się jako tablica JSON, której długość różni się od <c15/>: <c16/>.

seg-0dc49ed14c1f = Pełny dziennik. Tylko jeśli weryfikatorowi podano oryginalne bajty dziennika: jeśli ich SHA-256 różni się od <c1/>, <c2/>; w przeciwnym razie, jeśli zakres <c3/> nie mieści się w dzienniku albo bajty dziennika w tym miejscu różnią się od <c4/>, <c5/>.

seg-a7f787d6e6df = Znacznik czasu. Bez <c1/>: jeśli weryfikatorowi kazano go wymagać, <c2/>; w przeciwnym razie nic. Z nim: jeśli nie da się go odczytać jako tokenu lub odpowiedzi RFC { "3161" } (zob. niżej), <c3/>; w przeciwnym razie, jeśli jego odcisk komunikatu nie jest skrótem, w algorytmie własnym odcisku (SHA-256, SHA-384 lub SHA-512), bajtów <c4/>: <c5/>.

seg-f7d908c6bf38 = Pakiet jest zweryfikowany dokładnie wtedy, gdy zbiór porażek jest pusty. To, czy podpisujący był przypięty, jest zgłaszane osobno i nie zmienia zbioru porażek.

seg-b0d74519122d = <b>Token znacznika czasu.</b> Token to DER <c1/>, którego typ zawartości to CMS SignedData ({ "1.2.840.113549.1.7.2" }), a typ zawartości zamkniętej to <c2/> ({ "1.2.840.113549.1.9.16.1.4" }); odpowiedź to DER <c3/> (<c4/> po którym następuje token), której status to { "0" } lub { "1" }. Algorytm odcisku komunikatu w <c5/> musi być SHA-256, SHA-384 lub SHA-512 ze skrótem długości tego algorytmu, a jego <c6/> musi być rzeczywistym czasem kalendarzowym UTC. BER o nieokreślonej długości nie jest akceptowany. Podpis organu i łańcuch certyfikatów są sprawdzane tylko wtedy, gdy podano zaufane kotwice (<c7/>, niżej).

seg-2156bf4dabb3 = Znacznik czasu RFC { "3161" } (opcjonalny)

seg-27a71ea73d7d = Token znacznika czasu od organu znakowania czasem pokazuje, że manifest istniał w chwili, którą organ poświadcza. Token dotyczy <c1/>, więc żąda się go po utworzeniu pakietu (nie da się go dostarczyć przy tworzeniu pakietu, a <c2/> odrzuca token, który nie dotyczy dokładnie tego manifestu):

seg-7ae6e0326b65 = <c1/> odczytuje token (sam token lub pełną odpowiedź), sprawdza, że został przyznany i że jego odcisk komunikatu równa się skrótowi <c2/>, i wypisuje podany w nim czas. Bez zaufanych kotwic dodaje „timestamp authority signature not verified by Kshana” i zgłasza <c3/>; tę część sprawdza wiersz <c4/> powyżej. Token, którego odcisk się różni, lub taki, który się nie parsuje, jest porażką. Typy zawartości tokenu, długość odcisku i czas wygenerowania są sprawdzane pod kątem sensowności.

seg-88359c107bf1 = Z <c1/> (jeden lub więcej certyfikatów PEM, wszystkie zaufane) <c2/> sprawdza także organ, offline, tak jak robi to <c3/>: skrót komunikatu w podpisanych atrybutach, podpis (RSA PKCS#1 v1.5, RSA-PSS, ECDSA P-256 lub P-384), powiązanie certyfikatu podpisującego ESS, krytyczne rozszerzone użycie klucza timeStamping podpisującego oraz łańcuch do samowystawionej kotwicy, przy czym każdy certyfikat jest ważny w <c4/> tokenu. Porażka jest zgłaszana jako <c5/> z pierwszą kontrolą, która zawiodła, a <c6/> jest prawdą tylko wtedy, gdy wszystko przeszło. Unieważnienia (CRL lub OCSP) nie są sprawdzane. Ten weryfikator zgadza się z OpenSSL { "3.0.13" } w { "27" } samodzielnie wygenerowanych przypadkach (<c7/>).

seg-f534ae37f10c = <b>Token leży obok podpisanego manifestu, a nie w nim.</b> Nic w podpisie ani w łańcuchu go nie obejmuje, więc token można usunąć albo podmienić na inny ważny token, bez porażki podpisu. <c1/> dlatego zauważa, gdy pakiet go nie ma, a <c2/> czyni brak tokenu porażką (<c3/>); podmieniony token jest wychwytywany tylko wtedy, gdy nie pasuje do manifestu. <c4/> odmawia nadpisania istniejącego tokenu, chyba że podasz <c5/>. Jeśli znacznik czasu ma dla ciebie znaczenie, przechowuj token i wynik weryfikacji we własnych zapisach i go wymagaj.

seg-b993ef559bd0 = Z kodu

seg-de24fd02c7c2 = <c1/> to jedyny punkt wejścia, który wywołuje wiersz poleceń i każda inna powierzchnia, by utworzyć pakiet: na wejściu scenariusz, bajty dziennika (i pliku nawigacyjnego dla RINEX), okno jako tekst, tytuł i opcjonalny czas utworzenia oraz ziarno (seed) podpisu; na wyjściu pliki, liczba epok, wycinek, skrót manifestu i odcisk podpisującego. Nie czyta plików ani zegara, więc te same dane wejściowe dają te same bajty. Poniżej <c2/> i <c3/> są funkcjami czystymi: na wejściu bajty (<c4/>, 32-bajtowe ziarno, <c5/> plików), na wyjściu wyniki możliwe do serializacji (<c6/>, <c7/>). Nie używają plików, zegara ani stanu procesu i budują się dla <c8/>, więc powierzchnie Pythona, WebAssembly i serwera wywołują je bez zmian. Wiersz poleceń jest cienką nakładką na nie.

seg-292a5bc48548 = Czego pakiet nie robi

seg-852aca7fc407 = Nie powtarza oceny. Każdy, kto ma pełny dziennik i <c1/>, może ponownie uruchomić <c2/> i porównać z <c3/>; pakiet dowodzi, co zapisano, a nie że silnik się nie mylił.

seg-91639deac47d = Nie dowodzi, że dziennik jest autentyczny ani kompletny. Skrót pełnego dziennika wiąże zapis z jednym plikiem; skąd ten plik pochodzi, musi ustalić operator.

seg-0f721c314fa1 = Nie niesie żadnego twierdzenia o skuteczności wykrywania ani odrzucania zakłóceń.

seg-9c361736bf27 = Jest zapisem technicznym, a nie opinią prawną ani certyfikacją.

seg-68bcf43b4e27 = <s1>Poprzednia</s1>Pokrycie linii

seg-09c0b5fa6e52 = <s1>Następna</s1>Łącza optyczne przez atmosferę
