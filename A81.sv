module tb;
    int Task1_cnt = 0, Task2_cnt = 0;

    task  Task1();
        forever begin
            #20;
            Task1_cnt += 1;
            $display("Task 1 Trigger Task1_cnt:%0d Task2_cnt:%0d at time %0t", Task1_cnt, Task2_cnt, $time);
        end
        
    endtask //

    task  Task2();
        forever begin
            #40;
            Task2_cnt += 1;
            $display("Task 2 Trigger Task1_cnt:%0d Task2_cnt:%0d at time %0t", Task1_cnt, Task2_cnt, $time);
        end
        
    endtask //

    initial begin
        fork
            Task1();
            Task2();
        join_none

        #200;
        $finish();
    end
endmodule