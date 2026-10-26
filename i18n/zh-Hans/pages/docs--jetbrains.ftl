# docs--jetbrains: translations (zh-Hans)

seg-f8a0fe9968c4 = 来源：<c1/>

seg-c55e49fd2a72 = 适用于 JetBrains IDE 的 Kshana

seg-d7280bb554bf = <a1>JetBrains Marketplace 上的 <b>Kshana — PNT simulator</b></a1>；或者在任意 JetBrains IDE 中依次选择 <em>设置 → 插件 → Marketplace → 搜索“Kshana”</em>。

seg-959ab829762c = 一款原生插件，可在任意 JetBrains IDE（IntelliJ IDEA、CLion、RustRover、PyCharm 等）内部运行 <b>Kshana</b> PNT 韧性仿真器。右键单击场景 <c1/> → <b>Run Kshana Scenario</b>；性能指标和结果 JSON 会以流的形式显示在 <b>Kshana</b> 工具窗口中。

seg-594199d2ce06 = 与 <a1>MCP 服务器</a1>互补（MCP 服务器让 JetBrains <em>AI Assistant</em> 能够访问 Kshana）：本插件是供<em>人</em>使用的点击式途径。

seg-a356f2c30afb = 对任意 <c1/> 文件执行 <b>Run Kshana Scenario</b> 操作（编辑器与项目视图的上下文菜单）：运行 <c2/>，并在 Kshana 工具窗口中显示输出。

seg-116d04ae5538 = 对 <c1/> 场景 <c2/> 执行 <b>Assess Receiver Trust</b>（<c3/>）：给出信任度时间线，包含船舶的 0-100 分数及原因。仅供参考的软件，不是经型式认可的导航设备（IEC { "61108" }、IEC { "61162" }）：船舶航行的责任仍由操作人员承担。

seg-726d88d0dea7 = 对 <c1/> <c2/> 执行 <b>Generate Training NMEA</b>（<c3/>）：生成合成的驾驶台 NMEA 和教员日志，写在场景旁边。仅为文本；用于训练，决不用于船舶的实际导航系统。

seg-99510426a384 = 对 ADS-B 或 AIS 的 <c1/> 执行 <b>Build Interference Map</b>（项目视图；会询问它属于哪个已批准的数据集），对航线文件执行 <b>Route Exposure</b>（会询问地图所在文件夹）。出现退化的单元格并不表明干扰是其原因；这不是预报。

seg-8c50e6aeb5e2 = 对场景 <c1/> 执行 <b>Export Test-Bench Files</b>（<c2/>）：生成供实验室 GNSS 模拟器使用的载体运动、NMEA 和带标注的事件，写在场景旁边。它不生成任何信号；仅在获得授权的地方运行模拟器。

seg-79c553c303c5 = 对运行结果 <c1/> 执行 <b>Build Compliance Report</b>（<c2/>），并执行 <b>Tools → Show Compliance Mapping</b>（<c3/>）：公开框架映射，附带引擎自身的声明，逐字照录。

seg-9b6ce5bbb523 = 对证据包文件夹执行 <b>Verify Evidence Pack</b>（项目视图；<c1/>）：会询问签名者的公钥（{ "64" } 位十六进制数字或 <c2/> 文件；始终要求已固定，插件从不接受未固定的签名者），以及可选的完整会话日志。只有通过验证的结果才显示为已验证；签名者未固定的完整证据包显示为“NOT VERIFIED”。

seg-253d5b7f94ce = 对 <c1/> 结果 <c2/> 执行 <b>Render Trust Telemetry</b>（<c3/>）：把 Prometheus 文本、CEF/LEEF syslog 事件或 Home Assistant MQTT 行输出到 Kshana 窗口。不发送也不提供任何内容；持续运行的导出器仍留在命令行。

seg-ce12ebcdccb5 = 对静止的 IMU <c1/> 执行 <b>Fit Sensor Parameters from IMU Log</b>（<c2/>）：用阿伦偏差拟合 <c3/> 和 <c4/> 场景的加速度计与陀螺仪参数，以 <c5/> 表的形式输出到 Kshana 窗口。不写入任何内容；该拟合为 MODELLED。

seg-b81f27c51c22 = <b>Validate Scenario</b>（<c1/>）、<b>List Scenario Kinds</b>（Tools 菜单；<c2/>）和 <b>Assess Receiver Stream</b>（船舶会话 <c3/> 加上你选择的已存储 NMEA 日志；<c4/>，只评分一次，没有套接字，也没有门限）。

seg-38037d36639c = <b>Insert Example Scenario</b>（项目视图文件夹或 Tools 菜单；<c1/>）：选择一个内置场景，将其写成新的 <c2/>（绝不覆盖已有文件）。对 <c3/> 执行 <b>Export Scenario</b>（SP3、OMM、OEM、CZML、KML、GeoJSON、STK、SigMF；仅限模拟输出）、<b>Animate Scenario</b>（HTML 或 SVG，在浏览器中打开），以及对航线 <c4/> 执行 <b>Import Route</b>（会询问导入到哪个场景）。

seg-1f1b18f8e102 = 对接收机信任度会话 <c1/> 执行 <b>Create Evidence Pack</b>（<c2/>）：会询问时间窗口、你已有的签名密钥文件和输出文件夹。插件从不生成、读取或保存密钥（<c3/> 仍只在命令行中使用）。对证据包文件夹执行 <b>Attach Timestamp</b>（<c4/>）：Kshana 不检查时间戳机构的签名；请自行运行 <c5/>。

seg-f4f6605d3db9 = 仍然只能在命令行中使用的有：IQ 命令、<c1/> 和 <c2/>。

seg-63efd04104f1 = 位于底部的 <b>Kshana</b> 工具窗口，承载运行控制台。

seg-decda07aa7eb = 插件中没有：<c1/>（带门限和可选 TCP 监听器的长时间运行的流处理进程）和 <c2/> 仍留在命令行，因为 IDE 操作是运行一条命令直至完成并显示其输出；参见 <c3/>。

seg-9c185454d0c0 = <b>Settings → Tools → Kshana</b>，用于指定 <c1/> 二进制文件（留空 → 从 <c2/> 解析；用 <c3/> 安装）。

seg-44dfdd65bd0a = 该插件是纯平台插件（不依赖特定语言），因此可在构建号 { "243" }（{ "2024.3" }）及更新版本的所有 JetBrains IDE 中加载。

seg-453bd42c23fa = 构建与运行

seg-b5328f8c7a8a = 需要 JDK { "17" } 或更高版本（构建固定使用 JDK { "21" }）以及随附的 Gradle wrapper。

seg-758124ceb1c7 = <c1/> 默认检查 since-build，即 { "2024.3" }。若要检查其他版本线，请将它们列为 <c2/>（每个 IDE 需下载约 { "1" } GB）：

seg-15d175aaeb59 = 该插件在上述任何版本上都不使用已弃用或计划移除的平台 API；请保持这一点（选择对话框通过 <c1/> 调用，而不是 <c2/>）。

seg-39cfd740d9b3 = 通过 <b>Settings → Plugins → ⚙ → Install Plugin from Disk…</b> 安装构建出的 zip。

seg-87aff08f344c = 目录结构

seg-73b3f55b7208 = 隔离

seg-a14db8de576a = 与 <c1/> 和 <c2/> 一样，这是一个独立的 Gradle 项目，不包含在发布的 <c3/> crate 中（包的 <c5/> 中列有 <c4/>）；其构建输出已被 gitignore 忽略。

seg-b38914a430b9 = 许可证：AGPL-3.0-only（或 Ashforde OÜ 的商业许可证，见仓库中的 <c1/>）。

seg-bb286e3ce9c9 = <s1>上一页</s1>各项能力的访问途径

seg-e62586b5f58c = <s1>下一页</s1>Kshana 的运行位置
