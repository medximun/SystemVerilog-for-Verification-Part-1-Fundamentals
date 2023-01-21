class first;
    int data = 34;
    byte temp = 8'h11;

    function first copy();//generate a copy class
        copy = new();
        copy.data = data;
        copy.temp = temp;    
    endfunction //new()
endclass //first

module tb;
    first f1;
    first f2;

    initial begin
        f1 = new();
        f2 = new();

        f2 = f1.copy;
        $display("data: %0d temp: %0d", f2.data, f2.temp);
    end
endmodule