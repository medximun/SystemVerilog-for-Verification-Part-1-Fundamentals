module tb ();
    int arr1 [15];
    int arr2 [15];

    initial begin
        foreach(arr1[j]) 
            arr1[j] = $urandom % 64;
        foreach(arr2[k]) 
            arr2[k] = $urandom % 64;

        $display("arr1: %0p", arr1);
        $display("arr2: %0p", arr2);
    end
endmodule