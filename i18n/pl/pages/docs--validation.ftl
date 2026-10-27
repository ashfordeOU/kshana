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
