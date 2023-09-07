module tt_um_onehot(
    input  wire [7:0] ui_in,    // Dedicated inputs - connected to the input switches for clk_selector and pattern_sel
    output wire [7:0] uo_out,   // Dedicated outputs - connected to the 7 LEDs
    input  wire [7:0] uio_in,   // IOs: Bidirectional Input path
    output wire [7:0] uio_out,  // IOs: Bidirectional Output path
    output wire [7:0] uio_oe,   // IOs: Bidirectional Enable path (active high: 0=input, 1=output)
    input  wire       ena,      // will go high when the design is enabled, not used circuit can be turned off when pattern_sel = 0
    input  wire       clk,      // clock
    input  wire       rst_n     // reset_n - low to reset
);
  assign uo_out[0]= ~ui_in[0] & ~ui_in[1] & ~ui_in[2];
  assign uo_out[1]= ui_in[0] & ~ui_in[1] & ~ui_in[2];
  assign uo_out[2]= ~ui_in[0] & ui_in[1] & ~ui_in[2];
  assign uo_out[3]= ui_in[0] & ui_in[1] & ~ui_in[2];
  assign uo_out[4]= ~ui_in[0] & ~ui_in[1] & ui_in[2];
  assign uo_out[5]= ui_in[0] & ~ui_in[1] & ui_in[2];
  assign uo_out[6]= ~ui_in[0] & ui_in[1] & ui_in[2];
  assign uo_out[7]= ui_in[0] & ui_in[1] & ui_in[2];
    assign [7:0]uio_out = 8'b00000000;
    assign [7:0]uio_oe = 8'b00000000;
endmodule
