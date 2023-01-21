module tb;
    int data1, data2;
    event done;

    int i = 0;

    ////////////////////////////////generator////////////////////////////////
    initial begin
        for (int i = 0; i < 10; i++) begin
            data1 = $urandom;
            #10;
            $display("data1 sent! : %0d", data1);
        end
        ->done;
    end

    ////////////////////////////////driver////////////////////////////////
    initial begin
        forever begin
            #10;
            data2 = data1;
            $display("data recieved!: %0d", data2);
        end
    end
    ////////////////////////////////
    initial begin
        wait(done.triggered)
        $finish();
    end
endmodule