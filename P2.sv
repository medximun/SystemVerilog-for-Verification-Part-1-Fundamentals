module tb ();
    int arr [$];
    int j = 0;

    initial begin
        arr = {1, 2, 3};
        $display("arr: %0p", arr);

        arr.push_front(7);//push from 0
        $display("arr: %0p", arr);

        arr.push_back(9);//push from last
        $display("arr: %0p", arr);

        arr.insert(2, 10);//insert data (on array[index], add what)
        $display("arr: %0p", arr);

        j = arr.pop_front();//pop from 0
        $display("arr: %0p", arr);
        $display("j: %0d", j);

        j = arr.pop_back();//pop from last
        $display("arr: %0p", arr);
        $display("j: %0d", j);

        arr.delete(1);
        $display("arr: %0p", arr); 
    end
endmodule