#include "SystemStructures.h"
#include "System.h"
#include "Plt_Arm_Node_Force_Time.h"
#include "functor_plt_arm_node_time.h"
#include "functor_misc.h"

//tendril-like force
//The limit is plt_tndrl_intrct (small number)
//Force is applied to nodes
//We use the tndrl for imaging.

void Plt_Arm_Node_Force_Time(
	NodeInfoVecs& nodeInfoVecs,
	WLCInfoVecs& wlcInfoVecs,
	GeneralParams& generalParams,
	PltInfoVecs& pltInfoVecs,
	AuxVecs& auxVecs,
	RandVecs& randVecs) {


		thrust::fill(pltInfoVecs.nodeUnreducedForceX.begin(), pltInfoVecs.nodeUnreducedForceX.end(), 0.0);
		thrust::fill(pltInfoVecs.nodeUnreducedForceY.begin(), pltInfoVecs.nodeUnreducedForceY.end(), 0.0);
		thrust::fill(pltInfoVecs.nodeUnreducedForceZ.begin(), pltInfoVecs.nodeUnreducedForceZ.end(), 0.0);

		thrust::fill(pltInfoVecs.nodeReducedForceX.begin(), pltInfoVecs.nodeReducedForceX.end(), 0.0);
		thrust::fill(pltInfoVecs.nodeReducedForceY.begin(), pltInfoVecs.nodeReducedForceY.end(), 0.0);
		thrust::fill(pltInfoVecs.nodeReducedForceZ.begin(), pltInfoVecs.nodeReducedForceZ.end(), 0.0);

		//fill for image sort
    	thrust::fill(pltInfoVecs.nodeUnreducedId.begin(),pltInfoVecs.nodeUnreducedId.end(), generalParams.maxNodeCount);
		thrust::fill(pltInfoVecs.nodeImagingConnection.begin(),pltInfoVecs.nodeImagingConnection.end(), generalParams.maxNodeCount);
		thrust::counting_iterator<unsigned> counter(0);



		unsigned _seedplt = rand();

		thrust::counting_iterator<unsigned> index_sequence_plt_begin(_seedplt);
		thrust::transform(thrust::device, index_sequence_plt_begin, index_sequence_plt_begin + (generalParams.maxPltCount),
		randVecs.bucketPltStart.begin(), psrunifgen(0.0, 1.0));
        //Call the plt force on nodes functor
		//WARNING:
		//writes to unreduced vector entries from 0 to maxPltCount*plt_tndrl_intrct
        thrust::transform(
        	thrust::make_zip_iterator(
        		thrust::make_tuple(
					counter,
					pltInfoVecs.tndrlNodeNum.begin(),
					auxVecs.idPlt_bucket.begin(),
					randVecs.bucketPltStart.begin(),
        			pltInfoVecs.pltLocX.begin(),
        			pltInfoVecs.pltLocY.begin(),
        			pltInfoVecs.pltLocZ.begin(),
					pltInfoVecs.pltForceX.begin(),
					pltInfoVecs.pltForceY.begin(),
					pltInfoVecs.pltForceZ.begin())),
        	thrust::make_zip_iterator(
        		thrust::make_tuple(
					counter,
					pltInfoVecs.tndrlNodeNum.begin(),
					auxVecs.idPlt_bucket.begin(),
					randVecs.bucketPltStart.begin(),
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
            functor_plt_arm_node_time(
				generalParams.currentTime,
				generalParams.CLM,
				generalParams.wlc_factor, //this is NKBT/P
				generalParams.distribute_plt_force,

                generalParams.plt_tndrl_intrct,
                generalParams.pltRForce,
                generalParams.pltForce,
                generalParams.pltR,

                generalParams.maxPltCount,
                generalParams.fiberDiameter,
		        generalParams.maxNodeCount,
                generalParams.maxIdCountFlag,
                generalParams.maxNeighborCount,
				generalParams.pltrelease,
				generalParams.plthandhand,
				generalParams.strainswitch,

                thrust::raw_pointer_cast(nodeInfoVecs.nodeLocX.data()),
                thrust::raw_pointer_cast(nodeInfoVecs.nodeLocY.data()),
                thrust::raw_pointer_cast(nodeInfoVecs.nodeLocZ.data()),
                thrust::raw_pointer_cast(pltInfoVecs.nodeUnreducedForceX.data()),
                thrust::raw_pointer_cast(pltInfoVecs.nodeUnreducedForceY.data()),
                thrust::raw_pointer_cast(pltInfoVecs.nodeUnreducedForceZ.data()),

                thrust::raw_pointer_cast(pltInfoVecs.nodeUnreducedId.data()),
                thrust::raw_pointer_cast(pltInfoVecs.pltImagingConnection.data()),

                thrust::raw_pointer_cast(auxVecs.id_value_expanded_plt_intc.data()),//network neighbors
                thrust::raw_pointer_cast(auxVecs.keyBegin_plt_intc.data()),
                thrust::raw_pointer_cast(auxVecs.keyEnd_plt_intc.data()),

                thrust::raw_pointer_cast(pltInfoVecs.tndrlNodeId.data()),
                thrust::raw_pointer_cast(pltInfoVecs.tndrlNodeType.data()),
                thrust::raw_pointer_cast(nodeInfoVecs.isNodeInPltVol.data()),
				thrust::raw_pointer_cast(wlcInfoVecs.globalNeighbors.data()),

                thrust::raw_pointer_cast(wlcInfoVecs.lengthZero.data()),
                thrust::raw_pointer_cast(wlcInfoVecs.numOriginalNeighborsNodeVector.data()),

                thrust::raw_pointer_cast(pltInfoVecs.pltLocX.data()),
                thrust::raw_pointer_cast(pltInfoVecs.pltLocY.data()),
                thrust::raw_pointer_cast(pltInfoVecs.pltLocZ.data())) );


		/*if (generalParams.iterationCounter==100){
			for (unsigned i =0; i < pltInfoVecs.nodeUnreducedId.size(); i++){
					unsigned id_node = pltInfoVecs.nodeUnreducedId[i];
					unsigned id_plt = pltInfoVecs.pltImagingConnection[i];
					if (id_node < generalParams.maxNodeCount){
						std::cout<< "id_node: " << id_node << " id_plt: " << id_plt<< std::endl;
						double x_node = nodeInfoVecs.nodeLocX[id_node];
						double y_node = nodeInfoVecs.nodeLocY[id_node];
						double z_node = nodeInfoVecs.nodeLocZ[id_node];
						double x_plt = pltInfoVecs.pltLocX[id_plt];
						double y_plt = pltInfoVecs.pltLocY[id_plt];
						double z_plt = pltInfoVecs.pltLocZ[id_plt];
	
						double dist = std::sqrt((x_node-x_plt)*(x_node-x_plt)
												+(y_node-y_plt)*(y_node-y_plt)
												+(z_node-z_plt)*(z_node-z_plt));
						std::cout<<"distance between plt and node: " << dist << std::endl;
					}
				}
			}	*/
        //now call a sort by key followed by a reduce by key to figure out which nodes are have force applied.
		//then make a functor that takes the id and force (4 tuple) 
		//and takes that force and adds it to the id'th entry in nodeInfoVecs.nodeForceX,Y,Z

		unsigned total_num_arms = pltInfoVecs.nodeImagingConnection.size();

		//correspondance kept between nodeUnreducedId and pltImagingConnection
		//sort by node ids
		//default value is maxNodeCount so increasing order sort is needed
		thrust::sort_by_key(pltInfoVecs.nodeUnreducedId.begin(), pltInfoVecs.nodeUnreducedId.end(),
        			thrust::make_zip_iterator(
        				thrust::make_tuple(
							pltInfoVecs.pltImagingConnection.begin(),
        					pltInfoVecs.nodeUnreducedForceX.begin(),
        					pltInfoVecs.nodeUnreducedForceY.begin(),
							pltInfoVecs.nodeUnreducedForceZ.begin())), thrust::less<unsigned>());

		//now nodeImagingConnection contains the corresponding nodes to pltImagingConnection
    	thrust::copy(pltInfoVecs.nodeUnreducedId.begin(),pltInfoVecs.nodeUnreducedId.begin() + total_num_arms, pltInfoVecs.nodeImagingConnection.begin());
		

    	pltInfoVecs.numConnections = thrust::count_if(
    	    pltInfoVecs.nodeImagingConnection.begin(),
    	    pltInfoVecs.nodeImagingConnection.end(), is_less_than(generalParams.maxNodeCount) );


		//reduce and apply force
 		unsigned endKey = thrust::get<0>(
 			thrust::reduce_by_key(
 				pltInfoVecs.nodeUnreducedId.begin(),
 				pltInfoVecs.nodeUnreducedId.begin() + total_num_arms,
 			thrust::make_zip_iterator(
 				thrust::make_tuple(
 					pltInfoVecs.nodeUnreducedForceX.begin(),
 					pltInfoVecs.nodeUnreducedForceY.begin(),
 					pltInfoVecs.nodeUnreducedForceZ.begin())),
 			pltInfoVecs.nodeReducedId.begin(),
 			thrust::make_zip_iterator(
 				thrust::make_tuple(
 					pltInfoVecs.nodeReducedForceX.begin(),
 					pltInfoVecs.nodeReducedForceY.begin(),
 					pltInfoVecs.nodeReducedForceZ.begin())),
 			thrust::equal_to<unsigned>(), CVec3Add())) - pltInfoVecs.nodeReducedId.begin();//binary_pred, binary_op


        thrust::for_each(
        	thrust::make_zip_iterator(//1st begin
        		thrust::make_tuple(
        			pltInfoVecs.nodeReducedId.begin(),
        			pltInfoVecs.nodeReducedForceX.begin(),
        			pltInfoVecs.nodeReducedForceY.begin(),
        			pltInfoVecs.nodeReducedForceZ.begin())),
        	thrust::make_zip_iterator(//1st end
        		thrust::make_tuple(
        			pltInfoVecs.nodeReducedId.begin(),
        			pltInfoVecs.nodeReducedForceX.begin(),
        			pltInfoVecs.nodeReducedForceY.begin(),
        			pltInfoVecs.nodeReducedForceZ.begin())) + endKey,
			functor_add_UCVec3_CVec3(
				generalParams.maxNodeCount,
        		thrust::raw_pointer_cast(nodeInfoVecs.nodeForceX.data()),
        		thrust::raw_pointer_cast(nodeInfoVecs.nodeForceY.data()),
        		thrust::raw_pointer_cast(nodeInfoVecs.nodeForceZ.data())));

};
