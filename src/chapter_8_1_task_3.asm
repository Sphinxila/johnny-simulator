000 TAKE 032
001 SAVE 100
002 TAKE 033
003 SAVE 101
004 NULL 031
005 TST 100    	
006 JMP 013
007 JMP 010
010 TST 101
011 JMP 019
012 JMP 020
013 TST 101
014 JMP 016
015 JMP 021
016 DEC 100
017 DEC 101	
018 JMP 005
019 INC 031
020 INC 031
021 INC 031
022 HLT 000
031 RAM 000
032 RAM 015
033 RAM 019
100 RAM 000
101 RAM 000
