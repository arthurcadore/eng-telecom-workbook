# do counter1_run_msim_rtl_vhdl.do
# if {[file exists rtl_work]} {
# 	vdel -lib rtl_work -all
# }
vlib rtl_work
vmap work rtl_work
# Model Technology ModelSim - Intel FPGA Edition vmap 2020.1 Lib Mapping Utility 2020.02 Feb 28 2020
# vmap work rtl_work 
# Copying /opt/intelFPGA/20.1/modelsim_ae/linuxaloem/../modelsim.ini to modelsim.ini
# Modifying modelsim.ini
# 
vcom -93 -work work {../../counter2.vhd}
# Model Technology ModelSim - Intel FPGA Edition vcom 2020.1 Compiler 2020.02 Feb 28 2020
# Start time: 08:25:27 on Oct 24,2023
# vcom -reportprogress 300 -93 -work work /home/arthur.cmb/projects/counter1/counter2.vhd 
# -- Loading package STANDARD
# -- Loading package TEXTIO
# -- Loading package std_logic_1164
# -- Loading package NUMERIC_STD
# -- Compiling entity counter2
# -- Compiling architecture ifsc_v of counter2
# End time: 08:25:27 on Oct 24,2023, Elapsed time: 0:00:00
# Errors: 0, Warnings: 0
# 
# 
# stdin: <EOF>
vsim work.counter2
# vsim work.counter2 
# Start time: 08:25:37 on Oct 24,2023
# //  ModelSim - Intel FPGA Edition 2020.1 Feb 28 2020 Linux 4.19.0-25-amd64
# //
# //  Copyright 1991-2020 Mentor Graphics Corporation
# //  All Rights Reserved.
# //
# //  ModelSim - Intel FPGA Edition and its associated documentation contain trade
# //  secrets and commercial or financial information that are the property of
# //  Mentor Graphics Corporation and are privileged, confidential,
# //  and exempt from disclosure under the Freedom of Information Act,
# //  5 U.S.C. Section 552. Furthermore, this information
# //  is prohibited from disclosure under the Trade Secrets Act,
# //  18 U.S.C. Section 1905.
# //
# Loading std.standard
# Loading std.textio(body)
# Loading ieee.std_logic_1164(body)
# Loading ieee.numeric_std(body)
# Loading work.counter2(ifsc_v)

do wave.do
#add wave -position end  sim:/counter2/N
#add wave -position end  sim:/counter2/a
#add wave -position end  sim:/counter2/b
#add wave -position end  sim:/counter2/cin
#add wave -position end  sim:/counter2/cout
#add wave -position end  sim:/counter2/sum
#add wave -position end  sim:/counter2/a_uns
#add wave -position end  sim:/counter2/b_uns
#add wave -position end  sim:/counter2/cin_uns
#add wave -position end  sim:/counter2/tmp


force -freeze sim:/counter2/a 10#7 0
force -freeze sim:/counter2/b 10#9 0, 10#2 200
force -freeze sim:/counter2/cin 0 0 
force -freeze sim:/counter2/cin 0 0,1 100 -r 200 
run 400

