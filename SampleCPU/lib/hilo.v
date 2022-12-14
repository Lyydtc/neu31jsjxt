module hilo(
    input wire clk,
    input wire rst,

    input wire we,
    input wire[31:0] hi_wdata,
    input wire[31:0] lo_wdata,

    output wire[31:0] hi_rdata,
    output wire[31:0] lo_rdata
);

    reg [31:0] hi_rdata_r;
    reg [31:0] lo_rdata_r;

    always @(posedge clk) begin
        if (rst == 1'b1) begin
            {hi_rdata_r, lo_rdata_r} = 64'b0;
        end
        else if(we == 1'b1) begin
            hi_rdata_r <= hi_wdata;
            lo_rdata_r <= lo_wdata;
        end
    end

    assign hi_rdata = hi_rdata_r;
    assign lo_rdata = lo_rdata_r;

endmodule