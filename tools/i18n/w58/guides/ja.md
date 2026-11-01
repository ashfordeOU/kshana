# Guide for 日本語 (ja)

## Terms (English -> rendering; * = keep the English word)
- PNT -> PNT（測位・航法・時刻）
- GNSS -> GNSS（全球測位衛星システム）
- spoofing -> スプーフィング
- jamming -> ジャミング
- interference -> 干渉
- integrity -> インテグリティ（完全性）
- availability -> 可用性
- continuity -> 連続性
- accuracy -> 精度
- precision -> 精密度
- holdover -> ホールドオーバー
- ledger -> 台帳（ledger）
- evidence pack -> エビデンスパック
- pre-registration -> 事前登録
- bar (pass criterion) -> 合格基準
- oracle (independent reference) -> オラクル（独立した参照）
- advisory -> 助言（アドバイザリー）
- supports evidence for -> 〜の証拠を裏付ける（supports evidence for）
- scenario -> シナリオ
- receiver -> 受信機
- clock -> 時計（クロック）
- oscillator -> 発振器
- time error -> 時刻誤差
- ionosphere -> 電離圏
- multipath -> マルチパス
- carrier phase -> 搬送波位相
- pseudorange -> 疑似距離
- Doppler -> ドップラー
- ephemeris -> エフェメリス（軌道暦）
- constellation -> 衛星コンステレーション
- protection level -> 保護レベル
- dilution of precision (DOP) -> DOP（精度低下率）
- ambiguity resolution -> 整数値バイアスの決定（アンビギュイティ解決）
- detection -> 検出
- false alarm -> 誤警報
- missed detection -> 見逃し
- Monte Carlo -> モンテカルロ
- Allan deviation -> アラン偏差
- time transfer -> 時刻比較・時刻伝送
- resilience -> レジリエンス
- orbit determination -> 軌道決定
- cislunar -> 地球・月間空間（シスルナー）
- synthetic data -> 合成データ
- reproducible -> 再現可能
- cross-validation -> クロスバリデーション
- tolerance -> 許容差
- seed -> シード

## Tier and verdict words: stay English capitals. Glosses (for reference only): VALIDATED: 独立した外部のオラクルと一致; MODELLED: 内部で整合しており、その旨を明示; PARTNER: ハードウェアパートナーが所管; MET: 基準を満たした; NOT MET: 基準を満たさず; EXPLORATORY: 探索的：当初の基準を確定させることはできない

## Forbidden as claims about Kshana: 認証済み, 準拠（Kshanaについての主張として）

## Style
- plural_categories: other
- plural_note: One category only: no plural selector is needed; use a counter in the string where English counts (3件, 5台) with a Fluent placeable for the number.
- cases: No grammatical case; particles (が, を, に, の) follow the noun and are written in the string. Do not build sentences by concatenating placeables: put the whole sentence in one message so that particles and word order are correct.
- register: Polite です・ます style in prose, help text and dialogs; noun-ending style (体言止め) for table cells, button labels and headings; no plain だ・である style. Technical terms follow Japanese GNSS usage.
- punctuation: Full-width 、。「」（）：； and ！？ in Japanese running text. Half-width ASCII parentheses and punctuation only when their whole content is Latin or numeric (for example (IEC 61108)). Digits and Latin letters are half-width. No spaces are inserted between Japanese and Latin letters or digits; a half-width space is kept between a number and its unit exactly as in the English source (20 dB-Hz).
- latin_terms: GNSS, PNT, DOP and similar acronyms stay in half-width Latin capitals and are glossed in Japanese once per page on first use (GNSS（全球測位衛星システム）). Tier and verdict words stay in English capitals.

## Advisory sentences (use exactly when an English message embeds the English sentence)
- EN: Advisory: analysis output from a research and engineering tool, not type-approved navigation equipment and not a safety-of-life service.
  ja: 助言のみ：研究・エンジニアリング用ツールによる解析出力であり、型式承認を受けた航法装置ではなく、人命安全（safety-of-life）サービスでもありません。
- EN: Advisory: analysis output from a research and engineering tool, not type-approved navigation equipment and not a safety-of-life service; it must not be the sole basis for any navigation or safety decision.
  ja: 助言のみ：研究・エンジニアリング用ツールによる解析出力であり、型式承認を受けた航法装置ではなく、人命安全（safety-of-life）サービスでもありません。航法または安全に関するいかなる判断の唯一の根拠としても使用してはなりません。
- EN: Advisory: not type-approved navigation equipment.
  ja: 助言のみ：型式承認を受けた航法装置ではありません。
- EN: Advisory software, not type-approved navigation equipment (IEC 61108, IEC 61162): the operator remains responsible for the navigation of the vessel.
  ja: 助言用ソフトウェアであり、型式承認を受けた航法装置（IEC 61108、IEC 61162）ではありません。船舶の航行の責任は引き続き運用者にあります。
- Machine translation notice: 機械翻訳であり、ネイティブスピーカーによる確認は行われていません。英語版が基準です。
