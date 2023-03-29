module add (
    input [3:0] a, b, 
    input clk, 
    output reg[4:0] sum 
);

always @(posedge clk ) begin
    sum <= a +b;
end 
endmodule

interface add_if;
    logic [3:0] a, b;
    logic [4:0] sum;
    logic clk;
endinterface //add.iflogic [3:0] a, b;

module tb;
    add_if aif (); //construct interface
    add dut(aif.a, aif.b, aif.clk, aif.sum); //call dut by position

    initial begin
        aif.a = 4;
        aif.b = 3;
        #10;
        aif.a = 5;
        #10;
        aif.b = 2;
    end
    
    initial begin
        aif.clk = 0;
        #40;
        $finish;
    end

    always #10
    aif.clk = ~aif.clk;

    initial begin
        $monitor("@ %0t : a: %0d, b: %0d sum: %0d", $time, aif.a, aif.b, aif.sum);
    end

    initial begin
        $fsdbDumpfile("top.fsdb");
        $fsdbDumpMDA;
        $fsdbDumpvars;
    end

endmodule