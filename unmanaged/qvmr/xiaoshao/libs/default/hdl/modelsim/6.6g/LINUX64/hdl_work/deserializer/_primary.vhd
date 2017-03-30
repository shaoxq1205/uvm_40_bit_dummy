library verilog;
use verilog.vl_types.all;
entity deserializer is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        data_in         : in     vl_logic;
        serial_rdy      : in     vl_logic;
        data_out        : out    vl_logic_vector(39 downto 0);
        Descnt          : out    vl_logic_vector(5 downto 0);
        data_finish     : out    vl_logic
    );
end deserializer;
