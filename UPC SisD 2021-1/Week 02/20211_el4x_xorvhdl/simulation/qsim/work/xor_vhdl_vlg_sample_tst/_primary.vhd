library verilog;
use verilog.vl_types.all;
entity xor_vhdl_vlg_sample_tst is
    port(
        IN_A            : in     vl_logic;
        IN_B            : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end xor_vhdl_vlg_sample_tst;
