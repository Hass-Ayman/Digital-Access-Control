
# Digital Access Control

* The correct code is 28B04.
* Operates in two modes:
	> Daytime: in the morning, door opens when
		pressing “P”, even between code entries.
		entering the complete correct code.
	Night: opens only if the code is correct.
* If “C” is pressed: cancel entered numbers and retry from the first digit.
* An alarm is triggered in case of
	> An incorrect entry, as soon as a wrong number is pressed.
	> While entering the code, if a certain delay is exceeded between entries (timeout).
	> If “P” is pressed at night after any number.
* Numbers from 0 to 9 are binary coded, A=1010, B=1011, C=1100 and P=1101.



## Inputs and Outputs

* code: input code, applied externally, one number at a time, binary coded.
* door: =1 when correct code.
* daytime: =1 applied externally during the morning.
* timeout: =1 applied externally if a certain delay is exceeded between code entries.
* alarm: =1 if entered code is incorrect, or timeout is triggered, or “P” at night
* reset: =1 applied externally after:
	> Door opens (door=1).
	  alarm is triggered
	Can be applied after any number. After which, must restart at first number.
	Should be a Synchronous reset.