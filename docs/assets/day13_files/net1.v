/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : T-2022.03-SP5-1
// Date      : Fri Sep 22 14:37:34 2023
/////////////////////////////////////////////////////////////


module clk_gate ( gated_clk, free_clk, func_en, pwr_en, gating_override );
  input free_clk, func_en, pwr_en, gating_override;
  output gated_clk;
  wire   gated_clk;
  assign gated_clk = free_clk;

endmodule

