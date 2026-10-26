# docs--licensing: translations (zh-Hans)

seg-a1bee28d1dfd = 来源：<c1/>

seg-b8dd205e82c4 = Kshana 采用<b>双重许可</b>。您可以在<b>开源许可</b>（AGPL-3.0）<b>或</b> Ashforde OÜ 提供的<b>商业许可</b>二者之中任选其一来使用开放引擎。请选择适合您使用方式的一种。

seg-5faea0aba960 = 本文档以通俗语言说明这一模式。它只是指南，不构成法律意见，也不修改许可本身。具有约束力的条款在 <a1><c1/></a1>（GNU AGPL-3.0）以及您与 Ashforde OÜ 签署的任何商业协议中。如两者有冲突，以这些文件为准。

seg-89bd60937f0b = 选项 A：开源，GNU AGPL-3.0-only

seg-785200a5419a = 默认选项。全文见 <a1><c1/></a1>。简言之，AGPL 允许您免费使用、研究、修改和再分发 Kshana，<b>前提是</b>：

seg-5bc05999ee9d = 如果您<b>分发</b> Kshana 或其衍生版本，须依 AGPL 提供<b>完整的对应源代码</b>；并且

seg-5c9136766fdf = 如果您让用户<b>通过网络</b>与<b>修改过的</b> Kshana 交互（AGPL 的特色条款，§{ "13" }），则必须依 AGPL 向<b>这些用户</b>提供您修改版本的对应源代码。

seg-234be920d38f = AGPL 是<a1>经 OSI 认可的开源许可</a1>，属强 copyleft。它适合学术工作、开源项目、内部评估与研究，也适合乐于让自己的衍生作品保持开放的任何人。

seg-16c9cc91e4eb = 选项 B：商业许可（由 Ashforde OÜ 提供）

seg-197bfc5a5166 = 如果 AGPL 不适合您，Ashforde OÜ 将按商业条款许可同一引擎。以下情形适合选择商业许可：

seg-6de2b04016e5 = <b>将 Kshana 嵌入专有/闭源产品</b>，而无需公开您自己的源代码；

seg-e31db28c1e09 = 基于修改过的 Kshana <b>提供网络服务</b>，而<b>无需</b>承担 §{ "13" } 的源代码披露义务；

seg-9d3578395a59 = 将 Kshana 集成到其他组件不能采用 AGPL 的较大系统中（例如总承包商的专有工具链）；或者

seg-99d049c650a3 = 取得 AGPL 明确不提供的担保、赔偿或支持条款。

seg-f68b536b93c0 = 商业许可按约定条款，免除您使用时的 copyleft 义务。<b>联系方式：<a1>contact@ashforde.org</a1>。</b>

seg-55f1a2f687d9 = 为何采用这种双重许可

seg-42c1ce05ca5c = 目标是做到<b>可公开验证</b>（任何审阅者都可以运行并审计引擎），同时<b>不</b>让资源雄厚的竞争对手分叉这一经验证的引擎、将其闭源，并推出一款不作任何回馈的专有竞品。AGPL 的网络 copyleft 做到了这一点：闭源或托管的衍生版本必须回归开源，或者向我们取得商业许可。公信力与受保护的核心，二者兼得。

seg-32b1d38914fe = 此双重许可<b>不</b>涵盖的内容

seg-27636d757dba = <b>原生 OpenCPN 插件</b>（<c1/>）采用 <b>GPL-3.0-or-later</b> 许可（见该目录中的 <c2/> 文件），而非 AGPL-3.0，并且<b>不</b>提供商业许可。它被加载到 OpenCPN 中，并针对其 GPL-2.0-or-later 插件 API 头文件构建，这是 OpenCPN 插件通常采用的依据。<c3/> 的其余部分（Signal K 插件和 OpenCPN TCP 中继）仍为 AGPL-3.0-only。

seg-f90c983e0ee3 = <b>Kshana Pro</b> 及其他专有叠加产品是<b>独立的闭源</b>产品，适用各自的商业条款。它们不属于本代码仓库，也不按 AGPL 提供。

seg-e340445b7f17 = <b>依赖项</b>保留各自的（宽松）许可。我们有意让依赖树保持宽松（Apache-2.0 / MIT / BSD / ISC / ……），正是为了能够干净地提供商业版本，因为 copyleft 依赖项会污染它。参见 <a1><c1/></a1>。

seg-810191f19d4d = <b>Galileo E1 主存储码</b>（<c1/>、<c2/>；<b>自 { "0.36" } 起不再随附</b>：每位用户自行提供副本，使用 <c3/> 或 <c4/> / <c5/>，由 <c6/> 读取）。它们是 Galileo 开放服务空间信号接口控制文件（OS SIS ICD）{ "2.0" } 版（{ "2021" } 年 1 月，© European Union { "2021" }）附录 C.7 和 C.8 中的 E1-B 和 E1-C 主码，未经修改地从 PDF 附件中提取（来源 URL、SHA-256 以及与 { "1.3" } 版的交叉核对见 <a1><c7/></a1>）。它们<b>不</b>受 AGPL-3.0 或商业许可涵盖，两种许可均不授予对它们的任何权利。ICD 本身的说法，引自 { "2.0" } 版：

seg-daef032cbe43 = 使用条款 §{ "3" }：“The information contained in the OS SIS ICD, including its Annexes, is subject to intellectual property rights”。“The OS SIS ICD may only be partly or wholly reproduced and/or transmitted to a third party in accordance with the herein described permitted use and under the following conditions: the present “Terms of Use and Disclaimers”, as well as the terms of Annex G, are accepted, reproduced and transmitted entirely and unmodified together with the reproduced and/or transmitted information; the copyright notice “© European Union { "2021" }” is not removed from any page.”以及：“The use of the information contained in the OS SIS ICD, including the spreading codes which are subject to IPR, is authorised under the terms and conditions stated in Annex G.”

seg-0fb25fafd9a2 = 附录 G（{ "2.0" } 版；{ "2.1" } 版中为附录 H，措辞相同）将“OS SIS ICD 技术数据”定义为包含“E1 和 E5 存储码”，并给予“非排他且免版税”“不可转让且不可再许可”的不主张承诺。其 §G.3 的清单（该附录称其为穷尽式）涵盖：“a) the use of the Technical Data of the OS SIS ICD, including their integration and incorporation into any Products”；“b) the storage of the Technical Data of the OS SIS ICD, provided the source is acknowledged”；“c) the reproduction of the OS SIS ICD, in whole or in part, its distribution and its publication for non-commercial not-for-profit purposes and scale without amending the document or adding any element”；以及“d) providing links to the EU website where the document is published”。“产品”指“使用 OS 信号”的软件、设备和增值服务。它还指出：“The Authorised Person shall not state or imply in any promotional material or elsewhere that the Products were developed by, are used by or for or have been approved or endorsed by the EU”。

seg-8531368368ba = <b>决定（{ "0.36" }）：不再再分发。</b>没有明示的开放许可。在软件产品内使用（G.3 a）以及在注明来源的前提下存储（G.3 b），均按 ICD 自身条款得到涵盖；但再分发（G.3 c）仅限于非商业、非营利目的，并须在旁原样、不加修改地附上使用条款和附录 G。由于 Kshana 同时按商业许可提供，这些文件已从代码仓库及其软件包中移除；引擎在运行时读取用户自己的副本，没有该副本时，Galileo E1 信号会返回一条说明如何提供它们的错误。每位用户直接依赖欧盟的授权；Kshana 无法转授。Kshana 不是由欧盟开发、使用、批准或背书的。

seg-e18986aeab7f = <b>商标。</b>“Kshana”及其标识是 Ashforde OÜ 的商标。两种许可均不授予对名称或标识的任何权利；分叉版本和衍生分发版本必须使用不同的名称。参见 <a1><c1/></a1>。

seg-f6b7345c2c60 = 贡献

seg-1709eb19c2c5 = 贡献按项目的入站贡献者条款接受：您依 AGPL 许可您的贡献，<b>并</b>授予 Ashforde OÜ 将其纳入商业许可版本的权利（使双重许可得以持续运作）。参见 <a1><c1/></a1>。

seg-940c8cce5137 = 问题

seg-e678f2ecc571 = 许可问题、商业报价以及“哪个选项适用于我们？”→ <b><a1>contact@ashforde.org</a1></b>。

seg-05d34a27a0ba = <s1>上一页</s1>变更日志

seg-4f7f660eea0a = <s1>下一页</s1>安全

seg-2d2b32369c30 = 此双重许可不涵盖的内容
