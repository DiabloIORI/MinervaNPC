BEGIN C0AUALCH

IF ~True()~ THEN BEGIN alchemy
SAY ~你想制造什么？

（注：在野外进行炼金要贵得多！）~
+ ~!Global("C0AUIN5","GLOBAL",1)~ + ~药水~ DO ~SetGlobal("C0ArtificerAlchemy","LOCALS",1) StartStore("c0aupot1",LastTalkedToBy(Myself))~ EXIT
+ ~Global("C0AUIN5","GLOBAL",1)~ + ~标准药水~ DO ~SetGlobal("C0ArtificerAlchemy","LOCALS",1) StartStore("c0aupot1",LastTalkedToBy(Myself))~ EXIT
+ ~Global("C0AUIN5","GLOBAL",1) Global("C0AdvancedAlchemy","LOCALS",0)~ + ~高级药水~ DO ~SetGlobal("C0ArtificerAlchemy","LOCALS",1) StartStore("c0aupoth",LastTalkedToBy(Myself))~ EXIT
END