class generator;
    randc byte x, y, z;
    extern constraint data;
    extern function void display;
endclass //generator

constraint generator::data{
    x inside{[0:50]};
    y inside{[0:50]};
    z inside{[0:50]};
}

function void generator::display();
    $display("x: %0d y: %0d z: %0d at time %0t", x, y, z, $time);
endfunction

module tb;
    generator g;
    int i;

    initial begin
        g = new();

        for (i = 0;i<20 ; i++) begin
            assert (g.randomize()) 
            else   $display("randomization failed!");
            g.display();
            #20;
        end
    end

endmodule