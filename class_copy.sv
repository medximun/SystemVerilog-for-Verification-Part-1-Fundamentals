class first;
    int data = 0;
endclass //first

module tb;
    first f1;
    first copy;

    initial begin
        f1 = new();
        f1.data = 21; //don't touch data in f1
        copy = new f1;//use copy to do operation

        $display("data: %0d", copy.data);
    end

endmodule