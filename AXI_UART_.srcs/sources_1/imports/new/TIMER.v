module TIMER #(parameter COUNT=32'd100)
    (
    input clk,
    input rst,
    input in_trig,
    input rst_trig,
    input check,
    output reg trig
    );
    
    reg [$clog2(COUNT):0] count;
    reg [1:0] state;
    
    localparam IDEL=2'b00, BEGIN =2'b01,TRIGGER=2'b10;
    
    always@(posedge clk)
        begin
            if(rst)
                begin
                    state <= IDEL;
                    count <=0;
                end
            else
                begin
                    case(state)
                        IDEL:
                            begin
                                count <=0;
                                trig <=0;
                                if(in_trig)
                                    begin
                                        state <= BEGIN;
                                    end
                            end
                        BEGIN:
                            begin
                                if(rst_trig)
                                    begin
                                        count <=0;
                                        state <= IDEL;
                                    end
                                else
                                    begin
                                        if(count==COUNT)
                                            begin
                                                state <= TRIGGER;
                                                count <=0;
                                                
                                            end
                                        else
                                            begin
                                                count <= count+1;
                                            end
                                    end
                            end
                        TRIGGER:
                            begin
                                trig <=1;
                                if(trig && check)
                                    begin
                                        state <= IDEL;
                                        
                                    end
                            end
                        default : state <= IDEL;
                    endcase
                end
        end
endmodule
