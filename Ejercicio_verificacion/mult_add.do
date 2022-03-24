onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -divider inputs
add wave -noupdate /mult_add_tb/a
add wave -noupdate /mult_add_tb/b
add wave -noupdate /mult_add_tb/c
add wave -noupdate /mult_add_tb/val_in
add wave -noupdate -divider outputs
add wave -noupdate /mult_add_tb/rdy_out
add wave -noupdate /mult_add_tb/s
add wave -noupdate /mult_add_tb/s_M
add wave -noupdate /mult_add_tb/s_F
add wave -noupdate -divider {debug variables}
add wave -noupdate /mult_add_tb/error_cnt
add wave -noupdate /mult_add_tb/sample_cnt
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {141000 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
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
WaveRestoreZoom {0 ps} {166196 ps}