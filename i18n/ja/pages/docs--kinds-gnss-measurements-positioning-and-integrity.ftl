# docs--kinds-gnss-measurements-positioning-and-integrity: translations (ja)

seg-6e0cb6acc073 = VALIDATED

seg-4e31c8daf798 = 台帳

seg-d1c67e3dd12e = MODELLED { "1" } · VALIDATED { "2" }

seg-c9cf40c5e609 = ソース：<c1/>

seg-569fac649b5d = GNSS の測定、測位、インテグリティ（シナリオ種別ファミリー）

seg-63c3a7483268 = エンジン v{ $version } のシナリオ種別 { "6" } 件。助言のみ：研究・エンジニアリング用ツールによる解析出力であり、型式承認を受けた航法装置ではなく、人命安全（safety-of-life）サービスでもありません。ここにあるラベルはすべてエンジンまたは検証マトリクスによるものです。検証マトリクスに別の記載がない限り、種別は MODELLED です（ラベルの付与方法：README のエビデンスの節）。

seg-33a602147cc2 = トピックページ：<a1>INTEGRITY</a1>、<a2>POSITIONING</a2>、<a3>ARAIM_REFERENCE</a3>、<a4>OSNMA</a4>。実行例：<c1/>。全ファミリー：<a5>KINDS.md</a5>。

seg-9c60c8803b6b = ファミリー「GNSS の測定、測位、インテグリティ」の種別についてエンジンが出力するグラフのコンタクトシート

seg-045ecd7c036f = MODELLED { "6" } · VALIDATED { "4" }

seg-6698e12e148b = 実観測の単独測位：RINEX { "3" } 観測ファイルと放送航法ファイルから受信機の位置を解きます（コード疑似距離、放送エフェメリス、Klobuchar 電離圏、Saastamo

seg-da89c260b1a3 = 公開されている ARAIM 認証の参照ベクトル：エンジンの ARAIM 水平・垂直保護レベルを、WG-C ARAIM 技術サブグループ自身が示した数値例に対して、許容差で実行

seg-7a750a89c9c4 = 宇宙天気環境モデル：太陽（F10.7/F10.7a）および地磁気（Kp、定義上の Kp↔ap 表を含む）の活動指数、それらが駆動する Jacchia-1971 の外圏温度（公表されている値に対して独立に確認済み

seg-d79d4d58275b = リアルタイムの月座標系・地球姿勢予測バジェット：P4 表 { "1" }（座標系誤差の整合性チェック — 後処理 ~{ "0.27" } m ↔ ~{ "0.010" } ms、リアルタイム ~{ "15" } m ↔ ~{ "0.5" } ms、各座標系の位置を表現

seg-dc783268156c = 必須フィールド：<c1/>、<c2/>、<c3/>、<c4/>、<c5/>、<c6/>、<c7/>、<c8/>、<c9/>。任意：<c10/>、<c11/>、<c12/>、<c13/>、<c14/>、<c15/>、<c16/>。

seg-7b110aacdb27 = <b>台帳：</b>MODELLED { "6" } · VALIDATED { "4" }。入力、結果、エビデンス、制限事項を含む全ページ：<a1>integrity</a1>。

seg-d444fb35cae9 = 必須フィールド：<c1/>、<c2/>、<c3/>、<c4/>。任意：<c5/>、<c6/>、<c7/>、<c8/>、<c9/>、<c10/>、<c11/>、<c12/>、<c13/>、<c14/>、<c15/>、<c16/>。

seg-b651ec58bcba = <b>台帳：</b>VALIDATED。入力、結果、エビデンス、制限事項を含む全ページ：<a1>gnss-sim</a1>。

seg-b9a21187317d = 必須フィールド：<c1/>、<c2/>。任意：<c3/>、<c4/>、<c5/>、<c6/>。

seg-143dc4fd1d44 = <b>台帳：</b>MODELLED。入力、結果、エビデンス、制限事項を含む全ページ：<a1>pvt</a1>。

seg-9ca1f6783e8e = 必須フィールド：なし。任意：<c1/>。

seg-415f1fa78518 = <b>台帳：</b>VALIDATED。入力、結果、エビデンス、制限事項を含む全ページ：<a1>araim-reference-check</a1>。

seg-6c4655b35c65 = 必須フィールド：なし。任意：<c1/>、<c2/>、<c3/>、<c4/>。

seg-1e5052c0bce7 = <b>台帳：</b>MODELLED。入力、結果、エビデンス、制限事項を含む全ページ：<a1>space-weather</a1>。

seg-64c512530ee6 = 必須フィールド：なし。任意：<c1/>、<c2/>、<c3/>、<c4/>、<c5/>、<c6/>、<c7/>、<c8/>、<c9/>、<c10/>、<c11/>、<c12/>、<c13/>、<c14/>、<c15/>。

seg-1c244958d3c4 = <b>台帳：</b>MODELLED { "1" } · VALIDATED { "2" }。入力、結果、エビデンス、制限事項を含む全ページ：<a1>realtime-frame-eop</a1>。

seg-d4adf4283480 = <s1>前へ</s1>コンステレーション、カバレッジ、ジオメトリ

seg-2cdfd7f8bfb3 = <s1>次へ</s1>GPS が使えない環境の代替 PNT

seg-b03d56f501c3 = 種類

seg-b7b67e03f125 = 実観測による単独測位：RINEX { "3" } の観測ファイルと放送航法ファイル（コード疑似距離、放送エフェメリス、Klobuchar 電離層、Saastamoinen/Niell 対流圏）から受信機の位置を解き、必要に応じて測量済みの座標と照合して確認します。

seg-d76d59644d84 = エンジンが scenarios/pvt-abmf.toml（種類 pvt）に対して出力するグラフ

seg-edfcb546d9de = リアルタイムの月フレーム・地球姿勢の予測バジェット：P4 表 { "1" }（フレーム誤差の整合性チェック — 後処理 ~{ "0.27" } m ↔ ~{ "0.010" } ms とリアルタイム ~{ "15" } m ↔ ~{ "0.5" } ms。各フレーム位置を L19 のレバーアーム Δr = D_EM·ω⊕·ΔUT1 により等価な UT1 誤差として表現）と表 { "2" }（予測期間に対する UT1 予測誤差の実測 — 実際の IERS finals2000A 系列から直接読み取った L18 の曲線。Bulletin A − Bulletin B の最終フロアと複数日の持続予測器の誤差を、それぞれ L19 で月フレームの位置に変換）、さらに L21 の二乗和平方根によるリアルタイムのフレーム誤差バジェット（EOP＋エフェメリス＋実現フロア）です。閉形式（L19 のレバーアーム、ω⊕ は CIO の地球自転角と相互確認）は VALIDATED、実データ（実際の finals2000A の行から読み取った L18 曲線）も VALIDATED です。MODELLED は、月リレーの OD 共分散の大きさとフレーム実現フロア（代表的な配分）、および持続予測器（IERS の運用用 Bulletin A のアルゴリズムではありません）です。認証を受けたリアルタイムのフレーム製品ではありません。

seg-2721ed7727bb = エンジンが scenarios/realtime-frame-eop.toml（種類 realtime-frame-eop）に対して出力するグラフ

seg-5f25c5b71f0c = 宇宙天気の環境モデル：太陽（F10.7/F10.7a）と地磁気（Kp。定義上の Kp↔ap 表付き）の活動指数、それらが決める Jacchia-1971 の外圏温度（公表された太陽活動極小・平均・極大の値と照合して確認済み）、そして、昼夜平均の外圏温度での Jacchia-1971 の熱圏中性大気密度を、活動を含まない静的プロファイルと複数の高度で比較したもの — 静的な大気が省略している太陽周期による密度の依存性です。MODELLED：密度は、加速度計から導いた密度（TOLEOS の CHAMP と GRACE）と、太陽活動極大期には { "2" } 倍以内で一致しますが、{ "2008" } 年の太陽活動極小期には約 1.7 倍密すぎます。

seg-c1c6f2f73fb5 = エンジンが scenarios/space-weather.toml（種類 space-weather）に対して出力するグラフ

seg-2ffccc9c1eff = 測定領域での疑似距離シミュレーション（Klobuchar 電離圏、Saastamoinen/Niell 対流圏）＋ RAIM。

seg-47ee40d4eb73 = エンジンが scenarios/gnss-sim-raim.toml（種別 gnss-sim）について出力するグラフ

seg-eb7e0c2feb2b = スナップショット／解分離／ARAIM の RAIM と、HPL/VPL、Stanford ダイアグラム。

seg-ce7f6130ddee = エンジンが scenarios/integrity-raim.toml（種別 integrity）について出力するグラフ
