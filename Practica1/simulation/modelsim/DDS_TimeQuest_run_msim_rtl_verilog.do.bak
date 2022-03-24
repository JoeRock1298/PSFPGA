transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/jose_/Documents/UPV/MUISE_21_22/PSFPGA/Practica1 {C:/Users/jose_/Documents/UPV/MUISE_21_22/PSFPGA/Practica1/preprocesado.v}
vlog -vlog01compat -work work +incdir+C:/Users/jose_/Documents/UPV/MUISE_21_22/PSFPGA/Practica1 {C:/Users/jose_/Documents/UPV/MUISE_21_22/PSFPGA/Practica1/postprocesado.v}
vlog -vlog01compat -work work +incdir+C:/Users/jose_/Documents/UPV/MUISE_21_22/PSFPGA/Practica1 {C:/Users/jose_/Documents/UPV/MUISE_21_22/PSFPGA/Practica1/accumulator.v}
vlog -vlog01compat -work work +incdir+C:/Users/jose_/Documents/UPV/MUISE_21_22/PSFPGA/Practica1 {C:/Users/jose_/Documents/UPV/MUISE_21_22/PSFPGA/Practica1/DDS_test_wrap.v}
vlog -vlog01compat -work work +incdir+C:/Users/jose_/Documents/UPV/MUISE_21_22/PSFPGA/Practica1 {C:/Users/jose_/Documents/UPV/MUISE_21_22/PSFPGA/Practica1/DDS_test.v}

vlog -vlog01compat -work work +incdir+C:/Users/jose_/Documents/UPV/MUISE_21_22/PSFPGA/Practica1 {C:/Users/jose_/Documents/UPV/MUISE_21_22/PSFPGA/Practica1/TB_DDS_test.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneive_ver -L rtl_work -L work -voptargs="+acc"  TB_DDS_test

add wave *
view structure
view signals
run -all
