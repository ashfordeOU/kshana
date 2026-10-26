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
