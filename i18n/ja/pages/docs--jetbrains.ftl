# docs--jetbrains: translations (ja)

seg-f8a0fe9968c4 = ソース：<c1/>

seg-c55e49fd2a72 = JetBrains IDE向けKshana

seg-d7280bb554bf = <a1>JetBrains Marketplaceの<b>Kshana — PNT simulator</b></a1>。または、任意のJetBrains IDEで<em>Settings → Plugins → Marketplace → 「Kshana」を検索</em>してください。

seg-959ab829762c = 任意のJetBrains IDE（IntelliJ IDEA、CLion、RustRover、PyCharmなど）の中から<b>Kshana</b>のPNTレジリエンスシミュレーターを実行するネイティブプラグインです。シナリオの<c1/>を右クリックして<b>Run Kshana Scenario</b>を選ぶと、性能指標と結果JSONが<b>Kshana</b>ツールウィンドウにストリーム表示されます。

seg-594199d2ce06 = <a1>MCPサーバー</a1>（JetBrainsの<em>AI Assistant</em>がKshanaを利用できるようにするもの）を補完します。このプラグインは、<em>人間</em>がポイント＆クリックで使う経路です。

seg-a356f2c30afb = 任意の<c1/>に対する<b>Run Kshana Scenario</b>アクション（エディターとプロジェクトビューのコンテキストメニュー）。<c2/>を実行し、出力をKshanaツールウィンドウに表示します。

seg-116d04ae5538 = <c1/>シナリオ<c2/>に対する<b>Assess Receiver Trust</b>（<c3/>）：船舶向けの、0〜100のスコアと理由を伴う信頼性タイムライン。助言用ソフトウェアであり、型式承認を受けた航法装置（IEC { "61108" }、IEC { "61162" }）ではありません。船舶の航行の責任は引き続き運用者にあります。

seg-726d88d0dea7 = <c1/> <c2/>に対する<b>Generate Training NMEA</b>（<c3/>）：合成の船橋用NMEAと教官ログを、シナリオの隣に書き出します。テキストのみで、訓練用です。船舶の実際の航法システムには決して使用しないでください。

seg-99510426a384 = ADS-BまたはAISの<c1/>に対する<b>Build Interference Map</b>（プロジェクトビュー。承認済みのどのデータセットかを尋ねます）、およびルートファイルに対する<b>Route Exposure</b>（マップのフォルダーを尋ねます）。劣化したセルは、干渉が原因であることを示すものではありません。予報でもありません。

seg-8c50e6aeb5e2 = シナリオ<c1/>に対する<b>Export Test-Bench Files</b>（<c2/>）：実験室用GNSSシミュレーター向けの、機体の運動、NMEA、ラベル付きイベントを、シナリオの隣に書き出します。信号は書き出しません。シミュレーターは許可された場所でのみ動作させてください。

seg-79c553c303c5 = 実行結果<c1/>に対する<b>Build Compliance Report</b>（<c2/>）、および<b>Tools → Show Compliance Mapping</b>（<c3/>）：公開フレームワークとの対応表を、エンジン自身の記述のとおりに一字一句そのまま表示します。

seg-9b6ce5bbb523 = エビデンスパックのフォルダーに対する<b>Verify Evidence Pack</b>（プロジェクトビュー。<c1/>）：署名者の公開鍵（{ "64" }桁の 十六進数、または<c2/>ファイル。常にピン留めされ、プラグインは署名者がピン留めされていないものを受け付けません）と、任意で完全なセッションログを尋ねます。検証に成功した結果だけがverifiedと表示されます。署名者がピン留めされていない無傷のパックは「NOT VERIFIED」と表示されます。

seg-253d5b7f94ce = <c1/>の結果<c2/>に対する<b>Render Trust Telemetry</b>（<c3/>）：Prometheusテキスト、CEF/LEEFのsyslogイベント、またはHome AssistantのMQTT行を、Kshanaウィンドウに出力します。何も送信せず、何も提供しません。稼働し続けるエクスポーターはコマンドラインで扱います。

seg-ce12ebcdccb5 = 静止状態のIMUの<c1/>に対する<b>Fit Sensor Parameters from IMU Log</b>（<c2/>）：<c3/>および<c4/>シナリオの加速度計とジャイロのパラメーターをアラン偏差でフィットし、<c5/>テーブルとしてKshanaウィンドウに出力します。何も書き込みません。このフィットはMODELLEDです。

seg-b81f27c51c22 = <b>Validate Scenario</b>（<c1/>）、<b>List Scenario Kinds</b>（Toolsメニュー。<c2/>）、<b>Assess Receiver Stream</b>（船舶セッション<c3/>と、選択した保存済みNMEAログ。<c4/>。ソケットもゲートもなしで 一回スコアリング）。

seg-38037d36639c = <b>Insert Example Scenario</b>（プロジェクトビューのフォルダーまたはToolsメニュー。<c1/>）：同梱のシナリオを選ぶと、新しい<c2/>として書き出されます（既存のファイルを上書きすることはありません）。<c3/>に対する<b>Export Scenario</b>（SP3、OMM、OEM、CZML、KML、GeoJSON、STK、SigMF。シミュレーションによる出力のみ）、<b>Animate Scenario</b>（HTMLまたはSVG。ブラウザーで開きます）、およびルートの<c4/>に対する<b>Import Route</b>（どのシナリオかを尋ねます）。

seg-1f1b18f8e102 = receiver-trustセッション<c1/>に対する<b>Create Evidence Pack</b>（<c2/>）：ウィンドウ、すでにお持ちの署名鍵ファイル、出力フォルダーを尋ねます。プラグインは鍵の作成、読み取り、保存を一切行いません（<c3/>はコマンドラインのままです）。パックフォルダーに対する<b>Attach Timestamp</b>（<c4/>）：Kshanaはタイムスタンプ局の署名を確認しません。<c5/>はご自身で実行してください。

seg-f4f6605d3db9 = 引き続きコマンドラインのみ：IQコマンド、<c1/>、<c2/>。

seg-63efd04104f1 = 実行コンソールを収容する、下部の<b>Kshana</b>ツールウィンドウ。

seg-decda07aa7eb = プラグインにないもの：<c1/>（ゲートと任意のTCPリスナーを備えた、長時間動作するストリームプロセス）と<c2/>は、IDEのアクションがコマンドを最後まで実行して出力を表示するものであるため、コマンドラインのままです。<c3/>を参照してください。

seg-9c185454d0c0 = <b>Settings → Tools → Kshana</b>で<c1/>バイナリを指定します（空欄の場合は<c2/>から解決。インストールは<c3/>）。

seg-44dfdd65bd0a = このプラグインはプラットフォームのみで構成され（言語固有の依存関係なし）、ビルド{ "243" }（{ "2024.3" }）以降のすべてのJetBrains IDEで読み込まれます。

seg-453bd42c23fa = ビルドと実行

seg-b5328f8c7a8a = JDK { "17" }以上（ビルドはJDK { "21" }に固定）と、同梱のGradleラッパーが必要です。

seg-758124ceb1c7 = <c1/>は、既定ではsince-buildの{ "2024.3" }を検査します。他のラインを検査するには<c2/>として列挙します（各IDEは約{ "1" } GBのダウンロードです）：

seg-15d175aaeb59 = このプラグインは、それらのいずれにおいても、非推奨または削除予定のプラットフォームAPIを使用していません。この状態を維持してください（選択ダイアログは<c2/>ではなく<c1/>を通します）。

seg-39cfd740d9b3 = ビルドしたzipは<b>Settings → Plugins → ⚙ → Install Plugin from Disk…</b>からインストールします。

seg-87aff08f344c = 構成

seg-73b3f55b7208 = 分離

seg-a14db8de576a = <c1/>や<c2/>と同様に、これは独立したGradleプロジェクトであり、公開される<c3/>クレートからは除外されています（パッケージの<c5/>内の<c4/>）。ビルド出力はgitignoreの対象です。

seg-b38914a430b9 = ライセンス：AGPL-3.0-only（またはAshforde OÜ の商用ライセンス。リポジトリの<c1/>を参照）。

seg-bb286e3ce9c9 = <s1>前へ</s1>各機能にどこからアクセスできるか

seg-e62586b5f58c = <s1>次へ</s1>Kshanaの動作環境
