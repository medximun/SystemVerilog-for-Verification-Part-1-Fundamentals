class first;
    byte a, b, c;
    function new(input byte a, input byte b, input byte c); //add a constructor that accept 3 input then change data in this constructor
        this.a = a;
        this.b = b;
        this.c = c;  
    endfunction //new()

    task  display(); //to displaty the value with task instead
        $display("a: %0d b: %0d c: %0d", a, b, c);
    endtask //
endclass //first

module tb ();
    first f1;

    initial begin
        f1 = new(2, 4, 56);//assign a, b, c by position with 2, 4  56
        //$display("a: %0d b: %0d c: %0d", f1.a, f1.b, f1.c);
        f1.display();
    end
endmodule
