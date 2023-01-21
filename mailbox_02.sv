class generator;
    int data = 12;
    mailbox mbx;

    function new(mailbox mbx);
        this.mbx = mbx; 
    endfunction

    task run();
        mbx.put(data);
        $display("[GENERATOR]: data sending %0d", data);
    endtask 
endclass //generator

class driver;
    int datac = 0;
    mailbox mbx;
    
    function new(mailbox mbx);
        this.mbx = mbx; 
    endfunction

    task run();
        mbx.get(datac);
        $display("[DRIVER]: RECV datac  %0d", datac);
    endtask
endclass

module tb;
    generator g;
    driver d;
    mailbox mbx;

    initial begin
        mbx = new();
        g = new(mbx);
        d = new(mbx);    

        g.run();
        d.run();
    end
endmodule