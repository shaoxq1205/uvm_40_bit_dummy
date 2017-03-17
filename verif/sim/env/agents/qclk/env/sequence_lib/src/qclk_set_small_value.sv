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

  
  req = qclk_item::type_id::create("req");
  start_item(req);
  if(!req.randomize()) begin
    `uvm_fatal(get_full_name(), "Sequence Item for Setting Small Value randomize failed");
  end
  finish_item(req);

endtask : body

`endif
