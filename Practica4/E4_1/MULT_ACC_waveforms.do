onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -divider Parameter
add wave -noupdate /TB_MULT_ACC/Win
add wave -noupdate /TB_MULT_ACC/Wc
add wave -noupdate -divider System
add wave -noupdate /TB_MULT_ACC/clk
add wave -noupdate -label Cycles /TB_MULT_ACC/i
add wave -noupdate /TB_MULT_ACC/rst
add wave -noupdate /TB_MULT_ACC/ce
add wave -noupdate -divider {Input values}
add wave -noupdate /TB_MULT_ACC/din
add wave -noupdate /TB_MULT_ACC/coef
add wave -noupdate -divider Result
add wave -noupdate /TB_MULT_ACC/dout
add wave -noupdate -divider MULT_ACC_DEBUG
add wave -noupdate -expand -group UUT -label X(n) /TB_MULT_ACC/UUT/din
add wave -noupdate -expand -group UUT -label H(n) /TB_MULT_ACC/UUT/coef
add wave -noupdate -expand -group UUT -label X(n)*H(n) /TB_MULT_ACC/UUT/mult_res
add wave -noupdate -expand -group UUT -label X(n-1)*H(n-1) /TB_MULT_ACC/UUT/acc_res
add wave -noupdate -expand -group UUT -label Y(n) /TB_MULT_ACC/UUT/dout
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {200000 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 218
configure wave -valuecolwidth 47
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
WaveRestoreZoom {0 ps} {347550 ps}
