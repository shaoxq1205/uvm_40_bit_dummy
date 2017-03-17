library verilog;
use verilog.vl_types.all;
entity pcounter_int is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        data_in         : in     vl_logic_vector(39 downto 0);
        data_out        : out    vl_logic_vector(39 downto 0)
    );
end pcounter_int;
