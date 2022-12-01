transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/mattc/OneDrive/Desktop/Eele-0651\ Project\ Files/project {C:/Users/mattc/OneDrive/Desktop/Eele-0651 Project Files/project/project.v}
vlog -vlog01compat -work work +incdir+C:/Users/mattc/OneDrive/Desktop/Eele-0651\ Project\ Files/project {C:/Users/mattc/OneDrive/Desktop/Eele-0651 Project Files/project/add2.v}
vlog -vlog01compat -work work +incdir+C:/Users/mattc/OneDrive/Desktop/Eele-0651\ Project\ Files/project {C:/Users/mattc/OneDrive/Desktop/Eele-0651 Project Files/project/alu.v}
vlog -vlog01compat -work work +incdir+C:/Users/mattc/OneDrive/Desktop/Eele-0651\ Project\ Files/project {C:/Users/mattc/OneDrive/Desktop/Eele-0651 Project Files/project/programCounter.v}
vlog -vlog01compat -work work +incdir+C:/Users/mattc/OneDrive/Desktop/Eele-0651\ Project\ Files/project {C:/Users/mattc/OneDrive/Desktop/Eele-0651 Project Files/project/registerFile.v}
vlog -vlog01compat -work work +incdir+C:/Users/mattc/OneDrive/Desktop/Eele-0651\ Project\ Files/project {C:/Users/mattc/OneDrive/Desktop/Eele-0651 Project Files/project/instructionMemory.v}

vlog -vlog01compat -work work +incdir+C:/Users/mattc/OneDrive/Desktop/Eele-0651\ Project\ Files/project/simulation/modelsim {C:/Users/mattc/OneDrive/Desktop/Eele-0651 Project Files/project/simulation/modelsim/project.vt}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L fiftyfivenm_ver -L rtl_work -L work -voptargs="+acc"  project_vlg_tst

add wave *
view structure
view signals
run -all
