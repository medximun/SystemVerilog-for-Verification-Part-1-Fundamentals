`timescale 1ns/1ns

module tb ();
    //global signals 
    reg clk, rst;
    reg clk50, clk25;

    //1.initialize global variable
    reg [3:0] temp;

    initial begin
       clk = 1'b0;
       rst = 1'b0; 
       clk50 = 1'b0;
       clk25 = 1'b0;
       #5;
       clk25 = 1'b1;
       clk50 = 1'b1;
       #10;
       clk50 = 1'b0;
        #5;
    end

    //2. random signal for data/ control

    initial begin
        rst = 1'b1;
        #30;
        rst = 1'b0;
    end
    initial begin
        temp = 4'b0100;
        #10;
        temp = 4'b1100;
        #10;
        temp = 4'b0011;
        #10;
    end

    //3. system task at the start of simulation
    initial begin
        $fsdbDumpfile("top.fsdb");
        $fsdbDumpMDA;
        $fsdbDumpvars;
    end

    //4. analyzing values of the variable on console
    initial begin
        $monitor("temp : %0d at time : %0t", temp, $time);
    end

    //5. stop simulation by forcefully calling $finish
    initial begin
        #200;
        $finish();
    end

   

    always #5 clk = ~clk;
    /*
    always #10 clk50 = ~clk50;
    always #20 clk25 = ~clk25;
    */
endmodule