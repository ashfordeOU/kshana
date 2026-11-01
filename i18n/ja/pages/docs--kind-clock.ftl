# docs--kind-clock: translations (ja)

seg-debc2f07db78 = true

seg-33555d61ddc6 = ソース：<c1/>

seg-618393657d01 = <c1/>（シナリオの種類）

seg-c61e88721556 = エンジンv{ $version }のシナリオの種類。ファミリー：<a1>時計、タイミング、ホールドオーバー</a1>。助言のみ：研究・エンジニアリング用ツールによる解析出力であり、型式承認を受けた航法装置ではなく、人命安全（safety-of-life）サービスでもありません。ここにあるラベルはすべてエンジンまたは検証マトリクスによるものです。検証マトリクスに別の記載がない限り、シナリオの種類はMODELLEDです（ラベルの付与のされ方：READMEのEvidenceセクション）。

seg-78cba87823f7 = 時計のホールドオーバーと仕様の比較。任意のモンテカルロのアンサンブル（runs > { "1" }）。

seg-dd2ad570a6c9 = <c1/>の一回の実行は、次のように要約されます：scenario 91d2b6d10d14 | { "200" } runs | quantum holdover 6600s [6600-6600] p95 8.78e-4ns security n/a (no attack) | classical holdover 844s [220-2130] p95 167.0ns security n/a (no attack)

seg-51820163de28 = 必須フィールド：<c1/>、<c2/>、<c3/>、<c4/>、<c5/>、<c6/>

seg-80fe14eb5e79 = 任意フィールド：<c1/>、<c2/>

seg-807e7c5a2565 = 例の<c1/>が設定している項目（一部）：

seg-b0a5473bec67 = Microchip SA65 / SA.45s CSACのデータシートsigma_y(1s)={ "3e-10" }；q_

seg-a8d92406e428 = ストロンチウム光格子時計、宇宙向けの目標sigma_y

seg-0cd8dc81045c = 同梱のシナリオのうち{ "4" }個がこの種類を使用しています。その他は<a1><c1/></a1>にあります。

seg-cb0b7da83f5c = scenarios/clock-ensemble.toml（種類clock）についてエンジンが書き出すグラフ

seg-5b3dbe0aed82 = <b>MODELLED</b>クロック種類の任意の[integrity]セクション（clock_integrity::run）：指定した地点とコンステレーションのプリセット（geometry::sky_geometry）から、GNSSのタイムラインが拒否されていない間のすべてのインテグリティエポックで、スナップショットRAIM（raim::snapshot_ テスト：<a1>clock_integrity.rs</a1>。

seg-e1b9b2d674eb = <b>MODELLED</b> clock_log::read_input：RINEXクロックファイル（指定した一つの時計のAS/ARレコード、バージョン{ "2" }および{ "3.00" }〜{ "3.04" }）、TimeLab形式のASCII位相または周波数ログ、あるいはTAPR TICCのタイムスタンプまたは間隔ログを、均一な位相 テスト：<a1>clock_log_allantools.rs</a1>。

seg-eddb613a2a2f = <b>MODELLED</b>フォーマットptp4l、phc2sys、ts2phc、chrony-tracking、chrony-statisticsでのclock_log::read_input：linuxptpのサーボ行に記録されたオフセット（ns、その行自身のブラケット付きタイムスタンプ、サーボが最初にs2を報告するより前の読み取り値は除外

seg-f70076ea4a77 = <b>VALIDATED</b>アラン偏差／修正アラン偏差／アダマール偏差と、χ² 信頼区間付きのべき乗則ノイズの同定。オラクル（ExternalDataset）：NIST SP { "1065" }（Riley）／NBS14に対するStable32の参照偏差

seg-5278ccdaf16f = <b>MODELLED</b>閉形式の惰性誤差増大としきい値までのホールドオーバー、量子時計のクラス。オラクル（ReferenceImpl）：複数ステップのclock_stateの共分散漸化（同じコードベース内でのクロスチェック）。基礎となる惰性分散とホールドオーバー逆算のカーネルは、scipyに対して外部で照合済みです（「Clock-holdover coast-variance & threshold inversion」を参照）。クラスごとのレッドノイズフロアのホールドオーバーの数値はMODELLEDのままです

seg-3ea0aa9b3907 = <b>MODELLED</b> 3状態（位相／周波数／ドリフト）のvan-Loanカルマン時計、ジョセフ形で安定化。オラクル（ReferenceImpl）：filterpy { "1.4.5" }のKalmanFilter（R. Labbe、MIT）、Fはscipy.linalg.expm、QはVan-Loan { "1978" }のブロック行列によるもの。kshanaのフィルター軌跡全体を再現する、独立した参照実装です。実装間の整合性：時計の物理とアラン偏差の較正は外部の参照とは照合されていないため、これはMODELLEDのままです。{ "0.30" }外部比較、所見（MODELLEDのまま）：IGSの最終{ "30" }秒クロック、{ "11" }機のGPS Blo

seg-b9174c70772f = <b>MODELLED</b>時計支援の χ²、RAIM、AGC、SQMをエポックごとに融合したセキュリティFoM。オラクル（ExternalDataset）：TEXBATのシナリオパラメーター（Humphreys { "2012" }）— 特性評価であり、固定したベクトルではありません。{ "0.30" }外部比較、所見（MODELLEDのまま）：JammerTest { "2024" }（Bleik、GPL-3.0のデータ）では、観測量レベルのモニター（時計支援のカイ二乗、RAIM、解の失敗）は、評価可能な公表済みスプーフィング開始{ "8" }件のいずれについても{ "10" }秒以内に警報を出しませんでした（開始前のウィンドウがクリーンだった場合、最初の警報は{ "10.2" }〜{ "39" }秒後に出ました。公

seg-e12f672ae71d = GNSSが使えない状況での時計のホールドオーバーはMODELLEDであり、独立した外部の参照との照合はされていません。同じコードベース内の別個の実装に照らして確認しており、テスト対象のユニットからは独立していますが、外部の権威あるものではありません。（検証マトリクス（docs/MODELLED-RATIONALE.md））

seg-8de95b3a9229 = 搭載時計の状態推定はMODELLEDであり、独立した外部の参照との照合はされていません。同じコードベース内の別個の実装に照らして確認しており、テスト対象のユニットからは独立していますが、外部の権威あるものではありません。（検証マトリクス（docs/MODELLED-RATIONALE.md））

seg-e4b64d7277da = スプーフィングの検出はMODELLEDであり、独立した外部の参照との照合はされていません。サブクレームの一つは外部で確認されていますが、機能全体はモデルから計算した要素を組み合わせているため、この機能はモデルから計算したものにとどまります。（検証マトリクス（docs/MODELLED-RATIONALE.md））

seg-849c08d3ce70 = ファミリーページ：<a1>時計、タイミング、ホールドオーバー</a1>

seg-ee7dd15019d0 = トピックページ：<a1>CAMPAIGNS.md</a1>

seg-46ed0b786244 = トピックページ：<a1>RECEIVER-TRUST.md</a1>

seg-e06f9a5a0291 = <s1>前へ</s1>cislunar-observability

seg-aba9395185fa = <s1>次へ</s1>combined-altpnt

seg-d1beb62cf742 = この kind を使う同梱シナリオは { "6" } 件です。その他は<a1><c1/></a1>にあります。

seg-936e96edf423 = <b>MODELLED</b> <c1/> kind：フェーズの文書で、各フェーズは登録済みの八つの kind のいずれかです。フェーズは順に実行され、6x6 共分散、クロック、座標系が、明記した規則のもとで引き継がれます（<c2/>、<c3/>は、明記した区間にわたる白色加速度ノイズ テスト：<a1>field_units_global.rs</a1>。

seg-3319b18ac61f = ほかに { "1" } 件がマトリクスにあります。
