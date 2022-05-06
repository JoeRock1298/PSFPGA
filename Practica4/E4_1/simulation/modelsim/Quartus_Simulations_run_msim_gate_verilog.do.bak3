transcript on
if {[file exists gate_work]} {
	vdel -lib gate_work -all
}
vlib gate_work
vmap work gate_work

vlog -vlog01compat -work work +incdir+. {Quartus_Simulations_7_1200mv_85c_slow.vo}

vlog -vlog01compat -work work +incdir+C:/Users/gsandar/Documents/Github/PSFPGA/Practica4/E4_1 {C:/Users/gsandar/Documents/Github/PSFPGA/Practica4/E4_1/TB_SEC_FILTER.v}

vsim -t 1ps +transport_int_delays +transport_path_delays -L altera_ver -L cycloneive_ver -L gate_work -L work -voptargs="+acc"  TB_SEC_FILTER

add wave *
view structure
view signals
run -all
