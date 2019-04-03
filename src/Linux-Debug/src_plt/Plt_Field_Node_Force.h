#ifndef PLT_FIELD_NODE_FORCE_H_
#define PLT_FIELD_NODE_FORCE_H_


struct NodeInfoVecs;
struct WLCInfoVecs;
struct GeneralParams;
struct PltInfoVecs;
struct AuxVecs;

//Force field-like mode
void Plt_Field_Node_Force(
  NodeInfoVecs& nodeInfoVecs,
	WLCInfoVecs& wlcInfoVecs,
	GeneralParams& generalParams,
  PltInfoVecs& pltInfoVecs,
  AuxVecs& auxVecs);


  #endif