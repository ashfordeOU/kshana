# docs--kind-hybrid: translations (ja)

seg-03442e4be82d = Microchip SA65 / SA.45s CSAC データシート sigma_y(1s)={ "3e-10" }

seg-7b2721b7588d = エンジン v{ $version } のシナリオ種別で、ファミリーは<a1>慣性・フュージョン・量子センサー</a1>です。助言のみ：研究・エンジニアリング用ツールによる解析出力であり、型式承認を受けた航法装置ではなく、人命安全（safety-of-life）サービスでもありません。ここにあるラベルはすべてエンジンまたは検証マトリクスによるものです；検証マトリクスが別途示さない限り、種別は MODELLED です（ラベルの獲得方法：README の Evidence の節）。

seg-dba20bb12cda = 必須フィールド：<c1/>、<c2/>、<c3/>、<c4/>、<c5/>、<c6/>、<c7/>、<c8/>、<c9/>、<c10/>

seg-195347c63a8a = m/s^{ "2" }

seg-3a1d8c59a4c9 = (m/s^{ "2" })^2/Hz

seg-cc7a61264c3f = (m/s^{ "2" })^2/s

seg-e0633b308e4e = <b>MODELLED</b> 位置、速度、時計の位相と周波数にまたがる一つの積層カルマンフィルターに、位置と時計を結合する疑似距離を与えます（相互共分散を保持する Joseph 形式の更新）；1-DOF 版に定数の加速度計バイアスの状 テスト：<a1>fusion_coupled_filters.rs</a1>。

seg-451a304052c4 = <b>MODELLED</b> 第一原理からの冷却原子干渉計加速度計（k_eff·T²、QPN）。オラクル（ExternalDataset）：公表されている CAI の原著論文の数値ベクトル（Cheinet { "2008" } の伝達関数；Peters／Freier の感度）：k_eff·T² は完全に一致し、ショット雑音 ASD は片側の下限として、公表されている各装置の約{ "2" }倍以内（実機には量子下限を上回る技術雑音があります）。これは範囲の確認であり、同等性ではありません。{ "0.30" } ラウンド{ "2" }（事前登録 fcb9ac64）、所見（MODELLED のまま）：QPN のみの回転雑音を、実測の Gauguet ら

seg-9955b1b1c018 = 量子慣性センサーの性能は MODELLED であり、独立した外部の参照と照合して確認されてはいません：副次的な主張は外部で検証されていますが、機能全体はモデルから計算した部品を組み合わせているため、この機能はモデルから計算した状態のままです。（検証マトリクス（docs/MODELLED-RATIONALE.md））

seg-5fef5e8cc64e = 量子慣性デッドレコニングのレジリエンスは MODELLED であり、独立した外部の参照と照合して確認されてはいません：この同じコードベース内の別実装と照合していますが、これは被試験ユニットから独立してはいるものの、外部の権威あるものではありません。（検証マトリクス（docs/MODELLED-RATIONALE.md））

seg-f7f12029e0ec = ファミリーページ：<a1>慣性・フュージョン・量子センサー</a1>

seg-d91dc5633e67 = ソース：<c1/>

seg-3b43d9c5624d = <c1/>（シナリオ種別）

seg-22cd963c7042 = ハイブリッド PNT の集大成：時計＋IMU＋時刻比較による補助。

seg-166be08d5276 = <c1/>の一回の実行は次のように要約されます：scenario f33d734ecc51 | 量子 PNT-holdover 6600s (t 6600s/p 6600s) integrity { "0.998" } security n/a (no attack) | 古典 PNT-holdover 350s (t 6600s/p 350s) integrity { "1.000" } security n/a (no attack)

seg-5a70fcb097dc = 任意フィールド：なし

seg-f33278986879 = 例の<c1/>では、とりわけ次を設定しています：

seg-7bebd09c614b = 航法グレードの水晶加速度計（Honeywell QA-2000 / G

seg-4f5fd1bc8a4e = Exail ハイブリッド量子加速度計トライアド、バイアス安定性{ "5.8" }

seg-49bff8dc860e = 航法グレードの水晶加速度計（H

seg-52378a7b074c = エンジンが scenarios/hybrid-pnt.toml（種別 hybrid）について出力するグラフ

seg-a1810bbca337 = <b>MODELLED</b> 双方向／TWSTFT（Sagnac）、GNSS コモンビュー、PPP；リンクジッター→距離。オラクル（ExternalDataset）：Sagnac の大きさは、権威ある公表値と照合しました — N. Ashby、'Relativity in the GPS'、Living Reviews in Relativity { "6" }:{ "1" }（{ "2003" }）、式{ "1.29" }：東向きの赤道周回では{ "207.4" } ns が蓄積されます（2ωA_E/c²）；kshana は{ "207.386" } ns を再現します。同じ 2Aω/c² の幾何を持つ RTKLIB { "2.4.3" } の geodist()（Takasu、BSD-2-Clause）によっても独立に裏付けられています。複合の BIPM TWSTFT トランスポンダー／コモンビュー／

seg-a8beb8dfc757 = 時刻比較の誤差バジェット設定は MODELLED であり、独立した外部の参照と照合して確認されてはいません：副次的な主張は外部で検証されていますが、機能全体はモデルから計算した部品を組み合わせているため、この機能はモデルから計算した状態のままです。（検証マトリクス（docs/MODELLED-RATIONALE.md））

seg-a9c56fc9608a = トピックページ：<a1>MACHINE-INPUTS.md</a1>

seg-cc86939900fe = <s1>前へ</s1>hybrid-ukf

seg-53b95026bf54 = <s1>次へ</s1>impairment-eval
