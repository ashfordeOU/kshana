# docs--kind-aocs: translations (ja)

seg-99ef7c1d552c = エンジンv{ $version }のシナリオの種類。ファミリー：<a1>ミッション解析、リンク、宇宙運用</a1>。助言のみ：研究・エンジニアリング用ツールによる解析出力であり、型式承認を受けた航法装置ではなく、人命安全（safety-of-life）サービスでもありません。ここにあるラベルはすべてエンジンまたは検証マトリクスによるものです。検証マトリクスに別の記載がない限り、シナリオの種類はMODELLEDです（ラベルの付与のされ方：READMEのEvidenceセクション）。

seg-8f1e7d3f5a07 = ファミリーページ：<a1>ミッション解析、リンク、宇宙運用</a1>

seg-5cd8b3d8c098 = ソース：<c1/>

seg-7f2ade997df5 = <c1/>（シナリオの種類）

seg-7eff466eb018 = 宇宙機の姿勢制御：三つ以上の釣り合いのとれたリアクションホイールを持つ剛体ハブの慣性指向スルーを、MRPフィードバック（L = -K sigma - P omega）で行い、最小ノルムのホイールトルクを各モーターの上限でクリップし、RK4とゼロ次ホールドで計算します。オプションで、シミュレートしたジャイロ（角度とレートのランダムウォーク）とスタートラッカーから、乗算型EKFによるループを閉じます。整定時間、最終および最大の指向誤差、最大のホイール速度とトルク、飽和した割合、角運動量のドリフトを報告し、推定器を使う場合はその姿勢誤差とNEESも報告します。真の状態のループはBasilisk { "2.9.1" }に対してVALIDATEDであり、推定器はMODELLEDです。

seg-a499721d08b1 = <c1/>の 一回の実行は、次のように要約されます：aocs: { "4" } wheels, { "600" } s slew from { "82.06" } deg -> settles below { "0.1" } deg at { "481.0" } s | final { "2.37e-2" } deg | peak wheel { "1797" } rpm | true-state loop

seg-2ad4d3f07a6a = 必須フィールド：<c1/>、<c2/>、<c3/>、<c4/>、<c5/>

seg-ed0c5c6266d9 = 任意フィールド：<c1/>、<c2/>、<c3/>、<c4/>、<c5/>、<c6/>

seg-a09eb69b36d7 = 例の<c1/>が設定している項目（一部）：

seg-8b51cfcf5bd5 = N m

seg-6876b0214e4c = N m s

seg-8e4dea0df19e = kg m^{ "2" }

seg-51362910dcb7 = 同梱のシナリオのうち{ "2" }個がこの種類を使用しています。その他は<a1><c1/></a1>にあります。

seg-b054c73f22e5 = 値なし

seg-6e22c97374b0 = 結果ラベル（エンジンによるもの）：制御則とホイールダイナミクスはVALIDATED（真の状態のループでBasilisk { "2.9.1" }と照合）。この実行の入力はシナリオ自身のものです — MRPフィードバックによるリアクションホイール姿勢制御、慣性指向、センサーノイズなし、摩擦なし

seg-08c624d5324d = scenarios/aocs-slew.toml（種類aocs）についてエンジンが書き出すグラフ

seg-67fb8ac75f36 = MODELLED { "1" } · VALIDATED { "1" }：この種類を挙げている<a1>検証マトリクス</a1>の行。

seg-d69a588facf1 = <b>VALIDATED</b>三つ以上の釣り合いのとれたリアクションホイールを持つ剛体ハブの慣性指向姿勢制御：MRPフィードバック則L_r = -K sigma_BR - P omega_BR（Schaub and Junkins）、G_s u = -L_rによる最小ノルムのホイールモータートルクを各ホイールのlでクリップ。テスト：<a1>aocs_basilisk_oracle.rs</a1>。

seg-7bc495b05d9a = <b>MODELLED</b> Lefferts-Markley-Shusterの乗算型EKF：機体座標系の姿勢誤差とジャイロバイアスの状態、ジャイロレートからバイアス推定値を引いた値とFarrenkopfの離散プロセスノイズ（角度とレートのランダムウォーク）による伝播、スタートラッカーによる更新

seg-7e3e0dcc936f = <b>VALIDATED</b>三つ以上の釣り合いのとれたリアクションホイールを持つ剛体ハブの慣性指向姿勢制御：MRPフィードバック則L_r = -K sigma_BR - P omega_BR（Schaub and J。オラクル（ExternalDataset）：Basilisk { "2.9.1" }（AVSLab、ISC。bskのホイール実行は別のツールとして動かし、リンクも同梱もしません）：宇宙機ハブ、reactionWheelStateEffector（BalancedWheels、トルク制限あり）、simpleNav、inertial3D、attTrackingError、mrpFeedback（積分項なし）、rwMotorTorqueをdt = { "0.1" }秒、RK4で動かし、三つのケース（直交する 三つのホイール、四ホイールのピラミッド、飽和する 四ホイールのケース）についてKshana自身の実装と比較します。

seg-d7889856073b = <b>MODELLED</b> Lefferts-Markley-Shusterの乗算型EKF：機体座標系の姿勢誤差とジャイロバイアスの状態、ジャイロレートからバイアス推定値を引いた値とFarre. オラクル（InternalConsistency）：内部整合性：同じセンサーモデルからシミュレートした真値に対するフィルターの正規化推定誤差二乗（モンテカルロのシード全体にわたる）、および姿勢とバイアスの推定値の収束。できていないこと：外部の推定器や飛行データとの比較は行っていません（Basilisk { "2.9.1" }にはMEKFモジュールがありません）。センサーモデルは教科書的なもので、ミスアライメント、スケールファクター、スタートラッカーの視野の影響は含みません。

seg-3b71575e0c23 = 真の状態のループはBasilisk { "2.9.1" }に対してVALIDATEDであり、推定器はMODELLEDです。（種類カタログ（<c1/>））

seg-c7ff0ddbd040 = ジャイロとスタートラッカーによる乗算型EKFの姿勢推定はMODELLEDであり、独立した外部の参照との照合はされていません。自身の閉形式・解析的な恒等式に照らして確認しており、転記や係数の誤りは見つけられますが、外部のオラクルではありません。（検証マトリクス（docs/MODELLED-RATIONALE.md））

seg-cc4e7274d409 = トピックページ：<a1>AOCS.md</a1>

seg-b022bad77259 = <s1>前へ</s1>acm-link

seg-1fb6e680fd4a = <s1>次へ</s1>aperture-duty-cycle
