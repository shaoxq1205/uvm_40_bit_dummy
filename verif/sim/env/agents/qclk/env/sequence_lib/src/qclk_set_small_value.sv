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

/**
 * @brief QCLK Advance Clk Sequence
 *
 * The QCLK advance clk file contains a sequence that makes the
 * thread wait for n clock cycles
 *
 * @file qclk_advance_clk_seq.sv
 *
 * @author Loganath Ramachandran
 * @par Contact:
 * c_lramac@qualcomm.com
 * @par Location:
 * QC-SD
 *
 * $Revision: 1.1 $
 * $Date: Mon Nov 15 11:27:28 2010 $
 * $Author: mironm $
 */

`ifndef QCLK_SET_SMALL_VALUE_SEQ__SV
`define QCLK_SET_SMALL_VALUE_SEQ__SV

`include "uvm_macros.svh"

import uvm_pkg::*;

/**
 * @brief advance clock
 * The qclk advance clk seque class is a sequence that initiates a 
 * advance clock by n cycles.  The thread that initiates this sequence
 * is essentially suspended till the required clock ticks are completed
 *
 * Usage Notes:<br>
 *
 * @class qclk_advance_clk_seq
 *
 */
class qclk_set_small_value_seq extends uvm_sequence #(qclk_item);
  `uvm_object_utils(qclk_set_small_value_seq)  // Register with Factory

  rand int m_num_clks;

  function new(string name = "qclk_advance_clk_seq");
    super.new(name);
  endfunction: new

  extern task body();

endclass : qclk_set_small_value_seq


//-----------------------------------------------------------------------------
// body
//-----------------------------------------------------------------------------
task qclk_set_small_value_seq::body();
  int counter1 = 0;
  int counter2 = 0;
  int temp_value =0;



  //Added by Xiaoqiang
  //From my observation, the driver starts run_phase no matter whether we have reset in tb_top or not. 
  //So manually I added this wait to avoid the reset process.
 #50;

  
repeat(210) begin
  req = qclk_item::type_id::create("req");
  start_item(req);
  // if(!req.randomize()) begin
  //   `uvm_fatal(get_full_name(), "Sequence Item for Setting Small Value randomize failed");
  // end
  //added for test, mandatory overwriting data_in value.
  if ((counter1%40 == 15)&&(counter1 < 175)) begin
      // if (counter1 == 0) $display("============================counter1 = 0  is possible");//yes, possible
      if(!req.randomize()) begin
      `uvm_fatal(get_full_name(), "Sequence Item for Setting Small Value randomize failed");
      end
      temp_value = req.value;
      req.rdy = 1;
  end
  else begin
    req.rdy = 0;
    req.value = temp_value;
  end
  finish_item(req);
  `uvm_info(get_full_name(), $psprintf("===========Sending req rdy=%0d, data=%x", req.rdy, req.value) , UVM_LOW);
  counter1 = counter1 + 1;
end
repeat(210) begin
  req = qclk_item::type_id::create("req");
  start_item(req);
  // if(!req.randomize()) begin
  //   `uvm_fatal(get_full_name(), "Sequence Item for Setting Small Value randomize failed");
  // end
  //added for test, mandatory overwriting data_in value.
  if (counter2 == 0) begin
      if(!req.randomize()) begin
      `uvm_fatal(get_full_name(), "Sequence Item for Setting Small Value randomize failed");
      end
      req.value = 40'h3333333333;
      temp_value = req.value;
      req.rdy = 1;
  end
  else if (counter2 == 40) begin
      if(!req.randomize()) begin
      `uvm_fatal(get_full_name(), "Sequence Item for Setting Small Value randomize failed");
      end
      req.value = 40'h5555555555;
      temp_value = req.value;
      req.rdy = 1;
  end
  else if (counter2 == 80) begin
      if(!req.randomize()) begin
      `uvm_fatal(get_full_name(), "Sequence Item for Setting Small Value randomize failed");
      end
      req.value = 40'h7777777777;
      temp_value = req.value;
      req.rdy = 1;
  end
  else if (counter2 == 120) begin
      if(!req.randomize()) begin
      `uvm_fatal(get_full_name(), "Sequence Item for Setting Small Value randomize failed");
      end
      //req.value = 40'h5555555555;
      req.value = 40'h9999999999;
      temp_value = req.value;
      req.rdy = 1;
  end
  else if (counter2 == 160) begin
      if(!req.randomize()) begin
      `uvm_fatal(get_full_name(), "Sequence Item for Setting Small Value randomize failed");
      end
      req.value = 40'haaaaaaaaaa;
      temp_value = req.value;
      req.rdy = 1;
  end
  else begin
    req.rdy = 0;
    req.value = temp_value;
  end
  finish_item(req);
  counter2 = counter2 + 1;
end

endtask : body

`endif
