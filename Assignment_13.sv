module tb ();
    bit [7:0] a [32];
    
    function automatic void mul8(ref bit [7:0] a [32]);
        foreach(a[j])begin
            a[j] = 8 * j;
        end
    endfunction

    initial begin
        mul8(a);
        for (int i = 0; i<= $size(a)-1;i++ ) begin
            $display("a[%0d]: %0d", i, a[i]);
        end
    end
    
endmodule