`ifndef QCLK_ITEM__SV
`define QCLK_ITEM__SV

`include "uvm_macros.svh"

import uvm_pkg::*;

typedef  enum bit[1:0] { 
  QCLK_TYPE_ADJUST_CLK_PERIOD   = 2'b00,     ///< Set Clock Period
  QCLK_TYPE_ADVANCE_CLK         = 2'b11      ///< Advance_clock for N cycles

}  QCLK_TYPE_e;  
// logic [39:0] value;
// logic rdy;             

class qclk_item extends uvm_sequence_item;
  rand bit [39:0] value;
  logic rdy;
  // logic data_rdy;

  // //Added for analysis port
  // logic [39:0] data_in;
  // logic [39:0] data_out;
  // logic data_finish;

   constraint value_small;
     `uvm_object_utils_begin (qclk_item) ///< register qclk_item with the factory
     `uvm_field_int  (value, UVM_DEFAULT)
     `uvm_field_int  (rdy, UVM_DEFAULT)
   `uvm_object_utils_end

  function new (string name = "qclk_item");
    super.new(name);
  endfunction : new
  extern function void do_copy(uvm_object rhs);
endclass: qclk_item

constraint qclk_item::value_small{
//    value > 0;
//    value < 10000;
}

function void qclk_item::do_copy(uvm_object rhs);

  qclk_item rhs_;
  super.do_copy(rhs);

  // check if rhs is present and compatible.
  if (rhs == null) begin
    `uvm_fatal(get_type_name(), "Compare Failed - rhs is null");
  end
  if(!$cast(rhs_, rhs)) begin
    `uvm_fatal( get_type_name(), "Cast failed for rhs" );
  end
  value = rhs_.value;
  rdy   = rhs_.rdy; 
   
endfunction: do_copy


`endif

