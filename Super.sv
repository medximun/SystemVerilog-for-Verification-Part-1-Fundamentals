class first;
    int data = 12;
    function new(input int data);
        this.data = data;
    endfunction //new()
endclass //first

class sec extends first;
    int temp = 13;
    function new(int data, temp);
        super.new(data);
        this.temp = temp;
    endfunction
     //new()
endclass //sec

module tb;
    sec s1;
    
    initial begin
        s1 = new(23, 24);
        $display("data:%0d temp:%0d", s1.data, s1.temp);
    end
endmodule