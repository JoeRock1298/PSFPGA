onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -divider Parameters
add wave -noupdate /TB_REG_MUX/Num_coef
add wave -noupdate /TB_REG_MUX/Win
add wave -noupdate -divider System
add wave -noupdate /TB_REG_MUX/clk
add wave -noupdate -divider Inputs
add wave -noupdate /TB_REG_MUX/ce
add wave -noupdate /TB_REG_MUX/din
add wave -noupdate -radix unsigned /TB_REG_MUX/sel
add wave -noupdate -divider Parameters
add wave -noupdate /TB_REG_MUX/dout
add wave -noupdate -divider {Auxiliar variables}
add wave -noupdate /TB_REG_MUX/selector
add wave -noupdate -divider {Clk counter}
add wave -noupdate /TB_REG_MUX/i
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {256718 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 210
configure wave -valuecolwidth 44
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
WaveRestoreZoom {0 ps} {389014 ps}
