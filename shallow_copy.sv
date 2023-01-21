class first;
    int data;
endclass //first

class sec;
    int ds = 34;
    first f1;

    function new();
        f1 = new();    
    endfunction //new()
endclass //sec

module tb;
    sec s1, s2;
    
    initial begin
        s1 = new();
    s1.ds = 45;
    s2 = new s1;
    $display("ds = %0d", s2.ds);

    s2.ds = 78;
    $display("ds = %0d", s2.ds);

    s2.f1.data = 56;
    $display("ds = %0d", s1.f1.data);
    end
    
    

endmodule