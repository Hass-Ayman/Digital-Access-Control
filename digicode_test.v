`timescale 1ns/1ps
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

module digicode_test();

	wire alarm,door;
	reg clk,reset,timeout,daytime;
	reg[3:0] code;
	
	//binding_module bind1();
	
	digicode dut(.code(code), .clk(clk), .reset(reset), .timeout(timeout), .daytime(daytime), .alarm(alarm), .door(door));
	
	initial begin
		clk = 1'b1;
		forever
			#30 clk = ~clk;
	end
	
	initial begin
		reset=0;
		//right cases
		daytime=0;timeout=0; #500 ;
		code=`TWO ; #500 ; code=`EIGHT ; #500 ;code=`B ; #500 ; code=`ZERO ; #500 ; code=`FOUR ; #500 ;
		code=`C ; #500;
		reset=1 ; #500 ; reset=0 ; #500;
		
		
		code=`P ; daytime=1 ; #500 ;code=`C ;
		reset=1 ; #500 ; reset=0 ; #500;
		code=`TWO ; #500 ; code=`P ; #500 ;code=`C ;
		reset=1 ; #500 ; reset=0 ; #500;
		code=`TWO ; #500 ; code=`EIGHT ; #500 ; code=`P ; #500 ;code=`C ;
		reset=1 ; #500 ; reset=0 ; #500;
		code=`TWO ; #500 ; code=`EIGHT ; #500 ;code=`B ; #500 ; code=`P ; #500 ;code=`C ;
		reset=1 ; #500 ; reset=0 ; #500;
		code=`TWO ; #500 ; code=`EIGHT ; #500 ;code=`B ; #500 ; code=`ZERO ; #500 ; code=`P ; #500 ;code=`C ;
		reset=1 ; #500 ; reset=0 ; #500;
		code=`C ; daytime=0; #500;
		
		//wrong cases
		code=`TWO ; #500 ; code=`ZERO ; #500 ;code=`C ;
		reset=1 ; #500 ; reset=0 ; #500;
		code=`TWO ; #500 ; code=`EIGHT ; #500 ;code=`ONE ; #500 ;code=`C ;
		reset=1 ; #500 ; reset=0 ; #500;
		code=`TWO ; #500 ; code=`EIGHT ; #500 ;code=`B ; #500 ; code=`TWO ; #500 ;code=`C ;
		reset=1 ; #500 ; reset=0 ; #500;
		code=`TWO ; #500 ; code=`EIGHT ; #500 ;code=`B ; #500 ; code=`ZERO ; #500 ; code=`THREE ; #500 ;code=`C ;
		reset=1 ; #500 ; reset=0 ; #500;
		code=`TWO ; #500 ; code=`FOUR ; #500 ;code=`C ;
		reset=1 ; #500 ; reset=0 ; #500;
		code=`TWO ; #500 ; code=`EIGHT ; #500 ;code=`FIVE ; #500 ;code=`C ;
		reset=1 ; #500 ; reset=0 ; #500;
		code=`TWO ; #500 ; code=`EIGHT ; #500 ;code=`B ; #500 ; code=`SIX ; #500 ;code=`C ;
		reset=1 ; #500 ; reset=0 ; #500;
		code=`TWO ; #500 ; code=`EIGHT ; #500 ;code=`B ; #500 ; code=`ZERO ; #500 ; code=`SEVEN ; #500 ;code=`C ;
		reset=1 ; #500 ; reset=0 ; #500;
		code=`TWO ; #500 ; code=`NINE ; #500 ;code=`C ;
		reset=1 ; #500 ; reset=0 ; #500;
		code=`TWO ; #500 ; code=`EIGHT ; #500 ;code=`A ; #500 ;code=`C ;
		reset=1 ; #500 ; reset=0 ; #500;
		code=`TWO ; #500 ; code=`EIGHT ; #500 ;code=`B ; #500 ; code=`NINE ; #500 ;code=`C ;
		reset=1 ; #500 ; reset=0 ; #500;
		code=`TWO ; #500 ; code=`EIGHT ; #500 ;code=`B ; #500 ; code=`ZERO ; #500 ; code=`B ; #500 ;code=`C ;
		reset=1 ; #500 ; reset=0 ; #500;
		code=`C ; #500;
		
		code=`TWO ; #500 ; timeout=1 ; #300 ; timeout=0;code=`C ;
		reset=1 ; #500 ; reset=0 ; #500;
		code=`TWO ; #500 ; code=`EIGHT ; #500 ; timeout=1 ; #300 ; timeout=0;code=`C ;
		reset=1 ; #500 ; reset=0 ; #500;
		code=`TWO ; #500 ; code=`EIGHT ; #500 ;code=`B ; #500 ; timeout=1 ; #300 ; timeout=0;code=`C ;
		reset=1 ; #500 ; reset=0 ; #500;
		code=`TWO ; #500 ; code=`EIGHT ; #500 ;code=`B ; #500 ; code=`ZERO ; #500 ; timeout=1 ; #300 ; timeout=0;code=`C ;
		reset=1 ; #500 ; reset=0 ; #500;
		code=`C ; #500;
		
		code=`P ; #500 ;code=`C ;
		reset=1 ; #500 ; reset=0 ; #500;
		code=`TWO ; #500 ; code=`P ; #500 ;code=`C ;
		reset=1 ; #500 ; reset=0 ; #500;
		code=`TWO ; #500 ; code=`EIGHT ; #500 ; code=`P ; #500 ;code=`C ;
		reset=1 ; #500 ; reset=0 ; #500;
		code=`TWO ; #500 ; code=`EIGHT ; #500 ;code=`B ; #500 ; code=`P ; #500 ;code=`C ;
		reset=1 ; #500 ; reset=0 ; #500;
		code=`TWO ; #500 ; code=`EIGHT ; #500 ;code=`B ; #500 ; code=`ZERO ; #500 ; code=`P ; #500 ;code=`C ;
		reset=1 ; #500 ; reset=0 ; #500;
		code=`C ; #500;
		
		$finish;
	end
endmodule


