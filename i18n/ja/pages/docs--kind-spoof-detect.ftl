# docs--kind-spoof-detect: translations (ja)

seg-f92f902bd8f4 = ソース：<c1/>

seg-1fd6a1cc7ca0 = <c1/>（シナリオ種別）

seg-f43fe94d84e0 = RF と測定値を組み合わせたスプーフィング検出器（複数 SV の RAIM 整合性 + AGC + SQM を融合）を、パラメーター化した攻撃（電力優位、搬送波位相の整合、時刻・位置の押し出し；TEXBAT 方式）に対して評価します。

seg-9a8e92a0d5ba = <c1/> の一回の実行の要約：scenario e046ee4ca90a | spoof-detect | { "8" } SVs, +{ "1.5" } dB | Position push | fused score { "0.70" } (thr { "0.50" }) | SPOOF DETECTED (fused) — layers: RAIM+SQM

seg-9e54f6406cef = 必須フィールド：<c1/>

seg-cd7217fd359f = 任意フィールド：<c1/>、<c2/>

seg-6776ea465261 = 例 <c1/> では、とりわけ次を設定しています：

seg-0e3bc92db34e = 位置

seg-268ebf4cba99 = エンジンが scenarios/spoof-detect.toml（種別 spoof-detect）に対して出力するグラフ

seg-03d8dc3de7ca = <b>MODELLED</b> クロック支援 χ²、RAIM、AGC、SQM を融合したエポックごとのセキュリティ性能指標 テスト：<a1>spoof_texbat_validation.rs</a1>。

seg-24e4aebb09eb = <s1>前へ</s1>spectrum

seg-40e934a7d78f = <s1>次へ</s1>spoof

seg-7707c45d1d30 = dBm

seg-304496607bd7 = エンジン v{ $version } のシナリオ種別で、ファミリーは<a1>ジャミング、スプーフィング、スペクトラム</a1>です。助言のみ：研究・エンジニアリング用ツールによる解析出力であり、型式承認を受けた航法装置ではなく、人命安全（safety-of-life）サービスでもありません。ここにあるラベルはすべてエンジンまたは検証マトリクスによるものです；検証マトリクスが別途示さない限り、種別は MODELLED です（ラベルの獲得方法：README の Evidence の節）。

seg-5d23d7f8f872 = ファミリーページ：<a1>ジャミング、スプーフィング、スペクトラム</a1>

seg-debc2f07db78 = true

seg-37d16b499bc5 = dB

seg-51362910dcb7 = 同梱のシナリオのうち{ "2" }個がこの種類を使用しています。その他は<a1><c1/></a1>にあります。

seg-98151954f217 = false

seg-59afd80736c5 = <b>PARTNER</b>提供しません — Kshanaは信号性能をモデル化するものであり、ペイロード／アンテナのハードウェアではありません。オラクル（NoneKind）：なし：パートナーが所管する分野であり、設計上、モジュールもテストもありません

seg-c4ed27a559df = トピックページ：<a1>RESILIENCE-CROSSWALK.md</a1>

seg-b9174c70772f = <b>MODELLED</b>時計支援の χ²、RAIM、AGC、SQMをエポックごとに融合したセキュリティFoM。オラクル（ExternalDataset）：TEXBATのシナリオパラメーター（Humphreys { "2012" }）— 特性評価であり、固定したベクトルではありません。{ "0.30" }外部比較、所見（MODELLEDのまま）：JammerTest { "2024" }（Bleik、GPL-3.0のデータ）では、観測量レベルのモニター（時計支援のカイ二乗、RAIM、解の失敗）は、評価可能な公表済みスプーフィング開始{ "8" }件のいずれについても{ "10" }秒以内に警報を出しませんでした（開始前のウィンドウがクリーンだった場合、最初の警報は{ "10.2" }〜{ "39" }秒後に出ました。公

seg-e4b64d7277da = スプーフィングの検出はMODELLEDであり、独立した外部の参照との照合はされていません。サブクレームの一つは外部で確認されていますが、機能全体はモデルから計算した要素を組み合わせているため、この機能はモデルから計算したものにとどまります。（検証マトリクス（docs/MODELLED-RATIONALE.md））

seg-ee7dd15019d0 = トピックページ：<a1>CAMPAIGNS.md</a1>
