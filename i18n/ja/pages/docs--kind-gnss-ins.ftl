# docs--kind-gnss-ins: translations (ja)

seg-7b2721b7588d = エンジン v{ $version } のシナリオ種別で、ファミリーは<a1>慣性・フュージョン・量子センサー</a1>です。助言のみ：研究・エンジニアリング用ツールによる解析出力であり、型式承認を受けた航法装置ではなく、人命安全（safety-of-life）サービスでもありません。ここにあるラベルはすべてエンジンまたは検証マトリクスによるものです；検証マトリクスが別途示さない限り、種別は MODELLED です（ラベルの獲得方法：README の Evidence の節）。

seg-195347c63a8a = m/s^{ "2" }

seg-451a304052c4 = <b>MODELLED</b> 第一原理からの冷却原子干渉計加速度計（k_eff·T²、QPN）。オラクル（ExternalDataset）：公表されている CAI の原著論文の数値ベクトル（Cheinet { "2008" } の伝達関数；Peters／Freier の感度）：k_eff·T² は完全に一致し、ショット雑音 ASD は片側の下限として、公表されている各装置の約{ "2" }倍以内（実機には量子下限を上回る技術雑音があります）。これは範囲の確認であり、同等性ではありません。{ "0.30" } ラウンド{ "2" }（事前登録 fcb9ac64）、所見（MODELLED のまま）：QPN のみの回転雑音を、実測の Gauguet ら

seg-9955b1b1c018 = 量子慣性センサーの性能は MODELLED であり、独立した外部の参照と照合して確認されてはいません：副次的な主張は外部で検証されていますが、機能全体はモデルから計算した部品を組み合わせているため、この機能はモデルから計算した状態のままです。（検証マトリクス（docs/MODELLED-RATIONALE.md））

seg-f7f12029e0ec = ファミリーページ：<a1>慣性・フュージョン・量子センサー</a1>

seg-fd8fad481c81 = ソース：<c1/>

seg-e726a6d74d81 = <c1/>（シナリオ種別）

seg-38df285a3f25 = 疎結合および密結合の GNSS/INS 誤差状態 EKF。

seg-e1e235215947 = <c1/>の一回の実行は次のように要約されます：scenario c55a6246bd6f | gnss-ins | 量子 outage-RMS fused 1.9m vs free 130.7m (hold 60s, avail { "1.00" }) | 古典 fused 3.1m vs free 314.3m (hold 60s, avail { "1.00" })

seg-e3112eac77af = 必須フィールド：<c1/>、<c2/>、<c3/>、<c4/>、<c5/>、<c6/>

seg-6c128eb60a91 = 任意フィールド：<c1/>、<c2/>、<c3/>、<c4/>、<c5/>、<c6/>、<c7/>、<c8/>

seg-79c75d3e461d = 例の<c1/>では、とりわけ次を設定しています：

seg-ca448daf5ec7 = nominal

seg-49f2fa051719 = denied

seg-327a2c4885bd = 戦術級の MEMS／水晶慣性ユニット：残留バイ

seg-d1beb62cf742 = { "6" }件の同梱シナリオがこの種別を使います；残りは<a1><c1/></a1>にあります。

seg-7d993b676006 = エンジンが scenarios/gnss-ins.toml（種別 gnss-ins）について出力するグラフ

seg-ea4498cc0324 = <b>VALIDATED</b> 15状態の誤差状態 EKF、疎結合（実際の IMU/GNSS 走行データを用いて NaveGo と照合して確認済み）；密結合の疑似距離／ドップラー UKF と、結合した時計＋位置。オラクル（ExternalDataset）：NaveGo v1.4（R. Gonzalez、LGPL-3.0、GNU Octave 上でツールとして実行し、リンクはしない）：その疎結合 ins_gnss を、独自の実 Ekinox IMU/GNSS 陸上車両走行データで実行し、両方の解を Ekinox の基準軌跡に対して採点しました。両フィルターは同じ{ "20" } Hz の float32 入力を読み込み、Kshana の設定はデータセットの公表パラメーターから機械的に対応付けています。Kshana の水平・垂直位置 RMS とその

seg-742a29ca1fb7 = トピックページ：<a1>TEST-BENCH.md</a1>

seg-f3cc3d82aba8 = <s1>前へ</s1>fusion

seg-af503aa1d900 = <s1>次へ</s1>gnss-sim

seg-b054c73f22e5 = 値なし

seg-ee7dd15019d0 = トピックページ：<a1>CAMPAIGNS.md</a1>

seg-619127334cf3 = この種類を名前で挙げているマトリクスの行はありません。その結果のラベルは、上に示したエンジン自身のものです。
