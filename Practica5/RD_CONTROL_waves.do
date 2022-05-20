onerror {resume}
radix define STATES {
    "3'b000" "IDLE_R",
    "3'b001" "LOAD",
    "3'b010" "WRITE",
    "3'b011" "REST",
    "3'b100" "SHIFT",
    "3'b101" "EXIT",
    -default default
}
radix define RD_LEDS {
    "3'b001" "IDLE_R",
    "3'b010" "LOAD",
    "3'b011" "WRITE",
    "3'b100" "REST",
    "3'b101" "SHIFT",
    "3'b110" "EXIT",
    "3'b111" "ERROR",
    -default default
}
quietly WaveActivateNextPane {} 0
add wave -noupdate -divider System
add wave -noupdate /TB_RD_CONTROL/rst
add wave -noupdate /TB_RD_CONTROL/clk
add wave -noupdate -label {Cycle counter} -radix unsigned /TB_RD_CONTROL/i
add wave -noupdate -divider Inputs
add wave -noupdate /TB_RD_CONTROL/start_rd
add wave -noupdate /TB_RD_CONTROL/txbusy
add wave -noupdate -divider Outputs
add wave -noupdate /TB_RD_CONTROL/txena
add wave -noupdate /TB_RD_CONTROL/done_rd
add wave -noupdate /TB_RD_CONTROL/load_txregs
add wave -noupdate /TB_RD_CONTROL/shift_txregs
add wave -noupdate -radix RD_LEDS /TB_RD_CONTROL/rd_leds
add wave -noupdate -divider UUT
add wave -noupdate -expand -group UUT -divider System
add wave -noupdate -expand -group UUT /TB_RD_CONTROL/UUT/rst
add wave -noupdate -expand -group UUT /TB_RD_CONTROL/UUT/clk
add wave -noupdate -expand -group UUT -radix unsigned /TB_RD_CONTROL/n_bytes
add wave -noupdate -expand -group UUT -radix unsigned /TB_RD_CONTROL/UUT/count
add wave -noupdate -expand -group UUT -divider Inputs
add wave -noupdate -expand -group UUT /TB_RD_CONTROL/UUT/start_rd
add wave -noupdate -expand -group UUT /TB_RD_CONTROL/UUT/txbusy
add wave -noupdate -expand -group UUT -divider Outputs
add wave -noupdate -expand -group UUT /TB_RD_CONTROL/UUT/txena
add wave -noupdate -expand -group UUT /TB_RD_CONTROL/UUT/load_txregs
add wave -noupdate -expand -group UUT /TB_RD_CONTROL/UUT/shift_txregs
add wave -noupdate -expand -group UUT /TB_RD_CONTROL/UUT/done_rd
add wave -noupdate -expand -group UUT -radix unsigned /TB_RD_CONTROL/UUT/rd_leds
add wave -noupdate -expand -group UUT -divider States
add wave -noupdate -expand -group UUT -radix STATES /TB_RD_CONTROL/UUT/state
add wave -noupdate -expand -group UUT -radix STATES /TB_RD_CONTROL/UUT/next_state
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {1450000 ps} 0}
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
WaveRestoreZoom {0 ps} {1596 ns}
