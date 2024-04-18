onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /counter2/N
add wave -noupdate -radix unsigned /counter2/a
add wave -noupdate -radix unsigned /counter2/b
add wave -noupdate /counter2/cin
add wave -noupdate /counter2/cout
add wave -noupdate -radix unsigned /counter2/sum
add wave -noupdate -radix unsigned /counter2/a_uns
add wave -noupdate -radix unsigned /counter2/b_uns
add wave -noupdate /counter2/cin_uns
add wave -noupdate -radix unsigned /counter2/tmp
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {43 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 243
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
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ps} {386 ps}
