//-----------------------------------------------------------------------------
// Qualcomm Proprietary
// Copyright (c) Qualcomm Inc.
// All rights reserved.
//
//
// All data and information contained in or disclosed by this document
// are confidential and proprietary information of QUALCOMM Incorporated,
// and all rights therein are expressly reserved. By accepting this
// material, the recipient agrees that this material and the information
// contained therein are held in confidence and in trust and will not be
// used, copied, reproduced in whole or in part, nor its contents
// revealed in any manner to others without the express written
// permission of QUALCOMM Incorporated.
//
// This technology was exported from the United States in accordance with
// the Export Administration Regulations. Diversion contrary to U.S. law
// prohibited.
//-----------------------------------------------------------------------------

`include "uvm_macros.svh"


`timescale 1ns / 1ps

/**
 * @brief Testbench Top
 * This is module is the top level testbench for the transform DUT.
 * It instantiates all UVC interfaces and the
 * transform DUT.
 *
*/
module tb_top;

  import uvm_pkg::*;
  import quvm_addons_pkg::*;
  import pcounter_test_pkg::*;
  import pcounter_pkg::*;

  pcounter_env env_h;
  dut_if dut_if1();
  // Input interface
  qclk_if in_if(
    .clk(dut_if1.clk),
    .rst(dut_if1.rst)
  );
  assign in_if.mon_rdy = in_if.rdy;
  assign in_if.mon_data = in_if.data;


  // assign in_if.mon_rdy = in_if.rdy;
  // assign in_if.mon_data = in_if.data;


  // Output interface
  qclk_if out_if(
    .clk(dut_if1.clk),
    .rst(dut_if1.rst)
  );
  
//Test added by Xiaoqiang 
  serdes dut(
      .clk(dut_if1.clk),
      .rst(dut_if1.rst),
      .data_in(in_if.mon_data),
      .data_out(out_if.mon_data),
      .Sercnt    (dut_if1.Sercnt),
      .Descnt    (dut_if1.Descnt),
      .serialdata(dut_if1.serialdata),
      .data_rdy   (in_if.mon_rdy),
      .data_finish(out_if.mon_rdy),
      .intervalue (dut_if1.intervalue),
      .serial_rdy (dut_if1.serial_rdy)
      );
initial begin
  dut_if1.rst = 0;
  #1 dut_if1.rst = 1;
  #10 dut_if1.rst = 0;
  #10;
  
end

initial begin
  dut_if1.clk = 0;
  forever #5 dut_if1.clk = ~dut_if1.clk;
end

  initial begin
    $timeformat(-9, 0, " ns", 5); // show time in ns

//Test added by Xiaoqiang
// Place the interface into the UVM configuration database
   uvm_config_db#(virtual qclk_if)::set(uvm_root::get(), "*.m_agent.*", "qclk_if", in_if); //
   uvm_config_db#(virtual qclk_if)::set(uvm_root::get(), "*.m_agent2.*", "qclk_if", out_if);
    // Create the env and Run the test

    //env_h = pcounter_env::type_id::create("env_h", null);
    run_test();

  end

endmodule: tb_top






