onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -radix binary /clock/ac_ccn
add wave -noupdate -radix unsigned /clock/bcd_decimal_hours
add wave -noupdate -radix unsigned /clock/bcd_unit_hours
add wave -noupdate -radix unsigned /clock/bcd_decimal_minutes
add wave -noupdate -radix unsigned /clock/bcd_unit_minutes
add wave -noupdate -radix unsigned /clock/bcd_decimal_seconds
add wave -noupdate -radix unsigned /clock/bcd_unit_seconds
add wave -noupdate -radix binary /clock/clk
add wave -noupdate -radix binary /clock/clk_days
add wave -noupdate -radix binary /clock/clk_hours
add wave -noupdate -radix binary /clock/clk_minutes
add wave -noupdate -radix binary /clock/clk_seconds
add wave -noupdate -radix binary /clock/enable
add wave -noupdate -radix binary /clock/reset
add wave -noupdate -radix hexadecimal /clock/ssd_hours_decimal
add wave -noupdate -radix hexadecimal /clock/ssd_hours_unit
add wave -noupdate -radix hexadecimal /clock/ssd_minutes_decimal
add wave -noupdate -radix hexadecimal /clock/ssd_minutes_unit
add wave -noupdate -radix hexadecimal /clock/ssd_seconds_decimal
add wave -noupdate -radix hexadecimal /clock/ssd_seconds_unit
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {217201451 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 242
configure wave -valuecolwidth 38
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
WaveRestoreZoom {0 ps} {5423991 ps}