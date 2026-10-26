# docs--licensing: translations (ja)

seg-a1bee28d1dfd = ソース：<c1/>

seg-b8dd205e82c4 = Kshana は<b>デュアルライセンス</b>です。オープンなエンジンは、オープンライセンス（AGPL-3.0）<b>または</b> Ashforde OÜ の<b>商用ライセンス</b>の<b>どちらか</b>で使用できます。ご自身の使い方に合うほうを選んでください。

seg-5faea0aba960 = この文書は、このモデルを平易な言葉で説明するものです。ガイドであって法的助言ではなく、ライセンス自体を変更するものでもありません。拘束力のある条項は <a1><c1/></a1>（GNU AGPL-3.0）と、Ashforde OÜ と締結する商用契約にあります。両者が食い違う場合は、それらの文書が優先します。

seg-89bd60937f0b = 選択肢 A — オープンソース：GNU AGPL-3.0-only

seg-785200a5419a = 既定の選択肢です。全文は <a1><c1/></a1> にあります。要するに、AGPL では Kshana を無償で使用、研究、改変、再配布できます。ただし次の条件を<b>満たす場合に限ります</b>：

seg-5bc05999ee9d = Kshana またはその派生物を<b>配布</b>する場合は、<b>対応する完全なソース</b>を AGPL の下で入手可能にすること。

seg-5c9136766fdf = <b>改変した</b> Kshana を、ユーザーが<b>ネットワーク経由で</b>利用できるようにする場合（AGPL を特徴づける条項、§{ "13" }）は、<b>それらのユーザー</b>に対し、改変版の対応するソースを AGPL の下で提供すること。

seg-234be920d38f = AGPL は<a1>OSI 承認のオープンソースライセンス</a1>であり、強いコピーレフトです。学術研究、オープンソースプロジェクト、社内での評価や研究、そして自らの派生物をオープンに保つことに異存のない方に適しています。

seg-16c9cc91e4eb = 選択肢 B — 商用ライセンス（Ashforde OÜ 提供）

seg-197bfc5a5166 = AGPL が合わない場合、Ashforde OÜ は同じエンジンを商用条件でライセンスします。次のような場合に適しています：

seg-6de2b04016e5 = 自社のソースを公開せずに、<b>Kshana を独自仕様・クローズドソースの製品に組み込む</b>場合。

seg-e31db28c1e09 = §{ "13" } のソース開示義務<b>なしに</b>、改変した Kshana を基にした<b>ネットワークサービスを提供する</b>場合。

seg-9d3578395a59 = 他のコンポーネントが AGPL にできない大規模システム（例：元請け企業の独自ツールチェーン）に Kshana を統合する場合。または

seg-99d049c650a3 = AGPL が明示的に免責としている保証、補償、サポートの条件を得たい場合。

seg-f68b536b93c0 = 商用ライセンスは、合意した条件のもとで、お客様の利用に対するコピーレフトの義務を取り除きます。<b>連絡先：<a1>contact@ashforde.org</a1>。</b>

seg-55f1a2f687d9 = このようにデュアルライセンスとする理由

seg-42c1ce05ca5c = 目標は、<b>公開で検証できる</b>こと（どのレビュアーもエンジンを実行して監査できること）です。同時に、資金力のある競合が、外部の参照と照合して確認済みのエンジンをフォークして非公開にし、何も還元しない独自仕様の競合製品を出荷することは<b>許しません</b>。AGPL のネットワーク・コピーレフトがこれを実現します：クローズドな派生物やホスト型の派生物は、オープンソースに戻すか、当社から商用ライセンスを受ける必要があります。公開された信頼性と守られた中核を、同時に得られます。

seg-32b1d38914fe = このデュアルライセンスの<b>対象外</b>のもの

seg-27636d757dba = <b>ネイティブの OpenCPN プラグイン</b>（<c1/>）は <b>GPL-3.0-or-later</b> でライセンスされ（そのディレクトリの <c2/> ファイルを参照）、AGPL-3.0 ではなく、商用ライセンスでも提供<b>されません</b>。このプラグインは OpenCPN に読み込まれ、GPL-2.0-or-later のプラグイン API ヘッダーに対してビルドされます。これは OpenCPN プラグインの通常の根拠です。<c3/> のその他の部分（Signal K プラグインと OpenCPN TCP リレー）は AGPL-3.0-only のままです。

seg-f90c983e0ee3 = <b>Kshana Pro</b> とその他の独自オーバーレイは、それぞれ独自の商用条件に基づく<b>別個のクローズドソース</b>製品です。このリポジトリには含まれず、AGPL でも提供されません。

seg-e340445b7f17 = <b>依存ライブラリ</b>は、それぞれ独自の（寛容な）ライセンスを保ちます。商用エディションをきれいに提供できるよう、依存関係ツリーは意図的に寛容なもの（Apache-2.0 / MIT / BSD / ISC / …）に保っています。コピーレフトの依存ライブラリがあると、商用エディションが汚染されてしまうためです。<a1><c1/></a1> を参照してください。

seg-810191f19d4d = <b>Galileo E1 一次メモリ符号</b>（<c1/>、<c2/>；<b>{ "0.36" } 以降は同梱しません</b>：各ユーザーが自身のコピーを用意し、<c3/> または <c4/> / <c5/> で指定して、<c6/> が読み込みます）。これらは、Galileo Open Service Signal-In-Space Interface Control Document（OS SIS ICD）Issue { "2.0" }（{ "2021" } 年一月、© European Union { "2021" }）の Annex C.7 と C.8 にある E1-B と E1-C の一次符号で、PDF の添付ファイルから無改変で抽出したものです（ソース URL、SHA-256、Issue { "1.3" } との照合は <a1><c7/></a1> にあります）。これらは AGPL-3.0 にも商用ライセンスにも<b>含まれず</b>、どちらのライセンスもこれらに対して何も許諾しません。ICD 自体の記述を、Issue { "2.0" } から引用します：

seg-daef032cbe43 = 利用条件 §{ "3" }：「OS SIS ICD に含まれる情報は、その附属書を含め、知的財産権の対象である」。「OS SIS ICD は、ここに定める許可された利用に従い、かつ次の条件の下でのみ、その一部または全部を複製し、または第三者に送付することができる：本「利用条件および免責事項」ならびに Annex G の条項が受諾され、複製または送付される情報とともに、全体を無改変のまま複製して送付されること。著作権表示「© European Union { "2021" }」がどのページからも削除されないこと。」さらに：「IPR の対象である拡散符号を含め、OS SIS ICD に含まれる情報の利用は、Annex G に定める条件の下で許可される。」

seg-0fb25fafd9a2 = Annex G（Issue { "2.0" }；Issue { "2.1" } では Annex H で、文言は同じ）は、「OS SIS ICD の技術データ」に "E1 and E5 Memory Codes" を含めると定義し、"non-exclusive and royalty-free" かつ "non-transferable and non-licensable" である不行使の約束を与えています。網羅的であるとされる §G.3 の一覧は、次のものを対象とします："a) the use of the Technical Data of the OS SIS ICD, including their integration and incorporation into any Products"；"b) the storage of the Technical Data of the OS SIS ICD, provided the source is acknowledged"；"c) the reproduction of the OS SIS ICD, in whole or in part, its distribution and its publication for non-commercial not-for-profit purposes and scale without amending the document or adding any element"；"d) providing links to the EU website where the document is published"。"Products" とは、"making use of the OS Signal" であるソフトウェア、機器、付加価値サービスを指します。さらに次のようにも述べています："The Authorised Person shall not state or imply in any promotional material or elsewhere that the Products were developed by, are used by or for or have been approved or endorsed by the EU"。

seg-8531368368ba = <b>決定（{ "0.36" }）：再配布しない。</b>明示的なオープンライセンスは示されていません。ソフトウェア製品の内部での使用（G.3 a）と、出典を明記した保存（G.3 b）は ICD 自身の条件で対象となっていますが、再配布（G.3 c）は非商用・非営利の目的に限られ、Terms と Annex G を無改変で併せて複製する必要があります。Kshana は商用ライセンスでも提供されるため、これらのファイルはリポジトリとパッケージから削除しました。エンジンは実行時にユーザー自身のコピーを読み込み、それがない場合、Galileo E1 信号は、その用意の仕方を示すエラーを返します。各ユーザーは EU の許諾に直接依拠します。Kshana がそれを引き継ぐことはできません。Kshana は欧州連合によって開発されたものでも、欧州連合に使用されているものでも、欧州連合に承認または推奨されているものでもありません。

seg-e18986aeab7f = <b>商標。</b>「Kshana」とその標章は Ashforde OÜ の商標です。どちらのライセンスも、名称や標章に対する権利を許諾しません。フォークや派生物の配布では、別の名称を使う必要があります。<a1><c1/></a1> を参照してください。

seg-f6b7345c2c60 = コントリビューション

seg-1709eb19c2c5 = コントリビューションは、プロジェクトの受け入れ側のコントリビューター条件に基づいて受け付けます。この条件は、あなたのコントリビューションを AGPL の下でライセンスする<b>とともに</b>、商用ライセンス版に含める権利を Ashforde OÜ に付与するものです（デュアルライセンスが機能し続けるようにするためです）。<a1><c1/></a1> を参照してください。

seg-940c8cce5137 = ご質問

seg-e678f2ecc571 = ライセンスに関するご質問、商用の見積もり、「どちらの選択肢が当社に当てはまるか」のご相談は → <b><a1>contact@ashforde.org</a1></b>。

seg-05d34a27a0ba = <s1>前へ</s1>変更履歴

seg-4f7f660eea0a = <s1>次へ</s1>セキュリティ

seg-2d2b32369c30 = このデュアルライセンスの対象外のもの
