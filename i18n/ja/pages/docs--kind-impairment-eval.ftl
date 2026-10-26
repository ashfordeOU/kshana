# docs--kind-impairment-eval: translations (ja)

seg-2e6b437f3e99 = ソース：<c1/>

seg-134407946837 = <c1/>（シナリオ種別）

seg-304496607bd7 = エンジン v{ $version } のシナリオ種別で、ファミリーは<a1>ジャミング、スプーフィング、スペクトラム</a1>です。助言のみ：研究・エンジニアリング用ツールによる解析出力であり、型式承認を受けた航法装置ではなく、人命安全（safety-of-life）サービスでもありません。ここにあるラベルはすべてエンジンまたは検証マトリクスによるものです；検証マトリクスが別途示さない限り、種別は MODELLED です（ラベルの獲得方法：README の Evidence の節）。

seg-98e740d32860 = 機械学習による RF 障害検出の評価テストベッド（{ "13494" }）：ラベル付きでパラメーターに基づく合成コーパス（nominal／jamming／spoof-time／spoof-position／multipath）を生成し、検出器（energy|agc|sqm|parity|fused）を検出器に依存しないハーネスで採点して、AUC／ROC／混同行列と、目標 Pfa でのクラスごとの Pd、さらに分布内と分布外の楽観性ギャップを報告します。MODELLED の動作特性のみ — 現場データや IQ は一切なく、良し悪しの判定もありません。

seg-41c3f9559282 = <c1/>の一回の実行は次のように要約されます：impairment-eval | 検出器 fused(max-z) | AUC { "0.998" } 分布内 / { "0.981" } 分布外（ギャップ{ "0.017" }） | Pd { "0.99" } Pfa { "0.05" } @ 目標{ "0.05" } | { "1000" } ケース | MODELLED 合成

seg-9b0d7ebaa1f0 = 任意フィールド：<c1/>、<c2/>、<c3/>、<c4/>、<c5/>、<c6/>、<c7/>、<c8/>

seg-283510d17885 = 例の<c1/>では、とりわけ次を設定しています：

seg-6a64be3b3f07 = fused

seg-3db71c5bdd0a = auc_out はより微妙なチューニング外の領

seg-667d26b3a2fe = 結果ラベル（エンジンによるもの）：MODELLED — 合成でパラメーターに基づくコーパス（現場データや IQ は一切なし）；動作特性のみで、良し悪しの判定はなし

seg-7e7b07bc5545 = エンジンが scenarios/impairment-eval.toml（種別 impairment-eval）について出力するグラフ

seg-798a7e5526a0 = <b>VALIDATED</b> AUC（Mann-Whitney、同順位は ½）、しきい値での混同行列、P_d/P_md/P_fa/適合率/正解率/F1 テスト：<a1>eval_metrics_reference.rs</a1>。

seg-ceedc14c623a = <b>VALIDATED</b> ROC AUC＋ブートストラップ信頼区間で、実際のラベル付き異常を分離；透明な検出器（ラベルを再現） テスト：<a1>opssat_ad_reference.rs</a1>。

seg-0ee5b31cfd09 = <b>MODELLED</b> ラベル付きの合成障害コーパス＋検出器に依存しない ROC/AUC/混同行列/Pfa-Pmd ハーネス；リーク防止、層化分割、分布シフト（分布内と分布外の領域）の楽観性レポート。

seg-392fa6495840 = <b>VALIDATED</b> AUC（Mann-Whitney、同順位は ½）、しきい値での混同行列、P_d/P_md/P_fa/適合率/正解率/F1。オラクル（ExternalDataset）：scikit-learn { "1.9.0" }（Pedregosa ら、JMLR { "2011" }）— 独立したライブラリで、完全に一致

seg-c719d4060e1a = <b>MODELLED</b> ラベル付きの合成障害コーパス＋検出器に依存しない ROC/AUC/混同行列/Pfa-Pmd ハーネス；リーク防止、層化分割、分布シフト（分布内と分布外の領。オラクル（InternalConsistency）：閉形式の AUC 境界（Mann–Whitney）＋完全オラクル検出器；コーパスは合成（パラメーターに基づくもので、現場データや IQ ではありません）

seg-5565108cc4d1 = MODELLED — 合成でパラメーターに基づくコーパス（現場データや IQ は一切なし）；動作特性のみで、良し悪しの判定はなし（結果<c1/>）

seg-d2a9f35ea8cc = MODELLED の動作特性のみ — 現場データや IQ は一切なく、良し悪しの判定もありません。（種別カタログ（<c1/>））

seg-376f86fbdcb7 = 正直な適用範囲：MODELLED の動作特性のみです。コーパスは合成でパラメーターに基づくもの（Kshana のジャミング／AGC／SQM／パリティのモデルから構成）であり、現場での取得データや生の IQ では決してありません。ハーネスは審判役であり、特性を報告しますが、良し悪しの判定は下しません。実行：kshana scenarios/impairment-eval.toml（シナリオファイルのコメント、{ "9" }～{ "12" }行目）

seg-882d67b9474f = 機械学習による RF 障害検出の評価（{ "13494" }）は MODELLED であり、独立した外部の参照と照合して確認されてはいません：自身の閉形式・解析的な恒等式との照合であり、転記ミスや係数の誤りは検出できますが、外部のオラクルではありません。（検証マトリクス（docs/MODELLED-RATIONALE.md））

seg-5d23d7f8f872 = ファミリーページ：<a1>ジャミング、スプーフィング、スペクトラム</a1>

seg-6cf4bb2d7f7a = トピックページ：<a1>BENCH.md</a1>

seg-dde90de4270b = <s1>前へ</s1>hybrid

seg-1e68310f2dc6 = <s1>次へ</s1>inertial
