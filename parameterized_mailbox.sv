class transaction;
    rand byte din1;
    rand byte din2;
    bit [4:0] dout;
endclass 

class generator;
    transaction t;
    mailbox #(transaction) mbx;
    
    function new(mailbox #(transaction) mbx);
        this.mbx = mbx;
    endfunction

    task main();
        for (int i = 0;i < 10 ;i++ ) begin
            t = new();
            assert (t.randomize ) else   $display("randomize failed");
            $display("[GEN] :DATASENT din1:%0d din2:%0d", t.din1, t.din2);
            mbx.put(t);
            #10;
        end
    endtask
endclass 

class driver;
    transaction dc;
    mailbox #(transaction) mbx;

    function new(mailbox #(transaction) mbx);
        this.mbx = mbx;
    endfunction

    task main();
        forever begin
            mbx.get(dc);
            $display("[DRI] :DATARCV din1:%0d din2:%0d", dc.din1, dc.din2);
            #10;
        end
    endtask
endclass 

module tb();
    generator g;
    driver d;
    mailbox #(transaction) mbx;

    initial begin
        mbx = new();
        g = new(mbx);
        d = new(mbx);

        fork
            g.main();
            d.main();    
        join
    end
endmodule