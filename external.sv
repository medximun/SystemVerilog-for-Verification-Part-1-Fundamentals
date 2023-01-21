class generator;
    randc byte a, b;
    bit [3:0] y;

    //  Constraint: data
    extern constraint data;

    extern function void display();
endclass //generator

constraint generator::data{
    a inside{[0:3]};
    b inside{[3:5]};
}

function void generator::display;
    $display("a: %0d b: %0d", a, b);;
endfunction

module tb;
    generator g;
    int i = 0;
    
    initial begin
        g = new();

        for (i = 0; i<15; i++) begin
            assert (g.randomize()) 
            else   $display("randomiztion falied!");
            g.display();
            #10;
        end
    end
    
endmodule