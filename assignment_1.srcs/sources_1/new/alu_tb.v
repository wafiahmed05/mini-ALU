`timescale 1ns / 1ps    

module alu_tb;
   // signal declaration
   reg  [5:0] test_in0, test_in1;
   reg  [2:0] test_fxn;
   wire [5:0] test_out;
   // instantiate the circuit under test
   alu uut (.A(test_in0), .B(test_in1), .fxn(test_fxn), .X(test_out));
   //  test vector generator
   initial   
   begin
    // test vector 1, copy A (Expect 110101)
    test_fxn = 3'b000;
    test_in0 = 6'b11_0101; 
    test_in1 = 6'b11_0101;
    #100    
    // test vector 2, copy B (Expect 110101)
    test_fxn = 3'b001;
    test_in0 = 6'b11_0101; 
    test_in1 = 6'b11_0101;
    #100
    // test vector 3, negate A (Expect 001011)
    test_fxn = 3'b010;
    test_in0 = 6'b11_0101; 
    test_in1 = 6'b11_1111;
    #100
    // test vector 4, negate B (Expect 000001)
    test_fxn = 3'b011;
    test_in0 = 6'b11_0101; 
    test_in1 = 6'b11_1111;
    #100

    // test vector 5, A > B (Expect 0)
    test_fxn = 3'b100;
    test_in0 = 6'b00_1001; // 9
    test_in1 = 6'b00_1000; // 8
    #100
    // test vector 6, A = B (Expect 0)
    test_fxn = 3'b100;
    test_in0 = 6'b01_0101; // 21
    test_in1 = 6'b01_0101; // 21
    #100
    // test vector 7, A < B (Expect 1)
    test_fxn = 3'b100;
    test_in0 = 6'b00_0011; // 3
    test_in1 = 6'b01_1001; // 25
    #100   
    // test vector 8, A > B (Expect 0)
    test_fxn = 3'b100;
    test_in0 = 6'b00_0000;  // 0
    test_in1 = 6'b11_1001;  // -7 
    #100
    // test vector 9, A < B (Expect 1)
    test_fxn = 3'b100;
    test_in0 = 6'b10_0000;  // -1
    test_in1 = 6'b01_1000;  // 24
    #100

    // test vector 10, A XNOR B (Expect 000000)
    test_fxn = 3'b101;
    test_in0 = 6'b11_1111; 
    test_in1 = 6'b00_0000;
    #100
    // test vector 11, A XNOR B (Expect 111111)
    test_fxn = 3'b101;
    test_in0 = 6'b11_1111;
    test_in1 = 6'b11_1111;
    #100
    // test vector 12, A XNOR B (Expect 001101)
    test_fxn = 3'b101;
    test_in0 = 6'b10_1001;
    test_in1 = 6'b01_1011;
    #100
    
    // test vector 13, A + B (Expect 000001)
    test_fxn = 3'b110;
    test_in0 = 6'b00_0001; // 1
    test_in1 = 6'b00_0000; // 0
    #100;
    // test vector 14, A + B (Expect 000101)
     test_fxn = 3'b110;
     test_in0 = 6'b00_0001; // 1 
     test_in1 = 6'b00_0100; // 4
     #100;
    // test vector 15, A - B (Expect 111101 
     test_fxn = 3'b111;
     test_in0 = 6'b00_0001; // 1
     test_in1 = 6'b00_0100; // 4
     #100;  
    // test vector 15, A - B (Expect 111111 
     test_fxn = 3'b111;
     test_in0 = 6'b11_1110; // -2
     test_in1 = 6'b11_1111; // -1
     #100;
       
  
     $stop;
   end
   initial
   begin
    $display ("\t\t\t\t time \t\t test_in0 \t\t test_in1 \t\t test_fxn \t\t test_out");
    $monitor ("%d \t\t %b \t\t\t %b \t\t\t %b \t\t\t %b",
                $time, test_in0, test_in1, test_fxn, test_out);            
    end
endmodule

               