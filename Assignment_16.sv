class generator;
    byte a= 5, b = 7;
    bit wr = 1;
    bit en = 1;
    bit[4:0]s = 12;
  
   function generator copy();//object
        copy = new();//constructor
        copy.a = a;
        copy.b = b;
        copy.wr = wr;
        copy.en = en;
        copy.s = s;
    endfunction 

    function void display();
        $display("a:%0d b: %0d wr:%0b en: %0b s:%0d", a, b, wr, en, s);
    endfunction
endclass //first


module tb;
    generator s1, s2;//object

    initial begin
        s1 = new();
        s2 = new s1.copy();

        s2.display();

        s2.a = 15;
        s2.b = 17;
        s1.display();
    end
    

endmodule