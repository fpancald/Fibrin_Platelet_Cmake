#include "SystemStructures.h"
#include "Plt_Arm_Plt_Force.h"
#include "System.h"
#include "functor_plt_arm_plt.h"


//tendril-like force
//The limit is plt_tndrl_intrct (small number)
//Force is applied to platelets
//We do not use this tndrl for imaging. 

void Plt_Arm_Plt_Force(
	GeneralParams& generalParams,
	PltInfoVecs& pltInfoVecs,
	AuxVecs& auxVecs) {


	//for (unsigned i = 0; i < auxVecs.idPlt_bucket.size(); i++)
	//	std::cout<<"plt bucket pltonplt: "<<auxVecs.idPlt_bucket[i] << std::endl;
        
	thrust::counting_iterator<unsigned> counter(0);

    thrust::transform(
      	thrust::make_zip_iterator(
        	thrust::make_tuple(
				counter,
        		auxVecs.idPlt_bucket.begin(),
          		pltInfoVecs.pltLocX.begin(),
          		pltInfoVecs.pltLocY.begin(),
          		pltInfoVecs.pltLocZ.begin(),
                pltInfoVecs.pltForceX.begin(),
                pltInfoVecs.pltForceY.begin(),
                pltInfoVecs.pltForceZ.begin())),
    thrust::make_zip_iterator(
        thrust::make_tuple(
				counter,
        		auxVecs.idPlt_bucket.begin(),
          		pltInfoVecs.pltLocX.begin(),
          		pltInfoVecs.pltLocY.begin(),
          		pltInfoVecs.pltLocZ.begin(),
                pltInfoVecs.pltForceX.begin(),
                pltInfoVecs.pltForceY.begin(),
                pltInfoVecs.pltForceZ.begin())) + generalParams.maxPltCount,
    thrust::make_zip_iterator(
      	thrust::make_tuple(
				//DOES NOT RESET FORCES
        		pltInfoVecs.pltForceX.begin(),
        		pltInfoVecs.pltForceY.begin(),
        		pltInfoVecs.pltForceZ.begin())),

        functor_plt_arm_plt(
            generalParams.plt_tndrl_intrct,
            generalParams.pltRForce,
            generalParams.pltForce,
            generalParams.pltR,

            generalParams.maxPltCount,
			generalParams.maxIdCountFlag,
			generalParams.pltrelease,

            thrust::raw_pointer_cast(pltInfoVecs.pltLocX.data()),
            thrust::raw_pointer_cast(pltInfoVecs.pltLocY.data()),
            thrust::raw_pointer_cast(pltInfoVecs.pltLocZ.data()),

            thrust::raw_pointer_cast(auxVecs.idPlt_value_expanded.data()),//plt neighbors
            thrust::raw_pointer_cast(auxVecs.keyPltBegin.data()),
            thrust::raw_pointer_cast(auxVecs.keyPltEnd.data()),
			
            thrust::raw_pointer_cast(pltInfoVecs.tndrlNodeId.data()),
            thrust::raw_pointer_cast(pltInfoVecs.tndrlNodeType.data()) ));

	};