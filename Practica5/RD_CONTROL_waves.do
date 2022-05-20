onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /TB_RD_CONTROL/rst
add wave -noupdate /TB_RD_CONTROL/clk
add wave -noupdate /TB_RD_CONTROL/txbusy
add wave -noupdate /TB_RD_CONTROL/start_rd
add wave -noupdate /TB_RD_CONTROL/txena
add wave -noupdate /TB_RD_CONTROL/done_rd
add wave -noupdate /TB_RD_CONTROL/load_txregs
add wave -noupdate /TB_RD_CONTROL/shift_txregs
add wave -noupdate -radix unsigned /TB_RD_CONTROL/rd_leds
add wave -noupdate -radix unsigned /TB_RD_CONTROL/i
add wave -noupdate -radix unsigned /TB_RD_CONTROL/n_bytes
add wave -noupdate /TB_RD_CONTROL/UUT/txbusy
add wave -noupdate /TB_RD_CONTROL/UUT/start_rd
add wave -noupdate /TB_RD_CONTROL/UUT/rst
add wave -noupdate /TB_RD_CONTROL/UUT/clk
add wave -noupdate /TB_RD_CONTROL/UUT/txena
add wave -noupdate /TB_RD_CONTROL/UUT/load_txregs
add wave -noupdate /TB_RD_CONTROL/UUT/shift_txregs
add wave -noupdate /TB_RD_CONTROL/UUT/done_rd
add wave -noupdate -radix unsigned /TB_RD_CONTROL/UUT/rd_leds
add wave -noupdate -radix unsigned /TB_RD_CONTROL/UUT/state
add wave -noupdate -radix unsigned /TB_RD_CONTROL/UUT/next_state
add wave -noupdate -radix unsigned /TB_RD_CONTROL/UUT/count
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {1420000 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 293
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
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ps} {1596 ns}
