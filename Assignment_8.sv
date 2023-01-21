`timescale 1ns/1ps
module tb ();
    int arr[];//dynamic array
    int i = 1;

    initial begin
        //initialize first 7 with 7 * (i+1)
       arr = new[7];
       foreach(arr[j]) begin
        arr[j] = 7 * (j + 1);
       end 
       $display("arr : %0p", arr);

       #20;

       //copy old arr to new arr
       arr = new[20](arr);
       $display("arr : %0p", arr);

       //initialize later with 5 * i
       repeat($size(arr)-7)begin
        arr[i+6] = i * 5;  
        i++;
       end
       $display("arr : %0p", arr);
    end
endmodule