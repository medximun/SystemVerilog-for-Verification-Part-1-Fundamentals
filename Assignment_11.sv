module tb ();

    int a, b, mul1;

    function int mul();
        return a * b;
    endfunction

    function void compare();
        if (mul1 == 56) 
            $display("Test Passed!");
        else
            $display("Test Failed!");
    endfunction

    initial begin
        a = 'd8;
        b = 'd7;
        mul1 = mul();
        compare();
    end
    
endmodule