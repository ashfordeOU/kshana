# site-js.ftl (pl): translations

js-app-engine-failed = Nie udało się załadować silnika ({ $reason }).

js-ledger-rows =
    { $n ->
        [one] { $n } wiersz rejestru
        [few] { $n } wiersze rejestru
        [many] { $n } wierszy rejestru
       *[other] { $n } wiersza rejestru
    }

js-site-action-copy-install = Kopiuj: cargo install kshana

js-site-action-launch = Uruchom { $name }

js-site-action-licence = Porozmawiaj z nami o licencji komercyjnej

js-site-action-pro-eval = Poproś o ocenę Kshana Pro

js-site-action-study = Zamów badanie

js-site-action-theme = Przełącz jasny lub ciemny motyw

js-site-capabilities-bd-after = { $m } m po { $s } s

js-site-capabilities-bd-combined = łącznie

js-site-capabilities-bd-crossing = { $m } m przy { $s } s

js-site-capabilities-bd-fig-crossing = «{ $m } m» po { $s } s, dominuje { $dom }

js-site-capabilities-bd-fig-lead = Czas od utraty GNSS na osi logarytmicznej, IMU klasy { $grade } przy { $speed } m/s:

js-site-capabilities-bd-fig-tail = Linie to prawa wzrostu silnika dla krótkiego dryfu i ich pierwiastek z sumy kwadratów; przecięcia pochodzą z jego pełnego dziewięciostanowego modelu błędu (Schulera), który ogranicza składniki biasu, więc przy długim dryfie każde przecięcie następuje nieco później, niż dociera do niego linia. Słupki: te same przecięcia dla czterech klas IMU.

js-site-capabilities-cd-canvas-aria = Konstelacja wokół swojego ciała, prawdziwe zdjęcia: przeciągnij lub użyj strzałek, aby obracać, plus i minus, aby powiększać

js-site-capabilities-cd-design-meta = { $n } satelitów · { $body } · { $file }

js-site-capabilities-cd-foot-frozen = Każdy satelita podąża własnym śladem silnika; promień orbity zamrożonej wynika z elementów powłoki.

js-site-capabilities-cd-foot-mean-motion = Każdy satelita podąża własnym śladem silnika, po promieniu wynikającym z jego ruchu średniego.

js-site-capabilities-cd-foot-walker = Wszystkie { $n } satelity rozmieszczono według własnych parametrów Walkera powłok (sprawdzonych względem { $shown } śladów silnika: najgorszy { $deg }°); smugi to { $shown } śladów silnika.

js-site-capabilities-cd-hud-body = { $body } · «{ $n }» satelitów

js-site-capabilities-cd-hud-mission = Misja «{ $time }»

js-site-capabilities-cd-legend-shell = powłoka { $n } · { $inc }°

js-site-capabilities-cd-map-availability = Udział przebiegu z PDOP ≤ { $limit } (0 do 100 %)

js-site-capabilities-cd-map-pdop = Średni PDOP na komórkę { $step }° ({ $lo } do { $hi }; jaśniej znaczy lepiej)

js-site-capabilities-cd-map-visible = Średnia liczba satelitów w zasięgu widzenia ({ $lo } do { $hi })

js-site-capabilities-cd-metric-availability = Dostępność

js-site-capabilities-cd-metric-pdop = Średni PDOP

js-site-capabilities-cd-metric-visible = W zasięgu widzenia

js-site-capabilities-cd-no-webgl = Widok 3D wymaga WebGL; mapa pokrycia i wartości pochodzą z tego samego przebiegu.

js-site-capabilities-cd-pause = Wstrzymaj orbity

js-site-capabilities-cd-play = Odtwórz orbity

js-site-capabilities-cd-shell = { $name }: Walker { $pattern } { $total }/{ $planes }/{ $phasing } · { $alt } km · { $inc }°

js-site-capabilities-cd-slots = { $name }: { $n } satelitów, tabela slotów operatora

js-site-capabilities-cd-span = z { $dur }, w pętli

js-site-capabilities-cd-stat-in-view = Średnio w zasięgu widzenia

js-site-capabilities-cd-stat-mask = Maska · przebieg

js-site-capabilities-cd-stat-median = Mediana PDOP

js-site-capabilities-cd-stat-pdop = PDOP ≤ { $limit }, cały { $body }

js-site-capabilities-cd-stat-satellites = Satelity

js-site-capabilities-cd-stat-worst = Najgorsza lokalizacja

js-site-capabilities-cd-title-gnss = Cztery systemy GNSS razem

js-site-capabilities-cd-title-leo = Megakonstelacja na niskiej orbicie okołoziemskiej

js-site-capabilities-cd-title-lunar = Zestaw przekaźników księżycowych

js-site-capabilities-cd-work-ratio = { $pct } % po prefiltrze szerokości geograficznej · { $dop } rozwiązań DOP

js-site-capabilities-cd-work-tests = { $after } testów satelita–punkt z { $brute }, które wykonałby skan siłowy

js-site-capabilities-cd-work-title = Nakład pracy na widoczność

js-site-capabilities-cg-cn0-sub = C/N0 względem progu śledzenia

js-site-capabilities-cg-cn0-title = Gęstość widmowa nośnej do szumu

js-site-capabilities-cg-compose-availability = Dostępność

js-site-capabilities-cg-compose-fewest = Najmniej śledzonych

js-site-capabilities-cg-compose-js = Średnie J/S

js-site-capabilities-cg-compose-text = Jeden zagłuszacz, { $power } { $unit }, w jednym miejscu, powiązany z { $n } przebiegami składowymi rodzaju ‹{ $kind }›: statek w cieśninie i samochód na drodze nadbrzeżnej widzą tę samą przyczynę, a dostają różne odpowiedzi.

js-site-capabilities-cg-log-campaign = kampania { $file } · { $phases } faz · { $runs } przebiegów składowych

js-site-capabilities-cg-log-phase = faza { $name } się zaczyna

js-site-capabilities-cg-log-phase-carries = faza { $name } się zaczyna · przenosi { $carried }

js-site-capabilities-cg-monte-axis = końcowy błąd zegara dla { $n } ziaren ({ $path })

js-site-capabilities-cg-monte-ci = Średnia, przedział 95 %

js-site-capabilities-cg-monte-mean = Średnia

js-site-capabilities-cg-monte-p05 = 5.

js-site-capabilities-cg-monte-p05-p95 = od 5. do 95.

js-site-capabilities-cg-monte-p50 = mediana

js-site-capabilities-cg-monte-p95 = 95.

js-site-capabilities-cg-monte-std = Odchylenie standardowe

js-site-capabilities-cg-monte-text = Ten sam scenariusz ‹{ $kind }› uruchomiony { $n } razy z bazowego ziarna { $seed }, po jednym ziarnie na przebieg: rozrzut końcowego błędu swobodnie biegnącego zegara wraz z 95-procentowym przedziałem ufności średniej.

js-site-capabilities-cg-not-in-phase = nie w tej fazie

js-site-capabilities-cg-now = Faza { $n } z { $total }: { $name } · { $from } do { $to }

js-site-capabilities-cg-phase-title = { $name }: { $from } do { $to } · zakończona przez { $by } · rodzaje składowe { $kinds }

js-site-capabilities-cg-pl-sub = względem limitu alarmowego

js-site-capabilities-cg-pl-title = Poziom ochrony

js-site-capabilities-cg-pos-sub = względem budżetu · log

js-site-capabilities-cg-pos-title = Błąd pozycji inercyjnej

js-site-capabilities-cg-range = { $lo } do { $hi }

js-site-capabilities-cg-sweep-all-lost = Wszystkie utracone od

js-site-capabilities-cg-sweep-axis = moc nadawcza zagłuszacza ({ $key })

js-site-capabilities-cg-sweep-first-loss = Pierwsza utrata

js-site-capabilities-cg-sweep-lg-availability = dostępność

js-site-capabilities-cg-sweep-lg-js = średnie J/S

js-site-capabilities-cg-sweep-never = nigdy

js-site-capabilities-cg-sweep-nodes = Węzły

js-site-capabilities-cg-sweep-none = brak

js-site-capabilities-cg-sweep-span = zakres J/S

js-site-capabilities-cg-sweep-text = Jeden scenariusz ‹{ $kind }›, uruchamiany raz dla każdego węzła, gdy moc nadawcza zagłuszacza rośnie krokami od { $from } do { $to } { $unit }. Dostępność przy zagłuszaniu (linia ciągła) i średnie J/S (przerywana) pochodzą ze wskaźników jakości każdego przebiegu składowego.

js-site-capabilities-cg-te-sub = względem jego zabezpieczenia

js-site-capabilities-cg-te-title = Błąd czasu zegara

js-site-capabilities-copy = Kopiuj

js-site-capabilities-copy-aria = Skopiuj polecenie odtwarzające przebieg: kshana { $file }

js-site-capabilities-cz-best = Najlepszy PDOP

js-site-capabilities-cz-failed = Nie udało się tu załadować zarejestrowanego przebiegu; otwórz go zamiast tego w Studio.

js-site-capabilities-cz-fix = Próbki z rozwiązaniem pozycji

js-site-capabilities-cz-fix-value = { $n } z { $total } ({ $pct }%)

js-site-capabilities-cz-median = Mediana PDOP

js-site-capabilities-engine = Silnik v{ $version }

js-site-capabilities-engine-build = Silnik v{ $version }, kompilacja

js-site-capabilities-engine-report = Raport silnika

js-site-capabilities-globe-aria = { $name } na prawdziwych zdjęciach ({ $credit }). Przeciągnij lub użyj strzałek, aby obracać; plus i minus powiększają.

js-site-capabilities-ho-ends = przebieg kończy się o { $t }

js-site-capabilities-ho-past-guard = po przekroczeniu zabezpieczenia

js-site-capabilities-no-seed = deterministyczny, bez ziarna

js-site-capabilities-open-in-studio = Otwórz w { $studio }

js-site-capabilities-open-report = Otwórz raport silnika

js-site-capabilities-orrery-aria = Układ Słoneczny w epoce przebiegu: przeciągnij lub użyj strzałek, aby obracać, plus i minus, aby powiększać

js-site-capabilities-orrery-bodies = { $n } ciał · obserwator «{ $observer }»

js-site-capabilities-orrery-epoch = Epoka «{ $epoch }» · TDB (barycentryczny czas dynamiczny), data juliańska { $jd }

js-site-capabilities-pnt-chart-title = przekaźniki w zasięgu widzenia (linia) · Ziemia nad horyzontem (zacieniowanie) · cztery potrzebne do rozwiązania pozycji

js-site-capabilities-pnt-kicker = Pozycjonowanie przy tym ciele · rodzaj body-pnt

js-site-capabilities-pnt-lander = Lądownik na { $lat }°, { $lon }° na powierzchni nawiguje na podstawie przekaźników, z dwukierunkowym pomiarem odległości od Ziemi, ilekroć Ziemia jest nad horyzontem (czas przejścia światła w jedną stronę { $min } min). Dostępność: { $a } % tylko na przekaźnikach, { $b } % z łączem do Ziemi.

js-site-capabilities-pnt-orbiter = Użytkownik na orbicie nawiguje na podstawie przekaźników, z dwukierunkowym pomiarem odległości od Ziemi, ilekroć Ziemia jest nad horyzontem (czas przejścia światła w jedną stronę { $min } min). Dostępność: { $a } % tylko na przekaźnikach, { $b } % z łączem do Ziemi.

js-site-capabilities-pnt-relays = { $n } przekaźników na wysokości { $alt } km wokół { $body }

js-site-capabilities-report-data = Raport i dane

js-site-capabilities-result-data = Dane wyniku

js-site-capabilities-saved = Zapisano { $name }

js-site-capabilities-scenario-file = Plik scenariusza

js-site-capabilities-seed = ziarno { $seed }

js-site-capabilities-six-clock-fig = «{ $id }» utrzymuje się w granicach zabezpieczenia przez { $dur }

js-site-capabilities-six-clock-guard = zabezpieczenie { $v } ns

js-site-capabilities-six-coast-budget = budżet { $m } m

js-site-capabilities-six-coast-denied = GNSS niedostępny

js-site-capabilities-six-coast-fig = «{ $id }» w granicach budżetu przez { $s } s

js-site-capabilities-six-floor = próg śledzenia

js-site-capabilities-six-integ-fig = «{ $ok }» z { $n } epok dostępnych · limity alarmowe { $h } m w poziomie, { $v } m w pionie

js-site-capabilities-six-integ-limit = pionowy limit alarmowy

js-site-capabilities-six-integ-pl = pionowy (linia ciągła) i poziomy (przerywana) poziom ochrony

js-site-capabilities-six-jam-effective = efektywne, { $n } satelitów

js-site-capabilities-six-jam-fig = Śledzone «{ $min }» z { $max } w zasięgu widzenia · dostępność przy zagłuszaniu «{ $av }» (nominalnie { $nom }) · średnie J/S «{ $js } dB»

js-site-capabilities-six-jam-nominal = nominalnie, bez zagłuszacza (przerywana)

js-site-capabilities-six-orbit-fig = Wysokość «{ $lo }–{ $hi } km» · ślad podsatelitarny w ciągu { $dur }

js-site-capabilities-six-orbit-label = { $source } · { $n } próbek

js-site-capabilities-six-orbit-sgp4 = SGP4 z dwuwierszowego zestawu elementów

js-site-capabilities-six-spoof-detects = { $id } wykrywa

js-site-capabilities-six-spoof-fig = «{ $id }» wykrywa przy { $s } s (granica { $ns } ns)

js-site-capabilities-ss-angle = Kąt od Słońca

js-site-capabilities-ss-credit = Zdjęcia: { $credits }. * Mapa nie sięga biegunów; luka przyjmuje biegunowy średni kolor mapy. Pierścienie Saturna: { $ring } ({ $licence }).

js-site-capabilities-ss-days = { $v } dni

js-site-capabilities-ss-frame-origin = Początek układu

js-site-capabilities-ss-from-sun = Od Słońca

js-site-capabilities-ss-gloss = NAIF: kod ciała w Navigation and Ancillary Information Facility NASA. GM: parametr grawitacyjny. J2: człon spłaszczenia. Biegun IAU: biegun obrotu Międzynarodowej Unii Astronomicznej, jako rektascensja (RA) i deklinacja (Dec).

js-site-capabilities-ss-j2-none = brak opublikowanej wartości

js-site-capabilities-ss-kind = { $class } · NAIF { $naif }

js-site-capabilities-ss-kind-of = { $class } ciała { $parent } · NAIF { $naif }

js-site-capabilities-ss-light-time = Czas przejścia światła od { $observer }

js-site-capabilities-ss-link = { $from } do { $to }, czas przejścia światła w jedną stronę { $one }, tam i z powrotem { $two }

js-site-capabilities-ss-links-lead =
    { $n ->
        [one] Łącze, które oblicza ten przebieg:
        [few] Łącza, które oblicza ten przebieg:
        [many] Łączy, które oblicza ten przebieg:
       *[other] Łącza, które oblicza ten przebieg:
    }

js-site-capabilities-ss-moons =
    { $n ->
        [one] Jego księżyc, w skali, w epoce
        [few] Jego księżyce, w skali, w epoce
        [many] Jego księżyce, w skali, w epoce
       *[other] Jego księżyce, w skali, w epoce
    }

js-site-capabilities-ss-nominal-error = błąd nominalny { $km } km w odległości

js-site-capabilities-ss-north = Widok od północy ekliptyki.

js-site-capabilities-ss-period = Okres orbitalny

js-site-capabilities-ss-period-about = Okres wokół { $parent }

js-site-capabilities-ss-pole = Biegun IAU (RA, Dec)

js-site-capabilities-ss-radius = Średni promień

js-site-capabilities-ss-retrograde = { $v } h, ruch wsteczny

js-site-capabilities-ss-rotation = Obrót gwiazdowy

js-site-capabilities-ss-years = { $v } lat

js-site-capabilities-st-bound = granica { $v } m

js-site-capabilities-st-fig-none = { $n } epok, w żadnej błąd nie przekracza granicy. W poprzek: rzeczywisty błąd pozycji; w górę: poziom ochrony; obie osie logarytmiczne.

js-site-capabilities-st-fig-some = { $n } epok, w { $k } błąd przekracza granicę. W poprzek: rzeczywisty błąd pozycji; w górę: poziom ochrony; obie osie logarytmiczne.

js-site-capabilities-st-limit = limit alarmowy { $m } m

js-site-capabilities-st-misleading = wprowadzające w błąd: błąd powyżej granicy

js-site-capabilities-st-normal = praca normalna

js-site-capabilities-st-unavailable = niedostępne: granica powyżej limitu

js-site-capabilities-studio-embedded = { $studio }, osadzone: przebieg orbit-multignss

js-site-capabilities-studio-load = Załaduj tu { $studio }

js-site-capabilities-studio-outline = Pokaż ponownie konspekt

js-site-capabilities-wave-chirp = chirp

js-site-capabilities-wave-cw = ton CW

js-site-capabilities-wave-noise = szum

js-site-capabilities-wf-an-caption = wiersz T+{ $t } s · dB powyżej progu, skala logarytmiczna · szczyt całej siatki { $peak } dB

js-site-capabilities-wf-degraded = Pogorszone

js-site-capabilities-wf-degraded-low = pogorszone

js-site-capabilities-wf-failed = Nie udało się tu załadować zarejestrowanego przebiegu.

js-site-capabilities-wf-grid = siatka

js-site-capabilities-wf-iq = Przy T+{ $t } s silnik rysuje też model jako { $n } próbek IQ (współfazowych i kwadraturowych) wokół { $mhz } MHz i sprawdza względem niego estymatę Welcha ({ $segments } segmentów po { $nfft }): całkowity stosunek mocy { $ratio }.

js-site-capabilities-wf-jammer-off = { $what } wyłączony

js-site-capabilities-wf-jammer-on = { $what } włączony

js-site-capabilities-wf-jammer-open = { $name } · { $mhz } MHz · od { $on } s do końca

js-site-capabilities-wf-jammer-span = { $name } · { $mhz } MHz · { $on }–{ $off } s

js-site-capabilities-wf-lost = Utrata synchronizacji

js-site-capabilities-wf-lost-low = utrata synchronizacji

js-site-capabilities-wf-max = { $peak } dB powyżej niego · skala logarytmiczna od { $v0 } dB

js-site-capabilities-wf-no-jammer = brak zagłuszacza

js-site-capabilities-wf-now = teraz

js-site-capabilities-wf-pause = Wstrzymaj wodospad

js-site-capabilities-wf-peak = szczyt { $v } dB

js-site-capabilities-wf-play = Odtwórz wodospad

js-site-capabilities-wf-replay-previous = początek odtwarzania · poprzedni przebieg poniżej

js-site-capabilities-wf-replay-start = początek odtwarzania

js-site-capabilities-wf-say = T+{ $t } s, { $band } { $v } dB-Hz, { $state }

js-site-capabilities-wf-signal = sygnał +{ $v } dB

js-site-capabilities-wf-summary = Zarejestrowany przebieg { $file }: { $bands } pasm, { $jammers } zagłuszaczy w ciągu { $seconds } s. Najgorsze pasmo, { $worst }, spada do { $min } dB-Hz przy { $at } s; próg śledzenia { $floor } dB-Hz.

js-site-capabilities-wf-tip-above = { $v } dB powyżej poziomu szumów

js-site-capabilities-wf-tip-in = w { $bands }

js-site-capabilities-wf-tracking = Śledzenie

js-site-capabilities-wf-tracking-low = śledzenie

js-site-caphero-aria = Układ Słoneczny z przebiegu silnika dla Układu Słonecznego w dniu { $date }: Słońce i { $bodies } ciał poruszających się po torach orbit silnika; { $valid } z orbit zwalidowano względem JPL Horizons.

js-site-caphero-clock = +{ $days } dni · { $date }

js-site-caphero-copy-command = Kopiuj polecenie

js-site-caphero-copy-title = Skopiuj polecenie, które to odtwarza

js-site-caphero-credits = Odległości skompresowane w skali logarytmicznej, kierunki prawdziwe; ciała powiększone, obrót z szybkością pokazową. Zdjęcia: { $credits }; pierścienie Saturna: { $ring } ({ $licence }).

js-site-caphero-credits-summary = Skala i źródła zdjęć

js-site-caphero-engine-build = Silnik v{ $version }, kompilacja

js-site-caphero-explore = Poznaj każde ciało

js-site-caphero-file-title = Plik scenariusza, który został uruchomiony

js-site-caphero-list-item = { $name }: { $label }, { $au } au od Słońca w epoce, okres orbitalny { $period }.

js-site-caphero-list-item-light = { $name }: { $label }, { $au } au od Słońca w epoce, okres orbitalny { $period }, czas przejścia światła od { $observer } { $light }.

js-site-caphero-no-seed = deterministyczny, bez ziarna

js-site-caphero-open-in-studio = Otwórz w { $studio }

js-site-caphero-pause = Wstrzymaj orbity

js-site-caphero-period-days = { $value } dni

js-site-caphero-period-years = { $value } lat

js-site-caphero-play = Odtwórz orbity

js-site-caphero-rate = { $days } dni przebiegu na sekundę

js-site-caphero-rate-epoch = Klatka w epoce przebiegu

js-site-caphero-read-distance = { $au } au od Słońca

js-site-caphero-read-light = czas przejścia światła od { $observer } w epoce { $light }

js-site-caphero-read-orbit = orbita { $period }

js-site-caphero-seed = ziarno { $seed }

js-site-copy-aria = Kopiuj: { $cmd }

js-site-developers-captured-from = zarejestrowano { $recorded } z

js-site-developers-engine-build = Silnik v{ $version }, kompilacja

js-site-developers-exit-stamp = wyjście { $rc } · { $ms } ms

js-site-developers-file-open-in-studio = { $file }: otwórz w { $studio }

js-site-developers-no-seed = (deterministyczny, bez ziarna)

js-site-developers-open-in-studio = Otwórz w { $studio }

js-site-developers-pause = Wstrzymaj odtwarzanie

js-site-developers-play = Odtwórz

js-site-developers-replaying = # odtwarzanie zarejestrowanej sesji

js-site-developers-seed = (ziarno { $seed })

js-site-developers-what-runs-write = Co zapisuje każdy przebieg

js-site-editions-builds-on-it = { $label } rozwija go

js-site-editions-core-kinds =
    { $n ->
        [one] { $n } rodzaj
        [few] { $n } rodzaje
        [many] { $n } rodzajów
       *[other] { $n } rodzaju
    }

js-site-editions-core-title = Otwarty rdzeń

js-site-editions-core-validated = zwalidowane

js-site-editions-core-validated-of = { $validated } z { $total }

js-site-editions-free-core = Bezpłatne w otwartym rdzeniu, jak każdy rodzaj

js-site-editions-group-other = Inne

js-site-editions-kind-no-ledger = żaden moduł rejestru nie pasuje do niego z nazwy

js-site-editions-kind-validated = { $v } z { $tot } wierszy rejestru zwalidowano

js-site-editions-pause = Wstrzymaj pierścienie

js-site-editions-play = Odtwórz pierścienie

js-site-editions-ring-pro = Kshana Pro

js-site-editions-ring-study = Badanie na zamówienie

js-site-evidence-allan-aria = Cztery odchylenia zestawu danych NIST SP 1065 z 1000 punktów względem czasu uśredniania; odtworzono wszystkie { $n } opublikowanych wartości, najgorszy błąd względny { $err }

js-site-evidence-allan-lg-published = wartość opublikowana, SP 1065 Tabela 31

js-site-evidence-allan-mdev = zmodyfikowane odchylenie Allana

js-site-evidence-allan-na = n/d

js-site-evidence-allan-oadev = nakładające się odchylenie Allana

js-site-evidence-allan-ohdev = nakładające się odchylenie Hadamarda

js-site-evidence-allan-read = { $tau } s · Allan { $oadev } · zmodyfikowane { $mdev } · Hadamard { $ohdev }

js-site-evidence-allan-st-gate = bramka testu

js-site-evidence-allan-st-reproduced = opublikowane wartości odtworzone

js-site-evidence-allan-st-worst = najgorszy błąd względny

js-site-evidence-allan-tdev = odchylenie czasu, w sekundach

js-site-evidence-allan-tip-at = «{ $name }» przy { $m } s

js-site-evidence-allan-tip-engine = silnik: «{ $got }» · błąd względny { $err }

js-site-evidence-allan-tip-table = SP 1065 Tabela 31: «{ $want }»

js-site-evidence-cell-tip = Możliwość { $i } z { $n } · «{ $label }»

js-site-evidence-cowell-aria = Różnica pozycji względem Orekit w ciągu 24 godzin: poziomy sił od 1 do 5 pozostają poniżej { $worst }; poziom oporu atmosferycznego osiąga { $drag }, pasmo charakterystyki

js-site-evidence-cowell-gto = geostacjonarna orbita transferowa

js-site-evidence-cowell-leo = niska orbita okołoziemska

js-site-evidence-cowell-lg-con = poziomy od 1 do 5, dwa ciała aż do ciśnienia promieniowania słonecznego, po dwie orbity

js-site-evidence-cowell-lg-drag = poziom 6, opór atmosferyczny: tylko charakterystyka (różne modele gęstości)

js-site-evidence-cowell-read = { $h } h · poziomy od 1 do 5 najgorszy { $con } · opór { $drag }

js-site-evidence-cowell-st-drag = poziom oporu, najgorszy

js-site-evidence-cowell-st-epochs = epoki na poziomach od 1 do 5

js-site-evidence-cowell-tip-tier = «Poziom { $tier }: { $label }» · { $regime }

js-site-evidence-cowell-tip-worst = najgorsza różnica «{ $err }» przy { $h } h

js-site-evidence-hero-live = { $label }. { $cap }. { $oracle }

js-site-evidence-hero-no-oracle = Nie wskazano zewnętrznej wyroczni.

js-site-evidence-hero-oracle = Wyrocznia

js-site-evidence-hero-oracle-is = Wyrocznia: { $o }

js-site-evidence-hero-owner = Właściciel

js-site-evidence-hero-partner = Należy to do partnera; silnik nie rości sobie do tego żadnych praw.

js-site-evidence-hero-pause = Wstrzymaj przegląd

js-site-evidence-hero-play = Odtwórz przegląd

js-site-evidence-hero-row = Wiersz { $i } z { $n }

js-site-evidence-hold-accepted = przyjęte: w granicach współczynnika { $bar }

js-site-evidence-hold-aria = Zmierzony błąd czasu (wartość skuteczna) zegara cezowego względem czasu dryfu, z prognozą silnika; prognozowane do zmierzonych przekraczają granicę od { $lo } do { $hi }

js-site-evidence-hold-control = «Kontrola:» naiwna prognoza (stabilność jednosekundowa odczytana jako biały szum częstotliwości) daje stosunek { $ratio }, błędny o współczynnik około { $factor }, i nie spełnia tego samego progu. Próg ma zęby.

js-site-evidence-hold-lg-meas = zmierzone na zapieczętowanym zapisie (kropka: przekroczenie)

js-site-evidence-hold-lg-pred = prognozowane z pierwszej trzeciej części (pierścień: przekroczenie)

js-site-evidence-hold-nodata = Zmierzony zapis nie był dostępny podczas generowania tej strony.

js-site-evidence-hold-perfect = 1 = idealnie

js-site-evidence-hold-ratio-aria = Prognozowane do zmierzonych dla { $n } progów, wszystkie w granicach przyjętego współczynnika { $bar }

js-site-evidence-hold-read = dryf { $h } h · zmierzono { $m } ns · prognoza { $p } ns

js-site-evidence-hold-st-fit = użyte do dopasowania

js-site-evidence-hold-st-samples = próbki jednosekundowe

js-site-evidence-hold-st-syncs = zapieczętowane punkty synchronizacji

js-site-evidence-hold-tip-breach = prognozowane przekroczenie { $p } s · zmierzone { $m } s

js-site-evidence-hold-tip-error = «Błąd czasu { $thr } ns»

js-site-evidence-hold-tip-ratio = prognozowane do zmierzonych «{ $ratio }»

js-site-evidence-hold-tip-row = «{ $thr } ns» · prognozowane do zmierzonych «{ $ratio }»

js-site-evidence-kernel-chi2-cdf = rozkład chi-kwadrat

js-site-evidence-kernel-chi2-quantile = kwantyl chi-kwadrat

js-site-evidence-kernel-noncentral = niecentralny chi-kwadrat

js-site-evidence-kernel-normal-cdf = rozkład normalny

js-site-evidence-kernel-normal-quantile = kwantyl rozkładu normalnego

js-site-evidence-kernel-pbias = obciążenie detekcji

js-site-evidence-ladder-aria = Residua orbity od { $lo } do { $hi } m na jednej skali logarytmicznej, z progiem agencji { $bar } m

js-site-evidence-ladder-bar = próg agencji { $bar } m

js-site-evidence-ladder-cowell = Cowell względem Orekit 12.2, najgorszy

js-site-evidence-ladder-g24 = Galileo E11, dopasowanie 24-godzinne

js-site-evidence-ladder-g8 = Galileo E11, dopasowanie 8-godzinne

js-site-evidence-ladder-lg-headline = residuum nagłówkowe

js-site-evidence-ladder-lg-over = powyżej progu agencji { $bar } m

js-site-evidence-ladder-lg-ring = sam model sił, przed przyspieszeniami empirycznymi

js-site-evidence-ladder-lro = Lunar Reconnaissance Orbiter, dopasowanie 4-godzinne

js-site-evidence-ladder-read = przegląd przy { $v } · { $n } z { $total } residuów nagłówkowych na tym poziomie lub poniżej

js-site-evidence-ladder-rt-arc = łuk { $arc } · stopień i rząd { $do } · { $n } obserwacji

js-site-evidence-ladder-rt-rtn = radialnie { $r } m · wzdłuż toru { $a } m · poprzecznie do toru { $c } m

js-site-evidence-ladder-sgp4 = SGP4 względem wektorów AIAA, najgorszy

js-site-evidence-ladder-swarm = Swarm-A, dopasowanie 3-godzinne

js-site-evidence-ladder-tip-cowell = «Cowell · najgorszy z { $n } epok» · { $worst }

js-site-evidence-ladder-tip-g24 = «Galileo E11 · pełna doba» · { $rms } m

js-site-evidence-ladder-tip-g8a = «Galileo E11 · tylko model sił» · { $rms } m

js-site-evidence-ladder-tip-g8b = «Galileo E11 · z przyspieszeniami empirycznymi» · { $rms } m

js-site-evidence-ladder-tip-lrd = «Orbiter księżycowy · dynamiczny» · { $rms } m

js-site-evidence-ladder-tip-lrr = «Orbiter księżycowy · zredukowany dynamicznie» · { $rms } m, powyżej progu { $bar } m i podane tak, jak jest

js-site-evidence-ladder-tip-sgp4 = «SGP4 · najgorszy z { $n } wektorów» · { $worst }

js-site-evidence-ladder-tip-swd = «Swarm-A · dynamiczny» · { $rms } m, prawie w całości wzdłuż toru (opór)

js-site-evidence-ladder-tip-swr = «Swarm-A · zredukowany dynamicznie» · { $rms } m

js-site-evidence-raim-aria = { $pass } z { $n } przypadków SciPy w paśmie swojej tolerancji, w { $kernels } jądrach

js-site-evidence-raim-lane = { $kernel } · { $n }

js-site-evidence-raim-lg-most = największa część pasma wykorzystana przez jakikolwiek przypadek

js-site-evidence-raim-read = przypadek { $q } z { $n } · { $kernel } · { $what }

js-site-evidence-raim-read-band = { $pct } % pasma

js-site-evidence-raim-scale-aria = Skala kolorów: udział wykorzystanego pasma tolerancji, logarytmiczna od 10 do potęgi minus 11 do krawędzi pasma

js-site-evidence-raim-st-inside = w paśmie

js-site-evidence-raim-st-most = wykorzystana największa część pasma

js-site-evidence-raim-tick-edge = krawędź pasma

js-site-evidence-raim-tick-exact = dokładnie

js-site-evidence-raim-tip-case = «{ $kernel }» · przypadek { $j } z { $n }

js-site-evidence-raim-tip-exact = «dokładna zgodność» z SciPy

js-site-evidence-raim-tip-uses = wykorzystuje «{ $pct } %» swojego pasma tolerancji

js-site-evidence-sgp4-aria = Odtworzono { $n } z { $n } wektorów AIAA; najgorszy { $worst }, mediana { $median }, wszystkie w granicach tolerancji { $tol }

js-site-evidence-sgp4-deep = kosmos daleki (SDP4)

js-site-evidence-sgp4-lg-deep = wektor kosmosu dalekiego (SDP4)

js-site-evidence-sgp4-lg-median = mediana i najgorszy na skali

js-site-evidence-sgp4-lg-near = wektor bliskiej Ziemi (SGP4)

js-site-evidence-sgp4-near = bliska Ziemia (SGP4)

js-site-evidence-sgp4-read = wektor { $i } z { $n } · satelita { $sat } · błąd { $err }

js-site-evidence-sgp4-read-deep = wektor { $i } z { $n } · satelita { $sat }, kosmos daleki · błąd { $err }

js-site-evidence-sgp4-scale-aria = Skala kolorów od 0,1 mikrometra do tolerancji, logarytmiczna

js-site-evidence-sgp4-st-deep = wektory kosmosu dalekiego

js-site-evidence-sgp4-st-sats = satelity testowe

js-site-evidence-sgp4-tip-sat = «Satelita { $sat }» · { $kind }

js-site-evidence-sgp4-tip-vector = wektor { $j } z { $n } · błąd pozycji «{ $err }»

js-site-evidence-st-median = mediana

js-site-evidence-st-worst = najgorszy

js-site-evidence-tolerance = tolerancja { $v }

js-site-filter-in-all = { $total } we wszystkich

js-site-filter-matches =
    { $n ->
        [one] { $n } dopasowanie
        [few] { $n } dopasowania
        [many] { $n } dopasowań
       *[other] { $n } dopasowania
    }

js-site-filter-n-of-m = { $n } z { $total }

js-site-filter-n-of-m-rows = { $n } z { $total } wierszy

js-site-filter-rows = { $total } wierszy

js-site-home-banner-gnss-lost = Utrata GNSS · holdover

js-site-home-banner-holdover-out = Holdover · zegar poza zabezpieczeniem

js-site-home-banner-integrity-holdover = Alarm integralności · holdover trwa

js-site-home-banner-integrity-none = Alarm integralności · brak poziomu ochrony

js-site-home-banner-integrity-pl = Alarm integralności · PL > AL

js-site-home-banner-jamming = Zagłuszanie · C/N0 blisko progu

js-site-home-banner-spoofing = Alarm spoofingu · detektor RF

js-site-home-cap-holdover = Zagłuszacz osiąga { $dbw } dBW: śledzonych satelitów { $trk }. Zegar biegnie swobodnie od { $carry } ns pozostawionych przez spoofer i przekracza swoje zabezpieczenie { $guard } ns przy { $at }; INS dryfuje.

js-site-home-cap-integrity = Satelity wracają, ale tylko powyżej maski { $mask }°: śledzonych { $trk }. Poziom ochrony przekracza limit alarmowy { $al } m lub nie da się go wyznaczyć, więc monitor alarmuje, a zegar pozostaje w holdover.

js-site-home-cap-jamming = Szerokopasmowy zagłuszacz w odległości { $km } km przy { $dbw } dBW. C/N0 spada do { $cn } dB-Hz, { $above } dB powyżej progu śledzenia { $floor } dB-Hz; wszystkie { $trk } satelity nadal są śledzone.

js-site-home-cap-nominal = Śledzonych satelitów: { $trk }, przy średnim C/N0 { $cn } dB-Hz. Zegar jest zdyscyplinowany do czasu GNSS, a poziom ochrony ({ $pl } m) mieści się poniżej limitu alarmowego { $al } m.

js-site-home-cap-recovery = GNSS zsynchronizowany ponownie: śledzonych satelitów { $trk }, błąd czasu wrócił do { $te } ns, poziom ochrony { $pl } m.

js-site-home-cap-spoofing = Spoofer przesuwa zegar odbiornika z szybkością { $rate } ns/s. Detektor RF (częstotliwości radiowych) alarmuje od razu; monitor wspomagany zegarem uruchamia się po { $det } s, kończąc fazę z { $off } ns ściągniętymi z powrotem.

js-site-home-cn-no-lock = 0 z { $max } śledzonych · brak synchronizacji

js-site-home-cn-tracking = { $n } z { $max } śledzonych

js-site-home-no-pl = brak PL

js-site-home-pause = Wstrzymaj misję

js-site-home-pl-alarm = alarm · PL powyżej AL

js-site-home-pl-no-sats = brak satelitów, brak PL

js-site-home-pl-not-computed = nieobliczony w tej fazie

js-site-home-pl-too-few = zbyt mało satelitów

js-site-home-pl-under-al = poniżej AL { $thr } m

js-site-home-play = Odtwórz misję

js-site-home-receiver-tracking = Odbiornik · śledzonych { $n }

js-site-home-replay-restarted = Odtwarzanie uruchomione od nowa · { $file }

js-site-home-te-disciplined = zdyscyplinowany do GNSS

js-site-home-te-free-running = holdover · swobodny bieg

js-site-home-te-outside-guard = holdover · poza zabezpieczeniem

js-site-home-te-spoofer = spoofer ściąga zegar

js-site-home-thr-floor = próg

js-site-home-thr-guard = zabezpieczenie

js-site-kind-action = Działanie

js-site-mcp-arguments-excerpt = argumenty (fragment)

js-site-mcp-axis-mission-time = czas misji

js-site-mcp-clock-holdover = holdover zegara { $clock }

js-site-mcp-dir-reply = kshana-mcp → asystent

js-site-mcp-dir-request = asystent → kshana-mcp

js-site-mcp-figcaption = Narysowano ze zwróconej serii: błąd czasu każdego zegara względem progu

js-site-mcp-fom-availability = dostępność

js-site-mcp-fom-caption = Wskaźniki jakości zwrócone przez run_scenario, dla każdego zegara

js-site-mcp-fom-header = Wskaźnik jakości

js-site-mcp-fom-holdover = holdover (s)

js-site-mcp-fom-p95 = błąd czasu, 95. percentyl (ns)

js-site-mcp-fom-rms = błąd czasu, wartość skuteczna (ns)

js-site-mcp-lede = Zarejestrowano { $recorded } · v{ $version } · standardowe wejście i wyjście · protokół { $protocol } · wyłącznie dokładne komunikaty

js-site-mcp-legend-gnss-lost = GNSS utracony przy { $s } s

js-site-mcp-legend-threshold = próg { $v } ns

js-site-mcp-pause = Wstrzymaj

js-site-mcp-play = Odtwórz

js-site-mcp-plot-aria = Błąd czasu { $quantum } i { $classical } zwrócony przez run_scenario, względem progu { $threshold } ns; GNSS (globalny system nawigacji satelitarnej) utracony przy { $lost } s

js-site-mcp-recorded-json = Zarejestrowany JSON: { $label }

js-site-mcp-scenario-hash = skrót scenariusza

js-site-mcp-server-identity = tożsamość serwera

js-site-mcp-show-json = Pokaż JSON

js-site-mcp-step-aria = Krok { $n } z { $total }: { $name }

js-site-mcp-step-result = wynik: wskaźniki jakości

js-site-mcp-step-status = Krok { $n } z { $total } · { $name }

js-site-mcp-summary-excerpt = wiersz podsumowania i wynik (fragment)

js-site-mcp-tab-result = wynik

js-site-mcp-threshold = próg

js-site-mcp-toml-lines =
    { $n ->
        [one] { $n } wiersz
        [few] { $n } wiersze
        [many] { $n } wierszy
       *[other] { $n } wiersza
    }

js-site-mcp-toml-more = … (jeszcze { $n } wierszy pliku { $file })

js-site-mcp-tool-count =
    { $n ->
        [one] { $n } narzędzie
        [few] { $n } narzędzia
        [many] { $n } narzędzi
       *[other] { $n } narzędzia
    }

js-site-mcp-tools-with-descriptions =
    { $n ->
        [one] { $n } narzędzie z opisami
        [few] { $n } narzędzia z opisami
        [many] { $n } narzędzi z opisami
       *[other] { $n } narzędzia z opisami
    }

js-site-menu-close = Zamknij menu

js-site-menu-open = Otwórz menu

js-site-missions-avail-title = Dostępność: udział przebiegu z PDOP ≤ { $limit }

js-site-missions-avail-uniform = { $v } % w każdej komórce

js-site-missions-chart-error-title = błąd pozycji (m, log)

js-site-missions-chart-four = cztery potrzebne do rozwiązania pozycji

js-site-missions-chart-four-short = cztery do rozwiązania

js-site-missions-chart-lg-earth = Ziemia widoczna

js-site-missions-chart-lg-error-earth = błąd, przekaźniki i odległość do Ziemi

js-site-missions-chart-lg-error-relays = błąd, tylko przekaźniki

js-site-missions-chart-lg-relays = przekaźniki w zasięgu widzenia

js-site-missions-chart-relays-title = przekaźniki w zasięgu widzenia · zacieniowanie: Ziemia nad horyzontem

js-site-missions-chip-at-pdop = przy PDOP ≤ { $limit }

js-site-missions-chip-engine = Silnik:

js-site-missions-chip-fix-earth = rozwiązanie, z Ziemią

js-site-missions-chip-median-pdop = mediana PDOP

js-site-missions-chip-relays = przekaźniki

js-site-missions-chip-rms = błąd RMS

js-site-missions-chip-satellites = satelity

js-site-missions-chip-tracking-held = { $label } śledzenie utrzymane

js-site-missions-clocks-aria = Błąd czasu po jednej dobie holdover, według klasy zegara, skala logarytmiczna

js-site-missions-clocks-frame = próg układu { $ns } ns

js-site-missions-clocks-note = błąd czasu po jednej dobie, sekundy (log)

js-site-missions-clocks-sigma = σy(1 s) { $sigma }

js-site-missions-clocks-title = { $clock }: { $ns } ns po jednej dobie, σy(1 s) { $sigma }

js-site-missions-cone-aria = Stożek błędu pozycji od utraty GNSS

js-site-missions-cone-axis-x = czas od utraty GNSS (s)

js-site-missions-cone-axis-y = błąd pozycji (m)

js-site-missions-cone-budget = budżet ±{ $m } m

js-site-missions-cone-clipped = obcięte przy ±{ $m } m

js-site-missions-cone-leaves = opuszcza przy { $s } s

js-site-missions-cone-readout = t { $t } s · { $errors }

js-site-missions-copy-command = Kopiuj polecenie

js-site-missions-copy-title = Skopiuj polecenie, które to odtwarza

js-site-missions-deterministic = deterministyczny

js-site-missions-engine-build = Silnik v{ $version }, kompilacja

js-site-missions-engine-build-commit = Silnik v{ $version }, kompilacja { $commit }

js-site-missions-fp-aria = Mapa zasięgu zagłuszania. Strzałki przechodzą między komórkami, Enter otwiera dany przebieg.

js-site-missions-fp-aria-svg = Zasięg zagłuszania wokół zagłuszacza

js-site-missions-fp-darker = ciemniej = wyższe średnie J/S · komórki { $step } km · { $n } przebiegów silnika

js-site-missions-fp-jammer = zagłuszacz

js-site-missions-fp-lg-held = śledzenie utrzymane

js-site-missions-fp-lg-lost = utracone każdy satelita

js-site-missions-fp-lg-some = utracone niektóre epoki

js-site-missions-fp-open = Otwórz ten przebieg w { $studio }

js-site-missions-fp-read = około { $km } km od zagłuszacza · średnie J/S { $js } dB · dostępność śledzenia { $av }

js-site-missions-fp-ship = statek ze scenariusza

js-site-missions-grades-aria = Swobodny dryf inercyjny przed { $a } m i { $b } m, według klasy IMU

js-site-missions-grades-axis = sekundy dryfu po utracie GNSS (log)

js-site-missions-grades-point = { $grade }: { $s } s do { $m } m ({ $why })

js-site-missions-grades-reaches = błąd osiąga { $m } m

js-site-missions-grades-speed = przy { $v } m/s

js-site-missions-grades-this = ten scenariusz

js-site-missions-hud-earth-link = Łącze z Ziemią

js-site-missions-hud-link-above = Łącze z Ziemią · nad horyzontem

js-site-missions-hud-link-occulted = Łącze z Ziemią · zasłonięte

js-site-missions-hud-orbiter = Orbiter

js-site-missions-hud-receiver = Odbiornik

js-site-missions-hud-relays = Przekaźniki

js-site-missions-hud-selected-lat = wybrana szerokość geograficzna

js-site-missions-info-in-view = W zasięgu widzenia

js-site-missions-info-in-view-value = średnio { $mean } · najmniej { $fewest }

js-site-missions-info-pdop-above = { $pdop }, powyżej { $limit }

js-site-missions-json-title = Wynik silnika, bez zmian

js-site-missions-json-unavailable = JSON niedostępny

js-site-missions-key-avail = Dostępność

js-site-missions-key-pdop-title = Średni PDOP (współczynnik DOP pozycji)

js-site-missions-key-vis = Satelity w zasięgu widzenia

js-site-missions-key-vis-short = W zasięgu widzenia

js-site-missions-leo-grid = siatki przy PDOP ≤ { $limit }

js-site-missions-leo-in-view = w zasięgu widzenia średnio

js-site-missions-leo-shells = satelitów w czterech powłokach

js-site-missions-map-aria = { $title } nad { $body }, według komórek 10 stopni. Strzałki przesuwają odbiornik; jego komórka jest odczytana poniżej.

js-site-missions-map-colour-by = Koloruj mapę według

js-site-missions-map-fewest-in-view = najmniej w zasięgu widzenia

js-site-missions-map-grey = szary: brak rozwiązania

js-site-missions-map-hatched = kreskowanie: powyżej limitu PDOP { $limit }

js-site-missions-map-in-view = w zasięgu widzenia

js-site-missions-map-live = { $cell }: { $rows }

js-site-missions-map-mean-in-view = średnio w zasięgu widzenia

js-site-missions-map-mean-pdop = średni PDOP

js-site-missions-map-pdop-limit = limit PDOP { $limit }

js-site-missions-matrix-caption = Pliki scenariuszy według sektora (wiersze) i trybu awarii (kolumny). Wybierz liczbę, aby otworzyć dany sektor.

js-site-missions-matrix-cell =
    { $n ->
        [one] { $sector }, { $mode }: { $n } plik scenariusza
        [few] { $sector }, { $mode }: { $n } pliki scenariusza
        [many] { $sector }, { $mode }: { $n } plików scenariusza
       *[other] { $sector }, { $mode }: { $n } pliku scenariusza
    }

js-site-missions-matrix-files =
    { $n ->
        [one] { $n } plik:
        [few] { $n } pliki:
        [many] { $n } plików:
       *[other] { $n } pliku:
    }

js-site-missions-matrix-sector = Sektor

js-site-missions-mode-int = Zakłócenia

js-site-missions-mode-itg = Integralność

js-site-missions-mode-nav = Dryf

js-site-missions-mode-orb = Geometria

js-site-missions-mode-spf = Spoofing

js-site-missions-mode-tim = Synchronizacja czasu

js-site-missions-n-of-total = { $n } z { $total }

js-site-missions-no-fix = brak rozwiązania

js-site-missions-no-seed = deterministyczny, bez ziarna

js-site-missions-open-in-studio = Otwórz w { $studio }

js-site-missions-open-report = Otwórz raport silnika

js-site-missions-ow-chart-aria = Odpowiedź odbiornika w trakcie przebiegu dla { $name }: przekaźniki w zasięgu widzenia oraz błąd pozycji tylko z przekaźnikami i z odległością do Ziemi

js-site-missions-ow-chip-epochs = epoki

js-site-missions-ow-chip-mask = maska

js-site-missions-ow-chip-orbiter = orbiter

js-site-missions-ow-chip-range = odległość σ

js-site-missions-ow-chip-relays = przekaźniki

js-site-missions-ow-chip-relays-value = { $planes } × { $per } na { $alt } km, { $inc }°

js-site-missions-ow-chip-span = zakres czasu

js-site-missions-ow-count-relays = { $n } przekaźników i orbiter · { $body }

js-site-missions-ow-count-sats = { $n } satelitów · { $body }

js-site-missions-ow-engine = silnik v{ $version } · kompilacja { $commit }

js-site-missions-ow-lat-label = Szerokość geograficzna odbiornika

js-site-missions-ow-map-aria = Odpowiedź odbiornika dla { $name }: mapa ciała { $body } według komórek 10 stopni, a obok średnia i najmniejsza liczba satelitów w zasięgu widzenia oraz średni PDOP według szerokości geograficznej

js-site-missions-ow-note-imagery = Zdjęcia ciała { $body }: NASA.

js-site-missions-ow-note-rebuilt = Orbity: przekaźniki i orbiter odtworzone ze scenariusza dokładnie tak, jak buduje je silnik; liczba satelitów w zasięgu widzenia, którą dają, jest równa liczbie silnika we wszystkich { $n } epokach.

js-site-missions-ow-note-sats = Orbity: satelity przebiegu spropagowane tu ponownie i sprawdzone względem wszystkich { $n } próbek śladu podsatelitarnego zapisanych przez silnik (najgorszy { $deg }°).

js-site-missions-ow-note-scaled = Promienie orbit są przeskalowane na potrzeby wyświetlania; płaszczyzny, fazowanie i okresy są takie jak w przebiegu.

js-site-missions-ow-note-tracks = Silnik zapisał ślady podsatelitarne dla { $shown } z { $total } satelitów; wszystkie { $total } są narysowane z jego powłok.

js-site-missions-ow-note-walker = Orbity: powłoki Walkera przebiegu spropagowane tu ponownie i sprawdzone względem wszystkich { $n } próbek śladu podsatelitarnego zapisanych przez silnik (najgorszy { $deg }°).

js-site-missions-ow-off = wył.

js-site-missions-ow-on = wł.

js-site-missions-ow-pause = Wstrzymaj orbity

js-site-missions-ow-play = Odtwórz orbity

js-site-missions-ow-time = t = { $time }

js-site-missions-ow-time-label = Czas misji

js-site-missions-ow-valuetext = { $time }, przekaźników w zasięgu widzenia: { $n }

js-site-missions-pdop-title = Średni PDOP (współczynnik DOP pozycji), skala logarytmiczna, niższy jest lepszy

js-site-missions-report = Raport

js-site-missions-report-title = Własny raport silnika z tego przebiegu

js-site-missions-ro-above-horizon = nad horyzontem

js-site-missions-ro-availability = Dostępność, PDOP ≤ { $limit }

js-site-missions-ro-earth-light = Ziemia · czas przejścia światła { $s } s

js-site-missions-ro-error-relays = Błąd pozycji, tylko przekaźniki

js-site-missions-ro-occulted = zasłonięte

js-site-missions-ro-place-availability = W miejscu { $place }: dostępność

js-site-missions-ro-place-in-view = W miejscu { $place }: w zasięgu widzenia, średnio · najmniej

js-site-missions-ro-relays = Przekaźniki w zasięgu widzenia

js-site-missions-ro-satellites = Satelity

js-site-missions-ro-with-earth = Z odległością do Ziemi

js-site-missions-run-failed = Nie udało się tu załadować zarejestrowanego przebiegu; otwórz go w { $studio } z poniższego linku.

js-site-missions-seed = ziarno { $seed }

js-site-missions-spoof-aria = Przesunięcie spoofingu w czasie, z granicą detekcji każdego monitora i czasem detekcji

js-site-missions-spoof-axis-x = czas od początku spoofingu (s)

js-site-missions-spoof-axis-y = przesunięcie czasu (ns)

js-site-missions-spoof-detects = { $id } wykrywa przy { $s } s

js-site-missions-spoof-lg-bound = granica { $id }

js-site-missions-spoof-lg-offset = przesunięcie spoofingu

js-site-missions-spoof-readout = t { $t } s · przesunięcie { $offset } ns

js-site-missions-spoof-spec = specyfikacja { $v } ns

js-site-missions-sr-aria = { $members }; wspólny zagłuszacz { $power } dBW

js-site-missions-sr-aria-member = { $label }: śledzenie utrzymane { $held } %, średni stosunek zagłuszacza do sygnału { $js } dB, najmniej śledzonych satelitów { $min }

js-site-missions-sr-car = Samochód

js-site-missions-sr-fewest = najmniej śledzonych

js-site-missions-sr-held = śledzenie utrzymane

js-site-missions-sr-mean-js = średnie J/S

js-site-missions-sr-ship = Statek

js-site-missions-swipe =
    { $n ->
        [one] Przesuń, aby zobaczyć { $n } plik scenariusza
        [few] Przesuń, aby zobaczyć { $n } pliki scenariusza
        [many] Przesuń, aby zobaczyć { $n } plików scenariusza
       *[other] Przesuń, aby zobaczyć { $n } pliku scenariusza
    }

js-site-missions-toml-download-title = Pobierz plik scenariusza, który został uruchomiony

js-site-missions-toml-title = Plik scenariusza, który został uruchomiony

js-site-missions-vis-title = Satelity w zasięgu widzenia, średnia z przebiegu

js-site-missions-vis-uniform = { $v } w każdej komórce

js-site-palette-none = Brak wyników

js-site-palette-results = Wyniki: { $count }

js-site-pro-band-at = Po { $minutes } minutach: od 5. do 95. percentyla

js-site-pro-band-range = { $lo } do { $hi } { $unit }

js-site-pro-band-runs-within = z { $n } przebiegów w granicach ±{ $limit } { $unit }

js-site-pro-design-readout = satelitów { $sat }, dostępność { $av } % · { $planes } płaszczyzn na { $alt } km, { $incl }°

js-site-pro-front-design = Projekt z frontu { $id }

js-site-pro-front-design-knee = Projekt z frontu { $id } · punkt kolana

js-site-pro-more-designs =
    { $n ->
        [one] (+{ $n } kolejny projekt z frontu w tym punkcie)
        [few] (+{ $n } kolejne projekty z frontu w tym punkcie)
        [many] (+{ $n } kolejnych projektów z frontu w tym punkcie)
       *[other] (+{ $n } kolejnego projektu z frontu w tym punkcie)
    }

js-site-pro-not-rerun = nie uruchomiono ponownie

js-site-pro-rerun-free = ponowne uruchomienie w bezpłatnym silniku:

js-site-pro-same-sha = ten sam SHA-256 { $sha }…

js-site-pro-same-sha-index = ten sam SHA-256 wyniku co w indeksie

js-site-toast-copied = Skopiowano: { $text }

js-site-toast-data-failed = Nie udało się załadować pliku danych

js-site-toast-data-saved = Dane zapisano jako CSV

js-site-toast-no-data = Brak danych dla tego wykresu

js-site-toast-svg-saved = Wykres zapisano jako SVG

js-site-toast-table-saved = Tabelę zapisano jako CSV

js-site-waterfall-axis-now = teraz

js-site-waterfall-bar-title = { $band }: { $cn0 } dB-Hz, { $state }

js-site-waterfall-bar-title-js = { $band }: { $cn0 } dB-Hz, { $state }, J/S { $js } dB

js-site-waterfall-below-floor = sygnały leżą poniżej poziomu szumów

js-site-waterfall-campaign-drives = Kampania, którą napędza:

js-site-waterfall-campaign-seed = ziarno { $seed } · { $phases } faz w ciągu { $duration } s

js-site-waterfall-chip-aria = { $band }, { $fc } megaherców: pokaż to pasmo

js-site-waterfall-chip-title = { $band } · { $fc } MHz · pasmo odbiornika { $bw } MHz

js-site-waterfall-engine-build = Silnik v{ $version } · kompilacja

js-site-waterfall-fallback-head = Rezerwa Galileo · { $s } s, tylko ton CW

js-site-waterfall-fallback-text = { $band } wraca przy { $v } dB-Hz. Monitorowanie integralności tylko na Galileo: poziom ochrony { $min }–{ $max } m, poniżej limitu alarmowego { $limit } m.

js-site-waterfall-floor = próg śledzenia { $thr } dB-Hz

js-site-waterfall-holdover-head = Holdover · { $s } s, chirp włączony

js-site-waterfall-holdover-text = { $band0 } { $v0 }, { $band1 } { $v1 } dB-Hz, poniżej progu. Zegar biegnie swobodnie: najgorszy { $worst } ns względem zabezpieczenia { $guard } ns.

js-site-waterfall-jammer-off = { $what } wyłączony

js-site-waterfall-jammer-on = { $what } włączony

js-site-waterfall-live = { $freq } megaherców, { $time }: { $detail }

js-site-waterfall-live-band = { $band } { $cn0 } dB-Hz, { $state }

js-site-waterfall-live-none = brak modelowanego pasma

js-site-waterfall-load-failed = Nie udało się załadować zarejestrowanego przebiegu. Raport silnika poniżej pokazuje ten sam przebieg.

js-site-waterfall-no-jammer-band = Brak zagłuszacza w tym paśmie

js-site-waterfall-no-jammer-in-band = brak zagłuszacza w paśmie

js-site-waterfall-no-seed = deterministyczny, bez ziarna

js-site-waterfall-onset-head = Początek · { $t0 }–{ $t1 } s

js-site-waterfall-onset-text = Wszystkie { $n } pasma są śledzone, dopóki przebieg widmowy po raz pierwszy nie traci { $band } przy { $s } s.

js-site-waterfall-pause = Wstrzymaj wodospad

js-site-waterfall-play = Odtwórz wodospad

js-site-waterfall-quiet-band = { $band } { $cn0 } dB-Hz · { $state }

js-site-waterfall-run-time = przebieg T+{ $s } s

js-site-waterfall-scale-caption = PSD powyżej progu { $floor } dBW/Hz · komórki { $bin } MHz × { $step } s

js-site-waterfall-seed = ziarno { $seed }

js-site-waterfall-short-lost = utrata

js-site-waterfall-short-ok = śledz.

js-site-waterfall-short-rec = odzysk.

js-site-waterfall-state-lost = Utrata synchronizacji

js-site-waterfall-state-lost-low = utrata synchronizacji

js-site-waterfall-state-ok = Śledzenie

js-site-waterfall-state-ok-low = śledzenie

js-site-waterfall-state-rec = Odzyskano

js-site-waterfall-state-rec-low = odzyskano

js-site-waterfall-summary-recovers = { $band } traci synchronizację przy { $lost } s i odzyskuje ją przy { $rec } s, najniżej { $min } dB-Hz.

js-site-waterfall-summary-rows = { $n } wierszy po { $step } s.

js-site-waterfall-summary-stays-lost = { $band } traci synchronizację przy { $lost } s i pozostaje utracone, najniżej { $min } dB-Hz.

js-site-waterfall-summary-tracks = { $band } jest śledzone przez cały czas, najniżej { $min } dB-Hz.

js-site-waterfall-tip-above-floor = powyżej poziomu szumów

js-site-waterfall-tip-at-floor = Na termicznym poziomie szumów

js-site-waterfall-tip-band = { $cn0 } dB-Hz · { $state }

js-site-waterfall-tip-head = { $lo }–{ $hi } MHz · { $time }

js-site-waterfall-tip-js = J/S { $js } dB

js-site-waterfall-tip-no-band = Pasmo odbiornika żadnego modelowanego pasma nie obejmuje tej kolumny

js-site-waterfall-wave-chirp = chirp

js-site-waterfall-wave-cw = ton CW

js-site-waterfall-wave-noise = szum

js-site-waterfall-who-cursor = Pasmo pod kursorem

js-site-waterfall-who-selected = Wybrane pasmo

js-site-waterfall-who-worst = Najgorsze pasmo
