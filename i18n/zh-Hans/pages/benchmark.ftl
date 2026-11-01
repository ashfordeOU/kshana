# benchmark: translations (zh-Hans)

seg-0c0ce6abb920 = 同样的日志，同样的规则。<s1>得分公开。</s1>

seg-cb2911864ea1 = kshana-bench是一套固定的任务、数据划分和指标，用于GNSS干扰检测与授时守时（holdover），使不同方法可以在同一数据上比较。提交的是一个文件，不会代提交者运行任何内容。基线是引擎自带的监测器，其判据在首次计分运行之前就已写下。

seg-11b19c2fd000 = 查看榜单

seg-b77706a0b8b5 = 阅读规范

seg-63a783e8fa0b = 排行榜

seg-556a1861ad9c = 榜单

seg-64052578c384 = 由引擎计分的结果文件。

seg-0ac1117a39b8 = kshana-bench排行榜

seg-b71ad83b27ad = 依据<c1/>计分的结果文件。一行表示：该文件在该数据划分上得到该分数。这并不表示任何产品已被任何一方评级或认可，也没有任何机构被列为背书方。

seg-6a2052a10b6e = 仅供参考：依据明示的参照进行建模或测量，不是批准、认证或符合性声明。评分描述的是日志或语料，绝非产品。

seg-2918ee229bdd = 任务（a）：接收机日志上的检测

seg-7f2573819278 = 任务（a）：接收机日志上的检测，dev结果

seg-082f44ff5710 = 数据划分：dev

seg-46c7e6f003dd = 系统

seg-5aa5efd6b7da = AUC

seg-dc9137d28ced = 虚警概率上限处的P_d（上界）

seg-75ada2743d1d = 真值SHA-256

seg-e77eb0d4b34b = kshana receiver-trust agc_k_sigma（{ "0.35" }默认监测统计量） <s1>kshana-bench/2.0.0</s1>

seg-c9d7efecc1d9 = 已计分

seg-b47a5173a65c = kshana receiver-trust cn0_drop_db（{ "0.35" }默认监测统计量） <s1>kshana-bench/2.0.0</s1>

seg-8b5d25c24aee = kshana receiver-trust jam_ind_threshold（{ "0.35" }默认监测统计量） <s1>kshana-bench/2.0.0</s1>

seg-9c794cbe6919 = 任务（a）：接收机日志上的检测，holdout结果

seg-bf455fb5bda5 = 数据划分：holdout

seg-d69e976e0fa9 = 任务（a）：接收机日志上的检测，test结果

seg-c163c8084e23 = 数据划分：test

seg-4c475a58619d = 任务（b）：IQ上的检测

seg-26740783c99e = 任务（b）：IQ上的检测，test结果

seg-6f1b3b3729bf = kshana iq监测器：cn0_drop（CUSUM） <s1>kshana-bench/2.0.0</s1>

seg-7e2dd8e3fb49 = 沿用：docs/design/DETECTION-ROC.md第{ "3" }节：tests/iq_campaign_roc.rs的R1测评活动，运行于2026-10-13；未针对bench v1重新运行。判据R1（AUC >= { "0.95" }）NOT MET。

seg-e7c2cfbb1e8c = 任务（c）：授时守时（holdover）预测

seg-9198e0e61f53 = 任务（c）：授时守时（holdover）预测，dev结果

seg-46487e0c8856 = RMSE { "3600" } s（ns）

seg-6c032477c78f = RMSE { "300" } s（ns）

seg-780fda205195 = RMSE { "7200" } s（ns）

seg-2246c31f1782 = kshana-bench基线：线性<s1>kshana-bench/2.0.0</s1>

seg-af33c581ac95 = kshana-bench基线：二次<s1>kshana-bench/2.0.0</s1>

seg-d8bb527fe5be = kshana-bench基线：保持<s1>kshana-bench/2.0.0</s1>

seg-18fd676cd356 = 任务（c）：授时守时（holdover）预测，test结果

seg-ca13357b9f63 = 任务（d）：分布外乐观性差距

seg-dbbcfa3baaf4 = 任务（d）：分布外乐观性差距，dev结果

seg-b022faebf582 = 分布内AUC

seg-824b2aff7e8d = 分布外AUC

seg-835f66c4ee63 = 乐观性差距

seg-fea8fb19c38c = 标志

seg-698f3f00492d = impairment-eval基线：fused(max-z) <s1>kshana-bench/2.0.0</s1>

seg-6320a9edbdca = 在容差内

seg-aa7cda114a64 = impairment-eval基线：sqm-imbalance <s1>kshana-bench/2.0.0</s1>

seg-c272e7fd6a7f = impairment-eval基线：agc-excess <s1>kshana-bench/2.0.0</s1>

seg-02fb2080da2e = impairment-eval基线：raim-parity <s1>kshana-bench/2.0.0</s1>

seg-00c8aea0d4fe = impairment-eval基线：energy(cn0-drop) <s1>kshana-bench/2.0.0</s1>

seg-ee090c2f6612 = 任务（d）：分布外乐观性差距，test结果

seg-88c3cc6c3800 = 除非某一行注明外部参考基准（oracle）一致，否则每个分数都是由模型计算得出。规范与清单的许可：拟采用CC-BY-4.0 / CC0，待所有者决定。真实数据holdout并不保密：见规范第{ "4" }节。

seg-68e7ed4fc6ee = 一行可以表述的内容

seg-7912ad415e48 = 一行的含义

seg-7b6aa7dbc2e4 = 分数描述的是一份日志，而不是一个产品。

seg-69cc3c1470b3 = 一行表示：该文件在规范版本V下的数据划分S上得到X分。它并不表示某个产品已获认证、符合、认可或背书，也没有任何机构被列为背书方。

seg-dd289a4fc50a = 数据为实录或合成数据，并在规范中注明。第三方数据绝不复制进代码仓库：清单和获取脚本以SHA-256锁定每个文件，并在使用数据之前记录各自的许可。

seg-d48b2ec4cbe8 = 实录日志的真值是测试计划的预定时隙，而不是记录下的实际播发时间，因此检测概率只是下界。规范在每项任务旁都有说明。

seg-6883a66f3bdd = 封存的holdout只在排行榜轮次中计分，其随机种子在计分之后才公开。凡声称有某个数值的基线，其判据都在计分运行之前提交，事后绝不放宽；未达标者记录为NOT MET。

seg-97d14f361df5 = 结果文件中记录的结论：计分器判据、C1至C3和D2达到；A2为NOT MET（test划分上agc_k_sigma的AUC为{ "0.766" }，判据要求至少{ "0.80" }），D1为NOT MET（最大差距{ "0.0301" }），任务（b）的R1为NOT MET（沿用，未重新运行）。没有任何判据被放宽。

seg-23023a10ef10 = 仅供参考：Kshana的结果是对照所述参考基准经模型计算或实测得出，不是认可或符合性声明。

seg-b30115d8c2eb = 自行运行：<c1/>将提交文件和某个数据划分的真值转为结果文件；<c2/>将结果文件渲染成本页面。
