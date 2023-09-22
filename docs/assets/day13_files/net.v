/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : T-2022.03-SP5-1
// Date      : Fri Sep 22 17:52:53 2023
/////////////////////////////////////////////////////////////


module ringcounter ( clk, rst, count );
  output [5:0] count;
  input clk, rst;
  wire   \*Logic1* , \*Logic0* , n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11,
         n12, n26, n27, n28, n29, n30, n31;

  sky130_fd_sc_hd__dfbbp_1 \count_reg[0]  ( .D(\*Logic1* ), .CLK(clk), .SET_B(
        n12), .RESET_B(n11), .Q(count[0]), .Q_N(n30) );
  sky130_fd_sc_hd__dfbbp_1 \count_reg[1]  ( .D(\*Logic0* ), .CLK(clk), .SET_B(
        n10), .RESET_B(n9), .Q(count[1]), .Q_N(n29) );
  sky130_fd_sc_hd__dfbbp_1 \count_reg[2]  ( .D(\*Logic0* ), .CLK(clk), .SET_B(
        n8), .RESET_B(n7), .Q(count[2]), .Q_N(n27) );
  sky130_fd_sc_hd__dfbbp_1 \count_reg[3]  ( .D(\*Logic0* ), .CLK(clk), .SET_B(
        n6), .RESET_B(n5), .Q(count[3]), .Q_N(n26) );
  sky130_fd_sc_hd__dfbbp_1 \count_reg[4]  ( .D(\*Logic0* ), .CLK(clk), .SET_B(
        n4), .RESET_B(n3), .Q(count[4]), .Q_N(n31) );
  sky130_fd_sc_hd__dfbbp_1 \count_reg[5]  ( .D(\*Logic0* ), .CLK(clk), .SET_B(
        n2), .RESET_B(n1), .Q(count[5]), .Q_N(n28) );
  sky130_fd_sc_hd__conb_1 U28 ( .LO(\*Logic0* ), .HI(\*Logic1* ) );
  sky130_fd_sc_hd__nand2_1 U29 ( .A(rst), .B(n30), .Y(n9) );
  sky130_fd_sc_hd__nand2b_1 U30 ( .A_N(n29), .B(rst), .Y(n8) );
  sky130_fd_sc_hd__nand2_1 U31 ( .A(n29), .B(rst), .Y(n7) );
  sky130_fd_sc_hd__nand2b_1 U32 ( .A_N(n27), .B(rst), .Y(n6) );
  sky130_fd_sc_hd__nand2_1 U33 ( .A(n27), .B(rst), .Y(n5) );
  sky130_fd_sc_hd__nand2b_1 U34 ( .A_N(n26), .B(rst), .Y(n4) );
  sky130_fd_sc_hd__nand2_1 U35 ( .A(n26), .B(rst), .Y(n3) );
  sky130_fd_sc_hd__nand2b_1 U36 ( .A_N(n31), .B(rst), .Y(n2) );
  sky130_fd_sc_hd__nand2b_1 U37 ( .A_N(n28), .B(rst), .Y(n12) );
  sky130_fd_sc_hd__nand2_1 U38 ( .A(n28), .B(rst), .Y(n11) );
  sky130_fd_sc_hd__nand2b_1 U39 ( .A_N(n30), .B(rst), .Y(n10) );
  sky130_fd_sc_hd__nand2_1 U40 ( .A(n31), .B(rst), .Y(n1) );
endmodule

