`timescale 1ns / 1ps

module fn_xnor_6bit(
    input [5:0] x,
    input [5:0] y,
    output [5:0] out
    );
    // Instantiate 1 bit XNOR for each bit of inputs
    xnor_1b x0 (.i1(x[0]), .i0(y[0]), .op(out[0]));
    xnor_1b x1 (.i1(x[1]), .i0(y[1]), .op(out[1]));
    xnor_1b x2 (.i1(x[2]), .i0(y[2]), .op(out[2]));
    xnor_1b x3 (.i1(x[3]), .i0(y[3]), .op(out[3]));
    xnor_1b x4 (.i1(x[4]), .i0(y[4]), .op(out[4]));
    xnor_1b x5 (.i1(x[5]), .i0(y[5]), .op(out[5]));
    
endmodule
