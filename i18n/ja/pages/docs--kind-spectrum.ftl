# docs--kind-spectrum: translations (ja)

seg-ea1678eb9e84 = エンジンが scenarios/l-band-waterfall-jamming.toml（種別 spectrum）に対して出力するグラフ

seg-ce0afea7b030 = <b>VALIDATED</b> GPS L1 C/A と L2C（BPSK({ "1" })）、GPS L5 と Galileo E5a（BPSK({ "10" })）、sine-BOC({ "1,1" })、Galileo E1 MBOC(6,1,1/11)（navsignal::Modulation::psd に MBOC 版を追加）の単位面積あたり電力スペクトル密度、数値的に求めたヌル点、および

seg-7e315c5675d0 = <b>MODELLED</b> <c1/> 種別：L バンドの電力スペクトル密度を周波数×時間のグリッドにしたもの（熱雑音フロア k T_sys（T_sys = T_ant + { "290" } K (F - { "1" })）、インターフェース仕様上の最小受信電力にある各信号、そして連続波、狭帯域

seg-7871f9f54ef4 = <b>VALIDATED</b> sigmf：Signal Metadata Format 記録の読み書き（コアの global、captures、annotations フィールドを持つ JSON の .sigmf-meta、および cf32_le、ci16_le、ci8 形式の生 .sigmf-data。整数デコーダーは realdata::iqif::load_iq と共有）、すべて s

seg-4e35cc861b15 = <b>VALIDATED</b> GPS L1 C/A と L2C（BPSK({ "1" })）、GPS L5 と Galileo E5a（BPSK({ "10" })）、sine-BOC({ "1,1" })、Galileo E1 MBOC(6,1,1/11)（navsignal::M。オラクル（ExternalDataset）：公表されている教科書の値：BPSK(n) のメインローブはヌルからヌルまで 2n x { "1.023" } MHz、耐ジャミング係数は狭帯域（CW）ジャマーで Q = { "1" }、C/A に整合したスペクトル拡散ジャマーで Q = { "1.5" }（Kaplan & Hegarty, Understanding GPS/GNSS, 第3版, 第 { "9.4" } 節）。BOC(m,n) のメインローブは中心が ±m x { "1.023" } MHz（Betz, Binary Offset Carrier Modulations for Radionavigation, NAVIGATION { "48" }({ "4" }), { "2001" }）。

seg-287de49e90a8 = <b>MODELLED</b> <c1/> 種別：L バンドの電力スペクトル密度を周波数×時間のグリッドにしたもの（熱雑音フロア k T_sys（T_sys = T_ant + { "290" } K (F - { "1" })）、各信号の。オラクル（InternalConsistency）：既存の <c2/> 種別の耐ジャミング方程式とリンクバジェットへの帰着（同じコードを同じ入力で呼び出す）、および k T0 F 雑音フロアの閉形式。下層にある信号スペクトルは、上の行で独立した外部の参照と照合して確認済みのものです。ジャマー電力、タイムライン、フロントエンド帯域幅はシナリオの入力であり、スペクトルは連続的（拡散符号のラインはなし）で、自動利得制御、ブランキング、アンテナパターンはジャ

seg-4eca77cc59c4 = <b>VALIDATED</b> sigmf：Signal Metadata Format 記録の読み書き（コアの global、captures、annotations フィールドを持つ JSON の .sigmf-meta、および cf32_le、ci1。オラクル（ExternalDataset）：scipy { "1.18.1" } の scipy.signal.welch（BSD-3-Clause）。同じ周期ハン窓、オーバーラップ、密度スケーリング、デトレンドなし、両側平均で、{ "27" } ケースにわたってすべてのビンが相対 { "1e-12" } 以内（観測値 { "6.0e-14" }）で一致し、セグメント数は scipy 自身のスペクトログラムから取っています。sigmf-python { "1.13.0" }（LGPL-3.0、ツールとして実行）は、サードパーティ製の記録を五件（cf32_le、ci16_le、ci8、注釈付きの二つのキャプチャ、非ゼロの fir

seg-0cbbe567f1c8 = 拡散符号のライン構造（例：C/A の { "1" } kHz のライン）：トーンは滑らかな包絡線に対して採点されます（結果 <c1/>）

seg-2efdae3f5764 = 自動利得制御、量子化、パルスブランキング、ノッチフィルタリング（結果 <c1/>）

seg-f3e58705c9a2 = 一つの利得値を超える、ジャマー方向への受信アンテナパターン（結果 <c1/>）

seg-c0d379cb1ab3 = 一つのバンド内の衛星間の、システム内の多元接続干渉（結果 <c1/>）

seg-83f414112e45 = GLONASS G1/G2、BeiDou B1/B2、Galileo E6（結果 <c1/>）

seg-249d8a46f95a = 設計した信号の送信帯域幅外の放射：スペクトルはそこで打ち切られるため、隣接バンドへの帯域外放射は到達しません（結果 <c1/>）

seg-cc83c047f02a = ループ帯域幅に匹敵する掃引レートでのチャープがループに与える影響：その C/N0 は行平均のスペクトルを使います（結果 <c1/>）

seg-7155706bc289 = MODELLED：閉形式の信号スペクトル（教科書にあるメインローブ幅とスペクトル分離係数に対して VALIDATED）、ジャマースペクトル、kT 雑音フロアから構築した L バンドの電力スペクトル密度を、スペクトル分離係数によって J/S と実効 C/N0 に換算したもの。ジャマー電力、タイムライン、フロントエンド帯域幅は測定値ではなく、シナリオの入力です。（結果 <c1/>）

seg-95879767c438 = トピックページ：<a1>LEO-SIGNAL.md</a1>

seg-ce69d8d2d9d1 = <s1>前へ</s1>space-weather

seg-ac2c9c25fbb6 = <s1>次へ</s1>spoof-detect
