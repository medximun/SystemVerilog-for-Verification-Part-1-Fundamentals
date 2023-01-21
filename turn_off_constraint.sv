class generator;
    rand bit ce, rst;

    function void post_randomize();
        $display("ce: %0d rst: %0d", ce, rst);;    
    endfunction

    extern constraint signal;
    extern constraint control_rst_ce;
endclass //generator

constraint generator::signal {
    rst dist {0:=80, 1:=20};
    ce dist {0:=50, 1:=50};
}

constraint generator::control_rst_ce{
    (rst==0)->(ce == 1);
}

module tb;
    generator g;

    initial begin
        g = new();
        

        g.control_rst_ce.constraint_mode(0);
        $display("control_rst_ce on? : %0d",g.control_rst_ce.constraint_mode());
        for (int i = 0;i< 20 ; i++) begin
            assert (g.randomize()) 
            else   $display("randomize failed!");
        end
    end
endmodule
