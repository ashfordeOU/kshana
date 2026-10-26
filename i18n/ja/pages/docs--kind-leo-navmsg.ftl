# docs--kind-leo-navmsg: translations (ja)

seg-1d65b71c5de0 = { "5" }件の同梱シナリオがこの種別を使います；残りは<a1><c1/></a1>にあります。

seg-648c27220789 = ソース：<c1/>

seg-087287602b47 = <c1/>（シナリオ種別）

seg-49964654d5f4 = エンジン v{ $version } のシナリオ種別で、ファミリーは<a1>低軌道航法</a1>です。助言のみ：研究・エンジニアリング用ツールによる解析出力であり、型式承認を受けた航法装置ではなく、人命安全（safety-of-life）サービスでもありません。ここにあるラベルはすべてエンジンまたは検証マトリクスによるものです；検証マトリクスが別途示さない限り、種別は MODELLED です（ラベルの獲得方法：README の Evidence の節）。

seg-867f3e41b5ab = LEO 航法メッセージ：低軌道（LEO）の測位・航法・時刻衛星の放送エフェメリスと時計。任意の軌道、搬送波、モデルに対応し、名前付きのプリセット（Xona Pulsar、Iridium、Starlink、CentiSpace、代表的な C バンドシステム、ATOMIC ゼロクロックモデル、Celeste IOD）も任意で使えます。内容：補助データ（SVID、データ発行番号、バンド、信号健全性）、同期（週、週内時刻、toc まわりの二次の時計多項式 af0-af2）、四つのモデルのいずれかによるエフェメリス -- Galileo OS SIS ICD の16パラメーターのケプラー要素セット；そのセットに along-track、cross-track、radial の補正多項式を加えたもの；Liu ら { "2025" } の22パラメーターモデル；時計項のない ECEF 多項式（ATOMIC ゼロクロック）-- およびその他のサービス（Klobuchar の放送セット、実効電離レベルを伴う NeQuick-G ai0-ai2、ICD のうるう秒ロジックによる系統時刻から UTC へのパラメーター）。フィッター：選んだ次数までの帯状 J2-J6 または EGM2008 重力と抗力で積分した真値の軌道と、シード付きの自由または制御された時計；非特異要素に対するケプラー要素セットの Levenberg-Marquardt 当てはめ、続いて線形最小二乗の補正多項式；時計は、ユーザーが加える相対論項を差し引いて当てはめます。解析：fit-interval-trade（軌道高度に対する全球平均の重みを用いた信号空間距離誤差 SISRE を、当てはめ区間と更新周期に対して、軌道のみと時計込みで）、model-comparison（四つのモデル、パラメーター数、符号化ビット数、そして Liu ら の高度での Kshana の当てはめを、公表されている数値と並べて）、midpass-update（ユーザー上空で最も高いパス、各メッセージ切り替えの位置・時計・ユーザー距離のジャンプ、最悪幾何でのジャンプ、連続性しきい値に対する PASS/FAIL）、encode-decode（CRC-24Q を持つ Kshana 独自の文書化されたバイナリフレーム、フィールドごとの半刻み量子化バジェット、破損フレームの検査、Kshana 拡張と明記した RINEX-4 形式のレコードのエクスポートとインポート、そして CSV 表）。VALIDATED：SISRE の重みを公表されている MEO/GEO の表（Montenbruck ら { "2018" }）に対して；Galileo のユーザーアルゴリズムを実際の Galileo 放送エフェメリスについて RTKLIB に対して；CRC-24Q をそのカタログのチェック値と RTCM { "1005" } の例示フレームに対して。MODELLED：当てはめと SISRE の数値はすべて、Kshana が積分した真値に対する表現誤差です（軌道決定や予測の誤差はありません）；Liu ら との比較は異なる軌道を使っています；符号化とテキスト形式は Kshana 独自のものです。

seg-e5a4f0290e9e = <c1/>の一回の実行は次のように要約されます：LEO 航法メッセージ — { "510" } km、{ "97.4" } deg、重力次数{ "20" }、モデル kepler-rac SISRE の重み：w_R { "0.459" }、w_AC^{ "2" } 1/2.53（マスク{ "0" } deg） encode-decode：kepler-rac モデル、フレーム{ "152" } バイト（ペイロード{ "1156" } ビット、エフェメリス＋時計{ "891" } ビット）、CRC-24Q 0x58ADF2 量子化：最大の位置変化{ "0.52" } mm、時計{ "0.09" } mm；SISRE 厳密値{ "0.0013" } m、量子化後{ "0.0013" } m 破損フレームは拒否：true；RINEX 往復{ "4.43e-6" } m；CSV 往復{ "0.00e0" } m 当てはめ区間のトレードオフ（{ "1800" } s にわたる）（使用期間 = 当てはめ区間）：kepler16 { "60" } s SISRE 軌道 RMS { "0.0003" } m 最大{ "0.0015" } m 時計込み RMS { "0.0006" } m kepler16 { "120" } s SISRE 軌道 RMS { "0.0003" } m 最大{ "0.0015" } m 時計込み RMS { "0.0007" } m kepler16 { "300" } s SISRE 軌道 RMS { "0.0036" } m 最大{ "0.0141" } m 時計込み RMS { "0.0037" } m kepler16 { "600" } s SISRE 軌道 RMS { "0.0293" } m 最大{ "0.1023" } m 時計込み RMS { "0.0293" } m kepler16 { "900" } s SISRE 軌道 RMS { "0.1073" } m 最大{ "0.3812" } m 時計込み RMS { "0.1075" } m kepler-rac { "60" } s SISRE 軌道 RMS { "0.0000" } m 最大{ "0.0000" } m 時計込み RMS { "0.0005" } m kepler-rac { "120" } s SISRE 軌道 RMS { "0.0001" } m 最大{ "0.0002" } m 時計込み RMS { "0.0007" } m kepler-rac { "300" } s SISRE 軌道 RMS { "0.0005" } m 最大{ "0.0021" } m 時計込み RMS { "0.0012" } m kepler-rac { "600" } s SISRE 軌道 RMS { "0.0097" } m 最大{ "0.0395" } m 時計込み RMS { "0.0096" } m kepler-rac { "900" } s SISRE 軌道 RMS { "0.0388" } m 最大{ "0.1143" } m 時計込み RMS { "0.0390" } m 16パラメーターのケプラー要素セットは、{ "60" } s での{ "0.0003" } m から{ "900" } s での{ "0.1073" } m まで悪化します：一周回に二回の調和項を持つ一つのケプラー要素セットでは、LEO 弧の高周波の重力項と抗力を数分を超えて追従できず、その最小二乗残差は窓全体で振動します。ケプラー要素セットが張る次数より高次の along/cross/radial 多項式が残りを吸収し、{ "900" } s で{ "0.0388" } m になります。

seg-3f299f6b20c8 = 任意フィールド：<c1/>、<c2/>、<c3/>、<c4/>、<c5/>、<c6/>、<c7/>、<c8/>、<c9/>、<c10/>、<c11/>

seg-3adfcd7e275c = 例の<c1/>では、とりわけ次を設定しています：

seg-8243db187e2f = [encode-decode, fit-interval-trade]

seg-e866d042aab8 = Celeste IOD メッセージ（ワークショップ用プリセット）

seg-c42f5a1ed964 = [kepler16, kepler-rac]

seg-549a6103e711 = bit

seg-fb689f03361c = byte

seg-c60901596100 = 結果ラベル（エンジンによるもの）：混在 — VALIDATED の構成要素、MODELLED の結果。SISRE の重みは公表されている MEO/GEO の表（Montenbruck ら { "2018" }）を再現し、Galileo ICD のユーザーアルゴリズムは実際の Galileo 放送エフェメリスについて RTKLIB を再現し、CRC-24Q はそのカタログのチェック値と RTCM { "1005" } の例示フ

seg-35e92abc6a23 = エンジンが scenarios/leo-navmsg-celeste-iod.toml（種別 leo-navmsg）について出力するグラフ

seg-43c1d9c81ccf = MODELLED { "5" } · VALIDATED { "6" }：この種別を挙げる<a1>検証マトリクス</a1>の行です。

seg-efbe11be7ca1 = <b>VALIDATED</b> leo_navmsg::sisre::sisre_weights：動径方向の重み w_R と、横方向の二乗の重み w_AC^{ "2" } を、仰角以上の可視な地球キャップ上に一様に分布するユーザーについて、視線方向の天底角の cos^{ "2" } と半分の sin^{ "2" } の平均として求めます

seg-b27c5fe8e179 = <b>VALIDATED</b> leo_navmsg::elements::kepler_point：Galileo OS SIS ICD のケプラー要素の評価（ケプラー方程式、二次調和補正、地球固定の昇交点）を、エンジンの RINEX 評価器とは別に記述したもので、引数付きの位置を返します テスト：<a1>leo_navmsg_reference.rs</a1>。

seg-3a53131dc9a4 = <b>VALIDATED</b> leo_navmsg::codec::crc24q：生成多項式 0x1864CFB、初期値{ "0" }、反転なし、最終 XOR なし、Kshana の LEO フレームが先行するすべてのバイトにわたって持つ検査値

seg-2b24c2669c23 = <b>VALIDATED</b> <c1/>種別のフィッターとトレードオフ：選んだ次数までの帯状 J2-J6 または EGM2008 重力と抗力で積分した真値の軌道と、シード付きの自由または制御された時計；非特異

seg-ddb27b07b9af = さらに{ "7" }件が検証マトリクスにあります。

seg-053dae66c1be = <b>VALIDATED</b> leo_navmsg::sisre::sisre_weights：動径方向の重み w_R と、横方向の二乗の重み w_AC^{ "2" } を、cos^{ "2" } と半分の sin^{ "2" } の平均として、視線方向の天底。オラクル（ExternalDataset）：Montenbruck、Steigenberger、Hauschild（{ "2018" }）が公表している SISRE 重み係数の表、Multi-GNSS signal-in-space range error assessment - Methodology and results、Advances in Space Research { "61" }({ "12" }):3020-3038、doi 10.1016/j.asr.2018.03.041：GPS { "0.98" } と 1/49、GLONASS { "0.98" } と 1/45、Galileo { "0.98" } と 1/61、BeiDou MEO { "0.98" } と 1/54、BeiDou IGSO/GEO { "0.99" } と 1/126。LEO の軌道半径で評価した同じ平均は、

seg-5b43ffde4634 = <b>VALIDATED</b> leo_navmsg::elements::kepler_point：Galileo OS SIS ICD のケプラー要素の評価（ケプラー方程式、二次調和補正、地球固定の昇交点）を、別個に記述。オラクル（ExternalDataset）：RTKLIB 2.4.2-p13 の eph2pos による ECEF 位置（同じ ICD アルゴリズムの独立した実装）を、2024-09-10 の実際の BKG/IGS 放送レコードについて求めたもので、どちらも出所とともに tests/fixtures/rinex_sp3_interop（NOTICE、rinex_ecef_reference.txt、brdc_multignss_slice.rnx）にコミットされています。これはケプラー要素のユーザーアルゴリズムを検証するものです；その上に加える along/cross/radial 補正は独自の行で扱われ、Liu の項は

seg-5b4f1e63795f = <b>VALIDATED</b> leo_navmsg::codec::crc24q：生成多項式 0x1864CFB、初期値{ "0" }、反転なし、最終 XOR なし、Kshana の LEO フレームが先行するすべて。オラクル（ExternalDataset）：これらのパラメーターに対する CRC カタログのチェック値（reveng.sourceforge.io の CRC カタログ、CRC-24/LTE-A：幅{ "24" }、poly 0x864CFB、init { "0" }、check 0xCDE703）で、これは RTCM { "10403" } と Galileo OS SIS ICD の CRC-24Q パラメーターであり、RTCM { "10403" } に掲載されているメッセージタイプ{ "1005" } の例示フレーム

seg-6e2719a28884 = <b>VALIDATED</b> <c1/>種別のフィッターとトレードオフ：選んだ次数までの帯状 J2-J6 または EGM2008 重力と抗力で積分した真値の軌道と、シード付きの自由または制御。オラクル（ExternalDataset）：真値としての実際の精密科学軌道（TU Graz IfG/ITSG の運用リダクト・ダイナミック軌道、謝辞を付ければ自由に利用可能；SHA-256 値はフィクスチャーの NOTICE に記載）を、{ "20" } 分と{ "30" } 分の弧にわたって16パラメーターセットで当てはめ、Liu ら { "2025" }（Remote Sensing { "17" }({ "16" }):{ "2894" }、CC BY { "4.0" }）が同じ衛星と日について公表している統計と比較：along、cross、radial の RMS はいずれも1.5x 以内（実測{ "0.804" }～{ "1.087" }）、SISR

seg-0c26ec09bf16 = SISRE は、メッセージが当てはめられた真値に対するメッセージの表現誤差です；軌道決定誤差と軌道予測誤差はモデル化していません。（結果<c1/>）

seg-3762de39de07 = 真値の軌道は Kshana の数値積分（帯状または EGM2008 重力、静的な指数関数型抗力）であり、実際の衛星の精密軌道ではありません；第三体、太陽放射圧、潮汐はありません。（結果<c1/>）

seg-4486dd350b57 = バイナリ形式は、公表されているメッセージ構成要素をもとにした Kshana 独自の文書化された符号化であり、Celeste やその他のシステムのビット配置ではありません（いずれも非公開です）。（結果<c1/>）

seg-2a5c1bce8320 = RINEX 形式のブロックは文書化された Kshana 拡張です；RINEX { "4.02" } は LEO 航法レコードを定義していません。（結果<c1/>）

seg-642d8f4d60e7 = NeQuick-G の係数は搬送されて実効電離レベルは計算されますが、それを遅延に変換する NeQuick の電子密度積分は実装されていません；Klobuchar の遅延は実装されており、1/f^{ "2" } で搬送波に換算しますが、電離圏内を飛ぶ衛星に対する補正はありません。（結果<c1/>）

seg-8ba04a3147bd = Liu ら { "2025" } の22パラメーターの項は、論文のユーザーアルゴリズム（式 1-7）と当てはめ戦略（節{ "2.3" }）に従っています；その SISRE の高度依存の数値は実際の精密軌道を使っているため、Kshana が積分した軌道でのこの比較は MODELLED であり、VALIDATED ではありません（実軌道での比較は tests/leo_navmsg_fit_real_orbit_oracle.rs です）。（結果<c1/>）

seg-b3585c7feb4e = 混在 — VALIDATED の構成要素、MODELLED の結果。SISRE の重みは公表されている MEO/GEO の表（Montenbruck ら { "2018" }）を再現し、Galileo ICD のユーザーアルゴリズムは実際の Galileo 放送エフェメリスについて RTKLIB を再現し、CRC-24Q はそのカタログのチェック値と RTCM { "1005" } の例示フレームを再現します。当てはめ、SISRE、連続性、量子化の数値はすべて MODELLED です：メッセージの表現誤差を、次に対して（結果<c1/>）

seg-d6e412aab1b4 = MODELLED：当てはめと SISRE の数値はすべて、Kshana が積分した真値に対する表現誤差です（軌道決定や予測の誤差はありません）；Liu ら（種別カタログ（<c1/>））

seg-c5478f572d21 = ファミリーページ：<a1>低軌道航法</a1>

seg-d9257241d523 = トピックページ：<a1>LEO-NAVMSG.md</a1>

seg-b0dcad22aed6 = <s1>前へ</s1>launch-window

seg-2984c4c69850 = <s1>次へ</s1>leo-pass

seg-debc2f07db78 = true

seg-cb91473bfdda = トピックページ：<a1>LEO-PNT.md</a1>
