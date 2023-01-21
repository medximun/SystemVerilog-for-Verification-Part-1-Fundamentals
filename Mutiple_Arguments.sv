class first;
    int data1;//<-
    byte data2;
    shortint data3;

    function new(input int data1 = 0, input byte data2 =0, input shortint data3 = 0);
        this.data1 = data1;//use put in data to change the same name data saved
        this.data2 = data2;
        this.data3 = data3;
    endfunction
    //new(
endclass //firstinput int data1 = 0, input byte data2, input shortint data3

module tb ();
    first f1;
    first f2;

    initial begin
        f1 = new(23, ,35);//follow position(like verilog instance module)
        $display("data1: %0d data2: %0d data3:%0d", f1.data1, f1.data2, f1.data3);
        f2 = new(.data3(37), .data2(41), .data1(5));
        $display("data1: %0d data2: %0d data3:%0d", f2.data1, f2.data2, f2.data3);
    end
endmodule
