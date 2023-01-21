class first;
    bit[3:0] a, b, c;
    bit[5:0]d;
    task add_and_display(input bit [3:0] a, b, c);
        this.d = a + b + c;
        $display("a:%0d b:%0d c:%0d d:%0d",a, b, c, d);
    endtask //new()
endclass //first

module tb;
first f1;
initial begin
    f1 = new();
    f1.add_and_display(1, 2, 4);
end

endmodule
