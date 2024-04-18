onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -divider Controller
add wave -noupdate -radix binary /fsm/clk
add wave -noupdate /fsm/rst
add wave -noupdate -divider {I/O ports}
add wave -noupdate /fsm/inputs
add wave -noupdate /fsm/ouputs
add wave -noupdate -divider {FSM States}
add wave -noupdate /fsm/next_state
add wave -noupdate /fsm/present_state
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {50 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 196
configure wave -valuecolwidth 64
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
WaveRestoreZoom {0 ps} {105 ps}