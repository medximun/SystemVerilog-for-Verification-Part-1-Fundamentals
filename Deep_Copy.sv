class first;
    int data = 12;//object
    function first copy();
        copy = new;
        copy.data = data;
    endfunction //new()
endclass //first

class sec;
    int ds = 34;

    first f1;//object
    function new;
    f1 = new();//constructor
    endfunction

    function sec copy;//object
        copy = new();//constructor
        copy.ds = ds;
        copy.f1 = f1.copy;
    endfunction
endclass //sec

module tb;
    sec s1, s2;//object

    initial begin
        s1 = new();//construcor
        s2 = new();

        s1.ds = 45;
        s2 = s1.copy();//copy the class first also

        $display("s2:%0d", s2.ds);
        s2.ds = 78;
        $display("s1:%0d", s1.ds);

        s2.f1.data = 37;
        $display("s1:%0d", s1.f1.data);

    end
endmodule