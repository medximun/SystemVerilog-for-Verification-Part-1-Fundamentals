class generator;
    randc byte  x, y, z;
    constraint data{x>0; y>0; z>0;}
endclass //generator

module tb;
    generator g;
    int i = 0;

    initial begin
        g = new();
        for (i = 0;i < 20 ; i++) begin
            assert (g.randomize) 
            else   begin
            $display("randomiztion failed at %0t", $time);
            $finish;
            end
            $display("x: %0d y : %0d z: %0d time: %0t", g.x, g.y, g.z, $time);
            #20;
        end
    end

endmodule