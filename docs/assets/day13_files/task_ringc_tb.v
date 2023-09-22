`timescale 1ns / 1ps
module ringcounter_tb(); 
    reg clk = 0, rst = 0;
    wire [5:0] count; 
    always #1 clk = !clk;
    initial begin  
    $dumpfile("task_ringc_tbB.vcd");
    $dumpvars(0,ringcounter_tb);
 
        #20 rst = 1;  
        #20 rst = 0;
        #20 $finish;
    end 
    ringcounter cntr01 ( .clk(clk), .rst(rst), .count(count) ); 
endmodule 
