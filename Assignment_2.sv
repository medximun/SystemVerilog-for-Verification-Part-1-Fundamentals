`timescale 1ps/1ps

module tb ();
reg clk;
    
    initial begin
        clk  = 1'b0;
    end

    //25 MHZ => 1000/25 = 40ns
    //1ns = 1000ps
    //40ns *1000ps = 40000 => 40000/2 = 20000(falf period)
    always #20000 clk = ~clk;
    

    //system task at the start of simulation
    initial begin
        $fsdbDumpfile("top.fsdb");
        $fsdbDumpMDA;
        $fsdbDumpvars;
    end

    //4. analyzing values of the variable on console
    initial begin
        $monitor("clk : %0d at time : %0t", clk, $time);
    end

    //5. stop simulation by forcefully calling $finish
    initial begin
        #200000;
        $finish();
    end
endmodule