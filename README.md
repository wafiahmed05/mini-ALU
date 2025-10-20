# mini-ALU
Implementing a mini-ALU on a Basys3 FPGA using Verilog and Xilinx Vivado

## Brief
You need to design, write/modify the Verilog modules for the following functions, and test a “mini”
arithmetic logic unit. An arithmetic logic unit (ALU) uses combinatorial logic to implement common
arithmetic and logical functions. A typical ALU has a wide range of functionality from addition to bit
shifting. Your ALU will provide a narrow range of functions performed on two 6-bit inputs A and B.
A and B are in 2’s complement format. The output of the ALU is a 6-bit number X, also in 2’s
complement form as appropriate, and the input fxn controls the output as follows


| fxn  | X[5:0]   |
|------|----------|
| 000  | A        |
| 001  | B        |
| 010  | -A       |
| 011  | -B       |
| 100  | A<B      |
| 101  | A xnor B |
| 110  | A+B      |
| 111  | A-B      |