keyGen: keyGen.c print128.c
	gcc -Wall keyGen.c -o keygen -lm
encrypt: encrypt.c print128.c
	gcc -Wall encrypt.c -o encrypt1
decrypt: decrypt.c print128.c
	gcc -Wall decrypt.c -o decrypt1
attack: attack.c print128.c
	gcc -Wall attack.c -o attack -lm

smallKeyGen: smallKeyGen.c
	gcc -Wall smallKeyGen.c -o smallKeyGen -lm
smallAttack: smallAttack.c
	gcc -Wall smallAttack.c -o smallAttack -lm
