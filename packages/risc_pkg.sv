// ------------------------------------------------
// RISC-V RV32I Processor Package 
// ------------------------------------------------
package risc_pkg;

  // ------------------------------------------------
  // RISC-V Opcodes (Instruction Format)
  // ------------------------------------------------
  typedef enum logic [6:0] {
    OPCODE_R_TYPE   = 7'h33,
    OPCODE_I_LOAD   = 7'h03,
    OPCODE_I_ALU    = 7'h13,
    OPCODE_I_JALR   = 7'h67,
    OPCODE_S_TYPE   = 7'h23,
    OPCODE_B_TYPE   = 7'h63,
    OPCODE_LUI      = 7'h37,
    OPCODE_AUIPC    = 7'h17,
    OPCODE_JAL      = 7'h6F
  } opcode_t;

endpackage

