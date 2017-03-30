// Code your design here
// Code your design here
`timescale 1ns / 1ps
interface dut_if();
  logic clk, rst;
  logic serialdata;
  logic [5:0] Sercnt, Descnt;
  logic serial_rdy;
  logic [39:0] intervalue; //Debug, inner value of serializer
endinterface

module serializer(
    input clk,
  	input rst,
    input data_rdy,
  	input [39:0] data_in,
    output reg data_out,
    output reg [5:0] Sercnt,
    output reg [39:0] intervalue,
    output reg serial_rdy
    );
  


  always @(rst) begin
    data_out <= 0;
    Sercnt <= 0;
    intervalue <= 0;
  end
  
  always @(posedge clk) begin 
    if (Sercnt == 39)   begin Sercnt <=0; end  
    else  begin Sercnt <= Sercnt + 1;  end

    data_out <= intervalue[Sercnt];
    if(data_rdy)   begin intervalue <= data_in; Sercnt <=0; serial_rdy <= 1; end//High possibility for timing bug, serial_rdy here, check.
    else serial_rdy <= 0;
  end

    // always @(posedge clk) begin
    //   data_out <= intervalue[Sercnt];
    // end
    // always @(posedge data_rdy) begin
    //   intervalue <= data_in;
    // end


endmodule

module deserializer(
    input clk,
  	input rst,
  	input  data_in,
    input serial_rdy,
  	output reg [39:0] data_out,
    output reg [5:0] Descnt,
    output reg data_finish
);
  
  always @(rst) begin
    data_out <= 0;
    Descnt <= 0;
    data_finish <=0;
  end
  
  always @(posedge clk) begin 
    if (Descnt == 39)   begin Descnt <=0; data_finish <=1; end  //Data after Descnt > 39 will be invalid.
    else begin Descnt <= Descnt + 1; data_finish <=0; end

    if (serial_rdy) Descnt <= 0; //High possibility for bug here, check.
  end

    always @(posedge clk) begin
      data_out[Descnt] <= data_in;
    end
endmodule

module serdes(
  input clk,
  input rst,
  input [39:0] data_in,
  output [39:0] data_out, 
  output [5:0] Sercnt,
  output [5:0] Descnt,
  output reg serialdata,
  input data_rdy,
  output data_finish,
  output [39:0] intervalue,
  output serial_rdy
);
serializer ser(
  .clk     (clk),
  .rst     (rst),
  .data_in (data_in),
  .data_out(serialdata),
  .Sercnt  (Sercnt),
  .data_rdy(data_rdy),
  .intervalue(intervalue),
  .serial_rdy(serial_rdy)
);
deserializer des(
  .clk     (clk),
  .rst     (rst),
  .data_in (serialdata),
  .data_out(data_out),
  .Descnt  (Descnt),
  .data_finish(data_finish),
  .serial_rdy (serial_rdy)
);

endmodule // module