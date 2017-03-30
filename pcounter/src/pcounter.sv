`timescale 1ns/1ps

module pcounter(
  input         clk,
  input         rst,
  input [39:0]  data_in,
  output [39:0] data_out
);

  pcounter_int pcounter_i(
    .clk(clk), 
    .rst(rst),
    .data_in(data_in),
    .data_out(data_out)
  );
endmodule // pcounter

module pcounter_int (
  input         clk,
  input         rst,
  input [39:0]  data_in,
  output [39:0] data_out

);

  logic [39:0]  value;

  assign data_out = value;
 
  always @(negedge clk) begin
    
    if(rst) begin
      value <= 0; 
    end
    else begin
       value <= data_in + 1;
    end 
  end

endmodule