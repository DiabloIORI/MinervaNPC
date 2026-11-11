# Minerva NPC（米涅瓦）汉化说明

## 一、模组概况

| 项 | 内容 |
|---|---|
| 原名 | Minerva NPC for Icewind Dale: Enhanced Edition |
| 作者 | AionZ（原名 Artemius_I） |
| 版本 | 1.0 |
| 适用平台 | **仅 `iwdee`（冰风谷增强版）**，tp2 内含 `REQUIRE_PREDICATE (GAME_IS ~iwdee~)` |
| 汉化对象 | `E:\GitHub\MinervaNPC\MinervaNPC` |
| git 仓库 | `E:\GitHub\MinervaNPC`（开始前 clean） |

该模组**没有 `tra` 目录**：`AUTO_TRA ~%MOD_FOLDER%/tra/%s~` 与 `LANGUAGE ~English~ ~english~ ~%MOD_FOLDER%/tra/english/setup.tra~` 指向的目录实际不存在（作者上游有 `Revert "traify"` 提交，说明曾 traify 后又回滚）。文本全部内嵌在 `.d` / `.tpa` 里，因此走**源码内嵌汉化**，直接替换原文，`.tp2` 未做任何改动（`AUTO_TRA` 属失效配置，不影响安装）。

## 二、改动清单

| 文件 | 改动处数 | `.bak` |
|---|---|---|
| `dialogue/C0MMin.d` | 34 | 有 |
| `dialogue/C0MMinJ.d` | 881 | 有 |
| `dialogue/C0Modr.d` | 12 | 有 |
| `dialogue/c0aualch.d` | 3 + 1（跨行主台词手工处理） | 有 |
| `dialogue/BC0MMin.d` | 0（空文件） | 无 |
| `lib/minerva.tpa` | 85 | 有 |
| `lib/kit.tpa` | 175 | 有 |
| `lib/resources.tpa` | 5（肖像图标状态名） | 有 |
| `lib/functions.tph` / `alter_script.tpa` / `fl#add_kit_ee.tpa` / `qd_multiclass.tpa` | 0（纯代码） | 无 |
| `MinervaNPC.tp2` | 未改 | 无 |

合计约 **1195 处** `~...~` 文本替换。

## 三、编码与校验

- 全部文件 **UTF-8 无 BOM**（`BOM=False` 已逐文件确认）。
- 每个文件改动后 **行数不变**（如 `C0MMinJ.d` 2965 行 → 2965 行；`kit.tpa` 822 行 → 822 行；`minerva.tpa` 446 行 → 446 行）。
- `~` 数量与备份完全一致（如 `C0MMinJ.d` 2812 → 2812；`kit.tpa` 822 → 822），无引号失衡。
- 对话层剩余英文 payload = **0**（脚本逐行按形态分类器复查）。
- lib 层剩余英文均为代码标识符（资源名、2DA 行、脚本 token、`%变量%`、`ANIMATE.IDS` 等），未动。
- 性别/名字标签：`<PRO_HESHE>`（2 处）、`<PRO_HISHER>`（1 处）在物品描述中**保留**为 WeiDU 标签；`<PLAYER1>` / `<CHARNAME>` / `<GABBER>` / `<MINERVA>` 计数与备份一致。

### 自检中发现并已修复的两个错位

1. `minerva.tpa` 中 `Blast Knives +4` 的 `NAME2` 与 `SAY DESC` 被互换（名称行变成了整段说明、说明行变成了物品名）——已按原文重新对位。
2. `kit.tpa` L774 的 `COPY_EXISTING ~c0apoth5.spl~` 被误替换成中文描述——已还原为 `c0apoth5.spl`。

> 说明：这两处是「按编号取译文」时的索引错位（+4 的说明与名称相邻、`c0apoth5.spl` 与「坚韧补剂」说明相邻），属于流程性错误，已在定稿前修好；最终全文只有代码键与文本键一一对应。

## 四、译名与文风

**米涅瓦语音**：轻快、俏皮、爱玩笑、爱自嘲，句子偏短、口语化，与粗豪的矮人腔严格区分。

人名：`Minerva` 米涅瓦 / `Minerva Glimmershine` 米涅瓦·闪辉（`Glimmershine` 闪辉，家族姓）/ `Mini` 小咪 / `Hrothgar` 赫罗斯加 / `Accalia` 阿卡莉娅 / `Hildreth` 希尔德雷丝 / `Arundel` 阿伦德尔 / `Larrel` 拉瑞尔 / `Erevain` 埃瑞文 / `Poquelin` 波奎林 / `Karihi` 卡里希 / `Nella` 内拉 / `Dusky` 达斯基 / `Holvir` 霍尔维尔 / `Gaspar` 加斯帕 / `Orrick` 奥里克 / `Tiernon` 蒂尔农 / `Arthur Dinelstrand` 亚瑟·迪内尔斯特兰德 / `Kairos` 凯罗斯 / `Quartus-G1/G2/G3` 夸图斯-G1/G2/G3 / `Urchin` 厄钦 / `Fullen Woolspinner` 富伦·伍尔斯平纳 / `Jurmar the Calm` 沉静的尤玛

神祇：`Labelas` 拉贝拉斯 / `Ilmater` 伊尔玛特 / `Gond` 贡德 / `Tempus` 坦帕斯 / `Moradin` 摩拉丁 / `Clangeddin` 克兰格丁（称号 `Foehammer` 仇锤）/ `Berronar Truesilver` 贝罗娜·真银

地名：`Lantan` 兰坦 / `Sambaran` 桑巴兰（学院/造物学院/研究所）/ `Orlil` 奥尔利尔 / `Waterdeep` 深水城 / `Easthaven` 东港 / `Kuldahar` 库尔达哈 / `Lonelywood` 孤木镇 / `Gloomfrost` 幽霜 / `Ten Towns` 十镇 / `Icewind Dale` 冰风谷 / `Severed Hand` 断手塔 / `Dorn's Deep` 多恩深渊 / `Anauroch` 安纳洛克 / `Chult` 楚尔特 / `Dalelands` 谷地 / `Sword Coast` 剑湾 / `Caer-Dineval` 卡厄迪内瓦尔 / `Anchoril` 安克里尔 / `Illefarn` 伊莱法恩 / `Kara-Tur` 卡拉图 / `Westgate` 西门城 / `Mechanus` 机械境

术语：`artificer` 工匠（职业）/ `Fighter/Artificer` 战士 / 工匠 / `scrimshaw` 骨雕 / `knucklehead trout` 硬头鳟 / `modron` 莫德伦 / `svirfneblin` 斯维尔夫内布林 / `marilith` 玛丽利斯 / `revenant` 亡魂 / `lich` 巫妖 / `astrolabe` 星盘 / `lucky knucky` 幸运骨 / `Autocannon` 自动炮 / `automaton` 自动机 / `Gear Crash` 齿轮撞击 / `Set Alchemical Snare` 设置炼金绊索 / `Advanced Alchemy` 高等炼金术 / `Craft Automaton` 制造自动机 / `Craft Wand` 制造魔杖 / `Master Alchemist` 大师炼金师 / `Grand Artifice` 大宗造物 / `Blast Knives` 爆裂飞刀 / `Firetooth` 火牙

药水体系统一：`Potion of Renewal` 恢复药水、`Philter of Health` 健康酊剂、`Elixir` 灵药、`Tonic` 补剂、`Extract` 提取液、`Oil` 之油；前缀 `Lantanese` 统一作「兰坦××」，如「兰坦恢复药水」。

物品描述栏位统一：`STATISTICS` 属性 / `Combat abilities` 战斗能力 / `Charge abilities` 充能能力 / `Equipped abilities` 装备能力 / `THAC0` 命中值（THAC0）/ `Damage` 伤害 / `Speed Factor` 速度系数 / `Proficiency Type` 熟练类型 / `Type: One-handed` 类型：单手 / `Requires` 需求 / `Weight` 重量 / `Duration` 持续时间 / `Special` 特殊。

星号动作用中文星号式：`*咯咯笑*`、`*叹气*` 等；正文强调仍用 `*word*`。

## 五、安装提示

1. 只能装在 **IWD:EE**；装 BG2EE/EET 会直接被 `REQUIRE_PREDICATE` 拦下（此前在 BG2EE 目录试装报错属正常）。
2. 本模组是**纯 NPC**，不含 crossmod 对话，**不需要提前安装其它 NPC 模组**；与其它 mod 之间没有顺序约束（放在 NPC 类模组常规位置即可）。
3. 若日后想还原：目录内已生成 7 个 `.bak`，改回原名即可；`git -C E:\GitHub\MinervaNPC checkout -- MinervaNPC` 亦可整体回滚。
4. 本机没有 IWD:EE，**未做实装编译验证**；文本层已按 WeiDU 语法校验（引号配对、行数、标签计数、无 BOM）。

## 六、已知未动项（有意保留）

- `Magatama`（`resources.tpa` 肖像图标名）——专有名词，且可能与其它 mod 图标复用，保留英文。
- `SPLPROT.2DA - Stat out of Bounds.` / `Relation out of Bounds.`——开发者报错文案，玩家不可见。
- `C0 Grenade`、`C0 Green Flaming Oil`、`C0 Flashbomb` 等 `C0 ...` 投射物/特效名——内部标识，保留英文。
- 内部状态名 `Stunned / Nauseated / Empowered / Slowed / Corroded / Shocked / Paralyzed / Frozen / Detecting Magic` 通过 `RESOLVE_STR_REF` 写入 `ALTER_EFFECT`，但**同时**用于 `cd_new_portrait_icon` 的肖像提示，属玩家可见；已统一译作 震慑 / 反胃 / 强化 / 迟缓 / 腐蚀 / 电震 / 麻痹 / 冰冻 / 侦测魔法。
