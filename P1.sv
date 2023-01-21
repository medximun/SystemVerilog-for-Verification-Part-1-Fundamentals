module tb ();
    int arr[10] = '{default:0};
    initial begin
        foreach(arr[j])begin
            arr[j] = j**2;
            $display("%0d", arr[j]);
        end
    end
    
endmodule