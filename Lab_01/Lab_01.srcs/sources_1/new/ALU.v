`timescale 1ns / 1ps

module alu_32(A_in , B_in , ALU_Sel , ALU_Out , Carry_Out , Zero , Overflow );
//Define I/O Ports
    input signed [31:0] A_in;
    input signed [31:0] B_in; 
    input [3:0] ALU_Sel;
    output signed [31:0] ALU_Out;
    output Carry_Out;
    output Zero;
    output Overflow;
//Describe ALU Behaviour
    always @(ALU_Sel, A_in, B_in) 
    begin
        case(ALU_Sel)
        4'b0000: // AND
        ALU_Out = A_in & B_in;
        4'b0001: // OR
        ALU_Out = A_in ^ B_in;
        4'b0010: // add
        ALU_Out = A_in + B_in;
        4'b0110: // sub
        ALU_Out = A_in - B_in;
        4'b0111: // set less than
        begin
            if (A[31] != B[31]) begin
					if (A[31] > B[31]) begin
						ALUResult <= 1;
					end else begin
						ALUResult <= 0;
					end
				end else begin
					if (A < B)
					begin
						ALUResult <= 1;
					end
					else
					begin
						ALUResult <= 0;
					end
				end
			end
        4'b1100: // NOR
        ALU_Out = ~(A_in | B_in);
        4'b1111: // equal comparison
        ALU_Out = (A_in == B_in);
        
endmodule // 32-Bit ALU
