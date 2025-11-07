pragma solidity ^0.8.17;

import './RawMaterial.sol';
import './crop.sol';
import './cropW_D.sol';
import './cropD_C.sol';

contract Transporter {
    
    function handlePackage(
        address _addr,
        uint transportertype,
        address cid
        ) public {

        if(transportertype == 1) { 
            /// Supplier -> Manufacturer
            RawMaterial(_addr).pickPackage(msg.sender);
        } else if(transportertype == 2) { 
            /// Manufacturer -> Wholesaler
            crop(_addr).pickcrop(msg.sender);
        } else if(transportertype == 3) {   
            // Wholesaler to Distributer
            cropW_D(cid).pickWD(_addr, msg.sender);
        } else if(transportertype == 4) {   
            // Distrubuter to Customer
            cropD_C(cid).pickDC(_addr, msg.sender);
        }
    }
    
    
}