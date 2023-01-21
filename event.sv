module tb;
    event a;

    initial begin
        #10;
        ->a;
    end

    initial begin
        //@(a)
        wait(a.triggered);
        $display("Recieve a event at %0t", $time);
    end
endmodule