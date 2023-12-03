/**********************************************
 Author: Rohit Srinivas R G, M Kapil Shyam
 Email: CS23Z002@smail.iitm.ac.in, CS23Z064@smail.iitm.ac.in
**********************************************/

package Testbench;

// ================================================================
// Project imports

import fp32_cfloat8_types ::*;
import fp32_cfloat143 ::*;

// ================================================================

interface Ifc_Testbench;
  
endinterface

// (* synthesize *)
// module mkTestbench (Ifc_Testbench);

(* synthesize *)
module mkTestbench (Empty);
  Ifc_fp32_cfloat152 mod <- mk_fp32_cfloat152;
  Reg#(Bit#(32)) rg_counter <- mkReg(0);
  
  rule rl_count;
    rg_counter <= rg_counter + 1;
  endrule
  
  // rule rl_sample_1 (rg_counter <= 32'd1000);
  rule rl_sample_1 ;
    // mod.fp32_in(FP32_t {sign: 1'b0,
    //                     exponent: 8'h5,
    //                     mantissa: 23'h0A});
    mod.fp32_in(unpack(32'b01000000011100000000000000000000));
    mod.bias_in(6'd0);
  endrule

  // rule rl_sample_2 (rg_counter >= 32'd1000);
  //   // mod.fp32_in(unpack(32'b01100001111111111111111111111111));
  //   mod.fp32_in(unpack(32'b01000000000000000000000000000000));
  //   mod.bias_in(6'd0);
  // endrule
   
endmodule

// ================================================================

endpackage
           
