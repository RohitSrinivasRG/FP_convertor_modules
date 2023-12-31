/**********************************************
 Author: Rohit Srinivas R G, M Kapil Shyam
 Email: CS23Z002@smail.iitm.ac.in, CS23Z064@smail.iitm.ac.in
**********************************************/

package fp32_cfloat143;

// Project Imports
import fp32_cfloat8_types::*;

// Defines
// `define verbose

// Interface Declarations
(*always_ready, always_enabled*)
interface Ifc_fpu_convert_fp32_cfloat143;
    method Action convert_fp32_cfloat143(FP32_t fp32_in, Bit#(6) bias);
    method CFLOAT143_t get_cfloat143();
endinterface: Ifc_fpu_convert_fp32_cfloat143

(*always_ready, always_enabled*)
interface Ifc_fpu_convert_cfloat143_fp32;
    method Action convert_cfloat143_fp32(CFLOAT143_t cfloat143_in, Bit#(6) bias);
    method FP32_t get_fp32();
endinterface: Ifc_fpu_convert_cfloat143_fp32

// Module to convert IEEE-754 FP32 to Tesla's CFLOAT8_143.
(* synthesize *)
module mk_fp32_cfloat143(Ifc_fpu_convert_fp32_cfloat143);

    // Register Declarations
    Reg#(FP32_t) rg_fp32 <- mkReg(FP32_t {
        sign : 0,
        exponent : 0,
        mantissa : 'h0
    });

    Reg#(CFLOAT143_t) rg_cfloat143 <-mkReg(CFLOAT143_t {
        sign : 0,
        exponent : 0,
        mantissa : 'h0
    });

    Reg#(Bit#(6)) rg_bias <- mkReg(0);

    Reg#(CFLOAT_FLAGS_t) rg_flags <- mkReg(CFLOAT_FLAGS_t {
        zero    : 0,
        invalid  : 0,
        denormal : 0,
        overflow : 0,
        underflow: 0
    });

    /* doc: rule: This rule will convert the FP32 number to CFLOAT Number. */
    rule rl_convert_fp32_cfloat8;

        /* doc: local: cfloat sign,exponent & mantissa local variables */
        CFLOAT143_t cfloat143 = CFLOAT143_t { sign: 0, exponent: 0, mantissa: 0 };

        Bit#(8) exponent_overflow_limit = ((rg_bias <= 6'd15) ? (8'd127 + zeroExtend(6'd15 - rg_bias)) : (8'd127 - zeroExtend(rg_bias - 6'd15)));
        
        `ifdef verbose
            $display("Exponent Overflow Limit: %d", exponent_overflow_limit);
        `endif

        Bit#(8) exponent_underflow_limit = (8'd128 - zeroExtend(rg_bias));

        `ifdef verbose
            $display("Exponent Underflow Limit: %d", exponent_underflow_limit);
        `endif

        CFLOAT_FLAGS_t lv_flags = CFLOAT_FLAGS_t {    
                                        zero      : pack(((|rg_fp32.exponent == 1'b0) && (|rg_fp32.mantissa == 1'b0)) || (rg_fp32.exponent < exponent_underflow_limit - 8'd5)),
                                        invalid   : pack((&rg_fp32.exponent == 1'b1)),
                                        denormal  : 1'b0,
                                        overflow  : pack((rg_fp32.exponent > exponent_overflow_limit) || ((rg_fp32.mantissa[22:20] == 3'b111) && (rg_fp32.exponent == exponent_overflow_limit) && |rg_fp32.mantissa[19:0] == 1'b1)),
                                        underflow : pack(rg_fp32.exponent < exponent_underflow_limit)
                                    };

        cfloat143.sign = rg_fp32.sign;

        /* Zero */
        if(lv_flags.zero == 1)
        begin
            cfloat143.exponent = 4'd0;
            cfloat143.mantissa = 3'd0;
        end
        /* Invalid or Overflow */
        else if((lv_flags.invalid == 1) || (lv_flags.overflow == 1))
        begin
            cfloat143.exponent = 4'b1111;
            cfloat143.mantissa = 3'b111;
        end
        /* Underflow and Denormal Numbers */
        else if(lv_flags.underflow == 1)
        begin
            if (rg_fp32.exponent < (exponent_underflow_limit - 8'd5))
            begin
                cfloat143.exponent = 4'd0;  
                cfloat143.mantissa = 3'd0;
            end
            else if (rg_fp32.exponent == (exponent_underflow_limit - 8'd5)) begin
                lv_flags.denormal = 1'd1;
                cfloat143.exponent = 4'd0;
                cfloat143.mantissa = 3'b001;
            end
            else if (rg_fp32.exponent == (exponent_underflow_limit - 8'd4))
            begin
                lv_flags.denormal = 1'b1;
                
                cfloat143.exponent = 4'd0;
                
                if (rg_fp32.mantissa[22:20] == 3'b000 || rg_fp32.mantissa[22:20] == 3'b001 || rg_fp32.mantissa[22:20] == 3'b010 || rg_fp32.mantissa[22:20] == 3'b011 )
                begin
                    cfloat143.mantissa = 3'b001;
                end
                else if (rg_fp32.mantissa[22:20] == 3'b100 || rg_fp32.mantissa[22:20] == 3'b101 || rg_fp32.mantissa[22:20] == 3'b110 || rg_fp32.mantissa[22:20] == 3'b111 )
                begin
                    cfloat143.mantissa = 3'b010;
                end
            end
            else if (rg_fp32.exponent == (exponent_underflow_limit - 8'd3))
            begin
                lv_flags.denormal = 1'b1;

                cfloat143.exponent = 4'd0;

                if (rg_fp32.mantissa[22:20] == 3'b000 || rg_fp32.mantissa[22:20] == 3'b001 ) 
                begin
                    cfloat143.mantissa = 3'b010;
                end
                else if (rg_fp32.mantissa[22:20] == 3'b010 || rg_fp32.mantissa[22:20] == 3'b011 || rg_fp32.mantissa[22:20] == 3'b100 || rg_fp32.mantissa[22:20] == 3'b101 )
                begin
                    cfloat143.mantissa = 3'b011;
                end
                else if (rg_fp32.mantissa[22:20] == 3'b110 || rg_fp32.mantissa[22:20] == 3'b111 )
                begin
                    cfloat143.mantissa = 3'b100;
                end
            end
            else if (rg_fp32.exponent == (exponent_underflow_limit - 8'd2))
            begin

                lv_flags.denormal = 1'b1;

                cfloat143.exponent = 4'd0;

                if (rg_fp32.mantissa[22:20] == 3'b000)
                begin
                    cfloat143.mantissa = 3'b100;
                end
                else if (rg_fp32.mantissa[22:20] == 3'b001 || rg_fp32.mantissa[22:20] == 3'b010)
                begin
                    cfloat143.mantissa = 3'b101;
                end
                else if (rg_fp32.mantissa[22:20] == 3'b011 || rg_fp32.mantissa[22:20] == 3'b100)
                begin
                    cfloat143.mantissa = 3'b110;
                end
                else if (rg_fp32.mantissa[22:20] == 3'b101 || rg_fp32.mantissa[22:20] == 3'b110 || rg_fp32.mantissa[22:20] == 3'b111 )
                begin
                    cfloat143.mantissa = 3'b111;
                end
            end
            else if (rg_fp32.exponent == (exponent_underflow_limit - 8'd1))
            begin
                if (rg_fp32.mantissa[22:20] == 3'b000 || rg_fp32.mantissa[22:20] == 3'b001 || rg_fp32.mantissa[22:20] == 3'b010  )
                begin
                    lv_flags.denormal = 1'b1;

                    cfloat143.exponent = 4'd0;
                    cfloat143.mantissa = 3'b111;
                end
                else if (rg_fp32.mantissa[22:20] == 3'b011 && rg_fp32.mantissa[19] == 1'b0) begin
                    lv_flags.denormal = 1'b1;

                    cfloat143.exponent = 4'd0;
                    cfloat143.mantissa = 3'b111;
                end
                else if ((rg_fp32.mantissa[22:20] == 3'b011 && rg_fp32.mantissa[19] == 1'b1) || rg_fp32.mantissa[22:20] == 3'b100 || rg_fp32.mantissa[22:20] == 3'b101 || rg_fp32.mantissa[22:20] == 3'b110 || rg_fp32.mantissa[22:20] == 3'b111 )
                begin
                    cfloat143.exponent = 4'd1;
                    cfloat143.mantissa = 3'b000;
                end
            end
        end
        /* Normal Numbers */
        else
        begin
            cfloat143.exponent = truncate(rg_fp32.exponent - 8'd127 + zeroExtend(rg_bias));
            Bit#(7) temp = {cfloat143.exponent,rg_fp32.mantissa[22:20]};
            if (rg_fp32.mantissa[19] == 1'b1) begin
              temp = temp + 7'd1;
              if (temp == 7'd0) 
                lv_flags.overflow = 1'd1;
            end
            cfloat143.exponent = temp[6:3];
            cfloat143.mantissa = temp[2:0];
        end

        rg_flags <= CFLOAT_FLAGS_t {    zero      : lv_flags.zero,
                                        invalid   : lv_flags.invalid,
                                        denormal  : lv_flags.denormal,
                                        overflow  : lv_flags.overflow,
                                        underflow : lv_flags.underflow
                                    };

        rg_cfloat143 <= CFLOAT143_t{  sign: cfloat143.sign,
                                      exponent: cfloat143.exponent,
                                      mantissa: cfloat143.mantissa
                                   };
    
    endrule: rl_convert_fp32_cfloat8

    method Action convert_fp32_cfloat143(FP32_t fp32_in, Bit#(6) bias);
        rg_fp32 <= fp32_in;
        rg_bias <= bias;
    endmethod: convert_fp32_cfloat143

    method CFLOAT143_t get_cfloat143();
        return rg_cfloat143;
    endmethod: get_cfloat143

endmodule: mk_fp32_cfloat143

// Module to convert Tesla's CFLOAT8_143 to IEEE-754 FP32.
(* synthesize *)
module mk_cfloat143_fp32(Ifc_fpu_convert_cfloat143_fp32);

    // Register Declarations
    Reg#(FP32_t) rg_fp32 <- mkReg(FP32_t {
        sign : 0,
        exponent : 0,
        mantissa : 'h0
    });

    Reg#(CFLOAT143_t) rg_cfloat143 <-mkReg(CFLOAT143_t {
        sign : 0,
        exponent : 0,
        mantissa : 'h0
    });

    Reg#(Bit#(6)) rg_bias <- mkReg(0);

    Reg#(FP32_FLAGS_t) rg_flags <- mkReg(FP32_FLAGS_t {
        denormal : 0,
        zero     : 0,
        qNaN     : 0,
        infinity : 0,
        sNaN     : 0
    });

    /* doc: rule: This rule will convert the CFLOAT Number to FP32 number. */
    rule rl_convert_cfloat8_fp32;

        FP32_t lv_fp32 = FP32_t{ sign: 0, exponent: 0, mantissa: 0};

        FP32_FLAGS_t lv_flags = FP32_FLAGS_t  {
                                        denormal : 0,
                                        zero     : 0,
                                        qNaN     : 0,
                                        infinity : 0,
                                        sNaN     : 0 
                                    };

        /* Zero */
        if(rg_cfloat143.exponent == 4'd0 && rg_cfloat143.mantissa == 3'd0)
        begin
            lv_flags.zero = 1;
            lv_fp32.sign = rg_cfloat143.sign;
            lv_fp32.exponent = zeroExtend(rg_cfloat143.exponent);
            lv_fp32.mantissa[22:20] = rg_cfloat143.mantissa;
        end
        /* Denormal Numbers */
        else if(|rg_cfloat143.exponent == 'd0 && |rg_cfloat143.mantissa != 'd0)
        begin
            lv_fp32.sign = rg_cfloat143.sign;

            if(rg_cfloat143.mantissa == 3'b001)
            begin
                lv_fp32.exponent = 128 - zeroExtend(rg_bias) - 4;
            end
            if(rg_cfloat143.mantissa == 3'b010)
            begin
                lv_fp32.exponent = 128 - zeroExtend(rg_bias) - 3;
            end
            if(rg_cfloat143.mantissa == 3'b011)
            begin
                lv_fp32.exponent = 128 - zeroExtend(rg_bias) - 3;
                lv_fp32.mantissa[22] = 1;
            end
            if(rg_cfloat143.mantissa == 3'b100)
            begin
                lv_fp32.exponent = 128 - zeroExtend(rg_bias) - 2;
            end
            if(rg_cfloat143.mantissa == 3'b101)
            begin
                lv_fp32.exponent = 128 - zeroExtend(rg_bias) - 2;
                lv_fp32.mantissa[22:21] = 2'b01;
            end
            if(rg_cfloat143.mantissa == 3'b110)
            begin
                lv_fp32.exponent = 128 - zeroExtend(rg_bias) - 2;
                lv_fp32.mantissa[22] = 1;
            end
            if(rg_cfloat143.mantissa == 3'b111)
            begin
                lv_fp32.exponent = 128 - zeroExtend(rg_bias) - 2;
                lv_fp32.mantissa[22:21] = 2'b11;
            end
        end
        /* Normal Numbers */
        else
        begin
            lv_fp32.sign = rg_cfloat143.sign;
            lv_fp32.exponent = zeroExtend(rg_cfloat143.exponent) - zeroExtend(rg_bias) + 127;
            lv_fp32.mantissa[22:20] = rg_cfloat143.mantissa;
        end

        rg_flags <= FP32_FLAGS_t {
                                    denormal : lv_flags.denormal ,
                                    zero     : lv_flags.zero     ,
                                    qNaN     : lv_flags.qNaN     ,
                                    infinity : lv_flags.infinity ,
                                    sNaN     : lv_flags.sNaN        
                                 };

        rg_fp32 <= FP32_t { 
                            sign      : lv_fp32.sign,
                            exponent  : lv_fp32.exponent,
                            mantissa  : lv_fp32.mantissa 
                          };
    
    endrule: rl_convert_cfloat8_fp32

    method Action convert_cfloat143_fp32(CFLOAT143_t cfloat143_in, Bit#(6) bias);
        rg_cfloat143 <= cfloat143_in;
        rg_bias <= bias;
    endmethod: convert_cfloat143_fp32

    method FP32_t get_fp32();
        return rg_fp32;
    endmethod: get_fp32

endmodule: mk_cfloat143_fp32

endpackage: fp32_cfloat143