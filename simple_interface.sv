module add (
    input [3:0] a, b,
    output [4:0] out
);
    assign out  = a + b;    
endmodule

interface add_if;
    logic [3:0]a, b;
    logic [4:0]out;
endinterface //

module tb;
    add_if aif();

    add(aif.a, aif.b, aif.out);

    initial begin
        aif.a = 3;
        aif.b = 4;
        #10
        aif.a = 1;
        #10
        aif.b = 6;
        #10
        $finish;
    end
    
    initial begin
        $monitor("@ %0t : a is %0h, b is %0h,out is %0h,",$time, aif.a, aif.b, aif.out);
    end
endmodule