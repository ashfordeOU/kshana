# docs--validation: translations (pl)

seg-70860389903a = Zegar

seg-583dc9ff6178 = Biblioteka

seg-d01db1c2710a = Źródła

seg-619f89bf160c = Realizacja księżycowego układu odniesienia

seg-2db69c58f694 = Księżycowy różnicowy PNT

seg-2eb6d1b0483d = RAIM / ARAIM

seg-da3532b1444d = SBAS / DO-229E

seg-d3af26f389f5 = IONEX / Klobuchar

seg-d6476863f862 = Możliwość

seg-ad856ad710eb = Status

seg-d12d4565b01d = Księżycowa geodezyjna VLBI, ścieżka jądrowa

seg-5ed34a5b402e = Księżycowe wspólne OD wielotechnikowe + zegar

seg-4bcec6e2dd9f = Objętość usługi nawigacji księżycowej

seg-c04a3591074c = Eksport interoperacyjności księżycowej

seg-20fee61b3107 = Biblioteka modeli błędów urządzeń kwantowych

seg-eaf341ff4522 = Nawigacja kwantowa bez GNSS

seg-75636f9419b2 = Znane ograniczenia

seg-9c0eb89a2fbe = Pakiet

seg-f63dd3d7aad4 = Źródło

seg-638b8d451550 = Czujnik

seg-04f69a0edb2f = typ

seg-b03d56f501c3 = Rodzaj

seg-35bf9a48e566 = Wielkość

seg-f3526b0d95f8 = Zmierzono

seg-7634c6f4b32c = Łącze

seg-b966dd26caa6 = Zbiór danych

seg-4fe4920a3fa1 = Standard

seg-84430d202cd4 = Źródło: <c1/>

seg-028f26d1374e = <b>O tolerancjach.</b> „Sprawdzone względem niezależnego wzorca” poniżej oznacza, że test kalibracyjny stwierdza, iż symulowana statystyka zgadza się z relacją wzorcową w granicach <b>wymuszanej bramki</b>, obecnie <b>błędu względnego { "20" }–{ "25" }%</b> (uśrednionego po ziarnach) dla relacji Allana i budżetu szumów. Mediana zaobserwowanej zgodności jest często znacznie ciaśniejsza (kilka procent), ale <em>gwarantowaną</em> granicą jest bramka, a nie mediana. Tam, gdzie pojawia się wartość taka jak „~{ "2" }%”, jest to typowa obserwacja, a nie wymuszana tolerancja. Zob. <a1>Twierdzenia a rzeczywistość</a1>.

seg-94a480ed9ccb = Reguła awansu

seg-a550784412a6 = Wiersz sprawdzanej maszynowo macierzy weryfikacji (<c1/>) jest VALIDATED tylko wtedy, gdy wyrocznia <b>niezależna od Kshana</b> zgadza się z implementacją <b>w granicach tolerancji podanej przed wykonaniem porównania</b>, w teście uruchamianym w bramce. Ta sekcja jest jedynym miejscem, w którym reguła jest zapisana; macierz, opisy poszczególnych wierszy i uwagi do wydań odsyłają do niej.

seg-5e14faed9f05 = Akceptowane rodzaje wyroczni

seg-4297b6a1b385 = Co się liczy

seg-a42c0c36b37f = Przykłady już obecne w macierzy

seg-e39aeb132e03 = Rzeczywiste zmierzone dane wielkości, której dotyczy wiersz: obserwacja świata fizycznego, a nie wynik modelu.

seg-e77977db9de1 = Zatrzymane dwie trzecie rzeczywistego zapisu zegara cezowego; zarchiwizowane normalne punkty księżycowego pomiaru laserowego; seria BIPM (Międzynarodowe Biuro Miar) Circular T UTC(k); kafel terenu SRTM (Shuttle Radar Topography Mission).

seg-6325fe1fafaf = Niezależna biblioteka lub narzędzie innej firmy obliczające <b>jednoznacznie zdefiniowaną</b> wielkość na tych samych danych wejściowych, gdzie biblioteka sama implementuje obliczenie z danej dziedziny. Zgodność biblioteki z biblioteką jest prawdziwą kontrolą tylko dlatego, że wielkość ma jedną poprawną odpowiedź.

seg-a9cd35495601 = allantools, Orekit, ANISE, RTKLIB, gnss_lib_py, lamberthub, pymcdm, scikit-learn, rozkłady statystyczne SciPy.

seg-056adffae706 = Opublikowane wektory wzorcowe, tabele lub przykłady weryfikacyjne: liczby, które norma, agencja lub tekst wzorcowy drukuje po to, aby można było sprawdzić implementacje.

seg-991fb822e99c = Wektory SOFA/ERFA (Standards of Fundamental Astronomy), wektory weryfikacyjne SGP4 AIAA (American Institute of Aeronautics and Astronautics), przykłady walidacyjne ITU-R (International Telecommunication Union, Radiocommunication Sector), przykład rozwiązany ARAIM Grupy Roboczej C, JPL (Jet Propulsion Laboratory) Horizons.

seg-2a774e48055a = Dwa dalsze standardy rozstrzygają przypadki graniczne. Oba przyjęto dla wydania { "0.30" }.

seg-f5c6cf536ba1 = <b>P1, opublikowana wartość rozwiązana.</b> Opublikowana wartość rozwiązana, obliczona z tej samej postaci zamkniętej, którą implementuje wiersz, liczy się jako opublikowany wektor wzorcowy, gdy publikacja jest niezależna od Kshana, a porównanie przypina podaną tolerancję. Wartość musi być wydrukowana w publikacji jako liczba (wartość odczytana z wykresu liczy się tylko wtedy, gdy niepewność odczytu mieści się w podanej tolerancji), a test musi sprawić, by Kshana obliczyła ją z danych wejściowych publikacji; porównanie stałej z dokumentem, z którego ją skopiowano, jest kontrolą transkrypcji, a nie P1.

seg-0b043b552e76 = <b>P2, niezależna biblioteka numeryczna.</b> Niezależna biblioteka numeryczna, taka jak numpy lub LAPACK (Linear Algebra PACKage), ponownie obliczająca jednoznacznie zdefiniowaną wielkość algebry liniowej na podanych danych wejściowych, liczy się jako niezależna biblioteka. Biblioteka musi wykonać krok rozkładu, odwrócenia, rozwiązania lub najmniejszych kwadratów własnym algorytmem, na danych wejściowych zatwierdzonych wraz z fikstury; sprawdzonym twierdzeniem jest wtedy algebra liniowa na tych danych, a nie fizyczne wielkości scenariusza reprezentatywnego. Skrypt, który ponownie oblicza skalarną postać zamkniętą za pomocą arytmetyki numpy, jest naszą własną drugą implementacją, a nie P2.

seg-b7911d589f7a = Warunki obowiązujące dla każdego rodzaju: wyrocznia nie jest napisana, uruchamiana ani publikowana przez ten projekt (seria artykułów tego repozytorium nie jest więc od niego niezależna); tolerancja znajduje się w teście i została ustalona przed pierwszym porównaniem; test zależny od danych, który pomija się, gdy brakuje jego danych publicznych, mówi o tym przy pomijaniu.

seg-7e6057a2cad7 = Co się nie liczy

seg-80cfbb204767 = <b>Nasza własna druga implementacja</b>: druga ścieżka kodu w tym crate (<c1/>) lub skrypt w tym repozytorium, który ponownie oblicza tę samą postać zamkniętą.

seg-d6efaf8399f9 = <b>Zgodność z naszym własnym wcześniejszym wynikiem</b>: wzorce złote, przypięcia regresyjne, migawki lub tabela z własnych artykułów tego projektu.

seg-4d0365b383e5 = <b>Transkrypcja stałych z cytowanego źródła</b>: sprawdzanie współczynnika, ustawienia wstępnego, wartości z karty katalogowej lub arkusza parametrów względem dokumentu, z którego je skopiowano.

seg-3bf8025077fb = <b>Wybór projektowy</b>: alokacja, ważenie, próg, limit alarmowy lub scenariusz reprezentatywny. Dla wyboru nie ma zewnętrznej prawdy.

seg-4f0aafd7166e = <b>Tożsamość wewnętrzna</b>: całka numeryczna względem własnej postaci analitycznej, obieg w obie strony, odwrócenie, test własności lub monotoniczności.

seg-4f4408e4ebab = <b>Przebieg integracyjny z rzeczywistym hostem</b> (<c1/>): załadowanie wtyczki do rzeczywistego serwera Signal K lub OpenCPN albo podanie wyniku rzeczywistej bramki konsumentowi TCP i sprawdzenie, że host przyjmuje dane wejściowe i pokazuje oczekiwany stan. Pokazuje to, że połączenia działają. Host nie jest wyrocznią dla żadnej wartości, którą niesie integracja, więc nie ma niczego zewnętrznego do porównania, a taki wiersz (wiersz integracji morskich) jest MODELLED, a nie VALIDATED. <c2/> jest odrębnym rodzajem wyroczni, dozwolonym tylko w wierszach MODELLED: <c3/> w <c4/> kończy się niepowodzeniem, jeśli wiersz VALIDATED go zawiera, a <c5/> już wymaga, aby każdy wiersz VALIDATED był <c6/>.

seg-a39a87c56a16 = <b>Wiarygodność na rzeczywistych danych wejściowych</b>: rzeczywiste dane użyte wyłącznie jako dane wejściowe, z asercjami co do skali, a nie porównaniem z wartością zewnętrzną.

seg-db6f5d98b4ef = Tolerancja dobrana po zobaczeniu porównania.

seg-f4f18b7549df = Jak reguła jest egzekwowana

seg-19a62c7e0aee = Każdy wiersz VALIDATED deklaruje w <c1/> w <c2/>, na jakim rodzaju się opiera (Measured, Library, Reference, P1 lub P2), niezależne źródło (zacytowane z własnego tekstu wyroczni wiersza) oraz jeden test, który niesie porównanie. Testy jednostkowe obok tabeli kończą się niepowodzeniem, gdy wiersz VALIDATED nie jest zadeklarowany lub jest zadeklarowany dwa razy, gdy deklaracja wskazuje wiersz, który nie jest VALIDATED, gdy zadeklarowane źródło nie jest tym, które wskazuje tekst wyroczni wiersza, lub jest samym Kshana, gdy zadeklarowany test nie jest tym, który wiersz cytuje, albo gdy wiersz P2 nie wskazuje żadnej niezależnej biblioteki numerycznej. <c3/> wymaga następnie, aby zadeklarowany test istniał na dysku jako rzeczywisty <c4/>, który nie jest ignorowany. Maszyna nie może sprawdzić, czy wskazany test porównuje z zadeklarowanym źródłem; pozostaje to odczytem przez człowieka. Liczności według rodzaju nie są tu wpisane: źródłem jest tabela.

seg-e8ae3e380f40 = Istniejące wiersze VALIDATED ponownie zbadane według reguły

seg-1dd44545a67a = Regułę zastosowano zarówno do istniejących wierszy, jak i do przyszłych awansów.

seg-38db7b6e7053 = <b>Wiersze P1 wskazane przez badanie walidacyjne { "0.30" }, każdy poparty:</b> Jednokierunkowy bilans łącza (tabela kontroli projektu JPL Pub 82-76 dla pasma X Galileo, złożona ponownie z pozycji składowych do { "4.6e-3" } dB tłumienia w wolnej przestrzeni); Zamknięte postaci z ograniczonym pasmem dla dowolnego sygnału pomiaru odległości ({ "90.3" } procent mocy listka głównego i opublikowany jitter koherentnego detektora early-late); Maksymalny Doppler satelity nawigacyjnego na niskiej orbicie okołoziemskiej (opublikowane wartości Xona Pulsar X1 i Iridium); Maksymalny Doppler widziany przez nieruchomego użytkownika z orbity LEO lub MEO (Tabela { "1" } z artykułu o Pulsar, { "20" } wartości); Doppler, który musi obsłużyć odbiornik naziemny z satelity nawigacyjnego LEO (te same opublikowane wartości z orbity rzeczywiście latanej). Każda publikacja jest niezależna od Kshana, drukuje swoje liczby, a test podaje swoją tolerancję.

seg-8e38103d05d6 = <b>Dalsze wiersze oparte na P1, znalezione w ponownym badaniu, każdy poparty:</b> Kompromis projektowy kodu pomiaru odległości (opublikowana korelacja wzajemna Golda −{ "23.9" } dB); Księżycowy czas współrzędnych (Ashby i Patla { "2024" }, których kontrola prędkości Księżyca względem DE440 jest sprawdzeniem Library); Zamknięte postaci widmowych gęstości mocy sygnału w paśmie L (wartości Q Kaplana i Hegarty'ego); Opóźnienie jonosferyczne pierwszego rzędu na pasmo (stosunek opóźnień grupowych z IS-GPS-200); Globalnie uśrednione wagi błędu zasięgu sygnału w przestrzeni (tabela Montenbrucka, Steigenbergera i Hauschilda { "2018" }).

seg-0014c53752ac = <b>Wiersze P2 wskazane przez badanie, każdy poparty:</b> Informacja Fishera i obserwowalność Cramér–Rao (numpy <c1/>/<c2/>); Identyfikowalność księżycowego datum; Sprzężony wskaźnik układu odniesienia i skali czasu Księżyca; Autonomiczny potok obserwowalności uszkodzeń w sieci swobodnej (numpy/SciPy SVD, rozkład według wartości osobliwych). Każdy ponownie oblicza jednoznacznie zdefiniowaną wielkość algebry liniowej na zatwierdzonych danych wejściowych innym algorytmem niż solver wartości własnych Jacobiego w Kshana.

seg-e9d01633d002 = <b>Dalsze wiersze oparte na P2, znalezione w ponownym badaniu, każdy poparty:</b> Wyprowadzenie priorytetów MCDA (multi-criteria decision analysis, wielokryterialna analiza decyzyjna) (wektor własny AHP, analytic hierarchy process, obliczony przez SciPy/LAPACK; tabela Random Index, którą także odtwarza, jest transkrypcją i nie jest liczona); Wariancja dryfu holdover zegara (SciPy <c1/> rozszerzonej macierzy Van Loana); Realizacja księżycowego układu odniesienia (rozwiązanie Umeyamy przez numpy SVD); Kształtowanie wiązki CRPA (controlled reception pattern antenna) (zespolone rozwiązanie LAPACK); Jądro poziomu ochrony księżycowego ARAIM (odwrotność LU z RTKLIB z kwantylami SciPy); Spójność księżycowego układu odniesienia i dynamiki między dostawcami (dopasowanie najmniejszych kwadratów przez numpy SVD trzech opublikowanych efemeryd).

seg-1fd94e94e89d = <b>Oflagowane w pierwszym przejściu, ponownie oparte w rundzie { "2" } przebiegu { "0.30" }.</b> Trzy wiersze oflagowano jako niepoparte zapisaną regułą. Każdy opiera się teraz na porównaniu zarejestrowanym z góry przed pobraniem jego fikstury, więc żaden wiersz nie jest oflagowany; test jednostkowy obok <c1/> przypina (teraz pustą) listę.

seg-3ef9479dea55 = <b>Integralność (RAIM/ARAIM/SBAS).</b> Cytowane testy dawniej stwierdzały jedynie wiarygodność na rzeczywistej geometrii IGS (International GNSS Service). Wiersz opiera się teraz na trzech wyroczniach bibliotecznych: wielohipotezowym rozdzieleniu rozwiązań ARAIM z Airborne Design Document v4.2 względem Stanford MAAST dla ARAIM { "2" } ({ "270" } rzeczywistych przypadków, najgorsza różnica VPL { "2.2e-3" } m wobec { "0.05" } m); detekcji i wykluczania snapshot RAIM względem RTKLIB <c1/> ({ "2016" } z { "2016" } identycznych decyzji) z poziomem ochrony nachylenia; oraz poziomach ochrony SBAS L1 według DO-229E względem Stanford MAAST na rzeczywistych transmisjach WAAS ({ "2868" } par w granicach { "1.6e-5" } m). Wiersz mówi wprost, że funkcje z jednolitym sigma <c2/> i <c3/> nie są zgodne z ADD, a porównanie dwuczęstotliwościowego SBAS L5 jest ustaleniem.

seg-16a4261c77ec = <b>Pozycje planet w całym Układzie Słonecznym z elementów keplerowskich JPL Standish.</b> Ustalony po fakcie próg dwukrotności błędu nominalnego zastąpiono progiem zarejestrowanym z góry: RMS co najwyżej wartość z Tabeli { "8.10.1" } Explanatory Supplement na planetę i składową, względem JPL Horizons DE441, z uwzględnieniem podziału Ziemi i obrotu ICRF.

seg-8d5b51a942e0 = <b>Czas światła między ciałami Układu Słonecznego.</b> Solver czasu światła jest teraz porównywany z czasami światła z Horizons w granicach { "1e-6" } s na pozycjach DE441, czyli z progiem zarejestrowanym z góry, który nie dziedziczy progu pozycji.

seg-e96900bc322f = <b>Wiersze MODELLED, które dwie polityki czynią kwalifikującymi się do awansu</b> (wyłącznie przez wiersz po wierszu przebieg { "0.30" }, nigdy przez ten tekst): w ramach P1 granica geolokalizacji emitera TDOA/FDOA (różnica czasu i częstotliwości przybycia), sprzężenie względnościowego tempa zegara z układem odniesienia, maski synchronizacji ITU-T (Telecommunication Standardization Sector) (tylko dla wartości masek, które Zalecenia drukują jako liczby; przepisane punkty załamania sprawdzane względem siebie się nie liczą) oraz granica pozycjonowania 5G w sieciach nieziemskich (tylko jeśli znajdzie się opublikowaną wartość rozwiązaną); w ramach P2 ślepota integralności w trybie wspólnym, skalarny poziom ochrony czasu MHSS (multiple-hypothesis solution separation) i wybielanie GLS (generalised least squares, uogólniona metoda najmniejszych kwadratów). Dwa wiersze wzorcowe integralności czasu (klasyfikator diagramu integralności Stanforda i oceniacz pokrycia integralności) to klasyfikacja oparta na regułach, a nie algebra liniowa, więc P2 ich nie obejmuje; potrzebują niezależnego narzędzia, a jedyne znalezione (gLAB) ma licencję niekomercyjną.

seg-50a08fe5918b = <b>Spójność z wcześniejszymi odmowami.</b> Kontrola Vallado dla wiersza okna startowego kwalifikowałaby się teraz w ramach P1, jeśli jej test oblicza drukowany przykład rozwiązany; plan { "0.30" } awansuje go zamiast tego przez Orekit. Tabela przecięcia czasu księżycowego według klas zegarów pozostaje MODELLED: tabela, którą odtwarza, pochodzi z własnego artykułu tego projektu, który nie jest niezależny.

seg-02423542480f = Składnik szumu

seg-2bd49b92f14b = Zgodność estymatorów Allana (ADEV/MDEV/TDEV/OHDEV (ADEV: odchylenie Allana; MDEV: zmodyfikowane odchylenie Allana; OHDEV: nakładające się odchylenie Hadamarda))

seg-c429a25d17ae = Dwie kontrole względem źródeł pierwotnych <b>NIST (National Institute of Standards and Technology) SP (Special Publication) { "1065" }</b> (Riley, <em>Handbook of Frequency Stability Analysis</em>, { "2008" }), obie z tolerancją względną <b>{ "1e-4" }</b>. ({ "1" }) <c1/>: nakładające się ADEV, zmodyfikowane ADEV, odchylenie czasu i nakładające się estymatory Hadamarda odtwarzają odchylenia dla kanonicznego 10-punktowego zbioru danych <b>NBS14</b> (<b>SP { "1065" } Tabela 29/30, s. { "107" }</b>) przy tau = { "1" }, { "2" } — zgodność wynosi w rzeczywistości ~{ "1e-6" } (np. nakładające się ADEV (OADEV) przy τ = { "2" }: { "85.952868" } wobec { "85.95287" }). ({ "2" }) <c2/>: te same cztery estymatory odtwarzają <b>1000-punktowy zbiór danych SP { "1065" } §{ "12.4" }</b> (<b>Tabela { "31" }, s. { "108" }</b>) przy współczynnikach uśredniania { "1" } / { "10" } / { "100" }, gdzie zbiór danych jest odtwarzany w kodzie z LCG z SP { "1065" } (równ. { "73" }) — hermetycznie, bez fikstury. Te same dane i liczby z Tabeli 31 są celem regresji w aewallin/allantools (<c3/>), odtworzonym tutaj bez kodu stron trzecich. To przypina <em>matematykę estymatora</em> względem wzorca, odrębnie od wierszy <em>kalibracji</em> szumu poniżej.

seg-79e6f7d1e7f0 = Zgodność estymatorów Allana na <b>rzeczywistym zmierzonym sprzęcie</b>

seg-8c72a9df2547 = <c1/>: nakładające się estymatory Allana i Hadamarda odtwarzają wzorcowe odchylenia <b>Stable32</b> dla <b>rzeczywistego pierwotnego wzorca cezowego 5071A zmierzonego względem masera wodorowego</b> ({ "556 990" } próbek fazy przy τ₀ = { "1" } s; { "1" } PPS (impuls na sekundę) do licznika 53230A, luty { "2014" }; zebrane przez A. Wallina, dystrybuowane z <c2/>). Sprawdzone na <b>całej dekadowej drabince τ ({ "16" } współczynników uśredniania, τ = { "1" } s … { "4" }×10⁴ s)</b>: dobrze próbkowane współczynniki z bramką względną <b>{ "1e-3" }</b> (zaobserwowana zgodność wynosi w rzeczywistości ≤ { "3e-5" }, np. OADEV({ "1" } s) { "3.317111e-10" } wobec Stable32 { "3.3171e-10" }), rzadkie współczynniki długiego τ muszą zmieścić się w drukowanym przez Stable32 paśmie ufności { "1" }‑σ. To uzupełnia syntetyczną zgodność NBS14 powyżej kontrolą na zmierzonym zegarze. Surowy plik fazy to dane stron trzecich bez licencji na redystrybucję, więc jest ignorowany przez git; <c3/> go odtwarza, a test wypisuje komunikat o pominięciu (CI (ciągła integracja) pozostaje zielone), gdy go brak. Zatwierdzone są tylko publiczne liczby wzorcowe Stable32 (<c4/>); nie używa się kodu stron trzecich.

seg-1a7f0e741913 = Zgodność estymatorów Allana na <b>kanonicznym Stable32 PHASE.DAT</b>

seg-00e382874a00 = <c1/>: nakładające się estymatory Allana, zmodyfikowany Allana i odchylenia czasu odtwarzają wzorcowe odchylenia <b>Stable32</b> dla <b>PHASE.DAT</b> — 1001-punktowego szeregu dystrybuowanego ze Stable32, którego niezależne narzędzia (np. <c2/>) używają jako standardowego celu regresji — na <b>pełnej drabince współczynników uśredniania ({ "139" } współczynników)</b> z bramką względną <b>{ "1e-3" }</b> (zaobserwowano ≤ { "5e-5" }). Drugi, niezależny rzeczywisty szereg wzorcowy obok kontroli zmierzonego cezu powyżej. PHASE.DAT jest dostarczany z komercyjnym narzędziem Stable32, więc surowy szereg jest ignorowany przez git; <c3/> go odtwarza, a test jest pomijany na zielono (CI pozostaje zielone), gdy go brak. Zatwierdzone są tylko publiczne liczby wzorcowe Stable32 (<c4/>); nie używa się kodu stron trzecich.

seg-9dde9e0c8055 = Stabilność zegara optycznego na <b>rzeczywistej zmierzonej krzywej</b>

seg-ea908ba3a79f = <c1/>: inwersja parametrów szumu zegara (<c2/>) odtwarza <b>opublikowane σ_y(τ) optycznego zegara sieciowego ⁸⁸Sr według Norcia i in., <em>Science</em> { "366" }:{ "93" } ({ "2019" })</b> (Zenodo 10.5281/zenodo.3382347, <b>CC-BY-4.0</b> (Creative Commons Attribution { "4.0" }), krzywa dołączona w <c3/>): odzyskany współczynnik szumu białego częstotliwości √q_wf ≈ { "4.33e-16" } odpowiada krótkoterminowej stabilności z artykułu ≈4.7e-16/√τ (~{ "10" }% RMS (root mean square) na krzywej), a dopasowanie wykrywa niezerowy zmierzony próg szumów (q_rw > { "0" }). To przypina <b>inwersję zmierzonego ADEV → parametry szumu względem rzeczywistego zegara optycznego</b>; korzyść z holdover do progu zbudowana na tym pozostaje MODELLED.

seg-e1e930dcd0a1 = ROC (receiver operating characteristic) AUC (pole pod krzywą) detekcji anomalii na <b>rzeczywistej telemetrii ESA (European Space Agency) OPS-SAT</b>

seg-2b637daa985c = <c1/> (odtwarza etykiety)

seg-c667434b580d = <c1/>: na zbiorze danych <b>OPSSAT-AD</b> (Ruszczak i in. { "2025" }, Zenodo 10.5281/zenodo.12588359, <b>CC BY { "4.0" }</b>) — rzeczywistych segmentach telemetrii pokładowej OPS-SAT z etykietami anomalii zgodnymi z prawdą podstawową — AUC ROC Manna–Whitneya w Kshana (<c2/>) odtwarza <b>scikit-learn <c3/></b> z dokładnością do <b>< { "1e-9" }</b> na zatrzymanym podziale testowym ({ "529" } segmentów, { "113" } anomalii), dla dwóch deterministycznych ocen: przejrzystego detektora jednocechowego (liczba pików segmentu, <b>AUC ≈ { "0.851" }</b>) i 8-cechowej diagonalnej oceny Mahalanobisa dopasowanej na normalnych segmentach treningowych (AUC ≈ { "0.556" }); <c4/> obejmuje oszacowanie punktowe przedziałem, którego dolna granica leży powyżej poziomu przypadku. To sprawdza <b>obliczanie AUC na rzeczywistych danych ESA</b> i <b>etykietowane rozdzielenie</b> przejrzystego detektora — <b>nie</b> odtwarza najlepszej opublikowanej metryki z artykułu OPSSAT-AD (nadzorowana FCNN (fully connected neural network, w pełni połączona sieć neuronowa), F1 ≈ { "0.95" }), która wymaga ich wytrenowanego modelu. Dane CC-BY dołączone (<c5/>, hermetycznie); wyrocznia odtwarzana przez <c6/>.

seg-5f2d41617fb2 = Synteza funkcjonałów pola grawitacyjnego (mapa nawigacyjna wspomagana grawitacją / bez GNSS (GNSS: globalny system nawigacji satelitarnej))

seg-4c1126137428 = <c1/>: jądro funkcjonału grawitacyjnego w harmonikach sferycznych (<c2/> / <c3/>) — „czytnik mapy”, z którym dopasowuje się nawigator wspomagany grawitacją — jest sprawdzone względem <b>standardu grawitacji normalnej GRS80 (Geodetic Reference System { "1980" })</b> (Moritz { "1980" }, przyjętego przez IAG (International Association of Geodesy)). Zbudowanie normalnego pola GRS80 z jego opublikowanych parzystych harmonik zonalnych J₂…J₈ i synteza grawitacji (grawitacja + siła odśrodkowa) na elipsoidzie odtwarza zamkniętą postać grawitacji normalnej <b>Somigliany</b> oraz opublikowane wartości równikowe/biegunowe γ_e = { "9.7803267715" } / γ_p = { "9.8321863685" } m/s² z dokładnością względną <b>{ "3.5e-12" }</b> na wszystkich szerokościach (bramka { "1e-9" }). To samo jądro wczytuje flagowy <b>rzeczywisty model Ziemi ICGEM (International Centre for Global Earth Models) EGM2008 (Earth Gravitational Model { "2008" })</b> (NGA (National Geospatial-Intelligence Agency), domena publiczna przez ICGEM; czytnik <c4/> jest też wykorzystany na księżycowym polu GRAIL (Gravity Recovery and Interior Laboratory) w <c5/>) i tworzy fizycznie ograniczoną mapę zaburzeń grawitacji (RMS ≈ { "26" } mGal, maks. ≈ { "89" } mGal przy d/o { "70" }). Sprawdza <b>poprawność kodu syntezy</b>; <em>dokładność poprawki nawigacyjnej</em> wspomaganej grawitacją pozostaje MODELLED (brak publicznej trajektorii grawimetru na platformie z prawdą podstawową).

seg-7dc3ff4c6eea = Efektywne stopnie swobody (edf) zależne od typu szumu (przedziały ufności)

seg-7e8a93fb2eea = <c1/>: pasmo ufności χ² na każdym punkcie nakładającego się ADEV używa efektywnych stopni swobody zależnych od typu szumu (zamknięte postaci z Tabeli { "5" } NIST SP { "1065" } dla białej i migotliwej modulacji fazy, białej i migotliwej modulacji częstotliwości oraz modulacji częstotliwości błądzeniem losowym (WPM/FPM/WFM/FFM/RWFM) — prosty zestaw Stable32), z typem potęgowym zapisu rozpoznanym z nachylenia log-log jego MDEV. Trzy niezależne kontrole: (a) pięć wzorów odtwarza ręcznie obliczone wartości przy N={ "64" }, m={ "4" } z dokładnością { "1e-12" }; (b) <b>zespół Monte Carlo białej FM (FM: modulacja częstotliwości)</b> ({ "4 000" } zapisów) mierzy rzeczywiste edf chi-kwadrat estymatora = { "2" }·mean²/Var(σ²) i zgadza się ze wzorem w granicach { "20" }% (i wyraźnie przewyższa zachowawczą liczbę nienakładającą się); (c) <c2/> odtwarza drukowane <b>SP { "1065" } Tabela { "32" } (s. { "109" })</b> edf = { "146.177" } dla 1000-punktowego zbioru danych przy m={ "10" } (biała FM) z dokładnością { "5e-3" } oraz { "95" }% granice ufności tabeli ({ "8.223942e-2" } / { "1.035201e-1" }) z dokładnością <{ "0.2" }% (mała reszta to przybliżenie χ² Wilsona–Hilferty'ego względem dokładnego χ² NIST). Eksportowana krzywa ADEV niesie rozpoznany typ szumu, edf i { "95" }% pasmo na każde τ.

seg-7048ac695b99 = Biała FM (krótkoterminowa)

seg-b6982cb2ca25 = <c1/>: symulowane nakładające się ADEV odtwarza opublikowane sigma_y({ "1" } s) — zwykle w granicach kilku procent, <b>wymuszana bramka { "20" }%</b> (CSAC i cel zegara sieci optycznej) — oraz krzywą białej FM sigma_y(tau)=sigma_y(1s)/sqrt(tau) dla tau = { "1" }, { "10" }, { "100" } s w granicach <b>bramki { "25" }%</b> (zgodnie z kartą katalogową CSAC (chip-scale atomic clock) { "3e-10" } / { "1e-10" } / { "3e-11" }).

seg-11fc7c4b61ff = FM błądzenia losowego (długoterminowa)

seg-1e211f342e79 = <c1/>: symulowane ADEV zgadza się z sigma_y^{ "2" }(tau)=q_rw*tau/3 (Riley NIST SP { "1065" }) z dokładnością ~{ "20" }% (uśrednione po ziarnach).

seg-dcfca4041429 = Starzenie / dryf liniowy

seg-2d5c6a44cbdb = <c1/> + skompensowane

seg-492f91ba2f79 = Deterministyczne; estymator holdover usuwa offset i starzenie predyktorem kwadratowym, więc reszta jest granicą stochastyczną. Testowane w <c1/> / <c2/>.

seg-2ea6a14cac1c = Estymator Kalmana + granica integralności

seg-8c8f8a5eba5a = <c1/>: dwustanowy (faza, częstotliwość) filtr, którego dokładny szum procesu van Loana odpowiada modelowi prawdy; dryf bez korekt odtwarza analityczną wariancję holdover <c2/> z dokładnością { "1e-9" }. Aktualizacja kowariancji ma <b>postać stabilizowaną Josepha</b> <c3/>, która pozostaje dodatnio półokreślona (sprawdzone Choleskim) przez { "500" } kroków predykcji/aktualizacji przy skrajnym stosunku <c4/> i zgadza się z postacią naiwną z dokładnością { "1e-9" } tam, gdzie ta jest dobrze uwarunkowana. Warstwa przebiegu podaje Integralność jako ułamek próbek przerwy w granicach 3-sigma granicy ochrony (<c5/>).

seg-f332f06e80f9 = Samospójność filtra (NIS (znormalizowany kwadrat innowacji) / NEES (znormalizowany kwadrat błędu estymacji))

seg-333e1701b6d0 = <c1/> (model)

seg-c1304de95180 = <c1/>: ocena spójności metodą Monte Carlo (Bar-Shalom §{ "5.4" }). Zbiorcze <b>NIS → { "1" }</b> i <b>NEES → { "2" }</b> dopasowanego filtra mieszczą się w ich pasmach χ² { "95" }% (pasmo NIS używa zbiorczej liczby białych innowacji; pasmo NEES używa liczby niezależnych przebiegów, ponieważ błędy estymacji są skorelowane w czasie). Test <b>przeglądu niedopasowania Q/R</b> sprawdza, że monitor zgłasza <c2/> tylko przy strojeniu jednostkowym, a <c3/> przy rozstrojeniu ×0.1/×0.5/×2/×{ "10" }, przy czym NIS skaluje się jak ≈1/q_factor zgodnie z wyprowadzeniem. Udostępnione jako <c4/> w JSON wyniku zegara (JavaScript Object Notation) i karcie w piaskownicy. Pasma χ² używają kwantyla Wilsona–Hilferty'ego (<c5/>, sprawdzonego względem tabeli).

seg-078c4009b24f = Model dwukierunkowego transferu czasu

seg-22f8cdeda335 = <c1/>: wzajemne opóźnienie wspólne znosi się dokładnie w estymacie <c2/> (wyprowadzone ręcznie, dokładnie), a dwa pomiary jednokierunkowe uśredniają się do <c3/> (uśrednione po ziarnach); niewzajemne opóźnienie różnicowe jest barwnym procesem biała FM + FM błądzenia losowego, którego odchylenie Allana podąża za <c4/> (uśrednione po ziarnach, ~{ "20" }%, przez własne <c5/> łącza). <em>Parametry</em> (<c6/>, <c7/> na łącze) to reprezentatywne wartości TWSTFT/optyczne (TWSTFT: dwukierunkowy transfer czasu i częstotliwości przez satelitę), niedopasowane do konkretnego terminala.

seg-6ab219622143 = Bezpieczeństwo (ocena detekcji spoofingu)

seg-29dd10011ed1 = <c1/>: próg 1-sigma monitora <c2/> oraz wynikający z niego <c3/>-sigma minimalny wykrywalny offset i ocena <c4/> są wyprowadzone ręcznie i testowane jednostkowo. Model (detekcja wspomagana zegarem w stylu innowacji / RAIM (RAIM: autonomiczne monitorowanie integralności przez odbiornik)) jest poprawny; <em>parametry</em> (okno monitorowania <c5/>, mnożnik detekcji <c6/>, szum pomiaru <c7/>) są reprezentatywne, niedopasowane do konkretnego odbiornika.

seg-ca51e4f1e19c = Detekcja ataku spoofingowego

seg-e991f5b2fdb2 = <c1/>: narastający fałszywy spoofing czasu jest flagowany, gdy jego offset przekracza granicę detekcji zegara; czas detekcji zgadza się z ręcznie wyprowadzonym <c2/> z dokładnością do jednego kroku siatki, a zegar, którego granica przekracza specyfikację, pozwala spoofingowi osiągnąć próg niewykryty. To samo zastrzeżenie <c3/> co dla oceny Bezpieczeństwa.

seg-3d2f6d2b7722 = Migotliwa FM (próg szumów)

seg-55697d598918 = <c1/> (domyślnie wyłączone)

seg-55000870c060 = Syntezowane jako suma logarytmicznie rozmieszczonych procesów Ornsteina-Uhlenbecka (OU) skalibrowanych do konfigurowalnego płaskiego progu ADEV; <c1/> sprawdza, że próg jest płaski względem czasu uśredniania i leży na skonfigurowanym poziomie (uśrednione po ziarnach). Włączane dla każdego zegara przez <c2/>. Cytowane scenariusze wzorcowe pozostawiają je wyłączone: CSAC jest zdominowany przez białą FM w całym zakresie swojej karty katalogowej (1-1000 s), a systematyczny próg zegara optycznego (~{ "5e-17" }) jest reprezentowany przez jego wartość dokładności.

seg-e2e3de9a61a4 = Statystyki zespołu Monte Carlo

seg-9785d05ec5a7 = <c1/> (agregacja)

seg-cc6c6bb5eb83 = <c1/>: percentyle najbliższej rangi i średnia z <c2/> odtwarzalnych realizacji; pojedynczy przebieg zwija rozrzut, pasmo na krok czasu jest uporządkowane <c3/>, a ponowne przebiegi są identyczne co do bitu. To agregacja statystyczna na już sprawdzonym pojedynczym przebiegu, a nie nowy model fizyczny.

seg-72a9d5de61f5 = sigma_y({ "1" } s)

seg-ebbe708d9cbc = csac-sa45s (CSAC)

seg-c43fe67d4200 = Karta katalogowa Microchip SA65 / SA.45s

seg-e3bde4355d78 = optical-sr-lattice (sieć Sr)

seg-87793f684233 = optyczny zegar sieciowy ze strontem, cel zorientowany na przestrzeń kosmiczną, arXiv:{ "1503.08457" }

seg-b03f5856d451 = Status: biała FM i FM błądzenia losowego sprawdzone względem niezależnego wzorca; starzenie obliczone z modelu i skompensowane; migotliwa FM obliczona z modelu i sprawdzona względem niezależnego wzorca (w cytowanych scenariuszach domyślnie wyłączona).

seg-c5ff448dcb88 = Dojrzałość: wartości zegara optycznego to <em>cel zorientowany na przestrzeń kosmiczną</em> na sprzęcie naziemnym -- żaden optyczny zegar strontowy nie poleciał w kosmos. Laboratoryjne zegary Sr osiągają { "4.8e-17" } (Oelker i in. { "2019" }, Nature Photonics). Wartości CSAC pochodzą z wdrożonego komercyjnego podzespołu.

seg-b59a4b8e6d88 = Relacje: Riley, NIST SP { "1065" }, równ. { "67" } -- biała FM sigma_y^{ "2" }(tau)=h0/({ "2" } tau); FM błądzenia losowego sigma_y^{ "2" }(tau)=({ "2" } pi^2/3) h_-2 tau, równoważnie q_rw*tau/3 dla procesu Wienera częstotliwości o dyfuzji q_rw.

seg-dca7ee671d91 = Pakiet { "2" } — nawigacja zliczeniowa inercjalna (kwantowa jednostka inercjalna)

seg-98452a081241 = Stały/resztkowy bias -> pozycja

seg-6aa386251acf = błąd pozycji = rodzina { "0.5" }<em>b</em>T^{ "2" } (Groves AESS (Aerospace and Electronic Systems Society) Tutorial); ręcznie wyprowadzony test dyskretny w <c1/>.

seg-c60c0b54c485 = Błądzenie losowe prędkości (biały szum przyspieszenia)

seg-7ce1f40566cf = <c1/>: symulowane odchylenie standardowe (SD) błędu pozycji zgadza się z sigma_x(T)=sqrt(S_a*T^3/3) (Groves równ. 54) z dokładnością ~{ "12" }% zaobserwowanego (uśrednione po ziarnach; wymuszana bramka { "20" }%).

seg-8ac776795d40 = Fizyka akcelerometru z interferometrem zimnych atomów (CAI) (z pierwszych zasad)

seg-4eafc81873ed = <c1/>: trójimpulsowy interferometr zimnych atomów Macha-Zehndera. Ręcznie zweryfikowany względem geometrii podręcznikowej — Rb-87 <c2/>; <c3/> przy { "1" } g, <c4/>; szum projekcji <c5/> przy <c6/>, <c7/>; na strzał <c8/>; prawa skalowania <c9/> i <c10/>; wykładniczy zanik kontrastu. <c11/> <b>wyprowadza</b> białą PSD (power spectral density, widmową gęstość mocy) przyspieszenia, którą pobiera klasyczny <c12/>. Uczciwy zakres: tylko <b>próg szumu projekcji kwantowej</b> (tutaj ~{ "0.09" } ug/sqrtHz) — znacznie poniżej rzeczywistych urządzeń ograniczonych wibracjami (1-50 ug/sqrtHz); tensor wibracji, siła Coriolisa i systematyki przesunięcia świetlnego nie są jeszcze modelowane (zob. <a1><c13/></a1>).

seg-ed78f40a8d80 = Bias żyroskopu + kątowe błądzenie losowe (ARW) -> przechył -> sprzężenie z grawitacją

seg-a73e97ac4a0e = Resztkowy bias żyroskopu i ARW napędzają błąd orientacji; przechył sprzęga grawitację (<c1/>) z poziomym błędem siły właściwej. <c2/> sprawdza dokładnie sześcienny wzrost pozycji od samego biasu oraz wzrost orientacji z ARW jako proces Wienera (uśrednione po ziarnach). Włączane dla każdego czujnika przez <c3/> i <c4/>; wyłączone w cytowanych scenariuszach z samym akcelerometrem.

seg-e68d093e952a = Niestabilność biasu (próg szumu migotania 1/f)

seg-5ad1e7d55d07 = <c1/>: proces migotania 1/f (ta sama synteza OU sprawdzona dla zegara), którego płaski próg odchylenia Allana leży na współczynniku niestabilności biasu; zero jest brakiem działania, niezerowy próg zmienia trajektorię, oba przypadki są odtwarzalne. Włączane dla każdego czujnika przez <c2/>.

seg-b631c1bfce05 = Błądzenie losowe przyspieszenia (błądzenie losowe tempa)

seg-4a4a70363412 = <c1/>: bias jest procesem Wienera z <c2/>, sprawdzonym po uśrednieniu po ziarnach z dokładnością ~{ "20" }%. Włączane dla każdego czujnika przez <c3/>.

seg-49c4a2532dca = Walidacja krzyżowa NaveGo (współczynniki szumu IMU (jednostka inercjalna))

seg-e558aa705560 = <c1/>: zewnętrzna kontrola krzyżowa względem <b>NaveGo</b> (R. Gonzalez, otwartoźródłowy zestaw narzędzi INS/GNSS (INS: system nawigacji inercjalnej), <c2/>). Odtwarza syntetyczny obieg w obie strony z <c3/> NaveGo na jego <b>opublikowanym profilu wzorcowym Microstrain 3DM-GX3-35</b>: zasilenie naszego (sprawdzonego względem NBS14/Stable32) estymatora nakładającego się ADEV białym szumem czujnika na poziomach 1-σ NaveGo odzyskuje współczynniki błądzenia losowego prędkości i kąta (VRW, ARW) (<c4/>) z dokładnością <c5/> (rzeczywiście ~{ "0.4" }%), z gałęzią szumu białego na nachyleniu −1/2. Potwierdza, że nasz potok Allana i definicje VRW/ARW w NaveGo są zgodne. Zarejestrowany log STIM300 <c6/> o rozmiarze { "40" } MB nie jest wczytywany (ogranicza go format binarny).

seg-171b215f0526 = Współczynnik skali, drobniejsze człony osi poprzecznych

seg-b690ed87f493 = <c1/> w tym pakiecie 1-DOF (jeden stopień swobody)

seg-c1bd4e24c091 = Starszy pakiet jednoosiowy nie ma błędu współczynnika skali ani sprzężenia poprzecznego. Trójosiowa biblioteka strapdown i pakiet <c1/> modelują współczynnik skali, niewspółosiowość, czułość na g, kwantyzację i narastanie prędkości (<c2/>; zob. tabelę twierdzeń poniżej).

seg-ce2b3237acfe = stabilność biasu

seg-129dc6af8f10 = pierwiastek z PSD szumu

seg-7109e60b8c9b = cold-atom-quat (kwantowy)

seg-5f5690d74918 = { "5.88e-7" } m/s^{ "2" } ({ "60" } ng, { "24" } h)

seg-8e83c799fb03 = { "22" } ug/sqrtHz = { "2.16e-4" } (m/s^{ "2" })/sqrtHz

seg-b52686064c43 = Templier i in. { "2022" }, Science Advances (arXiv:{ "2209.13209" })

seg-09b42bed82c9 = nav-grade-quartz (klasyczny)

seg-fa9adbe58c2f = { "1.57e-3" } m/s^{ "2" } (~{ "160" } ug)

seg-63f64f576abc = ~{ "20" } ug/sqrtHz = { "1.96e-4" } (m/s^{ "2" })/sqrtHz

seg-8714c547449a = Honeywell QA-2000 / Groves AESS Tutorial

seg-79fc524162b5 = Uczciwe ujęcie: przewaga zimnych atomów to <b>długoterminowa stabilność biasu</b> (~2600x niższa), która dominuje w długiej przerwie w GNSS przez { "0.5" }<em>b</em>T^{ "2" }. Szum krótkoterminowy jest porównywalny (kwantowy ~{ "22" } wobec klasycznego ~{ "20" } ug/sqrtHz) — czujnik kwantowy wygrywa maraton, a nie sprint. Dojrzałość: akcelerometry zimnoatomowe są laboratoryjne/wczesne (JRC122785), kwarcowe klasy nawigacyjnej są wdrożone.

seg-e02e93f4f30a = Pakiet { "3" } — transfer czasu (optyczny a radiowy (RF), optyczne łącze międzysatelitarne)

seg-2b87e5f0ba7e = Biały jitter czasu -> precyzja synchronizacji

seg-229295aa1f70 = <c1/>: symulowane RMS synchronizacji odtwarza jitter łącza sigma_j; średnia z próbek uśrednia się jak sigma/sqrt(N) z dokładnością <{ "20" }% (uśrednione po ziarnach).

seg-4325ec478bca = Synchronizacja czasu -> pomiar odległości jednokierunkowy

seg-aa7a1f463683 = odległość = c * dt, c={ "299792458" } m/s; { "1" } ps = { "0.299792458" } mm (dokładnie, test wyprowadzony ręcznie).

seg-7ad8bb95bf35 = Próg migotania/TDEV, reszta wzajemności dwukierunkowej

seg-5bf72778b6c2 = <c1/> (rodzaj <c2/>): szum fazy migotania (Kasdin–Walter, płaskie TDEV), dobowa niewzajemność i stała reszta wzajemności w szeregu dwukierunkowym; pakiet <c3/> z białym jitterem pozostaje niezmieniony.

seg-dae3fa0375fe = jitter pojedynczej próbki

seg-4a141a45a8ff = źródło

seg-ee136a1d0051 = { "1" } ps ({ "1e-12" } s)

seg-c78abd60ec97 = cel wiarygodny na orbicie

seg-9dfc1d4334a3 = optyczne łącze międzysatelitarne, cel synchronizacji w pikosekundach; laboratoryjne O-TWTFT (TWTFT: dwukierunkowy transfer czasu i częstotliwości) ~{ "1" } fs (Giorgetta { "2013" } / Deschenes { "2016" })

seg-4f3d23d83190 = { "0.5" } ns ({ "5e-10" } s)

seg-0e730e8e2237 = zmierzone w jednej sesji

seg-b9faad47d802 = BIPM/PTB/NIST (BIPM: Międzynarodowe Biuro Miar; PTB: Physikalisch-Technische Bundesanstalt, niemiecki państwowy instytut metrologii) TWSTFT

seg-51e2e5782c96 = Uczciwe ujęcie: wartość optyczna jest celem synchronizacji na orbicie na poziomie pikosekund (niepoleciała w kosmos). Naziemny próg laboratoryjny optyki to ~{ "1" } fs (znacznie lepszy); dobrze zaprojektowane łącze mikrofalowe (łącze mikrofalowe ACES (Atomic Clock Ensemble in Space) (MWL), ~{ "0.3" } ps) może rywalizować z optycznym, więc punkt odniesienia „RF = { "0.5" } ns” dotyczy konkretnie zwykłego TWSTFT. Przeliczenie na odległość jest jednokierunkowe (odległość = c<em>dt); dwukierunkowe/w obie strony zmniejsza je o połowę (odległość = c</em>dt/2).

seg-5fa72f18f983 = Pakiet { "4" } — fuzja hybrydowa (zwieńczenie)

seg-3de12b094504 = Łączy Pakiet { "1" } (zegar), Pakiet { "2" } (inercjalny) i Pakiet { "3" } (transfer czasu) w jeden zestaw PNT (pozycjonowanie, nawigacja i czas). Zestaw musi utrzymać OBA parametry, czas (< specyfikacja czasu) i pozycję (< specyfikacja pozycji), w granicach; <c1/> to czas do przekroczenia któregokolwiek z nich. Opcjonalny transfer czasu optycznym łączem międzysatelitarnym (ISL) ponownie synchronizuje zegar podczas przerwy (tylko wspomaganie czasem — pozycja nie jest ponownie synchronizowana, ponieważ transfer czasu daje czas, a nie pozycję).

seg-4f7cd8f86565 = Aspekt

seg-19deb2a3537c = Łączna ocena PNT (czas ORAZ pozycja)

seg-77a7595ffad7 = <c1/> ręcznie wyprowadzony test <c2/> (pnt_holdover = pierwsze z przekroczeń czasu/pozycji).

seg-d0e39bf123d8 = Integralność + bezpieczeństwo dla pakietu hybrydowego

seg-3fb63eb2b6b8 = <c1/>: estymator czasu Kalmana dyscyplinowany do prawdy (nominalnie) i ponownie zakotwiczany przy każdej optycznej resynchronizacji; Integralność to zawieranie się w granicy ochrony (granica obejmuje próg jitteru łącza), Bezpieczeństwo to ocena detekcji spoofingu. Testowane dla obu zestawów, w tym dla przypadku wspomaganego łączem.

seg-c3be96b7cb41 = Wspólny estymator fuzji

seg-e9d5448ea06c = <c1/>: pojedynczy wspólny filtr Kalmana ([faza, częstotliwość] ⊕ [poz., prędk.]) jest nawigatorem, dyscyplinowanym przez GNSS (uczącym się offsetów z niezerowej początkowej kowariancji) i wspomaganym transferem czasu; wspólna kowariancja daje wspólną integralność, która jest testowana jako niezawodna (≥{ "0.9" }) dla obu zestawów z czujnikami spójnymi co do szumu. Pakiet obserwuje pozycję i czas <b>osobno</b>, dla czego filtr optymalny jest blokowo-diagonalny; estymacja stałego biasu w stanie rozszerzonym i dynamiczne wzajemne wspomaganie to przyszłe prace.

seg-915ec766439f = Sprzężony filtr zegara i pozycji (kowariancja międzyblokowa)

seg-fd718a51859a = <c1/>: pojedynczy skumulowany filtr Kalmana <c2/> (aktualizacje w postaci Josepha), którego pomiar <b>pseudoodległości</b> <c3/> sprzęga bloki pozycji i zegara. Testy: wspólna pseudoodległość czyni <c4/> niezerowym (filtry rozłączne utrzymują dokładnie { "0" }); dwie różne geometrie łącznie rozwiązują wstrzyknięte offsety pozycji i zegara, których pojedyncza odległość nie rozdzieli; poprawka <b>tylko zegara</b> wyostrza <b>pozycję</b> przez kowariancję krzyżową (korzyść, którą daje sprzężenie, a której filtry rozłączne nie dają); oraz <b>NEES metodą Monte Carlo jest spójny z χ²({ "4" })</b> (Bar-Shalom §{ "5.4" }, pasmo oparte na przebiegach). 1-DOF (wymiarowość pakietu); jeszcze nie podłączony do uruchamialnego pakietu, a rozszerzenie 3-D do 8 stanów to przyszłe prace.

seg-31ecf062b941 = Złożenie podmodeli sprawdzonych względem niezależnego wzorca

seg-9b849cb4fe8d = dziedziczy

seg-4e1c8b6791f3 = człony zegara/inercjalne/transferu czasu są sprawdzone względem niezależnego wzorca we własnych pakietach.

seg-b672e5499976 = Luźno sprzężony GNSS/INS (pakiet <c1/>)

seg-277425f2cbcf = <c1/>: 15-stanowy EKF stanu błędu (δp, δv, ψ, bias akcelerometru/żyroskopu; Groves §{ "14" }) steruje trójosiowym nawigatorem strapdown ze sprzężeniem zwrotnym. Testy: wstrzyknięty błąd pozycji zeruje się przy wspomaganiu idealną prawdą; rozwiązanie wspomagane pozostaje ograniczone do metrów, podczas gdy swobodnie działający INS rozbiega się powyżej { "100" } m; a połączone RMS pozycji w trakcie przerwy { "60" } s pokonuje niewspomaganą nawigację zliczeniową o granicę testu zespołu (~{ "4" }× przy pomiarze przed { "0.27.3" }; margines jest większy po poprawce poniżej). Sprzężenie biasu żyroskopu jest sprawdzane względem samego strapdown: znany resztkowy bias żyroskopu musi wytworzyć błąd orientacji przewidywany przez filtr (<c2/>), a szeroki rozkład a priori musi nauczyć się biasu żyroskopu klasy kontrolera lotu, pozostając ograniczonym; oba testy zawodzą na znaku sprzed 0.27.3. <b>Zmienione w { "0.27.3" }:</b> to sprzężenie miało zły znak, więc estymaty biasu żyroskopu popychały w złą stronę i tylko ścisły rozkład a priori utrzymywał stabilność pakietu; opublikowane wartości przerw uległy zmianie (CHANGELOG, Fixed). Uczciwe ograniczenie: bias akcelerometru/przechył w układzie luźno sprzężonym są słabo rozdzielne, więc kalibracja poszczególnych biasów nie jest twierdzona.

seg-1c9a9f76a432 = Ściśle sprzężony GNSS/INS (pseudoodległość)

seg-b4ccc12229c4 = <c1/> + <c2/> <c3/>: innowacja jest tworzona w dziedzinie odległości (jakobian linii widzenia na δp). Testy: cztery satelity zerują wstrzyknięty poziomy błąd { "8" } m/−{ "5" } m do < { "0.1" } m; <b>dwa satelity</b> (poprawka pozycji, prędkości i czasu (PVT) niemożliwa) nadal zmniejszają błąd poziomy o > { "5" }×; pojedynczy satelita w zenicie obserwuje tylko składową wzdłuż linii widzenia (pionową) i pozostawia poziomą nietkniętą; niepoprawne dane wejściowe są odrzucane. Tylko pseudoodległość — faza nośnej i jawny stan zegara odbiornika są w planie.

seg-240b681b6021 = Wierność wzajemnego wspomagania czujników (pełna fuzja Kalmana/grafu czynników)

seg-efe7e288276b = <c1/> w pakiecie <c2/>

seg-e5371874c57d = Pakiet hybrydowy to kompozycja na poziomie systemu + wspomaganie czasem, a nie estymator optymalny. Filtry istnieją gdzie indziej: luźno i ściśle sprzężony EKF (extended Kalman filter) z pakietu <c1/> (wiersze powyżej) oraz 17-stanowy UKF (unscented Kalman filter) rodzaju <c2/>. Nie jest modelowany żaden wygładzacz grafu czynników.

seg-189758709fd2 = Wynik: zestaw w pełni kwantowy utrzymuje pełne PNT przez przerwę { "1.8" } h; zestaw w pełni klasyczny jest <b>ograniczony pozycją</b> (jednostka inercjalna klasy nawigacyjnej przekracza granicę jako pierwsza). Optyczny transfer czasu ISL utrzymuje w synchronizacji nawet klasyczny ZEGAR, wskazując czujnik inercjalny jako słabe ogniwo zestawu klasycznego — to rdzeń argumentu za łącznym użyciem kwantowej inercji i optycznej synchronizacji czasu.

seg-a4c5b45ea8a5 = Geometria — dostępność GNSS z orbit

seg-d347bb63c1fd = Kołowa propagacja dwóch ciał

seg-60c369fbbd97 = <c1/>: okres <c2/> (mu = { "3.986004418e14" }), pozycja wraca po jednym okresie, płaskość równikowa/biegunowa — testy wyprowadzone ręcznie.

seg-1260a2fef95f = Propagacja ekscentryczna (keplerowska)

seg-49df9d526f9c = <c1/>: równanie Keplera <c2/> rozwiązane metodą Newtona (reszta < { "1e-12" }); promienie perygeum/apogeum <c3/>; przypadek kołowy zgadza się ze ścieżką postaci zamkniętej z dokładnością { "1e-9" }.

seg-958f03424508 = Sekularny dryf węzłowy/apsydalny J2

seg-336b9581c47c = <c1/>: <c2/>, <c3/> (Vallado); węzeł cofa się (ruch prosty) / przesuwa się naprzód (ruch wsteczny) / jest nieruchomy (biegunowa), a apsydy zamarzają przy inklinacji krytycznej { "63.4" } deg — testy znaku/zera wyprowadzone ręcznie. Tylko dwa ciała + człony sekularne, nie osculacyjne.

seg-dcba8d368326 = Widoczność w linii widzenia (zasłonięcie przez Ziemię + maska elewacji)

seg-2eee9a8f894b = Satelita antypodalny zasłonięty, satelita skierowany radialnie na zewnątrz na elewacji { "90" } deg, satelita styczny na horyzoncie — dokładne testy wyprowadzone ręcznie.

seg-f251c75eb367 = Widoczność -> stan GNSS -> oś czasu

seg-70fbb9f3cc2b = <c1/> widocznych = nominalny, 1-3 zdegradowany, { "0" } odmowa; generator Walker-delta; test integracyjny napędza przebieg holdover zegara z wyprowadzonej osi czasu.

seg-988d3fedb7f5 = Optymalizator projektu konstelacji + geometria „streets-of-coverage”

seg-2a636487a4e6 = <c1/>: <c2/> przeszukuje siatkę <c3/> i zwraca komórkę, która najlepiej spełnia <c4/> (min. satelitów dla celu pokrycia / maks. pokrycie / min. najgorsze PDOP (PDOP: współczynnik rozmycia dokładności pozycji)) — test stwierdza, że wybór jest równy niezależnemu przeszukaniu wyczerpującemu tego samego przeglądu, a przykład rozwiązany potwierdza, że projekt GPS (Global Positioning System) Walker 24/6/1 pokrywa co najmniej tak dobrze jak przerzedzony 18-satelitarny. Analityczne zamknięte postaci <b>streets-of-coverage</b> (<c5/> <c6/>; <c7/> <c8/>, Rider/Beste) są ręcznie zweryfikowane względem geometrii podręcznikowej (GPS przy masce { "5" }°: λ ≈ { "71.16" }°, półszerokość ulicy dla 4 satelitów ≈ { "62.83" }°) i wykrywają lukę niedoboru satelitów (<c9/>). Pełny solver Ridera minimalnej liczby satelitów dla pokrycia <em>globalnego</em> (liczba płaszczyzn wrażliwa na szew) nie jest jeszcze zaimplementowany.

seg-a1c1364cc45a = Rozmycie dokładności (GDOP/PDOP/HDOP/VDOP/TDOP (GDOP: geometryczny współczynnik rozmycia dokładności; HDOP: poziomy współczynnik rozmycia dokładności; VDOP: pionowy współczynnik rozmycia dokładności; TDOP: czasowy współczynnik rozmycia dokładności)) -> dokładność pozycji

seg-a1706d47f895 = <c1/>: <c2/> z macierzy projektowej linii widzenia. <b>Zewnętrzna wyrocznia</b> (<c3/>): pięć współczynników DOP odtwarza te obliczone przez <b>gnss_lib_py { "1.0.4" }</b> (Stanford NAV Lab — niezależną, recenzowaną bibliotekę GNSS, używaną tu tak, jak ERFA (Essential Routines for Fundamental Astronomy) jest używana dla układów odniesienia) na <b>{ "8" } geometriach</b> od dobrze uwarunkowanych do prawie osobliwych (DOP w setkach), z dokładnością względną <b>{ "1e-6" }</b>; pochodzenie i regeneracja w <c4/>. Jako dodatkowa kontrola postaci zamkniętej geometria regularnego czworościanu odtwarza analityczne DOP (PDOP { "1.5" }, TDOP { "0.5" }, GDOP √{ "2.5" }, HDOP √{ "1.5" }, VDOP √{ "0.75" }) z dokładnością { "1e-9" }. Sigma pozycji = PDOP × błąd odległości równoważny użytkownika.

seg-504d5aa92cbc = Błąd pozycji = σ_UERE × DOP dla własnego rozwiązania najmniejszych kwadratów silnika

seg-fc3443210358 = <c1/>, <c2/>: Monte Carlo z ziarnem (N = { "20,000" } epok na geometrię, σ = { "1.5" } m, ziarno ChaCha8 { "36" } + i) dla <c3/> z wagami jednostkowymi, rozwiązywane od pozycji prawdziwej, na <b>{ "8" } geometriach z <c4/></b> (tych, których DOP jest dopasowany do gnss_lib_py), względem σ²·Q, gdzie Q jest czynnikiem kowariancji samego jądra <c5/> (<c6/>, ta sama arytmetyka). <b>Tolerancje zarejestrowane z góry</b> (commit e50c88d2, przed pierwszym przebiegiem, według notatki projektowej geometrii { "0.36" }, sekcja { "5.2" }), każda jako liczba błędów standardowych: wariancje wschód, północ, góra i zegar w granicach { "5" } %; RMS H/V/P w granicach { "2.5" } %; korelacja wschód–północ w granicach { "0.035" }; średnie w granicach { "5" } błędów standardowych; ułamek { "95" } % elipsy poziomej w granicach { "0.95" } ± { "0.0077" }. Pierwszy przebieg: wszystkie { "104" } kontrole zaliczone (najgorsza wariancja { "3.2" } %, RMS { "1.6" } %, korelacja { "0.012" }, średnia { "2.2" } błędu standardowego, elipsa { "0.0039" }). <b>Kontrole negatywne</b> zawodzą zgodnie z wymaganiem: podwojone PDOP zawodzi na każdej geometrii; błędy rosnące jak 1/sin(elewacja) względem nieważonego Q zawodzą w kontroli wariancji na każdej geometrii, której najniższy satelita leży poniżej { "20" }°. <b>Jak to się składa z wierszem powyżej:</b> tamten wiersz sprawdza DOP tych geometrii względem gnss_lib_py; ten dodaje krok od tych współczynników do metrów przez solver silnika. <b>Pierwsza, osobna kontrola jest zachowana obok</b> (<c7/>, <c8/>, uruchomiona przed wstępną rejestracją i tak zgłoszona): cztery ręcznie dobrane nieba (otwarte, skupione, kanion, pół nieba; σ { "1" } m) z przedziałami ufności chi-kwadrat na poziomie { "1e-6" } łącznie na { "20" } kontroli; stosunki od { "0.987" } do { "1.009" } oraz własne kontrole negatywne (błąd DOP { "10" } %, błędy 1/sin(elewacja)) zawodzą zgodnie z wymaganiem. <b>Dlaczego MODELLED:</b> brak zewnętrznego zbioru danych; nie pokazuje, że błąd rzeczywistego odbiornika podąża za modelem, a σ_UERE jest daną wejściową.

seg-94bffbd8385b = Dostępność wielokonstelacyjna

seg-a40eab03bbbe = <c1/>: dodatkowe <c2/> są łączone w jeden zbiór satelitów do widoczności/DOP; test łącznej liczby potwierdza sumę.

seg-0b905100d91c = Jonosfera z transmisji (Klobuchar, IS-GPS-200 (IS: Interface Specification)) → ukośne opóźnienie L1

seg-05e278f04770 = <c1/>: <c2/>, ośmiowspółczynnikowy model jednoczęstotliwościowy z transmisji. <b>Zewnętrzna wyrocznia</b> (<c3/>): ukośne opóźnienie L1 odtwarza <b><c4/> z RTKLIB (otwartoźródłowej biblioteki pozycjonowania kinematycznego w czasie rzeczywistym)</b> (tomojitakasu/RTKLIB, <c5/> — de facto otwarty wzorzec GNSS, skompilowany ze źródeł i uruchomiony niezależnie) na <b>{ "10" } przypadkach</b> obejmujących elewację, azymut, czas lokalny i dwa zestawy współczynników (domyślny kshana + RTKLIB), z dokładnością <b>< { "1e-4" } m</b>. Czytnik map TEC (TEC: całkowita zawartość elektronów) IONEX (format wymiany map jonosfery) dla plików GIM (globalna mapa jonosfery) już istnieje (<c6/>, <c7/> z dwuliniową interpolacją przestrzenną i czasową oraz odwzorowaniem ukośnym, testowany jednostkowo w crate); porównanie tej interpolacji z rzeczywistym produktem GIM CODE (Center for Orbit Determination in Europe) jest nadal zadaniem na później. Sam model z transmisji jest sprawdzony względem zewnętrznego wzorca.

seg-39e235557ecc = Jądro detekcji RAIM/ARAIM (ARAIM: advanced receiver autonomous integrity monitoring) (χ² / niecentralny χ² / normalny) → progi i mnożniki

seg-8906f922b9b9 = <c1/>: próg detekcji snapshot / rozdzielenia rozwiązań / ARAIM (<c2/>), niecentralność niewykrycia <c3/> (<c4/>) oraz mnożniki K_fa/K_md/K_V (<c5/>) są wszystkie obliczane z niezależnej od bibliotek zregularyzowanej niepełnej funkcji gamma. <b>Zewnętrzna wyrocznia</b> (<c6/>): <b>{ "171" } przypadków</b> odtwarza <b>SciPy { "1.17.0" }</b> (<c7/>/<c8/>/<c9/> + <c10/> — niezależna implementacja Cephes/Boost, inny algorytm) w zakresach roboczych P_fa / P_md / redundancji, z dokładnością <b>≤ { "1e-6" } względnej</b>. Geometria otaczająca jądro (nachylenie/kowariancja z <c11/>) to jądro DOP sprawdzone względem gnss_lib_py. <b>Zakres:</b> ten wiersz przypina <em>jądro statystyczne</em>. <em>Wartość</em> poziomu ochrony alokacji ARAIM MHSS (multiple-hypothesis solution separation) jest przypięta osobno względem opublikowanego przykładu rozwiązanego Podgrupy Technicznej ARAIM WG-C (Working Group C) (<c12/>, VPL (pionowy poziom ochrony) { "18.2926" } m wobec { "18.3" } m, HPL (poziomy poziom ochrony) { "13.4063" } m wobec { "13.45" } m, w granicach własnej tolerancji wzorca { "0.05" } m; zob. notatkę o standardach poniżej i <a1><c13/></a1>).

seg-b17f1501a267 = Poziom ochrony SBAS (system wspomagania satelitarnego) (DO-229E Dodatek J) → poziomy ochrony: poziomy / pionowy (HPL / VPL)

seg-abe00b67e4cb = <c1/>: <c2/>, ważone LS (LS: najmniejsze kwadraty) <c3/> → główna oś poziomej elipsy błędu + pionowe σ, skalowane współczynnikami K z DO-229E. <b>Zewnętrzna wyrocznia</b> (<c4/>): HPL w kshana odtwarza <b>fork RTKLIB SBAS-PL</b> (<c5/> <c6/>, implementacja „DO-229D Appendix J” Sikiego i Takácsa { "2017" }), uruchomiony przez <c7/> na <b>rzeczywistych danych EGNOS (European Geostationary Navigation Overlay Service)</b> (komunikaty z transmisji GEO (orbita geostacjonarna) PRN120 + rzeczywisty RINEX (Receiver Independent Exchange Format) BUTE/Budapeszt, 2017-02-19), na <b>{ "6" } epokach</b> z dokładnością <b>< { "2e-3" } m</b>. Sigma na satelitę to własny pełny budżet SBAS wyroczni (UDRE (user differential range error) + jonosfera GIVE (grid ionospheric vertical error) + tropo + pokładowy). ESA gLAB { "v6.0.0" } (<c8/>) skompilowano i potwierdzono, że używa identycznej konwencji. <b>Uwaga o K_V:</b> obie wyrocznie zaokrąglają MOPS (minimum operational performance standards) K_V → { "5.33" }; kshana używa dokładnego <c9/> (VPL mniejszy o ~{ "0.06" } %), więc pion jest sprawdzony jako <c10/> wolne od współczynnika K (= VPL wyroczni / { "5.33" }). HPL jest dopasowany bezpośrednio (K_H = { "6.0" } po obu stronach).

seg-fd16d642cafd = Rzeczywista geometria konstelacji z TLE (wiersz 2 / keplerowska)

seg-1311ef1cb4bb = <c1/> (parsowanie)

seg-5117debbce89 = <c1/>: parsuje średnie elementy keplerowskie z wiersza 2 (półoś wielka ze średniego ruchu); znany zestaw elementów ISS (International Space Station) w obiegu w obie strony daje poprawne elementy i okres. Dla bloku zawierającego tylko wiersz 2 propagacja to dwa ciała silnika (+ opcjonalnie J2) dla elementów <em>średnich</em> — poprawna dla migawki z wspólnej epoki, z czasem odbiegająca od SGP4 (Simplified General Perturbations { "4" }).

seg-26d22e76e28d = Propagacja SGP4 / SDP4 (Simplified Deep-space Perturbations { "4" }) (pełne TLE)

seg-1099f1bffa01 = <c1/>: pełne SGP4 bliskiej Ziemi + SDP4 dalekiej przestrzeni (sekularne/okresowe człony księżycowo-słoneczne + rezonans geopotencjału { "12" } h / { "24" } h). Sprawdzone w <c2/> względem oficjalnych wektorów AIAA (American Institute of Aeronautics and Astronautics) 2006-6753 („Revisiting Spacetrack Report #3”) — wszystkie { "666" } stanów wzorcowych (przypadki bliskiej Ziemi, dalekiej przestrzeni, rezonansowe i kodów błędów) zgadzają się z najgorszym błędem pozycji ≈ { "4.1" } mm. Pełny zestaw dwuwierszowy (wiersz { "1" } + wiersz { "2" }) jest propagowany przez SGP4; sam wiersz 2 pozostaje keplerowski; oba można mieszać. Układ to TEME (true equator, mean equinox), stosowany spójnie dla użytkownika i satelitów (bez redukcji TEME→ECEF (ECEF: układ związany z Ziemią, ze środkiem w Ziemi) — wystarczająca dla geometrii dostępności/DOP).

seg-c8fc6a49d249 = Nutacja IAU (International Astronomical Union) 2000A / 2000B + redukcja TEME→GCRS (GCRS: Geocentric Celestial Reference System)

seg-b31c49596100 = <c1/>: <b>pełny szereg IAU 2000A</b> ({ "678" } członów księżycowo-słonecznych + { "687" } planetarnych, <c2/>) i 77-członowe obcięcie 2000B (<c3/>) są sprawdzone <b>co do bitu</b> względem opublikowanych wektorów wzorcowych SOFA/ERFA (SOFA: Standards of Fundamental Astronomy) przy JD_TT { "2453736.5" } — <c4/> daje Δψ = −{ "0.9630909107115518e-5" }, Δε = { "0.4063239174001679e-4" }; <c5/> daje Δψ = −{ "0.9632552291148363e-5" }, Δε = { "0.4063197106621160e-4" } — oba z dokładnością <b>{ "1e-13" } rad</b>. Tabela 2000A jest generowana maszynowo ze źródła ERFA <c6/> przez <c7/> (odtwarza zatwierdzony <c8/> co do bitu). Macierz nutacji (<c9/>), równanie równonocy i pełny łańcuch TEME→TOD→MOD→GCRS (TOD: true of date; MOD: mean of date) (<c10/>, Vallado AIAA-2006-6980) są testowane pod kątem własności właściwej rotacji/obiegu w obie strony/precesji plus nutacji, macierz nutacji względem ERFA <c11/> element po elemencie z dokładnością { "1e-14" }, a cały łańcuch TEME→GCRS względem opublikowanego przykładu TEME→GCRF Vallado (AIAA 2006-6753, 2004-04-06) z dokładnością <b>{ "0.11" } m</b> (<c12/>); zanim dodano tę kontrolę od początku do końca, macierz nutacji niosła Δψ ze złym znakiem, obrót o { "2" }·Δψ (około { "25" }″), którego testy własności nie mogły zobaczyć (zob. CHANGELOG, Unreleased, Fixed); 2000A i 2000B zgadzają się do < { "1" } mas, jak wymagane. Łańcuch opiera się na równonocy/GMST (GMST: Greenwich mean sidereal time); redukcja CIO (X,Y,s) bez równonocy i jej niezależna kontrola numeryczna ANISE/SPICE (ANISE: Attitude, Navigation, Instrument, Spacecraft, Ephemeris — czysto rustowy zestaw narzędzi geometrii planetarnej; SPICE: Spacecraft, Planet, Instrument, C-matrix, Events) (≤ { "3.6" } m na orbicie GNSS, dobrze w granicach celu < { "10" } m) znajdują się w wierszu CIO poniżej.

seg-0be3c40cc81a = Model głównego pola geomagnetycznego IGRF-14 (IGRF: International Geomagnetic Reference Field)

seg-9dbb3b1b18a1 = <c1/>: pole w harmonikach sferycznych znormalizowane Schmidta według IAGA (International Association of Geomagnetism and Aeronomy) (stopień/rząd { "13" }, { "2025.0" } + zmienność sekularna; współczynniki wygenerowane maszynowo z oficjalnego <c2/> przez <c3/>, odtwarzające <c4/> co do bitu). Sprawdzone na pięciu niezależnych frontach: ({ "1" }) dokładne wyrywkowe kontrole współczynników względem pliku IAGA (g₁⁰=−{ "29350.0" }, g₁¹=−{ "1410.3" }, h₁¹={ "4545.5" } nT); ({ "2" }) synteza stopnia 1 odtwarza <b>dokładne pole przechylonego dipola w postaci zamkniętej</b> <c5/> z dokładnością { "1e-6" }; ({ "3" }) <b>pełne analityczne pole stopnia 13 równa się −∇V</b> potencjału skalarnego (różnice skończone, z dokładnością { "1e-4" }) — ćwicząc pochodne Legendre'a i człon 1/sinθ od początku do końca; ({ "4" }) oś dipola odtwarza znany <b>geomagnetyczny biegun północny</b> (~{ "80.7" }°N, −{ "72.7" }°E) i <b>siłę dipola</b> (~{ "29.7" } µT), a globalne pole mieści się w fizycznym paśmie { "22" }–{ "67" } µT z poprawnym znakiem inklinacji na półkulach; oraz ({ "5" }) <b>zewnętrzna wyrocznia</b> — pełna synteza odtwarza wartości z oficjalnej <b>usługi internetowej British Geological Survey IGRF-14</b> przy { "2025.0" } (geodezyjna, wysokość WGS-84 (WGS: World Geodetic System)) z dokładnością <b>< { "2" } nT</b> dla X/Y/Z/F i <c6/> dla D/I w czterech punktach, w tym na wysokości { "400" } km (<c7/>).

seg-c1027d5ffc44 = Redukcja GCRS↔ITRS (ITRS: International Terrestrial Reference System) IAU 2006/2000A oparta na CIO

seg-aad81285e8cf = <c1/>: łańcuch niebieski-do-ziemskiego bez równonocy. Współrzędne CIP (Celestial Intermediate Pole) <c2/> i 66-członowy szereg lokatora CIO <c3/> są sprawdzone <b>co do bitu</b> względem opublikowanego wektora SOFA/ERFA <c4/> przy JD_TT { "2453736.5" } — X={ "0.5791308482835292617e-3" } ({ "1e-14" }), Y={ "0.4020580099454020310e-4" } ({ "1e-15" }), s=-0.1220032294164579896e-7 ({ "1e-18" }); macierz GCRS→CIRS (CIRS: Celestial Intermediate Reference System) względem <c5/> (wszystkie dziewięć elementów z dokładnością { "1e-12" }); kąt obrotu Ziemi (ERA) względem <c6/> = { "0.4022837240028158102" } ({ "1e-12" }). Tabela <c7/> jest generowana maszynowo ze wzorca ERFA <c8/> przez <c9/> (odtwarza <c10/> co do bitu). Pełny <c11/> (CIO <c12/> = ruch bieguna · ERA · GCRS→CIRS) jest testowany pod kątem właściwej rotacji i obiegu w obie strony oraz wykazano jego spójność ze starszą redukcją TEME równonocy/GMST-1982 w granicach { "1" } m przy promieniu { "7 000" } km (konwencje różnią się tam o około { "5" } cm). <b>Niezależna kontrola krzyżowa strony trzeciej (<c13/>):</b> ten sam <c14/> jest porównywany z <b>ANISE</b> (czysto rustową reimplementacją NAIF/SPICE (NAIF: Navigation and Ancillary Information Facility)) obracającą GCRF→ITRF93 (GCRF: Geocentric Celestial Reference Frame; ITRF93: International Terrestrial Reference Frame { "1993" }) z <c15/> z JPL (Jet Propulsion Laboratory), przy <b>identycznych parametrach orientacji Ziemi IERS (International Earth Rotation and Reference Systems Service) <c16/> podanych obu stronom</b>, na ośmiu kwartalnych epokach { "2020" }–{ "2023" }. Obie niezależne realizacje układu zgadzają się z <b>maksymalnym względnym obrotem { "0.028" }″ — ≤ { "0.86" } m na ziemi, ≤ { "0.93" } m na LEO (niska orbita okołoziemska), ≤ { "3.6" } m na orbicie GNSS</b> (średni kąt { "0.023" }″). To jest kontrola krzyżowa układu „< { "10" } m” z ROADMAP, <b>wykonana</b>; reszta to oczekiwana różnica modelu/datum ITRF93 względem IERS-2010-CIO, a nie defekt (kotwicą co do bitu pozostają wektory SOFA/ERFA powyżej). ANISE to crate na licencji MPL-2.0 (MPL: Mozilla Public License) / edition-2024, więc kontrola mieszka w samodzielnym podcrate wyłączonym z workspace, który nigdy nie dotyka opublikowanego grafu zależności <c17/> ani żadnej domyślnej bramki CI.

seg-fa5889f379d2 = Eksport SP3 (Standard Product { "3" }, format precyzyjnych orbit) w obie strony (konstelacja → SP3-c → ponowne sparsowanie)

seg-cd53434eba3a = <c1/>: rzeczywista migawka Celestrak <c2/> ({ "30" } satelitów GPS) jest propagowana przez SGP4, eksportowana do SP3-c (<c3/> → <c4/>), sparsowana ponownie (<c5/>), a odzyskane pozycje ECEF są porównywane z prawdą SGP4 w każdej epoce przez { "24" } h — najgorsza reszta <b>< { "0.5" } m</b> (milimetrowa serializacja zapisującego; tolerancja { "10" } m klasy TLE (TLE: dwuwierszowy zestaw elementów) z kamienia milowego jest spełniona z dużym zapasem). Ścieżka CLI (interfejs wiersza poleceń) <c6/> też jest pokryta: dołączony scenariusz orbity eksportuje ponownie parsowalny 30-satelitarny SP3, a scenariusz nieorbitalny jest odrzucany.

seg-fa5ee52e59aa = Rzeczywista geometria konstelacji GPS z TLE (SGP4 → ECEF)

seg-1329a53ca94c = <c1/>: autentyczna <b>migawka Celestrak <c2/></b> (2021-07-28, { "30" } działających satelitów GPS; pochodzenie w <c3/>) jest parsowana, a każdy satelita propagowany przez sprawdzone jądro SGP4 do wspólnej chwili i obrócony TEME→ECEF. Stwierdza, że cała konstelacja ląduje na powłoce GPS MEO (średnia orbita okołoziemska) w granicach { "1" }% oraz że z otwartego nieba w średniej szerokości geograficznej rzeczywisty zestaw wszystkich widocznych (dziewięć satelitów) daje PDOP { "1.64" }, przy czym rozmycie pionowe przekracza poziome (jak musi dla użytkownika naziemnego). To ćwiczy SGP4 na rzeczywistej konstelacji, obok ścieżek rzeczywistych danych SP3 (precyzyjnych) i RINEX (z transmisji).

seg-a1b7d74bbe02 = Generator Walkera ze średnimi elementami SGP4

seg-01f1635b75e4 = <c1/>: zaprojektowany wzorzec Walker-delta jest emitowany jako średnie elementy SGP4 (średni ruch Kozai dobrany tak, by półoś wielka SGP4 trafiła w docelową powłokę) i propagowany przez sprawdzone jądro. Testy: 24-satelitarny Walker podobny do GPS leży na powłoce MEO w granicach { "1" }%, płaszczyzny są rozmieszczone dokładnie co { "90" }° w RAAN (rektascensja węzła wstępującego) odzyskanym z normalnych orbit, a średni ruch odtwarza okres powłoki GPS ~{ "718" } min.

seg-6e8c472ec9fa = Przegląd PDOP konstelacji + wskaźniki jakości (FoM) pokrycia/powrotu

seg-dcdbf9c78ca5 = <c1/> (monotoniczność)

seg-5a70f090db45 = <c1/>: <c2/> zestawia w tabeli pokrycie oraz medianę/najgorsze PDOP na siatce <c3/>; <c4/> podaje ułamek pokrycia i przerwy między powrotami w punkcie naziemnym. Sprawdzone fizycznymi monotonicznościami, których musi przestrzegać kompromis projektowy: dodawanie satelitów nigdy nie obniża pokrycia i ściśle obniża medianę PDOP (pełny 24-satelitarny projekt pokrywa w sposób ciągły przy PDOP ~{ "1.7" }), a zagęszczanie przerzedzonej konstelacji ściśle zmniejsza najgorszą przerwę powrotu. Średnia przerwa powrotu nigdy nie przekracza maksimum. To tabele kompromisów geometrycznych, a nie certyfikowany bilans łącza/pokrycia.

seg-9f0747d71ecc = Uczciwe ujęcie: to deterministyczna warstwa geometrii (orbity kołowe, kulista Ziemia o średnim promieniu { "6371" } km, czysta linia widzenia). Ustala <em>dostępność</em> i <em>geometryczną</em> dokładność pozycji (rozmycie dokładności × reprezentatywny budżet błędu odległości) z rzeczywistej geometrii, a nie rozwiązanie nawigacyjne z precyzyjnych efemeryd. Wzorzec <c1/> umieszcza statek kosmiczny wewnątrz powłoki GNSS: utrzymuje on poprawkę tylko przez ~{ "59" }% doby, zegar kwantowy utrzymuje rozwiązanie czasu { "5" } ns przez każdą lukę (dostępność { "1.0" }), a zegar w skali układu scalonego utrzymuje ~{ "0.73" }.

seg-e2c433c35ba8 = Propagator numeryczny (Cowella) i model sił

seg-20ace4e0a710 = Propagator numeryczny (<c1/>) całkuje hierarchiczny model sił (<c2/>) adaptacyjnymi całkowaczami (<c3/>). Każdy poniższy człon jest sprawdzony względem prawdy analitycznej lub ręcznie wyprowadzonej postaci zamkniętej; perturbacje są <b>domyślnie wyłączone</b>, więc wydane wzorce złote pozostają nietknięte. Model złożony jest też sprawdzany krzyżowo innym narzędziem: <c4/> uruchamia { "11" } przypadków LEO i GTO (geostacjonarna orbita transferowa), { "275" } epok godzinowych, względem propagatora DormandPrince853 z Orekit { "12.2" }, a zachowawcze poziomy (dwa ciała → J2–J6 → Słońce/Księżyc → kulowe SRP) zgadzają się z najgorszą wartością { "0.08" } m przez { "24" } h (VALIDATED w macierzy); poziom oporu jest tylko scharakteryzowany ({ "333" } m) i pozostaje MODELLED.

seg-ec74e57ff801 = Propagator Cowella względem analitycznej prawdy Keplera

seg-8d773778ff0e = <c1/>: orbita nieperturbowana (dwa ciała) odtwarza <b>dokładne rozwiązanie Keplera w zmiennych uniwersalnych z dokładnością poniżej metra na orbicie LEO przez { "24" } h</b> (ciaśniejsza bramka niż „względem odniesienia numerycznego < { "10" } m”); energia właściwa i moment pędu zachowują się z dokładnością względną ~{ "1e-9" }; regresja węzła J2 odtwarza zamkniętą postać <c2/> do teorii pierwszego rzędu (w granicach { "2" } %, reszta O(J2²)). <c3/> zwraca <c4/> zamiast po cichu błędnej odpowiedzi, gdy Newton nie zbiega (w pobliżu perygeum e = { "0.999" }). Solidny <c5/> (starter Markleya { "1995" }, <c6/>) zbiega tam i dla { "0" } ≤ e ≤ { "0.999999" }, w granicach { "0.9" } ε·|E| od 50-cyfrowych pierwiastków mpmath (<c7/>).

seg-549d15780f79 = Adaptacyjne całkowacze (RK4 (Runge–Kutta czwartego rzędu) z podwajaniem kroku + zagnieżdżona para Dormanda–Prince'a RK5({ "4" }), DP5({ "4" }) poniżej)

seg-1fcc7553c627 = <c1/>: RK4 całkuje <c2/> do < { "1e-9" }, pokazuje spadek błędu ~{ "16" }× przy zmniejszeniu kroku o połowę (zbieżność 4. rzędu) i zachowuje oscylator harmoniczny przez okres. Zagnieżdżony estymat błędu DP5({ "4" }) jest <b>O(h⁵)</b> (zmniejszenie kroku o połowę obcina go ~{ "32" }×), całkuje oscylator przez { "50" } okresów, zachowując energię z dokładnością < { "1e-6" }, i osiąga ten sam punkt końcowy przy tej samej tolerancji w <b>mniejszej liczbie obliczeń funkcji</b> niż podwajanie kroku; <c3/> przechodzi tę samą podmetrową bramkę Keplera i zgadza się ze ścieżką RK4 z dokładnością < { "1" } m na orbicie J2..J6. <b>DOP853</b> (<c4/>): para { "8" }({ "5,3" }) Hairera z gęstym wyjściem odtwarza DOP853 z SciPy { "1.18.1" } krok po kroku (pojedynczy krok w granicach { "5.6e-15" }; identyczne liczby kroków w przebiegach e = { "0.7" } i Arenstorfa, jedna zmiana akceptacji/odrzucenia na { "501" } kroków w przebiegu LEO; stany końcowe w granicach { "1.6e-12" }) i dorównuje dokładnemu rozwiązaniu Keplera tak samo dobrze jak SciPy (<c5/>).

seg-345ae1eb05ec = Pole harmonik zonalnych J2–J6

seg-a88e67186e69 = <c1/>: <c2/> jest sprawdzane na trzy sposoby — <b>redukuje się do <c3/> sprawdzonego 666 wektorami z dokładnością maszynową</b>, gdy ograniczy się je do <c4/>; <b>zgadza się z numerycznym gradientem własnego potencjału zonalnego</b> w pełnym polu J2..J6 (złoty standard pola zachowawczego); a nieparzyste <c5/> wobec parzystych <c6/>/<c7/> pokazują charakterystyczną (anty)symetrię północ–południe względem <c8/>. Propagowana orbita J2..J6 zachowuje całkowitą energię z dokładnością ~{ "1e-8" } w ciągu doby.

seg-5536986d9c8f = Grawitacja trzeciego ciała (Słońce i Księżyc)

seg-04388d03e696 = <c1/> + <c2/>: <c3/> <b>zgadza się z dokładnym gradientem swojego potencjału zaburzającego</b>, zanika w geocentrum i trafia w podręcznikowe wielkości LEO (~{ "5e-7" } m/s² Słońce, ~{ "1.1e-6" } m/s² Księżyc). Niskoprecyzyjne efemerydy Słońca Montenbrucka–Gilla trafiają w ręcznie wyprowadzone kotwice J2000 (odległość peryhelium ≈ { "1.471e11" } m, ~−{ "23" }° deklinacja przesilenia, ruch ~{ "1" }°/dobę); efemerydy Księżyca pozostają w obwiedni perygeum/apogeum, odtwarzają średnią odległość ~{ "384 400" } km, nigdy nie przekraczają inklinacji { "5.3" }° i wracają w granice { "1" }° po jednym miesiącu syderycznym. Okablowanie prawej strony (RHS) sterowanej epoką jest <b>dokładne co do bitu</b> (człon RHS równa się <c4/> w próbkowanej pozycji przy t = { "0" } i t = { "1" } dobie), a przesunięcie epoki o ćwierć roku daje inną trajektorię.

seg-9c8756f9d534 = Ciśnienie promieniowania słonecznego (SRP) + cień stożkowy

seg-e6110e015204 = <c1/>: <c2/> (kula armatnia <c3/>) jest <b>identyczne co do bitu</b> z postacią zamkniętą w pełnym słońcu, przypina <b>ciśnienie promieniowania na 1 AU (AU: jednostka astronomiczna) do ≈ { "4.5398e-6" } N/m²</b>, mieści się w paśmie LEO ~{ "1.36e-7" } m/s² odpychając od Słońca, spada do ćwierci, gdy odległość od Słońca się podwaja (odwrotność kwadratu), i jest <b>dokładnie zerowe</b> głęboko w umbrze. <c4/> daje <c5/> w pełnym słońcu i <c6/> w całkowitej umbrze (dokładnie), gładką monotoniczną półcień rosnącą { "0" } → { "1" } w paśmie <c7/>, które <b>wykracza poza cylinder umbry</b>.

seg-17b48db4038b = Opór atmosferyczny (pierwszy człon zależny od prędkości)

seg-4e6c2d0fff55 = <c1/>: <c2/> (odcinkowo wykładnicza Tabela 8-4 Vallado) <b>kotwiczy na { "1.225" } kg/m³ na poziomie morza</b>, obcina poniżej powierzchni, maleje monotonicznie przez LEO, mieści się w paśmie ~{ "1e-12" } kg/m³ na { "400" } km z fizycznie odzyskaną wysokością skali ~{ "58" } km; <c3/> przeciwstawia się współobracającej się prędkości względnej o wielkości LEO ~{ "2e-6" } m/s². Kontrola sygnaturowa: orbita { "300" } km traci energię właściwą <b>monotonicznie</b>, a jej półoś wielka maleje o ograniczone ~km/dobę, podczas gdy bazowy przypadek próżni zachowuje energię z dokładnością < { "1e-9" }.

seg-133eed361425 = Poprawka relatywistyczna postnewtonowska (Schwarzschilda)

seg-c8e26480f148 = <c1/>: <c2/> (postać IERS <c3/> <c4/>) zwija się na orbicie kołowej do postaci zamkniętej <c5/> (radialnie, <b>na zewnątrz</b>, składowe poza osią dokładnie zerowe), pokazuje podręcznikowy <b>stosunek LEO <c6/> do dwóch ciał</b>, zgadza się z ręcznie uproszczoną postacią radialno-prędkościową <c7/> z dokładnością < { "1e-12" } i w propagatorze <b>perturbuje orbitę, utrzymując półoś wielką poniżej metra/dobę</b> — zachowawcze przeciwieństwo zaniku od oporu.

seg-d39e75019595 = Uczciwy zakres: wydane domyślne <c1/> całkują pole zonalne. Wysokostopniowe pole <b>tesseralne</b> EGM2008 (<c2/>, stopień/rząd { "70" }), <b>pływy</b> stałe/oceaniczne/atmosferyczne (<c3/>) oraz człon <b>Lense–Thirringa</b> (wleczenie układu odniesienia) są teraz zaimplementowane i złożone w precyzyjny model sił dopasowywania efemeryd (<c4/> — zob. niżej). Pole tesseralne jest też opcjonalnym członem <c5/> Cowella (<c6/>, domyślnie wyłączonym), sprawdzonym względem Orekit { "12.2" } <c7/> do stopnia/rzędu { "70" } ({ "6" } przypadków przez { "24" } h, najgorsze |Δr| { "0.036" } m; <c8/>). Istnieją dwa ewaluatory pola: historyczny <c9/> (pochodne sferyczne; poprawny do stopnia ~{ "180" } z dala od biegunów; wyniki przypięte) i <c10/> (zmodyfikowana kolumna w przód Holmesa–Featherstone'a { "2002" }, gradient bez 1/cos φ; poprawny do stopnia { "2190" } na każdej szerokości). EGM2008 do { "2190" } jest wczytywany w czasie działania (<c11/>, <c12/>, niedołączony). <c13/> zgadza się z Orekit { "12.2" } z dokładnością { "7.3e-17" } m/s² w ośmiu punktach do stopnia { "2190" }; pozostaje MODELLED, ponieważ pyshtools nie spełniło zarejestrowanego z góry progu w pobliżu biegunów (kontrola mpmath lokalizuje błąd w pyshtools; <c14/>). Orbita { "24" } h { "200" }×{ "200" } zgadza się z Orekit z dokładnością { "0.13" } m, ale jej zarejestrowana z góry kontrola czułości dla stopnia 70 nie została spełniona ({ "0.73" } m < { "1" } m), więc stopnie { "71" }–{ "200" } są na orbicie scharakteryzowane, a nie sprawdzone względem niezależnego wzorca (<c15/>). Gęstość termosferyczna NRLMSISE-00 (NRLMSISE: model atmosfery Naval Research Laboratory z użyciem spektrometru mas i radaru rozpraszania niekoherentnego) jest przeniesiona (<c16/>: identyczna co do bitu z portem C w domenie publicznej na { "720" } punktach, w granicach { "1.9e-6" } względnej od pymsis, { "17" } opublikowanych przypadków testowych odtworzonych; <c17/>) i jest opcjonalnym poziomem gęstości oporu (<c18/>, <c19/>; domyślnie pozostaje statyczny model Vallado). To sprawdza port, a nie dokładność modelu względem zmierzonej gęstości. Słońce i Księżyc z DE440 (DE: Development Ephemeris) to opcjonalny poziom efemeryd (<c20/>). Cień SRP spłaszczonej Ziemi WGS-84 jest opcjonalny (<c21/>) i zgadza się ze współczynnikiem oświetlenia Orekit { "12.2" } w granicach { "7.4e-9" } na { "2400" } geometriach (<c22/>); jego wariant z pociemnieniem brzegowym nie ma zewnętrznej wyroczni (MODELLED). Poziom oporu NRLMSISE-00 zgadza się z własnym oporem NRLMSISE-00 w Orekit { "12.2" } przez { "24" } h z dokładnością { "0.03" } m przy przemieszczeniu od oporu do { "142" } km (<c23/>, VALIDATED przy wspólnych konwencjach). Kontrola krzyżowa z GMAT (General Mission Analysis Tool) pozostaje zadaniem następczym.

seg-46d06796e0e4 = Pływy na geopotencjale (<c1/>)

seg-81b18c4caad3 = Zależne od czasu poprawki ΔC̄_nm, ΔS̄_nm do współczynników Stokesa (IERS Conventions { "2010" }, Rozdział { "6" }), sprawdzone względem opublikowanych liczb samych konwencji — a nie względem innego narzędzia.

seg-78dc5baf4d9d = Wkład

seg-7c6c910bbf89 = Pływ stały Ziemi (IERS równ. { "6.6" } / 6.8b / { "6.14" })

seg-ac1dbcc895f0 = <c1/>: stały (zerowej częstotliwości) pływ ΔC̄₂₀ ląduje w granicach { "1" } % opublikowanej przez IERS wartości −{ "4.1736" }×{ "10" }⁻⁹ (anelastyczne liczby Love'a); <b>przykład rozwiązany Step-2 K1 jest odtworzony co do bitu</b> (amplitudy sin/cos { "470.9" } / −{ "30.2" } ×{ "10" }⁻¹² z dokładnością { "0.1" }×{ "10" }⁻¹²); ścieżka znormalizowanych wielomianów Legendre'a jest przypięta zamkniętymi ręcznymi wartościami niezależnymi od rekurencji.

seg-f2e2c5334721 = Pływ oceaniczny (IERS równ. { "6.15" }, FES2004 (atlas pływów Finite Element Solution { "2004" }), { "8" } składowych)

seg-0369f153806f = Dołączony podzbiór FES2004 (<c1/> → <c2/>, parsowanie Doodson→mnożnik) odtwarza dokładnie współczynniki źródłowe M2 ({ "2,2" }); faza Doodsona K1 równa się θ_g + π; wielkość sektorialna stopnia 2 jest fizyczna i o rząd mniejsza od pływu stałego.

seg-52a19a291a41 = Atmosferyczny pływ powietrzny S2 (Ray { "2001" }, NASA (National Aeronautics and Space Administration) GSFC (Goddard Space Flight Center))

seg-86b3d3a39bc7 = Dołączone harmoniki Raya przeliczane przez relację obciążenia powierzchniowego (równ. { "6.21" }) dają szczytowe ΔC̄₂₂ ≈ { "4" }×{ "10" }⁻¹¹ (~{ "10" } % członu oceanicznego M2). Uczciwe zastrzeżenie: <b>nie istnieje opublikowana wyrocznia współczynników geopotencjału dla pływu powietrznego</b>, więc jest on sprawdzony przez integralność źródła + wielkość, czyli słabszy próg niż pływy stałe/oceaniczne.

seg-63ac45ba51dc = Manewry i projektowanie trajektorii (<c1/>)

seg-a2ff4b0619d4 = Impulsowe ΔV + propagacja kowariancji

seg-12f469864d28 = Nieciągłość prędkości z przenoszoną dalej kowariancją { "6" }×{ "6" } (deterministyczny impuls ⇒ tożsamościowa STM (macierz przejścia stanu); kowariancja błędu wykonania obraca się z układu impulsu — ECI (inercjalny związany ze środkiem Ziemi) lub LVLH (lokalna pionowa, lokalna pozioma) — do bloku prędkości).

seg-f3f0e4a7ec05 = Całkowanie ze skończonym impulsem względem Ciołkowskiego

seg-f7b35b7acdba = Całkowanie ze stałym ciągiem na łuku impulsu (masa jako stan), którego osiągnięte ΔV zgadza się z zamkniętym równaniem rakiety <b>Ciołkowskiego</b> z dokładnością <b>lepszą niż { "0.01" } %</b>.

seg-46ae334a0604 = Solver Lamberta (Izzo { "2015" }) w obie strony

seg-3e2b483cd1b7 = Wynik Lamberta dla jednego obrotu (<c1/>, <c2/>, czas lotu ⇒ <c3/>, <c4/>) jest <b>przepuszczony w obie strony przez dokładny propagator Keplera w zmiennych uniwersalnych</b> — musi wylądować z powrotem w <c5/>.

seg-04d69337acb3 = Przegląd porkchop względem progu Hohmanna

seg-fb5298b7983c = Minimum siatki C3 startu × przylotu / V∞ przylotu jest sprawdzane względem <b>analitycznego progu C3 transferu Hohmanna</b> dla dwóch współpłaszczyznowych orbit kołowych.

seg-bf2eb36e3eb6 = Solver Lamberta względem niezależnej biblioteki

seg-40511ea76e12 = <c1/>: { "13" } transferów jednoobrotowych od LEO przez GEO do heliocentrycznych, ruchem prostym i wstecznym, względem lamberthub { "1.0.0" } <c2/>; najgorsza różnica prędkości brzegowej { "7e-12" } m/s.

seg-164d7ea14d4e = Uczciwy zakres: brak optymalizatora trajektorii, brak wieloobrotowych gałęzi Lamberta oraz syntetyczny współpłaszczyznowo-kołowy model heliocentryczny (bez planetarnych efemeryd DE, więc kontrola krzyżowa C3 Ziemia–Mars z GMAT nie została wykonana).

seg-9d2d78ad22c4 = Wyznaczanie orbity (OD) (<c1/>, <c2/>)

seg-95d5ac7f6c29 = Wsadowy korektor Gaussa–Newtona

seg-3fe29c4621b2 = Ogólny solver <c1/> osiąga dokładne rozwiązanie ważonych najmniejszych kwadratów dla dopasowania liniowego, odzyskuje prawdziwe parametry w dopasowaniu nieliniowym <c2/> i rozwiązuje multilaterację odległości 3-D z odległości bezszumowych.

seg-b31d1ffa99b1 = Wsadowe wyznaczanie orbity z odległości

seg-0b37139dffa9 = <c1/> odzyskuje <c2/> ze śledzenia odległości ze stacji naziemnych (propagowanych modelem sił dwóch ciał + J2) z dokładnością <b>poniżej metra / mm·s⁻¹ z odległości bezszumowych</b> i <b>~{ "2" } m z resztą po dopasowaniu na poziomie szumu { "5" } m</b> — sygnaturą spójnego dopasowania najmniejszych kwadratów.

seg-fb29199bf8bd = Sekwencyjne OD (filtr unscented)

seg-3c1f33052d48 = <c1/> rekurencyjnie odzyskuje stan w granicach dziesiątek metrów przy tej samej dynamice i modelu odległości.

seg-7a636cc9eef0 = Wsadowe i sekwencyjne OD względem niezależnego estymatora

seg-68bf6e73c582 = <c1/>: { "8" } scenariuszy ({ "6" } bezszumowych LEO/MEO/ekscentrycznych z { "3" }–{ "4" } stacjami, { "2" } przy σ = { "5" } m) względem wsadowych estymatorów najmniejszych kwadratów i Kalmana z Orekit { "12.2" } na dopasowanym modelu sił; najgorszy wsadowy { "1e-3" } m / { "1e-6" } m/s, sekwencyjny { "0.9" } m.

seg-55a86bc79831 = | Wsadowe OD z prędkości zmiany odległości / az-el z maską elewacji | <c1/> (porównanie zewnętrzne, jeden zarejestrowany z góry próg niespełniony) | <c2/>: { "8" } scenariuszy względem wsadowych najmniejszych kwadratów Orekit { "12.2" } z własnymi chwilowymi pomiarami geometrycznymi; zbiory widoczne identyczne, wartości pomiarów w granicach { "5.8e-8" } m / { "6.3e-10" } m/s / { "1.4e-13" } rad, macierz przejścia stanu w granicach { "1.2e-14" }, stany zaszumione w granicach { "1.74" } cm, a RMS na typ w granicach { "2.7e-4" }; zarejestrowany z góry próg stanu bezszumowego ≤ { "1" } cm jest niespełniony w { "2" } z { "4" } scenariuszy ({ "1.46" } i { "1.74" } cm; własne oszacowanie Orekit leży tak daleko od jego symulowanej prawdy, a kshana w granicach { "1e-8" } m). Zob. <c3/>. |

seg-35a85fb744cd = Uczciwy zakres: dydaktyczne OD używa stałych stacji inercjalnych, sferycznego topocentrycznego układu Ziemi i chwilowych pomiarów geometrycznych (bez czasu światła, aberracji, refrakcji ani obrotu Ziemi); macierz przejścia stanu dla ścieżki prędkości zmiany odległości/kątów jest wariacyjna (całkowana RK4 z analitycznymi pochodnymi dwóch ciał + J2), a nie w postaci zamkniętej; nie ma filtra sekwencyjnego dla prędkości zmiany odległości ani kątów. Ścieżka tylko odległości zachowuje swój jakobian różnic skończonych. (Silnik dopasowywania efemeryd z pełnymi siłami poniżej niesie własną wariacyjną macierz przejścia stanu.)

seg-8f425e278f7c = Sprawdzanie modelu sił przez dopasowywanie efemeryd (<c1/>)

seg-9207d7139b87 = Precyzyjny estymator wsadowych najmniejszych kwadratów obserwacji pozycji z pełnymi siłami: geopotencjał tesseralny EGM2008 (obliczany w układzie związanym z Ziemią przez redukcję CIO) złożony z trzecim ciałem Słońce/Księżyc, SRP, oporem, GR (ogólna teoria względności) Schwarzschilda/Lense–Thirringa i powyższymi pływami, dopasowany do śladu inercjalnych poprawek pozycji z jakobianem wariacyjnej macierzy przejścia stanu. Sprawdzony na danych <b>syntetycznych</b>, gdzie prawdą jest własny całkowacz Kshana, więc każda reszta jest resztą estymatora, a nie dynamiki.

seg-fc676106563e = Precyzyjne złożenie modelu sił

seg-57726d970436 = <c1/>: pole stopnia 0 jest dokładną masą punktową w każdej epoce (człon centralny jest niezmienniczy względem obrotu); stopień 8 dodaje spłaszczenie w paśmie J2; trzecie ciało Słońce i człon pływowy są podłączone wiernie co do bitu; stałe radialne przyspieszenie empiryczne jest czysto radialne w RTN (radialny, poprzeczny, normalny).

seg-98b036354077 = Wariacyjna macierz przejścia stanu

seg-71787d9334db = Każda kolumna Φ na półorbicie LEO (geopotencjał stopnia 8 + Słońce + Księżyc) zgadza się z niezależną ponowną propagacją <b>centralnych różnic skończonych (FD) na całym łuku</b> z dokładnością <b>< { "1" }×{ "10" }⁻⁶ względnej</b> zarówno w odpowiedzi pozycji, jak i prędkości — udokumentowana kontrola krzyżowa STM↔FD. Φ({ "0" }) = I; propagatory rozszerzony i zwykły zgadzają się z dokładnością poniżej milimetra.

seg-0b453776136b = Samoodzyskanie przez batch-LS

seg-c651db308332 = 1-godzinny łuk Kshana (stopień 6 + Słońce + Księżyc) obserwowany bez szumu jest odzyskiwany z przesunięcia { "150" } m / { "0.1" } m·s⁻¹ do <b>stanu epoki w granicach { "1" }×{ "10" }⁻² m</b> z bliską zeru resztą po dopasowaniu; przy białym szumie { "5" } m 3-D RMS po dopasowaniu ustala się na <b>poziomie szumu ~σ</b>, bez obciążenia. SRP <b>C_R jest odzyskane z { "1.0" } w granicach { "1" } %</b> prawdziwej wartości { "1.4" }.

seg-06bd2857f832 = Edycja wartości odstających i raportowanie RTN

seg-8b9dea5c0727 = Rażący błąd { "500" } m jest odrzucany przez edycję po dopasowaniu 5-σ (dokładnie jedna obserwacja), pozostawiając czyste dopasowanie na poziomie milimetrów; reszty są raportowane w rozkładzie na radialną/poprzeczną/normalną, a także 3-D.

seg-e3969a15df96 = Poziom przyspieszeń empirycznych (stałe RTN + 1-CPR (CPR: cykl na obieg))

seg-c46af7926511 = Dziewięć parametrów empirycznych z ograniczeniem a priori pozostaje poniżej { "1" }×{ "10" }⁻⁸ m·s⁻² na prawdzie wolnej od empirii, bez zaburzania dopasowania; stałe przyspieszenie poprzeczne { "3" }×{ "10" }⁻⁸ m·s⁻² wstrzyknięte do prawdy jest odzyskiwane w granicach { "20" } %.

seg-fd79199b52d1 = Uczciwy zakres: fala syntetyczna używa nominalnych parametrów orientacji Ziemi (EOP: UT1 (czas uniwersalny { "1" }, czas obrotu Ziemi) ≈ TT (czas ziemski), bez ruchu bieguna) — dokładnych dla samoodzyskania, ponieważ ten sam model generuje i dopasowuje łuk. Walidacje na zbiorach danych agencji nakładają <b>rzeczywiste</b> EOP finals2000A i prawdę SP3/SPK (SPK: jądro efemeryd planetarnych) na ten silnik przez łańcuch układów CIO (<c1/>, <c2/>, <c3/>, <c4/>).

seg-934f0f8e4f5f = Rzeczywiste precyzyjne orbity agencji (<c1/>, <c2/>, <c3/>)

seg-721a27294813 = Galileo MEO — < { "5" } m GREEN

seg-14a2999d0739 = Pełny silnik sił Kshana dopasowany do dosłownego wycinka <b>własnej orbity finalnej ESA/ESOC (ESOC: Europejskie Centrum Operacji Kosmicznych)</b> (<c1/>, ITRF (International Terrestrial Reference Frame)) dla Galileo <b>E11</b> przez { "8" } h, z każdą poprawką ITRF obróconą do GCRS z rzeczywistymi EOP finals2000A: <b>3-D RMS po dopasowaniu { "0.133" } m</b> dla czystych sił + <c2/> (RTN 0.105/0.067/0.047 m, <c3/> { "1.174" }), <b>{ "0.070" } m</b> z poziomem empirycznym, z surowego nakładania { "78.7" } km. Pełny łuk { "24" } h to <b>{ "0.611" } m</b>. Wszystko z dużym zapasem poniżej progu { "5" } m. Pole zbieżne grawitacyjnie przy d/o-8 (identyczne przy d/o 8/10/12); zadanie <c4/> uruchamia pełne d/o-70. Pochodzenie + SHA-256 (SHA: Secure Hash Algorithm) w <c5/>; pełny zapis w <c6/>.

seg-d5ed0783432e = Swarm-A LEO — < { "5" } m GREEN

seg-403b15ec1b9b = Pełny silnik sił (+ opór atmosferyczny) dopasowany do dosłownego wycinka <b>własnej zredukowanodynamicznej precyzyjnej orbity Swarm-A z ESA</b> (<c1/>, L47, ITRF, ~{ "430" } km, ~{ "2" } cm) przez { "3" } h przy d/o-70, z rzeczywistymi EOP finals2000A przez łańcuch CIO: poziom <b>dynamiczny</b> (tylko stan, gęstość statyczna, <c2/>={ "1" }) <b>3-D RMS po dopasowaniu { "2.687" } m</b> (RTN 0.925/<c3/>/0.045 m — reszta ≈ czysty opór wzdłuż toru), poziom <b>zredukowanodynamiczny</b> (+ empiryczne przyspieszenia CPR) <b>{ "0.098" } m</b> (RTN 0.026/0.092/0.025 m) — ~{ "10" } cm wobec orbity ESA ~{ "2" } cm. Pochodzenie + SHA-256 w <c4/>; pełny zapis w <c5/>.

seg-3be5a6bee187 = Księżyc LRO (Lunar Reconnaissance Orbiter) — sprawdzone względem niezależnego wzorca, powyżej { "5" } m (uczciwie)

seg-d2be90186a89 = Dopasowanie modelu sił <b>wokół Księżyca</b> (<c1/>): pole grawitacyjne GRAIL <b>GRGM660PRIM</b> (d/o { "100" }) w księżycowym układzie głównych osi związanym z ciałem (<c2/>, średni układ Ziemia–Księżyc IAU { "2015" } + stałe przesunięcie DE421 (Development Ephemeris { "421" }) od średniej Ziemi do osi głównych (ME→PA), stosowane tak, jak definiuje je SPICE od { "0.36" }: dotąd było stosowane w złym kierunku, o około { "208" }″ obok) + trzecie ciało Ziemia/Słońce, dopasowane przez <em>ten sam</em> ogólny estymator Gaussa–Newtona co zbiory danych Ziemi do rzeczywistej zrekonstruowanej orbity <b>JPL Horizons LRO</b> (NAIF −{ "85" }), { "4" } h / { "241" } epok, ~{ "98" } km. Uczciwe wartości po dopasowaniu ({ "0.36" }): <b>dynamiczne { "12.05" } m</b> (RTN 2.91/10.11/5.88), <b>zredukowanodynamiczne { "6.67" } m</b> (RTN 3.41/4.58/3.44, empiria { "1" }+2 na obieg), z surowego nakładania { "39.9" } m (przed poprawką ME→PA: { "12.6" } m, { "6.65" } m, { "53.8" } m) — <b>powyżej</b> progu < { "5" } m, a nie wina estymatora (identyczne przy d/o 100/150 i <c3/> 1e-6/1e-9). <b>Kontrola krzyżowa klasy DE</b> (<c4/>: księżycowa orientacja osi głównych DE440 (Development Ephemeris { "440" }) + efemerydy DE440 przez ANISE) <b>skorygowała</b> twierdzenie o czynniku ograniczającym — dała { "12.0" } m dynamicznie i { "6.67" } m zredukowanodynamicznie, co poprawiony stos analityczny teraz odtwarza na obu poziomach (wcześniejsza luka dynamiczna, { "12.6" } → { "12.0" } m, była błędem przesunięcia ME→PA), więc podłoga operacyjna <b>nie</b> jest analityczną orientacją/efemerydami, lecz nieredukowalną na poziomie empirycznym resztą (najbardziej zgodną z niemodelowaną niegrawitacyjną dynamiką LRO na krótkim łuku); szczupły stos analityczny już dorównuje klasie DE dla orbity zredukowanodynamicznej. Pochodzenie + SHA-256 w <c5/>; pełny zapis w <c6/>. <b>Sprawdzone względem rzeczywistej prawdy agencji: { "3" } z { "3" }; spełniające < { "5" } m: { "2" } z { "3" }.</b>

seg-3d3cbf5f043d = Nawigacja z mapą grawitacyjną / alt-PNT (<c1/>, <c2/>, <c3/>, <c4/>)

seg-89f2cbf55842 = Pole anomalii grawitacyjnych w postaci harmonik sferycznych

seg-76cae5c530f2 = <c1/>: pole niskiego stopnia, w pełni znormalizowane, sprawdzone względem funkcji Legendre'a w postaci zamkniętej (<c2/>, <c3/>, <c4/>) oraz wyprowadzonej ręcznie anomalii jednego składnika o wartości { "1.897" } mGal.

seg-f00f82b70e6e = Model pomiaru grawimetru z zimnymi atomami

seg-49090598c525 = Poziom szumu białego wyprowadza się z ASD akcelerometru CAI (<c1/>) i wstrzykuje jako deterministyczny ciąg zależny od ziarna (dopasowywanie nigdy nie otrzymuje prawdy bez szumu, a przebieg mimo to jest odtwarzalny co do bitu).

seg-0556db62c45f = Filtr cząsteczkowy z sekwencyjnym ważeniem i resamplingiem

seg-3df4251aedbd = <c1/>: deterministyczny rdzeń jest ustalony dokładnie: ESS (efektywna liczebność próby) w zakresie { "1" }…N, resampling systematyczny wybierający indeksy proporcjonalnie do wagi, kombinacja wypukła w średniej ważonej, gaussowska funkcja wiarygodności przyciągająca estymatę do pomiaru oraz determinizm kroku predykcji przy danym ziarnie.

seg-7dca80b16a00 = Wiarygodność dopasowania do mapy i odzyskiwanie pozycji

seg-eb40ab2607ae = <c1/>: <c2/> osiąga maksimum (= { "1" }) przy idealnym dopasowaniu, a przy jednym sigma spada do <c3/>; filtr cząsteczkowy na wyrazistym fragmencie syntetycznego terenu odzyskuje prawdziwą pozycję z dokładnością do { "0.1" }.

seg-446d9f03a860 = Benchmark 60 minut bez GPS

seg-ed29fb24d9d5 = <c1/> (<c2/>): utrata sygnału na ~{ "700" } km / jedną godzinę, podczas której rozwiązanie inercyjne dryfuje do <b>≈ { "70" } km</b>, zostaje odzyskana do <b>≈ { "145" } m (< { "500" } m)</b> przez hierarchiczny algorytm dopasowania od zgrubnego do dokładnego, odtwarzalny co do bitu, stabilny dla różnych realizacji szumu i dowodnie ograniczony rozdzielczością (pojedyncza zgrubna siatka zatrzymuje się na ~{ "2" } km).

seg-81a2963c26cc = Wczytywanie plików <c1/> z SRTM (Shuttle Radar Topography Mission) jako DEM (cyfrowy model wysokości) i próbkowanie dwuliniowe (WYROCZNIA A)

seg-5e7bbf951faf = <c1/> / <c2/>: ręcznie zbudowany bufor <c3/> o rozmiarze { "2" }×{ "2" } z narożnikami [{ "100,200" };{ "300,400" }] daje w interpolacji dwuliniowej <b>dokładnie { "250.0" }</b> w środku komórki (wyrocznia w postaci zamkniętej), 16-bitowy zapis i odczyt big-endian jest dokładny, a odwrócenie wierszy umieszcza najbardziej północny wiersz pliku na najwyższej zapisanej szerokości geograficznej; wszystko to względem <b>specyfikacji sterownika SRTMHGT (format plików wysokości Shuttle Radar Topography Mission) w GDAL (Geospatial Data Abstraction Library)</b> (16-bitowe liczby ze znakiem, big-endian, wierszami, pierwszy wiersz północny, wartość pusta -32768, <a1>https://gdal.org/en/stable/drivers/raster/srtmhgt.html</a1>). Zatwierdzony do repozytorium wzorzec { "11" }×{ "11" } (<c4/>) sprawdza parser w CI; a <b>zatwierdzony do repozytorium rzeczywisty kafelek SRTM v3 z NASA/USGS (USGS: United States Geological Survey), należący do domeny publicznej</b> (N36W117, Dolina Śmierci, zredukowany do 6 sekund łuku, { "722" } KB, <c5/>), jest odczytywany w CI (nieignorowany, <c6/>) i umieszcza <b>Badwater Basin na ≈ −{ "78" } m w udokumentowanym przedziale [−{ "95" },−{ "70" }] m</b> (pomiar NGS/NOAA (NGS: National Geodetic Survey; NOAA: National Oceanic and Atmospheric Administration) ≈ −{ "86" } m), przy maksimum kafelka ≈ { "2161" } m; źródłem prawdy jest pomiar geodezyjny, a testowany jest DEM (bez cyklicznej zależności). Większe opublikowane wysokości punktowe (Mount Whitney { "4421" } m) pozostają w testach pełnych kafelków za bramką <c7/>.

seg-80f985ea3e11 = Zbieżność nawigacji odniesionej do terenu (TERCOM/SITAN (TERCOM: terrain contour matching; SITAN: Sandia Inertial Terrain-Aided Navigation)) (WYROCZNIA B)

seg-9ad7bf3a8c3e = <c1/> (<c2/>): <b>wyprowadzony ręcznie</b> wstrzyknięty dryf INS ({ "0.5" }°N, −{ "0.4" }°E ≈ { "70" } km na ~{ "12" }° szer., obliczony jako dryf° × M_na_stopień × cos szer.) zostaje odzyskany do <b>< { "500" } m</b> (w granicach dolnego progu rozdzielczości siatki <c3/>), czyli ponad { "100" }-krotne zmniejszenie względem swobodnej inercji; sprawdzone względem <em>wstrzykniętej</em> wartości, nigdy względem DEM (bez cyklicznej zależności), odtwarzalne co do bitu i stabilne dla różnych ziaren szumu.

seg-5b7c1dc72436 = Zysk z połączenia grawitacji, magnetyzmu i terenu (WYROCZNIA C)

seg-7e3818f2ee2b = <c1/> (<c2/>): trzy kanały skalarne (Δg · anomalia skorupowa |B| · wysokość) połączone jako iloczyn funkcji wiarygodności dają <b>ograniczony błąd poniżej { "500" } m</b> w 60-minutowej utracie sygnału, który po uśrednieniu po ziarnach jest <b>nie gorszy niż najlepszy pojedynczy kanał</b> (addytywność informacji / niższa granica CRLB (dolna granica Craméra–Rao)). Mieści się w opublikowanym zakresie „kilkudziesięciu metrów” CEP (promień błędu kołowego prawdopodobnego) dla TERCOM / nawigacji odniesionej do terenu (TRN) (<a1>https://en.wikipedia.org/wiki/TERCOM</a1>; PeerJ { "2024" } ESKF-TERCOM (ESKF: filtr Kalmana stanu błędu), <a2>https://peerj.com/articles/cs-3118/</a2>).

seg-fe23ff839bce = Uczciwy zakres: pole grawitacyjne to niski stopień plus syntetyczne maskony, <b>a nie</b> pełny zestaw współczynników EGM2008/EIGEN (EIGEN: European Improved Gravity model of the Earth by New techniques); kanał magnetyczny opiera się na gładkim głównym polu IGRF oraz <b>syntetycznych</b> maskonach anomalii skorupowych (rzeczywista mapa skorupy o wysokiej częstotliwości to dalszy krok); pole terenu w CI dla benchmarków <em>poprawki nawigacyjnej</em> to samodzielny syntetyczny DEM, natomiast sam czytnik <c1/> jest już walidowany w CI względem zatwierdzonego do repozytorium rzeczywistego kafelka SRTM v3 (powyżej); rzeczywiste kafelki w pełnej rozdzielczości pozostają za bramką <c2/>. Monte Carlo błędu reprezentacji mapy pozostaje dalszym krokiem. Wszystkie trzy nawigatory są już podłączone do silnika scenariuszy przez <c3/> (<c4/>, <c5/>, <c6/>).

seg-d9f7e199e5d0 = Model błędów INS / IMU: walidacja względem kart katalogowych (<c1/>)

seg-48266c2faaed = Stochastyczny model błędów IMU jest sprawdzany względem <b>opublikowanych specyfikacji z kart katalogowych producentów i zbiorów danych</b>, nigdy względem wartości wytworzonej przez samą Kshana. Pomostem od specyfikacji w jednostkach polowych do modelu szumu w SI (International System of Units) jest standardowa identyfikacja odchyleniem Allana (Riley, NIST SP { "1065" } §{ "5" }; IEEE (Institute of Electrical and Electronics Engineers) Std { "952" }): współczynnik błądzenia losowego <c1/> to nakładające się ADEV odczytane przy τ = { "1" } s na nachyleniu τ⁻¹ᐟ², a współczynnik niestabilności biasu to płaski płaskowyż Allana (<c2/>, hermetycznie, bez pobierania).

seg-702de63000d2 = Dowód / wyrocznia

seg-c3fed48b98b1 = Warstwa przeliczania jednostek (ryzyko cykliczności nr 1)

seg-6cdc88d36bfd = Sprawdzone ręcznie: { "0.15" } deg/√hr = { "4.3633e-5" } rad/√s; { "3.6" } µg = { "3.5304e-5" } m/s²; { "2.0" } deg/hr = { "9.6963e-6" } rad/s.

seg-75afa5abcd08 = Błądzenie losowe kąta żyroskopu

seg-d5fd60857e4d = ADIS16465 ARW { "0.15" } deg/√hr (karta katalogowa Analog Devices) odzyskane z ADEV({ "1" } s) z błędem poniżej { "5" }%.

seg-c5e2d361b83f = Błądzenie losowe prędkości akcelerometru

seg-4413d3bb39b4 = ADIS16465 VRW { "0.1" } m/s/√hr odzyskane z błędem poniżej { "5" }%.

seg-ebeb0bb0e0fb = Nachylenie Allana dla szumu białego

seg-f674ce82dc2c = Nachylenie log-log gałęzi białej ADIS16460 −{ "0.5" } ± { "0.05" }.

seg-40afd130f31d = Płaskowyż niestabilności biasu w trakcie pracy

seg-94acb18a94cb = Niestabilność biasu (BI) żyroskopu ADIS16465 { "2.0" } deg/hr odzyskana jako płaskie minimum Allana z błędem poniżej { "15" }%.

seg-b359e0e92e20 = Drugi profil IMU

seg-1a304949bcf9 = NaveGo ADIS16488 (ARW { "0.3" } deg/√hr, VRW { "0.029" } m/s/√hr), oba odzyskane z błędem poniżej { "5" }%.

seg-fea9287d6533 = Uczciwy zakres: sprawdzany jest <b>stochastyczny model błędów</b> względem współczynników Allana z kart katalogowych. Zbiór danych pojazdu i2Nav-WHU (WHU: Wuhan University) <b>KF-GINS</b> służy jako odrębna kontrola uzależniona od danych: słabo sprzężony EKF stanu błędu w zamkniętej pętli, z modelem ramienia dźwigni GNSS, jest wierszem VALIDATED w <a1>macierzy weryfikacji</a1> (<em>Słabo sprzężony EKF GNSS/INS z ramieniem dźwigni na zbiorze danych KF-GINS</em>), porównanym z referencyjną trajektorią C++ z KF-GINS względem progów zarejestrowanych przed przebiegiem. Działa tylko tam, gdzie dostarczono zbiór danych (<c1/>); bez niego uruchamiane są testy syntetycznego loadera i ramienia dźwigni. Warianty ściśle sprzężone i z fazą nośnej nie są objęte tym wierszem (wiersz ściśle sprzężonego GNSS/INS z fazą nośnej to MODELLED).

seg-f0ab98c1a79d = PNT w głębokiej przestrzeni kosmicznej i na Marsie: fundament D0 (<c1/>, <c2/>, <c3/>, <c4/>, <c5/>)

seg-bd222b27949c = Pierwszy kamień milowy silnika nawigacji w głębokiej przestrzeni kosmicznej: uogólnienie rdzenia na stałe związanego z Ziemią do dowolnego ciała centralnego, dodanie dynamiki Marsa, interfejsu dostawcy efemeryd, czasu z dokładnością poniżej mikrosekundy oraz podstawowych funkcji czasu światła i opóźnienia relatywistycznego. <b>Każdy istniejący scenariusz ziemski jest identyczny co do bajtu</b>: wzorce odtwarzalności międzyplatformowej (<c1/>, <c2/>) przechodzą bez zmian, bez ponownego generowania, co jest wymuszane przy każdym commicie.

seg-e0cdbfcbb28a = Abstrakcja ciała centralnego (Ziemia identyczna co do bajtu)

seg-7d20649189fa = <c1/>: <c2/> z <c3/>. <c4/> potwierdza, że <c5/> i <c6/> są równe dawnym funkcjom ziemskim z <b>dokładną równością bitową</b> (<c7/>), a łuk ziemski z domyślnym <c8/> jest identyczny co do bajtu: wzorce odtwarzalności nie zmieniają się (ten sam SHA, bez ponownego generowania).

seg-658acc8112e3 = Grawitacja Marsa (tesseralna GMM-3 (GMM: Goddard Mars Model), w układzie związanym z ciałem)

seg-9b058665cf4b = <c1/>: zonalne C̄20/C̄30/C̄{ "40" } z J2/J3/J4 MRO110 (rozwiązanie grawitacyjne Mars Reconnaissance Orbiter) (<c2/>, J2 po konwersji w obie strony daje { "1.9604e-3" }) oraz sektorialne/tesseralne MRO110B2 C̄22/S̄{ "22" }, C̄32/S̄{ "32" } (Konopliv i in. { "2011" }; zestawione w Liu, Baoyin & Ma { "2012" }), obliczane w układzie IAU związanym z Marsem. <c3/> sprawdza konwersję w obie strony, odchylenie rzędu J2 od masy punktowej oraz to, że pole rzeczywiście jest związane z ciałem (zmiana orientacji o ćwierć doby marsjańskiej zmienia przyspieszenie inercjalne). Wyższy stopień i rząd wczytuje się z dołączonego pliku <c4/> przez <c5/>.

seg-1dcbee768418 = Układ związany z Marsem (biegun IAU)

seg-0708e5b37d69 = <c1/>: obrót IAU 3-1-3 <c2/> (konwencja WGCCRE/NAIF (WGCCRE: Working Group on Cartographic Coordinates and Rotational Elements), taka sama jak w <c3/>). Testy: ortonormalność do { "1e-12" } przy det +{ "1" }, tożsamość po konwersji w obie strony, południk zerowy przesuwa się o <c4/> na dobę.

seg-5b6355a143c7 = Propagacja względem Marsa / Słońca

seg-4ab87f666765 = <c1/> (spójność wewnętrzna)

seg-12e3d173340b = <c1/>: niska orbita marsjańska wraca do punktu startu po jednym okresie keplerowskim (domknięcie); energia właściwa ε=v²/2−μ/r dryfuje o <{ "1e-9" } na łuku; wiekowa regresja węzła z powodu J2 Marsa zgadza się z analityczną wartością Vallado (obliczoną niezależnie ≈ −{ "5.15" } °/dobę przy nachyleniu { "60" }°) z dokładnością { "3" }%; orbita heliocentryczna odtwarza ~687-dniowy rok marsjański (vis-viva + niezależne odzyskanie okresu z łuku). Bez danych zewnętrznych.

seg-acff4c016089 = Walidacja krzyżowa z DE440 (Mars heliocentryczny)

seg-ed164e298754 = <c1/> (wyłączone z workspace; ANISE na licencji MPL-2.0 ograniczone do własnego Cargo.lock; odpowiednik <c2/>): porównuje propagację Marsa względem Słońca w Kshana z JPL DE440 (przez ANISE), z prawdą z Horizons cytowaną dosłownie (pochodzenie + SHA-256). <b>Odtworzony wynik</b> (epoka początkowa JD (data juliańska) { "2459580.5" } TDB (czas dynamiczny barycentryczny), <c3/> SHA-256 <c4/>): residuum pozycji <b>{ "137" } m na łuku 1-dobowym</b> ({ "5.97" }×{ "10" }⁻¹⁰ heliocentrycznej odległości { "2.299" }×10¹¹ m), rosnące do { "3.3" } km po { "5" } d, { "87.9" } km po { "30" } d, { "1.71" } Mm po { "90" } d; residuum <em>rośnie</em> z długością łuku, ponieważ dwuciałowy model względem Słońca celowo pomija zaburzenia planetarne (głównie Jowisza) oraz wewnętrzny ruch układu Marsa, które zawiera barycentryczna efemeryda DE440, więc ten wzrost jest uczciwą sygnaturą niezamodelowanej dynamiki n ciał, a nie błędu integratora; krótki łuk pozostający drobnym ułamkiem odległości heliocentrycznej potwierdza, że mechanizm względem Słońca jest poprawny. Działa tylko wtedy, gdy jądro DE440 jest dostępne (<c5/>, lub pobierane automatycznie ~{ "32" } MB): to ręczna kontrola klasy DE / <c6/>, <b>a nie</b> domyślna bramka CI, więc opublikowany crate i każda domyślna bramka pozostają bez zmian co do bajtu.

seg-a7d79066a53b = Czas światła i opóźnienie Shapiro

seg-798148171dab = <c1/>: iteracyjne rozwiązanie czasu światła w epoce opóźnionej (zbieżne przy |Δτ|<{ "1e-12" } s, z ograniczeniem liczby iteracji) oraz opóźnienie Shapiro Δt=(2μ/c³)·ln[(r1+r2+r12)/(r1+r2−r12)]. Testy: Ziemia–Słońce ≈ { "499" } s i Ziemia–Księżyc ≈ { "1.28" } s przez wbudowaną efemerydę; syntetyczny emiter o stałej prędkości odtwarza analityczne rozwiązanie opóźnione z dokładnością <{ "1e-9" } s (solver dowodnie niezależny od jakiejkolwiek rzeczywistej efemerydy); Shapiro zgadza się dokładnie z wartością policzoną ręcznie i daje ~{ "100" }–{ "250" } µs dla promienia ocierającego się o koniunkcję górną Ziemia–Mars.

seg-1bc28f6bdc8f = Interfejs dostawcy efemeryd

seg-34d6a07ad252 = <c1/>: <c2/> + niewymagające jąder <c3/> (Montenbruck–Gill Słońce/Księżyc, geocentrycznie); zwraca <c4/> dla ciał, dla których nie ma szeregu (np. Mars), a dla nich drogą jest dostawca ANISE klasy DE: ten sam podział na wbudowany i ANISE co w <c5/>/<c6/>.

seg-5e1fed7a98c0 = Czas dwuczęściowy + TT↔TDB

seg-5ebca9b5f2db = <c1/>: <c2/> z akumulacją dwusumy Knutha odzyskuje przedziały poniżej mikrosekundy, które pojedyncza data JD w f64 traci w pobliżu J2000 (>{ "1000" }× lepiej, przetestowane); <c3/>/<c4/> używają dominującego szeregu okresowego Fairheada–Bretagnona (|TDB−TT|≲{ "1.7" } ms, sprawdzone ręcznie w J2000). Rozwiązanie addytywne: istniejąca ścieżka czasu w pojedynczym f64 pozostaje bez zmian.

seg-d2da2e1d1711 = Radiometryczne wielkości obserwowane w głębokiej przestrzeni kosmicznej i CCSDS Tracking Data Message: D1 (<c1/>, <c2/>)

seg-b98f508f2375 = Drugi kamień milowy silnika nawigacji w głębokiej przestrzeni kosmicznej: <b>model wielkości obserwowanych</b>, który zamienia jądro czasu światła i opóźnienia relatywistycznego z D0 w rzeczywiste wielkości, jakie podaje przelot śledzony przez Deep Space Network (DSN) lub ESTRACK (European Space Tracking network): zasięg, dopplera jedno-, dwu- i trójdrogowego, spójne przetwarzanie transpondera, zasięg regeneracyjny/PN (PN: pseudo-noise), Δ-DOR (DOR: differential one-way ranging) oraz ośrodki propagacji, a także wejście/wyjście <b>CCSDS (Consultative Committee for Space Data Systems) 503.0-B Tracking Data Message (TDM)</b>, które wczytuje i zapisuje standardowy plik śledzenia agencji. <b>Uczciwy zakres:</b> są to <b>dokładne modele geometryczne</b> oparte na konwencjach Moyera / CCSDS; <em>szum</em> pomiaru to podawane przez wywołującego <c1/> dla każdej obserwacji, a nie część modelu. Odtworzenie <em>konkretnego rzeczywistego przelotu</em> wymaga rzeczywistych danych TDM oraz solvera wyznaczania orbity w głębokiej przestrzeni kosmicznej: to jest <b>D2</b>, a nie D1. Wszystko poniżej jest addytywne (wzorce odtwarzalności bez zmian; ten sam SHA, bez ponownego generowania).

seg-d1d2dc7906c8 = Zasięg i doppler 1/2/3-drogowy (rozwiązanie dwóch odcinków wg Moyera)

seg-e2176b844df8 = <c1/>: <c2/>/<c3/> składają rozwiązania czasu światła D0 dla odcinka opóźnionego (w dół) i wyprzedzonego (w górę); pełna konwencja drogi tam i z powrotem to <c4/> (m), udokumentowana i spójna. <c5/>/<c6/>/<c7/> tworzą przesunięcie nośnej <c8/> (Hz) z prędkości zmiany zasięgu wzdłuż linii widzenia, <b>konwencja znaku: zbliżający się statek kosmiczny daje dodatnie (niebieskie) przesunięcie</b>. Testy: zasięg dwudrogowy = suma odcinków z dokładnością <{ "1" } mm (~{ "2" } AU w obie strony Ziemia–Słońce); zasięg jednodrogowy = <c9/> dokładnie; doppler jednodrogowy zgadza się z analitycznym <c10/> dla radialnego emitera o stałej prędkości z dokładnością do ppt; trójdrogowy ze stacjami w tym samym miejscu redukuje się co do bajtu do dwudrogowego.

seg-638697be5b5b = Spójne przetwarzanie transpondera (dokładne współczynniki DSN)

seg-781aa4041c58 = <c1/>: dokładne wymierne liczby przetwarzania DSN/CCSDS <c2/> (Moyer §{ "13" }; DSN 810-005 moduł 201/214): S/S 240/221, S/X 880/221, X/S 240/749, X/X 880/749, X/Ka 3344/749, Ka/Ka 3360/3599. Testowane na dokładną równość; niezdefiniowana para pasm powoduje <b>panikę</b> (głośna awaria, nigdy wymyślanie współczynnika). <c3/> stosuje nośną pasma i współczynnik od początku do końca i jest równe jawnemu <c4/> z dokładnością maszynową.

seg-f24f9da1570c = Zasięg regeneracyjny / PN (CCSDS { "414" }; niejednoznaczność)

seg-1abd8c221e8d = <c1/>: <c2/> = <c3/> (jednoznaczny zasięg w skali rozdzielczości na chip) oraz <c4/> = to razy długość kodu (pełny jednoznaczny zasięg kodu PN <c5/>), wg CCSDS 414.1-B. Testowane: zegar zasięgu { "1" } MHz daje ~{ "149.9" } m; kod PN CCSDS-414.1 z ważonym głosowaniem ({ "1 009 470" } chipów) przy { "1" } Mchip/s daje projektowy zasięg jednoznaczny ~{ "151 000" } km; podwojenie częstotliwości chipów zmniejsza niejednoznaczność na chip o połowę.

seg-16b9fdd916a7 = Δ-DOR (CCSDS { "506" }, płaszczyzna nieba)

seg-93055e944306 = <c1/>: różnicowe opóźnienie w płaszczyźnie nieba <c2/> (s) dla bazy interferometru <c3/> (CCSDS 506.1-B). Testowane: zgodność z dokładnym rzutem analitycznym <c4/> dla znanego przesunięcia wyrównanego z bazą z dokładnością { "1e-15" } s, z wielkością dla małych kątów <c5/> oraz z <b>zerem</b> (statek kosmiczny współliniowy z kwazarem daje dokładnie zerowe opóźnienie różnicowe).

seg-4e5258bb04d5 = Kalibracja plazmy 1/f² w dwóch częstotliwościach

seg-e3b340103825 = <c1/>: <c2/> = <c3/> (dyspersyjne <c4/> opóźnienie grupowe cząstek naładowanych, <c5/>); <c6/> kolumna korony klasy Cassini <c7/> (analityczny zamiennik, nie skalibrowana korona); <c8/> odwrócenie dyspersji <c9/>, którego DSN używa do usuwania plazmy. Testowane: prawo 1/f² <c10/>; korona rośnie w kierunku koniunkcji; a <b>wstrzyknięte TEC zostaje odzyskane z błędem poniżej { "1" } %</b> (w istocie ≪ { "1e-9" } bez szumu): <c11/>.

seg-e1e265ab499a = Ośrodki tropo- / jonosferyczne (ponowne użycie modeli GNSS)

seg-2d9aa52f318b = <c1/>/<c2/>: naziemny segment stacji dla głębokiej przestrzeni kosmicznej przechodzi przez tę samą atmosferę Ziemi, którą pakiet GNSS już modeluje, więc deleguje do <c3/> (zenit Saastamoinena + odwzorowanie Niella, niedyspersyjne) i <c4/> (jonosfera z transmisji). Testowane: podłączenie i fizyczny znak: troposfera dodatnia i większa przy niskiej elewacji niż w zenicie; jonosfera jako nieujemne opóźnienie ukośne (wierność numeryczna to własne testy pakietu GNSS oparte na kartach katalogowych).

seg-44ba6e0411fd = CCSDS-TDM { "503" } parsowanie / zapis + most radiometryczny

seg-18eafe936dcb = <c1/>: czytnik <b>i</b> zapis CCSDS 503.0-B-2 KVN (notacja klucz-wartość) (nagłówek + segmenty <c2/> / <c3/>; rekordy <c4/>/<c5/>/<c6/>/<c7/>). Testy (<c8/> + <c9/>): wzorcowy plik parsuje się do oczekiwanych nazwanych pól; <b>parsowanie→zapis→parsowanie daje równą strukturę</b> (semantyczna konwersja w obie strony); most <c10/> mapuje jednoznaczne rekordy <c11/>/<c12/> na <c13/> (liczba dróg z <c14/> <c15/>/<c16/>/<c17/>, pasmo z <c18/>, km→m); plik wielosegmentowy resetuje automat stanów. <b>Uczciwe pomijanie zamiast zgadywania:</b> kąty/częstotliwości, nieznane pasma, epoki w dniach roku i nierozpoznane skale czasu są <b>pomijane</b>, nigdy błędnie mapowane, a <c19/> pozostaje <c20/>, by wywołujący nadał wagę.

seg-e8ca55dd29b1 = Benchmark DSN/ESTRACK (precyzja modelu ≫ opublikowany próg)

seg-247b9e7b2be8 = <c1/>: wielkości obserwowane to dokładne obliczenia geometryczne, więc uczciwy benchmark polega na tym, że <b>własny błąd numeryczny modelu jest znacznie poniżej opublikowanego progu pomiarowego DSN/ESTRACK</b>: to nie model jest wąskim gardłem dokładności, lecz podawane przez wywołującego σ. Każdy test oblicza wielkość obserwowaną na dwa niezależne sposoby (lub odzyskuje wstrzykniętą prawdę) i sprawdza, że residuum jest poniżej progu: <b>zasięg</b> po konwersji w obie strony <{ "1" } mm ≪ ~{ "1" } m próg zasięgu PN (DSN 810-005 mod. { "214" } / CCSDS 414.1-B); <b>doppler</b> zgadza się z dokładną postacią zamkniętą opóźnionej prędkości zmiany zasięgu <c2/> do ~{ "10" }⁻⁶ m/s, kilkakrotnie poniżej progu ~{ "0.05" } mm/s w paśmie X (DSN 810-005 mod. { "203" } / Moyer); residuum to próg różnicowania zasięgu w f64 przy ~{ "1" } AU, cecha numeryczna, a nie błąd modelowania; <b>Δ-DOR</b> odtwarza rzut w postaci zamkniętej do równoważnego kąta w płaszczyźnie nieba ≪ { "1" } nrad ≪ próg ~{ "1" }–{ "10" } nrad (DSN 810-005 mod. { "210" } / CCSDS 506.1-B); <b>plazma</b> w dwóch częstotliwościach odzyskuje wstrzyknięte opóźnienie z błędem ≪ { "1" } %; a opóźnienie <b>Shapiro</b> mieści się w opublikowanym paśmie ~{ "100" }–{ "250" } µs dla koniunkcji Ziemia–Mars. Opublikowane wartości są podane i opisane jako <b>rzędy wielkości</b> specyfikacji DSN, a nie zmyślone dokładne liczby, a dokumentacja modułu wyraźnie stwierdza, że ten benchmark dotyczy PRECYZJI MODELU, a nie odtworzenia rzeczywistego przelotu (to jest D2 + rzeczywiste TDM).

seg-2a25e6a8a5b1 = Zredukowanie dynamiczne OD w głębokiej przestrzeni kosmicznej: D2 (<c1/>, <c2/>, <c3/>)

seg-0d7a1b75a0ea = Trzeci kamień milowy silnika nawigacji w głębokiej przestrzeni kosmicznej: <b>estymator</b>, który zamienia radiometryczne wielkości obserwowane z D1 w odzyskaną trajektorię: numerycznie odporny pierwiastkowy filtr informacyjny (SRIF, Square-Root Information Filter) z zredukowanymi dynamicznie przyspieszeniami empirycznymi, trójstanowym zegarem pokładowym, modelem oporu Marsa oraz pochodnymi cząstkowymi pomiarów radiometrycznych łączącymi zasięg/dopplera ze stanem filtru, domknięty od początku do końca syntetycznym odzyskaniem orbity w niskiej orbicie marsjańskiej (LMO). <b>Uczciwy zakres:</b> odzyskanie jest <b>syntetyczną pętlą zamkniętą</b> (prawda i filtr używają tego samego propagatora Marsa, a obserwacje to ten sam geometryczny model wielkości obserwowanych, który filtr odwraca, plus wstrzyknięty szum gaussowski): sprawdza <b>mechanizm estymatora</b>, a nie bezwzględną wierność modelu sił Marsa; zewnętrzną kontrolą klasy DE jest crate <c1/> uzależniony od jądra (D0.8b). Wszystko poniżej jest addytywne (wzorce odtwarzalności bez zmian; ten sam SHA, bez ponownego generowania).

seg-51f203291066 = Rdzeń SRIF (pierwiastkowy filtr informacyjny)

seg-9d5fd8c1d37d = <c1/>: ręcznie napisany pierwiastkowy filtr informacyjny Biermana: górnotrójkątna <c2/> z <c3/>, wektor informacji <c4/>, aktualizacje pomiaru/czasu Householdera, arytmetyka na gołym <c5/> (bez nalgebra). Testy: sekwencyjny SRIF zgadza się z rozwiązaniem wsadowym ważonych najmniejszych kwadratów (<c6/>) <b>zarówno w stanie, jak i w kowariancji do { "1e-9" }</b> na zaprojektowanym liniowo-gaussowskim zadaniu (<c7/>); odzyskana kowariancja <c8/> jest <b>symetryczna ({ "1e-12" }) i z konstrukcji dodatnio określona</b> po długiej sekwencji aktualizacji pomiaru/czasu (<c9/>, rozkład Choleskiego się udaje); a informacja się kumuluje (ślad <c10/> maleje monotonicznie w miarę dodawania pomiarów o identycznej geometrii).

seg-f9ffa1ef4688 = Zredukowane dynamicznie przyspieszenia empiryczne (strojenie między lotem a LMO)

seg-b0612a7140c3 = <c1/>: dziewięciostanowy filtr <c2/> z przyspieszeniami empirycznymi RTN jako stanami procesów Gaussa–Markowa pierwszego rzędu, technika zredukowanej dynamiki JPL/ESOC wystawiona jako pojedyncze pokrętło <c3/> (blisko dynamiki ⇒ wygładza szum na łuku balistycznym; blisko kinematyki ⇒ warstwa empiryczna pochłania niezamodelowany manewr/opór). Testy: filtr bliski kinematyce śledzi <b>skokowy manewr (ciąg silnika)</b> z residuum mniejszym niż <½ residuum filtru bliskiego dynamice, natomiast filtr bliski dynamice lepiej <b>wygładza zaszumiony łuk balistyczny</b> (<c4/>); przesuwanie ścisłości zmienia residuum po dopasowaniu <b>monotonicznie</b>, jako kontinuum, a nie przełącznik (<c5/>).

seg-9d5db4d63990 = 3-stanowy zegar pokładowy (faza/częstotliwość/dryf, Q van Loana, Allan)

seg-fe5beef74e24 = <c1/>: stan błędu fazy + ułamkowej częstotliwości + dryfu częstotliwości z <b>dokładnym dyskretnym szumem procesu van Loana</b> i aktualizacją stabilizowaną metodą Josepha. Testy: zdyskretyzowane <c2/> zgadza się z ręcznie wyprowadzonym wielomianem van Loana <b>do { "1e-12" }</b> i <b>redukuje się dokładnie do Q dwustanowego KalmanClock, gdy dryf = { "0" }</b> (ścisły nadzbiór); wieloetapowy wybieg zwiększa wariancję fazy do analitycznej zależności holdover wg NIST SP { "1065" } przez składnik błądzenia losowego <c3/>; stan dryfu <b>odzyskuje prawdziwą rampę starzenia z błędem poniżej { "5" } %</b>; <b>odzyskiwany jest profil Allana klasy USO</b> (nakładające się ADEV przy τ={ "1" } s w granicach bramki kalibracyjnej), a estymator pozostaje spójny w sensie NEES (>{ "95" } % wewnątrz 3σ) i PSD w trakcie przebiegu z ostrym <c4/>. <c5/> zawiera cytowane wartości <c6/> dla CSAC/USO/DSAC (USO: ultra-stable oscillator; DSAC: Deep Space Atomic Clock) oraz próg dopplera <c7/>.

seg-8666d18daa2b = Opór atmosfery Marsa (Mars-GRAM-lite (GRAM: Global Reference Atmospheric Model))

seg-6a64c2b9e553 = <c1/>: kawałkami wykładniczy profil gęstości neutralnej atmosfery Marsa (przy powierzchni ~{ "0.020" } kg/m³, wysokość skali przy powierzchni ~{ "11" } km, niskopyłowa średnia Mars-GRAM { "2010" } / MCD (Mars Climate Database)) oraz kwadratowe przyspieszenie oporu liczone względem <b>współobracającej się</b> atmosfery Marsa, a także wariant <c2/>, który SRIF może mnożyć. Testy: gęstość maleje monotonicznie i ciągle między pasmami, odzyskana wysokość skali przy powierzchni jest fizyczna, ~{ "11" } km, opór jest <b>ściśle antyrównoległy do prędkości względnej</b> (iloczyn wektorowy znika do { "1e-12" }) przy rozsądnej wielkości ~{ "3e-4" } m/s² na LMO i jest liniowy względem członu balistycznego. <b>Uczciwy zakres:</b> reprezentatywna atmosfera inżynierska, a nie zwalidowana w locie Mars-GRAM/MCD z zależnością od pyłu, pory roku i czasu lokalnego.

seg-452f32dace80 = Pochodne cząstkowe pomiarów radiometrycznych (zasięg/doppler) dla SRIF

seg-6661d241cdaf = <c1/> / <c2/>: pochodne cząstkowe zasięgu wzdłuż linii widzenia <c3/> (∂ρ/∂r = û, ∂ρ/∂v = { "0" }) i prędkości zmiany zasięgu <c4/> (∂ρ̇/∂v = û, ∂ρ̇/∂r = (v_rel − ρ̇·û)/ρ), które łączą wielkości obserwowane D1 ze stanem filtru, oraz pochodna cząstkowa częstotliwości zegara dla dopplera jednodrogowego <c5/>. Testy: obie pochodne zgadzają się z <b>centralną różnicą skończoną wielkości obserwowanej do { "1e-6" }</b> (<c6/>, <c7/>); pojedyncza aktualizacja zasięgu <b>zmniejsza kowariancję w obserwowanym kierunku (linii widzenia, LOS) ≫{ "1000" }-krotnie</b> i zachowuje jej dodatnią określoność (PD), a aktualizacja dopplera zmniejsza wariancję <b>prędkości</b> wzdłuż LOS (<c8/>, <c9/>).

seg-9a2cb6292477 = Kompleksowe OD na Marsie (LMO) z danych radiometrycznych

seg-6318968b683a = <c1/>: prawdziwy łuk niskiej orbity marsjańskiej propagowany przy grawitacji <c2/> generuje zaszumiony dwudrogowy <b>zasięg (σ={ "1" } m) + doppler (σ={ "0.1" } mm/s)</b> względem dwóch stacji śledzących; zredukowany dynamicznie SRIF odzyskuje go ze stanu początkowego <b>zaburzonego o ~{ "2.7" } km</b>. Osiągnięto: zbieżne <b>RMS pozycji ≈ { "0.2" } m</b> (poniżej metra, znacznie poniżej kryterium wykonania rzędu metrów do dziesiątek metrów) na łuku 3 orbit z kadencją { "30" } s, przy <b>dodatnio określonej rozłożonej kowariancji w każdej epoce</b> (gwarancja SRIF, sprawdzana przez cały czas). <b>Kontinuum strojenia od lotu do LMO</b> jest sprawdzone od początku do końca: przy prawdzie z niezamodelowanym oporem, którego nie ma szablon filtru, pokrętło zredukowanej dynamiki (ścisłość { "1" }) odzyskuje ~{ "14" } m wobec ~{ "677" } m dla przebiegu bliskiego dynamice (ścisłość { "0" }), czyli { "48" }-krotna poprawa dzięki warstwie empirycznej pochłaniającej opór. <b>Uczciwy zakres:</b> syntetyczna pętla zamknięta (prawda = ten sam propagator, którego używa filtr); zewnętrzną kontrolą klasy DE jest <c3/> uzależnione od jądra (D0.8b), tu nigdy nieuruchamiane, bez sieci.

seg-559176eb1a82 = Scenariusz PNT w głębokiej przestrzeni kosmicznej i fuzja jedno- i dwudrogowa: D3 (<c1/>, <c2/>)

seg-bdb5da496071 = Czwarty kamień milowy silnika nawigacji w głębokiej przestrzeni kosmicznej: uruchamialny <b>produktowy scenariusz Mars-PNT</b>, który wiąże ciało/układ Marsa z D0, radiometryczne wielkości obserwowane z D1 i zredukowane dynamicznie OD z D2 w jeden rodzaj scenariusza <c1/>. Modeluje małą <b>konstelację przekaźnikową w stylu MARCONI</b>, nadającą jednodrogowy (sprzężony z zegarem) sygnał w przestrzeni oraz przekazującą dwudrogowe (spójne, niezależne od zegara) łącze do stacji w głębokiej przestrzeni kosmicznej, i nawiguje trzech użytkowników odniesienia (transfer na Marsa, orbiter na niskiej orbicie marsjańskiej, stały punkt na powierzchni) przez <b>estymator fuzji łączny jedno- i dwudrogowy D3.1</b>, czyli dwunastostanowy SRIF, który rozszerza zredukowany dynamicznie blok orbity/empiryczny z D2 o trójstanowy zegar pokładowy. <b>Uczciwy zakres:</b> każdy wskaźnik jakości to <b>formalna granica kowariancji</b> estymatora (1σ / 3σ pozycji w każdej epoce) oraz osiągnięte RMS względem <b>syntetycznej prawdy w pętli zamkniętej</b> (prawda i filtr dzielą tę samą dynamikę Marsa i ten sam geometryczny model wielkości obserwowanych, plus wstrzyknięty szum gaussowski): symulowany wskaźnik jakości nawigacji, <b>NIE</b> poziom ochrony certyfikowany dla lotnictwa i <b>NIE</b> twierdzenie o locie (brak certyfikowanego modelu usterek, brak monitora integralności, brak rzeczywistych danych śledzenia). Wszystko poniżej jest addytywne (wzorce odtwarzalności bez zmian; ten sam SHA, bez ponownego generowania).

seg-b81920d2df82 = Łączna fuzja radiometryczna jedno- i dwudrogowa (fuzja jest lepsza niż każde łącze osobno)

seg-cd9d2a7dd08f = <c1/>: zredukowany dynamicznie SRIF z D2.2 rozszerzony o trzy stany zegara pokładowego (<c2/>), przyjmujący mieszany szereg czasowy zasięgu/dopplera <b>dwudrogowego</b> (niezależnego od zegara, wiążącego orbitę: zerowe kolumny zegara w pochodnej cząstkowej) i <b>jednodrogowego</b> (sprzężonego z zegarem: pochodna częstotliwości <c3/>) przez <c4/>. Struktura „skalibruj, potem wybiegaj”: przeloty dwudrogowe wiążą orbitę, a dane jednodrogowe kalibrują zegar i prowadzą orbitę między przelotami z błędem ograniczonym stabilnością Allana zegara. Testowane w <c5/> <c6/>: rozwiązanie <b>łączne</b> jest lepsze niż <b>każdy typ łącza osobno</b>; błąd wybiegu przebiegu wyłącznie jednodrogowego rośnie wraz z przerwą między przelotami dwudrogowymi, zgodnie z ograniczeniem Allana dla klasy zegara; łączna kowariancja pozostaje SPD (symetryczna dodatnio określona) przez cały czas.

seg-26a4bfa8e6ad = Konstelacja MARCONI (promień areostacjonarny, zakrycie)

seg-f2c2e1b83411 = <c1/>: zestaw pięciu przekaźników: trzy przekaźniki <b>areostacjonarne</b> na <c2/> (promień synchroniczny Marsa z opublikowanych μ/prędkości obrotu; testowany w przedziale <b>{ "20 400" }–{ "20 500" } km</b>), rozmieszczone równomiernie co { "120" }° długości z nachyleniem { "5" }°, oraz dwa przekaźniki na wyższej ({ "1.4" }× areostacjonarnej) kołowej orbicie o nachyleniu { "60" }° dla pokrycia w płaszczyźnie nieba. Stany przekaźników w każdej epoce są całkowane w przód przy grawitacji <c3/>; test widoczności przy <b>zakryciu przez Marsa</b> to geometria cięciwy omijającej kulę (<c4/>, testowane: przekaźnik po przeciwnej stronie jest zakryty, przekaźnik nad głową jest widoczny). <b>Uczciwy zakres:</b> minimalna reprezentatywna geometria nadawania i przekazywania zbudowana z opublikowanych stałych Marsa, a nie projekt konkretnej konstelacji lotniczej.

seg-b53ea4dd9f7d = Scenariusz <c1/> dostępny przez CLI / Python / WASM (WebAssembly) / MCP (Model Context Protocol)

seg-3a01d13ad2e7 = <c1/> / <c2/> jest podłączone jako scenariusz <c3/> na wszystkich powierzchniach (D3.3): runner CLI, wiązanie Pythona, kompilacja WASM/playground i dyspozytor serwera MCP kierują do niego (test konwersji w obie strony <c4/> <c5/>). Dostarczone scenariusze referencyjne: <c6/>, <c7/>, <c8/>. Wynik zawiera jawne <c9/> opisujące wskaźnik jakości jako granicę kowariancji (a nie certyfikowany PL), a wyjścia <c10/> / <c11/> powtarzają etykietę uczciwości.

seg-28a49a455a74 = Odtworzone cele MARCONI / LightShip: <b>orbiter < { "100" } m</b>, <b>łazik < { "15" } m</b>

seg-28da71940857 = <c1/>: opublikowane cele programu MARCONI / LightShip (orbiter < { "100" } m, powierzchnia/łazik < { "15" } m) odtworzone w symulacji. <b>Wspólne założenia:</b> domyślna pięcioprzekaźnikowa konstelacja MARCONI; każdy przekaźnik w zasięgu widzenia daje w każdej epoce jednodrogowy zasięg + doppler; spójny dwudrogowy przelot stacji co <b>{ "30" } min</b>; szum klasy DSN (<b>σ zasięgu = { "1" } m, σ dopplera = { "0.1" } mm/s</b>); łączny filtr fuzji zredukowanej dynamicznie orbity i 3-stanowego zegara zainicjowany stanem a priori <b>zaburzonym o ~{ "2.7" } km</b> (ścisłość { "0.1" }); wskaźnik jakości = zbieżne RMS pozycji 3-D w drugiej połowie łuku względem syntetycznej prawdy. <b>Orbiter</b> (LMO ~{ "400" } km / nachylenie { "60" }°, zegar <b>USO</b>, kadencja { "60" } s, łuk ~{ "2" } h ≈ jedna orbita): osiągnięte zbieżne RMS <b>≈ { "0.40" } m</b> ≪ cel { "100" } m (średnio { "3.1" } przekaźnika w zasięgu, kowariancja SPD przez cały czas). <b>Łazik</b> (stały punkt na powierzchni przy równiku, zegar <b>USO</b>, kadencja { "30" } s, łuk ~{ "2" } h): osiągnięte zbieżne RMS <b>≈ { "5.1" } m</b> < cel { "15" } m (średnio { "3.0" } przekaźnika w zasięgu, kowariancja SPD). <b>Oba cele osiągnięte bez rozluźniania jakiejkolwiek asercji</b>: USO jest <em>mniej</em> zdolną z realistycznych klas zegara pokładowego (DSAC mógłby tylko pomóc), a dwudrogowa kadencja 30 min jest zachowawcza dla rutynowego harmonogramu sieci przekaźników, więc założenia są fizycznie uczciwe dla systemu klasy MARCONI, a nie dostrojone tak, by przeszły. <b>Uczciwy zakres:</b> symulowane odtworzenie przy podanych założeniach, a NIE twierdzenie o locie ani certyfikowany poziom ochrony; syntetyczna prawda w pętli zamkniętej dzieli z filtrem dynamikę Marsa i model wielkości obserwowanych.

seg-37b2bad62854 = Księżycowy czas współrzędnych: relatywistyczne tempo zegara Ziemia–Księżyc (<c1/>)

seg-787705fa0fac = Księżycowa skala czasu współrzędnych (LTC/TCL (TCL: Temps-Coordonnée Lunaire, francuska nazwa księżycowego czasu współrzędnych)) wymaga wiekowego tempa, w jakim zegar na powierzchni Księżyca chodzi względem zegara na geoidzie ziemskiej (TT). <c1/> oblicza je z zasad pierwszych: pierwsza tożsamość postnewtonowska sumująca <b>różnicę potencjałów własnych</b> (konwencjonalny potencjał geoidy IAU <c2/> <c3/> minus potencjał własny powierzchni Księżyca <c4/>) oraz <b>człon kinetyczny (dopplera drugiego rzędu)</b> <c5/> z geocentrycznej prędkości Księżyca (różnicowanej skończenie z księżycowego szeregu Montenbrucka–Gilla w <c6/>). Dominujący człon potencjału własnego daje <b>≈ { "57.5" } µs/dobę</b>, człon kinetyczny <b>≈ −{ "0.5" } µs/dobę</b>, razem <b>≈ { "57" } µs/dobę</b>. Scenariusz <c7/> podaje to tempo, skumulowane przesunięcie LTC−TT w danym horyzoncie i obsługuje minimalny zespół ważony odwrotnością wariancji (księżycowy zegar papierowy); konwersje TT↔LTC zgadzają się w obie strony z dokładnością < { "1" } ns/dobę.

seg-beeb6561ef6b = Wyrocznia / uczciwy zakres

seg-4500e65ede97 = Relatywistyczne tempo zegara Ziemia–Księżyc (LTC/TCL)

seg-4c7a29bc3003 = <c1/>, <c2/>/<c3/>, <c4/>, <c5/>. <b>Wyrocznia: wewnętrzna relatywistyczna tożsamość w postaci zamkniętej</b> (geopotencjał IAU <c6/> / konwencji IERS oraz potencjał własny GM/r (GM: parametr grawitacyjny, G razy masa)), <b>skontrolowana krzyżowo względem opublikowanego przedziału tempa zegara księżycowego [{ "56" }, { "59" }] µs/dobę</b>. Testy (<c7/>): człon potencjału własnego ≈ { "57.5" } µs/dobę, prędkość Księżyca ≈ { "1" } km/s, człon kinetyczny niewielki i ujemny, suma w przedziale, a wymienione człony sumują się do niej, 1-dobowe przesunięcie LTC−TT ≈ { "57" } µs oraz konwersja TT↔LTC w obie strony z dokładnością < { "1" } ns/dobę. <b>Uczciwy zakres:</b> główna wartość µs/dobę <b>zależy od odniesienia</b>: zależy od wybranych powierzchni odniesienia (geoida ziemska <c8/> a selenoida), od okna uśredniania czasu i od pominiętych poprawek odśrodkowych/J₂ poniżej µs/dobę, dlatego publikowanym wynikiem jest <b>przedział</b>, a nie pojedyncza certyfikowana liczba. To jest kontrola spójności <c9/>, <b>NIE</b> walidacja zewnętrzna, <b>NIE</b> bezwzględna dokładność poniżej nanosekundy i <b>NIE</b> certyfikowane do operacyjnego utrzymywania czasu.

seg-b4e3228c84b8 = Księżycowe geodezyjne VLBI: opóźnienie w polu bliskim dla bazy ziemskiej obserwującej księżycowy radiolatarnię (<c1/>)

seg-bbb634953ebf = Geodezyjna wielkość obserwowana VLBI (interferometria z bardzo długą bazą) dla dwóch stacji naziemnych na Ziemi (baza) obserwujących jednodrogowy sygnał nadajnika klasy NovaMoon na powierzchni Księżyca. Księżyc znajduje się w <b>polu bliskim</b>, a nie jest falą płaską, więc opóźnienie geometryczne to dokładna różnica dwóch odległości <c1/>, a nie rzut na płaszczyznę nieba. Pełna wielkość obserwowana dodaje różnicę przesunięć zegarów stacji i różnicowy człon Shapiro potencjału Ziemi (ponownie użyty z <c2/>). Stacje są umieszczane we współrzędnych geocentrycznych inercjalnych (GCRS) przez <c3/> + <c4/>; latarnia przez <c5/> (Księżyc geocentrycznie) + <c6/> (selenograficzne→MCMF (MCMF: związany z Księżycem, ze środkiem w Księżycu)) + <c7/> (związany z ciałem ME IAU-2015→inercjalny). Scenariusz <c8/> próbkuje opóźnienie, jego tempo różnicy skończonej i poprawkę pola bliskiego w trakcie przelotu.

seg-b2b758337ebc = <b>Wyrocznia</b> to płaskofalowa wielkość obserwowana Δ-DOR z tej samej bazy kodu <c1/> w <c2/>: w granicy pola dalekiego (syntetyczna latarnia w odległości { "1e15" } m) opóźnienie geometryczne musi sprowadzić się do <c3/> z dokładnością maszynową; przy rzeczywistej odległości księżycowej poprawka pola bliskiego z krzywizny czoła fali jest niezerowa (dziesiątki do setek µs). Pochodne cząstkowe latarni <c4/> (i pochodne stacji) są weryfikowane centralną różnicą skończoną (błąd względny < { "1e-5" }).

seg-107b9d328f69 = Opóźnienie księżycowego geodezyjnego VLBI i pochodne cząstkowe

seg-acee0ad60cf4 = <c1/>, <c2/>, <c3/>/<c4/>/<c5/>, <c6/>, <c7/>. <b>Wyrocznia: <c8/></b>: płaskofalowe <c9/> z tej samej bazy kodu (<c10/>) w granicy pola dalekiego, plus <b>pochodne cząstkowe różnic skończonych</b>. Testy (<c11/>): wielkość stacji ≈ promień Ziemi, odległość latarni przy dystansie księżycowym ({ "356" }–{ "407" } Mm), opóźnienie geometryczne w polu dalekim zgadza się z <c12/> z dokładnością < { "1e-9" } s, niezerowa poprawka pola bliskiego przy dystansie księżycowym, pochodne latarni/stacji metodą różnic skończonych w granicach { "1e-5" } względnie, dokładny człon zegara oraz skończony przebieg scenariusza wysłany przez <c13/>. <b>Uczciwy zakres:</b> <c14/>, <b>NIE</b> zwalidowane względem rzeczywistych danych VLBI. Ruch bieguna jest pomijany (<c15/>), więc inercjalne pozycje stacji niosą kilkumetrowy błąd układu; latarnia łączy szereg Księżyca względem średniego równika daty z przesunięciem związanym z ciałem w ICRF (International Celestial Reference Frame) (<c16/>), co jest niespójnością układów poniżej wierności modelu, ale nie jest rygorystyczne; brak iteracji czasu światła, obrotu Ziemi w czasie światła, członów ośrodka (tropo/jono/plazma) i aberracji poza różnicowym Shapiro. Nie twierdzi się nic o TRL (poziom gotowości technologicznej), dziedzictwie lotniczym ani poparciu agencji. { "0.30" }: względem czasów światła ANISE przez DE440 żadne opóźnienie tej ścieżki analitycznej nie mieści się w { "1" } ps (największa różnica { "24" } µs); ustalenie jest przypięte.

seg-d90c67f098f7 = <c1/> (Ziemia i Księżyc z DE440, główne osie księżycowe DE440, orientacja Ziemi ITRF93, każdy czas światła zbieżny w układzie barycentrycznym), uruchamiane przez scenariusz <c2/>, gdy ustawiono trzy ścieżki jąder. <b>Wyrocznia: biblioteka</b> NAIF SPICE Toolkit N0067 (spiceypy { "8.2.0" }) zbieżne czasy światła do DSS-14/43/63, zarejestrowane wstępnie: { "75" } opóźnień w granicach { "1" } ps (najgorsze { "0.06" } ps), pochodne cząstkowe latarni i stacji w granicach { "1e-6" }, w { "25" } epokach w pobliżu J2000 (poprawka po tym, jak { "2024" } epok zawiodło z powodu własnej epoki emisji SPICE w podwójnej precyzji, około { "6" } ps, ujawniona i przypięta). Różnicowy człon Shapiro, tempo opóźnienia i poprawka pola bliskiego w scenariuszu nie są porównywane.

seg-8bed75c5402d = Księżycowe łączne OD wielotechnikowe + zegar: symulowane odzyskanie w pętli zamkniętej (<c1/>)

seg-d518eead07c4 = Jednoepokowe (migawkowe) dopasowanie wsadowe najmniejszych kwadratów (<c1/>, krok QR Householdera od { "0.30" }), które <b>łączy techniki geodezyjnego VLBI, radiometrycznego/księżycowego lokalnego pomiaru zasięgu i pomiaru zasięgu między satelitami</b> na SYMULOWANEJ sieci księżycowej, aby odzyskać <em>razem</em> pozycję 3-D księżycowej stacji powierzchniowej, pozycje poszczególnych satelitów małej konstelacji oraz przesunięcie zegara każdego obiektu. Wielkości obserwowane to: ({ "1" }) opóźnienia geodezyjnego VLBI bazy ziemskiej do stacji księżycowej traktowanej jak latarnia (z ponownym użyciem <c2/>, geocentrycznie inercjalnie), główna technika; ({ "2" }) geocentryczne zasięgi radiometryczne stacja ziemska→satelita (które wielolateracyjnie wyznaczają konstelację z dobrze rozmieszczonych stacji ziemskich) oraz lokalne księżycowe zasięgi stacja↔satelita (euklidesowa odległość MCI (Moon-centred inertial) plus różnicowy człon zegara); ({ "3" }) zasięgi międzysatelitarne (ta sama postać); plus pojedyncza pseudoobserwacja synchronizacji zegara stacji, która zakotwicza niedostrzegalne inaczej wspólne przesunięcie zegara. Wektor stanu to <c3/>. <b>Brak propagacji modelu sił wewnątrz solvera</b>: satelity są stałymi, odrębnymi, ilustracyjnymi punktami na reprezentatywnej orbicie księżycowej; to celowo czyste dopasowanie migawkowe. Wewnętrznie pozycje są skalowane, a zegary estymowane w metrach równoważnych zasięgowi, aby macierz normalna pozostała dobrze uwarunkowana w f64; zasięgi VLBI i odległości księżycowe są pozbawione średniej wokół nominalnej geometrii, by jakobian różnic skończonych nie cierpiał na katastrofalne znoszenie. Scenariusz <c4/> uruchamia rozwiązanie z odnogami VLBI i bez nich na tym samym ziarnie/prawdzie i podaje oba rozwiązania oraz współczynnik poprawy obserwowalności stacji.

seg-f634e976b583 = <b>Główny uczciwy wynik</b>: lokalny księżycowy pomiar zasięgu z biegunowej stacji do garstki satelitów, które leżą po jednej stronie nieba, pozostawia pozycję stacji <b>słabo obserwowaną wzdłuż jednego kierunku</b>, więc rozwiązanie wyłącznie z zasięgów jest źle uwarunkowane, a odzyskany błąd stacji 3-D jest duży (lub rozwiązanie nie jest zbieżne). <b>Dodanie opóźnień VLBI bazy ziemskiej czyni pełną pozycję 3-D stacji obserwowalną</b>, a odzyskany błąd stacji spada do poziomu metra. Test <c1/> potwierdza, że błąd stacji z VLBI jest wyraźnie (≥{ "5" }×) mniejszy niż błąd wyłącznie z zasięgów przy identycznej wstrzykniętej prawdzie; sensem tej fazy jest to, że VLBI przywraca inaczej niedostrzegalny kierunek stacji.

seg-d5feea2381b7 = <b>Wyrocznia</b> to spójność wewnętrzna: wstrzyknięty stan prawdziwy (stacja ~{ "50" } m/oś, satelity ~{ "30" } m/oś, zegary ~{ "1e-7" } s, z losowym szumem na składową zależnym od ziarna) jest odwzorowywany na syntetyczne wielkości obserwowane przez <em>ten sam</em> model geometrii, który odwraca solver, dodaje się gaussowski szum zależny od ziarna (ilustracyjne wartości domyślne: σ VLBI ≈ { "1e-11" } s, σ zasięgu ≈ { "0.1" } m, σ ISL ≈ { "0.1" } m; wagi <c1/>), a estymator musi odzyskać wstrzykniętą prawdę w granicach szumu ze startowego przybliżenia zerowego. Średnie NEES <c2/> metodą Monte Carlo po ziarnach (<c3/>) mieści się w luźnym przedziale wokół <c4/>, co jest kontrolą realizmu kowariancji.

seg-abc40f1f301a = <c1/> ({ "0.30" }, P2: algebra liniowa rozwiązania)

seg-87de27c2421a = <c1/>, <c2/>, <c3/>. <b>Wyrocznia { "0.30" }: P2</b>: numpy { "2.4.6" } (LAPACK gelsd i inv) ponownie oblicza każdy krok Gaussa–Newtona, zbieżne rozwiązanie ważone, formalne sigmy i błąd stacji na zatwierdzonych jakobianach sześciu sieci (<c4/>, kroki w granicach { "2.4e-11" }, sigmy w granicach { "1.3e-11" }); fizyczne modele obserwacji i ich wielkości pozostają MODELLED. <b>Wcześniejsza wyrocznia: <c5/></b>: odzyskanie wstrzykniętej symulowanej prawdy + spójność kowariancji NEES. Testy (<c6/>): pełna fuzja odzyskuje prawdę (stacja < { "5" } m, RMS satelitów < { "5" } m, zegary < { "1e-8" } s, zbieżność); VLBI przywraca obserwowalność stacji 3-D (błąd stacji ≥{ "5" }× mniejszy z VLBI niż wyłącznie z zasięgów przy tej samej prawdzie); deterministyczność (to samo ziarno → rozwiązanie identyczne co do bitu, inne ziarno → inne, ale odzyskane); średnie NEES w luźnym przedziale wokół <c7/>; skończone/zabezpieczone raportowane liczby nawet gdy wyłącznie zasięgi są źle uwarunkowane; scenariusz wysłany przez <c8/>. <b>Uczciwy zakres:</b> to jest <b>symulowane odzyskanie w pętli zamkniętej</b>: prawda dzieli model obserwacji, <b>NIE</b> walidacja na rzeczywistych danych; brak propagacji modelu sił wewnątrz solvera; pozycje satelitów oraz geometria stacji ziemskich i księżycowych są ilustracyjne. Nie twierdzi się nic o TRL, dziedzictwie lotniczym ani poparciu agencji.

seg-7620f3a821f6 = Realizacja księżycowego układu odniesienia: 7-parametrowe dopasowanie datum Helmerta (<c1/>)

seg-240271b9d7de = Podczas gdy <c1/> <em>stosuje</em> orientację księżycowego ciała IAU { "2015" } WGCCRE (model prosty), ten moduł <em>estymuje</em> (realizuje) księżycowy układ odniesienia z sieci estymowanych współrzędnych punktów powiązanych z datum. Rdzeń estymacji to klasyczne <b>7-parametrowe przekształcenie podobieństwa (Helmerta)</b>: trzy parametry przesunięcia, trzy małego obrotu i jeden skali, odwzorowujące punkty <c2/> (układ estymowany) na <c3/> (układ datum) jako <c4/>, przy <c5/> zbudowanym z <c6/>. Siedem parametrów <c7/> jest estymowanych z ≥ { "3" } niewspółliniowych par punktów metodą ważonych najmniejszych kwadratów przez <c8/>: model prosty przewiduje każde <c9/> z jego <c10/> i spłaszcza wszystkie trzy składowe wszystkich punktów do wektora wielkości obserwowanych, obserwowane współrzędne datum tworzą <c11/>, wagi to <c12/>, a rozwiązanie startuje z <c13/>. Kąty obrotu są estymowane w µrad, a skala w ppb, aby jakobian różnic skończonych pozostał dobrze skalowany przy wielkości współrzędnych na powierzchni Księżyca (~{ "1.7e6" } m). Mała funkcja <c14/> składa zrealizowany mały obrót przez orientację ciała IAU→ICRF (<c15/>) i zwraca resztkowe małokątowe przesunięcie zrealizowanego układu wokół osi ICRF: celowo prosta zmiana układu wyrażenia, <b>a nie</b> niezależna estymata bieguna Księżyca.

seg-75769fc9671c = <b>Wyrocznia</b> to spójność wewnętrzna: znane przekształcenie Helmerta (przesunięcie ~dziesiątki m, obrót ~µrad, skala ~{ "1e-7" }) jest <em>wstrzykiwane</em> do dobrze rozmieszczonej syntetycznej sieci punktów (zróżnicowana szerokość/długość selenograficzna → MCMF, część punktów na wysokości), dodawany jest gaussowski szum zależny od ziarna, a dopasowanie musi odzyskać wstrzyknięte parametry. Na danych bez szumu odzyskanie następuje z dokładnością zbliżoną do maszynowej (przesunięcie < { "1e-6" } m, obrót < { "1e-9" } rad, skala < { "1e-12" }); przy szumie rzędu metra odzyskane parametry mieszczą się w granicach kilku razy formalnego σ, a RMS residuum po dopasowaniu jest bliskie poziomowi szumu. Scenariusz <c1/> podaje odzyskane datum, błąd odzyskania każdego parametru względem wstrzykniętej prawdy, RMS residuum po dopasowaniu oraz powiązanie orientacji ICRF zrealizowanego obrotu.

seg-3768ce021e23 = <c1/>, <c2/>, <c3/>, <c4/>, <c5/>. <b>Wyrocznia: <c6/></b>: odzyskanie wstrzykniętego 7-parametrowego przekształcenia podobieństwa plus algebraiczna tożsamość konwersji w obie strony <c7/>. Testy (<c8/>): odzyskanie wstrzykniętego przekształcenia bez szumu (przesunięcie < { "1e-6" } m, obrót < { "1e-9" } rad, skala < { "1e-12" }); odzyskanie z szumem w granicach kilku razy σ, a RMS residuum blisko poziomu szumu; zastosowanie i odwrócenie w obie strony; deterministyczność (to samo ziarno → identyczne co do bitu, inne ziarno → inne, ale odzyskane); powiązanie ICRF przy zerowym obrocie jest zerowe i zachowuje wielkość obrotu; scenariusz wysłany przez <c9/>. <b>Uczciwy zakres:</b> to jest kontrola <b>spójności wewnętrznej</b>: odzyskuje <em>wstrzyknięte</em> przekształcenie na <em>syntetycznej</em> sieci, <b>NIE</b> realizację księżycowego układu odniesienia względem rzeczywistych danych śledzenia / VLBI i nie rości sobie bezwzględnej dokładności układu. Powiązanie orientacji ICRF to prosta zmiana wyrażenia, a nie niezależna estymata bieguna. Nie twierdzi się nic o TRL, dziedzictwie lotniczym ani poparciu agencji.

seg-f14930d33f47 = Księżycowy wolumen usługi nawigacyjnej: DOP / pokrycie / dostępność + uogólniony księżycowy poziom ochrony ARAIM (<c1/>)

seg-9b4f13e138e4 = Ten moduł <em>składa</em> już zbudowane elementy w analizę <b>wolumenu usługi</b> nawigacji księżycowej: przeszukuje siatkę szerokości/długości selenograficznych w horyzoncie czasu względem <b>ilustracyjnej, opartej na źródłach publicznych konstelacji na orbicie księżycowej klasy Moonlight / LCNS</b> (LCNS: Lunar Communications and Navigation Services) i podaje DOP / pokrycie / dostępność oraz uogólnioną obwiednię księżycowego poziomu ochrony ARAIM. Dwa ponowne użycia są nośne i jawne. <b>Geometria DOP</b> to jądro <b>VALIDATED</b> (względem gnss_lib_py) <c1/>: <c2/> to cienki filtr maski elewacji plus to jądro, a test potwierdza tożsamość (<c3/> równa się bezpośredniemu <c4/> na tych samych widocznych pozycjach). <b>Integralność</b> wykorzystuje ponownie mechanizm księżycowego ARAIM LunaNet LNIS (LunaNet Interoperability Specification) <c5/> (σ_URE ≈ { "30" } m, <c6/> ≈ { "1e-4" }); <c7/> uogólnia istniejący poziom ochrony dla bieguna południowego na dowolny punkt powierzchni, a test potwierdza, że <b>redukuje się do przypadku bieguna południowego</b> (na biegunie południowym przy tej samej geometrii/budżecie zwraca dokładnie istniejący wynik <c8/> z dokładnością < { "1e-9" }).

seg-456bf257f689 = Parametry konstelacji to <b>ilustracyjne przybliżenie publicznych opisów ESA</b> tej klasy systemu (≈ { "4" } satelity na eliptycznych zamrożonych orbitach księżycowych sprzyjających pokryciu bieguna południowego: apolun nad półkulą południową; { "4" } to wartość domyślna biblioteki, a dołączony <c1/> ustawia { "8" }, ponieważ poziom ochrony wymaga co najmniej { "6" } widocznych). To <b>nie jest</b> rzeczywista efemeryda Moonlight/LCNS i <b>nie</b> oznacza żadnej przynależności, poparcia, dziedzictwa, certyfikacji ani TRL. Złożenie (pokrycie / dostępność / integralność) jest <b>MODELLED</b>: zestaw przekaźników na orbitach kołowych/eliptycznych keplerowskich (a nie skorygowana różnicowo efemeryda LCNS / NRHO (near-rectilinear halo orbit) { "9" }:{ "2" }), Księżyc ze średnim obrotem (bez fizycznej libracji i precesji bieguna) oraz opublikowane parametry integralności LunaNet LNIS. Pokazuje <em>metodę</em> wolumenu usługi, a nie operacyjną liczbę dostępności. Deterministyczne (czysta geometria; bez losowości). Scenariusz <c2/> podaje procent pokrycia, obwiednie liczby widocznych satelitów i PDOP, obwiednię HPL/VPL w wolumenie oraz dostępność poziomu ochrony względem limitu alarmowego.

seg-c28e56391894 = <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>. <b>Geometria DOP sprawdzona przez ponowne użycie</b> jądra <c7/> sprawdzonego względem gnss_lib_py; integralność wykorzystuje ponownie opublikowany księżycowy ARAIM LunaNet/LNIS (<c8/>, σ_URE ≈ { "30" } m). Testy (<c9/>): <c10/> jest tożsamością na sprawdzonym jądrze; <c11/> na biegunie południowym równa się istniejącemu PL <c12/> z dokładnością < { "1e-9" } (redukuje się do przypadku bieguna południowego); pokrycie nie maleje wraz z rozmiarem konstelacji; widoczność respektuje maskę elewacji; scenariusz jest deterministyczny i wysyłany przez <c13/>. <b>Uczciwy zakres:</b> konstelacja jest <b>ilustracyjna, oparta na źródłach publicznych, NIE powiązana z ESA</b>: to nie jest rzeczywista efemeryda Moonlight/LCNS; złożenie pokrycia/dostępności/integralności jest <b>MODELLED</b> (przekaźniki na orbitach kołowych/eliptycznych keplerowskich, Księżyc ze średnim obrotem, opublikowane parametry LNIS), <b>NIE</b> operacyjną liczbą dostępności Moonlight. Nie twierdzi się nic o TRL, dziedzictwie lotniczym ani poparciu agencji.

seg-4ff4929f71df = Księżycowy różnicowy PNT: znoszenie składowej wspólnej + residuum rosnące z bazą + poziomy ochrony DGNSS (<c1/>)

seg-8f94c4bf3fe6 = Księżycowy analog DGNSS (różnicowa nawigacja satelitarna) / SBAS: <b>stacja referencyjna klasy NovaMoon</b> w <em>znanej</em> lokalizacji selenograficznej oblicza różnicowe poprawki dla każdego satelity z <b>ilustracyjnej, opartej na źródłach publicznych konstelacji klasy Moonlight / LCNS</b>, a użytkownik ruchomy, przesunięty od niej o bazę, stosuje je, tak że znoszą się <b>wspólne</b> błędy efemeryd nadawanych. Każdy satelita <c1/> niesie wstrzyknięty wspólny wektor błędu orbity 3-D <c2/> i wspólny błąd zegara <c3/>. Residuum pseudoodległości stacji referencyjnej jest poprawką <c4/>; surowy błąd użytkownika to <c5/>; skorygowany błąd użytkownika to ich różnica <c6/>. <b>Człon zegara <c7/> znosi się dokładnie</b> (jest identyczny w obu obserwacjach), a <b>człon orbity sprowadza się do rzutu na różnicę dwóch jednostkowych wektorów linii widzenia</b>, który → { "0" } przy bazie → { "0" } (próg dekorelacji przestrzennej) i rośnie ≈ liniowo z bazą. Skorygowane błędy zasięgu poszczególnych satelitów są odwzorowywane przez geometrię użytkownika małym, mało zależnym od bibliotek rozwiązaniem migawkowym ważonych najmniejszych kwadratów (stan <c8/> przez <c9/>; stały błąd systematyczny zasięgu jest pochłaniany przez niewiadomą zegara, a nie psuje poprawki), co daje błąd <b>pozycji</b> użytkownika. <b>Poziom ochrony użytkownika wykorzystuje ponownie mechanizm poziomu ochrony SBAS wg DO-229E</b> (<c10/>, współczynniki K podejścia precyzyjnego), przyjmując różnicowe σ residuum jako budżet błędu 1-σ każdego satelity.

seg-06978cfaebe3 = NovaMoon jest przywoływany <b>wyłącznie jako klasa systemu</b> (publiczny opis księżycowej stacji referencyjnej); konstelacja wykorzystuje ponownie ilustracyjną, opartą na źródłach publicznych <c1/>. Są to ilustracyjne parametry do ćwiczenia <em>metody</em> różnicowej, <b>nie</b> rzeczywista efemeryda, i <b>nie</b> oznaczają żadnej przynależności, poparcia, dziedzictwa, certyfikacji ani TRL. Scenariusz <c2/> podaje błąd pozycji użytkownika z poprawkami i bez nich, współczynnik redukcji, krzywą błędu w funkcji bazy i poziom ochrony. W konfiguracji domyślnej skorygowany błąd użytkownika przy bazie { "50" } km wynosi ≈ { "0.008" } m wobec ≈ { "24" } m bez poprawek (redukcja ~{ "3000" }×), a ≈ { "0" } przy zerowej bazie.

seg-6bb4dbe998f9 = <b>Wyrocznia</b> to spójność wewnętrzna: znoszenie składowej wspólnej jest <b>dokładną tożsamością algebraiczną</b> (przy <c1/> skorygowany błąd < { "1e-6" } m przy zerowej bazie; człon zegara znosi się z dokładnością maszynową przy dowolnej bazie), residuum <b>rośnie monotonicznie z bazą</b>, a poziom ochrony to <b>ten sam algorytm DO-229E</b>, względem którego sprawdzany jest stos SBAS. Residuum dekorelacji przestrzennej to model geometryczny <b>pierwszego rzędu</b>, <b>a nie</b> dopasowany model dekorelacji z rzeczywistego śledzenia księżycowego.

seg-fd282b10cc77 = <c1/>, <c2/>, <c3/>, <c4/>, <c5/>. <b>Wyrocznia: <c6/></b>: różnicowa tożsamość znoszenia błędów plus ponowne użycie mechanizmu poziomu ochrony SBAS wg DO-229E (<c7/>). Testy (<c8/>): przy zerowej bazie skorygowany błąd użytkownika i każdy skorygowany błąd zasięgu poszczególnego satelity wynoszą ~{ "0" } (< { "1e-6" } m) i są ≪ błędu nieskorygowanego; człon zegara znosi się dokładnie przy dowolnej bazie (przypadek zerowego błędu orbity); skorygowany błąd rośnie monotonicznie z bazą, pozostając ≪ nieskorygowanego przy umiarkowanych bazach; różnicowy jest wyraźnie lepszy niż samodzielny (> { "2" }×); poziom ochrony równa się bezpośredniemu wywołaniu <c9/> i skaluje się z σ residuum; geometria niedookreślona zwraca <c10/>; scenariusz jest deterministyczny (zależny od ziarna) i wysyłany przez <c11/>. <b>Uczciwy zakres:</b> <b>MODELLED</b>: znoszenie składowej wspólnej jest dokładną tożsamością, ale residuum dekorelacji przestrzennej to model geometryczny <b>pierwszego rzędu</b>, <b>NIE</b> dopasowany model dekorelacji z rzeczywistego śledzenia księżycowego, i <b>NIE</b> jest to sprawdzone na rzeczywistych danych. NovaMoon jest przywoływany <b>wyłącznie jako klasa systemu</b> (ilustracyjnie, na źródłach publicznych, <b>bez powiązania z ESA</b>). Nie twierdzi się nic o TRL, dziedzictwie lotniczym ani poparciu agencji.

seg-08e8a73f3426 = Księżycowy eksport interoperacyjności: CCSDS OEM + KIF dostosowane do LunaNet/IOAG, z kontrolą pól w obie strony (<c1/>)

seg-39b875078d27 = Księżycowy układ odniesienia, księżycowa skala czasu i księżycowa efemeryda są eksportowane w <b>formach wymiany opartych na CCSDS, dostosowanych do LunaNet/IOAG (IOAG: Interagency Operations Advisory Group)</b>. Ta faza <b>nie</b> wymyśla formatu przewodowego: <b>wykorzystuje ponownie</b> istniejący emiter i parser CCSDS OEM (Orbit Ephemeris Message) { "2.0" } w crate (<c1/> / <c2/>) oraz kopertę Kshana Interchange Format (<c3/>), ponownie oznaczone dla kontekstu księżycowego. <c4/> ustawia <c5/> w OEM na <b>księżycowy układ ciała IAU { "2015" } WGCCRE</b> (<c6/> średni-Ziemia lub <c7/> osie główne), <c8/> na <b>księżycową skalę czasu</b> (<c9/> / <c10/> / <c11/>), a <c12/> na <c13/>, dla przykładowej <b>ilustracyjnej, opartej na źródłach publicznych</b> efemerydy klasy LCNS (pozycje z <c14/>, prędkość centralną różnicą skończoną). <c15/> emituje deskryptor czasu księżycowego dostosowany do LunaNet/IOAG (identyfikator skali, wiekowe tempo µs/dobę z <c16/>, opublikowany przedział { "56" }–{ "59" } µs/dobę, powierzchnia odniesienia), który wraca w obie strony przez serde_json. <c17/> opakowuje OEM + deskryptor + etykietę układu w istniejącą kopertę KIF z etykietą uczciwości MODELLED.

seg-bbfce5323abb = <b>Wyrocznia</b> to spójność w obie strony i na poziomie pól. Ponieważ <c1/> udostępnia <em>oba</em> kierunki, OEM jest przepuszczany w obie strony przez <c2/> (z powrotem do równego segmentu, z zachowaniem księżycowego układu/czasu i liczby stanów) <b>oraz</b> niezależnie sprawdzany przez <c3/>, która weryfikuje, że obecne jest każde wymagane słowo kluczowe nagłówka CCSDS/LunaNet, że <c4/> niesie księżycowy token <c5/>, a <c6/> nie jest puste, że obowiązuje ramowanie <c7/> i że linie danych pozycji+prędkości są poprawnie sformułowane; zwraca ustrukturyzowany wynik pozytywny plus listę pól obecnych/brakujących, tak aby zepsuty eksport (np. z utraconym <c8/>) został wychwycony i nazwany. Metadane czasu wracają w obie strony przez <c9/>, a koperta KIF wraca w obie strony przez <c10/> do równych artefaktów niosących etykietę MODELLED.

seg-cb9dfbed826d = <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>. <b>Wyrocznia: <c7/></b>: deterministyczny test w obie strony (CCSDS OEM przez <c8/>; KIF przez <c9/>; metadane czasu przez serde_json) plus kontrola nazw pól względem opublikowaną semantyką pól CCSDS OEM + LunaNet/IOAG. Testy (<c10/>): wyeksportowany OEM niesie księżycowe tokeny <c11/> (<c12/>/<c13/>) i <c14/> (<c15/>/<c16/>), <c17/>, obiekt i poprawnie sformułowane linie danych; metadane czasu księżycowego wracają w obie strony (tempo/przedział/odniesienie) i odrzucają śmieci; koperta KIF serializuje się i deserializuje do równej wartości z obecną etykietą uczciwości MODELLED; celowo zepsuty OEM (bez <c18/>) nie przechodzi <c19/> i jest zgłaszany jako brakujący; scenariusz jest wysyłany przez <c20/>. <b>Uczciwy zakres:</b> <b>nazwy/jednostki</b> pól są wyrównane z <b>publicznymi</b> standardami (CCSDS 502.0-B OEM, księżycowe układy IAU WGCCRE { "2015" }, specyfikacja interoperacyjności LunaNet / architektura księżycowa IOAG); eksport jest <b>MODELLED</b>: wyrocznią jest deterministyczny test w obie strony + kontrola nazw pól, to <b>NIE</b> jest certyfikowany test interoperacyjności, efemeryda jest <b>ilustracyjna, na źródłach publicznych, bez powiązania z ESA</b>, i nie twierdzi się nic o TRL, dziedzictwie lotniczym ani poparciu agencji.

seg-69a214b7236d = Predykcje zarejestrowane wstępnie

seg-343fe86f6a50 = Predykcja zarejestrowana wstępnie to wynik MODELLED zamrożony, zanim istnieją jakiekolwiek dane do jego oceny, przy jednoczesnym ustaleniu protokołu oceny. Nie jest to walidacja i nie dodaje wiersza do rejestru. Każda znajduje się w <c1/>, wraz z zamrożonymi danymi wejściowymi, wynikiem i ich skrótami SHA-256, a <c2/> zawodzi, jeśli jakikolwiek zamrożony bajt się zmieni; zmienione założenie jest obsługiwane nową, datowaną predykcją obok starej, nigdy edycją starej.

seg-e65d79893e2c = Predykcja

seg-f9e2d4b52b79 = Zamrożono

seg-dd68891f75e2 = Oceniana względem

seg-d5a09f26a028 = Pokrycie księżycowej stacji referencyjnej

seg-c68f124a16e7 = c05dac1d, 2026-10-12

seg-293404a9cb92 = opublikowana dokładność, dostępność, pokrycie i poziomy ochrony księżycowej różnicowej stacji na biegunie południowym, przez dowolną stronę

seg-4e7d9449a880 = jeszcze nie oceniono (brak opublikowanych wyników)

seg-ad1995b3ed17 = Rejestr reprezentatywności demonstracji i luk do lotu (<c1/>)

seg-86b70551c37f = Wynik symulacji jest użyteczny jako dowód tylko wtedy, gdy wprost podaje, do czego jest zakotwiczony, co zakłada i co wciąż dzieli go od systemu lotniczego. Rejestr reprezentatywności czyni to pierwszorzędnym, sprawdzanym maszynowo wynikiem: rekord <c1/> zawiera zewnętrzne <c2/> demonstracji, jej zamodelowane założenia, jej <c3/> do lotu (każda z fazą/działaniem, które by ją zamknęło) oraz pasmo TRL, dla którego jest reprezentatywna. Jest to towarzysz każdego wyniku dla macierzy <c4/> na poziomie możliwości.

seg-ccd039d5e6a4 = <b>Wyrocznia</b> to zbiór niezmienników w postaci zamkniętej, wymuszanych przez <c1/>: rekord <c2/> musi wymieniać co najmniej jedną kotwicę <c3/> (symulacja nie może być zwalidowana względem samej siebie); rekord <c4/> musi wymieniać co najmniej jedną lukę do lotu i nie może deklarować reprezentatywnego pasma TRL powyżej { "4" } (dojrzewanie powyżej wymaga dowodów sprzętowych/lotniczych, które są luką, a nie wynikiem symulacji); pasmo TRL musi być poprawnie sformułowane; a rekord <c5/> nie może niczego twierdzić. Te niezmienniki urzeczywistniają dyscyplinę „reprezentatywność uzasadniona + pozostałe luki do lotu jasno wskazane”.

seg-6b29111096ca = Rejestr reprezentatywności i luk do lotu

seg-f6b9a2c22ae6 = <c1/>/<c2/>/<c3/>, <c4/>/<c5/>/<c6/>/<c7/>. <b>Wyrocznia: <c8/></b>: niezmienniki uczciwości w postaci zamkniętej powiązane z granicą statusu/rodzaju wyroczni w <c9/>. Testy (<c10/>): rekord Validated bez zewnętrznej kotwicy nie przechodzi; kotwica wewnętrzna (ReferenceImpl) nie spełnia Validated; rekord Modelled bez luki nie przechodzi; rekord Modelled powyżej TRL { "4" } nie przechodzi; źle sformułowane pasma TRL są wychwytywane; rekord serializuje się do JSON z oczekiwanymi polami i renderuje czytelny raport. <b>Uczciwy zakres:</b> rejestr sprawdza <em>klasyfikację</em> dowodów wyniku: nie dowodzi, że wymienione kotwice wskazują na działające testy (są one dobierane ręcznie, dokładnie jak macierz <c11/>); twierdzenie „sprawdzane maszynowo” dotyczy wyłącznie niezmienników statusu/kotwicy/luki/TRL.

seg-7e9190395eb6 = Ujednolicony dowód kompromisu kwantowe a klasyczne (<c1/>)

seg-534e48755e2c = Każdy obszar zastosowań kwantowego PNT odpowiada na to samo pytanie w ten sam sposób: ustalić jedną ramę porównania (scenariusz + ziarno + wersja silnika), skierować kwantowego kandydata i klasyczny punkt odniesienia przez jedną neutralną ścieżkę kodu, ocenić je według wspólnych wskaźników jakości i zgłosić, z przedziałem ufności i uczciwą etykietą sprawdzone względem wzorca/zamodelowane, gdzie wygrywa technika kwantowa, a gdzie nie. <c1/> nadaje tej odpowiedzi jeden kształt, aby pionowe obszary czasu, nawigacji i detekcji anomalii emitowały <b>ten sam</b> odtwarzalny, uczciwie oznaczony obiekt. Nie implementuje ponownie żadnego kompromisu: liczby dla poszczególnych wskaźników pochodzą z istniejących silników (<c2/>, <c3/> i modułów pionowych); to jest kontrakt oraz opakowanie odtwarzalności/reprezentatywności, zbudowane na rejestrze reprezentatywności i etykietach weryfikacji.

seg-5a52fb6670d1 = <b>Wyrocznia</b> to tożsamości korzyści/zwycięzcy w postaci zamkniętej plus wierne opakowanie istniejącego wyniku kompromisu. <c1/>: współczynnik korzyści ma poprawną polaryzację (zorientowany tak, że <c2/> zawsze oznacza lepszą stronę kwantową, zarówno dla wskaźników holdover, w których więcej znaczy lepiej, jak i błędu, w którym mniej znaczy lepiej); obiekt dowodu zbudowany z rzeczywistego <c3/> odtwarza jego współczynniki korzyści; nieuczciwy dowód jest odrzucany (reprezentatywność Modelled bez luki lub wskaźnik <c4/>, którego rekord kompromisu nie niesie zewnętrznej kotwicy); JSON jest deterministyczny i niesie pola ramy/ziarna/silnika/wskaźnika/reprezentatywności.

seg-ae87cea429ba = Dowód kompromisu kwantowe a klasyczne

seg-6622ae19989c = <c1/>/<c2/>/<c3/>/<c4/>. <b>Wyrocznia: <c5/></b>: tożsamości korzyści/zwycięzcy w postaci zamkniętej + wierne opakowanie <c6/>; uczciwość powiązana z rejestrem reprezentatywności i granicą statusu weryfikacji/rodzaju wyroczni. Testy (<c7/>) jak wyżej. <b>Uczciwy zakres:</b> ten zestaw ujednolica, <em>jak</em> kompromis jest raportowany i odtwarzany; fizyka poszczególnych wskaźników jest taka, jaką dostarcza wnoszący silnik, wraz z jego własną etykietą sprawdzone/zamodelowane: <c8/> nie podnosi zamodelowanego wskaźnika do rangi sprawdzonego.

seg-ce13223e04d0 = Biblioteka modeli błędów urządzeń kwantowych (<c1/>)

seg-c206fc7d58d6 = Jedno miejsce udostępniające urządzenia kwantowego PNT, które demonstrator porównuje: zegary optyczne / na uwięzionych jonach / na jonach rtęci, klasyczne zegary referencyjne, interferometr zimnych atomów i łącza transferu czasu, każde jako <c1/> niosące swoją główną specyfikację i rekord reprezentatywności. Większość fizyki urządzeń jest <b>ponownie użyta</b> (stabilności zegarów z <c2/> i <c3/>; interferometr zimnych atomów z <c4/>/<c5/>; klasyczne łącza optyczne/RF z <c6/>). Jedynym naprawdę nowym modelem jest <b>łącze transferu czasu na splątaniu / pojedynczych fotonach</b>, którego precyzja czasowa jest ograniczona szumem śrutowym: <c7/> w wykrytej częstości koincydencji <c8/> i czasie całkowania <c9/>, pogarszana karą za ciemne zliczenia <c10/> i ograniczona od dołu nieusuwalnym błędem systematycznym.

seg-7e8f4f3a5442 = <b>Wyrocznia</b> to ponownie użyte, opublikowane współczynniki zegarów/CAI plus tożsamości szumu śrutowego/strat w postaci zamkniętej. <c1/>: ponownie użyta kolejność stabilności zegarów jest rozsądna (sieć optyczna < jony rtęci < CSAC w σ_y({ "1" } s)); precyzja splątania poprawia się jak <c2/> ({ "4" }× całkowania zmniejsza σ o połowę), gdy dominuje szum śrutowy; wykryta częstość koincydencji spada { "10" }× na każde { "10" } dB strat łącza; ciemne zliczenia monotonicznie pogarszają precyzję; próg systematyczny ogranicza precyzję od dołu; każda karta urządzenia jest poprawnym rekordem reprezentatywności Modelled.

seg-24dd5c3725b9 = <c1/>, <c2/>/<c3/>, <c4/>. <b>Wyrocznia: <c5/></b>: ponownie użyte opublikowane współczynniki zegarów/CAI + tożsamości szumu śrutowego/strat w postaci zamkniętej dla łącza splątania. Testy (<c6/>) jak wyżej. <b>Uczciwy zakres:</b> parametry urządzeń zegarów/CAI są ponownie użyte z istniejących modeli silnika opartych na opublikowanych współczynnikach; model łącza splątania jest MODELLED na podstawie opublikowanego zachowania kwantowej synchronizacji zegarów z ilustracyjnymi, opartymi na źródłach publicznych wartościami częstości par/sprawności/strat: <b>nie jest</b> sprawdzony na zmierzonym łączu, a rzeczywisty sprzęt źródła/kanału/detektora jest wprost wskazaną luką do lotu.

seg-f6d8e7ad6bec = Zaufany czas kwantowy: łańcuch od końca do końca, bezpieczna dystrybucja, anomalie + kompromis (<c1/>)

seg-3160cfec0d1f = Scenariusz <c1/> składa łańcuch czasu, jakiego potrzebuje demonstrator kwantowego PNT: budżet czasu użytkownika od końca do końca (błąd wybiegu zegara referencyjnego i precyzja czasowa łącza połączone kwadraturowo) dla łańcucha <b>kwantowego</b> (zegar w sieci optycznej + łącze splątania/pojedynczych fotonów) w porównaniu z łańcuchem <b>klasycznym</b> (CSAC + dwudrogowe łącze RF); <b>poziom ochrony czasu</b> (TPL, ponownie użyty z <c2/>) ograniczający niewykryty błąd czasu; <b>wskaźnik jakości bezpieczeństwa wobec ataku z opóźnieniem/powtórzeniem</b> <c3/> przy podanym współczynniku fałszywych alarmów (ponownie użyty z <c4/>); <b>prawdopodobieństwo detekcji anomalii zegara + opóźnienie detekcji zmian CUSUM (cumulative sum)</b>; oraz porównanie kwantowe a klasyczne jako uczciwe <c5/> niosące rekord reprezentatywności i luk do lotu.

seg-6fa095264bdc = <b>Wyrocznia</b> to budżet kwadraturowy w postaci zamkniętej na ponownie użytych, osobno sprawdzonych jądrach (ADEV względem Stable32/NIST; granica TPL; <c1/>/<c2/>). <c3/>: precyzja kwantowa poprawia się z czasem całkowania; łańcuch kwantowy może wygrać <em>i</em> może przegrać we wskaźniku precyzji (uczciwie: to nie jest uniwersalna wygrana; bardzo stratne łącze odwraca wynik); poziom ochrony jest skończony i dodatni; wskaźnik bezpieczeństwa mieści się w [{ "0,1" }] i rośnie wraz z opóźnieniem ataku; prawdopodobieństwo detekcji anomalii jest monotoniczne względem wielkości usterki; a dowód kompromisu jest wewnętrznie uczciwy (<c4/>).

seg-42a7d1170cc3 = Zaufany czas kwantowy (łańcuch + bezpieczna dystrybucja + anomalie + kompromis)

seg-44855d0cec4f = <c1/>/<c2/>, <c3/>; <c4/>. <b>Wyrocznia: <c5/></b>: budżet kwadraturowy w postaci zamkniętej na ponownie użytych sprawdzonych jądrach (ADEV/Stable32-NIST, granica TPL, analityczne Pd/Pmd detekcji); uczciwość powiązana z rejestrem reprezentatywności. Testy (<c6/>) jak wyżej. <b>Uczciwy zakres:</b> parametry zegarów i łączy są ilustracyjne, oparte na źródłach publicznych; łącze splątania to model MODELLED ograniczony szumem śrutowym z <c7/>; modeluje to <em>klasę</em> systemu zaufanego czasu: <b>nie jest</b> sprawdzone na zmierzonym łączu od końca do końca, a rzeczywisty sprzęt zegara/łącza/kanału kosmicznego jest wprost wskazaną luką do lotu; nie twierdzi się nic o TRL, dziedzictwie lotniczym ani certyfikacji.

seg-c6ae292a6331 = Nawigacja kwantowa bez GNSS (<c1/>)

seg-f34f784e928c = Scenariusz <c1/> porównuje nawigację zliczeniową podczas utraty GNSS z <b>kwantowym</b> budżetem inercyjnym (akcelerometr interferometru zimnych atomów, ponownie użyty z <c2/>/<c3/>, którego próg szumu białego CAI jest sprawdzony w granicach ~{ "2" } rzędów wielkości względem Freier i in. { "2016" }) oraz <b>klasycznym</b> INS klasy nawigacyjnej. Podaje wzrost błędu pozycji w czasie wybiegu, czas holdover do progu pozycji oraz kompromis kwantowe a klasyczne jako uczciwe <c4/>. Obserwowalność jest przedstawiona uczciwie: bez zewnętrznej poprawki podczas utraty sygnału bias akcelerometru jest niedostrzegalny, więc błąd pozycji rośnie bez ograniczenia (≈ ½·bias·t² plus człon błądzenia losowego prędkości); czujnik kwantowy o niższym biasie <em>spowalnia</em> ten wzrost, ale nie zamyka luki: robi to tylko zewnętrzna poprawka.

seg-4cfde3de8f94 = <b>Wyrocznia</b> to ponownie użyte budżety inercyjne (<c1/>/<c2/>, oba implementujące cechę <c3/>) plus tożsamości dryfu w postaci zamkniętej. <c4/>: budżet kwantowy jest lepszy od klasycznego przy długiej utracie sygnału (mniejszy błąd, dłuższy holdover); błąd rośnie z czasem trwania utraty sygnału w obu (luka obserwowalności); przewaga zależy od czasu utraty sygnału i nie jest stałym współczynnikiem wygranej (krzywa kwantowa jest zdominowana szumem przy krótkim wybiegu, a biasem przy długim); dowód kompromisu jest wewnętrznie uczciwy.

seg-0488b6ec9982 = <c1/>/<c2/>, <c3/>; <c4/>. <b>Wyrocznia: <c5/></b>: ponownie użyte budżety inercyjne (CAI sprawdzone przez ponowne użycie ~{ "2" } rzędów względem Freier { "2016" }; klasyczny dryf w postaci zamkniętej); uczciwość powiązana z rejestrem reprezentatywności. Testy (<c6/>) jak wyżej. <b>Uczciwy zakres:</b> statyczne porównanie budżetów nawigacji zliczeniowej, a nie dynamiczny filtr na rzeczywistych trajektoriach; niedostrzegalność biasu bez poprawki jest podana wprost; parametry urządzeń są ilustracyjne, oparte na źródłach publicznych; modeluje <em>klasę</em> kwantowej nawigacji bez GNSS: rzeczywisty sprzęt IMU na zimnych atomach, platforma dynamiczna i środowisko lotu są wprost wskazanymi lukami do lotu; nie twierdzi się nic o TRL, locie ani certyfikacji.

seg-e23e583ecf21 = Detekcja usterek / anomalii dla kwantowych systemów PNT (<c1/>)

seg-6e6df91ae779 = Scenariusz <c1/> definiuje oznaczony katalog usterek kwantowego PNT (skok częstotliwości zegara, dryf, utrata synchronizacji; skok biasu czujnika, wypadnięcie), ocenia statystykę detekcji na oknach nominalnych i z usterką oraz podaje zdolność detektora do rozróżniania jako ROC AUC i minimalną wykrywalną usterkę przy ustalonym współczynniku fałszywych alarmów. Aspekt kwantowe a klasyczne: stabilniejszy kwantowy zegar referencyjny obniża szum monitora σ, więc wykrywa mniejsze usterki, co jest emitowane jako uczciwe <c2/> z rekordem reprezentatywności.

seg-eeb3c7d1f507 = <b>Wyrocznia</b> to AUC w postaci zamkniętej dla gaussowskiej statystyki detekcji (nominalna <c1/>, usterka <c2/> ⇒ <c3/>), skontrolowane krzyżowo względem zewnętrznie sprawdzonego <c4/> (sprawdzonego względem scikit-learn) i analitycznych progów <c5/>. <c6/>: analityczne AUC zgadza się ze znanymi wartościami ({ "0.5" } przy μ={ "0" }, →{ "1" } dla dużego μ/σ, monotonicznie); empiryczny przedział ufności bootstrapowego AUC obejmuje postać zamkniętą; monitor kwantowy ma wyższe AUC i mniejszą minimalną wykrywalną usterkę; przewaga zanika dla ogromnych usterek (oba wykrywają idealnie: to nie jest uniwersalny margines); katalog ma pięć oznaczonych klas; kompromis jest wewnętrznie uczciwy.

seg-9dda4ab0647a = Detekcja usterek/anomalii dla kwantowego PNT

seg-cfa7a5c43d14 = <c1/>, <c2/>/<c3/>, <c4/>, <c5/>; <c6/>. <b>Wyrocznia: <c7/></b>: gaussowskie AUC w postaci zamkniętej skontrolowane krzyżowo względem zewnętrznie sprawdzonego bootstrapowego AUC <c8/> (względem scikit-learn) i analitycznych progów <c9/>. Testy (<c10/>) jak wyżej. <b>Uczciwy zakres:</b> statystyka detekcji to model gaussowski, a nie rzeczywista telemetria; katalog usterek jest oznaczony jako syntetyczny; poziomy szumu monitorów kwantowego i klasycznego są ilustracyjne, oparte na źródłach publicznych; modeluje <em>klasę</em> detekcji anomalii kwantowego PNT: rzeczywista telemetria sprzętowa z etykietami prawdy jest wprost wskazaną luką do lotu; nie twierdzi się nic o TRL, locie ani certyfikacji.

seg-24ad75143bed = Kontrole standardów: formaty wymiany, budżet łącza i integralność (kontrole względem wyroczni zewnętrznej)

seg-9d31773e0ecd = Te standardy są sprawdzane przez odtworzenie <b>dosłownych przykładów opracowanych / wartości referencyjnych opublikowanych w samych standardach</b> (lub w niezależnej implementacji referencyjnej), a nie przez własny test w obie strony wykonany przez Kshana. Odtworzenie przykładu z załącznika samego standardu to najsilniejsza dostępna kontrola poprawności parsera formatu wymiany.

seg-7ec3d508c64f = Wyrocznia zewnętrzna

seg-e06aa022e7e9 = <b>CCSDS OEM</b> (502.0-B Orbit Data Messages)

seg-65de0a1335d6 = <c1/>: <c2/> odtwarza dokładne epoki i wektory stanu X/Y/Z/Ẋ/Ẏ/Ż przykładu OEM w notacji KVN z <b>CCSDS 502.0-B-3, Annex G §G6, Figure G-11</b> („OEM Example with No Acceleration, No Covariance”, s. G-10): oba segmenty efemerydy, w tym wartości źródłowe z wiodącymi zerami (<c3/>). Wzorzec <c4/> jest odtworzony znak po znaku z oficjalnej Blue Book (redakcyjne znaczniki „< intervening data records omitted here >”, które nie są poprawnymi rekordami OEM, nie są uwzględnione).

seg-54cff1deebc7 = <b>CCSDS TDM</b> (503.0-B Tracking Data Message)

seg-a5c6b58e0053 = <c1/>: <c2/> odtwarza wszystkie { "41" } rekordy RANGE (pierwszy { "3198.03679519614" } km, ostatni { "3270.46440460551" } km) oraz metadane przykładu TDM w notacji KVN z <b>CCSDS 503.0-B-2, Annex E, Figure E-9</b> („Range Data with TIMETAG_REF=TRANSMIT”, s. E-9). Wzorzec <c3/> jest dosłowny z Blue Book. (To jest wyrocznia z opublikowanej Blue Book obok wcześniejszego, ręcznie napisanego testu w obie strony <c4/> w <c5/>.)

seg-c9a23ec7956b = <b>CCSDS { "133.0" }</b> (Space Packet Protocol)

seg-aaffd3d25c5f = <c1/>: koder odtwarza bajtowe wektory testowe głównego nagłówka niezależnej <b>biblioteki <c2/></b> (us-irs/spacepackets-py, <c3/>), np. <c4/> i przypadek wszystkich maksimów <c5/>, plus kanoniczny przypadek telemetrii (TM) z samych jedynek, każdy przepuszczony w obie strony przez dekodowanie. Szerokości/kolejność pól bitowych wg <b>CCSDS 133.0-B-2 §{ "4.1.3" }</b>.

seg-e48472df251a = <b>CCSDS { "401" } / DSN</b> (budżet łącza, DSN 810-005)

seg-c6caa639e1c6 = <c1/>: łańcuch FSPL (strata propagacji w wolnej przestrzeni) i C/N₀ odtwarza opublikowaną tabelę projektowo-kontrolną telemetrii w głębokiej przestrzeni kosmicznej z <b>J. H. Yuen (red.), <em>Deep Space Telecommunications Systems Engineering</em> (DESCANSO/JPL (DESCANSO: Deep Space Communications and Navigation Systems Center of Excellence) Pub. 82-76), Table 1-1</b>: łącze w dół Galileo w paśmie X ({ "8420.43" } MHz) przy { "6.37" } AU: strata w wolnej przestrzeni <b>{ "290.54" } dB</b> (<{ "0.05" } dB) i odebrane <b>Pr/N₀ = { "54.6" } dB-Hz</b> (<{ "0.2" } dB). Środki pasm mieszczą się w przydziałach łączy w dół w głębokiej przestrzeni kosmicznej DSN/CCSDS-401 (DSN 810-005 Module { "201" }). <em>Domyślne parametry misji</em> pozostają reprezentatywne (nie jest to skalibrowany transponder); przypięte jest <em>równanie</em> łącza.

seg-c2cee7d5c7b1 = Standardy GNSS: status wyroczni zewnętrznej i uczciwe pozostałe luki:

seg-d8f653b3c955 = Status i uczciwe zastrzeżenie

seg-fff735bd32a1 = <b>Jądro, geometria i poziom ochrony ARAIM sprawdzone zewnętrznie.</b> <em>Jądro</em> detekcji (próg detekcji usterek χ², niecentralność niewykrytego zdarzenia w niecentralnym χ² oraz mnożniki K prawa normalnego) odtwarza <b>SciPy</b> (<c1/>, { "171" } przypadków, ≤ { "1e-6" } względnie), a otaczająca je geometria odtwarza <b>gnss_lib_py</b> (DOP). <em>Wartość</em> poziomu ochrony (PL) ARAIM jest teraz również przypięta: względem „LPV-200 (LPV: localizer performance with vertical guidance) numerical example” z WG-C (WG: Working Group) ARAIM Reference ADD (Algorithm Description Document) v3.1, <c2/> / <c3/> dają VPL { "18.2926" } m wobec { "18.3" } m, HPL { "13.4063" } m wobec { "13.45" } m i σ_v,acc { "1.3694" } m wobec { "1.3694" } m, w granicach własnego <c4/> = { "0.05" } m wzorca (rodzaj <c5/>). Zakres: tryby usterek do jednego satelity lub jednej konstelacji (<c6/>); wielozdarzeniowe podzbiory usterek i wykluczanie nie są zaimplementowane, a klasyczny RAIM nadal <b>nie ma kanonicznego opublikowanego wektora testowego wejście→HPL</b>. Zob. <a1><c7/></a1>.

seg-e6a47dfb7e54 = <b>Algorytm poziomu ochrony jest teraz sprawdzony zewnętrznie.</b> Przy danych dla każdego satelity (el, az, σ) <c1/> w kshana odtwarza <b>fork RTKLIB SBAS-PL</b> (<c2/> <c3/>, Siki & Takács { "2017" }, „DO-229D Appendix J”): zasilony <b>własnym</b> σ tego narzędzia, obliczonym z <b>rzeczywistych</b> komunikatów EGNOS i rzeczywistego RINEX z BUTE, do <b>< { "2e-3" } m HPL</b> w { "6" } epokach (<c4/>); ESA gLAB { "v6.0.0" } (<c5/>) potwierdził identyczną konwencję. Współczynniki K (<c6/>, <c7/>, <c8/>) zgadzają się z DO-229E Appendix J. <b>Co jest sprawdzone, a co nie:</b> przypina to <em>algorytm</em> PL (σ na wejściu → HPL/VPL na wyjściu); <em>modelowanie</em> σ ze źródłowych komunikatów UDRE/GIVE leży poza zakresem kshana: tam niezależne narzędzia <em>pełnego potoku</em> nadal różnią się o metry na rzeczywistych danych. K_V zgodziło się przy zaokrąglonej wartości wyroczni { "5.33" } (dokładne <c9/> w kshana → VPL mniejszy o ~{ "0.06" } %; wertykalna jest sprawdzona bez współczynnika K jako <c10/>).

seg-4ef39e8ea75c = <b>Model nadawany sprawdzony zewnętrznie.</b> Model Klobuchara L1 odtwarza <b><c1/> z RTKLIB</b> (<c2/>, < { "1e-4" } m): <em>parytet implementacji</em> z de facto otwartym wzorcem, ponieważ nie istnieje oficjalny przykład opracowany z <em>zmierzoną prawdą</em>. Czytnik map TEC IONEX już istnieje (<c3/>, testowany jednostkowo); pozostałą luką jest kontrola krzyżowa tego czytnika względem rzeczywistego produktu GIM, a nie model nadawany. Zob. wiersze Klobuchara w <a1>Deklaracje a rzeczywistość</a1>.

seg-fa3058dffb2a = Kod rozpraszający GPS L1 C/A (IS-GPS-200)

seg-53ac231770fb = Generowanie kodu sprawdzone zewnętrznie.

seg-04db7c613bd5 = <c1/> (<c2/>): generator kodu C/A z LFSR (rejestr przesuwny ze sprzężeniem zwrotnym) G1/G2 odtwarza <b>opublikowane przypisania fazy kodu w IS-GPS-200 Table 3-Ia</b>: ósemkowe pierwsze dziesięć chipów dla PRN (pseudo-random noise) { "1" }–{ "9" } ({ "{" }{ "1440" }, { "1620" }, { "1710" }, { "1744" }, { "1133" }, { "1455" }, { "1131" }, { "1454" }, { "1626" }{ "}" }) dokładnie. Przypina to <b>ciąg chipów kodu rozpraszającego</b> względem specyfikacji interfejsu GPS; otaczające elementy modulacji, separacji widmowej i śledzenia kodu w DLL (pętla z opóźnieniem) (<c3/>) pozostają MODELLED.

seg-e5f1b960777a = Czas dla sieci, widma, Układu Słonecznego, konstelacji, kampanii i LEO-PNT

seg-c5bf3b23d688 = Możliwości dodane w linii { "0.28" } są oceniane wiersz po wierszu w generowanym <a1><c1/></a1>; ta sekcja podsumowuje, które z nich mają wyrocznię zewnętrzną. Wiersz jest VALIDATED tylko przy niezależnej wyroczni zewnętrznej; wszystko inne jest MODELLED.

seg-d791a48b3895 = Możliwość (rodzaj)

seg-d4779be2efd8 = Wyrocznia zewnętrzna lub powód, dla którego pozostaje zamodelowane

seg-0d7bb0fc1c5e = Telekomunikacyjne MTIE (maksymalny błąd przedziału czasu) i TDEV (odchylenie czasu) na szeregu holdover (<c1/>)

seg-18894b55b6c1 = <c1/>: { "17" } współczynników uśredniania MTIE i { "12" } TDEV na zatwierdzonym do repozytorium szeregu holdover zegara w skali układu o { "2" } 048 próbkach, względem allantools { "2024.06" }, do < { "1e-12" } / < { "1e-9" } względnie. Werdykty maski ITU-T (International Telecommunication Union Telecommunication Standardization Sector) PASS/FAIL oraz ustawienia wstępne oscylatorów z kart katalogowych pozostają MODELLED. Zob. <a1><c2/></a1>.

seg-ff9cb967ae08 = Predykcja holdover z zmierzonego zapisu zegara (<c1/>)

seg-7821227795d8 = <c1/>: dopasowanie na pierwszej trzeciej części rzeczywistego zapisu cezowego 5071A, predykcja czasu przekroczenia jednego sigma przy sześciu progach, pomiar na zatrzymanych dwóch trzecich; próg czynnik { "1.5" } w każdą stronę, zaobserwowane stosunki od { "0.84" } do { "1.03" }. Budżet ochronny szczeliny i kadencja poprawek zbudowane na tym pozostają MODELLED.

seg-2667e3ddf829 = Widmowe gęstości mocy w paśmie L w postaci zamkniętej i separacja widmowa (<c1/>)

seg-1a0c6ef49f98 = Postacie zamknięte <c1/> względem opublikowanych wartości (wiersz macierzy „Closed-form L-band signal power spectral densities…”). Wodospad z J/S (stosunek zakłócacza do sygnału) dla każdego pasma i efektywnym C/N0 (gęstość nośna do szumu) oraz wejście/wyjście SigMF (Signal Metadata Format) pozostają MODELLED.

seg-46278e9c03c1 = Pozycje planet z elementów Standisha JPL (Jet Propulsion Laboratory) i czas światła między ciałami (<c1/>)

seg-43cfeb9f2403 = { "0.30" }, zarejestrowane wstępnie względem JPL Horizons (DE441): <c1/> i <c2/>, RMS na planetę i składową co najwyżej równe wartości z Explanatory Supplement Table { "8.10.1" } (najgorsze { "0.778" }), z uwzględnieniem podziału Ziemi i obrotu ICRF; <c3/>, solver czasu światła na pozycjach DE441 w granicach { "1e-6" } s od czasu światła z Horizons (najgorsze { "6.7e-9" } s). Wcześniejsze porównanie z podwójną wartością nominalną (<c4/>), którego próg ustalono po pierwszym porównaniu, jest zachowane jako niebramkujące porównanie regresyjne. Uran/Neptun z Table { "1" }, Pluton, księżyce, stałe ciał i <c5/> pozostają MODELLED.

seg-b96d8ea13c87 = Geometria Walkera oraz opublikowane sloty GPS, Galileo i GLONASS (GLObal NAvigation Satellite System); globalny współczynnik rozmycia dokładności GPS (<c1/>)

seg-85c293b8d235 = <c1/>: Walker 24/3/1 odtwarza tabelę definicji usługi otwartej Galileo do { "1e-9" }°, wzór slotów z dokumentu kontroli interfejsu GLONASS, równikowe przejścia GPS; mediana HDOP bazowego GPS { "0.940" } względem { "0.94" } ze standardu wydajności Standard Positioning Service. Dowolne mapy pokrycia wielokonstelacyjnego wokół dowolnego ciała pozostają MODELLED.

seg-f0187be4b97f = Kampanie: łańcuchy misji, przeglądy parametrów, zespoły Monte Carlo, przebiegi ze wspólnymi warunkami (<c1/>)

seg-b5c45fc12e5f = <c1/> ({ "11" } testów): kampania jednofazowa odtwarza samodzielny przebieg bajt po bajcie, przegląd jednowęzłowy odczytuje tę samą liczbę, zespół zależny od ziarna jest stabilny co do bajtu. Tożsamości składania, a nie wyrocznia zewnętrzna.

seg-bc25d20125e7 = Fizyka łącza LEO (niska orbita okołoziemska): współczynniki deszczu ITU-R (ITU Radiocommunication Sector) P.838, tłumienie deszczu i scyntylacja P.618, strata wnikania do budynku P.2109, jonosfera pierwszego rzędu, maksymalny Doppler

seg-b1f3bd37d169 = <c1/>, <c2/>: własne tabele Zaleceń ITU-R i przykłady walidacyjne Study Group { "3" } (zatwierdzone do repozytorium wraz ze źródłem i datą pobrania), stosunek opóźnień grupowych z IS-GPS-200 dla jonosfery oraz opublikowana tabela maksymalnego dopplera Leclere, Marathe i Reid (ION GNSS+ { "2025" }, arXiv { "2509.19551" }).

seg-492917f11386 = Komunikat nawigacyjny LEO: algorytm użytkownika efemerydy nadawanej Galileo ICD (dokument kontroli interfejsu), CRC-24Q (24-bitowa cykliczna kontrola nadmiarowa), globalnie uśrednione wagi SISRE (błąd zasięgu sygnału w przestrzeni) (<c1/>)

seg-514a7da01582 = <c1/>: algorytm użytkownika Galileo odtwarza RTKLIB (otwartoźródłową bibliotekę kinematycznego pozycjonowania w czasie rzeczywistym) z dokładnością { "1" } mm na czterech rzeczywistych efemerydach nadawanych Galileo; CRC-24Q daje wartość kontrolną z katalogu 0xCDE703 i bajty kontrolne przykładowej ramki RTCM (Radio Technical Commission for Maritime Services) { "1005" }; wagi SISRE odtwarzają opublikowaną tabelę MEO/GEO. Dopasowywacz, aktualizacja w trakcie przelotu, kodowanie binarne, tekst w stylu RINEX-4/CSV (wartości rozdzielane przecinkami) i wybieralne modele efemeryd pozostają MODELLED.

seg-94bbcd43e03a = Projekt sygnału LEO, przelot i budżet łącza, Doppler oraz łączne pozycjonowanie GNSS+LEO, zbieżność PPP (precyzyjne pozycjonowanie punktowe), pozycjonowanie 5G NTN (sieć nienaziemna), transfer czasu LEO (<c1/>, <c2/>, <c3/>, <c4/>, <c5/>)

seg-4c37a8cfac87 = <c1/>, <c2/>: postacie zamknięte, spójność filtru (na przykład uśrednione po przebiegach NEES filtru PPP w jego paśmie { "95" }%) oraz porównania opublikowanych trendów; bez danych terenowych.

seg-91cf4e399f0a = Jeden system LEO-PNT od końca do końca (<c1/>)

seg-fb947da2e8b4 = <c1/>: każda przekazana wartość równa się własnemu wynikowi etapu wcześniejszego, a zmiana wejścia wcześniejszego przesuwa każdą zależną od niego wartość dalszą.

seg-7e230aa73770 = Odporność LEO i obszary pionowe (spoofing przez Doppler i przez spójność międzypasmową, sondowanie jonosfery)

seg-ab2542cfc295 = <c1/> ({ "10" } testów). Scenariusze odporności i pionowe są wymienione w <a1><c2/></a1>.

seg-2d3ead293658 = Wyniki będące renderingami, a nie dowodami, mają testy, ale nie mają wiersza w macierzy: eksporty wymiany (CZML (Cesium Language), KML (Keyhole Markup Language), GeoJSON, efemeryda STK (Systems Tool Kit), SigMF (Signal Metadata Format)), każdy wczytany z powrotem przez walidator napisany ze specyfikacji formatu (<c1/>, { "13" } testów; zob. <a1><c2/></a1>); animacje (<c3/>: powtórne przebiegi identyczne co do bajtu, dokładne liczby klatek, poprawnie sformułowany SVG (Scalable Vector Graphics), brak zewnętrznego adresu w odtwarzaczu HTML (HyperText Markup Language)); oraz raport z przebiegu (<c4/>, <c5/>: każdy dołączony scenariusz raportuje bez pustej sekcji i wartości zastępczej, etykiety odpowiadają macierzy, a zapisane polecenie odtwarza <c6/> i raport bajt po bajcie).

seg-903e4e51dda1 = Obwiednia działania

seg-e226ad523a3d = Każdy pakiet jest ćwiczony w całym zadeklarowanym zakresie wejść przez <c1/>, który potwierdza, że każde liczbowe wyjście jest skończone (bez NaN/Inf (NaN: nie liczba)) i ograniczone. Tabela podaje przetestowany zakres wejść dla każdego pakietu, oczekiwane zachowanie wyjścia i test pokrywający.

seg-8bd4f586f3c7 = Zmieniane wejście

seg-3ebc1201a545 = Przetestowany zakres

seg-a1198518d667 = Oczekiwane wyjście

seg-7bf563f5420a = Test pokrywający

seg-4906c027a805 = <c1/> (specyfikacja czasu)

seg-d91e18ce3773 = { "1" } – { "500" } ns

seg-10cf765fdd75 = skończone wskaźniki jakości holdover/czasu/bezpieczeństwa

seg-fe640e9c3c1e = { "1e-7" } – { "1e-2" } m/s² (zimne atomy → prymitywny MEMS (mikroukłady elektromechaniczne))

seg-456c32a126a2 = skończone, ograniczone RMS/p95 pozycji

seg-dae96fd3a01b = <c1/> (maska elewacji)

seg-a54c3c8933c6 = skończone DOP/dostępność; ograniczone

seg-bf506e17cf81 = { "0.1" } – { "50" } ns/s

seg-b6d0d587046e = skończone P_md / bezpieczeństwo, ograniczone

seg-fda0b32d7784 = { "10" } – { "1000" } m

seg-132fdea2270f = skończony holdover czasu/pozycji

seg-c9099375b99f = orbita (rzeczywista)

seg-952b94eda0ff = rzeczywiste TLE Celestrak <c1/>

seg-60009932477c = migawka 30 satelitów, ścisła kontrola sum kontrolnych

seg-deb16d50741e = wczytuje się tylko z poprawnymi sumami kontrolnymi; ograniczona geometria

seg-c46d726e35b3 = zegar (flicker)

seg-15939085bf3a = <c1/> włączone/wyłączone

seg-504a95f55b88 = { "0" } wobec { "1e-12" }

seg-e1cce0c2028e = włączenie progu 1/f <b>pogarsza</b> wybieg p95 czasu

seg-bdd4e56bdef9 = fuzja (realizm)

seg-09af9dd78fe3 = <c1/> { "0" } wobec { "5.88e-7" } m/s²

seg-0a6723be642c = zero wobec realistycznej wartości niezerowej

seg-a9eb04be2b9f = filtr nadal jest zbieżny, w granicach { "3" }× błędu przy zerowym biasie

seg-2a839953aa6a = Wiersze flicker-FM i biasu fuzji zamykają dwie konkretne luki realizmu: człony szumu są <b>domyślnie wyłączone, ale po włączeniu wyraźnie wpływają na wynik</b>, a łączny filtr fuzji <b>nie zależy od tego, że biasy są wyzerowane</b>: jest zbieżny także przy realistycznym resztkowym biasie klasy zimnych atomów.

seg-4f0e9f9d4cdf = Przebiegi kwantowe i klasyczne używają teraz niezależnych ziaren RNG (generator liczb losowych) (ziarno klasyczne = ziarno + 0x9e3779b97f4a7c15), więc ich realizacje szumu są nieskorelowane: poprawione po przeglądzie.

seg-3b6b785f401a = <c1/> uwzględnia segmenty: osie czasu utraty sygnału są dzielone na ciągłe segmenty przy ponownym zdobyciu GNSS, a podawana wartość to najgorszy (najkrótszy) wybieg spośród nich. Pozostaje ograniczona rozdzielczością siatki czasu (dolna granica).

seg-4a830113b13d = Ponowna synchronizacja transferu czasu ISL modeluje resztkową niepewność łącza jako świeży jitter o zerowej średniej w każdym kroku pomiaru plus ponowne zakotwiczenie w skonfigurowanym odstępie.

seg-30c4d89aa433 = Deklaracje a rzeczywistość: krótkie zestawienie

seg-27a22de7b8c0 = Lista kontrolna wrogiego recenzenta. Dla każdego terminu, który można odczytać jako coś więcej, niż jest: co Kshana robi dziś i gdzie na mapie drogowej leży prawdziwa wersja.

seg-759eb0cfafe4 = Termin, który można zobaczyć

seg-6a2d3691d642 = Czym naprawdę jest dziś

seg-bbd0145bfb95 = Czym <b>nie</b> jest (jeszcze)

seg-a6fdb038b003 = „hybrydowy symulator kwantowego/klasycznego PNT”

seg-4421f8bd0967 = klasyczny symulator stochastyczny sterowany opublikowanymi współczynnikami Allana/szumu czujników kwantowych

seg-3885661aafff = fizyka kwantowa z zasad pierwszych (faza Macha–Zehndera, szum projekcji, błędy systematyczne): zob. <a1><c1/></a1>

seg-1d28debd0302 = „łączna fuzja Kalmana” / pakiet fusion

seg-d13beba21ba7 = uruchamialny pakiet <c1/> obserwuje zegar i pozycję <b>osobno</b> (bezpośrednia poprawka czasu i bezpośrednia poprawka pozycji), dla czego optymalny estymator jest rzeczywiście blokowo-diagonalny: dwa dwustanowe filtry ze wspólnym wskaźnikiem jakości

seg-25c2fe6fa6d3 = <em>sprzężony</em> filtr dla przypadku <b>pseudoodległości</b> już <b>istnieje</b> jako <c1/> (4-stanowy ułożony <c2/>, niezerowa kowariancja międzyblokowa, sprawdzony pod kątem NEES), ale <b>nie jest jeszcze podłączony do uruchamialnego pakietu</b>, a pakiet jest <b>1-DOF (jeden stopień swobody)</b>: rozszerzenie 3-D z 8 stanami to praca na przyszłość

seg-5cce1ca5b86f = Wskaźnik jakości bezpieczeństwa (rodzaj <c1/>)

seg-d55c30f63023 = <c1/> <b>stochastycznego detektora fałszowania czasu</b>: dwustronny test χ²₁ / Neymana–Pearsona na statystyce monitora wspomaganego zegarem, z progiem ustawionym z docelowego <c2/>, <c3/> obliczone <b>przy wielkości ze specyfikacji</b> zarówno w postaci zamkniętej, jak i metodą Monte Carlo (zgodne z dokładnością kilku ×1/√N)

seg-dbf2039a4a8e = wielosatelitarny detektor RAIM/ARAIM: zob. <a1><c1/></a1>; statystyka monitora jest modelem gaussowskim ze σ zegara wyprowadzonym z PSD, a nie korelacją na poziomie sygnału

seg-32bcb801e49c = „detekcja spoofingu wspomagana zegarem”

seg-58e4d22075e9 = <b>jednozegarowy</b> monitor rozbieżności czasu (statystyka gaussowska, σ z PSD zegara), NIE wielosatelitarny (SV: pojazd kosmiczny, czyli satelita) RAIM

seg-f3f6f95bc559 = RAIM wielosatelitarny w dziedzinie zasięgu z poziomami ochrony

seg-a5faedaab13e = P_md detektora spoofingu (postać zamknięta wobec Monte Carlo)

seg-0362489c341a = analityczne <c2/> oparte na <c1/> i empiryczna estymata z prób <c3/> zgadzają się w granicach błędu próbkowania (≈ 1/√N); sprawdzone w testach <c4/> / <c5/> przy wymuszonym odchyleniu (μ/σ = { "2" })

seg-8fa5c9468ff5 = zmierzona ROC detektora na zarejestrowanych danych spoofingu

seg-8f895aa1c657 = model pseudoodległości <c1/>

seg-a5e5e1e7a0e9 = <b>symulacja prosta</b>: <c1/>. Każdy model atmosfery jest testowany jednostkowo względem wartości policzonych ręcznie (ZHD (zenitowe opóźnienie hydrostatyczne) ≈ { "2.3" } m, Niell = { "1" } w zenicie, skośność Klobuchara), a pełny nadawany model Klobuchara jest <b>skontrolowany krzyżowo względem implementacji referencyjnej <c2/> z RTKLIB</b> z dokładnością poniżej milimetra (<c3/>, { "6.1278" } m dla przypadku domyślnych współczynników RTKLIB; nie istnieje oficjalny opublikowany wektor testowy Klobuchara, więc to jest parytet implementacji, a nie zmierzona prawda); <b>przebieg bez szumu odtwarza geometrię + poprawki z dokładnością poniżej milimetra</b> (residuum RAIM ≈ { "0" })

seg-adc8a5d89cbd = <b>rozwiązanie</b> pozycji z rzeczywistych sygnałów (PPP/RTK (PPP: precyzyjne pozycjonowanie punktowe)), dwuczęstotliwościowa kombinacja bez wpływu jonosfery lub rozwiązywanie niejednoznaczności fazy nośnej: niezamodelowane

seg-a56533528c6e = model jammingu (rodzaj <c1/>)

seg-0a4a28fcd53a = łańcuch <b>budżetu łącza</b>: J/S ze straty propagacji w wolnej przestrzeni + zysku anteny dla każdego kierunku → efektywne C/N₀ z równania antyzakłóceniowego (zysk rozpraszania × separacja widmowa <c1/>) → utrata synchronizacji przy progu (Kaplan & Hegarty §{ "9.4" })

seg-b53e210487fb = wielodrogowość, dynamika AGC (automatyczna regulacja wzmocnienia) w czasie, sam przeszukiwanie akwizycji (opcjonalna histereza <c1/> to para progów); opcjonalna strata kwantyzatora <c2/> dotyczy wejścia gaussowskiego i nie obowiązuje dla zakłócacza CW; opcjonalna tablica <c3/> jest wąskopasmowa i idealna (bez sprzężeń i niedopasowań), a opcjonalne zacienianie <c4/> to jedna krawędź noża na jednym kafelku SRTM; <c5/> jest reprezentatywną stałą dla danego typu, a nie wyprowadzoną ze zmierzonego PSD zakłócacza

seg-523d66d56f97 = Wskaźnik jakości integralności (pakiety zegara/holdover)

seg-d0702ee52d37 = <b>samospójność</b> filtru (ułamek próbek utraty sygnału wewnątrz jego własnej granicy k·σ)

seg-b4b68065e521 = HPL/VPL, ryzyko integralności / P_HMI, limity alarmowe, DO-229E/316/ED-259A: są raportowane osobno przez rodzaj <c1/> (RAIM / ARAIM) i funkcje SBAS, nigdy nie włączane do tego wskaźnika

seg-d5b1f858f0e3 = wskaźnik jakości starszego <b>pakietu</b> scenariuszy <c1/>

seg-e9fe365d7318 = <b>jednoosiowy (1-DOF)</b> budżet błędów akcelerometru/żyroskopu (VRW/ARW, niestabilność biasu) z resetem do prawdy

seg-604e8d96c2c2 = <em>starszy</em> pakiet jest 1-DOF; <b>ścieżka 3-osiowa jest dostarczana w pakiecie <c1/></b> (następny wiersz)

seg-e2a4a1c47f2c = 3-osiowa <b>biblioteka</b> strapdown + <b>pakiet</b> <c1/> (<c2/>, <c3/>)

seg-01e5672a37a4 = zweryfikowany nawigator kwaternionowy/NED (NED: północ-wschód-dół) z deterministycznym modelem błędów IMU: modelowane są <b>współczynnik skali, niewspółosiowość, wrażliwość na g, kwantyzacja, narastanie szybkości</b> (IEEE Std 952-1997 §A.2; Groves { "2013" } §{ "4.3" }), teraz <b>sterowane przez pakiet scenariuszy <c1/></b> i <b>konfigurowalne dla każdego czujnika z TOML (Tom's Obvious Minimal Language, format scenariusza)</b> (<c2/>)

seg-acecd6b81859 = <b>niezamodelowane:</b> błąd prostowania drgań, dryf od gradientu temperatury. Błąd wybiegu fuzji jest ograniczony od dołu przez błąd orientacji przy przekazaniu (pochylenie/bias akcelerometru słabo rozdzielne), więc kalibracja poszczególnych biasów nie jest deklarowana

seg-6b04fc376c0d = „Hybrydowa integracja PNT” (pakiet <c1/>)

seg-cd3125081b5c = nawigacja zliczeniowa w pętli otwartej ograniczona resetami GNSS do prawdy

seg-578c93c67ae7 = sprzężone (luźno/ściśle) połączenie GNSS–INS filtrem Kalmana: to osobny pakiet <c1/> (EKF) i rodzaj <c2/>

seg-57f603da0331 = „Positioning Performance” (pakiety zegara)

seg-278aafe7fadf = RMS <b>czasu</b> fazy zegara w ns (<c1/>)

seg-a6af364cbcdc = dokładność w dziedzinie pozycji ważona RMS/CEP/SEP/DOP (SEP: sferyczny błąd prawdopodobny)

seg-b68c5a4363a5 = inercjalny wskaźnik jakości pozycji (<c1/>)

seg-850e030bb5e3 = <b>jednoosiowe</b> RMS/p95 pozycji w metrach, z jednego ziarna, chyba że <c1/> żąda zespołu (wtedy średnia, rozrzut i bootstrapowy { "95" }% przedział ufności dla każdej metryki)

seg-be77929afa2c = rozkład CEP / 2DRMS (dwukrotne RMS odległości) zespołu (mapa drogowa: CEP metodą Monte Carlo)

seg-75f239679dc2 = „sprawdzone z dokładnością do ~{ "2" }%”

seg-2d593a99a2b1 = <em>typowa</em> zaobserwowana zgodność; <b>wymuszana bramka to { "20" }–{ "25" }%</b> błędu względnego

seg-34cfd0e08235 = gwarantowana granica dokładności { "2" }%

seg-d3402cc1ebd5 = „odtwarzalne / identyczne co do bitu”
