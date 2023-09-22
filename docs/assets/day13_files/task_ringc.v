module ringcounter(clk, rst, count); 
    input clk, rst;
    output  [5:0] count;
    wire clk, rst;
    reg [5:0] count = 6'b1;  
    always @ (posedge clk, posedge rst )
        begin  
        if ( rst ==1 )  
            begin    
            count[5:0] <= {count[4:0],count[5]};   
            //count[0] <= count[5];  
        end
	else 
            count <= 6'b1;

    end 


endmodule 
