`timescale 1ns / 1ps
module fn_a_gt_b(
    input wire [7:0] A,
    input wire [7:0] B,
    output wire A_GT_B
    );
    
// Intermediate signals
    wire gt[3:0]; // GT results from each 2 bit block
    wire eq[3:0]; // EQ results from each 2 bit block
    
//  Instantiate 2-bit greater-than modules for each 2-bit block
    greater_than_2bit gt0 (.a(A[1:0]), .b(B[1:0]), .a_greater_b(gt[0]));
    greater_than_2bit gt1 (.a(A[3:2]), .b(B[3:2]), .a_greater_b(gt[1]));
    greater_than_2bit gt2 (.a(A[5:4]), .b(B[5:4]), .a_greater_b(gt[2]));
    greater_than_2bit gt3 (.a(A[7:6]), .b(B[7:6]), .a_greater_b(gt[3]));
    
//  Instantiate 2-bit comparator modules for each 2 bit block
    eq2 eq0 (.a(A[1:0]), .b(B[1:0]), .aeqb(eq[0]));
    eq2 eq1 (.a(A[3:2]), .b(B[3:2]), .aeqb(eq[1]));
    eq2 eq2 (.a(A[5:4]), .b(B[5:4]), .aeqb(eq[2]));
    eq2 eq3 (.a(A[7:6]), .b(B[7:6]), .aeqb(eq[3]));
    
//  Assign result 1 if GT or EQ, 0 if neither   
    assign A_GT_B = gt[3] |(eq[3] & gt[2]) |(eq[3] & eq[2] & gt[1]) |
    (eq[3] & eq[2] & eq[1] & gt[0]) |(eq[3] & eq[2] & eq[1] & eq[0]);
endmodule
