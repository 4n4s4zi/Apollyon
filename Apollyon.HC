#define GodBitsIns_OP_OFFSET 0x001D //offset in GodBitsIns where AND op value is set

U0 Hook(){}

U0 RNGPatch()
{
  //U32 GodBits_addr = &GodBits;
  //CFifoU8 *god_fifo_addr = &god.fifo;
  U64 GodBitsIns_addr = &GodBitsIns + GodBitsIns_OP_OFFSET;

  U64 data = *GodBitsIns_addr;
  data = data ^ 0x0000000000000100; //Mask to change 0x...01B0 to 0x...00B0 (backwards because endianness)
  *GodBitsIns_addr = data;  
}

U0 Main()
{
  RNGPatch;

}

Main;