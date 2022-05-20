onerror {resume}
radix define STATES {
    "2'b00" "START",
    "2'b01" "IDLE_W",
    "2'b10" "SHIFT",
    "2'b11" "LOAD",
    -default default
}
radix define WR_LEDS {
    "3'b001" "START",
    "3'b010" "IDLE_W",
    "3'b011" "SHIFT",
    "3'b100" "LOAD",
    "3'b111" "ERROR",
    -default default
}
quietly WaveActivateNextPane {} 0
add wave -noupdate -divider System
add wave -noupdate /TB_WR_CONTROL/rst
add wave -noupdate /TB_WR_CONTROL/clk
add wave -noupdate -label {Cycle counter} /TB_WR_CONTROL/i
add wave -noupdate -divider Inputs
add wave -noupdate /TB_WR_CONTROL/start_wr
add wave -noupdate /TB_WR_CONTROL/rxrdy
add wave -noupdate -divider Outputs
add wave -noupdate /TB_WR_CONTROL/shift_rxregs
add wave -noupdate /TB_WR_CONTROL/done_wr
add wave -noupdate /TB_WR_CONTROL/load_confregs
add wave -noupdate -radix WR_LEDS /TB_WR_CONTROL/wr_leds
add wave -noupdate -divider UUT
add wave -noupdate -expand -group UUT -divider System
add wave -noupdate -expand -group UUT /TB_WR_CONTROL/UUT/rst
add wave -noupdate -expand -group UUT /TB_WR_CONTROL/UUT/clk
add wave -noupdate -expand -group UUT /TB_WR_CONTROL/n_bytes
add wave -noupdate -expand -group UUT -radix unsigned /TB_WR_CONTROL/UUT/count
add wave -noupdate -expand -group UUT -divider Inputs
add wave -noupdate -expand -group UUT /TB_WR_CONTROL/UUT/start_wr
add wave -noupdate -expand -group UUT /TB_WR_CONTROL/UUT/rxrdy
add wave -noupdate -expand -group UUT -divider Outputs
add wave -noupdate -expand -group UUT /TB_WR_CONTROL/UUT/shift_rxregs
add wave -noupdate -expand -group UUT /TB_WR_CONTROL/UUT/load_confregs
add wave -noupdate -expand -group UUT /TB_WR_CONTROL/UUT/done_wr
add wave -noupdate -expand -group UUT /TB_WR_CONTROL/UUT/wr_leds
add wave -noupdate -expand -group UUT -divider States
add wave -noupdate -expand -group UUT -radix STATES -childformat {{{/TB_WR_CONTROL/UUT/state[1]} -radix unsigned} {{/TB_WR_CONTROL/UUT/state[0]} -radix unsigned}} -subitemconfig {{/TB_WR_CONTROL/UUT/state[1]} {-height 15 -radix unsigned} {/TB_WR_CONTROL/UUT/state[0]} {-height 15 -radix unsigned}} /TB_WR_CONTROL/UUT/state
add wave -noupdate -expand -group UUT -radix STATES -childformat {{{/TB_WR_CONTROL/UUT/next_state[1]} -radix unsigned} {{/TB_WR_CONTROL/UUT/next_state[0]} -radix unsigned}} -subitemconfig {{/TB_WR_CONTROL/UUT/next_state[1]} {-height 15 -radix unsigned} {/TB_WR_CONTROL/UUT/next_state[0]} {-height 15 -radix unsigned}} /TB_WR_CONTROL/UUT/next_state
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {1220000 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 249
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {0 ps} {1480500 ps}
