//Test added by Xiaoqiang

`ifndef QCLK_IF__SV
`define QCLK_IF__SV
interface qclk_if(input logic clk, input logic rst);
  // logic [39:0] data_in;
  // logic [39:0] data_out;
  logic [39:0] data, mon_data;
  logic rdy, mon_rdy;

  // clocking block for driver.
  clocking bfm_cb @ (posedge clk);
    default input #1step output #1step;
    // <driver signals with direction>
    output rdy, data;   //can't be monitored because they are output of interface, being driven to the DUT.
  endclocking: bfm_cb

    // clocking block for monitor.
  clocking mon_cb @ (posedge clk);
    default input #1step output #1step;
    // <driver signals with direction>
    input mon_rdy, mon_data;
  endclocking: mon_cb
endinterface
`endif