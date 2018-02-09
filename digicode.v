`timescale 1ns / 1ps

//state assignment
`define IDLE  3'b 000
`define PASS1 3'b 001
`define RIGHT 3'b 011
`define WRONG 3'b 010
`define PASS2 3'b 110
`define PASS3 3'b 111
`define PASS4 3'b 101

//code circuit
`define ZERO  4'b 0000
`define ONE   4'b 0001
`define TWO   4'b 0010
`define THREE 4'b 0011
`define FOUR  4'b 0100
`define FIVE  4'b 0101
`define SIX   4'b 0110
`define SEVEN 4'b 0111
`define EIGHT 4'b 1000
`define NINE  4'b 1001
`define A     4'b 1010
`define B     4'b 1011
`define C     4'b 1100
`define P     4'b 1101

module digicode(
    clk,
    timeout,
    daytime,
    code,
    reset,
    door,
    alarm
    );
   input clk,reset,timeout,daytime;
   input [3:0] code;
   output door,alarm;
   wire clk,reset,timeout,daytime;
   wire [3:0] code;
   reg door,alarm;
	 reg [2:0] current_state;
	 reg [2:0] next_state;
	 
	 always @(posedge clk)
		if (reset==1) current_state = `IDLE ;
		else current_state = next_state;
	 
	 always @(code or daytime or timeout or current_state)
		case (current_state)
			`IDLE:
			begin
				if(code==`TWO) next_state= `PASS1;
				else if (code==`C) next_state= `IDLE;
				else if (code==`P && daytime==1) next_state= `RIGHT;
				else if (code==`ZERO || code==`ONE || code==`THREE || code==`FOUR || code==`FIVE || code==`SIX || code==`SEVEN || code==`EIGHT || code==`NINE || code==`A || code==`B || (code==`P && daytime==0)) next_state = `WRONG;
				else next_state= `IDLE;
			end
			`PASS1:
			begin
				if (timeout==1) next_state = `WRONG;
				else if (code==`TWO) next_state=`PASS1;
				else if (code==`EIGHT) next_state=`PASS2;
				else if (code==`C) next_state= `IDLE;
				else if (code==`P && daytime==1) next_state= `RIGHT;
				else if (code==`ZERO || code==`ONE || code==`TWO || code==`THREE || code==`FOUR || code==`FIVE || code==`SIX || code==`SEVEN || code==`NINE || code==`A || code==`B || (code==`P && daytime==0)) next_state = `WRONG;
				else next_state= `IDLE;
			end
			`PASS2:
			begin
				if (timeout==1) next_state = `WRONG;
				else if (code==`EIGHT) next_state=`PASS2;
				else if(code==`B) next_state=`PASS3;
				else if (code==`C) next_state= `IDLE;
				else if (code==`P && daytime==1) next_state= `RIGHT;
				else if (code==`ZERO || code==`ONE || code==`TWO || code==`THREE || code==`FOUR || code==`FIVE || code==`SIX || code==`SEVEN || code==`EIGHT || code==`NINE || code==`A || (code==`P && daytime==0)) next_state = `WRONG;
				else next_state= `IDLE;
			end
			`PASS3:
			begin
				if (timeout==1) next_state = `WRONG;
				else if (code==`B) next_state=`PASS3;
				else if (code==`ZERO) next_state=`PASS4;
				else if (code==`C) next_state= `IDLE;
				else if (code==`P && daytime==1) next_state= `RIGHT;
				else if (code==`ONE || code==`TWO || code==`THREE || code==`FOUR || code==`FIVE || code==`SIX || code==`SEVEN || code==`EIGHT || code==`NINE || code==`A || code==`B || (code==`P && daytime==0)) next_state = `WRONG;
				else next_state= `IDLE;
			end
			`PASS4:
			begin
				if (timeout==1) next_state = `WRONG;
				else if (code==`ZERO) next_state=`PASS4;
				else if (code==`FOUR || (code==`P && daytime==1)) next_state=`RIGHT;
				else if (code==`C) next_state= `IDLE;
				else if (code==`ZERO || code==`ONE || code==`TWO || code==`THREE || code==`FIVE || code==`SIX || code==`SEVEN || code==`EIGHT || code==`NINE || code==`A || code==`B || (code==`P && daytime==0)) next_state = `WRONG;
				else next_state= `IDLE;
			end
			`RIGHT:
			begin
				if ((code==`FOUR)||((code==`P)&&daytime==1)) next_state= `RIGHT;
				else next_state= `IDLE;
			end
			`WRONG:
			begin
				if (code==`ZERO || code==`ONE || code==`TWO || code==`THREE || code==`FOUR || code==`FIVE || code==`SIX || code==`SEVEN || code==`EIGHT || code==`NINE || code==`A || code==`B || (code==`P && daytime==0)) next_state = `WRONG;
				else next_state= `IDLE;
			end
			default:
			begin
				next_state=`IDLE;
			end
		endcase
		
	 always @(current_state)
		case(current_state)
			`IDLE :
			begin
				alarm<=0; door<=0;
			end
			`PASS1: 
			begin 
				alarm<=0; door<=0;
			end
			`PASS2: 
			begin 
				alarm<=0; door<=0;
			end
			`PASS3: 
			begin 
				alarm<=0; door<=0;
			end
			`PASS4: 
			begin 
				alarm<=0; door<=0;
			end
			`WRONG: 
			begin 
				alarm<=1; door<=0;
			end
			`RIGHT: 
			begin 
				alarm<=0; door<=1;
			end
			default:
			begin
				alarm<=0; door<=0;
			end
		endcase
endmodule
