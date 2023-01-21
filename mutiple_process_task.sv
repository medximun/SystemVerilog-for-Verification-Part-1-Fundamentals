module tb;
    int data1, data2;
    event done;
    event next;

    int i = 0;

    ////////////////////////////////generator////////////////////////////////
    task generator();
        for (int i = 0; i < 10; i++) begin
            data1 = $urandom;
            $display("data1 sent! : %0d", data1);
            #10;
            
            wait(next.triggered);
        end
        ->done;
    endtask
    

    ////////////////////////////////driver////////////////////////////////
    task driver();
        forever begin
            #10;
            data2 = data1;
            $display("data recieved!: %0d", data2);
            ->next;
        end
    endtask
    ////////////////////////////////
    task wait_event();
        wait(done.triggered)
        $display("completed sending all data");
        $finish(); 
    endtask

    initial begin
        fork
            generator();
            driver(); 
            wait_event(); 
        join
    end
endmodule