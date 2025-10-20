`timescale 1ns / 1ps

module fn_rca_6bit(
    input [5:0] x,
    input [5:0] y,
    input sel,
    output overflow,
    output c_out,
    output [5:0] sum
    );
    // Wires to hold intermediary values
    wire c1, c2, c3, c4, c5, c6;
    // Instantiate full adders for each bit
    FullAdder bit0(.a(x[0]), .b(y[0] ^ sel), .cin(sel), .cout(c1), .s(sum[0]));
    FullAdder bit1(.a(x[1]), .b(y[1] ^ sel), .cin(c1), .cout(c2), .s(sum[1]));
    FullAdder bit2(.a(x[2]), .b(y[2] ^ sel), .cin(c2), .cout(c3), .s(sum[2]));
    FullAdder bit3(.a(x[3]), .b(y[3] ^ sel), .cin(c3), .cout(c4), .s(sum[3]));
    FullAdder bit4(.a(x[4]), .b(y[4] ^ sel), .cin(c4), .cout(c5), .s(sum[4]));
    FullAdder bit5(.a(x[5]), .b(y[5] ^ sel), .cin(c5), .cout(c6), .s(sum[5]));
    // Correct overflow detection: XOR carry into MSB and carry out of MSB
    assign overflow = c5 ^ c6;
    assign c_out = c6;
endmodule
