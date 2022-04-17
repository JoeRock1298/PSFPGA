module CONTROL
# (parameter Num_coef = 17)
( input val_in,
 input clk,
 input rst,
 output [log2(Num_coef)-1:0] addr,
 output reg ce_Reg,
 output reg rst_Acc,
 output reg ce_Acc
);


 function integer log2;
   input integer value;
   begin
     value = value-1;
     for (log2=0; value>0; log2=log2+1)
       value = value>>1;
   end
 endfunction
endmodule