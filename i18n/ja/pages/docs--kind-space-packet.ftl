# docs--kind-space-packet: translations (ja)

seg-2ac27c1e55c0 = オクテット

seg-785f906eb194 = ソース：<c1/>

seg-525499bc01cd = <c1/>（シナリオの種類）

seg-de2448d74c2b = CCSDS 133.0-B スペースパケットプロトコルのフレーミング：合成した TM/TC のパケットストリーム（6オクテットのプライマリヘッダー＋データフィールド）を符号化し、パケットごとのヘッダーのデコード、総オクテット数、符号化とデコードの厳密な往復を報告します。決定論的で厳密なビットレイアウトのフレーミングであり、機関のパケット形式の相互運用層です。適合性の認証ではありません（フラグ以外のセカンダリヘッダー、CRC、セグメンテーションの処理はありません）。

seg-757dec59102b = <c1/> の一回の実行の要約は次のとおりです：space-packet：APID { "100" } の CCSDS-133.0 TM パケット { "4" } 個をフレーミング、合計 { "152" } オクテット、往復は厳密（true）

seg-fd46ce63e6fc = 任意のフィールド：<c1/>、<c2/>、<c3/>、<c4/>

seg-e3235e4d3760 = 例の <c1/> では、とりわけ次を設定しています：

seg-f5bc99396b7d = { "00" } { "64" } { "40" } { "00" } { "00" } 1F

seg-f336ba92871f = 結果ラベル（エンジンによるもの）：CCSDS 133.0-B スペースパケットのプライマリヘッダーのフレーミング — 厳密で決定論的なビットレイアウトであり、符号化とデコードの往復を確認済み。適合性の認証ではありません（フラグ以外のセカンダリヘッダー、CRC、セグメンテーションの処理はありません）

seg-ff1f36904d38 = <b>VALIDATED</b> CCSDS 133.0-B スペースパケットのプライマリヘッダーの符号化/デコード（version/type/sec-hdr/APID/seq-flags/count/data-length）と、フレーミングのシナリオ。テスト：<a1>ccsds_space_packet_reference.rs</a1>。

seg-82c617034322 = <b>VALIDATED</b> プライマリヘッダーに加えた CCSDS 133.0-B-2 スペースパケットの拡張：CCSDS 301.0-B の時間コード（CUC または CDS、明示的または暗黙的な P フィールド）と補助データを持つセカンダリヘッダー、CRC-16 のパケット誤り制御フィールド、の分割。テスト：<a1>space_packet_ext_oracle.rs</a1>。

seg-94f3381476ee = <b>VALIDATED</b> CCSDS 133.0-B スペースパケットのプライマリヘッダーの符号化/デコード（version/type/sec-hdr/APID/seq-flags/count/data-length）と、フレーミングのシナリオ。CLI/バインドから実行可能。オラクル（ExternalDataset）：spacepackets { "0.32.0" }（us-irs/spacepackets-py、R. Mueller、Apache-2.0）— CCSDS 133.0-B-2 の独立したサードパーティ実装。kshana の encode_packet/decode_packet はバイト単位で一致（{ "33" } ケースの6オクテットのプライマリヘッダーと、{ "12" } の完全な符号化パケット）

seg-bca17769398b = <s1>前へ</s1>solar-system

seg-6ef772483f30 = <s1>次へ</s1>space-weather

seg-99ef7c1d552c = エンジンv{ $version }のシナリオの種類。ファミリー：<a1>ミッション解析、リンク、宇宙運用</a1>。助言のみ：研究・エンジニアリング用ツールによる解析出力であり、型式承認を受けた航法装置ではなく、人命安全（safety-of-life）サービスでもありません。ここにあるラベルはすべてエンジンまたは検証マトリクスによるものです。検証マトリクスに別の記載がない限り、シナリオの種類はMODELLEDです（ラベルの付与のされ方：READMEのEvidenceセクション）。

seg-8f1e7d3f5a07 = ファミリーページ：<a1>ミッション解析、リンク、宇宙運用</a1>

seg-3068552e4ab4 = VALIDATED：この種類を挙げている<a1>検証マトリクス</a1>の行。

seg-98151954f217 = false

seg-af1cf9aa9938 = エンジンが scenarios/space-packet.toml（kind space-packet）用に書き出すチャート
