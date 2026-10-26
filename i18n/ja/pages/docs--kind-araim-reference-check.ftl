# docs--kind-araim-reference-check: translations (ja)

seg-debc2f07db78 = true

seg-c53da0bf140d = ソース：<c1/>

seg-82884391dd77 = <c1/>（シナリオの種類）

seg-8e845ce908ee = エンジンv{ $version }のシナリオの種類。ファミリー：<a1>GNSSの測定、測位、インテグリティ</a1>。助言のみ：研究・エンジニアリング用ツールによる解析出力であり、型式承認を受けた航法装置ではなく、人命安全（safety-of-life）サービスでもありません。ここにあるラベルはすべてエンジンまたは検証マトリクスによるものです。検証マトリクスに別の記載がない限り、シナリオの種類はMODELLEDです（ラベルの付与のされ方：READMEのEvidenceセクション）。

seg-06197409c717 = 公開されたARAIM認証用の参照ベクトル：エンジンのARAIMの水平・垂直保護レベルを、WG-C ARAIM Technical Subgroup自身の数値例に対して、それらの文書自身が示す許容差（TOL_PL = { "5e-2" } m）で実行します。二つのベクトルがフィクスチャとしてコミットされており、それぞれに取得URL、取得日、ソースファイルのSHA-256、ページが付いています。Reference Airborne Algorithm Description Document v3.1（{ "2019" }）のAppendix D（自己整合しており、受け入れ用のベクトル）と、Milestone { "3" } Report（{ "2016" }）のAnnex A section A.IX（研究の文献リストが引用する記述）です。公開されているすべての入力（10機の衛星、2コンステレーションの幾何行列、C_intとC_accの分散の対角成分、b_nom、P_sat、P_const、LPV-200の定数セット）と、公開されているすべての出力（VPL、HPL、EMT、sigma_v_acc、K_fa_3、および二つのコンステレーション故障モードのsigma_3、sigma_ss_3、b_3）は、エンジン自身の数値およびそれらの絶対差とともに報告されます。保護レベルの方程式はここで解き直すことはありません。参照のモードリストをエンジンの既存のraim::araim_protection_level / araim_integrity_riskに渡しているため、試験対象の二分法とガウス裾の代数はエンジン自身のものです。幾何、部分解、検出しきい値、公開された予算配分だけが、そのために構築されています。{ "2019" }のベクトルに対して外部で確認済み：VPL { "18.2926" } mに対し公開値{ "18.3" } m、HPL { "13.4063" } mに対し{ "13.45" } m、EMT { "7.2997" } mに対し{ "7.2998" } m、sigma_v_acc { "1.3694" } mに対し{ "1.3694" } m、そして公開されている六つの中間値はすべて、最後に印字された小数桁の半単位以内です。{ "2016" }のベクトルには、報告書が隠さず明記している内部の欠陥が二つあります。Gの行{ "3" }の符号の誤植と、文書がN_fault_max = { "1" }（{ "12" }モード）と述べているのに{ "57" }の故障モードで評価されたK_fa_3です。そのため、幾何の中間値は正確に再現される一方、保護レベルは測定された不一致として報告され、受け入れの数値からは除外されます。これらを吸収するために許容差が広げられることはありません。出力されるすべての数値フィールドには単位と出所の区分が付き、転記した数値には<c1/>のラベルが付くため、計算値と取り違えることはありません。適用範囲：実装されているのはN_fault_max = { "1" }（単一衛星および単一コンステレーションの故障モード）のみで、事前確率が複数事象の同時故障の部分集合を必要とするケースは、黙って切り捨てるのではなくREFUSEDとします。参照アルゴリズムの故障検出、除外、カイ二乗整合性チェック、二重計上の再配分ステップは対象外です。これは公開された参照アルゴリズムの数値例を再現するものであり、認証、耐空性に関する成果物、承認ではありません。

seg-c16de81ec8da = <c1/>の一回の実行は、次のように要約されます：araim-reference-check: { "2" } published WG-C reference vector(s); worst VPL/HPL agreement { "0.0437" } m against the reference's own TOL_PL = { "0.05" } m over { "1" } acceptance vector(s)

seg-b1be6b5632c1 = 任意フィールド：<c1/>

seg-3f181d41edb5 = 例の<c1/>が設定している項目（一部）：

seg-9de6e1b3352d = 結果ラベル（エンジンによるもの）：外部で確認済み — エンジンのARAIM保護レベルを、EU-U.S. Working Group C ARAIM Technical Subgroupの参照航空機アルゴリズムの公開された数値例に対して、それらの文書自身が示す許容差（TOL_PL）で実行。公開されているすべての数値には、そのソースのUR

seg-693c823c85d1 = scenarios/araim-reference-check.toml（種類araim-reference-check）についてエンジンが書き出すグラフ

seg-3068552e4ab4 = VALIDATED：この種類を挙げている<a1>検証マトリクス</a1>の行。

seg-c5c966ec3c6a = <b>VALIDATED</b>複数仮説の解分離による保護レベルの方程式そのもの：視野内すべて、および故障モードごとの重み付き最小二乗法を、コンステレーションごとに一つのクロック状態を持つEast/North/Upの幾何上で行い、部分解のシグマ、解分離 テスト：<a1>araim_reference_vectors.rs</a1>。

seg-a99b9cf4c6e8 = <b>VALIDATED</b>複数仮説の解分離による保護レベルの方程式そのもの：視野内すべて、および故障モードごとの重み付き最小二乗法をEast/North/Upの幾何上で行います。オラクル（ExternalDataset）：EU-U.S. Working Group C ARAIM Technical Subgroup、Reference Airborne Algorithm Description Document v3.1（{ "2019" }年6月{ "20" }日）、Appendix Dの数値例。公開された入力（10機の衛星、2コンステレーションの幾何行列、C_int/C_accの対角成分、b_nom、P_sat、P_const、LPV-200の定数）と公開された出力（VPL { "18.3" } m、HPL { "13.45" } m、EMT { "7.2998" } m、σ_v_acc { "1.3694" } m、K_fa_3 { "5.1083" }、およびコンステレーション故障の六つの中間値

seg-f6b7ca020692 = ファミリーページ：<a1>GNSSの測定、測位、インテグリティ</a1>

seg-f4cf8b629797 = トピックページ：<a1>INTEGRITY.md</a1>

seg-e6b1f9a47b5d = トピックページ：<a1>ARAIM_REFERENCE.md</a1>

seg-7cf434223fa5 = <s1>前へ</s1>aperture-duty-cycle

seg-ed2003ecf41b = <s1>次へ</s1>ascent-losses
