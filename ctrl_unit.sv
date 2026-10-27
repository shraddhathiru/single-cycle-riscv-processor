
module ctrl_unit (
    input  logic [6:0] opcode,
    input  logic [2:0] funct3,
    input  logic [6:0] funct7,
    output logic       reg_write,
    output logic       alu_src,    
    output logic       mem_write,
    output logic       mem_read,
    output logic       mem_to_reg,  
    output logic       branch,
    output logic [2:0] alu_control
);

    always_comb begin
        
        reg_write   = 1'b0;
        alu_src     = 1'b0;
        mem_write   = 1'b0;
        mem_read    = 1'b0;
        mem_to_reg  = 1'b0;
        branch      = 1'b0;
        alu_control = 3'b000;

        case (opcode)
            7'b0110011: begin 
                reg_write = 1'b1;
                case ({funct7, funct3})
                    10'b0000000_000: alu_control = 3'b000; 
                    10'b0100000_000: alu_control = 3'b001; 
                    10'b0000000_111: alu_control = 3'b010; 
                    10'b0000000_110: alu_control = 3'b011; 
                    10'b0000000_010: alu_control = 3'b101;
                    default:         alu_control = 3'b000;
                endcase
            end

            7'b0010011: begin 
                reg_write = 1'b1;
                alu_src   = 1'b1;
                case (funct3)
                    3'b000: alu_control = 3'b000; 
                    3'b111: alu_control = 3'b010;
                    3'b110: alu_control = 3'b011; 
                    3'b010: alu_control = 3'b101; 
                    default: alu_control = 3'b000;
                endcase
            end

            7'b0000011: begin 
                reg_write   = 1'b1;
                alu_src     = 1'b1;
                mem_read    = 1'b1;
                mem_to_reg  = 1'b1;
                alu_control = 3'b000;
            end

            7'b0100011: begin 
                alu_src     = 1'b1;
                mem_write   = 1'b1;
                alu_control = 3'b000;
            end

            7'b1100011: begin 
                branch      = 1'b1;
                alu_control = 3'b001; 
            end

            default: ; 
        endcase
    end

endmodule
