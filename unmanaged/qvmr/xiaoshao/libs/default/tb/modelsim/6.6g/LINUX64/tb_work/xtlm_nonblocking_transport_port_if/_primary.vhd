library verilog;
use verilog.vl_types.all;
entity xtlm_nonblocking_transport_port_if is
    generic(
        NUM_BYTES       : integer := 4;
        NUM_RSP_BYTES   : integer := 4
    );
end xtlm_nonblocking_transport_port_if;
