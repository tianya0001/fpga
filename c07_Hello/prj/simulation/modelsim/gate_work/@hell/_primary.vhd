library verilog;
use verilog.vl_types.all;
entity Hell is
    port(
        Clk             : in     vl_logic;
        Rst             : in     vl_logic;
        data            : in     vl_logic_vector(7 downto 0);
        led             : out    vl_logic
    );
end Hell;
