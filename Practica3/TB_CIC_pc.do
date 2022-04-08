onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -divider System
add wave -noupdate /TB_CIC_pc/clk
add wave -noupdate /TB_CIC_pc/rst
add wave -noupdate -divider {Execution control}
add wave -noupdate /TB_CIC_pc/val_in
add wave -noupdate /TB_CIC_pc/val_out
add wave -noupdate /TB_CIC_pc/load_data
add wave -noupdate /TB_CIC_pc/end_sim
add wave -noupdate -divider {_M and _F comparison}
add wave -noupdate -format Analog-Step -height 74 -max 31163.000000000004 -min -31164.0 /TB_CIC_pc/i_data
add wave -noupdate -format Analog-Step -height 74 -max 107425000000.0 -min -107429000000.0 /TB_CIC_pc/o_data_M
add wave -noupdate -format Analog-Step -height 74 -max 107425000000.0 -min -107429000000.0 /TB_CIC_pc/o_data_F
add wave -noupdate -divider {Error control}
add wave -noupdate /TB_CIC_pc/error_cnt
add wave -noupdate /TB_CIC_pc/sample_cnt
add wave -noupdate -divider OPTIONAL
add wave -noupdate -divider comb0
add wave -noupdate {/TB_CIC_pc/uut/genblk1/CIC[0]/COMB0/data_in}
add wave -noupdate {/TB_CIC_pc/uut/genblk1/CIC[0]/COMB0/val_in}
add wave -noupdate {/TB_CIC_pc/uut/genblk1/CIC[0]/COMB0/val_out}
add wave -noupdate {/TB_CIC_pc/uut/genblk1/CIC[0]/COMB0/data_out}
add wave -noupdate {/TB_CIC_pc/uut/genblk1/CIC[0]/COMB0/data_in_reg}
add wave -noupdate -divider comb1
add wave -noupdate {/TB_CIC_pc/uut/genblk1/CIC[1]/COMB0/data_in}
add wave -noupdate {/TB_CIC_pc/uut/genblk1/CIC[1]/COMB0/val_in}
add wave -noupdate {/TB_CIC_pc/uut/genblk1/CIC[1]/COMB0/val_out}
add wave -noupdate {/TB_CIC_pc/uut/genblk1/CIC[1]/COMB0/data_out}
add wave -noupdate {/TB_CIC_pc/uut/genblk1/CIC[1]/COMB0/data_in_reg}
add wave -noupdate -divider comb2
add wave -noupdate {/TB_CIC_pc/uut/genblk1/CIC[2]/COMB0/data_in}
add wave -noupdate {/TB_CIC_pc/uut/genblk1/CIC[2]/COMB0/val_in}
add wave -noupdate {/TB_CIC_pc/uut/genblk1/CIC[2]/COMB0/val_out}
add wave -noupdate {/TB_CIC_pc/uut/genblk1/CIC[2]/COMB0/data_out}
add wave -noupdate {/TB_CIC_pc/uut/genblk1/CIC[2]/COMB0/data_in_reg}
add wave -noupdate -divider r_int
add wave -noupdate /TB_CIC_pc/uut/R_INT0/data_in
add wave -noupdate /TB_CIC_pc/uut/R_INT0/val_in
add wave -noupdate /TB_CIC_pc/uut/R_INT0/val_out
add wave -noupdate /TB_CIC_pc/uut/R_INT0/data_out
add wave -noupdate -divider int0
add wave -noupdate /TB_CIC_pc/clk
add wave -noupdate {/TB_CIC_pc/uut/genblk1/CIC[0]/INT0/data_in}
add wave -noupdate {/TB_CIC_pc/uut/genblk1/CIC[0]/INT0/val_in}
add wave -noupdate {/TB_CIC_pc/uut/genblk1/CIC[0]/INT0/val_out}
add wave -noupdate {/TB_CIC_pc/uut/genblk1/CIC[0]/INT0/data_out}
add wave -noupdate -divider int1
add wave -noupdate {/TB_CIC_pc/uut/genblk1/CIC[1]/INT0/data_in}
add wave -noupdate {/TB_CIC_pc/uut/genblk1/CIC[1]/INT0/val_in}
add wave -noupdate {/TB_CIC_pc/uut/genblk1/CIC[1]/INT0/val_out}
add wave -noupdate {/TB_CIC_pc/uut/genblk1/CIC[1]/INT0/data_out}
add wave -noupdate -divider int2
add wave -noupdate {/TB_CIC_pc/uut/genblk1/CIC[2]/INT0/data_in}
add wave -noupdate {/TB_CIC_pc/uut/genblk1/CIC[2]/INT0/val_in}
add wave -noupdate {/TB_CIC_pc/uut/genblk1/CIC[2]/INT0/val_out}
add wave -noupdate {/TB_CIC_pc/uut/genblk1/CIC[2]/INT0/data_out}
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {60001000 ps} 0} {{Cursor 3} {80001000 ps} 0}
quietly wave cursor active 2
configure wave -namecolwidth 329
configure wave -valuecolwidth 86
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
WaveRestoreZoom {0 ps} {1092084 ns}
