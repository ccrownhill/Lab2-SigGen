#include "Vsinegen.h"
#include "verilated.h"
#include "verilated_vcd_c.h"

constexpr int OFFSET = 64;

int main(int argc, char **argv, char **env)   {
    int i;
    int clk;

    Verilated::commandArgs(argc,argv);
    // init top verilog instance
    Vsinegen* top = new Vsinegen;
    // init trace dump
    Verilated::traceEverOn(true);
    VerilatedVcdC* tfp = new VerilatedVcdC;
    top -> trace (tfp, 99);
    tfp -> open ("sinegen.vcd");

    // initialize simulation inputs
    top->clk = 1;
    top->rst = 0;
    top->en = 1;
    top->incr = 1;
    top->clk = 1;

    // run simulation for many clock cycles
    for (i=0; i<1000000; i++) {

        // dump variables into VCD file and toggle clock
        for (clk=0; clk<2; clk++) {
            tfp->dump(2*i+clk);
            top->clk = !top->clk;
            top->eval ();
        }
	top->offset = OFFSET;
	// to make vbdValue() change the offset you would have to put:
	// top->offset = vbdValue();
	// plot waveforms with
	// vbdPlot(int(top->dout1), 0, 255);
	// vbdPlot(int(top->dout2), 0, 255);
        if (Verilated::gotFinish())
		exit(0);
    }
    tfp->close();
    exit(0);
}
