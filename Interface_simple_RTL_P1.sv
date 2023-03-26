module add (
    input [3:0] a, b, 
    output [4:0] sum 
);
assign  sum = a +b;    
endmodule

interface add_if;
    logic [3:0] a, b;
    logic [4:0] sum;
endinterface //add.iflogic [3:0] a, b;

module tb;
    add_if aif (); //construct interface
    add dut(aif.a, aif.b, aif.sum); //call dut by position

    initial begin
        aif.a = 4;
        aif.b = 3;
        #10;
        aif.a = 5;
        #10;
        aif.b = 2;
    end

    initial begin
        $monitor("@ %0t : a: %0d, b: %0d sum: %0d", $time, aif.a, aif.b, aif.sum);
    end

endmodule