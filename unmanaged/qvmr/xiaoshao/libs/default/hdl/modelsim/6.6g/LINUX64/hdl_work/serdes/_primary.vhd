library verilog;
use verilog.vl_types.all;
entity serdes is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        data_in         : in     vl_logic_vector(39 downto 0);
        data_out        : out    vl_logic_vector(39 downto 0);
        Sercnt          : out    vl_logic_vector(5 downto 0);
        Descnt          : out    vl_logic_vector(5 downto 0);
        serialdata      : out    vl_logic;
        data_rdy        : in     vl_logic;
        data_finish     : out    vl_logic;
        intervalue      : out    vl_logic_vector(39 downto 0);
        serial_rdy      : out    vl_logic
    );
end serdes;
