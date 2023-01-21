class first;
    int data = 32;
    task display ();
        $display("data : %0d", data);
    endtask //dispaly
endclass 

class sec;
    first f1;
    function new();
        f1 = new();
    endfunction
endclass //sec

module tb;
    sec s;
    
    initial begin
        s = new();
        $display("data : %0d", s.f1.data);
        s.f1.display();
        s.f1.data = 24;
        s.f1.display();
    end
endmodule