`timescale 1ns / 1ps

module alu(
    input [5:0] A,
    input [5:0] B,
    input [2:0] fxn, 
    output [5:0] X
    );
    // Wires to hold results from submodules
    wire [5:0] copyA_out, copyB_out, negA_out, negB_out, A_xnor_B_out, A_plus_B_out, A_minus_B_out;
    wire  A_GT_B_out;
    reg [5:0] result; // reg to hold temporary results, assigned to X 
    
    // Instantiate submodules 
    fn_rca_6bit copyA (.x(A), .y(6'b0), .sel(1'b0), .sum(copyA_out));               // X = A
    fn_rca_6bit copyB (.x(B), .y(6'b0), .sel(1'b0), .sum(copyB_out));               // X = B
    fn_rca_6bit negateA (.x(6'b0), .y(A), .sel(1'b1), .sum(negA_out));              // X = ~A
    fn_rca_6bit negateB (.x(6'b0), .y(B), .sel(1'b1), .sum(negB_out));              // X = ~B
    fn_a_gt_b A_GT_B(.A({A[5],A[5], A}), .B({B[5],B[5], B}), .A_GT_B(A_GT_B_out));  // X = A > B
    fn_xnor_6bit A_xnor_B (.x(A), .y(B), .out(A_xnor_B_out));                       // X = A XNOR B
    fn_rca_6bit A_plus_B (.x(A), .y(B), .sel(1'b0), .sum(A_plus_B_out));            // X = A + B
    fn_rca_6bit A_minus_B (.x(A), .y(B), .sel(1'b1), .sum(A_minus_B_out));          // X = A - B
    
    // Always block to assign result based on fxn
    // Run corresponding fn when fxn changes using an always block.
    // All bits of fxn, A and B in the sensitivity list
    always @(*) begin
        case (fxn) // Switch-case block works as 8-1 MUX
        // Case where X = A
            3'b000: result = copyA_out;                 
        // Case where X = B
            3'b001: result = copyB_out;                 
        // Case where X = -A
            3'b010: result = negA_out;                  
        // Case where X = -B
            3'b011: result = negB_out;                  
        // Case where X = A < B, output requires padding and inversion, as A_GT_B_out is 1 bit A > B    
            3'b100: result = {5'b00_000, ~A_GT_B_out}; 
        // Case where X = A XNOR B  
            3'b101: result = A_xnor_B_out;
        // Case where X = A + B using 6bit ripple carry adder with sel = 0               
            3'b110: result = A_plus_B_out;
        // Case where X = A - B using 6bit ripple carry adder with sel = 1     
            3'b111: result = A_minus_B_out;             
        endcase
    end 
    assign X = result; // assign result to output
endmodule
