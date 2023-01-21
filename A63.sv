class generator;
    rand bit [4:0] a;
    rand bit [5:0] b;
    int error_time = 0;

    constraint data  {
        a inside{[0:8]};
        b inside{[0:5]};
    }
    
    function void post_randomize();
        $display("a: %0d b:%0d error_time: %0d at time:%0t", a, b, error_time, $time);
        
    endfunction
endclass //generator

module tb;
    generator g;
    int i;

    initial begin
        g = new();

        for (i = 0; i < 20 ; i++) begin
            assert (g.randomize()) 
            else  begin
                $display("randomize failed!");
                g.error_time += 1;
            end 
            #20;
        end
    end
endmodule