class first; //can seen as dynamic module, need constructor to allocate memory space
    bit [2:0] data;
    bit [1:0] data2;
    reg [2:0] data3;
    reg [1:0] data4;
endclass //first

module tb ();
    first f;

    initial begin
        f = new(); //constructor , without this wn't allocate memory
        $display("data: %0d  data2: %0d data3: %0d data4: %0d", f.data, f.data2, f.data3, f.data4);
        f.data = 3'd1;
        f.data2 = 2'd3;
        $display("data: %0d  data2: %0d data3: %0d data4: %0d", f.data, f.data2, f.data3, f.data4);
        f = null;// release the memory of this called class
        $display("data: %0d  data2: %0d data3: %0d data4: %0d", f.data, f.data2, f.data3, f.data4);
    end
endmodule