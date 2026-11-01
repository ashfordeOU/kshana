> この文書は README.md（v0.40.0）の機械翻訳であり、ネイティブスピーカーによる確認はまだ行われていません。英語版の README が基準です。[English](README.md)

<!-- docs/assets/readme/ 以下の画像は、tools/gen_readme_assets.py によって実際のエンジン実行から生成されます
     （ライト版とダーク版）。再生成は
     `python3 tools/gen_readme_assets.py --kshana <path to kshana>` で行い、`--check` で確認します。
     docs/assets/readme/studio/ 以下の Kshana Studio のスクリーンショットは、実行中の Studio から
     tools/capture_studio_shots.mjs によって撮影され、studio/SHOTS.json に記録されます。 -->

<p align="center">
  <picture>
    <source media="(prefers-color-scheme: dark)" srcset="docs/assets/readme/kshana-logo-dark.svg">
    <source media="(prefers-color-scheme: light)" srcset="docs/assets/readme/kshana-logo-light.svg">
    <img src="docs/assets/readme/kshana-logo-light.svg" alt="Kshana：正確な瞬間を示すコンパスのレティクルのマークと、ワードマーク kshana" width="300">
  </picture>
</p>

<p align="center">
  <strong>Kshana · <span lang="sa">क्षण</span> · <em>正確な瞬間</em></strong><br>
  PNT（測位・航法・タイミング）のレジリエンスのためのオープンソース・シミュレーター。
</p>

<p align="center">
  <a href="https://github.com/ashfordeOU/kshana/actions/workflows/ci.yml"><img src="https://img.shields.io/github/actions/workflow/status/ashfordeOU/kshana/ci.yml?branch=main&event=push&label=CI&style=flat-square&labelColor=0A1226" height="18" alt="main ブランチの継続的インテグレーションの状態"></a>
  <a href="docs/COVERAGE.md"><img src="https://img.shields.io/badge/coverage-~95%25-377D0C?style=flat-square&labelColor=0A1226" height="18" alt="src/ の行カバレッジは約 95 %。docs/COVERAGE.md で測定し、継続的インテグレーションで 85 % をゲートとしています"></a>
  <a href="#evidence"><img src="https://img.shields.io/badge/validated-176%2F401-377D0C?style=flat-square&labelColor=0A1226" height="18" alt="401 の機能のうち 176 が独立した外部のオラクルに対して VALIDATED（検証マトリクスより）"></a>
  <a href="https://sonarcloud.io/summary/overall?id=ashfordeOU_kshana"><img src="https://img.shields.io/sonar/quality_gate/ashfordeOU_kshana?server=https%3A%2F%2Fsonarcloud.io&label=quality&style=flat-square&labelColor=0A1226" height="18" alt="SonarQube Cloud の品質ゲートの状態"></a>
  <a href="https://github.com/ashfordeOU/kshana/releases"><img src="https://img.shields.io/badge/release-v0.40.0-066A86?style=flat-square&labelColor=0A1226" height="18" alt="リリース v0.40.0"></a>
  <a href="docs/i18n.md"><img src="https://img.shields.io/badge/languages-English%20%2B%2017-3F4B67?style=flat-square&labelColor=0A1226" height="18" alt="英語とさらに 17 言語（機械翻訳）"></a>
  <a href="LICENSE"><img src="https://img.shields.io/badge/licence-AGPL--3.0-3F4B67?style=flat-square&labelColor=0A1226" height="18" alt="ライセンス：AGPL-3.0-only"></a>
  <br>
  <a href="https://doi.org/10.5281/zenodo.20528627"><img src="https://img.shields.io/badge/DOI-zenodo.20528627-7E4B00?style=flat-square&labelColor=0A1226" height="18" alt="DOI 10.5281/zenodo.20528627、すべてのリリースをまとめた Zenodo のコンセプトレコード"></a>
  <a href="#editions"><img src="https://img.shields.io/badge/commercial-available-B8288F?style=flat-square&labelColor=0A1226" height="18" alt="Ashforde® OÜ から商用ライセンスを取得できます。エディションを参照してください"></a>
  <a href="https://crates.io/crates/kshana"><img src="https://img.shields.io/crates/v/kshana?label=crates.io&color=066A86&cacheSeconds=3600&style=flat-square&labelColor=0A1226" height="18" alt="crates.io 上の kshana の現在の公開バージョン"></a>
  <a href="https://pypi.org/project/kshana/"><img src="https://img.shields.io/pypi/v/kshana?label=PyPI&color=066A86&cacheSeconds=3600&style=flat-square&labelColor=0A1226" height="18" alt="PyPI 上の kshana の現在の公開バージョン"></a>
  <a href="https://www.npmjs.com/package/kshana"><img src="https://img.shields.io/npm/v/kshana?label=npm&color=066A86&cacheSeconds=3600&style=flat-square&labelColor=0A1226" height="18" alt="npm 上の kshana の現在の公開バージョン"></a>
</p>

<p align="center">
  <a href="https://kshana.dev">Kshana Studio を開く</a> ·
  <a href="#install">インストール</a> ·
  <a href="#capabilities">機能</a> ·
  <a href="#evidence">エビデンス</a> ·
  <a href="#research">研究</a> ·
  <a href="docs/CONCEPTS.md">ドキュメント</a> ·
  <a href="#cite">引用</a>
</p>

<p align="center">
  <strong>言語：</strong> <a href="README.md">English</a> ·
  <a href="README.nl.md"><span lang="nl">Nederlands</span></a> ·
  <a href="README.pl.md"><span lang="pl">Polski</span></a> ·
  <a href="README.pt-BR.md"><span lang="pt-BR">Português (Brasil)</span></a> ·
  <a href="README.pt-PT.md"><span lang="pt-PT">Português (Portugal)</span></a> ·
  <a href="README.fi.md"><span lang="fi">Suomi</span></a> ·
  <a href="README.sv.md"><span lang="sv">Svenska</span></a> ·
  <a href="README.da.md"><span lang="da">Dansk</span></a> ·
  <a href="README.nb.md"><span lang="nb">Norsk bokmål</span></a> ·
  <a href="README.cs.md"><span lang="cs">Čeština</span></a> ·
  <a href="README.uk.md"><span lang="uk">Українська</span></a> ·
  <a href="README.ru.md"><span lang="ru">Русский</span></a> ·
  <a href="README.de.md"><span lang="de">Deutsch</span></a> ·
  <a href="README.fr.md"><span lang="fr">Français</span></a> ·
  <a href="README.es.md"><span lang="es">Español</span></a> ·
  <a href="README.et.md"><span lang="et">Eesti</span></a> ·
  <a href="README.ja.md"><span lang="ja">日本語</span></a> ·
  <a href="README.zh-Hans.md"><span lang="zh-Hans">简体中文</span></a><br>
  <sub>コマンドライン、実行サマリー、チャート、レポートは <code>--lang &lt;tag&gt;</code> で各言語を使います
  （例：<code>kshana scenarios/holdover-test-example.toml --lang de</code>）。Python、WebAssembly、MCP の各サーフェスも同様です。
  これらはネイティブスピーカーによる確認がまだ行われていない機械翻訳であり、英語が基準です。
  <a href="docs/i18n.md">ローカライズ</a>を参照してください。</sub>
</p>

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/assets/readme/hero-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/assets/readme/hero-light.svg">
  <img src="docs/assets/readme/hero-light.svg" alt="GNSS が途絶える 1 分間をリハーサルする。エンジン v0.40.0 の実際の実行から描いた Kshana のミッションコンソール：連鎖キャンペーン campaign-jam-spoof-holdover-integrity（シード 20260928、6 フェーズ、T+01:16:10 にわたる 18 のメンバー実行）と、constellation-multi-gnss-coverage の GPS、Galileo、BeiDou、GLONASS の 102 機の衛星。各衛星はエンジンの地上軌跡から復元した円形の二体軌道上に描かれ、半径は表示用に圧縮されています。時計の時刻誤差は 50 ns のガードに対して 62.7 ns でピークに達し、搬送波対雑音密度は 25 dB-Hz の下限に対して -12.2 dB-Hz まで低下し、垂直保護レベルは 50 m のアラートリミットに対して 135.4 m に達します。" width="100%">
</picture>

<details>
<summary><strong>目次</strong></summary>

- [GNSS が途絶える 1 分間をリハーサルする](#rehearse-the-minute-gnss-goes-dark)
- [0.40 の新機能](#whats-new-in-040)、[0.39 の新機能](#whats-new-in-039)、[0.38 の新機能](#whats-new-in-038)、[0.38 の詳細](#038-in-depth)：Jammertest のスコアリング、受信機自身のフラグ、機器からの入力、タイミングとホールドオーバー、標準パック、LunaNet AFS、ラボのラウンドトリップ、kshana-bench、オブザーバトリー、エクスポーター、光通信、[宇宙利用者の航法](#space-user-navigation-gnss-ssv)、[月面インフラ](#lunar-infrastructure-lunar-infrastructure)
- [Kshana Studio](#kshana-studio) と Studio の全ページ
- [機能](#capabilities)：分野の表、[ファミリー別の全シナリオ種別](#every-scenario-kind-by-family)、[全コマンド](#every-command)、[全サーフェス](#every-surface)
- [実行の仕組み](#how-a-run-works)、[ミッション](#missions)
- [エビデンス](#evidence)：台帳（ledger）、[機能ドメイン](#capability-domains)
- [インストール](#install)、[アーキテクチャ](#architecture)（および[図](#diagrams)）、[AI アシスタント](#ai-assistant)
- [エディション](#editions)、[研究](#research)、[引用](#cite)、[ライセンス](#licence)
- [リファレンス](#reference)：使い方、シナリオ形式、出力、リポジトリ構成、FAQ、トラブルシューティング、バージョニング、ロードマップ、コントリビューション、ドキュメント

</details>

<a id="rehearse-the-minute-gnss-goes-dark"></a>
## GNSS が途絶える 1 分間をリハーサルする

Kshana は、GNSS（全地球航法衛星システム）の信号が失われたときのジャミング、スプーフィング、時計のホールドオーバーを再現し、
システムが時刻と位置をどれだけの時間バジェット内に保てるか、そしてどの時計やセンサーが最も多くのマージンを
もたらすかを示します。Kshana は 1 つの Rust エンジンです。ターミナル、ノートブック、IDE（統合開発環境）、
AI（人工知能）アシスタント、
またはブラウザーで動作します。

すべての実行は、シナリオ、シード、エンジンのバージョンからビット単位で再現できます。
すべての機能には、機械的に検査される台帳（ledger）の中で 3 つのラベルのいずれかが付きます：**VALIDATED**（独立した
外部のオラクルと一致する）、**MODELLED**（内部的に整合しており、そのことを明言している）
または **PARTNER**（ハードウェアパートナーが担当する）。

> **ステータス：v0.40.0。** PNT のレジリエンスのための、検証済みで再現可能なシミュレーション基盤です。
> 最も検証が進んでいる分野であるため、タイミングとホールドオーバーを最優先としています。Kshana は
> 検討とトレードオフのための道具です。無線周波数（RF）信号発生器のハードウェアではなく（無線機を
> 駆動せず、何も送信しません。信号レベルの出力は、ソフトウェア受信機向けのベースバンド IQ サンプルファイルです）、
> ハードウェア受信機や認証済みの GNSS 受信機でもなく（そのソフトウェア受信機は
> 解析ツールです）、フライト製品でもありません。この分野が初めての方は、
> [平易な言葉による入門](docs/CONCEPTS.md)と[用語集](docs/GLOSSARY.md)から始めてください。

<a id="whats-new-in-040"></a>
## 0.40 の新機能

0.40 では、ミッションレベルの誤差バジェットを追加し、すべての図と表にエビデンスのティアを付け、実測の時計ログを読み込み、
データパートナーの提出物を検査し、干渉源が存在しうる場所を推定し、英語に加えて 17 の言語に対応しました。
台帳は 401 行になりました：VALIDATED 176、MODELLED 221、PARTNER 4。VALIDATED に昇格した行はなく、以下のすべての未達は
テストで固定されています。

- **ミッションスレッド。** `mission-thread` 種別は、打ち上げから突入までのフェーズ（`launch-ascent`、`leo-rendezvous`、
  `tli-and-cruise`、`entry` と 4 つの月面種別）を、明示した引き継ぎ規則、明示した要求に対するマージン、最も弱い
  リンクとともに連鎖させます。11 フェーズ（地球と月のセグメント）にわたる Artemis 級のエンドツーエンドの例があり、シナリオ種別は全部で 92 です。すべての数値は MODELLED です。公開されている Artemis I の軌道に対する月周辺空間（シスルナ）の伝搬は、
  事前登録した合格基準に**届きません**（5 km と 0.05 m/s に対して 45.3 km と 0.25 m/s。原因はモデルに含まれない小さなマヌーバです）。CAPSTONE の
  軌道に対する月の伝搬器も**届きません**（1 周回の終了時点で 25 km に対して 136.8 km）。LRO との比較は合格基準を満たします。これらの行は MODELLED のままです
  （[ミッションスレッド](docs/MISSION-THREAD.md)、[月セグメント](docs/MISSION-THREAD-LUNAR.md)）。Studio では、スレッドは `/studio/mission-thread/` で読めます。
- **エビデンスラベル。** 実行が書き出すすべての図と表には、マトリクスから読み取ったティアと、その根拠となる台帳の行 id が付きます。
- **実測の時計。** 8 種類の時計ログ形式を読み込み（[`docs/CLOCK-LOG-FORMATS.md`](docs/CLOCK-LOG-FORMATS.md)）、フィットした
  系列でホールドオーバーを駆動できます。事前登録した合格基準に対して、フィットは 6 件中 5 件で F1(a) に、1 件で F2 に**届きません**。どちらも
  MODELLED のままです（[変更履歴](CHANGELOG.md#0400---2026-10-29)）。
- **データパートナー。** `kshana partner check` は提出物の形式を検査し、何もスコアリングしません（[`docs/PARTNER-DATA.md`](docs/PARTNER-DATA.md)）。
- **干渉源の領域。** `kshana interference-map locate` は、ADS-B または AIS のレポートから、単なる点ではなく常に領域と楕円を
  返します。Jammertest 2025 の送信機サイトと一度比較したところ、結果は両方のソースで **NOT ASSESSABLE**（オープンデータ中の
  予定されたセッションが少なすぎるため）であり、この行は MODELLED のままです（[干渉マップ](docs/INTERFERENCE-MAP.md#emitter-region-interference-map-locate)）。
- **ベンチマーク。** 0.40 の再キャンペーンは A3、D3（いずれも EXPLORATORY）、R3、R4 を満たします。A2、D1、R1 は NOT MET のままです（[Bench](docs/BENCH.md)）。
- **言語。** nl、pl、pt-BR、pt-PT、fi、sv、da、nb、cs、uk、ru、de、fr、es、et、ja、zh-Hans を、**ネイティブ
  スピーカーによる確認が行われていない機械翻訳**として提供します。英語が基準であり、英語以外での実行には約 2 倍の時間がかかります
  （[`docs/i18n.md`](docs/i18n.md)）。

<a id="whats-new-in-039"></a>
## 0.39 の新機能

0.39 は機能を追加せず、結果も変更しません。エンジンの出力は 0.38 の出力と同じです。コマンドラインの
1 つの問題を修正し、クロスバリデーション用ツールの依存関係を更新し、ベンチマークの
判定をすべて記載します。

- **コマンドライン。** `kshana kinds | head`（標準出力が閉じられた場合全般）でパニックしなくなりました。プログラムは
  他のツールがパイプを閉じられたときと同様に、ステータス 141 で静かに終了します。その他の書き込みエラーは引き続き報告されます。
- **依存関係。** 2 つの ANISE クロスチェック用ロックの `memmap2` 0.9.11、オラクル環境の固定版の `pillow` 13.0.0 と
  `certifi` 2026.10.19。すべて `xval/` 以下であり、出荷物は何も変わっていません。
- **kshana-bench、全判定。** 事前登録した合格基準に対して 3 つが NOT MET であり、それぞれテストで固定されています：
  A2（`agc_k_sigma` の AUC は 0.80 以上に対して 0.766）、D1（最大ギャップ 0.0301）、タスク (b) の R1（持ち越し、
  再実行なし）。緩めた合格基準はありません（[Bench](docs/BENCH.md)）。

<a id="whats-new-in-038"></a>
## 0.38 の新機能

0.38 は中立な審判を測定可能にします。公開されている試験スケジュールに対して受信機ログをスコアリングし、
より多くの受信機とセンサーを読み込み、タイミングシステムを試験し、ベンチマークと
干渉オブザーバトリーを提供します。引き続き助言用です。ここにあるものは何も認証されておらず、どの結果も型式承認ではなく、
何も送信しません。各行には、台帳がその行について何を保持しているかを記載しています（[ラベルの獲得方法](#evidence)）。
ステータスは確認した内容だけを示し、確認していない内容は台帳の行とリンク先のページに記載しています。

| 0.38 の新機能 | 何をするのか、その理由 | 台帳のステータス | 参照 |
|---|---|---|---|
| **Jammertest のスコアリング** | `kshana jammertest import` は公開されている NPRA の試験カタログと送信計画を予定された真値として読み込みます。`jammertest score` は受信機ログを試験ごとにスコアリングします（検出の遅延、見逃し、誤警報、復帰までの時間）。鍵を与えれば署名付きのエビデンスパックとして出力します | **MODELLED**：台帳の 1 行。合格基準はスコアリングした実行より前に事前登録しました。JammerTest 2024 のデータでは、最小データ規則が両方の実行で満たされず（必要な 10 に対してスコアリング可能なウィンドウは 4 と 7）、**評価できる合格基準はなく**、何も主張していません | [Jammertest](docs/JAMMERTEST.md) |
| **受信機自身のフラグ** | UBX-NAV-STATUS `spoofDetState`、UBX-SEC-SIG、NovAtel RXSTATUS をエポックごとの `self_report` に読み込み、Kshana の警報と比較します（両方、受信機のみ、Kshana のみ、どちらでもない）。Septentrio SBF リーダーと読み取り専用の `--serial` 入力 | **MODELLED**。受信機の検出器と Kshana の検出器の一致は検証ではありません | [受信機の信頼性](docs/RECEIVER-TRUST.md) |
| **より多くの受信機とセンサー** | RTKLIB `.pos`、NovAtel OEM7、RTCM 3 MSM4/MSM7 の C/N0（RTCM の本文ではなく、BSD ライセンスの pyrtcm の表から）、GNSS-SDR のモニターストリーム、第 2 のセンサーとしての IMU ログ、ROS 2 パッケージ、`gnss_lib_py` ブリッジ、ハイブリッドセンサーのパラメーター用の `imu-fit` | **MODELLED**：台帳の 6 行。自作のフィクスチャのみであり、実際の受信機、IMU、GNSS-SDR の実行、ROS グラフからの取得データは読み込んでいません | [機器からの入力](docs/MACHINE-INPUTS.md) |
| **タイミングとホールドオーバーの試験** | `holdover-test` 種別は、実測した時刻誤差の記録からホールドオーバー試験（運用者による GNSS の除去、ホールドオーバー、復帰）を ITU-T マスクに対してスコアリングし、「マスクに対して測定」と表現します。linuxptp と chrony のログリーダー。ハードウェアの段階と `lab-attestation` フィールド | **MODELLED**：台帳の 2 行。時刻は運用者の申告であり、検証されていません | [Timing HIL](docs/TIMING-HIL.md)、[ハードウェアの安全性](docs/HARDWARE-SAFETY.md) |
| **標準パック、LunaNet AFS、ラボのラウンドトリップ** | DHS RPCF、IMO MSC.1/Circ.1575、ICAO Doc 9849 Appendix F 向けのスコアリング済みパックで、実行前に明示した合格基準に対して評価し、「の証拠を裏付ける（supports evidence for）」と表現します。NIST IR 8323r1 との対応表。LunaNet AFS のコード生成器とチェッカー。ラボでの実行のシナリオ、試験条件、受信機ログ、スコアを結び付ける署名付きパック | パックとラウンドトリップは **MODELLED**。AFS のコードチェックは、印刷されたチェック列に対して **VALIDATED** です（台帳の行を参照） | [標準](docs/STANDARDS.md)、[LunaNet AFS](docs/LUNANET-AFS.md) |
| **kshana-bench とオブザーバトリー** | 干渉検出、IQ 検出、ホールドオーバー予測、楽観ギャップのための固定されたタスク、分割、指標。封印したホールドアウトと静的なリーダーボード。24 時間の遅延、粗いセル、帰属の特定なしの、再現可能な日次の干渉プロダクト | 独自の台帳行はありません。提出物をスコアリングするものであり、そのベースラインは結果ファイル中で MODELLED とラベル付けされています。事前登録した合格基準に対して、スコアラー、C1 から C3、D2 は満たし、3 つの合格基準が **NOT MET** です（テストで固定）：A2（テスト分割で `agc_k_sigma` の AUC は 0.80 以上に対して 0.766）、D1（最大ギャップ 0.0301）、タスク (b) の R1（持ち越し、再実行なし）。`xval/bench/RESULTS-v2.md` を参照 | [Bench](docs/BENCH.md)、[オブザーバトリー](docs/observatory/METHOD.md) |
| **エクスポーター** | 信頼テレメトリーを、Prometheus、CEF、LEEF、OTLP に加えて Home Assistant の MQTT ディスカバリーとステートメッセージとして出力します（発行のみ、認証情報なし） | **MODELLED**：台帳の 1 行 | [信頼テレメトリー](docs/TRUST-TELEMETRY.md) |
| **時間に対する光リンクマージン** | `optical-atmosphere` 種別は、サイトの気象の 1 つのシード付き実現をリンクマージンの系列として書き出せます | **MODELLED**：台帳の 1 行。モデルからの 1 回の抽出であり、気候そのものではありません | [光大気](docs/OPTICAL-ATMOSPHERE.md) |

0.37 のハイライト：[変更履歴](CHANGELOG.md#0370---2026-10-17)。0.38 の完全な一覧は
[変更履歴](CHANGELOG.md#0380---2026-10-19)にあります。

<a id="038-in-depth"></a>
## 0.38 の詳細

上の表の各機能を数行で説明します：何をするのか、実行するための 1 つのコマンド、エンジンの実際の実行から
描いた 1 枚の図、そして台帳がその機能について何を保持しているか。図は
[`tools/gen_figures_038.py`](tools/gen_figures_038.py) によって
[`docs/figures/0.38/`](docs/figures/0.38/) に書き出されます（手で描かれることはありません）。`python3 tools/gen_figures_038.py`
はビルド済みのエンジンから図を書き直し、`--check` は図が古い場合やここでのキャプションが異なる場合に失敗します。
入力がログである場合、それはスクリプトが書き出す架空のログです。実際のサードパーティのログは
リポジトリに同梱されないためであり、キャプションにもそう記載しています。以下はすべて助言用です：認証されておらず、
型式承認でもなく、何も送信しません。ステータスは確認した内容を示すだけで、それ以上ではありません。
[ラベルの獲得方法](#evidence)。

### Jammertest のスコアリング

`kshana jammertest import` は、公開されている NPRA の試験カタログと送信計画を
予定された真値に変換し、`kshana jammertest score` はそれに対して受信機ログをスコアリングします：
予定された各試験について、検出されたかどうか、どれだけ遅れたか、受信機の復帰にどれだけ時間がかかったか、さらに
どのスロットにも属さない誤警報です。カタログは取得するものであり、リポジトリに同梱されることはありません。

```sh
xval/jammertest-plan/fetch.sh ../jammertest-plan
kshana jammertest score session.toml --catalog ../jammertest-plan/testcatalog2025.json \
    --plan ../jammertest-plan/plan-tuesday-2025-09-16.json --location 1 --json
```

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/figures/0.38/jammertest-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/figures/0.38/jammertest-light.svg">
  <img src="docs/figures/0.38/jammertest-light.svg" alt="3 つの試験からなるスケジュールに対する 1 つの合成受信機ログのスコアリング。エンジン v0.40.0 の実際の実行（`kshana jammertest score`）から。ログは架空のもので、2 つの区間で C/N0 が 20 dB 低下する 1800 s の NMEA です。スケジュールには 3 つのスロットがあり、中央のスロットにはログ中にジャマーがありません。スコアは 3 試験中 2 試験を検出（遅延の中央値 0 s）、1 試験を見逃しとし、0.25 h のクリーンな時間における誤警報の連続は 0 です。ここには実際の受信機について何も述べていません。助言用ソフトウェアであり、型式承認を受けた航法装置（IEC 61108、IEC 61162）ではありません。船舶の航行の責任は引き続き運用者にあります。">
</picture>

**台帳のステータス：MODELLED。** 合格基準はスコアリングした実行より前に固定しました。JammerTest 2024 のデータでは
最小データ規則が両方の実行で満たされなかったため、評価できる合格基準はなく、何も主張していません。
[Jammertest](docs/JAMMERTEST.md)。

### 受信機自身のフラグ

UBX-NAV-STATUS `spoofDetState`、UBX-SEC-SIG、NovAtel RXSTATUS をエポックごとの
`self_report` に読み込み、Kshana の警報と並べます：両方、受信機のみ、Kshana のみ、どちらでもない。
Septentrio SBF リーダーと読み取り専用の `--serial` 入力も同じ比較に入力されます。どちらの側も
真値ではありません。

```sh
kshana receiver-trust session.toml     # [log] format = "ubx", path = "receiver.ubx"
```

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/figures/0.38/receiver-flags-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/figures/0.38/receiver-flags-light.svg">
  <img src="docs/figures/0.38/receiver-flags-light.svg" alt="受信機自身のスプーフィングフラグと Kshana の警報の比較。架空の UBX ログ（1 Hz で 200 エポック）に対するエンジン v0.40.0 の実際の実行から。C/N0 は 80 から 90 s と 120 から 130 s で 20 dB 低下し、受信機は 120 から 130 s と 160 から 165 s にフラグを立てます。キャリブレーション後に比較した 140 エポックのうち、両方がフラグを立てたのは 11、受信機のみが 6、Kshana のみが 11、どちらでもないのが 112 でした。どちらの側も真値ではなく、一致は検証ではありません。助言：研究・エンジニアリング用ツールによる解析出力であり、型式承認を受けた航法装置ではなく、セーフティ・オブ・ライフのサービスでもありません。">
</picture>

**台帳のステータス：MODELLED。** 受信機の検出器と Kshana の検出器の一致は
検証ではありません。[受信機の信頼性](docs/RECEIVER-TRUST.md)。

### より多くの受信機とセンサー

RTKLIB `.pos`、NovAtel OEM7、RTCM 3 MSM4/MSM7 の C/N0、GNSS-SDR のモニターストリーム、第 2 のセンサーとしての
IMU ログ、ROS 2 パッケージ、`gnss_lib_py` ブリッジは、すべて同じ受信機信頼性のタイムラインに行き着きます。
`imu-fit` は、ハイブリッドと融合のシナリオが必要とするセンサーパラメーターを静止状態の IMU
ログから読み取るため、実際に手元にあるセンサーでシナリオを実行できます。

```sh
kshana imu-fit still.csv --format csv --axis x --expected-mean 0 --id bench-imu
```

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/figures/0.38/machine-inputs-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/figures/0.38/machine-inputs-light.svg">
  <img src="docs/figures/0.38/machine-inputs-light.svg" alt="`kshana imu-fit` が静止状態の IMU ログから読み取る内容。架空のログ（100 Hz で 20,000 サンプル、200 s）に対するエンジン v0.40.0 の実際の実行から：加速度計の速度ランダムウォーク q_va = 4.02e-06、ジャイロの角度ランダムウォーク q_arw = 9e-08、バイアス不安定性 0.00296、初期の Allan 傾き（-0.51 と -0.49。白色雑音が支配的な領域では約 -0.5）。横の表はコマンドが出力する TOML です。推定器は合成ログでのみ確認しています。助言：研究・エンジニアリング用ツールによる解析出力であり、型式承認を受けた航法装置ではなく、セーフティ・オブ・ライフのサービスでもありません。">
</picture>

**台帳のステータス：MODELLED。** 自作のフィクスチャのみです。実際の受信機、IMU、
GNSS-SDR の実行、ROS グラフからの取得データは読み込んでいません。[機器からの入力](docs/MACHINE-INPUTS.md)。

### タイミングとホールドオーバーの試験

`holdover-test` 種別は、実測した時刻誤差の記録から、ホールドオーバー試験（運用者による GNSS の除去、ホールドオーバー、復帰）を
ITU-T マスクに対してスコアリングし、そのとおりの言葉で表現します：マスクに対して
測定、と。linuxptp と chrony のログリーダーが入力を供給し、ハードウェアの段階と
`lab-attestation` フィールドが、誰が何を申告したかを示します。

```sh
kshana scenarios/holdover-test-example.toml
```

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/figures/0.38/timing-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/figures/0.38/timing-light.svg">
  <img src="docs/figures/0.38/timing-light.svg" alt="時刻誤差の記録からスコアリングしたホールドオーバー試験。scenarios/holdover-test-example.toml（5 s ごとに 601 サンプル）に対するエンジン v0.40.0 の実際の実行から。GNSS は 600 s に運用者によって除去され、2400 s に復旧します。時刻誤差はホールドオーバーの終了時に 299 ns までドリフトし、675 s 後に 100 ns のバジェットを超え、復旧の 70 s 後に 100 ns の帯域内に戻ります。判定：ベースラインのマスク PASS、ホールドオーバーのマスク FAIL、ホールドオーバーのエンベロープ FAIL、復帰 RECOVERED。マスクに対する測定であり、承認ではありません。時刻は運用者の申告であり、Kshana は検証していません。助言：研究・エンジニアリング用ツールによる解析出力であり、型式承認を受けた航法装置ではなく、セーフティ・オブ・ライフのサービスでもありません。">
</picture>

**台帳のステータス：MODELLED。** GNSS を除去した時刻と復旧した時刻は運用者の申告であり、
検証されていません。[Timing HIL](docs/TIMING-HIL.md)、[ハードウェアの安全性](docs/HARDWARE-SAFETY.md)。

### 標準パック

DHS Resilient PNT の試験プロファイル、IMO MSC.1/Circ.1575、ICAO Doc 9849
Appendix F 向けのスコアリング済みパックと、`compliance-report` 内の NIST IR 8323r1 との対応表です。各試験は同梱の
シナリオを実行し、結果のフィールドを実行前に明示した合格基準と比較します。受信機
ログを必要とする試験は、スコアリングせず、入力が必要なものとして列挙します。表現は「の証拠を裏付ける（supports evidence for）」です。

```sh
kshana standards-pack list
kshana standards-pack run imo-circ-1575
```

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/figures/0.38/standards-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/figures/0.38/standards-light.svg">
  <img src="docs/figures/0.38/standards-light.svg" alt="スコアリングされた 3 つの標準パックの全試験。エンジン v0.40.0 の実際の実行（`kshana standards-pack run`）から：dhs-rpcf：6 件が基準を満たし、1 件が満たさず、2 件は入力が必要。imo-circ-1575：1 件が満たし、4 件が満たさず、2 件は入力が必要。icao-doc9849-appf：6 件が満たし、0 件が満たさず、2 件は入力が必要。全体で 13 件が満たし、5 件が満たさず、6 件はエンジンが持たない入力（受信機ログまたは機器の文書）を必要とします。各合格基準は実行前に明示しました。未達は未達のまま残します。基準を満たしたということは、モデル化したシナリオが明示した基準を満たしたことを示すだけで、製品については何も示しません。パックは引用している行の証拠を裏付けるものであり、評価ではありません。助言：研究・エンジニアリング用ツールによる解析出力であり、型式承認を受けた航法装置ではなく、セーフティ・オブ・ライフのサービスでもありません。航法や安全に関するいかなる判断の唯一の根拠にもしてはなりません。">
</picture>

**台帳のステータス：MODELLED。** 基準を満たしたということは、モデル化したシナリオが明示した基準を満たしたことを示すだけで、
製品については何も示しません。すべての未達は残し、テストで固定しています。[標準](docs/STANDARDS.md)。

### LunaNet AFS

LunaNet Augmented Forward Signal のコード生成器（Gold、Weil、三次コード、メッセージ
フレームとその誤り訂正符号化）と、記録または生成されたシンボルストリームのチェッカーです。仕様書の 1 つの
版に固定されています。

```sh
kshana lunanet-afs-check spec
kshana lunanet-afs-check generate --frames 2 --out afs.sym
kshana lunanet-afs-check symbols afs.sym
```

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/figures/0.38/lunanet-afs-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/figures/0.38/lunanet-afs-light.svg">
  <img src="docs/figures/0.38/lunanet-afs-light.svg" alt="仕様書に印刷された列に対して確認した LunaNet AFS のコード生成器。エンジン v0.40.0 の実際の実行（`kshana lunanet-afs-check spec`、LNIS V5, AD1 Volume A (LSIS-AFS) V1.0, 29 January 2025 に固定。この文書はコード表に {LSIS-TBC} と記しています）から。10 件のチェックのうち 9 件が基準を満たし、B4 は NOT MET です（421 件中 420 件が一致）。これは公開された仕様書の 1 つの版に対してシンボルストリームを確認するものであり、LunaNet のいかなるノードやサービスについても何も述べていません。助言：研究・エンジニアリング用ツールによる解析出力であり、型式承認を受けた航法装置ではなく、セーフティ・オブ・ライフのサービスでもありません。これは公開された仕様書の 1 つの版に対してシンボルストリームを確認するものであり、LunaNet のいかなるノードやサービスについても何も述べていません。">
</picture>

**台帳のステータス：VALIDATED**（コードと同期のチェックについて、仕様書が印刷している値に対して。仕様書はそれらを
TBC と記しています）。1 件のチェックは NOT MET であり、残して固定しています（印刷された三次コードの
1 列が異なります。文書は 2 つの PRN に同じ値を印刷しています）。サブフレーム 2 から 4 の LDPC と CRC のワードは
確認していません。どれがどうであるかは台帳の行に正確に記載しています。[LunaNet AFS](docs/LUNANET-AFS.md)。

### ラボのラウンドトリップ

`kshana.test-conditions/1` は、ラボが行ったこと（イベント、時刻、
電力）を記述する公開形式です。`kshana evidence round-trip` は、シナリオのハッシュ、条件のハッシュ、受信機ログの
ハッシュ、スコアを 1 つの署名付きパックに結び付け、条件とスコアリング用シナリオが
イベントについて食い違うパックを拒否します。Kshana は信号を生成も再生もしません。シナリオがどのように
受信機に届いたかは運用者の責任です。

```sh
kshana evidence --help
```

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/assets/readme/evidence-pack-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/assets/readme/evidence-pack-light.svg">
  <img src="docs/assets/readme/evidence-pack-light.svg" alt="エビデンスパックの構造。受信機ログ（NMEA、u-blox UBX、RINEX 3 または Android のログ）と時間ウィンドウが kshana receiver-trust evidence に入り、7 つのファイルを書き出します：log-slice.bin、config.json、epochs.json、summary.html、manifest.json、manifest.sig、任意の timestamp.tsr。マニフェストは、ログ全体と各ファイルの SHA-256、およびファイル全体にわたるハッシュチェーンを記録し、署名はマニフェストを対象とします。kshana evidence verify は署名、各ファイルのハッシュ、チェーン、一覧にないファイルが存在しないことを確認し、検証できた場合は 0、何かが失敗した場合は 1、署名者が固定されていない場合は 3 で終了します。パックは技術的な記録であり、法的な意見ではありません。">
</picture>

この図はパックの構成です。**台帳のステータス：MODELLED。**
[試験条件](docs/spec/TEST-CONDITIONS.md)、[テストベンチ](docs/TEST-BENCH.md)。

### kshana-bench

干渉検出、IQ 検出、ホールドオーバー予測、楽観ギャップのための固定されたタスク、分割、指標であり、
封印したホールドアウトと静的なリーダーボードを備えます。提出物をスコアリングするものであり、
受信機のランキングではありません。

```sh
kshana bench baseline --task d --split test --out results/
```

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/figures/0.38/bench-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/figures/0.38/bench-light.svg">
  <img src="docs/figures/0.38/bench-light.svg" alt="テスト分割における kshana-bench タスク D（楽観ギャップ）の組み込みベースライン。エンジン v0.40.0 の実際の実行（`kshana bench baseline`）から。各棒の組は、分布内のケースとシフトしたケースにおける ROC 曲線下面積であり、その差が楽観ギャップで、許容値は 0.05 です。fused-max-z：0.998 と 0.983（ギャップ 0.015）、sqm-imbalance：0.882 と 0.882（ギャップ 0.001）、agc-excess：0.848 と 0.819（ギャップ 0.030）、raim-parity：0.682 と 0.672（ギャップ 0.010）、energy-cn0-drop：0.595 と 0.565（ギャップ 0.030）。ラベルは合成コーパスの生成モデルによるラベルであり、フィールドデータではありません：MODELLED。助言：明示した参照に対してモデル化または測定したものであり、承認、認証、適合の表明ではありません。スコアはログやコーパスを記述するものであり、製品を記述するものではありません。">
</picture>

**台帳のステータス：** 独自の台帳行はありません。ベースラインは結果ファイル中で MODELLED とラベル付けされています。
事前登録した合格基準に対して、スコアラー、C1 から C3、D2 は満たし、3 つの合格基準が NOT MET であり、それぞれ
テストで固定されています：A2（テスト分割で `agc_k_sigma` の AUC は 0.80 以上に対して 0.766）、D1（最大ギャップ
0.0301）、タスク (b) の R1（以前のキャンペーンから持ち越し、再実行なし）。数値は
[`xval/bench/RESULTS-v2.md`](xval/bench/RESULTS-v2.md) にあります。[Bench](docs/BENCH.md)。

### 干渉オブザーバトリー

オープンな航空機位置アーカイブから、UTC の 1 日ごと、領域ごとに 1 つのプロダクトを、固定された粗いグリッド上で作成します：
各セルは劣化、劣化なし、未観測（これは「クリア」ではありません）のいずれかです。その日の終了から
24 時間以上経過してから公開し、小さなセルは抑制し、原因の帰属は行いません。

```sh
kshana interference-map daily /path/to/extracted/2026-09-15 \
    --dataset adsb-lol --day 2026-09-15 --bbox 53.5,9.0,66.0,31.0 --out products/
```

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/assets/readme/interference-map-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/assets/readme/interference-map-light.svg">
  <img src="docs/assets/readme/interference-map-light.svg" alt="examples/interference-map/output にコミットされたサンプルから描いた 2 つの合成干渉マップの日。それぞれ独自の合成ルートと、エンジンが報告するルートの曝露割合を示します。左は ADS-B の日：劣化セル 1、劣化なし 6、未評価 4（ハッチング）、記録のないセルは空白で描かれ、観測されていません。ルートは 525 km で、その長さの 11.5% が劣化セル、38.3% が劣化なし、9.1% が未評価、41.1% が未観測です。右は AIS の日：円検出器と陸上検出器がフラグを立てたセル、異常なしのセル、空白のセル。ルートは 454 km で、10.5% が異常セル、21.2% が異常なし、0.0% が未評価、68.3% が未観測です。ADS-B と AIS は別々のレイヤーであり、結合されることはありません。フラグの立ったセルは干渉の認定ではなく、色のないセルは観測されていないのであって、クリアと同じではありません。すべてのデータは大西洋中部の外洋における架空のものであり、測定ではありません。">
</picture>

この図はコミットされたサンプルの日であり、オブザーバトリーのプロダクトではありません。**台帳のステータス：MODELLED**：
外部のオラクルも真値も原因の帰属もありません。観測されていないセルは評価されておらず、
それはクリアと同じではありません。[オブザーバトリーの手法](docs/observatory/METHOD.md)。

### エクスポーター

信頼テレメトリーを、Prometheus テキスト、CEF、LEEF、OTLP、Home Assistant の MQTT ディスカバリーとステート
メッセージとして出力します。このコマンドは指定した宛先にのみ発行し、認証情報を保持しません。

```sh
kshana trust-telemetry --result session.result.json --print-metrics
kshana trust-telemetry --result session.result.json --print-syslog --format cef
```

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/figures/0.38/exporters-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/figures/0.38/exporters-light.svg">
  <img src="docs/figures/0.38/exporters-light.svg" alt="3 つのエクスポート形式による 1 つの信頼結果。examples/maritime-trust に対するエンジン v0.40.0 の実際の実行（`kshana trust-telemetry`）から：Prometheus のテキスト表現（最新の信頼スコアは 5.9 で、設定されているのは untrusted の帯域）と、最後の CEF と LEEF のメッセージ。このコマンドは宛先を与えない限り何も発行せず、認証情報を保持せず、無線信号を送信しません。助言用ソフトウェアであり、型式承認を受けた航法装置（IEC 61108、IEC 61162）ではありません。船舶の航行の責任は引き続き運用者にあります。">
</picture>

**台帳のステータス：MODELLED。** [信頼テレメトリー](docs/TRUST-TELEMETRY.md)。

### 時間に対する光リンクマージン

`optical-atmosphere` 種別は、サイトの気象の 1 つのシード付き実現をリンクマージンの
系列として書き出せます：雲のエピソード、それぞれの液水柱量、ステップごとに 1 つのシンチレーションのサンプル。
Studio の光 PNT のページは optical-atmosphere のシナリオを開きます。

```sh
kshana scenarios/optical-atmosphere-network.toml
```

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/figures/0.38/optical-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/figures/0.38/optical-light.svg">
  <img src="docs/figures/0.38/optical-light.svg" alt="サイト 'northern' の 336 h にわたるリンクマージンの 1 つのシード付き実現。scenarios/optical-atmosphere-network.toml（シード 37、ステップ 600 s）に対するエンジン v0.40.0 の実際の実行から。マージンは雲のエピソード中にゼロを下回ります。この抽出では、リンクは時間の 40.5 % で確立しており、途絶は 27 回、最長の途絶は 30.7 h です。入力は例示用であり、系列はモデルからの 1 回の抽出であって気候そのものではなく、統計的な可用性（37.8 %）とは抽出のサンプリング誤差の分だけ異なります。助言用の解析のみ：認証された可用性、インテグリティ、航法のプロダクトではなく、気候の入力が明示されたデータセットに由来しない限り、実在するいかなるサイトの予測でもありません。">
</picture>

**台帳のステータス：MODELLED。** モデルからの 1 回の抽出であり、気候そのものではありません。[光大気](docs/OPTICAL-ATMOSPHERE.md)。

### Studio の新しいビュー

[kshana.dev/studio](https://kshana.dev/studio/) に、Bridge リプレイ（1 つのミッション時計上で 2 つの実行を並べて表示、
[`/studio/replay/`](https://kshana.dev/studio/replay/)）、光 PNT のページ
（`/studio/optical/`）、ホールドオーバー試験のページ（`/studio/holdover/`）、オブザーバトリーのビューアー
（`/studio/observatory/`）が加わりました。これらはブラウザー内で同じエンジンを実行し、何もアップロードせず、
同じ助言の記載を伴います。上の図はスクリプトがエンジン自身の出力から描いたものであり、
これらのページのスクリーンショットではありません。

<a id="space-user-navigation-gnss-ssv"></a>
### 宇宙利用者の航法（`gnss-ssv`）

GNSS の軌道の上空、周辺、あるいははるか遠方にある宇宙機について：どれだけの GNSS 信号を利用できるか、それらが
どれだけ強いか、幾何配置がどれだけ良いか、そして搭載フィルターがそれらで何をできるか。1 つの種別に
4 つのモードがあり、シナリオの表によって選ばれます：利用者の**シェル**（1 つおよび 4 つの信号が得られる時間の割合を
コンステレーションごとに）、**軌道**（軌道に沿った信号、C/N0、精度低下率、リム光線の媒質）、**航法**の実行（擬似距離に基づく
9 状態のフィルター、月まで）、**フォーメーション**（チーフの周りのデピュティの相対航法）。可用性の比較のための
公開ソースは、相互運用可能な GNSS Space Service Volume の冊子（UN OOSA
ST/SPACE/75、International Committee on GNSS による）であり、これ自体もシミュレーションです。取得するものであり、リポジトリに
同梱されることはありません。詳細ページ：[docs/SSV.md](docs/SSV.md)。

```sh
kshana scenarios/gnss-ssv-shell.toml            # shell: the upper space service volume, reduced size
kshana scenarios/gnss-ssv-heo.toml              # trajectory: a high Earth orbit, limb medium
kshana scenarios/gnss-ssv-nav-lunar.toml        # navigation: an onboard filter toward the Moon
kshana scenarios/gnss-ssv-formation-heo.toml    # formation: relative navigation
```

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/figures/0.38/ssv-shell-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/figures/0.38/ssv-shell-light.svg">
  <img src="docs/figures/0.38/ssv-shell-light.svg" alt="半球アンテナを持ち、高度 36000 km の球面上にいる利用者の信号可用性。scenarios/gnss-ssv-shell.toml に対するエンジン v0.40.0 の実際の実行（縮小した実行：利用者 162、3 日、10 分ステップ）から、閾値 20 dB-Hz で。コンステレーションと帯域ごとに 2 本の棒：少なくとも 1 つの信号、および少なくとも 4 つの信号が得られる（利用者、エポック）の組の割合。全体、L1：少なくとも 1 つ 99.4 %、少なくとも 4 つ 73.2 %、4 信号未満の最長の途絶 160 min。全体、L5：少なくとも 1 つ 100.0 %、少なくとも 4 つ 99.9 %、4 信号未満の最長の途絶 20 min。MODELLED：明示した入力からのモデル化した検討であり、測定ではなく、いかなるシステムのサービスボリュームの主張でもありません。縮小したサイズは冊子との比較ではありません。助言：研究・エンジニアリング用ツールによる解析出力であり、型式承認を受けた航法装置ではなく、セーフティ・オブ・ライフのサービスでもありません。">
</picture>

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/figures/0.38/ssv-heo-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/figures/0.38/ssv-heo-light.svg">
  <img src="docs/figures/0.38/ssv-heo-light.svg" alt="1 つの高地球軌道（近地点 497 km、遠地点 58622 km、周期 18.8 h）に沿った信号。scenarios/gnss-ssv-heo.toml に対するエンジン v0.40.0 の実際の実行から、帯域 L1。上段：可視の信号のうち最良の搬送波対雑音密度と、20 dB-Hz の閾値。中段：全コンステレーションから可視の信号の数で、サンプリングした点に沿って 4 から 55。受信したリンクのうち、2252 はメインローブを、696 はサイドローブを経由しました。ラベル付きのパラメトリックな代替パターンを使っており、いかなるシステムの実測パターンでもありません。PDOP の中央値 67、95 パーセンタイル 358。MODELLED：明示した入力からのモデル化した検討であり、測定ではなく、いかなるシステムのサービスボリュームの主張でもありません。助言：研究・エンジニアリング用ツールによる解析出力であり、型式承認を受けた航法装置ではなく、セーフティ・オブ・ライフのサービスでもありません。">
</picture>

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/figures/0.38/ssv-nav-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/figures/0.38/ssv-nav-light.svg">
  <img src="docs/figures/0.38/ssv-nav-light.svg" alt="低軌道から月へ向かう遷移軌道上の 9 状態の搭載フィルター。scenarios/gnss-ssv-nav-lunar.toml に対するエンジン v0.40.0 の実際の実行（289 エポック、描画は 13 点）から。対数軸上に、真の位置誤差とフィルター自身の 1 シグマ境界を開始からの時間に対して示します。GNSS の軌道の内側では位置の RMS は 1.4 m、その上空では 90 m であり、最終誤差は高度 193,330 km、測定 1 つで 184 m です。実行全体での正規化推定誤差二乗の平均は 4.4 です（整合した位置ブロックでは約 3）。真値とフィルターは太陽と月の代替モデルを共有しています。MODELLED：明示した入力からのモデル化した検討であり、測定ではなく、いかなるシステムのサービスボリュームの主張でもありません。助言：研究・エンジニアリング用ツールによる解析出力であり、型式承認を受けた航法装置ではなく、セーフティ・オブ・ライフのサービスでもありません。">
</picture>

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/figures/0.38/ssv-formation-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/figures/0.38/ssv-formation-light.svg">
  <img src="docs/figures/0.38/ssv-formation-light.svg" alt="高軌道上のチーフの周りの 2 機のデピュティの相対航法。scenarios/gnss-ssv-formation-heo.toml に対するエンジン v0.40.0 の実際の実行（401 エポック）から。各デピュティについて 2 本の棒：2 つの独立した絶対推定値の差から得た相対位置の RMS と、一重差の擬似距離に基づく相対フィルターから得た相対位置の RMS。基線 0.8 km：5.1 m と 1.2 m。基線 2.0 km：4.1 m と 2.1 m。ここでは絶対フィルターは整合していません：正規化推定誤差二乗の平均は、整合したフィルターの約 3 に対して 187 であり、表明された不確かさは小さすぎます。MODELLED：明示した入力からのモデル化した検討であり、測定ではなく、いかなるシステムのサービスボリュームの主張でもありません。助言：研究・エンジニアリング用ツールによる解析出力であり、型式承認を受けた航法装置ではなく、セーフティ・オブ・ライフのサービスでもありません。">
</picture>

**台帳のステータス：MODELLED。冊子との比較はほとんどが未達です。** 合格基準は
実行前に固定しました。8 つのうち、基準を満たしたのは S0（逆リンクバジェット、13 値中 13）と S6（月ミッション）だけです。
**S1 から S5 と S7 は NOT MET です**：上部および下部のサービスボリュームの幾何配置（52 セル中 43 と 52 セル中 48）、
15/20/25 dB-Hz での上部サービスボリューム、6 つの GEO ミッション、HEO ミッション、そして実測した GPS のパネルパターンに対する
パラメトリックなサイドローブパターン。S1 から S5 のほぼすべての未達には
GLONASS が関わっており、冊子は GLONASS について 2 つの異なる参照角を印刷しています。もう一方の組を使う診断用の変種では
S1、S2、S4 がすべてのセルで合格しますが、正式な記録としての実行を置き換えるものではなく、どの行も
VALIDATED ではありません。フォーメーションの実行の絶対フィルターも過信しています（正規化誤差二乗の平均が、
整合したフィルターが与える約 3 という値を大きく上回ります）。

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/figures/0.38/ssv-booklet-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/figures/0.38/ssv-booklet-light.svg">
  <img src="docs/figures/0.38/ssv-booklet-light.svg" alt="宇宙利用者の可用性モデルと公開された Space Service Volume の冊子との、記録された比較。事前登録した実行のコミット済みの結果（xval/gnss-ssv/results-run1.json、エンジン v0.40.0 の ssv_booklet_check の例が書き出したもの）から。棒ごとに、許容範囲内のセル：S0 13 中 13（MET）、S1 52 中 43（NOT MET）、S2 52 中 48（NOT MET）、S3 155 中 122（NOT MET）、S4 156 中 132（NOT MET）、S5 26 中 18（NOT MET）、S6 26 中 26（MET）、S7 パネルパターン 20 中 0（NOT MET）。事前登録した解釈の下で基準を満たすのは S0 と S6 だけです。冊子のもう一方の GLONASS の角度を使う診断用の変種では S1、S2、S4 がすべてのセルで合格しますが、正式な記録としての実行を置き換えるものではありません。VALIDATED の台帳行はありません。助言：研究・エンジニアリング用ツールによる解析出力であり、型式承認を受けた航法装置ではなく、セーフティ・オブ・ライフのサービスでもありません。">
</picture>

[宇宙利用者の航法](docs/SSV.md)、[比較が示すもの](docs/SSV.md#what-the-comparison-with-the-booklet-shows)。

<a id="lunar-infrastructure-lunar-infrastructure"></a>
### 月面インフラ（`lunar-infrastructure`）

航法と測地のインフラとしての月の軌道と表面を、`study` で選ぶ 5 つの検討で扱います：
**od-consistency**（ハロー軌道における搭載の地球 GNSS 軌道決定と、独立した地上の軌道決定との比較）、
**carrier-phase**（表面局とオービターの間の整数アンビギュイティの決定）、
**frame-coestimation**（オービターのリンクの有無による、地球局の測距からの月の測地原子）、**space-tie**（1 機の宇宙機上のレーザー、VLBI、GNSS のオフセットと、ローカルタイの誤差との比較）、
**geodesy-sensitivity**（どの観測量のファミリーがラブ数 h2、k2、l2 を捉えるか）。モデルは、
明示した簡略化と例示用の入力を持つ制限三体モデルです。詳細ページ：
[docs/LUNAR-INFRASTRUCTURE.md](docs/LUNAR-INFRASTRUCTURE.md)。

```sh
kshana scenarios/lunar-infrastructure-od-consistency.toml
kshana scenarios/lunar-infrastructure-carrier-phase.toml            # quick; the scored run takes about eight minutes
kshana scenarios/lunar-infrastructure-frame-coestimation.toml
kshana scenarios/lunar-infrastructure-space-tie.toml
kshana scenarios/lunar-infrastructure-geodesy-sensitivity.toml
```

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/figures/0.38/lunar-od-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/figures/0.38/lunar-od-light.svg">
  <img src="docs/figures/0.38/lunar-od-light.svg" alt="準直線ハロー軌道における搭載の地球 GNSS 軌道決定と、独立した地上の軌道決定との整合性。scenarios/lunar-infrastructure-od-consistency.toml とモデル誤差の変種（各 400 試行）に対するエンジン v0.40.0 の実際の実行から。正規化差 q の平均は、モデル誤差なしで 5.81、3e-10 m/s2 の加速度誤差を注入して 5.95 であり、期待値は 6 です：2 つの軌道解は整合しています（合格基準 C1 MET）。95 % 点を上回る試行の割合は 0.040 と 0.052 です。注入した誤差を検出するための合格基準は 0.5 以上であったため、NOT MET です（C3）：搭載の解は約 352 m の精度でしかわからず、地上の解の 23 m と比べて大きいため、10 メートルの変位はその共分散の中に隠れてしまいます。MODELLED：明示した簡略化と例示用の入力を持つ制限三体モデルであり、いかなる月の量の測定でもありません。助言：研究・エンジニアリング用ツールによる解析出力であり、型式承認を受けた航法装置ではなく、セーフティ・オブ・ライフのサービスでもありません。">
</picture>

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/figures/0.38/lunar-carrier-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/figures/0.38/lunar-carrier-light.svg">
  <img src="docs/figures/0.38/lunar-carrier-light.svg" alt="月面局とオービターの間の搬送波位相の整数アンビギュイティの決定。エンジン v0.40.0 のスコアリングした実行のコミット済みの結果（tests/fixtures/lunar_infra/phase_full_run.json：3 つのアーク長、それぞれ 401 回の抽出によるモンテカルロ、scenarios/carrier-phase-scored.toml が書き出したもの）から。1 日：成功率 1.0 %（標準誤差 0.5 %）、アンビギュイティ 134、オービター位置のシグマはフロート 45.6 m、フィックス 18.5 m。2 日：成功率 0.5 %（標準誤差 0.4 %）、アンビギュイティ 259、オービター位置のシグマはフロート 21.5 m、フィックス 8.7 m。3 日：成功率 2.8 %（標準誤差 0.8 %）、アンビギュイティ 375、オービター位置のシグマはフロート 6.3 m、フィックス 2.1 m。整数の決定は達成されません：成功率は 25 dBi で 1 % から 3 % にとどまり、登録した 12 dBi ではこの問題を構成できません。MODELLED：明示した簡略化と例示用の入力を持つ制限三体モデルであり、いかなる月の量の測定でもありません。助言：研究・エンジニアリング用ツールによる解析出力であり、型式承認を受けた航法装置ではなく、セーフティ・オブ・ライフのサービスでもありません。">
</picture>

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/figures/0.38/lunar-frame-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/figures/0.38/lunar-frame-light.svg">
  <img src="docs/figures/0.38/lunar-frame-light.svg" alt="地球局の測距による 7 パラメーターの月の測地原子（3 つの並進、1 つのスケール、3 つの回転）の精度。オービターから表面局への測距の有無による比較。scenarios/lunar-infrastructure-frame-coestimation.toml に対するエンジン v0.40.0 の実際の実行から。並進と回転の Cramer-Rao シグマはオービターのリンクによって小さくなります（例えば t_z は 0.98 m から 0.046 m へ）。最小の情報固有値は 111 倍に上昇し、CRLB のトレースは 1.0 % まで低下します（合格基準 F3 MET）。これは、軌道が月の軸で既知であり、その誤差がオービターの測距シグマ 1 m に含まれていることを前提としています。MODELLED：明示した簡略化と例示用の入力を持つ制限三体モデルであり、いかなる月の量の測定でもありません。助言：研究・エンジニアリング用ツールによる解析出力であり、型式承認を受けた航法装置ではなく、セーフティ・オブ・ライフのサービスでもありません。">
</picture>

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/figures/0.38/lunar-tie-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/figures/0.38/lunar-tie-light.svg">
  <img src="docs/figures/0.38/lunar-tie-light.svg" alt="1 機の宇宙機のレーザー測距、VLBI、GNSS の位置の間のオフセットの精度と、地上のローカルタイの誤差との関係。scenarios/lunar-infrastructure-space-tie.toml に対するエンジン v0.40.0 の実際の実行（6.56 日のアーク 1 つ、手法ごとのシグマは GNSS 10 m、VLBI 1 m、レーザー 0.1 m）から。ローカルタイが 1 mm から 1 m の範囲では、レーザーから GNSS を引いた並進のシグマは、タイが 1 m に達するまで約 1.04 m にとどまります：これはローカルタイではなく、各手法の測定雑音によって制限されています。タイだけで決まる下限は、そのシグマの 2 の平方根倍です。MODELLED：明示した簡略化と例示用の入力を持つ制限三体モデルであり、いかなる月の量の測定でもありません。助言：研究・エンジニアリング用ツールによる解析出力であり、型式承認を受けた航法装置ではなく、セーフティ・オブ・ライフのサービスでもありません。">
</picture>

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/figures/0.38/lunar-geodesy-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/figures/0.38/lunar-geodesy-light.svg">
  <img src="docs/figures/0.38/lunar-geodesy-light.svg" alt="どの観測量のファミリーが月のラブ数 h2、k2、l2 に感度を持つか。scenarios/lunar-infrastructure-geodesy-sensitivity.toml に対するエンジン v0.40.0 の実際の実行から。各セルは、あるファミリーの観測量のパラメーターに関する偏微分の RMS であり、そのファミリー自身の単位で表されます（そのため、セルは列方向ではなく行方向で比較します）。ダッシュは、そのファミリーが感度を持たないことを意味します。レーザー測距：h2 7.6、k2 なし、l2 9.8。オービター追跡：h2 なし、k2 0.00086、l2 なし。表面重力計：h2 2.9e+03、k2 4.3e+03、l2 なし。表面時計：h2 2.8e-17、k2 2.8e-17、l2 なし。4 つのファミリーすべてを使うと、Cramer-Rao シグマは公称値に対して h2 で 0.36 %、k2 で 0.52 %、l2 で 1.16 % です。ファミリーを追加しても最小固有値が下がることはありませんでした（28 回の追加中 28 回）が、擬似逆行列のトレースが大きくならなかったのは 28 回中 16 回だけでした：合格基準 G3 のこの半分は NOT MET です。オービターのファミリーは k2 加速度の視線方向の積分を捉えており、これは上限側の数値です。MODELLED：明示した簡略化と例示用の入力を持つ制限三体モデルであり、いかなる月の量の測定でもありません。助言：研究・エンジニアリング用ツールによる解析出力であり、型式承認を受けた航法装置ではなく、セーフティ・オブ・ライフのサービスでもありません。">
</picture>

**台帳のステータス：MODELLED。3 つの合格基準が NOT MET です。** 数値計算は独立した
numpy と scipy のプログラムに対して確認しています。月の量の測定と比較したものは何もなく、何も
VALIDATED ではありません。基準を満たしたもの：2 つの軌道解は整合しており（q の平均は期待値 6 に対して 5.81）、オービターの
リンクは、既知の軌道を前提として、測地原子の最小固有値を約 111 倍に高めます。**基準を満たさないもの**：
注入した 3e-10 m/s2 のモデル誤差は**検出されません**（C3：搭載の解は約 350 m の精度でしかわからないため、
約 10 メートルはその共分散の中に隠れます）。**整数の決定は達成されません**（25 dBi で成功率 1 から 3 %、
登録した 12 dBi ではこの問題を構成できません）。そして、観測量のファミリーを追加する場合の G3 のトレースの半分
（28 回の追加中 12 回でトレースが上昇し、いずれもそのファミリーが階数を上げたためです）。
各未達はテストで固定されています。[月面インフラ](docs/LUNAR-INFRASTRUCTURE.md)。

<a id="kshana-studio"></a>
## Kshana Studio

[kshana.dev/studio](https://kshana.dev/studio/) を開くと、WebAssembly にコンパイルされたエンジン全体が
ブラウザー内で動作します。インストールするものはなく、何もアップロードされません。Studio には
同じエンジンに対する 2 つのビューがあり、ヘッダーのスイッチで切り替えられます。切り替えても、
シナリオ、ビュー、変更した設定は保たれます。

**シンプルビュー**は Studio が最初に開くビューです。問いから始まり（何機の衛星が見えるか、
位置の測位を信頼できるか、時計はどれだけの時間時刻を保てるか、ジャマーは受信機に何をするか）、
エンジンにできることすべての地図からも始められます。各分野には検証済みの手法の割合が示されます。シナリオを開くと、まず答えが表示されます：
そのシナリオが測定するものに合わせて書かれた 1 つの平易な文、続いて主要な数値とチャートです。表示される設定は最大 5 つで、
答えを最も大きく変えるものです。残りは **詳細設定** の下にあります。
**計算方法** は手法を説明し、**研究者向け** はエンジン自身の
数値、シナリオファイル、Python から実行するためのコード、引用情報を示します。

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/assets/readme/studio/studio-task-dark.jpg">
  <source media="(prefers-color-scheme: light)" srcset="docs/assets/readme/studio/studio-task-light.jpg">
  <img src="docs/assets/readme/studio/studio-task-light.jpg" alt="Kshana Studio のシンプルビュー。同梱のシナリオ integrity-raim で、エンジン v0.40.0 がローカルで動作しています。問い：幾何配置はアラートリミット（水平および垂直の保護レベル）を満たすか。まず答えが Live result の印とともに表示されます：はい、ほぼ：12 h のうち 95.3 %。受信機の誤差境界は 361 回のチェックのうち 344 回でアラートリミット（水平 40 m、垂直 50 m）を下回り、誤誘導となる測位はありませんでした。主要な数値：測位を信頼できる時間 95.3 %、最長のギャップ 10 min、典型的な誤差境界 6.5 / 13 m、誤誘導の測位 0。その横に、5 つの設定（距離誤差、2 つのアラートリミット、期間、仰角マスク）を持つ「他の設定を試す」と「再実行」、続いて折りたたまれたセクション「詳細設定」（さらに 13）、「計算方法」（検証済み 8、モデル化 6）、「研究者向け」。その下に、この結果のビューと、アラートリミットに対してプロットした保護レベル。" width="100%">
</picture>

**詳細ビュー**は完全なダッシュボードです：シナリオライブラリ、番号付きの 5 つのステップ
（選択、設定、実行、結果を読む、共有またはエクスポート）、実行が閾値を示す場合の PASS と FAIL のチップ付きの主要な数値、
そしてすべてのパネル：概要、チャート、マップ、リプレイ、エンジンの
レポート、エクスポート。1 つの検索ボックスでシナリオ、ドメイン、その中のフィールドにたどり着けます。
最大 4 つの実行をピン留めして並べて比較できます。

<details>
<summary>シンプルビューの最初の画面と、実行後の詳細ビュー</summary>

<br>

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/assets/readme/studio/studio-home-dark.jpg">
  <source media="(prefers-color-scheme: light)" srcset="docs/assets/readme/studio/studio-home-light.jpg">
  <img src="docs/assets/readme/studio/studio-home-light.jpg" alt="Kshana Studio のシンプルビューの最初の画面。タイトルは「何を知りたいですか？」で、エンジン v0.40.0 が動作中。上部のバーには 3 つのリンク：訓練のデブリーフ、干渉マップ、受信機の信頼性。4 つの問い：地球上のどこでも何機の衛星が見えるか、位置の測位を信頼できるか、衛星なしで時計はどれだけの時間時刻を保てるか、ジャマーは受信機に何をするか。最初の問いの下に、その記録された結果：GPS、Galileo、BeiDou、GLONASS を合わせて、すべての場所で少なくとも 22 機、平均 31 機の衛星が可視で、すべての場所と時刻の 100 % で測位が可能。可視衛星数の世界地図と、「この結果を開く」ボタン。その横に「Kshana にできることのすべて」：16 の分野と、すぐに実行できる 139 のシナリオ。各タイルには記録された実行からの小さなチャートと検証済みの手法の割合があり、台帳では 350 の機能のうち 173 が検証済み。" width="100%">
</picture>

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/assets/readme/studio/studio-advanced-dark.jpg">
  <source media="(prefers-color-scheme: light)" srcset="docs/assets/readme/studio/studio-advanced-light.jpg">
  <img src="docs/assets/readme/studio/studio-advanced-light.jpg" alt="Kshana Studio の詳細ビュー。同梱のシナリオ constellation-multi-gnss-coverage（4 つの GNSS コンステレーション、1 つのマップ）の実行後で、エンジン v0.40.0 がローカルで動作しています。左にはシナリオライブラリ、16 ドメインの 139 シナリオ。5 つのステップ「選択」「設定」「実行」「結果を読む」「共有またはエクスポート」で、現在はステップ 4。主要な数値：衛星 102 機、可用性 100 %（PASS）、位置精度低下率（PDOP）の中央値 0.95（PASS）、PDOP の 95 パーセンタイル 1.105（PASS）、平均可視衛星数 31.03、最少 22。その下に、Coverage が選択されたパネル行、リプレイバー、全衛星を描いた 0.831 から 1.0853 までの平均 PDOP の世界地図、全球のカバレッジの数値。" width="100%">
</picture>

</details>

Studio のソースとビルドの手順は [`web/README.md`](web/README.md) にあります。

### サイト

[kshana.dev](https://kshana.dev) の残りの部分は、このリポジトリ自身のファイルと
エンジンの実行から構築されています：ミッション、機能、エビデンスの台帳、公開された研究、
エディション。

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/assets/readme/site/site-strip-dark.jpg">
  <source media="(prefers-color-scheme: light)" srcset="docs/assets/readme/site/site-strip-light.jpg">
  <img src="docs/assets/readme/site/site-strip-light.jpg" alt="kshana.dev の 3 つのページを並べたもの。ホームのヒーロー：名前の行 Kshana · क्षण · 正確な瞬間 の下に見出し「GNSS が途絶える 1 分間をリハーサルする」があり、エンジン v0.40.0 の実際の実行のミッションコンソール（地球儀と 3 つのライブチャート：時計の時刻誤差、搬送波対雑音密度、保護レベル）。エビデンスの「公開された研究」：オープンなエンジンに基づく 6 本の arXiv 論文で、最新のものにはエンジンの図があります。エディションの「Kshana Pro、同じエンジンをさらに強化」：Free は 1 つのシナリオを実行し、Pro はプログラムの問いに答えます。" width="100%">
</picture>

<a id="capabilities"></a>
## 機能

1 つのエンジンが、最初にジャミングを受けた衛星から、時計のホールドオーバーの最後の
ナノ秒まで、障害の連鎖全体をカバーします。エンジンには 92 のシナリオ種別があります。`kshana kinds` で
一覧を表示でき、[`docs/SCENARIOS.md`](docs/SCENARIOS.md) にすべてのフィールドが記載されています。

| 機能 | 答える問い |
|---|---|
| [スペクトル](docs/SPECTRUM.md) | ジャマーが GNSS の L バンドを、帯域ごと、秒ごとにどのように占有するか |
| [時計とタイミング](docs/TELECOM-TIMING.md) | GNSS が失われた後、各時計がどれだけの時間時刻を保てるか |
| [任意の天体を周回するコンステレーション](docs/CONSTELLATION-DESIGN.md) | 地球、月、火星の周りのカバレッジ、精度低下率、可用性 |
| [太陽系](docs/SOLAR-SYSTEM.md) | 各惑星がどこにあるか、そして任意のリンクの光時間 |
| [低軌道の航法](docs/LEO-PNT.md) | パス、リンク、航法メッセージ、融合した測位を段階ごとに |
| [キャンペーン](docs/CAMPAIGNS.md) | 連鎖したミッション、スイープ、モンテカルロのアンサンブルを 1 つのシナリオで |
| [アニメーション](docs/ANIMATION.md) | 実行の時系列を、アニメーションの図、プレーヤー、またはフレームとして |
| [レポート](docs/REPORTS.md) | すべての数値を単位とラベル付きで、HTML（HyperText Markup Language）と JSON（JavaScript Object Notation）で |
| [相互運用のためのエクスポート](docs/INTEROP.md) | 他のツール向けの軌道と幾何配置：SP3、CCSDS OMM と OEM、CZML、KML、GeoJSON、STK、SigMF |
| [海事の信頼性](docs/MARITIME-TRUST.md) | 船橋はこの測位を信頼できるか：船舶の NMEA に対する 0-100 のスコアと理由を、ライブまたはログから（助言用であり、型式承認を受けた航法装置ではありません） |
| [NMEA 訓練用ストリーム](docs/NMEA-TRAINING.md) | 乗組員訓練のための、スクリプト化されたジャミングとスプーフィングを含む合成の船橋 NMEA と教官用ログ（テキストのみ。船舶のライブの航法システムには決して使用しないこと。助言用であり、型式承認を受けた航法装置ではありません） |
| [干渉マップ](docs/INTERFERENCE-MAP.md) | 航空機と船舶が劣化した航法データを報告した場所と、それがルートのどれだけに及ぶか |
| [干渉源の領域](docs/INTERFERENCE-MAP.md#emitter-region-interference-map-locate) | 明示した仮定の下で、劣化した位置報告の発生源が存在しうる場所：明示した信頼度での領域、楕円付きの重心であり、決して点ではありません（MODELLED、`kshana interference-map locate`） |
| [エビデンスパック](docs/EVIDENCE-PACKS.md) | インシデント報告のための、船舶のログのウィンドウとエンジンがそこから計算した内容の、署名付きでオフライン検証可能な技術的記録（助言用であり、型式承認を受けた航法装置ではありません） |
| [信頼テレメトリー](docs/TRUST-TELEMETRY.md) | 信頼のストリームを Prometheus の指標、SIEM のイベント、任意で OpenTelemetry として。Grafana ダッシュボードのサンプル付き（`deploy/grafana/kshana-gnss-trust.json`） |
| [Signal K と OpenCPN](docs/MARINE-INTEGRATIONS.md) | 船の Signal K サーバーと OpenCPN 上の信頼スコア。受信機の隣に置く小型コンピューター向けのリファレンスビルド付き（助言用であり、型式承認を受けた航法装置ではありません） |
| [テストベンチへのエクスポート](docs/TEST-BENCH.md) | `kshana bench-export`：ラボの GNSS シミュレーター向けのシナリオの車両運動とイベント（信号は書き出しません）と、その後の受信機ログのスコアリング方法 |
| [コンプライアンスのマッピングとレポート](docs/compliance/README.md) | `kshana compliance-report`：一連の実行が、公開されているレジリエンスのフレームワークのどの行の証拠を裏付ける（supports evidence for）か、そして残るギャップ |
| [ノートブック](notebooks/README.md) | 実行可能なチュートリアル：船舶の信頼性と訓練用ストリーム、干渉マップによるルートの曝露、コンプライアンスのマッピングとテストベンチ、量子と古典の GDOP の比較 |
| [Galileo OSNMA 検証器](docs/OSNMA.md) | 受信機がどの衛星の航法データを暗号的に認証できるか、そしてチェックが失敗する理由。Kshana は EU の OSNMA ICD IPR に基づくいかなる権利も付与しません（ページ内の NOTICE を参照） |

エクスポート形式の正式名称：SP3 は Standard Product 3、CCSDS OMM と OEM は Consultative Committee for Space Data
Systems の Orbit Mean-elements Message と Orbit Ephemeris Message、CZML と KML は Cesium と Keyhole の
Markup Language、STK は Systems Tool Kit、
SigMF は Signal Metadata Format です。

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/assets/readme/campaign-timeline-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/assets/readme/campaign-timeline-light.svg">
  <img src="docs/assets/readme/campaign-timeline-light.svg" alt="連鎖キャンペーン campaign-jam-spoof-holdover-integrity、エンジンの 1 回の実際の実行（シード 20260928）：6 フェーズ（Nominal → Jamming → Spoofing → Holdover → Integrity alarm → Recovery）と、T+01:16:10 にわたる 10 s グリッド上の 18 のメンバー実行。3 つのレーン：50 ns のガードに対する時計の時刻誤差（ピーク 62.7 ns）、25 dB-Hz の下限に対する実効搬送波対雑音密度（最小 -12.2 dB-Hz）、50 m のアラートリミットに対する垂直保護レベル（ピーク 135.4 m）と、実行の警報イベント：T+00:20:00 RF スプーフィング検出器の警報（融合した整合性、電力、信号品質のモニター）。T+00:26:10 時計支援スプーフィングモニターの警報。" width="100%">
</picture>

<details>
<summary>実際の実行から描いた各機能：L バンドのウォーターフォール、カバレッジマップ、太陽系、低軌道のパス</summary>

<br>

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/assets/readme/lband-waterfall-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/assets/readme/lband-waterfall-light.svg">
  <img src="docs/assets/readme/lband-waterfall-light.svg" alt="60 s にわたる 1 つの電力スペクトル密度として描いた GNSS の L バンド。spectrum 種別の実際の実行（l-band-waterfall-jamming.toml、シード 7、エンジン v0.40.0）から：横軸が周波数、下方向が時間、色は -202.0 dBW/Hz の雑音レベルを上回る電力を表します。ジャマー：チャープ式プライバシー装置（chirp、10 s にオン、40 s にオフ）、L1 上の CW トーン（cw、30 s にオン）、L2 の狭帯域雑音（narrowband、45 s にオン）。最悪の帯域は GPS L1 C/A：25 dB-Hz の追尾下限に対して、31 s で最小の実効 C/N0 3.2 dB-Hz。GPS L1 C/A 最小 3.2 dB-Hz、Galileo E1 最小 4.7 dB-Hz、GPS L2C 最小 36.9 dB-Hz、GPS L5 最小 44.1 dB-Hz、Galileo E5a 最小 47.0 dB-Hz。" width="100%">
</picture>

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/assets/readme/coverage-map-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/assets/readme/coverage-map-light.svg">
  <img src="docs/assets/readme/coverage-map-light.svg" alt="1 日間の全地球での可視衛星数。constellation-design の実際の実行（constellation-multi-gnss-coverage.toml、このジェネレーターが実行したエンジン）から：衛星 102 機（GPS 24、Galileo 24、BeiDou 30、GLONASS 24）。各 10 度のセルは、10 度のマスクより上にある衛星の平均数（27.2 から 36.5）で色分けされ、点はエンジンの地上軌跡のサンプルで、衛星ごとに 1 時間に 1 点です。PDOP 6 以下での全球可用性 100.00 %、PDOP の中央値 0.95、可視衛星数の平均 31.0、最小 22。" width="100%">
</picture>

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/assets/readme/solar-system-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/assets/readme/solar-system-light.svg">
  <img src="docs/assets/readme/solar-system-light.svg" alt="シナリオのエポック 2026-09-28T00:00:00 における太陽系。solar-system 種別の実際の実行（solar-system-tour.toml）から：太陽、9 つの惑星、準惑星の冥王星を黄道面の上方から見たもので、距離は表示用に対数的に圧縮し、各天体の地球からの片道の光時間を付しています。水星 0.47 au、10.1 光分、VALIDATED。金星 0.73 au、3.0 光分、VALIDATED。火星 1.55 au、14.0 光分、VALIDATED。木星 5.30 au、49.5 光分、VALIDATED。土星 9.44 au、70.2 光分、VALIDATED。天王星 19.44 au、157.4 光分、MODELLED。海王星 29.88 au、240.2 光分、MODELLED。冥王星 35.61 au、292.2 光分、MODELLED。リンク：火星から木星へ片道 2193.5 s、土星から地球へ片道 4212.2 s、エウロパから木星へ片道 2.2 s。" width="100%">
</picture>

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/assets/readme/leo-pass-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/assets/readme/leo-pass-light.svg">
  <img src="docs/assets/readme/leo-pass-light.svg" alt="leo-pass 種別の実際の実行（leo-pass-iridium.toml、このジェネレーターが実行したエンジン）からの 1 回の低軌道（LEO）のパス：高度 781 km の Iridium-pass、1621 MHz の STL バンドを、北緯 50° 西経 30° の航空利用者が観測。5° のマスクより上に 750 s、最大仰角は 444 s で 65.0°。搬送波対雑音密度のピークは 80.5 dB-Hz（中央値 71.3）で、可視の GPS 衛星 8 機（38.2 から 51.1 dB-Hz）の GNSS の中央値 46.2 dB-Hz を 34.3 dB 上回ります。ドップラーは 35.4 kHz に達します。" width="100%">
</picture>

`kshana example <scenario> > s.toml && kshana s.toml` でどれでも実行できます：シナリオは
`l-band-waterfall-jamming`、`constellation-multi-gnss-coverage`、`solar-system-tour`、
`leo-pass-iridium` です。

</details>

<details>
<summary>コミット済みの合成入力から描いた海事と干渉の機能：信頼スコア、ルート曝露付きの干渉マップ、訓練用ストリーム、エビデンスパック</summary>

<br>

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/assets/readme/trust-timeline-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/assets/readme/trust-timeline-light.svg">
  <img src="docs/assets/readme/trust-timeline-light.svg" alt="1 回の合成の航海における信頼スコア。examples/maritime-trust（タリンからヘルシンキへのルートを航行するフェリーの架空の NMEA ログ、1 Hz で 3001 エポック）に対するエンジン v0.40.0 の実際の実行から。3 つのレーンが 1 つの時間軸を共有します。上段：受信機が報告する位置と船舶の実際の位置との距離。約 1576 s まで数メートル以内にとどまり、その時点でログにスクリプト化された位置のドラッグオフが位置を引き離しますが、受信機は有効な測位を報告し続けます。中段：0 から 100 の信頼スコア。最初の 300 s のキャリブレーション中は計算されず、ドラッグオフまでは nominal の帯域（90 以上）にあり、その後 degraded の帯域（55 以上）を通過して untrusted の帯域に落ちます。下段：各エポックの帯域を、名前付きの色のリボンで示します。スコアは助言用です。助言用ソフトウェアであり、型式承認を受けた航法装置（IEC 61108、IEC 61162）ではありません。船舶の航行の責任は引き続き運用者にあります。ログは形式とモニターを示すために作られた架空のものであり、測定ではなく、いかなる受信機の性能についても何も述べていません。" width="100%">
</picture>

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/assets/readme/interference-map-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/assets/readme/interference-map-light.svg">
  <img src="docs/assets/readme/interference-map-light.svg" alt="examples/interference-map/output にコミットされたサンプルから描いた 2 つの合成干渉マップの日。それぞれ独自の合成ルートと、エンジンが報告するルートの曝露割合を示します。左は ADS-B の日：劣化セル 1、劣化なし 6、未評価 4（ハッチング）、記録のないセルは空白で描かれ、観測されていません。ルートは 525 km で、その長さの 11.5% が劣化セル、38.3% が劣化なし、9.1% が未評価、41.1% が未観測です。右は AIS の日：円検出器と陸上検出器がフラグを立てたセル、異常なしのセル、空白のセル。ルートは 454 km で、10.5% が異常セル、21.2% が異常なし、0.0% が未評価、68.3% が未観測です。ADS-B と AIS は別々のレイヤーであり、結合されることはありません。フラグの立ったセルは干渉の認定ではなく、色のないセルは観測されていないのであって、クリアと同じではありません。すべてのデータは大西洋中部の外洋における架空のものであり、測定ではありません。" width="100%">
</picture>

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/assets/readme/training-track-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/assets/readme/training-track-light.svg">
  <img src="docs/assets/readme/training-track-light.svg" alt="シナリオ coastal-drag-off からの訓練用ストリーム（エンジン v0.40.0、シード 22、教官用ログの 10 s ごとに 1 測位で 25 分）。地図は船舶の真の航跡と受信機が報告する航跡を示します：両者は 421 s にスクリプト化された位置のドラッグオフが始まるまで一致し、その後、受信機が有効な測位を保ったまま報告される航跡は真の航跡から離れていき、イベントが 1140 s に終わると元に戻ります。その横に、2 つの航跡間の距離の時間変化と、受信機が報告する平均搬送波対雑音密度があり、後者はイベントの間、1 つの高いレベルに上昇します。Kshana が生成した合成の訓練データです。訓練と試験専用：このストリームを船舶のライブの航法システムに決して入力しないでください。助言用であり、型式承認を受けた航法装置ではありません。助言用ソフトウェアであり、型式承認を受けた航法装置（IEC 61108、IEC 61162）ではありません。船舶の航行の責任は引き続き運用者にあります。位置、日付、航跡は架空のものです。" width="100%">
</picture>

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/assets/readme/evidence-pack-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/assets/readme/evidence-pack-light.svg">
  <img src="docs/assets/readme/evidence-pack-light.svg" alt="エビデンスパックの構造。受信機ログ（NMEA、u-blox UBX、RINEX 3 または Android のログ）と時間ウィンドウが kshana receiver-trust evidence に入り、7 つのファイルを書き出します：log-slice.bin、config.json、epochs.json、summary.html、manifest.json、manifest.sig、任意の timestamp.tsr。マニフェストは、ログ全体と各ファイルの SHA-256、およびファイル全体にわたるハッシュチェーンを記録し、署名はマニフェストを対象とします。kshana evidence verify は署名、各ファイルのハッシュ、チェーン、一覧にないファイルが存在しないことを確認し、検証できた場合は 0、何かが失敗した場合は 1、署名者が固定されていない場合は 3 で終了します。パックは技術的な記録であり、法的な意見ではありません。" width="100%">
</picture>

4 つともすべて架空のデータであり、助言用です：ソフトウェアの形式と動作を示すものであり、いかなる受信機やシステムの干渉に対する性能を示すものでもありません。1 つ目は `kshana receiver-trust examples/maritime-trust/session.toml` で、2 つ目は `examples/interference-map/` のサンプルに対する `kshana route-exposure` で、3 つ目は `kshana nmea-scenario scenarios/training/coastal-drag-off.toml --out drag.nmea` で（訓練用途のみ：ライブの航法装置には決して入力しないでください）、4 つ目は [`docs/EVIDENCE-PACKS.md`](docs/EVIDENCE-PACKS.md) のとおりに実行します。

</details>

<details>
<summary>ドメインごとの完全な機能表</summary>

以下にドメインごとの完全な詳細を示します。機能ごとの成熟度の台帳については
[`docs/CAPABILITY.md`](docs/CAPABILITY.md) と [`docs/VALIDATION.md`](docs/VALIDATION.md) を参照してください。

| ドメイン | 機能 |
|--------|------------|
| **軌道と幾何配置** | SGP4/SDP4 による伝搬（AIAA 2006-6753 の全 666 ベクトルに対して 4.12 mm まで検証済み）。実際の 2 行軌道要素（コミット済みで日付入りの Celestrak `gps-ops` スナップショット）または合成の Walker-delta コンステレーションで、その平均要素は 24 h の伝搬で `i:T/P/F` の式を 1 km 未満で実現します。マルチコンステレーションの可視性、**精度低下率 — 幾何、位置、水平、垂直、時刻（GDOP/PDOP/HDOP/VDOP/TDOP）。gnss_lib_py 1.0.4（Stanford NAV Lab）に対して 1e-6 まで検証済み**（Navigation and Autonomous Vehicles Laboratory）、および GNSS の可用性。勾配を使わないコンステレーション設計の最適化器、streets-of-coverage による最小衛星数のサイジング、マルチコンステレーションの比較ツール、そして軌道面数 × 衛星数のグリッドにわたってカバレッジ / PDOP / 再訪時間を表にまとめ、パレート最適な設計を報告する Walker の **設計スイープ**。 |
| **数値伝搬器** | 解析的な SGP4/SDP4 の経路を補完する **Cowell** 型の数値伝搬器（`src/propagator.rs`）。階層的な **7 種類の摂動** の力学モデル（`src/forces.rs`）を備えます：二体 + 完全な **J2–J6 帯状** 場（地球の扁平に関する帯状調和係数 J2 から J6。その摂動ポテンシャルの厳密な解析的勾配）、任意の **次数/位数 70 までの EGM2008 テッセラル球面調和ジオポテンシャル**（Earth Gravitational Model 2008、`src/gravity_sh.rs`。米国の NGA — National Geospatial-Intelligence Agency — の実際の係数、Holmes–Featherstone の正規化ルジャンドル漸化式。閉形式のルジャンドル関数と解析的な ∇V 恒等式に対してクロスチェック済み）、**エポックに基づく太陽と月の第三体** の重力（組み込みの低精度エフェメリス（軌道暦）で、DE/SPK — Development Ephemeris / SPICE Spacecraft and Planet Kernel — のカーネルは不要）、**太陽輻射圧**（円錐状の本影+半影の影を伴うキャノンボールモデル）、**大気抵抗**（Vallado の区分指数密度、共回転大気）、**ポストニュートン的な Schwarzschild の相対論補正**、そして **Lense–Thirring の慣性系の引きずり** の項（IERS — International Earth Rotation and Reference Systems Service — Conventions 2010 §10、地球の角運動量に線形、Schwarzschild より約 1–2 桁小さい）。これらは 2 つの適応積分器（RK4 — 4 次の Runge–Kutta — のステップ倍化、または **Dormand–Prince RK5(4)** の埋め込みペア）から選んで駆動します。**Orekit 12.2**（CS GROUP、Apache-2.0）の `NumericalPropagator`/`DormandPrince853` **に対して検証済み** — LEO（低軌道）+ GTO（静止トランスファー軌道）にわたる 278 エポックで、保存力の階層は最悪ケースで **\|Δr\| 0.08 m / 24 h** で一致します（`tests/numerical_cowell_propagator_reference.rs`）。大気抵抗の階層は別途特性評価しており（≈ 333 m / 24 h）、太陽/月のエフェメリスと密度の絶対的な入力は正直に **Modelled** のままです。追加の内部エビデンス（外部の検証ではありません）：摂動のない軌道は厳密な普遍変数ケプラー解に対して **24 h でメートル未満** で確認しており、エネルギー/角運動量は約 1e-9 で保存し、各摂動は手で導いた閉形式の特徴と一致します。 |
| **マヌーバと軌道設計** | 6×6 の共分散伝搬（ECI — 地球中心慣性 — / LVLH — 局所鉛直・局所水平 — の実行誤差座標系）を伴うインパルス的な ΔV ノード、閉形式の **Tsiolkovsky** ロケット方程式に対して 0.01 % 未満で確認した有限噴射の積分、**Izzo-2015** の 1 周回 **Lambert** ソルバー、厳密な普遍変数 **Kepler** 伝搬器、そして JSON の等高線グリッドとして出力する **ポークチョップ**（打ち上げ × 到着）の C3（打ち上げエネルギー）/ 到着 V∞ のスイープ。GMAT/Orekit の上に位置する性能シミュレーション層であり、すべての Lambert の出力は二体の真値に対してラウンドトリップで確認し、ポークチョップの最小値は解析的な Hohmann の下限に対して確認しています。 |
| **時刻系と座標系** | IERS のうるう秒による **UTC / TAI / TT / UT1** の時刻系（協定世界時、国際原子時、地球時、地球回転の時刻である世界時 1）、ユリウス日の API（アプリケーション・プログラミング・インターフェース）、IAU-2000（国際天文学連合）の **地球回転角**（ERA）、GMST（グリニッジ平均恒星時）に基づく **TEME ↔ ECEF**（真赤道・平均春分点 ↔ 地球中心・地球固定）と WGS-84（World Geodetic System 1984）の測地座標系、IAU 2006 の歳差（Fukushima–Williams）、完全な **IAU 2000A/2000B 章動**、IERS の **極運動**、そして春分点に依存しない **CIO ベースの IAU 2006/2000A GCRS↔ITRS** 変換（CIO = Celestial Intermediate Origin）。すべて SOFA/ERFA のベクトルに対して **ビット単位で** 検証済みであり、さらに **ANISE**（純粋な Rust による NAIF/SPICE の再実装。NAIF = 米国航空宇宙局 NASA の Navigation and Ancillary Information Facility）**に対して独立にクロスチェック済み**：kshana の GCRS→ITRS と、JPL の `earth_latest_high_prec.bpc` による ANISE の ITRF93（International Terrestrial Reference Frame 1993）は、両方に同じ IERS の地球姿勢パラメーターを与えたとき、2020–2023 年の 8 エポックにわたって **地上で ≤ 0.86 m / GNSS 軌道で ≤ 3.6 m**（最大 0.028″）で一致します。 |
| **慣性** | 3 軸ストラップダウン INS — クォータニオンによる姿勢、WGS-84 NED（北・東・下）の機械化方程式、コーニング/スカリングの補償、決定論的な IMU 誤差モデル（スケールファクター、ミスアライメント、g 感度、量子化、ドリフト）。速度ランダムウォーク係数を *導出する* **第一原理の冷却原子干渉計加速度計**（Mach–Zehnder 位相、量子射影雑音、コントラストの減衰、振動の結合）。そして、地図支援（地形/重力参照）による GPS 拒否下の航法のための逐次重点リサンプリング **粒子フィルター**。 |
| **代替 PNT（GPS 拒否下）** | 白色雑音の下限（`σ = ASD/√τ`、ASD = 振幅スペクトル密度）を CAI 加速度計の物理から導出する冷却原子 **重力計の測定モデル**。低次の完全正規化 **球面調和の重力異常場**（閉形式のルジャンドル関数と、手で導いた単一項の異常に対して確認済み）と合成のマスコン。**重力汎関数の合成カーネル**（`gravity_sh::gravity_magnitude` / `gravity_disturbance_mgal`）— 重力支援の航法装置が照合に使う「地図の読み取り器」— は **GRS80 の正規重力の標準**（Geodetic Reference System 1980）に対して検証済みで、閉形式の Somigliana 正規重力と公表された γ_e / γ_p を **3.5e-12** まで再現し、実際の ICGEM（International Centre for Global Earth Models）**EGM2008** 場から物理的に有界な擾乱マップを生成します（RMS — 二乗平均平方根 — ≈ 26 mGal、次数/位数 70 で最大 ≈ 89 mGal。`tests/icgem_gravity_reference.rs`）。そして、通過する異常の系列から GPS 拒否下の航跡を復元する **重力地図照合の粒子フィルター**。これは **地形参照航法**（TERCOM/SITAN — 地形等高線照合 / Sandia Inertial Terrain-Aided Navigation — を SRTM（Shuttle Radar Topography Mission）の `.hgt` DEM（数値標高モデル）に対して、`src/altpnt/terrain.rs`）、次数/位数 13 までの **IGRF-14 地磁気主磁場**（第 14 世代 International Geomagnetic Reference Field、`src/igrf.rs`。傾いた双極子の閉形式と ∇V の有限差分に対して確認済み）、そして 3 つのスカラーチャネルすべてを 1 つの粒子フィルターで融合する **重力 + 磁気 + 地形の複合** 航法装置（情報は加法的であり、どのチャネルも測位を悪化させません）に拡張されます。**60 分間の GPS 拒否下ベンチマーク**（慣性解が約 70 km までドリフトする、約 700 km / 1 時間の途絶）は、階層的な粗から密への照合器によって **約 145 m（< 500 m）** まで復元されます — ESA NAVISP（Navigation Innovation and Support Programme）の *Quantum Wayfarer* の目標です。 |
| **融合** | 閉ループのフィードバックを伴う疎結合の 15 状態 GNSS/INS 誤差状態 EKF（拡張カルマンフィルター）（`gnss-ins` パック）。衛星が 4 機未満でも補正を続ける **密結合** の擬似距離更新。結合された **時計 + 位置** のフィルター。強い非線形の測定のための一般的な **アンセンテッド（シグマポイント）カルマン** 推定器。密結合の GNSS/INS **UKF 航法装置**（擬似距離 + ドップラー）で、その力学モデルによる軌道上のコーストは、120 秒間の GNSS 途絶を含む 30 分間の曲がった LEO のパスで **0.77 m RMS** まで自己整合性を確認しています（フィルターの整合性の数値であり、外部のオラクルによる検証ではありません — この航法装置は MODELLED のままです）。そして完全な **17 状態の密結合 GNSS/INS UKF**（位置、速度、姿勢誤差、加速度計とジャイロのバイアス、時計のバイアスとドリフト）で、その **量子 CAI による推測航法** は、冷却原子加速度計から導出した速度ランダムウォークで 120 秒間の途絶をコーストします。 |
| **軌道決定** | 地上局の測距追跡からの軌道状態 `[r, v]` の復元。二体 + J2 の力学モデルと RK4 積分器を、**Gauss–Newton のバッチ** 修正器（`determine_orbit_batch`、雑音のない距離からメートル未満 / mm·s⁻¹、5 m の雑音レベルで約 2 m）および **逐次型** のアンセンテッドフィルターの変種（`determine_orbit_sequential`）と組み合わせます。 |
| **可観測性と推定理論** | 一般的で再利用可能な **フィッシャー情報 / Cramér–Rao** の層（`src/fim.rs`）：情報行列 M = HᵀWH、**Cramér–Rao の下限**、可観測性の **階数と測地原子の欠損の零空間**（Moore–Penrose の擬似逆行列）、そして対称 Jacobi 固有値ソルバーによる **D/A/E/T 最適** の実験計画のスカラー。**検証済み** — 固有値は `numpy.linalg.eigh` に対して、CRLB の共分散は `numpy.linalg.inv` による σ²(XᵀX)⁻¹ に対して、情報行列からの GNSS の DOP も、すべて **1e-9** まで一致します（`tests/fim_observability_reference.rs`）。さらに **Kay (1993)** の閉形式の境界に対して、モンテカルロによる CRLB の到達とともにクロスチェックしています。DOP エンジン、受動的ジオロケーションの CRLB、そして月の絶対局の **可観測性定理**（下記）の基盤となっています。 |
| **月とシスルナ** | 回転座標系における地球–月の **円制限三体（CR3BP）** 伝搬器 — 保存されるヤコビ定数と 5 つすべてのラグランジュ点（`src/cr3bp.rs`）— に、**6×6 の状態遷移行列（STM）と単一シューティングの微分修正器**（`cr3bp_jacobian`、`propagate_state_stm`、`differential_correct_halo`）が加わり、真に周期的な **ハロー / NRHO**（準直線ハロー軌道）を生成します：STM は有限差分に対して検証済みで、修正した軌道は機械精度近くまで閉じ、公表された遠月点の状態を初期値にすると **L2 南側 9:2 NRHO**（L2 = 地球–月の第 2 ラグランジュ点、Gateway の軌道）を周期 ≈ 6.57 d / 近月点 ≈ 3,250 km で再現し、公表値の ≈ 6.56 d / ≈ 3,370 km と整合します（CR3BP — 円軌道、太陽なし — の解であり、実際の LANS（Lunar Augmented Navigation Service）/Gateway のエフェメリスに対しては**検証されていません**。修正した軌道の月中心 MCI/MCMF（月中心慣性 / 月中心・月固定）への変換は今後の課題です）。さらに **LunaNet / LNIS**（LunaNet Interoperability Specification）のシスルナ PNT の幾何配置（MCI↔MCMF 変換、月面座標）と、インテグリティ（完全性）のギャップを正直に示す **月の南極での ARAIM** のパス：約 30 m の σ_URE（ユーザー距離誤差）によって、保護レベルは 50 m のアラートリミットを大きく上回ります（`src/lunar.rs`、`scenarios/lunanet-araim.toml`）。そして **表面ビーコンによる DOP の補強**（`src/lunar_beacon.rs`）は、測量済みの少数の表面測距ビーコンが、頭上の軌道のみからなる集合に欠けている低仰角・広方位の視線の行をどのように補うかを示します — 悪条件の南極域の GDOP と、二乗和平方根の誤差バジェットを通じて実現される位置精度（メートル）を劇的に改善します（gnss_lib_py で検証済みの DOP カーネルと、大気のない地平線の可視性の閉形式を再利用。精度低下率の解析は [arXiv:2607.06212](https://arxiv.org/abs/2607.06212) にまとめています）。 |
| **月の PNT スイート** | CR3BP のコアの上に重ねた月/シスルナの航法スイートで、それぞれが実行可能な `kind` です：**月座標時**（`lunar-time-offset`、`src/lunar_time.rs` — 自己ポテンシャルの差 + 運動項から求める永年的な LTC/TCL − TT のレート（LTC = Lunar Coordinate Time、TCL = そのフランス語形 Temps-Coordonnée Lunaire）で、公表された 56–59 µs/day の帯域とともに報告）。測地的な **月の VLBI**（超長基線電波干渉法）の遅延観測量（`lunar-vlbi`、`src/lunar_vlbi.rs` — 地球の基線による近接場の 2 距離差の遅延 + レートで、遠方場の極限において同じコードベースの平面波 Δ-DOR（delta differential one-way ranging）に対してクロスチェックし、偏微分は有限差分で確認済み）。**複数手法の結合による OD + 時計** のバッチ推定器（`lunar-joint-od-clock`、`src/lunar_combination.rs` — VLBI + 月のローカルな距離 + 衛星間距離を融合する Gauss–Newton のフィット）は、**フィッシャー情報による可観測性** の結果を伴います：内部の測距だけでは 6 自由度の剛体の **測地原子の欠損** が残るため、地球座標系への結び付けを加えるまで表面局の *絶対* 位置は観測できません — 地球の基線による **VLBI** の遅延は、疎なコンステレーションでは可観測性を *回復* し、豊富なコンステレーションでは Cramér–Rao の境界を *鋭く* し、絶対的な測地原子は同一直線上にない **3 つ** の地球局で閉じます（この可観測性の結果は [arXiv:2607.02566](https://arxiv.org/abs/2607.02566) にまとめています）。**座標系の実現**（`lunar-frame-realisation`、`src/lunar_frame_realise.rs` — 7 パラメーターの Helmert 測地原子フィット + IAU 2015 WGCCRE の姿勢の結び付け — WGCCRE = IAU Working Group on Cartographic Coordinates and Rotational Elements）。**Moonlight/LCNS 級のサービスボリューム** の解析（LCNS = Lunar Communications and Navigation Services、`moonlight-service-volume`、`src/lunar_service.rs` — DOP / カバレッジ / 可用性 + 一般化した月の ARAIM の HPL/VPL（水平/垂直保護レベル）エンベロープ。gnss_lib_py で検証済みの DOP カーネルと LunaNet の σ_URE≈30 m の仕組みを再利用）。**月のディファレンシャル PNT**（`lunar-differential-pnt`、`src/lunar_dpnt.rs` — 月のディファレンシャル GNSS / 衛星航法補強システム（SBAS）の類似物：基線に対する同相時計誤差の厳密な相殺 + 一次の空間的な相関の低下。DO-229E の SBAS 保護レベルを再利用 — DO-229E は RTCA（旧 Radio Technical Commission for Aeronautics）による SBAS 受信機の最低運用性能標準）。そして **LunaNet/IOAG に整合した相互運用エクスポート**（IOAG = Interagency Operations Advisory Group、`lunar-interop-export`、`src/lunar_interop.rs` — IAU 2015 の月固定座標系における CCSDS-OEM（Orbit Ephemeris Message）+ 月の時刻系のラウンドトリップを KIF のエンベロープで包んだもの）。各要素のエビデンスのティアは[検証マトリクス](docs/VERIFICATION-MATRIX.md)にあります：月座標時、結合 OD + 時計の推定器、座標系の実現、サービスボリュームの幾何配置は **VALIDATED**（それぞれの行が名指しする独立したオラクルに対して。VLBI の遅延のカーネル経路も同様）、VLBI の観測量、測地原子の欠損の可観測性の結果、ディファレンシャル PNT、相互運用エクスポートは **MODELLED** です。パラメーターは **例示用の公開ソース** の値です — 実際の VLBI/Gateway の追跡に対しては**検証されておらず**、いかなる機関とも**提携しておらず、承認も受けておらず**、TRL（技術成熟度レベル）/ 実績の主張もありません。 |
| **深宇宙と火星の PNT** | オープンな **電波航法エンジン**：反復的な光時間 + **Shapiro** の相対論的遅延、2-way/1-way/3-way の **ドップラーと距離**（Moyer の 2 区間）、コヒーレントなトランスポンダーの折り返し比、再生型/PN（擬似雑音）測距（CCSDS 414、擬似雑音測距の標準）、天球面上の **Δ-DOR**（CCSDS 506、Delta-DOR の標準）、太陽プラズマ/対流圏/電離圏の媒質。**CCSDS-TDM (503)** の追跡データメッセージの解析 + 出力。合成の閉ループで **火星低軌道の軌道決定を ≈ 0.2 m** で行う **縮約動力学の平方根情報フィルター**（RTN — 動径・横断・法線 — の経験的加速度 + 3 状態の搭載時計 + 火星の大気抵抗）。**1-way + 2-way の融合** 推定器。多体力学のコア（`Body{μ, re, zonals, gravity, IAU-pole}`、火星の GMM-3（Goddard Mars Model 3）重力、IAU の火星固定座標系、差し替え可能な `EphemerisProvider` の接合部、2 部構成のユリウス日 + TT↔TDB（太陽系力学時））。そして **`mars-pnt`** のリレー PNT シナリオ（MARCONI の火星静止リレーコンステレーション）と、エンドツーエンドの **GSE 性能シミュレーター**（GSE = 地上支援装置）（幾何配置 → リンクバジェット → 観測量 → SRIF → 共分散）。**シミュレーションで検証済み**（共分散 / 閉ループの性能指標）。太陽中心の火星の力学は JPL **DE440** に対してクロスチェック済み（1 日のアークで 137 m、`xval/anise-mars-od`）。実際の DSN/ESTRACK の追跡データによる検証はロードマップにあります。 |
| **太陽系と任意の天体の PNT** | カーネル不要の **太陽系全体のエフェメリス**（`src/ephem.rs`、`src/ephem_provider.rs`）：すべての惑星を JPL の **Standish のケプラー要素**（Table 1、1800–2050 AD、Tables 2a/2b、3000 BC–3000 AD）から、各惑星の公表された公称誤差とともに求め、地球と月は月の級数で分離し、フォボス、ダイモス、イオ、エウロパ、ガニメデ、カリスト、タイタンは JPL の平均要素と IAU（国際天文学連合）の自転モデルから求めます。ICRF（International Celestial Reference Frame）における **任意の天体に対する任意の天体**。`Body` は現在、**18 の天体について GM（重力定数）、半径、公表されている場合は J2（第 2 帯状調和係数）、IAU の自転軸と本初子午線** を持ちます。**`solar-system`** 種別は、位置、速度、定数、任意の 2 天体間の **光時間と 1-way/2-way の距離**（既存の電波の光時間ソルバーで、太陽の Shapiro 遅延を含む）、そして天体ごとの軌道の軌跡を報告します — インタラクティブな太陽系を描くのに十分です。**`body-pnt`** 種別は、ローカルな Walker コンステレーション、精度低下率と Gauss–Newton の仕組み、地球からの深宇宙の距離を使って、**任意の天体の周り** のオービターや着陸機の位置を求めます（`scenarios/mars-orbit-pnt.toml`、`scenarios/europa-surface-pnt.toml`）。JPL Horizons（DE441、JPL Development Ephemeris 441）**に対して検証済み**：Table 1 による水星から土星と地球は公称誤差の 2 倍以内（最悪 1.87×）、Tables 2a/2b による 8 つすべての惑星（最悪 1.71×）、地球–火星/木星の光時間。**Modelled**：Table 1 による天王星と海王星（DE441 に対して明示された誤差の 2.0× と 5.2×）、冥王星、衛星、`body-pnt` の航法結果。 |
| **MEO + LEO の融合 PNT** | `src/leo_fusion/`：任意のコンステレーション（Walker シェル、要素セット、GNSS のプリセット）と任意の信号（搬送波、チップレート、C/N0 エンベロープ、信号空間距離誤差）にわたる、システムに依存しない LEO の測位・航法・タイミング。出典を伴う任意の 1 ファイルのプリセット付き（Xona Pulsar X1/X5、Iridium STL、Starlink の機会信号、CentiSpace、代表的な C バンドのシステム、ATOMIC のゼロ時計エフェメリスモデル）。**`leo-pvt`**：距離変化率からのバッチ **ドップラー測位**（単一衛星と複数衛星、時計ドリフトと速度の状態、単一パスの軌道方向/軌道直交方向の幾何配置と鏡像解）、システムごとのシステム間バイアスと呼び出し側が与える信号ごとのシグマを伴う **GNSS + LEO の結合重み付き最小二乗**、LEO 衛星数に対する DOP、**極域と北極域** のカバレッジ、C/N0 と発振器に対する **LEO による UTC への時刻転送**。**`leo-ppp`**：GNSS のみ、および LEO を加えたフロート PPP（精密単独測位）EKF（拡張カルマンフィルター）、その収束時間とカイ二乗 NEES の整合性検定。**`ntn-positioning`**：帯域幅の Cramér-Rao 境界からの 5G 非地上系ネットワーク測位。**検証済み**：公表された Iridium と Xona の数値に対する LEO のドップラーエンベロープ。**Modelled**：その他すべてであり、PPP の傾向は Li et al. (2019) と比較しています — [`docs/LEO-PNT-FUSION.md`](docs/LEO-PNT-FUSION.md) を参照。 |
| **インテグリティ（完全性）** | スナップショット型と解分離型（ARAIM 式）の RAIM — 受信機自律型インテグリティ監視 — で、水平/垂直の保護レベル（HPL/VPL）、故障検出と排除、Stanford のインテグリティ図を備えます。明示的なインテグリティリスクのバジェットを持つ **多重仮説解分離（MHSS）** の保護レベルで、**デュアル/マルチコンステレーションのコンステレーション全体の故障モード**（EU（欧州連合）の ARAIM / DO-316、航空機ベースの補強を伴う GPS 機上装置のための RTCA の性能標準）を含み、実際の GPS + Galileo のスナップショット（`scenarios/araim-gps-galileo.toml`）で動作を確認しています。保護レベルは、故障モードごとに片側の **公称バイアス** の射影 `b_k = Σ_i|s_i|·b_nom` と、Integrity Support Message からの **インテグリティ** のシグマ σ_URA（ユーザー距離精度。精度の σ_URE、ユーザー距離誤差とは別物）を適用します — [`docs/ARAIM_REFERENCE.md`](docs/ARAIM_REFERENCE.md) を参照。検出カーネル（χ²/非心 χ²/正規分布の閾値と K 乗数）は 171 ケースにわたって **SciPy に対して外部検証済み** であり（`tests/raim_reference.rs`）、幾何配置は gnss_lib_py で検証済みの DOP カーネルを再利用しています。ARAIM MHSS のインテグリティリスクの *バジェット配分* そのものには公表された数値のオラクルがなく、正直に Modelled のままです。 |
| **補強（SBAS）** | DO-229E の重み付き最小二乗形式（精密進入とエンルートの K 係数）による **SBAS / WAAS の保護レベル**（WAAS = Wide Area Augmentation System）と、DO-316 の基盤となる **L1/L5 の 2 周波電離圏フリー** の線形結合（L1 と L5 は GPS の 2 つの民間信号帯域。IS-GPS-705 は L5 信号の GPS インターフェース仕様、γ₁₅ ≈ 1.793） — `src/sbas.rs`。保護レベルのアルゴリズムは、**実際の EGNOS データ**（European Geostationary Navigation Overlay Service）で実行した **RTKLIB の SBAS-PL フォーク**（RTKLIB = オープンなリアルタイムキネマティック測位ライブラリ、PL = 保護レベル）（`zsiki/rtklib_ws` の `waasprotlevels()`、Siki & Takács 2017、DO-229D — DO-229 の前の改訂版 — App. J）**に対して外部検証済み** であり、その HPL を < 2e-3 m で再現します（`tests/sbas_reference.rs`）。gLAB（GNSS Laboratory のツールスイート）v6.0.0 でも同一の規約であることを確認しています。 |
| **時計とタイミング** | 2 状態のカルマンによるホールドオーバー（Joseph 形式の共分散、NIS/NEES — 正規化イノベーション二乗 / 正規化推定誤差二乗 — による整合性の健全性）。Allan 系の安定度（ADEV / MDEV / TDEV / HDEV / MTIE — Allan 偏差、修正 Allan 偏差、時間偏差、Hadamard 偏差、最大時間間隔誤差）で、雑音の種類に応じた信頼区間と完全な **IEEE-1139 の 5 係数のべき乗則フィット**（IEEE Std 1139、Institute of Electrical and Electronics Engineers の周波数・時間計測の定義）を備えます — 推定器は **Stable32** に対して実際のハードウェアで検証済みです：**実際の 5071A セシウム一次標準と水素メーザーの比較**（556,990 の位相サンプル、16 の平均化係数、OADEV/OHDEV — オーバーラップ Allan/Hadamard 偏差 — を 1e-3 まで。`tests/cs5071a_reference.rs`）と **標準的な Stable32 PHASE.DAT** の回帰系列（139 の平均化係数、OADEV/MDEV/TDEV を 1e-3 まで。`tests/phasedat_reference.rs`）。ADEV/MDEV/TDEV の推定器と通信用の **MTIE** ワンダー指標は、さらに NIST SP 1065 の系列で **独立した allantools 2024.06** ライブラリに対して **< 1e-9** でクロスチェックしています（`tests/mtie_reference.rs`、`tests/mdev_tdev_reference.rs`）。幾何学的補正（Sagnac、GNSS コモンビュー）。そして運用上の時刻転送手法 — BIPM（国際度量衡局）の Sagnac の閉形式を伴う **TWSTFT**（衛星双方向時刻周波数比較）、**GNSS コモンビュー**、**PPP**（精密単独測位）による電離圏フリーの時刻転送、乱流シンチレーションを伴う自由空間 **光** リンク、そして寄与する最良の時計を下回る逆分散重み付きの **時計アンサンブル（ペーパー）時系**。**GNSS 拒否下の時計ホールドオーバー計算機**（`src/holdover.rs`）は、閉形式の van-Loan のコースト誤差の増大を *閾値までのホールドオーバー* の逆問題として示します — 時計が自走してからタイミング誤差がバジェットを超えるまでどれだけかかるか — を、代表的な古典時計と量子時計のクラスにわたって。**モデル化**（多段の `clock_state` の共分散漸化式に対してクロスチェック済み）であり、非常に安定な時計の場合、厳しい閾値までのホールドオーバーは引用された ADEV ではなく *仮定した* 長 τ の雑音下限によって決まることを正直に示します。**条件付きタイミング保護レベル**（`src/tpl.rs`）はホールドオーバーをスプーフィングに拡張します：独立したクロスチェックが与えられたときの *検出されない* 時刻誤差の境界であり、k シグマのモニター下限、検出遅延にわたる van-Loan のコースト分散、CUSUM（累積和）による警報までの時間を組み合わせます。実際に記録されたスプーフ（JammerTest 2024）でキャリブレーションし、`cargo run --example tpl_jammertest` で再現できます。**MODELLED** の組み合わせ（1 時間あたりのインテグリティリスクのバジェットなし）であり、検出を条件とします — 有限の *無条件の* 境界はありません。 |
| **GNSS の測定ドメイン** | **Klobuchar**（放送）と **IONEX / TEC グリッド**（IONosphere map EXchange 形式 / 全電子数、実測）の電離圏 — IONEX ファイルのパーサー、マップ間の時間補間、薄層の斜めオブリクイティのマッピングを含む — **Saastamoinen + Niell** の対流圏、スナップショット RAIM（HPL/VPL）を伴う、擬似距離 / ドップラーの順方向の合成。 |
| **レジリエンス** | リンクバジェットによる **ジャミング**（J/S → 実効 C/N₀ → ロック喪失 — ジャマー対信号比、搬送波対雑音密度比 — で、アンチジャムのスペクトル分離係数 `Q` は、`src/navsignal.rs` を通じて **実際の信号とジャマーの電力スペクトルから導出** するようになりました — `Q = 1/(R_c·κ)`、CI で以前の代表的な定数に対してクロスチェック）。確率的な **時刻スプーフ検出器**（Neyman–Pearson / χ²₁ エネルギー検定で、閉形式とモンテカルロの P_fa/P_md、1 − P_md のセキュリティ性能指数（FoM））。RAIM の整合性パリティ検定（同相の死角を正直にモデル化）、RF の AGC 電力（自動利得制御）モニター、信号品質（SQM — 信号品質監視、early-minus-late）モニターを融合する **多層スプーフ検出器**。そして **量子慣性による推測航法の誤差バジェット**（`QuantumNavBudget`、`src/inertial/quantum_imu.rs`）は、冷却原子干渉計の白色雑音による速度ランダムウォークを、残留バイアス（独立した `AccelModel` 積分器に対してクロスチェック済み）とスケールファクター誤差と組み合わせて、ホールドオーバー中の位置ドリフトの数値にします — 時計のホールドオーバーの慣性版です。**フレームワークに整合したレジリエンスのスコアリングエンジン**（`src/resilience/`）は、アーキテクチャのシミュレーション上の挙動を、Kshana 独自の 7 つのレジリエンスのカテゴリ（DHS の用語ではありません）にわたる次元ごとのサブスコアに対応付け、米国国土安全保障省の Resilient PNT Conformance Framework に整合させたうえで、Dirichlet の重み付け単体と 5 つの脅威のアンサンブルの下で、単一の複合スコアや成熟度レベルの **判断の安定性** を調べます — Kendall-τ の順位の不安定性、首位の入れ替わり率、同相の **多様性の崩壊**（Hill-N2）を、インテグリティのハッシュ付きの保証レポートとともに（手で導いたオラクルによるテスト 35 件）。`cargo run --example resilience_report` で再現できます。**MODELLED** の合成アーキテクチャであり、RPCF v2.0 に整合した自己評価であって、認証では**ありません**。[`docs/RESILIENCE-CROSSWALK.md`](docs/RESILIENCE-CROSSWALK.md) を参照。 |
| **受動的な RF ジオロケーション** | **TDOA/FDOA による発信源のジオロケーション**（到来時間差/到来周波数差、`src/geolocation.rs`）— 受信機ネットワークにわたる **到来時間差** の双曲面から、ジャマーやスプーファー（あるいはリバース PNT のための機会信号源）の位置を、Gauss–Newton の最小二乗で求めます。移動する受信機による **到来周波数差** を加えると、発信源の位置 *と* 速度を同時に復元でき、ネットワークの幾何配置から導いた位置の共分散の **Cramér–Rao** 境界が得られます。**MODELLED**（内部整合性のオラクル：順方向→逆方向のラウンドトリップ、J·CRLB = I の恒等式、GDOP の単調性、モンテカルロの下で推定器が自身の CRLB に到達すること）— 点波源・見通し線のモデルであり、マルチパス / NLOS（見通し外）、受信機の時計バイアス、屈折の項はありません。 |
| **航法信号とコード追尾** | リンクバジェットと測定ドメインの間にある **信号レベル**（`src/navsignal.rs`）：**BPSK-R(n)**（矩形チップの二相位相変調）と **sine-BOC(m,n)**（binary offset carrier）の単位面積の **電力スペクトル密度**（PSD）。**スペクトル分離係数**（SSC）κ = ∫ G_s·G_i df で、ジャミングモデルが使う **アンチジャムの `Q` を、代表的な定数ではなく実際の信号/ジャマーのスペクトルから導出** します（`Q = 1/(R_c·κ)`）。**RMS（Gabor）帯域幅**（BOC > BPSK — 測距情報 / Cramér–Rao の尺度）。**コヒーレントな early–late DLL のコード追尾の熱雑音ジッター**（DLL = 遅延ロックループ、Kaplan & Hegarty。45 dB-Hz で C/A — GPS の coarse/acquisition コード — はメートル未満程度）。そして **マルチパス誤差エンベロープ**（コヒーレント EML、early-minus-late — 狭相関器による抑圧）。閉形式の基準値（BPSK の自己 SSC = 2/(3·R_c)、単位面積の PSD、メートル未満の C/A ジッター）に対して検証済み。これは信号の **性能** の解析であり、アンテナ / RF ペイロードのハードウェア設計（ペイロードパートナーの役割）では**ありません**。 |
| **相互運用性** | **RINEX-3** のマルチ GNSS 放送エフェメリスの取り込み（GPS、Galileo、QZSS — 日本の準天頂衛星システム —、BeiDou の MEO/IGSO — 中軌道 / 傾斜対地同期軌道 — は GPS インターフェース仕様 IS-GPS-200 で、GLONASS — ロシアの全地球航法衛星システム — は PZ-90 — ロシアの Parametry Zemli 1990 測地系 — の状態ベクトルの RK4 で）をコンステレーションのソースとして使えます（RINEX を入力し、PNT の幾何配置を出力）。**RINEX-3** の観測ファイルのパーサー（擬似距離、搬送波位相、ドップラー、信号強度。4.00 の観測のレイアウトは解析できる見込みですが未テストであり、RINEX 4 の航法ファイルは誤ってデコードするのではなく名前で拒否します）は、現在 **単独測位（SPP）ソルバー**（`pvt`）**に入力されます** — 実際のコード観測を入力し、実際の **受信機の位置** を出力し、IGS のデータで検証済みです。9 次のラグランジュ補間を備えた **SP3-c/d** の精密エフェメリスのリーダー/ライター。フライトダイナミクスのツール（GMAT、Orekit、STK — Systems Tool Kit）向けの **CCSDS OEM 2.0 + OMM**（Orbit Mean-elements Message）のエクスポート。そして深宇宙の電波追跡のための **CCSDS-TDM (503)** の追跡データメッセージの解析 + 出力。 |
| **ミッション解析（システムズエンジニアリング）** | 一次のミッション設計のバジェットで、それぞれが実行可能な種別です：二体の **打ち上げと上昇の幾何配置**（`launch-window` — 打ち上げ方位角 `sin Az = cos i/cos lat`、最小軌道傾斜角、地球自転のボーナス、ドッグレッグによる軌道面変更の Δv、1 日の打ち上げ機会。`src/launch.rs`）。**Allen–Eggers の弾道再突入コリドー**（`reentry` — 最大減速度、最大 g 時の速度/高度、最大加熱時の速度。`src/reentry.rs`）。**地球観測のカバレッジの幾何配置**（`eo-coverage` — SMAD（*Space Mission Analysis and Design*）の宇宙三角形による観測幅 / 直下点 GSD（地上サンプル距離）/ オフナディアのアクセス / 再訪。`src/eo_payload.rs`）。**3-DOF の姿勢と指向の誤差バジェット**（3 自由度。`attitude-budget` — 最悪ケースの重力傾斜トルク + RSS（二乗和平方根）の指向バジェット。`src/attitude_budget.rs`）。**地上局のパス予測**（`passes` — AOS/TCA/LOS、信号捕捉 / 最接近時刻 / 信号喪失、最大仰角、アクセス時間。`src/passes.rs`）。そして CCSDS 401 / DSN 810-005 のリンク方程式（CCSDS の無線周波数と変調の標準 / Deep Space Network のリンク設計ハンドブック）による **片方向のリンクバジェット**（`link-budget` — FSPL（自由空間伝搬損失）、C/N₀、Eb/N₀（ビットあたりエネルギー対雑音密度比）、マージン、成立性。`src/linkbudget.rs`）。**MODELLED** の一次の解析的バジェット — STK/GMAT/Basilisk の下にあるハードウェア以前の層であり、6-DoF や電波の代替ではありません。 |
| **意思決定分析とトレードオフ（MCDA）** | 4 つの手法ファミリーすべてにまたがる完全な **多基準意思決定分析**（MCDA）のスイート（`src/mcda/`）— 価値の集約（**WSM**、**WPM**、**WASPAS** — 加重和モデル、加重積モデル、加重集約和積評価）、理想解への距離（**TOPSIS**、Technique for Order of Preference by Similarity to Ideal Solution）、妥協計画法（**VIKOR**、多基準最適化と妥協解を意味するセルビア語から）、アウトランキング（**PROMETHEE II**、Preference Ranking Organization Method for Enrichment of Evaluations、**ELECTRE I**、現実を表す除去と選択を意味するフランス語から）、さらに比率システムの **MOORA**（Multi-Objective Optimization on the basis of Ratio Analysis）と比例型の **COPRAS**（Complex Proportional Assessment） — **AHP**（階層分析法）の一対比較による優先度の重み付け（整合比）、**パレート** の非劣解フロント、重みの **感度** 分析、多属性 **効用** のスコアリングを備えます。9 つの集約器は、独立したサードパーティのライブラリ **pymcdm**（WSM / WPM / WASPAS / MOORA / TOPSIS / VIKOR / PROMETHEE II）と **pyDecision**（ELECTRE I、COPRAS）を **< 1e-9** で再現し、AHP の優先度ベクトル + 整合比は Saaty のランダム指数の表と SciPy/LAPACK の主固有値ソルバーに < 1e-9 で一致します（`tests/mcda_*_reference.rs`）。**VALIDATED** — トレードスタディエンジンの下にある意思決定の層です。 |
| **宇宙環境** | **宇宙天気の環境モデル**（`space-weather`、`src/space_weather.rs`）：太陽（F10.7 / 中心 81 日平均の F10.7a — 10.7 cm の太陽電波フラックス）と地磁気（Kp、惑星 K 指数と、定義による Kp↔ap の表 — ap はその線形の惑星振幅）の活動指数、それらが駆動する **Jacchia-1971** の外圏温度（公表された太陽活動の極小/平均/極大に対して検証済み）、そして高度における活動補正済みと静的な熱圏中性密度の比較 — 静的な USSA76（US Standard Atmosphere 1976）大気が省いている太陽周期による密度の依存性です。**MODELLED**：キャリブレーションした一次のスケールハイトの結合であり、データで検証された（NRLMSISE — 米国海軍研究所の Mass Spectrometer and Incoherent Scatter Radar Exosphere モデル）大気では**ありません**。 |
| **AI/ML の評価とトレード** | **RF 障害検出の評価テストベッド**（`impairment-eval`、`src/impairment_eval.rs`）：ラベル付きでパラメーターに基づく **合成** コーパス（nominal / jamming / spoof-time / spoof-position / multipath）、任意の検出器（energy \| agc \| sqm \| parity \| fused）を、目標の Pfa（誤警報確率）におけるクラスごとの Pd（検出確率）でスコアリングする、検出器に依存しない **ROC/AUC**（受信者動作特性 / 曲線下面積）のハーネス、そして分布内と分布外の **楽観ギャップ**（分布シフトモード）。さらに **量子と古典の PNT のトレード**（`quantum-trade`、`src/quantum_trade.rs`）は、候補の時計のタイミング/慣性のホールドオーバーの利点を、**実測 ADEV** の曲線から古典的なベースラインと比較して定量化します。長 τ の下限に関する注意書きを成果物に添え、GNSS 拒否下のレジリエンスの時間に対するエンベロープを示します。評価 **指標**（AUC / 混同行列 / Pd-Pmd、Pmd は見逃し確率）は **scikit-learn 1.9.0 に対して完全一致で検証済み** です — **実際の ESA OPS-SAT のテレメトリー**（OPSSAT-AD 異常検知データセット、Ruszczak et al. 2025、CC BY 4.0 — Creative Commons Attribution 4.0）でも検証しており、Kshana の Mann–Whitney の ROC AUC は、保留したテスト分割で scikit-learn の `roc_auc_score` を < 1e-9 で再現し、透明なピークカウント検出器はラベル付きの異常を AUC ≈ 0.85 で分離します（`tests/opssat_ad_reference.rs`）— そしてトレードエンジンの数値 **カーネル**（ADEV の NNLS — 非負最小二乗 — フィット、χ² の整合性帯域、van-Loan の時計の Q）は **scipy 1.17.1 に対して** 検証済みです。その上に構築した機器の利点の数値は **MODELLED** の動作特性のままです — フィールドデータや IQ（同相/直交のサンプル）データは使っておらず、良否の判定もありません。このテストベッドを土台に、より深い **楽観ギャップの検討**（`src/impairment_study.rs`、`impairment_ml.rs`、`eval_stats.rs`）は、**13 の検出器** のパネル（energy/AGC/SQM/parity に加え、シード付きのロジスティック回帰と 1 隠れ層の MLP — 多層パーセプトロン — の検出器）をスコアリングし、分布内と分布外の **スケーリング則** を並べ替えによる帰無分布とともにフィットし、分布内の統計量から分布外での劣化を予測する **leave-one-out の予測器** を学習します（`cargo run --example optimism_study`）。**ソフトウェア無線受信機のフロントエンド**（`src/sdr.rs` — 生の IQ/IF（中間周波数）→ 相関器の early/prompt/late のタップ → SQM）と **実データの取り込みアダプター**（`src/realdata/` — RINEX、u-blox UBX（u-blox のバイナリプロトコル）、GnssLogger、JammerTest、Yunnan、SatGrid）により、同じ検出器をローカルに用意した記録に対して実行できます（データセットはコミットしていません）。パラメーターの不確かさの下での **量子と古典のレジリエンスのクロスオーバーマップ**（`src/crossover.rs`、`cargo run --bin crossover_study`）は、Results の図の背後にある慣性と時計のクロスオーバーの検討を再生成します。 |
| **量子を活用した PNT のデモンストレーター** | オープンなエンジンの背後にある 3 つの実行可能な **MODELLED** の応用分野で、それぞれ正直な `TradeEvidence` + 代表性 / フライトまでのギャップの記録（`src/representativeness.rs`）を出力します：**信頼できる量子時刻転送**（`quantum-time-transfer`、`src/timetransfer_chain.rs` — 光格子時計 + フォトニックリンクと、CSAC（チップスケール原子時計）+ RF 双方向とのエンドツーエンドのバジェット比較で、再利用したタイミング保護レベル、遅延/リプレイ攻撃に対するセキュリティ FoM（1 − P_md）、時計の異常検出 + CUSUM の遅延を伴う）。**GNSS を使わない量子航法**（`quantum-gnss-free-nav`、`src/quantum_nav_od.rs` — GNSS の途絶中の冷却原子干渉計による慣性コーストと航法グレードの INS の比較で、外部の測位がなければ加速度計のバイアスは観測できず誤差は依然として増大することを正直に示します）。そして量子システムの **故障/異常検出**（`quantum-anomaly-detect`、`src/quantum_faults.rs` — 外部検証済みの `eval_stats` によるブートストラップ CI（信頼区間）付きの ROC AUC と、固定した誤警報率における最小検出可能故障を伴う、ラベル付きの故障カタログ）。共有の **量子デバイス誤差モデルのライブラリ**（`src/quantum_devices.rs`）と統一された **量子と古典のトレードハーネス**（`src/qtrade.rs`）がこれらを支えます。これらが依拠する検証済みのカーネル（scikit-learn に対する評価指標、scipy に対するトレードカーネル）は再利用しています。その上に構築した機器の利点の数値は **MODELLED** のままです — **例示用の公開ソース** の機器/リンクのパラメーターであり、*クラス* をモデル化しており、TRL / フライト実績 / 認証も、機関による承認もありません。 |
| **フルーガルエンジニアリングとインテグリティへの影響** | **カバレッジあたりのコストの ROI**（投資収益率）の視点（`src/frugal.rs`）— アーキテクチャのトレードにおける、提供されるカバレッジの単位あたりのコスト — と、モニターの見逃し率をインテグリティリスクへの寄与に変換する **検出の見逃し → インテグリティへの影響** の対応付け（`src/integrity_impact.rs`）。**MODELLED** の意思決定支援のバジェットであり、加法的です。 |
| **成果物の交換** | **Kshana Interchange Format（KIF）**（`src/interchange.rs`）— シナリオの結果を、その種別、スキーマのバージョン、MODELLED/VALIDATED のラベルとともに包む、バージョン付きで自己記述的なエンベロープ。保存した成果物が自己文書化された状態を保ち、古いエンベロープも前方互換で読み取れます。 |

各機能は、Rust の API、実行可能なシナリオの `kind`、またはその両方として利用できます。
機能ごとの成熟度 — *validated*、*runnable*、*library* — は
[`docs/CAPABILITY.md`](docs/CAPABILITY.md) で管理しています。**機械的に検査される検証マトリクス**
（`src/verification.rs`）は、要求 → モジュール → テスト → オラクル → ステータス の
相互参照を出力し、独立した **外部の** オラクルが裏付ける場合にのみ *validated* のラベルを許す、
ユニットテスト済みの誠実さの不変条件を備えます — そして Kshana が意図的に提供**しない**
ハードウェア/PA（製品保証）の機能も記録します。

</details>

<details>
<summary>4 つのセンサーパック（最初に公開したときのもの、結果）</summary>

### 結果

各シナリオは、約 1.8 h の GNSS 途絶を通じて、量子センサーをそれに対応する古典センサーと
比較します。数値は再現可能です（`scenario + seed + version`）。

<p align="center">
  <img src="docs/assets/figures/scenario-fom.png" alt="GNSS が失われたときに量子センサーがもたらすもの、時計ホールドオーバーのシナリオ：量子は 6600 s の自律性を保ち、古典は 2610 s。タイミング誤差ははるかに小さく、可用性は 100% 対 95.6%" width="88%">
  <br><sub>GNSS が失われたときに量子センサーがもたらすもの — <code>clock-holdover</code> · シード 42 · エンジン 0.40.0 で描画。上のすべての数値は、ビルドごとに <code>tests/published_figures_still_reproduce.rs</code> によって現在のエンジンに対して再確認されます · <a href="docs/assets/figures/scenario-fom.svg">SVG</a></sub>
</p>

この優位性は **途絶の長さと振動に依存** し、古典が勝る明示的な損益分岐点があります — 技術成熟度のはしごにわたって正直に示しています（光時計の数値は地上デモンストレーターの目標値であり、ストロンチウム光時計が飛行したことはありません）：

<p align="center">
  <img src="paper/crossover/clock.png" alt="技術成熟度のはしごにわたる量子と古典の時計ホールドオーバーのクロスオーバー（信頼帯付き）" width="62%">
  <br>
  <img src="paper/crossover/inertial.png" alt="途絶の長さと振動に対する量子と古典の慣性の優位性のヒートマップ。古典が勝る損益分岐の等高線付き" width="96%">
  <br><sub>量子と古典のレジリエンスのクロスオーバー — 時計ホールドオーバーの TRL のはしご（上）· 損益分岐の等高線付きの慣性の優位性マップ（下）。<code>cargo run --release --bin crossover_study</code> で再生成できます。</sub>
</p>

<p align="center">
  <img src="docs/assets/inertial-deadreckoning.svg" alt="慣性による推測航法：GNSS 途絶中の位置誤差 — 量子（冷却原子）センサーは仕様線の近くにとどまり、航法グレードのセンサーは数十キロメートルまで発散します" width="80%">
  <br><em>GNSS 途絶中の推測航法の位置誤差：量子センサー（青）は
  仕様の近くで平坦にとどまり、古典センサー（赤）は数十キロメートルまで発散します。
  Kshana が <code>scenarios/imu-deadreckoning.toml</code> から生成。</em>
</p>

| パック | シナリオ | 量子 | 古典 |
|------|----------|---------|-----------|
| **1 — 時計のホールドオーバー** | `clock-holdover.toml`（20 ns の仕様） | 光時計は途絶の全期間を保持 | CSAC は途絶の途中で仕様を超過 |
| **2 — 慣性による推測航法** | `imu-deadreckoning.toml`（100 m の仕様） | 冷却原子：**約 41 m**、途絶の全期間を保持 | 航法グレード：**約 350 s** で超過 → 数十 km |
| **3 — 時刻転送**（光衛星間リンク） | `timetransfer.toml` | 光：**約 0.3 mm** の測距 | RF（TWSTFT）：**約 150 mm** の測距 |
| **4 — ハイブリッド融合**（総仕上げ） | `hybrid-pnt.toml` | 途絶の全期間で位置とタイミングを完全に維持 | **約 350 s で位置が制約される** |

総仕上げのパックは融合の主張を示します：光衛星間の時刻転送は古典的な *時計* さえも
ロックした状態に保ち、古典的なスイートの弱いリンクとして *慣性* センサーを
浮き彫りにします — つまり、量子慣性と光タイミングの組み合わせです。

<p align="center">
  <img src="docs/assets/clock-holdover.svg" alt="時計のホールドオーバー：GNSS 途絶中の位相誤差 — 光時計は途絶の全期間にわたって 20 ns の仕様内にとどまり、チップスケール時計は途絶の途中で仕様を超過します" width="80%">
  <br><em>GNSS 途絶を通じた時計のホールドオーバー：光時計（青）はコーストの全期間にわたって
  20 ns の仕様内にとどまり、チップスケール時計（赤）は途中で仕様を超過します。
  Kshana が <code>scenarios/clock-holdover.toml</code> から生成。</em>
</p>

さらに別のシナリオ `orbit-gnss-challenged.toml` は、GNSS の可用性を手で書いたウィンドウではなく
**軌道の幾何配置** から導出します：GNSS のシェルの内側にある宇宙機を GPS 型の
Walker コンステレーションに対して伝搬し、可視衛星数（見通し線、地球による掩蔽、
仰角マスク）が各ステップの測位状態を決めます。1 日を通して利用者が測位できているのは時間の約 59% だけです。量子時計は
すべてのギャップを通じて 5 ns のタイミング解を保ち（可用性 **1.0**）、チップスケール時計は
**約 0.83** にとどまります。

<p align="center">
  <img src="docs/assets/orbit-gnss-challenged.svg" alt="GNSS 条件の厳しい軌道：GNSS のシェルの内側にある宇宙機の 1 日にわたる時計のタイミング誤差。カバレッジのギャップは軌道の幾何配置から導出 — 光時計はギャップをまたいで 5 ns の仕様内にとどまり、チップスケール時計は仕様を超過します" width="80%">
  <br><em>軌道の幾何配置から導出した GNSS の可用性の下での 1 日にわたるタイミング誤差：
  可視衛星数（見通し線、地球による掩蔽、仰角マスク）が各ステップの測位
  状態を決めるため、時計はすべてのギャップをコーストしなければなりません — 光時計は 5 ns の
  仕様を保ち、チップスケール時計は仕様を超過します。Kshana が
  <code>scenarios/orbit-gnss-challenged.toml</code> から生成。</em>
</p>

コンステレーションは、実際の 2 行軌道要素（TLE）として与えることもできます。*完全な* TLE
（1 行目 + 2 行目）は完全な **SGP4/SDP4** モデルで伝搬されます — 大気抵抗と、
約 12 h の GNSS 軌道にとって重要な深宇宙の月・太陽の項と 12 h / 24 h の共鳴項を含みます —
公式の AIAA 2006-6753 のベクトルに対して最悪ケース ≈ 4 mm で検証済みです。`scenarios/orbit-sgp4-gps.toml` は、
運用中の GPS コンステレーション（2021-07-28、30 機）の **実際の Celestrak
`gps-ops` スナップショット** を同梱し、有効な TLE のチェックサムを要求します — 2 行軌道要素は、米国
宇宙軍 / 第 18 宇宙防衛飛行隊のカタログによるオープンデータで、Celestrak が再配布しています
（Dr T. S. Kelso、[celestrak.org](https://celestrak.org)）。更新は
`scripts/fetch_tles.sh` で行います。2 行目のみのブロックは
解析的な二体伝搬を使います（`scenarios/orbit-real-tle.toml`）。2 つの形式は
1 つのコンステレーション内で混在できます。コンステレーションは同様に、
**RINEX-3 の GPS 放送エフェメリス** のレコードのブロック — 受信機がデコードする形式 — からも構築でき、
IS-GPS-200 の利用者アルゴリズムで伝搬して同じ幾何配置の処理に入力します
（`scenarios/orbit-rinex.toml`）。

</details>

<details>
<summary>Kshana であるもの / ないもの（全文）</summary>

<a id="what-it-is--is-not"></a>
### Kshana であるもの / ないもの

**Kshana であるもの：** PNT スタック全体 — 軌道の幾何配置、慣性航法、GNSS/INS の融合、インテグリティ、
時計、タイミング — にまたがる、決定論的で依存関係の少ないエンジンです。
シナリオ（多くの場合 GNSS の途絶）を実行し、キャリブレーションしたセンサー誤差モデルを
適切な推定器を通じて発展させ、その結果を運用上の
性能指標に対してスコアリングします — 再現可能な JSON（JavaScript Object Notation）の結果と SVG のチャートを、
Rust ライブラリ、コマンドラインインターフェース（CLI）、Python 拡張、ブラウザー内の WebAssembly モジュール、
AI エージェント向けの **Model Context Protocol（MCP）サーバー**、または **JetBrains IDE（統合
開発環境）プラグイン** から出力します。

**Kshana でないもの：** フライトハードウェア、量子ペイロードの設計、完全な GNSS 信号
受信機、無線周波数（RF）信号シミュレーターやハードウェア・イン・ザ・ループの装置、
認証されたアビオニクス製品ではありません — また、MATLAB/Simulink、STK（Systems Tool
Kit）、Orekit を置き換えるものでもなく、それらの隣に位置してファイルをやり取りします。量子ハードウェアの忠実度は
公表された誤差モデルに由来するものであり、このツールに由来するものではありません。各
機能の詳細な成熟度は [`docs/CAPABILITY.md`](docs/CAPABILITY.md) に記載しています。

**Kshana で（まだ）ないもの：** *完全な* 原子干渉の物理エンジン（ほとんどの量子センサーは
公表された Allan/雑音バジェットの係数を使います。CAI（冷却原子干渉計）加速度計には
第一原理の層 — Mach–Zehnder 位相、射影雑音、コントラストの減衰、
振動の結合、さらにコリオリと光シフトの系統誤差 — がありますが、波面の系統誤差と
フリンジのアンビギュイティの解決は **P2**（ロードマップのフェーズ 2、量子物理の層）の
ロードマップの層に残っています。[`ROADMAP.md`](ROADMAP.md) と [`docs/QUANTUM-MODELS.md`](docs/QUANTUM-MODELS.md) を参照）。
認証された受信機やハードウェアの GNSS 受信機（実際の RINEX（Receiver Independent Exchange Format）のコード観測から単独の **PVT**（位置、速度、時刻）の測位
を解き — 実際の IGS（International GNSS Service）のデータで
検証済み — その IQ 層（`kshana iq`、0.31.0 以降）は、記録または生成したベースバンドのサンプルをソフトウェアで捕捉・追尾する
解析用受信機です：無線ハードウェアを駆動せず、送信せず、認証された受信機でもなく、
搬送波位相による測位（RTK や PPP）も行いません）。あるいは完全なミッション設計スイート（Lambert / ポークチョップ /
マヌーバ / 軌道決定の構成要素はありますが、GMAT（General Mission Analysis Tool）/Orekit の *上に* 位置する
性能シミュレーションの層であり、置き換えではありません）。この範囲を自ら引き受けるのは意図的です。第一原理の冷却原子
干渉計の誤差バジェット（例えば CARIOQA-PMP 級 — Cold Atom Rubidium Interferometry
in Orbit for Quantum Accelerometry, Pathfinder Mission Preparation — や X-37B 型の検証）が必要な場合は、
P2 のロードマップを参照し、協力のために[お問い合わせください](#support--professional-services)。

</details>

### 低軌道の航法

低軌道（LEO）の衛星は速く通過し、信号が強力です。`leo-pnt-chain` 種別は 1 つの
システムをすべての段階にわたって追跡します：信号、パスとそのリンク、航法メッセージ、
そして融合した位置・速度・時刻（PVT）の測位と精密単独測位（PPP）。各
段階は自分の数値を次の段階に引き渡します。[`docs/LEO-PNT.md`](docs/LEO-PNT.md) を参照してください。

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/assets/readme/flow-leo-chain-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/assets/readme/flow-leo-chain-light.svg">
  <img src="docs/assets/readme/flow-leo-chain-light.svg" alt="leo-pnt-chain の実際の実行（leo-pnt-end-to-end.toml）による LEO PNT のチェーン：信号の段階（1191.795 MHz の generic-l、パイロットを 10.23 Mchip/s で追尾）はパスの段階（1080 km、追尾した C/N0 のピーク 58.2 dB-Hz）に引き渡し、パスの段階は航法メッセージ（kepler-rac、300 s のフィット、表現の SISRE 0.91 mm RMS、軌道決定を含めて 0.250 m）に引き渡し、航法メッセージは融合した測位（GNSS のみで 3D 1.60 m RMS、GNSS と LEO で 0.43 m）と精密単独測位（収束時間は GNSS のみで 11.5 min、LEO 衛星 240 機で 7.5 min）に入力されます。段階間で 11 の値が引き渡されます。" width="100%">
</picture>

<a id="every-scenario-kind-by-family"></a>
### ファミリー別の全シナリオ種別

エンジンのシナリオ種別をファミリーごとに分類したものです。各ファミリーには、種別ごとに 1 つの項目（
エンジンの説明とフィールド、コマンドの例、実行からの主要な数値、それを名指しする
[検証マトリクス](docs/VERIFICATION-MATRIX.md)の行、エンジン自身が書き出すチャート）を持つページと、
それらのチャートの一覧シートがあります。[`docs/KINDS.md`](docs/KINDS.md) がそれらすべての索引です。表は
[`tools/gen_readme_blocks.py`](tools/gen_readme_blocks.py) が、ページは
[`tools/gen_kinds_index.py`](tools/gen_kinds_index.py) が書き出し、エンジンにどのファミリーにも属さない種別が加わった場合はどちらも失敗します。

<!-- generated:kind-families -->
| ファミリー | 答える問い | 種別 | 実行例 |
|---|---|---|---|
| **[時計、タイミング、ホールドオーバー](docs/kinds/clocks-timing-and-holdover.md)** | GNSS なしで時計がどれだけの時間時刻を保てるか、そしてタイミングシステムがそのマスクに対してどれだけ持ちこたえるか | [`clock`](docs/kinds/by-kind/clock.md), [`sweep`](docs/kinds/by-kind/sweep.md), [`sweep-nd`](docs/kinds/by-kind/sweep-nd.md), [`telecom-timing`](docs/kinds/by-kind/telecom-timing.md), [`slot-timing`](docs/kinds/by-kind/slot-timing.md), [`timetransfer`](docs/kinds/by-kind/timetransfer.md), [`time-transfer-budget`](docs/kinds/by-kind/time-transfer-budget.md), [`holdover-test`](docs/kinds/by-kind/holdover-test.md), [`quantum-time-transfer`](docs/kinds/by-kind/quantum-time-transfer.md) | `kshana scenarios/clock-holdover.toml` |
| **[慣性、融合、量子センサー](docs/kinds/inertial-fusion-and-quantum-sensors.md)** | 古典センサーと量子センサーによる、GNSS 途絶中の推測航法とセンサー融合 | [`inertial`](docs/kinds/by-kind/inertial.md), [`hybrid`](docs/kinds/by-kind/hybrid.md), [`fusion`](docs/kinds/by-kind/fusion.md), [`hybrid-ukf`](docs/kinds/by-kind/hybrid-ukf.md), [`gnss-ins`](docs/kinds/by-kind/gnss-ins.md), [`ins-trn-coast`](docs/kinds/by-kind/ins-trn-coast.md), [`quantum-gnss-free-nav`](docs/kinds/by-kind/quantum-gnss-free-nav.md), [`quantum-anomaly-detect`](docs/kinds/by-kind/quantum-anomaly-detect.md), [`quantum-trade`](docs/kinds/by-kind/quantum-trade.md) | `kshana scenarios/gnss-ins.toml` |
| **[GPS 拒否下の代替 PNT](docs/kinds/gps-denied-alternative-pnt.md)** | GNSS が失われたときに、重力、地形、その他の場から航法すること | [`gravity-map`](docs/kinds/by-kind/gravity-map.md), [`terrain-nav`](docs/kinds/by-kind/terrain-nav.md), [`terrain-slam`](docs/kinds/by-kind/terrain-slam.md), [`combined-altpnt`](docs/kinds/by-kind/combined-altpnt.md), [`conflict-resilience`](docs/kinds/by-kind/conflict-resilience.md) | `kshana scenarios/combined-altpnt.toml` |
| **[コンステレーション、カバレッジ、幾何配置](docs/kinds/constellations-coverage-and-geometry.md)** | 地球、月、火星の周りで、衛星がどこにあり、誰がそれを見て、幾何配置がどれだけ良いか | [`orbit`](docs/kinds/by-kind/orbit.md), [`ephemeris`](docs/kinds/by-kind/ephemeris.md), [`constellation-design`](docs/kinds/by-kind/constellation-design.md), [`solar-system`](docs/kinds/by-kind/solar-system.md), [`body-pnt`](docs/kinds/by-kind/body-pnt.md), [`mars-pnt`](docs/kinds/by-kind/mars-pnt.md), [`passes`](docs/kinds/by-kind/passes.md) | `kshana scenarios/orbit-gnss-challenged.toml` |
| **[GNSS の測定、測位、インテグリティ](docs/kinds/gnss-measurements-positioning-and-integrity.md)** | 擬似距離、位置の測位、保護レベル、宇宙環境 | [`integrity`](docs/kinds/by-kind/integrity.md), [`gnss-sim`](docs/kinds/by-kind/gnss-sim.md), [`pvt`](docs/kinds/by-kind/pvt.md), [`araim-reference-check`](docs/kinds/by-kind/araim-reference-check.md), [`space-weather`](docs/kinds/by-kind/space-weather.md), [`realtime-frame-eop`](docs/kinds/by-kind/realtime-frame-eop.md) | `kshana scenarios/integrity-raim.toml` |
| **[ジャミング、スプーフィング、スペクトル](docs/kinds/jamming-spoofing-and-the-spectrum.md)** | 干渉がどのように受信機に届き、それが検出されるかどうか | [`jamming`](docs/kinds/by-kind/jamming.md), [`spoof`](docs/kinds/by-kind/spoof.md), [`spoof-detect`](docs/kinds/by-kind/spoof-detect.md), [`tracking-loop`](docs/kinds/by-kind/tracking-loop.md), [`spectrum`](docs/kinds/by-kind/spectrum.md), [`impairment-eval`](docs/kinds/by-kind/impairment-eval.md) | `kshana scenarios/jamming-demo.toml` |
| **[低軌道の航法](docs/kinds/low-earth-orbit-navigation.md)** | パス、リンク、航法メッセージ、融合した測位を段階ごとに | [`leo-signal`](docs/kinds/by-kind/leo-signal.md), [`leo-pass`](docs/kinds/by-kind/leo-pass.md), [`leo-navmsg`](docs/kinds/by-kind/leo-navmsg.md), [`leo-pvt`](docs/kinds/by-kind/leo-pvt.md), [`leo-ppp`](docs/kinds/by-kind/leo-ppp.md), [`ntn-positioning`](docs/kinds/by-kind/ntn-positioning.md), [`leo-pnt-chain`](docs/kinds/by-kind/leo-pnt-chain.md) | `kshana scenarios/leo-pnt-end-to-end.toml` |
| **[月とシスルナ](docs/kinds/lunar-and-cislunar.md)** | 月における航法、時刻、座標系、測地 | [`lunar-integrity`](docs/kinds/by-kind/lunar-integrity.md), [`lunar-time-offset`](docs/kinds/by-kind/lunar-time-offset.md), [`lunar-time-budget`](docs/kinds/by-kind/lunar-time-budget.md), [`lunar-ascent`](docs/kinds/by-kind/lunar-ascent.md), [`lunar-surface`](docs/kinds/by-kind/lunar-surface.md), [`lunar-descent`](docs/kinds/by-kind/lunar-descent.md), [`lunar-orbit-rendezvous`](docs/kinds/by-kind/lunar-orbit-rendezvous.md), [`lunar-vlbi`](docs/kinds/by-kind/lunar-vlbi.md), [`lunar-vlbi-fim`](docs/kinds/by-kind/lunar-vlbi-fim.md), [`lunar-joint-od-clock`](docs/kinds/by-kind/lunar-joint-od-clock.md), [`lunar-frame-realisation`](docs/kinds/by-kind/lunar-frame-realisation.md), [`lunar-frame-campaign`](docs/kinds/by-kind/lunar-frame-campaign.md), [`lunar-llr-datum`](docs/kinds/by-kind/lunar-llr-datum.md), [`moonlight-service-volume`](docs/kinds/by-kind/moonlight-service-volume.md), [`lunar-differential-pnt`](docs/kinds/by-kind/lunar-differential-pnt.md), [`lunar-station-coverage`](docs/kinds/by-kind/lunar-station-coverage.md), [`lunar-beacon`](docs/kinds/by-kind/lunar-beacon.md), [`lunar-interop-export`](docs/kinds/by-kind/lunar-interop-export.md), [`cislunar-observability`](docs/kinds/by-kind/cislunar-observability.md), [`cislunar-arc-recovery`](docs/kinds/by-kind/cislunar-arc-recovery.md), [`lunar-attack-surface`](docs/kinds/by-kind/lunar-attack-surface.md), [`lunar-jamming`](docs/kinds/by-kind/lunar-jamming.md), [`earth-gnss-lunar`](docs/kinds/by-kind/earth-gnss-lunar.md), [`lunar-infrastructure`](docs/kinds/by-kind/lunar-infrastructure.md) | `kshana scenarios/lunar-infrastructure-od-consistency.toml` |
| **[宇宙利用者の航法](docs/kinds/space-user-navigation.md)** | GNSS の軌道の上空、周辺、その先にある宇宙機のための GNSS 信号 | [`gnss-ssv`](docs/kinds/by-kind/gnss-ssv.md) | `kshana scenarios/gnss-ssv-shell.toml` |
| **[光 PNT](docs/kinds/optical-pnt.md)** | 大気を通る光リンクと、光と RF を組み合わせた性能指標 | [`optical-atmosphere`](docs/kinds/by-kind/optical-atmosphere.md), [`hybrid-optical-rf`](docs/kinds/by-kind/hybrid-optical-rf.md) | `kshana scenarios/optical-atmosphere-network.toml` |
| **[ミッション解析、リンク、宇宙運用](docs/kinds/mission-analysis-links-and-space-operations.md)** | 打ち上げ、上昇、突入、姿勢、リンク、コンタクト計画、ファイル形式 | [`launch-window`](docs/kinds/by-kind/launch-window.md), [`ascent-losses`](docs/kinds/by-kind/ascent-losses.md), [`reentry`](docs/kinds/by-kind/reentry.md), [`entry-heating`](docs/kinds/by-kind/entry-heating.md), [`eo-coverage`](docs/kinds/by-kind/eo-coverage.md), [`eo-radiometry`](docs/kinds/by-kind/eo-radiometry.md), [`attitude-budget`](docs/kinds/by-kind/attitude-budget.md), [`aocs`](docs/kinds/by-kind/aocs.md), [`link-budget`](docs/kinds/by-kind/link-budget.md), [`acm-link`](docs/kinds/by-kind/acm-link.md), [`contact-schedule`](docs/kinds/by-kind/contact-schedule.md), [`aperture-duty-cycle`](docs/kinds/by-kind/aperture-duty-cycle.md), [`space-packet`](docs/kinds/by-kind/space-packet.md), [`oem-interop`](docs/kinds/by-kind/oem-interop.md) | `kshana scenarios/launch-window.toml` |
| **[ミッションスレッド](docs/kinds/mission-threads.md)** | 打ち上げから突入までの一連のフェーズにおける航法とタイミングの誤差バジェット | [`mission-thread`](docs/kinds/by-kind/mission-thread.md) | `kshana scenarios/mission-thread-artemis-class.toml` |
| **[キャンペーン](docs/kinds/campaigns.md)** | 他の種別から構築した連鎖ミッション、スイープ、アンサンブル | [`campaign`](docs/kinds/by-kind/campaign.md) | `kshana scenarios/campaign-jam-spoof-holdover-integrity.toml` |
<!-- /generated:kind-families -->

<a id="every-command"></a>
### 全コマンド

`kshana <scenario.toml>` はシナリオを実行します。それ以外のコマンドはすべてサブコマンドであり、`kshana --help` で
すべての使い方を表示します。コマンドは `--study`、`--validate`、`kinds`、`example`、`receiver-trust`（`live` と
`evidence` を含む）、`evidence`（`keygen`、`verify`、`attach-timestamp`、`round-trip`）、`jammertest`（`import`、`score`）、
`trust-telemetry`、`imu-fit`、`nmea-scenario`、`interference-map`（`adsb`、`ais`、`daily`、`sensitivity`、
`fetch-land`）、`route-exposure`、`bench`（`spec`、`truth`、`cases`、`score`、`baseline`、`seal`、`reveal-check`、
`manifest`、`verify-manifest`、`validate`、`leaderboard`）、`bench-export`、`compliance-report`、
`lunanet-afs-check`、`standards-pack`、`partner`（`check`）、`osnma`、`iq`（`scene`、`acquire`、`track`、`sweep`、`labfit`、`campaign`、
`conditions`、`frontend`、`monitor`、`inventory`、`info`、`extract`、`convert`、`decimate`）、`sky`、`skyline` です。
[`docs/COMMANDS.md`](docs/COMMANDS.md) に、それぞれの目的、確認済みの例、ドキュメントページを記載しています。

<a id="every-surface"></a>
### 全サーフェス

1 つのエンジンで、どこでも同じ結果が得られます：コマンドライン、Rust ライブラリ、Python、JavaScript と WebAssembly、
プラグインのコマンドとスキルを備えた MCP サーバー、Kshana Studio（すべてのページがブラウザー内で動作し、インストール不要、何もアップロードされません）、
ROS 2、Signal K、OpenCPN、GNSS-SDR、`gnss_lib_py` との統合、systemd、Docker、Grafana のデプロイキット、そして
JetBrains プラグイン。[`docs/ALL-SURFACES.md`](docs/ALL-SURFACES.md) に、それぞれの入手方法と、すべての
プラグインコマンド、スキル、Studio のページの名前を記載しています。[`docs/SURFACES.md`](docs/SURFACES.md) には、すべてのコマンドと種別について、
どのサーフェスが対応し、どれが対応していないかを理由とともに記載しています。

<a id="how-a-run-works"></a>
## 実行の仕組み

シナリオは TOML（Tom's Obvious, Minimal Language）ファイルです：種別、シード、
パラメーター。エンジンはそれを実行し、結果、チャート、レポートをその横に書き出し、
要求したエクスポートも書き出します。

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/assets/readme/flow-pipeline-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/assets/readme/flow-pipeline-light.svg">
  <img src="docs/assets/readme/flow-pipeline-light.svg" alt="実行の流れ。シナリオの TOML ファイル（種別、シード、そのパラメーター）がエンジン kshana 0.40.0 に入り、92 のシナリオ種別にわたる api::run_toml のディスパッチを通ります。結果はシナリオ、シード、エンジンのバージョンから決定論的に決まります。エンジンは result.json、chart.svg、report.html、report.json を書き出し、表を定義する種別では table.csv を、要求に応じて SP3、CCSDS OMM と OEM、CZML、KML、GeoJSON、STK、SigMF のエクスポートを書き出します。スイートは study.json と study.html を書き出します。これらのファイルは、ブラウザー内の Kshana Studio、kshana-mcp サーバーを介した AI アシスタント、継続的インテグレーションに入力されます。" width="100%">
</picture>

この同梱のシナリオは 2 h 実行します：10 min の GNSS の後、約 1.8 h の GNSS 拒否です。
ストロンチウム光格子時計とチップスケール原子時計（CSAC）が、それぞれどれだけの時間
20 ns 以内に時刻を保てるかを問います。

```bash
kshana example clock-holdover > clock-holdover.toml
kshana clock-holdover.toml
```

```text
scenario 5ba83a232b94 | quantum holdover 6600s p95 1.20e-4ns integrity 1.000 security n/a (no attack) | classical holdover 2610s p95 19.7ns integrity 1.000 security n/a (no attack)
wrote clock-holdover.result.json, clock-holdover.chart.svg, clock-holdover.report.html, and clock-holdover.report.json
```

光時計は 6600 s の途絶の全期間にわたって 20 ns のバジェットを保ちます。CSAC は
2610 s 保ち、実行の 95.6% でバジェット内にあります（光時計は 100%）。
`kshana example` は同梱のすべてのシナリオを一覧表示します。

<a id="missions"></a>
## ミッション

10 の分野が、同じエンジンに 10 の異なる問いを投げかけます。それぞれに、出発点となる同梱のシナリオが
あります。

| 分野 | 最初に試すもの |
|---|---|
| 防衛と安全保障 | `campaign-jam-spoof-holdover-integrity`、`spoof-meaconing` |
| 宇宙、地球周回軌道 | `orbit-gnss-challenged`、`leo-pnt-end-to-end` |
| 月、火星、深宇宙 | `lunar-relay-constellation`、`mars-orbit-pnt` |
| 航空とドローン | `small-uas-jammed-nav`、`araim-gps-galileo` |
| 海事 | `maritime-strait-jamming`、`maritime-port-approach-coast` |
| 道路 | `automotive-urban-canyon` |
| 鉄道 | `rail-tunnel-coast` |
| 重要インフラとタイミング | `clock-holdover`、`clock-ensemble` |
| 通信と 5G（第 5 世代移動通信ネットワーク） | `telecom-prtc-holdover-24h`、`leo-vertical-5g-network-timing` |
| 科学と研究 | `sweep-clock-stability`、`quantum-pnt-demonstrator.suite` |

<details>
<summary>各分野が投げかける問い</summary>

<br>

| 分野 | 投げかける問い | 最初に試すもの |
|---|---|---|
| **防衛と安全保障** | ジャミングとスプーフィングの下で、航法とタイミングはどれだけの時間信頼できる状態を保ち、どの層が仕様内にとどめてくれるか？ | `campaign-jam-spoof-holdover-integrity`、`spoof-meaconing` |
| **宇宙：地球周回軌道** | 宇宙機は十分な航法衛星を見ることができるか、測位の合間に時計はどれだけの時間時刻を保てるか、そして低軌道の航法層は何を加えるか？ | `orbit-gnss-challenged`、`leo-pnt-end-to-end` |
| **月と深宇宙** | 月、火星、あるいはさらに遠くにある着陸機、ローバー、オービターは、信頼できる位置と時刻を得られるか？ | `lunar-relay-constellation`、`mars-orbit-pnt` |
| **航空とドローン** | ジャマーによって GNSS が失われた後、無人航空機システム（UAS）はどれだけの時間位置のバジェット内にとどまり、ルート上でインテグリティは利用可能か？ | `small-uas-jammed-nav`、`araim-gps-galileo` |
| **海事** | ジャマーは水上でどこまで届くか、位置の押し出しは捕捉されるか、そして船はどれだけの時間コーストして港に入れるか？ | `maritime-strait-jamming`、`maritime-spoof-position-push`、`maritime-port-approach-coast` |
| **道路と自動車** | 高架の下や道路脇のジャマーのそばを通過するとき、車はどれだけドリフトするか？ | `automotive-urban-canyon` |
| **鉄道** | トンネルに入って何秒まで、列車はどの線路にいるかを判別できるか？ | `rail-tunnel-coast` |
| **重要インフラとタイミング** | GNSS の時刻が失われたりスプーフィングされたりした場合、電力網、取引所、データセンターはどれだけの時間トレーサブルな時刻を保てるか？ | `clock-holdover`、`clock-ensemble` |
| **通信と 5G** | GNSS の時刻基準が失われた場合、ネットワークの時計は ITU-T のマスク内にとどまるか、そしてどれだけの時間か？ | `telecom-prtc-holdover-24h`、`leo-vertical-5g-network-timing` |
| **科学と研究** | PNT の結果を、シードに至るまで再現、拡張、引用できるか？ | `sweep-clock-stability`、`quantum-pnt-demonstrator.suite` |

</details>

<a id="evidence"></a>
## エビデンス

<p><a href="docs/SGP4-VALIDATION.md"><img src="https://img.shields.io/badge/SGP4-666%2F666%20AIAA%20vectors%20%C2%B7%20worst%204.12%20mm-377D0C?style=flat-square&labelColor=0A1226" alt="SGP4 を AIAA 2006-6753 の全 666 の参照ベクトルに対して確認、最悪の位置誤差 4.12 mm"></a></p>

<strong>401 のうち 176</strong> の機能が独立した外部のオラクルに対して検証済みです。221 は正直に Modelled とラベル付けしています。
検証マトリクスの各行は、機能、それを確認するオラクル、
確認を実行するテスト、そして結果として付くラベルを示します。継続的インテグレーション（CI）により、
独立した外部のオラクルなしに機能を VALIDATED と呼ぶことは不可能になっています。

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/assets/readme/flow-verification-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/assets/readme/flow-verification-light.svg">
  <img src="docs/assets/readme/flow-verification-light.svg" alt="機能がラベルを獲得する方法。検証マトリクスの各行は、機能、それを確認するオラクル、継続的インテグレーションで確認を実行するテスト、そして結果として付くラベルを示します。行が VALIDATED になれるのは独立した外部のオラクルがある場合だけです。それ以外は MODELLED、ハードウェアパートナーが担当する場合は PARTNER です。例：SGP4/SDP4、Cowell 6-DOF + 摂動、バッチ/逐次 OD、オラクルは AIAA 2006-6753 の SGP4 検証ベクトル、テストは tests/sgp4_verification.rs、ラベルは VALIDATED。現在の件数：401 行のうち VALIDATED 176、MODELLED 221、PARTNER 4。全体で、176 の機能が独立した外部のオラクルに対して検証済みであり、さらに 221 が正直に MODELLED とラベル付けされ、4 が PARTNER の担当です。" width="100%">
</picture>

| ラベル | 行数 | 意味 |
|---|---|---|
| VALIDATED | 176 | 独立した外部のオラクルと一致する：実データ、独立した実装、または公表された参照ベクトル |
| MODELLED | 221 | 解析的な真値またはシミュレーションの自己整合性に対して確認しており、そのことを明言している |
| PARTNER | 4 | ハードウェアパートナーが担当する。Kshana はそのオラクルを持たない |

確認の例：AIAA（American Institute of Aeronautics and Astronautics）2006-6753 の
SGP4（Simplified General Perturbations 4）の全 666 ベクトルを 4.12 mm まで。Cowell の力学
モデルを Orekit 12.2 に対して 0.08 m まで。欧州宇宙機関（ESA）の実際の精密エフェメリスに対して
Galileo を 0.61 m、Swarm-A を 0.10 m まで。テストは
`src/` の行カバレッジを約 95 % に保ち、CI では 85 % をゲートとしています。台帳は
`src/verification.rs` から生成される [`docs/VERIFICATION-MATRIX.md`](docs/VERIFICATION-MATRIX.md) です：
[401 行の完全なマトリクス](docs/VERIFICATION-MATRIX.md)。各 Modelled の行に外部のオラクルがない理由は
[`docs/MODELLED-RATIONALE.md`](docs/MODELLED-RATIONALE.md) にあります。

<details>
<summary>検証の仕組み、厳選したハイライトの表、エビデンスの図</summary>

### 検証、再現性、誠実さ

- すべての雑音項は **公表され、引用された** 数値にキャリブレーションし、
  標準的な関係式（時計には Allan 偏差、慣性には Groves の推測航法の
  誤差増大、時刻転送にはタイミング→測距の変換）に対して検証しています。項ごとの
  ステータスは [`docs/VALIDATION.md`](docs/VALIDATION.md) で `validated` または
  `not modeled` として管理しています — 検証されていないものを検証済みとして示すことはありません。
- **構造的に再現可能：** `scenario + seed + engine version → identical
  bits`。`scripts/check-reproducible.sh` がこれを強制します。量子と古典の実行は
  独立したシードを使うため、それらの雑音は無相関です。
- 成熟度は正直に記載しています：光時計と光リンクの数値は *目標値 /
  地上デモンストレーター* の結果であり、飛行したものではありません。

### すべての図に付くエビデンスラベル

実行が書き出すすべての図と表は、それをどこまで信頼できるか、そしてそれがどの台帳の行に依拠しているかを示します。結果の JSON には
`evidence` キーがあり、チャートの SVG にはプロットの下の 1 行（および `<metadata id="kshana-evidence">` 要素）があり、CSV の表には
先頭に `# evidence:` のコメント行があります（`comment='#'` で読み込みます）。ラベルはティア `VALIDATED`、`MODELLED`、`PARTNER` のいずれかと、
実行が使用した検証マトリクスの行の id（`VM-` と 16 進数 8 桁）を示します。ティアはそれらの行のうち最も弱いものであり、
1 つのモデル化した行に依拠する実行は、その隣に検証済みの行がいくつあっても MODELLED とラベル付けされます。ラベルが
台帳以上のことを主張することは決してありません。行、ステータス、id はマトリクスから読み取るものであり、手で入力するものではありません
（[`docs/VERIFICATION-MATRIX.md`](docs/VERIFICATION-MATRIX.md)、[`docs/SCHEMA.md`](docs/SCHEMA.md)）。
`tests/evidence_labels_doc_sync.rs` は、図にラベルがない場合やラベルがマトリクスと食い違う場合に失敗します。

### 検証の概要

各行は CI で名前付きのテストによって強制されています。この表は **厳選したハイライト** です。
機械的に検査される完全なマトリクスは **401 行 — VALIDATED 176、MODELLED 221、PARTNER 4**
（`src/verification.rs`）であり、完全なエビデンス（そして正直に言って *まだ* 検証されていないもの）は
[`docs/VALIDATION.md`](docs/VALIDATION.md) と、リリースごとの
[`kshana-validation-summary.html`](https://github.com/ashfordeOU/kshana/releases)
成果物（`cargo run --bin validation_report` で生成、SLSA — Supply-chain
Levels for Software Artifacts — による証明付き）にあります。

**ステータス** の列は、上の検証のはしごに合わせて、エビデンスの *種類* を示します：**VALIDATED** = 独立した外部のオラクル（実データ、独立したライブラリ、または公表された参照ベクトル）に対して確認済み。**MODELLED** = 解析的な真値またはシミュレーションの自己整合性に対して確認済み（独立した外部のデータセットはなし）。VALIDATED は確認の *方法* を表すものであり、合否ではありません — 実際の外部オラクルに対する正直な未達は VALIDATED のままであり、マトリクスのどの行もオラクルとして名指ししていない比較（上記の LRO — Lunar Reconnaissance Orbiter — のフィット）は MODELLED として示します。`CI` の行はプロセスのガードであり、性能指標ではありません。いくつかの実データの島（実測のセシウム時計、Stable32 PHASE.DAT、生の入力に再配布ライセンスがない OPS-SAT/ICGEM のチェック）は **データ依存** です：入力がない場合、テストはスキップの通知を出力してグリーンのままとなり、公開されている参照値は `tests/fixtures/` 以下にコミットしています。生の入力は対応する `scripts/fetch_*.sh` で再現してください。

| ステータス | 機能 | 一致度 | 参照 / オラクル |
|--------|------------|-----------|--------------------|
| **VALIDATED** | SGP4/SDP4 による伝搬 | 666/666 ベクトル、最悪 **4.12 mm** | AIAA 2006-6753（Vallado `tcppver.out`）+ 独立した `sgp4` クレートとの直接比較 |
| **VALIDATED** | 座標系 — IAU 2000A/B 章動、IAU 2006/2000A CIO チェーン、ERA | **ビット単位**（X,Y は 1e-14、s は 1e-18、ERA は 1e-12 まで） | ERFA/SOFA `eraXys06a` · `eraC2ixys` · `eraEra00` · `eraNut00a/b` |
| **MODELLED** | 独立した SPICE エンジンに対する GCRS→ITRS | 最大 **0.028″** → 地上で ≤ 0.86 m、GNSS 軌道で ≤ 3.6 m | ANISE（純粋な Rust による NAIF/SPICE）、同じ IERS `finals2000A` の EOP、2020–2023 年の 8 エポック（この参照と比較していますが、検証マトリクスのどの行も外部のオラクルとして名指ししていないため、VALIDATED とはラベル付けしていません） |
| **MODELLED** | EGM2008 ジオポテンシャル（次数/位数 70） | 加速度 = ∇V を **< 1e-6** で。帯状項への縮退は検証済みの J2 と一致 | NGA EGM2008 の係数 + 解析的な ∇V 恒等式 |
| **VALIDATED** | 重力汎関数の合成（重力支援 / GNSS を使わない航法の地図） | GRS80 の Somigliana + γ_e/γ_p を **3.5e-12** まで。実際の EGM2008 の擾乱マップは物理的に妥当（RMS ≈ 26 mGal、次数/位数 70） | GRS80（Moritz 1980、IAG — International Association of Geodesy）の Somigliana 正規重力 + 実際の ICGEM EGM2008（`tests/icgem_gravity_reference.rs`） |
| **VALIDATED** | Allan 推定器（ADEV/MDEV/TDEV/HDEV）+ 信頼帯 | 参照の偏差を再現。χ² 帯が一致 | NIST SP 1065（Riley）、1000 点の Table 31/32 |
| **VALIDATED** | **実測のセシウム時計** に対する Allan 推定器 | OADEV/OHDEV を **1e-3** まで（観測値 ≤ 3e-5）、16 の平均化係数 | 実際の 5071A Cs と H メーザーの比較に対する Stable32、556,990 点（`tests/cs5071a_reference.rs`、データ依存） |
| **VALIDATED** | **標準的な Stable32 PHASE.DAT** に対する Allan 推定器 | OADEV/MDEV/TDEV を **1e-3** まで（観測値 ≤ 5e-5）、139 の平均化係数 | PHASE.DAT に対する Stable32 の参照偏差（`tests/phasedat_reference.rs`、データ依存） |
| **MODELLED** | IMU 誤差モデル — ARW / VRW / バイアス不安定性 | **< 5 %** で復元（バイアス不安定性は < 15 %） | Analog Devices ADIS16465 のデータシート、NaveGo の参照プロファイル |
| **VALIDATED** | Cowell 型の数値伝搬器 + 力学モデル（保存力の階層） | 24 h で最悪の位置誤差 **0.08 m**、278 エポック（LEO + GTO） | Orekit 12.2 `NumericalPropagator`/`DormandPrince853`（CS GROUP）、`tests/numerical_cowell_propagator_reference.rs` |
| **MODELLED** | Cowell の大気抵抗の階層 + 太陽/月のエフェメリスと密度の絶対的な入力 | 大気抵抗の階層は ≈ 333 m / 24 h と特性評価。摂動なしの場合は普遍変数ケプラーとメートル未満で一致、エネルギー/運動量は約 1e-9 | 組み込みの低精度エフェメリス + 解析的なケプラー |
| **MODELLED** | Lambert · Tsiolkovsky · ポークチョップ | 二体の真値に対するラウンドトリップ。ΔV **< 0.01 %** | Izzo 2015 · ロケット方程式 · 解析的な Hohmann の下限 |
| **MODELLED** | 軌道決定（Gauss–Newton のバッチ） | 雑音なしでメートル未満 / mm·s⁻¹、5 m の雑音レベルで約 2 m | RK4 のアーク上の二体 + J2 |
| **MODELLED** | Galileo の精密エフェメリスに対する力学モデルのフィット（全アーク） | 3 次元 RMS **0.61 m**、24 h、次数/位数 70、力学のみ | ESA/ESOC `ESA0MGNFIN` の最終軌道（E11）、実際の `finals2000A` の EOP（この参照と比較していますが、検証マトリクスのどの行も外部のオラクルとして名指ししていないため、VALIDATED とはラベル付けしていません） |
| **MODELLED** | Swarm-A の精密エフェメリスに対する力学モデルのフィット（縮約動力学） | 3 次元 RMS **0.10 m**（経験的な階層の境界であり、測定値ではありません） | ESA `SW_OPER_SP3ACOM_2_` の精密軌道（この参照と比較していますが、検証マトリクスのどの行も外部のオラクルとして名指ししていないため、VALIDATED とはラベル付けしていません） |
| **MODELLED** | LRO の月軌道に対する力学モデルのフィット（正直な未達） | 縮約動力学で **6.67 m**、5 m の目標を *上回る* | JPL Horizons の LRO（NAIF −85）+ GRAIL（Gravity Recovery and Interior Laboratory）`GRGM660PRIM`（この参照と比較していますが、検証マトリクスのどの行も外部のオラクルとして名指ししていないため、VALIDATED とはラベル付けしていません） |
| **MODELLED** | 深宇宙の火星 OD（縮約動力学の SRIF） | 火星低軌道で **≈ 0.2 m**（シミュレーションの FoM であり、実際のミッションでは *ありません*） | 合成の閉ループ OD — 推定器の仕組みの検証 |
| **MODELLED** | JPL DE440 に対する太陽中心の火星の力学 | **1 日のアークで 137 m**（アークとともに増大 = モデル化していない n 体） | ANISE を介した JPL DE440（`xval/anise-mars-od`、カーネル依存）（この参照と比較していますが、検証マトリクスのどの行も外部のオラクルとして名指ししていないため、VALIDATED とはラベル付けしていません） |
| **VALIDATED** | 測量済みの IGS 座標に対する単独測位（実際の観測） | 3 次元 RMS **5.7 m** / 水平 **1.1 m**、2 周波電離圏フリーのコード SPP | IGS 局 ABMF の測量値 + GPS 放送エフェメリス、2018-05-13（`tests/pvt_abmf.rs`） |
| **MODELLED** | 密結合の GNSS/INS UKF | 120 s の途絶を含む 30 分間の LEO のパスで **0.77 m RMS** | 力学モデルによるコースト、手で導出 |
| **MODELLED** | GPS 拒否下の重力地図航法 | 約 70 km の INS ドリフト → **約 145 m** まで復元 | ESA NAVISP *Quantum Wayfarer* の目標 |
| **MODELLED** | 地形参照航法（TERCOM/SITAN） | 70 km のドリフト → **< 500 m**（グリッド解像度の下限は約 140 m） | SRTM `.hgt` DEM。手で注入したドリフト（循環論法にならない確認） |
| **MODELLED** | IGRF-14 の主磁場（次数/位数 13） | 極は約 80.7°N、双極子は約 29.7 µT、物理的な 22–67 µT の帯域 | IAGA（International Association of Geomagnetism and Aeronomy）`igrf14coeffs.txt`（Schmidt 準正規化） |
| **MODELLED** | 航法信号の変調とコード追尾 | BPSK の自己 SSC = **2/(3·R_c)**。単位面積の PSD。45 dB-Hz で **メートル未満** の C/A の DLL ジッター | 閉形式の SSC/PSD の基準値 + Kaplan & Hegarty の DLL 熱雑音の式 |
| **MODELLED** | CR3BP のハロー/NRHO の微分修正器 | STM = 有限差分。軌道は **機械精度** まで閉じる。L2 9:2 NRHO は **≈ 6.57 d / 近月点 ≈ 3,250 km** | 有限差分による STM の確認 + 公表された L2 南側 9:2 NRHO（≈ 6.56 d / ≈ 3,370 km）— CR3BP であり、実際の Gateway のエフェメリスではありません |
| **MODELLED** | ARAIM のデュアルコンステレーションのインテグリティ | 実際の GPS + Galileo でのコンステレーション全体の故障モード | EU ARAIM TR（技術報告書）/ DO-316。Celestrak `gps-ops` 2021-07-28（この参照と比較していますが、検証マトリクスのどの行も外部のオラクルとして名指ししていないため、VALIDATED とはラベル付けしていません） |
| **VALIDATED** | GNSS の幾何配置 / DOP（GDOP/PDOP/HDOP/VDOP/TDOP） | 8 つの幾何配置（良条件 → 特異に近いもの）にわたって **相対 1e-6** で一致 | gnss_lib_py 1.0.4（Stanford NAV Lab）— 独立したライブラリ（`tests/dop_reference.rs`） |
| **VALIDATED** | ML の検出器評価指標（AUC/ROC/混同行列/Pd-Pmd/適合率/F1） | 5 データセット × 24 閾値にわたって **カウントが完全一致 + < 1e-9** | scikit-learn 1.9.0（Pedregosa et al.、JMLR — Journal of Machine Learning Research — 2011）— 独立したライブラリ（`tests/eval_metrics_reference.rs`） |
| **VALIDATED** | **実際の ESA OPS-SAT テレメトリー** に対する異常検知の ROC AUC | AUC は scikit-learn を **< 1e-9** で再現。ラベル付きのテスト分割でピークカウント検出器の AUC **≈ 0.85** | OPSSAT-AD のテスト分割に対する scikit-learn `roc_auc_score`（Ruszczak et al. 2025、CC BY 4.0）— 実際の OPS-SAT テレメトリー（`tests/opssat_ad_reference.rs`） |
| **VALIDATED** | 量子トレードの数値カーネル（ADEV の NNLS フィット · χ² の整合性帯域 · van-Loan の時計の Q） | NNLS + Q は **完全一致**。運用時の自由度 ≥ 48 で χ² は **< 5e-4** | scipy 1.17.1 — `optimize.nnls` / `stats.chi2.ppf` / `linalg.expm`（`tests/scipy_reference.rs`） |
| **VALIDATED** | MTIE / MDEV / TDEV の通信用ワンダー指標（ITU-T G.810/G.823/G.8261/G.811 — 国際電気通信連合の電気通信標準化部門の勧告） | NIST SP 1065 の LCG（線形合同法）系列で、MTIE（9 の平均化係数、ビット単位で一致）と MDEV + TDEV（8 の係数、相対 **< 1e-9**） | allantools 2024.06 `mtie` / `mdev` / `tdev` — 独立したライブラリ（`tests/mtie_reference.rs`、`tests/mdev_tdev_reference.rs`） |
| **VALIDATED** | MCDA のトレードスタディ手法 — 4 つすべての意思決定ファミリー、外部検証済みの 9 つの集約器（WSM · WPM · WASPAS · MOORA · COPRAS · TOPSIS · VIKOR · PROMETHEE II · ELECTRE I）と **AHP** の一対比較による優先度の重み付け | スコア / 順位 / 一致行列を **< 1e-9** で再現 | pymcdm + pyDecision（独立したサードパーティの MCDA ライブラリ）+ Saaty の RI（ランダム指数）/ SciPy-LAPACK の固有値計算（`tests/mcda_*_reference.rs`） |
| **VALIDATED** | 軌道と搬送波からの LEO のドップラーエンベロープ | Iridium の最大値は公表された ±36 kHz の **5 %** 以内。Xona Pulsar X1 は公表された **32–34 kHz** の範囲内 | RNTF の LEO PNT 試験結果。Leclère, Marathe & Reid, arXiv:2509.19551（`tests/leo_doppler_reference.rs`） |
| **MODELLED** | LEO による補強を伴う PPP の収束 | LEO 衛星 60 / 96 / 192 / 288 機で 7.4 → 4.8 / 3.2 / 2.7 / 2.3 min、単調。フィルターの NEES は χ² 帯域内 | Li et al., J. Geod. 93:749 (2019)（9.6 → 7.0 / 3.2 / 2.1 / 1.3 min）と傾向を比較。コンステレーションと雑音は再現していません |
| **MODELLED** | 条件付きタイミング保護レベル（スプーフィング下でホールドオーバーに制約される未検出の時刻誤差） | 組み合わせは多段の `clock_state` の共分散漸化式を再現。実際に記録されたスプーフでキャリブレーション | JammerTest 2024（Zenodo 15911589）のスカラー + van-Loan / CUSUM の閉形式（`examples/tpl_jammertest`） |
| **MODELLED** | PNT レジリエンスのスコアリング + 判断の不安定性 | 手で導いたオラクルによるテスト 35 件。バイト単位で決定論的な検討成果物（固定シード） | DHS RPCF v2.0 との対応付け + Dirichlet / Kendall-τ / Hill-N2 の閉形式 — 合成アーキテクチャであり、認証ではありません |
| **MODELLED** | RF 障害の楽観ギャップの検討（スケーリング則 + leave-one-out の予測器） | 並べ替えによる帰無分布での有意性。バイト単位で決定論的な成果物（5 シード） | パラメーターに基づく合成コーパス — 評価 *指標* は scikit-learn に対して VALIDATED（上記）であり、検討は MODELLED です |
| CI | クロスプラットフォームの再現性 | 3 つの OS（オペレーティングシステム）で入力と形状のゴールデンがビット単位で一致 | Linux / macOS / Windows の CI マトリクス、SHA-256 のゴールデン |
| CI | テストカバレッジ | `src/*_data.rs` と `src/main.rs` を除く `src/` で **行カバレッジ約 95 %**、≥ 85 % をゲート | cargo-tarpaulin（LLVM エンジン） |

<p align="center">
  <img src="docs/assets/diagrams/validation-provenance.png" alt="機能がラベルを獲得する方法：要求は src 内のモジュールに、tests 内のテストに、外部のオラクル（実データセット、独立した参照実装、または公表されたベクトル）に、そしてステータスに対応付けられます — 外部のオラクルなしにはどの機能も Validated にできないという、CI で強制されるガード付き。現在の件数：Validated 176、Modelled 221、Partner 4、合計 401" width="900">
  <br><sub>機能がラベルを獲得する方法 — CI で強制される不変条件：外部のオラクルがなければ ⇒ Validated にできない · <a href="docs/assets/diagrams/validation-provenance.svg">SVG</a></sub>
</p>

<p align="center">
  <img src="docs/assets/figures/oracle-kind-stacked.png" alt="各主張の裏付け方：Validated の列は構造上 176 件中 176 件が ExternalDataset（CI で強制）。Modelled の行は正直に InternalConsistency、ReferenceImpl、ExternalDataset のいずれかでタグ付けされています。Partner の行には Kshana のオラクルはありません" width="62%">
  <br>
  <img src="docs/assets/figures/sgp4-regime-bars.png" alt="AIAA 2006-6753 の参照に対する SGP4/SDP4 の最悪ケースの位置誤差を領域ごとに対数スケールで示したもの：すべての領域で AIAA の許容値を大きく下回り、最悪ケースは深宇宙の非共鳴領域で 4.12 mm" width="96%">
  <br><sub>上：すべての Validated の行は、構造上、外部のデータセットに裏付けられています。下：SGP4 はすべての領域で公式の参照と一致します（最悪 4.12 mm）。<a href="docs/assets/figures/oracle-kind-stacked.svg">SVG</a> · <a href="docs/assets/figures/sgp4-regime-bars.svg">SVG</a></sub>
</p>

<p align="center">
  <img src="docs/assets/figures/validation-breakdown.png" alt="401 のすべての機能にわたる検証のステータス：Validated 176（外部のオラクルに対して確認済み）、Modelled 221、Partner の担当 4" width="780">
  <br><sub>Validated 176 · Modelled 221 · Partner 4 — <a href="docs/assets/figures/validation-breakdown.svg">SVG</a></sub>
</p>

</details>

<a id="capability-domains"></a>
### 機能ドメイン

公開マップのすべての機能を、ドメインごとに台帳のラベルとともに示します。ドメインの表は
[`tools/gen_readme_blocks.py`](tools/gen_readme_blocks.py) が `web/capabilities.json` から書き出します。これは
Studio の「すべての地図」が読み込むのと同じファイルです。

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/assets/figures/domain-coverage-map.svg">
  <img src="docs/assets/figures/domain-coverage-map.svg" alt="ドメインと成熟度別の Kshana の機能：ドメインごとの検証済みとモデル化の公開機能。tools/gen_validation_figures.py が web/capabilities.json から描画" width="900">
</picture>

ドメインごとにすべての機能とそのラベルを示した完全な表は [`docs/CAPABILITY-DOMAINS.md`](docs/CAPABILITY-DOMAINS.md) です。

<a id="install"></a>
## インストール

1 行でコマンドラインツールが手に入ります：**`cargo install kshana`**。すべてのチャネルが、同じタグ付きコミットから
v0.40.0 を提供します。

<!-- channels:begin -->
| チャネル | インストール | ガイド |
|---|---|---|
| ブラウザーで試す | https://kshana.dev を開く | [Studio ガイド](https://kshana.dev/docs/studio.html) |
| コマンドライン（Rust） | `cargo install kshana` | [コマンドラインの使い方](https://kshana.dev/docs/rust.html#usage--cli) |
| Rust ライブラリ | `cargo add kshana` | [docs.rs の API リファレンス](https://docs.rs/kshana) |
| Python | `pip install kshana` | [Python API ガイド](https://kshana.dev/docs/python-api.html) |
| JavaScript と WebAssembly | `npm install kshana` | [npm と WebAssembly のガイド](https://kshana.dev/docs/npm.html) |
| AI アシスタント（MCP サーバー、cargo） | `cargo install kshana-mcp` | [MCP サーバーのガイド](https://kshana.dev/docs/mcp.html) |
| Docker イメージ | `docker run --rm -i ghcr.io/ashfordeou/kshana-mcp` | [MCP サーバーのガイド：Docker](https://kshana.dev/docs/mcp.html#install) |
| Claude Desktop 拡張機能 | お使いのシステム用の `.mcpb` をダブルクリック：[macOS（Apple シリコン）](https://github.com/ashfordeOU/kshana/releases/download/v0.40.0/kshana-mcp-aarch64-apple-darwin.mcpb) · [macOS（Intel）](https://github.com/ashfordeOU/kshana/releases/download/v0.40.0/kshana-mcp-x86_64-apple-darwin.mcpb) · [Windows](https://github.com/ashfordeOU/kshana/releases/download/v0.40.0/kshana-mcp-x86_64-pc-windows-msvc.mcpb) · [Linux（x86-64）](https://github.com/ashfordeOU/kshana/releases/download/v0.40.0/kshana-mcp-x86_64-unknown-linux-gnu.mcpb) · [Linux（Arm）](https://github.com/ashfordeOU/kshana/releases/download/v0.40.0/kshana-mcp-aarch64-unknown-linux-gnu.mcpb) | [すべての MCP インストール用スニペット](https://github.com/ashfordeOU/kshana/blob/main/docs/MCP-INSTALL.md) |
| Cursor（ワンクリック） | [Cursor に追加（npx）](https://cursor.com/en/install-mcp?name=kshana&config=eyJjb21tYW5kIjoibnB4IiwiYXJncyI6WyIteSIsImtzaGFuYS1tY3BAMC40MC4wIl19) · [Cursor に追加（Docker）](https://cursor.com/en/install-mcp?name=kshana&config=eyJjb21tYW5kIjoiZG9ja2VyIiwiYXJncyI6WyJydW4iLCItaSIsIi0tcm0iLCJnaGNyLmlvL2FzaGZvcmRlb3Uva3NoYW5hLW1jcDowLjQwLjAiXX0%3D) · `npx -y kshana-mcp@0.40.0` | [すべての MCP インストール用スニペット](https://github.com/ashfordeOU/kshana/blob/main/docs/MCP-INSTALL.md) |
| VS Code（ワンクリック） | [VS Code にインストール（npx）](https://insiders.vscode.dev/redirect?url=vscode%3Amcp%2Finstall%3F%257B%2522name%2522%253A%2522kshana%2522%252C%2522command%2522%253A%2522npx%2522%252C%2522args%2522%253A%255B%2522-y%2522%252C%2522kshana-mcp%25400.40.0%2522%255D%257D) · [VS Code にインストール（Docker）](https://insiders.vscode.dev/redirect?url=vscode%3Amcp%2Finstall%3F%257B%2522name%2522%253A%2522kshana%2522%252C%2522command%2522%253A%2522docker%2522%252C%2522args%2522%253A%255B%2522run%2522%252C%2522-i%2522%252C%2522--rm%2522%252C%2522ghcr.io%252Fashfordeou%252Fkshana-mcp%253A0.40.0%2522%255D%257D) · `npx -y kshana-mcp@0.40.0` | [すべての MCP インストール用スニペット](https://github.com/ashfordeOU/kshana/blob/main/docs/MCP-INSTALL.md) |
| Claude Code | `claude mcp add kshana -- npx -y kshana-mcp@0.40.0` | [すべての MCP インストール用スニペット](https://github.com/ashfordeOU/kshana/blob/main/docs/MCP-INSTALL.md) |
| npx | `npx -y kshana-mcp@0.40.0` | [すべての MCP インストール用スニペット](https://github.com/ashfordeOU/kshana/blob/main/docs/MCP-INSTALL.md) |
| uvx / pipx | `uvx kshana-mcp==0.40.0` | [すべての MCP インストール用スニペット](https://github.com/ashfordeOU/kshana/blob/main/docs/MCP-INSTALL.md) |
| Homebrew | `brew install ashfordeOU/tap/kshana-mcp` | [すべての MCP インストール用スニペット](https://github.com/ashfordeOU/kshana/blob/main/docs/MCP-INSTALL.md) |
| Scoop | `scoop bucket add ashforde https://github.com/ashfordeOU/scoop-bucket && scoop install kshana-mcp` | [すべての MCP インストール用スニペット](https://github.com/ashfordeOU/kshana/blob/main/docs/MCP-INSTALL.md) |
| winget | `winget install AshfordeOU.KshanaMcp` | [すべての MCP インストール用スニペット](https://github.com/ashfordeOU/kshana/blob/main/docs/MCP-INSTALL.md) |
| ビルド済みバイナリ | リリースから kshana-mcp-<target> をダウンロードし、SHA256SUMS と照合する | [すべての MCP インストール用スニペット](https://github.com/ashfordeOU/kshana/blob/main/docs/MCP-INSTALL.md) |
| 公式 MCP レジストリ | io.github.ashfordeOU/kshana-mcp を検索 | [すべての MCP インストール用スニペット](https://github.com/ashfordeOU/kshana/blob/main/docs/MCP-INSTALL.md) |
| リモート（streamable HTTP）、セルフホスト | `kshana-mcp --http 127.0.0.1:8080` | [セルフホスティングのガイド](https://github.com/ashfordeOU/kshana/blob/main/docs/deploy/mcp-http.md) |
| Claude Code プラグインマーケットプレイス | `/plugin marketplace add ashfordeOU/kshana` | [エージェントから Kshana を使う](https://github.com/ashfordeOU/kshana/blob/main/docs/AGENTS.md) |
| JetBrains IDE プラグイン | Settings → Plugins → Marketplace → "Kshana" を検索（プラグイン ID dev.kshana.ide） | [プラグインのガイド](https://kshana.dev/docs/jetbrains.html) |
| Signal K プラグイン | `npm install signalk-kshana-trust` | [Signal K プラグインのガイド](https://github.com/ashfordeOU/kshana/blob/main/integrations/signalk/README.md) |
| OpenCPN プラグイン | リリースからプラグインの tarball をダウンロード | [OpenCPN カタログへの提出](https://github.com/ashfordeOU/kshana/blob/main/packaging/opencpn/SUBMITTING.md) |
| Grafana ダッシュボード | リリースから kshana-grafana-*.json をインポート | [ダッシュボードのソース](https://github.com/ashfordeOU/kshana/blob/main/deploy/grafana/kshana-gnss-trust.json) |
| リファレンスビルドのイメージ | `docker pull ghcr.io/ashfordeou/kshana-reference-build` | [海事向けの統合](https://github.com/ashfordeOU/kshana/blob/main/docs/MARINE-INTEGRATIONS.md) |
<!-- channels:end -->

<p><a href="https://plugins.jetbrains.com/plugin/32181-kshana--pnt-simulator"><img src="https://img.shields.io/badge/JetBrains-Marketplace-066A86?style=flat-square&labelColor=0A1226" alt="JetBrains Marketplace 上の Kshana"></a> <a href="Cargo.toml"><img src="https://img.shields.io/badge/rust-1.88%2B-3F4B67?style=flat-square&labelColor=0A1226" alt="Rust 1.88 以降でビルド可能（Cargo.toml の rust-version）"></a></p>

MCP は Model Context Protocol です。リリースを固定するには `cargo install kshana --version 0.40.0`、
`pip install kshana==0.40.0`、または `npm install kshana@0.40.0` を使います。ソースからビルドするには、リファレンスの
[インストールとビルド](#install--build)を参照してください。

<details>
<summary>Python と WebAssembly からシナリオを実行する</summary>

<br>

```python
import json, kshana

toml = open("clock-holdover.toml").read()
result = json.loads(kshana.run(toml))
print(kshana.version(), result["quantum"]["fom"]["holdover_s"], result["classical"]["fom"]["holdover_s"])
# 0.40.0 6600.0 2610.0
```

`run` のほかに、モジュールは `run_full`（JSON、SVG、1 行のサマリーを一度に）、
`run_typed`、`validate_toml`、`list_kinds` / `scenario_kinds`、`error_kind` を公開しています。
[`docs/PYTHON_API.md`](docs/PYTHON_API.md) を参照してください。

npm パッケージは WebAssembly にコンパイルされたエンジン全体です。Node.js ではバイナリを
`initSync` に渡し、ブラウザーでは `await init()` がそれを取得します（[`README.npm.md`](README.npm.md) を参照）。

```js
import { readFileSync } from "node:fs";
import { createRequire } from "node:module";
import { initSync, run, summary, version } from "kshana";

const wasm = createRequire(import.meta.url).resolve("kshana/kshana_bg.wasm");
initSync({ module: readFileSync(wasm) });

const toml = readFileSync("clock-holdover.toml", "utf8");
const result = JSON.parse(run(toml));
console.log(version(), result.quantum.fom.holdover_s, result.classical.fom.holdover_s);
// 0.40.0 6600 2610
console.log(summary(toml));
```

</details>

<a id="architecture"></a>
## アーキテクチャ

1 つのオープンなエンジンが中心にあり、すべてのサーフェスがそれを実行します：コマンドライン、Rust
ライブラリ、Python、WebAssembly と Kshana Studio、MCP サーバー、Docker イメージ、
JetBrains プラグイン。同じシナリオファイルは、どのサーフェスでも同じバイト列を返します。Kshana Pro は
その上に別のオーバーレイとして位置し、エンジンに依存しますが、決してフォークしません。

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/assets/readme/architecture-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/assets/readme/architecture-light.svg">
  <img src="docs/assets/readme/architecture-light.svg" alt="Kshana のアーキテクチャ：中心に 1 つのオープンなエンジン、AGPL-3.0 の kshana 0.40.0 があり、api::run_toml、すべての種別にわたる型付きのディスパッチ、そして 401 の機能の検証台帳（VALIDATED 176、MODELLED 221、PARTNER 4）を備えます。その周りで、すべてのサーフェスが同じエンジンを実行します：コマンドライン（cargo install kshana）、Rust ライブラリ（cargo add kshana）、Python（pip install kshana）、WebAssembly + Kshana Studio（npm install kshana）、MCP サーバー（cargo install kshana-mcp）、Docker イメージ（ghcr.io/ashfordeou/kshana-mcp）、JetBrains プラグイン（Marketplace：&quot;Kshana&quot;）。その下に Kshana Pro があり、これはオープンなエンジンにライブラリとして依存し、決してフォークせず、物理モデルを追加しないプロプライエタリなオーバーレイです。" width="100%">
</picture>

<details>
<summary>エンジンの内部：ドメインの層と検証台帳</summary>

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/assets/readme/flow-architecture-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/assets/readme/flow-architecture-light.svg">
  <img src="docs/assets/readme/flow-architecture-light.svg" alt="層で見た Kshana のアーキテクチャ。5 つの入口（コマンドライン、Python、JavaScript と WebAssembly、MCP サーバー、JetBrains プラグイン）が、92 の種別にわたる型付きのディスパッチである 1 つの api::run_toml に到達します。その下に 8 つのドメインの層があります：時刻と座標系、時計とタイミング、慣性と融合、GNSS とインテグリティ、アストロダイナミクス、LEO PNT、月・火星・深宇宙、ミッションと検討。これらは共有のコアの上にあり、すべて検証モジュール — すべてのラベルの唯一の情報源である、401 の機能からなる機械的に検査されるマトリクス — によって相互参照されています。" width="100%">
</picture>

**1 つのエンジン、多くの入口。** 1 つの Rust のコア（`kshana`）がすべてのシナリオを実行し、
CLI、Python 拡張、ブラウザー内の WebAssembly モジュール、AI エージェント向けの **MCP
サーバー**、**JetBrains IDE プラグイン** から利用できます — すべてが 1 つの
`api::run_toml` のディスパッチに集約されます。内部では、センサーパックが共通の誤差モデルの
インターフェースに接続されます。その横には、**座標系の層**（IAU 2006/2000A の
歳差・章動と CIO ベースの GCRS↔ITRS 変換）、**アストロダイナミクス/数値計算の
層**（解析的な SGP4/SDP4 **と**、EGM2008/摂動の力学モデルを備えた Cowell 型の数値伝搬器、
マヌーバ設計、軌道決定）、**インテグリティ/GNSS の層**（RAIM/ARAIM、SBAS、測定ドメイン、ジャミング、シスルナ）、
**融合 / 代替 PNT の層**（GNSS/INS の推定器と、重力/地形/磁気の
地図照合器）、**深宇宙と月の層**（電波による火星 PNT と
月の PNT スイート。要素ごとのエビデンスのティアはマトリクスにあります — LTC 時刻、VLBI、結合 OD+時計、座標系の実現、サービスボリューム、
ディファレンシャル PNT、相互運用）、**ミッション解析の層**（打ち上げ / 再突入 / カバレッジ /
指向 / パス / リンクのバジェットと宇宙天気の環境）、そしてオープンな
**レジリエンスと AI/ML の検討層**（RPCF のレジリエンスのスコアリング、RF 障害の楽観
ギャップ、量子を活用した PNT のデモンストレーター）があり、その再現可能な成果物は
検証済みのカーネルの上に成り立っています。

2 つの独立した **ワークスペース除外** のクレートがコアの横にあります — `mcp/kshana-mcp`
（MCP サーバー、edition-2024 の `rmcp` SDK で構築）と `xval/anise-frames`（
ANISE/SPICE の座標系のクロスチェックで、MPL-2.0（Mozilla Public License 2.0）の依存関係を取り込みます）— これらはルートの
`Cargo.toml` の `exclude` リストによって、公開クレートの依存関係グラフ、`Cargo.lock`、ライセンスのゲート、MSRV（サポートする最小の Rust バージョン）のビルドから
除外されています。JetBrains プラグイン（`ide/jetbrains`）は別の Kotlin
プロジェクトです。図の全体は [`docs/ARCHITECTURE.md`](docs/ARCHITECTURE.md) を参照してください。

描画済みの図（エンジンの流れ、モジュールマップ、配布）は [`docs/ARCHITECTURE.md`](docs/ARCHITECTURE.md) にあります。

</details>

<a id="diagrams"></a>
### 図

図は [`docs/diagrams/`](docs/diagrams/) にある Mermaid のソースで、SVG と PNG に描画されて
[`docs/assets/diagrams/`](docs/assets/diagrams/) に置かれます（Linux では `tools/render-diagram-chromium.sh <name>`、それ以外では他の 2 つの
`render-diagram` スクリプト）。記録が各 PNG をその元となった正確な SVG に結び付けます。テストは図に記載された
件数を固定しています。上のセクションのチャートはツールがエンジンの実行から描いたものであり、これらの図は各部分が
どのように組み合わさるかを示します。

<p align="center">
  <img src="docs/assets/diagrams/system-overview.png" alt="システム：6 つの入口（コマンドライン、Python、WebAssembly と npm と Kshana Studio、プラグインとスキルを備えた MCP サーバー、JetBrains プラグイン、統合）はすべて、すべてのシナリオ種別にわたる 1 つのディスパッチを呼び出します。ディスパッチは、共有のコア、センサーパックと座標系、ドメインモデルからなる 1 つのエンジンを実行し、再現可能な結果とチャートを書き出します" width="900"><br>
  <sub>1 つのディスパッチ、1 つのエンジン、再現可能な出力 · <a href="docs/assets/diagrams/system-overview.svg">SVG</a> · ソース <a href="docs/diagrams/system-overview.mmd">system-overview.mmd</a></sub>
</p>

<p align="center">
  <img src="docs/assets/diagrams/surfaces.png" alt="サーフェス：1 つの決定論的なオフラインのエンジンが、コマンドライン、Rust ライブラリ、Python、WebAssembly と npm、MCP サーバーに供給します。Studio は WebAssembly のビルドの上で、プラグインのコマンドとスキルは MCP サーバーの上で、統合とデプロイキットはコマンドラインの上で、JetBrains プラグインはライブラリの上で動作します" width="900"><br>
  <sub>同じエンジンからのすべてのサーフェス · <a href="docs/assets/diagrams/surfaces.svg">SVG</a> · ソース <a href="docs/diagrams/surfaces.mmd">surfaces.mmd</a></sub>
</p>

<p align="center">
  <img src="docs/assets/diagrams/engine-flow.png" alt="1 回の実行の内部：シードと GNSS のタイムラインを持つシナリオファイルがエンジンに入力され、エンジンは時間ステップごとに誤差モデルを発展させ、推定器を実行し、性能指標をスコアリングし、再現可能な結果とチャートを書き出します" width="900"><br>
  <sub>実行の内側のループ · <a href="docs/assets/diagrams/engine-flow.svg">SVG</a> · ソース <a href="docs/diagrams/engine-flow.mmd">engine-flow.mmd</a></sub>
</p>

<p align="center">
  <img src="docs/assets/diagrams/trust-flow.png" alt="受信機の信頼性：受信機のログまたはストリームを、エポックごとの観測量と受信機自身のフラグとして取り込み、モニターを通過させ、帯域と理由を伴う助言用の信頼スコアにします。信頼スコアは Studio、テレメトリー、署名付きのエビデンスパック、Jammertest とベンチのスコアリング、コンプライアンスレポートに入力されます" width="900"><br>
  <sub>受信機ログから信頼スコアへ、そしてそれを使うもの · <a href="docs/assets/diagrams/trust-flow.svg">SVG</a> · ソース <a href="docs/diagrams/trust-flow.mmd">trust-flow.mmd</a></sub>
</p>

<p align="center">
  <img src="docs/assets/diagrams/lab-round-trip.png" alt="ラボのラウンドトリップ：シナリオをそのイベントと試験条件とともにエクスポートし、Kshana の外部の運用者がラボのシミュレーターでファイルを再生し、受信機ログを明示したイベントに対してスコアリングし、エビデンスのラウンドトリップがシナリオ、条件、ログのハッシュとスコアを署名付きのパックに結び付けます" width="420"><br>
  <sub>シナリオから署名付きのパックへ。Kshana は信号を生成も再生もしません · <a href="docs/assets/diagrams/lab-round-trip.svg">SVG</a> · ソース <a href="docs/diagrams/lab-round-trip.mmd">lab-round-trip.mmd</a></sub>
</p>

<p align="center">
  <img src="docs/assets/diagrams/studio-flow.png" alt="Kshana Studio：ブラウザーは WebAssembly にコンパイルされたエンジンを、何もアップロードせずにローカルで実行し、同梱のシナリオまたは開いたシナリオやログを受け取り、結果をシンプルビュー、詳細ビュー、タスクのページで表示します。エクスポートは利用者が保存します" width="900"><br>
  <sub>Studio のローカルでの動作 · <a href="docs/assets/diagrams/studio-flow.svg">SVG</a> · ソース <a href="docs/diagrams/studio-flow.mmd">studio-flow.mmd</a></sub>
</p>

<p align="center">
  <img src="docs/assets/diagrams/release-flow.png" alt="テストとリリースの流れ：ローカルのゲート（フォーマット、clippy、帰属表示なしのチェック、ドキュメントカバレッジのラチェット、そしてフルスイートと反復実行を実行し、pre-push フックが確認するレシートを書き出す scripts/gate.sh）から、CI のみのプルリクエストとグリーンのフル CI へ進みます。所有者は main をグリーンのコミットへ早送りし、バージョン同期のチェックの後に注釈付きタグがそこに付きます。リリースのワークフローは、何かを公開する前にタグ付きのコミットでフルスイートを検証し、SBOM、チェックサム、ビルドの来歴とともにバイナリをビルドし、crates.io、PyPI、npm、コンテナレジストリ、MCP レジストリ、JetBrains Marketplace に公開し、各レジストリが新しいバージョンを提供するまでポーリングし、タグからサイトのビルドを起動します。サイトのみの別経路は、タグ main で pages のワークフローを起動し、最新のリリース以降に web/ と .github/ 以外が何も変更されていない場合を除いて拒否されます" width="900"><br>
  <sub>ローカルのゲートから検証済みのリリースまでのテストとリリースの流れ、およびサイトのみの経路 · <a href="docs/assets/diagrams/release-flow.svg">SVG</a> · ソース <a href="docs/diagrams/release-flow.mmd">release-flow.mmd</a> · <a href="docs/RELEASING.md">docs/RELEASING.md</a></sub>
</p>

<p align="center">
  <img src="docs/assets/diagrams/module-map.png" alt="モジュールマップ：コマンドライン、Python、WebAssembly、MCP サーバー、JetBrains プラグインは、すべての種別にわたる型付きのディスパッチを呼び出し、ディスパッチは共有のコア、時刻と座標系、センサーパック、アストロダイナミクス、インテグリティ、スプーフ検出、融合、深宇宙と月、レジリエンス、審判とベンチマークのモジュールに到達します。すべては検証マトリクスによって裏付けられています" width="1000"><br>
  <sub>コードの所在 · <a href="docs/assets/diagrams/module-map.svg">SVG</a> · ソース <a href="docs/diagrams/module-map.mmd">module-map.mmd</a></sub>
</p>

<p align="center">
  <img src="docs/assets/diagrams/distribution.png" alt="配布：1 つのリポジトリから、コアのクレート、MCP サーバー、IDE プラグイン、クロスチェック用のクレートを、crates.io、PyPI、npm、GitHub Releases、Pages のプレイグラウンド、コンテナレジストリ、MCP レジストリ、JetBrains Marketplace に提供し、Zenodo にアーカイブします" width="900"><br>
  <sub>何がどこに提供され、何がそれを確認するか · <a href="docs/assets/diagrams/distribution.svg">SVG</a> · ソース <a href="docs/diagrams/distribution.mmd">distribution.mmd</a></sub>
</p>

<a id="ai-assistant"></a>
## AI アシスタント

[`kshana-mcp`](mcp/kshana-mcp/) は MCP サーバーです：アシスタントは数式を推測する代わりに、実際のエンジンを実行して
その JSON を読み取ります。49 のツールはそれぞれ `kshana` ライブラリの公開関数の薄いラッパーであり、
シミュレーションのロジックはサーバー内にはありません。

### MCP サーバーのインストール

> 助言用であり、型式承認を受けた航法装置ではありません：航法の責任は引き続き運用者にあります。
> サーバーはお使いのコンピューター上で動作し、Ashforde OÜ には何も送信されません。

どのチャネルでも選べます。すべてのリンクとスニペットは 1 つのスクリプト
（`scripts/gen_mcp_install.py`）から生成され、継続的インテグレーションで確認されます。Claude Desktop、
Claude Code、Cursor、VS Code、Windsurf、Zed、Goose、Codex CLI、Gemini CLI、Continue 向けのスニペットは
[`docs/MCP-INSTALL.md`](docs/MCP-INSTALL.md) にあります。

<!-- mcp-install:begin -->
| チャネル | コマンドまたはボタン | 必要なもの | 固定した形式 |
|---|---|---|---|
| Claude Desktop 拡張機能 | お使いのシステム用の `.mcpb` をダブルクリック：[macOS（Apple シリコン）](https://github.com/ashfordeOU/kshana/releases/download/v0.40.0/kshana-mcp-aarch64-apple-darwin.mcpb) · [macOS（Intel）](https://github.com/ashfordeOU/kshana/releases/download/v0.40.0/kshana-mcp-x86_64-apple-darwin.mcpb) · [Windows](https://github.com/ashfordeOU/kshana/releases/download/v0.40.0/kshana-mcp-x86_64-pc-windows-msvc.mcpb) | なし | v0.40.0 の `kshana-mcp-<target>.mcpb` |
| Cursor（ワンクリック） | [npx（Node）](https://cursor.com/en/install-mcp?name=kshana&config=eyJjb21tYW5kIjoibnB4IiwiYXJncyI6WyIteSIsImtzaGFuYS1tY3BAMC40MC4wIl19) · [Docker](https://cursor.com/en/install-mcp?name=kshana&config=eyJjb21tYW5kIjoiZG9ja2VyIiwiYXJncyI6WyJydW4iLCItaSIsIi0tcm0iLCJnaGNyLmlvL2FzaGZvcmRlb3Uva3NoYW5hLW1jcDowLjQwLjAiXX0%3D) | Node または Docker | `kshana-mcp@0.40.0` / `ghcr.io/ashfordeou/kshana-mcp:0.40.0` |
| VS Code（ワンクリック） | [npx（Node）](https://insiders.vscode.dev/redirect?url=vscode%3Amcp%2Finstall%3F%257B%2522name%2522%253A%2522kshana%2522%252C%2522command%2522%253A%2522npx%2522%252C%2522args%2522%253A%255B%2522-y%2522%252C%2522kshana-mcp%25400.40.0%2522%255D%257D) · [Docker](https://insiders.vscode.dev/redirect?url=vscode%3Amcp%2Finstall%3F%257B%2522name%2522%253A%2522kshana%2522%252C%2522command%2522%253A%2522docker%2522%252C%2522args%2522%253A%255B%2522run%2522%252C%2522-i%2522%252C%2522--rm%2522%252C%2522ghcr.io%252Fashfordeou%252Fkshana-mcp%253A0.40.0%2522%255D%257D) · [Insiders（npx）](https://insiders.vscode.dev/redirect?url=vscode-insiders%3Amcp%2Finstall%3F%257B%2522name%2522%253A%2522kshana%2522%252C%2522command%2522%253A%2522npx%2522%252C%2522args%2522%253A%255B%2522-y%2522%252C%2522kshana-mcp%25400.40.0%2522%255D%257D) | Node または Docker | `kshana-mcp@0.40.0` / `ghcr.io/ashfordeou/kshana-mcp:0.40.0` |
| Claude Code | `claude mcp add kshana -- npx -y kshana-mcp@0.40.0` · プラグイン：`/plugin marketplace add ashfordeOU/kshana` の後に `/plugin install kshana@ashforde` | Node（または Docker） | `kshana-mcp@0.40.0` |
| npx | `npx -y kshana-mcp@0.40.0` | Node 18+ | `kshana-mcp@0.40.0` |
| uvx / pipx | `uvx kshana-mcp==0.40.0` · `pipx run kshana-mcp==0.40.0` | uv または pipx を備えた Python 3.9+ | `kshana-mcp==0.40.0` |
| Docker | `docker run -i --rm ghcr.io/ashfordeou/kshana-mcp:0.40.0` | Docker | `ghcr.io/ashfordeou/kshana-mcp:0.40.0` |
| Homebrew | `brew install ashfordeOU/tap/kshana-mcp` | brew | v0.40.0 の formula |
| Scoop | `scoop bucket add ashforde https://github.com/ashfordeOU/scoop-bucket` の後に `scoop install kshana-mcp` | Scoop（Windows） | v0.40.0 のマニフェスト |
| winget | `winget install AshfordeOU.KshanaMcp` | winget（Windows） | `--version 0.40.0` |
| cargo | `cargo install kshana-mcp --version 0.40.0` | Rust 1.88+ | `kshana-mcp 0.40.0` |
| ビルド済みバイナリ | [リリースページ](https://github.com/ashfordeOU/kshana/releases/tag/v0.40.0)：`kshana-mcp`（Linux x86-64）、`kshana-mcp-<target>[.exe]`。`SHA256SUMS` と `gh attestation verify` で確認 | なし | v0.40.0 |
| MCP レジストリ | `io.github.ashfordeOU/kshana-mcp`（レジストリ対応のクライアントが検出） | レジストリ対応のクライアント | `0.40.0` |
| リモート（streamable HTTP） | `kshana-mcp --http 127.0.0.1:8080`、セルフホスト：[docs/deploy/mcp-http.md](docs/deploy/mcp-http.md) を参照 | 自前のホスト | v0.40.0 |
<!-- mcp-install:end -->

<p><a href="https://glama.ai/mcp/servers/ashfordeOU/kshana"><img src="https://glama.ai/mcp/servers/ashfordeOU/kshana/badges/score.svg" alt="Glama 上の kshana-mcp とその MCP サーバーの品質スコア"></a></p>

Claude Code では、同じサーバーがプラグインとして提供されます：`/plugin marketplace add ashfordeOU/kshana` の後に
`/plugin install kshana@ashforde`。プラグインはツールの上にスラッシュコマンドを追加します：`/kshana-run`、
`/kshana-assess-receiver`、`/kshana-evidence-pack`、`/kshana-interference-map`、
`/kshana-training-scenario`、`/kshana-bench-export`、`/kshana-compliance-report`、`/kshana-iq`、
`/kshana-import-route`、`/kshana-marine-integrations`、`/kshana-jammertest`。船舶の信頼性のツールは Signal K と
OpenCPN の統合に入力されます：[`docs/MARINE-INTEGRATIONS.md`](docs/MARINE-INTEGRATIONS.md)。

クライアントごとのセットアップは [`docs/integrations.md`](docs/integrations.md) にあります。サーバーは
公式の MCP レジストリに `io.github.ashfordeOU/kshana-mcp` として登録されています。

<details>
<summary>49 のツール</summary>

<br>

**シナリオとレポート**

| ツール | 機能 |
|---|---|
| `run_scenario` | TOML（Tom's Obvious, Minimal Language）の定義からシナリオを実行 |
| `list_scenario_kinds` | 92 の組み込みシナリオ種別を、説明 + 必須/任意のフィールドとともに返す — エージェントが有効なシナリオを構築できるように |
| `validate_scenario` | 事前チェック：実行せずに TOML を解析し、その種別を検出 |
| `list_example_scenarios` | 同梱の参照シナリオを JSON で返す |
| `get_example_scenario` | 同梱の参照シナリオ 1 つの TOML テキストを、`scenarios/` 以下のファイルとバイト単位で同一のまま返す |
| `report_scenario` | シナリオを実行し、そのレポートを返す |
| `animate_scenario` | シナリオを実行し、その時系列をアニメーションとして返す |
| `sky_geometry` | 方位に依存するスカイラインの下での天空の幾何配置：可視および遮蔽された衛星、DOP、東・北・上の共分散、水平誤差楕円。またはスカイラインのプリセットとその来歴 |

**エクスポートと相互運用性**

| ツール | 機能 |
|---|---|
| `list_export_formats` | シナリオにどの相互運用形式（`czml`、`kml`、`geojson`、`stk`、`sigmf`）が適用されるか、適用されない場合の理由、各ライターが従う仕様 |
| `export_interop` | シナリオを CZML（Cesium Language）、KML（Keyhole Markup Language）、GeoJSON、STK（Systems Tool Kit）のエフェメリス `.e`、または SigMF（Signal Metadata  |
| `import_route` | GeoJSON の `LineString` のルートを、ウェイポイントの航跡を飛行するシナリオ（`terrain-nav`、`terrain-slam`、`gravity-map`、`combined-altpnt`）に書き込み、新しい TOML を返す |
| `export_sp3` | `orbit` シナリオのコンステレーションを SP3-c（Standard Product 3、改訂 c）の精密エフェメリスとしてエクスポート |
| `export_omm` | `orbit` シナリオの要素を CCSDS（Consultative Committee for Space Data Systems）502.0-B-2 の OMM（Orbit Mean-elements Message）カタログとしてエクスポート |
| `export_oem` | `orbit` シナリオの状態系列を CCSDS OEM（Orbit Ephemeris Message）2.0 のエフェメリスとしてエクスポート — TEME（真赤道・平均春分点）の位置 *と*  |
| `export_table_csv` | シナリオを実行し、その再現性の表を CSV（カンマ区切り値）として返す — CLI（コマンドラインインターフェース）が `<scenario>.table.csv` として書き出す、バイト単位で安定した表 |
| `export_test_bench` | ラボの GNSS シミュレーター向けのシナリオの車両運動とイベント（`kshana bench-export`） |

**受信機と船舶の信頼性**

| ツール | 機能 |
|---|---|
| `assess_receiver_log` | 実際の GNSS（全地球航法衛星システム）受信機ログの信頼性を評価 |
| `assess_vessel_stream` | 範囲を限定した NMEA 0183 の抜粋（最大 2 MiB、20,000 エポック |
| `assess_vessel_log` | 船舶の NMEA 0183 ログ（最大 4 MiB）をバッチ実行で評価。船舶の制限値はセッションの TOML で指定 |
| `create_evidence_pack` | 船舶のログのウィンドウに対する署名付きのエビデンスパック（`kshana receiver-trust evidence`） |
| `attach_evidence_timestamp` | RFC 3161 のタイムスタンプトークン（`.tsr` のバイト列の base64）をメモリ上でパックに結び付ける（`kshana evidence attach-timestamp`） |
| `verify_evidence_pack` | パックを検証（`kshana evidence verify`） |
| `generate_training_nmea` | `nmea-scenario` の TOML（ジャミング、位置のドラッグオフ、時刻スプーフ、リプレイ遅延）から、乗組員訓練のための合成の船橋 NMEA 0183 を教官用ログ（`kshana-nmea-training/1`）とともに生成 |
| `build_interference_map` | CSV テキスト（最大 4 MiB）の ADS-B または AIS の位置報告から GNSS 干渉マップを作成 |
| `route_exposure` | 1 つ以上の干渉マップの劣化、劣化なし、未評価、未観測のセルにルートの長さが占める割合。任意で日付範囲内に限定 |
| `trust_telemetry` | 信頼のストリーム（JSON lines）または `receiver-trust` の結果を、`kshana trust-telemetry` のエンコーダーで Prometheus テキスト、CEF または LEEF の syslog 行、OTLP の JSON ペイロードとして出力 |
| `jammertest_import` | 公開されている Jammertest の試験カタログと送信計画（NPRA/jammertest-plan、MIT）を予定された真値として読み込む（`kshana jammertest import`）：1 つの試験エリアのスロットが、各ラベルにカタログの id と年を持つ受信機信頼性のイベントになります。計画されたスロットであり、記録された実際の送信時刻ではありません。計画の連絡先フィールドは読み込みません。MODELLED。[`docs/JAMMERTEST.md`](docs/JAMMERTEST.md) を参照。 |
| `jammertest_score` | そのスケジュールに対して受信機ログをスコアリング（`kshana jammertest score`）：試験ごとの検出の遅延、見逃し、復帰までの時間、およびどのスロットにも属さない誤警報。テキストのログは `log` として、バイナリ（`ubx`、`sbf`）は `log_base64` として渡します。署名付きのパックには鍵が必要です：コマンドラインを使用。助言用のみ。MODELLED。 |
| `fit_imu_log` | 静止状態の IMU ログ（CSV または EuRoC）から Allan 偏差によってフィットした、`hybrid` と `fusion` のシナリオの加速度計とジャイロのパラメーター。そのまま貼り付けられる `[accel_classical]` の表とログの SHA-256 付き（`kshana imu-fit`）。テキストを入力し、JSON を出力。MODELLED。 |

**GNSS IQ（作業ディレクトリのファイル。HTTP モードでは無効）**

| ツール | 機能 |
|---|---|
| `iq_signals` | GNSS IQ 層の設定 |
| `iq_info` | 作業ディレクトリ内の 1 つの IQ（同相と直交）記録を、処理せずに記述 |
| `iq_scene` | 作業ディレクトリにマルチ衛星の GNSS IQ シーンを生成（`kshana iq scene`） |
| `iq_acquire` | 記録に対する 1 つ以上の PRN（擬似ランダム雑音コード）の FFT（高速フーリエ変換）による捕捉（`kshana iq acquire`）。任意でフロントエンドの段の後に |
| `iq_track` | 捕捉した後、DLL/PLL/FLL（遅延、位相、周波数ロックループ）のバンクで追尾（`kshana iq track`）。ループは `kshana.loop-desig |
| `iq_frontend` | 受信機のフロントエンドと干渉緩和の DSP（デジタル信号処理 |
| `iq_sweep` | 作業ディレクトリ内の 1 つの IQ 記録を、複数の追尾ループ設計にわたって再生（`kshana iq sweep`） |
| `iq_monitor` | 作業ディレクトリ内の IQ 記録に対して、干渉とスプーフィングの検出モニターを実行（`kshana iq monitor`） |
| `iq_labfit` | ログをインライン（`text` または `base64`）で持つ `iq-labfit` シナリオから、追尾ループのロック喪失モデルをラボの実行にフィット（`kshana iq labfit`） |
| `iq_test_conditions` | テキストとして与えた `kshana.test-conditions/1` ファイルを検証し、解決した条件をそのハッシュとともに返す |
| `iq_campaign` | ラボでの再生キャンペーンを実行（`kshana iq campaign`） |
| `iq_campaign_status` | キャンペーンの出力フォルダーの進捗 |

**コンプライアンスのマッピング**

| ツール | 機能 |
|---|---|
| `compliance_report` | テキストとして与えた結果文書から埋めた、公開フレームワークとの対応付け（`kshana compliance-report`） |
| `compliance_mapping` | 静的な対応表（`sources` を指定した場合は、それらが引用するソース文書をバージョンと URL とともに）を、同じ記載を先頭に付けた Markdown で返す |
| `list_standards_packs` | 標準パック（`kshana standards-pack list`）：DHS Resilient PNT フレームワークの試験プロファイル、IMO MSC.1/Circ.1575、ICAO Doc 9849 Appendix F 向けのスコアリング済みシナリオセット |
| `run_standards_pack` | 実行前に明示した合格基準に対する 1 つのパックの実行：各試験は `MET`、`NOT MET`、`NEEDS INPUT` のいずれか。MODELLED であり、製品を評価しません |
| `lunanet_afs_check` | LNIS V5 AD1 Volume A（LSIS-AFS V1.0）に対して確認した LunaNet Augmented Forward Signal：印刷された表に対するコード、またはフレーム形式に対するシンボルストリーム。サブフレーム 2 から 4 の LDPC と CRC-24Q は検証しません |
| `create_round_trip_pack` | 署名付きのラボのラウンドトリップパック：シナリオ、`kshana.test-conditions/1` 文書、受信機ログ、スコアをハッシュで結び付けたもの |

**ベンチマーク**

| ツール | 機能 |
|---|---|
| `score_benchmark` | 真値ファイルに対してスコアリングした kshana-bench の提出物。どちらも JSON テキスト（`kshana bench score`、`bench/SPEC.md`）：仕様のバージョン、分割、入力のハッシュ、タスクの指標を含む結果ファイル。MODELLED。ログやコーパスを記述するものであり、製品を記述するものではありません。 |
| `render_leaderboard` | kshana-bench の結果ファイルを、それぞれ最初に検証したうえで、静的なリーダーボードのページ（HTML テキスト）として出力。 |

</details>

<a id="editions"></a>
## エディション

エンジン全体は無料です。Kshana Pro とカスタムの検討は、それ以上を必要とするプログラムのためのものであり、
有料の道はすべてメッセージから始まります：ここに価格は掲載していません。

| | Free | Kshana Pro | カスタムの検討 |
|---|---|---|---|
| 内容 | オープンなエンジン全体、92 のシナリオ種別すべて、機能の制限なし | 同じエンジンの上のプロプライエタリなオーバーレイ、契約に基づく | お客様のシステムの MODELLED な PNT レジリエンスの検討を、こちらで実施 |
| ライセンス | AGPL-3.0（GNU Affero General Public License、バージョン 3）、または商用ライセンス | プロプライエタリ | 契約 |
| 始め方 | [インストール](#install)するか [kshana.dev](https://kshana.dev) を開く | [Pro の評価を依頼](mailto:contact@ashforde.org?subject=Kshana%20Pro%20evaluation) | [検討を依頼](mailto:contact@ashforde.org?subject=Kshana%20custom%20study) |

Pro とは何か、[`docs/PRO.md`](docs/PRO.md) の言葉で：

> **オープンな Kshana の厳密な上位集合。** Pro はオープンなエンジンにライブラリとして依存し、
> 決してフォークしません。オープンなシナリオ種別はすべて Pro でそのまま動作し、オープンなシナリオは
> ライセンスなしで Pro で動作します。
>
> **新しい物理はありません。** Pro は物理モデルを追加せず、変更もしません。Pro のすべての数値は
> オープンなエンジンの実行から得られるため、Pro の数値の信頼性は、それが由来するオープンなシナリオ種別と同じであり、
> それを上回ることは決してありません。

Pro は、プログラムの次の問いに答えます：どの設計で飛ばすか（設計最適化器とその
パレートフロント）、答えがどれだけ確かか（不確かさと感度）、そしてミッションが
要求を満たすかどうか（ミッションドシエ、要求のトレーサビリティ、トレードスタディ、
シナリオの回帰チェック、時計のデジタルツイン、検討ドシエ、オンプレミスの
サービス）。また、一連の数値のキャンペーンを監視して、いずれかが悪化した場合にパイプラインを失敗させ、
候補の信号計画をオープンな衛星航法信号に対して双方向で試験し（スペクトルの共存）、
ハッシュチェーンの納品台帳を備えたオンプレミスのジョブサービスに検討をキューイングします。それぞれについて、何を生成し、何をしないかを
[`docs/PRO.md`](docs/PRO.md) に記載しています。Pro が生成するものはいずれも認証ではなく、カスタムの検討も
認証ではありません。

<details>
<summary>Kshana Pro がオープンなエンジンから読み取るもの、そして Ashforde® OÜ によるサポート</summary>

<br>

**Kshana Pro の土台。** Pro のすべての部分はオープンなエンジンを基に動作し、
エンジンを変更しません：

- **設計最適化器、不確かさの検討、ミッションドシエ** は、オープンなエンジンの
  シナリオをエンジンの公開インターフェースを通じて実行し、すべての数値を実行の
  結果から計算します。各出力は、オープンなエンジンが各数値に与えた VALIDATED、MODELLED、PARTNER の
  ティアを保持し、それより高いティアを付けることは決してありません。
- **時計のデジタルツイン** は、オープンなエンジンの時計モデルとその Allan 偏差の
  推定器を使います：ツインは機器の公表された Allan のバジェットにキャリブレーションされ、その後
  オープンな推定器でツインの Allan 偏差を推定して確認されます。
- **トレードスタディ** は、各アーキテクチャの選択肢をオープンなエンジンのシナリオとして変更せずに実行し、
  各実行の結果から読み取った性能指標で選択肢を順位付けします。
- **キャンペーンの監視** は、パック内のシナリオのオープンなエンジンによる実行の結果から
  数値を読み取り、前回合格した実行と比較します。
- **スペクトルの共存** は、すべての物理的な数値を `leo-signal` と `constellation-design` の
  種別のオープンなエンジンによる実行から読み取り、可視衛星にわたる総和と
  計画の順位付けだけを加えます。
- **オンプレミスのジョブサービス** は、オープンと Pro のシナリオを同じエンジンで実行し、
  各結果を実行が返したとおりに保存します。
- **エビデンスパック** は、各実行について、オープンなエンジンが結果に刻むシナリオのハッシュを
  記録するため、パック内の数値はそのシナリオを再実行して再現できます。
- **システムズエンジニアリングとプログラムのツール。** Kshana Pro のモデルベース
  システムズエンジニアリング（MBSE）とプログラムのツールは、プログラムの要求を
  オープンなエンジンの実行に対して確認します：要求をカンマ区切り値（CSV）として、
  あるいは Requirements Interchange Format（ReqIF）または
  Systems Modeling Language バージョン 2（SysML v2）のテキストの文書化されたサブセットとして取り込み、各受け入れ
  基準を、その単位とともに、実行が書き出した値に対して評価し、検証相互参照
  マトリクス（VCRM）、SysML v2 モデル、変更影響レポート、オフラインの
  エビデンスパックを生成します。何も再実行・再計算せず、オープンなエンジンが
  公開するものだけを読み取ります：各実行の `result.json`（基準が名指しするフィールド、その単位、
  シナリオのハッシュ、シード、エンジンのバージョン、スキーマのバージョンからなる再現性のスタンプ、そして
  実行のラベルと数値のティア）、`report.json`（種別、再現性の記録、
  機能のラベル）、シナリオファイル（そのハッシュ、種別、シード、パラメーター）、
  フィールド単位のスキーマ（各フィールドの単位、来歴、エビデンスのティア）、そして
  検証マトリクス（各機能の VALIDATED、MODELLED、PARTNER のラベル）。

<a id="support--professional-services"></a>
### サポートとプロフェッショナルサービス

Kshana は AGPL-3.0 の下で無料のオープンソースであり、**Ashforde® OÜ**（エストニア）**が専門的に開発・
保守しています**。オープンなエンジンはそれだけで完結しており、単独で使えます。
それ以上を必要とする組織向けに、Ashforde® OÜ は次のものを提供しています：

- **商用サポートと統合** — お客様のツールチェーンへの Kshana の組み込み、カスタムの
  シナリオ、優先的な修正。
- **カスタムのセンサーモデル** — お客様のハードウェアにキャリブレーションしたもので、プライベートなオーバーレイで
  保守する輸出規制に関わるレジリエンスのモデルを含みます。
- **Kshana Pro** — プロプライエタリなモデルベースシステムズエンジニアリング（MBSE）とプログラムの
  ツールで、プログラムの要求をオープンなエンジンの実行に対して確認し、
  検証相互参照マトリクス（VCRM）、Systems Modeling Language
  バージョン 2（SysML v2）のモデル、変更影響レポート、オフラインのエビデンスパックを生成します。
  何も再実行せず、エンジンが公開する出力だけを読み取ります：各実行の `result.json`
  と `report.json`、シナリオファイル、フィールド単位のスキーマ、検証
  マトリクスのラベル（完全な一覧は[エディション](#editions)にあります）。
- **Kshana Pro の設計、不確かさ、ミッションのツール** — 設計空間のパレートフロント、
  数千回の実行にわたる不確かさと感度、検証マトリクスと PDF を備えた 1 コマンドのミッション
  ドシエ。[`docs/PRO.md`](docs/PRO.md) を参照。
- **Kshana Pro のキャンペーン監視、スペクトルの共存、ジョブサービス** — 監視している数値が悪化すると
  失敗するパイプライン、オープンな衛星航法信号に対して双方向で試験する信号計画、
  ハッシュチェーンの納品台帳を備えたオンプレミスのジョブキュー。[`docs/PRO.md`](docs/PRO.md) を参照。
- 量子/古典の PNT 性能解析に関する**トレーニングとコンサルティング**。

これはオープンコアのモデルです：エンジンはオープンなライセンスであり、今後もそうあり続けます。事業を支えるのは
専門知識、サポート、プロプライエタリな拡張であり、ライセンス料ではありません。
連絡先 **contact@ashforde.org** · [ashforde.org](https://ashforde.org)。

</details>

<a id="research"></a>
## 研究

オープンなエンジンに基づく検討は arXiv で公開しています。それぞれが背後にあるエンジンのコマンドを示しているため、
その数値はコミット済みのシナリオまたは検討の例から再生成できます。

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/assets/readme/research-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/assets/readme/research-light.svg">
  <img src="docs/assets/readme/research-light.svg" alt="オープンなエンジンに基づく研究：arXiv の 6 本の論文。各カードには論文、その日付とカテゴリ、数値を再生成するエンジンのコマンドが示されています。同じ 6 本の論文が、リンクとコマンドとともに下の表にあります。" width="100%">
</picture>

| 論文 | 示していること | エンジンのコマンド |
|---|---|---|
| [*Anticipating the Optimism Gap: Predicting Distribution-Shift Degradation of RF-Impairment Detectors from In-Distribution Statistics*](https://arxiv.org/abs/2606.22054)<br><sub>arXiv:2606.22054 · [doi:10.48550/arXiv.2606.22054](https://doi.org/10.48550/arXiv.2606.22054)</sub> | 条件がシフトしたときの GNSS 干渉検出器のスコアの低下は、分布内の統計量だけから予測できることを、オープンな合成テストベッドで、続いてオープンなフィールド記録で示します。 | `cargo run --release --example optimism_study -- paper-artifacts/optimism-study.json` |
| [*A Conditional Timing Protection Level: Holdover-Limited Undetected Time Error Under GNSS Spoofing*](https://arxiv.org/abs/2606.24210)<br><sub>arXiv:2606.24210 · [doi:10.48550/arXiv.2606.24210](https://doi.org/10.48550/arXiv.2606.24210)</sub> | スプーフィング下の GNSS タイミング受信機には、検出されない時刻誤差に対する有限の無条件の境界がないため、この論文は条件付きの境界を、公開されている JammerTest 2024 キャンペーンで記録された実際の電波によるスプーフでキャリブレーションして示します。 | `cargo run --release --example tpl_jammertest` |
| [*How Stable Is a PNT Resilience Score? Decision-Instability of Single-Number Resilience Ratings under Framework-Aligned Weighting*](https://arxiv.org/abs/2607.05415)<br><sub>arXiv:2607.05415 · [doi:10.48550/arXiv.2607.05415](https://doi.org/10.48550/arXiv.2607.05415)</sub> | 単一の複合レジリエンススコアが判断の安定した根拠となるのは、1 つの設計が支配的な場合だけです。設計が拮抗している場合、重み付けを変えるだけで勝者が変わりうります。 | `cargo run --release --example resilience_report -- paper-artifacts/resilience-study.json` |
| [*Earth-baseline VLBI restores the observability of a lunar surface station in joint orbit-and-clock determination*](https://arxiv.org/abs/2607.02566)<br><sub>arXiv:2607.02566 · [doi:10.48550/arXiv.2607.02566](https://doi.org/10.48550/arXiv.2607.02566)</sub> | 月のコンステレーション内部の測距だけでは表面局の絶対位置は観測できません。地球からの超長基線電波干渉法（VLBI）の遅延は、コンステレーションが疎な場合には可観測性を回復し、豊富な場合にはそれを鋭くします。 | `lunar-joint-od-clock` 種別：`kshana example lunar-joint-od-clock > s.toml && kshana s.toml` |
| [*The Cost of Lunar South-Polar Geometry, and Surface Beacons as the Efficient Fix: A Dilution-of-Precision Analysis*](https://arxiv.org/abs/2607.06212)<br><sub>arXiv:2607.06212 · [doi:10.48550/arXiv.2607.06212](https://doi.org/10.48550/arXiv.2607.06212)</sub> | 計画されている 4 から 6 機の衛星からなるコンステレーションは、月の南極で悪い幾何配置を与えます。少数の表面測距ビーコンは、衛星を増やすよりはるかに安価にこれを解決します。 | `lunar-beacon` 種別：`kshana example lunar-beacon > s.toml && kshana s.toml` |
| [*Cislunar navigation is an observability problem: arc-length thresholds, Gramian conditioning, and the Doppler lever*](https://arxiv.org/abs/2610.23871)<br><sub>arXiv:2610.23871 · [doi:10.48550/arXiv.2610.23871](https://doi.org/10.48550/arXiv.2610.23871)</sub> | 距離のみのシスルナ追跡では、スナップショットでは速度が観測できないため精度低下率は定義されません。そこでこの論文は 4 つの平面の遠方逆行軌道で可観測性グラミアンを使います：距離のみではスナップショットで階数は 4 のうち 2 であり、完全に観測可能になるには約 2.09 h のアークが必要で、アークが長くなるにつれて条件数が改善します。距離変化率（ドップラー）は即座に階数 4 を与えます。そして局を衛星の状態と時計と同時に推定すると、外部の干渉計による観測量を加えない限り階数が 1 不足したままです。要求は DOP ではなく、アーク長、条件数、測定の種類のバジェットで定めるべきです。 | `cislunar-observability` 種別：`kshana scenarios/cislunar-observability.toml`（兄弟種別の `cislunar-arc-recovery` は、独立した有限差分の推定器で閾値を試験します） |

3 つの検討の例は、エンジンのバージョン、シード、設定のハッシュを記録した、バイト単位で決定論的な成果物（固定シード）を
書き出します。月とシスルナに関する 3 本の論文は
月のスイートに基づいています（各要素のエビデンスのティアは検証マトリクスにあります）。その幾何配置と精度低下率に関する主張は、
`tests/validate_p*.rs` で別のオラクルに対してもクロスチェックしています。詳細はリファレンスの
[再現可能な検討成果物](#reproducible-study-artifacts)にあります。

<a id="cite"></a>
## 引用

学術的または技術的な成果で Kshana を使用した場合は、使用したバージョンを、シナリオとシードとともに
引用してください。[`CITATION.cff`](CITATION.cff) に機械可読なメタデータがあり、
GitHub はそこから「Cite this repository」ボタンを表示します。すべてのリリースは Zenodo にアーカイブされています。
コンセプト DOI（デジタルオブジェクト識別子）
[10.5281/zenodo.20528627](https://doi.org/10.5281/zenodo.20528627) は常に
最新のバージョンを指します。

> Baweja, C. (2026). *Kshana — a PNT-resilience simulator with quantum-sensor performance models*. [Ashforde OÜ](https://ashforde.org). https://doi.org/10.5281/zenodo.20528627

上記の論文：

> Baweja, C. (2026). *Anticipating the Optimism Gap: Predicting Distribution-Shift Degradation of RF-Impairment Detectors from In-Distribution Statistics*. arXiv:2606.22054. https://doi.org/10.48550/arXiv.2606.22054
>
> Baweja, C. (2026). *A Conditional Timing Protection Level: Holdover-Limited Undetected Time Error Under GNSS Spoofing*. arXiv:2606.24210. https://doi.org/10.48550/arXiv.2606.24210
>
> Baweja, C. (2026). *How Stable Is a PNT Resilience Score? Decision-Instability of Single-Number Resilience Ratings under Framework-Aligned Weighting*. arXiv:2607.05415. https://doi.org/10.48550/arXiv.2607.05415
>
> Baweja, C. (2026). *Earth-baseline VLBI restores the observability of a lunar surface station in joint orbit-and-clock determination*. arXiv:2607.02566. https://doi.org/10.48550/arXiv.2607.02566
>
> Baweja, C. (2026). *The Cost of Lunar South-Polar Geometry, and Surface Beacons as the Efficient Fix: A Dilution-of-Precision Analysis*. arXiv:2607.06212. https://doi.org/10.48550/arXiv.2607.06212
>
> Baweja, C. (2026). *Cislunar navigation is an observability problem: arc-length thresholds, Gramian conditioning, and the Doppler lever*. arXiv:2610.23871. https://doi.org/10.48550/arXiv.2610.23871

<a id="licence"></a>
## ライセンス

Kshana はデュアルライセンスです：GNU **AGPL-3.0-only**（[`LICENSE`](LICENSE)）、または AGPL が適さないクローズドな統合のための
Ashforde® OÜ による **商用ライセンス** です。
どちらが適用されるかは [`LICENSING.md`](LICENSING.md) で説明しています。コントリビューションは AGPL の下で
インバウンドライセンスされ、さらに Ashforde® OÜ に商用エディションにそれらを含める権利を付与します。
各コミットには `git commit -s` で署名してください（[`CONTRIBUTING.md`](CONTRIBUTING.md) を参照）。
「Kshana」とそのマークは Ashforde® OÜ の商標です：ライセンスはコードを対象とし、名前は
対象としないため、フォークには別の名前を付けてください。

<a id="reference"></a>
## リファレンス

長い資料を折りたたんでいます。すべての文書は[ドキュメント](#documentation)に一覧があります。

<details>
<summary>ソースからのインストールとビルド</summary>

<a id="install--build"></a>
### インストールとビルド

Rust のツールチェーン（≥ 1.88、Cargo.toml の `rust-version`。開発は 1.93 で実施）が必要です。

```bash
git clone https://github.com/ashfordeOU/kshana
cd kshana
cargo build --release
cargo test          # all tests pass
```

</details>

<details>
<summary>使い方：コマンドラインの全容</summary>

### 使い方

任意のシナリオを実行できます。CLI はシナリオの `kind` フィールドに基づいてディスパッチし、
`<scenario>.result.json`、`<scenario>.chart.svg`、`<scenario>.report.html`、
`<scenario>.report.json` をその横に書き出します — 表を公開する種別では `<scenario>.table.csv` も
書き出します。レポート（HyperText Markup Language（HTML）のページと、同じ内容の JSON 文書）
には、エグゼクティブサマリー、単位付きのすべての入力、
結果とチャート、キャンペーンのスイープ、モンテカルロ、チェーンの表、イベントのタイムライン、
実行が使用した各機能の VALIDATED / MODELLED / PARTNER のラベルと出典、
モデル化していないもの、そして再現性の記録（エンジンのバージョン、Secure Hash
Algorithm 256-bit（SHA-256）のダイジェスト、シード、プラットフォーム、正確なコマンド）が含まれます。ブラウザーから
A4 またはレターサイズの用紙に、きれいな PDF（Portable Document Format）ファイルとして印刷できます。
エンジン自体は PDF を書き出しません。[`docs/REPORTS.md`](docs/REPORTS.md) を参照してください。

```bash
cargo run -- scenarios/clock-holdover.toml
cargo run -- scenarios/imu-deadreckoning.toml
cargo run -- scenarios/timetransfer.toml
cargo run -- scenarios/hybrid-pnt.toml
cargo run -- scenarios/orbit-gnss-challenged.toml
cargo run -- scenarios/orbit-sgp4-gps.toml
cargo run -- scenarios/orbit-rinex.toml
cargo run -- scenarios/integrity-raim.toml

# Export a propagated constellation to an SP3-c precise-ephemeris file:
cargo run -- scenarios/orbit-sgp4-gps.toml --export-sp3 gps.sp3

# Export the constellation's mean elements to a CCSDS OMM catalogue (one OMM
# message per TLE-defined satellite, with its real NORAD id / COSPAR designator):
cargo run -- scenarios/orbit-sgp4-gps.toml --export-omm gps.omm

# Export the velocity-carrying state to a CCSDS OEM 2.0 ephemeris (GMAT/Orekit/STK):
cargo run -- scenarios/orbit-sgp4-gps.toml --export-oem gps.oem

# Export the geometry for a globe, a map or a mission-analysis tool: CZML, KML,
# GeoJSON, STK .e, or SigMF for the spectrum kind (every format that applies):
cargo run -- scenarios/jamming-demo.toml --export all
```

`--export <czml|kml|geojson|stk|sigmf|all|list>` は、CZML（Cesium Language）、KML
（Keyhole Markup Language）、GeoJSON（Request for Comments 7946）、Ansys STK（Systems Tool Kit）の `.e`
エフェメリス、SigMF（Signal Metadata Format）の記録をシナリオの横に書き出し、
`--import-route <route.geojson>` は GeoJSON の線を航跡を飛行する種別に入力します。各
形式は公表された仕様に対して検証しており、ある形式が適用されないシナリオでは
その理由を示します：[docs/INTEROP.md](docs/INTEROP.md) を参照してください。

**その他の CLI モード** — シナリオの検査、実際の地球姿勢データの入力、スイート全体の実行：

```bash
# Lint a scenario without running it (checks the kind + required fields):
cargo run -- --validate scenarios/integrity-raim.toml

# Feed a real IERS Earth-orientation file (finals2000A) for frame precision:
cargo run -- scenarios/orbit-sgp4-gps.toml --eop tests/fixtures/agency/eop/finals2000A_2022001.txt

# Run a SUITE of scenarios into one aggregated, stamped study artifact
# (writes <suite>.study.json + <suite>.study.html next to the manifest):
cargo run -- --study scenarios/quantum-pnt-demonstrator.suite.toml

# Animate a run's time series: an animated SVG, a self-contained HTML player, and a
# numbered SVG frame sequence with manifest.json (see docs/ANIMATION.md):
cargo run -- scenarios/campaign-jam-spoof-holdover-integrity.toml --animate all
```

**アニメーションのエクスポート。** `--animate svg|html|frames|all` は、`<scenario>.animation.svg`
（Cascading Style Sheets（CSS）のキーフレーム、スクリプトなし）、`<scenario>.animation.html`（再生、一時停止、シーク、速度、
同期したパネルを備え、外部のアセットなし）、`<scenario>.frames/`（`frame_0000.svg`、… と、
1 秒あたりのフレーム数と長さを記した `manifest.json`）を書き出します。キャンペーンはそのフェーズと
警報を、スペクトルの実行はそのウォーターフォールを再生します。テーマは `prefers-color-scheme` に従い、
`prefers-reduced-motion` では完成した図を表示します。実行自身のサンプルを描画し、
再実行してもバイト単位で同一であり、エビデンスを追加するものではありません。[docs/ANIMATION.md](docs/ANIMATION.md) を参照してください。

**スイート** のマニフェストは小さな TOML（Tom's Obvious, Minimal Language）ファイルです — `title` と、シナリオのパスからなる
`scenarios = [ … ]` 配列 — エンジンはそれらを順に実行し、すべての結果（その
MODELLED / VALIDATED のラベル付き）を 1 つの自己記述的な検討成果物にまとめます。
[`scenarios/quantum-pnt-demonstrator.suite.toml`](scenarios/quantum-pnt-demonstrator.suite.toml) を参照してください。

**相互運用における役割。** Kshana は後処理のツールチェーンの横に位置する *性能シミュレーション* の層であり、
その置き換えではありません：その **RINEX** の出力を
RTKLIB や gLAB に入力して位置解を得たり、その **SP3** の出力を Ginan のようなツールの
精密軌道プロダクトとして使ったりします — Kshana は、実際の信号を手にする前に、*ある
PNT アーキテクチャがどれだけのレジリエンスをもたらすか* に、それらのツールがすでに
取り込める形式で答えます（`--export-sp3`、または `orbit` シナリオの `export_sp3 = true` で
`<scenario>.sp3` を書き出します）。同じ軌道を、標準化トラックの **CCSDS OMM** の
平均要素として公開することもできます（`--export-omm`、または `export_omm = true` で `<scenario>.omm` を書き出します）—
TLE で定義された衛星ごとに 1 つの OMM 502.0 KVN（キーワード = 値の表記）メッセージで、各物体の実際の
NORAD（North American Aerospace Defense Command）カタログ番号、COSPAR（Committee
on Space Research）国際識別符号、エポックを持ち、独自の 2 行軌道要素ではなく、
OMM に対応したあらゆる利用者が使えます。

出力の例（時計のホールドオーバー — インテグリティとセキュリティの性能指標がどのように報告されるかに注意してください）：

```
scenario 5ba83a232b94 | quantum holdover 6600s p95 1.20e-4ns integrity 1.000 security n/a (no attack) | classical holdover 2610s p95 19.7ns integrity 1.000 security n/a (no attack)
wrote scenarios/clock-holdover.result.json, scenarios/clock-holdover.chart.svg, scenarios/clock-holdover.report.html, and scenarios/clock-holdover.report.json
```

光時計の 95 パーセンタイル（p95）のタイミング誤差は 1.20e-4 ns です：サマリーは
小さな値を `0.0` に丸めずに有効数字で出力します。
このシナリオは攻撃を設定していないため検出するものがなく、`security` は `n/a (no attack)` と
表示されます。JSON の結果には、`fom.security` に各時計の解析的な
スプーフ検出可能性の境界が引き続き含まれており（光時計は 0.997、
チップスケール原子時計は 0.000。後者は監視ウィンドウにわたる自身の雑音が 20 ns の
仕様を超えるため）、その `figure_tiers` ブロックはこの数値を `applicable: false` としています。`spoof`
シナリオ種別は、注入した攻撃に対して検出をスコアリングします。`figure_tiers` は、報告された
すべての数値に、その検証のティア — VALIDATED（外部のオラクルに対して確認済み）または MODELLED — と、
ティアの読み取り元である検証マトリクスの行も与えます。軌道の
シナリオはさらに、時計の結果と並べて、幾何配置のブロック — 測位が得られたサンプルの割合、
位置精度低下率（PDOP）と位置精度の最良値/中央値 — を報告します。

> **この 2 つの数値は注意して読んでください。** `security` は、各時計の安定度から導いた *解析的なスプーフ検出可能性の
> 境界* です — 設定したスプーフィングのシナリオに対してのみ意味を持ち、
> 複数衛星の RAIM 検出器では**ありません**。ここでの `integrity` は、
> フィルターの *自己整合性*（途絶中のサンプルのうち、自身の k シグマ境界の内側にあるものの割合）であり、
> 航空の HPL/VPL のインテグリティの数値では**ありません**。
> [`docs/INTEGRITY.md`](docs/INTEGRITY.md) を参照してください。
>
> 本物の受信機自律型インテグリティについては、**`integrity` シナリオ種別**
> （`scenarios/integrity-raim.toml`）が、伝搬したコンステレーションの幾何配置に対して、実際のスナップショット型と解分離型
> （ARAIM 式）の RAIM を実行します：エポックごとに水平/垂直の **保護レベル（HPL/VPL）** を計算し、
> 設定したアラートリミットを満たすエポックの割合を報告し、誤差と PL（保護レベル）の分類のための
> Stanford のインテグリティ図を示します。

<a id="reproducible-study-artifacts"></a>
#### 再現可能な検討成果物

4 つのオープンな検討は、それぞれ 1 つのコマンドからバイト単位で決定論的な成果物（固定シード）を
再生成します — 量子と古典のクロスオーバー、RF 障害の
楽観ギャップ、PNT レジリエンスのスコアリング、タイミング保護レベルの各検討の背後にある数値です：

```bash
# Quantum-vs-classical resilience crossover map (writes paper/crossover/*.json):
cargo run --release --bin crossover_study -- paper/crossover

# RF-impairment optimism-gap study (13-detector panel, scaling laws, LOO predictor):
cargo run --release --example optimism_study -- paper-artifacts/optimism-study.json

# Framework-aligned PNT-resilience scoring + decision-instability study:
cargo run --release --example resilience_report -- paper-artifacts/resilience-study.json

# Conditional Timing Protection Level, calibrated on a real recorded spoof:
cargo run --release --example tpl_jammertest
```

各成果物は、エンジンのバージョン、シード、設定のハッシュを記録し、正直な
MODELLED/VALIDATED のラベルを持ちます。実データのプローブ（`*_probe`）は、ローカルに用意した記録に対して
同じパイプラインを実行します。データセットはリポジトリに同梱していません。RF 障害の
楽観ギャップの検討はプレプリント
[arXiv:2606.22054](https://arxiv.org/abs/2606.22054) に、条件付きタイミング
保護レベル（上記の `tpl_jammertest`）はプレプリント
[arXiv:2606.24210](https://arxiv.org/abs/2606.24210) にまとめています（[引用](#cite)を参照）。

公開した月の PNT の検討（[arXiv:2607.06212](https://arxiv.org/abs/2607.06212) の
表面ビーコンによる DOP、[arXiv:2607.02566](https://arxiv.org/abs/2607.02566) の VLBI による
可観測性、[arXiv:2610.23871](https://arxiv.org/abs/2610.23871) のシスルナのアーク長による
可観測性）は、その幾何配置、精度低下率、リアルタイムの座標系 /
地球姿勢パラメーター（EOP）の予測、遠方逆行軌道、RF 測距に関する
主張を、`tests/validate_p*.rs` で別のオラクル（`scipy.special.j1`、独立した NumPy による
`(HᵀH)⁻¹` の DOP の解、同じ IERS `finals2000A` の行の NumPy による再解析、
NASA/JPL Three-Body Periodic Orbit Database）に対して独立にクロスチェックしています。これらは
**モデル化した** 月のスイートに対する追加の回帰チェックであり、機械的に検査されるマトリクスの件数は変わりません。

</details>

<details>
<summary>シナリオ形式</summary>

<a id="scenario-format"></a>
### シナリオ形式

シナリオは宣言的な TOML です。トップレベルの `kind` がパックを選択します — 全部で **50**
（省略した場合は `clock` が既定）：`inertial`、`timetransfer`、`hybrid`、`hybrid-ukf`、`fusion`、
`gnss-ins`、`orbit`、`ephemeris`、`gnss-sim`、`integrity`、`lunar-integrity`、`lunar-time-offset`、`spoof`、
`spoof-detect`、`jamming`、`sweep`、`sweep-nd`、`gravity-map`、`terrain-nav`、`terrain-slam`、
`combined-altpnt`、`pvt`、`mars-pnt`、`impairment-eval`（AI/ML による RF 障害検出の
評価テストベッド — ラベル付きの合成コーパス + 検出器に依存しない ROC/AUC のハーネス +
分布内/分布外の楽観ギャップ）、`quantum-trade`（実測 ADEV の取り込み + GNSS 拒否下のレジリエンスのエンベロープを伴う、
量子と古典の PNT のトレード。MODELLED）、
`space-weather`（太陽/地磁気の指数 + Jacchia-71 の外圏温度 +
静的な大気に対する活動に応じた熱圏密度。MODELLED）、
`oem-interop`（GMAT/Orekit/STK のエフェメリスのための CCSDS OEM の取り込み/ラウンドトリップのブリッジ。
MODELLED）、ミッション解析の 3 つ組 `launch-window`（二体の打ち上げ方位角 /
軌道面変更 / 打ち上げ機会）、`reentry`（Allen-Eggers の弾道再突入コリドー）、
`eo-coverage`（EO の観測幅 / GSD / アクセス / 再訪の幾何配置）、`space-packet`（CCSDS
133.0 の TM/TC — テレメトリー/テレコマンド — の Space Packet のフレーミング — 厳密なビット配置、ラウンドトリップで検証済み）、そして
`attitude-budget`（3-DOF の重力傾斜トルク + RSS の指向誤差バジェット）、
`passes`（地上局の出没のパス予測 — AOS/TCA/LOS、最大仰角、
アクセス）、`link-budget`（片方向の CCSDS/DSN のリンク方程式 — FSPL / Eb·N₀ /
マージン / 成立性）。`telecom-timing`（ホールドオーバーの時刻誤差、MTIE と TDEV を
ITU-T のマスクに対して確認）。`spectrum`（GNSS の L バンド全体を 1 つの電力スペクトル密度として：
スクリプト化された連続波、狭帯域、チャープ、整合雑音のジャマーのタイムラインの下での
周波数対時間のウォーターフォール、スペクトル分離係数からの帯域ごとのジャマー対信号比と実効
搬送波対雑音密度、Welch のスペクトル推定を伴う Signal Metadata
Format（SigMF）の記録の入出力。信号の
スペクトルは教科書の値に対して VALIDATED、ジャマーのシナリオは MODELLED。
[`docs/SPECTRUM.md`](docs/SPECTRUM.md) を参照。同じ種別が、設計した低軌道の信号とともに
UHF、S、C バンドのパネルも描きます）。`leo-signal`（任意のシステムのための低軌道の測位・航法・
タイミングの信号設計：帯域制限されたスペクトル、コード追尾のジッターと測距
精度、捕捉の探索と時間、GPS と Galileo に対するスペクトル分離、ジャマーへの
耐性、UHF から C バンドまでのトレード。Xona Pulsar、Iridium、
Starlink、CentiSpace などの公開プリセットまたはインラインの設計から。閉形式と LEO のドップラーは VALIDATED、
設計は MODELLED。[`docs/LEO-SIGNAL.md`](docs/LEO-SIGNAL.md) を参照）。`solar-system`（1 つのエポックにおける太陽、惑星、冥王星、月、7 つの主要な
衛星 — 位置、定数、光時間、軌道の軌跡。惑星の位置は
JPL Horizons に対して VALIDATED）と `body-pnt`（それらのいずれかの天体の周りでの、
ローカルな航法コンステレーションと地球からの深宇宙リンクによる測位。MODELLED）。`campaign`（既存の種別を組み合わせた、フェーズ間で状態を引き渡す
連鎖ミッションのタイムライン、パラメータースイープ、シード付きのモンテカルロのアンサンブル、または
1 つの共通条件の下での複数のシナリオ。MODELLED。
[docs/CAMPAIGNS.md](docs/CAMPAIGNS.md) を参照）。`constellation-design`（Walker の delta と star の
パターン、要素のリスト、GPS、Galileo、BeiDou、GLONASS の
プリセットを伴うマルチシェルの設計、そして緯度/経度グリッド上のカバレッジと精度低下率。
生成器と GPS の全球 DOP は公表されたサービス文書に対して VALIDATED。
[`docs/CONSTELLATION-DESIGN.md`](docs/CONSTELLATION-DESIGN.md) を参照）。`leo-pass`（任意のコンステレーションと任意の信号設計による、
低軌道（LEO）の測位・航法・タイミング（PNT）衛星のパスと、そのリンクバジェットを帯域ごとに：
視線角、ドップラーとドップラーレート、
ITU-R の降雨、ガス、シンチレーション、建物侵入損失、可視の MEO GNSS 衛星に対する
搬送波対雑音密度、一次の電離圏と電離圏フリーの組、
低エネルギーの測位バジェット、すべての帯域の組からの電離圏の観測、そしてドップラーとパスの幾何配置の整合性および
帯域間の整合性によるスプーフィングモニター。ITU-R の項と
静止利用者のドップラーエンベロープは VALIDATED、パスは MODELLED。
[`docs/LEO-PASS.md`](docs/LEO-PASS.md) を参照）。`leo-navmsg`（任意の軌道と搬送波における、
低軌道（LEO）PNT 衛星の放送エフェメリスと時計のメッセージ：
積分した真の軌道から Galileo のケプラー要素セットへのフィッター、そのセットに
軌道方向、軌道直交方向、動径方向の補正多項式を加えたもの、Liu et al. 2025 の
22 パラメーターのモデル、または ATOMIC のゼロ時計 ECEF 多項式。フィット区間と更新周期に対する
信号空間距離誤差（SISRE）、パス途中の更新の連続性チェック、
CRC-24Q の巡回冗長検査と量子化のバジェットを備えた Kshana 独自の文書化されたバイナリフレーム、そして
Kshana の拡張とラベル付けした RINEX-4 形式のブロック。SISRE の重み、Galileo の利用者
アルゴリズム、CRC-24Q は VALIDATED、フィットは MODELLED。Xona Pulsar、
Iridium、Starlink、CentiSpace、代表的な C バンドのシステム、ATOMIC、Celeste IOD の任意のプリセット。
[`docs/LEO-NAVMSG.md`](docs/LEO-NAVMSG.md) を参照）。**MEO + LEO の融合
PNT** の 3 つ組 `leo-pvt`（低軌道（LEO）の距離変化率からのドップラー測位、システム間バイアスを伴う
GNSS + LEO の擬似距離の結合測位と LEO
衛星数に対する DOP、極域と北極域のカバレッジ、LEO による UTC への時刻転送 — 任意のコンステレーションにわたり、
Xona Pulsar、Iridium、Starlink の機会信号などの任意のプリセット付き。
LEO のドップラーエンベロープは公表された Iridium と Xona の数値に対して VALIDATED）、`leo-ppp`
（GNSS のみ、および LEO による補強を伴う精密単独測位の収束で、
Li et al. 2019 と比較）、`ntn-positioning`（信号帯域幅の Cramér-Rao 境界からの
5G 非地上系ネットワーク測位）。そのエンベロープを除いて MODELLED。
[`docs/LEO-PNT-FUSION.md`](docs/LEO-PNT-FUSION.md) を参照。`leo-pnt-chain`（1 つの LEO-PNT システムをエンドツーエンドで：
`leo-pass` の帯域が運ぶ `leo-signal` の設計、パスの C/N0 と航法
メッセージの信号空間距離誤差を融合した `leo-pvt` の測位と `leo-ppp` の
収束に引き渡し、すべての引き渡しを列挙。MODELLED。
[`docs/LEO-PNT.md`](docs/LEO-PNT.md#end-to-end-leo-pnt-chain) を参照。このページは、
レジリエンスのキャンペーン、実験の重点分野ごとに 1 つのシナリオ、エンドユーザーの業種ごとに 1 つのシナリオを含む、
すべての LEO-PNT の種別とシナリオの概要でもあります）。**月の PNT スイート** `lunar-vlbi`、`lunar-joint-od-clock`、
`lunar-frame-realisation`、`moonlight-service-volume`、`lunar-differential-pnt`、
`lunar-interop-export`。**量子を活用した PNT のデモンストレーター**
`quantum-time-transfer`、`quantum-gnss-free-nav`、`quantum-anomaly-detect`。そして
**信号セキュリティ、シスルナ、多層レジリエンス** の研究用の種別 `lunar-attack-surface`、
`realtime-frame-eop`、`lunar-time-budget`、`hybrid-optical-rf`、`cislunar-observability`、
`conflict-resilience` — ミッション解析の 3 つ組とこれらの後発の種別はすべて MODELLED です
（それぞれ検証済みの閉形式のコアを持ちます。マトリクスを参照）。
共通のフィールド：`seed`、`[time]` グリッド、`[gnss]` の可用性のタイムライン（途絶の
駆動要因）、そしてすべての数値の出典を引用する `provenance` 文字列を持つセンサーごとのブロック。
例（clock）：

```toml
seed = 42
threshold_ns = 20.0
[time]
step_s = 10.0
duration_s = 7200.0
[gnss]
windows = [
  { t0 = 0.0,   t1 = 600.0,  state = "nominal" },  # 10 min GNSS sync
  { t0 = 600.0, t1 = 7200.0, state = "denied"  },  # ~1.8 h outage
]
[clock_quantum]
id = "optical-sr-lattice"
provenance = "Strontium optical lattice clock, space-oriented goal sigma_y(1s)=1e-15 (arXiv:1503.08457)"
y0 = 5.0e-17
q_wf = 1.0e-30   # white FM:  q_wf = sigma_y(1s)^2
q_rw = 0.0       # random-walk FM
drift = 0.0      # linear aging (per second)
[clock_classical]
id = "csac-sa45s"
provenance = "Microchip SA65 / SA.45s CSAC datasheet sigma_y(1s)=3e-10"
y0 = 5.0e-10
q_wf = 9.0e-20
q_rw = 0.0
drift = 0.0
```

任意のフィールド（ない場合は無効）：時計には `flicker_floor`（1/f FM — 周波数
変調 — の Allan の下限）を追加できます。慣性センサーには `gyro_bias` と `q_arw`（ジャイロのバイアスと角度
ランダムウォーク）、`bias_instability` と `q_aa`（Allan のバイアス不安定性の下限と
加速度ランダムウォーク）を追加できます — これらを合わせると **単軸（1-DOF）の加速度計の誤差
バジェット**（VRW/ARW — 速度/角度ランダムウォーク — とバイアス不安定性）になります。これは同梱の
`inertial` シナリオの *パック* が実行する誤差バジェットです。これとは別に、ライブラリには現在、検証済みの
**3 軸ストラップダウン航法装置**（`src/inertial/{attitude,mechanization,imu_errors}.rs`）があります：
コーニング/スカリングの補償を伴うクォータニオンの姿勢、完全な NED の機械化方程式
（地球自転レートと輸送レートの項、WGS-84 の Somigliana 重力）、そして
**スケールファクター、ミスアライメント、
g 感度、量子化、レートランプをモデル化した** 決定論的な IMU 誤差モデル（IEEE Std 952-1997、IEEE の
ジャイロの仕様と試験手順の標準、§A.2。Groves 2013 §4.3）。この 3 軸の経路は現在、**実行可能な
疎結合の GNSS/INS パック**（`kind = "gnss-ins"`）**に接続されています**：15 状態の誤差状態 EKF が、
GNSS が利用可能な間は雑音のある測位に対してストラップダウンの解を規律し、その後
途絶の間をコーストして、融合した水平誤差を
開ループの自由 INS のコーストと比較して報告します。**密結合の擬似距離** の更新も
利用できます（イノベーションを距離のドメインで形成するため、補正を続けます
衛星が 4 機未満でも）。
時計のホールドオーバーのシナリオには `runs`（> 1）を追加して **モンテカルロのアンサンブル** を実行できます — その場合、各
性能指標は平均値と 5–95 パーセンタイルの幅で報告され、
チャートは誤差の信頼帯を網掛けで示します（`scenarios/clock-ensemble.toml` を参照）。

`fusion` シナリオ（`hybrid` と同じブロック）は、GNSS によって規律され
光時刻転送によって支援される **2 つの独立したカルマン推定器** — 1 つは時計の状態、もう 1 つは位置の状態 — を実行し、
組み合わせたホールドオーバーの FoM を報告します。2 つのブロックは
相互共分散を共有しません：これは誤差バジェットを積み重ねた組であり、真に結合した
時計+位置の同時フィルターでは**ありません**（ブロック間の共分散はロードマップの項目です）。
`scenarios/fusion-pnt.toml` を参照してください。

`spoof` シナリオは時刻スプーフを注入し — 4 つの `[attack.shape]` 種別
（`linear_ramp`、`step_jump`、`meaconing`、`replay`。単独の `rate_ns_per_s` も引き続き
線形ランプとして受け付けます）のいずれか — 各時計のスプーフ検出器を実行します。検出器は、
時計支援モニターの統計量に対する両側の **χ²₁ エネルギー / Neyman–Pearson 検定** です：
閾値は目標の誤警報バジェット `target_pfa` から設定し、
**見逃し確率 `P_md`** は閉形式と
モンテカルロ（仮説ごとに `mc_runs` 回の試行 — 両者は 1/√N の数倍以内で一致します）の両方で報告します。
**セキュリティの性能指標は、運用上有害な（仕様の）大きさにおける `1 − P_md`** であるため、
仕様の大きさのスプーフを捕捉する静かな時計のスコアは ≈ 1 となり、それをしばしば見逃す
雑音の多い時計のスコアは低くなります（`scenarios/spoof-attack.toml`、
`scenarios/spoof-meaconing.toml` を参照）。

`gnss-sim` シナリオは **測定ドメイン** のシミュレーションです：可視の各
衛星について、擬似距離 `ρ = geometric range + c·δt_rx − c·δt_sv +
I + T + noise + multipath` と L1 のドップラーを合成します。電離圏は **Klobuchar** の 1 周波
モデル（`[iono]`、IS-GPS-200 §20.3.3.5.2.5）、対流圏は **Niell (1996)** のマッピング関数で投影した
**Saastamoinen** の天頂対流圏（`[tropo]`）です。
残差はエポックごとの HPL/VPL のための **スナップショット RAIM** に入力され、各衛星の
擬似距離、ドップラー、C/N₀、電離圏/対流圏の補正は JSON の
`gnss_measurements` 配列に出力されます。これは順方向のシミュレーター（既知の真値から測定を生成する）であり、
受信機/ソルバーではありません — 雑音ゼロの実行は、幾何配置と
補正をミリメートル未満で再現します（`scenarios/gnss-sim-raim.toml` を参照）。

`jamming` シナリオは RF 干渉を **リンクバジェット** としてモデル化します：`[jammer]`
（ECEF 位置、送信 `power_dbw`、種類）が、Walker の `[constellation]` を受信している
`[receiver]` におけるジャマー対信号比を高めます。幾何配置（自由空間
伝搬損失と方向ごとの受信アンテナ利得）から、各衛星の
`J/S`、標準的なアンチジャムの式（逆拡散の
処理利得 × スペクトル分離係数 `Q`。Kaplan & Hegarty §9.4）による **実効 C/N₀** を計算し、
設定可能な追尾閾値を下回るとロック喪失のフラグを立てます —
`availability_under_jamming` の性能指標を報告します。1 km の距離にある 10 W の広帯域ジャマーは
受信機を完全に拒否します（J/S ≈ 72 dB）。同じジャマーが 100 km の距離にある場合は
リンクを劣化させるだけです（`scenarios/jamming-demo.toml` を参照）。

`sweep` シナリオは **トレードスタディ** を実行します：1 つの `parameter`（`threshold_ns`、
`duration_s`、`quantum_q_wf`、または `classical_q_wf`）を `start` から `stop` まで `steps`
点にわたって `lin` または `log` の `scale` で変化させ、両方の時計について `metric`（例：`holdover_s`）を記録し、
2 本の曲線をチャートにします。基準のシナリオは `[base]` の下に置きます（
`scenarios/sweep-clock-stability.toml` を参照）。

`sweep-nd` シナリオはこれを **任意のパックと任意の数の軸** に一般化します：
（任意の `kind` の）`[base]` シナリオのドット区切りの TOML キーを、`[[axes]]` の直積にわたって
変化させ、グリッドの各ノードを再実行し、結果へのドット区切りの JSON パスとして与えた `metrics`
（例：`classical.fom.holdover_s`）を記録します。TOML/結果の境界で動作するため、
すべてのパックで機能します。ネイティブの実行ではグリッドを並列に評価し
（追加の依存関係なし、wasm では逐次にフォールバック）、
出力は決定論的で行優先です（`scenarios/sweep-nd-inertial.toml` を参照）。

`orbit` シナリオは、`[gnss]` のタイムラインを手で書く代わりに幾何配置から導出します
— `[user]` の軌道、`[constellation]`、仰角の `mask_deg`、2 つの
時計のブロックを与えます。衛星の幾何配置からの位置精度も報告します。
任意の `sigma_uere_m`（1 シグマのユーザー等価距離誤差、既定値 1 m）は、
位置精度低下率を位置のシグマにスケーリングします。利用者の軌道は `eccentricity` と `argp_deg` で
**離心軌道** にでき、`j2 = true` は地球の扁平による
永年ドリフトを加えます（`scenarios/orbit-molniya.toml` を参照）。コンステレーションは代わりに
**実際のもの** にもできます：`[constellation]` に 2 行軌道要素の `tle` ブロックを与えると、
衛星がそこから解析されます（`scenarios/orbit-real-tle.toml` を参照）。**マルチ GNSS**
（例：GPS + Galileo）には 1 つ以上の `[[constellations]]` ブロックを追加します（
`scenarios/orbit-multignss.toml` を参照）：

```toml
kind = "orbit"
seed = 7
threshold_ns = 5.0
mask_deg = 10.0
sigma_uere_m = 1.0           # optional; position sigma = position-DOP * this
[time]
step_s = 60.0
duration_s = 86400.0
[user]                       # spacecraft (altitude in km, angles in deg)
altitude_km = 8000.0
inclination_deg = 0.0
[constellation]              # Walker-delta GNSS (GPS-like)
altitude_km = 20180.0
inclination_deg = 55.0
planes = 6
sats_per_plane = 4
phasing_f = 1.0
[clock_quantum]  # ... as above
[clock_classical]  # ... as above
```

**GPS 拒否下の代替 PNT** の種別は、GNSS をまったく使わずに航法し、測定した場の
系列を粒子フィルターで地図と照合します。`gravity-map` シナリオは、球面調和の重力異常場の中を
航跡に沿って飛行し、冷却原子重力計の読み取り値からそれを復元します
（`scenarios/gps-denied-gravity-nav.toml`）。`terrain-nav` シナリオは
同じことを SRTM の標高 DEM に対して行い（TERCOM/SITAN、`scenarios/terrain-nav.toml`）、
`combined-altpnt` シナリオは **重力 + IGRF の磁気 + 地形** を 1 つのフィルターで融合します
（`scenarios/combined-altpnt.toml`）。

`lunar-integrity` シナリオは **シスルナ** の PNT を評価します：LunaNet/LNIS のリレー集合に対して
月の南極での ARAIM の保護レベルのパスを実行し、インテグリティのギャップを
正直に報告します — 約 30 m の月の σ_URE によって保護レベルは 50 m のアラート
リミットを大きく上回るため、航空式のインテグリティ規則の下ではサービスは *利用不可* です
（`scenarios/lunanet-araim.toml`）。

`lunar-time-offset` シナリオは、月座標時の時刻系（LTC/TCL）の基礎となる
**相対論的な地球–月の時計レート** を報告します。第一原理のポストニュートン的な
恒等式は、自己ポテンシャルの差（IAU の `L_G` ジオイドポテンシャルから月の
表面の自己ポテンシャルを引いたもの）と月の運動（二次ドップラー）項を合計して、約 57 µs/day の永年
レートを与え、公表された 56–59 µs/day の帯域とともに報告します。また、ある期間にわたって
累積した LTC−TT のオフセットと、逆分散重み付きのアンサンブル（月の
ペーパー時計）も与えます。**MODELLED** — 主要な数値は *参照に依存します*（地球のジオイド
対 月のセレノイド、平均化ウィンドウ）。そのため、認証された単一の
数値ではなく帯域を報告しています（`scenarios/lunar-time-offset.toml`）。

すべての種別について少なくとも 1 つの実例が `scenarios/` にあります（92 の種別、193 のシナリオ
`.toml` ファイル + 1 つのスイートのマニフェスト — いくつかの種別は複数の例を同梱しています）。すべての
種別に、その名前を付けたファイルがあるわけではありません：`lunar-integrity` → `scenarios/lunanet-araim.toml` と
`gravity-map` → `scenarios/gps-denied-gravity-nav.toml` は、そうした例のうちの 2 つです。
ディスパッチ可能な種別は、`cargo run -- --validate <file>` の
エラー、Python の `list_kinds()`、または MCP の `list_scenario_kinds` ツールでいつでも一覧表示できます。

</details>

<details>
<summary>出力</summary>

### 出力

結果の成果物は、バージョン付きの自己記述的な JSON です：ステップごとの時系列、
スコアリングした性能指標、有効なモデルの仕様（来歴付き）、シード、
**シナリオのハッシュ** — これにより、どのチャートもファイルから再現できます — そして、各時計について
`adev_curve`（`[{tau_s, adev, n_samples, noise, edf, ci_lo, ci_hi}]`）：オクターブ間隔の平均化時間にわたる
オーバーラップ Allan 偏差 — 時計の安定度を読む標準的な方法 — で、現在は点ごとに
**雑音の種類に応じた 95% の信頼帯** を伴います（記録の
べき乗則の種類を修正 Allan の傾きから識別し、χ² の区間には対応する
NIST SP 1065 の有効自由度を使います）。ブラウザーのプレイグラウンドは、これを
両対数の「Clock stability (ADEV)」チャートとして描画します。（MDEV、TDEV、HDEV はライブラリの
推定器として利用できます。エクスポートされる結果の曲線はオーバーラップ ADEV です。）すべてのフィールドは、単位と
出典へのポインターとともに [`docs/SCHEMA.md`](docs/SCHEMA.md) に記載しています。

**すべてのチャートは自己記述的です。** ブラウザーのプレイグラウンド、CLI の `*.chart.svg`
エクスポート、HTML（HyperText Markup Language）のスコアカードはいずれも、各チャートの画像に
`Kshana v<version> · scenario <hash> · kshana.dev` というフッターを刻みます。`scenario <hash>` は、実行の
**シナリオのハッシュ** の先頭 16 進 12 文字です — 正規化したシナリオの
定義（シード、閾値、モデルのパラメーター、GNSS のウィンドウ、…）に対する SHA-256（256 ビットの Secure Hash Algorithm）のダイジェストです。インテグリティと月の
レポートは独自のハッシュを持たないため、シナリオのソースの SHA-256 にフォールバックします。
これは 1 行のサマリーと結果の JSON に示されるのと **同じフィンガープリント** であるため、
保存または貼り付けたチャートには常に、そのバージョン、それを生成した正確なシナリオ（
ビット単位の再現のため）、出典が含まれます — どの入力を変えてもハッシュが変わります。

性能指標は、標準的な運用上の PNT の性能指標に従います：

| 性能指標 | Kshana の計算方法 |
|-----------------|------------------------|
| タイミング性能（時計/軌道のパック） | 途絶期間における時計の位相誤差の RMS + 95 パーセンタイル、単位は **ナノ秒**（`timing_rms_ns`）— タイミングの指標であり、位置ではありません |
| 測位性能（慣性/ハイブリッドのパック） | 途絶期間における 1-DOF の位置誤差の RMS + 95 パーセンタイル、単位は **メートル**（`pos_rms_m`）。単軸です。単一の実行には `monte_carlo: false` のフラグが付きます。`runs = N` を設定すると、各指標の平均、幅、ブートストラップによる 95% CI（信頼区間）を報告するモンテカルロのアンサンブルになります。それでも 2 次元の CEP/2DRMS（円形公算誤差 / 二乗平均平方根距離の 2 倍）や DOP で重み付けした精度では**ありません**（それらには 3 軸モデルが必要です — ロードマップ） |
| 自律性 | ホールドオーバーの長さ — GNSS の喪失後に仕様内にある時間（グリッドで量子化：下限値） |
| レジリエンス | 途絶中の誤差の増大の傾き |
| 可用性 | 実行のうち、仕様内の解が得られている割合 |
| インテグリティ | フィルターの **自己整合性** — 途絶中のサンプルのうち、誤差がカルマンフィルター自身の k シグマ境界の内側にとどまるものの割合。航空の HPL/VPL/RAIM のインテグリティの数値では**ありません**（[`docs/INTEGRITY.md`](docs/INTEGRITY.md) を参照） |
| セキュリティ | 時計の安定度からの **解析的なスプーフ *検出可能性* の境界** — 単一時計の整合性モニターが、どれだけ小さく/遅い時刻スプーフにフラグを立てられるか。攻撃を設定した場合にのみ意味を持ちます。複数衛星の RAIM 検出器では**ありません** |

これらの用語が初めての方へ：それぞれ[用語集](docs/GLOSSARY.md)で平易な言葉で定義しています。

</details>

<details>
<summary>リポジトリ構成</summary>

### リポジトリ構成

```
kshana/
├── src/                                       # the kshana core crate (library + CLI)
│   ├── api.rs · main.rs · lib.rs              # typed dispatch (92 kinds) + CLI + crate root
│   ├── python.rs · wasm.rs                    # optional PyO3 / wasm-bindgen bindings
│   ├── types.rs · scenario.rs · allan.rs      # shared core (time grid, GNSS timeline, Allan)
│   │
│   ├── models.rs · estimator.rs · kalman.rs   # Pack 1 — clock holdover + integrity
│   ├── security.rs · detection.rs · spoof.rs · spoof_monitors.rs  # spoof detection
│   ├── filter_health.rs · fom.rs · fom_label.rs · report.rs · chart.rs · run.rs  # health · FoM scoring + labelling · output
│   ├── suite.rs · study.rs                     # scenario suites + aggregated multi-scenario study artifacts (`--study`)
│   ├── inertial/                              # Pack 2 — strapdown INS (attitude · mechanization · imu_errors · quantum_imu)
│   ├── timetransfer.rs · timetransfer_adv.rs · timegeo.rs  # Pack 3 — TWSTFT/CV/PPP/optical, Sagnac
│   ├── hybrid.rs · ensemble.rs · sweep.rs     # Pack 4 — fused PNT, Monte-Carlo, trade sweeps
│   │
│   ├── timescales.rs · jd2.rs · ephem.rs      # time systems, two-part JD, Sun/Moon ephemeris
│   ├── precession.rs · nutation.rs · cio.rs   # IAU 2006/2000A precession-nutation + CIO GCRS↔ITRS
│   ├── frames.rs · *_data.rs                  # TEME↔ECEF + generated nutation/CIO/EGM2008/IGRF tables
│   │
│   ├── orbit.rs · sgp4.rs · tle.rs · walker.rs   # geometry, SGP4/SDP4, TLE, Walker design
│   ├── propagator.rs · forces.rs · gravity_sh.rs · integrator.rs  # Cowell + perturbations (EGM2008 d/o70, GR) + RK4/DOPRI
│   ├── maneuver.rs · batch_ls.rs · orbit_determination.rs  # burns/Lambert/porkchop, Gauss-Newton, OD
│   ├── cr3bp.rs · lunar.rs · lunar_frame.rs · lunar_od.rs  # Earth–Moon CR3BP + halo/NRHO STM corrector, cislunar/LunaNet ARAIM, MCI↔MCMF, lunar OD
│   ├── lunar_time.rs · lunar_vlbi.rs · lunar_combination.rs · lunar_frame_realise.rs · lunar_service.rs · lunar_dpnt.rs · lunar_interop.rs  # tiers per piece in the matrix lunar PNT suite — LTC time · geodetic VLBI · joint OD+clock · frame realisation · Moonlight service-volume · differential PNT · LunaNet/IOAG interop export
│   ├── body.rs · mars_frame.rs · ephem_provider.rs · radiometric.rs · ccsds_tdm.rs  # deep-space: multi-body · Mars frame · ephemeris seam · radiometric obs + CCSDS-TDM
│   ├── deepspace_od.rs · clock_state.rs · mars_atmos.rs · mars_pnt.rs · linkbudget.rs · gse_sim.rs  # SRIF OD · onboard clock · Mars drag · relay-PNT · link budget · GSE sim
│   │
│   ├── fusion/                                # GNSS/INS — EKF · UKF · tightly_coupled(17) · coupled · closed_loop
│   ├── raim.rs · sbas.rs                      # RAIM/ARAIM HPL/VPL, SBAS DO-229E PLs + L1/L5 iono-free
│   ├── gnss_sim.rs · ionex.rs · pvt.rs · jamming.rs  # measurement domain · ionosphere maps · single-point positioning · jamming
│   ├── navsignal.rs                            # nav-signal PSD (BPSK-R/BOC) · spectral-separation → anti-jam Q · DLL code-tracking jitter · multipath envelope
│   ├── gravimeter.rs · igrf.rs · mapmatch.rs · particle_filter.rs · altpnt/  # gravity/magnetic/terrain alt-PNT
│   ├── rinex.rs · rinex_obs.rs · glonass.rs · sp3.rs · oem.rs · omm.rs · permalink.rs  # interop formats
│   ├── launch.rs · reentry.rs · eo_payload.rs · attitude_budget.rs · passes.rs · space_packet.rs  # mission-analysis budgets + CCSDS Space Packet
│   ├── space_weather.rs · holdover.rs · tpl.rs   # space-weather environment · GNSS-denied clock-holdover calculator · conditional Timing Protection Level (under spoofing)
│   ├── resilience/                              # framework-aligned PNT-resilience scoring + decision-instability study (RPCF · Dirichlet · Kendall-τ · diversity collapse · assurance report)
│   ├── impairment_eval.rs · impairment_study.rs · impairment_ml.rs · eval_stats.rs  # AI/ML RF-impairment eval testbed · optimism-gap study · LR/MLP detectors · bootstrap/DeLong/Spearman stats
│   ├── sdr.rs · realdata/                       # software-defined-receiver front end (IQ/IF → E/P/L taps → SQM) + real-data ingest adapters (RINEX · UBX · GnssLogger · JammerTest · Yunnan · SatGrid)
│   ├── crossover.rs · quantum_trade.rs · frugal.rs · integrity_impact.rs  # quantum-vs-classical crossover map · PNT trade · cost-per-coverage ROI · integrity impact
│   ├── quantum_devices.rs · quantum_faults.rs · quantum_nav_od.rs · qtrade.rs · timetransfer_chain.rs · representativeness.rs  # Quantum-Enabled PNT demonstrator — device error models · fault catalogue · GNSS-free quantum OD · unified trade harness · quantum time-transfer chain · representativeness / gaps-to-flight ledger
│   ├── interchange.rs · verification.rs          # KIF artifact envelope · machine-checked verification matrix
│   └── bin/crossover_study.rs · bin/validation_report.rs  # crossover-study artifact generator · release validation-summary HTML
│
├── mcp/kshana-mcp/        # standalone, workspace-EXCLUDED crate — the MCP server (+ Dockerfile, server.json)
├── ide/jetbrains/         # standalone Kotlin/Gradle IntelliJ-Platform plugin
├── xval/                  # standalone, workspace-EXCLUDED external cross-checks: anise-{frames,lunar-od,mars-od,service-geometry} (Rust ANISE/SPICE DE440) + orekit-passes (Java Orekit)
│
├── examples/            # reproducible study generators: tpl_jammertest · resilience_report · optimism_study + real-data probes (jammertest_probe · yunnan_probe · satgrid_probe · texbat_probe · ingest_realdata)
├── paper-artifacts/     # byte-deterministic study artifacts, regenerable from examples/ (optimism-study.json · resilience-study.json); raw datasets stay out
├── scenarios/            # one cited .toml per kind + geometry-driven + GPS-denied
├── scripts/              # reproducibility + repo-hygiene + SBOM guards
├── docs/                 # CONCEPTS, ARCHITECTURE, CAPABILITY, VALIDATION, PROVENANCE, GLOSSARY, …
├── web/                  # the WebAssembly playground + kshana.dev site
├── tools/                # table generators (EGM2008 · IGRF · nutation · CIO) + fetch_tles.sh
├── .github/workflows/    # ci · release · publish · wheels · pages · mcp-publish · jetbrains-plugin · frame-xval
├── pyproject.toml        # Python packaging (maturin)
├── CHANGELOG.md          # Keep a Changelog + SemVer
└── CITATION.cff · ROADMAP.md · CONTRIBUTING.md · SECURITY.md
```

</details>

<details>
<summary>FAQ（よくある質問）</summary>

### FAQ

**これを使うのに量子物理を理解する必要がありますか？**
いいえ。コマンドラインを実行できれば Kshana を実行できます。
[平易な言葉による入門](docs/CONCEPTS.md)から始め、用語は[用語集](docs/GLOSSARY.md)で調べてください。

**これは量子ハードウェアの設計、あるいはフライトソフトウェアですか？**
いいえ。性能の *シミュレーター* です。量子ハードウェアの忠実度は公表された
誤差モデルに由来するものであり、このツールに由来するものではありません。[Kshana であるもの / ないもの](#what-it-is--is-not)を参照してください。

**量子の結果は現実的ですか、それともマーケティングですか？**
すべてのパラメーターはデータシートまたは論文を引用しており、すべてのモデルは
教科書の関係式に対して検証しており、成熟度は
[VALIDATION.md](docs/VALIDATION.md) で正直にラベル付けしています — ストロンチウム光時計が
飛行したことはないという点も含めてです。エンジンは中立です：量子と古典は同じコードであり、異なるのは
公表された数値だけです。

**2 回の実行が一致すると信頼できますか？**
はい — 実行は決定論的です：`scenario + seed + engine version → bit-identical output` であり、
`scripts/check-reproducible.sh` によって強制されています。

**Python やブラウザーから使えますか？**
はい — [インストール](#install)を参照してください：Python と WebAssembly の例はその下にあります。どちらも同じエンジンを呼び出します。

**自分のセンサーをモデル化するにはどうすればよいですか？**
センサーの公表された数値を `provenance` フィールドに記したシナリオの `.toml` を
書いてください。[シナリオ形式](#scenario-format)と `scenarios/` の例を参照してください。

**商用利用は無料ですか？**
はい — AGPL-3.0 の下で、商用の環境も含めて、AGPL の
コピーレフトを守る限り無料です（特に：Kshana を変更してネットワーク越しに提供する場合、
その利用者に変更したソースを提供しなければなりません）。それが合わない場合 — 例えば
Kshana をプロプライエタリな製品に組み込む必要がある場合や、クローズドなネットワークサービスを運用する場合 — は、
Ashforde® OÜ から商用ライセンスを取得できます。[`LICENSING.md`](LICENSING.md) と
[サポート](#support--professional-services)を参照してください。

</details>

<details>
<summary>トラブルシューティング</summary>

### トラブルシューティング

**古いツールチェーンで `cargo build` が失敗する。** Kshana には Rust ≥ 1.88 が必要です。
`rustup update` で更新してください。

**macOS で Python 拡張のビルドがリンクに失敗する**（`Undefined symbols … _Py…`）。
Python 拡張はロード時にシンボルを解決します。`maturin` は適切なリンカー
フラグを自動的に設定します — 単なる `cargo build` ではなく `maturin develop --features python` を
使ってください。

**Python のビルドで、インタープリターが PyO3 の知るバージョンより新しいというエラーが出る。**
`PYO3_USE_ABI3_FORWARD_COMPATIBILITY=1` を設定してください（abi3 の wheel は
CPython のバージョン間で前方互換です）。

**WebAssembly のビルドでターゲットが見つからない。** 一度
`rustup target add wasm32-unknown-unknown` でインストールし、その後 `wasm-pack build --target web -- --features wasm` を実行してください。

**出力はどこに行ったのか？** 各実行は、入力の `.toml` の横に `<scenario>.result.json`、
`<scenario>.chart.svg`、`<scenario>.report.html`、`<scenario>.report.json` を書き出し、
表を公開する種別では
`<scenario>.table.csv` も書き出します。これらはすべて、設計上
git の無視対象です。

</details>

<details>
<summary>バージョニングとリリース</summary>

### バージョニングとリリース

Kshana は [Semantic Versioning](https://semver.org) に従います。1.0 以前の間は、公開されている
シナリオ/結果のスキーマが変更される可能性があります。互換性を損なう変更は
[`CHANGELOG.md`](CHANGELOG.md) で明示します。すべての結果は
`scenario + seed + engine version` から再現できます。

**すべての `vX.Y.Z` タグは、すべてのチャネルを決まった順序で自動的に公開します** — まずタグ付きのコミットで
フルテストスイートを実行し、それが合格するまで何も公開せず、
その後パイプラインは各レジストリが実際に新しいバージョンを提供していることを確認します
（[`docs/RELEASING.md`](docs/RELEASING.md)）。チャネル：

| チャネル | インストール / 入手 | 内容 |
|---------|---------------|----------|
| [crates.io](https://crates.io/crates/kshana) | `cargo install kshana` · `kshana = "0.35"` | Rust ライブラリ + CLI |
| [crates.io](https://crates.io/crates/kshana-mcp) | `cargo install kshana-mcp` | MCP サーバー |
| [PyPI（Python Package Index）](https://pypi.org/project/kshana/) | `pip install kshana` | abi3 の wheel（Linux/macOS/Windows）+ sdist（ソース配布物） |
| [npm](https://www.npmjs.com/package/kshana) | `npm install kshana` | WebAssembly モジュール + JS のラッパー |
| [ghcr.io](https://github.com/ashfordeOU/kshana/pkgs/container/kshana-mcp) | `docker run -i ghcr.io/ashfordeou/kshana-mcp` | マルチアーキテクチャの OCI（Open Container Initiative）イメージ — ツールチェーン不要 |
| [npm](https://www.npmjs.com/package/kshana-mcp) | `npx -y kshana-mcp@0.40.0` | ランチャー：リリースのバイナリをダウンロードし、`SHA256SUMS` を検証して実行 |
| [PyPI](https://pypi.org/project/kshana-mcp/) | `uvx kshana-mcp==0.40.0` · `pipx run kshana-mcp==0.40.0` | Python 向けの同じランチャー |
| Homebrew · Scoop · winget | `brew install ashfordeOU/tap/kshana-mcp` · `scoop install kshana-mcp` · `winget install AshfordeOU.KshanaMcp` | 各リリースの `SHA256SUMS` から生成した `kshana-mcp` のバイナリ |
| Claude Desktop | リリースの `kshana-mcp-<target>.mcpb` をダブルクリック | バイナリを内包した拡張機能 |
| 公式 MCP レジストリ | MCP クライアントが自動検出 | `io.github.ashfordeOU/kshana-mcp`（OCI イメージ、npm と PyPI のパッケージ） |
| [JetBrains Marketplace](https://plugins.jetbrains.com/plugin/32181-kshana--pnt-simulator) | IDE → Plugins → "Kshana" を検索 | **Kshana — PNT simulator** IDE プラグイン |
| [GitHub Releases](https://github.com/ashfordeOU/kshana/releases) | ダウンロード | Linux x86-64、macOS（Apple シリコンと Intel）、Windows x86-64 向けの `kshana` コマンドラインのバイナリ、それらの各システムと Linux Arm 向けの `kshana-mcp` のバイナリ、システムごとの `.mcpb` の Claude Desktop 拡張機能、CycloneDX の **SBOM**、**SLSA** のビルドの来歴、HTML の検証サマリー、`SHA256SUMS` のチェックサムファイル |
| [Zenodo](https://doi.org/10.5281/zenodo.20528627) | DOI | すべてのリリースの引用可能なアーカイブ |
| [kshana.dev](https://kshana.dev) | ブラウザーで開く | 各リリースのタグから再ビルドされる、ブラウザー内の WebAssembly アプリ Kshana Studio（表示されるバージョンが実行されるバージョンです） |

MCP サーバーのクレート / イメージ / レジストリのバージョンはエンジンに追従します（ライブラリを
同梱しているため）。JetBrains プラグインのバージョンは独立しています（インストール済みの
`kshana` バイナリを呼び出すため）。

</details>

<details>
<summary>ロードマップ</summary>

### ロードマップ

段階的なロードマップは [`ROADMAP.md`](ROADMAP.md)、リリース済みの履歴は [`CHANGELOG.md`](CHANGELOG.md)、
機能ごとのロードマップは [`docs/CAPABILITY.md`](docs/CAPABILITY.md) を参照してください。
優先順位は次のとおりです：**第一に重要インフラのためのタイミングとホールドオーバーのエビデンス**（通信のマスク、
経年変化とフリッカー雑音を伴うより長いホールドオーバー、実測した時計データの取り込み）。**第二に中立な量子と古典のトレードの手法**
（パートナーの実測データが昇格させるまで、結果は MODELLED とラベル付け）。そして
**月 / シスルナと深宇宙の航法は維持**し、主軸としては拡大しません。**ITRF 精度の座標変換** は現在提供済みです —
CIO ベースの完全な IAU 2006/2000A GCRS↔ITRS のチェーン（極運動 + 1 秒角未満の章動）を、
SOFA/ERFA に対してビット単位で検証し、ANISE
（純粋な Rust の SPICE）に対して GNSS 軌道で ≤ 3.6 m まで独立にクロスチェックしています。短期的な項目には、密結合の搬送波位相の融合と、
疎結合/密結合の GNSS/INS 航法装置をより多くのパックで利用可能にすることが含まれます。**深宇宙 / 火星の
電波航法** のエンジンは v0.17.0 で導入されました（シミュレーションで検証済み）。
**量子物理の層** は **P2** の項目です：CAI 加速度計は現在、第一原理
（Mach–Zehnder 位相、射影雑音、コントラストの減衰、振動の
結合）からシミュレーションしていますが、時計/時刻転送のセンサーは依然として公表された
Allan/雑音バジェットの係数で駆動しています。GMST に基づく TEME&harr;ECEF、IERS の
うるう秒による時刻系（UTC/TAI/TT/UT1）、SGP4/SDP4 による軌道伝搬（v0.7.0、
AIAA 2006-6753 のベクトルに対して検証済み）、実行可能な `gnss-ins` の融合
パックはすべて **提供済み** であり、慣性の速度は下流で公開されています。能動的な
確率的時刻スプーフ検出器（モンテカルロの
P_fa/P_md と 1−P_md のセキュリティ FoM を伴う Neyman–Pearson / χ²₁ エネルギー検定）、リンクバジェットによるジャミングモデル（J/S → 実効
C/N₀ → ロック喪失）、マルチコンステレーションの可用性、単軸（1-DOF）の
IMU 誤差バジェット、組み合わせた FoM として報告する 2 つの独立した（時計 + 位置）カルマン推定器、
TLE による実際のコンステレーションの幾何配置、HTML のスコアカードのレポート、
離心率と J2 ドリフトを伴うケプラー軌道から幾何的に導出した GNSS の可用性
*と* 精度低下率、
モンテカルロの信頼帯、トレードスタディのパラメータースイープ、ブラウザー内の WebAssembly の
プレイグラウンド、任意の Python（PyO3）と WebAssembly（wasm-bindgen）のバインディングが
`main` に導入されています。

</details>

<details>
<summary>コントリビューション</summary>

### コントリビューション

[`CONTRIBUTING.md`](CONTRIBUTING.md) を参照してください。要点：テストが合格すること（`cargo test`）、
2 つのガードスクリプトが合格すること、Conventional Commits、そしてユーザーから見えるすべての変更について
`CHANGELOG.md` の `[Unreleased]` に項目を追加すること。参加は
[行動規範](CODE_OF_CONDUCT.md)に従います。セキュリティの問題を報告するには、
[セキュリティポリシー](SECURITY.md)を参照してください — 脆弱性について公開の issue を作成しないでください。

</details>

<details>
<summary>ドキュメント：すべての文書と、その対象読者</summary>

<a id="documentation"></a>
### ドキュメント

| 文書 | 対象読者 | 内容 |
|----------|----------|--------------|
| [概念の入門](docs/CONCEPTS.md) | すべての人、ここから始めてください | Kshana が何をするのか、そしてその理由を、ゼロから物理まで |
| [Kshana Studio](web/README.md) | すべての人 | ブラウザーでエンジンを実行（WebAssembly）。ビルドとデプロイの手順 |
| [用語集](docs/GLOSSARY.md) | すべての人 | すべての用語の平易な言葉による定義 |
| [シナリオ種別](docs/KINDS.md) | すべての人 | エンジンがディスパッチするすべての種別：何をするのか、そのフィールド、コマンドの例、台帳の行、エンジンが書き出すチャート |
| [パートナーデータ](docs/PARTNER-DATA.md) | 実測データを持つラボやメーカー | 実測した時計や IMU の記録がどの MODELLED の行を昇格させうるか、形式、提出物の確認（`kshana partner check`）、スコアリング、クレジットの方法 |
| [アーキテクチャ](docs/ARCHITECTURE.md) | 開発者 / レビュアー | モジュールマップ、エンジンのパイプライン、ディスパッチ、図 |
| [検証のステータス](docs/VALIDATION.md) | レビュアー / 引用者 | 何が `validated` で何が `not modeled` か、エビデンス付き |
| [検証マトリクス](docs/VERIFICATION-MATRIX.md) | レビュアー / 引用者 | 機械的に検査されるエビデンスの台帳 — `src/verification.rs` から生成した、ステータス、モジュール、テスト、外部のオラクルを伴うすべての機能の行 |
| [Modelled の理由](docs/MODELLED-RATIONALE.md) | レビュアー | 各 **Modelled** の行に外部のオラクルがない理由を、行ごとに記載 |
| [来歴](docs/PROVENANCE.md) | レビュアー / 引用者 | すべてのセンサーのパラメーター、モデル、データセットを、公表された出典までたどった 1 つの引用可能な表 |
| [再現性と来歴](docs/REPRODUCIBILITY.md) | レビュアー / パッケージャー | 決定論性の保証、ゴールデンによる固定、SBOM（ソフトウェア部品表）、ビルドの来歴 |
| [Wheel のプラットフォームタグ](docs/WHEEL_TAGS.md) | パッケージャー | abi3 の Python の wheel のマトリクス — `pip install kshana` がどのプラットフォームタグに解決されるか |
| [位置付け](docs/POSITIONING.md) | 評価者 | RTKLIB/gLAB に対する Kshana の位置付け（相補的）と、インストール不要のブラウザーの層 |
| [Kshana Pro](docs/PRO.md) | 評価者 / プログラムマネージャー | プロプライエタリな Pro のオーバーレイが同じエンジンに加えるもの：設計最適化器、不確かさと感度、ミッションドシエ、キャンペーンの監視、スペクトルの共存、オンプレミスのジョブサービス、要求のトレーサビリティ。それぞれが何を生成し、何をしないか |
| [技術報告書](paper/kshana-technical-report.md) · [JOSS 論文](paper/paper.md) | レビュアー / 引用者 / 評価者 | 完全な拡張版の研究論文 — アーキテクチャ、ドメインごとのモデル、検証、ケーススタディ、限界 — と、簡潔な JOSS（Journal of Open Source Software）への投稿 |
| [SGP4 の検証](docs/SGP4-VALIDATION.md) | レビュアー / 引用者 | AIAA 2006-6753 の参照との一致（666 の状態、約 4 mm）**と**、独立した `sgp4` クレートとの直接比較（マイクロメートル未満 / 4.12 mm で一致） |
| [力学モデルの検証](docs/AGENCY-ORBIT-VALIDATION.md) | レビュアー / 引用者 | 機関のエフェメリスにフィットしたフルフォースのエンジン（`src/precise_od.rs`）— 方法論と検証済みの残差 |
| [実際の TLE のガイド](docs/REAL_TLE_GUIDE.md) | 利用者 | 実際の Celestrak / Space-Track のコンステレーションの TLE でシナリオを駆動する方法（同梱の合成 Walker セットとの比較） |
| [インテグリティの FoM](docs/INTEGRITY.md) | 評価者 | `integrity` / `security` の数値が何を意味するか — そして航空の HPL/VPL と比べて何では**ない**か |
| [ARAIM のリファレンス](docs/ARAIM_REFERENCE.md) | レビュアー / インテグレーター | オープンな MHSS ARAIM の保護レベルの実装 — `b_k` の公称バイアスの射影、σ_URA と σ_URE の違い、故障モードの事前確率 |
| [量子モデル](docs/QUANTUM.md) · [詳細](docs/QUANTUM-MODELS.md) | レビュアー | 冷却原子干渉計の物理の層と、係数をまだ参照値に頼っている箇所 |
| [コンプライアンス](docs/COMPLIANCE.md) | 評価者 | DO-229E / DO-316 のアルゴリズムの範囲と、適合の主張では**ない**もの |
| [海事の信頼性](docs/MARITIME-TRUST.md) | 船員 / インテグレーター | 船舶の NMEA に対する 0-100 の GNSS 信頼スコア、そのモニターと限界（助言用であり、型式承認を受けた航法装置ではありません） |
| [NMEA 訓練用ストリーム](docs/NMEA-TRAINING.md) | 海事の訓練担当者 | スクリプト化されたジャミングとスプーフィングを含む合成の船橋 NMEA と教官用ログ。テキストのみであり、ライブの航法には決して使用しないこと |
| [干渉マップ](docs/INTERFERENCE-MAP.md) | アナリスト / 船員 | 航空機と船舶が劣化した航法データを報告した場所と、それがルートのどれだけに及ぶか |
| [エビデンスパック](docs/EVIDENCE-PACKS.md) | 運用者 / 保険会社 | 信頼に関するイベントの署名付きの技術的記録と、その検証方法 |
| [信頼テレメトリー](docs/TRUST-TELEMETRY.md) | 運用 / セキュリティのチーム | 信頼のストリームを Prometheus の指標、SIEM のイベント、OpenTelemetry として。Grafana ダッシュボード付き |
| [海事向けの統合](docs/MARINE-INTEGRATIONS.md) | 船の所有者 / インテグレーター | Signal K プラグイン、OpenCPN のゲートモード、リファレンスビルド |
| [テストベンチ](docs/TEST-BENCH.md) | 受信機メーカー | エクスポートしたシナリオをラボのシミュレーターで再生し、受信機のログをスコアリングする方法 |
| [コンプライアンスのマッピング](docs/compliance/README.md) | 評価者 | 公開されているレジリエンスのフレームワークを Kshana の出力に対応付けたもの。出典とギャップ付き。`kshana compliance-report` |
| [ノートブック](notebooks/README.md) | 利用者 | 描画済みのテキスト付きの実行可能なチュートリアル |
| [標準と相互運用性](docs/STANDARDS.md) | インテグレーター | Kshana が読み書きする GNSS / フライトダイナミクス / 機関の交換形式（RINEX、SP3、CCSDS OEM/OMM/TDM/Space-Packet、…） |
| [LEO PNT の融合](docs/LEO-PNT-FUSION.md) | 利用者 / 評価者 | MEO + LEO の融合による測位・航法・タイミング：任意のコンステレーションにわたるドップラー、結合擬似距離、PPP の収束、5G NTN、極域のカバレッジ、LEO による時刻転送。任意のプリセットとその公開ソース |
| [キャンペーン](docs/CAMPAIGNS.md) | 利用者 / 評価者 | シナリオの組み合わせ：連鎖ミッションのタイムライン、パラメータースイープ、モンテカルロのアンサンブル、共通条件の実行と、テストが固定する組み合わせの恒等式 |
| [シナリオのカタログ](docs/SCENARIOS.md) | 利用者 / インテグレーター | ディスパッチ可能なすべての種別と、その必須および任意の TOML フィールド — `api::list_scenario_kinds()` から生成 |
| [結果のスキーマ](docs/SCHEMA.md) | インテグレーター | 結果の JSON のすべてのフィールドを、単位と出典へのポインターとともに |
| [Python API](docs/PYTHON_API.md) | Python の利用者 | PyO3 のバインディングの範囲 — エンジンの呼び出し、シナリオ/結果の型、例 |
| [主張と実態](docs/CLAIMS-VS-REALITY.md) | レビュアー | 過剰な主張を解消するための台帳 + それを解消済みに保つ CI のガード（`tests/no_overclaims.rs`） |
| [ロードマップ](ROADMAP.md) | すべての人 | 段階的なロードマップ — 何が提供済みで、次は何か |
| [MCP サーバー](mcp/kshana-mcp/README.md) · [JetBrains プラグイン](ide/jetbrains/README.md) | エージェント / IDE の利用者 | AI アシスタントや JetBrains IDE から Kshana を実行 |
| [エージェントのガイド](docs/AGENTS.md) · [サーフェス](docs/SURFACES.md) | エージェント / インテグレーター | どのツールがどの問いに答えるか、各回答とともに何を保持すべきか。各機能がどこから利用できるか（CLI、Rust、Python、WASM、MCP、プラグイン、JetBrains、ノートブック）と、セルが N/A である理由 |
| [変更履歴](CHANGELOG.md) | すべての人 | リリース済みの履歴（Keep a Changelog + SemVer、Semantic Versioning） |
| [コントリビューション](CONTRIBUTING.md) | コントリビューター | ビルド、ガード、テスト/引用の規律、DCO（Developer Certificate of Origin） |
| [ガバナンス](GOVERNANCE.md) | コントリビューター / コミュニティ | Kshana の運営方法 — 誰が、どのように決めるか、そしてオープン/クローズドの境界 |
| [行動規範](CODE_OF_CONDUCT.md) | コミュニティ | 期待される行動（Contributor Covenant） |
| [セキュリティポリシー](SECURITY.md) | 報告者 | 脆弱性の報告方法。デュアルユースに関する注記 |

</details>

<details>
<summary>主要な参考文献</summary>

### 主要な参考文献

**検証のオラクルと標準** — Kshana の確認の拠り所となっている外部の権威：

- Vallado, Crawford, Hujsak & Kelso — *Revisiting Spacetrack Report #3*（[AIAA 2006-6753](https://doi.org/10.2514/6.2006-6753)、[テストデータ](https://celestrak.org/publications/AIAA/2006-6753/)）：Kshana が 4.12 mm で一致する SGP4/SDP4 の検証セットと、TEME→ITRF のチェーンを確認する座標系の計算例。
- IAU [SOFA](https://www.iausofa.org/) / [ERFA](https://github.com/liberfa/erfa) — IAU 2000A の章動と CIO GCRS↔ITRS の変換をビット単位で検証している、参照用の時刻と座標系のルーチン。
- Petit & Luzum (eds.) — *IERS Conventions (2010)*、[IERS TN（Technical Note）36](https://iers-conventions.obspm.fr/)（地球姿勢、極運動、座標系の標準）。
- Riley — *Handbook of Frequency Stability Analysis*、[NIST SP 1065](https://nvlpubs.nist.gov/nistpubs/Legacy/SP/nistspecialpublication1065.pdf)（Allan 偏差の関係式と NBS14 の参照系列。NBS = 旧米国国立標準局）。
- Pedregosa et al. — *scikit-learn: Machine Learning in Python*、[JMLR 12 (2011)](https://jmlr.org/papers/v12/pedregosa11a.html)：RF 障害の評価テストベッドが完全一致する、参照用の ROC/AUC、混同行列、適合率/再現率/F1 の実装（`tests/eval_metrics_reference.rs`）。
- Virtanen et al. — *SciPy 1.0*、[Nature Methods 17 (2020)](https://doi.org/10.1038/s41592-019-0686-2)：`optimize.nnls`、`stats.chi2`、`linalg.expm` — 量子トレードの実測 ADEV の NNLS フィット、χ² の整合性帯域、van-Loan の時計のプロセス雑音共分散を検証している参照用のルーチン（`tests/scipy_reference.rs`）。
- Knowles, Kanhere, Neamati & Gao — *gnss_lib_py*、[SoftwareX 27 (2024)](https://doi.org/10.1016/j.softx.2024.101811)：オープンな先行事例として（下記の *比較とオープンな先行事例* を参照）、また GDOP/PDOP/HDOP/VDOP/TDOP の計算が 1e-6 で一致する **独立した DOP のオラクル** として使用（`tests/dop_reference.rs`）。
- Montenbruck & Gill — *Satellite Orbits: Models, Methods and Applications*（[Springer](https://doi.org/10.1007/978-3-642-58351-3)）：機関の精密エフェメリスへの力学モデルのフィットの背後にある力学モデル。
- Howell — *Three-dimensional, periodic, halo orbits*、Celestial Mechanics 32(1) (1984)、[doi:10.1007/BF01358403](https://doi.org/10.1007/BF01358403)。Zimovan-Spreen, Howell & Davis — *Near rectilinear halo orbits and nearby higher-period dynamical structures*、Astrodynamics 6 (2022)、[doi:10.1007/s42064-021-0125-x](https://doi.org/10.1007/s42064-021-0125-x)（CR3BP の微分修正器が再現するハロー/NRHO のファミリー）。

**機器と手法の物理** — センサーモデルの背後にある引用文献：

- Origlia, Schiller, Bongs et al. — [arXiv:1503.08457](https://arxiv.org/abs/1503.08457)（ストロンチウム光格子時計、宇宙向けの目標）。
- Oelker et al., *Nature Photonics* (2019) — [doi:10.1038/s41566-019-0493-4](https://doi.org/10.1038/s41566-019-0493-4)（ラボの Sr 時計、4.8×10⁻¹⁷）。
- Templier et al., *Science Advances* (2022) — [arXiv:2209.13209](https://arxiv.org/abs/2209.13209)（ハイブリッド量子加速度計の 3 軸構成）。
- Groves, *Principles of GNSS, Inertial, and Multisensor Integrated Navigation* — [IEEE AESS（Aerospace and Electronic Systems Society）のチュートリアル（University College London Discovery リポジトリ）](https://discovery.ucl.ac.uk/id/eprint/1470141/)（推測航法の誤差増大）。
- Giorgetta et al., *Nature Photonics* 7, 434 (2013) — [arXiv:1211.4902](https://arxiv.org/abs/1211.4902)。Deschênes et al., *Phys. Rev. X* 6, 021016 (2016) — [APS（American Physical Society）](https://journals.aps.org/prx/abstract/10.1103/PhysRevX.6.021016)（光による双方向の時刻周波数転送。光衛星間リンクは、その非相反性のバジェットをこれらに倣ってモデル化しています）。
- Betz — *Binary Offset Carrier Modulations for Radionavigation*、NAVIGATION 48(4) (2001)、[doi:10.1002/j.2161-4296.2001.tb00247.x](https://doi.org/10.1002/j.2161-4296.2001.tb00247.x)（`src/navsignal.rs` の背後にある BOC 変調とスペクトル分離の理論）。
- Kaplan & Hegarty (eds.) — *Understanding GPS/GNSS: Principles and Applications*（第 3 版、Artech House、2017）：航法信号とジャミングのモデルが使う、アンチジャムの実効 C/N₀ の式と early–late DLL のコード追尾の熱雑音ジッター。

**比較とオープンな先行事例** — Kshana の位置付けの比較対象となるツールとサーベイ：

- Humphreys et al. — [*TEXBAT*](https://radionavlab.ae.utexas.edu/texbat/)（Texas Spoofing Test Battery。ION — Institute of Navigation — GNSS 2012）：多層検出器の特性評価に使うスプーフィングの試験バッテリーのパラメーター。
- González et al. — [NaveGo](https://github.com/rodralez/NaveGo)（2017）：古典的なベースラインとして使う、オープンで検証済みの慣性航法の誤差プロファイル。
- Iiyama, Casadesús Vila & Gao — [*LuPNT*](https://github.com/Stanford-NavLab/LuPNT)（ION GNSS+ 2023、Stanford NavLab）：オープンな月の PNT シミュレーター。
- Knowles, Kanhere, Neamati & Gao — *gnss\_lib\_py*、SoftwareX 27 (2024)、[doi:10.1016/j.softx.2024.101811](https://doi.org/10.1016/j.softx.2024.101811)：オープンな GNSS データ解析。
- Li, Zaminpardaz, Kealy & Greentree — *Quantum sensors for enhanced positioning and navigation: a comprehensive review*、GPS Solutions 30(1):62 (2026)、[doi:10.1007/s10291-026-02030-y](https://doi.org/10.1007/s10291-026-02030-y)。
- Bertone et al. — *Earth and Space Science* 8(6) (2021)、[doi:10.1029/2020EA001454](https://doi.org/10.1029/2020EA001454)：GRAIL の縮約動力学 OD。LRO のフィットが再現する経験的加速度の下限。

</details>
