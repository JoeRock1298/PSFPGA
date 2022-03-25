onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -divider {Basic signals}
add wave -noupdate /TB_DP_MOD/clk
add wave -noupdate /TB_DP_MOD/rst
add wave -noupdate -divider Configuration
add wave -noupdate -radix unsigned /TB_DP_MOD/frec_por
add wave -noupdate -radix unsigned /TB_DP_MOD/im_am
add wave -noupdate -radix unsigned /TB_DP_MOD/im_fm
add wave -noupdate /TB_DP_MOD/c_fm_am
add wave -noupdate -divider {Execution control}
add wave -noupdate /TB_DP_MOD/val_in
add wave -noupdate /TB_DP_MOD/val_out
add wave -noupdate /TB_DP_MOD/load_data
add wave -noupdate /TB_DP_MOD/end_sim
add wave -noupdate -divider {Comparación _M con _F}
add wave -noupdate -format Analog-Step -height 74 -max 32767.0 -min -32767.0 /TB_DP_MOD/i_data
add wave -noupdate -format Analog-Step -height 74 -max 32766.999999999993 -min -32766.0 /TB_DP_MOD/o_data_M
add wave -noupdate -format Analog-Step -height 74 -max 32690.000000000004 -min -32602.0 /TB_DP_MOD/o_data_F
add wave -noupdate -divider {Error control}
add wave -noupdate /TB_DP_MOD/error_cnt
add wave -noupdate /TB_DP_MOD/sample_cnt
add wave -noupdate -format Analog-Step -height 74 -max 32767.0 -min -32767.0 /TB_DP_MOD/i_data
add wave -noupdate /TB_DP_MOD/uut/im_fm_mux
add wave -noupdate -radix decimal /TB_DP_MOD/uut/fm_mult
add wave -noupdate /TB_DP_MOD/uut/im_fm_mux_x_i_data
add wave -noupdate /TB_DP_MOD/uut/frec_por_sum_res
add wave -noupdate /TB_DP_MOD/uut/o_data_aux
add wave -noupdate -divider debug
add wave -noupdate /TB_DP_MOD/clk
add wave -noupdate /TB_DP_MOD/val_in
add wave -noupdate /TB_DP_MOD/val_out
add wave -noupdate /TB_DP_MOD/rst
add wave -noupdate /TB_DP_MOD/uut/D1/rst_ac
add wave -noupdate -format Analog-Step -height 74 -max 32766.999999999993 -min -32766.0 /TB_DP_MOD/uut/DDS_out
add wave -noupdate /TB_DP_MOD/uut/am_mux
add wave -noupdate /TB_DP_MOD/uut/o_data_aux
add wave -noupdate /TB_DP_MOD/uut/mult_out
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {181000 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 240
configure wave -valuecolwidth 275
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
WaveRestoreZoom {0 ps} {7192500 ps}
