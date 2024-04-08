vlib rtl_work
vmap work rtl_work

vcom -93 -work work {/home/arthur.cmb/projects/fsm/fsm.vhd}

vsim work.fsm(ifscv1)

do wave.do

force -freeze sim:/fsm/rst 1 0, 0 10
force -freeze sim:/fsm/clk 1 0, 0 {5ps } -r 10ps
force -freeze sim:/fsm/inputs 0000 0, 0001 10, 0010 20, 0011 30, 0000 40, 0010 50, 0001 60

run 100