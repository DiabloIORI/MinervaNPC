BEGIN C0MMin

CHAIN IF WEIGHT #-1 ~Global("C0MMinBegin","GLOBAL",1)~ THEN C0MMin MINERVA-BEGIN
~看到几张看着就想干一票的脸，真不错！给我一会儿，我从这儿下来……~ [C0BLANK]
DO ~StartCutSceneMode()
CutSceneId("C0MMin")
SetGlobal("C0MMinBegin","GLOBAL",2)
FadeToColor([30.0],0)
Wait(2)
JumpToObject([PC])
Wait(2)
FaceObject([PC])
ActionOverride(Player1,FaceObject("C0MMin"))
ActionOverride(Player2,FaceObject("C0MMin"))
ActionOverride(Player3,FaceObject("C0MMin"))
ActionOverride(Player4,FaceObject("C0MMin"))
ActionOverride(Player5,FaceObject("C0MMin"))
ActionOverride(Player6,FaceObject("C0MMin"))
FadeFromColor([30.0],0)
Wait(4)
StartDialogueNoSet([PC])~ EXIT

CHAIN IF WEIGHT #-1 ~Global("C0MMinBegin","GLOBAL",2)~ THEN C0MMin MINERVA-BEGIN
~哈哈，喜欢我这点杂技表演吗？要是我在屋顶上吓着你了，我道歉。~ [C0BLANK]
DO ~SetGlobal("C0MMinBegin","GLOBAL",3)~
END
++ ~没关系。不过，能否请教你的名字？~ + MINERVA-1
++ ~你的嗓子倒是不错。~ + MINERVA-2
++ ~你是什么人，侏儒？我凭什么在意你？~ + MINERVA-1
++ ~抱歉，我真的没时间跟你说话。~ + MINERVA-END

CHAIN C0MMin MINERVA-1
~米涅瓦。米涅瓦·闪辉，四处游荡的工匠，了不起的寻刺激专家，一路从兰坦来。偶尔我也玩点屋顶表演，就像你看到的。~
END
IF ~NumInPartyGT(1)~ EXTERN C0MMin MINERVA-3a
IF ~!NumInPartyGT(1)~ EXTERN C0MMin MINERVA-3b

CHAIN C0MMin MINERVA-2
~啊，谢谢！你可比我在路上遇见的那些人有品味多了。当然，那些大多是兽人和地精。~
= ~不过，除了这些，让我先自我介绍。~
EXTERN C0MMin MINERVA-1

CHAIN C0MMin MINERVA-3a
~那么，让我看看你们……你们就是最近到的那批冒险者，对吧？要是我没看错——我很少看错——那个刚离开酒馆、腿长得出奇的赫罗斯加托付了件事，那得有点野外经验的人才接得住。不管是什么——只要不太麻烦，我想跟着一起干。~
EXTERN C0MMin MINERVA-4

CHAIN C0MMin MINERVA-3b
~那么，让我看看你……你就是最近到的那位冒险者，对吧？唔，哇……就你一个人？我没想到这地方还能碰到另一个独行的流浪者。~
= ~要是我没看错——我很少看错——那个刚离开酒馆、腿长得出奇的赫罗斯加托付了件事，那得有点野外经验的人才接得住。不管是什么——只要不太麻烦，我想跟着一起干。~
EXTERN C0MMin MINERVA-4

CHAIN C0MMin MINERVA-4
~我使刀、拆陷阱、配药水都拿手……兰坦技艺的学生都学这些。嗯，除了飞刀。那是我自己琢磨出来的。而且我厉害……非常厉害。不信我现在就能表演——算了，也许现在不合适。~
= ~总之，我的本事足够让你觉得带我一起不亏。话说到这份上，你爱怎么办就怎么办。~
END
++ ~我很乐意让你加入，米涅瓦。~ + MINERVA-JOIN
+ ~NumInPartyGT(5)~ + ~可惜，我没位置再收新同伴了。~ + MINERVA-END
+ ~!NumInPartyGT(5)
NumInPartyGT(1)~ + ~I've got all the company I need at the moment.~ + MINERVA-END
+ ~!NumInPartyGT(1)~ + ~眼下我还是宁可独自上路。~ + MINERVA-END
++ ~不行。滚开，侏儒。~ + MINERVA-END

CHAIN C0MMin MINERVA-JOIN
~哦，太棒了！屋顶上吃鳟鱼配奶酪野餐是不错，可既然有伟大的冒险在等着，丢下它也不算损失！你不会后悔的。~
DO ~JoinParty()~ EXIT

CHAIN C0MMin MINERVA-END
~唉，那就这样吧，我想。没人听，我也不能一直说下去。不过这样吧，你要是哪天想多个人作伴，我暂时住在雪堆旅店。~
DO ~EscapeAreaMove("AR1008",368,520,W)~ EXIT

CHAIN IF WEIGHT #-1 ~Global("C0MMinBegin","GLOBAL",3)~ THEN C0MMin MINERVA-INN
~你好呀！这是友好拜访，还是有事找我？我正手痒想冒险。~ [C0BLANK]
END
++ ~我很乐意让你加入，米涅瓦。~ + MINERVA-JOIN-2
+ ~NumInPartyGT(5)~ + ~可惜，我没位置再收新同伴了。~ EXIT
+ ~!NumInPartyGT(5)
NumInPartyGT(1)~ + ~I've got all the company I need at the moment.~ EXIT
+ ~!NumInPartyGT(1)~ + ~眼下我还是宁可独自上路。~ EXIT

CHAIN C0MMin MINERVA-JOIN-2
~乐意之至！~
DO ~JoinParty()~ EXIT

BEGIN C0MMinP

CHAIN IF WEIGHT #-1 ~HappinessLT(Myself,-299)~ THEN C0MMinP MINERVA-LEAVES-LOWREP
~我还以为独自旅行已经够糟了！我一个人反倒更自在。~
DO ~EscapeArea()~ EXIT

CHAIN IF WEIGHT #-1 ~Global("KickedOut","LOCALS",0)~ THEN C0MMinP MINERVA-KICKEDOUT
~哦，是这样？要不要我歇一阵子？~
END
++ ~不用，我弄错了。留下。~ DO ~JoinParty()~ EXIT
+ ~!AreaCheck("AR1008")
!AreaCheck("AR2114")~ + ~Wait here for now.~ DO ~SetGlobal("KickedOut","LOCALS",1)~ EXIT
+ ~AreaCheck("AR1008")~ + ~先在这儿等着。~ DO ~MoveToPoint([368.520]) SmallWait(1) Face(W) SetGlobal("KickedOut","LOCALS",1)~ EXIT
+ ~AreaCheck("AR2114")~ + ~先在这儿等着。~ DO ~MoveToPoint([235.211]) SmallWait(1) Face(NE) SetGlobal("KickedOut","LOCALS",1)~ EXIT
+ ~!AreaCheck("AR1200")
!AreaCheck("AR1201")
!AreaCheck("AR1008")
!Global("AR2000_visited","GLOBAL",1)
!Global("AR2100_visited","GLOBAL",1)~ + ~I'll meet you at the Snowdrift Inn.~ DO ~EscapeAreaMove("AR1008",368,520,W) SetGlobal("KickedOut","LOCALS",1)~ EXIT
+ ~OR(2)
AreaCheck("AR1200")
AreaCheck("AR1201")
!Global("AR2000_visited","GLOBAL",1)
!Global("AR2100_visited","GLOBAL",1)~ + ~Go back to Easthaven for now. I'll meet you at the Snowdrift Inn.~ DO ~EscapeAreaMove("AR1008",368,520,W) SetGlobal("KickedOut","LOCALS",1)~ EXIT
+ ~!Global("Master_Quest","GLOBAL",1)
!Global("Master_Quest","GLOBAL",2)
!Global("Master_Quest","GLOBAL",3)
!Global("Master_Quest","GLOBAL",4)
!Global("Master_Quest","GLOBAL",5)
!Global("Master_Quest","GLOBAL",6)
!Global("Master_Quest","GLOBAL",7)
OR(3)
!GlobalGT("Hjollder_Quest","GLOBAL",2)
Global("HOW_COMPLETED","GLOBAL",1)
Global("Exp_Pause","GLOBAL",1)
OR(16)
AreaCheck("AR2100")
AreaCheck("AR2101")
AreaCheck("AR2102")
AreaCheck("AR2103")
AreaCheck("AR2104")
AreaCheck("AR2105")
AreaCheck("AR2106")
AreaCheck("AR2107")
AreaCheck("AR2108")
AreaCheck("AR2109")
AreaCheck("AR2110")
AreaCheck("AR2111")
AreaCheck("AR2112")
AreaCheck("AR2113")
AreaCheck("AR2115")
AreaCheck("AR2116")
Global("AR2100_visited","GLOBAL",1)~ + ~I'll meet you at the Evening Shade.~ DO ~EscapeAreaMove("AR2114",235,211,NE) SetGlobal("KickedOut","LOCALS",1)~ EXIT
+ ~!Global("Master_Quest","GLOBAL",1)
!Global("Master_Quest","GLOBAL",2)
!Global("Master_Quest","GLOBAL",3)
!Global("Master_Quest","GLOBAL",4)
!Global("Master_Quest","GLOBAL",5)
!Global("Master_Quest","GLOBAL",6)
!Global("Master_Quest","GLOBAL",7)
OR(3)
!GlobalGT("Hjollder_Quest","GLOBAL",2)
Global("HOW_COMPLETED","GLOBAL",1)
Global("Exp_Pause","GLOBAL",1)
!AreaCheck("AR2100")
!AreaCheck("AR2101")
!AreaCheck("AR2102")
!AreaCheck("AR2103")
!AreaCheck("AR2104")
!AreaCheck("AR2105")
!AreaCheck("AR2106")
!AreaCheck("AR2107")
!AreaCheck("AR2108")
!AreaCheck("AR2109")
!AreaCheck("AR2110")
!AreaCheck("AR2111")
!AreaCheck("AR2112")
!AreaCheck("AR2113")
!AreaCheck("AR2114")
!AreaCheck("AR2115")
!AreaCheck("AR2116")
Global("AR2100_visited","GLOBAL",1)~ + ~Go back to Kuldahar for now. I'll meet you at the Evening Shade.~ DO ~EscapeAreaMove("AR2114",235,211,NE) SetGlobal("KickedOut","LOCALS",1)~ EXIT

CHAIN IF WEIGHT #-1 ~Global("KickedOut","LOCALS",1)~ THEN C0MMinP MINERVA-REJOIN
~哦，你好呀！你是来接我的吗？~
END
++ ~对，加入我。~ DO ~SetGlobal("KickedOut","LOCALS",0) JoinParty()~ EXIT
++ ~不，还不是时候。~ EXIT
++ ~我晚些再来接你。~ EXIT