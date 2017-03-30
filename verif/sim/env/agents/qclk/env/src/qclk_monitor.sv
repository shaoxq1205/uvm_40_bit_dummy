`ifndef QCLK_MONITOR__SV
`define QCLK_MONITOR__SV

`include "uvm_macros.svh"
`include "qclk_item.sv"


class qclk_monitor extends uvm_monitor;
  `uvm_component_utils (qclk_monitor)             ///< register qclk_monitor with factory

//Added by Xiaoqiang
  virtual qclk_if dut_vif;
  //int flag; //deciding which monitor to use, in or out.

  // analysis port, for connecting this driver to other "static" parts of
  // the enviornment like scoreboards or coverage 
  uvm_analysis_port #(qclk_item) mon_analysis_port;      ///< analysis port to connect to agent

  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction: new

  extern function void build_phase (uvm_phase phase);

  extern function void connect_phase(uvm_phase phase);

  extern task run_phase (uvm_phase phase);

endclass: qclk_monitor

//-----------------------------------------------------------------------------
// build
//-----------------------------------------------------------------------------
function void qclk_monitor::build_phase (uvm_phase phase);
super.build_phase(phase);
  mon_analysis_port = new( "mon_analysis_port", this );
endfunction: build_phase

//-----------------------------------------------------------------------------
// connect
//-----------------------------------------------------------------------------
function void qclk_monitor::connect_phase (uvm_phase phase);

  /// During the connect phase,  an handle to the proxy class is obtained
  /// from the global config space. The env class has actually built
  /// the proxy class and has updated the global config space.

   
  /// The object is stored in uvm_config_db database

  //Added by Xiaoqiang
  `uvm_info(get_type_name(), "Getting virtual interface config space ", UVM_HIGH );
  if(!uvm_config_db#(virtual qclk_if)::get(this, "*", "qclk_if", dut_vif)) begin
    `uvm_fatal( get_type_name(), "uvm_config_db get failed." );
  end

endfunction: connect_phase

//-----------------------------------------------------------------------------
// run
//-----------------------------------------------------------------------------
task qclk_monitor::run_phase (uvm_phase phase);
    qclk_item tx;  //Don't put these in forever loop later after debugging.
  forever begin
    tx = qclk_item::type_id::create("tx");
    @(posedge dut_vif.clk)
    // ##1;
    // @(posedge dut_vif.mon_cb.mon_rdy);
   if( dut_vif.mon_cb.mon_rdy === 1) begin
    tx.value = dut_vif.mon_cb.mon_data;
    mon_analysis_port.write(tx); //send tx through analysis port
    `uvm_info(get_type_name(), $sformatf("===Debug===Writing values from monitor to analysis port, current value is:%h \n", tx.value), UVM_LOW );
   end
  end
endtask: run_phase

`endif


