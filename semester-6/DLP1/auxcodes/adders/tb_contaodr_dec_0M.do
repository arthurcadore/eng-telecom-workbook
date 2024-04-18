vlib rtl_work
vmap work rtl_work

vcom -93 -work work {../../contador_dec_0M.vhd}

vsim work.contador_dec_0m(ifsc_v3)

add wave -position end  sim:/contador_dec_0m/clk
add wave -position end  sim:/contador_dec_0m/rst
add wave -position end  /contador_dec_0m/l_count/count
add wave -position end  sim:/contador_dec_0m/fim_count
add wave -position end  sim:/contador_dec_0m/out_count

force -freeze sim:/contador_dec_0m/clk 1 0, 0 {50 ps} -r 100
force -freeze sim:/contador_dec_0m/rst 1 0, 0 10

run 1000


