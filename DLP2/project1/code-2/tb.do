vlib rtl_work
vmap work rtl_work

vcom -93 -work work {../../binAdder.vhd}
vcom -93 -work work {../../project1.vhd}
vcom -93 -work work {../../bcd2ssd.vhd}
vcom -93 -work work {../../bin2bcd.vhd}

vsim work.project1(ifsc)
do wave.do

force -freeze sim:/project1/reset 1 0, 0 10

force -freeze sim:/project1/clk 1 0, 0 {50 ps} -r 100

force -freeze sim:/project1/input1 0000000
force -freeze sim:/project1/input1 0000000

run 50

force -freeze sim:/project1/input1 0110110
force -freeze sim:/project1/input2 0011110

run 50 

force -freeze sim:/project1/input1 0101010
force -freeze sim:/project1/input2 0111111

run 50