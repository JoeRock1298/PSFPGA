onerror {resume}
quietly virtual function -install {/TB_DP_COMPLETMOD/uut/CIC_int/genblk1/CIC[2]/INT0} -env /TB_DP_COMPLETMOD/#ALWAYS#94 { &{/TB_DP_COMPLETMOD/uut/CIC_int/genblk1/CIC[2]/INT0/data_out[18], /TB_DP_COMPLETMOD/uut/CIC_int/genblk1/CIC[2]/INT0/data_out[17], /TB_DP_COMPLETMOD/uut/CIC_int/genblk1/CIC[2]/INT0/data_out[16], /TB_DP_COMPLETMOD/uut/CIC_int/genblk1/CIC[2]/INT0/data_out[15], /TB_DP_COMPLETMOD/uut/CIC_int/genblk1/CIC[2]/INT0/data_out[14], /TB_DP_COMPLETMOD/uut/CIC_int/genblk1/CIC[2]/INT0/data_out[13], /TB_DP_COMPLETMOD/uut/CIC_int/genblk1/CIC[2]/INT0/data_out[12], /TB_DP_COMPLETMOD/uut/CIC_int/genblk1/CIC[2]/INT0/data_out[11], /TB_DP_COMPLETMOD/uut/CIC_int/genblk1/CIC[2]/INT0/data_out[10], /TB_DP_COMPLETMOD/uut/CIC_int/genblk1/CIC[2]/INT0/data_out[9], /TB_DP_COMPLETMOD/uut/CIC_int/genblk1/CIC[2]/INT0/data_out[8], /TB_DP_COMPLETMOD/uut/CIC_int/genblk1/CIC[2]/INT0/data_out[7], /TB_DP_COMPLETMOD/uut/CIC_int/genblk1/CIC[2]/INT0/data_out[6], /TB_DP_COMPLETMOD/uut/CIC_int/genblk1/CIC[2]/INT0/data_out[5], /TB_DP_COMPLETMOD/uut/CIC_int/genblk1/CIC[2]/INT0/data_out[4], /TB_DP_COMPLETMOD/uut/CIC_int/genblk1/CIC[2]/INT0/data_out[3] }} Q_CIC
quietly WaveActivateNextPane {} 0
add wave -noupdate -divider System
add wave -noupdate /TB_DP_COMPLETMOD/clk
add wave -noupdate /TB_DP_COMPLETMOD/rst
add wave -noupdate -divider {Execution control}
add wave -noupdate /TB_DP_COMPLETMOD/val_in
add wave -noupdate /TB_DP_COMPLETMOD/val_out
add wave -noupdate /TB_DP_COMPLETMOD/load_data
add wave -noupdate /TB_DP_COMPLETMOD/end_sim
add wave -noupdate -divider {Control registers}
add wave -noupdate /TB_DP_COMPLETMOD/c_fm_am
add wave -noupdate /TB_DP_COMPLETMOD/c_source
add wave -noupdate -label c_comp_dac(not_used) /TB_DP_COMPLETMOD/c_comp_dac
add wave -noupdate -radix unsigned /TB_DP_COMPLETMOD/frec_mod
add wave -noupdate -radix unsigned /TB_DP_COMPLETMOD/frec_por
add wave -noupdate -radix unsigned /TB_DP_COMPLETMOD/im_am
add wave -noupdate -radix unsigned /TB_DP_COMPLETMOD/im_fm
add wave -noupdate -divider {_M and _F comparison}
add wave -noupdate -format Analog-Step -height 74 -max 32702.999999999996 -min -32703.0 /TB_DP_COMPLETMOD/i_data
add wave -noupdate -format Analog-Step -height 74 -max 8191.0 -min -8192.0 /TB_DP_COMPLETMOD/dout_M
add wave -noupdate -format Analog-Step -height 74 -max 8191.0 -min -8192.0 /TB_DP_COMPLETMOD/dout_F
add wave -noupdate -divider {Error control}
add wave -noupdate /TB_DP_COMPLETMOD/error_cnt
add wave -noupdate -radix unsigned /TB_DP_COMPLETMOD/sample_cnt
add wave -noupdate -divider DEBUG
add wave -noupdate -group DDS /TB_DP_COMPLETMOD/uut/DDS/val_in
add wave -noupdate -group DDS -format Analog-Step -height 74 -max 32767.0 -min -32767.0 /TB_DP_COMPLETMOD/uut/DDS/sqr_wave
add wave -noupdate -group DDS -format Analog-Step -height 74 -max 32766.999999999996 -min -31458.0 /TB_DP_COMPLETMOD/uut/DDS/ramp_wave
add wave -noupdate -group DDS -format Analog-Step -height 74 -max 32702.999999999996 -min -32703.0 /TB_DP_COMPLETMOD/uut/DDS/sin_wave
add wave -noupdate -group DDS /TB_DP_COMPLETMOD/uut/DDS/val_out
add wave -noupdate -group MUX_Source /TB_DP_COMPLETMOD/uut/i_smux
add wave -noupdate -group MUX_Source -format Analog-Step -height 74 -max 32702.999999999996 -min -32703.0 /TB_DP_COMPLETMOD/uut/o_smux
add wave -noupdate -group CIC_comp /TB_DP_COMPLETMOD/uut/CIC_comp/Num_coef
add wave -noupdate -group CIC_comp /TB_DP_COMPLETMOD/uut/CIC_comp/Wc
add wave -noupdate -group CIC_comp /TB_DP_COMPLETMOD/uut/CIC_comp/Win
add wave -noupdate -group CIC_comp /TB_DP_COMPLETMOD/uut/CIC_comp/val_in
add wave -noupdate -group CIC_comp -format Analog-Step -height 74 -max 32702.999999999996 -min -32703.0 /TB_DP_COMPLETMOD/uut/CIC_comp/din
add wave -noupdate -group CIC_comp -format Analog-Step -height 74 -max 31708.000000000004 -min -31710.0 /TB_DP_COMPLETMOD/uut/CIC_comp/dout
add wave -noupdate -group CIC_comp /TB_DP_COMPLETMOD/uut/CIC_comp/val_out
add wave -noupdate -group CIC_int /TB_DP_COMPLETMOD/uut/CIC_int/Win
add wave -noupdate -group CIC_int /TB_DP_COMPLETMOD/uut/CIC_int/Wg
add wave -noupdate -group CIC_int /TB_DP_COMPLETMOD/uut/CIC_int/N
add wave -noupdate -group CIC_int /TB_DP_COMPLETMOD/uut/CIC_int/Wout
add wave -noupdate -group CIC_int /TB_DP_COMPLETMOD/uut/CIC_int/val_in
add wave -noupdate -group CIC_int -format Analog-Step -height 74 -max 31708.000000000004 -min -31710.0 /TB_DP_COMPLETMOD/uut/CIC_int/i_data
add wave -noupdate -group CIC_int -format Analog-Step -height 74 -max 30239.000000000004 -min -30241.0 /TB_DP_COMPLETMOD/uut/CIC_int/o_data
add wave -noupdate -group CIC_int /TB_DP_COMPLETMOD/uut/CIC_int/val_out
add wave -noupdate -group CIC_int -group COMB0 {/TB_DP_COMPLETMOD/uut/CIC_int/genblk1/CIC[0]/COMB0/val_in}
add wave -noupdate -group CIC_int -group COMB0 -format Analog-Step -height 74 -max 31708.000000000004 -min -31710.0 {/TB_DP_COMPLETMOD/uut/CIC_int/genblk1/CIC[0]/COMB0/data_in}
add wave -noupdate -group CIC_int -group COMB0 -format Analog-Step -height 74 -max 31708.000000000004 -min -31710.0 {/TB_DP_COMPLETMOD/uut/CIC_int/genblk1/CIC[0]/COMB0/data_in_reg}
add wave -noupdate -group CIC_int -group COMB0 -format Analog-Step -height 74 -max 5014.0 -min -3990.0 {/TB_DP_COMPLETMOD/uut/CIC_int/genblk1/CIC[0]/COMB0/data_out}
add wave -noupdate -group CIC_int -group COMB0 {/TB_DP_COMPLETMOD/uut/CIC_int/genblk1/CIC[0]/COMB0/val_out}
add wave -noupdate -group CIC_int -group COMB1 {/TB_DP_COMPLETMOD/uut/CIC_int/genblk1/CIC[1]/COMB0/val_in}
add wave -noupdate -group CIC_int -group COMB1 -format Analog-Step -height 74 -max 5014.0 -min -3990.0 {/TB_DP_COMPLETMOD/uut/CIC_int/genblk1/CIC[1]/COMB0/data_in}
add wave -noupdate -group CIC_int -group COMB1 -format Analog-Step -height 74 -max 5014.0 -min -3990.0 {/TB_DP_COMPLETMOD/uut/CIC_int/genblk1/CIC[1]/COMB0/data_in_reg}
add wave -noupdate -group CIC_int -group COMB1 -format Analog-Step -height 74 -max 6043.0000000000009 -min -1420.0 {/TB_DP_COMPLETMOD/uut/CIC_int/genblk1/CIC[1]/COMB0/data_out}
add wave -noupdate -group CIC_int -group COMB1 {/TB_DP_COMPLETMOD/uut/CIC_int/genblk1/CIC[1]/COMB0/val_out}
add wave -noupdate -group CIC_int -group COMB2 {/TB_DP_COMPLETMOD/uut/CIC_int/genblk1/CIC[2]/COMB0/val_in}
add wave -noupdate -group CIC_int -group COMB2 -format Analog-Step -height 74 -max 6043.0000000000009 -min -1420.0 {/TB_DP_COMPLETMOD/uut/CIC_int/genblk1/CIC[2]/COMB0/data_in}
add wave -noupdate -group CIC_int -group COMB2 -format Analog-Step -height 74 -max 6043.0000000000009 -min -1420.0 {/TB_DP_COMPLETMOD/uut/CIC_int/genblk1/CIC[2]/COMB0/data_in_reg}
add wave -noupdate -group CIC_int -group COMB2 -format Analog-Step -height 74 -max 7391.0000000000009 -min -7463.0 {/TB_DP_COMPLETMOD/uut/CIC_int/genblk1/CIC[2]/COMB0/data_out}
add wave -noupdate -group CIC_int -group COMB2 {/TB_DP_COMPLETMOD/uut/CIC_int/genblk1/CIC[2]/COMB0/val_out}
add wave -noupdate -group CIC_int -group R_INT /TB_DP_COMPLETMOD/uut/CIC_int/R_INT0/val_in
add wave -noupdate -group CIC_int -group R_INT -format Analog-Step -height 74 -max 7391.0000000000009 -min -7463.0 /TB_DP_COMPLETMOD/uut/CIC_int/R_INT0/data_in
add wave -noupdate -group CIC_int -group R_INT -format Analog-Step -height 74 -max 7391.0000000000009 -min -7463.0 /TB_DP_COMPLETMOD/uut/CIC_int/R_INT0/data_out
add wave -noupdate -group CIC_int -group R_INT /TB_DP_COMPLETMOD/uut/CIC_int/R_INT0/val_out
add wave -noupdate -group CIC_int -group INT0 {/TB_DP_COMPLETMOD/uut/CIC_int/genblk1/CIC[0]/INT0/val_in}
add wave -noupdate -group CIC_int -group INT0 -clampanalog 1 -format Analog-Step -height 74 -max 7391.0000000000009 -min -7463.0 {/TB_DP_COMPLETMOD/uut/CIC_int/genblk1/CIC[0]/INT0/data_in}
add wave -noupdate -group CIC_int -group INT0 -format Analog-Step -height 74 -max 6043.0000000000009 -min -1420.0 {/TB_DP_COMPLETMOD/uut/CIC_int/genblk1/CIC[0]/INT0/data_out}
add wave -noupdate -group CIC_int -group INT0 {/TB_DP_COMPLETMOD/uut/CIC_int/genblk1/CIC[0]/INT0/val_out}
add wave -noupdate -group CIC_int -group INT1 {/TB_DP_COMPLETMOD/uut/CIC_int/genblk1/CIC[1]/INT0/val_in}
add wave -noupdate -group CIC_int -group INT1 -format Analog-Step -height 74 -max 6043.0000000000009 -min -1420.0 {/TB_DP_COMPLETMOD/uut/CIC_int/genblk1/CIC[1]/INT0/data_in}
add wave -noupdate -group CIC_int -group INT1 -clampanalog 1 -format Analog-Step -height 74 -max 10028000.000000002 -min -7980000.0 {/TB_DP_COMPLETMOD/uut/CIC_int/genblk1/CIC[1]/INT0/data_out}
add wave -noupdate -group CIC_int -group INT1 {/TB_DP_COMPLETMOD/uut/CIC_int/genblk1/CIC[1]/INT0/val_out}
add wave -noupdate -group CIC_int -group INT2 -format Analog-Step -height 74 -max 10028000.0 -min -7980000.0 {/TB_DP_COMPLETMOD/uut/CIC_int/genblk1/CIC[2]/INT0/data_in}
add wave -noupdate -group CIC_int -group INT2 {/TB_DP_COMPLETMOD/uut/CIC_int/genblk1/CIC[2]/INT0/val_in}
add wave -noupdate -group CIC_int -group INT2 {/TB_DP_COMPLETMOD/uut/CIC_int/genblk1/CIC[2]/INT0/val_out}
add wave -noupdate -group CIC_int -group INT2 -format Analog-Step -height 74 -max 126832000000.0 -min -126838003988.0 {/TB_DP_COMPLETMOD/uut/CIC_int/genblk1/CIC[2]/INT0/data_out}
add wave -noupdate -group {FM-AM data path} /TB_DP_COMPLETMOD/uut/data_path/val_in
add wave -noupdate -group {FM-AM data path} -radix unsigned /TB_DP_COMPLETMOD/uut/data_path/c_fm_am
add wave -noupdate -group {FM-AM data path} -radix unsigned /TB_DP_COMPLETMOD/uut/data_path/frec_por
add wave -noupdate -group {FM-AM data path} -radix unsigned /TB_DP_COMPLETMOD/uut/data_path/im_am
add wave -noupdate -group {FM-AM data path} -radix unsigned /TB_DP_COMPLETMOD/uut/data_path/im_fm
add wave -noupdate -group {FM-AM data path} -format Analog-Step -height 74 -max 30239.000000000004 -min -30241.0 /TB_DP_COMPLETMOD/uut/data_path/i_data
add wave -noupdate -group {FM-AM data path} -format Analog-Step -height 74 -max 31501.999999999996 -min -31503.0 /TB_DP_COMPLETMOD/uut/data_path/o_data
add wave -noupdate -group {FM-AM data path} /TB_DP_COMPLETMOD/uut/data_path/val_out
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {194210000 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 519
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
WaveRestoreZoom {0 ps} {2121199500 ps}
