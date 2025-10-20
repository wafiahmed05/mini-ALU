`timescale 1ns / 1ps
module greater_than_2bit(
    input wire [1:0] a,
    input wire [1:0] b,
    output wire a_greater_b
    );
    // Logic for assigning 2 bit A > B
    assign a_greater_b = (a[0] & !b[1] & !b[0]) | (a[1] & a[0] & !b[0]) | (a[1] & !b[1]);
endmodule

