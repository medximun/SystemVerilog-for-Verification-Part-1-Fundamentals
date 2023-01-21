class transaction;
 
    rand bit [7:0] a;
    rand bit [7:0] b;
    rand bit wr;
     
    endclass

class generater;
    transaction t;
    mailbox #(transaction) mbx;
    

    function new(mailbox #(transaction) mbx);
    this.mbx = mbx;  
    endfunction

    task run();
        for (int i = 0;i < 10 ;i++ ) begin
            t = new();
            assert(t.randomize) else $error("randomized failed!");
            mbx.put(t);
            $display("[GEN] SENT a:%0d b:%0d wr:%0d ", t.a, t.b, t.wr);
            #10;
        end
        
    endtask
endclass

class driver;
    transaction data;
    mailbox #(transaction) mbx;
    function new(mailbox #(transaction) mbx);
        this.mbx = mbx;
    endfunction

    task run();
        forever begin
            data = new();
            mbx.get(data);
            $display("[DRI] RCV a:%0d b:%0d wr:%0d ", data.a, data.b, data.wr);
        end
    endtask
endclass

module TB;
    generater g;
    driver d;
    mailbox #(transaction) mbx;
    
    initial begin
        mbx = new();
        g = new(mbx);
        d = new(mbx);
        

        fork
            g.run();
            d.run();
        join
    end
endmodule