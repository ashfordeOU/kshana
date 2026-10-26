# docs--kind-reentry: translations (ja)

seg-c95aec0d2943 = ソース：<c1/>

seg-91424dc65b3e = <c1/>（シナリオの種類）

seg-039f77066d97 = Allen-Eggers の弾道再突入回廊：指数大気中の、突入速度・飛行経路角・弾道係数に対する、最大減速度（弾道係数に依存しない V_e^{ "2" } sin|γ|/(2eH)）、最大 g での速度と高度、最大加熱の速度。さらに、重力、地球の曲率、US Standard Atmosphere { "1976" } を含む同じ弾道突入の平面質点積分（最大減速度、速度、高度と、最大時の時刻）も求めます。MODELLED の弾道（揚力なし）突入であり、加熱の出力は最大加熱の速度であって、熱流束ではありません（空力加熱・TPS モデルなし）。

seg-9908d06c50eb = <c1/> の一回の実行の要約は次のとおりです：reentry（Allen–Eggers）：V_e { "7800" } m/s、γ { "6.0" }° -> 最大 { "16.6" } g、{ "49" } km、{ "4731" } m/s、加熱のピークは { "6603" } m/s、質点（重力、曲率、US76）の最大 { "16.4" } g（MODELLED の弾道、空力加熱なし）

seg-f057c2a160e7 = 任意のフィールド：<c1/>、<c2/>、<c3/>、<c4/>、<c5/>、<c6/>

seg-576245fd5b70 = 例の <c1/> では、とりわけ次を設定しています：

seg-0b7769c97ff3 = 結果ラベル（エンジンによるもの）：MODELLED — Allen–Eggers の弾道（揚力なし）突入、指数型の等温大気、一定の飛行経路角。最大 g は弾道係数に依存しません。加熱は最大加熱の速度であり、熱流束では「ありません」（空力加熱・TPS モデルなし）

seg-b0109481e8ff = エンジンが scenarios/reentry.toml（種類 reentry）に対して出力するグラフ

seg-c860b8679b47 = <b>MODELLED</b> 指数大気の弾道突入に対する、最大減速度（弾道係数に依存しない）、最大 g での速度と高度、最大加熱の速度。テスト：<a1>reentry_point_mass_accelerometer_oracle.rs</a1>。

seg-84abc0b9f859 = <b>MODELLED</b> 指数大気の弾道突入に対する、最大減速度（弾道係数に依存しない）、最大 g での速度と高度、最大加熱の速度。R。オラクル（InternalConsistency）：閉形式の Allen–Eggers 解析突入を、同じ抗力のみの突入 ODE の scipy { "1.18" } solve_ivp（DOP853）による数値積分とも相互確認（tests/ballistic_re_entry_corridor_reference.rs、{ "36" } ケース、a_max の相対誤差は最大 { "2.9e-9" }）— 数値積分と自身の解析形の比較なので、InternalConsistency のままであり、外部での確認では「ありません」。MODELLED の弾道（揚力なし）、空力加熱・TPS なし — 加熱の出力は速

seg-8b9d3db5d563 = MODELLED — Allen–Eggers の弾道（揚力なし）突入、指数型の等温大気、一定の飛行経路角。最大 g は弾道係数に依存しません。加熱は最大加熱の速度であり、熱流束では「ありません」（空力加熱・TPS モデルなし） (result <c1/>)

seg-82de2275c919 = MODELLED の弾道（揚力なし）突入。加熱の出力は最大加熱の速度であり、熱流束ではありません（空力加熱・TPS モデルなし）。 (kind catalogue (<c1/>))

seg-080b28422342 = 正直な適用範囲：MODELLED の弾道（揚力なし）、指数型の等温大気、一定の飛行経路角。空力加熱・TPS モデルはなく、加熱の出力は最大加熱の速度であって、熱流束ではありません。3自由度・6自由度の軌道ではありません。実行：kshana scenarios/reentry.toml (scenario file comment, lines { "8" } to { "11" })

seg-cfc345f0dc0d = 弾道再突入回廊（Allen–Eggers）は MODELLED であり、独立した外部の参照との照合による確認は行っていません。これは自身の閉形式・解析的な恒等式に照らして確認したものであり、転記や係数の誤りは検出できますが、外部のオラクルではありません。 (verification matrix (docs/MODELLED-RATIONALE.md))

seg-a4b7c16e3fea = <s1>前へ</s1>realtime-frame-eop

seg-6166a1c21525 = <s1>次へ</s1>slot-timing

seg-05ce408c2dbb = kg/m^{ "2" }

seg-195347c63a8a = m/s^{ "2" }

seg-99ef7c1d552c = エンジンv{ $version }のシナリオの種類。ファミリー：<a1>ミッション解析、リンク、宇宙運用</a1>。助言のみ：研究・エンジニアリング用ツールによる解析出力であり、型式承認を受けた航法装置ではなく、人命安全（safety-of-life）サービスでもありません。ここにあるラベルはすべてエンジンまたは検証マトリクスによるものです。検証マトリクスに別の記載がない限り、シナリオの種類はMODELLEDです（ラベルの付与のされ方：READMEのEvidenceセクション）。

seg-8f1e7d3f5a07 = ファミリーページ：<a1>ミッション解析、リンク、宇宙運用</a1>

seg-3a3ee499961e = <b>MODELLED</b>自転しない球形の地球上での、US Standard Atmosphere { "1976" }（密度と気圧）を通した多段機体の平面重力ターン上昇。ピッチキックあり、ノズルの背圧で推力が低下し、各段の燃焼終了は正確なs

seg-8e62cc4af6ea = トピックページ：<a1>ENTRY-EO-ASCENT.md</a1>
