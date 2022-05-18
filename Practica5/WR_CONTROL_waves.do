onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /TB_WR_CONTROL/rst
add wave -noupdate /TB_WR_CONTROL/clk
add wave -noupdate /TB_WR_CONTROL/rxrdy
add wave -noupdate /TB_WR_CONTROL/start_wr
add wave -noupdate /TB_WR_CONTROL/shift_rxregs
add wave -noupdate /TB_WR_CONTROL/done_wr
add wave -noupdate /TB_WR_CONTROL/load_confregs
add wave -noupdate -radix unsigned /TB_WR_CONTROL/wr_leds
add wave -noupdate /TB_WR_CONTROL/i
add wave -noupdate /TB_WR_CONTROL/n_bytes
add wave -noupdate /TB_WR_CONTROL/UUT/idle_w
add wave -noupdate /TB_WR_CONTROL/UUT/shift
add wave -noupdate /TB_WR_CONTROL/UUT/load
add wave -noupdate /TB_WR_CONTROL/UUT/count_end
add wave -noupdate /TB_WR_CONTROL/UUT/rxrdy
add wave -noupdate /TB_WR_CONTROL/UUT/start_wr
add wave -noupdate /TB_WR_CONTROL/UUT/rst
add wave -noupdate /TB_WR_CONTROL/UUT/clk
add wave -noupdate /TB_WR_CONTROL/UUT/shift_rxregs
add wave -noupdate /TB_WR_CONTROL/UUT/load_confregs
add wave -noupdate /TB_WR_CONTROL/UUT/done_wr
add wave -noupdate /TB_WR_CONTROL/UUT/wr_leds
add wave -noupdate -radix unsigned /TB_WR_CONTROL/UUT/state
add wave -noupdate -radix unsigned /TB_WR_CONTROL/UUT/next_state
add wave -noupdate -radix unsigned /TB_WR_CONTROL/UUT/count
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {1210000 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 255
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
WaveRestoreZoom {0 ps} {1471050 ps}
