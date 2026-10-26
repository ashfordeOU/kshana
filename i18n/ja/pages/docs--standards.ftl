# docs--standards: translations (ja)

seg-4a2ce9f33ab2 = 書き込み

seg-9120d3e96e5e = 読み取り

seg-5ad814c7ef9e = 備考

seg-aab745a65e76 = モジュール

seg-bf09433a7342 = GeoJSON

seg-906440b861cd = フレーム

seg-32b620b3574e = 用途

seg-8ba331635865 = 標準と相互運用性

seg-96a449a63d11 = ソース：<c1/>

seg-3ed65a16e7d0 = Kshana は、GNSS（全球測位衛星システム）、飛行力学、時刻の各コミュニティの標準的な交換フォーマットを扱うため、RTKLIB（オープンソースのリアルタイムキネマティック測位ライブラリ）、gLAB、Ginan、GMAT（General Mission Analysis Tool）、Orekit、IGS（国際 GNSS 事業）の解析センターのツール群と、独自の孤島ではなく並んで使えます。このページは、エンジンが解析または出力する<b>交換フォーマット</b>を、それぞれを実装するモジュールと権威ある仕様に対応づけます。

seg-d1aa512ad4ee = 対象はフォーマット、つまり読み書きの方向があるものに限られます。エンジンが解析するのではなく<em>実装する</em>信号とアルゴリズムの規格（IS-GPS-200（IS：Interface Specification、GPS：Global Positioning System）、IEEE（米国電気電子学会）{ "1139" }、RTCA（旧 Radio Technical Commission for Aeronautics）DO-229E、IGRF-14（IGRF：International Geomagnetic Reference Field）、ARAIM（高度な受信機自律インテグリティ監視）WG-C（WG：Working Group）リファレンス、CCSDS（宇宙データシステム諮問委員会）401/DSN（DSN：Deep Space Network））は、代わりに <a1><c1/></a1> で行ごとに裏付けられています。

seg-656920618fb7 = エンジンが扱うフォーマット

seg-4fe4920a3fa1 = 規格

seg-d08f1943c53b = 方向

seg-968a1d48364c = 仕様・発行元

seg-304ffba9669f = <b>CCSDS OEM</b>（Orbit Ephemeris Message）

seg-68d762928f76 = 読み込みと書き出しの<b>両方</b>

seg-eea6e5c8c220 = CCSDS 502.0-B Orbit Data Messages、KVN（キーワード・値表記）形式

seg-be700901c03e = GMAT、Orekit、STK（Systems Tool Kit）が取り込む、表形式の状態ベクトル暦。<c1/> が読み戻します。<b>CCSDS 502.0-B-3 の図 G-11 の Blue Book の例を原文どおりに復元することで確認済み</b>（<a1><c2/></a1>）。任意の { "6" }×{ "6" } 位置・速度の<b>共分散ブロック</b>（<c3/>、21 要素の下三角 KVN シリアライズで、任意の <c4/> を伴う）は、書き出し（<c5/>）と読み込み（<c6/>）の両方に対応し、ラウンドトリップで対称です（<a2><c7/></a2> のテスト）。

seg-3c439cc66ea6 = <b>CCSDS OMM</b>（Orbit Mean-Elements Message）

seg-8e9f975d443b = CCSDS 502.0-B-2、KVN 形式

seg-fb5218415d68 = SGP4/TLE（SGP4：Simplified General Perturbations { "4" }、TLE：two-line element set（二行軌道要素））の平均軌道要素（平均運動、e、i、Ω、ω、M、BSTAR（軌道伝播器の抗力項））の標準化トラックでの公表形式。<c1/> シナリオでは、<c2/> または <c3/> により CLI（コマンドラインインターフェース）から利用できます（TLE で定義された衛星ごとに 一つの OMM で、実際の NORAD（北米航空宇宙防衛司令部）ID、COSPAR（国際宇宙空間研究委員会）識別符号、エポックを持ちます。<a1><c4/></a1>）。XML（Extensible Markup Language）形式と読み込み機能は今後の課題です。

seg-08425c4b2093 = <b>CCSDS TDM</b>（Tracking Data Message）

seg-bf870037a77d = CCSDS 503.0-B Tracking Data Message、KVN 形式

seg-cd96db42ab43 = DSN/ESTRACK（ESTRACK：European Space Tracking network）のパスが OD（軌道決定）システムに届ける、距離・ドップラー・角度の追尾レコード。<b>CCSDS 503.0-B-2 の図 E-9 の Blue Book の例を原文どおりに復元することで確認済み</b>（<a1><c1/></a1>）。

seg-4dd7358264b8 = <b>CCSDS Space Packet</b>（{ "133.0" }）

seg-40accc5f1a67 = CCSDS 133.0-B-2 Space Packet Protocol

seg-ed9c8bdddd6d = 地上システムがやり取りする、6 オクテットの TM/TC（TM：テレメトリ、TC：テレコマンド）プライマリヘッダーのフレーミング。<b>エンコーダーは、独立した <c1/> ライブラリが公表しているバイトレベルのテストベクトルを再現します</b>（<a1><c2/></a1> のテスト）。

seg-aa942198bb2e = <b>SP3-c（SP3：Standard Product { "3" }、精密軌道フォーマット）/ SP3-d</b>（精密暦）

seg-4d4237e15ef1 = IGS Standard Product { "3" }（c/d）

seg-8d1089fbd59d = 地球固定（ECEF）の位置と時計の時系列。実際の <c1/> スナップショットで、ラウンドトリップが { "0.5" } m 未満で確認されています（<a1><c2/></a1>）。

seg-761698fcf960 = <b>RINEX（Receiver Independent Exchange Format）{ "3" }</b>（放送航法）

seg-897068cff342 = RINEX { "3" }.x NAV（IS-GPS-200、Galileo ICD（インターフェース制御文書）、BeiDou ICD、GLONASS（ロシアの全球航法衛星システム）ICD）

seg-1b7710db3abf = マルチ GNSS の NAV 取り込み（GPS LNAV（レガシー航法メッセージ）、Galileo F/NAV、QZSS（日本の準天頂衛星システム）、BeiDou MEO/IGSO（MEO：中軌道、IGSO：傾斜静止軌道）、GLONASS の状態ベクトル）。第一級の <c1/> ソースとして使えます。

seg-44991b52d1ff = <b>TLE / 3LE</b>（二行・三行軌道要素）

seg-17769f14095d = NORAD / Celestrak、AIAA（米国航空宇宙学会）2006-6753

seg-8d4dd42edc89 = 確認済みの SGP4/SDP4（SDP4：Simplified Deep-space Perturbations { "4" }）コアで伝播します（公式の AIAA ベクトル { "666" } 件に対して { "4.12" } mm）。

seg-498aac915067 = <b>RINEX 3.0x</b>（観測）

seg-437d07b5aa4f = RINEX 3.0x OBS（{ "4.00" } は解析できる想定ですが、{ "4.00" } のファイルで実行したことはありません）

seg-ac97f77f142c = RINEX のもう一方の半分：受信機自身のコード・搬送波・ドップラー・SNR（SNR：信号対雑音比）の記録（<c1/>）。これは、<c2/> の単独測位ソルバーが放送航法ファイルとともに消費する入力です（<a1><c3/></a1>、実際の IGS 観測局 ABMF）。

seg-2418cd0e4d79 = <b>IONEX</b>（IONosphere map EXchange format、全球 TEC（全電子数）マップ）

seg-bf1bb42f04c4 = IONEX { "1" }.x（IGS の電離圏プロダクト）

seg-af9efa0df270 = <c1/> は、IGS の全球全電子数グリッドを読み込みます。これは放送される Klobuchar 補正に代わる<em>実測</em>の選択肢で、空間と時間の双一次補間と、斜め遅延への傾斜マッピングを伴います。

seg-6f0da4b59d7c = <b>IERS（国際地球回転・基準座標系事業）<c1/> / Bulletin B</b>（地球姿勢）

seg-197dfa18ca19 = IERS Conventions、IERS EOP（地球姿勢パラメーター）{ "14" } C04 / <c1/>

seg-0d102d904cfe = 公式プロダクトによる UT1（Universal Time { "1" }、地球自転時刻）−UTC（協定世界時）と極運動。<b>予測</b>の行も含むため、座標系の変換をリアルタイムで実行でき、その予測誤差の増大を見積もれます（<a1><c1/></a1>）。

seg-2a4e274838ef = <b>KIF</b>（Kshana Interchange Format）

seg-193b33461507 = このリポジトリ：<a1><c1/></a1> を参照

seg-33ef8d792a90 = あらゆる成果物を包める、中立でバージョン付きのエンベロープ：<c1/> / <c2/> / <c3/> / <c4/> / <c5/>。利用側に対して、メジャー・マイナーの互換性の判定を明示します。外部の標準ではありません。外部のツールが認識する必要があるため、ここに文書化しています。

seg-a492f437efd0 = LunaNet / IOAG（Interagency Operations Advisory Group）の月面向け交換

seg-b19cf72da934 = 書き出し（時刻メタデータは読み込みも可）

seg-d641c72a6449 = LunaNet 相互運用仕様 / IOAG 月面通信アーキテクチャ、CCSDS { "502.0" } 上

seg-cc796afe7a72 = LunaNet/IOAG に沿った CCSDS 形式で出力される月面座標系、月の時間系、月の暦（<c1/>、<c2/>、<c3/>）。出力された OEM に対するフィールド検査を伴います（<a1><c4/></a1>）。

seg-5abc05382382 = <b>CZML</b>（Cesium Language）

seg-da7e20d3786b = CesiumJS の CZML パケット形式

seg-8d3a73646be3 = CesiumJS の地球儀向けの、時刻付きパケットによる JSON（JavaScript Object Notation）ストリーム。移動する物体は GCRS（<c1/>）で書き出します。地球上に物体を置くあらゆる種別で <c2/> が使えます。

seg-cd7a91109a8d = <b>KML</b>（Keyhole Markup Language）

seg-be4dd74f3915 = OGC（Open Geospatial Consortium）KML { "2.2" }

seg-57468e6d97f2 = Google Earth と GIS（地理情報システム）ツール向けの、地球固定の経度、緯度、高さ。<c1/>。

seg-46d977015b07 = 書き出しと読み込みの<b>両方</b>（経路）

seg-42b8e3129e64 = IETF（Internet Engineering Task Force）RFC { "7946" }

seg-425a83b44545 = Web 地図と GIS ツール向けの地球固定ジオメトリ（<c1/>）。<c2/> は、それを飛行させる種別の直線航跡の入力として読み戻されます（<c3/>）。

seg-d9b137e11514 = <b>STK エフェメリス</b>（<c1/>、<c2/>）

seg-347ee6f6c1df = Ansys STK のエフェメリスファイル形式

seg-45576578d357 = STK と、そのエフェメリス形式を読むツール向けの慣性系（<c1/>）の位置と速度。<c2/>。

seg-03fd79cce4a4 = <b>SigMF</b>（Signal Metadata Format）

seg-42272f73f456 = SigMF 仕様

seg-202b559c30a6 = 複素ベースバンドの記録と JSON メタデータ：<c1/> 種別は合成した同相・直交（IQ）サンプルを書き出し（<c2/>）、<c3/> ブロックを通じて記録を読み込みます。

seg-60e7c8505cb5 = <b>LEO 航法メッセージのテキスト</b>（RINEX-4 形式と CSV（カンマ区切り値））

seg-f22442e0e8ea = RINEX { "4" } の航法レイアウトを適応したもの

seg-8338e445b3a5 = <c1/> 種別が低軌道（LEO）衛星について出す放送暦と時計を、書き出して再び取り込みます。文書化された適応であり、登録済みの RINEX メッセージ種別ではありません（検証マトリクスでは MODELLED）。

seg-1b89ab4e93f7 = 座標系と時刻

seg-dbbd023631b6 = エンジンが出力する座標系は、暗黙ではなく明示されています。CIO ベース（CIO：Celestial Intermediate Origin）の IAU（国際天文学連合）2006/2000A 変換（<a1><c1/></a1>）と、春分点/GMST（GMST：グリニッジ平均恒星時）の TEME（真赤道・平均春分点）変換（<a2><c2/></a2>、<a3><c3/></a3>）は、SOFA/ERFA（SOFA：Standards of Fundamental Astronomy、ERFA：Essential Routines for Fundamental Astronomy）の参照ベクトルに対してビット単位で一致することを確認しています（<a4><c4/></a4> を参照）。

seg-819d28bd9361 = 実現

seg-69aca96b7e42 = TEME

seg-ec81608934a6 = SGP4 ネイティブ

seg-7631c594fd1a = 真赤道・平均春分点。SGP4/SDP4 の出力座標系。

seg-eeb28cc286b3 = GCRS（Geocentric Celestial Reference System）/ J2000

seg-745285e29202 = IAU { "2006" } 歳差 + IAU 2000A/2000B 章動

seg-3747add299d5 = <c1/>（春分点チェーン）。

seg-4859fd3e5864 = <b>CIRS</b>（Celestial Intermediate Reference System）

seg-1c09f22adcf2 = IAU 2006/2000A CIO（X、Y、s）

seg-8891621dc302 = ITRS（International Terrestrial Reference System）/ ECEF

seg-a28e26cd2481 = ERA（地球回転角）+ IERS 極運動（CIO）、または GMST + 極運動（春分点）

seg-e7426df3c59d = <c1/>（CIO、<c2/>）/ <c3/>（春分点）。

seg-74a4801fd685 = WGS-84（WGS：World Geodetic System）測地

seg-b58a44eaaa39 = 厳密 + 反復による逆変換

seg-4d9472dd73d3 = 時間系

seg-cbe7a7ce7317 = <b>TT</b>（地球時）

seg-25191c1a4135 = 歳差・章動・CIO の引数の評価（<c1/>）。

seg-8c478d6b4786 = 地球回転角 / GMST（<c1/>）。

seg-f7033ca0c13f = <b>二部構成の JD</b>（ユリウス日）

seg-64a5adeacd5b = <c1/>。µs 未満のエポック分解能のため。

seg-210f40885a8e = 出力フィールドと規格の対応（CCSDS { "502.0" }）

seg-e9dbc25a3ee9 = 二つの軌道メッセージ書き出し機能が、CCSDS ODM（Orbit Data Messages、{ "502.0" }）の各フィールドに何を入れるか。<c1/> を <c2/> と <c3/> で実行した結果から読み取ったものです。

seg-d2b91c300b82 = Kshana の出力

seg-119884b009cc = CCSDS ODM のフィールド

seg-8b0593f67c7f = 値・単位

seg-d33eb162d179 = OEM セグメントのメタデータ

seg-4b338284e56a = <c1/> / <c2/> / <c3/>。伝播器が積分する座標系と、エポックグリッドの時間系であり、付け替えはしていません

seg-e0a44af9aaf8 = OEM 状態エポック

seg-b0623bab9fcc = 各データ行の最初の列

seg-410bd5a9ba14 = ISO-8601（ISO：国際標準化機構）の暦時刻、GPS 時間系

seg-a7c95802e01a = OEM 位置、速度

seg-0539cafabf60 = <c1/> のデータ列

seg-8add7e800e0e = km、km/s

seg-8b386548c03c = OMM メタデータ

seg-e2c63414d7c2 = OMM エポック

seg-5109e5948d2a = ISO-8601 の年通日形式（TLE のエポック）

seg-b74289a29c24 = OMM 平均軌道要素

seg-f3492fa95178 = rev/day、–、deg、1/Earth radii

seg-fc82185abe10 = <c1/> 種別の結果 JSON（JavaScript Object Notation）は、サンプルごとに同じ状態を SI（国際単位系）単位で持ちます：<c2/>、<c3/> / <c4/>、<c5/> / <c6/>、<c7/>（m、m/s）、および <c8/>、<c9/>、<c10/>。

seg-014d1392018e = 正直な適用範囲

seg-017c026df3d7 = OEM、TDM、Space Packet、KIF、SigMF、LEO 航法メッセージのテキストは<b>読み込みと書き出しの両方</b>に対応します。OMM、CZML、KML、STK エフェメリスは<b>書き出し</b>のみです（OMM の読み込みと XML シリアライズは今後の課題です）。GeoJSON は書き出され、経路として読み戻されます。RINEX NAV、RINEX OBS、IONEX、IERS EOP プロダクト、TLE は<b>読み込み</b>のみです。LunaNet/IOAG の月面向け書き出しは書き出しのみで、その時刻メタデータはラウンドトリップします。どの書き出しが各同梱シナリオに当てはまるかは、<a1><c1/></a1> に一覧があります。

seg-68b4f5116419 = 上記の CCSDS/IGS のフィールド対応は文書であり、いずれかの標準が満たされているという主張ではありません。これらの標準に対する正式な評価（および ESA（欧州宇宙機関）の ESSR（European Space Software Repository）/ NASA（米国航空宇宙局）のオープンカタログへの登録）は別途管理されており、審査待ちです。

seg-e461587ad2cf = 独立した SPICE/ANISE（SPICE：Spacecraft, Planet, Instrument, C-matrix, Events、ANISE：Attitude, Navigation, Instrument, Spacecraft, Ephemeris。純 Rust の惑星ジオメトリのツールキット）による座標系変換の数値的クロスチェックは、ワークスペースから除外された独立クレート <c1/> で提供されています。<c2/> を ANISE の GCRF（Geocentric Celestial Reference Frame）→ ITRF93（International Terrestrial Reference Frame { "1993" }）の回転と { "2020" }–{ "2023" } 年の八つのエポックで比較すると、地上で ≤ { "0.86" } m、GNSS 軌道で ≤ { "3.6" } m の範囲で一致します（<a1><c3/></a1> を参照）。SPICE カーネルを必要とするため、既定の継続的インテグレーション（CI）のゲートではありません。

seg-f6d67027d669 = <s1>前へ</s1>機能マップ

seg-01b6270b6c6a = <s1>次へ</s1>ラインカバレッジ
