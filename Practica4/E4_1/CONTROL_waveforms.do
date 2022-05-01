onerror {resume}
radix define States {
    "2'b00" "ini_filter",
    "2'b01" "start_filter",
    "2'b10" "end_filter",
    -default default
}
quietly WaveActivateNextPane {} 0
add wave -noupdate -divider Parameter
add wave -noupdate /TB_CONTROL/Num_coef
add wave -noupdate -divider System
add wave -noupdate /TB_CONTROL/clk
add wave -noupdate -label Cycles /TB_CONTROL/i
add wave -noupdate /TB_CONTROL/rst
add wave -noupdate -divider Inputs
add wave -noupdate /TB_CONTROL/val_in
add wave -noupdate -divider Outputs
add wave -noupdate /TB_CONTROL/ce_Reg
add wave -noupdate /TB_CONTROL/rst_Acc
add wave -noupdate /TB_CONTROL/ce_Acc
add wave -noupdate /TB_CONTROL/val_out
add wave -noupdate -radix unsigned /TB_CONTROL/addr
add wave -noupdate -divider {Debug FSM}
add wave -noupdate -group UUT -divider Parameter
add wave -noupdate -group UUT /TB_CONTROL/UUT/Num_coef
add wave -noupdate -group UUT -divider Inputs
add wave -noupdate -group UUT /TB_CONTROL/UUT/val_in
add wave -noupdate -group UUT -divider {State transitions}
add wave -noupdate -group UUT -radix States /TB_CONTROL/UUT/state
add wave -noupdate -group UUT -radix States /TB_CONTROL/UUT/next_state
add wave -noupdate -group UUT -divider {Auxiliar varibles}
add wave -noupdate -group UUT -radix unsigned /TB_CONTROL/UUT/timer
add wave -noupdate -group UUT -radix unsigned -childformat {{{/TB_CONTROL/UUT/timeout_reg[4]} -radix unsigned} {{/TB_CONTROL/UUT/timeout_reg[3]} -radix unsigned} {{/TB_CONTROL/UUT/timeout_reg[2]} -radix unsigned} {{/TB_CONTROL/UUT/timeout_reg[1]} -radix unsigned} {{/TB_CONTROL/UUT/timeout_reg[0]} -radix unsigned}} -subitemconfig {{/TB_CONTROL/UUT/timeout_reg[4]} {-height 15 -radix unsigned} {/TB_CONTROL/UUT/timeout_reg[3]} {-height 15 -radix unsigned} {/TB_CONTROL/UUT/timeout_reg[2]} {-height 15 -radix unsigned} {/TB_CONTROL/UUT/timeout_reg[1]} {-height 15 -radix unsigned} {/TB_CONTROL/UUT/timeout_reg[0]} {-height 15 -radix unsigned}} /TB_CONTROL/UUT/timeout_reg
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {265421 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 207
configure wave -valuecolwidth 52
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
WaveRestoreZoom {0 ps} {327600 ps}
