## 5.1 Task 1 and 2 ##

- [Solution](chapter_5_1_task_1.asm)

## 5.2 Task 3 ##

Someone is telling me that 'TAKE 42' is loading the number 42 into the stack 'Accumulator'.
This is wrong, 

This file was created to reject this.
- [Solution / Test](chapter_5_2_task_3.asm)

## 7 Task 1 ##

"Der Computer soll die Zahl in Speicherzelle 10 um 1 erhöhen."
- [Solution](chapter_7_1_task_1.asm)

"Der Computer soll in der Speicherzelle 12 zunächst die Zahl 10 stehen haben und dann schrittweise bis 0 herunterzählen."
- There is no dynamic solution to solve this proböem. The only way to do this is to substract 10 times with 1 until the number reaches 0.
- [Solution](chapter_7_1_task_1_sub.asm)

"Der Computer soll in der Speicherzelle 12 zunächst irgendeine Zahl 10 stehen haben und diese dann schrittweise bis 0 herunterzählen. "
- This sentence makes no sense, "irgendeine Zahl 10"... never mind, this problem is not solveable cause we have not enough commands.
- To solve this we need a JMP/TST command.

## 7 Task 2 ##

The commands that I would wish to have are:
- JMP (To jump to an other address)
- TST (Test to make ifs)
- DEC (Decrease)

## 7.1 Task 1 ##

- [Test File](chapter_7_1_task_1.asm)

- DEC (Decrease at pointer (address))
- INC (Increase at pointer (address))
- NULL (Delete at pointer (address))

## 7.1 Task 2 ##

"Überlegen Sie sich die Mikrobefehlsfolgen für die drei Befehle "INC", "DEC" und "NULL"."

- [DEC example](chapter_7_1_task_2_dec.asm)
- [INC example](chapter_7_1_task_2_inc.asm)
- [NULL example](chapter_7_1_task_2_null.asm)


## 7.2 Task 1 ##

"Testen Sie die beiden folgenden Programm und notieren Sie sich danach, was der Befehl 'JMP' tut." 

- [Test File](chapter_7_2_task_1.asm)

The ASM command jumps to the given address.

## 7.2 Task 2 ##

"Testen Sie das folgende Programm und beobachten Sie dabei die Werte der Speicherstelle "
"Hinweis: Der Befehl "TST" tut nicht immer etwas. "

- [Test File](chapter_7_2_task_2.asm)

The TST command adds 2 to the fetch cycle (adds 2 to the ptr stack) if the given pointer is 0.
If the given pointer is higher than 0 he goes normaly to the next pointer (adds 1 to the ptr stack)

## 7.3 Task 
