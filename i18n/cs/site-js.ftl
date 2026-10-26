# site-js.ftl (cs): translations

js-app-engine-failed = Engine se nepodařilo načíst ({ $reason }).

js-ledger-rows =
    { $n ->
        [one] { $n } řádek registru
        [few] { $n } řádky registru
        [many] { $n } řádku registru
       *[other] { $n } řádků registru
    }

js-site-action-copy-install = Kopírovat: cargo install kshana

js-site-action-launch = Spustit { $name }

js-site-action-licence = Obraťte se na nás ohledně komerční licence

js-site-action-pro-eval = Požádat o zkušební verzi Kshana Pro

js-site-action-study = Požádat o studii

js-site-action-theme = Přepnout mezi světlým a tmavým režimem

js-site-capabilities-bd-after = { $m } m po { $s } s

js-site-capabilities-bd-combined = kombinovaně

js-site-capabilities-bd-crossing = { $m } m při { $s } s

js-site-capabilities-bd-fig-crossing = «{ $m } m» po { $s } s, převládá { $dom }

js-site-capabilities-bd-fig-lead = Čas od ztráty GNSS na logaritmické ose, IMU třídy { $grade } při { $speed } m/s:

js-site-capabilities-bd-fig-tail = Čáry jsou zákony růstu chyby při krátkém setrvačném chodu v enginu a jejich odmocnina ze součtu čtverců; průsečíky pocházejí z úplného devítistavového (Schulerova) chybového modelu enginu, který omezuje složky biasu, takže při dlouhém setrvačném chodu nastane každý průsečík o něco později, než k němu čára dospěje. Sloupce: tytéž průsečíky pro čtyři třídy IMU.

js-site-capabilities-cd-canvas-aria = Konstelace kolem svého tělesa, skutečné snímky: tažením nebo šipkami otáčejte, plus a minus mění přiblížení

js-site-capabilities-cd-design-meta = satelitů: { $n } · { $body } · { $file }

js-site-capabilities-cd-foot-frozen = Každý satelit sleduje vlastní dráhu enginu; poloměr zmrazené dráhy vychází z elementů slupky.

js-site-capabilities-cd-foot-mean-motion = Každý satelit sleduje vlastní dráhu enginu v poloměru, který vyplývá z jeho středního pohybu.

js-site-capabilities-cd-foot-walker = Všech { $n } satelitů je rozmístěno podle Walkerových parametrů jednotlivých slupek (ověřeno proti { $shown } drahám enginu: nejhorší { $deg }°); stopy jsou { $shown } drah enginu.

js-site-capabilities-cd-hud-body = { $body } · satelitů: «{ $n }»

js-site-capabilities-cd-hud-mission = Mise «{ $time }»

js-site-capabilities-cd-legend-shell = slupka { $n } · { $inc }°

js-site-capabilities-cd-map-availability = Podíl běhu s PDOP ≤ { $limit } (0 až 100 %)

js-site-capabilities-cd-map-pdop = Střední PDOP na buňku { $step }° ({ $lo } až { $hi }; světlejší je lepší)

js-site-capabilities-cd-map-visible = Střední počet viditelných satelitů ({ $lo } až { $hi })

js-site-capabilities-cd-metric-availability = Dostupnost

js-site-capabilities-cd-metric-pdop = Střední PDOP

js-site-capabilities-cd-metric-visible = Viditelné

js-site-capabilities-cd-no-webgl = 3D pohled vyžaduje WebGL; mapa pokrytí a obrázky vycházejí ze stejného běhu.

js-site-capabilities-cd-pause = Pozastavit dráhy

js-site-capabilities-cd-play = Přehrát dráhy

js-site-capabilities-cd-shell = { $name }: Walker { $pattern } { $total }/{ $planes }/{ $phasing } · { $alt } km · { $inc }°

js-site-capabilities-cd-slots = { $name }: satelitů: { $n }, tabulka slotů operátora

js-site-capabilities-cd-span = z { $dur }, ve smyčce

js-site-capabilities-cd-stat-in-view = Střední viditelné

js-site-capabilities-cd-stat-mask = Maska · běh

js-site-capabilities-cd-stat-median = Medián PDOP

js-site-capabilities-cd-stat-pdop = PDOP ≤ { $limit }, celkem { $body }

js-site-capabilities-cd-stat-satellites = Satelity

js-site-capabilities-cd-stat-worst = Nejhorší místo

js-site-capabilities-cd-title-gnss = Čtyři GNSS dohromady

js-site-capabilities-cd-title-leo = Megakonstelace na nízké oběžné dráze Země

js-site-capabilities-cd-title-lunar = Měsíční soubor relé

js-site-capabilities-cd-work-ratio = { $pct } % po předfiltru podle zeměpisné šířky · řešení DOP: { $dop }

js-site-capabilities-cd-work-tests = testů dvojic satelit–bod: { $after } z { $brute }, které by provedlo vyčerpávající prohledání

js-site-capabilities-cd-work-title = Práce s viditelností

js-site-capabilities-cg-cn0-sub = C/N0 vůči mezi sledování

js-site-capabilities-cg-cn0-title = Hustota výkonu nosné k šumu

js-site-capabilities-cg-compose-availability = Dostupnost

js-site-capabilities-cg-compose-fewest = Nejméně sledovaných

js-site-capabilities-cg-compose-js = Střední J/S

js-site-capabilities-cg-compose-text = Jedna rušička, { $power } { $unit }, na jednom místě, navázaná na členské běhy druhu ‹{ $kind }› (počet: { $n }): loď v průlivu a auto na pobřežní silnici vidí stejnou příčinu a dostanou různé odpovědi.

js-site-capabilities-cg-log-campaign = kampaň { $file } · fází: { $phases } · členských běhů: { $runs }

js-site-capabilities-cg-log-phase = fáze { $name } začíná

js-site-capabilities-cg-log-phase-carries = fáze { $name } začíná · přenáší { $carried }

js-site-capabilities-cg-monte-axis = konečná chyba hodin, seedů: { $n } ({ $path })

js-site-capabilities-cg-monte-ci = Průměr, 95% interval

js-site-capabilities-cg-monte-mean = Průměr

js-site-capabilities-cg-monte-p05 = 5.

js-site-capabilities-cg-monte-p05-p95 = 5. až 95.

js-site-capabilities-cg-monte-p50 = medián

js-site-capabilities-cg-monte-p95 = 95.

js-site-capabilities-cg-monte-std = Směrodatná odchylka

js-site-capabilities-cg-monte-text = Týž scénář druhu ‹{ $kind }› spuštěný { $n }krát ze základního seedu { $seed }, pokaždé s jedním seedem: rozptyl konečné chyby volně běžících hodin s 95% intervalem spolehlivosti pro průměr.

js-site-capabilities-cg-not-in-phase = není v této fázi

js-site-capabilities-cg-now = Fáze { $n } z { $total }: { $name } · { $from } až { $to }

js-site-capabilities-cg-phase-title = { $name }: { $from } až { $to } · ukončeno { $by } · členské druhy { $kinds }

js-site-capabilities-cg-pl-sub = vůči mezi poplachu

js-site-capabilities-cg-pl-title = Ochranná úroveň

js-site-capabilities-cg-pos-sub = vůči svému rozpočtu · log

js-site-capabilities-cg-pos-title = Inerciální chyba polohy

js-site-capabilities-cg-range = { $lo } až { $hi }

js-site-capabilities-cg-sweep-all-lost = Vše ztraceno od

js-site-capabilities-cg-sweep-axis = vysílací výkon rušičky ({ $key })

js-site-capabilities-cg-sweep-first-loss = První ztráta

js-site-capabilities-cg-sweep-lg-availability = dostupnost

js-site-capabilities-cg-sweep-lg-js = střední J/S

js-site-capabilities-cg-sweep-never = nikdy

js-site-capabilities-cg-sweep-nodes = Uzly

js-site-capabilities-cg-sweep-none = žádné

js-site-capabilities-cg-sweep-span = rozsah J/S

js-site-capabilities-cg-sweep-text = Jeden scénář druhu ‹{ $kind }›, spuštěný jednou pro každý uzel, zatímco se vysílací výkon rušičky mění od { $from } do { $to } { $unit }. Dostupnost při rušení (plná čára) a střední J/S (čárkovaně) pocházejí z vlastních ukazatelů kvality každého členského běhu.

js-site-capabilities-cg-te-sub = vůči ochranné mezi

js-site-capabilities-cg-te-title = Časová chyba hodin

js-site-capabilities-copy = Kopírovat

js-site-capabilities-copy-aria = Zkopírovat příkaz, který běh reprodukuje: kshana { $file }

js-site-capabilities-cz-best = Nejlepší PDOP

js-site-capabilities-cz-failed = Zaznamenaný běh se zde nepodařilo načíst; otevřete jej místo toho ve Studiu.

js-site-capabilities-cz-fix = Vzorky s určenou polohou

js-site-capabilities-cz-fix-value = { $n } z { $total } ({ $pct }%)

js-site-capabilities-cz-median = Medián PDOP

js-site-capabilities-engine = Engine v{ $version }

js-site-capabilities-engine-build = Engine v{ $version }, sestavení

js-site-capabilities-engine-report = Zpráva enginu

js-site-capabilities-globe-aria = { $name } na skutečných snímcích ({ $credit }). Otáčejte tažením nebo šipkami; plus a minus mění přiblížení.

js-site-capabilities-ho-ends = běh končí v čase { $t }

js-site-capabilities-ho-past-guard = za ochrannou mezí

js-site-capabilities-no-seed = deterministický, bez seedu

js-site-capabilities-open-in-studio = Otevřít v aplikaci { $studio }

js-site-capabilities-open-report = Otevřít zprávu enginu

js-site-capabilities-orrery-aria = Sluneční soustava v epoše běhu: tažením nebo šipkami otáčejte, plus a minus mění přiblížení

js-site-capabilities-orrery-bodies = těles: { $n } · pozorovatel «{ $observer }»

js-site-capabilities-orrery-epoch = Epocha «{ $epoch }» · TDB (barycentrický dynamický čas), juliánské datum { $jd }

js-site-capabilities-pnt-chart-title = relé v dohledu (čára) · Země nad obzorem (stínováno) · k určení polohy jsou potřeba čtyři

js-site-capabilities-pnt-kicker = Určování polohy na tomto tělese · druh body-pnt

js-site-capabilities-pnt-lander = Lander na pozici { $lat }°, { $lon }° na povrchu naviguje pomocí relé a dvoucestné vzdálenosti od Země, kdykoli je Země nad obzorem (jednosměrná světelná doba { $min } min). Dostupnost: { $a } % jen s relé, { $b } % se spojením se Zemí.

js-site-capabilities-pnt-orbiter = Uživatel na oběžné dráze naviguje pomocí relé a dvoucestné vzdálenosti od Země, kdykoli je Země nad obzorem (jednosměrná světelná doba { $min } min). Dostupnost: { $a } % jen s relé, { $b } % se spojením se Zemí.

js-site-capabilities-pnt-relays = relé: { $n } ve výšce { $alt } km kolem { $body }

js-site-capabilities-report-data = Zpráva a data

js-site-capabilities-result-data = Data výsledku

js-site-capabilities-saved = Uloženo: { $name }

js-site-capabilities-scenario-file = Soubor scénáře

js-site-capabilities-seed = seed { $seed }

js-site-capabilities-six-clock-fig = «{ $id }» drží ochrannou mez po dobu { $dur }

js-site-capabilities-six-clock-guard = ochranná mez { $v } ns

js-site-capabilities-six-coast-budget = rozpočet { $m } m

js-site-capabilities-six-coast-denied = GNSS odepřeno

js-site-capabilities-six-coast-fig = «{ $id }» v rozpočtu po dobu { $s } s

js-site-capabilities-six-floor = mez sledování

js-site-capabilities-six-integ-fig = «{ $ok }» z { $n } epoch dostupných · meze poplachu { $h } m horizontálně, { $v } m vertikálně

js-site-capabilities-six-integ-limit = vertikální mez poplachu

js-site-capabilities-six-integ-pl = vertikální (plná čára) a horizontální (čárkovaná) ochranná úroveň

js-site-capabilities-six-jam-effective = efektivní, satelitů: { $n }

js-site-capabilities-six-jam-fig = Sledováno «{ $min }» z { $max } viditelných · dostupnost při rušení «{ $av }» (nominální { $nom }) · střední J/S «{ $js } dB»

js-site-capabilities-six-jam-nominal = nominální, bez rušičky (čárkovaně)

js-site-capabilities-six-orbit-fig = Výška «{ $lo }–{ $hi } km» · pozemní stopa po dobu { $dur }

js-site-capabilities-six-orbit-label = { $source } · vzorků: { $n }

js-site-capabilities-six-orbit-sgp4 = SGP4 z dvouřádkové sady elementů

js-site-capabilities-six-spoof-detects = { $id } detekuje

js-site-capabilities-six-spoof-fig = «{ $id }» detekuje v čase { $s } s (mez { $ns } ns)

js-site-capabilities-ss-angle = Úhel od Slunce

js-site-capabilities-ss-credit = Snímky: { $credits }. * Mapa nesahá k pólům; mezera dostane průměrnou polární barvu mapy. Saturnovy prstence: { $ring } ({ $licence }).

js-site-capabilities-ss-days = { $v } dní

js-site-capabilities-ss-frame-origin = Počátek soustavy

js-site-capabilities-ss-from-sun = Od Slunce

js-site-capabilities-ss-gloss = NAIF: kód tělesa podle Navigation and Ancillary Information Facility NASA. GM: gravitační parametr. J2: člen zploštění. Pól IAU: rotační pól podle Mezinárodní astronomické unie, jako rektascenze (RA) a deklinace (Dec).

js-site-capabilities-ss-j2-none = nezveřejněno

js-site-capabilities-ss-kind = { $class } · NAIF { $naif }

js-site-capabilities-ss-kind-of = { $class } tělesa { $parent } · NAIF { $naif }

js-site-capabilities-ss-light-time = Světelná doba od pozorovatele { $observer }

js-site-capabilities-ss-link = { $from } – { $to }, jednosměrná světelná doba { $one }, tam a zpět { $two }

js-site-capabilities-ss-links-lead =
    { $n ->
        [one] Spojení, které tento běh počítá:
        [few] Spojení, která tento běh počítá:
        [many] Spojení, která tento běh počítá:
       *[other] Spojení, která tento běh počítá:
    }

js-site-capabilities-ss-moons =
    { $n ->
        [one] Jeho měsíc, v měřítku, v epoše
        [few] Jeho měsíce, v měřítku, v epoše
        [many] Jeho měsíce, v měřítku, v epoše
       *[other] Jeho měsíce, v měřítku, v epoše
    }

js-site-capabilities-ss-nominal-error = nominální chyba { $km } km ve vzdálenosti

js-site-capabilities-ss-north = Pohled ze severu ekliptiky.

js-site-capabilities-ss-period = Oběžná doba

js-site-capabilities-ss-period-about = Oběžná doba kolem { $parent }

js-site-capabilities-ss-pole = Pól IAU (RA, Dec)

js-site-capabilities-ss-radius = Střední poloměr

js-site-capabilities-ss-retrograde = { $v } h, retrográdně

js-site-capabilities-ss-rotation = Hvězdná rotace

js-site-capabilities-ss-years = { $v } let

js-site-capabilities-st-bound = mez { $v } m

js-site-capabilities-st-fig-none = epoch: { $n }, u žádné není chyba nad mezí. Vodorovně: skutečná chyba polohy; svisle: ochranná úroveň; obě na logaritmických osách.

js-site-capabilities-st-fig-some = epoch: { $n }, z toho s chybou nad mezí: { $k }. Vodorovně: skutečná chyba polohy; svisle: ochranná úroveň; obě na logaritmických osách.

js-site-capabilities-st-limit = mez poplachu { $m } m

js-site-capabilities-st-misleading = zavádějící: chyba nad mezí

js-site-capabilities-st-normal = běžný provoz

js-site-capabilities-st-unavailable = nedostupné: mez nad mezí poplachu

js-site-capabilities-studio-embedded = { $studio }, vložené: běh orbit-multignss

js-site-capabilities-studio-load = Načíst { $studio } zde

js-site-capabilities-studio-outline = Znovu zobrazit osnovu

js-site-capabilities-wave-chirp = chirp

js-site-capabilities-wave-cw = tón CW

js-site-capabilities-wave-noise = šum

js-site-capabilities-wf-an-caption = řádek T+{ $t } s · dB nad úrovní šumu, logaritmická škála · maximum celé mřížky { $peak } dB

js-site-capabilities-wf-degraded = Zhoršeno

js-site-capabilities-wf-degraded-low = zhoršeno

js-site-capabilities-wf-failed = Zaznamenaný běh se zde nepodařilo načíst.

js-site-capabilities-wf-grid = mřížka

js-site-capabilities-wf-iq = V čase T+{ $t } s engine vykreslí model také jako { $n } vzorků IQ (ve fázi a kvadratuře) kolem { $mhz } MHz a proti nim ověří Welchův odhad ({ $segments } segmentů po { $nfft }): integrovaný poměr výkonů { $ratio }.

js-site-capabilities-wf-jammer-off = { $what } vypnuto

js-site-capabilities-wf-jammer-on = { $what } zapnuto

js-site-capabilities-wf-jammer-open = { $name } · { $mhz } MHz · od { $on } s do konce

js-site-capabilities-wf-jammer-span = { $name } · { $mhz } MHz · { $on }–{ $off } s

js-site-capabilities-wf-lost = Ztracený zámek

js-site-capabilities-wf-lost-low = ztracený zámek

js-site-capabilities-wf-max = { $peak } dB nad ní · logaritmická škála od { $v0 } dB

js-site-capabilities-wf-no-jammer = bez rušičky

js-site-capabilities-wf-now = nyní

js-site-capabilities-wf-pause = Pozastavit waterfall

js-site-capabilities-wf-peak = špička { $v } dB

js-site-capabilities-wf-play = Přehrát waterfall

js-site-capabilities-wf-replay-previous = začátek přehrávání · předchozí průchod níže

js-site-capabilities-wf-replay-start = začátek přehrávání

js-site-capabilities-wf-say = T+{ $t } s, { $band } { $v } dB-Hz, { $state }

js-site-capabilities-wf-signal = signál +{ $v } dB

js-site-capabilities-wf-summary = Zaznamenaný běh { $file }: pásma: { $bands }, rušičky: { $jammers }, doba { $seconds } s. Nejhorší pásmo, { $worst }, klesá na { $min } dB-Hz v čase { $at } s; mez sledování { $floor } dB-Hz.

js-site-capabilities-wf-tip-above = { $v } dB nad úrovní šumu

js-site-capabilities-wf-tip-in = v pásmu: { $bands }

js-site-capabilities-wf-tracking = Sledování

js-site-capabilities-wf-tracking-low = sledování

js-site-caphero-aria = Sluneční soustava z běhu sluneční soustavy v enginu k datu { $date }: Slunce a tělesa ({ $bodies }) pohybující se po drahách enginu; { $valid } z drah je validováno proti JPL Horizons.

js-site-caphero-clock = +{ $days } dní · { $date }

js-site-caphero-copy-command = Kopírovat příkaz

js-site-caphero-copy-title = Zkopírovat příkaz, který to reprodukuje

js-site-caphero-credits = Vzdálenosti jsou stlačeny logaritmickou škálou, směry jsou skutečné; tělesa jsou zvětšena, rotují zobrazovací rychlostí. Snímky: { $credits }; Saturnovy prstence: { $ring } ({ $licence }).

js-site-caphero-credits-summary = Měřítko a zdroje snímků

js-site-caphero-engine-build = Engine v{ $version }, sestavení

js-site-caphero-explore = Prozkoumat každé těleso

js-site-caphero-file-title = Soubor scénáře, který běžel

js-site-caphero-list-item = { $name }: { $label }, { $au } au od Slunce v epoše, oběžná doba { $period }.

js-site-caphero-list-item-light = { $name }: { $label }, { $au } au od Slunce v epoše, oběžná doba { $period }, světelná doba od pozorovatele { $observer } { $light }.

js-site-caphero-no-seed = deterministický, bez seedu

js-site-caphero-open-in-studio = Otevřít v aplikaci { $studio }

js-site-caphero-pause = Pozastavit dráhy

js-site-caphero-period-days = { $value } dní

js-site-caphero-period-years = { $value } let

js-site-caphero-play = Přehrát dráhy

js-site-caphero-rate = { $days } dní běhu za sekundu

js-site-caphero-rate-epoch = Snímek v epoše běhu

js-site-caphero-read-distance = { $au } au od Slunce

js-site-caphero-read-light = světelná doba od pozorovatele { $observer } v epoše { $light }

js-site-caphero-read-orbit = oběžná dráha { $period }

js-site-caphero-seed = seed { $seed }

js-site-copy-aria = Kopírovat: { $cmd }

js-site-developers-captured-from = zachyceno { $recorded } z

js-site-developers-engine-build = Engine v{ $version }, sestavení

js-site-developers-exit-stamp = exit { $rc } · { $ms } ms

js-site-developers-file-open-in-studio = { $file }: otevřít v aplikaci { $studio }

js-site-developers-no-seed = (deterministický, bez seedu)

js-site-developers-open-in-studio = Otevřít v aplikaci { $studio }

js-site-developers-pause = Pozastavit přehrávání

js-site-developers-play = Spustit přehrávání

js-site-developers-replaying = # přehrávání zaznamenané relace

js-site-developers-seed = (seed { $seed })

js-site-developers-what-runs-write = Co zapisuje každý běh

js-site-editions-builds-on-it = { $label } na něm staví

js-site-editions-core-kinds =
    { $n ->
        [one] { $n } druh
        [few] { $n } druhy
        [many] { $n } druhu
       *[other] { $n } druhů
    }

js-site-editions-core-title = Otevřené jádro

js-site-editions-core-validated = validováno

js-site-editions-core-validated-of = { $validated } z { $total }

js-site-editions-free-core = Zdarma v otevřeném jádru, jako každý druh

js-site-editions-group-other = Ostatní

js-site-editions-kind-no-ledger = žádný modul registru mu názvem neodpovídá

js-site-editions-kind-validated = validováno řádků registru: { $v } z { $tot }

js-site-editions-pause = Pozastavit prstence

js-site-editions-play = Přehrát prstence

js-site-editions-ring-pro = Kshana Pro

js-site-editions-ring-study = Studie na míru

js-site-evidence-allan-aria = Čtyři odchylky datové sady NIST SP 1065 o 1000 bodech v závislosti na průměrovací době; všech { $n } zveřejněných hodnot reprodukováno, nejhorší relativní chyba { $err }

js-site-evidence-allan-lg-published = zveřejněná hodnota, SP 1065, tabulka 31

js-site-evidence-allan-mdev = modifikovaná Allanova odchylka

js-site-evidence-allan-na = n/a

js-site-evidence-allan-oadev = překrývající se Allanova odchylka

js-site-evidence-allan-ohdev = překrývající se Hadamardova odchylka

js-site-evidence-allan-read = { $tau } s · Allan { $oadev } · modifikovaná { $mdev } · Hadamard { $ohdev }

js-site-evidence-allan-st-gate = hranice testu

js-site-evidence-allan-st-reproduced = reprodukované zveřejněné hodnoty

js-site-evidence-allan-st-worst = nejhorší relativní chyba

js-site-evidence-allan-tdev = časová odchylka, v sekundách

js-site-evidence-allan-tip-at = «{ $name }» při { $m } s

js-site-evidence-allan-tip-engine = engine: «{ $got }» · relativní chyba { $err }

js-site-evidence-allan-tip-table = SP 1065, tabulka 31: «{ $want }»

js-site-evidence-cell-tip = Schopnost { $i } z { $n } · «{ $label }»

js-site-evidence-cowell-aria = Rozdíl polohy proti Orekitu za 24 hodin: úrovně sil 1 až 5 zůstávají pod { $worst }; úroveň odporu dosahuje { $drag }, charakterizační pásmo

js-site-evidence-cowell-gto = geostacionární transferová dráha

js-site-evidence-cowell-leo = nízká oběžná dráha Země

js-site-evidence-cowell-lg-con = úrovně 1 až 5, problém dvou těles až po tlak slunečního záření, dvě dráhy každá

js-site-evidence-cowell-lg-drag = úroveň 6, odpor: jen charakterizace (různé modely hustoty)

js-site-evidence-cowell-read = { $h } h · úrovně 1 až 5 nejhorší { $con } · odpor { $drag }

js-site-evidence-cowell-st-drag = úroveň odporu, nejhorší

js-site-evidence-cowell-st-epochs = epochy v úrovních 1 až 5

js-site-evidence-cowell-tip-tier = «Úroveň { $tier }: { $label }» · { $regime }

js-site-evidence-cowell-tip-worst = nejhorší rozdíl «{ $err }» v { $h } h

js-site-evidence-hero-live = { $label }. { $cap }. { $oracle }

js-site-evidence-hero-no-oracle = Není uvedeno žádné vnější orákulum.

js-site-evidence-hero-oracle = Orákulum

js-site-evidence-hero-oracle-is = Orákulum: { $o }

js-site-evidence-hero-owner = Vlastník

js-site-evidence-hero-partner = Vlastní to partner; engine si z toho nenárokuje nic.

js-site-evidence-hero-pause = Pozastavit průchod

js-site-evidence-hero-play = Přehrát průchod

js-site-evidence-hero-row = Řádek { $i } z { $n }

js-site-evidence-hold-accepted = přijato: v rámci faktoru { $bar }

js-site-evidence-hold-aria = Naměřená střední kvadratická časová chyba cesiových hodin v závislosti na době setrvačného chodu spolu s predikcí enginu; poměr předpovězeného a naměřeného překročení od { $lo } do { $hi }

js-site-evidence-hold-control = «Kontrola:» naivní predikce (jednosekundová stabilita čtená jako bílý frekvenční šum) dává poměr { $ratio }, mine se zhruba o faktor { $factor } a nesplní stejný práh. Práh má zuby.

js-site-evidence-hold-lg-meas = naměřeno na zadrženém záznamu (tečka: překročení)

js-site-evidence-hold-lg-pred = předpovězeno z první třetiny (kroužek: překročení)

js-site-evidence-hold-nodata = Naměřený záznam nebyl při generování této stránky k dispozici.

js-site-evidence-hold-perfect = 1 = dokonalé

js-site-evidence-hold-ratio-aria = Poměr předpovězeného a naměřeného pro mezní hodnoty (počet: { $n }), všechny uvnitř přijatého faktoru { $bar }

js-site-evidence-hold-read = setrvačný chod { $h } h · naměřeno { $m } ns · předpovězeno { $p } ns

js-site-evidence-hold-st-fit = použito pro proložení

js-site-evidence-hold-st-samples = jednosekundové vzorky

js-site-evidence-hold-st-syncs = zadržené synchronizační body

js-site-evidence-hold-tip-breach = předpovězené překročení { $p } s · naměřené { $m } s

js-site-evidence-hold-tip-error = «Časová chyba { $thr } ns»

js-site-evidence-hold-tip-ratio = poměr předpovězeného a naměřeného «{ $ratio }»

js-site-evidence-hold-tip-row = «{ $thr } ns» · poměr předpovězeného a naměřeného «{ $ratio }»

js-site-evidence-kernel-chi2-cdf = rozdělení chí-kvadrát

js-site-evidence-kernel-chi2-quantile = kvantil chí-kvadrát

js-site-evidence-kernel-noncentral = necentrální chí-kvadrát

js-site-evidence-kernel-normal-cdf = normální rozdělení

js-site-evidence-kernel-normal-quantile = normální kvantil

js-site-evidence-kernel-pbias = detekční bias

js-site-evidence-ladder-aria = Reziduály dráhy od { $lo } do { $hi } m na jedné logaritmické škále, s prahem agentury { $bar } m

js-site-evidence-ladder-bar = práh agentury { $bar } m

js-site-evidence-ladder-cowell = Cowell proti Orekit 12.2, nejhorší

js-site-evidence-ladder-g24 = Galileo E11, 24hodinové proložení

js-site-evidence-ladder-g8 = Galileo E11, 8hodinové proložení

js-site-evidence-ladder-lg-headline = hlavní reziduál

js-site-evidence-ladder-lg-over = nad prahem agentury { $bar } m

js-site-evidence-ladder-lg-ring = samotný silový model, před empirickými zrychleními

js-site-evidence-ladder-lro = Lunar Reconnaissance Orbiter, 4hodinové proložení

js-site-evidence-ladder-read = průchod na { $v } · { $n } z { $total } hlavních reziduálů na této hodnotě nebo pod ní

js-site-evidence-ladder-rt-arc = oblouk { $arc } · stupeň a řád { $do } · pozorování: { $n }

js-site-evidence-ladder-rt-rtn = radiálně { $r } m · po dráze { $a } m · napříč dráhou { $c } m

js-site-evidence-ladder-sgp4 = SGP4 proti vektorům AIAA, nejhorší

js-site-evidence-ladder-swarm = Swarm-A, 3hodinové proložení

js-site-evidence-ladder-tip-cowell = «Cowell · nejhorší z epoch ({ $n })» · { $worst }

js-site-evidence-ladder-tip-g24 = «Galileo E11 · celý den» · { $rms } m

js-site-evidence-ladder-tip-g8a = «Galileo E11 · jen silový model» · { $rms } m

js-site-evidence-ladder-tip-g8b = «Galileo E11 · s empirickými zrychleními» · { $rms } m

js-site-evidence-ladder-tip-lrd = «Lunární orbiter · dynamický» · { $rms } m

js-site-evidence-ladder-tip-lrr = «Lunární orbiter · redukovaně dynamický» · { $rms } m, nad prahem { $bar } m a uvedeno tak, jak je

js-site-evidence-ladder-tip-sgp4 = «SGP4 · nejhorší z vektorů ({ $n })» · { $worst }

js-site-evidence-ladder-tip-swd = «Swarm-A · dynamický» · { $rms } m, téměř vše po dráze (odpor)

js-site-evidence-ladder-tip-swr = «Swarm-A · redukovaně dynamický» · { $rms } m

js-site-evidence-raim-aria = případů SciPy uvnitř tolerančního pásma: { $pass } z { $n }, přes jádra (počet: { $kernels })

js-site-evidence-raim-lane = { $kernel } · { $n }

js-site-evidence-raim-lg-most = nejvíce z pásma, jaké kterýkoli případ využívá

js-site-evidence-raim-read = případ { $q } z { $n } · { $kernel } · { $what }

js-site-evidence-raim-read-band = { $pct } % pásma

js-site-evidence-raim-scale-aria = Barevná škála: využitý podíl tolerančního pásma, logaritmická od 10 na mínus 11 po okraj pásma

js-site-evidence-raim-st-inside = uvnitř pásma

js-site-evidence-raim-st-most = většina pásma využita

js-site-evidence-raim-tick-edge = okraj pásma

js-site-evidence-raim-tick-exact = přesně

js-site-evidence-raim-tip-case = «{ $kernel }» · případ { $j } z { $n }

js-site-evidence-raim-tip-exact = «přesná shoda» se SciPy

js-site-evidence-raim-tip-uses = využívá «{ $pct } %» svého tolerančního pásma

js-site-evidence-sgp4-aria = vektorů AIAA reprodukováno: { $n } z { $n }; nejhorší { $worst }, medián { $median }, všechny uvnitř tolerance { $tol }

js-site-evidence-sgp4-deep = hluboký vesmír (SDP4)

js-site-evidence-sgp4-lg-deep = vektor v hlubokém vesmíru (SDP4)

js-site-evidence-sgp4-lg-median = medián a nejhorší na škále

js-site-evidence-sgp4-lg-near = vektor blízko Země (SGP4)

js-site-evidence-sgp4-near = blízko Země (SGP4)

js-site-evidence-sgp4-read = vektor { $i } z { $n } · satelit { $sat } · chyba { $err }

js-site-evidence-sgp4-read-deep = vektor { $i } z { $n } · satelit { $sat }, hluboký vesmír · chyba { $err }

js-site-evidence-sgp4-scale-aria = Barevná škála od 0.1 mikrometru po toleranci, logaritmická

js-site-evidence-sgp4-st-deep = vektory v hlubokém vesmíru

js-site-evidence-sgp4-st-sats = testovací satelity

js-site-evidence-sgp4-tip-sat = «Satelit { $sat }» · { $kind }

js-site-evidence-sgp4-tip-vector = vektor { $j } z { $n } · chyba polohy «{ $err }»

js-site-evidence-st-median = medián

js-site-evidence-st-worst = nejhorší

js-site-evidence-tolerance = tolerance { $v }

js-site-filter-in-all = celkem { $total }

js-site-filter-matches =
    { $n ->
        [one] { $n } shoda
        [few] { $n } shody
        [many] { $n } shody
       *[other] { $n } shod
    }

js-site-filter-n-of-m = { $n } z { $total }

js-site-filter-n-of-m-rows = { $n } z { $total } řádků

js-site-filter-rows = řádků: { $total }

js-site-home-banner-gnss-lost = GNSS ztraceno · holdover

js-site-home-banner-holdover-out = Holdover · hodiny mimo ochrannou mez

js-site-home-banner-integrity-holdover = Poplach integrity · holdover pokračuje

js-site-home-banner-integrity-none = Poplach integrity · žádná ochranná úroveň

js-site-home-banner-integrity-pl = Poplach integrity · PL > AL

js-site-home-banner-jamming = Rušení · C/N0 blízko meze sledování

js-site-home-banner-spoofing = Poplach spoofingu · detektor RF

js-site-home-cap-holdover = Rušička jde na { $dbw } dBW: sledovaných satelitů: { $trk }. Hodiny běží volně od { $carry } ns, které po sobě nechal spoofer, a překročí svou ochrannou mez { $guard } ns v čase { $at }; INS se pohybuje setrvačně.

js-site-home-cap-integrity = Satelity se vracejí, ale jen nad maskou { $mask }°: sledovaných { $trk }. Ochranná úroveň překračuje mez poplachu { $al } m nebo ji nelze vytvořit, takže monitor vyhlásí poplach a hodiny zůstávají v režimu holdover.

js-site-home-cap-jamming = Širokopásmová rušička { $km } km daleko při { $dbw } dBW. C/N0 klesá na { $cn } dB-Hz, tedy { $above } dB nad mezí sledování { $floor } dB-Hz; všech { $trk } satelitů se stále sleduje.

js-site-home-cap-nominal = Sledovaných satelitů: { $trk } při středním C/N0 { $cn } dB-Hz. Hodiny jsou disciplinovány na čas GNSS a ochranná úroveň ({ $pl } m) leží pod mezí poplachu { $al } m.

js-site-home-cap-recovery = GNSS znovu synchronizováno: sledovaných satelitů { $trk }, časová chyba zpět na { $te } ns, ochranná úroveň { $pl } m.

js-site-home-cap-spoofing = Spoofer posouvá hodiny přijímače rychlostí { $rate } ns/s. Detektor RF (rádiové frekvence) vyhlásí poplach okamžitě; monitor podpořený hodinami zareaguje po { $det } s a fáze končí se { $off } ns stáhnutými zpět.

js-site-home-cn-no-lock = 0 z { $max } sledováno · žádný zámek

js-site-home-cn-tracking = { $n } z { $max } sledováno

js-site-home-no-pl = žádná PL

js-site-home-pause = Pozastavit misi

js-site-home-pl-alarm = poplach · PL nad AL

js-site-home-pl-no-sats = žádné satelity, žádná PL

js-site-home-pl-not-computed = v této fázi nepočítáno

js-site-home-pl-too-few = příliš málo satelitů

js-site-home-pl-under-al = pod AL { $thr } m

js-site-home-play = Přehrát misi

js-site-home-receiver-tracking = Přijímač · sledováno: { $n }

js-site-home-replay-restarted = Přehrávání restartováno · { $file }

js-site-home-te-disciplined = disciplinováno na GNSS

js-site-home-te-free-running = holdover · volný běh

js-site-home-te-outside-guard = holdover · mimo ochrannou mez

js-site-home-te-spoofer = spoofer táhne hodiny

js-site-home-thr-floor = mez sledování

js-site-home-thr-guard = ochranná mez

js-site-kind-action = Akce

js-site-mcp-arguments-excerpt = argumenty (výňatek)

js-site-mcp-axis-mission-time = čas mise

js-site-mcp-clock-holdover = holdover: { $clock }

js-site-mcp-dir-reply = kshana-mcp → asistent

js-site-mcp-dir-request = asistent → kshana-mcp

js-site-mcp-figcaption = Vykresleno z vrácené řady: časová chyba každých hodin vůči mezní hodnotě

js-site-mcp-fom-availability = dostupnost

js-site-mcp-fom-caption = Ukazatele kvality vrácené run_scenario, po hodinách

js-site-mcp-fom-header = Ukazatel kvality

js-site-mcp-fom-holdover = holdover (s)

js-site-mcp-fom-p95 = časová chyba, 95. percentil (ns)

js-site-mcp-fom-rms = časová chyba, střední kvadratická (ns)

js-site-mcp-lede = Zaznamenáno { $recorded } · v{ $version } · standardní vstup a výstup · protokol { $protocol } · pouze přesné zprávy

js-site-mcp-legend-gnss-lost = GNSS ztraceno v { $s } s

js-site-mcp-legend-threshold = mezní hodnota { $v } ns

js-site-mcp-pause = Pozastavit

js-site-mcp-play = Přehrát

js-site-mcp-plot-aria = Časová chyba: { $quantum } a { $classical }, vrácená run_scenario, vůči mezní hodnotě { $threshold } ns; GNSS (globální družicový navigační systém) ztraceno v { $lost } s

js-site-mcp-recorded-json = Zaznamenaný JSON: { $label }

js-site-mcp-scenario-hash = hash scénáře

js-site-mcp-server-identity = identita serveru

js-site-mcp-show-json = Zobrazit JSON

js-site-mcp-step-aria = Krok { $n } z { $total }: { $name }

js-site-mcp-step-result = výsledek: ukazatele kvality

js-site-mcp-step-status = Krok { $n } z { $total } · { $name }

js-site-mcp-summary-excerpt = souhrnný řádek a výsledek (výňatek)

js-site-mcp-tab-result = výsledek

js-site-mcp-threshold = mezní hodnota

js-site-mcp-toml-lines =
    { $n ->
        [one] { $n } řádek
        [few] { $n } řádky
        [many] { $n } řádku
       *[other] { $n } řádků
    }

js-site-mcp-toml-more = … (dalších řádků souboru { $file }: { $n })

js-site-mcp-tool-count =
    { $n ->
        [one] { $n } nástroj
        [few] { $n } nástroje
        [many] { $n } nástroje
       *[other] { $n } nástrojů
    }

js-site-mcp-tools-with-descriptions =
    { $n ->
        [one] { $n } nástroj s popisy
        [few] { $n } nástroje s popisy
        [many] { $n } nástroje s popisy
       *[other] { $n } nástrojů s popisy
    }

js-site-menu-close = Zavřít nabídku

js-site-menu-open = Otevřít nabídku

js-site-missions-avail-title = Dostupnost: podíl běhu s PDOP ≤ { $limit }

js-site-missions-avail-uniform = { $v } % v každé buňce

js-site-missions-chart-error-title = chyba polohy (m, log)

js-site-missions-chart-four = k určení polohy jsou potřeba čtyři

js-site-missions-chart-four-short = čtyři pro určení polohy

js-site-missions-chart-lg-earth = Země viditelná

js-site-missions-chart-lg-error-earth = chyba, relé a vzdálenost od Země

js-site-missions-chart-lg-error-relays = chyba, jen relé

js-site-missions-chart-lg-relays = relé v dohledu

js-site-missions-chart-relays-title = relé v dohledu · stínováno: Země nad obzorem

js-site-missions-chip-at-pdop = při PDOP ≤ { $limit }

js-site-missions-chip-engine = Engine:

js-site-missions-chip-fix-earth = určení polohy, se Zemí

js-site-missions-chip-median-pdop = medián PDOP

js-site-missions-chip-relays = relé

js-site-missions-chip-rms = chyba RMS

js-site-missions-chip-satellites = satelity

js-site-missions-chip-tracking-held = { $label } sledování udrženo

js-site-missions-clocks-aria = Časová chyba po jednom dni holdoveru podle třídy hodin, logaritmická škála

js-site-missions-clocks-frame = spodní mez soustavy { $ns } ns

js-site-missions-clocks-note = časová chyba po jednom dni, sekundy (log)

js-site-missions-clocks-sigma = σy(1 s) { $sigma }

js-site-missions-clocks-title = { $clock }: { $ns } ns po jednom dni, σy(1 s) { $sigma }

js-site-missions-cone-aria = Kužel chyby polohy od ztráty GNSS

js-site-missions-cone-axis-x = čas od ztráty GNSS (s)

js-site-missions-cone-axis-y = chyba polohy (m)

js-site-missions-cone-budget = rozpočet ±{ $m } m

js-site-missions-cone-clipped = oříznuto na ±{ $m } m

js-site-missions-cone-leaves = opouští v { $s } s

js-site-missions-cone-readout = t { $t } s · { $errors }

js-site-missions-copy-command = Kopírovat příkaz

js-site-missions-copy-title = Zkopírovat příkaz, který to reprodukuje

js-site-missions-deterministic = deterministický

js-site-missions-engine-build = Engine v{ $version }, sestavení

js-site-missions-engine-build-commit = Engine v{ $version }, sestavení { $commit }

js-site-missions-fp-aria = Mapa stopy rušení. Šipky přecházejí mezi buňkami, Enter otevře příslušný běh.

js-site-missions-fp-aria-svg = Stopa rušení kolem rušičky

js-site-missions-fp-darker = tmavší = vyšší střední J/S · buňky { $step } km · běhů enginu: { $n }

js-site-missions-fp-jammer = rušička

js-site-missions-fp-lg-held = sledování udrženo

js-site-missions-fp-lg-lost = každý satelit ztracen

js-site-missions-fp-lg-some = některé epochy ztraceny

js-site-missions-fp-open = Otevřít tento běh v aplikaci { $studio }

js-site-missions-fp-read = asi { $km } km od rušičky · střední J/S { $js } dB · dostupnost sledování { $av }

js-site-missions-fp-ship = loď ze scénáře

js-site-missions-grades-aria = Volný setrvačný chod před { $a } m a { $b } m podle třídy IMU

js-site-missions-grades-axis = sekundy setrvačného chodu po ztrátě GNSS (log)

js-site-missions-grades-point = { $grade }: { $s } s do { $m } m ({ $why })

js-site-missions-grades-reaches = chyba dosáhne { $m } m

js-site-missions-grades-speed = při { $v } m/s

js-site-missions-grades-this = tento scénář

js-site-missions-hud-earth-link = Spojení se Zemí

js-site-missions-hud-link-above = Spojení se Zemí · nad obzorem

js-site-missions-hud-link-occulted = Spojení se Zemí · zakryto

js-site-missions-hud-orbiter = Orbiter

js-site-missions-hud-receiver = Přijímač

js-site-missions-hud-relays = Relé

js-site-missions-hud-selected-lat = vybraná šířka

js-site-missions-info-in-view = V dohledu

js-site-missions-info-in-view-value = { $mean } průměr · { $fewest } nejméně

js-site-missions-info-pdop-above = { $pdop }, nad { $limit }

js-site-missions-json-title = Výsledek enginu, beze změny

js-site-missions-json-unavailable = JSON není k dispozici

js-site-missions-key-avail = Dostupnost

js-site-missions-key-pdop-title = Střední PDOP (zhoršení přesnosti polohy)

js-site-missions-key-vis = Satelity v dohledu

js-site-missions-key-vis-short = V dohledu

js-site-missions-leo-grid = mřížky při PDOP ≤ { $limit }

js-site-missions-leo-in-view = v dohledu v průměru

js-site-missions-leo-shells = satelitů ve čtyřech slupkách

js-site-missions-map-aria = { $title } nad { $body }, po buňkách 10 stupňů. Šipky posouvají přijímač; jeho buňka je vypsána níže.

js-site-missions-map-colour-by = Obarvit mapu podle

js-site-missions-map-fewest-in-view = nejméně v dohledu

js-site-missions-map-grey = šedá: bez určení polohy

js-site-missions-map-hatched = šrafováno: nad limitem PDOP { $limit }

js-site-missions-map-in-view = v dohledu

js-site-missions-map-live = { $cell }: { $rows }

js-site-missions-map-mean-in-view = průměr v dohledu

js-site-missions-map-mean-pdop = střední PDOP

js-site-missions-map-pdop-limit = limit PDOP { $limit }

js-site-missions-matrix-caption = Soubory scénářů podle sektoru (řádky) a způsobu selhání (sloupce). Výběrem počtu otevřete daný sektor.

js-site-missions-matrix-cell =
    { $n ->
        [one] { $sector }, { $mode }: { $n } soubor scénáře
        [few] { $sector }, { $mode }: { $n } soubory scénářů
        [many] { $sector }, { $mode }: { $n } souboru scénářů
       *[other] { $sector }, { $mode }: { $n } souborů scénářů
    }

js-site-missions-matrix-files =
    { $n ->
        [one] { $n } soubor:
        [few] { $n } soubory:
        [many] { $n } souboru:
       *[other] { $n } souborů:
    }

js-site-missions-matrix-sector = Sektor

js-site-missions-mode-int = Interference

js-site-missions-mode-itg = Integrita

js-site-missions-mode-nav = Setrvačný chod

js-site-missions-mode-orb = Geometrie

js-site-missions-mode-spf = Spoofing

js-site-missions-mode-tim = Časování

js-site-missions-n-of-total = { $n } z { $total }

js-site-missions-no-fix = bez určení polohy

js-site-missions-no-seed = deterministický, bez seedu

js-site-missions-open-in-studio = Otevřít v aplikaci { $studio }

js-site-missions-open-report = Otevřít zprávu enginu

js-site-missions-ow-chart-aria = Odezva přijímače během běhu pro { $name }: relé v dohledu a chyba polohy jen s relé a se vzdáleností od Země

js-site-missions-ow-chip-epochs = epochy

js-site-missions-ow-chip-mask = maska

js-site-missions-ow-chip-orbiter = orbiter

js-site-missions-ow-chip-range = vzdálenost σ

js-site-missions-ow-chip-relays = relé

js-site-missions-ow-chip-relays-value = { $planes } × { $per } ve výšce { $alt } km, { $inc }°

js-site-missions-ow-chip-span = rozsah

js-site-missions-ow-count-relays = relé: { $n } a orbiter · { $body }

js-site-missions-ow-count-sats = satelitů: { $n } · { $body }

js-site-missions-ow-engine = engine v{ $version } · sestavení { $commit }

js-site-missions-ow-lat-label = Zeměpisná šířka přijímače

js-site-missions-ow-map-aria = Odezva přijímače pro { $name }: mapa tělesa { $body } po buňkách 10 stupňů, vedle ní střední a nejnižší počet satelitů v dohledu a střední PDOP podle zeměpisné šířky

js-site-missions-ow-note-imagery = Snímky tělesa { $body }: NASA.

js-site-missions-ow-note-rebuilt = Dráhy: relé a orbiter znovu sestavené ze scénáře přesně tak, jak je staví engine; počet satelitů v dohledu, který z nich vychází, se rovná počtu enginu ve všech { $n } epochách.

js-site-missions-ow-note-sats = Dráhy: satelity běhu zde znovu propagované a ověřené proti všem { $n } vzorkům pozemní stopy, které engine zapsal (nejhorší { $deg }°).

js-site-missions-ow-note-scaled = Poloměry drah jsou pro zobrazení přeškálovány; roviny, fázování a oběžné doby jsou ty z běhu.

js-site-missions-ow-note-tracks = Engine zapsal pozemní stopy pro { $shown } z { $total } satelitů; všech { $total } je vykresleno z jeho slupek.

js-site-missions-ow-note-walker = Dráhy: Walkerovy slupky běhu zde znovu propagované a ověřené proti všem { $n } vzorkům pozemní stopy, které engine zapsal (nejhorší { $deg }°).

js-site-missions-ow-off = vypnuto

js-site-missions-ow-on = zapnuto

js-site-missions-ow-pause = Pozastavit dráhy

js-site-missions-ow-play = Přehrát dráhy

js-site-missions-ow-time = t = { $time }

js-site-missions-ow-time-label = Čas mise

js-site-missions-ow-valuetext = { $time }, relé v dohledu: { $n }

js-site-missions-pdop-title = Střední PDOP (zhoršení přesnosti polohy), logaritmická škála, nižší je lepší

js-site-missions-report = Zpráva

js-site-missions-report-title = Vlastní zpráva enginu o tomto běhu

js-site-missions-ro-above-horizon = nad obzorem

js-site-missions-ro-availability = Dostupnost, PDOP ≤ { $limit }

js-site-missions-ro-earth-light = Země · světelná doba { $s } s

js-site-missions-ro-error-relays = Chyba polohy, jen relé

js-site-missions-ro-occulted = zakryto

js-site-missions-ro-place-availability = Na místě { $place }: dostupnost

js-site-missions-ro-place-in-view = Na místě { $place }: v dohledu, průměr · nejméně

js-site-missions-ro-relays = Relé v dohledu

js-site-missions-ro-satellites = Satelity

js-site-missions-ro-with-earth = Se vzdáleností od Země

js-site-missions-run-failed = Zaznamenaný běh se zde nepodařilo načíst; otevřete jej v aplikaci { $studio } přes odkaz níže.

js-site-missions-seed = seed { $seed }

js-site-missions-spoof-aria = Posun spoofingu v čase, s detekční mezí a časem detekce každého monitoru

js-site-missions-spoof-axis-x = čas od začátku spoofingu (s)

js-site-missions-spoof-axis-y = časový posun (ns)

js-site-missions-spoof-detects = { $id } detekuje v { $s } s

js-site-missions-spoof-lg-bound = mez { $id }

js-site-missions-spoof-lg-offset = posun spoofingu

js-site-missions-spoof-readout = t { $t } s · posun { $offset } ns

js-site-missions-spoof-spec = specifikace { $v } ns

js-site-missions-sr-aria = { $members }; sdílená rušička { $power } dBW

js-site-missions-sr-aria-member = { $label }: sledování udrženo { $held } %, střední poměr rušení k signálu { $js } dB, nejméně sledovaných satelitů { $min }

js-site-missions-sr-car = Auto

js-site-missions-sr-fewest = nejméně sledovaných

js-site-missions-sr-held = sledování udrženo

js-site-missions-sr-mean-js = střední J/S

js-site-missions-sr-ship = Loď

js-site-missions-swipe =
    { $n ->
        [one] Přejetím zobrazíte všechny: { $n } soubor scénáře
        [few] Přejetím zobrazíte všechny: { $n } soubory scénářů
        [many] Přejetím zobrazíte všechny: { $n } souboru scénářů
       *[other] Přejetím zobrazíte všechny: { $n } souborů scénářů
    }

js-site-missions-toml-download-title = Stáhnout soubor scénáře, který běžel

js-site-missions-toml-title = Soubor scénáře, který běžel

js-site-missions-vis-title = Satelity v dohledu, průměr za běh

js-site-missions-vis-uniform = { $v } v každé buňce

js-site-palette-none = Žádné výsledky

js-site-palette-results = výsledků: { $count }

js-site-pro-band-at = Po { $minutes } minutách: 5. až 95. percentil

js-site-pro-band-range = { $lo } až { $hi } { $unit }

js-site-pro-band-runs-within = z běhů ({ $n }) v rozmezí ±{ $limit } { $unit }

js-site-pro-design-readout = satelitů: { $sat }, dostupnost { $av } % · roviny: { $planes } ve výšce { $alt } km, { $incl }°

js-site-pro-front-design = Návrh na frontě { $id }

js-site-pro-front-design-knee = Návrh na frontě { $id } · koleno

js-site-pro-more-designs =
    { $n ->
        [one] (+{ $n } další návrh na frontě v tomto bodě)
        [few] (+{ $n } další návrhy na frontě v tomto bodě)
        [many] (+{ $n } dalšího návrhu na frontě v tomto bodě)
       *[other] (+{ $n } dalších návrhů na frontě v tomto bodě)
    }

js-site-pro-not-rerun = znovu nespuštěno

js-site-pro-rerun-free = znovu spuštěno ve volném enginu:

js-site-pro-same-sha = stejné SHA-256 { $sha }…

js-site-pro-same-sha-index = stejné SHA-256 výsledku jako v indexu

js-site-toast-copied = Zkopírováno: { $text }

js-site-toast-data-failed = Datový soubor se nepodařilo načíst

js-site-toast-data-saved = Data uložena jako CSV

js-site-toast-no-data = Pro tento graf nejsou data

js-site-toast-svg-saved = Graf uložen jako SVG

js-site-toast-table-saved = Tabulka uložena jako CSV

js-site-waterfall-axis-now = nyní

js-site-waterfall-bar-title = { $band }: { $cn0 } dB-Hz, { $state }

js-site-waterfall-bar-title-js = { $band }: { $cn0 } dB-Hz, { $state }, J/S { $js } dB

js-site-waterfall-below-floor = signály leží pod úrovní šumu

js-site-waterfall-campaign-drives = Kampaň, kterou řídí:

js-site-waterfall-campaign-seed = seed { $seed } · fází: { $phases } během { $duration } s

js-site-waterfall-chip-aria = { $band }, { $fc } megahertzů: zobrazit toto pásmo

js-site-waterfall-chip-title = { $band } · { $fc } MHz · šířka pásma přijímače { $bw } MHz

js-site-waterfall-engine-build = Engine v{ $version } · sestavení

js-site-waterfall-fallback-head = Záložní Galileo · { $s } s, jen tón CW

js-site-waterfall-fallback-text = { $band } zpět na { $v } dB-Hz. Monitorování integrity jen na Galileo: ochranná úroveň { $min }–{ $max } m, pod mezí poplachu { $limit } m.

js-site-waterfall-floor = mez sledování { $thr } dB-Hz

js-site-waterfall-holdover-head = Holdover · { $s } s, chirp zapnut

js-site-waterfall-holdover-text = { $band0 } { $v0 }, { $band1 } { $v1 } dB-Hz, pod mezí. Hodiny běží volně: nejhorší { $worst } ns proti ochranné mezi { $guard } ns.

js-site-waterfall-jammer-off = { $what } vypnuto

js-site-waterfall-jammer-on = { $what } zapnuto

js-site-waterfall-live = { $freq } megahertzů, { $time }: { $detail }

js-site-waterfall-live-band = { $band } { $cn0 } dB-Hz, { $state }

js-site-waterfall-live-none = žádné modelované pásmo

js-site-waterfall-load-failed = Zaznamenaný běh se nepodařilo načíst. Zpráva enginu níže ukazuje tentýž běh.

js-site-waterfall-no-jammer-band = V tomto pásmu žádná rušička

js-site-waterfall-no-jammer-in-band = v pásmu žádná rušička

js-site-waterfall-no-seed = deterministický, bez seedu

js-site-waterfall-onset-head = Nástup · { $t0 }–{ $t1 } s

js-site-waterfall-onset-text = Všech { $n } pásem se sleduje, dokud běh spektra poprvé neztratí { $band } v { $s } s.

js-site-waterfall-pause = Pozastavit waterfall

js-site-waterfall-play = Přehrát waterfall

js-site-waterfall-quiet-band = { $band } { $cn0 } dB-Hz · { $state }

js-site-waterfall-run-time = běh T+{ $s } s

js-site-waterfall-scale-caption = PSD nad úrovní šumu { $floor } dBW/Hz · buňky { $bin } MHz × { $step } s

js-site-waterfall-seed = seed { $seed }

js-site-waterfall-short-lost = ztraceno

js-site-waterfall-short-ok = sleduje

js-site-waterfall-short-rec = obnov.

js-site-waterfall-state-lost = Ztracený zámek

js-site-waterfall-state-lost-low = ztracený zámek

js-site-waterfall-state-ok = Sledování

js-site-waterfall-state-ok-low = sledování

js-site-waterfall-state-rec = Obnoveno

js-site-waterfall-state-rec-low = obnoveno

js-site-waterfall-summary-recovers = { $band } ztrácí zámek v { $lost } s a obnovuje se v { $rec } s, nejnižší { $min } dB-Hz.

js-site-waterfall-summary-rows = řádků po { $step } s: { $n }.

js-site-waterfall-summary-stays-lost = { $band } ztrácí zámek v { $lost } s a zůstává ztraceno, nejnižší { $min } dB-Hz.

js-site-waterfall-summary-tracks = { $band } se sleduje po celou dobu, nejnižší { $min } dB-Hz.

js-site-waterfall-tip-above-floor = nad úrovní šumu

js-site-waterfall-tip-at-floor = Na úrovni tepelného šumu

js-site-waterfall-tip-band = { $cn0 } dB-Hz · { $state }

js-site-waterfall-tip-head = { $lo }–{ $hi } MHz · { $time }

js-site-waterfall-tip-js = J/S { $js } dB

js-site-waterfall-tip-no-band = Šířka pásma přijímače žádného modelovaného pásma tento sloupec nepokrývá

js-site-waterfall-wave-chirp = chirp

js-site-waterfall-wave-cw = tón CW

js-site-waterfall-wave-noise = šum

js-site-waterfall-who-cursor = Pásmo pod kurzorem

js-site-waterfall-who-selected = Vybrané pásmo

js-site-waterfall-who-worst = Nejhorší pásmo
