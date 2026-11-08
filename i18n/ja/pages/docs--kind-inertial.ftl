# docs--kind-inertial: translations (ja)

seg-7b2721b7588d = エンジン v{ $version } のシナリオ種別で、ファミリーは<a1>慣性・フュージョン・量子センサー</a1>です。助言のみ：研究・エンジニアリング用ツールによる解析出力であり、型式承認を受けた航法装置ではなく、人命安全（safety-of-life）サービスでもありません。ここにあるラベルはすべてエンジンまたは検証マトリクスによるものです；検証マトリクスが別途示さない限り、種別は MODELLED です（ラベルの獲得方法：README の Evidence の節）。

seg-195347c63a8a = m/s^{ "2" }

seg-3a1d8c59a4c9 = (m/s^{ "2" })^2/Hz

seg-cc7a61264c3f = (m/s^{ "2" })^2/s

seg-451a304052c4 = <b>MODELLED</b> 第一原理からの冷却原子干渉計加速度計（k_eff·T²、QPN）。オラクル（ExternalDataset）：公表されている CAI の原著論文の数値ベクトル（Cheinet { "2008" } の伝達関数；Peters／Freier の感度）：k_eff·T² は完全に一致し、ショット雑音 ASD は片側の下限として、公表されている各装置の約{ "2" }倍以内（実機には量子下限を上回る技術雑音があります）。これは範囲の確認であり、同等性ではありません。{ "0.30" } ラウンド{ "2" }（事前登録 fcb9ac64）、所見（MODELLED のまま）：QPN のみの回転雑音を、実測の Gauguet ら

seg-7e95210bcc48 = <b>MODELLED</b> ホールドオーバー中の、バイアス＋スケールファクター＋VRW＋安定度劣化を合成した位置バジェット。オラクル（ReferenceImpl）：二重積分した白色加速度雑音の独立した numpy モンテカルロ SDE 積分（解析的な VRW 分散を真に独立したアルゴリズムで確認）＋バイアス／スケールファクター項に対する Groves { "2013" } の公表値アンカー；CAI 装置の数値はパートナーのハードウェアを定量化するもので、MODELLED のまま

seg-9955b1b1c018 = 量子慣性センサーの性能は MODELLED であり、独立した外部の参照と照合して確認されてはいません：副次的な主張は外部で検証されていますが、機能全体はモデルから計算した部品を組み合わせているため、この機能はモデルから計算した状態のままです。（検証マトリクス（docs/MODELLED-RATIONALE.md））

seg-5fef5e8cc64e = 量子慣性デッドレコニングのレジリエンスは MODELLED であり、独立した外部の参照と照合して確認されてはいません：この同じコードベース内の別実装と照合していますが、これは被試験ユニットから独立してはいるものの、外部の権威あるものではありません。（検証マトリクス（docs/MODELLED-RATIONALE.md））

seg-f7f12029e0ec = ファミリーページ：<a1>慣性・フュージョン・量子センサー</a1>

seg-ca448daf5ec7 = nominal

seg-496b17a8d3b9 = トピックページ：<a1>QUANTUM-MODELS.md</a1>

seg-753f0302eeef = トピックページ：<a1>QUANTUM.md</a1>

seg-7bebd09c614b = 航法グレードの水晶加速度計（Honeywell QA-2000 / G

seg-cead54058894 = ソース：<c1/>

seg-783be547f01e = <c1/>（シナリオ種別）

seg-bdedf28adc48 = GNSS 途絶中の1-DOF 慣性推測航法。

seg-55b5599ef867 = <c1/>の一回の実行は次のように要約されます：scenario fc9191cef784 | 量子 holdover 6600s p95 41.39m | 古典 holdover 350s p95 30629.9m

seg-b05c3cb45c0d = 必須フィールド：<c1/>、<c2/>、<c3/>、<c4/>、<c5/>、<c6/>

seg-94fd9afe6f30 = 任意フィールド：<c1/>

seg-bd021b5dff80 = 例の<c1/>では、とりわけ次を設定しています：

seg-8a9e52e38b05 = Exail ハイブリッド量子加速度計トライアド：バイアス安定性 6e-

seg-873c402bb724 = エンジンが scenarios/imu-deadreckoning.toml（種別 inertial）について出力するグラフ

seg-801740520370 = MODELLED { "6" } · VALIDATED { "2" }：この種別を挙げる<a1>検証マトリクス</a1>の行です。

seg-41f3a20fadfb = <b>VALIDATED</b> クォータニオン姿勢、WGS-84 NED のストラップダウン慣性機構（コーニング／スカーリング補償済み）で、(Δθ, Δv) の増分から航法状態を伝搬します テスト：<a1>classical_strapdown_ins_reference.rs</a1>。

seg-102d2e51460e = <b>MODELLED</b> 第一原理からの冷却原子干渉計加速度計（k_eff·T²、QPN） テスト：<a1>quantum_inertial_sensor_reference.rs</a1>。

seg-83fa50d4859a = <b>MODELLED</b> Mach–Zehnder のフリンジ曖昧性によるダイナミックレンジ：2π 周期のフリンジ読み出しが最大の曖昧さのない比力 a_max=π/(k_eff·T²) を決め、分解能セル単位の曖昧さのない範囲 a_max/σ_a=π/σ_Φ は光学スケールファク

seg-89ec2e65cf4f = <b>MODELLED</b> ホールドオーバー中の、バイアス＋スケールファクター＋VRW＋安定度劣化を合成した位置バジェット テスト：<a1>quantum_inertial_dead_reckoning_reference.rs</a1>。

seg-bb07c8ee153f = <b>PARTNER</b> 提供しません — 性能モデルのみ；冷却原子／時計のハードウェアはパートナーのものです。オラクル（NoneKind）：なし：パートナーが所管する分野であり、設計上モジュールもテストもありません

seg-fab4c926e628 = <s1>前へ</s1>impairment-eval

seg-aa783749183d = <s1>次へ</s1>ins-trn-coast

seg-51362910dcb7 = 同梱のシナリオのうち{ "2" }個がこの種類を使用しています。その他は<a1><c1/></a1>にあります。

seg-b054c73f22e5 = 値なし

seg-98151954f217 = false

seg-be831b52a339 = マトリクスにはさらに{ "4" }件あります。
