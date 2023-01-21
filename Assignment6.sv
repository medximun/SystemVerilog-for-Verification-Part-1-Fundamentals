module tb ();
    integer arr [10] = '{default:0};

    integer i;
    initial begin
        for(i = 0;i<10;i++)
            arr[i] = i * i;
    end
    initial begin
        #10;
        $display("arr: %0p", arr);
        #10;
        $finish();
    end
    

    
endmodule