#include "Vsinegen.h"
#include "verilated.h"
#include "verilated_vcd_c.h"

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
    top->rst = 1;
    top->en = 0;
    top->incr = 10;
    top->clk = 1;

    // run simulation for many clock cycles
    for (i=0; i<1000000; i++) {

        // dump variables into VCD file and toggle clock
        for (clk=0; clk<2; clk++) {
            tfp->dump(2*i+clk);
            top->clk = !top->clk;
            top->eval ();
        }
        top->rst = (i < 2);
        top->en = !(i < 2);
	// to make vbdValue() change the frequency you would have to put:
	// top->incr = vbdValue();
        if (Verilated::gotFinish())
		exit(0);
    }
    tfp->close();
    exit(0);
}
