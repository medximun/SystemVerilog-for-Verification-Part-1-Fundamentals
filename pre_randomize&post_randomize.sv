class generator;
    randc byte x, y, z;
    int max, min;

    function void pre_randomize();
    this.min = 5;
    this.max = 10;
    endfunction

    constraint data{
        x inside{[min:max]};
        y inside{[min:max]};
        z inside{[min:max]};
    }

    function void post_randomize();
        $display("x: %0d y: %0d z: %0d at time %0t", x, y, z, $time);
        
    endfunction
endclass //generator


module tb;
    generator g;
    int i;

    initial begin
        g = new();

        for (i = 0;i<20 ; i++) begin
            g.randomize();
            #20;
        end
    end

endmodule