class first;
    int data;

    function new(input int datain = 0);
        data = datain;
    endfunction //new()
endclass //first

module tb ();

    first f1;//call class

    initial begin
        f1 =  new(23);
         $display("data = %0d", f1.data);
    end
    
endmodule