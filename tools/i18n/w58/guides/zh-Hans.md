# Guide for 简体中文 (zh-Hans)

## Terms (English -> rendering; * = keep the English word)
- PNT -> PNT（定位、导航与授时）
- GNSS -> GNSS（全球导航卫星系统）
- spoofing -> 欺骗干扰（spoofing）
- jamming -> 压制干扰（jamming）
- interference -> 干扰
- integrity -> 完好性
- availability -> 可用性
- continuity -> 连续性
- accuracy -> 精度
- precision -> 精密度
- holdover -> 守时（holdover）
- ledger -> 台账（ledger）
- evidence pack -> 证据包
- pre-registration -> 预先登记
- bar (pass criterion) -> 判据
- oracle (independent reference) -> 参考基准（oracle，独立参照）
- advisory -> 咨询性（仅供参考）
- supports evidence for -> 为……提供证据支持（supports evidence for）
- scenario -> 场景
- receiver -> 接收机
- clock -> 时钟
- oscillator -> 振荡器
- time error -> 钟差（时间误差）
- ionosphere -> 电离层
- multipath -> 多路径
- carrier phase -> 载波相位
- pseudorange -> 伪距
- Doppler -> 多普勒
- ephemeris -> 星历
- constellation -> 星座
- protection level -> 保护级
- dilution of precision (DOP) -> 精度因子（DOP）
- ambiguity resolution -> 整周模糊度解算
- detection -> 检测
- false alarm -> 虚警
- missed detection -> 漏检
- Monte Carlo -> 蒙特卡罗
- Allan deviation -> 阿伦偏差
- time transfer -> 时间传递
- resilience -> 韧性
- orbit determination -> 定轨
- cislunar -> 地月空间
- synthetic data -> 合成数据
- reproducible -> 可复现
- cross-validation -> 交叉验证
- tolerance -> 容差
- seed -> 随机种子（seed）

## Tier and verdict words: stay English capitals. Glosses (for reference only): VALIDATED: 独立的外部参考基准（oracle）一致; MODELLED: 内部自洽，并明确说明; PARTNER: 由硬件合作方负责; MET: 达到判据; NOT MET: 未达到判据; EXPLORATORY: 探索性：不能用来关闭原有判据

## Forbidden as claims about Kshana: 已认证, 符合（作为对 Kshana 的声明）

## Style
- plural_categories: other
- plural_note: One category only: no plural selector is needed; use measure words where English counts (3 个, 5 台) with a Fluent placeable for the number.
- cases: No grammatical case or inflection. Do not build sentences by concatenating placeables: put the whole sentence in one message so word order and measure words are correct.
- register: Neutral written technical register (书面语), impersonal; no '您' address and no colloquial particles; imperative as a bare verb on buttons (运行, 保存). Technical terms follow the Chinese national GNSS literature.
- punctuation: Full-width ，。：；、！？ and （）in Chinese running text; curly quotation marks “ ” (nested ‘ ’), not corner brackets. Half-width ASCII punctuation only inside wholly Latin or numeric spans (for example (IEC 61108)). Digits and Latin letters are half-width. No spaces are inserted between Han characters and Latin letters or digits; a half-width space is kept between a number and its unit exactly as in the English source (20 dB-Hz).
- latin_terms: GNSS, PNT, DOP and similar acronyms stay in half-width Latin capitals and are glossed in Chinese once per page on first use (GNSS（全球导航卫星系统）). Tier and verdict words stay in English capitals.

## Advisory sentences (use exactly when an English message embeds the English sentence)
- EN: Advisory: analysis output from a research and engineering tool, not type-approved navigation equipment and not a safety-of-life service.
  zh-Hans: 仅供参考：研究与工程工具的分析输出，不是经型式认可的导航设备，也不是生命安全服务。
- EN: Advisory: analysis output from a research and engineering tool, not type-approved navigation equipment and not a safety-of-life service; it must not be the sole basis for any navigation or safety decision.
  zh-Hans: 仅供参考：研究与工程工具的分析输出，不是经型式认可的导航设备，也不是生命安全服务；不得作为任何导航或安全决策的唯一依据。
- EN: Advisory: not type-approved navigation equipment.
  zh-Hans: 仅供参考：不是经型式认可的导航设备。
- EN: Advisory software, not type-approved navigation equipment (IEC 61108, IEC 61162): the operator remains responsible for the navigation of the vessel.
  zh-Hans: 仅供参考的软件，不是经型式认可的导航设备（IEC 61108、IEC 61162）：船舶航行的责任仍由操作人员承担。
- Machine translation notice: 机器翻译，未经母语人士审校。以英文版为准。
- campaign (an iq/labfit scored campaign) -> 测评活动 (never 战役)
