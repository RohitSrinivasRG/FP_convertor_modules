/**********************************************
 Author: Rohit Srinivas R G, M Kapil Shyam
 Email: CS23Z002@smail.iitm.ac.in, CS23Z064@smail.iitm.ac.in
**********************************************/
package fp32_bfloat16
// General Imports
import Clocks :: *;

// Project Imports
import fp32_cfloat8_types ::*;

(*always_ready, always_enabled*)

(*always_ready, always_enabled*)
interface Ifc_fp32_bfloat16;
  method Action fp32_in(FP32_t fp_in);
  method BFLOAT16_t bfloat16_out; 
endinterface: Ifc_fp32_cfloat152

module mk_fp32_bfloat16(Ifc_fp32_bfloat16);
  /* doc: reg: contains the fp32 representation */
  Reg#(FP32_t) rg_fp32 <- mkReg(FP32_t {sign     :0,
					                              exponent :0,
					                              mantissa :0});
  
  /* doc: reg: contains the bfloat16 representation */
  Reg#(BFLOAT16_t) rg_bfloat16 <- mkReg(BFLOAT16_t {sign     :0,
						                                        exponent :0,
						                                        mantissa :0});

  /* doc: reg: contains the flags for the conversion */
  Reg#(FLAGS_t) rg_flags <- mkReg(FLAGS_t {denormal  : 0,
                                           zero      : 0,
                                           qNaN      : 0,
                                           infinity  : 0,
                                           sNaN      : 0});


    /* doc: rule: rule to convert fp32 to bfloat16
     * Implicit cond: None
     * Explicit cond: None
     * Desc: conversion from fp32 to bfloat16 with round-to-nearest conversion strategy
     */
     
    rule rl_convert_fp32_bfloat16;
      
      BFLOAT16_t bfloat16 = BFLOAT16_t {sign     : 0,
                                        exponent : 0,
                                        mantissa : 0});
      FLAGS_t flags;
      
       
      /* Computing flags */
      flags.zero     = pack(|rg_fp32.exponent == 1'b0 && |rg_fp32.mantissa == 1'b0);
      flags.infinity = pack(|rg_fp32.exponent == 1'b1);
      flags.qNaN     = pack(|rg_fp32.exponent == 1'b1 && rg_fp32.mantissa == 23'b10000000000000000000001);
      flags.sNaN     = pack(|rg_fp32.exponent == 1'b1 && rg_fp32.mantissa == 23'b00000000000000000000001);
      flags.denormal = 1'b0;


      /* Zero */
      if(flags.zero == 1'b1) begin
        bfloat16.exponent = 8'd0;
        bfloat16.mantissa = 7'd0;
      end
      /* Infinity */
      else if (flags.infinity == 1'b1) begin
        bfloat16.exponent = 8'b11111111;
        bfloat16.mantissa = 7'd0;
      end
      //TODO Check the difference between qNaN and sNaN
      /* qNaN */
      else if(flags.qNaN == 1'b1) begin
        bfloat16.exponent = 8'b11111111;
        bfloat16.mantissa == 7'b1000001
      end
      /* sNaN */
      else if(flags.sNaN == 1'b1) begin
        bfloat16.exponent = 8'b11111111;
        bfloat16.mantissa == 7'b0000001
      end
      /* Normal Numbers*/
      else begin
        bfloat16.exponent = rg_fp32.exponent;
        Bit#(15) temp = {bfloat16.exponent,rg_fp32.mantissa[22:16]};
        if (rg_fp32.mantissa[16] == 1'b1) begin
          temp = temp + 15'd1;
        end
        bfloat16.exponent = temp[15:8];
        cfloat1.mantissa = temp[7:0];
      end
    



  endrule: rl_convert_fp32_bfloat16
endmodule: mk_fp32_bfloat16
  



(*always_ready, always_enabled*)
interface Ifc_bfloat16_fp32;
    method Action bfloat (BFLOAT16_t bfloat_in);
    method FP32_t fp32_out;
endinterface: Ifc_bfloat16_fp32

(* synthesize *)
module mk_bfloat16_fp32(Ifc_cfloat16_fp32);
 
  /* doc: reg: contains the fp32 representation */
  Reg#(FP32_t) rg_fp32 <- mkReg(FP32_t {sign     :0,
          exponent :0,
          mantissa :0});
  
  /* doc: reg: contains the bfloat16 representation */
  Reg#(BFLOAT16_t) rg_bfloat16 <- mkReg(BFLOAT16_t {sign     :0,
                                        exponent :0,
                                        mantissa :0});
  
  /* doc: reg: contains the flags */
  Reg#(FP32_FLAGS_t) rg_flags <- mkReg(FP32_FLAGS_t {denormal  : 0,
                                                     zero      : 0,
                                                     qNaN      : 0,
                                                     infinity  : 0,
                                                     sNaN      : 0});
  
  
  rule rl_convert_bfloat16_fp32;
    FP32_FLAGS_t fp32_flags = FP32_FLAGS_t {denormal  : 0,
                                            zero      : 0,
                                            qNaN      : 0,
                                            infinity  : 0,
                                            sNaN      : 0};
    
    FP32_t fp32 = FP32_t {sign     :0,
                          exponent :0,
                          mantissa :0};
    
    fp32.sign = rg_bfloat16.sign;

    if(rg_bfloat16.exponent == 8'b00000000 && rg_bfloat16.mantissa == 7'b0000000)
    begin
      fp32_flags.zero = 1;
      fp32.exponent = rg_bfloat16.exponent;
      fp32.mantissa[22:16] = rg_bfloat16.mantissa;
    end
    else if(rg_bfloat16.exponent == 8'b11111111 && rg_bfloat16.mantissa == 7'b0000000)
    begin
      fp32_flags.infinity = 1;
      fp32.exponent = rg_bfloat16.exponent;
      fp32.mantissa[22:16] = rg_bfloat16.mantissa;
    end
    else if(rg_bfloat16.exponent == 8'b11111111 && rg_bfloat16.mantissa == 7'b1000001)
    begin
      fp32_flags.qNaN = 1;
      fp32.exponent = rg_bfloat16.exponent;
      fp32.mantissa = 23'b10000000000000000000001;
    end
    else if(rg_bfloat16.exponent == 8'b11111111 && rg_bfloat16.mantissa == 7'b0000001)
    begin
      fp32_flags.sNaN = 1;
      fp32.exponent = rg_bfloat16.exponent;
      fp32.mantissa = 23'b00000000000000000000001;
    end
    // else if(rg_bfloat16.exponent == 8'b00000000 && rg_bfloat16.mantissa != 7'b0000001 && rg_bfloat16.mantissa != 7'b1000001 && rg_bfloat,mantissa)
    // begin
    //   fp32_flags.denormal = 1;
    //   fp32.exponent = rg_bfloat16.exponent;
    //   fp32.mantissa[22:16] = rg_fp32.mantissa;
    // end
    else
    begin
      fp32.exponent = rg_bfloat16.exponent;
      fp32.mantissa[22:16] = rg_fp32.mantissa;
    end
    
    rg_fp32 <= FP32_t {sign     : fp32.sign,
                       exponent : fp32.exponent,
                       mantissa : fp32.mantissa};
    
    rg_flags <= FP32_FLAGS_t {denormal : fp32_flags.denormal,
                              zero     : fp32_flags.zero,
                              qNaN     : fp32_flags.qNaN,
                              infinity : fp32_flags.infinity,
                              sNaN     : fp32_flags.sNaN};
    
  endrule: rl_convert_bfloat16_fp32

  
  method Action bfloat16_in (BFLOAT16_t bfloat16_in);
    rg_bfloat16 <= bfloat16_in;
  endmethod: bfloat16_in
  
  method FP32_t fp32_out;
    return rg_fp32;
  endmethod: fp32_out
  
  
endmodule: mk_bfloat16_fp32

endpackage: fp32_bfloat16