pragma solidity ^0.8.17;

import './RawMaterial.sol';
import './crop.sol';

contract Manufacturer {
    
    mapping (address => address[]) public manufacturerRawMaterials;
    mapping (address => address[]) public manufacturercrops;

    constructor() public {}
    
    function manufacturerReceivedPackage(
        address _addr,
        address _manufacturerAddress
        ) public {
            
        RawMaterial(_addr).receivedPackage(_manufacturerAddress);
        manufacturerRawMaterials[_manufacturerAddress].push(_addr);
    }
    
    
    function manufacturerCreatescrop(
        address _manufacturerAddr,
        bytes32 _description,
        address[] memory _rawAddr,
        uint _quantity,
        address[] memory _transporterAddr,
        address _recieverAddr,
        uint RcvrType
        ) public {
            
        crop _crop = new crop(
            _manufacturerAddr,
            _description,
            _rawAddr,
            _quantity,
            _transporterAddr,
            _recieverAddr,
            RcvrType
        );
        
        manufacturercrops[_manufacturerAddr].push(address(_crop));
        
    }
    
}