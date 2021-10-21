library verilog;
use verilog.vl_types.all;
entity mux_3to8 is
    port(
        a               : in     vl_logic;
        b               : in     vl_logic;
        c               : in     vl_logic;
        \out\           : out    vl_logic_vector(7 downto 0)
    );
end mux_3to8;
