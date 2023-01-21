class generator;
        randc bit [3:0] a, b;
        bit y;
endclass //generator

module tb; 
    generator g;
    int i = 0;
    initial begin
        g = new();//constructor
        for(i = 0; i < 10;i++)begin
            /* use if else to show 
            if(!g.randomize())begin
                $display("randamization falied!");
            end
            */
            assert (g.randomize()) else   begin //use assertion
                $display("randamization falied!");
                $finish;
            end
            

            $display("a: %0d b: %0d y: %0d",g.a, g.b, g.y);
        end
    end
endmodule