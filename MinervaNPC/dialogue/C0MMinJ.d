BEGIN C0MMinJ
BEGIN C0Modr

// Blade of the Gathering Storm

CHAIN IF WEIGHT #-1 ~Global("C0MMinTalkGatheringStorm","GLOBAL",1)~ THEN C0MMinJ MINERVA-BLADETALK
~好刀。我以前见过几件这种东方样式的兵器，可这把是我见过最漂亮的。~
DO ~IncrementGlobal("C0MMinTalkGatheringStorm","GLOBAL",1)~
= ~介意我仔细瞧瞧吗？~
END
++ ~请便。~ + MINERVA-BLADETALK-1
++ ~小心点。里头灌的雷电之精可不是摆着看的。~ + MINERVA-BLADETALK-2
++ ~我觉得这不安全。要试等打起来再试。~ + MINERVA-BLADETALK-X

CHAIN C0MMinJ MINERVA-BLADETALK-X
~嘘。你真没劲。~
EXIT

CHAIN C0MMinJ MINERVA-BLADETALK-1
~唔，配重不错……握把挺好……也不沉。不知道它飞起来怎么样……？嘿呀！~
= ~哇，手感真好。这才是我喜欢的兵器……哇——哇——哇呀！~
= ~你……你刚看见没？它自己回到我手里了……我刚抓住一道闪电！太厉害了！~
END
++ ~我看见了。相当了得。~ + MINERVA-BLADETALK-3
++ ~幸好你接住了。~ + MINERVA-BLADETALK-4
++ ~好了，别玩了。那不是玩具。~ + MINERVA-BLADETALK-X

CHAIN C0MMinJ MINERVA-BLADETALK-2
~嗯，我知道。放心，我自从……呃，这么说吧，好久没出过致命的手误了。~
EXTERN C0MMinJ MINERVA-BLADETALK-1

CHAIN C0MMinJ MINERVA-BLADETALK-3
~哦，我一定要拿它在实战里试试。那得多好玩！~
EXIT

CHAIN C0MMinJ MINERVA-BLADETALK-4
~我当然接住了！我从不失手……除非我是故意的。~
EXTERN C0MMinJ MINERVA-BLADETALK-3

// Optional Talk: Lucky Knucky

CHAIN IF WEIGHT #-1 ~Global("C0MMinTalkFishboneCraft","GLOBAL",1)~ THEN C0MMinJ MINERVA-FISHBONE-CRAFT
~喂，<PLAYER1>，咱们手上这块硬头鳟可真不错。~ [C0BLANK]
= ~它可比看起来值钱多了。十镇的人拿这种骨头雕出精美骨雕，是出了名的。~
DO ~IncrementGlobal("C0MMinTalkFishboneCraft","GLOBAL",1)~
= ~我在东港待着的时候学了点雕刻。我只是个业余的，不过不如让我拿这些做点什么？说不定能给咱们的旅途做个好运符！~
END
++ ~当然，做吧。我挺想看你做出什么。~ + MINERVA-FISHBONE-CRAFT-1
++ ~不，我要卖掉。它们肯定值钱。~ + MINERVA-FISHBONE-CRAFT-2

CHAIN C0MMinJ MINERVA-FISHBONE-CRAFT-1
~太好了！我先收着。等我做完，你是第一个看到我杰作的人！~
DO ~SetGlobalTimer("C0MMinTalkFishboneCraftTimer","GLOBAL",ONE_DAY) TakePartyItem("fish") DestroyItem("fish")~ EXIT

CHAIN C0MMinJ MINERVA-FISHBONE-CRAFT-2
~你当然也可以那么办。不过我真的很想亲手做点拿得出手的东西！~
DO ~SetGlobal("C0MMinTalkFishboneCraft","GLOBAL",-1)~ EXIT

CHAIN IF WEIGHT #-1 ~Global("C0MMinTalkFishboneCraft","GLOBAL",2)
GlobalTimerExpired("C0MMinTalkFishboneCraftTimer","GLOBAL")~ THEN C0MMinJ MINERVA-FISHBONE-CRAFT2
~当当！漂亮吧？可以说是个「幸运骨」了。贴身带着，它会带来好运！~ [C0BLANK]
DO ~IncrementGlobal("C0MMinTalkFishboneCraft","GLOBAL",1) GiveItemCreate("c0mfish",Player1,1,0,0)~
= ~给，你拿着！你是领队，它给你带来的运气肯定能传开。哈哈！~
EXIT

// Optional Talk: After slaying goblins

CHAIN IF WEIGHT #-1 ~Global("C0MMinTalkFishbone","AR1000",1)~ THEN C0MMinJ MINERVA-FISHBONE
~嗯，那场仗没什么特别的。不过那些硬头鳟的骨头……能做点不错的象牙料。~ [C0BLANK]
= ~不说这个……<PLAYER1>，你打起来真不错。看来我跟着你没跟错！~
DO ~IncrementGlobal("C0MMinTalkFishbone","AR1000",1)~
END
++ ~你也一样。你的飞刀本事很出色。~ + MINERVA-FISHBONE-1
++ ~这样的仗以后有的是。~ + MINERVA-FISHBONE-2
++ ~也许吧。不过我本来指望你更行一点。~ + MINERVA-FISHBONE-3
++ ~现在没时间说。这些骨头该带回去。~ + MINERVA-FISHBONE-END

CHAIN C0MMinJ MINERVA-FISHBONE-END
~对，你说得对。走吧。~
EXIT

CHAIN C0MMinJ MINERVA-FISHBONE-1
~哎，谢谢。手眼协调一向是我的强项，而且它不只是用来瞄准。工匠的许多活儿都要求近乎外科手术级的精准。~
EXTERN C0MMinJ MINERVA-FISHBONE-4

CHAIN C0MMinJ MINERVA-FISHBONE-2
~嗯，我相信。可要是它们都像那场仗一样好打，咱们就没什么麻烦了……所以当然，接下来只会更难。经典冒险就是这么来的！~
EXTERN C0MMinJ MINERVA-FISHBONE-4

CHAIN C0MMinJ MINERVA-FISHBONE-3
~哦？这算是挑战了？<PLAYER1>，我很快就会让你把这话吞回去！~
EXTERN C0MMinJ MINERVA-FISHBONE-4

CHAIN C0MMinJ MINERVA-FISHBONE-4
~不过我不得不说，难得有人替我看着背后，真不错。二十尺外放倒人我没问题，可他们一近身就麻烦了。~
= ~再说，有人能聊天总是额外的好处。咱们把这次冒险弄得对两个人都够有意思！~
END
+ ~Global("C0MMinHadBlastKnives","GLOBAL",1)
!HasItem("C0MDagg1","C0MMin")
!HasItem("C0MDagg2","C0MMin")
!HasItem("C0MDagg3","C0MMin")~ + ~By the way... what are those bronze knives you were using? I don't think I've ever seen anything like them before.~ + MINERVA-FISHBONE-KNIVES
+ ~Global("C0MMinHadBlastKnives","GLOBAL",1)
OR(3)
HasItem("C0MDagg1","C0MMin")
HasItem("C0MDagg2","C0MMin")
HasItem("C0MDagg3","C0MMin")~ + ~By the way... what are those bronze knives you have? I don't think I've ever seen anything like them before.~ + MINERVA-FISHBONE-KNIVES
+ ~Global("C0MMinHadBlastKnives","GLOBAL",1)~ + ~我一向力图让人满意。~ EXIT
+ ~Global("C0MMinHadBlastKnives","GLOBAL",1)~ + ~不保证。~ EXIT 
IF ~!Global("C0MMinHadBlastKnives","GLOBAL",1)
!HasItem("C0MDagg1","C0MMin")
!HasItem("C0MDagg2","C0MMin")
!HasItem("C0MDagg3","C0MMin")~ EXIT

CHAIN C0MMinJ MINERVA-FISHBONE-KNIVES
~哦，那是我自己起名的「秘密武器」。它们的构造专门为一种特制的爆炸油留了位置。~
END
+ ~OR(2)
CheckStatGT(Player1,14,INT)
CheckStatGT(Player1,29,LORE)~ + ~I hear the Lantanese are expert alchemists. I assume the oil you use is different from the explosive oils I'm familiar with, too.~ + MINERVA-FISHBONE-KNIVES-1
+ ~!CheckStatGT(Player1,14,INT)
!CheckStatGT(Player1,29,LORE)~ + ~A Lantanese trade secret, I assume?~ + MINERVA-FISHBONE-KNIVES-2
++ ~我明白了。好吧，现在我知道了。走吧。~ EXIT

CHAIN C0MMinJ MINERVA-FISHBONE-KNIVES-1
~算是吧。不过与其说是「兰坦的商业机密」，不如说是我改造整理各种炼金配方拼出来的私人方子。~
EXTERN C0MMinJ MINERVA-FISHBONE-KNIVES-3

CHAIN C0MMinJ MINERVA-FISHBONE-KNIVES-2
~嗯……与其说是「兰坦的商业机密」，不如说是我改造整理各种炼金配方拼出来的私人方子。~
EXTERN C0MMinJ MINERVA-FISHBONE-KNIVES-3

CHAIN C0MMinJ MINERVA-FISHBONE-KNIVES-3
~严格说？我不该把炼金知识这么用。贡德教会不赞成造爆炸兵器，一般只许用在拆毁用途上。所以我就做一点点，封在这些刀的刀柄和刀身空腔里。到时候点着引信，扔出去。~
END
++ ~这对付路上碰到的危险家伙肯定有用。~ + MINERVA-FISHBONE-KNIVES-4
++ ~既然危险又受限制，你怎么能这么随便地造、随便地用？~ + MINERVA-FISHBONE-KNIVES-5
++ ~我听够了。咱们最好回镇上。~ EXIT

CHAIN C0MMinJ MINERVA-FISHBONE-KNIVES-4
~我想的正是一样。哪天咱们要是得跟条龙之类的打，也许就派上用场了，嗯？哈哈，那可真是一场好仗。~
EXIT

CHAIN C0MMinJ MINERVA-FISHBONE-KNIVES-5
~嗯……严格说我不该做，所以你别到处去传我的秘密。不过我会很小心地控制。只要我不大量地造、不拿桶卖，就没人受伤。我是说，不该受伤的人不会。~
= ~再说，不许用起来的知识并不真有用，对吧？我要是学了一堆却不拿来用，就白学了。~
EXIT

// Optional Talk: After clearing Cave

CHAIN IF WEIGHT #-1 ~Global("C0MMinTalkContract","AR1201",1)~ THEN C0MMinJ MINERVA-FISHBONE
~哎……那队商队太惨了。至少咱们把祸根清了，救下了剩下的物资……希望会有人来处理这事。~ [C0BLANK]
DO ~IncrementGlobal("C0MMinTalkContract","AR1201",1)~
= ~顺便说，我想加斯帕会想看那份契约。他要是不知道出了什么事，日子会很难过。~
EXIT

// Optional Talk: Finding Erevain's Sword

CHAIN IF WEIGHT #-1 ~Global("C0MMinErevainSword","AR4001",1)~ THEN C0MMinJ MINERVA-EREVAIN-SWORD
~哦不……那把剑是埃瑞文的。看来这真是他。伤成那样，我几乎认不出来。~ [C0BLANK]
DO ~IncrementGlobal("C0MMinErevainSword","AR4001",1)~
END
+ ~Global("Erevain_Met","GLOBAL",1)~ + ~神啊，他到底怎么会到这儿来？~ + MINERVA-EREVAIN-SWORD-1
+ ~!Global("Erevain_Met","GLOBAL",1)~ + ~我猜你认识他？~ + MINERVA-EREVAIN-SWORD-2
+ ~Global("Erevain_Met","GLOBAL",1)~ + ~我跟他只见过短短一会儿，可他看着是个不错的人。真是悲剧。~ + MINERVA-EREVAIN-SWORD-3
+ ~Global("Erevain_Met","GLOBAL",1)~ + ~冒险的奇妙之处，也不过如此。~ + MINERVA-EREVAIN-SWORD-3
+ ~!Global("Erevain_Met","GLOBAL",1)~ + ~看来这儿的怪物把他收拾得不轻。~ + MINERVA-EREVAIN-SWORD-4
+ ~Global("Erevain_Met","GLOBAL",1)~ + ~我跟他不熟，谈不上什么感觉。咱们有更要紧的事得操心。~ EXIT
+ ~!Global("Erevain_Met","GLOBAL",1)~ + ~不过是路上又一具尸体。咱们有更要紧的事得操心。~ EXIT

CHAIN C0MMinJ MINERVA-EREVAIN-SWORD-1
~我——我不知道。也许他听说这边出了事，决定过来帮忙。他像是那种会这么做的人。~
EXTERN C0MMinJ MINERVA-EREVAIN-SWORD-3

CHAIN C0MMinJ MINERVA-EREVAIN-SWORD-2
~我们见过……很短。在东港的旅店里，他住我隔壁房。我知道他的名字，可没什么机会真认识他。~
EXTERN C0MMinJ MINERVA-EREVAIN-SWORD-4

CHAIN C0MMinJ MINERVA-EREVAIN-SWORD-3
~*叹气* 要是他跟咱们一起来，而不是自己出去就好了。精灵有时候为什么非得这么倔？~
= IF ~Race(Player1,ELF)~ THEN ~Erm... not you, <PLAYER1>, of course. I'm glad you're not like that. I'd hate to imagine you dying in a place like this, all alone.~
EXTERN C0MMinJ MINERVA-EREVAIN-SWORD-5

CHAIN C0MMinJ MINERVA-EREVAIN-SWORD-4
~他真是一个人来这儿想干点什么？想想如果先碰上咱们，他大概还活着。~
EXTERN C0MMinJ MINERVA-EREVAIN-SWORD-5

CHAIN C0MMinJ MINERVA-EREVAIN-SWORD-5
~我一直觉得，冒险只有能跟朋友分享才值得。不只是为了有话说，更要紧的是……能互相护着。~
= ~不然像这样死掉……挺可怜的，你不觉得吗？~
EXIT

// Optional Talk: False Eldathyns

CHAIN IF WEIGHT #-1 ~Global("C0MMinFalseEldath","AR4004",1)~ THEN C0MMinJ MINERVA-FAKE-ELDATH
~唔……我不知道。这地方有点不对劲。~ [C0BLANK]
DO ~IncrementGlobal("C0MMinFalseEldath","AR4004",1)~
END
+ ~CheckStatGT(Player1,15,INT)~ + ~我同意。这地方显得太方便了。~ + MINERVA-FAKE-ELDATH-1
+ ~!CheckStatGT(Player1,15,INT)~ + ~哪儿不对劲？~ + MINERVA-FAKE-ELDATH-2
++ ~你想太多了。能有片刻安宁就该感激。~ EXIT

CHAIN C0MMinJ MINERVA-FAKE-ELDATH-1
~嗯。我想的正是一样。~
EXTERN C0MMinJ MINERVA-FAKE-ELDATH-2

CHAIN C0MMinJ MINERVA-FAKE-ELDATH-2
~除了这地方竟存在在一路撞见的那些东西底下，这座神庙被维持的样子还有哪儿透着大不对劲。~
== C0MMinJ IF ~GlobalGT("C0MMinTempusTemple","GLOBAL",0)~ THEN ~Remember what I said before about all temples having the same feeling of piety? Well... I'm not feeling that here. Not towards Eldath, anyway.~
== C0MMinJ ~Eldath's the goddess of peace, pools, springs and waterfalls. Are you seeing any of those here? I can't imagine loyal Eldathyn choosing a place like this to revere their goddess's ideals.~
== C0MMinJ ~I think we should ask Albion a few more questions. If he has something to hide, he'll let it slip sooner or later. Let's be ready for a fight, just in case.~
EXIT

// Optional Talk: Quartus

CHAIN IF WEIGHT #-1 ~Global("C0MMinQuartus","GLOBAL",1)~ THEN C0MMinJ MINERVA-QUARTUS
~对……对，我想我成了！夸图斯，这具身子怎么样？~ [C0BLANK]
DO ~IncrementGlobal("C0MMinQuartus","GLOBAL",1)~
== C0MODR ~*whirrs and clicks*~
== C0MMinJ ~Okay, that's great! You'll be able to help out now, right?~
== C0MODR ~*nods*~
END
+ ~OR(2)
CheckStatGT(Player1,15,INT)
CheckStatGT(Player1,40,LORE)~ + ~A modron?~ + MINERVA-QUARTUS-1
+ ~!CheckStatGT(Player1,15,INT)
!CheckStatGT(Player1,40,LORE)~ + ~What is this thing?~ + MINERVA-QUARTUS-1
++ ~那东西有用就用。我什么都不需要知道。~ EXIT

CHAIN C0MMinJ MINERVA-QUARTUS-1
~跟夸图斯打个招呼。这名字只是我给他起的，莫德伦一般没有各别的名字。我是在一座旧法师塔里发现这可怜家伙的，大概是被从前住那儿的人从他那界召来的。我不知道出了什么事，可他多半已经失了控，当时状况很糟。他连回自己那界都做不到，我就尽力把他修好，从那以后他就跟着我。~
== C0MMinJ ~His old body kinda... fell apart, though, a while before we met, and there wasn't much I could do about it. I tried a few replacements, but this is one very picky spirit. It took me up until now to replicate the same creation process from Mechanus using the few things I could understand from Quartus... after a looooot of trial and error.~
== C0MODR ~*whirring* *tap*~
== C0MMinJ ~Anyways, now that he's got his new body. He's willing to help us out. To be honest, he's not that great in a fight since he refuses to use anything other than that wrench, but... I'm not sure where he learned it from, but he can use a little bit of magic. It might've been done by whoever summoned him. Maybe. I can only barely understand most of the things he says.~
EXIT

// Optional Talk: Dorn's Deep

CHAIN IF WEIGHT #-1 ~Global("C0MMinDornsDeep","AR6002",1)~ THEN C0MMinJ MINERVA-DORNDEEP
~这儿出了什么事？这地方像被彻底糟蹋了。一个矮人都看不见！~ [C0BLANK]
DO ~IncrementGlobal("C0MMinDornsDeep","AR6002",1)~
END
++ ~也许拉瑞尔说过些话，讲矮人自己把自己毁了。~ + MINERVA-DORNDEEP-1
++ ~他们也许被逼得更往地底去了。~ + MINERVA-DORNDEEP-2
+ ~!Global("C0MMinRomanceActive","GLOBAL",1)
!Global("C0MMinRomanceActive","GLOBAL",2)
Race(Player1,DWARF)~ + ~I can't believe it. Did my kinsmen really do this to themselves?~ + MINERVA-DORNDEEP-3
+ ~OR(2)
Global("C0MMinRomanceActive","GLOBAL",1)
Global("C0MMinRomanceActive","GLOBAL",2)
Race(Player1,DWARF)~ + ~I can't believe it. Did my kinsmen really do this to themselves?~ + MINERVA-DORNDEEP-4
+ ~!Race(Player1,DWARF)~ + ~住在地底下就是这么蠢。~ + MINERVA-DORNDEEP-5
++ ~别出声，保持警觉。现在说话太危险。~ EXIT

CHAIN C0MMinJ MINERVA-DORNDEEP-1
~我不知道……矮人骄傲又固执，可背叛精灵？我想也有可能……谁都可能做出糟糕透顶的决定。~
EXTERN C0MMinJ MINERVA-DORNDEEP-5

CHAIN C0MMinJ MINERVA-DORNDEEP-2
~若真是那样，剩下的也不会多了。矮人是倔脾气，会为守住这么要紧的地方打到最后一个。~
EXTERN C0MMinJ MINERVA-DORNDEEP-5

CHAIN C0MMinJ MINERVA-DORNDEEP-3
~没事的，<PLAYER1>……真相总有可能跟咱们听说的不同。就算真是那样……也不代表你族人全都有罪。~
EXTERN C0MMinJ MINERVA-DORNDEEP-5

CHAIN C0MMinJ MINERVA-DORNDEEP-4
~（米涅瓦把手放在你肩上，给你安慰。）~
EXTERN C0MMinJ MINERVA-DORNDEEP-3

CHAIN C0MMinJ MINERVA-DORNDEEP-5
~我本来希望时间对这地方比对断手塔更宽厚些。不过至少精灵一直尽心守着他们的记忆。我能瞥见它当年该有多宏伟，整个过程我都惊叹不已。~
= ~多恩深渊如今这样……嗯，我看着剩下的这些，心里只觉得空。就算矮人是自找的——我还是不愿信——那也还是悲惨。~
END
+ ~Race(Player1,DWARF)~ + ~我要是能在这些厅堂还荣耀的时候看见它们就好了，而不是如今这样。~ + MINERVA-DORNDEEP-6
++ ~你说得对。这地方一点生气都没有。~ + MINERVA-DORNDEEP-6
+ ~!Race(Player1,ELF)~ + ~矮人若真背叛了精灵，那就是他们活该。~ + MINERVA-DORNDEEP-6
+ ~Race(Player1,ELF)~ + ~矮人若真背叛了我族人，那就是他们活该。~ + MINERVA-DORNDEEP-6
++ ~够了。这事以后再说。~ EXIT

CHAIN C0MMinJ MINERVA-DORNDEEP-6
~*叹气* 我以前老批评家人和朋友心胸太窄、只顾自己那点学问，可如今我得想，是不是守住自己那点东西、别全都丢掉，反倒更好。~
= ~哦，看看我说了多久，还在说……现在真不是时候，对吧？我不说了。~
EXIT

// Optional Talk: Ice Salamanders

CHAIN IF WEIGHT #-1 ~Global("C0MMinIceSalamander","AR7001",1)~ THEN C0MMinJ MINERVA-SALAMANDER
~哇。那不是条鲸鱼吗？我想不起来上次在路上见到这种家伙是什么时候。而它就……冻在那儿，可能是永远。~ [C0BLANK]
DO ~IncrementGlobal("C0MMinIceSalamander","AR7001",1)~
END
+ ~OR(2)
Class(Player1,RANGER_ALL)
Class(Player1,DRUID_ALL)
!Class(LastTalkedToBy,SHAMAN)~ + ~It's a travesty. A creature like this deserves better than to be preserved like a trophy.~ + MINERVA-SALAMANDER-1
++ ~这是我这辈子见过最扭曲的博物馆。~ + MINERVA-SALAMANDER-1
++ ~那真是鲸鱼？我从没见过。~ + MINERVA-SALAMANDER-2
++ ~看它多大！要是它还在动，我会吓死。~ + MINERVA-SALAMANDER-3
++ ~在我看来，也没那么了不起。~ + MINERVA-SALAMANDER-4
++ ~我现在没兴趣讨论海洋生物。~ EXIT

CHAIN C0MMinJ MINERVA-SALAMANDER-1
~这点我同意。不过我以前从没机会这么近距离看过这种东西……~
EXTERN C0MMinJ MINERVA-SALAMANDER-5

CHAIN C0MMinJ MINERVA-SALAMANDER-2
~嗯，确实是鲸鱼。你要是头一回见，我也不意外。~
EXTERN C0MMinJ MINERVA-SALAMANDER-5

CHAIN C0MMinJ MINERVA-SALAMANDER-3
~哦，这点我同意。它们那么大，只要张嘴就能把漂进来的东西吃掉。可怕。*打个寒颤*~
EXTERN C0MMinJ MINERVA-SALAMANDER-5

CHAIN C0MMinJ MINERVA-SALAMANDER-4
~真的？那我不知道得找到什么才能让你觉得了不起。大象？克拉肯？或者狮鹫？~
EXTERN C0MMinJ MINERVA-SALAMANDER-5

CHAIN C0MMinJ MINERVA-SALAMANDER-5
~想到这样的生物真真切切活在离你家很远的地方，就有种不真实感。想想我要是留在兰坦，你觉得我这辈子能见到鲸鱼吗？~
= ~其实这一路上见的大多数东西都是这样。会魔法的树、精灵废墟，现在又有个冰冻的水族馆……外头还有更多！~
= ~不过……这些生物就这么被悬在这儿，挺惨的。说不定它们还活着。我真希望能看见它们动起来。~
EXIT

// Optional Talk: Dwarf Puzzle

CHAIN IF WEIGHT #-1 ~Global("C0MMinDwarfPuzzle","GLOBAL",1)~ THEN C0MMinJ MINERVA-DWARF-PUZZLE
~嗯。奇怪。走的时候小心别踩着什么，<PLAYER1>……空气里有股雷电的味儿。看，我鼻子在抽。看见没？~ [C0BLANK]
DO ~IncrementGlobal("C0MMinDwarfPuzzle","GLOBAL",1)~
END
++ ~这像是某种谜题。有想法吗？~ + MINERVA-DWARF-PUZZLE-1
++ ~那我就……信你一回。~ EXIT

CHAIN C0MMinJ MINERVA-DWARF-PUZZLE-1
~嗯，这里面有些符号跟另一间屋那张桌子上的同一个样……~
END
+ ~OR(2)
CheckStatGT(Player1,30,LORE)
Race(Player1,DWARF)~ + ~That table had the symbols of Moradin, Clangeddin and Berronar Truesilver. Maybe we're supposed to match them with these ones?~ + MINERVA-DWARF-PUZZLE-2
+ ~!CheckStatGT(Player1,30,LORE)
!Race(Player1,DWARF)~ + ~That's probably a clue of some sort.~ + MINERVA-DWARF-PUZZLE-3

CHAIN C0MMinJ MINERVA-DWARF-PUZZLE-2
~嗯，我正要这么说。只是别踩错符号。我感觉那雷电的味儿不只是空气的事……~
EXIT

CHAIN C0MMinJ MINERVA-DWARF-PUZZLE-3
~唔……我以前去过几个矮人要塞。那张桌子上的符文肯定是摩拉丁、克兰格丁和贝罗娜·真银的记号。我想咱们是要把它们跟这儿地上的符号对上。~
= ~只是别踩错符号。我感觉那雷电的味儿不只是空气的事……~
EXIT

// Optional Talk: Golem Building Book

CHAIN IF WEIGHT #-1 ~Global("C0MMinGolemBook","GLOBAL",1)~ THEN C0MMinJ MINERVA-GOLEMS
~嗯，这又是什么？魔像手册？~ [C0BLANK]
DO ~IncrementGlobal("C0MMinGolemBook","GLOBAL",1)~
= ~*翻页* 哇，这可真是点有意思的东西。不过谁会把这种东西随手扔在这儿，我真想不通。这里头写下的命令词，足够让人闹出大乱子。~
= ~不过以后也许有用。我就把其中比较有用的记在脑子里，以防万一。~
EXIT

// Optional Talk: Squirrels

CHAIN IF WEIGHT #-1 ~Global("C0MMinSquirrels","GLOBAL",1)~ THEN C0MMinJ MINERVA-SQUIRRELS
~哎，看这些可怜的小松鼠。我觉得那盒子对它们来说太小了。~ [C0BLANK]
DO ~IncrementGlobal("C0MMinSquirrels","GLOBAL",1)~
= ~可要是把它们在这儿放掉，就太不负责了。总该有个更安全的地方……~
EXIT

// First Talk: Leaving Easthaven

CHAIN IF WEIGHT #-1 ~Global("C0MMinTalk1","GLOBAL",1)~ THEN C0MMinJ MINERVA-TALK1
~终于，都准备好了，可以出发了！咱们的第一次共同冒险在等着，<PLAYER1>。这不让人兴奋吗？~ [C0BLANK]
DO ~IncrementGlobal("C0MMinTalk1","GLOBAL",1)~
END
++ ~当然！我迫不及待想看有什么在等着咱们。~ + MINERVA-TALK1-1
++ ~很高兴看你这么有热情。~ + MINERVA-TALK1-2
++ ~冷静点。咱们不是出去玩闹的。~ + MINERVA-TALK1-3
++ ~我不在乎路上怎么样，只要给钱。~ + MINERVA-TALK1-4
++ ~现在不是你说这些兴奋话的时候。~ EXIT

CHAIN C0MMinJ MINERVA-TALK1-1
~这就对了！只要咱们相互照应，我肯定很快就有不少故事可讲。~
EXTERN C0MMinJ MINERVA-TALK1-5

CHAIN C0MMinJ MINERVA-TALK1-2
~当然！要不是带着笑和期待上路，干嘛要旅行？~
EXTERN C0MMinJ MINERVA-TALK1-5

CHAIN C0MMinJ MINERVA-TALK1-3
~嗯，严肃当然也有严肃的时候，可拜托，冒险才刚开始！你难道不愿拿出能鼓起的最大乐观来开始？~
EXTERN C0MMinJ MINERVA-TALK1-5

CHAIN C0MMinJ MINERVA-TALK1-4
~你要关心的是这个，那就想想可能找到多少宝藏！失落的、神秘的神器，每一件都有故事可讲。至少这个，总能让你有点高兴吧？~
EXTERN C0MMinJ MINERVA-TALK1-5

CHAIN C0MMinJ MINERVA-TALK1-5
~……哈哈，对不起。也许这么早我就热情过头了。毕竟咱们才刚认识。~
= ~我只是高兴，能有这机会找到志同道合的同伴一起走这一趟。我爱冒险，可我讨厌一个人冒险。~
END
++ ~我同意。有伴总是更好。~ + MINERVA-TALK1-6
++ ~你是一路一个人走到东港的？~ + MINERVA-TALK1-7
++ ~我喜欢有伴，不过话少一点我也受得住。~ + MINERVA-TALK1-8

CHAIN C0MMinJ MINERVA-TALK1-6
~我想的正是一样。没人并肩打架、分块面包、或者只是说话，就没那么有意思。~
END
++ ~你是一路一个人走到东港的？~ + MINERVA-TALK1-7
++ ~我喜欢有伴，不过话少一点我也受得住。~ + MINERVA-TALK1-8

CHAIN C0MMinJ MINERVA-TALK1-7
~嗯，一开始不是。我护送一支商队到卡厄迪内瓦尔赚了点钱，之后没找到别人愿意跟我一起去东港，我就自己上路了。~
= ~其实要不是看见你进城，我大概又自己上路了。东港虽然好玩，可钓鱼打地精对我来说不算什么新鲜事。~
END
++ ~你说你从兰坦来，对吧？那离北方可远。是什么把你带到这儿来的？~ + MINERVA-TALK1-9
++ ~话说到这儿够了。剩下的改天再说。~ + MINERVA-TALK1-8

CHAIN C0MMinJ MINERVA-TALK1-8
~哦，随你。反正路上说话的机会多得是。你要是没兴趣，也总会有别的愿意听的人。~
EXIT

CHAIN C0MMinJ MINERVA-TALK1-9
~这问题我迟早等着的。对，我是从兰坦过来的。当然不是直奔这儿，我在更南边经历了几件值得一提的冒险，可眼下我更想专注这段还没开始的故事。~
= ~我家姓闪辉，在家乡当发明家和教师，地位体面又安稳。我也在家族这行里干过一阵子，可过些时候就全成了套公式，一点提不起劲。我觉得把本事拿去实际派用场，在岛外更大的世界里，潜力多得多。~
= ~所以机会一到，我就放下桑巴兰学院那份舒服的教职，去做些实地考察，从剑湾一路走到这儿。如今我就站在这儿了。~
END
++ ~靠实践学习，我赞成。~ + MINERVA-TALK1-10
++ ~你是学者？看你这模样我可想不到。~ + MINERVA-TALK1-11
++ ~我想我对你了解够了。走吧。~ EXIT

CHAIN C0MMinJ MINERVA-TALK1-10
~嗯。不过我时不时还会怀念那阵子学习，虽然我的学术生涯比大多数人短。我学的一些本事到今天还有用。~
EXTERN C0MMinJ MINERVA-TALK1-12

CHAIN C0MMinJ MINERVA-TALK1-11
~挺意外吧？说实话在教室里我没多大不同，大概就是穿的衣服不一样。~
EXTERN C0MMinJ MINERVA-TALK1-12

CHAIN C0MMinJ MINERVA-TALK1-12
~哦，不过我看咱们已经聊了好一会儿了。该把要办的事办完，然后在暖和的地方好好歇一长觉，好为前面的路养足精神。~
EXIT

// Second Talk: Post-Avalanche

CHAIN IF WEIGHT #-1 ~Global("C0MMinTalk2","GLOBAL",1)~ THEN C0MMinJ MINERVA-TALK2
~哇。看这一片雪……事情过后才开始真真沉进心里，是吧？~ [C0BLANK]
DO ~IncrementGlobal("C0MMinTalk2","GLOBAL",1)~
END
++ ~确实。~ + MINERVA-TALK2-1
++ ~可怜的赫罗斯加。~ + MINERVA-TALK2-2
++ ~咱们活下来了。这就够了。~ + MINERVA-TALK2-3
++ ~现在说话是浪费时间。~ + MINERVA-TALK2-END

CHAIN C0MMinJ MINERVA-TALK2-1
~我跟探险队里几乎每个人都聊过。我还答应过几个人，走完这趟请他们吃顿饭。哈哈……看来是办不到了。~
= ~说实话，我完全没料到咱们的旅程会这样开始。从埋伏到雪崩这一整串……我不觉得只是巧合。~
END
+ ~OR(2)
CheckStatGT(Player1,15,INT)
CheckStatGT(Player1,15,WIS)~ + ~I agree. It all seemed too well planned.~ + MINERVA-TALK2-4
+ ~!CheckStatGT(Player1,15,INT)
!CheckStatGT(Player1,15,WIS)~ + ~I'm not sure. Now that you mention it, though...~ + MINERVA-TALK2-4
++ ~要是这是想弄死咱们的计划，有人得为此付账。~ + MINERVA-TALK2-4
++ ~你看着心有余悸。你没事吧？~ + MINERVA-TALK2-5
++ ~够了。到库尔达哈还有段路呢。~ + MINERVA-TALK2-END

CHAIN C0MMinJ MINERVA-TALK2-2
~赫罗斯加、阿卡莉娅、希尔德雷丝……都死了。~
EXTERN C0MMinJ MINERVA-TALK2-1

CHAIN C0MMinJ MINERVA-TALK2-3
~可——不，咱们还活着，我当然高兴。可是……~
EXTERN C0MMinJ MINERVA-TALK2-1

CHAIN C0MMinJ MINERVA-TALK2-4
~不过那只是猜的。也许咱们只是运气实在、实在太差。~
EXTERN C0MMinJ MINERVA-TALK2-6

CHAIN C0MMinJ MINERVA-TALK2-5
~我想我会没事的。只是这会儿有点心神不定。~
EXTERN C0MMinJ MINERVA-TALK2-6

CHAIN C0MMinJ MINERVA-TALK2-6
~我猜这对咱们俩大概都不是头一回差点送命。可身边死了这么多人，冒险的兴致总有点被浇了水，不是吗？~
= ~不过话说回来……我很高兴我活着，而且不是只剩我一个。既然活着就剩咱们俩，那大概就是要一起走下去，对吧？~
END
+ ~Global("C0MMinMatch","GLOBAL",1)~ + ~我很高兴你活着。要是失去你，我会很伤心。~ DO ~IncrementGlobal("C0MMinFlirt","GLOBAL",1)~ + MINERVA-TALK2-FLIRT
++ ~从今往后咱们就互相依靠了。~ + MINERVA-TALK2-7
++ ~我想是吧，至少眼下。~ + MINERVA-TALK2-7
++ ~你不会是我的第一选择，不过凑合也能更差。~ + MINERVA-TALK2-8

CHAIN C0MMinJ MINERVA-TALK2-FLIRT
~哈哈。哦，别说了。咱们才认识没多久。~
= ~不过话虽如此……知道我已经给你留下这么深的印象，还挺好的。我也很高兴你活着。~
EXTERN C0MMinJ MINERVA-TALK2-9

CHAIN C0MMinJ MINERVA-TALK2-7
~嗯。只要咱们在一起，我就替你看着背后。~
EXTERN C0MMinJ MINERVA-TALK2-9

CHAIN C0MMinJ MINERVA-TALK2-8
~噗。咱们刚从生死关头出来，你就说这个？好吧，既然只剩咱们俩，我就原谅你。~
EXTERN C0MMinJ MINERVA-TALK2-9

CHAIN C0MMinJ MINERVA-TALK2-9
~来吧，咱们往东走。库尔达哈应该不远，我听说那儿很美。~
END
IF ~!GlobalGT("C0MMinFlirt","GLOBAL",0)~ EXIT
IF ~GlobalGT("C0MMinFlirt","GLOBAL",0)~ EXTERN C0MMinJ MINERVA-TALK2-FLIRT-2

CHAIN C0MMinJ MINERVA-TALK2-FLIRT-2
~我想咱们俩一起去看看。~
EXIT

CHAIN C0MMinJ MINERVA-TALK2-END
~好……当然。我马上就来。~
EXIT

// Third Talk: Entering Kuldahar

CHAIN IF WEIGHT #-1 ~Global("C0MMinTalk3","GLOBAL",1)~ THEN C0MMinJ MINERVA-TALK3
~哦，天哪……库尔达哈真美！你要是事先告诉我，在咱们走过的冰原中间有这样的地方，我绝不会信。~ [C0BLANK]
DO ~IncrementGlobal("C0MMinTalk3","GLOBAL",1)~
END
+ ~Class(Player1,DRUID_ALL)
!Class(LastTalkedToBy,SHAMAN)~ + ~The Tree is truly a great gift bestowed by Nature.~ + MINERVA-TALK3-1
++ ~这趟值了。~ + MINERVA-TALK3-1
++ ~我真不敢相信这儿这么暖和。~ + MINERVA-TALK3-1
++ ~大树和绿植。没什么稀奇的。~ + MINERVA-TALK3-2
++ ~咱们不是来观光的。~ EXIT

CHAIN C0MMinJ MINERVA-TALK3-1
~对……~
END
IF ~!GlobalGT("C0MMinFlirt","GLOBAL",0)~ EXTERN C0MMinJ MINERVA-TALK3-3
IF ~GlobalGT("C0MMinFlirt","GLOBAL",0)~ EXTERN C0MMinJ MINERVA-TALK3-FLIRT

CHAIN C0MMinJ MINERVA-TALK3-2
~哦，拜托。你的惊叹心去哪儿了，<PLAYER1>？~
END
IF ~!GlobalGT("C0MMinFlirt","GLOBAL",0)~ EXTERN C0MMinJ MINERVA-TALK3-3
IF ~GlobalGT("C0MMinFlirt","GLOBAL",0)~ EXTERN C0MMinJ MINERVA-TALK3-FLIRT

CHAIN C0MMinJ MINERVA-TALK3-FLIRT
~（米涅瓦靠到你身边，朝你满意地笑。）~
EXTERN C0MMinJ MINERVA-TALK3-3

CHAIN C0MMinJ MINERVA-TALK3-3
~这地方拿来跟某人过个美好浪漫的夜晚再合适不过。漂亮、暖和、安静……~
= ~不过我总觉得，待久了就再也不想走。又何必走呢？~
END
+ ~Global("C0MMinMatch","GLOBAL",1)~ + ~浪漫的夜晚，是吧？咱们何不现在就找个地方？~ DO ~IncrementGlobal("C0MMinFlirt","GLOBAL",1)~ + MINERVA-TALK3-FLIRT-2
++ ~你说得对。这儿太安宁了，我倒想留下。~ + MINERVA-TALK3-4
++ ~你觉得冒险结束后你会留下吗？~ + MINERVA-TALK3-5
++ ~我更想要座大宅子，丝绸床单，还有喝不完的酒。~ + MINERVA-TALK3-6
++ ~够了。以后有空再慢慢逛。~ EXIT

CHAIN C0MMinJ MINERVA-TALK3-FLIRT-2
~什——什么？哈哈哈……不、不，我不是那个意思！我是说，我倒不介意，可现在是时候吗？~
EXTERN C0MMinJ MINERVA-TALK3-7

CHAIN C0MMinJ MINERVA-TALK3-4
~我不是能在一个地方久待的人，可我羡慕有机会住在这儿的人。~
EXTERN C0MMinJ MINERVA-TALK3-7

CHAIN C0MMinJ MINERVA-TALK3-5
~不。我是说，也许哪天我走遍世界走累了……不过那种事发生的可能很低。~
EXTERN C0MMinJ MINERVA-TALK3-7

CHAIN C0MMinJ MINERVA-TALK3-6
~那样大概很舒服。不过我自己会觉得有点过头。我生活里不需要那种排场。~
EXTERN C0MMinJ MINERVA-TALK3-7

CHAIN C0MMinJ MINERVA-TALK3-7
~要是我干脆停下，就在这儿安顿……盖间小屋，交些朋友，靠做点小机关让别人的日子好过些来谋生……~
= ~哈哈。听着不错，可这跟我丢在兰坦的日子差不太多。迟早我还是会晃出去找下一场冒险。不过能撑多久就享受多久吧。~
= ~好了，白日梦先做到这儿。看看库尔达哈到底有多少东西可看！~
EXIT

// Fourth Talk: Entering a Tomb

CHAIN IF WEIGHT #-1 ~Global("C0MMinTalk4","GLOBAL",1)~ THEN C0MMinJ MINERVA-TALK4
~哈哈……我还在想咱们什么时候会进墓穴或地窖之类的地方。不跟不安分的死者拼上性命，就不算真冒险。~ [C0BLANK]
DO ~IncrementGlobal("C0MMinTalk4","GLOBAL",1)~
END
++ ~说实话，我能少打扰死者就少打扰。~ + MINERVA-TALK4-1
++ ~让我想想。地精、兽人、亡灵……我看那条龙迟早要来。~ + MINERVA-TALK4-2
++ ~我唯一关心的是这些死者陪葬了什么值钱东西。~ + MINERVA-TALK4-3
++ ~米涅瓦，满是亡灵的地窖可不是我心目中聊天的最佳场所。~ EXIT

CHAIN C0MMinJ MINERVA-TALK4-1
~哦，同意。百分之百。我想咱们生活里少点行尸走肉都好。~
EXTERN C0MMinJ MINERVA-TALK4-4

CHAIN C0MMinJ MINERVA-TALK4-2
~哈哈。要是龙真来了，我就往它两眼之间扔把刀，听天由命。或者瞄心脏更管用？说不定我一刀就能放倒它。~
EXTERN C0MMinJ MINERVA-TALK4-4

CHAIN C0MMinJ MINERVA-TALK4-3
~你真想再把这些灵魂惹得更火？不过我承认我好奇。也许看一眼不要紧……反正它们本来就在想弄死咱们。~
EXTERN C0MMinJ MINERVA-TALK4-4

CHAIN C0MMinJ MINERVA-TALK4-4
~其实我有点松了口气。路上出了那事之后，我以为一切都会乱七八糟，可现在又开始像一场经典冒险了。~
= ~不过你得知道，<PLAYER1>，我通常不会走进满是亡灵的地窖。至少不会在没有可信同伴的时候。~
END
++ ~那是不是说，你信我？~ + MINERVA-TALK4-5
++ ~别担心。我会保你平安。~ + MINERVA-TALK4-6
++ ~要是到头来只能活一个，我保自己。先跟你说清楚。~ + MINERVA-TALK4-7
++ ~话够了。~ EXIT

CHAIN C0MMinJ MINERVA-TALK4-5
~其实我信，要是这能让你好受些。~
EXTERN C0MMinJ MINERVA-TALK4-8

CHAIN C0MMinJ MINERVA-TALK4-6
~谢谢！听你这么说，我信心足多了。~
EXTERN C0MMinJ MINERVA-TALK4-8

CHAIN C0MMinJ MINERVA-TALK4-7
~噫。我……希望不会到那一步。~
EXTERN C0MMinJ MINERVA-TALK4-8

CHAIN C0MMinJ MINERVA-TALK4-8
~我信你替我看着背后，你也尽可信我别让咱们在哪儿绊着根线，然后被地里飞出来的飞镖长矛弄死。我肯定咱们能撑过今天。~
EXIT

// Fifth Talk: Inner Sanctum

CHAIN IF WEIGHT #-1 ~Global("C0MMinTalk5","GLOBAL",2)~ THEN C0MMinJ MINERVA-TALK5
~这事儿越来越邪门，是吧？~ [C0BLANK]
DO ~IncrementGlobal("C0MMinTalk5","GLOBAL",1)~
END
++ ~还用你说。~ + MINERVA-TALK5-1
++ ~我一直有种沉下去的感觉，这宝石不会那么好找。~ + MINERVA-TALK5-1
++ ~我感觉咱们还没到邪门的头儿。~ + MINERVA-TALK5-2
++ ~现在不行，米涅瓦。~ EXIT

CHAIN C0MMinJ MINERVA-TALK5-1
~嗯，事情什么时候顺过你的意？干久了你就得习惯事情会出岔子。~
EXTERN C0MMinJ MINERVA-TALK5-3

CHAIN C0MMinJ MINERVA-TALK5-2
~哈哈。你大概说得对。可话说回来，大多数史诗冒险不就是这样吗？~
EXTERN C0MMinJ MINERVA-TALK5-3

CHAIN C0MMinJ MINERVA-TALK5-3
~嘿，不过别担心！事情出岔子的时候，冒险才真开始带劲。这我有经验。~
END
+ ~PartyHasItem("POISON")~ + ~你说得对。对了，你知道这小瓶里是什么吗？~ + MINERVA-TALK-5-4
+ ~PartyHasItem("POISON")~ + ~那个先放一边……关于咱们找到的这神秘液体，愿不愿意分享你的「经验」？~ + MINERVA-TALK-5-4
+ ~!PartyHasItem("POISON")~ + ~我真心希望你没错。~ EXIT
+ ~!PartyHasItem("POISON")~ + ~咱们要去的地方，需要更多这种乐观。~ EXIT

CHAIN C0MMinJ MINERVA-TALK-5-4
~唔。别全信我，不过我觉得是某种蛇毒。我不确定这能意味着什么，不过想想也挺怪……蛇毒不是大多数人会随身带的东西，因为它效力撑不了多久，所以……唔……~
= ~嗯，带回给阿伦德尔吧。他肯定能琢磨出点什么。~
EXIT

// Sixth Talk: Dragon's Eye Exterior

CHAIN IF WEIGHT #-1 ~Global("C0MMinTalk6","GLOBAL",1)~ THEN C0MMinJ MINERVA-TALK6
~咱们一起走了好一阵了，<PLAYER1>，我刚发现……咱们彼此了解的其实并不多，对吧？~ [C0BLANK]
DO ~IncrementGlobal("C0MMinTalk6","GLOBAL",1)~
END
++ ~不多，可我倒希望多点。~ + MINERVA-TALK6-1
++ ~嗯……你何不现在就跟我讲讲你自己？~ + MINERVA-TALK6-2
++ ~关于你，没什么我想知道的。~ + MINERVA-TALK6-X
++ ~我倒想多了解你，可这儿真不是说话的地方。~ + MINERVA-TALK6-0

CHAIN C0MMinJ MINERVA-TALK6-1
~哦，你说了！那我就把该知道的都告诉你！~
EXTERN C0MMinJ MINERVA-TALK6-2

CHAIN C0MMinJ MINERVA-TALK6-2
~嗯，从哪儿说起……你知道，我来自兰坦。可事实是我并不是在那儿出生的。这你大概猜不到吧？~
= ~我父亲是学者，常去别的国家游历，我母亲是深水城的裁缝。其实我生在深水城，可父母在我很小的时候就把我带到兰坦，所以那地方我几乎不记得。~
= ~我二十岁进造物学院读书，二十五岁毕业，之后差不多三十年替国内各家行会做事。说实话挺无聊。我真正投身冒险是……哦，到如今该有十年了。我上了开往谷地的船，基本上再没回过头。~
END
++ ~那你现在到底多大？~ + MINERVA-TALK6-3
++ ~那你离家一定很久了。~ + MINERVA-TALK6-4
++ ~话到这儿够了。以后咱们再互相讲经历。~ + MINERVA-TALK6-0
++ ~我没让你讲你的一生。~ + MINERVA-TALK6-X

CHAIN C0MMinJ MINERVA-TALK6-3
~八十五。不过我看着不像，对吧？我觉得我一直挺照顾自己的。~
END
+ ~!Race(Player1,GNOME)~ + ~就算按侏儒算，你看着也没那么老。~ + MINERVA-TALK6-3a
+ ~Race(Player1,GNOME)~ + ~就算按咱们这一族算，你看着也没那么老。~ + MINERVA-TALK6-3a
++ ~真的。你的举止肯定不像这岁数。~ + MINERVA-TALK6-3b
++ ~我没问。别说了。~ + MINERVA-TALK6-X

CHAIN C0MMinJ MINERVA-TALK6-3a
~哈哈。我这模样随我母亲。她老得很慢。要是她站我旁边，你说不定会把咱们当成姐妹。~
EXTERN C0MMinJ MINERVA-TALK6-3c

CHAIN C0MMinJ MINERVA-TALK6-3b
~谢谢！我一直努力不显老，那我就把这当夸奖了。~
EXTERN C0MMinJ MINERVA-TALK6-3c

CHAIN C0MMinJ MINERVA-TALK6-3c
~我觉得这跟我爱冒险有很大关系。我保持活动、练自己、维持体格……我要是想活得够久看遍世界，就得这么做。~
= IF ~Global("C0MMinMatch","GLOBAL",1)~ THEN ~Looking good's just a nice side benefit. Haha.~
END
++ ~你考虑过安顿下来吗？~ + MINERVA-TALK6-5
++ ~那你离家一定很久了。~ + MINERVA-TALK6-4
++ ~你的其他事以后再说。~ + MINERVA-TALK6-0
++ ~我没让你讲你的一生。~ + MINERVA-TALK6-X

CHAIN C0MMinJ MINERVA-TALK6-4
~我时不时回兰坦。不过最近回得少了。到如今大概五年了。或者更久？唔，不确定。~
END
++ ~你不想家人吗？~ + MINERVA-TALK6-4a
++ ~太沉迷冒险了？~ + MINERVA-TALK6-4b
++ ~随便。闭嘴吧。~ + MINERVA-TALK6-X

CHAIN C0MMinJ MINERVA-TALK6-4a
~我有时会想我爹娘。还有我两个哥哥，和我小妹。可他们都懂。再说我知道他们总在那儿。我想回去看他们，随时都能回去。~
= ~不过眼下？我只想把日子过得尽兴。在我看来，最好的办法就是尽可能胆大。~
END
++ ~你考虑过安顿下来吗？~ + MINERVA-TALK6-5
++ ~那你到底多大？你看着确实年轻。~ + MINERVA-TALK6-3
++ ~你的其他事以后再说。~ + MINERVA-TALK6-0
++ ~我没让你讲你的一生。~ + MINERVA-TALK6-X

CHAIN C0MMinJ MINERVA-TALK6-4b
~差不多。~
EXTERN C0MMinJ MINERVA-TALK6-4a

CHAIN C0MMinJ MINERVA-TALK6-5
~我试过。差一点就成了！还撑了好几年呢。~
END
++ ~你试过？~ + MINERVA-TALK6-6
++ ~真让人意外。~ + MINERVA-TALK6-6
++ ~细节我改天再问你。~ + MINERVA-TALK6-0

CHAIN C0MMinJ MINERVA-TALK6-6
~光看我这模样，你永远看不出来，对吧？可这是真的！我差一点就成了。甚至还结了婚。~
END
+ ~Global("C0MMinMatch","GLOBAL",1)~ + ~哦。我……没想到。~ + MINERVA-TALK6-7
++ ~你结婚了？~ + MINERVA-TALK6-7

CHAIN C0MMinJ MINERVA-TALK6-7
~嗯……我*结过*婚。如今都成往事了。~
END
++ ~我想知道这事。~ + MINERVA-TALK6-8

CHAIN C0MMinJ MINERVA-TALK6-8
~当然。不过也不是什么特别有意思的人生故事。~
= ~那时我大概六十岁。我还年轻，可那时就已经感到那种想上路的痒。父母看我这样没什么目标，不太高兴，就在桑巴兰学院给我弄了个教职，好让我别再一辈子追着冒险跑。~
= ~有那么一阵还行。我有天分，也乐于鼓励兰坦的年轻学生成为熟练工匠。可我从来不满足。父母以为我只是孤单，就催我找个人一起过日子。~
= ~*叹气* 于是我就找了一个。他叫亚瑟·迪内尔斯特兰德，安克里尔的发明家。我是在一次去桑巴兰研究所时遇见他的，他在那儿当炼金师，做各种又危险又刺激的实验……我刀上用那种爆炸油？最初配方就是他配的。~
= ~他善良、勤快、聪明——而且很爱我。我想我也喜欢他……至少喜欢到让他追求我。我觉得他会是个能一起过一辈子的好人，虽然我对这念头并不怎么激动……所以他一求婚我就立刻答应了。我们结婚二十多年，还生了个孩子，男孩，取名凯罗斯。~
= ~要承认「喜欢亚瑟并不等于爱他」是件难事。而且尽管我疼凯罗斯，日子也不能说我不幸福，我最想要的还是登上一艘船，回到兰坦之外的世界去。~
DO ~SetGlobal("C0MMinKnowsFamily","GLOBAL",1)~
= ~结局你大概猜得到。亚瑟和我在想过什么样的日子上没法妥协。他的心属于兰坦，我的心……在外头。我们接受了这点，结束了婚姻，各自回到属于自己的生活。~
END
++ ~你那么做太不负责任了。~ + MINERVA-TALK6-9
++ ~我想你父母不会太高兴。~ + MINERVA-TALK6-10
++ ~你前夫和儿子现在怎么样？~ + MINERVA-TALK6-11
++ ~我听够了。咱们该走了。~ + MINERVA-TALK6-0

CHAIN C0MMinJ MINERVA-TALK6-9
~也许吧。我肯定不止一次这么想过。可我觉得更不负责任的做法，是硬把自己塞进那种日子。也许最不负责任的事，就是当初硬去适应它。~
EXTERN C0MMinJ MINERVA-TALK6-12

CHAIN C0MMinJ MINERVA-TALK6-10
~嗯，一开始他们很难接受。我是他们最疼的女儿，是神童。我却想去旅行，而不是把自己的天分献给兰坦。可他们是好人。到最后也没怪我。~
EXTERN C0MMinJ MINERVA-TALK6-12

CHAIN C0MMinJ MINERVA-TALK6-11
~我不确定。我到北方以后就没收到过他们的信。亚瑟肯定还在研究所埋头做事，说不定现在已经是大师级工匠了……凯罗斯大概在学院读书……凭我和亚瑟当年的名望，他一出生学院就给他留了位置吧。~
EXTERN C0MMinJ MINERVA-TALK6-12

CHAIN C0MMinJ MINERVA-TALK6-12
~那就是我以前的日子。没有爬地窖、找神器那么刺激，对吧？~
END
++ ~至少现在我对你多知道些了，我挺高兴。~ + MINERVA-TALK6-13
++ ~别人会不惜一切换你那种日子。~ + MINERVA-TALK6-14
++ ~我明白。有些人天生就不该安顿下来。~ + MINERVA-TALK6-15
++ ~这听着简直不值得。~ + MINERVA-TALK6-X

CHAIN C0MMinJ MINERVA-TALK6-13
~哦，那我高兴，至少没把你闷着。~
END
IF ~Global("C0MMinMatch","GLOBAL",1)~ THEN EXTERN C0MMinJ MINERVA-TALK6-ROM
IF ~!Global("C0MMinMatch","GLOBAL",1)~ THEN EXTERN C0MMinJ MINERVA-TALK6-16

CHAIN C0MMinJ MINERVA-TALK6-14
~你大概说得对。这么快就放弃一种有些人根本求不到的日子，我确实有点内疚。所以我不爱想这事。~
END
IF ~Global("C0MMinMatch","GLOBAL",1)~ THEN EXTERN C0MMinJ MINERVA-TALK6-ROM
IF ~!Global("C0MMinMatch","GLOBAL",1)~ THEN EXTERN C0MMinJ MINERVA-TALK6-16

CHAIN C0MMinJ MINERVA-TALK6-15
~哪天安顿下来我倒不介意……可眼下我还有太多东西要看，太多东西要学。~
END
IF ~Global("C0MMinMatch","GLOBAL",1)~ THEN EXTERN C0MMinJ MINERVA-TALK6-ROM
IF ~!Global("C0MMinMatch","GLOBAL",1)~ THEN EXTERN C0MMinJ MINERVA-TALK6-16

CHAIN C0MMinJ MINERVA-TALK6-16
~总之，我看咱们歇得够久了。不该进那个洞去找咱们一直在找的宝物吗？~
EXIT

CHAIN C0MMinJ MINERVA-TALK6-ROM
~可是……<PLAYER1>，这让你介意吗？我不仅结过婚、有过孩子，还甘愿把那些全丢下。~
END
++ ~你为什么问这个？~ + MINERVA-TALK6-ROM-1
++ ~不介意。你的过去就是你的过去，我更在意现在的你。~ + MINERVA-TALK6-ROM-2
+ ~GlobalGT("C0MMinFlirt","GLOBAL",0)~ + ~我要是早知道，就不会那样跟你调情了。~ + MINERVA-TALK6-ROM-3
++ ~我很高兴你告诉我，可既然知道了，我就没法安心跟你超出朋友的关系。~ + MINERVA-TALK6-ROM-3

CHAIN C0MMinJ MINERVA-TALK6-ROM-1
~以防万一……我不想让你被牵着走，结果发现咱们的日子根本合不来，或者哪天我为了自己离开你……~
== C0MMINJ IF ~GlobalGT("C0MMinFlirt","GLOBAL",0)~ THEN ~I know we've been teasing each other throughout our adventure so far, and I've liked it... but that's something I'm used to. I'm not going to demand anything more. I like you, <PLAYER1>, and I don't want to end up hurting you.~
== C0MMINJ ~But... if you're okay with that, or if we're more alike than I think... then maybe... I could think about starting anew. Maybe...~
END
++ ~我愿意，米涅瓦。~ + MINERVA-TALK6-ROM-2
++ ~你说得有道理。我不确定咱们彼此合适。~ + MINERVA-TALK6-ROM-3

CHAIN C0MMinJ MINERVA-TALK6-ROM-2
~哈哈……<PLAYER1>，你这下真让我意外了。我以为你肯定要放弃我了，看来总还有让人惊喜的机会……~
== C0MMINJ IF ~OR(3)
Race(Player1,HALFLING)
Race(Player1,GNOME)
Race(Player1,DWARF)~ THEN ~(Without warning, she leans forward and gives you a teasing peck on the cheek.)~
== C0MMINJ IF ~!Race(Player1,HALFLING)
!Race(Player1,GNOME)
!Race(Player1,DWARF)~ THEN ~(She motions you to lean down, as though she is trying to whisper something, only to give you a teasing peck on the cheek.)~
== C0MMINJ ~...Like that. Exactly like that. Haha!~
DO ~SetGlobal("C0MMinRomanceActive","GLOBAL",1)~ EXTERN C0MMinJ MINERVA-TALK6-16

CHAIN C0MMinJ MINERVA-TALK6-ROM-3
~嗯。我明白，<PLAYER1>。不往心里去。~
DO ~SetGlobal("C0MMinRomanceActive","GLOBAL",3)~ EXTERN C0MMinJ MINERVA-TALK6-16

CHAIN C0MMinJ MINERVA-TALK6-X
~哎哟。真够直截了当的，是吧？好吧，我不用是天才也知道自己的声音在哪儿不受欢迎。~
END
IF ~Global("C0MMinRomanceActive","GLOBAL",1)~ DO ~SetGlobal("C0MMinRomanceActive","GLOBAL",3) SetGlobal("C0MMinShutUp","GLOBAL",1)~ EXIT
IF ~!Global("C0MMinRomanceActive","GLOBAL",1)~ DO ~SetGlobal("C0MMinShutUp","GLOBAL",1)~ EXIT

CHAIN C0MMinJ MINERVA-TALK6-0
~好。我明白你的意思。那改天？~
EXIT

// Seventh Talk: Dragon's Eye - Level 3

CHAIN IF WEIGHT #-1 ~Global("C0MMinTalk7","GLOBAL",1)~ THEN C0MMinJ MINERVA-TALK7
~蜥蜴人一个接一个，亡灵一波接一波……照这速度，我刀先没了，敌人都还没打完。~ [C0BLANK]
DO ~IncrementGlobal("C0MMinTalk7","GLOBAL",1)~
END
++ ~你说得对。这越来越叫人腻烦。~ + MINERVA-TALK7-1
++ ~你要是用完了，剩下的交给我。~ + MINERVA-TALK7-2
++ ~有没有想过偶尔也贴身打一场？~ + MINERVA-TALK7-3
++ ~现在不行，米涅瓦。留意下一次埋伏就好。~ + MINERVA-TALK7-0

CHAIN C0MMinJ MINERVA-TALK7-0
~对，对。我看我该省几把刀，万一真有什么危险的东西冒出来，对吧？~
EXIT

CHAIN C0MMinJ MINERVA-TALK7-1
~我本想干脆把东西炸掉，可那……上回我试的时候效果不太好。~
EXTERN C0MMinJ MINERVA-TALK7-4

CHAIN C0MMinJ MINERVA-TALK7-2
~哦，别担心。刀用完了我通常就掏出我的百科全书，拿它敲怪物的膝盖。如今这本书大概就干这个用。~
EXTERN C0MMinJ MINERVA-TALK7-4

CHAIN C0MMinJ MINERVA-TALK7-3
~当然，偶尔打场好架我也享受。不过老捅膝盖很快就腻了。~
EXTERN C0MMinJ MINERVA-TALK7-4

CHAIN C0MMinJ MINERVA-TALK7-4
~总之，你觉得隧道尽头等着咱们的是什么？龙守着的宝藏？邪恶巫妖守着的魔法秘密？也许……恶魔？~
END
++ ~我希望是条龙。那这趟冒险对我就值了。~ + MINERVA-TALK7-5
++ ~宝藏听着不错。不过最好不用为它打一架。~ + MINERVA-TALK7-6
++ ~大概是巫妖。这就能解释那些骷髅了。~ + MINERVA-TALK7-7
++ ~按咱们的运气看，大概不太会是「恶魔」，更可能是一场「邪魔入侵」。~ + MINERVA-TALK7-8
++ ~龙、巫妖、恶魔……让它们来吧。越多越热闹。~ + MINERVA-TALK7-9
++ ~我想找间澡堂。不过那不太可能。~ + MINERVA-TALK7-10
++ ~瞎猜是浪费时间。很快就知道了。~ + MINERVA-TALK7-0

CHAIN C0MMinJ MINERVA-TALK7-5
~要是真是龙，你觉得它会先跟咱们说话再喷火吗？说不定它爱猜谜？~
EXTERN C0MMinJ MINERVA-TALK7-11

CHAIN C0MMinJ MINERVA-TALK7-6
~宝藏是好。可我这两条短腿从来没法把它全带上。不过我一直在设计个替我扛东西的玩意儿。也许用蜘蛛腿……唔。~
EXTERN C0MMinJ MINERVA-TALK7-11

CHAIN C0MMinJ MINERVA-TALK7-7
~咦。巫妖总让我发毛。全是骨头和诅咒……不过我在伊莱法恩一座地窖里遇见过一个，难得没想把我魂从身体里吸出来。还讲了些挺有意思的故事。~
EXTERN C0MMinJ MINERVA-TALK7-11

CHAIN C0MMinJ MINERVA-TALK7-8
~那对我来说倒是头一遭。我不确定自己备的刀够不够对付一支恶魔军。也许弄点爆炸武器终究不算坏主意。~
EXTERN C0MMinJ MINERVA-TALK7-11

CHAIN C0MMinJ MINERVA-TALK7-9
~想想他们有一天会怎么讲。「<PLAYER1>与米涅瓦，某某军团的毁灭者。」我好奇一队蜥蜴人、亡灵和别的怪物凑在一起该叫什么军团？~
EXTERN C0MMinJ MINERVA-TALK7-11

CHAIN C0MMinJ MINERVA-TALK7-10
~那*倒*是不错……不过把这些脏东西洗掉就可惜了。我觉得它给这趟旅程添了真实感。*嗅嗅* 虽然确实有味儿。~
EXTERN C0MMinJ MINERVA-TALK7-11

CHAIN C0MMinJ MINERVA-TALK7-11
~嗯，无论如何，不管这隧道尽头是什么，我都会跟你在一起。这点你尽可放心。~
= IF ~Global("C0MMinRomanceActive","GLOBAL",1)~ THEN ~I wouldn't want you of all people to die, you know?~
EXIT

// Eighth Talk: After killing Yxunomei

CHAIN IF WEIGHT #-1 ~Global("C0MMinTalk8","GLOBAL",1)~ THEN C0MMinJ MINERVA-TALK8
~这就是心石宝石！我一直好奇它长什么样……真漂亮。而且它带着一种暖意，那种……很难说清。比外面下着雪时坐在壁炉边还舒服。~ [C0BLANK]
DO ~IncrementGlobal("C0MMinTalk8","GLOBAL",1)~
END
++ ~你连评价一下咱们刚打败的玛丽利斯都不打算？~ + MINERVA-TALK8-1
++ ~这名字起得合适。它跳得就跟心脏一样。~ + MINERVA-TALK8-2
++ ~是块漂亮的宝石。我看不出有什么特别的。~ + MINERVA-TALK8-3
++ ~有话以后再说。那场仗把我累垮了。~ + MINERVA-TALK8-0

CHAIN C0MMinJ MINERVA-TALK8-0
~好，行。不过在心石送到阿伦德尔之前，归我抱着。作为一块魔法石，它暖得出奇，还挺好抱。~
EXIT

CHAIN C0MMinJ MINERVA-TALK8-1
~什么？哦，对。那倒不算太糟。她说的那些怪话把我吓着了，不过我相信以后知道得更多，就能明白些。至于心石……它像活的，就真像颗心。~
EXTERN C0MMinJ MINERVA-TALK8-4

CHAIN C0MMinJ MINERVA-TALK8-2
~嗯，像颗心。难怪是德鲁伊的神器。它几乎就像活的……也许它真是。~
EXTERN C0MMinJ MINERVA-TALK8-4

CHAIN C0MMinJ MINERVA-TALK8-3
~它肯定不只是块漂亮宝石。它就像……活的。就跟心脏一样。~
EXTERN C0MMinJ MINERVA-TALK8-4

CHAIN C0MMinJ MINERVA-TALK8-4
~不，不像心……更像一只眼……一只能一眼看尽任何东西、所有东西、四面八方的那只眼。~
END
++ ~你就抱着它一会儿，怎么看出这么多？~ + MINERVA-TALK8-5
++ ~这真叫人不安。现在我觉得它也在盯着我。~ + MINERVA-TALK8-6
++ ~够了。放到安全的地方。那不是拿来玩的。~ + MINERVA-TALK8-0

CHAIN C0MMinJ MINERVA-TALK8-5
~就当是工匠的直觉。就像我去哪儿都能嗅出危险和秘密。这跟呼吸一样自然。~
EXTERN C0MMinJ MINERVA-TALK8-7

CHAIN C0MMinJ MINERVA-TALK8-6
~哦，我肯定它没恶意，就算它在看。对吧，心石宝石？唔，也许我得给它起个更亲昵的名字……~
EXTERN C0MMinJ MINERVA-TALK8-7

CHAIN C0MMinJ MINERVA-TALK8-7
~唔，可惜我不能用它的魔法。我想知道的事太多了！比如下次冒险该去哪儿，比如哪儿能找到铂金龙，还有……~
= ~我要是愿意，甚至能看看自己的家。那不好吗？~
END
++ ~到底还是想家，是吧？~ + MINERVA-TALK8-8
++ ~那不会毁了冒险的神秘感吗？~ + MINERVA-TALK8-9
++ ~我不管。别把那东西掉了就行。~ + MINERVA-TALK8-0

CHAIN C0MMinJ MINERVA-TALK8-8
~当然。我真希望能回去，可那样我会觉得自己没把时间用在该用的地方。要是我能同时身在两地就好了！~
EXTERN C0MMinJ MINERVA-TALK8-10

CHAIN C0MMinJ MINERVA-TALK8-9
~唔……对。那也许我用不了这宝石是好事。我根本会停不下来！~
EXTERN C0MMinJ MINERVA-TALK8-10

CHAIN C0MMinJ MINERVA-TALK8-10
~嗯，把它带给阿伦德尔，让他施展它的魔法。我太想看它到底怎么运作了！~
EXIT

// Ninth Talk: Leaving Dragon's Eye

CHAIN IF WEIGHT #-1 ~Global("C0MMinTalk9","GLOBAL",1)~ THEN C0MMinJ MINERVA-TALK9
~呼……终于出了那些隧道。我觉得好几天没见着天了，虽然其实根本没这么久……我想。~ [C0BLANK]
DO ~IncrementGlobal("C0MMinTalk9","GLOBAL",1)~
END
++ ~也许真有那么久。毕竟这趟跋涉挺长。~ + MINERVA-TALK9-1
++ ~我这辈子从没这么高兴见到天空。~ + MINERVA-TALK9-2
++ ~咱们活着，这就最要紧。~ + MINERVA-TALK9-3
++ ~少说话，多走路。宝石没送回库尔达哈，咱们就不算完。~ + MINERVA-TALK9-0

CHAIN C0MMinJ MINERVA-TALK9-0
~*叹气* 你知道吗？这回我都不跟你争了。我也想回去。等咱们回去，旅店里最好有热茶备着！~
EXIT

CHAIN C0MMinJ MINERVA-TALK9-1
~唔……嘿，我的皮肤看着是不是白了点？在地底下待那么久，我觉得是白了。~
EXTERN C0MMinJ MINERVA-TALK9-4

CHAIN C0MMinJ MINERVA-TALK9-2
~对！我也一样。哦，谢谢你，美丽的天空，过了这么久还没丢下咱们！*深呼吸* 啊啊……新鲜空气从没这么好吃过。~
EXTERN C0MMinJ MINERVA-TALK9-4

CHAIN C0MMinJ MINERVA-TALK9-3
~嗯！而且手指脚趾一个都没少！~
EXTERN C0MMinJ MINERVA-TALK9-4

CHAIN C0MMinJ MINERVA-TALK9-4
~总之，你觉得咱们回到库尔达哈会有欢迎的庆祝吗？或者别的什么惊喜？~
END
++ ~当心，别乌鸦嘴。说不定下一件事就是怪物在等咱们。~ + MINERVA-TALK9-5
++ ~我希望有蛋糕。最好有蛋糕。~ + MINERVA-TALK9-6
++ ~大概没有。他们大概正拿咱们的存活几率下注呢。~ + MINERVA-TALK9-7
++ ~庆祝就不用了，谢了。我宁可先扑到床上躺一阵，至少躺到下一个任务。~ + MINERVA-TALK9-8

CHAIN C0MMinJ MINERVA-TALK9-5
~哈哈，那不可能。咱们刚把怪物都杀光了，记得吗？~
EXTERN C0MMinJ MINERVA-TALK9-9

CHAIN C0MMinJ MINERVA-TALK9-6
~哦，蛋糕。好主意。咱们该弄个蛋糕！~
EXTERN C0MMinJ MINERVA-TALK9-9

CHAIN C0MMinJ MINERVA-TALK9-7
~哈哈。谁会想押咱们输？~
EXTERN C0MMinJ MINERVA-TALK9-9

CHAIN C0MMinJ MINERVA-TALK9-8
~哦……你这么说，那倒不错。*嗅* 还有洗个澡。我身上糊满了各种脏东西。呃。~
EXTERN C0MMinJ MINERVA-TALK9-9

CHAIN C0MMinJ MINERVA-TALK9-9
~嗯，到了自己看吧。跑回库尔达哈，<PLAYER1>，我跟你比！~
= ~……再想想，这一整段路跑下来可远得……挺远的，对吧？我看咱们还是凑合着沿风景好的小道慢慢走吧。来！~
EXIT

// Tenth Talk: Severed Hand - 2nd Level

CHAIN IF WEIGHT #-1 ~Global("C0MMinTalk10","GLOBAL",1)~ THEN C0MMinJ MINERVA-TALK10
~多美的地方……就算成了废墟。当年一定美得让人屏息。~ [C0BLANK]
DO ~IncrementGlobal("C0MMinTalk10","GLOBAL",1)~
END
+ ~Race(Player1,ELF)~ + ~我真不敢相信我族人的土地就剩下这些。~ + MINERVA-TALK10-ELF
+ ~!Race(Player1,ELF)~ + ~看它这么残破，真是悲惨。~ + MINERVA-TALK10-1
++ ~这儿出了什么事？一切都这么不安宁。~ + MINERVA-TALK10-2
++ ~好一座辉煌的精灵要塞！真可悲。~ + MINERVA-TALK10-3
++ ~希望拉瑞尔还在这儿。~ + MINERVA-TALK10-4
++ ~没时间感慨。咱们得找到拉瑞尔。~ + MINERVA-TALK10-0

CHAIN C0MMinJ MINERVA-TALK10-ELF
~对不起，<PLAYER1>。这对你肯定格外难受。~
EXTERN C0MMinJ MINERVA-TALK10-1

CHAIN C0MMinJ MINERVA-TALK10-0
~对。希望他能解释这儿出了什么事……前提是他还在……~
EXIT

CHAIN C0MMinJ MINERVA-TALK10-1
~一个地方和它的人消亡，这是一回事，可这儿……这儿发生过远比那更糟的事。~
EXTERN C0MMinJ MINERVA-TALK10-5

CHAIN C0MMinJ MINERVA-TALK10-2
~我知道。这很奇怪……不是这地方被弃了。而是像……这儿所有人都出了事……同时、就那么……突然。~
EXTERN C0MMinJ MINERVA-TALK10-5

CHAIN C0MMinJ MINERVA-TALK10-3
~别说得那么可怕，<PLAYER1>。把这儿弄成这样的东西，一定……比我所能想象的都糟。~
EXTERN C0MMinJ MINERVA-TALK10-5

CHAIN C0MMinJ MINERVA-TALK10-4
~我肯定他还在。阿伦德尔这么说过，对吧？他对他最后……最后那点指引，肯定是有把握的。~
EXTERN C0MMinJ MINERVA-TALK10-5

CHAIN C0MMinJ MINERVA-TALK10-5
~<PLAYER1>，你听见了吗？几乎像空气本身在……哭。还在尖叫……那声音里有几百年的苦。~
END
+ ~Race(Player1,ELF)~ + ~我听见精灵的声音……有些说得像一切都好，另一些……困惑、迷失、被困住。这地方被诅咒了。~ + MINERVA-TALK10-ELF2
+ ~!Race(Player1,ELF)~ + ~我确实听见了。那像是……精灵的声音，被困住，像被诅咒困着。~ + MINERVA-TALK10-6
++ ~我什么都没听见。你确定不是自己想出来的？~ + MINERVA-TALK10-7
++ ~够了。等找到拉瑞尔，听他讲真相。~ + MINERVA-TALK10-0

CHAIN C0MMinJ MINERVA-TALK10-ELF2
~你说得对……那些我都没注意到。~
EXTERN C0MMinJ MINERVA-TALK10-8

CHAIN C0MMinJ MINERVA-TALK10-6
~我也是这么想的。~
EXTERN C0MMinJ MINERVA-TALK10-8

CHAIN C0MMinJ MINERVA-TALK10-7
~不，绝对不是。我肯定我听得见。~
EXTERN C0MMinJ MINERVA-TALK10-8

CHAIN C0MMinJ MINERVA-TALK10-8
~咱们进来时我就有感觉，可直到现在才比较确定……它就像……这座断手塔本身是「活的」。不是……像咱们那样，而是像大橡树那样——强大、有知觉，几乎像神明。~
= ~断手塔还能保持这么好的状态……相对而言，按它这么古老的年头说，几乎让人觉得……它不受时间影响。~
END
++ ~你觉得这座塔不仅活着，还不死？~ + MINERVA-TALK10-9
++ ~若真是那样，它怎么会变成这样？~ + MINERVA-TALK10-10
++ ~胡说。~ + MINERVA-TALK10-11
++ ~别猜了。咱们是来见拉瑞尔的。~ + MINERVA-TALK10-0

CHAIN C0MMinJ MINERVA-TALK10-9
~只是直觉。可要是我没错……是什么把它「切断」了，这么说吧？什么东西能这么强大？~
EXTERN C0MMinJ MINERVA-TALK10-12

CHAIN C0MMinJ MINERVA-TALK10-10
~这才让我害怕。~
EXTERN C0MMinJ MINERVA-TALK10-12

CHAIN C0MMinJ MINERVA-TALK10-11
~*耸肩* 也许是胡说……可我担心。一个力量这么大的地方，不会就这么……慢慢烂成这样。~
EXTERN C0MMinJ MINERVA-TALK10-12

CHAIN C0MMinJ MINERVA-TALK10-12
~我感觉咱们去见拉瑞尔这一趟不会容易，<PLAYER1>。其实会是「容易」的绝对反面。~
EXIT

// Eleventh Talk: After Larrel

CHAIN IF WEIGHT #-1 ~Global("C0MMinTalk11","GLOBAL",1)~ THEN C0MMinJ MINERVA-TALK11
~我这辈子遇过不少人，可从没遇过拉瑞尔这样的。说实话，我不知道该可怜他还是羡慕他。~ [C0BLANK]
DO ~IncrementGlobal("C0MMinTalk11","GLOBAL",1)~
= ~你能想象吗，<PLAYER1>？当个好人活了不知多久，然后犯一个错。一个错……惩罚就是永远以那副样子存在。而且不只他，还有他担着责任的那些人。~
END
++ ~是可怜。确实。可你干嘛羡慕他？~ + MINERVA-TALK11-1
++ ~你倒敢假设他是个好人。我只看见愚蠢的骄傲。~ + MINERVA-TALK11-2
++ ~他那下场一点不冤。~ + MINERVA-TALK11-3
++ ~我不想谈拉瑞尔。跟他有关的事完了。~ + MINERVA-TALK11-0

CHAIN C0MMinJ MINERVA-TALK11-0
~哦……好吧。那就算了。~
EXIT

CHAIN C0MMinJ MINERVA-TALK11-1
~我不知道。也许只是他那些话给我的感触太强……他疯癫时说的那些。「解放我的人民。星盘，旋转，回绕。」~
EXTERN C0MMinJ MINERVA-TALK11-4

CHAIN C0MMinJ MINERVA-TALK11-2
~也许吧。可我相信他是好人。一个犯了错的人，因为他走投无路，可还是……~
EXTERN C0MMinJ MINERVA-TALK11-4

CHAIN C0MMinJ MINERVA-TALK11-3
~也许他确实该。老实说，我想连他自己都会同意你。~
EXTERN C0MMinJ MINERVA-TALK11-4

CHAIN C0MMinJ MINERVA-TALK11-4
~就算咱们找到他时，他几乎不能思考，他还是抓着最要紧的东西——他的人民、他的星盘、他的目的。他从没真疯掉，一直撑着——撑到咱们能帮他。~
= ~我想不通拉贝拉斯为什么那样罚他。要他守着自己的失败，却不许他修补。这不太对……除非是因为他补不了。~
= ~我不知道咱们是不是从一开始就被安排要找到他，可我很高兴有机会帮他，和他的人民。~
END
+ ~Race(Player1,ELF)~ + ~他的人民就是我的人民。本来就该如此。~ + MINERVA-TALK11-5
+ ~!Race(Player1,ELF)~ + ~这是该做的事。~ + MINERVA-TALK11-5
++ ~咱们本来要完成一件英雄事迹，结果顺手解决了另一件。对冒险者来说，不过是又一天。~ + MINERVA-TALK11-5
++ ~要不是为了能用上心石宝石，我才不费这劲。~ + MINERVA-TALK11-6
++ ~我现在不想谈拉瑞尔或精灵。~ + MINERVA-TALK11-0

CHAIN C0MMinJ MINERVA-TALK11-5
~该感谢天上的星星有冒险者，对吧？哈哈。~
EXIT

CHAIN C0MMinJ MINERVA-TALK11-6
~*耸肩* 我个人倒不介意。这趟走得不错。~
EXIT

// Twelfth Talk: Svirf Village

CHAIN IF WEIGHT #-1 ~Global("C0MMinTalk12","GLOBAL",1)~ THEN C0MMinJ MINERVA-TALK12
~多可人的地方。虽然在地底下，可……挺好看的。~ [C0BLANK]
DO ~IncrementGlobal("C0MMinTalk12","GLOBAL",1)~
END
++ ~觉得像在家？~ + MINERVA-TALK12-1
++ ~我也喜欢这儿。~ + MINERVA-TALK12-2
++ ~可惜我不太喜欢地底。~ + MINERVA-TALK12-3
++ ~别分心。咱们不是来消闲的。~ + MINERVA-TALK12-0

CHAIN C0MMinJ MINERVA-TALK12-0
~我知道。就不能让我享受一下吗？~
EXIT

CHAIN C0MMinJ MINERVA-TALK12-1
~有一点。不过在我家乡可见不到这种彩色灯笼和发光的苔藓。大多是些可爱的小花。~
EXTERN C0MMinJ MINERVA-TALK12-2

CHAIN C0MMinJ MINERVA-TALK12-2
~我主要是高兴斯维尔夫内布林能有这么个地方，能在这么危险的地界里也尽量过得安全舒服。~
= ~我敬佩这些住在地底的远亲。我希望他们更多人有机会自由、去探索世界、在别的地方交到朋友……可他们过得这么苦，却没像幽暗地域别的种族那样变得残暴自私。~
END
++ ~他们是很坚韧的种族。~ + MINERVA-TALK12-4
++ ~他们不残暴就是弱点。所以他们才被迫这么活。~ + MINERVA-TALK12-5
++ ~来吧，米涅瓦。咱们还有活要干。~ + MINERVA-TALK13-0

CHAIN C0MMinJ MINERVA-TALK12-3
~确实有点闷，对吧？我太习惯蓝天了。不过我看我也能适应！~
EXTERN C0MMinJ MINERVA-TALK12-2

CHAIN C0MMinJ MINERVA-TALK12-4
~我觉得我族人该跟斯维尔夫内布林学不少东西。可惜他们彼此住得太远了。~
EXTERN C0MMinJ MINERVA-TALK12-6

CHAIN C0MMinJ MINERVA-TALK12-5
~不，我不这么想。我觉得要是他们跟其余那些一样凶狠歹毒，根本活不了这么久。~
EXTERN C0MMinJ MINERVA-TALK12-6

CHAIN C0MMinJ MINERVA-TALK12-6
~我很想多待一会儿，可我知道咱们有事。我就花点时间把这地方记进脑子里……好！我可以走了。~
EXIT

// Thirteenth Talk: Return to Easthaven

CHAIN IF WEIGHT #-1 ~Global("C0MMinTalk13","GLOBAL",1)~ THEN C0MMinJ MINERVA-TALK13
~咱们回到东港了……嗯，这是东港，对吧？跟我记忆里一点都不像了。~ [C0BLANK]
DO ~IncrementGlobal("C0MMinTalk13","GLOBAL",1)~
END
++ ~波奎林……或者不管他真是谁。这是他干的。~ + MINERVA-TALK13-1
++ ~太可怕了。那恶棍有很多账要交代。~ + MINERVA-TALK13-2
++ ~咱们会把事情修好。~ + MINERVA-TALK13-3
++ ~算不上多大损失。~ + MINERVA-TALK13-4
++ ~咱们没时间哀悼，米涅瓦。~ + MINERVA-TALK13-0

CHAIN C0MMinJ MINERVA-TALK13-0
~你说得对。咱们要找到那个假扮伊尔玛特祭司的家伙，让他付代价。~
EXIT

CHAIN C0MMinJ MINERVA-TALK13-1
~他会为此付账。~
EXTERN C0MMinJ MINERVA-TALK13-5

CHAIN C0MMinJ MINERVA-TALK13-2
~对。他欠着。而咱们就是让他交代的人。~
EXTERN C0MMinJ MINERVA-TALK13-5

CHAIN C0MMinJ MINERVA-TALK13-3
~这样的事真能修好吗？就算你把一切照旧重建起来，就算那样……不，不。我不该这么说。这已经是任何人能做到的最好了。~
EXTERN C0MMinJ MINERVA-TALK13-5

CHAIN C0MMinJ MINERVA-TALK13-4
~<PLAYER1>，我就当没听见你说这话。~
EXTERN C0MMinJ MINERVA-TALK13-5

CHAIN C0MMinJ MINERVA-TALK13-5
~要是有一个理由让我永不彻底丢下这种生活……那就是确保这样的事不再发生。要是真发生了，我要在那儿把它修好。~
= ~冒险当然好玩又刺激……可当我看见有人受伤，我才知道我是真被需要。远比被锁在工坊里强。~
END
++ ~我同意。这世界需要咱们这样的人。~ + MINERVA-TALK13-6
++ ~这大概是这一路上你最认真的一回。~ + MINERVA-TALK13-7
++ ~这就叫英雄情结。~ + MINERVA-TALK13-8
++ ~我只希望这事完了还能拿到钱。~ + MINERVA-TALK13-9
++ ~够了。以后再谈。~ + MINERVA-TALK13-0

CHAIN C0MMinJ MINERVA-TALK13-6
~你说得对，确实需要。幸好有咱们来救场。~
EXTERN C0MMinJ MINERVA-TALK13-10

CHAIN C0MMinJ MINERVA-TALK13-7
~你的意思是我这一路都不认真？哈哈。也许你对我还有很多要学。~
EXTERN C0MMinJ MINERVA-TALK13-10

CHAIN C0MMinJ MINERVA-TALK13-8
~随你怎么叫……这改变不了一个事实：咱们该做对的事。因为咱们做得到。~
EXTERN C0MMinJ MINERVA-TALK13-10

CHAIN C0MMinJ MINERVA-TALK13-9
~哦，当然有人要付账。不过是那个祭司，用他的血付。~
EXTERN C0MMinJ MINERVA-TALK13-10

CHAIN C0MMinJ MINERVA-TALK13-10
~走吧，<PLAYER1>。还有英雄的活要干。~
EXIT

// Fourteenth Talk: Before Battle

CHAIN IF WEIGHT #-1 ~Global("C0MMinTalk14","GLOBAL",1)~ THEN C0MMinJ MINERVA-TALK13
~你知道吗，<PLAYER1>……我想这事完了以后，我要从冒险里歇一阵。~ [C0BLANK]
DO ~IncrementGlobal("C0MMinTalk14","GLOBAL",1)~
END
+ ~Global("C0MMinRomanceActive","GLOBAL",2)~ + ~咱们一起去个不错的地方好吗？我是说，就咱们两个。~ + MINERVA-TALK14-ROM
++ ~我真没想到你会这么说。~ + MINERVA-TALK14-1
++ ~那你打算干什么？~ + MINERVA-TALK14-2
++ ~我也是。我确实需要一段长时间不赶路。~ + MINERVA-TALK14-3
++ ~你倒很乐观，假设咱们能活着出去。~ + MINERVA-TALK14-4
++ ~现在可不太是谈这个的时候。~ + MINERVA-TALK14-0

CHAIN C0MMinJ MINERVA-TALK14-0
~好，好。等咱们打赢了，我再告诉你我在想什么。酒我请。~
EXTERN C0MMinJ MINERVA-TALK14-9

CHAIN C0MMinJ MINERVA-TALK14-ROM
~哦，当然。我觉得你都不必问。不过我还想干另一件事。~
EXTERN C0MMinJ MINERVA-TALK14-2

CHAIN C0MMinJ MINERVA-TALK14-1
~我也没想到。注意，我不是说要退休！只是咱们爬这座塔的时候，我有了个主意。~
EXTERN C0MMinJ MINERVA-TALK14-2

CHAIN C0MMinJ MINERVA-TALK14-2
~我想写本书，把咱们冒险里发生的一切都写下来。那得花些时间。《<PLAYER1>与米涅瓦如何在安静的东港小城、一个渔夫的屋顶上相遇》……~
== C0MMinJ ~...defeating a marilith and recovering the Heartstone Gem, venturing through the Severed Hand and restoring Larrel's astrolabe, delving to the ancient halls of Dorn's Deep...~
== C0MMinJ IF ~Global("HOW_COMPLETED","GLOBAL",1)~ THEN ~...riding the wind to Lonelywood and defeating an immortal white wyrm...~
== C0MMinJ IF ~Global("Master_Quest","GLOBAL",7)~ THEN ~...venturing to Castle Maluradek and conquering the trials of the spectral Luremaster...~
== C0MMinJ ~...and now, climbing the steps of a crystal tower to save the Ten Towns from a demonic invasion. That'd make for a excellent story, don't you think?~
END
+ ~Class(Player1,BARD_ALL)~ + ~我很乐意跟你合写这么一部史诗。~ + MINERVA-TALK14-BARD
++ ~那当然会。~ + MINERVA-TALK14-5
++ ~没有你我可做不到。~ + MINERVA-TALK14-6
++ ~别把我名字写进去。~ + MINERVA-TALK14-7
++ ~随便。~ + MINERVA-TALK14-8

CHAIN C0MMinJ MINERVA-TALK14-3
~哦，不，我不是在想那个。要是有时间，我完全愿意再去冒险。只是……~
EXTERN C0MMinJ MINERVA-TALK14-2

CHAIN C0MMinJ MINERVA-TALK14-4
~嗯，假设自己要死还做什么计划？要死就死。可我要是活着……~
EXTERN C0MMinJ MINERVA-TALK14-2

CHAIN C0MMinJ MINERVA-TALK14-BARD
~当然！那写起来更有意思。然后咱们还能一起再走一趟。我本想着往东去卡拉图……~
EXTERN C0MMinJ MINERVA-TALK14-5

CHAIN C0MMinJ MINERVA-TALK14-5
~不知道我该给它起什么名。《冰风谷的英雄》太平淡。《十镇的试炼》？不，太没人情味。唔……这个我也得花点时间想。~
EXTERN C0MMinJ MINERVA-TALK14-8

CHAIN C0MMinJ MINERVA-TALK14-6
~你当然做得到。毕竟你是这故事里的英雄！我是说，不会那么轻松，也不会那么好玩，可……~
EXTERN C0MMinJ MINERVA-TALK14-5

CHAIN C0MMinJ MINERVA-TALK14-7
~随你，不过我强烈建议你快点给我编个别名。不然我自己编一个，你可不会喜欢！哈哈。~
EXTERN C0MMinJ MINERVA-TALK14-5

CHAIN C0MMinJ MINERVA-TALK14-8
~嗯，我干嘛现在操心这个？这故事还没完！<PLAYER1>，咱们去看看它怎么结尾？~
END
+ ~Global("C0MMinRomanceActive","GLOBAL",2)~ + ~对。现在就了结……一起。~ + MINERVA-TALK14-ROM2
+ ~!Global("C0MMinRomanceActive","GLOBAL",2)~ + ~对。现在就了结。~ + MINERVA-TALK14-9
++ ~我正要说到这事儿。~ + MINERVA-TALK14-9
++ ~别说废话。~ + MINERVA-TALK14-9

CHAIN C0MMinJ MINERVA-TALK14-ROM2
~对！你和我，<PLAYER1>。咱们一起什么都能对付！~
EXTERN C0MMinJ MINERVA-TALK14-9

CHAIN C0MMinJ MINERVA-TALK14-9
~前进，去胜利！~
EXIT

// Romance Talk 1

CHAIN IF WEIGHT #-1 ~Global("C0MMinRomanceTalk1","GLOBAL",1)~ THEN C0MMinJ MINERVA-ROM-TALK1
~*打哈欠* 我的天，我想我从没这么累过……这几天真难熬，不是吗？~ [C0BLANK]
DO ~IncrementGlobal("C0MMinRomanceTalk1","GLOBAL",1)~
= ~嘿，<PLAYER1>，今晚我把铺盖铺在你旁边行吗？睡着前有人聊两句挺不错的。~
END
++ ~当然，来吧。~ + MINERVA-ROM-TALK1-1
++ ~只是别让我醒着太久。~ + MINERVA-ROM-TALK1-2
++ ~米涅瓦，我没兴趣说话。去睡吧。~ + MINERVA-ROM-TALK1-X

CHAIN C0MMinJ MINERVA-ROM-TALK1-X
~好，好……好好睡之类的……抱歉打扰你了……~
DO ~SetGlobal("C0MMinRomanceActive","GLOBAL",3)
ClearAllActions()
StartCutSceneMode()
Wait(1)
FadeToColor([20.0],0)
Wait(2)
EndCutSceneMode()
RestParty()
FadeFromColor([20.0],0)~ EXIT

CHAIN C0MMinJ MINERVA-ROM-TALK1-1
~*叹气* 啊啊，这样真好……~
= ~<PLAYER1>，我觉得四肢已经睡着了。一点都动不了。你呢？~
END
++ ~我也一样。我累坏了。~ + MINERVA-ROM-TALK1-3
++ ~我还没觉得那么累。~ + MINERVA-ROM-TALK1-4
++ ~够了。别说了，让我睡。~ + MINERVA-ROM-TALK1-X

CHAIN C0MMinJ MINERVA-ROM-TALK1-2
~当然，别担心！你要是听烦了，就翻个身睡觉，我就不说了。大概。~
EXTERN C0MMinJ MINERVA-ROM-TALK1-1

CHAIN C0MMinJ MINERVA-ROM-TALK1-3
~我这么累的时候，连毛毯都像丝绸。想起我还在桑巴兰学院读书的日子……我会熬夜通宵，然后趴在桌上睡着。好时光……~
= ~当然，跟咱们如今碰上的这些比，那不算什么。<PLAYER1>，你感觉怎么样？你是领队，肯定格外辛苦。~
END
++ ~有你在身边就没那么辛苦。~ + MINERVA-ROM-TALK1-5
++ ~是辛苦。不过我想我撑得住。~ + MINERVA-ROM-TALK1-6
++ ~有个烦人的侏儒唠叨着不让我睡，可真够受。我睡了。~ + MINERVA-ROM-TALK1-X

CHAIN C0MMinJ MINERVA-ROM-TALK1-4
~真的？哇，你大概是钢铁做的。哪天能把你的锻炼法子教我吗？哈哈。开玩笑的。~
EXTERN C0MMinJ MINERVA-ROM-TALK1-3

CHAIN C0MMinJ MINERVA-ROM-TALK1-5
~哎，你真好。可我不过是尽我的本分。有时候把大半重要决定都推给你，我心里还挺过意不去。~
EXTERN C0MMinJ MINERVA-ROM-TALK1-6

CHAIN C0MMinJ MINERVA-ROM-TALK1-6
~你知道你需要什么我都能帮，对吧？要是有我能做的事，可别不好意思开口！我不会拒绝你。~
EXTERN C0MMinJ MINERVA-ROM-TALK1-7

CHAIN C0MMinJ MINERVA-ROM-TALK1-7
~不过……冒险可能辛苦，可这样安宁的时刻从不变样。还能时不时有这样的片刻，真好。~
= ~北方的天空也比兰坦清亮多了。那些星星，还有头上的月亮……真美。~
= ~哦，那是流星吗？嗯，是彗星，不过叫它「流星」比较吉利。那是好兆头！~
END
++ ~我希望那意味着咱们会成功。~ + MINERVA-ROM-TALK1-8
++ ~你想许个愿吗？~ + MINERVA-ROM-TALK1-9
++ ~不过是颗傻星。我累了，别烦我。~ + MINERVA-ROM-TALK1-X

CHAIN C0MMinJ MINERVA-ROM-TALK1-8
~嗯，我肯定就是这个意思……不过为了保险，咱们最好许个愿！~
EXTERN C0MMinJ MINERVA-ROM-TALK1-10

CHAIN C0MMinJ MINERVA-ROM-TALK1-9
~哦，这主意真棒。~
EXTERN C0MMinJ MINERVA-ROM-TALK1-10

CHAIN C0MMinJ MINERVA-ROM-TALK1-10
~<PLAYER1>，你许什么愿？我相信愿望要是跟你信得过的人分享，更容易实现！~
END
++ ~我希望咱们能找到要寻的邪恶，守住十镇。~ + MINERVA-ROM-TALK1-11
++ ~我希望咱们两个能一直在一起。~ + MINERVA-ROM-TALK1-12
++ ~我希望我能活得长久又快乐。~ + MINERVA-ROM-TALK1-11
++ ~我希望我爱的人都能平安。~ + MINERVA-ROM-TALK1-11
++ ~我要金子、权力和荣耀。不死之身也不错。~ + MINERVA-ROM-TALK1-11
++ ~我不需要许愿。我要的东西我自己会拿到。~ + MINERVA-ROM-TALK1-13
++ ~这又蠢又幼稚。我不掺和。~ + MINERVA-ROM-TALK1-X

CHAIN C0MMinJ MINERVA-ROM-TALK1-11
~不错！<PLAYER1>，我肯定有谁听见了你的愿望。~
EXTERN C0MMinJ MINERVA-ROM-TALK1-14

CHAIN C0MMinJ MINERVA-ROM-TALK1-12
~真的？你就许这个愿？哈哈……真好笑。~
END
++ ~有什么好笑的？~ + MINERVA-ROM-TALK1-12-A

CHAIN C0MMinJ MINERVA-ROM-TALK1-12-A
~嗯……我只是从没想到咱们俩会许同一个愿。~
EXTERN C0MMinJ MINERVA-ROM-TALK1-16

CHAIN C0MMinJ MINERVA-ROM-TALK1-13
~那很务实。不过我有点爱做梦。所以嘛……~
EXTERN C0MMinJ MINERVA-ROM-TALK1-14

CHAIN C0MMinJ MINERVA-ROM-TALK1-14
~我？我要为不久的未来许个愿。我肯定它会实现。~
END
++ ~你许了什么愿？~ + MINERVA-ROM-TALK1-15
++ ~「不久的未来」？什么意思？~ + MINERVA-ROM-TALK1-15
++ ~我肯定它会。~ + MINERVA-ROM-TALK1-16

CHAIN C0MMinJ MINERVA-ROM-TALK1-15
~嗯……别笑，好吗？我刚刚许愿咱们俩能一直在一起，这次之后还有更多好玩的冒险。一起。~
EXTERN C0MMinJ MINERVA-ROM-TALK1-16

CHAIN C0MMinJ MINERVA-ROM-TALK1-16
~好了，这话又甜又暖，可咱们该睡了！许愿是不错，可咱们还得自己出力去实现，对吧？~
= ~咱们都尽力吧，<PLAYER1>。我肯定咱们两个在一起什么都能做成……*打哈欠*~
= ~呼……~
END
++ ~晚安，米涅瓦。~ DO ~ClearAllActions()
StartCutSceneMode()
Wait(1)
FadeToColor([20.0],0)
Wait(2)
EndCutSceneMode()
RestParty()
FadeFromColor([20.0],0)~ EXIT

// Romance Talk 2

CHAIN IF WEIGHT #-1 ~Global("C0MMinRomanceTalk2","GLOBAL",1)~ THEN C0MMinJ MINERVA-ROM-TALK2
~哆嗦……这儿冻死了。我不知道是不是因为咱们刚从那个暖和的地底锻炉离开，可我觉得这是最冷的一回。~ [C0BLANK]
DO ~IncrementGlobal("C0MMinRomanceTalk2","GLOBAL",1)~
= ~<PLAYER1>，走的时候我靠着你蹭一会儿行吗？至少蹭到我不发抖。~
END
++ ~当然可以。~ + MINERVA-ROM-TALK2-1
++ ~我现在宁可留点自己的空间。~ + MINERVA-ROM-TALK2-2
++ ~别烦我。~ + MINERVA-ROM-TALK2-X

CHAIN C0MMinJ MINERVA-ROM-TALK2-X
~哇，我没想到你会这么绝情……好吧，往后我自己照顾自己。~
DO ~SetGlobal("C0MMinRomanceActive","GLOBAL",3)~ EXIT

CHAIN C0MMinJ MINERVA-ROM-TALK2-1
~谢谢！哦，这下好多了。你的手挺暖的，你知道吗？~
EXTERN C0MMinJ MINERVA-ROM-TALK2-3

CHAIN C0MMinJ MINERVA-ROM-TALK2-2
~哎。嗯，至少希望你不介意聊一会儿。那能让我别老想着冷。~
EXTERN C0MMinJ MINERVA-ROM-TALK2-3

CHAIN C0MMinJ MINERVA-ROM-TALK2-3
~你知道吗？我以前没有你这样的人陪着旅行时，不觉得自己缺了什么。有你在身边……真的、*真的*很好。~
= ~不只是帮忙、替我看着背后……就算只是有人说话，冷了能挨近点……我知道这有点奢侈。可我不想少了它。~
END
++ ~你需要我的时候，我都在，小咪。~ + MINERVA-ROM-TALK2-4
++ ~你只是找个借口想往我身上贴吧？~ + MINERVA-ROM-TALK2-5
++ ~呃，你太多愁善感了。咱们是在冒险，不是浪漫旅行。~ + MINERVA-ROM-TALK2-X

CHAIN C0MMinJ MINERVA-ROM-TALK2-4
~都在，是吧？就算这次冒险完了以后？哦，那太好了。我一直希望咱们不必各走各的。我会想你想得厉害。~
EXTERN C0MMinJ MINERVA-ROM-TALK2-6

CHAIN C0MMinJ MINERVA-ROM-TALK2-5
~不是……？也许？你是说我要贴过来*不用*借口？你该早点告诉我！~
EXTERN C0MMinJ MINERVA-ROM-TALK2-6

CHAIN C0MMinJ MINERVA-ROM-TALK2-6
~*叹气* 要是没有你，这次冒险连一半的乐趣都没有。~
EXIT

// Romance Talk 3

CHAIN IF WEIGHT #-1 ~Global("C0MMinRomanceTalk3","GLOBAL",1)~ THEN C0MMinJ MINERVA-ROM-TALK3
~嘿，<PLAYER1>？~ [C0BLANK]
DO ~IncrementGlobal("C0MMinRomanceTalk3","GLOBAL",1)~
END
++ ~怎么了，米涅瓦？~ + MINERVA-ROM-TALK3-1
++ ~什么事，小咪？~ + MINERVA-ROM-TALK3-1
++ ~能等以后再说吗？~ + MINERVA-ROM-TALK3-2
++ ~我没时间浪费在听你说。~ + MINERVA-ROM-TALK3-X

CHAIN C0MMinJ MINERVA-ROM-TALK3-X
~好。没关系。完全、没关系。~
DO ~SetGlobal("C0MMinRomanceActive","GLOBAL",3)~ EXIT

CHAIN C0MMinJ MINERVA-ROM-TALK3-1
~谢谢你带我一起。这真是场很棒的冒险。~
END
++ ~最棒的。~ + MINERVA-ROM-TALK3-3
++ ~没有你，连一半的乐趣都没有。~ + MINERVA-ROM-TALK3-4
++ ~你就只有这些要说？别浪费我时间。~ + MINERVA-ROM-TALK3-X

CHAIN C0MMinJ MINERVA-ROM-TALK3-2
~我会很快，我保证。~
EXTERN C0MMinJ MINERVA-ROM-TALK3-1

CHAIN C0MMinJ MINERVA-ROM-TALK3-3
~真有意思，这种事就那么……由偶然决定了。我是说，咱们遇上了。~
= ~想想要是咱们没遇上，或者你没答应让我加入。我会错过多少美好的回忆！~
END
++ ~我绝不会错过你那副好听的嗓子。~ + MINERVA-ROM-TALK3-5
++ ~那绝不会发生。我第一眼看见你，你就吸住了我的眼。~ + MINERVA-ROM-TALK3-6
++ ~是挺走运的。至少我肯定我觉得自己走运。~ + MINERVA-ROM-TALK3-7
++ ~够了。冒险还没完。~ + MINERVA-ROM-TALK3-8

CHAIN C0MMinJ MINERVA-ROM-TALK3-4
~哈哈。咱们真是天生一对，对吧？~
EXTERN C0MMinJ MINERVA-ROM-TALK3-3

CHAIN C0MMinJ MINERVA-ROM-TALK3-5
~哈哈。你要是那么喜欢，也许我该多练练？~
EXTERN C0MMinJ MINERVA-ROM-TALK3-8

CHAIN C0MMinJ MINERVA-ROM-TALK3-6
~哎。那我真高兴那天选了屋顶，好让你没错过我！~
EXTERN C0MMinJ MINERVA-ROM-TALK3-8

CHAIN C0MMinJ MINERVA-ROM-TALK3-7
~我也一样！~
EXTERN C0MMinJ MINERVA-ROM-TALK3-8

CHAIN C0MMinJ MINERVA-ROM-TALK3-8
~我肯定咱们还会有很多冒险，可这一次会在我心里永远占个特别的位置。咱们两个相遇的那一次……~
== C0MMinJ IF ~OR(3)
Race(Player1,HALFLING)
Race(Player1,GNOME)
Race(Player1,DWARF)~ THEN ~(She leans forward and kisses you gently on the lips.)~
== C0MMinJ IF ~!Race(Player1,HALFLING)
!Race(Player1,GNOME)
!Race(Player1,DWARF)~ THEN ~(She gestures for you to lean down, before giving you a gentle kiss on the lips.)~
== C0MMinJ ~Mmm... I should've done that sooner. But that's something else to make this journey special, right?~
DO ~SetGlobal("C0MMinRomanceActive","GLOBAL",2)~ EXIT

// HoW Talk 1: Lonelywood

CHAIN IF WEIGHT #-1 ~Global("C0MMinHoWTalk1","GLOBAL",1)~ THEN C0MMinJ MINERVA-HOW-TALK1
~这就是孤木镇？哇……真漂亮！要我在北方挑个地方过完余生，我会毫不犹豫选这儿。~ [C0BLANK]
DO ~IncrementGlobal("C0MMinHoWTalk1","GLOBAL",1)~
END
++ ~同意。这儿又舒服又暖和。至少跟谷地其他地方比。~ + MINERVA-HOW-TALK1-1
++ ~真的？我以为安顿下来是你最不会做的事。~ + MINERVA-HOW-TALK1-2
++ ~真可惜。我才开始习惯北方的严寒。~ + MINERVA-HOW-TALK1-3
++ ~米涅瓦，我真没兴趣观光。闭嘴。~ + MINERVA-HOW-TALK1-0

CHAIN C0MMinJ MINERVA-HOW-TALK1-0
~嘘——你记得咱们不会留在这儿，对吧？你不想留一刻让这地方渗进记忆里？不想？哼，你真没趣。~
EXIT

CHAIN C0MMinJ MINERVA-HOW-TALK1-1
~正是。这儿的雪刚好够好看，可同时我又不必觉得脚趾要冻掉。哦，我可怜的脚趾！它们挨冻挨得太久了。~
EXTERN C0MMinJ MINERVA-HOW-TALK1-4

CHAIN C0MMinJ MINERVA-HOW-TALK1-2
~我只是说说可能性，你知道吗？等我老了、累了，或者我终于把世界看遍……这儿会是个度余生的好地方。~
EXTERN C0MMinJ MINERVA-HOW-TALK1-4

CHAIN C0MMinJ MINERVA-HOW-TALK1-3
~哦，我没考虑到。等咱们回到原来那地方，会觉得比以往更冷，对吧？现在我真希望能留在这儿……哆嗦……~
EXTERN C0MMinJ MINERVA-HOW-TALK1-4

CHAIN C0MMinJ MINERVA-HOW-TALK1-4
~嗯，总之，咱们干嘛干站着？我想去看看风景！哦，还有吃的。走之前咱们一定得尝尝本地菜！唔……~
EXIT

// HoW Talk 2: Burial Isle

CHAIN IF WEIGHT #-1 ~Global("C0MMinHoWTalk2","GLOBAL",1)~ THEN C0MMinJ MINERVA-HOW-TALK2
~看看这个。你们把死者埋在这儿，他们迟早又爬起来。按理说人们该学会更好地照看自己那么敬重的祖先。~ [C0BLANK]
DO ~IncrementGlobal("C0MMinHoWTalk2","GLOBAL",1)~
END
++ ~兰坦人怎么处理死者？要是你不介意我问。~ + MINERVA-HOW-TALK2-1
++ ~米涅瓦，现在*绝对*不是闲聊的时候。等咱们离开这座岛再说。~ + MINERVA-HOW-TALK2-0

CHAIN C0MMinJ MINERVA-HOW-TALK2-0
~什么？哦，抱歉，我声音太大了吗？我只是在自言自语。~
EXIT

CHAIN C0MMinJ MINERVA-HOW-TALK2-1
~我们家乡其实不讲究怎么「处理」死者。各家氏族大多照自己的意思办。兰坦人不太在乎死后身体怎么样。毕竟不过是血肉骨头。~
= ~我们在乎的只有留下的知识。那是我们的遗产。每个兰坦研究者都梦想有个定理或公式以自己命名，死后几百年还有人引用。~
END
++ ~你也想要这个？~ + MINERVA-HOW-TALK2-2

CHAIN C0MMinJ MINERVA-HOW-TALK2-2
~我？哈哈！我已经有几样以我命名的东西了。你要是哪天看见一本《兰坦材料理论》，翻到第一百五十二页。上头是我的名字。我想。~
= ~倒也不是什么大不了的事。我更想写本书，把我走遍世界学到的东西都写下来，靠那个被人记住。~
= ~不过……我死了不需要给我盖座宏伟陵墓，可我总希望比被丢在这么个又冷又恶心的岛上强点。难怪死者要爬起来发火。这些居住……呃，「非居住」条件太糟了！~
EXIT

// HoW Talk 3: Gloomfrost

CHAIN IF WEIGHT #-1 ~Global("C0MMinHoWTalk3","GLOBAL",1)~ THEN C0MMinJ MINERVA-HOW-TALK3
~*哼气* 天哪，真冷。我脚趾都要冻掉了。也许我只是太习惯孤木镇了……~ [C0BLANK]
DO ~IncrementGlobal("C0MMinHoWTalk3","GLOBAL",1)~
END
++ ~非常冷。冷得不正常。~ + MINERVA-HOW-TALK3-1
++ ~我从没像现在这样想要个壁炉和一碗热汤。~ + MINERVA-HOW-TALK3-2
++ ~唔。说、说不了话。嘴唇。冻、冻住。~ + MINERVA-HOW-TALK3-3
++ ~走走就暖过来了。来吧，走。~ + MINERVA-HOW-TALK3-0

CHAIN C0MMinJ MINERVA-HOW-TALK3-0
~哦，好吧。我——*哇呀呀！* 我差点滑倒……几乎感觉不到脚的时候走路真难。噫……~
EXIT

CHAIN C0MMinJ MINERVA-HOW-TALK3-1
~「不正常」说得对！说「瘆人」更合适。就像这儿连太阳都不照。~
EXTERN C0MMinJ MINERVA-HOW-TALK3-4

CHAIN C0MMinJ MINERVA-HOW-TALK3-2
~为了一杯加棉花糖的可可，我什么都肯干。可惜北方找不到。~
EXTERN C0MMinJ MINERVA-HOW-TALK3-4

CHAIN C0MMinJ MINERVA-HOW-TALK3-3
~这么糟，是吧？我——哦，我的也麻了。唔。这、这样说话真难。咱、咱们走吧。~
EXIT

CHAIN C0MMinJ MINERVA-HOW-TALK3-4
~给这地方起名「幽霜」的人挺懂行。幽暗。霜。满是幽暗的霜。不是个好地方。~
= ~可要是不去探最糟的地方，就不算冒险，对吧？管它幽不幽暗，咱们自己把这地方弄亮点就是了！~
EXIT

// HoW Talk 4: Post-Seer Death

CHAIN IF WEIGHT #-1 ~Global("C0MMinHoWTalk4","GLOBAL",1)~ THEN C0MMinJ MINERVA-HOW-TALK4
~所以……先知死了。就跟她知道的那样。~ [C0BLANK]
DO ~IncrementGlobal("C0MMinHoWTalk4","GLOBAL",1)~
= ~怕死是常事，可……活着却知道自己会怎么死，一直知道到那一刻……那可怕得无法形容。~
= ~*打寒颤* 我可不想知道自己会怎么死。我还有那么多东西没看见。~
= ~哆嗦……又觉得一阵寒意，我看不是因为天冷。来吧，<PLAYER1>。咱们有条龙要猎。~
EXIT

// HoW Talk 5: Final Talk

CHAIN IF WEIGHT #-1 ~Global("C0MMinHoWTalk5","GLOBAL",1)~ THEN C0MMinJ MINERVA-HOW-TALK5
~嘿，等等我，<PLAYER1>。进之前……~ [C0BLANK]
DO ~IncrementGlobal("C0MMinHoWTalk5","GLOBAL",1)~
END
++ ~什么事？~ + MINERVA-HOW-TALK5-1
++ ~脚冷了？~ + MINERVA-HOW-TALK5-2
++ ~以后再谈。~ + MINERVA-HOW-TALK5-0

CHAIN C0MMinJ MINERVA-HOW-TALK5-0
~能吗？嗯……好吧，<PLAYER1>。希望咱们俩都能撑过这一回。~
EXIT

CHAIN C0MMinJ MINERVA-HOW-TALK5-1
~只是……咱们就要跟一条龙正面对上了，你知道吧？一条*龙*。龙可有很大的脚趾。~
= ~而且不是随便什么龙。一条古老、不死、愤怒、早就该死掉的龙！这绝对不是天天都得应付的事。~
= ~所以，呃……万一这一趟全歪了，咱们都给吃了，或者冻成冰柱过完永恒，我只想先说……我过得很开心，<PLAYER1>。~
= ~还有，要是咱们真冻住了……也值。每一秒都值。~
END
+ ~Global("C0MMinRomanceActive","GLOBAL",2)~ + ~别担心。我会保护你。~ + MINERVA-HOW-TALK5-ROM
++ ~谢谢你，米涅瓦。~ + MINERVA-HOW-TALK5-3
++ ~确实值。~ + MINERVA-HOW-TALK5-3
++ ~咱们不会死，我保证。~ + MINERVA-HOW-TALK5-4
++ ~你对什么叫激励人心的说法，想法挺特别。~ + MINERVA-HOW-TALK5-5
++ ~够了。咱们有条龙要杀。~ + MINERVA-HOW-TALK5-6

CHAIN C0MMinJ MINERVA-HOW-TALK5-2
~不，不是——嗯，对，我的脚*确实*冷，可我不是说这个。~
EXTERN C0MMinJ MINERVA-HOW-TALK5-1

CHAIN C0MMinJ MINERVA-HOW-TALK5-ROM
~以前从没人跟我说过这话。让我觉得……暖。还有点软乎乎。正是我现在需要的，所以……谢谢！~
= ~可别为了我做傻事。我也希望你活着，<PLAYER1>。咱们俩都得活着。~
EXTERN C0MMinJ MINERVA-HOW-TALK5-3

CHAIN C0MMinJ MINERVA-HOW-TALK5-3
~*呼气* 呼！好话暖话都说完了，那就干吧！~
EXIT

CHAIN C0MMinJ MINERVA-HOW-TALK5-4
~嗯。这就对了。毕竟咱们在一起无人可挡！~
EXTERN C0MMinJ MINERVA-HOW-TALK5-3

CHAIN C0MMinJ MINERVA-HOW-TALK5-5
~我知道，我知道。不过为我辩护一句，咱们*确实*就要去打一条古老的巫妖龙了。~
EXTERN C0MMinJ MINERVA-HOW-TALK5-3

CHAIN C0MMinJ MINERVA-HOW-TALK5-6
~好。我知道。给我一秒钟！*吸气* 唔……*呼气*~
= ~好了！我全身来劲，准备好了。干吧！~
EXIT

// ToTL Talk 1

CHAIN IF WEIGHT #-1 ~Global("C0MMinToTLTalk1","GLOBAL",1)~ THEN C0MMinJ MINERVA-TOTL-TALK1
~呼！这回咱们又把自己弄进什么麻烦里了？~ [C0BLANK]
DO ~IncrementGlobal("C0MMinToTLTalk1","GLOBAL",1)~
END
++ ~谁知道。提着防。~ + MINERVA-TOTL-TALK1-1
++ ~我开始觉得这不是什么好主意了……~ + MINERVA-TOTL-TALK1-2
++ ~那个蠢半身人得好好解释解释。~ + MINERVA-TOTL-TALK1-3

CHAIN C0MMinJ MINERVA-TOTL-TALK1-1
~总之，咱们……我觉得咱们甚至都不在冰风谷了。这空气又热又干……咱们被带到了沙漠。这不会是安纳洛克吧？还有前面那建筑……~
= ~看着像座城堡……童话里那种。不过童话一般不提那些狰狞的亡灵和尖啸的鹰身女妖。~
EXTERN C0MMinJ MINERVA-TOTL-TALK1-4

CHAIN C0MMinJ MINERVA-TOTL-TALK1-2
~嗯，往好处看！你完全不知道会遇着什么，就永远不会对发现的东西失望！~
END
++ ~呃……对。~ + MINERVA-TOTL-TALK1-1
++ ~我已经够失望了。看我这脸上的失望。~ + MINERVA-TOTL-TALK1-1
++ ~一派胡言。~ + MINERVA-TOTL-TALK1-1

CHAIN C0MMinJ MINERVA-TOTL-TALK1-3
~他不就是刚跑进咱们前面那间小屋了吗？除非他在里头备了一堆陷阱等着弹咱们，我不觉得他是想逃。~
EXTERN C0MMinJ MINERVA-TOTL-TALK1-1

CHAIN C0MMinJ MINERVA-TOTL-TALK1-4
~总之，这种时候咱们得靠紧、一起干。我随时能留意危险和怪东西。你指哪儿我去哪儿。~
EXIT

// ToTL Talk 2

CHAIN IF WEIGHT #-1 ~Global("C0MMinToTLTalk2","GLOBAL",1)~ THEN C0MMinJ MINERVA-TOTL-TALK2
~哈哈……终于完了，我真高兴。要是再在这儿打一个亡魂，我这辈子都不想再踏进地窖。~ [C0BLANK]
DO ~IncrementGlobal("C0MMinToTLTalk2","GLOBAL",1)~
END
++ ~要是再让我在这迷宫里找一条密道，我会疯。~ + MINERVA-TOTL-TALK2-1
++ ~可不是。我烦透了打那些无穷无尽、摇摇晃晃、臭烘烘的蠢亡灵。~ + MINERVA-TOTL-TALK2-2
++ ~米涅瓦，现在真不是闲聊的时候。~ EXIT

CHAIN C0MMinJ MINERVA-TOTL-TALK2-1
~哦，我倒不介意。其实还挺好玩。让这经历好受了一点。~
EXTERN C0MMinJ MINERVA-TOTL-TALK2-3

CHAIN C0MMinJ MINERVA-TOTL-TALK2-2
~确实摇晃、臭烘烘又蠢。亡灵怎么就不能偶尔聪明点、会交际点？~
EXTERN C0MMinJ MINERVA-TOTL-TALK2-3

CHAIN C0MMinJ MINERVA-TOTL-TALK2-3
~不过这一切有点怪……就像整座地方都闹着不安分的鬼。我感觉城堡里面也会一模一样，或者差不多。~
= ~我太好奇这地方出了什么事，急着想看看，可咱们小心点，好吗？~
EXIT

// ToTL - Door Comment

CHAIN IF WEIGHT #-1 ~Global("C0MMinToTLDoorTalk","AR9717",1)~ THEN C0MMinJ MINERVA-TOTL-DOORTALK
~一扇带嘴的门，要两个头骨才能过去？这地方越来越邪。~ [C0BLANK]
DO ~IncrementGlobal("C0MMinToTLDoorTalk","AR9717",1)~
EXIT

// ToTL Talk 3

CHAIN IF WEIGHT #-1 ~Global("C0MMinToTLTalk3","GLOBAL",1)~ THEN C0MMinJ MINERVA-TOTL-TALK3
~哦，凭我老祖母那皱巴巴的脚趾，这是……这到底是什么鬼东西？！我不敢信……咱们被困住了！~ [C0BLANK]
DO ~IncrementGlobal("C0MMinToTLTalk3","GLOBAL",1)~
END
++ ~嗯。这很糟。~ + MINERVA-TOTL-TALK3-1
++ ~会没事的。咱们会找到出路。~ + MINERVA-TOTL-TALK3-2
++ ~我好像从没见过你慌张。~ + MINERVA-TOTL-TALK3-3
++ ~（别理她）~ EXIT

CHAIN C0MMinJ MINERVA-TOTL-TALK3-1
~哦——这比糟还糟。糟得多得多。~
EXTERN C0MMinJ MINERVA-TOTL-TALK3-4

CHAIN C0MMinJ MINERVA-TOTL-TALK3-2
~好，好。我相信你有计划。因为要是没有……*打寒颤*~
EXTERN C0MMinJ MINERVA-TOTL-TALK3-4

CHAIN C0MMinJ MINERVA-TOTL-TALK3-3
~什么？这还不算慌。给我几天，你就见着什么叫慌了！~
EXTERN C0MMinJ MINERVA-TOTL-TALK3-4

CHAIN C0MMinJ MINERVA-TOTL-TALK3-4
~哦，我——最——讨厌被困在封闭的地方。太容易让我想起十岁那年不小心把自己锁在一间废弃工坊里。三天后才有人找到我。~
= ~不过那还算不上最糟的。我跟你说过我那次被锁在楚尔特一座有巨蛇的墓里吗？二十五天才找到出路。二十五天。我只能靠吃苔藓活着。*打寒颤*~
= ~咱们……咱们就往前走吧，希望这不是什么残忍的陷阱，好吗？希望有出路。希望……~
EXIT

// Albion

INTERJECT DALBION 1 C0MMinAlbion1
== C0MMinJ IF ~IsValidForPartyDialogue("C0MMin")~ THEN ~What's a bunch of Eldathyns doing in a stinking pit like this? Isn't your goddess the patron of peace and waterfalls?~
EXTERN DALBION 3

INTERJECT DALBION 14 C0MMinAlbion2
== C0MMinJ IF ~IsValidForPartyDialogue("C0MMin")~ THEN ~Wait... what? You know about the Temple of the Forgotten God? And that the Heartstone Gem was hidden there?~
EXTERN DALBION 16

// Ambere

I_C_T DAMBERE 7 C0MMinAmbere1
== C0MMinJ IF ~IsValidForPartyDialogue("C0MMin")~ THEN ~I'd much prefer the road to settling down, but honestly? I can't really see what's so bad about living here.~
END

// Angaar

I_C_T DANGAAR 1 C0MMinAngaar
== C0MMinJ IF ~IsValidForPartyDialogue("C0MMin")~ THEN ~Well, they've prepared quite a welcoming committee for us.~
== DANGAAR ~...~
END

// Apsel

ADD_TRANS_TRIGGER DAPSEL 4 ~!IsValidForPartyDialogue("C0MMin")~ DO 2 3

EXTEND_TOP DAPSEL 4 #3
+ ~IsValidForPartyDialogue("C0MMin")~ + ~你把钥匙断在锁里了，我怎么开门？~ DO ~SetGlobal("C0MMinApselDoor","AR1000",1)~ EXTERN C0MMinJ MINERVA-APSEL
END

CHAIN C0MMinJ MINERVA-APSEL
~哦，那不成问题。那扇看着晃里晃当的门，锁不管什么样都好撬。我睡着都能开。~
== DAPSEL ~"Rickety?"—er, um, that's not the point right now. Could you help me, then?~
COPY_TRANS DAPSEL 14

CHAIN IF WEIGHT #-1 ~Global("C0MMinApselDoor","AR1000",2)~ THEN C0MMinJ MINERVA-APSEL-DOOR
~看？跟你说了那是晃里晃当的东西。~ [C0BLANK]
DO ~IncrementGlobal("C0MMinApselDoor","AR1000",1)~
EXIT

I_C_T DAPSEL 10 C0MMinApsel
== C0MMinJ IF ~IsValidForPartyDialogue("C0MMin")~ THEN ~Ooh, now that's a nice blade. I don't suppose you've got a few more? Or maybe just one more?~
== DAPSEL ~I–I'm afraid not. I haven't been able to make any more since that beast took over my shop.~
END

// Arundel

I_C_T DARUNDEL 7 C0MMinArundel1
== C0MMinJ IF ~IsValidForPartyDialogue("C0MMin")~ THEN ~Hmm, yes. It's almost impossible to explain naturally using logic, even if all the stars aligned... it all seems too convenient.~
END

CHAIN IF WEIGHT #-1 ~Global("C0MMinArundelDying","GLOBAL",1)~ THEN C0MMinJ MINERVA-ARUNDEL-DYING
~哦不，阿伦德尔……~ [C0BLANK]
DO ~IncrementGlobal("C0MMinArundelDying","GLOBAL",1) ActionOverride("ARUNDEL",StartDialogueNoSet(Player1))~ EXIT

// Baldemar

I_C_T DBALDEMR 1 C0MMinBeorn1
== C0MMinJ IF ~IsValidForPartyDialogue("C0MMin")~ THEN ~*sigh* Like overgrown children, probably... I wish I could say the Ayrorch council back home was any better most of the time.~
END

// Belhifet

I_C_T DBELHIFE 11 C0MMinBelhifet11
== C0MMinJ IF ~IsValidForPartyDialogue("C0MMin")~ THEN ~The only thing inevitable now is us sending you back to the pits of Hell. Time for you to eat burning knives!~
END

// Beorn

INTERJECT DBEORN 1 C0MMinBeorn1
== C0MMinJ IF ~IsValidForPartyDialogue("C0MMin")~ THEN ~Of course you can! Don't tell me things are so bad you can't even trust a fellow gnome?~
EXTERN DBEORN 3

// Criek

I_C_T2 DCRIECK 3 C0MMinCriek
== C0MMinJ IF ~IsValidForPartyDialogue("C0MMin")~ THEN ~You'd think people stranded in the desert would be more courteous to potential rescuers. Well, nothing to be done about it, I suppose. Eat knives!~
END

I_C_T2 DCRIECK 4 C0MMinCriek
== C0MMinJ IF ~IsValidForPartyDialogue("C0MMin")~ THEN ~You'd think people stranded in the desert would be more courteous to potential rescuers. Well, nothing to be done about it, I suppose. Eat knives!~
END

I_C_T2 DCRIECK 5 C0MMinCriek
== C0MMinJ IF ~IsValidForPartyDialogue("C0MMin")~ THEN ~You'd think people stranded in the desert would be more courteous to potential rescuers. Well, nothing to be done about it, I suppose. Eat knives!~
END

// Daen Winterbrush

I_C_T CDDAEN 8 C0MMinDaen
== C0MMinJ IF ~IsValidForPartyDialogue("C0MMin")~ THEN ~Wow... it turns out that there really are some powers even greater than death.~
END

// Damien

I_C_T DDAMIEN 2 C0MMinDamien1
== C0MMinJ IF ~IsValidForPartyDialogue("C0MMin")~ THEN ~Well, looks like it's to bring out the knives. We can't have these monsters stealing all of the town's tasty fish, can we?~
== DDAMIEN ~Please help! My da'll be mad at me if he finds out what happened.~
END

// Dirty Llew

I_C_T DDIRTYLL 3 C0MMinDirtyLlew
== DDIRTYLL IF ~See("C0MMin")
IsValidForPartyDialogue("C0MMin")~ THEN ~Say, you've got a fine-looking gnomish lady with you there. Mind if I... got to know her a little, eh?~
== C0MMinJ ~Ha ha. Sure thing. Just so you know, though, I've got knives on me from here... all the way down to here.~
== DDIRTYLL ~Ooh, now that is quite a challenge... I'm not against taking a few shaves for some attention, though. Heh heh...~
END

// Durdel Anatha

I_C_T DVOICEDA 6 C0MMinDurdel1
== C0MMinJ IF ~IsValidForPartyDialogue("C0MMin")~ THEN ~That was the way you decided to hold true to your vows? There wasn't a... healthier solution out there?~
END

// Elisia

I_C_T DELISIA 16 C0MMinElisia1
== C0MMinJ IF ~IsValidForPartyDialogue("C0MMin")~ THEN ~Wow... the power of song, hmm? I'm no bard, but even I can sense the magic in the sounds.~
== DELISIA ~The song fades, but the images linger.~
END

// Emmerich

I_C_T DEMMRCH 31 C0MMinEmmerich1
== C0MMinJ IF ~IsValidForPartyDialogue("C0MMin")~ THEN ~Oh, no. Lycanthropy is highly contagious and most people don't even realize they're afflicted right away. But it's not incurable...~
END

// Erevain

I_C_T DEREVAIN 0 C0MMinErevain1
== C0MMinJ IF ~IsValidForPartyDialogue("C0MMin")~ THEN ~Oh, I think I've seen you around the city before. We haven't spoken until now, even though we're only a room apart.~
== DEREVAIN ~Yes, a pity. Though I believe I have glimpsed you atop Gaspar's rooftop, singing and feasting on the local delicacies. Your voice is quite charming, different as it is to elvensong.~
== C0MMinJ ~Aww, how sweet of you! I'd sing a tune for that compliment, but my throat's a little hoarse right now. Maybe later.~
== DEREVAIN ~Is there anything you wanted, friend?~
END

I_C_T DEREVAIN 10 C0MMinErevain1
== C0MMinJ IF ~IsValidForPartyDialogue("C0MMin")~ THEN ~Oh, I think I've seen you around the city before. We haven't spoken until now, even though we're only a room apart.~
== DEREVAIN ~Yes, a pity. Though I believe I have glimpsed you atop Gaspar's rooftop, singing and feasting on the local delicacies. Your voice is quite charming, different as it is to elvensong.~
== C0MMinJ ~Aww, how sweet of you! I'd sing a tune for that compliment, but my throat's a little hoarse right now. Maybe later.~
== DEREVAIN ~Is there anything you wanted, friend?~
END

I_C_T DEREVAIN 1 C0MMinErevain2
== C0MMinJ IF ~IsValidForPartyDialogue("C0MMin")~ THEN ~Horrors, sure. But the wonders are what adventures are all about! There's always something new to experience around the corner, and it's bound to be exciting.~
== DEREVAIN ~Aye, I know that feeling well.~
END

// Fengla

INTERJECT DFENGLA 3 C0MMinFengla1
== C0MMinJ IF ~IsValidForPartyDialogue("C0MMin")~ THEN ~That's it. I'm going to find the monster that would do this and show them a few knives of my own. Who did this to you?~
EXTERN DFENGLA 4

// Gaspar

CHAIN IF WEIGHT #-1 ~!GlobalGT("Know_Balance","GLOBAL",0)
Global("C0MMinGaspar","LOCALS",0)
IsValidForPartyDialogue("C0MMin")
See("C0MMin")
!StateCheck("C0MMin",CD_STATE_NOTVALID)~ THEN DGASPAR GASPAR
~啊……是你，米涅瓦。难得见你在屋里，我倒有点意外。~
DO ~SetGlobal("C0MMinGaspar","LOCALS",1)~
== C0MMinJ ~Well, 'tis true I don't care much for walls or a roof... the underside of one, anyway. But one must make sacrifices now and again.~
== DGASPAR ~And I can't say I care much for you climbing atop my roof and using it as your picnic table, nor encouraging my son to do the same.~
== C0MMinJ ~Ha ha. That was only once. And it's such a pity not to take advantage of the great view one gets from up there, or to not partake of your fine grilled trout... of which you have my thanks for once again, by the way.~
== DGASPAR ~Not at all. The small ones are of little use for scrimshaw anyhow. Just... please, stop leaving the leftover bones on the rooftop. They attract the gulls.~
END
IF ~See(Player1)~ EXTERN DGASPAR GASPAR-1
IF ~!See(Player1)~ EXIT

CHAIN DGASPAR GASPAR-1
~无论如何，我看我该照料你的同伴。我是鱼贩加斯帕。这美好的一天，我能为你做什么？~
COPY_TRANS DGASPAR 0

// Gelarith

ADD_TRANS_TRIGGER DGELARIT 1 ~!IsValidForPartyDialogue("C0MMin")~ DO 0

EXTEND_TOP DGELARIT 1
+ ~IsValidForPartyDialogue("C0MMin")~ + ~什么缺的部件？~ EXTERN C0MMinJ MINERVA-GELARITH
END

CHAIN C0MMinJ MINERVA-GELARITH
~当然是这儿这台机器缺的部件！你看不出来吗，它动得不对劲？~
EXTERN DGELARIT 2

I_C_T DGELARIT 9 C0MinervaGelarith
== C0MMinJ IF ~IsValidForPartyDialog("C0MMin")~ THEN ~Wow. I've seen a lot of wonders in my lifetime, but never anything like this.~
END

// Ghereg

I_C_T DOGRE 3 C0MMinGhereg1
== C0MMinJ IF ~!IsGabber("C0MMin") IsValidForPartyDialogue("C0MMin")~ THEN ~*sigh* Good idea, <GABBER>. Maybe you're a bit of a dummy yourself?~
== DOGRE ~Time to make you hurt!~
END

// Girdle of Gond

CHAIN IF WEIGHT #-1 ~Global("C0MMinGirdleGond","GLOBAL",1)~ THEN C0MMinJ GIRDLE-OF-GOND
~唔，贡德教会做的魔法腰带？在这儿找到这种东西倒稀奇。~ [C0BLANK]
DO ~IncrementGlobal("C0MMinGirdleGond","GLOBAL",1)~
= ~不过上头的附魔好像淡了些……一般这种腰带能做的更多。可我自己没那个手段修它。~
EXIT

CHAIN IF WEIGHT #-1 ~Global("C0MMinGnomishTools","GLOBAL",1)~ THEN C0MMinJ GNOME-TOOLS
~嗯？那是侏儒手工的标准工具……兰坦家家都有，可这些怎么会在这种地方？~ [C0BLANK]
DO ~IncrementGlobal("C0MMinGnomishTools","GLOBAL",1)~
EXIT

// Goblin

I_C_T DGOBLINC 4 C0MMinGoblin1
== C0MMinJ IF ~IsValidForPartyDialogue("C0MMin")~ THEN ~Hmm... there's a few hallucinogenic drugs and plants that can cause adverse mental effects, but the effects wear off given enough time. If it's still this strong, only some kind of powerful magic could be involved.~
== DGOBLINC ~Ugh, gnomes... always talk so much... if only my head wasn't hurting...~
END

// Grisella

I_C_T DGRISELL 5 C0MMinGrisella
== C0MMinJ IF ~IsValidForPartyDialogue("C0MMin")~ THEN ~Ack! Bugs! I didn't bring boots big enough for this. Tell me they don't bite.~
== DGRISELL ~Hard to say, dearie. With pincers that big, though... chances are they can do more than just bite.~
END

// Hailee

ADD_TRANS_TRIGGER DHAILEE 33 ~!IsValidForPartyDialogue("C0MMin")~ DO 0

EXTEND_TOP DHAILEE 33
+ ~IsValidForPartyDialogue("C0MMin")~ + ~Indeed, and listen to the song: 

    Hailee, Hailee, skipping amongst the trees 
    Keeper of secrets, whispered in the leaves 
    A secret for a secret, speak of what she sees!~ EXTERN C0MMinJ MINERVA-HAILEE-SONG
END

CHAIN C0MMinJ MINERVA-HAILEE-SONG
~哈哈，多可爱的一首歌，<GABBER>！也许不能让你出名，可我喜欢。~
EXTERN DHAILEE 34

// Hermit

I_C_T DHERMIT 0 C0MMinHermit1
== C0MMinJ IF ~IsValidForPartyDialogue("C0MMin")~ THEN ~Oof... we're lucky we didn't get buried under all that snow. The others... not so lucky.~
== DHERMIT ~You should worry more for yourselves. There's no going back after an avalanche like that. Are you all right?~
END

// Hjollder

INTERJECT DHJOLLDE 12 C0MMinHjollder1
== C0MMinJ IF ~IsValidForPartyDialogue("C0MMin")~ THEN ~The same Jerrod who was entombed beneath the temple of Tempus in Easthaven?~
EXTERN DHJOLLDE 13

I_C_T DHJOLLDE 26 C0MMinHjollder2
== C0MMinJ IF ~IsValidForPartyDialogue("C0MMin")~ THEN ~Wow... so that's how it feels to ride the wind. I wouldn't mind trying again... after taking a nice long break, that is.~
END

I_C_T DHJOLLDE 50 C0MMinHjollder3
== C0MMinJ IF ~IsValidForPartyDialogue("C0MMin")~ THEN ~And, uh... this obfuscation wasn't suspicious at all to you before now?~
END

// Hrothgar

I_C_T DHROTH 4 C0MMinHroth1
== C0MMinJ IF ~IsValidForPartyDialogue("C0MMin")~ THEN ~My, this is quite a collection, and many from distant lands... some of them are places even I haven't been. "Here and there" seems to be quite a long ways away from the Ten Towns.~
== DHROTH ~I'll not deny it. I could tell enough stories of these items, but I fear we'd be here quite awhile.~
END

// Icasaracht

I_C_T DICASA 17 C0MMinIcasaracht1
== C0MMinJ IF ~IsValidForPartyDialogue("C0MMin")~ THEN ~So those things she said while wearing Wylfdene's body weren't just lies meant to start a war. She really believes the world belonged to her.~
END

// Ilmadia

I_C_T DILMADIA 9 C0MMinIlmadia1
== C0MMinJ IF ~IsValidForPartyDialogue("C0MMin")~ THEN ~Ooh, devious. Absolutely horrifying, of course, but still.~
END

// Jermsy

CHAIN IF WEIGHT #-1 ~Global("C0MMinJermsyCellar","AR2005",1)~ THEN C0MMinJ JERMSY-CELLAR
~唔……？~ [C0BLANK]
DO ~IncrementGlobal("C0MMinJermsyCellar","AR2005",1)~
END
+ ~!CheckStatGT(Player1,16,DEX)
!CheckStatGT(Player1,14,INT)~ + ~Is something wrong, Minerva?~ + JERMSY-CELLAR-1
+ ~OR(2)
CheckStatGT(Player1,16,DEX)
CheckStatGT(Player1,14,INT)~ + ~You noticed too, Minerva?~ + JERMSY-CELLAR-2
+ ~!CheckStatGT(Player1,16,DEX)
!CheckStatGT(Player1,14,INT)~ + ~(Ignore her)~ EXIT
+ ~OR(2)
CheckStatGT(Player1,16,DEX)
CheckStatGT(Player1,14,INT)~ + ~*whisper* That door there, under the stairs? Be ready. It could be more goblins.~ + JERMSY-CELLAR-3

CHAIN C0MMinJ JERMSY-CELLAR-1
~我不敢确定，可楼梯下那扇门……我几乎肯定听见了动静。~
EXTERN C0MMinJ JERMSY-CELLAR-4

CHAIN C0MMinJ JERMSY-CELLAR-2
~嗯。楼梯下那扇门。要是咱们俩都听见了，那就肯定不是幻觉。~
EXTERN C0MMinJ JERMSY-CELLAR-4

CHAIN C0MMinJ JERMSY-CELLAR-3
~*点头*~
EXIT

CHAIN C0MMinJ JERMSY-CELLAR-4
~可能只是只老鼠，也可能是埋伏……不管哪种，我都再备一把刀，以防万一。~
EXIT

I_C_T DJERMSY 0 C0MMinJermsy1
== C0MMinJ IF ~IsValidForPartyDialogue("C0MMin")~ THEN ~Oh, phew. It's just a boy.~
== DJERMSY ~Are the goblins gone? Can I come out now?~
END

// Kaylessa

I_C_T DKAYLESS 11 C0MMinKaylessa1
== C0MMinJ IF ~IsValidForPartyDialogue("C0MMin")~ THEN ~Incredible... if this astrolabe's survived the passing of time, I'd love to see it for myself.~
END

// Kontik

I_C_T DKONTIK 7 C0MMinKontik
== C0MMinJ IF ~IsValidForPartyDialogue("C0MMin")~ THEN ~Uh oh... looks like our last encounter with that Aurilite Lysan's about to come back and bite us.~
END

// Kresselack

ADD_TRANS_TRIGGER DKRESSEL 30 ~!IsValidForPartyDialogue("C0MMin")~ DO 0

EXTEND_TOP DKRESSEL 30
+ ~IsValidForPartyDialogue("C0MMin")~ + ~精灵，这可不是答应给我的答案。~ EXTERN C0MMinJ MINERVA-KRESSELACK
END

CHAIN C0MMinJ MINERVA-KRESSELACK
~嗯……*严格说*他没答应给答案，所以他其实没义务告诉你什么，而结果就是咱们被骗了……呃，我闭嘴。~
EXTERN DKRESSEL 40

// Larrel

I_C_T DLARREL 54 C0MMinLarrel1
== C0MMinJ IF ~IsValidForPartyDialogue("C0MMin")~ THEN ~It's never a bad idea to be wary, but I'm not sure...~
END

// Luremaster

INTERJECT DCHALW 2 C0MMinLuremasterRiddle
== C0MMinJ IF ~IsGabber("C0MMin") IsValidForPartyDialogue("C0MMin")~ THEN ~Wind, of course.~
EXTERN DCHALW 8

I_C_T DLURE 30 C0MMinLuremaster1
== C0MMinJ IF ~IsValidForPartyDialogue("C0MMin")~ THEN ~*pant* Ha ha... you bet. Making our way through these challenges deserves to be remembered.~
END

// Malavon

EXTEND_TOP DMALASIM 0
+ ~Global("Golem_Commands","GLOBAL",1)
!IsGabber("C0MMin")
IsValidForPartyDialogue("C0MMin")~ + ~Minerva, would you care to do the honors?~ DO ~SetGlobal("Golem_Commands","GLOBAL",3)
Enemy()~ EXTERN C0MMinJ MINERVA-MALAVON
END

EXTEND_TOP DMALASIM 1
+ ~Global("Golem_Commands","GLOBAL",1)
!IsGabber("C0MMin")
IsValidForPartyDialogue("C0MMin")~ + ~Minerva, would you care to do the honors?~ DO ~SetGlobal("Golem_Commands","GLOBAL",3)
Enemy()~ EXTERN C0MMinJ MINERVA-MALAVON
END

EXTEND_TOP DMALASIM 2
+ ~Global("Golem_Commands","GLOBAL",1)
!IsGabber("C0MMin")
IsValidForPartyDialogue("C0MMin")~ + ~Minerva, would you care to do the honors?~ DO ~SetGlobal("Golem_Commands","GLOBAL",3)
Enemy()~ EXTERN C0MMinJ MINERVA-MALAVON
END

EXTEND_TOP DMALASIM 7
+ ~Global("Golem_Commands","GLOBAL",1)
!IsGabber("C0MMin")
IsValidForPartyDialogue("C0MMin")~ + ~Minerva, would you care to do the honors?~ DO ~SetGlobal("Golem_Commands","GLOBAL",3)
Enemy()~ EXTERN C0MMinJ MINERVA-MALAVON
END

CHAIN C0MMinJ MINERVA-MALAVON
~乐意之至！~
= ~卡拉姆，斯塔姆。算你们倒霉！~
EXTERN DMALASIM 10

// Maluradek

I_C_T DLORD 0 C0MMinMaluradek1
== C0MMinJ IF ~IsValidForPartyDialogue("C0MMin")~ THEN ~Crazy ghosts. It's always crazy ghosts! Can't we run into some more friendly ghosts for a change?~
END

// Mytos

I_C_T2 DMYTOS 25 C0MMinMytos1
== C0MMinJ IF ~!IsGabber("C0MMin") IsValidForPartyDialogue("C0MMin")~ THEN ~Well, you tried, <GABBER>. That's more than I probably would've had patience for.~
END

// Nym

I_C_T DNYM 0 C0MMinNym1
== C0MMinJ IF ~IsValidForPartyDialogue("C0MMin")~ THEN ~Umm... "honored one, you grace me..." something, something, "first meeting, I am... Nym?" ...Sorry, I'm not great with Drowish.~
END

// Orog Sentry

I_C_T2 DOSENTRY 2 C0MMinOrogSentry1
== C0MMinJ IF ~IsValidForPartyDialogue("C0MMin")~ THEN ~Well, that was succinct. Guess we can't criticize them for wasting any time.~
END

// Orrick

CHAIN IF WEIGHT #-1 ~Global("C0MMinBeenToOrrickTower","GLOBAL",2)~ THEN C0MMinJ ORRICK-TOWER-TALK
~我这一路没进过几座法师塔。它们跟奥尔利尔的塔差得远。~ [C0BLANK]
DO ~SetGlobal("C0MMinBeenToOrrickTower","GLOBAL",3)~
END
++ ~奥尔利尔的塔？~ + ORRICK-TOWER-TALK-1
++ ~不必细说。我没兴趣。~ EXIT

CHAIN C0MMinJ ORRICK-TOWER-TALK-1
~哦，我大概该解释一下。奥尔利尔是组成兰坦的岛屿之一。那儿住着少数兰坦奥术师，各自住在自己的魔法塔里。~
= ~他们的塔远没有这一座高、这么宏伟。连兰坦的法师都遵循本国的许多理念，所以他们的住处讲究高效实用。跟这些塔完全不同——这些塔好像都在争着压别人一头。~
= ~不过我猜法师一般不太在乎别人那套实用标准。嗯，我没别的意思。看见奥里克怎么盖他的塔，我就是想了想。~
EXIT

// Oswald

INTERJECT DOSWALD 2 C0MMinOswald1
== C0MMinJ IF ~IsValidForPartyDialogue("C0MMin")~ THEN ~In the air, hmm? I thought this thing had a similar design to a Lantanese airship.~
== DOSWALD ~Well now! I didn't expect anyone in these lands to recognize that. I'm not from Lantan, myself, but I did study briefly at the Sambaran Academy once upon a time. Might I ask your name, madam?~
== C0MMinJ ~Minerva Glimmershine, artificer and adventurer extraordinaire. I'd rather talk about this lovely airship of yours though... I've never seen one built like this before. Has it really seen flight?~
== DOSWALD ~Of course! This ship is of a more... economic design than you may be used to, but as my greatest invention, I am very proud of it all the same.~
COPY_TRANS DOSWALD 3

// Pomab

INTERJECT DPOMAB 6 C0MMinPomab
== C0MMinJ IF ~IsValidForPartyDialogue("C0MMin")~ THEN ~Really? Hmm... considering the distance between Calimshan and here, it sounds like a grandiose way of saying that you got sent somewhere far away so the important people could forget about you.~
EXTERN DPOMAB 9

I_C_T2 DPOMEND 11 C0MMinPomabEnd
== C0MMinJ IF ~IsValidForPartyDialogue("C0MMin")~ THEN ~Oh, I'm so looking forward to this!~
END

// Purvis

I_C_T DPURVIS 3 C0MMinPurvis1
== C0MMinJ IF ~!IsGabber("C0MMin") IsValidForPartyDialogue("C0MMin")~ THEN ~There's something... off about this one. He seems to be not right in the head, but... I don't know. I can't shake the feeling that he's messing with us somehow.~
END

INTERJECT DPURVIS 13 C0MMinPurvis2
== C0MMinJ IF ~IsValidForPartyDialogue("C0MMin")~ THEN ~Now I get it... you're the real assassin sent to kill Wylfdene, aren't you? I thought something was off when we met.~
EXTERN DPURVIS 19

INTERJECT DPURVIS 18 C0MMinPurvis3
== C0MMinJ IF ~IsValidForPartyDialogue("C0MMin")~ THEN ~Oh no, you don't!~
DO ~StartCutSceneMode()
ActionOverride("Purvis_5",EscapeArea())
EquipRanged()
Wait(2)
FaceObject("Purvis_5")
SetSequence(8)
SmallWait(4)
CreateVisualEffectObject("C0MBoom","Purvis_5")
ApplyDamage("Purvis_5",15,FIRE)
ApplyDamage("Purvis_5",20,MISSILE)
Kill("Purvis_5")
AddexperienceParty(20000)
Wait(2)
EndCutSceneMode()
SetGlobal("C0MMinKilledPurvis","GLOBAL",1)
StartDialogueNoSet(Player1)~ EXIT

CHAIN IF WEIGHT #-1 ~Global("C0MMinKilledPurvis","GLOBAL",1)~ THEN C0MMinJ MINERVA-KILLED-PURVIS
~没人快得过我的刀。~ [C0BLANK]
DO ~IncrementGlobal("C0MMinKilledPurvis","GLOBAL",1)~
END
++ ~干得好。~ EXIT
++ ~提醒我永远别惹你。~ EXIT
++ ~再没我招呼就干这种事，咱们就有问题。~ + MINERVA-KILLED-PURVIS-1

CHAIN C0MMinJ MINERVA-KILLED-PURVIS-1
~记下了。可我会听吗？……大概不会。我可没打算让他跑掉。~
EXIT

// Quimby

ADD_TRANS_TRIGGER DQUIMBY 2 ~False()~ DO 2

EXTEND_TOP DQUIMBY 2 #2
+ ~IsValidForPartyDialogue("C0MMin")~ + ~这个季节你们这儿有旅人吗？~ EXTERN DQUIMBY MINERVA-QUIMBY1
+ ~!IsValidForPartyDialogue("C0MMin")~ + ~这个季节你们这儿有旅人吗？~ EXTERN DQUIMBY MINERVA-QUIMBY2
END

CHAIN DQUIMBY MINERVA-QUIMBY1
~我们有两个！哈——哈！这比我几个月来的都多！你身边那位侏儒姑娘就算一个！~
== C0MMinJ IF ~!IsGabber("C0MMin")~ THEN ~*psst!* I'd just like to say, <GABBER>, that there's a point where a warm reception goes too far and ends up in the opposite direction...~
EXTERN DQUIMBY MINERVA-QUIMBY3

CHAIN DQUIMBY MINERVA-QUIMBY2
~我们有两个！哈——哈！这比我几个月来的都多！这附近原先有个侏儒姑娘，可惜她几乎不住那间房！*叹气*~
EXTERN DQUIMBY MINERVA-QUIMBY3

CHAIN DQUIMBY MINERVA-QUIMBY3
~除了她，另一间房还住着一个，对！对，他叫埃瑞文什么的。他是个精灵，而且还是冒险者！~
COPY_TRANS DQUIMBY 4

// Rakshasa

INTERJECT DRAKSH 0 C0MMinRakshasa1
== C0MMinJ IF ~IsValidForPartyDialogue("C0MMin")~ THEN ~Hobart?! How in Gond's name did you get in here so casually after what we had to go through?~
EXTERN DRAKSH 1

// Tarnelm

I_C_T2 DTARNELM 3 C0MMinTarnelm1
== C0MMinJ IF ~!IsGabber("C0MMin") IsValidForPartyDialogue("C0MMin")~ THEN ~Seriously, <GABBER>? Should I be a little more worried about myself now, after hearing you say that?~
END

// Temple of Tempus

I_C_T DEVERARD 14 C0MMinEverard1
== C0MMinJ IF ~IsValidForPartyDialogue("C0MMin")~ THEN ~Failed his god, maybe. Succeeded for the people, though? Definitely.~
== DEVERARD ~The way of Tempus is victory. Victory, meaning absolute triumph over one's foes in battle, not some foolish, self-centered ideal of martyrdom!~
END

I_C_T DEVERARD 16 C0MMinEverard2
== C0MMinJ IF ~IsValidForPartyDialogue("C0MMin")~ THEN ~Tch. And I thought some of the tutors of the Sambaran Academy were controversial.~
== DEVERARD ~If you have more to ask, say it and be done. I will not engage in futile debates in this matter.~
END

CHAIN IF WEIGHT #-1 ~Global("C0MMinTempusTemple","GLOBAL",1)~ THEN C0MMinJ TEMPUS-TEMPLE
~坦帕斯神庙……哈哈，奇怪。它跟标准的贡德教堂差得不能再差，可又不知怎么透出一样的虔诚气息。~ [C0BLANK]
DO ~IncrementGlobal("C0MMinTempusTemple","GLOBAL",1)~
END
+ ~Kit(LastTalkedToBy,OHTEMPUS)~ + ~我要是你，就不会在仇锤的殿堂里露出轻蔑。~ + TEMPUS-TEMPLE-OHTEMPUS
++ ~差得不能再差，是吧？~ + TEMPUS-TEMPLE-1
++ ~米涅瓦，你信贡德吗？~ + TEMPUS-TEMPLE-2
++ ~现在没时间闲聊。~ + TEMPUS-TEMPLE-END

CHAIN C0MMinJ TEMPUS-TEMPLE-END
~哦，别管我。就在自言自语……那我大概该在心里说。~
EXIT

CHAIN C0MMinJ TEMPUS-TEMPLE-OHTEMPUS
~哈哈，我没那么迟钝。我只是本来就不算虔诚的人，所以先道歉。~
EXTERN C0MMinJ TEMPUS-TEMPLE-3

CHAIN C0MMinJ TEMPUS-TEMPLE-1
~就「创造」与「战争的毁灭」能有多不同而言，是的……不算完全相反，可也差得够多。~
EXTERN C0MMinJ TEMPUS-TEMPLE-3

CHAIN C0MMinJ TEMPUS-TEMPLE-2
~某种意义上。不过我不算虔诚，所以别担心晚上会有突然的说教。除非你好这口。那样的话，抱歉了。~
EXTERN C0MMinJ TEMPUS-TEMPLE-3

CHAIN C0MMinJ TEMPUS-TEMPLE-3
~我想，你要是像祭司一样敬重你神明的理念，不管那些理念是什么，信仰都会透出来。~
= ~我不太喜欢战争和流血，可我能敬重盖起这样一座神庙所需的虔诚。~
END
+ ~Kit(LastTalkedToBy,OHTEMPUS)~ + ~战斗之主推行的是荣誉之战，不是单纯的暴力。~ + TEMPUS-TEMPLE-OHTEMPUS2
+ ~OR(2)
Class(Player1,CLERIC_ALL)
Class(Player1,PALADIN_ALL)~ + ~Devotion is what gives power to those like myself.~ + TEMPUS-TEMPLE-CLERIC
++ ~只要信仰是真诚的，就能在其中找到安宁。~ + TEMPUS-TEMPLE-4
++ ~我不知道。我自己不是虔诚的人。~ + TEMPUS-TEMPLE-5
++ ~眼下够了。~ EXIT

CHAIN C0MMinJ TEMPUS-TEMPLE-OHTEMPUS2
~哦，我没暗示别的。我只是不喜欢「战争不可避免」这套教条，就算它有点道理。~
EXTERN C0MMinJ TEMPUS-TEMPLE-6

CHAIN C0MMinJ TEMPUS-TEMPLE-CLERIC
~对，我知道。它让你能行奇迹，只要能给你机会帮别人，那就是好事。我只是更喜欢我自己的法子。~
EXTERN C0MMinJ TEMPUS-TEMPLE-6

CHAIN C0MMinJ TEMPUS-TEMPLE-4
~确实。我相信我对贡德的信仰是真诚的，可大部分时候我走自己的路。不过我愿意认为，这比嘴上说说强一层。~
EXTERN C0MMinJ TEMPUS-TEMPLE-6

CHAIN C0MMinJ TEMPUS-TEMPLE-5
~那看来你进来纯粹是出于好奇。我不怪你，我自己也好奇得很。~
EXTERN C0MMinJ TEMPUS-TEMPLE-6

CHAIN C0MMinJ TEMPUS-TEMPLE-6
~不过我想你进来不是为了听我唠叨装饰。那就去吧！办你进来要办的事。~
EXIT

// Therik

I_C_T DTHERIK 0 C0MMinTherik
== C0MMinJ IF ~IsValidForPartyDialogue("C0MMin")~ THEN ~Classic words for tomb guardians. So, do we listen or go forth anyway?~
== DTHERIK ~...~
END

// Tiernon

INTERJECT DTIERNON 1 C0MMinTiernon1
== C0MMinJ IF ~IsValidForPartyDialogue("C0MMin")~ THEN ~Wait... I remember hearing about a Tiernon from the Hearthstone Clan during my travels in the Sunset Mountains. Is that you?~
DO ~AddXP2DA("Level_8_Easy")
DisplayStringNoNameDlg(Myself,18517)
SetGlobal("Tiernon_Rep","GLOBAL",1)
AddJournalEntry(23537,INFO)~ EXTERN DTIERNON 49

INTERJECT DTIERNON 33 C0MMinTiernon1
== C0MMinJ IF ~IsValidForPartyDialogue("C0MMin")~ THEN ~Wait... I remember hearing about a Tiernon from the Hearthstone Clan during my travels in the Sunset Mountains. Is that you?~
DO ~AddXP2DA("Level_8_Easy")
DisplayStringNoNameDlg(Myself,18517)
SetGlobal("Tiernon_Rep","GLOBAL",1)
AddJournalEntry(23537,INFO)~ EXTERN DTIERNON 50

I_C_T DTIERNON 25 C0MMinTiernon2
== C0MMinJ IF ~IsValidForPartyDialogue("C0MMin")~ THEN ~Phew, that sounds absolutely mystical. I'd love to make something out of ice like that.~
END

CHAIN IF WEIGHT #-1 ~Global("C0MMinGloomfrostWeapon","GLOBAL",1)~ THEN C0MMinJ MINERVA-GLOOMFROST-WEAPON
~多美的造物！它不只是件武器，它……它是件艺术品！~ [C0BLANK]
DO ~IncrementGlobal("C0MMinGloomfrostWeapon","GLOBAL",1)~
END
+ ~OR(2)
Class(Player1,BARD_ALL)
Race(Player1,DWARF)~ + ~Tiernon truly is as masterful as his tales tell.~ + MINERVA-GLOOMFROST-WEAPON-1
++ ~确实。我从没见过这样的东西。~ + MINERVA-GLOOMFROST-WEAPON-2
++ ~只要它有用，我才不在乎它长什么样。~ + MINERVA-GLOOMFROST-WEAPON-3
++ ~等咱们出了这座冰川，你爱怎么欣赏就怎么欣赏。~ EXIT

CHAIN C0MMinJ MINERVA-GLOOMFROST-WEAPON-1
~对，也许还不止。你见过有人用纯冰做出这样的东西吗？~
EXTERN C0MMinJ MINERVA-GLOOMFROST-WEAPON-4

CHAIN C0MMinJ MINERVA-GLOOMFROST-WEAPON-2
~我也没见过。就算我走过那么多地方，用纯冰做出这种东西也像童话里的一段。~
EXTERN C0MMinJ MINERVA-GLOOMFROST-WEAPON-4

CHAIN C0MMinJ MINERVA-GLOOMFROST-WEAPON-3
~<PLAYER1>，你的惊叹心呢？你能有几回见到用纯冰做出的这种东西？~
EXTERN C0MMinJ MINERVA-GLOOMFROST-WEAPON-4

CHAIN C0MMinJ MINERVA-GLOOMFROST-WEAPON-4
~好好用它，<PLAYER1>！这样的杰作该发挥到极致才对得起它。~
END
+ ~PartyHasItem("FANGGF")~ + ~这队里使刀你最强。你干嘛不用它？~ + MINERVA-GLOOMFROST-WEAPON-5
++ ~放心，我会的。~ EXIT
++ ~看看吧。要是让我失望，至少还能卖个好价。~ EXIT

CHAIN C0MMinJ MINERVA-GLOOMFROST-WEAPON-5
~哦，我很乐意！只是蒂尔农把它托付给你之后，我不好意思开口要。可你要是想让我照管它，那我就照管。~
EXIT

// Tybald

INTERJECT DTYBALD 5 C0MMinTybald1
== C0MMinJ IF ~IsValidForPartyDialogue("C0MMin")~ THEN ~Oh, come now, there's no harm in a little prank now and again... but that's not the whole story, is it?~
EXTERN DTYBALD 6

// Wylfdene

I_C_T DWYLF 5 C0MMinWylfdene1
== C0MMinJ IF ~IsValidForPartyDialogue("C0MMin")~ THEN ~*sigh* If we're going to start arguing over whose way of life is more pestilent, we might as well pack up and go home. People who start this debate are stubborn as mules.~
END

I_C_T DWYLF 20 C0MMinWylfdene2
== C0MMinJ IF ~IsValidForPartyDialogue("C0MMin")~ THEN ~Uh oh. Looks like it might be time to bring out the knives...~
END

I_C_T DWYLF 51 C0MMinWylfdene3
== C0MMinJ IF ~IsValidForPartyDialogue("C0MMin")~ THEN ~He's afraid, <PLAYER1>. We've got him now.~
END

// Yxunomei

I_C_T DYXUN 32 C0MMinYxunomei
== C0MMinJ IF ~IsValidForPartyDialogue("C0MMin")~ THEN ~A debate that's spurred eons-long conflict between philosophers all across Toril. I've never seen someone dismiss it as casually as this though.~
END

// PID

CHAIN IF ~IsGabber(Player1) CombatCounter(0) !Detect([ENEMY])~ THEN C0MMinJ pid
~<PLAYER1>，怎么样？~ [C0MMif]
END
 + ~RandomNum(4,1)
 HPPercentGT(Myself,74)~ + ~How are you?~ + PID-1-1A
 + ~RandomNum(4,2)
 HPPercentGT(Myself,74)~ + ~How are you?~ + PID-1-1B
 + ~RandomNum(4,3)
 HPPercentGT(Myself,74)~ + ~How are you?~ + PID-1-1C
 + ~RandomNum(4,4)
 HPPercentGT(Myself,74)~ + ~How are you?~ + PID-1-1D
 + ~RandomNum(2,1)
 HPPercentLT(Myself,75)
 HPPercentGT(Myself,24)~ + ~How are you?~ + PID-1-2A
 + ~RandomNum(2,2)
 HPPercentLT(Myself,75)
 HPPercentGT(Myself,24)~ + ~How are you?~ + PID-1-2B
 + ~HPPercentLT(Myself,25)~ + ~你怎么样？~ + PID-1-3
 ++ ~有什么想法想说？~ + PID-2
 ++ ~关于你的手艺……~ + PID-COOKING
 + ~OR(2)
 Global("C0MMinRomanceActive","GLOBAL",1)
 Global("C0MMinRomanceActive","GLOBAL",2)~ + ~About us...~ + PID-ROMANCE
 ++ ~我能问你个问题吗？~ + PID-QUESTIONS
 ++ ~我觉得你的嗓子有点问题。~ + stringfix
 ++ ~我现在什么都不需要。~ EXIT

CHAIN C0MMinJ PID-1-1A
~我饿了。到饭点了吗？咱们有鱼吗？我现在特别想吃硬头鳟。唔……~
EXIT
 
CHAIN C0MMinJ PID-1-1B
~唔……我突然很想打雪仗。或者爬爬树。哦，一边爬树梢一边打雪仗。听着就好玩！~
EXIT
 
CHAIN C0MMinJ PID-1-1C
~你能看看我后脑勺的头发什么样吗？我找不到镜子。~
EXIT
 
CHAIN C0MMinJ PID-1-1D
~咱们有蛋糕吗？我想要个蛋糕。带糖霜和彩针的。什么？没有？哼。~
EXIT
 
CHAIN C0MMinJ PID-1-2A
~我会没事的。上点药膏就一切妥当。~
EXIT
 
CHAIN C0MMinJ PID-1-2B
~不用为我担心！我梦游时弄的伤口和淤伤比这厉害多了。~
EXIT

CHAIN C0MMinJ PID-1-3
~哎哟哎哟……看这么多血，<PLAYER1>！呃，红色真不适合我……~
EXIT 

CHAIN C0MMinJ PID-COOKING
~唔？怎么了？~
END
+ ~Global("C0MMinRomanceActive","GLOBAL",2)~ + ~要是哪天咱们一起安顿下来，做饭归我，说定了。~ + PID-COOKING-1
++ ~太可怕了！你这手艺哪儿学的？~ + PID-COOKING-1
++ ~我再、再、再也不会吃你做的东西了。~ + PID-COOKING-1
++ ~你要是做饭跟发明一样强就好了。~ + PID-COOKING-1
++ ~很好！希望你下一顿再给我个惊喜。~ + PID-COOKING-2
++ ~再想想，还是算了……~ EXIT

CHAIN C0MMinJ PID-COOKING-1
~哎，这可真没礼貌！告诉你，我完全是自己练出来的，而且从没人跟我抱怨过第二次！~
END
++ ~大概因为他们从没吃过你第二顿……或者他们已经死了。~ + PID-COOKING-3
++ ~这……不太算得上什么夸奖。~ + PID-COOKING-3
++ ~那就是说确实有人抱怨。还挺经常。~ + PID-COOKING-3
++ ~好，我，呃，就信你这话。~ EXIT

CHAIN C0MMinJ PID-COOKING-2
~你品味真好！等我弄到材料做我的「又烫又苦虫子蛋炖汤」。准能把你的味蕾炸开！~
EXIT

CHAIN C0MMinJ PID-COOKING-3
~哼！~
EXIT

CHAIN C0MMinJ PID-2
~这会儿？唔……让我想想……~
END
IF ~RandomNum(20,1)~ + PID-2-11
IF ~RandomNum(20,2)~ + PID-2-12
IF ~RandomNum(20,3)~ + PID-2-13
IF ~RandomNum(20,4)~ + PID-2-14
IF ~RandomNum(20,5)~ + PID-2-15
IF ~RandomNum(20,6)~ + PID-2-16
IF ~RandomNum(20,7)~ + PID-2-17
IF ~RandomNum(20,8)~ + PID-2-18
IF ~RandomNum(20,9)~ + PID-2-19
IF ~RandomNum(20,10)~ + PID-2-20
IF ~RandomNum(20,11)~ + PID-2-11
IF ~RandomNum(20,12)~ + PID-2-12
IF ~RandomNum(20,13)~ + PID-2-13
IF ~RandomNum(20,14)~ + PID-2-14
IF ~RandomNum(20,15)~ + PID-2-15
IF ~RandomNum(20,16)~ + PID-2-16
IF ~RandomNum(20,17)~ + PID-2-17
IF ~RandomNum(20,18)~ + PID-2-8
IF ~RandomNum(20,19)~ + PID-2-9
IF ~RandomNum(20,20)~ + PID-2-10
IF ~RandomNum(20,1) InParty("C0Karihi")~ + PID-2-KARIHI-1
IF ~RandomNum(20,2) InParty("C0Karihi")~ + PID-2-KARIHI-2
IF ~RandomNum(20,3) InParty("C0Karihi")~ + PID-2-KARIHI-3
IF ~RandomNum(20,4) InParty("C0Karihi") Alignment("C0Karihi",MASK_GOOD)~ + PID-2-KARIHI-4
IF ~RandomNum(20,5) InParty("C0Karihi") !Alignment("C0Karihi",MASK_GOOD)~ + PID-2-KARIHI-5
IF ~RandomNum(20,6) InParty("C0Urchin")~ + PID-2-URCHIN-1
IF ~RandomNum(20,7) InParty("C0Urchin")~ + PID-2-URCHIN-2
IF ~RandomNum(20,8) InParty("C0Urchin")~ + PID-2-URCHIN-3
IF ~RandomNum(20,9) InParty("C0Dusky")~ + PID-2-DUSKY-1
IF ~RandomNum(20,10) InParty("C0Dusky")~ + PID-2-DUSKY-2
IF ~RandomNum(20,11) PartyHasItem("HEARTGM")~ + PID-2-1
IF ~RandomNum(20,12)
	OR(22)
	AreaCheck("AR5000")
	AreaCheck("AR5001")
	AreaCheck("AR5002")
	AreaCheck("AR5003")
	AreaCheck("AR5004")
	AreaCheck("AR5101")
	AreaCheck("AR5102")
	AreaCheck("AR5103")
	AreaCheck("AR5104")
	AreaCheck("AR5201")
	AreaCheck("AR5202")
	AreaCheck("AR5203")
	AreaCheck("AR5204")
	AreaCheck("AR5301")
	AreaCheck("AR5302")
	AreaCheck("AR5303")
	AreaCheck("AR5304")
	AreaCheck("AR5401")
	AreaCheck("AR5402")
	AreaCheck("AR5403")
	AreaCheck("AR5404")
	AreaCheck("AR5502")~ + PID-2-2
IF ~RandomNum(20,13)
	OR(17)
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
	AreaCheck("AR2114")
	AreaCheck("AR2115")
	AreaCheck("AR2116")~ + PID-2-3
IF ~RandomNum(20,14)
	GlobalGT("Chapter","GLOBAL",4)~ + PID-2-4
IF ~RandomNum(20,15)
	OR(4)
	HasItemEquiped("dagg11",Myself)
	HasItemEquiped("dagg12",Myself)
	HasItemEquiped("lover",Myself)
	HasItemEquiped("l#ffda",Myself)~ + PID-2-5
IF ~RandomNum(20,16)
	Global("HOW_COMPLETED","GLOBAL",1)~ + PID-2-6
IF ~RandomNum(20,17)
	Global("Master_Quest","GLOBAL",7)~ + PID-2-7

CHAIN C0MMinJ PID-2-KARIHI-1
~我问卡里希，要是我能做出防火染料，她愿不愿试试——她就瞪我。我只是告诉她，我想看能不能让她头发上的火焰亮出不同颜色！可看来她也不许。~
EXIT

CHAIN C0MMinJ PID-2-KARIHI-2
~你不能否认卡里希的衣着品味好。我想，既然得用魔法让衣服防火，自然只挑最好的。我？那样的裙子我几分钟就能扯出个大洞。或者弄上泥。她老骂我衣服太脏。~
EXIT

CHAIN C0MMinJ PID-2-KARIHI-3
~千万别暗示卡里希她的法术是抄别人的。我就小小地暗示了一下，她理解歪了，然后……嗯，我最喜欢的那双袜子没了。*叹气* 还是穿在脚上的时候！~
EXIT

CHAIN C0MMinJ PID-2-KARIHI-4
~卡里希最近和气多了，你注意到没？至少咱们争论魔法对科学的时候，我不用再手边备着防火药水了。你知道，万一她火了把我头发点着……又一次。~
EXIT

CHAIN C0MMinJ PID-2-KARIHI-5
~我有时真想在卡里希头上烤棉花糖，可她绝不会答应。可惜她睡着时头发就熄了，不然我夜里就试试。前提是我有棉花糖。可我没有。*叹气*~
EXIT

CHAIN C0MMinJ PID-2-URCHIN-1
~只有厄钦肯吃我的蜜汁蘑菇。我一直跟大家说那绝对安全又健康！可他们不肯尝。~
EXIT

CHAIN C0MMinJ PID-2-URCHIN-2
~我今天教了厄钦几个新词！他学得真快。以后我再想办法让他把字咬清楚。也许是他牙齿的问题……我要是有过牙医训练就能修。算了。~
EXIT

CHAIN C0MMinJ PID-2-URCHIN-3
~唔……上次咱们在野外扎营，我想跟厄钦打雪仗。除非你垫得够厚，还戴头盔，不然我不建议试。他胳膊力可真大。我身上还有淤伤呢，看？~
EXIT

CHAIN C0MMinJ PID-2-DUSKY-1
~自打达斯基加入咱们，我总觉得我在更卖力地显摆。想证明谁才是更好的游荡者之类的。*小声* 是我。~
EXIT

CHAIN C0MMinJ PID-2-DUSKY-2
~达斯基腿那么长，藏身却挺在行。我好奇他怎么做到的。我一藏就觉得自己长了双鸭脚。我最多就是钻进桶里憋着气。~
EXIT

CHAIN C0MMinJ PID-2-1
~我在想心石宝石……你觉得它是活的吗？它有些地方就是……让我觉得它可能是。~
EXIT

CHAIN C0MMinJ PID-2-2
~断手塔……嗯，肯定很美。可想到这样的东西从前能有多伟大，我也挺难过。~
EXIT

CHAIN C0MMinJ PID-2-3
~我喜欢库尔达哈这儿。不过我怕要是在这儿待太久、享受太久，就懒得不走了……哈哈……不，那绝不会发生。我腻得太快。~
EXIT

CHAIN C0MMinJ PID-2-4
~我希望我的后代有一天也去这样的冒险。待在家里的人不知道自己错过了什么。~
EXIT

CHAIN C0MMinJ PID-2-5
~偶尔有把会回来的匕首挺好。我有点厌倦拿碎料自己做刀了。我以前也有过一把这样的魔法匕首。它插进一个食人魔身上，那家伙掉下悬崖，我就丢了。看来魔法的范围有限。~
EXIT

CHAIN C0MMinJ PID-2-6
~我已经想念孤木镇了。真好玩，不是吗？除了差点冻死好几回那段。那段我可以不要。要是能有更多那样的冒险，也可以忍受！~
EXIT

CHAIN C0MMinJ PID-2-7
~被传到安纳洛克又回来，让我重新懂得欣赏暖和天气。我本来都快习惯冷了！*哆嗦*~
EXIT

CHAIN C0MMinJ PID-2-8
~<PLAYER1>，你觉得这一切背后是谁？我押什么？外层位面的入侵者。在我看来只有这个说得通。~
EXIT

CHAIN C0MMinJ PID-2-9
~我在想练另一种兵器。长剑有点重，不过我想我能行。或者长矛……要是我能找到一根不比我高两倍的。帮我留意着，好吗？~
EXIT

CHAIN C0MMinJ PID-2-10
~我不知道。这一路上我有时觉得自己炸东西更有用。身边没人替你动脑子的时候，动脑子更紧要。~
EXIT

CHAIN C0MMinJ PID-2-11
~现在没有。我正忙着解世界的谜。用数学。在脑子里。哎，头疼。来块蜜蛋糕就好了。~
EXIT

CHAIN C0MMinJ PID-2-12
~昨天晚饭我试着把奶酪化在苹果干上。哦，别那副表情——不难吃！我只是希望有点香料能加进去。~
EXIT

CHAIN C0MMinJ PID-2-13
~呃……你知道昨晚那事吧？不是我干的。~
END
++ ~什么事？~ + PID-2-13-A
++ ~行。~ EXIT
++ ~所以旧袜子是自己跑进锅里的？~ + PID-2-13-B

CHAIN C0MMinJ PID-2-13-A
~你知道，*那件*事……哦，你不知道？噫。就当我什么都没说。~
EXIT

CHAIN C0MMinJ PID-2-13-B
~那……不是我说的事。~
END
++ ~你说的到底是*什么*？~ + PID-2-13-A
++ ~好吧。~ EXIT

CHAIN C0MMinJ PID-2-14
~你知道什么好吗？枫糖浆腌白菜！不行？为什么不行？~
EXIT

CHAIN C0MMinJ PID-2-15
~唔……是打膝盖还是打眼睛？我不确定……<PLAYER1>，你觉得哪个更管用？~
EXIT

CHAIN C0MMinJ PID-2-16
~呃。抱歉，现在想不了。我靴子上有个洞。靴子有洞的时候我从来想不了事。~
EXIT

CHAIN C0MMinJ PID-2-17
~我觉得咱们能成！怎么成？别问。只管信。不然就不灵。~
EXIT

CHAIN C0MMinJ PID-2-18
~说实话，我不确定你需要我的建议。在我看来这趟走得挺直。本来能复杂得多。咱们本来可能在剑湾应付阴谋。~
EXIT

CHAIN C0MMinJ PID-2-19
~还是没见到铂金龙。这趟旅程还没到了不起的顶点。~
EXIT

CHAIN C0MMinJ PID-2-20
~啊，咱们会没事的。我是说，事情总能比现在更糟，对吧？那就干脆想象它们会变好！~
EXIT

CHAIN C0MMinJ stringfix
~哦天。我哼几句把气氛调回来。「啦啦啦啦啦啦啦——」~
DO ~ClearAllActions() 
      StartCutSceneMode() 
      StartCutScene("C0MMinR")~ EXIT
	  
CHAIN C0MMinJ PID-ROMANCE
~嗯哼？~
END
// + ~Global("C0MMinRomanceActive","GLOBAL",1) Global("C0MMinRomPID1","GLOBAL",1)~ + ~Can I call you Mini?~ DO ~SetGlobal("C0MMinRomPID1","GLOBAL",1)~ + rpid.1
 + ~Global("C0MMinRomanceActive","GLOBAL",1)~ + ~我想说，我希望咱们还是做朋友。~ DO ~SetGlobal("C0MMinRomanceActive","GLOBAL",3)~ + breakromance1
 + ~Global("C0MMinRomanceActive","GLOBAL",2)~ + ~我想结束咱们的关系。~ DO ~SetGlobal("C0MMinRomanceActive","GLOBAL",3)~ + breakromance2
 ++ ~其实我没想说什么。~ EXIT
 /*
CHAIN C0MMinJ rpid.1
~什——不。不！我自从……噫，就没被人这么叫过了。~
END
++ ~哎，我还以为你会喜欢。~ + rpid.1.1
++ ~你以前被这么叫过？~ + rpid.1.2
++ ~好，就当我没问。~ + rpid.1.3

CHAIN C0MMinJ rpid.1.1
~我不讨厌。可这很尴尬！我以前比现在还小的时候被这么叫过！~
EXTERN C0MMinJ rpid.1.3

CHAIN C0MMinJ rpid.1.2
~很久、很久以前。那时我是个傻乎乎的年轻侏儒。我以为我早过了那个绰号！~
EXTERN C0MMinJ rpid.1.3

CHAIN C0MMinJ rpid.1.3
~嗯，要是你叫的话，我倒不那么介意……你喜欢就叫小咪。可别在别人面前叫！~
EXIT
*/
CHAIN C0MMINJ breakromance1
~好。我不介意有你这么棒的朋友，<PLAYER1>！~
EXIT
 
CHAIN C0MMINJ breakromance2
~哦。嗯，那……有点失望，我想。不过这种事我以前遇过。我撑得住。~
EXIT
 
CHAIN C0MMinJ PID-QUESTIONS
~当然！问吧……还有，呃……你想让我停就随时打断我。有人说我爱东拉西扯。~
END
+ ~Global("C0MMinKnowsFamily","GLOBAL",1) Global("C0MMinPID1","GLOBAL",0)~ + ~你会想你前夫和儿子吗？~ DO ~SetGlobal("C0MMinPID1","GLOBAL",1)~ + PID-Q-1
+ ~GlobalGT("Chapter","GLOBAL",5) Global("C0MMinPID2","GLOBAL",0)~ + ~你觉得下次冒险你会去哪儿？~ DO ~SetGlobal("C0MMinPID2","GLOBAL",1)~ + PID-Q-2
+ ~Global("C0MMinPID3","GLOBAL",0)~ + ~你考虑过学魔法吗？~ DO ~SetGlobal("C0MMinPID3","GLOBAL",1)~ + PID-Q-3
+ ~Global("C0MMinPID4","GLOBAL",0)~ + ~你使刀真行。你在哪儿受的训练？~ DO ~SetGlobal("C0MMinPID4","GLOBAL",1)~ + PID-Q-4
+ ~Global("C0MMinPID5","GLOBAL",0)~ + ~你怀念家乡的什么吗？~ DO ~SetGlobal("C0MMinPID5","GLOBAL",1)~ + PID-Q-5
+ ~Global("C0MMinPID6","GLOBAL",0)~ + ~你这蓝头发到底是怎么回事？~ DO ~SetGlobal("C0MMinPID6","GLOBAL",1)~ + PID-Q-6
++ ~你觉得咱们的同伴怎么样？~ + PID-Q-COMPANIONS
++ ~其实我没什么想问的。~ EXIT

CHAIN C0MMinJ PID-Q-1
~嗯……我不知道。有时候会。我有些美好回忆：白天在工坊干完活，我和亚瑟一起回家，坐在桌边捧着茶杯和蛋糕……我上楼哄凯罗斯睡觉、给他讲睡前故事的时候，他就留在楼下，然后我下去，咱们聊到天亮……~
= ~我为没能满足于那种生活而抱歉。我知道这自私。可咱们分开时并不难过。我还惦记亚瑟，就算咱们不在一起了。我希望有一天能跟凯罗斯讲讲我自己的故事。~
EXIT

CHAIN C0MMinJ PID-Q-2
~哦，我从来决定不了。通常我就挑个方向，能走多远走多远。不知道去哪儿不是更有意思吗？~
EXIT

CHAIN C0MMinJ PID-Q-3
~也许一两次。老实说我不太在行。不过我觉得现在的人对魔法有点太痴迷了。~
EXIT

CHAIN C0MMinJ PID-Q-4
~我是自学的。我知道，我知道，很难相信……我挺厉害的，对吧？精准和精确在造物和飞刀里都是核心。我两样都拿手也不奇怪。~
= ~不过我也不反对偶尔在战斗里贴身硬拼。用匕首打的好处就在这儿——什么局面都能站得住。比弓或投石索百搭多了。~
EXIT

CHAIN C0MMinJ PID-Q-5
~我不是不想家。我只是更喜欢冒险。不过外头的醋栗酱和鱼派，怎么都比不上兰坦的……唔，吃的。到饭点了吗？~
EXIT

CHAIN C0MMinJ PID-Q-6
~哦，这是我们闪辉家爱干的事。我本来的头发在晴天大概能晃瞎你。先是橙色，后来绿色。我还在一段，呃，「时期」里染过黑的。脸上还涂深色睫毛膏什么的……咦，想起来都尴尬。~
= ~不过眼下蓝色是我最喜欢的。也许以后我会换成别的，可我最喜欢这个。它既安宁又鲜明，一下就两样都有。~
EXIT

CHAIN C0MMinJ PID-Q-COMPANIONS
~哦，我最爱听点闲话。你想听谁的？~
END
+ ~InParty("L#DUSKY")~ + ~登杰利昂。~ + PID-DENDJELION
+ ~InParty("L#DUSKY")~ + ~达斯基。~ + PID-DUSKY
+ ~InParty("O#HOLVIR")~ + ~霍尔维尔。~ + PID-HOLVIR
+ ~InParty("L#INA")~ + ~伊娜。~ + PID-INA
+ ~InParty("C0KARIHI")~ + ~卡里希。~ + PID-KARIHI
+ ~InParty("O#KORIN")~ + ~科林。~ + PID-KORIN
+ ~InParty("O#NELLA")~ + ~内拉。~ + PID-NELLA
+ ~InParty("L#OM")~ + ~橡颚。~ + PID-OM
+ ~InParty("O#SEVERN")~ + ~塞文。~ + PID-SEVERN
+ ~InParty("O#TERI")~ + ~泰瑞。~ + PID-TERI
+ ~InParty("L#TIPPS")~ + ~蒂普斯。~ + PID-OM
+ ~InParty("L#URCHIN")~ + ~厄钦。~ + PID-URCHIN
++ ~算了。~ EXIT

CHAIN C0MMinJ PID-Q-COMPANIONS-2
~还有别人吗？~
END
+ ~InParty("L#DUSKY")~ + ~登杰利昂。~ + PID-DENDJELION
+ ~InParty("L#DUSKY")~ + ~达斯基。~ + PID-DUSKY
+ ~InParty("O#HOLVIR")~ + ~霍尔维尔。~ + PID-HOLVIR
+ ~InParty("L#INA")~ + ~伊娜。~ + PID-INA
+ ~InParty("C0KARIHI")~ + ~卡里希。~ + PID-KARIHI
+ ~InParty("O#KORIN")~ + ~科林。~ + PID-KORIN
+ ~InParty("O#NELLA")~ + ~内拉。~ + PID-NELLA
+ ~InParty("L#OM")~ + ~橡颚。~ + PID-OM
+ ~InParty("O#SEVERN")~ + ~塞文。~ + PID-SEVERN
+ ~InParty("O#TERI")~ + ~泰瑞。~ + PID-TERI
+ ~InParty("L#TIPPS")~ + ~蒂普斯。~ + PID-OM
+ ~InParty("L#URCHIN")~ + ~厄钦。~ + PID-URCHIN
++ ~算了。~ EXIT

CHAIN C0MMinJ PID-DENDJELION
~你知道吗，我去过西门城。他远没有那儿最糟的那么糟。我不知道这说明的是他，还是他的出身。~
EXTERN C0MMinJ PID-Q-COMPANIONS-2

CHAIN C0MMinJ PID-DUSKY
~哦，他挺行。修修补补这种事我自然比他强，可我承认潜行我不如他。不过别告诉他我说过这话。他会得意好几天。~
EXTERN C0MMinJ PID-Q-COMPANIONS-2

CHAIN C0MMinJ PID-HOLVIR
~深水城的骑士真是……专业。有点像演员。他有没有放松警惕的时候？嘿，有的话告诉我，好吗？~
EXTERN C0MMinJ PID-Q-COMPANIONS-2

CHAIN C0MMinJ PID-INA
~她让我希望多些像她这样的鬼。多点友善的鬼，少点夜里瘆人的恐怖东西。想想探地窖会舒服多少！~
EXTERN C0MMinJ PID-Q-COMPANIONS-2

CHAIN C0MMinJ PID-KARIHI
~她脾气不小，对吧？不过我喜欢她。她读的书在某些题目上几乎能让我惭愧。只是小心别太惹她。她可能会炸开。~
EXTERN C0MMinJ PID-Q-COMPANIONS-2

CHAIN C0MMinJ PID-KORIN
~他算是不错。不过太爱沉着脸。就算按精灵算也是。不知道你挠他痒他会不会笑？……我？不，我不冒这个险。~
EXTERN C0MMinJ PID-Q-COMPANIONS-2

CHAIN C0MMinJ PID-NELLA
~我以为我认识的人里有些不睡觉的工作狂。然后——我遇见了内拉。其实还挺激励人。她那么拼命照顾所有人，我一偷懒就内疚，结果我也干得更拼。~
EXTERN C0MMinJ PID-Q-COMPANIONS-2

CHAIN C0MMinJ PID-OM
~我跟他处得来。不过每次说话都得仰着脖子，有点难受。尤其我仰头的时候大多正对着太阳。~
EXTERN C0MMinJ PID-Q-COMPANIONS-2

CHAIN C0MMinJ PID-SEVERN
~身边没个吟游诗人，队伍就不完整。毕竟总得有人有一天来讲咱们的故事！而我个人讲故事的能耐糟透了。我容易扯到跟故事毫无关系的别的上头去……至少别人是这么说的。~
EXTERN C0MMinJ PID-Q-COMPANIONS-2

CHAIN C0MMinJ PID-TERI
~泰瑞很好玩，可就凭她那手指乱摸的毛病，她是绝、绝、*绝不*会被允许进兰坦的。真可惜。我觉得她能把家乡弄热闹不少。~
EXTERN C0MMinJ PID-Q-COMPANIONS-2

CHAIN C0MMinJ PID-TIPPS
~你觉得所有变成石头的人变回来之后都这么暴躁吗？我觉得他身上还有些地方僵着。哦……这话说出来不对。~
EXTERN C0MMinJ PID-Q-COMPANIONS-2

CHAIN C0MMinJ PID-URCHIN
~他有点让我想起我妹妹以前养的一只狗。不算最好看，可你就是忍不住想摸他。也许是因为他流口水……什么？你不同意？~
EXTERN C0MMinJ PID-Q-COMPANIONS-2
