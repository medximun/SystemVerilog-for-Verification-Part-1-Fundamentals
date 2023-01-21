class first;
    int data1, data2, data3;
endclass //f

module tb ();
    initial begin
    first f = new();
    f.data1 = 45;
    f.data2 = 78;
    f.data3 = 90;

    $display("data1: %0d data2: %0d data3: %0d", f.data1, f.data2, f.data3);
    end
    
endmodule