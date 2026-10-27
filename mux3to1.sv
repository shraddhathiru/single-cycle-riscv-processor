module mux3to1 #(
    parameter WIDTH = 32
)(
    input  logic [WIDTH-1:0] d0,
    input  logic [WIDTH-1:0] d1,
    input  logic [WIDTH-1:0] d2,
    input  logic [1:0]       sel,
    output logic [WIDTH-1:0] y
);

    always_comb begin
        case (sel)
            2'b00:   y = d0;
            2'b01:   y = d1;
            2'b10:   y = d2;
            default: y = '0;
        endcase
    end

endmodule
