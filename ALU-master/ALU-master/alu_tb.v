`timescale 1ns / 1ps
`include "alu.v"


module alu_testbench();
    reg [7:0] A;
    reg [7:0] B;
    reg [3:0] operator;
    wire [15:0] out;
    wire overflow;
    wire carry;

    alu dut (
        .A(A),
        .B(B),
        .operator(operator),
        .out(out),
        .overflow(overflow),
        .carry(carry)
    );

    initial begin
        // Test Addition
        A = 8'h10;
        B = 8'h20;
        operator = 4'b0000;
        #10;
        $display("Addition: A = %h, B = %h, out = %h, overflow = %b, carry = %b", A, B, out, overflow, carry);

        // Test Subtraction
        A = 8'h20;
        B = 8'h10;
        operator = 4'b0001;
        #10;
        $display("Subtraction: A = %h, B = %h, out = %h, overflow = %b, carry = %b", A, B, out, overflow, carry);

        // Test Multiplication
        A = 8'h10;
        B = 8'h20;
        operator = 4'b0010;
        #10;
        $display("Multiplication: A = %h, B = %h, out = %h, overflow = %b", A, B, out, overflow);

        // Test Division
        A = 8'h20;
        B = 8'h2;
        operator = 4'b0011;
        #10;
        $display("Division: A = %h, B = %h, out = %h, overflow = %b", A, B, out, overflow);

        // Test Modulo
        A = 8'h20;
        B = 8'h3;
        operator = 4'b0100;
        #10;
        $display("Modulo: A = %h, B = %h, out = %h, overflow = %b", A, B, out, overflow);

        // Test AND
        A = 8'hF0;
        B = 8'h0F;
        operator = 4'b0101;
        #10;
        $display("AND: A = %h, B = %h, out = %h", A, B, out);

        // Test OR
        A = 8'hF0;
        B = 8'h0F;
        operator = 4'b0110;
        #10;
        $display("OR: A = %h, B = %h, out = %h", A, B, out);

        // Test Equality
        A = 8'h10;
        B = 8'h10;
        operator = 4'b0111;
        #10;
        $display("Equality: A = %h, B = %h, out = %h", A, B, out);

        // Test Logical AND
        A = 8'h10;
        B = 8'h20;
        operator = 4'b1000;
        #10;
        $display("Logical AND: A = %h, B = %h, out = %h", A, B, out);

        // Test Logical OR
        A = 8'h10;
        B = 8'h20;
        operator = 4'b1001;
        #10;
        $display("Logical OR: A = %h, B = %h, out = %h", A, B, out);

        // Test Shift Right
        A = 8'hF0;
        B = 8'h2;
        operator = 4'b1010;
        #10;
        $display("Shift Right: A = %h, B = %h, out = %h", A, B, out);

        // Test Shift Left
        A = 8'h0F;
        B = 8'h2;
        operator = 4'b1011;
        #10;
        $display("Shift Left: A = %h, B = %h, out = %h", A, B, out);

        // Test XOR
        A = 8'hF0;
        B = 8'h0F;
        operator = 4'b1100;
        #10;
        $display("XOR: A = %h, B = %h, out = %h", A, B, out);

       // Test NOT
        A = 8'hF0;
        B = 8'h00;
        operator = 4'b1101;
        #10;
        $display("NOT: A = %h, B = %h, out = %h", A, B, out);

        // Test Concatenation
         A = 8'hF0;
         B = 8'h0F;
         operator = 4'b1110;
         #10;
         $display("Concatenation: A = %h, B = %h, out = %h", A, B, out);

         $finish;
     end
 endmodule