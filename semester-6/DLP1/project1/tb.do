vlib rtl_work
vmap work rtl_work

vcom -93 -work work {../../clock.vhd}

vcom -93 -work work {../../bcd2ssd.vhd}

vcom -93 -work work {../../counter.vhd}

vcom -93 -work work {../../div_clk.vhd}

vsim work.clock(ifsc)

do wave.do

force -freeze sim:/clock/reset 1 0, 0 10

force -freeze sim:/clock/clk 1 0, 0 {100ms } -r 200ms 

run 1sec