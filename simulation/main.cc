#include "Vtop.h"
#include "Vtop___024root.h"
#include "verilated.h"

#include <cstdio>

int main(int argc, const char* argv[])
{
  Verilated::commandArgs(argc, argv);
  Vtop* top = new Vtop;

  // Reset sequence
  top->clk = 0;
  top->reset_n = 0; // Hold reset down (Active low)
  top->eval();
  
  // Toggle clock for a few times
  for (int i = 0; i < 5; i++)
  {
    top->clk = !top->clk;
    top->eval();
  }

  top->reset_n = 1; // Release reset (System starts)

  // Simulation loop
  for (int i = 0; i < 200; i++)
  {
    // Toggle clock (rising edge)
    top->clk = 1;
    top->eval();

    // Print status
    printf("Cycle %d | PC: %08x | Instruction: %08x | Result (x11): %d\n",
           i, top->pc, top->instruction, top->rootp->top__DOT__u_register_file__DOT__regs[11]);

    // Toggle clock (falling edge)
    top->clk = 0;
    top->eval();
  }

  top->final();
  delete top;
  return 0;
}

