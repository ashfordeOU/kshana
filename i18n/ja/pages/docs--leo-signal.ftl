# docs--leo-signal: translations (ja)

seg-3ea93ae372ca = 内容

seg-6cb7a787ac67 = 参考文献

seg-cbf0f9bcd2d8 = オラクル

seg-6e0cb6acc073 = VALIDATED

seg-f63dd3d7aad4 = 出典

seg-587beeccaa11 = プリセット

seg-6752521002b2 = 部分

seg-2b0d77219437 = プリセット

seg-125aac68d94f = PUBLIC、<a1>arXiv { "2509.19551" }</a1>

seg-c5ce76c91ff7 = ラベル

seg-a86ce24d81de = バンド

seg-74f4e80c65cb = 成分

seg-e769f0411e64 = 発行元により撤回済み。アーカイブされたコピーはありません

seg-2255f9acec5b = 出典：<c1/>

seg-ff4c44ecdecb = LEO-PNT の信号設計とマルチバンドスペクトル

seg-5e222f965192 = <c1/> シナリオ種別は、低軌道（LEO）の PNT（測位・航法・時刻）信号を解析します。特定のシステムに縛られません。信号はパラメーター化された設計（コードではなくデータ）なので、同じ種別で、公表された商用信号、誰も公表していないバンド向けの代表的な設計、あるいはシナリオがインラインで書く任意の設計を解析できます。<c2/> 種別もこれらの設計を、極超短波（UHF）から C までの任意のバンドで、バンドごとに独自のジャマーを付けて描き、<c3/> バンドや <c4/> の実行は、そのいずれも搬送できます（<a1>設計が使われる場所</a1>を参照）。

seg-caccfa826a1a = 同梱の例を実行します：

seg-441136f32290 = <c1/>：代表的な設計での UHF から広帯域 C までのバンドのトレードオフ；

seg-23cea428326c = <c1/>：公表された Xona Pulsar X1 と X5 の信号；

seg-5dcfa318a4f3 = <c1/>：バンドごとのジャマーを伴う UHF、L、S、C のパネル（<c2/> シナリオ）；

seg-0390769a8d7f = <c1/>：リポジトリのチェックアウトから（同梱されていません）。欧州宇宙機関（ESA）の Navigation Innovation and Support Programme（NAVISP）の LEO-PNT ワークショップ（{ "2026" }）で発表された Celeste In-Orbit Demonstration（IOD）のバンドと信号構成です（下の<a1>ワークショップのパラメーター</a1>を参照）。

seg-62511ee92f8a = コード：<c1/>（信号設計、この種別）、<c2/>（閉形式）、<c3/>（マルチバンドのウォーターフォール）、プリセットファイルは <c4/> の下。

seg-ce08de9a19de = 信号設計

seg-fc0d265f4006 = 中心周波数、送信帯域幅（スペクトルはその外側でゼロ）、および国際電気通信連合（ITU）の割り当て：無線航行衛星業務（RNSS）、無線測位衛星業務（RDSS）、移動衛星業務（MSS）、地球探査衛星業務（EESS）、RNSS 以外のバンド、またはその他

seg-be2d5e822342 = <b>捕捉</b>成分（短く低レートで、見つけやすい）、<b>データ</b>成分（航法メッセージ）、<b>パイロット</b>成分（データなし、測距用）の任意の部分集合

seg-e73d9832efe0 = 成分ごと

seg-dac784d5f41a = 変調：n × { "1.023" } Mchip/s の二位相偏移変調 BPSK(n)（n は分数でもよく、BPSK(1/3) は { "341" } kchip/s）、バイナリオフセットキャリア BOC(m,n)、多重化 BOC、または直交周波数分割多重（OFDM）ビーコン用の <c1/>。電力の配分、周波数分割多元接続（FDMA）のサブキャリアオフセット、コード長、データレート

seg-4ccb9e269d64 = 任意

seg-4c22d21ea8f0 = 基準および最大の受信電力、軌道高度、ドップラーのみの信号用の <c1/>、公表されているものと仮定したものについての注記

seg-c6b46532af9a = シナリオは、信号を <c1/> とインラインの <c2/> テーブルから取ります。どちらもない場合は <c3/> プリセットを解析します。

seg-a917a5ccfb79 = <c1/> の下にファイルが一つずつあり、コンパイルに含まれ、それぞれが出典 URL を引用しています。出典が公表していない値は、ファイルとレポートの中でREPRESENTATIVEと表示されます。

seg-7159574bf255 = 信号

seg-c2831d853b1d = 明示した近似

seg-7816d4f1c3f1 = <c1/>（{ "1593.3225" } MHz、{ "1.023" } Mchip/s）、<c2/>（{ "1190.51625" } MHz、{ "10.23" } Mchip/s）。最小および最大の受信電力。{ "1080" } km

seg-332a08bef0de = enhanced Feher 四位相偏移変調（EFQPSK）を矩形チップの BPSK 包絡線で描画。コードシフトキーイングとオーバーレイコードはモデル化していません。送信帯域幅 = メインローブ（非公開）

seg-d37420c5c9f5 = <c1/> Satellite Time and Location（STL）バースト、{ "25" } ksymbol/s の四位相偏移変調（QPSK）、{ "780" } km、ドップラーとタイミングのみ

seg-a765878134e2 = PUBLIC、<a1>Resilient Navigation and Timing Foundation（RNTF）のレポート</a1>

seg-5ca54b21f017 = 搬送波は { "1616" } から { "1626" } MHz の中央。受信電力は、全球測位システム（GPS）の { "300" } から { "2400" } 倍という公表値から導出

seg-e43d1db73131 = <c1/>、{ "240" } MHz の OFDM ビーコン、ドップラーのみ

seg-ff9e0075e868 = PUBLIC、<a1>NAVIGATION { "72" }({ "1" })</a1>

seg-fee9a553c9ae = 平坦なスペクトル。チャネル中心とシェル高度はREPRESENTATIVE。公表された約 { "57" } dB-Hz の搬送波対雑音密度比（C/N₀）は、受信機を通じて設定

seg-f89372b5231e = <c1/>、<c2/>、{ "2.046" } Mchip/s の BPSK

seg-2e6475b25d55 = PUBLIC、<a1>PubMed Central PMC10301026</a1>

seg-ac53cebe5303 = 搬送波は GPS L1 と L5 の搬送波の位置に置いています（出典では「近く」）。コード長はREPRESENTATIVE

seg-cb1420efc108 = <c1/>、{ "5020" } MHz、{ "20" } MHz 内の BPSK({ "10" })

seg-895f6039fce2 = REPRESENTATIVE。パラメーターが公開されていない C バンドシステム向け（TrustPoint など）

seg-a407aaab864c = 設計全体

seg-2f679a429dae = REPRESENTATIVE。割り当ては <a1>ITU 無線通信規則</a1>から。{ "465" } MHz の UHF 搬送波は、公開の <s1>LEO-PNT 信号の openRECEIVER 調査</s1>から

seg-2054d9ce8a0d = 設計全体（UHF の帯域幅と変調も含む）

seg-24360342e8e6 = ATOMIC の「ゼロクロック」多項式エフェメリスは、信号設計ではなく航法メッセージのモデルであり、ここではなく航法メッセージの作業に属します。

seg-ebfc032d7898 = 信号ごとに計算するもの

seg-211f655e00fa = <b>帯域制限したパワースペクトル密度（PSD）</b>と、成分ごとの、送信帯域が通す電力の割合。中心にある BPSK 成分では、閉形式 <c1/> が数値と並んで示されます（メインローブで { "90.3" } %）。

seg-05e2a7b8235a = 帯域内の追跡成分の<b>二乗平均平方根（RMS、Gabor）帯域幅</b>と、BPSK の閉形式 <c1/>。

seg-f878fd0359c9 = Betz と Kolodziejski（{ "2009" }）の帯域制限付きアーリー・レイト式による、C/N₀ とアーリー・レイト相関器間隔に対する遅延ロックループ（DLL）の<b>符号追尾の熱雑音ジッター</b>：<c1/>。既定ではコヒーレントで、要求に応じて非コヒーレントの二乗損失を加えます。レポートには、帯域無制限の教科書的な式（Kaplan と Hegarty）と、Gabor 帯域幅で決まる間隔ゼロの限界も併記します。<b>測距精度</b>は、基準の C/N₀ と間隔におけるこのジッターをメートルで表したものです。

seg-089e4e98af82 = <b>捕捉</b>：仰角マスクでの頭上通過における衛星ドップラーの最大値（<c1/>、円軌道、地球の自転なし）に発振器とユーザーの項を加えたもの、<c2/> のドップラービン、一周期分の符号ビン、セルごとの誤警報確率に対する自乗則検波器（一般化 Marcum Q）の検出確率（中心位置と最悪ケースのずれ位置の両方）、そして直列探索と符号並列の単一ドウェル探索の平均捕捉時間（Holmes）。

seg-1e2029183bdc = <b>互換性</b>：帯域制限した信号が、各全球測位衛星システム（GNSS）受信機帯域にある GPS L1 粗捕捉（C/A）、Galileo E1、GPS L5、Galileo E5a、E5b、および E5 の代替 BOC（AltBOC）信号に及ぼすスペクトル分離係数（SSC）と、受信電力でそれが引き起こす C/N₀ 損失、さらに各 GNSS 信号が LEO の追尾成分に及ぼす SSC と C/N₀ 損失。

seg-864f3f2a5aa1 = <b>ジャマー耐性</b>：搬送波上の連続波（CW）トーン、送信帯域全体の平坦なノイズ、追尾成分に整合させたノイズのそれぞれについて、追尾成分を追尾しきい値に至らせるジャマー対信号電力比（J/S）。<c1/> 種別自身の SSC コード（<c2/>）から求めます。

seg-0fbea397ab93 = C/N₀ の規約：掃引と基準は、<b>帯域内の合計</b>の C/N₀ です。成分の取り分は、追尾式とジャマー式に <c1/>（フィルタ前の電力に占める取り分を帯域内の割合で割ったもの）として入ります。これは <c2/> 種別が通常の帯域に使う規約と同じで、受信機帯域の外にある変調の電力は同じように失われます。

seg-3b7d16e8873a = 帯域のトレードオフ

seg-39382eb3a60c = <c1/> は、すべての信号を基準信号と並べます：指定した斜め方向の全電子数（TEC）（{ "1" } TEC unit、TECU、= 10¹⁶ electrons/m²）に対する一次の電離圏群遅延 <c2/>、ある斜距離での自由空間伝搬損失（FSPL）、<b>等しい C/N₀</b> と<b>等しい等価等方放射電力（EIRP）</b>（C/N₀ から自由空間損失の差を引いたもの、両端とも等方性アンテナ）での測距精度、そして等 EIRP の C/N₀ でのジャマー耐性です。

seg-58ced9eba711 = <c1/>（{ "50" } TECU、{ "1000" } km、{ "45" } dB-Hz、0.5 チップのコヒーレント間隔、{ "1" } Hz ループ、{ "20" } ms）：

seg-72f051e2d7e1 = 信号

seg-3cfdff157be3 = 電離圏遅延

seg-b1436d1fd7a4 = L に対する ΔFSPL

seg-b5ce20ced519 = 測距、等 C/N₀

seg-2becbee24d47 = C/N₀、等 EIRP

seg-aba982013f21 = 測距、等 EIRP

seg-8b292612e43e = CW J/S 耐性

seg-53c8b6059c3f = { "465" } MHz, BPSK({ "5" })

seg-1ee03c5e8633 = { "93.19" } m (×{ "6.57" })

seg-66e74ec8ec1f = −{ "8.17" } dB

seg-4dfc4b277e46 = { "0.221" } m

seg-2a67835c7ddd = { "53.17" } dB-Hz

seg-b36b61eaff50 = { "0.086" } m

seg-37de1532b69e = { "42.1" } dB

seg-f16b26301a6b = { "1191.795" } MHz, BPSK({ "10" })

seg-1cc0fc817fca = { "14.19" } m

seg-c1d04452ee8f = { "0.111" } m

seg-b1dccfc14bb2 = { "45.00" } dB-Hz

seg-467afbc3965e = { "45.0" } dB

seg-63fc45ce7ef9 = { "2492.028" } MHz, BPSK({ "5" })

seg-d4b8b8837709 = { "3.24" } m (×{ "0.229" })

seg-271acd87a8d6 = +{ "6.41" } dB

seg-0f38ea614b7f = { "0.185" } m

seg-c531dc11c01d = { "38.59" } dB-Hz

seg-6edbdabf77cb = { "0.388" } m

seg-b1c384a78d8c = { "41.7" } dB

seg-d13c29401059 = { "5020" } MHz, BPSK({ "10" })

seg-7563cf0f3ebb = { "0.80" } m (×{ "0.056" })

seg-fa10d26d0f8e = +{ "12.49" } dB

seg-9f6390cc903b = { "32.51" } dB-Hz

seg-d04fb147c95f = { "0.465" } m

seg-e825ae4d1080 = { "43.4" } dB

seg-2f20b409a3df = { "5100" } MHz, BPSK({ "50" })

seg-6f22870202af = { "0.77" } m (×{ "0.055" })

seg-ad13cdf3955f = +{ "12.63" } dB

seg-da4b72e53c18 = { "0.022" } m

seg-07ba1b6b9728 = { "32.37" } dB-Hz

seg-e96dfdc0d92f = { "0.093" } m

seg-04a27fee9486 = { "50.3" } dB

seg-edcaed830e15 = このトレードオフは両面があります。等しい C/N₀ では、測距精度はチップレートと帯域で決まります（広帯域の C は L より五倍細かく測距できます）。放射電力が等しい場合は、自由空間損失が高い帯域に全面的に不利に働きます：C バンドは C/N₀ が { "12.5" } dB 下がり、測距は L より四倍悪くなります。UHF は { "8.2" } dB 有利ですが、電離圏遅延は { "6.6" } 倍になります。広帯域の C は、帯域幅によって精度を取り戻します。これらは代表的な設計と等方性アンテナに基づいており、C バンドで指向性のあるユーザーアンテナを使うと、等 EIRP の列が変わります。

seg-9bb6fa0e7a95 = Xona Pulsar

seg-d71e8de9cdda = <c1/>：公表されている最小受信電力で、{ "290" } K のアンテナと { "2" } dB の雑音指数を想定（雑音フロア −{ "201.98" } dBW/Hz）：

seg-4cf70433cc54 = 基準 C/N₀

seg-2a22ffc83e00 = { "53.78" } dB-Hz

seg-8f274ed7feff = { "57.08" } dB-Hz

seg-6be7e20ca92f = 測距精度（{ "0.5" } チップ、コヒーレント、{ "1" } Hz）

seg-60218177538e = { "0.402" } m

seg-e5ccbfea146d = { "0.028" } m

seg-b5a638da9ee1 = 衛星ドップラーの最大値、{ "1080" } km

seg-6917f2712acf = { "33.2" } kHz

seg-895ac83e4a5b = { "24.8" } kHz

seg-b4c4179a0363 = ドップラー × 符号ビン（{ "1" } ms、{ "0.5" } チップ）

seg-bed6ba024afe = 符号並列の平均捕捉時間

seg-93ffb02c7c50 = { "0.15" } s

seg-3671bc5f2ace = { "0.37" } s

seg-7e4c190cb4ab = X5 は { "1190.51625" } MHz にあり、Galileo E5 帯域の内側です：その SSC は、Galileo E5a と GPS L5 に対して −{ "91.2" } dB/Hz、E5b に対して −{ "103.2" } dB/Hz、AltBOC 信号に対して −{ "86.2" } dB/Hz で、最小電力の X5 衛星一機が GNSS 受信機の雑音密度を { "0.0001" } dB から { "0.005" } dB 引き上げます。X1 のドップラー { "33.2" } kHz は、論文が報告する { "32" } kHz から { "34" } kHz の範囲内です（下の VALIDATED のドップラー行）。

seg-661eefb1f346 = マルチバンドスペクトル

seg-0a8bbe2921fd = <c1/> 種別の <c2/> は、名前付きの五つの GNSS 帯域（<c3/>、<c4/>、<c5/>、<c6/>、<c7/>）のほかに、次のものを受け付けます：

seg-63bd7d8a192d = <c1/>：プリセット設計。全成分を描画し、送信帯域幅に帯域制限し、プリセットの基準電力または <c2/> で受信します。C/N₀ と J/S は追尾成分（レポートでは <c3/>）を指します。

seg-603a2b97e621 = <c1/> に <c2/> と <c3/> を組み合わせたもの：任意のカスタム帯域。

seg-b1c30f5d69cf = <c1/> は、同じタイムラインとカラースケールで他の周波数範囲のウォーターフォールを追加し、<c2/>（バラージ）ジャマーが CW、狭帯域、チャープ、整合ノイズに加わります。通常の帯域はこれまでとまったく同じに動作します：同梱の <c3/> の例は、L1 C/A について公称 { "43.48" } dB-Hz、最小 { "3.23" } dB-Hz のままです（<c4/> で固定）。

seg-35151477cbc2 = <c1/>（{ "60" } s、一秒につき一行）：

seg-47408d30d095 = 公称 C/N₀

seg-e618666a44d8 = 自身のジャマーの後

seg-f75d3804cfe8 = ジャマー

seg-5751b2520829 = generic-uhf（{ "465" } MHz）

seg-995748f9c74c = { "49.41" } dB-Hz

seg-a582f1a22a07 = { "10" } s 以降 { "34.38" } dB-Hz

seg-23570b8c7403 = 搬送波上の CW、−{ "120" } dBW

seg-5393b075ff7f = { "43.48" } dB-Hz

seg-2e935ea7b90e = { "20" } s 以降 { "3.38" } dB-Hz（ロスト）

seg-52256ba98a99 = { "16" } MHz チャープ、{ "100" } m で { "50" } mW

seg-4321ccaeeca5 = { "46.73" } dB-Hz

seg-71abaef6924e = { "30" } s 以降 { "38.51" } dB-Hz

seg-45441a20f061 = { "1185" } MHz で { "40" } MHz のバラージ、−{ "118" } dBW

seg-59fd1427d61b = { "54.51" } dB-Hz

seg-430461899d82 = { "30" } s 以降 { "46.29" } dB-Hz

seg-4bcace842ce1 = 同じバラージ

seg-472da83fd67a = generic-s（{ "2492.028" } MHz）

seg-0f47178201ca = { "49.23" } dB-Hz

seg-0f0cad45f636 = { "40" } s 以降 { "41.69" } dB-Hz

seg-d04f42bc0567 = { "2" } MHz のノイズ、−{ "128" } dBW

seg-372655e7c722 = generic-c-band-leo（{ "5020" } MHz）

seg-f8e6beeceedd = { "47.41" } dB-Hz

seg-b27c4bc24059 = { "50" } s 以降 { "40.35" } dB-Hz

seg-ab6304cf6aec = 整合ノイズ、−{ "124" } dBW

seg-1f8a742cb215 = 各ジャマーは自身の帯域にのみ作用します。テストでは、自身のジャマーが始まるまで、他のすべての帯域を公称 C/N₀ に保ちます。

seg-01c63dd5d11b = 設計の使われ方

seg-74f85b484b08 = 設計は、帯域が設計を名前で指定できる場所ならどこでも、名前で参照されます：

seg-4a7aca809ec3 = <c1/> 帯域（<c2/>、上記）：<c3/>、<c4/>、および <c5/> と <c6/> のキャンペーン。

seg-1ee84efd74b3 = <c1/> 帯域（<c2/>）：帯域は設計の中心周波数（<c3/> を指定した場合を除く）、送信帯域幅、追尾チップレートを引き継ぎ、EIRP を電力の取り分に応じて各成分に配分し、すべてのエポックで追尾成分の C/N₀ と帯域制限付き符号追尾ジッターを報告します（<a1>LEO-PASS.md</a1>）。

seg-33732550ba94 = <c1/> 種別。設計の電力配分とチップレートをパスに、搬送波とチップレートを融合解に渡します（<c2/>、<c3/>、<a1>LEO-PNT.md</a1>）。

seg-625f50ac3189 = ワークショップのパラメーター

seg-9d50778efa0a = <c1/> は、{ "2026" } 年の ESA NAVISP LEO-PNT ワークショップで発表された Celeste IOD の周波数帯域と「Classical Pilot」信号構成 #1 を保持し、一つの設計を、そこで示された実測スペクトルと照合する形状チェックを含みます。これは Celeste IOD プリセットのファイルの一つです（ほかに <c2/> とその他の <c3/> があります）。Celeste の信号仕様は公開されていません。成分には前提（電力配分、符号長、FDMA オフセット、変調が発表されなかった帯域に対する代表的な変調）が付いています。形状チェックは MODELLED の整合性です：形状を比較するものであり、校正されたレベルを比較するものではありません。

seg-6e259f57af91 = これはプリセットのほかのファイルとともに公開されません：<c1/> と <c2/> のファイルを削除してください。シナリオはコンパイルに組み込まれません。コマンドラインインターフェースはこれをリポジトリ専用のシナリオとして一覧に示し（<c3/> は、出力せずに名前を挙げて説明します）、テストはその <c4/> を拒否します。ほかのすべてのシナリオ、テスト、オラクルは、これがなくても動作します。これを読み込むテストは、ファイルがない場合は注記付きで合格し、README のシナリオファイル数にはこれも含まれたままです。

seg-53a7343c076e = 主張

seg-6e0de0f2b25f = 帯域内の BPSK 電力（主ローブに { "90.3" } %）、教科書的なコヒーレント形・非コヒーレント形およびその Gabor 限界に帰着する帯域制限付きアーリー・レイトジッター、BPSK の自己 SSC 2/({ "3" } R_c)

seg-e35f7c20a976 = Kaplan & Hegarty、Betz & Kolodziejski { "2009" }、Betz { "2001" }、Abramowitz & Stegun Table { "5.1" }

seg-0ceb71e558f6 = 帯域制限付き Gabor 帯域幅の閉形式、ゼロでないオフセットでのオフセット BPSK の SSC、AltBOC の単位面積（いずれも上の行に含まれ、相互チェックとして扱います）

seg-b0552001e519 = 内部整合性

seg-af6cff634177 = ここで導出し、数値積分と照合

seg-6b74bc7777c7 = LEO ドップラーの最大値

seg-f4f4ee11749d = Xona Pulsar X1 { "32" } kHz から { "34" } kHz（arXiv { "2509.19551" }）；Iridium ±{ "36" } kHz（RNTF）

seg-08e5ec9a31a0 = <c1/> の設計、捕捉、互換性、ジャマー耐性、トレードオフ、形状チェック

seg-64f232587c5f = 外部の参照と照合して確認済みの閉形式、検波器の恒等式 P_d({ "0" }) = P_fa、Holmes の平均時間、スペクトル種別自身の SSC 連鎖

seg-a456645f97aa = マルチバンドスペクトル

seg-868432ccfa09 = 変更のないスペクトルおよびジャミングの連鎖への帰着

seg-430edd66bda0 = モデル化していないもの

seg-d3bba3714684 = EFQPSK、符号シフトキーイング、OFDM の厳密なスペクトル。

seg-53a727d317ae = 拡散符号のライン構造と多元接続の相互相関。

seg-08e229ae97e9 = 理想的な矩形フィルタを超える送受信フィルタ：帯域外放射はありません。

seg-b1fe4ce62e6a = マルチパス、量子化、自動利得制御。

seg-5d2af0802400 = ドップラーの限界における地球の自転（距離変化率で最大約 { "0.46" } km/s）。

seg-5e5e1124fbbb = 一次を超える電離圏遅延、および LEO 衛星の上と下にある電子数の分配：斜め方向の TEC は入力です。

seg-8c0d738304ab = 大気、降雨、偏波による損失。

seg-1fc440f042cf = マルチドウェル捕捉のロジック。

seg-090a6ecf879f = 衛星ごとの数を超える集合的な干渉。

seg-c4b2a79ee33d = J. W. Betz and K. R. Kolodziejski, "Generalized Theory of Code Tracking with an Early-Late Discriminator, Part I," <em>IEEE (Institute of Electrical and Electronics Engineers) Transactions on Aerospace and Electronic Systems</em> { "45" }({ "4" }), { "2009" }.

seg-52ad2f21daf4 = J. W. Betz, "Binary Offset Carrier Modulations for Radionavigation," <em>NAVIGATION</em> { "48" }({ "4" }),

seg-aeeea70a0258 = E. D. Kaplan and C. J. Hegarty (eds.), <em>Understanding GPS/GNSS</em>, 3rd ed., Artech House,

seg-343397c21357 = J. K. Holmes, <em>Coherent Spread Spectrum Systems</em>, Wiley, { "1982" }.

seg-34af310a980b = M. Abramowitz and I. A. Stegun, <em>Handbook of Mathematical Functions</em>, { "1964" }, §{ "5.2" } and Table { "5.1" }.

seg-45606af6bda2 = Galileo Open Service Signal-in-Space Interface Control Document; IS-GPS-200; IS-GPS-705.

seg-960fc01f0a62 = Leclère, Marathe and Reid, Institute of Navigation (ION) GNSS+ { "2025" }, <a1>https://arxiv.org/abs/2509.19551</a1>.

seg-70efdc604ab9 = Resilient Navigation and Timing Foundation, <em>Recent PNT Improvements and Test Results Based on Low Earth Orbit Satellites</em>, <a1>https://rntfnd.org/wp-content/uploads/Recent-PNT-Improvements-and-Test-Results-Based-on-Low-Earth-Orbit-Satellites.pdf</a1>.

seg-72490fa16fd2 = Kozhaya, Saroufim and Kassas, <em>NAVIGATION</em> { "72" }({ "1" }), { "2025" }, <a1>https://navi.ion.org/content/72/1/navi.685</a1>.

seg-00cfb54b28c0 = CentiSpace: <a1>https://pmc.ncbi.nlm.nih.gov/articles/PMC10301026/</a1>.

seg-4d954d28b661 = ESA Celeste IOD facts: <a1>https://www.esa.int/Applications/Satellite_navigation/Celeste/Celeste_IOD_-_Facts_and_figures</a1>.

seg-d43b8255ba58 = ITU Radio Regulations: <a1>https://www.itu.int/pub/R-REG-RR</a1>.

seg-3a9fe081eb89 = openRECEIVER, <em>LEO-PNT Signals: Inside CELESTE's Four Bands</em>, { "1" } August { "2026" }（<c1/> の { "465" } MHz UHF 搬送波の公開情報源）：<s1>https://open-receiver.com/blogs/leo-pnt-signals-celeste/</s1>。このページはサイトから削除されました（HTTP { "404" }、2026-09-29 の時点でブログの索引からも消えています）。検索エンジンには、そのタイトルでまだ表示されます。

seg-18b16c83dd7c = <s1>前へ</s1>LEO の測位・航法・時刻

seg-50fe3f8ae7ec = <s1>次へ</s1>LEO パスとリンクバジェット
