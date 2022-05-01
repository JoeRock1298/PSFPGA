onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -divider Parameter
add wave -noupdate /TB_ROM/Num_coef
add wave -noupdate /TB_ROM/Wc
add wave -noupdate -divider System
add wave -noupdate /TB_ROM/clk
add wave -noupdate -divider {Simulation control}
add wave -noupdate /TB_ROM/load_data
add wave -noupdate /TB_ROM/end_sim
add wave -noupdate -divider {Model and file comparison}
add wave -noupdate -radix unsigned /TB_ROM/addr
add wave -noupdate -format Analog-Step -height 74 -max 86137.0 -min -19111.0 /TB_ROM/data
add wave -noupdate -format Analog-Step -height 74 -max 86137.0 -min -19111.0 -radix decimal /TB_ROM/read_perameters
add wave -noupdate -divider {Error control}
add wave -noupdate /TB_ROM/error_cnt
add wave -noupdate /TB_ROM/sample_cnt
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {20440 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 190
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
WaveRestoreZoom {0 ps} {272882 ps}
