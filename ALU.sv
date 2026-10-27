
module ALU (
    input  logic [31:0] a,
    input  logic [31:0] b,
    input  logic [2:0]  alucontrol,
    output logic [31:0] result
);

    always_comb begin
        case (alucontrol)
            3'b000:  result = a + b;
            3'b001:  result = a - b;
            3'b010:  result = a & b;
            3'b011:  result = a | b;
            3'b101:  result = (a < b) ? 32'd1 : 32'd0;
            default: result = 32'd0;
        endcase
    end

endmodule
