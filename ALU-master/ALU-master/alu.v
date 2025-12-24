`timescale 1ns / 1ps
module alu(
    input wire [7:0] A,
    input wire [7:0] B,
    input wire [3:0] operator,
    output reg [15:0] out,
    output reg overflow,
    output reg carry
);

    always @(*) begin
        overflow = 0;
        carry = 0;
        case (operator)
            4'b0000 : begin // Addition
                {carry, out} = {1'b0, A} + {1'b0, B};
                overflow = (A[7] == B[7]) && (out[7] != A[7]);
            end
            4'b0001 : begin // Subtraction
                {carry, out} = {1'b0, A} - {1'b0, B};
                carry = ~carry; // Carry bit for subtraction (borrow)
                overflow = (A[7] != B[7]) && (out[7] != A[7]);
            end
            4'b0010 : begin // Multiplication
                out = A * B;
                overflow = (out > 16'hFFFF);
            end
            4'b0011 : begin // Division
                out = A / B;
                overflow = (B == 0);
            end
            4'b0100 : begin // Modulo
                out = A % B;
                overflow = (B == 0);
            end
            4'b0101 : out = A & B; // AND
            4'b0110 : out = A | B; // OR
            4'b0111 : out = (A == B) ? 16'h1 : 16'h0; // Equality
            4'b1000 : out = (A != 0) && (B != 0) ? 16'h1 : 16'h0; // Logical AND
            4'b1001 : out = (A != 0) || (B != 0) ? 16'h1 : 16'h0; // Logical OR
            4'b1010 : out = A >> B; // Shift Right
            4'b1011 : out = A << B; // Shift Left
            4'b1100 : out = A ^ B; // XOR
            4'b1101 : out = ~A; // NOT
            4'b1110 : out = {A, B}; // Concatenation
            default : out = 16'b0;
        endcase
    end
endmodule
