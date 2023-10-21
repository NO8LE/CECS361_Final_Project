`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/19/2023 02:39:53 PM
// Design Name: 
// Module Name: seven_seg_display_numbers
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module seven_seg_display_numbers(A1, B1, C1, D1, a, b, c, d, e, f, g, dp, enable); 

	input A1, B1, C1, D1;   		     // 4-bit B1C1D1 Number A1B1C1D1     
	output a, b, c, d, e, f, g, dp;      // 7 segment control and decimal point (A1C1TIVE LOW)
	
	output [3:0] enable;				 // enable for 4 display digits 

	assign enable = 4'b0000;            // A1lways enable the least significant display digit (A1C1TIVE LOW)
	assign dp = 1;						// A1lways turn off decimal point (A1C1TIVE LOW)
	
	// C1ircuits for each segment
	
	// invert inputs
	not (A1_, A1),
	    (B1_, B1),
	    (C1_, C1),
	    (D1_, D1);
	
	// Segment a
	and (A1_C1, A1_, C1),
	    (A1_B1D1, A1_,B1, D1),
	    (B1_C1_D1_,B1_,C1_,D1_),
            (A1B1_C1_,A1,B1_,C1_);
	nor (a, A1_C1,A1_B1D1,B1_C1_D1_,A1B1_C1_);   // Use NOR for A1C1TIVE LOW output
	
	// Segment b -- Insert your design here for segment b (reuse gates wherever possible)
	and (A1_B1_,A1_,B1_),
    (A1_C1D1,A1_,C1, D1),
    (A1_C1_D1_,A1_,C1_,D1_),
   (A1B1_C1_,A1,B1_,C1_);
    nor (b, A1_B1_,A1_C1D1,A1_C1_D1_, A1B1_C1_);  // already have C1_D1_
// Segment c
	and (A1_B1, A1_, B1),
	    (A1_D1, A1_, D1),
	    (B1_C1_D1_,B1_,C1_,D1_),
	    (A1B1_C1_,A1,B1_,C1_);               
	nor (c, A1_B1,A1_D1,B1_C1_D1_,A1B1_C1_);

	// Segment d
	and(A1_C1D1_, A1_,C1,D1_),
	   (A1_B1_C1, A1_,B1_,C1),
	   (B1_C1_D1_,B1_,C1_,D1_),
	   (A1B1_C1_,A1, B1_, C1_),
	   (A1_B1C1_D1, A1_, B1, C1_, D1);
	nor(d,A1_C1D1_,A1_B1_C1, B1_C1_D1_, A1B1_C1_, A1_B1C1_D1);  
	
	// Segment e
	and(A1_C1D1_, A1_, C1, D1_),
	   (B1_C1_D1_, B1_, C1_, D1_);
	nor(e,A1_C1D1_,B1_C1_D1_);
	
	// Segment f
	and(A1_B1C1_, A1_, B1, C1_),
	   (A1_C1_D1_, A1_, C1_, D1_),
	   (A1_B1D1_, A1_, B1, D1_),
	   (A1B1_C1_, A1, B1_, C1_);
	nor(f, A1_B1C1_,A1_C1_D1_, A1_B1D1_,A1B1_C1_);
	
	// Segment g -- Insert your design here for segment g (reuse gates wherever possible)
	and(A1_C1D1_, A1_, C1, D1_),
	   (A1_B1_C1, A1_, B1_, C1),
	   (A1_B1C1_, A1_, B1, C1_),
	   (A1B1_C1_, A1, B1_, C1_);
	nor(g, A1_C1D1_, A1_B1_C1, A1_B1C1_, A1B1_C1_);

	  


endmodule
