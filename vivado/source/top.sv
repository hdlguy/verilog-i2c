// The purpose of this module is to test the i2c_maste_axil module in hardware.

module top (
    input   logic       clkin100,
    //
    output  logic       usb_uart_txd,
    input   logic       usb_uart_rxd,
    //
    inout   logic       i2c_scl,
    inout   logic       i2c_sda,
    //
    output  logic       led_blue, led_green, led_yellow, led_red
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
    
    logic[3:0] led;
    assign led = 4'b1111;
    assign {led_blue, led_green, led_yellow, led_red} = led;

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
    
    IOBUF #(.DRIVE(12), .IBUF_LOW_PWR("TRUE"), .IOSTANDARD("DEFAULT"), .SLEW("SLOW")) IOBUF_i2c_scl (.O(i2c_scl_i), .IO(i2c_scl), .I(i2c_scl_o), .T(i2c_scl_t));
    IOBUF #(.DRIVE(12), .IBUF_LOW_PWR("TRUE"), .IOSTANDARD("DEFAULT"), .SLEW("SLOW")) IOBUF_i2c_sda (.O(i2c_sda_i), .IO(i2c_sda), .I(i2c_sda_o), .T(i2c_sda_t));
    

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
    i2c_ila i2c_ila_inst (.clk(axi_aclk), .probe0({i2c_scl_i, i2c_scl_t, i2c_sda_i, i2c_sda_t})); // 4
        
endmodule

