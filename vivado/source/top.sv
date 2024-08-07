// The purpose of this module is to test the i2c_maste_axil module in hardware.

module top (
    input   logic       clkin100,
    //
    output  logic       usb_uart_txd,
    input   logic       usb_uart_rxd,
    //
    output  logic       i2c_scl,
    output  logic       i2c_sda
);

    logic clk;
    assign clk = clkin100;
    
    logic reset;
    logic [15:0] reset_vec = 16'hFFFF;
    always_ff @(posedge clk) begin
        reset_vec <= {1'b0, reset_vec[15:1]};
    end
    assign reset  =  reset_vec[0];
    assign resetn = ~reset_vec[0];

    // i2c interface
    logic i2c_scl_i, i2c_scl_o, i2c_scl_t;
    logic i2c_sda_i, i2c_sda_o, i2c_sda_t;

    logic           axi_aclk;
    logic           axi_aresetn;    
    logic [31:0]    M00_araddr;
    logic [2:0]     M00_arprot;
    logic           M00_arready;
    logic           M00_arvalid;
    logic [31:0]    M00_awaddr;
    logic [2:0]     M00_awprot;
    logic           M00_awready;
    logic           M00_awvalid;
    logic           M00_bready;
    logic [1:0]     M00_bresp;
    logic           M00_bvalid;
    logic [31:0]    M00_rdata;
    logic           M00_rready;
    logic [1:0]     M00_rresp;
    logic           M00_rvalid;
    logic [31:0]    M00_wdata;
    logic           M00_wready;
    logic [3:0]     M00_wstrb;
    logic           M00_wvalid;

    localparam DEFAULT_PRESCALE = 1;
    localparam FIXED_PRESCALE = 0;
    localparam CMD_FIFO = 1;
    localparam CMD_FIFO_DEPTH = 32;
    localparam WRITE_FIFO = 1;
    localparam WRITE_FIFO_DEPTH = 32;
    localparam READ_FIFO = 1;
    localparam READ_FIFO_DEPTH = 32;

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
        .clk            (axi_aclk),
        .rst            (~axi_aresetn),
        // axi lite interface
        .s_axil_awaddr  (M00_awaddr[3:0]),
        .s_axil_awprot  (M00_awprot),
        .s_axil_awvalid (M00_awvalid),
        .s_axil_awready (M00_awready),
        .s_axil_wdata   (M00_wdata),
        .s_axil_wstrb   (M00_wstrb),
        .s_axil_wvalid  (M00_wvalid),
        .s_axil_wready  (M00_wready),
        .s_axil_bresp   (M00_bresp),
        .s_axil_bvalid  (M00_bvalid),
        .s_axil_bready  (M00_bready),
        .s_axil_araddr  (M00_araddr[3:0]),
        .s_axil_arprot  (M00_arprot),
        .s_axil_arvalid (M00_arvalid),
        .s_axil_arready (M00_arready),
        .s_axil_rdata   (M00_rdata),
        .s_axil_rresp   (M00_rresp),
        .s_axil_rvalid  (M00_rvalid),
        .s_axil_rready  (M00_rready),
        // i2c interface
        .i2c_scl_i      (i2c_scl_i),
        .i2c_scl_o      (i2c_scl_o),
        .i2c_scl_t      (i2c_scl_t),
        .i2c_sda_i      (i2c_sda_i),
        .i2c_sda_o      (i2c_sda_o),
        .i2c_sda_t      (i2c_sda_t)
    );
    
    OBUFT #(.DRIVE(12), .IOSTANDARD("DEFAULT"), .SLEW("SLOW")) OBUFT_i2c_scl (.O(i2c_scl), .I(i2c_scl_i), .T(i2c_scl_t));
    OBUFT #(.DRIVE(12), .IOSTANDARD("DEFAULT"), .SLEW("SLOW")) OBUFT_i2c_sda (.O(i2c_sda), .I(i2c_sda_i), .T(i2c_sda_t));
    

    // Microblaze Processor Block Diagram
    system system_i (
        .clk(clk),
        .reset_n        (resetn),
        //        
        .usb_uart_rxd   (usb_uart_rxd),
        .usb_uart_txd   (usb_uart_txd),
        //
        .axi_aclk       (axi_aclk),
        .axi_aresetn    (axi_aresetn),
        .M00_araddr     (M00_araddr),
        .M00_arprot     (M00_arprot),
        .M00_arready    (M00_arready),
        .M00_arvalid    (M00_arvalid),
        .M00_awaddr     (M00_awaddr),
        .M00_awprot     (M00_awprot),
        .M00_awready    (M00_awready),
        .M00_awvalid    (M00_awvalid),
        .M00_bready     (M00_bready),
        .M00_bresp      (M00_bresp),
        .M00_bvalid     (M00_bvalid),
        .M00_rdata      (M00_rdata),
        .M00_rready     (M00_rready),
        .M00_rresp      (M00_rresp),
        .M00_rvalid     (M00_rvalid),
        .M00_wdata      (M00_wdata),
        .M00_wready     (M00_wready),
        .M00_wstrb      (M00_wstrb),
        .M00_wvalid     (M00_wvalid)
    );
    
    // debug
    i2c_ila i2c_ila_inst (.clk(axi_aclk), .probe0({i2c_scl_i, i2c_scl_o, i2c_scl_t, i2c_sda_i, i2c_sda_o, i2c_sda_t}), .probe1({M00_awaddr[3:0], M00_wvalid, M00_araddr[3:0], M00_rvalid})); // 6, 10
        
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
