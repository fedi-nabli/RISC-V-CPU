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

  // ------------------------------------------------
  // ALU Operation Selector
  // ------------------------------------------------
  typedef enum logic [3:0] {
    ADD,
    SUB,
    SLL, // Shift Left Logical
    SLT, // Set Less Than
    SLTU, // Set Less Than Unsigned
    XOR,
    SRL, // Shift Right Logical
    SRA, // Shift Right Arithmetic
    OR,
    AND
  } alu_op_t;

  // ------------------------------------------------
  // Memory Access Sizes
  // ------------------------------------------------
  typedef enum logic [1:0] {
    BYTE      = 2'b00.
    HALF_WORD = 2'b01,
    WORD      = 2'b11
  } mem_size_t;
  
  // ------------------------------------------------
  // B-Type Instructions (Func3)
  // ------------------------------------------------
  typedef enum logic [3:0] {
    B_BEQ   = 3'h0,
    B_BNE   = 3'h1,
    B_BLT   = 3'h4,
    B_BGE   = 3'h5,
    B_BLTU  = 3'h6,
    B_BGEU  = 3'h7
  } b_type_instr_t;

endpackage

