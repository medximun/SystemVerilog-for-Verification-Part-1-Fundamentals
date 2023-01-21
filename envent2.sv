module tb;
    event a1, a2;

    initial begin
        #10;
        ->a1;
        #10;
        ->a2;
    end

    initial begin
        @(a1)
        //wait(a1.triggered);
        $display("Recieve a1 event at %0t", $time);
        @(a2)
        //wait(a2.triggered);
        $display("Recieve a2 event at %0t", $time);
    end
endmodule