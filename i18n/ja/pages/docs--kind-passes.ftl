# docs--kind-passes: translations (ja)

seg-58413589a025 = MODELLED { "2" } · VALIDATED { "2" }：この種別を挙げている<a1>検証マトリクス</a1>の行。

seg-df90e5910fb4 = hr

seg-2544da673115 = ソース：<c1/>

seg-0db3f4e2402e = <c1/>（シナリオの種類）

seg-a4bdfc291fce = 地上局のパス予測：円軌道（ウィンドウ開始時点の SGP4 平均要素）について、ウィンドウにわたり仰角マスクより上にある局に対する時間領域の可視パス（AOS/TCA/LOS、最大見かけ仰角、継続時間）と総アクセス時間を求めます。IAU 2006/2000A の地球固定座標系上の SGP4/SDP4 伝播（任意で UT1 - UTC と極運動）、ITU-R P.834-9 の対流圏屈折とダウンリンクの光行時間（どちらも既定でオン）を用い、交差は { "1e-7" } s まで解き、最大仰角は黄金分割探索で求めます。パスのジオメトリは、海面高度の局で Orekit { "13.1.8" } と照合して VALIDATED であり、シナリオの軌道と局は例示用の入力です。

seg-3050cc7fdc79 = <c1/> の一回の実行の要約は次のとおりです：passes：{ "550" } km / { "97.6" }° の軌道が ({ "52.2" }°, { "4.4" }°) の上空で > { "10" }° となるパスが { "24" } 時間に { "5" } 回、総アクセス { "1659" } s（MODELLED）

seg-699b650604d4 = 任意のフィールド：<c1/>、<c2/>、<c3/>、<c4/>、<c5/>、<c6/>、<c7/>、<c8/>、<c9/>、<c10/>、<c11/>、<c12/>、<c13/>、<c14/>、<c15/>、<c16/>

seg-9d2941ba37e2 = 例の <c1/> では、とりわけ次を設定しています：

seg-6f849331e33c = 結果ラベル（エンジンによるもの）：MODELLED — 時間領域の地上局パス予測。SGP4/SDP4 伝播、IAU 2006/2000A の地球固定座標系（UT1 = UTC、地球姿勢パラメーターが与えられない限り極運動なし）、オンにした場合の ITU-R P.834-9 屈折と光行時間を含む見かけ仰角、交差と最大仰角の精密化

seg-a09be8c586e3 = エンジンが scenarios/passes.toml（種類 passes）に対して出力するグラフ

seg-db35e4ebd275 = <b>VALIDATED</b> エンジンの伝播器による、仰角マスクより上にある局に対する時間領域の可視パス（AOS/TCA/LOS、最大仰角、継続時間）と、補間した出没の交差および総アクセス：passes::predict_passes、幾何学的スケジューラー（なし。テスト：<a1>ground_station_pass_prediction_reference.rs</a1>。

seg-6799a54acee6 = <b>VALIDATED</b> 確認済みの地球周回経路（IAU 2006/2000A、任意の地球姿勢パラメーター）上の、WGS-84 局に対する SGP4 要素セットの可視パス（AOS、TCA、LOS、最大見かけ仰角、継続時間）、ITU-R P.834-9 の対流圏。テスト：<a1>pass_predictor_on_path_orekit_oracle.rs</a1>。

seg-42d4290ed718 = <b>VALIDATED</b> エンジンの伝播器による、仰角マスクより上にある局に対する時間領域の可視パス（AOS/TCA/LOS、最大仰角、継続時間）と、補間した出没。オラクル（ExternalDataset）：Orekit { "12.2" }（CS GROUP、Apache-2.0）と Hipparchus { "3.1" } — 独立した飛行力学ライブラリ。ITRF エフェメリス上の ElevationDetector（Brent 求根法）と EventsLogger、局は WGS-84 の TopocentricFrame。軌道、局、マスク、ウィンドウが同一の条件で、AOS/LOS/最大仰角/パス数/総アクセスが一致（コミット済みのフィクスチャ。ドライバー xval/orekit-passes）

seg-eb79c117f1df = MODELLED — 時間領域の地上局パス予測。SGP4/SDP4 伝播、IAU 2006/2000A の地球固定座標系（UT1 = UTC、地球姿勢パラメーターが与えられない限り極運動なし）、オンにした場合の ITU-R P.834-9 屈折と光行時間を含む見かけ仰角、ステップ未満まで精密化した交差と最大仰角 (result <c1/>)

seg-a7ddc8eeaf1e = <s1>前へ</s1>orbit

seg-3079cfb8decc = <s1>次へ</s1>pvt
