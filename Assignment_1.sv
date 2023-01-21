`timescale 1ns/1ps

module tb ();
    reg clk, resetn;

    // 1.initialize global variable
    initial begin
        clk = 0;
        resetn = 0;
    end

    // 2.keep low for 60 ns
    initial begin
        #60;
        resetn = 1;
    end

    // 3.system task at the start of simulation
    initial begin
        $fsdbDumpfile("top.fsdb");
        $fsdbDumpMDA;
        $fsdbDumpvars;
    end

    // 4.analyzing values of the variable on console
    initial begin
        $monitor("resetn : %0d at time : %0t", resetn, $time);
    end

    //finish
    initial begin
        #100;
        $finish();
    end
endmodule
