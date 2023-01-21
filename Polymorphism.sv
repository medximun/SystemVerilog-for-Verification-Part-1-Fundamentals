/*class first;//object 
    int data = 12;
    function void dispaly;//without virtual won't assign properly
        $display("first data:%0d", data);
    endfunction 
endclass //first
*/
class first;//object 
    int data = 12;
    virtual function void display();//
        $display("first data:%0d", data);
    endfunction 
endclass //first

class sec extends first;//child class sec extends with first
    function void display();
        $display("sec data:%0d", data);
    endfunction //new()
endclass //sencond extends

module tb;
    first f1;//OBJCT
    sec s1;//object

    initial begin
        f1 = new();
        s1 = new();
        f1 = s1;

        f1.display();
    end
    
    
    
endmodule