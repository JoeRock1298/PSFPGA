onerror {resume}
quietly virtual signal -install /TB_ROM/UUT { (context /TB_ROM/UUT )&{\addr[4]~input_o , \addr[3]~input_o , \addr[2]~input_o , \addr[1]~input_o , \addr[0]~input_o }} Address
quietly virtual signal -install /TB_ROM/UUT { (context /TB_ROM/UUT )&{\data[17]~output_o , \data[16]~output_o , \data[15]~output_o , \data[14]~output_o , \data[13]~output_o , \data[12]~output_o , \data[11]~output_o , \data[10]~output_o , \data[9]~output_o , \data[8]~output_o , \data[7]~output_o , \data[6]~output_o , \data[5]~output_o , \data[4]~output_o , \data[3]~output_o , \data[2]~output_o , \data[1]~output_o , \data[0]~output_o }} Data
quietly WaveActivateNextPane {} 0
add wave -noupdate -radix unsigned /TB_ROM/addr
add wave -noupdate /TB_ROM/clk
add wave -noupdate /TB_ROM/val_out
add wave -noupdate /TB_ROM/dout_wire
add wave -noupdate /TB_ROM/dout_M
add wave -noupdate /TB_ROM/dout_F
add wave -noupdate /TB_ROM/error_cnt
add wave -noupdate /TB_ROM/sample_cnt
add wave -noupdate /TB_ROM/load_data
add wave -noupdate /TB_ROM/end_sim
add wave -noupdate /TB_ROM/parameters_file
add wave -noupdate /TB_ROM/scan_parameters
add wave -noupdate /TB_ROM/parameters_wave
add wave -noupdate /TB_ROM/i
add wave -noupdate /TB_ROM/selector
add wave -noupdate -label Data_o -radix decimal /TB_ROM/UUT/Data
add wave -noupdate -label CLK -radix decimal {/TB_ROM/UUT/\clk~input_o }
add wave -noupdate -label Address -radix unsigned /TB_ROM/UUT/Address
add wave -noupdate -radix decimal {/TB_ROM/UUT/\ROM_rtl_0|auto_generated|ram_block1a0_PORTADATAOUT_bus }
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {40730 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 188
configure wave -valuecolwidth 84
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
WaveRestoreZoom {0 ps} {78750 ps}
