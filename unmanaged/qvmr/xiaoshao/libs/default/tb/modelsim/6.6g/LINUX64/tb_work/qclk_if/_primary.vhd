library verilog;
use verilog.vl_types.all;
entity qclk_if is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic
    );
end qclk_if;
