# docs--deployment-targets: translations (ja)

seg-9c1e7fd8f838 = 方法

seg-5ad814c7ef9e = 備考

seg-9d3ee6a5613e = 実行

seg-e8eefc84e748 = ソース：<c1/>

seg-3e1eb98b38df = Kshana が動作する場所と、しない場所

seg-1a203c4736f1 = 会議の場で誰かが約束事として初めて知ることのないよう、文書にした適用範囲の境界です。

seg-d6c92d17a3dd = 略語：CPU、中央演算処理装置。GPU、グラフィックス処理装置。NPU、ニューラル処理装置。FPGA、フィールドプログラマブルゲートアレイ。MCU、マイクロコントローラーユニット。RTOS、リアルタイムオペレーティングシステム。OPS-SAT、欧州宇宙機関の軌道上ソフトウェア実験衛星。PyPI、Python Package Index。MCP、Model Context Protocol。AI、人工知能。JSON、JavaScript Object Notation。

seg-9376bb5b192e = 対象

seg-95e7da118089 = Linux、macOS、Windows のワークステーションとサーバー、x86-64 と 64 ビット ARM

seg-b6ef382a73ef = <c1/> バイナリ、または Rust クレート

seg-b8af20715cea = Linux x86-64、macOS（Apple silicon と Intel）、Windows x86-64 向けのリリースバイナリ。その他のターゲットでは <c1/> がビルドします

seg-3dc7d08f5729 = Python { "3.9" } 以降

seg-b1f1009faa44 = PyPI の <c1/> ホイール（<c2/>）

seg-45b4e1bd8b18 = Linux、macOS、Windows 向けのホイール、x86-64 と 64 ビット ARM

seg-79f04380d254 = MCP クライアント（AI エージェント）

seg-4163955ed77a = <c1/> サーバー：<c2/>、またはコンテナイメージ

seg-c5a32580b7bc = linux/amd64 と linux/arm64 向けのイメージ

seg-ec575e06d439 = ブラウザーと JavaScript ランタイム

seg-a8238abc55bd = npm の WebAssembly パッケージ（<c1/>）

seg-c7789c7f4429 = 同じエンジンを WebAssembly にコンパイルしたもの

seg-488c2b62d246 = 船上の、受信機の隣にある小型コンピューター

seg-69a58e13b706 = <c1/> のリファレンスビルド：ゲート付きの <c2/>。Signal K に公開し、オプトインで OpenCPN にも公開します

seg-df530583c13c = 助言用であり、型式承認を受けた航法装置ではありません。プロジェクトとして船舶上での試験は行っていません。<a1><c1/></a1> を参照

seg-cf83dbb55f99 = Signal K サーバー

seg-88ddbefb95dd = <c1/> のプラグイン

seg-5f436c952149 = 出荷済みで、記録された合成出力に対してユニットテスト済み。npm には公開していません

seg-06ff6eed7e99 = OpenCPN

seg-026115eafe9b = モニターから TCP 経由で送るゲートモードの NMEA { "0183" }

seg-8e101a661cbc = オプトイン。<a1><c1/></a1> を参照

seg-cea294c412f0 = Linux クラスのペイロードコンピューター

seg-bf74da1c1262 = Rust クレートまたはバイナリを、クロスコンパイルして使う

seg-868f121e5909 = OPS-SAT クラスなどのペイロードコンピューター

seg-53c8be810679 = Linux CPU の隣に GPU、NPU、FPGA を持つエッジノード

seg-70b2c22bf453 = Linux CPU 上で

seg-977842cb0f86 = Kshana はアクセラレーターを一切使わず、それらの隣で動作します

seg-3e15446b6efb = 動作しないもの

seg-205144220741 = <b>ベアメタルのフライト用 MCU、または Rust 標準ライブラリのない小型の RTOS。</b>Kshana は全体が <c1/> クレートです。ヒープを確保し、ファイルを読み、JSON を整形し、標準ライブラリの浮動小数点関数を使います。<c2/> ビルドはなく、それを生成する機能もありません。

seg-46ccad7b96e8 = <b>決定：<c1/> のフライトコアは提供しません。</b>それを作ることは、独自の検証負担を伴う別の製品になり、Kshana をフライトソフトウェアに入れることになります。そこでの認定は、それ自体が一つのプログラムであり、私たちにはそこを通る道筋がありません。

seg-63bc696bc66a = 代わりにすること

seg-07fff123aed3 = <b>Kshana は地上またはペイロードコンピューターで実行し、その結果をアップロードしてください。</b><c1/> 種別は、フライトコンピューターが必要とする数値、すなわち測位解の周期、逸脱時刻、ガードを、ちょうど出力します。それらの表は数バイトです。

seg-c2752c281cd3 = <b>閉じた式だけで足りるなら、それを移植してください。</b>ホールドオーバーの逆算は、多項式の分散に対する、短い単調な根探索であり、その式とともに <a1><c1/></a1> に記載されています。これをフライトコードで再実装するのは容易です。Kshana から派生したコードは、Kshana のライセンスのもとにとどまります。

seg-b484e9426ab0 = 同じく対象外

seg-7bcd90c9ef31 = ハードリアルタイムの保証（Kshana はメモリを確保し、最悪実行時間についての主張はしません）、いかなるものについてもフライト認定、そして同期プロトコル、コントローラー、ルーティングスタック。Kshana は、それらのシステムが設計の基準とするタイミングの証拠を提供します。Kshana はそれらのいずれでもありません。

seg-542e51fbb35a = <s1>前へ</s1>JetBrains プラグイン

seg-52a455f4c409 = <s1>次へ</s1>アーキテクチャ
