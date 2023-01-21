class generator;
    rand bit wr, oe;
    rand byte waddr, raddr;

    function void post_randomize();
        $display("wr: %0d oe: %0d waddr: %0d raddr: %0d", wr, oe, waddr, raddr);    
    endfunction

    extern constraint signal;
    extern constraint control_oe_wr;
    extern constraint addr;
endclass //generator

constraint generator::signal {
    oe dist {0:=50, 1:=50};
    wr dist {0:=50, 1:=50};
}

constraint generator::control_oe_wr{
    (oe==0)<->(wr == 1);
}

constraint generator::addr{
    if(wr){
        waddr inside {[11:15]};
        raddr == 0;
    }
    else {
        waddr == 0;
        raddr inside{[11:15]};
    }
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
