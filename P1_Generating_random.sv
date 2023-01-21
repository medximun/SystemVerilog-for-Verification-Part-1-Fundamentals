class Generator;
    //rand bit[3:0] a, b;//input with rand 
    randc bit [3:0] a, b;//input with unreapeating rand
    bit [3:0] y;//output
endclass //Generator

module tb;
    Generator g;
    int i =  0;//for int
    int status = 0;
    
    initial begin
        g = new();//constructor
        for (i = 0;i<10 ; i++) begin
            g.randomize();
            $display("a: %0d b:%0d", g.a, g.b);
            #10;
        end
    end
endmodule