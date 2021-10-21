library verilog;
use verilog.vl_types.all;
entity counter_ipcore is
    port(
        clk             : in     vl_logic;
        q               : out    vl_logic_vector(3 downto 0);
        cin             : in     vl_logic;
        cout            : out    vl_logic
    );
end counter_ipcore;
