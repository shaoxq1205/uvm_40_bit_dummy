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
 * @brief Test gpio_by_sigloc Virtual Sequence
 *
 * The Test gpio_by_sigloc virtual sequence 
 * (pcounter_test_qclk_change_clock_period_vseq.sv) 
 * contains the virtual sequence implementation for this test.
 *
 * @file pcounter_test_qclk_change_clock_period_vseq.sv
 *
 * @author Loganath Ramachandran
 * @par Contact:
 * c_lramac@qualcomm.com
 * @par Location:
 * QC-SD
 *
 * $Revision: 1.3 $
 * $Date: Mon Nov 15 12:05:26 2010 $
 * $Author: mironm $
 */

`ifndef PCOUNTER_TEST_QCLK_CHANGE_CLOCK_PERIOD_VSEQ__SV
`define PCOUNTER_TEST_QCLK_CHANGE_CLOCK_PERIOD_VSEQ__SV

`include "uvm_macros.svh"

import uvm_pkg::*;
import qclk_pkg::*;


/**
 * @brief Test Gpio_by_sigloc Virtual Sequence
 *
 * Test Gpio_by_sigloc Virtual Sequence - toplevel virtual sequence 
 * testcase. In this testcase we fire off three sequences in paralalle
 * waiting for different GPIO conditiona. The signals are identified by
 * name. 
 * 
 * Testplan reference: GPIO_UVC_1, GPIO_UVC_2, GPIO_UVC_3
 *
 * @class pcounter_test_qclk_change_clock_period_vseq
 *
 */
class pcounter_test_qclk_change_clock_period_vseq extends uvm_sequence  #(qclk_item);
  `uvm_object_utils(pcounter_test_qclk_change_clock_period_vseq) // Register this sequence with the factory
  `uvm_declare_p_sequencer(pcounter_virtual_sequencer) // Set the handle of the virtual sequencer

  /**
   * @brief Constructor
   * Constructor to create this sequence.
   *
   * @param name string - Name of this instantiated class
   */
  function new(string name = "pcounter_test_qclk_change_clock_period_vseq");
    super.new(name);
  endfunction : new

  /**
   * @brief Body
   * Virtual Sequence Body - toplevel example sequence
   *
   */
  extern virtual task body();

endclass : pcounter_test_qclk_change_clock_period_vseq

//-----------------------------------------------------------------------------
// body 
//-----------------------------------------------------------------------------


task pcounter_test_qclk_change_clock_period_vseq::body();
$display("=============================================================");
  begin: set_small_value
      qclk_set_small_value_seq    set_small_value_h;
    `uvm_info (get_name(), "===================================Set Small Values==================================", UVM_LOW);
    
    `uvm_info (get_full_name(), "Start Advance Clock Seq for  QCLK", UVM_LOW);
    // `uvm_do_on_with(set_small_value_h, p_sequencer.m_qclk_sequencer_h, { m_num_clks == 100; })
    `uvm_do_on(set_small_value_h, p_sequencer.m_qclk_sequencer_h)
    `uvm_info(get_full_name(), "Done Advance Clock seq for QCLK", UVM_LOW);
  end:  set_small_value
// $display("=============================================================");
//     //advance clock by 100 cycles    
//   begin: advance_clock_by_100
  
//     qclk_advance_clk_seq    clk_advance_seq_h;
//     `uvm_info (get_name(), "===================================Advance Clock by 100 cycles==================================", UVM_HIGH);
    
//     `uvm_info (get_full_name(), "Start Advance Clock Seq for  QCLK", UVM_LOW);
//     `uvm_do_on_with(clk_advance_seq_h, p_sequencer.m_qclk_sequencer_h, { m_num_clks == 100; })
//     `uvm_info(get_full_name(), "Done Advance Clock seq for QCLK", UVM_LOW);
//   end:  advance_clock_by_100
// $display("=============================================================");
//     //Change clock period 100+50
//   begin: change_clock_period
  
//     qclk_period_seq    clk_period_seq_h;
//     `uvm_info (get_name(), "====================================Create Set Clock Period Seq for QCLK===============================", UVM_HIGH);
    
//     `uvm_info (get_full_name(), "Start Set Clock Period Seq for  QCLK", UVM_LOW);
//     `uvm_do_on(clk_period_seq_h, p_sequencer.m_qclk_sequencer_h)
//     `uvm_info(get_full_name(), "Done Set Clock Period  Seq for QCLK", UVM_LOW);
//   end:  change_clock_period
// $display("=============================================================");
//     //advance clock by 30 cycles        
//   begin: advance_clock_by_30
  
//     qclk_advance_clk_seq    clk_advance_seq_h;
//     `uvm_info (get_name(), "===========================================Advance Clock by 30 cycles====================================", UVM_HIGH);

//     `uvm_info (get_full_name(), "Start Advance Clock Seq for  QCLK", UVM_LOW);
//     `uvm_do_on_with(clk_advance_seq_h, p_sequencer.m_qclk_sequencer_h, { m_num_clks == 30; })
//     `uvm_info(get_full_name(), "Done Advance Clock seq for QCLK", UVM_LOW);
//   end:  advance_clock_by_30 
//  $display("=============================================================");
//     //Change clock period 50+50
//   begin: change_clock_period_2
 
//     qclk_period_seq    clk_period_seq_h;
//     `uvm_info (get_name(), "==========================================Create Set Clock Period Seq for QCLK==============================", UVM_HIGH);
    
//     `uvm_info (get_full_name(), "Start Set Clock Period Seq for  QCLK", UVM_LOW);
//     `uvm_do_on(clk_period_seq_h, p_sequencer.m_qclk_sequencer_h)
//     `uvm_info(get_full_name(), "Done Set Clock Period  Seq for QCLK", UVM_LOW);
//   end:  change_clock_period_2
//   $display("=============================================================");
//         //advance clock by 40 cycles        
//   begin: advance_clock_by_40

//     qclk_advance_clk_seq    clk_advance_seq_h;
//     `uvm_info (get_name(), "=============================================Advance Clock by 40 cycles=====================================", UVM_HIGH);
    
//     `uvm_info (get_full_name(), "Start Advance Clock Seq for  QCLK", UVM_LOW);
//     `uvm_do_on_with(clk_advance_seq_h, p_sequencer.m_qclk_sequencer_h, { m_num_clks == 40; })
//     `uvm_info(get_full_name(), "Done Advance Clock seq for QCLK", UVM_LOW);
//   end:  advance_clock_by_40 

       
endtask : body
// task pcounter_test_qclk_change_clock_period_vseq::body();

// repeat(8) begin
//   $display("===================================================================================================");
//   req = qclk_item::type_id::create("req");
//   start_item(req);
//   if(!req.randomize()) begin
//     `uvm_fatal(get_full_name(), "Sequence Item for Setting Small Value randomize failed");
//   end
//   finish_item(req);
  
// end//repeat
// endtask : body

`endif
