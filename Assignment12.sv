module tb ();
    bit clk;
    bit en, wr = 0;
    bit [5:0] addr;
    int arr [5] = {12, 14, 23, 48, 56};
    integer i = 0;

    always #20 clk = ~clk;//40 1000/40 -> 25Mhz

    task  sti_en_wr();
        @(posedge clk)
        addr = arr[i];
        if(i<2)begin
            wr = 1;
            en = 1;
        end
        else if(i < 4)begin
            en = 1;
            wr = 0;
        end
        else begin
            en = 0;
            wr = 0;
        end
        $display("addr : %0d en: %0d wr: %0d", addr, en, wr);
        i++;
    endtask 



    initial begin
        repeat(5)
            sti_en_wr();    
    end

    initial begin
        #220;
        $finish();
    end

    initial begin//waveform
        $fsdbDumpfile("top.fsdb");
        $fsdbDumpMDA;
        $fsdbDumpvars;
    end
endmodule