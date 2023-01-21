module tb ();
    int arr[20];
    int qu[$];
    
    initial begin
        //add 20 random number in arr
        foreach(arr[j])begin
            arr[j] = $urandom % 32;
        end

        //push arr into qu
        for (int i = 0; i<$size(arr); i++) begin
            qu.push_front (arr[i]);
        end

        //print
        $display("arr : %0p" , arr);
        $display("qu : %0p" , qu);
    end
endmodule