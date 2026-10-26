# docs--kind-ephemeris: translations (ja)

seg-a3697ad561db = Hz

seg-e388fdc74ffa = ソース：<c1/>

seg-9860cb88c021 = <c1/>（シナリオ種別）

seg-24266bc264df = エフェメリスと地上軌跡：一機の衛星を伝搬し（TLE→SGP4 または解析的軌道）、その TEME／GCRS 状態（位置＋速度）、ITRF／ECEF 位置、WGS-84 の衛星直下点の緯度・経度・高度、そしてステップごとの局の方位角／仰角／距離と距離変化率（ドップラー）を出力します。衛星は<c1/>、または<c3/>を伴う解析的な<c2/>で与えます（両方が指定された場合は<c4/>が優先されます）；<c5/>を使う場合、<c6/>は TLE 自身のエポックを t = { "0" } として上書きします。

seg-02f2745e0550 = <c1/>の一回の実行は次のように要約されます：scenario 0d4dd01b3160 | sgp4 (TLE) | { "559" } サンプル | 高度{ "419" }–{ "434" } km | |lat| ≤ { "51.8" }° | 速度{ "7653" }–{ "7661" } m/s | 最大仰角{ "25.7" }° ピークドップラー{ "34.3" } kHz

seg-2ce1ab71e2cc = 必須フィールド：<c1/>

seg-21dc45b3de59 = 任意フィールド：<c1/>、<c2/>、<c3/>、<c4/>、<c5/>、<c6/>、<c7/>、<c8/>

seg-cda81cdb3607 = 例の<c1/>では、とりわけ次を設定しています：

seg-c59482e7defe = { "1" } 25544U 98067A { "20045.18587073" } .00000950 00000-0 25302-

seg-4d208b6c0eb8 = 日

seg-cc723fa4fafa = sgp4 (TLE)

seg-0fd3c58fde09 = エンジンが scenarios/ephemeris.toml（種別 ephemeris）について出力するグラフ

seg-d291f20074f0 = <b>VALIDATED</b> 軌道経路上の二部構成 UT1 ユリウス日から地球自転を求めることで、地球固定座標の位置が、単一の f64 日付では失われるマイクロ秒を保ちます（{ "2020" }年付近で約{ "3e-9" } rad）：jd2::gmst82（IAU { "1982" } GMST、二部に対する TEME の規約）、cio:

seg-976416e41291 = <b>VALIDATED</b> SGP4/SDP4、Cowell 6-DOF＋摂動、バッチ／逐次 OD。オラクル（ExternalDataset）：AIAA 2006-6753 SGP4 検証ベクトル

seg-7cf505668c3c = <b>VALIDATED</b> IAU 2006/2000A 歳差・章動、CIO による GCRS↔ITRS、うるう秒を含む時刻系。オラクル（ExternalDataset）：IAU SOFA／ERFA の参照ベクトル；Vallado AIAA 2006-6753（{ "0.1" }–{ "4" } mm）

seg-f19ce44dc0c0 = トピックページ：<a1>AGENCY-ORBIT-VALIDATION.md</a1>

seg-a8ea4ba6e244 = <s1>前へ</s1>eo-radiometry

seg-971864553611 = <s1>次へ</s1>fusion

seg-37d29d8303fe = km

seg-3068552e4ab4 = VALIDATED：この種類を挙げている<a1>検証マトリクス</a1>の行。

seg-c33e3cbba749 = arcsec

seg-11e8c29ecb45 = エンジンv{ $version }のシナリオの種類。ファミリー：<a1>コンステレーション、カバレッジ、幾何</a1>。助言のみ：研究・エンジニアリング用ツールによる解析出力であり、型式承認を受けた航法装置ではなく、人命安全（safety-of-life）サービスでもありません。ここにあるラベルはすべてエンジンまたは検証マトリクスによるものです。検証マトリクスに別の記載がない限り、シナリオの種類はMODELLEDです（ラベルの付与のされ方：READMEのEvidenceセクション）。

seg-a4f1e7d2041e = ファミリーページ：<a1>コンステレーション、カバレッジ、幾何</a1>

seg-670191cf797f = トピックページ：<a1>SOLAR-SYSTEM.md</a1>
