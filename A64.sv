class generator;
    rand bit wr, rst;

    function void post_randomize();
        $display("wr: %0d rst: %0d", wr, rst);;    
    endfunction

    extern constraint signal;
endclass //generator

constraint generator::signal {
    rst dist {0:=30, 1:=70};
    wr dist {0:=50, 1:=50};
}

module tb;
    generator g;

    initial begin
        g = new();

        for (int i = 0;i< 20 ; i++) begin
            assert (g.randomize()) 
            else   $display("randomize failed!");
        end
    end
endmodule
