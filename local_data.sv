class first;
    local int data = 32;
    task display ();
        $display("data : %0d", data);
    endtask //dispaly

    task  set(input int data);
        this.data = data;
    endtask //

    function int get();
    return data;
    endfunction        
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
        s.f1.set(123);
        s.f1.display();
        //s.f1.get();
        $display("data:%0d", s.f1.get());
    end
endmodule