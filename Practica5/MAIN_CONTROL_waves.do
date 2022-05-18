onerror {resume}
radix define SLEDS {
    "3'b001" "IDLE",
    "3'b011" "WRITE",
    "3'b010" "READ",
    "3'b111" "ERROR",
    -default default
}
radix define STATES {
    "2'b00" "IDLE",
    "2'b01" "WRITE",
    "2'b10" "READ",
    -default default
}
quietly WaveActivateNextPane {} 0
add wave -noupdate -divider System
add wave -noupdate /TB_MAIN_CONTROL/clk
add wave -noupdate -label {Cycle counter} /TB_MAIN_CONTROL/i
add wave -noupdate /TB_MAIN_CONTROL/rst
add wave -noupdate -divider Inputs
add wave -noupdate /TB_MAIN_CONTROL/rxrdy
add wave -noupdate -radix hexadecimal /TB_MAIN_CONTROL/rxdw
add wave -noupdate /TB_MAIN_CONTROL/done_wr
add wave -noupdate /TB_MAIN_CONTROL/done_rd
add wave -noupdate -divider Outputs
add wave -noupdate /TB_MAIN_CONTROL/start_wr
add wave -noupdate /TB_MAIN_CONTROL/start_rd
add wave -noupdate -radix SLEDS /TB_MAIN_CONTROL/sleds
add wave -noupdate -divider UUT
add wave -noupdate -expand -group UUT -divider System
add wave -noupdate -expand -group UUT /TB_MAIN_CONTROL/UUT/clk
add wave -noupdate -expand -group UUT /TB_MAIN_CONTROL/UUT/rst
add wave -noupdate -expand -group UUT -divider Inputs
add wave -noupdate -expand -group UUT /TB_MAIN_CONTROL/UUT/rxrdy
add wave -noupdate -expand -group UUT -radix hexadecimal /TB_MAIN_CONTROL/UUT/rxdw
add wave -noupdate -expand -group UUT /TB_MAIN_CONTROL/UUT/start_wr
add wave -noupdate -expand -group UUT /TB_MAIN_CONTROL/UUT/start_rd
add wave -noupdate -expand -group UUT -divider Outputs
add wave -noupdate -expand -group UUT /TB_MAIN_CONTROL/UUT/done_wr
add wave -noupdate -expand -group UUT /TB_MAIN_CONTROL/UUT/done_rd
add wave -noupdate -expand -group UUT /TB_MAIN_CONTROL/UUT/sleds
add wave -noupdate -expand -group UUT -divider States
add wave -noupdate -expand -group UUT -radix STATES /TB_MAIN_CONTROL/UUT/state
add wave -noupdate -expand -group UUT -radix STATES /TB_MAIN_CONTROL/UUT/next_state
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {452000 ps} 0}
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
WaveRestoreZoom {0 ps} {590100 ps}
