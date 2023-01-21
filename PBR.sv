`timescale 1ns/1ps
module tb ();

    task automatic swap(ref bit[1:0] a, b);
        bit [1:0]temp;

        temp = a;
        a = b;
        b = temp;
        $display("a : %0d b: %0d", a, b);
    endtask 
    task automatic swap_keep_a(const ref bit[1:0] a,ref bit[1:0] b);
        bit [1:0]temp;

        temp = a;
        //a = b;
        b = temp;
        $display("a : %0d b: %0d", a, b);
    endtask 
    

    bit [1:0] a, b;
    initial begin
        a = 2'd1;
        b = 2'd2;
        swap(a, b);
        $display("a : %0d b: %0d", a, b);
        swap_keep_a(a, b);
        $display("a : %0d b: %0d", a, b);
    end
endmodule