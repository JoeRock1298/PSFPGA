onerror {resume}
radix define States {
    "2'b00" "ini_filter",
    "2'b01" "start_filter",
    "2'b10" "end_filter",
    -default default
}
quietly WaveActivateNextPane {} 0
add wave -noupdate -divider Parameter
add wave -noupdate /TB_SEC_FILTER/Win
add wave -noupdate /TB_SEC_FILTER/Wc
add wave -noupdate /TB_SEC_FILTER/Num_coef
add wave -noupdate -divider System
add wave -noupdate /TB_SEC_FILTER/clk
add wave -noupdate /TB_SEC_FILTER/rst
add wave -noupdate -divider {Execution control}
add wave -noupdate /TB_SEC_FILTER/val_in
add wave -noupdate /TB_SEC_FILTER/val_out
add wave -noupdate /TB_SEC_FILTER/load_data
add wave -noupdate /TB_SEC_FILTER/end_sim
add wave -noupdate -divider {Comparación _M con _F}
add wave -noupdate -format Analog-Step -height 74 -max 32702.0 -min -32703.0 -radix decimal /TB_SEC_FILTER/din
add wave -noupdate -format Analog-Step -height 74 -max 76044.0 -min -76047.0 /TB_SEC_FILTER/dout_M
add wave -noupdate -format Analog-Step -height 74 -max 76277.0 -min -75669.0 /TB_SEC_FILTER/dout_F
add wave -noupdate -divider {Error control}
add wave -noupdate /TB_SEC_FILTER/error_cnt
add wave -noupdate /TB_SEC_FILTER/sample_cnt
add wave -noupdate -divider Extra
add wave -noupdate -group UUT -label X(n) /TB_SEC_FILTER/uut/MULT_ACC0/din
add wave -noupdate -group UUT -label H(n) /TB_SEC_FILTER/uut/MULT_ACC0/coef
add wave -noupdate -group UUT -label {X(n) * H(n)} /TB_SEC_FILTER/uut/MULT_ACC0/mult_res
add wave -noupdate -group UUT -label {X(n-1) * H(n-1)} /TB_SEC_FILTER/uut/MULT_ACC0/acc_res
add wave -noupdate -group UUT -label Y(n) /TB_SEC_FILTER/uut/MULT_ACC0/dout
add wave -noupdate -group UUT -label {Estados del control} -radix States -childformat {{{/TB_SEC_FILTER/uut/CONTROL0/state[1]} -radix States} {{/TB_SEC_FILTER/uut/CONTROL0/state[0]} -radix States}} -subitemconfig {{/TB_SEC_FILTER/uut/CONTROL0/state[1]} {-radix States} {/TB_SEC_FILTER/uut/CONTROL0/state[0]} {-radix States}} /TB_SEC_FILTER/uut/CONTROL0/state
add wave -noupdate -group UUT -label {Shift Register} -radix decimal -childformat {{{/TB_SEC_FILTER/uut/REG_MUX0/SR_9k[16]} -radix decimal} {{/TB_SEC_FILTER/uut/REG_MUX0/SR_9k[15]} -radix decimal} {{/TB_SEC_FILTER/uut/REG_MUX0/SR_9k[14]} -radix decimal} {{/TB_SEC_FILTER/uut/REG_MUX0/SR_9k[13]} -radix decimal} {{/TB_SEC_FILTER/uut/REG_MUX0/SR_9k[12]} -radix decimal} {{/TB_SEC_FILTER/uut/REG_MUX0/SR_9k[11]} -radix decimal} {{/TB_SEC_FILTER/uut/REG_MUX0/SR_9k[10]} -radix decimal} {{/TB_SEC_FILTER/uut/REG_MUX0/SR_9k[9]} -radix decimal} {{/TB_SEC_FILTER/uut/REG_MUX0/SR_9k[8]} -radix decimal} {{/TB_SEC_FILTER/uut/REG_MUX0/SR_9k[7]} -radix decimal} {{/TB_SEC_FILTER/uut/REG_MUX0/SR_9k[6]} -radix decimal} {{/TB_SEC_FILTER/uut/REG_MUX0/SR_9k[5]} -radix decimal} {{/TB_SEC_FILTER/uut/REG_MUX0/SR_9k[4]} -radix decimal} {{/TB_SEC_FILTER/uut/REG_MUX0/SR_9k[3]} -radix decimal} {{/TB_SEC_FILTER/uut/REG_MUX0/SR_9k[2]} -radix decimal} {{/TB_SEC_FILTER/uut/REG_MUX0/SR_9k[1]} -radix decimal} {{/TB_SEC_FILTER/uut/REG_MUX0/SR_9k[0]} -radix decimal}} -subitemconfig {{/TB_SEC_FILTER/uut/REG_MUX0/SR_9k[16]} {-height 15 -radix decimal} {/TB_SEC_FILTER/uut/REG_MUX0/SR_9k[15]} {-height 15 -radix decimal} {/TB_SEC_FILTER/uut/REG_MUX0/SR_9k[14]} {-height 15 -radix decimal} {/TB_SEC_FILTER/uut/REG_MUX0/SR_9k[13]} {-height 15 -radix decimal} {/TB_SEC_FILTER/uut/REG_MUX0/SR_9k[12]} {-height 15 -radix decimal} {/TB_SEC_FILTER/uut/REG_MUX0/SR_9k[11]} {-height 15 -radix decimal} {/TB_SEC_FILTER/uut/REG_MUX0/SR_9k[10]} {-height 15 -radix decimal} {/TB_SEC_FILTER/uut/REG_MUX0/SR_9k[9]} {-height 15 -radix decimal} {/TB_SEC_FILTER/uut/REG_MUX0/SR_9k[8]} {-height 15 -radix decimal} {/TB_SEC_FILTER/uut/REG_MUX0/SR_9k[7]} {-height 15 -radix decimal} {/TB_SEC_FILTER/uut/REG_MUX0/SR_9k[6]} {-height 15 -radix decimal} {/TB_SEC_FILTER/uut/REG_MUX0/SR_9k[5]} {-height 15 -radix decimal} {/TB_SEC_FILTER/uut/REG_MUX0/SR_9k[4]} {-height 15 -radix decimal} {/TB_SEC_FILTER/uut/REG_MUX0/SR_9k[3]} {-height 15 -radix decimal} {/TB_SEC_FILTER/uut/REG_MUX0/SR_9k[2]} {-height 15 -radix decimal} {/TB_SEC_FILTER/uut/REG_MUX0/SR_9k[1]} {-height 15 -radix decimal} {/TB_SEC_FILTER/uut/REG_MUX0/SR_9k[0]} {-height 15 -radix decimal}} /TB_SEC_FILTER/uut/REG_MUX0/SR_9k
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 273
configure wave -valuecolwidth 40
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
WaveRestoreZoom {0 ps} {88697756 ps}
