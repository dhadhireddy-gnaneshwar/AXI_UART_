`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.05.2025 10:49:48
// Design Name: 
// Module Name: AXI_MASTER
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


module AXI_MASTER #(parameter ADDR_WIDTH=32, 
    parameter DATA_WIDTH=64,
    parameter ID_WIDTH = 4,
    parameter SIZE_WIDTH=4,
    parameter LEN_WIDTH=8,
    parameter RESPONSE_WIDTH=3)(
    input trigger,
    input r_trigger,
    input [ADDR_WIDTH-1:0] in_addr,
    input [ID_WIDTH-1:0] in_id,
    input [LEN_WIDTH-1:0] in_len,
    input [SIZE_WIDTH-1:0] in_size,
    input [1:0] burst_type,
    input [(DATA_WIDTH/8)-1:0] in_strb,
    input [DATA_WIDTH-1:0] in_data,
    
    output[RESPONSE_WIDTH-1:0] out_bresp,
    output [ID_WIDTH-1:0] out_bid,
    //AXI DEFAULT PORTS
    input aclk,
    input areset,
    //AW CHANNEL PORTS
    input awready,
    output [(ADDR_WIDTH-1):0] awaddr,
    output [ID_WIDTH-1:0] awid,
    output [SIZE_WIDTH-1:0] awsize,
    output [1:0] awburst,
    output [LEN_WIDTH-1:0] awlen,
    output awvalid,
    
    //W - CHANNEL
    output wvalid,
    input wready,
    output [DATA_WIDTH-1:0] wdata,
    output [(DATA_WIDTH/8)-1:0] wstrb,
    output wlast,
    
    //B - CHANNEL
    input bvalid,
    input [RESPONSE_WIDTH-1:0] bresp,
    input [ID_WIDTH-1:0] bid,
    output bready,
    
//    input [RESPONSE_WIDTH-1:0] bresp,
//    input [ID_WIDTH-1:0] bid,
//    output bready,
    
    //AR - CHANNEL
    input arready,
    output [ADDR_WIDTH-1:0] araddr,
    output [ID_WIDTH-1:0] arid,
    output [SIZE_WIDTH-1:0] arsize,
    output [1:0] arburst,
    output [LEN_WIDTH-1:0] arlen,
    output arvalid,
    
    // R - CHANNEL
    output rready,
    input rvalid,
    input [DATA_WIDTH-1:0] rdata,
    input [ID_WIDTH-1:0] rid,
    input rlast,
    input [RESPONSE_WIDTH-1:0] rresp,
    output [DATA_WIDTH-1:0] read_data_out,
    output [RESPONSE_WIDTH-1:0] read_resp,
    output [ID_WIDTH-1:0] read_id
    );
    
    
    reg [1:0] aw_state,w_state,b_state,ar_state,r_state;
    reg [LEN_WIDTH-1:0] r_awlen;
    reg [LEN_WIDTH-1:0] beat_counter;
    localparam IDEL= 2'b00, START=2'b01,DATA = 2'b10;
    wire status;
    reg start;
    initial
        begin
            {aw_state,w_state,b_state,ar_state,r_state}=10'h0;
        end
//     assign r_awlen = (((aw_state==START)&& awvalid) ) ? in_len : r_awlen;
//     assign r_arlen = (((ar_state==START)&& arvalid)  ) ? in_len : r_awlen;
    //-----------AW CHANNEL PORT ASSIGNMENTS BEGIN------------------------\\
    assign awvalid =(aw_state == START);
    assign awaddr  = areset ? 0: in_addr;
    assign awid    = areset ? 0: in_id ;
    assign awsize  = areset ? 0: in_size;
    assign awlen   = areset ? 0: in_len;
    assign awburst = areset ? 0: burst_type;
    //-----------AW CHANNEL PORT ASSIGNMENTS END ------------------------\\
    //-------------------------------------------------------------------\\
    //-----------W CHANNEL PORT ASSIGNMENTS BEGIN------------------------\\
     assign wvalid = (w_state==START);
     assign wlast  = ((w_state==START) && wvalid && beat_counter == r_awlen)?1:0;
     assign wdata  = areset ? 0: in_data;
     assign wstrb  = areset ? 0: in_strb ;
     //-----------W CHANNEL PORT ASSIGNMENTS END ------------------------ \\
     //-------------------------------------------------------------------\\
     //-----------B CHANNEL PORT ASSIGNMENTS BEGIN------------------------\\
     assign bready = ((b_state==START && bvalid))? 1 : 0;
     //-----------B CHANNEL PORT ASSIGNMENTS END -------------------------\\
     //-------------------------------------------------------------------\\
     //-----------AR CHANNEL PORT ASSIGNMENTS BEGIN------------------------\\
     assign arvalid = (ar_state == START);
     assign araddr  = areset ? 0: in_addr ;
     assign arid    = areset ? 0: in_id   ;
     assign arsize  = areset ? 0: in_len  ;
     assign arlen   = areset ? 0: in_len  ;
     assign arburst = areset ? 0: burst_type;
     //-----------AR CHANNEL PORT ASSIGNMENTS BEGIN------------------------\\
     //-------------------------------------------------------------------\\
     //-----------AR CHANNEL PORT ASSIGNMENTS BEGIN------------------------\\
     assign rready = (r_state == START);
     //-----------AR CHANNEL PORT ASSIGNMENTS BEGIN------------------------\\
     //-------------------------------------------------------------------\\
      assign read_data_out = (r_state == START) ? rdata : 0;
      assign read_id = (r_state == START) ?rid : 0;
      assign read_resp = (r_state == START)?rresp:0;
      //-----------RESPONSE STATUS ASSIGNMENTS BEGIN----------------------\\
      //-------------------------------------------------------------------\\
      assign status = (bvalid&&bresp==0&& bid>=0)?1:0;
      assign out_bresp = bvalid? bresp:0;
      assign out_bid = bvalid? bid:0;
    always@(posedge aclk)
        begin
            if(areset)
                begin
                    {aw_state,w_state,b_state,ar_state,r_state}<=10'h0;
                    beat_counter<=0;
                    start <=0;
                end
            else
                begin
                //----------AW CHANNEL STATE STATE MACHINE-------\\
                    case(aw_state)
                    
                        IDEL:
                            begin
                                if(trigger)
                                    begin
                                       aw_state<= START;
                                       
                                    end
                                else
                                    begin
                                        aw_state <= IDEL;
                                    end
                            end
                        START:
                            begin
                                if(awvalid && awready)
                                    begin
                                        aw_state <= IDEL;
                                        r_awlen <= in_len;
                                        start <=1;
                                    end
                                else
                                    begin
                                        aw_state <= START;
                                    end
                            end
                        default : aw_state <= IDEL;
                    endcase
                    
                    
                    //----------W CHANNEL STATE STATE MACHINE-------\\
                    case(w_state)
                    
                        IDEL:
                            begin
                                if(start)
                                    begin
                                       w_state<= START; 
                                       start <= 0;                                      
                                    end
                                else
                                    begin
                                        w_state <= IDEL; 
                                        beat_counter <= 0;
                                    end
                            end
                        START:
                            begin
                                 if(wvalid && wready)
                                    begin
                                        w_state <= DATA;
                                    end
                                else
                                    begin
                                       w_state<= START;
                                    end
                            end
                        DATA :
                            begin
                                if(beat_counter == r_awlen)
                                    begin
                                        w_state <= IDEL; 
                                        beat_counter <= 0;
                                    end
                                else
                                    begin
                                        beat_counter <= beat_counter+1;
                                        w_state <=START;
                                    end
                            end
                        default : w_state <= IDEL;
                    endcase
                    
                    //----------B CHANNEL STATE STATE MACHINE-------\\
                    case(b_state)
                    
                        IDEL:
                            begin
                                if(bvalid)
                                    begin
                                       b_state<= START;
                                    end
                            end
                        START:
                            begin
                                if(bvalid && bready)
                                    begin
                                        b_state <= IDEL; 
                                    end
                            end
                        default : b_state <= IDEL;
                    endcase
                    
                    
                    //----------AR CHANNEL STATE STATE MACHINE-------\\
                    case(ar_state)
                    
                        IDEL:
                            begin
                                if(r_trigger)
                                    begin
                                       ar_state<= START;
                                       
                                    end
                            end
                        START:
                            begin
                                if(arvalid && arready )
                                    begin
                                        ar_state <= IDEL;
                                        
                                    end
                            end
                        default : ar_state<=IDEL;
                    endcase
                    
                    
                    //----------B CHANNEL STATE STATE MACHINE-------\\
                    case(r_state)
                    
                        IDEL:
                            begin
                                if(rvalid)
                                    begin
                                       r_state<= START;
                                    end
                            end
                        START:
                            begin
                                if(rvalid && rready && rlast)
                                    begin
                                        r_state <= IDEL;
                                    end
                            end
                        default : r_state<=IDEL;
                    endcase
                end
        end
endmodule
