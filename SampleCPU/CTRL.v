`include "lib/defines.vh"
module CTRL(
    input wire rst,
    input wire stallreq_for_ex,
    input wire stallreq_for_load,

    // output reg flush,
    // output reg [31:0] new_pc,
    output reg [`StallBus-1:0] stall
);  
    always @ (*) begin
        if (rst) begin
            stall <= `StallBus'b0;
        end
        else if (stallreq_for_load) begin
            stall <= `StallBus'b00_0111;
        end
        else if (stallreq_for_ex) begin
            stall <= `StallBus'b00_1111;
        end
        else begin
            stall <= `StallBus'b0;
        end
    end

endmodule