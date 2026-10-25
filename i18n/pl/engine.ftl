# SPDX-License-Identifier: AGPL-3.0-only
# pl catalogue of the engine messages (i18n/en/engine.ftl is the source).
# A message missing here is shown in English, per message. Translators: keep every $variable
# of the English message, keep the message ids, and do not translate error codes (E-...).

## src/clock_log.rs

engine-e-clock-log-unknown-clock-log-format-expected = nieznany format logu zegara { $other }; oczekiwano jednego z: { $format_names }

engine-e-clock-log-unknown-gap-policy-expected-refuse = nieznana polityka luk { $other }; oczekiwano refuse, longest lub linear

engine-e-clock-log-give-either-the-log-text = podaj albo tekst logu, albo jego ścieżkę, nie oba naraz

engine-e-clock-log-clock-log-needs-its-text = log zegara wymaga swojego tekstu lub ścieżki

engine-e-clock-log-tau0-must-be-finite-and = tau0_s musi być skończone i > 0 (otrzymano { $t })

engine-e-clock-log-units-and-data-apply-to = units i data dotyczą wyłącznie formatu timelab

engine-e-clock-log-channel-applies-to-the-ticc = channel dotyczy wyłącznie formatu ticc

engine-e-clock-log-cannot-read-clock-log = nie można odczytać logu zegara { $path }: { $e }

engine-e-clock-log-clock-log-path-is-not = ścieżka logu zegara nie jest dostępna w kompilacji WebAssembly; podaj log jako tekst

engine-e-clock-log-the-log-yields-usable-sample = log { $format } daje użyteczne próbki w liczbie: { $x }; wymagane są co najmniej 3

engine-e-clock-log-not-rinex-clock-file-no = to nie jest plik zegarowy RINEX: brak rekordu END OF HEADER

engine-e-clock-log-the-rinex-clock-file-has = plik zegarowy RINEX nie zawiera rekordów AS ani AR

engine-e-clock-log-the-rinex-clock-file-holds = plik zegarowy RINEX zawiera zegary w liczbie: { $many }; wskaż jeden przez clock = "..." ({ $many2 })

engine-e-clock-log-no-as-or-ar-records = brak rekordów AS lub AR dla zegara { $id }

engine-e-clock-log-the-clock-has-single-epoch = zegar ma jedną epokę; nie można wyznaczyć tau0

engine-e-clock-log-the-log-has-no-readings = log { $format } nie zawiera odczytów

engine-e-clock-log-unknown-phase-unit-expected-ms = nieznana jednostka fazy { $other }; oczekiwano s, ms, us, ns lub ps

engine-e-clock-log-timelab-line-has-column-the = wiersz TimeLab { $v1 }: kolumny: { $v }, a pierwszy wiersz danych ma kolumny: { $first }

engine-e-clock-log-timelab-line-has-columns-one = wiersz TimeLab { $v1 }: kolumny: { $v }; odczytywana jest jedna (wartość) lub dwie (czas wartość)

engine-e-clock-log-timelab-line-is-not-numeric = wiersz TimeLab { $v1 } nie jest numeryczny: { $l }

engine-e-clock-log-the-timelab-log-has-no = log timelab nie zawiera odczytów

engine-e-clock-log-unknown-data-expected-phase-or = nieznane data { $other }; oczekiwano phase lub frequency

engine-e-clock-log-tau0-header-is-not-positive = nagłówek tau0 { $v } nie jest dodatnią liczbą sekund

engine-e-clock-log-frequency-data-is-fractional-frequency = dane frequency to częstotliwość względna; jej jednostką może być wyłącznie 1

engine-e-clock-log-two-column-frequency-logs-are = dwukolumnowe logi frequency nie są odczytywane; podaj frequency jako jedną kolumnę wraz z tau0

engine-e-clock-log-unknown-time-units-expected-or = nieznane time_units { $o }; oczekiwano s lub mjd

engine-e-clock-log-the-timelab-log-time-column = kolumna czasu logu timelab musi rosnąć

engine-e-clock-log-single-reading-tau0-cannot-be = pojedynczy odczyt; nie można wyznaczyć tau0

engine-e-clock-log-the-timelab-log-has-non = log timelab: odczyty nieskończone: { $non_finite }

engine-e-clock-log-the-ticc-log-holds-channels = log TICC zawiera kanały: { $many }; wskaż jeden przez channel = "..."

engine-e-clock-log-no-readings-on-channel-found = brak odczytów na kanale { $channel } (znaleziono: { $labels })

engine-e-clock-log-ticc-interval-mode-lines-carry = wiersze trybu interwału TICC nie niosą czasu; podaj tau0_s (okres zdarzeń)

engine-e-clock-log-the-readings-do-not-increase = odczyty { $channel } nie rosną, więc nie są znacznikami czasu (wyjście trybu Period TICC nie jest odczytywane; użyj trybu Timestamp)

engine-e-clock-log-single-time-stamp-tau0-cannot = pojedynczy znacznik czasu; nie można wyznaczyć tau0

engine-e-clock-log-two-time-stamps-apart-under = dwa znaczniki czasu { $channel } w odstępie { $w } s, poniżej połowy tau0 = { $tau0 } s

engine-e-clock-log-the-time-stamps-of-go = znaczniki czasu { $format } dla { $clock } cofają się (restart demona lub skok zegara); podziel log i odczytaj każdą część osobno

engine-e-clock-log-the-log-has-no-readings-2 = log nie zawiera odczytów: { $what }

engine-e-clock-log-the-log-holds-sources-name = log zawiera źródła: { $many }; wskaż jedno przez { $selector } = "..." ({ $many2 })

engine-e-clock-log-no-readings-for-found = brak odczytów { $what } dla { $id } (znaleziono: { $names })

engine-e-clock-log-the-servo-of-never-reached = serwo { $id } nigdy nie osiągnęło stanu zablokowania s2

engine-e-clock-log-the-log-has-no-chrony = log nie zawiera odczytów śledzenia chrony

## src/acquisition.rs

engine-e-acquisition-sample-rate-hz-is-not = częstotliwość próbkowania { $fs_hz } Hz nie jest całkowitą liczbą próbek na milisekundę

engine-e-acquisition-coherent-ms-and-noncoherent-must = coherent_ms i noncoherent muszą być dodatnie

engine-e-acquisition-the-doppler-grid-needs-positive = siatka Dopplera wymaga dodatniego kroku i nieujemnego maksimum

engine-e-acquisition-pfa-must-lie-in = pfa musi leżeć w przedziale (0, 1)

engine-e-acquisition-samples-supplied-needed = próbki: podano { $samples }, potrzeba { $needed }

engine-e-acquisition-empty-doppler-grid = pusta siatka Dopplera

engine-e-acquisition-the-samples-carry-no-power = próbki nie niosą mocy

## src/adm.rs

engine-e-adm-unknown-attitude-type = nieznany ATTITUDE_TYPE { $s }

engine-e-adm-an-aem-needs-at-least = AEM wymaga co najmniej jednego segmentu

engine-e-adm-segment-is-not-version-attitude = segment { $i }: { $t } nie jest typem orientacji w wersji { $version }

engine-e-adm-segment-values-for = segment { $i }: wartości { $values } dla { $t }

engine-e-adm-aem-version-has-no-ndm = AEM w wersji 1.0 nie ma tu postaci NDM/XML; zapisz KVN

engine-e-adm-this-attitude-type-has-no = ten typ orientacji nie ma postaci w wersji 2.0

engine-e-adm-expected-meta-start-found = oczekiwano META_START, znaleziono { $l }

engine-e-adm-meta-start-without-meta-stop = META_START bez META_STOP

engine-e-adm-unexpected-metadata-line = nieoczekiwany wiersz metadanych { $other }

engine-e-adm-in-version-aem = { $att } w AEM w wersji { $version }

engine-e-adm-interpolation-degree = INTERPOLATION_DEGREE { $d }: { $e }

engine-e-adm-expected-data-start-after-meta = oczekiwano DATA_START po META_STOP

engine-e-adm-data-start-without-data-stop = DATA_START bez DATA_STOP

engine-e-adm-empty-data-line = pusty wiersz danych

engine-e-adm-values-on-line = wiersz { $att }: wartości { $vals }: { $b }

engine-e-adm-unexpected-data-line = nieoczekiwany wiersz danych { $other }

engine-e-adm-attitude-type-has-no-xml = typ orientacji nie ma postaci XML

engine-e-adm-message-without-version-attribute = komunikat bez atrybutu version

engine-e-adm-expected-found = oczekiwano { $vers_key }, znaleziono { $other }

engine-e-adm-header-without-creation-date-or = nagłówek bez CREATION_DATE lub ORIGINATOR

engine-e-adm-missing = brak { $k }

engine-e-adm-unexpected-keyword = nieoczekiwane słowo kluczowe { $k }

engine-e-adm-spin-block-holds-nutation-or = blok spin zawiera dane nutacji albo momentu pędu, nie oba naraz

engine-e-adm-unexpected-apm-keyword = nieoczekiwane słowo kluczowe APM { $other }

engine-e-adm-unexpected-apm-line = nieoczekiwany wiersz APM { $b }

engine-e-adm-without = { $b } bez { $stop }

engine-e-adm-unexpected-line-in = nieoczekiwany wiersz w { $b }: { $other }

engine-e-adm-incomplete-group = niekompletna grupa { $keys }

engine-e-adm-unknown-apm-block-start = nieznany blok APM { $other }_START

engine-e-adm-apm-metadata-needs-object-name = metadane APM wymagają OBJECT_NAME, OBJECT_ID i TIME_SYSTEM

engine-e-adm-apm-without-epoch = APM bez EPOCH

engine-e-adm-rotation-axis = oś obrotu { $o }

engine-e-adm-values-for = wartości { $values } dla { $t }

engine-e-adm-euler-record-without-euler-rot = rekord Eulera bez EULER_ROT_SEQ

engine-e-adm-rotation-sequence = sekwencja obrotów { $seq }

engine-e-adm-epoch-has-no = epoka { $s } nie zawiera 'T'

engine-e-adm-epoch-date = data epoki { $date }

engine-e-adm-epoch-time = czas epoki { $time }

## src/advanced_report.rs

engine-advanced-report-text-as-the-document-states = „{ $s }” (tekst tak, jak podaje go dokument)

engine-advanced-report-mean-5th-to-95th-percentile = średnia { $fmt_num } (percentyl 5. do 95.: { $fmt_num2 } do { $fmt_num3 })

engine-advanced-report-field-units-schema-units-entry = schemat jednostek pól: wpis units `{ $key }`

engine-advanced-report-field-units-schema-input-entry = schemat jednostek pól: wpis input `{ $key }`, dopasowany po nazwie pola

engine-advanced-report-rows-from-to = wiersze: { $nums }, od { $fmt_num } do { $fmt_num2 }

engine-advanced-report-phase-ended-by = faza { $name } (zakończona przez { $ended })

engine-advanced-report-result-timeline-phases = wynik `timeline.phases[{ $i }]`

engine-advanced-report-hand-off-into-phase = przekazanie do fazy { $phase }: { $h } → { $h2 } = { $h3 } { $h4 }

engine-advanced-report-result-timeline-handoffs = wynik `timeline.handoffs[{ $i }]`

engine-advanced-report-scenario-input = dane wejściowe scenariusza `{ $prefix }`

engine-advanced-report-scenario-file-comment-line = komentarz w pliku scenariusza, wiersz { $start }

engine-advanced-report-scenario-file-comment-lines-to = komentarz w pliku scenariusza, wiersze { $start } do { $v1 }

engine-advanced-report-is-modelled-not-validated = { $requirement }: MODELLED, niezwalidowane: { $it }.

engine-advanced-report-sweep-of-scale = Przemiatanie parametru { $param } (skala: { $str_of })

engine-e-advanced-report-the-result-document-is-not = dokument wyniku nie jest JSON: { $e }

engine-e-advanced-report-the-scenario-is-not-toml = scenariusz nie jest TOML: { $e }

engine-advanced-report-monte-carlo-distribution-of = Rozkład Monte Carlo: { $metric }

engine-advanced-report-recorded-at-build-time-from = zapisano podczas kompilacji ze zmiennej środowiskowej { $GIT_COMMIT_ENV }

engine-advanced-report-not-recorded-this-engine-was = nie zapisano: ten silnik został zbudowany bez zmiennej środowiskowej { $GIT_COMMIT_ENV }; wersja silnika identyfikuje wydanie

engine-advanced-report-the-kind-own-fingerprint-of = { $esc } (własny odcisk scenariusza dla tego rodzaju; nie jest to skrót pliku)

engine-advanced-report-input-file = Plik wejściowy { $path }

engine-advanced-report-study-generated = { " " }Badanie wygenerowano: { $esc }.

## src/altpnt/maps.rs

engine-e-altpnt-maps-emag2-line-expected-comma-separated = wiersz EMAG2 { $v1 }: oczekiwano 8 kolumn rozdzielonych przecinkami, znaleziono { $p }

engine-e-altpnt-maps-emag2-line-bad = wiersz EMAG2 { $v1 }: błędne { $what } `{ $p }`

engine-e-altpnt-maps-emag2-line-non-finite-value = wiersz EMAG2 { $v1 }: wartość nieskończona

engine-e-altpnt-maps-emag2-no-data-rows = EMAG2: brak wierszy danych

engine-e-altpnt-maps-emag2-rows-do-not-fill = EMAG2: wiersze ({ $rows }) nie wypełniają siatki { $n_lat } x { $n_lon }, którą obejmują

engine-e-altpnt-maps-emag2-duplicate-node-at = EMAG2: zduplikowany węzeł w { $lat }, { $lon }

engine-e-altpnt-maps-grid-step-must-be-finite = krok siatki musi być skończony i dodatni, otrzymano { $step }

engine-e-altpnt-maps-grid-box-must-have-north = obszar siatki musi mieć north > south i east > west, otrzymano [{ $south }, { $north }] x [{ $west }, { $east }]

engine-e-altpnt-maps-grid-of-nodes-is-too = siatka { $n_lat } x { $n_lon } węzłów jest zbyt duża

engine-e-altpnt-maps-emag2-the-axis-needs-at = EMAG2: oś { $what } wymaga co najmniej 2 różnych wartości

engine-e-altpnt-maps-emag2-the-axis-is-not = EMAG2: oś { $what } nie jest regularna ({ $w } do { $w2 } przy średnim kroku { $step })

engine-e-altpnt-maps-error-sigma-must-be-finite = sigma błędu musi być skończona i nieujemna, otrzymano { $sigma }

engine-e-altpnt-maps-correlation-length-must-be-finite = długość korelacji musi być skończona i dodatnia, otrzymano { $corr_len_deg }

## src/altpnt/terrain.rs

engine-e-altpnt-terrain-samples-per-side-must-be = samples_per_side musi być >= 2, otrzymano { $n }

engine-e-altpnt-terrain-srtm-hgt-length = długość SRTM .hgt { $bytes } != 2*{ $n }*{ $n } = { $v2 }

engine-e-altpnt-terrain-an-hgt-window-needs-at = okno .hgt wymaga co najmniej 2 x 2 próbek, otrzymano { $n_rows } x { $n_cols }

engine-e-altpnt-terrain-step-must-be-finite-and = krok musi być skończony i dodatni, otrzymano { $step_deg }

engine-e-altpnt-terrain-hgt-window-length = długość okna { "." }hgt { $bytes } != 2*{ $n_rows }*{ $n_cols } = { $v2 }

engine-e-altpnt-terrain-combined-altpnt-unknown-magnetic-grid = combined-altpnt: nieznana kolumna magnetic_grid `{ $other }` (użyj "sealevel" lub "upcont")

engine-e-altpnt-terrain-combined-altpnt-cannot-read-magnetic = combined-altpnt: nie można odczytać csv_path magnetic_grid { $csv_path }: { $e }

## src/animation.rs

engine-e-animation-unknown-animation-format-expected-svg = nieznany format animacji '{ $other }'; oczekiwano svg, html, frames lub all

engine-e-animation-no-animation-format-given-expected = nie podano formatu animacji; oczekiwano svg, html, frames lub all

engine-e-animation-animation-fps-must-be-between = fps animacji musi mieścić się między 1 a 60, otrzymano { $fps }

engine-e-animation-animation-duration-must-be-between = czas trwania animacji musi mieścić się między { $lit_0_5 } s a 600 s, otrzymano { $duration_s }

engine-e-animation-animation-width-must-be-between = szerokość animacji musi mieścić się między 480 a 3840 pikseli, otrzymano { $width }

engine-e-animation-result-is-not-json = wynik nie jest JSON: { $e }

engine-animation-mission-time = czas misji ({ $lay })

engine-animation-ffmpeg-framerate-frame-04d-svg = ffmpeg -framerate { $fps } -i frame_%04d.svg -pix_fmt yuv420p animation.mp4  (wymaga ffmpeg zbudowanego z librsvg; w przeciwnym razie najpierw zrasteryzuj klatki)

engine-animation-further-series-were-found-but = { " " }Dalsze serie znaleziono, ale nie narysowano: { $omitted } (odtwarzacz pokazuje najwyżej { $MAX_CHARTS } paneli po { $MAX_TRACES } przebiegów); są wymienione w manifeście eksportu frames.

## src/antenna.rs

engine-antenna-limb-capture-is-reached-on = przechwycenie limbu JEST osiągane na tej siatce (wysokość { $a_lo }-{ $a_hi } m x szerokość wiązki { $b_lo }-{ $b_hi } deg, punkty: { $points2 }): punkty pracy przechwytujące limb: { $points } z { $points2 } próbkowanych; zlokalizowane przecięcia osi: { $crossings }; najsilniejszy próbkowany J/S limbu wynosi { $limb_js_db } dB przy wysokości { $altitude_m } m / szerokości wiązki { $hpbw_deg } deg, względem progu przechwycenia { $thr } dB.

engine-antenna-limb-capture-is-not-reached = przechwycenie limbu NIE jest osiągane nigdzie na tej siatce (wysokość { $a_lo }-{ $a_hi } m x szerokość wiązki { $b_lo }-{ $b_hi } deg, punkty: { $points }) - nie zerowe przechwycenie, lecz brak przechwycenia limbu: najlepszy J/S limbu wynosi { $limb_js_db } dB przy wysokości { $altitude_m } m / szerokości wiązki { $hpbw_deg } deg, czyli { $shortfall } dB poniżej progu przechwycenia { $thr } dB; ten punkt pracy przechwyciłby limb przy mocy nadawania { $limb_capture_tx_power_dbw } dBW, względem { $p_tx_dbw } dBW zastosowanych w locie.

engine-e-antenna-azimuths-must-strictly-increase = azymuty muszą ściśle rosnąć

engine-e-antenna-azimuths-must-span-less-than = azymuty muszą obejmować mniej niż 360 deg

engine-e-antenna-off-boresight-angles-must-strictly = kąty od osi głównej muszą ściśle rosnąć

engine-e-antenna-gain-grid-does-not-match = siatka zysku nie odpowiada osiom

## src/aocs.rs

engine-e-aocs-gains-and-must-be-finite = wzmocnienia K i P muszą być skończone i dodatnie

engine-e-aocs-at-least-three-reaction-wheels = wymagane są co najmniej trzy koła reakcyjne

engine-e-aocs-wheel-spin-axis-must-be = koło { $i }: oś wirowania musi być wektorem jednostkowym

engine-e-aocs-wheel-js-and-max-must = koło { $i }: js i u_max muszą być skończone i dodatnie

engine-e-aocs-the-wheel-spin-axes-do = osie wirowania kół nie rozpinają trzech wymiarów

engine-e-aocs-inertia-minus-the-wheels-spin = bezwładność pomniejszona o bezwładność wirowania kół musi być dodatnio określona

engine-e-aocs-inertia-must-be-finite-and = bezwładność musi być skończona i symetryczna

## src/aocs_kind.rs

engine-e-aocs-kind-wheels-axis-must-be-non = wheels[{ $i }].axis musi być niezerowym skończonym wektorem

engine-e-aocs-kind-must-be-finite-and-positive = { $n } musi być skończone i dodatnie

engine-e-aocs-kind-duration-dt-must-be-at = duration_s / dt_s może dać co najwyżej 2e6 kroków

engine-e-aocs-kind-sample-must-be-whole-multiple = sample_s musi być całkowitą wielokrotnością dt_s

engine-e-aocs-kind-sigma0-and-omega0-rad-must = sigma0 i omega0_rad_s muszą być skończone

engine-e-aocs-kind-wheels-speed0-rpm-must-be = wheels[{ $i }].speed0_rpm musi być skończone

engine-e-aocs-kind-estimator-gyro-bias0-rad-must = estimator.gyro_bias0_rad_s musi być skończone

engine-e-aocs-kind-estimator-star-tracker-every-must = estimator.star_tracker_every_s musi wynosić co najmniej dt_s

## src/aperture_duty.rs

engine-e-aperture-duty-unknown-service-expected-navigation-nav = nieznana usługa '{ $other }' (oczekiwano navigation|nav lub communications|comms)

engine-e-aperture-duty-unknown-arbitration-policy-expected-navigation = nieznana polityka arbitrażu '{ $other }' (oczekiwano navigation-priority, communications-priority lub first-come-first-served)

engine-e-aperture-duty-contact-plan-needs-at-least = plan kontaktów wymaga co najmniej jednego okna kontaktu

engine-e-aperture-duty-apertures-must-be = apertures musi być >= 1

engine-e-aperture-duty-the-reporting-horizon-must-be = horyzont raportowania musi być skończony

engine-e-aperture-duty-contact-has-non-finite-aos = kontakt '{ $name }' ma nieskończone aos_s lub los_s

engine-e-aperture-duty-contact-must-have-los-aos = kontakt '{ $name }' musi mieć los_s > aos_s

engine-e-aperture-duty-contact-plan-needs-at-least-2 = plan kontaktów wymaga co najmniej jednego okna [[contacts]]

engine-aperture-duty-aperture-duty-cycle-session-on = aperture-duty-cycle: sesje: { $sessions } na aperturach: { $apertures } przy polityce { $policy } -> obciążenie nawigacją { $navigation_duty }, obciążenie łącznością { $communications_duty }, bezczynność { $idle_duty }; { $total_outage_s } s z { $total_requested_s } s zażądanych utracono wskutek rywalizacji o zasoby (MODELLED)

## src/api.rs

engine-api-study-generated = { " " }Badanie wygenerowano: { $html_escape }.

engine-e-api-failed-to-serialise-report-to = nie udało się zserializować raportu do JSON: { $e }

engine-e-api-invalid-scenario = nieprawidłowy scenariusz: { $e }

engine-e-api-clock-log = clock_log: { $e }

engine-api-required-fields = - **Pola wymagane:** { $fields }{ "\u000A" }

engine-api-optional-fields = - **Pola opcjonalne:** { $fields }{ "\u000A\u000A" }

engine-api-toml-parse-error = błąd analizy TOML: { $e }

engine-api-could-not-classify-scenario-kind = nie udało się sklasyfikować rodzaju scenariusza: { $e }

engine-api-missing-required-field = { $kind_name }: brak pól wymaganych — { $options }

engine-api-missing-required-field-2 = { $kind_name }: brak wymaganego pola "{ $entry }"

engine-e-api-invalid-orbit-scenario = nieprawidłowy scenariusz orbity: { $e }

engine-e-api-sp3-export-requires-an-orbit = eksport SP3 wymaga scenariusza orbity, a nie '{ $k }'

engine-e-api-omm-export-requires-an-orbit = eksport OMM wymaga scenariusza orbity, a nie '{ $k }'

engine-e-api-oem-export-requires-an-orbit = eksport OEM wymaga scenariusza orbity, a nie '{ $k }'

engine-e-api-invalid-scenario-toml = nieprawidłowy TOML scenariusza: { $e }

engine-e-api-could-not-re-serialise-scenario = nie udało się ponownie zserializować scenariusza: { $e }

engine-api-scenario-jamming-availability-under-jamming = scenariusz { $r } | zagłuszanie (jamming) { $v2 } | dostępność przy zagłuszaniu (jamming) { $availability_under_jamming } (nominalna { $availability_nominal }) | min. śledzenie { $min_tracking } | średni J/S { $v6 }

engine-e-api-the-result-document-already-carries = dokument wyniku już zawiera `{ $FIGURE_TIERS_KEY }`

engine-e-api-failed-to-serialise-figure-tiers = nie udało się zserializować figure_tiers: { $e }

## src/api/builtins.rs

engine-e-api-builtins-invalid-scenario = nieprawidłowy scenariusz { $label }: { $e }

engine-api-builtins-scenario-quantum-holdover-p95-classical = scenariusz { $r } | holdover kwantowy { $holdover_s }s p95 { $pos_p95_m }m | holdover klasyczny { $holdover_s2 }s p95 { $pos_p95_m2 }m

engine-api-builtins-scenario-spoof-vs-ns-spec = scenariusz { $r } | spoof { $scn } względem specyfikacji { $threshold_ns } ns (P_fa { $target_pfa }) | bezpieczeństwo kwantowe { $security_fom } (P_md { $analytic_pmd }, MC { $mc_pmd }) { $det } | bezpieczeństwo klasyczne { $security_fom2 } (P_md { $analytic_pmd2 }, MC { $mc_pmd2 }) { $det2 }

engine-api-builtins-lunar-integrity-south-pole-epochs = lunar-integrity | biegun południowy | dostępne epoki: { $samples_available }/{ $samples_total } ({ $report }%) | AL { $alert_limit_m } m | σ_URE { $sigma_ure_m } m | HPL { $min_hpl_m }–{ $max_hpl_m } m

engine-api-builtins-lunar-time-offset-secular-ltc = lunar-time-offset | wiekowa szybkość LTC−TT { $secular_rate_us_per_day } µs/day (pasmo { $band_low }–{ $band_high }) | potencjał własny { $self_potential_us_per_day } kinetyczny { $kinetic_us_per_day } | przesunięcie @ { $horizon_days } d = { $offset_at_horizon_us } µs

engine-api-builtins-lunar-vlbi-baseline-km-beacon = lunar-vlbi | baza { $baseline_km } km | odległość do radiolatarni { $beacon_range_km } km | opóźnienie { $report } µs (tempo { $delay_rate_s_per_s } s/s) | pole bliskie { $near_field_correction_us } µs | próbki: { $samples } w czasie { $horizon_hours } h

engine-api-builtins-ephemeris-ure-required-vs-keplerian = { " " }| efemerydy { $report } ({ $provenance }) wymagane σ_URE { $fmt } względem keplerowskich { $fmt2 } względem zaburzonych { $fmt3 } (Δ { $fmt4 })

engine-api-builtins-lunar-station-coverage-points-epochs = lunar-station-coverage | punkty: { $n_grid_points } x epoki: { $n_epochs } x próby: { $n_trials } | dostępność { $v4 } % | pokrycie { $v5 } % (p{ $percentile } <= { $accuracy_threshold_m } m) | skorygowane p{ $percentile } 3-D { $f } (nieskorygowane { $f2 }) | HPL maks. { $f3 } | MODELLED; nie jest to twierdzenie o żadnym rzeczywistym systemie

engine-api-builtins-terrain-horizon-at-the-station = { " " }| horyzont terenu ({ $sources }) przy stacji maks. { $horizon_max_deg } deg, punkty użytkownika: średnie maks. { $user_horizon_max_deg_mean } deg

## src/api/builtins.rs

engine-api-builtins-scenario-optical-sync-rms-ps = scenariusz { $r } | optyczny sync_rms { $sync_rms_ps }ps range_rms { $range_rms_mm }mm adev(1s) { $adev_tau0 } | RF sync_rms { $sync_rms_ps2 }ps range_rms { $range_rms_mm2 }mm adev(1s) { $adev_tau02 }

engine-api-builtins-quantum-time-transfer-quantum-chain = quantum-time-transfer | łańcuch kwantowy { $quantum_chain_sigma_s }s a klasyczny { $classical_chain_sigma_s }s | PL { $protection_level_ns } ns | bezpieczeństwo Pd { $security_pd } (Pfa { $monitor_pfa }) | anomalia Pd { $anomaly_pd } | bilans: wygrane kwantowego { $r }/{ $foms } | MODELLED

engine-api-builtins-quantum-gnss-free-nav-outage = quantum-gnss-free-nav | przerwa { $outage_s }s | błąd pozycji kwantowy { $quantum_pos_err_m } m a klasyczny { $classical_pos_err_m } m ({ $improvement_x }x) | holdover kwantowy { $quantum_holdover_s }s a klasyczny { $classical_holdover_s }s (próg { $threshold_m } m) | bilans: wygrane kwantowego { $r }/{ $foms } | MODELLED

engine-api-builtins-quantum-anomaly-detect-auc-quantum = quantum-anomaly-detect | AUC kwantowy { $quantum_auc } a klasyczny { $classical_auc } | minimalny wykrywalny uszkodzenie kwantowy { $quantum_min_detectable } a klasyczny { $classical_min_detectable } | klasy uszkodzeń: { $fault_catalog } | bilans: wygrane kwantowego { $r }/{ $foms } | MODELLED

engine-e-api-builtins-coupled-applies-to-the-fusion = { "[" }coupled] dotyczy wyłącznie rodzaju fusion

engine-api-builtins-scenario-quantum-pnt-holdover-integrity = scenariusz { $r } | kwantowy PNT-holdover { $pnt_holdover_s }s (t { $timing_holdover_s }s/p { $position_holdover_s }s) integralność { $integ } bezpieczeństwo { $security_na } | klasyczny PNT-holdover { $pnt_holdover_s2 }s (t { $timing_holdover_s2 }s/p { $position_holdover_s2 }s) integralność { $integ2 } bezpieczeństwo { $security_na }

engine-api-builtins-scenario-fused-quantum-pnt-holdover = scenariusz { $r } | fused | kwantowy PNT-holdover { $pnt_holdover_s }s (t { $timing_holdover_s }s/p { $position_holdover_s }s) integralność { $integ } bezpieczeństwo { $security_na } | klasyczny PNT-holdover { $pnt_holdover_s2 }s (t { $timing_holdover_s2 }s/p { $position_holdover_s2 }s) integralność { $integ2 } bezpieczeństwo { $security_na }

engine-api-builtins-scenario-hybrid-ukf-17-state = scenariusz { $r } | hybrid-ukf (17 stanów, MODELLED) | czujnik { $v2 } (q_va { $effective_q_va }) | zegar q_wf { $clock_q_wf } q_rw { $clock_q_rw } | NIS { $nis_mean }/{ $nis_dof } w [{ $nis_chi2_lower_95 },{ $nis_chi2_upper_95 }] | NEES { $nees_mean }/{ $nees_dof } w [{ $nees_chi2_lower_95 },{ $nees_chi2_upper_95 }] | { $v14 } | wspomagany { $aided_pos_rms_m }m -> dryf { $coast_end_pos_rms_m }m przez { $coast_duration_s }s | spójność wewnętrzna, nie dokładność

engine-api-builtins-scenario-gnss-ins-quantum-outage = scenariusz { $r } | gnss-ins | kwantowy RMS w przerwie: fuzja { $fused_outage_rms_m }m a swobodny { $free_outage_rms_m }m (holdover { $holdover_s }s, dostępność { $availability }) | klasyczny: fuzja { $fused_outage_rms_m2 }m a swobodny { $free_outage_rms_m2 }m (holdover { $holdover_s2 }s, dostępność { $availability2 })

engine-api-builtins-scenario-gnss-sim-mean-iono = scenariusz { $r } | gnss-sim | średnia jonosfera { $mean_iono_m }m troposfera { $mean_tropo_m }m | RAIM dostępność { $raim_availability } średni HPL { $mean_hpl_m }m VPL { $mean_vpl_m }m częstość uszkodzeń { $fault_rate }

engine-api-builtins-scenario-spoof-detect-svs-db = scenariusz { $r } | spoof-detect | liczba SV: { $n_sats }, +{ $power_advantage_db } dB{ $v4 } | { $push } przesunięcia | wynik fuzji { $score } (próg { $fusion_threshold }) | { $verdict }

engine-api-builtins-sweep-over-pts-scale-quantum = przemiatanie { $metric } po { $parameter } ({ $first }..{ $last }, punktów: { $points }, skala: { $scale }) | kwantowy { $first2 }->{ $last2 } | klasyczny { $first3 }->{ $last3 }

engine-api-builtins-scenario-samples-gnss-nominal-best = scenariusz { $r } | próbki GNSS-nominalne: { $nominal }/{ $series } | najlepszy PDOP { $fnum } poz. { $posm } | kwantowy holdover { $holdover_s }s p95 { $ns1 }ns integralność { $integ } bezpieczeństwo { $security_na } | klasyczny holdover { $holdover_s2 }s p95 { $ns12 }ns integralność { $integ2 } bezpieczeństwo { $security_na }

engine-e-api-builtins-ephemeris = efemerydy: { $e }

engine-api-builtins-max-el-peak-doppler-khz = { " " }| maks. elewacja { $el }° szczytowy Doppler { $v1 } kHz

engine-api-builtins-generic-sweep-of-over-nodes = ogólne przemiatanie `{ $kind }` po [{ $keys }] | węzłów: { $points } (kształt { $shape }) | metryki [{ $metrics }]

engine-api-builtins-gravity-map-free-inertial-drift = gravity-map | dryf swobodny inercyjny { $free_inertial_drift_m } m | dopasowanie do grawitacji { $map_matched_error_m } m | sigma dopasowania { $measurement_sigma_mgal } mGal

engine-api-builtins-reference-degree-anomaly-std-mgal = { " " }| stopień odniesienia { $reference_nmax } odchylenie standardowe anomalii { $reference_anomaly_std_mgal } mGal

engine-api-builtins-map-error-mc-p95-within = { " " }| błąd mapy MC x{ $realisations } p95 { $matched_error_p95_m } m, { $v3 }% w granicach { $target_m } m

engine-api-builtins-terrain-nav-free-inertial-drift = terrain-nav | dryf swobodny inercyjny { $free_inertial_drift_m } m | dopasowanie do terenu { $matched_error_m } m (redukcja { $v3 }x) | sigma dopasowania { $measurement_sigma_m } m

engine-api-builtins-terrain-slam-waypoints-free-inertial = terrain-slam | punktów trasy: { $waypoints } | swobodny inercyjny RMS { $free_inertial_rms_m } m (końcowy { $free_inertial_final_m } m) | dopasowany do terenu RMS { $matched_rms_m } m (końcowy { $matched_final_m } m, redukcja { $v6 }x) | średni ESS { $mean_ess }/{ $cfg } | sigma dopasowania { $measurement_sigma_m } m

engine-api-builtins-combined-altpnt-free-inertial-drift = combined-altpnt | dryf swobodny inercyjny { $free_inertial_drift_m } m | grawitacja { $gravity_only_m } m magnetyzm { $magnetic_only_m } m teren { $terrain_only_m } m | FUSED { $combined_m } m

engine-e-api-builtins-clock-log-needs-runs-measured = { "[" }clock_log] wymaga runs = 1: zmierzony dziennik to jeden rekord

engine-api-builtins-scenario-runs-quantum-holdover-p95 = scenariusz { $r } | przebiegów: { $runs } | kwantowy holdover { $mean }s [{ $p05 }-{ $p95 }] p95 { $ns1 }ns bezpieczeństwo { $security_na } | klasyczny holdover { $mean2 }s [{ $p052 }-{ $p952 }] p95 { $ns12 }ns bezpieczeństwo { $security_na }

engine-api-builtins-scenario-quantum-holdover-p95-ns = scenariusz { $r } | kwantowy holdover { $holdover_s }s p95 { $ns1 }ns integralność { $integ } bezpieczeństwo { $security_na } | klasyczny holdover { $holdover_s2 }s p95 { $ns12 }ns integralność { $integ2 } bezpieczeństwo { $security_na }

## src/araim_reference.rs

engine-e-araim-reference-reference-case-needs-at-least = przypadek odniesienia wymaga co najmniej jednego satelity

engine-e-araim-reference-reference-case-needs-at-least-2 = przypadek odniesienia wymaga co najmniej jednej konstelacji

engine-e-araim-reference-satellite-names-constellation-but-only = satelita { $i } wskazuje konstelację { $constellation }, ale zadeklarowano tylko: { $constellations }

engine-e-araim-reference-satellite-has-non-positive-error = satelita { $i } ma niedodatnią wariancję błędu

engine-e-araim-reference-both-integrity-risk-allocations-must = obie alokacje ryzyka integralności muszą być dodatnie

engine-e-araim-reference-this-reference-implementation-monitors-single = ta implementacja referencyjna monitoruje wyłącznie tryby uszkodzeń pojedynczych zdarzeń, ale prawdopodobieństwa a priori dla tego przypadku wymagają N_fault,max = { $nfm } (jednoczesne podzbiory wielu zdarzeń). Odmowa zamiast zaniżenia liczby trybów uszkodzeń.

engine-e-araim-reference-the-all-in-view-geometry = geometria all-in-view jest osobliwa

engine-e-araim-reference-no-fault-mode-is-observable = żaden tryb uszkodzenia nie jest obserwowalny w tej geometrii

engine-e-araim-reference-unknown-reference-vector-known-vectors = nieznany wektor odniesienia '{ $vector }'; znane wektory: { $ids } (lub 'all')

engine-araim-reference-araim-reference-check-published-wg = araim-reference-check: opublikowane wektory odniesienia WG-C: { $wanted }; najgorsza zgodność VPL/HPL { $worst_acceptance } m względem własnego TOL_PL odniesienia = { $tol } m dla wektorów akceptacyjnych: { $acceptance_checked }

engine-e-araim-reference-sat-needs-one-value-per = P_sat wymaga jednej wartości na satelitę, a P_const jednej na konstelację

engine-e-araim-reference-satellite-names-an-undeclared-constellation = satelita wskazuje niezadeklarowaną konstelację

engine-e-araim-reference-every-prior-must-lie-in = każde prawdopodobieństwo a priori musi leżeć w [0, 1)

engine-e-araim-reference-the-all-in-view-solution = nie wybrano rozwiązania all-in-view

engine-e-araim-reference-an-add-v4-case-needs = przypadek ADD v4.2 wymaga satelitów i konstelacji

engine-e-araim-reference-nom-and-sat-need-one = b_nom i P_sat wymagają jednej wartości na satelitę

engine-e-araim-reference-const-needs-one-value-per = P_const wymaga jednej wartości na konstelację

engine-e-araim-reference-satellite-names-an-undeclared-constellation-2 = satelita { $i } wskazuje niezadeklarowaną konstelację

engine-e-araim-reference-one-constellation-index-per-satellite = jeden indeks konstelacji na satelitę

engine-e-araim-reference-satellite-names-constellation-with-no = satelita { $i } wskazuje konstelację { $c } bez ISM

engine-e-araim-reference-fewer-than-four-satellites-above = mniej niż cztery satelity powyżej maski

## src/attack_surface.rs

engine-e-attack-surface-standoffs-must-contain-at-least = standoffs_m musi zawierać co najmniej jedną odległość

engine-attack-surface-lunar-attack-surface-afs-dbw = lunar-attack-surface | AFS { $afs_received_dbw } dBW, { $sense } { $a } dB (pasmo { $deficit_band_lo_db }–{ $deficit_band_hi_db }, { $shown_rounded }×/{ $shown_unrounded }× { $sense }) | spoof@{ $value } m { $nearest } W | ślad { $a2 }% pokrycia, limb { $footprint_limb_captured } | przechwycenie spoofingu { $spoof_captured } (blokada { $spoof_lock_time_s } s) | zasięg masztu { $a3 } km | OSNMA { $nma_overhead_bps } bit/s ({ $a4 }% z 50 bit/s), opóźnienie uwierzytelnienia { $nma_auth_latency_s } s

engine-attack-surface-reached-crossing-best-db = osiągnięto (przekroczeń: { $crossings }, najlepszy { $best_limb_js_db } dB)

engine-attack-surface-not-reached-on-this-grid = NIE osiągnięto na tej siatce (najlepszy { $best_limb_js_db } dB, brakuje { $best_limb_shortfall_db } dB; wymagane { $best_limb_capture_tx_power_dbw } dBW wobec { $p_tx_dbw } dBW)

engine-attack-surface-footprint-sweep-alt-km-hpbw = { " " }| przemiatanie śladu { $s }x{ $s2 } (wysokość { $v3 }-{ $v4 } km x HPBW { $bw_lo }-{ $bw_hi } deg), przechwycenie { $v5 }-{ $v6 }% | limb { $limb }

engine-attack-surface-afs-received-dbw = AFS odebrany: { $afs_received_dbw } dBW

engine-attack-surface-deficit-db-band-db = Deficyt: { $deficit_db } dB (pasmo { $deficit_band_lo_db }-{ $deficit_band_hi_db } dB, { $deficit_factor_rounded }x/{ $deficit_factor_unrounded }x)

engine-attack-surface-capture-footprint-of-disk-limb = Ślad przechwycenia: { $a }% tarczy, limb przechwycony: { $footprint_limb_captured }

engine-attack-surface-spoof-capture-pull-in-lock = Przechwycenie spoofingu (pull-in): { $spoof_captured } (blokada { $spoof_lock_time_s } s)

engine-attack-surface-mast-reach-km-osnma-bit = Zasięg masztu: { $a } km | OSNMA { $nma_overhead_bps } bit/s ({ $a2 }%)

engine-attack-surface-limb-captured-on-grid-crossing = Limb: przechwycony na siatce { $na }x{ $nb }, przekroczeń: { $crossings }

engine-attack-surface-limb-not-captured-on-grid = Limb: nieprzechwycony na siatce { $na }x{ $nb }; wymagane { $best_limb_capture_tx_power_dbw } dBW (zastosowano { $p_tx_dbw })

## src/attitude_budget.rs

engine-e-attitude-budget-altitude-km-must-be-finite = altitude_km musi być skończone i dodatnie

engine-e-attitude-budget-inertias-must-be-finite-and = momenty bezwładności muszą być skończone i dodatnie

engine-e-attitude-budget-max-kg-m2-must-be = i_max_kg_m2 musi być >= i_min_kg_m2

engine-e-attitude-budget-at-least-one-pointing-contributor = wymagany jest co najmniej jeden składnik celowania

engine-e-attitude-budget-contributor-sigma-must-be-finite = sigma składnika '{ $name }' musi być skończona i >= 0

engine-attitude-budget-attitude-budget-km-kg-gg = attitude-budget: { $altitude_km } km, ΔI { $delta_i } kg·m² -> moment GG { $t_gg } N·m; celowanie { $total }" RSS (dominujący: { $dominant }) (MODELLED, budżet skalarny)

## src/bench/cli.rs

engine-bench-cli-needs-value = { $name } wymaga wartości

engine-bench-cli-unknown-option = nieznana opcja `{ $a }`

engine-bench-cli-unexpected-argument = nieoczekiwany argument `{ $pos }`

engine-bench-cli-cannot-read = nie można odczytać { $p }: { $e }

engine-bench-cli-cannot-create = nie można utworzyć { $d }: { $e }

engine-bench-cli-cannot-write = nie można zapisać { $p }: { $e }

engine-bench-cli-unknown-task-or = nieznane zadanie `{ $t }` (a, b, c lub d)

engine-bench-cli-scored-epochs-in-folder = ocenione epoki: { $labels }, foldery: { $folders }

engine-bench-cli-wrote-cases-json-and-truth = zapisano { $out }/cases.json i { $out }/truth.json

engine-bench-cli-refused-this-commitment-is-provisional = REFUSED: to zobowiązanie jest tymczasowe, a jego ziarno (seed) zostało ujawnione; nie jest to zbiór holdout wydania

engine-bench-cli-mismatch-the-seed-is-not = MISMATCH: to ziarno (seed) nie jest tym, które stoi za tym zobowiązaniem

engine-bench-cli-is-not-json = { $f } nie jest plikiem JSON: { $e }

engine-bench-cli-cannot-read-2 = nie można odczytać { $i }: { $e }

engine-bench-cli-result-rendered = wyrenderowano wyniki: { $results }

engine-bench-cli-unknown-subcommand =
    nieznane podpolecenie `{ $other }`
    { $BENCH_USAGE }

engine-bench-cli-cannot-create-an-existing-seed = nie można utworzyć { $path } (istniejący plik ziarna (seed) nigdy nie jest nadpisywany): { $e }

engine-bench-cli-cannot-write-2 = nie można zapisać { $path }: { $e }

engine-bench-cli-seed-written-to-keep-it = ziarno (seed) zapisano w { $path }: nie umieszczaj go w kontroli wersji ani w żadnej wiadomości; publiczny jest tylko poniższy skrót

engine-bench-cli-test-kshana-iq-cn0-drop = b-test-kshana-iq-cn0-drop (przeniesiony, nie uruchomiono ponownie)

engine-bench-cli-impairment-eval-baseline = punkt odniesienia impairment-eval: { $det }

engine-bench-cli-no-scenario-json-under = brak scenario.json w { $root }

engine-bench-cli-is-not-json-2 = { $path } nie jest plikiem JSON: { $e }

engine-bench-cli-ok-mismatched-missing-unpinned = zgodnych: { $ok }, niezgodnych: { $bad }, brakujących: { $missing }, bez przypięcia: { $unpinned }

## src/bench/mod.rs

engine-bench-unknown-split-dev-test-or = nieznany podział `{ $other }` (dev, test lub holdout)

engine-bench-score-for-is-not-finite = wynik dla `{ $id }` nie jest skończony

engine-bench-case-have-no-score-the = przypadki bez wyniku: { $missing }, pierwszy to `{ $first_missing }`

engine-bench-predictions-name-case-that-is = predykcje wskazują przypadek, którego nie ma w danych prawdy: `{ $extra }`

engine-bench-schema-must-be = `schema` musi mieć wartość `{ $RESULT_SCHEMA }`

engine-bench-must-be-64-digit-hex = `{ $k }` musi być 64-cyfrowym skrótem SHA-256 w zapisie szesnastkowym

engine-bench-truth-is-not-json = dane prawdy nie są plikiem JSON: { $e }

engine-bench-predictions-are-not-json = predykcje nie są plikiem JSON: { $e }

engine-bench-truth-schema-must-be = `schema` danych prawdy musi mieć wartość `{ $TRUTH_SCHEMA }`

engine-bench-predictions-schema-must-be = `schema` predykcji musi mieć wartość `{ $PREDICTIONS_SCHEMA }`

engine-bench-truth-was-made-under-another = dane prawdy utworzono w innej wersji specyfikacji niż { $SPEC_VERSION }; wyniki z różnych wersji głównych nigdy nie są mieszane

engine-bench-unknown-task = nieznane zadanie `{ $other }`

## src/bench/site.rs

engine-bench-site-result-is-not-valid = wynik { $v1 } jest nieprawidłowy: { $p }

engine-bench-site-result-is-task-holdout-result = wynik { $v1 } jest wynikiem holdout zadania (d) bez `holdout_commitment`

engine-bench-site-result-is-scored-on-provisional = wynik { $v1 } oceniono na tymczasowym, ujawnionym ziarnie (seed) holdout: nie jest to holdout wydania

engine-bench-site-result-was-scored-under-this = wynik { $v1 } oceniono w wersji { $v }; ta strona dotyczy wersji { $SPEC_VERSION }

## src/bench/tasks.rs

engine-bench-tasks-score-for-is-not-number = wynik dla `{ $k }` nie jest liczbą

engine-bench-tasks-kshana-receiver-trust-35-default = kshana receiver-trust { $s } (domyślna statystyka monitora { $lit_0_35 })

engine-bench-tasks-malformed-clock-line = nieprawidłowy wiersz zegara `{ $line }`

engine-bench-tasks-the-clock-file-does-not = plik zegara nie odpowiada przypiętemu SHA-256 (otrzymano { $got }, oczekiwano { $C_CLOCKS_SHA256 })

engine-bench-tasks-satellite-is-not-in-the = satelity { $prn } nie ma w pliku zegara

engine-bench-tasks-kshana-bench-baseline = punkt odniesienia kshana-bench: { $baseline }

engine-bench-tasks-predictions-cover-cases-the-truth = predykcje obejmują przypadki: { $pmap }, dane prawdy zawierają: { $tarr }

engine-bench-tasks-case-has-no-number-array = przypadek `{ $id }` nie ma tablicy liczb

engine-bench-tasks-case-needs-values-has = przypadek `{ $id }` wymaga wartości: { $n }, ma: { $a }

engine-bench-tasks-case-has-non-finite-value = przypadek `{ $id }` ma wartość nieskończoną

## src/bin/crossover_study.rs

engine-e-bin-crossover-study-serialize = serializacja { $name }: { $e }

engine-e-bin-crossover-study-write = zapis { $path }: { $e }

engine-bin-crossover-study-error-cannot-create = błąd: nie można utworzyć { $dir }: { $e }

engine-bin-crossover-study-done-inertial-nodes-clock-curves = gotowe: węzły inercyjne: { $nodes }, krzywe zegara: { $curves } (seed 42)

## src/bin/gen_araim_m3_study.rs

## src/bin/gen_validation_artifacts.rs

engine-bin-gen-validation-artifacts-wrote-docs-interop-md-export = zapisano docs/INTEROP.md (tabela eksportu)

## src/bin/validation_report.rs

engine-bin-validation-report-wrote-validation-summary-to = zapisano podsumowanie walidacji w { $path }

## src/body_pnt.rs

engine-e-body-pnt-unknown-body = nieznane ciało '{ $body_name }'

engine-e-body-pnt-body-pnt-navigates-around-body = body-pnt nawiguje wokół ciała innego niż Ziemia z łączem do Ziemi; { $name } nie jest tu obsługiwane

engine-e-body-pnt-duration-and-step-must-be = duration_s i step_s muszą być dodatnie, z co najwyżej 20000 epok; otrzymano { $duration } i { $step }

engine-e-body-pnt-user-kind-must-be-orbiter = user.kind musi mieć wartość orbiter lub surface; otrzymano '{ $k }'

engine-e-body-pnt-user-altitude-must-be-positive = wysokość użytkownika musi być dodatnia, a mimośród w [0, { $lit_0_9 })

engine-e-body-pnt-the-user-orbit-periapsis-is = perycentrum orbity użytkownika leży poniżej powierzchni

engine-e-body-pnt-constellation-needs-to-200-satellites = konstelacja wymaga od 1 do 200 satelitów w co najmniej jednej płaszczyźnie

engine-e-body-pnt-constellation-altitude-must-be-positive = wysokość konstelacji musi być dodatnia

engine-e-body-pnt-range-sigmas-must-be-positive = sigmy odległości muszą być dodatnie

engine-e-body-pnt-no-earth-position-relative-to = brak położenia Ziemi względem { $name } dla JD { $jd }

engine-e-body-pnt-serialising-report = serializacja raportu: { $e }

engine-e-body-pnt-the-report-must-serialise-to = raport musi się serializować do obiektu JSON

engine-body-pnt-positioning-around = Pozycjonowanie wokół: { $name }

## src/calibration_ensembles.rs

engine-e-calibration-ensembles-e1-scenario-is-not-table = scenariusz E1 nie jest tabelą

engine-e-calibration-ensembles-e1-scenario-has-no-monte = scenariusz E1 nie ma [monte_carlo]

engine-e-calibration-ensembles-e1-final-error-missing = E1: brak final_error.{ $k }

engine-calibration-ensembles-e1-is-scenarios-campaign-monte = { "\u000A" }E1 to `scenarios/campaign-monte-carlo-clock-holdover.toml`, 200 zespołów po 200 realizacji, względem postaci zamkniętej: średnia 0, sigma = { $sigma } ns. Zespół j używa ziarna bazowego 1 000 000 + 1000 j i ziarna bootstrap 20260928 + j. Największy względny błąd ADEV wyniósł { $max } dla E2 i { $max2 } dla E3 (dla 1, 10 i 100 s).{ "\u000A" }

## src/campaign.rs

engine-e-campaign-empty-result-path = pusta ścieżka wyniku

engine-e-campaign-result-path-has-an-empty = ścieżka wyniku `{ $path }` ma pusty segment

engine-e-campaign-result-path-bad-index-in = ścieżka wyniku `{ $path }`: nieprawidłowy indeks w `{ $part }`

engine-e-campaign-result-path-no-field = ścieżka wyniku `{ $path }`: brak pola `{ $name }`

engine-e-campaign-result-path-indexed-value-is = ścieżka wyniku `{ $path }`: wartość indeksowana nie jest tablicą

engine-e-campaign-result-path-index-out-of = ścieżka wyniku `{ $path }`: indeks { $i } poza zakresem ({ $n })

engine-e-campaign-result-path-value-is-not = ścieżka wyniku `{ $path }`: wartość nie jest liczbą ani flagą

engine-e-campaign-result-path-is-not-an = ścieżka wyniku `{ $path }`: `{ $k }` nie jest tablicą

engine-e-campaign-result-path-must-name-one = ścieżka wyniku `{ $path }` musi wskazywać jedną wartość, a nie wiersze

engine-e-campaign-result-path-is-not-an-2 = ścieżka wyniku `{ $path }`: `{ $name }` nie jest tablicą

engine-e-campaign-metric-path-has-no-entry = ścieżka metryki `{ $path }` nie ma wpisu w bloku units tego rodzaju; zadeklaruj jej `unit` w kampanii

engine-e-campaign-must-be-non-empty-letters = { $what } `{ $name }` musi składać się z niepustego ciągu liter, cyfr, `_` lub `-`

engine-e-campaign-campaign-cannot-contain-campaign = { $label }: kampania nie może zawierać kampanii

engine-e-campaign-serialise = { $label }: serializacja: { $e }

engine-e-campaign-result-did-not-parse = { $label }: nie udało się przetworzyć wyniku: { $e }

engine-e-campaign-seed-key-no-field-in = klucz ziarna (seed) `{ $key }`: brak pola `{ $part }` w scenariuszu

engine-e-campaign-seed-key-is-not-non = klucz ziarna (seed) `{ $key }` nie jest nieujemną liczbą całkowitą

engine-e-campaign-seed-does-not-fit-toml = ziarno (seed) { $seed } nie mieści się w liczbie całkowitej TOML

engine-campaign-time-path-must-name-rows = ścieżka czasu `{ $t }` musi wskazywać wiersze przez `[]`

engine-campaign-compare-is-not-below-above = compare `{ $c }` nie ma wartości below, above ani abs_above

engine-campaign-threshold-is-null = próg `{ $p }` ma wartość null

engine-campaign-reduce-is-not-mean-min = reduce `{ $r }` nie ma wartości mean, min, max ani count

engine-campaign-time-path-gives-several-values = ścieżka czasu `{ $t }` daje kilka wartości na wiersz

engine-campaign-value-path-has-fewer-rows = ścieżka wartości `{ $y }` ma mniej wierszy niż `{ $t }`

engine-campaign-value-path-has-rows-time = ścieżka wartości `{ $y }` ma wierszy: { $r }, ścieżka czasu `{ $t }` ma: { $t_rows }

engine-e-campaign-campaign-with-phases-needs-timeline = kampania z fazami wymaga [timeline] z step_s

engine-e-campaign-timeline-step-must-be-positive = timeline.step_s musi być dodatnie, otrzymano { $step }

engine-e-campaign-phase-is-named-twice = faza `{ $name }` jest nazwana dwukrotnie

engine-e-campaign-phase-duration-must-be-non = faza `{ $name }`: duration_s musi być nieujemne

engine-e-campaign-phase-has-no-runs = faza `{ $name }` nie ma przebiegów

engine-e-campaign-phase-the-first-phase-has = faza `{ $name }`: pierwsza faza nie ma z czego przejmować

engine-e-campaign-phase-handoff-from-channel-which = faza `{ $name }`: przekazanie z kanału `{ $ch }`, którym poprzednia faza nie zakończyła

engine-e-campaign-phase-handoff-from-run-does = faza `{ $name }`: przekazanie from_run { $from_run } nie istnieje

engine-e-campaign-phase-handoff-is-null = faza `{ $name }`: przekazanie `{ $from }` ma wartość null

engine-e-campaign-phase-handoff-run-does-not = faza `{ $name }`: przebieg przekazania { $run } nie istnieje

engine-e-campaign-phase = faza `{ $name }`: { $e }

engine-campaign-phase-run = faza { $name }/przebieg { $ri }

engine-e-campaign-phase-end-at-run-does = faza `{ $name }`: end_at_run { $end_at_run } nie istnieje

engine-campaign-duration-end-at-is-later = duration_s (end_at { $p } = { $x } s jest późniejsze)

engine-campaign-duration-end-at-is-null = duration_s (end_at { $p } ma wartość null)

engine-e-campaign-phase-side-is-not-classical = faza `{ $name }`: strona `{ $side }` nie jest classical ani quantum

engine-e-campaign-phase-skip-must-be-non = faza `{ $name }`: skip_s musi być nieujemne

engine-e-campaign-phase-alarm-compare-is-not = faza `{ $name }`: alarm compare `{ $compare }` nie ma wartości below, above ani abs_above

engine-e-campaign-phase-alarm-threshold-is-null = faza `{ $name }`: próg alarmu `{ $p }` ma wartość null

engine-e-campaign-phase-channel-is-in-not = faza `{ $name }`: kanał `{ $channel }` jest w { $u }, a nie w { $du }

## src/campaign.rs

engine-e-campaign-phase-channel-needs-unit = faza `{ $name }`: kanał `{ $channel }` wymaga jednostki

engine-e-campaign-phase-two-runs-both-provide = faza `{ $name }`: dwa przebiegi dostarczają ten sam kanał `{ $channel }`

engine-e-campaign-phase-carries-which-the-previous = faza `{ $name }` przenosi `{ $ch }`, którym poprzednia faza nie zakończyła

engine-e-campaign-phase-carries-but-no-run = faza `{ $name }` przenosi `{ $ch }`, ale żaden jej przebieg nie dostarcza `{ $ch }`

engine-e-campaign-channel-is-in-in-one = kanał `{ $name }` jest w { $unit } w jednej fazie i w { $unit2 } w innej

engine-e-campaign-at-least-one-metric-is = potrzebna jest co najmniej jedna metryka

engine-e-campaign-metric-is-named-twice = metryka `{ $name }` jest nazwana dwukrotnie

engine-e-campaign-seed-overflow-in-the-ensemble = przepełnienie ziarna (seed) w zespole

engine-e-campaign-an-ensemble-needs-at-least = zespół wymaga co najmniej jednego przebiegu

engine-e-campaign-sweep-takes-one-to-three = przemiatanie przyjmuje od jednej do trzech osi, otrzymano { $axes }

engine-e-campaign-axis-is-named-twice = oś `{ $name }` jest nazwana dwukrotnie

engine-e-campaign-axis-needs-at-least-two = oś `{ $name }` wymaga co najmniej dwóch kroków

engine-e-campaign-axis-scale-must-be-lin = oś `{ $name }`: scale musi mieć wartość lin lub log

engine-e-campaign-axis-log-axis-needs-positive = oś `{ $name }`: oś log wymaga dodatnich końców

engine-campaign-sweep-node = węzeł przemiatania { $flat }

engine-e-campaign-monte-carlo-runs-must-be = monte_carlo.runs musi wynosić co najmniej dwa

engine-e-campaign-compose-needs-at-least-one = compose wymaga co najmniej jednego członu

engine-e-campaign-shared-value-must-be-number = wartość wspólna `{ $name }` musi być liczbą lub liczbami

engine-e-campaign-shared-value-is-named-twice = wartość wspólna `{ $name }` jest nazwana dwukrotnie

engine-e-campaign-member-binds-unknown-shared = człon `{ $label }` wiąże nieznaną wartość wspólną `{ $name }`

engine-e-campaign-member = człon `{ $label }`: { $e }

engine-e-campaign-metric-is-in-for-one = metryka `{ $name }` jest w { $u } dla jednego członu i w { $unit } dla `{ $label }`

engine-e-campaign-member-is-named-twice = człon `{ $label }` jest nazwany dwukrotnie

engine-e-campaign-invalid-campaign-scenario = nieprawidłowy scenariusz kampanii: { $e }

engine-e-campaign-invalid-campaign = nieprawidłowa kampania: { $e }

engine-e-campaign-sweep = przemiatanie: { $e }

engine-e-campaign-monte-carlo = monte_carlo: { $e }

engine-e-campaign-compose = compose: { $e }

engine-e-campaign-optimize = optimize: { $e }

engine-campaign-of-across-the-realisations = { $d } z { $what } w realizacjach

engine-campaign-value-of-at-the-end = wartość { $ch } na końcu poprzedniej fazy, dodana do { $ch } tej fazy

engine-campaign-on-the-timeline-grid-the = { $label } na siatce osi czasu: ostatnia próbka przebiegu fazy będącej właścicielem, w chwili siatki lub wcześniej (podtrzymanie zerowego rzędu); null tam, gdzie żaden przebieg tej fazy jej nie dostarcza

engine-campaign-values-of-the-scenario-key = wartości klucza scenariusza { $key } wzdłuż osi { $name }

engine-campaign-value-of-the-scenario-key = wartość klucza scenariusza { $key } w tym węźle

engine-campaign-of-the-node-result = { $path } wyniku węzła

engine-campaign-of-each-realisation-in-seed = { $path } każdej realizacji, w kolejności ziaren (seed)

engine-campaign-shared-value-written-into-every = wartość wspólna { $name }, zapisana w każdym członie, który ją wiąże

engine-campaign-metric-read-from-the-member = metryka { $name } odczytana z wyniku członu

engine-campaign-smallest-across-the-members = najmniejsza { $name } wśród członów

engine-campaign-largest-across-the-members = największa { $name } wśród członów

engine-campaign-mean-across-the-members = średnia { $name } wśród członów

engine-e-campaign-failed-to-serialise-campaign-result = nie udało się serializować wyniku kampanii: { $e }

engine-campaign-chain-phases-over-events-alarm = łańcuch: fazy: { $phases }, czas { $duration_s } s, zdarzenia: { $events }, alarm podniesiony przez { $alarm_s } s siatki

engine-campaign-sweep-of-nodes-over = przemiatanie `{ $scenario_kind }`: węzły: { $nodes } po [{ $axis_order }]{ $v4 }

engine-campaign-monte-carlo-of-seeds = Monte Carlo `{ $scenario_kind }`: ziarna (seed): { $runs }

engine-campaign-compose-members = compose: człony: { $members }

engine-campaign-member-runs-modelled = przebiegi członów: { $runs_total } (MODELLED)

engine-campaign-sweep-of-over-nodes-each = przemiatanie `{ $scenario_kind }` po { $axis_order } (węzły: { $nodes }; każda linia we własnym zakresie)

engine-campaign-campaign-modelled-composition-every-value = kampania { $r } | kompozycja MODELLED; każda wartość odczytana z rzeczywistego przebiegu wskazanego rodzaju

## src/campaign/optimize.rs

engine-e-campaign-optimize-an-optimisation-takes-one-to = optymalizacja przyjmuje od jednego do trzech params, otrzymano { $params }

engine-e-campaign-optimize-param-is-named-twice = param `{ $name }` jest nazwany dwukrotnie

engine-e-campaign-optimize-param-needs-finite-lo-hi = param `{ $name }`: wymaga skończonych lo < hi

engine-e-campaign-optimize-param-scale-must-be-lin = param `{ $name }`: scale musi mieć wartość lin lub log

engine-e-campaign-optimize-param-log-param-needs-positive = param `{ $name }`: param log wymaga dodatnich granic

engine-e-campaign-optimize-param-start-must-lie-in = param `{ $name }`: start musi leżeć w [lo, hi]

engine-e-campaign-optimize-param-grid-needs-steps-of = param `{ $name }`: siatka wymaga co najmniej dwóch kroków

engine-e-campaign-optimize-objective-target-is-only-read = objective.target jest odczytywane tylko przy goal = "target"

engine-e-campaign-optimize-goal-target-needs-finite-objective = goal = "target" wymaga skończonego objective.target

engine-e-campaign-optimize-objective-goal-must-be-minimize = objective.goal musi mieć wartość minimize, maximize lub target, otrzymano `{ $other }`

engine-e-campaign-optimize-grid-of-nodes-is-above = siatka z liczbą węzłów { $total } przekracza limit 100000

engine-e-campaign-optimize-params-steps-is-only-read = params.steps jest odczytywane tylko przy method = "grid"

engine-e-campaign-optimize-max-evals-must-cover-the = max_evals musi obejmować początkowy sympleks (params + 1)

engine-e-campaign-optimize-step-must-lie-in = step musi leżeć w (0, 1]

engine-e-campaign-optimize-ftol-and-xtol-must-be = ftol i xtol muszą być nieujemne

engine-e-campaign-optimize-method-must-be-grid-or = method musi mieć wartość grid lub nelder-mead, otrzymano `{ $other }`

engine-campaign-optimize-optimize-eval = ewaluacja optymalizacji { $trace }

engine-campaign-optimize-lower-bound-of-the-scenario = dolna granica klucza scenariusza { $key }

engine-campaign-optimize-upper-bound-of-the-scenario = górna granica klucza scenariusza { $key }

engine-campaign-optimize-value-of-the-scenario-key = wartość klucza scenariusza { $key } w najlepszej ewaluacji

engine-campaign-optimize-value-of-the-scenario-key-2 = wartość klucza scenariusza { $key } w tej ewaluacji

engine-campaign-optimize-target-value-of = wartość docelowa { $what }

engine-campaign-optimize-at-the-best-evaluation = { $what } w najlepszej ewaluacji

engine-campaign-optimize-of-this-evaluation-the-seed = { $what } tej ewaluacji (średnia po ziarnach (seed), gdy runs > 1)

engine-campaign-optimize-optimize-of-by-evals-best = optimize `{ $objective_name }` ({ $goal } { $o }) dla `{ $scenario_kind }` metodą { $method }: ewaluacje: { $evals } ({ $stop_reason }), najlepsze { $o2 } w [{ $at }]

## src/ccsds_tdm.rs

engine-e-ccsds-tdm-tdm-meta-start-before-ccsds = TDM: META_START przed nagłówkiem CCSDS_TDM_VERS

engine-e-ccsds-tdm-tdm-malformed-header-line = TDM: nieprawidłowy wiersz nagłówka: { $line }

engine-e-ccsds-tdm-tdm-malformed-metadata-line = TDM: nieprawidłowy wiersz metadanych: { $line }

engine-e-ccsds-tdm-tdm-malformed-data-line = TDM: nieprawidłowy wiersz danych: { $line }

engine-e-ccsds-tdm-tdm-unrecognised-data-keyword = TDM: nierozpoznane słowo kluczowe danych { $k }

engine-e-ccsds-tdm-tdm-data-line-missing-epoch = TDM: w wierszu danych { $k } brak epoki

engine-e-ccsds-tdm-tdm-data-line-missing-value = TDM: w wierszu danych { $k } brak wartości

engine-e-ccsds-tdm-tdm-data-line-bad-value = TDM: w wierszu danych { $k } nieprawidłowa wartość { $val_str }

engine-e-ccsds-tdm-tdm-unterminated-segment-missing-meta = TDM: niezakończony segment (brak META_STOP/DATA_STOP)

engine-e-ccsds-tdm-tdm-bad-turnaround-numerator = TDM: nieprawidłowy TURNAROUND_NUMERATOR { $value }

engine-e-ccsds-tdm-tdm-bad-turnaround-denominator = TDM: nieprawidłowy TURNAROUND_DENOMINATOR { $value }

## src/cislunar_arc_recovery.rs

engine-e-cislunar-arc-recovery-unknown-observable-expected-one-of = nieznana obserwabla `{ $other }`: oczekiwano jednej z range, range-rate

engine-e-cislunar-arc-recovery-unknown-coordinates-expected-one-of = nieznane współrzędne `{ $other }`: oczekiwano jednych z cartesian, polar

engine-e-cislunar-arc-recovery-arc-hours-must-be-finite = arc_hours musi być skończone i dodatnie, otrzymano { $arc_hours }

engine-e-cislunar-arc-recovery-epochs-must-be-got = epochs musi być ≥ 2, otrzymano { $epochs }

engine-e-cislunar-arc-recovery-steps-must-be = steps musi być ≥ 1

engine-e-cislunar-arc-recovery-trials-must-be = trials musi być ≥ 1

engine-e-cislunar-arc-recovery-max-iterations-must-be = max_iterations musi być ≥ 1

engine-e-cislunar-arc-recovery-displacement-nd-must-be-finite = displacement_nd musi być skończone i dodatnie, otrzymano { $displacement_nd }

engine-e-cislunar-arc-recovery-recovery-factor-must-be-finite = recovery_factor musi być skończone i dodatnie, otrzymano { $recovery_factor }

engine-e-cislunar-arc-recovery-error-bound-km-must-be = error_bound_km musi być skończone i dodatnie, otrzymano { $error_bound_km }

engine-e-cislunar-arc-recovery-sigma-range-must-be-finite = sigma_range_m musi być skończone i dodatnie, otrzymano { $sigma_range_m }

engine-e-cislunar-arc-recovery-sigma-range-rate-mm-must = sigma_range_rate_mm_s musi być skończone i dodatnie, otrzymano { $sigma_range_rate_mm_s }

engine-e-cislunar-arc-recovery-the-constellation-must-carry-at = konstelacja musi obejmować co najmniej jednostkę główną (chief) i jeden punkt odniesienia

engine-e-cislunar-arc-recovery-family-is-an-out-of = rodzina `{ $family }` jest rodziną pozapłaszczyznową i nie ma płaskiej reprezentacji czterostanowej: ustaw spatial = true, aby ją przemieść

engine-e-cislunar-arc-recovery-the-forward-model-produced-non = model prosty dał nieskończony pomiar prawdy

engine-cislunar-arc-recovery-first-arc-length-at-which = pierwsza długość łuku, przy której rozwiązanie wsadowe bez szumu dla KAŻDEJ próby z ziarnem (seed) sprowadza końcowy błąd stanu do co najwyżej { $recovery_factor } razy początkowego przemieszczenia a priori. Jest to odpowiednik odzysku kryterium rzędu: przy dokładnych pomiarach pytanie `is the state observable?` zmienia się w `can an estimator get it back?`, a na odpowiedź nie wpływa żadna tolerancja wartości osobliwych.

engine-cislunar-arc-recovery-first-arc-length-at-which-2 = pierwsza długość łuku, przy której błąd odzysku pozycji RMS metodą Monte Carlo dla realizacji szumu z ziarnem (seed): { $trials } spada do { $error_bound_km } km lub poniżej. Jest to odpowiednik odzysku kryterium estymowalności, zmierzony, a nie przewidziany: błąd jest odległością estymaty od znanej prawdy, a nie śladem formalnej kowariancji.

engine-cislunar-arc-recovery-corroborated-within-one-epoch-grid = CORROBORATED w granicach jednego kroku siatki epok: estymator odzyskuje stan od { $e } h, kryterium rzędu Gramiana zmienia się przy { $g } h (stosunek { $v1 }, siatka { $grid_hours } h).

engine-cislunar-arc-recovery-not-corroborated-as-recoverability-boundary = NOT CORROBORATED jako granicy odzyskiwalności: estymator odzyskuje stan od { $e } h, { $v1 } wartości { $g } h kryterium rzędu Gramiana (stosunek { $v2 }, siatka { $grid_hours } h). Kryterium rzędu jest względną konwencją wartości osobliwych; granica odzysku jest zmierzonym błędem stanu i oba tu się nie pokrywają.

engine-cislunar-arc-recovery-not-corroborated-the-estimator-never = NOT CORROBORATED: estymator nigdy nie osiąga swojej granicy odzysku na tym łuku, podczas gdy kryterium rzędu Gramiana zmienia się przy { $g } h.

engine-cislunar-arc-recovery-the-gramian-rank-criterion-is = kryterium rzędu Gramiana nigdy nie jest spełnione na tym łuku (geometria nigdy nie osiąga pełnego rzędu), podczas gdy estymator odzyskuje stan od { $e } h — oba kryteria nie zgadzają się nawet co do tego, czy granica w ogóle istnieje.

engine-cislunar-arc-recovery-cislunar-arc-recovery-family-state = cislunar-arc-recovery | rodzina { $family }, { $state_dim } stanów, { $n_spacecraft } s/c, obserwabla { $observable }, parametryzacja { $coordinates } | łuk { $arc_hours } h, epoki: { $epochs } (siatka { $grid_hours } h), próby: { $trials }, ziarno (seed) { $seed } | pochodne cząstkowe różnicami skończonymi, bez analitycznego Jacobianu / STM / SVD / SRIF | odzysk bez szumu od { $nf } (współczynnik { $recovery_factor }) a próg rzędu Gramiana { $gram } | estymowalność metodą Monte Carlo od { $est } (RMS poz. ≤ { $error_bound_km } km, σ { $sigma_range_m } m) a estymowalność Gramiana { $gram_est } | RMS poz. na końcu łuku { $last } km

## src/cislunar_observability.rs

engine-e-cislunar-observability-unknown-family-expected-one-of = nieznana rodzina `{ $other }`: oczekiwano jednej z dro, halo, nrho

engine-e-cislunar-observability-dro-at-crossing-distance-did = DRO przy odległości przecięcia { $d } nie uległa korekcji różnicowej

engine-e-cislunar-observability-member-at-x0-did-not = { $label } element { $i } przy x0 = { $x0 } nie uległ korekcji różnicowej

engine-e-cislunar-observability-spacecraft-must-be-between-and = n_spacecraft musi mieścić się między 2 a { $MAX_SPACECRAFT }, otrzymano { $n }

engine-e-cislunar-observability-epochs-must-be-got = epochs musi być ≥ 2, otrzymano { $n_epochs }

engine-e-cislunar-observability-rel-tol-must-be-finite = rel_tol musi być skończone i dodatnie, otrzymano { $rel_tol }

engine-e-cislunar-observability-sigma-range-must-be-finite = sigma_range_m musi być skończone i nieujemne, otrzymano { $sigma_range_m }

engine-e-cislunar-observability-sigma-pos-threshold-km-must = sigma_pos_threshold_km musi być skończone i dodatnie, otrzymano { $sigma_pos_threshold_km }

engine-cislunar-observability-never-rank-of = nigdy (rząd { $rank } z { $state_dim })

engine-cislunar-observability-family-state-range-rank-threshold = { $base } | rodzina { $family }, { $state_dim } stanów, { $n_spacecraft } s/c, σ_range { $sigma_range_m } m | próg rzędu { $rank_thr } (siatka { $c } h) | próg estymowalności (σ_pos ≤ { $sigma_pos_threshold_km } km) { $est_thr }

engine-cislunar-observability-first-arc-length-at-which = pierwsza długość łuku, przy której formalna niepewność 1σ pozycji POCZĄTKOWEGO stanu jednostki głównej (chief), σ_pos = sqrt(trace(P_rr)) przy P = (ÕᵀÕ)⁻¹, gdzie Õ jest macierzą obserwowalności wybieloną względem szumu pomiarowego, spada do { $sigma_pos_threshold_km } km lub poniżej. Jest to kryterium, przy którym próg długości łuku w ogóle zależy od szumu: P skaluje się jak σ², więc σ_pos skaluje się jak σ, podczas gdy powyższe kryterium rzędu nie zmienia się z σ. Ta granica jest WSKAZANYM wyborem inżynierskim, a nie dopasowanym — estimability_sweep podaje próg przy czterech innych granicach.

engine-cislunar-observability-validated-each-constellation-initial-condition = Zweryfikowano: każdy warunek początkowy konstelacji jest skorygowaną różnicowo orbitą okresową rodziny { $family }, domykającą się w ciągu jednego okresu do podanego residuum okresowości (płaskie DRO są dodatkowo wsteczne względem Księżyca). Rodzina jest korygowana przy stosunku mas Ziemia–Księżyc. Modelowano: wybór parametrów i faz rodziny (projekt konstelacji). Nazwa klucza `dro_provenance` jest zachowana dla wydanego schematu dokumentu; niesie ona tę rodzinę, o którą poprosił ten przebieg.

## src/clock_integrity.rs

engine-e-clock-integrity-integrity-must-be-finite-and = integrity: { $n } musi być skończone i dodatnie, otrzymano { $v }

engine-e-clock-integrity-integrity-must-lie-in-got = integrity: { $n } musi leżeć w (0, 1), otrzymano { $v }

engine-e-clock-integrity-integrity-mask-deg-must-lie = integrity: mask_deg musi leżeć w [0, 90)

engine-e-clock-integrity-integrity-systems-must-name-at = integrity: systems musi wskazywać co najmniej jeden preset

engine-e-clock-integrity-integrity-injected-bias-needs-finite = integrity: injected_bias wymaga skończonych bias_m, t0_s i t1_s

## src/clock_library/card.rs

engine-e-clock-library-card-no-records = { $name }: brak rekordów

engine-e-clock-library-card-records-at-different-tau0 = { $name }: rekordy o różnym tau0

engine-e-clock-library-card-periodic-least-squares-failed = { $name }: okresowa metoda najmniejszych kwadratów nie powiodła się

engine-e-clock-library-card-stability-points-with-edf-card = { $name }: punkty stabilności z edf >= { $MIN_FIT_EDF }: { $used }; karta wymaga trzech

## src/clock_library/condition.rs

engine-clock-library-condition-gaps-phase-outliers-phase-steps = luki { $g }, odstające fazy { $o }, skoki fazy { $p }, serie { $b }, skoki częstotliwości { $f } (odporna sigma_y { $sigma_y })

## src/compliance/mod.rs

engine-e-compliance-is-not-non-negative-integer = `{ $p }` nie jest nieujemną liczbą całkowitą

engine-e-compliance-is-missing = brak `{ $p }`

engine-compliance-events-detected-exceeds-events-evaluable = events_detected { $ed } przekracza events_evaluable { $ee }

engine-compliance-predictions-agreeing-exceeds-predictions-evaluable = predictions_agreeing { $pa } przekracza predictions_evaluable { $pe }

engine-compliance-receiver-trust-counts-malformed-excluded = { $label }: liczniki receiver-trust są nieprawidłowe ({ $malformed_counts }); wykluczono

engine-e-compliance-not-json = { $label }: nie jest plikiem JSON: { $e }

engine-compliance-cannot-read = { $label }: nie można odczytać: { $e }

engine-e-compliance-the-sibling-scenario-says-kind = { $label }: sąsiedni scenariusz podaje kind `{ $s }`, a wynik `{ $o }`; nie użyto

engine-e-compliance-scenario-kind-not-found-no = { $label }: nie znaleziono rodzaju scenariusza (brak sąsiedniego pliku scenariusza, to nie jest wynik receiver-trust, brak `kind` najwyższego poziomu)

engine-e-compliance-is-not-scenario-kind-the = { $label }: `{ $kind }` nie jest rodzajem scenariusza znanym silnikowi; nie użyto

engine-compliance-written-by-kshana = Zapisano przez kshana { $engine_version }.{ "\u000A\u000A" }

engine-compliance-test-with-every-stated-bar =
    ### { $cell } ({ $cell2 })

    Testy z każdym podanym progiem spełnionym: { $met }, z progiem niespełnionym: { $not_met }, wymagające danych wejściowych: { $needs_input }.{ "\u000A\u000A" }

## src/conflict_resilience.rs

engine-e-conflict-resilience-intensity-grid-must-have-finite = siatka intensywności musi mieć skończone min < max, otrzymano [{ $min }, { $max }]

engine-e-conflict-resilience-intensity-grid-needs-steps-got = siatka intensywności wymaga >= 2 kroków, otrzymano { $steps }

engine-e-conflict-resilience-correlation-grid-must-have-at = siatka korelacji musi mieć co najmniej jedną wartość

engine-e-conflict-resilience-correlation-values-must-lie-in = wartości korelacji muszą leżeć w [0, 1], otrzymano { $r }

engine-e-conflict-resilience-conflict-resilience-needs-at-least = conflict-resilience wymaga co najmniej jednej warstwy

engine-e-conflict-resilience-layer-availability-not-in = warstwa { $i }: dostępność { $availability } poza [0, 1]

engine-e-conflict-resilience-layer-sigma-must-be-finite = warstwa { $i }: sigma_m musi być skończone i dodatnie

engine-e-conflict-resilience-layer-vulnerability-must-be-finite = warstwa { $i }: vulnerability musi być skończone i >= 0

engine-e-conflict-resilience-layer-vector-weight-must-be = warstwa { $i }: vector_weight musi być skończone i >= 0

engine-e-conflict-resilience-primary-layer-out-of-range = primary_layer { $primary } poza zakresem (0..{ $layers })

engine-e-conflict-resilience-trials-must-be = trials musi być >= 1

engine-conflict-resilience-conflict-resilience-layers-baseline-reference = conflict-resilience | warstwy: { $layers } (bazowa: { $primary }) | intensywność odniesienia { $reference_intensity } | współczynnik odporności postać zamknięta { $ratio_closed_form }x MC { $ratio_mc_independent }x (warstwowy a jednowarstwowy) | korelacja niweczy warstwowanie: współczynnik { $first }x @ rho { $first2 } -> { $last }x @ rho { $last2 } | przedział ufności a priori [{ $ratio_lo }-{ $ratio_hi }]x | przeżywalność na wektor @ jam odniesienia { $surv }% spoof { $surv2 }% kinetic { $surv3 }% cyber { $surv4 }% (najostrzejszy { $sharpest }) | wynik główny ~7x MODELLED, VALIDATED MC->closed-form / fuse-identity / copula-marginals / per-vector-survival

## src/constellation.rs

engine-e-constellation-unknown-central-body-expected-planet = nieznane ciało centralne { $name }: oczekiwano planety, Plutona, Księżyca lub dużego księżyca (earth, moon, mars, europa, titan, ...; zob. crate::body::SOLAR_SYSTEM)

engine-e-constellation-walker-shell-needs-total-and = powłoka Walkera wymaga total > 0 i planes > 0

engine-e-constellation-walker-total-is-not-multiple = suma Walkera { $total } nie jest wielokrotnością płaszczyzn { $planes }

engine-e-constellation-walker-phasing-must-lie-in = fazowanie Walkera F = { $phasing } musi leżeć w 0..planes (= { $planes })

engine-e-constellation-is-not-an-expandable-gps = { $name } nie jest rozszerzalnym slotem GPS (SPS PS Table 3.2-2 podaje B1, D2, F2, A2, C4, E3)

engine-e-constellation-give-altitude-km-or-semi = { $what }: podaj altitude_km albo semi_major_axis_km, nie oba

engine-e-constellation-needs-altitude-km-or-semi = { $what }: wymaga altitude_km albo semi_major_axis_km

engine-e-constellation-semi-major-axis-km-is = { $what }: półoś wielka { $v1 } km nie przekracza promienia { $name }

engine-e-constellation-eccentricity-must-lie-in = { $what }: mimośród { $e } musi leżeć w [0, { $lit_0_9 })

engine-e-constellation-perigee-is-below-the-surface = { $what }: perygeum leży poniżej powierzchni { $name }

engine-e-constellation-constellation-preset-is-an-earth = konstelacja { $name }: preset { $p } jest konstelacją ziemską, a ciałem jest { $name2 }

engine-e-constellation-constellation-unknown-preset-expected-gps = konstelacja { $name }: nieznany preset { $other } (oczekiwano gps-baseline, gps-expandable, galileo, beidou, beidou-meo lub glonass)

engine-e-constellation-constellation-expanded-applies-only-to = konstelacja { $name }: `expanded` dotyczy wyłącznie presetu gps-expandable

engine-constellation-constellation-shell = konstelacja { $name } powłoka { $v2 }

engine-constellation-explicit-element-sets = jawne zestawy elementów: { $satellite }

engine-constellation-constellation-satellite = konstelacja { $name } satelita { $v2 }

engine-e-constellation-constellation-has-no-satellites-give = konstelacja { $name } nie ma satelitów: podaj preset, [[constellation.shell]] lub [[constellation.satellite]]

engine-e-constellation-no-constellation-given = nie podano konstelacji

## src/constellation.rs

engine-e-constellation-constellations-with-one-clock-each = konstelacje z jednym zegarem każda: { $constellations } przekraczają limit { $MAX_CLOCKS } zegarów; użyj clock = "common" lub scal konstelacje

engine-e-constellation-must-be-finite = { $what } musi być skończone

engine-e-constellation-need-step-and-duration-step = wymagane step_s > 0 i duration_s >= step_s

engine-e-constellation-more-than-100-000-epochs = ponad 100 000 epok; zwiększ step_s

engine-e-constellation-mask-deg-must-lie-in = mask_deg musi leżeć w [0, 90)

engine-e-constellation-pdop-threshold-must-be-positive = pdop_threshold musi być dodatni

engine-e-constellation-grid-step-deg-must-lie = grid_step_deg musi leżeć w [{ $lit_0_25 }, 90]

engine-e-constellation-need-90-lat-min-deg = wymagane -90 <= lat_min_deg < lat_max_deg <= 90

engine-e-constellation-need-lon-min-deg-lon = wymagane lon_min_deg < lon_max_deg, rozpiętość co najwyżej 360 deg

engine-e-constellation-give-at-least-one-constellation = podaj co najmniej jedną [[constellation]]

engine-e-constellation-track-points-is-capped-at = track_points jest ograniczone do 2000

engine-e-constellation-satellites-exceeds-the-50-000 = liczba satelitów { $total } przekracza limit 50 000

engine-constellation-constellation-design-satellites-around-the = constellation-design: satelity: { $total } ({ $names }) wokół: { $name }; dostępność { $global_availability_pct }% (PDOP <= { $pdop_threshold } przy masce { $mask_deg } deg), najgorsza lokalizacja { $worst_site_availability_pct }%, mediana PDOP { $cov }, średnio { $global_mean_visible } w widoku; punkty siatki: { $grid_points } x epoki: { $epochs } (MODELLED)

engine-constellation-constellation-coverage-over-the = Pokrycie konstelacji nad: { $name }

## src/contact_schedule.rs

engine-e-contact-schedule-link-must-be-finite-and = link.{ $n } musi być skończone i dodatnie

engine-e-contact-schedule-link-must-be-finite-and-2 = link.{ $n } musi być skończone i >= 0

engine-e-contact-schedule-link-eirp-dbw-must-be = link.eirp_dbw musi być skończone

engine-e-contact-schedule-satellite-altitude-km-must-be = satelita '{ $name }': altitude_km musi być w (100, 40000)

engine-e-contact-schedule-satellite-inclination-deg-must-be = satelita '{ $name }': inclination_deg musi być w [0, 180]

engine-e-contact-schedule-satellite-backlog-mbit-must-be = satelita '{ $name }': backlog_mbit musi być >= 0

engine-e-contact-schedule-satellite-priority-must-be = satelita '{ $name }': priority musi być > 0

engine-e-contact-schedule-satellite-eirp-dbw-must-be = satelita '{ $name }': eirp_dbw musi być skończone

engine-e-contact-schedule-station-lat-deg-in-90 = stacja '{ $name }': lat_deg w [-90, 90], lon_deg skończone

engine-e-contact-schedule-station-mask-deg-must-be = stacja '{ $name }': mask_deg musi być w [0, 90)

engine-e-contact-schedule-station-alt-must-be-in = stacja '{ $name }': alt_m musi być w [0, 3000] (zakres ITU-R P.834)

engine-e-contact-schedule-station-setup-and-over-db = stacja '{ $name }': setup_s >= 0, a g_over_t_db skończone

engine-e-contact-schedule-duration-hours-must-be-in = duration_hours musi być w (0, 168]

engine-e-contact-schedule-step-must-be-in-300 = step_s musi być w (0, 300]

engine-e-contact-schedule-at-least-one-satellite-and = wymagany jest co najmniej jeden satelita i jedna stacja

engine-e-contact-schedule-at-most-32-satellites-and = co najwyżej 32 satelity i 32 stacje

engine-contact-schedule-contact-schedule-satellites-stations-over = contact-schedule: satelity: { $satellites } x stacje: { $stations } w ciągu { $duration_hours } h -> kandydaci na kontakty: { $cands }, zaplanowano: { $greedy }; dostarczono { $total_del } z { $total_backlog } Mbit{ $v8 } (MODELLED)

engine-contact-schedule-acm-link-pass-es-acm = acm-link: przeloty: { $pairs }; ACM { $acm } Mbit a CCM { $ccm } { $ccm_v } Mbit{ $v5 } (MODELLED)

## src/dop_error_ci.rs

engine-e-dop-error-ci-need-at-least-trials-and = wymagane co najmniej 2 próby i skończone sigma_m > 0

engine-e-dop-error-ci-alpha-total-must-be-in = alpha_total musi być w (0, 1)

engine-e-dop-error-ci-no-local-frame-at-the = brak układu lokalnego u użytkownika

engine-e-dop-error-ci-singular-geometry = { $name }: geometria osobliwa

engine-e-dop-error-ci-no-noise-free-fix = { $name }: brak rozwiązania bez szumu

engine-e-dop-error-ci-no-fix = { $name }: brak rozwiązania

## src/dop_error_mc.rs

engine-e-dop-error-mc-singular-geometry = { $label }: geometria osobliwa

engine-e-dop-error-mc-no-fix = { $label }: brak rozwiązania

## src/earth_gnss_lunar.rs

engine-e-earth-gnss-lunar-altitude-km-must-be-positive = altitude_km musi być dodatnie; otrzymano { $altitude_km }

engine-e-earth-gnss-lunar-planes-and-sats-per-plane = planes i sats_per_plane muszą być niezerowe

engine-e-earth-gnss-lunar-freq-hz-must-be-positive = freq_hz musi być dodatnie; otrzymano { $freq_hz }

engine-e-earth-gnss-lunar-tx-efficiency-must-be-in = tx_efficiency musi być w (0, 1]; otrzymano { $tx_efficiency }

engine-e-earth-gnss-lunar-system-temp-must-be-positive = system_temp_k musi być dodatnie; otrzymano { $temp_k }

engine-e-earth-gnss-lunar-back-lobe-suppression-db-must = back_lobe_suppression_db musi być nieujemne; otrzymano { $back_lobe_suppression_db }

engine-e-earth-gnss-lunar-receiver-range-must-be-outside = receiver_range_m musi leżeć poza Ziemią; otrzymano { $range_m }

engine-earth-gnss-lunar-earth-limb-from-the-constellation = { "  " }Limb Ziemi widziany z konstelacji: { $earth_limb_half_angle_deg } deg od nadiru — każdy promień skierowany ku Księżycowi musi go przekraczać{ "\u000A" }

engine-earth-gnss-lunar-of-not-occulted-clear-the = { "  " }nieprzesłonięte: { $n_geometrically_visible } z { $n_satellites }; powyżej progu śledzenia { $tracking_threshold_dbhz } dB-Hz: { $n_trackable }{ "\u000A" }

engine-earth-gnss-lunar-best-link-db-hz = { "  " }najlepsze łącze { $c } dB-Hz{ "\u000A" }

engine-earth-gnss-lunar-every-trackable-line-of-sight = { "  " }każda śledzona linia widzenia leży wewnątrz półstożka { $a } deg — geometria jest niemal zdegenerowana{ "\u000A" }

engine-earth-gnss-lunar-sweep-over-epochs-signal-availability = { "  " }PRZEMIATANIE po epokach: { $epochs } / { $span_s } s: dostępność sygnału { $signal_availability }, dostępność rozwiązania FIX { $fix_availability }{ "\u000A" }

engine-earth-gnss-lunar-trackable-links-mean-max-best = { "    " }łącza śledzone: średnio { $mean_trackable }, maks. { $max_trackable }; najlepsze C/N0 { $w }; najlepszy PDOP { $w2 }{ "\u000A" }

## src/entry_eo_ascent/ascent.rs

engine-e-entry-eo-ascent-ascent-between-one-and-six-stages = wymaganych jest od jednego do sześciu stopni

engine-e-entry-eo-ascent-ascent-stages-dry-mass-kg-must = stages[{ $i }].dry_mass_kg musi być skończone i nieujemne

engine-e-entry-eo-ascent-ascent-stages-exit-area-m2-must = stages[{ $i }].exit_area_m2 musi być skończone i nieujemne

engine-e-entry-eo-ascent-ascent-payload-kg-must-be-finite = payload_kg musi być skończone i nieujemne

engine-e-entry-eo-ascent-ascent-kick-altitude-must-be-finite = kick_altitude_m musi być skończone i nieujemne

engine-e-entry-eo-ascent-ascent-kick-angle-deg-must-be = kick_angle_deg musi być w [0, 45)

engine-e-entry-eo-ascent-ascent-kick-duration-must-be-finite = kick_duration_s musi być skończone i nieujemne

engine-e-entry-eo-ascent-ascent-lift-off-thrust-to-weight = stosunek ciągu do ciężaru przy starcie { $tw } musi przekraczać 1

engine-entry-eo-ascent-ascent-ascent-losses-ideal-dv-losses = ascent-losses: idealne dv { $ideal_dv_m_s } m/s, straty { $losses } m/s (grawitacyjne { $gravity_loss_m_s }, oporowe { $drag_loss_m_s }, sterowania { $steering_loss_m_s }, przeciwciśnienia { $back_pressure_loss_m_s }); wypalenie { $r } km przy { $end_speed_m_s } m/s, gamma { $r2 } deg; max-Q { $r3 } kPa (MODELLED)

## src/entry_eo_ascent/entry_heating.rs

engine-e-entry-eo-ascent-entry-heating-must-be-finite-and-positive = { $name } musi być skończone i dodatnie

engine-e-entry-eo-ascent-entry-heating-body-must-be-earth-or = body musi mieć wartość "earth" lub "mars", otrzymano "{ $other }"

engine-e-entry-eo-ascent-entry-heating-atmosphere-is-not-available-for = atmosfera "{ $a }" nie jest dostępna dla ciała "{ $b }" (earth: us76|exponential, mars: mars|exponential)

engine-e-entry-eo-ascent-entry-heating-flight-path-angle-deg-must = flight_path_angle_deg musi być w (0, 90) (dodatni w dół)

engine-e-entry-eo-ascent-entry-heating-entry-interface-altitude-must-be = entry_interface_altitude_m musi być w [20 km, 1000 km]

engine-e-entry-eo-ascent-entry-heating-latitude-deg-must-be-finite = latitude_deg musi być skończone, przy |latitude| < 89 deg

engine-e-entry-eo-ascent-entry-heating-heading-deg-and-longitude-deg = heading_deg i longitude_deg muszą być skończone

engine-e-entry-eo-ascent-entry-heating-lift-to-drag-must-be = lift_to_drag musi być w [0, 3]

engine-e-entry-eo-ascent-entry-heating-bank-angle-deg-must-be = bank_angle_deg musi być skończone

engine-e-entry-eo-ascent-entry-heating-step-must-be-in = step_s musi być w (0, 1] s

engine-e-entry-eo-ascent-entry-heating-terminal-altitude-must-be-in = terminal_altitude_m musi być w [0, entry_interface_altitude_m)

engine-e-entry-eo-ascent-entry-heating-max-time-must-be-in = max_time_s musi być w (0, 20000] s

engine-e-entry-eo-ascent-entry-heating-velocity-frame-must-be-inertial = velocity_frame musi mieć wartość inertial|relative, otrzymano "{ $o }"

engine-entry-eo-ascent-entry-heating-entry-heating-rel-peak-at = entry-heating ({ $body }): V_rel { $speed_m_s } m/s, γ { $gam_abs }° -> szczyt { $pk_g } g na { $r } km, szczytowe q { $r2 } W/cm² na { $r3 } km, obciążenie cieplne { $r4 } J/cm², szczytowe q_dyn { $r5 } kPa; { $outcome } po { $end_time_s } s (postać zamknięta { $cf_g } g; MODELLED 3-DoF, bez promieniowania/TPS)

## src/entry_eo_ascent/eo_radiometry.rs

engine-e-entry-eo-ascent-eo-radiometry-must-be-in = { $n } musi być w (0, 1]

engine-e-entry-eo-ascent-eo-radiometry-must-be-finite-and-non = { $n } musi być skończone i nieujemne

engine-e-entry-eo-ascent-eo-radiometry-sun-zenith-deg-must-be = sun_zenith_deg musi być w [0, 90)

engine-e-entry-eo-ascent-eo-radiometry-adc-bits-must-be-in = adc_bits musi być w 1..=24

engine-entry-eo-ascent-eo-radiometry-eo-radiometry-gsd-snr-well = eo-radiometry: GSD { $gsd } m, Q { $im }, SNR { $snr } (studnia { $v4 } %), MTF@Nyquist { $fac }, RER { $rer }, GIQE4 NIIRS { $niirs } (MODELLED)

## src/eo_payload.rs

engine-e-eo-payload-nadir-angle-exceeds-the-earth = kąt nadirowy { $eta_rad }° przekracza promień kątowy Ziemi { $rho }° (chybia Ziemię)

engine-e-eo-payload-no-sun-synchronous-inclination-at = brak inklinacji heliosynchronicznej na { $v1 } km

engine-e-eo-payload-half-fov-deg-must-be = half_fov_deg musi być w (0, 90)

engine-e-eo-payload-ifov-microrad-must-be-finite = ifov_microrad musi być skończone i dodatnie

engine-e-eo-payload-half-fov-too-large = half_fov zbyt duże: { $e }

engine-eo-payload-eo-coverage-km-fov-km = eo-coverage: { $altitude_km } km, ±{ $half_fov_deg }° FOV -> pas { $v3 } km, nadirowy GSD { $gsd } m, dostęp do { $v5 } km od nadiru; odstęp węzłów { $v6 } km ({ $v7 }) (MODELLED)

## src/ephem_provider.rs

engine-ephem-provider-earth-moon-barycentre-from-split = Barycentrum Ziemia–Księżyc z { $table }, rozdzielone szeregiem księżycowym Montenbrucka i Gilla, sprecesowanym do J2000

engine-ephem-provider-jpl-mean-elements-in-the = średnie elementy JPL w płaszczyźnie Laplace'a, tempo długości średniej z tempa obrotu synchronicznego IAU, dodane do swojej planety z { $table }

engine-ephem-provider-iau-synchronous-rotation-direction-at = kierunek obrotu synchronicznego IAU przy średniej odległości JPL, dodany do Saturna z { $table }

engine-e-ephem-provider-read = odczyt { $path }: { $e }

## src/ephemeris.rs

engine-e-ephemeris-tle-is-missing-line-line = w TLE brak wiersza 1 (wiersza zaczynającego się od `1 `)

engine-e-ephemeris-tle-is-missing-line-line-2 = w TLE brak wiersza 2 (wiersza zaczynającego się od `2 `)

engine-e-ephemeris-an-analytic-orbit-ephemeris-requires = analityczne efemerydy `orbit` wymagają `epoch`

engine-e-ephemeris-ephemeris-scenario-needs-either-tle = scenariusz efemeryd wymaga `tle` albo `orbit`

engine-e-ephemeris-step-must-be-positive = step_s musi być dodatnie

engine-e-ephemeris-duration-must-be-non-negative = duration_s musi być nieujemne

engine-e-ephemeris-carrier-hz-must-be-positive = carrier_hz musi być dodatnią, skończoną częstotliwością

## src/evidence/assemble.rs

engine-e-evidence-assemble-is-not-finite = `{ $arg }` nie jest skończone

engine-e-evidence-assemble-is-neither-seconds-nor-an = `{ $arg }` nie jest ani sekundami, ani czasem UTC ISO-8601

engine-e-evidence-assemble-no-epoch-of-the-log = żadna epoka dziennika nie mieści się między { $t0 } s a { $t1 } s (dziennik obejmuje od 0 do { $duration_s } s)

engine-e-evidence-assemble-config-is-not-an-object = config nie jest obiektem

engine-e-evidence-assemble-config-json-already-has-an = config.json ma już wpis `{ $k }`

## src/evidence/bundle.rs

engine-e-evidence-bundle-from-to = od { $from_s } do { $to_s }

engine-e-evidence-bundle-is-not-utc-time-like = `{ $c }` nie jest czasem UTC w postaci 2026-01-02T03:04:05Z

engine-e-evidence-bundle-in-log-of-bytes = { $s }..{ $e } w dzienniku o rozmiarze { $log_bytes } B

## src/evidence/cli.rs

engine-e-evidence-cli-needs-value = { $name } wymaga wartości

engine-e-evidence-cli-cannot-create = nie można utworzyć { $path }: { $e }

engine-e-evidence-cli-cannot-write = nie można zapisać { $path }: { $e }

engine-evidence-cli-warning-is-readable-by-other = ostrzeżenie: { $path } jest czytelny dla innych użytkowników; ogranicz dostęp (chmod 600)

engine-e-evidence-cli-cannot-read-key = nie można odczytać klucza { $path }: { $e }

engine-e-evidence-cli-is-not-hex-key = { $path } nie jest kluczem szesnastkowym

engine-e-evidence-cli-must-hold-32-byte-key = { $path } musi zawierać 32-bajtowy klucz jako 64 cyfry szesnastkowe

engine-e-evidence-cli-cannot-read = nie można odczytać { $dir }: { $e }

engine-e-evidence-cli-cannot-read-2 = nie można odczytać { $name }: { $e }

engine-e-evidence-cli-exists-and-is-not-empty = { $dir } istnieje i nie jest pusty

engine-e-evidence-cli-cannot-create-2 = nie można utworzyć { $dir }: { $e }

engine-evidence-cli-warning-is-owner-only-mode = ostrzeżenie: { $arg } jest dostępny tylko dla właściciela (tryb 600) i nie ma nazwy *.pub: może to być klucz prywatny. Podaj plik klucza publicznego.

engine-e-evidence-cli-pubkey-is-neither-64-hex = --pubkey `{ $arg }` nie jest ani 64 cyframi szesnastkowymi, ani czytelnym plikiem ({ $e })

engine-e-evidence-cli-pubkey-does-not-hold-hex = --pubkey `{ $arg }` nie zawiera cyfr szesnastkowych

engine-evidence-cli-private-key-keep-it-secret = klucz prywatny: { $out }  (zachowaj w tajemnicy; nigdy nie zatwierdzaj go w repozytorium)

engine-evidence-cli-public-key-pub = klucz publiczny:  { $out }.pub

engine-evidence-cli-public-key-hex = klucz publiczny (hex): { $pk }

engine-evidence-cli-give-verifiers-the-public-key = Przekaż weryfikującym klucz publiczny zaufaną drogą; przypinają go przez --pubkey.

engine-e-evidence-cli-verify-needs-bundle-directory = verify wymaga katalogu pakietu

engine-e-evidence-cli-cannot-read-3 = nie można odczytać { $p }: { $e }

engine-e-evidence-cli-no-pem-certificate-found = { $p }: nie znaleziono certyfikatu PEM

engine-evidence-cli-timestamp-authority-signature-not-verified = { "      " }podpis urzędu znakowania czasem nie został zweryfikowany przez Kshana

engine-evidence-cli-this-is-technical-record-not = To jest zapis techniczny, a nie opinia prawna.

engine-e-evidence-cli-attach-timestamp-needs-bundle-directory = attach-timestamp wymaga katalogu pakietu

engine-e-evidence-cli-attach-timestamp-needs-token-file = attach-timestamp wymaga pliku tokenu

engine-e-evidence-cli-cannot-read-4 = nie można odczytać { $tok }: { $e }

engine-e-evidence-cli-cannot-write-2 = nie można zapisać { $target }: { $e }

engine-evidence-cli-note-the-token-sits-beside = uwaga: token leży obok podpisanego manifestu, a nie w nim; użyj --require-timestamp, aby go wymusić.

engine-e-evidence-cli-round-trip-packs-are-not = pakiety round-trip nie są budowane dla WebAssembly

engine-e-evidence-cli-needs-scenario-path = wymaga ścieżki scenariusza

engine-e-evidence-cli-needs-from = wymaga --from

engine-e-evidence-cli-needs-to = wymaga --to

engine-e-evidence-cli-cannot-read-lab-attestation = nie można odczytać atestacji laboratoryjnej { $p }: { $e }

engine-e-evidence-cli-cannot-read-5 = nie można odczytać { $scn_path }: { $e }

engine-e-evidence-cli-invalid-receiver-trust-scenario = nieprawidłowy scenariusz receiver-trust: { $e }

engine-e-evidence-cli-lab-attestation-applies-to-receiver = --lab-attestation dotyczy `receiver-trust evidence`, a nie `evidence round-trip` (którego pakiet zapisuje warunki testu)

engine-e-evidence-cli-cannot-read-6 = nie można odczytać { $sp }: { $e }

engine-e-evidence-cli-cannot-read-7 = nie można odczytać { $cp }: { $e }

engine-evidence-cli-evidence-pack-written-to = pakiet dowodowy zapisano w { $out }

engine-evidence-cli-epochs-in-window-to = { "  " }epoki w oknie: { $epochs_in_window }  ({ $from_s } s do { $to_s } s)

engine-evidence-cli-signer-fingerprint = { "  " }odcisk podpisującego: { $signer_fingerprint }

engine-evidence-cli-sha-256-of-manifest-json = { "  " }SHA-256 pliku manifest.json (to, co powinien opatrzyć znacznikiem urząd RFC 3161): { $manifest_sha256 }

engine-evidence-cli-log-slice-bytes-to-of = { "  " }fragment dziennika: bajty { $a } do { $b } z { $log_bytes }

engine-evidence-cli-log-slice-whole-log-this = { "  " }fragment dziennika: cały dziennik (ten dziennik nie podaje zakresu bajtów dla okna)

engine-evidence-cli-lab-attestation-recorded-in-the = { "  " }atestacja laboratoryjna zapisana w podpisanym manifeście ({ $v1 })

engine-evidence-cli-pack-is-technical-record-not = Pakiet jest zapisem technicznym, a nie opinią prawną.

## src/evidence/html.rs

engine-evidence-html-to-after-the-first-epoch = { $from_s } s do { $to_s } s po pierwszej epoce dziennika

## src/evidence/lab.rs

engine-e-evidence-lab-invalid-lab-attestation-toml = nieprawidłowy TOML lab-attestation: { $e }

engine-e-evidence-lab-lab-attestation-must-be-table = `lab-attestation` musi być tabelą

engine-e-evidence-lab-invalid-lab-attestation = nieprawidłowe lab-attestation: { $e }

engine-e-evidence-lab-lab-attestation-is-required = lab-attestation: { $name } jest wymagane

engine-e-evidence-lab-lab-attestation-is-over-bytes = lab-attestation: { $name } przekracza { $MAX_FIELD } bajtów

engine-e-evidence-lab-lab-attestation-date-is-not = lab-attestation: date { $date } nie jest dniem w postaci 2026-11-02

engine-e-evidence-lab-lab-attestation-shielded-setup-needs = lab-attestation: układ shielded wymaga enclosure

engine-e-evidence-lab-lab-attestation-setup-must-be = lab-attestation: setup musi mieć wartość "conducted" lub "shielded" (otrzymano { $other }); układ drogą radiową nie jest akceptowany jako przebieg laboratoryjny

engine-e-evidence-lab-lab-attestation-attenuation-db-must = lab-attestation: attenuation_db musi być skończone

## src/evidence/roundtrip.rs

engine-e-evidence-roundtrip-the-test-conditions-state-event = warunki testu podają zdarzenia: { $events }, a scenariusz oceny ma: { $events2 }

engine-e-evidence-roundtrip-event-in-the-test-conditions = zdarzenie '{ $id }' w warunkach testu ({ $onset_s } s do { $offset_s } s) nie odpowiada '{ $label }' w scenariuszu oceny ({ $onset_s2 } s do { $end_s } s)

engine-e-evidence-roundtrip-the-log-sha-256-is = SHA-256 dziennika ({ $have }) nie jest tym, który podają warunki testu ({ $h })

## src/evidence/tsa.rs

engine-e-evidence-tsa-truncated-der = obcięty DER

engine-e-evidence-tsa-bad-der-length = nieprawidłowa długość DER

engine-e-evidence-tsa-unexpected-der-tag = { $what }: nieoczekiwany znacznik DER { $tag }

engine-e-evidence-tsa-empty-algorithmidentifier = pusty AlgorithmIdentifier

engine-e-evidence-tsa-bad-utctime = nieprawidłowy UTCTime

engine-e-evidence-tsa-bad-generalizedtime = nieprawidłowy GeneralizedTime

engine-e-evidence-tsa-bad-time = nieprawidłowy czas

engine-e-evidence-tsa-time-not-in-utc = czas nie jest w UTC

engine-e-evidence-tsa-bad-time-digits = nieprawidłowe cyfry czasu

engine-e-evidence-tsa-bad-bit-string = nieprawidłowy BIT STRING

engine-e-evidence-tsa-certificate-three-elements-expected = Certificate: oczekiwano trzech elementów

engine-e-evidence-tsa-tbscertificate-too-short = TBSCertificate: zbyt krótki

engine-e-evidence-tsa-empty-extension = pusty Extension

engine-e-evidence-tsa-extension-value-not-an-octet = Extension: wartość nie jest OCTET STRING

engine-e-evidence-tsa-validity-empty = Validity: pusty

engine-e-evidence-tsa-validity-short = Validity: zbyt krótki

engine-e-evidence-tsa-pem-end-without-begin = PEM: END bez BEGIN

engine-e-evidence-tsa-pem-bad-base64 = PEM: nieprawidłowy base64

engine-e-evidence-tsa-pem-bad-base64-length = PEM: nieprawidłowa długość base64

engine-e-evidence-tsa-spki-empty = SPKI: pusty

engine-e-evidence-tsa-spki-no-oid = SPKI: brak OID

engine-e-evidence-tsa-spki-no-key = SPKI: brak klucza

engine-e-evidence-tsa-rsapublickey-two-integers-expected = RSAPublicKey: oczekiwano dwóch liczb całkowitych

engine-e-evidence-tsa-unsupported-elliptic-curve = nieobsługiwana krzywa eliptyczna

engine-e-evidence-tsa-unsupported-public-key-algorithm = nieobsługiwany algorytm klucza publicznego

engine-e-evidence-tsa-rsa-key-or-signature-too = klucz lub podpis RSA zbyt duży

engine-e-evidence-tsa-rsa-modulus-not-odd = moduł RSA nie jest nieparzysty

engine-e-evidence-tsa-rsa-signature-out-of-range = podpis RSA poza zakresem

engine-e-evidence-tsa-rsa-key-too-small = klucz RSA zbyt mały

engine-e-evidence-tsa-invalid-padding = nieprawidłowe dopełnienie

engine-e-evidence-tsa-pss-encoded-message-too-long = PSS: zakodowana wiadomość zbyt długa

engine-e-evidence-tsa-last-octet-invalid = ostatni oktet nieprawidłowy

engine-e-evidence-tsa-pss-leftmost-bits-not-zero = PSS: skrajne lewe bity nie są zerami

engine-e-evidence-tsa-pss-bad-padding = PSS: nieprawidłowe dopełnienie

engine-e-evidence-tsa-pss-signature-mismatch = PSS: niezgodność podpisu

engine-e-evidence-tsa-unsupported-mask-generation-function = nieobsługiwana funkcja generowania maski

engine-e-evidence-tsa-mgf1-without-hash = MGF1 bez skrótu

engine-e-evidence-tsa-bad-pss-salt-length = nieprawidłowa długość soli PSS

engine-e-evidence-tsa-an-ecdsa-signature-needs-an = podpis ECDSA wymaga klucza EC

engine-e-evidence-tsa-an-rsa-signature-needs-an = podpis RSA wymaga klucza RSA

engine-e-evidence-tsa-rsaencryption-without-digest-algorithm = rsaEncryption bez algorytmu skrótu

engine-e-evidence-tsa-an-rsa-pss-signature-needs = podpis RSA-PSS wymaga klucza RSA

engine-e-evidence-tsa-id-ecpublickey-without-digest-algorithm = id-ecPublicKey bez algorytmu skrótu

engine-e-evidence-tsa-unsupported-signature-algorithm = nieobsługiwany algorytm podpisu

engine-e-evidence-tsa-pkistatusinfo-empty = PKIStatusInfo: pusty

engine-e-evidence-tsa-time-stamp-request-not-granted = żądanie znacznika czasu nie zostało przyznane

engine-e-evidence-tsa-no-time-stamp-token-in = brak tokenu znacznika czasu w odpowiedzi

engine-e-evidence-tsa-not-timestampresp-or-timestamptoken = to nie jest TimeStampResp ani TimeStampToken

engine-e-evidence-tsa-not-cms-signeddata = to nie jest CMS SignedData

engine-e-evidence-tsa-contentinfo-no-content = ContentInfo: brak treści

engine-e-evidence-tsa-signeddata-short = SignedData: zbyt krótki

engine-e-evidence-tsa-encapsulatedcontentinfo-empty = EncapsulatedContentInfo: pusty

engine-e-evidence-tsa-encapsulated-content-is-not-tstinfo = zawarta treść nie jest TSTInfo

engine-e-evidence-tsa-no-tstinfo = brak TSTInfo

engine-e-evidence-tsa-tstinfo-not-in-an-octet = TSTInfo nie jest w OCTET STRING

engine-e-evidence-tsa-tstinfo-short = TSTInfo: zbyt krótki

engine-e-evidence-tsa-tstinfo-no-gentime = TSTInfo: brak genTime

engine-e-evidence-tsa-signeddata-no-signerinfos = SignedData: brak signerInfos

engine-e-evidence-tsa-exactly-one-signerinfo-expected = oczekiwano dokładnie jednego SignerInfo

engine-e-evidence-tsa-signerinfo-no-sid = SignerInfo: brak sid

engine-e-evidence-tsa-signerinfo-no-digest-algorithm = SignerInfo: brak algorytmu skrótu

engine-e-evidence-tsa-signerinfo-short = SignerInfo: zbyt krótki

engine-e-evidence-tsa-signerinfo-no-signed-attributes = SignerInfo: brak podpisanych atrybutów

engine-e-evidence-tsa-signerinfo-no-signature-algorithm = SignerInfo: brak algorytmu podpisu

engine-e-evidence-tsa-signerinfo-no-signature = SignerInfo: brak podpisu

engine-e-evidence-tsa-no-serial = brak numeru seryjnego

engine-e-evidence-tsa-signer-certificate-not-found = nie znaleziono certyfikatu podpisującego

engine-e-evidence-tsa-attribute-empty = Attribute: pusty

engine-e-evidence-tsa-attribute-no-values = Attribute: brak wartości

engine-e-evidence-tsa-attribute-no-value = Attribute: brak wartości

engine-e-evidence-tsa-content-type-attribute-mismatch = niezgodność atrybutu content-type

engine-e-evidence-tsa-digest-failure = błąd skrótu

engine-e-evidence-tsa-signature-not-an-octet-string = podpis nie jest OCTET STRING

engine-e-evidence-tsa-ess-signing-certificate-attribute-missing = brak atrybutu ess signing certificate

engine-e-evidence-tsa-signingcertificate-empty = SigningCertificate: pusty

engine-e-evidence-tsa-ess-cert-id-not-found = nie znaleziono ess cert id

engine-e-evidence-tsa-esscertidv2-no-hash = ESSCertIDv2: brak skrótu

engine-e-evidence-tsa-unsuitable-certificate-purpose = nieodpowiednie przeznaczenie certyfikatu

engine-e-evidence-tsa-certificate-is-not-yet-valid = certyfikat nie jest jeszcze ważny

engine-e-evidence-tsa-certificate-has-expired = certyfikat wygasł

engine-e-evidence-tsa-invalid-ca-certificate = nieprawidłowy certyfikat CA

engine-e-evidence-tsa-certificate-chain-too-long = łańcuch certyfikatów zbyt długi

engine-e-evidence-tsa-messageimprint-empty = MessageImprint: pusty

engine-e-evidence-tsa-messageimprint-no-digest = MessageImprint: brak skrótu

engine-e-evidence-tsa-message-imprint-mismatch = niezgodność message imprint

## src/evidence/tsr.rs

engine-e-evidence-tsr-indefinite-length-ber-is-not = BER o nieokreślonej długości nie jest obsługiwany

engine-e-evidence-tsr-expected-tag-found = oczekiwano { $what } (znacznik { $tag }), znaleziono { $t }

engine-e-evidence-tsr-malformed-pkistatusinfo = nieprawidłowy PKIStatusInfo

engine-e-evidence-tsr-the-timestamp-response-was-not = odpowiedź znacznika czasu nie została przyznana

engine-e-evidence-tsr-not-timestamp-token = to nie jest token znacznika czasu

engine-e-evidence-tsr-the-token-content-type-is = typ treści tokenu nie jest CMS SignedData

engine-e-evidence-tsr-the-token-does-not-carry = token nie zawiera TSTInfo

## src/evidence/tsr.rs

engine-e-evidence-tsr-message-imprint-uses-an-unsupported = odcisk komunikatu używa nieobsługiwanego algorytmu skrótu

engine-e-evidence-tsr-the-imprint-is-bytes-not = odcisk ma { $digest } B, a nie { $want_len } B, jak daje { $hash_alg }

engine-e-evidence-tsr-gentime-is-not-utc = genTime nie jest w UTC

engine-e-evidence-tsr-malformed-gentime = błędnie sformatowany genTime

engine-e-evidence-tsr-gentime-is-not-real-calendar = genTime nie jest rzeczywistym czasem kalendarzowym

## src/evidence/verify.rs

engine-e-evidence-verify-not-lower-case-hex = nie jest zapisem szesnastkowym małymi literami

engine-e-evidence-verify-expected-bytes-found = oczekiwano bajtów: { $N }, znaleziono: { $v }

engine-e-evidence-verify-the-pack-already-has-timestamp = pakiet ma już token znacznika czasu; aby go zastąpić, podaj --replace

engine-e-evidence-verify-not-attached-the-pack-with = nie dołączono: pakiet z tym tokenem nie przechodzi weryfikacji ({ $v1 })

engine-evidence-verify-the-pack-records-lab-attestation = pakiet zawiera poświadczenie laboratoryjne: { $operator } ({ $organisation }, { $setup }): { $v4 }

engine-e-evidence-verify-the-signature-file-does-not = plik podpisu nie kończy się znakiem nowego wiersza

engine-evidence-verify-signer-not-pinned-the-signature = podpisujący nie jest przypięty: podpis dowodzi, że pakiet jest nienaruszony względem klucza { $r }, który pakiet sam podaje. Porównaj ten odcisk z odciskiem otrzymanym od podpisującego albo podaj klucz.

engine-evidence-verify-range-is-not-inside-log = zakres { $start }..{ $end } nie mieści się w dzienniku o rozmiarze { $full_bytes } B

engine-evidence-verify-timestamp-token-states-its-imprint = token znacznika czasu podaje: { $gen_time }; jego odcisk: { $v2 } manifest.json. Podpisu urzędu znacznika czasu Kshana nie zweryfikowała: sprawdź go poleceniem `openssl ts -verify`.

engine-evidence-verify-timestamp-token-states-its-imprint-2 = token znacznika czasu podaje: { $gen_time }; jego odcisk: { $v2 } manifest.json; podpis urzędu znacznika czasu i łańcuch: { $v3 } względem podanych punktów zaufania.

## src/field_schema.rs

engine-e-field-schema-unit-is-the-empty-string = `unit` jest pustym ciągiem

engine-e-field-schema-provenance-is-outside-the-vocabulary = `provenance` { $prov_str } jest spoza słownika

## src/frugal.rs

engine-e-frugal-cost-bracket-must-be-finite = przedział kosztu musi być skończony, nieujemny, uporządkowany low≤nominal≤high i zawierać źródło

engine-e-frugal-coverage-fraction-and-availability-must = coverage_fraction i availability muszą być ułamkami w [0, 1]

## src/fusion/carrier_tc.rs

engine-e-fusion-carrier-tc-must-be-finite-and-got = { $name } musi być skończone i > 0, otrzymano: { $v }

engine-e-fusion-carrier-tc-must-be-finite-and-got-2 = { $name } musi być skończone i >= 0, otrzymano: { $v }

engine-e-fusion-carrier-tc-mask-deg-must-be-in = mask_deg musi należeć do [-90, 90), otrzymano: { $mask_deg }

engine-e-fusion-carrier-tc-constellation-has-no-satellites = konstelacja nie ma satelitów

engine-e-fusion-carrier-tc-max-sats-must-be-when = max_sats musi być >= 1, gdy jest ustawione

engine-e-fusion-carrier-tc-slip-satellite-out-of-range = satelita poślizgu { $sat } poza zakresem

## src/fusion/kfgins.rs

engine-e-fusion-kfgins-line = wiersz { $lineno }: { $e }

engine-e-fusion-kfgins-line-columns-at-least-expected = wiersz { $lineno }: kolumn: { $v }, oczekiwano co najmniej: { $min }

engine-e-fusion-kfgins-line-columns = wiersz { $v1 }: kolumn: { $v }

engine-e-fusion-kfgins-line-block-lists-are-not = wiersz { $lineno }: listy blokowe nie są obsługiwane

engine-e-fusion-kfgins-line-expected-key-value = wiersz { $lineno }: oczekiwano `key: value`

engine-e-fusion-kfgins-line-indented-key-without-parent = wiersz { $lineno }: klucz z wcięciem bez klucza nadrzędnego

engine-e-fusion-kfgins-line-only-one-level-of = wiersz { $lineno }: dozwolony tylko jeden poziom zagnieżdżenia

engine-e-fusion-kfgins-line-unterminated-flow-list = wiersz { $lineno }: niezamknięta lista liniowa

engine-e-fusion-kfgins-is-list-scalar-expected = `{ $k }` jest listą, oczekiwano skalara

engine-e-fusion-kfgins-missing = brak `{ $k }`

engine-e-fusion-kfgins-must-be-three-element-list = `{ $k }` musi być listą trójelementową

engine-e-fusion-kfgins-no-imu-sample-at-or = brak próbki IMU w starttime lub po nim

engine-e-fusion-kfgins-imu-time-not-increasing-at = czas IMU nie rośnie w { $t }

## src/fusion/pack.rs

engine-e-fusion-pack-filter-prior-must-be-finite = { $slot }.filter_prior.{ $name } musi być skończone i > 0, otrzymano: { $v }

engine-e-fusion-pack-tight-sigma-range-must-be = tight.sigma_range_m musi być skończone i > 0, otrzymano: { $sigma_range_m }

engine-e-fusion-pack-tight-mask-deg-must-be = tight.mask_deg musi należeć do [-90, 90), otrzymano: { $mask_deg }

## src/fusion/trajectory.rs

engine-e-fusion-trajectory-trajectory-csv-line-not-numbers = trajectory csv, wiersz { $v1 }: to nie liczby: { $line }

engine-e-fusion-trajectory-trajectory-csv-line-expected-10 = trajectory csv, wiersz { $v1 }: oczekiwano 10 kolumn, otrzymano: { $v }

engine-e-fusion-trajectory-trajectory-csv-line-time-does = trajectory csv, wiersz { $v1 }: czas nie rośnie

engine-e-fusion-trajectory-trajectory-csv-needs-at-least = trajectory csv wymaga co najmniej dwóch wierszy

engine-e-fusion-trajectory-trajectory-csv-covers-but-the = trajectory csv obejmuje { $rows } s, a scenariusz trwa { $v2 } s

## src/geometry.rs

engine-e-geometry-sky-site-lat-deg-must = sky: lat_deg miejsca musi należeć do [-90, 90], a każde pole musi być skończone

engine-e-geometry-sky-is-neither-gnss-preset = sky: „{ $name }” nie jest ani zestawem GNSS ({ $e_gnss }), ani zestawem LEO ({ $e_leo })

engine-e-geometry-sky-give-the-user-as = sky: podaj użytkownika jako `site` albo `user_ecef_m`, nie oba naraz

engine-e-geometry-sky-user-ecef-must-be = sky: user_ecef_m musi być skończone i nie może być środkiem Ziemi

engine-e-geometry-sky-satellite-azimuth-elevation-out = sky: satelita { $id }: azymut/elewacja poza zakresem

engine-e-geometry-sky-satellite-is-given-in = sky: satelita { $id } podany w ECEF; żądanie wymaga `site` albo `user_ecef_m`

engine-e-geometry-sky-satellite-ecef-position-not = sky: satelita { $id }: pozycja ECEF nie jest skończona

engine-e-geometry-sky-satellite-coincides-with-the = sky: satelita { $id } pokrywa się z użytkownikiem

engine-e-geometry-sky-satellite-give-az-deg = sky: satelita { $id }: podaj az_deg i el_deg albo ecef_m, i nic więcej

engine-e-geometry-sky-tle-is-bytes-the = sky: tle ma { $text } B; limit wynosi { $MAX_TLE_BYTES } (4 MiB)

engine-geometry-element-set-refused = zestaw elementów odrzucony: { $e }

engine-e-geometry-sky-epoch = sky: epoka: { $e }

engine-geometry-and-more = { "." }.. i { $more } więcej

engine-e-geometry-sky-give-systems-or-tle = sky: podaj `systems` albo `tle` (z `site`), albo `satellites`

engine-e-geometry-sky-tle-system-names-the = sky: tle_system nazywa satelity z `tle`; żądanie nie ma `tle`

engine-e-geometry-sky-mask-deg-must-be = sky: mask_deg musi należeć do [-90, 90), otrzymano: { $m }

engine-e-geometry-sky-systems-needs-site-or = sky: `systems` wymaga `site` (lub `user_ecef_m`), z którego się patrzy

engine-e-geometry-sky-time-must-be-finite = sky: time_s musi być skończone

engine-e-geometry-sky-system-asks-for-satellites = sky: system „{ $name }” żąda satelitów: { $asked }; żądanie mieści co najwyżej: { $MAX_SATELLITES }

engine-e-geometry-sky-more-than-satellites = sky: więcej niż { $MAX_SATELLITES } satelitów

engine-e-geometry-sky-tle-needs-site-or = sky: `tle` wymaga `site` (lub `user_ecef_m`), z którego się patrzy

engine-e-geometry-sky-more-than-satellites-above = sky: więcej niż { $MAX_SATELLITES } satelitów nad horyzontem

engine-e-geometry-sky-sigma-uere-must-be = sky: sigma_uere_m musi być dodatnie, otrzymano: { $sigma }

engine-e-geometry-sky-confidence-must-be-in = sky: confidence musi należeć do (0, 1), otrzymano: { $confidence }

engine-e-geometry-sky-more-than-systems-in = sky: więcej niż { $MAX_CLOCKS } systemów w widoku, każdy z własnym zegarem; zgrupuj satelity pod mniejszą liczbą etykiet `system` albo użyj clock = "common"

engine-e-geometry-sky-must-be-in-got = sky: n musi należeć do 1..={ $MAX_MC_SAMPLES }, otrzymano: { $n }

engine-e-geometry-sky-too-few-satellites-in = sky: za mało satelitów w widoku na wyznaczenie pozycji; brak chmury Monte Carlo

engine-e-geometry-sky = sky: { $e }

engine-geometry-pdop-hdop-vdop = PDOP { $pdop } HDOP { $hdop } VDOP { $vdop }

engine-geometry-tle-sky-at-not-measurement = niebo z TLE w { $e }, a nie pomiar

engine-e-geometry-invalid-sky-request-json = nieprawidłowe żądanie sky (JSON): { $e }

engine-e-geometry-invalid-sky-request-toml = nieprawidłowe żądanie sky (TOML): { $e }

engine-e-geometry-invalid-skyline-json = nieprawidłowa linia horyzontu (JSON): { $e }

engine-e-geometry-invalid-skyline-toml = nieprawidłowa linia horyzontu (TOML): { $e }

## src/glonass.rs

engine-e-glonass-bad-glonass-prn-in = błędny PRN GLONASS w { $head }

## src/gnss_navmsg/gal_fnav.rs

engine-e-gnss-navmsg-gal-fnav-page-type-is-not-encoded = typ strony { $pt } nie jest tu kodowany

engine-e-gnss-navmsg-gal-fnav-bits-expected = bitów: { $data }, oczekiwano: { $DATA_BITS }

engine-e-gnss-navmsg-gal-fnav-bits-expected-2 = bitów: { $p }, oczekiwano: { $PAGE_BITS }

engine-e-gnss-navmsg-gal-fnav-tail-bits-are-not-zero = bity końcowe nie są zerowe

engine-e-gnss-navmsg-gal-fnav-crc-24q-mismatch = niezgodność CRC-24Q

engine-e-gnss-navmsg-gal-fnav-page-type-is-not-decoded = typ strony { $pt } nie jest tu dekodowany

engine-e-gnss-navmsg-gal-fnav-symbols-expected = symboli: { $symbols }, oczekiwano: { $PAGE_SYMBOLS }

engine-e-gnss-navmsg-gal-fnav-synchronisation-pattern-not-found = nie znaleziono wzorca synchronizacji

engine-e-gnss-navmsg-gal-fnav-page-type-missing = brak typu strony { $t }

engine-e-gnss-navmsg-gal-fnav-iod-nav-of-page-type = IOD_nav typu strony { $t } różni się od typu strony 1

## src/gnss_navmsg/gal_inav.rs

engine-e-gnss-navmsg-gal-inav-no-galileo-field = brak pola Galileo { $name }

engine-e-gnss-navmsg-gal-inav-word-type-is-not-encoded = typ słowa { $wt } nie jest tu kodowany

engine-e-gnss-navmsg-gal-inav-bits-expected = bitów: { $word }, oczekiwano: { $WORD_BITS }

engine-e-gnss-navmsg-gal-inav-word-type-is-not-decoded = typ słowa { $wt } nie jest tu dekodowany

engine-e-gnss-navmsg-gal-inav-page-parts-must-be-120 = części strony muszą mieć 120 bitów

engine-e-gnss-navmsg-gal-inav-even-odd-flags-are-not = flagi parzysta/nieparzysta nie mają wartości 0, a potem 1

engine-e-gnss-navmsg-gal-inav-not-nominal-page-page-type = to nie jest strona nominalna (strona typu 1 jest stroną alarmową)

engine-e-gnss-navmsg-gal-inav-bits-expected-2 = bitów: { $part }, oczekiwano: { $PART_BITS }

engine-e-gnss-navmsg-gal-inav-symbols-expected = symboli: { $symbols }, oczekiwano: { $PART_SYMBOLS }

engine-e-gnss-navmsg-gal-inav-word-type-missing = brak typu słowa { $t }

engine-e-gnss-navmsg-gal-inav-iod-nav-of-word-type = IOD_nav typu słowa { $t } różni się od typu słowa 1

## src/gnss_navmsg/galileo.rs

engine-e-gnss-navmsg-galileo-record-is-system-not-galileo = rekord pochodzi z systemu { $system }, a nie z Galileo

## src/gnss_navmsg/gps_cnav.rs

engine-e-gnss-navmsg-gps-cnav-type-10-has-no-field = typ 10 nie ma pola { $name }

engine-e-gnss-navmsg-gps-cnav-type-11-has-no-field = typ 11 nie ma pola { $name }

engine-e-gnss-navmsg-gps-cnav-type-30-has-no-field = typ 30 nie ma pola { $name }

engine-e-gnss-navmsg-gps-cnav-cnav-body-has-bits-expected = treść CNAV ma bitów: { $body }, oczekiwano: 238

engine-e-gnss-navmsg-gps-cnav-prn-or-tow-count-out = PRN { $prn } lub licznik TOW { $tow_count } poza zakresem

engine-e-gnss-navmsg-gps-cnav-bits-expected = bitów: { $bits }, oczekiwano: { $MESSAGE_BITS }

engine-e-gnss-navmsg-gps-cnav-preamble-is-not-10001011 = preambuła nie jest równa 10001011

engine-e-gnss-navmsg-gps-cnav-message-type-is-not-decoded = typ komunikatu { $t } nie jest tu dekodowany

engine-e-gnss-navmsg-gps-cnav-need-type-10-and-type = potrzebny komunikat typu 10 i komunikat typu 11

## src/gnss_navmsg/mod.rs

engine-e-gnss-navmsg-at-lsb-does-not-fit = { $name }: { $value } przy LSB { $value2 } nie mieści się w { $bits } { $v4 } bitach

engine-e-gnss-navmsg-bits-layout-needs = bitów: { $bits }, układ wymaga: { $need }

engine-e-gnss-navmsg-no-field = brak pola { $name }

## src/gps_lnav.rs

engine-e-gps-lnav-at-scale-does-not-fit = { $value } przy skali 2^{ $scale_pow2 } nie mieści się w { $bits } { $v1 } bitach

engine-e-gps-lnav-no-value-for = brak wartości dla { $name }

## src/gravimeter.rs

engine-e-gravimeter-gravity-map-reference-model-gfc = gravity-map: model odniesienia „gfc” wymaga `gfc_path`

engine-e-gravimeter-gravity-map-cannot-read-gfc = gravity-map: nie można odczytać gfc_path { $path }: { $e }

engine-e-gravimeter-gravity-map-unknown-reference-model = gravity-map: nieznany model odniesienia `{ $other }` (użyj „egm2008” lub „gfc”)

engine-e-gravimeter-gravity-map-unknown-ellipsoid-use = gravity-map: nieznana elipsoida `{ $other }` (użyj „wgs84” lub „grs80”)

engine-e-gravimeter-gravity-map-map-error-mc = gravity-map: map_error_mc.realisations musi wynosić co najmniej 1

engine-e-gravimeter-gravity-map-map-error-mc-2 = gravity-map: map_error_mc.realisations jest ograniczone do 10000

## src/gravity_pds.rs

engine-e-gravity-pds-bad-real = błędna liczba rzeczywista '{ $t }'

engine-e-gravity-pds-bad-integer = błędna liczba całkowita '{ $t }'

engine-e-gravity-pds-empty-shadr-table = pusta tabela SHADR

engine-e-gravity-pds-shadr-header-has-fields-expected = nagłówek SHADR ma pól: { $f }, oczekiwano co najmniej 6

engine-e-gravity-pds-shadr-header-negative-degree-order = nagłówek SHADR: ujemny stopień/rząd albo nieznana normalizacja

engine-e-gravity-pds-shadr-normalization-state-only-fully = stan normalizacji SHADR { $normalization } (obsługiwany jest tylko pełne unormowanie, stan 1)

engine-e-gravity-pds-shadr-reference-longitude-latitude-must = referencyjna długość/szerokość geograficzna SHADR musi wynosić 0

engine-e-gravity-pds-non-physical-gm-must-be = niefizyczne GM (musi być skończone i dodatnie)

engine-e-gravity-pds-non-physical-reference-radius-must = niefizyczny promień odniesienia (musi być skończony i dodatni)

engine-e-gravity-pds-shadr-record-fields = rekord SHADR { $v1 }: pól: { $f }

engine-e-gravity-pds-shadr-record-bad = rekord SHADR { $v1 }: błędne (n, m) = ({ $n }, { $m })

engine-e-gravity-pds-shadr-record-non-finite-coefficient = rekord SHADR { $v1 }: nieskończony współczynnik

engine-e-gravity-pds-no-shadr-coefficient-records = brak rekordów współczynników SHADR

engine-e-gravity-pds-shadr-table-incomplete-missing = tabela SHADR niekompletna: brak (n, m) = ({ $n }, { $m })

## src/gravity_sh.rs

engine-e-gravity-sh-missing-earth-gravity-constant-gravity = brak earth_gravity_constant / gravity_constant

engine-e-gravity-sh-missing-radius = brak radius

engine-e-gravity-sh-non-physical-earth-gravity-constant = niefizyczne earth_gravity_constant (musi być skończone i dodatnie)

engine-e-gravity-sh-non-physical-radius-must-be = niefizyczny radius (musi być skończony i dodatni)

engine-e-gravity-sh-no-gfc-coefficient-lines = brak wierszy współczynników gfc

engine-e-gravity-sh-read-error = błąd odczytu: { $e }

engine-e-gravity-sh-line-norm-is-not-supported = wiersz { $lineno }: norm { $v } nie jest obsługiwane (tylko fully_normalized)

engine-gravity-sh-line-bad = wiersz { $lineno }: błędne { $what }

engine-e-gravity-sh-line-degree-above-the-declared = wiersz { $lineno }: stopień { $n } powyżej zadeklarowanego max_degree { $dm }

engine-e-gravity-sh-line-order-above-degree = wiersz { $lineno }: rząd { $m } powyżej stopnia { $n }

engine-e-gravity-sh-line-time-variable-term-is = wiersz { $lineno }: wyraz zmienny w czasie `{ $key }` nie jest obsługiwany (tylko modele statyczne)

engine-e-gravity-sh-missing-end-of-head = brak end_of_head

## src/gse_sim.rs

engine-e-gse-sim-step-must-be-positive-got = step_s musi być dodatnie, otrzymano: { $step_s }

engine-e-gse-sim-duration-must-be-positive-got = duration_s musi być dodatnie, otrzymano: { $duration_s }

## src/holdover_test.rs

engine-e-holdover-test-the-record-holds-non-finite = rekord zawiera nieskończony błąd czasu

engine-e-holdover-test-unknown-mask-expected-one-of = nieznana maska { $id }; oczekiwano jednej z: { $masks }

engine-e-holdover-test-every-budget-max-abs-te = każde max_abs_te_ns budżetu musi być skończone i dodatnie

engine-e-holdover-test-gnss-removed-lies-outside-the = gnss_removed_s = { $gnss_removed_s } leży poza rekordem ({ $t0_s } do { $t_end } s na jego własnej osi czasu)

engine-e-holdover-test-gnss-restored-must-be-later = gnss_restored_s = { $r } musi być późniejsze niż gnss_removed_s ({ $gnss_removed_s }) i nie może wykraczać poza koniec rekordu ({ $t_end } s)

engine-e-holdover-test-the-holdover-step-holds-no = krok holdover nie zawiera próbki

engine-holdover-test-the-record-has-no-step = rekord nie ma kroku { $step }: GNSS usunięto przy jego pierwszej próbce

engine-holdover-test-the-step-has-samples-the = krok { $step } ma próbek: { $te_ns }; estymatory potrzebują co najmniej 13

engine-e-holdover-test-step-with-mask-has-no = krok z maską nie ma krzywej

engine-e-holdover-test-cannot-read-csv-path = nie można odczytać csv_path { $path }: { $e }

engine-holdover-test-holdover-test-holdover-max-te = holdover-test: holdover { $hold } s, max|TE| { $max_abs } ns; { $masks } (MODELLED, zmierzone względem maski)

## src/hybrid.rs

engine-e-hybrid-coupled-sigma-pr-must-be = coupled.sigma_pr_m musi być skończone i > 0, otrzymano: { $sigma_pr_m }

engine-e-hybrid-coupled-ba-must-be-and = coupled.q_ba musi być >= 0, a coupled.bias_var > 0

## src/hybrid_integrity.rs

engine-hybrid-integrity-refused-the-two-legs-are = REFUSED: oba tory nie mają wspólnego czasu uśredniania. Tor optyczny akumuluje w integration_s = { $integration_s } s; szerokość pasma szumów pętli toru RF B_L = { $dll_bandwidth_hz } Hz uśrednia w 1/(2*B_L) = { $rf_equivalent_averaging_s } s. Stosunek dwóch sigm wziętych przy różnych czasach uśredniania nie jest porównaniem, więc żadnego nie podaje się. Usuń nadpisanie rf_dll_bandwidth_hz (wtedy domyślnie jest 1/(2*integration_s)) albo ustaw je na { $v4 } Hz.

engine-hybrid-integrity-refused-leg-is-not-usable = REFUSED: tor nie ma użytecznej dodatniej skończonej sigmy (optyczny { $opt_sigma_range_m } m, RF { $rf_sigma_range_m } m), więc nie tworzy się stosunku.

engine-e-hybrid-integrity-unknown-rf-band-expected-ka = nieznane rf_band '{ $other }' (oczekiwano s|x|ka)

engine-e-hybrid-integrity-must-be-finite = { $name } musi być skończone

engine-e-hybrid-integrity-rf-other-losses-db-must = rf_other_losses_db musi być skończone i >= 0

## src/impairment_eval.rs

engine-e-impairment-eval-target-pfa-must-be-in = target_pfa musi należeć do [0, 1]

engine-e-impairment-eval-per-class-must-be = n_per_class musi być >= 1

engine-e-impairment-eval-unknown-detector-energy-agc-sqm = nieznany detektor '{ $other }' (energy|agc|sqm|parity|fused)

## src/inertial/coast.rs

engine-e-inertial-coast-unknown-imu-grade-expected-one = nieznane imu_grade { $other }; oczekiwano jednego z: navigation, tactical, industrial, consumer

engine-e-inertial-coast-unknown-combination-expected-one-of = nieznane combination { $other }; oczekiwano jednego z: rss, linear-sum, det-sum-stoch-rss

engine-e-inertial-coast-unknown-trn-fix-mode-expected = nieznane trn_fix_mode { $other }; oczekiwano jednego z: none, position-only, full-reset

engine-e-inertial-coast-must-be-finite-and-non = { $name } musi być skończone i nieujemne (otrzymano: { $v })

engine-e-inertial-coast-crossing-thresholds-must-name-at = crossing_thresholds_m musi wskazywać co najmniej jeden próg

engine-e-inertial-coast-crossing-thresholds-entries-must-be = wpisy crossing_thresholds_m muszą być skończone i dodatnie (otrzymano: { $t })

engine-e-inertial-coast-grades-must-name-at-least = grades musi wskazywać co najmniej jedną klasę IMU

engine-e-inertial-coast-speed-must-be-finite-and = speed_m_s musi być skończone i nieujemne (otrzymano: { $v })

engine-e-inertial-coast-ref-accel-s2-must-be = ref_accel_m_s2 musi być skończone i nieujemne (otrzymano: { $a })

engine-e-inertial-coast-latitude-deg-must-be-finite = latitude_deg musi być skończone i mieścić się w (-89, 89) (otrzymano: { $lat })

engine-e-inertial-coast-height-must-be-within-1000 = height_m musi mieścić się w [-1000, 100000] (otrzymano: { $h })

engine-e-inertial-coast-mission-duration-must-be-positive = mission_duration_s musi być dodatnie

engine-e-inertial-coast-drift-band-must-satisfy-lo = pasmo dryfu musi spełniać 0 < lo < hi (otrzymano: lo={ $lo }, hi={ $hi })

engine-e-inertial-coast-serializing-ins-trn-coast-result = serializacja wyniku ins-trn-coast: { $e }

engine-inertial-coast-ins-trn-coast-imu-combination = ins-trn-coast | IMU { $grade }, { $speed } m/s, kombinacja { $comb } | { $heads } | TRN { $mode } szczyt { $peak_error_m } m w { $mission } s

## src/inertial/mod.rs

engine-inertial-va-derived-from-cold-atom = { $provenance } (q_va wyprowadzone z fizyki interferometru zimnych atomów)

## src/inline_only.rs

engine-e-inline-only-scenario-is-bytes-over-the = scenariusz ma { $toml_text } B, powyżej limitu { $max_bytes } B

engine-e-inline-only-the-scenario-kind-reads-its = rodzaj scenariusza `{ $kind }` czyta dane z plików na hoście, więc ten interfejs go nie uruchamia; użyj wiersza poleceń `kshana`

engine-e-inline-only-the-field-names-file-this = pole `{ $k }` wskazuje plik: ten interfejs przyjmuje tylko treść wbudowaną

## src/interference_map/adsb.rs

engine-e-interference-map-adsb-gzip = gzip: { $e }

engine-e-interference-map-adsb-trace-json = trace JSON: { $e }

## src/interference_map/api.rs

engine-e-interference-map-api-unknown-dataset-approved-or-custom = nieznany zbiór danych `{ $key }`; zatwierdzone: { $v1 }, albo zbiór własny

engine-e-interference-map-api-dataset-is-data-but-the = zbiór danych `{ $key }` zawiera dane typu { $kind }, a rodzaj wejścia to { $kind2 }

engine-e-interference-map-api-is-not-yyyy-mm-dd = { $name } nie jest datą w formacie YYYY-MM-DD

## src/interference_map/cli.rs

engine-e-interference-map-cli-unknown-option = nieznana opcja `{ $a }`

engine-e-interference-map-cli-expected-positional-argument-got = oczekiwano argumentów pozycyjnych: { $positionals }, otrzymano: { $pos }

engine-e-interference-map-cli-cannot-read = nie można odczytać { $path }: { $e }

engine-e-interference-map-cli-dataset-custom-needs = --dataset custom wymaga { $n }

engine-e-interference-map-cli-already-exists-kshana-does-not = { $existing } już istnieje; Kshana nie nadpisuje map. Usuń go albo wybierz inny katalog --out

engine-interference-map-cli-note-cell-deg-is-not = uwaga: --cell-deg { $cell_deg } nie jest wstępnie zarejestrowanym rozmiarem komórki ({ $PREREGISTERED_CELL_DEG }); mapy to zaznaczają

engine-e-interference-map-cli-cannot-create = nie można utworzyć { $out }: { $e }

engine-interference-map-cli-wrote-cells-published-flagged = zapisano { $path }: opublikowane komórki: { $cells }, oznaczone: { $n_deg }

engine-interference-map-cli-no-usable-rows-nothing-written = brak użytecznych wierszy: nic nie zapisano

engine-e-interference-map-cli-unknown-subcommand = nieznane podpolecenie `{ $other }`

engine-e-interference-map-cli-the-downloaded-file-sha-256 = SHA-256 pobranego pliku ({ $got }) nie zgadza się z przypiętą wartością ({ $expected }); plik odrzucono

engine-e-interference-map-cli-cannot-write = nie można zapisać { $dest }: { $e }

engine-e-interference-map-cli-curl-was-not-found-on = nie znaleziono curl w PATH. Zainstaluj curl albo pobierz { $NATURAL_EARTH_LAND_URL } samodzielnie i sprawdź, czy jego SHA-256 to { $NATURAL_EARTH_LAND_SHA256 }

engine-e-interference-map-cli-cannot-run-curl = nie można uruchomić curl: { $e }

engine-interference-map-cli-wrote-natural-earth-land-polygons = zapisano { $out }: wielokąty lądów Natural Earth, SHA-256 zweryfikowano (domena publiczna, https://www.naturalearthdata.com/about/terms-of-use/)

engine-e-interference-map-cli-no-trace-full-files-under = brak plików trace_full_* w { $path }

engine-e-interference-map-cli-cannot-read-2 = nie można odczytać { $spec }: { $e }

engine-e-interference-map-cli-is-not-yyyy-mm-dd = { $n } nie jest datą w formacie YYYY-MM-DD

engine-e-interference-map-cli-bad-map-date = { $f }: błędna data mapy

engine-e-interference-map-cli-cannot-write-2 = nie można zapisać { $out }: { $e }

engine-interference-map-cli-route-length-km = długość trasy { $rows } km

engine-interference-map-cli-caveats-degraded-cell-does-not = Zastrzeżenia: komórka o pogorszonym stanie nie wskazuje zakłóceń jako przyczyny; komórki nieobserwowane nie są dowodem, że trasa jest czysta; to nie jest prognoza.

## src/interference_map/land.rs

engine-e-interference-map-land-land-polygons-invalid-json = wielokąty lądów: nieprawidłowy JSON: { $e }

## src/interference_map/mod.rs

engine-e-interference-map-missing-required-column = brak wymaganej kolumny `{ $name }`

engine-e-interference-map-cannot-read-input = nie można odczytać wejścia: { $e }

## src/interference_map/observatory.rs

engine-e-interference-map-observatory-day-is-not-date-yyyy = --day `{ $day }` nie jest datą (YYYY-MM-DD)

engine-e-interference-map-observatory-delay-hours-must-be-or = --delay-hours musi wynosić { $MIN_DELAY_HOURS } lub więcej: obserwatorium nie publikuje wcześniej

engine-e-interference-map-observatory-cell-deg-must-be-or = --cell-deg musi wynosić { $MIN_CELL_DEG } lub więcej (grubsze komórki): obserwatorium publikuje tylko grube komórki

engine-e-interference-map-observatory-is-not-publishable-yet-its = { $day } nie nadaje się jeszcze do publikacji: jego produkt jest wydawany nie wcześniej niż { $fmt_utc } ({ $delay_hours } h po końcu dnia)

engine-interference-map-observatory-kshana-observatory-ads = KSHANA OBSERVATORY  ADS-B  { $date }

engine-interference-map-observatory-deg-cells-utc-day-not = KOMÓRKI { $trim_deg } DEG  DZIEŃ UTC  NOT OBSERVED NIE ZNACZY CZYSTE  BRAK PRZYPISANEJ PRZYCZYNY

engine-interference-map-observatory-source-licence = ŹRÓDŁO { $dataset }  LICENCJA { $dataset2 }

## src/interference_map/observatory.rs

engine-interference-map-observatory-degraded-not-degraded-not-observed = { $summary } DEGRADED  { $summary2 } NOT DEGRADED  { $summary3 } NOT OBSERVED (OPUBLIKOWANE KOMÓRKI)

engine-interference-map-observatory-kshana-observatory-ads-navigation-accuracy = obserwatorium Kshana, mapa dokładności nawigacji ADS-B, { $date }

engine-e-interference-map-observatory-cannot-create-kshana-does-not = nie można utworzyć { $path } (Kshana nie nadpisuje produktów): { $e }

engine-e-interference-map-observatory-the-input-has-no-usable = wejście nie zawiera użytecznego raportu z dnia { $day } (znalezione dni: { $days })

engine-e-interference-map-observatory-already-exists-kshana-does-not = { $path } już istnieje; Kshana nie nadpisuje produktów

engine-interference-map-observatory-cells-published-degraded-incident = komórki opublikowane: { $p }, pogorszone: { $p2 }, incydenty: { $p3 }

engine-interference-map-observatory-rows-replayed-under-variants = wiersze odtworzone w wariantach: { $rows } wierszy, { $variants } wariantów: { $out }

## src/interference_map/route.rs

engine-e-interference-map-route-map-is-not-valid-json = mapa nie jest prawidłowym JSON: { $e }

engine-e-interference-map-route-route-invalid-json = trasa: nieprawidłowy JSON: { $e }

engine-e-interference-map-route-route-line-is-not-lat = trasa: wiersz { $v1 } nie ma postaci `lat,lon`

## src/interop/czml.rs

engine-interop-czml-kshana-export-epoch-moving-objects = Eksport Kshana { $v1 }. Epoka: { $epoch_note }. Obiekty ruchome: GCRS (referenceFrame INERTIAL), metry, sekundy po epoce. Stanowiska stałe: WGS 84 związany z Ziemią (referenceFrame FIXED), metry.

engine-interop-czml-position-gcrs-metres = { $description } ({ $role }). Pozycja: GCRS, metry.

engine-interop-czml-latitude-deg-longitude-deg-height = { $description } ({ $role }). Szerokość geograficzna { $lat_deg } deg, długość geograficzna { $lon_deg } deg, wysokość { $h_m } m nad elipsoidą WGS 84. Pozycja: układ związany z Ziemią, metry.

engine-interop-czml-radius-along-the-ground = { $description }. Promień { $radius_m } m wzdłuż gruntu.

engine-interop-czml-untimed-wgs-84-longitude-and = { $description }. Bez czasu: długość i szerokość geograficzna WGS 84 w stopniach, przyciągnięte do gruntu.

## src/interop/geojson.rs

engine-interop-geojson-earth-fixed-positions-multilinestring-is = { $description }. Pozycje w układzie związanym z Ziemią; MultiLineString jest przecinany na antypołudniku, a times_utc wymienia wtedy tylko próbki oryginalne.

engine-interop-geojson-kshana-export-epoch = Eksport Kshana { $v1 }. Epoka: { $epoch_note }.

engine-e-interop-geojson-invalid-geojson = nieprawidłowy GeoJSON: { $e }

engine-e-interop-geojson-linestring-has-no-coordinates-array = LineString nie ma tablicy coordinates

engine-e-interop-geojson-an-rfc-7946-linestring-needs = LineString według RFC 7946 wymaga dwóch lub więcej pozycji

engine-interop-geojson-position-is-not-an-array = pozycja { $i } nie jest tablicą dwóch lub trzech liczb

engine-interop-geojson-position-longitude-is-not-number = pozycja { $i }: długość geograficzna nie jest liczbą

engine-interop-geojson-position-latitude-is-not-number = pozycja { $i }: szerokość geograficzna nie jest liczbą

engine-e-interop-geojson-position-longitude-is-outside-180 = pozycja { $i }: długość geograficzna { $lon } jest poza [-180, 180] (w GeoJSON długość geograficzna jest pierwsza)

engine-e-interop-geojson-position-latitude-is-outside-90 = pozycja { $i }: szerokość geograficzna { $lat } jest poza [-90, 90] (w GeoJSON długość geograficzna jest pierwsza)

engine-e-interop-geojson-track-needs-two-or-more = ślad wymaga dwóch lub więcej punktów trasy

engine-e-interop-geojson-the-route-spans-more-than = trasa obejmuje więcej niż 180 stopni długości geograficznej; rodzaje śladów przesuwają się w zwykłych stopniach i nie mogą przekroczyć antypołudnika

engine-e-interop-geojson-position-is-deg-from-an = pozycja { $worst } leży { $worst2 } deg od równomiernie rozmieszczonego prostego śladu (tolerancja { $tol_deg } deg); rodzaje śladów lecą po start + i*step, więc podaj równomiernie rozmieszczone pozycje na prostej albo tylko oba końce

engine-e-interop-geojson-route-applies-to-the-kinds = trasa dotyczy rodzajów, które lecą po śladzie punktów trasy (terrain-nav, terrain-slam, gravity-map, combined-altpnt); `{ $k }` nie przyjmuje wejścia trajektorii

engine-e-interop-geojson-scenario-toml-is-not-table = TOML scenariusza nie jest tabelą

engine-e-interop-geojson-cannot-serialise-scenario = nie można serializować scenariusza: { $e }

## src/interop/mod.rs

engine-e-interop-unknown-export-format-expected-one = nieznany format eksportu '{ $other }'; oczekiwano jednego z: czml, kml, geojson, stk, sigmf, all lub list

engine-e-interop-member = element { $label }: { $e }

engine-interop-the-scenario-could-not-be = nie można wyeksportować scenariusza: { $m }

engine-e-interop-invalid-spectrum-scenario = nieprawidłowy scenariusz spectrum: { $e }

## src/interop/scene.rs

engine-e-interop-scene-objects-samples-is-more-than = { $items } obiektów x { $times } próbek, więcej niż zapisuje eksport ({ $MAX_SAMPLES })

engine-e-interop-scene-invalid-scenario = nieprawidłowy scenariusz { $kind }: { $e }

engine-interop-scene-jammer-dbw-transmit-power-dbi = zagłuszarka { $jammer_type }, moc nadawania { $power_dbw } dBW, zysk anteny { $gain_dbi } dBi

engine-interop-scene-from-the-jamming-kind-link = { $what }; { $r } m, z równań łącza rodzaju jamming przy zagłuszarce na horyzoncie odbiornika i tłumieniu w wolnej przestrzeni

engine-interop-scene-the-chain-pass-stage = { $epoch_note } (etap [pass] łańcucha)

engine-interop-scene-circular-orbit-km-altitude-deg = orbita kołowa, wysokość { $altitude_km } km, inklinacja { $inclination_deg } deg (średnie elementy SGP4 na początku okna, tak jak propaguje je rodzaj passes)

engine-interop-scene-ground-station-deg-elevation-mask = stacja naziemna, maska elewacji { $mask_deg } deg

engine-interop-scene-gcrs-and-earth-fixed-states = { $source }; stany GCRS i w układzie związanym z Ziemią są własnym wynikiem rodzaju ephemeris (UT1 i ruch bieguna tak, jak ustawia je scenariusz)

engine-interop-scene-static-scene-the-kind-flies = scena statyczna: rodzaj { $kind } leci po śladzie punktów trasy bez czasu

engine-interop-scene-true-track-flown-gps-denied = prawdziwy ślad przebyty bez GPS: punkty trasy: { $track }, od start_lat_deg/start_lon_deg w krokach step_lat_deg/step_lon_deg

engine-e-interop-scene-has-no-scene = `{ $kind }` nie ma sceny

engine-e-interop-scene-missing-numeric = brak liczby `{ $k }`

engine-e-interop-scene-missing-integer-waypoints = brak liczby całkowitej `waypoints`

engine-e-interop-scene-waypoints-is-outside-1000000 = waypoints = { $n } jest poza 1..=1000000

engine-interop-scene-walker-at-km-deg-inclination = Walker { $w }/{ $planes }/{ $phasing_f } na wysokości { $altitude_km } km, inklinacja { $inclination_deg } deg (SGP4)

engine-interop-scene-the-scenario-gives-no-epoch = scenariusz nie podaje `epoch`; t = 0 to { $epoch }, najwcześniejsza epoka w danych własnych satelitów (epoka TLE, efemeryd transmitowanych lub SP3). Każdy satelita jest propagowany od własnej epoki, a rozpiętość tych epok wynosi { $spread_h } h: znaczniki czasu wynikają z założenia silnika, że każdy satelita zaczyna w t = 0, a każda pozycja jest obracana do układów GCRS i związanego z Ziemią w chwili właściwej temu satelicie. Eksporty SP3 i OEM oznaczają natomiast t = 0 jako 2000-01-01T00:00:00Z

engine-interop-scene-the-scenario-gives-no-epoch-2 = scenariusz nie podaje `epoch`; t = 0 to { $epoch }, epoka w danych własnych satelitów (epoka TLE, efemeryd transmitowanych lub SP3). Eksporty SP3 i OEM oznaczają natomiast t = 0 jako 2000-01-01T00:00:00Z

engine-e-interop-scene-objects-samples-is-more-than-2 = { $satellites } obiektów x { $times_s } próbek, więcej niż zapisuje eksport ({ $MAX_SAMPLES })

engine-interop-scene-user-moving-the-kind-constant = użytkownik { $user_environment }, w ruchu (stała prędkość i kurs rodzaju)

engine-interop-scene-user-receiver = użytkownik { $user_environment } (odbiornik)

engine-interop-scene-user-orbit-km-altitude-deg = orbita użytkownika, wysokość { $altitude_km } km, inklinacja { $inclination_deg } deg (keplerowska{ $v3 })

## src/interop/stk.rs

engine-e-interop-stk-no-moving-object = brak obiektu ruchomego { $index }

engine-interop-stk-kshana-export-object = # Eksport Kshana { $v1 }: { $scene }, obiekt { $id } ({ $role }){ "\u000A" }

## src/interop/testbench.rs

engine-interop-testbench-jammer-dbw-transmit-power-dbi = zagłuszarka { $jammer_type }, moc nadawania { $power_dbw } dBW, zysk anteny { $gain_dbi } dBi (parametr budżetu łącza scenariusza, a nie sygnał)

engine-e-interop-testbench-has-no-vehicle-trajectory-to = `{ $other }` nie ma trajektorii pojazdu do wyeksportowania; eksport do stanowiska testowego obejmuje rodzaje gnss-ins, jamming i gnss-sim

engine-e-interop-testbench-empty-motion-csv = pusty CSV ruchu

engine-e-interop-testbench-motion-csv-header-is-not = nagłówek CSV ruchu nie ma oczekiwanych kolumn: { $head }

engine-e-interop-testbench-row-fields-expected = wiersz { $v1 }: pól: { $f }, oczekiwano: { $motion_columns }

engine-e-interop-testbench-row-column-is-not-number = wiersz { $v1 }: kolumna { $motion_columns } nie jest liczbą

engine-e-interop-testbench-line-no = wiersz { $v1 }: brak `$`

engine-e-interop-testbench-line-no-checksum = wiersz { $v1 }: brak sumy kontrolnej

engine-e-interop-testbench-line-bad-checksum-field = wiersz { $v1 }: błędne pole sumy kontrolnej

engine-e-interop-testbench-line-checksum-mismatch = wiersz { $v1 }: niezgodność sumy kontrolnej

engine-e-interop-testbench-line-short-gga = wiersz { $v1 }: za krótki GGA

engine-interop-testbench-line-bad-latitude = wiersz { $v1 }: błędna szerokość geograficzna

engine-interop-testbench-line-bad-longitude = wiersz { $v1 }: błędna długość geograficzna

engine-e-interop-testbench-line-bad-altitude = wiersz { $v1 }: błędna wysokość

engine-e-interop-testbench-line-bad-separation = wiersz { $v1 }: błędna separacja

engine-e-interop-testbench-line-short-rmc = wiersz { $v1 }: za krótki RMC

engine-e-interop-testbench-line-rmc-with-no-preceding = wiersz { $v1 }: RMC bez poprzedzającego GGA

engine-e-interop-testbench-line-gga-and-rmc-times = wiersz { $v1 }: czasy GGA i RMC różnią się

engine-e-interop-testbench-line-bad-speed = wiersz { $v1 }: błędna prędkość

engine-e-interop-testbench-line-bad-course = wiersz { $v1 }: błędny kurs

engine-e-interop-testbench-line-bad-time-or-date = wiersz { $v1 }: błędny czas lub data

engine-e-interop-testbench-gga-with-no-following-rmc = GGA bez następującego RMC

engine-e-interop-testbench-waypoint-file-needs-at-least = plik punktów trasy wymaga co najmniej dwóch próbek

engine-e-interop-testbench-the-sample-step-is-not = krok próbkowania { $step } s nie jest całkowitą liczbą milisekund

engine-e-interop-testbench-the-samples-are-not-equally = próbki nie są rozmieszczone równomiernie: przedział { $v1 } wynosi { $dt } s, pierwszy wynosi { $step } s

engine-e-interop-testbench-empty-waypoint-file = pusty plik punktów trasy

engine-e-interop-testbench-waypoint-not-three-numbers = punkt trasy { $v1 }: to nie trzy liczby

engine-e-interop-testbench-waypoint-fields-expected = punkt trasy { $v1 }: pól: { $f }, oczekiwano 3

engine-e-interop-testbench-events-csv-header-is-not = nagłówek CSV zdarzeń nie ma postaci label,kind,onset_s,end_s,description

engine-e-interop-testbench-event-row-expected-fields = wiersz zdarzenia { $v1 }: oczekiwano 5 pól

engine-e-interop-testbench-event-row-unknown-kind = wiersz zdarzenia { $v1 }: nieznany rodzaj { $f }

engine-e-interop-testbench-event-row-bad-onset = wiersz zdarzenia { $v1 }: błędny początek

engine-e-interop-testbench-event-row-bad-end = wiersz zdarzenia { $v1 }: błędny koniec

engine-interop-testbench-no-waypoints-txt-written = nie zapisano .waypoints.txt: { $e }

## src/interop/time.rs

engine-interop-time-not-utc-time-yyyy-mm = to nie jest czas UTC `YYYY-MM-DDTHH:MM:SS`: { $why }: { $text }

## src/ionex.rs

engine-e-ionex-missing = brak: { $what }

engine-e-ionex-bad-number-in = { $what }: błędna liczba w { $col }

engine-e-ionex-two-digit-year = { $what }: rok dwucyfrowy { $year }

engine-e-ionex-no-end-of-header = brak END OF HEADER

engine-e-ionex-height-dependent-ionex-maps-are = mapy IONEX zależne od wysokości (3-D) nie są obsługiwane

engine-e-ionex-zero-grid-step = zerowy krok siatki

engine-e-ionex-grid-needs-at-least-nodes = siatka wymaga co najmniej 2 x 2 węzłów

engine-e-ionex-map-no = mapa { $index }: brak { $end_label }

engine-e-ionex-map-band-latitude-header-grid = mapa { $index }: pas { $band } szerokość geograficzna { $band_lat }, siatka nagłówka { $want }

engine-e-ionex-map-band-longitudes-differ = mapa { $index }: długości geograficzne pasa { $band } różnią się

engine-e-ionex-map-band-truncated = mapa { $index }: pas { $band } obcięty

engine-e-ionex-map-bands-header-grid-has = mapa { $index }: pasów: { $band }, siatka nagłówka ma: { $n_lat }

engine-e-ionex-map-no-epoch-of-current = mapa { $index }: brak EPOCH OF CURRENT MAP

engine-e-ionex-tec-maps-header-of-maps = map TEC: { $tec_maps }, nagłówek # OF MAPS IN FILE { $n_maps }

engine-e-ionex-tec-map-epochs-not-increasing = epoki map TEC nie rosną

## src/iq/acq.rs

engine-e-iq-acq-hz-does-not-hold-whole = { $fs_hz } Hz nie daje całkowitej liczby próbek na okres { $code } ({ $spc } próbek)

engine-e-iq-acq-coherent-periods-and-noncoherent-must = coherent_periods i noncoherent muszą być dodatnie

engine-e-iq-acq-stream-ended-after-of-samples = strumień zakończył się po { $got } z { $needed } próbek

engine-e-iq-acq-cfar-reference-cells-must-be = komórki odniesienia CFAR muszą być parzyste i co najmniej 2 (otrzymano: { $n })

engine-e-iq-acq-cfar-stride-must-be-at = krok CFAR musi wynosić co najmniej 1 opóźnienie

engine-e-iq-acq-cfar-per-cell-pfa-must = Pfa na komórkę w CFAR musi leżeć w (0, 1) (otrzymano: { $pfa_cell })

engine-e-iq-acq-cfar-window-reaches-lags-each = okno CFAR sięga { $reach } opóźnień z każdej strony, za szeroko dla okresu o { $samples_per_period } opóźnieniach

## src/iq/acq_surface.rs

engine-e-iq-acq-surface-unknown-surface-format-expected-csv = nieznany format powierzchni { $s }: oczekiwano csv, json lub bin

engine-e-iq-acq-surface-the-surface-would-hold-cells = powierzchnia miałaby komórek: { $spc_cells } (limit { $MAX_SURFACE_CELLS }): zwiększ krok Dopplera lub zawęź zakres Dopplera

engine-e-iq-acq-surface-surface-header = nagłówek powierzchni: { $e }

engine-e-iq-acq-surface-surface-schema-expected = schemat powierzchni { $schema }; oczekiwano { $SURFACE_SCHEMA }

engine-e-iq-acq-surface-surface-body = treść powierzchni: { $e }

## src/iq/campaign/conditions.rs

engine-e-iq-campaign-conditions-recording-format-and-sample-rate = nagranie '{ $id }': format i sample_rate_hz muszą być podane razem

engine-e-iq-campaign-conditions-test-conditions-json = warunki testu (JSON): { $e }

engine-e-iq-campaign-conditions-test-conditions-toml = warunki testu (TOML): { $e }

engine-e-iq-campaign-conditions-events-from-sigmf-needs-sigmf = { $path }: events_from_sigmf wymaga nagrania SigMF (otrzymano: { $rec })

engine-e-iq-campaign-conditions-sigmf-metadata = metadane SigMF: { $e }

engine-e-iq-campaign-conditions-sigmf-metadata-global-core-sample = metadane SigMF: brak global core:sample_rate

engine-iq-campaign-conditions-core-sample-start-is-missing = { $at }: brak core:sample_start

engine-iq-campaign-conditions-no-core-sample-count-and = { $at }: brak core:sample_count i brak punktów mocy, które zakończyłyby zdarzenie

engine-e-iq-campaign-conditions-kshana-test-event = { $at }: kshana:test_event: { $e }

engine-e-iq-campaign-conditions-schema-must-be-got = schema musi mieć wartość „{ $SCHEMA }” (otrzymano „{ $schema }”)

engine-e-iq-campaign-conditions-recording-id-must-not-be = recording.id nie może być puste

engine-e-iq-campaign-conditions-recording-settle-must-be-finite = recording.settle_s musi być skończone i >= 0

engine-e-iq-campaign-conditions-recording-sha256-must-be-64 = recording.sha256 musi mieć 64 cyfry szesnastkowe

engine-e-iq-campaign-conditions-recording-kind-must-be-iq = recording.kind musi mieć wartość „iq” lub „receiver-log” (otrzymano „{ $k }”)

engine-e-iq-campaign-conditions-at-least-one-expected-group = wymagana jest co najmniej jedna grupa [[expected]]

engine-e-iq-campaign-conditions-ids-must-not-be-empty = { $at }: ids nie może być puste

engine-e-iq-campaign-conditions-duplicate-id = { $at }: zduplikowane id

engine-e-iq-campaign-conditions-offset-must-be-after-onset = { $at }: offset_s musi być po onset_s

engine-e-iq-campaign-conditions-affects-must-be-all-or = { $at }: affects musi mieć wartość „all” albo listę id

engine-e-iq-campaign-conditions-affects-id-is-not-in = { $at }: id w affects { $bad } nie występuje w [[expected]]

engine-e-iq-campaign-conditions-must-be-positive = { $at }: q musi być dodatnie

engine-e-iq-campaign-conditions-power-points-must-not-be = { $at }: power.points nie może być puste

engine-e-iq-campaign-conditions-power-points-must-be-in = { $at }: power.points musi być w kolejności czasu

engine-e-iq-campaign-conditions-power-points-must-be-finite = { $at }: power.points musi być skończone

engine-e-iq-campaign-conditions-power-quantity-jammer-dbm-needs = { $at }: power.quantity = "jammer_dbm" wymaga reference_signal_dbm

engine-e-iq-campaign-conditions-events-and-overlap-on-shared = zdarzenia '{ $id }' i '{ $id2 }' nakładają się na wspólnym satelicie

## src/iq/campaign/detect.rs

engine-e-iq-campaign-detect-monitors-detect-grace-must-be = monitors.detect_grace_s musi być >= 0

engine-e-iq-campaign-detect-monitors-roc-window-must-be = monitors.roc_window_s musi być dodatnie

## src/iq/campaign/runner.rs

engine-e-iq-campaign-runner-recording-sha-256-does-not = nagranie '{ $id }': SHA-256 { $sha } nie zgadza się z podanym { $want }

engine-e-iq-campaign-runner-runs-jsonl = runs.jsonl: { $e }

## src/iq/campaign/score.rs

engine-e-iq-campaign-score-scoring-baseline-window-must-be = scoring.baseline_window_s musi być dodatnie

engine-e-iq-campaign-score-scoring-js-bin-db-must = scoring.js_bin_db musi być dodatnie

engine-e-iq-campaign-score-scoring-reacq-grace-must-be = scoring.reacq_grace_s musi być >= 0

engine-e-iq-campaign-score-scoring-false-lock-doppler-hz = scoring.false_lock_doppler_hz musi być dodatnie

engine-e-iq-campaign-score-scoring-false-lock-min-epochs = scoring.false_lock_min_epochs musi wynosić co najmniej 1

## src/iq/campaign/spec.rs

engine-e-iq-campaign-spec-campaign-json = kampania (JSON): { $e }

engine-e-iq-campaign-spec-campaign-toml = kampania (TOML): { $e }

engine-e-iq-campaign-spec-inputs-conditions-must-list-at = inputs.conditions musi wymieniać co najmniej jeden plik lub wzorzec glob

engine-e-iq-campaign-spec-run-max-seconds-must-be = run.max_seconds musi być >= 0

engine-e-iq-campaign-spec-frontend-names-must-be-non = nazwy frontendów muszą być niepuste i unikalne ('{ $name }')

engine-e-iq-campaign-spec-inputs-conditions-matches-no-file = inputs.conditions: '{ $pat }' nie pasuje do żadnego pliku

engine-e-iq-campaign-spec-recording-id-appears-in-both = id nagrania '{ $w }' występuje zarówno w { $w2 }, jak i w { $w3 }

engine-e-iq-campaign-spec-inputs-design-names-needs-inputs = inputs.design_names wymaga inputs.designs

engine-e-iq-campaign-spec-inputs-design-names-no-design = inputs.design_names: brak projektu '{ $n }' w { $path }

## src/iq/campaign/truth.rs

engine-e-iq-campaign-truth-truth-line = wiersz prawdy odniesienia { $v1 }: { $e }

## src/iq/channel/cn0_profile.rs

engine-e-iq-channel-cn0-profile-n0-profile = profil C/N0: { $e }

engine-e-iq-channel-cn0-profile-n0-profile-2 = profil C/N0: { $m }

engine-iq-channel-cn0-profile-segment-step-values-must-be = segment { $i }: wartości skoku muszą być skończone

engine-iq-channel-cn0-profile-segment-ramp-needs-end-start = segment { $i }: rampa wymaga end_s > start_s

engine-iq-channel-cn0-profile-segment-points-need-equal-non = segment { $i }: punkty wymagają równych, niepustych t_s i db

engine-iq-channel-cn0-profile-segment-must-increase-strictly = segment { $i }: t_s musi rosnąć ściśle

engine-iq-channel-cn0-profile-segment-points-must-be-finite = segment { $i }: punkty muszą być skończone

engine-iq-channel-cn0-profile-segment-fade-s4-must-be = segment { $i }: zanik s4 musi należeć do (0, 1]

engine-iq-channel-cn0-profile-segment-fade-tau-must-be = segment { $i }: zanik tau_s musi być dodatnie

## src/iq/cli/acquire.rs

engine-iq-cli-acquire-recording-holds-samples-needed-for = { $code }: nagranie zawiera próbek: { $samples }, do tego wyszukiwania potrzeba: { $need }

engine-iq-cli-acquire-surface-name-the-format-with = --surface { $path }: nazwij format przez --surface-format csv|json|bin albo zakończ ścieżkę na .csv, .json lub .bin

engine-iq-cli-acquire-acquisition-hz-coherent-period-non = akwizycja: { $fs_hz } Hz, okresy koherentne: { $coherent_periods } x niekoherentne: { $noncoherent }, pfa { $pfa }{ "\u000A" }

## src/iq/cli/campaign.rs

engine-iq-cli-campaign-report-rebuilt-of-cell-row = raport odbudowany: komórki { $cells_present } z { $cells_total }, wiersze: { $rows }, nie spełnia progu: { $rows_failed }; skrót { $s }

engine-iq-cli-campaign-campaign-cell-already-done-run =
    kampania { $name }: komórki: { $cells_total }; już wykonane: { $cells_skipped }, uruchomione teraz: { $cells_run }, nieudane: { $cells_failed }, oczekujące: { $cells_pending }
    wyjście: { $out_dir }

engine-iq-cli-campaign-first-failure =
    { $msg }
    pierwsza awaria ({ $key }…): { $e }

engine-iq-cli-campaign-ok-event-expected-satellite-condition =
    { $resolved }
    OK: zdarzenia: { $events }, oczekiwane satelity: { $tc }; skrót warunków { $tc2 }

## src/iq/cli/channel.rs

engine-iq-cli-channel-iono-slant-tecu = jonosfera ukośnie { $t } TECU

engine-iq-cli-channel-iono-vertical-tecu = jonosfera pionowo { $t } TECU

engine-iq-cli-channel-tropo-doy = troposfera, dzień roku { $tropo_doy }

engine-iq-cli-channel-scint-s4-tau0-sigma-phi = scyntylacje S4={ $s4 } tau0={ $scint_tau0_s }s sigma_phi={ $sigma_phi_rad }rad

engine-iq-cli-channel-multipath-ground = wielodrogowość { $h }m, podłoże: { $multipath_ground }

engine-e-iq-cli-channel-multipath-ground-must-be-dry = --multipath-ground musi mieć wartość dry, wet lub sea (otrzymano: { $other })

engine-e-iq-cli-channel-give-at-most-one-of = podaj co najwyżej jedno z: --iono-stec, --iono-vtec, --iono-klobuchar

## src/iq/cli/frontend.rs

engine-iq-cli-frontend-bandpass-wants-lo-hi-got = --bandpass oczekuje lo,hi (otrzymano: { $v })

engine-e-iq-cli-frontend-bandpass-needs-lo-hi = --bandpass wymaga lo < hi

engine-e-iq-cli-frontend-bandpass-with-transition-hz-does = --bandpass { $lo },{ $hi } z przejściem { $transition } Hz nie mieści się poniżej fs/2 ({ $v1 } Hz); zawęź pasmo lub przejście

engine-e-iq-cli-frontend-bits-must-be-16-got = --bits musi należeć do 1..=16 (otrzymano: { $bits })

engine-iq-cli-frontend-filtered-samples-hz-to-sidecar = przefiltrowano próbek: { $total } ({ $fs_hz } Hz) do { $out } ({ $format }); plik towarzyszący { $sidecar_path }

## src/iq/cli/labfit.rs

engine-iq-cli-labfit-cannot-read = nie można odczytać { $path }: { $e }

engine-iq-cli-labfit-invalid-labfit-scenario = nieprawidłowy scenariusz labfit: { $e }

engine-iq-cli-labfit-fitted-run-wrote = dopasowano przebiegi: { $runs }; zapisano { $written }

engine-iq-cli-labfit-fitted-unit-from-campaign-wrote = dopasowano jednostki z kampanii: { $fit_units }; zapisano { $written }

engine-iq-cli-labfit-cannot-write = nie można zapisać { $target }: { $e }

## src/iq/cli/mod.rs

engine-iq-cli-needs-value = { $s } wymaga wartości

engine-e-iq-cli-cannot-parse = { $k }: nie można przetworzyć { $v }

engine-e-iq-cli-cannot-parse-2 = { $k }: nie można przetworzyć { $p }

engine-iq-cli-unknown-iq-processing-command-expected = nieznane polecenie przetwarzania iq { $other }; oczekiwano: scene, acquire, track, sweep, labfit, frontend, monitor, campaign lub conditions

## src/iq/cli/scene.rs

engine-e-iq-cli-scene-prn-is-out-of-range = PRN { $id } jest poza zakresem dla GPS

engine-e-iq-cli-scene-no-healthy-gps-ephemeris-found = nie znaleziono sprawnych efemeryd GPS dla żądanych PRN

engine-iq-cli-scene-rx-pos-wants-lat-lon = --rx-pos oczekuje lat,lon,alt (otrzymano: { $v })

engine-iq-cli-scene-n0-profile-segment = { $chan_desc }; profil C/N0 (segmenty: { $segments })

engine-iq-cli-scene-truth-format-must-be-csv = --truth-format musi mieć wartość csv lub jsonl (otrzymano: { $other })

engine-iq-cli-scene-written-by-kshana-iq-scene = zapisane przez kshana iq scene: scena SYMULOWANA, a nie nagranie

engine-iq-cli-scene-ion-sdr-metadata = metadane ION SDR { $path }

engine-iq-cli-scene-sigmf-data-meta = SigMF dane { $data_path }, meta { $meta_path }

engine-iq-cli-scene-written-by-kshana-iq-scene-2 = zapisane przez kshana iq scene

engine-iq-cli-scene-wrote-samples-hz-to-truth = zapisano próbek: { $samples } ({ $format }, { $fs_hz } Hz) do { $data_path }; rekordów prawdy odniesienia: { $truth_records } do { $truth_path }; { $meta_note }; kanał: { $chan_desc }

## src/iq/cli/sweep.rs

engine-iq-cli-sweep-cannot-be-combined-with-design = { $k } nie można łączyć z --design: sweep uruchamia każdy projekt z pliku

engine-iq-cli-sweep-loop-design-sweep-design-prn = przegląd projektów pętli: wyniki (projekt, PRN): { $rows }{ "\u000A" }

## src/iq/cli/track.rs

engine-iq-cli-track-recording-holds-samples-needed-to = { $code }: nagranie zawiera próbek: { $samples }, do akwizycji potrzeba: { $need }

engine-iq-cli-track-not-acquired-statistic-threshold-raise = { $code }: nie przeprowadzono akwizycji (statystyka { $statistic } < próg { $threshold }); zwiększ --doppler-max, --acq-coherent lub --acq-noncoherent albo sprawdź nagranie

engine-iq-cli-track-designs-and-differ-in-integration = projekty { $first } i { $d } różnią się w integration.extra_taps_chips; projekty jednego przebiegu muszą być zgodne, aby każdy rekord wyjściowy miał te same kolumny

## src/iq/cli/track.rs

engine-iq-cli-track-epochs-name-the-format-with = --epochs { $p }: nazwij format przez --epochs-format csv|jsonl|bin albo zakończ ścieżkę na .csv, .jsonl lub .bin

engine-iq-cli-track-hz-is-samples-per-chip = { $fs_hz } Hz to { $r } próbek na chip { $c }: próbkowanie współmierne zamienia dyskryminator kodu w schodki (przy 2 próbkach/chip DLL drga, ok. { $lit_0_09 } chip RMS błędu kodu przy 45 dB-Hz); drgania i obciążenie pętli kodu z tego nagrania nie są reprezentatywne. Aby ocenić pętle kodu, użyj częstotliwości, która nie jest wielokrotnością połowy częstotliwości chipów.

## src/iq/io/batch.rs

engine-e-iq-io-batch-worker-exited-before-processing-this = proces roboczy zakończył się przed przetworzeniem tego wejścia

## src/iq/io/cli.rs

engine-e-iq-io-cli-unknown-option = nieznana opcja { $s }

engine-e-iq-io-cli-format-needs-rate = --format wymaga --rate

engine-iq-io-cli-unknown-iq-command = nieznane polecenie iq { $other }

## src/iq/io/follow.rs

engine-e-iq-io-follow-follow-reads-single-channel-recordings = { $meta_path }: --follow czyta tylko nagrania jednokanałowe

engine-e-iq-io-follow-follow-reads-recording-with-one = { $meta_path }: --follow czyta nagranie z jedną rejestracją, to ma ich: { $captures }

engine-e-iq-io-follow-no-positive-core-sample-rate = { $meta_path }: brak dodatniego core:sample_rate

engine-e-iq-io-follow-the-capture-does-not-start = { $meta_path }: rejestracja nie zaczyna się na granicy bajtu

## src/iq/io/format.rs

engine-e-iq-io-format-unknown-sample-format-expected-ci8 = nieznany format próbek { $name }: oczekiwano np. ci8, cu8, ci16_le, ci16_be, cf32_le, cf32_be, ri16_le, ci12r_le, ci12l_be, cu16_le, cu12r_be, ci4_msb, cu4_lsb, c2tc_msb, r2sm_lsb, c2sm_byte, opcjonalnie z końcówką _qi dla zespolonych

## src/iq/io/inventory.rs

engine-e-iq-io-inventory-sidecar-sample-rate-hz-is = sample_rate_hz pliku towarzyszącego { $sample_rate_hz } nie jest dodatnie

engine-e-iq-io-inventory-sdrx-recordings-hold-one-stream = { $path }: nagrania .sdrx zawierają jeden strumień; kanał { $channel } nie istnieje

engine-e-iq-io-inventory-raw-file-with-no-sidecar = { $path }: plik surowy bez pliku towarzyszącego; podaj jego format albo zapisz { $sidecar_candidates }

## src/iq/io/report.rs

engine-e-iq-io-report-cannot-serialise-row = nie można serializować wiersza: { $e }

## src/iq/io/resample.rs

engine-e-iq-io-resample-invalid-filter-design-passband-frac = nieprawidłowy projekt filtra { $design }: passband_frac w (0, 1), tłumienie > 0

engine-e-iq-io-resample-if-hz-must-lie-strictly = IF { $if_hz } Hz musi leżeć ściśle między 0 a połową częstotliwości próbkowania ({ $v1 } Hz)

## src/iq/io/sdrx.rs

engine-e-iq-io-sdrx-sdrx-data = { "." }sdrx dane: { $e }

engine-iq-io-sdrx-sdrx-bit-bits-sample = sdrx { $quantization }-bitowy { $enc } { $fmt } ({ $packed_bits } bitów/próbkę)

## src/iq/io/sigmf_stream.rs

engine-e-iq-io-sigmf-stream-unsupported-sigmf-core-datatype-supported = nieobsługiwany SigMF core:datatype { $datatype }: obsługiwane są ci8, cu8, ci16_le, ci16_be, cf32_le, cf32_be oraz rzeczywiste ri8, ru8, ri16_le, ri16_be, rf32_le, rf32_be

engine-e-iq-io-sigmf-stream-is-not-sigmf-core-datatype = { $datatype } nie jest SigMF core:datatype

engine-e-iq-io-sigmf-stream-invalid-sigmf-metadata = nieprawidłowe metadane SigMF: { $e }

engine-e-iq-io-sigmf-stream-has-no-sigmf-core-datatype = { $format } nie ma SigMF core:datatype; zapisz jako raw

engine-e-iq-io-sigmf-stream-core-num-channels-does-not = { $name }: core:num_channels { $ch } nie zgadza się z wartością { $c0 } pierwszego nagrania

engine-e-iq-io-sigmf-stream-no-core-sample-rate = { $name }: brak core:sample_rate

engine-e-iq-io-sigmf-stream-core-sample-rate-is-not = { $name }: core:sample_rate { $rate } nie jest dodatnie

engine-e-iq-io-sigmf-stream-at-hz-does-not-match = { $name }: { $f } przy { $rate } Hz nie zgadza się z wartością { $f0 } przy { $r0 } Hz pierwszego nagrania

engine-e-iq-io-sigmf-stream-first-capture-does-not-start = { $name }: pierwsza rejestracja nie zaczyna się na granicy bajtu

engine-e-iq-io-sigmf-stream-channel-requested-the-recording-has = zażądano kanału { $channel }; nagranie ma kanałów: { $channels } (kanały liczone od 0)

engine-e-iq-io-sigmf-stream-invalid-sigmf-collection = nieprawidłowa kolekcja SigMF: { $e }

engine-e-iq-io-sigmf-stream-sha-512-does-not-match = { $mp }: SHA-512 { $got } nie zgadza się z wartością kolekcji { $h }

## src/iq/io/stream.rs

engine-e-iq-io-stream-stream-of-interleaved-streams-does = strumień { $select } z { $channels } przeplatanych strumieni nie istnieje (strumienie liczone od 0)

engine-e-iq-io-stream-sample-of-does-not-start = próbka { $k } formatu { $format } nie zaczyna się na granicy bajtu

engine-e-iq-io-stream-time-window-start-duration-both = okno czasu: start { $start_s } s, czas trwania { $duration_s } s: oba muszą być nieujemne

## src/iq/labfit/campaign.rs

engine-iq-labfit-campaign-most-damaging-stated-cw-no = najbardziej szkodliwe podane Q (cw): brak wartości w tabeli dla typu `{ $event_type }`

engine-e-iq-labfit-campaign-the-campaign-is-not-complete = { $out_dir }: kampania nie jest zakończona

engine-e-iq-labfit-campaign-digest-does-not-match-the = { $out_dir }: DIGEST { $on_disk } nie zgadza się z komórkami ({ $digest })

engine-e-iq-labfit-campaign-recording-test-conditions-hash-does = nagranie `{ $id }`: skrót warunków testu { $h } nie zgadza się z zapisanym { $conditions_hash }

engine-e-iq-labfit-campaign-signal-unknown-chip-rate = sygnał `{ $signal }`: nieznana częstotliwość chipów

## src/iq/labfit/fit.rs

engine-e-iq-labfit-fit-no-run-is-usable-for = żaden przebieg nie nadaje się do dopasowania utraty synchronizacji: { $v1 }

## src/iq/labfit/iqfit.rs

engine-iq-labfit-iqfit-insufficient-data-not-fitted-recordings = za mało danych: nie dopasowano (nagrania: { $m }; potrzeba co najmniej: { $min_rec })

engine-iq-labfit-iqfit-uncensored-span-db-is-under = nieocenzurowany zakres J/S { $span_db } dB jest poniżej { $v2 } dB

engine-iq-labfit-iqfit-eff-and-delta-are-not = Q_eff i delta nie są identyfikowalne osobno (|corr| { $full } >= { $v2 }): model zależy tylko od delta - 10 log10 Q_eff

engine-e-iq-labfit-iqfit-unknown-mode-only-validation = nieznany tryb `{ $m }` (tylko `validation`)

engine-e-iq-labfit-iqfit-validation-pi90-coverage-must-be = validation.pi90_coverage musi mieć postać [lower, upper] w [0, 1]

engine-e-iq-labfit-iqfit-campaign-fit-bounds-must-be = campaign_fit.q_bounds musi mieć postać [lower, upper] przy 0 < lower < upper

engine-e-iq-labfit-iqfit-campaign-fit-delta-bounds-db = campaign_fit.delta_bounds_db musi mieć postać [lower, upper]

engine-e-iq-labfit-iqfit-the-campaign-has-no-event = kampania nie ma zdarzenia z podanym profilem mocy do dopasowania

## src/iq/labfit/iqreport.rs

engine-iq-labfit-iqreport-lab-fit-from-iq-campaign =
    # Dopasowanie laboratoryjne z kampanii IQ: { $r }

    Schemat `{ $schema }`, silnik { $engine_version }. Etykieta: **{ $label }**.

    { $statement }

    { $advisory }{ "\u000A\u000A" }

engine-iq-labfit-iqreport-campaign-digest-campaign-json-sha = DIGEST kampanii `{ $campaign_digest }`; SHA-256 `campaign.json` `{ $campaign_json_sha256 }`; SHA-256 scenariusza `{ $scenario_sha256 }`; komórki: { $cells }; replikacje bootstrap: { $bootstrap } (ziarno { $seed }).{ "\u000A\u000A" }

engine-iq-labfit-iqreport-unit-status-recordings-satellites-events =
    ## Jednostka { $i }: { $signal } / { $name } / { $name2 } / { $jammer_type }

    Stan: { $status }. Nagrania: { $recordings }, satelity: { $satellites }, zdarzenia: { $events }; przedziały dopasowane: { $bins_used }, ocenzurowane: { $bins_censored }.{ "\u000A\u000A" }

engine-iq-labfit-iqreport-n0-model-delta-eff-db = Model C/N0 ({ $q_mode }): `delta_eff` = { $ci } dB (identyfikowalne przesunięcie, odniesione do Q = 1); `Q_eff` = { $q }; `delta` przy tym Q = { $ci2 } dB; corr(Q, delta) { $om }; reszta RMS { $residual_rms_db } dB w zakresie J/S { $span_db } dB. Q_eff nie jest identyfikowalne z danych C/N0 bez niezależnego pomiaru mocy.{ "\u000A\u000A" }

engine-iq-labfit-iqreport-held-at-its-stated-value = Q utrzymane na podanej wartości: { $why }.{ "\u000A\u000A" }

engine-iq-labfit-iqreport-hold-out-leave-one-recording = Zbiór wyłączony (z pominięciem jednego nagrania), interpolacja: przedziały: { $bins }, RMS C/N0 { $om } dB, pokrycie PI90 { $om2 }

engine-iq-labfit-iqreport-validation-table-sha-256-registered =
    SHA-256 tabeli walidacyjnej `{ $table_sha256 }` (zarejestrowano { $registered }):

    | próg | limit | wartość | werdykt |
    |---|---|---|---|{ "\u000A" }

## src/iq/labfit/mod.rs

engine-iq-labfit-run-log = dziennik przebiegu `{ $label }`

engine-e-iq-labfit-run = przebieg `{ $label }`: { $e }

engine-e-iq-labfit-the-scenario-input-names-no = [input] scenariusza nie wskazuje żadnej kampanii

engine-e-iq-labfit-input-campaign-and-runs-are = { "[" }input] campaign i [[runs]] wykluczają się: podaj jedno

engine-e-iq-labfit-iq-labfit-scenario = scenariusz iq-labfit: { $e }

## src/iq/labfit/observe.rs

engine-iq-labfit-observe-the-log-carries-no-per = dziennik nie zawiera C/N0 dla poszczególnych satelitów{ $cfg } (obserwable: [{ $observables }])

engine-iq-labfit-observe-no-epoch-before-the-onset = brak epoki przed początkiem w { $onset } s

engine-iq-labfit-observe-no-epoch-at-or-after = brak epoki w początku lub po nim, początek w { $onset } s

## src/iq/labfit/report.rs

engine-iq-labfit-report-lab-fit-label-settings-sha =
    # Dopasowanie laboratoryjne: { $r }

    Etykieta: **{ $label }**. SHA-256 ustawień `{ $settings_sha256 }`.{ "\u000A\u000A" }

engine-iq-labfit-report-model-parameter-value-bounds-at =
    { "\u000A" }## Model: { $model } ({ $label })

    | parametr | wartość | granice | na granicy | sd bootstrap (95 %) |
    |---|---|---|---|---|{ "\u000A" }

engine-iq-labfit-report-hold-out-folds-all-interpolation =
    { "\u000A" }Zbiór wyłączony ({ $scheme }, podziały: { $folds }): wszystkie { $om } s, interpolacja { $om2 } s, ekstrapolacja { $om3 } s.

    | przebieg wyłączony | klasa | odległość | najbliższy przebieg treningowy | RMS s |
    |---|---|---|---|---|{ "\u000A" }

## src/iq/lunanet_afs.rs

engine-iq-lunanet-afs-fid-is-reserved-for-future = FID { $fid } jest zarezerwowane na przyszłość (zdefiniowane jest tylko FID 0)

engine-iq-lunanet-afs-toi-is-outside-99 = TOI { $toi } jest poza 0..=99

engine-iq-lunanet-afs-sb1-symbol-disagree-with-the = symbole SB1 niezgodne z zdekodowanym polem: { $sb1_err }

engine-iq-lunanet-afs-frames-at-and-are-symbols = ramki w { $w } i { $w2 } dzieli { $gap } symboli, a nie { $FRAME_SYMBOLS }

engine-iq-lunanet-afs-toi-follows-toi-expected = TOI { $w } następuje po TOI { $w2 }, oczekiwano { $want }

engine-e-iq-lunanet-afs-unexpected-character-in-symbol-stream = nieoczekiwany znak { $c } w strumieniu symboli (dozwolone tylko 0, 1 i białe znaki)

engine-iq-lunanet-afs-prn-first-24-chips-differ = { $name } PRN { $prn }: pierwsze 24 chipy się różnią

engine-iq-lunanet-afs-prn-last-24-chips-differ = { $name } PRN { $prn }: ostatnie 24 chipy się różnią

engine-iq-lunanet-afs-the-document-prints-a14850-for = { $miss } (dokument podaje A14850 zarówno dla PRN 147, jak i PRN 151; generator odtwarza wartość PRN 151, więc wpis PRN 147 to najpewniej literówka w dokumencie)

engine-iq-lunanet-afs-encoded-0x-decoded-fid-toi = zakodowano 0x{ $word }, zdekodowano FID { $fid } TOI { $toi }

## src/iq/monitor/run.rs

engine-e-iq-monitor-run-monitor-settings = ustawienia monitora: { $e }

## src/iq/scene/geometry.rs

engine-e-iq-scene-geometry-static-position-not-finite = pozycja statyczna nie jest skończona

engine-e-iq-scene-geometry-constant-velocity-trajectory-not-finite = trajektoria o stałej prędkości nie jest skończona

engine-e-iq-scene-geometry-waypoint-trajectory-has-no-waypoints = trajektoria punktów trasy nie ma punktów trasy

engine-e-iq-scene-geometry-waypoint-not-finite = punkt trasy nie jest skończony

engine-e-iq-scene-geometry-waypoint-times-must-increase-strictly = czasy punktów trasy muszą rosnąć ściśle

## src/iq/scene/mod.rs

engine-e-iq-scene-prn-is-not-gps-prn = PRN { $prn } nie jest PRN GPS C/A

engine-e-iq-scene-ephemeris-system-is-not-gps = system efemeryd { $system } nie jest GPS

engine-e-iq-scene-satellite = satelita { $value }: { $e }

## src/iq/scene/nav.rs

engine-e-iq-scene-nav-is-pilot-data-free-component = jest składową pilotową (bez danych) i nie niesie danych nawigacyjnych

engine-e-iq-scene-nav-carries-data-the-scene-does = niesie dane, których scena nie modeluje; wygeneruj ją bez danych

engine-e-iq-scene-nav-does-not-carry-gps-lnav = nie niesie GPS LNAV (niesie je tylko GPS L1 C/A); użyj danych z ziarnem

engine-e-iq-scene-nav-not-an-lnav-source = nie jest źródłem LNAV

## src/iq/scene/synthetic.rs

engine-e-iq-scene-synthetic-scene-needs-at-least-one = scena wymaga co najmniej jednego satelity (--prn)

engine-e-iq-scene-synthetic-doppler-lists-value-give-one = --doppler zawiera wartości: { $dopplers }; podaj jedną na --prn ({ $ids }) albo jedną wspólną

engine-e-iq-scene-synthetic-data = --data: { $code } { $e }

## src/iq/scene/truth.rs

engine-e-iq-scene-truth-truth-row-has-fields-expected = wiersz prawdy odniesienia ma pól: { $f }, oczekiwano 10

engine-e-iq-scene-truth-truth-field = pole prawdy odniesienia { $i }: { $e }

engine-e-iq-scene-truth-truth-sat-id = sat_id prawdy odniesienia: { $e }

## src/iq/short.rs

engine-e-iq-short-fs-hz-must-be-positive = fs_hz musi być liczbą dodatnią

engine-e-iq-short-duration-must-be-in = duration_s musi należeć do (0, { $MAX_DURATION_S }]

engine-e-iq-short-ids-must-hold-to-satellites = ids musi zawierać od 1 do { $MAX_SATELLITES } satelitów

engine-e-iq-short-dopplers-must-be-finite = dopplers muszą być skończone

## src/iq/signals/beidou.rs

engine-iq-signals-beidou-beidou-b1c-data-prn = BeiDou B1C PRN danych { $prn }

engine-iq-signals-beidou-beidou-b1c-pilot-prn = BeiDou B1C PRN pilota { $prn }

## src/iq/signals/by_name.rs

engine-e-iq-signals-by-name-prn-is-out-of-range = { $signal }: PRN { $id } jest poza zakresem

engine-e-iq-signals-by-name-glonass-l1of-frequency-channel-is = kanał częstotliwości GLONASS L1OF { $id } jest poza -7..=6

engine-e-iq-signals-by-name-unknown-signal-expected-one-of = nieznany sygnał { $other }; oczekiwano jednego z: { $signal_names }

## src/iq/signals/galileo.rs

engine-e-iq-signals-galileo-line-no = wiersz { $v1 }: brak ';'

engine-e-iq-signals-galileo-line-no-code-number-in = wiersz { $v1 }: brak numeru kodu w { $label }

engine-e-iq-signals-galileo-code-appears-twice = kod { $number } występuje dwa razy

## src/iq/signals/lunanet.rs

engine-iq-signals-lunanet-lunanet-afs-primary-tertiary = LunaNet AFS-Q pierwotny { $primary_prn } S{ $secondary } trzeciorzędowy { $t }

engine-iq-signals-lunanet-lunanet-afs-primary-tertiary-omitted = LunaNet AFS-Q pierwotny { $primary_prn } S{ $secondary } (trzeciorzędowy pominięty)

## src/iq/signals/mod.rs

engine-e-iq-signals-non-hex-character = znak niebędący cyfrą szesnastkową { $c }

engine-e-iq-signals-hex-symbols-cannot-hold-exactly = symboli szesnastkowych { $hex } nie da się zmieścić dokładnie w { $len } chipach

engine-iq-signals-primary-only = { $name } (tylko pierwotny)

## src/iq/track/boc.rs

engine-e-iq-track-boc-boc-tracking-needs-an-early = śledzenie BOC wymaga odstępu early-late w (0, { $max }) chipów, aby E i L pozostały na głównym szczycie (otrzymano: { $spacing_chips })

engine-e-iq-track-boc-bump-jump-threshold-must-be = próg bump-jump musi wynosić co najmniej 1

## src/iq/track/channel.rs

engine-e-iq-track-channel-sample-rate-must-be-positive = częstotliwość próbkowania musi być dodatnia

engine-e-iq-track-channel-coherent-periods-must-be-positive = coherent_periods musi być dodatnie

engine-e-iq-track-channel-cn0-windows-must-be-positive = cn0_windows musi być dodatnie

engine-e-iq-track-channel-coherent-periods-must-divide-the = coherent_periods { $coherent_periods } musi dzielić długość bitu { $ppb }

engine-e-iq-track-channel-at-most-extra-taps-are = obsługiwane jest co najwyżej { $MAX_EXTRA_TAPS } dodatkowych odczepów (otrzymano: { $extra_taps_chips }{ $v2 })

engine-e-iq-track-channel-extra-tap-offsets-must-be = przesunięcia dodatkowych odczepów muszą być skończone i mieścić się w ±{ $MAX_TAP_OFFSET_CHIPS } chipów (otrzymano: { $t })

engine-e-iq-track-channel-n0-window-needs-at-least = okno C/N0 wymaga co najmniej 2 próbek prompt

## src/iq/track/design.rs

engine-e-iq-track-design-carrier-pll-discriminator-expected-atan2 = carrier.pll_discriminator { $o }: oczekiwano atan2, costas-atan lub costas-decision-directed

engine-e-iq-track-design-carrier-fll-discriminator-expected-cross = carrier.fll_discriminator { $o }: oczekiwano cross-product, atan2 lub atan2-pilot

engine-e-iq-track-design-carrier-fll-assist-expected-pull = carrier.fll_assist { $o }: oczekiwano pull-in lub always

engine-e-iq-track-design-code-discriminator-expected-eml-power = code.discriminator { $o }: oczekiwano eml-power, dot-product lub eml-envelope

engine-iq-track-design-carrier-kind-expected-pll-fll = carrier.kind { $k }: oczekiwano pll, fll lub fll-assisted-pll

engine-iq-track-design-carrier-does-not-apply-to = carrier.{ $key } nie dotyczy carrier.kind = { $kind }

engine-iq-track-design-carrier-bn-max-expected-number = carrier.bn_t_max { $v }: oczekiwano liczby >= 0 (0 wyłącza ograniczenie)

engine-e-iq-track-design-must-be-positive-number-got = { $k } musi być liczbą dodatnią (otrzymano: { $v })

engine-e-iq-track-design-integration-coherent-periods-must-be = integration.coherent_periods musi wynosić co najmniej 1

engine-e-iq-track-design-integration-spacing-chips-must-lie = integration.spacing_chips musi leżeć w (0, 2] (otrzymano: { $d })

engine-e-iq-track-design-integration-extra-taps-chips-holds = integration.extra_taps_chips zawiera co najwyżej { $MAX_EXTRA_TAPS } przesunięć (otrzymano: { $taps })

engine-e-iq-track-design-integration-extra-taps-chips-offsets = przesunięcia integration.extra_taps_chips muszą być skończone i mieścić się w ±{ $MAX_TAP_OFFSET_CHIPS } chipów (otrzymano: { $t })

engine-e-iq-track-design-carrier-fll-on-pli-must = carrier.fll_on_pli ({ $on }) musi być poniżej carrier.fll_off_pli ({ $off }), oba w (-1, 1]

engine-e-iq-track-design-carrier-fll-gate-dwell-must = carrier.fll_gate_dwell_s musi być zerem lub dodatnie (otrzymano: { $t })

engine-e-iq-track-design-carrier-fll-pull-in-max = carrier.fll_pull_in_max_s musi być dodatnie (otrzymano: { $t })

engine-e-iq-track-design-carrier-pll-order-must-be = carrier.pll_order musi wynosić 1, 2 lub 3 (otrzymano: { $o })

engine-e-iq-track-design-carrier-fll-order-must-be = carrier.fll_order musi wynosić 1 lub 2 (otrzymano: { $o })

engine-e-iq-track-design-code-order-must-be-or = code.order musi wynosić 1 lub 2 (otrzymano: { $order })

engine-e-iq-track-design-lock-pli-threshold-must-lie = lock.pli_threshold musi leżeć w [-1, 1] (otrzymano: { $pli })

engine-e-iq-track-design-lock-cn0-windows-must-be = lock.cn0_windows musi wynosić co najmniej 1

engine-e-iq-track-design-lock-cn0-window-periods-must = lock.cn0_window_periods musi wynosić co najmniej 2

engine-e-iq-track-design-lock-reacq-max-interval-must = lock.reacq_max_interval_s ({ $reacq_max_interval_s }) nie może być poniżej lock.reacq_interval_s ({ $reacq_interval_s })

engine-e-iq-track-design-lock-false-lock-margin-db = lock.false_lock_margin_db musi być skończone

engine-e-iq-track-design-bit-sync-min-votes-must = bit_sync.min_votes musi wynosić co najmniej 1

engine-e-iq-track-design-acquisition-coherent-periods-must-be = acquisition.coherent_periods musi wynosić co najmniej 1 (lub „auto”)

engine-e-iq-track-design-acquisition-noncoherent-must-be-at = acquisition.noncoherent musi wynosić co najmniej 1

engine-e-iq-track-design-acquisition-pfa-must-lie-in = acquisition.pfa musi leżeć w (0, 1) (otrzymano: { $pfa })

engine-e-iq-track-design-design-overrides = nadpisania projektu: { $e }

engine-e-iq-track-design-design-overrides-may-not-set = nadpisania projektu nie mogą ustawiać name ani extends

engine-e-iq-track-design-loop-design-file = plik loop-design: { $e }

engine-e-iq-track-design-loop-design-file-schema-is = plik loop-design: schemat { $other } nie jest obsługiwany; oczekiwano { $SCHEMA }

engine-e-iq-track-design-loop-design-file-missing-schema = plik loop-design: brak schema = { $SCHEMA }

engine-e-iq-track-design-loop-design-file-no-design = plik loop-design: brak tabel [[design]]

engine-e-iq-track-design-loop-design-file-design-number = plik loop-design: [[design]] numer { $v1 } nie ma nazwy

engine-e-iq-track-design-loop-design-file-design-name = plik loop-design: nazwa projektu { $name } jest zarezerwowana lub pusta

engine-e-iq-track-design-loop-design-file-design-is = plik loop-design: projekt { $name } jest zdefiniowany dwa razy

engine-e-iq-track-design-no-design-named-the-file = brak projektu o nazwie { $n }; plik zawiera { $value }

engine-e-iq-track-design-loop-design-file-design-extends = plik loop-design: projekt { $name } rozszerza samego siebie (cykl)

engine-e-iq-track-design-loop-design-file-design-extends-2 = plik loop-design: projekt { $name } rozszerza nieznany projekt { $parent }

## src/iq/track/filter.rs

engine-e-iq-track-filter-phase-loop-needs-order-and = pętla fazowa wymaga rzędu 1..=3 i Bn > 0 (otrzymano: { $o }, { $bn })

engine-e-iq-track-filter-frequency-loop-needs-bn-got = pętla częstotliwościowa wymaga Bn > 0 (otrzymano: { $bn })

engine-e-iq-track-filter-frequency-loop-order-must-be = rząd pętli częstotliwościowej musi wynosić 1 lub 2 (otrzymano: { $o })

engine-e-iq-track-filter-loop-filter-needs-phase-path = filtr pętli wymaga ścieżki fazowej, ścieżki częstotliwościowej albo obu

## src/iq/track/mod.rs

engine-e-iq-track-early-late-spacing-must-lie = odstęp early-late musi leżeć w (0, 2] chipów (otrzymano: { $spacing_chips })

engine-e-iq-track-dll-order-must-be-or = rząd DLL musi wynosić 1 lub 2 (otrzymano: { $dll_order })

engine-e-iq-track-chip-rate-and-carrier-frequency = częstotliwość chipów i częstotliwość nośnej muszą być dodatnie

## src/iq/track/sink.rs

engine-e-iq-track-sink-an-epoch-carries-extra-taps = epoka niesie dodatkowych odczepów: { $extra }, a wyjście przygotowano dla: { $n }: każdy kanał przebiegu musi używać tego samego extra_taps_chips

engine-e-iq-track-sink-record-is-bytes-expected = rekord ma { $b } B; oczekiwano { $want }

engine-e-iq-track-sink-unknown-lock-state-code = nieznany kod stanu synchronizacji { $b }

engine-e-iq-track-sink-epoch-file-header = nagłówek pliku epok: { $e }

engine-e-iq-track-sink-epoch-file-schema-expected = schemat pliku epok { $schema }; oczekiwano { $EPOCH_SCHEMA }

engine-e-iq-track-sink-epoch-file-records-are-bytes = rekordy pliku epok mają { $record_bytes } B; ten czytnik oczekuje { $want } ({ $BINARY_RECORD_BYTES } plus { $BINARY_TAP_BYTES } na dodatkowy odczep)

engine-e-iq-track-sink-epoch-file-ends-inside-record = plik epok kończy się wewnątrz rekordu ({ $got } z { $size } B)

engine-e-iq-track-sink-epoch-format-expected-csv-jsonl = format epok { $o }: oczekiwano csv, jsonl lub bin

## src/jammertest/cli.rs

engine-e-jammertest-cli-is-not-number = { $name }: `{ $s }` nie jest liczbą

engine-e-jammertest-cli-is-not-utf-text = { $path } nie jest tekstem UTF-8

engine-e-jammertest-cli-needs-catalog = wymaga --catalog

engine-e-jammertest-cli-needs-at-least-one-plan = wymaga co najmniej jednego --plan

engine-e-jammertest-cli-is-not-utf = { $cat } nie jest w UTF-8

engine-e-jammertest-cli-is-not-utf-2 = { $p } nie jest w UTF-8

engine-e-jammertest-cli-format-is-not-one-of = --format: `{ $s }` nie jest żadnym z: ubx, rinex, android, nmea

engine-e-jammertest-cli-log-start-is-not-utc = --log-start `{ $t }` nie jest czasem UTC w ISO-8601

engine-e-jammertest-cli-needs-log-start-or-log = wymaga --log-start albo --log z --format

engine-e-jammertest-cli-log-needs-format = --log wymaga --format

engine-e-jammertest-cli-the-log-does-not-state = dziennik nie podaje czasu początku: użyj --log-start

engine-e-jammertest-cli-the-log-states-its-start = dziennik podaje czas początku jako `{ $label }`: użyj --log-start

engine-e-jammertest-cli-is-not-utf-3 = { $a } nie jest w UTF-8

engine-e-jammertest-cli-cannot-write = nie można zapisać { $o }: { $e }

engine-jammertest-cli-events-written-to-non-rf = zapisano zdarzeń { $SCHEDULED_TRUTH }: { $events } do { $o } (pominięte sloty bez RF: { $skipped_non_rf }, poza dziennikiem: { $outside_log }, id spoza katalogu: { $unknown_ids })

engine-jammertest-cli-note-ids-not-in-the = uwaga: id spoza katalogu: { $unknown_ids }

engine-jammertest-cli-note-these-are-the-plan = uwaga: są to zaplanowane sloty planu, a nie zarejestrowane czasy emisji.

engine-jammertest-cli-test-name = { $v1 } { $v2 } { $v3 } { $v4 } { $v5 } { $v6 } { $v7 }  nazwa testu

## src/jammertest/cli.rs

engine-jammertest-cli-tests-evaluable-detected-within-tolerance = testy: { $tests }, możliwe do oceny: { $evaluable }; wykryte w tolerancji: { $detected }, spóźnione: { $late }, niewykryte: { $missed }; mediana opóźnienia { $fmt_opt }, mediana czasu odzyskania { $fmt_opt2 }

engine-jammertest-cli-false-alarms-outside-every-slot = fałszywe alarmy poza każdym slotem: przebiegi: { $false_alarm_runs }, epoki: { $false_alarm_epochs } z { $clean_epochs } czystych

engine-e-jammertest-cli-needs-session-path = wymaga ścieżki sesji

engine-e-jammertest-cli-needs-catalog-and-plan-or = wymaga --catalog i --plan albo --attack-log

engine-jammertest-cli-evidence-pack-written-to-signer = pakiet dowodowy zapisano w { $out }; odcisk podpisującego { $signer_fingerprint }

## src/jammertest/dataset.rs

engine-e-jammertest-dataset-no-folder-with-scenario-json = brak folderu z scenario.json i plikiem .ubx w { $root }

engine-e-jammertest-dataset-scenario = scenariusz: { $e }

engine-e-jammertest-dataset-read = odczyt: { $e }

engine-e-jammertest-dataset-scenario-json-has-no-date = scenario.json nie ma daty

engine-e-jammertest-dataset-scenario-json-date-is-not = data w scenario.json `{ $date }` nie jest datą

engine-e-jammertest-dataset-no-readable-epoch-in-mon = brak czytelnej epoki w mon_rf.csv ani rinex.csv

engine-e-jammertest-dataset-no-folder-with-scenario-json-2 = brak folderu z scenario.json w { $root }

engine-jammertest-dataset-recovered-of-median = { $f2 } odzyskano ({ $recovered } z { $alarmed }), mediana { $f22 } s

## src/jammertest/mod.rs

engine-e-jammertest-the-log-states-its-start = dziennik podaje czas początku jako `{ $l }`, co nie jest czasem UTC w ISO-8601: podaj początek jawnie

engine-e-jammertest-the-log-does-not-state = dziennik nie podaje czasu początku: podaj go jawnie

## src/jammertest/plan.rs

engine-e-jammertest-plan-catalogue-is-not-json = katalog nie jest JSON: { $e }

engine-e-jammertest-plan-catalogue-has-no-test-types = katalog nie ma tablicy `test_types`

engine-e-jammertest-plan-test-type-has-no-type = typ testu nie ma `type_id`

engine-e-jammertest-plan-test-group-has-no-group = grupa testów nie ma `group_id`

engine-e-jammertest-plan-test-has-no-test-id = test nie ma `test_id`

engine-e-jammertest-plan-catalogue-lists-no-tests = katalog nie wymienia żadnych testów

engine-e-jammertest-plan-is-not-plan-time-like = `{ $text }` nie jest czasem planu w postaci 2025-09-15T14:00:00

engine-e-jammertest-plan-plan-is-not-json = plan nie jest JSON: { $e }

engine-e-jammertest-plan-plan-has-no-locations-array = plan nie ma tablicy `locations`

engine-e-jammertest-plan-test-end-time-is-not = test { $id }: end_time nie jest późniejsze niż start_time

engine-e-jammertest-plan-the-plan-has-no-test = plan nie ma obszaru testowego { $l }; ma: { $areas }

engine-e-jammertest-plan-the-plan-has-several-test = plan ma kilka obszarów testowych: { $areas }; wskaż, w którym nagrano dziennik

engine-e-jammertest-plan-scenario-json-is-not-json = scenario.json nie jest JSON: { $e }

engine-e-jammertest-plan-no-attack-log-array = brak tablicy `attack_log`

engine-jammertest-plan-jammertest-2024-test-window = { $SCHEDULED_TRUTH }: Jammertest 2024, test { $id }, okno { $n } ({ $attack })

engine-e-jammertest-plan-the-attack-log-holds-no = attack_log nie zawiera okna start/end

## src/jammertest/score.rs

engine-e-jammertest-score-scheduled-events-but-the-run = zaplanowane zdarzenia: { $events }, ale przebieg ocenił: { $events2 }: podaj własne zdarzenia przebiegu

engine-e-jammertest-score-recover-hold-must-be-positive = recover_hold_s musi być dodatnie, a guard_s nieujemne

## src/jamming.rs

engine-e-jamming-crpa-elements-enu-must-list = crpa.elements_enu_m musi wymieniać co najmniej jeden element

engine-e-jamming-crpa-elements-enu-must-be = crpa.elements_enu_m musi być skończone

engine-e-jamming-crpa-weighting-expected-null-steering = crpa.weighting { $weighting }: oczekiwano „null-steering” lub „mvdr”

engine-e-jamming-crpa-bandwidth-mhz-must-be = crpa.bandwidth_mhz musi być dodatnie (otrzymano: { $b })

engine-e-jamming-terrain-the-section-needs-jammer = terrain: sekcja wymaga [jammer]

## src/jamming_rx.rs

engine-e-jamming-rx-acquisition-acquisition-threshold-dbhz-must = acquisition.acquisition_threshold_dbhz ({ $acquisition_threshold_dbhz }) musi być skończone i nie mniejsze niż tracking_threshold_dbhz ({ $tracking_threshold_dbhz })

engine-e-jamming-rx-acquisition-reacquisition-delay-must-be = acquisition.reacquisition_delay_s musi być skończone i nieujemne (otrzymano: { $reacquisition_delay_s })

engine-e-jamming-rx-front-end-adc-bits-must = front_end.adc_bits musi mieścić się w zakresie od 1 do 16 (otrzymano: { $adc_bits })

engine-e-jamming-rx-front-end-bandwidth-mhz-must = front_end.bandwidth_mhz musi być dodatnie (otrzymano: { $b })

## src/jamming_terrain.rs

engine-e-jamming-terrain-terrain-samples-per-side-must = terrain.samples_per_side musi wynosić co najmniej 2 (otrzymano: { $samples_per_side })

engine-e-jamming-terrain-terrain-must-be-finite-got = terrain.{ $name } musi być skończone (otrzymano: { $v })

engine-e-jamming-terrain-terrain-must-be-positive-got = terrain.{ $name } musi być dodatnie (otrzymano: { $v })

engine-e-jamming-terrain-terrain-dem-hgt = terrain.dem_hgt { $dem_hgt }: { $e }

engine-e-jamming-terrain-terrain-profile-point-is-outside = terrain: punkt profilu { $points } ({ $lat }, { $lon }) jest poza kafelkiem DEM

engine-e-jamming-terrain-terrain-profile-point-is-on = terrain: punkt profilu { $points } ({ $lat }, { $lon }) leży na pustce DEM

## src/jd2.rs

engine-e-jd2-utc-calendar-date-out-of = data kalendarzowa UTC poza zakresem: { $year }-{ $month }-{ $day } { $hour }:{ $minute }

engine-e-jd2-no-such-calendar-date = nie ma takiej daty kalendarzowej: { $year }-{ $month }-{ $day }

engine-e-jd2-utc-second-out-of-range = sekunda UTC { $second } poza zakresem w { $hour }:{ $minute }

## src/launch.rs

engine-e-launch-launch-site-at-the-pole = miejsce startu na biegunie nie ma określonego azymutu

engine-e-launch-inclination-unreachable-from-latitude-without = inklinacja { $inclination_rad }° nieosiągalna z szerokości { $lat_rad }° bez dogleg (potrzeba |lat| ≤ i ≤ 180−|lat|)

engine-e-launch-the-true-pole-site-speed = prędkość miejsca na prawdziwym biegunie wymaga zarówno `epoch`, jak i `eop_finals2000a` (rzeczywista treść IERS finals2000A)

engine-e-launch-site-lon-deg-must-be = site_lon_deg musi należeć do [-180, 360]

engine-e-launch-eop-finals2000a-contained-no-readable = eop_finals2000a nie zawiera czytelnych wierszy IERS finals2000A

engine-e-launch-epoch-mjd-is-outside-the = epoka { $epoch } (MJD { $mjd_utc }) jest poza podanymi wierszami EOP (MJD od { $mjd } do { $mjd2 })

engine-e-launch-site-lat-deg-must-be = site_lat_deg musi należeć do [-90, 90]

engine-e-launch-target-inclination-deg-must-be = target_inclination_deg musi należeć do [0, 180]

engine-launch-launch-window-lat-az-asc = launch-window: lat { $site_lat_deg }° -> i { $target_inclination_deg }°: Az { $asc }° asc, v_circ { $v_orbit } m/s, premia z obrotu Ziemi +{ $site_rotation_speed } m/s, okazje na dobę: { $opportunities } (MODELLED)

## src/leo_fusion/doppler.rs

engine-e-leo-fusion-doppler-every-range-rate-needs-positive = każda prędkość zmiany odległości wymaga dodatniej, skończonej sigmy

engine-e-leo-fusion-doppler-the-doppler-geometry-is-singular = geometria Dopplera jest osobliwa

engine-e-leo-fusion-doppler-no-covariance = brak kowariancji

## src/leo_fusion/joint_pvt.rs

engine-e-leo-fusion-joint-pvt-every-pseudorange-needs-positive-finite = każda pseudoodległość wymaga dodatniej, skończonej sigmy

engine-e-leo-fusion-joint-pvt-satellite-coincides-with-the-position = satelita pokrywa się z estymatą pozycji

engine-e-leo-fusion-joint-pvt-the-geometry-is-singular = geometria jest osobliwa

engine-e-leo-fusion-joint-pvt-no-iteration-ran = nie wykonano żadnej iteracji

engine-e-leo-fusion-joint-pvt-degenerate-final-geometry = zdegenerowana geometria końcowa

engine-e-leo-fusion-joint-pvt-the-dop-is-not-finite = DOP nie jest skończony

## src/leo_fusion/ntn.rs

engine-e-leo-fusion-ntn-must-be-positive = { $w } musi być dodatnie

engine-e-leo-fusion-ntn-sync-error-must-be-non = sync_error_m musi być nieujemne, a przebieg może mieć co najwyżej 5000 epok

engine-e-leo-fusion-ntn-every-signal-needs-positive-bandwidth = każdy sygnał wymaga dodatniej szerokości pasma

engine-leo-fusion-ntn-khz-crb-range-to-median = { "  " }{ $name }: { $s } kHz, zakres CRB od { $range_sigma_zenith_m } do { $range_sigma_mask_m } m; mediana formalna 3D { $s2 } m, błąd RMS { $s3 } m{ "\u000A" }

engine-leo-fusion-ntn-mhz-n0-db-hz-modelled = { $r } MHz · C/N0 { $r2 }-{ $r3 } dB-Hz · MODELLED

## src/leo_fusion/ppp.rs

engine-e-leo-fusion-ppp-ppp-needs-at-least-one = PPP wymaga co najmniej jednego systemu

engine-e-leo-fusion-ppp-duration-and-step-must-be = czas trwania i krok muszą być dodatnie, z co najwyżej 20000 epok

engine-e-leo-fusion-ppp-runs-must-be-to-200 = runs musi mieścić się w zakresie od 1 do 200

engine-e-leo-fusion-ppp-convergence-thresholds-must-be-positive = progi zbieżności muszą być dodatnie

engine-leo-fusion-ppp-leo-median-min-converged-nees = { "  " }{ $name } LEO: { $n_leo }  mediana { $c } min  zbieżne { $v4 }%  NEES średnia { $nees_mean }{ "\u000A" }

engine-leo-fusion-ppp-median-horizontal-error-across-runs = mediana błędu poziomego z przebiegów: { $runs_per_case } · MODELLED

## src/leo_fusion/presets/mod.rs

engine-e-leo-fusion-presets-preset-carries-no-signal = zestaw { $id } nie zawiera sygnału

engine-e-leo-fusion-presets-preset-has-no-signal-it = zestaw { $id } nie ma sygnału { $n }; ma: { $value }

engine-e-leo-fusion-presets-unknown-leo-preset-known = nieznany zestaw LEO { $id }; znane: { $all }

## src/leo_fusion/pvt_kind.rs

engine-e-leo-fusion-pvt-kind-duration-and-step-must-be = duration_s i step_s muszą być dodatnie, z co najwyżej 20000 epok

engine-e-leo-fusion-pvt-kind-polar-steps-must-be-positive = kroki polarne muszą być dodatnie

engine-e-leo-fusion-pvt-kind-mode-must-be-doppler-joint = mode musi mieć wartość doppler, joint, polar lub timing; otrzymano: { $m }

engine-e-leo-fusion-pvt-kind-doppler-mode-needs-at-least = tryb doppler wymaga co najmniej jednego systemu LEO

engine-e-leo-fusion-pvt-kind-timing-mode-needs-leo-system = tryb timing wymaga systemu LEO z pomiarem odległości kodem

engine-e-leo-fusion-pvt-kind-unknown-clock-class = nieznana klasa zegara { $c }

engine-leo-fusion-pvt-kind-leo-pvt-at-over = LEO PVT ({ $mode }) w { $user_lat_deg }, { $user_lon_deg } w ciągu { $duration_s } s{ "\u000A" }

engine-leo-fusion-pvt-kind-overhead-pass-max-doppler-hz = { "  " }{ $system } przelot nad głową: maks. Doppler { $max_doppler_hz } Hz, szybkość { $max_doppler_rate_hz_s } Hz/s, zryw { $max_doppler_jerk_hz_s2 } Hz/s^2{ "\u000A" }

engine-leo-fusion-pvt-kind-leo-ranging-satellite-in-view = { "  " }satelita LEO do pomiaru odległości w widoku w { $v1 }% epok{ "\u000A" }

engine-leo-fusion-pvt-kind-availability-median-pdop-rms-3d = { "  " }{ $n } dostępność { $availability }, mediana PDOP { $f }, błąd RMS 3D { $f2 } m{ "\u000A" }

engine-leo-fusion-pvt-kind-lat-vdop-gnss-leo-fused = { "  " }szer. { $lat_deg }: VDOP GNSS { $f } LEO { $f2 } po fuzji { $f3 }; w widoku { $mean_in_view }/{ $mean_in_view2 }{ "\u000A" }

engine-leo-fusion-pvt-kind-n0-db-rms-ns-95 = { "  " }{ $clock } C/N0 { $cn0_offset_db } dB: RMS { $row } ns, 95% { $row2 } ns, maks. { $row3 } ns (w widoku { $fraction_in_view }){ "\u000A" }

engine-leo-fusion-pvt-kind-leo-pvt-mode = LEO PVT — tryb { $mode }

## src/leo_fusion/system.rs

engine-e-leo-fusion-system-system-role-must-be-gnss = system { $name }: role musi mieć wartość gnss lub leo, otrzymano: { $r }

engine-e-leo-fusion-system-system-clock-must-be-estimated = system { $name }: clock musi mieć wartość estimated lub known, otrzymano: { $c }

engine-e-leo-fusion-system-system-must-be-positive = system { $name }: { $what } musi być dodatnie

engine-e-leo-fusion-system-system-mask-deg-must-be = system { $name }: mask_deg musi należeć do [0, 90)

engine-e-leo-fusion-system-system-sigma-pr-must-be = system { $name }: sigma_pr_m musi być dodatnie

engine-e-leo-fusion-system-give-at-least-one-system = podaj co najmniej jeden [[system]]

## src/leo_fusion/timing.rs

engine-e-leo-fusion-timing-the-epoch-spacing-must-be = odstęp epok musi być dodatni

engine-e-leo-fusion-timing-no-epochs = brak epok

engine-e-leo-fusion-timing-no-satellite-was-ever-in = żaden satelita nie był nigdy w widoku: odbiornik nigdy nie uzyskał czasu

## src/leo_link/antenna.rs

engine-e-leo-link-antenna-polarisation-must-be-rhcp-lhcp = polaryzacja musi być rhcp, lhcp lub linear; otrzymano: '{ $o }'

## src/leo_link/geometry.rs

engine-e-leo-link-geometry-sgp4-error-code-at = kod błędu SGP4 { $code } w t = { $t } s

engine-e-leo-link-geometry-an-orbit-inclined-deg-never = orbita o inklinacji { $inc } deg nigdy nie przechodzi nad szerokością { $phi } deg

engine-e-leo-link-geometry-the-requested-maximum-elevation-is = żądana maksymalna elewacja jest poniżej zasięgu horyzontu

## src/leo_link/itu.rs

engine-e-leo-link-itu-building-class-must-be-traditional = klasa budynku musi być traditional lub thermally-efficient; otrzymano: '{ $o }'

## src/leo_navmsg/codec.rs

engine-e-leo-navmsg-codec-field-is-not-finite = pole { $name } nie jest skończone

engine-e-leo-navmsg-codec-field-is-outside-its-bit = pole { $name } = { $value } { $unit } jest poza zakresem { $bits } bitów (|x| <= { $spec })

engine-e-leo-navmsg-codec-message-truncated = komunikat obcięty

engine-e-leo-navmsg-codec-field-list-exhausted = lista pól wyczerpana

engine-e-leo-navmsg-codec-field-order-mismatch-vs = niezgodność kolejności pól: { $name } wobec { $name2 }

engine-e-leo-navmsg-codec-svid-must-be-255 = SVID musi mieścić się w zakresie 1-255

engine-e-leo-navmsg-codec-each-correction-polynomial-needs-coefficients = każdy wielomian korekcji wymaga 1-8 współczynników

engine-e-leo-navmsg-codec-correction-time-scale-must-be = skala czasu korekcji musi być potęgą dwójki od 1 s do 32768 s; otrzymano: { $tau_s }

engine-e-leo-navmsg-codec-ecef-polynomial-needs-11-coefficients = wielomian ECEF wymaga 1-11 współczynników, równych dla każdej osi

engine-e-leo-navmsg-codec-ecef-polynomial-degree-exceeds-10 = stopień wielomianu ECEF { $v1 } przekracza 10

engine-e-leo-navmsg-codec-unknown-model-id = nieznany identyfikator modelu { $m }

engine-e-leo-navmsg-codec-payload-exceeds-4095-bytes = ładunek przekracza 4095 B

engine-e-leo-navmsg-codec-frame-shorter-than-header-and = ramka krótsza niż nagłówek i CRC

engine-e-leo-navmsg-codec-bad-preamble-0x = błędna preambuła 0x{ $frame }

engine-e-leo-navmsg-codec-unsupported-version = nieobsługiwana wersja { $version }

engine-e-leo-navmsg-codec-frame-length-does-not-match = długość ramki { $frame } nie zgadza się z zadeklarowanym ładunkiem { $len } B

engine-e-leo-navmsg-codec-crc-24q-mismatch-computed-0x = niezgodność CRC-24Q: obliczono 0x{ $crc }, ramka niesie 0x{ $got }

## src/leo_navmsg/fit.rs

engine-e-leo-navmsg-fit-rac-degrees-must-each-be = każdy z rac_degrees musi wynosić co najwyżej 7; otrzymano: { $rac_degrees }

engine-e-leo-navmsg-fit-poly-degree-must-be-10 = poly_degree musi mieścić się w zakresie 1-10; otrzymano: { $poly_degree }

engine-e-leo-navmsg-fit-unknown-ephemeris-model-use-kepler16 = nieznany model efemeryd '{ $other }': użyj kepler16, kepler-rac, liu22 lub ecef-poly

engine-e-leo-navmsg-fit-fit-interval-must-be-at = przedział dopasowania musi wynosić co najmniej 10 s; otrzymano: { $len }

engine-e-leo-navmsg-fit-fit-window-lies-outside-the = okno dopasowania [{ $t0 }, { $v1 }] s leży poza łukiem prawdy odniesienia [0, { $truth }] s

engine-e-leo-navmsg-fit-ecef-polynomial-fit-is-singular = dopasowanie wielomianu ECEF jest osobliwe (za mało próbek dla tego stopnia)

engine-e-leo-navmsg-fit-clock-fit-is-singular = dopasowanie zegara jest osobliwe

engine-e-leo-navmsg-fit-keplerian-fit-diverged = dopasowanie keplerowskie rozbiegło się

## src/leo_navmsg/mod.rs

engine-leo-navmsg-unknown-preset-available = nieznany zestaw '{ $k }'; dostępne: { $keys }

engine-e-leo-navmsg-fit-interval-must-be-10 = fit_interval_s musi mieścić się w 10-3600 s, a update_period_s w (0, fit_interval_s]; otrzymano: { $fit_interval_s } i { $update_period_s }

engine-e-leo-navmsg-fit-sample-and-eval-step = fit_sample_s i eval_step_s muszą mieścić się w { $lit_0_5 }-60 s

engine-e-leo-navmsg-carrier-hz-must-exceed-10 = carrier_hz musi przekraczać 10 MHz; otrzymano: { $carrier_hz }

engine-e-leo-navmsg-svid-must-be-255 = svid musi mieścić się w zakresie 1-255

engine-e-leo-navmsg-band-must-be-15-and = band musi mieścić się w zakresie 0-15, a health w 0-3

engine-e-leo-navmsg-unknown-csv-schema = nieznany csv_schema '{ $csv_schema }'

engine-e-leo-navmsg-analysis-must-name-at-least = analysis musi wskazywać co najmniej jedną analizę

engine-e-leo-navmsg-unknown-analysis-use = nieznana analiza '{ $a }'; użyj { $analyses }

engine-e-leo-navmsg-kind-must-be-leo-navmsg = kind musi mieć wartość leo-navmsg; otrzymano: { $k }

engine-e-leo-navmsg-mask-deg-must-be-in = mask_deg musi należeć do [0, 60); otrzymano: { $mask }

engine-leo-navmsg-leo-navigation-message-km-deg =
    komunikat nawigacyjny LEO — { $res } km, { $res2 } deg, stopień grawitacji { $gravity_degree }, model { $res3 }
    { "  " }wagi SISRE: w_R { $w_r }, w_AC^2 1/{ $v6 } (maska { $mask } deg){ "\u000A" }

engine-e-leo-navmsg-trade-span-must-be-60 = trade.span_s musi mieścić się w 60-86400 s

engine-e-leo-navmsg-trade-fit-intervals-must-be = trade.fit_intervals_s musi być niepuste, każdy przedział 10-3600 s

engine-leo-navmsg-fit-interval-trade-over-usage = { "  " }kompromis przedziału dopasowania w { $span } s (okres użycia = przedział dopasowania):{ "\u000A" }

engine-leo-navmsg-sisre-orbit-rms-max-with = { "    " }{ $model } { $fit_interval_s } s  SISRE orbity RMS { $sisre_orb_rms_m } m  maks. { $sisre_orb_max_m } m  z zegarem RMS { $sisre_rms_m } m{ "\u000A" }

engine-e-leo-navmsg-comparison-fit-intervals-must-be = comparison.fit_intervals_s musi być niepuste, każdy przedział 10-3600 s

engine-e-leo-navmsg-comparison-span-must-be-60 = comparison.span_s musi mieścić się w 60-86400 s

engine-leo-navmsg-params-sisre-orbit-rms-with = { "    " }{ $kind } { $l } s  parametry: { $m0 }  SISRE orbity RMS { $sisre_orb_rms_m } m  z zegarem { $sisre_rms_m } m{ "\u000A" }

engine-e-leo-navmsg-no-pass-above-deg-for = brak przelotu powyżej { $mask } deg dla użytkownika w { $lat }, { $lon } w ciągu { $search } s; zwiększ midpass.search_s albo przesuń użytkownika

engine-leo-navmsg-mid-pass-update-pass-max = { "  " }aktualizacja w trakcie przelotu: przelot { $p0 }-{ $p1 } s (maks. elewacja { $pmax } deg), przełączenia: { $switches }, największy skok odległości użytkownika { $max_jump } m (geometria najgorszego przypadku { $max_worst } m) wobec progu { $threshold } m: { $v8 }{ "\u000A" }

engine-leo-navmsg-encode-decode-model-frame-bytes =
    { "  " }kodowanie-dekodowanie: model { $m }, ramka { $frame } B (bity ładunku: { $payload_bits }, bity efemeryd i zegara: { $eph_bits }), CRC-24Q 0x{ $hex }
    { "    " }kwantyzacja: największa zmiana pozycji { $v6 } mm, zegara { $v7 } mm; SISRE dokładne { $acc_exact } m, skwantowane { $acc_q } m
    { "    " }uszkodzona ramka odrzucona: { $corrupted_rejected }; cykl RINEX { $rin_dp } m; cykl CSV { $csv_dp }{ "\u000A" }

engine-e-leo-navmsg-comparison-liu-arcs-must-be = comparison.liu_arcs musi mieścić się w 1-20

engine-leo-navmsg-km-kshana-published-ratio = { "    " }{ $name } { $alt } km  Kshana { $sisre_orb_rms_m } m  opublikowane { $published } m  stosunek { $st }{ "\u000A" }

engine-leo-navmsg-the-16-parameter-keplerian-set = Zestaw keplerowski o 16 parametrach pogarsza się z { $a } m przy { $lo } s do { $b } m przy { $hi } s: jeden zestaw keplerowski z harmonicznymi dwa razy na obrót nie nadąża za wyższoczęstotliwościowymi składowymi grawitacji i oporem atmosfery na łuku LEO dłużej niż kilka minut, a jego reszta najmniejszych kwadratów oscyluje w oknie. Wielomiany wzdłuż/w poprzek/promieniowe, o wyższym stopniu, niż obejmuje zestaw keplerowski, pochłaniają to, co zostaje, dając { $c } m przy { $hi } s.

engine-leo-navmsg-the-16-parameter-keplerian-set-2 = Zestaw keplerowski o 16 parametrach przechodzi z { $a } m przy { $lo } s do { $b } m przy { $hi } s.

engine-leo-navmsg-km-deg-gravity-degree-representation = { $res } km, { $res2 } deg, stopień grawitacji { $gravity_degree } · błąd reprezentacji względem prawdy odniesienia · MODELLED

## src/leo_navmsg/tests.rs

engine-leo-navmsg-tests-is-the-host-library = { $v1 }: `{ $call }` pochodzi z biblioteki hosta

engine-leo-navmsg-tests-rand-distr-samplers-call-the = { $v1 }: próbniki `rand_distr` wywołują `exp` i `ln` hosta w rzadkich gałęziach; użyj `portable_math::standard_normal`

engine-leo-navmsg-tests-acceleration-is-the-host-library = { $v1 }: `.acceleration(` to pole grawitacyjne z biblioteki hosta; użyj `.acceleration_portable(`

engine-leo-navmsg-tests-has-not-been-reviewed = { $v1 }: `{ $path }` nie został przejrzany

## src/leo_navmsg/text.rs

engine-e-leo-navmsg-text-no-end-of-header-line = brak wiersza END OF HEADER

engine-e-leo-navmsg-text-expected-eph-record-header-got = oczekiwano nagłówka rekordu '> EPH', otrzymano: { $head }

engine-e-leo-navmsg-text-bad-satellite-id = błędny identyfikator satelity { $parts }

engine-e-leo-navmsg-text-missing-epoch-line = brak wiersza epoki

engine-e-leo-navmsg-text-bad-epoch-line = błędny wiersz epoki { $ep }

engine-e-leo-navmsg-text-bad-epoch-field-in = błędne pole epoki w { $ep }

engine-e-leo-navmsg-text-epoch-line-needs-three-clock = wiersz epoki wymaga trzech wyrazów zegara: { $ep }

engine-e-leo-navmsg-text-record-truncated = rekord obcięty

engine-e-leo-navmsg-text-unknown-record-type = nieznany typ rekordu { $other }

engine-e-leo-navmsg-text-the-csv-table-carries-kepler16 = tabela CSV niesie komunikaty kepler16 i kepler-rac; otrzymano: { $m }

engine-e-leo-navmsg-text-empty-csv = pusty CSV

engine-e-leo-navmsg-text-row-has-cells-header = wiersz ma komórek: { $cells }, nagłówek: { $header }

engine-e-leo-navmsg-text-bad-number-in-column = błędna liczba { $c } w kolumnie { $k }

engine-e-leo-navmsg-text-csv-row-lacks = w wierszu CSV brak { $k }

## src/leo_navmsg/truth.rs

engine-e-leo-navmsg-truth-orbit-altitude-must-be-between = wysokość orbity musi mieścić się między 100 km a 3000 km; otrzymano: { $cfg } km

engine-e-leo-navmsg-truth-eccentricity-must-be-in-for = mimośród musi należeć do [0, { $lit_0_1 }) dla dopasowania LEO; otrzymano: { $eccentricity }

engine-e-leo-navmsg-truth-integration-step-must-be-in = krok całkowania musi należeć do (0, 30] s; otrzymano: { $step_s }

engine-e-leo-navmsg-truth-duration-must-be-positive-with = czas trwania musi być dodatni, z co najwyżej 200000 kroków; otrzymano: { $duration_s } s

engine-e-leo-navmsg-truth-gravity-degree-must-be-zonal = gravity_degree musi wynosić 0, 2-6 (zonalne) lub 7-{ $v1 } (EGM2008); otrzymano: { $gravity_degree }

engine-e-leo-navmsg-truth-truth-propagation-diverged = propagacja prawdy odniesienia rozbiegła się

engine-e-leo-navmsg-truth-truth-orbit-decayed-below-80 = orbita prawdy odniesienia zanikła poniżej 80 km

engine-e-leo-navmsg-truth-node-spacing-must-be-in = odstęp węzłów musi należeć do (0, 60] s; otrzymano: { $step_s }

engine-e-leo-navmsg-truth-tabulated-truth-orbit-needs-at = tabelaryczna orbita prawdy odniesienia wymaga co najmniej dwóch stanów; otrzymano: { $states }

engine-e-leo-navmsg-truth-state-is-not-finite = stan { $k } nie jest skończony

engine-e-leo-navmsg-truth-clock-adev-1s-must-be = adev_1s zegara musi należeć do [0, 1e-6); otrzymano: { $adev_1s }

engine-e-leo-navmsg-truth-measured-clock-is-built-with = zegar mierzony buduje się przez TruthClock::from_samples

engine-e-leo-navmsg-truth-steered-clock-needs-sigma-in = zegar sterowany wymaga sigma_s w [0, 1e-3) i tau_s > 0; otrzymano: { $sigma_s }, { $tau_s }

engine-e-leo-navmsg-truth-measured-clock-needs-positive-step = zegar mierzony wymaga dodatniego kroku i co najmniej dwóch próbek

engine-e-leo-navmsg-truth-measured-clock-sample-is-not = próbka zegara mierzonego nie jest skończona

## src/leo_pass.rs

engine-e-leo-pass-epoch-is-not-yyyy-mm = epoka '{ $s }' nie ma postaci YYYY-MM-DDTHH:MM:SS

engine-leo-pass-epoch-is-not-yyyy-mm = epoka '{ $s }' nie ma postaci YYYY-MM-DDTHH:MM:SS

engine-e-leo-pass-epoch-has-bad-seconds-field = epoka '{ $s }' ma błędne pole sekund

engine-e-leo-pass-epoch-is-out-of-range = epoka '{ $s }' jest poza zakresem

engine-e-leo-pass-band-unknown-signal-design-public = pasmo '{ $name }': nieznany projekt sygnału '{ $n }'; projekty publiczne: { $v2 }

engine-e-leo-pass-band-is-not-in-the = pasma '{ $name }' nie ma w zestawie systemu: podaj frequency_mhz i eirp_dbw

engine-e-leo-pass-band-needs-eirp-dbw = pasmo '{ $name }' wymaga eirp_dbw

engine-e-leo-pass-pattern-must-be-isoflux-gaussian = pattern musi mieć wartość isoflux, gaussian lub flat; otrzymano: '{ $o }'

engine-e-leo-pass-band-frequency-out-of-range = częstotliwość pasma '{ $name }' poza zakresem

engine-leo-pass-overridden-in-the-scenario = { $source } (nadpisane w scenariuszu)

engine-e-leo-pass-system-has-no-band = system '{ $id }' nie ma pasma '{ $n }'

engine-e-leo-pass-leo-satellite-needs-at-least = satelita LEO wymaga co najmniej jednego pasma

engine-e-leo-pass-at-most-12-bands-per = co najwyżej 12 pasm na satelitę

engine-leo-pass-unknown-system-presets-in-this = nieznany system '{ $n }'; zestawy w tej kompilacji: { $ids }

engine-e-leo-pass-no-sun-synchronous-orbit-at = brak orbity heliosynchronicznej na wysokości { $v1 } km

engine-e-leo-pass-duration-at-most-86400-and = duration_s (co najwyżej 86400) i step_s muszą być dodatnie, z co najwyżej 20000 epok; otrzymano: { $duration } i { $step }

engine-leo-pass-leo-satellite-km-deg = satelita LEO { $system }, { $s } km, { $inclination_deg } deg ({ $orbit_source })

engine-leo-pass-the-scenario-epoch-read-as = `epoch` scenariusza { $epoch }, odczytane jako UTC

engine-leo-pass-the-kind-default-epoch-utc = domyślna epoka rodzaju { $epoch } UTC (scenariusz jej nie podaje)

engine-e-leo-pass-user-environment-must-be-ground = user.environment musi mieć wartość ground, maritime, air lub indoor; otrzymano: '{ $o }'

engine-e-leo-pass-user-lat-deg-must-be = user.lat_deg musi mieścić się w +/-90

## src/leo_pass.rs

engine-e-leo-pass-user-speed-must-be-to = prędkość użytkownika musi mieścić się w zakresie 0 do 3000 m/s, a wysokość w zakresie -500 do 100000 m

engine-e-leo-pass-user-antenna-must-be-patch = user.antenna musi mieć wartość patch, hemispherical lub isotropic; otrzymano '{ $o }'

engine-e-leo-pass-user-building-probability-must-be = user.building_probability musi należeć do przedziału (0, 1)

engine-e-leo-pass-ionosphere-model-must-be-klobuchar = ionosphere.model musi mieć wartość klobuchar, vtec lub none; otrzymano '{ $o }'

engine-e-leo-pass-direction-must-be-ascending-or = direction musi mieć wartość ascending lub descending; otrzymano '{ $o }'

engine-e-leo-pass-satellite-bad-eccentricity-or-perigee = satelita { $id }: nieprawidłowy mimośród lub perygeum

engine-e-leo-pass-satellite-tle-needs-tle-line1 = satelita { $id }: tle wymaga tle_line1 i tle_line2

engine-e-leo-pass-orbit-must-be-pass-elements = orbit musi mieć wartość pass, elements lub tle; otrzymano '{ $o }'

engine-e-leo-pass-leo-constellation-needs-system-or = leo_constellation wymaga systemu lub projektu

engine-e-leo-pass-no-sun-synchronous-inclination = brak inklinacji heliosynchronicznej

engine-e-leo-pass-leo-constellation-at-most-5000 = leo_constellation: najwyżej 5000 satelitów

engine-e-leo-pass-no-leo-satellite-rises-above = żaden satelita LEO nie wznosi się powyżej maski w tym oknie

engine-e-leo-pass-spoofer-window-must-be-in = spoofer.window_s musi należeć do przedziału (0, 3600]

engine-e-leo-pass-spoofer-bands-is-not-band = spoofer.bands: '{ $b }' nie jest pasmem żadnego satelity LEO ({ $names })

engine-e-leo-pass-no-gnss-signal-for-constellation = brak sygnału GNSS '{ $bname }' dla konstelacji '{ $cons }'

engine-e-leo-pass-empty-gnss-constellation = pusta konstelacja GNSS

engine-e-leo-pass-iono-free-pairs-are-not = iono_free_pairs: '{ $a }'/'{ $b }' nie są dwoma różnymi pasmami satelity { $id }

engine-e-leo-pass-iot-powers-and-battery-must = moce i bateria iot muszą być dodatnie

engine-e-leo-pass-iot-cn0-from-must-be = iot.cn0_from musi mieć wartość median lub peak; otrzymano '{ $o }'

engine-leo-pass-detection-threshold-db-after-integration = próg detekcji: { $detection_snr_db } dB po integracji

engine-leo-pass-coherent-integration-at-most-ms = integracja koherentna co najwyżej { $rx } ms, ograniczona szybkością zmiany Dopplera

engine-leo-pass-serial-search-with-correlators = wyszukiwanie szeregowe, liczba korelatorów: { $correlators }

engine-leo-pass-hot-start-doppler-known-to = gorący start: Doppler znany z dokładnością +/-{ $aided } Hz, efemerydy ważne

engine-leo-pass-leo-pass-link-budget-user = Bilans łącza przelotu LEO, użytkownik ({ $environment }) w punkcie { $lat_deg }, { $lon_deg }; satelity LEO: { $satellites }; okno: { $duration_s } s{ "\u000A" }

engine-leo-pass-km-max-elevation-deg-at = { "  " }{ $id } [{ $system } { $source_kind }]: { $sat } km, maks. elewacja { $max_elevation_deg } deg w { $tca_s } s, { $duration_above_mask_s } s powyżej maski{ "\u000A" }

engine-leo-pass-mhz-n0-peak-median-doppler = { "    " }{ $name } { $b } MHz: C/N0 szczyt { $opt }, mediana { $opt2 }; |Doppler| maks. { $opt3 }; jonosfera { $b2 }{ "\u000A" }

engine-leo-pass-gnss-in-view-n0-to = { "  " }GNSS { $constellation } { $band }: w widoku { $satellites_in_view }, C/N0 { $opt } do { $opt2 } (mediana { $opt3 }){ "\u000A" }

engine-leo-pass-leo-peak-db-hz-is = { "  " }LEO { $leo_band } szczyt { $leo_peak_cn0_dbhz } dB-Hz, czyli o { $leo_peak_above_gnss_median_db } dB powyżej mediany GNSS; powyżej najsilniejszej nośnej GNSS przez { $leo_seconds_above_gnss_max } s{ "\u000A" }

engine-leo-pass-iot-cold-ttff-mj-hot = { "  " }IoT { $signal }: zimny TTFF { $ttff_s } s ({ $energy_per_fix_mj } mJ), gorący { $ttff_s2 } s ({ $energy_per_fix_mj2 } mJ){ "\u000A" }

engine-leo-pass-spoofer-from-jump-push-doppler = { "  " }Spoofer od { $onset_s } s (skok { $offset_m } m, przesuwanie { $push_rate_m_s } m/s): test Dopplera GNSS { $t }, LEO { $t2 }, fuzja { $t3 }; między pasmami { $t4 }{ "\u000A" }

engine-leo-pass-user-leo-peak-db-hz = użytkownik ({ $environment }) · szczyt LEO { $leo_peak_cn0_dbhz } dB-Hz, o { $leo_peak_above_gnss_median_db } dB powyżej mediany GNSS · MODELLED

engine-leo-pass-user-modelled = użytkownik ({ $environment }) · MODELLED

engine-leo-pass-doppler-of-each-leo-satellite = Doppler pierwszego pasma każdego satelity LEO (±{ $v1 } kHz pełnej skali)

## src/leo_pnt_chain.rs

engine-e-leo-pnt-chain-invalid-table = nieprawidłowa tabela [{ $what }]: { $e }

engine-e-leo-pnt-chain-signal-design-is-neither-in = signal_design '{ $signal_design }' nie występuje w [signal] ani nie jest publicznym projektem ({ $v2 })

engine-e-leo-pnt-chain-signal-design-has-no-code = signal_design '{ $name }' nie ma składnika śledzonego kodem, więc nie daje pseudoodległości

engine-e-leo-pnt-chain-kind-must-be-leo-pnt = kind musi mieć wartość leo-pnt-chain; otrzymano { $k }

engine-e-leo-pnt-chain-the-tracked-component-has-no = śledzony składnik nie ma szybkości chipów

engine-e-leo-pnt-chain-no-band-of-pass-names = żadne pasmo w [pass] nie ma signal = "{ $name }"; łańcuch potrzebuje takiego pasma, aby przenieść projekt

engine-e-leo-pnt-chain-the-pass-gives-no-code = przelot nie daje jittera kodu

engine-e-leo-pnt-chain-od-sisre-must-be-in = od_sisre_m musi należeć do przedziału [0, 100] m; otrzymano { $od }

engine-e-leo-pnt-chain-fusion-must-run-mode-joint = { "[" }fusion] musi działać z mode = "joint"; otrzymano { $mode }

engine-leo-pnt-chain-tracked-n0-at-the-deg = śledzone C/N0 przy masce { $mask } deg (dopasowanie prostej względem sin elewacji)

engine-e-leo-pnt-chain-fusion-has-no-leo-system = { "[" }fusion] nie ma systemu LEO, który mógłby odebrać wartości łańcucha

engine-e-leo-pnt-chain-fusion-produced-no-joint-block = { "[" }fusion] nie wytworzyło bloku joint

engine-leo-pnt-chain-leo-pnt-chain = Łańcuch LEO-PNT: { $name }

engine-leo-pnt-chain-signal-tracked-at-mchip-n0 =
    { $name }
    { "  " }sygnał { $name2 } ({ $design }), śledzony { $design2 } przy { $v4 } Mchip/s, przesunięcie C/N0 { $offset } dB{ "\u000A" }

engine-leo-pnt-chain-pass-km-tracked-n0-peak = { "  " }przelot { $id } { $sat } km: szczyt śledzonego C/N0 { $peak_tracked_cn0_dbhz } dB-Hz, mediana jittera kodu { $jitter_median } m; prosta C/N0 { $a } + { $b } sin(el) dB-Hz{ "\u000A" }

engine-leo-pnt-chain-message-fit-update-representation-sisre = { "  " }komunikat { $res }: dopasowanie { $fit_interval_s } s / aktualizacja co { $update_period_s } s: SISRE reprezentacji { $stats } mm RMS (orbita { $stats2 } mm), przy wyznaczaniu orbity { $od } m: przekazane { $sisre } m{ "\u000A" }

engine-leo-pnt-chain-pdop-rms-3d = PDOP { $f } RMS 3D { $f2 }

engine-leo-pnt-chain-fused-fix-gnss-only-gnss = { "  " }rozwiązanie fuzyjne: tylko GNSS { $f3 } -> GNSS + LEO { $f32 }{ "\u000A" }

engine-leo-pnt-chain-ppp-convergence = { "  " }zbieżność PPP: { $cells }{ "\u000A" }

engine-leo-pnt-chain-values-handed-between-stages-modelled = { "  " }{ $doc } wartości przekazywanych między etapami. MODELLED.

engine-leo-pnt-chain-code-tracking-jitter-the-ranging = Jitter śledzenia kodu, błąd wyznaczania odległości (m, 0 do { $jmax })

engine-leo-pnt-chain-sisre-gnss-only-rms-3d = SISRE { $f } · tylko GNSS RMS 3D { $f2 } · GNSS + LEO RMS 3D { $f3 }

## src/leo_signal.rs

engine-e-leo-signal-modulation-the-width-must-be = modulacja { $label }: szerokość musi być dodatnia

engine-leo-signal-flat-mhz = FLAT({ $v1 } MHz)

engine-e-leo-signal-unknown-signal-preset-the-library = nieznany preset sygnału { $name }: biblioteka zawiera { $preset_names }

engine-e-leo-signal-preset-invalid-preset-file = preset { $name }: nieprawidłowy plik presetu: { $e }

engine-e-leo-signal-preset-file-names-itself = plik presetu { $name } nazywa się w treści { $name2 }

engine-e-leo-signal-centre-mhz-must-be-positive = { $name }: centre_mhz musi być dodatnie

engine-e-leo-signal-tx-bandwidth-mhz-must-be = { $name }: tx_bandwidth_mhz musi być dodatnie

engine-e-leo-signal-signal-needs-at-least-one = { $name }: sygnał wymaga co najmniej jednego składnika

engine-e-leo-signal-component-power-fraction-must-be = { $name }: składnik { $v1 }: power_fraction musi być dodatnie

engine-e-leo-signal-component-has-fdma-shares-but = { $name }: składnik { $v1 } ma fdma_shares, ale nie ma fdma_offsets_mhz

engine-e-leo-signal-component-fdma-shares-must-be = { $name }: składnik { $v1 }: fdma_shares musi być dodatnie, a suma równa jeden

engine-e-leo-signal-component-needs-one-fdma-share = { $name }: składnik { $v1 } wymaga jednego fdma_share na każde przesunięcie

engine-e-leo-signal-data-rate-sps-must-be = { $name }: data_rate_sps musi być dodatnie

engine-e-leo-signal-code-length-chips-must-be = { $name }: code_length_chips musi być dodatnie

engine-e-leo-signal-component-power-fractions-sum-to = { $name }: suma ułamków mocy składników wynosi { $total }, a nie 1

engine-e-leo-signal-orbit-altitude-km-must-be = { $name }: orbit_altitude_km musi być dodatnie

engine-e-leo-signal-flat-ofdm-like-component-cannot = { $name }: płaski składnik (typu OFDM) nie może być umieszczony w modelu widma

engine-e-leo-signal-the-tracked-component-sits-on = { $name }: śledzony składnik leży na podnośnych FDMA; model widma śledzi składnik w środku pasma

engine-e-leo-signal-signal-is-given-twice = sygnał { $w } podano dwukrotnie

engine-e-leo-signal-signals-is-more-than-the = sygnały: { $out }, to więcej niż dozwolone 24

engine-e-leo-signal-receiver-loop-bandwidth-hz-integration = receiver: loop_bandwidth_hz x integration_time_s musi być mniejsze niż 1

engine-e-leo-signal-receiver-give-to-40-cn0 = receiver: podaj od 1 do 40 wartości cn0_dbhz

engine-e-leo-signal-trade-slant-range-km-and = trade: slant_range_km > 0 oraz slant_tec_tecu ≥ 0

engine-e-leo-signal-psd-points-must-be-between = psd_points musi mieścić się między 21 a 2001

engine-e-leo-signal-receiver-early-late-use-coherent = receiver.early_late { $o }: użyj "coherent" lub "non-coherent"

engine-e-leo-signal-the-system-noise-temperature-must = temperatura szumowa systemu musi być dodatnia

engine-e-leo-signal-compatibility-unknown-gnss-signal-known = compatibility: nieznany sygnał GNSS { $n } (znane: { $gnss_victim_names })

engine-e-leo-signal-trade-reference-signal-is-not = trade.reference_signal { $n } nie jest sygnałem scenariusza

engine-e-leo-signal-shape-check-signal-is-not = kontrola kształtu: sygnał { $signal } nie występuje w scenariuszu

engine-leo-signal-scenario-leo-signal-signals-noise = scenariusz leo-signal | sygnały: { $runs } | poziom szumu { $n0_db } dBW/Hz{ $v3 }{ $v4 }

engine-leo-signal-left-band-limited-psd-of = lewy: PSD każdego projektu ograniczone do pasma (dB poniżej szczytu, w obrębie pasma nadawczego); prawy: jitter kodu względem całkowitego C/N0 przy odstępie { $reference_spacing_chips } chipu

## src/linkbudget.rs

engine-e-linkbudget-unknown-band-expected-ka = nieznane pasmo '{ $other }' (oczekiwano s|x|ka)

engine-e-linkbudget-range-km-must-be-finite = range_km musi być skończone i dodatnie

engine-e-linkbudget-data-rate-bps-must-be = data_rate_bps musi być skończone i dodatnie

engine-e-linkbudget-other-losses-db-must-be = other_losses_db musi być skończone i >= 0

engine-e-linkbudget-tsys-must-be-finite-and = tsys_k musi być skończone i dodatnie, jeśli podano

engine-linkbudget-link-budget-band-km-bit = link-budget: pasmo { $value }, { $range_km } km, { $data_rate_bps } bit/s -> FSPL { $fsl_db } dB, Eb/N0 { $eb_n0_db } dB, margines { $margin_db } dB ({ $v7 })

## src/live_io.rs

engine-e-live-io-cannot-listen-on = nie można nasłuchiwać na { $addr }: { $e }

engine-live-io-kshana-live-listening-on-tcp = kshana live: nasłuchiwanie na tcp { $addr }

engine-live-io-kshana-live-tcp-client-connected = kshana live: klient tcp połączony

engine-live-io-kshana-live-warning-is-not = kshana live: ostrzeżenie: { $addr } nie jest adresem pętli zwrotnej; każdy, kto może go osiągnąć, może odczytać strumień

engine-e-live-io-cannot-open = nie można otworzyć { $spec }: { $e }

engine-live-io-kshana-live-dropped-tcp-client = kshana live: odrzucono klienta tcp, który nie nadążał

engine-e-live-io-cannot-open-2 = nie można otworzyć { $path }: { $e }

engine-live-io-kshana-live-warning-is-not-2 = kshana live: ostrzeżenie: { $addr } nie jest adresem pętli zwrotnej; każdy, kto może go osiągnąć, może wysłać tej warstwie strumień

engine-e-live-io-cannot-bind-udp = nie można powiązać udp { $addr }: { $e }

engine-live-io-kshana-live-listening-on-udp = kshana live: nasłuchiwanie na udp { $addr }

engine-e-live-io-cannot-connect-to = nie można połączyć się z { $addr }: { $e }

engine-live-io-kshana-live-connected-to-tcp = kshana live: połączono z tcp { $addr }

engine-live-io-kshana-live-reading-serial-at = kshana live: odczyt portu szeregowego { $path } przy { $baud } baud (tylko odczyt)

engine-live-io-the-was-closed-by-the = { $v1 }: zamknięte przez drugą stronę (warstwa nie łączy się ponownie: uruchom ją pod nadzorcą, który ją zrestartuje)

engine-e-live-io-baud-use-1200-2400-4800 = --baud { $baud }: użyj 1200, 2400, 4800, 9600, 19200, 38400, 57600, 115200 lub 230400

engine-e-live-io-is-not-serial-device-tcgetattr = { $path } nie jest urządzeniem szeregowym (tcgetattr nie powiodło się)

engine-e-live-io-cannot-set-baud = nie można ustawić { $baud } baud

engine-e-live-io-cannot-set-the-line-mode = nie można ustawić trybu liniowego dla { $path }

engine-e-live-io-serial-is-supported-on-unix = --serial jest obsługiwane tylko w systemie Unix; użyj --file, --tcp lub --stdin

engine-live-io-unknown-option = nieznana opcja { $s }

engine-live-io-cannot-read = nie można odczytać { $session }: { $e }

engine-live-io-kshana-live-vessel-platform-calibrating = kshana live: platforma statku, kalibracja przez { $calibration_s } s; bramka { $v2 }. Oprogramowanie wyłącznie doradcze, nie jest to sprzęt nawigacyjny z zatwierdzeniem typu: za nawigację odpowiada nadal operator.

engine-live-io-write-failed = zapis nie powiódł się: { $e }

## src/lunar_afs/codes.rs

engine-e-lunar-afs-codes-afs-prn-is-outside = AFS PRN { $prn } jest poza zakresem 1..={ $MAX_PRN }

engine-e-lunar-afs-codes-insertion-index-outside-10223 = indeks wstawienia { $p } poza zakresem 1..=10223

engine-e-lunar-afs-codes-annex-files-hold-and-codes = pliki Annex 3 zawierają kody: { $gold } i { $ter }, oczekiwano 210

engine-e-lunar-afs-codes-annex-afs-prn-is-not = Annex 3 AFS-I PRN { $v1 } nie jest kodem Golda z g1, g2 (LSIS Figure C-1)

engine-e-lunar-afs-codes-secondary-code-does-not-exist = kod wtórny S{ $id } nie istnieje (S0 do S3)

engine-e-lunar-afs-codes-lsis-v1-table-11-assigns = LSIS V1.0 Table 11 przypisuje kody tylko identyfikatorom węzłów od 1 do 12, a nie: { $node_id }

## src/lunar_afs/frame.rs

engine-e-lunar-afs-frame-fid-does-not-fit-two = FID { $fid } nie mieści się w dwóch bitach (0..3)

engine-e-lunar-afs-frame-toi-outside-99-lsis-410 = TOI { $toi } poza zakresem 0..99 (LSIS-410)

engine-e-lunar-afs-frame-subframe-symbols-expected = oczekiwano symboli podramki 1: { $SB1_SYMBOLS }

engine-e-lunar-afs-frame-subframe-data-lengths-expected = długości danych podramek { $sb2 }/{ $sb3 }/{ $sb4 } (oczekiwano { $SB2_DATA_BITS }/{ $SB34_DATA_BITS }/{ $SB34_DATA_BITS })

engine-e-lunar-afs-frame-symbols-expected-given = oczekiwano symboli: { $FRAME_SYMBOLS }, podano: { $soft }

## src/lunar_afs/ldpc.rs

engine-e-lunar-afs-ldpc-line-expected-row-column = wiersz { $v1 }: oczekiwano `row,column`

engine-e-lunar-afs-ldpc-line = wiersz { $v1 }: { $e }

engine-e-lunar-afs-ldpc-line-outside = wiersz { $v1 }: ({ $r },{ $c }) poza { $rows }x{ $cols }

engine-e-lunar-afs-ldpc-ldpc-information-bits-expected-given = LDPC { $subframe }: oczekiwano bitów informacyjnych: { $info_bits }, podano: { $info }

## src/lunar_afs/lsis.rs

engine-lunar-afs-lsis-the-lsis-v1-data-is = dane LSIS V1.0 nie znajdują się w { $cache_dir } (ustaw KSHANA_LSIS_DIR lub uruchom xval/lunar-afs/fetch_lsis.sh, który pobiera { $LSIS_PDF_URL } i wypakowuje jego załączniki; nie są one redystrybuowane z Kshana)

engine-e-lunar-afs-lsis-is-not-pinned-lsis-file = { $name } nie jest przypiętym plikiem LSIS

engine-e-lunar-afs-lsis-has-sha-256-expected-pinned = { $path } ma SHA-256 { $got }, oczekiwano { $want } (przypięte do LSIS V1.0 z 29 stycznia 2025); { $fetch_hint }

## src/lunar_afs/waveform.rs

engine-lunar-afs-waveform-lunanet-augmented-forward-signal-baseband = pasmo podstawowe LunaNet Augmented Forward Signal, { $LSIS_VERSION }; generator referencyjny Kshana

engine-lunar-afs-waveform-noise-seed = { $ns }:noise_seed

engine-lunar-afs-waveform-noise-variance-per-dimension = { $ns }:noise_variance_per_dimension

engine-lunar-afs-waveform-afs-node = węzeł AFS { $node_id }

engine-lunar-afs-waveform-component-cn0-dbhz = { $ns }:component_cn0_dbhz

engine-lunar-afs-waveform-code-scale = { $ns }:code_scale

engine-lunar-afs-waveform-first-code-epoch = { $ns }:first_i_code_epoch_s

engine-lunar-afs-waveform-afs-node-frame-toi = węzeł AFS { $node_id }, ramka TOI { $toi }

engine-lunar-afs-waveform-frame-index = { $ns }:frame_index

## src/lunar_beacon.rs

engine-e-lunar-beacon-satellites-must-be-at-least = n_satellites musi wynosić co najmniej 1

engine-e-lunar-beacon-comparison-satellites-must-be-at = comparison_n_satellites musi wynosić co najmniej 1

engine-e-lunar-beacon-elevation-mask-deg-must-be = elevation_mask_deg musi należeć do przedziału [0, 90); otrzymano { $mask_deg }

engine-e-lunar-beacon-serialising-beacon-report = serializacja raportu radiolatarni: { $e }

engine-e-lunar-beacon-the-beacon-report-must-serialise = raport radiolatarni musi dać się serializować do obiektu JSON

engine-lunar-beacon-gdop-pdop-hdop-vdop-tdop = GDOP { $gdop }  PDOP { $pdop }  HDOP { $hdop }  VDOP { $vdop }  TDOP { $tdop }

engine-lunar-beacon-lunar-surface-beacon-augmentation-mask = Wspomaganie radiolatarniami na powierzchni Księżyca — maska { $elevation_mask_deg } deg, epoka +{ $epoch_s } s, sigma_URE na radiolatarnię { $sigma_ure_m } m{ "\u000A" }

engine-lunar-beacon-sats-beacons = { "  " }{ $label }  satelity { $n_visible_sats }  radiolatarnie { $n_visible_beacons }  { $fmt_dop }{ "\u000A" }

engine-lunar-beacon-realised-sigma-3d = { "  " }{ $v1 }  uzyskane 1-sigma: 3D { $pos_3d_m } m  H { $horizontal_m } m  V { $vertical_m } m{ "\u000A" }

engine-lunar-beacon-beacons-improve-pdop-by = { "  " }radiolatarnie poprawiają PDOP o współczynnik { $f }x;{ " " }

engine-lunar-beacon-larger-constellation-instead = większa konstelacja zamiast nich: { $f }x{ "\u000A" }

## src/lunar_ephemeris.rs

engine-e-lunar-ephemeris-cannot-read-lunar-ephemeris = nie można odczytać efemeryd Księżyca { $path }: { $e }

engine-e-lunar-ephemeris-lunar-ephemeris-first-line-must = efemerydy Księżyca: pierwszy wiersz musi mieć postać `{ $MAGIC }`, znaleziono `{ $line }`

engine-e-lunar-ephemeris-lunar-ephemeris-file-is-empty = efemerydy Księżyca: plik jest pusty

engine-e-lunar-ephemeris-lunar-ephemeris-format-must-be = efemerydy Księżyca: `# format:` musi mieć wartość `states` lub `elements`, znaleziono `{ $other }`

engine-e-lunar-ephemeris-lunar-ephemeris-no-data-rows = efemerydy Księżyca: brak wierszy danych

engine-e-lunar-ephemeris-lunar-ephemeris-missing-column = efemerydy Księżyca: brak kolumny `{ $name }`

engine-e-lunar-ephemeris-lunar-ephemeris-elements-frame-must = efemerydy Księżyca: `# elements_frame:` musi mieć wartość `icrf` lub `mci`, znaleziono `{ $other }`

engine-e-lunar-ephemeris-lunar-ephemeris-elements-frame-icrf = efemerydy Księżyca: `elements_frame: icrf` wymaga `# epoch_jd_tdb:` (epoki, do której odniesiono elementy i w której oblicza się też obrót z ICRF do układu związanego z Księżycem): { $e }

engine-e-lunar-ephemeris-lunar-ephemeris-short-element-row = efemerydy Księżyca: zbyt krótki wiersz elementów { $v1 }

engine-e-lunar-ephemeris-lunar-ephemeris-element-row = efemerydy Księżyca: wiersz elementów { $v1 }: { $e }

engine-e-lunar-ephemeris-lunar-ephemeris-element-row-has = efemerydy Księżyca: wiersz elementów { $v1 } ma niedodatnią półoś wielką

engine-e-lunar-ephemeris-lunar-ephemeris-element-row-has-2 = efemerydy Księżyca: wiersz elementów { $v1 } ma mimośród { $ecc } poza przedziałem [0, 1)

engine-e-lunar-ephemeris-lunar-ephemeris-states-file-needs = efemerydy Księżyca: plik `states` wymaga `# frame: icrf` lub `# frame: mci`, znaleziono `{ $other }`

engine-e-lunar-ephemeris-lunar-ephemeris-an-icrf-states = efemerydy Księżyca: plik stanów `icrf` wymaga `# epoch_jd_tdb:`: { $e }

engine-e-lunar-ephemeris-lunar-ephemeris-short-state-row = efemerydy Księżyca: zbyt krótki wiersz stanu { $v1 }

engine-e-lunar-ephemeris-lunar-ephemeris-state-row = efemerydy Księżyca: wiersz stanu { $v1 }: { $e }

engine-e-lunar-ephemeris-lunar-ephemeris-state-row-is = efemerydy Księżyca: wiersz stanu { $v1 } nie jest skończony

engine-e-lunar-ephemeris-lunar-ephemeris-state-row-for = efemerydy Księżyca: wiersz stanu { $v1 } dla satelity { $sat } cofa się w czasie ({ $t } po { $last }); epoki muszą ściśle rosnąć dla każdego satelity

engine-lunar-ephemeris-tabulated-moon-centred-state-ephemeris = Tabelaryczne efemerydy stanów w układzie selenocentrycznym (układ { $e }), interpolowane metodą Lagrange'a rzędu { $LAGRANGE_ORDER } między epokami tabeli i sprowadzone do MCMF za pomocą { $v2 }. Stany NIE są propagowane przez ten silnik. Klasa pochodzenia `published-ephemeris`: odrębna od każdej wielkości wyprowadzonej z elementów.

engine-lunar-ephemeris-published-constellation-definition-stated-in = Opublikowana DEFINICJA konstelacji podana w selenocentrycznym ICRF (`{ $v1 }`), propagowana własnym solverem Keplera tego silnika w tym samym układzie inercjalnym i sprowadzona do MCMF za pomocą orientacji Księżyca IAU 2015 / WGCCRE (precesujący biegun, analityczna libracja fizyczna) w każdej epoce. ŻADNEGO przybliżenia układu: źródło podaje układ i epokę, a oba są użyte. Klasa pochodzenia `published-elements`: odrębna od każdej wielkości wyprowadzonej z jądra.

engine-lunar-ephemeris-published-constellation-definition-propagated-by = Opublikowana DEFINICJA konstelacji, propagowana własnym solverem Keplera tego silnika i sprowadzona modelem obrotu Księżyca według średniego obrotu — dokładnie tą samą ścieżką, którą przechodzi konstelacja ilustracyjna, więc jedyną różnicą między obu przebiegami jest projekt konstelacji. Źródło podaje elementy w układzie `{ $v1 }`; są tu odczytywane jako MCI, co przechyla konstelację o `published_frame_tie_angle_deg`. Klasa pochodzenia `published-elements`: odrębna od każdej wielkości wyprowadzonej z jądra.

## src/lunar_frame_campaign.rs

engine-e-lunar-frame-campaign-unknown-station-datum-expected-fixed = nieznany station_datum { $other }: oczekiwano "fixed" lub "estimated-anchor-first"

engine-e-lunar-frame-campaign-vlbi-campaign-needs-at-least = kampania VLBI wymaga co najmniej 2 stacji, aby utworzyć bazę, podano { $raw }

engine-e-lunar-frame-campaign-station-has-non-finite-coordinate = stacja { $name } ma nieskończoną współrzędną

engine-e-lunar-frame-campaign-station-latitude-deg-is-outside = szerokość stacji { $name }: { $lat } deg jest poza przedziałem [-90, 90]

engine-e-lunar-frame-campaign-seven-parameter-helmert-datum-needs = siedmioparametrowy datum Helmerta wymaga co najmniej 3 niewspółliniowych radiolatarni, podano { $raw }

engine-e-lunar-frame-campaign-beacon-has-non-finite-coordinate = radiolatarnia { $name } ma nieskończoną współrzędną

engine-e-lunar-frame-campaign-beacon-latitude-deg-is-outside = szerokość radiolatarni { $name }: { $lat } deg jest poza przedziałem [-90, 90]

engine-e-lunar-frame-campaign-arc-hours-must-be-positive = arc_hours musi być dodatnie i skończone, podano { $arc }

engine-e-lunar-frame-campaign-step-min-must-be-positive = step_min musi być dodatnie i skończone, podano { $step }

engine-e-lunar-frame-campaign-schedule-of-epochs-is-beyond = harmonogram epok: { $v1 } przekracza limit 5000 epok tego scenariusza; zwiększ step_min lub skróć arc_hours

engine-e-lunar-frame-campaign-delay-sigma-must-be-positive = delay_sigma_s musi być dodatnie i skończone, podano { $s }

engine-e-lunar-frame-campaign-elevation-mask-deg-must-be = elevation_mask_deg musi być skończone i należeć do [-90, 90), podano { $m }

engine-e-lunar-frame-campaign-earth-elevation-mask-deg-must = earth_elevation_mask_deg musi być skończone i należeć do [-90, 90), podano { $m }

engine-e-lunar-frame-campaign-rel-tol-must-be-finite = rel_tol musi być skończone i należeć do [0, 1), podano { $t }

engine-e-lunar-frame-campaign-assumed-coordinate-sigma-must-be = assumed_coordinate_sigma_m musi być dodatnie i skończone, podano { $s }

engine-e-lunar-frame-campaign-solver-must-be-spectral-or = solver musi mieć wartość "spectral" lub "srif", podano "{ $other }"

engine-e-lunar-frame-campaign-serializing-lunar-frame-campaign-result = serializacja wyniku lunar-frame-campaign: { $e }

engine-e-lunar-frame-campaign-no-observation-in-the-campaign = żadna obserwacja w kampanii nie przekracza maski elewacji po stronie Ziemi { $mask } deg na obu końcach bazy ORAZ maski { $earth_mask } deg nad własnym horyzontem radiolatarni: epoki: { $n_epochs } x bazy: { $v1 } x radiolatarnie: { $n_beacons }, wszystkie odrzucone. Wydłuż arc_hours, obniż maskę lub przesuń stacje.

engine-lunar-frame-campaign-full-rank-all-similarity-parameters = pełna ranga: wszystkie 7 parametrów podobieństwa jest ograniczonych przez tę kampanię (liczba uwarunkowania { $condition })

engine-lunar-frame-campaign-rank-deficient-of-similarity-directions = RANK-DEFICIENT: kierunków podobieństwa nieobserwowalnych w tej kampanii: { $defect } z 7, więc NIE publikuje się sigma datum; kierunki nieobserwowalne podano w bazie siedmiu parametrów

engine-lunar-frame-campaign-lunar-frame-campaign-beacons-baselines = lunar-frame-campaign | radiolatarnie: { $n_beacons } x bazy: { $v1 } x epoki: { $n_epochs } = obserwacje: { $n_obs } (sigma opóźnienia { $sigma_tau } s) | datum stacji { $station_datum } | ranga Helmerta { $rank }/7, uwarunkowanie { $condition } | sigma translacji datum { $v5 } wobec błędu odtworzenia wstrzykniętej transformacji { $trans_err_norm_m } m (stosunek { $v7 })

engine-lunar-frame-campaign-of-beacons-have-no-observation = radiolatarnie bez obserwacji w tym harmonogramie: { $names } z { $beacons } ({ $names2 }); nie niosą informacji, ich sigma są null, a datum jest realizowane wyłącznie z obserwowanych radiolatarni

## src/lunar_infra/geodesy.rs

engine-e-lunar-infra-geodesy-all-sigmas-must-be-positive = wszystkie sigma muszą być dodatnie

## src/lunar_infra/gnss.rs

engine-e-lunar-infra-gnss-gnss-planes-sats-per-plane = gnss: planes, sats_per_plane i altitude_km muszą być dodatnie

engine-e-lunar-infra-gnss-gnss-tx-efficiency-must-be = gnss: tx_efficiency musi należeć do przedziału (0, 1]

## src/lunar_infra/mod.rs

engine-lunar-infra-lunar-infrastructure-od-consistency-gnss = lunar-infrastructure od-consistency: GNSS { $v } m wobec naziemnego { $v2 } m sigma położenia, średnie q { $v3 } (chi-kwadrat 6 oczekuje 6)

engine-lunar-infra-lunar-infrastructure-carrier-phase-ambiguities = lunar-infrastructure carrier-phase: niejednoznaczności: { $last }, sukces ILS { $last2 } (bootstrap { $last3 }) na najdłuższym łuku

engine-lunar-infra-lunar-infrastructure-frame-coestimation-smallest = lunar-infrastructure frame-coestimation: najmniejsza wartość własna informacji x{ $v } z łączami orbitera, ślad CRLB x{ $v2 }

## src/lunar_infra/mod.rs

engine-lunar-infra-lunar-infrastructure-space-tie-sweep = lunar-infrastructure space-tie: punkty przemiatania: { $last } na łukach: { $v }; laser względem GNSS: sigma translacji x { $last2 } m przy zarejestrowanym wiązaniu lokalnym

engine-lunar-infra-lunar-infrastructure-geodesy-sensitivity-crlb = lunar-infrastructure geodesy-sensitivity: sigma CRLB h2 { $v }, k2 { $v2 }, l2 { $v3 }

engine-e-lunar-infra-unknown-study-expected-one-of = nieznane badanie `{ $other }`: oczekiwano jednego z { $studies }

## src/lunar_infra/od.rs

engine-e-lunar-infra-od-the-measurement-set-does-not = zbiór pomiarów nie wyznacza orbity (osobliwa macierz informacji)

engine-e-lunar-infra-od-monte-carlo-trials-must-be = monte_carlo.trials musi wynosić co najmniej 1

engine-e-lunar-infra-od-ground-sigmas-must-be-positive = sigma naziemne muszą być dodatnie

engine-e-lunar-infra-od-unknown-station-dss-14-dss = nieznana stacja `{ $nm }`: DSS-14, DSS-63 lub DSS-43

engine-e-lunar-infra-od-too-few-ground-measurements-to = zbyt mało pomiarów naziemnych, aby wyznaczyć orbitę

engine-e-lunar-infra-od-the-covariance-of-the-difference = kowariancja różnicy jest osobliwa

## src/lunar_infra/orbit.rs

engine-e-lunar-infra-orbit-the-nrho-differential-correction-did = różniczkowa korekta NRHO nie zbiegła się od ziarna (seed)

engine-e-lunar-infra-orbit-elfo-needs-perilune-altitude-apolune = elfo wymaga 0 < wysokość perycynthionu < wysokość apocynthionu

engine-e-lunar-infra-orbit-unknown-orbit-family-nrho-or = nieznana rodzina orbit `{ $other }`: nrho lub elfo

engine-e-lunar-infra-orbit-sample-and-arc-days-must = sample_s i arc_days muszą być dodatnie

## src/lunar_infra/phase.rs

engine-e-lunar-infra-phase-no-common-satellite-between-the = brak wspólnego satelity między odbiornikami

engine-e-lunar-infra-phase-the-carrier-phase-normal-equations = równania normalne fazy nośnej są osobliwe

engine-e-lunar-infra-phase-the-position-block-is-singular = blok położenia jest osobliwy

engine-e-lunar-infra-phase-the-ambiguity-covariance-is-not = kowariancja niejednoznaczności nie jest dodatnio określona

## src/lunar_infra/tie.rs

engine-e-lunar-infra-tie-technique-sigmas-must-be-positive = sigma technik muszą być dodatnie

engine-e-lunar-infra-tie-local-tie-sigmas-must-be = sigma wiązania lokalnego muszą być dodatnie

## src/lunar_jamming.rs

engine-e-lunar-jamming-carrier-hz-must-be-finite = carrier_hz musi być skończone i dodatnie

engine-e-lunar-jamming-chip-rate-hz-must-be = chip_rate_hz musi być skończone i dodatnie

engine-e-lunar-jamming-temp-must-be-finite-and = temp_k musi być skończone i dodatnie

engine-e-lunar-jamming-sma-km-must-be-finite = sma_km musi być skończone i większe od promienia Księżyca

engine-e-lunar-jamming-eccentricity-must-be-in = eccentricity musi należeć do przedziału [0, 1)

engine-e-lunar-jamming-jammer-power-dbw-must-be = jammer.power_dbw musi być skończone

engine-lunar-jamming-lunar-jamming-sats-epochs-links = lunar-jamming | satelity: { $n_sats }, epoki: { $n_epochs }, łącza: { $n_links } z ({ $site_lat_deg }, { $site_lon_deg }) | J/S { $min_js_db }..{ $max_js_db } dB (średnio { $mean_js_db }) | { $n_lost } LOST | dostępność { $availability_under_jamming } wobec nominalnej { $availability_nominal }

engine-lunar-jamming-lunar-jamming-sats-epochs-links-2 = lunar-jamming | satelity: { $n_sats }, epoki: { $n_epochs }, łącza: { $n_links } z ({ $site_lat_deg }, { $site_lon_deg }) | bez zagłuszarki (księżycowy wzorzec przy czystym niebie) | { $n_lost } LOST | dostępność { $availability_nominal }

## src/lunar_llr.rs

engine-e-lunar-llr-unexpected-reflector-catalogue-header = nieoczekiwany nagłówek katalogu reflektorów { $t }

engine-e-lunar-llr-short-reflector-catalogue-row = zbyt krótki wiersz katalogu reflektorów { $t }

engine-e-lunar-llr-unreadable-reflector-field-in = nieczytelne pole reflektora { $i } w { $t }

engine-e-lunar-llr-reflector-but-the-published-radius = reflektor { $f }: |(x,y,z)| = { $norm3 } m, ale kolumna opublikowanego promienia podaje { $radius } m — wiersz został zmieniony

engine-e-lunar-llr-reflector-catalogue-has-no-rows = katalog reflektorów nie ma wierszy

engine-e-lunar-llr-unreadable-position-epoch-year = nieczytelny position_epoch_year { $rest }

engine-e-lunar-llr-unexpected-station-catalogue-header = nieoczekiwany nagłówek katalogu stacji { $t }

engine-e-lunar-llr-short-station-catalogue-row = zbyt krótki wiersz katalogu stacji { $t }

engine-e-lunar-llr-unreadable-station-field-in = nieczytelne pole stacji { $i } w { $t }

engine-e-lunar-llr-unreadable-ilrs-id-in = nieczytelny identyfikator ILRS w { $t }

engine-e-lunar-llr-station-catalogue-has-no-rows = katalog stacji nie ma wierszy

engine-e-lunar-llr-cannot-read-this-scenario-runs = nie można odczytać { $path } ({ $e }). Ten scenariusz działa na zatwierdzonym wycinku danych rzeczywistych w { $DEFAULT_DATA_DIR }, który jest dostarczany z repozytorium, ale nie z opublikowaną paczką (crate); wskaż `data_dir` na jego kopię.

engine-e-lunar-llr-only-usable-normal-points-for = użytecznych punktów normalnych: tylko { $used } dla reflektorów: { $reflectors } — zbyt mało, aby ograniczyć współrzędne: { $v3 }; poszerz wycinek archiwum

engine-e-lunar-llr-the-simulated-campaign-own-report = własny raport symulowanej kampanii nie został sparsowany: { $e }

engine-lunar-llr-datum-accuracy = /datum_accuracy/{ $k }

engine-lunar-llr-lunar-llr-datum-archived-normal = lunar-llr-datum: zarchiwizowane punkty normalne: { $used } (sparsowano { $n_parsed }) ze stacji: { $station_counts } do układów retroreflektorów: { $reflectors } na przestrzeni { $v5 } d; mediana zmierzonej precyzji punktu normalnego { $median } mm w jedną stronę; ranga informacji reflektorów { $rank }/{ $n }; ranga Helmerta { $rank2 }/{ $n_helmert }, uwarunkowanie { $condition }; sigma translacji datum { $v12 } m; RMS reszt jednokierunkowych obserwowane minus obliczone { $rms_m } m ({ $v14 })

engine-e-lunar-llr-extra-earth-elevation-mask-deg = extra_earth_elevation_mask_deg musi być skończone i należeć do [-90, 90), podano { $mask }

engine-e-lunar-llr-has-non-finite-coordinate = { $kind } { $name } ma nieskończoną współrzędną

engine-e-lunar-llr-latitude-deg-is-outside-90 = { $kind } { $name }: szerokość { $lat_deg } deg jest poza przedziałem [-90, 90]

engine-e-lunar-llr-serialising-the-lunar-llr-datum = serializacja raportu lunar-llr-datum nie powiodła się: { $e }

## src/lunar_perturbed.rs

engine-e-lunar-perturbed-the-integration-step-must-divide = krok całkowania musi dzielić krok wyjściowy

## src/lunar_receiver.rs

engine-e-lunar-receiver-receiver = receiver: { $w }

engine-lunar-receiver-must-be-finite-and-not = { $n } musi być skończone i nieujemne

engine-lunar-receiver-must-be-finite-and-positive = { $n } musi być skończone i dodatnie

## src/lunar_service.rs

engine-lunar-service-ephemeris-comparison = ephemeris_comparison.{ $geometry }.{ $field }

engine-e-lunar-service-moonlight-service-volume = moonlight-service-volume: { $e }

engine-e-lunar-service-moonlight-service-volume-export-site = moonlight-service-volume: eksport stanowiska: { $e }

engine-e-lunar-service-lunar-ephemeris-covers-past-its = efemerydy Księżyca { $path } obejmują { $until } s po swojej epoce, ale horyzont scenariusza sięga { $last } s; skróć horizon_hours lub pobierz dłuższy łuk (ekstrapolacja tabelarycznych efemeryd jest odrzucana)

engine-e-lunar-service-planetary-kernel-path-needs-epoch = planetary_kernel_path wymaga epoch_utc (YYYY-MM-DDTHH:MM:SS UTC)

engine-lunar-service-op-frame-at-utc-earth = układ OP w { $epoch } UTC (normalna do widomej orbity Ziemi wokół Księżyca, x wzdłuż jej węzła na równiku księżycowym IAU); GM Księżyca, J2 i C22 w układzie związanym z Księżycem IAU, trzecie ciała Ziemia i Słońce w pozycjach DE440 z { $spk_path }; Runge-Kutta czwartego rzędu, krok 10 s

## src/lunar_solution.rs

engine-e-lunar-solution-solution-height-sigma-must-be = solution: height_sigma_m musi być skończone i dodatnie

engine-e-lunar-solution-solution-range-sigma-must-be = solution: range_sigma_m musi być skończone i dodatnie

engine-e-lunar-solution-solution-min-satellites-needs-height = solution: min_satellites = 3 wymaga height_aided = true

engine-e-lunar-solution-solution-min-satellites-must-be = solution: min_satellites musi wynosić 3 lub 4, podano { $n }

engine-e-lunar-solution-solution-window-epochs-must-be = solution: window_epochs musi mieścić się w zakresie 1 do 144

## src/lunar_station.rs

engine-lunar-station-must-be-finite-and-positive = { $name } musi być skończone i dodatnie

engine-lunar-station-must-be-finite-and-not = { $name } musi być skończone i nieujemne

engine-lunar-station-points-epochs-trials-exceeds-lower = n_points x n_epochs x n_trials = { $work } przekracza { $MAX_WORK }; zmniejsz n_trials, zwiększ grid_lat_step_deg (lub podaj mniej punktów) albo zwiększ t_step_s / skróć t_span_s

engine-e-lunar-station-kind-must-be-got = kind musi mieć wartość { $KIND }; otrzymano { $k }

engine-e-lunar-station-the-ephemeris-covers-but-the = { $KIND }: efemerydy { $path } obejmują { $until } s, ale przebieg sięga { $last } s (ostatnia epoka plus latency_s); skróć t_span_s

engine-e-lunar-station-no-case = { $KIND }: brak przypadku ({ $j }, { $i }, { $k })

engine-lunar-station-stroke-stroke-width = { " " }stroke="{ $INK }" stroke-width="0.8"

engine-lunar-station-points-epochs-trials = punkty: { $n_grid_points } · epoki: { $n_epochs } · próby: { $n_trials }

engine-lunar-station-hpl-max = HPL maks. { $f }

engine-lunar-station-sise-los = SISE (LOS) { $los_sise_sigma_m } m

engine-lunar-station-survey-latency-bits = pomiar { $survey_sigma_m } m · opóźnienie { $latency_s } s · bity: { $quantization_bits }

## src/lunar_terrain.rs

engine-e-lunar-terrain-dem-lines-and-samples-must = dem: lines i samples muszą mieścić się w zakresie 2 do { $MAX_DEM_SIDE }, podano { $lines } x { $samples }

engine-e-lunar-terrain-dem-heights-for-grid = dem: wysokości: { $heights_m } dla siatki { $lines } x { $samples }

engine-e-lunar-terrain-dem-map-scale-must-be = dem: map_scale_m musi być dodatnie, podano { $map_scale_m }

engine-e-lunar-terrain-dem-reference-radius-must-be = dem: reference_radius_m musi być dodatnie, podano { $reference_radius_m }

engine-e-lunar-terrain-dem-cannot-read = dem: nie można odczytać { $descriptor_path }: { $e }

engine-e-lunar-terrain-dem = dem: { $descriptor_path }: { $e }

engine-e-lunar-terrain-dem-projection-must-be-south = dem: projection musi mieć wartość south-polar-stereographic, podano { $projection }

engine-e-lunar-terrain-dem-sample-type-must-be = dem: sample_type musi mieć wartość int16-le, podano { $sample_type }

engine-e-lunar-terrain-dem-cannot-read-2 = dem: nie można odczytać { $img }: { $e }

engine-e-lunar-terrain-dem-grid-over-the-pixel = dem: siatka przekracza limit { $MAX_DEM_SIDE } pikseli

engine-e-lunar-terrain-dem-is-bytes-int16-needs = dem: { $img } ma { $bytes } bajtów; { $lines } x { $samples } int16 wymaga { $d }

engine-e-lunar-terrain-dem-sha-256-does-not = dem: SHA-256 { $digest } pliku { $img } nie zgadza się z wartością z deskryptora { $image_sha256 }

engine-e-lunar-terrain-dem-scaling-factor-must-be = dem: scaling_factor musi być dodatnie

engine-e-lunar-terrain-dem-tile-cannot-read = dem_tile: nie można odczytać { $path }: { $e }

engine-e-lunar-terrain-dem-tile = dem_tile: { $path }: { $e }

engine-e-lunar-terrain-dem-tile-needs-at-least = dem_tile: { $path }: wymaga co najmniej 2 x 2 punktów, rosnącego zakresu w [-90, 90] deg i 360 deg długości geograficznej oraz skończonych wysokości

engine-e-lunar-terrain-terrain-must-be-finite-and = terrain: { $what } musi być skończone i dodatnie, podano { $v }

engine-e-lunar-terrain-terrain-antenna-height-must-be = terrain: antenna_height_m musi być skończone i nieujemne, podano { $antenna_height_m }

engine-e-lunar-terrain-terrain-azimuth-step-deg-must = terrain: azimuth_step_deg musi wynosić najwyżej 90

engine-e-lunar-terrain-terrain-max-range-range-step = terrain: max_range_m / range_step_m musi mieścić się w zakresie 1 do 1e6

engine-e-lunar-terrain-terrain-the-site-is-outside = terrain: stanowisko leży poza polem wysokości

engine-e-lunar-terrain-terrain-stated-horizon-needs-non = terrain: podany horyzont wymaga niepustego źródła

engine-e-lunar-terrain-terrain-stated-horizon = terrain: podany horyzont: { $e }

engine-e-lunar-terrain-terrain-give-dem-path-or = terrain: podaj dem_path lub dem_tile_path, nie oba

engine-e-lunar-terrain-terrain-max-range-km-must = terrain: max_range_km musi być skończone i dodatnie

engine-e-lunar-terrain-terrain-range-step-must-be = terrain: range_step_m musi być skończone i dodatnie

engine-e-lunar-terrain-site-deg-deg = { $e } (stanowisko { $lat_deg } deg, { $lon_deg } deg)

## src/lunar_time_budget_scenario.rs

engine-e-lunar-time-budget-scenario-unknown-clock-expected-one-of = nieznany zegar { $other }; oczekiwano jednego z: optical-master, passive-h-maser, rafs, mini-rafs

engine-e-lunar-time-budget-scenario-clocks-must-name-at-least = clocks musi wskazywać co najmniej jedną klasę zegara

engine-e-lunar-time-budget-scenario-tau-min-must-be-finite = tau_min_s musi być skończone i dodatnie, podano { $lo }

engine-e-lunar-time-budget-scenario-tau-max-must-be-finite = tau_max_s musi być skończone i większe niż tau_min_s ({ $lo }), podano { $hi }

engine-e-lunar-time-budget-scenario-points-per-decade-must-be = points_per_decade musi być ≥ 1

engine-e-lunar-time-budget-scenario-term-is-shorter-than-the = człon { $name } jest krótszy niż siatka tau

engine-lunar-time-budget-scenario-total-false = { $i },{ $tau },total,{ $total },false{ "\u000A" }

engine-lunar-time-budget-scenario-lunar-time-budget-clock-term = lunar-time-budget | zegar { $clock } | 7 członów x_Σ(τ) w punktach τ: { $taus } ({ $taus2 }–{ $taus3 } s) | przecięcie τ { $crossover_tau_s } s (x { $crossover_x_s } s) | dno układu odniesienia { $frame_term_s } s | zegar x(1 d) { $x_1day_ns } ns (MODELLED)

## src/lunar_time_lab.rs

engine-e-lunar-time-lab-time-lab-unknown-clock-expected = time_lab: nieznany zegar { $other }; oczekiwano jednego z: optical-master, passive-h-maser, rafs, mini-rafs, lub podaj device_card

engine-e-lunar-time-lab-time-lab-give-either-clock = time_lab: podaj clock albo device_card, nie oba

engine-e-lunar-time-lab-time-lab-device-card = time_lab: device_card: { $e }

engine-e-lunar-time-lab-time-lab-steer-interval-must = time_lab: steer_interval_s musi być skończone i dodatnie, podano { $n }

engine-e-lunar-time-lab-time-lab-must-be-finite = time_lab: { $name } musi być skończone i nieujemne, podano { $v }

engine-e-lunar-time-lab-time-lab-horizons-must-be = time_lab: horizons_s musi zawierać liczby dodatnie

engine-lunar-time-lab-station-height-not-modelled-exactly = wysokość stacji nie jest modelowana dokładnie: błąd wysokości o jednej sigma { $height_sigma_m } m obciąża tempo o { $value } ns/dobę, zastosowany jako człon liniowy od ostatniego sterowania

## src/lunar_vlbi.rs

engine-e-lunar-vlbi-light-time-did-not-converge = czas światła nie zbiegł do 1e-15 s w 30 iteracjach

engine-e-lunar-vlbi-the-kernel-path-needs-planetary = ścieżka jądra wymaga łącznie planetary_kernel_path, earth_orientation_kernel_path i moon_orientation_kernel_path

## src/lunar_vlbi_fim.rs

engine-e-lunar-vlbi-fim-unknown-datum-expected-anchor-first = nieznany datum { $other }: oczekiwano "anchor-first-station", "free-network" lub "all-stations-fixed"

engine-e-lunar-vlbi-fim-vlbi-schedule-needs-at-least = harmonogram VLBI wymaga co najmniej 2 stacji, aby utworzyć bazę, podano { $raw }

engine-e-lunar-vlbi-fim-beacon-coordinates-must-be-finite = współrzędne radiolatarni muszą być skończone

engine-e-lunar-vlbi-fim-beacon-latitude-deg-is-outside = szerokość radiolatarni { $lat } deg jest poza przedziałem [-90, 90]

engine-e-lunar-vlbi-fim-schedule-of-epochs-is-beyond = harmonogram epok: { $v1 } przekracza limit 20000 epok tego scenariusza; zwiększ step_min lub skróć arc_hours

engine-e-lunar-vlbi-fim-equipartition-must-be-positive-and = equipartition_g musi być dodatnie i skończone, podano { $g }

engine-e-lunar-vlbi-fim-serializing-lunar-vlbi-fim-result = serializacja wyniku lunar-vlbi-fim: { $e }

engine-e-lunar-vlbi-fim-no-observation-in-the-schedule = żadna obserwacja w harmonogramie nie przekracza maski elewacji { $mask } deg na obu końcach bazy: epoki: { $n_epochs } x bazy: { $v1 }, wszystkie odrzucone. Wydłuż arc_hours, obniż elevation_mask_deg lub przesuń stacje.

engine-e-lunar-vlbi-fim-the-datum-leaves-no-parameter = datum nie pozostawia żadnego parametru do estymacji

engine-lunar-vlbi-fim-beacon-mcmf = beacon_mcmf.{ $ax }

engine-lunar-vlbi-fim-rank-deficient-of-directions-are = RANK-DEFICIENT: kierunków nieobserwowalnych: { $defect } z { $dim }, więc nie podaje się sigma dla poszczególnych współrzędnych; poniższa wartość podprzestrzeni obserwowalnej jest pseudoodwrotnością ograniczoną do obserwowalnych kierunków: { $rank } i NIE jest sigma stacji

engine-lunar-vlbi-fim-lunar-vlbi-fim-stations-baselines = lunar-vlbi-fim | stacje: { $n_stations } / bazy: { $v2 } x epoki: { $n_epochs } = obserwacje: { $n_obs } (maska { $mask } deg) | datum { $datum } | ranga { $rank }/{ $dim }, uwarunkowanie { $condition } | sigma stacji { $v10 } wobec equipartition g={ $g } { $eq_g } m (stosunek { $v13 })

## src/main.rs

engine-main-error-validate-needs-scenario-path = błąd: --validate wymaga ścieżki scenariusza

engine-main-error-study-needs-suite-manifest = błąd: --study wymaga ścieżki manifestu zestawu

engine-main-error-study-name-needs-value = błąd: --study-name wymaga wartości

engine-main-error-export-sp3-needs-path = błąd: --export-sp3 wymaga ścieżki

engine-main-error-export-omm-needs-path = błąd: --export-omm wymaga ścieżki

engine-main-error-export-oem-needs-path = błąd: --export-oem wymaga ścieżki

engine-main-error-animate-needs-format-svg = błąd: --animate wymaga formatu: svg, html, frames lub all

engine-main-error-animate = błąd: --animate: { $e }

engine-main-error-animate-fps-needs-whole = błąd: --animate-fps wymaga liczby całkowitej klatek na sekundę

engine-main-error-export-needs-format-czml = błąd: --export wymaga formatu: czml, kml, geojson, stk, sigmf, all lub list

engine-main-error-animate-duration-needs-length = błąd: --animate-duration wymaga czasu trwania w sekundach

engine-main-error-import-route-needs-geojson = błąd: --import-route wymaga ścieżki pliku GeoJSON

engine-main-error-eop-needs-finals2000a-file = błąd: --eop wymaga ścieżki pliku finals2000A

engine-main-error-unknown-option = błąd: nieznana opcja '{ $other }'

engine-main-error-unexpected-argument-one-scenario = błąd: nieoczekiwany argument '{ $other }'; jeden plik scenariusza na przebieg

engine-main-warning-animate-fps-and-animate = ostrzeżenie: --animate-fps i --animate-duration nic nie robią bez --animate

engine-main-error-animate-exports-one-scenario = błąd: --animate eksportuje jeden przebieg scenariusza; nie łączy się z --validate ani --study

engine-main-error-validate-lints-one-scenario = błąd: --validate sprawdza jeden scenariusz; nie podawaj dodatkowo pliku scenariusza

engine-main-error-cannot-read = błąd: nie można odczytać { $validate_file }: { $e }

engine-main-ok-kind-resolves-this-kind = ok: { $kind } — kind jest rozpoznany; ten rodzaj nie wymaga żadnego pola (pusta treść uruchamia jego konfigurację referencyjną), więc nie było nic więcej do sprawdzenia

engine-main-error-study-runs-suite-do = błąd: --study uruchamia zestaw; nie podawaj dodatkowo pojedynczego pliku scenariusza

engine-main-warning-study-name-is-ignored = ostrzeżenie: --study-name jest ignorowane z --study; badanie otrzymuje tytuł z `title =` w manifeście zestawu

engine-main-error-cannot-read-2 = błąd: nie można odczytać { $path }: { $e }

engine-main-hint-kshana-example-lists-the = wskazówka: `kshana example` wypisuje dołączone scenariusze referencyjne; `kshana example clock-holdover > clock-holdover.toml` zapisuje jeden z nich

engine-main-error-cannot-read-3 = błąd: nie można odczytać { $eop_file }: { $e }

engine-main-error-eop = błąd: --eop: { $e }

engine-main-error-cannot-read-4 = błąd: nie można odczytać { $route_file }: { $e }

engine-main-error-import-route = błąd: --import-route: { $e }

engine-main-does-not-apply = { $fmt }: nie ma zastosowania: { $why }

engine-main-error-export = błąd: --export: { $e }

engine-main-error-animate-2 = błąd: --animate { $f }: { $e }

engine-main-error-export-2 = błąd: eksport { $fmt }: { $e }

engine-main-error-cannot-write = błąd: nie można zapisać { $json_path }: { $e }

engine-main-error-cannot-write-2 = błąd: nie można zapisać { $svg_path }: { $e }

engine-main-error-cannot-build-the-report = błąd: nie można zbudować raportu: { $e }

engine-main-error-cannot-write-3 = błąd: nie można zapisać { $html_path }: { $e }

engine-main-error-cannot-write-4 = błąd: nie można zapisać { $report_json_path }: { $e }

engine-main-error-cannot-write-5 = błąd: nie można zapisać { $csv_path }: { $e }

engine-main-wrote-and = zapisano { $json_path }, { $svg_path }, { $html_path }, { $report_json_path } oraz { $csv_path }

engine-main-wrote-and-2 = zapisano { $json_path }, { $svg_path }, { $html_path } oraz { $report_json_path }

engine-main-error-cannot-write-6 = błąd: nie można zapisać { $target }: { $e }

engine-main-error-cannot-write-7 = błąd: nie można zapisać { $sp3_path }: { $e }

engine-main-error-sp3-export-failed = błąd: eksport SP3 nie powiódł się: { $e }

engine-main-error-cannot-write-8 = błąd: nie można zapisać { $omm_path }: { $e }

engine-main-error-omm-export-failed = błąd: eksport OMM nie powiódł się: { $e }

engine-main-error-cannot-write-9 = błąd: nie można zapisać { $oem_path }: { $e }

engine-main-error-oem-export-failed = błąd: eksport OEM nie powiódł się: { $e }

engine-main-error-unexpected-argument-after-kinds = błąd: nieoczekiwany argument '{ $other }' po `kinds`; akceptowane jest tylko --json

engine-main-bundled-reference-scenarios-write-one =
    Dołączone scenariusze referencyjne ({ $v1 }). Zapisz jeden do pliku i uruchom go:
    { "  " }kshana example clock-holdover > clock-holdover.toml
    { "  " }kshana clock-holdover.toml

engine-main-not-bundled-run-kshana-example = (niedołączony: { $name } — uruchom `kshana example { $name }`, aby poznać powód)

engine-main-error-is-not-bundled-it = błąd: '{ $name }' nie jest dołączony: { $why }

engine-main-error-no-bundled-scenario-named = błąd: brak dołączonego scenariusza o nazwie '{ $name }'; `kshana example` wypisuje dołączone: { $v1 }

engine-main-error-cannot-read-5 = błąd: nie można odczytać { $suite_path }: { $e }

engine-main-wrote-and-3 = zapisano { $json_path } oraz { $html_path }

engine-main-error-needs-value = błąd: { $a } wymaga wartości

engine-main-error-expected-mean-needs-number = błąd: --expected-mean wymaga liczby

engine-main-error-unknown-imu-fit-option = błąd: nieznana opcja imu-fit { $x }

engine-main-error-imu-fit-needs-an = błąd: imu-fit wymaga ścieżki dziennika IMU

engine-main-error-needs-value-2 = błąd: { $args } wymaga wartości

engine-main-error-epoch = błąd: --epoch: { $e }

engine-main-error-unknown-bench-export-option = błąd: nieznana opcja bench-export { $a }

engine-main-error-bench-export-needs-scenario = błąd: bench-export wymaga ścieżki scenariusza

engine-main-needs-value = { $a } wymaga wartości

engine-main-site-takes-lat-lon-height = --site przyjmuje lat,lon[,height_m], podano { $v }

engine-main-error-is-bytes-the-tle = błąd: { $p } ma { $m } bajtów; limit TLE wynosi { $cap } (4 MiB)

engine-main-error-cannot-read-6 = błąd: nie można odczytać { $p }: { $e }

engine-e-main-monte-carlo = --monte-carlo: { $e }

engine-e-main-seed = --seed: { $e }

engine-main-unknown-sky-option = nieznana opcja sky { $a }

engine-e-main-svg-and-monte-carlo-are = --svg i --monte-carlo to osobne wyjścia; podaj jedno

engine-main-error-preset-needs-name =
    błąd: --preset wymaga nazwy
    { $SKYLINE_USAGE }

engine-main-error-profile-needs-file =
    błąd: --profile wymaga pliku
    { $SKYLINE_USAGE }

engine-main-symbols-frame-found = symbole: { $r }, znalezione ramki: { $r2 }; { $v3 }

engine-main-frame-at-fid-toi-sb1 = { "  " }ramka przy { $f }: FID { $f2 } TOI { $f3 } (metryka SB1 { $f4 }, błędy SP: { $f5 }, błędy SB1: { $f6 })

engine-main-not-checked = niesprawdzone: { $r }

engine-main-wrote-frame-of-6000-symbols = zapisano { $out }: ramki: { $frames }, po 6000 symboli; podramki 2 do 4 są zastępcze (bez kodowania LDPC, bez komunikatu)

engine-main-error-cannot-write-10 = błąd: nie można zapisać { $out }: { $e }

engine-main-unknown-lunanet-afs-check-subcommand = nieznane podpolecenie lunanet-afs-check { $other }

engine-main-needs-pack-id = { $cmd } wymaga identyfikatora pakietu

engine-main-unknown-standards-pack-run-option = nieznana opcja standards-pack run { $a }

engine-main-unknown-standards-pack-subcommand = nieznane podpolecenie standards-pack { $other }

engine-main-error-out-needs-value = błąd: --out wymaga wartości

engine-main-error-unknown-compliance-report-option = błąd: nieznana opcja compliance-report { $a }

engine-main-error-compliance-report-needs-at = błąd: compliance-report wymaga co najmniej jednego pliku wyników .json

engine-main-runs-read-not-used-rows = przebiegi odczytane: { $runs }, nieużyte: { $unrecognised }; wiersze: udokumentowane dowodami { $n }, częściowo { $n2 }, bez dowodów { $n3 }, poza zakresem { $n4 }

engine-main-error-receiver-trust-needs-scenario = błąd: receiver-trust wymaga ścieżki scenariusza

engine-main-error-invalid-receiver-trust-scenario = błąd: nieprawidłowy scenariusz receiver-trust: { $e }

## src/maneuver.rs

engine-e-maneuver-burn-exhausts-mass-m0-kg = praca silnika wyczerpuje masę: m0={ $m0_kg } kg, ṁ={ $mdot } kg/s, praca={ $burn_s } s ⇒ mf={ $mf } kg

engine-e-maneuver-time-of-flight-must-be = czas lotu musi być dodatni

engine-e-maneuver-collinear-endpoints-transfer-plane-is = punkty końcowe współliniowe: płaszczyzna transferu jest nieokreślona (≈0°/180°)

engine-e-maneuver-lambert-revs-is-for-use = lambert_revs dotyczy M >= 1; dla M = 0 użyj lambert

engine-e-maneuver-no-revolution-transfer-the-time = brak transferu z liczbą obiegów { $revs }: czas lotu jest poniżej minimum

engine-e-maneuver-grid-step-days-must-be = grid_step_days musi być dodatnie, podano { $grid_step_days }

engine-e-maneuver-each-window-must-run-forward = każde okno musi biec do przodu (start <= koniec)

engine-e-maneuver-no-transfer-of-the-requested = brak transferu żądanego typu w oknach

engine-e-maneuver-the-optimum-left-the-feasible = optimum opuściło obszar dopuszczalny

## src/mars_od.rs

engine-e-mars-od-dss = DSS-{ $id } { $field }: { $e }

engine-e-mars-od-dss-expected-values = DSS-{ $id } { $field }: oczekiwano 3 wartości

engine-e-mars-od-dss-epoch-is-not-2003 = epoka DSS-{ $id } nie jest 2003-JAN-01: { $val }

engine-e-mars-od-dss-has-no-dxyz = DSS-{ $id } nie ma DXYZ

engine-e-mars-od-no-coordinates-for-dss = brak współrzędnych dla DSS { $station }

engine-e-mars-od-no-ramps-for-dss = brak ramp dla DSS { $station }

engine-e-mars-od-ramp-table-does-not-cover = tabela ramp nie obejmuje przedziału

engine-e-mars-od-epoch-outside-the-integrated-span = epoka { $et } poza całkowanym zakresem

## src/mars_od.rs

engine-e-mars-od-normal-matrix-is-not-positive = macierz normalna nie jest dodatnio określona

engine-e-mars-od-no-points = brak punktów

engine-e-mars-od-parameter-has-no-partial-on = parametr nie ma pochodnej cząstkowej na zachowanych punktach

## src/mars_pnt.rs

engine-mars-pnt-mars-pnt-user-clock-position = Mars-PNT — użytkownik { $user }, zegar { $clock_class }: błąd położenia 3-D względem wzorca (zbieżny RMS { $converged_pos_rms_m } m)

## src/mcda/ahp.rs

engine-e-mcda-ahp-pairwise-matrix-is-empty = macierz porównań parami jest pusta

engine-e-mcda-ahp-pairwise-matrix-is-not-square = macierz porównań parami nie jest kwadratowa (wiersz { $i } ma { $row } z { $n })

engine-e-mcda-ahp-entry-must-be-finite-and = element a[{ $i }][{ $j }] = { $v } musi być skończony i dodatni

engine-e-mcda-ahp-diagonal-must-be = przekątna a[{ $i }][{ $i }] = { $row } musi wynosić 1

engine-e-mcda-ahp-entries-must-be-reciprocal = elementy a[{ $i }][{ $j }]·a[{ $j }][{ $i }] = { $prod } muszą być wzajemnie odwrotne (≈ 1)

engine-e-mcda-ahp-upper-row-has-entries-expected = górny wiersz { $i } ma elementów: { $row }, oczekiwano { $v2 }

engine-e-mcda-ahp-upper-entry-must-be-finite = górny element ({ $i },{ $j }) = { $v } musi być skończony i dodatni

## src/mcda/copras.rs

engine-e-mcda-copras-copras-empty-decision-matrix = COPRAS: pusta macierz decyzyjna

engine-e-mcda-copras-copras-no-criteria = COPRAS: brak kryteriów

engine-e-mcda-copras-copras-requires-at-least-one = COPRAS: wymaga co najmniej jednego kryterium kosztowego (Min)

engine-e-mcda-copras-copras-alternative-criterion-value-must = COPRAS: alternatywa { $i }, kryterium { $j }: wartość { $x } musi być skończona i > 0

## src/mcda/electre.rs

engine-e-mcda-electre-electre-empty-dataset = ELECTRE I: pusty zbiór danych

engine-e-mcda-electre-electre-no-criteria = ELECTRE I: brak kryteriów

engine-e-mcda-electre-electre-alternative-has-non-finite = ELECTRE I: alternatywa { $i } ma wartość nieskończoną

## src/mcda/moora.rs

engine-e-mcda-moora-moora-empty-decision-matrix = MOORA: pusta macierz decyzyjna

engine-e-mcda-moora-moora-no-criteria = MOORA: brak kryteriów

engine-e-mcda-moora-moora-alternative-has-non-finite = MOORA: alternatywa { $i } ma wartość nieskończoną

engine-e-mcda-moora-moora-criterion-has-zero-l2 = MOORA: kryterium { $j } ma zerową normę L2

## src/mcda/promethee.rs

engine-e-mcda-promethee-promethee-ii-empty-decision-matrix = PROMETHEE II: pusta macierz decyzyjna

engine-e-mcda-promethee-promethee-ii-no-criteria = PROMETHEE II: brak kryteriów

engine-e-mcda-promethee-promethee-ii-alternative-has-non = PROMETHEE II: alternatywa { $i } ma wartość nieskończoną

## src/mcda/topsis.rs

engine-e-mcda-topsis-topsis-empty-decision-matrix = TOPSIS: pusta macierz decyzyjna

engine-e-mcda-topsis-topsis-no-criteria = TOPSIS: brak kryteriów

engine-e-mcda-topsis-topsis-alternative-has-non-finite = TOPSIS: alternatywa { $i } ma wartość nieskończoną

## src/mcda/utility.rs

engine-e-mcda-utility-additive-utility-has-no-attributes = użyteczność addytywna nie ma atrybutów

engine-e-mcda-utility-attributes-but-weights = atrybuty: { $attributes }, ale wagi: { $weights }

engine-e-mcda-utility-invalid-scaling-constant = nieprawidłowa stała skalowania { $w }

engine-e-mcda-utility-scaling-constants-sum-to-zero = stałe skalowania sumują się do zera

engine-e-mcda-utility-attribute-values-expected-got = oczekiwano wartości atrybutów: { $attributes }, otrzymano { $x }

## src/mcda/vikor.rs

engine-e-mcda-vikor-vikor-empty-decision-matrix = VIKOR: pusta macierz decyzyjna

engine-e-mcda-vikor-vikor-no-criteria = VIKOR: brak kryteriów

engine-e-mcda-vikor-vikor-alternative-has-non-finite = VIKOR: alternatywa { $i } ma wartość nieskończoną

## src/mcda/waspas.rs

engine-e-mcda-waspas-waspas-empty-decision-matrix = WASPAS: pusta macierz decyzyjna

engine-e-mcda-waspas-waspas-no-criteria = WASPAS: brak kryteriów

engine-e-mcda-waspas-waspas-lambda-must-lie-in = WASPAS: lambda { $lambda } musi należeć do [0, 1]

engine-e-mcda-waspas-waspas-alternative-criterion-value-must = WASPAS: alternatywa { $i }, kryterium { $j }: wartość { $x } musi być skończona i > 0

## src/mcda/wpm.rs

engine-e-mcda-wpm-wpm-empty-decision-matrix = WPM: pusta macierz decyzyjna

engine-e-mcda-wpm-wpm-no-criteria = WPM: brak kryteriów

engine-e-mcda-wpm-wpm-alternative-criterion-value-must = WPM: alternatywa { $i }, kryterium { $j }: wartość { $x } musi być skończona i > 0

## src/mcda/wsm.rs

engine-e-mcda-wsm-decision-matrix-has-no-criteria = macierz decyzyjna nie ma kryteriów

engine-e-mcda-wsm-decision-matrix-has-no-alternatives = macierz decyzyjna nie ma alternatyw

engine-e-mcda-wsm-criterion-has-an-invalid-weight = kryterium '{ $name }' ma nieprawidłową wagę { $weight }

engine-e-mcda-wsm-criterion-weights-sum-to-zero = wagi kryteriów sumują się do zera

engine-e-mcda-wsm-alternative-has-non-finite-value = alternatywa '{ $name }' ma wartość nieskończoną dla kryterium '{ $value }'

## src/naif_kernel.rs

engine-e-naif-kernel-not-daf-shorter-than-one = to nie jest DAF: krótszy niż jeden rekord

engine-e-naif-kernel-not-daf-identification-word = to nie jest DAF: słowo identyfikacyjne { $id_word }

engine-e-naif-kernel-unsupported-daf-binary-format = nieobsługiwany format binarny DAF { $other }

engine-e-naif-kernel-implausible-daf-header-nd-ni = nieprawdopodobny nagłówek DAF: ND { $nd }, NI { $ni }, FWARD { $fward }

engine-e-naif-kernel-daf-address-beyond-the-end = adres DAF { $addr } poza końcem pliku

engine-e-naif-kernel-bad-daf-address-range = nieprawidłowy zakres adresów DAF { $first }..={ $last }

engine-e-naif-kernel-daf-summary-list-does-not = lista podsumowań DAF nie kończy się

engine-e-naif-kernel-malformed-type-segment-rsize-intlen = nieprawidłowy segment typu 2: RSIZE { $rsize }, INTLEN { $intlen }, N { $n }

engine-e-naif-kernel-type-segment-size-does-not = rozmiar segmentu typu 2 nie zgadza się z jego katalogiem

engine-e-naif-kernel-epoch-outside-the-record = epoka { $et } poza rekordem [{ $v1 }, { $v2 }]

engine-e-naif-kernel-type-segment-size-does-not-2 = rozmiar segmentu typu 1 nie zgadza się z jego N = { $n }

engine-e-naif-kernel-malformed-type-record-kqmax1-kq = nieprawidłowy rekord typu 1: KQMAX1 { $kqmax1 }, KQ { $kq }

engine-e-naif-kernel-not-an-spk = to nie jest SPK: { $id_word }

engine-e-naif-kernel-spk-summary-is-not-nd = podsumowanie SPK nie ma ND=2, NI=6

engine-e-naif-kernel-no-spk-type-data-for = brak danych SPK typu 1/2 dla ciała { $target } w ET { $et }

engine-e-naif-kernel-spk-segment-for-is-in = segment SPK dla { $target } jest w układzie { $frame }, a nie J2000

engine-e-naif-kernel-spk-centre-chain-does-not = łańcuch środków SPK nie dochodzi do barycentrum

engine-e-naif-kernel-not-binary-pck = to nie jest binarny PCK: { $id_word }

engine-e-naif-kernel-pck-summary-is-not-nd = podsumowanie PCK nie ma ND=2, NI=5

engine-e-naif-kernel-no-pck-type-data-for = brak danych PCK typu 2 dla układu { $body_frame } w ET { $et }

engine-e-naif-kernel-pck-frame-is-given-against = układ PCK { $body_frame } jest podany względem układu { $other }, który nie jest J2000 ani ECLIPJ2000

## src/navsignal.rs

engine-e-navsignal-bad-number = nieprawidłowa liczba { $s }

engine-e-navsignal-must-be-positive-number = { $s } musi być liczbą dodatnią

engine-e-navsignal-modulation-expected-name-args-bpsk = modulacja { $label }: oczekiwano NAME(args), np. BPSK(10)

engine-e-navsignal-modulation-missing-closing-parenthesis = modulacja { $label }: brak nawiasu zamykającego

engine-e-navsignal-modulation-is-not-one-of = modulacja { $label } nie jest żadną z: BPSK(n), BOC(m,n) lub MBOC(6,1,p)

## src/ndm_xml.rs

engine-e-ndm-xml-unterminated-entity-in = niezakończona encja w { $s }

engine-e-ndm-xml-bad-character-reference = nieprawidłowe odwołanie do znaku &{ $ent };

engine-e-ndm-xml-unknown-entity = nieznana encja &{ $ent };

engine-e-ndm-xml-unterminated-processing-instruction = niezakończona instrukcja przetwarzania

engine-e-ndm-xml-unterminated-comment = niezakończony komentarz

engine-e-ndm-xml-unterminated-declaration = niezakończona deklaracja

engine-e-ndm-xml-expected-an-element-at-byte = oczekiwano elementu na bajcie { $pos }

engine-e-ndm-xml-unterminated-start-tag = niezakończony znacznik początkowy

engine-e-ndm-xml-attribute-without-value = atrybut bez wartości

engine-e-ndm-xml-unterminated-attribute-value = niezakończona wartość atrybutu

engine-e-ndm-xml-unterminated-end-tag = niezakończony znacznik końcowy

engine-e-ndm-xml-unterminated-cdata = niezakończona sekcja CDATA

engine-e-ndm-xml-content-after-the-root-element = treść po elemencie głównym

## src/nma_budget.rs

engine-e-nma-budget-must-be-finite-and-non = { $name } musi być skończone i nieujemne

engine-e-nma-budget-subframe-must-be-positive = subframe_s musi być dodatnie

engine-e-nma-budget-nav-data-rate-bps-must = nav_data_rate_bps musi być dodatnie

## src/nmea_synth/cli.rs

engine-e-nmea-synth-cli-speed-must-be-or-positive = --speed musi wynosić 0 lub być dodatnie

engine-e-nmea-synth-cli-unexpected-argument = nieoczekiwany argument { $s }

engine-nmea-synth-cli-instructor-log = dziennik instruktora: { $e }

engine-nmea-synth-cli-instructor-log-and = dziennik instruktora: { $jp } oraz { $tp }

engine-nmea-synth-cli-tcp-server-listening-on-waiting = serwer TCP nasłuchuje na { $s }; oczekiwanie na klientów: { $wait_clients }

## src/nmea_synth/clock.rs

engine-e-nmea-synth-clock-expected-yyyy-mm-ddthh-mm = oczekiwano YYYY-MM-DDTHH:MM:SSZ

engine-e-nmea-synth-clock-date-or-time-out-of = data lub czas poza zakresem (lata 1980 do 2099)

engine-e-nmea-synth-clock-no-such-calendar-date = nie ma takiej daty kalendarzowej

## src/nmea_synth/config.rs

engine-e-nmea-synth-config-must-be-finite-number = { $name } musi być liczbą skończoną

engine-e-nmea-synth-config-scenario-start-utc = scenario.start_utc { $start_utc }: { $e }

engine-e-nmea-synth-config-scenario-duration-must-lie-in = scenario.duration_s musi mieścić się w zakresie 1 do 86400 s

engine-e-nmea-synth-config-scenario-rate-hz-must-be = scenario.rate_hz musi wynosić 1, 2, 5 lub 10

engine-e-nmea-synth-config-vessel-position-must-lie-within = położenie statku musi leżeć w granicach 89 stopni od równika

engine-e-nmea-synth-config-vessel-speed-kn-must-lie = vessel.speed_kn musi mieścić się w zakresie 0 do 60

engine-e-nmea-synth-config-vessel-rate-of-turn-and = granice prędkości zwrotu i przyspieszenia statku muszą być dodatnie

engine-e-nmea-synth-config-give-at-least-one-waypoint = podaj co najmniej jeden [[waypoint]] lub vessel.heading_deg

engine-e-nmea-synth-config-waypoint-is-out-of-range = waypoint { $v1 } jest poza zakresem

engine-e-nmea-synth-config-waypoint-speed-kn-must-lie = waypoint { $v1 }: speed_kn musi mieścić się w zakresie 0 do 60

engine-e-nmea-synth-config-receiver-systems-must-name-at = receiver.systems musi wskazywać co najmniej jedną konstelację

engine-e-nmea-synth-config-output-sentences-is-not-one = output.sentences: { $s } nie jest żadnym z { $all_sentences }

engine-e-nmea-synth-config-output-log-interval-must-be = output.log_interval_s musi wynosić co najmniej 1

engine-e-nmea-synth-config-event = zdarzenie { $v1 } ({ $kind }): { $why }

engine-e-nmea-synth-config-start-must-lie-inside-the = start_s musi leżeć wewnątrz przebiegu

engine-e-nmea-synth-config-duration-must-be-positive-ramp = duration_s musi być dodatnie; ramp_s i recovery_s nieujemne

engine-e-nmea-synth-config-ramp-must-not-exceed-duration = ramp_s nie może przekraczać duration_s

engine-e-nmea-synth-config-does-not-apply-to-this = { $n } nie ma zastosowania do tego rodzaju

engine-e-nmea-synth-config-counterfeit-cn0-dbhz-must-lie = counterfeit_cn0_dbhz musi mieścić się w zakresie 20 do 60

engine-e-nmea-synth-config-cn0-drop-db-is-required = cn0_drop_db jest wymagane

engine-e-nmea-synth-config-cn0-drop-db-must-lie = cn0_drop_db musi mieścić się w zakresie 0 do 80

engine-e-nmea-synth-config-spread-db-must-lie-in = spread_db musi mieścić się w zakresie 0 do 30

engine-e-nmea-synth-config-final-offset-is-required = final_offset_m jest wymagane

engine-e-nmea-synth-config-final-offset-must-lie-in = final_offset_m musi mieścić się w zakresie 0 do 500000

engine-e-nmea-synth-config-the-drag-would-accelerate-the = odciąganie przyspieszyłoby fałszywy tor do { $need } m/s^2, powyżej max_accel_mps2 = { $a }; wydłuż ramp_s/recovery_s

engine-e-nmea-synth-config-give-exactly-one-of-bearing = podaj dokładnie jedno z: bearing_deg, relative_bearing_deg

engine-e-nmea-synth-config-offset-is-required = offset_s jest wymagane

engine-e-nmea-synth-config-offset-must-be-non-zero = offset_s musi być niezerowe i mieścić się w obrębie doby

engine-e-nmea-synth-config-delay-is-required = delay_s jest wymagane

engine-e-nmea-synth-config-delay-must-lie-in-to = delay_s musi mieścić się w zakresie 0 do 3600

engine-e-nmea-synth-config-the-skyline-describes-no-obstruction = linia horyzontu nie opisuje żadnej przeszkody

## src/nmea_synth/gen.rs

engine-nmea-synth-gen-has-ended = { $kind }: zakończono

## src/nmea_synth/log.rs

engine-nmea-synth-log-from-for-onset-ramp-recovery = od T+{ $start_s } s przez { $duration_s } s (narastanie na początku { $ramp_s } s, narastanie przy powrocie { $recovery_s } s)

engine-nmea-synth-log-jamming-received-n0-falls-by = zagłuszanie (jamming): odbierane C/N0 spada nawet o { $cn0_drop_db } dB (rozrzut między satelitami { $spread_db } dB); satelity wypadają, a rozwiązanie jest tracone, gdy użytecznych pozostaje mniej niż cztery

engine-nmea-synth-log-towards-deg-true = w kierunku { $b } deg (rzeczywisty)

engine-nmea-synth-log-towards-deg-true-deg-relative = w kierunku { $t } deg (rzeczywisty) ({ $r } deg względem kursu w chwili początku, następnie utrzymywany)

engine-nmea-synth-log-natural-degradation-the-sky-closes = degradacja naturalna: niebo zamyka się za podaną linią horyzontu ({ $e }); satelity za nią pozostają na liście bez SNR i nie są używane, C/N0 pozostałych nie zmienia się i nic nie jest fałszowane

engine-nmea-synth-log-instructor-log = DZIENNIK INSTRUKTORA: { $scenario }{ "\u000A" }

engine-nmea-synth-log-trainer-note = Uwaga trenera: { $trainer_note }{ "\u000A\u000A" }

engine-nmea-synth-log-start-duration-seed = Start { $start_utc }   czas trwania { $duration_s } s   ziarno (seed) { $seed }{ "\u000A\u000A" }

engine-nmea-synth-log-peaks-true-kn-reported-kn = { "\u000A" }SZCZYTY  rzeczywiste: { $true_peak_sog_kn } kn, { $true_peak_accel_mps2 } m/s^2   raportowane: { $reported_peak_sog_kn } kn, { $reported_peak_accel_mps2 } m/s^2{ "\u000A" }

## src/nmea_synth/sky.rs

engine-e-nmea-synth-sky-receiver-systems-unknown-constellation-gps = receiver.systems: nieznana konstelacja { $other } (gps, glonass, galileo, beidou)

## src/observability_gramian.rs

engine-observability-gramian-the-tolerance-is-below-the = { " " }Tolerancja jest poniżej progu szumu odczytu rangi f64 { $RANK_TOLERANCE_NOISE_FLOOR } (= sqrt(f64::EPSILON)): jej równoważny próg wartości własnej rel_tol^2 = { $v1 } leży poniżej szumu zaokrągleń macierzy Grama, więc dodatkowe kierunki są pozostałością arytmetyczną, a nie obserwowalnością.

engine-observability-gramian-rank-clamped-from-the-singular = ranga ograniczona z liczby wartości osobliwych { $counted } do min(rows, cols) = min({ $n_rows }, { $n_cols }) = { $shape_bound } przy rel_tol { $rel_tol }: macierz { $n_rows }x{ $n_cols } nie może mieć rangi { $counted }.{ $floor_note }

## src/odf.rs

engine-e-odf-bytes-is-not-whole-number = { $bytes } bajtów nie jest całkowitą liczbą 36-bajtowych rekordów

engine-e-odf-record-precedes-any-group-header = rekord { $v1 } poprzedza jakikolwiek nagłówek grupy

engine-e-odf-no-orbit-data-group = brak grupy danych orbity

## src/odm.rs

engine-e-odm-is-not-keyword-of = { $k } nie jest słowem kluczowym { $name }

engine-e-odm-without = { $name } bez { $k }

engine-e-odm-needs-exactly-one-of = { $name } wymaga dokładnie jednego z { $group }

engine-e-odm-classification-and-message-id-are = CLASSIFICATION i MESSAGE_ID są słowami kluczowymi nagłówka wersji 3.0 (wersja { $version })

engine-e-odm-unexpected-line = nieoczekiwany wiersz { $b }

engine-e-odm-unknown-keyword = nieznane słowo kluczowe { $k }

engine-e-odm-block-repeated-or-out-of = blok { $block } powtórzony lub poza kolejnością przy { $key }

engine-e-odm-repeated = { $key } powtórzone

engine-e-odm-comments-after-the-last-keyword = komentarze po ostatnim słowie kluczowym

engine-e-odm-given-twice = { $b } podano dwukrotnie

engine-e-odm-opm-without-metadata = OPM bez metadanych

engine-e-odm-opm-without-state-vector = OPM bez wektora stanu

engine-e-odm-omm-without-metadata = OMM bez metadanych

engine-e-odm-omm-without-mean-elements = OMM bez elementów średnich

engine-e-odm-is-not-keyword-of-the = { $k } nie jest słowem kluczowym bloku { $kind }

engine-e-odm-block-without = blok { $kind } bez { $k }

engine-e-odm-block-with-data-lines = blok { $kind } z wierszami danych

engine-e-odm-line-has-values-expected = wiersz { $kind } { $l } ma wartości: { $l2 }, oczekiwano { $n }

engine-e-odm-is-not-an-ocm-metadata = { $k } nie jest słowem kluczowym metadanych OCM

engine-e-odm-ocm-metadata-without = metadane OCM bez { $k }

engine-e-odm-block-repeated = blok { $kind } powtórzony

engine-e-odm-inside-block = { $t } wewnątrz bloku

engine-e-odm-unsupported-ocm-block = nieobsługiwany blok OCM { $tag }

engine-odm-outside-block = { $t } poza blokiem

engine-e-odm-closes-block = { $t } zamyka blok { $want }

engine-e-odm-unexpected-line-2 = nieoczekiwany wiersz { $t }

engine-e-odm-outside-block = { $k } poza blokiem

engine-e-odm-unterminated-block = niezakończony blok

## src/oem.rs

engine-e-oem-epoch-missing-date-time-separator = w epoce brak separatora daty i czasu 'T': { $s }

engine-e-oem-unsupported-oem-epoch-date-expected = nieobsługiwana data epoki OEM '{ $date }' (oczekiwano yyyy-mm-dd)

engine-e-oem-unsupported-oem-epoch-time-expected = nieobsługiwany czas epoki OEM '{ $time }' (oczekiwano HH:MM:SS)

engine-e-oem-bad-epoch-year = nieprawidłowy rok epoki: { $d }

engine-e-oem-bad-epoch-month = nieprawidłowy miesiąc epoki: { $d }

engine-e-oem-bad-epoch-day = nieprawidłowy dzień epoki: { $d }

engine-e-oem-bad-epoch-hour = nieprawidłowa godzina epoki: { $t }

engine-e-oem-bad-epoch-minute = nieprawidłowa minuta epoki: { $t }

engine-e-oem-bad-epoch-second = nieprawidłowa sekunda epoki: { $t }

engine-e-oem-oem-epoch-field-out-of = pole epoki OEM poza zakresem: { $s }

engine-e-oem-unexpected-oem-header-line = nieoczekiwany wiersz nagłówka OEM: { $line }

engine-e-oem-expected-meta-start-found = oczekiwano META_START, znaleziono: { $line }

engine-e-oem-unexpected-oem-metadata-line = nieoczekiwany wiersz metadanych OEM: { $line }

engine-e-oem-oem-segment-metadata-missing-meta = w metadanych segmentu OEM brak META_STOP

engine-e-oem-oem-metadata-missing-object-name = w metadanych OEM brak OBJECT_NAME

engine-e-oem-oem-metadata-missing-object-id = w metadanych OEM brak OBJECT_ID

engine-e-oem-oem-metadata-missing-center-name = w metadanych OEM brak CENTER_NAME

engine-e-oem-oem-metadata-missing-ref-frame = w metadanych OEM brak REF_FRAME

engine-e-oem-oem-metadata-missing-time-system = w metadanych OEM brak TIME_SYSTEM

engine-e-oem-oem-metadata-missing-start-time = w metadanych OEM brak START_TIME

engine-e-oem-oem-metadata-missing-stop-time = w metadanych OEM brak STOP_TIME

engine-e-oem-oem-data-line-needs-position = wiersz danych OEM wymaga składowych położenia i prędkości (6) lub dodatkowo przyspieszenia (9), otrzymano { $n }: { $line }

engine-e-oem-non-numeric-oem-state-value = nienumeryczna wartość stanu OEM '{ $t }' w: { $line }

engine-e-oem-oem-missing-ccsds-oem-vers = w OEM brak nagłówka CCSDS_OEM_VERS

engine-e-oem-oem-missing-creation-date-header = w OEM brak nagłówka CREATION_DATE

engine-e-oem-oem-missing-originator-header = w OEM brak nagłówka ORIGINATOR

engine-e-oem-oem-carried-no-segments = OEM nie zawierał segmentów

engine-e-oem-no-covariance-start-block = brak bloku COVARIANCE_START

engine-e-oem-no-covariance-stop = brak COVARIANCE_STOP

engine-e-oem-bad-covariance-value = nieprawidłowa wartość kowariancji '{ $tok }': { $e }

engine-e-oem-expected-21-covariance-values-found = oczekiwano 21 wartości kowariancji, znaleziono { $vals }

## src/omm.rs

engine-e-omm-omm-export-needs-full-line = eksport OMM wymaga pełnych TLE (wiersz 1 + wiersz 2); ten blok ich nie ma

## src/optical_atmosphere_scenario.rs

engine-e-optical-atmosphere-scenario-must-be-in = { $n } musi należeć do [0, 1]

engine-e-optical-atmosphere-scenario-elevation-deg-must-be-in = elevation_deg musi należeć do [5, 90]

engine-e-optical-atmosphere-scenario-atmosphere-wave-must-be-plane = atmosphere.wave musi mieć wartość "plane" lub "spherical"

engine-e-optical-atmosphere-scenario-atmosphere-direction-must-be-downlink = atmosphere.direction musi mieć wartość "downlink" lub "uplink"

engine-e-optical-atmosphere-scenario-availability-targets-pct-entries-must = wpisy availability_targets_pct muszą należeć do (0, 100)

engine-e-optical-atmosphere-scenario-timeseries-duration-must-be-at = timeseries.duration_h musi wynosić najwyżej 8760 (jeden rok)

engine-e-optical-atmosphere-scenario-timeseries-steps-is-above-the = timeseries: { $steps } kroków to więcej niż { $MAX_STEPS } przenoszone przez wynik; zwiększ step_s lub skróć duration_h

engine-e-optical-atmosphere-scenario-unknown-clock-class = nieznana klasa zegara "{ $c }"

engine-e-optical-atmosphere-scenario-every-site-needs-name = każde stanowisko wymaga nazwy

engine-e-optical-atmosphere-scenario-site-latitude-longitude-out-of = stanowisko { $name }: szerokość/długość geograficzna poza zakresem

engine-e-optical-atmosphere-scenario-site-altitude-must-be-in = stanowisko { $name }: altitude_m musi należeć do [0, top)

engine-optical-atmosphere-scenario-optical-atmosphere-nm-at-deg = optical-atmosphere: { $wavelength_nm } nm przy elewacji { $elevation_deg } deg, margines { $margin0 } dB przed atmosferą; najlepsze stanowisko { $scn } { $v5 } %; sieć o liczbie stanowisk { $order }: { $last } % przy niezależnej / { $last2 } % przy skorelowanej pogodzie (MODELLED, doradczo)

## src/orbit.rs

engine-e-orbit-rinex-block-parsed-but-contained = blok RINEX został sparsowany, ale nie zawierał obsługiwanych efemeryd

## src/orbit.rs

engine-e-orbit-user-site-lat-deg-must = user_site: lat_deg musi należeć do [-90, 90], a każde pole być skończone

engine-e-orbit-no-satellites-to-export = brak satelitów do eksportu

engine-e-orbit-time-step-must-be-positive = time.step_s musi być dodatnie dla eksportu SP3

engine-e-orbit-time-step-must-be-positive-2 = time.step_s musi być dodatnie dla eksportu OEM

## src/orbital_timing.rs

engine-e-orbital-timing-must-be-positive-got = { $name } musi być dodatnie; otrzymano { $v }

engine-e-orbital-timing-receiver-time-sigma-must-be = receiver_time_sigma_s musi być skończone i nieujemne

engine-e-orbital-timing-max-ramp-rate-must-be = max_ramp_rate musi być skończone i nieujemne

engine-e-orbital-timing-spoofer-minimum-elevation-must-be = minimalna elewacja spoofera musi należeć do [0, 90) stopni

engine-e-orbital-timing-cross-check-sigma-ns-must = sigma_ns kontroli krzyżowej musi być skończone i nieujemne

engine-orbital-timing-the-in-plane-neighbour-degrees = sąsiad w tej samej płaszczyźnie, { $v1 } stopni do przodu, leży poza zasięgiem pojedynczego spoofera ({ $v2 } stopni w poprzek)

engine-orbital-timing-the-in-plane-neighbour-degrees-2 = sąsiad w tej samej płaszczyźnie, { $v1 } stopni do przodu, może leżeć w zasięgu tego samego spoofera ({ $v2 } stopni w poprzek), więc oba zegary mogą być odciągane razem

## src/osnma/cli.rs

engine-e-osnma-cli-missing-input-file = brak pliku wejściowego

engine-e-osnma-cli-max-time-error-has-no = --max-time-error nie ma efektu bez --reference-time

engine-e-osnma-cli-not-number = to nie jest liczba: { $s }

engine-e-osnma-cli-public-key-must-be-id = klucz publiczny musi mieć postać ID:TYPE:HEX

engine-e-osnma-cli-public-key-type-must-be = typ klucza publicznego musi mieć wartość p256 lub p521

engine-e-osnma-cli-unknown-format = nieznany format { $f }

engine-e-osnma-cli-is-not-text-use-format = { $label } nie jest tekstem; dla strumienia UBX użyj --format ubx

engine-e-osnma-cli-vector-csv-needs-start-gst = wektorowy plik CSV wymaga --start-gst lub nazwy pliku z datą

engine-osnma-cli-error-cannot-read =
    { $ADVISORY }

    błąd: nie można odczytać { $input }: { $e }

engine-osnma-cli-galileo-osnma-verification =
    Weryfikacja Galileo OSNMA
    { $ADVISORY }{ "\u000A" }

engine-osnma-cli-input-pages = wejście: { $input } (strony: { $pages })

engine-osnma-cli-ubx-frames-nav-pages-decoded = ubx: ramki: { $frames }; zdekodowane strony I/NAV: { $inav_pages }, umieszczone w czasie: { $pages } (zły CRC: { $bad_crc }, nieumieszczalne: { $unstamped }, konflikty czasu: { $time_conflicts })

engine-osnma-cli-overall-nma-status = ogółem: { $status_word }   status NMA: { $nma_status }

engine-osnma-cli-alert-verified-osnma-alert-message = ALARM: odebrano zweryfikowany komunikat alarmowy OSNMA. Przestań używać danych OSNMA; nic nie jest raportowane jako uwierzytelnione.

engine-osnma-cli-freshness-not-enforced-no-reference = aktualność: NIE jest egzekwowana. Nie podano czasu odniesienia, więc czasy podramek są brane z wejścia, a powtórka starych danych zostałaby uwierzytelniona.

engine-osnma-cli-freshness-sub-frames-within-of = aktualność: używane są podramki w granicach { $max_err } s od czasu odniesienia { $v2 }; odłożono na bok: { $set_aside }. Czas odniesienia jest pojedynczą chwilą.

engine-osnma-cli-satellite-status-authenticated-failed-pending = { "\u000A" }satelita   status          uwierzytelnione  niepowodzenia  oczekujące  odrzucone  ostatnio uwierzytelnione

engine-osnma-cli-epoch-tag-sub-frame-tx = { "\u000A" }epoka (podramka znacznika)  tx   dane  adkd  ctr  wynik

## src/osnma/input.rs

engine-e-osnma-input-line-expected-fields = wiersz { $v1 }: oczekiwano 3 pól

engine-e-osnma-input-line-bad-svid = wiersz { $v1 }: nieprawidłowy SVID

engine-e-osnma-input-line-bad-bit-count = wiersz { $v1 }: nieprawidłowa liczba bitów

engine-e-osnma-input-line-data-is-not-hex = wiersz { $v1 }: dane nie są szesnastkowe

engine-e-osnma-input-line-bit-count-does-not = wiersz { $v1 }: liczba bitów nie zgadza się z danymi

## src/osnma/verifier.rs

engine-e-osnma-verifier-the-time-tolerance-must-be = tolerancja czasu musi być mniejsza niż jedna podramka ({ $SUBFRAME_S } s), podano { $t } s

## src/passes.rs

engine-e-passes-itu-834-refraction-is-defined = refrakcja ITU-R P.834 jest zdefiniowana dla wysokości stacji od 0 do 3 km; podano { $h_km } km

engine-e-passes-duration-and-step-must-be = duration_s i step_s muszą być dodatnie

engine-e-passes-station-lat-deg-must-be = station_lat_deg musi należeć do [-90, 90]

engine-e-passes-mask-deg-must-be-in = mask_deg musi należeć do [0, 90)

engine-e-passes-duration-hours-must-be-finite = duration_hours musi być skończone i dodatnie

engine-e-passes-step-must-be-finite-and = step_s musi być skończone i dodatnie

engine-passes-passes-pass-es-of-km = passes: przeloty: { $passes } po orbicie { $altitude_km } km / { $inclination_deg }° nad ({ $station_lat_deg }°, { $station_lon_deg }°) > { $mask_deg }° w { $duration_hours } h; łączny dostęp { $total_access_s } s (MODELLED)

## src/precise_products.rs

engine-e-precise-products-short-record = zbyt krótki rekord { $record }: { $line }

engine-e-precise-products-bad-number-in = nieprawidłowa liczba { $s } w { $line }

engine-e-precise-products-bad-field-in = nieprawidłowe pole { $s } w { $line }

engine-e-precise-products-bad-antex-epoch = nieprawidłowa epoka ANTEX { $s }

engine-e-precise-products-bad-offset = nieprawidłowe przesunięcie { $body }

## src/propagator.rs

engine-e-propagator-the-ephemeris-provider-has-no = dostawca efemeryd nie ma geocentrycznego { $name } dla JD(TT) { $epoch_jd_tt }

## src/pvt.rs

engine-pvt-3d-error-rms-max = { " " }| błąd 3D RMS { $rms } m (maks. { $max } m)

engine-pvt-post-fit-rms = { " " }| RMS po dopasowaniu { $mean_postfit_rms_m } m

engine-pvt-single-point-positioning-3d-error = Pozycjonowanie jednopunktowe — błąd 3D względem współrzędnej pomierzonej (RMS { $rms_3d_m } m)

engine-pvt-single-point-positioning-post-fit = Pozycjonowanie jednopunktowe — RMS reszt po dopasowaniu (średnio { $mean_postfit_rms_m } m)

## src/python.rs

engine-e-python-runoutput-array-accessors-need-numpy = akcesory tablicowe RunOutput wymagają NumPy (pip install numpy): { $e }

engine-e-python-is-not-numeric-array-list = { $path } nie jest tablicą liczbową (listą liczb lub list liczb o równej długości)

engine-e-python-is-not-non-empty-list = { $path } nie jest niepustą listą rekordów

engine-python-runoutput-json-bytes-svg-bytes = RunOutput(json={ $json } bajtów, svg={ $svg } bajtów, csv={ $value } bajtów, summary={ $value2 })

engine-e-python-and-must-be-the-same = i oraz q muszą mieć tę samą długość ({ $i } wobec { $q })

engine-e-python-not-acquired-statistic-threshold = { $code }: nie przechwycono (statystyka { $statistic } < próg { $threshold })

engine-python-design-prn-channels-at-most = kanały (projekt, PRN): { $designs }; najwyżej 256 na przemiatanie

engine-python-not-acquired-statistic-threshold = { $code }: nie przechwycono (statystyka { $statistic } < próg { $threshold })

engine-e-python-runs-needs-label = runs[{ $i }] wymaga `label`

engine-e-python-runs-needs-result = runs[{ $i }] wymaga `result`

engine-e-python-must-be-between-and-32 = { $name } musi mieścić się między 0 a 2**32 - 1

## src/qtrade.rs

engine-qtrade-seed-quantum-wins-foms = { $scenario } | ziarno (seed) { $seed } | v{ $engine_version } | kwantowe wygrywa { $value }/{ $foms } wskaźników jakości | { $status }

## src/quantum_devices.rs

engine-quantum-devices-sigma-from = sigma_y(1 s) = { $adev } z { $refr }

## src/quantum_trade.rs

engine-e-quantum-trade-unknown-baseline-clock-class-csac = nieznany baseline_clock_class '{ $s }' (csac|uso|dsac|tcxo|ocxo|rafs)

engine-e-quantum-trade-unknown-candidate-clock-class-optical = nieznany candidate_clock_class '{ $other }' (optical-lattice|trapped-ion|mercury-ion)

engine-e-quantum-trade-adev-taus-values-must-be = tau/wartości ADEV muszą być skończone i > 0

engine-quantum-trade-quantum-trade-candidate-timing-holdover = quantum-trade | kandydat { $candidate_source } | holdover czasu { $timing_holdover_s }s wobec { $timing_holdover_s2 }s ({ $timing_benefit_x }x) | inercyjny { $inertial_holdover_s }s wobec { $inertial_holdover_s2 }s ({ $inertial_benefit_x }x) | wybieg odporności { $coast_time_s }s{ $v9 } | MODELLED{ $v10 }

## src/realdata/clk.rs

engine-e-realdata-clk-rinex-clock-file-declares-time = plik zegarów RINEX deklaruje system czasu { $id }, którego ten czytnik nie zna (znane: { $known_clock_time_systems }); odrzucono go zamiast czytać jego epoki jako czas GPS

engine-e-realdata-clk-rinex-clock-file-has-satellite = plik zegarów RINEX ma system satelitarny { $other } i nie deklaruje TIME SYSTEM ID; odmowa zgadywania systemu czasu jego epok

engine-e-realdata-clk-rinex-clock-files-declare-different = pliki zegarów RINEX deklarują różne systemy czasu ({ $s } i { $ts }); odmowa połączenia ich na jednej osi czasu

engine-e-realdata-clk-no-as-or-ar-records = brak rekordów AS lub AR dla { $id }

engine-e-realdata-clk-short-circular-row = zbyt krótki wiersz Circular T: { $t }

engine-e-realdata-clk-bad-value-in = nieprawidłowa wartość { $s } w { $t }

engine-e-realdata-clk-no-section-mjd-header-found = nie znaleziono nagłówka MJD sekcji 1

## src/realdata/ion_sdr.rs

engine-e-realdata-ion-sdr-unterminated-closing-tag = niezakończony znacznik zamykający

engine-e-realdata-ion-sdr-unbalanced-closing-tag = niezrównoważony znacznik zamykający

engine-e-realdata-ion-sdr-unterminated-tag = niezakończony znacznik

engine-e-realdata-ion-sdr-attribute-value-missing = brak wartości atrybutu

engine-e-realdata-ion-sdr-element-outside-the-document = element poza dokumentem

engine-e-realdata-ion-sdr-text-outside-the-document = tekst poza dokumentem

engine-e-realdata-ion-sdr-element-left-open = elementy pozostawione otwarte: { $stack }

engine-e-realdata-ion-sdr-expected-one-root-element-found = oczekiwano jednego elementu głównego, znaleziono { $n }

engine-e-realdata-ion-sdr-unknown-frequency-format = nieznany format częstotliwości { $f }

engine-e-realdata-ion-sdr-unsupported-encoding = nieobsługiwane kodowanie { $other }

engine-e-realdata-ion-sdr-streams-only-single-stream-files = strumienie: { $streams }; odczytywane są tylko pliki jednostrumieniowe

engine-e-realdata-ion-sdr-block-of-cycles-with-header = blok o liczbie cykli { $cycles } z nagłówkiem lub stopką powtarza się; odczytywany jest tylko pojedynczy blok obejmujący plik

engine-e-realdata-ion-sdr-chunk-of-words-of-bytes = porcja: słowa: { $words_per_chunk }, bajtów na słowo: { $word_bytes }

engine-e-realdata-ion-sdr-unsupported-sample-format = nieobsługiwany format próbek { $other }

engine-e-realdata-ion-sdr-quantization-in-packed-bits-per = kwantyzacja { $quantization } w { $packed_bits } upakowanych bitach na próbkę

engine-e-realdata-ion-sdr-sample-rate-of-hz-is = częstotliwość próbkowania { $sample_rate_hz } Hz nie jest całkowitą wielokrotnością współczynnika { $samples_per_lump }

engine-e-realdata-ion-sdr-chunk-holds-no-whole-lump = porcja nie zawiera całego bloku próbek

engine-e-realdata-ion-sdr-samples-requested-the-file-holds = żądane próbki { $start }..{ $v1 }, plik zawiera { $total }

## src/realdata/llr_crd.rs

engine-realdata-llr-crd-unreadable-crd-version = nieczytelna wersja CRD { $f }

engine-realdata-llr-crd-crd-format-version-is-not = wersja formatu CRD { $v } nie jest obsługiwana (tylko 1 i 2 mają wspólną kolejność pól rekordu 11, na której polega ten czytnik)

engine-realdata-llr-crd-unreadable-station-id = nieczytelny identyfikator stacji { $f }

engine-realdata-llr-crd-unreadable-time-scale = nieczytelna skala czasu { $f }

engine-realdata-llr-crd-crd-epoch-time-scale-is = skala czasu epoki CRD { $time_scale } nie jest żadną z trzech, które według specyfikacji formatu analitycy akceptują (3 = UTC(USNO), 4 = UTC(GPS), 7 = UTC(BIH)); odmowa odczytu jako UTC

engine-realdata-llr-crd-unreadable-h4-field = nieczytelne pole h4 { $i }: { $f }

engine-realdata-llr-crd-unreadable-field = nieczytelne pole { $i }: { $f }

engine-realdata-llr-crd-unreadable-epoch-event = nieczytelne zdarzenie epoki { $f }

engine-realdata-llr-crd-non-physical-time-of-flight = niefizyczny czas lotu { $tof }

engine-e-realdata-llr-crd-cannot-read-normal-point-directory = nie można odczytać katalogu punktów normalnych { $dir }: { $e }

engine-e-realdata-llr-crd-no-npt-normal-point-files = brak plików punktów normalnych *.npt w { $dir } — ten scenariusz odczytuje rzeczywiste zarchiwizowane pomiary i bez nich nie zadziała

## src/realdata/lola_dem.rs

engine-e-realdata-lola-dem-bad-number = nieprawidłowa liczba '{ $t }': { $e }

engine-e-realdata-lola-dem-dem-has-zero-dimension = DEM ma zerowy wymiar

## src/realdata/lugre.rs

engine-e-realdata-lugre-coding-lugre-batch-is-two = kodowanie { $encoding }: partia LuGRE jest w kodzie uzupełnień do dwóch

engine-e-realdata-lugre-bytes-shorter-than-the-iqs = { $bytes } bajtów: krótsze niż nagłówek IQS

engine-e-realdata-lugre-not-an-iqs-frame = to nie jest ramka IQS: { $bytes }

engine-realdata-lugre-sample-rate-metadata-hz-header = częstotliwość próbkowania: metadane { $sample_rate_hz } Hz, nagłówek { $sampling_freq_hz } Hz

engine-realdata-lugre-quantisation-metadata-bits-header-bits = kwantyzacja: metadane { $quantization } bitów, nagłówek { $quant_bits } bitów

engine-realdata-lugre-centre-frequency-metadata-hz-header = częstotliwość środkowa: metadane { $center_freq_hz } Hz, nagłówek { $central_freq_hz } Hz

engine-realdata-lugre-intermediate-frequency-metadata-hz-header = częstotliwość pośrednia: metadane { $translated_freq_hz } Hz, nagłówek { $intermediate_freq_hz } Hz

engine-realdata-lugre-sample-count-metadata-layout-gives = liczba próbek: układ z metadanych daje { $layout }, nagłówek { $n_samples }

engine-realdata-lugre-header-footer-metadata-bytes-format = nagłówek/stopka: metadane { $header_bytes }/{ $footer_bytes } bajtów, format { $IQS_HEADER_BYTES }/{ $IQS_FOOTER_BYTES }

engine-realdata-lugre-file-length-is-not-header = długość pliku { $file_len } nie jest równa nagłówek + { $value } bajtów próbek + stopka

engine-realdata-lugre-field-missing = brak pola { $key }

engine-e-realdata-lugre-field-unreadable = pole { $key } nieczytelne

engine-realdata-lugre-raw-line = wiersz RAW { $v1 }: { $e }

engine-realdata-lugre-acq-line = wiersz ACQ { $v1 }: { $e }

engine-realdata-lugre-nav-line = wiersz NAV { $v1 }: { $e }

engine-e-realdata-lugre-clk-row-unreadable = wiersz CLK { $v1 }: nieczytelny

engine-e-realdata-lugre-clk-row-columns-expected = wiersz CLK { $v1 }: kolumny: { $v }, oczekiwano 3

## src/realdata/yunnan.rs

engine-e-realdata-yunnan-parse-json = parsowanie JSON: { $e }

engine-e-realdata-yunnan-expected-json-object-at-the = oczekiwano obiektu JSON na najwyższym poziomie

engine-e-realdata-yunnan-missing-recordtime-array = brak tablicy recordTime

## src/realtime_frame_eop.rs

engine-e-realtime-frame-eop-cannot-read-eop-file = nie można odczytać pliku EOP { $path }: { $e }

engine-e-realtime-frame-eop-latency-must-be-finite-and = latency_s musi być skończone i nieujemne, podano { $latency_s }

engine-e-realtime-frame-eop-cannot-read-later-vintage-eop = nie można odczytać pliku EOP późniejszego wydania { $path }: { $e }

engine-realtime-frame-eop-empty-and-deliberately-so-predicted = PUSTE, i to celowo: wiersz prognozowane-wobec-ostatecznych wymaga epoki wydania z PEŁNYM oknem dopasowania { $window_days }-dniowym za nią oraz opublikowanej wartości ostatecznej Bulletin B w epoce docelowej. Obowiązujące wejście ({ $eop_source }) nie dostarcza epoki spełniającej oba warunki. Skróć `operational_window_days` albo dostarcz dłuższą rzeczywistą serię finals2000A — żaden wiersz nie jest wytwarzany sztucznie, aby wypełnić tabelę.

engine-realtime-frame-eop-measured-over-the-real-series = Zmierzone na obowiązującej serii rzeczywistej ({ $eop_source }). Każdy wiersz jest rzeczywistym błędem prognozy: prognoza na T+h, utworzona z szybkich wierszy Bulletin A w chwili T lub wcześniejszych, oceniona względem PÓŹNIEJ opublikowanej wartości ostatecznej Bulletin B w T+h. Persystencja jest oceniana na identycznym zbiorze epok względem identycznych wartości ostatecznych, więc obie kolumny różnią się predyktorem i niczym więcej. `improvement_factor` poniżej 1 oznacza, że predyktor operacyjny jest GORSZY od persystencji dla tego horyzontu, i jest tak raportowany.

engine-realtime-frame-eop-measured-over-genuine-two-vintage = Zmierzone na rzeczywistej parze dwóch wydań: wydanie w stanie z chwili publikacji ({ $eop_source }) zawiera rzeczywiste prognozy Bulletin A poza własnym terminem odcięcia danych, a zarchiwizowane późniejsze wydanie ({ $c }) zawiera wartości ostateczne Bulletin B, które te daty ostatecznie otrzymały. Względem tej wartości ostatecznej oceniane są trzy prognozy — sama zarchiwizowana prognoza Bulletin A, dopasowanie w stylu operacyjnym tej paczki (crate) na wydaniu z chwili publikacji oraz persystencja od terminu odcięcia.

engine-realtime-frame-eop-empty-and-deliberately-so-later = PUSTE, i to celowo: dostarczono późniejsze wydanie ({ $c }), ale żadna data nie występuje jako PREDICTION Bulletin A w pliku z chwili publikacji ({ $eop_source }) i jako wartość OSTATECZNA Bulletin B w późniejszym dla żadnego żądanego horyzontu. Żaden wiersz nie jest syntezowany.

engine-realtime-frame-eop-empty-and-deliberately-so-scoring = PUSTE, i to celowo. Ocena RZECZYWISTEJ ZARCHIWIZOWANEJ prognozy wymaga dwóch wydań tego samego produktu finals2000A; ten przebieg otrzymał jedno ({ $eop_source }). Repozytorium nie zawiera zarchiwizowanego wcześniejszego wydania i NIE tworzy się go przez zaburzanie posiadanego wydania — zsyntezowane archiwum sprawiłoby, że każda liczba w tej tabeli byłaby pomiarem zaburzenia. Dostarcz rzeczywiste zarchiwizowane późniejsze wydanie przez `eop_finals2000a_later`, aby ją wypełnić. Do tego czasu rzeczywiste błędy prognozowane-wobec-ostatecznych, które ten raport zawiera, znajdują się w `table5_operational_vs_persistence`, gdzie prognoza pochodzi z tej paczki (crate), a wzorcem jest później opublikowana wartość ostateczna Bulletin B.

engine-realtime-frame-eop-realtime-frame-eop-table-post = realtime-frame-eop | Tabela 1: post-proc { $c } m ({ $c2 } ms UT1) ↔ czas rzeczywisty { $c3 } m ({ $c4 } ms UT1) | Tabela 2: dno wartości ostatecznej { $floor } ms → { $far } dni { $far2 } ms | budżet łącznie { $total_m } m ({ $total_time_ns } ns) | ramię dźwigni L19 + dane rzeczywiste L18 (zwalidowane), kowariancja OD (modelowana)

engine-realtime-frame-eop-measured-over-genuine-two-vintage-2 = Zmierzone na rzeczywistej parze dwóch wydań: PROGNOZOWANE UT1 z Bulletin A w pliku z chwili publikacji ({ $eop_source }) zróżnicowane względem ostatecznej wartości OSTATECZNEJ Bulletin B w zarchiwizowanym późniejszym wydaniu ({ $c }), dla horyzontów: { $predicted_vs_final }.

engine-realtime-frame-eop-empty-and-deliberately-so-an = PUSTE, i to celowo: dostarczono zarchiwizowane późniejsze wydanie ({ $c }), ale żadna data nie występuje jako PREDICTION Bulletin A w pliku z chwili publikacji ({ $eop_source }) i jako wartość OSTATECZNA Bulletin B w późniejszym dla żadnego żądanego horyzontu, więc nie ma reszty prognozowane-wobec-ostatecznych do zaraportowania. Żaden wiersz nie jest syntezowany.

engine-realtime-frame-eop-empty-and-deliberately-so-predicted-2 = PUSTE, i to celowo: reszta prognozowane-wobec-ostatecznych wymaga DWÓCH wydań tego samego produktu finals2000A. Ten przebieg otrzymał jedno ({ $eop_source }). Jego wiersze prognoz Bulletin A dotyczą przyszłych dat, które nie mają jeszcze wartości ostatecznej Bulletin B, więc reszta nie istnieje do zmierzenia i żadna nie jest tu wymyślana. Dostarcz zarchiwizowane późniejsze wydanie przez `eop_finals2000a_later`, aby wypełnić tę tabelę. Do tego czasu wzrost błędu w wielu dniach raportowany w `table2_error_vs_horizon` jest predyktorem PERSYSTENCJI ocenianym na rzeczywistych wartościach ostatecznych — rzeczywistym zmierzonym błędem, ale predyktora modelowanego, a nie resztą prognozy IERS Bulletin A.

## src/receiver_trust/assess.rs

engine-e-receiver-trust-assess-vessel-assessment-needs-platform-kind = ocena statku wymaga [platform] kind = "vessel"

engine-e-receiver-trust-assess-excerpt-is-bytes-the-limit = fragment ma { $excerpt } bajtów; limit wynosi { $MAX_EXCERPT_BYTES }

engine-e-receiver-trust-assess-excerpt-holds-more-than-epochs = fragment zawiera więcej niż { $MAX_EXCERPT_EPOCHS } epok; skróć go

engine-e-receiver-trust-assess-the-excerpt-ends-inside-the = fragment kończy się wewnątrz okna kalibracji { $calibration_s } s (epoki: { $epochs }): nic nie zostało ocenione

## src/receiver_trust/calibration.rs

engine-e-receiver-trust-calibration-run-monitors = run_monitors: { $e }

engine-e-receiver-trust-calibration-no-utc-labelled-epoch-in = brak epoki z etykietą UTC w dzienniku UBX

engine-e-receiver-trust-calibration-no-scenario-json-under = brak scenario.json w { $root }

engine-receiver-trust-calibration-b1-held-out-clean-pfa = B1 { $config_field }: Pfa na czystym zbiorze wstrzymanym <= { $B1_MAX_PFA } (skalibrowane: { $r })

## src/receiver_trust/geometry.rs

engine-e-receiver-trust-geometry-geometry-must-be-finite-and = geometry: { $name } musi być skończone i > 0 (podano { $v })

engine-e-receiver-trust-geometry-geometry-reported-vs-derived-rel = geometry: reported_vs_derived_rel musi być skończone i >= 0 (podano { $reported_vs_derived_rel })

engine-e-receiver-trust-geometry-geometry-min-used-must-be = geometry: min_used musi wynosić co najmniej 1

engine-e-receiver-trust-geometry-geometry-low-elev-deg-must = geometry: low_elev_deg musi należeć do [0, 90] (podano { $low_elev_deg })

engine-e-receiver-trust-geometry-geometry-azimuth-gap-deg-must = geometry: azimuth_gap_deg musi należeć do (0, 360] (podano { $azimuth_gap_deg })

engine-e-receiver-trust-geometry-geometry-cap-points-must-be = geometry: cap_points musi należeć do [0, 100] (podano { $cap_points })

engine-e-receiver-trust-geometry-geometry-full-ratio-must-be = geometry: full_ratio musi być skończone i > 1 (podano { $full_ratio })

engine-e-receiver-trust-geometry-geometry-floor-must-be-in = geometry: floor musi należeć do (0, 100] (podano { $f })

engine-e-receiver-trust-geometry-geometry-floor-is-below-the = geometry: floor ({ $f }) jest poniżej degraded_min wyniku ({ $degraded_min }): sama geometria mogłaby osiągnąć pasmo bez zaufania

## src/receiver_trust/geometry.rs

engine-receiver-trust-geometry-the-geometry-deduction-is-classed = { $why }: odjęcie punktów za geometrię jest klasyfikowane jako niespójność

engine-receiver-trust-geometry-reported-not-scored-the-geometry = { $why }: zgłoszone, nie punktowane (geometria nie jest słaba)

engine-receiver-trust-geometry-not-scored-the-score-deducts = nie punktowane (wynik odejmuje punkty tylko powyżej HDOP { $hdop_max }, PDOP { $pdop_max } lub poniżej { $min_used } satelitów)

engine-receiver-trust-geometry-the-stated-hdop-disagrees-with = podany HDOP { $fmt_dop } nie zgadza się z HDOP { $fmt_dop2 } wyznaczonym z podanego nieba, poza tolerancją

engine-receiver-trust-geometry-satellites-in-view-but-not = satelity w zasięgu widzenia, lecz nieśledzone ({ $g } z { $in_view } na wysokości co najmniej { $low_elev_deg } deg): środowisko sygnału, nie geometria

engine-receiver-trust-geometry-pdop-above = PDOP { $fmt_dop } powyżej { $pdop_max }

engine-receiver-trust-geometry-hdop-above = HDOP { $fmt_dop } powyżej { $hdop_max }

engine-receiver-trust-geometry-satellites-behind-the-stated-skyline = satelity za podaną linią horyzontu: { $m }

engine-receiver-trust-geometry-every-satellite-in-one-half = wszystkie satelity w jednej połowie nieba (przerwa { $max_azimuth_gap_deg } deg)

engine-receiver-trust-geometry-degraded-by-geometry-not-an = pogorszone przez geometrię: { $parts } ({ $from }); nie jest to niespójność

## src/receiver_trust/ingest.rs

engine-e-receiver-trust-ingest-the-log-holds-no-epochs = zapis nie zawiera epok: nic w nim nie dało się odczytać jako { $name } (pominięte rekordy uszkodzone lub niepodlegające analizie: { $skipped_records }); sprawdź ustawienie formatu

engine-receiver-trust-ingest-gps-week-tow = tydzień GPS { $week } TOW { $tow } s

engine-receiver-trust-ingest-gps-week-tow-2 = tydzień GPS { $w } TOW { $tow } s

engine-receiver-trust-ingest-utc-date-not-in-log = { $v1 }:{ $v2 }:{ $v3 }.{ $v4 } UTC (brak daty w zapisie)

## src/receiver_trust/live.rs

engine-e-receiver-trust-live-live-must-be-finite-and = live: { $name } musi być skończone i >= 0 (otrzymano { $v })

engine-e-receiver-trust-live-live-idle-flush-must-be = live: idle_flush_s musi być większe od 0

engine-e-receiver-trust-live-invalid-session = nieprawidłowa sesja: { $e }

engine-receiver-trust-live-no-score-could-be-produced = nie udało się wyznaczyć wyniku: { $msg }

## src/receiver_trust/machines/gnss_sdr.rs

engine-e-receiver-trust-machines-gnss-sdr-no-gnss-sdr-synchro-or = nie udało się odczytać żadnego rekordu synchro ani pvt z GNSS-SDR (pominięte wiersze: { $skipped }); format wiersza opisuje integrations/gnss-sdr/README.md

## src/receiver_trust/machines/imu.rs

engine-e-receiver-trust-machines-imu-the-imu-file-is-empty = plik IMU jest pusty

engine-e-receiver-trust-machines-imu-imu-csv-no-column = IMU csv: brak kolumny `{ $n }`

engine-e-receiver-trust-machines-imu-imu-euroc-no-column = IMU euroc: brak kolumny `{ $n }`

engine-e-receiver-trust-machines-imu-the-imu-file-holds-no = plik IMU nie zawiera żadnej czytelnej próbki

## src/receiver_trust/machines/imu_fit.rs

engine-e-receiver-trust-machines-imu-fit-axis-must-be-or = oś musi mieć wartość 0, 1 lub 2 (x, y, z)

engine-e-receiver-trust-machines-imu-fit-expected-mean-must-be-finite = expected_mean musi być skończone

engine-e-receiver-trust-machines-imu-fit-the-log-time-does-not = czas w zapisie nie narasta

engine-e-receiver-trust-machines-imu-fit-the-sample-interval-is-not = odstęp między próbkami nie jest jednolity (odstępów różniących się o ponad 25 %: { $uneven } z { $n }): najpierw przepróbkuj zapis

engine-e-receiver-trust-machines-imu-fit-the-log-is-too-short = zapis jest zbyt krótki, aby utworzyć krzywą Allana

engine-receiver-trust-machines-imu-fit-the-curve-early-slope-is = początkowe nachylenie krzywej { $name } wynosi { $v }, a nie około -0.5: szum biały nie dominuje (czy czujnik jest nieruchomy?), więc jego współczynnik szumu jest niewiarygodny

engine-receiver-trust-machines-imu-fit-the-curve-is-too-short = krzywa { $name } jest zbyt krótka, aby sprawdzić jej nachylenie

## src/receiver_trust/machines/novatel.rs

engine-receiver-trust-machines-novatel-gps-week-tow = tydzień GPS { $week } TOW { $r } s

engine-e-receiver-trust-machines-novatel-no-bestpos-range-or-rxstatus = nie udało się odczytać żadnego zapisu BESTPOS, RANGE ani RXSTATUS (pominięte rekordy: { $skipped })

## src/receiver_trust/machines/rtcm3.rs

engine-receiver-trust-machines-rtcm3-no-valid-rtcm-frame-was = nie znaleziono prawidłowej ramki RTCM 3 (kandydatów, które nie przeszły CRC: { $skipped })

## src/receiver_trust/maritime.rs

engine-e-receiver-trust-maritime-maritime-must-be-finite-and = maritime: { $name } musi być skończone i > 0 (otrzymano { $v })

engine-e-receiver-trust-maritime-maritime-kin-limit-guard-must = maritime: kin_limit_guard musi należeć do (0, 1) (otrzymano { $kin_limit_guard })

engine-e-receiver-trust-maritime-maritime-kin-sog-frac-must = maritime: kin_sog_frac musi należeć do [0, 1] (otrzymano { $kin_sog_frac })

engine-e-receiver-trust-maritime-maritime-must-be-in-got = maritime: { $name } musi należeć do (0, 1) (otrzymano { $v })

engine-e-receiver-trust-maritime-maritime-cn0-spread-min-sats = maritime: cn0_spread_min_sats musi wynosić co najmniej 3

engine-e-receiver-trust-maritime-maritime-kin-window-must-be = maritime: kin_window_s musi wynosić co najmniej 2 s

## src/receiver_trust/monitors.rs

engine-e-receiver-trust-monitors-monitor-config-unknown-profile-known = konfiguracja monitorów: nieznany profil „{ $other }”; znane: { $threshold_profiles }

engine-e-receiver-trust-monitors-monitor-config-must-be-finite = konfiguracja monitorów: { $name } musi być skończone i > 0 (otrzymano { $v })

engine-e-receiver-trust-monitors-monitor-config-jam-ind-threshold = konfiguracja monitorów: jam_ind_threshold musi być skończone

engine-e-receiver-trust-monitors-monitor-config-mask-deg-must = konfiguracja monitorów: mask_deg musi należeć do [-90, 90) (otrzymano { $mask_deg })

engine-e-receiver-trust-monitors-monitor-config-raim-pfa-must = konfiguracja monitorów: raim_pfa musi należeć do (0, 1) (otrzymano { $raim_pfa })

engine-e-receiver-trust-monitors-monitor-config-cn0-min-sats = konfiguracja monitorów: cn0_min_sats musi wynosić co najmniej 1

engine-e-receiver-trust-monitors-monitor-config-sats-lost-must = konfiguracja monitorów: sats_lost musi wynosić co najmniej 1

engine-receiver-trust-monitors-the-receiver-own-set-against = własny zestaw { $self_report_source } odbiornika zestawiony z monitorami Kshana; żaden z nich nie jest wartością rzeczywistą, zgodność wyników nie jest walidacją

engine-e-receiver-trust-monitors-receiver-timeline-has-non-finite = oś czasu odbiornika zawiera nieskończony czas epoki

engine-e-receiver-trust-monitors-the-log-is-shorter-than = zapis jest krótszy niż okno kalibracji: epoki(-ok) przed { $cal_s } s: { $calibration_epochs } (zapis obejmuje { $span } s); do utworzenia linii bazowej potrzeba co najmniej 3

## src/receiver_trust/platform.rs

engine-e-receiver-trust-platform-platform-must-be-in-got = platform: { $name } musi należeć do ({ $lo }, { $hi }] (otrzymano { $x })

engine-e-receiver-trust-platform-platform-applies-only-to-kind = platform: { $name } dotyczy tylko kind = "vessel" (kind to "static")

## src/receiver_trust/scenario.rs

engine-e-receiver-trust-scenario-cannot-read-the-webassembly-build = nie można odczytać { $path }: kompilacja WebAssembly nie ma systemu plików; przekaż plik w treści jako `text` lub `base64`

engine-e-receiver-trust-scenario-base64-is-not-valid-standard = { $what }: `base64` nie jest prawidłowym standardowym base64

engine-e-receiver-trust-scenario-give-one-of-path-text = { $what }: podaj jedno z `path`, `text` lub `base64`

engine-e-receiver-trust-scenario-give-only-one-of-path = { $what }: podaj tylko jedno z `path`, `text` lub `base64`

engine-e-receiver-trust-scenario-must-be-positive-number-got = { $name } musi być liczbą dodatnią, otrzymano { $v }

engine-e-receiver-trust-scenario-event-onset-must-be-non = zdarzenie { $label }: onset_s musi być liczbą nieujemną

engine-e-receiver-trust-scenario-event-end-must-be-after = zdarzenie { $label }: end_s musi być późniejsze niż onset_s

engine-e-receiver-trust-scenario-log-imu-heading0-deg-and = log.imu: heading0_deg i time_offset_s muszą być skończone

engine-receiver-trust-scenario-trusted-throughout-no-monitor-alarmed = zaufany przez cały czas: żaden monitor nie zgłosił alarmu w epokach po kalibracji: { $after_cal }

engine-receiver-trust-scenario-first-alarm-at-untrusted-for = pierwszy alarm w { $t } s; epoki niezaufane: { $untrusted_epochs }, epoki pogorszone: { $degraded_epochs }, z { $after_cal } epok po kalibracji

engine-receiver-trust-scenario-of-stated-events-detected-within = podanych zdarzeń wykrytych w ciągu { $detect_tol_s } s: { $events_detected } z { $events_evaluable }

engine-receiver-trust-scenario-of-n0-predictions-within-db = prognoz C/N0 mieszczących się w { $cn0_tol_db } dB: { $predictions_agreeing } z { $predictions_evaluable }

engine-receiver-trust-scenario-trust-score-lowest-final = wskaźnik zaufania: najniższy { $min }, końcowy { $last }

engine-receiver-trust-scenario-scenario-receiver-trust-log-epochs = scenariusz { $r } | receiver-trust | zapis { $format_name }, epok: { $epochs } w ciągu { $duration_s } s | monitory { $monitors_run } | { $verdict }

engine-e-receiver-trust-scenario-this-is-scenario-not-receiver = to jest scenariusz typu { $k }, a nie receiver-trust

## src/receiver_trust/score.rs

engine-e-receiver-trust-score-score-must-be-finite-got = score: { $name } musi być skończone (otrzymano { $v })

engine-e-receiver-trust-score-score-need-degraded-min-nominal = score: wymagane 0 < degraded_min < nominal_min <= 100 (otrzymano { $degraded_min } i { $nominal_min })

engine-e-receiver-trust-score-score-evidence-hold-must-be = score: evidence_hold_s musi być skończone i >= 0 (otrzymano { $evidence_hold_s })

engine-e-receiver-trust-score-score-need-onset-ratio-full = score: wymagane 0 <= onset_ratio < full_ratio (otrzymano { $onset_ratio } i { $full_ratio })

engine-e-receiver-trust-score-score-weight-of-must-be = score: waga { $m } musi należeć do [0, 100] (otrzymano { $w })

## src/reentry.rs

engine-e-reentry-entry-velocity-must-be-finite = entry_velocity_m_s musi być skończone i dodatnie

engine-e-reentry-flight-path-angle-deg-must = flight_path_angle_deg musi należeć do (0, 90)

engine-e-reentry-ballistic-coeff-kg-m2-must = ballistic_coeff_kg_m2 musi być skończone i dodatnie

engine-e-reentry-scale-height-and-rho0-kg = scale_height_m i rho0_kg_m3 muszą być skończone i dodatnie

engine-e-reentry-entry-interface-altitude-must-be = entry_interface_altitude_m musi należeć do [10 km, 1000 km]

engine-reentry-reentry-allen-eggers-peak-at = wejście w atmosferę (Allen–Eggers): V_e { $v } m/s, γ { $flight_path_angle_deg }° -> szczyt { $v3 } g na { $v4 } km, { $velocity_at_peak_deceleration } m/s; nagrzewanie osiąga szczyt przy { $velocity_at_peak_heating } m/s; masa punktowa (grawitacja, krzywizna, US76) szczyt { $peak_deceleration_g } g (MODELLED balistyczne, bez efektów aerotermicznych)

## src/registry.rs

engine-e-registry-unknown-scenario-id = nieznany identyfikator scenariusza: { $id }

## src/representativeness.rs

engine-representativeness-trl-band-is-not-well = przedział TRL ({ $lo },{ $hi }) jest nieprawidłowo sformułowany (wymagane 0<=lo<=hi<=9)

engine-representativeness-modelled-simulation-only-claim-cannot = Twierdzenie Modelled (wyłącznie symulacyjne) nie może być reprezentatywne powyżej TRL { $MODELLED_TRL_CEILING } (górna granica przedziału hi={ $hi }); wyższy TRL jest luką, a nie wynikiem symulacji

engine-representativeness-representativeness-representative-for-trl = Reprezentatywność [{ $status }] — { $claim } (reprezentatywne dla TRL { $lo }-{ $hi }){ "\u000A" }

## src/resilience/score.rs

engine-resilience-score-declared-mean-source-quality = { $t } = zadeklarowane({ $arch }) x średnia jakość źródeł

engine-resilience-score-weakest-rpcf-sub-score-bounded = najsłabszy podwynik RPCF = { $min_sub }; ograniczona degradacja = { $bounded } (ogranicza do poziomu 2, jeśli nieograniczona)

## src/rinex.rs

engine-e-rinex-unsupported-navigation-record-header-line = nieobsługiwany nagłówek rekordu nawigacyjnego { $head }: wiersz zaczynający się od '>' jest nagłówkiem rekordu RINEX 4, a nie rekordem nawigacyjnym RINEX 3

engine-e-rinex-bad-prn-in = nieprawidłowy PRN w { $head }

engine-e-rinex-rinex-navigation-expected-record-header = nawigacja RINEX 4: oczekiwano nagłówka rekordu '>', znaleziono { $head }

engine-e-rinex-rinex-record-has-lines-ephemeris = rekord RINEX 4 { $head } ma wierszy: { $body }, efemerydy { $msg } wymagają 8

engine-e-rinex-rinex-record-is-followed-by = po rekordzie RINEX 4 { $head } następuje { $body }, a nie { $sv }

## src/rinex_obs.rs

engine-e-rinex-obs-bad = nieprawidłowe { $what }: { $s }

engine-e-rinex-obs-rinex-observation-file-has-no = plik obserwacji RINEX nie ma END OF HEADER

engine-e-rinex-obs-rinex-observation-file-contained-no = plik obserwacji RINEX nie zawierał rekordów epok

## src/scenario.rs

engine-e-scenario-time-step-must-be-finite = time.step_s musi być skończone i > 0 (otrzymano { $step_s })

engine-e-scenario-time-duration-must-be-finite = time.duration_s musi być skończone i > 0 (otrzymano { $duration_s })

engine-e-scenario-time-step-must-not-exceed = time.step_s ({ $step_s }) nie może przekraczać time.duration_s ({ $duration_s })

## src/sdr.rs

engine-sdr-sampling-rate-is-commensurate-with = częstotliwość próbkowania jest współmierna z szybkością kodu ({ $samples_per_chip } próbek/chip, { $offset_from_integer_samples } próbek od liczby całkowitej): replika kodu z zerowym podtrzymaniem nie rozróżnia zmiany fazy kodu poniżej { $dead_band_chips } chip, więc dyskryminator Early/Late jest schodkowy z jednopróbkowym pasmem martwym zamiast trójkątnego, a DLL ustala się przy błędnym opóźnieniu. Przesuń częstotliwość próbkowania poza całkowitą wielokrotność (5 MHz to { $lit_4_8876 } próbki/chip; 25 MHz to { $lit_24_4379 }) albo próbkuj z nadmiarem na tyle, aby pasmo martwe było mniejsze od wymaganej dokładności fazy kodu.

## src/sgp4.rs

engine-e-sgp4-sgp4-error-code = kod błędu SGP4 { $code }

## src/sigmf.rs

engine-e-sigmf-unsupported-sigmf-core-datatype-this = nieobsługiwany SigMF core:datatype { $other }: ten czytnik obsługuje typy zespolone cf32_le, ci16_le i ci8

engine-e-sigmf-sigmf-core-num-channels-only = SigMF core:num_channels = { $ch }: odczytywane są tylko nagrania jednokanałowe

engine-e-sigmf-cannot-serialise-sigmf-metadata = nie można zserializować metadanych SigMF: { $e }

engine-e-sigmf-invalid-sigmf-extension-namespace = nieprawidłowa przestrzeń nazw rozszerzenia SigMF { $ns }

engine-e-sigmf-annotation-extension-maps-for-annotations = mapy rozszerzeń adnotacji: { $annotations }; adnotacji: { $annotations2 }

engine-e-sigmf-extension-key-is-not-in = klucz rozszerzenia { $k } nie należy do przestrzeni nazw { $ns }

engine-e-sigmf-extension-key-is-already-present = klucz rozszerzenia { $k } już istnieje

engine-e-sigmf-global-is-not-an-object = global nie jest obiektem

engine-e-sigmf-annotations-is-not-an-array = annotations nie jest tablicą

engine-e-sigmf-annotation-is-not-an-object = annotation nie jest obiektem

engine-e-sigmf-invalid-sigmf-metadata-json = nieprawidłowy JSON metadanych SigMF: { $e }

engine-e-sigmf-the-sigmf-recording-states-no = nagranie SigMF nie podaje dodatniego core:sample_rate

engine-e-sigmf-sigmf-capture-starts-at-sample = przechwytywanie SigMF zaczyna się od próbki { $start }, poza próbkami w danych: { $data }

## src/skyline.rs

engine-e-skyline-skyline-must-be-in-90 = skyline: { $what } musi należeć do [0, 90) stopni, otrzymano { $el }

engine-e-skyline-skyline-must-be-finite-number = skyline: { $what } musi być liczbą skończoną, otrzymano { $v }

engine-e-skyline-skyline-canyon-needs-width = skyline: kanion wymaga width_m

engine-e-skyline-skyline-width-must-be-positive = skyline: width_m musi być dodatnie, otrzymano { $width_m }

engine-e-skyline-skyline-canyon-heights-and-antenna = skyline: wysokości kanionu i antenna_m muszą być nieujemne

engine-e-skyline-skyline-length-must-be-positive = skyline: length_m musi być dodatnie, otrzymano { $l }

engine-e-skyline-skyline-table-is-empty = skyline: tabela jest pusta

engine-e-skyline-skyline-table-has-rows-over = skyline: liczba wierszy tabeli: { $rows }, powyżej limitu { $MAX_TABLE_ROWS } wierszy

engine-e-skyline-skyline-table-azimuth-is-outside = skyline: azymut tabeli { $az } jest poza [0, 360)

engine-e-skyline-skyline-table-azimuths-must-be = skyline: azymuty tabeli muszą ściśle rosnąć ({ $az } następuje po { $prev })

engine-e-skyline-skyline-more-than-sectors = skyline: więcej niż { $MAX_SECTORS } sektorów

engine-e-skyline-skyline-the-sector-az-from = skyline: sektor az_from = { $az_from } do az_to = { $az_to } jest pusty (pełny okrąg to tabela lub maska)

engine-e-skyline-skyline-more-than-terrain-points = skyline: więcej niż { $MAX_TABLE_ROWS } punktów terenu

engine-e-skyline-skyline-terrain-distance-must-be = skyline: terrain distance_m musi być dodatnie, otrzymano { $distance_m }

engine-skyline-preset-overrides = preset:{ $p }+nadpisania

engine-skyline-with-fields-overridden-or-added = { $provenance }; z polami nadpisanymi lub dodanymi przez { $user }

engine-skyline-stated-input = Podane dane wejściowe: { $user }

engine-e-skyline-unknown-skyline-preset-known-presets = nieznany preset skyline „{ $name }”; znane presety: { $preset_names }

## src/slot_timing.rs

engine-e-slot-timing-datasheet-needs-at-least-two = karta katalogowa wymaga co najmniej dwóch punktów odchylenia Allana

engine-e-slot-timing-datasheet-point-must-have-positive = punkt karty katalogowej ({ $t }, { $s }) musi mieć dodatni czas uśredniania i dodatnie odchylenie Allana

engine-e-slot-timing-tau0-must-be-positive-number = tau0_s musi być dodatnią liczbą sekund

engine-e-slot-timing-phase-record-needs-at-least = zapis fazy wymaga co najmniej 32 próbek do dopasowania modelu szumu; otrzymano { $phase_s }

engine-e-slot-timing-the-phase-record-contains-non = zapis fazy zawiera nieskończoną próbkę

engine-e-slot-timing-the-phase-record-yields-fewer = zapis fazy daje mniej niż trzy punkty odchylenia Allana

engine-e-slot-timing-must-be-finite-and-non = { $name } musi być skończone i nieujemne; otrzymano { $v }

engine-e-slot-timing-the-slot-guard-must-be = odstęp ochronny szczeliny musi być czasem dodatnim

engine-e-slot-timing-sigma-must-be-positive = k_sigma musi być dodatnie

engine-e-slot-timing-residual-frequency-offset-must-be = residual_frequency_offset musi być skończone

engine-e-slot-timing-temperature-excursion-must-be-finite = temperature_excursion_k musi być skończone

engine-e-slot-timing-give-exactly-one-of-oscillator = podaj dokładnie jedno z: oscillator.class, oscillator.preset, oscillator.datasheet lub oscillator.record

engine-e-slot-timing-unknown-oscillator-class-csac-uso = nieznane oscillator.class '{ $id }' (csac|uso|dsac|tcxo|ocxo|rafs)

engine-e-slot-timing-unknown-oscillator-preset-ocxo-rubidium = nieznane oscillator.preset '{ $id }' (ocxo|rubidium|caesium|csac)

engine-slot-timing-class-default-sigma-from-red = domyślne dla klasy { $c }: sigma_y(1 s) z { $c2 }; poziom szumu czerwonego zsyntetyzowany o dwie i cztery dekady poniżej (założenie, nie pomiar)

engine-slot-timing-fitted-to-the-allan-deviation = dopasowano do maksimów odchylenia Allana z { $document }, przeskalowano tak, aby leżało na poziomie każdego punktu lub powyżej

engine-slot-timing-slot-timing-source-guard-ns = slot-timing ({ $n } źródło): odstęp ochronny { $c } ns przy k={ $k_sigma } przestaje wystarczać po { $fmt_s } od poprawki (pozostało { $fmt_s2 }); poprawka co najmniej co { $fmt_s3 } ({ $fixes_per_day } na dobę); dominujący składnik: { $b }{ $v9 }

## src/solar_system.rs

engine-e-solar-system-epoch-must-be-yyyy-mm = epoka '{ $s }' musi mieć postać YYYY-MM-DDTHH:MM:SS

engine-solar-system-epoch-bad = epoka '{ $s }': nieprawidłowe { $what } '{ $v }'

engine-e-solar-system-epoch-jd-tdb-must-be = epoch_jd_tdb musi być skończone

engine-e-solar-system-table-must-be-auto-table1 = table musi mieć wartość auto, table1 lub table2; otrzymano '{ $v }'

engine-solar-system-no-ephemeris-for-the-to = brak efemeryd dla łącza { $name } do { $name2 } przy JD { $jd_tdb } TDB

engine-e-solar-system-epoch-jd-tdb-is-outside = epoka JD { $jd } TDB jest poza zakresem 3000 BC do 3000 AD, czyli zakresem tablic Standisha

engine-e-solar-system-track-points-must-be-to = track_points musi mieścić się w zakresie od 8 do 2000; otrzymano { $n_track }

engine-e-solar-system-unknown-observer-body = nieznane ciało obserwatora '{ $observer_name }'

engine-e-solar-system-bodies-must-name-at-least = bodies musi wskazywać co najmniej jedno ciało

engine-e-solar-system-unknown-body = nieznane ciało '{ $n }'

engine-e-solar-system-no-position-for-at-jd = brak położenia dla { $name } przy JD { $jd } TDB (Pluton tylko od 1800 AD do 2050 AD)

engine-e-solar-system-no-standish-elements-for = brak elementów Standisha dla { $name }

engine-solar-system-jpl-spk-sha-256-heliocentric = JPL SPK { $k } (SHA-256 { $k2 }), stan heliocentryczny odczytany własnym czytnikiem silnika

engine-e-solar-system-unknown-link-body = nieznane ciało łącza '{ $from }'

engine-e-solar-system-unknown-link-body-2 = nieznane ciało łącza '{ $to }'

engine-e-solar-system-link-needs-two-different-bodies = łącze wymaga dwóch różnych ciał; otrzymano { $name }

engine-solar-system-light-time = czas światła { $one_way_light_time_s } s

engine-solar-system-au-lon-deg = { "  " }{ $name } { $heliocentric_distance_au } au  dł. { $ecliptic_longitude_deg } deg  { $lt }  [{ $label }]{ "\u000A" }

engine-solar-system-link-one-way-two-way = { "  " }łącze { $from } -> { $to }: w jedną stronę { $one_way_light_time_s } s, w obie strony { $two_way_light_time_s } s, Shapiro { $l } us, Słońce { $sun_separation_deg } deg{ "\u000A" }

engine-solar-system-epoch-positions-from-the-standish = epoka { $input } · { $standish_table } · położenia z elementów Standisha

## src/sp3.rs

engine-e-sp3-epoch-needs-time-fields-got = epoka wymaga 6 pól czasu, otrzymano { $tokens }

engine-e-sp3-bad-second = nieprawidłowa sekunda: { $tokens }

engine-e-sp3-record-needs-values-missing-column = rekord wymaga 4 wartości, brakuje kolumny { $v1 }

engine-e-sp3-bad-number = nieprawidłowa liczba: { $field }

engine-e-sp3-empty-sp3-input = puste dane wejściowe SP3

engine-e-sp3-first-line-is-not-an = pierwszy wiersz nie jest nagłówkiem SP3: { $first }

engine-e-sp3-unsupported-sp3-version-in = nieobsługiwana wersja SP3 w { $first }

engine-e-sp3-missing-epoch-count-on-header = brak liczby epok w wierszu nagłówka 1

engine-e-sp3-record-has-no-satellite-id = rekord nie ma identyfikatora satelity: { $line }

engine-e-sp3-position-record-before-any-epoch = rekord położenia przed jakimkolwiek nagłówkiem epoki

engine-e-sp3-sp3-file-contained-no-epoch = plik SP3 nie zawierał rekordów epok

engine-e-sp3-bad-accuracy-exponent-in = nieprawidłowy wykładnik dokładności { $f } w { $line }

engine-e-sp3-bad-header-accuracy = nieprawidłowa dokładność w nagłówku { $t }

engine-e-sp3-short-line = zbyt krótki wiersz %f { $line }

engine-e-sp3-bad-base-in = nieprawidłowa baza %f w { $line }

## src/space_packet.rs

engine-e-space-packet-version-exceeds-bits = wersja przekracza 3 bity

engine-e-space-packet-apid-exceeds-11-bits-2047 = APID przekracza 11 bitów (0..=2047)

engine-e-space-packet-sequence-count-exceeds-14-bits = sequence_count przekracza 14 bitów (0..=16383)

engine-e-space-packet-data-field-must-be-at = pole danych musi mieć co najmniej jeden oktet

engine-e-space-packet-data-field-exceeds-65536-octets = pole danych przekracza 65536 oktetów

engine-e-space-packet-packet-shorter-than-the-octet = pakiet krótszy niż 6-oktetowy nagłówek: bajtów { $bytes }

engine-e-space-packet-declared-data-length-header-octets = zadeklarowana długość danych { $data_len } (+6 nagłówka) = { $total } oktetów, ale bufor ma { $bytes }

engine-e-space-packet-cuc-coarse-octets-outside = oktety części grubej CUC { $coarse_octets } poza 1..=4

engine-e-space-packet-cuc-fine-octets-outside-the = oktety części drobnej CUC { $fine_octets } poza 0..=3 (rozszerzone P-field nie jest obsługiwane)

engine-e-space-packet-cuc-field-extended-field-not = CUC P-field { $p }: rozszerzone P-field nie jest obsługiwane

engine-e-space-packet-field-time-code-id-is = P-field { $p }: identyfikator kodu czasu { $id } nie jest CUC

engine-e-space-packet-field-is-not-cds-field = P-field { $p } nie jest P-field CDS

engine-e-space-packet-cds-field-reserved-sub-ms = CDS P-field { $p }: zarezerwowany kod podmilisekund 11

engine-e-space-packet-cuc-coarse-does-not-fit = CUC część gruba { $coarse } nie mieści się w { $c } oktetach

engine-e-space-packet-cds-days-do-not-fit = CDS dni { $days } nie mieszczą się w { $f } oktetach

engine-e-space-packet-cds-ms-of-day-above = CDS ms doby { $ms_of_day } powyżej 86 400 999

engine-e-space-packet-cds-sub-millisecond-above = CDS podmilisekundy { $submillis } powyżej { $max_sub }

engine-e-space-packet-time-code-format-and-value = format i wartość kodu czasu pochodzą z różnych kodów

engine-e-space-packet-time-code-no-field-octet = kod czasu: brak oktetu P-field

engine-e-space-packet-time-code-needs-octets-present = kod czasu wymaga oktetów: { $end }, obecnych: { $bytes }

engine-e-space-packet-time-code-format-differs-from = format kodu czasu różni się od niejawnego P-field

engine-e-space-packet-the-format-has-time-code = format ma pole kodu czasu; nie podano żadnego

engine-e-space-packet-the-format-has-no-time = format nie ma pola kodu czasu

engine-e-space-packet-ancillary-data-is-octets-the = dane pomocnicze mają oktetów: { $ancillary }; format podaje { $ancillary_octets }

engine-e-space-packet-secondary-header-must-hold-at = nagłówek wtórny musi zawierać co najmniej jeden oktet

engine-e-space-packet-secondary-header-needs-octets-present = nagłówek wtórny wymaga oktetów: { $end }, obecnych: { $bytes }

engine-e-space-packet-the-format-has-secondary-header = format ma nagłówek wtórny; nie podano żadnego

engine-e-space-packet-the-format-has-no-secondary = format nie ma nagłówka wtórnego

engine-e-space-packet-secondary-header-flag-disagrees-with = flaga nagłówka wtórnego { $v1 } nie zgadza się z formatem

engine-e-space-packet-data-field-shorter-than-the = pole danych krótsze niż PEC

## src/space_packet.rs

engine-e-space-packet-pec-does-not-match-the = PEC { $v1 } nie zgadza się z CRC { $crc16_ccitt_false } pakietu

engine-e-space-packet-nothing-to-segment-empty-user = brak danych do segmentacji: puste dane użytkownika

engine-e-space-packet-max-user-octets-must-be = max_user_octets musi wynosić co najmniej 1

engine-e-space-packet-first-count-exceeds-14-bits = first_count przekracza 14 bitów (0..=16383)

engine-space-packet-apid-where-was-expected = APID { $apid }, a oczekiwano { $a }

engine-space-packet-sequence-count-repeated = powtórzony licznik sekwencji { $sequence_count }

engine-space-packet-sequence-count-gap-after-packet = luka w liczniku sekwencji: { $sequence_count } po { $last } (brakujące pakiety: { $v2 })

engine-space-packet-sequence-count-out-of-order = licznik sekwencji poza kolejnością: { $sequence_count } po { $last }

engine-space-packet-packet-with-no-unit-open = pakiet { $f } bez otwartej jednostki

engine-space-packet-packet-while-unit-is-open = pakiet { $f } przy otwartej jednostce

engine-e-space-packet-packet = pakiet { $i }: { $e }

engine-e-space-packet-the-sequence-ends-with-unit = sekwencja kończy się nadal otwartą jednostką (brak ostatniego pakietu)

engine-e-space-packet-apid-must-be-in-2047 = apid musi należeć do 0..=2047

engine-e-space-packet-packet-count-must-be = packet_count musi być >= 1

engine-e-space-packet-data-len-must-be-in = data_len musi należeć do 1..=65536

engine-e-space-packet-internal-error-encode-decode-round = błąd wewnętrzny: niezgodność w obiegu kodowanie/dekodowanie

## src/space_weather.rs

engine-e-space-weather-f107-must-be-finite-and = f107 musi być skończone i dodatnie

engine-e-space-weather-f107a-must-be-finite-and = f107a musi być skończone i dodatnie

engine-e-space-weather-kp-must-be-in = kp musi należeć do [0, 9]

engine-e-space-weather-altitudes-km-must-be-non = altitudes_km nie może być puste

engine-e-space-weather-altitude-km-must-be-finite = wysokość { $h } km musi być skończona i dodatnia

engine-space-weather-space-weather-f10-f10-7a = space-weather: F10.7={ $f107 } F10.7a={ $f107a } Kp={ $kp } (ap={ $sw }) -> T_inf={ $t_inf } K; gęstość x{ $density_activity_factor } na { $value } km (MODELLED)

## src/spectrum.rs

engine-e-spectrum-jammer-needs-positive-bandwidth-mhz = { $name }: zagłuszacz { $what } wymaga dodatniego bandwidth_mhz

engine-e-spectrum-chirp-jammer-needs-positive-sweep = { $name }: zagłuszacz chirp wymaga dodatniego sweep_period_us

engine-e-spectrum-matched-to-names-unknown-band = { $name }: matched_to wskazuje nieznane pasmo { $target }

engine-e-spectrum-give-either-received-power-dbw = { $name }: podaj received_power_dbw albo eirp_dbw z dodatnim range_m (nie oba)

engine-e-spectrum-off-must-be-later-than = { $name }: off_s musi być późniejsze niż on_s

engine-e-spectrum-welch-the-sample-rate-must = welch: częstotliwość próbkowania musi być dodatnia

engine-e-spectrum-welch-nfft-must-be-power = welch: nfft = { $nfft } musi być potęgą dwójki, co najmniej 8

engine-e-spectrum-welch-samples-is-fewer-than = welch: liczba próbek { $x } jest mniejsza niż jeden segment o długości { $nfft } punktów

engine-e-spectrum-iq-must-be-power-of = iq: n = { $n } musi być potęgą dwójki, co najmniej 16

engine-e-spectrum-cannot-read-recording-meta-path = nie można odczytać meta_path nagrania { $meta_path }: { $e }

engine-e-spectrum-cannot-read-recording-data = nie można odczytać danych nagrania { $data_path }: { $e }

engine-e-spectrum-rx-bandwidth-mhz-must-be = { $name }: rx_bandwidth_mhz musi być dodatnie

engine-e-spectrum-modulation-is-not-selectable-only = { $n }: modulacja { $m } nie jest do wyboru (tylko galileo-e1 przyjmuje „mboc” lub „boc11”)

engine-e-spectrum-signal-is-not-in-the = { $name }: sygnał { $sig } nie należy do biblioteki presetów sygnałów ({ $v2 })

engine-e-spectrum-preset-signal-carries-its-own = { $name }: sygnał z presetu niesie własną modulację; usuń `modulation`

engine-e-spectrum-signal-publishes-no-received-power = { $name }: sygnał { $sig } nie publikuje mocy odbieranej; podaj signal_power_dbw

engine-e-spectrum-custom-band-needs-modulation-bpsk = { $name }: pasmo niestandardowe wymaga `modulation`, np. "BPSK(10)"

engine-e-spectrum-custom-band-needs-signal-power = { $name }: pasmo niestandardowe wymaga signal_power_dbw

engine-e-spectrum-give-either-signal-or-centre = { $name }: podaj `signal` albo `centre_mhz`, nie oba

engine-e-spectrum-give-rx-bandwidth-mhz-no = { $name }: podaj rx_bandwidth_mhz (nie udało się zlokalizować płata głównego)

engine-e-spectrum-duration-must-be-at-least = duration_s musi wynosić co najmniej jeden step_s

engine-e-spectrum-time-rows-is-more-than = wierszy czasu: { $rows }, więcej niż dozwolone 5000

engine-e-spectrum-at-most-extra-panels = najwyżej 8 dodatkowych paneli

engine-e-spectrum-panel-need-max-mhz-min = panel { $name }: wymagane f_max_mhz > f_min_mhz oraz 2 ≤ n_freq ≤ 4096

engine-e-spectrum-grid-need-max-mhz-min = grid: wymagane f_max_mhz > f_min_mhz oraz 2 ≤ n_freq ≤ 4096

engine-spectrum-scenario-spectrum-bands-jammers-noise = scenariusz spectrum | pasma: { $bands } | zagłuszacze: { $jammers } | poziom szumu { $n0_db } dBW/Hz | najgorsze pasmo { $name } min C/N0 { $c } dB-Hz{ $v6 }

engine-spectrum-scenario-spectrum-no-bands-noise = scenariusz spectrum | brak pasm | poziom szumu { $n0_db } dBW/Hz

engine-e-spectrum-iq-log2-samples-must-be = iq.log2_samples musi mieścić się między 10 a 20

engine-e-spectrum-iq-datatype-use-cf32-le = iq.datatype: użyj cf32_le lub ci16_le

engine-spectrum-frequency-across-time-down-colour = częstotliwość poziomo, czas w dół, kolor = widmowa gęstość mocy (dBW/Hz); poziom szumu { $n0_db } dBW/Hz

engine-spectrum-each-panel-its-own-frequency = każdy panel ma własny zakres częstotliwości, jedna oś czasu w dół, jedna skala kolorów (dBW/Hz); poziom szumu { $n0_db } dBW/Hz

## src/spk_writer.rs

engine-e-spk-writer-frame-has-no-supported-naif = układ odniesienia { $other } nie ma obsługiwanego kodu NAIF

engine-e-spk-writer-segment-name-longer-than-40 = nazwa segmentu dłuższa niż 40 znaków: { $name }

engine-e-spk-writer-segment-name-has-non-printing = nazwa segmentu zawiera znaki niedrukowalne: { $name }

engine-e-spk-writer-bad-target-for-centre = nieprawidłowy cel { $target } dla środka { $centre }

engine-e-spk-writer-degree-outside-27 = stopień { $degree } poza 1..=27

engine-e-spk-writer-type-13-degree-is-not = stopień typu 13 { $degree } nie jest nieparzysty

engine-e-spk-writer-descriptor-start-is-not-before = początek deskryptora nie poprzedza jego końca

engine-e-spk-writer-epochs-are-not-strictly-increasing = epoki nie rosną ściśle

engine-e-spk-writer-the-epochs-do-not-cover = epoki nie obejmują przedziału deskryptora

engine-e-spk-writer-type-or-13-segment-carries = segment typu 9 lub 13 niesie stany, a nie rekordy

engine-e-spk-writer-type-segment-needs-at-least = segment typu 3 wymaga co najmniej jednego rekordu

engine-e-spk-writer-type-degree-outside-27 = stopień typu 3 { $degree } poza 0..=27

engine-e-spk-writer-type-interval-length-is-not = długość przedziału typu 3 { $intlen } nie jest dodatnia

engine-e-spk-writer-type-record-has-coefficients-expected = rekord typu 3 { $i } ma współczynników: { $value }, oczekiwano { $ncof }

engine-e-spk-writer-descriptor-start-is-after-its = początek deskryptora następuje po jego końcu

engine-e-spk-writer-descriptor-starts-before-the-first = deskryptor zaczyna się przed pierwszym rekordem

engine-e-spk-writer-descriptor-ends-after-the-last = deskryptor kończy się po ostatnim rekordzie

engine-e-spk-writer-type-segment-carries-records-not = segment typu 3 niesie rekordy, a nie epoki ani stany

engine-e-spk-writer-type-21-segment-needs-at = segment typu 21 wymaga co najmniej jednego wiersza różnic

engine-e-spk-writer-difference-line-size-is-not = rozmiar wiersza różnic { $dlsize } nie jest równy 4 MAXDIM + 11 dla MAXDIM w 15..=25

engine-e-spk-writer-difference-lines-of-different-sizes = wiersze różnic o różnych rozmiarach

engine-e-spk-writer-difference-line-epochs-are-not = epoki wierszy różnic nie rosną ściśle

engine-e-spk-writer-the-last-difference-line-ends = ostatni wiersz różnic kończy się przed deskryptorem

engine-e-spk-writer-zero-step-size-in-difference = zerowy rozmiar kroku { $j } w wierszu różnic { $i }

engine-e-spk-writer-type-21-segment-carries-difference = segment typu 21 niesie wiersze różnic, a nie stany

engine-e-spk-writer-an-spk-needs-at-least = SPK wymaga co najmniej jednego segmentu

engine-e-spk-writer-segment = segment { $i }: { $e }

engine-e-spk-writer-comment-line-has-non-printing = wiersz komentarza zawiera znaki niedrukowalne: { $l }

engine-e-spk-writer-comments-need-characters-are-reserved = komentarze wymagają znaków: { $nchars }; zarezerwowano: { $v1 } (zwiększ ncomch)

engine-e-spk-writer-difference-line-orders-out-of = rzędy wiersza różnic { $kqmax1 } { $kq } poza zakresem

engine-e-spk-writer-zero-step-size-at-index = zerowy rozmiar kroku przy indeksie { $j }

engine-e-spk-writer-et-outside-the-segment = ET { $et } poza segmentem [{ $start }, { $end }]

engine-e-spk-writer-type-segment-too-short = segment typu 3 { $name } zbyt krótki

engine-e-spk-writer-type-segment-words-for-rsize = segment typu 3 { $name }: słów: { $nw } dla N = { $n }, RSIZE = { $rsize }

engine-e-spk-writer-type-21-segment-too-short = segment typu 21 { $name } zbyt krótki

engine-e-spk-writer-type-21-segment-words-for = segment typu 21 { $name }: słów: { $nw } dla N = { $n }, MAXDIM = { $maxdim }

engine-e-spk-writer-segment-too-short = segment { $name } zbyt krótki

engine-e-spk-writer-segment-words-for = segment { $name }: słów: { $nw } dla N = { $n }

engine-e-spk-writer-segment-is-in-frame = segment { $name } jest w układzie odniesienia { $frame }

engine-e-spk-writer-spk-centre-chain-does-not = łańcuch środków SPK nie kończy się

engine-e-spk-writer-no-spk-chain-connects-and = żaden łańcuch SPK nie łączy { $target } i { $observer } przy ET { $et }

engine-e-spk-writer-epoch-is-not-yyyy-mm = epoka { $s } nie ma postaci YYYY-MM-DDTHH:MM:SS

engine-e-spk-writer-time-system-not-supported-utc = system czasu { $other } nie jest obsługiwany (UTC lub TDB)

engine-e-spk-writer-centre-has-no-supported-naif = środek { $other } nie ma obsługiwanego identyfikatora NAIF

engine-e-spk-writer-oem-segment-has-no-data = segment OEM { $name } nie ma wierszy danych

engine-e-spk-writer-oem-segment-no = segment OEM { $idx }: brak { $k }

engine-e-spk-writer-no-export-settings-for-oem = brak ustawień eksportu dla segmentu OEM { $idx }

engine-e-spk-writer-oem-data-line-has-fields = wiersz danych OEM ma pól: { $f }: { $line }

engine-e-spk-writer-oem-value = wartość OEM { $f }: { $e }

engine-e-spk-writer-oem-segments-for-export-settings = segmentów OEM: { $out }, ustawień eksportu: { $exports }

## src/spoof_detect.rs

engine-spoof-detect-spoof-detected-fused-layers = SPOOF DETECTED (fused) — warstwy: { $fired }

engine-spoof-detect-single-layer-indication-below-the = wskazanie jednej warstwy ({ $fired }) poniżej progu łączonego — potrzebne potwierdzenie z innego źródła

## src/srp_boxwing.rs

engine-e-srp-boxwing-mass-kg-must-be-positive = mass_kg musi być dodatnie, otrzymano { $mass_kg }

engine-e-srp-boxwing-panel-area-must-be = panel { $i }: pole musi być >= 0

engine-e-srp-boxwing-panel-outside = panel { $i }: { $name } = { $c } poza [0, 1]

engine-e-srp-boxwing-panel-absorption-specular-diffuse = panel { $i }: pochłanianie + odbicie zwierciadlane + odbicie rozproszone = { $sum } != 1

engine-e-srp-boxwing-panel-zero-normal-axis = panel { $i }: zerowa normalna/oś

engine-e-srp-boxwing-ecom2-normal-matrix-is-singular = macierz normalna ECOM2 jest osobliwa lub źle uwarunkowana

## src/ssv/check.rs

engine-e-ssv-check-heo-preset = preset heo

engine-e-ssv-check-lunar-preset = preset lunar

## src/ssv/formation.rs

engine-e-ssv-formation-formation-needs-at-least-one = formacja wymaga co najmniej jednego satelity zależnego

engine-e-ssv-formation-duration-min-and-step-must = duration_min i step_s muszą być dodatnie

## src/ssv/nav.rs

engine-e-ssv-nav-no-signals-for-the-chosen = brak sygnałów dla wybranych konstelacji i pasm

## src/ssv/scenario.rs

engine-e-ssv-scenario-unknown-antenna = nieznana antena `{ $other }`

engine-e-ssv-scenario-pattern-csv-is-empty = plik CSV charakterystyki jest pusty

engine-e-ssv-scenario-is-not-number-in-the = `{ $s }` nie jest liczbą w pliku CSV charakterystyki

engine-e-ssv-scenario-pattern-csv-row-has-columns = wiersz CSV charakterystyki `{ $l }` ma kolumn: { $f }, oczekiwano { $azimuths }

engine-e-ssv-scenario-transmit-pattern-table-needs-exactly = transmit.pattern = "table" wymaga dokładnie jednego z pattern_csv i pattern_text

engine-e-ssv-scenario-transmit-pattern-is-not-booklet = transmit.pattern `{ $other }` nie jest wartością booklet, parametric ani table

engine-e-ssv-scenario-receiver-give-cn0-min-dbhz = receiver: podaj cn0_min_dbhz albo weak_signal, nie oba

engine-e-ssv-scenario-the-carrier-loop-cannot-hold = pętla nośnej nie utrzyma podanej szybkości zmiany Dopplera przy żadnym C/N0

engine-e-ssv-scenario-receiver-apply-is-not-acquisition = receiver.apply `{ $other }` nie jest wartością acquisition, tracking ani both

engine-e-ssv-scenario-receiver-cn0-min-dbhz-must = receiver.cn0_min_dbhz musi być skończone

engine-e-ssv-scenario-navigation-give-exactly-one-of = navigation: podaj dokładnie jedno z preset i orbit

engine-e-ssv-scenario-navigation-preset-is-not-leo = navigation.preset `{ $p }` nie jest wartością leo, meo, geo, heo ani lunar-transfer

engine-e-ssv-scenario-navigation-give-exactly-one-of-2 = navigation: podaj dokładnie jedno z duration_min i duration_periods

engine-e-ssv-scenario-navigation-must-be-positive = navigation.{ $name } musi być dodatnie

engine-e-ssv-scenario-formation-offsets-deg-needs-to = formation.offsets_deg wymaga od 1 do 8 skończonych przesunięć

engine-e-ssv-scenario-formation-rel-accel-psd-must = formation.rel_accel_psd nie może być ujemne

engine-e-ssv-scenario-give-exactly-one-of-shell = podaj dokładnie jedno z [shell], [trajectory] i [navigation]

engine-e-ssv-scenario-formation-needs-navigation-table-for = { "[" }formation] wymaga tabeli [navigation] dla satelity głównego

engine-e-ssv-scenario-constellations-include-and-constellations-bands = constellations.include i constellations.bands nie mogą być puste

engine-e-ssv-scenario-shell-altitude-km-must-be = shell.altitude_km musi być powyżej 100

engine-e-ssv-scenario-shell-grid-levels-above-is = shell.grid_levels powyżej 5 nie jest obsługiwane

engine-e-ssv-scenario-shell-antenna-must-be-hemisphere = shell.antenna musi mieć wartość hemisphere lub omni

engine-e-ssv-scenario-the-shell-sweep-supports-the = przemiatanie powłoki obsługuje wyłącznie charakterystykę nadawania booklet (charakterystyka kształtowana wymaga przemiatania trajektorii)

engine-e-ssv-scenario-atmosphere-applies-to-trajectory-not = { "[" }atmosphere] dotyczy [trajectory], a nie [shell]

engine-e-ssv-scenario-trajectory-give-exactly-one-of = trajectory: podaj dokładnie jedno z preset i orbit

engine-e-ssv-scenario-trajectory-preset-is-not-leo = trajectory.preset `{ $p }` nie jest wartością leo, meo, geo, heo ani lunar-transfer

engine-e-ssv-scenario-unknown-preset = nieznany preset

engine-ssv-scenario-gnss-ssv-shell-km = gnss-ssv powłoka { $altitude_km } km: { $parts }

engine-ssv-scenario-gnss-ssv-navigation-position-rms = gnss-ssv navigation: RMS położenia { $p } ogółem, { $p2 } wewnątrz orbit GNSS, { $p3 } powyżej; najdłuższa przerwa { $longest_gap_min } min

engine-ssv-scenario-deputy-at-deg-km-relative = satelita zależny przy { $offset_deg } deg ({ $baseline_km } km): RMS względny { $rel_rms_filter_m } m po filtracji wobec { $rel_rms_from_absolute_m } m z poprawek bezwzględnych

engine-ssv-scenario-combined-max-outage-min = { $band } łącznie 1+ { $at_least_1_pct }% 4+ { $at_least_4_pct }% (maks. przerwa { $max_outage_1_min } min)

engine-ssv-scenario-gnss-ssv-trajectory-to-km = gnss-ssv trajektoria od { $perigee_alt_km } do { $apogee_alt_km } km wysokości: { $parts }

## src/ssv/sweep.rs

engine-e-ssv-sweep-duration-min-and-step-min = duration_min i step_min muszą być dodatnie

## src/ssv/weak.rs

engine-e-ssv-weak-receiver-must-be-positive-number = receiver.{ $n } musi być liczbą dodatnią, otrzymano { $v }

## src/standards_pack.rs

engine-e-standards-pack-no-standards-pack-named-the = brak pakietu norm o nazwie `{ $id }`; dostępne pakiety: { $ids }

engine-e-standards-pack-pack-manifest = manifest pakietu: { $e }

engine-e-standards-pack-test-duplicate-id = test { $id }: zduplikowany identyfikator

engine-e-standards-pack-test-scenario-is-not-in = test { $id }: scenariusza `{ $s }` nie ma w pakiecie

engine-e-standards-pack-test-scored-test-needs-bar = test { $id }: test punktowany wymaga progu

engine-e-standards-pack-test-test-that-needs-input = test { $id }: test wymagający danych wejściowych nie ma progów

engine-e-standards-pack-test-give-either-scenario-or = test { $id }: podaj `scenario` albo `needs_input`, nie oba ani żadne

engine-e-standards-pack-test-supports-unknown-row = test { $id }: wspiera nieznany wiersz `{ $r }`

engine-e-standards-pack-test-unknown-op = test { $id }: nieznany operator `{ $op }`

engine-e-standards-pack-test-bar-on-needs-exactly = test { $id }: próg dla { $pointer } wymaga dokładnie jednego z `value` i `against`

engine-e-standards-pack-row-duplicate-id = wiersz { $id }: zduplikowany identyfikator

engine-e-standards-pack-row-asks-must-be-short = wiersz { $id }: `asks` musi być krótką parafrazą

engine-e-standards-pack-row-no-test-supports-it = wiersz { $id }: żaden test go nie wspiera

engine-standards-pack-not-scored-needs-input = nie punktowane: wymaga danych wejściowych ({ $n })

## src/study.rs

engine-e-study-study-has-no-scenarios-to = badanie nie ma scenariuszy do uruchomienia

engine-e-study-cannot-read-scenario = nie można odczytać scenariusza { $path }: { $e }

engine-e-study-scenario-failed = scenariusz { $path } zakończył się błędem: { $e }

engine-e-study-scenario-produced-unparseable-json = scenariusz { $path } wygenerował JSON, którego nie da się przetworzyć: { $e }

## src/suite.rs

engine-e-suite-invalid-suite-manifest = nieprawidłowy manifest zestawu: { $e }

## src/surface.rs

engine-e-surface-unknown-source-use-adsb-or = nieznane źródło `{ $o }`: użyj `adsb` lub `ais`

engine-e-surface-is-bytes-over-the-byte = { $what }: { $len } bajtów, powyżej limitu { $limit } bajtów

engine-e-surface-log-start-utc-is-not = log_start_utc `{ $log_start_utc }` nie jest czasem UTC w formacie ISO-8601

engine-e-surface-invalid-receiver-trust-session = nieprawidłowa sesja receiver-trust: { $e }

engine-e-surface-log-start-utc-is-not-2 = log_start_utc `{ $t }` nie jest czasem UTC w formacie ISO-8601

engine-e-surface-dataset-custom-needs-licence-licence = zbiór danych `custom` wymaga licence, licence_url i attribution

engine-e-surface-at-least-one-map-is = wymagana jest co najmniej jedna mapa

engine-e-surface-epoch = epoka: { $e }

engine-e-surface-not-utf = { $suffix }: nie jest UTF-8

engine-e-surface-unknown-scenario-kind-the-kind = nieznany rodzaj scenariusza `{ $k }`; lista rodzajów zawiera wszystkie rodzaje

engine-surface-is-not-bundled-it = `{ $name }` nie jest dołączony: { $why }

engine-surface-no-bundled-scenario-named-the = brak dołączonego scenariusza o nazwie `{ $name }`; lista przykładów wymienia te, które są ({ $v1 })

engine-e-surface-invalid-toml = nieprawidłowy TOML: { $e }

engine-e-surface-unknown-export-format-expected-one = nieznany format eksportu `{ $format }`; oczekiwano jednego z: czml, kml, geojson, stk lub sigmf

engine-e-surface-duration-fps-gives-frames-and = duration_s x fps daje klatek: { $opts }, a zwracanych jest najwyżej { $MAX_ANIMATION_FRAMES }; zmniejsz fps lub duration_s albo zapisz dłuższą sekwencję z wiersza poleceń

engine-e-surface-scenario-run-failed = uruchomienie scenariusza zakończyło się błędem: { $e }

engine-e-surface-runs-log-names-file-path = runs[{ $i }].log wskazuje plik `path`; podaj zapis jako `text` lub `base64` (ten interfejs nie odczytuje plików)

engine-e-surface-max-sp-errors-must-be = max_sp_errors może wynosić najwyżej 20

engine-e-surface-frames-must-be-to = frames musi mieścić się w zakresie od 1 do { $MAX_AFS_FRAMES }

engine-e-surface-toi0-must-be-to-99 = toi0 musi mieścić się w zakresie od 0 do 99

engine-e-surface-runs-given-at-most-per = podano uruchomień: { $runs }; najwyżej { $MAX_COMPLIANCE_RUNS } na raport

engine-e-surface-the-runs-total-bytes-the = uruchomienia razem zajmują { $total } bajtów; limit dla jednego raportu to { $max_bytes }

engine-e-surface-result-files-given-at-most = podano plików wyników: { $results }, najwyżej 256

engine-e-surface-result-is-not-json = wynik { $v1 } nie jest JSON: { $e }

engine-e-surface-unknown-format-use-prometheus-cef = nieznany format `{ $o }`: użyj `prometheus`, `cef`, `leef`, `otlp` lub `mqtt`

engine-e-surface-unknown-imu-format-use-csv = nieznany format IMU `{ $o }`: użyj `csv` lub `euroc`

engine-e-surface-unknown-axis-use-or = nieznana oś `{ $o }`: użyj `x`, `y` lub `z`

engine-e-surface-id-must-be-to-64 = id musi składać się z 1 do 64 drukowalnych znaków ASCII bez spacji

engine-surface-fitted-from-stationary-imu-log = dopasowano z nieruchomego zapisu IMU, sha256 { $sha }, oś { $axis }, estymator Allana

engine-e-surface-unknown-input-kind-use-result = nieznany input_kind `{ $o }`: użyj `result` lub `jsonl`

engine-e-surface-the-input-holds-no-trust = dane wejściowe nie zawierają epoki zaufania

engine-e-surface-the-reply-is-over-the = odpowiedź przekracza limit { $max_bytes } bajtów; wyślij mniej epok lub pozostaw wyłączone `syslog_all`

engine-e-surface-otlp-needs-build-with-the = otlp wymaga kompilacji z funkcją `otlp`

engine-e-surface-the-pack-and-token-total = pakiet i token razem zajmują { $total } bajtów; limit to { $max_bytes }

engine-e-surface-the-timestamp-token-is-empty = token znacznika czasu jest pusty

engine-e-surface-must-be-64-lower-case = { $what } musi składać się z 64 małych cyfr szesnastkowych

engine-e-surface-must-be-32-bytes = { $what } musi mieć 32 bajty

engine-surface-verified-against-the-public-key = VERIFIED względem podanego klucza publicznego (odcisk podpisującego { $fp }).

engine-surface-intact-but-the-signer-is = INTACT, BUT THE SIGNER IS NOT PINNED: skróty i podpis są spójne z kluczem { $fp }, który pakiet wskazuje sam. Aby ustalić, kto podpisał, podaj klucz publiczny podpisującego, uzyskany od niego inną drogą.

engine-e-surface-files-must-be-json-object = files musi być obiektem JSON: nazwa -> zawartość

engine-e-surface-pack-has-at-most-64 = pakiet ma najwyżej 64 pliki

engine-e-surface-file-name-must-be-plain = nazwa pliku `{ $k }` musi być zwykłą nazwą

engine-e-surface-base64-is-not-valid-standard = { $k }: `base64` nie jest prawidłowym standardowym base64

## src/sweep.rs

engine-e-sweep-unknown-sweep-parameter = nieznany parametr przemiatania: { $other }

engine-e-sweep-unknown-sweep-metric = nieznana metryka przemiatania: { $other }

engine-e-sweep-nd-sweep-needs-at-least = nd_sweep wymaga co najmniej jednej osi

engine-e-sweep-sweep-key-is-malformed = klucz przemiatania `{ $key }` jest nieprawidłowo zbudowany

engine-e-sweep-sweep-key-follows-an-array = klucz przemiatania `{ $key }`: `{ $part }` następuje po tablicy, więc musi być indeksem

engine-e-sweep-unreachable = nieosiągalne

engine-e-sweep-sweep-key-parent-is-not = klucz przemiatania `{ $key }`: element nadrzędny `{ $part }` nie jest tabelą

engine-e-sweep-sweep-key-no-field = klucz przemiatania `{ $key }`: brak pola `{ $part }`

engine-e-sweep-sweep-key-parent-of-is = klucz przemiatania `{ $key }`: element nadrzędny `{ $last }` nie jest tabelą

engine-e-sweep-sweep-key-no-field-2 = klucz przemiatania `{ $key }`: brak pola `{ $last }`

engine-e-sweep-metric-no-field-in-result = metryka `{ $path }`: brak pola `{ $part }` w wyniku

engine-e-sweep-metric-value-is-not-number = metryka `{ $path }`: wartość nie jest liczbą

engine-e-sweep-sweep-node-serialize = serializacja węzła przemiatania: { $e }

engine-e-sweep-sweep-node-result-parse = analiza wyniku węzła przemiatania: { $e }

engine-e-sweep-sweep-axis-declared-unit-but = oś przemiatania `{ $key }`: zadeklarowana jednostka `{ $d }`, ale przemiatany pakiet publikuje `{ $p }`

engine-e-sweep-sweep-worker-thread-panicked = wątek roboczy przemiatania uległ panice

engine-e-sweep-generic-sweep-needs-at-least = przemiatanie ogólne wymaga co najmniej jednej osi

engine-e-sweep-generic-sweep-needs-at-least-2 = przemiatanie ogólne wymaga co najmniej jednej metryki

engine-e-sweep-generic-sweep-base-must-carry = `base` przemiatania ogólnego musi zawierać własne `kind`

engine-e-sweep-generic-sweep-cannot-sweep-another = przemiatanie ogólne nie może przemiatać innego przemiatania

## src/telecom_timing.rs

engine-e-telecom-timing-unknown-oscillator-expected-one-of = nieznany oscylator { $oscillator }; oczekiwano jednego z: { $presets }

engine-e-telecom-timing-aging-per-day-and-temperature = aging_per_day i temperature_coeff_per_k muszą być skończone

engine-e-telecom-timing-sample-interval-must-be-finite = sample_interval_s musi być skończone i dodatnie

engine-e-telecom-timing-duration-must-be-finite-and = duration_s musi być skończone i obejmować co najmniej dwanaście próbek

engine-e-telecom-timing-gnss-loss-must-lie-in = gnss_loss_s musi należeć do [0, duration_s)

engine-e-telecom-timing-locked-te-sigma-ns-must = locked_te_sigma_ns musi być skończone i >= 0

engine-e-telecom-timing-temperature-and-frequency-offset-inputs = dane wejściowe temperatury i odchyłki częstotliwości muszą być skończone (okres > 0)

engine-e-telecom-timing-the-record-would-exceed-000 = zapis przekroczyłby 5 000 000 próbek; zwiększ sample_interval_s

engine-e-telecom-timing-time-error-series-needs-at = szereg błędu czasu wymaga co najmniej 13 próbek, otrzymano { $pairs }

engine-e-telecom-timing-every-time-and-time-error = każde time_s i time_error_ns musi być skończone

engine-e-telecom-timing-time-must-increase = time_s musi rosnąć

engine-e-telecom-timing-the-series-must-be-uniformly = szereg musi być próbkowany jednostajnie: krok { $v1 } wynosi { $d } s, pierwszy wynosi { $dt } s

engine-e-telecom-timing-csv-line-is-not-time = wiersz CSV { $v1 } nie ma postaci `time_s,time_error_ns`

## src/telecom_timing.rs

engine-telecom-timing-the-mask-is-defined-through = maska jest zdefiniowana przez filtr dolnoprzepustowy { $lit_0_1 } Hz, który ten silnik stosuje tylko przy odstępach próbkowania nie większych niż { $MAX_FILTER_DT_S } s; ten zapis jest próbkowany co { $dt_s } s

engine-e-telecom-timing-give-either-holdover-or-series = podaj [holdover] albo [series], nie oba

engine-e-telecom-timing-give-either-series-samples-or = podaj series.samples albo series.csv_path, nie oba

engine-e-telecom-timing-locked-duration-days-must-be = locked_duration_days musi być skończone i >= 0

engine-telecom-timing-telecom-timing-max-te-ns = telecom-timing: max|TE| { $max_abs } ns w ciągu { $v2 } s; { $masks } (MODELLED)

## src/telemetry/cli.rs

engine-e-telemetry-cli-unknown-format-cef-or-leef = nieznany --format `{ $f }` (cef lub leef)

engine-e-telemetry-cli-unknown-option = nieznana opcja `{ $x }`

engine-e-telemetry-cli-input-and-result-are-alternatives = --input i --result wykluczają się wzajemnie

engine-e-telemetry-cli-listen = --listen { $l }: { $e }

engine-e-telemetry-cli-listen-no-address = --listen { $l }: brak adresu

engine-telemetry-cli-warning-metrics-is-served-without = ostrzeżenie: /metrics jest udostępniane bez uwierzytelniania pod adresem { $addr }; powiąż z localhost lub umieść za własną kontrolą dostępu

engine-e-telemetry-cli-bind = bind { $addr }: { $e }

engine-telemetry-cli-serving-http-metrics = udostępnianie http://{ $bound }/metrics

engine-e-telemetry-cli-host = --host: { $e }

engine-e-telemetry-cli-syslog-udp-and-syslog-tcp = --syslog-udp i --syslog-tcp wykluczają się wzajemnie

engine-e-telemetry-cli-syslog-octet-counting-applies-to = --syslog-octet-counting dotyczy --syslog-tcp

engine-e-telemetry-cli-topic-part-must-be-non = { $name }: część tematu nie może być pusta, bez #, + ani początkowego /

engine-e-telemetry-cli-otlp-needs-build-with-features = --otlp wymaga kompilacji z `--features otlp`

engine-telemetry-cli-warning-input-line = ostrzeżenie: wiersz wejściowy { $line_no }: { $e }

engine-e-telemetry-cli-cannot-open = nie można otworzyć { $p }: { $e }

## src/telemetry/otlp.rs

engine-e-telemetry-otlp-endpoint-must-start-with-http = endpoint musi zaczynać się od http://

engine-e-telemetry-otlp-endpoint-has-no-host = endpoint nie ma hosta

engine-e-telemetry-otlp-resolve = rozwiązanie { $hostport }: { $e }

engine-telemetry-otlp-no-address-for = brak adresu dla { $hostport }

engine-telemetry-otlp-warning-otlp-export-failed = ostrzeżenie: eksport otlp nie powiódł się: { $e }

## src/telemetry/sample.rs

engine-e-telemetry-sample-not-json = nie JSON: { $e }

engine-e-telemetry-sample-not-json-object = nie jest obiektem JSON

engine-e-telemetry-sample-is-not-number = `{ $k }` nie jest liczbą

engine-e-telemetry-sample-is-not-finite = `{ $k }` nie jest skończone

engine-e-telemetry-sample-missing = brak `t_s`

engine-e-telemetry-sample-score-outside-100 = `score` { $s } poza 0..=100

engine-e-telemetry-sample-missing-state = brak `state`

engine-e-telemetry-sample-is-not-an-array = `{ $key }` nie jest tablicą

engine-e-telemetry-sample-entry-has-no-name = wpis `{ $key }` nie ma nazwy

engine-e-telemetry-sample-position-is-missing-or-not = `position.{ $k }` brakuje lub nie jest liczbą skończoną

engine-e-telemetry-sample-position-is-not-an-object = `position` nie jest obiektem ani null

engine-e-telemetry-sample-geometry-status-is-missing-or = `geometry.status` brakuje lub nie jest ciągiem znaków

engine-e-telemetry-sample-geometry-is-not-finite-number = `geometry.{ $k }` nie jest liczbą skończoną >= 0

engine-e-telemetry-sample-geometry-label-is-not-string = `geometry.label` nie jest ciągiem znaków

engine-e-telemetry-sample-geometry-signal-loss-is-not = `geometry.signal_loss` nie jest wartością logiczną

engine-e-telemetry-sample-geometry-is-not-an-object = `geometry` nie jest obiektem ani null

engine-e-telemetry-sample-result-has-no-epochs = wynik nie ma `epochs`

engine-e-telemetry-sample-bad-epochs = nieprawidłowe `epochs`: { $e }

## src/telemetry/syslog.rs

engine-e-telemetry-syslog-host-is-bytes-syslog-host = host ma { $host } bajtów; nazwa hosta syslog ma najwyżej 255

engine-e-telemetry-syslog-host-must-be-printable-ascii = host musi składać się z drukowalnych znaków ASCII bez spacji

## src/test_support.rs

engine-test-support-vs-not-representable-as-f64 = { "  " }{ $path }: { $g } wobec { $w } (nie do przedstawienia jako f64)

engine-test-support-present-expected-absent = { "  " }{ $path }.{ $k }: obecne, oczekiwano braku

engine-test-support-absent-expected-present = { "  " }{ $path }.{ $k }: brak, oczekiwano obecności

## src/time_transfer_budget.rs

engine-e-time-transfer-budget-must-be-finite = { $name }: { $n } musi być skończone

engine-e-time-transfer-budget-slant-tec-tecu-must-be = { $name }: slant_tec_tecu musi być skończone i nieujemne

engine-e-time-transfer-budget-line-not-mjd-ns = { $p }: wiersz { $v1 }: nie MJD,ns

engine-e-time-transfer-budget-no-ar-records-for = { $p }: brak rekordów AR dla { $code }

engine-e-time-transfer-budget-unknown-series-format-circular-mjd = nieznany format szeregu { $f } (circular-t, mjd-csv, rinex-clock)

engine-e-time-transfer-budget-must-be-finite-2 = { $n } musi być skończone

engine-e-time-transfer-budget-span-days-step-must-give = span_days / step_s musi dawać od 16 do 20000 pomiarów

engine-time-transfer-budget-time-transfer-budget-offset-ns = time-transfer-budget: { $name } - { $name2 } odchyłka { $ns } ns (Sagnac { $ns2 } ns, jonosfera { $ns3 } ns); złożona u { $ns4 } ns (typ A { $ns5 } ns przy { $averaging_s } s); rzeczywisty szereg: { $series } (MODELLED)

## src/tle.rs

engine-e-tle-non-ascii-characters-in-tle = znaki spoza ASCII w TLE { $label }: { $line }

engine-e-tle-tle-truncated-reading-columns = TLE obcięte przy odczycie { $what } (kolumny { $v1 }..{ $z })

engine-e-tle-tle-too-short-for-column = TLE { $label } zbyt krótkie na sumę kontrolną w kolumnie 69

engine-e-tle-tle-has-no-checksum-digit = TLE { $label } nie ma cyfry sumy kontrolnej w kolumnie 69

engine-e-tle-tle-checksum-mismatch-column-69 = niezgodność sumy kontrolnej TLE { $label }: kolumna 69 podaje { $want }, obliczono { $got }

engine-e-tle-not-tle-line = to nie jest wiersz 1 TLE: { $line1 }

engine-e-tle-not-tle-line-2 = to nie jest wiersz 2 TLE: { $line2 }

engine-e-tle-invalid-in-tle = nieprawidłowe { $what } w TLE: { $s }

engine-e-tle-invalid-epoch-year-in-tle = nieprawidłowy rok epoki w TLE: { $col }

engine-e-tle-invalid-catalogue-number-in-tle = nieprawidłowy numer katalogowy w TLE: { $col }

engine-e-tle-inclination-out-of-range-180 = nachylenie poza zakresem [0, 180] deg: { $inclination_deg }

engine-e-tle-eccentricity-out-of-range = mimośród poza zakresem [0, 1): { $eccentricity }

engine-e-tle-non-positive-mean-motion = niedodatni ruch średni: { $mean_motion_rev_day }

engine-e-tle-invalid-mantissa-in-tle = nieprawidłowa mantysa { $what } w TLE: { $mant }

engine-e-tle-invalid-exponent-in-tle = nieprawidłowy wykładnik { $what } w TLE: { $exp }

engine-tle-satellite-line-only-element-set = satelita { $satnum }: zestaw elementów zawierający tylko wiersz 2 został zinterpretowany jako analityczne elementy keplerowskie (dwóch ciał) — brakuje oporu z wiersza 1 (B*) i wyrazów wiekowych SGP4, więc ta orbita oddala się od prawdziwego dopasowania SGP4 w miarę oddalania od epoki; podaj odpowiadający wiersz 1, aby uzyskać dokładność SGP4

## src/tracking_loop.rs

engine-e-tracking-loop-tracking-loop-the-n0-profile = tracking-loop: profil C/N0 wymaga dodatniej epoki i czasu trwania

engine-e-tracking-loop-tracking-loop-the-n0-profile-2 = tracking-loop: profil C/N0 wymagałby więcej niż { $MAX_DETECTOR_STEPS } kroków detektora ({ $total } s przy { $epoch_s } s na epokę); skróć ramp_duration_s lub wydłuż predetection_integration_s

engine-e-tracking-loop-tracking-loop-must-be-finite = tracking-loop: { $name } musi być skończone

engine-e-tracking-loop-tracking-loop-must-be-positive = tracking-loop: { $name } musi być dodatnie (otrzymano { $v })

engine-e-tracking-loop-tracking-loop-correlator-spacing-chips = tracking-loop: correlator_spacing_chips musi być poniżej { $lit_1_9 } chip (otrzymano { $correlator_spacing_chips })

engine-e-tracking-loop-tracking-loop-pullin-bandwidth-ratio = tracking-loop: pullin_bandwidth_ratio musi wynosić co najmniej 1 (otrzymano { $pullin_bandwidth_ratio }) — pętla, która ponownie wchodzi w zakres z WĘŻSZYM pasmem niż to, z którym śledzi, odwróciłaby histerezę

engine-e-tracking-loop-tracking-loop-ramp-duration-must = tracking-loop: ramp_duration_s nie może być ujemne

engine-e-tracking-loop-tracking-loop-cn0-low-dbhz = tracking-loop: cn0_low_dbhz ({ $cn0_low_dbhz }) nie może przekraczać cn0_high_dbhz ({ $cn0_high_dbhz })

engine-e-tracking-loop-tracking-loop-must-not-be = tracking-loop: { $name } nie może być puste

engine-e-tracking-loop-tracking-loop-has-entries-the = tracking-loop: { $name } ma wpisów: { $axis }; limit to { $MAX_AXIS_LEN }

engine-e-tracking-loop-tracking-loop-holds-non-finite = tracking-loop: { $name } zawiera wartość nieskończoną

engine-e-tracking-loop-tracking-loop-the-confirmation-dwells = tracking-loop: czasy potwierdzenia muszą wynosić co najmniej 1 epokę

## src/twstft_budget.rs

engine-e-twstft-budget-at-least-eight-samples-are = potrzeba co najmniej ośmiu próbek

engine-e-twstft-budget-samples-must-increase-in-time = próbki muszą rosnąć w czasie

engine-e-twstft-budget-samples-must-be-on-regular = próbki muszą leżeć na regularnej siatce

## src/verification.rs

engine-verification-rows-externally-validated-modelled-partner = { "\u000A" }wierszy: { $total }: zewnętrznie zwalidowanych: { $validated }, modelowanych: { $modelled }, należących do partnera: { $partner_owned }.{ "\u000A" }

engine-verification-the-complete-machine-checked-evidence = Kompletny, sprawdzany maszynowo rejestr dowodów: **wierszy: { $total } — { $validated } VALIDATED, { $modelled } MODELLED, { $partner_owned } PARTNER**. Wiersz może mieć status VALIDATED tylko przy niezależnej zewnętrznej wyroczni (wymuszają to testy niezmienników macierzy). Te same dane, z klikalnymi odnośnikami dla każdego wiersza do testu, modułu i zatwierdzonego fixture, to *Rejestr walidacji* na https://kshana.dev. Zobacz [MODELLED-RATIONALE.md](MODELLED-RATIONALE.md), dlaczego każdy wiersz modelowany nie jest zwalidowany zewnętrznie.{ "\u000A\u000A" }

engine-verification-capabilities-labelled-modelled = { "\u000A" }możliwości oznaczonych jako MODELLED: { $modelled }.{ "\u000A" }

## src/wasm.rs

engine-wasm-files-json-is-not-json = files_json nie jest JSON: { $e }

engine-wasm-runs-json-is-not-json = runs_json nie jest JSON: { $e }

engine-wasm-runs-needs-label = runs[{ $i }] wymaga `label`

engine-wasm-runs-needs-result = runs[{ $i }] wymaga `result`

engine-wasm-results-json-is-not-json = results_json nie jest tablicą JSON ciągów znaków: { $e }

engine-wasm-maps-json-must-be-json = maps_json musi być tablicą JSON ciągów znaków: { $e }

engine-wasm-plans-json-is-not-json = plans_json nie jest tablicą JSON ciągów znaków: { $e }

engine-wasm-options-json-is-not-json = options_json nie jest JSON: { $e }

engine-wasm-input-is-about-bytes-over = dane wejściowe mają około { $b64 } bajtów, powyżej limitu { $v2 } bajtów

## src/altpnt/sequential.rs

engine-altpnt-sequential-title = Sekwencyjna nawigacja z odniesieniem do terenu (rekurencyjny SITAN)

engine-altpnt-sequential-free-inertial-drift-grows = dryf swobodnej nawigacji inercyjnej (rośnie)

engine-altpnt-sequential-terrain-matched-bounded = dopasowanie do terenu (ograniczony)

engine-altpnt-sequential-waypoint-full-scale = punkt trasy →    pełna skala { $maxv } m

## src/advanced_report.rs

engine-advanced-report-eyebrow = Raport z przebiegu Kshana

engine-advanced-report-meta = Rodzaj <code>{ $kind }</code> · silnik { $engine } · scenariusz <code>{ $scenario }</code> (skrót pliku { $digest }…)

engine-advanced-report-toc-summary = 1 Podsumowanie

engine-advanced-report-toc-inputs = 2 Dane wejściowe

engine-advanced-report-toc-results = 3 Wyniki

engine-advanced-report-toc-aggregation = 3a Agregacja

engine-advanced-report-toc-companions = 3b Animacja i eksporty

engine-advanced-report-toc-events = 4 Zdarzenia

engine-advanced-report-toc-labels = 5 Etykiety weryfikacji

engine-advanced-report-toc-not-modelled = 6 Niemodelowane

engine-advanced-report-toc-reproducibility = 7 Odtwarzalność

engine-advanced-report-h-summary = 1. Podsumowanie dla kierownictwa

engine-advanced-report-honesty-label = <strong>Etykieta rzetelności</strong> ({ $source }): { $label }

engine-advanced-report-capabilities-used = <strong>Użyte możliwości:</strong> { $n_validated } VALIDATED, { $n_modelled } MODELLED, { $n_partner } PARTNER (wykorzystane, niedostarczane); zob. sekcję 5.

engine-advanced-report-member-runs = <strong>Przebiegi składowe:</strong> { $n }, zagregowane w sekcji 3a.

engine-advanced-report-h-inputs = 2. Dane wejściowe

engine-advanced-report-inputs-note = Każde pole ustawione przez plik scenariusza, spłaszczone do swojej ścieżki. Jednostki pochodzą z bloku <code>units</code> wyniku (schemat jednostek pól, docs/field-units-schema.json), o ile opisuje on dane pole, w przeciwnym razie z przyrostka nazwy pola; jednostka, której nie podaje żadne z nich, jest pokazana jako niepodana.

engine-advanced-report-th-parameter = Parametr

engine-advanced-report-th-value = Wartość

engine-advanced-report-th-unit = Jednostka

engine-advanced-report-th-unit-source = Źródło jednostki

engine-advanced-report-h-results = 3. Wyniki

engine-advanced-report-chart-alt = Wykres wyników

engine-advanced-report-also-written-to = { " " }(zapisano także w { $file })

engine-advanced-report-h-scalars = Wyniki skalarne

engine-advanced-report-h-columns = Kolumny liczbowe

engine-advanced-report-th-result = Wynik

engine-advanced-report-th-column = Kolumna

engine-advanced-report-th-count = Liczba

engine-advanced-report-th-min = Min

engine-advanced-report-th-max = Maks

engine-advanced-report-th-first = Pierwsza

engine-advanced-report-th-last = Ostatnia

engine-advanced-report-omitted-inputs = <p class="note">Dalsze dane wejściowe w liczbie { $n } pominięto na tej stronie; report.json zawiera te same wiersze, a dokument wyniku zawiera każdą wartość.</p>{ "\u000A" }

engine-advanced-report-omitted-scalars = <p class="note">Dalsze wyniki skalarne w liczbie { $n } pominięto na tej stronie; report.json zawiera te same wiersze, a dokument wyniku zawiera każdą wartość.</p>{ "\u000A" }

engine-advanced-report-omitted-columns = <p class="note">Dalsze kolumny liczbowe w liczbie { $n } pominięto na tej stronie; report.json zawiera te same wiersze, a dokument wyniku zawiera każdą wartość.</p>{ "\u000A" }

engine-advanced-report-omitted-events = <p class="note">Dalsze zdarzenia w liczbie { $n } pominięto na tej stronie; report.json zawiera te same wiersze, a dokument wyniku zawiera każdą wartość.</p>{ "\u000A" }

engine-advanced-report-h-aggregation = 3a. Agregacja przebiegów składowych

engine-advanced-report-mode = <p>Tryb <strong>{ $mode }</strong>.</p>{ "\u000A" }

engine-advanced-report-mode-kind = <p>Tryb <strong>{ $mode }</strong> dla rodzaju <code>{ $kind }</code>.</p>{ "\u000A" }

engine-advanced-report-mode-runs = <p>Tryb <strong>{ $mode }</strong>, przebiegi składowe: { $n_runs }.</p>{ "\u000A" }

engine-advanced-report-mode-kind-runs = <p>Tryb <strong>{ $mode }</strong> dla rodzaju <code>{ $kind }</code>, przebiegi składowe: { $n_runs }.</p>{ "\u000A" }

engine-advanced-report-run-digest = Skrót przebiegu (SHA-256 ze skrótów wyników składowych, w kolejności wysyłania): <code>{ $digest }</code>

engine-advanced-report-table-empty = Ta tabela nie ma wierszy: wynik żadnych nie podaje.

engine-advanced-report-distribution-caption = Rozkład Monte Carlo wielkości { $metric } (próbki: { $n }), 20 przedziałów o równej szerokości; linie przerywane oznaczają 5., 50. i 95. percentyl.

engine-advanced-report-distribution-caption-unit = Rozkład Monte Carlo wielkości { $metric } (próbki: { $n }, { $unit }), 20 przedziałów o równej szerokości; linie przerywane oznaczają 5., 50. i 95. percentyl.

engine-advanced-report-h-companions = 3b. Animacja i eksporty

engine-advanced-report-animation-alt = Animacja szeregu czasowego przebiegu

engine-advanced-report-animation-caption = Własne próbki przebiegu rysowane za przesuwającym się kursorem czasu (animowany rysunek z <code>--animate svg</code>; przy ograniczonym ruchu i w druku pokazuje gotowy obraz).

engine-advanced-report-no-animation = Brak animacji: { $reason }

engine-advanced-report-no-animation-default = wynik nie zawiera szeregu czasowego

engine-advanced-report-player-written-by = Interaktywny odtwarzacz zapisuje <code>{ $command }</code>.

engine-advanced-report-written-beside = Zapisano obok tego raportu: { $links }.

engine-advanced-report-th-export = Eksport

engine-advanced-report-th-applies = Dotyczy

engine-advanced-report-th-files-or-reason = Pliki lub powód

engine-advanced-report-written-by = zapisuje <code>{ $command }</code>

engine-advanced-report-does-not-apply = nie dotyczy

engine-advanced-report-yes = tak

engine-advanced-report-no = nie

engine-advanced-report-h-events = 4. Oś czasu zdarzeń

engine-advanced-report-events-caption = Okna jako słupki, zdarzenia punktowe jako kropki, na własnej osi czasu przebiegu.

engine-advanced-report-th-start = Początek (s)

engine-advanced-report-th-end = Koniec (s)

engine-advanced-report-th-event = Zdarzenie

engine-advanced-report-th-source = Źródło

engine-advanced-report-point-event = zdarzenie punktowe

engine-advanced-report-events-timeline = Oś czasu zdarzeń

engine-advanced-report-point-events = zdarzenia punktowe ({ $n })

engine-advanced-report-distribution-of = Rozkład wielkości { $metric }

engine-advanced-report-max-bin = maks. przedział { $n }

engine-advanced-report-h-labels = 5. Etykiety weryfikacji

engine-advanced-report-th-capability = Możliwość (wymaganie macierzy)

engine-advanced-report-th-label = Etykieta

engine-advanced-report-th-used-by = Używane przez

engine-advanced-report-th-oracle = Źródło: wyrocznia

engine-advanced-report-th-test-evidence = Dowody z testów

engine-advanced-report-h-figure-tiers = Poziomy dla poszczególnych wielkości podane w wyniku

engine-advanced-report-th-figure = Wielkość

engine-advanced-report-th-tier = Poziom

engine-advanced-report-th-matrix-requirement = Wymaganie macierzy

engine-advanced-report-th-applicable = Stosowalne

engine-advanced-report-no-attack = nie (nie skonfigurowano ataku)

engine-advanced-report-h-not-modelled = 6. Niemodelowane oraz założenia

engine-advanced-report-not-modelled-note = Każda pozycja jest cytowana z miejsca, w którym została podana: dokumentu wyniku, katalogu rodzajów, pliku scenariusza lub uzasadnienia macierzy weryfikacji, dla którego wiersz MODELLED pozostaje modelowany.

engine-advanced-report-th-statement = Stwierdzenie

engine-advanced-report-h-reproducibility = 7. Zapis odtwarzalności

engine-advanced-report-rk-command = Polecenie do odtworzenia

engine-advanced-report-rk-working-directory = Katalog roboczy

engine-advanced-report-rk-engine-version = Wersja silnika

engine-advanced-report-rk-source-commit = Commit źródłowy

engine-advanced-report-rk-scenario-file = Plik scenariusza

engine-advanced-report-rk-scenario-sha = SHA-256 pliku scenariusza (Secure Hash Algorithm 256-bit)

engine-advanced-report-rk-result-hash = scenario_hash wyniku

engine-advanced-report-rk-result-sha = SHA-256 dokumentu wyniku

engine-advanced-report-rk-seed = Ziarno (seed)

engine-advanced-report-rk-platform = Platforma

engine-advanced-report-rk-generated = Badanie wygenerowano (UTC)

engine-advanced-report-rk-determinism = Determinizm

engine-advanced-report-result-hash-none = dokument wyniku nie podaje żadnego

engine-advanced-report-print-note = Aby wydrukować tę stronę do pliku Portable Document Format (PDF), użyj okna drukowania przeglądarki i wybierz „Zapisz jako PDF”; arkusz stylów druku dopasowuje się do papieru A4 i US Letter, powtarza nagłówki tabel na kolejnych stronach i zaczyna sekcje danych wejściowych, wyników, etykiet i odtwarzalności od nowej strony. Silnik sam nie zapisuje żadnego PDF. report.json zawiera tę samą treść co ta strona.

engine-advanced-report-footer = Wygenerowano przez Kshana { $engine }.{ $stamp } Odtwarzalne na podstawie scenariusza, ziarna (seed) i wersji silnika. Darmowe i otwarte oprogramowanie (GNU Affero General Public License, AGPL-3.0) — <a href="https://github.com/AshfordeOU/kshana">źródła i dokumentacja</a>.

engine-advanced-report-empty-inputs = Scenariusz nie ustawia żadnego pola poza `kind`: dany rodzaj uruchomił konfigurację referencyjną z udokumentowanych wartości domyślnych.

engine-advanced-report-empty-scalars = Dokument wyniku nie zawiera żadnego skalara poza swoimi tablicami; jego liczby są podsumowane niżej według kolumn.

engine-advanced-report-empty-series = Dokument wyniku nie zawiera żadnej tablicy liczbowej: każdy wynik jest skalarem w tabeli powyżej.

engine-advanced-report-empty-events = Brak zdarzeń w czasie: scenariusz nie wyznacza żadnego okna ani czasu początku, a wynik nie zgłasza zdarzeń. Dany rodzaj ocenia swoją konfigurację jako jeden przypadek.

engine-advanced-report-empty-not-modelled = Nic w wyniku, katalogu rodzajów, scenariuszu ani w użytych wierszach macierzy nie podaje ograniczenia modelowania dla tego przebiegu.

engine-advanced-report-capabilities-statement = Każdy wiersz to wiersz macierzy weryfikacji, który ćwiczą rodzaje tego przebiegu, z etykietą i wyrocznią przypisanymi mu przez macierz (src/verification.rs, docs/VERIFICATION-MATRIX.md). Etykieta ocenia możliwość tak, jak zapisuje ją macierz; nie ocenia konfiguracji tego scenariusza, a wiersz VALIDATED nie sprawia, że dane wejściowe przebiegu stają się zmierzone. Wiersz PARTNER to dyscyplina, na której przebieg polega, a której Kshana nie dostarcza.

engine-advanced-report-no-run-label = Wynik nie zawiera etykiety rzetelności na poziomie przebiegu; etykiety weryfikacji użytych możliwości są wymienione w osobnej sekcji, a poziomy dla poszczególnych wielkości tam, gdzie wynik je podaje.

engine-advanced-report-no-seed = Ani scenariusz, ani wynik nie zawiera ziarna (seed). Wynik jest wyznaczony wyłącznie przez plik scenariusza i build silnika; test determinizmu ponownie uruchamia każdy dołączony scenariusz i wymaga identycznych co do bajta danych wyjściowych.

engine-advanced-report-working-directory = Uruchom polecenie z katalogu, w którym uruchomiono pierwotny przebieg: ścieżka scenariusza i każda względna ścieżka danych wewnątrz scenariusza są rozwiązywane względem niego. Najpierw sprawdź plik scenariusza względem scenario_sha256.

engine-advanced-report-determinism-stamped = Te same bajty scenariusza, to samo ziarno (seed) i ten sam build silnika dają ten sam dokument wyniku, z wyjątkiem jego znacznika meta.generated_utc, który --study-name zapisuje z zegara; uruchom bez --study-name, aby uzyskać identyczne co do bajta dane wyjściowe. Wyniki zmiennoprzecinkowe są ustalone dla platformy; inny system operacyjny lub architektura mogą się różnić na ostatnich cyfrach.

engine-advanced-report-determinism-plain = Te same bajty scenariusza, to samo ziarno (seed) i ten sam build silnika dają identyczny co do bajta dokument wyniku i raport; ten raport nie zawiera znacznika czasu. Wyniki zmiennoprzecinkowe są ustalone dla platformy; inny system operacyjny lub architektura mogą się różnić na ostatnich cyfrach.

engine-advanced-report-not-applicable-no-attack = nie dotyczy (nie skonfigurowano ataku)

engine-advanced-report-what-ran-default = Scenariusz `{ $kind }`.

engine-advanced-report-nothing-carried = nic nie zawarto

engine-advanced-report-tbl-sweep-nodes = Węzły przeglądu

engine-advanced-report-tbl-mc-summary = Podsumowanie rozkładu Monte Carlo (percentyle według najbliższej rangi; 95% przedział ufności średniej to percentylowy bootstrap ze stałym ziarnem)

engine-advanced-report-tbl-chain-phases = Fazy łańcucha

engine-advanced-report-tbl-shared = Warunki wspólne

engine-advanced-report-tbl-members = Składowe

engine-advanced-report-tbl-combined = Łącznie dla składowych

engine-advanced-report-tbl-optimiser-best = Najlepszy wynik optymalizatora (optimum lokalne w podanych granicach)

engine-advanced-report-tbl-optimiser-trace = Ślad optymalizatora

engine-advanced-report-tbl-sweep-grid = Siatka przeglądu

## src/altpnt/terrain.rs

engine-altpnt-terrain-title-terrain-referenced = Nawigacja z odniesieniem do terenu (TERCOM/SITAN)

engine-altpnt-terrain-title-gravity-map = Nawigacja z dopasowaniem do mapy grawitacyjnej

engine-altpnt-terrain-title-combined = Łączone alt-PNT: grawitacja + pole magnetyczne + teren

engine-altpnt-terrain-free-inertial-drift = dryf swobodnej nawigacji inercyjnej

engine-altpnt-terrain-terrain-matched = dopasowanie do terenu

engine-altpnt-terrain-gravity-matched = dopasowanie do grawitacji

engine-altpnt-terrain-gravity-only = tylko grawitacja

engine-altpnt-terrain-magnetic-only = tylko pole magnetyczne

engine-altpnt-terrain-terrain-only = tylko teren

engine-altpnt-terrain-combined-fused = łączone (fuzja)

## src/api.rs

engine-api-chart-provenance-footer = Kshana v{ $version } · scenariusz { $hash } · kshana.dev

## src/attack_surface.rs

engine-attack-surface-chart-title = Powierzchnia ataku na bezpieczeństwo sygnału księżycowego (P1)

## src/body_pnt.rs

engine-body-pnt-chart-relays-in-view = przekaźniki w widoku

engine-body-pnt-chart-count = liczba

engine-body-pnt-chart-formal-one-sigma-position = formalna jedna sigma położenia (log10 m): niebieski tylko konstelacja, bursztynowy z zasięgiem do Ziemi

engine-body-pnt-chart-time-since-epoch = czas od epoki, 0 do { $t_max } s

## src/campaign.rs

engine-campaign-chart-clock-time-error-vs-guard = błąd czasu zegara a margines ochronny (ns)

engine-campaign-chart-cn0-vs-tracking-floor = C/N0 a próg śledzenia (dB-Hz)

engine-campaign-chart-protection-level-vs-alert-limit = poziom ochrony a limit alarmowy (m)

engine-campaign-chart-position-error-vs-threshold = błąd położenia a próg (m)

engine-campaign-chart-satellites-tracking = śledzone satelity

engine-campaign-chart-alarm-flags-and-events = flagi alarmowe i zdarzenia

engine-campaign-chart-mission-time = czas misji { $duration } s

engine-campaign-chart-sweep-line-at = { $name } ({ $unit }) przy { $lead }

engine-campaign-chart-monte-carlo-of = Monte Carlo dla `{ $scenario_kind }`: ziarna (seed): { $n_runs }, od { $base_seed } (5., 50., 95. percentyl; słupek = bootstrapowy 95% przedział ufności średniej)

engine-campaign-chart-composed-members = składowe złożone we wspólnych warunkach: { $shared }

engine-campaign-chart-not-available = b/d

## src/cislunar_arc_recovery.rs

engine-cislunar-arc-recovery-chart-title = Odzyskiwanie długości łuku cislunarnego — estymator niedzielący jakobianów

engine-cislunar-arc-recovery-chart-subtitle = wsadowa metoda najmniejszych kwadratów z różnicami skończonymi · zmierzony błąd odzyskiwania stanu · bez analitycznego jakobianu, bez wariacyjnej STM, bez tolerancji rzędu SVD

engine-cislunar-arc-recovery-chart-bound = granica { $bound }

engine-cislunar-arc-recovery-chart-gramian-rank-threshold = próg rzędu gramianu

engine-cislunar-arc-recovery-chart-monte-carlo-rms = błąd odzyskiwania położenia RMS z Monte Carlo (km)

engine-cislunar-arc-recovery-chart-noise-free-worst-ratio = najgorszy współczynnik odzyskiwania bez szumu (błąd końcowy / przemieszczenie)

## src/cislunar_observability.rs

engine-cislunar-observability-chart-title = Obserwowalność cislunarna na łuku śledzenia (P6)

engine-cislunar-observability-chart-subtitle = rząd a łuk (pojedyncze łącze, tylko zasięg) · widmo wartości własnych gramianu · IC DRO poprawione różnicowo + kontrola krzyżowa SRIF · projekt { $modelled }, rząd/STM/domknięcie { $validated }

engine-cislunar-observability-chart-observable-rank = rząd obserwowalności a długość łuku

engine-cislunar-observability-chart-arc-length = długość łuku (jednostki czasu w układzie obracającym się, łącznie { $arc_hours } h)

engine-cislunar-observability-chart-gramian-eigenvalues = wartości własne gramianu (log10)

engine-cislunar-observability-chart-condition = uwarunkowanie κ = { $condition }

## src/conflict_resilience.rs

engine-conflict-resilience-chart-title = Odporność warstwowego PNT w konflikcie (P7)

engine-conflict-resilience-chart-subtitle = całkowita utrata a natężenie zagrożenia (MC a postać zamknięta) · współczynnik odporności a korelacja odmowy · priory { $modelled }, MC->postać zamknięta / brzegi kopuły { $validated }

engine-conflict-resilience-chart-total-loss-probability = prawdopodobieństwo całkowitej utraty a natężenie

engine-conflict-resilience-chart-threat-intensity = natężenie zagrożenia

engine-conflict-resilience-chart-layered-mc = warstwowy MC

engine-conflict-resilience-chart-single-layer = pojedyncza warstwa

engine-conflict-resilience-chart-resilience-ratio = współczynnik odporności a korelacja odmowy

engine-conflict-resilience-chart-denial-correlation = korelacja odmowy ρ

## src/constellation.rs

engine-constellation-chart-availability-pct = dostępność (%)

engine-constellation-chart-mean-pdop = średni PDOP

## src/earth_gnss_lunar.rs

engine-earth-gnss-lunar-chart-title = Sygnał GNSS z Ziemi na odległości księżycowej — C/N0 a kąt od osi głównej

engine-earth-gnss-lunar-chart-track-threshold = śledzenie { $threshold } dB-Hz

engine-earth-gnss-lunar-chart-earth-limb = brzeg tarczy Ziemi { $angle }°

engine-earth-gnss-lunar-chart-off-boresight-angle = kąt od osi głównej (deg)

engine-earth-gnss-lunar-chart-cn0 = C/N0 (dB-Hz)

engine-earth-gnss-lunar-chart-legend = złoty = możliwy do śledzenia · czerwony = zbyt słaby · szary = zasłonięty przez Ziemię · wzorzec nadawczy { $modelled }

## src/ensemble.rs

engine-ensemble-chart-title = Holdover zegara: pasmo ufności błędu czasu (przebiegi: { $n_runs })

engine-ensemble-chart-timing-error-ns = błąd czasu (ns)

engine-ensemble-chart-spec-threshold = specyfikacja { $threshold } ns

engine-ensemble-chart-time-s = czas (s)

engine-ensemble-chart-classical-median-band = klasyczny: { $id } (mediana, pasmo 5-95%)

engine-ensemble-chart-quantum-median-band = kwantowy: { $id } (mediana, pasmo 5-95%)

## src/fom_label.rs

engine-fom-verdict-validated = VALIDATED

engine-fom-verdict-modelled = MODELLED

engine-fom-verdict-partial = PARTIAL

## src/frame_eop.rs

engine-frame-eop-chart-title = Budżet predykcji układu odniesienia / EOP w czasie rzeczywistym dla czasu księżycowego

engine-frame-eop-chart-ut1-error-ms = błąd UT1 (ms)

engine-frame-eop-chart-position-at-moon-m = położenie na Księżycu (m)

engine-frame-eop-chart-equiv-timing-ns = równoważny czas (ns)

engine-frame-eop-chart-prediction-horizon-days = horyzont predykcji (dni)

engine-frame-eop-chart-iers-final-floor = dolna granica finalna IERS { $floor_ms } ms

engine-frame-eop-chart-marker-at-moon = ~{ $ut1_ms } ms = ~{ $pos_m } m na Księżycu

engine-frame-eop-chart-growth = ~{ $factor }x, 1 d→{ $far_days } d

## src/fusion/hybrid_ukf.rs

engine-fusion-hybrid-ukf-chart-title = 17-stanowy hybrydowy UKF — samospójność filtru (modelowane)

engine-fusion-hybrid-ukf-chart-subtitle = NEES + biel innowacji a pasma χ² 95%; { $lit_1_0 } = spójny. Samospójność, nie dokładność.

engine-fusion-hybrid-ukf-chart-target = cel { $lit_1_0 }

engine-fusion-hybrid-ukf-chart-nis-whiteness = NIS (biel)

engine-fusion-hybrid-ukf-chart-nees = NEES

engine-fusion-hybrid-ukf-chart-consistent = CONSISTENT

engine-fusion-hybrid-ukf-chart-inconsistent = INCONSISTENT

## src/fusion/pack.rs

engine-fusion-pack-chart-title = Błąd poziomy luźno sprzężonego GNSS/INS

engine-fusion-pack-chart-horizontal-error-m = błąd poziomy (m)

engine-fusion-pack-chart-spec-threshold = specyfikacja { $threshold } m

## src/geometry.rs

engine-geometry-chart-title = Skyplot ({ $label })

engine-geometry-chart-north = N

engine-geometry-chart-east = E

engine-geometry-chart-south = S

engine-geometry-chart-west = W

engine-geometry-chart-satellite-tooltip = { $system } { $id } az { $az } el { $el }

engine-geometry-chart-satellite-tooltip-hidden = { $system } { $id } az { $az } el { $el } (zasłonięty przez horyzont terenowy)

engine-geometry-chart-satellite-tooltip-below-mask = { $system } { $id } az { $az } el { $el } (poniżej maski)

engine-geometry-chart-no-fix = brak rozwiązania

engine-geometry-chart-in-view-hidden = w widoku: { $n_visible }, zasłonięte przez horyzont terenowy: { $n_masked } · { $dop } · puste: poza widokiem

engine-geometry-chart-satellites-as-given = satelity jak podano

engine-geometry-chart-representative-sky = niebo reprezentatywne, nie datowane

engine-geometry-chart-footer = Kshana v{ $version } · geometria przy podanym modelu błędu · kshana.dev

## src/gnss_sim.rs

engine-gnss-sim-chart-title = Poziomy ochrony RAIM a limity alarmowe

engine-gnss-sim-chart-protection-level-m = poziom ochrony (m)

engine-gnss-sim-chart-val = VAL { $alert_v } m

engine-gnss-sim-chart-hpl = HPL

engine-gnss-sim-chart-vpl = VPL

## src/holdover_test.rs

engine-holdover-test-chart-title = Test holdover: błąd czasu według kroku

engine-holdover-test-chart-y-title = |błąd czasu| (ns)

engine-holdover-test-chart-panel-caption = bezwzględny błąd czasu; krok holdover zacieniowany; linie przerywane to budżety błędu czasu

engine-holdover-test-chart-gnss-removed = GNSS odłączony

engine-holdover-test-chart-gnss-restored = GNSS przywrócony

engine-holdover-test-chart-time-axis = czas na osi zapisu ({ $min } min)

## src/hybrid.rs

engine-hybrid-chart-title = Wykorzystanie specyfikacji hybrydowego PNT podczas przerwy w GNSS ({ $lit_1_0 } = specyfikacja)

engine-hybrid-chart-y-title = wykorzystanie specyfikacji

engine-hybrid-chart-spec-line = specyfikacja ({ $lit_1_0 })

engine-hybrid-chart-classical-suite = zestaw klasyczny

engine-hybrid-chart-quantum-suite = zestaw kwantowy

## src/hybrid_integrity.rs

engine-hybrid-integrity-chart-availability = dostępność

engine-hybrid-integrity-chart-precision = precyzja

engine-hybrid-integrity-chart-integrity = integralność

engine-hybrid-integrity-chart-joint-indep = łącznie (niezal.)

engine-hybrid-integrity-chart-joint-corr = łącznie (skorel.)

engine-hybrid-integrity-chart-title = Łączna miara jakości hybrydowego PNT optycznego i RF

engine-hybrid-integrity-chart-subtitle = P(dostępne ORAZ klasy precyzji ORAZ z zapewnioną integralnością)

## src/inertial/mod.rs

engine-inertial-chart-title = Błąd położenia z nawigacji zliczeniowej podczas przerwy w GNSS

engine-inertial-chart-y-title = błąd położenia (m)

engine-inertial-chart-spec-line = specyfikacja { $m } m

engine-inertial-chart-classical = klasyczny: { $id }

engine-inertial-chart-quantum = kwantowy: { $id }

## src/iq/campaign/report.rs

engine-iq-campaign-report-roc-aria-label = Krzywa ROC detekcji dla każdego monitora

engine-iq-campaign-report-roc-x-title = P_fa (na okno ujemne)

engine-iq-campaign-report-curve-aria-label = Degradacja C/N0 a podane J/S dla { $rec }, zdarzenie { $ev }

engine-iq-campaign-report-curve-x-title = podane J/S (dB)

engine-iq-campaign-report-curve-y-title = degradacja C/N0 (dB)

engine-iq-campaign-report-curve-model-tooltip = { $label }: wzorzec SSC, Q = { $q }

engine-iq-campaign-report-curve-model-legend = wzorzec { $label } (Q = { $q })

engine-iq-campaign-report-curve-more-series = +{ $n } kolejnych serii w tabeli wyników

engine-iq-campaign-report-curve-point-tooltip = { $fe } / { $d }: J/S { $x } dB, zmierzona degradacja { $y } dB

engine-iq-campaign-report-curve-measured-legend = { $fe } / { $d } (zmierzone)

## src/jamming.rs

engine-jamming-chart-title = Satelity widoczne a śledzone podczas zagłuszania (jamming)

engine-jamming-chart-y-title = satelity

engine-jamming-chart-four-sv-fix = rozwiązanie z 4 SV

engine-jamming-chart-visible = widoczne

engine-jamming-chart-tracking = śledzone

## src/leo_fusion/ntn.rs

engine-leo-fusion-ntn-chart-title = Pozycjonowanie 5G NTN: ograniczenie Craméra-Rao dla zasięgu według pasma

engine-leo-fusion-ntn-chart-caption = jedna sigma zasięgu (log10 m): słupek = maska do zenitu C/N0; kropka = błąd rozwiązania 3D RMS

## src/leo_fusion/ppp.rs

engine-leo-fusion-ppp-chart-title = Zbieżność PPP z wspomaganiem LEO

engine-leo-fusion-ppp-chart-caption = mediana błędu poziomego (log10 m) a minuty

engine-leo-fusion-ppp-chart-n-leo = LEO: { $n }

## src/leo_fusion/pvt_kind.rs

engine-leo-fusion-pvt-kind-chart-doppler-caption = błąd rozwiązania Dopplera 3D (log10 m) a długość okna

engine-leo-fusion-pvt-kind-chart-doppler-x-label = okno (s)

engine-leo-fusion-pvt-kind-chart-joint-caption = mediana PDOP (niebieski) i VDOP (bursztynowy), log10, a liczba dodanych satelitów LEO

engine-leo-fusion-pvt-kind-chart-joint-x-label = dodane satelity LEO

engine-leo-fusion-pvt-kind-chart-polar-caption = mediana VDOP (log10): szary GNSS, niebieski LEO, bursztynowy fuzja

engine-leo-fusion-pvt-kind-chart-polar-x-label = szerokość geograficzna (deg)

engine-leo-fusion-pvt-kind-chart-timing-caption = błąd czasu RMS względem UTC (log10 ns) a przesunięcie C/N0, jedna linia na oscylator

engine-leo-fusion-pvt-kind-chart-timing-x-label = przesunięcie C/N0 (dB)

engine-leo-fusion-pvt-kind-chart-x-range = { $label }: { $x0 } do { $x1 }

## src/leo_navmsg/mod.rs

engine-leo-navmsg-chart-title = Komunikat nawigacyjny LEO: SISRE a przedział dopasowania

engine-leo-navmsg-chart-no-trade-encode-decode = Brak zestawienia w tym przebiegu; tabele kodowania/dekodowania i budżetu zob. w result.json.

engine-leo-navmsg-chart-no-fit-interval-trade = Brak zestawienia przedziałów dopasowania w tym przebiegu; zob. result.json.

engine-leo-navmsg-chart-caption = SISRE RMS tylko dla orbity (m, skala logarytmiczna) a przedział dopasowania (s)

## src/leo_pass.rs

engine-leo-pass-chart-title = Przelot LEO: C/N0 dla każdego pasma i Doppler

engine-leo-pass-chart-cn0-caption = C/N0 (dB-Hz, 20 do 80): pasma LEO w kolorze, GNSS w szarości

engine-leo-pass-chart-time-axis = czas od epoki, 0 do { $s } s

## src/leo_pnt_chain.rs

engine-leo-pnt-chain-chart-subtitle = projekt sygnału -> C/N0 przelotu i jitter kodu -> SISRE komunikatu -> rozwiązanie fuzyjne · { $label }

engine-leo-pnt-chain-chart-cn0-caption = C/N0 śledzonej składowej w trakcie przelotu (dB-Hz, 20 do 80)

engine-leo-pnt-chain-chart-not-available = b/d

## src/leo_signal.rs

engine-leo-signal-chart-title = Projekty sygnałów LEO-PNT

engine-leo-signal-chart-psd-axis = przesunięcie w zakresie ±{ $lit_0_6 } × pasmo nadawania; od 0 do −50 dB poniżej każdego szczytu

engine-leo-signal-chart-jitter-caption = jitter kodu (m, skala logarytmiczna) a całkowite C/N0 (dB-Hz)

## src/main.rs

engine-main-fail = błąd: { $e }

## plural forms

engine-e-clock-log-the-log-has-missing-epoch =
    { $n_missing ->
        [one]
            { $n_gaps ->
                [one] log { $format } ma { $n_missing } brakującą epokę w { $n_gaps } luce na siatce { $tau0 } s; ustaw gaps = "longest", aby zachować najdłuższy odcinek bez luk, lub gaps = "linear", aby interpolować
                [few] log { $format } ma { $n_missing } brakującą epokę w { $n_gaps } lukach na siatce { $tau0 } s; ustaw gaps = "longest", aby zachować najdłuższy odcinek bez luk, lub gaps = "linear", aby interpolować
                [many] log { $format } ma { $n_missing } brakującą epokę w { $n_gaps } lukach na siatce { $tau0 } s; ustaw gaps = "longest", aby zachować najdłuższy odcinek bez luk, lub gaps = "linear", aby interpolować
               *[other] log { $format } ma { $n_missing } brakującą epokę w { $n_gaps } luki na siatce { $tau0 } s; ustaw gaps = "longest", aby zachować najdłuższy odcinek bez luk, lub gaps = "linear", aby interpolować
            }
        [few]
            { $n_gaps ->
                [one] log { $format } ma { $n_missing } brakujące epoki w { $n_gaps } luce na siatce { $tau0 } s; ustaw gaps = "longest", aby zachować najdłuższy odcinek bez luk, lub gaps = "linear", aby interpolować
                [few] log { $format } ma { $n_missing } brakujące epoki w { $n_gaps } lukach na siatce { $tau0 } s; ustaw gaps = "longest", aby zachować najdłuższy odcinek bez luk, lub gaps = "linear", aby interpolować
                [many] log { $format } ma { $n_missing } brakujące epoki w { $n_gaps } lukach na siatce { $tau0 } s; ustaw gaps = "longest", aby zachować najdłuższy odcinek bez luk, lub gaps = "linear", aby interpolować
               *[other] log { $format } ma { $n_missing } brakujące epoki w { $n_gaps } luki na siatce { $tau0 } s; ustaw gaps = "longest", aby zachować najdłuższy odcinek bez luk, lub gaps = "linear", aby interpolować
            }
        [many]
            { $n_gaps ->
                [one] log { $format } ma { $n_missing } brakujących epok w { $n_gaps } luce na siatce { $tau0 } s; ustaw gaps = "longest", aby zachować najdłuższy odcinek bez luk, lub gaps = "linear", aby interpolować
                [few] log { $format } ma { $n_missing } brakujących epok w { $n_gaps } lukach na siatce { $tau0 } s; ustaw gaps = "longest", aby zachować najdłuższy odcinek bez luk, lub gaps = "linear", aby interpolować
                [many] log { $format } ma { $n_missing } brakujących epok w { $n_gaps } lukach na siatce { $tau0 } s; ustaw gaps = "longest", aby zachować najdłuższy odcinek bez luk, lub gaps = "linear", aby interpolować
               *[other] log { $format } ma { $n_missing } brakujących epok w { $n_gaps } luki na siatce { $tau0 } s; ustaw gaps = "longest", aby zachować najdłuższy odcinek bez luk, lub gaps = "linear", aby interpolować
            }
       *[other]
            { $n_gaps ->
                [one] log { $format } ma { $n_missing } brakującej epoki w { $n_gaps } luce na siatce { $tau0 } s; ustaw gaps = "longest", aby zachować najdłuższy odcinek bez luk, lub gaps = "linear", aby interpolować
                [few] log { $format } ma { $n_missing } brakującej epoki w { $n_gaps } lukach na siatce { $tau0 } s; ustaw gaps = "longest", aby zachować najdłuższy odcinek bez luk, lub gaps = "linear", aby interpolować
                [many] log { $format } ma { $n_missing } brakującej epoki w { $n_gaps } lukach na siatce { $tau0 } s; ustaw gaps = "longest", aby zachować najdłuższy odcinek bez luk, lub gaps = "linear", aby interpolować
               *[other] log { $format } ma { $n_missing } brakującej epoki w { $n_gaps } luki na siatce { $tau0 } s; ustaw gaps = "longest", aby zachować najdłuższy odcinek bez luk, lub gaps = "linear", aby interpolować
            }
    }

engine-advanced-report-rows-of-non-numeric-column =
    { $n ->
        [one] { $n } wiersz kolumny nienumerycznej
        [few] { $n } wiersze kolumny nienumerycznej
        [many] { $n } wierszy kolumny nienumerycznej
       *[other] { $n } wiersza kolumny nienumerycznej
    }

engine-e-animation-duration-fps-gives-frames-the =
    { $n ->
        [one] czas trwania x fps daje { $n } klatkę; sekwencja klatek wymaga od 2 do { $v1 }
        [few] czas trwania x fps daje { $n } klatki; sekwencja klatek wymaga od 2 do { $v1 }
        [many] czas trwania x fps daje { $n } klatek; sekwencja klatek wymaga od 2 do { $v1 }
       *[other] czas trwania x fps daje { $n } klatki; sekwencja klatek wymaga od 2 do { $v1 }
    }

engine-aocs-kind-aocs-wheels-slew-from-deg =
    { $n_w ->
        [one] aocs: { $n_w } koło, obrót { $duration_s } s z { $series_err } deg -> { $settle } | końcowy { $final_err } deg | szczyt koła { $peak_speed } rpm | { $v7 }
        [few] aocs: { $n_w } koła, obrót { $duration_s } s z { $series_err } deg -> { $settle } | końcowy { $final_err } deg | szczyt koła { $peak_speed } rpm | { $v7 }
        [many] aocs: { $n_w } kół, obrót { $duration_s } s z { $series_err } deg -> { $settle } | końcowy { $final_err } deg | szczyt koła { $peak_speed } rpm | { $v7 }
       *[other] aocs: { $n_w } koła, obrót { $duration_s } s z { $series_err } deg -> { $settle } | końcowy { $final_err } deg | szczyt koła { $peak_speed } rpm | { $v7 }
    }

engine-api-unknown-scenario-kind-did-you =
    { $n ->
        [one] nieznany rodzaj scenariusza { $other } — czy chodziło o { $hint }? `kshana kinds` wypisuje { $n } wbudowany rodzaj.
        [few] nieznany rodzaj scenariusza { $other } — czy chodziło o { $hint }? `kshana kinds` wypisuje wszystkie { $n } wbudowane rodzaje.
        [many] nieznany rodzaj scenariusza { $other } — czy chodziło o { $hint }? `kshana kinds` wypisuje wszystkie { $n } wbudowanych rodzajów.
       *[other] nieznany rodzaj scenariusza { $other } — czy chodziło o { $hint }? `kshana kinds` wypisuje { $n } wbudowanego rodzaju.
    }

engine-api-unknown-scenario-kind-kshana-kinds =
    { $n ->
        [one] nieznany rodzaj scenariusza { $other }. `kshana kinds` wypisuje { $n } wbudowany rodzaj.
        [few] nieznany rodzaj scenariusza { $other }. `kshana kinds` wypisuje wszystkie { $n } wbudowane rodzaje.
        [many] nieznany rodzaj scenariusza { $other }. `kshana kinds` wypisuje wszystkie { $n } wbudowanych rodzajów.
       *[other] nieznany rodzaj scenariusza { $other }. `kshana kinds` wypisuje { $n } wbudowanego rodzaju.
    }

engine-api-builtins-integrity-satellites-epochs-available-hal =
    { $n_sats ->
        [one] integralność | { $n_sats } satelita | dostępne epoki: { $samples_available }/{ $samples_total } ({ $report }%) | HAL { $al_h_m } m VAL { $al_v_m } m | sigma { $sigma_uere_m } m | Stanford(V): zdarzenia integralności { $report2 }, HMI { $report3 }
        [few] integralność | { $n_sats } satelity | dostępne epoki: { $samples_available }/{ $samples_total } ({ $report }%) | HAL { $al_h_m } m VAL { $al_v_m } m | sigma { $sigma_uere_m } m | Stanford(V): zdarzenia integralności { $report2 }, HMI { $report3 }
        [many] integralność | { $n_sats } satelitów | dostępne epoki: { $samples_available }/{ $samples_total } ({ $report }%) | HAL { $al_h_m } m VAL { $al_v_m } m | sigma { $sigma_uere_m } m | Stanford(V): zdarzenia integralności { $report2 }, HMI { $report3 }
       *[other] integralność | { $n_sats } satelity | dostępne epoki: { $samples_available }/{ $samples_total } ({ $report }%) | HAL { $al_h_m } m VAL { $al_v_m } m | sigma { $sigma_uere_m } m | Stanford(V): zdarzenia integralności { $report2 }, HMI { $report3 }
    }

engine-api-builtins-lunar-joint-od-clock-sats =
    { $n_sat ->
        [one]
            { $n_earth ->
                [one] lunar-joint-od-clock | { $n_sat } satelita, { $n_earth } stacja ziemska | błąd 3-D stacji z VLBI { $station_pos_err_m } m, a tylko z pomiarem odległości { $station_pos_err_m2 } m (ostrzej { $station_observability_improvement_factor }×) | RMS pozycji satelity { $sat_pos_rms_m } m | błąd zegara stacji { $station_clock_err_s } s | obs { $n_obs }/{ $n_params } parametrów
                [few] lunar-joint-od-clock | { $n_sat } satelita, { $n_earth } stacje ziemskie | błąd 3-D stacji z VLBI { $station_pos_err_m } m, a tylko z pomiarem odległości { $station_pos_err_m2 } m (ostrzej { $station_observability_improvement_factor }×) | RMS pozycji satelity { $sat_pos_rms_m } m | błąd zegara stacji { $station_clock_err_s } s | obs { $n_obs }/{ $n_params } parametrów
                [many] lunar-joint-od-clock | { $n_sat } satelita, { $n_earth } stacji ziemskich | błąd 3-D stacji z VLBI { $station_pos_err_m } m, a tylko z pomiarem odległości { $station_pos_err_m2 } m (ostrzej { $station_observability_improvement_factor }×) | RMS pozycji satelity { $sat_pos_rms_m } m | błąd zegara stacji { $station_clock_err_s } s | obs { $n_obs }/{ $n_params } parametrów
               *[other] lunar-joint-od-clock | { $n_sat } satelita, { $n_earth } stacji ziemskiej | błąd 3-D stacji z VLBI { $station_pos_err_m } m, a tylko z pomiarem odległości { $station_pos_err_m2 } m (ostrzej { $station_observability_improvement_factor }×) | RMS pozycji satelity { $sat_pos_rms_m } m | błąd zegara stacji { $station_clock_err_s } s | obs { $n_obs }/{ $n_params } parametrów
            }
        [few]
            { $n_earth ->
                [one] lunar-joint-od-clock | { $n_sat } satelity, { $n_earth } stacja ziemska | błąd 3-D stacji z VLBI { $station_pos_err_m } m, a tylko z pomiarem odległości { $station_pos_err_m2 } m (ostrzej { $station_observability_improvement_factor }×) | RMS pozycji satelity { $sat_pos_rms_m } m | błąd zegara stacji { $station_clock_err_s } s | obs { $n_obs }/{ $n_params } parametrów
                [few] lunar-joint-od-clock | { $n_sat } satelity, { $n_earth } stacje ziemskie | błąd 3-D stacji z VLBI { $station_pos_err_m } m, a tylko z pomiarem odległości { $station_pos_err_m2 } m (ostrzej { $station_observability_improvement_factor }×) | RMS pozycji satelity { $sat_pos_rms_m } m | błąd zegara stacji { $station_clock_err_s } s | obs { $n_obs }/{ $n_params } parametrów
                [many] lunar-joint-od-clock | { $n_sat } satelity, { $n_earth } stacji ziemskich | błąd 3-D stacji z VLBI { $station_pos_err_m } m, a tylko z pomiarem odległości { $station_pos_err_m2 } m (ostrzej { $station_observability_improvement_factor }×) | RMS pozycji satelity { $sat_pos_rms_m } m | błąd zegara stacji { $station_clock_err_s } s | obs { $n_obs }/{ $n_params } parametrów
               *[other] lunar-joint-od-clock | { $n_sat } satelity, { $n_earth } stacji ziemskiej | błąd 3-D stacji z VLBI { $station_pos_err_m } m, a tylko z pomiarem odległości { $station_pos_err_m2 } m (ostrzej { $station_observability_improvement_factor }×) | RMS pozycji satelity { $sat_pos_rms_m } m | błąd zegara stacji { $station_clock_err_s } s | obs { $n_obs }/{ $n_params } parametrów
            }
        [many]
            { $n_earth ->
                [one] lunar-joint-od-clock | { $n_sat } satelitów, { $n_earth } stacja ziemska | błąd 3-D stacji z VLBI { $station_pos_err_m } m, a tylko z pomiarem odległości { $station_pos_err_m2 } m (ostrzej { $station_observability_improvement_factor }×) | RMS pozycji satelity { $sat_pos_rms_m } m | błąd zegara stacji { $station_clock_err_s } s | obs { $n_obs }/{ $n_params } parametrów
                [few] lunar-joint-od-clock | { $n_sat } satelitów, { $n_earth } stacje ziemskie | błąd 3-D stacji z VLBI { $station_pos_err_m } m, a tylko z pomiarem odległości { $station_pos_err_m2 } m (ostrzej { $station_observability_improvement_factor }×) | RMS pozycji satelity { $sat_pos_rms_m } m | błąd zegara stacji { $station_clock_err_s } s | obs { $n_obs }/{ $n_params } parametrów
                [many] lunar-joint-od-clock | { $n_sat } satelitów, { $n_earth } stacji ziemskich | błąd 3-D stacji z VLBI { $station_pos_err_m } m, a tylko z pomiarem odległości { $station_pos_err_m2 } m (ostrzej { $station_observability_improvement_factor }×) | RMS pozycji satelity { $sat_pos_rms_m } m | błąd zegara stacji { $station_clock_err_s } s | obs { $n_obs }/{ $n_params } parametrów
               *[other] lunar-joint-od-clock | { $n_sat } satelitów, { $n_earth } stacji ziemskiej | błąd 3-D stacji z VLBI { $station_pos_err_m } m, a tylko z pomiarem odległości { $station_pos_err_m2 } m (ostrzej { $station_observability_improvement_factor }×) | RMS pozycji satelity { $sat_pos_rms_m } m | błąd zegara stacji { $station_clock_err_s } s | obs { $n_obs }/{ $n_params } parametrów
            }
       *[other]
            { $n_earth ->
                [one] lunar-joint-od-clock | { $n_sat } satelity, { $n_earth } stacja ziemska | błąd 3-D stacji z VLBI { $station_pos_err_m } m, a tylko z pomiarem odległości { $station_pos_err_m2 } m (ostrzej { $station_observability_improvement_factor }×) | RMS pozycji satelity { $sat_pos_rms_m } m | błąd zegara stacji { $station_clock_err_s } s | obs { $n_obs }/{ $n_params } parametrów
                [few] lunar-joint-od-clock | { $n_sat } satelity, { $n_earth } stacje ziemskie | błąd 3-D stacji z VLBI { $station_pos_err_m } m, a tylko z pomiarem odległości { $station_pos_err_m2 } m (ostrzej { $station_observability_improvement_factor }×) | RMS pozycji satelity { $sat_pos_rms_m } m | błąd zegara stacji { $station_clock_err_s } s | obs { $n_obs }/{ $n_params } parametrów
                [many] lunar-joint-od-clock | { $n_sat } satelity, { $n_earth } stacji ziemskich | błąd 3-D stacji z VLBI { $station_pos_err_m } m, a tylko z pomiarem odległości { $station_pos_err_m2 } m (ostrzej { $station_observability_improvement_factor }×) | RMS pozycji satelity { $sat_pos_rms_m } m | błąd zegara stacji { $station_clock_err_s } s | obs { $n_obs }/{ $n_params } parametrów
               *[other] lunar-joint-od-clock | { $n_sat } satelity, { $n_earth } stacji ziemskiej | błąd 3-D stacji z VLBI { $station_pos_err_m } m, a tylko z pomiarem odległości { $station_pos_err_m2 } m (ostrzej { $station_observability_improvement_factor }×) | RMS pozycji satelity { $sat_pos_rms_m } m | błąd zegara stacji { $station_clock_err_s } s | obs { $n_obs }/{ $n_params } parametrów
            }
    }

engine-api-builtins-lunar-frame-realisation-points-translation =
    { $n_points ->
        [one] lunar-frame-realisation | { $n_points } punkt | błąd przesunięcia { $trans_err_norm_m } m, błąd obrotu { $rot_err_norm_rad } rad, błąd skali { $scale_err_ppb } ppb | residuum rms { $rms_residual_m } m | zbieżność { $converged }
        [few] lunar-frame-realisation | { $n_points } punkty | błąd przesunięcia { $trans_err_norm_m } m, błąd obrotu { $rot_err_norm_rad } rad, błąd skali { $scale_err_ppb } ppb | residuum rms { $rms_residual_m } m | zbieżność { $converged }
        [many] lunar-frame-realisation | { $n_points } punktów | błąd przesunięcia { $trans_err_norm_m } m, błąd obrotu { $rot_err_norm_rad } rad, błąd skali { $scale_err_ppb } ppb | residuum rms { $rms_residual_m } m | zbieżność { $converged }
       *[other] lunar-frame-realisation | { $n_points } punktu | błąd przesunięcia { $trans_err_norm_m } m, błąd obrotu { $rot_err_norm_rad } rad, błąd skali { $scale_err_ppb } ppb | residuum rms { $rms_residual_m } m | zbieżność { $converged }
    }

engine-api-builtins-moonlight-service-volume-sats-pts =
    { $n_sats ->
        [one] moonlight-service-volume | { $n_sats } satelita ({ $geometry_label }) | punkty: { $n_grid_points } × epoki: { $n_epochs } | pokrycie { $coverage_pct }% (PDOP<{ $pdop_threshold }) | satelity { $min_sats }–{ $max_sats } | PDOP { $pdop_min }/{ $pdop_mean }/{ $pdop_max } | HPL { $hpl_min_m }–{ $hpl_max_m } m | dostępność PL { $pl_availability_pct }% | MODELLED
        [few] moonlight-service-volume | { $n_sats } satelity ({ $geometry_label }) | punkty: { $n_grid_points } × epoki: { $n_epochs } | pokrycie { $coverage_pct }% (PDOP<{ $pdop_threshold }) | satelity { $min_sats }–{ $max_sats } | PDOP { $pdop_min }/{ $pdop_mean }/{ $pdop_max } | HPL { $hpl_min_m }–{ $hpl_max_m } m | dostępność PL { $pl_availability_pct }% | MODELLED
        [many] moonlight-service-volume | { $n_sats } satelitów ({ $geometry_label }) | punkty: { $n_grid_points } × epoki: { $n_epochs } | pokrycie { $coverage_pct }% (PDOP<{ $pdop_threshold }) | satelity { $min_sats }–{ $max_sats } | PDOP { $pdop_min }/{ $pdop_mean }/{ $pdop_max } | HPL { $hpl_min_m }–{ $hpl_max_m } m | dostępność PL { $pl_availability_pct }% | MODELLED
       *[other] moonlight-service-volume | { $n_sats } satelity ({ $geometry_label }) | punkty: { $n_grid_points } × epoki: { $n_epochs } | pokrycie { $coverage_pct }% (PDOP<{ $pdop_threshold }) | satelity { $min_sats }–{ $max_sats } | PDOP { $pdop_min }/{ $pdop_mean }/{ $pdop_max } | HPL { $hpl_min_m }–{ $hpl_max_m } m | dostępność PL { $pl_availability_pct }% | MODELLED
    }

engine-api-builtins-lunar-differential-pnt-sats-illustrative =
    { $n_sats ->
        [one] lunar-differential-pnt | { $n_sats } satelita (poglądowa klasa LCNS, bez powiązań) | baza { $baseline_km } km | błąd użytkownika { $user_error_uncorrected_m } m → { $user_error_corrected_m } m (redukcja { $reduction_factor }×) | HPL { $protection_level_m } m (σ_resid { $residual_sigma_m } m) | MODELLED
        [few] lunar-differential-pnt | { $n_sats } satelity (poglądowa klasa LCNS, bez powiązań) | baza { $baseline_km } km | błąd użytkownika { $user_error_uncorrected_m } m → { $user_error_corrected_m } m (redukcja { $reduction_factor }×) | HPL { $protection_level_m } m (σ_resid { $residual_sigma_m } m) | MODELLED
        [many] lunar-differential-pnt | { $n_sats } satelitów (poglądowa klasa LCNS, bez powiązań) | baza { $baseline_km } km | błąd użytkownika { $user_error_uncorrected_m } m → { $user_error_corrected_m } m (redukcja { $reduction_factor }×) | HPL { $protection_level_m } m (σ_resid { $residual_sigma_m } m) | MODELLED
       *[other] lunar-differential-pnt | { $n_sats } satelity (poglądowa klasa LCNS, bez powiązań) | baza { $baseline_km } km | błąd użytkownika { $user_error_uncorrected_m } m → { $user_error_corrected_m } m (redukcja { $reduction_factor }×) | HPL { $protection_level_m } m (σ_resid { $residual_sigma_m } m) | MODELLED
    }

engine-api-builtins-lunar-interop-export-ref-frame =
    { $n_states ->
        [one]
            { $oem_line_count ->
                [one] lunar-interop-export | REF_FRAME { $frame } / TIME_SYSTEM { $time_system } | { $n_states } stan, OEM: { $oem_line_count } wiersz | ocena pól { $v5 } ({ $present_fields } obecnych / { $missing_fields } brakujących) | cykl OEM { $v8 } | cykl metadanych czasu { $v9 } | KIF { $kif_bytes } bajtów | MODELLED
                [few] lunar-interop-export | REF_FRAME { $frame } / TIME_SYSTEM { $time_system } | { $n_states } stan, OEM: { $oem_line_count } wiersze | ocena pól { $v5 } ({ $present_fields } obecnych / { $missing_fields } brakujących) | cykl OEM { $v8 } | cykl metadanych czasu { $v9 } | KIF { $kif_bytes } bajtów | MODELLED
                [many] lunar-interop-export | REF_FRAME { $frame } / TIME_SYSTEM { $time_system } | { $n_states } stan, OEM: { $oem_line_count } wierszy | ocena pól { $v5 } ({ $present_fields } obecnych / { $missing_fields } brakujących) | cykl OEM { $v8 } | cykl metadanych czasu { $v9 } | KIF { $kif_bytes } bajtów | MODELLED
               *[other] lunar-interop-export | REF_FRAME { $frame } / TIME_SYSTEM { $time_system } | { $n_states } stan, OEM: { $oem_line_count } wiersza | ocena pól { $v5 } ({ $present_fields } obecnych / { $missing_fields } brakujących) | cykl OEM { $v8 } | cykl metadanych czasu { $v9 } | KIF { $kif_bytes } bajtów | MODELLED
            }
        [few]
            { $oem_line_count ->
                [one] lunar-interop-export | REF_FRAME { $frame } / TIME_SYSTEM { $time_system } | { $n_states } stany, OEM: { $oem_line_count } wiersz | ocena pól { $v5 } ({ $present_fields } obecnych / { $missing_fields } brakujących) | cykl OEM { $v8 } | cykl metadanych czasu { $v9 } | KIF { $kif_bytes } bajtów | MODELLED
                [few] lunar-interop-export | REF_FRAME { $frame } / TIME_SYSTEM { $time_system } | { $n_states } stany, OEM: { $oem_line_count } wiersze | ocena pól { $v5 } ({ $present_fields } obecnych / { $missing_fields } brakujących) | cykl OEM { $v8 } | cykl metadanych czasu { $v9 } | KIF { $kif_bytes } bajtów | MODELLED
                [many] lunar-interop-export | REF_FRAME { $frame } / TIME_SYSTEM { $time_system } | { $n_states } stany, OEM: { $oem_line_count } wierszy | ocena pól { $v5 } ({ $present_fields } obecnych / { $missing_fields } brakujących) | cykl OEM { $v8 } | cykl metadanych czasu { $v9 } | KIF { $kif_bytes } bajtów | MODELLED
               *[other] lunar-interop-export | REF_FRAME { $frame } / TIME_SYSTEM { $time_system } | { $n_states } stany, OEM: { $oem_line_count } wiersza | ocena pól { $v5 } ({ $present_fields } obecnych / { $missing_fields } brakujących) | cykl OEM { $v8 } | cykl metadanych czasu { $v9 } | KIF { $kif_bytes } bajtów | MODELLED
            }
        [many]
            { $oem_line_count ->
                [one] lunar-interop-export | REF_FRAME { $frame } / TIME_SYSTEM { $time_system } | { $n_states } stanów, OEM: { $oem_line_count } wiersz | ocena pól { $v5 } ({ $present_fields } obecnych / { $missing_fields } brakujących) | cykl OEM { $v8 } | cykl metadanych czasu { $v9 } | KIF { $kif_bytes } bajtów | MODELLED
                [few] lunar-interop-export | REF_FRAME { $frame } / TIME_SYSTEM { $time_system } | { $n_states } stanów, OEM: { $oem_line_count } wiersze | ocena pól { $v5 } ({ $present_fields } obecnych / { $missing_fields } brakujących) | cykl OEM { $v8 } | cykl metadanych czasu { $v9 } | KIF { $kif_bytes } bajtów | MODELLED
                [many] lunar-interop-export | REF_FRAME { $frame } / TIME_SYSTEM { $time_system } | { $n_states } stanów, OEM: { $oem_line_count } wierszy | ocena pól { $v5 } ({ $present_fields } obecnych / { $missing_fields } brakujących) | cykl OEM { $v8 } | cykl metadanych czasu { $v9 } | KIF { $kif_bytes } bajtów | MODELLED
               *[other] lunar-interop-export | REF_FRAME { $frame } / TIME_SYSTEM { $time_system } | { $n_states } stanów, OEM: { $oem_line_count } wiersza | ocena pól { $v5 } ({ $present_fields } obecnych / { $missing_fields } brakujących) | cykl OEM { $v8 } | cykl metadanych czasu { $v9 } | KIF { $kif_bytes } bajtów | MODELLED
            }
       *[other]
            { $oem_line_count ->
                [one] lunar-interop-export | REF_FRAME { $frame } / TIME_SYSTEM { $time_system } | { $n_states } stanu, OEM: { $oem_line_count } wiersz | ocena pól { $v5 } ({ $present_fields } obecnych / { $missing_fields } brakujących) | cykl OEM { $v8 } | cykl metadanych czasu { $v9 } | KIF { $kif_bytes } bajtów | MODELLED
                [few] lunar-interop-export | REF_FRAME { $frame } / TIME_SYSTEM { $time_system } | { $n_states } stanu, OEM: { $oem_line_count } wiersze | ocena pól { $v5 } ({ $present_fields } obecnych / { $missing_fields } brakujących) | cykl OEM { $v8 } | cykl metadanych czasu { $v9 } | KIF { $kif_bytes } bajtów | MODELLED
                [many] lunar-interop-export | REF_FRAME { $frame } / TIME_SYSTEM { $time_system } | { $n_states } stanu, OEM: { $oem_line_count } wierszy | ocena pól { $v5 } ({ $present_fields } obecnych / { $missing_fields } brakujących) | cykl OEM { $v8 } | cykl metadanych czasu { $v9 } | KIF { $kif_bytes } bajtów | MODELLED
               *[other] lunar-interop-export | REF_FRAME { $frame } / TIME_SYSTEM { $time_system } | { $n_states } stanu, OEM: { $oem_line_count } wiersza | ocena pól { $v5 } ({ $present_fields } obecnych / { $missing_fields } brakujących) | cykl OEM { $v8 } | cykl metadanych czasu { $v9 } | KIF { $kif_bytes } bajtów | MODELLED
            }
    }

engine-api-builtins-scenario-samples-alt-km-lat =
    { $n_samples ->
        [one] scenariusz { $r } | { $source } | { $n_samples } próbka | wysokość { $alt_min_km }–{ $alt_max_km } km | |szer.| ≤ { $r2 }° | prędkość { $speed_min_m_s }–{ $speed_max_m_s } m/s{ $pass }
        [few] scenariusz { $r } | { $source } | { $n_samples } próbki | wysokość { $alt_min_km }–{ $alt_max_km } km | |szer.| ≤ { $r2 }° | prędkość { $speed_min_m_s }–{ $speed_max_m_s } m/s{ $pass }
        [many] scenariusz { $r } | { $source } | { $n_samples } próbek | wysokość { $alt_min_km }–{ $alt_max_km } km | |szer.| ≤ { $r2 }° | prędkość { $speed_min_m_s }–{ $speed_max_m_s } m/s{ $pass }
       *[other] scenariusz { $r } | { $source } | { $n_samples } próbki | wysokość { $alt_min_km }–{ $alt_max_km } km | |szer.| ≤ { $r2 }° | prędkość { $speed_min_m_s }–{ $speed_max_m_s } m/s{ $pass }
    }

engine-api-builtins-raim-available-of-epochs-denied =
    { $n_epochs ->
        [one] { " " }| RAIM dostępny: { $n_available } z { $n_epochs } epoki (odmowy: { $n_denied }, alarmy: { $n_alarm }; MODELLED)
        [few] { " " }| RAIM dostępny: { $n_available } z { $n_epochs } epok (odmowy: { $n_denied }, alarmy: { $n_alarm }; MODELLED)
        [many] { " " }| RAIM dostępny: { $n_available } z { $n_epochs } epok (odmowy: { $n_denied }, alarmy: { $n_alarm }; MODELLED)
       *[other] { " " }| RAIM dostępny: { $n_available } z { $n_epochs } epoki (odmowy: { $n_denied }, alarmy: { $n_alarm }; MODELLED)
    }

engine-e-araim-reference-the-priors-need-subsets-of =
    { $n_fault_max ->
        [one] prawdopodobieństwa a priori wymagają podzbiorów { $n_fault_max } jednoczesnego zdarzenia; ta ścieżka wylicza co najwyżej { $most }
        [few] prawdopodobieństwa a priori wymagają podzbiorów { $n_fault_max } jednoczesnych zdarzeń; ta ścieżka wylicza co najwyżej { $most }
        [many] prawdopodobieństwa a priori wymagają podzbiorów { $n_fault_max } jednoczesnych zdarzeń; ta ścieżka wylicza co najwyżej { $most }
       *[other] prawdopodobieństwa a priori wymagają podzbiorów { $n_fault_max } jednoczesnego zdarzenia; ta ścieżka wylicza co najwyżej { $most }
    }

engine-bin-gen-araim-m3-study-user-epochs-ura-values-in =
    { $n ->
        [one] { $n } epoka użytkownika x 3 wartości URA w { $dt } s = { $v1 } ms na epokę użytkownika (rozwiązywalnych: { $ok })
        [few] { $n } epoki użytkownika x 3 wartości URA w { $dt } s = { $v1 } ms na epokę użytkownika (rozwiązywalnych: { $ok })
        [many] { $n } epok użytkownika x 3 wartości URA w { $dt } s = { $v1 } ms na epokę użytkownika (rozwiązywalnych: { $ok })
       *[other] { $n } epoki użytkownika x 3 wartości URA w { $dt } s = { $v1 } ms na epokę użytkownika (rozwiązywalnych: { $ok })
    }

engine-body-pnt-positioning-around-user-relays-at =
    { $n_relays ->
        [one] Pozycjonowanie wokół: { $name } — użytkownik: { $user_kind }, { $n_relays } przekaźnik na { $r } km, epoki: { $n_epochs }
            { "  " }Czas światła do Ziemi: { $one_way_light_time_s } s w jedną stronę, { $two_way_light_time_s } s w obie; kąt Słońce–Ziemia–ciało { $sun_separation_deg } deg
            { "  " }dostępność: { $availability_relays } tylko konstelacja, { $availability_with_earth } z odległością do Ziemi (Ziemia w widoku { $earth_visibility })
            { "  " }mediana PDOP { $opt }; błąd RMS { $opt2 } tylko konstelacja, { $opt3 } z odległością do Ziemi
            { "  " }mediana sigmy formalnej { $opt4 } tylko konstelacja, { $opt5 } z odległością do Ziemi{ "\u000A" }
        [few] Pozycjonowanie wokół: { $name } — użytkownik: { $user_kind }, { $n_relays } przekaźniki na { $r } km, epoki: { $n_epochs }
            { "  " }Czas światła do Ziemi: { $one_way_light_time_s } s w jedną stronę, { $two_way_light_time_s } s w obie; kąt Słońce–Ziemia–ciało { $sun_separation_deg } deg
            { "  " }dostępność: { $availability_relays } tylko konstelacja, { $availability_with_earth } z odległością do Ziemi (Ziemia w widoku { $earth_visibility })
            { "  " }mediana PDOP { $opt }; błąd RMS { $opt2 } tylko konstelacja, { $opt3 } z odległością do Ziemi
            { "  " }mediana sigmy formalnej { $opt4 } tylko konstelacja, { $opt5 } z odległością do Ziemi{ "\u000A" }
        [many] Pozycjonowanie wokół: { $name } — użytkownik: { $user_kind }, { $n_relays } przekaźników na { $r } km, epoki: { $n_epochs }
            { "  " }Czas światła do Ziemi: { $one_way_light_time_s } s w jedną stronę, { $two_way_light_time_s } s w obie; kąt Słońce–Ziemia–ciało { $sun_separation_deg } deg
            { "  " }dostępność: { $availability_relays } tylko konstelacja, { $availability_with_earth } z odległością do Ziemi (Ziemia w widoku { $earth_visibility })
            { "  " }mediana PDOP { $opt }; błąd RMS { $opt2 } tylko konstelacja, { $opt3 } z odległością do Ziemi
            { "  " }mediana sigmy formalnej { $opt4 } tylko konstelacja, { $opt5 } z odległością do Ziemi{ "\u000A" }
       *[other] Pozycjonowanie wokół: { $name } — użytkownik: { $user_kind }, { $n_relays } przekaźnika na { $r } km, epoki: { $n_epochs }
            { "  " }Czas światła do Ziemi: { $one_way_light_time_s } s w jedną stronę, { $two_way_light_time_s } s w obie; kąt Słońce–Ziemia–ciało { $sun_separation_deg } deg
            { "  " }dostępność: { $availability_relays } tylko konstelacja, { $availability_with_earth } z odległością do Ziemi (Ziemia w widoku { $earth_visibility })
            { "  " }mediana PDOP { $opt }; błąd RMS { $opt2 } tylko konstelacja, { $opt3 } z odległością do Ziemi
            { "  " }mediana sigmy formalnej { $opt4 } tylko konstelacja, { $opt5 } z odległością do Ziemi{ "\u000A" }
    }

engine-body-pnt-user-relays-earth-light-time =
    { $n_relays ->
        [one] użytkownik: { $user_kind } · { $n_relays } przekaźnik · czas światła do Ziemi { $one_way_light_time_s } s · MODELLED
        [few] użytkownik: { $user_kind } · { $n_relays } przekaźniki · czas światła do Ziemi { $one_way_light_time_s } s · MODELLED
        [many] użytkownik: { $user_kind } · { $n_relays } przekaźników · czas światła do Ziemi { $one_way_light_time_s } s · MODELLED
       *[other] użytkownik: { $user_kind } · { $n_relays } przekaźnika · czas światła do Ziemi { $one_way_light_time_s } s · MODELLED
    }

engine-cislunar-observability-cislunar-observability-refs-arc-epochs =
    { $n_links ->
        [one] cislunar-observability | { $c } s/c ({ $refs } odniesień) | łuk { $arc_hours } h, epoki: { $rank_arc } | rząd { $first } → { $last } z { $state_dim } na łuku | Gramian λ [{ $min_eigenvalue }…{ $max_eigenvalue }] cond { $condition_str } | rząd chwilowy tylko range { $rank_range_only } → range+rate { $rank_range_rate } ({ $n_links } łącze) | GDOP tylko range { $ro } range+rate { $rr } | warunki początkowe DRO (maks. residuum okresowości { $max_resid }) | SRIF a posteriori skończony w epoce rzędu 4 { $srif_epoch } (rząd/STM/domknięcie DRO/SRIF zwalidowane, projekt modelowany)
        [few] cislunar-observability | { $c } s/c ({ $refs } odniesień) | łuk { $arc_hours } h, epoki: { $rank_arc } | rząd { $first } → { $last } z { $state_dim } na łuku | Gramian λ [{ $min_eigenvalue }…{ $max_eigenvalue }] cond { $condition_str } | rząd chwilowy tylko range { $rank_range_only } → range+rate { $rank_range_rate } ({ $n_links } łącza) | GDOP tylko range { $ro } range+rate { $rr } | warunki początkowe DRO (maks. residuum okresowości { $max_resid }) | SRIF a posteriori skończony w epoce rzędu 4 { $srif_epoch } (rząd/STM/domknięcie DRO/SRIF zwalidowane, projekt modelowany)
        [many] cislunar-observability | { $c } s/c ({ $refs } odniesień) | łuk { $arc_hours } h, epoki: { $rank_arc } | rząd { $first } → { $last } z { $state_dim } na łuku | Gramian λ [{ $min_eigenvalue }…{ $max_eigenvalue }] cond { $condition_str } | rząd chwilowy tylko range { $rank_range_only } → range+rate { $rank_range_rate } ({ $n_links } łączy) | GDOP tylko range { $ro } range+rate { $rr } | warunki początkowe DRO (maks. residuum okresowości { $max_resid }) | SRIF a posteriori skończony w epoce rzędu 4 { $srif_epoch } (rząd/STM/domknięcie DRO/SRIF zwalidowane, projekt modelowany)
       *[other] cislunar-observability | { $c } s/c ({ $refs } odniesień) | łuk { $arc_hours } h, epoki: { $rank_arc } | rząd { $first } → { $last } z { $state_dim } na łuku | Gramian λ [{ $min_eigenvalue }…{ $max_eigenvalue }] cond { $condition_str } | rząd chwilowy tylko range { $rank_range_only } → range+rate { $rank_range_rate } ({ $n_links } łącza) | GDOP tylko range { $ro } range+rate { $rr } | warunki początkowe DRO (maks. residuum okresowości { $max_resid }) | SRIF a posteriori skończony w epoce rzędu 4 { $srif_epoch } (rząd/STM/domknięcie DRO/SRIF zwalidowane, projekt modelowany)
    }

engine-cislunar-observability-extension-r3-this-run-is =
    { $n_spacecraft ->
        [one] ROZSZERZENIE (R3) — ten przebieg NIE jest płaską konfiguracją DRO opisaną przez powyższe `label`. Wymiar stanu { $state_dim }; rodzina orbit { $family }; { $n_spacecraft } statek kosmiczny; sigma pomiaru odległości { $sigma_range_m } m. Tam, gdzie `label` mówi „planar” i „planar DROs”, należy czytać rodzinę podaną tutaj. Dodatki VALIDATED: wariacyjna STM 6x6 jest tą samą STM CR3BP zwalidowaną różnicami skończonymi (crate::cr3bp), użytą w pełnej szerokości; wiersze przestrzennego Jacobianu range / range-rate są analitycznymi pochodnymi cząstkowymi zwalidowanymi różnicami skończonymi, a wiersz range-rate sprawdzony składowa po składowej z niezależną funkcją 3-D deepspace_od::range_rate_observable tej biblioteki; warunki początkowe halo / NRHO są orbitami okresowymi skorygowanymi różnicowo tym samym korektorem, który odtwarza opublikowaną południową orbitę NRHO L2 9:2, kontynuowanymi od tego opublikowanego ziarna (seed), a residuum domknięcia każdego elementu jest podawane; werdykty RANK sześciu stanów są potwierdzone NIEZALEŻNYM rzędem metodą schodkową (eliminacja Gaussa z częściowym wyborem elementu głównego), który nie dzieli kodu z drogą wartości własnych/SVD. UCZCIWY ZAKRES NOGI SRIF: powyższa walidacja krzyżowa SRIF korzysta z TYCH SAMYCH Jacobianów pomiarowych i redukuje się do tego samego O^T O, więc jej zgodność jest kontrolą spójności dwóch maszyn numerycznych, a NIE niezależnym potwierdzeniem progu — nie jest liczona jako walidacja żadnej tutaj podanej wartości. MODELLED: projekt rodziny (które odcięte, amplitudy i fazy), siatka epok, łuk jednołączowy oraz wskazana granica pozycji kryterium estymowalności.
        [few] ROZSZERZENIE (R3) — ten przebieg NIE jest płaską konfiguracją DRO opisaną przez powyższe `label`. Wymiar stanu { $state_dim }; rodzina orbit { $family }; { $n_spacecraft } statki kosmiczne; sigma pomiaru odległości { $sigma_range_m } m. Tam, gdzie `label` mówi „planar” i „planar DROs”, należy czytać rodzinę podaną tutaj. Dodatki VALIDATED: wariacyjna STM 6x6 jest tą samą STM CR3BP zwalidowaną różnicami skończonymi (crate::cr3bp), użytą w pełnej szerokości; wiersze przestrzennego Jacobianu range / range-rate są analitycznymi pochodnymi cząstkowymi zwalidowanymi różnicami skończonymi, a wiersz range-rate sprawdzony składowa po składowej z niezależną funkcją 3-D deepspace_od::range_rate_observable tej biblioteki; warunki początkowe halo / NRHO są orbitami okresowymi skorygowanymi różnicowo tym samym korektorem, który odtwarza opublikowaną południową orbitę NRHO L2 9:2, kontynuowanymi od tego opublikowanego ziarna (seed), a residuum domknięcia każdego elementu jest podawane; werdykty RANK sześciu stanów są potwierdzone NIEZALEŻNYM rzędem metodą schodkową (eliminacja Gaussa z częściowym wyborem elementu głównego), który nie dzieli kodu z drogą wartości własnych/SVD. UCZCIWY ZAKRES NOGI SRIF: powyższa walidacja krzyżowa SRIF korzysta z TYCH SAMYCH Jacobianów pomiarowych i redukuje się do tego samego O^T O, więc jej zgodność jest kontrolą spójności dwóch maszyn numerycznych, a NIE niezależnym potwierdzeniem progu — nie jest liczona jako walidacja żadnej tutaj podanej wartości. MODELLED: projekt rodziny (które odcięte, amplitudy i fazy), siatka epok, łuk jednołączowy oraz wskazana granica pozycji kryterium estymowalności.
        [many] ROZSZERZENIE (R3) — ten przebieg NIE jest płaską konfiguracją DRO opisaną przez powyższe `label`. Wymiar stanu { $state_dim }; rodzina orbit { $family }; { $n_spacecraft } statków kosmicznych; sigma pomiaru odległości { $sigma_range_m } m. Tam, gdzie `label` mówi „planar” i „planar DROs”, należy czytać rodzinę podaną tutaj. Dodatki VALIDATED: wariacyjna STM 6x6 jest tą samą STM CR3BP zwalidowaną różnicami skończonymi (crate::cr3bp), użytą w pełnej szerokości; wiersze przestrzennego Jacobianu range / range-rate są analitycznymi pochodnymi cząstkowymi zwalidowanymi różnicami skończonymi, a wiersz range-rate sprawdzony składowa po składowej z niezależną funkcją 3-D deepspace_od::range_rate_observable tej biblioteki; warunki początkowe halo / NRHO są orbitami okresowymi skorygowanymi różnicowo tym samym korektorem, który odtwarza opublikowaną południową orbitę NRHO L2 9:2, kontynuowanymi od tego opublikowanego ziarna (seed), a residuum domknięcia każdego elementu jest podawane; werdykty RANK sześciu stanów są potwierdzone NIEZALEŻNYM rzędem metodą schodkową (eliminacja Gaussa z częściowym wyborem elementu głównego), który nie dzieli kodu z drogą wartości własnych/SVD. UCZCIWY ZAKRES NOGI SRIF: powyższa walidacja krzyżowa SRIF korzysta z TYCH SAMYCH Jacobianów pomiarowych i redukuje się do tego samego O^T O, więc jej zgodność jest kontrolą spójności dwóch maszyn numerycznych, a NIE niezależnym potwierdzeniem progu — nie jest liczona jako walidacja żadnej tutaj podanej wartości. MODELLED: projekt rodziny (które odcięte, amplitudy i fazy), siatka epok, łuk jednołączowy oraz wskazana granica pozycji kryterium estymowalności.
       *[other] ROZSZERZENIE (R3) — ten przebieg NIE jest płaską konfiguracją DRO opisaną przez powyższe `label`. Wymiar stanu { $state_dim }; rodzina orbit { $family }; { $n_spacecraft } statku kosmicznego; sigma pomiaru odległości { $sigma_range_m } m. Tam, gdzie `label` mówi „planar” i „planar DROs”, należy czytać rodzinę podaną tutaj. Dodatki VALIDATED: wariacyjna STM 6x6 jest tą samą STM CR3BP zwalidowaną różnicami skończonymi (crate::cr3bp), użytą w pełnej szerokości; wiersze przestrzennego Jacobianu range / range-rate są analitycznymi pochodnymi cząstkowymi zwalidowanymi różnicami skończonymi, a wiersz range-rate sprawdzony składowa po składowej z niezależną funkcją 3-D deepspace_od::range_rate_observable tej biblioteki; warunki początkowe halo / NRHO są orbitami okresowymi skorygowanymi różnicowo tym samym korektorem, który odtwarza opublikowaną południową orbitę NRHO L2 9:2, kontynuowanymi od tego opublikowanego ziarna (seed), a residuum domknięcia każdego elementu jest podawane; werdykty RANK sześciu stanów są potwierdzone NIEZALEŻNYM rzędem metodą schodkową (eliminacja Gaussa z częściowym wyborem elementu głównego), który nie dzieli kodu z drogą wartości własnych/SVD. UCZCIWY ZAKRES NOGI SRIF: powyższa walidacja krzyżowa SRIF korzysta z TYCH SAMYCH Jacobianów pomiarowych i redukuje się do tego samego O^T O, więc jej zgodność jest kontrolą spójności dwóch maszyn numerycznych, a NIE niezależnym potwierdzeniem progu — nie jest liczona jako walidacja żadnej tutaj podanej wartości. MODELLED: projekt rodziny (które odcięte, amplitudy i fazy), siatka epok, łuk jednołączowy oraz wskazana granica pozycji kryterium estymowalności.
    }

engine-e-clock-integrity-integrity-epochs-exceed-the-epoch =
    { $n ->
        [one] integrity: { $n } epoka przekracza limit { $MAX_EPOCHS } epok; zwiększ step_s
        [few] integrity: { $n } epoki przekraczają limit { $MAX_EPOCHS } epok; zwiększ step_s
        [many] integrity: { $n } epok przekracza limit { $MAX_EPOCHS } epok; zwiększ step_s
       *[other] integrity: { $n } epoki przekracza limit { $MAX_EPOCHS } epok; zwiększ step_s
    }

engine-earth-gnss-lunar-earth-gnss-at-lunar-distance =
    { $n_satellites ->
        [one] Earth-GNSS w odległości księżycowej — { $n_satellites } satelita, odbiornik na { $r } km{ "\u000A" }
        [few] Earth-GNSS w odległości księżycowej — { $n_satellites } satelity, odbiornik na { $r } km{ "\u000A" }
        [many] Earth-GNSS w odległości księżycowej — { $n_satellites } satelitów, odbiornik na { $r } km{ "\u000A" }
       *[other] Earth-GNSS w odległości księżycowej — { $n_satellites } satelity, odbiornik na { $r } km{ "\u000A" }
    }

engine-ephemeris-ground-track-samples-alt-km =
    { $n_samples ->
        [one] ślad naziemny { $source } · { $n_samples } próbka · wysokość { $alt_min_km }–{ $alt_max_km } km · |szer.| ≤ { $r }°
        [few] ślad naziemny { $source } · { $n_samples } próbki · wysokość { $alt_min_km }–{ $alt_max_km } km · |szer.| ≤ { $r }°
        [many] ślad naziemny { $source } · { $n_samples } próbek · wysokość { $alt_min_km }–{ $alt_max_km } km · |szer.| ≤ { $r }°
       *[other] ślad naziemny { $source } · { $n_samples } próbki · wysokość { $alt_min_km }–{ $alt_max_km } km · |szer.| ≤ { $r }°
    }

engine-geometry-sky-tle-holds-no-complete =
    { $n_ignored ->
        [one] sky: tle nie zawiera kompletnego dwuwierszowego zestawu elementów; zignorowano { $n_ignored } wiersz, pierwszy: { $first }
        [few] sky: tle nie zawiera kompletnego dwuwierszowego zestawu elementów; zignorowano { $n_ignored } wiersze, pierwszy: { $first }
        [many] sky: tle nie zawiera kompletnego dwuwierszowego zestawu elementów; zignorowano { $n_ignored } wierszy, pierwszy: { $first }
       *[other] sky: tle nie zawiera kompletnego dwuwierszowego zestawu elementów; zignorowano { $n_ignored } wiersza, pierwszy: { $first }
    }

engine-geometry-element-sets-propagated-by-the =
    { $n ->
        [one] { $n } zestaw elementów propagowany przez SGP4 (WGS-72) silnika do { $iso } i obrócony do układu związanego z Ziemią przy UT1 przyjętym jako UTC i bez ruchu bieguna: niebo, jakie ten zestaw elementów daje w tej epoce, a nie jego pomiar.
        [few] { $n } zestawy elementów propagowane przez SGP4 (WGS-72) silnika do { $iso } i obrócone do układu związanego z Ziemią przy UT1 przyjętym jako UTC i bez ruchu bieguna: niebo, jakie te zestawy elementów dają w tej epoce, a nie jego pomiar.
        [many] { $n } zestawów elementów propagowanych przez SGP4 (WGS-72) silnika do { $iso } i obróconych do układu związanego z Ziemią przy UT1 przyjętym jako UTC i bez ruchu bieguna: niebo, jakie te zestawy elementów dają w tej epoce, a nie jego pomiar.
       *[other] { $n } zestawu elementów propagowanego przez SGP4 (WGS-72) silnika do { $iso } i obróconego do układu związanego z Ziemią przy UT1 przyjętym jako UTC i bez ruchu bieguna: niebo, jakie ten zestaw elementów daje w tej epoce, a nie jego pomiar.
    }

engine-geometry-element-sets-propagated-by-the-2 =
    { $n ->
        [one] { $n } zestaw elementów propagowany przez SGP4 (WGS-72) silnika do epoki najnowszego zestawu elementów plus time_s ({ $iso }). Nie podano epoki, więc jest to niebo reprezentatywne, a nie niebo z podanej daty.
        [few] { $n } zestawy elementów propagowane przez SGP4 (WGS-72) silnika do epoki najnowszego zestawu elementów plus time_s ({ $iso }). Nie podano epoki, więc jest to niebo reprezentatywne, a nie niebo z podanej daty.
        [many] { $n } zestawów elementów propagowanych przez SGP4 (WGS-72) silnika do epoki najnowszego zestawu elementów plus time_s ({ $iso }). Nie podano epoki, więc jest to niebo reprezentatywne, a nie niebo z podanej daty.
       *[other] { $n } zestawu elementów propagowanego przez SGP4 (WGS-72) silnika do epoki najnowszego zestawu elementów plus time_s ({ $iso }). Nie podano epoki, więc jest to niebo reprezentatywne, a nie niebo z podanej daty.
    }

engine-e-gse-sim-scenario-produces-epochs-need-increase =
    { $n ->
        [one] scenariusz daje { $n } epokę (potrzeba ≥ 2); zwiększ duration_s lub zmniejsz step_s
        [few] scenariusz daje { $n } epoki (potrzeba ≥ 2); zwiększ duration_s lub zmniejsz step_s
        [many] scenariusz daje { $n } epok (potrzeba ≥ 2); zwiększ duration_s lub zmniejsz step_s
       *[other] scenariusz daje { $n } epoki (potrzeba ≥ 2); zwiększ duration_s lub zmniejsz step_s
    }

engine-hybrid-integrity-hybrid-optical-rf-optical-footprint =
    { $n_sites ->
        [one] hybrid-optical-rf | ślad optyczny { $footprint_m } m, fotonów: { $detected_photons } -> σ pomiaru odległości { $c } mm, σ pomiaru czasu { $c2 } ps | cross-RAIM HPL { $hpl_m } m / VPL { $vpl_m } m / TPL { $c3 } ns ({ $v8 }) | dostępność { $c4 }% ({ $n_sites } stanowisko) | przekazanie bez skoku { $v11 } NEES { $final_nees }∈[{ $c5 },{ $c6 }] { $v15 } | wspólny FoM { $score } (A { $availability } · P { $precision_grade } · I { $integrity_assured }) | Validated CRLB/χ²-PL/union/handoff, Modelled σ/climatology
        [few] hybrid-optical-rf | ślad optyczny { $footprint_m } m, fotonów: { $detected_photons } -> σ pomiaru odległości { $c } mm, σ pomiaru czasu { $c2 } ps | cross-RAIM HPL { $hpl_m } m / VPL { $vpl_m } m / TPL { $c3 } ns ({ $v8 }) | dostępność { $c4 }% ({ $n_sites } stanowiska) | przekazanie bez skoku { $v11 } NEES { $final_nees }∈[{ $c5 },{ $c6 }] { $v15 } | wspólny FoM { $score } (A { $availability } · P { $precision_grade } · I { $integrity_assured }) | Validated CRLB/χ²-PL/union/handoff, Modelled σ/climatology
        [many] hybrid-optical-rf | ślad optyczny { $footprint_m } m, fotonów: { $detected_photons } -> σ pomiaru odległości { $c } mm, σ pomiaru czasu { $c2 } ps | cross-RAIM HPL { $hpl_m } m / VPL { $vpl_m } m / TPL { $c3 } ns ({ $v8 }) | dostępność { $c4 }% ({ $n_sites } stanowisk) | przekazanie bez skoku { $v11 } NEES { $final_nees }∈[{ $c5 },{ $c6 }] { $v15 } | wspólny FoM { $score } (A { $availability } · P { $precision_grade } · I { $integrity_assured }) | Validated CRLB/χ²-PL/union/handoff, Modelled σ/climatology
       *[other] hybrid-optical-rf | ślad optyczny { $footprint_m } m, fotonów: { $detected_photons } -> σ pomiaru odległości { $c } mm, σ pomiaru czasu { $c2 } ps | cross-RAIM HPL { $hpl_m } m / VPL { $vpl_m } m / TPL { $c3 } ns ({ $v8 }) | dostępność { $c4 }% ({ $n_sites } stanowiska) | przekazanie bez skoku { $v11 } NEES { $final_nees }∈[{ $c5 },{ $c6 }] { $v15 } | wspólny FoM { $score } (A { $availability } · P { $precision_grade } · I { $integrity_assured }) | Validated CRLB/χ²-PL/union/handoff, Modelled σ/climatology
    }

engine-impairment-eval-impairment-eval-detector-auc-in =
    { $n_cases ->
        [one] impairment-eval | detektor { $detector } | AUC { $auc_in } wewn. / { $auc_out } zewn. (różnica { $optimism_gap }{ $v5 }) | Pd { $report } Pfa { $report2 } @ cel { $target_pfa } | { $n_cases } przypadek | MODELLED dane syntetyczne
        [few] impairment-eval | detektor { $detector } | AUC { $auc_in } wewn. / { $auc_out } zewn. (różnica { $optimism_gap }{ $v5 }) | Pd { $report } Pfa { $report2 } @ cel { $target_pfa } | { $n_cases } przypadki | MODELLED dane syntetyczne
        [many] impairment-eval | detektor { $detector } | AUC { $auc_in } wewn. / { $auc_out } zewn. (różnica { $optimism_gap }{ $v5 }) | Pd { $report } Pfa { $report2 } @ cel { $target_pfa } | { $n_cases } przypadków | MODELLED dane syntetyczne
       *[other] impairment-eval | detektor { $detector } | AUC { $auc_in } wewn. / { $auc_out } zewn. (różnica { $optimism_gap }{ $v5 }) | Pd { $report } Pfa { $report2 } @ cel { $target_pfa } | { $n_cases } przypadku | MODELLED dane syntetyczne
    }

engine-e-interop-scene-time-samples-is-more-than =
    { $n ->
        [one] { $n } próbka czasu to więcej, niż zapisuje eksport ({ $MAX_SAMPLES })
        [few] { $n } próbki czasu to więcej, niż zapisuje eksport ({ $MAX_SAMPLES })
        [many] { $n } próbek czasu to więcej, niż zapisuje eksport ({ $MAX_SAMPLES })
       *[other] { $n } próbki czasu to więcej, niż zapisuje eksport ({ $MAX_SAMPLES })
    }

engine-e-iq-campaign-conditions-lists-value-give-one-per =
    { $n ->
        [one] { $at }: { $key } zawiera { $n } wartość; podaj jedną na id ({ $ids })
        [few] { $at }: { $key } zawiera { $n } wartości; podaj jedną na id ({ $ids })
        [many] { $at }: { $key } zawiera { $n } wartości; podaj jedną na id ({ $ids })
       *[other] { $at }: { $key } zawiera { $n } wartości; podaj jedną na id ({ $ids })
    }

engine-e-iq-campaign-runner-recording-holds-samples-needed-to =
    { $n ->
        [one] { $code }: nagranie zawiera próbek: { $buf }, do akwizycji potrzeba { $n } próbki
        [few] { $code }: nagranie zawiera próbek: { $buf }, do akwizycji potrzeba { $n } próbek
        [many] { $code }: nagranie zawiera próbek: { $buf }, do akwizycji potrzeba { $n } próbek
       *[other] { $code }: nagranie zawiera próbek: { $buf }, do akwizycji potrzeba { $n } próbki
    }

engine-iq-cli-iq-takes-positional-argument-got =
    { $n ->
        [one] iq { $cmd } przyjmuje { $n } argument pozycyjny, otrzymano: { $pos }
        [few] iq { $cmd } przyjmuje { $n } argumenty pozycyjne, otrzymano: { $pos }
        [many] iq { $cmd } przyjmuje { $n } argumentów pozycyjnych, otrzymano: { $pos }
       *[other] iq { $cmd } przyjmuje { $n } argumentu pozycyjnego, otrzymano: { $pos }
    }

engine-iq-io-cli-iq-takes-path-argument-got =
    { $n ->
        [one] iq { $cmd } przyjmuje { $n } argument ścieżki, otrzymano: { $pos }
        [few] iq { $cmd } przyjmuje { $n } argumenty ścieżki, otrzymano: { $pos }
        [many] iq { $cmd } przyjmuje { $n } argumentów ścieżki, otrzymano: { $pos }
       *[other] iq { $cmd } przyjmuje { $n } argumentu ścieżki, otrzymano: { $pos }
    }

engine-iq-io-cli-wrote-samples-hz-to-saturated =
    { $n ->
        [one] zapisano { $n } próbkę ({ $to }, { $fs_hz } Hz) do { $files }; nasycone elementy: { $w }{ $v4 }
        [few] zapisano { $n } próbki ({ $to }, { $fs_hz } Hz) do { $files }; nasycone elementy: { $w }{ $v4 }
        [many] zapisano { $n } próbek ({ $to }, { $fs_hz } Hz) do { $files }; nasycone elementy: { $w }{ $v4 }
       *[other] zapisano { $n } próbki ({ $to }, { $fs_hz } Hz) do { $files }; nasycone elementy: { $w }{ $v4 }
    }

engine-e-iq-io-sigmf-stream-capture-at-sample-is-out =
    { $n_file ->
        [one] { $name }: rejestracja przy próbce { $sample_start } jest poza kolejnością albo poza { $n_file } próbką w danych
        [few] { $name }: rejestracja przy próbce { $sample_start } jest poza kolejnością albo poza { $n_file } próbkami w danych
        [many] { $name }: rejestracja przy próbce { $sample_start } jest poza kolejnością albo poza { $n_file } próbkami w danych
       *[other] { $name }: rejestracja przy próbce { $sample_start } jest poza kolejnością albo poza { $n_file } próbki w danych
    }

engine-iq-labfit-iqfit-not-fitted-re-acquisitions-observed =
    { $n_reacq ->
        [one] nie dopasowano: zaobserwowano { $n_reacq } ponowną akwizycję (potrzeba co najmniej 3)
        [few] nie dopasowano: zaobserwowano { $n_reacq } ponowne akwizycje (potrzeba co najmniej 3)
        [many] nie dopasowano: zaobserwowano { $n_reacq } ponownych akwizycji (potrzeba co najmniej 3)
       *[other] nie dopasowano: zaobserwowano { $n_reacq } ponownej akwizycji (potrzeba co najmniej 3)
    }

engine-iq-labfit-iqreport-threshold-direct-median-db-over =
    { $n ->
        [one] Próg J/S, bezpośrednio: mediana { $om } dB dla { $n } utraty (IQR { $t }).{ "\u000A\u000A" }
        [few] Próg J/S, bezpośrednio: mediana { $om } dB dla { $n } utrat (IQR { $t }).{ "\u000A\u000A" }
        [many] Próg J/S, bezpośrednio: mediana { $om } dB dla { $n } utrat (IQR { $t }).{ "\u000A\u000A" }
       *[other] Próg J/S, bezpośrednio: mediana { $om } dB dla { $n } utraty (IQR { $t }).{ "\u000A\u000A" }
    }

engine-iq-labfit-iqreport-events-loss-time-rms-pi90 =
    { $n ->
        [one] { $model }: { $n } zdarzenie, RMS czasu utraty { $om } s, pokrycie PI90 { $om2 }
        [few] { $model }: { $n } zdarzenia, RMS czasu utraty { $om } s, pokrycie PI90 { $om2 }
        [many] { $model }: { $n } zdarzeń, RMS czasu utraty { $om } s, pokrycie PI90 { $om2 }
       *[other] { $model }: { $n } zdarzenia, RMS czasu utraty { $om } s, pokrycie PI90 { $om2 }
    }

engine-iq-labfit-report-n0-samples-residual-rms-db =
    { $n_samples ->
        [one] { "\u000A" }{ $n_samples } próbka C/N0, reszta RMS { $om } dB.{ $r }{ "\u000A" }
        [few] { "\u000A" }{ $n_samples } próbki C/N0, reszta RMS { $om } dB.{ $r }{ "\u000A" }
        [many] { "\u000A" }{ $n_samples } próbek C/N0, reszta RMS { $om } dB.{ $r }{ "\u000A" }
       *[other] { "\u000A" }{ $n_samples } próbki C/N0, reszta RMS { $om } dB.{ $r }{ "\u000A" }
    }

engine-iq-labfit-report-event-time-rms-over-events =
    { $n_events ->
        [one] { "\u000A" }RMS czasu zdarzeń { $om } s dla { $n_events } zdarzenia; utraty pominięte { $loss_missed } / nadmiarowe { $loss_extra }, ponowne akwizycje pominięte { $reacq_missed } / nadmiarowe { $reacq_extra }.

            | przebieg | spadek dB-Hz | ponowne złapanie dB-Hz | zdarzenia | RMS s |
            |---|---|---|---|---|{ "\u000A" }
        [few] { "\u000A" }RMS czasu zdarzeń { $om } s dla { $n_events } zdarzeń; utraty pominięte { $loss_missed } / nadmiarowe { $loss_extra }, ponowne akwizycje pominięte { $reacq_missed } / nadmiarowe { $reacq_extra }.

            | przebieg | spadek dB-Hz | ponowne złapanie dB-Hz | zdarzenia | RMS s |
            |---|---|---|---|---|{ "\u000A" }
        [many] { "\u000A" }RMS czasu zdarzeń { $om } s dla { $n_events } zdarzeń; utraty pominięte { $loss_missed } / nadmiarowe { $loss_extra }, ponowne akwizycje pominięte { $reacq_missed } / nadmiarowe { $reacq_extra }.

            | przebieg | spadek dB-Hz | ponowne złapanie dB-Hz | zdarzenia | RMS s |
            |---|---|---|---|---|{ "\u000A" }
       *[other] { "\u000A" }RMS czasu zdarzeń { $om } s dla { $n_events } zdarzenia; utraty pominięte { $loss_missed } / nadmiarowe { $loss_extra }, ponowne akwizycje pominięte { $reacq_missed } / nadmiarowe { $reacq_extra }.

            | przebieg | spadek dB-Hz | ponowne złapanie dB-Hz | zdarzenia | RMS s |
            |---|---|---|---|---|{ "\u000A" }
    }

engine-e-iq-short-samples-requested-short-run-holds =
    { $n ->
        [one] zażądano { $n } próbki; krótki przebieg mieści co najwyżej { $MAX_SAMPLES }
        [few] zażądano { $n } próbek; krótki przebieg mieści co najwyżej { $MAX_SAMPLES }
        [many] zażądano { $n } próbek; krótki przebieg mieści co najwyżej { $MAX_SAMPLES }
       *[other] zażądano { $n } próbki; krótki przebieg mieści co najwyżej { $MAX_SAMPLES }
    }

engine-e-iq-signals-galileo-codes-the-icd-defines =
    { $n ->
        [one] { $path }: { $n } kod, ICD definiuje: { $CODES_PER_COMPONENT }
        [few] { $path }: { $n } kody, ICD definiuje: { $CODES_PER_COMPONENT }
        [many] { $path }: { $n } kodów, ICD definiuje: { $CODES_PER_COMPONENT }
       *[other] { $path }: { $n } kodu, ICD definiuje: { $CODES_PER_COMPONENT }
    }

engine-e-leo-fusion-doppler-measurements-cannot-resolve-doppler-unknowns =
    { $n_meas ->
        [one] { $n_meas } pomiar nie pozwala wyznaczyć niewiadomych Dopplera: { $n }
        [few] { $n_meas } pomiary nie pozwalają wyznaczyć niewiadomych Dopplera: { $n }
        [many] { $n_meas } pomiarów nie pozwala wyznaczyć niewiadomych Dopplera: { $n }
       *[other] { $n_meas } pomiaru nie pozwala wyznaczyć niewiadomych Dopplera: { $n }
    }

engine-e-leo-fusion-joint-pvt-pseudoranges-cannot-resolve-unknowns-position =
    { $n ->
        [one] pseudoodległości ({ $obs }) nie pozwalają wyznaczyć { $n } niewiadomą (3 pozycji + zegary: { $n_clock })
        [few] pseudoodległości ({ $obs }) nie pozwalają wyznaczyć { $n } niewiadome (3 pozycji + zegary: { $n_clock })
        [many] pseudoodległości ({ $obs }) nie pozwalają wyznaczyć { $n } niewiadomych (3 pozycji + zegary: { $n_clock })
       *[other] pseudoodległości ({ $obs }) nie pozwalają wyznaczyć { $n } niewiadomej (3 pozycji + zegary: { $n_clock })
    }

engine-leo-fusion-ntn-5g-ntn-positioning-at-mhz =
    { $n_satellites ->
        [one] pozycjonowanie 5G NTN przy { $r } MHz, C/N0 od { $r2 } do { $r3 } dB-Hz, { $n_satellites } satelita (w widoku: { $mean_in_view }){ "\u000A" }
        [few] pozycjonowanie 5G NTN przy { $r } MHz, C/N0 od { $r2 } do { $r3 } dB-Hz, { $n_satellites } satelity (w widoku: { $mean_in_view }){ "\u000A" }
        [many] pozycjonowanie 5G NTN przy { $r } MHz, C/N0 od { $r2 } do { $r3 } dB-Hz, { $n_satellites } satelitów (w widoku: { $mean_in_view }){ "\u000A" }
       *[other] pozycjonowanie 5G NTN przy { $r } MHz, C/N0 od { $r2 } do { $r3 } dB-Hz, { $n_satellites } satelity (w widoku: { $mean_in_view }){ "\u000A" }
    }

engine-leo-fusion-ntn-one-satellite-doppler-pass-samples =
    { $n_obs ->
        [one] { "  " }przelot Dopplera jednego satelity: { $n_obs } próbka w { $duration_s } s, błąd poziomy { $horizontal_error_m } m{ "\u000A" }
        [few] { "  " }przelot Dopplera jednego satelity: { $n_obs } próbki w { $duration_s } s, błąd poziomy { $horizontal_error_m } m{ "\u000A" }
        [many] { "  " }przelot Dopplera jednego satelity: { $n_obs } próbek w { $duration_s } s, błąd poziomy { $horizontal_error_m } m{ "\u000A" }
       *[other] { "  " }przelot Dopplera jednego satelity: { $n_obs } próbki w { $duration_s } s, błąd poziomy { $horizontal_error_m } m{ "\u000A" }
    }

engine-leo-fusion-ppp-ppp-convergence-to-horizontal-vertical =
    { $n_gnss ->
        [one] zbieżność PPP do { $criterion_horizontal_m } m w poziomie / { $criterion_vertical_m } m w pionie, przebiegi na przypadek: { $runs_per_case }, { $n_gnss } satelita GNSS{ "\u000A" }
        [few] zbieżność PPP do { $criterion_horizontal_m } m w poziomie / { $criterion_vertical_m } m w pionie, przebiegi na przypadek: { $runs_per_case }, { $n_gnss } satelity GNSS{ "\u000A" }
        [many] zbieżność PPP do { $criterion_horizontal_m } m w poziomie / { $criterion_vertical_m } m w pionie, przebiegi na przypadek: { $runs_per_case }, { $n_gnss } satelitów GNSS{ "\u000A" }
       *[other] zbieżność PPP do { $criterion_horizontal_m } m w poziomie / { $criterion_vertical_m } m w pionie, przebiegi na przypadek: { $runs_per_case }, { $n_gnss } satelity GNSS{ "\u000A" }
    }

engine-leo-fusion-pvt-kind-sats-at-km-mhz =
    { $n_satellites ->
        [one] { "  " }{ $name } { $role }: { $n_satellites } satelita na wysokości { $mean_altitude_km } km, { $sys } MHz{ $v6 }{ "\u000A" }
        [few] { "  " }{ $name } { $role }: { $n_satellites } satelity na wysokości { $mean_altitude_km } km, { $sys } MHz{ $v6 }{ "\u000A" }
        [many] { "  " }{ $name } { $role }: { $n_satellites } satelitów na wysokości { $mean_altitude_km } km, { $sys } MHz{ $v6 }{ "\u000A" }
       *[other] { "  " }{ $name } { $role }: { $n_satellites } satelity na wysokości { $mean_altitude_km } km, { $sys } MHz{ $v6 }{ "\u000A" }
    }

engine-leo-fusion-pvt-kind-doppler-fix-measurements-from-satellites =
    { $n_obs ->
        [one]
            { $n_sats ->
                [one] { "  " }wyznaczenie Dopplera: { $n_obs } pomiar z { $n_sats } satelity, błąd 3D { $error_3d_m } m (poziomy { $horizontal_error_m } m){ "\u000A" }
                [few] { "  " }wyznaczenie Dopplera: { $n_obs } pomiar z { $n_sats } satelitów, błąd 3D { $error_3d_m } m (poziomy { $horizontal_error_m } m){ "\u000A" }
                [many] { "  " }wyznaczenie Dopplera: { $n_obs } pomiar z { $n_sats } satelitów, błąd 3D { $error_3d_m } m (poziomy { $horizontal_error_m } m){ "\u000A" }
               *[other] { "  " }wyznaczenie Dopplera: { $n_obs } pomiar z { $n_sats } satelity, błąd 3D { $error_3d_m } m (poziomy { $horizontal_error_m } m){ "\u000A" }
            }
        [few]
            { $n_sats ->
                [one] { "  " }wyznaczenie Dopplera: { $n_obs } pomiary z { $n_sats } satelity, błąd 3D { $error_3d_m } m (poziomy { $horizontal_error_m } m){ "\u000A" }
                [few] { "  " }wyznaczenie Dopplera: { $n_obs } pomiary z { $n_sats } satelitów, błąd 3D { $error_3d_m } m (poziomy { $horizontal_error_m } m){ "\u000A" }
                [many] { "  " }wyznaczenie Dopplera: { $n_obs } pomiary z { $n_sats } satelitów, błąd 3D { $error_3d_m } m (poziomy { $horizontal_error_m } m){ "\u000A" }
               *[other] { "  " }wyznaczenie Dopplera: { $n_obs } pomiary z { $n_sats } satelity, błąd 3D { $error_3d_m } m (poziomy { $horizontal_error_m } m){ "\u000A" }
            }
        [many]
            { $n_sats ->
                [one] { "  " }wyznaczenie Dopplera: { $n_obs } pomiarów z { $n_sats } satelity, błąd 3D { $error_3d_m } m (poziomy { $horizontal_error_m } m){ "\u000A" }
                [few] { "  " }wyznaczenie Dopplera: { $n_obs } pomiarów z { $n_sats } satelitów, błąd 3D { $error_3d_m } m (poziomy { $horizontal_error_m } m){ "\u000A" }
                [many] { "  " }wyznaczenie Dopplera: { $n_obs } pomiarów z { $n_sats } satelitów, błąd 3D { $error_3d_m } m (poziomy { $horizontal_error_m } m){ "\u000A" }
               *[other] { "  " }wyznaczenie Dopplera: { $n_obs } pomiarów z { $n_sats } satelity, błąd 3D { $error_3d_m } m (poziomy { $horizontal_error_m } m){ "\u000A" }
            }
       *[other]
            { $n_sats ->
                [one] { "  " }wyznaczenie Dopplera: { $n_obs } pomiaru z { $n_sats } satelity, błąd 3D { $error_3d_m } m (poziomy { $horizontal_error_m } m){ "\u000A" }
                [few] { "  " }wyznaczenie Dopplera: { $n_obs } pomiaru z { $n_sats } satelitów, błąd 3D { $error_3d_m } m (poziomy { $horizontal_error_m } m){ "\u000A" }
                [many] { "  " }wyznaczenie Dopplera: { $n_obs } pomiaru z { $n_sats } satelitów, błąd 3D { $error_3d_m } m (poziomy { $horizontal_error_m } m){ "\u000A" }
               *[other] { "  " }wyznaczenie Dopplera: { $n_obs } pomiaru z { $n_sats } satelity, błąd 3D { $error_3d_m } m (poziomy { $horizontal_error_m } m){ "\u000A" }
            }
    }

engine-leo-fusion-pvt-kind-window-sats-3d-error =
    { $n_sats ->
        [one] { "    " }okno { $window_s } s: { $n_sats } satelita, błąd 3D { $f } m{ "\u000A" }
        [few] { "    " }okno { $window_s } s: { $n_sats } satelity, błąd 3D { $f } m{ "\u000A" }
        [many] { "    " }okno { $window_s } s: { $n_sats } satelitów, błąd 3D { $f } m{ "\u000A" }
       *[other] { "    " }okno { $window_s } s: { $n_sats } satelity, błąd 3D { $f } m{ "\u000A" }
    }

engine-live-io-kshana-live-dropped-udp-datagram =
    { $n ->
        [one] kshana live: odrzucono { $n } datagram udp, którego silnik nie mógł przyjąć (łącznie { $udp_dropped })
        [few] kshana live: odrzucono { $n } datagramy udp, których silnik nie mógł przyjąć (łącznie { $udp_dropped })
        [many] kshana live: odrzucono { $n } datagramów udp, których silnik nie mógł przyjąć (łącznie { $udp_dropped })
       *[other] kshana live: odrzucono { $n } datagramu udp, którego silnik nie mógł przyjąć (łącznie { $udp_dropped })
    }

engine-lunar-beacon-satellites-no-beacons =
    { $n_sats ->
        [one] { $n_sats } satelita, bez radiolatarni
        [few] { $n_sats } satelity, bez radiolatarni
        [many] { $n_sats } satelitów, bez radiolatarni
       *[other] { $n_sats } satelity, bez radiolatarni
    }

engine-lunar-beacon-satellites-no-beacons-2 =
    { $n_cmp ->
        [one] { $n_cmp } satelita, bez radiolatarni
        [few] { $n_cmp } satelity, bez radiolatarni
        [many] { $n_cmp } satelitów, bez radiolatarni
       *[other] { $n_cmp } satelity, bez radiolatarni
    }

engine-lunar-beacon-satellites-visible-beacons =
    { $n_sats ->
        [one]
            { $n_vis_beacons ->
                [one] { $n_sats } satelita + { $n_vis_beacons } widoczna radiolatarnia
                [few] { $n_sats } satelita + { $n_vis_beacons } widoczne radiolatarnie
                [many] { $n_sats } satelita + { $n_vis_beacons } widocznych radiolatarni
               *[other] { $n_sats } satelita + { $n_vis_beacons } widocznej radiolatarni
            }
        [few]
            { $n_vis_beacons ->
                [one] { $n_sats } satelity + { $n_vis_beacons } widoczna radiolatarnia
                [few] { $n_sats } satelity + { $n_vis_beacons } widoczne radiolatarnie
                [many] { $n_sats } satelity + { $n_vis_beacons } widocznych radiolatarni
               *[other] { $n_sats } satelity + { $n_vis_beacons } widocznej radiolatarni
            }
        [many]
            { $n_vis_beacons ->
                [one] { $n_sats } satelitów + { $n_vis_beacons } widoczna radiolatarnia
                [few] { $n_sats } satelitów + { $n_vis_beacons } widoczne radiolatarnie
                [many] { $n_sats } satelitów + { $n_vis_beacons } widocznych radiolatarni
               *[other] { $n_sats } satelitów + { $n_vis_beacons } widocznej radiolatarni
            }
       *[other]
            { $n_vis_beacons ->
                [one] { $n_sats } satelity + { $n_vis_beacons } widoczna radiolatarnia
                [few] { $n_sats } satelity + { $n_vis_beacons } widoczne radiolatarnie
                [many] { $n_sats } satelity + { $n_vis_beacons } widocznych radiolatarni
               *[other] { $n_sats } satelity + { $n_vis_beacons } widocznej radiolatarni
            }
    }

engine-main-ok-kind-resolves-and-all =
    { $n_required ->
        [one] ok: { $kind } — kind jest rozpoznany i jedyny z jego opublikowanych wpisów wymaganych pól ({ $n_required }) jest spełniony; wartości pól nie są sprawdzane
        [few] ok: { $kind } — kind jest rozpoznany i wszystkie { $n_required } z jego opublikowanych wpisów wymaganych pól są spełnione; wartości pól nie są sprawdzane
        [many] ok: { $kind } — kind jest rozpoznany i wszystkie { $n_required } z jego opublikowanych wpisów wymaganych pól są spełnione; wartości pól nie są sprawdzane
       *[other] ok: { $kind } — kind jest rozpoznany i wszystkie { $n_required } z jego opublikowanych wpisów wymaganych pól są spełnione; wartości pól nie są sprawdzane
    }

engine-mars-pnt-mars-pnt-user-clock-relays =
    { $n_relays ->
        [one] mars-pnt { $r } | użytkownik { $user }, zegar { $clock_class } | { $n_relays } przekaźnik (średnio { $mean_relays_in_view } w widoku) | zbieżny RMS położenia { $converged_pos_rms_m } m, formalne 1σ { $converged_pos_sigma_m } m (3σ { $converged_pos_3sigma_m } m — miara jakości z kowariancji, nie certyfikowany poziom ochrony) | σ częstotliwości zegara { $final_clock_freq_sigma } | cov-PD { $covariance_pd_throughout }
        [few] mars-pnt { $r } | użytkownik { $user }, zegar { $clock_class } | { $n_relays } przekaźniki (średnio { $mean_relays_in_view } w widoku) | zbieżny RMS położenia { $converged_pos_rms_m } m, formalne 1σ { $converged_pos_sigma_m } m (3σ { $converged_pos_3sigma_m } m — miara jakości z kowariancji, nie certyfikowany poziom ochrony) | σ częstotliwości zegara { $final_clock_freq_sigma } | cov-PD { $covariance_pd_throughout }
        [many] mars-pnt { $r } | użytkownik { $user }, zegar { $clock_class } | { $n_relays } przekaźników (średnio { $mean_relays_in_view } w widoku) | zbieżny RMS położenia { $converged_pos_rms_m } m, formalne 1σ { $converged_pos_sigma_m } m (3σ { $converged_pos_3sigma_m } m — miara jakości z kowariancji, nie certyfikowany poziom ochrony) | σ częstotliwości zegara { $final_clock_freq_sigma } | cov-PD { $covariance_pd_throughout }
       *[other] mars-pnt { $r } | użytkownik { $user }, zegar { $clock_class } | { $n_relays } przekaźnika (średnio { $mean_relays_in_view } w widoku) | zbieżny RMS położenia { $converged_pos_rms_m } m, formalne 1σ { $converged_pos_sigma_m } m (3σ { $converged_pos_3sigma_m } m — miara jakości z kowariancji, nie certyfikowany poziom ochrony) | σ częstotliwości zegara { $final_clock_freq_sigma } | cov-PD { $covariance_pd_throughout }
    }

engine-e-mcda-copras-copras-weights-but-criterion-types =
    { $n ->
        [one] COPRAS: { $n } waga, ale typy kryteriów: { $types }
        [few] COPRAS: { $n } wagi, ale typy kryteriów: { $types }
        [many] COPRAS: { $n } wag, ale typy kryteriów: { $types }
       *[other] COPRAS: { $n } wagi, ale typy kryteriów: { $types }
    }

engine-e-mcda-moora-moora-weights-but-criterion-types =
    { $n ->
        [one] MOORA: { $n } waga, ale typy kryteriów: { $types }
        [few] MOORA: { $n } wagi, ale typy kryteriów: { $types }
        [many] MOORA: { $n } wag, ale typy kryteriów: { $types }
       *[other] MOORA: { $n } wagi, ale typy kryteriów: { $types }
    }

engine-e-mcda-topsis-topsis-weights-but-criterion-types =
    { $n ->
        [one] TOPSIS: { $n } waga, ale typy kryteriów: { $types }
        [few] TOPSIS: { $n } wagi, ale typy kryteriów: { $types }
        [many] TOPSIS: { $n } wag, ale typy kryteriów: { $types }
       *[other] TOPSIS: { $n } wagi, ale typy kryteriów: { $types }
    }

engine-e-mcda-vikor-vikor-weights-but-criterion-types =
    { $n ->
        [one] VIKOR: { $n } waga, ale typy kryteriów: { $types }
        [few] VIKOR: { $n } wagi, ale typy kryteriów: { $types }
        [many] VIKOR: { $n } wag, ale typy kryteriów: { $types }
       *[other] VIKOR: { $n } wagi, ale typy kryteriów: { $types }
    }

engine-e-mcda-waspas-waspas-weights-but-criterion-types =
    { $n ->
        [one] WASPAS: { $n } waga, ale typy kryteriów: { $types }
        [few] WASPAS: { $n } wagi, ale typy kryteriów: { $types }
        [many] WASPAS: { $n } wag, ale typy kryteriów: { $types }
       *[other] WASPAS: { $n } wagi, ale typy kryteriów: { $types }
    }

engine-e-mcda-wpm-wpm-weights-but-criterion-types =
    { $n ->
        [one] WPM: { $n } waga, ale typy kryteriów: { $types }
        [few] WPM: { $n } wagi, ale typy kryteriów: { $types }
        [many] WPM: { $n } wag, ale typy kryteriów: { $types }
       *[other] WPM: { $n } wagi, ale typy kryteriów: { $types }
    }

engine-e-mcda-promethee-promethee-ii-weights-but-types =
    { $n ->
        [one] PROMETHEE II: { $n } waga, ale typy: { $types } / funkcje preferencji: { $prefs }
        [few] PROMETHEE II: { $n } wagi, ale typy: { $types } / funkcje preferencji: { $prefs }
        [many] PROMETHEE II: { $n } wag, ale typy: { $types } / funkcje preferencji: { $prefs }
       *[other] PROMETHEE II: { $n } wagi, ale typy: { $types } / funkcje preferencji: { $prefs }
    }

engine-e-mcda-copras-copras-alternative-has-values-but =
    { $n ->
        [one] COPRAS: alternatywa { $i } ma wartości: { $row }, a jest { $n } kryterium
        [few] COPRAS: alternatywa { $i } ma wartości: { $row }, a są { $n } kryteria
        [many] COPRAS: alternatywa { $i } ma wartości: { $row }, a jest { $n } kryteriów
       *[other] COPRAS: alternatywa { $i } ma wartości: { $row }, a jest { $n } kryterium
    }

engine-e-mcda-electre-electre-alternative-has-values-but =
    { $n ->
        [one] ELECTRE I: alternatywa { $i } ma wartości: { $row }, a jest { $n } kryterium
        [few] ELECTRE I: alternatywa { $i } ma wartości: { $row }, a są { $n } kryteria
        [many] ELECTRE I: alternatywa { $i } ma wartości: { $row }, a jest { $n } kryteriów
       *[other] ELECTRE I: alternatywa { $i } ma wartości: { $row }, a jest { $n } kryterium
    }

engine-e-mcda-moora-moora-alternative-has-values-but =
    { $n ->
        [one] MOORA: alternatywa { $i } ma wartości: { $row }, a jest { $n } kryterium
        [few] MOORA: alternatywa { $i } ma wartości: { $row }, a są { $n } kryteria
        [many] MOORA: alternatywa { $i } ma wartości: { $row }, a jest { $n } kryteriów
       *[other] MOORA: alternatywa { $i } ma wartości: { $row }, a jest { $n } kryterium
    }

engine-e-mcda-promethee-promethee-ii-alternative-has-values =
    { $n ->
        [one] PROMETHEE II: alternatywa { $i } ma wartości: { $row }, a jest { $n } kryterium
        [few] PROMETHEE II: alternatywa { $i } ma wartości: { $row }, a są { $n } kryteria
        [many] PROMETHEE II: alternatywa { $i } ma wartości: { $row }, a jest { $n } kryteriów
       *[other] PROMETHEE II: alternatywa { $i } ma wartości: { $row }, a jest { $n } kryterium
    }

engine-e-mcda-topsis-topsis-alternative-has-values-but =
    { $n ->
        [one] TOPSIS: alternatywa { $i } ma wartości: { $row }, a jest { $n } kryterium
        [few] TOPSIS: alternatywa { $i } ma wartości: { $row }, a są { $n } kryteria
        [many] TOPSIS: alternatywa { $i } ma wartości: { $row }, a jest { $n } kryteriów
       *[other] TOPSIS: alternatywa { $i } ma wartości: { $row }, a jest { $n } kryterium
    }

engine-e-mcda-vikor-vikor-alternative-has-values-but =
    { $n ->
        [one] VIKOR: alternatywa { $i } ma wartości: { $row }, a jest { $n } kryterium
        [few] VIKOR: alternatywa { $i } ma wartości: { $row }, a są { $n } kryteria
        [many] VIKOR: alternatywa { $i } ma wartości: { $row }, a jest { $n } kryteriów
       *[other] VIKOR: alternatywa { $i } ma wartości: { $row }, a jest { $n } kryterium
    }

engine-e-mcda-waspas-waspas-alternative-has-values-but =
    { $n ->
        [one] WASPAS: alternatywa { $i } ma wartości: { $row }, a jest { $n } kryterium
        [few] WASPAS: alternatywa { $i } ma wartości: { $row }, a są { $n } kryteria
        [many] WASPAS: alternatywa { $i } ma wartości: { $row }, a jest { $n } kryteriów
       *[other] WASPAS: alternatywa { $i } ma wartości: { $row }, a jest { $n } kryterium
    }

engine-e-mcda-wpm-wpm-alternative-has-values-but =
    { $n ->
        [one] WPM: alternatywa { $i } ma wartości: { $row }, a jest { $n } kryterium
        [few] WPM: alternatywa { $i } ma wartości: { $row }, a są { $n } kryteria
        [many] WPM: alternatywa { $i } ma wartości: { $row }, a jest { $n } kryteriów
       *[other] WPM: alternatywa { $i } ma wartości: { $row }, a jest { $n } kryterium
    }

engine-e-mcda-wsm-alternative-has-values-but-there =
    { $n ->
        [one] alternatywa '{ $name }' ma wartości: { $values }, a jest { $n } kryterium
        [few] alternatywa '{ $name }' ma wartości: { $values }, a są { $n } kryteria
        [many] alternatywa '{ $name }' ma wartości: { $values }, a jest { $n } kryteriów
       *[other] alternatywa '{ $name }' ma wartości: { $values }, a jest { $n } kryterium
    }

engine-e-naif-kernel-daf-summary-record-claims-summaries =
    { $count ->
        [one] rekord podsumowań DAF { $rec } deklaruje { $count } podsumowanie
        [few] rekord podsumowań DAF { $rec } deklaruje { $count } podsumowania
        [many] rekord podsumowań DAF { $rec } deklaruje { $count } podsumowań
       *[other] rekord podsumowań DAF { $rec } deklaruje { $count } podsumowania
    }

engine-nmea-synth-gen-the-receiver-reports-fix-again =
    { $n_used ->
        [one] odbiornik znów podaje rozwiązanie (użyto { $n_used } satelity)
        [few] odbiornik znów podaje rozwiązanie (użyto { $n_used } satelitów)
        [many] odbiornik znów podaje rozwiązanie (użyto { $n_used } satelitów)
       *[other] odbiornik znów podaje rozwiązanie (użyto { $n_used } satelity)
    }

engine-nmea-synth-gen-the-receiver-has-no-fix =
    { $n_used ->
        [one] odbiornik nie ma rozwiązania ({ $n_used } użyteczny satelita, potrzebne cztery)
        [few] odbiornik nie ma rozwiązania ({ $n_used } użyteczne satelity, potrzebne cztery)
        [many] odbiornik nie ma rozwiązania ({ $n_used } użytecznych satelitów, potrzebne cztery)
       *[other] odbiornik nie ma rozwiązania ({ $n_used } użytecznego satelity, potrzebne cztery)
    }

engine-observability-gramian-gdop-undefined-rank-deficient-singular =
    { $n ->
        [one] GDOP nieokreślony (geometria o niepełnej randze / osobliwa): ranga { $rank } z { $n } stanu, defekt datum { $v3 }, uwarunkowanie { $v4 }
        [few] GDOP nieokreślony (geometria o niepełnej randze / osobliwa): ranga { $rank } z { $n } stanów, defekt datum { $v3 }, uwarunkowanie { $v4 }
        [many] GDOP nieokreślony (geometria o niepełnej randze / osobliwa): ranga { $rank } z { $n } stanów, defekt datum { $v3 }, uwarunkowanie { $v4 }
       *[other] GDOP nieokreślony (geometria o niepełnej randze / osobliwa): ranga { $rank } z { $n } stanu, defekt datum { $v3 }, uwarunkowanie { $v4 }
    }

engine-oem-oem-interop-round-tripped-segment =
    { $n_states_total ->
        [one] oem-interop: segmenty przeprowadzone w obie strony: { $segments }, { $n_states_total } stan; maks. błąd obiegu { $p } km / { $v } km/s (interop MODELLED)
        [few] oem-interop: segmenty przeprowadzone w obie strony: { $segments }, { $n_states_total } stany; maks. błąd obiegu { $p } km / { $v } km/s (interop MODELLED)
        [many] oem-interop: segmenty przeprowadzone w obie strony: { $segments }, { $n_states_total } stanów; maks. błąd obiegu { $p } km / { $v } km/s (interop MODELLED)
       *[other] oem-interop: segmenty przeprowadzone w obie strony: { $segments }, { $n_states_total } stanu; maks. błąd obiegu { $p } km / { $v } km/s (interop MODELLED)
    }

engine-oem-oem-interop-ingested-segment-states =
    { $n_states_total ->
        [one] oem-interop: wczytane segmenty: { $segments }, { $n_states_total } stan z zewnętrznego OEM (nadawca { $originator }) (interop MODELLED)
        [few] oem-interop: wczytane segmenty: { $segments }, { $n_states_total } stany z zewnętrznego OEM (nadawca { $originator }) (interop MODELLED)
        [many] oem-interop: wczytane segmenty: { $segments }, { $n_states_total } stanów z zewnętrznego OEM (nadawca { $originator }) (interop MODELLED)
       *[other] oem-interop: wczytane segmenty: { $segments }, { $n_states_total } stanu z zewnętrznego OEM (nadawca { $originator }) (interop MODELLED)
    }

engine-pvt-pvt-sat-nav-epochs-solved =
    { $n_satellites_nav ->
        [one] pvt { $r } | { $n_satellites_nav } satelita nawigacyjny | rozwiązane epoki: { $epochs_solved }/{ $epochs_total } | średnio satelitów { $mean_n_used }, PDOP { $mean_pdop }{ $acc }
        [few] pvt { $r } | { $n_satellites_nav } satelity nawigacyjne | rozwiązane epoki: { $epochs_solved }/{ $epochs_total } | średnio satelitów { $mean_n_used }, PDOP { $mean_pdop }{ $acc }
        [many] pvt { $r } | { $n_satellites_nav } satelitów nawigacyjnych | rozwiązane epoki: { $epochs_solved }/{ $epochs_total } | średnio satelitów { $mean_n_used }, PDOP { $mean_pdop }{ $acc }
       *[other] pvt { $r } | { $n_satellites_nav } satelity nawigacyjnego | rozwiązane epoki: { $epochs_solved }/{ $epochs_total } | średnio satelitów { $mean_n_used }, PDOP { $mean_pdop }{ $acc }
    }

engine-receiver-trust-geometry-geometry-hdop-pdop-vdop-satellites =
    { $n_used ->
        [one] geometria { $label }: HDOP { $fmt_dop }, PDOP { $fmt_dop2 }, VDOP { $fmt_dop3 }, { $n_used } satelita{ $v6 }
        [few] geometria { $label }: HDOP { $fmt_dop }, PDOP { $fmt_dop2 }, VDOP { $fmt_dop3 }, { $n_used } satelity{ $v6 }
        [many] geometria { $label }: HDOP { $fmt_dop }, PDOP { $fmt_dop2 }, VDOP { $fmt_dop3 }, { $n_used } satelitów{ $v6 }
       *[other] geometria { $label }: HDOP { $fmt_dop }, PDOP { $fmt_dop2 }, VDOP { $fmt_dop3 }, { $n_used } satelity{ $v6 }
    }

engine-receiver-trust-geometry-derived-from-logged-satellites =
    { $n ->
        [one] wyznaczone z { $n } zapisanego satelity
        [few] wyznaczone z { $n } zapisanych satelitów
        [many] wyznaczone z { $n } zapisanych satelitów
       *[other] wyznaczone z { $n } zapisanego satelity
    }

engine-receiver-trust-geometry-as-the-receiver-reports-it =
    { $n ->
        [one] tak, jak zgłasza odbiornik, użyto { $n } satelity
        [few] tak, jak zgłasza odbiornik, użyto { $n } satelitów
        [many] tak, jak zgłasza odbiornik, użyto { $n } satelitów
       *[other] tak, jak zgłasza odbiornik, użyto { $n } satelity
    }

engine-receiver-trust-geometry-satellites-fewer-than =
    { $n ->
        [one] { $n } satelita, mniej niż { $min_used }
        [few] { $n } satelity, mniej niż { $min_used }
        [many] { $n } satelitów, mniej niż { $min_used }
       *[other] { $n } satelity, mniej niż { $min_used }
    }

engine-e-receiver-trust-machines-imu-fit-the-log-has-samples-at =
    { $n ->
        [one] zapis ma { $n } próbkę; do dopasowania Allana potrzeba co najmniej { $MIN_SAMPLES }
        [few] zapis ma { $n } próbki; do dopasowania Allana potrzeba co najmniej { $MIN_SAMPLES }
        [many] zapis ma { $n } próbek; do dopasowania Allana potrzeba co najmniej { $MIN_SAMPLES }
       *[other] zapis ma { $n } próbki; do dopasowania Allana potrzeba co najmniej { $MIN_SAMPLES }
    }

engine-e-scenario-time-grid-too-large-steps =
    { $n ->
        [one] siatka czasu jest zbyt duża: { $n } krok przekracza MAX_TIME_STEPS ({ $MAX_TIME_STEPS }); użyj grubszego kroku lub krótszego czasu trwania
        [few] siatka czasu jest zbyt duża: { $n } kroki przekraczają MAX_TIME_STEPS ({ $MAX_TIME_STEPS }); użyj grubszego kroku lub krótszego czasu trwania
        [many] siatka czasu jest zbyt duża: { $n } kroków przekracza MAX_TIME_STEPS ({ $MAX_TIME_STEPS }); użyj grubszego kroku lub krótszego czasu trwania
       *[other] siatka czasu jest zbyt duża: { $n } kroku przekracza MAX_TIME_STEPS ({ $MAX_TIME_STEPS }); użyj grubszego kroku lub krótszego czasu trwania
    }

engine-slot-timing-fitted-to-the-overlapping-allan =
    { $n_samples ->
        [one] dopasowano do nakładającego się odchylenia Allana zapisu o { $n_samples } próbce przy { $tau0_s } s, w bazie modulacji częstotliwości IEEE Std 1139
        [few] dopasowano do nakładającego się odchylenia Allana zapisu o { $n_samples } próbkach przy { $tau0_s } s, w bazie modulacji częstotliwości IEEE Std 1139
        [many] dopasowano do nakładającego się odchylenia Allana zapisu o { $n_samples } próbkach przy { $tau0_s } s, w bazie modulacji częstotliwości IEEE Std 1139
       *[other] dopasowano do nakładającego się odchylenia Allana zapisu o { $n_samples } próbki przy { $tau0_s } s, w bazie modulacji częstotliwości IEEE Std 1139
    }

engine-solar-system-solar-system-at-jd-tdb =
    { $n_bodies ->
        [one] Układ Słoneczny dla { $input } (JD { $jd_tdb } TDB), { $n_bodies } ciało, obserwator { $observer }
            { "  " }{ $standish_table }{ "\u000A" }
        [few] Układ Słoneczny dla { $input } (JD { $jd_tdb } TDB), { $n_bodies } ciała, obserwator { $observer }
            { "  " }{ $standish_table }{ "\u000A" }
        [many] Układ Słoneczny dla { $input } (JD { $jd_tdb } TDB), { $n_bodies } ciał, obserwator { $observer }
            { "  " }{ $standish_table }{ "\u000A" }
       *[other] Układ Słoneczny dla { $input } (JD { $jd_tdb } TDB), { $n_bodies } ciała, obserwator { $observer }
            { "  " }{ $standish_table }{ "\u000A" }
    }

engine-e-space-packet-cuc-fine-does-not-fit =
    { $n ->
        [one] CUC część drobna { $fine } nie mieści się w { $n } oktecie
        [few] CUC część drobna { $fine } nie mieści się w { $n } oktetach
        [many] CUC część drobna { $fine } nie mieści się w { $n } oktetach
       *[other] CUC część drobna { $fine } nie mieści się w { $n } oktetu
    }

engine-space-packet-space-packet-framed-ccsds-133 =
    { $packet_count ->
        [one] space-packet: zaramkowano { $packet_count } pakiet CCSDS-133.0 ({ $v2 }), APID { $apid }, łącznie { $total_bytes } oktetów, obieg dokładny ({ $round_trip_ok })
        [few] space-packet: zaramkowano { $packet_count } pakiety CCSDS-133.0 ({ $v2 }), APID { $apid }, łącznie { $total_bytes } oktetów, obieg dokładny ({ $round_trip_ok })
        [many] space-packet: zaramkowano { $packet_count } pakietów CCSDS-133.0 ({ $v2 }), APID { $apid }, łącznie { $total_bytes } oktetów, obieg dokładny ({ $round_trip_ok })
       *[other] space-packet: zaramkowano { $packet_count } pakietu CCSDS-133.0 ({ $v2 }), APID { $apid }, łącznie { $total_bytes } oktetów, obieg dokładny ({ $round_trip_ok })
    }

engine-e-spk-writer-states-for-epochs =
    { $n ->
        [one] stanów: { $states }, dla { $n } epoki
        [few] stanów: { $states }, dla { $n } epok
        [many] stanów: { $states }, dla { $n } epok
       *[other] stanów: { $states }, dla { $n } epoki
    }

engine-e-spk-writer-states-degree-needs =
    { $n ->
        [one] { $n } stan; stopień { $degree } wymaga { $value }
        [few] { $n } stany; stopień { $degree } wymaga { $value }
        [many] { $n } stanów; stopień { $degree } wymaga { $value }
       *[other] { $n } stanu; stopień { $degree } wymaga { $value }
    }

engine-e-spk-writer-epochs-for-difference-lines =
    { $n ->
        [one] epok: { $epochs }, dla { $n } wiersza różnic
        [few] epok: { $epochs }, dla { $n } wierszy różnic
        [many] epok: { $epochs }, dla { $n } wierszy różnic
       *[other] epok: { $epochs }, dla { $n } wiersza różnic
    }

engine-e-sweep-sweep-key-index-is-past =
    { $n ->
        [one] klucz przemiatania `{ $key }`: indeks { $i } wykracza poza { $n } wpis tablicy
        [few] klucz przemiatania `{ $key }`: indeks { $i } wykracza poza { $n } wpisy tablicy
        [many] klucz przemiatania `{ $key }`: indeks { $i } wykracza poza { $n } wpisów tablicy
       *[other] klucz przemiatania `{ $key }`: indeks { $i } wykracza poza { $n } wpisu tablicy
    }

engine-telemetry-cli-warning-mqtt-messages-were-not =
    { $n ->
        [one] ostrzeżenie: { $n } wiadomość MQTT nie została dostarczona
        [few] ostrzeżenie: { $n } wiadomości MQTT nie zostały dostarczone
        [many] ostrzeżenie: { $n } wiadomości MQTT nie zostało dostarczonych
       *[other] ostrzeżenie: { $n } wiadomości MQTT nie zostało dostarczonych
    }

## legal

# legal: native review
engine-legal-compliance-statement = Wiersz oznaczony jako „evidenced” oznacza, że uruchomienie z tego zestawu dostarcza dowodów na możliwości wymienione w tym wierszu. Nie jest to stwierdzenie, że wymagania ram odniesienia są spełnione, i nie oznacza, że jakikolwiek produkt został przez kogokolwiek oceniony lub zatwierdzony. Kolumna luk wskazuje, czego uruchomienia nie pokazują.

# legal: native review
engine-legal-bench-surface-notice = Wyłącznie ruch pojazdu i oznaczone przedziały zdarzeń. Nic, co tu wyeksportowano, nie jest sygnałem radiowym ani sygnałem w paśmie podstawowym, nie modeluje takiego sygnału ani nie steruje nim, a zdarzenie jest przedziałem czasu, a nie przepisem na wytworzenie zakłóceń. Sygnały dostarczają symulator laboratoryjny i jego operator, którzy odpowiadają za uruchamianie ich wyłącznie tam, gdzie jest to dozwolone (w trybie przewodowym lub w ekranowaniu, zgodnie z instrukcjami bezpieczeństwa samego symulatora). Kshana nie publikuje żadnych wyników takich uruchomień.

# legal: native review
engine-legal-iq-campaign-roc-statement = MODELLED: krzywa ROC na poziomie okien dla każdego monitora na podanych nagraniach. Każde podane okno zdarzenia jest pozytywne, a każde okno roc_window_s poza zdarzeniami negatywne; okno liczy się przy progu, gdy statystyka testowa monitora osiąga go w tym oknie. P_fa jest na okno negatywne, nie na test.

# legal: native review
engine-legal-lunanet-afs-advisory = Wyłącznie doradczo: wynik analizy z narzędzia badawczo-inżynieryjnego; nie jest to sprzęt nawigacyjny z zatwierdzeniem typu ani usługa bezpieczeństwa życia. Sprawdza strumień symboli względem jednej edycji opublikowanej specyfikacji i nic nie mówi o żadnym węźle ani usłudze LunaNet.

# legal: native review
engine-legal-iqfit-statement = MODELLED: każda dopasowana liczba opisuje otwarty odbiornik (wskazany projekt pętli i tor wejściowy) na podanych mu nagraniach, dopasowana do ocenionych wyników kampanii. Nie jest pomiarem żadnego innego odbiornika. Prognozy są oznaczone PREDICTION, z najbliższym testowanym nagraniem i odległością poza testowanymi warunkami.

# legal: native review
engine-legal-iqfit-advisory = Wyłącznie doradczo: wynik analizy, nie jest to sprzęt nawigacyjny z zatwierdzeniem typu; prognozy są wynikami modelu ze wskazanym błędem, a nie gwarancjami.

# legal: native review
engine-legal-lunar-time-lab-source-statement = Oświadczenie o źródle, nie twierdzenie: materiały ICG WG-B Lunar PNT z czerwca 2024 (unoosa.org, LunarPNT_Jun24_01_04.pdf, źródło S3 badania) opisują laboratorium księżycowego wzorca czasu przy stacji z celem czasowym na poziomie nanosekund. Kshana cytuje ten cel wyłącznie dla kontekstu; nie przyjmuje go, a nic w tym bloku nie wskazuje, że jakikolwiek rzeczywisty zegar stacji go spełnia.

# legal: native review
engine-legal-standards-pack-notice = Pakiet standardów mierzy modelowane scenariusze względem progów podanych przed uruchomieniem. Dostarcza dowodów na wiersze ram odniesienia, które wymienia; nie ocenia ani nie zatwierdza żadnego produktu, a próg oznaczony MET mówi jedynie, że modelowany wynik scenariusza spełnił podany próg.

# legal: native review
engine-legal-standards-pack-advisory = Wyłącznie doradczo: wynik analizy z narzędzia badawczo-inżynieryjnego; nie jest to sprzęt nawigacyjny z zatwierdzeniem typu ani usługa bezpieczeństwa życia; nie może być jedyną podstawą żadnej decyzji nawigacyjnej ani dotyczącej bezpieczeństwa.

# legal: native review
engine-legal-geometry-statement = Geometria przy podanym modelu błędu (MODELLED): widoczność w linii wzroku względem podanej linii horyzontu, rozmycie dokładności (DOP) i gaussowska elipsa błędu dla niezależnych, równych, zerowo-średnich gaussowskich błędów odległości o podanym równoważnym błędzie odległości użytkownika. Nie jest to prognoza rzeczywistego błędu odbiornika, który ma także błędy systematyczne, wielodrogowość i błędy bez linii widzenia, i nie jest to granica integralności. Konstelacje predefiniowane są geometrią reprezentatywną, a nie niebem z danej daty w danym miejscu.

# legal: native review
engine-legal-resilience-disclaimer = Samoocena oparta na symulacji, odniesiona do DHS RPCF v2.0. Nie jest to certyfikacja ani akredytacja i nie reprezentuje zatwierdzenia przez żaden organ (DHS, IEEE ani inny). Każdy podwynik jest MODELLED, chyba że wyraźnie oznaczono go jako VALIDATED, a wyniki są miarami jakości w dziedzinie czasu i detekcji, a nie dokładnością w dziedzinie pozycji.

# legal: native review
engine-legal-observatory-notice = Komórka oznaczona jako pogorszona oznacza, że duża część statków powietrznych zgłosiła tam danego dnia niską dokładność nawigacji. Nie przypisuje się żadnej przyczyny. Komórka nieobserwowana lub nieobecna nie była oceniana, co nie jest tym samym co komórka czysta. Wyłącznie doradczo: to nie jest zatwierdzenie, certyfikacja ani oświadczenie o zgodności.

# legal: native review
engine-legal-receiver-trust-advisory = Oprogramowanie wyłącznie doradcze, nie jest to sprzęt nawigacyjny z zatwierdzeniem typu (IEC 61108, IEC 61162): za nawigację statku odpowiada nadal operator.

# legal: native review
engine-legal-evidence-roundtrip-notice = Łączy cztery rekordy przez skrót (hash): scenariusz, podane przez laboratorium warunki testu, log odbiornika oraz ocenę tego logu względem podanych zdarzeń. Nie jest sygnałem, nie jest przepisem na odtworzenie i nie jest certyfikacją. To, w jaki sposób ruch ze scenariusza dotarł do odbiornika (plik odtworzony przez symulator laboratoryjny, w trybie przewodowym lub w ekranowaniu), było odpowiedzialnością operatora i jest tu zapisane wyłącznie tak, jak zostało podane.

# legal: native review
engine-legal-evidence-bundle-disclaimer = Ten pakiet jest zapisem technicznym tego, co silnik Kshana obliczył na podstawie podanego logu odbiornika przy podanej konfiguracji. Nie jest opinią prawną, nie jest ustaleniem faktów dotyczących żadnego zdarzenia ani jego przyczyny i nie jest certyfikacją.

# legal: native review
engine-legal-bench-notice = Wyłącznie doradczo: modelowane lub mierzone względem podanych wzorców; nie jest to zatwierdzenie, certyfikacja ani oświadczenie o zgodności. Wynik opisuje log lub korpus, nigdy produkt.

# legal: native review
engine-legal-osnma-advisory = Wyłącznie doradczo: to wynik analizy i monitorowania, a nie sprzęt nawigacyjny z zatwierdzeniem typu. Podany tu stan uwierzytelniania nie jest usługą integralności nawigacji i nie może być jedyną podstawą żadnej decyzji nawigacyjnej ani dotyczącej bezpieczeństwa.

## added in the 0.40 delta

engine-campaign-sweep-of-over-nodes-each-percentile-band = przemiatanie `{ $scenario_kind }` po { $axis_order } (węzły: { $nodes }, mediana z pasmem percentyli 5.-95. dla ziaren (seed): { $n_runs }; każda linia we własnym zakresie)

engine-holdover-test-holdover-not-recovered-within-record = holdover-test: holdover { $hold } s, max|TE| { $max_abs } ns; { $masks }; brak powrotu w obrębie zapisu (MODELLED, zmierzone względem maski)

engine-holdover-test-holdover-recovered-after-gnss-returned = holdover-test: holdover { $hold } s, max|TE| { $max_abs } ns; { $masks }; powrót po { $t } s od odzyskania GNSS (MODELLED, zmierzone względem maski)

engine-iq-cli-scene-written-by-kshana-iq-scene-integer-scale = zapisane przez kshana iq scene: scena SYMULOWANA, a nie nagranie; skala całkowitoliczbowa: 1 LSB = { $sc } jednostek znormalizowanych do szumu (oczekiwane RMS { $v1 } LSB na składową), obcięte elementy: { $clipped }

engine-iq-cli-scene-written-by-kshana-iq-scene-2-integer-scale = zapisane przez kshana iq scene; skala całkowitoliczbowa: 1 LSB = { $sc } jednostek znormalizowanych do szumu (oczekiwane RMS { $v1 } LSB na składową), obcięte elementy: { $clipped }

engine-iq-cli-scene-wrote-samples-hz-to-truth-integer-scale = zapisano próbek: { $samples } ({ $format }, { $fs_hz } Hz) do { $data_path }; rekordów prawdy odniesienia: { $truth_records } do { $truth_path }; { $meta_note }; kanał: { $chan_desc }; skala całkowitoliczbowa: 1 LSB = { $sc } jednostek znormalizowanych do szumu (oczekiwane RMS { $v1 } LSB na składową), obcięte elementy: { $clipped }

engine-lunar-chart-title = HPL na południowym biegunie Księżyca (dostępność { $availability }%, AL { $al } m, σ_URE { $sigma } m)

engine-lunar-beacon-chart-title = Wzmocnienie radiolatarniami powierzchniowymi — PDOP według konfiguracji

engine-lunar-beacon-chart-pdop = PDOP { $pdop }

engine-lunar-beacon-chart-no-solution = brak rozwiązania

engine-lunar-beacon-chart-footnote = mniej znaczy lepiej; sigma_URE na radiolatarnię { $sigma } m, maska { $mask } deg

engine-lunar-combination-chart-title = Księżycowe łączne OD + zegar — błąd położenia stacji 3-D (VLBI przywraca obserwowalność)

engine-lunar-combination-chart-subtitle = satelity: { $n_sat }, stacje ziemskie: { $n_earth } · współczynnik poprawy { $factor }×

engine-lunar-combination-chart-with-vlbi = z VLBI: { $m } m

engine-lunar-combination-chart-range-only = tylko odległość: { $m } m

engine-lunar-combination-chart-axis-note = log10 błędu stacji (m); zbieżność z/bez = { $with }/{ $without }

engine-lunar-dpnt-chart-title = Księżycowy różnicowy PNT — satelity: { $n_sats }: błąd po korekcji a baza (redukcja × { $factor } przy { $km } km)

engine-lunar-dpnt-chart-subtitle = bez korekcji { $uncorrected } m | po korekcji { $corrected } m | HPL { $hpl } m (σ_resid { $sigma } m) | { $label }

engine-lunar-dpnt-chart-uncorrected-standalone = bez korekcji (autonomicznie)

engine-lunar-dpnt-chart-baseline-km = baza (km)

engine-lunar-dpnt-chart-err-m = błąd (m)

engine-lunar-frame-realise-chart-title = Realizacja księżycowego układu odniesienia — odzyskiwanie 7-parametrowej transformacji Helmerta

engine-lunar-frame-realise-chart-subtitle = punkty: { $n_points } · reszta RMS { $rms } m · zbieżność: { $converged }

engine-lunar-frame-realise-chart-scale = skala (ppb)

engine-lunar-frame-realise-chart-row = { $label }: wprowadzone { $inj } { $unit } · odzyskane { $rec } { $unit } · błąd { $err }

engine-lunar-interop-chart-title = Eksport interoperacyjności księżycowej — CCSDS OEM + KIF (zgodny z założeniami LunaNet/IOAG)

engine-lunar-interop-chart-header = REF_FRAME = { $frame } | TIME_SYSTEM = { $time_system } | stany: { $n_states } | OEM, linie: { $oem_lines }

engine-lunar-interop-chart-artifacts = artefakty: { $list }

engine-lunar-interop-chart-conformance = zgodność pól: { $verdict } (obecne: { $present }, brakujące: { $missing }, linie danych: { $data_lines })

engine-lunar-interop-chart-roundtrip = pełny obieg OEM: { $oem } | pełny obieg metadanych czasu: { $time_metadata } | KIF, bajty: { $kif_bytes }

engine-lunar-interop-chart-footnote = Pełny obieg / zgodność pól względem CCSDS OEM oraz opublikowanej semantyki pól LunaNet/IOAG. { $label } — nie jest to certyfikowany test zgodności interoperacyjności; bez poparcia żadnej agencji.

engine-lunar-jamming-chart-title = J/S dla każdego satelity a elewacja, użytkownik na powierzchni Księżyca

engine-lunar-jamming-chart-x-title = elewacja satelity (deg)

engine-lunar-jamming-chart-n-links = łącza: { $n_links }

engine-lunar-service-chart-title = Wolumen usługi księżycowej — satelity: { $n_sats }, punkty: { $n_points } × epoki: { $n_epochs }: pokrycie { $coverage }% (PDOP&lt;{ $threshold })

engine-lunar-service-chart-subtitle = satelity { $min_sats }–{ $max_sats } | HPL { $hpl_min }–{ $hpl_max } m | VPL { $vpl_min }–{ $vpl_max } m | dostępność PL { $pl_avail }% (AL { $al } m, σ_URE { $sigma } m)

engine-lunar-service-chart-pdop-min = PDOP min. { $v }

engine-lunar-service-chart-pdop-mean = PDOP średnio { $v }

engine-lunar-service-chart-pdop-max = PDOP maks. { $v }

engine-lunar-station-chart-title = Księżycowa stacja referencyjna: p{ $percentile } skorygowanego błędu 3-D w regionie okołobiegunowym południowym (MODELLED)

engine-lunar-station-chart-threshold = próg { $thr } m dla p{ $percentile }

engine-lunar-station-chart-availability = dostępność { $v } %

engine-lunar-station-chart-coverage = pokrycie { $v } %

engine-lunar-station-chart-corrected-3d = po korekcji 3-D { $f }

engine-lunar-station-chart-uncorrected-3d = bez korekcji 3-D { $f }

engine-lunar-station-chart-legend-half = ≤ połowa progu

engine-lunar-station-chart-legend-within = ≤ próg

engine-lunar-station-chart-legend-twice = ≤ dwukrotność progu

engine-lunar-station-chart-legend-above = powyżej dwukrotności progu

engine-lunar-station-chart-station-note = ◆ stacja · linia przerywana: odległość, do której pokrycie wynosi 95 %

engine-lunar-station-chart-disclaimer = MODELLED przy podanych założeniach; nie jest to stwierdzenie o żadnym rzeczywistym systemie; bez powiązań z żadną agencją i bez jej poparcia.

engine-lunar-time-chart-title = Księżycowy czas współrzędnych LTC−TT (szybkość { $rate } µs/day, pasmo { $low }–{ $high })

engine-lunar-time-chart-offset = { $offset } µs po { $days } d

engine-lunar-time-budget-scenario-lunar-time-budget-clock-term-time-lab = lunar-time-budget | zegar { $clock } | 7-składnikowe x_Σ(τ) dla punktów τ: { $taus } ({ $taus2 }–{ $taus3 } s) | τ przecięcia { $crossover_tau_s } s (x { $crossover_x_s } s) | dolna granica układu odniesienia { $frame_term_s } s | zegar x(1 d) { $x_1day_ns } ns (MODELLED) | laboratorium czasu: { $lab } { $lab2 } do LTC, x(1 d) { $lab3 } ns (MODELLED)

engine-lunar-vlbi-chart-title = Opóźnienie VLBI Księżyca (baza { $baseline } km, odległość do radiolatarni { $range } km, pole bliskie { $near_field } µs)

engine-lunar-vlbi-chart-footnote = opóźnienie { $delay } µs w epoce · próbki: { $samples } w ciągu { $hours } h

engine-mars-pnt-chart-formal-3sigma = formalne 3σ (kowariancja, nie certyfikowany PL)

engine-nmea-synth-log-position-drag-off-counterfeit-cn0 = odciągnięcie położenia: raportowane położenie oddala się o { $final_offset_m } m w kierunku { $dir }, a odbiornik utrzymuje ważne rozwiązanie (fałszywy tor osiąga maksimum { $pv } m/s i { $pa } m/s^2); każdy śledzony satelita pokazuje { $c } dB-Hz, dopóki to trwa

engine-nmea-synth-log-position-drag-off-genuine-cn0 = odciągnięcie położenia: raportowane położenie oddala się o { $final_offset_m } m w kierunku { $dir }, a odbiornik utrzymuje ważne rozwiązanie (fałszywy tor osiąga maksimum { $pv } m/s i { $pa } m/s^2); zachowany jest prawdziwy wzorzec C/N0

engine-nmea-synth-log-time-spoof-counterfeit-cn0 = spoofing czasu: raportowany UTC odsuwa się o { $offset_s } s od prawdziwego; położenie pozostaje prawdziwe; każdy śledzony satelita pokazuje { $c } dB-Hz, dopóki to trwa

engine-nmea-synth-log-time-spoof-genuine-cn0 = spoofing czasu: raportowany UTC odsuwa się o { $offset_s } s od prawdziwego; położenie pozostaje prawdziwe; zachowany jest prawdziwy wzorzec C/N0

engine-nmea-synth-log-replay-delay-counterfeit-cn0 = opóźnienie powtórki (styl meaconingu): położenie{ $v1 } opóźnia się względem prawdy o { $delay_s } s; każdy śledzony satelita pokazuje { $c } dB-Hz, dopóki to trwa

engine-nmea-synth-log-replay-delay-genuine-cn0 = opóźnienie powtórki (styl meaconingu): położenie{ $v1 } opóźnia się względem prawdy o { $delay_s } s; zachowany jest prawdziwy wzorzec C/N0

engine-pvt-chart-3d-error-m = błąd 3D (m)

engine-pvt-chart-postfit-rms-m = RMS po dopasowaniu (m)

engine-quantum-faults-chart-title = AUC quantum-anomaly-detect (MODELLED)

engine-quantum-faults-chart-quantum = kwantowy

engine-quantum-faults-chart-classical = klasyczny

engine-quantum-nav-od-chart-title = quantum-gnss-free-nav (MODELLED)

engine-raim-stanford-chart-title = Diagram Stanforda — integralność (epoki: { $n_epochs }, AL = { $al } m)

engine-raim-chart-title = Poziomy ochrony RAIM i dostępność ({ $availability }% dostępności)

engine-raim-chart-hal = HAL { $al } m

engine-raim-chart-val = VAL { $al } m

engine-receiver-trust-chart-track-caption = tor raportowany przez odbiornik, północ u góry

engine-receiver-trust-chart-start = początek

engine-receiver-trust-chart-end-of-log = koniec dziennika

engine-receiver-trust-chart-no-positions = brak położeń w dzienniku

engine-receiver-trust-chart-score-axis = wskaźnik zaufania, od 0 do 100

engine-receiver-trust-chart-legend-vessel = zaufanie: zielony nominalne (wskaźnik co najmniej { $nominal }), bursztynowy obniżone (co najmniej { $degraded }), czerwony niezaufane, szary kalibracja

engine-receiver-trust-chart-legend = zaufanie: zielony nominalne, bursztynowy obniżone, czerwony niezaufane, szary kalibracja

engine-receiver-trust-chart-advisory = Oprogramowanie wyłącznie doradcze, nie jest to sprzęt nawigacyjny z zatwierdzeniem typu; za nawigację odpowiada nadal operator.

engine-receiver-trust-chart-cn0-axis = średnie C/N0, dB-Hz

engine-report-chart-title = Holdover zegara: błąd czasu podczas przerwy w GNSS

engine-slot-timing-chart-aria = Przewidywany błąd czasu a czas od ostatniego rozwiązania, z marginesem szczeliny

engine-slot-timing-chart-time-since-fix = czas od rozwiązania, od 0 do { $t }

engine-slot-timing-chart-predicted-error = przewidywany błąd czasu (ns); linia przerywana: margines { $guard } ns

engine-slot-timing-never = nigdy

engine-solar-system-chart-title = Układ Słoneczny — ekliptyka J2000, widok z góry

engine-solar-system-chart-inner = Układ wewnętrzny (do Marsa)

engine-solar-system-chart-whole = Cały układ (do Plutona)

engine-solar-system-chart-legend = zielony: VALIDATED względem JPL Horizons · bursztynowy: MODELLED · księżyce są wymienione w result.json ze śladami o środku w ciele macierzystym

engine-spectrum-chart-title = Wodospad widma pasma L

engine-spectrum-chart-multi-title = Wodospad widma wielu pasm

engine-spectrum-chart-frequency-mhz = częstotliwość (MHz)

engine-spectrum-chart-cn0-caption = C/N0 (dB-Hz): nominalne (szare) / minimalne

engine-spectrum-chart-threshold = próg { $thr }

engine-spoof-chart-title = Detekcja spoofingu czasu: przesunięcie a granice detekcji wspomaganej zegarem

engine-spoof-chart-offset-ns = przesunięcie spoofingu (ns)

engine-spoof-chart-spoof-offset = przesunięcie spoofingu

engine-spoof-chart-quantum-bound = granica detekcji kwantowej

engine-spoof-chart-classical-bound = granica detekcji klasycznej

engine-sweep-chart-title = { $metric } a { $parameter } (skala: { $scale })

engine-sweep-nd-chart-title = { $n_dims }-D przemiatanie `{ $kind }` — węzły: { $n_nodes }

engine-sweep-nd-chart-axes = osie: { $axes } (kształt { $shape })

engine-sweep-nd-chart-metrics = metryki: { $metrics } — pełna siatka w JSON

engine-sweep-nd-chart-line-title = przemiatanie `{ $kind }` po { $key }

engine-sweep-nd-chart-y-title = metryka

engine-telecom-timing-max-te-ns-budget-never-exceeded = telecom-timing: max|TE| { $max_abs } ns w ciągu { $v2 } s; { $masks }; budżet { $max_abs_te_ns } ns nigdy nie został przekroczony (MODELLED)

engine-telecom-timing-max-te-ns-budget-exceeded-after = telecom-timing: max|TE| { $max_abs } ns w ciągu { $v2 } s; { $masks }; budżet { $max_abs_te_ns } ns przekroczony po { $t } s (MODELLED)

engine-telecom-timing-chart-title = Telecom timing: błąd czasu, MTIE i TDEV

engine-telecom-timing-chart-y-title = |błąd czasu| (ns)

engine-telecom-timing-chart-te-caption = bezwzględny błąd czasu względem budżetów

engine-telecom-timing-chart-holdover = holdover

engine-telecom-timing-chart-time-record = czas (zapis { $h } h)

engine-telecom-timing-chart-mtie-caption = MTIE (linia ciągła), TDEV (linia przerywana), pierwsza maska MTIE (szara), ns

engine-timetransfer-chart-title = Błąd synchronizacji transferu czasu (optyczny a RF)

engine-timetransfer-chart-y-title = błąd synchronizacji (ps)

engine-timetransfer-chart-spec = specyfikacja { $mm } mm = { $ps } ps

engine-timetransfer-chart-x-title = czas pomiaru (s)

engine-timetransfer-chart-rf = RF: { $id }

engine-timetransfer-chart-optical = optyczny: { $id }

engine-timetransfer-chain-chart-title = quantum-time-transfer (MODELLED)

engine-kind-clock-description = Holdover zegara względem specyfikacji; opcjonalny zespół Monte Carlo (runs > 1).

engine-kind-inertial-description = Jednostopniowa nawigacja zliczeniowa inercjalna (1-DOF) podczas przerwy w GNSS.

engine-kind-orbit-description = Dostępność GNSS + DOP z konstelacji orbitalnej (Walker / TLE / RINEX).

engine-kind-ephemeris-description = Efemerydy i ślad naziemny: propagacja jednego satelity (TLE→SGP4 lub orbita analityczna) i wyznaczenie jego stanu TEME/GCRS (położenie + prędkość), położenia ITRF/ECEF, szerokości/długości/wysokości podsatelitarnej WGS-84 oraz, dla każdego kroku, az/el/odległości stacji i prędkości zmiany odległości (Doppler). Satelita pochodzi z `tle` albo z orbity analitycznej `orbit` z jej `epoch` (`tle` ma pierwszeństwo, gdy podano oba); przy `tle` wartość `epoch` zastępuje własną epokę TLE jako t = 0.

engine-kind-integrity-description = RAIM migawkowy / separacji rozwiązań / ARAIM z HPL/VPL i diagramem Stanforda.

engine-kind-lunar-integrity-description = Przebieg poziomów ochrony ARAIM dla południowego bieguna Księżyca względem reprezentatywnego zestawu przekaźników LunaNet. sigma_ure_m ujawnia dokładność pseudoodległości sygnału w przestrzeni (poziomy ochrony skalują się z nią liniowo, więc przemiatanie tej wartości odpowiada na pytanie, jakiej dokładności wymaga limit alarmowy). Domyślnie przypadek południowego bieguna klasy LNIS ze względów historycznych.

engine-kind-lunar-time-offset-description = Modelowana relatywistyczna szybkość zegara Ziemia–Księżyc (księżycowy czas współrzędnych, LTC/TCL): wiekowa szybkość LTC−TT wynikająca z różnicy potencjału własnego i z członu kinetycznego Księżyca, podana wraz z opublikowanym pasmem 56–59 µs/day oraz skumulowanym przesunięciem w horyzoncie.

engine-kind-lunar-vlbi-description = Modelowana obserwabla opóźnienia geodezyjnego VLBI Księżyca: baza ziemska (dwie stacje naziemne, GCRS) obserwuje sygnał jednokierunkowy z radiolatarni klasy NovaMoon na powierzchni Księżyca. Wyznacza opóźnienie pola bliskiego jako różnicę dwóch odległości, jego szybkość oraz poprawkę na krzywiznę czoła fali w polu bliskim w trakcie przelotu — z kontrolą krzyżową względem obserwabli Δ-DOR fali płaskiej z tej samej bazy kodu w granicy pola dalekiego, z pochodnymi cząstkowymi zweryfikowanymi różnicami skończonymi. Domyślna ścieżka analityczna jest MODELLED i niesie zastrzeżenia dotyczące spójności układu odniesienia, ruchu bieguna xp=yp=0 oraz fali płaskiej względem pola bliskiego. Ustawienie planetary_kernel_path, earth_orientation_kernel_path i moon_orientation_kernel_path uruchamia zamiast niej ścieżkę jądrową (DE440, MOON_PA_DE440, ITRF93; zbieżne barycentryczne czasy światła; dodaje pochodne cząstkowe radiolatarni i stacji w epoce), której newtonowskie opóźnienie i pochodne cząstkowe zgadzają się z zbieżnymi czasami światła NAIF SPICE do { $lit_0_06 } ps i 7.4e-9. Nie zwalidowano względem rzeczywistych danych VLBI.

engine-kind-lunar-joint-od-clock-description = Modelowany łączny wielotechnikowy estymator wsadowy OD + zegar dla Księżyca w SYMULOWANEJ sieci: dopasowanie migawkowe Gaussa-Newtona, które łączy opóźnienia geodezyjnego VLBI bazy ziemskiej, odległości stacja↔satelita lokalne dla Księżyca oraz odległości międzysatelitarne, aby odzyskać razem położenie 3-D księżycowej stacji powierzchniowej, położenia małej konstelacji i przesunięcie zegara każdego obiektu względem wprowadzonej prawdy odniesienia. Główny uczciwy wynik — VLBI czyni obserwowalnym pełne położenie stacji 3-D tam, gdzie same pomiary odległości lokalne dla Księżyca zostawiają słabo obserwowalny kierunek — jest podany jako kontrast błędu stacji z VLBI i bez VLBI. MODELLED symulowane odzyskiwanie w pętli zamkniętej (prawda odniesienia dzieli model obserwacji), deterministyczne (z ziarnem), NIE zwalidowane na rzeczywistych danych; bez propagacji modelu sił wewnątrz solwera; bez poparcia w postaci TRL, dziedzictwa lotniczego ani agencji.

engine-kind-lunar-frame-realisation-description = Modelowana realizacja księżycowego układu odniesienia: 7-parametrowe dopasowanie datum Helmerta (podobieństwa) — 3 translacje, 3 rotacje małego kąta, 1 skala — wiążące oszacowany zbiór współrzędnych punktów MCMF pochodzących z selenograficznych z datum metodą ważonych najmniejszych kwadratów (crate::batch_ls::gauss_newton), a także proste powiązanie orientacji wyrażające zrealizowaną małą rotację wokół osi ICRF względem orientacji ciała według IAU 2015 WGCCRE. Scenariusz wprowadza znaną małą transformację (translacja ~dziesiątki m, rotacja ~µrad, skala ~1e-7) do dobrze rozłożonej syntetycznej sieci punktów, dodaje szum gaussowski z ziarnem, odzyskuje datum i podaje odzyskaną transformację, błąd odzyskiwania każdego parametru względem wprowadzonej prawdy odniesienia oraz resztę RMS po dopasowaniu. MODELLED samospójność — odzyskuje wprowadzoną transformację podobieństwa (bez szumu do ~precyzji maszynowej), NIE jest realizacją względem rzeczywistych danych śledzenia/VLBI; deterministyczne (z ziarnem); bez poparcia w postaci TRL, dziedzictwa lotniczego ani agencji.

engine-kind-moonlight-service-volume-description = Modelowana analiza wolumenu usługi nawigacji księżycowej na podstawie ILUSTRACYJNEJ, opartej na źródłach publicznych konstelacji na orbicie księżycowej klasy Moonlight/LCNS (bez powiązań z ESA): przemiata siatkę selenograficznej szerokości/długości w horyzoncie czasu i podaje DOP / pokrycie / dostępność (≥4 satelity ORAZ PDOP < próg) oraz uogólnioną obwiednię księżycowego poziomu ochrony ARAIM (HPL/VPL) w całym wolumenie. Geometria DOP UŻYWA PONOWNIE jądra o statusie VALIDATED względem gnss_lib_py (crate::orbit::dop); poziom ochrony UŻYWA PONOWNIE mechanizmu księżycowego ARAIM LunaNet LNIS (crate::lunar, σ_URE≈30 m) i jako przypadek szczególny redukuje się do istniejącego PL dla południowego bieguna. MODELLED kompozycja: zestaw przekaźników kołowych/eliptycznych keplerowskich (nie rzeczywista, różnicowo poprawiona efemeryda LCNS/NRHO), Księżyc ze średnią rotacją (bez libracji/precesji bieguna). Deterministyczne (czysta geometria). Bez poparcia w postaci TRL, dziedzictwa lotniczego ani agencji.

engine-kind-lunar-differential-pnt-description = Modelowany księżycowy RÓŻNICOWY PNT (odpowiednik księżycowego DGNSS/SBAS): stacja referencyjna klasy NovaMoon w ZNANYM położeniu selenograficznym oblicza dla każdego satelity poprawki różnicowe z ILUSTRACYJNEJ, opartej na źródłach publicznych konstelacji klasy Moonlight/LCNS (NovaMoon wskazany wyłącznie jako KLASA systemu, bez powiązań z ESA), a użytkownik odsunięty o baseline_km stosuje je tak, że WSPÓLNE błędy orbity i zegara znoszą się. Składnik zegara znosi się DOKŁADNIE (tożsamość algebraiczna); składnik orbity pozostawia tylko rzut różnicy kierunków widzenia, który → 0, gdy baza → 0 (dolna granica dekorelacji przestrzennej), i rośnie ≈ liniowo z bazą. Podaje błąd położenia użytkownika 3-D Z poprawkami i BEZ poprawek, współczynnik redukcji, krzywą błąd–baza oraz poziom ochrony użytkownika, który UŻYWA PONOWNIE mechanizmu SBAS z DO-229E (crate::sbas) z resztą różnicową σ. MODELLED — dokładna tożsamość znoszenia + model dekorelacji pierwszego rzędu; nie zwalidowano na rzeczywistych danych; bez poparcia w postaci TRL, dziedzictwa lotniczego ani agencji. Deterministyczne, jeśli podano ziarno.

engine-kind-lunar-station-coverage-description = Modelowane pokrycie księżycowej stacji referencyjnej: przemiatanie Monte Carlo modelu księżycowego różnicowego PNT po siatce użytkowników okołobiegunowej południowej i dobie epok. Stacja różnicowa referencyjna w znanym miejscu okołobiegunowym południowym koryguje podaną konstelację (ilustracyjną keplerowską lub efemerydę tablicową) przy podanym błędzie sygnału w przestrzeni, błędzie pomiaru położenia stacji, opóźnieniu poprawek i kwantyzacji łącza; dla każdego punktu i dla całego regionu podaje percentylowy błąd położenia po korekcji i bez korekcji (3-D, poziomy, pionowy), dostępność, pokrycie względem podanego progu, poziomy ochrony DO-229E, promień pokrycia dla każdego azymutu oraz budżet łącza poprawek na stacji i w najgorszym punkcie. To nie jest stwierdzenie o parametrach żadnego rzeczywistego systemu; bez powiązań z żadną agencją i bez jej poparcia. MODELLED.

engine-kind-lunar-interop-export-description = Modelowany eksport interoperacyjności księżycowej: wyznacza księżycowy układ odniesienia, księżycową skalę czasu i księżycowe efemerydy w formach wymiany zgodnych z założeniami LunaNet/IOAG, opartych na CCSDS, z pełnym obiegiem / zgodnością pól. UŻYWA PONOWNIE emitera i parsera CCSDS OEM 2.0 z tego crate (crate::oem), oznaczonych na nowo dla kontekstu księżycowego — REF_FRAME w OEM niesie księżycowy układ ciała IAU 2015 WGCCRE (MOON_ME / MOON_PA), TIME_SYSTEM księżycową skalę czasu (LTC / TCL / UTC), CENTER_NAME = MOON — dla przykładowych ilustracyjnych efemeryd klasy LCNS (położenia z crate::lunar_service, prędkość z różnic skończonych). Wyznacza też deskryptor czasu księżycowego zgodny z założeniami LunaNet/IOAG (identyfikator skali, wiekowa szybkość µs/day z crate::lunar_time, opublikowane pasmo, powierzchnia odniesienia), który przechodzi pełny obieg przez serde_json, i pakuje artefakty w istniejącą kopertę KIF (crate::interchange) z etykietą uczciwości MODELLED. Podaje wyemitowane artefakty, liczbę linii OEM, wynik zgodności pól oraz listę pól obecnych/brakujących, powodzenie pełnego obiegu OEM, powodzenie pełnego obiegu metadanych czasu i rozmiar KIF w bajtach. MODELLED — wzorcem (oracle) jest deterministyczny pełny obieg + zgodność nazw pól względem opublikowanego CCSDS OEM oraz semantyki pól LunaNet/IOAG; NIE jest to certyfikowany test zgodności interoperacyjności; ilustracyjne efemerydy ze źródeł publicznych, bez powiązań z ESA; bez poparcia w postaci TRL, dziedzictwa lotniczego ani agencji.

engine-kind-timetransfer-description = Optyczny i RF dwukierunkowy transfer czasu/częstotliwości.

engine-kind-quantum-anomaly-detect-description = MODELLED detekcja uszkodzeń/anomalii dla kwantowych systemów PNT: oznaczony katalog uszkodzeń (skok częstotliwości/dryf/utrata sprzężenia zegara; skok biasu/zanik czujnika), statystyka detekcji ROC AUC (z przedziałem ufności bootstrap z zewnętrznie zwalidowanego eval_stats) oraz minimalne wykrywalne uszkodzenie przy stałym poziomie fałszywych alarmów, przy czym monitor wspomagany zegarem kwantowym (niższy szum) wykrywa mniejsze uszkodzenia — jako uczciwy TradeEvidence + reprezentatywność. Gaussowski model statystyki detekcji (AUC = Phi(mu/(sigma*sqrt2))); modeluje klasę, ilustracyjne parametry ze źródeł publicznych, bez TRL/lotu/certyfikacji.

engine-kind-quantum-gnss-free-nav-description = MODELLED kwantowa nawigacja bez GNSS: podczas przerwy w GNSS budżet inercjalny kwantowy (interferometr zimnych atomów) a klasyczny INS klasy nawigacyjnej — narastanie błędu położenia podczas dryfu, holdover do progu położenia oraz kompromis kwantowy–klasyczny jako uczciwy TradeEvidence z reprezentatywnością. Uczciwa uwaga o obserwowalności: bez zewnętrznego rozwiązania bias akcelerometru jest nieobserwowalny, więc błąd rośnie; czujnik kwantowy spowalnia tę lukę, ale jej nie zamyka. Ilustracyjne parametry urządzeń ze źródeł publicznych; modeluje klasę, bez TRL/lotu/certyfikacji.

engine-kind-quantum-time-transfer-description = MODELLED łańcuch zaufanej synchronizacji kwantowej: kompletny budżet transferu czasu kwantowego (zegar na sieci optycznej + łącze splątania/pojedynczych fotonów) a klasycznego (CSAC + RF dwukierunkowy), ponownie użyty poziom ochrony czasu + miara jakości bezpieczeństwa wobec ataku opóźnienia/powtórki (1-P_md), prawdopodobieństwo detekcji anomalii zegara + opóźnienie CUSUM oraz kompromis kwantowy–klasyczny jako uczciwy TradeEvidence z rekordem reprezentatywności i luk do lotu. Ilustracyjne parametry urządzeń/łączy ze źródeł publicznych; modeluje klasę, bez deklarowania TRL/lotu/certyfikacji.

engine-kind-hybrid-description = Hybrydowy PNT (zwieńczenie): wspomaganie zegarem + IMU + transferem czasu.

engine-kind-fusion-description = Łączny PNT z fuzją czujników filtrem Kalmana dla tych samych danych hybrydowych.

engine-kind-hybrid-ukf-description = 17-stanowy hybrydowy kwantowo-klasyczny ściśle sprzężony UKF dla GNSS/INS (MODELLED): 15 stanów błędów INS + korekcja biasu przyspieszenia wyprowadzona z CAI + 2-stanowy zegar (faza + częstotliwość) z silnika zegara q-parametrów, napędzany przez ujęty w nawiasy model błędu CAI. Miarą jakości jest samospójność filtra (NEES + biel innowacji a granice χ²) — stwierdzenie samospójności, NIE gwarancja dokładności w świecie rzeczywistym. Tylko symulacja; bez TRL>3, bez dziedzictwa lotniczego, bez zewnętrznej walidacji.

engine-kind-gnss-ins-description = Luźno i ściśle sprzężony EKF stanu błędów dla GNSS/INS.

engine-kind-gnss-sim-description = Symulacja pseudoodległości w dziedzinie pomiarów (jonosfera Klobuchara, troposfera Saastamoinena/Niella) + RAIM.

engine-kind-jamming-description = Zagłuszanie (jamming) w budżecie łącza: J/S → efektywne C/N₀ → utrata sprzężenia.

engine-kind-spoof-description = Stochastyczny detektor spoofingu czasu (Neyman–Pearson / χ²₁) z P_fa/P_md metodą Monte Carlo.

engine-kind-spoof-detect-description = Połączony detektor spoofingu RF/pomiarowy (spójność RAIM wielu SV + AGC + SQM, połączone) względem sparametryzowanego ataku (przewaga mocy, wyrównanie fazy nośnej, przesunięcie czasu/położenia; w stylu TEXBAT).

engine-kind-sweep-description = Przemiatanie 1-D w studium kompromisów po parametrze pakietu zegara.

engine-kind-sweep-nd-description = Ogólne przemiatanie N-D po dowolnym pakiecie przez klucze TOML z kropkami / ścieżki metryk JSON.

engine-kind-gravity-map-description = Nawigacja z dopasowaniem do mapy grawitacyjnej bez GPS: grawimetr zimnych atomów odzyskuje stały dryf INS z ciągu anomalii grawitacyjnych, przez które leci.

engine-kind-terrain-nav-description = Nawigacja odniesiona do terenu bez GPS (TERCOM/SITAN): wysokościomierz radarowy/barometryczny dopasowuje profil wysokości terenu do DEM w stylu SRTM, aby odzyskać dryf INS.

engine-kind-terrain-slam-description = Sekwencyjna (rekurencyjna) nawigacja odniesiona do terenu bez GPS: filtr cząsteczkowy uruchamia model pomiaru dopasowania do terenu epoka po epoce (SITAN jako filtr działający w trybie ciągłym), tak że zmienny w czasie dryf INS jest śledzony wzdłuż toru, podczas gdy wsadowa terrain-nav odzyskuje tylko jedno stałe przesunięcie.

engine-kind-combined-altpnt-description = Połączony nawigator grawitacyjno-magnetyczno-terenowy bez GPS: trzy skalarne kanały pól łączone w każdym punkcie trasy, aby uzyskać ostrzejszą (niższe CRLB) poprawkę dryfu niż z którymkolwiek pojedynczym polem.

engine-kind-pvt-description = Wyznaczanie pojedynczego punktu z rzeczywistych obserwacji: obliczenie położenia odbiornika z pliku obserwacji RINEX 3 i pliku nawigacyjnego rozgłaszanego (pseudoodległości kodowe, efemerydy rozgłaszane, jonosfera Klobuchara, troposfera Saastamoinena/Niella), opcjonalnie zwalidowane względem współrzędnej pomiarowej.

engine-kind-mars-pnt-description = PNT dalekiego kosmosu na Marsie: symulowana konstelacja przekaźników MARCONI (przekaźniki areostacjonarne + nachylone, nadające jednokierunkowo + przekazujące dwukierunkowo do stacji dalekiego kosmosu) nawiguje użytkownika referencyjnego (transfer | lmo | surface) przez łączny estymator fuzji radiometrycznej jedno- i dwukierunkowej. Podaje geometrię/widoczność dla każdej epoki, osiągnięte RMS względem prawdy odniesienia oraz formalną kowariancję (położenie 1σ / 3σ) — uczciwa symulowana miara jakości, NIE certyfikowany poziom ochrony.

engine-kind-impairment-eval-description = Stanowisko oceny detekcji zakłóceń RF metodami AI/ML (13494): generuje oznaczony, uzasadniony parametrami korpus SYNTETYCZNY (nominalny/jamming/spoof-time/spoof-position/multipath), ocenia detektor (energy|agc|sqm|parity|fused) za pomocą niezależnego od detektora zestawu testowego i podaje AUC/ROC/macierz pomyłek + Pd dla każdej klasy przy docelowym Pfa, a także lukę optymizmu między danymi z rozkładu a spoza rozkładu. Wyłącznie charakterystyki działania MODELLED — nigdy dane terenowe/IQ, bez werdyktu dobry/zły.

engine-kind-quantum-trade-description = Kompromis kwantowy–klasyczny dla PNT (13503): korzyść w holdover czasu + holdover inercjalnym z kandydackiego zegara (zmierzona krzywa ADEV — punkt obronności — lub klasa zegara kwantowego) względem klasy punktu odniesienia klasycznego, z zastrzeżeniem o założeniu dolnej granicy przy długim tau niesionym przez artefakt, a także obwiednia odporności a czas bez GNSS. MODELLED; określa ilościowo (nigdy nie waliduje) urządzenie partnera. Zegar kandydacki to zmierzona krzywa (`candidate_adev_taus` + `candidate_adev_values`, równej długości, co najmniej 2 punkty; ma pierwszeństwo, gdy podano obie formy) albo `candidate_clock_class`.

engine-kind-space-weather-description = Model środowiska pogody kosmicznej: wskaźniki aktywności słonecznej (F10.7/F10.7a) i geomagnetycznej (Kp, z definicyjną tabelą Kp↔ap), temperatura egzosferyczna Jacchia-1971, którą napędzają, (zwalidowana względem opublikowanych wartości dla minimum/średniej/maksimum słonecznego) oraz gęstość neutralna termosfery Jacchia-1971 przy dobowo uśrednionej temperaturze egzosferycznej względem statycznego profilu niezależnego od aktywności w zestawie wysokości — zależność gęstości od cyklu słonecznego, którą atmosfera statyczna pomija. MODELLED: gęstość zgadza się z gęstościami wyprowadzonymi z akcelerometrów (TOLEOS CHAMP i GRACE) z dokładnością do czynnika 2 przy maksimum słonecznym, ale jest około { $lit_1_7 }x zbyt duża w minimum słonecznym 2008.

engine-kind-oem-interop-description = Most interoperacyjności CCSDS OEM: import Orbit Ephemeris Message wytworzonej przez zewnętrzne narzędzie dynamiki lotu (GMAT/Orekit/STK wszystkie emitują OEM) i podanie jego segmentów/obiektów/układów/przedziału epok oraz kontroli spójności prędkości; bez danych wejściowych wykonuje pełny obieg wygenerowanej orbity referencyjnej i podaje wierność importu↔eksportu. MODELLED strukturalna/fizyczna kontrola wczytania, NIE walidacja dokładności orbity źródła.

engine-kind-launch-window-description = Dwuciałowa geometria startu i wznoszenia: azymut(y) startu (sin Az = cos i / cos lat), minimalna osiągalna inklinacja, prędkość kołowa, wschodni bonus rotacji Ziemi, Δv zmiany płaszczyzny typu dogleg, gdy inklinacja docelowa jest mniejsza od szerokości geograficznej miejsca startu, oraz liczba dobowych okazji startowych. MODELLED geometria kulistej Ziemi (bez korekty trójkąta prędkości obracającej się Ziemi, bez modelu strat wznoszenia/oporu).

engine-kind-reentry-description = Korytarz balistycznego wejścia w atmosferę Allena-Eggersa: szczytowe opóźnienie (niezależne od współczynnika balistycznego, V_e^2 sin|γ|/(2eH)), prędkość i wysokość przy szczytowym przeciążeniu oraz prędkość szczytowego nagrzewania, dla prędkości wejścia/kąta toru lotu/współczynnika balistycznego w atmosferze wykładniczej, a także planarne całkowanie punktu materialnego tego samego wejścia balistycznego z grawitacją, krzywizną Ziemi i atmosferą US Standard Atmosphere 1976 (szczytowe opóźnienie, prędkość, wysokość i czas w szczycie). MODELLED wejście balistyczne (bez siły nośnej); wynikiem nagrzewania jest PRĘDKOŚĆ szczytowego nagrzewania, a nie strumień ciepła (bez modelu aerotermicznego/TPS).

engine-kind-eo-coverage-description = Geometria śladu i pokrycia ładunku obserwacji Ziemi (trójkąt kosmiczny SMAD): kątowy promień Ziemi, szerokość pasa, odległość próbkowania gruntu w nadirze, maksymalny dostęp poza nadirem, okres kołowy, okres węzłowy J2 i odstęp równikowy śladu naziemnego z flagą pokrycia ciągłego, dla wysokości orbity, inklinacji (domyślnie heliosynchronicznej) i FOV/IFOV czujnika. MODELLED geometria kulistej Ziemi (bez radiometrii/MTF/atmosfery/drgań/odblasków); odstęp węzłów R_e·(ω − Ω̇)·T_nodal z wiekowymi szybkościami J2 pierwszego rzędu.

engine-kind-space-packet-description = Ramkowanie CCSDS 133.0-B Space Packet Protocol: kodowanie syntetycznego strumienia pakietów TM/TC (6-oktetowy nagłówek główny + pole danych) i podanie dekodowania nagłówka każdego pakietu, łącznej liczby oktetów oraz dokładnego pełnego obiegu kodowanie↔dekodowanie. Deterministyczne, dokładne ramkowanie układu bitów — warstwa interoperacyjności formatu pakietów agencji; NIE jest to certyfikacja zgodności (bez logiki nagłówka wtórnego/CRC/segmentacji poza flagami).

engine-kind-attitude-budget-description = Trójstopniowy (3-DOF) budżet błędu orientacji i celowania: najgorszy przypadek momentu zakłócenia gradientu grawitacji ((3/2)(μ/R³)ΔI) oraz budżet błędu celowania jako pierwiastek sumy kwadratów po nazwanych składnikach 1σ (szum czujnika, drgania koła reakcyjnego, termika, ustawienie) z wyróżnionym składnikiem dominującym, dla wysokości orbity + rozrzutu bezwładności ciała. MODELLED skalarny budżet AOCS — uzupełnienie przed sprzętem dla Basilisk/42, a nie symulacja pętli sterowania/6-DoF/modów podatnych.

engine-kind-passes-description = Predykcja przelotów nad stacją naziemną: przeloty widoczności w dziedzinie czasu (AOS/TCA/LOS, maksymalna pozorna elewacja, czas trwania) orbity kołowej, jako średnie elementy SGP4 na początku okna, nad stacją powyżej maski elewacji w oknie, z łącznym czasem dostępu. Propagacja SGP4/SDP4 w układzie związanym z Ziemią IAU 2006/2000A (opcjonalnie UT1 - UTC i ruch bieguna), refrakcja troposferyczna ITU-R P.834-9 i czas światła łącza w dół (oba domyślnie włączone), przejścia wyznaczone z dokładnością 1e-7 s, a kulminacja wyszukiwaniem złotego podziału. Geometria przelotu jest VALIDATED względem Orekit 13.1.8 dla stacji na poziomie morza; orbita i stacja scenariusza są danymi ilustracyjnymi.

engine-kind-link-budget-description = Jednokierunkowy budżet łącza według równania łącza CCSDS 401 / DSN 810-005: tłumienie w wolnej przestrzeni, C/N₀, Eb/N₀, margines i zamknięcie dla EIRP nadawania, G/T odbioru, odległości, szybkości danych i pasma (s|x|ka) względem wymaganego Eb/N₀. Deterministyczne obliczenie inżynierskie z podanych danych wejściowych (nie jest to skalibrowana karta katalogowa terminala).

engine-kind-lunar-time-budget-description = MODELLED kompletny budżet błędu czasu księżycowego czasu skoordynowanego (LTC): siedem składników błędu LTC złożonych jako krzywe błędu czasu x_i(τ) w całej siatce czasów uśredniania, zsumowanych pierwiastkowo do x_Σ(τ), oraz PRZECIĘCIE τ zegar–układ odniesienia, przy którym rosnący składnik zegara przejmuje stały składnik realizacji układu odniesienia w czasie rzeczywistym (poniżej budżet jest ograniczony układem odniesienia, powyżej zegarem) — uczciwa odpowiedź na artefakt pojedynczego τ. Nachylenia τ są w postaci zamkniętej i sprawdzalne analitycznie (zegar τ^{ "{" }+1/2{ "}" }/τ^{ "{" }+1{ "}" }, dolne granice τ^0, pomiar τ^{ "{" }-1/2{ "}" }), a wiersze zegara odtwarzają opublikowane jednodniowe specyfikacje zegarów (crate::clock_specs); WIELKOŚCI dolnych granic łącza RF/optycznego, realizacji układu odniesienia, reszty relatywistycznej i efemeryd to modelowane przydziały budżetu (udokumentowane wartości domyślne, możliwe do nadpisania przez wywołującego), a nie pomiary. Wkładem jest odtwarzalne τ przecięcia, a nie certyfikowana liczba dla każdego składnika; nie jest certyfikowane do operacyjnego pomiaru czasu.

engine-kind-hybrid-optical-rf-description = MODELLED łączna miara jakości heterogenicznego PNT optycznego + RF (P5): składa budżet dwukierunkowego łącza optycznego 1550 nm (ograniczone fotonami CRLB dwukierunkowego pomiaru odległości σ_τ/√N i ślad dyfrakcyjny λ/D·odległość), poziom ochrony RAIM separacji rozwiązań między modalnościami (położenie ORAZ czas), który łączy luźne rozwiązanie RF i ścisłe rozwiązanie optyczne o odmiennych kowariancjach, dostępność przy bezchmurnym niebie dla N stacji optycznych (niezależna suma 1−Π(1−a_i) oraz wariant skorelowany przestrzennie), przekazanie stanu/kowariancji optyczne↔RF z UDOWODNIONĄ bitowo ciągłą (bez skoku) średnią i bramką spójności NEES χ², a także łączny wynik P(dostępne ORAZ klasy precyzyjnej ORAZ z zapewnioną integralnością) z obsługą korelacji. VALIDATED postać zamknięta: CRLB pomiaru odległości, ślad dyfrakcyjny, kwantyl poziomu ochrony χ², kombinatoryka sumy, ciągłość średniej przekazania + bramka NEES oraz łączny iloczyn niezależny. MODELLED: przydziały strat optycznych, wielkości σ RF/optyczne, dane klimatologii zachmurzenia, korelacje i budżet P_HMI. Nie jest to certyfikowany produkt dostępności/integralności.

engine-kind-cislunar-observability-description = MODELLED obserwowalność planarnej konstelacji cislunarnej (P6): śledzi czterostatkową konstelację planarnych DRO z korekcją różnicową z pomiarami odległości międzysatelitarnych i podaje, jaka część czterostanowego wektora [x,y,ẋ,ẏ] statku jest obserwowalna na łuku. Wyznacza (1) tabelę rząd–długość łuku dla pojedynczego łącza tylko odległościowego — chwilowo rząd 1, rosnący ku pełnym czterem stanom w miarę wydłużania łuku (tabela 1 z P6); (2) widmo wartości własnych gramianu obserwowalności + liczbę uwarunkowania na łuku; (3) porównanie chwilowego rzędu tylko odległość a odległość+szybkość zmiany odległości (dźwignia projektowa Dopplera) wraz z raportowaniem GDOP osobliwego dla samej odległości / określonego dla odległość+szybkość; oraz (4) niezależną walidację krzyżową SRIF, której kowariancja a posteriori staje się skończona / dobrze uwarunkowana dokładnie na łuku, na którym rząd obserwowalny osiąga cztery. Rdzeń VALIDATED: rząd obserwowalny jest progiem wartości osobliwych ujawniającym rząd, sprawdzonym krzyżowo z rzędem własnym gramianu; widmo wartości własnych spełnia niezmienniki spektralne (ślad=Σλ, wyznacznik=Πλ, Frobenius²=Σλ²); wariacyjna STM jest zweryfikowaną różnicami skończonymi STM CR3BP; wiersze jakobianu odległości/szybkości zmiany odległości są zweryfikowanymi różnicami skończonymi analitycznymi pochodnymi cząstkowymi (sprawdzonymi krzyżowo z obserwablą 3-D szybkości zmiany odległości tego crate); cztery warunki początkowe to planarne DRO z korekcją różnicową, które zamykają się do ciasnej reszty okresowości i są wsteczne; przejście rzędu jest zwalidowane krzyżowo z pierwiastkowym filtrem informacyjnym tego crate (kowariancja a posteriori skończona dokładnie przy pełnym rzędzie, cond(P)=cond(OᵀO)); migawka o niepełnym rzędzie jest oznaczana jako GDOP nieokreślony (fim condition=inf), nigdy jako zmyślona wartość skończona — ta sama ochrona przed osobliwą geometrią, którą stosuje pvt::solve_spp. MODELLED: projekt konstelacji (amplitudy i fazy perycyntium DRO) i konkretna progresja rzędu, którą wytwarza. Nie jest to certyfikowany produkt wydajności nawigacji.

engine-kind-conflict-resilience-description = MODELLED odporność warstwowego PNT w konflikcie (P7): użytkownik w środowisku spornym wykorzystuje kilka warstw PNT (GNSS usługi otwartej, szerokopasmowy GNSS, uwierzytelniona konstelacja, przekaźnik wzmocnienia), każda z bazową dostępnością, dokładnością 1σ i podatnością na odmowę dla każdego wektora wspólnego zagrożenia zagłuszaniem/spoofingiem. Sterowane intensywnością przemiatanie Monte Carlo Z ZIARNEM odmawia każdej warstwie z prawdopodobieństwem clamp(vulnerability·intensity·vector_weight,0,1), łączy ocalałe regułą odwrotnej wariancji w postaci zamkniętej σ_fused=(Σ 1/σ_i²)^(−1/2) i podaje prawdopodobieństwo całkowitej utraty (wszystkie warstwy odrzucone), medianę błędu połączonego oraz statystyki użyteczności/odmowy dla każdej warstwy w funkcji intensywności. Nagłówkowy współczynnik odporności (prawdopodobieństwo całkowitej utraty dla pojedynczej warstwy a dla warstw) wynosi ~7x przy założeniu NIEZALEŻNOŚCI; jednoczynnikowe przemiatanie skorelowanej odmowy z kopułą gaussowską pokazuje następnie, że to ~7x załamuje się ku 1 wraz ze wzrostem korelacji odmowy (korelacja niweczy warstwowanie). Blok czułości na wartości a priori rozciąga wynik nagłówkowy po ŹRÓDŁOWYCH priorach podatności przez tornado mcda + realokację wysiłku zagrożenia Dirichleta + przedziały ufności percentylowe. Rdzeń VALIDATED: całkowita utrata Monte Carlo zbiega do niezależnego iloczynu w postaci zamkniętej Π_i p_deny_i (w granicach błędu standardowego MC przy ustalonym ziarnie i dużym N); fuzja odwrotnej wariancji jest tożsamością w postaci zamkniętej; przy ρ=0 kopuła redukuje się do modelu niezależnego, a każde ρ zachowuje brzegową szybkość odmowy każdej warstwy. MODELLED: wielkości podatności/dostępności/dokładności dla każdej warstwy są danymi wejściowymi ze źródeł, lecz modelowane (JammerTest 2024, TEXBAT, EASA SIB, RTCA DO-229, LunaNet/IOAG — zob. conflict_threat_params), a konkretna wielkość ~7x i kształt krzywej współczynnik–korelacja wynikają z tej parametryzacji. Podział przeżywalności według wektorów w §4.2 rozkłada następnie wspólne zagrożenie RF na cztery nazwane wektory (jamming/spoofing/kinetyczny/cybernetyczny) i podaje dla każdego wektora krzywą łagodnej degradacji użytecznego PNT S_v(x)=1-Prod_i(1-a_i(1-clamp(susceptibility_i,v·x,0,1))) — VALIDATED: Monte Carlo z ziarnem dla każdej warstwy zbiega do tej postaci zamkniętej; zagłuszanie jest najostrzejszym wektorem dla skorelowanego punktu odniesienia RF, a odporna na RF warstwa inercjalna jest rozstrzygającym ocalałym. Nie jest to certyfikowany produkt dostępności nawigacji.

engine-kind-lunar-attack-surface-description = Powierzchnia ataku na bezpieczeństwo sygnału nawigacji powierzchni Księżyca (P1): składa otwarte analizy bezpieczeństwa sygnału w jeden przebieg osiągalny z binarki. Podaje (1) moc odbieraną AFS i jej NADWYŻKĘ mocy względem odniesienia GPS na Ziemi, a także pasmo czułości 12-18 dB jako prawdziwe wieloosiowe przemiatanie danych wejściowych łącza (poziom odniesienia x EIRP x odległość ukośna) z uzgodnieniem współczynnika liniowego 25x po zaokrągleniu / 28x bez zaokrąglenia. ZMIENIONE (reguła R4): podawało to { $lit_15_6 } dB DEFICYTU mocy i współczynnik 32x/36x, dopóki odniesienie GPS nie zostało poprawione z -125 / -{ $lit_128_5 } (to wartości w dBm) na -155 / -{ $lit_158_5 } dBW, wartości z ICD-GPS-200, które moduł jammingu zawsze zawierał. Znak się odwraca: modelowany księżycowy sygnał AFS jest o { $lit_14_4 } dB SILNIEJSZY niż ziemski GPS L1 C/A, a nie słabszy. Sama moc odbierana nie zmieniła się ani o bit, a współczynnik liniowy to stary podzielony przez dokładnie 1000, co jest dokładnie przesunięciem 30 dB między dBm a dBW; (2) wymaganą moc nadawania atakującego do spoofingu (J/S = 3 dB) i do odmowy (J/S = 30 dB) przy każdym oddaleniu, odwrotność łącza J/S; (3) orbitalny ślad przechwycenia przy rzeczywistej charakterystyce anteny o jednorodnej aperturze (Airy [2 J1(x)/x]^2), ograniczoną wysokością podhemisferyczną czaszę, której limb NIE jest przechwytywany; (4) obliczony wynik wciągnięcia przy przechwyceniu pętli śledzenia przez spoofing (czy spoofer z dopasowanym kodem przy danej przewadze mocy i przesunięciu kodu rzeczywiście przeciąga DLL/PLL), zamiast zakładanego progu 3 dB; (5) geometryczny zasięg horyzontu ciała bez atmosfery dla podniesionego nadajnika powierzchniowego; oraz (6) budżet uwierzytelniania OSNMA/TESLA (narzut 20 bit/s = ~40 % komunikatu nawigacyjnego AFS 50 bit/s, opóźnienie ujawnienia klucza, fałszerstwo 2^-40). Pusta treść odtwarza punkt odniesienia P1; każda wartość wejściowa ma wartość domyślną i może być nadpisana. Podwyniki VALIDATED niosą wzorzec (oracle) swojego modułu źródłowego (radiometria dB w postaci zamkniętej; pełny obieg odwrotnego J/S; wzór Airy względem Bessela z A&S i geometria czaszy sferycznej; DLL/PLL wciągnięcie względem Kaplan & Hegarty; tożsamość horyzontu stycznej sferycznej względem eo_payload; wymiarowanie pól OSNMA SIS-ICD). MODELLED: reprezentatywne wielkości geometrii/mocy i konkretne wartości komórek mapy przechwycenia. Nie jest to certyfikowany produkt bezpieczeństwa.

engine-kind-realtime-frame-eop-description = Budżet predykcji księżycowego układu odniesienia / orientacji Ziemi w czasie rzeczywistym: tabela 1 z P4 (kontrola spójności błędu układu odniesienia — po przetworzeniu ~{ $lit_0_27 } m ↔ ~{ $lit_0_010 } ms oraz w czasie rzeczywistym ~15 m ↔ ~{ $lit_0_5 } ms, każde położenie w układzie odniesienia wyrażone jako równoważny błąd UT1 przez ramię dźwigni L19 Δr = D_EM·ω⊕·ΔUT1) oraz tabela 2 (zmierzony błąd predykcji UT1 a horyzont — krzywa L18 odczytana wprost z rzeczywistej serii IERS finals2000A: dolna granica końcowa Bulletin A − Bulletin B i wielodniowy błąd predyktora persystencji, każdy odwzorowany na położenie w układzie Księżyca przez L19), a także budżet błędu układu odniesienia w czasie rzeczywistym L21 jako pierwiastek sumy kwadratów (EOP + efemerydy + dolna granica realizacji). VALIDATED postać zamknięta (ramię dźwigni L19, ω⊕ sprawdzone krzyżowo z kątem obrotu Ziemi CIO) oraz VALIDATED rzeczywiste dane (krzywa L18 z rzeczywistych wierszy finals2000A); MODELLED są wielkości kowariancji OD przekaźników księżycowych i dolna granica realizacji układu odniesienia (reprezentatywne przydziały) oraz predyktor persystencji (nie operacyjny algorytm Bulletin A z IERS). Nie jest to certyfikowany produkt układu odniesienia w czasie rzeczywistym.

engine-kind-aperture-duty-cycle-description = Cykl pracy apertur: podział czasu między nawigację a łączność, który plan kontaktów narzuca pulii sterowalnych apertur. Przyjmuje plan kontaktów (listę okien aos_s/los_s w `[[contacts]]`, z których każde żąda nawigacji lub łączności — to samo słownictwo aos_s/los_s, które emituje predyktor `passes`), liczbę apertur oraz POLITYKĘ ARBITRAŻU (domyślnie priorytet nawigacji, albo priorytet łączności, albo niewywłaszczające kto pierwszy, ten lepszy) i podaje cykl pracy nawigacji, cykl pracy łączności, cykl bezczynności oraz przerwę dla każdej sesji — czas kontaktu, o który sesja prosiła, a którego żadna apertura nie obsłużyła. Dokładne przemiatanie przedziałów po granicach okien, więc stykające się okna nigdy nie konkurują i żadna sekunda apertury nie jest liczona podwójnie; sekundy apertur nawigacji, łączności i bezczynności są akumulowane niezależnie i zamykają się względem apertures*horizon_s. Raport podaje rozstrzygniętą politykę, jej pełną definicję oraz definicje cyklu pracy i przerwy, ponieważ wartość cyklu pracy podana bez polityki arbitrażu nie jest odtwarzalna. MODELLED arytmetyka harmonogramowania: nie nalicza się żadnego czasu przestawienia / przestrojenia / zmiany, gdy apertura zmienia usługę lub sesję, do decyzji nie wchodzi objętość danych, stan bufora, budżet energii ani zamknięcie łącza, a okna kontaktów są danymi wejściowymi — ich geometria jest taka, jaka je wytworzyła. Nie jest to produkt harmonogramowania segmentu naziemnego.

engine-kind-lunar-jamming-description = Księżycowy jamming RF: stosunek zagłuszania do sygnału dla każdego satelity, efektywne C/N₀ i utrata sprzężenia dla użytkownika selenograficznego na powierzchni pod księżycowym (lub podniesionym) zagłuszaczem, w ilustracyjnej, opartej na źródłach publicznych konstelacji na orbicie księżycowej klasy Moonlight/LCNS. Składa istniejącą otwartą fizykę jammingu (jamming::j_over_s_db, effective_cn0_dbhz, rx_antenna_gain_db, lock_status, q_factor) z istniejącą geometrią nieba księżycowego (lunar_service::LunarConstellation + topocentric, lunar::selenographic_to_mcmf); żadna geometria ani radiometria nie jest wyprowadzana na nowo. W odróżnieniu od ziemskiego rodzaju `jamming`, tor sygnału NIE jest stałą mocą odbieraną: izotropowa moc odbierana każdego satelity wynika z jego własnego budżetu łącza EIRP − FSPL(odległość ukośna), więc J/S zmienia się od satelity do satelity wraz z odległością i elewacją księżycową. Podaje JEDEN WIERSZ NA KAŻDE WIDOCZNE ŁĄCZE (epoka, satelita) — azymut, elewację, odległość ukośną, obie moce odbierane, których różnicą jest J/S, J/S, nominalne i efektywne C/N₀ oraz stan sprzężenia — a także zbiorcze miary jakości obok (nigdy zamiast) tej tabeli, i tę samą tabelę jako artefakt CSV. Każde wyemitowane pole liczbowe niesie jednostkę i klasę pochodzenia. Podwyniki VALIDATED niosą wzorzec (oracle) swojego modułu źródłowego (równanie przeciwzagłuszeniowe i łącze J/S z Kaplan & Hegarty §9.4, zewnętrznie przywołane w tests/gnss_denied_jamming_resilience_reference.rs; geometria księżycowa z lunar_service). Sama kompozycja jest sprawdzona krzyżowo względem niezależnej ścieżki dwóch budżetów łącza (linkbudget::received_signal_power_dbw, inne wyrażenie tłumienia w wolnej przestrzeni) z dokładnością do 1e-9 dB. MODELLED: ilustracyjna konstelacja, reprezentatywne EIRP / moc zagłuszacza / zyski anten / temperatura szumowa oraz brak zacienienia terenem, wielodrogowości, dynamiki AGC i adaptacyjnego zerowania. Nie jest to certyfikowany produkt odmowy usługi. Gdy skonfigurowano zagłuszacz, raport niesie także KONTUR ODMOWY Z PASMEM NIEPEWNOŚCI, a nie kontur odczytany z jednego skalara: pełny zmierzony rozkład C/N₀ sygnału użytecznego po tabeli dla każdego satelity (n, min, p05, p25, mediana, p75, p95, maks., średnia, odchylenie standardowe z próby oraz własna asymetria próby) oraz kontur obliczony przy każdej z tych statystyk pozycyjnych według OBU kryteriów odmowy, które silnik rozpoznaje — dotychczasowego opartego na stosunku mocy (J/S = 30 dB, jak w attack-surface i tracking-loop) i opartego na utracie sprzężenia (efektywne C/N₀ spadające do tracking_threshold_dbhz, kryterium, którego używa kolumna stanu tego raportu) — na obu osiach płaszczyzny odmowy (wymagane EIRP zagłuszacza przy oddaleniu ze scenariusza, oddalenie odmowy przy EIRP ze scenariusza). Krawędzie pasma TO contour(p05) i contour(p95), to samo odwzorowanie w postaci zamkniętej zastosowane do własnych kwantyli próby: nie sigma dopasowana do próby i nie mediana ± k·stdev, przy czym stdev jest emitowane dla ciągłości i nie jest przez nic używane. Kwantyl równy progowi śledzenia lub niższy od niego nie ma skończonego zabijającego J/S, a jego kolumny utraty sprzężenia są null z policzonym powodem, nigdy ze ściętym promieniem.

engine-kind-ins-trn-coast-description = Model błędu dryfu INS/TRN: błąd położenia a czas dryfu, zbudowany ze współczynników IMU, a nie przemiatany po założonej szybkości dryfu. Pięć składników narastania — bias akcelerometru, przechył od biasu żyroskopu przez grawitację, błądzenie losowe prędkości, błądzenie losowe kąta i współczynnik skali względem przebytej odległości — z których każdy jest propagowany przez dziewięciostanowy model błędu inercjalnego w układzie lokalnym z sprzężeniem Schulera dla podanej szerokości geograficznej i wysokości (prawa wiodącego rzędu dla krótkiego dryfu t², t³, t^1.5, t^2.5 i t¹/t² są podane obok) i łączony według PODANEJ reguły (domyślnie pierwiastek sumy kwadratów, albo suma liniowa, albo suma deterministyczna ze stochastycznym rss; wszystkie trzy są obliczane przy każdym przebiegu, aby wybór był widoczny, a nie ukryty). Czasy dryfu osiągające podane przez wywołującego progi położenia (domyślnie 10 m i 50 m) są lokalizowane istniejącą bisekcją silnika, każdy z rozkładem na składniki wskazującym źródło dominujące, a przecięcie każdego pojedynczego składnika jest dodatkowo odwracane algebraicznie, tak aby oba wyniki się zgadzały. Tryb nawigacji odniesionej do terenu ogranicza dryf okresowymi poprawkami położenia i podaje największy odstęp między poprawkami, który dotrzymuje każdego progu; poprawka samego położenia pozostawia błąd prędkości i przechył aktywne po poprawce, więc nie zawsze ogranicza dryf przy dowolnej częstości poprawek, a raport tak mówi, zamiast zwracać zero. MODELLED: współczynniki klasy IMU są reprezentatywnymi wartościami pasma, a nie kartą katalogową, a reszta poprawki terenowej jest daną wejściową. Nieosiągnięty próg jest podawany jako null ze statusem, nigdy jako zero. Nie jest to certyfikowany produkt wydajności nawigacji inercjalnej.

engine-kind-lunar-vlbi-fim-description = Kowariancja współrzędnych stacji z VLBI Księżyca: pochodne cząstkowe opóźnienia obserwabli lunar-vlbi zebrane po jawnym HARMONOGRAMIE (bazy x epoki) w macierz informacyjną Fishera, odwrócone i podane jako kowariancja współrzędnych stacji oraz sigma stacji dla każdej współrzędnej — obliczony wynik silnika, a nie skalarna precyzja opóźnienia przepuszczona przez założony izotropowy współczynnik równego podziału g = 3. Stan niesie współrzędne stacji STAŁE względem Ziemi (ITRS), więc jakobian jest pochodną inercjalną obróconą macierzą GCRS->ITRS każdej epoki: to rotacja Ziemi czyni te współrzędne obserwowalnymi, a raport MIERZY przemiatanie linii widzenia w układzie związanym z Ziemią i deklinację radiolatarni, zamiast je zakładać. Jedna obserwacja to jedna para (baza, epoka), przy której OBIE stacje są powyżej maski elewacji, z wagą 1/delay_sigma_s^2. Przy każdym przebiegu podaje rząd, defekt datum, liczbę uwarunkowania, pełne widmo informacyjne, macierz kowariancji, sigmy 3-D i dla każdej osi każdej stacji oraz przestrzeń zerową sieci swobodnej; przy niedoborze rzędu sigma nagłówkowa jest publikowana jako NULL ze statusem, nigdy odczytana z prawie osobliwej odwrotności. Wartość równego podziału c*delay_sigma_s*sqrt(g/N) dla TEGO SAMEGO harmonogramu jest emitowana obok wartości obliczonej wraz ze stosunkiem, razem z izotropową granicą śladu sqrt(p/trace(M)), którą AM-HM czyni twardą dolną granicą — więc stosunek to anizotropia, którą odrzuciło założenie. Zamknięcie opóźnień tau_ik = tau_ij + tau_jk czyni geometrycznie niezależnymi tylko n-1 z n(n-1)/2 baz; raport podaje obie liczby. MODELLED: efemeryda środka Księżyca, zegary stacji, troposfera i parametry orientacji Ziemi są utrzymywane jako STAŁE, a obserwacje są traktowane jako niezależne, więc kowariancja jest granicą Craméra-Rao dla zredukowanego zbioru parametrów, a nie przewidywanym wynikiem sesji; sigma opóźnienia, współrzędne stacji i harmonogram są danymi wejściowymi. Pochodna cząstkowa, którą jakobian opóźnienia geometrycznego pomija (różnicowany człon Shapiro), jest mierzona różnicą skończoną i emitowana. Nie jest to produkt geodezyjny.

engine-kind-tracking-loop-description = Utrata sprzężenia pętli śledzenia: C/N0 -> sprzężenie/utrata ZE ZJAWISKIEM HISTEREZY, czas utraty sprzężenia oraz wciągnięcie przez spoofing w funkcji SZYBKOŚCI przesunięcia kodu i nośnej. Istniejące kryteria odmowy i przechwycenia silnika są stosunkami mocy odbieranej (zagłuszacz odmawia przy J/S = 30 dB, spoofer przechwytuje przy 3 dB); rzeczywista utrata sprzężenia nie jest stosunkiem mocy, lecz miejscem, w którym drgania pętli plus naprężenie dynamiczne wychodzą poza budżet jej progu śledzenia. Podaje (1) termiczne drgania 1-sigma nośnej (Costas) i kodu (niekoherentne early/late) w funkcji C/N0, z uwzględnieniem strat kwadratowania, względem podanych reguł 3*sigma_PLL + theta_e <= 45 deg (reguła 15 stopni w postaci trzech sigma) i 3*sigma_DLL + ramp lag <= d/2 chip; (2) progi C/N0 utraty i ponownego uzyskania sprzężenia ze wskazaniem pętli ograniczającej, przy czym próg ponownego uzyskania jest WYPROWADZONY z szerszego pasma, w którym odbiornik ponownie się wciąga, a nie zakładany, więc szerokość histerezy musi mieścić się między 5*log10(ratio) a 10*log10(ratio) dB; (3) deklarowany czas utraty sprzężenia z detektora sprzężenia o dwóch progach z oknami potwierdzenia, sterowanego rampą C/N0, podawany osobno od fizycznego czasu ucieczki fazy (średni czas Viterbiego między poślizgami cyklu, w log10 s, ponieważ obejmuje setki dekad); (4) granice wciągnięcia przez spoofing — największe przesunięcie kodu i szybkość Dopplera nośnej, za którymi pętle ofiary mogą nadążyć, z mapą po obu osiach, ponieważ spoofer, który przesuwa szybciej niż te granice, nie przechwytuje pętli, tylko ją wyprzedza; oraz (5) PROMIEŃ ODMOWY wynikający z dynamiki pętli, podawany OBOK istniejącego promienia opartego na stosunku mocy, nigdy zamiast niego, z ich różnicą ze znakiem jako osobnym nazwanym polem (denial_radius_delta_km) i definicją obok. Każde wyemitowane pole liczbowe niesie jednostkę i klasę pochodzenia. Postacie zamknięte VALIDATED: wyrażenia drgań nośnej i kodu, redukcja filtra pętli sqrt(2*B_n*T) i opóźnienie rampy pierwszego rzędu są sprawdzone krzyżowo względem własnego korelatora sdr silnika krokowanego na syntetycznym IF z ziarnem — inną drogą do tych samych liczb — odpowiednio do { $lit_0_6 } %, { $lit_3_7 } % i { $lit_0_17 } %, a zmodyfikowana funkcja Bessela I0 stojąca za czasem poślizgu cyklu względem standardowych wartości tablicowych do 1e-7. Dolna granica ważności jest wymuszona, a nie tylko podana: poniżej ~32 dB-Hz przy 1 ms rzeczywisty dyskryminator atan nasyca się względem swojego zakresu +-pi/2 i mierzy mniejsze drgania niż jakakolwiek teoria liniowa. MODELLED: pasma pętli, czas całkowania, odstęp korelatora, stosunek pasma wciągnięcia, okna potwierdzenia, moc zagłuszacza i zyski anten są reprezentatywnymi wartościami pasma, a nie kartą katalogową. NIE są modelowane: drgania oscylatora (odchylenie Allana) i wibracji, ograniczenie pasma toru wejściowego, wielodrogowość, dynamika AGC, strata na przejściach bitów danych, wspomaganie zewnętrzne oraz jakakolwiek korekta półcyklu we wzorze na poślizg cyklu Costasa. Przy dynamice pętli przechwycenie przez spoofing nie ma żadnego promienia — ograniczeniem wiążącym jest szybkość przesunięcia, a nie moc — więc to pole jest null z podanym powodem, a nie zmyśloną liczbą. Nie jest to certyfikowany produkt wydajności odbiornika.

engine-kind-araim-reference-check-description = Opublikowane wektory referencyjne ARAIM (do celów certyfikacji): poziomy ochrony ARAIM poziomy i pionowy z silnika uruchomione względem WŁASNYCH rozwiązanych przykładów numerycznych Podgrupy Technicznej ARAIM WG-C, przy tolerancji (TOL_PL = 5e-2 m), którą te dokumenty same podają. Dwa wektory są zatwierdzone jako fixtures, każdy z adresem URL pobrania, datą pobrania, SHA-256 pliku źródłowego i stroną: Reference Airborne Algorithm Description Document v3.1 (2019) Appendix D — samospójny i będący wektorem akceptacji — oraz Milestone 3 Report (2016) Annex A section A.IX, zestawienie cytowane przez bibliografie badawcze. Każda opublikowana dana wejściowa (macierz geometrii 10 satelitów 2 konstelacji, przekątne wariancji C_int i C_acc, b_nom, P_sat, P_const i zestaw stałych LPV-200) oraz każda opublikowana dana wyjściowa (VPL, HPL, EMT, sigma_v_acc, K_fa_3 oraz sigma_3, sigma_ss_3 i b_3 dwóch trybów uszkodzenia konstelacji) jest podana obok liczby z silnika i ich różnicy bezwzględnej. Równanie poziomu ochrony NIE jest tu rozwiązywane na nowo: lista trybów z odniesienia jest przekazywana do istniejących raim::araim_protection_level / araim_integrity_risk silnika, więc bisekcja i algebra ogona gaussowskiego poddane próbie są własnymi silnika; dla niego budowane są tylko geometria, rozwiązania cząstkowe, progi detekcji i opublikowany podział budżetu. ZEWNĘTRZNIE SPRAWDZONE względem wektora z 2019: VPL { $lit_18_2926 } m wobec { $lit_18_3 } m opublikowanych, HPL { $lit_13_4063 } m wobec { $lit_13_45 } m, EMT { $lit_7_2997 } m wobec { $lit_7_2998 } m, sigma_v_acc { $lit_1_3694 } m wobec { $lit_1_3694 } m oraz wszystkie sześć opublikowanych wielkości pośrednich z dokładnością do połowy jednostki na ostatnim wydrukowanym miejscu dziesiętnym. Wektor z 2016 niesie dwa wewnętrzne defekty, które raport podaje, a nie ukrywa — literówkę w znaku w wierszu 3 macierzy G oraz K_fa_3 wyznaczone dla 57 trybów uszkodzeń, gdy dokument podaje N_fault_max = 1 (12 trybów) — więc jego wielkości pośrednie geometrii odtwarzają się dokładnie, natomiast jego poziomy ochrony są podawane jako zmierzone rozbieżności i wyłączone z wyniku akceptacji; tolerancja nigdy nie jest poszerzana, aby je wchłonąć. Każde wyemitowane pole liczbowe niesie jednostkę i klasę pochodzenia, a przepisana wartość jest oznaczona `published`, aby nigdy nie można było jej pomylić z obliczoną. ZAKRES: zaimplementowano tylko N_fault_max = 1 (tryby uszkodzenia pojedynczego satelity i pojedynczej konstelacji), a przypadek, którego priory wymagają jednoczesnych podzbiorów uszkodzeń wielu zdarzeń, jest REFUSED, a nie po cichu obcinany; detekcja uszkodzeń, wykluczanie, kontrola spójności chi-kwadrat i krok realokacji przy podwójnym zliczaniu z algorytmu referencyjnego są poza zakresem. Odtwarza to rozwiązany przykład opublikowanego algorytmu referencyjnego — nie jest to certyfikacja, artefakt zdatności do lotu ani zatwierdzenie.

engine-kind-lunar-frame-campaign-description = Siedmioparametrowe datum układu odniesienia Helmerta (podobieństwa) wyznaczone przez SYMULOWANĄ KAMPANIĘ OBSERWACYJNĄ, a nie przez wprowadzoną transformację. Sieć stacji ziemskich obserwuje katalog radiolatarni na powierzchni Księżyca według jawnego harmonogramu; pochodne cząstkowe opóźnienia VLBI Księżyca są zbierane po tym harmonogramie w macierz informacyjną Fishera współrzędnych radiolatarni dokładnie tak jak w lunar-vlbi-fim; a ta informacja jest propagowana przez układ Helmerta A = [I3 | [p]_x | p] w punktach katalogu do kowariancji datum H = A^T M_b A, diagnozowanej przez crate::fim::crlb. ŻADNA transformacja nie jest wprowadzana i nic nie jest odzyskiwane z podłożonej odpowiedzi, więc podana dokładność datum wynika z programu obserwacji: zmniejszenie sigmy opóźnienia o połowę zmniejsza ją dokładnie o połowę, a wydłużenie łuku ją poprawia, ponieważ libracja, którą raport MIERZY (sub_earth_direction_sweep_deg), oddziela współrzędną radiolatarni wzdłuż linii widzenia od współrzędnych w płaszczyźnie nieba. Przy każdym przebiegu emitowane są: rząd, defekt datum, liczba uwarunkowania, pełne widmo, kierunki nieobserwowalne W BAZIE SIEDMIU PARAMETRÓW, kierunek najsłabszy nawet przy pełnym rzędzie i udział każdego parametru w nim; parametr, którego kampania nie ogranicza, jest publikowany jako NULL ze statusem, nigdy odczytany z prawie osobliwej odwrotności. Korelacja błędów radiolatarni jest mierzona, a nie zakładana: przy utrzymanych stałych stacjach żadna obserwacja nie dotyka dwóch radiolatarni, więc macierz informacyjna jest dokładnie blokowo-diagonalna (offblock_fraction 0), a przy estymowanych stacjach blok zmarginalizowany metodą Schura jest sprzężony, z wydrukowaną wywołaną korelacją, i cała propagacja jest uruchamiana ponownie z jej pominięciem, tak że cena założenia niezależności jest liczbą. Ta sama propagacja przy izotropowej sigmie na współrzędną oraz błąd odzyskiwania podawany przez scenariusz lunar-frame-realisation są tu uruchamiane i wydrukowane obok wartości z kampanii wraz ze stosunkami. MODELLED: katalog radiolatarni pochodzi ze źródeł, ale KAMPANIA jest symulowana — sieć stacji i sigma opóźnienia są danymi ilustracyjnymi, pojedyncze obserwacje opóźnienia są traktowane jako niezależne, a efemeryda środka Księżyca, zegary stacji, troposfera i parametry orientacji Ziemi są utrzymywane jako STAŁE, więc kowariancja datum jest granicą Craméra-Rao dla zredukowanego zbioru parametrów. Nie jest to produkt geodezyjny.

engine-kind-lunar-llr-datum-description = Siedmioparametrowe datum księżycowego układu odniesienia Helmerta wyznaczone przez RZECZYWISTĄ, ZARCHIWIZOWANĄ kampanię obserwacyjną, a nie symulowaną. Tam, gdzie lunar-frame-campaign usunęło wprowadzoną transformację, ale nadal podawało sieć stacji, harmonogram i sigmę pojedynczej obserwacji jako dane ILUSTRACYJNE, ten rodzaj bierze wszystkie trzy z pomiaru: epoki to czasy nadawania z ziemi zarchiwizowanych punktów normalnych ILRS Consolidated Laser Ranging Data, obserwacje to rzeczywiście wystrzelone pomiary odległości laserem do pięciu macierzy retroreflektorów na Księżycu, a każda waga obserwacji to własna zarchiwizowana precyzja tego punktu normalnego bin_rms/sqrt(n_raw) odczytana z pliku. Współrzędne stacji pochodzą z rozwiązania SLR IERS ITRF2020 (propagowane do epoki ich opublikowanymi prędkościami), a współrzędne reflektorów z JPL DE430 Table 7 w układzie średniej Ziemi/średniej rotacji, który realizuje model IAU 2015 WGCCRE. Pochodne cząstkowe odległości są zbierane w łączną macierz informacyjną Fishera współrzędnych reflektorów i propagowane przez ten sam układ Helmerta do kowariancji datum, diagnozowanej przez crate::fim::crlb. Przy każdym przebiegu emitowane są: rząd, defekt, uwarunkowanie, widmo, kierunki nieobserwowalne w bazie siedmiu parametrów, kierunek najsłabszy przy pełnym rzędzie i udział każdego parametru w nim, a nieograniczony parametr jest publikowany jako NULL ze statusem. Korelacja między macierzami jest MIERZONA jako dokładnie zero, a nie zakładana, ponieważ pomiar laserowy dotyka jednej macierzy. Rekord, którego katalogi nie potrafią umieścić — stacja bez opublikowanego położenia ITRF — jest POMIJANY I ZLICZANY, nigdy nie dostaje podstawionej współrzędnej. KTÓRE ŁĄCZA SĄ MIERZONE, A KTÓRE MAJĄ STATUS MODELLED, TO TREŚĆ RAPORTU, A NIE PRZYPIS: efemeryda środka Księżyca i orientacja ciała IAU pozostają modelowane, a ich łączna wielkość jest emitowana jako reszta obserwowana-minus-obliczona jednokierunkowej odległości po wszystkich użytych punktach; troposfera, pływy ciała stałego, mimośrodowość stacji, ruch bieguna, UT1-UTC, opóźnienie relatywistyczne i zegary stacji są nieobecne i zawarte w tej reszcie. Ponieważ błąd efemerydy dociera do kowariancji tylko przez kierunek każdej linii widzenia, każdy przebieg rozwiązuje też od nowa całe datum ze wszystkimi pochodnymi cząstkowymi przechylonymi o sensitivity_tilt_deg (ze znakiem na przemian) i emituje stosunek, tak że niewrażliwość kowariancji na modelowaną efemerydę jest liczbą, a nie argumentem. Własne wartości kampanii symulowanej są URUCHAMIANE i drukowane obok zmierzonych, a nie przepisywane. MODELLED: wartości siedmiu parametrów są granicą Craméra-Rao dla zredukowanego zbioru parametrów na rzeczywistym harmonogramie — nie jest to rozwiązane datum, analiza LLR ani produkt geodezyjny. Zatwierdzony wycinek rzeczywistych danych jest dostarczany z repozytorium, ale nie z opublikowanym crate; wskaż data_dir na jego kopię.

engine-kind-lunar-beacon-description = Wzmocnienie księżycowej usługi nawigacji orbitalnej radiolatarniami powierzchniowymi, jako uruchamialna tabela przed/po. Użytkownik w okolicy bieguna południowego widzi rzadki zbiór orbitalny w wąskim wycinku nieba, więc geometria pomiaru odległości jest źle uwarunkowana; kilka ZMIERZONYCH RADIOLATARNI POWIERZCHNIOWYCH dostarcza wierszy linii widzenia o niskiej elewacji i szerokim azymucie, których brakuje zbiorowi całkowicie nad głową, a poziomy współczynnik rozmycia dokładności gwałtownie maleje. Scenariusz podaje trzy konfiguracje w jednej epoce — same satelity, satelity plus widoczne radiolatarnie oraz większą konstelację jako alternatywną drogę do tej samej geometrii — każdą z liczbami widocznych źródeł, pełnym DOP i zrealizowaną dokładnością 1-sigma w METRACH, uzyskaną przez przemnożenie przez błąd pomiaru odległości równoważny dla użytkownika każdej radiolatarni, złożony jako pierwiastek sumy kwadratów składników synchronizacji zegara, wielodrogowości i pomiaru położenia. Widoczność radiolatarni to geometryczny horyzont Księżyca bez atmosfery dla dwóch wysokości (brak atmosfery, więc granica jest dokładna), a złożenie DOP to to samo jądro sprawdzone krzyżowo względem gnss_lib_py w tests/dop_reference.rs. DLACZEGO TEN RODZAJ ISTNIEJE: moduł za nim jest w silniku i jest sprawdzany względem niezależnej ścieżki DOP od L08/L09, ale nie był osiągalny z przebiegu — bez rodzaju, bez gałęzi wywołania, bez dołączonego pliku. README reklamowało tę możliwość, a macierz weryfikacji nie miała dla niej ŻADNEGO wiersza, więc była jednocześnie deklarowana w prozie i niedeklarowana w rejestrze, będąc nieosiągalną w silniku. Wartości domyślne to geometria, która już ma zatwierdzony wzorzec złoty (użytkownik na -80 deg z anteną 2 m, trzy radiolatarnie na -80/0, -79/+60 i -79/-60 na 2 km, sześciosatelitarna ilustracyjna migawka LCNS w t=0, maska 5 deg), więc goły przebieg odtwarza tabelę, którą wzorzec (oracle) już pokrywa, a nie wymyśla nowych liczb. MODELLED: projekt konstelacji, rozmieszczenie radiolatarni i każda wielkość budżetu błędów są danymi ilustracyjnymi, a nie wdrożonym pomiarem położenia ani zmierzonym łączem; zewnętrznie zakotwiczone są tylko arytmetyka DOP, postać zamknięta horyzontu i zależność sigma = DOP x sigma_URE. Nie jest to zobowiązanie co do parametrów usługi.

engine-kind-earth-gnss-lunar-description = Odbiór GNSS z Ziemi w odległości księżycowej, warstwa słabego sygnału, którą wymienia artykuł o odporności w konflikcie, a dla której silnik nie miał modelu. Satelita GNSS kieruje antenę na Ziemię; odbiornik w pobliżu Księżyca znajduje się w odległości około piętnastokrotnego promienia orbity, więc trzy rzeczy działają naraz. Ziemia ZASŁANIA OŚ GŁÓWNĄ: z 26,560 km widać ją pod półkątem { $lit_13_9 } deg, więc każdy promień skierowany ku Księżycowi musi opuścić nadajnik co najmniej tyle poza nadirem, co usuwa szczyt wiązki, zanim zostanie obliczona jakakolwiek moc. Pozostaje KRAWĘDŹ LISTKA GŁÓWNEGO I LISTKI BOCZNE, reżim, w którym ładunek LuGRE faktycznie pracował w 2025. A strata w wolnej przestrzeni wynosi około 208 dB na L1, mniej więcej o 25 dB więcej, niż płaci użytkownik naziemny. Raport emituje jeden wiersz na satelitę (kąt poza osią główną, zasłonięcie przez Ziemię, odległość, tłumienie na drodze, zysk nadawania pod tym kątem, moc odbierana, gęstość nośna do szumu) i agreguje tylko łącza przekraczające próg śledzenia. RAPORTUJE TAKŻE UWARUNKOWANIE, ponieważ to definiuje tę warstwę: każdy widoczny satelita leży w stożku o kilku stopniach szerokości widzianym z Księżyca, więc linie widzenia są prawie równoległe, rozmycie dokładności jest ogromne, a rozwiązanie z GNSS z Ziemi w odległości księżycowej jest obserwacją klasy SYNCHRONIZACJI czasu znacznie bardziej niż klasy położenia. MODELLED, a powodem jest charakterystyka nadawania: zysk pod kątem to jednorodna apertura kołowa (Airy), podczas gdy rzeczywista antena GPS L1 to dwunastoelementowa macierz helikalna z ukształtowanym listkiem głównym i listkami bocznymi innymi niż Airy. Charakterystyki zmierzone istnieją i nie są tu dołączone, więc kolejności i rzędy wielkości są znaczące, a dB pojedynczego satelity nie. Celowo NIEOBECNE, każde czyni budżet optymistycznym: brak straty jonosferycznej lub troposferycznej na promieniach muskających limb, brak strat polaryzacji, celowania i implementacji, a Ziemia jest kulista bez rozszerzenia refrakcyjnego. Położenie Księżyca jest DANĄ WEJŚCIOWĄ (odległość plus kierunek inercjalny), a nie wyszukaniem efemerydy, ponieważ badaną wielkością jest łącze i geometria wiązki. Podniesienie tego wiersza do statusu Validated wymaga zmierzonej charakterystyki nadawania i punktów normalnych LuGRE; żadne z nich nie ma w repozytorium i żadnego z nich tu nie wymyślono.

engine-kind-lunar-infrastructure-description = MODELLED studia orbity i powierzchni Księżyca jako infrastruktury nawigacyjnej i geodezyjnej, pięć studiów za jednym rodzajem wybieranym przez `study`: od-consistency (pokładowe wyznaczanie orbity z GNSS z Ziemi na NRHO lub ELFO względem niezależnego naziemnego radiometrycznego wyznaczania orbity, oceniane według ich własnych kowariancji w Monte Carlo z ziarnem), carrier-phase (łączna faza nośnej podwójnie różnicowana powierzchnia–orbiter i rozwiązywanie niejednoznaczności całkowitoliczbowych metodą LAMBDA), frame-coestimation (stacja powierzchniowa i orbitery dodane do pomiarów odległości ze stacji ziemskich dla siedmioparametrowego datum księżycowego układu odniesienia), space-tie (GNSS, VLBI i pomiar laserowy na jednym statku, precyzja powiązania układów a błąd powiązania lokalnego) oraz geodesy-sensitivity (informacja Fishera o liczbach Love'a Księżyca h2, k2, l2 i fizycznej libracji z pomiarów laserowych, śledzenia orbiterów, grawimetru powierzchniowego i zegara powierzchniowego). Ograniczony model trzech ciał z podanymi uproszczeniami; numeryka jest sprawdzana względem niezależnych programów, a nic nie jest porównywane z pomiarem wielkości księżycowej.

engine-kind-cislunar-arc-recovery-description = MODELLED test niezależnego estymatora progu obserwowalności długości łuku cislunarnego. Ten próg to ODCZYT RZĘDU macierzy obserwowalności złożonej z ANALITYCZNYCH wierszy jakobianu odległości i ANALITYCZNEJ wariacyjnej macierzy przejścia stanu, a jego kontrola krzyżowa pierwiastkowym filtrem informacyjnym składa te same wiersze — kontrola spójności między dwiema maszynami numerycznymi, a nie potwierdzenie. Ten rodzaj dostarcza brakującego arbitra: estymator wsadowy metodą najmniejszych kwadratów, który faktycznie ODZYSKUJE stan początkowy statku głównego z symulowanych pomiarów, z pochodnymi cząstkowymi pomiarów wziętymi jako RÓŻNICE SKOŃCZONE CENTRALNE złożonego modelu w przód. Nie wywołuje żadnego analitycznego wiersza jakobianu, żadnej wariacyjnej STM, żadnego rozkładu na wartości osobliwe ani własne, żadnej tolerancji rzędu i żadnego pierwiastkowego filtra informacyjnego — strażnik tekstu źródłowego w tests/cislunar_arc_recovery_reference.rs czyni to egzekwowalnym — podczas gdy dynamika (ten sam przepływ RK4 CR3BP), warunki początkowe (ta sama konstelacja z korekcją różnicową), obserwabla skalarna i siatka epok są współdzielone celowo i nazwane w emitowanym bloku `independence`, ponieważ dwie analizy jednego problemu fizycznego muszą zgadzać się co do fizyki, aby były porównywalne. Dwa kryteria, każde przemiatane po pięciu dekadach własnej granicy: ODZYSKANIE BEZ SZUMU (końcowy błąd stanu każdej próby z ziarnem co najwyżej recovery_factor razy jej przemieszczenie a priori — analog rzędu, bez tolerancji wartości osobliwych) oraz ESTYMOWALNOŚĆ MONTE CARLO (zmierzony błąd położenia RMS w zespole szumu z ziarnem poniżej podanej granicy — analog estymowalności, zmierzony, a nie przewidziany). Obsługuje planarne czterostanowe i przestrzenne sześciostanowe, rodziny DRO / halo L2 / NRHO L2, obserwable odległości i szybkości zmiany odległości oraz parametryzację biegunową o środku w Księżycu, w której transformację stosuje się do STANU, a model w przód różniczkuje się tam ponownie. ZMIERZONE na opublikowanej planarnej siatce DRO: estymator odzyskuje stan czterowymiarowy od { $lit_0_782609 } h wobec { $lit_2_086957 } h według kryterium rzędu przy rel_tol 1e-6 (stosunek { $lit_0_375 }) — próg rzędu NIE jest potwierdzony (not corroborated) jako granica odzyskiwalności — podczas gdy zmierzona granica estymowalności ląduje w tej samej komórce siatki co formalna, { $lit_5_739130 } h, a zmierzona krzywa błędu odtwarza formalne 1-sigma na 21 długościach łuku ze średnim geometrycznym stosunkiem { $lit_0_98 }. MODELLED: projekt konstelacji, siatka epok, pojedyncze śledzone łącze, wielkość przemieszczenia, sigma pomiaru i dwie podane granice. Nie jest to certyfikowany produkt wydajności nawigacji.

engine-kind-telecom-timing-description = Telecom timing: błąd czasu, maksymalny błąd przedziału czasu (MTIE) i odchylenie czasu (TDEV) holdover z GNSS, sprawdzone względem masek ITU-T z wynikiem PASS lub FAIL i marginesem dla każdej maski. Dane wejściowe to albo SYNTETYCZNY HOLDOVER (ustawienie wstępne oscylatora -- ocxo, rubidowy, cezowy lub csac, każde niosące wartości stabilności, starzenia i temperatury z nazwanej publicznej karty katalogowej Microchip -- plus czas utraty GNSS, długość zapisu i odstęp próbkowania; zegar swobodny niesie szum częstotliwości biały, flicker i, gdzie dopasowanie do karty katalogowej tego wymaga, błądzenia losowego, liniowe starzenie i sinusoidalny składnik temperaturowy) albo WCZYTANA SERIA par [time_s, time_error_ns] podanych w treści (oraz, tylko w kompilacjach natywnych, plik CSV). Maski: ITU-T G.8272 (07/2025) PRTC-A i PRTC-B (max|TE| 100 / 40 ns, MTIE tabele 1-2, TDEV tabele 3-4); G.8272.1 (2024) Amd. 1 (07/2025) ePRTC w stanie sprzężenia (30 ns, tabele 1-2) i ePRTC-A holdover (obwiednia błędu czasu z tabeli 3 rosnąca od 30 ns do 100 ns w okresie holdover H wyznaczonym przez czas sprzężenia, MTIE tabela 4, TDEV tabela 5); G.8273.2 (2023) Amd. 2 (11/2025) klasy T-BC/T-TSC A-C (max|TE|, stały błąd czasu, MTIE i TDEV po filtrze dolnoprzepustowym) i klasa D (max|TE_L| 5 ns, jedyna wartość klasy D niepozostawiona do dalszych badań); G.8271.1 (2022) Amd. 3 (05/2025) punkt odniesienia C (max|TE_L| 1100 / 600 / 100 ns z MTIE tabele 7-1 do 7-3). Każda pozycja, którą zalecenie oznacza do dalszych badań, jest nieobecna, a nie wypełniona, a każdy raport wymienia, czego nie zaimplementowano. Podaje także czas przekroczenia każdego budżetu maksymalnego błędu czasu (domyślnie: 100 ns ePRTC max|TE_HO|, 400 ns przydział holdover sieci, 1100 ns punkt C, { $lit_1_5 } us klasa 4), krzywe MTIE/TDEV jako tabelę CSV z limitem każdej maski oraz wpis jednostek i pochodzenia dla każdego pola liczbowego. VALIDATED: estymatory MTIE i TDEV względem pakietu allantools na zatwierdzonej serii holdover. MODELLED: tabele masek są transkrypcjami, a syntetyczny holdover jest modelem zbudowanym z maksimów z kart katalogowych, a nie pomiarem żadnego egzemplarza. To nie jest test zgodności.

engine-kind-slot-timing-description = Slot timing: sekundy, zanim zegar swobodny opuści margines szczeliny routingu lub zadań indeksowanej czasem (największy bezwzględny błąd czasu, jaki szczelina toleruje), udział każdego składnika w tej chwili ze wskazaniem dominującego (niepewność poprawki, szum fazy biały, szum częstotliwości biały, flicker, błądzenia losowego i losowego biegu, resztkowe przesunięcie częstotliwości, temperatura, starzenie), czas pozostały od ostatniej poprawki oraz największy odstęp między poprawkami, który utrzymuje zegar w granicach, po odjęciu opóźnienia poprawki. Oscylator jest domyślną KLASĄ (csac, uso, dsac, tcxo, ocxo lub rafs: jedno przytoczone jednosekundowe odchylenie Allana i założona dolna granica szumu czerwonego), USTAWIENIEM WSTĘPNYM KARTY KATALOGOWEJ telecom-timing lub wbudowaną KARTĄ KATALOGOWĄ (maksima odchylenia Allana dopasowane jako obwiednia, plus starzenie i współczynnik temperaturowy), albo wbudowanym ZMIERZONYM ZAPISEM FAZY (jego nakładające się odchylenie Allana dopasowane ważoną metodą najmniejszych kwadratów w bazie fazy białej i modulacji częstotliwości według IEEE Std 1139, tak że dolna granica szumu czerwonego jest zmierzona, a nie założona). Przekroczenie poza najdłuższy czas uśredniania, który obsługuje karta katalogowa lub zapis, jest oznaczane jako ekstrapolowane. Opcjonalna sekcja spoofingu dodaje poziom ochrony czasu dla odbiornika na orbicie: prędkość i okres orbitalny, jak długo pojedynczy spoofer naziemny może sięgać satelity w jednym przelocie, dolną granicę monitora wspomaganego zegarem i opóźnienie detekcji CUSUM, granicę warunkową, przesunięcie, które spoofer przy podanej maksymalnej szybkości rampy kumuluje, zanim satelita opuści jego zasięg lub zostanie wykonana niezależna kontrola, oraz czy każda kontrola kontaktu naziemnego lub łącza międzysatelitarnego jest niezależna od tego spoofera. VALIDATED: inwersja holdover z dopasowanego zapisu, wstrzymana na rzeczywistym zegarze cezowym zmierzonym względem masera wodorowego (tests/slot_timing_cs5071a_holdout.rs, zależne od danych); na zmierzonym oscylatorze kwarcowym wstrzymana predykcja jest zachowawcza, ale nie mieści się w progu, więc przypadek kwarcowy jest MODELLED. MODELLED: klasy i źródła kart katalogowych, składniki deterministyczne i ocena spoofingu.

engine-kind-spectrum-description = Model widma pasma L i wodospad: całe pasmo L GNSS jako jedna widmowa gęstość mocy (PSD), częstotliwość w poprzek, czas w dół, dla zaplanowanej osi czasu zagłuszacza. SYGNAŁY: GPS L1 C/A i L2C (BPSK(1)), usługa otwarta Galileo E1 (MBOC(6,1,1/11) lub BOC(1,1)), GPS L5 i Galileo E5a (BPSK(10)), każdy na swojej nośnej z minimalną mocą odbieraną wynikającą ze specyfikacji interfejsu (IS-GPS-200, IS-GPS-705, Galileo OS SIS ICD), chyba że ją nadpisano; GLONASS, BeiDou i Galileo E6 nie są modelowane. ZAGŁUSZACZE: ton fali ciągłej, płaski szum wąskopasmowy, liniowy chirp piłokształtny i szum szerokopasmowy dopasowany do własnej modulacji pasma, każdy ze środkiem, szerokością pasma, mocą odbieraną (bezpośrednio albo EIRP i odległość przez tłumienie w wolnej przestrzeni rodzaju jamming) oraz czasami włączenia/wyłączenia. Każdy zagłuszacz jest oceniany względem każdego pasma przez swój widmowy współczynnik separacji kappa w paśmie odbiornika oraz (C/N0)_eff = [1/(C/N0) + sum (J/S) kappa]^-1; dla jednego zagłuszacza jest to równe równaniu przeciwzagłuszeniowemu rodzaju jamming z Q = 1/(R_c kappa), a raport niesie tę kontrolę krzyżową (i obok niej reprezentatywną wartość Q rodzaju jamming). Poziom szumów to k T_sys z T_sys = T_ant + 290 K (F - 1). Wodospad uśrednia każdą komórkę po jej przedziale i wierszu (chirpy dokładnie, całe przemiatania plus częściowe; zagłuszacze przełączane w środku wiersza według swojego wypełnienia), więc oś czasu C/N0 i obraz pochodzą z tych samych liczb; result.json niesie siatkę uśrednioną blokowo w mocy, C/N0 i J/S dla każdego pasma w każdym wierszu oraz dla każdego zagłuszacza w każdym paśmie SSC, Q, J/S, J/S w paśmie i ustalone C/N0. Opcjonalnie [iq]: model narysowany jako zespolone IQ w jednej chwili, zapisany do nagrania SigMF i odczytany z niego (cf32_le lub ci16_le) i porównany z oszacowaniem Welcha. Opcjonalnie [recording] (kompilacje natywne): PSD Welcha rzeczywistego nagrania SigMF obok modelu. VALIDATED: PSD sygnałów względem podręcznikowych szerokości listka głównego (BPSK(n) 2n x { $lit_1_023 } MHz od zera do zera; listki BOC(1,1) wyśrodkowane na +/-{ $lit_1_023 } MHz) oraz widmowe współczynniki separacji względem ich postaci zamkniętych z równości Parsevala i Q Kaplana i Hegarty'ego równego 1 (CW) i { $lit_1_5 } (dopasowane). MODELLED: moce zagłuszaczy, oś czasu, pasma toru wejściowego, traktowanie widma ciągłego (bez linii kodu) oraz brak AGC, wygaszania i charakterystyki anteny.

engine-kind-solar-system-description = Cały Układ Słoneczny w jednej epoce, dla PNT (pozycjonowanie, nawigacja i czas) wokół dowolnego ciała. Dla Słońca, ośmiu planet, Plutona, Księżyca, Fobosa, Deimosa, Io, Europy, Ganimedesa, Kallisto i Tytana podaje położenie i prędkość heliocentryczną w ICRF (International Celestial Reference Frame, równikowy J2000), odległość heliocentryczną oraz długość i szerokość ekliptyczną J2000, parametr grawitacyjny, promień równikowy i średni, J2 tam, gdzie opublikowano, i jego promień odniesienia, okres obrotu gwiazdowego, biegun IAU i południk zerowy w epoce, ślad orbity próbkowany przez jeden obieg (heliocentryczny dla planet, o środku w ciele macierzystym dla księżyców), a także czas światła, odległość jedno- i dwukierunkową, opóźnienie Shapiro od Słońca i odstęp od Słońca z ciała obserwatora (domyślnie Ziemi); dodatkowe łącza from/to otrzymują to samo traktowanie. Położenia: elementy keplerowskie JPL według Standisha i Williamsa (tabela 1 dla lat 1800 AD do 2050 AD, tabele 2a/2b dla lat 3000 BC do 3000 AD) z nominalnym błędem każdej planety, seria księżycowa Montenbrucka i Gilla dla podziału Ziemia–Księżyc, średnie elementy JPL z synchroniczną szybkością obrotu IAU dla księżyców Marsa i galileuszowych oraz model rotacji IAU dla Tytana. Czas światła: radiometryczne rozwiązanie punktu stałego, nadajnik w swoim położeniu opóźnionym; newtonowskie, z opóźnieniem Shapiro podawanym osobno. VALIDATED względem JPL Horizons (DE441) w granicach dwukrotności błędu nominalnego: od Merkurego do Saturna i Ziemia z tabeli 1 (najgorzej { $lit_1_87 } razy nominalny) oraz wszystkie osiem planet z tabel 2a/2b (najgorzej { $lit_1_71 } razy), a także czas światła z Ziemi do Marsa i Jowisza. MODELLED, każdy wiersz oznaczony: Uran i Neptun z tabeli 1 ({ $lit_2_0 } i { $lit_5_2 } razy błąd nominalny względem DE441), Pluton (wiersz z 1992; bez podanego błędu), Księżyc i siedem księżyców (zmierzone względem Horizons, bez opublikowanej granicy).

engine-kind-body-pnt-description = Pozycjonowanie wokół dowolnego ciała Układu Słonecznego: orbiter albo lądownik powierzchniowy wokół ciała centralnego wybranego po nazwie (Mars, Księżyc, Europa, Ganimedes, Tytan i reszta katalogu Układu Słonecznego), nawigujący za pomocą jednokierunkowych pseudoodległości z małej konstelacji nawigacyjnej Walkera wokół ciała (orbity dwuciałowe z wiekowym dryfem J2 własnym dla ciała, nieznany zegar użytkownika) oraz opcjonalnie niezależnej od zegara dwukierunkowej odległości dalekiego kosmosu od Ziemi, której kierunek i odległość pochodzą z analitycznych efemeryd Układu Słonecznego w każdej epoce. Linie widzenia są blokowane przez średnią sferę ciała, a użytkownik na powierzchni potrzebuje też maski elewacji. Dla każdej epoki: przekaźniki w zasięgu widzenia, czy Ziemia jest nad limbem, GDOP i PDOP samej konstelacji (geometryczny i położenia współczynnik rozmycia dokładności), formalna niepewność położenia jedna sigma z wierszem Ziemi i bez niego oraz błąd rozwiązania metodą najmniejszych kwadratów Gaussa-Newtona z ziarnem w każdym z tych wariantów; w całym przebiegu: dostępność, widoczność Ziemi, mediana PDOP, błąd RMS i mediana formalnej sigmy, a także czas światła Ziemia–ciało, czas obiegu tam i z powrotem, opóźnienie Shapiro i odstęp od Słońca w epoce. MODELLED: orbity przekaźników, poziomy szumów i chwilowy model pomiaru są wyborami modelowymi, niezwalidowanymi względem danych nawigacyjnych misji; stałe ciał to opublikowane wartości przytoczone w body.rs, a geometria Ziemi dziedziczy etykiety efemeryd Układu Słonecznego.

engine-kind-constellation-design-description = Projekt konstelacji w dużej skali: wzorce Walker DELTA i Walker STAR w konwencji i: T/P/F (węzły rozłożone na 360 lub 180 deg, odstęp w płaszczyźnie 360*P/T, przesunięcie fazowe między płaszczyznami 360*F/T), jawne listy elementów i projekty wielopowłokowe, kilka konstelacji w jednym przebiegu, wokół Ziemi, Księżyca, Marsa lub dowolnej innej planety, Plutona albo większego księżyca z użyciem stałych z modułu body (tych samych, których używają rodzaje solar-system i body-pnt). USTAWIENIA WSTĘPNE z opublikowanych elementów nominalnych: gps-baseline i gps-expandable (24 sloty i sześć rozszerzalnych par przód/tył z GPS Standard Positioning Service Performance Standard, wydanie 5 z 2020, tabele 3.2-1 do 3.2-3), galileo (Walker 24/3/1 na 29 599.801 km i 56 deg, Galileo Open Service Service Definition Document wydanie 1.1 tabele 1 i 23), beidou i beidou-meo (Walker 24/3/1 na 21 528 km i 55 deg plus trzy satelity geostacjonarne na 80, { $lit_110_5 } i 140 deg E oraz trzy nachylone satelity geosynchroniczne na 55 deg, BeiDou Open Service Performance Standard 3.0 sekcja 4.1; faza MEO i przecięcie nachylonej orbity geosynchronicznej na 118 deg E są modelowane, ponieważ standard ich nie podaje) oraz glonass (24/3/1 na 19 100 km i { $lit_64_8 } deg ze wzoru na sloty z GLONASS Interface Control Document wydanie 5.1 sekcja 5.2). POKRYCIE I ROZMYCIE DOKŁADNOŚCI: po siatce szerokość/długość geograficzna i próbkowanym oknie z maską elewacji liczba satelitów w zasięgu widzenia, GDOP, PDOP, HDOP i VDOP dla każdej komórki, dostępność (rozwiązanie z PDOP nie większym niż próg, domyślnie 6) dla każdej komórki, globalnie (ważona powierzchnią) i w najgorszym miejscu, z jednym zegarem odbiornika na konstelację, chyba że clock = "common". Skaluje się do tysięcy satelitów: widoczność to iloczyn skalarny względem półkąta pokrycia każdego satelity, a satelity są grupowane w pasma według szerokości podsatelitarnej w każdej epoce, więc wiersz siatki testuje tylko te, które mogą być w zasięgu; raport zlicza zaoszczędzone testy par. JSON niesie mapy siatki i zredukowane próbkowaniem ślady naziemne każdego satelity. VALIDATED: generator Walkera względem tabeli 23 w Galileo OS SDD i wzoru na sloty z GLONASS ICD, ustawienie GPS względem opublikowanej kolumny przejść równikowych z tabeli 3.2-1 w SPS PS, a globalny rozkład HDOP bazowej konstelacji GPS względem dodatku B w SPS PS (mediana { $lit_0_94 }, 95% { $lit_1_25 }, średnia { $lit_0_96 }, tolerancja { $lit_0_03 }). MODELLED: orbity dwuciałowe z opcjonalnym wiekowym J2, kulisty korpus, wyłącznie widoczność geometryczna (bez mocy sygnału, stanu zdrowia ani terenu) oraz względna faza między różnymi systemami, która nie jest migawką żadnej rzeczywistej daty.

engine-kind-campaign-description = Kampania: istniejące rodzaje scenariuszy złożone w jeden przebieg, z każdą liczbą odczytaną z rzeczywistego przebiegu wskazanego rodzaju. Cztery sekcje, w dowolnej kombinacji. FAZY: łańcuchowa misja na jednej wspólnej osi czasu -- każda faza uruchamia jeden lub więcej scenariuszy (na przykład jamming, potem spoofing, potem zegar w holdover z dryfującym obok systemem nawigacji inercjalnej, potem alarm integralności, potem powrót), ich wyniki są wczytywane do nazwanych kanałów (błąd czasu zegara względem marginesu, stosunek nośnej do gęstości szumu względem progu śledzenia, poziom ochrony względem limitu alarmowego, błąd położenia, śledzone satelity, flagi alarmowe) przez ustawienie wstępne dla rodzaju lub jawne ścieżki wyników i przepróbkowywane na wspólną siatkę przez podtrzymanie zerowego rzędu, z granicami faz i zdarzeniami; stan jest przekazywany przez carry (kanał kontynuuje od wartości końcowej poprzedniej fazy), handoff (liczba z poprzedniej fazy zapisana do scenariusza tej fazy) i end_at (faza kończy się w czasie obliczonym przez przebieg, takim jak czas detekcji monitora spoofingu). PRZEMIATANIE: siatka po jednym do trzech kluczy scenariusza z kropkami dowolnego rodzaju (segment będący liczbą całkowitą indeksuje tablicę tabel, jak w system.2.sisre_m), z metrykami odczytywanymi po ścieżce wyniku i, przy runs powyżej jednego, zespołem Monte Carlo z ziarnem w każdym węźle. MONTE_CARLO: realizacja k działa przy base_seed + k; każda metryka podaje średnią, odchylenie standardowe, percentyle 5./50./95. metodą najbliższej rangi oraz 95% przedział ufności bootstrap ze stałym ziarnem dla średniej. KOMPOZYCJA: kilka scenariuszy przy wspólnych wartościach (moc i położenie jednego zagłuszacza zapisane do odbiornika morskiego i drogowego), z łącznym podsumowaniem najlepszego/najgorszego przypadku. Wynik niesie skrót kampanii, skrót po każdym wyniku członka oraz wpis jednostek dla każdej wyemitowanej liczby; eksporty interoperacyjności zapisują każdy scenariusz członkowski, który ma geometrię, jako osobny zestaw plików. Tożsamości kompozycji są testowane: kampania jednofazowa odtwarza samodzielny przebieg co do bitu, zespół ze stałym ziarnem jest stabilny bajtowo, a dla zegara z białym szumem częstotliwości średnia zespołu mieści się w podanym przedziale, a rozrzut zgadza się z sqrt(q_wf * tau). MODELLED: addytywny carry i podtrzymanie zerowego rzędu są wyborami modelowymi, a każda faza niesie etykietę rodzaju, który ją uruchomił.

engine-kind-leo-signal-description = Projekty sygnałów LEO-PNT: sparametryzowane sygnały pozycjonowania, nawigacji i czasu (PNT) z niskiej orbity okołoziemskiej (LEO) dla dowolnego systemu, pasma i struktury. SYGNAŁ to pasmo (częstotliwość środkowa, pasmo nadawania, przydział ITU RNSS/RDSS/MSS/EESS/non-RNSS/other) i składowe (akwizycja, dane, pilot; dowolny podzbiór), każda z modulacją (BPSK(n) z ułamkowym n, BOC(m,n), MBOC(6,1,p) lub płaskie pasmo typu OFDM), udziałem mocy, opcjonalnymi przesunięciami podnośnych FDMA, długością kodu i szybkością danych. Sygnały pochodzą z wkompilowanych publicznych plików ustawień wstępnych (xona-pulsar, iridium-stl, starlink-soo, centispace, generic-c-band, generic-bands; każdy z adresem URL źródła, a każda nieopublikowana wartość oznaczona REPRESENTATIVE) lub są zapisane w treści. DLA KAŻDEGO SYGNAŁU: ograniczona pasmem widmowa gęstość mocy i ułamek mocy każdej składowej, który przepuszcza pasmo nadawania (postać zamknięta BPSK obok wartości numerycznej), szerokość pasma RMS (Gabora), termiczny szum drgań śledzenia kodu pętli DLL w funkcji C/N0 i odstępu early-late z ograniczonego pasmem wzoru koherentnego (lub niekoherentnego) early-late Betza i Kolodziejskiego 2009 wraz z jego podręcznikową postacią dla pasma nieograniczonego i jego granicą Gabora dla zanikającego odstępu, dokładność pomiaru odległości w metrach, przestrzeń przeszukiwania akwizycji (przedziały Dopplera z maksymalnego Dopplera orbity plus składniki oscylatora i użytkownika, razy przedziały kodu), prawdopodobieństwo detekcji kwadratowej i średni czas akwizycji szeregowej i równoległej po kodzie, widmowy współczynnik separacji sygnału względem GPS L1 C/A, Galileo E1, GPS L5, Galileo E5a, E5b i E5 AltBOC oraz każdego z nich względem sygnału wraz z degradacją C/N0, a także J/S CW, szerokopasmowe i dopasowane, które toleruje śledzona składowa, z własnego mechanizmu SSC rodzaju spectrum. HANDEL PASMAMI: opóźnienie jonosferyczne pierwszego rzędu ({ $lit_40_3 } TEC/f^2), tłumienie w wolnej przestrzeni, dokładność pomiaru odległości przy równym C/N0 i przy równym EIRP oraz tolerancja na zagłuszacz. Opcjonalne KONTROLE KSZTAŁTU porównują widmo projektu z opisanym pomiarem (spójność MODELLED). VALIDATED: moc BPSK w paśmie ({ $lit_90_3 } % w listku głównym) i postacie zamknięte szerokości pasma Gabora, ograniczony pasmem szum drgań redukujący się do podręcznikowej postaci koherentnej early-late i do jej granicy Gabora, widmowy współczynnik separacji przesuniętego BPSK względem jego postaci zamkniętej z równości Parsevala, jednostkowe pole widma AltBOC oraz maksymalny Doppler LEO względem opublikowanych wartości Xona Pulsar (32-34 kHz) i Iridium (36 kHz). MODELLED: każdy projekt, podział mocy, C/N0 i poziom zagłuszacza; widma EFQPSK, CSK i OFDM są przybliżone.

engine-kind-leo-pass-description = Przelot LEO i budżet łącza, pasmo po paśmie, dla LEO-PNT (pozycjonowanie, nawigacja i czas z niskiej orbity okołoziemskiej), niezależnie od systemu: użytkownik (naziemny, morski, lotniczy lub wewnątrz budynku, nieruchomy lub ruchomy) i jeden lub więcej satelitów LEO z ZAPROJEKTOWANEGO PRZELOTU (orbita kołowa umieszczona tak, aby użytkownik widział jeden przelot o wybranej maksymalnej elewacji w wybranym czasie, heliosynchroniczna na życzenie), jawnych ELEMENTÓW, TLE (zestawu elementów dwuliniowych) przez SGP4 silnika albo konstelacji WALKERA zbudowanej przez kod projektu konstelacji (podawane są najwyższe przeloty). Pasma pochodzą z nazwanego ustawienia wstępnego (ogólne wielopasmowe UHF/L/S/C, ogólne pasmo C, Xona Pulsar X1/X5, Iridium STL, Starlink jako sygnał okazji wyłącznie dopplerowski, CentiSpace oraz opcjonalne ustawienie Celeste IOD oznaczone WORKSHOP) albo są zapisane w scenariuszu; każde ustawienie wstępne podaje, czy jego liczby są PUBLIC (z adresem URL), REPRESENTATIVE czy WORKSHOP. Dla każdego satelity, pasma i epoki: elewacja, azymut, odległość, szybkość zmiany odległości i przyspieszenie odległości; tłumienie w wolnej przestrzeni; EIRP i zysk charakterystyki satelity (izoflux, wiązka gaussowska lub płaska); zysk anteny użytkownika w funkcji elewacji (płaska, półsferyczna lub izotropowa); tłumienie gazowe (ITU-R P.676-10 Annex 2), tłumienie deszczu (współczynniki ITU-R P.838-3 i procedura P.618-14, z intensywności i wysokości deszczu), scyntylacja troposferyczna (ITU-R P.618-14 sekcja 2.4.1), strata przenikania przez budynek dla użytkownika wewnątrz (ITU-R P.2109-2), niedopasowanie polaryzacji, temperatura szumowa systemu i C/N0 (gęstość nośnej do szumu); Doppler i szybkość Dopplera w postaci zamkniętej z szybkości zmiany odległości i przyspieszenia odległości, każde sprawdzone względem różnic centralnych; opóźnienie jonosferyczne pierwszego rzędu { $lit_40_3 } STEC/f^2 z nachylonego TEC według Klobuchara lub pionowego TEC, przeskalowanego do części jonosfery poniżej satelity. Pary pasm otrzymują współczynniki wolne od jonosfery, wzmocnienie szumu i szum kodu w szczycie przelotu. Satelity MEO GNSS (ustawienia Galileo lub GPS) są oceniane tym samym modelem anteny i szumu na podstawie mocy odbieranych z dokumentów interfejsu, więc dzwonowy przelot LEO i płaskie nośne GNSS dzielą jeden wykres. Opcjonalna sekcja [iot] podaje czas do pierwszego rozwiązania, energię na rozwiązanie i czas pracy baterii w funkcji cyklu pracy dla podanego budżetu mocy odbiornika (MODELLED). Każda para pasm podaje też nachylony TEC, który jej kombinacja wolna od geometrii odzyskuje w szczycie, oraz sigmę szumu kodu tego oszacowania (sondowanie jonosfery). Opcjonalna sekcja [spoofer] podrabia sygnały deklarowanego położenia, które skacze lub jest odsuwane od prawdziwego po chwili początkowej, i uruchamia dwa monitory z podanymi prawdopodobieństwami fałszywego alarmu i niewykrytego zdarzenia: spójność Dopplera i geometrii przelotu (zmierzone szybkości zmiany odległości względem przewidzianych z orbit oraz niezależnego położenia i prędkości a priori, uogólniony test chi-kwadrat metodą najmniejszych kwadratów w oknie, na kanałach GNSS, LEO i wszystkich) oraz spójność międzypasmowa (krok między epokami skorygowanej modelem kombinacji wolnej od geometrii każdej pary pasm LEO), podając statystyki dla każdej epoki i moment detekcji każdego monitora (MODELLED). Składniki VALIDATED: tłumienie w wolnej przestrzeni, współczynniki P.838-3 względem jego tabeli 5, procedury deszczu i scyntylacji P.618-14 oraz strata przenikania przez budynek P.2109 względem przykładów walidacyjnych ITU-R Study Group 3, stosunek opóźnień grupowych L1/L2 z IS-GPS-200 oraz maksymalny Doppler nieruchomego użytkownika dla orbity kołowej względem tabeli 1 z arXiv 2509.19551. MODELLED: EIRP, charakterystyki, ułamek Chapmana TEC poniżej satelity i cały przelot.

engine-kind-leo-navmsg-description = Komunikat nawigacyjny LEO: rozgłaszane efemerydy i zegar satelity pozycjonowania, nawigacji i czasu (PNT) na niskiej orbicie okołoziemskiej (LEO), dla dowolnej orbity, nośnej i modelu, z opcjonalnymi nazwanymi ustawieniami wstępnymi (Xona Pulsar, Iridium, Starlink, CentiSpace, reprezentatywny system pasma C, model zerowego zegara ATOMIC, Celeste IOD). ZAWARTOŚĆ: dane pomocnicze (SVID, wydanie danych, pasmo, stan zdrowia sygnału), synchronizacja (tydzień, czas tygodnia, wielomian zegara drugiego rzędu af0-af2 wokół toc), efemerydy w jednym z czterech modeli -- 16-parametrowy zestaw keplerowski z Galileo OS SIS ICD; ten zestaw plus wielomiany korekcyjne wzdłuż toru, w poprzek toru i radialne; 22-parametrowy model Liu i in. 2025; wielomian ECEF bez składników zegara (ATOMIC zerowy zegar) -- oraz inne usługi (rozgłaszany zestaw Klobuchara, NeQuick-G ai0-ai2 z efektywnym poziomem jonizacji oraz parametry czasu systemowego do UTC z logiką sekundy przestępnej z ICD). DOPASOWANIE: orbita odniesienia całkowana z grawitacją zonalną J2-J6 lub EGM2008 do wybranego stopnia i oporem, oraz swobodny lub sterowany zegar z ziarnem; dopasowanie zestawu keplerowskiego metodą Levenberga-Marquardta na elementach nieosobliwych, potem liniowe wielomiany korekcyjne metodą najmniejszych kwadratów; zegar dopasowany po odjęciu członu relatywistycznego, który dodaje użytkownik. ANALIZY: fit-interval-trade (błąd odległości sygnału w przestrzeni, SISRE, z globalnymi wagami uśrednionymi dla wysokości orbity, w funkcji przedziału dopasowania i okresu aktualizacji, tylko orbita i z zegarem), model-comparison (cztery modele, liczba parametrów, zakodowane bity oraz dopasowanie Kshana na wysokościach Liu i in. obok opublikowanych wartości), midpass-update (najwyższy przelot nad użytkownikiem, skok położenia, zegara i odległości użytkownika przy każdym przełączeniu komunikatu, skok przy najgorszej geometrii, PASS/FAIL względem progu ciągłości), encode-decode (własna udokumentowana ramka binarna Kshana z CRC-24Q, budżet kwantyzacji półkroku dla każdego pola, kontrola uszkodzonej ramki, eksport i import rekordu w stylu RINEX-4 oznaczony jako rozszerzenie Kshana oraz tabela CSV). VALIDATED: wagi SISRE względem opublikowanej tabeli MEO/GEO (Montenbruck i in. 2018); algorytm użytkownika Galileo względem RTKLIB na rzeczywistych efemerydach rozgłaszanych Galileo; CRC-24Q względem jego wartości kontrolnej z katalogu i przykładowej ramki RTCM 1005. MODELLED: każda wartość dopasowania i SISRE jest błędem reprezentacji względem prawdy odniesienia całkowanej przez Kshana (bez błędu wyznaczania ani predykcji orbity); porównanie z Liu i in. używa innych orbit; formaty kodowania i tekstowe są własne dla Kshana.

engine-kind-leo-pvt-description = Połączone PNT (pozycjonowanie, nawigacja i czas) z orbit średnich (MEO) i niskich (LEO) dla DOWOLNYCH konstelacji: każdy [[system]] to ustawienie wstępne GNSS rodzaju constellation-design, ustawienie wstępne LEO (xona-pulsar, iridium-stl, starlink-sop, centispace, generic-c-band, model efemeryd atomic-zero-clock lub inny plik ustawień wstępnych, każdy w osobnym pliku ze źródłami oznaczonymi PUBLIC, WORKSHOP lub DERIVED), powłoki Walkera lub jawne zestawy elementów, z nośną, szybkością chipów, obwiednią gęstości nośnej do szumu (C/N0) od maski elewacji do zenitu, błędem odległości sygnału w przestrzeni (SISRE), sigmą Dopplera i modelem zegara (własny zegar odbiornika, więc bias międzysystemowy jest estymowany, albo znane przesunięcie rozgłaszane). Cztery tryby. DOPPLER: wsadowe pozycjonowanie Gaussa-Newtona z szybkości zmiany odległości z analitycznymi pochodnymi cząstkowymi, stanami dryfu zegara i opcjonalnie prędkości oraz opcjonalnym ograniczeniem wysokości, z jednym lub wieloma satelitami, błąd w funkcji długości okna, obwiednia Dopplera, szybkości Dopplera i szarpnięcia każdego systemu LEO oraz dokładność wzdłuż toru i w poprzek toru dla pojedynczego przelotu w funkcji przesunięcia w poprzek toru (błąd w poprzek toru rośnie bez ograniczenia, gdy przelot przechodzi nad głową; pojedynczy przelot ma też rozwiązanie lustrzane względem śladu naziemnego). Sygnał okazji wyłącznie dopplerowski (starlink-sop) działa tutaj. ŁĄCZNIE: rozwiązania pseudoodległościowe ważoną metodą najmniejszych kwadratów w każdej epoce z samego GNSS, samego LEO i obu, sigmy każdego pomiaru z modelu termicznego szumu pętli DLL przy C/N0 plus SISRE (albo stała sigma, aby mógł je zasilać model sygnału), estymowane biasy międzysystemowe oraz PDOP/HDOP/VDOP w funkcji liczby dodanych satelitów LEO. BIEGUNOWO: satelity w zasięgu widzenia i DOP w funkcji szerokości geograficznej dla GNSS, LEO i obu. SYNCHRONIZACJA CZASU: transfer czasu do uniwersalnego czasu koordynowanego (UTC) z satelitów LEO w znanym położeniu z dwustanowym filtrem zegara, którego szum procesu pochodzi z klas oscylatorów silnika, w funkcji C/N0 i oscylatora, oraz wyrażenie czasu systemowego do UTC z IS-GPS-200; przy [timing] trace = true każdy wiersz podaje także swój błąd czasu i przewidywaną sigmę w każdej epoce. VALIDATED: największy Doppler przelotu od nadiru do horyzontu względem opublikowanych wartości Iridium (do 36 kHz) i Xona Pulsar X1 (32 do 34 kHz). MODELLED: wszystko inne; DOP jest sprawdzony na przypadku wyprowadzonym ręcznie, rozwiązania względem ich kowariancji, a model Dopplera względem tożsamości przyspieszenia odległości.

engine-kind-leo-ppp-description = Zbieżność precyzyjnego pozycjonowania punktowego (PPP) z samym GNSS i ze wzmocnieniem LEO: rozszerzony filtr Kalmana typu float na kodzie i fazie nośnej wolnych od jonosfery ze stałymi współrzędnymi stacji, białym zegarem odbiornika, jednym biasem międzysystemowym na dodatkowy system, błądzeniem losowym zenitalnego opóźnienia mokrego odwzorowanym przez 1/sin(elewacja) i niejednoznacznością typu float na łuk każdego satelity; błąd precyzyjnej orbity i zegara jest biały i wspólny dla kodu i fazy satelity, więc każdy satelita to jedna skorelowana dwuwierszowa aktualizacja w postaci stabilizowanej według Josepha. Pomiary są symulowane z tego samego modelu z szumem z ziarnem dla kilku miejsc i ziaren, a każdy przypadek (najpierw sam GNSS, potem każdy [[case]] systemów LEO, dowolna konstelacja lub ustawienie wstępne) podaje medianę czasu zbieżności (pierwsza epoka, po której błędy poziomy i pionowy pozostają poniżej progów, domyślnie 10 cm), odsetek zbieżnych, mediany krzywych błędu oraz spójność filtra (uśrednione po przebiegu NEES położenia względem dwustronnego pasma chi-kwadrat 95%). Opcjonalnie obok opublikowanych wartości Li i in. (2019, J. Geod. 93:749, doi 10.1007/s00190-018-1195-2) dla średnich szerokości: { $lit_9_6 } min dla multi-GNSS skraca się do { $lit_7_0 }, { $lit_3_2 }, { $lit_2_1 } i { $lit_1_3 } min przy 60, 96, 192 i 288 satelitach LEO. MODELLED: porównanie spójności trendu, a nie odtworzenie konstelacji, szumu ani stacji z tamtego badania; bez rozwiązywania niejednoznaczności, poślizgów cyklu, wind-up fazy, pływów ani skorelowanych w czasie błędów produktów.

engine-kind-ntn-positioning-description = Pozycjonowanie z łącza w dół sieci pozaziemskiej 5G (NTN) w paśmie S służby mobilnej satelitarnej (MSS) (pasmo 3GPP n256, łącze w dół 2170 do 2200 MHz; domyślna nośna { $lit_2172_5 } MHz): granica Craméra-Rao (CRB) dla czasu przybycia, c / (2 pi beta sqrt(2 (C/N0) T)), gdzie beta to pierwiastek średniokwadratowy (Gabora) szerokości pasma płaskiego widma OFDM (B/sqrt(12)), oraz dla Dopplera tonu zespolonego, sqrt(3 / (2 pi^2 (C/N0) T^3)), dla każdego sygnału (domyślnie kanał New Radio 5 MHz z { $lit_4_5 } MHz zajętymi i wąskopasmowy kanał 200 kHz ze 180 kHz zajętymi); następnie, dla dowolnej konstelacji LEO, rozwiązania z czasu przybycia łącza w dół z nieznanym zegarem odbiornika (z ziarnem, z granicą plus błędem synchronizacji sieci jako sigmą), ich PDOP i formalna sigma 3D oraz jednosatelitarne rozwiązanie Dopplera dla najdłuższego przelotu z utrzymaną wysokością. MODELLED: przejście od szerokości pasma do granicy jest podręcznikową postacią zamkniętą, sprawdzoną względem całkowania numerycznego widm płaskiego i ograniczonego pasmem BPSK (spójność wewnętrzna, bez przypiętej opublikowanej wartości z rozwiązanego przykładu), a dokładność pozycjonowania jest granicą dla kanału bez wielodrogowości z podanym błędem synchronizacji, a nie osiągniętym wynikiem.

engine-kind-leo-pnt-chain-description = Jeden system LEO-PNT (pozycjonowanie, nawigacja i czas z niskiej orbity okołoziemskiej) od początku do końca, dla dowolnej konstelacji i sygnału: projekt leo-signal wskazany przez signal_design (publiczne ustawienie wstępne lub wbudowany projekt [signal]) ustala środek, pasmo, szybkość chipów i podział EIRP pasma [pass], budżet łącza leo-pass podaje śledzone C/N0 i ograniczony pasmem szum drgań kodu w trakcie przelotu, linia C/N0 względem sin(elewacja) i rozgłaszane SISRE komunikatu [navmsg] (dopasowane na wysokości satelity przelotu) zasilają każdy system LEO łącznego rozwiązania leo-pvt [fusion] oraz opcjonalnie przypadki leo-ppp [ppp]; każde przekazanie jest wymienione ze swoją wartością i jednostką. MODELLED.

engine-kind-contact-schedule-description = Planowanie kontaktów naziemnych dla kilku satelitów nad kilkoma stacjami: pozorne okna dostępu (SGP4, układ związany z Ziemią IAU 2006/2000A, refrakcja ITU-R P.834, czas światła), objętość danych DVB-S2 ACM każdego przelotu (progi z tabeli 13 w ETSI EN 302 307-1) oraz harmonogram bez konfliktów (jeden satelita na antenę z czasem przezbrojenia, jedna stacja na satelitę, dostarczanie ważone priorytetem ograniczone każdym zaległym zasobem) metodą zachłanną z wartością krańcową, punktem odniesienia kto pierwszy, ten lepszy oraz dokładnym przeszukiwaniem z podziałem i ograniczeniami na małych zbiorach, z luką optymalności metody zachłannej. MODELLED.

engine-kind-acm-link-description = Jeden satelita nad jedną stacją: odległość ukośna, elewacja i Es/N0 każdego przelotu wzdłuż przelotu, MODCOD DVB-S2 wybrany w każdym kroku (progi z tabeli 13 w ETSI EN 302 307-1 plus margines implementacyjny) oraz objętość danych, którą ACM przenosi, względem punktu odniesienia ze stałym kodowaniem, które zamyka się na masce. MODELLED.

engine-kind-aocs-description = Sterowanie orientacją statku kosmicznego: obrót w celu wycelowania inercjalnego sztywnego korpusu z trzema lub więcej zrównoważonymi kołami reakcyjnymi ze sprzężeniem zwrotnym MRP (L = -K sigma - P omega), momenty kół o minimalnej normie obcięte do limitu każdego silnika, RK4 z podtrzymaniem zerowego rzędu; opcjonalnie zamknięte na multiplikatywnym EKF z symulowanego żyroskopu (błądzenie losowe kąta i prędkości) i śledzika gwiazd. Podaje czas ustalania, końcowy i szczytowy błąd celowania, szczytową prędkość i moment kół, ułamek nasycenia, dryf momentu pędu oraz, z estymatorem, jego błąd orientacji i NEES. Pętla stanu prawdziwego jest VALIDATED względem Basilisk 2.9.1; estymator jest MODELLED.

engine-kind-entry-heating-description = Trójstopniowe (3-DoF) wejście punktu materialnego w atmosferę nad obracającą się kulistą Ziemią lub Marsem (balistyczne lub z siłą nośną przy stałym przechyleniu), RK4, przez US76, atmosferę wykładniczą lub marsjańską, z konwekcyjnym nagrzewaniem punktu stagnacji według Suttona-Gravesa (NASA TR R-376): szczytowe opóźnienie, strumień ciepła i ciśnienie dynamiczne, ładunek cieplny, zasięg w dół toru, kontrola energii w układzie obracającym się oraz obok niej postać zamknięta Allena-Eggersa. Szczytowe opóźnienie jest sprawdzone względem opublikowanego nominału Stardust; nagrzewanie jest MODELLED.

engine-kind-eo-radiometry-description = Radiometria obrazowania w nadirze i jakość obrazu: radiancja w aperturze sceny lambertowskiej, równanie kamery, sygnał oraz szum śrutowy/ciemny/odczytu/kwantyzacji i SNR; MTF systemu przy Nyquiście (dyfrakcja x detektor x rozmycie x drgania), z niego względna odpowiedź krawędziowa, Q = lambda F/p oraz NIIRS według GIQE wersja 4 bez kompensacji MTF. MODELLED.

engine-kind-ascent-losses-description = Planarne wznoszenie z zakrętem grawitacyjnym wielostopniowego pojazdu nad nieobracającą się kulistą Ziemią przez US Standard Atmosphere 1976 (pionowe wznoszenie, kopnięcie pochylenia, ciąg wzdłuż prędkości), całkujące straty grawitacyjne, oporu, sterowania i przeciwciśnienia oraz sprawdzające, że idealne dv minus straty zgadza się z prędkością po wypaleniu; max-Q, szczytowe przyspieszenie i stan po wypaleniu. MODELLED.

engine-kind-time-transfer-budget-description = Dwukierunkowy satelitarny transfer czasu i częstotliwości między dwiema stacjami przez przekaźnik geostacjonarny: równanie dwukierunkowe rozwiązane względem T_A - T_B z każdym składnikiem niewzajemnym (opóźnienia sprzętu stacji, jonosfera w paśmie Ku, transponder, Sagnac), kwadraturowy budżet niepewności, którego składnik typu A to TDEV symulowanego łącza przy czasie uśredniania, symulowane łącze z szumem fazy białym i flicker oraz dobową niewzajemnością, a także stabilność (szybkość, reszta RMS, TDEV, ADEV) dowolnej dostarczonej serii BIPM Circular T Section 1, pliku CSV MJD,ns lub zapisów zegara stacji IGS RINEX. MODELLED.

engine-kind-optical-atmosphere-description = MODELLED optyczny PNT przez atmosferę: dla łącza optycznego i zbioru stanowisk naziemnych z podanym klimatem chmur podaje zależną od długości fali i elewacji stratę w czystym powietrzu (prawo widoczności Kima plus Rayleigh), stan turbulencji Hufnagela-Valleya (wariancja Rytova, wskaźnik scyntylacji, parametry gamma-gamma, uśrednianie po aperturze), dostępność zależną od pogody względem marginesu łącza (grubość optyczna chmur z logarytmiczno-normalnego klimatu wody ciekłej, ekstynkcja optyki geometrycznej, niezależny zanik turbulencji), margines łącza potrzebny dla docelowych dostępności, rozkład czasu trwania przerw, narastanie błędu czasu i pomiaru odległości w każdej przerwie przez model holdover zegara, dostępność z różnorodnością stanowisk skorelowaną odległością oraz zyski w wariantach „co jeśli” dla technik wzmocnienia (długość fali, apertura odbiorcza, redukcja scyntylacji optyką adaptacyjną, dodatkowy margines). VALIDATED jako implementacja podanych wzorów względem niezależnej wyroczni mpmath: wariancja Rytova, wskaźnik scyntylacji, prawdopodobieństwo zaniku gamma-gamma, współczynnik uśredniania po aperturze, grubość optyczna chmur i czystego powietrza. MODELLED: każde dane wejściowe dotyczące pogody, techniki i zegara oraz założenia niezależności i kopuły; nie porównano z żadnym zmierzonym zapisem dostępności. Analiza doradcza, nie jest to certyfikowany produkt dostępności ani nawigacji.

engine-kind-holdover-test-description = MODELLED test holdover systemu synchronizacji czasu, oceniany na podstawie zapisu błędu czasu dostarczonego przez OPERATORA (dziennik linuxptp ptp4l, phc2sys lub ts2phc, dziennik śledzenia lub statystyk chrony, dziennik zegara TICC, TimeLab lub RINEX albo pary time_s,time_error_ns). Test ma cztery kroki, a Kshana nie wykonuje żadnego z nich: zsynchronizowany PUNKT ODNIESIENIA, GNSS ODŁĄCZONY przez operatora (kabel anteny lub wyjście symulatora; Kshana niczego nie nadaje i niczym nie steruje) w podanym czasie, HOLDOVER na własnym oscylatorze systemu oraz POWRÓT po przywróceniu GNSS przez operatora w drugim podanym czasie. Zapis jest dzielony w tych dwóch momentach. Punkt odniesienia: statystyki błędu czasu i maski ITU-T napisane dla zegara zsynchronizowanego. Holdover: statystyki, ułamkowe przesunięcie częstotliwości utrzymane przez system (prosta metodą najmniejszych kwadratów), maski napisane dla holdover lub zegara autonomicznego, obwiednia holdover ePRTC-A z podanego czasu sprzężenia oraz czas przekroczenia każdego budżetu błędu czasu. Powrót: czy i kiedy |TE| weszło w podane pasmo i w nim pozostało, wartość szczytowa i największy skok. Każdy limit jest przepisany z publicznej tabeli ITU-T (maski telecom-timing); słowa to „zmierzone względem maski”, a oba momenty są oświadczeniem operatora, niezweryfikowanym. Zapis zbyt krótki dla maski jest INCOMPLETE, nigdy ekstrapolowany. Zob. docs/TIMING-HIL.md.

engine-kind-gnss-ssv-description = MODELLED dostępność GNSS i siła łącza w Space Service Volume i poza nim: dla użytkownika na sferze (globalna powłoka z broszury ICG) lub na trajektorii keplerowskiej (od LEO do transferu księżycowego) zlicza, dla każdej konstelacji (GPS, GLONASS, Galileo, BDS, QZSS, NavIC) i dla wszystkich razem, sygnały użyteczne powyżej progu C/N0 - dostępność co najmniej jednego i czterech sygnałów, maksymalny czas trwania przerwy, odbierane C/N0, rozmycie dokładności, łącza listka głównego względem listków bocznych - z charakterystyką nadawania z broszury, parametryczną lub dostarczoną przez użytkownika, opcjonalnymi efektami jonosfery na promieniu muskającym limb, plazmosfery i atmosfery oraz opcjonalnym projektem odbiornika słabego sygnału; także pokładowy rozszerzony filtr Kalmana GNSS dla statków HEO i transferu księżycowego (dynamika orbitalna, ciśnienie promieniowania słonecznego, ciała trzecie, zegar) i nawigacja względna formacji wielu statków przez pseudoodległości różnicowane pojedynczo. Sprawdzone względem tabel broszury ICG SSV w ramach wstępnej rejestracji (xval/gnss-ssv)
