`ifndef QCLK_PREDICTOR__SV
`define QCLK_PREDICTOR__SV

`include "uvm_macros.svh"
`include "qclk_item.sv"
// `include "qclk_proxy.sv"


class qclk_predictor extends uvm_subscriber #(qclk_item);
  `uvm_component_utils (qclk_predictor)             ///Has built in analysis_export

  uvm_analysis_port #(qclk_item) results_ap;

  // logic data_rdy;
  // logic [39:0] data_in;
  // logic [39:0] data_out;
  // logic data_finish;

  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction: new

  extern function void build_phase (uvm_phase phase);

  // extern function void connect_phase(uvm_phase phase);

  // extern task run_phase (uvm_phase phase);

  extern function void write(qclk_item t);

function void qclk_predictor::build_phase (uvm_phase phase);
  results_ap = new("results_ap", this);
end

function void qclk_predictor::write (qclk_item t);
  // qclk_item out_txn;
  // calculate_result(t, out_txn);
  // results_ap.write(out_txn);
end
endclass : qclk_predictor
`endif


