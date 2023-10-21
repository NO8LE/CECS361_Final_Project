`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/19/2023 02:33:07 PM
// Design Name: 
// Module Name: switch_to_dec
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


module switch_to_dec(

    input wire [15:0] switches, // 16 switches to input the number
    output wire [6:0] seg_out, // 7-segment display segments
    output wire [3:0] digit_select // 4-digit display select
);

reg [15:0] number;
reg [3:0] current_digit;

always @* begin
    // Read the number from the switches
    number = switches;
    
    // Extract individual digits
    current_digit = number % 10;
    
    // Update the remaining part of the number
    number = number / 10;
end

assign seg_out = (current_digit == 4'b0) ? 7'b1000000 : // Display 0
                 (current_digit == 4'b1) ? 7'b1111001 : // Display 1
                 (current_digit == 4'b10) ? 7'b0100100 : // Display 2
                 (current_digit == 4'b11) ? 7'b0110000 : // Display 3
                 (current_digit == 4'b100) ? 7'b0011001 : // Display 4
                 (current_digit == 4'b101) ? 7'b0010010 : // Display 5
                 (current_digit == 4'b110) ? 7'b0000010 : // Display 6
                 (current_digit == 4'b111) ? 7'b1111000 : // Display 7
                 (current_digit == 4'b1000) ? 7'b0000000 : // Display 8
                 (current_digit == 4'b1001) ? 7'b0011000 : // Display 9
                 7'b0000000; // Display nothing for other digits

endmodule

