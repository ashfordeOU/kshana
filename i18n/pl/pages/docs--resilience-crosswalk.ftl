# docs--resilience-crosswalk: translations (pl)

seg-aab745a65e76 = Moduł

seg-88372b30ed79 = Limit

seg-ad856ad710eb = Status

seg-b03d56f501c3 = Rodzaj

seg-4dbf41c0ec3b = Funkcja

seg-f472e43c1100 = Co pokazuje

seg-fa4468d4cb80 = Dostępność

seg-fe4d868448ef = Źródło: <c1/>

seg-d745715d5332 = Powiązanie ram odporności PNT

seg-aa1c24d63df5 = <b>Dostosowane do ram, a nie ocenione ani zatwierdzone.</b> Ta tabela odnosi symulowane możliwości Kshana do opublikowanych ram odporności PNT (PNT: pozycjonowanie, nawigacja i czas). Jest to <em>samoocena wyprowadzona z symulacji, dostosowana do</em> ram DHS/CISA (DHS: Department of Homeland Security; CISA: Cybersecurity and Infrastructure Security Agency) Resilient PNT Conformance Framework (RPCF) v2.0, modelu RethinkPNT/Firesmith Resist-Detect-Respond-Recover (RDRR) oraz kryteriów odpornego PNT Yang Yuanxi. To <b>nie</b> jest ocena, zatwierdzenie, akredytacja ani oświadczenie compliance i nie zawiera poparcia ze strony DHS, IEEE (Institute of Electrical and Electronics Engineers) ani żadnego organu. Każdy wiersz ma oznaczony swój uczciwy status weryfikacji (<c1/> względem zewnętrznej wyroczni lub <c2/> z pierwszych zasad z testami); sama warstwa oceny odporności jest <b>MODELLED</b>. Dwa jej jądra mają własne wiersze VALIDATED w macierzy weryfikacji: jądro różnorodności odwrotnego Simpsona (<c3/>) i jądro statystyk rangowych (<c4/>); to potwierdza arytmetykę, a nie oceny zbudowane na jej podstawie.

seg-652fcf3ec12d = Silnik oceny (<c1/>) korzysta z tych możliwości i zwraca oceny cząstkowe dla poszczególnych wymiarów, nigdy jednej fantomowej liczby. Maszynowo sprawdzane niezmienniki statusu opisano w <c2/>.

seg-7a71de89a9fd = DHS RPCF v2.0: co definiują ramy i własne kategorie ocen cząstkowych Kshana

seg-1985dbfe351d = Opublikowane ramy (Resilient PNT Conformance Framework, Version { "2.0" }, { "26" } April { "2022" }, DHS Science and Technology Directorate z CISA) definiują trzy <b>funkcje podstawowe</b> (sekcja { "5.2" }: Prevent, Respond, Recover), <b>poziomy odporności od { "0" } do { "4" }</b> (sekcja { "5.3" }) oraz <b>osiem ponumerowanych wymagań minimalnych</b> rozłożonych na Poziomy od { "1" } do { "4" } (sekcja { "5.3" }, powtórzone w { "5.5" }), a także podejście do oceny (sekcja { "8" }). <b>Nie</b> definiują listy siedmiu kategorii technik. Wcześniejsza wersja tej strony i komentarze w module odporności opisywały siedem „kategorii technik RPCF”; słowa Obfuscate i Diversify nie występują w v2.0. Tekst tego dokumentu został ponownie przeczytany 2026-10-09 i takiej listy nie znaleziono.

seg-178d1e119dce = Siedem nazw ocen cząstkowych, które zwraca silnik oceny (Obfuscate, Limit, Verify, Isolate, Diversify, Mitigate, Recover; „OLVIDMR” to nasz skrót mnemotechniczny), to zatem <b>własne kategorie oceny Kshana</b>, zachowane dla stabilności wyników. Nie są to terminy DHS, a poniższe wiersze nie twierdzą, że DHS ich wymaga. Jeśli kategoria odpowiada wymaganiu ram, mówi o tym ostatnia kolumna; jeśli nie, podaje „none”.

seg-5a9eb11bb965 = Kategoria oceny cząstkowej Kshana

seg-e117e6f71845 = Możliwość Kshana użyta jako czynnik napędowy

seg-7677dafa7016 = Najbliższe odniesienie w RPCF v2.0

seg-27e0f6b39605 = Obfuscate

seg-7327b9cbc106 = Zadeklarowana technika × jakość źródła (brak bezpośredniego czynnika behawioralnego)

seg-b63e61fa5fa2 = none (technika prewencyjna; sekcja { "5.2" }, Prevent)

seg-7ed4f2e21189 = Zadeklarowana technika × jakość źródła

seg-8579207ae2e5 = Verify

seg-30b8cb030965 = AUC (pole pod krzywą) detektora zaburzeń w danym scenariuszu (monitory spoofingu, jammingu i meaconingu)

seg-3d358c029f50 = Poziom { "2" }, wymaganie { "4" }; Poziom { "3" }, wymaganie { "7" }

seg-fcb8cb7d4c97 = Isolate

seg-b3cd355743da = Poziom { "3" }, wymaganie { "6" }

seg-ffa87d149a20 = Diversify

seg-1282685a888b = Liczba niezależnych grup → efektywna różnorodność według odwrotnego Simpsona

seg-f0dd4c4ef1c5 = Poziom { "4" }, wymaganie { "8" }; sekcja { "5.5" } (tryb wspólny)

seg-2d91b12a9e56 = Mitigate

seg-d183b552df76 = Dostępność w warunkach odmowy

seg-c337df73e231 = sekcja { "5.2" }, Respond

seg-2da4df22d35d = Recover

seg-85d7e3292549 = Holdover (dryf) × bramka ograniczonej degradacji

seg-3aec9f076902 = Poziom { "2" }, wymaganie { "5" }; sekcja { "5.2" }, Recover

seg-36958650abc0 = Odwzorowanie poszczególnych wymagań na rzeczywiste ramy, z informacją, na co wyniki Kshana dostarczają dowodów (supports evidence for) i co pozostaje poza nimi, znajduje się w <a1>compliance/dhs-rpcf.md</a1>.

seg-a085dd81c769 = Funkcje RethinkPNT / Firesmith RDRR

seg-1b972717180b = Czynnik napędowy

seg-6eaf161f8871 = Resist

seg-6046a8914dc7 = Średnia ocen cząstkowych Obfuscate/Limit/Isolate/Diversify

seg-242e2c01ebc2 = Detect

seg-45c8da13581f = Ocena cząstkowa Verify (AUC detektora)

seg-d29232baaaa6 = Respond

seg-36ab7ce187e6 = Ocena cząstkowa Mitigate (dostępność)

seg-f98dc190541c = Holdover × ograniczona bramka; kluczowe wskaźniki efektywności osi czasu odporności (KPI: detekcja/reakcja/odtworzenie/utrata)

seg-e7190928bed6 = Kryteria Yang Yuanxi (podzbiór, którego dotyczą wskaźniki jakości czasu i detekcji)

seg-52836e247425 = Kryterium

seg-cbbe4c0baf3f = Niezawodność

seg-32d64f865b21 = Odsetek integralności filtra

seg-214372f29bd1 = Ciągłość

seg-ad5e76a596b8 = Holdover × ograniczona bramka

seg-d92fb15e6dfa = Dokładność

seg-0de1f9119e0f = Zastępnik czasu/jakości: <b>dokładność w dziedzinie pozycji nie wchodzi do oceny</b>. <c1/> zamienia podaną kowariancję pozycji i HPL (poziom ochrony w płaszczyźnie poziomej) na CEP/SEP/2DRMS (circular error probable, spherical error probable, dwukrotność pierwiastka ze średniej kwadratowej odległości), ale żaden scenariusz nie przekazuje tego do oceny odporności

seg-0aa925a09499 = MODELLED (tylko w dziedzinie czasu)

seg-6b661e6e4399 = Czego to powiązanie nie twierdzi

seg-51a48d0c718d = Brak nadanego Poziomu RPCF. Przypisany Poziom to <em>wstępny odczyt wyprowadzony z symulacji</em> z jawną bramką ograniczonej degradacji, a nie nadany poziom dojrzałości.

seg-df73b7c76ae5 = Brak dokładności w dziedzinie pozycji w ocenie. Oceny cząstkowe odporności są budowane z metryk dziedziny czasu i detekcji. Silnik oblicza pozycje w innych miejscach (rodzaje <c1/>, <c2/> i <c3/>) oraz poziomy ochrony (rodzaj <c4/>), ale warstwa oceny z nich nie korzysta.

seg-30a1b1a4dfea = Brak walidacji terenowej. Panel referencyjny i zespół zagrożeń są syntetyczne, to uproszczenia oparte na parametrach (<c1/>), podane jako ograniczenie pierwszorzędne.

seg-83c465cd78b0 = Badanie towarzyszące (<c1/>) istnieje właśnie po to, by pokazać, że zwinięcie tych wymiarów do jednej oceny łącznej lub jednego Poziomu daje ocenę, której ranking architektur jest niestabilny przy dających się obronić wagach i wyborach zagrożeń, więc to powiązanie jest warstwą pomiarową, którą należy czytać wymiar po wymiarze, a nie jedną oceną, według której można ocenić produkt.

seg-32bd45dc031d = Scenariusze odporności i pionowe, które uruchamiają te warstwy

seg-4e36adba1c55 = Dołączone poniżej scenariusze uruchamiają mechanizmy zagrożeń i odtwarzania, na które wskazują wiersze powiązania. Każdy to rzeczywisty przebieg wskazanego rodzaju; każdy jest <b>MODELLED</b> (bez danych terenowych).

seg-44664e49d449 = Scenariusz (<c1/>)

seg-44b8d7435bfd = Warstwowe PNT pod wspólnym zagrożeniem zagłuszaniem i spoofingiem: Monte Carlo odmowy warstw z ziarnem (seed), fuzja ocalałych warstw metodą odwrotnej wariancji, stosunek całkowitej utraty dla jednej warstwy do układu warstwowego oraz to, jak skorelowana odmowa ten stosunek załamuje. Jego tożsamości Monte Carlo ze wzorem zamkniętym i tożsamości fuzji są sprawdzane testami w samym crate; ten rodzaj nie ma wiersza w macierzy weryfikacji, więc jest tu oceniony jako MODELLED.

seg-1734506ad287 = GNSS (globalny system nawigacji satelitarnej) zagłuszony, warstwa PNT na niskiej orbicie okołoziemskiej (LEO) obsługuje użytkownika, integralność zachowana (trzy fazy na jednej osi czasu).

seg-ff8cc090bdce = Jeden zagłuszacz przeciw czteropasmowemu odbiornikowi; który monitor spoofingu widzi którego spoofera.

seg-0a93502a4a19 = Margines stosunku zagłuszacza do sygnału (J/S) wyznaczony z mocy odebranej.

seg-f2230253bdff = Detekcja spoofingu przez spójność dopplerowską i geometrii przelotu.

seg-d8ca900a8c14 = Synchronizacja czasu stacji bazowych i infrastruktury krytycznej w holdover, z czasem LEO.

seg-2a61d07bf177 = Użytkownicy drogowi, kolejowi, morscy, polarni i Internetu rzeczy (IoT) z warstwą LEO.

seg-8723073167ad = Nawigacja zliczeniowa GNSS/INS (INS: inercyjny system nawigacji) przez kanion miejski i przez zagłuszanie na małym bezzałogowym statku powietrznym.

seg-6ee1ef707b20 = Jak długo INS utrzymuje statek lub pociąg w granicach limitu przy odmowie GNSS.

seg-7ca913e1729b = Zagłuszacz morski; detekcja spoofera, który przesuwa zgłaszaną pozycję statku.

seg-c49548e8393b = <s1>Poprzednia</s1>Mapa DO-316 / DO-229E

seg-dedf3b53d31f = <s1>Następna</s1>Zaufanie do odbiornika
