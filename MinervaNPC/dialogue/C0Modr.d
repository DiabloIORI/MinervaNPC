CHAIN IF WEIGHT #-1 ~IsGabber("C0MMin")~ THEN C0MODR a0
~本单位立正待命。~
END 
+ ~CombatCounter(0)
HPPercentLT(Myself,100)~ + ~Repair.~ + repair
+ ~Global("Standby","LOCALS",0)~ + ~待机。~ DO ~SetGlobal("Standby","LOCALS",1) RemoveFamiliar()~ EXIT
+ ~Global("Standby","LOCALS",1)~ + ~跟随。~ DO ~SetGlobal("Standby","LOCALS",0) AddFamiliar()~ EXIT
++ ~拆解。~ DO ~Kill(Myself)~ EXIT
+ ~Global("SelfDefense","LOCALS",0)~ + ~关闭自卫协议。~ DO ~SetGlobal("SelfDefense","LOCALS",1)~ + disableAI
+ ~Global("SelfDefense","LOCALS",1)~ + ~启用自卫协议。~ DO ~SetGlobal("SelfDefense","LOCALS",0)~ + enableAI
++ ~退出~ EXIT

CHAIN C0MODR repair
~正在修复损伤……~
DO ~FadeFromColor([30.0],0)~
= ~本单位已完全修复。~
DO ~ApplySpellRES("c0repair",Myself)~ EXIT

CHAIN C0MODR disableAI
~自卫协议已停用。本单位除跟随并保护其创造者外，不再自行采取行动。~
EXIT

CHAIN C0MODR enableAI
~自卫协议已启用。本单位将抵御一切敌对者，保护自身与其创造者。~
EXIT

CHAIN IF WEIGHT #-1 ~!IsGabber("C0MMin")~ THEN C0MODR b0
~本单位无视你。~
EXIT