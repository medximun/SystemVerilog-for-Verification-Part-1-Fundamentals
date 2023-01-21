`timescale 1ns/1ps

module tb ();

    reg clk, clk_gen;
    
    initial begin
        clk = 1'b0;
        clk_gen = 1'b0;
    end
    
    always #5 clk = ~clk;

    real period, ton, toff;

    //cal ton toff
    task  cal(input real period, input real duty_cycle, output real ton, output real toff);
        ton = period *  duty_cycle;
        toff = period - ton;
    endtask 

    //clk_gen
    task  clk_gen_task(input real ton, input real toff);
        @(posedge clk);
        while(1)begin
            clk_gen = 1;
        #ton;
        clk_gen = 0;
        #toff;
        end
    endtask 

    //task
    initial begin
        cal(40, 0.4, ton, toff);
        clk_gen_task(ton, toff);
    end

    //end
    initial begin
        #200;
        $finish();
    end

    //dump wave
    initial begin
        $fsdbDumpfile("top.fsdb");
        $fsdbDumpMDA;
        $fsdbDumpvars;
    end
endmodule