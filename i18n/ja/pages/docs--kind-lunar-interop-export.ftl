# docs--kind-lunar-interop-export: translations (ja)

seg-d36e6d7d8a10 = ソース：<c1/>

seg-fdf560e675f4 = <c1/>（シナリオ種別）

seg-5a4dcb93a643 = モデルから計算した月面の相互運用性エクスポート：月の座標系、月の時刻系、月のエフェメリスを、LunaNet/IOAG に整合した CCSDS ベースの交換形式で出力し、往復 / フィールド適合性を確認します。このクレートの CCSDS OEM { "2.0" } のエミッター + パーサー（crate::oem）を月面の文脈向けに付け替えて再利用します — OEM の REF_FRAME は IAU { "2015" } WGCCRE の月の天体座標系（MOON_ME / MOON_PA）、TIME_SYSTEM は月の時刻系（LTC / TCL / UTC）、CENTER_NAME = MOON を持ち、例示的な LCNS クラスのエフェメリスのサンプル（位置は crate::lunar_service から、速度は有限差分による）に適用します。また、serde_json で往復できる LunaNet/IOAG に整合した月の時刻の記述子（時刻系 ID、crate::lunar_time からの永年変化率 µs/day、公表された帯域、基準面）も出力し、既存の KIF エンベロープ（crate::interchange）に MODELLED の誠実性ラベルを付けて成果物を包みます。出力した成果物、OEM の行数、フィールド適合性の合格と存在 / 欠落フィールドの一覧、OEM の往復 ok、時刻メタデータの往復 ok、KIF のバイトサイズを報告します。MODELLED — オラクルは、決定論的な往復と、公表された CCSDS OEM および LunaNet/IOAG のフィールド意味論に対するフィールド名の適合性です。認証済みの相互運用性適合試験ではありません。例示的で公開情報に基づくエフェメリスであり、ESA とは無関係です。TRL、飛行実績、機関による承認はありません。

seg-1726861e444f = <c1/> の 一回の実行の要約：lunar-interop-export | REF_FRAME MOON_ME / TIME_SYSTEM LTC | 状態 { "9" } 個、OEM { "23" } 行 | 適合性 PASS（存在 { "9" } / 欠落 { "0" }）| OEM の往復 ok | 時刻メタの往復 ok | KIF { "1640" } バイト | MODELLED

seg-f8353e15aabd = 任意フィールド：<c1/>、<c2/>、<c3/>、<c4/>、<c5/>、<c6/>

seg-169f9446e90d = 例 <c1/> では、とりわけ次を設定しています：

seg-b8135da5a99a = 2030-01-01T00:{ "00" }:{ "00" }

seg-3f36bd2ec5ea = LTC

seg-2ac27c1e55c0 = オクテット

seg-0e86ff364c17 = scenarios/lunar-interop-export.toml（種別 lunar-interop-export）についてエンジンが書き出すグラフ

seg-98acb538942f = <b>MODELLED</b> LunaNet/IOAG に整合した月の座標系 + 時刻 + エフェメリスのエクスポート（CCSDS OEM + KIF）と往復適合性。オラクル（InternalConsistency）：kshana の月面 OEM エクスポートを、独立した第三者の <c1/> ライブラリ（R. J. Anderson）で再パースしたもの：座標系 / 時刻のトークンとエポックごとの状態は書き込み精度で一致し（{ "1" } mm / { "1e-9" } km/s）、TIME_SYSTEM を落としたエクスポートは拒否されます — 構造的な交換の往復です。月の座標系 / 時刻の物理的な意味論は、それぞれの行で検証されているため、この行は MODELLED のままです。{ "0.30" } 外部との比較、所見（MODELLED のまま）：a se

seg-c9a1d76625d6 = MODELLED（結果 <c1/>）

seg-633bcd62ce93 = また、serde_json で往復できる LunaNet/IOAG に整合した月の時刻の記述子（時刻系 ID、crate::lunar_time からの永年変化率 µs/day、公表された帯域、基準面）も出力し、既存の KIF エンベロープ（crate::interchange）に MODELLED の誠実性ラベルを付けて成果物を包みます。（種別カタログ（<c1/>））

seg-0e91697e3036 = MODELLED — オラクルは、決定論的な往復と、公表された CCSDS OEM および LunaNet/IOAG のフィールド意味論に対するフィールド名の適合性です。認証済みの相互運用性適合試験ではありません。例示的で公開情報に基づくエフェメリスであり、ESA とは無関係です。TRL、飛行実績、機関による承認はありません。（種別カタログ（<c1/>））

seg-11d0ccba5ee7 = src/lunar_interop.rs の処理内容：* export_lunar_oem — このクレートの CCSDS OEM { "2.0" } エミッター（crate::oem）を月面の文脈向けに付け替えて再利用します。REF_FRAME = IAU { "2015" } WGCCRE の月の天体座標系（MOON_ME / MOON_PA）、TIME_SYSTEM = 月の時刻系（LTC / TCL / UTC）、CENTER_NAME = MOON、例示的な LCNS クラスのエフェメリスのサンプル（位置は crate::lunar_service から、速度は中心有限差分による）に適用します。* export_（シナリオファイルのコメント、{ "6" } 行目から { "19" } 行目）

seg-f730e8f789cf = 誠実な注記：MODELLED。フィールド名と単位は、公開の標準（CCSDS 502.0-B OEM、IAU WGCCRE { "2015" } の月の座標系、LunaNet 相互運用性仕様 / IOAG の月面アーキテクチャ）に整合しています。決定論的な往復とフィールド名の適合性がオラクルです。これは認証済みの相互運用性適合試験ではありません。エフェメリスは例示的で公開情報に基づくものであり、ESA とは無関係で、TRL を示唆するものでもありません（シナリオファイルのコメント、{ "21" } 行目から { "26" } 行目）

seg-254d48fe58a5 = 月面の相互運用性エクスポートは MODELLED であり、独立した外部の参照と照合して確認されていません。自身の閉形式・解析的な恒等式と照合しており、転記や係数の誤りは検出できますが、外部のオラクルではありません。（検証マトリクス（docs/MODELLED-RATIONALE.md））

seg-07d6cc44724f = <s1>前へ</s1>lunar-integrity

seg-9669cd9b1d04 = <s1>次へ</s1>lunar-jamming

seg-834408a40783 = min

seg-debc2f07db78 = true

seg-1f17ef6a853e = エンジンv{ $version }のシナリオの種類。ファミリー：<a1>月および地球・月間空間（シスルナー）</a1>。助言のみ：研究・エンジニアリング用ツールによる解析出力であり、型式承認を受けた航法装置ではなく、人命安全（safety-of-life）サービスでもありません。ここにあるラベルはすべてエンジンまたは検証マトリクスによるものです。検証マトリクスに別の記載がない限り、シナリオの種類はMODELLEDです（ラベルの付与のされ方：READMEのEvidenceセクション）。

seg-1c1eeb2dcaa0 = ファミリーページ：<a1>月および地球・月間空間（シスルナー）</a1>

seg-619127334cf3 = この種類を名前で挙げているマトリクスの行はありません。その結果のラベルは、上に示したエンジン自身のものです。
