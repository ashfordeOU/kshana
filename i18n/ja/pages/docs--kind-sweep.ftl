# docs--kind-sweep: translations (ja)

seg-de72ae48731d = ソース：<c1/>

seg-81c2da4650c9 = <c1/>（シナリオ種別）

seg-e7ab7b55c969 = クロックパックのパラメーターに対する1次元のトレードスタディ掃引。

seg-0412c0dbfb75 = <c1/> の一回の実行の要約：sweep holdover_s over classical_q_wf ({ "1.00e-24" }..1.00e-18, { "25" } pts, log scale) | quantum 6600.000->{ "6600.000" } | classical 2610.000->{ "250.000" }

seg-d2a441254bcd = 必須フィールド：<c1/>、<c2/>、<c3/>、<c4/>、<c5/>、<c6/>

seg-2b8d8159bdaf = 任意フィールド：<c1/>

seg-73c2e732b0c1 = 例 <c1/> では、とりわけ次を設定しています：

seg-f8a627a78bdb = Microchip SA.45s CSAC データシートの sigma_y(1s)={ "3e-10" }；q_wf は s

seg-c784b8f22f12 = エンジンが scenarios/sweep-clock-stability.toml（種別 sweep）に対して出力するグラフ

seg-cb00aca0268d = <b>MODELLED</b> <c1/> 種別の sweep（任意の種別のドット区切りキーを一〜三個、汎用掃引の軸の値上で、必要に応じて各ノードにアンサンブルを置く）と monte_carlo のセクション：実現 k は base_seed + k で実行され、各メトリクスは平均、標準偏 テスト：<a1>campaign_composition_reference.rs</a1>。

seg-1750fbfc4a99 = <s1>前へ</s1>sweep-nd

seg-de5468ac32fc = <s1>次へ</s1>telecom-timing

seg-8b701f465117 = 対数

seg-0aae0574c5e6 = <b>MODELLED</b> <c1/>種別の可用性掃引：衛星コンステレーション（GPS、GLONASS、Galileo、BDS、QZSS、NavIC）ごと、および全体で、信号が一つ以上、および四つ以上ある（ユーザー、エポック）の組の割合と最長の途絶を、球面上のユーザーについて求めます

seg-4636d450ef60 = <b>MODELLED</b>一回の実行は、コンタクト計画（aos_s/los_sウィンドウのリスト。各ウィンドウはアパーチャに航法または通信を要求します。<c1/>が出力するものと同じウィンドウの語彙で、<c2/>で変換されます）、アパーチャ

seg-fa3ad6babe54 = <b>MODELLED</b> <c1/>の種類のスイープ（任意の種類のドット区切りのキー一〜三個、汎用スイープの軸の値に対して、必要に応じてすべてのノードでアンサンブル）とmonte_carloのセク。オラクル（InternalConsistency）：白色周波数雑音の下での位相ランダムウォークの閉形式、分散q_wf tau（NIST Technical Note { "1337" }）は統計処理の仕組みに対して使い、シードの扱いにはスタンドアロンの実行とのバイト単位の一致を使います。これはエンジン自身の時計モデルに対するアンサンブル演算を確認するものであり、外部のデータセットではありません

seg-d1c11e493795 = 任意のシナリオの種類に対するパラメーター掃引とシード付きモンテカルロのアンサンブルはMODELLEDであり、独立した外部の参照との照合はされていません。自身の閉形式・解析的な恒等式に照らして確認しており、転記や係数の誤りは見つけられますが、外部のオラクルではありません。（検証マトリクス（docs/MODELLED-RATIONALE.md））

seg-cb91473bfdda = トピックページ：<a1>LEO-PNT.md</a1>

seg-c61e88721556 = エンジンv{ $version }のシナリオの種類。ファミリー：<a1>時計、タイミング、ホールドオーバー</a1>。助言のみ：研究・エンジニアリング用ツールによる解析出力であり、型式承認を受けた航法装置ではなく、人命安全（safety-of-life）サービスでもありません。ここにあるラベルはすべてエンジンまたは検証マトリクスによるものです。検証マトリクスに別の記載がない限り、シナリオの種類はMODELLEDです（ラベルの付与のされ方：READMEのEvidenceセクション）。

seg-a8d92406e428 = ストロンチウム光格子時計、宇宙向けの目標sigma_y

seg-5278ccdaf16f = <b>MODELLED</b>閉形式の惰性誤差増大としきい値までのホールドオーバー、量子時計のクラス。オラクル（ReferenceImpl）：複数ステップのclock_stateの共分散漸化（同じコードベース内でのクロスチェック）。基礎となる惰性分散とホールドオーバー逆算のカーネルは、scipyに対して外部で照合済みです（「Clock-holdover coast-variance & threshold inversion」を参照）。クラスごとのレッドノイズフロアのホールドオーバーの数値はMODELLEDのままです

seg-e12f672ae71d = GNSSが使えない状況での時計のホールドオーバーはMODELLEDであり、独立した外部の参照との照合はされていません。同じコードベース内の別個の実装に照らして確認しており、テスト対象のユニットからは独立していますが、外部の権威あるものではありません。（検証マトリクス（docs/MODELLED-RATIONALE.md））

seg-849c08d3ce70 = ファミリーページ：<a1>時計、タイミング、ホールドオーバー</a1>

seg-ee7dd15019d0 = トピックページ：<a1>CAMPAIGNS.md</a1>
