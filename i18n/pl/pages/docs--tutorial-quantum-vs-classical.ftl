# docs--tutorial-quantum-vs-classical: translations (pl)

seg-501d3a72ea43 = Integralność

seg-8980b5ae869b = Wartość

seg-e5f926d1055b = Pułapki i jednostki

seg-cb457294fc53 = Co dalej

seg-a3686dd6817d = Źródło: <c1/>

seg-0c2365600795 = Samouczek { "3" } — Odporność kwantowa a klasyczna GNSS (zwieńczenie)

seg-cc4017642043 = <c1/> + <c2/> · <b>Scenariusze:</b> <c3/>, <c4/> (kopie dydaktyczne: <a1><c5/></a1>, <a2><c6/></a2>) · <b>Poziom trudności:</b> średniozaawansowany · <b>~{ "35" } min</b>

seg-5de2e6656527 = Zwieńczenie. Uruchomisz scenariusz detektora spoofingu i pełny zestaw fuzji PNT (pozycjonowania, nawigacji i czasu) oraz nauczysz się czytać razem <b>bezpieczeństwo</b>, <b>integralność</b> i <b>nawigację zliczeniową</b> — cała teza: inercja kwantowa i czas optyczny dają odporność, którą odmowa GNSS (globalnego systemu nawigacji satelitarnej) w przeciwnym razie by odebrała.

seg-ffa5242638c2 = Część A — Bezpieczeństwo: wykrywanie spoofingu czasu

seg-23c18da1415f = Atakujący wprowadza powoli narastający fałszywy czas GNSS ({ "0.1" } ns/s, od t = { "60" } s). Odbiornik porównuje zadeklarowany czas z przewidywaniem własnego zegara w dryfie i zgłasza spoofing, gdy rozbieżność przekracza granicę detekcji. Detektorem jest dwustronny <b>test energii χ²₁ / Neymana–Pearsona</b> przy prawdopodobieństwie fałszywego alarmu P_fa = { "0.01" }; wskaźnikiem jakości Security jest <b><c1/></b> (jeden minus prawdopodobieństwo niewykrycia) przy spoofingu o wielkości zgodnej ze specyfikacją ({ "20" } ns).

seg-46aa0e01b330 = <b>Kwantowy: <c1/>, wykryty w { "70" } s.</b> Próg detekcji zegara optycznego to ułamek nanosekundy, więc zgłasza spoofing niemal natychmiast — daleko poniżej specyfikacji { "20" } ns.

seg-022573b3dcc4 = <b>Klasyczny: <c1/>, wykryty w { "430" } s.</b> Własny szum dryfu atomowego zegara w skali układu scalonego (CSAC) w oknie jest porównywalny z { "20" } ns, więc często nie potrafi odróżnić spoofingu od własnego dryfu — przegapia go w { "44" } % przypadków.

seg-27b2b715efcb = Niecykliczna wyrocznia: analityczne a Monte Carlo P_md

seg-c85651eebd32 = Prawdopodobieństwo niewykrycia detektora jest obliczane <b>na dwa niezależne sposoby</b>, które muszą się zgadzać: <b>ogon χ²₁ w postaci zamkniętej</b> (wynik Neymana–Pearsona) i oszacowanie <b>Monte Carlo</b> (MC). Dla CSAC analityczne P_md wynosi <c1/>, a MC P_md <c2/> — zgadzają się z dokładnością { "0.002" }, dobrze w granicach błędu próbkowania <c3/>. Dla zegara optycznego oba wynoszą { "0.000" }. Zgodność dwóch osobnych obliczeń <em>tego samego</em> prawdopodobieństwa jest niecykliczną kontrolą krzyżową (Kay, <em>Fundamentals of Statistical Signal Processing: Detection Theory</em>; standardowa detekcja NP / χ²). <c4/> sprawdza <c5/> dla obu zegarów oraz <c6/>.

seg-5cf0d909bac7 = Część B — Hybrydowy PNT: pełny zestaw fuzji

seg-498a57aae11d = Teraz scenariusz zwieńczenia łączy zegar optyczny i zimnoatomową inercyjną jednostkę pomiarową (IMU) (zestaw kwantowy) wobec CSAC i IMU klasy nawigacyjnej (zestaw klasyczny), przez tę samą przerwę GNSS { "6600" } s ({ "1.83" } h), przy specyfikacji czasu { "20" } ns i specyfikacji pozycji { "100" } m. Oba zestawy ponownie kotwiczą swoje zegary co { "60" } s przez to samo optyczne międzysatelitarne łącze transferu czasu, modelowane z jitterem { "1" } ps na jedną resynchronizację (<c1/> w scenariuszu; <c2/> buduje jedno łącze <c3/> dla obu zestawów).

seg-61934559c7a0 = Przeczytaj podział <c1/> — holdover czasu a holdover pozycji:

seg-dee5b1a35bdd = <b>Kwantowy: PNT-holdover { "6600" } s</b> — utrzymuje zarówno czas (t { "6600" } s), jak i pozycję (p { "6600" } s) przez całą przerwę.

seg-6441dfa026dc = <b>Klasyczny: PNT-holdover { "350" } s</b> — <em>czas</em> utrzymuje się przez całe { "6600" } s (t { "6600" } s), ponieważ optyczna resynchronizacja transferu czasu utrzymuje zablokowany nawet <em>zegar klasyczny</em>. Zestaw jest <b>ograniczony pozycją przy p { "350" } s</b>: IMU klasy nawigacyjnej jest słabym ogniwem. To teza fuzji — przypisać awarię zestawu klasycznego jego czujnikowi inercyjnemu.

seg-12e9b7192733 = <b><c1/> dla zestawu kwantowego jest prawdziwe i nie jest błędem.</b> To samospójność filtra przy zaszumionej resynchronizacji — <b>nie</b> lotnicza wartość integralności (poziom ochrony poziomy lub pionowy, HPL/VPL). Nie nadinterpretuj tu słowa „integralność”; zob. <a1><c2/></a1>.

seg-587efcdcbc13 = Niecykliczna wyrocznia: holdover pozycji { "350" } s

seg-a70ad8fc122f = Wartość { "350" } s to fizyka nawigacji zliczeniowej, a nie dopasowana liczba. Stała odchyłka akcelerometru <c1/> powoduje błąd pozycji równy <b>½·b·T²</b>. Przekroczenie specyfikacji { "100" } m:

seg-778e817e3e9b = Silnik raportuje { "350" } s, ostatni punkt siatki { "10" } s przed przekroczeniem i o { "2" } % mniej niż { "357" } s wynikające samej odchyłki: akcelerometry scenariusza niosą też szum błądzenia losowego prędkości (<c1/>), który dodaje się do dryfu odchyłki, więc modelowany błąd osiąga { "100" } m nieco wcześniej.

seg-e105a8ab605b = Prawo źródłowe: Groves, <em>Principles of GNSS, Inertial, and Multisensor Integrated Navigation</em> (wyd. 2), wzrost błędu w nawigacji zliczeniowej. Te dwie wartości ½bT² tłumaczą podział silnika { "350" } s / { "6600" } s: zamknięta kontrola fizyczna, zewnętrzna wobec filtra.

seg-c2515e55dffa = Słabe ogniwo inercyjne widać bezpośrednio w scenariuszu nawigacji zliczeniowej (<a1><c1/></a1>, rodzaj <c2/>): <c3/>: czujnik klasy nawigacyjnej rozbiega się do dziesiątek kilometrów.

seg-6c688f2e7136 = Jak czytać razem trzy wartości

seg-4f1a49d61cee = Co to znaczy tutaj

seg-2e91989b1a89 = Czego to <b>nie</b> oznacza

seg-b403ce86b14d = analityczna granica <em>wykrywalności</em> spoofingu (<c1/>) dla skonfigurowanego ataku; podsumowanie <c2/> drukuje <c3/>, ponieważ ten scenariusz żadnego nie konfiguruje

seg-e04c25dd278d = nie jest detektorem RAIM wielosatelitarnym (autonomiczne monitorowanie integralności przez odbiornik)

seg-7e678dd4409e = samospójność filtra (próbki wewnątrz granicy k-σ)

seg-1643e7e71209 = nie jest integralnością lotniczą HPL/VPL/RAIM

seg-4095f7ab4b14 = czas w specyfikacji po utracie GNSS, rozdzielony na czas i pozycję
