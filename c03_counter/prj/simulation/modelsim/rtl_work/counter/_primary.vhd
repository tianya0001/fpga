library verilog;
use verilog.vl_types.all;
entity counter is
    port(
        clk50M          : in     vl_logic;
        RSTn            : in     vl_logic;
        led             : out    vl_logic
    );
end counter;
