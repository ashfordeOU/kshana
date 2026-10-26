# docs--deployment-targets: translations (zh-Hans)

seg-9c1e7fd8f838 = 方式

seg-5ad814c7ef9e = 备注

seg-9d3ee6a5613e = 运行

seg-e8eefc84e748 = 来源：<c1/>

seg-3e1eb98b38df = { -brand } 在哪里运行，在哪里不运行

seg-1a203c4736f1 = 一条范围边界，写下来是为了没有人在某次会议上才把它当作承诺发现。

seg-d6c92d17a3dd = 缩略语：CPU，中央处理器；GPU，图形处理器；NPU，神经网络处理器；FPGA，现场可编程门阵列；MCU，微控制器；RTOS，实时操作系统；OPS-SAT，欧洲航天局的在轨软件实验室卫星；PyPI，Python 包索引；MCP，模型上下文协议；AI，人工智能；JSON，JavaScript 对象表示法。

seg-9376bb5b192e = 目标

seg-95e7da118089 = Linux、macOS 和 Windows 工作站与服务器，x86-64 和 64 位 ARM

seg-b6ef382a73ef = <c1/> 二进制文件，或 Rust crate

seg-b8af20715cea = 面向 Linux x86-64、macOS（Apple 芯片和 Intel）和 Windows x86-64 的发布版二进制文件；在其他目标上由 <c1/> 构建

seg-3dc7d08f5729 = Python { "3.9" } 或更新版本

seg-b1f1009faa44 = PyPI 上的 <c1/> wheel（<c2/>）

seg-45b4e1bd8b18 = 面向 Linux、macOS 和 Windows、x86-64 和 64 位 ARM 的 wheel

seg-79f04380d254 = MCP 客户端（AI 智能体）

seg-4163955ed77a = <c1/> 服务器：<c2/>，或容器镜像

seg-c5a32580b7bc = 面向 linux/amd64 和 linux/arm64 的镜像

seg-ec575e06d439 = 浏览器和 JavaScript 运行时

seg-a8238abc55bd = npm 上的 WebAssembly 包（<c1/>）

seg-c7789c7f4429 = 同一个引擎，编译为 WebAssembly

seg-488c2b62d246 = 船上接收机旁的一台小型计算机

seg-69a58e13b706 = <c1/> 中的参考构建：带关卡的 <c2/>，向 Signal K 发布，并可选择向 OpenCPN 发布

seg-df530583c13c = 仅供参考，不是经型式认可的导航设备；项目方未在船舶上测试过；见 <a1><c1/></a1>

seg-cf83dbb55f99 = Signal K 服务器

seg-88ddbefb95dd = <c1/> 中的插件

seg-5f436c952149 = 已发布，并在录制的合成数据输出上做过单元测试；未发布到 npm

seg-06ff6eed7e99 = OpenCPN

seg-026115eafe9b = 来自监测器的、基于 TCP 的关卡模式 NMEA { "0183" }

seg-8e101a661cbc = 可选启用；见 <a1><c1/></a1>

seg-cea294c412f0 = Linux 级别的载荷计算机

seg-bf74da1c1262 = Rust crate 或二进制文件，交叉编译

seg-868f121e5909 = OPS-SAT 级别的载荷计算机及类似设备

seg-53c8be810679 = 在 Linux CPU 旁配有 GPU、NPU 或 FPGA 的边缘节点

seg-70b2c22bf453 = 在 Linux CPU 上

seg-977842cb0f86 = { -brand } 不使用任何加速器；它与加速器并行运行

seg-3e15446b6efb = 不运行

seg-205144220741 = <b>不带 Rust 标准库的裸机飞行 MCU 或小型 RTOS。</b>{ -brand } 自始至终是一个 <c1/> crate：它在堆上分配内存，读取文件，格式化 JSON，并使用标准库的浮点函数。不存在 <c2/> 构建，也没有能生成这种构建的特性。

seg-46ccad7b96e8 = <b>决定：我们不提供 <c1/> 飞行核心。</b>构建一个会成为另一个产品，有它自己的验证负担，并且会把 { -brand } 带入飞行软件；而在飞行软件中，资质鉴定本身就是一项独立的工程，我们没有途径完成。

seg-63bc696bc66a = 改为怎么做

seg-07fff123aed3 = <b>在地面或载荷计算机上运行 { -brand }，并上传其结果。</b><c1/> 类型恰好产生飞行计算机所需的数值：定位周期、越界时间、保护间隔。将它们列成一张表只有几个字节。

seg-c2752c281cd3 = <b>如果只需要一个闭式解，就移植它。</b>守时反演是对多项式方差做的一次简短的单调求根，其方程记录在 <a1><c1/></a1> 中。在飞行代码中重新实现它很简单；源自 { -brand } 的代码仍受 { -brand } 的许可约束。

seg-b484e9426ab0 = 同样不在范围之内

seg-7bcd90c9ef31 = 硬实时保证（{ -brand } 会分配内存，也不对最坏情况执行时间作任何声明）；任何东西的飞行资质鉴定；以及同步协议、控制器或路由协议栈。{ -brand } 提供的是这些系统据以设计的授时证据。它本身不是其中之一。

seg-542e51fbb35a = <s1>上一页</s1>JetBrains 插件

seg-52a455f4c409 = <s1>下一页</s1>架构
