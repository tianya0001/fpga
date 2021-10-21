library verilog;
use verilog.vl_types.all;
entity led_test is
    port(
        a               : in     vl_logic;
        b               : in     vl_logic;
        key_in          : in     vl_logic;
        led_out         : out    vl_logic
    );
end led_test;
