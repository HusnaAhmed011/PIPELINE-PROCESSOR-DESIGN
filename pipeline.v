// Design Program for Pipelining Processor able to perform basic 
// operations like Adding, Subtracting and Load

module pipeline (input clk, input reset);

    reg [15:0] IMEM [0:31];     // instruction memory
    reg [31:0] DMEM [0:31];     // data memory
    reg [31:0] REG [0:15];      // register file

    reg [4:0] PC;

    // Pipeline registers
    reg [15:0] IF_ID_instr;
    reg [15:0] ID_EX_instr;
    reg [31:0] ID_EX_rs_val, ID_EX_imm;
    reg [3:0]  ID_EX_rd;
    reg [3:0]  ID_EX_opcode;
    reg [31:0] EX_WB_result;
    reg [3:0]  EX_WB_rd;
    reg        EX_WB_we;

    // Fetch Stage
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            PC <= 0;
            IF_ID_instr <= 0;
            ID_EX_instr <= 0;
            EX_WB_result <= 0;
            EX_WB_rd <= 0;
            EX_WB_we <= 0;
        end else begin
            IF_ID_instr <= IMEM[PC];
            PC <= PC + 1;
        end
    end

    // Decode Stage
    wire [3:0] opcode = IF_ID_instr[15:12];
    wire [3:0] rd     = IF_ID_instr[11:8];
    wire [3:0] rs     = IF_ID_instr[7:4];
    wire [3:0] imm    = IF_ID_instr[3:0];

    always @(posedge clk) begin
        ID_EX_instr <= IF_ID_instr;
        ID_EX_opcode <= opcode;
        ID_EX_rd <= rd;
        ID_EX_rs_val <= REG[rs];
        ID_EX_imm <= imm;
    end

    // Execute Stage
    reg [31:0] alu;
    reg        write_enable;

    always @(*) begin
        case (ID_EX_opcode)
            4'b0001: begin alu = ID_EX_rs_val + ID_EX_imm; write_enable = 1; end // ADD
            4'b0010: begin alu = ID_EX_rs_val - ID_EX_imm; write_enable = 1; end // SUB
            4'b0011: begin alu = DMEM[ID_EX_imm]; write_enable = 1; end         // LOAD
            default: begin alu = 0; write_enable = 0; end
        endcase
    end

    always @(posedge clk) begin
        EX_WB_result <= alu;
        EX_WB_rd <= ID_EX_rd;
        EX_WB_we <= write_enable;
    end

    // Write-Back Stage
    always @(posedge clk) begin
        if (EX_WB_we)
            REG[EX_WB_rd] <= EX_WB_result;
    end

endmodule
