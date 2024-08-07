// The purpose of this module is to test the i2c_maste_axil module in hardware.

module top (
    input   logic       clkin100
);

    localparam DEFAULT_PRESCALE = 1;
    localparam FIXED_PRESCALE = 0;
    localparam CMD_FIFO = 1;
    localparam CMD_FIFO_DEPTH = 32;
    localparam WRITE_FIFO = 1;
    localparam WRITE_FIFO_DEPTH = 32;
    localparam READ_FIFO = 1;
    localparam READ_FIFO_DEPTH = 32;

    // axi lite interface
    logic       clk;
    logic       rst;
    logic[3:0]  s_axil_awaddr;
    logic[2:0]  s_axil_awprot;
    logic       s_axil_awvalid;
    logic       s_axil_awready;
    logic[31:0] s_axil_wdata;
    logic[3:0]  s_axil_wstrb;
    logic       s_axil_wvalid;
    logic       s_axil_wready;
    logic[1:0]  s_axil_bresp;
    logic       s_axil_bvalid;
    logic       s_axil_bready;
    logic[3:0]  s_axil_araddr;
    logic[2:0]  s_axil_arprot;
    logic       s_axil_arvalid;
    logic       s_axil_arready;
    logic[31:0] s_axil_rdata;
    logic[1:0]  s_axil_rresp;
    logic       s_axil_rvalid;
    logic       s_axil_rready;
    // i2c interface
    logic       i2c_scl_i;
    logic       i2c_scl_o;
    logic       i2c_scl_t;
    logic       i2c_sda_i;
    logic       i2c_sda_o;
    logic       i2c_sda_t;

    i2c_master_axil #(
        .DEFAULT_PRESCALE   (DEFAULT_PRESCALE),
        .FIXED_PRESCALE     (FIXED_PRESCALE),
        .CMD_FIFO           (CMD_FIFO),
        .CMD_FIFO_DEPTH     (CMD_FIFO_DEPTH),
        .WRITE_FIFO         (WRITE_FIFO),
        .WRITE_FIFO_DEPTH   (WRITE_FIFO_DEPTH),
        .READ_FIFO          (READ_FIFO),
        .READ_FIFO_DEPTH    (READ_FIFO_DEPTH)
    ) i2c_inst (
        .clk            (),
        .rst            (),
        // axi lite interface
        .s_axil_awaddr  (),
        .s_axil_awprot  (),
        .s_axil_awvalid (),
        .s_axil_awready (),
        .s_axil_wdata   (),
        .s_axil_wstrb   (),
        .s_axil_wvalid  (),
        .s_axil_wready  (),
        .s_axil_bresp   (),
        .s_axil_bvalid  (),
        .s_axil_bready  (),
        .s_axil_araddr  (),
        .s_axil_arprot  (),
        .s_axil_arvalid (),
        .s_axil_arready (),
        .s_axil_rdata   (),
        .s_axil_rresp   (),
        .s_axil_rvalid  (),
        .s_axil_rready  (),
        // i2c interface
        .i2c_scl_i      (),
        .i2c_scl_o      (),
        .i2c_scl_t      (),
        .i2c_sda_i      (),
        .i2c_sda_o      (),
        .i2c_sda_t      ()
    );
    
endmodule



/*
module i2c_master_axil #
(
    parameter DEFAULT_PRESCALE = 1,
    parameter FIXED_PRESCALE = 0,
    parameter CMD_FIFO = 1,
    parameter CMD_FIFO_DEPTH = 32,
    parameter WRITE_FIFO = 1,
    parameter WRITE_FIFO_DEPTH = 32,
    parameter READ_FIFO = 1,
    parameter READ_FIFO_DEPTH = 32
) (
    input  wire        clk,
    input  wire        rst,
    // axi lite interface
    input  wire [3:0]  s_axil_awaddr,
    input  wire [2:0]  s_axil_awprot,
    input  wire        s_axil_awvalid,
    output wire        s_axil_awready,
    input  wire [31:0] s_axil_wdata,
    input  wire [3:0]  s_axil_wstrb,
    input  wire        s_axil_wvalid,
    output wire        s_axil_wready,
    output wire [1:0]  s_axil_bresp,
    output wire        s_axil_bvalid,
    input  wire        s_axil_bready,
    input  wire [3:0]  s_axil_araddr,
    input  wire [2:0]  s_axil_arprot,
    input  wire        s_axil_arvalid,
    output wire        s_axil_arready,
    output wire [31:0] s_axil_rdata,
    output wire [1:0]  s_axil_rresp,
    output wire        s_axil_rvalid,
    input  wire        s_axil_rready,
    // i2c interface
    input  wire        i2c_scl_i,
    output wire        i2c_scl_o,
    output wire        i2c_scl_t,
    input  wire        i2c_sda_i,
    output wire        i2c_sda_o,
    output wire        i2c_sda_t
);
*/
