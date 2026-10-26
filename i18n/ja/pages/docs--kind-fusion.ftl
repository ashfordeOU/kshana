# docs--kind-fusion: translations (ja)

seg-03442e4be82d = Microchip SA65 / SA.45s CSAC データシート sigma_y(1s)={ "3e-10" }

seg-4de09fe367df = ソース：<c1/>

seg-53e498cffeba = <c1/>（シナリオ種別）

seg-7b2721b7588d = エンジン v{ $version } のシナリオ種別で、ファミリーは<a1>慣性・フュージョン・量子センサー</a1>です。助言のみ：研究・エンジニアリング用ツールによる解析出力であり、型式承認を受けた航法装置ではなく、人命安全（safety-of-life）サービスでもありません。ここにあるラベルはすべてエンジンまたは検証マトリクスによるものです；検証マトリクスが別途示さない限り、種別は MODELLED です（ラベルの獲得方法：README の Evidence の節）。

seg-ec26df467b88 = 同じハイブリッド入力に対する、カルマンフィルターによる統合センサーフュージョン PNT。

seg-25708bf88728 = <c1/>の一回の実行は次のように要約されます：scenario c8eac911bbe0 | fused | 量子 PNT-holdover 6600s (t 6600s/p 6600s) integrity { "1.000" } security n/a (no attack) | 古典 PNT-holdover 1330s (t 1330s/p 6600s) integrity { "0.973" } security n/a (no attack)

seg-dba20bb12cda = 必須フィールド：<c1/>、<c2/>、<c3/>、<c4/>、<c5/>、<c6/>、<c7/>、<c8/>、<c9/>、<c10/>

seg-3d5cae65f093 = 任意フィールド：<c1/>

seg-56bca36cabba = 例の<c1/>では、とりわけ次を設定しています：

seg-195347c63a8a = m/s^{ "2" }

seg-5d3f15c0688a = 航法グレードの水晶加速度計；例示的な雑音ドリ

seg-3a1d8c59a4c9 = (m/s^{ "2" })^2/Hz

seg-6ddd8a067e26 = 冷却原子加速度計、長い tau での速度ランダムウォークが低い；

seg-cc7a61264c3f = (m/s^{ "2" })^2/s

seg-e79eecc14bea = 航法グレードの水晶加速度計；例

seg-c8a1c797f4b1 = エンジンが scenarios/fusion-pnt.toml（種別 fusion）について出力するグラフ

seg-5c031aaa3a33 = MODELLED { "4" } · VALIDATED { "4" }：この種別を挙げる<a1>検証マトリクス</a1>の行です。

seg-46c0903ff7b5 = <b>VALIDATED</b> 地上局の距離から、二体＋J2 の力モデルのもとで、Gauss–Newton のバッチ微分修正器と逐次フィルターによりエポック状態 [r,v] を復元します テスト：<a1>batch_sequential_orbit_determination_reference.rs</a1>。

seg-44f77aaf9d7e = <b>MODELLED</b> { "15" } 個の INS 状態、二状態の受信機クロック、追尾衛星ごとの一つのフロート搬送波アンビギュイティに対する誤差状態 EKF；SGP4 の Walker コンステレーションからの疑似距離、搬送波位相、任意のレンジレート（光行時間と Sagnac）、Klobuchar と テスト：<a1>fusion_carrier_tc.rs</a1>。

seg-509f93c7e9ce = <b>MODELLED</b> 軌跡ライブラリ上の三つの gnss-ins シナリオ（{ "8" } m/s で蛇行する船舶、五分間の途絶あり；二機の衛星しか見えない切通しとトンネルを通る列車；途絶が25度のバンク旋回を含む航空機）と、パックの任意 テスト：<a1>gnss_ins_packs.rs</a1>。

seg-e0633b308e4e = <b>MODELLED</b> 位置、速度、時計の位相と周波数にまたがる一つの積層カルマンフィルターに、位置と時計を結合する疑似距離を与えます（相互共分散を保持する Joseph 形式の更新）；1-DOF 版に定数の加速度計バイアスの状 テスト：<a1>fusion_coupled_filters.rs</a1>。

seg-451a304052c4 = <b>MODELLED</b> 第一原理からの冷却原子干渉計加速度計（k_eff·T²、QPN）。オラクル（ExternalDataset）：公表されている CAI の原著論文の数値ベクトル（Cheinet { "2008" } の伝達関数；Peters／Freier の感度）：k_eff·T² は完全に一致し、ショット雑音 ASD は片側の下限として、公表されている各装置の約{ "2" }倍以内（実機には量子下限を上回る技術雑音があります）。これは範囲の確認であり、同等性ではありません。{ "0.30" } ラウンド{ "2" }（事前登録 fcb9ac64）、所見（MODELLED のまま）：QPN のみの回転雑音を、実測の Gauguet ら

seg-7e95210bcc48 = <b>MODELLED</b> ホールドオーバー中の、バイアス＋スケールファクター＋VRW＋安定度劣化を合成した位置バジェット。オラクル（ReferenceImpl）：二重積分した白色加速度雑音の独立した numpy モンテカルロ SDE 積分（解析的な VRW 分散を真に独立したアルゴリズムで確認）＋バイアス／スケールファクター項に対する Groves { "2013" } の公表値アンカー；CAI 装置の数値はパートナーのハードウェアを定量化するもので、MODELLED のまま

seg-9955b1b1c018 = 量子慣性センサーの性能は MODELLED であり、独立した外部の参照と照合して確認されてはいません：副次的な主張は外部で検証されていますが、機能全体はモデルから計算した部品を組み合わせているため、この機能はモデルから計算した状態のままです。（検証マトリクス（docs/MODELLED-RATIONALE.md））

seg-5fef5e8cc64e = 量子慣性デッドレコニングのレジリエンスは MODELLED であり、独立した外部の参照と照合して確認されてはいません：この同じコードベース内の別実装と照合していますが、これは被試験ユニットから独立してはいるものの、外部の権威あるものではありません。（検証マトリクス（docs/MODELLED-RATIONALE.md））

seg-f7f12029e0ec = ファミリーページ：<a1>慣性・フュージョン・量子センサー</a1>

seg-a849735fcc6e = トピックページ：<a1>LEO-PNT-FUSION.md</a1>

seg-c894aa7d9585 = <s1>前へ</s1>ephemeris

seg-d14a7850df1c = <s1>次へ</s1>gnss-ins
