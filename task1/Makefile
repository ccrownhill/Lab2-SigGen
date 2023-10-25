all: run

clean:
	rm -rf obj_dir
	rm -f counter.vcd

sinegen: sinegen.sv counter.sv rom.sv sinegen_tb.cpp
	verilator --Wall --cc --trace sinegen.sv counter.sv rom.sv --exe sinegen_tb.cpp

run: clean sinegen
	mkdir -p obj_dir
	make -j -C obj_dir/ -f Vsinegen.mk Vsinegen
	obj_dir/Vsinegen

.PHONY: clean sinegen run
