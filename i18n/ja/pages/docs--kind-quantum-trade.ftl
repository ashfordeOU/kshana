# docs--kind-quantum-trade: translations (ja)

seg-51cac2f918e0 = トピックページ：<a1>POSITIONING.md</a1>

seg-3a8c76a2396f = ソース：<c1/>

seg-f9af2813532e = <c1/>（シナリオの種類）

seg-eb55d253dd11 = 量子と古典の PNT トレード（{ "13503" }）：候補の時計（実測 ADEV 曲線 — 防御可能性の要 — または量子時計クラス）が古典のベースラインクラスに対してもたらす、タイミングホールドオーバーと慣性ホールドオーバーの利益です。長い tau のフロアを仮定したことの注意点を成果物に添え、さらに GNSS を使えない状況でのレジリエンス対時間の包絡も示します。MODELLED。パートナーのデバイスを定量化するだけで、確認はしません。候補の時計は、実測曲線（<c1/> と <c2/>、同じ長さで、少なくとも { "2" } 点。両方の形式が与えられた場合はこちらが優先）または <c3/> です。

seg-4f470bc1d82c = <c1/> の一回の実行の要約は次のとおりです：quantum-trade | 候補 実測 ADEV | タイミングホールドオーバー 2621947s 対 203s（12943.62x） | 慣性 14108s 対 378s（37.34x） | レジリエンスのコースト 14108s | MODELLED [フロア仮定の注意点]

seg-2639560aeff2 = 必須フィールド：<c1/>、<c2/>、<c3/>、<c4/>

seg-d66f1ef84201 = 任意のフィールド：<c1/>、<c2/>、<c3/>、<c4/>

seg-f2cc0830b53f = 例の <c1/> では、とりわけ次を設定しています：

seg-ee5bcbbe0167 = csac

seg-a6551a61cf69 = 古典的なベースライン

seg-f5fa445702c6 = 結果ラベル（エンジンによるもの）：MODELLED — パートナーの時計・センサーを定量化するだけで、確認はしません。飛行での実証はありません

seg-c74c63ffd859 = エンジンが scenarios/quantum-trade.toml（種類 quantum-trade）に対して出力するグラフ

seg-93310aaa6ead = <b>VALIDATED</b> 公表された実測の ⁸⁸Sr 光時計遷移のアラン偏差からの、べき乗則（ホワイト FM＋赤色雑音フロア）の NNLS 復元。実測の長い τ のフロアを伴って σ_y(τ) と見出しの 4.7e-16/√τ の短い τ のスケーリングを再現し、そうでない。テスト：<a1>optical_clock_adev_reference.rs</a1>。

seg-fc46e95688ba = <b>VALIDATED</b> 実測 ADEV の NNLS フィット、NEES/NIS の χ² 整合性の帯域、時計の van-Loan 離散プロセスノイズ（ホールドオーバーのコースト）共分散 — トレードエンジンの計算上の中核。テスト：<a1>scipy_reference.rs</a1>。

seg-6e2b62136cef = <b>MODELLED</b> 実測 ADEV の取り込み（NNLS）、トレード表（タイミング/慣性ホールドオーバーと利益）、レジリエンス対時間の包絡。フロアの注意点は成果物に添えます。

seg-b577b8464cf7 = <b>VALIDATED</b> 実測 ADEV の NNLS フィット、NEES/NIS の χ² 整合性の帯域、時計の van-Loan 離散プロセスノイズ（ホールドオーバーのコースト）共分散 — トレードエンジンの計算。オラクル（ExternalDataset）：scipy { "1.17.1" } — optimize.nnls / stats.chi2.ppf / linalg.expm。NNLS と Q は厳密に一致、χ² は運用時の自由度で <{ "5e-4" }。対象はカーネルのみで、デバイス性能の数値はモデルに基づくもののままです（次の行）

seg-6b8aa8cd6d3e = <b>MODELLED</b> 実測 ADEV の取り込み（NNLS）、トレード表（タイミング/慣性ホールドオーバーと利益）、レジリエンス対時間の包絡。フロアの注意点は成果物に添えます。実行可能な fr。オラクル（ExternalDataset）：実測 ADEV→PSD フィット（NNLS）のカーネルは scipy.optimize.nnls（tests/scipy_reference.rs / tests/quantum_vs_classical_pnt_trade_reference.rs）と一致します — 独立した外部のカーネルです。ただし、トレードの数値はパートナーの時計/CAI を定量化するだけで確認はしないため、トレード自体は MODELLED のままであり、確認済みを示す後光はありません

seg-3d678f64e41c = MODELLED — パートナーの時計・センサーを定量化するだけで、確認はしません。飛行での実証はありません (result <c1/>)

seg-20ba66ae9518 = 量子と古典の PNT トレード（{ "13503" }）：候補の時計（実測 ADEV 曲線 — 防御可能性の要 — または量子時計クラス）が古典のベースラインクラスに対してもたらす、タイミングホールドオーバーと慣性ホールドオーバーの利益です。長い tau のフロアを仮定したことの注意点を成果物に添え、さらに GNSS を使えない状況でのレジリエンス対時間の包絡も示します。 (kind catalogue (<c1/>))

seg-45a1d84eef18 = MODELLED。パートナーのデバイスを定量化するだけで、確認はしません。 (kind catalogue (<c1/>))

seg-15275d27252a = 古典のベースラインに対する候補の時計のタイミングホールドオーバーと慣性ホールドオーバーの利益を計算し、さらに GNSS を使えない状況でのレジリエンス対時間の包絡も求めます。候補のフロアは、パートナーの時計の実測の重複 ADEV 曲線（防御可能性の要）を非負最小二乗法でフィットして決めるため、ホールドオーバーのバジェットは、仮定した長い tau のフロアではなく、実データに基づきます。 (scenario file comment, lines { "3" } to { "7" })

seg-ecbdbc9b163e = 正直な適用範囲：MODELLED — パートナーの量子時計の利益を定量化するものであり、デバイスを確認するものでは「ありません」。また、SGP4/Allan/IGS の確認済みの領域を借用することもありません。いずれかの行のフロアが仮定したクラスの既定値である場合は、フロアの注意点が成果物に表示されます。実行：kshana scenarios/quantum-trade.toml (scenario file comment, lines { "9" } to { "12" })

seg-4b59ac409819 = 量子と古典の PNT トレードと GNSS 不在下のレジリエンス（{ "13503" }）は MODELLED であり、独立した外部の参照との照合による確認は行っていません。部分的な主張は外部で確認していますが、機能全体はモデルに基づく部分を組み合わせたものであるため、機能はモデルに基づくものにとどまります。 (verification matrix (docs/MODELLED-RATIONALE.md))

seg-e6498fae3ba7 = <s1>前へ</s1>quantum-time-transfer

seg-50d4bbb7486b = <s1>次へ</s1>realtime-frame-eop

seg-7b2721b7588d = エンジン v{ $version } のシナリオ種別で、ファミリーは<a1>慣性・フュージョン・量子センサー</a1>です。助言のみ：研究・エンジニアリング用ツールによる解析出力であり、型式承認を受けた航法装置ではなく、人命安全（safety-of-life）サービスでもありません。ここにあるラベルはすべてエンジンまたは検証マトリクスによるものです；検証マトリクスが別途示さない限り、種別は MODELLED です（ラベルの獲得方法：README の Evidence の節）。

seg-f7f12029e0ec = ファミリーページ：<a1>慣性・フュージョン・量子センサー</a1>

seg-496b17a8d3b9 = トピックページ：<a1>QUANTUM-MODELS.md</a1>

seg-bb07c8ee153f = <b>PARTNER</b> 提供しません — 性能モデルのみ；冷却原子／時計のハードウェアはパートナーのものです。オラクル（NoneKind）：なし：パートナーが所管する分野であり、設計上モジュールもテストもありません

seg-debc2f07db78 = true

seg-98151954f217 = false

seg-7400f24ec992 = MODELLED { "1" } · VALIDATED { "2" }：この種類を挙げている<a1>検証マトリクス</a1>の行。
