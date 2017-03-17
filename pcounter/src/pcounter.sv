// A simple counter with two interfaces
//  configuration - SRAM like interface
//  data_out - current count
//
`timescale 1ns/1ps

//Test added by Xiaoqiang
interface dut_if();
  logic clk, rst;
  logic [39:0] data_in;
  logic [39:0] data_out;

endinterface

module pcounter(
  input         clk,
  input         rst,
  input [39:0]  data_in,
  output [39:0] data_out
);

// pragma attribute pcounter partition_module_xrtl  

//  logic   cfg_enable_sig;
//  logic         cfg_rd_wr_sig;
//  logic [2:0]   cfg_addr_sig;
//  logic [9:0]   cfg_wdata_sig;
//  logic [9:0]   cfg_rdata_sig;
//  logic [9:0]   counter_o_sig;
//  logic [1:0]   curr_state_o_sig;
//  logic [39:0] data_in_sig;
// logic [39:0] data_out_sig;

  pcounter_int pcounter_i(
    .clk(clk), 
    .rst(rst),
    .data_in(data_in),
    .data_out(data_out)
 //   .cfg_enable(cfg_enable_sig),
 //   .cfg_rd_wr(cfg_rd_wr_sig),
 //   .cfg_addr(cfg_addr_sig),
 //   .cfg_wdata(cfg_wdata_sig),
 //   .cfg_rdata(cfg_rdata_sig),
 //   .counter_o(counter_o_sig),
 //   .curr_state_o(curr_state_o_sig)
  );
endmodule // pcounter

		

module pcounter_int (// Clocks / Reset
 
  input         clk,
  input         rst,
  // Configuration Interface - SRAM like
//  input         cfg_enable, 
//  input         cfg_rd_wr,   // rd = 1, wr = 0
//  input  [2:0]  cfg_addr,    // address
//  input  [9:0]  cfg_wdata,   // write data
//  output [9:0]  cfg_rdata,   // read data
  // Counter output
//  output  [9:0]  counter_o,
//  output  [1:0]  curr_state_o
  input [39:0]  data_in,
  output [39:0] data_out

);
// pragma attribute pcounter_int partition_module_xrtl  
   // Typedefs
//  typedef enum   logic[1:0] { CFG_COUNT_UP, CFG_COUNT_DOWN, CFG_SUSPEND } cfg_e;

   // Signal Declaration
//  logic [1:0]    csr_dir;  //count up or down
//  logic [9:0]    csr_min;  // min value
//  logic [9:0]    csr_max;  // max value
//  logic [9:0]    csr_step;  // step
//  reg [9:0]    count ;

//  reg [9:0]    tmpcount;  
  
//  logic [1:0]    curr_state;
//  logic [1:0]    next_state;
//  logic [9:0]    rdata;

  logic [39:0]  value;

  // Assign Local to Outputs
//  assign counter_o = count;
//  assign curr_state_o = curr_state;
//  assign cfg_rdata = rdata;
  assign data_out = value;
   

 
  always @(negedge clk) begin
    
    if(rst) begin
      value <= 0; 
    end
    else begin
       value <= data_in + 1;
    end 
   //   $display("(%t)---------------------------------Current value =  %d--------------------------------------", $time, value);
    end // else: !if(~rst)

endmodule