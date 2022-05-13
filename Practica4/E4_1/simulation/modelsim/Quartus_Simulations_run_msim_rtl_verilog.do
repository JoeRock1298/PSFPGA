transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/jose_/Documents/UPV/MUISE_21_22/PSFPGA/Practica4/E4_1 {C:/Users/jose_/Documents/UPV/MUISE_21_22/PSFPGA/Practica4/E4_1/SEC_FILTER.v}
vlog -vlog01compat -work work +incdir+C:/Users/jose_/Documents/UPV/MUISE_21_22/PSFPGA/Practica4/E4_1 {C:/Users/jose_/Documents/UPV/MUISE_21_22/PSFPGA/Practica4/E4_1/REG_MUX.v}
vlog -vlog01compat -work work +incdir+C:/Users/jose_/Documents/UPV/MUISE_21_22/PSFPGA/Practica4/E4_1 {C:/Users/jose_/Documents/UPV/MUISE_21_22/PSFPGA/Practica4/E4_1/MULT_ACC.v}
vlog -vlog01compat -work work +incdir+C:/Users/jose_/Documents/UPV/MUISE_21_22/PSFPGA/Practica4/E4_1 {C:/Users/jose_/Documents/UPV/MUISE_21_22/PSFPGA/Practica4/E4_1/CONTROL.v}
vlog -vlog01compat -work work +incdir+C:/Users/jose_/Documents/UPV/MUISE_21_22/PSFPGA/Practica4/E4_1 {C:/Users/jose_/Documents/UPV/MUISE_21_22/PSFPGA/Practica4/E4_1/ROM.v}

vlog -vlog01compat -work work +incdir+C:/Users/jose_/Documents/UPV/MUISE_21_22/PSFPGA/Practica4/E4_1 {C:/Users/jose_/Documents/UPV/MUISE_21_22/PSFPGA/Practica4/E4_1/TB_SEC_FILTER.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneive_ver -L rtl_work -L work -voptargs="+acc"  TB_SEC_FILTER

add wave *
view structure
view signals
run -all
