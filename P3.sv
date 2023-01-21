`timescale 1ns/1ps
module tb ();
    time fix_time = 0;//store fixed point time value
    realtime real_time = 0;//store float point  time value
    
    /////
    ///$time() return current simulation time in fixed  point format
    ///$realtime() return current simulation time in floating  point format

    initial begin
        #12.67;
        fix_time = $time();
        real_time = $realtime();

        $display("current simulation fix_time : %0t ", fix_time);
        $display("current simulation real_time : %0t ", real_time);
    end
    ////12.34 -> 12
    ////12.578 -> 13
endmodule