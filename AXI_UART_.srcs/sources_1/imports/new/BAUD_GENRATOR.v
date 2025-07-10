`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.06.2025 14:28:24
// Design Name: 
// Module Name: BAUD_GENRATOR
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description:  
//  
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module BAUD_GENRATOR#(parameter FREQNCY = 32'd70_000_000)(
    input ref_clk,
    input rst,
    input [30:0] baud_rate,
    input [4:0] sample_rate,
    output reg uart_clk_o,
    output reg sample_clk
    );
    
    
    reg [30:0] counter;
    reg [5:0] u_counter;
    //wire [30:0] uart_divisor = (baud_rate) - 1;

    
    always@(posedge ref_clk)
        begin
            if(!rst )
                begin
                   counter <=0; 
                   sample_clk <=0;
                end
            else
                begin
                    if (counter == (baud_rate) - 1)
                        begin
                            counter <=0;
                            sample_clk <= ~sample_clk;
                        end                    
                    else
                        begin
                            counter <= (counter + 1);                            
                        end
                   
                end
                
        end
    always@(posedge sample_clk or negedge rst)
        begin 
            if(!rst)
                begin
                   uart_clk_o <=0;
                   u_counter <=0;
                end
            else
                begin
                    if(u_counter == (sample_rate/2)-1 )
                        begin
                            u_counter <=0;
                            uart_clk_o <= ~uart_clk_o;
                        end
                        
                    else if(u_counter < (sample_rate/2)-1 )
                        begin
                            u_counter <= (u_counter + 1); 
                            
                        end                  
                    else
                        begin
                            u_counter <=0;
                            uart_clk_o <= 0;                          
                        end
                   
                end
                
        end

endmodule
