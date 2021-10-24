library verilog;
use verilog.vl_types.all;
entity key is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        key             : in     vl_logic;
        key_state       : out    vl_logic
    );
end key;
