all: run

clean:
	rm -rf obj_dir
	rm -f counter.vcd

sigdelay: sigdelay.sv counter.sv ram.sv sigdelay_tb.cpp
	verilator --Wall --cc --trace sigdelay.sv counter.sv ram.sv --exe sigdelay_tb.cpp

run: clean sigdelay
	make -j -C obj_dir/ -f Vsigdelay.mk Vsigdelay
	obj_dir/Vsigdelay

.PHONY: clean sigdelay run
