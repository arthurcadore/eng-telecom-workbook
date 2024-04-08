onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -divider Inputs
add wave -noupdate /project1/clk
add wave -noupdate /project1/reset
add wave -noupdate /project1/input1
add wave -noupdate /project1/input2
add wave -noupdate -divider Outputs
add wave -noupdate /project1/ssd_unit
add wave -noupdate /project1/ssd_decimal
add wave -noupdate /project1/ssd_centena
add wave -noupdate -divider Signals
add wave -noupdate /project1/adder_out
add wave -noupdate /project1/bcd_out0
add wave -noupdate /project1/bcd_out1
add wave -noupdate /project1/bcd_out2
add wave -noupdate /project1/ac_ccn0
add wave -noupdate /project1/ac_ccn1
add wave -noupdate /project1/ac_ccn2
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {48 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 279
configure wave -valuecolwidth 100
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
configure wave -timelineunits hr
update
WaveRestoreZoom {0 ps} {786 ps}