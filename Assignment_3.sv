`timescale 1ns/1ps

module tb ();

reg clk;
//9MHZ => 1000/9 ~= 111.111 nS

initial begin
    clk = 0;
end

always #111.111 clk =~clk; 
    
//3. system task at the start of simulation
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
    #10000;
    $finish();
end
endmodule