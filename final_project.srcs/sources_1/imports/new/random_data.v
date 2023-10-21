`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/19/2023 02:40:26 PM
// Design Name: 
// Module Name: random_data
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


module random_data();

    integer mynumber;

    initial begin
    mynumber = {$random} %65536 ; // random numbers between 0 and 65536.
    end
endmodule