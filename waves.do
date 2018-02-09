vsim -voptargs=+acc work.digicode_test
add wave -position insertpoint  \
sim:/digicode_test/alarm \
sim:/digicode_test/door \
sim:/digicode_test/clk \
sim:/digicode_test/reset \
sim:/digicode_test/timeout \
sim:/digicode_test/daytime \
sim:/digicode_test/code
run
