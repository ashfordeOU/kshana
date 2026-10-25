# SPDX-License-Identifier: AGPL-3.0-only
# ja catalogue of the engine messages (i18n/en/engine.ftl is the source).
# A message missing here is shown in English, per message. Translators: keep every $variable
# of the English message, keep the message ids, and do not translate error codes (E-...).

engine-e-clock-log-unknown-clock-log-format-expected = 不明な時計ログ形式 { $other }：{ $format_names } のいずれかを指定してください

engine-e-clock-log-unknown-gap-policy-expected-refuse = 不明な欠測ポリシー { $other }：refuse、longest、linear のいずれかを指定してください

engine-e-clock-log-give-either-the-log-text = ログのテキストまたはそのパスのどちらか一方を指定してください（両方は不可）

engine-e-clock-log-clock-log-needs-its-text = 時計ログにはテキストまたはパスが必要です

engine-e-clock-log-tau0-must-be-finite-and = tau0_s は有限かつ 0 より大きい値でなければなりません（指定値：{ $t }）

engine-e-clock-log-units-and-data-apply-to = units と data は timelab 形式にのみ適用されます

engine-e-clock-log-channel-applies-to-the-ticc = channel は ticc 形式にのみ適用されます

engine-e-clock-log-cannot-read-clock-log = 時計ログ { $path } を読み込めません：{ $e }

engine-e-clock-log-clock-log-path-is-not = WebAssembly ビルドでは時計ログのパスは使用できません。ログはテキストで指定してください

engine-e-clock-log-the-log-has-missing-epoch = { $format } ログには、{ $tau0 } s 間隔のグリッド上に { $n_gaps } 件の欠測区間があり、欠測エポックは計 { $n_missing } 件です。欠測のない最長の連続区間を残すには gaps = "longest"、補間するには gaps = "linear" を指定してください

engine-e-clock-log-the-log-yields-usable-sample = { $format } ログから得られる有効サンプル数は { $x } 件で、少なくとも 3 件が必要です

engine-e-clock-log-not-rinex-clock-file-no = RINEX クロックファイルではありません：END OF HEADER レコードがありません

engine-e-clock-log-the-rinex-clock-file-has = RINEX クロックファイルに AS または AR レコードがありません

engine-e-clock-log-the-rinex-clock-file-holds = RINEX クロックファイルには複数の時計（{ $many }）が含まれています。clock = "..." で一つ指定してください（{ $many2 }）

engine-e-clock-log-no-as-or-ar-records = 時計 { $id } の AS または AR レコードがありません

engine-e-clock-log-the-clock-has-single-epoch = この時計のエポックは一つだけのため、tau0 を求められません

engine-e-clock-log-the-log-has-no-readings = { $format } ログに測定値がありません

engine-e-clock-log-unknown-phase-unit-expected-ms = 不明な位相の単位 { $other }：s、ms、us、ns、ps のいずれかを指定してください

engine-e-clock-log-timelab-line-has-column-the = TimeLab の { $v1 } 行目の列数は { $v } で、最初のデータ行は { $first } 列です

engine-e-clock-log-timelab-line-has-columns-one = TimeLab の { $v1 } 行目の列数は { $v } です。読み込めるのは一列（値）または二列（時刻と値）です

engine-e-clock-log-timelab-line-is-not-numeric = TimeLab の { $v1 } 行目が数値ではありません：{ $l }

engine-e-clock-log-the-timelab-log-has-no = timelab ログに測定値がありません

engine-e-clock-log-unknown-data-expected-phase-or = 不明な data { $other }：phase または frequency を指定してください

engine-e-clock-log-tau0-header-is-not-positive = tau0 ヘッダー { $v } は正の秒数ではありません

engine-e-clock-log-frequency-data-is-fractional-frequency = 周波数データは相対周波数であり、単位は 1 のみです

engine-e-clock-log-two-column-frequency-logs-are = 二列の周波数ログは読み込めません。周波数は tau0 を付けた一列で指定してください

engine-e-clock-log-unknown-time-units-expected-or = 不明な time_units { $o }：s または mjd を指定してください

engine-e-clock-log-the-timelab-log-time-column = timelab ログの時刻列は増加していなければなりません

engine-e-clock-log-single-reading-tau0-cannot-be = 測定値が一つだけのため、tau0 を求められません

engine-e-clock-log-the-timelab-log-has-non = timelab ログに有限でない測定値が { $non_finite } 件あります

engine-e-clock-log-the-ticc-log-holds-channels = TICC ログには複数のチャネル（{ $many }）が含まれています。channel = "..." で一つ指定してください

engine-e-clock-log-no-readings-on-channel-found = チャネル { $channel } の測定値がありません（見つかったもの：{ $labels }）

engine-e-clock-log-ticc-interval-mode-lines-carry = TICC のインターバルモードの行には時刻がありません。tau0_s（イベント周期）を指定してください

engine-e-clock-log-the-readings-do-not-increase = { $channel } の測定値が増加していないため、タイムスタンプではありません（TICC の Period モード出力は読み込めません。Timestamp モードを使用してください）

engine-e-clock-log-single-time-stamp-tau0-cannot = タイムスタンプが一つだけのため、tau0 を求められません

engine-e-clock-log-two-time-stamps-apart-under = { $channel } の二つのタイムスタンプの間隔 { $w } s が、tau0 = { $tau0 } s の半分未満です

engine-e-clock-log-the-time-stamps-of-go = { $clock } の { $format } タイムスタンプが逆行しています（デーモンの再起動または時計のステップ）。ログを分割して各部分を読み込んでください

engine-e-clock-log-the-log-has-no-readings-2 = ログに { $what } の測定値がありません

engine-e-clock-log-the-log-holds-sources-name = ログには複数のソース（{ $many }）が含まれています。{ $selector } = "..." で一つ指定してください（{ $many2 }）

engine-e-clock-log-no-readings-for-found = { $id } の { $what } の測定値がありません（見つかったもの：{ $names }）

engine-e-clock-log-the-servo-of-never-reached = { $id } のサーボがロック状態 s2 に到達しませんでした

engine-e-clock-log-the-log-has-no-chrony = ログに chrony のトラッキング測定値がありません

engine-e-acquisition-sample-rate-hz-is-not = サンプルレート { $fs_hz } Hz は 一ミリ秒あたりのサンプル数が整数になりません

engine-e-acquisition-coherent-ms-and-noncoherent-must = coherent_ms と noncoherent は正の値でなければなりません

engine-e-acquisition-the-doppler-grid-needs-positive = ドップラーグリッドには正のステップと非負の最大値が必要です

engine-e-acquisition-pfa-must-lie-in = pfa は (0, 1) の範囲内でなければなりません

engine-e-acquisition-samples-supplied-needed = 指定されたサンプルは { $samples } 件で、必要数は { $needed } 件です

engine-e-acquisition-empty-doppler-grid = ドップラーグリッドが空です

engine-e-acquisition-the-samples-carry-no-power = サンプルに電力がありません

engine-e-adm-unknown-attitude-type = 不明な ATTITUDE_TYPE { $s }

engine-e-adm-an-aem-needs-at-least = AEM には少なくとも一つのセグメントが必要です

engine-e-adm-segment-is-not-version-attitude = セグメント { $i }：{ $t } はバージョン { $version } の姿勢タイプではありません

engine-e-adm-segment-values-for = セグメント { $i }：{ $t } の値の数は { $values } です

engine-e-adm-aem-version-has-no-ndm = AEM バージョン 1.0 には、ここでは NDM/XML 形式がありません。KVN で記述してください

engine-e-adm-this-attitude-type-has-no = この姿勢タイプにはバージョン 2.0 形式がありません

engine-e-adm-expected-meta-start-found = META_START が必要ですが、{ $l } が見つかりました

engine-e-adm-meta-start-without-meta-stop = META_START に対応する META_STOP がありません

engine-e-adm-unexpected-metadata-line = 想定外のメタデータ行 { $other }

engine-e-adm-in-version-aem = バージョン { $version } の AEM における { $att }

engine-e-adm-interpolation-degree = INTERPOLATION_DEGREE { $d }：{ $e }

engine-e-adm-expected-data-start-after-meta = META_STOP の後には DATA_START が必要です

engine-e-adm-data-start-without-data-stop = DATA_START に対応する DATA_STOP がありません

engine-e-adm-empty-data-line = データ行が空です

engine-e-adm-values-on-line = { $att } 行の値の数は { $vals } です：{ $b }

engine-e-adm-unexpected-data-line = 想定外のデータ行 { $other }

engine-e-adm-attitude-type-has-no-xml = この姿勢タイプには XML 形式がありません

engine-e-adm-message-without-version-attribute = version 属性のないメッセージです

engine-e-adm-expected-found = { $vers_key } が必要ですが、{ $other } が見つかりました

engine-e-adm-header-without-creation-date-or = ヘッダーに CREATION_DATE または ORIGINATOR がありません

engine-e-adm-missing = { $k } がありません

engine-e-adm-unexpected-keyword = 想定外のキーワード { $k }

engine-e-adm-spin-block-holds-nutation-or = スピンブロックには章動データまたは運動量データのどちらか一方のみを含められます（両方は不可）

engine-e-adm-unexpected-apm-keyword = 想定外の APM キーワード { $other }

engine-e-adm-unexpected-apm-line = 想定外の APM 行 { $b }

engine-e-adm-without = { $b } に対応する { $stop } がありません

engine-e-adm-unexpected-line-in = { $b } 内の想定外の行：{ $other }

engine-e-adm-incomplete-group = 不完全なグループ { $keys }

engine-e-adm-unknown-apm-block-start = 不明な APM ブロック { $other }_START

engine-e-adm-apm-metadata-needs-object-name = APM メタデータには OBJECT_NAME、OBJECT_ID、TIME_SYSTEM が必要です

engine-e-adm-apm-without-epoch = APM に EPOCH がありません

engine-e-adm-rotation-axis = 回転軸 { $o }

engine-e-adm-values-for = { $t } の値の数は { $values } です

engine-e-adm-euler-record-without-euler-rot = オイラーレコードに EULER_ROT_SEQ がありません

engine-e-adm-rotation-sequence = 回転シーケンス { $seq }

engine-e-adm-epoch-has-no = エポック { $s } に 'T' がありません

engine-e-adm-epoch-date = エポックの日付 { $date }

engine-e-adm-epoch-time = エポックの時刻 { $time }

engine-advanced-report-text-as-the-document-states = “{ $s }”（文書の記載のとおりのテキスト）

engine-advanced-report-mean-5th-to-95th-percentile = 平均 { $fmt_num }（5 パーセンタイルから 95 パーセンタイル：{ $fmt_num2 } から { $fmt_num3 }）

engine-advanced-report-field-units-schema-units-entry = フィールド単位スキーマ：units エントリ `{ $key }`

engine-advanced-report-field-units-schema-input-entry = フィールド単位スキーマ：input エントリ `{ $key }`（フィールド名で照合）

engine-advanced-report-rows-of-non-numeric-column = 数値でない列の { $n } 行

engine-advanced-report-rows-from-to = { $nums } 行、{ $fmt_num } から { $fmt_num2 } まで

engine-advanced-report-phase-ended-by = フェーズ { $name }（終了要因：{ $ended }）

engine-advanced-report-result-timeline-phases = 結果 `timeline.phases[{ $i }]`

engine-advanced-report-hand-off-into-phase = フェーズ { $phase } への引き継ぎ：{ $h } → { $h2 } = { $h3 } { $h4 }

engine-advanced-report-result-timeline-handoffs = 結果 `timeline.handoffs[{ $i }]`

engine-advanced-report-scenario-input = シナリオ入力 `{ $prefix }`

engine-advanced-report-scenario-file-comment-line = シナリオファイルのコメント、{ $start } 行目

engine-advanced-report-scenario-file-comment-lines-to = シナリオファイルのコメント、{ $start } 行目から { $v1 } 行目まで

engine-advanced-report-is-modelled-not-validated = { $requirement } は MODELLED であり、独立した検証は行われていません：{ $it }。

engine-advanced-report-sweep-of-scale = { $param } のスイープ（{ $str_of } スケール）

engine-e-advanced-report-the-result-document-is-not = 結果文書は JSON ではありません：{ $e }

engine-e-advanced-report-the-scenario-is-not-toml = シナリオは TOML ではありません：{ $e }

engine-advanced-report-monte-carlo-distribution-of = { $metric } のモンテカルロ分布

engine-advanced-report-recorded-at-build-time-from = ビルド時に環境変数 { $GIT_COMMIT_ENV } から記録

engine-advanced-report-not-recorded-this-engine-was = 未記録：このエンジンは環境変数 { $GIT_COMMIT_ENV } なしでビルドされました。リリースはエンジンのバージョンで識別されます

engine-advanced-report-the-kind-own-fingerprint-of = { $esc }（シナリオに対するこの種別固有のフィンガープリント。ファイルのダイジェストではありません）

engine-advanced-report-input-file = 入力ファイル { $path }

engine-advanced-report-study-generated = { " " }スタディを { $esc } で生成しました。

engine-e-altpnt-maps-emag2-line-expected-comma-separated = EMAG2 の { $v1 } 行目：カンマ区切りの 8 列が必要ですが、{ $p } 列でした

engine-e-altpnt-maps-emag2-line-bad = EMAG2 の { $v1 } 行目：{ $what } `{ $p }` が不正です

engine-e-altpnt-maps-emag2-line-non-finite-value = EMAG2 の { $v1 } 行目：有限でない値です

engine-e-altpnt-maps-emag2-no-data-rows = EMAG2：データ行がありません

engine-e-altpnt-maps-emag2-rows-do-not-fill = EMAG2：{ $rows } 行では、それらが張る { $n_lat } x { $n_lon } の格子を満たせません

engine-e-altpnt-maps-emag2-duplicate-node-at = EMAG2：{ $lat }、{ $lon } のノードが重複しています

engine-e-altpnt-maps-grid-step-must-be-finite = グリッドのステップは有限かつ正でなければなりません（指定値：{ $step }）

engine-e-altpnt-maps-grid-box-must-have-north = グリッド範囲は北 > 南 かつ 東 > 西 でなければなりません（指定値：[{ $south }, { $north }] x [{ $west }, { $east }]）

engine-e-altpnt-maps-grid-of-nodes-is-too = { $n_lat } x { $n_lon } ノードのグリッドは大きすぎます

engine-e-altpnt-maps-emag2-the-axis-needs-at = EMAG2：{ $what } 軸には少なくとも 2 つの異なる値が必要です

engine-e-altpnt-maps-emag2-the-axis-is-not = EMAG2：{ $what } 軸が等間隔ではありません（平均ステップ { $step } に対し { $w } から { $w2 }）

engine-e-altpnt-maps-error-sigma-must-be-finite = 誤差シグマは有限かつ非負でなければなりません（指定値：{ $sigma }）

engine-e-altpnt-maps-correlation-length-must-be-finite = 相関長は有限かつ正でなければなりません（指定値：{ $corr_len_deg }）

engine-e-altpnt-terrain-samples-per-side-must-be = samples_per_side は 2 以上でなければなりません（指定値：{ $n }）

engine-e-altpnt-terrain-srtm-hgt-length = SRTM .hgt の長さ { $bytes } != 2*{ $n }*{ $n } = { $v2 }

engine-e-altpnt-terrain-an-hgt-window-needs-at = .hgt ウィンドウには少なくとも 2 x 2 サンプルが必要です（指定値：{ $n_rows } x { $n_cols }）

engine-e-altpnt-terrain-step-must-be-finite-and = ステップは有限かつ正でなければなりません（指定値：{ $step_deg }）

engine-e-altpnt-terrain-hgt-window-length = { "." }hgt ウィンドウの長さ { $bytes } != 2*{ $n_rows }*{ $n_cols } = { $v2 }

engine-e-altpnt-terrain-combined-altpnt-unknown-magnetic-grid = combined-altpnt：不明な magnetic_grid 列 `{ $other }`（"sealevel" または "upcont" を使用してください）

engine-e-altpnt-terrain-combined-altpnt-cannot-read-magnetic = combined-altpnt：magnetic_grid の csv_path { $csv_path } を読み込めません：{ $e }

engine-e-animation-unknown-animation-format-expected-svg = 不明なアニメーション形式 '{ $other }'：svg、html、frames、all のいずれかを指定してください

engine-e-animation-no-animation-format-given-expected = アニメーション形式が指定されていません：svg、html、frames、all のいずれかを指定してください

engine-e-animation-animation-fps-must-be-between = アニメーションの fps は 1 から 60 の間でなければなりません（指定値：{ $fps }）

engine-e-animation-animation-duration-must-be-between = アニメーションの長さは 0.5 s から 600 s の間でなければなりません（指定値：{ $duration_s }）

engine-e-animation-animation-width-must-be-between = アニメーションの幅は 480 から 3840 ピクセルの間でなければなりません（指定値：{ $width }）

engine-e-animation-duration-fps-gives-frames-the = 長さ x fps から得られるフレーム数は { $n } で、フレームシーケンスには 2 から { $v1 } のフレームが必要です

engine-e-animation-result-is-not-json = 結果は JSON ではありません：{ $e }

engine-animation-mission-time = ミッション時間（{ $lay }）

engine-animation-ffmpeg-framerate-frame-04d-svg = ffmpeg -framerate { $fps } -i frame_%04d.svg -pix_fmt yuv420p animation.mp4  （librsvg 付きでビルドされた ffmpeg が必要です。ない場合は先にフレームをラスタライズしてください）

engine-animation-further-series-were-found-but = { " " }描画されなかった系列がほかに { $omitted } 件あります（プレーヤーが表示するのは最大 { $MAX_CHARTS } パネル、一パネルあたり { $MAX_TRACES } トレースまでです）。それらは frames エクスポートのマニフェストに記載されています。

engine-antenna-altitude-beamwidth-deg-points = 高度 { $a_lo }-{ $a_hi } m x ビーム幅 { $b_lo }-{ $b_hi } deg、{ $points } 点

engine-antenna-limb-capture-is-reached-on = このグリッド（{ $grid }）ではリムキャプチャに到達します：サンプリングした { $points2 } 個の動作点のうち { $points } 個がリムをキャプチャし、軸の交差が { $crossings } 件見つかりました。サンプリングした最大のリム J/S は高度 { $altitude_m } m / ビーム幅 { $hpbw_deg } deg で { $limb_js_db } dB であり、キャプチャしきい値は { $thr } dB です。

engine-antenna-limb-capture-is-not-reached = このグリッド（{ $grid }）のどこでもリムキャプチャには到達しません（キャプチャがゼロなのではなく、リムキャプチャがないということです）：最良のリム J/S は高度 { $altitude_m } m / ビーム幅 { $hpbw_deg } deg で { $limb_js_db } dB であり、キャプチャしきい値 { $thr } dB に { $shortfall } dB 足りません。この動作点でリムをキャプチャするには、飛行時の { $p_tx_dbw } dBW に対して送信電力 { $limb_capture_tx_power_dbw } dBW が必要です。

engine-e-antenna-azimuths-must-strictly-increase = 方位角は厳密に増加していなければなりません

engine-e-antenna-azimuths-must-span-less-than = 方位角の範囲は 360 deg 未満でなければなりません

engine-e-antenna-off-boresight-angles-must-strictly = オフボアサイト角は厳密に増加していなければなりません

engine-e-antenna-gain-grid-does-not-match = ゲイングリッドが軸と一致しません

engine-e-aocs-gains-and-must-be-finite = ゲイン K と P は有限かつ正でなければなりません

engine-e-aocs-at-least-three-reaction-wheels = リアクションホイールが少なくとも三つ必要です

engine-e-aocs-wheel-spin-axis-must-be = ホイール { $i }：スピン軸は単位ベクトルでなければなりません

engine-e-aocs-wheel-js-and-max-must = ホイール { $i }：js と u_max は有限かつ正でなければなりません

engine-e-aocs-the-wheel-spin-axes-do = ホイールのスピン軸が 三次元を張っていません

engine-e-aocs-inertia-minus-the-wheels-spin = 慣性からホイールのスピン慣性を引いたものは正定値でなければなりません

engine-e-aocs-inertia-must-be-finite-and = 慣性は有限かつ対称でなければなりません

engine-e-aocs-kind-wheels-axis-must-be-non = wheels[{ $i }].axis は有限な非ゼロベクトルでなければなりません

engine-e-aocs-kind-must-be-finite-and-positive = { $n } は有限かつ正でなければなりません

engine-e-aocs-kind-duration-dt-must-be-at = duration_s / dt_s は最大 2e6 ステップでなければなりません

engine-e-aocs-kind-sample-must-be-whole-multiple = sample_s は dt_s の整数倍でなければなりません

engine-e-aocs-kind-sigma0-and-omega0-rad-must = sigma0 と omega0_rad_s は有限でなければなりません

engine-e-aocs-kind-wheels-speed0-rpm-must-be = wheels[{ $i }].speed0_rpm は有限でなければなりません

engine-e-aocs-kind-estimator-gyro-bias0-rad-must = estimator.gyro_bias0_rad_s は有限でなければなりません

engine-e-aocs-kind-estimator-star-tracker-every-must = estimator.star_tracker_every_s は dt_s 以上でなければなりません

engine-aocs-kind-aocs-wheels-slew-from-deg = aocs：ホイール { $n_w } 個、{ $duration_s } s のスルー、{ $series_err } deg から -> { $settle } | 最終 { $final_err } deg | ホイール最大 { $peak_speed } rpm | { $v7 }

engine-e-aperture-duty-unknown-service-expected-navigation-nav = 不明なサービス '{ $other }'（navigation|nav または communications|comms を指定してください）

engine-e-aperture-duty-unknown-arbitration-policy-expected-navigation = 不明な調停ポリシー '{ $other }'（navigation-priority、communications-priority、first-come-first-served のいずれかを指定してください）

engine-e-aperture-duty-contact-plan-needs-at-least = コンタクトプランには少なくとも一つのコンタクトウィンドウが必要です

engine-e-aperture-duty-apertures-must-be = apertures は 1 以上でなければなりません

engine-e-aperture-duty-the-reporting-horizon-must-be = 報告期間は有限でなければなりません

engine-e-aperture-duty-contact-has-non-finite-aos = コンタクト '{ $name }' の aos_s または los_s が有限ではありません

engine-e-aperture-duty-contact-must-have-los-aos = コンタクト '{ $name }' は los_s > aos_s でなければなりません

engine-e-aperture-duty-contact-plan-needs-at-least-2 = コンタクトプランには少なくとも一つの [[contacts]] ウィンドウが必要です

engine-aperture-duty-aperture-duty-cycle-session-on = aperture-duty-cycle：アパーチャ { $apertures } 基に対しセッション { $sessions } 件、ポリシー { $policy } の下で -> 航法デューティ { $navigation_duty }、通信デューティ { $communications_duty }、アイドル { $idle_duty }。要求された { $total_requested_s } s のうち { $total_outage_s } s が競合により失われました (MODELLED)

engine-api-study-generated = { " " }スタディを { $html_escape } で生成しました。

engine-e-api-failed-to-serialise-report-to = レポートを JSON にシリアライズできませんでした：{ $e }

engine-e-api-invalid-scenario = 無効なシナリオ：{ $e }

engine-e-api-clock-log = clock_log：{ $e }

engine-api-unknown-scenario-kind-did-you = 不明なシナリオ種別 { $other } — { $hint } ではありませんか？ `kshana kinds` で { $n } 種類の組み込み種別をすべて一覧できます。

engine-api-unknown-scenario-kind-kshana-kinds = 不明なシナリオ種別 { $other }。`kshana kinds` で { $n } 種類の組み込み種別をすべて一覧できます。

engine-api-required-fields = - **必須フィールド：** { $fields }{ "\u000A" }

engine-api-optional-fields = - **任意フィールド：** { $fields }{ "\u000A\u000A" }

engine-api-toml-parse-error = TOML 構文解析エラー：{ $e }

engine-api-could-not-classify-scenario-kind = シナリオ種別を分類できませんでした：{ $e }

engine-api-missing-required-field = { $kind_name }：必須フィールドがありません — { $options }

engine-api-missing-required-field-2 = { $kind_name }：必須フィールド "{ $entry }" がありません

engine-e-api-invalid-orbit-scenario = 無効な軌道シナリオ：{ $e }

engine-e-api-sp3-export-requires-an-orbit = SP3 エクスポートには軌道シナリオが必要です（'{ $k }' は不可）

engine-e-api-omm-export-requires-an-orbit = OMM エクスポートには軌道シナリオが必要です（'{ $k }' は不可）

engine-e-api-oem-export-requires-an-orbit = OEM エクスポートには軌道シナリオが必要です（'{ $k }' は不可）

engine-e-api-invalid-scenario-toml = 無効なシナリオ TOML：{ $e }

engine-e-api-could-not-re-serialise-scenario = シナリオを再シリアライズできませんでした：{ $e }

engine-api-scenario-jamming-availability-under-jamming = シナリオ { $r } | ジャミング { $v2 } | ジャミング下の可用性 { $availability_under_jamming }（公称 { $availability_nominal }） | 最小トラッキング { $min_tracking } | 平均 J/S { $v6 }

engine-e-api-the-result-document-already-carries = 結果文書にはすでに `{ $FIGURE_TIERS_KEY }` があります

engine-e-api-failed-to-serialise-figure-tiers = figure_tiers をシリアライズできませんでした：{ $e }

engine-e-api-builtins-invalid-scenario = 無効な { $label } シナリオ：{ $e }

engine-api-builtins-scenario-quantum-holdover-p95-classical = シナリオ { $r } | 量子ホールドオーバー { $holdover_s }s p95 { $pos_p95_m }m | 従来型ホールドオーバー { $holdover_s2 }s p95 { $pos_p95_m2 }m

engine-api-builtins-scenario-spoof-vs-ns-spec = シナリオ { $r } | スプーフィング { $scn }、仕様 { $threshold_ns } ns に対して（P_fa { $target_pfa }） | 量子セキュリティ { $security_fom }（P_md { $analytic_pmd }、MC { $mc_pmd }） { $det } | 従来型セキュリティ { $security_fom2 }（P_md { $analytic_pmd2 }、MC { $mc_pmd2 }） { $det2 }

engine-api-builtins-integrity-satellites-epochs-available-hal = インテグリティ | 衛星 { $n_sats } 機 | 利用可能なエポック { $samples_available }/{ $samples_total }（{ $report }%） | HAL { $al_h_m } m VAL { $al_v_m } m | シグマ { $sigma_uere_m } m | Stanford(V)：インテグリティイベント { $report2 } 件、HMI { $report3 } 件

engine-api-builtins-lunar-integrity-south-pole-epochs = lunar-integrity | 南極 | 利用可能なエポック { $samples_available }/{ $samples_total }（{ $report }%） | AL { $alert_limit_m } m | σ_URE { $sigma_ure_m } m | HPL { $min_hpl_m }–{ $max_hpl_m } m

engine-api-builtins-lunar-time-offset-secular-ltc = lunar-time-offset | 永年 LTC−TT レート { $secular_rate_us_per_day } µs/day（範囲 { $band_low }–{ $band_high }） | 自己ポテンシャル { $self_potential_us_per_day } 運動 { $kinetic_us_per_day } | { $horizon_days } d 時点のオフセット = { $offset_at_horizon_us } µs

engine-api-builtins-lunar-vlbi-baseline-km-beacon = lunar-vlbi | 基線 { $baseline_km } km | ビーコン距離 { $beacon_range_km } km | 遅延 { $report } µs（レート { $delay_rate_s_per_s } s/s） | 近傍場補正 { $near_field_correction_us } µs | { $horizon_hours } h にわたり { $samples } サンプル

engine-api-builtins-lunar-joint-od-clock-sats = lunar-joint-od-clock | 衛星 { $n_sat } 機、地球局 { $n_earth } 局 | 局の 3 次元誤差 VLBI あり { $station_pos_err_m } m、測距のみ { $station_pos_err_m2 } m（{ $station_observability_improvement_factor }× 向上） | 衛星位置 RMS { $sat_pos_rms_m } m | 局の時計誤差 { $station_clock_err_s } s | 観測 { $n_obs }/{ $n_params } パラメータ

engine-api-builtins-lunar-frame-realisation-points-translation = lunar-frame-realisation | { $n_points } 点 | 並進誤差 { $trans_err_norm_m } m、回転誤差 { $rot_err_norm_rad } rad、スケール誤差 { $scale_err_ppb } ppb | rms 残差 { $rms_residual_m } m | 収束 { $converged }

engine-api-builtins-moonlight-service-volume-sats-pts = moonlight-service-volume | 衛星 { $n_sats } 機（{ $geometry_label }） | { $n_grid_points } 点 × { $n_epochs } エポック | カバレッジ { $coverage_pct }%（PDOP<{ $pdop_threshold }） | 衛星 { $min_sats }–{ $max_sats } 機 | PDOP { $pdop_min }/{ $pdop_mean }/{ $pdop_max } | HPL { $hpl_min_m }–{ $hpl_max_m } m | PL 可用性 { $pl_availability_pct }% | MODELLED

engine-api-builtins-ephemeris-ure-required-vs-keplerian = { " " }| エフェメリス { $report }（{ $provenance }） 必要な σ_URE { $fmt }、ケプラー { $fmt2 }、摂動あり { $fmt3 }（Δ { $fmt4 }）

engine-api-builtins-lunar-differential-pnt-sats-illustrative = lunar-differential-pnt | 衛星 { $n_sats } 機（例示用の LCNS クラス、提携なし） | 基線 { $baseline_km } km | ユーザー誤差 { $user_error_uncorrected_m } m → { $user_error_corrected_m } m（{ $reduction_factor }× 低減） | HPL { $protection_level_m } m（σ_resid { $residual_sigma_m } m） | MODELLED

engine-api-builtins-lunar-station-coverage-points-epochs = lunar-station-coverage | { $n_grid_points } 点 x { $n_epochs } エポック x { $n_trials } 試行 | 可用性 { $v4 } % | カバレッジ { $v5 } %（p{ $percentile } <= { $accuracy_threshold_m } m） | 補正後 p{ $percentile } 3 次元 { $f }（補正なし { $f2 }） | HPL 最大 { $f3 } | MODELLED。実在のいかなるシステムについての記述でもありません

engine-api-builtins-terrain-horizon-at-the-station = { " " }| 地形水平線（{ $sources }）、局での最大 { $horizon_max_deg } deg、ユーザー地点の平均最大 { $user_horizon_max_deg_mean } deg

engine-api-builtins-lunar-interop-export-ref-frame = lunar-interop-export | REF_FRAME { $frame } / TIME_SYSTEM { $time_system } | 状態 { $n_states } 件、OEM { $oem_line_count } 行 | 適合性 { $v5 }（存在 { $present_fields } / 欠落 { $missing_fields }） | OEM ラウンドトリップ { $v8 } | 時刻メタラウンドトリップ { $v9 } | KIF { $kif_bytes } バイト | MODELLED

engine-api-builtins-scenario-optical-sync-rms-ps = シナリオ { $r } | 光学 sync_rms { $sync_rms_ps }ps range_rms { $range_rms_mm }mm adev(1s) { $adev_tau0 } | RF sync_rms { $sync_rms_ps2 }ps range_rms { $range_rms_mm2 }mm adev(1s) { $adev_tau02 }

engine-api-builtins-quantum-time-transfer-quantum-chain = quantum-time-transfer | 量子チェーン { $quantum_chain_sigma_s }s、従来型 { $classical_chain_sigma_s }s | PL { $protection_level_ns } ns | セキュリティ Pd { $security_pd }（Pfa { $monitor_pfa }） | 異常 Pd { $anomaly_pd } | トレードオフ 量子の優位 { $r }/{ $foms } | MODELLED

engine-api-builtins-quantum-gnss-free-nav-outage = quantum-gnss-free-nav | 途絶 { $outage_s }s | 量子の位置誤差 { $quantum_pos_err_m } m、従来型 { $classical_pos_err_m } m（{ $improvement_x }x） | ホールドオーバー 量子 { $quantum_holdover_s }s、従来型 { $classical_holdover_s }s（しきい値 { $threshold_m } m） | トレードオフ 量子の優位 { $r }/{ $foms } | MODELLED

engine-api-builtins-quantum-anomaly-detect-auc-quantum = quantum-anomaly-detect | AUC 量子 { $quantum_auc }、従来型 { $classical_auc } | 最小検出可能故障 量子 { $quantum_min_detectable }、従来型 { $classical_min_detectable } | 故障クラス { $fault_catalog } 件 | トレードオフ 量子の優位 { $r }/{ $foms } | MODELLED

engine-e-api-builtins-coupled-applies-to-the-fusion = { "[" }coupled] は fusion 種別にのみ適用されます

engine-api-builtins-scenario-quantum-pnt-holdover-integrity = シナリオ { $r } | 量子 PNT ホールドオーバー { $pnt_holdover_s }s（時刻 { $timing_holdover_s }s/位置 { $position_holdover_s }s） インテグリティ { $integ } セキュリティ { $security_na } | 従来型 PNT ホールドオーバー { $pnt_holdover_s2 }s（時刻 { $timing_holdover_s2 }s/位置 { $position_holdover_s2 }s） インテグリティ { $integ2 } セキュリティ { $security_na }

engine-api-builtins-scenario-fused-quantum-pnt-holdover = シナリオ { $r } | 融合 | 量子 PNT ホールドオーバー { $pnt_holdover_s }s（時刻 { $timing_holdover_s }s/位置 { $position_holdover_s }s） インテグリティ { $integ } セキュリティ { $security_na } | 従来型 PNT ホールドオーバー { $pnt_holdover_s2 }s（時刻 { $timing_holdover_s2 }s/位置 { $position_holdover_s2 }s） インテグリティ { $integ2 } セキュリティ { $security_na }

engine-api-builtins-scenario-hybrid-ukf-17-state = シナリオ { $r } | hybrid-ukf（17 状態、MODELLED） | センサー { $v2 }（q_va { $effective_q_va }） | 時計 q_wf { $clock_q_wf } q_rw { $clock_q_rw } | NIS { $nis_mean }/{ $nis_dof }、範囲 [{ $nis_chi2_lower_95 },{ $nis_chi2_upper_95 }] | NEES { $nees_mean }/{ $nees_dof }、範囲 [{ $nees_chi2_lower_95 },{ $nees_chi2_upper_95 }] | { $v14 } | 支援あり { $aided_pos_rms_m }m -> 慣性航法 { $coast_end_pos_rms_m }m（{ $coast_duration_s }s 間） | 自己整合性であり、精度ではありません

engine-api-builtins-scenario-gnss-ins-quantum-outage = シナリオ { $r } | gnss-ins | 量子の途絶時 RMS 融合 { $fused_outage_rms_m }m、単独 { $free_outage_rms_m }m（ホールド { $holdover_s }s、可用性 { $availability }） | 従来型 融合 { $fused_outage_rms_m2 }m、単独 { $free_outage_rms_m2 }m（ホールド { $holdover_s2 }s、可用性 { $availability2 }）

engine-api-builtins-scenario-gnss-sim-mean-iono = シナリオ { $r } | gnss-sim | 平均電離圏 { $mean_iono_m }m 対流圏 { $mean_tropo_m }m | RAIM 可用性 { $raim_availability } 平均 HPL { $mean_hpl_m }m VPL { $mean_vpl_m }m 故障率 { $fault_rate }

engine-api-builtins-scenario-spoof-detect-svs-db = シナリオ { $r } | spoof-detect | 衛星 { $n_sats } 機、+{ $power_advantage_db } dB{ $v4 } | { $push } プッシュ | 融合スコア { $score }（しきい値 { $fusion_threshold }） | { $verdict }

engine-api-builtins-sweep-over-pts-scale-quantum = { $parameter } に対する { $metric } のスイープ（{ $first }..{ $last }、{ $points } 点、{ $scale } スケール） | 量子 { $first2 }->{ $last2 } | 従来型 { $first3 }->{ $last3 }

engine-api-builtins-scenario-samples-gnss-nominal-best = シナリオ { $r } | { $series } サンプル中 { $nominal } が GNSS 正常 | 最良 PDOP { $fnum } 位置 { $posm } | 量子ホールドオーバー { $holdover_s }s p95 { $ns1 }ns インテグリティ { $integ } セキュリティ { $security_na } | 従来型ホールドオーバー { $holdover_s2 }s p95 { $ns12 }ns インテグリティ { $integ2 } セキュリティ { $security_na }

engine-e-api-builtins-ephemeris = エフェメリス：{ $e }

engine-api-builtins-max-el-peak-doppler-khz = { " " }| 最大仰角 { $el }° ピークドップラー { $v1 } kHz

engine-api-builtins-scenario-samples-alt-km-lat = シナリオ { $r } | { $source } | { $n_samples } サンプル | 高度 { $alt_min_km }–{ $alt_max_km } km | |緯度| ≤ { $r2 }° | 速度 { $speed_min_m_s }–{ $speed_max_m_s } m/s{ $pass }

engine-api-builtins-generic-sweep-of-over-nodes = `{ $kind }` の汎用スイープ、対象 [{ $keys }] | { $points } ノード（形状 { $shape }） | 指標 [{ $metrics }]

engine-api-builtins-gravity-map-free-inertial-drift = gravity-map | 単独慣性ドリフト { $free_inertial_drift_m } m | 重力照合 { $map_matched_error_m } m | 照合シグマ { $measurement_sigma_mgal } mGal

engine-api-builtins-reference-degree-anomaly-std-mgal = { " " }| 基準次数 { $reference_nmax } 異常標準偏差 { $reference_anomaly_std_mgal } mGal

engine-api-builtins-map-error-mc-p95-within = { " " }| 地図誤差 MC x{ $realisations } p95 { $matched_error_p95_m } m、{ $target_m } m 以内 { $v3 }%

engine-api-builtins-terrain-nav-free-inertial-drift = terrain-nav | 単独慣性ドリフト { $free_inertial_drift_m } m | 地形照合 { $matched_error_m } m（{ $v3 }x 削減） | 照合シグマ { $measurement_sigma_m } m

engine-api-builtins-terrain-slam-waypoints-free-inertial = terrain-slam | ウェイポイント { $waypoints } 個 | 単独慣性 RMS { $free_inertial_rms_m } m（最終 { $free_inertial_final_m } m） | 地形照合 RMS { $matched_rms_m } m（最終 { $matched_final_m } m、{ $v6 }x 削減） | 平均 ESS { $mean_ess }/{ $cfg } | 照合シグマ { $measurement_sigma_m } m

engine-api-builtins-combined-altpnt-free-inertial-drift = combined-altpnt | 単独慣性ドリフト { $free_inertial_drift_m } m | 重力 { $gravity_only_m } m 磁気 { $magnetic_only_m } m 地形 { $terrain_only_m } m | 融合 { $combined_m } m

engine-e-api-builtins-clock-log-needs-runs-measured = { "[" }clock_log] には runs = 1 が必要です：実測ログは一つのレコードです

engine-api-builtins-scenario-runs-quantum-holdover-p95 = シナリオ { $r } | { $runs } 回の実行 | 量子ホールドオーバー { $mean }s [{ $p05 }-{ $p95 }] p95 { $ns1 }ns セキュリティ { $security_na } | 従来型ホールドオーバー { $mean2 }s [{ $p052 }-{ $p952 }] p95 { $ns12 }ns セキュリティ { $security_na }

engine-api-builtins-scenario-quantum-holdover-p95-ns = シナリオ { $r } | 量子ホールドオーバー { $holdover_s }s p95 { $ns1 }ns インテグリティ { $integ } セキュリティ { $security_na } | 従来型ホールドオーバー { $holdover_s2 }s p95 { $ns12 }ns インテグリティ { $integ2 } セキュリティ { $security_na }

engine-api-builtins-raim-available-of-epochs-denied = { " " }| RAIM 利用可能 { $n_available }/{ $n_epochs } エポック（拒否 { $n_denied } 件、警報 { $n_alarm } 件。MODELLED）

engine-e-araim-reference-reference-case-needs-at-least = 参照ケースには少なくとも一機の衛星が必要です

engine-e-araim-reference-reference-case-needs-at-least-2 = 参照ケースには少なくとも一つのコンステレーションが必要です

engine-e-araim-reference-satellite-names-constellation-but-only = 衛星 { $i } はコンステレーション { $constellation } を指定していますが、宣言されているのは { $constellations } のみです

engine-e-araim-reference-satellite-has-non-positive-error = 衛星 { $i } の誤差分散が正ではありません

engine-e-araim-reference-both-integrity-risk-allocations-must = 二つのインテグリティリスク配分はどちらも正でなければなりません

engine-e-araim-reference-this-reference-implementation-monitors-single = この参照実装が監視するのは単一事象の故障モードのみですが、このケースの事前確率には N_fault,max = { $nfm }（複数事象の同時部分集合）が必要です。故障モードを少なく数えることはせず、拒否します。

engine-e-araim-reference-the-all-in-view-geometry = 全可視衛星の幾何が特異です

engine-e-araim-reference-no-fault-mode-is-observable = この幾何では観測可能な故障モードがありません

engine-e-araim-reference-unknown-reference-vector-known-vectors = 不明な参照ベクトル '{ $vector }'：既知のベクトル：{ $ids }（または 'all'）

engine-araim-reference-araim-reference-check-published-wg = araim-reference-check：公開された WG-C 参照ベクトル { $wanted } 件。参照自身の TOL_PL = { $tol } m に対し、合格ベクトル { $acceptance_checked } 件にわたる VPL/HPL の最悪の一致は { $worst_acceptance } m

engine-e-araim-reference-sat-needs-one-value-per = P_sat には衛星ごとに一つ、P_const にはコンステレーションごとに一つの値が必要です

engine-e-araim-reference-satellite-names-an-undeclared-constellation = 衛星が宣言されていないコンステレーションを指定しています

engine-e-araim-reference-every-prior-must-lie-in = すべての事前確率は [0, 1) の範囲内でなければなりません

engine-e-araim-reference-the-priors-need-subsets-of = 事前確率には { $n_fault_max } 件の同時事象の部分集合が必要ですが、この経路が列挙するのは最大 { $most } 件です

engine-e-araim-reference-the-all-in-view-solution = 全可視衛星の解が選択されませんでした

engine-e-araim-reference-an-add-v4-case-needs = ADD v4.2 のケースには衛星とコンステレーションが必要です

engine-e-araim-reference-nom-and-sat-need-one = b_nom と P_sat には衛星ごとに一つの値が必要です

engine-e-araim-reference-const-needs-one-value-per = P_const にはコンステレーションごとに一つの値が必要です

engine-e-araim-reference-satellite-names-an-undeclared-constellation-2 = 衛星 { $i } が宣言されていないコンステレーションを指定しています

engine-e-araim-reference-one-constellation-index-per-satellite = 衛星ごとに一つのコンステレーションインデックスが必要です

engine-e-araim-reference-satellite-names-constellation-with-no = 衛星 { $i } は ISM のないコンステレーション { $c } を指定しています

engine-e-araim-reference-fewer-than-four-satellites-above = マスクより上の衛星が四機未満です

engine-e-attack-surface-standoffs-must-contain-at-least = standoffs_m には少なくとも一つのスタンドオフが必要です

engine-attack-surface-lunar-attack-surface-afs-dbw = lunar-attack-surface | AFS { $afs_received_dbw } dBW、{ $sense } { $a } dB（範囲 { $deficit_band_lo_db }–{ $deficit_band_hi_db }、{ $shown_rounded }×/{ $shown_unrounded }× { $sense }） | スプーフィング@{ $value } m { $nearest } W | フットプリント { $a2 }% 上限、リム { $footprint_limb_captured } | スプーフィングキャプチャ { $spoof_captured }（ロック { $spoof_lock_time_s } s） | マスト到達距離 { $a3 } km | OSNMA { $nma_overhead_bps } bit/s（50 bit/s の { $a4 }%）、遅延 { $nma_auth_latency_s } s

engine-attack-surface-reached-crossing-best-db = 到達（交差 { $crossings } 件、最良 { $best_limb_js_db } dB）

engine-attack-surface-not-reached-on-this-grid = このグリッドでは未到達（最良 { $best_limb_js_db } dB、{ $best_limb_shortfall_db } dB 不足。必要 { $best_limb_capture_tx_power_dbw } dBW、飛行時 { $p_tx_dbw } dBW）

engine-attack-surface-footprint-sweep-alt-km-hpbw = { " " }| フットプリントスイープ { $s }x{ $s2 }（高度 { $v3 }-{ $v4 } km x HPBW { $bw_lo }-{ $bw_hi } deg）、キャプチャ { $v5 }-{ $v6 }% | リム { $limb }

engine-attack-surface-afs-received-dbw = AFS 受信：{ $afs_received_dbw } dBW

engine-attack-surface-deficit-db-band-db = 不足：{ $deficit_db } dB（範囲 { $deficit_band_lo_db }-{ $deficit_band_hi_db } dB、{ $deficit_factor_rounded }x/{ $deficit_factor_unrounded }x）

engine-attack-surface-capture-footprint-of-disk-limb = キャプチャフットプリント：円盤の { $a }%、リムのキャプチャ：{ $footprint_limb_captured }

engine-attack-surface-spoof-capture-pull-in-lock = スプーフィングキャプチャの引き込み：{ $spoof_captured }（ロック { $spoof_lock_time_s } s）

engine-attack-surface-mast-reach-km-osnma-bit = マスト到達距離：{ $a } km | OSNMA { $nma_overhead_bps } bit/s（{ $a2 }%）

engine-attack-surface-limb-captured-on-grid-crossing = リム：{ $na }x{ $nb } グリッドでキャプチャ、交差 { $crossings } 件

engine-attack-surface-limb-not-captured-on-grid = リム：{ $na }x{ $nb } グリッドでは未キャプチャ。必要 { $best_limb_capture_tx_power_dbw } dBW（飛行時 { $p_tx_dbw }）

engine-e-attitude-budget-altitude-km-must-be-finite = altitude_km は有限かつ正でなければなりません

engine-e-attitude-budget-inertias-must-be-finite-and = 慣性は有限かつ正でなければなりません

engine-e-attitude-budget-max-kg-m2-must-be = i_max_kg_m2 は i_min_kg_m2 以上でなければなりません

engine-e-attitude-budget-at-least-one-pointing-contributor = ポインティング寄与要因が少なくとも一つ必要です

engine-e-attitude-budget-contributor-sigma-must-be-finite = 寄与要因 '{ $name }' のシグマは有限かつ 0 以上でなければなりません

engine-attitude-budget-attitude-budget-km-kg-gg = attitude-budget：{ $altitude_km } km、ΔI { $delta_i } kg·m² -> GG トルク { $t_gg } N·m、ポインティング { $total }" RSS（支配的要因：{ $dominant }）（MODELLED のスカラー誤差配分）

engine-bench-cli-needs-value = { $name } には値が必要です

engine-bench-cli-unknown-option = 不明なオプション `{ $a }`

engine-bench-cli-unexpected-argument = 想定外の引数 `{ $pos }`

engine-bench-cli-cannot-read = { $p } を読み込めません：{ $e }

engine-bench-cli-cannot-create = { $d } を作成できません：{ $e }

engine-bench-cli-cannot-write = { $p } に書き込めません：{ $e }

engine-bench-cli-unknown-task-or = 不明なタスク `{ $t }`（a、b、c、d のいずれか）

engine-bench-cli-scored-epochs-in-folder = { $folders } 個のフォルダー内の採点済みエポック { $labels } 件

engine-bench-cli-wrote-cases-json-and-truth = { $out }/cases.json と { $out }/truth.json を書き出しました

engine-bench-cli-refused-this-commitment-is-provisional = REFUSED：このコミットメントは暫定のものであり、そのシードは公開されています。リリース用のホールドアウトではありません

engine-bench-cli-mismatch-the-seed-is-not = MISMATCH：このシードはこのコミットメントの元になったものではありません

engine-bench-cli-is-not-json = { $f } は JSON ではありません：{ $e }

engine-bench-cli-cannot-read-2 = { $i } を読み込めません：{ $e }

engine-bench-cli-result-rendered = 結果 { $results } 件を描画しました

engine-bench-cli-unknown-subcommand =
    不明なサブコマンド `{ $other }`
    { $BENCH_USAGE }

engine-bench-cli-cannot-create-an-existing-seed = { $path } を作成できません（既存のシードファイルは上書きされません）：{ $e }

engine-bench-cli-cannot-write-2 = { $path } に書き込めません：{ $e }

engine-bench-cli-seed-written-to-keep-it = シードを { $path } に書き出しました。バージョン管理にもメッセージにも含めないでください。公開されるのは下記のハッシュのみです

engine-bench-cli-test-kshana-iq-cn0-drop = b-test-kshana-iq-cn0-drop（引き継ぎ、再実行なし）

engine-bench-cli-impairment-eval-baseline = impairment-eval ベースライン：{ $det }

engine-bench-cli-no-scenario-json-under = { $root } 配下に scenario.json がありません

engine-bench-cli-is-not-json-2 = { $path } は JSON ではありません：{ $e }

engine-bench-cli-ok-mismatched-missing-unpinned = 一致 { $ok } 件、不一致 { $bad } 件、欠落 { $missing } 件、未固定 { $unpinned } 件

engine-bench-unknown-split-dev-test-or = 不明な分割 `{ $other }`（dev、test、holdout のいずれか）

engine-bench-score-for-is-not-finite = `{ $id }` のスコアが有限ではありません

engine-bench-case-have-no-score-the = スコアのないケースが { $missing } 件あります。最初のものは `{ $first_missing }` です

engine-bench-predictions-name-case-that-is = 予測に、正解データにないケース `{ $extra }` が含まれています

engine-bench-schema-must-be = `schema` は `{ $RESULT_SCHEMA }` でなければなりません

engine-bench-must-be-64-digit-hex = `{ $k }` は 64 桁の十六進 SHA-256 でなければなりません

engine-bench-truth-is-not-json = 正解データは JSON ではありません：{ $e }

engine-bench-predictions-are-not-json = 予測は JSON ではありません：{ $e }

engine-bench-truth-schema-must-be = 正解データの `schema` は `{ $TRUTH_SCHEMA }` でなければなりません

engine-bench-predictions-schema-must-be = 予測の `schema` は `{ $PREDICTIONS_SCHEMA }` でなければなりません

engine-bench-truth-was-made-under-another = 正解データは { $SPEC_VERSION } とは別の仕様バージョンで作成されました。メジャーバージョンの異なる結果が混在することはありません

engine-bench-unknown-task = 不明なタスク `{ $other }`

engine-bench-site-result-is-not-valid = 結果 { $v1 } は有効ではありません：{ $p }

engine-bench-site-result-is-task-holdout-result = 結果 { $v1 } はタスク (d) のホールドアウト結果ですが、`holdout_commitment` がありません

engine-bench-site-result-is-scored-on-provisional = 結果 { $v1 } は暫定の公開済みホールドアウトシードで採点されています。リリース用のホールドアウトではありません

engine-bench-site-result-was-scored-under-this = 結果 { $v1 } は { $v } で採点されました。このページは { $SPEC_VERSION } 向けです

engine-bench-tasks-score-for-is-not-number = `{ $k }` のスコアが数値ではありません

engine-bench-tasks-kshana-receiver-trust-35-default = kshana receiver-trust { $s }（0.35 は既定の監視統計量）

engine-bench-tasks-malformed-clock-line = 不正な時計行 `{ $line }`

engine-bench-tasks-the-clock-file-does-not = 時計ファイルが固定された SHA-256 と一致しません（取得値 { $got }、期待値 { $C_CLOCKS_SHA256 }）

engine-bench-tasks-satellite-is-not-in-the = 衛星 { $prn } は時計ファイルにありません

engine-bench-tasks-kshana-bench-baseline = kshana-bench ベースライン：{ $baseline }

engine-bench-tasks-predictions-cover-cases-the-truth = 予測がカバーするのは { $pmap } ケースで、正解データは { $tarr } ケースです

engine-bench-tasks-case-has-no-number-array = ケース `{ $id }` に数値配列がありません

engine-bench-tasks-case-needs-values-has = ケース `{ $id }` には { $n } 個の値が必要ですが、{ $a } 個です

engine-bench-tasks-case-has-non-finite-value = ケース `{ $id }` に有限でない値があります

engine-e-bin-crossover-study-serialize = { $name } のシリアライズ：{ $e }

engine-e-bin-crossover-study-write = { $path } への書き込み：{ $e }

engine-bin-crossover-study-error-cannot-create = エラー：{ $dir } を作成できません：{ $e }

engine-bin-crossover-study-done-inertial-nodes-clock-curves = 完了：慣性 { $nodes } ノード、時計 { $curves } 曲線（シード 42）

engine-bin-gen-araim-m3-study-user-epochs-ura-values-in = ユーザーエポック { $n } 件 x 3 種の URA 値を { $dt } s で処理、ユーザーエポックあたり { $v1 } ms（解を得られたもの { $ok } 件）

engine-bin-gen-validation-artifacts-wrote-docs-interop-md-export = docs/INTEROP.md（エクスポート表）を書き出しました

engine-bin-validation-report-wrote-validation-summary-to = 検証サマリーを { $path } に書き出しました

engine-e-body-pnt-unknown-body = 不明な天体 '{ $body_name }'

engine-e-body-pnt-body-pnt-navigates-around-body = body-pnt が地球リンクを使って航法を行う対象は地球以外の天体です。{ $name } はここではサポートされていません

engine-e-body-pnt-duration-and-step-must-be = duration_s と step_s は正でなければならず、エポック数は最大 20000 です。指定値：{ $duration } と { $step }

engine-e-body-pnt-user-kind-must-be-orbiter = user.kind は orbiter または surface でなければなりません。指定値：'{ $k }'

engine-e-body-pnt-user-altitude-must-be-positive = ユーザー高度は正で、離心率は [0, 0.9) の範囲内でなければなりません

engine-e-body-pnt-the-user-orbit-periapsis-is = ユーザー軌道の近点が表面より下にあります

engine-e-body-pnt-constellation-needs-to-200-satellites = コンステレーションには、少なくとも一つの軌道面に 1 から 200 機の衛星が必要です

engine-e-body-pnt-constellation-altitude-must-be-positive = コンステレーションの高度は正でなければなりません

engine-e-body-pnt-range-sigmas-must-be-positive = 測距シグマは正でなければなりません

engine-e-body-pnt-no-earth-position-relative-to = JD { $jd } における { $name } に対する地球の位置がありません

engine-e-body-pnt-serialising-report = レポートのシリアライズ：{ $e }

engine-e-body-pnt-the-report-must-serialise-to = レポートは JSON オブジェクトにシリアライズできなければなりません

engine-body-pnt-positioning-around-user-relays-at =
    { $name } 周辺の測位 — { $user_kind } ユーザー、{ $n_relays } 基のリレー（{ $r } km）、{ $n_epochs } エポック
    { "  " }地球との光時間 片道 { $one_way_light_time_s } s、往復 { $two_way_light_time_s } s、太陽・地球・天体の角度 { $sun_separation_deg } deg
    { "  " }可用性：コンステレーションのみ { $availability_relays }、地球測距あり { $availability_with_earth }（地球の可視率 { $earth_visibility }）
    { "  " }PDOP 中央値 { $opt }、RMS 誤差 コンステレーションのみ { $opt2 }、地球測距あり { $opt3 }
    { "  " }形式シグマ中央値 コンステレーションのみ { $opt4 }、地球測距あり { $opt5 }{ "\u000A" }

engine-body-pnt-positioning-around = { $name } 周辺の測位

engine-body-pnt-user-relays-earth-light-time = { $user_kind } ユーザー · リレー { $n_relays } 基 · 地球との光時間 { $one_way_light_time_s } s · MODELLED

engine-e-calibration-ensembles-e1-scenario-is-not-table = E1 シナリオがテーブルではありません

engine-e-calibration-ensembles-e1-scenario-has-no-monte = E1 シナリオに [monte_carlo] がありません

engine-e-calibration-ensembles-e1-final-error-missing = E1：final_error.{ $k } がありません

engine-calibration-ensembles-e1-is-scenarios-campaign-monte = { "\u000A" }E1 は `scenarios/campaign-monte-carlo-clock-holdover.toml` で、各 200 実現からなる 200 アンサンブルを閉形式（平均 0、シグマ = { $sigma } ns）と比較します。アンサンブル j のベースシードは 1 000 000 + 1000 j、ブートストラップシードは 20260928 + j です。ADEV の相対誤差の最大値は E2 で { $max }、E3 で { $max2 } でした（1、10、100 s 全体）。{ "\u000A" }

engine-e-campaign-empty-result-path = 結果パスが空です

engine-e-campaign-result-path-has-an-empty = 結果パス `{ $path }` に空のセグメントがあります

engine-e-campaign-result-path-bad-index-in = 結果パス `{ $path }`：`{ $part }` のインデックスが不正です

engine-e-campaign-result-path-no-field = 結果パス `{ $path }`：フィールド `{ $name }` がありません

engine-e-campaign-result-path-indexed-value-is = 結果パス `{ $path }`：インデックス指定された値が配列ではありません

engine-e-campaign-result-path-index-out-of = 結果パス `{ $path }`：インデックス { $i } が範囲外です（{ $n }）

engine-e-campaign-result-path-value-is-not = 結果パス `{ $path }`：値が数値でもフラグでもありません

engine-e-campaign-result-path-is-not-an = 結果パス `{ $path }`：`{ $k }` は配列ではありません

engine-e-campaign-result-path-must-name-one = 結果パス `{ $path }` は行ではなく一つの値を指さなければなりません

engine-e-campaign-result-path-is-not-an-2 = 結果パス `{ $path }`：`{ $name }` は配列ではありません

engine-e-campaign-metric-path-has-no-entry = 指標パス `{ $path }` は、その種別の units ブロックにエントリがありません。キャンペーンで `unit` を宣言してください

engine-e-campaign-must-be-non-empty-letters = { $what } `{ $name }` は、空でない英字、数字、`_`、`-` でなければなりません

engine-e-campaign-campaign-cannot-contain-campaign = { $label }：キャンペーンの中にキャンペーンを含めることはできません

engine-e-campaign-serialise = { $label }：シリアライズ：{ $e }

engine-e-campaign-result-did-not-parse = { $label }：結果を解析できませんでした：{ $e }

engine-e-campaign-seed-key-no-field-in = シードキー `{ $key }`：シナリオにフィールド `{ $part }` がありません

engine-e-campaign-seed-key-is-not-non = シードキー `{ $key }` は非負整数ではありません

engine-e-campaign-seed-does-not-fit-toml = シード { $seed } は TOML の整数に収まりません

engine-campaign-time-path-must-name-rows = 時刻パス `{ $t }` は `[]` で行を指さなければなりません

engine-campaign-compare-is-not-below-above = compare `{ $c }` は below、above、abs_above のいずれでもありません

engine-campaign-threshold-is-null = しきい値 `{ $p }` が null です

engine-campaign-reduce-is-not-mean-min = reduce `{ $r }` は mean、min、max、count のいずれでもありません

engine-campaign-time-path-gives-several-values = 時刻パス `{ $t }` が行ごとに複数の値を返します

engine-campaign-value-path-has-fewer-rows = 値パス `{ $y }` の行数が `{ $t }` より少ないです

engine-campaign-value-path-has-rows-time = 値パス `{ $y }` の行数は { $r } ですが、時刻パス `{ $t }` の行数は { $t_rows } です

engine-e-campaign-campaign-with-phases-needs-timeline = フェーズを持つキャンペーンには、step_s を含む [timeline] が必要です

engine-e-campaign-timeline-step-must-be-positive = timeline.step_s は正でなければなりません（指定値：{ $step }）

engine-e-campaign-phase-is-named-twice = フェーズ `{ $name }` の名前が重複しています

engine-e-campaign-phase-duration-must-be-non = フェーズ `{ $name }`：duration_s は非負でなければなりません

engine-e-campaign-phase-has-no-runs = フェーズ `{ $name }` に実行がありません

engine-e-campaign-phase-the-first-phase-has = フェーズ `{ $name }`：最初のフェーズには引き継ぎ元がありません

engine-e-campaign-phase-handoff-from-channel-which = フェーズ `{ $name }`：チャネル `{ $ch }` からの引き継ぎですが、前のフェーズはそのチャネルで終わっていません

engine-e-campaign-phase-handoff-from-run-does = フェーズ `{ $name }`：引き継ぎ元の from_run { $from_run } が存在しません

engine-e-campaign-phase-handoff-is-null = フェーズ `{ $name }`：引き継ぎ `{ $from }` が null です

engine-e-campaign-phase-handoff-run-does-not = フェーズ `{ $name }`：引き継ぎの実行 { $run } が存在しません

engine-e-campaign-phase = フェーズ `{ $name }`：{ $e }

engine-campaign-phase-run = フェーズ { $name }/実行 { $ri }

engine-e-campaign-phase-end-at-run-does = フェーズ `{ $name }`：end_at_run { $end_at_run } が存在しません

engine-campaign-duration-end-at-is-later = duration_s（end_at { $p } = { $x } s のほうが後です）

engine-campaign-duration-end-at-is-null = duration_s（end_at { $p } が null です）

engine-e-campaign-phase-side-is-not-classical = フェーズ `{ $name }`：side `{ $side }` は classical でも quantum でもありません

engine-e-campaign-phase-skip-must-be-non = フェーズ `{ $name }`：skip_s は非負でなければなりません

engine-e-campaign-phase-alarm-compare-is-not = フェーズ `{ $name }`：警報の compare `{ $compare }` は below、above、abs_above のいずれでもありません

engine-e-campaign-phase-alarm-threshold-is-null = フェーズ `{ $name }`：警報のしきい値 `{ $p }` が null です

engine-e-campaign-phase-channel-is-in-not = フェーズ `{ $name }`：チャネル `{ $channel }` の単位は { $u } で、{ $du } ではありません

engine-e-campaign-phase-channel-needs-unit = フェーズ `{ $name }`：チャネル `{ $channel }` には単位が必要です

engine-e-campaign-phase-two-runs-both-provide = フェーズ `{ $name }`：二つの実行が両方ともチャネル `{ $channel }` を提供しています

engine-e-campaign-phase-carries-which-the-previous = フェーズ `{ $name }` は `{ $ch }` を引き継ぎますが、前のフェーズはそれで終わっていません

engine-e-campaign-phase-carries-but-no-run = フェーズ `{ $name }` は `{ $ch }` を引き継ぎますが、`{ $ch }` を提供する実行がありません

engine-e-campaign-channel-is-in-in-one = チャネル `{ $name }` の単位は、あるフェーズでは { $unit }、別のフェーズでは { $unit2 } です

engine-e-campaign-at-least-one-metric-is = 指標が少なくとも一つ必要です

engine-e-campaign-metric-is-named-twice = 指標 `{ $name }` の名前が重複しています

engine-e-campaign-seed-overflow-in-the-ensemble = アンサンブルでシードがオーバーフローしました

engine-e-campaign-an-ensemble-needs-at-least = アンサンブルには少なくとも一つの実行が必要です

engine-e-campaign-sweep-takes-one-to-three = スイープの軸は一つから三つまでです（指定数：{ $axes }）

engine-e-campaign-axis-is-named-twice = 軸 `{ $name }` の名前が重複しています

engine-e-campaign-axis-needs-at-least-two = 軸 `{ $name }` には少なくとも二つのステップが必要です

engine-e-campaign-axis-scale-must-be-lin = 軸 `{ $name }`：scale は lin または log でなければなりません

engine-e-campaign-axis-log-axis-needs-positive = 軸 `{ $name }`：対数軸の両端は正でなければなりません

engine-campaign-sweep-node = スイープノード { $flat }

engine-e-campaign-monte-carlo-runs-must-be = monte_carlo.runs は少なくとも二つでなければなりません

engine-e-campaign-compose-needs-at-least-one = compose には少なくとも一つのメンバーが必要です

engine-e-campaign-shared-value-must-be-number = 共有値 `{ $name }` は数値または数値の列でなければなりません

engine-e-campaign-shared-value-is-named-twice = 共有値 `{ $name }` の名前が重複しています

engine-e-campaign-member-binds-unknown-shared = メンバー `{ $label }` が不明な共有値 `{ $name }` を束縛しています

engine-e-campaign-member = メンバー `{ $label }`：{ $e }

engine-e-campaign-metric-is-in-for-one = 指標 `{ $name }` の単位は、あるメンバーでは { $u }、`{ $label }` では { $unit } です

engine-e-campaign-member-is-named-twice = メンバー `{ $label }` の名前が重複しています

engine-e-campaign-invalid-campaign-scenario = 無効なキャンペーンシナリオ：{ $e }

engine-e-campaign-invalid-campaign = 無効なキャンペーン：{ $e }

engine-e-campaign-sweep = スイープ：{ $e }

engine-e-campaign-monte-carlo = モンテカルロ：{ $e }

engine-e-campaign-compose = コンポーズ：{ $e }

engine-e-campaign-optimize = 最適化：{ $e }

engine-campaign-of-across-the-realisations = 各実現にわたる { $what } の { $d }

engine-campaign-value-of-at-the-end = 前のフェーズの終了時点の { $ch } の値。このフェーズの { $ch } に加算されます

engine-campaign-on-the-timeline-grid-the = タイムラインのグリッド上の { $label }：各グリッド時刻以前における、所有フェーズの実行の最新サンプル（ゼロ次ホールド）。そのフェーズの実行が提供しない箇所は null

engine-campaign-values-of-the-scenario-key = 軸 { $name } に沿ったシナリオキー { $key } の値

engine-campaign-value-of-the-scenario-key = このノードにおけるシナリオキー { $key } の値

engine-campaign-of-the-node-result = ノードの結果の { $path }

engine-campaign-of-each-realisation-in-seed = 各実現の { $path }（シード順）

engine-campaign-shared-value-written-into-every = 共有値 { $name }：それを束縛するすべてのメンバーに書き込まれます

engine-campaign-metric-read-from-the-member = メンバーの結果から読み取った指標 { $name }

engine-campaign-smallest-across-the-members = メンバー間の { $name } の最小値

engine-campaign-largest-across-the-members = メンバー間の { $name } の最大値

engine-campaign-mean-across-the-members = メンバー間の { $name } の平均

engine-e-campaign-failed-to-serialise-campaign-result = キャンペーン結果をシリアライズできませんでした：{ $e }

engine-campaign-chain-phases-over-events-alarm = チェーン：{ $phases } フェーズ、{ $duration_s } s、イベント { $events } 件、警報はグリッドの { $alarm_s } s で発報

engine-campaign-sweep-of-nodes-over = `{ $scenario_kind }` のスイープ：[{ $axis_order }] にわたる { $nodes } ノード{ $v4 }

engine-campaign-monte-carlo-of-seeds = `{ $scenario_kind }` のモンテカルロ：シード { $runs } 個

engine-campaign-compose-members = コンポーズ：メンバー { $members } 個

engine-campaign-member-runs-modelled = メンバーの実行 { $runs_total } 回（MODELLED）

engine-campaign-sweep-of-over-nodes-each = `{ $scenario_kind }` のスイープ、{ $axis_order } にわたる（{ $nodes } ノード{ $v4 }。各線はそれぞれ独自の範囲）

engine-campaign-campaign-modelled-composition-every-value = キャンペーン { $r } | MODELLED の合成。すべての値は指定された種別の実際の実行から読み取ったもの

engine-e-campaign-optimize-an-optimisation-takes-one-to = 最適化の params は一つから三つまでです（指定数：{ $params }）

engine-e-campaign-optimize-param-is-named-twice = param `{ $name }` の名前が重複しています

engine-e-campaign-optimize-param-needs-finite-lo-hi = param `{ $name }`：有限の lo < hi が必要です

engine-e-campaign-optimize-param-scale-must-be-lin = param `{ $name }`：scale は lin または log でなければなりません

engine-e-campaign-optimize-param-log-param-needs-positive = param `{ $name }`：対数 param の境界は正でなければなりません

engine-e-campaign-optimize-param-start-must-lie-in = param `{ $name }`：start は [lo, hi] の範囲内でなければなりません

engine-e-campaign-optimize-param-grid-needs-steps-of = param `{ $name }`：グリッドには二以上のステップ数が必要です

engine-e-campaign-optimize-objective-target-is-only-read = objective.target は goal = "target" の場合にのみ読み込まれます

engine-e-campaign-optimize-goal-target-needs-finite-objective = goal = "target" には有限の objective.target が必要です

engine-e-campaign-optimize-objective-goal-must-be-minimize = objective.goal は minimize、maximize、target のいずれかでなければなりません（指定値：`{ $other }`）

engine-e-campaign-optimize-grid-of-nodes-is-above = { $total } ノードのグリッドは上限の 100000 を超えています

engine-e-campaign-optimize-params-steps-is-only-read = params.steps は method = "grid" の場合にのみ読み込まれます

engine-e-campaign-optimize-max-evals-must-cover-the = max_evals は初期シンプレックス（params + 1）を賄えなければなりません

engine-e-campaign-optimize-step-must-lie-in = step は (0, 1] の範囲内でなければなりません

engine-e-campaign-optimize-ftol-and-xtol-must-be = ftol と xtol は非負でなければなりません

engine-e-campaign-optimize-method-must-be-grid-or = method は grid または nelder-mead でなければなりません（指定値：`{ $other }`）

engine-campaign-optimize-optimize-eval = 最適化の評価 { $trace }

engine-campaign-optimize-lower-bound-of-the-scenario = シナリオキー { $key } の下限

engine-campaign-optimize-upper-bound-of-the-scenario = シナリオキー { $key } の上限

engine-campaign-optimize-value-of-the-scenario-key = 最良の評価におけるシナリオキー { $key } の値

engine-campaign-optimize-value-of-the-scenario-key-2 = この評価におけるシナリオキー { $key } の値

engine-campaign-optimize-target-value-of = { $what } の目標値

engine-campaign-optimize-at-the-best-evaluation = 最良の評価における { $what }

engine-campaign-optimize-of-this-evaluation-the-seed = この評価の { $what }（runs > 1 の場合はシードの平均）

engine-campaign-optimize-optimize-of-by-evals-best = `{ $scenario_kind }` の最適化 `{ $objective_name }`（{ $goal } { $o }）、手法 { $method }：評価 { $evals } 回（{ $stop_reason }）、最良 { $o2 }、位置 [{ $at }]

engine-e-ccsds-tdm-tdm-meta-start-before-ccsds = TDM：CCSDS_TDM_VERS ヘッダーの前に META_START があります

engine-e-ccsds-tdm-tdm-malformed-header-line = TDM：不正なヘッダー行：{ $line }

engine-e-ccsds-tdm-tdm-malformed-metadata-line = TDM：不正なメタデータ行：{ $line }

engine-e-ccsds-tdm-tdm-malformed-data-line = TDM：不正なデータ行：{ $line }

engine-e-ccsds-tdm-tdm-unrecognised-data-keyword = TDM：認識できないデータキーワード { $k }

engine-e-ccsds-tdm-tdm-data-line-missing-epoch = TDM：データ行 { $k } にエポックがありません

engine-e-ccsds-tdm-tdm-data-line-missing-value = TDM：データ行 { $k } に値がありません

engine-e-ccsds-tdm-tdm-data-line-bad-value = TDM：データ行 { $k } の値 { $val_str } が不正です

engine-e-ccsds-tdm-tdm-unterminated-segment-missing-meta = TDM：終了していないセグメント（META_STOP/DATA_STOP がありません）

engine-e-ccsds-tdm-tdm-bad-turnaround-numerator = TDM：不正な TURNAROUND_NUMERATOR { $value }

engine-e-ccsds-tdm-tdm-bad-turnaround-denominator = TDM：不正な TURNAROUND_DENOMINATOR { $value }

engine-e-cislunar-arc-recovery-unknown-observable-expected-one-of = 不明な観測量 `{ $other }`：range、range-rate のいずれかを指定してください

engine-e-cislunar-arc-recovery-unknown-coordinates-expected-one-of = 不明な座標 `{ $other }`：cartesian、polar のいずれかを指定してください

engine-e-cislunar-arc-recovery-arc-hours-must-be-finite = arc_hours は有限かつ正でなければなりません（指定値：{ $arc_hours }）

engine-e-cislunar-arc-recovery-epochs-must-be-got = epochs は ≥ 2 でなければなりません（指定値：{ $epochs }）

engine-e-cislunar-arc-recovery-steps-must-be = steps は ≥ 1 でなければなりません

engine-e-cislunar-arc-recovery-trials-must-be = trials は ≥ 1 でなければなりません

engine-e-cislunar-arc-recovery-max-iterations-must-be = max_iterations は ≥ 1 でなければなりません

engine-e-cislunar-arc-recovery-displacement-nd-must-be-finite = displacement_nd は有限かつ正でなければなりません（指定値：{ $displacement_nd }）

engine-e-cislunar-arc-recovery-recovery-factor-must-be-finite = recovery_factor は有限かつ正でなければなりません（指定値：{ $recovery_factor }）

engine-e-cislunar-arc-recovery-error-bound-km-must-be = error_bound_km は有限かつ正でなければなりません（指定値：{ $error_bound_km }）

engine-e-cislunar-arc-recovery-sigma-range-must-be-finite = sigma_range_m は有限かつ正でなければなりません（指定値：{ $sigma_range_m }）

engine-e-cislunar-arc-recovery-sigma-range-rate-mm-must = sigma_range_rate_mm_s は有限かつ正でなければなりません（指定値：{ $sigma_range_rate_mm_s }）

engine-e-cislunar-arc-recovery-the-constellation-must-carry-at = コンステレーションには少なくともチーフと一つの参照が必要です

engine-e-cislunar-arc-recovery-family-is-an-out-of = ファミリー `{ $family }` は面外ファミリーであり、平面の四状態表現を持ちません。スイープするには spatial = true を設定してください

engine-e-cislunar-arc-recovery-the-forward-model-produced-non = 順方向モデルが有限でない真値の測定値を生成しました

engine-cislunar-arc-recovery-first-arc-length-at-which = シード付きの全試行のノイズなし一括解が、最終状態誤差を、出発時の事前変位の { $recovery_factor } 倍以下にまで下げる最初のアーク長。これはランク基準に対応する回復版の基準です。測定値が正確であれば、問いは `is the state observable?` から `can an estimator get it back?` に変わり、特異値の許容差は答えに入りません。

engine-cislunar-arc-recovery-first-arc-length-at-which-2 = シード付きの { $trials } 個のノイズ実現にわたるモンテカルロ RMS 位置回復誤差が { $error_bound_km } km 以下になる最初のアーク長。これは推定可能性基準に対応する回復版の基準で、予測ではなく測定によるものです。誤差は推定値から既知の真値までの距離であり、形式共分散のトレースではありません。

engine-cislunar-arc-recovery-corroborated-within-one-epoch-grid = CORROBORATED（エポックグリッドの一ステップ以内）：推定器は { $e } h から回復し、グラミアンのランク基準は { $g } h で切り替わります（比 { $v1 }、グリッド { $grid_hours } h）。

engine-cislunar-arc-recovery-not-corroborated-as-recoverability-boundary = NOT CORROBORATED（回復可能性の境界として）：推定器は { $e } h から回復します。グラミアンのランク基準の { $g } h との関係：{ $v1 }（比 { $v2 }、グリッド { $grid_hours } h）。ランク基準は相対的な特異値の慣例であり、回復の境界は測定された状態誤差であるため、ここでは両者は一致しません。

engine-cislunar-arc-recovery-not-corroborated-the-estimator-never = NOT CORROBORATED：このアークでは推定器が回復の基準を一度も満たさない一方、グラミアンのランク基準は { $g } h で切り替わります。

engine-cislunar-arc-recovery-the-gramian-rank-criterion-is = このアークではグラミアンのランク基準が一度も満たされません（幾何がフルランクに達しません）が、推定器は { $e } h から回復します。境界が存在するかどうかについて、両者の見解が食い違っています。

engine-cislunar-arc-recovery-cislunar-arc-recovery-family-state = cislunar-arc-recovery | { $family } ファミリー、{ $state_dim } 状態、{ $n_spacecraft } s/c、観測量 { $observable }、パラメータ化 { $coordinates } | { $arc_hours } h アーク、{ $epochs } エポック（グリッド { $grid_hours } h）、{ $trials } 試行、シード { $seed } | 有限差分による偏微分、解析的ヤコビアン / STM / SVD / SRIF なし | ノイズなしの回復 { $nf } から（係数 { $recovery_factor }）、グラミアンのランクしきい値 { $gram } | モンテカルロの推定可能性 { $est } から（RMS 位置 ≤ { $error_bound_km } km、σ { $sigma_range_m } m）、グラミアンの推定可能性 { $gram_est } | アーク終端の RMS 位置 { $last } km

engine-e-cislunar-observability-unknown-family-expected-one-of = 不明なファミリー `{ $other }`：dro、halo、nrho のいずれかを指定してください

engine-e-cislunar-observability-dro-at-crossing-distance-did = 交差距離 { $d } の DRO は差分補正で収束しませんでした

engine-e-cislunar-observability-member-at-x0-did-not = { $label } のメンバー { $i }（x0 = { $x0 }）は差分補正で収束しませんでした

engine-e-cislunar-observability-spacecraft-must-be-between-and = n_spacecraft は 2 から { $MAX_SPACECRAFT } の間でなければなりません（指定値：{ $n }）

engine-e-cislunar-observability-epochs-must-be-got = epochs は ≥ 2 でなければなりません（指定値：{ $n_epochs }）

engine-e-cislunar-observability-rel-tol-must-be-finite = rel_tol は有限かつ正でなければなりません（指定値：{ $rel_tol }）

engine-e-cislunar-observability-sigma-range-must-be-finite = sigma_range_m は有限かつ非負でなければなりません（指定値：{ $sigma_range_m }）

engine-e-cislunar-observability-sigma-pos-threshold-km-must = sigma_pos_threshold_km は有限かつ正でなければなりません（指定値：{ $sigma_pos_threshold_km }）

engine-cislunar-observability-cislunar-observability-refs-arc-epochs = cislunar-observability | { $c } s/c（参照 { $refs } 個） | { $arc_hours } h アーク、{ $rank_arc } エポック | ランク { $first } → { $last }（{ $state_dim } 中、アーク全体） | グラミアン λ [{ $min_eigenvalue }…{ $max_eigenvalue }] 条件数 { $condition_str } | 瞬時ランク 測距のみ { $rank_range_only } → 測距＋速度 { $rank_range_rate }（{ $n_links } リンク） | GDOP 測距のみ { $ro } 測距＋速度 { $rr } | DRO 初期条件（最大周期性残差 { $max_resid }） | SRIF 事後分布は rank-4 エポック { $srif_epoch } で有限（ランク/STM/DRO 閉合/SRIF は検証済み、設計はモデル化）

engine-cislunar-observability-never-rank-of = 到達せず（{ $state_dim } 中ランク { $rank }）

engine-cislunar-observability-family-state-range-rank-threshold = { $base } | { $family } ファミリー、{ $state_dim } 状態、{ $n_spacecraft } s/c、σ_range { $sigma_range_m } m | ランクしきい値 { $rank_thr }（グリッド { $c } h） | 推定可能性しきい値（σ_pos ≤ { $sigma_pos_threshold_km } km）{ $est_thr }

engine-cislunar-observability-first-arc-length-at-which = チーフの初期状態の形式的な 1σ 位置不確かさ、すなわち σ_pos = sqrt(trace(P_rr))（P = (ÕᵀÕ)⁻¹、Õ は測定ノイズで白色化した可観測性行列）が { $sigma_pos_threshold_km } km 以下になる最初のアーク長。これは、アーク長のしきい値がそもそもノイズに依存するような基準です。P は σ² に比例して変化するため σ_pos は σ に比例しますが、上記のランク基準は σ によって動きません。この境界はフィットしたものではなく、明示された工学的な選択です。estimability_sweep は他の四つの境界でのしきい値を報告します。

engine-cislunar-observability-extension-r3-this-run-is = 拡張（R3）— この実行は、上記の `label` が記述する平面 DRO 構成ではありません。状態次元 { $state_dim }、軌道ファミリー { $family }、{ $n_spacecraft } 機の宇宙機、測距シグマ { $sigma_range_m } m。`label` が「planar」や「planar DROs」と述べている箇所は、ここに示したファミリーに読み替えてください。VALIDATED となる追加点：6x6 の変分 STM は、全幅で使われる有限差分で検証済みの CR3BP STM（crate::cr3bp）と同一です。空間の測距・測距速度のヤコビアン行は有限差分で検証済みの解析的偏微分であり、測距速度の行は、クレートの独立した 3-D の deepspace_od::range_rate_observable と成分ごとに突き合わせて確認しています。halo / NRHO の初期条件は、公表されている L2 南側 9:2 NRHO を再現するのと同じ補正器による差分補正済みの周期軌道で、その公表シードから連続的に延長したものであり、各メンバーの閉合残差を報告します。六状態のランクの判定は、固有値/SVD の経路とコードを共有しない独立した行階段形によるランク（部分ピボット選択付きのガウスの消去法）で確認済みです。SRIF の部分の正直な適用範囲：上記の SRIF による相互検証は同じ測定ヤコビアンを使い、同じ O^T O に帰着するため、その一致は二つの数値計算機の間の整合性チェックであり、しきい値の独立した裏付けではありません。ここにあるいかなる数値についても、検証としては数えません。MODELLED となる点：ファミリーの設計（どの横座標、振幅、位相か）、エポックグリッド、単一リンクのアーク、および推定可能性基準で明示された位置の境界。

engine-cislunar-observability-validated-each-constellation-initial-condition = 検証済み：コンステレーションの各初期条件は { $family } ファミリーの差分補正済み周期軌道であり、一周期にわたって閉じ、報告された周期性残差に収まります（平面 DRO はさらに月の周りの逆行軌道です）。ファミリーは地球・月の質量比で補正されています。モデル化：ファミリーのパラメータと位相の選択（コンステレーション設計）。キー名 `dro_provenance` は公開済みの文書スキーマのために維持されており、この実行が求めたファミリーが何であってもそれを保持します。

engine-e-clock-integrity-integrity-must-be-finite-and = integrity：{ $n } は有限かつ正でなければなりません（指定値：{ $v }）

engine-e-clock-integrity-integrity-must-lie-in-got = integrity：{ $n } は (0, 1) の範囲内でなければなりません（指定値：{ $v }）

engine-e-clock-integrity-integrity-mask-deg-must-lie = integrity：mask_deg は [0, 90) の範囲内でなければなりません

engine-e-clock-integrity-integrity-systems-must-name-at = integrity：systems には少なくとも一つのプリセットを指定しなければなりません

engine-e-clock-integrity-integrity-injected-bias-needs-finite = integrity：injected_bias には有限の bias_m、t0_s、t1_s が必要です

engine-e-clock-integrity-integrity-epochs-exceed-the-epoch = integrity：{ $n } エポックは { $MAX_EPOCHS } エポックの上限を超えています。step_s を大きくしてください

engine-e-clock-library-card-no-records = { $name }：レコードがありません

engine-e-clock-library-card-records-at-different-tau0 = { $name }：レコードの tau0 が異なります

engine-e-clock-library-card-periodic-least-squares-failed = { $name }：周期的最小二乗法に失敗しました

engine-e-clock-library-card-stability-points-with-edf-card = { $name }：edf >= { $MIN_FIT_EDF } の安定度点は { $used } 個です。カードには三つ必要です

engine-clock-library-condition-gaps-phase-outliers-phase-steps = 欠測 { $g }、位相外れ値 { $o }、位相ステップ { $p }、バースト { $b }、周波数ステップ { $f }（ロバスト sigma_y { $sigma_y }）

engine-e-compliance-is-not-non-negative-integer = `{ $p }` は非負整数ではありません

engine-e-compliance-is-missing = `{ $p }` がありません

engine-compliance-events-detected-exceeds-events-evaluable = events_detected { $ed } が events_evaluable { $ee } を超えています

engine-compliance-predictions-agreeing-exceeds-predictions-evaluable = predictions_agreeing { $pa } が predictions_evaluable { $pe } を超えています

engine-compliance-receiver-trust-counts-malformed-excluded = { $label }：receiver-trust の件数が不正です（{ $malformed_counts }）。除外します

engine-e-compliance-not-json = { $label }：JSON ではありません：{ $e }

engine-compliance-cannot-read = { $label }：読み込めません：{ $e }

engine-e-compliance-the-sibling-scenario-says-kind = { $label }：隣接するシナリオは種別 `{ $s }` としていますが、結果は `{ $o }` としています。使用しません

engine-e-compliance-scenario-kind-not-found-no = { $label }：シナリオ種別が見つかりません（隣接するシナリオファイルがなく、receiver-trust の結果でもなく、トップレベルの `kind` もありません）

engine-e-compliance-is-not-scenario-kind-the = { $label }：`{ $kind }` はエンジンが知っているシナリオ種別ではありません。使用しません

engine-compliance-written-by-kshana = kshana { $engine_version } が書き出しました。{ "\u000A\u000A" }

engine-compliance-test-with-every-stated-bar =
    ### { $cell } ({ $cell2 })

    明示された合格基準をすべて満たしたテスト { $met } 件、合格基準を満たさなかったもの { $not_met } 件、入力待ち { $needs_input } 件。{ "\u000A\u000A" }

engine-e-conflict-resilience-intensity-grid-must-have-finite = 強度グリッドには有限の min < max が必要です（指定値：[{ $min }, { $max }]）

engine-e-conflict-resilience-intensity-grid-needs-steps-got = 強度グリッドには >= 2 のステップ数が必要です（指定値：{ $steps }）

engine-e-conflict-resilience-correlation-grid-must-have-at = 相関グリッドには少なくとも一つの値が必要です

engine-e-conflict-resilience-correlation-values-must-lie-in = 相関値は [0, 1] の範囲内でなければなりません（指定値：{ $r }）

engine-e-conflict-resilience-conflict-resilience-needs-at-least = conflict-resilience には少なくとも一つのレイヤーが必要です

engine-e-conflict-resilience-layer-availability-not-in = レイヤー { $i } の可用性 { $availability } が [0, 1] の範囲外です

engine-e-conflict-resilience-layer-sigma-must-be-finite = レイヤー { $i } の sigma_m は有限かつ正でなければなりません

engine-e-conflict-resilience-layer-vulnerability-must-be-finite = レイヤー { $i } の vulnerability は有限かつ >= 0 でなければなりません

engine-e-conflict-resilience-layer-vector-weight-must-be = レイヤー { $i } の vector_weight は有限かつ >= 0 でなければなりません

engine-e-conflict-resilience-primary-layer-out-of-range = primary_layer { $primary } が範囲外です（0..{ $layers }）

engine-e-conflict-resilience-trials-must-be = trials は >= 1 でなければなりません

engine-conflict-resilience-conflict-resilience-layers-baseline-reference = conflict-resilience | レイヤー { $layers } 層（ベースライン { $primary }） | 基準強度 { $reference_intensity } | レジリエンス比 閉形式 { $ratio_closed_form }x MC { $ratio_mc_independent }x（多層と単層の比較） | 相関が多層化を無効にする：比 { $first }x @ rho { $first2 } -> { $last }x @ rho { $last2 } | 事前 CI [{ $ratio_lo }-{ $ratio_hi }]x | ベクトル別の生存率 @ 基準ジャミング { $surv }% スプーフィング { $surv2 }% 物理的攻撃 { $surv3 }% サイバー { $surv4 }%（最も鋭い { $sharpest }） | 約 7x という主要数値は MODELLED、VALIDATED MC->閉形式 / fuse-identity / copula-marginals / ベクトル別生存率

engine-e-constellation-unknown-central-body-expected-planet = 不明な中心天体 { $name }：惑星、冥王星、月、または主要な衛星（earth、moon、mars、europa、titan など。crate::body::SOLAR_SYSTEM を参照）を指定してください

engine-e-constellation-walker-shell-needs-total-and = Walker シェルには total > 0 かつ planes > 0 が必要です

engine-e-constellation-walker-total-is-not-multiple = Walker の total { $total } は planes { $planes } の倍数ではありません

engine-e-constellation-walker-phasing-must-lie-in = Walker の位相 F = { $phasing } は 0..planes（= { $planes }）の範囲内でなければなりません

engine-e-constellation-is-not-an-expandable-gps = { $name } は拡張可能な GPS スロットではありません（SPS PS Table 3.2-2 に挙げられているのは B1、D2、F2、A2、C4、E3）

engine-e-constellation-give-altitude-km-or-semi = { $what }：altitude_km と semi_major_axis_km のどちらか一方を指定してください（両方は不可）

engine-e-constellation-needs-altitude-km-or-semi = { $what }：altitude_km または semi_major_axis_km が必要です

engine-e-constellation-semi-major-axis-km-is = { $what }：軌道長半径 { $v1 } km が { $name } の半径を上回っていません

engine-e-constellation-eccentricity-must-lie-in = { $what }：離心率 { $e } は [0, 0.9) の範囲内でなければなりません

engine-e-constellation-perigee-is-below-the-surface = { $what }：近地点が { $name } の表面より下にあります

engine-e-constellation-constellation-preset-is-an-earth = コンステレーション { $name }：プリセット { $p } は地球のコンステレーションですが、天体は { $name2 } です

engine-e-constellation-constellation-unknown-preset-expected-gps = コンステレーション { $name }：不明なプリセット { $other }（gps-baseline、gps-expandable、galileo、beidou、beidou-meo、glonass のいずれかを指定してください）

engine-e-constellation-constellation-expanded-applies-only-to = コンステレーション { $name }：`expanded` は gps-expandable プリセットにのみ適用されます

engine-constellation-constellation-shell = コンステレーション { $name } シェル { $v2 }

engine-constellation-explicit-element-sets = 明示的な軌道要素セット { $satellite } 件

engine-constellation-constellation-satellite = コンステレーション { $name } 衛星 { $v2 }

engine-e-constellation-constellation-has-no-satellites-give = コンステレーション { $name } に衛星がありません：プリセット、[[constellation.shell]]、または [[constellation.satellite]] を指定してください

engine-e-constellation-no-constellation-given = コンステレーションが指定されていません

engine-e-constellation-constellations-with-one-clock-each = 時計を一つずつ持つコンステレーション { $constellations } 個は、{ $MAX_CLOCKS } 個という時計数の上限を超えています。clock = "common" を使うか、コンステレーションを統合してください

engine-e-constellation-must-be-finite = { $what } は有限でなければなりません

engine-e-constellation-need-step-and-duration-step = step_s > 0 かつ duration_s >= step_s が必要です

engine-e-constellation-more-than-100-000-epochs = エポック数が 100 000 を超えています。step_s を大きくしてください

engine-e-constellation-mask-deg-must-lie-in = mask_deg は [0, 90) の範囲内でなければなりません

engine-e-constellation-pdop-threshold-must-be-positive = pdop_threshold は正でなければなりません

engine-e-constellation-grid-step-deg-must-lie = grid_step_deg は [0.25, 90] の範囲内でなければなりません

engine-e-constellation-need-90-lat-min-deg = -90 <= lat_min_deg < lat_max_deg <= 90 が必要です

engine-e-constellation-need-lon-min-deg-lon = lon_min_deg < lon_max_deg かつ範囲が最大 360 deg である必要があります

engine-e-constellation-give-at-least-one-constellation = [[constellation]] を少なくとも一つ指定してください

engine-e-constellation-track-points-is-capped-at = track_points の上限は 2000 です

engine-e-constellation-satellites-exceeds-the-50-000 = 衛星数 { $total } は上限の 50 000 を超えています

engine-constellation-constellation-design-satellites-around-the = constellation-design：{ $name } の周回衛星 { $total } 機（{ $names }）。可用性 { $global_availability_pct }%（仰角マスク { $mask_deg } deg で PDOP <= { $pdop_threshold }）、最悪地点 { $worst_site_availability_pct }%、PDOP 中央値 { $cov }、可視衛星数の平均 { $global_mean_visible } 機、グリッド点 { $grid_points } x { $epochs } エポック（MODELLED）

engine-constellation-constellation-coverage-over-the = { $name } 上のコンステレーションカバレッジ

engine-e-contact-schedule-link-must-be-finite-and = link.{ $n } は有限かつ正でなければなりません

engine-e-contact-schedule-link-must-be-finite-and-2 = link.{ $n } は有限かつ >= 0 でなければなりません

engine-e-contact-schedule-link-eirp-dbw-must-be = link.eirp_dbw は有限でなければなりません

engine-e-contact-schedule-satellite-altitude-km-must-be = 衛星 '{ $name }'：altitude_km は (100, 40000) の範囲内でなければなりません

engine-e-contact-schedule-satellite-inclination-deg-must-be = 衛星 '{ $name }'：inclination_deg は [0, 180] の範囲内でなければなりません

engine-e-contact-schedule-satellite-backlog-mbit-must-be = 衛星 '{ $name }'：backlog_mbit は >= 0 でなければなりません

engine-e-contact-schedule-satellite-priority-must-be = 衛星 '{ $name }'：priority は > 0 でなければなりません

engine-e-contact-schedule-satellite-eirp-dbw-must-be = 衛星 '{ $name }'：eirp_dbw は有限でなければなりません

engine-e-contact-schedule-station-lat-deg-in-90 = 地上局 '{ $name }'：lat_deg は [-90, 90] の範囲内、lon_deg は有限でなければなりません

engine-e-contact-schedule-station-mask-deg-must-be = 地上局 '{ $name }'：mask_deg は [0, 90) の範囲内でなければなりません

engine-e-contact-schedule-station-alt-must-be-in = 地上局 '{ $name }'：alt_m は [0, 3000] の範囲内でなければなりません（ITU-R P.834 の範囲）

engine-e-contact-schedule-station-setup-and-over-db = 地上局 '{ $name }'：setup_s >= 0 かつ g_over_t_db は有限でなければなりません

engine-e-contact-schedule-duration-hours-must-be-in = duration_hours は (0, 168] の範囲内でなければなりません

engine-e-contact-schedule-step-must-be-in-300 = step_s は (0, 300] の範囲内でなければなりません

engine-e-contact-schedule-at-least-one-satellite-and = 衛星と地上局がそれぞれ少なくとも一つ必要です

engine-e-contact-schedule-at-most-32-satellites-and = 衛星は最大 32 機、地上局は最大 32 局です

engine-contact-schedule-contact-schedule-satellites-stations-over = contact-schedule：衛星 { $satellites } 機 x 地上局 { $stations } 局、{ $duration_hours } h にわたり -> 候補コンタクト { $cands } 件、スケジュール済み { $greedy } 件。{ $total_backlog } Mbit のうち { $total_del } Mbit を配信{ $v8 }（MODELLED）

engine-contact-schedule-acm-link-pass-es-acm = acm-link：パス { $pairs } 件。ACM { $acm } Mbit、CCM { $ccm } { $ccm_v } Mbit{ $v5 }（MODELLED）

engine-e-dop-error-ci-need-at-least-trials-and = 2 回以上の試行と、有限で > 0 の sigma_m が必要です

engine-e-dop-error-ci-alpha-total-must-be-in = alpha_total は (0, 1) の範囲内でなければなりません

engine-e-dop-error-ci-no-local-frame-at-the = ユーザー位置にローカルフレームがありません

engine-e-dop-error-ci-singular-geometry = { $name }：幾何が特異です

engine-e-dop-error-ci-no-noise-free-fix = { $name }：ノイズなしの測位解がありません

engine-e-dop-error-ci-no-fix = { $name }：測位解がありません

engine-e-dop-error-mc-singular-geometry = { $label }：幾何が特異です

engine-e-dop-error-mc-no-fix = { $label }：測位解がありません

engine-e-earth-gnss-lunar-altitude-km-must-be-positive = altitude_km は正でなければなりません（指定値：{ $altitude_km }）

engine-e-earth-gnss-lunar-planes-and-sats-per-plane = planes と sats_per_plane はどちらもゼロ以外でなければなりません

engine-e-earth-gnss-lunar-freq-hz-must-be-positive = freq_hz は正でなければなりません（指定値：{ $freq_hz }）

engine-e-earth-gnss-lunar-tx-efficiency-must-be-in = tx_efficiency は (0, 1] の範囲内でなければなりません（指定値：{ $tx_efficiency }）

engine-e-earth-gnss-lunar-system-temp-must-be-positive = system_temp_k は正でなければなりません（指定値：{ $temp_k }）

engine-e-earth-gnss-lunar-back-lobe-suppression-db-must = back_lobe_suppression_db は非負でなければなりません（指定値：{ $back_lobe_suppression_db }）

engine-e-earth-gnss-lunar-receiver-range-must-be-outside = receiver_range_m は地球の外側でなければなりません（指定値：{ $range_m }）

engine-earth-gnss-lunar-earth-gnss-at-lunar-distance = 月距離における地球 GNSS — 衛星 { $n_satellites } 機、受信機は { $r } km{ "\u000A" }

engine-earth-gnss-lunar-earth-limb-from-the-constellation = { "  " }コンステレーションから見た地球のリム：天底から { $earth_limb_half_angle_deg } deg — 月に向かう電波の経路はすべてこれを超えなければなりません{ "\u000A" }

engine-earth-gnss-lunar-of-not-occulted-clear-the = { "  " }{ $n_satellites } 機中 { $n_geometrically_visible } 機が遮蔽されておらず、{ $n_trackable } 機が { $tracking_threshold_dbhz } dB-Hz の追尾しきい値を満たします{ "\u000A" }

engine-earth-gnss-lunar-best-link-db-hz = { "  " }最良リンク { $c } dB-Hz{ "\u000A" }

engine-earth-gnss-lunar-every-trackable-line-of-sight = { "  " }追尾可能な視線はすべて { $a } deg の半円錐の内側にあり、幾何はほぼ縮退しています{ "\u000A" }

engine-earth-gnss-lunar-gdop-pdop-hdop-vdop-tdop = { "  " }GDOP { $gdop }  PDOP { $pdop }  HDOP { $hdop }  VDOP { $vdop }  TDOP { $tdop }{ "\u000A" }

engine-earth-gnss-lunar-sweep-over-epochs-signal-availability = { "  " }{ $epochs } エポック / { $span_s } s にわたるスイープ：信号の可用性 { $signal_availability }、FIX の可用性 { $fix_availability }{ "\u000A" }

engine-earth-gnss-lunar-trackable-links-mean-max-best = { "    " }追尾可能リンク 平均 { $mean_trackable }、最大 { $max_trackable }、最良 C/N0 { $w }、最良 PDOP { $w2 }{ "\u000A" }

engine-e-entry-eo-ascent-ascent-between-one-and-six-stages = ステージは一つから六つまで必要です

engine-e-entry-eo-ascent-ascent-stages-dry-mass-kg-must = stages[{ $i }].dry_mass_kg は有限かつ非負でなければなりません

engine-e-entry-eo-ascent-ascent-stages-exit-area-m2-must = stages[{ $i }].exit_area_m2 は有限かつ非負でなければなりません

engine-e-entry-eo-ascent-ascent-payload-kg-must-be-finite = payload_kg は有限かつ非負でなければなりません

engine-e-entry-eo-ascent-ascent-kick-altitude-must-be-finite = kick_altitude_m は有限かつ非負でなければなりません

engine-e-entry-eo-ascent-ascent-kick-angle-deg-must-be = kick_angle_deg は [0, 45) の範囲内でなければなりません

engine-e-entry-eo-ascent-ascent-kick-duration-must-be-finite = kick_duration_s は有限かつ非負でなければなりません

engine-e-entry-eo-ascent-ascent-lift-off-thrust-to-weight = リフトオフ時の推力重量比 { $tw } は 1 を超えなければなりません

engine-entry-eo-ascent-ascent-ascent-losses-ideal-dv-losses = ascent-losses：理想 dv { $ideal_dv_m_s } m/s、損失 { $losses } m/s（重力 { $gravity_loss_m_s }、抗力 { $drag_loss_m_s }、操舵 { $steering_loss_m_s }、背圧 { $back_pressure_loss_m_s }）。燃焼終了 { $r } km、{ $end_speed_m_s } m/s、ガンマ { $r2 } deg。最大動圧 { $r3 } kPa（MODELLED）

engine-e-entry-eo-ascent-entry-heating-must-be-finite-and-positive = { $name } は有限かつ正でなければなりません

engine-e-entry-eo-ascent-entry-heating-body-must-be-earth-or = body は "earth" または "mars" でなければなりません（指定値："{ $other }"）

engine-e-entry-eo-ascent-entry-heating-atmosphere-is-not-available-for = 大気 "{ $a }" は天体 "{ $b }" では使用できません（earth：us76|exponential、mars：mars|exponential）

engine-e-entry-eo-ascent-entry-heating-flight-path-angle-deg-must = flight_path_angle_deg は (0, 90) の範囲内でなければなりません（下向きが正）

engine-e-entry-eo-ascent-entry-heating-entry-interface-altitude-must-be = entry_interface_altitude_m は [20 km, 1000 km] の範囲内でなければなりません

engine-e-entry-eo-ascent-entry-heating-latitude-deg-must-be-finite = latitude_deg は有限で、|latitude| < 89 deg でなければなりません

engine-e-entry-eo-ascent-entry-heating-heading-deg-and-longitude-deg = heading_deg と longitude_deg は有限でなければなりません

engine-e-entry-eo-ascent-entry-heating-lift-to-drag-must-be = lift_to_drag は [0, 3] の範囲内でなければなりません

engine-e-entry-eo-ascent-entry-heating-bank-angle-deg-must-be = bank_angle_deg は有限でなければなりません

engine-e-entry-eo-ascent-entry-heating-step-must-be-in = step_s は (0, 1] s の範囲内でなければなりません

engine-e-entry-eo-ascent-entry-heating-terminal-altitude-must-be-in = terminal_altitude_m は [0, entry_interface_altitude_m) の範囲内でなければなりません

engine-e-entry-eo-ascent-entry-heating-max-time-must-be-in = max_time_s は (0, 20000] s の範囲内でなければなりません

engine-e-entry-eo-ascent-entry-heating-velocity-frame-must-be-inertial = velocity_frame は inertial|relative でなければなりません（指定値："{ $o }"）

engine-entry-eo-ascent-entry-heating-entry-heating-rel-peak-at = entry-heating（{ $body }）：V_rel { $speed_m_s } m/s、γ { $gam_abs }° -> ピーク { $pk_g } g（{ $r } km）、ピーク q { $r2 } W/cm²（{ $r3 } km）、熱負荷 { $r4 } J/cm²、ピーク q_dyn { $r5 } kPa。{ $outcome }（{ $end_time_s } s）（閉形式 { $cf_g } g。MODELLED の 3-DoF、放射加熱/TPS なし）

engine-e-entry-eo-ascent-eo-radiometry-must-be-in = { $n } は (0, 1] の範囲内でなければなりません

engine-e-entry-eo-ascent-eo-radiometry-must-be-finite-and-non = { $n } は有限かつ非負でなければなりません

engine-e-entry-eo-ascent-eo-radiometry-sun-zenith-deg-must-be = sun_zenith_deg は [0, 90) の範囲内でなければなりません

engine-e-entry-eo-ascent-eo-radiometry-adc-bits-must-be-in = adc_bits は 1..=24 の範囲内でなければなりません

engine-entry-eo-ascent-eo-radiometry-eo-radiometry-gsd-snr-well = eo-radiometry：GSD { $gsd } m、Q { $im }、SNR { $snr }（ウェル { $v4 } %）、ナイキストでの MTF { $fac }、RER { $rer }、GIQE4 NIIRS { $niirs }（MODELLED）

engine-e-eo-payload-nadir-angle-exceeds-the-earth = 天底角 { $eta_rad }° が地球の角半径 { $rho }° を超えています（地球を外れます）

engine-e-eo-payload-no-sun-synchronous-inclination-at = { $v1 } km には太陽同期軌道の傾斜角がありません

engine-e-eo-payload-half-fov-deg-must-be = half_fov_deg は (0, 90) の範囲内でなければなりません

engine-e-eo-payload-ifov-microrad-must-be-finite = ifov_microrad は有限かつ正でなければなりません

engine-e-eo-payload-half-fov-too-large = half_fov が大きすぎます：{ $e }

engine-eo-payload-eo-coverage-km-fov-km = eo-coverage：{ $altitude_km } km、±{ $half_fov_deg }° FOV -> 観測幅 { $v3 } km、天底 GSD { $gsd } m、オフナディア { $v5 } km まで観測可能、ノード間隔 { $v6 } km（{ $v7 }）（MODELLED）

engine-ephem-provider-earth-moon-barycentre-from-split = { $table } から得た地球・月の重心。J2000 に歳差補正した Montenbruck & Gill の月の級数で分割

engine-ephem-provider-jpl-mean-elements-in-the = ラプラス面における JPL の平均軌道要素。平均経度の変化率は IAU の同期自転率から求め、{ $table } から得た母惑星に加算

engine-ephem-provider-iau-synchronous-rotation-direction-at = JPL の平均距離における IAU の同期自転の方向を、{ $table } から得た土星に加算

engine-e-ephem-provider-read = { $path } の読み込み：{ $e }

engine-e-ephemeris-tle-is-missing-line-line = TLE に 1 行目（`1 ` で始まる行）がありません

engine-e-ephemeris-tle-is-missing-line-line-2 = TLE に 2 行目（`2 ` で始まる行）がありません

engine-e-ephemeris-an-analytic-orbit-ephemeris-requires = 解析的な `orbit` エフェメリスには `epoch` が必要です

engine-e-ephemeris-ephemeris-scenario-needs-either-tle = エフェメリスシナリオには `tle` または `orbit` のどちらかが必要です

engine-e-ephemeris-step-must-be-positive = step_s は正でなければなりません

engine-e-ephemeris-duration-must-be-non-negative = duration_s は非負でなければなりません

engine-e-ephemeris-carrier-hz-must-be-positive = carrier_hz は正で有限な周波数でなければなりません

engine-ephemeris-ground-track-samples-alt-km = { $source } 地上軌跡 · { $n_samples } サンプル · 高度 { $alt_min_km }–{ $alt_max_km } km · |緯度| ≤ { $r }°

engine-e-evidence-assemble-is-not-finite = `{ $arg }` は有限ではありません

engine-e-evidence-assemble-is-neither-seconds-nor-an = `{ $arg }` は秒数でも ISO-8601 の UTC 時刻でもありません

engine-e-evidence-assemble-no-epoch-of-the-log = ログのどのエポックも { $t0 } s から { $t1 } s の間にありません（ログの範囲は 0 から { $duration_s } s）

engine-e-evidence-assemble-config-is-not-an-object = config がオブジェクトではありません

engine-e-evidence-assemble-config-json-already-has-an = config.json にはすでにエントリ `{ $k }` があります

engine-e-evidence-bundle-from-to = { $from_s } から { $to_s } まで

engine-e-evidence-bundle-is-not-utc-time-like = `{ $c }` は 2026-01-02T03:04:05Z のような UTC 時刻ではありません

engine-e-evidence-bundle-in-log-of-bytes = { $log_bytes } バイトのログ中の { $s }..{ $e }

engine-e-evidence-cli-needs-value = { $name } には値が必要です

engine-e-evidence-cli-cannot-create = { $path } を作成できません：{ $e }

engine-e-evidence-cli-cannot-write = { $path } に書き込めません：{ $e }

engine-evidence-cli-warning-is-readable-by-other = 警告：{ $path } は他のユーザーが読み取れます。アクセスを制限してください（chmod 600）

engine-e-evidence-cli-cannot-read-key = 鍵 { $path } を読み込めません：{ $e }

engine-e-evidence-cli-is-not-hex-key = { $path } は 十六進の鍵ではありません

engine-e-evidence-cli-must-hold-32-byte-key = { $path } には 64 桁の 十六進数字で表した 32 バイトの鍵が必要です

engine-e-evidence-cli-cannot-read = { $dir } を読み込めません：{ $e }

engine-e-evidence-cli-cannot-read-2 = { $name } を読み込めません：{ $e }

engine-e-evidence-cli-exists-and-is-not-empty = { $dir } はすでに存在し、空ではありません

engine-e-evidence-cli-cannot-create-2 = { $dir } を作成できません：{ $e }

engine-evidence-cli-warning-is-owner-only-mode = 警告：{ $arg } は所有者のみ（モード 600）で、名前が *.pub ではありません。秘密鍵の可能性があります。公開鍵ファイルを指定してください。

engine-e-evidence-cli-pubkey-is-neither-64-hex = --pubkey `{ $arg }` は 64 桁の 十六進数字でも、読み取り可能なファイルでもありません（{ $e }）

engine-e-evidence-cli-pubkey-does-not-hold-hex = --pubkey `{ $arg }` に 十六進数字が含まれていません

engine-evidence-cli-private-key-keep-it-secret = 秘密鍵：{ $out }  （秘密に保管し、決してコミットしないでください）

engine-evidence-cli-public-key-pub = 公開鍵：  { $out }.pub

engine-evidence-cli-public-key-hex = 公開鍵（十六進）：{ $pk }

engine-evidence-cli-give-verifiers-the-public-key = 検証者には、信頼できる経路で公開鍵を渡してください。検証者は --pubkey でそれを固定します。

engine-e-evidence-cli-verify-needs-bundle-directory = verify にはバンドルディレクトリが必要です

engine-e-evidence-cli-cannot-read-3 = { $p } を読み込めません：{ $e }

engine-e-evidence-cli-no-pem-certificate-found = { $p }：PEM 証明書が見つかりません

engine-evidence-cli-timestamp-authority-signature-not-verified = { "      " }タイムスタンプ局の署名は Kshana では検証されていません

engine-evidence-cli-this-is-technical-record-not = これは技術的な記録であり、法的見解ではありません。

engine-e-evidence-cli-attach-timestamp-needs-bundle-directory = attach-timestamp にはバンドルディレクトリが必要です

engine-e-evidence-cli-attach-timestamp-needs-token-file = attach-timestamp にはトークンファイルが必要です

engine-e-evidence-cli-cannot-read-4 = { $tok } を読み込めません：{ $e }

engine-e-evidence-cli-cannot-write-2 = { $target } に書き込めません：{ $e }

engine-evidence-cli-note-the-token-sits-beside = 注：トークンは署名済みマニフェストの中ではなく、その隣に置かれます。必須にするには --require-timestamp を付けて検証してください。

engine-e-evidence-cli-round-trip-packs-are-not = ラウンドトリップパックは WebAssembly 向けにはビルドされません

engine-e-evidence-cli-needs-scenario-path = シナリオのパスが必要です

engine-e-evidence-cli-needs-from = --from が必要です

engine-e-evidence-cli-needs-to = --to が必要です

engine-e-evidence-cli-cannot-read-lab-attestation = ラボ証明書 { $p } を読み込めません：{ $e }

engine-e-evidence-cli-cannot-read-5 = { $scn_path } を読み込めません：{ $e }

engine-e-evidence-cli-invalid-receiver-trust-scenario = 無効な receiver-trust シナリオ：{ $e }

engine-e-evidence-cli-lab-attestation-applies-to-receiver = --lab-attestation は `receiver-trust evidence` に適用され、`evidence round-trip` には適用されません（後者のパックには試験条件が記録されます）

engine-e-evidence-cli-cannot-read-6 = { $sp } を読み込めません：{ $e }

engine-e-evidence-cli-cannot-read-7 = { $cp } を読み込めません：{ $e }

engine-evidence-cli-evidence-pack-written-to = エビデンスパックを { $out } に書き出しました

engine-evidence-cli-epochs-in-window-to = { "  " }ウィンドウ内のエポック：{ $epochs_in_window }  （{ $from_s } s から { $to_s } s）

engine-evidence-cli-signer-fingerprint = { "  " }署名者のフィンガープリント：{ $signer_fingerprint }

engine-evidence-cli-sha-256-of-manifest-json = { "  " }manifest.json の SHA-256（RFC 3161 の認証局がスタンプすべきもの）：{ $manifest_sha256 }

engine-evidence-cli-log-slice-bytes-to-of = { "  " }ログの切り出し：{ $log_bytes } のうちバイト { $a } から { $b }

engine-evidence-cli-log-slice-whole-log-this = { "  " }ログの切り出し：ログ全体（このログはウィンドウのバイト範囲を示しません）

engine-evidence-cli-lab-attestation-recorded-in-the = { "  " }ラボ証明書は署名済みマニフェストに記録されています（{ $v1 }）

engine-evidence-cli-pack-is-technical-record-not = パックは技術的な記録であり、法的見解ではありません。

engine-evidence-html-to-after-the-first-epoch = ログの最初のエポックから { $from_s } s 後から { $to_s } s 後まで

engine-e-evidence-lab-invalid-lab-attestation-toml = 無効な lab-attestation TOML：{ $e }

engine-e-evidence-lab-lab-attestation-must-be-table = `lab-attestation` はテーブルでなければなりません

engine-e-evidence-lab-invalid-lab-attestation = 無効な lab-attestation：{ $e }

engine-e-evidence-lab-lab-attestation-is-required = lab-attestation：{ $name } は必須です

engine-e-evidence-lab-lab-attestation-is-over-bytes = lab-attestation：{ $name } が { $MAX_FIELD } バイトを超えています

engine-e-evidence-lab-lab-attestation-date-is-not = lab-attestation：日付 { $date } は 2026-11-02 のような日付ではありません

engine-e-evidence-lab-lab-attestation-shielded-setup-needs = lab-attestation：シールド構成には enclosure が必要です

engine-e-evidence-lab-lab-attestation-setup-must-be = lab-attestation：setup は "conducted" または "shielded" でなければなりません（指定値：{ $other }）。オーバーザエア構成はラボ実行として受け付けられません

engine-e-evidence-lab-lab-attestation-attenuation-db-must = lab-attestation：attenuation_db は有限でなければなりません

engine-e-evidence-roundtrip-the-test-conditions-state-event = 試験条件に記載されたイベントは { $events } 件ですが、採点シナリオには { $events2 } 件あります

engine-e-evidence-roundtrip-event-in-the-test-conditions = 試験条件のイベント '{ $id }'（{ $onset_s } s から { $offset_s } s）が、採点シナリオの '{ $label }'（{ $onset_s2 } s から { $end_s } s）と一致しません

engine-e-evidence-roundtrip-the-log-sha-256-is = ログの SHA-256（{ $have }）は、試験条件に記載されたもの（{ $h }）ではありません

engine-e-evidence-tsa-truncated-der = DER が途中で切れています

engine-e-evidence-tsa-bad-der-length = DER の長さが不正です

engine-e-evidence-tsa-unexpected-der-tag = { $what }：想定外の DER タグ { $tag }

engine-e-evidence-tsa-empty-algorithmidentifier = AlgorithmIdentifier が空です

engine-e-evidence-tsa-bad-utctime = UTCTime が不正です

engine-e-evidence-tsa-bad-generalizedtime = GeneralizedTime が不正です

engine-e-evidence-tsa-bad-time = 時刻が不正です

engine-e-evidence-tsa-time-not-in-utc = 時刻が UTC ではありません

engine-e-evidence-tsa-bad-time-digits = 時刻の数字が不正です

engine-e-evidence-tsa-bad-bit-string = BIT STRING が不正です

engine-e-evidence-tsa-certificate-three-elements-expected = Certificate：三つの要素が必要です

engine-e-evidence-tsa-tbscertificate-too-short = TBSCertificate：短すぎます

engine-e-evidence-tsa-empty-extension = Extension が空です

engine-e-evidence-tsa-extension-value-not-an-octet = Extension：値が OCTET STRING ではありません

engine-e-evidence-tsa-validity-empty = Validity：空です

engine-e-evidence-tsa-validity-short = Validity：短すぎます

engine-e-evidence-tsa-pem-end-without-begin = PEM：BEGIN のない END があります

engine-e-evidence-tsa-pem-bad-base64 = PEM：base64 が不正です

engine-e-evidence-tsa-pem-bad-base64-length = PEM：base64 の長さが不正です

engine-e-evidence-tsa-spki-empty = SPKI：空です

engine-e-evidence-tsa-spki-no-oid = SPKI：OID がありません

engine-e-evidence-tsa-spki-no-key = SPKI：鍵がありません

engine-e-evidence-tsa-rsapublickey-two-integers-expected = RSAPublicKey：二つの整数が必要です

engine-e-evidence-tsa-unsupported-elliptic-curve = サポートされていない楕円曲線です

engine-e-evidence-tsa-unsupported-public-key-algorithm = サポートされていない公開鍵アルゴリズムです

engine-e-evidence-tsa-rsa-key-or-signature-too = RSA の鍵または署名が大きすぎます

engine-e-evidence-tsa-rsa-modulus-not-odd = RSA の法が奇数ではありません

engine-e-evidence-tsa-rsa-signature-out-of-range = RSA の署名が範囲外です

engine-e-evidence-tsa-rsa-key-too-small = RSA の鍵が小さすぎます

engine-e-evidence-tsa-invalid-padding = パディングが無効です

engine-e-evidence-tsa-pss-encoded-message-too-long = PSS：符号化メッセージが長すぎます

engine-e-evidence-tsa-last-octet-invalid = 最後のオクテットが無効です

engine-e-evidence-tsa-pss-leftmost-bits-not-zero = PSS：最上位ビットがゼロではありません

engine-e-evidence-tsa-pss-bad-padding = PSS：パディングが不正です

engine-e-evidence-tsa-pss-signature-mismatch = PSS：署名が一致しません

engine-e-evidence-tsa-unsupported-mask-generation-function = サポートされていないマスク生成関数です

engine-e-evidence-tsa-mgf1-without-hash = MGF1 にハッシュがありません

engine-e-evidence-tsa-bad-pss-salt-length = PSS のソルト長が不正です

engine-e-evidence-tsa-an-ecdsa-signature-needs-an = ECDSA 署名には EC 鍵が必要です

engine-e-evidence-tsa-an-rsa-signature-needs-an = RSA 署名には RSA 鍵が必要です

engine-e-evidence-tsa-rsaencryption-without-digest-algorithm = rsaEncryption にダイジェストアルゴリズムがありません

engine-e-evidence-tsa-an-rsa-pss-signature-needs = RSA-PSS 署名には RSA 鍵が必要です

engine-e-evidence-tsa-id-ecpublickey-without-digest-algorithm = id-ecPublicKey にダイジェストアルゴリズムがありません

engine-e-evidence-tsa-unsupported-signature-algorithm = サポートされていない署名アルゴリズムです

engine-e-evidence-tsa-pkistatusinfo-empty = PKIStatusInfo：空です

engine-e-evidence-tsa-time-stamp-request-not-granted = タイムスタンプ要求が許可されませんでした

engine-e-evidence-tsa-no-time-stamp-token-in = 応答にタイムスタンプトークンがありません

engine-e-evidence-tsa-not-timestampresp-or-timestamptoken = TimeStampResp でも TimeStampToken でもありません

engine-e-evidence-tsa-not-cms-signeddata = CMS SignedData ではありません

engine-e-evidence-tsa-contentinfo-no-content = ContentInfo：コンテンツがありません

engine-e-evidence-tsa-signeddata-short = SignedData：短すぎます

engine-e-evidence-tsa-encapsulatedcontentinfo-empty = EncapsulatedContentInfo：空です

engine-e-evidence-tsa-encapsulated-content-is-not-tstinfo = カプセル化されたコンテンツが TSTInfo ではありません

engine-e-evidence-tsa-no-tstinfo = TSTInfo がありません

engine-e-evidence-tsa-tstinfo-not-in-an-octet = TSTInfo が OCTET STRING に入っていません

engine-e-evidence-tsa-tstinfo-short = TSTInfo：短すぎます

engine-e-evidence-tsa-tstinfo-no-gentime = TSTInfo：genTime がありません

engine-e-evidence-tsa-signeddata-no-signerinfos = SignedData：signerInfos がありません

engine-e-evidence-tsa-exactly-one-signerinfo-expected = SignerInfo はちょうど一つ必要です

engine-e-evidence-tsa-signerinfo-no-sid = SignerInfo：sid がありません

engine-e-evidence-tsa-signerinfo-no-digest-algorithm = SignerInfo：ダイジェストアルゴリズムがありません

engine-e-evidence-tsa-signerinfo-short = SignerInfo：短すぎます

engine-e-evidence-tsa-signerinfo-no-signed-attributes = SignerInfo：署名済み属性がありません

engine-e-evidence-tsa-signerinfo-no-signature-algorithm = SignerInfo：署名アルゴリズムがありません

engine-e-evidence-tsa-signerinfo-no-signature = SignerInfo：署名がありません

engine-e-evidence-tsa-no-serial = シリアル番号がありません

engine-e-evidence-tsa-signer-certificate-not-found = 署名者の証明書が見つかりません

engine-e-evidence-tsa-attribute-empty = Attribute：空です

engine-e-evidence-tsa-attribute-no-values = Attribute：値がありません

engine-e-evidence-tsa-attribute-no-value = Attribute：値がありません

engine-e-evidence-tsa-content-type-attribute-mismatch = content-type 属性が一致しません

engine-e-evidence-tsa-digest-failure = ダイジェストの検証に失敗しました

engine-e-evidence-tsa-signature-not-an-octet-string = 署名が OCTET STRING ではありません

engine-e-evidence-tsa-ess-signing-certificate-attribute-missing = ess signing certificate 属性がありません

engine-e-evidence-tsa-signingcertificate-empty = SigningCertificate：空です

engine-e-evidence-tsa-ess-cert-id-not-found = ess cert id が見つかりません

engine-e-evidence-tsa-esscertidv2-no-hash = ESSCertIDv2：ハッシュがありません

engine-e-evidence-tsa-unsuitable-certificate-purpose = 証明書の用途が適切ではありません

engine-e-evidence-tsa-certificate-is-not-yet-valid = 証明書はまだ有効ではありません

engine-e-evidence-tsa-certificate-has-expired = 証明書の有効期限が切れています

engine-e-evidence-tsa-invalid-ca-certificate = CA 証明書が無効です

engine-e-evidence-tsa-certificate-chain-too-long = 証明書チェーンが長すぎます

engine-e-evidence-tsa-messageimprint-empty = MessageImprint：空です

engine-e-evidence-tsa-messageimprint-no-digest = MessageImprint：ダイジェストがありません

engine-e-evidence-tsa-message-imprint-mismatch = メッセージインプリントが一致しません

engine-e-evidence-tsr-indefinite-length-ber-is-not = 不定長の BER はサポートされていません

engine-e-evidence-tsr-expected-tag-found = { $what }（タグ { $tag }）が必要ですが、{ $t } が見つかりました

engine-e-evidence-tsr-malformed-pkistatusinfo = PKIStatusInfo が不正です

engine-e-evidence-tsr-the-timestamp-response-was-not = タイムスタンプ応答が許可されませんでした

engine-e-evidence-tsr-not-timestamp-token = タイムスタンプトークンではありません

engine-e-evidence-tsr-the-token-content-type-is = トークンのコンテンツタイプが CMS SignedData ではありません

engine-e-evidence-tsr-the-token-does-not-carry = トークンに TSTInfo が含まれていません

## src/evidence/tsr.rs

engine-e-evidence-tsr-message-imprint-uses-an-unsupported = メッセージインプリントがサポートされていないハッシュアルゴリズムを使用しています

engine-e-evidence-tsr-the-imprint-is-bytes-not = インプリントは { $digest } バイトで、{ $hash_alg } が与える { $want_len } バイトと一致しません

engine-e-evidence-tsr-gentime-is-not-utc = genTime が UTC ではありません

engine-e-evidence-tsr-malformed-gentime = genTime の形式が不正です

engine-e-evidence-tsr-gentime-is-not-real-calendar = genTime が実在する暦上の時刻ではありません

## src/evidence/verify.rs

engine-e-evidence-verify-not-lower-case-hex = 小文字の十六進数ではありません

engine-e-evidence-verify-expected-bytes-found = 期待は { $N } バイト、実際は { $v }

engine-e-evidence-verify-the-pack-already-has-timestamp = パックにはすでにタイムスタンプトークンがあります。置き換えるには --replace を指定してください

engine-e-evidence-verify-not-attached-the-pack-with = 添付されていません：このトークンを持つパックは検証に通りません（{ $v1 }）

engine-evidence-verify-the-pack-records-lab-attestation = パックには { $operator } による試験所の証明が記録されています（{ $organisation }、{ $setup }）：{ $v4 }

engine-e-evidence-verify-the-signature-file-does-not = 署名ファイルが改行で終わっていません

engine-evidence-verify-signer-not-pinned-the-signature = 署名者が固定されていません：署名が証明するのは、パックが鍵 { $r } に対して改ざんされていないことだけで、この鍵はパック自身が名指ししたものです。そのフィンガープリントを署名者から入手したものと照合するか、鍵を指定してください。

engine-evidence-verify-range-is-not-inside-log = 範囲 { $start }..{ $end } は { $full_bytes } バイトのログの範囲内にありません

engine-evidence-verify-timestamp-token-states-its-imprint = タイムスタンプトークンの記載：{ $gen_time }。そのインプリントは manifest.json と { $v2 }。タイムスタンプ局の署名は Kshana では検証されていません。`openssl ts -verify` で確認してください。

engine-evidence-verify-timestamp-token-states-its-imprint-2 = タイムスタンプトークンの記載：{ $gen_time }。そのインプリントは manifest.json と { $v2 }。タイムスタンプ局の署名とチェーンは、与えられたアンカーに対して { $v3 }。

## src/field_schema.rs

engine-e-field-schema-unit-is-the-empty-string = `unit` が空文字列です

engine-e-field-schema-provenance-is-outside-the-vocabulary = `provenance` { $prov_str } は語彙の範囲外です

## src/frugal.rs

engine-e-frugal-cost-bracket-must-be-finite = コスト範囲は有限かつ非負で、low≤nominal≤high の順であり、出典を伴う必要があります

engine-e-frugal-coverage-fraction-and-availability-must = coverage_fraction と availability は [0, 1] の範囲の割合でなければなりません

## src/fusion/carrier_tc.rs

engine-e-fusion-carrier-tc-must-be-finite-and-got = { $name } は有限かつ > 0 でなければなりません（値：{ $v }）

engine-e-fusion-carrier-tc-must-be-finite-and-got-2 = { $name } は有限かつ >= 0 でなければなりません（値：{ $v }）

engine-e-fusion-carrier-tc-mask-deg-must-be-in = mask_deg は [-90, 90) の範囲でなければなりません（値：{ $mask_deg }）

engine-e-fusion-carrier-tc-constellation-has-no-satellites = 衛星コンステレーションに衛星がありません

engine-e-fusion-carrier-tc-max-sats-must-be-when = max_sats を設定する場合は >= 1 でなければなりません

engine-e-fusion-carrier-tc-slip-satellite-out-of-range = スリップの衛星 { $sat } が範囲外です

## src/fusion/kfgins.rs

engine-e-fusion-kfgins-line = 行 { $lineno }：{ $e }

engine-e-fusion-kfgins-line-columns-at-least-expected = 行 { $lineno }：{ $v } 列。少なくとも { $min } 列が必要です

engine-e-fusion-kfgins-line-columns = 行 { $v1 }：{ $v } 列

engine-e-fusion-kfgins-line-block-lists-are-not = 行 { $lineno }：ブロックリストはサポートされていません

engine-e-fusion-kfgins-line-expected-key-value = 行 { $lineno }：`key: value` が必要です

engine-e-fusion-kfgins-line-indented-key-without-parent = 行 { $lineno }：親のないインデント付きキーです

engine-e-fusion-kfgins-line-only-one-level-of = 行 { $lineno }：入れ子は一階層のみです

engine-e-fusion-kfgins-line-unterminated-flow-list = 行 { $lineno }：フローリストが閉じられていません

engine-e-fusion-kfgins-is-list-scalar-expected = `{ $k }` はリストですが、スカラーが必要です

engine-e-fusion-kfgins-missing = `{ $k }` がありません

engine-e-fusion-kfgins-must-be-three-element-list = `{ $k }` は三要素のリストでなければなりません

engine-e-fusion-kfgins-no-imu-sample-at-or = starttime 以降の IMU サンプルがありません

engine-e-fusion-kfgins-imu-time-not-increasing-at = { $t } で IMU 時刻が増加していません

## src/fusion/pack.rs

engine-e-fusion-pack-filter-prior-must-be-finite = { $slot }.filter_prior.{ $name } は有限かつ > 0 でなければなりません（値：{ $v }）

engine-e-fusion-pack-tight-sigma-range-must-be = tight.sigma_range_m は有限かつ > 0 でなければなりません（値：{ $sigma_range_m }）

engine-e-fusion-pack-tight-mask-deg-must-be = tight.mask_deg は [-90, 90) の範囲でなければなりません（値：{ $mask_deg }）

## src/fusion/trajectory.rs

engine-e-fusion-trajectory-trajectory-csv-line-not-numbers = 軌跡 csv の行 { $v1 }：数値ではありません：{ $line }

engine-e-fusion-trajectory-trajectory-csv-line-expected-10 = 軌跡 csv の行 { $v1 }：10列が必要ですが { $v } 列でした

engine-e-fusion-trajectory-trajectory-csv-line-time-does = 軌跡 csv の行 { $v1 }：時刻が増加していません

engine-e-fusion-trajectory-trajectory-csv-needs-at-least = 軌跡 csv には少なくとも二行が必要です

engine-e-fusion-trajectory-trajectory-csv-covers-but-the = 軌跡 csv がカバーするのは { $rows } s ですが、シナリオは { $v2 } s 実行されます

## src/geometry.rs

engine-e-geometry-sky-site-lat-deg-must = sky: site の lat_deg は [-90, 90] の範囲で、すべてのフィールドが有限でなければなりません

engine-e-geometry-sky-is-neither-gnss-preset = sky: "{ $name }" は GNSS プリセット（{ $e_gnss }）でも LEO プリセット（{ $e_leo }）でもありません

engine-e-geometry-sky-give-the-user-as = sky: ユーザーは `site` または `user_ecef_m` のいずれかで指定してください。両方は指定できません

engine-e-geometry-sky-user-ecef-must-be = sky: user_ecef_m は有限で、地球中心以外でなければなりません

engine-e-geometry-sky-satellite-azimuth-elevation-out = sky: 衛星 { $id }：方位角・仰角が範囲外です

engine-e-geometry-sky-satellite-is-given-in = sky: 衛星 { $id } は ECEF で指定されています。リクエストには `site` または `user_ecef_m` が必要です

engine-e-geometry-sky-satellite-ecef-position-not = sky: 衛星 { $id }：ECEF 位置が有限ではありません

engine-e-geometry-sky-satellite-coincides-with-the = sky: 衛星 { $id } がユーザーと一致しています

engine-e-geometry-sky-satellite-give-az-deg = sky: 衛星 { $id }：az_deg と el_deg、または ecef_m のみを指定してください。それ以外は指定できません

engine-e-geometry-sky-tle-is-bytes-the = sky: tle は { $text } バイトで、上限は { $MAX_TLE_BYTES }（4 MiB）です

engine-geometry-element-set-refused = 要素セットは拒否されました：{ $e }

engine-geometry-sky-tle-holds-no-complete = sky: tle に完全な二行要素セットがありません。無視された行数：{ $n_ignored }、最初の行：{ $first }

engine-geometry-and-more = { "." }.. ほか { $more } 件

engine-geometry-element-sets-propagated-by-the = 要素セット { $n } 件を、本エンジンの SGP4（WGS-72）で { $iso } まで伝搬し、UT1 を UTC とみなして極運動なしで地球固定座標系に回転しました。これはその時刻にそれらの要素セットが与える空であり、その実測ではありません。

engine-geometry-element-sets-propagated-by-the-2 = 要素セット { $n } 件を、本エンジンの SGP4（WGS-72）で最新の要素セットの元期に time_s を加えた時刻（{ $iso }）まで伝搬しました。元期が指定されていないため、これは代表的な空であり、特定の日付の空ではありません。

engine-e-geometry-sky-give-systems-or-tle = sky: `systems` または `tle`（`site` を併記）、あるいは `satellites` を指定してください

engine-e-geometry-sky-tle-system-names-the = sky: tle_system は `tle` の衛星に名前を付けますが、リクエストに `tle` がありません

engine-e-geometry-sky-mask-deg-must-be = sky: mask_deg は [-90, 90) の範囲でなければなりません（値：{ $m }）

engine-e-geometry-sky-systems-needs-site-or = sky: `systems` には観測地点となる `site`（または `user_ecef_m`）が必要です

engine-e-geometry-sky-time-must-be-finite = sky: time_s は有限でなければなりません

engine-e-geometry-sky-system-asks-for-satellites = sky: システム "{ $name }" は { $asked } 機の衛星を要求していますが、一つのリクエストで扱えるのは最大 { $MAX_SATELLITES } 機です

engine-e-geometry-sky-more-than-satellites = sky: 衛星数が { $MAX_SATELLITES } 機を超えています

engine-e-geometry-sky-tle-needs-site-or = sky: `tle` には観測地点となる `site`（または `user_ecef_m`）が必要です

engine-e-geometry-sky-more-than-satellites-above = sky: 地平線より上の衛星数が { $MAX_SATELLITES } 機を超えています

engine-e-geometry-sky-sigma-uere-must-be = sky: sigma_uere_m は正でなければなりません（値：{ $sigma }）

engine-e-geometry-sky-confidence-must-be-in = sky: confidence は (0, 1) の範囲でなければなりません（値：{ $confidence }）

engine-e-geometry-sky-more-than-systems-in = sky: 視界内のシステム数が { $MAX_CLOCKS } を超えており、それぞれが独自のクロックを持ちます。衛星をより少ない `system` ラベルにまとめるか、clock = "common" を使用してください

engine-e-geometry-sky-must-be-in-got = sky: n は 1..={ $MAX_MC_SAMPLES } の範囲でなければなりません（値：{ $n }）

engine-e-geometry-sky-too-few-satellites-in = sky: 測位解を得るには視界内の衛星が少なすぎるため、モンテカルロの点群は作成されません

engine-geometry-tle-sky-at-not-measurement = { $e } 時点の TLE の空であり、実測ではありません

engine-e-geometry-invalid-sky-request-json = sky リクエスト（JSON）が不正です：{ $e }

engine-e-geometry-invalid-sky-request-toml = sky リクエスト（TOML）が不正です：{ $e }

engine-e-geometry-invalid-skyline-json = スカイライン（JSON）が不正です：{ $e }

engine-e-geometry-invalid-skyline-toml = スカイライン（TOML）が不正です：{ $e }

## src/glonass.rs

engine-e-glonass-bad-glonass-prn-in = { $head } 内の GLONASS PRN が不正です

## src/gnss_navmsg/gal_fnav.rs

engine-e-gnss-navmsg-gal-fnav-page-type-is-not-encoded = ページタイプ { $pt } はここではエンコードされません

engine-e-gnss-navmsg-gal-fnav-bits-expected = { $data } ビット（期待値：{ $DATA_BITS }）

engine-e-gnss-navmsg-gal-fnav-bits-expected-2 = { $p } ビット（期待値：{ $PAGE_BITS }）

engine-e-gnss-navmsg-gal-fnav-tail-bits-are-not-zero = 末尾ビットがゼロではありません

engine-e-gnss-navmsg-gal-fnav-crc-24q-mismatch = CRC-24Q の不一致

engine-e-gnss-navmsg-gal-fnav-page-type-is-not-decoded = ページタイプ { $pt } はここではデコードされません

engine-e-gnss-navmsg-gal-fnav-symbols-expected = { $symbols } シンボル（期待値：{ $PAGE_SYMBOLS }）

engine-e-gnss-navmsg-gal-fnav-synchronisation-pattern-not-found = 同期パターンが見つかりません

engine-e-gnss-navmsg-gal-fnav-page-type-missing = ページタイプ { $t } がありません

engine-e-gnss-navmsg-gal-fnav-iod-nav-of-page-type = ページタイプ { $t } の IOD_nav がページタイプ 1 と異なります

## src/gnss_navmsg/gal_inav.rs

engine-e-gnss-navmsg-gal-inav-no-galileo-field = Galileo のフィールド { $name } はありません

engine-e-gnss-navmsg-gal-inav-word-type-is-not-encoded = ワードタイプ { $wt } はここではエンコードされません

engine-e-gnss-navmsg-gal-inav-bits-expected = { $word } ビット（期待値：{ $WORD_BITS }）

engine-e-gnss-navmsg-gal-inav-word-type-is-not-decoded = ワードタイプ { $wt } はここではデコードされません

engine-e-gnss-navmsg-gal-inav-page-parts-must-be-120 = ページ部は 120 ビットでなければなりません

engine-e-gnss-navmsg-gal-inav-even-odd-flags-are-not = 偶数/奇数フラグが 0、1 の順になっていません

engine-e-gnss-navmsg-gal-inav-not-nominal-page-page-type = 通常ページではありません（ページタイプ 1 はアラートページです）

engine-e-gnss-navmsg-gal-inav-bits-expected-2 = { $part } ビット（期待値：{ $PART_BITS }）

engine-e-gnss-navmsg-gal-inav-symbols-expected = { $symbols } シンボル（期待値：{ $PART_SYMBOLS }）

engine-e-gnss-navmsg-gal-inav-word-type-missing = ワードタイプ { $t } がありません

engine-e-gnss-navmsg-gal-inav-iod-nav-of-word-type = ワードタイプ { $t } の IOD_nav がワードタイプ 1 と異なります

## src/gnss_navmsg/galileo.rs

engine-e-gnss-navmsg-galileo-record-is-system-not-galileo = レコードのシステムは { $system } であり、Galileo ではありません

## src/gnss_navmsg/gps_cnav.rs

engine-e-gnss-navmsg-gps-cnav-type-10-has-no-field = タイプ 10 にフィールド { $name } はありません

engine-e-gnss-navmsg-gps-cnav-type-11-has-no-field = タイプ 11 にフィールド { $name } はありません

engine-e-gnss-navmsg-gps-cnav-type-30-has-no-field = タイプ 30 にフィールド { $name } はありません

engine-e-gnss-navmsg-gps-cnav-cnav-body-has-bits-expected = CNAV 本体は { $body } ビット（期待値：238）

engine-e-gnss-navmsg-gps-cnav-prn-or-tow-count-out = PRN { $prn } または TOW カウント { $tow_count } が範囲外です

engine-e-gnss-navmsg-gps-cnav-bits-expected = { $bits } ビット（期待値：{ $MESSAGE_BITS }）

engine-e-gnss-navmsg-gps-cnav-preamble-is-not-10001011 = プリアンブルが 10001011 ではありません

engine-e-gnss-navmsg-gps-cnav-message-type-is-not-decoded = メッセージタイプ { $t } はここではデコードされません

engine-e-gnss-navmsg-gps-cnav-need-type-10-and-type = タイプ 10 とタイプ 11 のメッセージが必要です

## src/gnss_navmsg/mod.rs

engine-e-gnss-navmsg-at-lsb-does-not-fit = { $name }：LSB { $value2 } での { $value } は { $bits } { $v4 } ビットに収まりません

engine-e-gnss-navmsg-bits-layout-needs = { $bits } ビット（レイアウトに必要なのは { $need }）

engine-e-gnss-navmsg-no-field = フィールド { $name } はありません

## src/gps_lnav.rs

engine-e-gps-lnav-at-scale-does-not-fit = スケール 2^{ $scale_pow2 } での { $value } は { $bits } { $v1 } ビットに収まりません

engine-e-gps-lnav-no-value-for = { $name } の値がありません

## src/gravimeter.rs

engine-e-gravimeter-gravity-map-reference-model-gfc = gravity-map: 参照モデル "gfc" には `gfc_path` が必要です

engine-e-gravimeter-gravity-map-cannot-read-gfc = gravity-map: gfc_path { $path } を読み込めません：{ $e }

engine-e-gravimeter-gravity-map-unknown-reference-model = gravity-map: 不明な参照モデル `{ $other }` です（"egm2008" または "gfc" を使用してください）

engine-e-gravimeter-gravity-map-unknown-ellipsoid-use = gravity-map: 不明な楕円体 `{ $other }` です（"wgs84" または "grs80" を使用してください）

engine-e-gravimeter-gravity-map-map-error-mc = gravity-map: map_error_mc.realisations は 1 以上でなければなりません

engine-e-gravimeter-gravity-map-map-error-mc-2 = gravity-map: map_error_mc.realisations の上限は 10000 です

## src/gravity_pds.rs

engine-e-gravity-pds-bad-real = 実数 '{ $t }' が不正です

engine-e-gravity-pds-bad-integer = 整数 '{ $t }' が不正です

engine-e-gravity-pds-empty-shadr-table = SHADR テーブルが空です

engine-e-gravity-pds-shadr-header-has-fields-expected = SHADR ヘッダーのフィールド数は { $f } で、少なくとも 6 が必要です

engine-e-gravity-pds-shadr-header-negative-degree-order = SHADR ヘッダー：次数・位数が負であるか、正規化が不明です

engine-e-gravity-pds-shadr-normalization-state-only-fully = SHADR の正規化状態 { $normalization }（サポートされるのは完全正規化の状態 1 のみです）

engine-e-gravity-pds-shadr-reference-longitude-latitude-must = SHADR の基準経度・緯度は 0 でなければなりません

engine-e-gravity-pds-non-physical-gm-must-be = 物理的にあり得ない GM です（有限かつ正でなければなりません）

engine-e-gravity-pds-non-physical-reference-radius-must = 物理的にあり得ない基準半径です（有限かつ正でなければなりません）

engine-e-gravity-pds-shadr-record-fields = SHADR レコード { $v1 }：{ $f } フィールド

engine-e-gravity-pds-shadr-record-bad = SHADR レコード { $v1 }：(n, m) = ({ $n }, { $m }) が不正です

engine-e-gravity-pds-shadr-record-non-finite-coefficient = SHADR レコード { $v1 }：係数が有限ではありません

engine-e-gravity-pds-no-shadr-coefficient-records = SHADR 係数レコードがありません

engine-e-gravity-pds-shadr-table-incomplete-missing = SHADR テーブルが不完全です：(n, m) = ({ $n }, { $m }) がありません

## src/gravity_sh.rs

engine-e-gravity-sh-missing-earth-gravity-constant-gravity = earth_gravity_constant / gravity_constant がありません

engine-e-gravity-sh-missing-radius = radius がありません

engine-e-gravity-sh-non-physical-earth-gravity-constant = 物理的にあり得ない earth_gravity_constant です（有限かつ正でなければなりません）

engine-e-gravity-sh-non-physical-radius-must-be = 物理的にあり得ない radius です（有限かつ正でなければなりません）

engine-e-gravity-sh-no-gfc-coefficient-lines = gfc 係数行がありません

engine-e-gravity-sh-read-error = 読み込みエラー：{ $e }

engine-e-gravity-sh-line-norm-is-not-supported = 行 { $lineno }：norm { $v } はサポートされていません（fully_normalized のみ）

engine-gravity-sh-line-bad = 行 { $lineno }：{ $what } が不正です

engine-e-gravity-sh-line-degree-above-the-declared = 行 { $lineno }：次数 { $n } が宣言された max_degree { $dm } を超えています

engine-e-gravity-sh-line-order-above-degree = 行 { $lineno }：位数 { $m } が次数 { $n } を超えています

engine-e-gravity-sh-line-time-variable-term-is = 行 { $lineno }：時間変動項 `{ $key }` はサポートされていません（静的モデルのみ）

engine-e-gravity-sh-missing-end-of-head = end_of_head がありません

## src/gse_sim.rs

engine-e-gse-sim-step-must-be-positive-got = step_s は正でなければなりません（値：{ $step_s }）

engine-e-gse-sim-duration-must-be-positive-got = duration_s は正でなければなりません（値：{ $duration_s }）

engine-e-gse-sim-scenario-produces-epochs-need-increase = シナリオが生成するエポック数は { $n } です（必要数：≥ 2）。duration_s を増やすか step_s を減らしてください

## src/holdover_test.rs

engine-e-holdover-test-the-record-holds-non-finite = レコードに有限でない時刻誤差が含まれています

engine-e-holdover-test-unknown-mask-expected-one-of = 不明なマスク { $id } です。次のいずれかが必要です：{ $masks }

engine-e-holdover-test-every-budget-max-abs-te = すべてのバジェットの max_abs_te_ns は有限かつ正でなければなりません

engine-e-holdover-test-gnss-removed-lies-outside-the = gnss_removed_s = { $gnss_removed_s } がレコードの範囲外です（独自の時間軸で { $t0_s } から { $t_end } s）

engine-e-holdover-test-gnss-restored-must-be-later = gnss_restored_s = { $r } は gnss_removed_s（{ $gnss_removed_s }）より後で、レコードの終端（{ $t_end } s）を超えてはなりません

engine-e-holdover-test-the-holdover-step-holds-no = ホールドオーバーのステップにサンプルがありません

engine-holdover-test-the-record-has-no-step = レコードに { $step } ステップがありません：GNSS は最初のサンプルで取り除かれています

engine-holdover-test-the-step-has-samples-the = { $step } ステップのサンプル数：{ $te_ns }。推定器には少なくとも 13 が必要です

engine-e-holdover-test-step-with-mask-has-no = マスクのあるステップには曲線がありません

engine-e-holdover-test-cannot-read-csv-path = csv_path { $path } を読み込めません：{ $e }

engine-holdover-test-recovered-after-gnss-returned = ；GNSS の復帰後 { $t } s で回復

engine-holdover-test-holdover-test-holdover-max-te = holdover-test: ホールドオーバー { $hold } s、max|TE| { $max_abs } ns；{ $masks }{ $rec }（MODELLED、マスクに対して測定）

## src/hybrid.rs

engine-e-hybrid-coupled-sigma-pr-must-be = coupled.sigma_pr_m は有限かつ > 0 でなければなりません（値：{ $sigma_pr_m }）

engine-e-hybrid-coupled-ba-must-be-and = coupled.q_ba は >= 0、かつ coupled.bias_var は > 0 でなければなりません

## src/hybrid_integrity.rs

engine-hybrid-integrity-refused-the-two-legs-are = REFUSED：二つのレグが共通の平均化時間にありません。光学レグは integration_s = { $integration_s } s にわたって積算します。RF レグのループ雑音帯域幅 B_L = { $dll_bandwidth_hz } Hz は 1/(2*B_L) = { $rf_equivalent_averaging_s } s で平均化します。異なる平均化時間で取った二つのシグマの比は比較にならないため、値は示しません。rf_dll_bandwidth_hz の上書きを削除する（その場合の既定値は 1/(2*integration_s) です）か、{ $v4 } Hz に設定してください。

engine-hybrid-integrity-refused-leg-is-not-usable = REFUSED：レグのシグマが正の有限値として使用できません（光学 { $opt_sigma_range_m } m、RF { $rf_sigma_range_m } m）。そのため比は作成されません。

engine-e-hybrid-integrity-unknown-rf-band-expected-ka = 不明な rf_band '{ $other }' です（s|x|ka が必要です）

engine-e-hybrid-integrity-must-be-finite = { $name } は有限でなければなりません

engine-e-hybrid-integrity-rf-other-losses-db-must = rf_other_losses_db は有限かつ >= 0 でなければなりません

engine-hybrid-integrity-hybrid-optical-rf-optical-footprint = hybrid-optical-rf | 光学フットプリント { $footprint_m } m、{ $detected_photons } 光子 -> 測距 σ { $c } mm、タイミング σ { $c2 } ps | クロス RAIM HPL { $hpl_m } m / VPL { $vpl_m } m / TPL { $c3 } ns（{ $v8 }） | 可用性 { $c4 }%（{ $n_sites } 地点） | ハンドオフ ジャンプなし { $v11 } NEES { $final_nees }∈[{ $c5 },{ $c6 }] { $v15 } | 総合 FoM { $score }（A { $availability } · P { $precision_grade } · I { $integrity_assured }） | Validated CRLB/χ²-PL/union/handoff、Modelled σ/climatology

## src/impairment_eval.rs

engine-e-impairment-eval-target-pfa-must-be-in = target_pfa は [0, 1] の範囲でなければなりません

engine-e-impairment-eval-per-class-must-be = n_per_class は >= 1 でなければなりません

engine-impairment-eval-impairment-eval-detector-auc-in = impairment-eval | 検出器 { $detector } | AUC 内 { $auc_in } / 外 { $auc_out }（差 { $optimism_gap }{ $v5 }） | Pd { $report } Pfa { $report2 } @ 目標 { $target_pfa } | { $n_cases } ケース | MODELLED 合成データ

engine-e-impairment-eval-unknown-detector-energy-agc-sqm = 不明な検出器 '{ $other }' です（energy|agc|sqm|parity|fused）

## src/inertial/coast.rs

engine-e-inertial-coast-unknown-imu-grade-expected-one = 不明な imu_grade { $other } です。次のいずれかが必要です：navigation、tactical、industrial、consumer

engine-e-inertial-coast-unknown-combination-expected-one-of = 不明な combination { $other } です。次のいずれかが必要です：rss、linear-sum、det-sum-stoch-rss

engine-e-inertial-coast-unknown-trn-fix-mode-expected = 不明な trn_fix_mode { $other } です。次のいずれかが必要です：none、position-only、full-reset

engine-e-inertial-coast-must-be-finite-and-non = { $name } は有限かつ非負でなければなりません（値：{ $v }）

engine-e-inertial-coast-crossing-thresholds-must-name-at = crossing_thresholds_m には少なくとも一つのしきい値を指定してください

engine-e-inertial-coast-crossing-thresholds-entries-must-be = crossing_thresholds_m の各エントリは有限かつ正でなければなりません（値：{ $t }）

engine-e-inertial-coast-grades-must-name-at-least = grades には少なくとも一つの IMU クラスを指定してください

engine-e-inertial-coast-speed-must-be-finite-and = speed_m_s は有限かつ非負でなければなりません（値：{ $v }）

engine-e-inertial-coast-ref-accel-s2-must-be = ref_accel_m_s2 は有限かつ非負でなければなりません（値：{ $a }）

engine-e-inertial-coast-latitude-deg-must-be-finite = latitude_deg は有限で、(-89, 89) の範囲内でなければなりません（値：{ $lat }）

engine-e-inertial-coast-height-must-be-within-1000 = height_m は [-1000, 100000] の範囲内でなければなりません（値：{ $h }）

engine-e-inertial-coast-mission-duration-must-be-positive = mission_duration_s は正でなければなりません

engine-e-inertial-coast-drift-band-must-satisfy-lo = ドリフト帯は 0 < lo < hi を満たさなければなりません（lo={ $lo }、hi={ $hi }）

engine-e-inertial-coast-serializing-ins-trn-coast-result = ins-trn-coast の結果のシリアライズ：{ $e }

engine-inertial-coast-ins-trn-coast-imu-combination = ins-trn-coast | { $grade } IMU、{ $speed } m/s、combination { $comb } | { $heads } | TRN { $mode } ピーク { $peak_error_m } m（{ $mission } s にわたる）

## src/inertial/mod.rs

engine-inertial-va-derived-from-cold-atom = { $provenance }（q_va は冷却原子干渉計の物理から導出）

## src/inline_only.rs

engine-e-inline-only-scenario-is-bytes-over-the = シナリオは { $toml_text } バイトで、{ $max_bytes } バイトの上限を超えています

engine-e-inline-only-the-scenario-kind-reads-its = シナリオ kind `{ $kind }` はホスト上のファイルからデータを読み込むため、このサーフェスでは実行されません。`kshana` コマンドラインを使用してください

engine-e-inline-only-the-field-names-file-this = フィールド `{ $k }` はファイルを指定しています。このサーフェスが受け付けるのはインラインのコンテンツのみです

## src/interference_map/adsb.rs

engine-e-interference-map-adsb-trace-json = トレース JSON：{ $e }

## src/interference_map/api.rs

engine-e-interference-map-api-unknown-dataset-approved-or-custom = 不明なデータセット `{ $key }` です。承認済み：{ $v1 }、またはカスタムデータセット

engine-e-interference-map-api-dataset-is-data-but-the = データセット `{ $key }` は { $kind } データですが、入力の種類は { $kind2 } です

engine-e-interference-map-api-is-not-yyyy-mm-dd = { $name } は YYYY-MM-DD 形式の日付ではありません

## src/interference_map/cli.rs

engine-e-interference-map-cli-unknown-option = 不明なオプション `{ $a }`

engine-e-interference-map-cli-expected-positional-argument-got = 位置引数は { $positionals } 個必要ですが、{ $pos } 個でした

engine-e-interference-map-cli-cannot-read = { $path } を読み込めません：{ $e }

engine-e-interference-map-cli-dataset-custom-needs = --dataset custom には { $n } が必要です

engine-e-interference-map-cli-already-exists-kshana-does-not = { $existing } はすでに存在します。Kshana はマップを上書きしません。削除するか、別の --out ディレクトリを指定してください

engine-interference-map-cli-note-cell-deg-is-not = 注意：--cell-deg { $cell_deg } は事前登録されたセルサイズ（{ $PREREGISTERED_CELL_DEG }）ではありません。マップにもその旨が記されます

engine-e-interference-map-cli-cannot-create = { $out } を作成できません：{ $e }

engine-interference-map-cli-wrote-cells-published-flagged = { $path } を書き込みました：公開セル { $cells }、フラグ付き { $n_deg }

engine-interference-map-cli-no-usable-rows-nothing-written = 使用できる行がありません：何も書き込まれませんでした

engine-e-interference-map-cli-unknown-subcommand = 不明なサブコマンド `{ $other }`

engine-e-interference-map-cli-the-downloaded-file-sha-256 = ダウンロードしたファイルの SHA-256（{ $got }）が固定値（{ $expected }）と一致しません。ファイルは破棄されました

engine-e-interference-map-cli-cannot-write = { $dest } に書き込めません：{ $e }

engine-e-interference-map-cli-curl-was-not-found-on = PATH に curl が見つかりません。curl をインストールするか、{ $NATURAL_EARTH_LAND_URL } を自分でダウンロードし、その SHA-256 が { $NATURAL_EARTH_LAND_SHA256 } であることを確認してください

engine-e-interference-map-cli-cannot-run-curl = curl を実行できません：{ $e }

engine-interference-map-cli-wrote-natural-earth-land-polygons = { $out } を書き込みました：Natural Earth の陸地ポリゴン、SHA-256 検証済み（パブリックドメイン、https://www.naturalearthdata.com/about/terms-of-use/）

engine-e-interference-map-cli-no-trace-full-files-under = { $path } の下に trace_full_* ファイルがありません

engine-e-interference-map-cli-cannot-read-2 = { $spec } を読み込めません：{ $e }

engine-e-interference-map-cli-is-not-yyyy-mm-dd = { $n } は YYYY-MM-DD 形式の日付ではありません

engine-e-interference-map-cli-bad-map-date = { $f }：マップの日付が不正です

engine-e-interference-map-cli-cannot-write-2 = { $out } に書き込めません：{ $e }

engine-interference-map-cli-route-length-km = 経路長 { $rows } km

engine-interference-map-cli-caveats-degraded-cell-does-not = 注意事項：degraded セルは、干渉が原因であることを示すものではありません。観測されていないセルは、経路に問題がないことの証拠ではありません。これは予報ではありません。

## src/interference_map/land.rs

engine-e-interference-map-land-land-polygons-invalid-json = 陸地ポリゴン：JSON が不正です：{ $e }

## src/interference_map/mod.rs

engine-e-interference-map-missing-required-column = 必須の列 `{ $name }` がありません

engine-e-interference-map-cannot-read-input = 入力を読み込めません：{ $e }

## src/interference_map/observatory.rs

engine-e-interference-map-observatory-day-is-not-date-yyyy = --day `{ $day }` は日付（YYYY-MM-DD）ではありません

engine-e-interference-map-observatory-delay-hours-must-be-or = --delay-hours は { $MIN_DELAY_HOURS } 以上でなければなりません：観測所はそれより早く公開しません

engine-e-interference-map-observatory-cell-deg-must-be-or = --cell-deg は { $MIN_CELL_DEG } 以上の粗さでなければなりません：観測所が公開するのは粗いセルのみです

engine-e-interference-map-observatory-is-not-publishable-yet-its = { $day } はまだ公開できません：その成果物は { $fmt_utc } より前には公開されません（その日の終了から { $delay_hours } h 後）

engine-interference-map-observatory-kshana-observatory-ads = KSHANA OBSERVATORY  ADS-B  { $date }

engine-interference-map-observatory-deg-cells-utc-day-not = { $trim_deg } DEG CELLS  UTC DAY  NOT OBSERVED IS NOT CLEAR  NO CAUSE ATTRIBUTED

engine-interference-map-observatory-source-licence = SOURCE { $dataset }  LICENCE { $dataset2 }

## src/interference_map/observatory.rs

engine-interference-map-observatory-kshana-observatory-ads-navigation-accuracy = Kshana 観測所、ADS-B 航法精度マップ、{ $date }

engine-e-interference-map-observatory-cannot-create-kshana-does-not = { $path } を作成できません（Kshana は成果物を上書きしません）：{ $e }

engine-e-interference-map-observatory-the-input-has-no-usable = 入力に { $day } の使用できるレポートがありません（見つかった日：{ $days }）

engine-e-interference-map-observatory-already-exists-kshana-does-not = { $path } はすでに存在します。Kshana は成果物を上書きしません

engine-interference-map-observatory-cells-published-degraded-incident = 公開セル { $p }、degraded { $p2 }、インシデント { $p3 }

engine-interference-map-observatory-rows-replayed-under-variants = { $rows } 行を { $variants } 種類のバリアントで再生しました：{ $out }

## src/interference_map/route.rs

engine-e-interference-map-route-map-is-not-valid-json = マップが有効な JSON ではありません：{ $e }

engine-e-interference-map-route-route-invalid-json = 経路：JSON が不正です：{ $e }

engine-e-interference-map-route-route-line-is-not-lat = 経路：行 { $v1 } が `lat,lon` の形式ではありません

## src/interop/czml.rs

engine-interop-czml-kshana-export-epoch-moving-objects = Kshana { $v1 } エクスポート。元期：{ $epoch_note }。移動物体：GCRS（referenceFrame INERTIAL）、単位はメートル、元期からの経過秒。固定地点：地球固定の WGS 84（referenceFrame FIXED）、単位はメートル。

engine-interop-czml-position-gcrs-metres = { $description }（{ $role }）。位置：GCRS、単位はメートル。

engine-interop-czml-latitude-deg-longitude-deg-height = { $description }（{ $role }）。緯度 { $lat_deg } deg、経度 { $lon_deg } deg、WGS 84 楕円体上の高さ { $h_m } m。位置：地球固定、単位はメートル。

engine-interop-czml-radius-along-the-ground = { $description }。地表に沿った半径 { $radius_m } m。

engine-interop-czml-untimed-wgs-84-longitude-and = { $description }。時刻なし：WGS 84 の経度・緯度（単位は度）、地表に固定。

## src/interop/geojson.rs

engine-interop-geojson-earth-fixed-positions-multilinestring-is = { $description }。地球固定の位置。MultiLineString は日付変更線で分割され、times_utc には元のサンプルのみが並びます。

engine-interop-geojson-kshana-export-epoch = Kshana { $v1 } エクスポート。元期：{ $epoch_note }。

engine-e-interop-geojson-invalid-geojson = GeoJSON が不正です：{ $e }

engine-e-interop-geojson-linestring-has-no-coordinates-array = LineString に coordinates 配列がありません

engine-e-interop-geojson-an-rfc-7946-linestring-needs = RFC 7946 の LineString には二つ以上の位置が必要です

engine-interop-geojson-position-is-not-an-array = 位置 { $i } が二つまたは三つの数値の配列ではありません

engine-interop-geojson-position-longitude-is-not-number = 位置 { $i }：経度が数値ではありません

engine-interop-geojson-position-latitude-is-not-number = 位置 { $i }：緯度が数値ではありません

engine-e-interop-geojson-position-longitude-is-outside-180 = 位置 { $i }：経度 { $lon } が [-180, 180] の範囲外です（GeoJSON では経度が先に来ます）

engine-e-interop-geojson-position-latitude-is-outside-90 = 位置 { $i }：緯度 { $lat } が [-90, 90] の範囲外です（GeoJSON では経度が先に来ます）

engine-e-interop-geojson-track-needs-two-or-more = トラックには二つ以上のウェイポイントが必要です

engine-e-interop-geojson-the-route-spans-more-than = 経路の経度範囲が 180 度を超えています。トラック kind は単純な度単位で進むため、日付変更線をまたげません

engine-e-interop-geojson-position-is-deg-from-an = 位置 { $worst } は、等間隔の直線トラックから { $worst2 } deg ずれています（許容差 { $tol_deg } deg）。トラック kind は start + i*step で飛行するため、直線上の等間隔の位置を指定するか、両端の二点のみを指定してください

engine-e-interop-geojson-route-applies-to-the-kinds = 経路が適用されるのは、ウェイポイントトラックを飛行する kind（terrain-nav、terrain-slam、gravity-map、combined-altpnt）です。`{ $k }` は軌跡入力を受け付けません

engine-e-interop-geojson-scenario-toml-is-not-table = シナリオ TOML がテーブルではありません

engine-e-interop-geojson-cannot-serialise-scenario = シナリオをシリアライズできません：{ $e }

## src/interop/mod.rs

engine-e-interop-unknown-export-format-expected-one = 不明なエクスポート形式 '{ $other }' です。次のいずれかが必要です：czml、kml、geojson、stk、sigmf、all、list

engine-e-interop-member = メンバー { $label }：{ $e }

engine-interop-the-scenario-could-not-be = シナリオをエクスポートできませんでした：{ $m }

engine-e-interop-invalid-spectrum-scenario = スペクトルシナリオが不正です：{ $e }

## src/interop/scene.rs

engine-e-interop-scene-time-samples-is-more-than = 時刻サンプル { $n } 件は、エクスポートが書き出せる件数（{ $MAX_SAMPLES }）を超えています

engine-e-interop-scene-objects-samples-is-more-than = オブジェクト { $items } x サンプル { $times } は、エクスポートが書き出せる件数（{ $MAX_SAMPLES }）を超えています

engine-e-interop-scene-invalid-scenario = { $kind } シナリオが不正です：{ $e }

engine-interop-scene-jammer-dbw-transmit-power-dbi = { $jammer_type } ジャマー、送信電力 { $power_dbw } dBW、アンテナ利得 { $gain_dbi } dBi

engine-interop-scene-from-the-jamming-kind-link = { $what }；{ $r } m（ジャミング kind のリンク方程式による。ジャマーは受信機の水平線上にあり、自由空間損失を仮定）

engine-interop-scene-the-chain-pass-stage = { $epoch_note }（チェーンの [pass] ステージ）

engine-interop-scene-circular-orbit-km-altitude-deg = 円軌道、高度 { $altitude_km } km、軌道傾斜角 { $inclination_deg } deg（ウィンドウ開始時点の SGP4 平均要素。passes kind が伝搬するとおり）

engine-interop-scene-ground-station-deg-elevation-mask = 地上局、仰角マスク { $mask_deg } deg

engine-interop-scene-gcrs-and-earth-fixed-states = { $source }；GCRS と地球固定の状態は ephemeris kind 自身の出力です（UT1 と極運動はシナリオの設定どおり）

engine-interop-scene-static-scene-the-kind-flies = 静的シーン：{ $kind } kind は時刻なしのウェイポイントトラックを飛行します

engine-interop-scene-true-track-flown-gps-denied = GPS 拒否下で飛行した真のトラック：start_lat_deg/start_lon_deg から step_lat_deg/step_lon_deg 刻みで { $track } ウェイポイント

engine-e-interop-scene-has-no-scene = `{ $kind }` にはシーンがありません

engine-e-interop-scene-missing-numeric = 数値 `{ $k }` がありません

engine-e-interop-scene-missing-integer-waypoints = 整数 `waypoints` がありません

engine-e-interop-scene-waypoints-is-outside-1000000 = waypoints = { $n } は 1..=1000000 の範囲外です

engine-interop-scene-walker-at-km-deg-inclination = Walker { $w }/{ $planes }/{ $phasing_f }、高度 { $altitude_km } km、軌道傾斜角 { $inclination_deg } deg（SGP4）

engine-interop-scene-the-scenario-gives-no-epoch = シナリオに `epoch` の指定がありません。t = 0 は { $epoch } で、衛星自身のデータ（TLE、放送エフェメリスまたは SP3 の元期）が持つ最も早い元期です。各衛星はそれぞれの元期から伝搬され、それらは { $spread_h } h にわたります。時刻タグは、すべての衛星が t = 0 から始まるというエンジンの前提に従い、各位置はその衛星自身の時刻で GCRS と地球固定の座標系に回転されます。SP3 と OEM のエクスポートでは、代わりに t = 0 を 2000-01-01T00:00:00Z と表記します

engine-interop-scene-the-scenario-gives-no-epoch-2 = シナリオに `epoch` の指定がありません。t = 0 は { $epoch } で、衛星自身のデータ（TLE、放送エフェメリスまたは SP3 の元期）が持つ元期です。SP3 と OEM のエクスポートでは、代わりに t = 0 を 2000-01-01T00:00:00Z と表記します

engine-e-interop-scene-objects-samples-is-more-than-2 = オブジェクト { $satellites } x サンプル { $times_s } は、エクスポートが書き出せる件数（{ $MAX_SAMPLES }）を超えています

engine-interop-scene-user-moving-the-kind-constant = { $user_environment } ユーザー、移動中（kind の一定の速度と針路）

engine-interop-scene-user-receiver = { $user_environment } ユーザー（受信機）

engine-interop-scene-user-orbit-km-altitude-deg = ユーザー軌道、高度 { $altitude_km } km、軌道傾斜角 { $inclination_deg } deg（ケプラー{ $v3 }）

## src/interop/stk.rs

engine-e-interop-stk-no-moving-object = 移動物体 { $index } はありません

engine-interop-stk-kshana-export-object = # Kshana { $v1 } エクスポート：{ $scene }、オブジェクト { $id }（{ $role }）{ "\u000A" }

## src/interop/testbench.rs

engine-interop-testbench-jammer-dbw-transmit-power-dbi = { $jammer_type } ジャマー、送信電力 { $power_dbw } dBW、アンテナ利得 { $gain_dbi } dBi（シナリオのリンクバジェットのパラメーターであり、信号ではありません）

engine-e-interop-testbench-has-no-vehicle-trajectory-to = `{ $other }` にはエクスポートできる機体の軌跡がありません。テストベンチのエクスポートが対象とするのは gnss-ins、jamming、gnss-sim の各 kind です

engine-e-interop-testbench-empty-motion-csv = 運動 CSV が空です

engine-e-interop-testbench-motion-csv-header-is-not = 運動 CSV のヘッダーが期待される列ではありません：{ $head }

engine-e-interop-testbench-row-fields-expected = 行 { $v1 }：{ $f } フィールド（期待値：{ $motion_columns }）

engine-e-interop-testbench-row-column-is-not-number = 行 { $v1 }：列 { $motion_columns } が数値ではありません

engine-e-interop-testbench-line-no = 行 { $v1 }：`$` がありません

engine-e-interop-testbench-line-no-checksum = 行 { $v1 }：チェックサムがありません

engine-e-interop-testbench-line-bad-checksum-field = 行 { $v1 }：チェックサムフィールドが不正です

engine-e-interop-testbench-line-checksum-mismatch = 行 { $v1 }：チェックサムの不一致

engine-e-interop-testbench-line-short-gga = 行 { $v1 }：GGA が短すぎます

engine-interop-testbench-line-bad-latitude = 行 { $v1 }：緯度が不正です

engine-interop-testbench-line-bad-longitude = 行 { $v1 }：経度が不正です

engine-e-interop-testbench-line-bad-altitude = 行 { $v1 }：高度が不正です

engine-e-interop-testbench-line-bad-separation = 行 { $v1 }：ジオイド分離が不正です

engine-e-interop-testbench-line-short-rmc = 行 { $v1 }：RMC が短すぎます

engine-e-interop-testbench-line-rmc-with-no-preceding = 行 { $v1 }：先行する GGA のない RMC です

engine-e-interop-testbench-line-gga-and-rmc-times = 行 { $v1 }：GGA と RMC の時刻が異なります

engine-e-interop-testbench-line-bad-speed = 行 { $v1 }：速度が不正です

engine-e-interop-testbench-line-bad-course = 行 { $v1 }：進路が不正です

engine-e-interop-testbench-line-bad-time-or-date = 行 { $v1 }：時刻または日付が不正です

engine-e-interop-testbench-gga-with-no-following-rmc = 後続の RMC がない GGA があります

engine-e-interop-testbench-waypoint-file-needs-at-least = ウェイポイントファイルには少なくとも二つのサンプルが必要です

engine-e-interop-testbench-the-sample-step-is-not = サンプル間隔 { $step } s がミリ秒の整数倍ではありません

engine-e-interop-testbench-the-samples-are-not-equally = サンプルが等間隔ではありません：区間 { $v1 } は { $dt } s で、最初の区間は { $step } s です

engine-e-interop-testbench-empty-waypoint-file = ウェイポイントファイルが空です

engine-e-interop-testbench-waypoint-not-three-numbers = ウェイポイント { $v1 }：三つの数値ではありません

engine-e-interop-testbench-waypoint-fields-expected = ウェイポイント { $v1 }：{ $f } フィールド（期待値：3）

engine-e-interop-testbench-events-csv-header-is-not = イベント CSV のヘッダーが label,kind,onset_s,end_s,description ではありません

engine-e-interop-testbench-event-row-expected-fields = イベント行 { $v1 }：5 フィールドが必要です

engine-e-interop-testbench-event-row-unknown-kind = イベント行 { $v1 }：不明な kind { $f }

engine-e-interop-testbench-event-row-bad-onset = イベント行 { $v1 }：開始時刻が不正です

engine-e-interop-testbench-event-row-bad-end = イベント行 { $v1 }：終了時刻が不正です

engine-interop-testbench-no-waypoints-txt-written = .waypoints.txt は書き込まれませんでした：{ $e }

## src/interop/time.rs

engine-interop-time-not-utc-time-yyyy-mm = UTC 時刻 `YYYY-MM-DDTHH:MM:SS` ではありません：{ $why }：{ $text }

## src/ionex.rs

engine-e-ionex-missing = { $what } がありません

engine-e-ionex-bad-number-in = { $what }：{ $col } の数値が不正です

engine-e-ionex-two-digit-year = { $what }：二桁の年 { $year }

engine-e-ionex-no-end-of-header = END OF HEADER がありません

engine-e-ionex-height-dependent-ionex-maps-are = 高度依存（3-D）の IONEX マップはサポートされていません

engine-e-ionex-zero-grid-step = グリッド間隔がゼロです

engine-e-ionex-grid-needs-at-least-nodes = グリッドには少なくとも 2 x 2 ノードが必要です

engine-e-ionex-map-no = マップ { $index }：{ $end_label } がありません

engine-e-ionex-map-band-latitude-header-grid = マップ { $index }：バンド { $band } の緯度は { $band_lat }、ヘッダーのグリッドは { $want }

engine-e-ionex-map-band-longitudes-differ = マップ { $index }：バンド { $band } の経度が異なります

engine-e-ionex-map-band-truncated = マップ { $index }：バンド { $band } が途中で切れています

engine-e-ionex-map-bands-header-grid-has = マップ { $index }：バンド数 { $band }、ヘッダーのグリッドは { $n_lat }

engine-e-ionex-map-no-epoch-of-current = マップ { $index }：EPOCH OF CURRENT MAP がありません

engine-e-ionex-tec-maps-header-of-maps = TEC マップ { $tec_maps } 件、ヘッダー # OF MAPS IN FILE { $n_maps }

engine-e-ionex-tec-map-epochs-not-increasing = TEC マップの元期が増加していません

## src/iq/acq.rs

engine-e-iq-acq-hz-does-not-hold-whole = { $fs_hz } Hz では { $code } の周期あたりのサンプル数が整数になりません（{ $spc } サンプル）

engine-e-iq-acq-coherent-periods-and-noncoherent-must = coherent_periods と noncoherent は正でなければなりません

engine-e-iq-acq-stream-ended-after-of-samples = ストリームは { $got } サンプルで終了しました（必要数：{ $needed }）

engine-e-iq-acq-cfar-reference-cells-must-be = CFAR の参照セルは偶数で、かつ 2 以上でなければなりません（値：{ $n }）

engine-e-iq-acq-cfar-stride-must-be-at = CFAR のストライドは少なくとも 1 ラグでなければなりません

engine-e-iq-acq-cfar-per-cell-pfa-must = CFAR のセルごとの Pfa は (0, 1) の範囲でなければなりません（値：{ $pfa_cell }）

engine-e-iq-acq-cfar-window-reaches-lags-each = CFAR ウィンドウは片側 { $reach } ラグに及び、{ $samples_per_period } ラグの周期には広すぎます

## src/iq/acq_surface.rs

engine-e-iq-acq-surface-unknown-surface-format-expected-csv = 不明なサーフェス形式 { $s } です。csv、json、bin のいずれかが必要です

engine-e-iq-acq-surface-the-surface-would-hold-cells = サーフェスのセル数が { $spc_cells } になります（上限 { $MAX_SURFACE_CELLS }）。ドップラーのステップを広げるか、ドップラーの範囲を狭めてください

engine-e-iq-acq-surface-surface-header = サーフェスヘッダー：{ $e }

engine-e-iq-acq-surface-surface-schema-expected = サーフェススキーマ { $schema }。期待値：{ $SURFACE_SCHEMA }

engine-e-iq-acq-surface-surface-body = サーフェス本体：{ $e }

## src/iq/campaign/conditions.rs

engine-e-iq-campaign-conditions-recording-format-and-sample-rate = 記録 '{ $id }'：format と sample_rate_hz は一緒に指定しなければなりません

engine-e-iq-campaign-conditions-test-conditions-json = 試験条件（JSON）：{ $e }

engine-e-iq-campaign-conditions-test-conditions-toml = 試験条件（TOML）：{ $e }

engine-e-iq-campaign-conditions-events-from-sigmf-needs-sigmf = { $path }：events_from_sigmf には SigMF 記録が必要です（実際：{ $rec }）

engine-e-iq-campaign-conditions-sigmf-metadata = SigMF メタデータ：{ $e }

engine-e-iq-campaign-conditions-sigmf-metadata-global-core-sample = SigMF メタデータ：global の core:sample_rate がありません

engine-iq-campaign-conditions-core-sample-start-is-missing = { $at }：core:sample_start がありません

engine-iq-campaign-conditions-no-core-sample-count-and = { $at }：イベントを終了させる core:sample_count も電力点もありません

engine-e-iq-campaign-conditions-kshana-test-event = { $at }：kshana:test_event：{ $e }

engine-e-iq-campaign-conditions-schema-must-be-got = schema は "{ $SCHEMA }" でなければなりません（実際："{ $schema }"）

engine-e-iq-campaign-conditions-recording-id-must-not-be = recording.id は空であってはなりません

engine-e-iq-campaign-conditions-recording-settle-must-be-finite = recording.settle_s は有限かつ >= 0 でなければなりません

engine-e-iq-campaign-conditions-recording-sha256-must-be-64 = recording.sha256 は 64 桁の十六進数でなければなりません

engine-e-iq-campaign-conditions-recording-kind-must-be-iq = recording.kind は "iq" または "receiver-log" でなければなりません（実際："{ $k }"）

engine-e-iq-campaign-conditions-at-least-one-expected-group = [[expected]] グループが少なくとも一つ必要です

engine-e-iq-campaign-conditions-ids-must-not-be-empty = { $at }：ids は空であってはなりません

engine-e-iq-campaign-conditions-lists-value-give-one-per = { $at }：{ $key } の値の数は { $n } です。id ごとに一つ指定してください（{ $ids }）

engine-e-iq-campaign-conditions-duplicate-id = { $at }：id が重複しています

engine-e-iq-campaign-conditions-offset-must-be-after-onset = { $at }：offset_s は onset_s より後でなければなりません

engine-e-iq-campaign-conditions-affects-must-be-all-or = { $at }：affects は "all" または id のリストでなければなりません

engine-e-iq-campaign-conditions-affects-id-is-not-in = { $at }：affects の id { $bad } が [[expected]] にありません

engine-e-iq-campaign-conditions-must-be-positive = { $at }：q は正でなければなりません

engine-e-iq-campaign-conditions-power-points-must-not-be = { $at }：power.points は空であってはなりません

engine-e-iq-campaign-conditions-power-points-must-be-in = { $at }：power.points は時刻順でなければなりません

engine-e-iq-campaign-conditions-power-points-must-be-finite = { $at }：power.points は有限でなければなりません

engine-e-iq-campaign-conditions-power-quantity-jammer-dbm-needs = { $at }：power.quantity = "jammer_dbm" には reference_signal_dbm が必要です

engine-e-iq-campaign-conditions-events-and-overlap-on-shared = イベント '{ $id }' と '{ $id2 }' が共有する衛星上で重なっています

## src/iq/campaign/detect.rs

engine-e-iq-campaign-detect-monitors-detect-grace-must-be = monitors.detect_grace_s は >= 0 でなければなりません

engine-e-iq-campaign-detect-monitors-roc-window-must-be = monitors.roc_window_s は正でなければなりません

## src/iq/campaign/runner.rs

engine-e-iq-campaign-runner-recording-sha-256-does-not = 記録 '{ $id }'：SHA-256 { $sha } が記載値 { $want } と一致しません

engine-e-iq-campaign-runner-runs-jsonl = runs.jsonl：{ $e }

engine-e-iq-campaign-runner-recording-holds-samples-needed-to = { $code }：記録のサンプル数は { $buf } で、捕捉には { $n } が必要です

## src/iq/campaign/score.rs

engine-e-iq-campaign-score-scoring-baseline-window-must-be = scoring.baseline_window_s は正でなければなりません

engine-e-iq-campaign-score-scoring-js-bin-db-must = scoring.js_bin_db は正でなければなりません

engine-e-iq-campaign-score-scoring-reacq-grace-must-be = scoring.reacq_grace_s は >= 0 でなければなりません

engine-e-iq-campaign-score-scoring-false-lock-doppler-hz = scoring.false_lock_doppler_hz は正でなければなりません

engine-e-iq-campaign-score-scoring-false-lock-min-epochs = scoring.false_lock_min_epochs は 1 以上でなければなりません

## src/iq/campaign/spec.rs

engine-e-iq-campaign-spec-campaign-json = キャンペーン（JSON）：{ $e }

engine-e-iq-campaign-spec-campaign-toml = キャンペーン（TOML）：{ $e }

engine-e-iq-campaign-spec-inputs-conditions-must-list-at = inputs.conditions には少なくとも一つのファイルまたは glob を指定しなければなりません

engine-e-iq-campaign-spec-run-max-seconds-must-be = run.max_seconds は >= 0 でなければなりません

engine-e-iq-campaign-spec-frontend-names-must-be-non = フロントエンド名は空でなく、一意でなければなりません（'{ $name }'）

engine-e-iq-campaign-spec-inputs-conditions-matches-no-file = inputs.conditions：'{ $pat }' に一致するファイルがありません

engine-e-iq-campaign-spec-recording-id-appears-in-both = 記録 id '{ $w }' が { $w2 } と { $w3 } の両方に現れます

engine-e-iq-campaign-spec-inputs-design-names-needs-inputs = inputs.design_names には inputs.designs が必要です

engine-e-iq-campaign-spec-inputs-design-names-no-design = inputs.design_names：{ $path } に設計 '{ $n }' がありません

## src/iq/campaign/truth.rs

engine-e-iq-campaign-truth-truth-line = 真値の行 { $v1 }：{ $e }

## src/iq/channel/cn0_profile.rs

engine-e-iq-channel-cn0-profile-n0-profile = C/N0 プロファイル：{ $e }

engine-e-iq-channel-cn0-profile-n0-profile-2 = C/N0 プロファイル：{ $m }

engine-iq-channel-cn0-profile-segment-step-values-must-be = セグメント { $i }：ステップの値は有限でなければなりません

engine-iq-channel-cn0-profile-segment-ramp-needs-end-start = セグメント { $i }：ランプには end_s > start_s が必要です

engine-iq-channel-cn0-profile-segment-points-need-equal-non = セグメント { $i }：点には、同じ長さで空でない t_s と db が必要です

engine-iq-channel-cn0-profile-segment-must-increase-strictly = セグメント { $i }：t_s は厳密に増加しなければなりません

engine-iq-channel-cn0-profile-segment-points-must-be-finite = セグメント { $i }：点は有限でなければなりません

engine-iq-channel-cn0-profile-segment-fade-s4-must-be = セグメント { $i }：フェード s4 は (0, 1] の範囲でなければなりません

engine-iq-channel-cn0-profile-segment-fade-tau-must-be = セグメント { $i }：フェード tau_s は正でなければなりません

## src/iq/cli/acquire.rs

engine-iq-cli-acquire-recording-holds-samples-needed-for = { $code }：記録のサンプル数は { $samples } で、この探索には { $need } が必要です

engine-iq-cli-acquire-surface-name-the-format-with = --surface { $path }：--surface-format csv|json|bin で形式を指定するか、パスを .csv、.json、.bin のいずれかで終えてください

engine-iq-cli-acquire-acquisition-hz-coherent-period-non = 捕捉：{ $fs_hz } Hz、コヒーレント周期 { $coherent_periods } x 非コヒーレント { $noncoherent }、pfa { $pfa }{ "\u000A" }

## src/iq/cli/campaign.rs

engine-iq-cli-campaign-report-rebuilt-of-cell-row = レポートを再構築しました：セル { $cells_present } / { $cells_total }、行 { $rows }、合格基準未達 { $rows_failed } 行；ダイジェスト { $s }

engine-iq-cli-campaign-campaign-cell-already-done-run =
    キャンペーン { $name }：セル { $cells_total }；完了済み { $cells_skipped }、今回実行 { $cells_run }、失敗 { $cells_failed }、保留 { $cells_pending }
    出力：{ $out_dir }

engine-iq-cli-campaign-first-failure =
    { $msg }
    最初の失敗（{ $key }…）：{ $e }

engine-iq-cli-campaign-ok-event-expected-satellite-condition =
    { $resolved }
    OK：イベント { $events }、期待される衛星 { $tc }；条件ハッシュ { $tc2 }

## src/iq/cli/channel.rs

engine-iq-cli-channel-iono-slant-tecu = 電離圏 スラント { $t } TECU

engine-iq-cli-channel-iono-vertical-tecu = 電離圏 垂直 { $t } TECU

engine-iq-cli-channel-tropo-doy = 対流圏 doy { $tropo_doy }

engine-iq-cli-channel-multipath-ground = マルチパス { $h }m、地面 { $multipath_ground }

engine-e-iq-cli-channel-multipath-ground-must-be-dry = --multipath-ground は dry、wet、sea のいずれかでなければなりません（実際：{ $other }）

engine-e-iq-cli-channel-give-at-most-one-of = --iono-stec、--iono-vtec、--iono-klobuchar のうち指定できるのは一つまでです

## src/iq/cli/frontend.rs

engine-iq-cli-frontend-bandpass-wants-lo-hi-got = --bandpass には lo,hi が必要です（実際：{ $v }）

engine-e-iq-cli-frontend-bandpass-needs-lo-hi = --bandpass には lo < hi が必要です

engine-e-iq-cli-frontend-bandpass-with-transition-hz-does = --bandpass { $lo },{ $hi } は、遷移幅 { $transition } Hz では fs/2（{ $v1 } Hz）未満に収まりません。帯域か遷移幅を狭めてください

engine-e-iq-cli-frontend-bits-must-be-16-got = --bits は 1..=16 でなければなりません（実際：{ $bits }）

engine-iq-cli-frontend-filtered-samples-hz-to-sidecar = フィルタ済み { $total } サンプル（{ $fs_hz } Hz）を { $out }（{ $format }）に出力。サイドカー { $sidecar_path }

## src/iq/cli/labfit.rs

engine-iq-cli-labfit-cannot-read = { $path } を読み込めません：{ $e }

engine-iq-cli-labfit-invalid-labfit-scenario = labfit シナリオが不正です：{ $e }

engine-iq-cli-labfit-fitted-run-wrote = { $runs } 回の実行をフィットしました；書き込み先：{ $written }

engine-iq-cli-labfit-fitted-unit-from-campaign-wrote = キャンペーンから { $fit_units } ユニットをフィットしました；書き込み先：{ $written }

engine-iq-cli-labfit-cannot-write = { $target } に書き込めません：{ $e }

## src/iq/cli/mod.rs

engine-iq-cli-needs-value = { $s } には値が必要です

engine-e-iq-cli-cannot-parse = { $k }：{ $v } を解析できません

engine-iq-cli-iq-takes-positional-argument-got = iq { $cmd } の位置引数は { $n } 個ですが、{ $pos } 個でした

engine-e-iq-cli-cannot-parse-2 = { $k }：{ $p } を解析できません

engine-iq-cli-unknown-iq-processing-command-expected = 不明な iq 処理コマンド { $other } です。scene、acquire、track、sweep、labfit、frontend、monitor、campaign、conditions のいずれかが必要です

## src/iq/cli/scene.rs

engine-e-iq-cli-scene-prn-is-out-of-range = PRN { $id } は GPS の範囲外です

engine-e-iq-cli-scene-no-healthy-gps-ephemeris-found = 要求された PRN に対する正常な GPS エフェメリスが見つかりません

engine-iq-cli-scene-rx-pos-wants-lat-lon = --rx-pos には lat,lon,alt が必要です（実際：{ $v }）

engine-iq-cli-scene-n0-profile-segment = { $chan_desc }；C/N0 プロファイル（セグメント { $segments }）

engine-iq-cli-scene-truth-format-must-be-csv = --truth-format は csv または jsonl でなければなりません（実際：{ $other }）

engine-iq-cli-scene-integer-scale-lsb-noise-normalised = ；整数スケール：1 LSB = { $sc } 雑音正規化単位（成分あたりの期待 RMS { $v1 } LSB）、クリップされた要素 { $clipped }

engine-iq-cli-scene-written-by-kshana-iq-scene = kshana iq scene による書き込み：SIMULATED シーンであり、記録ではありません{ $scale_note }

engine-iq-cli-scene-ion-sdr-metadata = ION SDR メタデータ { $path }

engine-iq-cli-scene-sigmf-data-meta = SigMF データ { $data_path }、メタ { $meta_path }

engine-iq-cli-scene-written-by-kshana-iq-scene-2 = kshana iq scene による書き込み{ $scale_note }

engine-iq-cli-scene-wrote-samples-hz-to-truth = { $samples } サンプル（{ $format }、{ $fs_hz } Hz）を { $data_path } に、真値レコード { $truth_records } 件を { $truth_path } に書き込みました；{ $meta_note }；チャネル：{ $chan_desc }{ $scale_note }

## src/iq/cli/sweep.rs

engine-iq-cli-sweep-cannot-be-combined-with-design = { $k } は --design と併用できません：sweep はファイル内のすべての設計を実行します

engine-iq-cli-sweep-loop-design-sweep-design-prn = ループ設計スイープ：（設計、PRN）の結果 { $rows } 件{ "\u000A" }

## src/iq/cli/track.rs

engine-iq-cli-track-recording-holds-samples-needed-to = { $code }：記録のサンプル数は { $samples } で、捕捉には { $need } が必要です

engine-iq-cli-track-not-acquired-statistic-threshold-raise = { $code }：捕捉されませんでした（統計量 { $statistic } < しきい値 { $threshold }）。--doppler-max、--acq-coherent または --acq-noncoherent を引き上げるか、記録を確認してください

engine-iq-cli-track-designs-and-differ-in-integration = 設計 { $first } と { $d } は integration.extra_taps_chips が異なります。すべての出力レコードの列を揃えるため、一回の実行内の設計は一致していなければなりません

## src/iq/cli/track.rs

engine-iq-cli-track-epochs-name-the-format-with = --epochs { $p }：--epochs-format csv|jsonl|bin で形式を指定するか、パスを .csv、.jsonl、.bin のいずれかで終えてください

engine-iq-cli-track-hz-is-samples-per-chip = { $fs_hz } Hz は { $c } のチップあたり { $r } サンプルです。整数比のサンプリングでは、コード弁別器が階段状になります（チップあたり 2 サンプルでは DLL がディザし、45 dB-Hz で約 0.09 チップ RMS のコード誤差が生じます）。この記録から得たコードループのジッターとバイアスは代表的な値ではありません。コードループを評価するには、チップレートの半分の倍数ではないレートを使用してください。

## src/iq/io/batch.rs

engine-e-iq-io-batch-worker-exited-before-processing-this = ワーカーがこの入力を処理する前に終了しました

## src/iq/io/cli.rs

engine-e-iq-io-cli-unknown-option = 不明なオプション { $s }

engine-e-iq-io-cli-format-needs-rate = --format には --rate が必要です

engine-iq-io-cli-iq-takes-path-argument-got = iq { $cmd } のパス引数は { $n } 個ですが、{ $pos } 個でした

engine-iq-io-cli-unknown-iq-command = 不明な iq コマンド { $other }

engine-iq-io-cli-wrote-samples-hz-to-saturated = { $n } サンプル（{ $to }、{ $fs_hz } Hz）を { $files } に書き込みました；飽和した要素 { $w }{ $v4 }

## src/iq/io/follow.rs

engine-e-iq-io-follow-follow-reads-single-channel-recordings = { $meta_path }：--follow が読み込めるのは単一チャネルの記録のみです

engine-e-iq-io-follow-follow-reads-recording-with-one = { $meta_path }：--follow が読み込めるのは一つのキャプチャを持つ記録ですが、この記録のキャプチャ数は { $captures } です

engine-e-iq-io-follow-no-positive-core-sample-rate = { $meta_path }：正の core:sample_rate がありません

engine-e-iq-io-follow-the-capture-does-not-start = { $meta_path }：キャプチャがバイト境界から始まっていません

## src/iq/io/format.rs

engine-e-iq-io-format-unknown-sample-format-expected-ci8 = 不明なサンプル形式 { $name } です。例えば ci8、cu8、ci16_le、ci16_be、cf32_le、cf32_be、ri16_le、ci12r_le、ci12l_be、cu16_le、cu12r_be、ci4_msb、cu4_lsb、c2tc_msb、r2sm_lsb、c2sm_byte のいずれかが必要です。複素数の場合は末尾に _qi を付けることもできます

## src/iq/io/inventory.rs

engine-e-iq-io-inventory-sidecar-sample-rate-hz-is = サイドカーの sample_rate_hz { $sample_rate_hz } が正ではありません

engine-e-iq-io-inventory-sdrx-recordings-hold-one-stream = { $path }：.sdrx 記録が保持するストリームは一つです。チャネル { $channel } は存在しません

engine-e-iq-io-inventory-raw-file-with-no-sidecar = { $path }：サイドカーのない生ファイルです。形式を指定するか、{ $sidecar_candidates } を書いてください

## src/iq/io/report.rs

engine-e-iq-io-report-cannot-serialise-row = 行をシリアライズできません：{ $e }

## src/iq/io/resample.rs

engine-e-iq-io-resample-invalid-filter-design-passband-frac = フィルタ設計 { $design } が不正です：passband_frac は (0, 1) の範囲、減衰量は > 0 でなければなりません

engine-e-iq-io-resample-if-hz-must-lie-strictly = IF { $if_hz } Hz は、0 とサンプルレートの半分（{ $v1 } Hz）の間に厳密に収まらなければなりません

## src/iq/io/sdrx.rs

engine-e-iq-io-sdrx-sdrx-data = { "." }sdrx データ：{ $e }

engine-iq-io-sdrx-sdrx-bit-bits-sample = sdrx { $quantization } ビット { $enc } { $fmt }（{ $packed_bits } ビット/サンプル）

## src/iq/io/sigmf_stream.rs

engine-e-iq-io-sigmf-stream-unsupported-sigmf-core-datatype-supported = サポートされていない SigMF core:datatype { $datatype } です。サポートされるのは ci8、cu8、ci16_le、ci16_be、cf32_le、cf32_be と、実数の ri8、ru8、ri16_le、ri16_be、rf32_le、rf32_be です

engine-e-iq-io-sigmf-stream-is-not-sigmf-core-datatype = { $datatype } は SigMF の core:datatype ではありません

engine-e-iq-io-sigmf-stream-invalid-sigmf-metadata = SigMF メタデータが不正です：{ $e }

engine-e-iq-io-sigmf-stream-has-no-sigmf-core-datatype = { $format } には SigMF の core:datatype がありません。raw として書き出してください

engine-e-iq-io-sigmf-stream-core-num-channels-does-not = { $name }：core:num_channels { $ch } が最初の記録の { $c0 } と一致しません

engine-e-iq-io-sigmf-stream-no-core-sample-rate = { $name }：core:sample_rate がありません

engine-e-iq-io-sigmf-stream-core-sample-rate-is-not = { $name }：core:sample_rate { $rate } が正ではありません

engine-e-iq-io-sigmf-stream-at-hz-does-not-match = { $name }：{ $rate } Hz の { $f } が、最初の記録の { $r0 } Hz の { $f0 } と一致しません

engine-e-iq-io-sigmf-stream-capture-at-sample-is-out = { $name }：サンプル { $sample_start } のキャプチャが順序外か、データ内の { $n_file } サンプルを超えています

engine-e-iq-io-sigmf-stream-first-capture-does-not-start = { $name }：最初のキャプチャがバイト境界から始まっていません

engine-e-iq-io-sigmf-stream-channel-requested-the-recording-has = チャネル { $channel } が要求されましたが、記録のチャネル数は { $channels } です（チャネルは 0 から数えます）

engine-e-iq-io-sigmf-stream-invalid-sigmf-collection = SigMF コレクションが不正です：{ $e }

engine-e-iq-io-sigmf-stream-sha-512-does-not-match = { $mp }：SHA-512 { $got } がコレクションの { $h } と一致しません

## src/iq/io/stream.rs

engine-e-iq-io-stream-stream-of-interleaved-streams-does = { $channels } 本のインターリーブされたストリームのうち、ストリーム { $select } は存在しません（ストリームは 0 から数えます）

engine-e-iq-io-stream-sample-of-does-not-start = { $format } のサンプル { $k } がバイト境界から始まっていません

engine-e-iq-io-stream-time-window-start-duration-both = 時間ウィンドウの開始 { $start_s } s、長さ { $duration_s } s：どちらも非負でなければなりません

## src/iq/labfit/campaign.rs

engine-iq-labfit-campaign-most-damaging-stated-cw-no = 記載された最も有害な Q（cw）：種類 `{ $event_type }` のテーブル値がありません

engine-e-iq-labfit-campaign-the-campaign-is-not-complete = { $out_dir }：キャンペーンが完了していません

engine-e-iq-labfit-campaign-digest-does-not-match-the = { $out_dir }：DIGEST { $on_disk } がセル（{ $digest }）と一致しません

engine-e-iq-labfit-campaign-recording-test-conditions-hash-does = 記録 `{ $id }`：試験条件のハッシュ { $h } が記録された { $conditions_hash } と一致しません

engine-e-iq-labfit-campaign-signal-unknown-chip-rate = 信号 `{ $signal }`：チップレートが不明です

## src/iq/labfit/fit.rs

engine-e-iq-labfit-fit-no-run-is-usable-for = ロックのフィットに使用できる実行がありません：{ $v1 }

## src/iq/labfit/iqfit.rs

engine-iq-labfit-iqfit-insufficient-data-not-fitted-recordings = データ不足：フィットしていません（記録 { $m } 件。少なくとも { $min_rec } 件が必要です）

engine-iq-labfit-iqfit-uncensored-span-db-is-under = 打ち切りのない J/S の範囲 { $span_db } dB が { $v2 } dB 未満です

engine-iq-labfit-iqfit-eff-and-delta-are-not = Q_eff と delta は個別に識別できません（|corr| { $full } >= { $v2 }）：モデルが依存するのは delta - 10 log10 Q_eff のみです

engine-iq-labfit-iqfit-not-fitted-re-acquisitions-observed = フィットしていません：再捕捉が { $n_reacq } 回観測されました（少なくとも 3 回が必要です）

engine-e-iq-labfit-iqfit-unknown-mode-only-validation = 不明な mode `{ $m }` です（`validation` のみ）

engine-e-iq-labfit-iqfit-validation-pi90-coverage-must-be = validation.pi90_coverage は [0, 1] の範囲内の [lower, upper] でなければなりません

engine-e-iq-labfit-iqfit-campaign-fit-bounds-must-be = campaign_fit.q_bounds は 0 < lower < upper を満たす [lower, upper] でなければなりません

engine-e-iq-labfit-iqfit-campaign-fit-delta-bounds-db = campaign_fit.delta_bounds_db は [lower, upper] でなければなりません

engine-e-iq-labfit-iqfit-the-campaign-has-no-event = キャンペーンに、電力プロファイルが記載されたフィット対象のイベントがありません

## src/iq/labfit/iqreport.rs

engine-iq-labfit-iqreport-lab-fit-from-iq-campaign =
    # IQ キャンペーンによるラボフィット：{ $r }

    スキーマ `{ $schema }`、エンジン { $engine_version }。ラベル：**{ $label }**。

    { $statement }

    { $advisory }{ "\u000A\u000A" }

engine-iq-labfit-iqreport-campaign-digest-campaign-json-sha = キャンペーン DIGEST `{ $campaign_digest }`；`campaign.json` SHA-256 `{ $campaign_json_sha256 }`；シナリオ SHA-256 `{ $scenario_sha256 }`；{ $cells } セル；ブートストラップ反復 { $bootstrap } 回（シード { $seed }）。{ "\u000A\u000A" }

engine-iq-labfit-iqreport-unit-status-recordings-satellites-events =
    ## ユニット { $i }：{ $signal } / { $name } / { $name2 } / { $jammer_type }

    ステータス：{ $status }。記録 { $recordings } 件、衛星 { $satellites } 機、イベント { $events } 件；フィット済みビン { $bins_used }、打ち切りビン { $bins_censored }。{ "\u000A\u000A" }

engine-iq-labfit-iqreport-n0-model-delta-eff-db = C/N0 モデル（{ $q_mode }）：`delta_eff` = { $ci } dB（識別可能なオフセット、Q = 1 に換算）；`Q_eff` = { $q }；その Q での `delta` = { $ci2 } dB；corr(Q, delta) { $om }；残差 RMS { $residual_rms_db } dB（{ $span_db } dB の J/S 範囲）。Q_eff は、独立した電力測定なしには C/N0 データから識別できません。{ "\u000A\u000A" }

engine-iq-labfit-iqreport-held-at-its-stated-value = Q は記載値に固定しました：{ $why }。{ "\u000A\u000A" }

engine-iq-labfit-iqreport-threshold-direct-median-db-over = しきい値 J/S、直接法：ロス { $n } 件の中央値 { $om } dB（IQR { $t }）。{ "\u000A\u000A" }

engine-iq-labfit-iqreport-hold-out-leave-one-recording = ホールドアウト（記録を一つずつ除外）、補間：ビン { $bins }、C/N0 RMS { $om } dB、PI90 カバレッジ { $om2 }

engine-iq-labfit-iqreport-events-loss-time-rms-pi90 = ；{ $model }：イベント { $n } 件、ロス時刻 RMS { $om } s、PI90 カバレッジ { $om2 }

engine-iq-labfit-iqreport-validation-table-sha-256-registered =
    検証テーブル SHA-256 `{ $table_sha256 }`（登録 { $registered }）：

    | 合格基準 | 限界 | 値 | 判定 |
    |---|---|---|---|{ "\u000A" }

## src/iq/labfit/mod.rs

engine-iq-labfit-run-log = 実行 `{ $label }` のログ

engine-e-iq-labfit-run = 実行 `{ $label }`：{ $e }

engine-e-iq-labfit-the-scenario-input-names-no = シナリオの [input] がキャンペーンを指定していません

engine-e-iq-labfit-input-campaign-and-runs-are = { "[" }input] の campaign と [[runs]] は排他的です：どちらか一方を指定してください

engine-e-iq-labfit-iq-labfit-scenario = iq-labfit シナリオ：{ $e }

## src/iq/labfit/observe.rs

engine-iq-labfit-observe-the-log-carries-no-per = ログに衛星ごとの C/N0{ $cfg } がありません（観測量：[{ $observables }]）

engine-iq-labfit-observe-no-epoch-before-the-onset = { $onset } s の開始より前のエポックがありません

engine-iq-labfit-observe-no-epoch-at-or-after = { $onset } s の開始以降のエポックがありません

## src/iq/labfit/report.rs

engine-iq-labfit-report-lab-fit-label-settings-sha =
    # ラボフィット：{ $r }

    ラベル：**{ $label }**。設定 SHA-256 `{ $settings_sha256 }`。{ "\u000A\u000A" }

engine-iq-labfit-report-n0-samples-residual-rms-db = { "\u000A" }C/N0 サンプル { $n_samples } 件、残差 RMS { $om } dB。{ $r }{ "\u000A" }

engine-iq-labfit-report-model-parameter-value-bounds-at =
    { "\u000A" }## モデル：{ $model }（{ $label }）

    | パラメーター | 値 | 境界 | 境界上 | ブートストラップ sd (95 %) |
    |---|---|---|---|---|{ "\u000A" }

engine-iq-labfit-report-event-time-rms-over-events =
    { "\u000A" }イベント時刻 RMS { $om } s（イベント { $n_events } 件）；ロスの見逃し { $loss_missed } / 余分 { $loss_extra }、再捕捉の見逃し { $reacq_missed } / 余分 { $reacq_extra }。

    | 実行 | 低下 dB-Hz | 再ロック dB-Hz | イベント | RMS s |
    |---|---|---|---|---|{ "\u000A" }

engine-iq-labfit-report-hold-out-folds-all-interpolation =
    { "\u000A" }ホールドアウト（{ $scheme }、{ $folds } フォールド）：全体 { $om } s、補間 { $om2 } s、外挿 { $om3 } s。

    | ホールドアウトした実行 | クラス | 距離 | 最も近い訓練用の実行 | RMS s |
    |---|---|---|---|---|{ "\u000A" }

## src/iq/lunanet_afs.rs

engine-iq-lunanet-afs-fid-is-reserved-for-future = FID { $fid } は将来の使用のために予約されています（定義されているのは FID 0 のみです）

engine-iq-lunanet-afs-toi-is-outside-99 = TOI { $toi } は 0..=99 の範囲外です

engine-iq-lunanet-afs-sb1-symbol-disagree-with-the = SB1 シンボル { $sb1_err } 個がデコードされたフィールドと一致しません

engine-iq-lunanet-afs-frames-at-and-are-symbols = { $w } と { $w2 } のフレームは { $gap } シンボル離れており、{ $FRAME_SYMBOLS } ではありません

engine-iq-lunanet-afs-toi-follows-toi-expected = TOI { $w } が TOI { $w2 } の次にありますが、期待値は { $want } です

engine-e-iq-lunanet-afs-unexpected-character-in-symbol-stream = シンボルストリームに予期しない文字 { $c } があります（使用できるのは 0、1、空白のみです）

engine-iq-lunanet-afs-prn-first-24-chips-differ = { $name } PRN { $prn }：最初の 24 チップが異なります

engine-iq-lunanet-afs-prn-last-24-chips-differ = { $name } PRN { $prn }：最後の 24 チップが異なります

engine-iq-lunanet-afs-the-document-prints-a14850-for = { $miss }（文書では PRN 147 と PRN 151 の両方に A14850 が印字されています。ジェネレーターは PRN 151 のものを再現しているため、PRN 147 の項目は文書の誤植である可能性が高いです）

engine-iq-lunanet-afs-encoded-0x-decoded-fid-toi = エンコード 0x{ $word }、デコード FID { $fid } TOI { $toi }

## src/iq/monitor/run.rs

engine-e-iq-monitor-run-monitor-settings = モニター設定：{ $e }

## src/iq/scene/geometry.rs

engine-e-iq-scene-geometry-static-position-not-finite = 静的位置が有限ではありません

engine-e-iq-scene-geometry-constant-velocity-trajectory-not-finite = 等速軌跡が有限ではありません

engine-e-iq-scene-geometry-waypoint-trajectory-has-no-waypoints = ウェイポイント軌跡にウェイポイントがありません

engine-e-iq-scene-geometry-waypoint-not-finite = ウェイポイントが有限ではありません

engine-e-iq-scene-geometry-waypoint-times-must-increase-strictly = ウェイポイントの時刻は厳密に増加しなければなりません

## src/iq/scene/mod.rs

engine-e-iq-scene-prn-is-not-gps-prn = PRN { $prn } は GPS C/A の PRN ではありません

engine-e-iq-scene-ephemeris-system-is-not-gps = エフェメリスのシステム { $system } は GPS ではありません

engine-e-iq-scene-satellite = 衛星 { $value }：{ $e }

## src/iq/scene/nav.rs

engine-e-iq-scene-nav-is-pilot-data-free-component = パイロット（データなし）成分であり、航法データを持ちません

engine-e-iq-scene-nav-carries-data-the-scene-does = シーンがモデル化しないデータを持っています。データなしで生成してください

engine-e-iq-scene-nav-does-not-carry-gps-lnav = GPS LNAV を搬送しません（搬送するのは GPS L1 C/A のみです）。シード付きデータを使用してください

engine-e-iq-scene-nav-not-an-lnav-source = LNAV の供給源ではありません

## src/iq/scene/synthetic.rs

engine-e-iq-scene-synthetic-scene-needs-at-least-one = シーンには少なくとも一機の衛星（--prn）が必要です

engine-e-iq-scene-synthetic-doppler-lists-value-give-one = --doppler の値の数は { $dopplers } です。--prn ごとに一つ（{ $ids }）指定するか、単一の値を指定してください

engine-e-iq-scene-synthetic-data = --data：{ $code } { $e }

## src/iq/scene/truth.rs

engine-e-iq-scene-truth-truth-row-has-fields-expected = 真値の行のフィールド数は { $f } ですが、10 が必要です

engine-e-iq-scene-truth-truth-field = 真値フィールド { $i }：{ $e }

engine-e-iq-scene-truth-truth-sat-id = 真値 sat_id：{ $e }

## src/iq/short.rs

engine-e-iq-short-fs-hz-must-be-positive = fs_hz は正の数でなければなりません

engine-e-iq-short-duration-must-be-in = duration_s は (0, { $MAX_DURATION_S }] の範囲でなければなりません

engine-e-iq-short-ids-must-hold-to-satellites = ids には 1 から { $MAX_SATELLITES } 機の衛星を含めなければなりません

engine-e-iq-short-dopplers-must-be-finite = dopplers は有限でなければなりません

engine-e-iq-short-samples-requested-short-run-holds = { $n } サンプルが要求されましたが、ショート実行が保持できるのは最大 { $MAX_SAMPLES } です

## src/iq/signals/by_name.rs

engine-e-iq-signals-by-name-prn-is-out-of-range = { $signal }：PRN { $id } は範囲外です

engine-e-iq-signals-by-name-glonass-l1of-frequency-channel-is = GLONASS L1OF の周波数チャネル { $id } が -7..=6 の範囲外です

engine-e-iq-signals-by-name-unknown-signal-expected-one-of = 不明な信号 { $other } です。次のいずれかが必要です：{ $signal_names }

## src/iq/signals/galileo.rs

engine-e-iq-signals-galileo-line-no = 行 { $v1 }：';' がありません

engine-e-iq-signals-galileo-line-no-code-number-in = 行 { $v1 }：{ $label } にコード番号がありません

engine-e-iq-signals-galileo-code-appears-twice = コード { $number } が二回現れます

engine-e-iq-signals-galileo-codes-the-icd-defines = { $path }：コード { $n } 個、ICD の定義は { $CODES_PER_COMPONENT } 個です

## src/iq/signals/lunanet.rs

engine-iq-signals-lunanet-lunanet-afs-primary-tertiary = LunaNet AFS-Q プライマリー { $primary_prn } S{ $secondary } ターシャリー { $t }

engine-iq-signals-lunanet-lunanet-afs-primary-tertiary-omitted = LunaNet AFS-Q プライマリー { $primary_prn } S{ $secondary }（ターシャリーは省略）

## src/iq/signals/mod.rs

engine-e-iq-signals-non-hex-character = 十六進以外の文字 { $c }

engine-e-iq-signals-hex-symbols-cannot-hold-exactly = { $hex } 個の十六進シンボルでは、ちょうど { $len } チップを保持できません

engine-iq-signals-primary-only = { $name }（プライマリーのみ）

## src/iq/track/boc.rs

engine-e-iq-track-boc-boc-tracking-needs-an-early = BOC トラッキングには、E と L がメインピーク上にとどまるよう、(0, { $max }) チップの範囲の早期・後期の間隔が必要です（実際：{ $spacing_chips }）

engine-e-iq-track-boc-bump-jump-threshold-must-be = バンプジャンプのしきい値は 1 以上でなければなりません

## src/iq/track/channel.rs

engine-e-iq-track-channel-sample-rate-must-be-positive = サンプルレートは正でなければなりません

engine-e-iq-track-channel-coherent-periods-must-be-positive = coherent_periods は正でなければなりません

engine-e-iq-track-channel-cn0-windows-must-be-positive = cn0_windows は正でなければなりません

engine-e-iq-track-channel-coherent-periods-must-divide-the = coherent_periods { $coherent_periods } はビット長 { $ppb } を割り切らなければなりません

engine-e-iq-track-channel-at-most-extra-taps-are = サポートされる追加タップは最大 { $MAX_EXTRA_TAPS } 個です（実際：{ $extra_taps_chips }{ $v2 }）

engine-e-iq-track-channel-extra-tap-offsets-must-be = 追加タップのオフセットは有限で、±{ $MAX_TAP_OFFSET_CHIPS } チップの範囲内でなければなりません（実際：{ $t }）

engine-e-iq-track-channel-n0-window-needs-at-least = C/N0 ウィンドウには少なくとも 2 個のプロンプトが必要です

## src/iq/track/design.rs

engine-e-iq-track-design-carrier-pll-discriminator-expected-atan2 = carrier.pll_discriminator { $o }：atan2、costas-atan、costas-decision-directed のいずれかが必要です

engine-e-iq-track-design-carrier-fll-discriminator-expected-cross = carrier.fll_discriminator { $o }：cross-product、atan2、atan2-pilot のいずれかが必要です

engine-e-iq-track-design-carrier-fll-assist-expected-pull = carrier.fll_assist { $o }：pull-in または always が必要です

engine-e-iq-track-design-code-discriminator-expected-eml-power = code.discriminator { $o }：eml-power、dot-product、eml-envelope のいずれかが必要です

engine-iq-track-design-carrier-kind-expected-pll-fll = carrier.kind { $k }：pll、fll、fll-assisted-pll のいずれかが必要です

engine-iq-track-design-carrier-does-not-apply-to = carrier.{ $key } は carrier.kind = { $kind } には適用されません

engine-iq-track-design-carrier-bn-max-expected-number = carrier.bn_t_max { $v }：>= 0 の数値が必要です（0 はクランプを無効にします）

engine-e-iq-track-design-must-be-positive-number-got = { $k } は正の数でなければなりません（実際：{ $v }）

engine-e-iq-track-design-integration-coherent-periods-must-be = integration.coherent_periods は 1 以上でなければなりません

engine-e-iq-track-design-integration-spacing-chips-must-lie = integration.spacing_chips は (0, 2] の範囲でなければなりません（実際：{ $d }）

engine-e-iq-track-design-integration-extra-taps-chips-holds = integration.extra_taps_chips が保持できるオフセットは最大 { $MAX_EXTRA_TAPS } 個です（実際：{ $taps }）

engine-e-iq-track-design-integration-extra-taps-chips-offsets = integration.extra_taps_chips のオフセットは有限で、±{ $MAX_TAP_OFFSET_CHIPS } チップの範囲内でなければなりません（実際：{ $t }）

engine-e-iq-track-design-carrier-fll-on-pli-must = carrier.fll_on_pli（{ $on }）は carrier.fll_off_pli（{ $off }）より小さくなければならず、どちらも (-1, 1] の範囲内でなければなりません

engine-e-iq-track-design-carrier-fll-gate-dwell-must = carrier.fll_gate_dwell_s はゼロまたは正でなければなりません（実際：{ $t }）

engine-e-iq-track-design-carrier-fll-pull-in-max = carrier.fll_pull_in_max_s は正でなければなりません（実際：{ $t }）

engine-e-iq-track-design-carrier-pll-order-must-be = carrier.pll_order は 1、2、3 のいずれかでなければなりません（実際：{ $o }）

engine-e-iq-track-design-carrier-fll-order-must-be = carrier.fll_order は 1 または 2 でなければなりません（実際：{ $o }）

engine-e-iq-track-design-code-order-must-be-or = code.order は 1 または 2 でなければなりません（実際：{ $order }）

engine-e-iq-track-design-lock-pli-threshold-must-lie = lock.pli_threshold は [-1, 1] の範囲でなければなりません（実際：{ $pli }）

engine-e-iq-track-design-lock-cn0-windows-must-be = lock.cn0_windows は 1 以上でなければなりません

engine-e-iq-track-design-lock-cn0-window-periods-must = lock.cn0_window_periods は 2 以上でなければなりません

engine-e-iq-track-design-lock-reacq-max-interval-must = lock.reacq_max_interval_s（{ $reacq_max_interval_s }）は lock.reacq_interval_s（{ $reacq_interval_s }）を下回ってはなりません

engine-e-iq-track-design-lock-false-lock-margin-db = lock.false_lock_margin_db は有限でなければなりません

engine-e-iq-track-design-bit-sync-min-votes-must = bit_sync.min_votes は 1 以上でなければなりません

engine-e-iq-track-design-acquisition-coherent-periods-must-be = acquisition.coherent_periods は 1 以上でなければなりません（または "auto"）

engine-e-iq-track-design-acquisition-noncoherent-must-be-at = acquisition.noncoherent は 1 以上でなければなりません

engine-e-iq-track-design-acquisition-pfa-must-lie-in = acquisition.pfa は (0, 1) の範囲でなければなりません（実際：{ $pfa }）

engine-e-iq-track-design-design-overrides = 設計の上書き：{ $e }

engine-e-iq-track-design-design-overrides-may-not-set = 設計の上書きでは name や extends を設定できません

engine-e-iq-track-design-loop-design-file = ループ設計ファイル：{ $e }

engine-e-iq-track-design-loop-design-file-schema-is = ループ設計ファイル：スキーマ { $other } はサポートされていません。期待値：{ $SCHEMA }

engine-e-iq-track-design-loop-design-file-missing-schema = ループ設計ファイル：schema = { $SCHEMA } がありません

engine-e-iq-track-design-loop-design-file-no-design = ループ設計ファイル：[[design]] テーブルがありません

engine-e-iq-track-design-loop-design-file-design-number = ループ設計ファイル：[[design]] の { $v1 } 番目に name がありません

engine-e-iq-track-design-loop-design-file-design-name = ループ設計ファイル：設計名 { $name } は予約済みか空です

engine-e-iq-track-design-loop-design-file-design-is = ループ設計ファイル：設計 { $name } が二重に定義されています

engine-e-iq-track-design-no-design-named-the-file = { $n } という名前の設計はありません。ファイルが保持する設計：{ $value }

engine-e-iq-track-design-loop-design-file-design-extends = ループ設計ファイル：設計 { $name } が自分自身を extends しています（循環）

engine-e-iq-track-design-loop-design-file-design-extends-2 = ループ設計ファイル：設計 { $name } が不明な設計 { $parent } を extends しています

## src/iq/track/filter.rs

engine-e-iq-track-filter-phase-loop-needs-order-and = 位相ループには、次数 1..=3 と Bn > 0 が必要です（実際：{ $o }、{ $bn }）

engine-e-iq-track-filter-frequency-loop-needs-bn-got = 周波数ループには Bn > 0 が必要です（実際：{ $bn }）

engine-e-iq-track-filter-frequency-loop-order-must-be = 周波数ループの次数は 1 または 2 でなければなりません（実際：{ $o }）

engine-e-iq-track-filter-loop-filter-needs-phase-path = ループフィルタには、位相経路、周波数経路、またはその両方が必要です

## src/iq/track/mod.rs

engine-e-iq-track-early-late-spacing-must-lie = 早期・後期の間隔は (0, 2] チップの範囲でなければなりません（実際：{ $spacing_chips }）

engine-e-iq-track-dll-order-must-be-or = DLL の次数は 1 または 2 でなければなりません（実際：{ $dll_order }）

engine-e-iq-track-chip-rate-and-carrier-frequency = チップレートと搬送波周波数は正でなければなりません

## src/iq/track/sink.rs

engine-e-iq-track-sink-an-epoch-carries-extra-taps = エポックに追加タップが { $extra } 個ありますが、出力は { $n } 個で設定されています。一回の実行内のすべてのチャネルで、同じ extra_taps_chips を使用しなければなりません

engine-e-iq-track-sink-record-is-bytes-expected = レコードは { $b } バイトですが、{ $want } バイトが必要です

engine-e-iq-track-sink-unknown-lock-state-code = 不明なロック状態コード { $b }

engine-e-iq-track-sink-epoch-file-header = エポックファイルのヘッダー：{ $e }

engine-e-iq-track-sink-epoch-file-schema-expected = エポックファイルのスキーマ { $schema }。期待値：{ $EPOCH_SCHEMA }

engine-e-iq-track-sink-epoch-file-records-are-bytes = エポックファイルのレコードは { $record_bytes } バイトですが、このリーダーが期待するのは { $want } です（{ $BINARY_RECORD_BYTES } に、追加タップごとに { $BINARY_TAP_BYTES } を加えたもの）

engine-e-iq-track-sink-epoch-file-ends-inside-record = エポックファイルがレコードの途中で終わっています（{ $size } バイト中 { $got }）

engine-e-iq-track-sink-epoch-format-expected-csv-jsonl = エポック形式 { $o }：csv、jsonl、bin のいずれかが必要です

## src/jammertest/cli.rs

engine-e-jammertest-cli-is-not-number = { $name }：`{ $s }` は数値ではありません

engine-e-jammertest-cli-is-not-utf-text = { $path } は UTF-8 テキストではありません

engine-e-jammertest-cli-needs-catalog = --catalog が必要です

engine-e-jammertest-cli-needs-at-least-one-plan = --plan が少なくとも一つ必要です

engine-e-jammertest-cli-is-not-utf = { $cat } は UTF-8 ではありません

engine-e-jammertest-cli-is-not-utf-2 = { $p } は UTF-8 ではありません

engine-e-jammertest-cli-format-is-not-one-of = --format：`{ $s }` は ubx、rinex、android、nmea のいずれでもありません

engine-e-jammertest-cli-log-start-is-not-utc = --log-start `{ $t }` は UTC の ISO-8601 ではありません

engine-e-jammertest-cli-needs-log-start-or-log = --log-start、または --format を伴う --log が必要です

engine-e-jammertest-cli-log-needs-format = --log には --format が必要です

engine-e-jammertest-cli-the-log-does-not-state = ログに開始時刻が記載されていません：--log-start を使用してください

engine-e-jammertest-cli-the-log-states-its-start = ログの開始時刻は `{ $label }` と記載されています：--log-start を使用してください

engine-e-jammertest-cli-is-not-utf-3 = { $a } は UTF-8 ではありません

engine-e-jammertest-cli-cannot-write = { $o } に書き込めません：{ $e }

engine-jammertest-cli-events-written-to-non-rf = { $events } 件の { $SCHEDULED_TRUTH } イベントを { $o } に書き込みました（RF 以外のスロット { $skipped_non_rf } 件をスキップ、ログ範囲外 { $outside_log } 件、カタログにない id { $unknown_ids } 件）

engine-jammertest-cli-note-ids-not-in-the = 注意：カタログにない id：{ $unknown_ids }

engine-jammertest-cli-note-these-are-the-plan = 注意：これらは計画の予定スロットであり、実際の放射時刻の記録ではありません。

engine-jammertest-cli-test-name = { $v1 } { $v2 } { $v3 } { $v4 } { $v5 } { $v6 } { $v7 }  テスト名

## src/jammertest/cli.rs

engine-jammertest-cli-tests-evaluable-detected-within-tolerance = テスト { $tests } 件、評価可能 { $evaluable } 件：許容差内で検出 { $detected } 件、遅延 { $late } 件、見逃し { $missed } 件；遅延の中央値 { $fmt_opt }、回復までの時間の中央値 { $fmt_opt2 }

engine-jammertest-cli-false-alarms-outside-every-slot = すべてのスロット外の誤警報：{ $false_alarm_runs } 回の実行、クリーンなエポック { $clean_epochs } 件中 { $false_alarm_epochs } 件

engine-e-jammertest-cli-needs-session-path = セッションのパスが必要です

engine-e-jammertest-cli-needs-catalog-and-plan-or = --catalog と --plan、または --attack-log が必要です

engine-jammertest-cli-evidence-pack-written-to-signer = エビデンスパックを { $out } に書き込みました；署名者のフィンガープリント { $signer_fingerprint }

## src/jammertest/dataset.rs

engine-e-jammertest-dataset-no-folder-with-scenario-json = { $root } の下に、scenario.json と .ubx を含むフォルダーがありません

engine-e-jammertest-dataset-scenario = シナリオ：{ $e }

engine-e-jammertest-dataset-read = 読み込み：{ $e }

engine-e-jammertest-dataset-scenario-json-has-no-date = scenario.json に日付がありません

engine-e-jammertest-dataset-scenario-json-date-is-not = scenario.json の日付 `{ $date }` は日付ではありません

engine-e-jammertest-dataset-no-readable-epoch-in-mon = mon_rf.csv にも rinex.csv にも読み取れるエポックがありません

engine-e-jammertest-dataset-no-folder-with-scenario-json-2 = { $root } の下に、scenario.json を含むフォルダーがありません

engine-jammertest-dataset-recovered-of-median = { $f2 } 回復（{ $alarmed } 件中 { $recovered } 件）、中央値 { $f22 } s

## src/jammertest/mod.rs

engine-e-jammertest-the-log-states-its-start = ログの開始時刻は `{ $l }` と記載されていますが、UTC の ISO-8601 ではありません：開始時刻を明示してください

engine-e-jammertest-the-log-does-not-state = ログに開始時刻が記載されていません：明示してください

## src/jammertest/plan.rs

engine-e-jammertest-plan-catalogue-is-not-json = カタログが JSON ではありません：{ $e }

engine-e-jammertest-plan-catalogue-has-no-test-types = カタログに `test_types` 配列がありません

engine-e-jammertest-plan-test-type-has-no-type = テスト種別に `type_id` がありません

engine-e-jammertest-plan-test-group-has-no-group = テストグループに `group_id` がありません

engine-e-jammertest-plan-test-has-no-test-id = テストに `test_id` がありません

engine-e-jammertest-plan-catalogue-lists-no-tests = カタログにテストが一つもありません

engine-e-jammertest-plan-is-not-plan-time-like = `{ $text }` は 2025-09-15T14:00:00 のような計画時刻ではありません

engine-e-jammertest-plan-plan-is-not-json = 計画が JSON ではありません：{ $e }

engine-e-jammertest-plan-plan-has-no-locations-array = 計画に `locations` 配列がありません

engine-e-jammertest-plan-test-end-time-is-not = テスト { $id }：end_time が start_time より後ではありません

engine-e-jammertest-plan-the-plan-has-no-test = 計画に試験エリア { $l } がありません。ある試験エリア：{ $areas }

engine-e-jammertest-plan-the-plan-has-several-test = 計画には複数の試験エリア { $areas } があります。ログを記録したエリアを指定してください

engine-e-jammertest-plan-scenario-json-is-not-json = scenario.json が JSON ではありません：{ $e }

engine-e-jammertest-plan-no-attack-log-array = `attack_log` 配列がありません

engine-jammertest-plan-jammertest-2024-test-window = { $SCHEDULED_TRUTH }：Jammertest 2024 のテスト { $id } のウィンドウ { $n }（{ $attack }）

engine-e-jammertest-plan-the-attack-log-holds-no = attack_log に開始・終了ウィンドウがありません

## src/jammertest/score.rs

engine-e-jammertest-score-scheduled-events-but-the-run = 予定イベントは { $events } 件ですが、実行が採点したのは { $events2 } 件です：その実行自身のイベントを渡してください

engine-e-jammertest-score-recover-hold-must-be-positive = recover_hold_s は正で、guard_s は負でないものでなければなりません

## src/jamming.rs

engine-e-jamming-crpa-elements-enu-must-list = crpa.elements_enu_m には少なくとも一つの素子を列挙しなければなりません

engine-e-jamming-crpa-elements-enu-must-be = crpa.elements_enu_m は有限でなければなりません

engine-e-jamming-crpa-weighting-expected-null-steering = crpa.weighting { $weighting }："null-steering" または "mvdr" が必要です

engine-e-jamming-crpa-bandwidth-mhz-must-be = crpa.bandwidth_mhz は正でなければなりません（実際：{ $b }）

engine-e-jamming-terrain-the-section-needs-jammer = terrain：このセクションには [jammer] が必要です

## src/jamming_rx.rs

engine-e-jamming-rx-acquisition-acquisition-threshold-dbhz-must = acquisition.acquisition_threshold_dbhz（{ $acquisition_threshold_dbhz }）は有限で、tracking_threshold_dbhz（{ $tracking_threshold_dbhz }）以上でなければなりません

engine-e-jamming-rx-acquisition-reacquisition-delay-must-be = acquisition.reacquisition_delay_s は有限かつ非負でなければなりません（実際：{ $reacquisition_delay_s }）

engine-e-jamming-rx-front-end-adc-bits-must = front_end.adc_bits は 1 から 16 でなければなりません（実際：{ $adc_bits }）

engine-e-jamming-rx-front-end-bandwidth-mhz-must = front_end.bandwidth_mhz は正でなければなりません（実際：{ $b }）

## src/jamming_terrain.rs

engine-e-jamming-terrain-terrain-samples-per-side-must = terrain.samples_per_side は 2 以上でなければなりません（実際：{ $samples_per_side }）

engine-e-jamming-terrain-terrain-must-be-finite-got = terrain.{ $name } は有限でなければなりません（実際：{ $v }）

engine-e-jamming-terrain-terrain-must-be-positive-got = terrain.{ $name } は正でなければなりません（実際：{ $v }）

engine-e-jamming-terrain-terrain-dem-hgt = terrain.dem_hgt { $dem_hgt }：{ $e }

engine-e-jamming-terrain-terrain-profile-point-is-outside = terrain：プロファイル点 { $points }（{ $lat }、{ $lon }）が DEM タイルの外にあります

engine-e-jamming-terrain-terrain-profile-point-is-on = terrain：プロファイル点 { $points }（{ $lat }、{ $lon }）が DEM の欠損領域上にあります

## src/jd2.rs

engine-e-jd2-utc-calendar-date-out-of = UTC の暦日が範囲外です：{ $year }-{ $month }-{ $day } { $hour }:{ $minute }

engine-e-jd2-no-such-calendar-date = そのような暦日は存在しません：{ $year }-{ $month }-{ $day }

engine-e-jd2-utc-second-out-of-range = { $hour }:{ $minute } における UTC の秒 { $second } が範囲外です

## src/launch.rs

engine-e-launch-launch-site-at-the-pole = 極にある射場には定義された方位角がありません

engine-e-launch-inclination-unreachable-from-latitude-without = 軌道傾斜角 { $inclination_rad }° は、ドッグレッグなしでは緯度 { $lat_rad }° から到達できません（|lat| ≤ i ≤ 180−|lat| が必要です）

engine-e-launch-the-true-pole-site-speed = 真の極の地点速度には `epoch` と `eop_finals2000a`（実際の IERS finals2000A の本体）の両方が必要です

engine-e-launch-site-lon-deg-must-be = site_lon_deg は [-180, 360] の範囲でなければなりません

engine-e-launch-eop-finals2000a-contained-no-readable = eop_finals2000a に読み取れる IERS finals2000A の行がありません

engine-e-launch-epoch-mjd-is-outside-the = 元期 { $epoch }（MJD { $mjd_utc }）は、与えられた EOP の行の範囲外です（MJD { $mjd } から { $mjd2 }）

engine-e-launch-site-lat-deg-must-be = site_lat_deg は [-90, 90] の範囲でなければなりません

engine-e-launch-target-inclination-deg-must-be = target_inclination_deg は [0, 180] の範囲でなければなりません

engine-launch-launch-window-lat-az-asc = launch-window: 緯度 { $site_lat_deg }° -> i { $target_inclination_deg }°：方位角 { $asc }°（上昇）、v_circ { $v_orbit } m/s、地球自転ボーナス +{ $site_rotation_speed } m/s、日あたり { $opportunities } 回の機会 (MODELLED)

## src/leo_fusion/doppler.rs

engine-e-leo-fusion-doppler-every-range-rate-needs-positive = すべての距離変化率には、正で有限のシグマが必要です

engine-e-leo-fusion-doppler-measurements-cannot-resolve-doppler-unknowns = { $n_meas } 件の測定では、{ $n } 個のドップラー未知数を解けません

engine-e-leo-fusion-doppler-the-doppler-geometry-is-singular = ドップラー幾何が特異です

engine-e-leo-fusion-doppler-no-covariance = 共分散がありません

## src/leo_fusion/joint_pvt.rs

engine-e-leo-fusion-joint-pvt-every-pseudorange-needs-positive-finite = すべての疑似距離には、正で有限のシグマが必要です

engine-e-leo-fusion-joint-pvt-pseudoranges-cannot-resolve-unknowns-position = { $obs } 件の疑似距離では、{ $n } 個の未知数（3 位置 + { $n_clock } クロック）を解けません

engine-e-leo-fusion-joint-pvt-satellite-coincides-with-the-position = 衛星が位置推定値と一致しています

engine-e-leo-fusion-joint-pvt-the-geometry-is-singular = 幾何が特異です

engine-e-leo-fusion-joint-pvt-no-iteration-ran = 反復が実行されませんでした

engine-e-leo-fusion-joint-pvt-degenerate-final-geometry = 最終的な幾何が縮退しています

engine-e-leo-fusion-joint-pvt-the-dop-is-not-finite = DOP が有限ではありません

## src/leo_fusion/ntn.rs

engine-e-leo-fusion-ntn-must-be-positive = { $w } は正でなければなりません

engine-e-leo-fusion-ntn-sync-error-must-be-non = sync_error_m は非負で、実行は最大 5000 エポックでなければなりません

engine-e-leo-fusion-ntn-every-signal-needs-positive-bandwidth = すべての信号には正の帯域幅が必要です

engine-leo-fusion-ntn-5g-ntn-positioning-at-mhz = 5G NTN 測位 { $r } MHz、C/N0 { $r2 } から { $r3 } dB-Hz、衛星 { $n_satellites } 機（視界内 { $mean_in_view }）{ "\u000A" }

engine-leo-fusion-ntn-khz-crb-range-to-median = { "  " }{ $name }：{ $s } kHz、CRB 範囲 { $range_sigma_zenith_m } から { $range_sigma_mask_m } m；共分散に基づく 3D の中央値 { $s2 } m、RMS 誤差 { $s3 } m{ "\u000A" }

engine-leo-fusion-ntn-one-satellite-doppler-pass-samples = { "  " }一機の衛星によるドップラーパス：{ $duration_s } s で { $n_obs } サンプル、水平誤差 { $horizontal_error_m } m{ "\u000A" }

## src/leo_fusion/ppp.rs

engine-e-leo-fusion-ppp-ppp-needs-at-least-one = PPP には少なくとも一つのシステムが必要です

engine-e-leo-fusion-ppp-duration-and-step-must-be = 継続時間とステップは正で、エポックは最大 20000 でなければなりません

engine-e-leo-fusion-ppp-runs-must-be-to-200 = 実行回数は 1 から 200 でなければなりません

engine-e-leo-fusion-ppp-convergence-thresholds-must-be-positive = 収束のしきい値は正でなければなりません

engine-leo-fusion-ppp-ppp-convergence-to-horizontal-vertical = PPP の収束：水平 { $criterion_horizontal_m } m / 垂直 { $criterion_vertical_m } m、ケースあたり { $runs_per_case } 回の実行、GNSS 衛星 { $n_gnss } 機{ "\u000A" }

engine-leo-fusion-ppp-leo-median-min-converged-nees = { "  " }{ $name } LEO { $n_leo } 機  中央値 { $c } 分  収束 { $v4 }%  NEES 平均 { $nees_mean }{ "\u000A" }

engine-leo-fusion-ppp-median-horizontal-error-across-runs = { $runs_per_case } 回の実行にわたる水平誤差の中央値 · MODELLED

## src/leo_fusion/presets/mod.rs

engine-e-leo-fusion-presets-preset-carries-no-signal = プリセット { $id } に信号がありません

engine-e-leo-fusion-presets-preset-has-no-signal-it = プリセット { $id } に信号 { $n } がありません。ある信号：{ $value }

engine-e-leo-fusion-presets-unknown-leo-preset-known = 不明な LEO プリセット { $id } です。既知のもの：{ $all }

## src/leo_fusion/pvt_kind.rs

engine-e-leo-fusion-pvt-kind-duration-and-step-must-be = duration_s と step_s は正で、エポックは最大 20000 でなければなりません

engine-e-leo-fusion-pvt-kind-polar-steps-must-be-positive = polar のステップは正でなければなりません

engine-e-leo-fusion-pvt-kind-mode-must-be-doppler-joint = mode は doppler、joint、polar、timing のいずれかでなければなりません（実際：{ $m }）

engine-e-leo-fusion-pvt-kind-doppler-mode-needs-at-least = doppler モードには少なくとも一つの LEO システムが必要です

engine-e-leo-fusion-pvt-kind-timing-mode-needs-leo-system = timing モードには、コード測距を持つ LEO システムが必要です

engine-e-leo-fusion-pvt-kind-unknown-clock-class = 不明なクロッククラス { $c }

engine-leo-fusion-pvt-kind-leo-pvt-at-over = LEO PVT（{ $mode }）、位置 { $user_lat_deg }、{ $user_lon_deg }、{ $duration_s } s{ "\u000A" }

engine-leo-fusion-pvt-kind-sats-at-km-mhz = { "  " }{ $name } { $role } 衛星 { $n_satellites } 機、高度 { $mean_altitude_km } km、{ $sys } MHz{ $v6 }{ "\u000A" }

engine-leo-fusion-pvt-kind-doppler-fix-measurements-from-satellites = { "  " }ドップラー測位解：衛星 { $n_sats } 機からの測定 { $n_obs } 件、3D 誤差 { $error_3d_m } m（水平 { $horizontal_error_m } m）{ "\u000A" }

engine-leo-fusion-pvt-kind-window-sats-3d-error = { "    " }ウィンドウ { $window_s } s：衛星 { $n_sats } 機、3D 誤差 { $f } m{ "\u000A" }

engine-leo-fusion-pvt-kind-overhead-pass-max-doppler-hz = { "  " }{ $system } 頭上通過：最大ドップラー { $max_doppler_hz } Hz、変化率 { $max_doppler_rate_hz_s } Hz/s、ジャーク { $max_doppler_jerk_hz_s2 } Hz/s^2{ "\u000A" }

engine-leo-fusion-pvt-kind-leo-ranging-satellite-in-view = { "  " }エポックの { $v1 }% で LEO 測距衛星が視界内{ "\u000A" }

engine-leo-fusion-pvt-kind-availability-median-pdop-rms-3d = { "  " }{ $n } 可用性 { $availability }、PDOP の中央値 { $f }、RMS 3D 誤差 { $f2 } m{ "\u000A" }

engine-leo-fusion-pvt-kind-lat-vdop-gnss-leo-fused = { "  " }緯度 { $lat_deg }：VDOP GNSS { $f } LEO { $f2 } 統合 { $f3 }；視界内 { $mean_in_view }/{ $mean_in_view2 }{ "\u000A" }

engine-leo-fusion-pvt-kind-n0-db-rms-ns-95 = { "  " }{ $clock } C/N0 { $cn0_offset_db } dB：RMS { $row } ns、95% { $row2 } ns、最大 { $row3 } ns（視界内 { $fraction_in_view }）{ "\u000A" }

engine-leo-fusion-pvt-kind-leo-pvt-mode = LEO PVT — { $mode } モード

## src/leo_fusion/system.rs

engine-e-leo-fusion-system-system-role-must-be-gnss = システム { $name }：role は gnss または leo でなければなりません（実際：{ $r }）

engine-e-leo-fusion-system-system-clock-must-be-estimated = システム { $name }：clock は estimated または known でなければなりません（実際：{ $c }）

engine-e-leo-fusion-system-system-must-be-positive = システム { $name }：{ $what } は正でなければなりません

engine-e-leo-fusion-system-system-mask-deg-must-be = システム { $name }：mask_deg は [0, 90) の範囲でなければなりません

engine-e-leo-fusion-system-system-sigma-pr-must-be = システム { $name }：sigma_pr_m は正でなければなりません

engine-e-leo-fusion-system-give-at-least-one-system = [[system]] を少なくとも一つ指定してください

## src/leo_fusion/timing.rs

engine-e-leo-fusion-timing-the-epoch-spacing-must-be = エポック間隔は正でなければなりません

engine-e-leo-fusion-timing-no-epochs = エポックがありません

engine-e-leo-fusion-timing-no-satellite-was-ever-in = 視界に入った衛星が一度もありません：受信機は時刻を捕捉できませんでした

## src/leo_link/antenna.rs

engine-e-leo-link-antenna-polarisation-must-be-rhcp-lhcp = 偏波は rhcp、lhcp、linear のいずれかでなければなりません（実際：'{ $o }'）

## src/leo_link/geometry.rs

engine-e-leo-link-geometry-sgp4-error-code-at = t = { $t } s で SGP4 エラーコード { $code }

engine-e-leo-link-geometry-an-orbit-inclined-deg-never = 軌道傾斜角 { $inc } deg の軌道は、緯度 { $phi } deg の上空を通過しません

engine-e-leo-link-geometry-the-requested-maximum-elevation-is = 要求された最大仰角が、水平線の到達範囲を下回っています

## src/leo_link/itu.rs

engine-e-leo-link-itu-building-class-must-be-traditional = 建物クラスは traditional または thermally-efficient でなければなりません（実際：'{ $o }'）

## src/leo_navmsg/codec.rs

engine-e-leo-navmsg-codec-field-is-not-finite = フィールド { $name } が有限ではありません

engine-e-leo-navmsg-codec-field-is-outside-its-bit = フィールド { $name } = { $value } { $unit } が { $bits } ビットの範囲外です（|x| <= { $spec }）

engine-e-leo-navmsg-codec-message-truncated = メッセージが途中で切れています

engine-e-leo-navmsg-codec-field-list-exhausted = フィールドリストを使い果たしました

engine-e-leo-navmsg-codec-field-order-mismatch-vs = フィールドの順序が一致しません：{ $name } と { $name2 }

engine-e-leo-navmsg-codec-svid-must-be-255 = SVID は 1-255 でなければなりません

engine-e-leo-navmsg-codec-each-correction-polynomial-needs-coefficients = 各補正多項式には 1-8 個の係数が必要です

engine-e-leo-navmsg-codec-correction-time-scale-must-be = 補正の時間スケールは、1 s から 32768 s までの二のべき乗でなければなりません（実際：{ $tau_s }）

engine-e-leo-navmsg-codec-ecef-polynomial-needs-11-coefficients = ECEF 多項式には、軸ごとに同数の 1-11 個の係数が必要です

engine-e-leo-navmsg-codec-ecef-polynomial-degree-exceeds-10 = ECEF 多項式の次数 { $v1 } が 10 を超えています

engine-e-leo-navmsg-codec-unknown-model-id = 不明なモデル id { $m }

engine-e-leo-navmsg-codec-payload-exceeds-4095-bytes = ペイロードが 4095 バイトを超えています

engine-e-leo-navmsg-codec-frame-shorter-than-header-and = フレームがヘッダーと CRC より短いです

engine-e-leo-navmsg-codec-bad-preamble-0x = プリアンブル 0x{ $frame } が不正です

engine-e-leo-navmsg-codec-unsupported-version = サポートされていないバージョン { $version }

engine-e-leo-navmsg-codec-frame-length-does-not-match = フレーム長 { $frame } が、宣言されたペイロードの { $len } バイトと一致しません

engine-e-leo-navmsg-codec-crc-24q-mismatch-computed-0x = CRC-24Q の不一致：計算値 0x{ $crc }、フレームの値 0x{ $got }

## src/leo_navmsg/fit.rs

engine-e-leo-navmsg-fit-rac-degrees-must-each-be = rac_degrees はそれぞれ 7 以下でなければなりません（実際：{ $rac_degrees }）

engine-e-leo-navmsg-fit-poly-degree-must-be-10 = poly_degree は 1-10 でなければなりません（実際：{ $poly_degree }）

engine-e-leo-navmsg-fit-unknown-ephemeris-model-use-kepler16 = 不明なエフェメリスモデル '{ $other }' です。kepler16、kepler-rac、liu22、ecef-poly のいずれかを使用してください

engine-e-leo-navmsg-fit-fit-interval-must-be-at = フィット区間は 10 s 以上でなければなりません（実際：{ $len }）

engine-e-leo-navmsg-fit-fit-window-lies-outside-the = フィットウィンドウ [{ $t0 }, { $v1 }] s が真値の弧 [0, { $truth }] s の外にあります

engine-e-leo-navmsg-fit-ecef-polynomial-fit-is-singular = ECEF 多項式のフィットが特異です（次数に対してサンプルが少なすぎます）

engine-e-leo-navmsg-fit-clock-fit-is-singular = クロックのフィットが特異です

engine-e-leo-navmsg-fit-keplerian-fit-diverged = ケプラー要素のフィットが発散しました

## src/leo_navmsg/mod.rs

engine-leo-navmsg-unknown-preset-available = 不明なプリセット '{ $k }' です。利用可能：{ $keys }

engine-e-leo-navmsg-fit-interval-must-be-10 = fit_interval_s は 10-3600 s、update_period_s は (0, fit_interval_s] の範囲でなければなりません（実際：{ $fit_interval_s } と { $update_period_s }）

engine-e-leo-navmsg-fit-sample-and-eval-step = fit_sample_s と eval_step_s は 0.5-60 s でなければなりません

engine-e-leo-navmsg-carrier-hz-must-exceed-10 = carrier_hz は 10 MHz を超えなければなりません（実際：{ $carrier_hz }）

engine-e-leo-navmsg-svid-must-be-255 = svid は 1-255 でなければなりません

engine-e-leo-navmsg-band-must-be-15-and = band は 0-15、health は 0-3 でなければなりません

engine-e-leo-navmsg-unknown-csv-schema = 不明な csv_schema '{ $csv_schema }'

engine-e-leo-navmsg-analysis-must-name-at-least = analysis には少なくとも一つの解析を指定しなければなりません

engine-e-leo-navmsg-unknown-analysis-use = 不明な analysis '{ $a }' です。{ $analyses } を使用してください

engine-e-leo-navmsg-kind-must-be-leo-navmsg = kind は leo-navmsg でなければなりません（実際：{ $k }）

engine-e-leo-navmsg-mask-deg-must-be-in = mask_deg は [0, 60) の範囲でなければなりません（実際：{ $mask }）

engine-leo-navmsg-leo-navigation-message-km-deg =
    LEO 航法メッセージ — { $res } km、{ $res2 } deg、重力次数 { $gravity_degree }、モデル { $res3 }
    { "  " }SISRE の重み：w_R { $w_r }、w_AC^2 1/{ $v6 }（マスク { $mask } deg）{ "\u000A" }

engine-e-leo-navmsg-trade-span-must-be-60 = trade.span_s は 60-86400 s でなければなりません

engine-e-leo-navmsg-trade-fit-intervals-must-be = trade.fit_intervals_s は空でなく、各要素が 10-3600 s でなければなりません

engine-leo-navmsg-fit-interval-trade-over-usage = { "  " }{ $span } s にわたるフィット区間のトレードオフ（使用期間 = フィット区間）：{ "\u000A" }

engine-leo-navmsg-sisre-orbit-rms-max-with = { "    " }{ $model } { $fit_interval_s } s  SISRE 軌道 RMS { $sisre_orb_rms_m } m  最大 { $sisre_orb_max_m } m  クロック込み RMS { $sisre_rms_m } m{ "\u000A" }

engine-e-leo-navmsg-comparison-fit-intervals-must-be = comparison.fit_intervals_s は空でなく、各要素が 10-3600 s でなければなりません

engine-e-leo-navmsg-comparison-span-must-be-60 = comparison.span_s は 60-86400 s でなければなりません

engine-leo-navmsg-params-sisre-orbit-rms-with = { "    " }{ $kind } { $l } s  { $m0 } パラメーター  SISRE 軌道 RMS { $sisre_orb_rms_m } m  クロック込み { $sisre_rms_m } m{ "\u000A" }

engine-e-leo-navmsg-no-pass-above-deg-for = { $lat }、{ $lon } のユーザーに対して、{ $search } s 以内に仰角 { $mask } deg を超える通過がありません。midpass.search_s を広げるか、ユーザーを移動してください

engine-leo-navmsg-mid-pass-update-pass-max = { "  " }通過中の更新：通過 { $p0 }-{ $p1 } s（最大仰角 { $pmax } deg）、切り替え { $switches } 回、ユーザー距離の最大ジャンプ { $max_jump } m（最悪ケースの幾何 { $max_worst } m）、しきい値 { $threshold } m：{ $v8 }{ "\u000A" }

engine-leo-navmsg-encode-decode-model-frame-bytes =
    { "  " }エンコード・デコード：{ $m } モデル、フレーム { $frame } バイト（ペイロード { $payload_bits } ビット、エフェメリス+クロック { $eph_bits } ビット）、CRC-24Q 0x{ $hex }
    { "    " }量子化：位置の最大変化 { $v6 } mm、クロック { $v7 } mm；SISRE 厳密 { $acc_exact } m、量子化後 { $acc_q } m
    { "    " }破損フレームの拒否：{ $corrupted_rejected }；RINEX 往復 { $rin_dp } m；CSV 往復 { $csv_dp }{ "\u000A" }

engine-e-leo-navmsg-comparison-liu-arcs-must-be = comparison.liu_arcs は 1-20 でなければなりません

engine-leo-navmsg-km-kshana-published-ratio = { "    " }{ $name } { $alt } km  Kshana { $sisre_orb_rms_m } m  公表値 { $published } m  比 { $st }{ "\u000A" }

engine-leo-navmsg-the-16-parameter-keplerian-set = 16 パラメーターのケプラー要素セットは、{ $lo } s の { $a } m から { $hi } s の { $b } m へと悪化します。周回あたり二回の高調波を持つ一つのケプラー要素セットでは、LEO の弧における高周波の重力項と抗力に数分を超えて追従できず、その最小二乗残差はウィンドウ全体で振動します。ケプラー要素セットが張る次数より高次の、along/cross/radial の多項式が残りを吸収し、{ $hi } s で { $c } m を与えます。

engine-leo-navmsg-the-16-parameter-keplerian-set-2 = 16 パラメーターのケプラー要素セットは、{ $lo } s の { $a } m から { $hi } s の { $b } m へと推移します。

engine-leo-navmsg-km-deg-gravity-degree-representation = { $res } km、{ $res2 } deg、重力次数 { $gravity_degree } · 真値に対する表現誤差 · MODELLED

## src/leo_navmsg/tests.rs

engine-leo-navmsg-tests-is-the-host-library = { $v1 }：`{ $call }` はホストライブラリのものです

engine-leo-navmsg-tests-rand-distr-samplers-call-the = { $v1 }：`rand_distr` のサンプラーはまれな分岐でホストの `exp` と `ln` を呼び出します。`portable_math::standard_normal` を使用してください

engine-leo-navmsg-tests-acceleration-is-the-host-library = { $v1 }：`.acceleration(` はホストライブラリの重力場です。`.acceleration_portable(` を使用してください

engine-leo-navmsg-tests-has-not-been-reviewed = { $v1 }：`{ $path }` はレビューされていません

## src/leo_navmsg/text.rs

engine-e-leo-navmsg-text-no-end-of-header-line = END OF HEADER 行がありません

engine-e-leo-navmsg-text-expected-eph-record-header-got = '> EPH' レコードヘッダーが必要ですが、{ $head } でした

engine-e-leo-navmsg-text-bad-satellite-id = 衛星 id { $parts } が不正です

engine-e-leo-navmsg-text-missing-epoch-line = エポック行がありません

engine-e-leo-navmsg-text-bad-epoch-line = エポック行 { $ep } が不正です

engine-e-leo-navmsg-text-bad-epoch-field-in = { $ep } のエポックフィールドが不正です

engine-e-leo-navmsg-text-epoch-line-needs-three-clock = エポック行には三つのクロック項が必要です：{ $ep }

engine-e-leo-navmsg-text-record-truncated = レコードが途中で切れています

engine-e-leo-navmsg-text-unknown-record-type = 不明なレコードタイプ { $other }

engine-e-leo-navmsg-text-the-csv-table-carries-kepler16 = CSV テーブルが扱うのは kepler16 と kepler-rac のメッセージですが、{ $m } でした

engine-e-leo-navmsg-text-empty-csv = CSV が空です

engine-e-leo-navmsg-text-row-has-cells-header = 行のセル数は { $cells } で、ヘッダーは { $header } です

engine-e-leo-navmsg-text-bad-number-in-column = 列 { $k } の数値 { $c } が不正です

engine-e-leo-navmsg-text-csv-row-lacks = CSV の行に { $k } がありません

## src/leo_navmsg/truth.rs

engine-e-leo-navmsg-truth-orbit-altitude-must-be-between = 軌道高度は 100 km から 3000 km の間でなければなりません（実際：{ $cfg } km）

engine-e-leo-navmsg-truth-eccentricity-must-be-in-for = LEO のフィットでは離心率は [0, 0.1) の範囲でなければなりません（実際：{ $eccentricity }）

engine-e-leo-navmsg-truth-integration-step-must-be-in = 積分ステップは (0, 30] s の範囲でなければなりません（実際：{ $step_s }）

engine-e-leo-navmsg-truth-duration-must-be-positive-with = 継続時間は正で、ステップは最大 200000 でなければなりません（実際：{ $duration_s } s）

engine-e-leo-navmsg-truth-gravity-degree-must-be-zonal = gravity_degree は 0、2-6（帯球調和）または 7-{ $v1 }（EGM2008）でなければなりません（実際：{ $gravity_degree }）

engine-e-leo-navmsg-truth-truth-propagation-diverged = 真値の伝搬が発散しました

engine-e-leo-navmsg-truth-truth-orbit-decayed-below-80 = 真値の軌道が 80 km 未満まで減衰しました

engine-e-leo-navmsg-truth-node-spacing-must-be-in = ノード間隔は (0, 60] s の範囲でなければなりません（実際：{ $step_s }）

engine-e-leo-navmsg-truth-tabulated-truth-orbit-needs-at = 表形式の真値軌道には少なくとも二つの状態が必要です（実際：{ $states }）

engine-e-leo-navmsg-truth-state-is-not-finite = 状態 { $k } が有限ではありません

engine-e-leo-navmsg-truth-clock-adev-1s-must-be = クロックの adev_1s は [0, 1e-6) の範囲でなければなりません（実際：{ $adev_1s }）

engine-e-leo-navmsg-truth-measured-clock-is-built-with = 実測クロックは TruthClock::from_samples で構築します

engine-e-leo-navmsg-truth-steered-clock-needs-sigma-in = ステアリングされたクロックには、[0, 1e-3) の範囲の sigma_s と tau_s > 0 が必要です（実際：{ $sigma_s }、{ $tau_s }）

engine-e-leo-navmsg-truth-measured-clock-needs-positive-step = 実測クロックには、正のステップと少なくとも二つのサンプルが必要です

engine-e-leo-navmsg-truth-measured-clock-sample-is-not = 実測クロックのサンプルが有限ではありません

## src/leo_pass.rs

engine-e-leo-pass-epoch-is-not-yyyy-mm = 元期 '{ $s }' は YYYY-MM-DDTHH:MM:SS の形式ではありません

engine-leo-pass-epoch-is-not-yyyy-mm = 元期 '{ $s }' は YYYY-MM-DDTHH:MM:SS の形式ではありません

engine-e-leo-pass-epoch-has-bad-seconds-field = 元期 '{ $s }' の秒フィールドが不正です

engine-e-leo-pass-epoch-is-out-of-range = 元期 '{ $s }' が範囲外です

engine-e-leo-pass-band-unknown-signal-design-public = バンド '{ $name }'：不明な信号設計 '{ $n }' です。公開されている設計：{ $v2 }

engine-e-leo-pass-band-is-not-in-the = バンド '{ $name }' はシステムのプリセットにありません：frequency_mhz と eirp_dbw を指定してください

engine-e-leo-pass-band-needs-eirp-dbw = バンド '{ $name }' には eirp_dbw が必要です

engine-e-leo-pass-pattern-must-be-isoflux-gaussian = pattern は isoflux、gaussian、flat のいずれかでなければなりません（実際：'{ $o }'）

engine-e-leo-pass-band-frequency-out-of-range = バンド '{ $name }' の周波数が範囲外です

engine-leo-pass-overridden-in-the-scenario = { $source }（シナリオで上書き）

engine-e-leo-pass-system-has-no-band = システム '{ $id }' にバンド '{ $n }' はありません

engine-e-leo-pass-leo-satellite-needs-at-least = LEO 衛星には少なくとも一つのバンドが必要です

engine-e-leo-pass-at-most-12-bands-per = 衛星あたりのバンドは最大 12 個です

engine-leo-pass-unknown-system-presets-in-this = 不明なシステム '{ $n }' です。このビルドのプリセット：{ $ids }

engine-e-leo-pass-no-sun-synchronous-orbit-at = { $v1 } km には太陽同期軌道がありません

engine-e-leo-pass-duration-at-most-86400-and = duration_s（最大 86400）と step_s は正で、エポックは最大 20000 でなければなりません（実際：{ $duration } と { $step }）

engine-leo-pass-leo-satellite-km-deg = { $system } LEO 衛星、{ $s } km、{ $inclination_deg } deg（{ $orbit_source }）

engine-leo-pass-the-scenario-epoch-read-as = シナリオの `epoch` { $epoch }（UTC として解釈）

engine-leo-pass-the-kind-default-epoch-utc = kind の既定の元期 { $epoch } UTC（シナリオでは指定なし）

engine-e-leo-pass-user-environment-must-be-ground = user.environment は ground、maritime、air、indoor のいずれかでなければなりません（実際：'{ $o }'）

engine-e-leo-pass-user-lat-deg-must-be = user.lat_deg は +/-90 の範囲内でなければなりません

## src/leo_pass.rs

engine-e-leo-pass-user-speed-must-be-to = ユーザー速度は 0 から 3000 m/s、高度は -500 から 100000 m の範囲でなければなりません

engine-e-leo-pass-user-antenna-must-be-patch = user.antenna には patch、hemispherical、isotropic のいずれかを指定してください。指定値：'{ $o }'

engine-e-leo-pass-user-building-probability-must-be = user.building_probability は (0, 1) の範囲でなければなりません

engine-e-leo-pass-ionosphere-model-must-be-klobuchar = ionosphere.model には klobuchar、vtec、none のいずれかを指定してください。指定値：'{ $o }'

engine-e-leo-pass-direction-must-be-ascending-or = direction には ascending または descending を指定してください。指定値：'{ $o }'

engine-e-leo-pass-satellite-bad-eccentricity-or-perigee = 衛星 { $id }：離心率または近地点が不正です

engine-e-leo-pass-satellite-tle-needs-tle-line1 = 衛星 { $id }：tle には tle_line1 と tle_line2 が必要です

engine-e-leo-pass-orbit-must-be-pass-elements = orbit には pass、elements、tle のいずれかを指定してください。指定値：'{ $o }'

engine-e-leo-pass-leo-constellation-needs-system-or = leo_constellation にはシステムまたは設計の指定が必要です

engine-e-leo-pass-no-sun-synchronous-inclination = 太陽同期となる軌道傾斜角がありません

engine-e-leo-pass-leo-constellation-at-most-5000 = leo_constellation：衛星は最大5000機までです

engine-e-leo-pass-no-leo-satellite-rises-above = 時間窓内にマスクを上回って上昇するLEO衛星がありません

engine-e-leo-pass-spoofer-window-must-be-in = spoofer.window_s は (0, 3600] の範囲でなければなりません

engine-e-leo-pass-spoofer-bands-is-not-band = spoofer.bands：'{ $b }' はどのLEO衛星のバンドでもありません（{ $names }）

engine-e-leo-pass-no-gnss-signal-for-constellation = 衛星コンステレーション '{ $cons }' に GNSS 信号 '{ $bname }' はありません

engine-e-leo-pass-empty-gnss-constellation = GNSS 衛星コンステレーションが空です

engine-e-leo-pass-iono-free-pairs-are-not = iono_free_pairs：'{ $a }'/'{ $b }' は { $id } の異なる二つのバンドではありません

engine-e-leo-pass-iot-powers-and-battery-must = IoT の電力とバッテリーは正の値でなければなりません

engine-e-leo-pass-iot-cn0-from-must-be = iot.cn0_from には median または peak を指定してください。指定値：'{ $o }'

engine-leo-pass-detection-threshold-db-after-integration = 積分後の検出しきい値：{ $detection_snr_db } dB

engine-leo-pass-coherent-integration-at-most-ms = コヒーレント積分は最大 { $rx } ms（ドップラー変化率による上限）

engine-leo-pass-serial-search-with-correlators = 相関器 { $correlators } 個によるシリアル探索

engine-leo-pass-hot-start-doppler-known-to = ホットスタート：ドップラーは +/-{ $aided } Hz まで既知、エフェメリス（軌道暦）は有効

engine-leo-pass-leo-pass-link-budget-user = LEOパスのリンクバジェット：{ $environment }ユーザー（{ $lat_deg }, { $lon_deg }）、LEO衛星 { $satellites } 機、{ $duration_s } s の時間窓{ "\u000A" }

engine-leo-pass-km-max-elevation-deg-at = { "  " }{ $id } [{ $system } { $source_kind }]：{ $sat } km、最大仰角 { $max_elevation_deg } deg（{ $tca_s } s 時点）、マスク上 { $duration_above_mask_s } s{ "\u000A" }

engine-leo-pass-mhz-n0-peak-median-doppler = { "    " }{ $name } { $b } MHz：C/N0 ピーク { $opt }、中央値 { $opt2 }；|Doppler| 最大 { $opt3 }；電離圏 { $b2 }{ "\u000A" }

engine-leo-pass-gnss-in-view-n0-to = { "  " }GNSS { $constellation } { $band }：可視 { $satellites_in_view }、C/N0 { $opt } から { $opt2 }（中央値 { $opt3 }）{ "\u000A" }

engine-leo-pass-leo-peak-db-hz-is = { "  " }LEO { $leo_band } ピーク { $leo_peak_cn0_dbhz } dB-Hz は GNSS 中央値を { $leo_peak_above_gnss_median_db } dB 上回る；最強の GNSS 搬送波を上回る時間 { $leo_seconds_above_gnss_max } s{ "\u000A" }

engine-leo-pass-iot-cold-ttff-mj-hot = { "  " }IoT { $signal }：コールド TTFF { $ttff_s } s（{ $energy_per_fix_mj } mJ）、ホット { $ttff_s2 } s（{ $energy_per_fix_mj2 } mJ）{ "\u000A" }

engine-leo-pass-spoofer-from-jump-push-doppler = { "  " }{ $onset_s } s からのスプーフィング（ジャンプ { $offset_m } m、押し出し { $push_rate_m_s } m/s）：ドップラー検定 GNSS { $t }、LEO { $t2 }、融合 { $t3 }；バンド間 { $t4 }{ "\u000A" }

engine-leo-pass-user-leo-peak-db-hz = { $environment }ユーザー · LEO ピーク { $leo_peak_cn0_dbhz } dB-Hz、GNSS 中央値を { $leo_peak_above_gnss_median_db } dB 上回る · MODELLED

engine-leo-pass-user-modelled = { $environment }ユーザー · MODELLED

engine-leo-pass-doppler-of-each-leo-satellite = 各LEO衛星の最初のバンドのドップラー（フルスケール ±{ $v1 } kHz）

## src/leo_pnt_chain.rs

engine-e-leo-pnt-chain-invalid-table = 無効な [{ $what }] テーブル：{ $e }

engine-e-leo-pnt-chain-signal-design-is-neither-in = signal_design '{ $signal_design }' は [signal] にも公開設計にもありません（{ $v2 }）

engine-e-leo-pnt-chain-signal-design-has-no-code = signal_design '{ $name }' にはコード追跡成分がないため、疑似距離が得られません

engine-e-leo-pnt-chain-kind-must-be-leo-pnt = kind は leo-pnt-chain でなければなりません。指定値：{ $k }

engine-e-leo-pnt-chain-the-tracked-component-has-no = 追跡成分にチップレートがありません

engine-e-leo-pnt-chain-no-band-of-pass-names = [pass] のどのバンドも signal = "{ $name }" を指定していません。チェーンには設計を担うバンドが一つ必要です

engine-e-leo-pnt-chain-the-pass-gives-no-code = このパスではコードジッタが得られません

engine-e-leo-pnt-chain-od-sisre-must-be-in = od_sisre_m は [0, 100] m の範囲でなければなりません。指定値：{ $od }

engine-e-leo-pnt-chain-fusion-must-run-mode-joint = { "[" }fusion] は mode = "joint" で実行する必要があります。指定値：{ $mode }

engine-leo-pnt-chain-tracked-n0-at-the-deg = 仰角 { $mask } deg マスクでの追跡 C/N0（sin 仰角による直線近似）

engine-e-leo-pnt-chain-fusion-has-no-leo-system = { "[" }fusion] にチェーンの値を受け取るLEOシステムがありません

engine-e-leo-pnt-chain-fusion-produced-no-joint-block = { "[" }fusion] は joint ブロックを生成しませんでした

engine-leo-pnt-chain-leo-pnt-chain = LEO-PNT チェーン：{ $name }

engine-leo-pnt-chain-signal-tracked-at-mchip-n0 =
    { $name }
    { "  " }信号 { $name2 }（{ $design }）、追跡 { $design2 }（{ $v4 } Mchip/s）、C/N0 オフセット { $offset } dB{ "\u000A" }

engine-leo-pnt-chain-pass-km-tracked-n0-peak = { "  " }パス { $id } { $sat } km：追跡 C/N0 ピーク { $peak_tracked_cn0_dbhz } dB-Hz、コードジッタ中央値 { $jitter_median } m；C/N0 直線 { $a } + { $b } sin(el) dB-Hz{ "\u000A" }

engine-leo-pnt-chain-message-fit-update-representation-sisre = { "  " }メッセージ { $res }、{ $fit_interval_s } s フィット / { $update_period_s } s 更新：表現 SISRE { $stats } mm RMS（軌道 { $stats2 } mm）、{ $od } m の軌道決定により { $sisre } m を引き継ぎ{ "\u000A" }

engine-leo-pnt-chain-pdop-rms-3d = PDOP { $f } RMS 3D { $f2 }

engine-leo-pnt-chain-fused-fix-gnss-only-gnss = { "  " }融合測位解：GNSS のみ { $f3 } -> GNSS + LEO { $f32 }{ "\u000A" }

engine-leo-pnt-chain-ppp-convergence = { "  " }PPP 収束：{ $cells }{ "\u000A" }

engine-leo-pnt-chain-values-handed-between-stages-modelled = { "  " }{ $doc } の値が段階間で引き継がれます。MODELLED。

engine-leo-pnt-chain-code-tracking-jitter-the-ranging = コード追跡ジッタ（測距誤差、m、0 から { $jmax }）

engine-leo-pnt-chain-sisre-gnss-only-rms-3d = SISRE { $f } · GNSS のみ RMS 3D { $f2 } · GNSS + LEO RMS 3D { $f3 }

## src/leo_signal.rs

engine-e-leo-signal-modulation-the-width-must-be = 変調 { $label }：幅は正の値でなければなりません

engine-e-leo-signal-unknown-signal-preset-the-library = 不明な信号プリセット { $name }：ライブラリにあるのは { $preset_names } です

engine-e-leo-signal-preset-invalid-preset-file = プリセット { $name }：プリセットファイルが無効です：{ $e }

engine-e-leo-signal-preset-file-names-itself = プリセットファイル { $name } が自身の名前を { $name2 } としています

engine-e-leo-signal-centre-mhz-must-be-positive = { $name }：centre_mhz は正の値でなければなりません

engine-e-leo-signal-tx-bandwidth-mhz-must-be = { $name }：tx_bandwidth_mhz は正の値でなければなりません

engine-e-leo-signal-signal-needs-at-least-one = { $name }：信号には少なくとも一つの成分が必要です

engine-e-leo-signal-component-power-fraction-must-be = { $name }：成分 { $v1 } の power_fraction は正の値でなければなりません

engine-e-leo-signal-component-has-fdma-shares-but = { $name }：成分 { $v1 } に fdma_shares がありますが fdma_offsets_mhz がありません

engine-e-leo-signal-component-fdma-shares-must-be = { $name }：成分 { $v1 } の fdma_shares は正の値で、合計が一でなければなりません

engine-e-leo-signal-component-needs-one-fdma-share = { $name }：成分 { $v1 } にはオフセットごとに一つの fdma_share が必要です

engine-e-leo-signal-data-rate-sps-must-be = { $name }：data_rate_sps は正の値でなければなりません

engine-e-leo-signal-code-length-chips-must-be = { $name }：code_length_chips は正の値でなければなりません

engine-e-leo-signal-component-power-fractions-sum-to = { $name }：成分の電力比の合計が { $total } であり、1 ではありません

engine-e-leo-signal-orbit-altitude-km-must-be = { $name }：orbit_altitude_km は正の値でなければなりません

engine-e-leo-signal-flat-ofdm-like-component-cannot = { $name }：フラット（OFDM 型）の成分はスペクトルモデルに配置できません

engine-e-leo-signal-the-tracked-component-sits-on = { $name }：追跡成分は FDMA サブキャリア上にあります。スペクトルモデルが追跡するのはバンド中心の成分です

engine-e-leo-signal-signal-is-given-twice = 信号 { $w } が二回指定されています

engine-e-leo-signal-signals-is-more-than-the = 信号 { $out } 件は許容数の24を超えています

engine-e-leo-signal-receiver-loop-bandwidth-hz-integration = receiver：loop_bandwidth_hz x integration_time_s は 1 未満でなければなりません

engine-e-leo-signal-receiver-give-to-40-cn0 = receiver：cn0_dbhz の値を 1 から 40 個指定してください

engine-e-leo-signal-trade-slant-range-km-and = trade：slant_range_km > 0 かつ slant_tec_tecu ≥ 0 でなければなりません

engine-e-leo-signal-psd-points-must-be-between = psd_points は 21 から 2001 の間でなければなりません

engine-e-leo-signal-receiver-early-late-use-coherent = receiver.early_late { $o }："coherent" または "non-coherent" を指定してください

engine-e-leo-signal-the-system-noise-temperature-must = システム雑音温度は正の値でなければなりません

engine-e-leo-signal-compatibility-unknown-gnss-signal-known = compatibility：不明な GNSS 信号 { $n }（既知：{ $gnss_victim_names }）

engine-e-leo-signal-trade-reference-signal-is-not = trade.reference_signal { $n } はシナリオの信号ではありません

engine-e-leo-signal-shape-check-signal-is-not = 形状チェック：信号 { $signal } はシナリオにありません

engine-leo-signal-scenario-leo-signal-signals-noise = シナリオ leo-signal | 信号 { $runs } 件 | 雑音フロア { $n0_db } dBW/Hz{ $v3 }{ $v4 }

engine-leo-signal-left-band-limited-psd-of = 左：各設計の帯域制限 PSD（送信帯域全体でのピークからの dB 低下）；右：チップ間隔 { $reference_spacing_chips } における全 C/N0 に対するコードジッタ

## src/linkbudget.rs

engine-e-linkbudget-unknown-band-expected-ka = 不明なバンド '{ $other }'（s|x|ka のいずれかを指定してください）

engine-e-linkbudget-range-km-must-be-finite = range_km は有限の正の値でなければなりません

engine-e-linkbudget-data-rate-bps-must-be = data_rate_bps は有限の正の値でなければなりません

engine-e-linkbudget-other-losses-db-must-be = other_losses_db は有限で 0 以上でなければなりません

engine-e-linkbudget-tsys-must-be-finite-and = tsys_k を指定する場合は有限の正の値でなければなりません

engine-linkbudget-link-budget-band-km-bit = リンクバジェット：{ $value } バンド、{ $range_km } km、{ $data_rate_bps } bit/s -> FSPL { $fsl_db } dB、Eb/N0 { $eb_n0_db } dB、マージン { $margin_db } dB（{ $v7 }）

## src/live_io.rs

engine-e-live-io-cannot-listen-on = { $addr } で待ち受けできません：{ $e }

engine-live-io-kshana-live-listening-on-tcp = kshana live：tcp { $addr } で待ち受け中

engine-live-io-kshana-live-tcp-client-connected = kshana live：tcp クライアントが接続しました

engine-live-io-kshana-live-warning-is-not = kshana live：警告：{ $addr } はループバックアドレスではありません。到達できる相手は誰でもストリームを読み取れます

engine-e-live-io-cannot-open = { $spec } を開けません：{ $e }

engine-live-io-kshana-live-dropped-tcp-client = kshana live：処理が追いつかなかった tcp クライアントを切断しました

engine-e-live-io-cannot-open-2 = { $path } を開けません：{ $e }

engine-live-io-kshana-live-warning-is-not-2 = kshana live：警告：{ $addr } はループバックアドレスではありません。到達できる相手は誰でもこの層にストリームを送信できます

engine-e-live-io-cannot-bind-udp = udp { $addr } にバインドできません：{ $e }

engine-live-io-kshana-live-listening-on-udp = kshana live：udp { $addr } で待ち受け中

engine-e-live-io-cannot-connect-to = { $addr } に接続できません：{ $e }

engine-live-io-kshana-live-connected-to-tcp = kshana live：tcp { $addr } に接続しました

engine-live-io-kshana-live-reading-serial-at = kshana live：シリアル { $path } を { $baud } ボーで読み取り中（読み取り専用）

engine-live-io-the-was-closed-by-the = { $v1 } が相手側で閉じられました（この層は再接続しません。再起動するスーパーバイザーの下で実行してください）

engine-e-live-io-baud-use-1200-2400-4800 = --baud { $baud }：1200、2400、4800、9600、19200、38400、57600、115200、230400 のいずれかを指定してください

engine-e-live-io-is-not-serial-device-tcgetattr = { $path } はシリアルデバイスではありません（tcgetattr が失敗しました）

engine-e-live-io-cannot-set-baud = { $baud } ボーを設定できません

engine-e-live-io-cannot-set-the-line-mode = { $path } の回線モードを設定できません

engine-e-live-io-serial-is-supported-on-unix = --serial は Unix でのみ対応しています。--file、--tcp、--stdin を使用してください

engine-live-io-unknown-option = 不明なオプション { $s }

engine-live-io-cannot-read = { $session } を読み取れません：{ $e }

engine-live-io-kshana-live-vessel-platform-calibrating = kshana live：船舶プラットフォーム、{ $calibration_s } s 間キャリブレーション中；ゲート { $v2 }。助言用ソフトウェアであり、型式承認を受けた航法装置ではありません。運用者に責任があります。

engine-live-io-write-failed = 書き込みに失敗しました：{ $e }

engine-live-io-kshana-live-dropped-udp-datagram = kshana live：エンジンが取り込めなかった udp データグラム { $n } 件を破棄しました（累計 { $udp_dropped } 件）

## src/lunar_afs/codes.rs

engine-e-lunar-afs-codes-afs-prn-is-outside = AFS PRN { $prn } は 1..={ $MAX_PRN } の範囲外です

engine-e-lunar-afs-codes-insertion-index-outside-10223 = 挿入インデックス { $p } が 1..=10223 の範囲外です

engine-e-lunar-afs-codes-annex-files-hold-and-codes = Annex 3 のファイルに含まれるコードは { $gold } 件と { $ter } 件で、期待値は 210 です

engine-e-lunar-afs-codes-annex-afs-prn-is-not = Annex 3 の AFS-I PRN { $v1 } は g1、g2 のゴールドコードではありません（LSIS Figure C-1）

engine-e-lunar-afs-codes-secondary-code-does-not-exist = 副符号 S{ $id } は存在しません（S0 から S3）

engine-e-lunar-afs-codes-lsis-v1-table-11-assigns = LSIS V1.0 Table 11 がコードを割り当てるのはノード識別子 1 から 12 のみで、{ $node_id } は対象外です

## src/lunar_afs/frame.rs

engine-e-lunar-afs-frame-fid-does-not-fit-two = FID { $fid } は二ビット（0..3）に収まりません

engine-e-lunar-afs-frame-toi-outside-99-lsis-410 = TOI { $toi } は 0..99 の範囲外です（LSIS-410）

engine-e-lunar-afs-frame-subframe-symbols-expected = サブフレーム1のシンボルは { $SB1_SYMBOLS } 個が必要です

engine-e-lunar-afs-frame-subframe-data-lengths-expected = サブフレームのデータ長 { $sb2 }/{ $sb3 }/{ $sb4 }（期待値 { $SB2_DATA_BITS }/{ $SB34_DATA_BITS }/{ $SB34_DATA_BITS }）

engine-e-lunar-afs-frame-symbols-expected-given = シンボルは { $FRAME_SYMBOLS } 個が必要ですが、{ $soft } 個が与えられました

## src/lunar_afs/ldpc.rs

engine-e-lunar-afs-ldpc-line-expected-row-column = { $v1 } 行目：`row,column` が必要です

engine-e-lunar-afs-ldpc-line = { $v1 } 行目：{ $e }

engine-e-lunar-afs-ldpc-line-outside = { $v1 } 行目：({ $r },{ $c }) は { $rows }x{ $cols } の範囲外です

engine-e-lunar-afs-ldpc-ldpc-information-bits-expected-given = LDPC { $subframe }：情報ビットは { $info_bits } 個が必要ですが、{ $info } 個が与えられました

## src/lunar_afs/lsis.rs

engine-lunar-afs-lsis-the-lsis-v1-data-is = LSIS V1.0 のデータが { $cache_dir } にありません（KSHANA_LSIS_DIR を設定するか、xval/lunar-afs/fetch_lsis.sh を実行してください。このスクリプトは { $LSIS_PDF_URL } をダウンロードして添付ファイルを展開します。添付ファイルは Kshana と共に再配布されません）

engine-e-lunar-afs-lsis-is-not-pinned-lsis-file = { $name } は固定された LSIS ファイルではありません

engine-e-lunar-afs-lsis-has-sha-256-expected-pinned = { $path } の SHA-256 は { $got } で、期待値は { $want } です（LSIS V1.0 of 29 January 2025 に固定）；{ $fetch_hint }

## src/lunar_afs/waveform.rs

engine-lunar-afs-waveform-lunanet-augmented-forward-signal-baseband = LunaNet Augmented Forward Signal ベースバンド、{ $LSIS_VERSION }；Kshana リファレンスジェネレーター

engine-lunar-afs-waveform-afs-node = AFS ノード { $node_id }

engine-lunar-afs-waveform-afs-node-frame-toi = AFS ノード { $node_id } フレーム TOI { $toi }

## src/lunar_beacon.rs

engine-e-lunar-beacon-satellites-must-be-at-least = n_satellites は 1 以上でなければなりません

engine-e-lunar-beacon-comparison-satellites-must-be-at = comparison_n_satellites は 1 以上でなければなりません

engine-e-lunar-beacon-elevation-mask-deg-must-be = elevation_mask_deg は [0, 90) の範囲でなければなりません。指定値：{ $mask_deg }

engine-lunar-beacon-satellites-no-beacons = 衛星 { $n_sats } 機、ビーコンなし

engine-lunar-beacon-satellites-visible-beacons = 衛星 { $n_sats } 機 + 可視ビーコン { $n_vis_beacons } 基

engine-lunar-beacon-satellites-no-beacons-2 = 衛星 { $n_cmp } 機、ビーコンなし

engine-e-lunar-beacon-serialising-beacon-report = ビーコンレポートのシリアライズ：{ $e }

engine-e-lunar-beacon-the-beacon-report-must-serialise = ビーコンレポートは JSON オブジェクトにシリアライズできなければなりません

engine-lunar-beacon-lunar-surface-beacon-augmentation-mask = 月面ビーコンによる補強 — マスク { $elevation_mask_deg } deg、エポック +{ $epoch_s } s、ビーコンごとの sigma_URE { $sigma_ure_m } m{ "\u000A" }

engine-lunar-beacon-sats-beacons = { "  " }{ $label }  衛星 { $n_visible_sats }  ビーコン { $n_visible_beacons }  { $fmt_dop }{ "\u000A" }

engine-lunar-beacon-realised-sigma-3d = { "  " }{ $v1 }  実現 1-sigma：3D { $pos_3d_m } m  水平 { $horizontal_m } m  垂直 { $vertical_m } m{ "\u000A" }

engine-lunar-beacon-beacons-improve-pdop-by = { "  " }ビーコンによる PDOP の改善：{ $f }x；{ " " }

engine-lunar-beacon-larger-constellation-instead = 衛星コンステレーションを拡大した場合：{ $f }x{ "\u000A" }

## src/lunar_ephemeris.rs

engine-e-lunar-ephemeris-cannot-read-lunar-ephemeris = 月エフェメリス { $path } を読み取れません：{ $e }

engine-e-lunar-ephemeris-lunar-ephemeris-first-line-must = 月エフェメリス：最初の行は `{ $MAGIC }` でなければなりませんが、`{ $line }` でした

engine-e-lunar-ephemeris-lunar-ephemeris-file-is-empty = 月エフェメリス：ファイルが空です

engine-e-lunar-ephemeris-lunar-ephemeris-format-must-be = 月エフェメリス：`# format:` は `states` または `elements` でなければなりませんが、`{ $other }` でした

engine-e-lunar-ephemeris-lunar-ephemeris-no-data-rows = 月エフェメリス：データ行がありません

engine-e-lunar-ephemeris-lunar-ephemeris-missing-column = 月エフェメリス：列 `{ $name }` がありません

engine-e-lunar-ephemeris-lunar-ephemeris-elements-frame-must = 月エフェメリス：`# elements_frame:` は `icrf` または `mci` でなければなりませんが、`{ $other }` でした

engine-e-lunar-ephemeris-lunar-ephemeris-elements-frame-icrf = 月エフェメリス：`elements_frame: icrf` には `# epoch_jd_tdb:` が必要です（軌道要素の基準エポックであり、ICRF から月固定座標系への回転を評価するエポックでもあります）：{ $e }

engine-e-lunar-ephemeris-lunar-ephemeris-short-element-row = 月エフェメリス：軌道要素の行 { $v1 } が短すぎます

engine-e-lunar-ephemeris-lunar-ephemeris-element-row = 月エフェメリス：軌道要素の行 { $v1 }：{ $e }

engine-e-lunar-ephemeris-lunar-ephemeris-element-row-has = 月エフェメリス：軌道要素の行 { $v1 } の軌道長半径が正の値ではありません

engine-e-lunar-ephemeris-lunar-ephemeris-element-row-has-2 = 月エフェメリス：軌道要素の行 { $v1 } の離心率 { $ecc } が [0, 1) の範囲外です

engine-e-lunar-ephemeris-lunar-ephemeris-states-file-needs = 月エフェメリス：`states` ファイルには `# frame: icrf` または `# frame: mci` が必要ですが、`{ $other }` でした

engine-e-lunar-ephemeris-lunar-ephemeris-an-icrf-states = 月エフェメリス：`icrf` の states ファイルには `# epoch_jd_tdb:` が必要です：{ $e }

engine-e-lunar-ephemeris-lunar-ephemeris-short-state-row = 月エフェメリス：状態の行 { $v1 } が短すぎます

engine-e-lunar-ephemeris-lunar-ephemeris-state-row = 月エフェメリス：状態の行 { $v1 }：{ $e }

engine-e-lunar-ephemeris-lunar-ephemeris-state-row-is = 月エフェメリス：状態の行 { $v1 } が有限ではありません

engine-e-lunar-ephemeris-lunar-ephemeris-state-row-for = 月エフェメリス：衛星 { $sat } の状態の行 { $v1 } が時間を遡っています（{ $last } の後に { $t }）。エポックは衛星ごとに厳密に増加しなければなりません

engine-lunar-ephemeris-tabulated-moon-centred-state-ephemeris = 表形式の月中心状態エフェメリス（{ $e } フレーム）。表のエポック間は次数 { $LAGRANGE_ORDER } のラグランジュ補間を行い、{ $v2 } により MCMF へ変換しています。状態はこのエンジンでは伝搬されません。来歴区分 `published-ephemeris`：軌道要素から導いたいかなる値とも区別されます。

engine-lunar-ephemeris-published-constellation-definition-stated-in = 月中心 ICRF（`{ $v1 }`）で示された公表済みの衛星コンステレーション定義を、このエンジン独自のケプラー解法で同じ慣性系のまま伝搬し、各エポックで IAU 2015 / WGCCRE の月の向き（歳差運動する極、解析的な物理秤動）により MCMF へ変換しています。フレームの近似はありません。出典はフレームとエポックを明示しており、両方を使用しています。来歴区分 `published-elements`：カーネルから導いたいかなる値とも区別されます。

engine-lunar-ephemeris-published-constellation-definition-propagated-by = 公表済みの衛星コンステレーション定義を、このエンジン独自のケプラー解法で伝搬し、平均回転の月自転モデルで変換しています。これは例示用コンステレーションがたどる経路とまったく同じであり、二つの実行の違いはコンステレーションの設計のみです。出典は軌道要素を `{ $v1 }` フレームで示しており、ここでは MCI として読み込むため、`published_frame_tie_angle_deg` だけコンステレーションが傾きます。来歴区分 `published-elements`：カーネルから導いたいかなる値とも区別されます。

## src/lunar_frame_campaign.rs

engine-e-lunar-frame-campaign-unknown-station-datum-expected-fixed = 不明な station_datum { $other }："fixed" または "estimated-anchor-first" を指定してください

engine-e-lunar-frame-campaign-vlbi-campaign-needs-at-least = VLBI キャンペーンには基線を構成するため少なくとも2局が必要ですが、{ $raw } 局でした

engine-e-lunar-frame-campaign-station-has-non-finite-coordinate = 局 { $name } の座標が有限ではありません

engine-e-lunar-frame-campaign-station-latitude-deg-is-outside = 局 { $name } の緯度 { $lat } deg が [-90, 90] の範囲外です

engine-e-lunar-frame-campaign-seven-parameter-helmert-datum-needs = 七パラメータのヘルマート測地系には共線でないビーコンが少なくとも3基必要ですが、{ $raw } 基でした

engine-e-lunar-frame-campaign-beacon-has-non-finite-coordinate = ビーコン { $name } の座標が有限ではありません

engine-e-lunar-frame-campaign-beacon-latitude-deg-is-outside = ビーコン { $name } の緯度 { $lat } deg が [-90, 90] の範囲外です

engine-e-lunar-frame-campaign-arc-hours-must-be-positive = arc_hours は有限の正の値でなければなりません。指定値：{ $arc }

engine-e-lunar-frame-campaign-step-min-must-be-positive = step_min は有限の正の値でなければなりません。指定値：{ $step }

engine-e-lunar-frame-campaign-schedule-of-epochs-is-beyond = { $v1 } エポックのスケジュールはこのシナリオの 5000 エポックの上限を超えています。step_min を長くするか arc_hours を短くしてください

engine-e-lunar-frame-campaign-delay-sigma-must-be-positive = delay_sigma_s は有限の正の値でなければなりません。指定値：{ $s }

engine-e-lunar-frame-campaign-elevation-mask-deg-must-be = elevation_mask_deg は有限で [-90, 90) の範囲でなければなりません。指定値：{ $m }

engine-e-lunar-frame-campaign-earth-elevation-mask-deg-must = earth_elevation_mask_deg は有限で [-90, 90) の範囲でなければなりません。指定値：{ $m }

engine-e-lunar-frame-campaign-rel-tol-must-be-finite = rel_tol は有限で [0, 1) の範囲でなければなりません。指定値：{ $t }

engine-e-lunar-frame-campaign-assumed-coordinate-sigma-must-be = assumed_coordinate_sigma_m は有限の正の値でなければなりません。指定値：{ $s }

engine-e-lunar-frame-campaign-solver-must-be-spectral-or = solver には "spectral" または "srif" を指定してください。指定値："{ $other }"

engine-e-lunar-frame-campaign-serializing-lunar-frame-campaign-result = lunar-frame-campaign の結果のシリアライズ：{ $e }

engine-e-lunar-frame-campaign-no-observation-in-the-campaign = キャンペーン内に、基線の両端で地球側仰角マスク { $mask } deg を超え、かつビーコン自身の地平線上で { $earth_mask } deg のマスクも超える観測がありません。{ $n_epochs } エポック x { $v1 } 基線 x { $n_beacons } ビーコンがすべて棄却されました。arc_hours を長くするか、マスクを下げるか、局を移動してください。

engine-lunar-frame-campaign-full-rank-all-similarity-parameters = フルランク：7つの相似変換パラメータはすべてこのキャンペーンで拘束されています（条件数 { $condition }）

engine-lunar-frame-campaign-rank-deficient-of-similarity-directions = RANK-DEFICIENT：相似変換の7方向のうち { $defect } 方向はこのキャンペーンから観測できないため、測地系の sigma は公表されません。観測できない方向は七パラメータ基底で列挙されます

engine-lunar-frame-campaign-lunar-frame-campaign-beacons-baselines = lunar-frame-campaign | ビーコン { $n_beacons } x 基線 { $v1 } x エポック { $n_epochs } = 観測 { $n_obs } 件（遅延 sigma { $sigma_tau } s） | 局測地系 { $station_datum } | ヘルマート ランク { $rank }/7 条件数 { $condition } | 測地系並進 sigma { $v5 } 対 注入変換の回復誤差 { $trans_err_norm_m } m（比 { $v7 }）

engine-lunar-frame-campaign-of-beacons-have-no-observation = ビーコン { $beacons } 基のうち { $names } 基はこのスケジュールで観測がありません（{ $names2 }）。これらは情報を持たず、sigma は null で、測地系は観測のあるビーコンのみから実現されます

## src/lunar_infra/geodesy.rs

engine-e-lunar-infra-geodesy-all-sigmas-must-be-positive = すべての sigma は正の値でなければなりません

## src/lunar_infra/gnss.rs

engine-e-lunar-infra-gnss-gnss-planes-sats-per-plane = gnss：planes、sats_per_plane、altitude_km は正の値でなければなりません

engine-e-lunar-infra-gnss-gnss-tx-efficiency-must-be = gnss：tx_efficiency は (0, 1] の範囲でなければなりません

## src/lunar_infra/mod.rs

engine-lunar-infra-lunar-infrastructure-od-consistency-gnss = lunar-infrastructure od-consistency：位置 sigma は GNSS { $v } m 対 地上 { $v2 } m、平均 q { $v3 }（カイ二乗 6 の期待値は 6）

engine-lunar-infra-lunar-infrastructure-carrier-phase-ambiguities = lunar-infrastructure carrier-phase：最長アークでアンビギュイティ { $last } 個、ILS 成功率 { $last2 }（ブートストラップ { $last3 }）

engine-lunar-infra-lunar-infrastructure-frame-coestimation-smallest = lunar-infrastructure frame-coestimation：最小情報固有値 x{ $v }（周回機リンクあり）、CRLB トレース x{ $v2 }

## src/lunar_infra/mod.rs

engine-lunar-infra-lunar-infrastructure-space-tie-sweep = lunar-infrastructure space-tie：{ $v } アークにわたるスイープ点 { $last } 個；登録済みのローカルタイでのレーザー対 GNSS の x 並進 sigma { $last2 } m

engine-lunar-infra-lunar-infrastructure-geodesy-sensitivity-crlb = lunar-infrastructure geodesy-sensitivity：CRLB sigma h2 { $v }、k2 { $v2 }、l2 { $v3 }

engine-e-lunar-infra-unknown-study-expected-one-of = 不明なスタディ `{ $other }`：{ $studies } のいずれかを指定してください

## src/lunar_infra/od.rs

engine-e-lunar-infra-od-the-measurement-set-does-not = この測定セットでは軌道が決定できません（情報行列が特異です）

engine-e-lunar-infra-od-monte-carlo-trials-must-be = monte_carlo.trials は 1 以上でなければなりません

engine-e-lunar-infra-od-ground-sigmas-must-be-positive = 地上局の sigma は正の値でなければなりません

engine-e-lunar-infra-od-unknown-station-dss-14-dss = 不明な局 `{ $nm }`：DSS-14、DSS-63、DSS-43 のいずれかを指定してください

engine-e-lunar-infra-od-too-few-ground-measurements-to = 軌道を決定するには地上測定が少なすぎます

engine-e-lunar-infra-od-the-covariance-of-the-difference = 差の共分散が特異です

## src/lunar_infra/orbit.rs

engine-e-lunar-infra-orbit-the-nrho-differential-correction-did = NRHO の微分補正がシードから収束しませんでした

engine-e-lunar-infra-orbit-elfo-needs-perilune-altitude-apolune = elfo には 0 < 近月点高度 < 遠月点高度 が必要です

engine-e-lunar-infra-orbit-unknown-orbit-family-nrho-or = 不明な軌道ファミリー `{ $other }`：nrho または elfo を指定してください

engine-e-lunar-infra-orbit-sample-and-arc-days-must = sample_s と arc_days は正の値でなければなりません

## src/lunar_infra/phase.rs

engine-e-lunar-infra-phase-no-common-satellite-between-the = 受信機間に共通の衛星がありません

engine-e-lunar-infra-phase-the-carrier-phase-normal-equations = 搬送波位相の正規方程式が特異です

engine-e-lunar-infra-phase-the-position-block-is-singular = 位置ブロックが特異です

engine-e-lunar-infra-phase-the-ambiguity-covariance-is-not = アンビギュイティの共分散が正定値ではありません

## src/lunar_infra/tie.rs

engine-e-lunar-infra-tie-technique-sigmas-must-be-positive = 技法ごとの sigma は正の値でなければなりません

engine-e-lunar-infra-tie-local-tie-sigmas-must-be = ローカルタイの sigma は正の値でなければなりません

## src/lunar_jamming.rs

engine-e-lunar-jamming-carrier-hz-must-be-finite = carrier_hz は有限の正の値でなければなりません

engine-e-lunar-jamming-chip-rate-hz-must-be = chip_rate_hz は有限の正の値でなければなりません

engine-e-lunar-jamming-temp-must-be-finite-and = temp_k は有限の正の値でなければなりません

engine-e-lunar-jamming-sma-km-must-be-finite = sma_km は有限で、月の半径を上回らなければなりません

engine-e-lunar-jamming-eccentricity-must-be-in = eccentricity は [0, 1) の範囲でなければなりません

engine-e-lunar-jamming-jammer-power-dbw-must-be = jammer.power_dbw は有限でなければなりません

engine-lunar-jamming-lunar-jamming-sats-epochs-links = lunar-jamming | 衛星 { $n_sats } 機、エポック { $n_epochs }、({ $site_lat_deg }, { $site_lon_deg }) からのリンク { $n_links } 本 | J/S { $min_js_db }..{ $max_js_db } dB（平均 { $mean_js_db }） | { $n_lost } LOST | 可用性 { $availability_under_jamming }（公称 { $availability_nominal }）

engine-lunar-jamming-lunar-jamming-sats-epochs-links-2 = lunar-jamming | 衛星 { $n_sats } 機、エポック { $n_epochs }、({ $site_lat_deg }, { $site_lon_deg }) からのリンク { $n_links } 本 | ジャマーなし（クリアスカイの月基準ケース） | { $n_lost } LOST | 可用性 { $availability_nominal }

## src/lunar_llr.rs

engine-e-lunar-llr-unexpected-reflector-catalogue-header = 想定外の反射器カタログのヘッダー { $t }

engine-e-lunar-llr-short-reflector-catalogue-row = 反射器カタログの行が短すぎます { $t }

engine-e-lunar-llr-unreadable-reflector-field-in = { $t } の反射器フィールド { $i } を読み取れません

engine-e-lunar-llr-reflector-but-the-published-radius = 反射器 { $f }：|(x,y,z)| = { $norm3 } m ですが、公表された半径の列は { $radius } m です — 行が編集されています

engine-e-lunar-llr-reflector-catalogue-has-no-rows = 反射器カタログに行がありません

engine-e-lunar-llr-unreadable-position-epoch-year = position_epoch_year { $rest } を読み取れません

engine-e-lunar-llr-unexpected-station-catalogue-header = 想定外の局カタログのヘッダー { $t }

engine-e-lunar-llr-short-station-catalogue-row = 局カタログの行が短すぎます { $t }

engine-e-lunar-llr-unreadable-station-field-in = { $t } の局フィールド { $i } を読み取れません

engine-e-lunar-llr-unreadable-ilrs-id-in = { $t } の ILRS ID を読み取れません

engine-e-lunar-llr-station-catalogue-has-no-rows = 局カタログに行がありません

engine-e-lunar-llr-cannot-read-this-scenario-runs = { $path } を読み取れません（{ $e }）。このシナリオは { $DEFAULT_DATA_DIR } 配下のコミット済み実データスライスで実行されます。これはリポジトリには含まれますが、公開クレートには含まれません。`data_dir` をそのコピーに向けてください。

engine-e-lunar-llr-only-usable-normal-points-for = 使用可能なノーマルポイントは { $reflectors } 個の反射器に対して { $used } 件のみで、{ $v3 } 座標を拘束するには少なすぎます。アーカイブのスライスを広げてください

engine-e-lunar-llr-the-simulated-campaign-own-report = シミュレーションしたキャンペーン自身のレポートを解析できませんでした：{ $e }

engine-lunar-llr-lunar-llr-datum-archived-normal = lunar-llr-datum：アーカイブ済みノーマルポイント { $used } 件（解析済み { $n_parsed } 件）、局 { $station_counts } から { $reflectors } 個のレトロリフレクターアレイへ、{ $v5 } d にわたる；測定されたノーマルポイント精密度の中央値 { $median } mm（片道）；反射器情報ランク { $rank }/{ $n }；ヘルマート ランク { $rank2 }/{ $n_helmert } 条件数 { $condition }；測地系並進 sigma { $v12 } m；観測値マイナス計算値の片道残差 RMS { $rms_m } m（{ $v14 }）

engine-e-lunar-llr-extra-earth-elevation-mask-deg = extra_earth_elevation_mask_deg は有限で [-90, 90) の範囲でなければなりません。指定値：{ $mask }

engine-e-lunar-llr-has-non-finite-coordinate = { $kind } { $name } の座標が有限ではありません

engine-e-lunar-llr-latitude-deg-is-outside-90 = { $kind } { $name } の緯度 { $lat_deg } deg が [-90, 90] の範囲外です

engine-e-lunar-llr-serialising-the-lunar-llr-datum = lunar-llr-datum レポートのシリアライズに失敗しました：{ $e }

## src/lunar_perturbed.rs

engine-e-lunar-perturbed-the-integration-step-must-divide = 積分ステップは出力ステップを割り切らなければなりません

## src/lunar_receiver.rs

engine-e-lunar-receiver-receiver = 受信機：{ $w }

engine-lunar-receiver-must-be-finite-and-not = { $n } は有限で、負であってはなりません

engine-lunar-receiver-must-be-finite-and-positive = { $n } は有限の正の値でなければなりません

## src/lunar_service.rs

engine-e-lunar-service-moonlight-service-volume = moonlight-service-volume：{ $e }

engine-e-lunar-service-moonlight-service-volume-export-site = moonlight-service-volume：サイトのエクスポート：{ $e }

engine-e-lunar-service-lunar-ephemeris-covers-past-its = 月エフェメリス { $path } はエポックから { $until } s までをカバーしますが、シナリオの期間は { $last } s に達します。horizon_hours を短くするか、より長いアークを取得してください（表形式エフェメリスの外挿は拒否されます）

engine-e-lunar-service-planetary-kernel-path-needs-epoch = planetary_kernel_path には epoch_utc（YYYY-MM-DDTHH:MM:SS UTC）が必要です

engine-lunar-service-op-frame-at-utc-earth = { $epoch } UTC の OP フレーム（月に対する地球の見かけの軌道法線、x は IAU 月赤道上のその昇交点方向）；IAU 月固定フレームでの月の GM、J2、C22；地球と太陽の第三体は { $spk_path } の DE440 位置；四次ルンゲ・クッタ法、10 s ステップ

## src/lunar_solution.rs

engine-e-lunar-solution-solution-height-sigma-must-be = solution：height_sigma_m は有限の正の値でなければなりません

engine-e-lunar-solution-solution-range-sigma-must-be = solution：range_sigma_m は有限の正の値でなければなりません

engine-e-lunar-solution-solution-min-satellites-needs-height = solution：min_satellites = 3 には height_aided = true が必要です

engine-e-lunar-solution-solution-min-satellites-must-be = solution：min_satellites は 3 または 4 でなければなりません。指定値：{ $n }

engine-e-lunar-solution-solution-window-epochs-must-be = solution：window_epochs は 1 から 144 でなければなりません

## src/lunar_station.rs

engine-lunar-station-must-be-finite-and-positive = { $name } は有限の正の値でなければなりません

engine-lunar-station-must-be-finite-and-not = { $name } は有限で、負であってはなりません

engine-lunar-station-points-epochs-trials-exceeds-lower = n_points x n_epochs x n_trials = { $work } が { $MAX_WORK } を超えています。n_trials を減らすか、grid_lat_step_deg を粗くするか（または点数を減らすか）、t_step_s を大きくするか t_span_s を短くしてください

engine-e-lunar-station-kind-must-be-got = kind は { $KIND } でなければなりません。指定値：{ $k }

engine-e-lunar-station-the-ephemeris-covers-but-the = { $KIND }：エフェメリス { $path } は { $until } s までをカバーしますが、実行は { $last } s に達します（最後のエポックに latency_s を加えた値）。t_span_s を短くしてください

engine-e-lunar-station-no-case = { $KIND }：該当するケースがありません（{ $j }, { $i }, { $k }）

engine-lunar-station-points-epochs-trials = { $n_grid_points } 点 · { $n_epochs } エポック · { $n_trials } 試行

engine-lunar-station-hpl-max = HPL 最大 { $f }

engine-lunar-station-survey-latency-bits = 測量 { $survey_sigma_m } m · レイテンシ { $latency_s } s · { $quantization_bits } ビット

## src/lunar_terrain.rs

engine-e-lunar-terrain-dem-lines-and-samples-must = dem：ライン数とサンプル数は 2 から { $MAX_DEM_SIDE } でなければなりません。指定値：{ $lines } x { $samples }

engine-e-lunar-terrain-dem-heights-for-grid = dem：{ $lines } x { $samples } のグリッドに対して高さが { $heights_m } 個あります

engine-e-lunar-terrain-dem-map-scale-must-be = dem：map_scale_m は正の値でなければなりません。指定値：{ $map_scale_m }

engine-e-lunar-terrain-dem-reference-radius-must-be = dem：reference_radius_m は正の値でなければなりません。指定値：{ $reference_radius_m }

engine-e-lunar-terrain-dem-cannot-read = dem：{ $descriptor_path } を読み取れません：{ $e }

engine-e-lunar-terrain-dem-projection-must-be-south = dem：projection は south-polar-stereographic でなければなりません。指定値：{ $projection }

engine-e-lunar-terrain-dem-sample-type-must-be = dem：sample_type は int16-le でなければなりません。指定値：{ $sample_type }

engine-e-lunar-terrain-dem-cannot-read-2 = dem：{ $img } を読み取れません：{ $e }

engine-e-lunar-terrain-dem-grid-over-the-pixel = dem：グリッドが { $MAX_DEM_SIDE } ピクセルの上限を超えています

engine-e-lunar-terrain-dem-is-bytes-int16-needs = dem：{ $img } は { $bytes } バイトです。{ $lines } x { $samples } の int16 には { $d } が必要です

engine-e-lunar-terrain-dem-sha-256-does-not = dem：{ $img } の SHA-256 { $digest } がディスクリプターの { $image_sha256 } と一致しません

engine-e-lunar-terrain-dem-scaling-factor-must-be = dem：scaling_factor は正の値でなければなりません

engine-e-lunar-terrain-dem-tile-cannot-read = dem_tile：{ $path } を読み取れません：{ $e }

engine-e-lunar-terrain-dem-tile-needs-at-least = dem_tile：{ $path }：少なくとも 2 x 2 点、[-90, 90] deg の範囲内で増加する範囲、360 deg の経度、および有限の高さが必要です

engine-e-lunar-terrain-terrain-must-be-finite-and = terrain：{ $what } は有限の正の値でなければなりません。指定値：{ $v }

engine-e-lunar-terrain-terrain-antenna-height-must-be = terrain：antenna_height_m は有限で、負であってはなりません。指定値：{ $antenna_height_m }

engine-e-lunar-terrain-terrain-azimuth-step-deg-must = terrain：azimuth_step_deg は 90 以下でなければなりません

engine-e-lunar-terrain-terrain-max-range-range-step = terrain：max_range_m / range_step_m は 1 から 1e6 でなければなりません

engine-e-lunar-terrain-terrain-the-site-is-outside = terrain：サイトが高さフィールドの外にあります

engine-e-lunar-terrain-terrain-stated-horizon-needs-non = terrain：明示した地平線には空でないソースが必要です

engine-e-lunar-terrain-terrain-stated-horizon = terrain：明示した地平線：{ $e }

engine-e-lunar-terrain-terrain-give-dem-path-or = terrain：dem_path と dem_tile_path のどちらか一方を指定してください（両方は不可）

engine-e-lunar-terrain-terrain-max-range-km-must = terrain：max_range_km は有限の正の値でなければなりません

engine-e-lunar-terrain-terrain-range-step-must-be = terrain：range_step_m は有限の正の値でなければなりません

engine-e-lunar-terrain-site-deg-deg = { $e }（サイト { $lat_deg } deg、{ $lon_deg } deg）

## src/lunar_time_budget_scenario.rs

engine-e-lunar-time-budget-scenario-unknown-clock-expected-one-of = 不明な時計 { $other }；optical-master、passive-h-maser、rafs、mini-rafs のいずれかを指定してください

engine-e-lunar-time-budget-scenario-clocks-must-name-at-least = clocks には少なくとも一つの時計クラスを指定してください

engine-e-lunar-time-budget-scenario-tau-min-must-be-finite = tau_min_s は有限の正の値でなければなりません。指定値：{ $lo }

engine-e-lunar-time-budget-scenario-tau-max-must-be-finite = tau_max_s は有限で、tau_min_s（{ $lo }）より大きくなければなりません。指定値：{ $hi }

engine-e-lunar-time-budget-scenario-points-per-decade-must-be = points_per_decade は ≥ 1 でなければなりません

engine-e-lunar-time-budget-scenario-term-is-shorter-than-the = 項 { $name } が tau グリッドより短くなっています

engine-lunar-time-budget-scenario-lunar-time-budget-clock-term = lunar-time-budget | 時計 { $clock } | 7項の x_Σ(τ)、{ $taus } 個の τ 点（{ $taus2 }–{ $taus3 } s） | 交差点 τ { $crossover_tau_s } s（x { $crossover_x_s } s） | フレーム下限 { $frame_term_s } s | 時計 x(1 d) { $x_1day_ns } ns (MODELLED)

engine-lunar-time-budget-scenario-time-lab-to-ltc-ns = { $summary } | タイムラボ：{ $lab } { $lab2 }（LTC まで）、x(1 d) { $lab3 } ns (MODELLED)

## src/lunar_time_lab.rs

engine-e-lunar-time-lab-time-lab-unknown-clock-expected = time_lab：不明な時計 { $other }；optical-master、passive-h-maser、rafs、mini-rafs のいずれかを指定するか、代わりに device_card を指定してください

engine-e-lunar-time-lab-time-lab-give-either-clock = time_lab：clock と device_card のどちらか一方を指定してください（両方は不可）

engine-e-lunar-time-lab-time-lab-device-card = time_lab：device_card：{ $e }

engine-e-lunar-time-lab-time-lab-steer-interval-must = time_lab：steer_interval_s は有限の正の値でなければなりません。指定値：{ $n }

engine-e-lunar-time-lab-time-lab-must-be-finite = time_lab：{ $name } は有限で、負であってはなりません。指定値：{ $v }

engine-e-lunar-time-lab-time-lab-horizons-must-be = time_lab：horizons_s は正の数でなければなりません

engine-lunar-time-lab-station-height-not-modelled-exactly = 局の高さは正確にはモデル化されていません：{ $height_sigma_m } m の一シグマの高さ誤差は、直近のステアリング以降の線形項として適用され、レートに { $value } ns/day のバイアスを生じます

## src/lunar_vlbi.rs

engine-e-lunar-vlbi-light-time-did-not-converge = 光行時間が 30 回の反復で 1e-15 s に収束しませんでした

engine-e-lunar-vlbi-the-kernel-path-needs-planetary = カーネルパスには planetary_kernel_path、earth_orientation_kernel_path、moon_orientation_kernel_path をすべて指定する必要があります

## src/lunar_vlbi_fim.rs

engine-e-lunar-vlbi-fim-unknown-datum-expected-anchor-first = 不明な測地系 { $other }："anchor-first-station"、"free-network"、"all-stations-fixed" のいずれかを指定してください

engine-e-lunar-vlbi-fim-vlbi-schedule-needs-at-least = VLBI スケジュールには基線を構成するため少なくとも 2 局が必要ですが、{ $raw } 局でした

engine-e-lunar-vlbi-fim-beacon-coordinates-must-be-finite = ビーコン座標は有限でなければなりません

engine-e-lunar-vlbi-fim-beacon-latitude-deg-is-outside = ビーコンの緯度 { $lat } deg が [-90, 90] の範囲外です

engine-e-lunar-vlbi-fim-schedule-of-epochs-is-beyond = { $v1 } エポックのスケジュールはこのシナリオの 20000 エポックの上限を超えています。step_min を長くするか arc_hours を短くしてください

engine-e-lunar-vlbi-fim-equipartition-must-be-positive-and = equipartition_g は有限の正の値でなければなりません。指定値：{ $g }

engine-e-lunar-vlbi-fim-serializing-lunar-vlbi-fim-result = lunar-vlbi-fim の結果のシリアライズ：{ $e }

engine-e-lunar-vlbi-fim-no-observation-in-the-schedule = スケジュール内に、基線の両端で仰角マスク { $mask } deg を超える観測がありません：{ $n_epochs } エポック x { $v1 } 基線がすべて棄却されました。arc_hours を長くするか、elevation_mask_deg を下げるか、局を移動してください。

engine-e-lunar-vlbi-fim-the-datum-leaves-no-parameter = この測地系では推定するパラメータが残りません

engine-lunar-vlbi-fim-rank-deficient-of-directions-are = RANK-DEFICIENT：{ $dim } 方向のうち { $defect } 方向は観測できないため、座標ごとの sigma は報告されません。以下の観測可能部分空間の値は、{ $rank } 個の観測可能な方向に制限した擬似逆行列であり、局の sigma ではありません

engine-lunar-vlbi-fim-lunar-vlbi-fim-stations-baselines = lunar-vlbi-fim | 局 { $n_stations } / 基線 { $v2 } x エポック { $n_epochs } = 観測 { $n_obs } 件（マスク { $mask } deg） | 測地系 { $datum } | ランク { $rank }/{ $dim } 条件数 { $condition } | 局 sigma { $v10 } 対 等分配 g={ $g } { $eq_g } m（比 { $v13 }）

## src/main.rs

engine-main-error-validate-needs-scenario-path = エラー：--validate にはシナリオのパスが必要です

engine-main-error-study-needs-suite-manifest = エラー：--study にはスイートのマニフェストのパスが必要です

engine-main-error-study-name-needs-value = エラー：--study-name には値が必要です

engine-main-error-export-sp3-needs-path = エラー：--export-sp3 にはパスが必要です

engine-main-error-export-omm-needs-path = エラー：--export-omm にはパスが必要です

engine-main-error-export-oem-needs-path = エラー：--export-oem にはパスが必要です

engine-main-error-animate-needs-format-svg = エラー：--animate には形式の指定が必要です：svg、html、frames、all のいずれか

engine-main-error-animate = エラー：--animate：{ $e }

engine-main-error-animate-fps-needs-whole = エラー：--animate-fps には毎秒のフレーム数を整数で指定してください

engine-main-error-export-needs-format-czml = エラー：--export には形式の指定が必要です：czml、kml、geojson、stk、sigmf、all、list のいずれか

engine-main-error-animate-duration-needs-length = エラー：--animate-duration には秒単位の長さが必要です

engine-main-error-import-route-needs-geojson = エラー：--import-route には GeoJSON ファイルのパスが必要です

engine-main-error-eop-needs-finals2000a-file = エラー：--eop には finals2000A ファイルのパスが必要です

engine-main-error-unknown-option = エラー：不明なオプション '{ $other }'

engine-main-error-unexpected-argument-one-scenario = エラー：想定外の引数 '{ $other }'；一回の実行で指定できるシナリオファイルは一つです

engine-main-warning-animate-fps-and-animate = 警告：--animate がない場合、--animate-fps と --animate-duration は何も行いません

engine-main-error-animate-exports-one-scenario = エラー：--animate は一つのシナリオ実行をエクスポートします。--validate や --study とは併用できません

engine-main-error-validate-lints-one-scenario = エラー：--validate は一つのシナリオを検証します。シナリオファイルを同時に指定しないでください

engine-main-error-cannot-read = エラー：{ $validate_file } を読み取れません：{ $e }

engine-main-ok-kind-resolves-this-kind = OK：{ $kind } — kind は解決されました。この kind に必須フィールドはなく（空の本文で参照構成が実行されます）、これ以上確認する項目はありませんでした

engine-main-ok-kind-resolves-and-all = OK：{ $kind } — kind は解決され、公表されている必須フィールドの項目 { $n_required } 件がすべて満たされています。フィールドの値は確認されません

engine-main-error-study-runs-suite-do = エラー：--study はスイートを実行します。単一のシナリオファイルを同時に指定しないでください

engine-main-warning-study-name-is-ignored = 警告：--study-name は --study と併用すると無視されます。スタディの題名はスイートのマニフェストの `title =` で決まります

engine-main-error-cannot-read-2 = エラー：{ $path } を読み取れません：{ $e }

engine-main-hint-kshana-example-lists-the = ヒント：`kshana example` は同梱の参照シナリオを一覧表示します。`kshana example clock-holdover > clock-holdover.toml` はその一つをファイルに書き出します

engine-main-error-cannot-read-3 = エラー：{ $eop_file } を読み取れません：{ $e }

engine-main-error-eop = エラー：--eop：{ $e }

engine-main-error-cannot-read-4 = エラー：{ $route_file } を読み取れません：{ $e }

engine-main-error-import-route = エラー：--import-route：{ $e }

engine-main-does-not-apply = { $fmt }：適用されません：{ $why }

engine-main-error-export = エラー：--export：{ $e }

engine-main-error-animate-2 = エラー：--animate { $f }：{ $e }

engine-main-error-export-2 = エラー：{ $fmt } のエクスポート：{ $e }

engine-main-error-cannot-write = エラー：{ $json_path } に書き込めません：{ $e }

engine-main-error-cannot-write-2 = エラー：{ $svg_path } に書き込めません：{ $e }

engine-main-error-cannot-build-the-report = エラー：レポートを作成できません：{ $e }

engine-main-error-cannot-write-3 = エラー：{ $html_path } に書き込めません：{ $e }

engine-main-error-cannot-write-4 = エラー：{ $report_json_path } に書き込めません：{ $e }

engine-main-error-cannot-write-5 = エラー：{ $csv_path } に書き込めません：{ $e }

engine-main-wrote-and = 書き込み済み：{ $json_path }、{ $svg_path }、{ $html_path }、{ $report_json_path }、{ $csv_path }

engine-main-wrote-and-2 = 書き込み済み：{ $json_path }、{ $svg_path }、{ $html_path }、{ $report_json_path }

engine-main-error-cannot-write-6 = エラー：{ $target } に書き込めません：{ $e }

engine-main-error-cannot-write-7 = エラー：{ $sp3_path } に書き込めません：{ $e }

engine-main-error-sp3-export-failed = エラー：SP3 のエクスポートに失敗しました：{ $e }

engine-main-error-cannot-write-8 = エラー：{ $omm_path } に書き込めません：{ $e }

engine-main-error-omm-export-failed = エラー：OMM のエクスポートに失敗しました：{ $e }

engine-main-error-cannot-write-9 = エラー：{ $oem_path } に書き込めません：{ $e }

engine-main-error-oem-export-failed = エラー：OEM のエクスポートに失敗しました：{ $e }

engine-main-error-unexpected-argument-after-kinds = エラー：`kinds` の後に想定外の引数 '{ $other }' があります。指定できるのは --json のみです

engine-main-bundled-reference-scenarios-write-one =
    同梱の参照シナリオ（{ $v1 }）。一つをファイルに書き出して実行します：
    { "  " }kshana example clock-holdover > clock-holdover.toml
    { "  " }kshana clock-holdover.toml

engine-main-not-bundled-run-kshana-example = （未同梱：{ $name } — 理由は `kshana example { $name }` を実行して確認してください）

engine-main-error-is-not-bundled-it = エラー：'{ $name }' は同梱されていません：{ $why }

engine-main-error-no-bundled-scenario-named = エラー：'{ $name }' という名前の同梱シナリオはありません。`kshana example` は同梱されている { $v1 } 件を一覧表示します

engine-main-error-cannot-read-5 = エラー：{ $suite_path } を読み取れません：{ $e }

engine-main-wrote-and-3 = 書き込み済み：{ $json_path }、{ $html_path }

engine-main-error-needs-value = エラー：{ $a } には値が必要です

engine-main-error-expected-mean-needs-number = エラー：--expected-mean には数値が必要です

engine-main-error-unknown-imu-fit-option = エラー：不明な imu-fit オプション { $x }

engine-main-error-imu-fit-needs-an = エラー：imu-fit には IMU ログのパスが必要です

engine-main-error-needs-value-2 = エラー：{ $args } には値が必要です

engine-main-error-epoch = エラー：--epoch：{ $e }

engine-main-error-unknown-bench-export-option = エラー：不明な bench-export オプション { $a }

engine-main-error-bench-export-needs-scenario = エラー：bench-export にはシナリオのパスが必要です

engine-main-needs-value = { $a } には値が必要です

engine-main-site-takes-lat-lon-height = --site には lat,lon[,height_m] を指定してください。指定値：{ $v }

engine-main-error-is-bytes-the-tle = エラー：{ $p } は { $m } バイトです。TLE の上限は { $cap }（4 MiB）です

engine-main-error-cannot-read-6 = エラー：{ $p } を読み取れません：{ $e }

engine-main-unknown-sky-option = 不明な sky オプション { $a }

engine-e-main-svg-and-monte-carlo-are = --svg と --monte-carlo は別々の出力です。どちらか一方を指定してください

engine-main-error-preset-needs-name =
    エラー：--preset には名前が必要です
    { $SKYLINE_USAGE }

engine-main-error-profile-needs-file =
    エラー：--profile にはファイルが必要です
    { $SKYLINE_USAGE }

engine-main-symbols-frame-found = シンボル { $r } 個、フレーム { $r2 } 件を検出；{ $v3 }

engine-main-frame-at-fid-toi-sb1 = { "  " }{ $f } のフレーム：FID { $f2 } TOI { $f3 }（SB1 メトリック { $f4 }、SP エラー { $f5 } 件、SB1 エラー { $f6 } 件）

engine-main-not-checked = 未確認：{ $r }

engine-main-wrote-frame-of-6000-symbols = 書き込み済み { $out }：6000 シンボルのフレーム { $frames } 件；サブフレーム 2 から 4 はプレースホルダーです（LDPC 符号化なし、メッセージなし）

engine-main-error-cannot-write-10 = エラー：{ $out } に書き込めません：{ $e }

engine-main-unknown-lunanet-afs-check-subcommand = 不明な lunanet-afs-check サブコマンド { $other }

engine-main-needs-pack-id = { $cmd } にはパック ID が必要です

engine-main-unknown-standards-pack-run-option = 不明な standards-pack run オプション { $a }

engine-main-unknown-standards-pack-subcommand = 不明な standards-pack サブコマンド { $other }

engine-main-error-out-needs-value = エラー：--out には値が必要です

engine-main-error-unknown-compliance-report-option = エラー：不明な compliance-report オプション { $a }

engine-main-error-compliance-report-needs-at = エラー：compliance-report には結果の .json ファイルが少なくとも一つ必要です

engine-main-runs-read-not-used-rows = 読み込んだ実行 { $runs } 件、未使用 { $unrecognised } 件；行：エビデンスあり { $n }、一部 { $n2 }、エビデンスなし { $n3 }、対象外 { $n4 }

engine-main-error-receiver-trust-needs-scenario = エラー：receiver-trust にはシナリオのパスが必要です

engine-main-error-invalid-receiver-trust-scenario = エラー：receiver-trust シナリオが無効です：{ $e }

## src/maneuver.rs

engine-e-maneuver-burn-exhausts-mass-m0-kg = 燃焼で質量を使い果たします：m0={ $m0_kg } kg、ṁ={ $mdot } kg/s、burn={ $burn_s } s ⇒ mf={ $mf } kg

engine-e-maneuver-time-of-flight-must-be = 飛行時間は正の値でなければなりません

engine-e-maneuver-collinear-endpoints-transfer-plane-is = 端点が共線です：遷移平面が定義できません（≈0°/180°）

engine-e-maneuver-lambert-revs-is-for-use = lambert_revs は M >= 1 用です。M = 0 には lambert を使用してください

engine-e-maneuver-no-revolution-transfer-the-time = { $revs } 周の遷移はありません：飛行時間が最小値を下回っています

engine-e-maneuver-grid-step-days-must-be = grid_step_days は正の値でなければなりません。指定値：{ $grid_step_days }

engine-e-maneuver-each-window-must-run-forward = 各ウィンドウは前向きでなければなりません（start <= end）

engine-e-maneuver-no-transfer-of-the-requested = ウィンドウ内に要求された種類の遷移がありません

engine-e-maneuver-the-optimum-left-the-feasible = 最適解が実行可能領域から外れました

## src/mars_od.rs

engine-e-mars-od-dss-expected-values = DSS-{ $id } { $field }：3 個の値が必要です

engine-e-mars-od-dss-epoch-is-not-2003 = DSS-{ $id } のエポックが 2003-JAN-01 ではありません：{ $val }

engine-e-mars-od-dss-has-no-dxyz = DSS-{ $id } に DXYZ がありません

engine-e-mars-od-no-coordinates-for-dss = DSS { $station } の座標がありません

engine-e-mars-od-no-ramps-for-dss = DSS { $station } のランプがありません

engine-e-mars-od-ramp-table-does-not-cover = ランプテーブルが区間をカバーしていません

engine-e-mars-od-epoch-outside-the-integrated-span = エポック { $et } が積分区間の外です

## src/mars_od.rs

engine-e-mars-od-normal-matrix-is-not-positive = 正規行列が正定値ではありません

engine-e-mars-od-no-points = 点がありません

engine-e-mars-od-parameter-has-no-partial-on = 保持された点に対して偏微分を持たないパラメータがあります

## src/mars_pnt.rs

engine-mars-pnt-mars-pnt-user-clock-relays = mars-pnt { $r } | { $user }ユーザー、{ $clock_class }クロック | 中継機 { $n_relays } 機（平均可視 { $mean_relays_in_view }） | 収束後の位置 RMS { $converged_pos_rms_m } m、形式上の 1σ { $converged_pos_sigma_m } m（3σ { $converged_pos_3sigma_m } m — 共分散による FoM であり、認証を受けた PL ではありません） | クロック周波数 σ { $final_clock_freq_sigma } | 共分散の正定値性 { $covariance_pd_throughout }

engine-mars-pnt-mars-pnt-user-clock-position = Mars-PNT — { $user }ユーザー、{ $clock_class }クロック：真値に対する 3-D 位置誤差（収束後 RMS { $converged_pos_rms_m } m）

## src/mcda/ahp.rs

engine-e-mcda-ahp-pairwise-matrix-is-empty = 一対比較行列が空です

engine-e-mcda-ahp-pairwise-matrix-is-not-square = 一対比較行列が正方ではありません（行 { $i } は { $n } 中 { $row } 個）

engine-e-mcda-ahp-entry-must-be-finite-and = 要素 a[{ $i }][{ $j }] = { $v } は有限の正の値でなければなりません

engine-e-mcda-ahp-diagonal-must-be = 対角要素 a[{ $i }][{ $i }] = { $row } は 1 でなければなりません

engine-e-mcda-ahp-entries-must-be-reciprocal = 要素 a[{ $i }][{ $j }]·a[{ $j }][{ $i }] = { $prod } は逆数の関係（≈ 1）でなければなりません

engine-e-mcda-ahp-upper-row-has-entries-expected = 上三角の行 { $i } の要素数は { $row } 個で、期待値は { $v2 } 個です

engine-e-mcda-ahp-upper-entry-must-be-finite = 上三角の要素 ({ $i },{ $j }) = { $v } は有限の正の値でなければなりません

## src/mcda/copras.rs

engine-e-mcda-copras-copras-empty-decision-matrix = COPRAS：意思決定行列が空です

engine-e-mcda-copras-copras-no-criteria = COPRAS：評価基準がありません

engine-e-mcda-copras-copras-weights-but-criterion-types = COPRAS：重みが { $n } 個、評価基準の種別が { $types } 個あります

engine-e-mcda-copras-copras-requires-at-least-one = COPRAS：コスト型（Min）の評価基準が少なくとも一つ必要です

engine-e-mcda-copras-copras-alternative-has-values-but = COPRAS：代替案 { $i } の値は { $row } 個ですが、評価基準は { $n } 個です

engine-e-mcda-copras-copras-alternative-criterion-value-must = COPRAS：代替案 { $i } の評価基準 { $j } の値 { $x } は有限で > 0 でなければなりません

## src/mcda/electre.rs

engine-e-mcda-electre-electre-empty-dataset = ELECTRE I：データセットが空です

engine-e-mcda-electre-electre-no-criteria = ELECTRE I：評価基準がありません

engine-e-mcda-electre-electre-alternative-has-values-but = ELECTRE I：代替案 { $i } の値は { $row } 個ですが、評価基準は { $n } 個です

engine-e-mcda-electre-electre-alternative-has-non-finite = ELECTRE I：代替案 { $i } に有限でない値があります

## src/mcda/moora.rs

engine-e-mcda-moora-moora-empty-decision-matrix = MOORA：意思決定行列が空です

engine-e-mcda-moora-moora-no-criteria = MOORA：評価基準がありません

engine-e-mcda-moora-moora-weights-but-criterion-types = MOORA：重みが { $n } 個、評価基準の種別が { $types } 個あります

engine-e-mcda-moora-moora-alternative-has-values-but = MOORA：代替案 { $i } の値は { $row } 個ですが、評価基準は { $n } 個です

engine-e-mcda-moora-moora-alternative-has-non-finite = MOORA：代替案 { $i } に有限でない値があります

engine-e-mcda-moora-moora-criterion-has-zero-l2 = MOORA：評価基準 { $j } の L2 ノルムがゼロです

## src/mcda/promethee.rs

engine-e-mcda-promethee-promethee-ii-empty-decision-matrix = PROMETHEE II：意思決定行列が空です

engine-e-mcda-promethee-promethee-ii-no-criteria = PROMETHEE II：評価基準がありません

engine-e-mcda-promethee-promethee-ii-weights-but-types = PROMETHEE II：重みが { $n } 個、種別が { $types } 個、選好関数が { $prefs } 個あります

engine-e-mcda-promethee-promethee-ii-alternative-has-values = PROMETHEE II：代替案 { $i } の値は { $row } 個ですが、評価基準は { $n } 個です

engine-e-mcda-promethee-promethee-ii-alternative-has-non = PROMETHEE II：代替案 { $i } に有限でない値があります

## src/mcda/topsis.rs

engine-e-mcda-topsis-topsis-empty-decision-matrix = TOPSIS：意思決定行列が空です

engine-e-mcda-topsis-topsis-no-criteria = TOPSIS：評価基準がありません

engine-e-mcda-topsis-topsis-weights-but-criterion-types = TOPSIS：重みが { $n } 個、評価基準の種別が { $types } 個あります

engine-e-mcda-topsis-topsis-alternative-has-values-but = TOPSIS：代替案 { $i } の値は { $row } 個ですが、評価基準は { $n } 個です

engine-e-mcda-topsis-topsis-alternative-has-non-finite = TOPSIS：代替案 { $i } に有限でない値があります

## src/mcda/utility.rs

engine-e-mcda-utility-additive-utility-has-no-attributes = 加法型効用に属性がありません

engine-e-mcda-utility-attributes-but-weights = 属性が { $attributes } 個、重みが { $weights } 個あります

engine-e-mcda-utility-invalid-scaling-constant = スケーリング定数 { $w } が無効です

engine-e-mcda-utility-scaling-constants-sum-to-zero = スケーリング定数の合計がゼロです

engine-e-mcda-utility-attribute-values-expected-got = 属性値は { $attributes } 個が必要ですが、{ $x } 個でした

## src/mcda/vikor.rs

engine-e-mcda-vikor-vikor-empty-decision-matrix = VIKOR：意思決定行列が空です

engine-e-mcda-vikor-vikor-no-criteria = VIKOR：評価基準がありません

engine-e-mcda-vikor-vikor-weights-but-criterion-types = VIKOR：重みが { $n } 個、評価基準の種別が { $types } 個あります

engine-e-mcda-vikor-vikor-alternative-has-values-but = VIKOR：代替案 { $i } の値は { $row } 個ですが、評価基準は { $n } 個です

engine-e-mcda-vikor-vikor-alternative-has-non-finite = VIKOR：代替案 { $i } に有限でない値があります

## src/mcda/waspas.rs

engine-e-mcda-waspas-waspas-empty-decision-matrix = WASPAS：意思決定行列が空です

engine-e-mcda-waspas-waspas-no-criteria = WASPAS：評価基準がありません

engine-e-mcda-waspas-waspas-weights-but-criterion-types = WASPAS：重みが { $n } 個、評価基準の種別が { $types } 個あります

engine-e-mcda-waspas-waspas-lambda-must-lie-in = WASPAS：lambda { $lambda } は [0, 1] の範囲でなければなりません

engine-e-mcda-waspas-waspas-alternative-has-values-but = WASPAS：代替案 { $i } の値は { $row } 個ですが、評価基準は { $n } 個です

engine-e-mcda-waspas-waspas-alternative-criterion-value-must = WASPAS：代替案 { $i } の評価基準 { $j } の値 { $x } は有限で > 0 でなければなりません

## src/mcda/wpm.rs

engine-e-mcda-wpm-wpm-empty-decision-matrix = WPM：意思決定行列が空です

engine-e-mcda-wpm-wpm-no-criteria = WPM：評価基準がありません

engine-e-mcda-wpm-wpm-weights-but-criterion-types = WPM：重みが { $n } 個、評価基準の種別が { $types } 個あります

engine-e-mcda-wpm-wpm-alternative-has-values-but = WPM：代替案 { $i } の値は { $row } 個ですが、評価基準は { $n } 個です

engine-e-mcda-wpm-wpm-alternative-criterion-value-must = WPM：代替案 { $i } の評価基準 { $j } の値 { $x } は有限で > 0 でなければなりません

## src/mcda/wsm.rs

engine-e-mcda-wsm-decision-matrix-has-no-criteria = 意思決定行列に評価基準がありません

engine-e-mcda-wsm-decision-matrix-has-no-alternatives = 意思決定行列に代替案がありません

engine-e-mcda-wsm-criterion-has-an-invalid-weight = 評価基準 '{ $name }' の重み { $weight } が無効です

engine-e-mcda-wsm-criterion-weights-sum-to-zero = 評価基準の重みの合計がゼロです

engine-e-mcda-wsm-alternative-has-values-but-there = 代替案 '{ $name }' の値は { $values } 個ですが、評価基準は { $n } 個です

engine-e-mcda-wsm-alternative-has-non-finite-value = 代替案 '{ $name }' の評価基準 '{ $value }' に有限でない値があります

## src/naif_kernel.rs

engine-e-naif-kernel-not-daf-shorter-than-one = DAF ではありません：一レコードより短いです

engine-e-naif-kernel-not-daf-identification-word = DAF ではありません：識別ワード { $id_word }

engine-e-naif-kernel-unsupported-daf-binary-format = 未対応の DAF バイナリ形式 { $other }

engine-e-naif-kernel-implausible-daf-header-nd-ni = DAF ヘッダーの値が不自然です：ND { $nd }、NI { $ni }、FWARD { $fward }

engine-e-naif-kernel-daf-address-beyond-the-end = DAF アドレス { $addr } がファイルの終端を超えています

engine-e-naif-kernel-bad-daf-address-range = DAF アドレス範囲 { $first }..={ $last } が不正です

engine-e-naif-kernel-daf-summary-list-does-not = DAF サマリーリストが終端しません

engine-e-naif-kernel-daf-summary-record-claims-summaries = DAF サマリーレコード { $rec } がサマリー { $count } 個を宣言しています

engine-e-naif-kernel-malformed-type-segment-rsize-intlen = 不正な type-2 セグメント：RSIZE { $rsize }、INTLEN { $intlen }、N { $n }

engine-e-naif-kernel-type-segment-size-does-not = type-2 セグメントのサイズがディレクトリと一致しません

engine-e-naif-kernel-epoch-outside-the-record = エポック { $et } がレコード [{ $v1 }, { $v2 }] の範囲外です

engine-e-naif-kernel-type-segment-size-does-not-2 = type-1 セグメントのサイズが N = { $n } と一致しません

engine-e-naif-kernel-malformed-type-record-kqmax1-kq = 不正な type-1 レコード：KQMAX1 { $kqmax1 }、KQ { $kq }

engine-e-naif-kernel-not-an-spk = SPK ではありません：{ $id_word }

engine-e-naif-kernel-spk-summary-is-not-nd = SPK サマリーが ND=2, NI=6 ではありません

engine-e-naif-kernel-no-spk-type-data-for = 天体 { $target } の ET { $et } に対する SPK type-1/2 データがありません

engine-e-naif-kernel-spk-segment-for-is-in = { $target } の SPK セグメントはフレーム { $frame } にあり、J2000 ではありません

engine-e-naif-kernel-spk-centre-chain-does-not = SPK の中心天体の連鎖が重心に到達しません

engine-e-naif-kernel-not-binary-pck = バイナリ PCK ではありません：{ $id_word }

engine-e-naif-kernel-pck-summary-is-not-nd = PCK サマリーが ND=2, NI=5 ではありません

engine-e-naif-kernel-no-pck-type-data-for = フレーム { $body_frame } の ET { $et } に対する PCK type-2 データがありません

engine-e-naif-kernel-pck-frame-is-given-against = PCK フレーム { $body_frame } はフレーム { $other } を基準に与えられており、これは J2000 でも ECLIPJ2000 でもありません

## src/navsignal.rs

engine-e-navsignal-bad-number = 不正な数値 { $s }

engine-e-navsignal-must-be-positive-number = { $s } は正の数でなければなりません

engine-e-navsignal-modulation-expected-name-args-bpsk = 変調 { $label }：NAME(args) の形式が必要です（例：BPSK(10)）

engine-e-navsignal-modulation-missing-closing-parenthesis = 変調 { $label }：閉じ括弧がありません

engine-e-navsignal-modulation-is-not-one-of = 変調 { $label } は BPSK(n)、BOC(m,n)、MBOC(6,1,p) のいずれでもありません

## src/ndm_xml.rs

engine-e-ndm-xml-unterminated-entity-in = { $s } のエンティティが終端していません

engine-e-ndm-xml-bad-character-reference = 不正な文字参照 &{ $ent };

engine-e-ndm-xml-unknown-entity = 不明なエンティティ &{ $ent };

engine-e-ndm-xml-unterminated-processing-instruction = 処理命令が終端していません

engine-e-ndm-xml-unterminated-comment = コメントが終端していません

engine-e-ndm-xml-unterminated-declaration = 宣言が終端していません

engine-e-ndm-xml-expected-an-element-at-byte = バイト { $pos } に要素が必要です

engine-e-ndm-xml-unterminated-start-tag = 開始タグが終端していません

engine-e-ndm-xml-attribute-without-value = 値のない属性があります

engine-e-ndm-xml-unterminated-attribute-value = 属性値が終端していません

engine-e-ndm-xml-unterminated-end-tag = 終了タグが終端していません

engine-e-ndm-xml-unterminated-cdata = CDATA が終端していません

engine-e-ndm-xml-content-after-the-root-element = ルート要素の後に内容があります

## src/nma_budget.rs

engine-e-nma-budget-must-be-finite-and-non = { $name } は有限で、負であってはなりません

engine-e-nma-budget-subframe-must-be-positive = subframe_s は正の値でなければなりません

engine-e-nma-budget-nav-data-rate-bps-must = nav_data_rate_bps は正の値でなければなりません

## src/nmea_synth/cli.rs

engine-e-nmea-synth-cli-speed-must-be-or-positive = --speed は 0 または正の値でなければなりません

engine-e-nmea-synth-cli-unexpected-argument = 想定外の引数 { $s }

engine-nmea-synth-cli-instructor-log = 教官ログ：{ $e }

engine-nmea-synth-cli-instructor-log-and = 教官ログ：{ $jp } と { $tp }

engine-nmea-synth-cli-tcp-server-listening-on-waiting = TCP サーバーが { $s } で待ち受け中；クライアント { $wait_clients } 件を待機しています

## src/nmea_synth/clock.rs

engine-e-nmea-synth-clock-expected-yyyy-mm-ddthh-mm = YYYY-MM-DDTHH:MM:SSZ の形式が必要です

engine-e-nmea-synth-clock-date-or-time-out-of = 日付または時刻が範囲外です（1980 年から 2099 年）

engine-e-nmea-synth-clock-no-such-calendar-date = そのような暦日は存在しません

## src/nmea_synth/config.rs

engine-e-nmea-synth-config-must-be-finite-number = { $name } は有限の数でなければなりません

engine-e-nmea-synth-config-scenario-start-utc = scenario.start_utc { $start_utc }：{ $e }

engine-e-nmea-synth-config-scenario-duration-must-lie-in = scenario.duration_s は 1 から 86400 s の範囲でなければなりません

engine-e-nmea-synth-config-scenario-rate-hz-must-be = scenario.rate_hz は 1、2、5、10 のいずれかでなければなりません

engine-e-nmea-synth-config-vessel-position-must-lie-within = 船舶の位置は赤道から 89 度以内でなければなりません

engine-e-nmea-synth-config-vessel-speed-kn-must-lie = vessel.speed_kn は 0 から 60 の範囲でなければなりません

engine-e-nmea-synth-config-vessel-rate-of-turn-and = 船舶の回頭角速度と加速度の上限は正の値でなければなりません

engine-e-nmea-synth-config-give-at-least-one-waypoint = [[waypoint]] または vessel.heading_deg を少なくとも一つ指定してください

engine-e-nmea-synth-config-waypoint-is-out-of-range = waypoint { $v1 } が範囲外です

engine-e-nmea-synth-config-waypoint-speed-kn-must-lie = waypoint { $v1 } の speed_kn は 0 から 60 の範囲でなければなりません

engine-e-nmea-synth-config-receiver-systems-must-name-at = receiver.systems には少なくとも一つの衛星コンステレーションを指定してください

engine-e-nmea-synth-config-output-sentences-is-not-one = output.sentences：{ $s } は { $all_sentences } のいずれでもありません

engine-e-nmea-synth-config-output-log-interval-must-be = output.log_interval_s は 1 以上でなければなりません

engine-e-nmea-synth-config-event = イベント { $v1 }（{ $kind }）：{ $why }

engine-e-nmea-synth-config-start-must-lie-inside-the = start_s は実行期間内でなければなりません

engine-e-nmea-synth-config-duration-must-be-positive-ramp = duration_s は正の値で、ramp_s と recovery_s は負であってはなりません

engine-e-nmea-synth-config-ramp-must-not-exceed-duration = ramp_s は duration_s を超えてはなりません

engine-e-nmea-synth-config-does-not-apply-to-this = { $n } はこの kind には適用されません

engine-e-nmea-synth-config-counterfeit-cn0-dbhz-must-lie = counterfeit_cn0_dbhz は 20 から 60 の範囲でなければなりません

engine-e-nmea-synth-config-cn0-drop-db-is-required = cn0_drop_db は必須です

engine-e-nmea-synth-config-cn0-drop-db-must-lie = cn0_drop_db は 0 から 80 の範囲でなければなりません

engine-e-nmea-synth-config-spread-db-must-lie-in = spread_db は 0 から 30 の範囲でなければなりません

engine-e-nmea-synth-config-final-offset-is-required = final_offset_m は必須です

engine-e-nmea-synth-config-final-offset-must-lie-in = final_offset_m は 0 から 500000 の範囲でなければなりません

engine-e-nmea-synth-config-the-drag-would-accelerate-the = 引き離しにより偽の航跡が最大 { $need } m/s^2 で加速され、max_accel_mps2 = { $a } を超えます。ramp_s/recovery_s を長くしてください

engine-e-nmea-synth-config-give-exactly-one-of-bearing = bearing_deg と relative_bearing_deg のうち、ちょうど一つを指定してください

engine-e-nmea-synth-config-offset-is-required = offset_s は必須です

engine-e-nmea-synth-config-offset-must-be-non-zero = offset_s はゼロ以外で、一日以内でなければなりません

engine-e-nmea-synth-config-delay-is-required = delay_s は必須です

engine-e-nmea-synth-config-delay-must-lie-in-to = delay_s は 0 から 3600 の範囲でなければなりません

engine-e-nmea-synth-config-the-skyline-describes-no-obstruction = スカイラインに遮蔽物の記述がありません

## src/nmea_synth/gen.rs

engine-nmea-synth-gen-has-ended = { $kind } が終了しました

engine-nmea-synth-gen-the-receiver-reports-fix-again = 受信機が再び測位解を報告しています（使用衛星 { $n_used } 機）

engine-nmea-synth-gen-the-receiver-has-no-fix = 受信機に測位解がありません（使用可能な衛星 { $n_used } 機、必要数は四機）

## src/nmea_synth/log.rs

engine-nmea-synth-log-from-for-onset-ramp-recovery = T+{ $start_s } s から { $duration_s } s 間（開始ランプ { $ramp_s } s、回復ランプ { $recovery_s } s）

engine-nmea-synth-log-every-tracked-satellite-shows-db = ；追跡中のすべての衛星は継続する間 { $c } dB-Hz を示します

engine-nmea-synth-log-jamming-received-n0-falls-by = ジャミング：受信 C/N0 が最大 { $cn0_drop_db } dB 低下します（衛星ごとのばらつき { $spread_db } dB）。衛星は脱落し、使用可能な衛星が四機を下回ると測位解が失われます

engine-nmea-synth-log-towards-deg-true = 真方位 { $b } deg の方向へ

engine-nmea-synth-log-towards-deg-true-deg-relative = 真方位 { $t } deg の方向へ（開始時の針路に対して相対 { $r } deg、その後は保持）

engine-nmea-synth-log-position-drag-off-the-reported = 位置の引き離し：受信機が有効な測位解を保ったまま、報告位置が { $dir }に { $final_offset_m } m 離れていきます（偽の航跡のピークは { $pv } m/s と { $pa } m/s^2）{ $cf }

engine-nmea-synth-log-time-spoof-reported-utc-moves = 時刻スプーフィング：報告される UTC が真値から { $offset_s } s ずれます。位置は真値のままです{ $cf }

engine-nmea-synth-log-replay-delay-meaconing-style-position = リプレイ遅延（ミーコニング方式）：位置{ $v1 }は真値より { $delay_s } s 遅れます{ $cf }

engine-nmea-synth-log-natural-degradation-the-sky-closes = 自然な劣化：明示されたスカイラインの背後で空が遮られます（{ $e }）。背後の衛星は SNR なしでリストに残り使用されず、その他の C/N0 は変わらず、偽装されたものはありません

engine-nmea-synth-log-instructor-log = 教官ログ：{ $scenario }{ "\u000A" }

engine-nmea-synth-log-trainer-note = 訓練者メモ：{ $trainer_note }{ "\u000A\u000A" }

engine-nmea-synth-log-start-duration-seed = 開始 { $start_utc }   継続時間 { $duration_s } s   シード { $seed }{ "\u000A\u000A" }

engine-nmea-synth-log-peaks-true-kn-reported-kn = { "\u000A" }ピーク  真値：{ $true_peak_sog_kn } kn、{ $true_peak_accel_mps2 } m/s^2   報告値：{ $reported_peak_sog_kn } kn、{ $reported_peak_accel_mps2 } m/s^2{ "\u000A" }

## src/nmea_synth/sky.rs

engine-e-nmea-synth-sky-receiver-systems-unknown-constellation-gps = receiver.systems：不明な衛星コンステレーション { $other }（gps、glonass、galileo、beidou）

## src/observability_gramian.rs

engine-observability-gramian-the-tolerance-is-below-the = { " " }許容差が f64 のランク判定ノイズフロア { $RANK_TOLERANCE_NOISE_FLOOR }（= sqrt(f64::EPSILON)）を下回っています。等価な固有値の下限 rel_tol^2 = { $v1 } はグラム行列の丸めノイズの下にあるため、余分な方向は観測可能性ではなく演算上の残差です。

engine-observability-gramian-rank-clamped-from-the-singular = ランクを特異値の個数 { $counted } から min(rows, cols) = min({ $n_rows }, { $n_cols }) = { $shape_bound }（rel_tol { $rel_tol }）に制限しました：{ $n_rows }x{ $n_cols } の行列はランク { $counted } を持てません。{ $floor_note }

engine-observability-gramian-gdop-undefined-rank-deficient-singular = GDOP は未定義です（ランク不足 / 特異な幾何）：状態 { $n } 個のうちランク { $rank }、測地系の欠損 { $v3 }、条件数 { $v4 }

## src/odf.rs

engine-e-odf-bytes-is-not-whole-number = { $bytes } バイトは 36 バイトのレコードの整数個分ではありません

engine-e-odf-record-precedes-any-group-header = レコード { $v1 } がどのグループヘッダーよりも前にあります

engine-e-odf-no-orbit-data-group = 軌道データグループがありません

## src/odm.rs

engine-e-odm-is-not-keyword-of = { $k } は { $name } のキーワードではありません

engine-e-odm-without = { $name } に { $k } がありません

engine-e-odm-needs-exactly-one-of = { $name } には { $group } のうちちょうど一つが必要です

engine-e-odm-classification-and-message-id-are = CLASSIFICATION と MESSAGE_ID はバージョン 3.0 のヘッダーキーワードです（バージョン { $version }）

engine-e-odm-unexpected-line = 想定外の行 { $b }

engine-e-odm-unknown-keyword = 不明なキーワード { $k }

engine-e-odm-block-repeated-or-out-of = { $block } ブロックが { $key } で重複または順序違反です

engine-e-odm-repeated = { $key } が重複しています

engine-e-odm-comments-after-the-last-keyword = 最後のキーワードの後にコメントがあります

engine-e-odm-given-twice = { $b } が二回指定されています

engine-e-odm-opm-without-metadata = メタデータのない OPM です

engine-e-odm-opm-without-state-vector = 状態ベクトルのない OPM です

engine-e-odm-omm-without-metadata = メタデータのない OMM です

engine-e-odm-omm-without-mean-elements = 平均軌道要素のない OMM です

engine-e-odm-is-not-keyword-of-the = { $k } は { $kind } ブロックのキーワードではありません

engine-e-odm-block-without = { $kind } ブロックに { $k } がありません

engine-e-odm-block-with-data-lines = データ行を持つ { $kind } ブロックです

engine-e-odm-line-has-values-expected = { $kind } の行 { $l } の値は { $l2 } 個ですが、期待値は { $n } 個です

engine-e-odm-is-not-an-ocm-metadata = { $k } は OCM メタデータのキーワードではありません

engine-e-odm-ocm-metadata-without = OCM メタデータに { $k } がありません

engine-e-odm-block-repeated = { $kind } ブロックが重複しています

engine-e-odm-inside-block = { $t } がブロック内にあります

engine-e-odm-unsupported-ocm-block = 未対応の OCM ブロック { $tag }

engine-odm-outside-block = { $t } がブロックの外にあります

engine-e-odm-closes-block = { $t } が { $want } ブロックを閉じています

engine-e-odm-unexpected-line-2 = 想定外の行 { $t }

engine-e-odm-outside-block = { $k } がブロックの外にあります

engine-e-odm-unterminated-block = ブロックが終端していません

## src/oem.rs

engine-e-oem-epoch-missing-date-time-separator = エポックに日付と時刻の区切り 'T' がありません：{ $s }

engine-e-oem-unsupported-oem-epoch-date-expected = 未対応の OEM エポック日付 '{ $date }'（yyyy-mm-dd の形式が必要です）

engine-e-oem-unsupported-oem-epoch-time-expected = 未対応の OEM エポック時刻 '{ $time }'（HH:MM:SS の形式が必要です）

engine-e-oem-bad-epoch-year = エポックの年が不正です：{ $d }

engine-e-oem-bad-epoch-month = エポックの月が不正です：{ $d }

engine-e-oem-bad-epoch-day = エポックの日が不正です：{ $d }

engine-e-oem-bad-epoch-hour = エポックの時が不正です：{ $t }

engine-e-oem-bad-epoch-minute = エポックの分が不正です：{ $t }

engine-e-oem-bad-epoch-second = エポックの秒が不正です：{ $t }

engine-e-oem-oem-epoch-field-out-of = OEM のエポックフィールドが範囲外です：{ $s }

engine-e-oem-unexpected-oem-header-line = 想定外の OEM ヘッダー行：{ $line }

engine-e-oem-expected-meta-start-found = META_START が必要ですが、次の行でした：{ $line }

engine-e-oem-unexpected-oem-metadata-line = 想定外の OEM メタデータ行：{ $line }

engine-e-oem-oem-segment-metadata-missing-meta = OEM セグメントのメタデータに META_STOP がありません

engine-e-oem-oem-metadata-missing-object-name = OEM メタデータに OBJECT_NAME がありません

engine-e-oem-oem-metadata-missing-object-id = OEM メタデータに OBJECT_ID がありません

engine-e-oem-oem-metadata-missing-center-name = OEM メタデータに CENTER_NAME がありません

engine-e-oem-oem-metadata-missing-ref-frame = OEM メタデータに REF_FRAME がありません

engine-e-oem-oem-metadata-missing-time-system = OEM メタデータに TIME_SYSTEM がありません

engine-e-oem-oem-metadata-missing-start-time = OEM メタデータに START_TIME がありません

engine-e-oem-oem-metadata-missing-stop-time = OEM メタデータに STOP_TIME がありません

engine-e-oem-oem-data-line-needs-position = OEM のデータ行には位置+速度（6）または +加速度（9）の成分が必要ですが、{ $n } 個でした：{ $line }

engine-e-oem-non-numeric-oem-state-value = OEM の状態値 '{ $t }' が数値ではありません（行：{ $line }）

engine-e-oem-oem-missing-ccsds-oem-vers = OEM に CCSDS_OEM_VERS ヘッダーがありません

engine-e-oem-oem-missing-creation-date-header = OEM に CREATION_DATE ヘッダーがありません

engine-e-oem-oem-missing-originator-header = OEM に ORIGINATOR ヘッダーがありません

engine-e-oem-oem-carried-no-segments = OEM にセグメントがありません

engine-oem-oem-interop-round-tripped-segment = oem-interop：セグメント { $segments } 件、状態 { $n_states_total } 個を往復変換；最大往復誤差 { $p } km / { $v } km/s（MODELLED、相互運用）

engine-oem-oem-interop-ingested-segment-states = oem-interop：外部 OEM（作成者 { $originator }）からセグメント { $segments } 件、状態 { $n_states_total } 個を取り込み（MODELLED、相互運用）

engine-e-oem-no-covariance-start-block = COVARIANCE_START ブロックがありません

engine-e-oem-no-covariance-stop = COVARIANCE_STOP がありません

engine-e-oem-bad-covariance-value = 共分散の値 '{ $tok }' が不正です：{ $e }

engine-e-oem-expected-21-covariance-values-found = 共分散の値は 21 個が必要ですが、{ $vals } 個でした

## src/omm.rs

engine-e-omm-omm-export-needs-full-line = OMM のエクスポートには完全な（1 行目 + 2 行目の）TLE が必要です。このブロックにはありません

## src/optical_atmosphere_scenario.rs

engine-e-optical-atmosphere-scenario-must-be-in = { $n } は [0, 1] の範囲でなければなりません

engine-e-optical-atmosphere-scenario-elevation-deg-must-be-in = elevation_deg は [5, 90] の範囲でなければなりません

engine-e-optical-atmosphere-scenario-atmosphere-wave-must-be-plane = atmosphere.wave は "plane" または "spherical" でなければなりません

engine-e-optical-atmosphere-scenario-atmosphere-direction-must-be-downlink = atmosphere.direction は "downlink" または "uplink" でなければなりません

engine-e-optical-atmosphere-scenario-availability-targets-pct-entries-must = availability_targets_pct の要素は (0, 100) の範囲でなければなりません

engine-e-optical-atmosphere-scenario-timeseries-duration-must-be-at = timeseries.duration_h は 8760（一年）以下でなければなりません

engine-e-optical-atmosphere-scenario-timeseries-steps-is-above-the = timeseries：ステップ数 { $steps } は結果が保持できる { $MAX_STEPS } を超えています。step_s を大きくするか duration_h を短くしてください

engine-e-optical-atmosphere-scenario-unknown-clock-class = 不明なクロッククラス "{ $c }"

engine-e-optical-atmosphere-scenario-every-site-needs-name = すべてのサイトに名前が必要です

engine-e-optical-atmosphere-scenario-site-latitude-longitude-out-of = サイト { $name }：緯度・経度が範囲外です

engine-e-optical-atmosphere-scenario-site-altitude-must-be-in = サイト { $name }：altitude_m は [0, top) の範囲でなければなりません

engine-optical-atmosphere-scenario-optical-atmosphere-nm-at-deg = optical-atmosphere：{ $wavelength_nm } nm、仰角 { $elevation_deg } deg、大気通過前のマージン { $margin0 } dB；最良サイト { $scn } { $v5 } %；{ $order } 地点ネットワーク { $last } %（独立）/ { $last2 } %（相関のある気象）（MODELLED、助言）

## src/orbit.rs

engine-e-orbit-rinex-block-parsed-but-contained = rinex ブロックは解析されましたが、対応するエフェメリスが含まれていませんでした

## src/orbit.rs

engine-e-orbit-user-site-lat-deg-must = user_site：lat_deg は [-90, 90] の範囲で、すべてのフィールドが有限でなければなりません

engine-e-orbit-no-satellites-to-export = エクスポートする衛星がありません

engine-e-orbit-time-step-must-be-positive = SP3 のエクスポートでは time.step_s は正の値でなければなりません

engine-e-orbit-time-step-must-be-positive-2 = OEM のエクスポートでは time.step_s は正の値でなければなりません

## src/orbital_timing.rs

engine-e-orbital-timing-must-be-positive-got = { $name } は正の値でなければなりません。指定値：{ $v }

engine-e-orbital-timing-receiver-time-sigma-must-be = receiver_time_sigma_s は有限で、負であってはなりません

engine-e-orbital-timing-max-ramp-rate-must-be = max_ramp_rate は有限で、負であってはなりません

engine-e-orbital-timing-spoofer-minimum-elevation-must-be = スプーファーの最小仰角は [0, 90) 度の範囲でなければなりません

engine-e-orbital-timing-cross-check-sigma-ns-must = クロスチェックの sigma_ns は有限で、負であってはなりません

engine-orbital-timing-the-in-plane-neighbour-degrees = 同一軌道面内の隣接衛星（{ $v1 } 度先行）は、単一のスプーファーの照射範囲（直径 { $v2 } 度）の外にあります

engine-orbital-timing-the-in-plane-neighbour-degrees-2 = 同一軌道面内の隣接衛星（{ $v1 } 度先行）は、同じスプーファーの照射範囲（直径 { $v2 } 度）の内側に入り得るため、両方のクロックが同時に引き込まれる可能性があります

## src/osnma/cli.rs

engine-e-osnma-cli-missing-input-file = 入力ファイルがありません

engine-e-osnma-cli-max-time-error-has-no = --max-time-error は --reference-time がないと効果がありません

engine-e-osnma-cli-not-number = 数値ではありません：{ $s }

engine-e-osnma-cli-public-key-must-be-id = 公開鍵は ID:TYPE:HEX の形式でなければなりません

engine-e-osnma-cli-public-key-type-must-be = 公開鍵の種類は p256 または p521 でなければなりません

engine-e-osnma-cli-unknown-format = 不明な形式 { $f }

engine-e-osnma-cli-is-not-text-use-format = { $label } はテキストではありません。UBX ストリームには --format ubx を使用してください

engine-e-osnma-cli-vector-csv-needs-start-gst = ベクトル CSV には --start-gst か、日付入りのファイル名が必要です

engine-osnma-cli-error-cannot-read =
    { $ADVISORY }

    エラー：{ $input } を読み取れません：{ $e }

engine-osnma-cli-galileo-osnma-verification =
    Galileo OSNMA 検証
    { $ADVISORY }{ "\u000A" }

engine-osnma-cli-input-pages = 入力：{ $input }（{ $pages } ページ）

engine-osnma-cli-ubx-frames-nav-pages-decoded = ubx：フレーム { $frames } 件；I/NAV ページ { $inav_pages } 件をデコード、うち { $pages } 件を時刻に配置（CRC 不良 { $bad_crc } 件、配置不能 { $unstamped } 件、時刻の競合 { $time_conflicts } 件）

engine-osnma-cli-overall-nma-status = 全体：{ $status_word }   NMA 状態：{ $nma_status }

engine-osnma-cli-alert-verified-osnma-alert-message = 警報：検証済みの OSNMA 警報メッセージを受信しました。OSNMA データの使用を中止してください。認証されたものとして報告されるデータはありません。

engine-osnma-cli-freshness-not-enforced-no-reference = 鮮度：強制されていません。基準時刻が与えられていないため、サブフレームの時刻は入力から取られ、古いデータのリプレイも認証されてしまいます。

engine-osnma-cli-freshness-sub-frames-within-of = 鮮度：基準時刻 { $v2 } から { $max_err } s 以内のサブフレームを使用します；{ $set_aside } 件は除外されました。基準時刻は単一の時点です。

engine-osnma-cli-satellite-status-authenticated-failed-pending = { "\u000A" }衛星  状態          認証成功  失敗  保留  破棄  最終認証

engine-osnma-cli-epoch-tag-sub-frame-tx = { "\u000A" }エポック（タグのサブフレーム）      tx   データ  adkd  ctr  結果

## src/osnma/input.rs

engine-e-osnma-input-line-expected-fields = { $v1 } 行目：3 つのフィールドが必要です

engine-e-osnma-input-line-bad-svid = { $v1 } 行目：SVID が不正です

engine-e-osnma-input-line-bad-bit-count = { $v1 } 行目：ビット数が不正です

engine-e-osnma-input-line-data-is-not-hex = { $v1 } 行目：データが十六進数ではありません

engine-e-osnma-input-line-bit-count-does-not = { $v1 } 行目：ビット数がデータと一致しません

## src/osnma/verifier.rs

engine-e-osnma-verifier-the-time-tolerance-must-be = 時刻の許容差は一サブフレーム（{ $SUBFRAME_S } s）未満でなければなりません。指定値：{ $t } s

## src/passes.rs

engine-e-passes-itu-834-refraction-is-defined = ITU-R P.834 の屈折は局の高さ 0 から 3 km で定義されています。指定値：{ $h_km } km

engine-e-passes-duration-and-step-must-be = duration_s と step_s は正の値でなければなりません

engine-e-passes-station-lat-deg-must-be = station_lat_deg は [-90, 90] の範囲でなければなりません

engine-e-passes-mask-deg-must-be-in = mask_deg は [0, 90) の範囲でなければなりません

engine-e-passes-duration-hours-must-be-finite = duration_hours は有限の正の値でなければなりません

engine-e-passes-step-must-be-finite-and = step_s は有限の正の値でなければなりません

engine-passes-passes-pass-es-of-km = passes：高度 { $altitude_km } km / 傾斜角 { $inclination_deg }° の軌道の ({ $station_lat_deg }°, { $station_lon_deg }°) 上空、> { $mask_deg }° のパス { $passes } 本（{ $duration_hours } h）；総アクセス時間 { $total_access_s } s (MODELLED)

## src/precise_products.rs

engine-e-precise-products-short-record = { $record } レコードが短すぎます：{ $line }

engine-e-precise-products-bad-number-in = { $line } 内の数値 { $s } が不正です

engine-e-precise-products-bad-field-in = { $line } 内のフィールド { $s } が不正です

engine-e-precise-products-bad-antex-epoch = ANTEX エポック { $s } が不正です

engine-e-precise-products-bad-offset = オフセット { $body } が不正です

## src/propagator.rs

engine-e-propagator-the-ephemeris-provider-has-no = エフェメリス提供元に JD(TT) { $epoch_jd_tt } の地心 { $name } がありません

## src/pvt.rs

engine-pvt-3d-error-rms-max = { " " }| 3D 誤差 RMS { $rms } m（最大 { $max } m）

engine-pvt-post-fit-rms = { " " }| フィット後 RMS { $mean_postfit_rms_m } m

engine-pvt-pvt-sat-nav-epochs-solved = pvt { $r } | 航法衛星 { $n_satellites_nav } 機 | エポック { $epochs_solved }/{ $epochs_total } を解決 | 平均 { $mean_n_used } 機、PDOP { $mean_pdop }{ $acc }

engine-pvt-single-point-positioning-3d-error = 単独測位 — 測量座標に対する 3D 誤差（RMS { $rms_3d_m } m）

engine-pvt-single-point-positioning-post-fit = 単独測位 — フィット後残差 RMS（平均 { $mean_postfit_rms_m } m）

## src/python.rs

engine-e-python-runoutput-array-accessors-need-numpy = RunOutput の配列アクセサには NumPy が必要です（pip install numpy）：{ $e }

engine-e-python-is-not-numeric-array-list = { $path } は数値配列ではありません（数値のリスト、または同じ長さの数値リストのリスト）

engine-e-python-is-not-non-empty-list = { $path } はレコードの空でないリストではありません

engine-e-python-and-must-be-the-same = i と q は同じ長さでなければなりません（{ $i } 対 { $q }）

engine-e-python-not-acquired-statistic-threshold = { $code }：未捕捉（統計量 { $statistic } < しきい値 { $threshold }）

engine-python-design-prn-channels-at-most = { $designs } 個の（設計, PRN）チャネル；スイープごとに最大 256 個まで

engine-python-not-acquired-statistic-threshold = { $code }：未捕捉（統計量 { $statistic } < しきい値 { $threshold }）

engine-e-python-runs-needs-label = runs[{ $i }] には `label` が必要です

engine-e-python-runs-needs-result = runs[{ $i }] には `result` が必要です

engine-e-python-must-be-between-and-32 = { $name } は 0 から 2**32 - 1 の範囲でなければなりません

## src/qtrade.rs

engine-qtrade-seed-quantum-wins-foms = { $scenario } | シード { $seed } | v{ $engine_version } | 量子が優位 { $value }/{ $foms } FoM | { $status }

## src/quantum_devices.rs

engine-quantum-devices-sigma-from = sigma_y(1 s) = { $adev }（出典：{ $refr }）

## src/quantum_trade.rs

engine-e-quantum-trade-unknown-baseline-clock-class-csac = 不明な baseline_clock_class '{ $s }'（csac|uso|dsac|tcxo|ocxo|rafs）

engine-e-quantum-trade-unknown-candidate-clock-class-optical = 不明な candidate_clock_class '{ $other }'（optical-lattice|trapped-ion|mercury-ion）

engine-e-quantum-trade-adev-taus-values-must-be = ADEV の tau と値は有限で > 0 でなければなりません

engine-quantum-trade-quantum-trade-candidate-timing-holdover = quantum-trade | 候補 { $candidate_source } | 時刻ホールドオーバー { $timing_holdover_s }s 対 { $timing_holdover_s2 }s（{ $timing_benefit_x }x） | 慣性 { $inertial_holdover_s }s 対 { $inertial_holdover_s2 }s（{ $inertial_benefit_x }x） | レジリエンス継続時間 { $coast_time_s }s{ $v9 } | MODELLED{ $v10 }

## src/realdata/clk.rs

engine-e-realdata-clk-rinex-clock-file-declares-time = RINEX クロックファイルは時刻系 { $id } を宣言していますが、このリーダーはこれを認識しません（認識するもの：{ $known_clock_time_systems }）。エポックを GPS 時刻として読み取らず、拒否します

engine-e-realdata-clk-rinex-clock-file-has-satellite = RINEX クロックファイルの衛星システムは { $other } で、TIME SYSTEM ID を宣言していません。エポックの時刻系を推測せず、拒否します

engine-e-realdata-clk-rinex-clock-files-declare-different = RINEX クロックファイルが異なる時刻系（{ $s } と { $ts }）を宣言しています。単一の時間軸への結合は拒否します

engine-e-realdata-clk-no-as-or-ar-records = { $id } の AS または AR レコードがありません

engine-e-realdata-clk-short-circular-row = Circular T の行が短すぎます：{ $t }

engine-e-realdata-clk-bad-value-in = { $t } 内の値 { $s } が不正です

engine-e-realdata-clk-no-section-mjd-header-found = Section 1 の MJD ヘッダーが見つかりません

## src/realdata/ion_sdr.rs

engine-e-realdata-ion-sdr-unterminated-closing-tag = 終了タグが終端していません

engine-e-realdata-ion-sdr-unbalanced-closing-tag = 終了タグの対応が取れていません

engine-e-realdata-ion-sdr-unterminated-tag = タグが終端していません

engine-e-realdata-ion-sdr-attribute-value-missing = 属性値がありません

engine-e-realdata-ion-sdr-element-outside-the-document = 要素がドキュメントの外にあります

engine-e-realdata-ion-sdr-text-outside-the-document = テキストがドキュメントの外にあります

engine-e-realdata-ion-sdr-element-left-open = 閉じられていない要素が { $stack } 個あります

engine-e-realdata-ion-sdr-expected-one-root-element-found = ルート要素は一つが必要ですが、{ $n } 個でした

engine-e-realdata-ion-sdr-unknown-frequency-format = 不明な周波数形式 { $f }

engine-e-realdata-ion-sdr-unsupported-encoding = 未対応のエンコーディング { $other }

engine-e-realdata-ion-sdr-streams-only-single-stream-files = ストリームが { $streams } 本：読み取れるのは単一ストリームのファイルのみです

engine-e-realdata-ion-sdr-block-of-cycles-with-header = ヘッダーまたはフッターを伴う { $cycles } サイクルのブロックが繰り返されています。読み取れるのはファイル全体にわたる単一ブロックのみです

engine-e-realdata-ion-sdr-chunk-of-words-of-bytes = チャンク：{ $words_per_chunk } ワード、各 { $word_bytes } バイト

engine-e-realdata-ion-sdr-unsupported-sample-format = 未対応のサンプル形式 { $other }

engine-e-realdata-ion-sdr-quantization-in-packed-bits-per = 量子化 { $quantization }（サンプルあたり { $packed_bits } ビットにパック）

engine-e-realdata-ion-sdr-sample-rate-of-hz-is = サンプルレート { $sample_rate_hz } Hz はレート係数 { $samples_per_lump } の整数倍ではありません

engine-e-realdata-ion-sdr-chunk-holds-no-whole-lump = チャンクに完全なランプが含まれていません

engine-e-realdata-ion-sdr-samples-requested-the-file-holds = サンプル { $start }..{ $v1 } が要求されましたが、ファイルにあるのは { $total } です

## src/realdata/llr_crd.rs

engine-realdata-llr-crd-unreadable-crd-version = CRD バージョン { $f } を読み取れません

engine-realdata-llr-crd-crd-format-version-is-not = CRD 形式バージョン { $v } には対応していません（このリーダーが前提とする record-11 のフィールド順を共有するのは 1 と 2 のみです）

engine-realdata-llr-crd-unreadable-station-id = 局 ID { $f } を読み取れません

engine-realdata-llr-crd-unreadable-time-scale = 時刻尺度 { $f } を読み取れません

engine-realdata-llr-crd-crd-epoch-time-scale-is = CRD エポックの時刻尺度 { $time_scale } は、形式仕様が解析者に認める三つ（3 = UTC(USNO)、4 = UTC(GPS)、7 = UTC(BIH)）のいずれでもありません。UTC としての読み取りは拒否します

engine-realdata-llr-crd-unreadable-h4-field = h4 フィールド { $i } を読み取れません：{ $f }

engine-realdata-llr-crd-unreadable-field = フィールド { $i } を読み取れません：{ $f }

engine-realdata-llr-crd-unreadable-epoch-event = エポックイベント { $f } を読み取れません

engine-realdata-llr-crd-non-physical-time-of-flight = 物理的にあり得ない飛行時間 { $tof }

engine-e-realdata-llr-crd-cannot-read-normal-point-directory = ノーマルポイントのディレクトリ { $dir } を読み取れません：{ $e }

engine-e-realdata-llr-crd-no-npt-normal-point-files = { $dir } に *.npt ノーマルポイントファイルがありません — このシナリオは実際にアーカイブされた測定値を読み込むため、それなしでは実行できません

## src/realdata/lola_dem.rs

engine-e-realdata-lola-dem-bad-number = 不正な数値 '{ $t }'：{ $e }

engine-e-realdata-lola-dem-dem-has-zero-dimension = DEM の次元にゼロがあります

## src/realdata/lugre.rs

engine-e-realdata-lugre-coding-lugre-batch-is-two = コーディング { $encoding }：LuGRE バッチは二の補数です

engine-e-realdata-lugre-bytes-shorter-than-the-iqs = { $bytes } バイト：IQS ヘッダーより短いです

engine-e-realdata-lugre-not-an-iqs-frame = IQS フレームではありません：{ $bytes }

engine-realdata-lugre-sample-rate-metadata-hz-header = サンプルレート：メタデータ { $sample_rate_hz } Hz、ヘッダー { $sampling_freq_hz } Hz

engine-realdata-lugre-quantisation-metadata-bits-header-bits = 量子化：メタデータ { $quantization } ビット、ヘッダー { $quant_bits } ビット

engine-realdata-lugre-centre-frequency-metadata-hz-header = 中心周波数：メタデータ { $center_freq_hz } Hz、ヘッダー { $central_freq_hz } Hz

engine-realdata-lugre-intermediate-frequency-metadata-hz-header = 中間周波数：メタデータ { $translated_freq_hz } Hz、ヘッダー { $intermediate_freq_hz } Hz

engine-realdata-lugre-sample-count-metadata-layout-gives = サンプル数：メタデータのレイアウトでは { $layout }、ヘッダーでは { $n_samples }

engine-realdata-lugre-header-footer-metadata-bytes-format = ヘッダー/フッター：メタデータ { $header_bytes }/{ $footer_bytes } バイト、形式 { $IQS_HEADER_BYTES }/{ $IQS_FOOTER_BYTES }

engine-realdata-lugre-file-length-is-not-header = ファイル長 { $file_len } はヘッダー + { $value } サンプルバイト + フッターと一致しません

engine-realdata-lugre-field-missing = フィールド { $key } がありません

engine-e-realdata-lugre-field-unreadable = フィールド { $key } を読み取れません

engine-realdata-lugre-raw-line = RAW { $v1 } 行目：{ $e }

engine-realdata-lugre-acq-line = ACQ { $v1 } 行目：{ $e }

engine-realdata-lugre-nav-line = NAV { $v1 } 行目：{ $e }

engine-e-realdata-lugre-clk-row-unreadable = CLK { $v1 } 行目：読み取れません

engine-e-realdata-lugre-clk-row-columns-expected = CLK { $v1 } 行目：列が { $v } 個ですが、期待値は 3 個です

## src/realdata/yunnan.rs

engine-e-realdata-yunnan-parse-json = JSON の解析：{ $e }

engine-e-realdata-yunnan-expected-json-object-at-the = トップレベルに JSON オブジェクトが必要です

engine-e-realdata-yunnan-missing-recordtime-array = recordTime 配列がありません

## src/realtime_frame_eop.rs

engine-e-realtime-frame-eop-cannot-read-eop-file = EOP ファイル { $path } を読み取れません：{ $e }

engine-e-realtime-frame-eop-latency-must-be-finite-and = latency_s は有限で、負であってはなりません。指定値：{ $latency_s }

engine-e-realtime-frame-eop-cannot-read-later-vintage-eop = 後続版の EOP ファイル { $path } を読み取れません：{ $e }

engine-realtime-frame-eop-empty-and-deliberately-so-predicted = 空です。意図的にそうしています。予測対最終値の行には、背後に完全な { $window_days } 日のフィット窓を持つ発行エポックと、対象エポックで公表された Bulletin B の最終値が必要です。現在有効な入力（{ $eop_source }）には、その両方を満たすエポックがありません。`operational_window_days` を短くするか、より長い実際の finals2000A 系列を与えてください — 表を埋めるために行が作られることはありません。

engine-realtime-frame-eop-measured-over-the-real-series = 現在有効な実系列（{ $eop_source }）で測定しました。すべての行は本物の予測誤差です：T 以前の速報 Bulletin A の行から作成した T+h の予測を、後から公表された T+h の Bulletin B 最終値と照合して採点しています。持続性予測は同一のエポック集合・同一の最終値で採点しているため、二つの列の違いは予測器のみで、それ以外に違いはありません。`improvement_factor` が 1 を下回る場合、その予測ホライズンでは運用予測器が持続性予測より劣ることを意味し、そのまま報告されます。

engine-realtime-frame-eop-measured-over-genuine-two-vintage = 本物の二つの版のペアで測定しました：発行時点の版（{ $eop_source }）はデータ打ち切り後の実際の Bulletin A 予測を含み、アーカイブされた後続版（{ $c }）はそれらの日付が最終的に得た Bulletin B の最終値を含みます。その最終値に対して三つの予測を採点します — アーカイブされた Bulletin A の予測そのもの、発行時点の版に対するこのクレートの運用型フィット、そして打ち切り時点での持続性予測です。

engine-realtime-frame-eop-empty-and-deliberately-so-later = 空です。意図的にそうしています。後続版が与えられました（{ $c }）が、要求されたどのホライズンにも、発行時点のファイル（{ $eop_source }）で Bulletin A の PREDICTION として、かつ後続版で Bulletin B の最終値として含まれる日付がありません。行は合成されません。

engine-realtime-frame-eop-empty-and-deliberately-so-scoring = 空です。意図的にそうしています。本物のアーカイブ済み予測の採点には、同じ finals2000A 製品の二つの版が必要ですが、この実行には一つ（{ $eop_source }）しか与えられていません。リポジトリにはアーカイブされた以前の版が含まれておらず、手持ちの版に摂動を加えて作ることもしません — 合成したアーカイブでは、この表のすべての数値が摂動の測定になってしまうためです。これを埋めるには、実際にアーカイブされた後続版を `eop_finals2000a_later` で与えてください。それまでは、このレポートが持つ本物の予測対最終値の誤差は `table5_operational_vs_persistence` にあり、そこでは予測はこのクレート自身のもの、真値は後から公表された Bulletin B の最終値です。

engine-realtime-frame-eop-realtime-frame-eop-table-post = realtime-frame-eop | Table 1：事後処理 { $c } m（{ $c2 } ms UT1） ↔ リアルタイム { $c3 } m（{ $c4 } ms UT1） | Table 2：最終値の下限 { $floor } ms → { $far } 日 { $far2 } ms | 総予算 { $total_m } m（{ $total_time_ns } ns） | L19 レバーアーム + L18 実データ（検証済み）、OD 共分散（モデル化）

engine-realtime-frame-eop-measured-over-genuine-two-vintage-2 = 本物の二つの版のペアで測定しました：発行時点のファイル（{ $eop_source }）の Bulletin A による予測 UT1 を、アーカイブされた後続版（{ $c }）の最終的な Bulletin B の最終値と、{ $predicted_vs_final } 件のホライズンで比較しています。

engine-realtime-frame-eop-empty-and-deliberately-so-an = 空です。意図的にそうしています。アーカイブされた後続版が与えられました（{ $c }）が、要求されたどのホライズンにも、発行時点のファイル（{ $eop_source }）で Bulletin A の PREDICTION として、かつ後続版で Bulletin B の最終値として含まれる日付がないため、報告できる予測対最終値の残差がありません。行は合成されません。

engine-realtime-frame-eop-empty-and-deliberately-so-predicted-2 = 空です。意図的にそうしています。予測対最終値の残差には、同じ finals2000A 製品の二つの版が必要です。この実行には一つ（{ $eop_source }）しか与えられていません。その Bulletin A の予測行は Bulletin B の最終値がまだない将来の日付のものであるため、測定すべき残差が存在せず、ここでも作り出しません。この表を埋めるには、アーカイブされた後続版を `eop_finals2000a_later` で与えてください。それまでは、`table2_error_vs_horizon` で報告される複数日にわたる誤差の増加は、実際の最終値に対して採点した持続性予測のものです — 実際に測定された誤差ですが、モデル化された予測器によるものであり、IERS Bulletin A の予測残差ではありません。

## src/receiver_trust/assess.rs

engine-e-receiver-trust-assess-vessel-assessment-needs-platform-kind = 船舶の評価には [platform] kind = "vessel" が必要です

engine-e-receiver-trust-assess-excerpt-is-bytes-the-limit = 抜粋は { $excerpt } バイトで、上限は { $MAX_EXCERPT_BYTES } です

engine-e-receiver-trust-assess-excerpt-holds-more-than-epochs = 抜粋に { $MAX_EXCERPT_EPOCHS } エポックを超えるデータが含まれています。短くしてください

engine-e-receiver-trust-assess-the-excerpt-ends-inside-the = 抜粋が { $calibration_s } s のキャリブレーション窓（{ $epochs } エポック）の途中で終わっています：採点は行われませんでした

## src/receiver_trust/calibration.rs

engine-e-receiver-trust-calibration-run-monitors = run_monitors：{ $e }

engine-e-receiver-trust-calibration-no-utc-labelled-epoch-in = UBX ログに UTC ラベル付きのエポックがありません

engine-e-receiver-trust-calibration-no-scenario-json-under = { $root } 配下に scenario.json がありません

engine-receiver-trust-calibration-b1-held-out-clean-pfa = B1 { $config_field }：ホールドアウトしたクリーンデータの Pfa <= { $B1_MAX_PFA }（キャリブレーション値：{ $r }）

## src/receiver_trust/geometry.rs

engine-e-receiver-trust-geometry-geometry-must-be-finite-and = geometry：{ $name } は有限で > 0 でなければなりません（指定値：{ $v }）

engine-e-receiver-trust-geometry-geometry-reported-vs-derived-rel = geometry：reported_vs_derived_rel は有限で >= 0 でなければなりません（指定値：{ $reported_vs_derived_rel }）

engine-e-receiver-trust-geometry-geometry-min-used-must-be = geometry：min_used は 1 以上でなければなりません

engine-e-receiver-trust-geometry-geometry-low-elev-deg-must = geometry：low_elev_deg は [0, 90] の範囲でなければなりません（指定値：{ $low_elev_deg }）

engine-e-receiver-trust-geometry-geometry-azimuth-gap-deg-must = geometry：azimuth_gap_deg は (0, 360] の範囲でなければなりません（指定値：{ $azimuth_gap_deg }）

engine-e-receiver-trust-geometry-geometry-cap-points-must-be = geometry：cap_points は [0, 100] の範囲でなければなりません（指定値：{ $cap_points }）

engine-e-receiver-trust-geometry-geometry-full-ratio-must-be = geometry：full_ratio は有限で > 1 でなければなりません（指定値：{ $full_ratio }）

engine-e-receiver-trust-geometry-geometry-floor-must-be-in = geometry：floor は (0, 100] の範囲でなければなりません（指定値：{ $f }）

engine-e-receiver-trust-geometry-geometry-floor-is-below-the = geometry：floor（{ $f }）がスコアの degraded_min（{ $degraded_min }）を下回っています：幾何だけで信頼できない帯域に達し得ます

engine-receiver-trust-geometry-geometry-hdop-pdop-vdop-satellites = geometry { $label }：HDOP { $fmt_dop }、PDOP { $fmt_dop2 }、VDOP { $fmt_dop3 }、衛星 { $n_used } 機{ $v6 }

engine-receiver-trust-geometry-the-geometry-deduction-is-classed = { $why }：幾何の減点は不整合に分類されます

engine-receiver-trust-geometry-reported-not-scored-the-geometry = { $why }：報告のみで採点対象外です（幾何は不良ではありません）

engine-receiver-trust-geometry-not-scored-the-score-deducts = 採点対象外（スコアを減点するのは、HDOP { $hdop_max } 超、PDOP { $pdop_max } 超、または衛星数が { $min_used } 未満の場合のみ）

engine-receiver-trust-geometry-derived-from-logged-satellites = 記録された { $n } 機の衛星から導出

engine-receiver-trust-geometry-as-the-receiver-reports-it = 受信機の報告どおり、使用衛星数は { $n } 機

engine-receiver-trust-geometry-the-stated-hdop-disagrees-with = 申告された HDOP { $fmt_dop } は、申告されたスカイから導出した HDOP { $fmt_dop2 } と許容差を超えて一致しません

engine-receiver-trust-geometry-satellites-in-view-but-not = 可視だが追尾されていない衛星（仰角 { $low_elev_deg } deg 以上の { $in_view } 機中 { $g } 機）：信号環境の問題であり、幾何の問題ではありません

engine-receiver-trust-geometry-satellites-fewer-than = 衛星 { $n } 機、{ $min_used } 機未満

engine-receiver-trust-geometry-pdop-above = PDOP { $fmt_dop } は { $pdop_max } 超

engine-receiver-trust-geometry-hdop-above = HDOP { $fmt_dop } は { $hdop_max } 超

engine-receiver-trust-geometry-satellites-behind-the-stated-skyline = 申告されたスカイラインの背後にある衛星：{ $m } 機

engine-receiver-trust-geometry-every-satellite-in-one-half = すべての衛星が空の半分に偏在（ギャップ { $max_azimuth_gap_deg } deg）

engine-receiver-trust-geometry-degraded-by-geometry-not-an = 幾何により劣化：{ $parts }（{ $from }）。不整合ではありません

engine-e-receiver-trust-ingest-the-log-holds-no-epochs = ログにエポックがありません：{ $name } として読み取れるものがありませんでした（破損または解析不能として { $skipped_records } 件のレコードをスキップ）。形式の設定を確認してください

engine-receiver-trust-ingest-gps-week-tow = GPS週 { $week } TOW { $tow } s

engine-receiver-trust-ingest-gps-week-tow-2 = GPS週 { $w } TOW { $tow } s

engine-receiver-trust-ingest-gps-tow = GPS TOW { $tow } s

engine-receiver-trust-ingest-utc-date-not-in-log = { $v1 }:{ $v2 }:{ $v3 }.{ $v4 } UTC（ログに日付なし）

engine-e-receiver-trust-live-live-must-be-finite-and = live：{ $name } は有限かつ 0 以上でなければなりません（実際の値 { $v }）

engine-e-receiver-trust-live-live-idle-flush-must-be = live：idle_flush_s は 0 より大きくなければなりません

engine-e-receiver-trust-live-invalid-session = 無効なセッション：{ $e }

engine-receiver-trust-live-no-score-could-be-produced = スコアを算出できませんでした：{ $msg }

engine-e-receiver-trust-machines-gnss-sdr-no-gnss-sdr-synchro-or = 読み取り可能な GNSS-SDR の synchro または pvt レコードがありませんでした（{ $skipped } 行をスキップ）。行の形式は integrations/gnss-sdr/README.md を参照してください

engine-receiver-trust-machines-gnss-sdr-gps-tow = GPS TOW { $v1 } s

engine-e-receiver-trust-machines-imu-the-imu-file-is-empty = IMU ファイルが空です

engine-e-receiver-trust-machines-imu-imu-csv-no-column = IMU csv：`{ $n }` 列がありません

engine-e-receiver-trust-machines-imu-imu-euroc-no-column = IMU euroc：`{ $n }` 列がありません

engine-e-receiver-trust-machines-imu-the-imu-file-holds-no = IMU ファイルに読み取り可能なサンプルがありません

engine-e-receiver-trust-machines-imu-fit-axis-must-be-or = axis は 0、1、2（x、y、z）のいずれかでなければなりません

engine-e-receiver-trust-machines-imu-fit-expected-mean-must-be-finite = expected_mean は有限でなければなりません

engine-e-receiver-trust-machines-imu-fit-the-log-has-samples-at = ログのサンプルは { $n } 個です。アラン偏差のフィットには少なくとも { $MIN_SAMPLES } 個が必要です

engine-e-receiver-trust-machines-imu-fit-the-log-time-does-not = ログの時刻が進んでいません

engine-e-receiver-trust-machines-imu-fit-the-sample-interval-is-not = サンプル間隔が一定ではありません（{ $n } 個の間隔のうち { $uneven } 個が 25 % を超えて異なります）：先にログをリサンプリングしてください

engine-e-receiver-trust-machines-imu-fit-the-log-is-too-short = ログが短すぎてアラン偏差曲線を作成できません

engine-receiver-trust-machines-imu-fit-the-curve-early-slope-is = { $name } 曲線の初期の傾きは { $v } で、約 -0.5 ではありません：ホワイトノイズが支配的ではなく（センサーは静止していますか？）、ノイズ係数は信頼できません

engine-receiver-trust-machines-imu-fit-the-curve-is-too-short = { $name } 曲線が短すぎて傾きを確認できません

engine-receiver-trust-machines-novatel-gps-week-tow = GPS週 { $week } TOW { $r } s

engine-e-receiver-trust-machines-novatel-no-bestpos-range-or-rxstatus = 読み取り可能な BESTPOS、RANGE、RXSTATUS のログがありませんでした（{ $skipped } 件のレコードをスキップ）

engine-receiver-trust-machines-rtcm3-no-valid-rtcm-frame-was = 有効な RTCM 3 フレームが見つかりませんでした（{ $skipped } 件の候補が CRC に失敗）

engine-e-receiver-trust-maritime-maritime-must-be-finite-and = maritime：{ $name } は有限かつ 0 より大きくなければなりません（実際の値 { $v }）

engine-e-receiver-trust-maritime-maritime-kin-limit-guard-must = maritime：kin_limit_guard は (0, 1) の範囲でなければなりません（実際の値 { $kin_limit_guard }）

engine-e-receiver-trust-maritime-maritime-kin-sog-frac-must = maritime：kin_sog_frac は [0, 1] の範囲でなければなりません（実際の値 { $kin_sog_frac }）

engine-e-receiver-trust-maritime-maritime-must-be-in-got = maritime：{ $name } は (0, 1) の範囲でなければなりません（実際の値 { $v }）

engine-e-receiver-trust-maritime-maritime-cn0-spread-min-sats = maritime：cn0_spread_min_sats は 3 以上でなければなりません

engine-e-receiver-trust-maritime-maritime-kin-window-must-be = maritime：kin_window_s は 2 s 以上でなければなりません

engine-e-receiver-trust-monitors-monitor-config-unknown-profile-known = モニター設定：未知のプロファイル "{ $other }"。既知のプロファイル：{ $threshold_profiles }

engine-e-receiver-trust-monitors-monitor-config-must-be-finite = モニター設定：{ $name } は有限かつ 0 より大きくなければなりません（実際の値 { $v }）

engine-e-receiver-trust-monitors-monitor-config-jam-ind-threshold = モニター設定：jam_ind_threshold は有限でなければなりません

engine-e-receiver-trust-monitors-monitor-config-mask-deg-must = モニター設定：mask_deg は [-90, 90) の範囲でなければなりません（実際の値 { $mask_deg }）

engine-e-receiver-trust-monitors-monitor-config-raim-pfa-must = モニター設定：raim_pfa は (0, 1) の範囲でなければなりません（実際の値 { $raim_pfa }）

engine-e-receiver-trust-monitors-monitor-config-cn0-min-sats = モニター設定：cn0_min_sats は 1 以上でなければなりません

engine-e-receiver-trust-monitors-monitor-config-sats-lost-must = モニター設定：sats_lost は 1 以上でなければなりません

engine-receiver-trust-monitors-the-receiver-own-set-against = 受信機自身の { $self_report_source } の集合と Kshana のモニターの比較です。どちらも真値ではなく、一致は検証ではありません

engine-e-receiver-trust-monitors-receiver-timeline-has-non-finite = 受信機のタイムラインに有限でないエポック時刻があります

engine-e-receiver-trust-monitors-the-log-is-shorter-than = ログが較正ウィンドウより短くなっています：{ $cal_s } s より前のエポックは { $calibration_epochs } 個（ログの長さ { $span } s）。ベースラインの作成には少なくとも 3 個が必要です

engine-e-receiver-trust-platform-platform-must-be-in-got = platform：{ $name } は ({ $lo }, { $hi }] の範囲でなければなりません（実際の値 { $x }）

engine-e-receiver-trust-platform-platform-applies-only-to-kind = platform：{ $name } は kind = "vessel" の場合にのみ適用されます（kind は "static"）

engine-e-receiver-trust-scenario-cannot-read-the-webassembly-build = { $path } を読み取れません：WebAssembly ビルドにはファイルシステムがありません。ファイルを `text` または `base64` としてインラインで渡してください

engine-e-receiver-trust-scenario-base64-is-not-valid-standard = { $what }：`base64` は有効な標準 base64 ではありません

engine-e-receiver-trust-scenario-give-one-of-path-text = { $what }：`path`、`text`、`base64` のいずれか一つを指定してください

engine-e-receiver-trust-scenario-give-only-one-of-path = { $what }：`path`、`text`、`base64` のうち一つだけを指定してください

engine-e-receiver-trust-scenario-must-be-positive-number-got = { $name } は正の数でなければなりません（実際の値 { $v }）

engine-e-receiver-trust-scenario-event-onset-must-be-non = イベント { $label }：onset_s は非負の数でなければなりません

engine-e-receiver-trust-scenario-event-end-must-be-after = イベント { $label }：end_s は onset_s より後でなければなりません

engine-e-receiver-trust-scenario-log-imu-heading0-deg-and = log.imu：heading0_deg と time_offset_s は有限でなければなりません

engine-receiver-trust-scenario-trusted-throughout-no-monitor-alarmed = 全期間を通じて信頼可能：較正後の { $after_cal } エポックでアラームを出したモニターはありません

engine-receiver-trust-scenario-first-alarm-at-untrusted-for = 最初のアラームは { $t } s。較正後の { $after_cal } エポックのうち、信頼不可 { $untrusted_epochs }、劣化 { $degraded_epochs }

engine-receiver-trust-scenario-of-stated-events-detected-within = ；申告されたイベント { $events_evaluable } 件中 { $events_detected } 件を { $detect_tol_s } s 以内に検出

engine-receiver-trust-scenario-of-n0-predictions-within-db = ；C/N0 予測 { $predictions_evaluable } 件中 { $predictions_agreeing } 件が { $cn0_tol_db } dB 以内

engine-receiver-trust-scenario-trust-score-lowest-final = ；信頼スコア：最低 { $min }、最終 { $last }

engine-receiver-trust-scenario-scenario-receiver-trust-log-epochs = シナリオ { $r } | receiver-trust | { $format_name } ログ、{ $epochs } エポック、{ $duration_s } s | モニター { $monitors_run } | { $verdict }

engine-e-receiver-trust-scenario-this-is-scenario-not-receiver = これは { $k } シナリオであり、receiver-trust ではありません

engine-e-receiver-trust-score-score-must-be-finite-got = score：{ $name } は有限でなければなりません（実際の値 { $v }）

engine-e-receiver-trust-score-score-need-degraded-min-nominal = score：0 < degraded_min < nominal_min <= 100 でなければなりません（実際の値 { $degraded_min } と { $nominal_min }）

engine-e-receiver-trust-score-score-evidence-hold-must-be = score：evidence_hold_s は有限かつ 0 以上でなければなりません（実際の値 { $evidence_hold_s }）

engine-e-receiver-trust-score-score-need-onset-ratio-full = score：0 <= onset_ratio < full_ratio でなければなりません（実際の値 { $onset_ratio } と { $full_ratio }）

engine-e-receiver-trust-score-score-weight-of-must-be = score：{ $m } の重みは [0, 100] の範囲でなければなりません（実際の値 { $w }）

engine-e-reentry-entry-velocity-must-be-finite = entry_velocity_m_s は有限かつ正でなければなりません

engine-e-reentry-flight-path-angle-deg-must = flight_path_angle_deg は (0, 90) の範囲でなければなりません

engine-e-reentry-ballistic-coeff-kg-m2-must = ballistic_coeff_kg_m2 は有限かつ正でなければなりません

engine-e-reentry-scale-height-and-rho0-kg = scale_height_m と rho0_kg_m3 は有限かつ正でなければなりません

engine-e-reentry-entry-interface-altitude-must-be = entry_interface_altitude_m は [10 km, 1000 km] の範囲でなければなりません

engine-reentry-reentry-allen-eggers-peak-at = 再突入（Allen–Eggers）：V_e { $v } m/s、γ { $flight_path_angle_deg }° -> ピーク { $v3 } g（{ $v4 } km、{ $velocity_at_peak_deceleration } m/s）。加熱のピークは { $velocity_at_peak_heating } m/s。質点（重力、曲率、US76）のピーク { $peak_deceleration_g } g（MODELLED の弾道計算、空力加熱なし）

engine-e-registry-unknown-scenario-id = 未知のシナリオ ID：{ $id }

engine-representativeness-trl-band-is-not-well = TRL 帯域 ({ $lo },{ $hi }) の形式が正しくありません（0<=lo<=hi<=9 が必要）

engine-representativeness-modelled-simulation-only-claim-cannot = Modelled（シミュレーションのみ）の主張は TRL { $MODELLED_TRL_CEILING } を超えて代表的であるとはできません（帯域上限 hi={ $hi }）。それより高い TRL はギャップであり、シミュレーションの出力ではありません

engine-representativeness-representativeness-representative-for-trl = 代表性 [{ $status }] — { $claim }（TRL { $lo }-{ $hi } に対して代表的）{ "\u000A" }

engine-resilience-score-declared-mean-source-quality = { $t } = 宣言値({ $arch }) x 情報源品質の平均

engine-resilience-score-weakest-rpcf-sub-score-bounded = 最も弱い RPCF サブスコア = { $min_sub }、劣化の有界性 = { $bounded }（非有界の場合はレベル 2 で頭打ち）

engine-e-rinex-unsupported-navigation-record-header-line = 未対応の航法レコードヘッダー { $head }：'>' で始まる行は RINEX 4 のレコードヘッダーであり、RINEX 3 の航法レコードではありません

engine-e-rinex-bad-prn-in = { $head } 内の PRN が不正です

engine-e-rinex-rinex-navigation-expected-record-header = RINEX 4 航法：'>' のレコードヘッダーが必要ですが、{ $head } が見つかりました

engine-e-rinex-rinex-record-has-lines-ephemeris = RINEX 4 レコード { $head } は { $body } 行ですが、{ $msg } エフェメリス（軌道暦）には 8 行が必要です

engine-e-rinex-rinex-record-is-followed-by = RINEX 4 レコード { $head } の後に { $sv } ではなく { $body } が続いています

engine-e-rinex-obs-bad = 不正な { $what }：{ $s }

engine-e-rinex-obs-rinex-observation-file-has-no = RINEX 観測ファイルに END OF HEADER がありません

engine-e-rinex-obs-rinex-observation-file-contained-no = RINEX 観測ファイルにエポックレコードがありませんでした

engine-e-scenario-time-step-must-be-finite = time.step_s は有限かつ 0 より大きくなければなりません（実際の値 { $step_s }）

engine-e-scenario-time-duration-must-be-finite = time.duration_s は有限かつ 0 より大きくなければなりません（実際の値 { $duration_s }）

engine-e-scenario-time-step-must-not-exceed = time.step_s（{ $step_s }）は time.duration_s（{ $duration_s }）を超えてはなりません

engine-e-scenario-time-grid-too-large-steps = 時間グリッドが大きすぎます：{ $n } ステップは MAX_TIME_STEPS（{ $MAX_TIME_STEPS }）を超えています。ステップを粗くするか、継続時間を短くしてください

engine-sdr-sampling-rate-is-commensurate-with = サンプリングレートが符号レートと整数比の関係にあります（{ $samples_per_chip } samples/chip、整数からのずれ { $offset_from_integer_samples } samples）：ゼロ次ホールドの符号レプリカは { $dead_band_chips } chips 未満の符号位相の変化を分解できないため、Early/Late 弁別器は三角形ではなく 一サンプルの不感帯を持つ階段状になり、DLL は誤ったラグに収束します。サンプルレートを整数倍からずらす（5 MHz は 4.8876 samples/chip、25 MHz は 24.4379）か、不感帯が必要な符号位相精度を下回るまで十分にオーバーサンプリングしてください。

engine-e-sgp4-sgp4-error-code = SGP4 エラーコード { $code }

engine-e-sigmf-unsupported-sigmf-core-datatype-this = 未対応の SigMF core:datatype { $other }：このリーダーが扱う複素型は cf32_le、ci16_le、ci8 です

engine-e-sigmf-sigmf-core-num-channels-only = SigMF core:num_channels = { $ch }：読み取れるのは単一チャンネルの記録のみです

engine-e-sigmf-cannot-serialise-sigmf-metadata = SigMF メタデータをシリアライズできません：{ $e }

engine-e-sigmf-invalid-sigmf-extension-namespace = 無効な SigMF 拡張名前空間 { $ns }

engine-e-sigmf-annotation-extension-maps-for-annotations = アノテーション拡張マップが { $annotations } 件、アノテーションが { $annotations2 } 件で一致しません

engine-e-sigmf-extension-key-is-not-in = 拡張キー { $k } は名前空間 { $ns } にありません

engine-e-sigmf-extension-key-is-already-present = 拡張キー { $k } は既に存在します

engine-e-sigmf-global-is-not-an-object = global がオブジェクトではありません

engine-e-sigmf-annotations-is-not-an-array = annotations が配列ではありません

engine-e-sigmf-annotation-is-not-an-object = アノテーションがオブジェクトではありません

engine-e-sigmf-invalid-sigmf-metadata-json = 無効な SigMF メタデータ JSON：{ $e }

engine-e-sigmf-the-sigmf-recording-states-no = SigMF 記録に正の core:sample_rate が記載されていません

engine-e-sigmf-sigmf-capture-starts-at-sample = SigMF キャプチャはサンプル { $start } から始まり、データ内の { $data } サンプルを超えています

engine-e-skyline-skyline-must-be-in-90 = skyline：{ $what } は [0, 90) 度の範囲でなければなりません（実際の値 { $el }）

engine-e-skyline-skyline-must-be-finite-number = skyline：{ $what } は有限の数でなければなりません（実際の値 { $v }）

engine-e-skyline-skyline-canyon-needs-width = skyline：キャニオンには width_m が必要です

engine-e-skyline-skyline-width-must-be-positive = skyline：width_m は正でなければなりません（実際の値 { $width_m }）

engine-e-skyline-skyline-canyon-heights-and-antenna = skyline：キャニオンの高さと antenna_m は非負でなければなりません

engine-e-skyline-skyline-length-must-be-positive = skyline：length_m は正でなければなりません（実際の値 { $l }）

engine-e-skyline-skyline-table-is-empty = skyline：テーブルが空です

engine-e-skyline-skyline-table-has-rows-over = skyline：テーブルは { $rows } 行で、上限の { $MAX_TABLE_ROWS } 行を超えています

engine-e-skyline-skyline-table-azimuth-is-outside = skyline：テーブルの方位角 { $az } が [0, 360) の範囲外です

engine-e-skyline-skyline-table-azimuths-must-be = skyline：テーブルの方位角は厳密に増加していなければなりません（{ $prev } の次が { $az }）

engine-e-skyline-skyline-more-than-sectors = skyline：セクターが { $MAX_SECTORS } 個を超えています

engine-e-skyline-skyline-the-sector-az-from = skyline：セクター az_from = { $az_from } から az_to = { $az_to } は空です（全周はテーブルまたはマスクで表します）

engine-e-skyline-skyline-more-than-terrain-points = skyline：地形点が { $MAX_TABLE_ROWS } 点を超えています

engine-e-skyline-skyline-terrain-distance-must-be = skyline：地形の distance_m は正でなければなりません（実際の値 { $distance_m }）

engine-skyline-with-fields-overridden-or-added = { $provenance }。{ $user } によりフィールドが上書きまたは追加されています

engine-skyline-stated-input = 申告された入力：{ $user }

engine-e-skyline-unknown-skyline-preset-known-presets = 未知のスカイラインプリセット "{ $name }"。既知のプリセット：{ $preset_names }

engine-e-slot-timing-datasheet-needs-at-least-two = データシートにはアラン偏差の点が少なくとも二つ必要です

engine-e-slot-timing-datasheet-point-must-have-positive = データシートの点 ({ $t }, { $s }) は、正の平均化時間と正のアラン偏差を持たなければなりません

engine-e-slot-timing-tau0-must-be-positive-number = tau0_s は正の秒数でなければなりません

engine-e-slot-timing-phase-record-needs-at-least = ノイズモデルをフィットするには、位相記録に少なくとも 32 サンプルが必要です。実際の値 { $phase_s }

engine-e-slot-timing-the-phase-record-contains-non = 位相記録に有限でないサンプルが含まれています

engine-e-slot-timing-the-phase-record-yields-fewer = 位相記録から得られるアラン偏差の点が三つ未満です

engine-e-slot-timing-must-be-finite-and-non = { $name } は有限かつ非負でなければなりません。実際の値 { $v }

engine-e-slot-timing-the-slot-guard-must-be = スロットガードは正の時間でなければなりません

engine-e-slot-timing-sigma-must-be-positive = k_sigma は正でなければなりません

engine-e-slot-timing-residual-frequency-offset-must-be = residual_frequency_offset は有限でなければなりません

engine-e-slot-timing-temperature-excursion-must-be-finite = temperature_excursion_k は有限でなければなりません

engine-e-slot-timing-give-exactly-one-of-oscillator = oscillator.class、oscillator.preset、oscillator.datasheet、oscillator.record のうちちょうど一つを指定してください

engine-e-slot-timing-unknown-oscillator-class-csac-uso = 未知の oscillator.class '{ $id }'（csac|uso|dsac|tcxo|ocxo|rafs）

engine-e-slot-timing-unknown-oscillator-preset-ocxo-rubidium = 未知の oscillator.preset '{ $id }'（ocxo|rubidium|caesium|csac）

engine-slot-timing-class-default-sigma-from-red = { $c } クラスの既定値：sigma_y(1 s) は { $c2 } から。レッドノイズの下限は、それより二桁および四桁下に合成されています（仮定であり、測定ではありません）

engine-slot-timing-fitted-to-the-allan-deviation = { $document } のアラン偏差の最大値にフィットし、すべての点以上になるようスケーリング

engine-slot-timing-fitted-to-the-overlapping-allan = { $tau0_s } s の { $n_samples } サンプル記録のオーバーラップアラン偏差に、IEEE Std 1139 の周波数変調基準でフィット

engine-slot-timing-slot-timing-source-guard-ns = スロットタイミング（{ $n } 源）：ガード { $c } ns、k={ $k_sigma } では、フィックス後 { $fmt_s } で破綻（残り { $fmt_s2 }）。少なくとも { $fmt_s3 } ごとにフィックスが必要（一日あたり { $fixes_per_day }）。支配的な項：{ $b }{ $v9 }

engine-e-solar-system-epoch-must-be-yyyy-mm = エポック '{ $s }' は YYYY-MM-DDTHH:MM:SS 形式でなければなりません

engine-solar-system-epoch-bad = エポック '{ $s }'：不正な { $what } '{ $v }'

engine-e-solar-system-epoch-jd-tdb-must-be = epoch_jd_tdb は有限でなければなりません

engine-e-solar-system-table-must-be-auto-table1 = table は auto、table1、table2 のいずれかでなければなりません。実際の値 '{ $v }'

engine-solar-system-no-ephemeris-for-the-to = JD { $jd_tdb } TDB における { $name } から { $name2 } へのリンクのエフェメリス（軌道暦）がありません

engine-e-solar-system-epoch-jd-tdb-is-outside = エポック JD { $jd } TDB は、Standish テーブルの範囲である紀元前 3000 年から西暦 3000 年の外です

engine-e-solar-system-track-points-must-be-to = track_points は 8 から 2000 でなければなりません。実際の値 { $n_track }

engine-e-solar-system-unknown-observer-body = 未知の観測者天体 '{ $observer_name }'

engine-e-solar-system-bodies-must-name-at-least = bodies には少なくとも一つの天体を指定しなければなりません

engine-e-solar-system-unknown-body = 未知の天体 '{ $n }'

engine-e-solar-system-no-position-for-at-jd = JD { $jd } TDB における { $name } の位置がありません（冥王星は西暦 1800 年から 2050 年のみ）

engine-e-solar-system-no-standish-elements-for = { $name } の Standish 要素がありません

engine-solar-system-jpl-spk-sha-256-heliocentric = JPL SPK { $k }（SHA-256 { $k2 }）、エンジン独自のリーダーで読み取った太陽中心の状態

engine-e-solar-system-unknown-link-body = 未知のリンク天体 '{ $from }'

engine-e-solar-system-unknown-link-body-2 = 未知のリンク天体 '{ $to }'

engine-e-solar-system-link-needs-two-different-bodies = リンクには異なる二つの天体が必要です。実際の値 { $name }

engine-solar-system-solar-system-at-jd-tdb =
    { $input }（JD { $jd_tdb } TDB）の太陽系、天体 { $n_bodies } 個、観測者 { $observer }
    { "  " }{ $standish_table }{ "\u000A" }

engine-solar-system-light-time = 光行時間 { $one_way_light_time_s } s

engine-solar-system-au-lon-deg = { "  " }{ $name } { $heliocentric_distance_au } au  経度 { $ecliptic_longitude_deg } deg  { $lt }  [{ $label }]{ "\u000A" }

engine-solar-system-link-one-way-two-way = { "  " }リンク { $from } -> { $to }：片道 { $one_way_light_time_s } s、往復 { $two_way_light_time_s } s、Shapiro { $l } us、太陽 { $sun_separation_deg } deg{ "\u000A" }

engine-solar-system-epoch-positions-from-the-standish = エポック { $input } · { $standish_table } · 位置は Standish 要素による

engine-e-sp3-epoch-needs-time-fields-got = エポックには 6 個の時刻フィールドが必要です。実際の値 { $tokens }

engine-e-sp3-bad-second = 不正な秒：{ $tokens }

engine-e-sp3-record-needs-values-missing-column = レコードには 4 個の値が必要です。列 { $v1 } がありません

engine-e-sp3-bad-number = 不正な数値：{ $field }

engine-e-sp3-empty-sp3-input = SP3 入力が空です

engine-e-sp3-first-line-is-not-an = 先頭行が SP3 ヘッダーではありません：{ $first }

engine-e-sp3-unsupported-sp3-version-in = { $first } の SP3 バージョンは未対応です

engine-e-sp3-missing-epoch-count-on-header = ヘッダー行 1 にエポック数がありません

engine-e-sp3-record-has-no-satellite-id = レコードに衛星 ID がありません：{ $line }

engine-e-sp3-position-record-before-any-epoch = エポックヘッダーの前に位置レコードがあります

engine-e-sp3-sp3-file-contained-no-epoch = SP3 ファイルにエポックレコードがありませんでした

engine-e-sp3-bad-accuracy-exponent-in = { $line } 内の精度指数 { $f } が不正です

engine-e-sp3-bad-header-accuracy = ヘッダーの精度 { $t } が不正です

engine-e-sp3-short-line = %f 行が短すぎます { $line }

engine-e-sp3-bad-base-in = { $line } 内の %f ベースが不正です

engine-e-space-packet-version-exceeds-bits = バージョンが 3 ビットを超えています

engine-e-space-packet-apid-exceeds-11-bits-2047 = APID が 11 ビット（0..=2047）を超えています

engine-e-space-packet-sequence-count-exceeds-14-bits = sequence_count が 14 ビット（0..=16383）を超えています

engine-e-space-packet-data-field-must-be-at = データフィールドは少なくとも一オクテットでなければなりません

engine-e-space-packet-data-field-exceeds-65536-octets = データフィールドが 65536 オクテットを超えています

engine-e-space-packet-packet-shorter-than-the-octet = パケットが 6 オクテットのヘッダーより短くなっています：{ $bytes } バイト

engine-e-space-packet-declared-data-length-header-octets = 宣言されたデータ長 { $data_len }（+6 ヘッダー）= { $total } オクテットですが、バッファは { $bytes } です

engine-e-space-packet-cuc-coarse-octets-outside = CUC の粗オクテット { $coarse_octets } が 1..=4 の範囲外です

engine-e-space-packet-cuc-fine-octets-outside-the = CUC の精オクテット { $fine_octets } が 0..=3 の範囲外です（拡張 P-field は未対応）

engine-e-space-packet-cuc-field-extended-field-not = CUC P-field { $p }：拡張 P-field は未対応です

engine-e-space-packet-field-time-code-id-is = P-field { $p }：時刻コード ID { $id } は CUC ではありません

engine-e-space-packet-field-is-not-cds-field = P-field { $p } は CDS P-field ではありません

engine-e-space-packet-cds-field-reserved-sub-ms = CDS P-field { $p }：予約済みのサブミリ秒コード 11

engine-e-space-packet-cuc-coarse-does-not-fit = CUC の粗値 { $coarse } は { $c } オクテットに収まりません

engine-e-space-packet-cuc-fine-does-not-fit = CUC の精値 { $fine } は { $n } オクテットに収まりません

engine-e-space-packet-cds-days-do-not-fit = CDS の日数 { $days } は { $f } オクテットに収まりません

engine-e-space-packet-cds-ms-of-day-above = CDS の日内ミリ秒 { $ms_of_day } が 86 400 999 を超えています

engine-e-space-packet-cds-sub-millisecond-above = CDS のサブミリ秒 { $submillis } が { $max_sub } を超えています

engine-e-space-packet-time-code-format-and-value = 時刻コードの形式と値が異なるコードのものです

engine-e-space-packet-time-code-no-field-octet = 時刻コード：P-field オクテットがありません

engine-e-space-packet-time-code-needs-octets-present = 時刻コードには { $end } オクテットが必要ですが、{ $bytes } しかありません

engine-e-space-packet-time-code-format-differs-from = 時刻コードの形式が暗黙の P-field と異なります

engine-e-space-packet-the-format-has-time-code = この形式には時刻コードフィールドがありますが、指定されていません

engine-e-space-packet-the-format-has-no-time = この形式には時刻コードフィールドがありません

engine-e-space-packet-ancillary-data-is-octets-the = 補助データは { $ancillary } オクテットですが、形式では { $ancillary_octets } とされています

engine-e-space-packet-secondary-header-must-hold-at = 二次ヘッダーは少なくとも一オクテットを保持しなければなりません

engine-e-space-packet-secondary-header-needs-octets-present = 二次ヘッダーには { $end } オクテットが必要ですが、{ $bytes } しかありません

engine-e-space-packet-the-format-has-secondary-header = この形式には二次ヘッダーがありますが、指定されていません

engine-e-space-packet-the-format-has-no-secondary = この形式には二次ヘッダーがありません

engine-e-space-packet-secondary-header-flag-disagrees-with = 二次ヘッダーフラグ { $v1 } が形式と一致しません

engine-e-space-packet-data-field-shorter-than-the = データフィールドが PEC より短くなっています

engine-e-space-packet-pec-does-not-match-the = PEC { $v1 } がパケットの CRC { $crc16_ccitt_false } と一致しません

engine-e-space-packet-nothing-to-segment-empty-user = 分割するものがありません：ユーザーデータが空です

engine-e-space-packet-max-user-octets-must-be = max_user_octets は 1 以上でなければなりません

engine-e-space-packet-first-count-exceeds-14-bits = first_count が 14 ビット（0..=16383）を超えています

engine-space-packet-apid-where-was-expected = APID { $apid }（期待値は { $a }）

engine-space-packet-sequence-count-repeated = シーケンスカウント { $sequence_count } が重複しています

engine-space-packet-sequence-count-gap-after-packet = シーケンスカウントの欠落：{ $last } の次が { $sequence_count }（欠落パケット { $v2 } 個）

engine-space-packet-sequence-count-out-of-order = シーケンスカウントの順序違反：{ $last } の次が { $sequence_count }

engine-space-packet-packet-with-no-unit-open = 開いているユニットがない状態での { $f } パケット

engine-space-packet-packet-while-unit-is-open = ユニットが開いている状態での { $f } パケット

engine-e-space-packet-packet = パケット { $i }：{ $e }

engine-e-space-packet-the-sequence-ends-with-unit = シーケンスが、ユニットが開いたまま終わっています（最終パケットなし）

engine-e-space-packet-apid-must-be-in-2047 = apid は 0..=2047 の範囲でなければなりません

engine-e-space-packet-packet-count-must-be = packet_count は 1 以上でなければなりません

engine-e-space-packet-data-len-must-be-in = data_len は 1..=65536 の範囲でなければなりません

engine-e-space-packet-internal-error-encode-decode-round = 内部エラー：エンコードとデコードの往復が一致しません

engine-space-packet-space-packet-framed-ccsds-133 = space-packet：CCSDS-133.0 { $v2 } パケット { $packet_count } 個（APID { $apid }）をフレーム化、合計 { $total_bytes } オクテット、往復は完全一致（{ $round_trip_ok }）

engine-e-space-weather-f107-must-be-finite-and = f107 は有限かつ正でなければなりません

engine-e-space-weather-f107a-must-be-finite-and = f107a は有限かつ正でなければなりません

engine-e-space-weather-kp-must-be-in = kp は [0, 9] の範囲でなければなりません

engine-e-space-weather-altitudes-km-must-be-non = altitudes_km は空であってはなりません

engine-e-space-weather-altitude-km-must-be-finite = 高度 { $h } km は有限かつ正でなければなりません

engine-space-weather-space-weather-f10-f10-7a = space-weather：F10.7={ $f107 } F10.7a={ $f107a } Kp={ $kp }（ap={ $sw }）-> T_inf={ $t_inf } K。{ $value } km での密度は x{ $density_activity_factor }（MODELLED）

engine-e-spectrum-jammer-needs-positive-bandwidth-mhz = { $name }：{ $what } ジャマーには正の bandwidth_mhz が必要です

engine-e-spectrum-chirp-jammer-needs-positive-sweep = { $name }：チャープジャマーには正の sweep_period_us が必要です

engine-e-spectrum-matched-to-names-unknown-band = { $name }：matched_to が未知のバンド { $target } を指しています

engine-e-spectrum-give-either-received-power-dbw = { $name }：received_power_dbw か、正の range_m を伴う eirp_dbw のいずれかを指定してください（両方は不可）

engine-e-spectrum-off-must-be-later-than = { $name }：off_s は on_s より後でなければなりません

engine-e-spectrum-welch-the-sample-rate-must = welch：サンプルレートは正でなければなりません

engine-e-spectrum-welch-nfft-must-be-power = welch：nfft = { $nfft } は二のべき乗で、8 以上でなければなりません

engine-e-spectrum-welch-samples-is-fewer-than = welch：{ $x } サンプルでは、{ $nfft } 点のセグメント一つに満たません

engine-e-spectrum-iq-must-be-power-of = iq：n = { $n } は二のべき乗で、16 以上でなければなりません

engine-e-spectrum-cannot-read-recording-meta-path = 記録の meta_path { $meta_path } を読み取れません：{ $e }

engine-e-spectrum-cannot-read-recording-data = 記録データ { $data_path } を読み取れません：{ $e }

engine-e-spectrum-rx-bandwidth-mhz-must-be = { $name }：rx_bandwidth_mhz は正でなければなりません

engine-e-spectrum-modulation-is-not-selectable-only = { $n }：変調 { $m } は選択できません（"mboc" または "boc11" を取れるのは galileo-e1 のみ）

engine-e-spectrum-signal-is-not-in-the = { $name }：信号 { $sig } は信号プリセットライブラリにありません（{ $v2 }）

engine-e-spectrum-preset-signal-carries-its-own = { $name }：プリセット信号は独自の変調を持ちます。`modulation` を削除してください

engine-e-spectrum-signal-publishes-no-received-power = { $name }：信号 { $sig } は受信電力を公表していません。signal_power_dbw を指定してください

engine-e-spectrum-custom-band-needs-modulation-bpsk = { $name }：カスタムバンドには `modulation` が必要です（例："BPSK(10)"）

engine-e-spectrum-custom-band-needs-signal-power = { $name }：カスタムバンドには signal_power_dbw が必要です

engine-e-spectrum-give-either-signal-or-centre = { $name }：`signal` か `centre_mhz` のいずれかを指定してください（両方は不可）

engine-e-spectrum-give-rx-bandwidth-mhz-no = { $name }：rx_bandwidth_mhz を指定してください（メインローブの位置を特定できませんでした）

engine-e-spectrum-duration-must-be-at-least = duration_s は step_s の一つ分以上でなければなりません

engine-e-spectrum-time-rows-is-more-than = 時間行 { $rows } 行は、許容される 5000 行を超えています

engine-e-spectrum-at-most-extra-panels = 追加パネルは最大 8 個です

engine-e-spectrum-panel-need-max-mhz-min = パネル { $name }：f_max_mhz > f_min_mhz かつ 2 ≤ n_freq ≤ 4096 でなければなりません

engine-e-spectrum-grid-need-max-mhz-min = グリッド：f_max_mhz > f_min_mhz かつ 2 ≤ n_freq ≤ 4096 でなければなりません

engine-spectrum-scenario-spectrum-bands-jammers-noise = シナリオ spectrum | バンド { $bands } | ジャマー { $jammers } | ノイズフロア { $n0_db } dBW/Hz | 最悪バンド { $name } 最小 C/N0 { $c } dB-Hz{ $v6 }

engine-spectrum-scenario-spectrum-no-bands-noise = シナリオ spectrum | バンドなし | ノイズフロア { $n0_db } dBW/Hz

engine-e-spectrum-iq-log2-samples-must-be = iq.log2_samples は 10 から 20 の間でなければなりません

engine-e-spectrum-iq-datatype-use-cf32-le = iq.datatype：cf32_le または ci16_le を使用してください

engine-spectrum-frequency-across-time-down-colour = 横軸は周波数、縦軸は時間、色は電力スペクトル密度（dBW/Hz）。ノイズフロア { $n0_db } dBW/Hz

engine-spectrum-each-panel-its-own-frequency = 各パネルは独自の周波数範囲を持ち、縦軸は共通の時間軸、色スケールも共通（dBW/Hz）。ノイズフロア { $n0_db } dBW/Hz

engine-e-spk-writer-frame-has-no-supported-naif = フレーム { $other } に対応する NAIF コードがありません

engine-e-spk-writer-segment-name-longer-than-40 = セグメント名が 40 文字を超えています：{ $name }

engine-e-spk-writer-segment-name-has-non-printing = セグメント名に印字不能文字があります：{ $name }

engine-e-spk-writer-bad-target-for-centre = 中心 { $centre } に対するターゲット { $target } が不正です

engine-e-spk-writer-degree-outside-27 = 次数 { $degree } が 1..=27 の範囲外です

engine-e-spk-writer-type-13-degree-is-not = タイプ 13 の次数 { $degree } が奇数ではありません

engine-e-spk-writer-states-for-epochs = { $n } エポックに対して状態が { $states } 個です

engine-e-spk-writer-states-degree-needs = 状態 { $n } 個。次数 { $degree } には { $value } 個が必要です

engine-e-spk-writer-descriptor-start-is-not-before = ディスクリプターの開始が終了より前になっていません

engine-e-spk-writer-epochs-are-not-strictly-increasing = エポックが厳密に増加していません

engine-e-spk-writer-the-epochs-do-not-cover = エポックがディスクリプターの区間をカバーしていません

engine-e-spk-writer-type-or-13-segment-carries = タイプ 9 または 13 のセグメントが保持するのは状態であり、レコードではありません

engine-e-spk-writer-type-segment-needs-at-least = タイプ 3 のセグメントには少なくとも一つのレコードが必要です

engine-e-spk-writer-type-degree-outside-27 = タイプ 3 の次数 { $degree } が 0..=27 の範囲外です

engine-e-spk-writer-type-interval-length-is-not = タイプ 3 の区間長 { $intlen } が正ではありません

engine-e-spk-writer-type-record-has-coefficients-expected = タイプ 3 のレコード { $i } の係数は { $value } 個で、期待値は { $ncof } 個です

engine-e-spk-writer-descriptor-start-is-after-its = ディスクリプターの開始が終了より後になっています

engine-e-spk-writer-descriptor-starts-before-the-first = ディスクリプターの開始が最初のレコードより前です

engine-e-spk-writer-descriptor-ends-after-the-last = ディスクリプターの終了が最後のレコードより後です

engine-e-spk-writer-type-segment-carries-records-not = タイプ 3 のセグメントが保持するのはレコードであり、エポックや状態ではありません

engine-e-spk-writer-type-21-segment-needs-at = タイプ 21 のセグメントには少なくとも一つの差分行が必要です

engine-e-spk-writer-difference-line-size-is-not = 差分行のサイズ { $dlsize } が 4 MAXDIM + 11（MAXDIM は 15..=25）ではありません

engine-e-spk-writer-difference-lines-of-different-sizes = 差分行のサイズが揃っていません

engine-e-spk-writer-epochs-for-difference-lines = { $n } 本の差分行に対してエポックが { $epochs } 個です

engine-e-spk-writer-difference-line-epochs-are-not = 差分行のエポックが厳密に増加していません

engine-e-spk-writer-the-last-difference-line-ends = 最後の差分行がディスクリプターより前で終わっています

engine-e-spk-writer-zero-step-size-in-difference = 差分行 { $i } のステップサイズ { $j } がゼロです

engine-e-spk-writer-type-21-segment-carries-difference = タイプ 21 のセグメントが保持するのは差分行であり、状態ではありません

engine-e-spk-writer-an-spk-needs-at-least = SPK には少なくとも一つのセグメントが必要です

engine-e-spk-writer-segment = セグメント { $i }：{ $e }

engine-e-spk-writer-comment-line-has-non-printing = コメント行に印字不能文字があります：{ $l }

engine-e-spk-writer-comments-need-characters-are-reserved = コメントには { $nchars } 文字が必要ですが、予約済みは { $v1 } 文字です（ncomch を増やしてください）

engine-e-spk-writer-difference-line-orders-out-of = 差分行の次数 { $kqmax1 } { $kq } が範囲外です

engine-e-spk-writer-zero-step-size-at-index = インデックス { $j } のステップサイズがゼロです

engine-e-spk-writer-et-outside-the-segment = ET { $et } がセグメント [{ $start }, { $end }] の範囲外です

engine-e-spk-writer-type-segment-too-short = タイプ 3 のセグメント { $name } が短すぎます

engine-e-spk-writer-type-segment-words-for-rsize = タイプ 3 のセグメント { $name }：N = { $n }、RSIZE = { $rsize } に対してワードが { $nw } 個です

engine-e-spk-writer-type-21-segment-too-short = タイプ 21 のセグメント { $name } が短すぎます

engine-e-spk-writer-type-21-segment-words-for = タイプ 21 のセグメント { $name }：N = { $n }、MAXDIM = { $maxdim } に対してワードが { $nw } 個です

engine-e-spk-writer-segment-too-short = セグメント { $name } が短すぎます

engine-e-spk-writer-segment-words-for = セグメント { $name }：N = { $n } に対してワードが { $nw } 個です

engine-e-spk-writer-segment-is-in-frame = セグメント { $name } はフレーム { $frame } にあります

engine-e-spk-writer-spk-centre-chain-does-not = SPK の中心チェーンが終端しません

engine-e-spk-writer-no-spk-chain-connects-and = ET { $et } で { $target } と { $observer } を結ぶ SPK チェーンがありません

engine-e-spk-writer-epoch-is-not-yyyy-mm = エポック { $s } は YYYY-MM-DDTHH:MM:SS 形式ではありません

engine-e-spk-writer-time-system-not-supported-utc = 時刻系 { $other } は未対応です（UTC または TDB）

engine-e-spk-writer-centre-has-no-supported-naif = 中心 { $other } に対応する NAIF ID がありません

engine-e-spk-writer-oem-segment-has-no-data = OEM セグメント { $name } にデータ行がありません

engine-e-spk-writer-oem-segment-no = OEM セグメント { $idx }：{ $k } がありません

engine-e-spk-writer-no-export-settings-for-oem = OEM セグメント { $idx } のエクスポート設定がありません

engine-e-spk-writer-oem-data-line-has-fields = OEM データ行のフィールド数が { $f } です：{ $line }

engine-e-spk-writer-oem-value = OEM 値 { $f }：{ $e }

engine-e-spk-writer-oem-segments-for-export-settings = エクスポート設定 { $exports } 件に対して OEM セグメントが { $out } 個です

engine-spoof-detect-spoof-detected-fused-layers = SPOOF DETECTED（融合）— 層：{ $fired }

engine-spoof-detect-single-layer-indication-below-the = 単一層の兆候（{ $fired }）は融合しきい値を下回っています — 裏付けが必要です

engine-e-srp-boxwing-mass-kg-must-be-positive = mass_kg は正でなければなりません（実際の値 { $mass_kg }）

engine-e-srp-boxwing-panel-area-must-be = パネル { $i }：面積は 0 以上でなければなりません

engine-e-srp-boxwing-panel-outside = パネル { $i }：{ $name } = { $c } が [0, 1] の範囲外です

engine-e-srp-boxwing-panel-absorption-specular-diffuse = パネル { $i }：吸収 + 鏡面 + 拡散 = { $sum } != 1

engine-e-srp-boxwing-panel-zero-normal-axis = パネル { $i }：法線/軸がゼロです

engine-e-srp-boxwing-ecom2-normal-matrix-is-singular = ECOM2 の正規行列が特異、または悪条件です

engine-e-ssv-check-heo-preset = heo プリセット

engine-e-ssv-check-lunar-preset = lunar プリセット

engine-e-ssv-formation-formation-needs-at-least-one = フォーメーションには少なくとも一つのデピュティが必要です

engine-e-ssv-formation-duration-min-and-step-must = duration_min と step_s は正でなければなりません

engine-e-ssv-nav-no-signals-for-the-chosen = 選択した衛星コンステレーションとバンドに該当する信号がありません

engine-e-ssv-scenario-unknown-antenna = 未知のアンテナ `{ $other }`

engine-e-ssv-scenario-pattern-csv-is-empty = パターン CSV が空です

engine-e-ssv-scenario-is-not-number-in-the = `{ $s }` はパターン CSV 内の数値ではありません

engine-e-ssv-scenario-pattern-csv-row-has-columns = パターン CSV の行 `{ $l }` の列数は { $f } で、期待値は { $azimuths } です

engine-e-ssv-scenario-transmit-pattern-table-needs-exactly = transmit.pattern = "table" には、pattern_csv と pattern_text のうちちょうど一つが必要です

engine-e-ssv-scenario-transmit-pattern-is-not-booklet = transmit.pattern `{ $other }` は booklet、parametric、table のいずれでもありません

engine-e-ssv-scenario-receiver-give-cn0-min-dbhz = receiver：cn0_min_dbhz か weak_signal のいずれかを指定してください（両方は不可）

engine-e-ssv-scenario-the-carrier-loop-cannot-hold = 搬送波ループは、どの C/N0 でも申告されたドップラーレートを保持できません

engine-e-ssv-scenario-receiver-apply-is-not-acquisition = receiver.apply `{ $other }` は acquisition、tracking、both のいずれでもありません

engine-e-ssv-scenario-receiver-cn0-min-dbhz-must = receiver.cn0_min_dbhz は有限でなければなりません

engine-e-ssv-scenario-navigation-give-exactly-one-of = navigation：preset と orbit のうちちょうど一つを指定してください

engine-e-ssv-scenario-navigation-preset-is-not-leo = navigation.preset `{ $p }` は leo、meo、geo、heo、lunar-transfer のいずれでもありません

engine-e-ssv-scenario-navigation-give-exactly-one-of-2 = navigation：duration_min と duration_periods のうちちょうど一つを指定してください

engine-e-ssv-scenario-navigation-must-be-positive = navigation.{ $name } は正でなければなりません

engine-e-ssv-scenario-formation-offsets-deg-needs-to = formation.offsets_deg には、有限のオフセットが 1 個から 8 個必要です

engine-e-ssv-scenario-formation-rel-accel-psd-must = formation.rel_accel_psd は負であってはなりません

engine-e-ssv-scenario-give-exactly-one-of-shell = [shell]、[trajectory]、[navigation] のうちちょうど一つを指定してください

engine-e-ssv-scenario-formation-needs-navigation-table-for = { "[" }formation] にはチーフ用の [navigation] テーブルが必要です

engine-e-ssv-scenario-constellations-include-and-constellations-bands = constellations.include と constellations.bands は空であってはなりません

engine-e-ssv-scenario-shell-altitude-km-must-be = shell.altitude_km は 100 より大きくなければなりません

engine-e-ssv-scenario-shell-grid-levels-above-is = shell.grid_levels が 5 を超える設定は未対応です

engine-e-ssv-scenario-shell-antenna-must-be-hemisphere = shell.antenna は hemisphere または omni でなければなりません

engine-e-ssv-scenario-the-shell-sweep-supports-the = シェルのスイープが対応するのは booklet 送信パターンのみです（成形パターンにはトラジェクトリのスイープが必要です）

engine-e-ssv-scenario-atmosphere-applies-to-trajectory-not = { "[" }atmosphere] が適用されるのは [trajectory] であり、[shell] ではありません

engine-e-ssv-scenario-trajectory-give-exactly-one-of = trajectory：preset と orbit のうちちょうど一つを指定してください

engine-e-ssv-scenario-trajectory-preset-is-not-leo = trajectory.preset `{ $p }` は leo、meo、geo、heo、lunar-transfer のいずれでもありません

engine-e-ssv-scenario-unknown-preset = 未知のプリセット

engine-ssv-scenario-gnss-ssv-shell-km = gnss-ssv シェル { $altitude_km } km：{ $parts }

engine-ssv-scenario-gnss-ssv-navigation-position-rms = gnss-ssv 航法：位置 RMS は全体で { $p }、GNSS 軌道の内側で { $p2 }、外側で { $p3 }。最長のギャップ { $longest_gap_min } min

engine-ssv-scenario-deputy-at-deg-km-relative = { $offset_deg } deg（{ $baseline_km } km）のデピュティ：相対 RMS はフィルター後 { $rel_rms_filter_m } m、絶対測位解から求めた場合 { $rel_rms_from_absolute_m } m

engine-ssv-scenario-combined-max-outage-min = { $band } 合成 1+ { $at_least_1_pct }% 4+ { $at_least_4_pct }%（最大途絶 { $max_outage_1_min } min）

engine-ssv-scenario-gnss-ssv-trajectory-to-km = gnss-ssv トラジェクトリ、高度 { $perigee_alt_km } から { $apogee_alt_km } km：{ $parts }

engine-e-ssv-sweep-duration-min-and-step-min = duration_min と step_min は正でなければなりません

engine-e-ssv-weak-receiver-must-be-positive-number = receiver.{ $n } は正の数でなければなりません（実際の値 { $v }）

engine-e-standards-pack-no-standards-pack-named-the = `{ $id }` という名前の標準パックはありません。利用可能なパック：{ $ids }

engine-e-standards-pack-pack-manifest = パックマニフェスト：{ $e }

engine-e-standards-pack-test-duplicate-id = テスト { $id }：ID が重複しています

engine-e-standards-pack-test-scenario-is-not-in = テスト { $id }：シナリオ `{ $s }` はパックにありません

engine-e-standards-pack-test-scored-test-needs-bar = テスト { $id }：採点対象のテストには合格基準が必要です

engine-e-standards-pack-test-test-that-needs-input = テスト { $id }：入力が必要なテストには合格基準がありません

engine-e-standards-pack-test-give-either-scenario-or = テスト { $id }：`scenario` か `needs_input` のいずれか一方を指定してください（両方も、どちらもなしも不可）

engine-e-standards-pack-test-supports-unknown-row = テスト { $id }：未知の行 `{ $r }` を裏付けると宣言しています

engine-e-standards-pack-test-unknown-op = テスト { $id }：未知の演算子 `{ $op }`

engine-e-standards-pack-test-bar-on-needs-exactly = テスト { $id }：{ $pointer } の合格基準には、`value` と `against` のうちちょうど一つが必要です

engine-e-standards-pack-row-duplicate-id = 行 { $id }：ID が重複しています

engine-e-standards-pack-row-asks-must-be-short = 行 { $id }：`asks` は短い言い換えでなければなりません

engine-e-standards-pack-row-no-test-supports-it = 行 { $id }：これを裏付けるテストがありません

engine-standards-pack-not-scored-needs-input = 採点対象外：入力が必要（{ $n }）

engine-e-study-study-has-no-scenarios-to = 実行するシナリオが study にありません

engine-e-study-cannot-read-scenario = シナリオ { $path } を読み取れません：{ $e }

engine-e-study-scenario-failed = シナリオ { $path } が失敗しました：{ $e }

engine-e-study-scenario-produced-unparseable-json = シナリオ { $path } が解析不能な JSON を出力しました：{ $e }

engine-e-suite-invalid-suite-manifest = 無効なスイートマニフェスト：{ $e }

engine-e-surface-unknown-source-use-adsb-or = 未知のソース `{ $o }`：`adsb` または `ais` を使用してください

engine-e-surface-is-bytes-over-the-byte = { $what } は { $len } バイトで、{ $limit } バイトの上限を超えています

engine-e-surface-log-start-utc-is-not = log_start_utc `{ $log_start_utc }` は ISO-8601 の UTC 時刻ではありません

engine-e-surface-invalid-receiver-trust-session = 無効な receiver-trust セッション：{ $e }

engine-e-surface-log-start-utc-is-not-2 = log_start_utc `{ $t }` は ISO-8601 の UTC 時刻ではありません

engine-e-surface-dataset-custom-needs-licence-licence = データセット `custom` には licence、licence_url、attribution が必要です

engine-e-surface-at-least-one-map-is = 少なくとも一つのマップが必要です

engine-e-surface-epoch = エポック：{ $e }

engine-e-surface-not-utf = { $suffix }：UTF-8 ではありません

engine-e-surface-unknown-scenario-kind-the-kind = 未知のシナリオ種別 `{ $k }`。種別一覧にすべての種別が載っています

engine-surface-is-not-bundled-it = `{ $name }` は同梱されていません：{ $why }

engine-surface-no-bundled-scenario-named-the = `{ $name }` という名前の同梱シナリオはありません。例の一覧には { $v1 } 件が載っています

engine-e-surface-invalid-toml = 無効な TOML：{ $e }

engine-e-surface-unknown-export-format-expected-one = 未知のエクスポート形式 `{ $format }`。czml、kml、geojson、stk、sigmf のいずれかが必要です

engine-e-surface-duration-fps-gives-frames-and = duration_s x fps は { $opts } フレームになりますが、返されるのは最大 { $MAX_ANIMATION_FRAMES } フレームです。fps または duration_s を下げるか、コマンドラインでより長いシーケンスを書き出してください

engine-e-surface-scenario-run-failed = シナリオの実行に失敗しました：{ $e }

engine-e-surface-runs-log-names-file-path = runs[{ $i }].log はファイル `path` を指しています。ログは `text` または `base64` で渡してください（この画面はファイルを読み取りません）

engine-e-surface-max-sp-errors-must-be = max_sp_errors は 20 以下でなければなりません

engine-e-surface-frames-must-be-to = frames は 1 から { $MAX_AFS_FRAMES } でなければなりません

engine-e-surface-toi0-must-be-to-99 = toi0 は 0 から 99 でなければなりません

engine-e-surface-runs-given-at-most-per = runs が { $runs } 件指定されています。レポートあたり最大 { $MAX_COMPLIANCE_RUNS } 件です

engine-e-surface-the-runs-total-bytes-the = runs の合計は { $total } バイトです。一件のレポートの上限は { $max_bytes } です

engine-e-surface-result-files-given-at-most = 結果ファイルが { $results } 件指定されています。最大 256 件です

engine-e-surface-result-is-not-json = 結果 { $v1 } は JSON ではありません：{ $e }

engine-e-surface-unknown-format-use-prometheus-cef = 未知の形式 `{ $o }`：`prometheus`、`cef`、`leef`、`otlp`、`mqtt` のいずれかを使用してください

engine-e-surface-unknown-imu-format-use-csv = 未知の IMU 形式 `{ $o }`：`csv` または `euroc` を使用してください

engine-e-surface-unknown-axis-use-or = 未知の軸 `{ $o }`：`x`、`y`、`z` のいずれかを使用してください

engine-e-surface-id-must-be-to-64 = id は、空白を含まない印字可能な ASCII 文字で 1 文字から 64 文字でなければなりません

engine-surface-fitted-from-stationary-imu-log = 静止状態の IMU ログからフィット、sha256 { $sha }、軸 { $axis }、アラン偏差推定量

engine-e-surface-unknown-input-kind-use-result = 未知の input_kind `{ $o }`：`result` または `jsonl` を使用してください

engine-e-surface-the-input-holds-no-trust = 入力に信頼エポックがありません

engine-e-surface-the-reply-is-over-the = 応答が { $max_bytes } バイトの上限を超えています。エポックを減らすか、`syslog_all` をオフにしてください

engine-e-surface-otlp-needs-build-with-the = otlp には `otlp` 機能を有効にしたビルドが必要です

engine-e-surface-the-pack-and-token-total = パックとトークンの合計は { $total } バイトです。上限は { $max_bytes } です

engine-e-surface-the-timestamp-token-is-empty = タイムスタンプトークンが空です

engine-e-surface-must-be-64-lower-case = { $what } は小文字の十六進数 64 桁でなければなりません

engine-e-surface-must-be-32-bytes = { $what } は 32 バイトでなければなりません

engine-surface-verified-against-the-public-key = 指定された公開鍵で VERIFIED（署名者のフィンガープリント { $fp }）。

engine-surface-intact-but-the-signer-is = INTACT, BUT THE SIGNER IS NOT PINNED：ハッシュと署名は鍵 { $fp } と整合していますが、この鍵はパック自身が名指ししたものです。署名者を確定するには、署名者から別の経路で入手した署名者の公開鍵を指定してください。

engine-e-surface-files-must-be-json-object = files は、名前から内容への JSON オブジェクトでなければなりません

engine-e-surface-pack-has-at-most-64 = パックのファイルは最大 64 個です

engine-e-surface-file-name-must-be-plain = ファイル名 `{ $k }` は単純な名前でなければなりません

engine-e-surface-base64-is-not-valid-standard = { $k }：`base64` は有効な標準 base64 ではありません

engine-e-sweep-unknown-sweep-parameter = 未知のスイープパラメーター：{ $other }

engine-e-sweep-unknown-sweep-metric = 未知のスイープ指標：{ $other }

engine-e-sweep-nd-sweep-needs-at-least = nd_sweep には少なくとも一つの軸が必要です

engine-e-sweep-sweep-key-is-malformed = スイープキー `{ $key }` の形式が不正です

engine-e-sweep-sweep-key-follows-an-array = スイープキー `{ $key }`：`{ $part }` は配列の後に続くため、インデックスでなければなりません

engine-e-sweep-unreachable = 到達不能

engine-e-sweep-sweep-key-index-is-past = スイープキー `{ $key }`：インデックス { $i } は配列の { $n } 個の要素を超えています

engine-e-sweep-sweep-key-parent-is-not = スイープキー `{ $key }`：`{ $part }` の親がテーブルではありません

engine-e-sweep-sweep-key-no-field = スイープキー `{ $key }`：フィールド `{ $part }` がありません

engine-e-sweep-sweep-key-parent-of-is = スイープキー `{ $key }`：`{ $last }` の親がテーブルではありません

engine-e-sweep-sweep-key-no-field-2 = スイープキー `{ $key }`：フィールド `{ $last }` がありません

engine-e-sweep-metric-no-field-in-result = 指標 `{ $path }`：結果にフィールド `{ $part }` がありません

engine-e-sweep-metric-value-is-not-number = 指標 `{ $path }`：値が数値ではありません

engine-e-sweep-sweep-node-serialize = スイープノードのシリアライズ：{ $e }

engine-e-sweep-sweep-node-result-parse = スイープノード結果の解析：{ $e }

engine-e-sweep-sweep-axis-declared-unit-but = スイープ軸 `{ $key }`：宣言された単位は `{ $d }` ですが、スイープ対象のパックは `{ $p }` を公表しています

engine-e-sweep-sweep-worker-thread-panicked = スイープのワーカースレッドがパニックしました

engine-e-sweep-generic-sweep-needs-at-least = 汎用スイープには少なくとも一つの軸が必要です

engine-e-sweep-generic-sweep-needs-at-least-2 = 汎用スイープには少なくとも一つの指標が必要です

engine-e-sweep-generic-sweep-base-must-carry = 汎用スイープの `base` は独自の `kind` を持たなければなりません

engine-e-sweep-generic-sweep-cannot-sweep-another = 汎用スイープは別のスイープをスイープできません

engine-e-telecom-timing-unknown-oscillator-expected-one-of = 未知の発振器 { $oscillator }。{ $presets } のいずれかが必要です

engine-e-telecom-timing-aging-per-day-and-temperature = aging_per_day と temperature_coeff_per_k は有限でなければなりません

engine-e-telecom-timing-sample-interval-must-be-finite = sample_interval_s は有限かつ正でなければなりません

engine-e-telecom-timing-duration-must-be-finite-and = duration_s は有限で、少なくとも十二サンプルの長さが必要です

engine-e-telecom-timing-gnss-loss-must-lie-in = gnss_loss_s は [0, duration_s) の範囲でなければなりません

engine-e-telecom-timing-locked-te-sigma-ns-must = locked_te_sigma_ns は有限かつ 0 以上でなければなりません

engine-e-telecom-timing-temperature-and-frequency-offset-inputs = 温度と周波数オフセットの入力は有限でなければなりません（周期 > 0）

engine-e-telecom-timing-the-record-would-exceed-000 = 記録が 5 000 000 サンプルを超えます。sample_interval_s を大きくしてください

engine-e-telecom-timing-time-error-series-needs-at = 時刻誤差の系列には少なくとも 13 サンプルが必要です。実際の値 { $pairs }

engine-e-telecom-timing-every-time-and-time-error = すべての time_s と time_error_ns は有限でなければなりません

engine-e-telecom-timing-time-must-increase = time_s は増加しなければなりません

engine-e-telecom-timing-the-series-must-be-uniformly = 系列は等間隔でサンプリングされていなければなりません：ステップ { $v1 } は { $d } s で、最初のステップは { $dt } s です

engine-e-telecom-timing-csv-line-is-not-time = CSV の行 { $v1 } は `time_s,time_error_ns` ではありません

engine-telecom-timing-the-mask-is-defined-through = このマスクは 0.1 Hz のローパスフィルターを通して定義されており、本エンジンがこれを適用するのはサンプル間隔が { $MAX_FILTER_DT_S } s 以下の場合のみです。この記録のサンプル間隔は { $dt_s } s です

engine-e-telecom-timing-give-either-holdover-or-series = [holdover] か [series] のいずれか一方を指定してください（両方は不可）

engine-e-telecom-timing-give-either-series-samples-or = series.samples か series.csv_path のいずれか一方を指定してください（両方は不可）

engine-e-telecom-timing-locked-duration-days-must-be = locked_duration_days は有限かつ 0 以上でなければなりません

engine-telecom-timing-ns-budget-exceeded-after = ；{ $max_abs_te_ns } ns の予算を { $t } s 後に超過

engine-telecom-timing-ns-budget-never-exceeded = ；{ $max_abs_te_ns } ns の予算は超過しません

engine-telecom-timing-telecom-timing-max-te-ns = telecom-timing：max|TE| { $max_abs } ns（{ $v2 } s 間）；{ $masks }{ $first_budget }（MODELLED）

engine-e-telemetry-cli-unknown-format-cef-or-leef = 未知の --format `{ $f }`（cef または leef）

engine-e-telemetry-cli-unknown-option = 未知のオプション `{ $x }`

engine-e-telemetry-cli-input-and-result-are-alternatives = --input と --result は排他です

engine-e-telemetry-cli-listen = --listen { $l }：{ $e }

engine-e-telemetry-cli-listen-no-address = --listen { $l }：アドレスがありません

engine-telemetry-cli-warning-metrics-is-served-without = 警告：/metrics は { $addr } で認証なしで提供されています。localhost にバインドするか、独自のアクセス制御の背後に置いてください

engine-e-telemetry-cli-bind = bind { $addr }：{ $e }

engine-telemetry-cli-serving-http-metrics = http://{ $bound }/metrics を提供中

engine-e-telemetry-cli-host = --host：{ $e }

engine-e-telemetry-cli-syslog-udp-and-syslog-tcp = --syslog-udp と --syslog-tcp は排他です

engine-e-telemetry-cli-syslog-octet-counting-applies-to = --syslog-octet-counting は --syslog-tcp に適用されます

engine-e-telemetry-cli-topic-part-must-be-non = { $name }：トピックの各部分は空であってはならず、#、+、先頭の / を含んではなりません

engine-e-telemetry-cli-otlp-needs-build-with-features = --otlp には `--features otlp` を付けたビルドが必要です

engine-telemetry-cli-warning-input-line = 警告：入力行 { $line_no }：{ $e }

engine-e-telemetry-cli-cannot-open = { $p } を開けません：{ $e }

engine-telemetry-cli-warning-mqtt-messages-were-not = 警告：MQTT メッセージ { $n } 件が配信されませんでした

engine-e-telemetry-otlp-endpoint-must-start-with-http = エンドポイントは http:// で始まらなければなりません

engine-e-telemetry-otlp-endpoint-has-no-host = エンドポイントにホストがありません

engine-e-telemetry-otlp-resolve = { $hostport } の名前解決：{ $e }

engine-telemetry-otlp-no-address-for = { $hostport } のアドレスがありません

engine-telemetry-otlp-warning-otlp-export-failed = 警告：otlp のエクスポートに失敗しました：{ $e }

engine-e-telemetry-sample-not-json = JSON ではありません：{ $e }

engine-e-telemetry-sample-not-json-object = JSON オブジェクトではありません

engine-e-telemetry-sample-is-not-number = `{ $k }` は数値ではありません

engine-e-telemetry-sample-is-not-finite = `{ $k }` は有限ではありません

engine-e-telemetry-sample-missing = `t_s` がありません

engine-e-telemetry-sample-score-outside-100 = `score` { $s } が 0..=100 の範囲外です

engine-e-telemetry-sample-missing-state = `state` がありません

engine-e-telemetry-sample-is-not-an-array = `{ $key }` は配列ではありません

engine-e-telemetry-sample-entry-has-no-name = `{ $key }` のエントリーに名前がありません

engine-e-telemetry-sample-position-is-missing-or-not = `position.{ $k }` がないか、有限の数値ではありません

engine-e-telemetry-sample-position-is-not-an-object = `position` はオブジェクトでも null でもありません

engine-e-telemetry-sample-geometry-status-is-missing-or = `geometry.status` がないか、文字列ではありません

engine-e-telemetry-sample-geometry-is-not-finite-number = `geometry.{ $k }` は 0 以上の有限の数値ではありません

engine-e-telemetry-sample-geometry-label-is-not-string = `geometry.label` は文字列ではありません

engine-e-telemetry-sample-geometry-signal-loss-is-not = `geometry.signal_loss` は真偽値ではありません

engine-e-telemetry-sample-geometry-is-not-an-object = `geometry` はオブジェクトでも null でもありません

engine-e-telemetry-sample-result-has-no-epochs = 結果に `epochs` がありません

engine-e-telemetry-sample-bad-epochs = 不正な `epochs`：{ $e }

engine-e-telemetry-syslog-host-is-bytes-syslog-host = ホスト名は { $host } バイトです。syslog のホスト名は最大 255 バイトです

engine-e-telemetry-syslog-host-must-be-printable-ascii = ホスト名は、空白を含まない印字可能な ASCII 文字でなければなりません

engine-test-support-vs-not-representable-as-f64 = { "  " }{ $path }：{ $g } 対 { $w }（f64 では表現できません）

engine-test-support-present-expected-absent = { "  " }{ $path }.{ $k }：存在しますが、存在しないはずです

engine-test-support-absent-expected-present = { "  " }{ $path }.{ $k }：存在しませんが、存在するはずです

engine-e-time-transfer-budget-must-be-finite = { $name }：{ $n } は有限でなければなりません

engine-e-time-transfer-budget-slant-tec-tecu-must-be = { $name }：slant_tec_tecu は有限かつ非負でなければなりません

engine-e-time-transfer-budget-line-not-mjd-ns = { $p }：行 { $v1 }：MJD,ns ではありません

engine-e-time-transfer-budget-no-ar-records-for = { $p }：{ $code } の AR レコードがありません

engine-e-time-transfer-budget-unknown-series-format-circular-mjd = 未知の系列形式 { $f }（circular-t、mjd-csv、rinex-clock）

engine-e-time-transfer-budget-must-be-finite-2 = { $n } は有限でなければなりません

engine-e-time-transfer-budget-span-days-step-must-give = span_days / step_s は 16 から 20000 回の測定になるように指定しなければなりません

engine-time-transfer-budget-time-transfer-budget-offset-ns = time-transfer-budget：{ $name } - { $name2 } のオフセット { $ns } ns（Sagnac { $ns2 } ns、電離圏 { $ns3 } ns）；合成 u { $ns4 } ns（タイプ A { $ns5 } ns、{ $averaging_s } s）；{ $series } 実系列（MODELLED）

engine-e-tle-non-ascii-characters-in-tle = TLE { $label } に非 ASCII 文字があります：{ $line }

engine-e-tle-tle-truncated-reading-columns = TLE が { $what } の読み取り中に途切れています（列 { $v1 }..{ $z }）

engine-e-tle-tle-too-short-for-column = TLE { $label } が短すぎて、列 69 のチェックサムがありません

engine-e-tle-tle-has-no-checksum-digit = TLE { $label } の列 69 にチェックサム桁がありません

engine-e-tle-tle-checksum-mismatch-column-69 = TLE { $label } のチェックサムが一致しません：列 69 は { $want }、計算値は { $got }

engine-e-tle-not-tle-line = TLE の 1 行目ではありません：{ $line1 }

engine-e-tle-not-tle-line-2 = TLE の 2 行目ではありません：{ $line2 }

engine-e-tle-invalid-in-tle = TLE 内の { $what } が不正です：{ $s }

engine-e-tle-invalid-epoch-year-in-tle = TLE 内のエポック年が不正です：{ $col }

engine-e-tle-invalid-catalogue-number-in-tle = TLE 内のカタログ番号が不正です：{ $col }

engine-e-tle-inclination-out-of-range-180 = 軌道傾斜角が [0, 180] deg の範囲外です：{ $inclination_deg }

engine-e-tle-eccentricity-out-of-range = 離心率が [0, 1) の範囲外です：{ $eccentricity }

engine-e-tle-non-positive-mean-motion = 平均運動が正ではありません：{ $mean_motion_rev_day }

engine-e-tle-invalid-mantissa-in-tle = TLE 内の { $what } の仮数部が不正です：{ $mant }

engine-e-tle-invalid-exponent-in-tle = TLE 内の { $what } の指数部が不正です：{ $exp }

engine-tle-satellite-line-only-element-set = 衛星 { $satnum }：line-2 のみの軌道要素セットを、解析的なケプラー（二体）要素として解析しました。line-1 の抗力/B* と SGP4 の永年項がないため、この軌道はエポックから離れるほど真の SGP4 フィットからずれていきます。SGP4 の精度が必要な場合は、対応する line 1 を指定してください

engine-e-tracking-loop-tracking-loop-the-n0-profile = tracking-loop：C/N0 プロファイルには正のエポックと継続時間が必要です

engine-e-tracking-loop-tracking-loop-the-n0-profile-2 = tracking-loop：C/N0 プロファイルには { $MAX_DETECTOR_STEPS } を超える検出器ステップが必要になります（エポックあたり { $epoch_s } s で { $total } s）。ramp_duration_s を短くするか、predetection_integration_s を長くしてください

engine-e-tracking-loop-tracking-loop-must-be-finite = tracking-loop：{ $name } は有限でなければなりません

engine-e-tracking-loop-tracking-loop-must-be-positive = tracking-loop：{ $name } は正でなければなりません（実際の値 { $v }）

engine-e-tracking-loop-tracking-loop-correlator-spacing-chips = tracking-loop：correlator_spacing_chips は 1.9 chips 未満でなければなりません（実際の値 { $correlator_spacing_chips }）

engine-e-tracking-loop-tracking-loop-pullin-bandwidth-ratio = tracking-loop：pullin_bandwidth_ratio は 1 以上でなければなりません（実際の値 { $pullin_bandwidth_ratio }）— 追尾時より狭い帯域幅で再引き込みを行うループは、ヒステリシスを逆転させてしまいます

engine-e-tracking-loop-tracking-loop-ramp-duration-must = tracking-loop：ramp_duration_s は負であってはなりません

engine-e-tracking-loop-tracking-loop-cn0-low-dbhz = tracking-loop：cn0_low_dbhz（{ $cn0_low_dbhz }）は cn0_high_dbhz（{ $cn0_high_dbhz }）を超えてはなりません

engine-e-tracking-loop-tracking-loop-must-not-be = tracking-loop：{ $name } は空であってはなりません

engine-e-tracking-loop-tracking-loop-has-entries-the = tracking-loop：{ $name } のエントリーは { $axis } 個です。上限は { $MAX_AXIS_LEN } です

engine-e-tracking-loop-tracking-loop-holds-non-finite = tracking-loop：{ $name } に有限でない値が含まれています

engine-e-tracking-loop-tracking-loop-the-confirmation-dwells = tracking-loop：確認の滞留時間は 1 エポック以上でなければなりません

engine-e-twstft-budget-at-least-eight-samples-are = 少なくとも八サンプルが必要です

engine-e-twstft-budget-samples-must-increase-in-time = サンプルは時間とともに増加していなければなりません

engine-e-twstft-budget-samples-must-be-on-regular = サンプルは等間隔のグリッド上になければなりません

engine-verification-rows-externally-validated-modelled-partner = { "\u000A" }{ $total } 行：外部で検証済み { $validated } 行、モデル化 { $modelled } 行、パートナー所管 { $partner_owned } 行。{ "\u000A" }

engine-verification-the-complete-machine-checked-evidence = 機械検証された完全なエビデンス台帳（ledger）：**{ $total } 行 — VALIDATED { $validated } 行、MODELLED { $modelled } 行、PARTNER { $partner_owned } 行**。行を VALIDATED にできるのは、独立した外部のオラクル（独立した参照）がある場合のみです（マトリクスの不変条件テストがこれを強制します）。同じデータを、各テスト、モジュール、コミット済みフィクスチャへの行ごとのクリック可能なリンク付きで示したものが、https://kshana.dev の *Validation ledger* です。各 Modelled 行が外部で検証されていない理由は [MODELLED-RATIONALE.md](MODELLED-RATIONALE.md) を参照してください。{ "\u000A\u000A" }

engine-verification-capabilities-labelled-modelled = { "\u000A" }MODELLED と表示された機能は { $modelled } 件です。{ "\u000A" }

engine-wasm-files-json-is-not-json = files_json は JSON ではありません：{ $e }

engine-wasm-runs-json-is-not-json = runs_json は JSON ではありません：{ $e }

engine-wasm-runs-needs-label = runs[{ $i }] には `label` が必要です

engine-wasm-runs-needs-result = runs[{ $i }] には `result` が必要です

engine-wasm-results-json-is-not-json = results_json は文字列の JSON 配列ではありません：{ $e }

engine-wasm-maps-json-must-be-json = maps_json は文字列の JSON 配列でなければなりません：{ $e }

engine-wasm-plans-json-is-not-json = plans_json は文字列の JSON 配列ではありません：{ $e }

engine-wasm-options-json-is-not-json = options_json は JSON ではありません：{ $e }

engine-wasm-input-is-about-bytes-over = 入力は約 { $b64 } バイトで、{ $v2 } バイトの上限を超えています

## legal

# legal: native review
engine-legal-compliance-statement = 「evidenced」と記された行は、この集合内の実行が、その行に挙げられた機能の証拠を裏付けることを意味します。これはフレームワークが満たされたという判定ではなく、いかなる製品も誰かによって評価または承認されたことを意味しません。ギャップ列は、実行が示していないことを述べています。

# legal: native review
engine-legal-bench-surface-notice = 車両の動きとラベル付けされたイベント区間のみです。ここでエクスポートされるものは、無線周波数またはベースバンドの信号ではなく、そのような信号をモデル化することも駆動することもなく、イベントは時間区間であって干渉を生成するための手順ではありません。信号は実験室のシミュレータとその運用者が供給し、運用者は、許可されている場所でのみ（シミュレータ自身の安全上の指示に従い、伝導接続またはシールド環境で）それらを実行する責任を負います。Kshanaは、そのような実行の結果を公表しません。

# legal: native review
engine-legal-iq-campaign-roc-statement = MODELLED：与えられた記録上の各モニタのウィンドウ単位ROCです。示された各イベントウィンドウは陽性、イベント外の各roc_window_sウィンドウは陰性とし、モニタの検定統計量がそのウィンドウ内でしきい値に達したとき、そのしきい値でウィンドウを数えます。P_faは検定ごとではなく、陰性ウィンドウごとです。

# legal: native review
engine-legal-lunanet-afs-advisory = 助言のみ：研究・エンジニアリング用ツールによる解析出力であり、型式承認を受けた航法装置ではなく、人命安全（safety-of-life）サービスでもありません。公開仕様の一つの版に対してシンボル列を検査するものであり、いかなるLunaNetのノードやサービスについても何も述べません。

# legal: native review
engine-legal-iqfit-statement = MODELLED：フィットされたすべての数値は、与えられた記録上のオープンな受信機（名前を挙げたループ設計とフロントエンド構成）を記述し、キャンペーンのスコア付き結果にフィットされています。他の受信機の測定ではありません。予測にはPREDICTIONと表示され、最も近い試験済み記録と、試験済み条件からの距離が付きます。

# legal: native review
engine-legal-iqfit-advisory = 助言のみ：解析出力であり、型式承認を受けた航法装置ではありません。予測は誤差を明示したモデル出力であり、保証ではありません。

# legal: native review
engine-legal-lunar-time-lab-source-statement = 出典の記述であり、主張ではありません：2024年6月のICG WG-B Lunar PNT資料（unoosa.org、LunarPNT_Jun24_01_04.pdf、本研究の出典S3）は、ナノ秒レベルの時刻目標を持つ、局における月の時刻基準ラボを記述しています。Kshanaはこの目標を文脈のためにのみ引用し、採用はしません。このブロックのどこにも、実在する局のクロックがそれを満たすことを示すものはありません。

# legal: native review
engine-legal-standards-pack-notice = 標準パックは、実行前に定められた基準に対してモデル化されたシナリオを測定します。名前を挙げたフレームワークの行について証拠を裏付けますが、いかなる製品も評価も承認もしません。METの基準は、シナリオのモデル化された出力が定められた基準を満たしたことのみを意味します。

# legal: native review
engine-legal-standards-pack-advisory = 助言のみ：研究・エンジニアリング用ツールによる解析出力であり、型式承認を受けた航法装置ではなく、人命安全（safety-of-life）サービスでもありません。航法または安全に関するいかなる判断の唯一の根拠としても使用してはなりません。

# legal: native review
engine-legal-geometry-statement = 示された誤差モデルの下での幾何：示されたスカイラインに対する見通し可視性、DOP、および、示されたユーザ等価距離誤差を持つ、独立・同一・平均ゼロのガウス距離誤差に対するガウス誤差楕円です。バイアス、マルチパス、非見通し線誤差も含む受信機の実際の誤差の予測ではなく、インテグリティの限界でもありません。プリセットのコンステレーションは代表的な幾何であり、その日付のその場所の空ではありません。

# legal: native review
engine-legal-resilience-disclaimer = シミュレーションに基づく自己評価で、DHS RPCF v2.0に対応づけられています。これは認証でも認定でもなく、いかなる機関（DHS、IEEEなど）の承認も表しません。すべてのサブスコアは、明示的にVALIDATEDと記されていない限りMODELLEDであり、スコアは時間領域と検出の性能指標であって、位置領域の精度ではありません。

# legal: native review
engine-legal-observatory-notice = 劣化セルとは、その日そこで航空機の高い割合が低い航法精度を報告したことを意味します。原因は特定しません。観測されていない、または存在しないセルは評価されていないのであり、問題なしと同じではありません。助言のみ：承認、認証、適合性の表明ではありません。

# legal: native review
engine-legal-receiver-trust-advisory = 助言用ソフトウェアであり、型式承認を受けた航法装置（IEC 61108、IEC 61162）ではありません。船舶の航行の責任は引き続き運用者にあります。

# legal: native review
engine-legal-evidence-roundtrip-notice = ハッシュで4つの記録を結び付けます：シナリオ、実験室が示した試験条件、受信機ログ、および示されたイベントに対するそのログのスコアです。これは信号でも、再生手順でも、認証でもありません。シナリオの動きがどのように受信機に届いたか（実験室のシミュレータで再生されたファイル、伝導接続またはシールド環境）は運用者の責任であり、ここには示されたとおりにのみ記録されています。

# legal: native review
engine-legal-evidence-bundle-disclaimer = このパックは、Kshanaエンジンが、示された受信機ログから、示された設定で計算した内容の技術記録です。法的見解でも、いかなる事象やその原因に関する事実認定でも、認証でもありません。

# legal: native review
engine-legal-bench-notice = 助言のみ：明示された参照に対してモデル化または測定したものであり、承認、認証、適合性の表明ではありません。スコアはログまたはコーパスを記述するものであり、製品を記述するものではありません。

# legal: native review
engine-legal-osnma-advisory = 助言のみ：これは解析・監視の出力であり、型式承認を受けた航法装置ではありません。ここに示す認証状態は航法のインテグリティサービスではなく、航法または安全に関するいかなる判断の唯一の根拠としても使用してはなりません。
