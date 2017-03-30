srcSourceCodeView
srcResizeWindow 216 72 804 500
wvCreateWindow
wvResizeWindow -win $_nWave2 50 214 960 332
wvResizeWindow -win $_nWave2 54 234 960 332
wvSetPosition -win $_nWave2 {("G1" 0)}
wvOpenFile -win $_nWave2 \
           {/usr2/xiaoshao/uvm_training_labs/lab222/lab2/unmanaged/qvmr/xiaoshao/simland/standalone/default/0.pcounter_test_qclk_change_clock_period/modelsim/sim.fsdb}
wvResizeWindow -win $_nWave2 -4 -2 1680 941
wvSetCursor -win $_nWave2 97.338165
wvSelectGroup -win $_nWave2 {G1}
wvGetSignalOpen -win $_nWave2
wvGetSignalSetScope -win $_nWave2 "/TbxSvManager"
wvGetSignalSetScope -win $_nWave2 "/tb_top/out_if"
wvGetSignalSetScope -win $_nWave2 "/tb_top/in_if"
wvGetSignalSetScope -win $_nWave2 "/tb_top/dut_if1"
wvGetSignalSetScope -win $_nWave2 "/tb_top/dut"
wvSetPosition -win $_nWave2 {("G1" 6)}
wvSetPosition -win $_nWave2 {("G1" 6)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"G1" \
{/tb_top/dut/clk} \
{/tb_top/dut/data_finish} \
{/tb_top/dut/data_in\[39:0\]} \
{/tb_top/dut/data_out\[39:0\]} \
{/tb_top/dut/data_rdy} \
{/tb_top/dut/rst} \
}
wvAddSignal -win $_nWave2 -group {"G2" \
}
wvSelectSignal -win $_nWave2 {( "G1" 1 2 3 4 5 6 )} 
wvSetPosition -win $_nWave2 {("G1" 6)}
wvSetPosition -win $_nWave2 {("G1" 6)}
wvSetPosition -win $_nWave2 {("G1" 6)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"G1" \
{/tb_top/dut/clk} \
{/tb_top/dut/data_finish} \
{/tb_top/dut/data_in\[39:0\]} \
{/tb_top/dut/data_out\[39:0\]} \
{/tb_top/dut/data_rdy} \
{/tb_top/dut/rst} \
}
wvAddSignal -win $_nWave2 -group {"G2" \
}
wvSelectSignal -win $_nWave2 {( "G1" 1 2 3 4 5 6 )} 
wvSetPosition -win $_nWave2 {("G1" 6)}
wvGetSignalClose -win $_nWave2
wvSetCursor -win $_nWave2 268.631584 -snap {("G2" 0)}
wvSetCursor -win $_nWave2 371.951423 -snap {("G2" 0)}
wvSetCursor -win $_nWave2 266.456429 -snap {("G1" 4)}
wvSetCursor -win $_nWave2 253.949291 -snap {("G1" 5)}
wvSetCursor -win $_nWave2 221.865761 -snap {("G1" 4)}
wvSetCursor -win $_nWave2 291.470706 -snap {("G1" 5)}
wvResizeWindow -win $_nWave2 -4 -2 1680 941
wvSetCursor -win $_nWave2 175.750563 -snap {("G2" 0)}
wvSetCursor -win $_nWave2 297.089187 -snap {("G2" 0)}
wvSetCursor -win $_nWave2 1024.794458 -snap {("G1" 3)}
wvZoom -win $_nWave2 1016.632667 1022.073861
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvSetCursor -win $_nWave2 1020.339770 -snap {("G1" 2)}
wvResizeWindow -win $_nWave2 -4 -2 1680 941
wvSetCursor -win $_nWave2 624.975906 -snap {("G2" 0)}
wvSetCursor -win $_nWave2 697.044431 -snap {("G2" 0)}
wvSetCursor -win $_nWave2 619.986763 -snap {("G1" 2)}
wvSetCursor -win $_nWave2 195.473533 -snap {("G1" 5)}
wvSetCursor -win $_nWave2 599.254721 -snap {("G1" 5)}
wvSetCursor -win $_nWave2 1000.074189 -snap {("G1" 5)}
wvSetCursor -win $_nWave2 1402.203420 -snap {("G1" 5)}
wvSetCursor -win $_nWave2 1394.305500 -snap {("G1" 5)}
wvSetCursor -win $_nWave2 1795.124967 -snap {("G1" 5)}
wvSetCursor -win $_nWave2 2150.531392 -snap {("G1" 5)}
wvSetCursor -win $_nWave2 1803.022888 -snap {("G1" 5)}
wvSetCursor -win $_nWave2 1791.176007 -snap {("G1" 6)}
wvSetCursor -win $_nWave2 601.229201 -snap {("G1" 5)}
wvSetCursor -win $_nWave2 595.305761 -snap {("G1" 5)}
wvSetCursor -win $_nWave2 993.163508 -snap {("G1" 5)}
wvSetCursor -win $_nWave2 1399.936226 -snap {("G1" 5)}
wvSetCursor -win $_nWave2 1797.457975 -snap {("G1" 5)}
wvTpfCloseForm -win $_nWave2
wvGetSignalClose -win $_nWave2
wvCloseWindow -win $_nWave2
