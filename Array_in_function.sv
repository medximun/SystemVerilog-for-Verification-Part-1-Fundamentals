module tb ();

    bit [3:0] a [16];

    function automatic  void ini_arr(ref bit [3:0] a [16]);
        foreach(a[j])begin
            a[j] = j;
        end
    endfunction //automatic
    
    initial begin
         ini_arr(a);
         for(int o = 0;o < $size(a);o++)begin
            $display("a[%0d]: %0d",o, a[o]);
         end
    end
endmodule