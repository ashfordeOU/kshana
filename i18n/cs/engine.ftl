# SPDX-License-Identifier: AGPL-3.0-only
# cs catalogue of the engine messages (i18n/en/engine.ftl is the source).
# A message missing here is shown in English, per message. Translators: keep every $variable
# of the English message, keep the message ids, and do not translate error codes (E-...).

## src/clock_log.rs

engine-e-clock-log-unknown-clock-log-format-expected = neznámý formát záznamu hodin: { $other }; očekává se jeden z: { $format_names }

engine-e-clock-log-unknown-gap-policy-expected-refuse = neznámá politika mezer: { $other }; očekává se refuse, longest nebo linear

engine-e-clock-log-give-either-the-log-text = zadejte buď text záznamu, nebo jeho cestu, ne obojí

engine-e-clock-log-clock-log-needs-its-text = záznam hodin vyžaduje svůj text nebo cestu

engine-e-clock-log-tau0-must-be-finite-and = tau0_s musí být konečné a > 0 (zadáno: { $t })

engine-e-clock-log-units-and-data-apply-to = units a data platí pouze pro formát timelab

engine-e-clock-log-channel-applies-to-the-ticc = channel platí pouze pro formát ticc

engine-e-clock-log-cannot-read-clock-log = záznam hodin { $path } nelze přečíst: { $e }

engine-e-clock-log-clock-log-path-is-not = cesta k záznamu hodin není v sestavení WebAssembly k dispozici; zadejte záznam jako text

engine-e-clock-log-the-log-yields-usable-sample = záznam ve formátu { $format } poskytuje použitelné vzorky: { $x }; je potřeba alespoň 3

engine-e-clock-log-not-rinex-clock-file-no = není soubor hodin RINEX: chybí záznam END OF HEADER

engine-e-clock-log-the-rinex-clock-file-has = soubor hodin RINEX neobsahuje žádné záznamy AS ani AR

engine-e-clock-log-the-rinex-clock-file-holds = soubor hodin RINEX obsahuje hodiny: { $many }; vyberte jedny pomocí clock = "..." ({ $many2 })

engine-e-clock-log-no-as-or-ar-records = žádné záznamy AS ani AR pro hodiny { $id }

engine-e-clock-log-the-clock-has-single-epoch = hodiny mají jedinou epochu; tau0 nelze určit

engine-e-clock-log-the-log-has-no-readings = záznam ve formátu { $format } neobsahuje žádná měření

engine-e-clock-log-unknown-phase-unit-expected-ms = neznámá jednotka fáze: { $other }; očekává se s, ms, us, ns nebo ps

engine-e-clock-log-timelab-line-has-column-the = řádek TimeLab { $v1 }: počet sloupců { $v }, první datový řádek má { $first }

engine-e-clock-log-timelab-line-has-columns-one = řádek TimeLab { $v1 }: počet sloupců { $v }; čte se jeden (hodnota) nebo dva (čas a hodnota)

engine-e-clock-log-timelab-line-is-not-numeric = řádek TimeLab { $v1 } není číselný: { $l }

engine-e-clock-log-the-timelab-log-has-no = záznam timelab neobsahuje žádná měření

engine-e-clock-log-unknown-data-expected-phase-or = neznámá hodnota data: { $other }; očekává se phase nebo frequency

engine-e-clock-log-tau0-header-is-not-positive = hlavička tau0 { $v } není kladné číslo v sekundách

engine-e-clock-log-frequency-data-is-fractional-frequency = data frekvence jsou relativní frekvence; jejich jednotky mohou být pouze 1

engine-e-clock-log-two-column-frequency-logs-are = dvousloupcové záznamy frekvence se nečtou; zadejte frekvenci jako jeden sloupec spolu s tau0

engine-e-clock-log-unknown-time-units-expected-or = neznámé time_units: { $o }; očekává se s nebo mjd

engine-e-clock-log-the-timelab-log-time-column = sloupec času v záznamu timelab musí růst

engine-e-clock-log-single-reading-tau0-cannot-be = jediné měření; tau0 nelze určit

engine-e-clock-log-the-timelab-log-has-non = záznam timelab obsahuje nekonečná nebo nečíselná měření: { $non_finite }

engine-e-clock-log-the-ticc-log-holds-channels = záznam TICC obsahuje kanály: { $many }; vyberte jeden pomocí channel = "..."

engine-e-clock-log-no-readings-on-channel-found = žádná měření na kanálu { $channel } (nalezeno: { $labels })

engine-e-clock-log-ticc-interval-mode-lines-carry = řádky režimu intervalu TICC neobsahují čas; zadejte tau0_s (periodu události)

engine-e-clock-log-the-readings-do-not-increase = měření kanálu { $channel } nerostou, proto nejsou časovými značkami (výstup režimu Period přístroje TICC se nečte; použijte režim Timestamp)

engine-e-clock-log-single-time-stamp-tau0-cannot = jediná časová značka; tau0 nelze určit

engine-e-clock-log-two-time-stamps-apart-under = dvě časové značky kanálu { $channel } ve vzdálenosti { $w } s, méně než polovina tau0 = { $tau0 } s

engine-e-clock-log-the-time-stamps-of-go = časové značky ve formátu { $format } pro { $clock } jdou zpět (restartovaný démon nebo skok hodin); rozdělte záznam a čtěte každou část zvlášť

engine-e-clock-log-the-log-has-no-readings-2 = záznam neobsahuje žádná měření: { $what }

engine-e-clock-log-the-log-holds-sources-name = záznam obsahuje zdroje: { $many }; vyberte jeden pomocí { $selector } = "..." ({ $many2 })

engine-e-clock-log-no-readings-for-found = žádná měření ({ $what }) pro { $id } (nalezeno: { $names })

engine-e-clock-log-the-servo-of-never-reached = servo { $id } nikdy nedosáhlo uzamčeného stavu s2

engine-e-clock-log-the-log-has-no-chrony = záznam neobsahuje žádná měření sledování chrony

## src/acquisition.rs

engine-e-acquisition-sample-rate-hz-is-not = vzorkovací frekvence { $fs_hz } Hz není celým počtem vzorků na milisekundu

engine-e-acquisition-coherent-ms-and-noncoherent-must = coherent_ms a noncoherent musí být kladné

engine-e-acquisition-the-doppler-grid-needs-positive = mřížka Doppler vyžaduje kladný krok a nezáporné maximum

engine-e-acquisition-pfa-must-lie-in = pfa musí ležet v intervalu (0, 1)

engine-e-acquisition-samples-supplied-needed = zadané vzorky: { $samples }, potřeba: { $needed }

engine-e-acquisition-empty-doppler-grid = prázdná mřížka Doppler

engine-e-acquisition-the-samples-carry-no-power = vzorky nenesou žádný výkon

## src/adm.rs

engine-e-adm-unknown-attitude-type = neznámý ATTITUDE_TYPE { $s }

engine-e-adm-an-aem-needs-at-least = AEM vyžaduje alespoň jeden segment

engine-e-adm-segment-is-not-version-attitude = segment { $i }: { $t } není typem polohy ve verzi { $version }

engine-e-adm-segment-values-for = segment { $i }: počet hodnot pro { $t }: { $values }

engine-e-adm-aem-version-has-no-ndm = AEM verze 1.0 zde nemá tvar NDM/XML; zapište KVN

engine-e-adm-this-attitude-type-has-no = tento typ polohy nemá tvar ve verzi 2.0

engine-e-adm-expected-meta-start-found = očekáváno META_START, nalezeno { $l }

engine-e-adm-meta-start-without-meta-stop = META_START bez META_STOP

engine-e-adm-unexpected-metadata-line = neočekávaný řádek metadat { $other }

engine-e-adm-in-version-aem = { $att } v AEM verze { $version }

engine-e-adm-interpolation-degree = INTERPOLATION_DEGREE { $d }: { $e }

engine-e-adm-expected-data-start-after-meta = očekáváno DATA_START po META_STOP

engine-e-adm-data-start-without-data-stop = DATA_START bez DATA_STOP

engine-e-adm-empty-data-line = prázdný datový řádek

engine-e-adm-values-on-line = řádek { $att }: počet hodnot { $vals }: { $b }

engine-e-adm-unexpected-data-line = neočekávaný datový řádek { $other }

engine-e-adm-attitude-type-has-no-xml = typ polohy nemá tvar XML

engine-e-adm-message-without-version-attribute = zpráva bez atributu verze

engine-e-adm-expected-found = očekáváno { $vers_key }, nalezeno { $other }

engine-e-adm-header-without-creation-date-or = hlavička bez CREATION_DATE nebo ORIGINATOR

engine-e-adm-missing = chybí { $k }

engine-e-adm-unexpected-keyword = neočekávané klíčové slovo { $k }

engine-e-adm-spin-block-holds-nutation-or = blok spin obsahuje data nutace nebo momentu, ne obojí

engine-e-adm-unexpected-apm-keyword = neočekávané klíčové slovo APM { $other }

engine-e-adm-unexpected-apm-line = neočekávaný řádek APM { $b }

engine-e-adm-without = { $b } bez { $stop }

engine-e-adm-unexpected-line-in = neočekávaný řádek v { $b }: { $other }

engine-e-adm-incomplete-group = neúplná skupina { $keys }

engine-e-adm-unknown-apm-block-start = neznámý blok APM { $other }_START

engine-e-adm-apm-metadata-needs-object-name = metadata APM vyžadují OBJECT_NAME, OBJECT_ID a TIME_SYSTEM

engine-e-adm-apm-without-epoch = APM bez EPOCH

engine-e-adm-rotation-axis = osa rotace { $o }

engine-e-adm-values-for = počet hodnot pro { $t }: { $values }

engine-e-adm-euler-record-without-euler-rot = záznam Euler bez EULER_ROT_SEQ

engine-e-adm-rotation-sequence = posloupnost rotací { $seq }

engine-e-adm-epoch-has-no = epocha { $s } neobsahuje 'T'

engine-e-adm-epoch-date = datum epochy { $date }

engine-e-adm-epoch-time = čas epochy { $time }

## src/advanced_report.rs

engine-advanced-report-text-as-the-document-states = „{ $s }“ (text tak, jak jej uvádí dokument)

engine-advanced-report-mean-5th-to-95th-percentile = průměr { $fmt_num } (5. až 95. percentil: { $fmt_num2 } až { $fmt_num3 })

engine-advanced-report-field-units-schema-units-entry = schéma jednotek polí: položka units `{ $key }`

engine-advanced-report-field-units-schema-input-entry = schéma jednotek polí: položka input `{ $key }`, přiřazená podle názvu pole

engine-advanced-report-rows-from-to = řádky: { $nums }, od { $fmt_num } do { $fmt_num2 }

engine-advanced-report-phase-ended-by = fáze { $name } (ukončena: { $ended })

engine-advanced-report-result-timeline-phases = výsledek `timeline.phases[{ $i }]`

engine-advanced-report-hand-off-into-phase = předání do fáze { $phase }: { $h } → { $h2 } = { $h3 } { $h4 }

engine-advanced-report-result-timeline-handoffs = výsledek `timeline.handoffs[{ $i }]`

engine-advanced-report-scenario-input = vstup scénáře `{ $prefix }`

engine-advanced-report-scenario-file-comment-line = komentář v souboru scénáře, řádek { $start }

engine-advanced-report-scenario-file-comment-lines-to = komentář v souboru scénáře, řádky { $start } až { $v1 }

engine-advanced-report-is-modelled-not-validated = { $requirement }: MODELLED, ne ověřeno: { $it }.

engine-advanced-report-sweep-of-scale = Průchod parametru { $param } (měřítko: { $str_of })

engine-e-advanced-report-the-result-document-is-not = dokument s výsledkem není JSON: { $e }

engine-e-advanced-report-the-scenario-is-not-toml = scénář není TOML: { $e }

engine-advanced-report-monte-carlo-distribution-of = Rozdělení Monte Carlo: { $metric }

engine-advanced-report-recorded-at-build-time-from = zaznamenáno při sestavení z proměnné prostředí { $GIT_COMMIT_ENV }

engine-advanced-report-not-recorded-this-engine-was = nezaznamenáno: tento engine byl sestaven bez proměnné prostředí { $GIT_COMMIT_ENV }; vydání identifikuje verze enginu

engine-advanced-report-the-kind-own-fingerprint-of = { $esc } (vlastní otisk druhu scénáře; nejde o otisk souboru)

engine-advanced-report-input-file = Vstupní soubor { $path }

engine-advanced-report-study-generated = { " " }Studie vygenerována: { $esc }.

## src/altpnt/maps.rs

engine-e-altpnt-maps-emag2-line-expected-comma-separated = řádek EMAG2 { $v1 }: očekáváno 8 sloupců oddělených čárkou, nalezeno { $p }

engine-e-altpnt-maps-emag2-line-bad = řádek EMAG2 { $v1 }: chybná položka { $what } `{ $p }`

engine-e-altpnt-maps-emag2-line-non-finite-value = řádek EMAG2 { $v1 }: nekonečná nebo nečíselná hodnota

engine-e-altpnt-maps-emag2-no-data-rows = EMAG2: žádné datové řádky

engine-e-altpnt-maps-emag2-rows-do-not-fill = EMAG2: počet řádků { $rows } nevyplní mříž { $n_lat } x { $n_lon }, kterou pokrývají

engine-e-altpnt-maps-emag2-duplicate-node-at = EMAG2: duplicitní uzel na { $lat }, { $lon }

engine-e-altpnt-maps-grid-step-must-be-finite = krok mřížky musí být konečný a kladný, zadáno: { $step }

engine-e-altpnt-maps-grid-box-must-have-north = oblast mřížky musí mít north > south a east > west, zadáno: [{ $south }, { $north }] x [{ $west }, { $east }]

engine-e-altpnt-maps-grid-of-nodes-is-too = mřížka { $n_lat } x { $n_lon } uzlů je příliš velká

engine-e-altpnt-maps-emag2-the-axis-needs-at = EMAG2: osa { $what } vyžaduje alespoň 2 různé hodnoty

engine-e-altpnt-maps-emag2-the-axis-is-not = EMAG2: osa { $what } není pravidelná ({ $w } až { $w2 } oproti průměrnému kroku { $step })

engine-e-altpnt-maps-error-sigma-must-be-finite = sigma chyby musí být konečná a nezáporná, zadáno: { $sigma }

engine-e-altpnt-maps-correlation-length-must-be-finite = korelační délka musí být konečná a kladná, zadáno: { $corr_len_deg }

## src/altpnt/terrain.rs

engine-e-altpnt-terrain-samples-per-side-must-be = samples_per_side musí být >= 2, zadáno: { $n }

engine-e-altpnt-terrain-srtm-hgt-length = délka SRTM .hgt { $bytes } != 2*{ $n }*{ $n } = { $v2 }

engine-e-altpnt-terrain-an-hgt-window-needs-at = okno .hgt vyžaduje alespoň 2 x 2 vzorky, zadáno: { $n_rows } x { $n_cols }

engine-e-altpnt-terrain-step-must-be-finite-and = krok musí být konečný a kladný, zadáno: { $step_deg }

engine-e-altpnt-terrain-hgt-window-length = { "." }hgt: délka okna { $bytes } != 2*{ $n_rows }*{ $n_cols } = { $v2 }

engine-e-altpnt-terrain-combined-altpnt-unknown-magnetic-grid = combined-altpnt: neznámý sloupec magnetic_grid `{ $other }` (použijte "sealevel" nebo "upcont")

engine-e-altpnt-terrain-combined-altpnt-cannot-read-magnetic = combined-altpnt: csv_path { $csv_path } pro magnetic_grid nelze přečíst: { $e }

## src/animation.rs

engine-e-animation-unknown-animation-format-expected-svg = neznámý formát animace '{ $other }'; očekává se svg, html, frames nebo all

engine-e-animation-no-animation-format-given-expected = nebyl zadán formát animace; očekává se svg, html, frames nebo all

engine-e-animation-animation-fps-must-be-between = fps animace musí být mezi 1 a 60, zadáno: { $fps }

engine-e-animation-animation-duration-must-be-between = délka animace musí být mezi 0.5 s a 600 s, zadáno: { $duration_s }

engine-e-animation-animation-width-must-be-between = šířka animace musí být mezi 480 a 3840 pixely, zadáno: { $width }

engine-e-animation-result-is-not-json = výsledek není JSON: { $e }

engine-animation-mission-time = čas mise ({ $lay })

engine-animation-ffmpeg-framerate-frame-04d-svg = ffmpeg -framerate { $fps } -i frame_%04d.svg -pix_fmt yuv420p animation.mp4  (vyžaduje ffmpeg sestavený s librsvg; jinak snímky nejprve rasterizujte)

engine-animation-further-series-were-found-but = { " " }Další řady byly nalezeny, ale nejsou vykresleny: { $omitted } (přehrávač zobrazuje nejvýše { $MAX_CHARTS } panelů po { $MAX_TRACES } křivkách); jsou uvedeny v manifestu exportu frames.

## src/antenna.rs

engine-antenna-altitude-beamwidth-deg-points = výška { $a_lo }-{ $a_hi } m x šířka svazku { $b_lo }-{ $b_hi } deg, body: { $points }

engine-antenna-limb-capture-is-reached-on = zachycení limbu JE dosaženo na této mřížce ({ $grid }): provozní body zachycující limb: { $points } z { $points2 } vzorkovaných, nalezené průsečíky os: { $crossings }; nejsilnější vzorkované J/S limbu je { $limb_js_db } dB ve výšce { $altitude_m } m / šířce svazku { $hpbw_deg } deg, oproti prahu zachycení { $thr } dB.

engine-antenna-limb-capture-is-not-reached = zachycení limbu NENÍ dosaženo nikde na této mřížce ({ $grid }) - nejde o nulové zachycení, ale o absenci zachycení limbu: nejlepší J/S limbu je { $limb_js_db } dB ve výšce { $altitude_m } m / šířce svazku { $hpbw_deg } deg, tedy o { $shortfall } dB pod prahem zachycení { $thr } dB; tento provozní bod by limb zachytil při vysílacím výkonu { $limb_capture_tx_power_dbw } dBW oproti letovým { $p_tx_dbw } dBW.

engine-e-antenna-azimuths-must-strictly-increase = azimuty musí striktně růst

engine-e-antenna-azimuths-must-span-less-than = azimuty musí pokrývat méně než 360 deg

engine-e-antenna-off-boresight-angles-must-strictly = úhly od osy musí striktně růst

engine-e-antenna-gain-grid-does-not-match = mřížka zisku neodpovídá osám

## src/aocs.rs

engine-e-aocs-gains-and-must-be-finite = zesílení K a P musí být konečná a kladná

engine-e-aocs-at-least-three-reaction-wheels = jsou vyžadována alespoň tři reakční kola

engine-e-aocs-wheel-spin-axis-must-be = kolo { $i }: osa rotace musí být jednotkový vektor

engine-e-aocs-wheel-js-and-max-must = kolo { $i }: js a u_max musí být konečné a kladné

engine-e-aocs-the-wheel-spin-axes-do = osy rotace kol nepokrývají tři rozměry

engine-e-aocs-inertia-minus-the-wheels-spin = setrvačnost zmenšená o setrvačnost rotace kol musí být pozitivně definitní

engine-e-aocs-inertia-must-be-finite-and = setrvačnost musí být konečná a symetrická

## src/aocs_kind.rs

engine-e-aocs-kind-wheels-axis-must-be-non = wheels[{ $i }].axis musí být nenulový konečný vektor

engine-e-aocs-kind-must-be-finite-and-positive = { $n } musí být konečné a kladné

engine-e-aocs-kind-duration-dt-must-be-at = duration_s / dt_s smí dát nejvýše 2e6 kroků

engine-e-aocs-kind-sample-must-be-whole-multiple = sample_s musí být celým násobkem dt_s

engine-e-aocs-kind-sigma0-and-omega0-rad-must = sigma0 a omega0_rad_s musí být konečné

engine-e-aocs-kind-wheels-speed0-rpm-must-be = wheels[{ $i }].speed0_rpm musí být konečné

engine-e-aocs-kind-estimator-gyro-bias0-rad-must = estimator.gyro_bias0_rad_s musí být konečné

engine-e-aocs-kind-estimator-star-tracker-every-must = estimator.star_tracker_every_s musí být alespoň dt_s

## src/aperture_duty.rs

engine-e-aperture-duty-unknown-service-expected-navigation-nav = neznámá služba '{ $other }' (očekává se navigation|nav nebo communications|comms)

engine-e-aperture-duty-unknown-arbitration-policy-expected-navigation = neznámá politika arbitráže '{ $other }' (očekává se navigation-priority, communications-priority nebo first-come-first-served)

engine-e-aperture-duty-contact-plan-needs-at-least = plán kontaktů vyžaduje alespoň jedno kontaktní okno

engine-e-aperture-duty-apertures-must-be = apertures musí být >= 1

engine-e-aperture-duty-the-reporting-horizon-must-be = horizont vykazování musí být konečný

engine-e-aperture-duty-contact-has-non-finite-aos = kontakt '{ $name }' má nekonečné nebo nečíselné aos_s nebo los_s

engine-e-aperture-duty-contact-must-have-los-aos = kontakt '{ $name }' musí mít los_s > aos_s

engine-e-aperture-duty-contact-plan-needs-at-least-2 = plán kontaktů vyžaduje alespoň jedno okno [[contacts]]

engine-aperture-duty-aperture-duty-cycle-session-on = aperture-duty-cycle: relace: { $sessions }, apertury: { $apertures }, politika { $policy } -> vytížení navigací { $navigation_duty }, vytížení komunikací { $communications_duty }, nečinnost { $idle_duty }; ztráta kvůli souběhu požadavků: { $total_outage_s } s z požadovaných { $total_requested_s } s (MODELLED)

## src/api.rs

engine-api-study-generated = { " " }Studie vygenerována: { $html_escape }.

engine-e-api-failed-to-serialise-report-to = zpráva se nepodařilo serializovat do JSON: { $e }

engine-e-api-invalid-scenario = neplatný scénář: { $e }

engine-e-api-clock-log = clock_log: { $e }

engine-api-required-fields = - **Povinná pole:** { $fields }{ "\u000A" }

engine-api-optional-fields = - **Volitelná pole:** { $fields }{ "\u000A\u000A" }

engine-api-toml-parse-error = chyba zpracování TOML: { $e }

engine-api-could-not-classify-scenario-kind = druh scénáře se nepodařilo určit: { $e }

engine-api-missing-required-field = { $kind_name }: chybí povinná pole — { $options }

engine-api-missing-required-field-2 = { $kind_name }: chybí povinné pole "{ $entry }"

engine-e-api-invalid-orbit-scenario = neplatný scénář oběžné dráhy: { $e }

engine-e-api-sp3-export-requires-an-orbit = export SP3 vyžaduje scénář oběžné dráhy, nikoli '{ $k }'

engine-e-api-omm-export-requires-an-orbit = export OMM vyžaduje scénář oběžné dráhy, nikoli '{ $k }'

engine-e-api-oem-export-requires-an-orbit = export OEM vyžaduje scénář oběžné dráhy, nikoli '{ $k }'

engine-e-api-invalid-scenario-toml = neplatný TOML scénáře: { $e }

engine-e-api-could-not-re-serialise-scenario = scénář se nepodařilo znovu serializovat: { $e }

engine-api-scenario-jamming-availability-under-jamming = scénář { $r } | rušení (jamming) { $v2 } | dostupnost při rušení { $availability_under_jamming } (nominální { $availability_nominal }) | min. sledování { $min_tracking } | střední J/S { $v6 }

engine-e-api-the-result-document-already-carries = dokument s výsledkem již obsahuje `{ $FIGURE_TIERS_KEY }`

engine-e-api-failed-to-serialise-figure-tiers = figure_tiers se nepodařilo serializovat: { $e }

## src/api/builtins.rs

engine-e-api-builtins-invalid-scenario = neplatný scénář { $label }: { $e }

engine-api-builtins-scenario-quantum-holdover-p95-classical = scénář { $r } | kvantový holdover { $holdover_s }s p95 { $pos_p95_m }m | klasický holdover { $holdover_s2 }s p95 { $pos_p95_m2 }m

engine-api-builtins-scenario-spoof-vs-ns-spec = scénář { $r } | spoof { $scn } vs specifikace { $threshold_ns } ns (P_fa { $target_pfa }) | kvantová bezpečnost { $security_fom } (P_md { $analytic_pmd }, MC { $mc_pmd }) { $det } | klasická bezpečnost { $security_fom2 } (P_md { $analytic_pmd2 }, MC { $mc_pmd2 }) { $det2 }

engine-api-builtins-lunar-integrity-south-pole-epochs = lunar-integrity | jižní pól | dostupné epochy: { $samples_available }/{ $samples_total } ({ $report }%) | AL { $alert_limit_m } m | σ_URE { $sigma_ure_m } m | HPL { $min_hpl_m }–{ $max_hpl_m } m

engine-api-builtins-lunar-time-offset-secular-ltc = lunar-time-offset | sekulární rychlost LTC−TT { $secular_rate_us_per_day } µs/day (pásmo { $band_low }–{ $band_high }) | vlastní potenciál { $self_potential_us_per_day } kinetická { $kinetic_us_per_day } | posun @ { $horizon_days } d = { $offset_at_horizon_us } µs

engine-api-builtins-lunar-vlbi-baseline-km-beacon = lunar-vlbi | základna { $baseline_km } km | vzdálenost majáku { $beacon_range_km } km | zpoždění { $report } µs (rychlost { $delay_rate_s_per_s } s/s) | blízké pole { $near_field_correction_us } µs | vzorky: { $samples } za { $horizon_hours } h

engine-api-builtins-ephemeris-ure-required-vs-keplerian = { " " }| efemeridy { $report } ({ $provenance }) požadované σ_URE { $fmt } oproti keplerovským { $fmt2 } oproti poruchovým { $fmt3 } (Δ { $fmt4 })

engine-api-builtins-terrain-horizon-at-the-station = { " " }| horizont terénu ({ $sources }) u stanice max { $horizon_max_deg } deg, uživatelské body: průměr max { $user_horizon_max_deg_mean } deg

## src/api/builtins.rs

engine-api-builtins-scenario-optical-sync-rms-ps = scénář { $r } | optická sync_rms { $sync_rms_ps }ps range_rms { $range_rms_mm }mm adev(1s) { $adev_tau0 } | RF sync_rms { $sync_rms_ps2 }ps range_rms { $range_rms_mm2 }mm adev(1s) { $adev_tau02 }

engine-api-builtins-quantum-time-transfer-quantum-chain = quantum-time-transfer | kvantový řetězec { $quantum_chain_sigma_s }s vs klasický { $classical_chain_sigma_s }s | PL { $protection_level_ns } ns | bezpečnost Pd { $security_pd } (Pfa { $monitor_pfa }) | anomálie Pd { $anomaly_pd } | srovnání: kvantový vítězí { $r }/{ $foms } | MODELLED

engine-api-builtins-quantum-gnss-free-nav-outage = quantum-gnss-free-nav | výpadek { $outage_s }s | chyba polohy kvantová { $quantum_pos_err_m } m vs klasická { $classical_pos_err_m } m ({ $improvement_x }x) | holdover kvantový { $quantum_holdover_s }s vs klasický { $classical_holdover_s }s (práh { $threshold_m } m) | srovnání: kvantový vítězí { $r }/{ $foms } | MODELLED

engine-api-builtins-quantum-anomaly-detect-auc-quantum = quantum-anomaly-detect | AUC kvantový { $quantum_auc } vs klasický { $classical_auc } | minimální detekovatelná porucha kvantový { $quantum_min_detectable } vs klasický { $classical_min_detectable } | třídy poruch: { $fault_catalog } | srovnání: kvantový vítězí { $r }/{ $foms } | MODELLED

engine-e-api-builtins-coupled-applies-to-the-fusion = { "[" }coupled] platí pouze pro druh fusion

engine-api-builtins-scenario-quantum-pnt-holdover-integrity = scénář { $r } | kvantový PNT-holdover { $pnt_holdover_s }s (t { $timing_holdover_s }s/p { $position_holdover_s }s) integrita { $integ } bezpečnost { $security_na } | klasický PNT-holdover { $pnt_holdover_s2 }s (t { $timing_holdover_s2 }s/p { $position_holdover_s2 }s) integrita { $integ2 } bezpečnost { $security_na }

engine-api-builtins-scenario-fused-quantum-pnt-holdover = scénář { $r } | fúze | kvantový PNT-holdover { $pnt_holdover_s }s (t { $timing_holdover_s }s/p { $position_holdover_s }s) integrita { $integ } bezpečnost { $security_na } | klasický PNT-holdover { $pnt_holdover_s2 }s (t { $timing_holdover_s2 }s/p { $position_holdover_s2 }s) integrita { $integ2 } bezpečnost { $security_na }

engine-api-builtins-scenario-hybrid-ukf-17-state = scénář { $r } | hybrid-ukf (17 stavů, MODELLED) | senzor { $v2 } (q_va { $effective_q_va }) | hodiny q_wf { $clock_q_wf } q_rw { $clock_q_rw } | NIS { $nis_mean }/{ $nis_dof } v [{ $nis_chi2_lower_95 },{ $nis_chi2_upper_95 }] | NEES { $nees_mean }/{ $nees_dof } v [{ $nees_chi2_lower_95 },{ $nees_chi2_upper_95 }] | { $v14 } | podporováno { $aided_pos_rms_m }m -> setrvačný doběh { $coast_end_pos_rms_m }m za { $coast_duration_s }s | vnitřní konzistence, ne přesnost

engine-api-builtins-scenario-gnss-ins-quantum-outage = scénář { $r } | gnss-ins | kvantové outage-RMS fúzované { $fused_outage_rms_m }m vs volné { $free_outage_rms_m }m (holdover { $holdover_s }s, dostupnost { $availability }) | klasické fúzované { $fused_outage_rms_m2 }m vs volné { $free_outage_rms_m2 }m (holdover { $holdover_s2 }s, dostupnost { $availability2 })

engine-api-builtins-scenario-gnss-sim-mean-iono = scénář { $r } | gnss-sim | střední iono { $mean_iono_m }m tropo { $mean_tropo_m }m | dostupnost RAIM { $raim_availability } střední HPL { $mean_hpl_m }m VPL { $mean_vpl_m }m četnost poruch { $fault_rate }

engine-api-builtins-sweep-over-pts-scale-quantum = průchod { $metric } přes { $parameter } ({ $first }..{ $last }, body: { $points }, měřítko: { $scale }) | kvantový { $first2 }->{ $last2 } | klasický { $first3 }->{ $last3 }

engine-api-builtins-scenario-samples-gnss-nominal-best = scénář { $r } | { $nominal }/{ $series } vzorků GNSS nominální | nejlepší PDOP { $fnum } poloha { $posm } | kvantový holdover { $holdover_s }s p95 { $ns1 }ns integrita { $integ } bezpečnost { $security_na } | klasický holdover { $holdover_s2 }s p95 { $ns12 }ns integrita { $integ2 } bezpečnost { $security_na }

engine-e-api-builtins-ephemeris = efemeridy: { $e }

engine-api-builtins-max-el-peak-doppler-khz = { " " }| max. elevace { $el }° špička Doppler { $v1 } kHz

engine-api-builtins-generic-sweep-of-over-nodes = obecný průchod `{ $kind }` přes [{ $keys }] | uzly: { $points } (tvar { $shape }) | metriky [{ $metrics }]

engine-api-builtins-gravity-map-free-inertial-drift = gravity-map | volný inerciální drift { $free_inertial_drift_m } m | gravitačně přiřazeno { $map_matched_error_m } m | sigma přiřazení { $measurement_sigma_mgal } mGal

engine-api-builtins-reference-degree-anomaly-std-mgal = { " " }| referenční stupeň { $reference_nmax } směrodatná odchylka anomálie { $reference_anomaly_std_mgal } mGal

engine-api-builtins-map-error-mc-p95-within = { " " }| chyba mapy MC x{ $realisations } p95 { $matched_error_p95_m } m, { $v3 }% do { $target_m } m

engine-api-builtins-terrain-nav-free-inertial-drift = terrain-nav | volný inerciální drift { $free_inertial_drift_m } m | přiřazeno k terénu { $matched_error_m } m (snížení { $v3 }x) | sigma přiřazení { $measurement_sigma_m } m

engine-api-builtins-terrain-slam-waypoints-free-inertial = terrain-slam | trasové body: { $waypoints } | volné inerciální RMS { $free_inertial_rms_m } m (konečné { $free_inertial_final_m } m) | RMS přiřazení k terénu { $matched_rms_m } m (konečné { $matched_final_m } m, snížení { $v6 }x) | střední ESS { $mean_ess }/{ $cfg } | sigma přiřazení { $measurement_sigma_m } m

engine-api-builtins-combined-altpnt-free-inertial-drift = combined-altpnt | volný inerciální drift { $free_inertial_drift_m } m | gravitace { $gravity_only_m } m magnetismus { $magnetic_only_m } m terén { $terrain_only_m } m | FUSED { $combined_m } m

engine-e-api-builtins-clock-log-needs-runs-measured = { "[" }clock_log] vyžaduje runs = 1: změřený záznam je jeden záznam

engine-api-builtins-scenario-runs-quantum-holdover-p95 = scénář { $r } | běhy: { $runs } | kvantový holdover { $mean }s [{ $p05 }-{ $p95 }] p95 { $ns1 }ns bezpečnost { $security_na } | klasický holdover { $mean2 }s [{ $p052 }-{ $p952 }] p95 { $ns12 }ns bezpečnost { $security_na }

engine-api-builtins-scenario-quantum-holdover-p95-ns = scénář { $r } | kvantový holdover { $holdover_s }s p95 { $ns1 }ns integrita { $integ } bezpečnost { $security_na } | klasický holdover { $holdover_s2 }s p95 { $ns12 }ns integrita { $integ2 } bezpečnost { $security_na }

## src/araim_reference.rs

engine-e-araim-reference-reference-case-needs-at-least = referenční případ vyžaduje alespoň jednu družici

engine-e-araim-reference-reference-case-needs-at-least-2 = referenční případ vyžaduje alespoň jednu konstelaci

engine-e-araim-reference-satellite-names-constellation-but-only = družice { $i } uvádí konstelaci { $constellation }, ale deklarovány jsou pouze { $constellations }

engine-e-araim-reference-satellite-has-non-positive-error = družice { $i } má nekladný rozptyl chyby

engine-e-araim-reference-both-integrity-risk-allocations-must = obě alokace rizika integrity musí být kladné

engine-e-araim-reference-this-reference-implementation-monitors-single = tato referenční implementace sleduje pouze režimy poruch s jednou událostí, ale apriorní hodnoty případu vyžadují N_fault,max = { $nfm } (současné podmnožiny více událostí). Odmítnutí je lepší než podhodnocení počtu režimů poruch.

engine-e-araim-reference-the-all-in-view-geometry = geometrie se všemi družicemi v dohledu je singulární

engine-e-araim-reference-no-fault-mode-is-observable = na této geometrii není pozorovatelný žádný režim poruchy

engine-e-araim-reference-unknown-reference-vector-known-vectors = neznámý referenční vektor '{ $vector }'; známé vektory: { $ids } (nebo 'all')

engine-araim-reference-araim-reference-check-published-wg = araim-reference-check: publikované referenční vektory WG-C: { $wanted }; nejhorší shoda VPL/HPL { $worst_acceptance } m oproti vlastní TOL_PL reference = { $tol } m na přejímacích vektorech: { $acceptance_checked }

engine-e-araim-reference-sat-needs-one-value-per = P_sat vyžaduje jednu hodnotu na družici a P_const jednu na konstelaci

engine-e-araim-reference-satellite-names-an-undeclared-constellation = družice uvádí nedeklarovanou konstelaci

engine-e-araim-reference-every-prior-must-lie-in = každá apriorní hodnota musí ležet v [0, 1)

engine-e-araim-reference-the-all-in-view-solution = řešení se všemi družicemi v dohledu nebylo vybráno

engine-e-araim-reference-an-add-v4-case-needs = případ ADD v4.2 vyžaduje družice a konstelace

engine-e-araim-reference-nom-and-sat-need-one = b_nom a P_sat vyžadují jednu hodnotu na družici

engine-e-araim-reference-const-needs-one-value-per = P_const vyžaduje jednu hodnotu na konstelaci

engine-e-araim-reference-satellite-names-an-undeclared-constellation-2 = družice { $i } uvádí nedeklarovanou konstelaci

engine-e-araim-reference-one-constellation-index-per-satellite = jeden index konstelace na družici

engine-e-araim-reference-satellite-names-constellation-with-no = družice { $i } uvádí konstelaci { $c } bez ISM

engine-e-araim-reference-fewer-than-four-satellites-above = méně než čtyři družice nad maskou

## src/attack_surface.rs

engine-e-attack-surface-standoffs-must-contain-at-least = standoffs_m musí obsahovat alespoň jednu vzdálenost

engine-attack-surface-lunar-attack-surface-afs-dbw = lunar-attack-surface | AFS { $afs_received_dbw } dBW, { $sense } { $a } dB (pásmo { $deficit_band_lo_db }–{ $deficit_band_hi_db }, { $shown_rounded }×/{ $shown_unrounded }× { $sense }) | spoof@{ $value } m { $nearest } W | stopa zachycení { $a2 }% limit, limb { $footprint_limb_captured } | spoof-capture { $spoof_captured } (uzamčení { $spoof_lock_time_s } s) | dosah stožáru { $a3 } km | OSNMA { $nma_overhead_bps } bit/s ({ $a4 }% z 50 bit/s), latence { $nma_auth_latency_s } s

engine-attack-surface-reached-crossing-best-db = dosaženo (průsečíky: { $crossings }, nejlepší { $best_limb_js_db } dB)

engine-attack-surface-not-reached-on-this-grid = NEDOSAŽENO na této mřížce (nejlepší { $best_limb_js_db } dB, o { $best_limb_shortfall_db } dB méně; vyžaduje { $best_limb_capture_tx_power_dbw } dBW oproti { $p_tx_dbw } dBW)

engine-attack-surface-footprint-sweep-alt-km-hpbw = { " " }| průchod stopou { $s }x{ $s2 } (výška { $v3 }-{ $v4 } km x HPBW { $bw_lo }-{ $bw_hi } deg), zachycení { $v5 }-{ $v6 }% | limb { $limb }

engine-attack-surface-afs-received-dbw = AFS přijato: { $afs_received_dbw } dBW

engine-attack-surface-deficit-db-band-db = Deficit: { $deficit_db } dB (pásmo { $deficit_band_lo_db }-{ $deficit_band_hi_db } dB, { $deficit_factor_rounded }x/{ $deficit_factor_unrounded }x)

engine-attack-surface-capture-footprint-of-disk-limb = Stopa zachycení: { $a }% disku, limb zachycen: { $footprint_limb_captured }

engine-attack-surface-spoof-capture-pull-in-lock = Strhnutí spoofingu: { $spoof_captured } (uzamčení { $spoof_lock_time_s } s)

engine-attack-surface-mast-reach-km-osnma-bit = Dosah stožáru: { $a } km | OSNMA { $nma_overhead_bps } bit/s ({ $a2 }%)

engine-attack-surface-limb-captured-on-grid-crossing = Limb: zachycen na mřížce { $na }x{ $nb }, průsečíky: { $crossings }

engine-attack-surface-limb-not-captured-on-grid = Limb: nezachycen na mřížce { $na }x{ $nb }; vyžaduje { $best_limb_capture_tx_power_dbw } dBW (letové { $p_tx_dbw })

## src/attitude_budget.rs

engine-e-attitude-budget-altitude-km-must-be-finite = altitude_km musí být konečné a kladné

engine-e-attitude-budget-inertias-must-be-finite-and = setrvačnosti musí být konečné a kladné

engine-e-attitude-budget-max-kg-m2-must-be = i_max_kg_m2 musí být >= i_min_kg_m2

engine-e-attitude-budget-at-least-one-pointing-contributor = je vyžadován alespoň jeden přispěvatel k zaměřování

engine-e-attitude-budget-contributor-sigma-must-be-finite = sigma přispěvatele '{ $name }' musí být konečná a >= 0

engine-attitude-budget-attitude-budget-km-kg-gg = attitude-budget: { $altitude_km } km, ΔI { $delta_i } kg·m² -> moment GG { $t_gg } N·m; zaměřování { $total }" RSS (dominantní: { $dominant }) (MODELLED skalární rozpočet)

## src/bench/cli.rs

engine-bench-cli-needs-value = { $name } vyžaduje hodnotu

engine-bench-cli-unknown-option = neznámá volba `{ $a }`

engine-bench-cli-unexpected-argument = neočekávaný argument `{ $pos }`

engine-bench-cli-cannot-read = { $p } nelze přečíst: { $e }

engine-bench-cli-cannot-create = { $d } nelze vytvořit: { $e }

engine-bench-cli-cannot-write = do { $p } nelze zapsat: { $e }

engine-bench-cli-unknown-task-or = neznámá úloha `{ $t }` (a, b, c nebo d)

engine-bench-cli-scored-epochs-in-folder = hodnocené epochy: { $labels }, složky: { $folders }

engine-bench-cli-wrote-cases-json-and-truth = zapsáno { $out }/cases.json a { $out }/truth.json

engine-bench-cli-refused-this-commitment-is-provisional = REFUSED: tento závazek je předběžný a jeho seed byl odhalen; nejde o holdout vydání

engine-bench-cli-mismatch-the-seed-is-not = MISMATCH: seed není ten, který stojí za tímto závazkem

engine-bench-cli-is-not-json = { $f } není JSON: { $e }

engine-bench-cli-cannot-read-2 = { $i } nelze přečíst: { $e }

engine-bench-cli-result-rendered = vykresleno výsledků: { $results }

engine-bench-cli-unknown-subcommand =
    neznámý podpříkaz `{ $other }`
    { $BENCH_USAGE }

engine-bench-cli-cannot-create-an-existing-seed = { $path } nelze vytvořit (existující soubor se seedem se nikdy nepřepisuje): { $e }

engine-bench-cli-cannot-write-2 = do { $path } nelze zapsat: { $e }

engine-bench-cli-seed-written-to-keep-it = seed zapsán do { $path }: neukládejte jej do správy verzí ani do žádné zprávy; veřejný je pouze níže uvedený hash

engine-bench-cli-test-kshana-iq-cn0-drop = b-test-kshana-iq-cn0-drop (převzato, nespuštěno znovu)

engine-bench-cli-impairment-eval-baseline = základ impairment-eval: { $det }

engine-bench-cli-no-scenario-json-under = pod { $root } není žádný scenario.json

engine-bench-cli-is-not-json-2 = { $path } není JSON: { $e }

engine-bench-cli-ok-mismatched-missing-unpinned = v pořádku: { $ok }, neshoduje se: { $bad }, chybí: { $missing }, nepřipnuto: { $unpinned }

## src/bench/mod.rs

engine-bench-unknown-split-dev-test-or = neznámé rozdělení `{ $other }` (dev, test nebo holdout)

engine-bench-score-for-is-not-finite = skóre pro `{ $id }` není konečné

engine-bench-case-have-no-score-the = případy bez skóre: { $missing }, první je `{ $first_missing }`

engine-bench-predictions-name-case-that-is = predikce uvádějí případ, který není v referenčních hodnotách: `{ $extra }`

engine-bench-schema-must-be = `schema` musí být `{ $RESULT_SCHEMA }`

engine-bench-must-be-64-digit-hex = `{ $k }` musí být 64místný hexadecimální SHA-256

engine-bench-truth-is-not-json = referenční hodnoty nejsou JSON: { $e }

engine-bench-predictions-are-not-json = predikce nejsou JSON: { $e }

engine-bench-truth-schema-must-be = `schema` referenčních hodnot musí být `{ $TRUTH_SCHEMA }`

engine-bench-predictions-schema-must-be = `schema` predikcí musí být `{ $PREDICTIONS_SCHEMA }`

engine-bench-truth-was-made-under-another = referenční hodnoty vznikly podle jiné verze specifikace než { $SPEC_VERSION }; výsledky různých hlavních verzí se nikdy nemísí

engine-bench-unknown-task = neznámá úloha `{ $other }`

## src/bench/site.rs

engine-bench-site-result-is-not-valid = výsledek { $v1 } není platný: { $p }

engine-bench-site-result-is-task-holdout-result = výsledek { $v1 } je výsledek holdout úlohy (d) bez `holdout_commitment`

engine-bench-site-result-is-scored-on-provisional = výsledek { $v1 } je hodnocen na předběžném, odhaleném seedu holdoutu: nejde o holdout vydání

engine-bench-site-result-was-scored-under-this = výsledek { $v1 } byl hodnocen podle { $v }; tato stránka je pro { $SPEC_VERSION }

## src/bench/tasks.rs

engine-bench-tasks-score-for-is-not-number = skóre pro `{ $k }` není číslo

engine-bench-tasks-kshana-receiver-trust-35-default = kshana receiver-trust { $s } (statistika monitoru, výchozí 0.35)

engine-bench-tasks-malformed-clock-line = chybně utvořený řádek hodin `{ $line }`

engine-bench-tasks-the-clock-file-does-not = soubor hodin neodpovídá připnutému SHA-256 (získáno { $got }, očekáváno { $C_CLOCKS_SHA256 })

engine-bench-tasks-satellite-is-not-in-the = družice { $prn } není v souboru hodin

engine-bench-tasks-kshana-bench-baseline = základ kshana-bench: { $baseline }

engine-bench-tasks-predictions-cover-cases-the-truth = predikce pokrývají případy: { $pmap }, referenční hodnoty jich mají { $tarr }

engine-bench-tasks-case-has-no-number-array = případ `{ $id }` nemá pole čísel

engine-bench-tasks-case-has-non-finite-value = případ `{ $id }` má nekonečnou nebo nečíselnou hodnotu

## src/bin/crossover_study.rs

engine-e-bin-crossover-study-serialize = serializace { $name }: { $e }

engine-e-bin-crossover-study-write = zápis { $path }: { $e }

engine-bin-crossover-study-error-cannot-create = chyba: { $dir } nelze vytvořit: { $e }

engine-bin-crossover-study-done-inertial-nodes-clock-curves = hotovo: inerciální uzly { $nodes }, křivky hodin { $curves } (seed 42)

## src/bin/gen_araim_m3_study.rs

## src/bin/gen_validation_artifacts.rs

engine-bin-gen-validation-artifacts-wrote-docs-interop-md-export = zapsáno docs/INTEROP.md (tabulka exportu)

## src/bin/validation_report.rs

engine-bin-validation-report-wrote-validation-summary-to = souhrn validace zapsán do { $path }

## src/body_pnt.rs

engine-e-body-pnt-unknown-body = neznámé těleso '{ $body_name }'

engine-e-body-pnt-body-pnt-navigates-around-body = body-pnt naviguje kolem jiného tělesa než Země s odkazem na Zemi; { $name } zde není podporováno

engine-e-body-pnt-duration-and-step-must-be = duration_s a step_s musí být kladné s nejvýše 20000 epochami; zadáno { $duration } a { $step }

engine-e-body-pnt-user-kind-must-be-orbiter = user.kind musí být orbiter nebo surface; zadáno '{ $k }'

engine-e-body-pnt-user-altitude-must-be-positive = výška uživatele musí být kladná a excentricita v [0, 0.9)

engine-e-body-pnt-the-user-orbit-periapsis-is = periapsida dráhy uživatele je pod povrchem

engine-e-body-pnt-constellation-needs-to-200-satellites = konstelace vyžaduje 1 až 200 družic v alespoň jedné rovině

engine-e-body-pnt-constellation-altitude-must-be-positive = výška konstelace musí být kladná

engine-e-body-pnt-range-sigmas-must-be-positive = sigmy vzdálenosti musí být kladné

engine-e-body-pnt-no-earth-position-relative-to = žádná poloha Země vzhledem k { $name } pro JD { $jd }

engine-e-body-pnt-serialising-report = serializace zprávy: { $e }

engine-e-body-pnt-the-report-must-serialise-to = zpráva se musí serializovat na objekt JSON

engine-body-pnt-positioning-around = Určování polohy kolem { $name }

## src/calibration_ensembles.rs

engine-e-calibration-ensembles-e1-scenario-is-not-table = scénář E1 není tabulka

engine-e-calibration-ensembles-e1-scenario-has-no-monte = scénář E1 nemá [monte_carlo]

engine-e-calibration-ensembles-e1-final-error-missing = E1: chybí final_error.{ $k }

engine-calibration-ensembles-e1-is-scenarios-campaign-monte = { "\u000A" }E1 je `scenarios/campaign-monte-carlo-clock-holdover.toml`, 200 souborů po 200 realizacích, oproti uzavřenému tvaru: střední hodnota 0, sigma = { $sigma } ns. Soubor j používá základní seed 1 000 000 + 1000 j a bootstrap seed 20260928 + j. Největší relativní chyba ADEV byla { $max } pro E2 a { $max2 } pro E3 (napříč 1, 10 a 100 s).{ "\u000A" }

## src/campaign.rs

engine-e-campaign-empty-result-path = prázdná cesta k výsledku

engine-e-campaign-result-path-has-an-empty = cesta k výsledku `{ $path }` má prázdný segment

engine-e-campaign-result-path-bad-index-in = cesta k výsledku `{ $path }`: chybný index v `{ $part }`

engine-e-campaign-result-path-no-field = cesta k výsledku `{ $path }`: žádné pole `{ $name }`

engine-e-campaign-result-path-indexed-value-is = cesta k výsledku `{ $path }`: indexovaná hodnota není pole

engine-e-campaign-result-path-index-out-of = cesta k výsledku `{ $path }`: index { $i } mimo rozsah ({ $n })

engine-e-campaign-result-path-value-is-not = cesta k výsledku `{ $path }`: hodnota není číslo ani příznak

engine-e-campaign-result-path-is-not-an = cesta k výsledku `{ $path }`: `{ $k }` není pole

engine-e-campaign-result-path-must-name-one = cesta k výsledku `{ $path }` musí určovat jednu hodnotu, ne řádky

engine-e-campaign-result-path-is-not-an-2 = cesta k výsledku `{ $path }`: `{ $name }` není pole

engine-e-campaign-metric-path-has-no-entry = cesta metriky `{ $path }` nemá položku v bloku units daného druhu; deklarujte její `unit` v kampani

engine-e-campaign-must-be-non-empty-letters = { $what } `{ $name }` musí být neprázdné a obsahovat písmena, číslice, `_` nebo `-`

engine-e-campaign-campaign-cannot-contain-campaign = { $label }: kampaň nemůže obsahovat kampaň

engine-e-campaign-serialise = { $label }: serializace: { $e }

engine-e-campaign-result-did-not-parse = { $label }: výsledek se nepodařilo zpracovat: { $e }

engine-e-campaign-seed-key-no-field-in = klíč seedu `{ $key }`: ve scénáři není pole `{ $part }`

engine-e-campaign-seed-key-is-not-non = klíč seedu `{ $key }` není nezáporné celé číslo

engine-e-campaign-seed-does-not-fit-toml = seed { $seed } se nevejde do celého čísla TOML

engine-campaign-time-path-must-name-rows = cesta času `{ $t }` musí určovat řádky pomocí `[]`

engine-campaign-compare-is-not-below-above = compare `{ $c }` není below, above ani abs_above

engine-campaign-threshold-is-null = práh `{ $p }` je null

engine-campaign-reduce-is-not-mean-min = reduce `{ $r }` není mean, min, max ani count

engine-campaign-time-path-gives-several-values = cesta času `{ $t }` dává několik hodnot na řádek

engine-campaign-value-path-has-fewer-rows = cesta hodnoty `{ $y }` má méně řádků než `{ $t }`

engine-campaign-value-path-has-rows-time = cesta hodnoty `{ $y }` má řádky: { $r }, cesta času `{ $t }` má řádky: { $t_rows }

engine-e-campaign-campaign-with-phases-needs-timeline = kampaň s fázemi vyžaduje [timeline] s step_s

engine-e-campaign-timeline-step-must-be-positive = timeline.step_s musí být kladné, zadáno: { $step }

engine-e-campaign-phase-is-named-twice = fáze `{ $name }` je pojmenována dvakrát

engine-e-campaign-phase-duration-must-be-non = fáze `{ $name }`: duration_s musí být nezáporné

engine-e-campaign-phase-has-no-runs = fáze `{ $name }` nemá žádné běhy

engine-e-campaign-phase-the-first-phase-has = fáze `{ $name }`: první fáze nemá od čeho předávat

engine-e-campaign-phase-handoff-from-channel-which = fáze `{ $name }`: předání z kanálu `{ $ch }`, kterým předchozí fáze neskončila

engine-e-campaign-phase-handoff-from-run-does = fáze `{ $name }`: předání from_run { $from_run } neexistuje

engine-e-campaign-phase-handoff-is-null = fáze `{ $name }`: předání `{ $from }` je null

engine-e-campaign-phase-handoff-run-does-not = fáze `{ $name }`: běh předání { $run } neexistuje

engine-e-campaign-phase = fáze `{ $name }`: { $e }

engine-campaign-phase-run = fáze { $name }/běh { $ri }

engine-e-campaign-phase-end-at-run-does = fáze `{ $name }`: end_at_run { $end_at_run } neexistuje

engine-campaign-duration-end-at-is-later = duration_s (end_at { $p } = { $x } s je později)

engine-campaign-duration-end-at-is-null = duration_s (end_at { $p } je null)

engine-e-campaign-phase-side-is-not-classical = fáze `{ $name }`: strana `{ $side }` není classical ani quantum

engine-e-campaign-phase-skip-must-be-non = fáze `{ $name }`: skip_s musí být nezáporné

engine-e-campaign-phase-alarm-compare-is-not = fáze `{ $name }`: alarm compare `{ $compare }` není below, above ani abs_above

engine-e-campaign-phase-alarm-threshold-is-null = fáze `{ $name }`: práh alarmu `{ $p }` je null

engine-e-campaign-phase-channel-is-in-not = fáze `{ $name }`: kanál `{ $channel }` je v { $u }, ne v { $du }

## src/campaign.rs

engine-e-campaign-phase-channel-needs-unit = fáze `{ $name }`: kanál `{ $channel }` vyžaduje jednotku

engine-e-campaign-phase-two-runs-both-provide = fáze `{ $name }`: dva běhy poskytují týž kanál `{ $channel }`

engine-e-campaign-phase-carries-which-the-previous = fáze `{ $name }` přenáší `{ $ch }`, kterým předchozí fáze neskončila

engine-e-campaign-phase-carries-but-no-run = fáze `{ $name }` přenáší `{ $ch }`, ale žádný její běh neposkytuje `{ $ch }`

engine-e-campaign-channel-is-in-in-one = kanál `{ $name }` je v jedné fázi v { $unit } a v jiné v { $unit2 }

engine-e-campaign-at-least-one-metric-is = je potřeba alespoň jedna metrika

engine-e-campaign-metric-is-named-twice = metrika `{ $name }` je pojmenována dvakrát

engine-e-campaign-seed-overflow-in-the-ensemble = přetečení seedu v souboru realizací

engine-e-campaign-an-ensemble-needs-at-least = soubor realizací vyžaduje alespoň jeden běh

engine-e-campaign-sweep-takes-one-to-three = průchod bere jednu až tři osy, zadáno: { $axes }

engine-e-campaign-axis-is-named-twice = osa `{ $name }` je pojmenována dvakrát

engine-e-campaign-axis-needs-at-least-two = osa `{ $name }` vyžaduje alespoň dva kroky

engine-e-campaign-axis-scale-must-be-lin = osa `{ $name }`: scale musí být lin nebo log

engine-e-campaign-axis-log-axis-needs-positive = osa `{ $name }`: logaritmická osa vyžaduje kladné konce

engine-campaign-sweep-node = uzel průchodu { $flat }

engine-e-campaign-monte-carlo-runs-must-be = monte_carlo.runs musí být alespoň dvě

engine-e-campaign-compose-needs-at-least-one = compose vyžaduje alespoň jednoho člena

engine-e-campaign-shared-value-must-be-number = sdílená hodnota `{ $name }` musí být číslo nebo čísla

engine-e-campaign-shared-value-is-named-twice = sdílená hodnota `{ $name }` je pojmenována dvakrát

engine-e-campaign-member-binds-unknown-shared = člen `{ $label }` váže neznámou sdílenou hodnotu `{ $name }`

engine-e-campaign-member = člen `{ $label }`: { $e }

engine-e-campaign-metric-is-in-for-one = metrika `{ $name }` je u jednoho člena v { $u } a u `{ $label }` v { $unit }

engine-e-campaign-member-is-named-twice = člen `{ $label }` je pojmenován dvakrát

engine-e-campaign-invalid-campaign-scenario = neplatný scénář kampaně: { $e }

engine-e-campaign-invalid-campaign = neplatná kampaň: { $e }

engine-e-campaign-sweep = sweep: { $e }

engine-e-campaign-monte-carlo = monte_carlo: { $e }

engine-e-campaign-compose = compose: { $e }

engine-e-campaign-optimize = optimize: { $e }

engine-campaign-of-across-the-realisations = { $d }: { $what } napříč realizacemi

engine-campaign-value-of-at-the-end = hodnota { $ch } na konci předchozí fáze, přičtená k { $ch } této fáze

engine-campaign-on-the-timeline-grid-the = { $label } na mřížce časové osy: poslední vzorek běhu vlastnící fáze v každém čase mřížky nebo před ním (zero-order hold); null tam, kde jej žádný běh této fáze neposkytuje

engine-campaign-values-of-the-scenario-key = hodnoty klíče scénáře { $key } podél osy { $name }

engine-campaign-value-of-the-scenario-key = hodnota klíče scénáře { $key } v tomto uzlu

engine-campaign-of-the-node-result = { $path } z výsledku uzlu

engine-campaign-of-each-realisation-in-seed = { $path } z každé realizace, v pořadí seedů

engine-campaign-shared-value-written-into-every = sdílená hodnota { $name }, zapsaná do každého člena, který ji váže

engine-campaign-metric-read-from-the-member = metrika { $name } přečtená z výsledku člena

engine-campaign-smallest-across-the-members = nejmenší { $name } napříč členy

engine-campaign-largest-across-the-members = největší { $name } napříč členy

engine-campaign-mean-across-the-members = průměr { $name } napříč členy

engine-e-campaign-failed-to-serialise-campaign-result = výsledek kampaně se nepodařilo serializovat: { $e }

engine-campaign-chain-phases-over-events-alarm = řetězec: fáze: { $phases }, { $duration_s } s, události: { $events }, alarm vyhlášen na { $alarm_s } s mřížky

engine-campaign-sweep-of-nodes-over = průchod `{ $scenario_kind }`: uzly: { $nodes } přes [{ $axis_order }]{ $v4 }

engine-campaign-monte-carlo-of-seeds = Monte Carlo pro `{ $scenario_kind }`: seedy: { $runs }

engine-campaign-compose-members = compose: členové: { $members }

engine-campaign-member-runs-modelled = běhy členů: { $runs_total } (MODELLED)

engine-campaign-sweep-of-over-nodes-each = průchod `{ $scenario_kind }` přes { $axis_order } (uzly: { $nodes }{ $v4 }; každá čára ve vlastním rozsahu)

engine-campaign-campaign-modelled-composition-every-value = kampaň { $r } | MODELLED složení; každá hodnota přečtena ze skutečného běhu uvedeného druhu

## src/campaign/optimize.rs

engine-e-campaign-optimize-an-optimisation-takes-one-to = optimalizace bere jeden až tři parametry, zadáno: { $params }

engine-e-campaign-optimize-param-is-named-twice = parametr `{ $name }` je pojmenován dvakrát

engine-e-campaign-optimize-param-needs-finite-lo-hi = parametr `{ $name }`: vyžaduje konečné lo < hi

engine-e-campaign-optimize-param-scale-must-be-lin = parametr `{ $name }`: scale musí být lin nebo log

engine-e-campaign-optimize-param-log-param-needs-positive = parametr `{ $name }`: logaritmický parametr vyžaduje kladné meze

engine-e-campaign-optimize-param-start-must-lie-in = parametr `{ $name }`: start musí ležet v [lo, hi]

engine-e-campaign-optimize-param-grid-needs-steps-of = parametr `{ $name }`: mřížka vyžaduje alespoň dva kroky

engine-e-campaign-optimize-objective-target-is-only-read = objective.target se čte pouze s goal = "target"

engine-e-campaign-optimize-goal-target-needs-finite-objective = goal = "target" vyžaduje konečné objective.target

engine-e-campaign-optimize-objective-goal-must-be-minimize = objective.goal musí být minimize, maximize nebo target, zadáno: `{ $other }`

engine-e-campaign-optimize-grid-of-nodes-is-above = mřížka o { $total } uzlech překračuje limit 100000

engine-e-campaign-optimize-params-steps-is-only-read = params.steps se čte pouze s method = "grid"

engine-e-campaign-optimize-max-evals-must-cover-the = max_evals musí pokrýt počáteční simplex (params + 1)

engine-e-campaign-optimize-step-must-lie-in = step musí ležet v (0, 1]

engine-e-campaign-optimize-ftol-and-xtol-must-be = ftol a xtol musí být nezáporné

engine-e-campaign-optimize-method-must-be-grid-or = method musí být grid nebo nelder-mead, zadáno: `{ $other }`

engine-campaign-optimize-optimize-eval = vyhodnocení optimalizace { $trace }

engine-campaign-optimize-lower-bound-of-the-scenario = dolní mez klíče scénáře { $key }

engine-campaign-optimize-upper-bound-of-the-scenario = horní mez klíče scénáře { $key }

engine-campaign-optimize-value-of-the-scenario-key = hodnota klíče scénáře { $key } v nejlepším vyhodnocení

engine-campaign-optimize-value-of-the-scenario-key-2 = hodnota klíče scénáře { $key } v tomto vyhodnocení

engine-campaign-optimize-target-value-of = cílová hodnota: { $what }

engine-campaign-optimize-at-the-best-evaluation = { $what } v nejlepším vyhodnocení

engine-campaign-optimize-of-this-evaluation-the-seed = { $what } tohoto vyhodnocení (průměr přes seedy, když runs > 1)

engine-campaign-optimize-optimize-of-by-evals-best = optimalizace `{ $objective_name }` ({ $goal } { $o }) pro `{ $scenario_kind }` metodou { $method }: vyhodnocení: { $evals } ({ $stop_reason }), nejlepší { $o2 } v [{ $at }]

## src/ccsds_tdm.rs

engine-e-ccsds-tdm-tdm-meta-start-before-ccsds = TDM: META_START před hlavičkou CCSDS_TDM_VERS

engine-e-ccsds-tdm-tdm-malformed-header-line = TDM: chybně utvořený řádek hlavičky: { $line }

engine-e-ccsds-tdm-tdm-malformed-metadata-line = TDM: chybně utvořený řádek metadat: { $line }

engine-e-ccsds-tdm-tdm-malformed-data-line = TDM: chybně utvořený datový řádek: { $line }

engine-e-ccsds-tdm-tdm-unrecognised-data-keyword = TDM: nerozpoznané datové klíčové slovo { $k }

engine-e-ccsds-tdm-tdm-data-line-missing-epoch = TDM: datovému řádku { $k } chybí epocha

engine-e-ccsds-tdm-tdm-data-line-missing-value = TDM: datovému řádku { $k } chybí hodnota

engine-e-ccsds-tdm-tdm-data-line-bad-value = TDM: datový řádek { $k }, chybná hodnota { $val_str }

engine-e-ccsds-tdm-tdm-unterminated-segment-missing-meta = TDM: neukončený segment (chybí META_STOP/DATA_STOP)

engine-e-ccsds-tdm-tdm-bad-turnaround-numerator = TDM: chybná hodnota TURNAROUND_NUMERATOR { $value }

engine-e-ccsds-tdm-tdm-bad-turnaround-denominator = TDM: chybná hodnota TURNAROUND_DENOMINATOR { $value }

## src/cislunar_arc_recovery.rs

engine-e-cislunar-arc-recovery-unknown-observable-expected-one-of = neznámá pozorovatelná `{ $other }`: očekává se jedna z range, range-rate

engine-e-cislunar-arc-recovery-unknown-coordinates-expected-one-of = neznámé souřadnice `{ $other }`: očekává se jedny z cartesian, polar

engine-e-cislunar-arc-recovery-arc-hours-must-be-finite = arc_hours musí být konečné a kladné, zadáno: { $arc_hours }

engine-e-cislunar-arc-recovery-epochs-must-be-got = epochs musí být ≥ 2, zadáno: { $epochs }

engine-e-cislunar-arc-recovery-steps-must-be = steps musí být ≥ 1

engine-e-cislunar-arc-recovery-trials-must-be = trials musí být ≥ 1

engine-e-cislunar-arc-recovery-max-iterations-must-be = max_iterations musí být ≥ 1

engine-e-cislunar-arc-recovery-displacement-nd-must-be-finite = displacement_nd musí být konečné a kladné, zadáno: { $displacement_nd }

engine-e-cislunar-arc-recovery-recovery-factor-must-be-finite = recovery_factor musí být konečný a kladný, zadáno: { $recovery_factor }

engine-e-cislunar-arc-recovery-error-bound-km-must-be = error_bound_km musí být konečné a kladné, zadáno: { $error_bound_km }

engine-e-cislunar-arc-recovery-sigma-range-must-be-finite = sigma_range_m musí být konečná a kladná, zadáno: { $sigma_range_m }

engine-e-cislunar-arc-recovery-sigma-range-rate-mm-must = sigma_range_rate_mm_s musí být konečná a kladná, zadáno: { $sigma_range_rate_mm_s }

engine-e-cislunar-arc-recovery-the-constellation-must-carry-at = konstelace musí obsahovat alespoň hlavní těleso (chief) a jednu referenci

engine-e-cislunar-arc-recovery-family-is-an-out-of = rodina `{ $family }` je mimorovinná rodina a nemá rovinnou čtyřstavovou reprezentaci: nastavte spatial = true pro její průchod

engine-e-cislunar-arc-recovery-the-forward-model-produced-non = přímý model vytvořil nekonečné nebo nečíselné referenční měření

engine-cislunar-arc-recovery-first-arc-length-at-which = první délka oblouku, při níž dávkové řešení bez šumu pro KAŽDÝ seedovaný pokus sníží chybu konečného stavu nejvýše na { $recovery_factor } násobek apriorního posunutí, z něhož vyšlo. Je to analogie kritéria hodnosti pro obnovu: s přesnými měřeními se otázka `is the state observable?` mění na `can an estimator get it back?` a do odpovědi nevstupuje žádná tolerance singulárních hodnot.

engine-cislunar-arc-recovery-first-arc-length-at-which-2 = první délka oblouku, při níž RMS chyba obnovy polohy metodou Monte Carlo přes seedované realizace šumu ({ $trials }) klesne na { $error_bound_km } km nebo pod. Je to analogie kritéria odhadnutelnosti, měřená, nikoli predikovaná: chyba je vzdálenost odhadu od známé reference, nikoli stopa formální kovariance.

engine-cislunar-arc-recovery-corroborated-within-one-epoch-grid = CORROBORATED v rámci jednoho kroku mřížky epoch: estimátor obnovuje od { $e } h, kritérium hodnosti Gramiánu se láme při { $g } h (poměr { $v1 }, mřížka { $grid_hours } h).

engine-cislunar-arc-recovery-not-corroborated-as-recoverability-boundary = NOT CORROBORATED jako hranice obnovitelnosti: estimátor obnovuje od { $e } h, { $v1 } kritérium hodnosti Gramiánu { $g } h (poměr { $v2 }, mřížka { $grid_hours } h). Kritérium hodnosti je relativní konvence singulárních hodnot; hranice obnovy je změřená chyba stavu a obě se zde neshodují.

engine-cislunar-arc-recovery-not-corroborated-the-estimator-never = NOT CORROBORATED: estimátor na tomto oblouku nikdy nesplní svou mez obnovy, zatímco kritérium hodnosti Gramiánu se láme při { $g } h.

engine-cislunar-arc-recovery-the-gramian-rank-criterion-is = kritérium hodnosti Gramiánu není na tomto oblouku nikdy splněno (geometrie nikdy nedosáhne plné hodnosti), zatímco estimátor obnovuje od { $e } h — oba se rozcházejí v tom, zda hranice vůbec existuje.

engine-cislunar-arc-recovery-cislunar-arc-recovery-family-state = cislunar-arc-recovery | rodina { $family }, { $state_dim } stavů, { $n_spacecraft } s/c, pozorovatelná { $observable }, parametrizace { $coordinates } | oblouk { $arc_hours } h, { $epochs } epoch (mřížka { $grid_hours } h), pokusy: { $trials }, seed { $seed } | parciální derivace konečnými diferencemi, bez analytického Jacobiánu / STM / SVD / SRIF | obnova bez šumu od { $nf } (faktor { $recovery_factor }) vs práh hodnosti Gramiánu { $gram } | odhadnutelnost metodou Monte Carlo od { $est } (RMS pol. ≤ { $error_bound_km } km, σ { $sigma_range_m } m) vs odhadnutelnost Gramiánu { $gram_est } | RMS pol. na konci oblouku { $last } km

## src/cislunar_observability.rs

engine-e-cislunar-observability-unknown-family-expected-one-of = neznámá rodina `{ $other }`: očekává se jedna z dro, halo, nrho

engine-e-cislunar-observability-dro-at-crossing-distance-did = DRO ve vzdálenosti křížení { $d } nebylo diferenciálně korigováno

engine-e-cislunar-observability-member-at-x0-did-not = člen { $i } ({ $label }) při x0 = { $x0 } nebyl diferenciálně korigován

engine-e-cislunar-observability-spacecraft-must-be-between-and = n_spacecraft musí být mezi 2 a { $MAX_SPACECRAFT }, zadáno: { $n }

engine-e-cislunar-observability-epochs-must-be-got = epochs musí být ≥ 2, zadáno: { $n_epochs }

engine-e-cislunar-observability-rel-tol-must-be-finite = rel_tol musí být konečné a kladné, zadáno: { $rel_tol }

engine-e-cislunar-observability-sigma-range-must-be-finite = sigma_range_m musí být konečná a nezáporná, zadáno: { $sigma_range_m }

engine-e-cislunar-observability-sigma-pos-threshold-km-must = sigma_pos_threshold_km musí být konečné a kladné, zadáno: { $sigma_pos_threshold_km }

engine-cislunar-observability-never-rank-of = nikdy (hodnost { $rank } z { $state_dim })

engine-cislunar-observability-family-state-range-rank-threshold = { $base } | rodina { $family }, { $state_dim } stavů, { $n_spacecraft } s/c, σ_range { $sigma_range_m } m | práh hodnosti { $rank_thr } (mřížka { $c } h) | práh odhadnutelnosti (σ_pos ≤ { $sigma_pos_threshold_km } km) { $est_thr }

engine-cislunar-observability-first-arc-length-at-which = první délka oblouku, při níž formální nejistota polohy 1σ POČÁTEČNÍHO stavu hlavního tělesa (chief), σ_pos = sqrt(trace(P_rr)) s P = (ÕᵀÕ)⁻¹ a Õ maticí pozorovatelnosti vybělenou šumem měření, klesne na { $sigma_pos_threshold_km } km nebo pod. Je to kritérium, při kterém je práh délky oblouku vůbec závislý na šumu: P roste s σ², takže σ_pos roste s σ, zatímco kritérium hodnosti výše se se σ nemění. Mez je UVEDENÁ inženýrská volba, nikoli fitovaná — estimability_sweep uvádí práh při čtyřech dalších mezích.

engine-cislunar-observability-validated-each-constellation-initial-condition = Ověřeno: každá počáteční podmínka konstelace je diferenciálně korigovaná periodická dráha rodiny { $family }, uzavírající se za jednu periodu na uvedené reziduum periodicity (rovinné DRO jsou navíc retrográdní kolem Měsíce). Rodina je korigována při poměru hmotností Země–Měsíc. Modelováno: volba parametrů a fází rodiny (návrh konstelace). Název klíče `dro_provenance` je zachován kvůli schématu vydaného dokumentu; nese libovolnou rodinu, o kterou tento běh požádal.

## src/clock_integrity.rs

engine-e-clock-integrity-integrity-must-be-finite-and = integrity: { $n } musí být konečné a kladné, zadáno: { $v }

engine-e-clock-integrity-integrity-must-lie-in-got = integrity: { $n } musí ležet v (0, 1), zadáno: { $v }

engine-e-clock-integrity-integrity-mask-deg-must-lie = integrity: mask_deg musí ležet v [0, 90)

engine-e-clock-integrity-integrity-systems-must-name-at = integrity: systems musí uvádět alespoň jednu předvolbu

engine-e-clock-integrity-integrity-injected-bias-needs-finite = integrity: injected_bias vyžaduje konečné bias_m, t0_s a t1_s

## src/clock_library/card.rs

engine-e-clock-library-card-no-records = { $name }: žádné záznamy

engine-e-clock-library-card-records-at-different-tau0 = { $name }: záznamy s různým tau0

engine-e-clock-library-card-periodic-least-squares-failed = { $name }: periodické metody nejmenších čtverců selhaly

engine-e-clock-library-card-stability-points-with-edf-card = { $name }: body stability s edf >= { $MIN_FIT_EDF }: { $used }; karta vyžaduje tři

## src/clock_library/condition.rs

engine-clock-library-condition-gaps-phase-outliers-phase-steps = mezery { $g }, odlehlé hodnoty fáze { $o }, skoky fáze { $p }, shluky { $b }, skoky frekvence { $f } (robustní sigma_y { $sigma_y })

## src/compliance/mod.rs

engine-e-compliance-is-not-non-negative-integer = `{ $p }` není nezáporné celé číslo

engine-e-compliance-is-missing = `{ $p }` chybí

engine-compliance-events-detected-exceeds-events-evaluable = events_detected { $ed } překračuje events_evaluable { $ee }

engine-compliance-predictions-agreeing-exceeds-predictions-evaluable = predictions_agreeing { $pa } překračuje predictions_evaluable { $pe }

engine-compliance-receiver-trust-counts-malformed-excluded = { $label }: počty receiver-trust jsou chybně utvořené ({ $malformed_counts }); vyloučeno

engine-e-compliance-not-json = { $label }: není JSON: { $e }

engine-compliance-cannot-read = { $label }: nelze přečíst: { $e }

engine-e-compliance-the-sibling-scenario-says-kind = { $label }: sousední scénář uvádí druh `{ $s }`, ale výsledek uvádí `{ $o }`; nepoužito

engine-e-compliance-scenario-kind-not-found-no = { $label }: druh scénáře nenalezen (žádný sousední soubor scénáře, není výsledkem receiver-trust, žádné `kind` nejvyšší úrovně)

engine-e-compliance-is-not-scenario-kind-the = { $label }: `{ $kind }` není druh scénáře, který engine zná; nepoužito

engine-compliance-written-by-kshana = Vytvořil kshana { $engine_version }.{ "\u000A\u000A" }

engine-compliance-test-with-every-stated-bar =
    ### { $cell } ({ $cell2 })

    Testy: s každým uvedeným prahem splněným { $met }, s nesplněným prahem { $not_met }, vyžadující vstup { $needs_input }.{ "\u000A\u000A" }

## src/conflict_resilience.rs

engine-e-conflict-resilience-intensity-grid-must-have-finite = mřížka intenzity musí mít konečné min < max, zadáno: [{ $min }, { $max }]

engine-e-conflict-resilience-intensity-grid-needs-steps-got = mřížka intenzity vyžaduje >= 2 kroky, zadáno: { $steps }

engine-e-conflict-resilience-correlation-grid-must-have-at = mřížka korelace musí mít alespoň jednu hodnotu

engine-e-conflict-resilience-correlation-values-must-lie-in = hodnoty korelace musí ležet v [0, 1], zadáno: { $r }

engine-e-conflict-resilience-conflict-resilience-needs-at-least = conflict-resilience vyžaduje alespoň jednu vrstvu

engine-e-conflict-resilience-layer-availability-not-in = vrstva { $i }: dostupnost { $availability } není v [0, 1]

engine-e-conflict-resilience-layer-sigma-must-be-finite = vrstva { $i }: sigma_m musí být konečná a kladná

engine-e-conflict-resilience-layer-vulnerability-must-be-finite = vrstva { $i }: vulnerability musí být konečné a >= 0

engine-e-conflict-resilience-layer-vector-weight-must-be = vrstva { $i }: vector_weight musí být konečné a >= 0

engine-e-conflict-resilience-primary-layer-out-of-range = primary_layer { $primary } mimo rozsah (0..{ $layers })

engine-e-conflict-resilience-trials-must-be = trials musí být >= 1

engine-conflict-resilience-conflict-resilience-layers-baseline-reference = conflict-resilience | vrstvy: { $layers } (základ: { $primary }) | referenční intenzita { $reference_intensity } | poměr odolnosti v uzavřeném tvaru { $ratio_closed_form }x MC { $ratio_mc_independent }x (vrstvené vs jednovrstvé) | korelace maří vrstvení: poměr { $first }x @ rho { $first2 } -> { $last }x @ rho { $last2 } | apriorní CI [{ $ratio_lo }-{ $ratio_hi }]x | přežití podle vektoru @ ref. rušení { $surv }% spoofing { $surv2 }% kinetický { $surv3 }% kybernetický { $surv4 }% (nejostřejší: { $sharpest }) | hlavní číslo ~7x MODELLED, VALIDATED MC->uzavřený tvar / fuse-identity / copula-marginals / per-vector-survival

## src/constellation.rs

engine-e-constellation-unknown-central-body-expected-planet = neznámé centrální těleso { $name }: očekává se planeta, Pluto, Měsíc nebo velký měsíc (earth, moon, mars, europa, titan, ...; viz crate::body::SOLAR_SYSTEM)

engine-e-constellation-walker-shell-needs-total-and = slupka Walker vyžaduje total > 0 a planes > 0

engine-e-constellation-walker-total-is-not-multiple = Walker total { $total } není násobkem planes { $planes }

engine-e-constellation-walker-phasing-must-lie-in = fázování Walker F = { $phasing } musí ležet v 0..planes (= { $planes })

engine-e-constellation-is-not-an-expandable-gps = { $name } není rozšiřitelný slot GPS (SPS PS Table 3.2-2 uvádí B1, D2, F2, A2, C4, E3)

engine-e-constellation-give-altitude-km-or-semi = { $what }: zadejte altitude_km nebo semi_major_axis_km, ne obojí

engine-e-constellation-needs-altitude-km-or-semi = { $what }: vyžaduje altitude_km nebo semi_major_axis_km

engine-e-constellation-semi-major-axis-km-is = { $what }: hlavní poloosa { $v1 } km není nad poloměrem { $name }

engine-e-constellation-eccentricity-must-lie-in = { $what }: excentricita { $e } musí ležet v [0, 0.9)

engine-e-constellation-perigee-is-below-the-surface = { $what }: perigeum je pod povrchem { $name }

engine-e-constellation-constellation-preset-is-an-earth = konstelace { $name }: předvolba { $p } je pozemská konstelace, těleso je { $name2 }

engine-e-constellation-constellation-unknown-preset-expected-gps = konstelace { $name }: neznámá předvolba { $other } (očekává se gps-baseline, gps-expandable, galileo, beidou, beidou-meo nebo glonass)

engine-e-constellation-constellation-expanded-applies-only-to = konstelace { $name }: `expanded` platí pouze pro předvolbu gps-expandable

engine-constellation-constellation-shell = konstelace { $name }, slupka { $v2 }

engine-constellation-explicit-element-sets = explicitní sady prvků: { $satellite }

engine-constellation-constellation-satellite = konstelace { $name }, družice { $v2 }

engine-e-constellation-constellation-has-no-satellites-give = konstelace { $name } nemá žádné družice: zadejte předvolbu, [[constellation.shell]] nebo [[constellation.satellite]]

engine-e-constellation-no-constellation-given = nebyla zadána žádná konstelace

## src/constellation.rs

engine-e-constellation-constellations-with-one-clock-each = konstelace s jedněmi hodinami každá ({ $constellations }) překračují limit { $MAX_CLOCKS } hodin; použijte clock = "common" nebo konstelace sloučte

engine-e-constellation-must-be-finite = { $what } musí být konečné

engine-e-constellation-need-step-and-duration-step = vyžaduje step_s > 0 a duration_s >= step_s

engine-e-constellation-more-than-100-000-epochs = více než 100 000 epoch; zvyšte step_s

engine-e-constellation-mask-deg-must-lie-in = mask_deg musí ležet v [0, 90)

engine-e-constellation-pdop-threshold-must-be-positive = pdop_threshold musí být kladné

engine-e-constellation-grid-step-deg-must-lie = grid_step_deg musí ležet v [0.25, 90]

engine-e-constellation-need-90-lat-min-deg = vyžaduje -90 <= lat_min_deg < lat_max_deg <= 90

engine-e-constellation-need-lon-min-deg-lon = vyžaduje lon_min_deg < lon_max_deg s rozpětím nejvýše 360 deg

engine-e-constellation-give-at-least-one-constellation = zadejte alespoň jednu [[constellation]]

engine-e-constellation-track-points-is-capped-at = track_points je omezeno na 2000

engine-e-constellation-satellites-exceeds-the-50-000 = počet družic ({ $total }) překračuje limit 50 000

engine-constellation-constellation-design-satellites-around-the = constellation-design: družice: { $total } ({ $names }) kolem { $name }; dostupnost { $global_availability_pct }% (PDOP <= { $pdop_threshold } při masce { $mask_deg } deg), nejhorší lokalita { $worst_site_availability_pct }%, medián PDOP { $cov }, průměrně v dohledu { $global_mean_visible }; body mřížky: { $grid_points } x { $epochs } epoch (MODELLED)

engine-constellation-constellation-coverage-over-the = Pokrytí konstelací: { $name }

## src/contact_schedule.rs

engine-e-contact-schedule-link-must-be-finite-and = link.{ $n } musí být konečné a kladné

engine-e-contact-schedule-link-must-be-finite-and-2 = link.{ $n } musí být konečné a >= 0

engine-e-contact-schedule-link-eirp-dbw-must-be = link.eirp_dbw musí být konečné

engine-e-contact-schedule-satellite-altitude-km-must-be = družice '{ $name }': altitude_km musí být v (100, 40000)

engine-e-contact-schedule-satellite-inclination-deg-must-be = družice '{ $name }': inclination_deg musí být v [0, 180]

engine-e-contact-schedule-satellite-backlog-mbit-must-be = družice '{ $name }': backlog_mbit musí být >= 0

engine-e-contact-schedule-satellite-priority-must-be = družice '{ $name }': priority musí být > 0

engine-e-contact-schedule-satellite-eirp-dbw-must-be = družice '{ $name }': eirp_dbw musí být konečné

engine-e-contact-schedule-station-lat-deg-in-90 = stanice '{ $name }': lat_deg v [-90, 90], lon_deg konečné

engine-e-contact-schedule-station-mask-deg-must-be = stanice '{ $name }': mask_deg musí být v [0, 90)

engine-e-contact-schedule-station-alt-must-be-in = stanice '{ $name }': alt_m musí být v [0, 3000] (rozsah ITU-R P.834)

engine-e-contact-schedule-station-setup-and-over-db = stanice '{ $name }': setup_s >= 0 a g_over_t_db konečné

engine-e-contact-schedule-duration-hours-must-be-in = duration_hours musí být v (0, 168]

engine-e-contact-schedule-step-must-be-in-300 = step_s musí být v (0, 300]

engine-e-contact-schedule-at-least-one-satellite-and = je vyžadována alespoň jedna družice a jedna stanice

engine-e-contact-schedule-at-most-32-satellites-and = nejvýše 32 družic a 32 stanic

engine-contact-schedule-contact-schedule-satellites-stations-over = contact-schedule: družice: { $satellites } x stanice: { $stations } za { $duration_hours } h -> kandidátní kontakty: { $cands }, naplánováno: { $greedy }; doručeno { $total_del } z { $total_backlog } Mbit{ $v8 } (MODELLED)

engine-contact-schedule-acm-link-pass-es-acm = acm-link: průlety: { $pairs }; ACM { $acm } Mbit vs CCM { $ccm } { $ccm_v } Mbit{ $v5 } (MODELLED)

## src/dop_error_ci.rs

engine-e-dop-error-ci-need-at-least-trials-and = vyžaduje alespoň 2 pokusy a konečné sigma_m > 0

engine-e-dop-error-ci-alpha-total-must-be-in = alpha_total musí být v (0, 1)

engine-e-dop-error-ci-no-local-frame-at-the = žádný lokální souřadnicový systém u uživatele

engine-e-dop-error-ci-singular-geometry = { $name }: singulární geometrie

engine-e-dop-error-ci-no-noise-free-fix = { $name }: žádné řešení polohy bez šumu

engine-e-dop-error-ci-no-fix = { $name }: žádné řešení polohy

## src/dop_error_mc.rs

engine-e-dop-error-mc-singular-geometry = { $label }: singulární geometrie

engine-e-dop-error-mc-no-fix = { $label }: žádné řešení polohy

## src/earth_gnss_lunar.rs

engine-e-earth-gnss-lunar-altitude-km-must-be-positive = altitude_km musí být kladné; zadáno { $altitude_km }

engine-e-earth-gnss-lunar-planes-and-sats-per-plane = planes a sats_per_plane musí být obě nenulové

engine-e-earth-gnss-lunar-freq-hz-must-be-positive = freq_hz musí být kladné; zadáno { $freq_hz }

engine-e-earth-gnss-lunar-tx-efficiency-must-be-in = tx_efficiency musí být v (0, 1]; zadáno { $tx_efficiency }

engine-e-earth-gnss-lunar-system-temp-must-be-positive = system_temp_k musí být kladné; zadáno { $temp_k }

engine-e-earth-gnss-lunar-back-lobe-suppression-db-must = back_lobe_suppression_db musí být nezáporné; zadáno { $back_lobe_suppression_db }

engine-e-earth-gnss-lunar-receiver-range-must-be-outside = receiver_range_m musí ležet vně Země; zadáno { $range_m }

engine-earth-gnss-lunar-earth-limb-from-the-constellation = { "  " }Limb Země z konstelace: { $earth_limb_half_angle_deg } deg od nadiru — každý paprsek směřující k Měsíci tuto hodnotu musí překročit{ "\u000A" }

engine-earth-gnss-lunar-of-not-occulted-clear-the = { "  " }nezakryto: { $n_geometrically_visible } z { $n_satellites }; práh sledování { $tracking_threshold_dbhz } dB-Hz překonává { $n_trackable }{ "\u000A" }

engine-earth-gnss-lunar-best-link-db-hz = { "  " }nejlepší spoj { $c } dB-Hz{ "\u000A" }

engine-earth-gnss-lunar-every-trackable-line-of-sight = { "  " }každá sledovatelná přímka viditelnosti leží uvnitř polovičního kužele { $a } deg — geometrie je téměř degenerovaná{ "\u000A" }

engine-earth-gnss-lunar-gdop-pdop-hdop-vdop-tdop = { "  " }GDOP { $gdop }  PDOP { $pdop }  HDOP { $hdop }  VDOP { $vdop }  TDOP { $tdop }{ "\u000A" }

engine-earth-gnss-lunar-sweep-over-epochs-signal-availability = { "  " }PRŮCHOD přes { $epochs } epoch / { $span_s } s: dostupnost signálu { $signal_availability }, dostupnost FIX { $fix_availability }{ "\u000A" }

engine-earth-gnss-lunar-trackable-links-mean-max-best = { "    " }sledovatelné spoje: průměr { $mean_trackable }, max { $max_trackable }; nejlepší C/N0 { $w }; nejlepší PDOP { $w2 }{ "\u000A" }

## src/entry_eo_ascent/ascent.rs

engine-e-entry-eo-ascent-ascent-between-one-and-six-stages = je vyžadováno jeden až šest stupňů

engine-e-entry-eo-ascent-ascent-stages-dry-mass-kg-must = stages[{ $i }].dry_mass_kg musí být konečné a nezáporné

engine-e-entry-eo-ascent-ascent-stages-exit-area-m2-must = stages[{ $i }].exit_area_m2 musí být konečné a nezáporné

engine-e-entry-eo-ascent-ascent-payload-kg-must-be-finite = payload_kg musí být konečné a nezáporné

engine-e-entry-eo-ascent-ascent-kick-altitude-must-be-finite = kick_altitude_m musí být konečné a nezáporné

engine-e-entry-eo-ascent-ascent-kick-angle-deg-must-be = kick_angle_deg musí být v [0, 45)

engine-e-entry-eo-ascent-ascent-kick-duration-must-be-finite = kick_duration_s musí být konečné a nezáporné

engine-e-entry-eo-ascent-ascent-lift-off-thrust-to-weight = poměr tahu k tíze při startu { $tw } musí překročit 1

engine-entry-eo-ascent-ascent-ascent-losses-ideal-dv-losses = ascent-losses: ideální dv { $ideal_dv_m_s } m/s, ztráty { $losses } m/s (gravitační { $gravity_loss_m_s }, odporové { $drag_loss_m_s }, řízení { $steering_loss_m_s }, protitlakové { $back_pressure_loss_m_s }); vyhoření { $r } km při { $end_speed_m_s } m/s, gamma { $r2 } deg; max-Q { $r3 } kPa (MODELLED)

## src/entry_eo_ascent/entry_heating.rs

engine-e-entry-eo-ascent-entry-heating-must-be-finite-and-positive = { $name } musí být konečné a kladné

engine-e-entry-eo-ascent-entry-heating-body-must-be-earth-or = body musí být "earth" nebo "mars", zadáno "{ $other }"

engine-e-entry-eo-ascent-entry-heating-atmosphere-is-not-available-for = atmosféra "{ $a }" není pro těleso "{ $b }" dostupná (earth: us76|exponential, mars: mars|exponential)

engine-e-entry-eo-ascent-entry-heating-flight-path-angle-deg-must = flight_path_angle_deg musí být v (0, 90) (kladný směrem dolů)

engine-e-entry-eo-ascent-entry-heating-entry-interface-altitude-must-be = entry_interface_altitude_m musí být v [20 km, 1000 km]

engine-e-entry-eo-ascent-entry-heating-latitude-deg-must-be-finite = latitude_deg musí být konečné s |latitude| < 89 deg

engine-e-entry-eo-ascent-entry-heating-heading-deg-and-longitude-deg = heading_deg a longitude_deg musí být konečné

engine-e-entry-eo-ascent-entry-heating-lift-to-drag-must-be = lift_to_drag musí být v [0, 3]

engine-e-entry-eo-ascent-entry-heating-bank-angle-deg-must-be = bank_angle_deg musí být konečné

engine-e-entry-eo-ascent-entry-heating-step-must-be-in = step_s musí být v (0, 1] s

engine-e-entry-eo-ascent-entry-heating-terminal-altitude-must-be-in = terminal_altitude_m musí být v [0, entry_interface_altitude_m)

engine-e-entry-eo-ascent-entry-heating-max-time-must-be-in = max_time_s musí být v (0, 20000] s

engine-e-entry-eo-ascent-entry-heating-velocity-frame-must-be-inertial = velocity_frame musí být inertial|relative, zadáno "{ $o }"

engine-entry-eo-ascent-entry-heating-entry-heating-rel-peak-at = entry-heating ({ $body }): V_rel { $speed_m_s } m/s, γ { $gam_abs }° -> špička { $pk_g } g ve { $r } km, špičkové q { $r2 } W/cm² ve { $r3 } km, tepelná zátěž { $r4 } J/cm², špičkové q_dyn { $r5 } kPa; { $outcome } v { $end_time_s } s (uzavřený tvar { $cf_g } g; MODELLED 3-DoF, bez radiace/TPS)

## src/entry_eo_ascent/eo_radiometry.rs

engine-e-entry-eo-ascent-eo-radiometry-must-be-in = { $n } musí být v (0, 1]

engine-e-entry-eo-ascent-eo-radiometry-must-be-finite-and-non = { $n } musí být konečné a nezáporné

engine-e-entry-eo-ascent-eo-radiometry-sun-zenith-deg-must-be = sun_zenith_deg musí být v [0, 90)

engine-e-entry-eo-ascent-eo-radiometry-adc-bits-must-be-in = adc_bits musí být v 1..=24

engine-entry-eo-ascent-eo-radiometry-eo-radiometry-gsd-snr-well = eo-radiometry: GSD { $gsd } m, Q { $im }, SNR { $snr } (zaplnění studny { $v4 } %), MTF@Nyquist { $fac }, RER { $rer }, GIQE4 NIIRS { $niirs } (MODELLED)

## src/eo_payload.rs

engine-e-eo-payload-nadir-angle-exceeds-the-earth = úhel od nadiru { $eta_rad }° překračuje úhlový poloměr Země { $rho }° (míjí Zemi)

engine-e-eo-payload-no-sun-synchronous-inclination-at = žádná heliosynchronní inklinace při { $v1 } km

engine-e-eo-payload-half-fov-deg-must-be = half_fov_deg musí být v (0, 90)

engine-e-eo-payload-ifov-microrad-must-be-finite = ifov_microrad musí být konečné a kladné

engine-e-eo-payload-half-fov-too-large = half_fov je příliš velké: { $e }

engine-eo-payload-eo-coverage-km-fov-km = eo-coverage: { $altitude_km } km, ±{ $half_fov_deg }° FOV -> pás { $v3 } km, { $gsd } m GSD v nadiru, dosah { $v5 } km mimo nadir; rozestup uzlů { $v6 } km ({ $v7 }) (MODELLED)

## src/ephem_provider.rs

engine-ephem-provider-earth-moon-barycentre-from-split = barycentrum Země–Měsíc z { $table }, rozdělené měsíční řadou Montenbruck & Gill s precesí k J2000

engine-ephem-provider-jpl-mean-elements-in-the = střední elementy JPL v Laplaceově rovině, rychlost střední délky z IAU synchronní rychlosti rotace, přičtené k jeho planetě z { $table }

engine-ephem-provider-iau-synchronous-rotation-direction-at = směr synchronní rotace podle IAU při střední vzdálenosti JPL, přičtený k Saturnu z { $table }

engine-e-ephem-provider-read = čtení { $path }: { $e }

## src/ephemeris.rs

engine-e-ephemeris-tle-is-missing-line-line = TLE postrádá řádek 1 (řádek začínající `1 `)

engine-e-ephemeris-tle-is-missing-line-line-2 = TLE postrádá řádek 2 (řádek začínající `2 `)

engine-e-ephemeris-an-analytic-orbit-ephemeris-requires = analytické efemeridy `orbit` vyžadují `epoch`

engine-e-ephemeris-ephemeris-scenario-needs-either-tle = scénář efemerid vyžaduje buď `tle`, nebo `orbit`

engine-e-ephemeris-step-must-be-positive = step_s musí být kladné

engine-e-ephemeris-duration-must-be-non-negative = duration_s musí být nezáporné

engine-e-ephemeris-carrier-hz-must-be-positive = carrier_hz musí být kladná konečná frekvence

## src/evidence/assemble.rs

engine-e-evidence-assemble-is-not-finite = `{ $arg }` není konečné

engine-e-evidence-assemble-is-neither-seconds-nor-an = `{ $arg }` není ani sekundy, ani čas UTC ve formátu ISO-8601

engine-e-evidence-assemble-no-epoch-of-the-log = žádná epocha záznamu nespadá mezi { $t0 } s a { $t1 } s (záznam pokrývá 0 až { $duration_s } s)

engine-e-evidence-assemble-config-is-not-an-object = config není objekt

engine-e-evidence-assemble-config-json-already-has-an = config.json již obsahuje položku `{ $k }`

## src/evidence/bundle.rs

engine-e-evidence-bundle-from-to = od { $from_s } do { $to_s }

engine-e-evidence-bundle-is-not-utc-time-like = `{ $c }` není čas UTC ve tvaru 2026-01-02T03:04:05Z

engine-e-evidence-bundle-in-log-of-bytes = { $s }..{ $e } v záznamu o velikosti { $log_bytes } bytes

## src/evidence/cli.rs

engine-e-evidence-cli-needs-value = { $name } vyžaduje hodnotu

engine-e-evidence-cli-cannot-create = { $path } nelze vytvořit: { $e }

engine-e-evidence-cli-cannot-write = do { $path } nelze zapsat: { $e }

engine-evidence-cli-warning-is-readable-by-other = varování: { $path } je čitelný pro ostatní uživatele; omezte přístup (chmod 600)

engine-e-evidence-cli-cannot-read-key = klíč { $path } nelze přečíst: { $e }

engine-e-evidence-cli-is-not-hex-key = { $path } není hexadecimální klíč

engine-e-evidence-cli-must-hold-32-byte-key = { $path } musí obsahovat 32bajtový klíč jako 64 hexadecimálních číslic

engine-e-evidence-cli-cannot-read = { $dir } nelze přečíst: { $e }

engine-e-evidence-cli-cannot-read-2 = { $name } nelze přečíst: { $e }

engine-e-evidence-cli-exists-and-is-not-empty = { $dir } existuje a není prázdný

engine-e-evidence-cli-cannot-create-2 = { $dir } nelze vytvořit: { $e }

engine-evidence-cli-warning-is-owner-only-mode = varování: { $arg } je přístupný pouze vlastníkovi (režim 600) a nenese název *.pub: může jít o soukromý klíč. Předejte soubor veřejného klíče.

engine-e-evidence-cli-pubkey-is-neither-64-hex = --pubkey `{ $arg }` není ani 64 hexadecimálních číslic, ani čitelný soubor ({ $e })

engine-e-evidence-cli-pubkey-does-not-hold-hex = --pubkey `{ $arg }` neobsahuje hexadecimální číslice

engine-evidence-cli-private-key-keep-it-secret = soukromý klíč: { $out }  (udržujte jej v tajnosti; nikdy jej nezařazujte do repozitáře)

engine-evidence-cli-public-key-pub = veřejný klíč:  { $out }.pub

engine-evidence-cli-public-key-hex = veřejný klíč (hex): { $pk }

engine-evidence-cli-give-verifiers-the-public-key = Veřejný klíč předejte ověřovatelům cestou, které důvěřují; ti jej připnou pomocí --pubkey.

engine-e-evidence-cli-verify-needs-bundle-directory = verify vyžaduje adresář balíčku

engine-e-evidence-cli-cannot-read-3 = { $p } nelze přečíst: { $e }

engine-e-evidence-cli-no-pem-certificate-found = { $p }: nenalezen žádný certifikát PEM

engine-evidence-cli-timestamp-authority-signature-not-verified = { "      " }podpis autority časových razítek Kshana neověřila

engine-evidence-cli-this-is-technical-record-not = Jde o technický záznam, nikoli o právní stanovisko.

engine-e-evidence-cli-attach-timestamp-needs-bundle-directory = attach-timestamp vyžaduje adresář balíčku

engine-e-evidence-cli-attach-timestamp-needs-token-file = attach-timestamp vyžaduje soubor tokenu

engine-e-evidence-cli-cannot-read-4 = { $tok } nelze přečíst: { $e }

engine-e-evidence-cli-cannot-write-2 = do { $target } nelze zapsat: { $e }

engine-evidence-cli-note-the-token-sits-beside = poznámka: token leží vedle podepsaného manifestu, nikoli v něm; použijte --require-timestamp, pokud jej chcete vyžadovat.

engine-e-evidence-cli-round-trip-packs-are-not = balíčky round-trip se pro WebAssembly nesestavují

engine-e-evidence-cli-needs-scenario-path = vyžaduje cestu ke scénáři

engine-e-evidence-cli-needs-from = vyžaduje --from

engine-e-evidence-cli-needs-to = vyžaduje --to

engine-e-evidence-cli-cannot-read-lab-attestation = laboratorní atestaci { $p } nelze přečíst: { $e }

engine-e-evidence-cli-cannot-read-5 = { $scn_path } nelze přečíst: { $e }

engine-e-evidence-cli-invalid-receiver-trust-scenario = neplatný scénář receiver-trust: { $e }

engine-e-evidence-cli-lab-attestation-applies-to-receiver = --lab-attestation platí pro `receiver-trust evidence`, nikoli pro `evidence round-trip` (jehož balíček zaznamenává podmínky testu)

engine-e-evidence-cli-cannot-read-6 = { $sp } nelze přečíst: { $e }

engine-e-evidence-cli-cannot-read-7 = { $cp } nelze přečíst: { $e }

engine-evidence-cli-evidence-pack-written-to = balíček důkazů zapsán do { $out }

engine-evidence-cli-epochs-in-window-to = { "  " }epochy v okně: { $epochs_in_window }  ({ $from_s } s až { $to_s } s)

engine-evidence-cli-signer-fingerprint = { "  " }otisk podepisujícího: { $signer_fingerprint }

engine-evidence-cli-sha-256-of-manifest-json = { "  " }SHA-256 souboru manifest.json (to, co má autorita RFC 3161 orazítkovat): { $manifest_sha256 }

engine-evidence-cli-log-slice-bytes-to-of = { "  " }výřez záznamu: bytes { $a } až { $b } z { $log_bytes }

engine-evidence-cli-log-slice-whole-log-this = { "  " }výřez záznamu: celý záznam (tento záznam pro okno neposkytuje rozsah bajtů)

engine-evidence-cli-lab-attestation-recorded-in-the = { "  " }laboratorní atestace zaznamenána v podepsaném manifestu ({ $v1 })

engine-evidence-cli-pack-is-technical-record-not = Balíček je technický záznam, nikoli právní stanovisko.

## src/evidence/html.rs

engine-evidence-html-to-after-the-first-epoch = od { $from_s } s do { $to_s } s po první epoše záznamu

## src/evidence/lab.rs

engine-e-evidence-lab-invalid-lab-attestation-toml = neplatný TOML laboratorní atestace: { $e }

engine-e-evidence-lab-lab-attestation-must-be-table = `lab-attestation` musí být tabulka

engine-e-evidence-lab-invalid-lab-attestation = neplatná laboratorní atestace: { $e }

engine-e-evidence-lab-lab-attestation-is-required = lab-attestation: { $name } je povinné

engine-e-evidence-lab-lab-attestation-is-over-bytes = lab-attestation: { $name } přesahuje { $MAX_FIELD } bajtů

engine-e-evidence-lab-lab-attestation-date-is-not = lab-attestation: datum { $date } není den ve tvaru 2026-11-02

engine-e-evidence-lab-lab-attestation-shielded-setup-needs = lab-attestation: stíněné uspořádání vyžaduje enclosure

engine-e-evidence-lab-lab-attestation-setup-must-be = lab-attestation: setup musí být "conducted" nebo "shielded" (zadáno { $other }); uspořádání přes vzduch se jako laboratorní běh nepřijímá

engine-e-evidence-lab-lab-attestation-attenuation-db-must = lab-attestation: attenuation_db musí být konečné

## src/evidence/roundtrip.rs

engine-e-evidence-roundtrip-the-test-conditions-state-event = podmínky testu uvádějí události: { $events }, ale hodnoticí scénář jich má { $events2 }

engine-e-evidence-roundtrip-event-in-the-test-conditions = událost '{ $id }' v podmínkách testu ({ $onset_s } s až { $offset_s } s) neodpovídá '{ $label }' v hodnoticím scénáři ({ $onset_s2 } s až { $end_s } s)

engine-e-evidence-roundtrip-the-log-sha-256-is = SHA-256 záznamu ({ $have }) není ten, který uvádějí podmínky testu ({ $h })

## src/evidence/tsa.rs

engine-e-evidence-tsa-truncated-der = zkrácené DER

engine-e-evidence-tsa-bad-der-length = chybná délka DER

engine-e-evidence-tsa-unexpected-der-tag = { $what }: neočekávaný tag DER { $tag }

engine-e-evidence-tsa-empty-algorithmidentifier = prázdný AlgorithmIdentifier

engine-e-evidence-tsa-bad-utctime = chybný UTCTime

engine-e-evidence-tsa-bad-generalizedtime = chybný GeneralizedTime

engine-e-evidence-tsa-bad-time = chybný čas

engine-e-evidence-tsa-time-not-in-utc = čas není v UTC

engine-e-evidence-tsa-bad-time-digits = chybné číslice času

engine-e-evidence-tsa-bad-bit-string = chybný BIT STRING

engine-e-evidence-tsa-certificate-three-elements-expected = Certificate: očekávány tři prvky

engine-e-evidence-tsa-tbscertificate-too-short = TBSCertificate: příliš krátký

engine-e-evidence-tsa-empty-extension = prázdné Extension

engine-e-evidence-tsa-extension-value-not-an-octet = Extension: hodnota není OCTET STRING

engine-e-evidence-tsa-validity-empty = Validity: prázdné

engine-e-evidence-tsa-validity-short = Validity: krátké

engine-e-evidence-tsa-pem-end-without-begin = PEM: END bez BEGIN

engine-e-evidence-tsa-pem-bad-base64 = PEM: chybný base64

engine-e-evidence-tsa-pem-bad-base64-length = PEM: chybná délka base64

engine-e-evidence-tsa-spki-empty = SPKI: prázdné

engine-e-evidence-tsa-spki-no-oid = SPKI: žádný OID

engine-e-evidence-tsa-spki-no-key = SPKI: žádný klíč

engine-e-evidence-tsa-rsapublickey-two-integers-expected = RSAPublicKey: očekována dvě celá čísla

engine-e-evidence-tsa-unsupported-elliptic-curve = nepodporovaná eliptická křivka

engine-e-evidence-tsa-unsupported-public-key-algorithm = nepodporovaný algoritmus veřejného klíče

engine-e-evidence-tsa-rsa-key-or-signature-too = klíč nebo podpis RSA je příliš velký

engine-e-evidence-tsa-rsa-modulus-not-odd = modulus RSA není lichý

engine-e-evidence-tsa-rsa-signature-out-of-range = podpis RSA mimo rozsah

engine-e-evidence-tsa-rsa-key-too-small = klíč RSA je příliš malý

engine-e-evidence-tsa-invalid-padding = neplatné doplnění (padding)

engine-e-evidence-tsa-pss-encoded-message-too-long = PSS: zakódovaná zpráva je příliš dlouhá

engine-e-evidence-tsa-last-octet-invalid = poslední oktet je neplatný

engine-e-evidence-tsa-pss-leftmost-bits-not-zero = PSS: nejlevější bity nejsou nulové

engine-e-evidence-tsa-pss-bad-padding = PSS: chybné doplnění (padding)

engine-e-evidence-tsa-pss-signature-mismatch = PSS: podpis se neshoduje

engine-e-evidence-tsa-unsupported-mask-generation-function = nepodporovaná funkce generování masky

engine-e-evidence-tsa-mgf1-without-hash = MGF1 bez hashe

engine-e-evidence-tsa-bad-pss-salt-length = chybná délka soli PSS

engine-e-evidence-tsa-an-ecdsa-signature-needs-an = podpis ECDSA vyžaduje klíč EC

engine-e-evidence-tsa-an-rsa-signature-needs-an = podpis RSA vyžaduje klíč RSA

engine-e-evidence-tsa-rsaencryption-without-digest-algorithm = rsaEncryption bez algoritmu digestu

engine-e-evidence-tsa-an-rsa-pss-signature-needs = podpis RSA-PSS vyžaduje klíč RSA

engine-e-evidence-tsa-id-ecpublickey-without-digest-algorithm = id-ecPublicKey bez algoritmu digestu

engine-e-evidence-tsa-unsupported-signature-algorithm = nepodporovaný algoritmus podpisu

engine-e-evidence-tsa-pkistatusinfo-empty = PKIStatusInfo: prázdné

engine-e-evidence-tsa-time-stamp-request-not-granted = žádost o časové razítko nebyla udělena

engine-e-evidence-tsa-no-time-stamp-token-in = v odpovědi není token časového razítka

engine-e-evidence-tsa-not-timestampresp-or-timestamptoken = není TimeStampResp ani TimeStampToken

engine-e-evidence-tsa-not-cms-signeddata = není CMS SignedData

engine-e-evidence-tsa-contentinfo-no-content = ContentInfo: žádný obsah

engine-e-evidence-tsa-signeddata-short = SignedData: krátké

engine-e-evidence-tsa-encapsulatedcontentinfo-empty = EncapsulatedContentInfo: prázdné

engine-e-evidence-tsa-encapsulated-content-is-not-tstinfo = zapouzdřený obsah není TSTInfo

engine-e-evidence-tsa-no-tstinfo = žádný TSTInfo

engine-e-evidence-tsa-tstinfo-not-in-an-octet = TSTInfo není v OCTET STRING

engine-e-evidence-tsa-tstinfo-short = TSTInfo: krátké

engine-e-evidence-tsa-tstinfo-no-gentime = TSTInfo: žádný genTime

engine-e-evidence-tsa-signeddata-no-signerinfos = SignedData: žádné signerInfos

engine-e-evidence-tsa-exactly-one-signerinfo-expected = očekáván právě jeden SignerInfo

engine-e-evidence-tsa-signerinfo-no-sid = SignerInfo: žádný sid

engine-e-evidence-tsa-signerinfo-no-digest-algorithm = SignerInfo: žádný algoritmus digestu

engine-e-evidence-tsa-signerinfo-short = SignerInfo: krátké

engine-e-evidence-tsa-signerinfo-no-signed-attributes = SignerInfo: žádné podepsané atributy

engine-e-evidence-tsa-signerinfo-no-signature-algorithm = SignerInfo: žádný algoritmus podpisu

engine-e-evidence-tsa-signerinfo-no-signature = SignerInfo: žádný podpis

engine-e-evidence-tsa-no-serial = žádné sériové číslo

engine-e-evidence-tsa-signer-certificate-not-found = certifikát podepisujícího nenalezen

engine-e-evidence-tsa-attribute-empty = Attribute: prázdné

engine-e-evidence-tsa-attribute-no-values = Attribute: žádné hodnoty

engine-e-evidence-tsa-attribute-no-value = Attribute: žádná hodnota

engine-e-evidence-tsa-content-type-attribute-mismatch = atribut content-type se neshoduje

engine-e-evidence-tsa-digest-failure = selhání digestu

engine-e-evidence-tsa-signature-not-an-octet-string = podpis není OCTET STRING

engine-e-evidence-tsa-ess-signing-certificate-attribute-missing = chybí atribut ess signing certificate

engine-e-evidence-tsa-signingcertificate-empty = SigningCertificate: prázdné

engine-e-evidence-tsa-ess-cert-id-not-found = ess cert id nenalezeno

engine-e-evidence-tsa-esscertidv2-no-hash = ESSCertIDv2: žádný hash

engine-e-evidence-tsa-unsuitable-certificate-purpose = nevhodný účel certifikátu

engine-e-evidence-tsa-certificate-is-not-yet-valid = certifikát ještě není platný

engine-e-evidence-tsa-certificate-has-expired = platnost certifikátu vypršela

engine-e-evidence-tsa-invalid-ca-certificate = neplatný certifikát CA

engine-e-evidence-tsa-certificate-chain-too-long = řetězec certifikátů je příliš dlouhý

engine-e-evidence-tsa-messageimprint-empty = MessageImprint: prázdné

engine-e-evidence-tsa-messageimprint-no-digest = MessageImprint: žádný digest

engine-e-evidence-tsa-message-imprint-mismatch = message imprint se neshoduje

## src/evidence/tsr.rs

engine-e-evidence-tsr-indefinite-length-ber-is-not = BER s neurčitou délkou není podporováno

engine-e-evidence-tsr-expected-tag-found = očekáváno { $what } (tag { $tag }), nalezeno { $t }

engine-e-evidence-tsr-malformed-pkistatusinfo = chybně utvořený PKIStatusInfo

engine-e-evidence-tsr-the-timestamp-response-was-not = odpověď s časovým razítkem nebyla udělena

engine-e-evidence-tsr-not-timestamp-token = není token časového razítka

engine-e-evidence-tsr-the-token-content-type-is = typ obsahu tokenu není CMS SignedData

engine-e-evidence-tsr-the-token-does-not-carry = token neobsahuje TSTInfo

## src/evidence/tsr.rs

engine-e-evidence-tsr-message-imprint-uses-an-unsupported = otisk zprávy používá nepodporovaný hašovací algoritmus

engine-e-evidence-tsr-the-imprint-is-bytes-not = otisk má { $digest } B, nikoli { $want_len } B, které dává { $hash_alg }

engine-e-evidence-tsr-gentime-is-not-utc = genTime není v UTC

engine-e-evidence-tsr-malformed-gentime = chybně utvořený genTime

engine-e-evidence-tsr-gentime-is-not-real-calendar = genTime není skutečný kalendářní čas

## src/evidence/verify.rs

engine-e-evidence-verify-not-lower-case-hex = nejde o hexadecimální zápis malými písmeny

engine-e-evidence-verify-expected-bytes-found = očekáváno bajtů: { $N }, nalezeno: { $v }

engine-e-evidence-verify-the-pack-already-has-timestamp = balíček již obsahuje token časového razítka; k jeho nahrazení použijte --replace

engine-e-evidence-verify-not-attached-the-pack-with = nepřipojeno: balíček s tímto tokenem neprojde ověřením ({ $v1 })

engine-evidence-verify-the-pack-records-lab-attestation = balíček eviduje laboratorní atestaci: { $operator } ({ $organisation }, { $setup }): { $v4 }

engine-e-evidence-verify-the-signature-file-does-not = soubor podpisu nekončí znakem nového řádku

engine-evidence-verify-signer-not-pinned-the-signature = podepisující není připnut: podpis dokládá, že balíček je neporušený vůči klíči { $r }, který si balíček sám uvádí. Porovnejte tento otisk s otiskem, který jste získali od podepisujícího, nebo zadejte klíč.

engine-evidence-verify-range-is-not-inside-log = rozsah { $start }..{ $end } neleží uvnitř záznamu o { $full_bytes } B

engine-evidence-verify-timestamp-token-states-its-imprint = token časového razítka uvádí { $gen_time }; jeho otisk { $v2 } manifest.json. Podpis autority časových razítek Kshana neověřila: ověřte jej pomocí `openssl ts -verify`.

engine-evidence-verify-timestamp-token-states-its-imprint-2 = token časového razítka uvádí { $gen_time }; jeho otisk { $v2 } manifest.json; podpis a řetězec autority časových razítek { $v3 } proti zadaným kotvám.

## src/field_schema.rs

engine-e-field-schema-unit-is-the-empty-string = `unit` je prázdný řetězec

engine-e-field-schema-provenance-is-outside-the-vocabulary = `provenance` { $prov_str } je mimo slovník

## src/frugal.rs

engine-e-frugal-cost-bracket-must-be-finite = rozpětí nákladů musí být konečné, nezáporné, seřazené nízké≤nominální≤vysoké a musí uvádět zdroj

engine-e-frugal-coverage-fraction-and-availability-must = coverage_fraction a availability musí být zlomky v [0, 1]

## src/fusion/carrier_tc.rs

engine-e-fusion-carrier-tc-must-be-finite-and-got = { $name } musí být konečné a > 0, zadáno: { $v }

engine-e-fusion-carrier-tc-must-be-finite-and-got-2 = { $name } musí být konečné a >= 0, zadáno: { $v }

engine-e-fusion-carrier-tc-mask-deg-must-be-in = mask_deg musí ležet v [-90, 90), zadáno: { $mask_deg }

engine-e-fusion-carrier-tc-constellation-has-no-satellites = konstelace neobsahuje žádné družice

engine-e-fusion-carrier-tc-max-sats-must-be-when = max_sats musí být >= 1, pokud je zadáno

engine-e-fusion-carrier-tc-slip-satellite-out-of-range = družice skoku { $sat } je mimo rozsah

## src/fusion/kfgins.rs

engine-e-fusion-kfgins-line-columns-at-least-expected = řádek { $lineno }: { $v } sloupců, očekáváno alespoň { $min }

engine-e-fusion-kfgins-line = řádek { $lineno }: { $e }

engine-e-fusion-kfgins-line-columns = řádek { $v1 }: sloupců: { $v }

engine-e-fusion-kfgins-line-block-lists-are-not = řádek { $lineno }: blokové seznamy nejsou podporovány

engine-e-fusion-kfgins-line-expected-key-value = řádek { $lineno }: očekáván tvar `key: value`

engine-e-fusion-kfgins-line-indented-key-without-parent = řádek { $lineno }: odsazený klíč bez nadřazeného klíče

engine-e-fusion-kfgins-line-only-one-level-of = řádek { $lineno }: je povolena jen jedna úroveň zanoření

engine-e-fusion-kfgins-line-unterminated-flow-list = řádek { $lineno }: neukončený řádkový seznam

engine-e-fusion-kfgins-is-list-scalar-expected = `{ $k }` je seznam, očekáván skalár

engine-e-fusion-kfgins-missing = `{ $k }` chybí

engine-e-fusion-kfgins-must-be-three-element-list = `{ $k }` musí být seznam o třech prvcích

engine-e-fusion-kfgins-no-imu-sample-at-or = žádný vzorek IMU v čase starttime ani po něm

engine-e-fusion-kfgins-imu-time-not-increasing-at = čas IMU neroste v { $t }

## src/fusion/pack.rs

engine-e-fusion-pack-filter-prior-must-be-finite = { $slot }.filter_prior.{ $name } musí být konečné a > 0, zadáno: { $v }

engine-e-fusion-pack-tight-sigma-range-must-be = tight.sigma_range_m musí být konečné a > 0, zadáno: { $sigma_range_m }

engine-e-fusion-pack-tight-mask-deg-must-be = tight.mask_deg musí ležet v [-90, 90), zadáno: { $mask_deg }

## src/fusion/trajectory.rs

engine-e-fusion-trajectory-trajectory-csv-line-not-numbers = trajektorie csv, řádek { $v1 }: nejde o čísla: { $line }

engine-e-fusion-trajectory-trajectory-csv-line-expected-10 = trajektorie csv, řádek { $v1 }: očekáváno 10 sloupců, nalezeno: { $v }

engine-e-fusion-trajectory-trajectory-csv-line-time-does = trajektorie csv, řádek { $v1 }: čas neroste

engine-e-fusion-trajectory-trajectory-csv-needs-at-least = trajektorie csv vyžaduje alespoň dva řádky

engine-e-fusion-trajectory-trajectory-csv-covers-but-the = trajektorie csv pokrývá { $rows } s, ale scénář běží { $v2 } s

## src/geometry.rs

engine-e-geometry-sky-site-lat-deg-must = sky: lat_deg stanoviště musí ležet v [-90, 90] a každé pole musí být konečné

engine-e-geometry-sky-is-neither-gnss-preset = sky: „{ $name }“ není ani předvolba GNSS ({ $e_gnss }), ani předvolba LEO ({ $e_leo })

engine-e-geometry-sky-give-the-user-as = sky: uživatele zadejte jako `site` nebo `user_ecef_m`, ne obojí

engine-e-geometry-sky-user-ecef-must-be = sky: user_ecef_m musí být konečné a nesmí jít o geocentrum

engine-e-geometry-sky-satellite-azimuth-elevation-out = sky: družice { $id }: azimut/elevace mimo rozsah

engine-e-geometry-sky-satellite-is-given-in = sky: družice { $id } je zadána v ECEF; požadavek vyžaduje `site` nebo `user_ecef_m`

engine-e-geometry-sky-satellite-ecef-position-not = sky: družice { $id }: poloha v ECEF není konečná

engine-e-geometry-sky-satellite-coincides-with-the = sky: družice { $id } splývá s uživatelem

engine-e-geometry-sky-satellite-give-az-deg = sky: družice { $id }: zadejte az_deg a el_deg, nebo ecef_m, a nic dalšího

engine-e-geometry-sky-tle-is-bytes-the = sky: tle má { $text } B; limit je { $MAX_TLE_BYTES } (4 MiB)

engine-geometry-element-set-refused = sada elementů odmítnuta: { $e }

engine-e-geometry-sky-epoch = sky: epocha: { $e }

engine-geometry-and-more = { "." }.. a další: { $more }

engine-geometry-element-sets-propagated-by-the = Sady elementů (počet: { $n }) propagovány enginem pomocí SGP4 (WGS-72) k { $iso } a převedeny do systému pevného vůči Zemi s UT1 převzatým jako UTC a bez polárního pohybu: jde o oblohu, kterou tyto sady elementů v dané epoše dávají, nikoli o její měření.

engine-geometry-element-sets-propagated-by-the-2 = Sady elementů (počet: { $n }) propagovány enginem pomocí SGP4 (WGS-72) k epoše nejnovější sady elementů plus time_s ({ $iso }). Epocha nebyla zadána, jde tedy o reprezentativní oblohu, nikoli o oblohu uvedeného data.

engine-e-geometry-sky-give-systems-or-tle = sky: zadejte `systems` nebo `tle` (spolu se `site`), nebo `satellites`

engine-e-geometry-sky-tle-system-names-the = sky: tle_system pojmenovává družice z `tle`; požadavek neobsahuje `tle`

engine-e-geometry-sky-mask-deg-must-be = sky: mask_deg musí ležet v [-90, 90), zadáno: { $m }

engine-e-geometry-sky-systems-needs-site-or = sky: `systems` vyžaduje `site` (nebo `user_ecef_m`), ze kterého se pozoruje

engine-e-geometry-sky-time-must-be-finite = sky: time_s musí být konečné

engine-e-geometry-sky-system-asks-for-satellites = sky: systém „{ $name }“ požaduje družic: { $asked }; požadavek smí obsahovat nejvýše { $MAX_SATELLITES }

engine-e-geometry-sky-more-than-satellites = sky: více než { $MAX_SATELLITES } družic

engine-e-geometry-sky-tle-needs-site-or = sky: `tle` vyžaduje `site` (nebo `user_ecef_m`), ze kterého se pozoruje

engine-e-geometry-sky-more-than-satellites-above = sky: více než { $MAX_SATELLITES } družic nad obzorem

engine-e-geometry-sky-sigma-uere-must-be = sky: sigma_uere_m musí být kladné, zadáno: { $sigma }

engine-e-geometry-sky-confidence-must-be-in = sky: confidence musí ležet v (0, 1), zadáno: { $confidence }

engine-e-geometry-sky-more-than-systems-in = sky: ve výhledu je více než { $MAX_CLOCKS } systémů, každý s vlastními hodinami; seskupte družice pod méně štítků `system` nebo použijte clock = "common"

engine-e-geometry-sky-must-be-in-got = sky: n musí ležet v 1..={ $MAX_MC_SAMPLES }, zadáno: { $n }

engine-e-geometry-sky-too-few-satellites-in = sky: ve výhledu je příliš málo družic pro určení polohy; žádný oblak Monte Carlo

engine-e-geometry-sky = sky: { $e }

engine-geometry-pdop-hdop-vdop = PDOP { $pdop } HDOP { $hdop } VDOP { $vdop }

engine-geometry-tle-sky-at-not-measurement = obloha z TLE v { $e }, nikoli měření

engine-e-geometry-invalid-sky-request-json = neplatný požadavek sky (JSON): { $e }

engine-e-geometry-invalid-sky-request-toml = neplatný požadavek sky (TOML): { $e }

engine-e-geometry-invalid-skyline-json = neplatný skyline (JSON): { $e }

engine-e-geometry-invalid-skyline-toml = neplatný skyline (TOML): { $e }

## src/glonass.rs

engine-e-glonass-bad-glonass-prn-in = chybné PRN GLONASS v { $head }

## src/gnss_navmsg/gal_fnav.rs

engine-e-gnss-navmsg-gal-fnav-page-type-is-not-encoded = typ stránky { $pt } se zde nekóduje

engine-e-gnss-navmsg-gal-fnav-bits-expected = bitů: { $data }, očekáváno: { $DATA_BITS }

engine-e-gnss-navmsg-gal-fnav-bits-expected-2 = bitů: { $p }, očekáváno: { $PAGE_BITS }

engine-e-gnss-navmsg-gal-fnav-tail-bits-are-not-zero = koncové bity nejsou nulové

engine-e-gnss-navmsg-gal-fnav-crc-24q-mismatch = nesoulad CRC-24Q

engine-e-gnss-navmsg-gal-fnav-page-type-is-not-decoded = typ stránky { $pt } se zde nedekóduje

engine-e-gnss-navmsg-gal-fnav-symbols-expected = symbolů: { $symbols }, očekáváno: { $PAGE_SYMBOLS }

engine-e-gnss-navmsg-gal-fnav-synchronisation-pattern-not-found = synchronizační vzor nenalezen

engine-e-gnss-navmsg-gal-fnav-page-type-missing = typ stránky { $t } chybí

engine-e-gnss-navmsg-gal-fnav-iod-nav-of-page-type = IOD_nav typu stránky { $t } se liší od typu stránky 1

## src/gnss_navmsg/gal_inav.rs

engine-e-gnss-navmsg-gal-inav-no-galileo-field = žádné pole Galileo { $name }

engine-e-gnss-navmsg-gal-inav-word-type-is-not-encoded = typ slova { $wt } se zde nekóduje

engine-e-gnss-navmsg-gal-inav-bits-expected = bitů: { $word }, očekáváno: { $WORD_BITS }

engine-e-gnss-navmsg-gal-inav-word-type-is-not-decoded = typ slova { $wt } se zde nedekóduje

engine-e-gnss-navmsg-gal-inav-page-parts-must-be-120 = části stránky musí mít 120 bitů

engine-e-gnss-navmsg-gal-inav-even-odd-flags-are-not = příznaky sudá/lichá nejsou 0 a poté 1

engine-e-gnss-navmsg-gal-inav-not-nominal-page-page-type = nejde o nominální stránku (typ stránky 1 je výstražná stránka)

engine-e-gnss-navmsg-gal-inav-bits-expected-2 = bitů: { $part }, očekáváno: { $PART_BITS }

engine-e-gnss-navmsg-gal-inav-symbols-expected = symbolů: { $symbols }, očekáváno: { $PART_SYMBOLS }

engine-e-gnss-navmsg-gal-inav-word-type-missing = typ slova { $t } chybí

engine-e-gnss-navmsg-gal-inav-iod-nav-of-word-type = IOD_nav typu slova { $t } se liší od typu slova 1

## src/gnss_navmsg/galileo.rs

engine-e-gnss-navmsg-galileo-record-is-system-not-galileo = záznam patří systému { $system }, nikoli Galileo

## src/gnss_navmsg/gps_cnav.rs

engine-e-gnss-navmsg-gps-cnav-type-10-has-no-field = typ 10 nemá pole { $name }

engine-e-gnss-navmsg-gps-cnav-type-11-has-no-field = typ 11 nemá pole { $name }

engine-e-gnss-navmsg-gps-cnav-type-30-has-no-field = typ 30 nemá pole { $name }

engine-e-gnss-navmsg-gps-cnav-cnav-body-has-bits-expected = tělo CNAV má bitů: { $body }, očekáváno: 238

engine-e-gnss-navmsg-gps-cnav-prn-or-tow-count-out = PRN { $prn } nebo počet TOW { $tow_count } je mimo rozsah

engine-e-gnss-navmsg-gps-cnav-bits-expected = bitů: { $bits }, očekáváno: { $MESSAGE_BITS }

engine-e-gnss-navmsg-gps-cnav-preamble-is-not-10001011 = preambule není 10001011

engine-e-gnss-navmsg-gps-cnav-message-type-is-not-decoded = typ zprávy { $t } se zde nedekóduje

engine-e-gnss-navmsg-gps-cnav-need-type-10-and-type = je třeba zpráva typu 10 a zpráva typu 11

## src/gnss_navmsg/mod.rs

engine-e-gnss-navmsg-at-lsb-does-not-fit = { $name }: { $value } na LSB { $value2 } se nevejde do { $bits } { $v4 } bitů

engine-e-gnss-navmsg-bits-layout-needs = bitů: { $bits }, rozvržení vyžaduje: { $need }

engine-e-gnss-navmsg-no-field = žádné pole { $name }

## src/gps_lnav.rs

engine-e-gps-lnav-at-scale-does-not-fit = { $value } při měřítku 2^{ $scale_pow2 } se nevejde do { $bits } { $v1 } bitů

engine-e-gps-lnav-no-value-for = žádná hodnota pro { $name }

## src/gravimeter.rs

engine-e-gravimeter-gravity-map-reference-model-gfc = gravity-map: referenční model „gfc“ vyžaduje `gfc_path`

engine-e-gravimeter-gravity-map-cannot-read-gfc = gravity-map: nelze číst gfc_path { $path }: { $e }

engine-e-gravimeter-gravity-map-unknown-reference-model = gravity-map: neznámý referenční model `{ $other }` (použijte „egm2008“ nebo „gfc“)

engine-e-gravimeter-gravity-map-unknown-ellipsoid-use = gravity-map: neznámý elipsoid `{ $other }` (použijte „wgs84“ nebo „grs80“)

engine-e-gravimeter-gravity-map-map-error-mc = gravity-map: map_error_mc.realisations musí být alespoň 1

engine-e-gravimeter-gravity-map-map-error-mc-2 = gravity-map: map_error_mc.realisations je omezeno na 10000

## src/gravity_pds.rs

engine-e-gravity-pds-bad-real = chybné reálné číslo '{ $t }'

engine-e-gravity-pds-bad-integer = chybné celé číslo '{ $t }'

engine-e-gravity-pds-empty-shadr-table = prázdná tabulka SHADR

engine-e-gravity-pds-shadr-header-has-fields-expected = hlavička SHADR má polí: { $f }, očekáváno alespoň 6

engine-e-gravity-pds-shadr-header-negative-degree-order = hlavička SHADR: záporný stupeň/řád nebo neznámá normalizace

engine-e-gravity-pds-shadr-normalization-state-only-fully = stav normalizace SHADR { $normalization } (podporován je jen plně normalizovaný, stav 1)

engine-e-gravity-pds-shadr-reference-longitude-latitude-must = referenční délka/šířka SHADR musí být 0

engine-e-gravity-pds-non-physical-gm-must-be = nefyzikální GM (musí být konečné a kladné)

engine-e-gravity-pds-non-physical-reference-radius-must = nefyzikální referenční poloměr (musí být konečný a kladný)

engine-e-gravity-pds-shadr-record-fields = záznam SHADR { $v1 }: polí: { $f }

engine-e-gravity-pds-shadr-record-bad = záznam SHADR { $v1 }: chybné (n, m) = ({ $n }, { $m })

engine-e-gravity-pds-shadr-record-non-finite-coefficient = záznam SHADR { $v1 }: nekonečný koeficient

engine-e-gravity-pds-no-shadr-coefficient-records = žádné záznamy koeficientů SHADR

engine-e-gravity-pds-shadr-table-incomplete-missing = tabulka SHADR je neúplná: chybí (n, m) = ({ $n }, { $m })

## src/gravity_sh.rs

engine-e-gravity-sh-missing-earth-gravity-constant-gravity = chybí earth_gravity_constant / gravity_constant

engine-e-gravity-sh-missing-radius = chybí radius

engine-e-gravity-sh-non-physical-earth-gravity-constant = nefyzikální earth_gravity_constant (musí být konečná a kladná)

engine-e-gravity-sh-non-physical-radius-must-be = nefyzikální radius (musí být konečný a kladný)

engine-e-gravity-sh-no-gfc-coefficient-lines = žádné řádky koeficientů gfc

engine-e-gravity-sh-read-error = chyba čtení: { $e }

engine-e-gravity-sh-line-norm-is-not-supported = řádek { $lineno }: norm { $v } není podporováno (pouze fully_normalized)

engine-gravity-sh-line-bad = řádek { $lineno }: chybné { $what }

engine-e-gravity-sh-line-degree-above-the-declared = řádek { $lineno }: stupeň { $n } nad deklarovaným max_degree { $dm }

engine-e-gravity-sh-line-order-above-degree = řádek { $lineno }: řád { $m } nad stupněm { $n }

engine-e-gravity-sh-line-time-variable-term-is = řádek { $lineno }: časově proměnný člen `{ $key }` není podporován (pouze statické modely)

engine-e-gravity-sh-missing-end-of-head = chybí end_of_head

## src/gse_sim.rs

engine-e-gse-sim-step-must-be-positive-got = step_s musí být kladné, zadáno: { $step_s }

engine-e-gse-sim-duration-must-be-positive-got = duration_s musí být kladné, zadáno: { $duration_s }

## src/holdover_test.rs

engine-e-holdover-test-the-record-holds-non-finite = záznam obsahuje nekonečnou časovou chybu

engine-e-holdover-test-unknown-mask-expected-one-of = neznámá maska { $id }; očekáváno jedno z: { $masks }

engine-e-holdover-test-every-budget-max-abs-te = každé max_abs_te_ns rozpočtu musí být konečné a kladné

engine-e-holdover-test-gnss-removed-lies-outside-the = gnss_removed_s = { $gnss_removed_s } leží mimo záznam ({ $t0_s } až { $t_end } s na jeho vlastní časové ose)

engine-e-holdover-test-gnss-restored-must-be-later = gnss_restored_s = { $r } musí být později než gnss_removed_s ({ $gnss_removed_s }) a ne za koncem záznamu ({ $t_end } s)

engine-e-holdover-test-the-holdover-step-holds-no = krok holdover neobsahuje žádný vzorek

engine-holdover-test-the-record-has-no-step = záznam neobsahuje krok { $step }: GNSS byl odebrán již v prvním vzorku

engine-holdover-test-the-step-has-samples-the = krok { $step } obsahuje vzorků: { $te_ns }; odhadovače vyžadují alespoň 13

engine-e-holdover-test-step-with-mask-has-no = krok s maskou nemá křivku

engine-e-holdover-test-cannot-read-csv-path = nelze číst csv_path { $path }: { $e }

engine-holdover-test-recovered-after-gnss-returned = ; obnoveno { $t } s po návratu GNSS

engine-holdover-test-holdover-test-holdover-max-te = holdover-test: holdover { $hold } s, max|TE| { $max_abs } ns; { $masks }{ $rec } (MODELLED, měřeno proti masce)

## src/hybrid.rs

engine-e-hybrid-coupled-sigma-pr-must-be = coupled.sigma_pr_m musí být konečné a > 0, zadáno: { $sigma_pr_m }

engine-e-hybrid-coupled-ba-must-be-and = coupled.q_ba musí být >= 0 a coupled.bias_var > 0

## src/hybrid_integrity.rs

engine-hybrid-integrity-refused-the-two-legs-are = REFUSED: obě větve nemají společnou dobu průměrování. Optická větev akumuluje po dobu integration_s = { $integration_s } s; šířka pásma smyčky šumu větve RF B_L = { $dll_bandwidth_hz } Hz průměruje přes 1/(2*B_L) = { $rf_equivalent_averaging_s } s. Poměr dvou sigma braných při různých dobách průměrování není srovnání, a proto se žádný neuvádí. Odstraňte přepsání rf_dll_bandwidth_hz (pak se použije výchozí 1/(2*integration_s)) nebo je nastavte na { $v4 } Hz.

engine-hybrid-integrity-refused-leg-is-not-usable = REFUSED: větev nemá použitelné kladné konečné sigma (optická { $opt_sigma_range_m } m, RF { $rf_sigma_range_m } m), proto se žádný poměr netvoří.

engine-e-hybrid-integrity-unknown-rf-band-expected-ka = neznámé rf_band '{ $other }' (očekáváno s|x|ka)

engine-e-hybrid-integrity-must-be-finite = { $name } musí být konečné

engine-e-hybrid-integrity-rf-other-losses-db-must = rf_other_losses_db musí být konečné a >= 0

## src/impairment_eval.rs

engine-e-impairment-eval-target-pfa-must-be-in = target_pfa musí ležet v [0, 1]

engine-e-impairment-eval-per-class-must-be = n_per_class musí být >= 1

engine-e-impairment-eval-unknown-detector-energy-agc-sqm = neznámý detektor '{ $other }' (energy|agc|sqm|parity|fused)

## src/inertial/coast.rs

engine-e-inertial-coast-unknown-imu-grade-expected-one = neznámý imu_grade { $other }; očekáváno jedno z: navigation, tactical, industrial, consumer

engine-e-inertial-coast-unknown-combination-expected-one-of = neznámá combination { $other }; očekáváno jedno z: rss, linear-sum, det-sum-stoch-rss

engine-e-inertial-coast-unknown-trn-fix-mode-expected = neznámý trn_fix_mode { $other }; očekáváno jedno z: none, position-only, full-reset

engine-e-inertial-coast-must-be-finite-and-non = { $name } musí být konečné a nezáporné (zadáno: { $v })

engine-e-inertial-coast-crossing-thresholds-must-name-at = crossing_thresholds_m musí uvádět alespoň jednu prahovou hodnotu

engine-e-inertial-coast-crossing-thresholds-entries-must-be = položky crossing_thresholds_m musí být konečné a kladné (zadáno: { $t })

engine-e-inertial-coast-grades-must-name-at-least = grades musí uvádět alespoň jednu třídu IMU

engine-e-inertial-coast-speed-must-be-finite-and = speed_m_s musí být konečné a nezáporné (zadáno: { $v })

engine-e-inertial-coast-ref-accel-s2-must-be = ref_accel_m_s2 musí být konečné a nezáporné (zadáno: { $a })

engine-e-inertial-coast-latitude-deg-must-be-finite = latitude_deg musí být konečné a v rozmezí (-89, 89) (zadáno: { $lat })

engine-e-inertial-coast-height-must-be-within-1000 = height_m musí být v rozmezí [-1000, 100000] (zadáno: { $h })

engine-e-inertial-coast-mission-duration-must-be-positive = mission_duration_s musí být kladné

engine-e-inertial-coast-drift-band-must-satisfy-lo = pásmo driftu musí splňovat 0 < lo < hi (zadáno lo={ $lo }, hi={ $hi })

engine-e-inertial-coast-serializing-ins-trn-coast-result = serializace výsledku ins-trn-coast: { $e }

engine-inertial-coast-ins-trn-coast-imu-combination = ins-trn-coast | IMU { $grade }, { $speed } m/s, kombinace { $comb } | { $heads } | TRN { $mode } špička { $peak_error_m } m za { $mission } s

## src/inertial/mod.rs

engine-inertial-va-derived-from-cold-atom = { $provenance } (q_va odvozeno z fyziky interferometru se studenými atomy)

## src/inline_only.rs

engine-e-inline-only-scenario-is-bytes-over-the = scénář má { $toml_text } B, což přesahuje limit { $max_bytes } B

engine-e-inline-only-the-scenario-kind-reads-its = druh scénáře `{ $kind }` čte svá data ze souborů na hostiteli, proto jej toto rozhraní nespouští; použijte příkazový řádek `kshana`

engine-e-inline-only-the-field-names-file-this = pole `{ $k }` pojmenovává soubor: toto rozhraní přijímá pouze vložený obsah

## src/interference_map/adsb.rs

engine-e-interference-map-adsb-gzip = gzip: { $e }

engine-e-interference-map-adsb-trace-json = trace JSON: { $e }

## src/interference_map/api.rs

engine-e-interference-map-api-unknown-dataset-approved-or-custom = neznámá datová sada `{ $key }`; schválené: { $v1 }, nebo vlastní datová sada

engine-e-interference-map-api-dataset-is-data-but-the = datová sada `{ $key }` obsahuje data typu { $kind }, ale druh vstupu je { $kind2 }

engine-e-interference-map-api-is-not-yyyy-mm-dd = { $name } není datum ve tvaru YYYY-MM-DD

## src/interference_map/cli.rs

engine-e-interference-map-cli-unknown-option = neznámá volba `{ $a }`

engine-e-interference-map-cli-expected-positional-argument-got = očekáván počet pozičních argumentů: { $positionals }, zadáno: { $pos }

engine-e-interference-map-cli-cannot-read = nelze číst { $path }: { $e }

engine-e-interference-map-cli-dataset-custom-needs = --dataset custom vyžaduje { $n }

engine-e-interference-map-cli-already-exists-kshana-does-not = { $existing } již existuje; Kshana mapy nepřepisuje. Odstraňte jej nebo zvolte jiný adresář --out

engine-interference-map-cli-note-cell-deg-is-not = poznámka: --cell-deg { $cell_deg } není předregistrovaná velikost buňky ({ $PREREGISTERED_CELL_DEG }); mapy to uvádějí

engine-e-interference-map-cli-cannot-create = nelze vytvořit { $out }: { $e }

engine-interference-map-cli-wrote-cells-published-flagged = zapsáno { $path }: publikovaných buněk: { $cells }, označených: { $n_deg }

engine-interference-map-cli-no-usable-rows-nothing-written = žádné použitelné řádky: nic nebylo zapsáno

engine-e-interference-map-cli-unknown-subcommand = neznámý podpříkaz `{ $other }`

engine-e-interference-map-cli-the-downloaded-file-sha-256 = SHA-256 staženého souboru ({ $got }) neodpovídá připnuté hodnotě ({ $expected }); soubor byl zahozen

engine-e-interference-map-cli-cannot-write = nelze zapsat { $dest }: { $e }

engine-e-interference-map-cli-curl-was-not-found-on = curl nebyl nalezen v PATH. Nainstalujte curl, nebo si stáhněte { $NATURAL_EARTH_LAND_URL } sami a ověřte, že jeho SHA-256 je { $NATURAL_EARTH_LAND_SHA256 }

engine-e-interference-map-cli-cannot-run-curl = nelze spustit curl: { $e }

engine-interference-map-cli-wrote-natural-earth-land-polygons = zapsáno { $out }: polygony souše Natural Earth, SHA-256 ověřeno (volné dílo, https://www.naturalearthdata.com/about/terms-of-use/)

engine-e-interference-map-cli-no-trace-full-files-under = žádné soubory trace_full_* v { $path }

engine-e-interference-map-cli-cannot-read-2 = nelze číst { $spec }: { $e }

engine-e-interference-map-cli-is-not-yyyy-mm-dd = { $n } není datum ve tvaru YYYY-MM-DD

engine-e-interference-map-cli-bad-map-date = { $f }: chybné datum mapy

engine-e-interference-map-cli-cannot-write-2 = nelze zapsat { $out }: { $e }

engine-interference-map-cli-route-length-km = délka trasy { $rows } km

engine-interference-map-cli-caveats-degraded-cell-does-not = Výhrady: degradovaná buňka neurčuje interferenci jako příčinu; nepozorované buňky nejsou důkazem čisté trasy; nejde o předpověď.

## src/interference_map/land.rs

engine-e-interference-map-land-land-polygons-invalid-json = polygony souše: neplatný JSON: { $e }

## src/interference_map/mod.rs

engine-e-interference-map-missing-required-column = chybí povinný sloupec `{ $name }`

engine-e-interference-map-cannot-read-input = nelze číst vstup: { $e }

## src/interference_map/observatory.rs

engine-e-interference-map-observatory-day-is-not-date-yyyy = --day `{ $day }` není datum (YYYY-MM-DD)

engine-e-interference-map-observatory-delay-hours-must-be-or = --delay-hours musí být alespoň { $MIN_DELAY_HOURS }: observatoř nepublikuje dříve

engine-e-interference-map-observatory-cell-deg-must-be-or = --cell-deg musí být { $MIN_CELL_DEG } nebo hrubší: observatoř publikuje pouze hrubé buňky

engine-e-interference-map-observatory-is-not-publishable-yet-its = { $day } zatím nelze publikovat: jeho produkt se vydává nejdříve v { $fmt_utc } ({ $delay_hours } h po skončení dne)

engine-interference-map-observatory-kshana-observatory-ads = KSHANA OBSERVATORY  ADS-B  { $date }

engine-interference-map-observatory-deg-cells-utc-day-not = { $trim_deg } DEG CELLS  UTC DAY  NOT OBSERVED IS NOT CLEAR  NO CAUSE ATTRIBUTED

engine-interference-map-observatory-source-licence = SOURCE { $dataset }  LICENCE { $dataset2 }

## src/interference_map/observatory.rs

engine-interference-map-observatory-degraded-not-degraded-not-observed = { $summary } DEGRADED  { $summary2 } NOT DEGRADED  { $summary3 } NOT OBSERVED (PUBLIKOVANÉ BUŇKY)

engine-interference-map-observatory-kshana-observatory-ads-navigation-accuracy = Observatoř Kshana, mapa navigační přesnosti z ADS-B, { $date }

engine-e-interference-map-observatory-cannot-create-kshana-does-not = nelze vytvořit { $path } (Kshana produkty nepřepisuje): { $e }

engine-e-interference-map-observatory-the-input-has-no-usable = vstup neobsahuje použitelné hlášení za { $day } (nalezené dny: { $days })

engine-e-interference-map-observatory-already-exists-kshana-does-not = { $path } již existuje; Kshana produkty nepřepisuje

engine-interference-map-observatory-cells-published-degraded-incident = buněk publikováno: { $p }, degradovaných: { $p2 }, incidentů: { $p3 }

engine-interference-map-observatory-rows-replayed-under-variants = řádků přehráno: { $rows }, variant: { $variants }: { $out }

## src/interference_map/route.rs

engine-e-interference-map-route-map-is-not-valid-json = mapa není platný JSON: { $e }

engine-e-interference-map-route-route-invalid-json = trasa: neplatný JSON: { $e }

engine-e-interference-map-route-route-line-is-not-lat = trasa: řádek { $v1 } není ve tvaru `lat,lon`

## src/interop/czml.rs

engine-interop-czml-kshana-export-epoch-moving-objects = Export Kshana { $v1 }. Epocha: { $epoch_note }. Pohyblivé objekty: GCRS (referenceFrame INERTIAL), metry, sekundy po epoše. Pevná stanoviště: pevně vázaný k Zemi WGS 84 (referenceFrame FIXED), metry.

engine-interop-czml-position-gcrs-metres = { $description } ({ $role }). Poloha: GCRS, metry.

engine-interop-czml-latitude-deg-longitude-deg-height = { $description } ({ $role }). Šířka { $lat_deg } deg, délka { $lon_deg } deg, výška { $h_m } m nad elipsoidem WGS 84. Poloha: pevně vázaná k Zemi, metry.

engine-interop-czml-radius-along-the-ground = { $description }. Poloměr { $radius_m } m podél terénu.

engine-interop-czml-untimed-wgs-84-longitude-and = { $description }. Bez času: délka a šířka WGS 84 ve stupních, přichycené k terénu.

## src/interop/geojson.rs

engine-interop-geojson-earth-fixed-positions-multilinestring-is = { $description }. Polohy pevně vázané k Zemi; MultiLineString je přerušen na antimeridiánu a times_utc pak uvádí jen původní vzorky.

engine-interop-geojson-kshana-export-epoch = Export Kshana { $v1 }. Epocha: { $epoch_note }.

engine-e-interop-geojson-invalid-geojson = neplatný GeoJSON: { $e }

engine-e-interop-geojson-linestring-has-no-coordinates-array = LineString nemá pole coordinates

engine-e-interop-geojson-an-rfc-7946-linestring-needs = LineString dle RFC 7946 vyžaduje dvě nebo více poloh

engine-interop-geojson-position-is-not-an-array = poloha { $i } není pole dvou nebo tří čísel

engine-interop-geojson-position-longitude-is-not-number = poloha { $i }: délka není číslo

engine-interop-geojson-position-latitude-is-not-number = poloha { $i }: šířka není číslo

engine-e-interop-geojson-position-longitude-is-outside-180 = poloha { $i }: délka { $lon } je mimo [-180, 180] (GeoJSON uvádí délku jako první)

engine-e-interop-geojson-position-latitude-is-outside-90 = poloha { $i }: šířka { $lat } je mimo [-90, 90] (GeoJSON uvádí délku jako první)

engine-e-interop-geojson-track-needs-two-or-more = dráha vyžaduje dva nebo více bodů trasy

engine-e-interop-geojson-the-route-spans-more-than = trasa přesahuje 180 stupňů délky; druhy dráhy postupují v prostých stupních a nemohou překročit antimeridián

engine-e-interop-geojson-position-is-deg-from-an = poloha { $worst } je { $worst2 } deg od rovnoměrně rozložené přímé dráhy (tolerance { $tol_deg } deg); druhy dráhy létají start + i*step, proto zadejte rovnoměrně rozložené polohy na přímce, nebo jen oba koncové body

engine-e-interop-geojson-route-applies-to-the-kinds = trasa se vztahuje na druhy, které létají po dráze s body trasy (terrain-nav, terrain-slam, gravity-map, combined-altpnt); `{ $k }` nepřijímá vstup trajektorie

engine-e-interop-geojson-scenario-toml-is-not-table = TOML scénáře není tabulka

engine-e-interop-geojson-cannot-serialise-scenario = scénář nelze serializovat: { $e }

## src/interop/mod.rs

engine-e-interop-unknown-export-format-expected-one = neznámý formát exportu '{ $other }'; očekáváno jedno z: czml, kml, geojson, stk, sigmf, all nebo list

engine-e-interop-member = člen { $label }: { $e }

engine-interop-the-scenario-could-not-be = scénář nebylo možné exportovat: { $m }

engine-e-interop-invalid-spectrum-scenario = neplatný scénář spektra: { $e }

## src/interop/scene.rs

engine-e-interop-scene-time-samples-is-more-than = časových vzorků ({ $n }) je více, než export zapisuje ({ $MAX_SAMPLES })

engine-e-interop-scene-objects-samples-is-more-than = objektů { $items } × vzorků { $times } je více, než export zapisuje ({ $MAX_SAMPLES })

engine-e-interop-scene-invalid-scenario = neplatný scénář druhu { $kind }: { $e }

engine-interop-scene-jammer-dbw-transmit-power-dbi = rušička { $jammer_type }, vysílací výkon { $power_dbw } dBW, zisk antény { $gain_dbi } dBi

engine-interop-scene-from-the-jamming-kind-link = { $what }; { $r } m, z rovnic spoje druhu jamming s rušičkou na obzoru přijímače a ztrátou volným prostorem

engine-interop-scene-the-chain-pass-stage = { $epoch_note } (stupeň [pass] řetězce)

engine-interop-scene-circular-orbit-km-altitude-deg = kruhová dráha, výška { $altitude_km } km, sklon { $inclination_deg } deg (střední elementy SGP4 na začátku okna, tak jak je propaguje druh passes)

engine-interop-scene-ground-station-deg-elevation-mask = pozemní stanice, elevační maska { $mask_deg } deg

engine-interop-scene-gcrs-and-earth-fixed-states = { $source }; stavy v GCRS a v soustavě pevně vázané k Zemi jsou vlastním výstupem druhu ephemeris (UT1 a polární pohyb dle nastavení scénáře)

engine-interop-scene-static-scene-the-kind-flies = statická scéna: druh { $kind } létá po dráze bodů trasy bez času

engine-interop-scene-true-track-flown-gps-denied = skutečná dráha letěná bez GPS: bodů trasy: { $track } od start_lat_deg/start_lon_deg po krocích step_lat_deg/step_lon_deg

engine-e-interop-scene-has-no-scene = `{ $kind }` nemá scénu

engine-e-interop-scene-missing-numeric = chybí číselná hodnota `{ $k }`

engine-e-interop-scene-missing-integer-waypoints = chybí celé číslo `waypoints`

engine-e-interop-scene-waypoints-is-outside-1000000 = waypoints = { $n } je mimo 1..=1000000

engine-interop-scene-walker-at-km-deg-inclination = Walker { $w }/{ $planes }/{ $phasing_f } ve výšce { $altitude_km } km, sklon { $inclination_deg } deg (SGP4)

engine-interop-scene-the-scenario-gives-no-epoch = scénář neuvádí `epoch`; t = 0 je { $epoch }, nejstarší epocha, kterou nesou vlastní data družic (epocha TLE, broadcast efemerid nebo SP3). Každá družice je propagována od své vlastní epochy a ty se rozprostírají přes { $spread_h } h: časové značky sledují předpoklad enginu, že každá družice začíná v t = 0, zatímco každá poloha je převedena do soustav GCRS a pevně vázané k Zemi v okamžiku dané družice. Exporty SP3 a OEM místo toho označují t = 0 jako 2000-01-01T00:00:00Z

engine-interop-scene-the-scenario-gives-no-epoch-2 = scénář neuvádí `epoch`; t = 0 je { $epoch }, epocha, kterou nesou vlastní data družic (epocha TLE, broadcast efemerid nebo SP3). Exporty SP3 a OEM místo toho označují t = 0 jako 2000-01-01T00:00:00Z

engine-e-interop-scene-objects-samples-is-more-than-2 = objektů { $satellites } × vzorků { $times_s } je více, než export zapisuje ({ $MAX_SAMPLES })

engine-interop-scene-user-moving-the-kind-constant = uživatel { $user_environment }, pohybující se (konstantní rychlostí a kursem druhu)

engine-interop-scene-user-receiver = uživatel { $user_environment } (přijímač)

engine-interop-scene-user-orbit-km-altitude-deg = dráha uživatele, výška { $altitude_km } km, sklon { $inclination_deg } deg (keplerovská{ $v3 })

## src/interop/stk.rs

engine-e-interop-stk-no-moving-object = žádný pohyblivý objekt { $index }

engine-interop-stk-kshana-export-object = # Export Kshana { $v1 }: { $scene }, objekt { $id } ({ $role }){ "\u000A" }

## src/interop/testbench.rs

engine-interop-testbench-jammer-dbw-transmit-power-dbi = rušička { $jammer_type }, vysílací výkon { $power_dbw } dBW, zisk antény { $gain_dbi } dBi (parametr rozpočtu spoje scénáře, nikoli signál)

engine-e-interop-testbench-has-no-vehicle-trajectory-to = `{ $other }` nemá trajektorii vozidla k exportu; export pro zkušební stav pokrývá druhy gnss-ins, jamming a gnss-sim

engine-e-interop-testbench-empty-motion-csv = prázdný CSV pohybu

engine-e-interop-testbench-motion-csv-header-is-not = hlavička CSV pohybu neobsahuje očekávané sloupce: { $head }

engine-e-interop-testbench-row-fields-expected = řádek { $v1 }: polí: { $f }, očekáváno: { $motion_columns }

engine-e-interop-testbench-row-column-is-not-number = řádek { $v1 }: sloupec { $motion_columns } není číslo

engine-e-interop-testbench-line-no = řádek { $v1 }: chybí `$`

engine-e-interop-testbench-line-no-checksum = řádek { $v1 }: chybí kontrolní součet

engine-e-interop-testbench-line-bad-checksum-field = řádek { $v1 }: chybné pole kontrolního součtu

engine-e-interop-testbench-line-checksum-mismatch = řádek { $v1 }: kontrolní součet nesouhlasí

engine-e-interop-testbench-line-short-gga = řádek { $v1 }: zkrácená věta GGA

engine-interop-testbench-line-bad-latitude = řádek { $v1 }: chybná šířka

engine-interop-testbench-line-bad-longitude = řádek { $v1 }: chybná délka

engine-e-interop-testbench-line-bad-altitude = řádek { $v1 }: chybná výška

engine-e-interop-testbench-line-bad-separation = řádek { $v1 }: chybná separace

engine-e-interop-testbench-line-short-rmc = řádek { $v1 }: zkrácená věta RMC

engine-e-interop-testbench-line-rmc-with-no-preceding = řádek { $v1 }: RMC bez předchozí věty GGA

engine-e-interop-testbench-line-gga-and-rmc-times = řádek { $v1 }: časy vět GGA a RMC se liší

engine-e-interop-testbench-line-bad-speed = řádek { $v1 }: chybná rychlost

engine-e-interop-testbench-line-bad-course = řádek { $v1 }: chybný kurs

engine-e-interop-testbench-line-bad-time-or-date = řádek { $v1 }: chybný čas nebo datum

engine-e-interop-testbench-gga-with-no-following-rmc = věta GGA bez následující věty RMC

engine-e-interop-testbench-waypoint-file-needs-at-least = soubor bodů trasy vyžaduje alespoň dva vzorky

engine-e-interop-testbench-the-sample-step-is-not = krok vzorků { $step } s není celé číslo milisekund

engine-e-interop-testbench-the-samples-are-not-equally = vzorky nejsou rovnoměrně rozloženy: interval { $v1 } je { $dt } s, první je { $step } s

engine-e-interop-testbench-empty-waypoint-file = prázdný soubor bodů trasy

engine-e-interop-testbench-waypoint-not-three-numbers = bod trasy { $v1 }: nejde o tři čísla

engine-e-interop-testbench-waypoint-fields-expected = bod trasy { $v1 }: polí: { $f }, očekáváno: 3

engine-e-interop-testbench-events-csv-header-is-not = hlavička CSV událostí neobsahuje label,kind,onset_s,end_s,description

engine-e-interop-testbench-event-row-expected-fields = řádek události { $v1 }: očekáváno 5 polí

engine-e-interop-testbench-event-row-unknown-kind = řádek události { $v1 }: neznámý druh { $f }

engine-e-interop-testbench-event-row-bad-onset = řádek události { $v1 }: chybný počátek

engine-e-interop-testbench-event-row-bad-end = řádek události { $v1 }: chybný konec

engine-interop-testbench-no-waypoints-txt-written = soubor .waypoints.txt nezapsán: { $e }

## src/interop/time.rs

engine-interop-time-not-utc-time-yyyy-mm = není čas UTC `YYYY-MM-DDTHH:MM:SS`: { $why }: { $text }

## src/ionex.rs

engine-e-ionex-missing = chybí { $what }

engine-e-ionex-bad-number-in = { $what }: chybné číslo ve sloupci { $col }

engine-e-ionex-two-digit-year = { $what }: dvouciferný rok { $year }

engine-e-ionex-no-end-of-header = chybí END OF HEADER

engine-e-ionex-height-dependent-ionex-maps-are = mapy IONEX závislé na výšce (3-D) nejsou podporovány

engine-e-ionex-zero-grid-step = nulový krok mřížky

engine-e-ionex-grid-needs-at-least-nodes = mřížka vyžaduje alespoň 2 x 2 uzly

engine-e-ionex-map-no = mapa { $index }: chybí { $end_label }

engine-e-ionex-map-band-latitude-header-grid = mapa { $index }: pás { $band } šířka { $band_lat }, mřížka v hlavičce { $want }

engine-e-ionex-map-band-longitudes-differ = mapa { $index }: délky v pásu { $band } se liší

engine-e-ionex-map-band-truncated = mapa { $index }: pás { $band } je zkrácený

engine-e-ionex-map-bands-header-grid-has = mapa { $index }: pásů: { $band }, mřížka v hlavičce má { $n_lat }

engine-e-ionex-map-no-epoch-of-current = mapa { $index }: chybí EPOCH OF CURRENT MAP

engine-e-ionex-tec-maps-header-of-maps = map TEC: { $tec_maps }, hlavička # OF MAPS IN FILE { $n_maps }

engine-e-ionex-tec-map-epochs-not-increasing = epochy map TEC nerostou

## src/iq/acq.rs

engine-e-iq-acq-hz-does-not-hold-whole = { $fs_hz } Hz neobsahuje celý počet vzorků na periodu { $code } ({ $spc } vzorků)

engine-e-iq-acq-coherent-periods-and-noncoherent-must = coherent_periods a noncoherent musí být kladné

engine-e-iq-acq-stream-ended-after-of-samples = proud skončil po { $got } z { $needed } vzorků

engine-e-iq-acq-cfar-reference-cells-must-be = referenčních buněk CFAR musí být sudý počet, alespoň 2 (zadáno: { $n })

engine-e-iq-acq-cfar-stride-must-be-at = krok CFAR musí být alespoň 1 zpoždění

engine-e-iq-acq-cfar-per-cell-pfa-must = Pfa CFAR na buňku musí ležet v (0, 1) (zadáno: { $pfa_cell })

engine-e-iq-acq-cfar-window-reaches-lags-each = okno CFAR sahá { $reach } zpoždění na každou stranu, což je příliš široké pro periodu o { $samples_per_period } zpožděních

## src/iq/acq_surface.rs

engine-e-iq-acq-surface-unknown-surface-format-expected-csv = neznámý formát povrchu { $s }: očekáváno csv, json nebo bin

engine-e-iq-acq-surface-the-surface-would-hold-cells = povrch by obsahoval buněk: { $spc_cells } (limit { $MAX_SURFACE_CELLS }): zvětšete krok Dopplera nebo zúžte rozsah Dopplera

engine-e-iq-acq-surface-surface-header = hlavička povrchu: { $e }

engine-e-iq-acq-surface-surface-schema-expected = schéma povrchu { $schema }; očekáváno { $SURFACE_SCHEMA }

engine-e-iq-acq-surface-surface-body = tělo povrchu: { $e }

## src/iq/campaign/conditions.rs

engine-e-iq-campaign-conditions-recording-format-and-sample-rate = záznam '{ $id }': format a sample_rate_hz musí být zadány společně

engine-e-iq-campaign-conditions-test-conditions-json = podmínky zkoušky (JSON): { $e }

engine-e-iq-campaign-conditions-test-conditions-toml = podmínky zkoušky (TOML): { $e }

engine-e-iq-campaign-conditions-events-from-sigmf-needs-sigmf = { $path }: events_from_sigmf vyžaduje záznam SigMF (zadáno: { $rec })

engine-e-iq-campaign-conditions-sigmf-metadata = metadata SigMF: { $e }

engine-e-iq-campaign-conditions-sigmf-metadata-global-core-sample = metadata SigMF: chybí global core:sample_rate

engine-iq-campaign-conditions-core-sample-start-is-missing = { $at }: chybí core:sample_start

engine-iq-campaign-conditions-no-core-sample-count-and = { $at }: chybí core:sample_count i body výkonu, které by ukončily událost

engine-e-iq-campaign-conditions-kshana-test-event = { $at }: kshana:test_event: { $e }

engine-e-iq-campaign-conditions-schema-must-be-got = schema musí být „{ $SCHEMA }“ (zadáno „{ $schema }“)

engine-e-iq-campaign-conditions-recording-id-must-not-be = recording.id nesmí být prázdné

engine-e-iq-campaign-conditions-recording-settle-must-be-finite = recording.settle_s musí být konečné a >= 0

engine-e-iq-campaign-conditions-recording-sha256-must-be-64 = recording.sha256 musí mít 64 hexadecimálních číslic

engine-e-iq-campaign-conditions-recording-kind-must-be-iq = recording.kind musí být „iq“ nebo „receiver-log“ (zadáno „{ $k }“)

engine-e-iq-campaign-conditions-at-least-one-expected-group = je vyžadována alespoň jedna skupina [[expected]]

engine-e-iq-campaign-conditions-ids-must-not-be-empty = { $at }: ids nesmí být prázdné

engine-e-iq-campaign-conditions-duplicate-id = { $at }: duplicitní id

engine-e-iq-campaign-conditions-offset-must-be-after-onset = { $at }: offset_s musí být po onset_s

engine-e-iq-campaign-conditions-affects-must-be-all-or = { $at }: affects musí být „all“ nebo seznam id

engine-e-iq-campaign-conditions-affects-id-is-not-in = { $at }: id v affects { $bad } není v [[expected]]

engine-e-iq-campaign-conditions-must-be-positive = { $at }: q musí být kladné

engine-e-iq-campaign-conditions-power-points-must-not-be = { $at }: power.points nesmí být prázdné

engine-e-iq-campaign-conditions-power-points-must-be-in = { $at }: power.points musí být v časovém pořadí

engine-e-iq-campaign-conditions-power-points-must-be-finite = { $at }: power.points musí být konečné

engine-e-iq-campaign-conditions-power-quantity-jammer-dbm-needs = { $at }: power.quantity = "jammer_dbm" vyžaduje reference_signal_dbm

engine-e-iq-campaign-conditions-events-and-overlap-on-shared = události '{ $id }' a '{ $id2 }' se překrývají na sdílené družici

## src/iq/campaign/detect.rs

engine-e-iq-campaign-detect-monitors-detect-grace-must-be = monitors.detect_grace_s musí být >= 0

engine-e-iq-campaign-detect-monitors-roc-window-must-be = monitors.roc_window_s musí být kladné

## src/iq/campaign/runner.rs

engine-e-iq-campaign-runner-recording-sha-256-does-not = záznam '{ $id }': SHA-256 { $sha } neodpovídá uvedené hodnotě { $want }

engine-e-iq-campaign-runner-runs-jsonl = runs.jsonl: { $e }

engine-e-iq-campaign-runner-recording-holds-samples-needed-to = { $code }: záznam obsahuje { $buf } vzorků, k akvizici je třeba { $n }

## src/iq/campaign/score.rs

engine-e-iq-campaign-score-scoring-baseline-window-must-be = scoring.baseline_window_s musí být kladné

engine-e-iq-campaign-score-scoring-js-bin-db-must = scoring.js_bin_db musí být kladné

engine-e-iq-campaign-score-scoring-reacq-grace-must-be = scoring.reacq_grace_s musí být >= 0

engine-e-iq-campaign-score-scoring-false-lock-doppler-hz = scoring.false_lock_doppler_hz musí být kladné

engine-e-iq-campaign-score-scoring-false-lock-min-epochs = scoring.false_lock_min_epochs musí být alespoň 1

## src/iq/campaign/spec.rs

engine-e-iq-campaign-spec-campaign-json = kampaň (JSON): { $e }

engine-e-iq-campaign-spec-campaign-toml = kampaň (TOML): { $e }

engine-e-iq-campaign-spec-inputs-conditions-must-list-at = inputs.conditions musí uvádět alespoň jeden soubor nebo vzor glob

engine-e-iq-campaign-spec-run-max-seconds-must-be = run.max_seconds musí být >= 0

engine-e-iq-campaign-spec-frontend-names-must-be-non = názvy frontendů musí být neprázdné a jedinečné ('{ $name }')

engine-e-iq-campaign-spec-inputs-conditions-matches-no-file = inputs.conditions: '{ $pat }' neodpovídá žádnému souboru

engine-e-iq-campaign-spec-recording-id-appears-in-both = id záznamu '{ $w }' se vyskytuje v { $w2 } i v { $w3 }

engine-e-iq-campaign-spec-inputs-design-names-needs-inputs = inputs.design_names vyžaduje inputs.designs

engine-e-iq-campaign-spec-inputs-design-names-no-design = inputs.design_names: v { $path } není návrh '{ $n }'

## src/iq/campaign/truth.rs

engine-e-iq-campaign-truth-truth-line = řádek reference { $v1 }: { $e }

## src/iq/channel/cn0_profile.rs

engine-e-iq-channel-cn0-profile-n0-profile = profil C/N0: { $e }

engine-e-iq-channel-cn0-profile-n0-profile-2 = profil C/N0: { $m }

engine-iq-channel-cn0-profile-segment-step-values-must-be = segment { $i }: hodnoty skoku musí být konečné

engine-iq-channel-cn0-profile-segment-ramp-needs-end-start = segment { $i }: rampa vyžaduje end_s > start_s

engine-iq-channel-cn0-profile-segment-points-need-equal-non = segment { $i }: points vyžaduje stejně dlouhé neprázdné t_s a db

engine-iq-channel-cn0-profile-segment-must-increase-strictly = segment { $i }: t_s musí striktně růst

engine-iq-channel-cn0-profile-segment-points-must-be-finite = segment { $i }: points musí být konečné

engine-iq-channel-cn0-profile-segment-fade-s4-must-be = segment { $i }: s4 úniku musí ležet v (0, 1]

engine-iq-channel-cn0-profile-segment-fade-tau-must-be = segment { $i }: tau_s úniku musí být kladné

## src/iq/cli/acquire.rs

engine-iq-cli-acquire-recording-holds-samples-needed-for = { $code }: záznam obsahuje { $samples } vzorků, pro toto hledání je třeba { $need }

engine-iq-cli-acquire-surface-name-the-format-with = --surface { $path }: určete formát pomocí --surface-format csv|json|bin, nebo ukončete cestu příponou .csv, .json nebo .bin

engine-iq-cli-acquire-acquisition-hz-coherent-period-non = akvizice: { $fs_hz } Hz, koherentních period: { $coherent_periods } x nekoherentních: { $noncoherent }, pfa { $pfa }{ "\u000A" }

## src/iq/cli/campaign.rs

engine-iq-cli-campaign-report-rebuilt-of-cell-row = report znovu sestaven: buněk { $cells_present } z { $cells_total }, řádků: { $rows }, z toho nesplňuje práh: { $rows_failed }; otisk { $s }

engine-iq-cli-campaign-campaign-cell-already-done-run =
    kampaň { $name }: buněk: { $cells_total }; již hotovo: { $cells_skipped }, spuštěno nyní: { $cells_run }, selhalo: { $cells_failed }, čeká: { $cells_pending }
    výstup: { $out_dir }

engine-iq-cli-campaign-first-failure =
    { $msg }
    první selhání ({ $key }…): { $e }

engine-iq-cli-campaign-ok-event-expected-satellite-condition =
    { $resolved }
    OK: událostí: { $events }, očekávaných družic: { $tc }; otisk podmínek { $tc2 }

## src/iq/cli/channel.rs

engine-iq-cli-channel-iono-slant-tecu = iono šikmé { $t } TECU

engine-iq-cli-channel-iono-vertical-tecu = iono svislé { $t } TECU

engine-iq-cli-channel-tropo-doy = tropo, den v roce { $tropo_doy }

engine-iq-cli-channel-multipath-ground = vícecestné šíření { $h }m, povrch { $multipath_ground }

engine-e-iq-cli-channel-multipath-ground-must-be-dry = --multipath-ground musí být dry, wet nebo sea (zadáno: { $other })

engine-e-iq-cli-channel-give-at-most-one-of = zadejte nejvýše jedno z --iono-stec, --iono-vtec, --iono-klobuchar

## src/iq/cli/frontend.rs

engine-iq-cli-frontend-bandpass-wants-lo-hi-got = --bandpass vyžaduje lo,hi (zadáno: { $v })

engine-e-iq-cli-frontend-bandpass-needs-lo-hi = --bandpass vyžaduje lo < hi

engine-e-iq-cli-frontend-bandpass-with-transition-hz-does = --bandpass { $lo },{ $hi } s přechodem { $transition } Hz se nevejde pod fs/2 ({ $v1 } Hz); zúžte pásmo nebo přechod

engine-e-iq-cli-frontend-bits-must-be-16-got = --bits musí být 1..=16 (zadáno: { $bits })

engine-iq-cli-frontend-filtered-samples-hz-to-sidecar = filtrováno vzorků: { $total } ({ $fs_hz } Hz) do { $out } ({ $format }); doprovodný soubor { $sidecar_path }

## src/iq/cli/labfit.rs

engine-iq-cli-labfit-cannot-read = nelze číst { $path }: { $e }

engine-iq-cli-labfit-invalid-labfit-scenario = neplatný scénář labfit: { $e }

engine-iq-cli-labfit-fitted-run-wrote = proloženo běhů: { $runs }; zapsáno { $written }

engine-iq-cli-labfit-fitted-unit-from-campaign-wrote = proloženo jednotek z kampaně: { $fit_units }; zapsáno { $written }

engine-iq-cli-labfit-cannot-write = nelze zapsat { $target }: { $e }

## src/iq/cli/mod.rs

engine-iq-cli-needs-value = { $s } vyžaduje hodnotu

engine-e-iq-cli-cannot-parse = { $k }: nelze zpracovat { $v }

engine-e-iq-cli-cannot-parse-2 = { $k }: nelze zpracovat { $p }

engine-iq-cli-unknown-iq-processing-command-expected = neznámý příkaz zpracování iq { $other }; očekáváno scene, acquire, track, sweep, labfit, frontend, monitor, campaign nebo conditions

## src/iq/cli/scene.rs

engine-e-iq-cli-scene-prn-is-out-of-range = PRN { $id } je pro GPS mimo rozsah

engine-e-iq-cli-scene-no-healthy-gps-ephemeris-found = pro požadovaná PRN nebyly nalezeny žádné zdravé efemeridy GPS

engine-iq-cli-scene-rx-pos-wants-lat-lon = --rx-pos vyžaduje lat,lon,alt (zadáno: { $v })

engine-iq-cli-scene-n0-profile-segment = { $chan_desc }; profil C/N0 (segmentů: { $segments })

engine-iq-cli-scene-truth-format-must-be-csv = --truth-format musí být csv nebo jsonl (zadáno: { $other })

engine-iq-cli-scene-integer-scale-lsb-noise-normalised = ; celočíselné měřítko: 1 LSB = { $sc } jednotek normalizovaných na šum (očekávané RMS { $v1 } LSB na složku), oříznutých prvků: { $clipped }

engine-iq-cli-scene-written-by-kshana-iq-scene = zapsáno příkazem kshana iq scene: SIMULOVANÁ scéna, nikoli záznam{ $scale_note }

engine-iq-cli-scene-ion-sdr-metadata = metadata ION SDR { $path }

engine-iq-cli-scene-sigmf-data-meta = data SigMF { $data_path }, meta { $meta_path }

engine-iq-cli-scene-written-by-kshana-iq-scene-2 = zapsáno příkazem kshana iq scene{ $scale_note }

engine-iq-cli-scene-wrote-samples-hz-to-truth = zapsáno vzorků: { $samples } ({ $format }, { $fs_hz } Hz) do { $data_path }; záznamů reference: { $truth_records } do { $truth_path }; { $meta_note }; kanál: { $chan_desc }{ $scale_note }

## src/iq/cli/sweep.rs

engine-iq-cli-sweep-cannot-be-combined-with-design = { $k } nelze kombinovat s --design: sweep spouští každý návrh v souboru

engine-iq-cli-sweep-loop-design-sweep-design-prn = přehled návrhů smyčky: výsledků (návrh, PRN): { $rows }{ "\u000A" }

## src/iq/cli/track.rs

engine-iq-cli-track-recording-holds-samples-needed-to = { $code }: záznam obsahuje { $samples } vzorků, k akvizici je třeba { $need }

engine-iq-cli-track-not-acquired-statistic-threshold-raise = { $code }: neakvírováno (statistika { $statistic } < práh { $threshold }); zvyšte --doppler-max, --acq-coherent nebo --acq-noncoherent, nebo zkontrolujte záznam

engine-iq-cli-track-designs-and-differ-in-integration = návrhy { $first } a { $d } se liší v integration.extra_taps_chips; návrhy jednoho běhu se musí shodovat, aby každý výstupní záznam měl stejné sloupce

## src/iq/cli/track.rs

engine-iq-cli-track-epochs-name-the-format-with = --epochs { $p }: určete formát pomocí --epochs-format csv|jsonl|bin, nebo ukončete cestu příponou .csv, .jsonl nebo .bin

engine-iq-cli-track-hz-is-samples-per-chip = { $fs_hz } Hz je { $r } vzorků na čip kódu { $c }: souměrné vzorkování mění diskriminátor kódu na schodovitou funkci (při 2 vzorcích na čip DLL kmitá, asi 0,09 čipu RMS chyby kódu při 45 dB-Hz); jitter a systematická odchylka kódové smyčky z tohoto záznamu nejsou reprezentativní. K posouzení kódových smyček použijte vzorkovací frekvenci, která není násobkem poloviny čipové frekvence.

## src/iq/io/batch.rs

engine-e-iq-io-batch-worker-exited-before-processing-this = pracovní proces skončil dříve, než tento vstup zpracoval

## src/iq/io/cli.rs

engine-e-iq-io-cli-unknown-option = neznámá volba { $s }

engine-e-iq-io-cli-format-needs-rate = --format vyžaduje --rate

engine-iq-io-cli-unknown-iq-command = neznámý příkaz iq { $other }

## src/iq/io/follow.rs

engine-e-iq-io-follow-follow-reads-single-channel-recordings = { $meta_path }: --follow čte pouze jednokanálové záznamy

engine-e-iq-io-follow-follow-reads-recording-with-one = { $meta_path }: --follow čte záznam s jedním zachycením, tento jich má { $captures }

engine-e-iq-io-follow-no-positive-core-sample-rate = { $meta_path }: chybí kladné core:sample_rate

engine-e-iq-io-follow-the-capture-does-not-start = { $meta_path }: zachycení nezačíná na hranici bajtu

## src/iq/io/format.rs

engine-e-iq-io-format-unknown-sample-format-expected-ci8 = neznámý formát vzorku { $name }: očekáváno např. ci8, cu8, ci16_le, ci16_be, cf32_le, cf32_be, ri16_le, ci12r_le, ci12l_be, cu16_le, cu12r_be, ci4_msb, cu4_lsb, c2tc_msb, r2sm_lsb, c2sm_byte, volitelně zakončené _qi pro komplexní

## src/iq/io/inventory.rs

engine-e-iq-io-inventory-sidecar-sample-rate-hz-is = sample_rate_hz doprovodného souboru { $sample_rate_hz } není kladné

engine-e-iq-io-inventory-sdrx-recordings-hold-one-stream = { $path }: záznamy .sdrx obsahují jeden proud; kanál { $channel } neexistuje

engine-e-iq-io-inventory-raw-file-with-no-sidecar = { $path }: surový soubor bez doprovodného souboru; uveďte jeho formát, nebo zapište { $sidecar_candidates }

## src/iq/io/report.rs

engine-e-iq-io-report-cannot-serialise-row = řádek nelze serializovat: { $e }

## src/iq/io/resample.rs

engine-e-iq-io-resample-invalid-filter-design-passband-frac = neplatný návrh filtru { $design }: passband_frac v (0, 1), útlum > 0

engine-e-iq-io-resample-if-hz-must-lie-strictly = IF { $if_hz } Hz musí ležet přísně mezi 0 a polovinou vzorkovací frekvence ({ $v1 } Hz)

## src/iq/io/sdrx.rs

engine-e-iq-io-sdrx-sdrx-data = { "." }sdrx data: { $e }

engine-iq-io-sdrx-sdrx-bit-bits-sample = sdrx { $quantization }bitový { $enc } { $fmt } ({ $packed_bits } bitů/vzorek)

## src/iq/io/sigmf_stream.rs

engine-e-iq-io-sigmf-stream-unsupported-sigmf-core-datatype-supported = nepodporovaný SigMF core:datatype { $datatype }: podporované jsou ci8, cu8, ci16_le, ci16_be, cf32_le, cf32_be a reálné ri8, ru8, ri16_le, ri16_be, rf32_le, rf32_be

engine-e-iq-io-sigmf-stream-is-not-sigmf-core-datatype = { $datatype } není SigMF core:datatype

engine-e-iq-io-sigmf-stream-invalid-sigmf-metadata = neplatná metadata SigMF: { $e }

engine-e-iq-io-sigmf-stream-has-no-sigmf-core-datatype = { $format } nemá SigMF core:datatype; zapište jej jako raw

engine-e-iq-io-sigmf-stream-core-num-channels-does-not = { $name }: core:num_channels { $ch } neodpovídá hodnotě { $c0 } prvního záznamu

engine-e-iq-io-sigmf-stream-no-core-sample-rate = { $name }: chybí core:sample_rate

engine-e-iq-io-sigmf-stream-core-sample-rate-is-not = { $name }: core:sample_rate { $rate } není kladné

engine-e-iq-io-sigmf-stream-at-hz-does-not-match = { $name }: { $f } při { $rate } Hz neodpovídá hodnotě { $f0 } při { $r0 } Hz prvního záznamu

engine-e-iq-io-sigmf-stream-first-capture-does-not-start = { $name }: první zachycení nezačíná na hranici bajtu

engine-e-iq-io-sigmf-stream-channel-requested-the-recording-has = požadován kanál { $channel }; záznam má kanálů: { $channels } (kanály se číslují od 0)

engine-e-iq-io-sigmf-stream-invalid-sigmf-collection = neplatná kolekce SigMF: { $e }

engine-e-iq-io-sigmf-stream-sha-512-does-not-match = { $mp }: SHA-512 { $got } neodpovídá hodnotě { $h } v kolekci

## src/iq/io/stream.rs

engine-e-iq-io-stream-stream-of-interleaved-streams-does = proud { $select } z { $channels } prokládaných proudů neexistuje (proudy se číslují od 0)

engine-e-iq-io-stream-sample-of-does-not-start = vzorek { $k } formátu { $format } nezačíná na hranici bajtu

engine-e-iq-io-stream-time-window-start-duration-both = časové okno, začátek { $start_s } s, trvání { $duration_s } s: obojí musí být nezáporné

## src/iq/labfit/campaign.rs

engine-iq-labfit-campaign-most-damaging-stated-cw-no = nejškodlivější uvedené Q (cw): žádná tabulková hodnota pro typ `{ $event_type }`

engine-e-iq-labfit-campaign-the-campaign-is-not-complete = { $out_dir }: kampaň není úplná

engine-e-iq-labfit-campaign-digest-does-not-match-the = { $out_dir }: DIGEST { $on_disk } neodpovídá buňkám ({ $digest })

engine-e-iq-labfit-campaign-recording-test-conditions-hash-does = záznam `{ $id }`: otisk podmínek zkoušky { $h } neodpovídá zaznamenanému { $conditions_hash }

engine-e-iq-labfit-campaign-signal-unknown-chip-rate = signál `{ $signal }`: neznámá čipová frekvence

## src/iq/labfit/fit.rs

engine-e-iq-labfit-fit-no-run-is-usable-for = žádný běh není použitelný pro proložení uzamčení: { $v1 }

## src/iq/labfit/iqfit.rs

engine-iq-labfit-iqfit-insufficient-data-not-fitted-recordings = nedostatek dat: neproloženo (záznamů: { $m }; je třeba alespoň { $min_rec })

engine-iq-labfit-iqfit-uncensored-span-db-is-under = necenzurovaný rozsah J/S { $span_db } dB je pod { $v2 } dB

engine-iq-labfit-iqfit-eff-and-delta-are-not = Q_eff a delta nelze identifikovat odděleně (|corr| { $full } >= { $v2 }): model závisí pouze na delta - 10 log10 Q_eff

engine-e-iq-labfit-iqfit-unknown-mode-only-validation = neznámý režim `{ $m }` (pouze `validation`)

engine-e-iq-labfit-iqfit-validation-pi90-coverage-must-be = validation.pi90_coverage musí být [lower, upper] v rozmezí [0, 1]

engine-e-iq-labfit-iqfit-campaign-fit-bounds-must-be = campaign_fit.q_bounds musí být [lower, upper] s 0 < lower < upper

engine-e-iq-labfit-iqfit-campaign-fit-delta-bounds-db = campaign_fit.delta_bounds_db musí být [lower, upper]

engine-e-iq-labfit-iqfit-the-campaign-has-no-event = kampaň neobsahuje žádnou událost s uvedeným profilem výkonu, kterou by bylo možné proložit

## src/iq/labfit/iqreport.rs

engine-iq-labfit-iqreport-lab-fit-from-iq-campaign =
    # Laboratorní proložení z kampaně IQ: { $r }

    Schéma `{ $schema }`, engine { $engine_version }. Označení: **{ $label }**.

    { $statement }

    { $advisory }{ "\u000A\u000A" }

engine-iq-labfit-iqreport-campaign-digest-campaign-json-sha = DIGEST kampaně `{ $campaign_digest }`; SHA-256 souboru `campaign.json` `{ $campaign_json_sha256 }`; SHA-256 scénáře `{ $scenario_sha256 }`; buněk: { $cells }; replikací bootstrapu: { $bootstrap } (seed { $seed }).{ "\u000A\u000A" }

engine-iq-labfit-iqreport-unit-status-recordings-satellites-events =
    ## Jednotka { $i }: { $signal } / { $name } / { $name2 } / { $jammer_type }

    Stav: { $status }. Záznamů: { $recordings }, družic: { $satellites }, událostí: { $events }; proložených binů: { $bins_used }, cenzurovaných: { $bins_censored }.{ "\u000A\u000A" }

engine-iq-labfit-iqreport-n0-model-delta-eff-db = Model C/N0 ({ $q_mode }): `delta_eff` = { $ci } dB (identifikovatelný posun, vztažený k Q = 1); `Q_eff` = { $q }; `delta` při tomto Q = { $ci2 } dB; corr(Q, delta) { $om }; reziduální RMS { $residual_rms_db } dB v rozsahu J/S { $span_db } dB. Q_eff nelze z dat C/N0 identifikovat bez nezávislého měření výkonu.{ "\u000A\u000A" }

engine-iq-labfit-iqreport-held-at-its-stated-value = Q ponecháno na uvedené hodnotě: { $why }.{ "\u000A\u000A" }

engine-iq-labfit-iqreport-hold-out-leave-one-recording = Hold-out (vynechání jednoho záznamu), interpolace: binů { $bins }, RMS C/N0 { $om } dB, pokrytí PI90 { $om2 }

engine-iq-labfit-iqreport-validation-table-sha-256-registered =
    SHA-256 validační tabulky `{ $table_sha256 }` (registrováno { $registered }):

    | práh | limit | hodnota | verdikt |
    |---|---|---|---|{ "\u000A" }

## src/iq/labfit/mod.rs

engine-iq-labfit-run-log = záznam běhu `{ $label }`

engine-e-iq-labfit-run = běh `{ $label }`: { $e }

engine-e-iq-labfit-the-scenario-input-names-no = [input] scénáře nepojmenovává žádnou kampaň

engine-e-iq-labfit-input-campaign-and-runs-are = { "[" }input] campaign a [[runs]] se vylučují: zadejte jedno

engine-e-iq-labfit-iq-labfit-scenario = scénář iq-labfit: { $e }

## src/iq/labfit/observe.rs

engine-iq-labfit-observe-the-log-carries-no-per = záznam neobsahuje C/N0 jednotlivých družic{ $cfg } (observables: [{ $observables }])

engine-iq-labfit-observe-no-epoch-before-the-onset = žádná epocha před počátkem v { $onset } s

engine-iq-labfit-observe-no-epoch-at-or-after = žádná epocha v počátku v { $onset } s ani po něm

## src/iq/labfit/report.rs

engine-iq-labfit-report-lab-fit-label-settings-sha =
    # Laboratorní proložení: { $r }

    Označení: **{ $label }**. SHA-256 nastavení `{ $settings_sha256 }`.{ "\u000A\u000A" }

engine-iq-labfit-report-model-parameter-value-bounds-at =
    { "\u000A" }## Model: { $model } ({ $label })

    | parametr | hodnota | meze | na mezi | směrodatná odchylka bootstrapu (95 %) |
    |---|---|---|---|---|{ "\u000A" }

engine-iq-labfit-report-hold-out-folds-all-interpolation =
    { "\u000A" }Hold-out ({ $scheme }, { $folds } dílů): vše { $om } s, interpolace { $om2 } s, extrapolace { $om3 } s.

    | vynechaný běh | třída | vzdálenost | nejbližší trénovací běh | RMS s |
    |---|---|---|---|---|{ "\u000A" }

## src/iq/lunanet_afs.rs

engine-iq-lunanet-afs-fid-is-reserved-for-future = FID { $fid } je vyhrazeno pro budoucí použití (definováno je pouze FID 0)

engine-iq-lunanet-afs-toi-is-outside-99 = TOI { $toi } je mimo 0..=99

engine-iq-lunanet-afs-sb1-symbol-disagree-with-the = symbolů SB1 nesouhlasících s dekódovaným polem: { $sb1_err }

engine-iq-lunanet-afs-frames-at-and-are-symbols = rámce v { $w } a { $w2 } jsou od sebe { $gap } symbolů, nikoli { $FRAME_SYMBOLS }

engine-iq-lunanet-afs-toi-follows-toi-expected = TOI { $w } následuje po TOI { $w2 }, očekáváno { $want }

engine-e-iq-lunanet-afs-unexpected-character-in-symbol-stream = neočekávaný znak { $c } v proudu symbolů (pouze 0, 1 a mezery)

engine-iq-lunanet-afs-prn-first-24-chips-differ = { $name } PRN { $prn }: prvních 24 čipů se liší

engine-iq-lunanet-afs-prn-last-24-chips-differ = { $name } PRN { $prn }: posledních 24 čipů se liší

engine-iq-lunanet-afs-the-document-prints-a14850-for = { $miss } (dokument uvádí A14850 pro PRN 147 i PRN 151; generátor reprodukuje hodnotu PRN 151, takže položka PRN 147 je nejspíše překlep v dokumentu)

engine-iq-lunanet-afs-encoded-0x-decoded-fid-toi = zakódováno 0x{ $word }, dekódováno FID { $fid } TOI { $toi }

## src/iq/monitor/run.rs

engine-e-iq-monitor-run-monitor-settings = nastavení monitoru: { $e }

## src/iq/scene/geometry.rs

engine-e-iq-scene-geometry-static-position-not-finite = statická poloha není konečná

engine-e-iq-scene-geometry-constant-velocity-trajectory-not-finite = trajektorie s konstantní rychlostí není konečná

engine-e-iq-scene-geometry-waypoint-trajectory-has-no-waypoints = trajektorie bodů trasy neobsahuje žádné body trasy

engine-e-iq-scene-geometry-waypoint-not-finite = bod trasy není konečný

engine-e-iq-scene-geometry-waypoint-times-must-increase-strictly = časy bodů trasy musí striktně růst

## src/iq/scene/mod.rs

engine-e-iq-scene-prn-is-not-gps-prn = PRN { $prn } není PRN GPS C/A

engine-e-iq-scene-ephemeris-system-is-not-gps = systém efemerid { $system } není GPS

engine-e-iq-scene-satellite = družice { $value }: { $e }

## src/iq/scene/nav.rs

engine-e-iq-scene-nav-is-pilot-data-free-component = je pilotní složka (bez dat) a nenese žádná navigační data

engine-e-iq-scene-nav-carries-data-the-scene-does = nese data, která scéna nemodeluje; vygenerujte ji bez dat

engine-e-iq-scene-nav-does-not-carry-gps-lnav = nenese GPS LNAV (pouze GPS L1 C/A); použijte data ze seedu

engine-e-iq-scene-nav-not-an-lnav-source = není zdrojem LNAV

## src/iq/scene/synthetic.rs

engine-e-iq-scene-synthetic-scene-needs-at-least-one = scéna vyžaduje alespoň jednu družici (--prn)

engine-e-iq-scene-synthetic-doppler-lists-value-give-one = --doppler uvádí hodnot: { $dopplers }; zadejte jednu na každé --prn ({ $ids }) nebo jedinou hodnotu

## src/iq/scene/truth.rs

engine-e-iq-scene-truth-truth-row-has-fields-expected = řádek reference má polí: { $f }, očekáváno: 10

engine-e-iq-scene-truth-truth-field = pole reference { $i }: { $e }

engine-e-iq-scene-truth-truth-sat-id = sat_id reference: { $e }

## src/iq/short.rs

engine-e-iq-short-fs-hz-must-be-positive = fs_hz musí být kladné číslo

engine-e-iq-short-duration-must-be-in = duration_s musí ležet v (0, { $MAX_DURATION_S }]

engine-e-iq-short-ids-must-hold-to-satellites = ids musí obsahovat 1 až { $MAX_SATELLITES } družic

engine-e-iq-short-dopplers-must-be-finite = dopplers musí být konečné

## src/iq/signals/by_name.rs

engine-e-iq-signals-by-name-prn-is-out-of-range = { $signal }: PRN { $id } je mimo rozsah

engine-e-iq-signals-by-name-glonass-l1of-frequency-channel-is = frekvenční kanál GLONASS L1OF { $id } je mimo -7..=6

engine-e-iq-signals-by-name-unknown-signal-expected-one-of = neznámý signál { $other }; očekáváno jedno z: { $signal_names }

## src/iq/signals/galileo.rs

engine-e-iq-signals-galileo-line-no = řádek { $v1 }: chybí ';'

engine-e-iq-signals-galileo-line-no-code-number-in = řádek { $v1 }: chybí číslo kódu v { $label }

engine-e-iq-signals-galileo-code-appears-twice = kód { $number } se vyskytuje dvakrát

## src/iq/signals/lunanet.rs

engine-iq-signals-lunanet-lunanet-afs-primary-tertiary = LunaNet AFS-Q primární { $primary_prn } S{ $secondary } terciární { $t }

engine-iq-signals-lunanet-lunanet-afs-primary-tertiary-omitted = LunaNet AFS-Q primární { $primary_prn } S{ $secondary } (terciární vynechán)

## src/iq/signals/mod.rs

engine-e-iq-signals-non-hex-character = nehexadecimální znak { $c }

engine-e-iq-signals-hex-symbols-cannot-hold-exactly = { $hex } hexadecimálních symbolů nemůže pojmout přesně { $len } čipů

engine-iq-signals-primary-only = { $name } (pouze primární)

## src/iq/track/boc.rs

engine-e-iq-track-boc-boc-tracking-needs-an-early = sledování BOC vyžaduje rozestup early-late v (0, { $max }) čipech, aby E a L zůstaly na hlavním vrcholu (zadáno: { $spacing_chips })

engine-e-iq-track-boc-bump-jump-threshold-must-be = práh bump-jump musí být alespoň 1

## src/iq/track/channel.rs

engine-e-iq-track-channel-sample-rate-must-be-positive = vzorkovací frekvence musí být kladná

engine-e-iq-track-channel-coherent-periods-must-be-positive = coherent_periods musí být kladné

engine-e-iq-track-channel-cn0-windows-must-be-positive = cn0_windows musí být kladné

engine-e-iq-track-channel-coherent-periods-must-divide-the = coherent_periods { $coherent_periods } musí dělit délku bitu { $ppb }

engine-e-iq-track-channel-at-most-extra-taps-are = je podporováno nejvýše { $MAX_EXTRA_TAPS } přídavných odboček (zadáno: { $extra_taps_chips }{ $v2 })

engine-e-iq-track-channel-extra-tap-offsets-must-be = posuny přídavných odboček musí být konečné a v rozmezí ±{ $MAX_TAP_OFFSET_CHIPS } čipů (zadáno: { $t })

engine-e-iq-track-channel-n0-window-needs-at-least = okno C/N0 vyžaduje alespoň 2 prompty

## src/iq/track/design.rs

engine-e-iq-track-design-carrier-pll-discriminator-expected-atan2 = carrier.pll_discriminator { $o }: očekáváno atan2, costas-atan nebo costas-decision-directed

engine-e-iq-track-design-carrier-fll-discriminator-expected-cross = carrier.fll_discriminator { $o }: očekáváno cross-product, atan2 nebo atan2-pilot

engine-e-iq-track-design-carrier-fll-assist-expected-pull = carrier.fll_assist { $o }: očekáváno pull-in nebo always

engine-e-iq-track-design-code-discriminator-expected-eml-power = code.discriminator { $o }: očekáváno eml-power, dot-product nebo eml-envelope

engine-iq-track-design-carrier-kind-expected-pll-fll = carrier.kind { $k }: očekáváno pll, fll nebo fll-assisted-pll

engine-iq-track-design-carrier-does-not-apply-to = carrier.{ $key } se nevztahuje na carrier.kind = { $kind }

engine-iq-track-design-carrier-bn-max-expected-number = carrier.bn_t_max { $v }: očekáváno číslo >= 0 (0 vypíná omezení)

engine-e-iq-track-design-must-be-positive-number-got = { $k } musí být kladné číslo (zadáno: { $v })

engine-e-iq-track-design-integration-coherent-periods-must-be = integration.coherent_periods musí být alespoň 1

engine-e-iq-track-design-integration-spacing-chips-must-lie = integration.spacing_chips musí ležet v (0, 2] (zadáno: { $d })

engine-e-iq-track-design-integration-extra-taps-chips-holds = integration.extra_taps_chips obsahuje nejvýše { $MAX_EXTRA_TAPS } posunů (zadáno: { $taps })

engine-e-iq-track-design-integration-extra-taps-chips-offsets = posuny integration.extra_taps_chips musí být konečné a v rozmezí ±{ $MAX_TAP_OFFSET_CHIPS } čipů (zadáno: { $t })

engine-e-iq-track-design-carrier-fll-on-pli-must = carrier.fll_on_pli ({ $on }) musí být pod carrier.fll_off_pli ({ $off }), obojí v (-1, 1]

engine-e-iq-track-design-carrier-fll-gate-dwell-must = carrier.fll_gate_dwell_s musí být nula nebo kladné (zadáno: { $t })

engine-e-iq-track-design-carrier-fll-pull-in-max = carrier.fll_pull_in_max_s musí být kladné (zadáno: { $t })

engine-e-iq-track-design-carrier-pll-order-must-be = carrier.pll_order musí být 1, 2 nebo 3 (zadáno: { $o })

engine-e-iq-track-design-carrier-fll-order-must-be = carrier.fll_order musí být 1 nebo 2 (zadáno: { $o })

engine-e-iq-track-design-code-order-must-be-or = code.order musí být 1 nebo 2 (zadáno: { $order })

engine-e-iq-track-design-lock-pli-threshold-must-lie = lock.pli_threshold musí ležet v [-1, 1] (zadáno: { $pli })

engine-e-iq-track-design-lock-cn0-windows-must-be = lock.cn0_windows musí být alespoň 1

engine-e-iq-track-design-lock-cn0-window-periods-must = lock.cn0_window_periods musí být alespoň 2

engine-e-iq-track-design-lock-reacq-max-interval-must = lock.reacq_max_interval_s ({ $reacq_max_interval_s }) nesmí být pod lock.reacq_interval_s ({ $reacq_interval_s })

engine-e-iq-track-design-lock-false-lock-margin-db = lock.false_lock_margin_db musí být konečné

engine-e-iq-track-design-bit-sync-min-votes-must = bit_sync.min_votes musí být alespoň 1

engine-e-iq-track-design-acquisition-coherent-periods-must-be = acquisition.coherent_periods musí být alespoň 1 (nebo "auto")

engine-e-iq-track-design-acquisition-noncoherent-must-be-at = acquisition.noncoherent musí být alespoň 1

engine-e-iq-track-design-acquisition-pfa-must-lie-in = acquisition.pfa musí ležet v (0, 1) (zadáno: { $pfa })

engine-e-iq-track-design-design-overrides = přepsání návrhu: { $e }

engine-e-iq-track-design-design-overrides-may-not-set = přepsání návrhu nesmí nastavovat name ani extends

engine-e-iq-track-design-loop-design-file = soubor loop-design: { $e }

engine-e-iq-track-design-loop-design-file-schema-is = soubor loop-design: schéma { $other } není podporováno; očekáváno { $SCHEMA }

engine-e-iq-track-design-loop-design-file-missing-schema = soubor loop-design: chybí schema = { $SCHEMA }

engine-e-iq-track-design-loop-design-file-no-design = soubor loop-design: žádné tabulky [[design]]

engine-e-iq-track-design-loop-design-file-design-number = soubor loop-design: [[design]] číslo { $v1 } nemá name

engine-e-iq-track-design-loop-design-file-design-name = soubor loop-design: název návrhu { $name } je vyhrazený nebo prázdný

engine-e-iq-track-design-loop-design-file-design-is = soubor loop-design: návrh { $name } je definován dvakrát

engine-e-iq-track-design-no-design-named-the-file = žádný návrh nazvaný { $n }; soubor obsahuje { $value }

engine-e-iq-track-design-loop-design-file-design-extends = soubor loop-design: návrh { $name } rozšiřuje sám sebe (cyklus)

engine-e-iq-track-design-loop-design-file-design-extends-2 = soubor loop-design: návrh { $name } rozšiřuje neznámý návrh { $parent }

## src/iq/track/filter.rs

engine-e-iq-track-filter-phase-loop-needs-order-and = fázová smyčka vyžaduje řád 1..=3 a Bn > 0 (zadáno: { $o }, { $bn })

engine-e-iq-track-filter-frequency-loop-needs-bn-got = frekvenční smyčka vyžaduje Bn > 0 (zadáno: { $bn })

engine-e-iq-track-filter-frequency-loop-order-must-be = řád frekvenční smyčky musí být 1 nebo 2 (zadáno: { $o })

engine-e-iq-track-filter-loop-filter-needs-phase-path = filtr smyčky vyžaduje fázovou větev, frekvenční větev, nebo obojí

## src/iq/track/mod.rs

engine-e-iq-track-early-late-spacing-must-lie = rozestup early-late musí ležet v (0, 2] čipech (zadáno: { $spacing_chips })

engine-e-iq-track-dll-order-must-be-or = řád DLL musí být 1 nebo 2 (zadáno: { $dll_order })

engine-e-iq-track-chip-rate-and-carrier-frequency = čipová frekvence a frekvence nosné musí být kladné

## src/iq/track/sink.rs

engine-e-iq-track-sink-an-epoch-carries-extra-taps = epocha nese přídavných odboček: { $extra }, ale výstup byl nastaven na { $n }: všechny kanály jednoho běhu musí používat stejné extra_taps_chips

engine-e-iq-track-sink-record-is-bytes-expected = záznam má { $b } B; očekáváno { $want }

engine-e-iq-track-sink-unknown-lock-state-code = neznámý kód stavu uzamčení { $b }

engine-e-iq-track-sink-epoch-file-header = hlavička souboru epoch: { $e }

engine-e-iq-track-sink-epoch-file-schema-expected = schéma souboru epoch { $schema }; očekáváno { $EPOCH_SCHEMA }

engine-e-iq-track-sink-epoch-file-records-are-bytes = záznamy souboru epoch mají { $record_bytes } B; tento čtecí program očekává { $want } ({ $BINARY_RECORD_BYTES } plus { $BINARY_TAP_BYTES } na každou přídavnou odbočku)

engine-e-iq-track-sink-epoch-file-ends-inside-record = soubor epoch končí uprostřed záznamu ({ $got } z { $size } B)

engine-e-iq-track-sink-epoch-format-expected-csv-jsonl = formát epoch { $o }: očekáváno csv, jsonl nebo bin

## src/jammertest/cli.rs

engine-e-jammertest-cli-is-not-number = { $name }: `{ $s }` není číslo

engine-e-jammertest-cli-is-not-utf-text = { $path } není text UTF-8

engine-e-jammertest-cli-needs-catalog = vyžaduje --catalog

engine-e-jammertest-cli-needs-at-least-one-plan = vyžaduje alespoň jedno --plan

engine-e-jammertest-cli-is-not-utf = { $cat } není UTF-8

engine-e-jammertest-cli-is-not-utf-2 = { $p } není UTF-8

engine-e-jammertest-cli-format-is-not-one-of = --format: `{ $s }` není jedno z ubx, rinex, android, nmea

engine-e-jammertest-cli-log-start-is-not-utc = --log-start `{ $t }` není UTC ISO-8601

engine-e-jammertest-cli-needs-log-start-or-log = vyžaduje --log-start nebo --log s --format

engine-e-jammertest-cli-log-needs-format = --log vyžaduje --format

engine-e-jammertest-cli-the-log-does-not-state = záznam neuvádí svůj počátek: použijte --log-start

engine-e-jammertest-cli-the-log-states-its-start = záznam uvádí svůj počátek jako `{ $label }`: použijte --log-start

engine-e-jammertest-cli-is-not-utf-3 = { $a } není UTF-8

engine-e-jammertest-cli-cannot-write = nelze zapsat { $o }: { $e }

engine-jammertest-cli-events-written-to-non-rf = { $events } { $SCHEDULED_TRUTH } událostí zapsáno do { $o } (přeskočeno slotů mimo RF: { $skipped_non_rf }, mimo záznam: { $outside_log }, id mimo katalog: { $unknown_ids })

engine-jammertest-cli-note-ids-not-in-the = poznámka: id mimo katalog: { $unknown_ids }

engine-jammertest-cli-note-these-are-the-plan = poznámka: jde o plánované sloty plánu, nikoli o zaznamenané časy vysílání.

engine-jammertest-cli-test-name = { $v1 } { $v2 } { $v3 } { $v4 } { $v5 } { $v6 } { $v7 }  název testu

## src/jammertest/cli.rs

engine-jammertest-cli-tests-evaluable-detected-within-tolerance = testů: { $tests }, vyhodnotitelných: { $evaluable }: detekováno v toleranci: { $detected }, pozdě: { $late }, nezachyceno: { $missed }; medián latence { $fmt_opt }, medián doby do obnovy { $fmt_opt2 }

engine-jammertest-cli-false-alarms-outside-every-slot = falešné poplachy mimo všechny sloty: běhů: { $false_alarm_runs }, epoch: { $false_alarm_epochs } z { $clean_epochs } čistých

engine-e-jammertest-cli-needs-session-path = vyžaduje cestu k relaci

engine-e-jammertest-cli-needs-catalog-and-plan-or = vyžaduje --catalog a --plan, nebo --attack-log

engine-jammertest-cli-evidence-pack-written-to-signer = balíček důkazů zapsán do { $out }; otisk podepisujícího { $signer_fingerprint }

## src/jammertest/dataset.rs

engine-e-jammertest-dataset-no-folder-with-scenario-json = v { $root } není žádná složka se souborem scenario.json a souborem .ubx

engine-e-jammertest-dataset-scenario = scénář: { $e }

engine-e-jammertest-dataset-read = čtení: { $e }

engine-e-jammertest-dataset-scenario-json-has-no-date = scenario.json neobsahuje datum

engine-e-jammertest-dataset-scenario-json-date-is-not = datum `{ $date }` v scenario.json není datum

engine-e-jammertest-dataset-no-readable-epoch-in-mon = v mon_rf.csv ani rinex.csv není žádná čitelná epocha

engine-e-jammertest-dataset-no-folder-with-scenario-json-2 = v { $root } není žádná složka se souborem scenario.json

engine-jammertest-dataset-recovered-of-median = { $f2 } obnoveno ({ $recovered } z { $alarmed }), medián { $f22 } s

## src/jammertest/mod.rs

engine-e-jammertest-the-log-states-its-start = záznam uvádí svůj počátek jako `{ $l }`, což není UTC ISO-8601: zadejte počátek výslovně

engine-e-jammertest-the-log-does-not-state = záznam neuvádí svůj počátek: zadejte jej výslovně

## src/jammertest/plan.rs

engine-e-jammertest-plan-catalogue-is-not-json = katalog není JSON: { $e }

engine-e-jammertest-plan-catalogue-has-no-test-types = katalog neobsahuje pole `test_types`

engine-e-jammertest-plan-test-type-has-no-type = typ testu nemá `type_id`

engine-e-jammertest-plan-test-group-has-no-group = skupina testů nemá `group_id`

engine-e-jammertest-plan-test-has-no-test-id = test nemá `test_id`

engine-e-jammertest-plan-catalogue-lists-no-tests = katalog neuvádí žádné testy

engine-e-jammertest-plan-is-not-plan-time-like = `{ $text }` není čas plánu ve tvaru 2025-09-15T14:00:00

engine-e-jammertest-plan-plan-is-not-json = plán není JSON: { $e }

engine-e-jammertest-plan-plan-has-no-locations-array = plán neobsahuje pole `locations`

engine-e-jammertest-plan-test-end-time-is-not = test { $id }: end_time není po start_time

engine-e-jammertest-plan-the-plan-has-no-test = plán nemá zkušební oblast { $l }; má: { $areas }

engine-e-jammertest-plan-the-plan-has-several-test = plán má několik zkušebních oblastí { $areas }; uveďte, ve které byl záznam pořízen

engine-e-jammertest-plan-scenario-json-is-not-json = scenario.json není JSON: { $e }

engine-e-jammertest-plan-no-attack-log-array = chybí pole `attack_log`

engine-jammertest-plan-jammertest-2024-test-window = { $SCHEDULED_TRUTH }: Jammertest 2024, test { $id }, okno { $n } ({ $attack })

engine-e-jammertest-plan-the-attack-log-holds-no = attack_log neobsahuje žádné okno začátek/konec

## src/jammertest/score.rs

engine-e-jammertest-score-scheduled-events-but-the-run = naplánovaných událostí: { $events }, ale běh vyhodnotil: { $events2 }: předejte vlastní události běhu

engine-e-jammertest-score-recover-hold-must-be-positive = recover_hold_s musí být kladné a guard_s nezáporné

## src/jamming.rs

engine-e-jamming-crpa-elements-enu-must-list = crpa.elements_enu_m musí uvádět alespoň jeden prvek

engine-e-jamming-crpa-elements-enu-must-be = crpa.elements_enu_m musí být konečné

engine-e-jamming-crpa-weighting-expected-null-steering = crpa.weighting { $weighting }: očekáváno "null-steering" nebo "mvdr"

engine-e-jamming-crpa-bandwidth-mhz-must-be = crpa.bandwidth_mhz musí být kladné (zadáno: { $b })

engine-e-jamming-terrain-the-section-needs-jammer = terrain: sekce vyžaduje [jammer]

## src/jamming_rx.rs

engine-e-jamming-rx-acquisition-acquisition-threshold-dbhz-must = acquisition.acquisition_threshold_dbhz ({ $acquisition_threshold_dbhz }) musí být konečné a rovno nebo vyšší než tracking_threshold_dbhz ({ $tracking_threshold_dbhz })

engine-e-jamming-rx-acquisition-reacquisition-delay-must-be = acquisition.reacquisition_delay_s musí být konečné a nezáporné (zadáno: { $reacquisition_delay_s })

engine-e-jamming-rx-front-end-adc-bits-must = front_end.adc_bits musí být 1 až 16 (zadáno: { $adc_bits })

engine-e-jamming-rx-front-end-bandwidth-mhz-must = front_end.bandwidth_mhz musí být kladné (zadáno: { $b })

## src/jamming_terrain.rs

engine-e-jamming-terrain-terrain-samples-per-side-must = terrain.samples_per_side musí být alespoň 2 (zadáno: { $samples_per_side })

engine-e-jamming-terrain-terrain-must-be-finite-got = terrain.{ $name } musí být konečné (zadáno: { $v })

engine-e-jamming-terrain-terrain-must-be-positive-got = terrain.{ $name } musí být kladné (zadáno: { $v })

engine-e-jamming-terrain-terrain-dem-hgt = terrain.dem_hgt { $dem_hgt }: { $e }

engine-e-jamming-terrain-terrain-profile-point-is-outside = terrain: bod profilu { $points } ({ $lat }, { $lon }) leží mimo dlaždici DEM

engine-e-jamming-terrain-terrain-profile-point-is-on = terrain: bod profilu { $points } ({ $lat }, { $lon }) leží na prázdném místě DEM

## src/jd2.rs

engine-e-jd2-utc-calendar-date-out-of = kalendářní datum UTC mimo rozsah: { $year }-{ $month }-{ $day } { $hour }:{ $minute }

engine-e-jd2-no-such-calendar-date = takové kalendářní datum neexistuje: { $year }-{ $month }-{ $day }

engine-e-jd2-utc-second-out-of-range = sekunda UTC { $second } mimo rozsah v { $hour }:{ $minute }

## src/launch.rs

engine-e-launch-launch-site-at-the-pole = místo startu na pólu nemá definovaný azimut

engine-e-launch-inclination-unreachable-from-latitude-without = sklon { $inclination_rad }° je z šířky { $lat_rad }° nedosažitelný bez dogleg manévru (je třeba |lat| ≤ i ≤ 180−|lat|)

engine-e-launch-the-true-pole-site-speed = rychlost místa na skutečném pólu vyžaduje `epoch` i `eop_finals2000a` (skutečné tělo IERS finals2000A)

engine-e-launch-site-lon-deg-must-be = site_lon_deg musí ležet v [-180, 360]

engine-e-launch-eop-finals2000a-contained-no-readable = eop_finals2000a neobsahovalo žádné čitelné řádky IERS finals2000A

engine-e-launch-epoch-mjd-is-outside-the = epocha { $epoch } (MJD { $mjd_utc }) je mimo dodané řádky EOP (MJD { $mjd } až { $mjd2 })

engine-e-launch-site-lat-deg-must-be = site_lat_deg musí ležet v [-90, 90]

engine-e-launch-target-inclination-deg-must-be = target_inclination_deg musí ležet v [0, 180]

engine-launch-launch-window-lat-az-asc = okno startu: šířka { $site_lat_deg }° -> i { $target_inclination_deg }°: Az { $asc }° vzestupně, v_circ { $v_orbit } m/s, +{ $site_rotation_speed } m/s bonus rotace Země, příležitostí za den: { $opportunities } (MODELLED)

## src/leo_fusion/doppler.rs

engine-e-leo-fusion-doppler-every-range-rate-needs-positive = každá rychlost změny vzdálenosti vyžaduje kladné konečné sigma

engine-e-leo-fusion-doppler-measurements-cannot-resolve-doppler-unknowns = měření ({ $n_meas }) nestačí k určení neznámých Dopplera ({ $n })

engine-e-leo-fusion-doppler-the-doppler-geometry-is-singular = geometrie Dopplera je singulární

engine-e-leo-fusion-doppler-no-covariance = žádná kovariance

## src/leo_fusion/joint_pvt.rs

engine-e-leo-fusion-joint-pvt-every-pseudorange-needs-positive-finite = každá pseudovzdálenost vyžaduje kladné konečné sigma

engine-e-leo-fusion-joint-pvt-pseudoranges-cannot-resolve-unknowns-position = pseudovzdáleností ({ $obs }) nestačí k určení neznámých ({ $n }): 3 polohové + hodin: { $n_clock }

engine-e-leo-fusion-joint-pvt-satellite-coincides-with-the-position = družice splývá s odhadem polohy

engine-e-leo-fusion-joint-pvt-the-geometry-is-singular = geometrie je singulární

engine-e-leo-fusion-joint-pvt-no-iteration-ran = neproběhla žádná iterace

engine-e-leo-fusion-joint-pvt-degenerate-final-geometry = degenerovaná konečná geometrie

engine-e-leo-fusion-joint-pvt-the-dop-is-not-finite = DOP není konečný

## src/leo_fusion/ntn.rs

engine-e-leo-fusion-ntn-must-be-positive = { $w } musí být kladné

engine-e-leo-fusion-ntn-sync-error-must-be-non = sync_error_m musí být nezáporné a běh nejvýše 5000 epoch

engine-e-leo-fusion-ntn-every-signal-needs-positive-bandwidth = každý signál vyžaduje kladnou šířku pásma

engine-leo-fusion-ntn-khz-crb-range-to-median = { "  " }{ $name }: { $s } kHz, rozsah CRB { $range_sigma_zenith_m } až { $range_sigma_mask_m } m; medián formální 3D { $s2 } m, chyba RMS { $s3 } m{ "\u000A" }

engine-leo-fusion-ntn-mhz-n0-db-hz-modelled = { $r } MHz · C/N0 { $r2 }-{ $r3 } dB-Hz · MODELLED

## src/leo_fusion/ppp.rs

engine-e-leo-fusion-ppp-ppp-needs-at-least-one = PPP vyžaduje alespoň jeden systém

engine-e-leo-fusion-ppp-duration-and-step-must-be = trvání a krok musí být kladné, nejvýše 20000 epoch

engine-e-leo-fusion-ppp-runs-must-be-to-200 = počet běhů musí být 1 až 200

engine-e-leo-fusion-ppp-convergence-thresholds-must-be-positive = prahy konvergence musí být kladné

engine-leo-fusion-ppp-leo-median-min-converged-nees = { "  " }{ $name } LEO: { $n_leo }  medián { $c } min  konvergovalo { $v4 }%  NEES průměr { $nees_mean }{ "\u000A" }

engine-leo-fusion-ppp-median-horizontal-error-across-runs = medián horizontální chyby přes běhy: { $runs_per_case } · MODELLED

## src/leo_fusion/presets/mod.rs

engine-e-leo-fusion-presets-preset-carries-no-signal = předvolba { $id } nenese žádný signál

engine-e-leo-fusion-presets-preset-has-no-signal-it = předvolba { $id } nemá signál { $n }; má: { $value }

engine-e-leo-fusion-presets-unknown-leo-preset-known = neznámá předvolba LEO { $id }; známé: { $all }

## src/leo_fusion/pvt_kind.rs

engine-e-leo-fusion-pvt-kind-duration-and-step-must-be = duration_s a step_s musí být kladné, nejvýše 20000 epoch

engine-e-leo-fusion-pvt-kind-polar-steps-must-be-positive = polární kroky musí být kladné

engine-e-leo-fusion-pvt-kind-mode-must-be-doppler-joint = mode musí být doppler, joint, polar nebo timing; zadáno: { $m }

engine-e-leo-fusion-pvt-kind-doppler-mode-needs-at-least = režim doppler vyžaduje alespoň jeden systém LEO

engine-e-leo-fusion-pvt-kind-timing-mode-needs-leo-system = režim timing vyžaduje systém LEO s kódovým určováním vzdálenosti

engine-e-leo-fusion-pvt-kind-unknown-clock-class = neznámá třída hodin { $c }

engine-leo-fusion-pvt-kind-leo-pvt-at-over = LEO PVT ({ $mode }) v { $user_lat_deg }, { $user_lon_deg } za { $duration_s } s{ "\u000A" }

engine-leo-fusion-pvt-kind-overhead-pass-max-doppler-hz = { "  " }{ $system } přelet nad hlavou: max. Doppler { $max_doppler_hz } Hz, rychlost { $max_doppler_rate_hz_s } Hz/s, ryv { $max_doppler_jerk_hz_s2 } Hz/s^2{ "\u000A" }

engine-leo-fusion-pvt-kind-leo-ranging-satellite-in-view = { "  " }družice LEO s určováním vzdálenosti ve výhledu v { $v1 }% epoch{ "\u000A" }

engine-leo-fusion-pvt-kind-availability-median-pdop-rms-3d = { "  " }{ $n } dostupnost { $availability }, medián PDOP { $f }, chyba RMS 3D { $f2 } m{ "\u000A" }

engine-leo-fusion-pvt-kind-lat-vdop-gnss-leo-fused = { "  " }šířka { $lat_deg }: VDOP GNSS { $f } LEO { $f2 } sloučeno { $f3 }; ve výhledu { $mean_in_view }/{ $mean_in_view2 }{ "\u000A" }

engine-leo-fusion-pvt-kind-n0-db-rms-ns-95 = { "  " }{ $clock } C/N0 { $cn0_offset_db } dB: RMS { $row } ns, 95% { $row2 } ns, max { $row3 } ns (ve výhledu { $fraction_in_view }){ "\u000A" }

engine-leo-fusion-pvt-kind-leo-pvt-mode = LEO PVT — režim { $mode }

## src/leo_fusion/system.rs

engine-e-leo-fusion-system-system-role-must-be-gnss = systém { $name }: role musí být gnss nebo leo, zadáno: { $r }

engine-e-leo-fusion-system-system-clock-must-be-estimated = systém { $name }: clock musí být estimated nebo known, zadáno: { $c }

engine-e-leo-fusion-system-system-must-be-positive = systém { $name }: { $what } musí být kladné

engine-e-leo-fusion-system-system-mask-deg-must-be = systém { $name }: mask_deg musí ležet v [0, 90)

engine-e-leo-fusion-system-system-sigma-pr-must-be = systém { $name }: sigma_pr_m musí být kladné

engine-e-leo-fusion-system-give-at-least-one-system = zadejte alespoň jeden [[system]]

## src/leo_fusion/timing.rs

engine-e-leo-fusion-timing-the-epoch-spacing-must-be = rozestup epoch musí být kladný

engine-e-leo-fusion-timing-no-epochs = žádné epochy

engine-e-leo-fusion-timing-no-satellite-was-ever-in = žádná družice nebyla nikdy ve výhledu: přijímač nikdy nezískal čas

## src/leo_link/antenna.rs

engine-e-leo-link-antenna-polarisation-must-be-rhcp-lhcp = polarizace musí být rhcp, lhcp nebo linear; zadáno '{ $o }'

## src/leo_link/geometry.rs

engine-e-leo-link-geometry-sgp4-error-code-at = chybový kód SGP4 { $code } v t = { $t } s

engine-e-leo-link-geometry-an-orbit-inclined-deg-never = dráha se sklonem { $inc } deg nikdy neprochází nad šířkou { $phi } deg

engine-e-leo-link-geometry-the-requested-maximum-elevation-is = požadovaná maximální elevace je pod dosahem obzoru

## src/leo_link/itu.rs

engine-e-leo-link-itu-building-class-must-be-traditional = třída budovy musí být traditional nebo thermally-efficient; zadáno '{ $o }'

## src/leo_navmsg/codec.rs

engine-e-leo-navmsg-codec-field-is-not-finite = pole { $name } není konečné

engine-e-leo-navmsg-codec-field-is-outside-its-bit = pole { $name } = { $value } { $unit } je mimo svůj { $bits }bitový rozsah (|x| <= { $spec })

engine-e-leo-navmsg-codec-message-truncated = zpráva je zkrácená

engine-e-leo-navmsg-codec-field-list-exhausted = seznam polí vyčerpán

engine-e-leo-navmsg-codec-field-order-mismatch-vs = nesoulad pořadí polí: { $name } vs { $name2 }

engine-e-leo-navmsg-codec-svid-must-be-255 = SVID musí být 1-255

engine-e-leo-navmsg-codec-each-correction-polynomial-needs-coefficients = každý korekční polynom vyžaduje 1-8 koeficientů

engine-e-leo-navmsg-codec-correction-time-scale-must-be = časové měřítko korekce musí být mocnina dvou od 1 s do 32768 s; zadáno { $tau_s }

engine-e-leo-navmsg-codec-ecef-polynomial-needs-11-coefficients = polynom ECEF vyžaduje 1-11 koeficientů, stejně na každou osu

engine-e-leo-navmsg-codec-ecef-polynomial-degree-exceeds-10 = stupeň polynomu ECEF { $v1 } přesahuje 10

engine-e-leo-navmsg-codec-unknown-model-id = neznámé id modelu { $m }

engine-e-leo-navmsg-codec-payload-exceeds-4095-bytes = užitečné zatížení přesahuje 4095 B

engine-e-leo-navmsg-codec-frame-shorter-than-header-and = rámec je kratší než hlavička a CRC

engine-e-leo-navmsg-codec-bad-preamble-0x = chybná preambule 0x{ $frame }

engine-e-leo-navmsg-codec-unsupported-version = nepodporovaná verze { $version }

engine-e-leo-navmsg-codec-frame-length-does-not-match = délka rámce { $frame } neodpovídá deklarovanému užitečnému zatížení o { $len } B

engine-e-leo-navmsg-codec-crc-24q-mismatch-computed-0x = nesoulad CRC-24Q: vypočteno 0x{ $crc }, rámec nese 0x{ $got }

## src/leo_navmsg/fit.rs

engine-e-leo-navmsg-fit-rac-degrees-must-each-be = každé rac_degrees musí být nejvýše 7; zadáno { $rac_degrees }

engine-e-leo-navmsg-fit-poly-degree-must-be-10 = poly_degree musí být 1-10; zadáno { $poly_degree }

engine-e-leo-navmsg-fit-unknown-ephemeris-model-use-kepler16 = neznámý model efemerid '{ $other }': použijte kepler16, kepler-rac, liu22 nebo ecef-poly

engine-e-leo-navmsg-fit-fit-interval-must-be-at = interval proložení musí být alespoň 10 s; zadáno { $len }

engine-e-leo-navmsg-fit-fit-window-lies-outside-the = okno proložení [{ $t0 }, { $v1 }] s leží mimo referenční oblouk [0, { $truth }] s

engine-e-leo-navmsg-fit-ecef-polynomial-fit-is-singular = proložení polynomem ECEF je singulární (příliš málo vzorků pro daný stupeň)

engine-e-leo-navmsg-fit-clock-fit-is-singular = proložení hodin je singulární

engine-e-leo-navmsg-fit-keplerian-fit-diverged = keplerovské proložení divergovalo

## src/leo_navmsg/mod.rs

engine-leo-navmsg-unknown-preset-available = neznámá předvolba '{ $k }'; dostupné: { $keys }

engine-e-leo-navmsg-fit-interval-must-be-10 = fit_interval_s musí být 10-3600 s a update_period_s v (0, fit_interval_s]; zadáno { $fit_interval_s } a { $update_period_s }

engine-e-leo-navmsg-fit-sample-and-eval-step = fit_sample_s a eval_step_s musí být 0.5-60 s

engine-e-leo-navmsg-carrier-hz-must-exceed-10 = carrier_hz musí přesahovat 10 MHz; zadáno { $carrier_hz }

engine-e-leo-navmsg-svid-must-be-255 = svid musí být 1-255

engine-e-leo-navmsg-band-must-be-15-and = band musí být 0-15 a health 0-3

engine-e-leo-navmsg-unknown-csv-schema = neznámé csv_schema '{ $csv_schema }'

engine-e-leo-navmsg-analysis-must-name-at-least = analysis musí uvádět alespoň jednu analýzu

engine-e-leo-navmsg-unknown-analysis-use = neznámá analýza '{ $a }'; použijte { $analyses }

engine-e-leo-navmsg-kind-must-be-leo-navmsg = kind musí být leo-navmsg; zadáno { $k }

engine-e-leo-navmsg-mask-deg-must-be-in = mask_deg musí ležet v [0, 60); zadáno { $mask }

engine-leo-navmsg-leo-navigation-message-km-deg =
    Navigační zpráva LEO — { $res } km, { $res2 } deg, stupeň gravitace { $gravity_degree }, model { $res3 }
    { "  " }váhy SISRE: w_R { $w_r }, w_AC^2 1/{ $v6 } (maska { $mask } deg){ "\u000A" }

engine-e-leo-navmsg-trade-span-must-be-60 = trade.span_s musí být 60-86400 s

engine-e-leo-navmsg-trade-fit-intervals-must-be = trade.fit_intervals_s musí být neprázdné, každý 10-3600 s

engine-leo-navmsg-fit-interval-trade-over-usage = { "  " }srovnání intervalů proložení přes { $span } s (doba použití = interval proložení):{ "\u000A" }

engine-leo-navmsg-sisre-orbit-rms-max-with = { "    " }{ $model } { $fit_interval_s } s  SISRE dráhy RMS { $sisre_orb_rms_m } m  max { $sisre_orb_max_m } m  s hodinami RMS { $sisre_rms_m } m{ "\u000A" }

engine-e-leo-navmsg-comparison-fit-intervals-must-be = comparison.fit_intervals_s musí být neprázdné, každý 10-3600 s

engine-e-leo-navmsg-comparison-span-must-be-60 = comparison.span_s musí být 60-86400 s

engine-leo-navmsg-params-sisre-orbit-rms-with = { "    " }{ $kind } { $l } s  parametrů { $m0 }  SISRE dráhy RMS { $sisre_orb_rms_m } m  s hodinami { $sisre_rms_m } m{ "\u000A" }

engine-e-leo-navmsg-no-pass-above-deg-for = žádný přelet nad { $mask } deg pro uživatele v { $lat }, { $lon } do { $search } s; zvětšete midpass.search_s nebo přemístěte uživatele

engine-leo-navmsg-mid-pass-update-pass-max = { "  " }aktualizace uprostřed přeletu: přelet { $p0 }-{ $p1 } s (max. elevace { $pmax } deg), přepnutí: { $switches }, největší skok uživatelské vzdálenosti { $max_jump } m (geometrie nejhoršího případu { $max_worst } m) vs práh { $threshold } m: { $v8 }{ "\u000A" }

engine-leo-navmsg-encode-decode-model-frame-bytes =
    { "  " }kódování-dekódování: model { $m }, rámec { $frame } B (bitů užitečného zatížení { $payload_bits }, bitů efemerid+hodin { $eph_bits }), CRC-24Q 0x{ $hex }
    { "    " }kvantizace: největší změna polohy { $v6 } mm, hodin { $v7 } mm; SISRE přesně { $acc_exact } m, kvantizovaně { $acc_q } m
    { "    " }poškozený rámec odmítnut: { $corrupted_rejected }; okružní převod RINEX { $rin_dp } m; okružní převod CSV { $csv_dp }{ "\u000A" }

engine-e-leo-navmsg-comparison-liu-arcs-must-be = comparison.liu_arcs musí být 1-20

engine-leo-navmsg-km-kshana-published-ratio = { "    " }{ $name } { $alt } km  Kshana { $sisre_orb_rms_m } m  publikováno { $published } m  poměr { $st }{ "\u000A" }

engine-leo-navmsg-the-16-parameter-keplerian-set = 16parametrová keplerovská sada se zhoršuje z { $a } m při { $lo } s na { $b } m při { $hi } s: jedna keplerovská sada s harmonickými dvakrát za oběh nedokáže déle než několik minut sledovat gravitační členy s vyšší frekvencí a odpor prostředí na oblouku LEO a její reziduum metodou nejmenších čtverců kmitá napříč oknem. Polynomy ve směrech podél dráhy/napříč/radiálně, vyššího stupně, než kolik pokrývá keplerovská sada, pohltí zbytek a dávají { $c } m při { $hi } s.

engine-leo-navmsg-the-16-parameter-keplerian-set-2 = 16parametrová keplerovská sada přechází z { $a } m při { $lo } s na { $b } m při { $hi } s.

engine-leo-navmsg-km-deg-gravity-degree-representation = { $res } km, { $res2 } deg, stupeň gravitace { $gravity_degree } · chyba reprezentace vůči referenci · MODELLED

## src/leo_navmsg/tests.rs

engine-leo-navmsg-tests-is-the-host-library = { $v1 }: `{ $call }` patří knihovně hostitele

engine-leo-navmsg-tests-rand-distr-samplers-call-the = { $v1 }: vzorkovače `rand_distr` ve svých vzácných větvích volají `exp` a `ln` hostitele; použijte `portable_math::standard_normal`

engine-leo-navmsg-tests-acceleration-is-the-host-library = { $v1 }: `.acceleration(` je gravitační pole knihovny hostitele; použijte `.acceleration_portable(`

engine-leo-navmsg-tests-has-not-been-reviewed = { $v1 }: `{ $path }` nebyl zkontrolován

## src/leo_navmsg/text.rs

engine-e-leo-navmsg-text-no-end-of-header-line = chybí řádek END OF HEADER

engine-e-leo-navmsg-text-expected-eph-record-header-got = očekávána hlavička záznamu '> EPH', zadáno { $head }

engine-e-leo-navmsg-text-bad-satellite-id = chybné id družice { $parts }

engine-e-leo-navmsg-text-missing-epoch-line = chybí řádek epochy

engine-e-leo-navmsg-text-bad-epoch-line = chybný řádek epochy { $ep }

engine-e-leo-navmsg-text-bad-epoch-field-in = chybné pole epochy v { $ep }

engine-e-leo-navmsg-text-epoch-line-needs-three-clock = řádek epochy vyžaduje tři členy hodin: { $ep }

engine-e-leo-navmsg-text-record-truncated = záznam je zkrácený

engine-e-leo-navmsg-text-unknown-record-type = neznámý typ záznamu { $other }

engine-e-leo-navmsg-text-the-csv-table-carries-kepler16 = tabulka CSV nese zprávy kepler16 a kepler-rac; zadáno { $m }

engine-e-leo-navmsg-text-empty-csv = prázdný CSV

engine-e-leo-navmsg-text-row-has-cells-header = řádek má buněk: { $cells }, hlavička { $header }

engine-e-leo-navmsg-text-bad-number-in-column = chybné číslo { $c } ve sloupci { $k }

engine-e-leo-navmsg-text-csv-row-lacks = řádku CSV chybí { $k }

## src/leo_navmsg/truth.rs

engine-e-leo-navmsg-truth-orbit-altitude-must-be-between = výška dráhy musí být mezi 100 km a 3000 km; zadáno { $cfg } km

engine-e-leo-navmsg-truth-eccentricity-must-be-in-for = excentricita musí ležet v [0, 0.1) pro proložení LEO; zadáno { $eccentricity }

engine-e-leo-navmsg-truth-integration-step-must-be-in = integrační krok musí ležet v (0, 30] s; zadáno { $step_s }

engine-e-leo-navmsg-truth-duration-must-be-positive-with = trvání musí být kladné, nejvýše 200000 kroků; zadáno { $duration_s } s

engine-e-leo-navmsg-truth-gravity-degree-must-be-zonal = gravity_degree musí být 0, 2-6 (zonální) nebo 7-{ $v1 } (EGM2008); zadáno { $gravity_degree }

engine-e-leo-navmsg-truth-truth-propagation-diverged = propagace reference divergovala

engine-e-leo-navmsg-truth-truth-orbit-decayed-below-80 = referenční dráha klesla pod 80 km

engine-e-leo-navmsg-truth-node-spacing-must-be-in = rozestup uzlů musí ležet v (0, 60] s; zadáno { $step_s }

engine-e-leo-navmsg-truth-tabulated-truth-orbit-needs-at = tabelovaná referenční dráha vyžaduje alespoň dva stavy; zadáno { $states }

engine-e-leo-navmsg-truth-state-is-not-finite = stav { $k } není konečný

engine-e-leo-navmsg-truth-clock-adev-1s-must-be = adev_1s hodin musí ležet v [0, 1e-6); zadáno { $adev_1s }

engine-e-leo-navmsg-truth-measured-clock-is-built-with = měřené hodiny se vytvářejí pomocí TruthClock::from_samples

engine-e-leo-navmsg-truth-steered-clock-needs-sigma-in = řízené hodiny vyžadují sigma_s v [0, 1e-3) a tau_s > 0; zadáno { $sigma_s }, { $tau_s }

engine-e-leo-navmsg-truth-measured-clock-needs-positive-step = měřené hodiny vyžadují kladný krok a alespoň dva vzorky

engine-e-leo-navmsg-truth-measured-clock-sample-is-not = vzorek měřených hodin není konečný

## src/leo_pass.rs

engine-e-leo-pass-epoch-is-not-yyyy-mm = epocha '{ $s }' není ve tvaru YYYY-MM-DDTHH:MM:SS

engine-leo-pass-epoch-is-not-yyyy-mm = epocha '{ $s }' není ve tvaru YYYY-MM-DDTHH:MM:SS

engine-e-leo-pass-epoch-has-bad-seconds-field = epocha '{ $s }' má chybné pole sekund

engine-e-leo-pass-epoch-is-out-of-range = epocha '{ $s }' je mimo rozsah

engine-e-leo-pass-band-unknown-signal-design-public = pásmo '{ $name }': neznámý návrh signálu '{ $n }'; veřejné návrhy: { $v2 }

engine-e-leo-pass-band-is-not-in-the = pásmo '{ $name }' není v předvolbě systému: zadejte frequency_mhz a eirp_dbw

engine-e-leo-pass-band-needs-eirp-dbw = pásmo '{ $name }' vyžaduje eirp_dbw

engine-e-leo-pass-pattern-must-be-isoflux-gaussian = pattern musí být isoflux, gaussian nebo flat; zadáno '{ $o }'

engine-e-leo-pass-band-frequency-out-of-range = frekvence pásma '{ $name }' je mimo rozsah

engine-leo-pass-overridden-in-the-scenario = { $source } (přepsáno ve scénáři)

engine-e-leo-pass-system-has-no-band = systém '{ $id }' nemá pásmo '{ $n }'

engine-e-leo-pass-leo-satellite-needs-at-least = družice LEO vyžaduje alespoň jedno pásmo

engine-e-leo-pass-at-most-12-bands-per = nejvýše 12 pásem na družici

engine-leo-pass-unknown-system-presets-in-this = neznámý systém '{ $n }'; předvolby v tomto sestavení: { $ids }

engine-e-leo-pass-no-sun-synchronous-orbit-at = žádná slunečně synchronní dráha ve výšce { $v1 } km

engine-e-leo-pass-duration-at-most-86400-and = duration_s (nejvýše 86400) a step_s musí být kladné, nejvýše 20000 epoch; zadáno { $duration } a { $step }

engine-leo-pass-leo-satellite-km-deg = družice LEO { $system }, { $s } km, { $inclination_deg } deg ({ $orbit_source })

engine-leo-pass-the-scenario-epoch-read-as = `epoch` scénáře { $epoch }, čteno jako UTC

engine-leo-pass-the-kind-default-epoch-utc = výchozí epocha druhu { $epoch } UTC (scénář žádnou neuvádí)

engine-e-leo-pass-user-environment-must-be-ground = user.environment musí být ground, maritime, air nebo indoor; zadáno '{ $o }'

engine-e-leo-pass-user-lat-deg-must-be = user.lat_deg musí být v rozmezí +/-90

## src/leo_pass.rs

engine-e-leo-pass-user-speed-must-be-to = rychlost uživatele musí být 0 až 3000 m/s a výška -500 až 100000 m

engine-e-leo-pass-user-antenna-must-be-patch = user.antenna musí být patch, hemispherical nebo isotropic; zadáno '{ $o }'

engine-e-leo-pass-user-building-probability-must-be = user.building_probability musí ležet v intervalu (0, 1)

engine-e-leo-pass-ionosphere-model-must-be-klobuchar = ionosphere.model musí být klobuchar, vtec nebo none; zadáno '{ $o }'

engine-e-leo-pass-direction-must-be-ascending-or = direction musí být ascending nebo descending; zadáno '{ $o }'

engine-e-leo-pass-satellite-bad-eccentricity-or-perigee = družice { $id }: chybná excentricita nebo perigeum

engine-e-leo-pass-satellite-tle-needs-tle-line1 = družice { $id }: tle vyžaduje tle_line1 a tle_line2

engine-e-leo-pass-orbit-must-be-pass-elements = orbit musí být pass, elements nebo tle; zadáno '{ $o }'

engine-e-leo-pass-leo-constellation-needs-system-or = leo_constellation vyžaduje systém nebo návrh

engine-e-leo-pass-no-sun-synchronous-inclination = neexistuje heliosynchronní sklon dráhy

engine-e-leo-pass-leo-constellation-at-most-5000 = leo_constellation: nejvýše 5000 družic

engine-e-leo-pass-no-leo-satellite-rises-above = žádná družice LEO ve zvoleném okně nevystoupí nad masku

engine-e-leo-pass-spoofer-window-must-be-in = spoofer.window_s musí ležet v intervalu (0, 3600]

engine-e-leo-pass-spoofer-bands-is-not-band = spoofer.bands: '{ $b }' není pásmem žádné družice LEO ({ $names })

engine-e-leo-pass-no-gnss-signal-for-constellation = pro konstelaci '{ $cons }' neexistuje signál GNSS '{ $bname }'

engine-e-leo-pass-empty-gnss-constellation = prázdná konstelace GNSS

engine-e-leo-pass-iono-free-pairs-are-not = iono_free_pairs: '{ $a }'/'{ $b }' nejsou dvě různá pásma družice { $id }

engine-e-leo-pass-iot-powers-and-battery-must = výkony a baterie zařízení IoT musí být kladné

engine-e-leo-pass-iot-cn0-from-must-be = iot.cn0_from musí být median nebo peak; zadáno '{ $o }'

engine-leo-pass-detection-threshold-db-after-integration = práh detekce { $detection_snr_db } dB po integraci

engine-leo-pass-coherent-integration-at-most-ms = koherentní integrace nejvýše { $rx } ms, omezeno rychlostí změny Doppleru

engine-leo-pass-serial-search-with-correlators = sériové vyhledávání s korelátory: { $correlators }

engine-leo-pass-hot-start-doppler-known-to = horký start: Doppler znám s přesností +/-{ $aided } Hz, efemeridy platné

engine-leo-pass-leo-pass-link-budget-user = Rozpočet spoje přeletu LEO, prostředí uživatele: { $environment }, poloha { $lat_deg }, { $lon_deg }; družice LEO: { $satellites }, okno { $duration_s } s{ "\u000A" }

engine-leo-pass-km-max-elevation-deg-at = { "  " }{ $id } [{ $system } { $source_kind }]: { $sat } km, maximální elevace { $max_elevation_deg } deg v čase { $tca_s } s, nad maskou { $duration_above_mask_s } s{ "\u000A" }

engine-leo-pass-mhz-n0-peak-median-doppler = { "    " }{ $name } { $b } MHz: C/N0 špička { $opt }, medián { $opt2 }; |Doppler| max { $opt3 }; iono { $b2 }{ "\u000A" }

engine-leo-pass-gnss-in-view-n0-to = { "  " }GNSS { $constellation } { $band }: ve výhledu { $satellites_in_view }, C/N0 { $opt } až { $opt2 } (medián { $opt3 }){ "\u000A" }

engine-leo-pass-leo-peak-db-hz-is = { "  " }LEO { $leo_band } špička { $leo_peak_cn0_dbhz } dB-Hz je o { $leo_peak_above_gnss_median_db } dB nad mediánem GNSS; nad nejsilnější nosnou GNSS po dobu { $leo_seconds_above_gnss_max } s{ "\u000A" }

engine-leo-pass-iot-cold-ttff-mj-hot = { "  " }IoT { $signal }: studený TTFF { $ttff_s } s ({ $energy_per_fix_mj } mJ), horký { $ttff_s2 } s ({ $energy_per_fix_mj2 } mJ){ "\u000A" }

engine-leo-pass-spoofer-from-jump-push-doppler = { "  " }Spoofer od { $onset_s } s (skok { $offset_m } m, posun { $push_rate_m_s } m/s): test Doppleru GNSS { $t }, LEO { $t2 }, fúzní { $t3 }; mezipásmový { $t4 }{ "\u000A" }

engine-leo-pass-user-leo-peak-db-hz = uživatel: { $environment } · špička LEO { $leo_peak_cn0_dbhz } dB-Hz, o { $leo_peak_above_gnss_median_db } dB nad mediánem GNSS · MODELLED

engine-leo-pass-user-modelled = uživatel: { $environment } · MODELLED

engine-leo-pass-doppler-of-each-leo-satellite = Doppler prvního pásma každé družice LEO (±{ $v1 } kHz plná stupnice)

## src/leo_pnt_chain.rs

engine-e-leo-pnt-chain-invalid-table = neplatná tabulka [{ $what }]: { $e }

engine-e-leo-pnt-chain-signal-design-is-neither-in = signal_design '{ $signal_design }' není ani v [signal], ani veřejným návrhem ({ $v2 })

engine-e-leo-pnt-chain-signal-design-has-no-code = signal_design '{ $name }' nemá žádnou složku sledovanou kódem, a proto neposkytuje pseudovzdálenost

engine-e-leo-pnt-chain-kind-must-be-leo-pnt = kind musí být leo-pnt-chain; zadáno { $k }

engine-e-leo-pnt-chain-the-tracked-component-has-no = sledovaná složka nemá čipovou rychlost

engine-e-leo-pnt-chain-no-band-of-pass-names = žádné pásmo v [pass] nepojmenovává signal = "{ $name }"; řetězec potřebuje jedno, které návrh ponese

engine-e-leo-pnt-chain-the-pass-gives-no-code = přelet neposkytuje žádný kódový jitter

engine-e-leo-pnt-chain-od-sisre-must-be-in = od_sisre_m musí ležet v [0, 100] m; zadáno { $od }

engine-e-leo-pnt-chain-fusion-must-run-mode-joint = { "[" }fusion] musí běžet s mode = "joint"; zadáno { $mode }

engine-leo-pnt-chain-tracked-n0-at-the-deg = sledované C/N0 při masce { $mask } deg (přímkový fit v sin elevace)

engine-e-leo-pnt-chain-fusion-has-no-leo-system = { "[" }fusion] nemá žádný systém LEO, který by hodnoty řetězce převzal

engine-e-leo-pnt-chain-fusion-produced-no-joint-block = { "[" }fusion] nevytvořilo žádný blok joint

engine-leo-pnt-chain-leo-pnt-chain = Řetězec LEO-PNT: { $name }

engine-leo-pnt-chain-signal-tracked-at-mchip-n0 =
    { $name }
    { "  " }signál { $name2 } ({ $design }), sledováno { $design2 } při { $v4 } Mchip/s, odsazení C/N0 { $offset } dB{ "\u000A" }

engine-leo-pnt-chain-pass-km-tracked-n0-peak = { "  " }přelet { $id } { $sat } km: špička sledovaného C/N0 { $peak_tracked_cn0_dbhz } dB-Hz, medián kódového jitteru { $jitter_median } m; přímka C/N0 { $a } + { $b } sin(el) dB-Hz{ "\u000A" }

engine-leo-pnt-chain-message-fit-update-representation-sisre = { "  " }zpráva { $res }, fit { $fit_interval_s } s / aktualizace { $update_period_s } s: SISRE reprezentace { $stats } mm RMS (dráha { $stats2 } mm), s určováním oběžné dráhy { $od } m: předáno dále { $sisre } m{ "\u000A" }

engine-leo-pnt-chain-fused-fix-gnss-only-gnss = { "  " }fúzní řešení polohy: pouze GNSS { $f3 } -> GNSS + LEO { $f32 }{ "\u000A" }

engine-leo-pnt-chain-ppp-convergence = { "  " }konvergence PPP: { $cells }{ "\u000A" }

engine-leo-pnt-chain-values-handed-between-stages-modelled = { "  " }{ $doc } hodnot předaných mezi stupni. MODELLED.

engine-leo-pnt-chain-code-tracking-jitter-the-ranging = Jitter kódového sledování, chyba měření vzdálenosti (m, 0 až { $jmax })

## src/leo_signal.rs

engine-e-leo-signal-modulation-the-width-must-be = modulace { $label }: šířka musí být kladná

engine-e-leo-signal-unknown-signal-preset-the-library = neznámá předvolba signálu { $name }: knihovna obsahuje { $preset_names }

engine-e-leo-signal-preset-invalid-preset-file = předvolba { $name }: neplatný soubor předvolby: { $e }

engine-e-leo-signal-preset-file-names-itself = soubor předvolby { $name } se pojmenovává { $name2 }

engine-e-leo-signal-centre-mhz-must-be-positive = { $name }: centre_mhz musí být kladné

engine-e-leo-signal-tx-bandwidth-mhz-must-be = { $name }: tx_bandwidth_mhz musí být kladné

engine-e-leo-signal-signal-needs-at-least-one = { $name }: signál potřebuje alespoň jednu složku

engine-e-leo-signal-component-power-fraction-must-be = { $name }: složka { $v1 }: power_fraction musí být kladné

engine-e-leo-signal-component-has-fdma-shares-but = { $name }: složka { $v1 } má fdma_shares, ale nemá fdma_offsets_mhz

engine-e-leo-signal-component-fdma-shares-must-be = { $name }: složka { $v1 }: fdma_shares musí být kladné se součtem jedna

engine-e-leo-signal-component-needs-one-fdma-share = { $name }: složka { $v1 } potřebuje jeden fdma_share na každý offset

engine-e-leo-signal-data-rate-sps-must-be = { $name }: data_rate_sps musí být kladné

engine-e-leo-signal-code-length-chips-must-be = { $name }: code_length_chips musí být kladné

engine-e-leo-signal-component-power-fractions-sum-to = { $name }: součet výkonových podílů složek je { $total }, ne 1

engine-e-leo-signal-orbit-altitude-km-must-be = { $name }: orbit_altitude_km musí být kladné

engine-e-leo-signal-flat-ofdm-like-component-cannot = { $name }: plochou složku (typu OFDM) nelze umístit do spektrálního modelu

engine-e-leo-signal-the-tracked-component-sits-on = { $name }: sledovaná složka leží na podnosných FDMA; spektrální model sleduje složku ve středu pásma

engine-e-leo-signal-signal-is-given-twice = signál { $w } je zadán dvakrát

engine-e-leo-signal-signals-is-more-than-the = počet signálů { $out } překračuje povolených 24

engine-e-leo-signal-receiver-loop-bandwidth-hz-integration = receiver: loop_bandwidth_hz x integration_time_s musí být menší než 1

engine-e-leo-signal-receiver-give-to-40-cn0 = receiver: zadejte 1 až 40 hodnot cn0_dbhz

engine-e-leo-signal-trade-slant-range-km-and = trade: slant_range_km > 0 a slant_tec_tecu ≥ 0

engine-e-leo-signal-psd-points-must-be-between = psd_points musí ležet mezi 21 a 2001

engine-e-leo-signal-receiver-early-late-use-coherent = receiver.early_late { $o }: použijte "coherent" nebo "non-coherent"

engine-e-leo-signal-the-system-noise-temperature-must = systémová šumová teplota musí být kladná

engine-e-leo-signal-compatibility-unknown-gnss-signal-known = compatibility: neznámý signál GNSS { $n } (známé: { $gnss_victim_names })

engine-e-leo-signal-trade-reference-signal-is-not = trade.reference_signal { $n } není signálem scénáře

engine-e-leo-signal-shape-check-signal-is-not = kontrola tvaru: signál { $signal } není ve scénáři

engine-leo-signal-scenario-leo-signal-signals-noise = scénář leo-signal | signálů: { $runs } | úroveň šumu { $n0_db } dBW/Hz{ $v3 }{ $v4 }

engine-leo-signal-left-band-limited-psd-of = vlevo: pásmově omezená PSD každého návrhu (dB pod špičkou, přes jeho vysílací pásmo); vpravo: kódový jitter vs. celkové C/N0 při rozestupu { $reference_spacing_chips } čipu

## src/linkbudget.rs

engine-e-linkbudget-unknown-band-expected-ka = neznámé pásmo '{ $other }' (očekáváno s|x|ka)

engine-e-linkbudget-range-km-must-be-finite = range_km musí být konečné a kladné

engine-e-linkbudget-data-rate-bps-must-be = data_rate_bps musí být konečné a kladné

engine-e-linkbudget-other-losses-db-must-be = other_losses_db musí být konečné a >= 0

engine-e-linkbudget-tsys-must-be-finite-and = tsys_k musí být při zadání konečné a kladné

engine-linkbudget-link-budget-band-km-bit = link-budget: pásmo { $value }, { $range_km } km, { $data_rate_bps } bit/s -> FSPL { $fsl_db } dB, Eb/N0 { $eb_n0_db } dB, rezerva { $margin_db } dB ({ $v7 })

## src/live_io.rs

engine-e-live-io-cannot-listen-on = nelze naslouchat na { $addr }: { $e }

engine-live-io-kshana-live-listening-on-tcp = kshana live: naslouchání na tcp { $addr }

engine-live-io-kshana-live-tcp-client-connected = kshana live: klient tcp připojen

engine-live-io-kshana-live-warning-is-not = kshana live: upozornění: { $addr } není adresa loopback; kdokoli, kdo se k ní dostane, může číst datový proud

engine-e-live-io-cannot-open = nelze otevřít { $spec }: { $e }

engine-live-io-kshana-live-dropped-tcp-client = kshana live: odpojen klient tcp, který nestíhal

engine-e-live-io-cannot-open-2 = nelze otevřít { $path }: { $e }

engine-live-io-kshana-live-warning-is-not-2 = kshana live: upozornění: { $addr } není adresa loopback; kdokoli, kdo se k ní dostane, může této vrstvě posílat datový proud

engine-e-live-io-cannot-bind-udp = nelze navázat udp { $addr }: { $e }

engine-live-io-kshana-live-listening-on-udp = kshana live: naslouchání na udp { $addr }

engine-e-live-io-cannot-connect-to = nelze se připojit k { $addr }: { $e }

engine-live-io-kshana-live-connected-to-tcp = kshana live: připojeno k tcp { $addr }

engine-live-io-kshana-live-reading-serial-at = kshana live: čtení sériového portu { $path } při { $baud } baudech (pouze čtení)

engine-live-io-the-was-closed-by-the = spojení { $v1 } uzavřela protistrana (vrstva se znovu nepřipojuje: spusťte ji pod supervizorem, který ji restartuje)

engine-e-live-io-baud-use-1200-2400-4800 = --baud { $baud }: použijte 1200, 2400, 4800, 9600, 19200, 38400, 57600, 115200 nebo 230400

engine-e-live-io-is-not-serial-device-tcgetattr = { $path } není sériové zařízení (tcgetattr selhal)

engine-e-live-io-cannot-set-baud = nelze nastavit { $baud } baudů

engine-e-live-io-cannot-set-the-line-mode = nelze nastavit režim linky { $path }

engine-e-live-io-serial-is-supported-on-unix = --serial je podporován pouze v systému Unix; použijte --file, --tcp nebo --stdin

engine-live-io-unknown-option = neznámá volba { $s }

engine-live-io-cannot-read = nelze číst { $session }: { $e }

engine-live-io-kshana-live-vessel-platform-calibrating = kshana live: platforma plavidlo, kalibrace po dobu { $calibration_s } s; brána { $v2 }. Software pouze poradního charakteru, nikoli typově schválené navigační zařízení: odpovědný zůstává provozovatel.

engine-live-io-write-failed = zápis selhal: { $e }

## src/lunar_afs/codes.rs

engine-e-lunar-afs-codes-afs-prn-is-outside = AFS PRN { $prn } je mimo rozsah 1..={ $MAX_PRN }

engine-e-lunar-afs-codes-insertion-index-outside-10223 = index vložení { $p } je mimo rozsah 1..=10223

engine-e-lunar-afs-codes-annex-files-hold-and-codes = soubory Annex 3 obsahují kódů { $gold } a { $ter }, očekáváno 210

engine-e-lunar-afs-codes-annex-afs-prn-is-not = Annex 3 AFS-I PRN { $v1 } není Goldův kód g1, g2 (LSIS Figure C-1)

engine-e-lunar-afs-codes-secondary-code-does-not-exist = sekundární kód S{ $id } neexistuje (S0 až S3)

engine-e-lunar-afs-codes-lsis-v1-table-11-assigns = LSIS V1.0 Table 11 přiřazuje kódy pouze identifikátorům uzlů 1 až 12, nikoli { $node_id }

## src/lunar_afs/frame.rs

engine-e-lunar-afs-frame-fid-does-not-fit-two = FID { $fid } se nevejde do dvou bitů (0..3)

engine-e-lunar-afs-frame-toi-outside-99-lsis-410 = TOI { $toi } je mimo rozsah 0..99 (LSIS-410)

engine-e-lunar-afs-frame-subframe-symbols-expected = očekáváno symbolů podrámce 1: { $SB1_SYMBOLS }

engine-e-lunar-afs-frame-subframe-data-lengths-expected = délky dat podrámců { $sb2 }/{ $sb3 }/{ $sb4 } (očekáváno { $SB2_DATA_BITS }/{ $SB34_DATA_BITS }/{ $SB34_DATA_BITS })

engine-e-lunar-afs-frame-symbols-expected-given = očekáváno symbolů: { $FRAME_SYMBOLS }, zadáno: { $soft }

## src/lunar_afs/ldpc.rs

engine-e-lunar-afs-ldpc-line-expected-row-column = řádek { $v1 }: očekáváno `row,column`

engine-e-lunar-afs-ldpc-line = řádek { $v1 }: { $e }

engine-e-lunar-afs-ldpc-line-outside = řádek { $v1 }: ({ $r },{ $c }) je mimo { $rows }x{ $cols }

engine-e-lunar-afs-ldpc-ldpc-information-bits-expected-given = LDPC { $subframe }: očekáváno informačních bitů: { $info_bits }, zadáno: { $info }

## src/lunar_afs/lsis.rs

engine-lunar-afs-lsis-the-lsis-v1-data-is = data LSIS V1.0 nejsou v { $cache_dir } (nastavte KSHANA_LSIS_DIR nebo spusťte xval/lunar-afs/fetch_lsis.sh, který stáhne { $LSIS_PDF_URL } a rozbalí jeho přílohy; s Kshana se nedistribuují)

engine-e-lunar-afs-lsis-is-not-pinned-lsis-file = { $name } není připnutý soubor LSIS

engine-e-lunar-afs-lsis-has-sha-256-expected-pinned = { $path } má SHA-256 { $got }, očekáváno { $want } (připnuto na LSIS V1.0 z 29. ledna 2025); { $fetch_hint }

## src/lunar_afs/waveform.rs

engine-lunar-afs-waveform-lunanet-augmented-forward-signal-baseband = základní pásmo LunaNet Augmented Forward Signal, { $LSIS_VERSION }; referenční generátor Kshana

engine-lunar-afs-waveform-afs-node = uzel AFS { $node_id }

engine-lunar-afs-waveform-afs-node-frame-toi = uzel AFS { $node_id }, rámec TOI { $toi }

## src/lunar_beacon.rs

engine-e-lunar-beacon-satellites-must-be-at-least = n_satellites musí být alespoň 1

engine-e-lunar-beacon-comparison-satellites-must-be-at = comparison_n_satellites musí být alespoň 1

engine-e-lunar-beacon-elevation-mask-deg-must-be = elevation_mask_deg musí ležet v [0, 90); zadáno { $mask_deg }

engine-e-lunar-beacon-serialising-beacon-report = serializace zprávy o majácích: { $e }

engine-e-lunar-beacon-the-beacon-report-must-serialise = zpráva o majácích se musí serializovat do objektu JSON

engine-lunar-beacon-lunar-surface-beacon-augmentation-mask = Rozšíření povrchovými majáky na Měsíci — maska { $elevation_mask_deg } deg, epocha +{ $epoch_s } s, sigma_URE jednoho majáku { $sigma_ure_m } m{ "\u000A" }

engine-lunar-beacon-sats-beacons = { "  " }{ $label }  družic { $n_visible_sats }  majáků { $n_visible_beacons }  { $fmt_dop }{ "\u000A" }

engine-lunar-beacon-realised-sigma-3d = { "  " }{ $v1 }  dosažená 1-sigma: 3D { $pos_3d_m } m  H { $horizontal_m } m  V { $vertical_m } m{ "\u000A" }

engine-lunar-beacon-beacons-improve-pdop-by = { "  " }maják zlepšuje PDOP: { $f }x;{ " " }

engine-lunar-beacon-larger-constellation-instead = větší konstelace namísto toho: { $f }x{ "\u000A" }

## src/lunar_ephemeris.rs

engine-e-lunar-ephemeris-cannot-read-lunar-ephemeris = nelze číst měsíční efemeridy { $path }: { $e }

engine-e-lunar-ephemeris-lunar-ephemeris-first-line-must = měsíční efemeridy: první řádek musí být `{ $MAGIC }`, nalezeno `{ $line }`

engine-e-lunar-ephemeris-lunar-ephemeris-file-is-empty = měsíční efemeridy: soubor je prázdný

engine-e-lunar-ephemeris-lunar-ephemeris-format-must-be = měsíční efemeridy: `# format:` musí být `states` nebo `elements`, nalezeno `{ $other }`

engine-e-lunar-ephemeris-lunar-ephemeris-no-data-rows = měsíční efemeridy: žádné datové řádky

engine-e-lunar-ephemeris-lunar-ephemeris-missing-column = měsíční efemeridy: chybí sloupec `{ $name }`

engine-e-lunar-ephemeris-lunar-ephemeris-elements-frame-must = měsíční efemeridy: `# elements_frame:` musí být `icrf` nebo `mci`, nalezeno `{ $other }`

engine-e-lunar-ephemeris-lunar-ephemeris-elements-frame-icrf = měsíční efemeridy: `elements_frame: icrf` vyžaduje `# epoch_jd_tdb:` (epocha, ke které se elementy vztahují a ve které se také vyhodnocuje rotace z ICRF do měsíční pevné soustavy): { $e }

engine-e-lunar-ephemeris-lunar-ephemeris-short-element-row = měsíční efemeridy: krátký řádek elementů { $v1 }

engine-e-lunar-ephemeris-lunar-ephemeris-element-row = měsíční efemeridy: řádek elementů { $v1 }: { $e }

engine-e-lunar-ephemeris-lunar-ephemeris-element-row-has = měsíční efemeridy: řádek elementů { $v1 } má nekladnou velkou poloosu

engine-e-lunar-ephemeris-lunar-ephemeris-element-row-has-2 = měsíční efemeridy: řádek elementů { $v1 } má excentricitu { $ecc }, mimo [0, 1)

engine-e-lunar-ephemeris-lunar-ephemeris-states-file-needs = měsíční efemeridy: soubor `states` vyžaduje `# frame: icrf` nebo `# frame: mci`, nalezeno `{ $other }`

engine-e-lunar-ephemeris-lunar-ephemeris-an-icrf-states = měsíční efemeridy: soubor stavů v soustavě `icrf` vyžaduje `# epoch_jd_tdb:`: { $e }

engine-e-lunar-ephemeris-lunar-ephemeris-short-state-row = měsíční efemeridy: krátký řádek stavů { $v1 }

engine-e-lunar-ephemeris-lunar-ephemeris-state-row = měsíční efemeridy: řádek stavů { $v1 }: { $e }

engine-e-lunar-ephemeris-lunar-ephemeris-state-row-is = měsíční efemeridy: řádek stavů { $v1 } není konečný

engine-e-lunar-ephemeris-lunar-ephemeris-state-row-for = měsíční efemeridy: řádek stavů { $v1 } pro družici { $sat } jde zpět v čase ({ $t } po { $last }); epochy musí být pro každou družici ostře rostoucí

engine-lunar-ephemeris-tabulated-moon-centred-state-ephemeris = Tabelované stavové efemeridy se středem v Měsíci (soustava { $e }), Lagrangeovsky interpolované v řádu { $LAGRANGE_ORDER } mezi epochami tabulky a převedené do MCMF pomocí { $v2 }. Stavy tento engine NEPROPAGUJE. Třída původu `published-ephemeris`: odlišná od každé hodnoty odvozené z elementů.

engine-lunar-ephemeris-published-constellation-definition-stated-in = Publikovaná DEFINICE konstelace zadaná v ICRF se středem v Měsíci (`{ $v1 }`), propagovaná vlastním Keplerovým řešičem tohoto enginu v téže inerciální soustavě a v každé epoše převedená do MCMF pomocí orientace Měsíce podle IAU 2015 / WGCCRE (precesní pól, analytická fyzická librace). ŽÁDNÁ aproximace soustavy: zdroj uvádí soustavu i epochu a používají se obě. Třída původu `published-elements`: odlišná od každé hodnoty odvozené z jádra.

engine-lunar-ephemeris-published-constellation-definition-propagated-by = Publikovaná DEFINICE konstelace, propagovaná vlastním Keplerovým řešičem tohoto enginu a převedená modelem střední rotace Měsíce — přesně stejnou cestou, jakou prochází ilustrativní konstelace, takže jediným rozdílem mezi oběma běhy je návrh konstelace. Zdroj uvádí elementy v soustavě `{ $v1 }`; zde se čtou jako MCI, což konstelaci naklání o `published_frame_tie_angle_deg`. Třída původu `published-elements`: odlišná od každé hodnoty odvozené z jádra.

## src/lunar_frame_campaign.rs

engine-e-lunar-frame-campaign-unknown-station-datum-expected-fixed = neznámé station_datum { $other }: očekáváno "fixed" nebo "estimated-anchor-first"

engine-e-lunar-frame-campaign-vlbi-campaign-needs-at-least = kampaň VLBI potřebuje k vytvoření základny alespoň 2 stanice, zadáno { $raw }

engine-e-lunar-frame-campaign-station-has-non-finite-coordinate = stanice { $name } má nekonečnou souřadnici

engine-e-lunar-frame-campaign-station-latitude-deg-is-outside = zeměpisná šířka stanice { $name } { $lat } deg je mimo [-90, 90]

engine-e-lunar-frame-campaign-seven-parameter-helmert-datum-needs = sedmiparametrový Helmertův datum vyžaduje alespoň 3 nekolineární majáky, zadáno { $raw }

engine-e-lunar-frame-campaign-beacon-has-non-finite-coordinate = maják { $name } má nekonečnou souřadnici

engine-e-lunar-frame-campaign-beacon-latitude-deg-is-outside = zeměpisná šířka majáku { $name } { $lat } deg je mimo [-90, 90]

engine-e-lunar-frame-campaign-arc-hours-must-be-positive = arc_hours musí být kladné a konečné, zadáno { $arc }

engine-e-lunar-frame-campaign-step-min-must-be-positive = step_min musí být kladné a konečné, zadáno { $step }

engine-e-lunar-frame-campaign-schedule-of-epochs-is-beyond = plán o { $v1 } epochách překračuje pojistku tohoto scénáře na 5000 epoch; zvětšete step_min nebo zkraťte arc_hours

engine-e-lunar-frame-campaign-delay-sigma-must-be-positive = delay_sigma_s musí být kladné a konečné, zadáno { $s }

engine-e-lunar-frame-campaign-elevation-mask-deg-must-be = elevation_mask_deg musí být konečné a v [-90, 90), zadáno { $m }

engine-e-lunar-frame-campaign-earth-elevation-mask-deg-must = earth_elevation_mask_deg musí být konečné a v [-90, 90), zadáno { $m }

engine-e-lunar-frame-campaign-rel-tol-must-be-finite = rel_tol musí být konečné a v [0, 1), zadáno { $t }

engine-e-lunar-frame-campaign-assumed-coordinate-sigma-must-be = assumed_coordinate_sigma_m musí být kladné a konečné, zadáno { $s }

engine-e-lunar-frame-campaign-solver-must-be-spectral-or = solver musí být "spectral" nebo "srif", zadáno "{ $other }"

engine-e-lunar-frame-campaign-serializing-lunar-frame-campaign-result = serializace výsledku lunar-frame-campaign: { $e }

engine-e-lunar-frame-campaign-no-observation-in-the-campaign = žádné pozorování v kampani nepřekročí masku elevace na straně Země { $mask } deg na obou koncích základny A ZÁROVEŇ masku { $earth_mask } deg nad vlastním horizontem majáku: epoch { $n_epochs } x základen { $v1 } x majáků { $n_beacons }, vše zamítnuto. Prodlužte arc_hours, snižte některou masku nebo přemístěte stanice.

engine-lunar-frame-campaign-lunar-frame-campaign-beacons-baselines = lunar-frame-campaign | majáků { $n_beacons } x základen { $v1 } x epoch { $n_epochs } = pozorování { $n_obs } (sigma zpoždění { $sigma_tau } s) | datum stanic { $station_datum } | hodnost Helmert { $rank }/7 cond { $condition } | sigma translace datumu { $v5 } vs. chyba obnovy vložené transformace { $trans_err_norm_m } m (poměr { $v7 })

engine-lunar-frame-campaign-full-rank-all-similarity-parameters = plná hodnost: všech 7 parametrů podobnostní transformace je touto kampaní omezeno (číslo podmíněnosti { $condition })

engine-lunar-frame-campaign-rank-deficient-of-similarity-directions = RANK-DEFICIENT: { $defect } ze 7 směrů podobnostní transformace je z této kampaně nepozorovatelných, proto se NEUVEDE žádná sigma datumu; nepozorovatelné směry jsou vypsány v sedmiparametrové bázi

engine-lunar-frame-campaign-of-beacons-have-no-observation = majáků bez pozorování v tomto plánu: { $names } z { $beacons } ({ $names2 }); nenesou žádnou informaci, jejich sigmy jsou null a datum se realizuje pouze z pozorovaných majáků

## src/lunar_infra/geodesy.rs

engine-e-lunar-infra-geodesy-all-sigmas-must-be-positive = všechny sigmy musí být kladné

## src/lunar_infra/gnss.rs

engine-e-lunar-infra-gnss-gnss-planes-sats-per-plane = gnss: planes, sats_per_plane a altitude_km musí být kladné

engine-e-lunar-infra-gnss-gnss-tx-efficiency-must-be = gnss: tx_efficiency musí ležet v (0, 1]

## src/lunar_infra/mod.rs

engine-lunar-infra-lunar-infrastructure-od-consistency-gnss = lunar-infrastructure od-consistency: GNSS { $v } m vs. pozemní { $v2 } m sigma polohy, střední q { $v3 } (chí-kvadrát 6 očekává 6)

engine-lunar-infra-lunar-infrastructure-carrier-phase-ambiguities = lunar-infrastructure carrier-phase: nejednoznačností { $last }, úspěšnost ILS { $last2 } (bootstrap { $last3 }) na nejdelším oblouku

engine-lunar-infra-lunar-infrastructure-frame-coestimation-smallest = lunar-infrastructure frame-coestimation: nejmenší informační vlastní číslo x{ $v } s odkazy na orbiter, stopa CRLB x{ $v2 }

engine-leo-pnt-chain-sisre-gnss-only-rms-3d = SISRE { $f } · pouze GNSS RMS 3D { $f2 } · GNSS + LEO RMS 3D { $f3 }

## src/lunar_infra/mod.rs

engine-lunar-infra-lunar-infrastructure-space-tie-sweep = lunar-infrastructure space-tie: bodů průchodu { $last } na obloucích { $v }; sigma translace x laser vs. GNSS { $last2 } m při registrovaném lokálním spojení

engine-lunar-infra-lunar-infrastructure-geodesy-sensitivity-crlb = lunar-infrastructure geodesy-sensitivity: sigma CRLB h2 { $v }, k2 { $v2 }, l2 { $v3 }

engine-e-lunar-infra-unknown-study-expected-one-of = neznámá studie `{ $other }`: očekáváno jedno z { $studies }

## src/lunar_infra/od.rs

engine-e-lunar-infra-od-the-measurement-set-does-not = soubor měření neurčuje oběžnou dráhu (singulární informace)

engine-e-lunar-infra-od-monte-carlo-trials-must-be = monte_carlo.trials musí být alespoň 1

engine-e-lunar-infra-od-ground-sigmas-must-be-positive = pozemní sigmy musí být kladné

engine-e-lunar-infra-od-unknown-station-dss-14-dss = neznámá stanice `{ $nm }`: DSS-14, DSS-63 nebo DSS-43

engine-e-lunar-infra-od-too-few-ground-measurements-to = příliš málo pozemních měření k určení oběžné dráhy

engine-e-lunar-infra-od-the-covariance-of-the-difference = kovariance rozdílu je singulární

## src/lunar_infra/orbit.rs

engine-e-lunar-infra-orbit-the-nrho-differential-correction-did = diferenciální korekce NRHO z počáteční hodnoty nekonvergovala

engine-e-lunar-infra-orbit-elfo-needs-perilune-altitude-apolune = elfo vyžaduje 0 < výška periluna < výška apoluna

engine-e-lunar-infra-orbit-unknown-orbit-family-nrho-or = neznámá rodina drah `{ $other }`: nrho nebo elfo

engine-e-lunar-infra-orbit-sample-and-arc-days-must = sample_s a arc_days musí být kladné

## src/lunar_infra/phase.rs

engine-e-lunar-infra-phase-no-common-satellite-between-the = mezi přijímači není žádná společná družice

engine-e-lunar-infra-phase-the-carrier-phase-normal-equations = normální rovnice fáze nosné jsou singulární

engine-e-lunar-infra-phase-the-position-block-is-singular = blok polohy je singulární

engine-e-lunar-infra-phase-the-ambiguity-covariance-is-not = kovariance nejednoznačností není kladně definitní

## src/lunar_infra/tie.rs

engine-e-lunar-infra-tie-technique-sigmas-must-be-positive = sigmy technik musí být kladné

engine-e-lunar-infra-tie-local-tie-sigmas-must-be = sigmy lokálního spojení musí být kladné

## src/lunar_jamming.rs

engine-e-lunar-jamming-carrier-hz-must-be-finite = carrier_hz musí být konečné a kladné

engine-e-lunar-jamming-chip-rate-hz-must-be = chip_rate_hz musí být konečné a kladné

engine-e-lunar-jamming-temp-must-be-finite-and = temp_k musí být konečné a kladné

engine-e-lunar-jamming-sma-km-must-be-finite = sma_km musí být konečné a větší než poloměr Měsíce

engine-e-lunar-jamming-eccentricity-must-be-in = eccentricity musí ležet v [0, 1)

engine-e-lunar-jamming-jammer-power-dbw-must-be = jammer.power_dbw musí být konečné

engine-lunar-jamming-lunar-jamming-sats-epochs-links = lunar-jamming | družic: { $n_sats }, epoch: { $n_epochs }, spojů: { $n_links } z ({ $site_lat_deg }, { $site_lon_deg }) | J/S { $min_js_db }..{ $max_js_db } dB (průměr { $mean_js_db }) | LOST { $n_lost } | dostupnost { $availability_under_jamming } z nominálních { $availability_nominal }

engine-lunar-jamming-lunar-jamming-sats-epochs-links-2 = lunar-jamming | družic: { $n_sats }, epoch: { $n_epochs }, spojů: { $n_links } z ({ $site_lat_deg }, { $site_lon_deg }) | bez rušiče (měsíční základ s čistou oblohou) | LOST { $n_lost } | dostupnost { $availability_nominal }

## src/lunar_llr.rs

engine-e-lunar-llr-unexpected-reflector-catalogue-header = neočekávaná hlavička katalogu odražečů { $t }

engine-e-lunar-llr-short-reflector-catalogue-row = krátký řádek katalogu odražečů { $t }

engine-e-lunar-llr-unreadable-reflector-field-in = nečitelné pole odražeče { $i } v { $t }

engine-e-lunar-llr-reflector-but-the-published-radius = odražeč { $f }: |(x,y,z)| = { $norm3 } m, ale publikovaný sloupec poloměru uvádí { $radius } m — řádek byl upraven

engine-e-lunar-llr-reflector-catalogue-has-no-rows = katalog odražečů nemá žádné řádky

engine-e-lunar-llr-unreadable-position-epoch-year = nečitelné position_epoch_year { $rest }

engine-e-lunar-llr-unexpected-station-catalogue-header = neočekávaná hlavička katalogu stanic { $t }

engine-e-lunar-llr-short-station-catalogue-row = krátký řádek katalogu stanic { $t }

engine-e-lunar-llr-unreadable-station-field-in = nečitelné pole stanice { $i } v { $t }

engine-e-lunar-llr-unreadable-ilrs-id-in = nečitelné ILRS id v { $t }

engine-e-lunar-llr-station-catalogue-has-no-rows = katalog stanic nemá žádné řádky

engine-e-lunar-llr-cannot-read-this-scenario-runs = nelze číst { $path } ({ $e }). Tento scénář běží na potvrzeném výřezu reálných dat v { $DEFAULT_DATA_DIR }, který je součástí repozitáře, ale ne publikovaného balíčku crate; nasměrujte `data_dir` na jeho kopii.

engine-e-lunar-llr-only-usable-normal-points-for = použitelných normálních bodů je jen { $used } pro odražeče: { $reflectors } — příliš málo k omezení souřadnic { $v3 }; rozšiřte výřez archivu

engine-e-lunar-llr-the-simulated-campaign-own-report = vlastní zprávu simulované kampaně se nepodařilo zpracovat: { $e }

engine-lunar-llr-lunar-llr-datum-archived-normal = lunar-llr-datum: archivovaných normálních bodů { $used } (zpracováno { $n_parsed }) ze stanic: { $station_counts } na retroreflektorová pole: { $reflectors } za { $v5 } d; medián změřené preciznosti normálního bodu { $median } mm jednocestně; hodnost informace odražečů { $rank }/{ $n }; hodnost Helmert { $rank2 }/{ $n_helmert } cond { $condition }; sigma translace datumu { $v12 } m; RMS jednocestného rezidua pozorováno minus vypočteno { $rms_m } m ({ $v14 })

engine-e-lunar-llr-extra-earth-elevation-mask-deg = extra_earth_elevation_mask_deg musí být konečné a v [-90, 90), zadáno { $mask }

engine-e-lunar-llr-has-non-finite-coordinate = { $kind } { $name } má nekonečnou souřadnici

engine-e-lunar-llr-latitude-deg-is-outside-90 = { $kind } { $name }: zeměpisná šířka { $lat_deg } deg je mimo [-90, 90]

engine-e-lunar-llr-serialising-the-lunar-llr-datum = serializace zprávy lunar-llr-datum selhala: { $e }

## src/lunar_perturbed.rs

engine-e-lunar-perturbed-the-integration-step-must-divide = integrační krok musí dělit výstupní krok

## src/lunar_receiver.rs

engine-e-lunar-receiver-receiver = receiver: { $w }

engine-lunar-receiver-must-be-finite-and-not = { $n } musí být konečné a nezáporné

engine-lunar-receiver-must-be-finite-and-positive = { $n } musí být konečné a kladné

## src/lunar_service.rs

engine-e-lunar-service-moonlight-service-volume = moonlight-service-volume: { $e }

engine-e-lunar-service-moonlight-service-volume-export-site = moonlight-service-volume: export místa: { $e }

engine-e-lunar-service-lunar-ephemeris-covers-past-its = měsíční efemeridy { $path } pokrývají { $until } s za svou epochou, ale horizont scénáře sahá do { $last } s; zkraťte horizon_hours nebo získejte delší oblouk (extrapolace tabelovaných efemerid je odmítnuta)

engine-e-lunar-service-planetary-kernel-path-needs-epoch = planetary_kernel_path vyžaduje epoch_utc (YYYY-MM-DDTHH:MM:SS UTC)

engine-lunar-service-op-frame-at-utc-earth = soustava OP v { $epoch } UTC (zdánlivá normála dráhy Země kolem Měsíce, x podél jejího uzlu na lunárním rovníku IAU); lunární GM, J2 a C22 v pevné soustavě Měsíce IAU, třetí tělesa Země a Slunce v polohách DE440 z { $spk_path }; Runge-Kuttova metoda čtvrtého řádu, krok 10 s

## src/lunar_solution.rs

engine-e-lunar-solution-solution-height-sigma-must-be = solution: height_sigma_m musí být konečné a kladné

engine-e-lunar-solution-solution-range-sigma-must-be = solution: range_sigma_m musí být konečné a kladné

engine-e-lunar-solution-solution-min-satellites-needs-height = solution: min_satellites = 3 vyžaduje height_aided = true

engine-e-lunar-solution-solution-min-satellites-must-be = solution: min_satellites musí být 3 nebo 4, zadáno { $n }

engine-e-lunar-solution-solution-window-epochs-must-be = solution: window_epochs musí být 1 až 144

## src/lunar_station.rs

engine-lunar-station-must-be-finite-and-positive = { $name } musí být konečné a kladné

engine-lunar-station-must-be-finite-and-not = { $name } musí být konečné a nezáporné

engine-lunar-station-points-epochs-trials-exceeds-lower = n_points x n_epochs x n_trials = { $work } překračuje { $MAX_WORK }; snižte n_trials, zhrubte grid_lat_step_deg (nebo uveďte méně bodů), případně zvyšte t_step_s či zkraťte t_span_s

engine-e-lunar-station-kind-must-be-got = kind musí být { $KIND }; zadáno { $k }

engine-e-lunar-station-the-ephemeris-covers-but-the = { $KIND }: efemeridy { $path } pokrývají { $until } s, ale běh sahá do { $last } s (poslední epocha plus latency_s); zkraťte t_span_s

engine-e-lunar-station-no-case = { $KIND }: žádný případ ({ $j }, { $i }, { $k })

engine-lunar-station-points-epochs-trials = body: { $n_grid_points } · epochy: { $n_epochs } · pokusy: { $n_trials }

engine-lunar-station-hpl-max = HPL max { $f }

engine-lunar-station-survey-latency-bits = zaměření { $survey_sigma_m } m · latence { $latency_s } s · { $quantization_bits } bitů

## src/lunar_terrain.rs

engine-e-lunar-terrain-dem-lines-and-samples-must = dem: lines a samples musí být 2 až { $MAX_DEM_SIDE }, zadáno { $lines } x { $samples }

engine-e-lunar-terrain-dem-heights-for-grid = dem: výšek { $heights_m } pro mřížku { $lines } x { $samples }

engine-e-lunar-terrain-dem-map-scale-must-be = dem: map_scale_m musí být kladné, zadáno { $map_scale_m }

engine-e-lunar-terrain-dem-reference-radius-must-be = dem: reference_radius_m musí být kladné, zadáno { $reference_radius_m }

engine-e-lunar-terrain-dem-cannot-read = dem: nelze číst { $descriptor_path }: { $e }

engine-e-lunar-terrain-dem-projection-must-be-south = dem: projection musí být south-polar-stereographic, zadáno { $projection }

engine-e-lunar-terrain-dem-sample-type-must-be = dem: sample_type musí být int16-le, zadáno { $sample_type }

engine-e-lunar-terrain-dem-cannot-read-2 = dem: nelze číst { $img }: { $e }

engine-e-lunar-terrain-dem-grid-over-the-pixel = dem: mřížka překračuje limit { $MAX_DEM_SIDE } pixelů

engine-e-lunar-terrain-dem-is-bytes-int16-needs = dem: { $img } má { $bytes } bajtů; { $lines } x { $samples } int16 vyžaduje { $d }

engine-e-lunar-terrain-dem-sha-256-does-not = dem: { $img } SHA-256 { $digest } neodpovídá hodnotě deskriptoru { $image_sha256 }

engine-e-lunar-terrain-dem-scaling-factor-must-be = dem: scaling_factor musí být kladné

engine-e-lunar-terrain-dem-tile-cannot-read = dem_tile: nelze číst { $path }: { $e }

engine-e-lunar-terrain-dem-tile-needs-at-least = dem_tile: { $path }: vyžaduje alespoň 2 x 2 body, rostoucí rozsah uvnitř [-90, 90] deg a 360 deg zeměpisné délky a konečné výšky

engine-e-lunar-terrain-terrain-must-be-finite-and = terrain: { $what } musí být konečné a kladné, zadáno { $v }

engine-e-lunar-terrain-terrain-antenna-height-must-be = terrain: antenna_height_m musí být konečné a nezáporné, zadáno { $antenna_height_m }

engine-e-lunar-terrain-terrain-azimuth-step-deg-must = terrain: azimuth_step_deg musí být nejvýše 90

engine-e-lunar-terrain-terrain-max-range-range-step = terrain: max_range_m / range_step_m musí být 1 až 1e6

engine-e-lunar-terrain-terrain-the-site-is-outside = terrain: místo leží mimo výškové pole

engine-e-lunar-terrain-terrain-stated-horizon-needs-non = terrain: uvedený horizont vyžaduje neprázdný zdroj

engine-e-lunar-terrain-terrain-stated-horizon = terrain: uvedený horizont: { $e }

engine-e-lunar-terrain-terrain-give-dem-path-or = terrain: zadejte dem_path nebo dem_tile_path, ne obojí

engine-e-lunar-terrain-terrain-max-range-km-must = terrain: max_range_km musí být konečné a kladné

engine-e-lunar-terrain-terrain-range-step-must-be = terrain: range_step_m musí být konečné a kladné

engine-e-lunar-terrain-site-deg-deg = { $e } (místo { $lat_deg } deg, { $lon_deg } deg)

## src/lunar_time_budget_scenario.rs

engine-e-lunar-time-budget-scenario-unknown-clock-expected-one-of = neznámé hodiny { $other }; očekáváno jedno z optical-master, passive-h-maser, rafs, mini-rafs

engine-e-lunar-time-budget-scenario-clocks-must-name-at-least = clocks musí uvádět alespoň jednu třídu hodin

engine-e-lunar-time-budget-scenario-tau-min-must-be-finite = tau_min_s musí být konečné a kladné, zadáno { $lo }

engine-e-lunar-time-budget-scenario-tau-max-must-be-finite = tau_max_s musí být konečné a větší než tau_min_s ({ $lo }), zadáno { $hi }

engine-e-lunar-time-budget-scenario-points-per-decade-must-be = points_per_decade musí být ≥ 1

engine-e-lunar-time-budget-scenario-term-is-shorter-than-the = člen { $name } je kratší než mřížka tau

engine-lunar-time-budget-scenario-lunar-time-budget-clock-term = lunar-time-budget | hodiny { $clock } | 7členné x_Σ(τ) přes { $taus } bodů τ ({ $taus2 }–{ $taus3 } s) | průsečík τ { $crossover_tau_s } s (x { $crossover_x_s } s) | spodní mez soustavy { $frame_term_s } s | hodiny x(1 d) { $x_1day_ns } ns (MODELLED)

engine-lunar-time-budget-scenario-time-lab-to-ltc-ns = { $summary } | časová laboratoř: { $lab } { $lab2 } k LTC, x(1 d) { $lab3 } ns (MODELLED)

## src/lunar_time_lab.rs

engine-e-lunar-time-lab-time-lab-unknown-clock-expected = time_lab: neznámé hodiny { $other }; očekáváno jedno z optical-master, passive-h-maser, rafs, mini-rafs, nebo zadejte místo toho device_card

engine-e-lunar-time-lab-time-lab-give-either-clock = time_lab: zadejte buď clock, nebo device_card, ne obojí

engine-e-lunar-time-lab-time-lab-device-card = time_lab: device_card: { $e }

engine-e-lunar-time-lab-time-lab-steer-interval-must = time_lab: steer_interval_s musí být konečné a kladné, zadáno { $n }

engine-e-lunar-time-lab-time-lab-must-be-finite = time_lab: { $name } musí být konečné a nezáporné, zadáno { $v }

engine-e-lunar-time-lab-time-lab-horizons-must-be = time_lab: horizons_s musí být kladná čísla

engine-lunar-time-lab-station-height-not-modelled-exactly = výška stanice není modelována přesně: jednosigmová chyba výšky { $height_sigma_m } m zkresluje rychlost o { $value } ns/den, uplatněno jako lineární člen od posledního řízení

## src/lunar_vlbi.rs

engine-e-lunar-vlbi-light-time-did-not-converge = světelný čas nezkonvergoval na 1e-15 s během 30 iterací

engine-e-lunar-vlbi-the-kernel-path-needs-planetary = cesta k jádru vyžaduje společně planetary_kernel_path, earth_orientation_kernel_path a moon_orientation_kernel_path

## src/lunar_vlbi_fim.rs

engine-e-lunar-vlbi-fim-unknown-datum-expected-anchor-first = neznámý datum { $other }: očekáváno "anchor-first-station", "free-network" nebo "all-stations-fixed"

engine-e-lunar-vlbi-fim-vlbi-schedule-needs-at-least = plán VLBI potřebuje k vytvoření základny alespoň 2 stanice, zadáno { $raw }

engine-e-lunar-vlbi-fim-beacon-coordinates-must-be-finite = souřadnice majáku musí být konečné

engine-e-lunar-vlbi-fim-beacon-latitude-deg-is-outside = zeměpisná šířka majáku { $lat } deg je mimo [-90, 90]

engine-e-lunar-vlbi-fim-schedule-of-epochs-is-beyond = plán o { $v1 } epochách překračuje pojistku tohoto scénáře na 20000 epoch; zvětšete step_min nebo zkraťte arc_hours

engine-e-lunar-vlbi-fim-equipartition-must-be-positive-and = equipartition_g musí být kladné a konečné, zadáno { $g }

engine-e-lunar-vlbi-fim-serializing-lunar-vlbi-fim-result = serializace výsledku lunar-vlbi-fim: { $e }

engine-e-lunar-vlbi-fim-no-observation-in-the-schedule = žádné pozorování v plánu nepřekročí masku elevace { $mask } deg na obou koncích základny: epoch { $n_epochs } x základen { $v1 }, vše zamítnuto. Prodlužte arc_hours, snižte elevation_mask_deg nebo přemístěte stanice.

engine-e-lunar-vlbi-fim-the-datum-leaves-no-parameter = datum nenechává žádný parametr k odhadu

engine-lunar-vlbi-fim-rank-deficient-of-directions-are = RANK-DEFICIENT: { $defect } z { $dim } směrů je nepozorovatelných, proto se neuvádí žádná sigma pro jednotlivé souřadnice; níže uvedená hodnota pozorovatelného podprostoru je pseudoinverze omezená na { $rank } pozorovatelných směrů a NENÍ sigmou stanice

engine-lunar-vlbi-fim-lunar-vlbi-fim-stations-baselines = lunar-vlbi-fim | stanic { $n_stations } / základen { $v2 } x epoch { $n_epochs } = pozorování { $n_obs } (maska { $mask } deg) | datum { $datum } | hodnost { $rank }/{ $dim } cond { $condition } | sigma stanice { $v10 } vs. equipartition g={ $g } { $eq_g } m (poměr { $v13 })

## src/main.rs

engine-main-error-validate-needs-scenario-path = chyba: --validate vyžaduje cestu ke scénáři

engine-main-error-study-needs-suite-manifest = chyba: --study vyžaduje cestu k manifestu sady

engine-main-error-study-name-needs-value = chyba: --study-name vyžaduje hodnotu

engine-main-error-export-sp3-needs-path = chyba: --export-sp3 vyžaduje cestu

engine-main-error-export-omm-needs-path = chyba: --export-omm vyžaduje cestu

engine-main-error-export-oem-needs-path = chyba: --export-oem vyžaduje cestu

engine-main-error-animate-needs-format-svg = chyba: --animate vyžaduje formát: svg, html, frames nebo all

engine-main-error-animate = chyba: --animate: { $e }

engine-main-error-animate-fps-needs-whole = chyba: --animate-fps vyžaduje celé číslo snímků za sekundu

engine-main-error-export-needs-format-czml = chyba: --export vyžaduje formát: czml, kml, geojson, stk, sigmf, all nebo list

engine-main-error-animate-duration-needs-length = chyba: --animate-duration vyžaduje délku v sekundách

engine-main-error-import-route-needs-geojson = chyba: --import-route vyžaduje cestu k souboru GeoJSON

engine-main-error-eop-needs-finals2000a-file = chyba: --eop vyžaduje cestu k souboru finals2000A

engine-main-error-unknown-option = chyba: neznámá volba '{ $other }'

engine-main-error-unexpected-argument-one-scenario = chyba: neočekávaný argument '{ $other }'; na jeden běh připadá jeden soubor scénáře

engine-main-warning-animate-fps-and-animate = upozornění: --animate-fps a --animate-duration bez --animate nic nedělají

engine-main-error-animate-exports-one-scenario = chyba: --animate exportuje jeden běh scénáře; nekombinuje se s --validate ani --study

engine-main-error-validate-lints-one-scenario = chyba: --validate kontroluje jeden scénář; nezadávejte zároveň soubor scénáře

engine-main-error-cannot-read = chyba: nelze číst { $validate_file }: { $e }

engine-main-ok-kind-resolves-this-kind = ok: { $kind } — kind se rozpoznal; tento kind nevyžaduje žádné pole (prázdné tělo spustí jeho referenční konfiguraci), takže nebylo co dalšího kontrolovat

engine-main-error-study-runs-suite-do = chyba: --study spouští sadu; nezadávejte zároveň soubor jednoho scénáře

engine-main-warning-study-name-is-ignored = upozornění: --study-name se s --study ignoruje; studie se jmenuje podle `title =` v manifestu sady

engine-main-error-cannot-read-2 = chyba: nelze číst { $path }: { $e }

engine-main-hint-kshana-example-lists-the = nápověda: `kshana example` vypíše přibalené referenční scénáře; `kshana example clock-holdover > clock-holdover.toml` jeden zapíše

engine-main-error-cannot-read-3 = chyba: nelze číst { $eop_file }: { $e }

engine-main-error-eop = chyba: --eop: { $e }

engine-main-error-cannot-read-4 = chyba: nelze číst { $route_file }: { $e }

engine-main-error-import-route = chyba: --import-route: { $e }

engine-main-does-not-apply = { $fmt }: nepoužije se: { $why }

engine-main-error-export = chyba: --export: { $e }

engine-main-error-animate-2 = chyba: --animate { $f }: { $e }

engine-main-error-export-2 = chyba: export { $fmt }: { $e }

engine-main-error-cannot-write = chyba: nelze zapsat { $json_path }: { $e }

engine-main-error-cannot-write-2 = chyba: nelze zapsat { $svg_path }: { $e }

engine-main-error-cannot-build-the-report = chyba: nelze sestavit zprávu: { $e }

engine-main-error-cannot-write-3 = chyba: nelze zapsat { $html_path }: { $e }

engine-main-error-cannot-write-4 = chyba: nelze zapsat { $report_json_path }: { $e }

engine-main-error-cannot-write-5 = chyba: nelze zapsat { $csv_path }: { $e }

engine-main-wrote-and = zapsáno: { $json_path }, { $svg_path }, { $html_path }, { $report_json_path } a { $csv_path }

engine-main-wrote-and-2 = zapsáno: { $json_path }, { $svg_path }, { $html_path } a { $report_json_path }

engine-main-error-cannot-write-6 = chyba: nelze zapsat { $target }: { $e }

engine-main-error-cannot-write-7 = chyba: nelze zapsat { $sp3_path }: { $e }

engine-main-error-sp3-export-failed = chyba: export SP3 selhal: { $e }

engine-main-error-cannot-write-8 = chyba: nelze zapsat { $omm_path }: { $e }

engine-main-error-omm-export-failed = chyba: export OMM selhal: { $e }

engine-main-error-cannot-write-9 = chyba: nelze zapsat { $oem_path }: { $e }

engine-main-error-oem-export-failed = chyba: export OEM selhal: { $e }

engine-main-error-unexpected-argument-after-kinds = chyba: neočekávaný argument '{ $other }' za `kinds`; přijímá se pouze --json

engine-main-bundled-reference-scenarios-write-one =
    Přibalené referenční scénáře ({ $v1 }). Zapište jeden do souboru a spusťte ho:
    { "  " }kshana example clock-holdover > clock-holdover.toml
    { "  " }kshana clock-holdover.toml

engine-main-not-bundled-run-kshana-example = (nepřibaleno: { $name } — důvod zjistíte příkazem `kshana example { $name }`)

engine-main-error-is-not-bundled-it = chyba: '{ $name }' není přibaleno: { $why }

engine-main-error-no-bundled-scenario-named = chyba: žádný přibalený scénář s názvem '{ $name }'; `kshana example` vypíše přibalené (počet: { $v1 })

engine-main-error-cannot-read-5 = chyba: nelze číst { $suite_path }: { $e }

engine-main-wrote-and-3 = zapsáno: { $json_path } a { $html_path }

engine-main-error-needs-value = chyba: { $a } vyžaduje hodnotu

engine-main-error-expected-mean-needs-number = chyba: --expected-mean vyžaduje číslo

engine-main-error-unknown-imu-fit-option = chyba: neznámá volba imu-fit { $x }

engine-main-error-imu-fit-needs-an = chyba: imu-fit vyžaduje cestu k záznamu IMU

engine-main-error-needs-value-2 = chyba: { $args } vyžaduje hodnotu

engine-main-error-epoch = chyba: --epoch: { $e }

engine-main-error-unknown-bench-export-option = chyba: neznámá volba bench-export { $a }

engine-main-error-bench-export-needs-scenario = chyba: bench-export vyžaduje cestu ke scénáři

engine-main-needs-value = { $a } vyžaduje hodnotu

engine-main-site-takes-lat-lon-height = --site přijímá lat,lon[,height_m], zadáno { $v }

engine-main-error-is-bytes-the-tle = chyba: { $p } má { $m } bajtů; limit TLE je { $cap } (4 MiB)

engine-main-error-cannot-read-6 = chyba: nelze číst { $p }: { $e }

engine-main-unknown-sky-option = neznámá volba sky { $a }

engine-e-main-svg-and-monte-carlo-are = --svg a --monte-carlo jsou samostatné výstupy; zadejte jen jeden

engine-main-error-preset-needs-name =
    chyba: --preset vyžaduje název
    { $SKYLINE_USAGE }

engine-main-error-profile-needs-file =
    chyba: --profile vyžaduje soubor
    { $SKYLINE_USAGE }

engine-main-symbols-frame-found = symbolů: { $r }, nalezeno rámců: { $r2 }; { $v3 }

engine-main-frame-at-fid-toi-sb1 = { "  " }rámec na { $f }: FID { $f2 } TOI { $f3 } (metrika SB1 { $f4 }, chyb SP: { $f5 }, chyb SB1: { $f6 })

engine-main-not-checked = nekontrolováno: { $r }

engine-main-wrote-frame-of-6000-symbols = zapsáno { $out }: rámců: { $frames }, každý o 6000 symbolech; podrámce 2 až 4 jsou zástupné (bez kódování LDPC, bez zprávy)

engine-main-error-cannot-write-10 = chyba: nelze zapsat { $out }: { $e }

engine-main-unknown-lunanet-afs-check-subcommand = neznámý podpříkaz lunanet-afs-check { $other }

engine-main-needs-pack-id = { $cmd } vyžaduje id balíčku

engine-main-unknown-standards-pack-run-option = neznámá volba spuštění standards-pack { $a }

engine-main-unknown-standards-pack-subcommand = neznámý podpříkaz standards-pack { $other }

engine-main-error-out-needs-value = chyba: --out vyžaduje hodnotu

engine-main-error-unknown-compliance-report-option = chyba: neznámá volba compliance-report { $a }

engine-main-error-compliance-report-needs-at = chyba: compliance-report vyžaduje alespoň jeden soubor výsledků .json

engine-main-runs-read-not-used-rows = načteno běhů: { $runs }, nepoužito: { $unrecognised }; řádky: doloženo { $n }, částečně { $n2 }, nedoloženo { $n3 }, mimo rozsah { $n4 }

engine-main-error-receiver-trust-needs-scenario = chyba: receiver-trust vyžaduje cestu ke scénáři

engine-main-error-invalid-receiver-trust-scenario = chyba: neplatný scénář receiver-trust: { $e }

## src/maneuver.rs

engine-e-maneuver-burn-exhausts-mass-m0-kg = zážeh vyčerpá hmotnost: m0={ $m0_kg } kg, ṁ={ $mdot } kg/s, zážeh={ $burn_s } s ⇒ mf={ $mf } kg

engine-e-maneuver-time-of-flight-must-be = doba letu musí být kladná

engine-e-maneuver-collinear-endpoints-transfer-plane-is = kolineární koncové body: rovina přechodu je nedefinovaná (≈0°/180°)

engine-e-maneuver-lambert-revs-is-for-use = lambert_revs je pro M >= 1; pro M = 0 použijte lambert

engine-e-maneuver-no-revolution-transfer-the-time = přechod s { $revs } oběhy neexistuje: doba letu je pod svým minimem

engine-e-maneuver-grid-step-days-must-be = grid_step_days musí být kladné, zadáno { $grid_step_days }

engine-e-maneuver-each-window-must-run-forward = každé okno musí směřovat dopředu (start <= end)

engine-e-maneuver-no-transfer-of-the-requested = v oknech není žádný přechod požadovaného typu

engine-e-maneuver-the-optimum-left-the-feasible = optimum opustilo přípustnou oblast

## src/mars_od.rs

engine-e-mars-od-dss = DSS-{ $id } { $field }: { $e }

engine-e-mars-od-dss-expected-values = DSS-{ $id } { $field }: očekávány 3 hodnoty

engine-e-mars-od-dss-epoch-is-not-2003 = epocha DSS-{ $id } není 2003-JAN-01: { $val }

engine-e-mars-od-dss-has-no-dxyz = DSS-{ $id } nemá DXYZ

engine-e-mars-od-no-coordinates-for-dss = žádné souřadnice pro DSS { $station }

engine-e-mars-od-no-ramps-for-dss = žádné rampy pro DSS { $station }

engine-e-mars-od-ramp-table-does-not-cover = tabulka ramp nepokrývá interval

engine-e-mars-od-epoch-outside-the-integrated-span = epocha { $et } leží mimo integrovaný rozsah

## src/mars_od.rs

engine-e-mars-od-normal-matrix-is-not-positive = normální matice není kladně definitní

engine-e-mars-od-no-points = žádné body

engine-e-mars-od-parameter-has-no-partial-on = parametr nemá na ponechaných bodech žádnou parciální derivaci

## src/mars_pnt.rs

engine-mars-pnt-mars-pnt-user-clock-relays = mars-pnt { $r } | uživatel: { $user }, hodiny: { $clock_class } | relé: { $n_relays } (průměr { $mean_relays_in_view } ve výhledu) | zkonvergovaná poloha RMS { $converged_pos_rms_m } m, formální 1σ { $converged_pos_sigma_m } m (3σ { $converged_pos_3sigma_m } m — ukazatel kvality z kovariance, nejde o schválenou ochrannou úroveň) | σ frekvence hodin { $final_clock_freq_sigma } | cov-PD { $covariance_pd_throughout }

engine-mars-pnt-mars-pnt-user-clock-position = Mars-PNT — uživatel: { $user }, hodiny: { $clock_class }: 3D chyba polohy vůči skutečnosti (zkonvergované RMS { $converged_pos_rms_m } m)

## src/mcda/ahp.rs

engine-e-mcda-ahp-pairwise-matrix-is-empty = matice párových srovnání je prázdná

engine-e-mcda-ahp-pairwise-matrix-is-not-square = matice párových srovnání není čtvercová (řádek { $i } má { $row } z { $n })

engine-e-mcda-ahp-entry-must-be-finite-and = prvek a[{ $i }][{ $j }] = { $v } musí být konečný a kladný

engine-e-mcda-ahp-diagonal-must-be = diagonála a[{ $i }][{ $i }] = { $row } musí být 1

engine-e-mcda-ahp-entries-must-be-reciprocal = prvky a[{ $i }][{ $j }]·a[{ $j }][{ $i }] = { $prod } musí být vzájemně převrácené (≈ 1)

engine-e-mcda-ahp-upper-row-has-entries-expected = horní řádek { $i } má { $row } prvků, očekáváno { $v2 }

engine-e-mcda-ahp-upper-entry-must-be-finite = horní prvek ({ $i },{ $j }) = { $v } musí být konečný a kladný

## src/mcda/copras.rs

engine-e-mcda-copras-copras-empty-decision-matrix = COPRAS: prázdná rozhodovací matice

engine-e-mcda-copras-copras-no-criteria = COPRAS: žádná kritéria

engine-e-mcda-copras-copras-requires-at-least-one = COPRAS: vyžaduje alespoň jedno nákladové kritérium (Min)

engine-e-mcda-copras-copras-alternative-criterion-value-must = COPRAS: alternativa { $i }, kritérium { $j }: hodnota { $x } musí být konečná a > 0

## src/mcda/electre.rs

engine-e-mcda-electre-electre-empty-dataset = ELECTRE I: prázdný soubor dat

engine-e-mcda-electre-electre-no-criteria = ELECTRE I: žádná kritéria

engine-e-mcda-electre-electre-alternative-has-non-finite = ELECTRE I: alternativa { $i } má nekonečnou hodnotu

## src/mcda/moora.rs

engine-e-mcda-moora-moora-empty-decision-matrix = MOORA: prázdná rozhodovací matice

engine-e-mcda-moora-moora-no-criteria = MOORA: žádná kritéria

engine-e-mcda-moora-moora-alternative-has-non-finite = MOORA: alternativa { $i } má nekonečnou hodnotu

engine-e-mcda-moora-moora-criterion-has-zero-l2 = MOORA: kritérium { $j } má nulovou normu L2

## src/mcda/promethee.rs

engine-e-mcda-promethee-promethee-ii-empty-decision-matrix = PROMETHEE II: prázdná rozhodovací matice

engine-e-mcda-promethee-promethee-ii-no-criteria = PROMETHEE II: žádná kritéria

engine-e-mcda-promethee-promethee-ii-alternative-has-non = PROMETHEE II: alternativa { $i } má nekonečnou hodnotu

## src/mcda/topsis.rs

engine-e-mcda-topsis-topsis-empty-decision-matrix = TOPSIS: prázdná rozhodovací matice

engine-e-mcda-topsis-topsis-no-criteria = TOPSIS: žádná kritéria

engine-e-mcda-topsis-topsis-alternative-has-non-finite = TOPSIS: alternativa { $i } má nekonečnou hodnotu

## src/mcda/utility.rs

engine-e-mcda-utility-additive-utility-has-no-attributes = aditivní užitek nemá žádné atributy

engine-e-mcda-utility-attributes-but-weights = atributů { $attributes }, ale vah { $weights }

engine-e-mcda-utility-invalid-scaling-constant = neplatná škálovací konstanta { $w }

engine-e-mcda-utility-scaling-constants-sum-to-zero = součet škálovacích konstant je nula

engine-e-mcda-utility-attribute-values-expected-got = očekáváno hodnot atributů: { $attributes }, zadáno: { $x }

## src/mcda/vikor.rs

engine-e-mcda-vikor-vikor-empty-decision-matrix = VIKOR: prázdná rozhodovací matice

engine-e-mcda-vikor-vikor-no-criteria = VIKOR: žádná kritéria

engine-e-mcda-vikor-vikor-alternative-has-non-finite = VIKOR: alternativa { $i } má nekonečnou hodnotu

## src/mcda/waspas.rs

engine-e-mcda-waspas-waspas-empty-decision-matrix = WASPAS: prázdná rozhodovací matice

engine-e-mcda-waspas-waspas-no-criteria = WASPAS: žádná kritéria

engine-e-mcda-waspas-waspas-lambda-must-lie-in = WASPAS: lambda { $lambda } musí ležet v [0, 1]

engine-e-mcda-waspas-waspas-alternative-criterion-value-must = WASPAS: alternativa { $i }, kritérium { $j }: hodnota { $x } musí být konečná a > 0

## src/mcda/wpm.rs

engine-e-mcda-wpm-wpm-empty-decision-matrix = WPM: prázdná rozhodovací matice

engine-e-mcda-wpm-wpm-no-criteria = WPM: žádná kritéria

engine-e-mcda-wpm-wpm-alternative-criterion-value-must = WPM: alternativa { $i }, kritérium { $j }: hodnota { $x } musí být konečná a > 0

## src/mcda/wsm.rs

engine-e-mcda-wsm-decision-matrix-has-no-criteria = rozhodovací matice nemá žádná kritéria

engine-e-mcda-wsm-decision-matrix-has-no-alternatives = rozhodovací matice nemá žádné alternativy

engine-e-mcda-wsm-criterion-has-an-invalid-weight = kritérium '{ $name }' má neplatnou váhu { $weight }

engine-e-mcda-wsm-criterion-weights-sum-to-zero = součet vah kritérií je nula

engine-e-mcda-wsm-alternative-has-non-finite-value = alternativa '{ $name }' má nekonečnou hodnotu u kritéria '{ $value }'

## src/naif_kernel.rs

engine-e-naif-kernel-not-daf-shorter-than-one = není DAF: kratší než jeden záznam

engine-e-naif-kernel-not-daf-identification-word = není DAF: identifikační slovo { $id_word }

engine-e-naif-kernel-unsupported-daf-binary-format = nepodporovaný binární formát DAF { $other }

engine-e-naif-kernel-implausible-daf-header-nd-ni = nepravděpodobná hlavička DAF: ND { $nd }, NI { $ni }, FWARD { $fward }

engine-e-naif-kernel-daf-address-beyond-the-end = adresa DAF { $addr } je za koncem souboru

engine-e-naif-kernel-bad-daf-address-range = chybný rozsah adres DAF { $first }..={ $last }

engine-e-naif-kernel-daf-summary-list-does-not = seznam souhrnů DAF nekončí

engine-e-naif-kernel-malformed-type-segment-rsize-intlen = poškozený segment typu 2: RSIZE { $rsize }, INTLEN { $intlen }, N { $n }

engine-e-naif-kernel-type-segment-size-does-not = velikost segmentu typu 2 neodpovídá jeho adresáři

engine-e-naif-kernel-epoch-outside-the-record = epocha { $et } je mimo záznam [{ $v1 }, { $v2 }]

engine-e-naif-kernel-type-segment-size-does-not-2 = velikost segmentu typu 1 neodpovídá jeho N = { $n }

engine-e-naif-kernel-malformed-type-record-kqmax1-kq = poškozený záznam typu 1: KQMAX1 { $kqmax1 }, KQ { $kq }

engine-e-naif-kernel-not-an-spk = není SPK: { $id_word }

engine-e-naif-kernel-spk-summary-is-not-nd = souhrn SPK není ND=2, NI=6

engine-e-naif-kernel-no-spk-type-data-for = žádná data SPK typu 1/2 pro těleso { $target } v ET { $et }

engine-e-naif-kernel-spk-segment-for-is-in = segment SPK pro { $target } je v soustavě { $frame }, ne J2000

engine-e-naif-kernel-spk-centre-chain-does-not = řetězec center SPK nedosahuje barycentra

engine-e-naif-kernel-not-binary-pck = není binární PCK: { $id_word }

engine-e-naif-kernel-pck-summary-is-not-nd = souhrn PCK není ND=2, NI=5

engine-e-naif-kernel-no-pck-type-data-for = žádná data PCK typu 2 pro soustavu { $body_frame } v ET { $et }

engine-e-naif-kernel-pck-frame-is-given-against = soustava PCK { $body_frame } je zadána vůči soustavě { $other }, která není J2000 ani ECLIPJ2000

## src/navsignal.rs

engine-e-navsignal-bad-number = chybné číslo { $s }

engine-e-navsignal-must-be-positive-number = { $s } musí být kladné číslo

engine-e-navsignal-modulation-expected-name-args-bpsk = modulace { $label }: očekáváno NAME(args), např. BPSK(10)

engine-e-navsignal-modulation-missing-closing-parenthesis = modulace { $label }: chybí uzavírací závorka

engine-e-navsignal-modulation-is-not-one-of = modulace { $label } není žádná z BPSK(n), BOC(m,n) ani MBOC(6,1,p)

## src/ndm_xml.rs

engine-e-ndm-xml-unterminated-entity-in = neukončená entita v { $s }

engine-e-ndm-xml-bad-character-reference = chybný odkaz na znak &{ $ent };

engine-e-ndm-xml-unknown-entity = neznámá entita &{ $ent };

engine-e-ndm-xml-unterminated-processing-instruction = neukončená zpracovávací instrukce

engine-e-ndm-xml-unterminated-comment = neukončený komentář

engine-e-ndm-xml-unterminated-declaration = neukončená deklarace

engine-e-ndm-xml-expected-an-element-at-byte = očekáván element na bajtu { $pos }

engine-e-ndm-xml-unterminated-start-tag = neukončená počáteční značka

engine-e-ndm-xml-attribute-without-value = atribut bez hodnoty

engine-e-ndm-xml-unterminated-attribute-value = neukončená hodnota atributu

engine-e-ndm-xml-unterminated-end-tag = neukončená koncová značka

engine-e-ndm-xml-unterminated-cdata = neukončená sekce CDATA

engine-e-ndm-xml-content-after-the-root-element = obsah za kořenovým elementem

## src/nma_budget.rs

engine-e-nma-budget-must-be-finite-and-non = { $name } musí být konečné a nezáporné

engine-e-nma-budget-subframe-must-be-positive = subframe_s musí být kladné

engine-e-nma-budget-nav-data-rate-bps-must = nav_data_rate_bps musí být kladné

## src/nmea_synth/cli.rs

engine-e-nmea-synth-cli-speed-must-be-or-positive = --speed musí být 0 nebo kladné

engine-e-nmea-synth-cli-unexpected-argument = neočekávaný argument { $s }

engine-nmea-synth-cli-instructor-log = záznam instruktora: { $e }

engine-nmea-synth-cli-instructor-log-and = záznam instruktora: { $jp } a { $tp }

engine-nmea-synth-cli-tcp-server-listening-on-waiting = Server TCP naslouchá na { $s }; čeká se na klienty: { $wait_clients }

## src/nmea_synth/clock.rs

engine-e-nmea-synth-clock-expected-yyyy-mm-ddthh-mm = očekáváno YYYY-MM-DDTHH:MM:SSZ

engine-e-nmea-synth-clock-date-or-time-out-of = datum nebo čas mimo rozsah (roky 1980 až 2099)

engine-e-nmea-synth-clock-no-such-calendar-date = takové kalendářní datum neexistuje

## src/nmea_synth/config.rs

engine-e-nmea-synth-config-must-be-finite-number = { $name } musí být konečné číslo

engine-e-nmea-synth-config-scenario-start-utc = scenario.start_utc { $start_utc }: { $e }

engine-e-nmea-synth-config-scenario-duration-must-lie-in = scenario.duration_s musí ležet v rozsahu 1 až 86400 s

engine-e-nmea-synth-config-scenario-rate-hz-must-be = scenario.rate_hz musí být 1, 2, 5 nebo 10

engine-e-nmea-synth-config-vessel-position-must-lie-within = poloha plavidla musí ležet do 89 stupňů od rovníku

engine-e-nmea-synth-config-vessel-speed-kn-must-lie = vessel.speed_kn musí ležet v rozsahu 0 až 60

engine-e-nmea-synth-config-vessel-rate-of-turn-and = limity úhlové rychlosti zatáčení a zrychlení plavidla musí být kladné

engine-e-nmea-synth-config-give-at-least-one-waypoint = zadejte alespoň jeden [[waypoint]] nebo vessel.heading_deg

engine-e-nmea-synth-config-waypoint-is-out-of-range = waypoint { $v1 } je mimo rozsah

engine-e-nmea-synth-config-waypoint-speed-kn-must-lie = waypoint { $v1 }: speed_kn musí ležet v rozsahu 0 až 60

engine-e-nmea-synth-config-receiver-systems-must-name-at = receiver.systems musí uvádět alespoň jednu konstelaci

engine-e-nmea-synth-config-output-sentences-is-not-one = output.sentences: { $s } není žádná z { $all_sentences }

engine-e-nmea-synth-config-output-log-interval-must-be = output.log_interval_s musí být alespoň 1

engine-e-nmea-synth-config-event = událost { $v1 } ({ $kind }): { $why }

engine-e-nmea-synth-config-start-must-lie-inside-the = start_s musí ležet uvnitř běhu

engine-e-nmea-synth-config-duration-must-be-positive-ramp = duration_s musí být kladné; ramp_s a recovery_s nezáporné

engine-e-nmea-synth-config-ramp-must-not-exceed-duration = ramp_s nesmí překročit duration_s

engine-e-nmea-synth-config-does-not-apply-to-this = { $n } se pro tento druh nepoužije

engine-e-nmea-synth-config-counterfeit-cn0-dbhz-must-lie = counterfeit_cn0_dbhz musí ležet v rozsahu 20 až 60

engine-e-nmea-synth-config-cn0-drop-db-is-required = cn0_drop_db je povinné

engine-e-nmea-synth-config-cn0-drop-db-must-lie = cn0_drop_db musí ležet v rozsahu 0 až 80

engine-e-nmea-synth-config-spread-db-must-lie-in = spread_db musí ležet v rozsahu 0 až 30

engine-e-nmea-synth-config-final-offset-is-required = final_offset_m je povinné

engine-e-nmea-synth-config-final-offset-must-lie-in = final_offset_m musí ležet v rozsahu 0 až 500000

engine-e-nmea-synth-config-the-drag-would-accelerate-the = odtažení by zrychlovalo falešnou stopu až na { $need } m/s^2, nad max_accel_mps2 = { $a }; prodlužte ramp_s/recovery_s

engine-e-nmea-synth-config-give-exactly-one-of-bearing = zadejte právě jedno z bearing_deg, relative_bearing_deg

engine-e-nmea-synth-config-offset-is-required = offset_s je povinné

engine-e-nmea-synth-config-offset-must-be-non-zero = offset_s musí být nenulové a v rozsahu do jednoho dne

engine-e-nmea-synth-config-delay-is-required = delay_s je povinné

engine-e-nmea-synth-config-delay-must-lie-in-to = delay_s musí ležet v rozsahu 0 až 3600

engine-e-nmea-synth-config-the-skyline-describes-no-obstruction = obrys horizontu nepopisuje žádnou překážku

## src/nmea_synth/gen.rs

engine-nmea-synth-gen-has-ended = { $kind } skončilo

## src/nmea_synth/log.rs

engine-nmea-synth-log-from-for-onset-ramp-recovery = od T+{ $start_s } s po dobu { $duration_s } s (náběh { $ramp_s } s, doběh { $recovery_s } s)

engine-nmea-synth-log-every-tracked-satellite-shows-db = ; každá sledovaná družice ukazuje { $c } dB-Hz po celou dobu události

engine-nmea-synth-log-jamming-received-n0-falls-by = rušení (jamming): přijímané C/N0 klesá až o { $cn0_drop_db } dB (rozptyl mezi družicemi { $spread_db } dB); družice vypadávají a řešení polohy se ztratí, když zůstanou použitelné méně než čtyři

engine-nmea-synth-log-towards-deg-true = směrem { $b } deg pravého azimutu

engine-nmea-synth-log-towards-deg-true-deg-relative = směrem { $t } deg pravého azimutu ({ $r } deg relativně ke kursu při nástupu, poté drženo)

engine-nmea-synth-log-position-drag-off-the-reported = odtažení polohy: hlášená poloha se vzdaluje o { $final_offset_m } m, směr { $dir }, zatímco přijímač udržuje platné řešení polohy (falešná stopa dosahuje špičky { $pv } m/s a { $pa } m/s^2){ $cf }

engine-nmea-synth-log-time-spoof-reported-utc-moves = podvržení času: hlášené UTC se odchyluje o { $offset_s } s od skutečného; poloha zůstává skutečná{ $cf }

engine-nmea-synth-log-replay-delay-meaconing-style-position = zpoždění přehrávání (typ meaconing): poloha{ $v1 } zaostává za skutečností o { $delay_s } s{ $cf }

engine-nmea-synth-log-natural-degradation-the-sky-closes = přirozená degradace: obloha se uzavírá za uvedeným obrysem horizontu ({ $e }); družice za ním zůstávají uvedeny bez SNR a nepoužívají se, C/N0 ostatních se nemění a nic není falešné

engine-nmea-synth-log-instructor-log = ZÁZNAM INSTRUKTORA: { $scenario }{ "\u000A" }

engine-nmea-synth-log-trainer-note = Poznámka školitele: { $trainer_note }{ "\u000A\u000A" }

engine-nmea-synth-log-start-duration-seed = Začátek { $start_utc }   trvání { $duration_s } s   seed { $seed }{ "\u000A\u000A" }

engine-nmea-synth-log-peaks-true-kn-reported-kn = { "\u000A" }ŠPIČKY  skutečné: { $true_peak_sog_kn } kn, { $true_peak_accel_mps2 } m/s^2   hlášené: { $reported_peak_sog_kn } kn, { $reported_peak_accel_mps2 } m/s^2{ "\u000A" }

## src/nmea_synth/sky.rs

engine-e-nmea-synth-sky-receiver-systems-unknown-constellation-gps = receiver.systems: neznámá konstelace { $other } (gps, glonass, galileo, beidou)

## src/observability_gramian.rs

engine-observability-gramian-the-tolerance-is-below-the = { " " }Tolerance je pod úrovní šumu čtení hodnosti ve f64 { $RANK_TOLERANCE_NOISE_FLOOR } (= sqrt(f64::EPSILON)): jí odpovídající mez vlastních čísel rel_tol^2 = { $v1 } leží pod zaokrouhlovacím šumem Gramovy matice, takže další směry jsou aritmetický zbytek, nikoli pozorovatelnost.

engine-observability-gramian-rank-clamped-from-the-singular = hodnost omezena z počtu singulárních hodnot { $counted } na min(rows, cols) = min({ $n_rows }, { $n_cols }) = { $shape_bound } při rel_tol { $rel_tol }: matice { $n_rows }x{ $n_cols } nemůže mít hodnost { $counted }.{ $floor_note }

## src/odf.rs

engine-e-odf-bytes-is-not-whole-number = { $bytes } bajtů není celočíselný násobek 36bajtových záznamů

engine-e-odf-record-precedes-any-group-header = záznam { $v1 } předchází jakékoli hlavičce skupiny

engine-e-odf-no-orbit-data-group = žádná skupina dat oběžné dráhy

## src/odm.rs

engine-e-odm-is-not-keyword-of = { $k } není klíčové slovo { $name }

engine-e-odm-without = { $name } bez { $k }

engine-e-odm-needs-exactly-one-of = { $name } vyžaduje právě jedno z { $group }

engine-e-odm-classification-and-message-id-are = CLASSIFICATION a MESSAGE_ID jsou klíčová slova hlavičky verze 3.0 (verze { $version })

engine-e-odm-unexpected-line = neočekávaný řádek { $b }

engine-e-odm-unknown-keyword = neznámé klíčové slovo { $k }

engine-e-odm-block-repeated-or-out-of = blok { $block } opakován nebo mimo pořadí u { $key }

engine-e-odm-repeated = { $key } opakováno

engine-e-odm-comments-after-the-last-keyword = komentáře za posledním klíčovým slovem

engine-e-odm-given-twice = { $b } zadáno dvakrát

engine-e-odm-opm-without-metadata = OPM bez metadat

engine-e-odm-opm-without-state-vector = OPM bez stavového vektoru

engine-e-odm-omm-without-metadata = OMM bez metadat

engine-e-odm-omm-without-mean-elements = OMM bez středních elementů

engine-e-odm-is-not-keyword-of-the = { $k } není klíčové slovo bloku { $kind }

engine-e-odm-block-without = blok { $kind } bez { $k }

engine-e-odm-block-with-data-lines = blok { $kind } s datovými řádky

engine-e-odm-line-has-values-expected = { $kind }, řádek { $l }: hodnot { $l2 }, očekáváno { $n }

engine-e-odm-is-not-an-ocm-metadata = { $k } není klíčové slovo metadat OCM

engine-e-odm-ocm-metadata-without = metadata OCM bez { $k }

engine-e-odm-block-repeated = blok { $kind } opakován

engine-e-odm-inside-block = { $t } uvnitř bloku

engine-e-odm-unsupported-ocm-block = nepodporovaný blok OCM { $tag }

engine-odm-outside-block = { $t } mimo blok

engine-e-odm-closes-block = { $t } uzavírá blok { $want }

engine-e-odm-unexpected-line-2 = neočekávaný řádek { $t }

engine-e-odm-outside-block = { $k } mimo blok

engine-e-odm-unterminated-block = neukončený blok

## src/oem.rs

engine-e-oem-epoch-missing-date-time-separator = v epoše chybí oddělovač data a času 'T': { $s }

engine-e-oem-unsupported-oem-epoch-date-expected = nepodporované datum epochy OEM '{ $date }' (očekáváno yyyy-mm-dd)

engine-e-oem-unsupported-oem-epoch-time-expected = nepodporovaný čas epochy OEM '{ $time }' (očekáváno HH:MM:SS)

engine-e-oem-bad-epoch-year = chybný rok epochy: { $d }

engine-e-oem-bad-epoch-month = chybný měsíc epochy: { $d }

engine-e-oem-bad-epoch-day = chybný den epochy: { $d }

engine-e-oem-bad-epoch-hour = chybná hodina epochy: { $t }

engine-e-oem-bad-epoch-minute = chybná minuta epochy: { $t }

engine-e-oem-bad-epoch-second = chybná sekunda epochy: { $t }

engine-e-oem-oem-epoch-field-out-of = pole epochy OEM mimo rozsah: { $s }

engine-e-oem-unexpected-oem-header-line = neočekávaný řádek hlavičky OEM: { $line }

engine-e-oem-expected-meta-start-found = očekáváno META_START, nalezeno: { $line }

engine-e-oem-unexpected-oem-metadata-line = neočekávaný řádek metadat OEM: { $line }

engine-e-oem-oem-segment-metadata-missing-meta = v metadatech segmentu OEM chybí META_STOP

engine-e-oem-oem-metadata-missing-object-name = v metadatech OEM chybí OBJECT_NAME

engine-e-oem-oem-metadata-missing-object-id = v metadatech OEM chybí OBJECT_ID

engine-e-oem-oem-metadata-missing-center-name = v metadatech OEM chybí CENTER_NAME

engine-e-oem-oem-metadata-missing-ref-frame = v metadatech OEM chybí REF_FRAME

engine-e-oem-oem-metadata-missing-time-system = v metadatech OEM chybí TIME_SYSTEM

engine-e-oem-oem-metadata-missing-start-time = v metadatech OEM chybí START_TIME

engine-e-oem-oem-metadata-missing-stop-time = v metadatech OEM chybí STOP_TIME

engine-e-oem-oem-data-line-needs-position = datový řádek OEM vyžaduje složky polohy+rychlosti (6) nebo +zrychlení (9), zadáno { $n }: { $line }

engine-e-oem-non-numeric-oem-state-value = nečíselná hodnota stavu OEM '{ $t }' v: { $line }

engine-e-oem-oem-missing-ccsds-oem-vers = v OEM chybí hlavička CCSDS_OEM_VERS

engine-e-oem-oem-missing-creation-date-header = v OEM chybí hlavička CREATION_DATE

engine-e-oem-oem-missing-originator-header = v OEM chybí hlavička ORIGINATOR

engine-e-oem-oem-carried-no-segments = OEM neobsahovalo žádné segmenty

engine-e-oem-no-covariance-start-block = žádný blok COVARIANCE_START

engine-e-oem-no-covariance-stop = žádné COVARIANCE_STOP

engine-e-oem-bad-covariance-value = chybná hodnota kovariance '{ $tok }': { $e }

engine-e-oem-expected-21-covariance-values-found = očekáváno 21 hodnot kovariance, nalezeno { $vals }

## src/omm.rs

engine-e-omm-omm-export-needs-full-line = export OMM vyžaduje úplné TLE (řádek 1 + řádek 2); tento blok žádné nemá

## src/optical_atmosphere_scenario.rs

engine-e-optical-atmosphere-scenario-must-be-in = { $n } musí ležet v [0, 1]

engine-e-optical-atmosphere-scenario-elevation-deg-must-be-in = elevation_deg musí ležet v [5, 90]

engine-e-optical-atmosphere-scenario-atmosphere-wave-must-be-plane = atmosphere.wave musí být "plane" nebo "spherical"

engine-e-optical-atmosphere-scenario-atmosphere-direction-must-be-downlink = atmosphere.direction musí být "downlink" nebo "uplink"

engine-e-optical-atmosphere-scenario-availability-targets-pct-entries-must = položky availability_targets_pct musí ležet v (0, 100)

engine-e-optical-atmosphere-scenario-timeseries-duration-must-be-at = timeseries.duration_h musí být nejvýše 8760 (jeden rok)

engine-e-optical-atmosphere-scenario-timeseries-steps-is-above-the = timeseries: kroků { $steps } překračuje počet { $MAX_STEPS }, který výsledek nese; zvyšte step_s nebo zkraťte duration_h

engine-e-optical-atmosphere-scenario-unknown-clock-class = neznámá třída hodin "{ $c }"

engine-e-optical-atmosphere-scenario-every-site-needs-name = každé místo potřebuje název

engine-e-optical-atmosphere-scenario-site-latitude-longitude-out-of = místo { $name }: zeměpisná šířka/délka mimo rozsah

engine-e-optical-atmosphere-scenario-site-altitude-must-be-in = místo { $name }: altitude_m musí ležet v [0, top)

engine-optical-atmosphere-scenario-optical-atmosphere-nm-at-deg = optical-atmosphere: { $wavelength_nm } nm při elevaci { $elevation_deg } deg, rezerva { $margin0 } dB před atmosférou; nejlepší místo { $scn } { $v5 } %; síť míst ({ $order }): { $last } % při nezávislém / { $last2 } % při korelovaném počasí (MODELLED, poradní)

## src/orbit.rs

engine-e-orbit-rinex-block-parsed-but-contained = blok RINEX byl zpracován, ale neobsahoval žádné podporované efemeridy

## src/orbit.rs

engine-e-orbit-user-site-lat-deg-must = user_site: lat_deg musí ležet v [-90, 90] a každé pole musí být konečné

engine-e-orbit-no-satellites-to-export = žádné družice k exportu

engine-e-orbit-time-step-must-be-positive = time.step_s musí být pro export SP3 kladné

engine-e-orbit-time-step-must-be-positive-2 = time.step_s musí být pro export OEM kladné

## src/orbital_timing.rs

engine-e-orbital-timing-must-be-positive-got = { $name } musí být kladné; zadáno { $v }

engine-e-orbital-timing-receiver-time-sigma-must-be = receiver_time_sigma_s musí být konečné a nezáporné

engine-e-orbital-timing-max-ramp-rate-must-be = max_ramp_rate musí být konečné a nezáporné

engine-e-orbital-timing-spoofer-minimum-elevation-must-be = minimální elevace spoofera musí ležet v [0, 90) stupních

engine-e-orbital-timing-cross-check-sigma-ns-must = sigma_ns křížové kontroly musí být konečné a nezáporné

engine-orbital-timing-the-in-plane-neighbour-degrees = soused ve stejné rovině, vpředu o { $v1 } deg, leží mimo záběr jednoho spoofera (průměr { $v2 } deg)

engine-orbital-timing-the-in-plane-neighbour-degrees-2 = soused ve stejné rovině, vpředu o { $v1 } deg, může ležet uvnitř záběru téhož spoofera (průměr { $v2 } deg), takže oboje hodiny mohou být strženy společně

## src/osnma/cli.rs

engine-e-osnma-cli-missing-input-file = chybí vstupní soubor

engine-e-osnma-cli-max-time-error-has-no = --max-time-error nemá bez --reference-time žádný účinek

engine-e-osnma-cli-not-number = není číslo: { $s }

engine-e-osnma-cli-public-key-must-be-id = veřejný klíč musí mít tvar ID:TYPE:HEX

engine-e-osnma-cli-public-key-type-must-be = typ veřejného klíče musí být p256 nebo p521

engine-e-osnma-cli-unknown-format = neznámý formát { $f }

engine-e-osnma-cli-is-not-text-use-format = { $label } není text; pro proud UBX použijte --format ubx

engine-e-osnma-cli-vector-csv-needs-start-gst = vektorový CSV vyžaduje --start-gst nebo název souboru s datem

engine-osnma-cli-error-cannot-read =
    { $ADVISORY }

    chyba: nelze číst { $input }: { $e }

engine-osnma-cli-galileo-osnma-verification =
    Ověření Galileo OSNMA
    { $ADVISORY }{ "\u000A" }

engine-osnma-cli-input-pages = vstup: { $input } (stránek: { $pages })

engine-osnma-cli-ubx-frames-nav-pages-decoded = ubx: rámců { $frames }; dekódováno stránek I/NAV { $inav_pages }, časově zařazeno { $pages } (chybné CRC { $bad_crc }, nezařaditelných { $unstamped }, časových konfliktů { $time_conflicts })

engine-osnma-cli-overall-nma-status = celkově: { $status_word }   stav NMA: { $nma_status }

engine-osnma-cli-alert-verified-osnma-alert-message = UPOZORNĚNÍ: byla přijata ověřená výstražná zpráva OSNMA. Přestaňte používat data OSNMA; nic se nehlásí jako ověřené.

engine-osnma-cli-freshness-not-enforced-no-reference = aktuálnost: NEVYNUCENA. Nebyl zadán referenční čas, proto se časy podrámců přebírají ze vstupu a přehrání starých dat by se ověřilo.

engine-osnma-cli-freshness-sub-frames-within-of = aktuálnost: používají se podrámce do { $max_err } s od referenčního času { $v2 }; stranou odloženo: { $set_aside }. Referenční čas je jediný okamžik.

engine-osnma-cli-satellite-status-authenticated-failed-pending = { "\u000A" }družice    stav            ověřeno        selhalo  čeká     zahozeno   poslední ověření

engine-osnma-cli-epoch-tag-sub-frame-tx = { "\u000A" }epocha (podrámec značky)    tx   data  adkd  ctr  výsledek

## src/osnma/input.rs

engine-e-osnma-input-line-expected-fields = řádek { $v1 }: očekávány 3 pole

engine-e-osnma-input-line-bad-svid = řádek { $v1 }: chybné SVID

engine-e-osnma-input-line-bad-bit-count = řádek { $v1 }: chybný počet bitů

engine-e-osnma-input-line-data-is-not-hex = řádek { $v1 }: data nejsou hex

engine-e-osnma-input-line-bit-count-does-not = řádek { $v1 }: počet bitů neodpovídá datům

## src/osnma/verifier.rs

engine-e-osnma-verifier-the-time-tolerance-must-be = časová tolerance musí být menší než jeden podrámec ({ $SUBFRAME_S } s), zadáno { $t } s

## src/passes.rs

engine-e-passes-itu-834-refraction-is-defined = refrakce ITU-R P.834 je definována pro výšky stanice 0 až 3 km; zadáno { $h_km } km

engine-e-passes-duration-and-step-must-be = duration_s a step_s musí být kladné

engine-e-passes-station-lat-deg-must-be = station_lat_deg musí ležet v [-90, 90]

engine-e-passes-mask-deg-must-be-in = mask_deg musí ležet v [0, 90)

engine-e-passes-duration-hours-must-be-finite = duration_hours musí být konečné a kladné

engine-e-passes-step-must-be-finite-and = step_s musí být konečné a kladné

engine-passes-passes-pass-es-of-km = passes: přeletů: { $passes } na dráze { $altitude_km } km / { $inclination_deg }° nad ({ $station_lat_deg }°, { $station_lon_deg }°) > { $mask_deg }° za { $duration_hours } h; celkový přístup { $total_access_s } s (MODELLED)

## src/precise_products.rs

engine-e-precise-products-short-record = krátký záznam { $record }: { $line }

engine-e-precise-products-bad-number-in = chybné číslo { $s } v { $line }

engine-e-precise-products-bad-field-in = chybné pole { $s } v { $line }

engine-e-precise-products-bad-antex-epoch = chybná epocha ANTEX { $s }

engine-e-precise-products-bad-offset = chybný offset { $body }

## src/propagator.rs

engine-e-propagator-the-ephemeris-provider-has-no = poskytovatel efemerid nemá geocentrické { $name } v JD(TT) { $epoch_jd_tt }

## src/pvt.rs

engine-pvt-3d-error-rms-max = { " " }| 3D chyba RMS { $rms } m (max { $max } m)

engine-pvt-post-fit-rms = { " " }| RMS po fitu { $mean_postfit_rms_m } m

engine-pvt-single-point-positioning-3d-error = Jednobodové určení polohy — 3D chyba vůči zaměřeným souřadnicím (RMS { $rms_3d_m } m)

engine-pvt-single-point-positioning-post-fit = Jednobodové určení polohy — RMS reziduí po fitu (průměr { $mean_postfit_rms_m } m)

## src/python.rs

engine-e-python-runoutput-array-accessors-need-numpy = přístupové metody polí v RunOutput vyžadují NumPy (pip install numpy): { $e }

engine-e-python-is-not-numeric-array-list = { $path } není číselné pole (seznam čísel nebo seznamů čísel stejné délky)

engine-e-python-is-not-non-empty-list = { $path } není neprázdný seznam záznamů

engine-e-python-and-must-be-the-same = i a q musí mít stejnou délku ({ $i } vs. { $q })

engine-e-python-not-acquired-statistic-threshold = { $code }: nezískáno (statistika { $statistic } < práh { $threshold })

engine-python-design-prn-channels-at-most = kanálů (návrh, PRN): { $designs }; nejvýše 256 na jeden průchod

engine-python-not-acquired-statistic-threshold = { $code }: nezískáno (statistika { $statistic } < práh { $threshold })

engine-e-python-runs-needs-label = runs[{ $i }] vyžaduje `label`

engine-e-python-runs-needs-result = runs[{ $i }] vyžaduje `result`

engine-e-python-must-be-between-and-32 = { $name } musí být mezi 0 a 2**32 - 1

## src/qtrade.rs

engine-qtrade-seed-quantum-wins-foms = { $scenario } | seed { $seed } | v{ $engine_version } | kvantové vítězí v { $value }/{ $foms } FoM | { $status }

## src/quantum_devices.rs

engine-quantum-devices-sigma-from = sigma_y(1 s) = { $adev } z { $refr }

## src/quantum_trade.rs

engine-e-quantum-trade-unknown-baseline-clock-class-csac = neznámá baseline_clock_class '{ $s }' (csac|uso|dsac|tcxo|ocxo|rafs)

engine-e-quantum-trade-unknown-candidate-clock-class-optical = neznámá candidate_clock_class '{ $other }' (optical-lattice|trapped-ion|mercury-ion)

engine-e-quantum-trade-adev-taus-values-must-be = taus/values ADEV musí být konečné a > 0

engine-quantum-trade-quantum-trade-candidate-timing-holdover = quantum-trade | kandidát { $candidate_source } | časový holdover { $timing_holdover_s }s vs. { $timing_holdover_s2 }s ({ $timing_benefit_x }x) | inerciální { $inertial_holdover_s }s vs. { $inertial_holdover_s2 }s ({ $inertial_benefit_x }x) | doběh odolnosti { $coast_time_s }s{ $v9 } | MODELLED{ $v10 }

## src/realdata/clk.rs

engine-e-realdata-clk-rinex-clock-file-declares-time = soubor hodin RINEX deklaruje časovou soustavu { $id }, kterou tento čtecí modul nezná (známé: { $known_clock_time_systems }); odmítá se, místo aby se jeho epochy četly jako čas GPS

engine-e-realdata-clk-rinex-clock-file-has-satellite = soubor hodin RINEX obsahuje družicový systém { $other } a nedeklaruje TIME SYSTEM ID; odmítá se hádat časovou soustavu jeho epoch

engine-e-realdata-clk-rinex-clock-files-declare-different = soubory hodin RINEX deklarují různé časové soustavy ({ $s } a { $ts }); odmítá se je spojit na jedné časové ose

engine-e-realdata-clk-no-as-or-ar-records = žádné záznamy AS ani AR pro { $id }

engine-e-realdata-clk-short-circular-row = krátký řádek Circular T: { $t }

engine-e-realdata-clk-bad-value-in = chybná hodnota { $s } v { $t }

engine-e-realdata-clk-no-section-mjd-header-found = nenalezena hlavička MJD v sekci 1

## src/realdata/ion_sdr.rs

engine-e-realdata-ion-sdr-unterminated-closing-tag = neukončená koncová značka

engine-e-realdata-ion-sdr-unbalanced-closing-tag = nevyvážená koncová značka

engine-e-realdata-ion-sdr-unterminated-tag = neukončená značka

engine-e-realdata-ion-sdr-attribute-value-missing = chybí hodnota atributu

engine-e-realdata-ion-sdr-element-outside-the-document = element mimo dokument

engine-e-realdata-ion-sdr-text-outside-the-document = text mimo dokument

engine-e-realdata-ion-sdr-element-left-open = ponechané otevřené elementy: { $stack }

engine-e-realdata-ion-sdr-unknown-frequency-format = neznámý formát frekvence { $f }

engine-e-realdata-ion-sdr-unsupported-encoding = nepodporované kódování { $other }

engine-e-realdata-ion-sdr-streams-only-single-stream-files = proudů: { $streams }; čtou se pouze soubory s jedním proudem

engine-e-realdata-ion-sdr-block-of-cycles-with-header = blok o { $cycles } cyklech s hlavičkou nebo patičkou se opakuje; čte se pouze jediný blok pokrývající celý soubor

engine-e-realdata-ion-sdr-chunk-of-words-of-bytes = úsek o { $words_per_chunk } slovech po { $word_bytes } bajtech

engine-e-realdata-ion-sdr-unsupported-sample-format = nepodporovaný formát vzorků { $other }

engine-e-realdata-ion-sdr-quantization-in-packed-bits-per = kvantizace { $quantization } v { $packed_bits } zabalených bitech na vzorek

engine-e-realdata-ion-sdr-sample-rate-of-hz-is = vzorkovací frekvence { $sample_rate_hz } Hz není celočíselným násobkem faktoru { $samples_per_lump }

engine-e-realdata-ion-sdr-chunk-holds-no-whole-lump = úsek neobsahuje žádný celý blok

engine-e-realdata-ion-sdr-samples-requested-the-file-holds = požadovány vzorky { $start }..{ $v1 }, soubor jich obsahuje { $total }

## src/realdata/llr_crd.rs

engine-realdata-llr-crd-unreadable-crd-version = nečitelná verze CRD { $f }

engine-realdata-llr-crd-crd-format-version-is-not = verze formátu CRD { $v } není podporována (pořadí polí záznamu 11, na kterém tento čtecí modul stojí, sdílejí jen verze 1 a 2)

engine-realdata-llr-crd-unreadable-station-id = nečitelné id stanice { $f }

engine-realdata-llr-crd-unreadable-time-scale = nečitelná časová stupnice { $f }

engine-realdata-llr-crd-crd-epoch-time-scale-is = časová stupnice epochy CRD { $time_scale } není žádná ze tří, které podle specifikace formátu analytici přijímají (3 = UTC(USNO), 4 = UTC(GPS), 7 = UTC(BIH)); odmítá se ji číst jako UTC

engine-realdata-llr-crd-unreadable-h4-field = nečitelné pole h4 { $i }: { $f }

engine-realdata-llr-crd-unreadable-field = nečitelné pole { $i }: { $f }

engine-realdata-llr-crd-unreadable-epoch-event = nečitelná událost epochy { $f }

engine-realdata-llr-crd-non-physical-time-of-flight = nefyzikální doba letu { $tof }

engine-e-realdata-llr-crd-cannot-read-normal-point-directory = nelze číst adresář normálních bodů { $dir }: { $e }

engine-e-realdata-llr-crd-no-npt-normal-point-files = v { $dir } nejsou žádné soubory normálních bodů *.npt — tento scénář čte skutečná archivovaná měření a bez nich nepoběží

## src/realdata/lola_dem.rs

engine-e-realdata-lola-dem-bad-number = chybné číslo '{ $t }': { $e }

engine-e-realdata-lola-dem-dem-has-zero-dimension = DEM má nulový rozměr

## src/realdata/lugre.rs

engine-e-realdata-lugre-coding-lugre-batch-is-two = kódování { $encoding }: dávka LuGRE je ve dvojkovém doplňku

engine-e-realdata-lugre-bytes-shorter-than-the-iqs = { $bytes } bajtů: kratší než hlavička IQS

engine-e-realdata-lugre-not-an-iqs-frame = není rámec IQS: { $bytes }

engine-realdata-lugre-sample-rate-metadata-hz-header = vzorkovací frekvence: metadata { $sample_rate_hz } Hz, hlavička { $sampling_freq_hz } Hz

engine-realdata-lugre-quantisation-metadata-bits-header-bits = kvantizace: metadata { $quantization } bitů, hlavička { $quant_bits } bitů

engine-realdata-lugre-centre-frequency-metadata-hz-header = středová frekvence: metadata { $center_freq_hz } Hz, hlavička { $central_freq_hz } Hz

engine-realdata-lugre-intermediate-frequency-metadata-hz-header = mezifrekvence: metadata { $translated_freq_hz } Hz, hlavička { $intermediate_freq_hz } Hz

engine-realdata-lugre-sample-count-metadata-layout-gives = počet vzorků: rozložení z metadat dává { $layout }, hlavička { $n_samples }

engine-realdata-lugre-header-footer-metadata-bytes-format = hlavička/patička: metadata { $header_bytes }/{ $footer_bytes } bajtů, formát { $IQS_HEADER_BYTES }/{ $IQS_FOOTER_BYTES }

engine-realdata-lugre-file-length-is-not-header = délka souboru { $file_len } není hlavička + { $value } bajtů vzorků + patička

engine-realdata-lugre-field-missing = chybí pole { $key }

engine-e-realdata-lugre-field-unreadable = pole { $key } je nečitelné

engine-realdata-lugre-raw-line = řádek RAW { $v1 }: { $e }

engine-realdata-lugre-acq-line = řádek ACQ { $v1 }: { $e }

engine-realdata-lugre-nav-line = řádek NAV { $v1 }: { $e }

engine-e-realdata-lugre-clk-row-unreadable = řádek CLK { $v1 }: nečitelný

engine-e-realdata-lugre-clk-row-columns-expected = řádek CLK { $v1 }: sloupců { $v }, očekávány 3

## src/realdata/yunnan.rs

engine-e-realdata-yunnan-parse-json = zpracování JSON: { $e }

engine-e-realdata-yunnan-expected-json-object-at-the = na nejvyšší úrovni očekáván objekt JSON

engine-e-realdata-yunnan-missing-recordtime-array = chybí pole recordTime

## src/realtime_frame_eop.rs

engine-e-realtime-frame-eop-cannot-read-eop-file = nelze číst soubor EOP { $path }: { $e }

engine-e-realtime-frame-eop-latency-must-be-finite-and = latency_s musí být konečné a nezáporné, zadáno { $latency_s }

engine-e-realtime-frame-eop-cannot-read-later-vintage-eop = nelze číst soubor EOP pozdější verze { $path }: { $e }

engine-realtime-frame-eop-empty-and-deliberately-so-predicted = PRÁZDNÉ, a to záměrně: řádek predikce versus finální hodnota vyžaduje epochu vydání s KOMPLETNÍM oknem fitu o { $window_days } dnech za sebou a publikovanou finální hodnotu Bulletin B v cílové epoše. Platný vstup ({ $eop_source }) žádnou epochu splňující obě podmínky neposkytuje. Zkraťte `operational_window_days` nebo dodejte delší skutečnou řadu finals2000A — žádný řádek se nevyrábí, aby se tabulka vyplnila.

engine-realtime-frame-eop-measured-over-the-real-series = Změřeno nad platnou skutečnou řadou ({ $eop_source }). Každý řádek je skutečná chyba predikce: předpověď pro T+h sestavená z rychlých řádků Bulletin A v čase T nebo dříve, vyhodnocená proti POZDĚJI publikované finální hodnotě Bulletin B v T+h. Persistence se vyhodnocuje na stejné množině epoch proti stejným finálním hodnotám, takže se oba sloupce liší prediktorem a ničím jiným. `improvement_factor` pod 1 znamená, že operační prediktor je na daném horizontu HORŠÍ než persistence, a tak se i uvádí.

engine-realtime-frame-eop-measured-over-genuine-two-vintage = Změřeno nad skutečným párem dvou verzí: původně vydaná verze ({ $eop_source }) nese skutečné predikce Bulletin A za hranicí vlastních dat a archivovaná pozdější verze ({ $c }) nese finální hodnoty Bulletin B, které tato data nakonec získala. Proti této finální hodnotě se vyhodnocují tři předpovědi — samotná archivovaná predikce Bulletin A, operačně pojatý fit tohoto crate nad původně vydanou verzí a persistence v okamžiku hranice dat.

engine-realtime-frame-eop-empty-and-deliberately-so-later = PRÁZDNÉ, a to záměrně: byla dodána pozdější verze ({ $c }), ale žádné datum není v původně vydaném souboru ({ $eop_source }) uvedeno jako PREDICTION Bulletin A a zároveň v pozdějším jako FINÁLNÍ hodnota Bulletin B na žádném požadovaném horizontu. Žádný řádek se nesyntetizuje.

engine-realtime-frame-eop-empty-and-deliberately-so-scoring = PRÁZDNÉ, a to záměrně. Vyhodnocení SKUTEČNÉ ARCHIVOVANÉ predikce vyžaduje dvě verze téhož produktu finals2000A; tento běh dostal jednu ({ $eop_source }). Repozitář nedodává žádnou archivovanou dřívější verzi a žádná se NEVYRÁBÍ porušením té, kterou má — syntetizovaný archiv by z každého čísla v této tabulce udělal měření oné poruchy. Doplníte-li skutečnou archivovanou pozdější verzi přes `eop_finals2000a_later`, tabulka se naplní. Do té doby jsou skutečné chyby predikce versus finální hodnota, které tato zpráva přesto obsahuje, v `table5_operational_vs_persistence`, kde je předpověď vlastní předpovědí tohoto crate a pravdou je později publikovaná finální hodnota Bulletin B.

engine-realtime-frame-eop-realtime-frame-eop-table-post = realtime-frame-eop | Tabulka 1: post-proc { $c } m ({ $c2 } ms UT1) ↔ reálný čas { $c3 } m ({ $c4 } ms UT1) | Tabulka 2: finální spodní mez { $floor } ms → { $far } d: { $far2 } ms | rozpočet celkem { $total_m } m ({ $total_time_ns } ns) | rameno páky L19 + reálná data L18 (Validated), kovariance OD (Modelled)

engine-realtime-frame-eop-measured-over-genuine-two-vintage-2 = Změřeno nad skutečným párem dvou verzí: UT1 PŘEDPOVÍDANÉ v Bulletin A v původně vydaném souboru ({ $eop_source }), rozdíl proti nakonec získané FINÁLNÍ hodnotě Bulletin B z archivované pozdější verze ({ $c }), horizontů: { $predicted_vs_final }.

engine-realtime-frame-eop-empty-and-deliberately-so-an = PRÁZDNÉ, a to záměrně: byla dodána archivovaná pozdější verze ({ $c }), ale žádné datum není v původně vydaném souboru ({ $eop_source }) uvedeno jako PREDICTION Bulletin A a zároveň v pozdějším jako FINÁLNÍ hodnota Bulletin B na žádném požadovaném horizontu, a proto není co uvést jako reziduum predikce versus finální hodnota. Žádný řádek se nesyntetizuje.

engine-realtime-frame-eop-empty-and-deliberately-so-predicted-2 = PRÁZDNÉ, a to záměrně: reziduum predikce versus finální hodnota vyžaduje DVĚ verze téhož produktu finals2000A. Tento běh dostal jednu ({ $eop_source }). Její řádky predikce Bulletin A se týkají budoucích dat, která ještě nemají finální hodnotu Bulletin B, takže reziduum k měření neexistuje a žádné se zde nevymýšlí. Doplníte-li archivovanou pozdější verzi přes `eop_finals2000a_later`, tabulka se naplní. Do té doby je vícedenní růst uváděný v `table2_error_vs_horizon` chybou prediktoru PERSISTENCE vyhodnocenou nad skutečnými finálními hodnotami — skutečnou naměřenou chybou, ale modelovaným prediktorem, nikoli reziduem predikce IERS Bulletin A.

## src/receiver_trust/assess.rs

engine-e-receiver-trust-assess-vessel-assessment-needs-platform-kind = posouzení plavidla vyžaduje [platform] kind = "vessel"

engine-e-receiver-trust-assess-excerpt-is-bytes-the-limit = výňatek má { $excerpt } bajtů; limit je { $MAX_EXCERPT_BYTES }

engine-e-receiver-trust-assess-excerpt-holds-more-than-epochs = výňatek obsahuje více než { $MAX_EXCERPT_EPOCHS } epoch; zkraťte ho

engine-e-receiver-trust-assess-the-excerpt-ends-inside-the = výňatek končí uvnitř kalibračního okna { $calibration_s } s (epoch: { $epochs }): nic nebylo vyhodnoceno

## src/receiver_trust/calibration.rs

engine-e-receiver-trust-calibration-run-monitors = run_monitors: { $e }

engine-e-receiver-trust-calibration-no-utc-labelled-epoch-in = v záznamu UBX není žádná epocha označená UTC

engine-e-receiver-trust-calibration-no-scenario-json-under = pod { $root } není žádný scenario.json

engine-receiver-trust-calibration-b1-held-out-clean-pfa = B1 { $config_field }: Pfa čistých dat mimo kalibraci <= { $B1_MAX_PFA } (kalibrováno: { $r })

## src/receiver_trust/geometry.rs

engine-e-receiver-trust-geometry-geometry-must-be-finite-and = geometry: { $name } musí být konečné a > 0 (zadáno { $v })

engine-e-receiver-trust-geometry-geometry-reported-vs-derived-rel = geometry: reported_vs_derived_rel musí být konečné a >= 0 (zadáno { $reported_vs_derived_rel })

engine-e-receiver-trust-geometry-geometry-min-used-must-be = geometry: min_used musí být alespoň 1

engine-e-receiver-trust-geometry-geometry-low-elev-deg-must = geometry: low_elev_deg musí ležet v [0, 90] (zadáno { $low_elev_deg })

engine-e-receiver-trust-geometry-geometry-azimuth-gap-deg-must = geometry: azimuth_gap_deg musí ležet v (0, 360] (zadáno { $azimuth_gap_deg })

engine-e-receiver-trust-geometry-geometry-cap-points-must-be = geometry: cap_points musí ležet v [0, 100] (zadáno { $cap_points })

engine-e-receiver-trust-geometry-geometry-full-ratio-must-be = geometry: full_ratio musí být konečné a > 1 (zadáno { $full_ratio })

engine-e-receiver-trust-geometry-geometry-floor-must-be-in = geometry: floor musí ležet v (0, 100] (zadáno { $f })

engine-e-receiver-trust-geometry-geometry-floor-is-below-the = geometry: floor ({ $f }) je pod hodnotou degraded_min skóre ({ $degraded_min }): samotná geometrie by mohla dosáhnout pásma nedůvěry

## src/receiver_trust/geometry.rs

engine-receiver-trust-geometry-the-geometry-deduction-is-classed = { $why }: odpočet za geometrii je klasifikován jako nesrovnalost

engine-receiver-trust-geometry-reported-not-scored-the-geometry = { $why }: uvedeno, nehodnoceno (geometrie není špatná)

engine-receiver-trust-geometry-not-scored-the-score-deducts = nehodnoceno (skóre odečítá body jen nad HDOP { $hdop_max }, PDOP { $pdop_max } nebo při počtu použitých družic pod { $min_used })

engine-receiver-trust-geometry-the-stated-hdop-disagrees-with = uvedený HDOP { $fmt_dop } se mimo toleranci liší od HDOP { $fmt_dop2 } odvozeného z uvedené oblohy

engine-receiver-trust-geometry-satellites-in-view-but-not = družice v dohledu, ale nesledované ({ $g } z { $in_view } na úrovni { $low_elev_deg } deg nebo výše): prostředí signálu, nikoli geometrie

engine-receiver-trust-geometry-pdop-above = PDOP { $fmt_dop } nad { $pdop_max }

engine-receiver-trust-geometry-hdop-above = HDOP { $fmt_dop } nad { $hdop_max }

engine-receiver-trust-geometry-satellites-behind-the-stated-skyline = družice za uvedeným obzorem: { $m }

engine-receiver-trust-geometry-every-satellite-in-one-half = všechny družice v jedné polovině oblohy (mezera { $max_azimuth_gap_deg } deg)

engine-receiver-trust-geometry-degraded-by-geometry-not-an = zhoršeno geometrií: { $parts } ({ $from }); nejde o nesrovnalost

## src/receiver_trust/ingest.rs

engine-e-receiver-trust-ingest-the-log-holds-no-epochs = záznam neobsahuje žádné epochy: nic v něm nebylo čitelné jako { $name } (přeskočené záznamy jako poškozené nebo nezpracovatelné: { $skipped_records }); zkontrolujte nastavení formátu

engine-receiver-trust-ingest-gps-week-tow = týden GPS { $week } TOW { $tow } s

engine-receiver-trust-ingest-gps-week-tow-2 = týden GPS { $w } TOW { $tow } s

engine-receiver-trust-ingest-gps-tow = GPS TOW { $tow } s

engine-receiver-trust-ingest-utc-date-not-in-log = { $v1 }:{ $v2 }:{ $v3 }.{ $v4 } UTC (datum není v záznamu)

## src/receiver_trust/live.rs

engine-e-receiver-trust-live-live-must-be-finite-and = live: { $name } musí být konečné a >= 0 (zadáno { $v })

engine-e-receiver-trust-live-live-idle-flush-must-be = live: idle_flush_s musí být větší než 0

engine-e-receiver-trust-live-invalid-session = neplatná relace: { $e }

engine-receiver-trust-live-no-score-could-be-produced = nebylo možné vytvořit skóre: { $msg }

## src/receiver_trust/machines/gnss_sdr.rs

engine-e-receiver-trust-machines-gnss-sdr-no-gnss-sdr-synchro-or = nebyl čitelný žádný záznam synchro ani pvt z GNSS-SDR (přeskočené řádky: { $skipped }); formát řádků viz integrations/gnss-sdr/README.md

engine-receiver-trust-machines-gnss-sdr-gps-tow = GPS TOW { $v1 } s

## src/receiver_trust/machines/imu.rs

engine-e-receiver-trust-machines-imu-the-imu-file-is-empty = soubor IMU je prázdný

engine-e-receiver-trust-machines-imu-imu-csv-no-column = IMU csv: chybí sloupec `{ $n }`

engine-e-receiver-trust-machines-imu-imu-euroc-no-column = IMU euroc: chybí sloupec `{ $n }`

engine-e-receiver-trust-machines-imu-the-imu-file-holds-no = soubor IMU neobsahuje žádný čitelný vzorek

## src/receiver_trust/machines/imu_fit.rs

engine-e-receiver-trust-machines-imu-fit-axis-must-be-or = osa musí být 0, 1 nebo 2 (x, y, z)

engine-e-receiver-trust-machines-imu-fit-expected-mean-must-be-finite = expected_mean musí být konečné

engine-e-receiver-trust-machines-imu-fit-the-log-time-does-not = čas záznamu neplyne vpřed

engine-e-receiver-trust-machines-imu-fit-the-log-is-too-short = záznam je příliš krátký pro vytvoření Allanovy křivky

engine-receiver-trust-machines-imu-fit-the-curve-early-slope-is = počáteční sklon křivky { $name } je { $v }, nikoli přibližně -0,5: bílý šum nedominuje (je senzor v klidu?), proto je jeho koeficient šumu nespolehlivý

engine-receiver-trust-machines-imu-fit-the-curve-is-too-short = křivka { $name } je příliš krátká pro kontrolu jejího sklonu

## src/receiver_trust/machines/novatel.rs

engine-receiver-trust-machines-novatel-gps-week-tow = týden GPS { $week } TOW { $r } s

engine-e-receiver-trust-machines-novatel-no-bestpos-range-or-rxstatus = nebyl čitelný žádný záznam BESTPOS, RANGE ani RXSTATUS (přeskočené záznamy: { $skipped })

## src/receiver_trust/machines/rtcm3.rs

engine-receiver-trust-machines-rtcm3-no-valid-rtcm-frame-was = nebyl nalezen žádný platný rámec RTCM 3 (kandidáti, kteří neprošli kontrolou CRC: { $skipped })

## src/receiver_trust/maritime.rs

engine-e-receiver-trust-maritime-maritime-must-be-finite-and = maritime: { $name } musí být konečné a > 0 (zadáno { $v })

engine-e-receiver-trust-maritime-maritime-kin-limit-guard-must = maritime: kin_limit_guard musí být v intervalu (0, 1) (zadáno { $kin_limit_guard })

engine-e-receiver-trust-maritime-maritime-kin-sog-frac-must = maritime: kin_sog_frac musí být v intervalu [0, 1] (zadáno { $kin_sog_frac })

engine-e-receiver-trust-maritime-maritime-must-be-in-got = maritime: { $name } musí být v intervalu (0, 1) (zadáno { $v })

engine-e-receiver-trust-maritime-maritime-cn0-spread-min-sats = maritime: cn0_spread_min_sats musí být alespoň 3

engine-e-receiver-trust-maritime-maritime-kin-window-must-be = maritime: kin_window_s musí být alespoň 2 s

## src/receiver_trust/monitors.rs

engine-e-receiver-trust-monitors-monitor-config-unknown-profile-known = konfigurace monitorů: neznámý profil „{ $other }“; známé: { $threshold_profiles }

engine-e-receiver-trust-monitors-monitor-config-must-be-finite = konfigurace monitorů: { $name } musí být konečné a > 0 (zadáno { $v })

engine-e-receiver-trust-monitors-monitor-config-jam-ind-threshold = konfigurace monitorů: jam_ind_threshold musí být konečné

engine-e-receiver-trust-monitors-monitor-config-mask-deg-must = konfigurace monitorů: mask_deg musí být v intervalu [-90, 90) (zadáno { $mask_deg })

engine-e-receiver-trust-monitors-monitor-config-raim-pfa-must = konfigurace monitorů: raim_pfa musí být v intervalu (0, 1) (zadáno { $raim_pfa })

engine-e-receiver-trust-monitors-monitor-config-cn0-min-sats = konfigurace monitorů: cn0_min_sats musí být alespoň 1

engine-e-receiver-trust-monitors-monitor-config-sats-lost-must = konfigurace monitorů: sats_lost musí být alespoň 1

engine-receiver-trust-monitors-the-receiver-own-set-against = vlastní sada přijímače { $self_report_source } porovnaná s monitory Kshana; ani jedna není základní pravda, shoda není validace

engine-e-receiver-trust-monitors-receiver-timeline-has-non-finite = časová osa přijímače obsahuje nekonečný čas epochy

engine-e-receiver-trust-monitors-the-log-is-shorter-than = záznam je kratší než kalibrační okno: epochy před { $cal_s } s: { $calibration_epochs } (záznam trvá { $span } s); k vytvoření základní úrovně jsou potřeba alespoň 3

## src/receiver_trust/platform.rs

engine-e-receiver-trust-platform-platform-must-be-in-got = platform: { $name } musí být v intervalu ({ $lo }, { $hi }] (zadáno { $x })

engine-e-receiver-trust-platform-platform-applies-only-to-kind = platform: { $name } platí jen pro kind = "vessel" (kind je "static")

## src/receiver_trust/scenario.rs

engine-e-receiver-trust-scenario-cannot-read-the-webassembly-build = nelze číst { $path }: sestavení WebAssembly nemá souborový systém; předejte soubor přímo jako `text` nebo `base64`

engine-e-receiver-trust-scenario-base64-is-not-valid-standard = { $what }: `base64` není platné standardní base64

engine-e-receiver-trust-scenario-give-one-of-path-text = { $what }: zadejte jedno z `path`, `text` nebo `base64`

engine-e-receiver-trust-scenario-give-only-one-of-path = { $what }: zadejte pouze jedno z `path`, `text` nebo `base64`

engine-e-receiver-trust-scenario-must-be-positive-number-got = { $name } musí být kladné číslo, zadáno { $v }

engine-e-receiver-trust-scenario-event-onset-must-be-non = událost { $label }: onset_s musí být nezáporné číslo

engine-e-receiver-trust-scenario-event-end-must-be-after = událost { $label }: end_s musí být po onset_s

engine-e-receiver-trust-scenario-log-imu-heading0-deg-and = log.imu: heading0_deg a time_offset_s musí být konečné

engine-receiver-trust-scenario-trusted-throughout-no-monitor-alarmed = důvěryhodné po celou dobu: žádný monitor nevyvolal alarm v epochách po kalibraci: { $after_cal }

engine-receiver-trust-scenario-first-alarm-at-untrusted-for = první alarm v { $t } s; nedůvěryhodné epochy: { $untrusted_epochs }, zhoršené epochy: { $degraded_epochs }, z epoch po kalibraci: { $after_cal }

engine-receiver-trust-scenario-of-stated-events-detected-within = ; uvedené události detekované do { $detect_tol_s } s: { $events_detected } z { $events_evaluable }

engine-receiver-trust-scenario-of-n0-predictions-within-db = ; předpovědi C/N0 v rámci { $cn0_tol_db } dB: { $predictions_agreeing } z { $predictions_evaluable }

engine-receiver-trust-scenario-trust-score-lowest-final = ; skóre důvěry nejnižší { $min }, konečné { $last }

engine-receiver-trust-scenario-scenario-receiver-trust-log-epochs = scénář { $r } | receiver-trust | záznam { $format_name }, epochy: { $epochs } během { $duration_s } s | monitory { $monitors_run } | { $verdict }

engine-e-receiver-trust-scenario-this-is-scenario-not-receiver = toto je scénář typu { $k }, nikoli receiver-trust

## src/receiver_trust/score.rs

engine-e-receiver-trust-score-score-must-be-finite-got = score: { $name } musí být konečné (zadáno { $v })

engine-e-receiver-trust-score-score-need-degraded-min-nominal = score: musí platit 0 < degraded_min < nominal_min <= 100 (zadáno { $degraded_min } a { $nominal_min })

engine-e-receiver-trust-score-score-evidence-hold-must-be = score: evidence_hold_s musí být konečné a >= 0 (zadáno { $evidence_hold_s })

engine-e-receiver-trust-score-score-need-onset-ratio-full = score: musí platit 0 <= onset_ratio < full_ratio (zadáno { $onset_ratio } a { $full_ratio })

engine-e-receiver-trust-score-score-weight-of-must-be = score: váha { $m } musí být v intervalu [0, 100] (zadáno { $w })

## src/reentry.rs

engine-e-reentry-entry-velocity-must-be-finite = entry_velocity_m_s musí být konečné a kladné

engine-e-reentry-flight-path-angle-deg-must = flight_path_angle_deg musí být v intervalu (0, 90)

engine-e-reentry-ballistic-coeff-kg-m2-must = ballistic_coeff_kg_m2 musí být konečné a kladné

engine-e-reentry-scale-height-and-rho0-kg = scale_height_m a rho0_kg_m3 musí být konečné a kladné

engine-e-reentry-entry-interface-altitude-must-be = entry_interface_altitude_m musí být v intervalu [10 km, 1000 km]

engine-reentry-reentry-allen-eggers-peak-at = návrat do atmosféry (Allen–Eggers): V_e { $v } m/s, γ { $flight_path_angle_deg }° -> maximum { $v3 } g ve výšce { $v4 } km, { $velocity_at_peak_deceleration } m/s; ohřev vrcholí při { $velocity_at_peak_heating } m/s; hmotný bod (gravitace, zakřivení, US76) maximum { $peak_deceleration_g } g (MODELLED balistický, bez aerotermiky)

## src/registry.rs

engine-e-registry-unknown-scenario-id = neznámé id scénáře: { $id }

## src/representativeness.rs

engine-representativeness-trl-band-is-not-well = pásmo TRL ({ $lo },{ $hi }) není správně utvořeno (musí platit 0<=lo<=hi<=9)

engine-representativeness-modelled-simulation-only-claim-cannot = tvrzení Modelled (pouze simulace) nemůže být reprezentativní nad TRL { $MODELLED_TRL_CEILING } (horní mez pásma hi={ $hi }); vyšší TRL je mezera, nikoli výstup simulace

engine-representativeness-representativeness-representative-for-trl = Reprezentativnost [{ $status }] — { $claim } (reprezentativní pro TRL { $lo }-{ $hi }){ "\u000A" }

## src/resilience/score.rs

engine-resilience-score-declared-mean-source-quality = { $t } = deklarováno({ $arch }) x průměrná kvalita zdrojů

engine-resilience-score-weakest-rpcf-sub-score-bounded = nejslabší dílčí skóre RPCF = { $min_sub }; omezené zhoršení = { $bounded } (při neomezeném se strop snižuje na úroveň 2)

## src/rinex.rs

engine-e-rinex-unsupported-navigation-record-header-line = nepodporovaná hlavička navigačního záznamu { $head }: řádek začínající '>' je hlavička záznamu RINEX 4, nikoli navigační záznam RINEX 3

engine-e-rinex-bad-prn-in = chybné PRN v { $head }

engine-e-rinex-rinex-navigation-expected-record-header = navigace RINEX 4: očekávána hlavička záznamu '>', nalezeno { $head }

engine-e-rinex-rinex-record-has-lines-ephemeris = záznam RINEX 4 { $head } má řádků: { $body }, efemeridy { $msg } vyžadují 8

engine-e-rinex-rinex-record-is-followed-by = po záznamu RINEX 4 { $head } následuje { $body }, nikoli { $sv }

## src/rinex_obs.rs

engine-e-rinex-obs-bad = chybné { $what }: { $s }

engine-e-rinex-obs-rinex-observation-file-has-no = soubor pozorování RINEX nemá END OF HEADER

engine-e-rinex-obs-rinex-observation-file-contained-no = soubor pozorování RINEX neobsahoval žádné záznamy epoch

## src/scenario.rs

engine-e-scenario-time-step-must-be-finite = time.step_s musí být konečné a > 0 (zadáno { $step_s })

engine-e-scenario-time-duration-must-be-finite = time.duration_s musí být konečné a > 0 (zadáno { $duration_s })

engine-e-scenario-time-step-must-not-exceed = time.step_s ({ $step_s }) nesmí překročit time.duration_s ({ $duration_s })

## src/sdr.rs

engine-sdr-sampling-rate-is-commensurate-with = vzorkovací frekvence je souměřitelná s frekvencí kódu ({ $samples_per_chip } vzorků/chip, { $offset_from_integer_samples } vzorků od celého čísla): replika kódu s podržením nultého řádu nedokáže rozlišit změnu fáze kódu pod { $dead_band_chips } chipů, takže diskriminátor Early/Late je místo trojúhelníku schodovitý s mrtvým pásmem o jednom vzorku a DLL se ustálí na špatném zpoždění. Posuňte vzorkovací frekvenci mimo celočíselný násobek (5 MHz je 4.8876 vzorků/chip; 25 MHz je 24.4379) nebo vzorkujte dostatečně nadměrně, aby bylo mrtvé pásmo pod přesností fáze kódu, kterou potřebujete.

## src/sgp4.rs

engine-e-sgp4-sgp4-error-code = chybový kód SGP4 { $code }

## src/sigmf.rs

engine-e-sigmf-unsupported-sigmf-core-datatype-this = nepodporovaný SigMF core:datatype { $other }: tento čtecí modul zpracovává komplexní typy cf32_le, ci16_le a ci8

engine-e-sigmf-sigmf-core-num-channels-only = SigMF core:num_channels = { $ch }: čtou se pouze jednokanálové záznamy

engine-e-sigmf-cannot-serialise-sigmf-metadata = nelze serializovat metadata SigMF: { $e }

engine-e-sigmf-invalid-sigmf-extension-namespace = neplatný jmenný prostor rozšíření SigMF { $ns }

engine-e-sigmf-annotation-extension-maps-for-annotations = mapy rozšíření anotací: { $annotations }, anotace: { $annotations2 }

engine-e-sigmf-extension-key-is-not-in = klíč rozšíření { $k } není v jmenném prostoru { $ns }

engine-e-sigmf-extension-key-is-already-present = klíč rozšíření { $k } již existuje

engine-e-sigmf-global-is-not-an-object = global není objekt

engine-e-sigmf-annotations-is-not-an-array = annotations není pole

engine-e-sigmf-annotation-is-not-an-object = annotation není objekt

engine-e-sigmf-invalid-sigmf-metadata-json = neplatný JSON metadat SigMF: { $e }

engine-e-sigmf-the-sigmf-recording-states-no = záznam SigMF neuvádí žádné kladné core:sample_rate

engine-e-sigmf-sigmf-capture-starts-at-sample = zachycení SigMF začíná u vzorku { $start }, za počtem vzorků v datech: { $data }

## src/skyline.rs

engine-e-skyline-skyline-must-be-in-90 = skyline: { $what } musí být v intervalu [0, 90) stupňů, zadáno { $el }

engine-e-skyline-skyline-must-be-finite-number = skyline: { $what } musí být konečné číslo, zadáno { $v }

engine-e-skyline-skyline-canyon-needs-width = skyline: kaňon vyžaduje width_m

engine-e-skyline-skyline-width-must-be-positive = skyline: width_m musí být kladné, zadáno { $width_m }

engine-e-skyline-skyline-canyon-heights-and-antenna = skyline: výšky kaňonu a antenna_m musí být nezáporné

engine-e-skyline-skyline-length-must-be-positive = skyline: length_m musí být kladné, zadáno { $l }

engine-e-skyline-skyline-table-is-empty = skyline: tabulka je prázdná

engine-e-skyline-skyline-table-has-rows-over = skyline: tabulka má řádků: { $rows }, přes limit { $MAX_TABLE_ROWS } řádků

engine-e-skyline-skyline-table-azimuth-is-outside = skyline: azimut tabulky { $az } je mimo [0, 360)

engine-e-skyline-skyline-table-azimuths-must-be = skyline: azimuty tabulky musí být striktně rostoucí ({ $az } následuje po { $prev })

engine-e-skyline-skyline-more-than-sectors = skyline: více než { $MAX_SECTORS } sektorů

engine-e-skyline-skyline-the-sector-az-from = skyline: sektor az_from = { $az_from } až az_to = { $az_to } je prázdný (plný kruh je tabulka nebo maska)

engine-e-skyline-skyline-more-than-terrain-points = skyline: více než { $MAX_TABLE_ROWS } bodů terénu

engine-e-skyline-skyline-terrain-distance-must-be = skyline: terrain distance_m musí být kladné, zadáno { $distance_m }

engine-skyline-with-fields-overridden-or-added = { $provenance }; s poli přepsanými nebo přidanými uživatelem: { $user }

engine-skyline-stated-input = Uvedený vstup: { $user }

engine-e-skyline-unknown-skyline-preset-known-presets = neznámá předvolba skyline „{ $name }“; známé předvolby: { $preset_names }

## src/slot_timing.rs

engine-e-slot-timing-datasheet-needs-at-least-two = datasheet vyžaduje alespoň dva body Allanovy odchylky

engine-e-slot-timing-datasheet-point-must-have-positive = bod datasheetu ({ $t }, { $s }) musí mít kladný čas průměrování a kladnou Allanovu odchylku

engine-e-slot-timing-tau0-must-be-positive-number = tau0_s musí být kladný počet sekund

engine-e-slot-timing-phase-record-needs-at-least = záznam fáze vyžaduje k proložení modelu šumu alespoň 32 vzorků; zadáno { $phase_s }

engine-e-slot-timing-the-phase-record-contains-non = záznam fáze obsahuje nekonečný vzorek

engine-e-slot-timing-the-phase-record-yields-fewer = záznam fáze poskytuje méně než tři body Allanovy odchylky

engine-e-slot-timing-must-be-finite-and-non = { $name } musí být konečné a nezáporné; zadáno { $v }

engine-e-slot-timing-the-slot-guard-must-be = ochranný interval slotu musí být kladný čas

engine-e-slot-timing-sigma-must-be-positive = k_sigma musí být kladné

engine-e-slot-timing-residual-frequency-offset-must-be = residual_frequency_offset musí být konečné

engine-e-slot-timing-temperature-excursion-must-be-finite = temperature_excursion_k musí být konečné

engine-e-slot-timing-give-exactly-one-of-oscillator = zadejte právě jedno z oscillator.class, oscillator.preset, oscillator.datasheet nebo oscillator.record

engine-e-slot-timing-unknown-oscillator-class-csac-uso = neznámé oscillator.class '{ $id }' (csac|uso|dsac|tcxo|ocxo|rafs)

engine-e-slot-timing-unknown-oscillator-preset-ocxo-rubidium = neznámé oscillator.preset '{ $id }' (ocxo|rubidium|caesium|csac)

engine-slot-timing-class-default-sigma-from-red = výchozí hodnota třídy { $c }: sigma_y(1 s) z { $c2 }; hladina červeného šumu syntetizovaná o dvě a o čtyři dekády níže (předpoklad, nikoli měření)

engine-slot-timing-fitted-to-the-allan-deviation = proloženo maximy Allanovy odchylky z { $document }, škálováno tak, aby leželo na úrovni všech bodů nebo nad nimi

engine-slot-timing-slot-timing-source-guard-ns = slot-timing (zdroj { $n }): ochranný interval { $c } ns při k={ $k_sigma } vydrží { $fmt_s } po určení polohy (zbývá { $fmt_s2 }); určení polohy alespoň každých { $fmt_s3 } ({ $fixes_per_day } za den); dominantní člen: { $b }{ $v9 }

## src/solar_system.rs

engine-e-solar-system-epoch-must-be-yyyy-mm = epocha '{ $s }' musí mít tvar YYYY-MM-DDTHH:MM:SS

engine-solar-system-epoch-bad = epocha '{ $s }': chybné { $what } '{ $v }'

engine-e-solar-system-epoch-jd-tdb-must-be = epoch_jd_tdb musí být konečné

engine-e-solar-system-table-must-be-auto-table1 = table musí být auto, table1 nebo table2; zadáno '{ $v }'

engine-solar-system-no-ephemeris-for-the-to = žádné efemeridy pro spoj { $name } – { $name2 } v JD { $jd_tdb } TDB

engine-e-solar-system-epoch-jd-tdb-is-outside = epocha JD { $jd } TDB je mimo rozsah 3000 př. n. l. až 3000 n. l., rozsah tabulek Standish

engine-e-solar-system-track-points-must-be-to = track_points musí být 8 až 2000; zadáno { $n_track }

engine-e-solar-system-unknown-observer-body = neznámé těleso pozorovatele '{ $observer_name }'

engine-e-solar-system-bodies-must-name-at-least = bodies musí uvádět alespoň jedno těleso

engine-e-solar-system-unknown-body = neznámé těleso '{ $n }'

engine-e-solar-system-no-position-for-at-jd = žádná poloha pro { $name } v JD { $jd } TDB (Pluto jen 1800 n. l. až 2050 n. l.)

engine-e-solar-system-no-standish-elements-for = žádné prvky Standish pro { $name }

engine-solar-system-jpl-spk-sha-256-heliocentric = JPL SPK { $k } (SHA-256 { $k2 }), heliocentrický stav načtený vlastním čtecím modulem enginu

engine-e-solar-system-unknown-link-body = neznámé těleso spoje '{ $from }'

engine-e-solar-system-unknown-link-body-2 = neznámé těleso spoje '{ $to }'

engine-e-solar-system-link-needs-two-different-bodies = spoj vyžaduje dvě různá tělesa; zadáno { $name }

engine-solar-system-light-time = světelný čas { $one_way_light_time_s } s

engine-solar-system-au-lon-deg = { "  " }{ $name } { $heliocentric_distance_au } au  lon { $ecliptic_longitude_deg } deg  { $lt }  [{ $label }]{ "\u000A" }

engine-solar-system-link-one-way-two-way = { "  " }spoj { $from } -> { $to }: jednosměrně { $one_way_light_time_s } s, obousměrně { $two_way_light_time_s } s, Shapiro { $l } us, Slunce { $sun_separation_deg } deg{ "\u000A" }

engine-solar-system-epoch-positions-from-the-standish = epocha { $input } · { $standish_table } · polohy z prvků Standish

## src/sp3.rs

engine-e-sp3-epoch-needs-time-fields-got = epocha vyžaduje 6 časových polí, zadáno { $tokens }

engine-e-sp3-bad-second = chybná sekunda: { $tokens }

engine-e-sp3-record-needs-values-missing-column = záznam vyžaduje 4 hodnoty, chybí sloupec { $v1 }

engine-e-sp3-bad-number = chybné číslo: { $field }

engine-e-sp3-empty-sp3-input = prázdný vstup SP3

engine-e-sp3-first-line-is-not-an = první řádek není hlavička SP3: { $first }

engine-e-sp3-unsupported-sp3-version-in = nepodporovaná verze SP3 v { $first }

engine-e-sp3-missing-epoch-count-on-header = na řádku 1 hlavičky chybí počet epoch

engine-e-sp3-record-has-no-satellite-id = záznam nemá identifikátor družice: { $line }

engine-e-sp3-position-record-before-any-epoch = záznam polohy před jakoukoli hlavičkou epochy

engine-e-sp3-sp3-file-contained-no-epoch = soubor SP3 neobsahoval žádné záznamy epoch

engine-e-sp3-bad-accuracy-exponent-in = chybný exponent přesnosti { $f } v { $line }

engine-e-sp3-bad-header-accuracy = chybná přesnost v hlavičce { $t }

engine-e-sp3-short-line = krátký řádek %f { $line }

engine-e-sp3-bad-base-in = chybný základ %f v { $line }

## src/space_packet.rs

engine-e-space-packet-version-exceeds-bits = verze přesahuje 3 bity

engine-e-space-packet-apid-exceeds-11-bits-2047 = APID přesahuje 11 bitů (0..=2047)

engine-e-space-packet-sequence-count-exceeds-14-bits = sequence_count přesahuje 14 bitů (0..=16383)

engine-e-space-packet-data-field-must-be-at = datové pole musí mít alespoň jeden oktet

engine-e-space-packet-data-field-exceeds-65536-octets = datové pole přesahuje 65536 oktetů

engine-e-space-packet-packet-shorter-than-the-octet = paket je kratší než 6oktetová hlavička: bajty: { $bytes }

engine-e-space-packet-declared-data-length-header-octets = deklarovaná délka dat { $data_len } (+6 hlavička) = { $total } oktetů, ale vyrovnávací paměť má { $bytes }

engine-e-space-packet-cuc-coarse-octets-outside = hrubé oktety CUC { $coarse_octets } mimo 1..=4

engine-e-space-packet-cuc-fine-octets-outside-the = jemné oktety CUC { $fine_octets } mimo 0..=3 (rozšířené P-pole není podporováno)

engine-e-space-packet-cuc-field-extended-field-not = CUC P-pole { $p }: rozšířené P-pole není podporováno

engine-e-space-packet-field-time-code-id-is = P-pole { $p }: id časového kódu { $id } není CUC

engine-e-space-packet-field-is-not-cds-field = P-pole { $p } není P-pole CDS

engine-e-space-packet-cds-field-reserved-sub-ms = CDS P-pole { $p }: rezervovaný kód sub-ms 11

engine-e-space-packet-cuc-coarse-does-not-fit = hrubá část CUC { $coarse } se nevejde do oktetů: { $c }

engine-e-space-packet-cds-days-do-not-fit = dny CDS { $days } se nevejdou do oktetů: { $f }

engine-e-space-packet-cds-ms-of-day-above = ms dne CDS { $ms_of_day } nad 86 400 999

engine-e-space-packet-cds-sub-millisecond-above = submilisekunda CDS { $submillis } nad { $max_sub }

engine-e-space-packet-time-code-format-and-value = formát a hodnota časového kódu patří k různým kódům

engine-e-space-packet-time-code-no-field-octet = časový kód: chybí oktet P-pole

engine-e-space-packet-time-code-needs-octets-present = časový kód vyžaduje oktety: { $end }, přítomné: { $bytes }

engine-e-space-packet-time-code-format-differs-from = formát časového kódu se liší od implicitního P-pole

engine-e-space-packet-the-format-has-time-code = formát má pole časového kódu; žádné nebylo zadáno

engine-e-space-packet-the-format-has-no-time = formát nemá pole časového kódu

engine-e-space-packet-ancillary-data-is-octets-the = pomocná data mají oktety: { $ancillary }; formát uvádí { $ancillary_octets }

engine-e-space-packet-secondary-header-must-hold-at = sekundární hlavička musí obsahovat alespoň jeden oktet

engine-e-space-packet-secondary-header-needs-octets-present = sekundární hlavička vyžaduje oktety: { $end }, přítomné: { $bytes }

engine-e-space-packet-the-format-has-secondary-header = formát má sekundární hlavičku; žádná nebyla zadána

engine-e-space-packet-the-format-has-no-secondary = formát nemá sekundární hlavičku

engine-e-space-packet-secondary-header-flag-disagrees-with = příznak sekundární hlavičky { $v1 } nesouhlasí s formátem

engine-e-space-packet-data-field-shorter-than-the = datové pole je kratší než PEC

## src/space_packet.rs

engine-e-space-packet-pec-does-not-match-the = PEC { $v1 } neodpovídá CRC { $crc16_ccitt_false } paketu

engine-e-space-packet-nothing-to-segment-empty-user = není co segmentovat: prázdná uživatelská data

engine-e-space-packet-max-user-octets-must-be = max_user_octets musí být alespoň 1

engine-e-space-packet-first-count-exceeds-14-bits = first_count přesahuje 14 bitů (0..=16383)

engine-space-packet-apid-where-was-expected = APID { $apid }, očekáváno { $a }

engine-space-packet-sequence-count-repeated = opakovaný čítač posloupnosti { $sequence_count }

engine-space-packet-sequence-count-gap-after-packet = mezera v čítači posloupnosti: { $sequence_count } po { $last } (chybějící pakety: { $v2 })

engine-space-packet-sequence-count-out-of-order = čítač posloupnosti mimo pořadí: { $sequence_count } po { $last }

engine-space-packet-packet-with-no-unit-open = paket { $f } bez otevřené jednotky

engine-space-packet-packet-while-unit-is-open = paket { $f } při otevřené jednotce

engine-e-space-packet-packet = paket { $i }: { $e }

engine-e-space-packet-the-sequence-ends-with-unit = posloupnost končí stále otevřenou jednotkou (chybí poslední paket)

engine-e-space-packet-apid-must-be-in-2047 = apid musí být v rozsahu 0..=2047

engine-e-space-packet-packet-count-must-be = packet_count musí být >= 1

engine-e-space-packet-data-len-must-be-in = data_len musí být v rozsahu 1..=65536

engine-e-space-packet-internal-error-encode-decode-round = interní chyba: nesoulad při zakódování a zpětném dekódování

## src/space_weather.rs

engine-e-space-weather-f107-must-be-finite-and = f107 musí být konečné a kladné

engine-e-space-weather-f107a-must-be-finite-and = f107a musí být konečné a kladné

engine-e-space-weather-kp-must-be-in = kp musí být v intervalu [0, 9]

engine-e-space-weather-altitudes-km-must-be-non = altitudes_km nesmí být prázdné

engine-e-space-weather-altitude-km-must-be-finite = výška { $h } km musí být konečná a kladná

engine-space-weather-space-weather-f10-f10-7a = space-weather: F10.7={ $f107 } F10.7a={ $f107a } Kp={ $kp } (ap={ $sw }) -> T_inf={ $t_inf } K; hustota x{ $density_activity_factor } ve výšce { $value } km (MODELLED)

## src/spectrum.rs

engine-e-spectrum-jammer-needs-positive-bandwidth-mhz = { $name }: rušička typu { $what } vyžaduje kladné bandwidth_mhz

engine-e-spectrum-chirp-jammer-needs-positive-sweep = { $name }: rušička typu chirp vyžaduje kladné sweep_period_us

engine-e-spectrum-matched-to-names-unknown-band = { $name }: matched_to uvádí neznámé pásmo { $target }

engine-e-spectrum-give-either-received-power-dbw = { $name }: zadejte buď received_power_dbw, nebo eirp_dbw s kladným range_m (ne obojí)

engine-e-spectrum-off-must-be-later-than = { $name }: off_s musí být později než on_s

engine-e-spectrum-welch-the-sample-rate-must = welch: vzorkovací frekvence musí být kladná

engine-e-spectrum-welch-nfft-must-be-power = welch: nfft = { $nfft } musí být mocnina dvou, alespoň 8

engine-e-spectrum-welch-samples-is-fewer-than = welch: vzorků je { $x }, což je méně než jeden segment o { $nfft } bodech

engine-e-spectrum-iq-must-be-power-of = iq: n = { $n } musí být mocnina dvou, alespoň 16

engine-e-spectrum-cannot-read-recording-meta-path = nelze číst meta_path záznamu { $meta_path }: { $e }

engine-e-spectrum-cannot-read-recording-data = nelze číst data záznamu { $data_path }: { $e }

engine-e-spectrum-rx-bandwidth-mhz-must-be = { $name }: rx_bandwidth_mhz musí být kladné

engine-e-spectrum-modulation-is-not-selectable-only = { $n }: modulaci { $m } nelze zvolit (jen galileo-e1 přijímá "mboc" nebo "boc11")

engine-e-spectrum-signal-is-not-in-the = { $name }: signál { $sig } není v knihovně předvoleb signálů ({ $v2 })

engine-e-spectrum-preset-signal-carries-its-own = { $name }: předvolený signál nese vlastní modulaci; vynechte `modulation`

engine-e-spectrum-signal-publishes-no-received-power = { $name }: signál { $sig } nezveřejňuje přijímaný výkon; zadejte signal_power_dbw

engine-e-spectrum-custom-band-needs-modulation-bpsk = { $name }: vlastní pásmo vyžaduje `modulation`, např. "BPSK(10)"

engine-e-spectrum-custom-band-needs-signal-power = { $name }: vlastní pásmo vyžaduje signal_power_dbw

engine-e-spectrum-give-either-signal-or-centre = { $name }: zadejte buď `signal`, nebo `centre_mhz`, ne obojí

engine-e-spectrum-give-rx-bandwidth-mhz-no = { $name }: zadejte rx_bandwidth_mhz (nelze určit hlavní lalok)

engine-e-spectrum-duration-must-be-at-least = duration_s musí být alespoň jeden step_s

engine-e-spectrum-time-rows-is-more-than = časové řádky: { $rows }, což je více než povolených 5000

engine-e-spectrum-at-most-extra-panels = nejvýše 8 dalších panelů

engine-e-spectrum-panel-need-max-mhz-min = panel { $name }: musí platit f_max_mhz > f_min_mhz a 2 ≤ n_freq ≤ 4096

engine-e-spectrum-grid-need-max-mhz-min = grid: musí platit f_max_mhz > f_min_mhz a 2 ≤ n_freq ≤ 4096

engine-spectrum-scenario-spectrum-bands-jammers-noise = spektrum scénáře | pásma: { $bands } | rušičky: { $jammers } | úroveň šumu { $n0_db } dBW/Hz | nejhorší pásmo { $name } min C/N0 { $c } dB-Hz{ $v6 }

engine-spectrum-scenario-spectrum-no-bands-noise = spektrum scénáře | žádná pásma | úroveň šumu { $n0_db } dBW/Hz

engine-e-spectrum-iq-log2-samples-must-be = iq.log2_samples musí být mezi 10 a 20

engine-e-spectrum-iq-datatype-use-cf32-le = iq.datatype: použijte cf32_le nebo ci16_le

engine-spectrum-frequency-across-time-down-colour = frekvence vodorovně, čas svisle, barva = výkonová spektrální hustota (dBW/Hz); úroveň šumu { $n0_db } dBW/Hz

engine-spectrum-each-panel-its-own-frequency = každý panel má vlastní frekvenční rozsah, jednu časovou osu svisle a jednu barevnou stupnici (dBW/Hz); úroveň šumu { $n0_db } dBW/Hz

## src/spk_writer.rs

engine-e-spk-writer-frame-has-no-supported-naif = soustava { $other } nemá podporovaný kód NAIF

engine-e-spk-writer-segment-name-longer-than-40 = název segmentu je delší než 40 znaků: { $name }

engine-e-spk-writer-segment-name-has-non-printing = název segmentu obsahuje netisknutelné znaky: { $name }

engine-e-spk-writer-bad-target-for-centre = chybný cíl { $target } pro střed { $centre }

engine-e-spk-writer-degree-outside-27 = stupeň { $degree } mimo 1..=27

engine-e-spk-writer-type-13-degree-is-not = stupeň { $degree } typu 13 není lichý

engine-e-spk-writer-descriptor-start-is-not-before = začátek deskriptoru není před jeho koncem

engine-e-spk-writer-epochs-are-not-strictly-increasing = epochy nejsou striktně rostoucí

engine-e-spk-writer-the-epochs-do-not-cover = epochy nepokrývají interval deskriptoru

engine-e-spk-writer-type-or-13-segment-carries = segment typu 9 nebo 13 nese stavy, nikoli záznamy

engine-e-spk-writer-type-segment-needs-at-least = segment typu 3 vyžaduje alespoň jeden záznam

engine-e-spk-writer-type-degree-outside-27 = stupeň { $degree } typu 3 mimo 0..=27

engine-e-spk-writer-type-interval-length-is-not = délka intervalu { $intlen } typu 3 není kladná

engine-e-spk-writer-type-record-has-coefficients-expected = záznam { $i } typu 3 má koeficienty: { $value }, očekáváno { $ncof }

engine-e-spk-writer-descriptor-start-is-after-its = začátek deskriptoru je za jeho koncem

engine-e-spk-writer-descriptor-starts-before-the-first = deskriptor začíná před prvním záznamem

engine-e-spk-writer-descriptor-ends-after-the-last = deskriptor končí po posledním záznamu

engine-e-spk-writer-type-segment-carries-records-not = segment typu 3 nese záznamy, nikoli epochy ani stavy

engine-e-spk-writer-type-21-segment-needs-at = segment typu 21 vyžaduje alespoň jednu diferenční řádku

engine-e-spk-writer-difference-line-size-is-not = velikost diferenční řádky { $dlsize } není 4 MAXDIM + 11 pro MAXDIM v rozsahu 15..=25

engine-e-spk-writer-difference-lines-of-different-sizes = diferenční řádky různých velikostí

engine-e-spk-writer-difference-line-epochs-are-not = epochy diferenčních řádek nejsou striktně rostoucí

engine-e-spk-writer-the-last-difference-line-ends = poslední diferenční řádka končí před deskriptorem

engine-e-spk-writer-zero-step-size-in-difference = nulová velikost kroku { $j } v diferenční řádce { $i }

engine-e-spk-writer-type-21-segment-carries-difference = segment typu 21 nese diferenční řádky, nikoli stavy

engine-e-spk-writer-an-spk-needs-at-least = SPK vyžaduje alespoň jeden segment

engine-e-spk-writer-segment = segment { $i }: { $e }

engine-e-spk-writer-comment-line-has-non-printing = řádek komentáře obsahuje netisknutelné znaky: { $l }

engine-e-spk-writer-comments-need-characters-are-reserved = komentáře vyžadují znaky: { $nchars }; rezervováno: { $v1 } (zvyšte ncomch)

engine-e-spk-writer-difference-line-orders-out-of = řády diferenční řádky { $kqmax1 } { $kq } mimo rozsah

engine-e-spk-writer-zero-step-size-at-index = nulová velikost kroku na indexu { $j }

engine-e-spk-writer-et-outside-the-segment = ET { $et } mimo segment [{ $start }, { $end }]

engine-e-spk-writer-type-segment-too-short = segment { $name } typu 3 je příliš krátký

engine-e-spk-writer-type-segment-words-for-rsize = segment { $name } typu 3: slova: { $nw }, N = { $n }, RSIZE = { $rsize }

engine-e-spk-writer-type-21-segment-too-short = segment { $name } typu 21 je příliš krátký

engine-e-spk-writer-type-21-segment-words-for = segment { $name } typu 21: slova: { $nw }, N = { $n }, MAXDIM = { $maxdim }

engine-e-spk-writer-segment-too-short = segment { $name } je příliš krátký

engine-e-spk-writer-segment-words-for = segment { $name }: slova: { $nw }, N = { $n }

engine-e-spk-writer-segment-is-in-frame = segment { $name } je v soustavě { $frame }

engine-e-spk-writer-spk-centre-chain-does-not = řetězec středů SPK nekončí

engine-e-spk-writer-no-spk-chain-connects-and = žádný řetězec SPK nespojuje { $target } a { $observer } v ET { $et }

engine-e-spk-writer-epoch-is-not-yyyy-mm = epocha { $s } nemá tvar YYYY-MM-DDTHH:MM:SS

engine-e-spk-writer-time-system-not-supported-utc = časová soustava { $other } není podporována (UTC nebo TDB)

engine-e-spk-writer-centre-has-no-supported-naif = střed { $other } nemá podporované id NAIF

engine-e-spk-writer-oem-segment-has-no-data = segment OEM { $name } nemá datové řádky

engine-e-spk-writer-oem-segment-no = segment OEM { $idx }: chybí { $k }

engine-e-spk-writer-no-export-settings-for-oem = žádné nastavení exportu pro segment OEM { $idx }

engine-e-spk-writer-oem-data-line-has-fields = datový řádek OEM má pole: { $f }: { $line }

engine-e-spk-writer-oem-value = hodnota OEM { $f }: { $e }

engine-e-spk-writer-oem-segments-for-export-settings = segmenty OEM: { $out }, nastavení exportu: { $exports }

## src/spoof_detect.rs

engine-spoof-detect-spoof-detected-fused-layers = SPOOF DETECTED (sloučeno) — vrstvy: { $fired }

engine-spoof-detect-single-layer-indication-below-the = indikace jedné vrstvy ({ $fired }) pod sloučeným prahem — je třeba potvrzení

## src/srp_boxwing.rs

engine-e-srp-boxwing-mass-kg-must-be-positive = mass_kg musí být kladné, zadáno { $mass_kg }

engine-e-srp-boxwing-panel-area-must-be = panel { $i }: plocha musí být >= 0

engine-e-srp-boxwing-panel-outside = panel { $i }: { $name } = { $c } mimo [0, 1]

engine-e-srp-boxwing-panel-absorption-specular-diffuse = panel { $i }: absorpce + zrcadlový odraz + difuzní odraz = { $sum } != 1

engine-e-srp-boxwing-panel-zero-normal-axis = panel { $i }: nulová normála/osa

engine-e-srp-boxwing-ecom2-normal-matrix-is-singular = normálová matice ECOM2 je singulární nebo špatně podmíněná

## src/ssv/check.rs

engine-e-ssv-check-heo-preset = předvolba heo

engine-e-ssv-check-lunar-preset = předvolba lunar

## src/ssv/formation.rs

engine-e-ssv-formation-formation-needs-at-least-one = formace vyžaduje alespoň jednoho deputy

engine-e-ssv-formation-duration-min-and-step-must = duration_min a step_s musí být kladné

## src/ssv/nav.rs

engine-e-ssv-nav-no-signals-for-the-chosen = žádné signály pro zvolené konstelace a pásma

## src/ssv/scenario.rs

engine-e-ssv-scenario-unknown-antenna = neznámá anténa `{ $other }`

engine-e-ssv-scenario-pattern-csv-is-empty = CSV se vzorem je prázdné

engine-e-ssv-scenario-is-not-number-in-the = `{ $s }` není číslo v CSV se vzorem

engine-e-ssv-scenario-pattern-csv-row-has-columns = řádek `{ $l }` v CSV se vzorem má sloupce: { $f }, očekáváno { $azimuths }

engine-e-ssv-scenario-transmit-pattern-table-needs-exactly = transmit.pattern = "table" vyžaduje právě jedno z pattern_csv a pattern_text

engine-e-ssv-scenario-transmit-pattern-is-not-booklet = transmit.pattern `{ $other }` není booklet, parametric ani table

engine-e-ssv-scenario-receiver-give-cn0-min-dbhz = receiver: zadejte cn0_min_dbhz nebo weak_signal, ne obojí

engine-e-ssv-scenario-the-carrier-loop-cannot-hold = smyčka nosné nedokáže při žádném C/N0 udržet uvedenou rychlost změny Dopplera

engine-e-ssv-scenario-receiver-apply-is-not-acquisition = receiver.apply `{ $other }` není acquisition, tracking ani both

engine-e-ssv-scenario-receiver-cn0-min-dbhz-must = receiver.cn0_min_dbhz musí být konečné

engine-e-ssv-scenario-navigation-give-exactly-one-of = navigation: zadejte právě jedno z preset a orbit

engine-e-ssv-scenario-navigation-preset-is-not-leo = navigation.preset `{ $p }` není leo, meo, geo, heo ani lunar-transfer

engine-e-ssv-scenario-navigation-give-exactly-one-of-2 = navigation: zadejte právě jedno z duration_min a duration_periods

engine-e-ssv-scenario-navigation-must-be-positive = navigation.{ $name } musí být kladné

engine-e-ssv-scenario-formation-offsets-deg-needs-to = formation.offsets_deg vyžaduje 1 až 8 konečných posunů

engine-e-ssv-scenario-formation-rel-accel-psd-must = formation.rel_accel_psd nesmí být záporné

engine-e-ssv-scenario-give-exactly-one-of-shell = zadejte právě jedno z [shell], [trajectory] a [navigation]

engine-e-ssv-scenario-formation-needs-navigation-table-for = { "[" }formation] vyžaduje tabulku [navigation] pro chief

engine-e-ssv-scenario-constellations-include-and-constellations-bands = constellations.include a constellations.bands nesmí být prázdné

engine-e-ssv-scenario-shell-altitude-km-must-be = shell.altitude_km musí být nad 100

engine-e-ssv-scenario-shell-grid-levels-above-is = shell.grid_levels nad 5 není podporováno

engine-e-ssv-scenario-shell-antenna-must-be-hemisphere = shell.antenna musí být hemisphere nebo omni

engine-e-ssv-scenario-the-shell-sweep-supports-the = přehled shell podporuje jen vyzařovací diagram booklet (tvarovaný diagram vyžaduje přehled trajectory)

engine-e-ssv-scenario-atmosphere-applies-to-trajectory-not = { "[" }atmosphere] platí pro [trajectory], nikoli pro [shell]

engine-e-ssv-scenario-trajectory-give-exactly-one-of = trajectory: zadejte právě jedno z preset a orbit

engine-e-ssv-scenario-trajectory-preset-is-not-leo = trajectory.preset `{ $p }` není leo, meo, geo, heo ani lunar-transfer

engine-e-ssv-scenario-unknown-preset = neznámá předvolba

engine-ssv-scenario-gnss-ssv-shell-km = gnss-ssv shell { $altitude_km } km: { $parts }

engine-ssv-scenario-gnss-ssv-navigation-position-rms = gnss-ssv navigation: RMS polohy celkem { $p }, uvnitř drah GNSS { $p2 }, nad nimi { $p3 }; nejdelší mezera { $longest_gap_min } min

engine-ssv-scenario-deputy-at-deg-km-relative = deputy při { $offset_deg } deg ({ $baseline_km } km): relativní RMS { $rel_rms_filter_m } m filtrovaně oproti { $rel_rms_from_absolute_m } m z absolutních určení polohy

engine-ssv-scenario-combined-max-outage-min = { $band } kombinovaně 1+ { $at_least_1_pct }% 4+ { $at_least_4_pct }% (maximální výpadek { $max_outage_1_min } min)

engine-ssv-scenario-gnss-ssv-trajectory-to-km = gnss-ssv trajectory ve výšce { $perigee_alt_km } až { $apogee_alt_km } km: { $parts }

## src/ssv/sweep.rs

engine-e-ssv-sweep-duration-min-and-step-min = duration_min a step_min musí být kladné

## src/ssv/weak.rs

engine-e-ssv-weak-receiver-must-be-positive-number = receiver.{ $n } musí být kladné číslo, zadáno { $v }

## src/standards_pack.rs

engine-e-standards-pack-no-standards-pack-named-the = žádný balíček norem s názvem `{ $id }`; balíčky: { $ids }

engine-e-standards-pack-pack-manifest = manifest balíčku: { $e }

engine-e-standards-pack-test-duplicate-id = test { $id }: duplicitní id

engine-e-standards-pack-test-scenario-is-not-in = test { $id }: scénář `{ $s }` není v balíčku

engine-e-standards-pack-test-scored-test-needs-bar = test { $id }: hodnocený test vyžaduje práh

engine-e-standards-pack-test-test-that-needs-input = test { $id }: test, který vyžaduje vstup, nemá žádné prahy

engine-e-standards-pack-test-give-either-scenario-or = test { $id }: zadejte buď `scenario`, nebo `needs_input`, ne obojí ani ani jedno

engine-e-standards-pack-test-supports-unknown-row = test { $id }: supports uvádí neznámý řádek `{ $r }`

engine-e-standards-pack-test-unknown-op = test { $id }: neznámá operace `{ $op }`

engine-e-standards-pack-test-bar-on-needs-exactly = test { $id }: práh na { $pointer } vyžaduje právě jedno z `value` a `against`

engine-e-standards-pack-row-duplicate-id = řádek { $id }: duplicitní id

engine-e-standards-pack-row-asks-must-be-short = řádek { $id }: `asks` musí být krátká parafráze

engine-e-standards-pack-row-no-test-supports-it = řádek { $id }: žádný test jej nepodporuje

engine-standards-pack-not-scored-needs-input = nehodnoceno: vyžaduje vstup ({ $n })

## src/study.rs

engine-e-study-study-has-no-scenarios-to = studie nemá žádné scénáře ke spuštění

engine-e-study-cannot-read-scenario = nelze číst scénář { $path }: { $e }

engine-e-study-scenario-failed = scénář { $path } selhal: { $e }

engine-e-study-scenario-produced-unparseable-json = scénář { $path } vytvořil nezpracovatelný JSON: { $e }

## src/suite.rs

engine-e-suite-invalid-suite-manifest = neplatný manifest sady: { $e }

## src/surface.rs

engine-e-surface-unknown-source-use-adsb-or = neznámý zdroj `{ $o }`: použijte `adsb` nebo `ais`

engine-e-surface-is-bytes-over-the-byte = { $what } má { $len } bajtů, přes limit { $limit } bajtů

engine-e-surface-log-start-utc-is-not = log_start_utc `{ $log_start_utc }` není čas UTC ve formátu ISO-8601

engine-e-surface-invalid-receiver-trust-session = neplatná relace receiver-trust: { $e }

engine-e-surface-log-start-utc-is-not-2 = log_start_utc `{ $t }` není čas UTC ve formátu ISO-8601

engine-e-surface-dataset-custom-needs-licence-licence = dataset `custom` vyžaduje licence, licence_url a attribution

engine-e-surface-at-least-one-map-is = je vyžadována alespoň jedna mapa

engine-e-surface-epoch = epocha: { $e }

engine-e-surface-not-utf = { $suffix }: není UTF-8

engine-e-surface-unknown-scenario-kind-the-kind = neznámý druh scénáře `{ $k }`; seznam druhů uvádí všechny druhy

engine-surface-is-not-bundled-it = `{ $name }` není součástí balíčku: { $why }

engine-surface-no-bundled-scenario-named-the = žádný přibalený scénář s názvem `{ $name }`; seznam příkladů uvádí ty, které jsou přibalené: { $v1 }

engine-e-surface-invalid-toml = neplatný TOML: { $e }

engine-e-surface-unknown-export-format-expected-one = neznámý formát exportu `{ $format }`; očekáváno jedno z czml, kml, geojson, stk nebo sigmf

engine-e-surface-duration-fps-gives-frames-and = duration_s x fps dává snímky: { $opts }, vrací se nejvýše { $MAX_ANIMATION_FRAMES }; snižte fps nebo duration_s, nebo zapište delší posloupnost pomocí příkazového řádku

engine-e-surface-scenario-run-failed = spuštění scénáře selhalo: { $e }

engine-e-surface-runs-log-names-file-path = runs[{ $i }].log uvádí soubor `path`; zadejte záznam jako `text` nebo `base64` (toto rozhraní nečte soubory)

engine-e-surface-max-sp-errors-must-be = max_sp_errors musí být nejvýše 20

engine-e-surface-frames-must-be-to = frames musí být 1 až { $MAX_AFS_FRAMES }

engine-e-surface-toi0-must-be-to-99 = toi0 musí být 0 až 99

engine-e-surface-runs-given-at-most-per = zadané běhy: { $runs }; nejvýše { $MAX_COMPLIANCE_RUNS } na jednu zprávu

engine-e-surface-the-runs-total-bytes-the = běhy dohromady: { $total } bajtů; limit pro jednu zprávu je { $max_bytes }

engine-e-surface-result-files-given-at-most = zadané soubory s výsledky: { $results }, nejvýše 256

engine-e-surface-result-is-not-json = výsledek { $v1 } není JSON: { $e }

engine-e-surface-unknown-format-use-prometheus-cef = neznámý formát `{ $o }`: použijte `prometheus`, `cef`, `leef`, `otlp` nebo `mqtt`

engine-e-surface-unknown-imu-format-use-csv = neznámý formát IMU `{ $o }`: použijte `csv` nebo `euroc`

engine-e-surface-unknown-axis-use-or = neznámá osa `{ $o }`: použijte `x`, `y` nebo `z`

engine-e-surface-id-must-be-to-64 = id musí mít 1 až 64 tisknutelných znaků ASCII bez mezer

engine-surface-fitted-from-stationary-imu-log = proloženo ze záznamu IMU v klidu, sha256 { $sha }, osa { $axis }, odhadce Allan

engine-e-surface-unknown-input-kind-use-result = neznámý input_kind `{ $o }`: použijte `result` nebo `jsonl`

engine-e-surface-the-input-holds-no-trust = vstup neobsahuje žádnou epochu důvěry

engine-e-surface-the-reply-is-over-the = odpověď je přes limit { $max_bytes } bajtů; pošlete méně epoch nebo ponechte `syslog_all` vypnuté

engine-e-surface-otlp-needs-build-with-the = otlp vyžaduje sestavení s funkcí `otlp`

engine-e-surface-the-pack-and-token-total = balíček a token dohromady: { $total } bajtů; limit je { $max_bytes }

engine-e-surface-the-timestamp-token-is-empty = token časového razítka je prázdný

engine-e-surface-must-be-64-lower-case = { $what } musí být 64 hexadecimálních číslic malými písmeny

engine-e-surface-must-be-32-bytes = { $what } musí mít 32 bajtů

engine-surface-verified-against-the-public-key = VERIFIED oproti veřejnému klíči, který jste zadali (otisk podepisujícího { $fp }).

engine-surface-intact-but-the-signer-is = INTACT, BUT THE SIGNER IS NOT PINNED: hashe a podpis jsou konzistentní s klíčem { $fp }, který balíček uvádí sám o sobě. Zadejte veřejný klíč podepisujícího, získaný od něj jinou cestou, aby bylo možné určit, kdo balíček podepsal.

engine-e-surface-files-must-be-json-object = files musí být objekt JSON ve tvaru název -> obsah

engine-e-surface-pack-has-at-most-64 = balíček má nejvýše 64 souborů

engine-e-surface-file-name-must-be-plain = název souboru `{ $k }` musí být prostý název

engine-e-surface-base64-is-not-valid-standard = { $k }: `base64` není platné standardní base64

## src/sweep.rs

engine-e-sweep-unknown-sweep-parameter = neznámý parametr přehledu: { $other }

engine-e-sweep-unknown-sweep-metric = neznámá metrika přehledu: { $other }

engine-e-sweep-nd-sweep-needs-at-least = nd_sweep vyžaduje alespoň jednu osu

engine-e-sweep-sweep-key-is-malformed = klíč přehledu `{ $key }` je chybně utvořen

engine-e-sweep-sweep-key-follows-an-array = klíč přehledu `{ $key }`: `{ $part }` následuje za polem, proto musí být indexem

engine-e-sweep-unreachable = nedosažitelné

engine-e-sweep-sweep-key-parent-is-not = klíč přehledu `{ $key }`: rodič `{ $part }` není tabulka

engine-e-sweep-sweep-key-no-field = klíč přehledu `{ $key }`: žádné pole `{ $part }`

engine-e-sweep-sweep-key-parent-of-is = klíč přehledu `{ $key }`: rodič `{ $last }` není tabulka

engine-e-sweep-sweep-key-no-field-2 = klíč přehledu `{ $key }`: žádné pole `{ $last }`

engine-e-sweep-metric-no-field-in-result = metrika `{ $path }`: ve výsledku není pole `{ $part }`

engine-e-sweep-metric-value-is-not-number = metrika `{ $path }`: hodnota není číslo

engine-e-sweep-sweep-node-serialize = serializace uzlu přehledu: { $e }

engine-e-sweep-sweep-node-result-parse = zpracování výsledku uzlu přehledu: { $e }

engine-e-sweep-sweep-axis-declared-unit-but = osa přehledu `{ $key }`: deklarovaná jednotka `{ $d }`, ale přehledem procházený balíček uvádí `{ $p }`

engine-e-sweep-sweep-worker-thread-panicked = pracovní vlákno přehledu zhavarovalo

engine-e-sweep-generic-sweep-needs-at-least = obecný přehled vyžaduje alespoň jednu osu

engine-e-sweep-generic-sweep-needs-at-least-2 = obecný přehled vyžaduje alespoň jednu metriku

engine-e-sweep-generic-sweep-base-must-carry = `base` obecného přehledu musí nést vlastní `kind`

engine-e-sweep-generic-sweep-cannot-sweep-another = obecný přehled nemůže procházet jiný přehled

## src/telecom_timing.rs

engine-e-telecom-timing-unknown-oscillator-expected-one-of = neznámý oscilátor { $oscillator }; očekáváno jedno z { $presets }

engine-e-telecom-timing-aging-per-day-and-temperature = aging_per_day a temperature_coeff_per_k musí být konečné

engine-e-telecom-timing-sample-interval-must-be-finite = sample_interval_s musí být konečné a kladné

engine-e-telecom-timing-duration-must-be-finite-and = duration_s musí být konečné a dlouhé alespoň dvanáct vzorků

engine-e-telecom-timing-gnss-loss-must-lie-in = gnss_loss_s musí ležet v intervalu [0, duration_s)

engine-e-telecom-timing-locked-te-sigma-ns-must = locked_te_sigma_ns musí být konečné a >= 0

engine-e-telecom-timing-temperature-and-frequency-offset-inputs = vstupy teploty a frekvenčního posunu musí být konečné (perioda > 0)

engine-e-telecom-timing-the-record-would-exceed-000 = záznam by překročil 5 000 000 vzorků; zvyšte sample_interval_s

engine-e-telecom-timing-time-error-series-needs-at = řada časové chyby vyžaduje alespoň 13 vzorků, zadáno { $pairs }

engine-e-telecom-timing-every-time-and-time-error = každé time_s a time_error_ns musí být konečné

engine-e-telecom-timing-time-must-increase = time_s musí růst

engine-e-telecom-timing-the-series-must-be-uniformly = řada musí být vzorkována rovnoměrně: krok { $v1 } je { $d } s, první je { $dt } s

engine-e-telecom-timing-csv-line-is-not-time = řádek CSV { $v1 } není `time_s,time_error_ns`

## src/telecom_timing.rs

engine-telecom-timing-the-mask-is-defined-through = maska je definována přes dolní propust 0.1 Hz, kterou tento engine používá jen při intervalech vzorkování { $MAX_FILTER_DT_S } s nebo kratších; tento záznam je vzorkován každých { $dt_s } s

engine-e-telecom-timing-give-either-holdover-or-series = zadejte buď [holdover], nebo [series], ne obojí

engine-e-telecom-timing-give-either-series-samples-or = zadejte buď series.samples, nebo series.csv_path, ne obojí

engine-e-telecom-timing-locked-duration-days-must-be = locked_duration_days musí být konečné a >= 0

engine-telecom-timing-ns-budget-exceeded-after = ; rozpočet { $max_abs_te_ns } ns překročen po { $t } s

engine-telecom-timing-ns-budget-never-exceeded = ; rozpočet { $max_abs_te_ns } ns nikdy nepřekročen

engine-telecom-timing-telecom-timing-max-te-ns = telecom-timing: max|TE| { $max_abs } ns za { $v2 } s; { $masks }{ $first_budget } (MODELLED)

## src/telemetry/cli.rs

engine-e-telemetry-cli-unknown-format-cef-or-leef = neznámé --format `{ $f }` (cef nebo leef)

engine-e-telemetry-cli-unknown-option = neznámá volba `{ $x }`

engine-e-telemetry-cli-input-and-result-are-alternatives = --input a --result se vzájemně vylučují

engine-e-telemetry-cli-listen = --listen { $l }: { $e }

engine-e-telemetry-cli-listen-no-address = --listen { $l }: žádná adresa

engine-telemetry-cli-warning-metrics-is-served-without = varování: /metrics je poskytováno bez ověření na { $addr }; navažte na localhost nebo jej umístěte za vlastní řízení přístupu

engine-e-telemetry-cli-bind = navázání { $addr }: { $e }

engine-telemetry-cli-serving-http-metrics = poskytuji http://{ $bound }/metrics

engine-e-telemetry-cli-host = --host: { $e }

engine-e-telemetry-cli-syslog-udp-and-syslog-tcp = --syslog-udp a --syslog-tcp se vzájemně vylučují

engine-e-telemetry-cli-syslog-octet-counting-applies-to = --syslog-octet-counting platí pro --syslog-tcp

engine-e-telemetry-cli-topic-part-must-be-non = { $name }: část tématu nesmí být prázdná, bez #, + a bez úvodního /

engine-e-telemetry-cli-otlp-needs-build-with-features = --otlp vyžaduje sestavení s `--features otlp`

engine-telemetry-cli-warning-input-line = varování: vstupní řádek { $line_no }: { $e }

engine-e-telemetry-cli-cannot-open = nelze otevřít { $p }: { $e }

## src/telemetry/otlp.rs

engine-e-telemetry-otlp-endpoint-must-start-with-http = endpoint musí začínat http://

engine-e-telemetry-otlp-endpoint-has-no-host = endpoint nemá hostitele

engine-e-telemetry-otlp-resolve = překlad { $hostport }: { $e }

engine-telemetry-otlp-no-address-for = žádná adresa pro { $hostport }

engine-telemetry-otlp-warning-otlp-export-failed = varování: export otlp selhal: { $e }

## src/telemetry/sample.rs

engine-e-telemetry-sample-not-json = není JSON: { $e }

engine-e-telemetry-sample-not-json-object = není objekt JSON

engine-e-telemetry-sample-is-not-number = `{ $k }` není číslo

engine-e-telemetry-sample-is-not-finite = `{ $k }` není konečné

engine-e-telemetry-sample-missing = chybí `t_s`

engine-e-telemetry-sample-score-outside-100 = `score` { $s } mimo 0..=100

engine-e-telemetry-sample-missing-state = chybí `state`

engine-e-telemetry-sample-is-not-an-array = `{ $key }` není pole

engine-e-telemetry-sample-entry-has-no-name = položka `{ $key }` nemá název

engine-e-telemetry-sample-position-is-missing-or-not = `position.{ $k }` chybí nebo není konečné číslo

engine-e-telemetry-sample-position-is-not-an-object = `position` není objekt ani null

engine-e-telemetry-sample-geometry-status-is-missing-or = `geometry.status` chybí nebo není řetězec

engine-e-telemetry-sample-geometry-is-not-finite-number = `geometry.{ $k }` není konečné číslo >= 0

engine-e-telemetry-sample-geometry-label-is-not-string = `geometry.label` není řetězec

engine-e-telemetry-sample-geometry-signal-loss-is-not = `geometry.signal_loss` není logická hodnota

engine-e-telemetry-sample-geometry-is-not-an-object = `geometry` není objekt ani null

engine-e-telemetry-sample-result-has-no-epochs = výsledek nemá `epochs`

engine-e-telemetry-sample-bad-epochs = chybné `epochs`: { $e }

## src/telemetry/syslog.rs

engine-e-telemetry-syslog-host-is-bytes-syslog-host = hostitel má { $host } bajtů; název hostitele syslog má nejvýše 255

engine-e-telemetry-syslog-host-must-be-printable-ascii = hostitel musí být tisknutelné ASCII bez mezer

## src/test_support.rs

engine-test-support-vs-not-representable-as-f64 = { "  " }{ $path }: { $g } oproti { $w } (nelze vyjádřit jako f64)

engine-test-support-present-expected-absent = { "  " }{ $path }.{ $k }: přítomno, očekáváno nepřítomno

engine-test-support-absent-expected-present = { "  " }{ $path }.{ $k }: nepřítomno, očekáváno přítomno

## src/time_transfer_budget.rs

engine-e-time-transfer-budget-must-be-finite = { $name }: { $n } musí být konečné

engine-e-time-transfer-budget-slant-tec-tecu-must-be = { $name }: slant_tec_tecu musí být konečné a nezáporné

engine-e-time-transfer-budget-line-not-mjd-ns = { $p }: řádek { $v1 }: není MJD,ns

engine-e-time-transfer-budget-no-ar-records-for = { $p }: žádné záznamy AR pro { $code }

engine-e-time-transfer-budget-unknown-series-format-circular-mjd = neznámý formát řady { $f } (circular-t, mjd-csv, rinex-clock)

engine-e-time-transfer-budget-must-be-finite-2 = { $n } musí být konečné

engine-e-time-transfer-budget-span-days-step-must-give = span_days / step_s musí dávat 16 až 20000 měření

engine-time-transfer-budget-time-transfer-budget-offset-ns = time-transfer-budget: { $name } - { $name2 } posun { $ns } ns (Sagnac { $ns2 } ns, ionosféra { $ns3 } ns); kombinovaná u { $ns4 } ns (typ A { $ns5 } ns při { $averaging_s } s); reálná řada: { $series } (MODELLED)

## src/tle.rs

engine-e-tle-non-ascii-characters-in-tle = znaky mimo ASCII v TLE { $label }: { $line }

engine-e-tle-tle-truncated-reading-columns = TLE zkráceno při čtení { $what } (sloupce { $v1 }..{ $z })

engine-e-tle-tle-too-short-for-column = TLE { $label } je příliš krátké pro kontrolní součet ve sloupci 69

engine-e-tle-tle-has-no-checksum-digit = TLE { $label } nemá číslici kontrolního součtu ve sloupci 69

engine-e-tle-tle-checksum-mismatch-column-69 = nesoulad kontrolního součtu TLE { $label }: sloupec 69 uvádí { $want }, vypočteno { $got }

engine-e-tle-not-tle-line = není řádek 1 TLE: { $line1 }

engine-e-tle-not-tle-line-2 = není řádek 2 TLE: { $line2 }

engine-e-tle-invalid-in-tle = neplatné { $what } v TLE: { $s }

engine-e-tle-invalid-epoch-year-in-tle = neplatný rok epochy v TLE: { $col }

engine-e-tle-invalid-catalogue-number-in-tle = neplatné katalogové číslo v TLE: { $col }

engine-e-tle-inclination-out-of-range-180 = sklon mimo rozsah [0, 180] deg: { $inclination_deg }

engine-e-tle-eccentricity-out-of-range = excentricita mimo rozsah [0, 1): { $eccentricity }

engine-e-tle-non-positive-mean-motion = nekladný střední pohyb: { $mean_motion_rev_day }

engine-e-tle-invalid-mantissa-in-tle = neplatná mantisa { $what } v TLE: { $mant }

engine-e-tle-invalid-exponent-in-tle = neplatný exponent { $what } v TLE: { $exp }

engine-tle-satellite-line-only-element-set = družice { $satnum }: sada prvků pouze s řádkem 2 byla zpracována jako analytické keplerovské (dvoutělesové) prvky — odporový člen řádku 1 a B* a sekulární členy SGP4 chybí, proto se tato dráha mimo epochu odchyluje od skutečného proložení SGP4; pro přesnost SGP4 dodejte odpovídající řádek 1

## src/tracking_loop.rs

engine-e-tracking-loop-tracking-loop-the-n0-profile = tracking-loop: profil C/N0 vyžaduje kladnou epochu a trvání

engine-e-tracking-loop-tracking-loop-the-n0-profile-2 = tracking-loop: profil C/N0 by vyžadoval více než { $MAX_DETECTOR_STEPS } kroků detektoru ({ $total } s při { $epoch_s } s na epochu); zkraťte ramp_duration_s nebo prodlužte predetection_integration_s

engine-e-tracking-loop-tracking-loop-must-be-finite = tracking-loop: { $name } musí být konečné

engine-e-tracking-loop-tracking-loop-must-be-positive = tracking-loop: { $name } musí být kladné (zadáno { $v })

engine-e-tracking-loop-tracking-loop-correlator-spacing-chips = tracking-loop: correlator_spacing_chips musí být pod 1.9 chipu (zadáno { $correlator_spacing_chips })

engine-e-tracking-loop-tracking-loop-pullin-bandwidth-ratio = tracking-loop: pullin_bandwidth_ratio musí být alespoň 1 (zadáno { $pullin_bandwidth_ratio }) — smyčka, která se znovu zachytává s UŽŠÍ šířkou pásma, než s jakou sleduje, by obrátila hysterezi

engine-e-tracking-loop-tracking-loop-ramp-duration-must = tracking-loop: ramp_duration_s nesmí být záporné

engine-e-tracking-loop-tracking-loop-cn0-low-dbhz = tracking-loop: cn0_low_dbhz ({ $cn0_low_dbhz }) nesmí překročit cn0_high_dbhz ({ $cn0_high_dbhz })

engine-e-tracking-loop-tracking-loop-must-not-be = tracking-loop: { $name } nesmí být prázdné

engine-e-tracking-loop-tracking-loop-has-entries-the = tracking-loop: { $name } má položky: { $axis }; limit je { $MAX_AXIS_LEN }

engine-e-tracking-loop-tracking-loop-holds-non-finite = tracking-loop: { $name } obsahuje nekonečnou hodnotu

engine-e-tracking-loop-tracking-loop-the-confirmation-dwells = tracking-loop: potvrzovací prodlevy musí být alespoň 1 epocha

## src/twstft_budget.rs

engine-e-twstft-budget-at-least-eight-samples-are = je potřeba alespoň osm vzorků

engine-e-twstft-budget-samples-must-increase-in-time = vzorky musí v čase růst

engine-e-twstft-budget-samples-must-be-on-regular = vzorky musí ležet na pravidelné mřížce

## src/verification.rs

engine-verification-rows-externally-validated-modelled-partner = { "\u000A" }řádky: { $total }; externě validované: { $validated }, modelované: { $modelled }, ve vlastnictví partnera: { $partner_owned }.{ "\u000A" }

engine-verification-the-complete-machine-checked-evidence = Úplný, strojově kontrolovaný registr důkazů: **řádky: { $total } — { $validated } VALIDATED, { $modelled } MODELLED, { $partner_owned } PARTNER**. Řádek smí být VALIDATED jen s nezávislým externím orákulem (vynucují to testy invariantů matice). Stejná data s proklikávacími odkazy u každého řádku na test, modul a potvrzený fixture jsou *Validation ledger* na https://kshana.dev. Proč není každý řádek Modelled externě validován, viz [MODELLED-RATIONALE.md](MODELLED-RATIONALE.md).{ "\u000A\u000A" }

engine-verification-capabilities-labelled-modelled = { "\u000A" }schopnosti označené MODELLED: { $modelled }.{ "\u000A" }

## src/wasm.rs

engine-wasm-files-json-is-not-json = files_json není JSON: { $e }

engine-wasm-runs-json-is-not-json = runs_json není JSON: { $e }

engine-wasm-runs-needs-label = runs[{ $i }] vyžaduje `label`

engine-wasm-runs-needs-result = runs[{ $i }] vyžaduje `result`

engine-wasm-results-json-is-not-json = results_json není pole JSON s řetězci: { $e }

engine-wasm-maps-json-must-be-json = maps_json musí být pole JSON s řetězci: { $e }

engine-wasm-plans-json-is-not-json = plans_json není pole JSON s řetězci: { $e }

engine-wasm-options-json-is-not-json = options_json není JSON: { $e }

engine-wasm-input-is-about-bytes-over = vstup má asi { $b64 } bajtů, přes limit { $v2 } bajtů

## plural forms

engine-e-clock-log-the-log-has-missing-epoch =
    záznam ve formátu { $format } má { $n_missing ->
        [one] { $n_missing } chybějící epochu
        [few] { $n_missing } chybějící epochy
        [many] { $n_missing } chybějící epochy
       *[other] { $n_missing } chybějících epoch
    }, počet mezer: { $n_gaps }, mřížka { $tau0 } s; nastavte gaps = "longest" pro zachování nejdelšího úseku bez mezer nebo gaps = "linear" pro interpolaci

engine-advanced-report-rows-of-non-numeric-column =
    { $n ->
        [one] { $n } řádek nečíselného sloupce
        [few] { $n } řádky nečíselného sloupce
        [many] { $n } řádku nečíselného sloupce
       *[other] { $n } řádků nečíselného sloupce
    }

engine-e-animation-duration-fps-gives-frames-the =
    duration x fps dává { $n ->
        [one] { $n } snímek
        [few] { $n } snímky
        [many] { $n } snímku
       *[other] { $n } snímků
    }; sekvence snímků vyžaduje počet mezi 2 a { $v1 }

engine-aocs-kind-aocs-wheels-slew-from-deg =
    aocs: { $n_w ->
        [one] { $n_w } kolo
        [few] { $n_w } kola
        [many] { $n_w } kola
       *[other] { $n_w } kol
    }, { $duration_s } s, přeorientování z { $series_err } deg -> { $settle } | konečná { $final_err } deg | špička kola { $peak_speed } rpm | { $v7 }

engine-api-unknown-scenario-kind-did-you =
    neznámý druh scénáře { $other } — mysleli jste { $hint }? `kshana kinds` vypíše { $n ->
        [one] { $n } vestavěný druh.
        [few] všechny { $n } vestavěné druhy.
        [many] všech { $n } vestavěného druhu.
       *[other] všech { $n } vestavěných druhů.
    }

engine-api-unknown-scenario-kind-kshana-kinds =
    neznámý druh scénáře { $other }. `kshana kinds` vypíše { $n ->
        [one] { $n } vestavěný druh.
        [few] všechny { $n } vestavěné druhy.
        [many] všech { $n } vestavěného druhu.
       *[other] všech { $n } vestavěných druhů.
    }

engine-api-builtins-integrity-satellites-epochs-available-hal =
    integrita | { $n_sats ->
        [one] { $n_sats } družice
        [few] { $n_sats } družice
        [many] { $n_sats } družice
       *[other] { $n_sats } družic
    } | dostupné epochy: { $samples_available }/{ $samples_total } ({ $report }%) | HAL { $al_h_m } m VAL { $al_v_m } m | sigma { $sigma_uere_m } m | Stanford(V): události integrity { $report2 }, HMI { $report3 }

engine-api-builtins-lunar-joint-od-clock-sats =
    lunar-joint-od-clock | { $n_sat ->
        [one] { $n_sat } družice
        [few] { $n_sat } družice
        [many] { $n_sat } družice
       *[other] { $n_sat } družic
    }, počet pozemních stanic: { $n_earth } | 3-D chyba stanice s VLBI { $station_pos_err_m } m oproti pouze měření vzdálenosti { $station_pos_err_m2 } m (zlepšení { $station_observability_improvement_factor }×) | RMS polohy družice { $sat_pos_rms_m } m | chyba hodin stanice { $station_clock_err_s } s | pozorování { $n_obs }/{ $n_params } parametrů

engine-api-builtins-lunar-frame-realisation-points-translation =
    lunar-frame-realisation | { $n_points ->
        [one] { $n_points } bod
        [few] { $n_points } body
        [many] { $n_points } bodu
       *[other] { $n_points } bodů
    } | chyba translace { $trans_err_norm_m } m, chyba rotace { $rot_err_norm_rad } rad, chyba měřítka { $scale_err_ppb } ppb | rms reziduí { $rms_residual_m } m | konvergence { $converged }

engine-api-builtins-moonlight-service-volume-sats-pts =
    moonlight-service-volume | { $n_sats ->
        [one] { $n_sats } družice
        [few] { $n_sats } družice
        [many] { $n_sats } družice
       *[other] { $n_sats } družic
    } ({ $geometry_label }) | počet bodů × epoch: { $n_grid_points } × { $n_epochs } | pokrytí { $coverage_pct }% (PDOP<{ $pdop_threshold }) | družice { $min_sats }–{ $max_sats } | PDOP { $pdop_min }/{ $pdop_mean }/{ $pdop_max } | HPL { $hpl_min_m }–{ $hpl_max_m } m | dostupnost PL { $pl_availability_pct }% | MODELLED

engine-api-builtins-lunar-differential-pnt-sats-illustrative =
    lunar-differential-pnt | { $n_sats ->
        [one] { $n_sats } družice
        [few] { $n_sats } družice
        [many] { $n_sats } družice
       *[other] { $n_sats } družic
    } (ilustrativní třída LCNS, bez příslušnosti) | základna { $baseline_km } km | chyba uživatele { $user_error_uncorrected_m } m → { $user_error_corrected_m } m (snížení { $reduction_factor }×) | HPL { $protection_level_m } m (σ_resid { $residual_sigma_m } m) | MODELLED

engine-api-builtins-lunar-station-coverage-points-epochs = lunar-station-coverage | body × epochy × pokusy: { $n_grid_points } × { $n_epochs } × { $n_trials } | dostupnost { $v4 } % | pokrytí { $v5 } % (p{ $percentile } <= { $accuracy_threshold_m } m) | korigovaná p{ $percentile } 3-D { $f } (nekorigovaná { $f2 }) | HPL max { $f3 } | MODELLED; nejde o tvrzení o žádném skutečném systému

engine-api-builtins-lunar-interop-export-ref-frame =
    lunar-interop-export | REF_FRAME { $frame } / TIME_SYSTEM { $time_system } | { $n_states ->
        [one] { $n_states } stav
        [few] { $n_states } stavy
        [many] { $n_states } stavu
       *[other] { $n_states } stavů
    }, OEM: počet řádků { $oem_line_count } | shoda { $v5 } (přítomná pole: { $present_fields }, chybějící: { $missing_fields }) | OEM round-trip { $v8 } | time-meta round-trip { $v9 } | KIF { $kif_bytes } bytes | MODELLED

engine-api-builtins-scenario-spoof-detect-svs-db =
    scénář { $r } | spoof-detect | { $n_sats ->
        [one] { $n_sats } družice
        [few] { $n_sats } družice
        [many] { $n_sats } družice
       *[other] { $n_sats } družic
    }, +{ $power_advantage_db } dB{ $v4 } | posun { $push } | fúzní skóre { $score } (práh { $fusion_threshold }) | { $verdict }

engine-api-builtins-scenario-samples-alt-km-lat =
    scénář { $r } | { $source } | { $n_samples ->
        [one] { $n_samples } vzorek
        [few] { $n_samples } vzorky
        [many] { $n_samples } vzorku
       *[other] { $n_samples } vzorků
    } | výška { $alt_min_km }–{ $alt_max_km } km | |lat| ≤ { $r2 }° | rychlost { $speed_min_m_s }–{ $speed_max_m_s } m/s{ $pass }

engine-api-builtins-raim-available-of-epochs-denied =
    { " " }| RAIM dostupný: { $n_available } z { $n_epochs ->
        [one] { $n_epochs } epochy
        [few] { $n_epochs } epoch
        [many] { $n_epochs } epochy
       *[other] { $n_epochs } epoch
    } (odepřeno: { $n_denied }, poplachy: { $n_alarm }; MODELLED)

engine-e-araim-reference-the-priors-need-subsets-of =
    apriorní hodnoty vyžadují podmnožiny { $n_fault_max ->
        [one] { $n_fault_max } současné události
        [few] { $n_fault_max } současných událostí
        [many] { $n_fault_max } současné události
       *[other] { $n_fault_max } současných událostí
    }; tato cesta jich vyjmenuje nejvýše { $most }

engine-bench-tasks-case-needs-values-has =
    případ `{ $id }` vyžaduje { $n ->
        [one] { $n } hodnotu
        [few] { $n } hodnoty
        [many] { $n } hodnoty
       *[other] { $n } hodnot
    }, má { $a }

engine-bin-gen-araim-m3-study-user-epochs-ura-values-in =
    { $n ->
        [one] { $n } uživatelská epocha
        [few] { $n } uživatelské epochy
        [many] { $n } uživatelské epochy
       *[other] { $n } uživatelských epoch
    } x 3 hodnoty URA za { $dt } s = { $v1 } ms na uživatelskou epochu (řešitelné: { $ok })

engine-body-pnt-positioning-around-user-relays-at =
    Určování polohy kolem { $name } — uživatel { $user_kind }, { $n_relays } relé ve { $r } km, { $n_epochs ->
        [one] { $n_epochs } epocha
        [few] { $n_epochs } epochy
        [many] { $n_epochs } epochy
       *[other] { $n_epochs } epoch
    }
    { "  " }Světelný čas k Zemi { $one_way_light_time_s } s jedním směrem, { $two_way_light_time_s } s tam a zpět; úhel Slunce–Země–těleso { $sun_separation_deg } deg
    { "  " }dostupnost: { $availability_relays } pouze konstelace, { $availability_with_earth } se vzdáleností k Zemi (Země v dohledu { $earth_visibility })
    { "  " }medián PDOP { $opt }; chyba RMS { $opt2 } pouze konstelace, { $opt3 } se vzdáleností k Zemi
    { "  " }medián formální sigmy { $opt4 } pouze konstelace, { $opt5 } se vzdáleností k Zemi{ "\u000A" }

engine-body-pnt-user-relays-earth-light-time = uživatel { $user_kind } · { $n_relays } relé · světelný čas k Zemi { $one_way_light_time_s } s · MODELLED

engine-cislunar-observability-cislunar-observability-refs-arc-epochs =
    cislunar-observability | { $c } s/c (reference: { $refs }) | oblouk { $arc_hours } h, { $rank_arc } epoch | hodnost { $first } → { $last } z { $state_dim } na oblouku | Gramián λ [{ $min_eigenvalue }…{ $max_eigenvalue }] cond { $condition_str } | okamžitá hodnost pouze vzdálenost { $rank_range_only } → vzdálenost+rychlost { $rank_range_rate } ({ $n_links ->
        [one] { $n_links } spoj
        [few] { $n_links } spoje
        [many] { $n_links } spoje
       *[other] { $n_links } spojů
    }) | GDOP pouze vzdálenost { $ro } vzdálenost+rychlost { $rr } | počáteční podmínky DRO (max. reziduum periodicity { $max_resid }) | posteriorní SRIF konečný v epoše s hodností 4 { $srif_epoch } (ověřeno: hodnost/STM/uzavření DRO/SRIF, modelován: návrh)

engine-cislunar-observability-extension-r3-this-run-is =
    ROZŠÍŘENÍ (R3) — tento běh NENÍ rovinnou konfigurací DRO, kterou popisuje `label` výše. Rozměr stavu { $state_dim }; rodina drah { $family }; { $n_spacecraft ->
        [one] { $n_spacecraft } družice
        [few] { $n_spacecraft } družice
        [many] { $n_spacecraft } družice
       *[other] { $n_spacecraft } družic
    }; sigma měření vzdálenosti { $sigma_range_m } m. Kde `label` říká „planar“ a „planar DROs“, čtěte zde uvedenou rodinu. VALIDATED doplňky: variační STM 6x6 je táž STM CR3BP ověřená konečnými diferencemi (crate::cr3bp), použitá v plné šířce; řádky prostorového Jacobiánu vzdálenosti / rychlosti změny vzdálenosti jsou analytické parciální derivace ověřené konečnými diferencemi, řádek rychlosti změny vzdálenosti křížově ověřen složku po složce proti nezávislé 3-D deepspace_od::range_rate_observable v tomto crate; počáteční podmínky halo / NRHO jsou diferenciálně korigované periodické dráhy z téhož korektoru, který reprodukuje publikovanou jižní NRHO L2 9:2, pokračované z tohoto publikovaného semene, a reziduum uzavření každého člena je uvedeno; šestistavové verdikty HODNOSTI jsou potvrzeny NEZÁVISLOU hodností z řádkově odstupňovaného tvaru (Gaussova eliminace s částečným pivotováním), která sdílí s cestou vlastních čísel/SVD nulový kód. ÚPRIMNÝ ROZSAH VĚTVE SRIF: křížová validace SRIF výše spotřebovává TUTÉŽ měřicí Jacobiány a redukuje se na totéž O^T O, takže její shoda je kontrola konzistence mezi dvěma numerickými stroji, NIKOLI nezávislé potvrzení prahu — nepočítá se jako validace žádné zde uvedené hodnoty. MODELLED: návrh rodiny (které úsečky, amplitudy a fáze), mřížka epoch, jednospojový oblouk a uvedená mez polohy kritéria odhadnutelnosti.

engine-e-clock-integrity-integrity-epochs-exceed-the-epoch =
    integrity: { $n ->
        [one] { $n } epocha překračuje
        [few] { $n } epochy překračují
        [many] { $n } epochy překračuje
       *[other] { $n } epoch překračuje
    } strop { $MAX_EPOCHS } epoch; zvyšte step_s

engine-earth-gnss-lunar-earth-gnss-at-lunar-distance =
    Earth-GNSS ve měsíční vzdálenosti — { $n_satellites ->
        [one] { $n_satellites } družice
        [few] { $n_satellites } družice
        [many] { $n_satellites } družice
       *[other] { $n_satellites } družic
    }, přijímač ve { $r } km{ "\u000A" }

engine-ephemeris-ground-track-samples-alt-km =
    { $source } pozemní stopa · { $n_samples ->
        [one] { $n_samples } vzorek
        [few] { $n_samples } vzorky
        [many] { $n_samples } vzorku
       *[other] { $n_samples } vzorků
    } · výška { $alt_min_km }–{ $alt_max_km } km · |lat| ≤ { $r }°

engine-geometry-sky-tle-holds-no-complete =
    sky: tle neobsahuje úplnou dvouřádkovou sadu elementů; { $n_ignored ->
        [one] { $n_ignored } řádek ignorován
        [few] { $n_ignored } řádky ignorovány
        [many] { $n_ignored } řádku ignorováno
       *[other] { $n_ignored } řádků ignorováno
    }, první: { $first }

engine-e-gse-sim-scenario-produces-epochs-need-increase =
    scénář vytváří { $n ->
        [one] { $n } epochu
        [few] { $n } epochy
        [many] { $n } epochy
       *[other] { $n } epoch
    } (je třeba ≥ 2); zvyšte duration_s nebo snižte step_s

engine-hybrid-integrity-hybrid-optical-rf-optical-footprint =
    hybrid-optical-rf | optická stopa { $footprint_m } m, fotonů: { $detected_photons } -> σ určování vzdálenosti { $c } mm, σ určování času { $c2 } ps | cross-RAIM HPL { $hpl_m } m / VPL { $vpl_m } m / TPL { $c3 } ns ({ $v8 }) | dostupnost { $c4 } % ({ $n_sites ->
        [one] { $n_sites } stanoviště
        [few] { $n_sites } stanoviště
        [many] { $n_sites } stanoviště
       *[other] { $n_sites } stanovišť
    }) | předání bez skoku { $v11 } NEES { $final_nees }∈[{ $c5 },{ $c6 }] { $v15 } | společné FoM { $score } (A { $availability } · P { $precision_grade } · I { $integrity_assured }) | ověřeno: CRLB/χ²-PL/sjednocení/předání, modelováno: σ/klimatologie

engine-impairment-eval-impairment-eval-detector-auc-in =
    impairment-eval | detektor { $detector } | AUC { $auc_in } vstup / { $auc_out } výstup (rozdíl { $optimism_gap }{ $v5 }) | Pd { $report } Pfa { $report2 } @ cíl { $target_pfa } | { $n_cases ->
        [one] { $n_cases } případ
        [few] { $n_cases } případy
        [many] { $n_cases } případu
       *[other] { $n_cases } případů
    } | MODELLED syntetická data

engine-e-iq-campaign-conditions-lists-value-give-one-per =
    { $at }: { $key } uvádí { $n ->
        [one] { $n } hodnotu
        [few] { $n } hodnoty
        [many] { $n } hodnoty
       *[other] { $n } hodnot
    }; zadejte jednu na každé id ({ $ids })

engine-iq-cli-iq-takes-positional-argument-got =
    iq { $cmd } přijímá { $n ->
        [one] { $n } poziční argument
        [few] { $n } poziční argumenty
        [many] { $n } pozičního argumentu
       *[other] { $n } pozičních argumentů
    }, zadáno: { $pos }

engine-iq-io-cli-iq-takes-path-argument-got =
    iq { $cmd } přijímá { $n ->
        [one] { $n } argument cesty
        [few] { $n } argumenty cesty
        [many] { $n } argumentu cesty
       *[other] { $n } argumentů cesty
    }, zadáno: { $pos }

engine-iq-io-cli-wrote-samples-hz-to-saturated =
    { $n ->
        [one] zapsán { $n } vzorek
        [few] zapsány { $n } vzorky
        [many] zapsáno { $n } vzorku
       *[other] zapsáno { $n } vzorků
    } ({ $to }, { $fs_hz } Hz) do { $files }; nasycených prvků: { $w }{ $v4 }

engine-e-iq-io-sigmf-stream-capture-at-sample-is-out =
    { $name }: zachycení na vzorku { $sample_start } je mimo pořadí nebo za { $n_file ->
        [one] { $n_file } vzorkem
        [few] { $n_file } vzorky
        [many] { $n_file } vzorky
       *[other] { $n_file } vzorky
    } v datech

engine-iq-labfit-iqfit-not-fitted-re-acquisitions-observed =
    neproloženo: { $n_reacq ->
        [one] pozorována { $n_reacq } opětovná akvizice
        [few] pozorovány { $n_reacq } opětovné akvizice
        [many] pozorováno { $n_reacq } opětovné akvizice
       *[other] pozorováno { $n_reacq } opětovných akvizic
    } (jsou třeba alespoň 3)

engine-iq-labfit-iqreport-threshold-direct-median-db-over =
    Práh J/S, přímo: medián { $om } dB z { $n ->
        [one] { $n } ztráty
        [few] { $n } ztrát
        [many] { $n } ztráty
       *[other] { $n } ztrát
    } (IQR { $t }).{ "\u000A\u000A" }

engine-iq-labfit-iqreport-events-loss-time-rms-pi90 =
    ; { $model }: { $n ->
        [one] { $n } událost
        [few] { $n } události
        [many] { $n } události
       *[other] { $n } událostí
    }, RMS času ztráty { $om } s, pokrytí PI90 { $om2 }

engine-iq-labfit-report-n0-samples-residual-rms-db =
    { "\u000A" }{ $n_samples ->
        [one] { $n_samples } vzorek
        [few] { $n_samples } vzorky
        [many] { $n_samples } vzorku
       *[other] { $n_samples } vzorků
    } C/N0, reziduální RMS { $om } dB.{ $r }{ "\u000A" }

engine-iq-labfit-report-event-time-rms-over-events =
    { "\u000A" }RMS času událostí { $om } s z { $n_events ->
        [one] { $n_events } události
        [few] { $n_events } událostí
        [many] { $n_events } události
       *[other] { $n_events } událostí
    }; ztráty vynechané { $loss_missed } / přidané { $loss_extra }, opětovné akvizice vynechané { $reacq_missed } / přidané { $reacq_extra }.

    | běh | pokles dB-Hz | opětovné uzamčení dB-Hz | události | RMS s |
    |---|---|---|---|---|{ "\u000A" }

engine-e-iq-short-samples-requested-short-run-holds =
    { $n ->
        [one] požadován { $n } vzorek
        [few] požadovány { $n } vzorky
        [many] požadováno { $n } vzorku
       *[other] požadováno { $n } vzorků
    }; krátký běh obsahuje nejvýše { $MAX_SAMPLES }

engine-e-iq-signals-galileo-codes-the-icd-defines =
    { $path }: { $n ->
        [one] { $n } kód
        [few] { $n } kódy
        [many] { $n } kódu
       *[other] { $n } kódů
    }, ICD definuje { $CODES_PER_COMPONENT }

engine-leo-fusion-ntn-5g-ntn-positioning-at-mhz =
    určování polohy 5G NTN na { $r } MHz, C/N0 { $r2 } až { $r3 } dB-Hz, { $n_satellites ->
        [one] { $n_satellites } družice
        [few] { $n_satellites } družice
        [many] { $n_satellites } družice
       *[other] { $n_satellites } družic
    } (ve výhledu { $mean_in_view }){ "\u000A" }

engine-leo-fusion-ntn-one-satellite-doppler-pass-samples =
    { "  " }přelet s Dopplerem z jedné družice: { $n_obs ->
        [one] { $n_obs } vzorek
        [few] { $n_obs } vzorky
        [many] { $n_obs } vzorku
       *[other] { $n_obs } vzorků
    } za { $duration_s } s, horizontální chyba { $horizontal_error_m } m{ "\u000A" }

engine-leo-fusion-ppp-ppp-convergence-to-horizontal-vertical =
    konvergence PPP na { $criterion_horizontal_m } m horizontálně / { $criterion_vertical_m } m vertikálně, běhů na případ: { $runs_per_case }, { $n_gnss ->
        [one] { $n_gnss } družice GNSS
        [few] { $n_gnss } družice GNSS
        [many] { $n_gnss } družice GNSS
       *[other] { $n_gnss } družic GNSS
    }{ "\u000A" }

engine-leo-fusion-pvt-kind-sats-at-km-mhz =
    { "  " }{ $name } { $role } { $n_satellites ->
        [one] { $n_satellites } družice
        [few] { $n_satellites } družice
        [many] { $n_satellites } družice
       *[other] { $n_satellites } družic
    } ve výšce { $mean_altitude_km } km, { $sys } MHz{ $v6 }{ "\u000A" }

engine-leo-fusion-pvt-kind-doppler-fix-measurements-from-satellites =
    { "  " }určení polohy z Dopplera: { $n_obs } měření z { $n_sats ->
        [one] { $n_sats } družice
        [few] { $n_sats } družic
        [many] { $n_sats } družice
       *[other] { $n_sats } družic
    }, 3D chyba { $error_3d_m } m (horizontálně { $horizontal_error_m } m){ "\u000A" }

engine-leo-fusion-pvt-kind-window-sats-3d-error =
    { "    " }okno { $window_s } s: { $n_sats ->
        [one] { $n_sats } družice
        [few] { $n_sats } družice
        [many] { $n_sats } družice
       *[other] { $n_sats } družic
    }, 3D chyba { $f } m{ "\u000A" }

engine-live-io-kshana-live-dropped-udp-datagram =
    kshana live: { $n ->
        [one] zahozen { $n } datagram udp, který engine nemohl převzít
        [few] zahozeny { $n } datagramy udp, které engine nemohl převzít
        [many] zahozeno { $n } datagramu udp, který engine nemohl převzít
       *[other] zahozeno { $n } datagramů udp, které engine nemohl převzít
    } (celkem { $udp_dropped })

engine-lunar-beacon-satellites-no-beacons =
    { $n_sats ->
        [one] { $n_sats } družice, bez majáků
        [few] { $n_sats } družice, bez majáků
        [many] { $n_sats } družice, bez majáků
       *[other] { $n_sats } družic, bez majáků
    }

engine-lunar-beacon-satellites-visible-beacons =
    { $n_sats ->
        [one] { $n_sats } družice
        [few] { $n_sats } družice
        [many] { $n_sats } družice
       *[other] { $n_sats } družic
    } + počet viditelných majáků: { $n_vis_beacons }

engine-lunar-beacon-satellites-no-beacons-2 =
    { $n_cmp ->
        [one] { $n_cmp } družice, bez majáků
        [few] { $n_cmp } družice, bez majáků
        [many] { $n_cmp } družice, bez majáků
       *[other] { $n_cmp } družic, bez majáků
    }

engine-main-ok-kind-resolves-and-all =
    ok: { $kind } — kind se rozpoznal a { $n_required ->
        [one] jeho { $n_required } publikovaný záznam povinného pole je splněn
        [few] všechny jeho { $n_required } publikované záznamy povinných polí jsou splněny
        [many] všech { $n_required } jeho publikovaných záznamů povinných polí je splněno
       *[other] všech { $n_required } jeho publikovaných záznamů povinných polí je splněno
    }; hodnoty polí se nekontrolují

engine-e-mcda-copras-copras-weights-but-criterion-types =
    COPRAS: { $n ->
        [one] { $n } váha
        [few] { $n } váhy
        [many] { $n } váhy
       *[other] { $n } vah
    }, ale typů kritérií { $types }

engine-e-mcda-copras-copras-alternative-has-values-but =
    COPRAS: alternativa { $i } má hodnot { $row }, ale { $n ->
        [one] existuje { $n } kritérium
        [few] existují { $n } kritéria
        [many] existuje { $n } kritéria
       *[other] existuje { $n } kritérií
    }

engine-e-mcda-electre-electre-alternative-has-values-but =
    ELECTRE I: alternativa { $i } má hodnot { $row }, ale { $n ->
        [one] existuje { $n } kritérium
        [few] existují { $n } kritéria
        [many] existuje { $n } kritéria
       *[other] existuje { $n } kritérií
    }

engine-e-mcda-moora-moora-weights-but-criterion-types =
    MOORA: { $n ->
        [one] { $n } váha
        [few] { $n } váhy
        [many] { $n } váhy
       *[other] { $n } vah
    }, ale typů kritérií { $types }

engine-e-mcda-moora-moora-alternative-has-values-but =
    MOORA: alternativa { $i } má hodnot { $row }, ale { $n ->
        [one] existuje { $n } kritérium
        [few] existují { $n } kritéria
        [many] existuje { $n } kritéria
       *[other] existuje { $n } kritérií
    }

engine-e-mcda-promethee-promethee-ii-weights-but-types =
    PROMETHEE II: { $n ->
        [one] { $n } váha
        [few] { $n } váhy
        [many] { $n } váhy
       *[other] { $n } vah
    }, ale typů { $types } / preferenčních funkcí { $prefs }

engine-e-mcda-promethee-promethee-ii-alternative-has-values =
    PROMETHEE II: alternativa { $i } má hodnot { $row }, ale { $n ->
        [one] existuje { $n } kritérium
        [few] existují { $n } kritéria
        [many] existuje { $n } kritéria
       *[other] existuje { $n } kritérií
    }

engine-e-mcda-topsis-topsis-weights-but-criterion-types =
    TOPSIS: { $n ->
        [one] { $n } váha
        [few] { $n } váhy
        [many] { $n } váhy
       *[other] { $n } vah
    }, ale typů kritérií { $types }

engine-e-mcda-topsis-topsis-alternative-has-values-but =
    TOPSIS: alternativa { $i } má hodnot { $row }, ale { $n ->
        [one] existuje { $n } kritérium
        [few] existují { $n } kritéria
        [many] existuje { $n } kritéria
       *[other] existuje { $n } kritérií
    }

engine-e-mcda-vikor-vikor-weights-but-criterion-types =
    VIKOR: { $n ->
        [one] { $n } váha
        [few] { $n } váhy
        [many] { $n } váhy
       *[other] { $n } vah
    }, ale typů kritérií { $types }

engine-e-mcda-vikor-vikor-alternative-has-values-but =
    VIKOR: alternativa { $i } má hodnot { $row }, ale { $n ->
        [one] existuje { $n } kritérium
        [few] existují { $n } kritéria
        [many] existuje { $n } kritéria
       *[other] existuje { $n } kritérií
    }

engine-e-mcda-waspas-waspas-weights-but-criterion-types =
    WASPAS: { $n ->
        [one] { $n } váha
        [few] { $n } váhy
        [many] { $n } váhy
       *[other] { $n } vah
    }, ale typů kritérií { $types }

engine-e-mcda-waspas-waspas-alternative-has-values-but =
    WASPAS: alternativa { $i } má hodnot { $row }, ale { $n ->
        [one] existuje { $n } kritérium
        [few] existují { $n } kritéria
        [many] existuje { $n } kritéria
       *[other] existuje { $n } kritérií
    }

engine-e-mcda-wpm-wpm-weights-but-criterion-types =
    WPM: { $n ->
        [one] { $n } váha
        [few] { $n } váhy
        [many] { $n } váhy
       *[other] { $n } vah
    }, ale typů kritérií { $types }

engine-e-mcda-wpm-wpm-alternative-has-values-but =
    WPM: alternativa { $i } má hodnot { $row }, ale { $n ->
        [one] existuje { $n } kritérium
        [few] existují { $n } kritéria
        [many] existuje { $n } kritéria
       *[other] existuje { $n } kritérií
    }

engine-e-mcda-wsm-alternative-has-values-but-there =
    alternativa '{ $name }' má hodnot { $values }, ale { $n ->
        [one] existuje { $n } kritérium
        [few] existují { $n } kritéria
        [many] existuje { $n } kritéria
       *[other] existuje { $n } kritérií
    }

engine-e-naif-kernel-daf-summary-record-claims-summaries =
    záznam souhrnů DAF { $rec } uvádí { $count ->
        [one] { $count } souhrn
        [few] { $count } souhrny
        [many] { $count } souhrnu
       *[other] { $count } souhrnů
    }

engine-nmea-synth-gen-the-receiver-reports-fix-again =
    přijímač opět hlásí řešení polohy ({ $n_used ->
        [one] použita { $n_used } družice
        [few] použity { $n_used } družice
        [many] použito { $n_used } družice
       *[other] použito { $n_used } družic
    })

engine-nmea-synth-gen-the-receiver-has-no-fix =
    přijímač nemá řešení polohy ({ $n_used ->
        [one] { $n_used } použitelná družice
        [few] { $n_used } použitelné družice
        [many] { $n_used } použitelné družice
       *[other] { $n_used } použitelných družic
    }, potřebné jsou čtyři)

engine-observability-gramian-gdop-undefined-rank-deficient-singular =
    GDOP nedefinován (geometrie s nedostatečnou hodností / singulární): hodnost { $rank } z { $n ->
        [one] { $n } stavu
        [few] { $n } stavů
        [many] { $n } stavu
       *[other] { $n } stavů
    }, defekt datumu { $v3 }, podmíněnost { $v4 }

engine-oem-oem-interop-round-tripped-segment =
    oem-interop: zpětně převedeno segmentů: { $segments }, { $n_states_total ->
        [one] { $n_states_total } stav
        [few] { $n_states_total } stavy
        [many] { $n_states_total } stavu
       *[other] { $n_states_total } stavů
    }; maximální chyba zpětného převodu { $p } km / { $v } km/s (MODELLED interop)

engine-oem-oem-interop-ingested-segment-states =
    oem-interop: načteno segmentů: { $segments }, { $n_states_total ->
        [one] { $n_states_total } stav
        [few] { $n_states_total } stavy
        [many] { $n_states_total } stavu
       *[other] { $n_states_total } stavů
    } z externího OEM (původce { $originator }) (MODELLED interop)

engine-pvt-pvt-sat-nav-epochs-solved =
    pvt { $r } | { $n_satellites_nav ->
        [one] { $n_satellites_nav } družice
        [few] { $n_satellites_nav } družice
        [many] { $n_satellites_nav } družice
       *[other] { $n_satellites_nav } družic
    } v navigaci | vyřešeno epoch: { $epochs_solved }/{ $epochs_total } | průměr družic { $mean_n_used }, PDOP { $mean_pdop }{ $acc }

engine-e-realdata-ion-sdr-expected-one-root-element-found =
    očekáván jeden kořenový element, { $n ->
        [one] nalezen { $n } kořenový element
        [few] nalezeny { $n } kořenové elementy
        [many] nalezeno { $n } kořenového elementu
       *[other] nalezeno { $n } kořenových elementů
    }

engine-receiver-trust-geometry-geometry-hdop-pdop-vdop-satellites =
    geometrie { $label }: HDOP { $fmt_dop }, PDOP { $fmt_dop2 }, VDOP { $fmt_dop3 }, { $n_used ->
        [one] { $n_used } družice
        [few] { $n_used } družice
        [many] { $n_used } družice
       *[other] { $n_used } družic
    }{ $v6 }

engine-receiver-trust-geometry-derived-from-logged-satellites =
    odvozeno { $n ->
        [one] z { $n } zaznamenané družice
        [few] ze { $n } zaznamenaných družic
        [many] z { $n } zaznamenané družice
       *[other] z { $n } zaznamenaných družic
    }

engine-receiver-trust-geometry-as-the-receiver-reports-it =
    podle hlášení přijímače { $n ->
        [one] { $n } použitá družice
        [few] { $n } použité družice
        [many] { $n } použité družice
       *[other] { $n } použitých družic
    }

engine-receiver-trust-geometry-satellites-fewer-than =
    { $n ->
        [one] { $n } družice
        [few] { $n } družice
        [many] { $n } družice
       *[other] { $n } družic
    }, méně než { $min_used }

engine-e-receiver-trust-machines-imu-fit-the-log-has-samples-at =
    záznam obsahuje { $n ->
        [one] { $n } vzorek
        [few] { $n } vzorky
        [many] { $n } vzorku
       *[other] { $n } vzorků
    }; pro proložení Allanovy odchylky je jich potřeba alespoň { $MIN_SAMPLES }

engine-e-receiver-trust-machines-imu-fit-the-sample-interval-is-not =
    interval vzorkování není rovnoměrný (intervaly lišící se o více než 25 %: { $uneven } z { $n ->
        [one] { $n } intervalu
        [few] { $n } intervalů
        [many] { $n } intervalu
       *[other] { $n } intervalů
    }): nejprve záznam převzorkujte

engine-e-scenario-time-grid-too-large-steps =
    časová mřížka je příliš velká: { $n ->
        [one] { $n } krok překračuje
        [few] { $n } kroky překračují
        [many] { $n } kroku překračuje
       *[other] { $n } kroků překračuje
    } MAX_TIME_STEPS ({ $MAX_TIME_STEPS }); použijte hrubší krok nebo kratší trvání

engine-slot-timing-fitted-to-the-overlapping-allan =
    proloženo překrývající se Allanovou odchylkou záznamu o { $n_samples ->
        [one] { $n_samples } vzorku
        [few] { $n_samples } vzorcích
        [many] { $n_samples } vzorku
       *[other] { $n_samples } vzorcích
    } při { $tau0_s } s, v bázi frekvenční modulace podle IEEE Std 1139

engine-solar-system-solar-system-at-jd-tdb =
    Sluneční soustava v { $input } (JD { $jd_tdb } TDB), { $n_bodies ->
        [one] { $n_bodies } těleso
        [few] { $n_bodies } tělesa
        [many] { $n_bodies } tělesa
       *[other] { $n_bodies } těles
    }, pozorovatel { $observer }
    { "  " }{ $standish_table }{ "\u000A" }

engine-e-space-packet-cuc-fine-does-not-fit =
    jemná část CUC { $fine } se nevejde do { $n ->
        [one] { $n } oktetu
        [few] { $n } oktetů
        [many] { $n } oktetu
       *[other] { $n } oktetů
    }

engine-space-packet-space-packet-framed-ccsds-133 =
    space-packet: { $packet_count ->
        [one] zarámován { $packet_count } paket CCSDS-133.0 typu { $v2 }
        [few] zarámovány { $packet_count } pakety CCSDS-133.0 typu { $v2 }
        [many] zarámováno { $packet_count } paketu CCSDS-133.0 typu { $v2 }
       *[other] zarámováno { $packet_count } paketů CCSDS-133.0 typu { $v2 }
    }, APID { $apid }, celkem { $total_bytes } oktetů, zpětná konverze přesná ({ $round_trip_ok })

engine-e-spk-writer-states-for-epochs =
    stavy: { $states } pro { $n ->
        [one] { $n } epochu
        [few] { $n } epochy
        [many] { $n } epochy
       *[other] { $n } epoch
    }

engine-e-spk-writer-states-degree-needs =
    { $n ->
        [one] { $n } stav
        [few] { $n } stavy
        [many] { $n } stavu
       *[other] { $n } stavů
    }; stupeň { $degree } vyžaduje { $value }

engine-e-spk-writer-epochs-for-difference-lines =
    epochy: { $epochs } pro { $n ->
        [one] { $n } diferenční řádek
        [few] { $n } diferenční řádky
        [many] { $n } diferenčního řádku
       *[other] { $n } diferenčních řádků
    }

engine-e-sweep-sweep-key-index-is-past =
    klíč přehledu `{ $key }`: index { $i } je za { $n ->
        [one] { $n } položkou pole
        [few] { $n } položkami pole
        [many] { $n } položkami pole
       *[other] { $n } položkami pole
    }

engine-telemetry-cli-warning-mqtt-messages-were-not =
    varování: { $n ->
        [one] { $n } zpráva MQTT nebyla doručena
        [few] { $n } zprávy MQTT nebyly doručeny
        [many] { $n } zprávy MQTT nebylo doručeno
       *[other] { $n } zpráv MQTT nebylo doručeno
    }

## legal

# legal: native review
engine-legal-compliance-statement = Řádek označený jako „evidenced“ znamená, že běh z této sady podporuje důkazy pro schopnosti, které řádek uvádí. Neznamená to zjištění, že jsou požadavky rámce splněny, ani to, že by některý produkt byl kýmkoli ohodnocen či schválen. Sloupec mezer uvádí, co běhy neukazují.

# legal: native review
engine-legal-bench-surface-notice = Pouze pohyb vozidla a označené intervaly událostí. Nic, co se zde exportuje, není rádiovým signálem ani signálem v základním pásmu, takový signál nemodeluje ani jej neřídí, a událost je časový interval, nikoli návod na vytváření rušení. Signály dodávají laboratorní simulátor a jeho obsluha, která odpovídá za to, že je spouští jen tam, kde je to povoleno (vodivě nebo ve stíněném prostoru, podle bezpečnostních pokynů samotného simulátoru). Kshana nezveřejňuje žádné výsledky takových běhů.

# legal: native review
engine-legal-iq-campaign-roc-statement = MODELLED: ROC na úrovni oken pro každý monitor na daných záznamech. Každé uvedené okno události je pozitivní a každé okno roc_window_s mimo události negativní; okno se při prahu počítá, když testovací statistika monitoru v okně prahu dosáhne. P_fa je na negativní okno, nikoli na test.

# legal: native review
engine-legal-lunanet-afs-advisory = Pouze poradní charakter: výstup analýzy z výzkumného a inženýrského nástroje; nejde o typově schválené navigační zařízení ani o službu z oblasti bezpečnosti života. Kontroluje proud symbolů proti jednomu vydání zveřejněné specifikace a nic neříká o žádném uzlu ani službě LunaNet.

# legal: native review
engine-legal-iqfit-statement = MODELLED: každé nafitované číslo popisuje otevřený přijímač (uvedený návrh smyčky a vstupní řetězec) na záznamech, které dostal, nafitované na hodnocené výsledky kampaně. Není měřením žádného jiného přijímače. Předpovědi jsou označeny PREDICTION, s nejbližším testovaným záznamem a vzdáleností mimo testované podmínky.

# legal: native review
engine-legal-iqfit-advisory = Pouze poradní charakter: výstup analýzy, nejde o typově schválené navigační zařízení; předpovědi jsou výstupy modelu s uvedenou chybou, nikoli záruky.

# legal: native review
engine-legal-lunar-time-lab-source-statement = Prohlášení o zdroji, nikoli tvrzení: materiály ICG WG-B Lunar PNT z června 2024 (unoosa.org, LunarPNT_Jun24_01_04.pdf, zdroj S3 studie) popisují laboratoř lunárního časového etalonu u stanice s časovým cílem na úrovni nanosekund. Kshana tento cíl cituje jen pro kontext; nepřijímá jej a nic v tomto bloku neukazuje, že by jej splňovaly skutečné hodiny kterékoli stanice.

# legal: native review
engine-legal-standards-pack-notice = Balíček norem měří modelované scénáře proti prahům stanoveným před během. Podporuje důkazy pro řádky rámce, které uvádí; žádný produkt neohodnocuje ani neschvaluje a práh označený MET říká pouze to, že modelovaný výstup scénáře uvedený práh splnil.

# legal: native review
engine-legal-standards-pack-advisory = Pouze poradní charakter: výstup analýzy z výzkumného a inženýrského nástroje; nejde o typově schválené navigační zařízení ani o službu z oblasti bezpečnosti života; nesmí být jediným podkladem pro žádné rozhodnutí o navigaci ani bezpečnosti.

# legal: native review
engine-legal-geometry-statement = Geometrie při uvedeném modelu chyby (MODELLED): viditelnost v přímé linii proti uvedenému obzoru, faktor DOP a gaussovská elipsa chyby pro nezávislé, stejné, nulově střední gaussovské chyby vzdálenosti o uvedené ekvivalentní chybě vzdálenosti uživatele. Není předpovědí skutečné chyby přijímače, která má také systematické chyby, vícecestné šíření a chyby bez přímé viditelnosti, a není mezí integrity. Přednastavené konstelace jsou reprezentativní geometrií, nikoli oblohou daného data na daném místě.

# legal: native review
engine-legal-resilience-disclaimer = Sebehodnocení odvozené ze simulace, vztažené k DHS RPCF v2.0. Nejde o certifikaci ani akreditaci a nepředstavuje schválení žádným orgánem (DHS, IEEE ani jiným). Každé dílčí skóre je MODELLED, pokud není výslovně označeno VALIDATED, a skóre jsou ukazatele kvality v časové oblasti a v detekci, nikoli přesnost v oblasti polohy.

# legal: native review
engine-legal-observatory-notice = Buňka označená jako zhoršená znamená, že vysoký podíl letadel tam ten den hlásil nízkou přesnost navigace. Nepřisuzuje se žádná příčina. Buňka, která není pozorována nebo chybí, nebyla hodnocena, což není totéž jako bez problémů. Pouze poradní charakter: nejde o schválení, certifikaci ani prohlášení o shodě.

# legal: native review
engine-legal-receiver-trust-advisory = Software pouze poradního charakteru, nikoli typově schválené navigační zařízení (IEC 61108, IEC 61162): za navigaci plavidla zůstává odpovědný provozovatel.

# legal: native review
engine-legal-evidence-roundtrip-notice = Propojuje čtyři záznamy pomocí otisku (hash): scénář, uvedené zkušební podmínky laboratoře, záznam přijímače a skóre tohoto záznamu vůči uvedeným událostem. Není signálem, není návodem k přehrání a není certifikací. Za to, jak se pohyb ze scénáře dostal k přijímači (soubor přehraný laboratorním simulátorem, vodivě nebo ve stíněném prostoru), odpovídal provozovatel, a je zde zaznamenáno pouze tak, jak bylo uvedeno.

# legal: native review
engine-legal-evidence-bundle-disclaimer = Tento balíček je technický záznam toho, co engine Kshana vypočítal z uvedeného záznamu přijímače s uvedenou konfigurací. Není právním posudkem, není zjištěním skutečností o jakékoli události ani její příčině a není certifikací.

# legal: native review
engine-legal-bench-notice = Pouze poradní charakter: modelováno nebo měřeno vůči uvedeným referencím; nejde o schválení, certifikaci ani prohlášení o shodě. Skóre popisuje záznam nebo korpus, nikdy produkt.

# legal: native review
engine-legal-osnma-advisory = Pouze poradní charakter: jde o výstup analýzy a monitorování, nikoli o typově schválené navigační zařízení. Zde uvedený stav autentizace není službou integrity navigace a nesmí být jediným podkladem pro žádné rozhodnutí o navigaci ani bezpečnosti.
