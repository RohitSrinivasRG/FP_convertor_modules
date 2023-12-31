/**********************************************
 Author: Rohit Srinivas R G, M Kapil Shyam
 Email: CS23Z002@smail.iitm.ac.in, CS23Z064@smail.iitm.ac.in
**********************************************/

package fp32_bfloat16_types;


// Struct for fp32 format
typedef struct{
  Bit#(1) sign;
  Bit#(8) exponent;
  Bit#(23) mantissa;
}FP32_t deriving(Bits,Eq);

// Struct for cfloat8_152 format
typedef struct{
  Bit#(1) sign;
  Bit#(8) exponent;
  Bit#(7) mantissa;
}BFLOAT16_t deriving(Bits,Eq);

typedef struct{
  Bit#(1) denormal;
  Bit#(1) zero;
  Bit#(1) qNaN;
  Bit#(1) infinity;
  Bit#(1) sNaN;
}FLAGS_t deriving(Bits,Eq);


endpackage: fp32_bfloat16_types
