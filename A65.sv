class generator;
    rand bit wr;
    rand byte addr;
    
    function void post_randomize();
        $display("wr: %0d addr: %0d", wr, addr);
    endfunction
    extern constraint data;
endclass //generator

constraint generator::data{
    wr dist{0:=50, 1:=50};
    if(wr){
        addr inside{[0:7]};
    }
    else{
        addr inside{[8:15]};
    }
}

module tb;
    generator g;

    initial begin
        g = new();

        for (int i = 0;i<20 ; i++) begin
            assert (g.randomize()) 
            else   $display("randomize failed!");
        end
    end
endmodule