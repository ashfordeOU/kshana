# docs--kind-leo-signal: translations (ja)

seg-ae15d15bf151 = トピックページ：<a1>LEO-PASS.md</a1>

seg-59b976838ef1 = <b>VALIDATED</b> navsignal：正弦積分（sine_integral）、二重側波帯内の BPSK-R の電力割合の閉形式（bpsk_power_in_band_closed_form）、バンド。オラクル（ExternalDataset）：外部から固定した値：メインローブ電力 { "90.3" } パーセント、明示した動作点でのコヒーレント early-late ジッター、正弦積分の表の値、およびゼロオフセットでの BPSK 自己スペクトル分離係数 2/({ "3" } R_c)。内部のクロスチェックのみで、外部での検証ではないもの：帯域制限付き BPSK のガボール帯域幅の閉形式とその漸近線、および非ゼロオフセットでのオフセット BPSK スペクトル分離係数。いずれも

seg-faf2775f3003 = <b>MODELLED</b> <c1/> の種別：パラメーター化した信号設計（バンド、送信帯域幅、ITU 割り当て、BPSK(n)、BOC(m,n)、MB を持つ捕捉・データ・パイロット成分。オラクル（InternalConsistency）：上の 二行の検証済みの閉形式、二乗検波の誤警報恒等式 P_d(snr = { "0" }) = P_fa と Holmes の平均捕捉時間、およびスペクトル種別自身の SSC チェーン（同じ Jammer::ssc コード）への帰着。設計そのものは入力です。REPRESENTATIVE または WORKSHOP と記されたプリセットは公表された仕様ではなく、拡張 Feher QPSK、コードシフトキーイング、OFDM のスペクトルは近似であり、形状

seg-051999733048 = ソース：<c1/>

seg-16ae2a08d3c8 = <c1/>（シナリオ種別）

seg-97b8d07150d4 = LEO-PNT 信号設計：任意のシステム、バンド、構造に対応する、パラメーター化した低軌道（LEO）の測位・航法・時刻（PNT）信号。SIGNAL は、バンド（中心周波数、送信帯域幅、ITU 割り当て RNSS/RDSS/MSS/EESS/non-RNSS/other）と、成分（捕捉、データ、パイロット。任意の部分集合）からなり、各成分は変調（小数の n を許す BPSK(n)、BOC(m,n)、MBOC({ "6,1" },p)、または平坦な OFDM 風のバンド）、電力配分、任意の FDMA サブキャリアオフセット、コード長、データレートを持ちます。信号は、コンパイル済みの公開プリセットファイル（xona-pulsar、iridium-stl、starlink-soo、centispace、generic-c-band、generic-bands。それぞれ出典 URL を持ち、未公表の値はすべて REPRESENTATIVE と記されます）から得るか、インラインで記述します。信号ごと：帯域制限付きの電力スペクトル密度と、送信帯域が通す各成分の電力の割合（BPSK の閉形式を数値と並べて）、RMS（ガボール）帯域幅、C/N0 と early-late 間隔に対するディレイロックループのコード追跡熱雑音ジッター（Betz & Kolodziejski { "2009" } の帯域制限付きコヒーレント（または非コヒーレント）early-late 式から、帯域無制限の教科書的な形と、間隔が消える極限のガボール限界を添えて）、メートルでの測距精度、捕捉の探索空間（軌道の最大ドップラーと発振器およびユーザーの項から求めるドップラービン、にコードビンを掛けたもの）、二乗検波の検出確率と、直列およびコード並列の平均捕捉時間、その信号から GPS L1 C/A、Galileo E1、GPS L5、Galileo E5a、E5b、E5 AltBOC へのスペクトル分離係数と、それぞれからその信号への係数および C/N0 の劣化、そして追跡成分が許容する CW、広帯域、整合の J/S（スペクトル種別自身の SSC の仕組みから）。BAND TRADE：一次の電離圏遅延（{ "40.3" } TEC/f^{ "2" }）、自由空間損失、等しい C/N0 と等しい EIRP での測距精度、ジャマー耐性。任意の SHAPE CHECKS は、設計のスペクトルを、記述された測定と照合します（MODELLED の整合性）。VALIDATED：BPSK のバンド内電力（メインローブに { "90.3" } %）とガボール帯域幅の閉形式、教科書的なコヒーレント early-late 形とそのガボール限界に帰着する帯域制限付きジッター、オフセット BPSK スペクトル分離係数とその Parseval の閉形式との比較、AltBOC スペクトルの単位面積、および最大 LEO ドップラーと公表された Xona Pulsar（32-34 kHz）と Iridium（{ "36" } kHz）の数値との比較。MODELLED：すべての設計、電力配分、C/N0、ジャマーレベル。EFQPSK、CSK、OFDM のスペクトルは近似です。

seg-37e5fdff9d4d = <c1/> の 一回の実行の要約：シナリオ leo-signal | 信号 { "5" } 件 | ノイズフロア -202.0 dBW/Hz | 最良の測距 generic-c-wide { "0.022" } m、{ "45.0" } dB-Hz にて

seg-b538d3ff9fdb = 任意フィールド：<c1/>、<c2/>、<c3/>、<c4/>、<c5/>、<c6/>、<c7/>、<c8/>

seg-6aaf62f55e65 = 例 <c1/> では、とりわけ次を設定しています：

seg-9fd02351d844 = ms

seg-05e8854de548 = chip

seg-d12bc1d2b815 = コヒーレント

seg-0f29946fe4fb = 結果ラベル（エンジンによる）：MODELLED：送信帯域幅に帯域制限した、パラメーター化した低軌道（LEO）の測位・航法・時刻（PNT）信号設計。その基盤となる閉形式は VALIDATED です（BPSK のバンド内電力とガボール帯域幅、教科書的な

seg-8bf45b6989d1 = scenarios/leo-band-trade.toml（種別 leo-signal）についてエンジンが書き出すグラフ

seg-58413589a025 = MODELLED { "2" } · VALIDATED { "2" }：この種別を挙げている<a1>検証マトリクス</a1>の行。

seg-0c30354c18f6 = <b>VALIDATED</b> navsignal：正弦積分（sine_integral）、二重側波帯内の BPSK-R の電力割合の閉形式（bpsk_power_in_band_closed_form）、帯域制限付き BPSK のガボール帯域幅の閉形式（bpsk_gabor_bandwidth_closed_form_hz

seg-09cb975b430d = <b>VALIDATED</b> leo_signal::max_doppler_hz：円軌道について、仰角マスクでの真上通過における衛星の最大ドップラー、v R_E cos(el) / (R_E + h) に f / c を掛けたもの。各プリセット自身の搬送波と軌道高度から求めます。<c1/> の種別はさらに o

seg-e0a4f53c5a96 = <b>MODELLED</b> <c1/> の種別：パラメーター化した信号設計（バンド、送信帯域幅、ITU 割り当て、BPSK(n)、BOC(m,n)、MBOC または平坦なスペクトルを持つ捕捉・データ・パイロット成分、電力配分、FDMA サブキャリア、コード長、データレート テスト：<a1>leo_signal_reference.rs</a1>。

seg-9ca82c79430e = <b>MODELLED</b> L バンドを超えて拡張した <c1/> の種別：プリセットの信号設計（すべての成分を描画し、送信帯域幅に帯域制限し、C/N0 と J/S は追跡成分を基準とする）として、またはカスタムの搬送波と変調として与えるバンド テスト：<a1>leo_signal_reference.rs</a1>。

seg-eb0a671fe1da = <b>VALIDATED</b> leo_signal::max_doppler_hz：円軌道について、仰角マスクでの真上通過における衛星の最大ドップラー、v R_E cos(el) / (R_E + h) に f / c を掛けたもの、。オラクル（ExternalDataset）：公表された数値：Xona Pulsar X1 の最大ドップラー { "32" } から { "34" } kHz（Leclère, Marathe & Reid, ION GNSS+ { "2025" }, <a1>https://arxiv.org/abs/2509.19551</a1>）、Iridium のドップラーは最大 +/-36 kHz（Resilient Navigation and Timing Foundation, Recent PNT Improvements and Test Results Based on Low Earth Orbit Satellites）。地球の自転は含めておらず、これにより数値は最大で約 { "2.3" } kHz 動きますが、公表された両方の数値は、自転なしでも満たされます。

seg-1ab79cdbd269 = 拡張 Feher QPSK、コードシフトキーイング、OFDM の正確なスペクトル：各プリセットが明記するとおり、矩形チップの BPSK 包絡線または平坦なバンドで代用しています（結果 <c1/>）

seg-0561c3ed88fb = 拡散コードのライン構造と、コード間の多元接続の相互相関（結果 <c1/>）

seg-8b4df054a7b3 = 送信帯域幅での理想的なブリックウォールを超える送信・受信フィルター：帯域外輻射はなく、フィルターの群遅延もありません（結果 <c1/>）

seg-ad5f7cc4a439 = マルチパス、受信機の量子化、自動利得制御（結果 <c1/>）

seg-e38fc1a121ab = ドップラーの上限における地球の自転（赤道で距離変化率にして最大約 { "0.46" } km/s）（結果 <c1/>）

seg-32a132809a9b = 一次を超える電離圏遅延と、LEO 衛星の上下の電子数の分割：斜め TEC は入力です（結果 <c1/>）

seg-8189e06f4a56 = 大気、降雨、偏波による損失：自由空間損失のみを比較しています（C バンドでは降雨が影響します）（結果 <c1/>）

seg-445cecb7370c = 誤警報ペナルティを伴う単一ドウェルを超える捕捉：複数ドウェルの検証ロジックはなく、コード位相の事前分布は一様で、最悪ケースのまたぎを想定しています（結果 <c1/>）

seg-8eefe4197d7f = <s1>前へ</s1>leo-pvt

seg-60423e1ed0ca = <s1>次へ</s1>link-budget

seg-a3697ad561db = Hz

seg-1918189ac2bf = ppm

seg-49964654d5f4 = エンジン v{ $version } のシナリオ種別で、ファミリーは<a1>低軌道航法</a1>です。助言のみ：研究・エンジニアリング用ツールによる解析出力であり、型式承認を受けた航法装置ではなく、人命安全（safety-of-life）サービスでもありません。ここにあるラベルはすべてエンジンまたは検証マトリクスによるものです；検証マトリクスが別途示さない限り、種別は MODELLED です（ラベルの獲得方法：README の Evidence の節）。

seg-c5478f572d21 = ファミリーページ：<a1>低軌道航法</a1>
