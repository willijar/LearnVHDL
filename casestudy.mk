display_testbench: display.vhd display_testbench.vhd
stopwatch_ssm_testbench: stopwatch_ssm.vhd stopwatch_ssm_testbench.vhd
timer_testbench: counter.vhd timer.vhd timer_testbench.vhd
stopwatch.bit stopwatch.bin: stopwatch.vhd clk_prescaler.vhd counter.vhd display.vhd debounce.vhd stopwatch_ssm.vhd timer.vhd
timer.check: timer.vhd
display_demo.bit: display.vhd clk_prescaler.vhd display_demo.vhd