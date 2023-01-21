`timescale 1ns/1ps
module tb ();
    reg [7:0] a, b;
    int c, d;

    initial begin
        a = 8'd12;
        b = 8'd34;
        c = 32'd67;
        d = 32'd255;
    end

    initial begin
        #12;
        $display("a : %0d at time %0t", a, $time);
        $display("b : %0d at time %0t", b, $time);
        $display("c : %0d at time %0t", c, $time);
        $display("d : %0d at time %0t", d, $time);
        #10;
        $finish();
    end
    
endmodule
