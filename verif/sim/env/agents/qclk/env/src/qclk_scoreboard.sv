`ifndef QCLK_SCOREBOARD__SV
`define QCLK_SCOREBOARD__SV

`uvm_analysis_imp_decl( _drv )
`uvm_analysis_imp_decl( _mon )

`include "uvm_macros.svh"
`include "qclk_item.sv"
// `include "qclk_proxy.sv"

//1. Derive your class from the uvm_scoreboard
class qclk_scoreboard extends uvm_scoreboard;
//2. Register your scoreboard class with the factory
  `uvm_component_utils (qclk_scoreboard)             ///< register qclk_monitor with factory

//3. Declare anaylsis exports and uvm_analysis fifos
  uvm_analysis_export #(qclk_item) scb_in_aport;
  uvm_analysis_export #(qclk_item) scb_out_aport;  

  uvm_tlm_analysis_fifo #(qclk_item) in_fifo;
  uvm_tlm_analysis_fifo #(qclk_item) out_fifo;

int VECT_CNT, PASS_CNT, ERROR_CNT;


//4. build_phase, connect_phase, run_phase
  function new(string name, uvm_component parent);
    super.new(name, parent);
    VECT_CNT = 0;
    PASS_CNT = 0;
    ERROR_CNT = 0;
  endfunction: new

  extern function void build_phase(uvm_phase phase);
  extern function void connect_phase(uvm_phase phase);
  // virtual extern function void write_in(qclk_item tr);
  // virtual extern function void write_out(qclk_item tr);
  extern task run_phase(uvm_phase phase);
  extern function void report_phase(uvm_phase phase);
  extern function void PASS();
  extern function void ERROR();
  extern function bit compare_qclk_value(qclk_item itm1, qclk_item itm2);


endclass: qclk_scoreboard

function void qclk_scoreboard::build_phase(uvm_phase phase);
    super.build_phase(phase);
    scb_in_aport = new("scb_in_aport", this);
    scb_out_aport = new("scb_out_aport", this);
    in_fifo = new("in_fifo", this);
    out_fifo = new("out_fifo", this);
endfunction: build_phase

function void qclk_scoreboard::connect_phase(uvm_phase phase);
    scb_in_aport.connect(in_fifo.analysis_export);  
    scb_out_aport.connect(out_fifo.analysis_export);  
endfunction: connect_phase

//Temporary run_phase for debugging, reporting if fifo is popping sequence items.
task qclk_scoreboard::run_phase(uvm_phase phase);
    qclk_item exp_tr, out_tr;
    // forever begin
    //   fork     //Block the get
    //     begin
    //       in_fifo.get(exp_tr);
    //       //Adding objections, not sure why
    //       phase.raise_objection(this);
    //       `uvm_info("scoreboard run task", "WAITING for expected output (data_in)", UVM_LOW);
    //       phase.drop_objection(this);
    //     end
    //     begin
    //       out_fifo.get(out_tr);
    //       //Adding objections
    //       phase.raise_objection(this);
    //       `uvm_info("scoreboard run task", "WAITING for actual output (data_out)", UVM_LOW);
    //       phase.drop_objection(this);
    //     end
    //   join
    //     begin
    //     `uvm_info("Printing both sequences ", $sformatf("Actual=%h Expected=%h \n", out_tr.value, exp_tr.value), UVM_LOW);
    //     end
      forever begin
        `uvm_info(get_type_name(), "Start getting from out fifo", UVM_LOW);
        out_fifo.get(out_tr);
        `uvm_info(get_type_name(), $sformatf("Actual=%h ", out_tr.value), UVM_LOW);
        `uvm_info(get_type_name(), "Start getting from in fifo", UVM_LOW);
        in_fifo.get(exp_tr);
        `uvm_info(get_type_name(), $sformatf("Expected=%h ", exp_tr.value), UVM_LOW);
        
       `uvm_info("Printing both sequences ", $sformatf("Actual=%h Expected=%h \n", out_tr.value, exp_tr.value), UVM_LOW);
      if (compare_qclk_value(out_tr, exp_tr)) begin
        PASS();
       end
      else begin
        ERROR();
      `uvm_error(get_type_name(), "VERIFICATION COMPARE ERROR! ");
    end

    end
endtask : run_phase

// virtual function void qclk_scoreboard::write_in (qclk_item tr);
//     // //why static?
//     // logic [39:0] data_in, data_out;
//     // logic data_rdy, data_finish;
//     // // logic [15:0] next_dout;
//     // // logic [15:0] dout;
//     // //---------------------------------------------------
//     `uvm_info("write_drv STIM", tr.convert2string(), UVM_HIGH)
//     // // dout = next_dout;
//     // // if (!tr.rst_n) {next_dout,dout} = '0;
//     // // else if ( tr.ld) next_dout = tr.din;
//     // // else if ( tr.inc) next_dout++;
//     // // tr.dout = dout;
//     // if (tr.data_rdy) begin data_out = data_in; data_finish = 1; end //should wait for 41 cycles
//     // else data_out = 0;

//     void'(in_fifo.try_put(tr));   //what does this stand for
// end
// virtual function void qclk_scoreboard::write_out (qclk_item tr);
//     `uvm_info("write_mon OUT ", tr.convert2string(), UVM_HIGH)
//     void'(out_fifo.try_put(tr));    //what does this stand for
// end
// endclass : qclk_scoreboard

// task qclk_scoreboard::run_phase(uvm_phase phase);
//     qclk_item exp_tr, out_tr;
//     forever begin
//       fork     //Block the get
//         begin
//           in_fifo.get(exp_tr);
//           //Adding objections, not sure why
//           phase.raise_objection(this);
//           `uvm_info("scoreboard run task", "WAITING for expected output", UVM_DEBUG)
//           phase.drop_objection(this);
//         end
//         begin
//           out_fifo.get(out_tr);
//           //Adding objections
//           phase.raise_objection(this);
//           `uvm_info("scoreboard run task", "WAITING for actual output", UVM_DEBUG)
//           phase.drop_objection(this);
//         end
//       join

//       if (out_tr.compare(exp_tr)) begin
//       PASS();
//       `uvm_info ("PASS ", $sformatf("Actual=%s Expected=%s \n", out_tr.output2string(), exp_tr.convert2string()), UVM_DEBUG)
//       end
//       else begin
//       ERROR();
//       `uvm_error("ERROR", $sformatf("Actual=%s Expected=%s \n", out_tr.output2string(),  exp_tr.convert2string()), UVM_DEBUG)
//     end
// end


function void qclk_scoreboard::report_phase(uvm_phase phase);
    super.report_phase(phase);
    if (VECT_CNT && !ERROR_CNT) begin
    `uvm_info("PASSED",
    $sformatf("\n\n\n*** TEST PASSED - %0d vectors ran, %0d vectors passed ***\n",
    VECT_CNT, PASS_CNT), UVM_LOW);
    end
    else begin
    `uvm_info("FAILED",
    $sformatf("\n\n\n*** TEST FAILED - %0d vectors ran, %0d vectors passed, %0d vectors failed ***\n",
    VECT_CNT, PASS_CNT, ERROR_CNT), UVM_LOW);
    end
endfunction
function void qclk_scoreboard:: PASS();
    VECT_CNT++;
    PASS_CNT++;
endfunction
function void qclk_scoreboard:: ERROR();
    VECT_CNT++;
    ERROR_CNT++;
endfunction

function bit qclk_scoreboard::compare_qclk_value(qclk_item itm1, qclk_item itm2);
  return ( itm1.value == itm2.value);
endfunction: compare_qclk_value

`endif